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
      ?auto_375579 - SURFACE
      ?auto_375580 - SURFACE
    )
    :vars
    (
      ?auto_375581 - HOIST
      ?auto_375582 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375581 ?auto_375582 ) ( SURFACE-AT ?auto_375579 ?auto_375582 ) ( CLEAR ?auto_375579 ) ( LIFTING ?auto_375581 ?auto_375580 ) ( IS-CRATE ?auto_375580 ) ( not ( = ?auto_375579 ?auto_375580 ) ) )
    :subtasks
    ( ( !DROP ?auto_375581 ?auto_375580 ?auto_375579 ?auto_375582 )
      ( MAKE-1CRATE-VERIFY ?auto_375579 ?auto_375580 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375583 - SURFACE
      ?auto_375584 - SURFACE
    )
    :vars
    (
      ?auto_375585 - HOIST
      ?auto_375586 - PLACE
      ?auto_375587 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375585 ?auto_375586 ) ( SURFACE-AT ?auto_375583 ?auto_375586 ) ( CLEAR ?auto_375583 ) ( IS-CRATE ?auto_375584 ) ( not ( = ?auto_375583 ?auto_375584 ) ) ( TRUCK-AT ?auto_375587 ?auto_375586 ) ( AVAILABLE ?auto_375585 ) ( IN ?auto_375584 ?auto_375587 ) )
    :subtasks
    ( ( !UNLOAD ?auto_375585 ?auto_375584 ?auto_375587 ?auto_375586 )
      ( MAKE-1CRATE ?auto_375583 ?auto_375584 )
      ( MAKE-1CRATE-VERIFY ?auto_375583 ?auto_375584 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375588 - SURFACE
      ?auto_375589 - SURFACE
    )
    :vars
    (
      ?auto_375592 - HOIST
      ?auto_375591 - PLACE
      ?auto_375590 - TRUCK
      ?auto_375593 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375592 ?auto_375591 ) ( SURFACE-AT ?auto_375588 ?auto_375591 ) ( CLEAR ?auto_375588 ) ( IS-CRATE ?auto_375589 ) ( not ( = ?auto_375588 ?auto_375589 ) ) ( AVAILABLE ?auto_375592 ) ( IN ?auto_375589 ?auto_375590 ) ( TRUCK-AT ?auto_375590 ?auto_375593 ) ( not ( = ?auto_375593 ?auto_375591 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_375590 ?auto_375593 ?auto_375591 )
      ( MAKE-1CRATE ?auto_375588 ?auto_375589 )
      ( MAKE-1CRATE-VERIFY ?auto_375588 ?auto_375589 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375594 - SURFACE
      ?auto_375595 - SURFACE
    )
    :vars
    (
      ?auto_375597 - HOIST
      ?auto_375599 - PLACE
      ?auto_375598 - TRUCK
      ?auto_375596 - PLACE
      ?auto_375600 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_375597 ?auto_375599 ) ( SURFACE-AT ?auto_375594 ?auto_375599 ) ( CLEAR ?auto_375594 ) ( IS-CRATE ?auto_375595 ) ( not ( = ?auto_375594 ?auto_375595 ) ) ( AVAILABLE ?auto_375597 ) ( TRUCK-AT ?auto_375598 ?auto_375596 ) ( not ( = ?auto_375596 ?auto_375599 ) ) ( HOIST-AT ?auto_375600 ?auto_375596 ) ( LIFTING ?auto_375600 ?auto_375595 ) ( not ( = ?auto_375597 ?auto_375600 ) ) )
    :subtasks
    ( ( !LOAD ?auto_375600 ?auto_375595 ?auto_375598 ?auto_375596 )
      ( MAKE-1CRATE ?auto_375594 ?auto_375595 )
      ( MAKE-1CRATE-VERIFY ?auto_375594 ?auto_375595 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375601 - SURFACE
      ?auto_375602 - SURFACE
    )
    :vars
    (
      ?auto_375604 - HOIST
      ?auto_375606 - PLACE
      ?auto_375607 - TRUCK
      ?auto_375605 - PLACE
      ?auto_375603 - HOIST
      ?auto_375608 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375604 ?auto_375606 ) ( SURFACE-AT ?auto_375601 ?auto_375606 ) ( CLEAR ?auto_375601 ) ( IS-CRATE ?auto_375602 ) ( not ( = ?auto_375601 ?auto_375602 ) ) ( AVAILABLE ?auto_375604 ) ( TRUCK-AT ?auto_375607 ?auto_375605 ) ( not ( = ?auto_375605 ?auto_375606 ) ) ( HOIST-AT ?auto_375603 ?auto_375605 ) ( not ( = ?auto_375604 ?auto_375603 ) ) ( AVAILABLE ?auto_375603 ) ( SURFACE-AT ?auto_375602 ?auto_375605 ) ( ON ?auto_375602 ?auto_375608 ) ( CLEAR ?auto_375602 ) ( not ( = ?auto_375601 ?auto_375608 ) ) ( not ( = ?auto_375602 ?auto_375608 ) ) )
    :subtasks
    ( ( !LIFT ?auto_375603 ?auto_375602 ?auto_375608 ?auto_375605 )
      ( MAKE-1CRATE ?auto_375601 ?auto_375602 )
      ( MAKE-1CRATE-VERIFY ?auto_375601 ?auto_375602 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375609 - SURFACE
      ?auto_375610 - SURFACE
    )
    :vars
    (
      ?auto_375614 - HOIST
      ?auto_375613 - PLACE
      ?auto_375611 - PLACE
      ?auto_375612 - HOIST
      ?auto_375616 - SURFACE
      ?auto_375615 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375614 ?auto_375613 ) ( SURFACE-AT ?auto_375609 ?auto_375613 ) ( CLEAR ?auto_375609 ) ( IS-CRATE ?auto_375610 ) ( not ( = ?auto_375609 ?auto_375610 ) ) ( AVAILABLE ?auto_375614 ) ( not ( = ?auto_375611 ?auto_375613 ) ) ( HOIST-AT ?auto_375612 ?auto_375611 ) ( not ( = ?auto_375614 ?auto_375612 ) ) ( AVAILABLE ?auto_375612 ) ( SURFACE-AT ?auto_375610 ?auto_375611 ) ( ON ?auto_375610 ?auto_375616 ) ( CLEAR ?auto_375610 ) ( not ( = ?auto_375609 ?auto_375616 ) ) ( not ( = ?auto_375610 ?auto_375616 ) ) ( TRUCK-AT ?auto_375615 ?auto_375613 ) )
    :subtasks
    ( ( !DRIVE ?auto_375615 ?auto_375613 ?auto_375611 )
      ( MAKE-1CRATE ?auto_375609 ?auto_375610 )
      ( MAKE-1CRATE-VERIFY ?auto_375609 ?auto_375610 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_375626 - SURFACE
      ?auto_375627 - SURFACE
      ?auto_375628 - SURFACE
    )
    :vars
    (
      ?auto_375630 - HOIST
      ?auto_375629 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375630 ?auto_375629 ) ( SURFACE-AT ?auto_375627 ?auto_375629 ) ( CLEAR ?auto_375627 ) ( LIFTING ?auto_375630 ?auto_375628 ) ( IS-CRATE ?auto_375628 ) ( not ( = ?auto_375627 ?auto_375628 ) ) ( ON ?auto_375627 ?auto_375626 ) ( not ( = ?auto_375626 ?auto_375627 ) ) ( not ( = ?auto_375626 ?auto_375628 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375627 ?auto_375628 )
      ( MAKE-2CRATE-VERIFY ?auto_375626 ?auto_375627 ?auto_375628 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_375636 - SURFACE
      ?auto_375637 - SURFACE
      ?auto_375638 - SURFACE
    )
    :vars
    (
      ?auto_375641 - HOIST
      ?auto_375639 - PLACE
      ?auto_375640 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375641 ?auto_375639 ) ( SURFACE-AT ?auto_375637 ?auto_375639 ) ( CLEAR ?auto_375637 ) ( IS-CRATE ?auto_375638 ) ( not ( = ?auto_375637 ?auto_375638 ) ) ( TRUCK-AT ?auto_375640 ?auto_375639 ) ( AVAILABLE ?auto_375641 ) ( IN ?auto_375638 ?auto_375640 ) ( ON ?auto_375637 ?auto_375636 ) ( not ( = ?auto_375636 ?auto_375637 ) ) ( not ( = ?auto_375636 ?auto_375638 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375637 ?auto_375638 )
      ( MAKE-2CRATE-VERIFY ?auto_375636 ?auto_375637 ?auto_375638 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375642 - SURFACE
      ?auto_375643 - SURFACE
    )
    :vars
    (
      ?auto_375647 - HOIST
      ?auto_375646 - PLACE
      ?auto_375644 - TRUCK
      ?auto_375645 - SURFACE
      ?auto_375648 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375647 ?auto_375646 ) ( SURFACE-AT ?auto_375642 ?auto_375646 ) ( CLEAR ?auto_375642 ) ( IS-CRATE ?auto_375643 ) ( not ( = ?auto_375642 ?auto_375643 ) ) ( AVAILABLE ?auto_375647 ) ( IN ?auto_375643 ?auto_375644 ) ( ON ?auto_375642 ?auto_375645 ) ( not ( = ?auto_375645 ?auto_375642 ) ) ( not ( = ?auto_375645 ?auto_375643 ) ) ( TRUCK-AT ?auto_375644 ?auto_375648 ) ( not ( = ?auto_375648 ?auto_375646 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_375644 ?auto_375648 ?auto_375646 )
      ( MAKE-2CRATE ?auto_375645 ?auto_375642 ?auto_375643 )
      ( MAKE-1CRATE-VERIFY ?auto_375642 ?auto_375643 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_375649 - SURFACE
      ?auto_375650 - SURFACE
      ?auto_375651 - SURFACE
    )
    :vars
    (
      ?auto_375653 - HOIST
      ?auto_375652 - PLACE
      ?auto_375654 - TRUCK
      ?auto_375655 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375653 ?auto_375652 ) ( SURFACE-AT ?auto_375650 ?auto_375652 ) ( CLEAR ?auto_375650 ) ( IS-CRATE ?auto_375651 ) ( not ( = ?auto_375650 ?auto_375651 ) ) ( AVAILABLE ?auto_375653 ) ( IN ?auto_375651 ?auto_375654 ) ( ON ?auto_375650 ?auto_375649 ) ( not ( = ?auto_375649 ?auto_375650 ) ) ( not ( = ?auto_375649 ?auto_375651 ) ) ( TRUCK-AT ?auto_375654 ?auto_375655 ) ( not ( = ?auto_375655 ?auto_375652 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375650 ?auto_375651 )
      ( MAKE-2CRATE-VERIFY ?auto_375649 ?auto_375650 ?auto_375651 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375656 - SURFACE
      ?auto_375657 - SURFACE
    )
    :vars
    (
      ?auto_375661 - HOIST
      ?auto_375660 - PLACE
      ?auto_375659 - SURFACE
      ?auto_375662 - TRUCK
      ?auto_375658 - PLACE
      ?auto_375663 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_375661 ?auto_375660 ) ( SURFACE-AT ?auto_375656 ?auto_375660 ) ( CLEAR ?auto_375656 ) ( IS-CRATE ?auto_375657 ) ( not ( = ?auto_375656 ?auto_375657 ) ) ( AVAILABLE ?auto_375661 ) ( ON ?auto_375656 ?auto_375659 ) ( not ( = ?auto_375659 ?auto_375656 ) ) ( not ( = ?auto_375659 ?auto_375657 ) ) ( TRUCK-AT ?auto_375662 ?auto_375658 ) ( not ( = ?auto_375658 ?auto_375660 ) ) ( HOIST-AT ?auto_375663 ?auto_375658 ) ( LIFTING ?auto_375663 ?auto_375657 ) ( not ( = ?auto_375661 ?auto_375663 ) ) )
    :subtasks
    ( ( !LOAD ?auto_375663 ?auto_375657 ?auto_375662 ?auto_375658 )
      ( MAKE-2CRATE ?auto_375659 ?auto_375656 ?auto_375657 )
      ( MAKE-1CRATE-VERIFY ?auto_375656 ?auto_375657 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_375664 - SURFACE
      ?auto_375665 - SURFACE
      ?auto_375666 - SURFACE
    )
    :vars
    (
      ?auto_375671 - HOIST
      ?auto_375669 - PLACE
      ?auto_375668 - TRUCK
      ?auto_375667 - PLACE
      ?auto_375670 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_375671 ?auto_375669 ) ( SURFACE-AT ?auto_375665 ?auto_375669 ) ( CLEAR ?auto_375665 ) ( IS-CRATE ?auto_375666 ) ( not ( = ?auto_375665 ?auto_375666 ) ) ( AVAILABLE ?auto_375671 ) ( ON ?auto_375665 ?auto_375664 ) ( not ( = ?auto_375664 ?auto_375665 ) ) ( not ( = ?auto_375664 ?auto_375666 ) ) ( TRUCK-AT ?auto_375668 ?auto_375667 ) ( not ( = ?auto_375667 ?auto_375669 ) ) ( HOIST-AT ?auto_375670 ?auto_375667 ) ( LIFTING ?auto_375670 ?auto_375666 ) ( not ( = ?auto_375671 ?auto_375670 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375665 ?auto_375666 )
      ( MAKE-2CRATE-VERIFY ?auto_375664 ?auto_375665 ?auto_375666 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375672 - SURFACE
      ?auto_375673 - SURFACE
    )
    :vars
    (
      ?auto_375678 - HOIST
      ?auto_375675 - PLACE
      ?auto_375676 - SURFACE
      ?auto_375674 - TRUCK
      ?auto_375679 - PLACE
      ?auto_375677 - HOIST
      ?auto_375680 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375678 ?auto_375675 ) ( SURFACE-AT ?auto_375672 ?auto_375675 ) ( CLEAR ?auto_375672 ) ( IS-CRATE ?auto_375673 ) ( not ( = ?auto_375672 ?auto_375673 ) ) ( AVAILABLE ?auto_375678 ) ( ON ?auto_375672 ?auto_375676 ) ( not ( = ?auto_375676 ?auto_375672 ) ) ( not ( = ?auto_375676 ?auto_375673 ) ) ( TRUCK-AT ?auto_375674 ?auto_375679 ) ( not ( = ?auto_375679 ?auto_375675 ) ) ( HOIST-AT ?auto_375677 ?auto_375679 ) ( not ( = ?auto_375678 ?auto_375677 ) ) ( AVAILABLE ?auto_375677 ) ( SURFACE-AT ?auto_375673 ?auto_375679 ) ( ON ?auto_375673 ?auto_375680 ) ( CLEAR ?auto_375673 ) ( not ( = ?auto_375672 ?auto_375680 ) ) ( not ( = ?auto_375673 ?auto_375680 ) ) ( not ( = ?auto_375676 ?auto_375680 ) ) )
    :subtasks
    ( ( !LIFT ?auto_375677 ?auto_375673 ?auto_375680 ?auto_375679 )
      ( MAKE-2CRATE ?auto_375676 ?auto_375672 ?auto_375673 )
      ( MAKE-1CRATE-VERIFY ?auto_375672 ?auto_375673 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_375681 - SURFACE
      ?auto_375682 - SURFACE
      ?auto_375683 - SURFACE
    )
    :vars
    (
      ?auto_375688 - HOIST
      ?auto_375689 - PLACE
      ?auto_375684 - TRUCK
      ?auto_375687 - PLACE
      ?auto_375685 - HOIST
      ?auto_375686 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375688 ?auto_375689 ) ( SURFACE-AT ?auto_375682 ?auto_375689 ) ( CLEAR ?auto_375682 ) ( IS-CRATE ?auto_375683 ) ( not ( = ?auto_375682 ?auto_375683 ) ) ( AVAILABLE ?auto_375688 ) ( ON ?auto_375682 ?auto_375681 ) ( not ( = ?auto_375681 ?auto_375682 ) ) ( not ( = ?auto_375681 ?auto_375683 ) ) ( TRUCK-AT ?auto_375684 ?auto_375687 ) ( not ( = ?auto_375687 ?auto_375689 ) ) ( HOIST-AT ?auto_375685 ?auto_375687 ) ( not ( = ?auto_375688 ?auto_375685 ) ) ( AVAILABLE ?auto_375685 ) ( SURFACE-AT ?auto_375683 ?auto_375687 ) ( ON ?auto_375683 ?auto_375686 ) ( CLEAR ?auto_375683 ) ( not ( = ?auto_375682 ?auto_375686 ) ) ( not ( = ?auto_375683 ?auto_375686 ) ) ( not ( = ?auto_375681 ?auto_375686 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375682 ?auto_375683 )
      ( MAKE-2CRATE-VERIFY ?auto_375681 ?auto_375682 ?auto_375683 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375690 - SURFACE
      ?auto_375691 - SURFACE
    )
    :vars
    (
      ?auto_375693 - HOIST
      ?auto_375696 - PLACE
      ?auto_375694 - SURFACE
      ?auto_375692 - PLACE
      ?auto_375698 - HOIST
      ?auto_375697 - SURFACE
      ?auto_375695 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375693 ?auto_375696 ) ( SURFACE-AT ?auto_375690 ?auto_375696 ) ( CLEAR ?auto_375690 ) ( IS-CRATE ?auto_375691 ) ( not ( = ?auto_375690 ?auto_375691 ) ) ( AVAILABLE ?auto_375693 ) ( ON ?auto_375690 ?auto_375694 ) ( not ( = ?auto_375694 ?auto_375690 ) ) ( not ( = ?auto_375694 ?auto_375691 ) ) ( not ( = ?auto_375692 ?auto_375696 ) ) ( HOIST-AT ?auto_375698 ?auto_375692 ) ( not ( = ?auto_375693 ?auto_375698 ) ) ( AVAILABLE ?auto_375698 ) ( SURFACE-AT ?auto_375691 ?auto_375692 ) ( ON ?auto_375691 ?auto_375697 ) ( CLEAR ?auto_375691 ) ( not ( = ?auto_375690 ?auto_375697 ) ) ( not ( = ?auto_375691 ?auto_375697 ) ) ( not ( = ?auto_375694 ?auto_375697 ) ) ( TRUCK-AT ?auto_375695 ?auto_375696 ) )
    :subtasks
    ( ( !DRIVE ?auto_375695 ?auto_375696 ?auto_375692 )
      ( MAKE-2CRATE ?auto_375694 ?auto_375690 ?auto_375691 )
      ( MAKE-1CRATE-VERIFY ?auto_375690 ?auto_375691 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_375699 - SURFACE
      ?auto_375700 - SURFACE
      ?auto_375701 - SURFACE
    )
    :vars
    (
      ?auto_375707 - HOIST
      ?auto_375703 - PLACE
      ?auto_375704 - PLACE
      ?auto_375706 - HOIST
      ?auto_375702 - SURFACE
      ?auto_375705 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375707 ?auto_375703 ) ( SURFACE-AT ?auto_375700 ?auto_375703 ) ( CLEAR ?auto_375700 ) ( IS-CRATE ?auto_375701 ) ( not ( = ?auto_375700 ?auto_375701 ) ) ( AVAILABLE ?auto_375707 ) ( ON ?auto_375700 ?auto_375699 ) ( not ( = ?auto_375699 ?auto_375700 ) ) ( not ( = ?auto_375699 ?auto_375701 ) ) ( not ( = ?auto_375704 ?auto_375703 ) ) ( HOIST-AT ?auto_375706 ?auto_375704 ) ( not ( = ?auto_375707 ?auto_375706 ) ) ( AVAILABLE ?auto_375706 ) ( SURFACE-AT ?auto_375701 ?auto_375704 ) ( ON ?auto_375701 ?auto_375702 ) ( CLEAR ?auto_375701 ) ( not ( = ?auto_375700 ?auto_375702 ) ) ( not ( = ?auto_375701 ?auto_375702 ) ) ( not ( = ?auto_375699 ?auto_375702 ) ) ( TRUCK-AT ?auto_375705 ?auto_375703 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375700 ?auto_375701 )
      ( MAKE-2CRATE-VERIFY ?auto_375699 ?auto_375700 ?auto_375701 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375708 - SURFACE
      ?auto_375709 - SURFACE
    )
    :vars
    (
      ?auto_375712 - HOIST
      ?auto_375710 - PLACE
      ?auto_375715 - SURFACE
      ?auto_375714 - PLACE
      ?auto_375716 - HOIST
      ?auto_375711 - SURFACE
      ?auto_375713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375712 ?auto_375710 ) ( IS-CRATE ?auto_375709 ) ( not ( = ?auto_375708 ?auto_375709 ) ) ( not ( = ?auto_375715 ?auto_375708 ) ) ( not ( = ?auto_375715 ?auto_375709 ) ) ( not ( = ?auto_375714 ?auto_375710 ) ) ( HOIST-AT ?auto_375716 ?auto_375714 ) ( not ( = ?auto_375712 ?auto_375716 ) ) ( AVAILABLE ?auto_375716 ) ( SURFACE-AT ?auto_375709 ?auto_375714 ) ( ON ?auto_375709 ?auto_375711 ) ( CLEAR ?auto_375709 ) ( not ( = ?auto_375708 ?auto_375711 ) ) ( not ( = ?auto_375709 ?auto_375711 ) ) ( not ( = ?auto_375715 ?auto_375711 ) ) ( TRUCK-AT ?auto_375713 ?auto_375710 ) ( SURFACE-AT ?auto_375715 ?auto_375710 ) ( CLEAR ?auto_375715 ) ( LIFTING ?auto_375712 ?auto_375708 ) ( IS-CRATE ?auto_375708 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375715 ?auto_375708 )
      ( MAKE-2CRATE ?auto_375715 ?auto_375708 ?auto_375709 )
      ( MAKE-1CRATE-VERIFY ?auto_375708 ?auto_375709 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_375717 - SURFACE
      ?auto_375718 - SURFACE
      ?auto_375719 - SURFACE
    )
    :vars
    (
      ?auto_375720 - HOIST
      ?auto_375725 - PLACE
      ?auto_375721 - PLACE
      ?auto_375722 - HOIST
      ?auto_375724 - SURFACE
      ?auto_375723 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375720 ?auto_375725 ) ( IS-CRATE ?auto_375719 ) ( not ( = ?auto_375718 ?auto_375719 ) ) ( not ( = ?auto_375717 ?auto_375718 ) ) ( not ( = ?auto_375717 ?auto_375719 ) ) ( not ( = ?auto_375721 ?auto_375725 ) ) ( HOIST-AT ?auto_375722 ?auto_375721 ) ( not ( = ?auto_375720 ?auto_375722 ) ) ( AVAILABLE ?auto_375722 ) ( SURFACE-AT ?auto_375719 ?auto_375721 ) ( ON ?auto_375719 ?auto_375724 ) ( CLEAR ?auto_375719 ) ( not ( = ?auto_375718 ?auto_375724 ) ) ( not ( = ?auto_375719 ?auto_375724 ) ) ( not ( = ?auto_375717 ?auto_375724 ) ) ( TRUCK-AT ?auto_375723 ?auto_375725 ) ( SURFACE-AT ?auto_375717 ?auto_375725 ) ( CLEAR ?auto_375717 ) ( LIFTING ?auto_375720 ?auto_375718 ) ( IS-CRATE ?auto_375718 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375718 ?auto_375719 )
      ( MAKE-2CRATE-VERIFY ?auto_375717 ?auto_375718 ?auto_375719 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375726 - SURFACE
      ?auto_375727 - SURFACE
    )
    :vars
    (
      ?auto_375729 - HOIST
      ?auto_375731 - PLACE
      ?auto_375732 - SURFACE
      ?auto_375728 - PLACE
      ?auto_375733 - HOIST
      ?auto_375730 - SURFACE
      ?auto_375734 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375729 ?auto_375731 ) ( IS-CRATE ?auto_375727 ) ( not ( = ?auto_375726 ?auto_375727 ) ) ( not ( = ?auto_375732 ?auto_375726 ) ) ( not ( = ?auto_375732 ?auto_375727 ) ) ( not ( = ?auto_375728 ?auto_375731 ) ) ( HOIST-AT ?auto_375733 ?auto_375728 ) ( not ( = ?auto_375729 ?auto_375733 ) ) ( AVAILABLE ?auto_375733 ) ( SURFACE-AT ?auto_375727 ?auto_375728 ) ( ON ?auto_375727 ?auto_375730 ) ( CLEAR ?auto_375727 ) ( not ( = ?auto_375726 ?auto_375730 ) ) ( not ( = ?auto_375727 ?auto_375730 ) ) ( not ( = ?auto_375732 ?auto_375730 ) ) ( TRUCK-AT ?auto_375734 ?auto_375731 ) ( SURFACE-AT ?auto_375732 ?auto_375731 ) ( CLEAR ?auto_375732 ) ( IS-CRATE ?auto_375726 ) ( AVAILABLE ?auto_375729 ) ( IN ?auto_375726 ?auto_375734 ) )
    :subtasks
    ( ( !UNLOAD ?auto_375729 ?auto_375726 ?auto_375734 ?auto_375731 )
      ( MAKE-2CRATE ?auto_375732 ?auto_375726 ?auto_375727 )
      ( MAKE-1CRATE-VERIFY ?auto_375726 ?auto_375727 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_375735 - SURFACE
      ?auto_375736 - SURFACE
      ?auto_375737 - SURFACE
    )
    :vars
    (
      ?auto_375742 - HOIST
      ?auto_375740 - PLACE
      ?auto_375738 - PLACE
      ?auto_375743 - HOIST
      ?auto_375739 - SURFACE
      ?auto_375741 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375742 ?auto_375740 ) ( IS-CRATE ?auto_375737 ) ( not ( = ?auto_375736 ?auto_375737 ) ) ( not ( = ?auto_375735 ?auto_375736 ) ) ( not ( = ?auto_375735 ?auto_375737 ) ) ( not ( = ?auto_375738 ?auto_375740 ) ) ( HOIST-AT ?auto_375743 ?auto_375738 ) ( not ( = ?auto_375742 ?auto_375743 ) ) ( AVAILABLE ?auto_375743 ) ( SURFACE-AT ?auto_375737 ?auto_375738 ) ( ON ?auto_375737 ?auto_375739 ) ( CLEAR ?auto_375737 ) ( not ( = ?auto_375736 ?auto_375739 ) ) ( not ( = ?auto_375737 ?auto_375739 ) ) ( not ( = ?auto_375735 ?auto_375739 ) ) ( TRUCK-AT ?auto_375741 ?auto_375740 ) ( SURFACE-AT ?auto_375735 ?auto_375740 ) ( CLEAR ?auto_375735 ) ( IS-CRATE ?auto_375736 ) ( AVAILABLE ?auto_375742 ) ( IN ?auto_375736 ?auto_375741 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375736 ?auto_375737 )
      ( MAKE-2CRATE-VERIFY ?auto_375735 ?auto_375736 ?auto_375737 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375744 - SURFACE
      ?auto_375745 - SURFACE
    )
    :vars
    (
      ?auto_375748 - HOIST
      ?auto_375746 - PLACE
      ?auto_375747 - SURFACE
      ?auto_375749 - PLACE
      ?auto_375750 - HOIST
      ?auto_375752 - SURFACE
      ?auto_375751 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375748 ?auto_375746 ) ( IS-CRATE ?auto_375745 ) ( not ( = ?auto_375744 ?auto_375745 ) ) ( not ( = ?auto_375747 ?auto_375744 ) ) ( not ( = ?auto_375747 ?auto_375745 ) ) ( not ( = ?auto_375749 ?auto_375746 ) ) ( HOIST-AT ?auto_375750 ?auto_375749 ) ( not ( = ?auto_375748 ?auto_375750 ) ) ( AVAILABLE ?auto_375750 ) ( SURFACE-AT ?auto_375745 ?auto_375749 ) ( ON ?auto_375745 ?auto_375752 ) ( CLEAR ?auto_375745 ) ( not ( = ?auto_375744 ?auto_375752 ) ) ( not ( = ?auto_375745 ?auto_375752 ) ) ( not ( = ?auto_375747 ?auto_375752 ) ) ( SURFACE-AT ?auto_375747 ?auto_375746 ) ( CLEAR ?auto_375747 ) ( IS-CRATE ?auto_375744 ) ( AVAILABLE ?auto_375748 ) ( IN ?auto_375744 ?auto_375751 ) ( TRUCK-AT ?auto_375751 ?auto_375749 ) )
    :subtasks
    ( ( !DRIVE ?auto_375751 ?auto_375749 ?auto_375746 )
      ( MAKE-2CRATE ?auto_375747 ?auto_375744 ?auto_375745 )
      ( MAKE-1CRATE-VERIFY ?auto_375744 ?auto_375745 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_375753 - SURFACE
      ?auto_375754 - SURFACE
      ?auto_375755 - SURFACE
    )
    :vars
    (
      ?auto_375758 - HOIST
      ?auto_375760 - PLACE
      ?auto_375756 - PLACE
      ?auto_375759 - HOIST
      ?auto_375761 - SURFACE
      ?auto_375757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375758 ?auto_375760 ) ( IS-CRATE ?auto_375755 ) ( not ( = ?auto_375754 ?auto_375755 ) ) ( not ( = ?auto_375753 ?auto_375754 ) ) ( not ( = ?auto_375753 ?auto_375755 ) ) ( not ( = ?auto_375756 ?auto_375760 ) ) ( HOIST-AT ?auto_375759 ?auto_375756 ) ( not ( = ?auto_375758 ?auto_375759 ) ) ( AVAILABLE ?auto_375759 ) ( SURFACE-AT ?auto_375755 ?auto_375756 ) ( ON ?auto_375755 ?auto_375761 ) ( CLEAR ?auto_375755 ) ( not ( = ?auto_375754 ?auto_375761 ) ) ( not ( = ?auto_375755 ?auto_375761 ) ) ( not ( = ?auto_375753 ?auto_375761 ) ) ( SURFACE-AT ?auto_375753 ?auto_375760 ) ( CLEAR ?auto_375753 ) ( IS-CRATE ?auto_375754 ) ( AVAILABLE ?auto_375758 ) ( IN ?auto_375754 ?auto_375757 ) ( TRUCK-AT ?auto_375757 ?auto_375756 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375754 ?auto_375755 )
      ( MAKE-2CRATE-VERIFY ?auto_375753 ?auto_375754 ?auto_375755 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375762 - SURFACE
      ?auto_375763 - SURFACE
    )
    :vars
    (
      ?auto_375769 - HOIST
      ?auto_375770 - PLACE
      ?auto_375768 - SURFACE
      ?auto_375766 - PLACE
      ?auto_375764 - HOIST
      ?auto_375765 - SURFACE
      ?auto_375767 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375769 ?auto_375770 ) ( IS-CRATE ?auto_375763 ) ( not ( = ?auto_375762 ?auto_375763 ) ) ( not ( = ?auto_375768 ?auto_375762 ) ) ( not ( = ?auto_375768 ?auto_375763 ) ) ( not ( = ?auto_375766 ?auto_375770 ) ) ( HOIST-AT ?auto_375764 ?auto_375766 ) ( not ( = ?auto_375769 ?auto_375764 ) ) ( SURFACE-AT ?auto_375763 ?auto_375766 ) ( ON ?auto_375763 ?auto_375765 ) ( CLEAR ?auto_375763 ) ( not ( = ?auto_375762 ?auto_375765 ) ) ( not ( = ?auto_375763 ?auto_375765 ) ) ( not ( = ?auto_375768 ?auto_375765 ) ) ( SURFACE-AT ?auto_375768 ?auto_375770 ) ( CLEAR ?auto_375768 ) ( IS-CRATE ?auto_375762 ) ( AVAILABLE ?auto_375769 ) ( TRUCK-AT ?auto_375767 ?auto_375766 ) ( LIFTING ?auto_375764 ?auto_375762 ) )
    :subtasks
    ( ( !LOAD ?auto_375764 ?auto_375762 ?auto_375767 ?auto_375766 )
      ( MAKE-2CRATE ?auto_375768 ?auto_375762 ?auto_375763 )
      ( MAKE-1CRATE-VERIFY ?auto_375762 ?auto_375763 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_375771 - SURFACE
      ?auto_375772 - SURFACE
      ?auto_375773 - SURFACE
    )
    :vars
    (
      ?auto_375779 - HOIST
      ?auto_375778 - PLACE
      ?auto_375777 - PLACE
      ?auto_375774 - HOIST
      ?auto_375775 - SURFACE
      ?auto_375776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375779 ?auto_375778 ) ( IS-CRATE ?auto_375773 ) ( not ( = ?auto_375772 ?auto_375773 ) ) ( not ( = ?auto_375771 ?auto_375772 ) ) ( not ( = ?auto_375771 ?auto_375773 ) ) ( not ( = ?auto_375777 ?auto_375778 ) ) ( HOIST-AT ?auto_375774 ?auto_375777 ) ( not ( = ?auto_375779 ?auto_375774 ) ) ( SURFACE-AT ?auto_375773 ?auto_375777 ) ( ON ?auto_375773 ?auto_375775 ) ( CLEAR ?auto_375773 ) ( not ( = ?auto_375772 ?auto_375775 ) ) ( not ( = ?auto_375773 ?auto_375775 ) ) ( not ( = ?auto_375771 ?auto_375775 ) ) ( SURFACE-AT ?auto_375771 ?auto_375778 ) ( CLEAR ?auto_375771 ) ( IS-CRATE ?auto_375772 ) ( AVAILABLE ?auto_375779 ) ( TRUCK-AT ?auto_375776 ?auto_375777 ) ( LIFTING ?auto_375774 ?auto_375772 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375772 ?auto_375773 )
      ( MAKE-2CRATE-VERIFY ?auto_375771 ?auto_375772 ?auto_375773 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375780 - SURFACE
      ?auto_375781 - SURFACE
    )
    :vars
    (
      ?auto_375784 - HOIST
      ?auto_375786 - PLACE
      ?auto_375788 - SURFACE
      ?auto_375785 - PLACE
      ?auto_375783 - HOIST
      ?auto_375787 - SURFACE
      ?auto_375782 - TRUCK
      ?auto_375789 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375784 ?auto_375786 ) ( IS-CRATE ?auto_375781 ) ( not ( = ?auto_375780 ?auto_375781 ) ) ( not ( = ?auto_375788 ?auto_375780 ) ) ( not ( = ?auto_375788 ?auto_375781 ) ) ( not ( = ?auto_375785 ?auto_375786 ) ) ( HOIST-AT ?auto_375783 ?auto_375785 ) ( not ( = ?auto_375784 ?auto_375783 ) ) ( SURFACE-AT ?auto_375781 ?auto_375785 ) ( ON ?auto_375781 ?auto_375787 ) ( CLEAR ?auto_375781 ) ( not ( = ?auto_375780 ?auto_375787 ) ) ( not ( = ?auto_375781 ?auto_375787 ) ) ( not ( = ?auto_375788 ?auto_375787 ) ) ( SURFACE-AT ?auto_375788 ?auto_375786 ) ( CLEAR ?auto_375788 ) ( IS-CRATE ?auto_375780 ) ( AVAILABLE ?auto_375784 ) ( TRUCK-AT ?auto_375782 ?auto_375785 ) ( AVAILABLE ?auto_375783 ) ( SURFACE-AT ?auto_375780 ?auto_375785 ) ( ON ?auto_375780 ?auto_375789 ) ( CLEAR ?auto_375780 ) ( not ( = ?auto_375780 ?auto_375789 ) ) ( not ( = ?auto_375781 ?auto_375789 ) ) ( not ( = ?auto_375788 ?auto_375789 ) ) ( not ( = ?auto_375787 ?auto_375789 ) ) )
    :subtasks
    ( ( !LIFT ?auto_375783 ?auto_375780 ?auto_375789 ?auto_375785 )
      ( MAKE-2CRATE ?auto_375788 ?auto_375780 ?auto_375781 )
      ( MAKE-1CRATE-VERIFY ?auto_375780 ?auto_375781 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_375790 - SURFACE
      ?auto_375791 - SURFACE
      ?auto_375792 - SURFACE
    )
    :vars
    (
      ?auto_375795 - HOIST
      ?auto_375798 - PLACE
      ?auto_375797 - PLACE
      ?auto_375794 - HOIST
      ?auto_375799 - SURFACE
      ?auto_375796 - TRUCK
      ?auto_375793 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375795 ?auto_375798 ) ( IS-CRATE ?auto_375792 ) ( not ( = ?auto_375791 ?auto_375792 ) ) ( not ( = ?auto_375790 ?auto_375791 ) ) ( not ( = ?auto_375790 ?auto_375792 ) ) ( not ( = ?auto_375797 ?auto_375798 ) ) ( HOIST-AT ?auto_375794 ?auto_375797 ) ( not ( = ?auto_375795 ?auto_375794 ) ) ( SURFACE-AT ?auto_375792 ?auto_375797 ) ( ON ?auto_375792 ?auto_375799 ) ( CLEAR ?auto_375792 ) ( not ( = ?auto_375791 ?auto_375799 ) ) ( not ( = ?auto_375792 ?auto_375799 ) ) ( not ( = ?auto_375790 ?auto_375799 ) ) ( SURFACE-AT ?auto_375790 ?auto_375798 ) ( CLEAR ?auto_375790 ) ( IS-CRATE ?auto_375791 ) ( AVAILABLE ?auto_375795 ) ( TRUCK-AT ?auto_375796 ?auto_375797 ) ( AVAILABLE ?auto_375794 ) ( SURFACE-AT ?auto_375791 ?auto_375797 ) ( ON ?auto_375791 ?auto_375793 ) ( CLEAR ?auto_375791 ) ( not ( = ?auto_375791 ?auto_375793 ) ) ( not ( = ?auto_375792 ?auto_375793 ) ) ( not ( = ?auto_375790 ?auto_375793 ) ) ( not ( = ?auto_375799 ?auto_375793 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375791 ?auto_375792 )
      ( MAKE-2CRATE-VERIFY ?auto_375790 ?auto_375791 ?auto_375792 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375800 - SURFACE
      ?auto_375801 - SURFACE
    )
    :vars
    (
      ?auto_375802 - HOIST
      ?auto_375804 - PLACE
      ?auto_375808 - SURFACE
      ?auto_375805 - PLACE
      ?auto_375809 - HOIST
      ?auto_375803 - SURFACE
      ?auto_375807 - SURFACE
      ?auto_375806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375802 ?auto_375804 ) ( IS-CRATE ?auto_375801 ) ( not ( = ?auto_375800 ?auto_375801 ) ) ( not ( = ?auto_375808 ?auto_375800 ) ) ( not ( = ?auto_375808 ?auto_375801 ) ) ( not ( = ?auto_375805 ?auto_375804 ) ) ( HOIST-AT ?auto_375809 ?auto_375805 ) ( not ( = ?auto_375802 ?auto_375809 ) ) ( SURFACE-AT ?auto_375801 ?auto_375805 ) ( ON ?auto_375801 ?auto_375803 ) ( CLEAR ?auto_375801 ) ( not ( = ?auto_375800 ?auto_375803 ) ) ( not ( = ?auto_375801 ?auto_375803 ) ) ( not ( = ?auto_375808 ?auto_375803 ) ) ( SURFACE-AT ?auto_375808 ?auto_375804 ) ( CLEAR ?auto_375808 ) ( IS-CRATE ?auto_375800 ) ( AVAILABLE ?auto_375802 ) ( AVAILABLE ?auto_375809 ) ( SURFACE-AT ?auto_375800 ?auto_375805 ) ( ON ?auto_375800 ?auto_375807 ) ( CLEAR ?auto_375800 ) ( not ( = ?auto_375800 ?auto_375807 ) ) ( not ( = ?auto_375801 ?auto_375807 ) ) ( not ( = ?auto_375808 ?auto_375807 ) ) ( not ( = ?auto_375803 ?auto_375807 ) ) ( TRUCK-AT ?auto_375806 ?auto_375804 ) )
    :subtasks
    ( ( !DRIVE ?auto_375806 ?auto_375804 ?auto_375805 )
      ( MAKE-2CRATE ?auto_375808 ?auto_375800 ?auto_375801 )
      ( MAKE-1CRATE-VERIFY ?auto_375800 ?auto_375801 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_375810 - SURFACE
      ?auto_375811 - SURFACE
      ?auto_375812 - SURFACE
    )
    :vars
    (
      ?auto_375816 - HOIST
      ?auto_375813 - PLACE
      ?auto_375814 - PLACE
      ?auto_375819 - HOIST
      ?auto_375818 - SURFACE
      ?auto_375815 - SURFACE
      ?auto_375817 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375816 ?auto_375813 ) ( IS-CRATE ?auto_375812 ) ( not ( = ?auto_375811 ?auto_375812 ) ) ( not ( = ?auto_375810 ?auto_375811 ) ) ( not ( = ?auto_375810 ?auto_375812 ) ) ( not ( = ?auto_375814 ?auto_375813 ) ) ( HOIST-AT ?auto_375819 ?auto_375814 ) ( not ( = ?auto_375816 ?auto_375819 ) ) ( SURFACE-AT ?auto_375812 ?auto_375814 ) ( ON ?auto_375812 ?auto_375818 ) ( CLEAR ?auto_375812 ) ( not ( = ?auto_375811 ?auto_375818 ) ) ( not ( = ?auto_375812 ?auto_375818 ) ) ( not ( = ?auto_375810 ?auto_375818 ) ) ( SURFACE-AT ?auto_375810 ?auto_375813 ) ( CLEAR ?auto_375810 ) ( IS-CRATE ?auto_375811 ) ( AVAILABLE ?auto_375816 ) ( AVAILABLE ?auto_375819 ) ( SURFACE-AT ?auto_375811 ?auto_375814 ) ( ON ?auto_375811 ?auto_375815 ) ( CLEAR ?auto_375811 ) ( not ( = ?auto_375811 ?auto_375815 ) ) ( not ( = ?auto_375812 ?auto_375815 ) ) ( not ( = ?auto_375810 ?auto_375815 ) ) ( not ( = ?auto_375818 ?auto_375815 ) ) ( TRUCK-AT ?auto_375817 ?auto_375813 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375811 ?auto_375812 )
      ( MAKE-2CRATE-VERIFY ?auto_375810 ?auto_375811 ?auto_375812 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_375838 - SURFACE
      ?auto_375839 - SURFACE
      ?auto_375840 - SURFACE
      ?auto_375841 - SURFACE
    )
    :vars
    (
      ?auto_375842 - HOIST
      ?auto_375843 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375842 ?auto_375843 ) ( SURFACE-AT ?auto_375840 ?auto_375843 ) ( CLEAR ?auto_375840 ) ( LIFTING ?auto_375842 ?auto_375841 ) ( IS-CRATE ?auto_375841 ) ( not ( = ?auto_375840 ?auto_375841 ) ) ( ON ?auto_375839 ?auto_375838 ) ( ON ?auto_375840 ?auto_375839 ) ( not ( = ?auto_375838 ?auto_375839 ) ) ( not ( = ?auto_375838 ?auto_375840 ) ) ( not ( = ?auto_375838 ?auto_375841 ) ) ( not ( = ?auto_375839 ?auto_375840 ) ) ( not ( = ?auto_375839 ?auto_375841 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375840 ?auto_375841 )
      ( MAKE-3CRATE-VERIFY ?auto_375838 ?auto_375839 ?auto_375840 ?auto_375841 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_375855 - SURFACE
      ?auto_375856 - SURFACE
      ?auto_375857 - SURFACE
      ?auto_375858 - SURFACE
    )
    :vars
    (
      ?auto_375859 - HOIST
      ?auto_375860 - PLACE
      ?auto_375861 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375859 ?auto_375860 ) ( SURFACE-AT ?auto_375857 ?auto_375860 ) ( CLEAR ?auto_375857 ) ( IS-CRATE ?auto_375858 ) ( not ( = ?auto_375857 ?auto_375858 ) ) ( TRUCK-AT ?auto_375861 ?auto_375860 ) ( AVAILABLE ?auto_375859 ) ( IN ?auto_375858 ?auto_375861 ) ( ON ?auto_375857 ?auto_375856 ) ( not ( = ?auto_375856 ?auto_375857 ) ) ( not ( = ?auto_375856 ?auto_375858 ) ) ( ON ?auto_375856 ?auto_375855 ) ( not ( = ?auto_375855 ?auto_375856 ) ) ( not ( = ?auto_375855 ?auto_375857 ) ) ( not ( = ?auto_375855 ?auto_375858 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_375856 ?auto_375857 ?auto_375858 )
      ( MAKE-3CRATE-VERIFY ?auto_375855 ?auto_375856 ?auto_375857 ?auto_375858 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_375876 - SURFACE
      ?auto_375877 - SURFACE
      ?auto_375878 - SURFACE
      ?auto_375879 - SURFACE
    )
    :vars
    (
      ?auto_375883 - HOIST
      ?auto_375882 - PLACE
      ?auto_375880 - TRUCK
      ?auto_375881 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375883 ?auto_375882 ) ( SURFACE-AT ?auto_375878 ?auto_375882 ) ( CLEAR ?auto_375878 ) ( IS-CRATE ?auto_375879 ) ( not ( = ?auto_375878 ?auto_375879 ) ) ( AVAILABLE ?auto_375883 ) ( IN ?auto_375879 ?auto_375880 ) ( ON ?auto_375878 ?auto_375877 ) ( not ( = ?auto_375877 ?auto_375878 ) ) ( not ( = ?auto_375877 ?auto_375879 ) ) ( TRUCK-AT ?auto_375880 ?auto_375881 ) ( not ( = ?auto_375881 ?auto_375882 ) ) ( ON ?auto_375877 ?auto_375876 ) ( not ( = ?auto_375876 ?auto_375877 ) ) ( not ( = ?auto_375876 ?auto_375878 ) ) ( not ( = ?auto_375876 ?auto_375879 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_375877 ?auto_375878 ?auto_375879 )
      ( MAKE-3CRATE-VERIFY ?auto_375876 ?auto_375877 ?auto_375878 ?auto_375879 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_375900 - SURFACE
      ?auto_375901 - SURFACE
      ?auto_375902 - SURFACE
      ?auto_375903 - SURFACE
    )
    :vars
    (
      ?auto_375906 - HOIST
      ?auto_375905 - PLACE
      ?auto_375908 - TRUCK
      ?auto_375907 - PLACE
      ?auto_375904 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_375906 ?auto_375905 ) ( SURFACE-AT ?auto_375902 ?auto_375905 ) ( CLEAR ?auto_375902 ) ( IS-CRATE ?auto_375903 ) ( not ( = ?auto_375902 ?auto_375903 ) ) ( AVAILABLE ?auto_375906 ) ( ON ?auto_375902 ?auto_375901 ) ( not ( = ?auto_375901 ?auto_375902 ) ) ( not ( = ?auto_375901 ?auto_375903 ) ) ( TRUCK-AT ?auto_375908 ?auto_375907 ) ( not ( = ?auto_375907 ?auto_375905 ) ) ( HOIST-AT ?auto_375904 ?auto_375907 ) ( LIFTING ?auto_375904 ?auto_375903 ) ( not ( = ?auto_375906 ?auto_375904 ) ) ( ON ?auto_375901 ?auto_375900 ) ( not ( = ?auto_375900 ?auto_375901 ) ) ( not ( = ?auto_375900 ?auto_375902 ) ) ( not ( = ?auto_375900 ?auto_375903 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_375901 ?auto_375902 ?auto_375903 )
      ( MAKE-3CRATE-VERIFY ?auto_375900 ?auto_375901 ?auto_375902 ?auto_375903 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_375927 - SURFACE
      ?auto_375928 - SURFACE
      ?auto_375929 - SURFACE
      ?auto_375930 - SURFACE
    )
    :vars
    (
      ?auto_375931 - HOIST
      ?auto_375933 - PLACE
      ?auto_375935 - TRUCK
      ?auto_375936 - PLACE
      ?auto_375934 - HOIST
      ?auto_375932 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375931 ?auto_375933 ) ( SURFACE-AT ?auto_375929 ?auto_375933 ) ( CLEAR ?auto_375929 ) ( IS-CRATE ?auto_375930 ) ( not ( = ?auto_375929 ?auto_375930 ) ) ( AVAILABLE ?auto_375931 ) ( ON ?auto_375929 ?auto_375928 ) ( not ( = ?auto_375928 ?auto_375929 ) ) ( not ( = ?auto_375928 ?auto_375930 ) ) ( TRUCK-AT ?auto_375935 ?auto_375936 ) ( not ( = ?auto_375936 ?auto_375933 ) ) ( HOIST-AT ?auto_375934 ?auto_375936 ) ( not ( = ?auto_375931 ?auto_375934 ) ) ( AVAILABLE ?auto_375934 ) ( SURFACE-AT ?auto_375930 ?auto_375936 ) ( ON ?auto_375930 ?auto_375932 ) ( CLEAR ?auto_375930 ) ( not ( = ?auto_375929 ?auto_375932 ) ) ( not ( = ?auto_375930 ?auto_375932 ) ) ( not ( = ?auto_375928 ?auto_375932 ) ) ( ON ?auto_375928 ?auto_375927 ) ( not ( = ?auto_375927 ?auto_375928 ) ) ( not ( = ?auto_375927 ?auto_375929 ) ) ( not ( = ?auto_375927 ?auto_375930 ) ) ( not ( = ?auto_375927 ?auto_375932 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_375928 ?auto_375929 ?auto_375930 )
      ( MAKE-3CRATE-VERIFY ?auto_375927 ?auto_375928 ?auto_375929 ?auto_375930 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_375955 - SURFACE
      ?auto_375956 - SURFACE
      ?auto_375957 - SURFACE
      ?auto_375958 - SURFACE
    )
    :vars
    (
      ?auto_375962 - HOIST
      ?auto_375961 - PLACE
      ?auto_375959 - PLACE
      ?auto_375964 - HOIST
      ?auto_375963 - SURFACE
      ?auto_375960 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375962 ?auto_375961 ) ( SURFACE-AT ?auto_375957 ?auto_375961 ) ( CLEAR ?auto_375957 ) ( IS-CRATE ?auto_375958 ) ( not ( = ?auto_375957 ?auto_375958 ) ) ( AVAILABLE ?auto_375962 ) ( ON ?auto_375957 ?auto_375956 ) ( not ( = ?auto_375956 ?auto_375957 ) ) ( not ( = ?auto_375956 ?auto_375958 ) ) ( not ( = ?auto_375959 ?auto_375961 ) ) ( HOIST-AT ?auto_375964 ?auto_375959 ) ( not ( = ?auto_375962 ?auto_375964 ) ) ( AVAILABLE ?auto_375964 ) ( SURFACE-AT ?auto_375958 ?auto_375959 ) ( ON ?auto_375958 ?auto_375963 ) ( CLEAR ?auto_375958 ) ( not ( = ?auto_375957 ?auto_375963 ) ) ( not ( = ?auto_375958 ?auto_375963 ) ) ( not ( = ?auto_375956 ?auto_375963 ) ) ( TRUCK-AT ?auto_375960 ?auto_375961 ) ( ON ?auto_375956 ?auto_375955 ) ( not ( = ?auto_375955 ?auto_375956 ) ) ( not ( = ?auto_375955 ?auto_375957 ) ) ( not ( = ?auto_375955 ?auto_375958 ) ) ( not ( = ?auto_375955 ?auto_375963 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_375956 ?auto_375957 ?auto_375958 )
      ( MAKE-3CRATE-VERIFY ?auto_375955 ?auto_375956 ?auto_375957 ?auto_375958 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_375983 - SURFACE
      ?auto_375984 - SURFACE
      ?auto_375985 - SURFACE
      ?auto_375986 - SURFACE
    )
    :vars
    (
      ?auto_375992 - HOIST
      ?auto_375987 - PLACE
      ?auto_375990 - PLACE
      ?auto_375991 - HOIST
      ?auto_375988 - SURFACE
      ?auto_375989 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375992 ?auto_375987 ) ( IS-CRATE ?auto_375986 ) ( not ( = ?auto_375985 ?auto_375986 ) ) ( not ( = ?auto_375984 ?auto_375985 ) ) ( not ( = ?auto_375984 ?auto_375986 ) ) ( not ( = ?auto_375990 ?auto_375987 ) ) ( HOIST-AT ?auto_375991 ?auto_375990 ) ( not ( = ?auto_375992 ?auto_375991 ) ) ( AVAILABLE ?auto_375991 ) ( SURFACE-AT ?auto_375986 ?auto_375990 ) ( ON ?auto_375986 ?auto_375988 ) ( CLEAR ?auto_375986 ) ( not ( = ?auto_375985 ?auto_375988 ) ) ( not ( = ?auto_375986 ?auto_375988 ) ) ( not ( = ?auto_375984 ?auto_375988 ) ) ( TRUCK-AT ?auto_375989 ?auto_375987 ) ( SURFACE-AT ?auto_375984 ?auto_375987 ) ( CLEAR ?auto_375984 ) ( LIFTING ?auto_375992 ?auto_375985 ) ( IS-CRATE ?auto_375985 ) ( ON ?auto_375984 ?auto_375983 ) ( not ( = ?auto_375983 ?auto_375984 ) ) ( not ( = ?auto_375983 ?auto_375985 ) ) ( not ( = ?auto_375983 ?auto_375986 ) ) ( not ( = ?auto_375983 ?auto_375988 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_375984 ?auto_375985 ?auto_375986 )
      ( MAKE-3CRATE-VERIFY ?auto_375983 ?auto_375984 ?auto_375985 ?auto_375986 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_376011 - SURFACE
      ?auto_376012 - SURFACE
      ?auto_376013 - SURFACE
      ?auto_376014 - SURFACE
    )
    :vars
    (
      ?auto_376015 - HOIST
      ?auto_376017 - PLACE
      ?auto_376016 - PLACE
      ?auto_376018 - HOIST
      ?auto_376020 - SURFACE
      ?auto_376019 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_376015 ?auto_376017 ) ( IS-CRATE ?auto_376014 ) ( not ( = ?auto_376013 ?auto_376014 ) ) ( not ( = ?auto_376012 ?auto_376013 ) ) ( not ( = ?auto_376012 ?auto_376014 ) ) ( not ( = ?auto_376016 ?auto_376017 ) ) ( HOIST-AT ?auto_376018 ?auto_376016 ) ( not ( = ?auto_376015 ?auto_376018 ) ) ( AVAILABLE ?auto_376018 ) ( SURFACE-AT ?auto_376014 ?auto_376016 ) ( ON ?auto_376014 ?auto_376020 ) ( CLEAR ?auto_376014 ) ( not ( = ?auto_376013 ?auto_376020 ) ) ( not ( = ?auto_376014 ?auto_376020 ) ) ( not ( = ?auto_376012 ?auto_376020 ) ) ( TRUCK-AT ?auto_376019 ?auto_376017 ) ( SURFACE-AT ?auto_376012 ?auto_376017 ) ( CLEAR ?auto_376012 ) ( IS-CRATE ?auto_376013 ) ( AVAILABLE ?auto_376015 ) ( IN ?auto_376013 ?auto_376019 ) ( ON ?auto_376012 ?auto_376011 ) ( not ( = ?auto_376011 ?auto_376012 ) ) ( not ( = ?auto_376011 ?auto_376013 ) ) ( not ( = ?auto_376011 ?auto_376014 ) ) ( not ( = ?auto_376011 ?auto_376020 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_376012 ?auto_376013 ?auto_376014 )
      ( MAKE-3CRATE-VERIFY ?auto_376011 ?auto_376012 ?auto_376013 ?auto_376014 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_376090 - SURFACE
      ?auto_376091 - SURFACE
    )
    :vars
    (
      ?auto_376096 - HOIST
      ?auto_376092 - PLACE
      ?auto_376093 - SURFACE
      ?auto_376098 - PLACE
      ?auto_376095 - HOIST
      ?auto_376094 - SURFACE
      ?auto_376097 - TRUCK
      ?auto_376099 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_376096 ?auto_376092 ) ( SURFACE-AT ?auto_376090 ?auto_376092 ) ( CLEAR ?auto_376090 ) ( IS-CRATE ?auto_376091 ) ( not ( = ?auto_376090 ?auto_376091 ) ) ( AVAILABLE ?auto_376096 ) ( ON ?auto_376090 ?auto_376093 ) ( not ( = ?auto_376093 ?auto_376090 ) ) ( not ( = ?auto_376093 ?auto_376091 ) ) ( not ( = ?auto_376098 ?auto_376092 ) ) ( HOIST-AT ?auto_376095 ?auto_376098 ) ( not ( = ?auto_376096 ?auto_376095 ) ) ( AVAILABLE ?auto_376095 ) ( SURFACE-AT ?auto_376091 ?auto_376098 ) ( ON ?auto_376091 ?auto_376094 ) ( CLEAR ?auto_376091 ) ( not ( = ?auto_376090 ?auto_376094 ) ) ( not ( = ?auto_376091 ?auto_376094 ) ) ( not ( = ?auto_376093 ?auto_376094 ) ) ( TRUCK-AT ?auto_376097 ?auto_376099 ) ( not ( = ?auto_376099 ?auto_376092 ) ) ( not ( = ?auto_376098 ?auto_376099 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_376097 ?auto_376099 ?auto_376092 )
      ( MAKE-1CRATE ?auto_376090 ?auto_376091 )
      ( MAKE-1CRATE-VERIFY ?auto_376090 ?auto_376091 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_376196 - SURFACE
      ?auto_376197 - SURFACE
    )
    :vars
    (
      ?auto_376200 - HOIST
      ?auto_376199 - PLACE
      ?auto_376202 - SURFACE
      ?auto_376204 - PLACE
      ?auto_376198 - HOIST
      ?auto_376201 - SURFACE
      ?auto_376203 - TRUCK
      ?auto_376205 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_376200 ?auto_376199 ) ( SURFACE-AT ?auto_376196 ?auto_376199 ) ( CLEAR ?auto_376196 ) ( IS-CRATE ?auto_376197 ) ( not ( = ?auto_376196 ?auto_376197 ) ) ( ON ?auto_376196 ?auto_376202 ) ( not ( = ?auto_376202 ?auto_376196 ) ) ( not ( = ?auto_376202 ?auto_376197 ) ) ( not ( = ?auto_376204 ?auto_376199 ) ) ( HOIST-AT ?auto_376198 ?auto_376204 ) ( not ( = ?auto_376200 ?auto_376198 ) ) ( AVAILABLE ?auto_376198 ) ( SURFACE-AT ?auto_376197 ?auto_376204 ) ( ON ?auto_376197 ?auto_376201 ) ( CLEAR ?auto_376197 ) ( not ( = ?auto_376196 ?auto_376201 ) ) ( not ( = ?auto_376197 ?auto_376201 ) ) ( not ( = ?auto_376202 ?auto_376201 ) ) ( TRUCK-AT ?auto_376203 ?auto_376199 ) ( LIFTING ?auto_376200 ?auto_376205 ) ( IS-CRATE ?auto_376205 ) ( not ( = ?auto_376196 ?auto_376205 ) ) ( not ( = ?auto_376197 ?auto_376205 ) ) ( not ( = ?auto_376202 ?auto_376205 ) ) ( not ( = ?auto_376201 ?auto_376205 ) ) )
    :subtasks
    ( ( !LOAD ?auto_376200 ?auto_376205 ?auto_376203 ?auto_376199 )
      ( MAKE-1CRATE ?auto_376196 ?auto_376197 )
      ( MAKE-1CRATE-VERIFY ?auto_376196 ?auto_376197 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_376304 - SURFACE
      ?auto_376305 - SURFACE
      ?auto_376306 - SURFACE
      ?auto_376307 - SURFACE
      ?auto_376308 - SURFACE
    )
    :vars
    (
      ?auto_376310 - HOIST
      ?auto_376309 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_376310 ?auto_376309 ) ( SURFACE-AT ?auto_376307 ?auto_376309 ) ( CLEAR ?auto_376307 ) ( LIFTING ?auto_376310 ?auto_376308 ) ( IS-CRATE ?auto_376308 ) ( not ( = ?auto_376307 ?auto_376308 ) ) ( ON ?auto_376305 ?auto_376304 ) ( ON ?auto_376306 ?auto_376305 ) ( ON ?auto_376307 ?auto_376306 ) ( not ( = ?auto_376304 ?auto_376305 ) ) ( not ( = ?auto_376304 ?auto_376306 ) ) ( not ( = ?auto_376304 ?auto_376307 ) ) ( not ( = ?auto_376304 ?auto_376308 ) ) ( not ( = ?auto_376305 ?auto_376306 ) ) ( not ( = ?auto_376305 ?auto_376307 ) ) ( not ( = ?auto_376305 ?auto_376308 ) ) ( not ( = ?auto_376306 ?auto_376307 ) ) ( not ( = ?auto_376306 ?auto_376308 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_376307 ?auto_376308 )
      ( MAKE-4CRATE-VERIFY ?auto_376304 ?auto_376305 ?auto_376306 ?auto_376307 ?auto_376308 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_376329 - SURFACE
      ?auto_376330 - SURFACE
      ?auto_376331 - SURFACE
      ?auto_376332 - SURFACE
      ?auto_376333 - SURFACE
    )
    :vars
    (
      ?auto_376335 - HOIST
      ?auto_376334 - PLACE
      ?auto_376336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_376335 ?auto_376334 ) ( SURFACE-AT ?auto_376332 ?auto_376334 ) ( CLEAR ?auto_376332 ) ( IS-CRATE ?auto_376333 ) ( not ( = ?auto_376332 ?auto_376333 ) ) ( TRUCK-AT ?auto_376336 ?auto_376334 ) ( AVAILABLE ?auto_376335 ) ( IN ?auto_376333 ?auto_376336 ) ( ON ?auto_376332 ?auto_376331 ) ( not ( = ?auto_376331 ?auto_376332 ) ) ( not ( = ?auto_376331 ?auto_376333 ) ) ( ON ?auto_376330 ?auto_376329 ) ( ON ?auto_376331 ?auto_376330 ) ( not ( = ?auto_376329 ?auto_376330 ) ) ( not ( = ?auto_376329 ?auto_376331 ) ) ( not ( = ?auto_376329 ?auto_376332 ) ) ( not ( = ?auto_376329 ?auto_376333 ) ) ( not ( = ?auto_376330 ?auto_376331 ) ) ( not ( = ?auto_376330 ?auto_376332 ) ) ( not ( = ?auto_376330 ?auto_376333 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_376331 ?auto_376332 ?auto_376333 )
      ( MAKE-4CRATE-VERIFY ?auto_376329 ?auto_376330 ?auto_376331 ?auto_376332 ?auto_376333 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_376359 - SURFACE
      ?auto_376360 - SURFACE
      ?auto_376361 - SURFACE
      ?auto_376362 - SURFACE
      ?auto_376363 - SURFACE
    )
    :vars
    (
      ?auto_376365 - HOIST
      ?auto_376367 - PLACE
      ?auto_376366 - TRUCK
      ?auto_376364 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_376365 ?auto_376367 ) ( SURFACE-AT ?auto_376362 ?auto_376367 ) ( CLEAR ?auto_376362 ) ( IS-CRATE ?auto_376363 ) ( not ( = ?auto_376362 ?auto_376363 ) ) ( AVAILABLE ?auto_376365 ) ( IN ?auto_376363 ?auto_376366 ) ( ON ?auto_376362 ?auto_376361 ) ( not ( = ?auto_376361 ?auto_376362 ) ) ( not ( = ?auto_376361 ?auto_376363 ) ) ( TRUCK-AT ?auto_376366 ?auto_376364 ) ( not ( = ?auto_376364 ?auto_376367 ) ) ( ON ?auto_376360 ?auto_376359 ) ( ON ?auto_376361 ?auto_376360 ) ( not ( = ?auto_376359 ?auto_376360 ) ) ( not ( = ?auto_376359 ?auto_376361 ) ) ( not ( = ?auto_376359 ?auto_376362 ) ) ( not ( = ?auto_376359 ?auto_376363 ) ) ( not ( = ?auto_376360 ?auto_376361 ) ) ( not ( = ?auto_376360 ?auto_376362 ) ) ( not ( = ?auto_376360 ?auto_376363 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_376361 ?auto_376362 ?auto_376363 )
      ( MAKE-4CRATE-VERIFY ?auto_376359 ?auto_376360 ?auto_376361 ?auto_376362 ?auto_376363 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_376393 - SURFACE
      ?auto_376394 - SURFACE
      ?auto_376395 - SURFACE
      ?auto_376396 - SURFACE
      ?auto_376397 - SURFACE
    )
    :vars
    (
      ?auto_376402 - HOIST
      ?auto_376399 - PLACE
      ?auto_376401 - TRUCK
      ?auto_376398 - PLACE
      ?auto_376400 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_376402 ?auto_376399 ) ( SURFACE-AT ?auto_376396 ?auto_376399 ) ( CLEAR ?auto_376396 ) ( IS-CRATE ?auto_376397 ) ( not ( = ?auto_376396 ?auto_376397 ) ) ( AVAILABLE ?auto_376402 ) ( ON ?auto_376396 ?auto_376395 ) ( not ( = ?auto_376395 ?auto_376396 ) ) ( not ( = ?auto_376395 ?auto_376397 ) ) ( TRUCK-AT ?auto_376401 ?auto_376398 ) ( not ( = ?auto_376398 ?auto_376399 ) ) ( HOIST-AT ?auto_376400 ?auto_376398 ) ( LIFTING ?auto_376400 ?auto_376397 ) ( not ( = ?auto_376402 ?auto_376400 ) ) ( ON ?auto_376394 ?auto_376393 ) ( ON ?auto_376395 ?auto_376394 ) ( not ( = ?auto_376393 ?auto_376394 ) ) ( not ( = ?auto_376393 ?auto_376395 ) ) ( not ( = ?auto_376393 ?auto_376396 ) ) ( not ( = ?auto_376393 ?auto_376397 ) ) ( not ( = ?auto_376394 ?auto_376395 ) ) ( not ( = ?auto_376394 ?auto_376396 ) ) ( not ( = ?auto_376394 ?auto_376397 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_376395 ?auto_376396 ?auto_376397 )
      ( MAKE-4CRATE-VERIFY ?auto_376393 ?auto_376394 ?auto_376395 ?auto_376396 ?auto_376397 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_376431 - SURFACE
      ?auto_376432 - SURFACE
      ?auto_376433 - SURFACE
      ?auto_376434 - SURFACE
      ?auto_376435 - SURFACE
    )
    :vars
    (
      ?auto_376437 - HOIST
      ?auto_376441 - PLACE
      ?auto_376438 - TRUCK
      ?auto_376440 - PLACE
      ?auto_376436 - HOIST
      ?auto_376439 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_376437 ?auto_376441 ) ( SURFACE-AT ?auto_376434 ?auto_376441 ) ( CLEAR ?auto_376434 ) ( IS-CRATE ?auto_376435 ) ( not ( = ?auto_376434 ?auto_376435 ) ) ( AVAILABLE ?auto_376437 ) ( ON ?auto_376434 ?auto_376433 ) ( not ( = ?auto_376433 ?auto_376434 ) ) ( not ( = ?auto_376433 ?auto_376435 ) ) ( TRUCK-AT ?auto_376438 ?auto_376440 ) ( not ( = ?auto_376440 ?auto_376441 ) ) ( HOIST-AT ?auto_376436 ?auto_376440 ) ( not ( = ?auto_376437 ?auto_376436 ) ) ( AVAILABLE ?auto_376436 ) ( SURFACE-AT ?auto_376435 ?auto_376440 ) ( ON ?auto_376435 ?auto_376439 ) ( CLEAR ?auto_376435 ) ( not ( = ?auto_376434 ?auto_376439 ) ) ( not ( = ?auto_376435 ?auto_376439 ) ) ( not ( = ?auto_376433 ?auto_376439 ) ) ( ON ?auto_376432 ?auto_376431 ) ( ON ?auto_376433 ?auto_376432 ) ( not ( = ?auto_376431 ?auto_376432 ) ) ( not ( = ?auto_376431 ?auto_376433 ) ) ( not ( = ?auto_376431 ?auto_376434 ) ) ( not ( = ?auto_376431 ?auto_376435 ) ) ( not ( = ?auto_376431 ?auto_376439 ) ) ( not ( = ?auto_376432 ?auto_376433 ) ) ( not ( = ?auto_376432 ?auto_376434 ) ) ( not ( = ?auto_376432 ?auto_376435 ) ) ( not ( = ?auto_376432 ?auto_376439 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_376433 ?auto_376434 ?auto_376435 )
      ( MAKE-4CRATE-VERIFY ?auto_376431 ?auto_376432 ?auto_376433 ?auto_376434 ?auto_376435 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_376470 - SURFACE
      ?auto_376471 - SURFACE
      ?auto_376472 - SURFACE
      ?auto_376473 - SURFACE
      ?auto_376474 - SURFACE
    )
    :vars
    (
      ?auto_376475 - HOIST
      ?auto_376477 - PLACE
      ?auto_376476 - PLACE
      ?auto_376480 - HOIST
      ?auto_376478 - SURFACE
      ?auto_376479 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_376475 ?auto_376477 ) ( SURFACE-AT ?auto_376473 ?auto_376477 ) ( CLEAR ?auto_376473 ) ( IS-CRATE ?auto_376474 ) ( not ( = ?auto_376473 ?auto_376474 ) ) ( AVAILABLE ?auto_376475 ) ( ON ?auto_376473 ?auto_376472 ) ( not ( = ?auto_376472 ?auto_376473 ) ) ( not ( = ?auto_376472 ?auto_376474 ) ) ( not ( = ?auto_376476 ?auto_376477 ) ) ( HOIST-AT ?auto_376480 ?auto_376476 ) ( not ( = ?auto_376475 ?auto_376480 ) ) ( AVAILABLE ?auto_376480 ) ( SURFACE-AT ?auto_376474 ?auto_376476 ) ( ON ?auto_376474 ?auto_376478 ) ( CLEAR ?auto_376474 ) ( not ( = ?auto_376473 ?auto_376478 ) ) ( not ( = ?auto_376474 ?auto_376478 ) ) ( not ( = ?auto_376472 ?auto_376478 ) ) ( TRUCK-AT ?auto_376479 ?auto_376477 ) ( ON ?auto_376471 ?auto_376470 ) ( ON ?auto_376472 ?auto_376471 ) ( not ( = ?auto_376470 ?auto_376471 ) ) ( not ( = ?auto_376470 ?auto_376472 ) ) ( not ( = ?auto_376470 ?auto_376473 ) ) ( not ( = ?auto_376470 ?auto_376474 ) ) ( not ( = ?auto_376470 ?auto_376478 ) ) ( not ( = ?auto_376471 ?auto_376472 ) ) ( not ( = ?auto_376471 ?auto_376473 ) ) ( not ( = ?auto_376471 ?auto_376474 ) ) ( not ( = ?auto_376471 ?auto_376478 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_376472 ?auto_376473 ?auto_376474 )
      ( MAKE-4CRATE-VERIFY ?auto_376470 ?auto_376471 ?auto_376472 ?auto_376473 ?auto_376474 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_376509 - SURFACE
      ?auto_376510 - SURFACE
      ?auto_376511 - SURFACE
      ?auto_376512 - SURFACE
      ?auto_376513 - SURFACE
    )
    :vars
    (
      ?auto_376517 - HOIST
      ?auto_376515 - PLACE
      ?auto_376518 - PLACE
      ?auto_376519 - HOIST
      ?auto_376516 - SURFACE
      ?auto_376514 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_376517 ?auto_376515 ) ( IS-CRATE ?auto_376513 ) ( not ( = ?auto_376512 ?auto_376513 ) ) ( not ( = ?auto_376511 ?auto_376512 ) ) ( not ( = ?auto_376511 ?auto_376513 ) ) ( not ( = ?auto_376518 ?auto_376515 ) ) ( HOIST-AT ?auto_376519 ?auto_376518 ) ( not ( = ?auto_376517 ?auto_376519 ) ) ( AVAILABLE ?auto_376519 ) ( SURFACE-AT ?auto_376513 ?auto_376518 ) ( ON ?auto_376513 ?auto_376516 ) ( CLEAR ?auto_376513 ) ( not ( = ?auto_376512 ?auto_376516 ) ) ( not ( = ?auto_376513 ?auto_376516 ) ) ( not ( = ?auto_376511 ?auto_376516 ) ) ( TRUCK-AT ?auto_376514 ?auto_376515 ) ( SURFACE-AT ?auto_376511 ?auto_376515 ) ( CLEAR ?auto_376511 ) ( LIFTING ?auto_376517 ?auto_376512 ) ( IS-CRATE ?auto_376512 ) ( ON ?auto_376510 ?auto_376509 ) ( ON ?auto_376511 ?auto_376510 ) ( not ( = ?auto_376509 ?auto_376510 ) ) ( not ( = ?auto_376509 ?auto_376511 ) ) ( not ( = ?auto_376509 ?auto_376512 ) ) ( not ( = ?auto_376509 ?auto_376513 ) ) ( not ( = ?auto_376509 ?auto_376516 ) ) ( not ( = ?auto_376510 ?auto_376511 ) ) ( not ( = ?auto_376510 ?auto_376512 ) ) ( not ( = ?auto_376510 ?auto_376513 ) ) ( not ( = ?auto_376510 ?auto_376516 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_376511 ?auto_376512 ?auto_376513 )
      ( MAKE-4CRATE-VERIFY ?auto_376509 ?auto_376510 ?auto_376511 ?auto_376512 ?auto_376513 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_376548 - SURFACE
      ?auto_376549 - SURFACE
      ?auto_376550 - SURFACE
      ?auto_376551 - SURFACE
      ?auto_376552 - SURFACE
    )
    :vars
    (
      ?auto_376556 - HOIST
      ?auto_376554 - PLACE
      ?auto_376555 - PLACE
      ?auto_376553 - HOIST
      ?auto_376558 - SURFACE
      ?auto_376557 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_376556 ?auto_376554 ) ( IS-CRATE ?auto_376552 ) ( not ( = ?auto_376551 ?auto_376552 ) ) ( not ( = ?auto_376550 ?auto_376551 ) ) ( not ( = ?auto_376550 ?auto_376552 ) ) ( not ( = ?auto_376555 ?auto_376554 ) ) ( HOIST-AT ?auto_376553 ?auto_376555 ) ( not ( = ?auto_376556 ?auto_376553 ) ) ( AVAILABLE ?auto_376553 ) ( SURFACE-AT ?auto_376552 ?auto_376555 ) ( ON ?auto_376552 ?auto_376558 ) ( CLEAR ?auto_376552 ) ( not ( = ?auto_376551 ?auto_376558 ) ) ( not ( = ?auto_376552 ?auto_376558 ) ) ( not ( = ?auto_376550 ?auto_376558 ) ) ( TRUCK-AT ?auto_376557 ?auto_376554 ) ( SURFACE-AT ?auto_376550 ?auto_376554 ) ( CLEAR ?auto_376550 ) ( IS-CRATE ?auto_376551 ) ( AVAILABLE ?auto_376556 ) ( IN ?auto_376551 ?auto_376557 ) ( ON ?auto_376549 ?auto_376548 ) ( ON ?auto_376550 ?auto_376549 ) ( not ( = ?auto_376548 ?auto_376549 ) ) ( not ( = ?auto_376548 ?auto_376550 ) ) ( not ( = ?auto_376548 ?auto_376551 ) ) ( not ( = ?auto_376548 ?auto_376552 ) ) ( not ( = ?auto_376548 ?auto_376558 ) ) ( not ( = ?auto_376549 ?auto_376550 ) ) ( not ( = ?auto_376549 ?auto_376551 ) ) ( not ( = ?auto_376549 ?auto_376552 ) ) ( not ( = ?auto_376549 ?auto_376558 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_376550 ?auto_376551 ?auto_376552 )
      ( MAKE-4CRATE-VERIFY ?auto_376548 ?auto_376549 ?auto_376550 ?auto_376551 ?auto_376552 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_377208 - SURFACE
      ?auto_377209 - SURFACE
      ?auto_377210 - SURFACE
      ?auto_377211 - SURFACE
      ?auto_377212 - SURFACE
      ?auto_377213 - SURFACE
    )
    :vars
    (
      ?auto_377214 - HOIST
      ?auto_377215 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_377214 ?auto_377215 ) ( SURFACE-AT ?auto_377212 ?auto_377215 ) ( CLEAR ?auto_377212 ) ( LIFTING ?auto_377214 ?auto_377213 ) ( IS-CRATE ?auto_377213 ) ( not ( = ?auto_377212 ?auto_377213 ) ) ( ON ?auto_377209 ?auto_377208 ) ( ON ?auto_377210 ?auto_377209 ) ( ON ?auto_377211 ?auto_377210 ) ( ON ?auto_377212 ?auto_377211 ) ( not ( = ?auto_377208 ?auto_377209 ) ) ( not ( = ?auto_377208 ?auto_377210 ) ) ( not ( = ?auto_377208 ?auto_377211 ) ) ( not ( = ?auto_377208 ?auto_377212 ) ) ( not ( = ?auto_377208 ?auto_377213 ) ) ( not ( = ?auto_377209 ?auto_377210 ) ) ( not ( = ?auto_377209 ?auto_377211 ) ) ( not ( = ?auto_377209 ?auto_377212 ) ) ( not ( = ?auto_377209 ?auto_377213 ) ) ( not ( = ?auto_377210 ?auto_377211 ) ) ( not ( = ?auto_377210 ?auto_377212 ) ) ( not ( = ?auto_377210 ?auto_377213 ) ) ( not ( = ?auto_377211 ?auto_377212 ) ) ( not ( = ?auto_377211 ?auto_377213 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_377212 ?auto_377213 )
      ( MAKE-5CRATE-VERIFY ?auto_377208 ?auto_377209 ?auto_377210 ?auto_377211 ?auto_377212 ?auto_377213 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_377242 - SURFACE
      ?auto_377243 - SURFACE
      ?auto_377244 - SURFACE
      ?auto_377245 - SURFACE
      ?auto_377246 - SURFACE
      ?auto_377247 - SURFACE
    )
    :vars
    (
      ?auto_377249 - HOIST
      ?auto_377248 - PLACE
      ?auto_377250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_377249 ?auto_377248 ) ( SURFACE-AT ?auto_377246 ?auto_377248 ) ( CLEAR ?auto_377246 ) ( IS-CRATE ?auto_377247 ) ( not ( = ?auto_377246 ?auto_377247 ) ) ( TRUCK-AT ?auto_377250 ?auto_377248 ) ( AVAILABLE ?auto_377249 ) ( IN ?auto_377247 ?auto_377250 ) ( ON ?auto_377246 ?auto_377245 ) ( not ( = ?auto_377245 ?auto_377246 ) ) ( not ( = ?auto_377245 ?auto_377247 ) ) ( ON ?auto_377243 ?auto_377242 ) ( ON ?auto_377244 ?auto_377243 ) ( ON ?auto_377245 ?auto_377244 ) ( not ( = ?auto_377242 ?auto_377243 ) ) ( not ( = ?auto_377242 ?auto_377244 ) ) ( not ( = ?auto_377242 ?auto_377245 ) ) ( not ( = ?auto_377242 ?auto_377246 ) ) ( not ( = ?auto_377242 ?auto_377247 ) ) ( not ( = ?auto_377243 ?auto_377244 ) ) ( not ( = ?auto_377243 ?auto_377245 ) ) ( not ( = ?auto_377243 ?auto_377246 ) ) ( not ( = ?auto_377243 ?auto_377247 ) ) ( not ( = ?auto_377244 ?auto_377245 ) ) ( not ( = ?auto_377244 ?auto_377246 ) ) ( not ( = ?auto_377244 ?auto_377247 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_377245 ?auto_377246 ?auto_377247 )
      ( MAKE-5CRATE-VERIFY ?auto_377242 ?auto_377243 ?auto_377244 ?auto_377245 ?auto_377246 ?auto_377247 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_377282 - SURFACE
      ?auto_377283 - SURFACE
      ?auto_377284 - SURFACE
      ?auto_377285 - SURFACE
      ?auto_377286 - SURFACE
      ?auto_377287 - SURFACE
    )
    :vars
    (
      ?auto_377290 - HOIST
      ?auto_377288 - PLACE
      ?auto_377291 - TRUCK
      ?auto_377289 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_377290 ?auto_377288 ) ( SURFACE-AT ?auto_377286 ?auto_377288 ) ( CLEAR ?auto_377286 ) ( IS-CRATE ?auto_377287 ) ( not ( = ?auto_377286 ?auto_377287 ) ) ( AVAILABLE ?auto_377290 ) ( IN ?auto_377287 ?auto_377291 ) ( ON ?auto_377286 ?auto_377285 ) ( not ( = ?auto_377285 ?auto_377286 ) ) ( not ( = ?auto_377285 ?auto_377287 ) ) ( TRUCK-AT ?auto_377291 ?auto_377289 ) ( not ( = ?auto_377289 ?auto_377288 ) ) ( ON ?auto_377283 ?auto_377282 ) ( ON ?auto_377284 ?auto_377283 ) ( ON ?auto_377285 ?auto_377284 ) ( not ( = ?auto_377282 ?auto_377283 ) ) ( not ( = ?auto_377282 ?auto_377284 ) ) ( not ( = ?auto_377282 ?auto_377285 ) ) ( not ( = ?auto_377282 ?auto_377286 ) ) ( not ( = ?auto_377282 ?auto_377287 ) ) ( not ( = ?auto_377283 ?auto_377284 ) ) ( not ( = ?auto_377283 ?auto_377285 ) ) ( not ( = ?auto_377283 ?auto_377286 ) ) ( not ( = ?auto_377283 ?auto_377287 ) ) ( not ( = ?auto_377284 ?auto_377285 ) ) ( not ( = ?auto_377284 ?auto_377286 ) ) ( not ( = ?auto_377284 ?auto_377287 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_377285 ?auto_377286 ?auto_377287 )
      ( MAKE-5CRATE-VERIFY ?auto_377282 ?auto_377283 ?auto_377284 ?auto_377285 ?auto_377286 ?auto_377287 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_377327 - SURFACE
      ?auto_377328 - SURFACE
      ?auto_377329 - SURFACE
      ?auto_377330 - SURFACE
      ?auto_377331 - SURFACE
      ?auto_377332 - SURFACE
    )
    :vars
    (
      ?auto_377335 - HOIST
      ?auto_377336 - PLACE
      ?auto_377337 - TRUCK
      ?auto_377333 - PLACE
      ?auto_377334 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_377335 ?auto_377336 ) ( SURFACE-AT ?auto_377331 ?auto_377336 ) ( CLEAR ?auto_377331 ) ( IS-CRATE ?auto_377332 ) ( not ( = ?auto_377331 ?auto_377332 ) ) ( AVAILABLE ?auto_377335 ) ( ON ?auto_377331 ?auto_377330 ) ( not ( = ?auto_377330 ?auto_377331 ) ) ( not ( = ?auto_377330 ?auto_377332 ) ) ( TRUCK-AT ?auto_377337 ?auto_377333 ) ( not ( = ?auto_377333 ?auto_377336 ) ) ( HOIST-AT ?auto_377334 ?auto_377333 ) ( LIFTING ?auto_377334 ?auto_377332 ) ( not ( = ?auto_377335 ?auto_377334 ) ) ( ON ?auto_377328 ?auto_377327 ) ( ON ?auto_377329 ?auto_377328 ) ( ON ?auto_377330 ?auto_377329 ) ( not ( = ?auto_377327 ?auto_377328 ) ) ( not ( = ?auto_377327 ?auto_377329 ) ) ( not ( = ?auto_377327 ?auto_377330 ) ) ( not ( = ?auto_377327 ?auto_377331 ) ) ( not ( = ?auto_377327 ?auto_377332 ) ) ( not ( = ?auto_377328 ?auto_377329 ) ) ( not ( = ?auto_377328 ?auto_377330 ) ) ( not ( = ?auto_377328 ?auto_377331 ) ) ( not ( = ?auto_377328 ?auto_377332 ) ) ( not ( = ?auto_377329 ?auto_377330 ) ) ( not ( = ?auto_377329 ?auto_377331 ) ) ( not ( = ?auto_377329 ?auto_377332 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_377330 ?auto_377331 ?auto_377332 )
      ( MAKE-5CRATE-VERIFY ?auto_377327 ?auto_377328 ?auto_377329 ?auto_377330 ?auto_377331 ?auto_377332 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_377377 - SURFACE
      ?auto_377378 - SURFACE
      ?auto_377379 - SURFACE
      ?auto_377380 - SURFACE
      ?auto_377381 - SURFACE
      ?auto_377382 - SURFACE
    )
    :vars
    (
      ?auto_377386 - HOIST
      ?auto_377387 - PLACE
      ?auto_377388 - TRUCK
      ?auto_377384 - PLACE
      ?auto_377383 - HOIST
      ?auto_377385 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_377386 ?auto_377387 ) ( SURFACE-AT ?auto_377381 ?auto_377387 ) ( CLEAR ?auto_377381 ) ( IS-CRATE ?auto_377382 ) ( not ( = ?auto_377381 ?auto_377382 ) ) ( AVAILABLE ?auto_377386 ) ( ON ?auto_377381 ?auto_377380 ) ( not ( = ?auto_377380 ?auto_377381 ) ) ( not ( = ?auto_377380 ?auto_377382 ) ) ( TRUCK-AT ?auto_377388 ?auto_377384 ) ( not ( = ?auto_377384 ?auto_377387 ) ) ( HOIST-AT ?auto_377383 ?auto_377384 ) ( not ( = ?auto_377386 ?auto_377383 ) ) ( AVAILABLE ?auto_377383 ) ( SURFACE-AT ?auto_377382 ?auto_377384 ) ( ON ?auto_377382 ?auto_377385 ) ( CLEAR ?auto_377382 ) ( not ( = ?auto_377381 ?auto_377385 ) ) ( not ( = ?auto_377382 ?auto_377385 ) ) ( not ( = ?auto_377380 ?auto_377385 ) ) ( ON ?auto_377378 ?auto_377377 ) ( ON ?auto_377379 ?auto_377378 ) ( ON ?auto_377380 ?auto_377379 ) ( not ( = ?auto_377377 ?auto_377378 ) ) ( not ( = ?auto_377377 ?auto_377379 ) ) ( not ( = ?auto_377377 ?auto_377380 ) ) ( not ( = ?auto_377377 ?auto_377381 ) ) ( not ( = ?auto_377377 ?auto_377382 ) ) ( not ( = ?auto_377377 ?auto_377385 ) ) ( not ( = ?auto_377378 ?auto_377379 ) ) ( not ( = ?auto_377378 ?auto_377380 ) ) ( not ( = ?auto_377378 ?auto_377381 ) ) ( not ( = ?auto_377378 ?auto_377382 ) ) ( not ( = ?auto_377378 ?auto_377385 ) ) ( not ( = ?auto_377379 ?auto_377380 ) ) ( not ( = ?auto_377379 ?auto_377381 ) ) ( not ( = ?auto_377379 ?auto_377382 ) ) ( not ( = ?auto_377379 ?auto_377385 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_377380 ?auto_377381 ?auto_377382 )
      ( MAKE-5CRATE-VERIFY ?auto_377377 ?auto_377378 ?auto_377379 ?auto_377380 ?auto_377381 ?auto_377382 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_377428 - SURFACE
      ?auto_377429 - SURFACE
      ?auto_377430 - SURFACE
      ?auto_377431 - SURFACE
      ?auto_377432 - SURFACE
      ?auto_377433 - SURFACE
    )
    :vars
    (
      ?auto_377439 - HOIST
      ?auto_377434 - PLACE
      ?auto_377435 - PLACE
      ?auto_377436 - HOIST
      ?auto_377438 - SURFACE
      ?auto_377437 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_377439 ?auto_377434 ) ( SURFACE-AT ?auto_377432 ?auto_377434 ) ( CLEAR ?auto_377432 ) ( IS-CRATE ?auto_377433 ) ( not ( = ?auto_377432 ?auto_377433 ) ) ( AVAILABLE ?auto_377439 ) ( ON ?auto_377432 ?auto_377431 ) ( not ( = ?auto_377431 ?auto_377432 ) ) ( not ( = ?auto_377431 ?auto_377433 ) ) ( not ( = ?auto_377435 ?auto_377434 ) ) ( HOIST-AT ?auto_377436 ?auto_377435 ) ( not ( = ?auto_377439 ?auto_377436 ) ) ( AVAILABLE ?auto_377436 ) ( SURFACE-AT ?auto_377433 ?auto_377435 ) ( ON ?auto_377433 ?auto_377438 ) ( CLEAR ?auto_377433 ) ( not ( = ?auto_377432 ?auto_377438 ) ) ( not ( = ?auto_377433 ?auto_377438 ) ) ( not ( = ?auto_377431 ?auto_377438 ) ) ( TRUCK-AT ?auto_377437 ?auto_377434 ) ( ON ?auto_377429 ?auto_377428 ) ( ON ?auto_377430 ?auto_377429 ) ( ON ?auto_377431 ?auto_377430 ) ( not ( = ?auto_377428 ?auto_377429 ) ) ( not ( = ?auto_377428 ?auto_377430 ) ) ( not ( = ?auto_377428 ?auto_377431 ) ) ( not ( = ?auto_377428 ?auto_377432 ) ) ( not ( = ?auto_377428 ?auto_377433 ) ) ( not ( = ?auto_377428 ?auto_377438 ) ) ( not ( = ?auto_377429 ?auto_377430 ) ) ( not ( = ?auto_377429 ?auto_377431 ) ) ( not ( = ?auto_377429 ?auto_377432 ) ) ( not ( = ?auto_377429 ?auto_377433 ) ) ( not ( = ?auto_377429 ?auto_377438 ) ) ( not ( = ?auto_377430 ?auto_377431 ) ) ( not ( = ?auto_377430 ?auto_377432 ) ) ( not ( = ?auto_377430 ?auto_377433 ) ) ( not ( = ?auto_377430 ?auto_377438 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_377431 ?auto_377432 ?auto_377433 )
      ( MAKE-5CRATE-VERIFY ?auto_377428 ?auto_377429 ?auto_377430 ?auto_377431 ?auto_377432 ?auto_377433 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_377479 - SURFACE
      ?auto_377480 - SURFACE
      ?auto_377481 - SURFACE
      ?auto_377482 - SURFACE
      ?auto_377483 - SURFACE
      ?auto_377484 - SURFACE
    )
    :vars
    (
      ?auto_377488 - HOIST
      ?auto_377490 - PLACE
      ?auto_377487 - PLACE
      ?auto_377485 - HOIST
      ?auto_377486 - SURFACE
      ?auto_377489 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_377488 ?auto_377490 ) ( IS-CRATE ?auto_377484 ) ( not ( = ?auto_377483 ?auto_377484 ) ) ( not ( = ?auto_377482 ?auto_377483 ) ) ( not ( = ?auto_377482 ?auto_377484 ) ) ( not ( = ?auto_377487 ?auto_377490 ) ) ( HOIST-AT ?auto_377485 ?auto_377487 ) ( not ( = ?auto_377488 ?auto_377485 ) ) ( AVAILABLE ?auto_377485 ) ( SURFACE-AT ?auto_377484 ?auto_377487 ) ( ON ?auto_377484 ?auto_377486 ) ( CLEAR ?auto_377484 ) ( not ( = ?auto_377483 ?auto_377486 ) ) ( not ( = ?auto_377484 ?auto_377486 ) ) ( not ( = ?auto_377482 ?auto_377486 ) ) ( TRUCK-AT ?auto_377489 ?auto_377490 ) ( SURFACE-AT ?auto_377482 ?auto_377490 ) ( CLEAR ?auto_377482 ) ( LIFTING ?auto_377488 ?auto_377483 ) ( IS-CRATE ?auto_377483 ) ( ON ?auto_377480 ?auto_377479 ) ( ON ?auto_377481 ?auto_377480 ) ( ON ?auto_377482 ?auto_377481 ) ( not ( = ?auto_377479 ?auto_377480 ) ) ( not ( = ?auto_377479 ?auto_377481 ) ) ( not ( = ?auto_377479 ?auto_377482 ) ) ( not ( = ?auto_377479 ?auto_377483 ) ) ( not ( = ?auto_377479 ?auto_377484 ) ) ( not ( = ?auto_377479 ?auto_377486 ) ) ( not ( = ?auto_377480 ?auto_377481 ) ) ( not ( = ?auto_377480 ?auto_377482 ) ) ( not ( = ?auto_377480 ?auto_377483 ) ) ( not ( = ?auto_377480 ?auto_377484 ) ) ( not ( = ?auto_377480 ?auto_377486 ) ) ( not ( = ?auto_377481 ?auto_377482 ) ) ( not ( = ?auto_377481 ?auto_377483 ) ) ( not ( = ?auto_377481 ?auto_377484 ) ) ( not ( = ?auto_377481 ?auto_377486 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_377482 ?auto_377483 ?auto_377484 )
      ( MAKE-5CRATE-VERIFY ?auto_377479 ?auto_377480 ?auto_377481 ?auto_377482 ?auto_377483 ?auto_377484 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_377530 - SURFACE
      ?auto_377531 - SURFACE
      ?auto_377532 - SURFACE
      ?auto_377533 - SURFACE
      ?auto_377534 - SURFACE
      ?auto_377535 - SURFACE
    )
    :vars
    (
      ?auto_377537 - HOIST
      ?auto_377541 - PLACE
      ?auto_377539 - PLACE
      ?auto_377536 - HOIST
      ?auto_377538 - SURFACE
      ?auto_377540 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_377537 ?auto_377541 ) ( IS-CRATE ?auto_377535 ) ( not ( = ?auto_377534 ?auto_377535 ) ) ( not ( = ?auto_377533 ?auto_377534 ) ) ( not ( = ?auto_377533 ?auto_377535 ) ) ( not ( = ?auto_377539 ?auto_377541 ) ) ( HOIST-AT ?auto_377536 ?auto_377539 ) ( not ( = ?auto_377537 ?auto_377536 ) ) ( AVAILABLE ?auto_377536 ) ( SURFACE-AT ?auto_377535 ?auto_377539 ) ( ON ?auto_377535 ?auto_377538 ) ( CLEAR ?auto_377535 ) ( not ( = ?auto_377534 ?auto_377538 ) ) ( not ( = ?auto_377535 ?auto_377538 ) ) ( not ( = ?auto_377533 ?auto_377538 ) ) ( TRUCK-AT ?auto_377540 ?auto_377541 ) ( SURFACE-AT ?auto_377533 ?auto_377541 ) ( CLEAR ?auto_377533 ) ( IS-CRATE ?auto_377534 ) ( AVAILABLE ?auto_377537 ) ( IN ?auto_377534 ?auto_377540 ) ( ON ?auto_377531 ?auto_377530 ) ( ON ?auto_377532 ?auto_377531 ) ( ON ?auto_377533 ?auto_377532 ) ( not ( = ?auto_377530 ?auto_377531 ) ) ( not ( = ?auto_377530 ?auto_377532 ) ) ( not ( = ?auto_377530 ?auto_377533 ) ) ( not ( = ?auto_377530 ?auto_377534 ) ) ( not ( = ?auto_377530 ?auto_377535 ) ) ( not ( = ?auto_377530 ?auto_377538 ) ) ( not ( = ?auto_377531 ?auto_377532 ) ) ( not ( = ?auto_377531 ?auto_377533 ) ) ( not ( = ?auto_377531 ?auto_377534 ) ) ( not ( = ?auto_377531 ?auto_377535 ) ) ( not ( = ?auto_377531 ?auto_377538 ) ) ( not ( = ?auto_377532 ?auto_377533 ) ) ( not ( = ?auto_377532 ?auto_377534 ) ) ( not ( = ?auto_377532 ?auto_377535 ) ) ( not ( = ?auto_377532 ?auto_377538 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_377533 ?auto_377534 ?auto_377535 )
      ( MAKE-5CRATE-VERIFY ?auto_377530 ?auto_377531 ?auto_377532 ?auto_377533 ?auto_377534 ?auto_377535 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_377898 - SURFACE
      ?auto_377899 - SURFACE
    )
    :vars
    (
      ?auto_377905 - HOIST
      ?auto_377900 - PLACE
      ?auto_377903 - SURFACE
      ?auto_377906 - TRUCK
      ?auto_377904 - PLACE
      ?auto_377902 - HOIST
      ?auto_377901 - SURFACE
      ?auto_377907 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_377905 ?auto_377900 ) ( SURFACE-AT ?auto_377898 ?auto_377900 ) ( CLEAR ?auto_377898 ) ( IS-CRATE ?auto_377899 ) ( not ( = ?auto_377898 ?auto_377899 ) ) ( AVAILABLE ?auto_377905 ) ( ON ?auto_377898 ?auto_377903 ) ( not ( = ?auto_377903 ?auto_377898 ) ) ( not ( = ?auto_377903 ?auto_377899 ) ) ( TRUCK-AT ?auto_377906 ?auto_377904 ) ( not ( = ?auto_377904 ?auto_377900 ) ) ( HOIST-AT ?auto_377902 ?auto_377904 ) ( not ( = ?auto_377905 ?auto_377902 ) ) ( SURFACE-AT ?auto_377899 ?auto_377904 ) ( ON ?auto_377899 ?auto_377901 ) ( CLEAR ?auto_377899 ) ( not ( = ?auto_377898 ?auto_377901 ) ) ( not ( = ?auto_377899 ?auto_377901 ) ) ( not ( = ?auto_377903 ?auto_377901 ) ) ( LIFTING ?auto_377902 ?auto_377907 ) ( IS-CRATE ?auto_377907 ) ( not ( = ?auto_377898 ?auto_377907 ) ) ( not ( = ?auto_377899 ?auto_377907 ) ) ( not ( = ?auto_377903 ?auto_377907 ) ) ( not ( = ?auto_377901 ?auto_377907 ) ) )
    :subtasks
    ( ( !LOAD ?auto_377902 ?auto_377907 ?auto_377906 ?auto_377904 )
      ( MAKE-1CRATE ?auto_377898 ?auto_377899 )
      ( MAKE-1CRATE-VERIFY ?auto_377898 ?auto_377899 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_378735 - SURFACE
      ?auto_378736 - SURFACE
      ?auto_378737 - SURFACE
      ?auto_378738 - SURFACE
      ?auto_378739 - SURFACE
      ?auto_378740 - SURFACE
      ?auto_378741 - SURFACE
    )
    :vars
    (
      ?auto_378743 - HOIST
      ?auto_378742 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_378743 ?auto_378742 ) ( SURFACE-AT ?auto_378740 ?auto_378742 ) ( CLEAR ?auto_378740 ) ( LIFTING ?auto_378743 ?auto_378741 ) ( IS-CRATE ?auto_378741 ) ( not ( = ?auto_378740 ?auto_378741 ) ) ( ON ?auto_378736 ?auto_378735 ) ( ON ?auto_378737 ?auto_378736 ) ( ON ?auto_378738 ?auto_378737 ) ( ON ?auto_378739 ?auto_378738 ) ( ON ?auto_378740 ?auto_378739 ) ( not ( = ?auto_378735 ?auto_378736 ) ) ( not ( = ?auto_378735 ?auto_378737 ) ) ( not ( = ?auto_378735 ?auto_378738 ) ) ( not ( = ?auto_378735 ?auto_378739 ) ) ( not ( = ?auto_378735 ?auto_378740 ) ) ( not ( = ?auto_378735 ?auto_378741 ) ) ( not ( = ?auto_378736 ?auto_378737 ) ) ( not ( = ?auto_378736 ?auto_378738 ) ) ( not ( = ?auto_378736 ?auto_378739 ) ) ( not ( = ?auto_378736 ?auto_378740 ) ) ( not ( = ?auto_378736 ?auto_378741 ) ) ( not ( = ?auto_378737 ?auto_378738 ) ) ( not ( = ?auto_378737 ?auto_378739 ) ) ( not ( = ?auto_378737 ?auto_378740 ) ) ( not ( = ?auto_378737 ?auto_378741 ) ) ( not ( = ?auto_378738 ?auto_378739 ) ) ( not ( = ?auto_378738 ?auto_378740 ) ) ( not ( = ?auto_378738 ?auto_378741 ) ) ( not ( = ?auto_378739 ?auto_378740 ) ) ( not ( = ?auto_378739 ?auto_378741 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_378740 ?auto_378741 )
      ( MAKE-6CRATE-VERIFY ?auto_378735 ?auto_378736 ?auto_378737 ?auto_378738 ?auto_378739 ?auto_378740 ?auto_378741 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_378779 - SURFACE
      ?auto_378780 - SURFACE
      ?auto_378781 - SURFACE
      ?auto_378782 - SURFACE
      ?auto_378783 - SURFACE
      ?auto_378784 - SURFACE
      ?auto_378785 - SURFACE
    )
    :vars
    (
      ?auto_378788 - HOIST
      ?auto_378786 - PLACE
      ?auto_378787 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_378788 ?auto_378786 ) ( SURFACE-AT ?auto_378784 ?auto_378786 ) ( CLEAR ?auto_378784 ) ( IS-CRATE ?auto_378785 ) ( not ( = ?auto_378784 ?auto_378785 ) ) ( TRUCK-AT ?auto_378787 ?auto_378786 ) ( AVAILABLE ?auto_378788 ) ( IN ?auto_378785 ?auto_378787 ) ( ON ?auto_378784 ?auto_378783 ) ( not ( = ?auto_378783 ?auto_378784 ) ) ( not ( = ?auto_378783 ?auto_378785 ) ) ( ON ?auto_378780 ?auto_378779 ) ( ON ?auto_378781 ?auto_378780 ) ( ON ?auto_378782 ?auto_378781 ) ( ON ?auto_378783 ?auto_378782 ) ( not ( = ?auto_378779 ?auto_378780 ) ) ( not ( = ?auto_378779 ?auto_378781 ) ) ( not ( = ?auto_378779 ?auto_378782 ) ) ( not ( = ?auto_378779 ?auto_378783 ) ) ( not ( = ?auto_378779 ?auto_378784 ) ) ( not ( = ?auto_378779 ?auto_378785 ) ) ( not ( = ?auto_378780 ?auto_378781 ) ) ( not ( = ?auto_378780 ?auto_378782 ) ) ( not ( = ?auto_378780 ?auto_378783 ) ) ( not ( = ?auto_378780 ?auto_378784 ) ) ( not ( = ?auto_378780 ?auto_378785 ) ) ( not ( = ?auto_378781 ?auto_378782 ) ) ( not ( = ?auto_378781 ?auto_378783 ) ) ( not ( = ?auto_378781 ?auto_378784 ) ) ( not ( = ?auto_378781 ?auto_378785 ) ) ( not ( = ?auto_378782 ?auto_378783 ) ) ( not ( = ?auto_378782 ?auto_378784 ) ) ( not ( = ?auto_378782 ?auto_378785 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_378783 ?auto_378784 ?auto_378785 )
      ( MAKE-6CRATE-VERIFY ?auto_378779 ?auto_378780 ?auto_378781 ?auto_378782 ?auto_378783 ?auto_378784 ?auto_378785 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_378830 - SURFACE
      ?auto_378831 - SURFACE
      ?auto_378832 - SURFACE
      ?auto_378833 - SURFACE
      ?auto_378834 - SURFACE
      ?auto_378835 - SURFACE
      ?auto_378836 - SURFACE
    )
    :vars
    (
      ?auto_378837 - HOIST
      ?auto_378838 - PLACE
      ?auto_378840 - TRUCK
      ?auto_378839 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_378837 ?auto_378838 ) ( SURFACE-AT ?auto_378835 ?auto_378838 ) ( CLEAR ?auto_378835 ) ( IS-CRATE ?auto_378836 ) ( not ( = ?auto_378835 ?auto_378836 ) ) ( AVAILABLE ?auto_378837 ) ( IN ?auto_378836 ?auto_378840 ) ( ON ?auto_378835 ?auto_378834 ) ( not ( = ?auto_378834 ?auto_378835 ) ) ( not ( = ?auto_378834 ?auto_378836 ) ) ( TRUCK-AT ?auto_378840 ?auto_378839 ) ( not ( = ?auto_378839 ?auto_378838 ) ) ( ON ?auto_378831 ?auto_378830 ) ( ON ?auto_378832 ?auto_378831 ) ( ON ?auto_378833 ?auto_378832 ) ( ON ?auto_378834 ?auto_378833 ) ( not ( = ?auto_378830 ?auto_378831 ) ) ( not ( = ?auto_378830 ?auto_378832 ) ) ( not ( = ?auto_378830 ?auto_378833 ) ) ( not ( = ?auto_378830 ?auto_378834 ) ) ( not ( = ?auto_378830 ?auto_378835 ) ) ( not ( = ?auto_378830 ?auto_378836 ) ) ( not ( = ?auto_378831 ?auto_378832 ) ) ( not ( = ?auto_378831 ?auto_378833 ) ) ( not ( = ?auto_378831 ?auto_378834 ) ) ( not ( = ?auto_378831 ?auto_378835 ) ) ( not ( = ?auto_378831 ?auto_378836 ) ) ( not ( = ?auto_378832 ?auto_378833 ) ) ( not ( = ?auto_378832 ?auto_378834 ) ) ( not ( = ?auto_378832 ?auto_378835 ) ) ( not ( = ?auto_378832 ?auto_378836 ) ) ( not ( = ?auto_378833 ?auto_378834 ) ) ( not ( = ?auto_378833 ?auto_378835 ) ) ( not ( = ?auto_378833 ?auto_378836 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_378834 ?auto_378835 ?auto_378836 )
      ( MAKE-6CRATE-VERIFY ?auto_378830 ?auto_378831 ?auto_378832 ?auto_378833 ?auto_378834 ?auto_378835 ?auto_378836 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_378887 - SURFACE
      ?auto_378888 - SURFACE
      ?auto_378889 - SURFACE
      ?auto_378890 - SURFACE
      ?auto_378891 - SURFACE
      ?auto_378892 - SURFACE
      ?auto_378893 - SURFACE
    )
    :vars
    (
      ?auto_378897 - HOIST
      ?auto_378895 - PLACE
      ?auto_378894 - TRUCK
      ?auto_378898 - PLACE
      ?auto_378896 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_378897 ?auto_378895 ) ( SURFACE-AT ?auto_378892 ?auto_378895 ) ( CLEAR ?auto_378892 ) ( IS-CRATE ?auto_378893 ) ( not ( = ?auto_378892 ?auto_378893 ) ) ( AVAILABLE ?auto_378897 ) ( ON ?auto_378892 ?auto_378891 ) ( not ( = ?auto_378891 ?auto_378892 ) ) ( not ( = ?auto_378891 ?auto_378893 ) ) ( TRUCK-AT ?auto_378894 ?auto_378898 ) ( not ( = ?auto_378898 ?auto_378895 ) ) ( HOIST-AT ?auto_378896 ?auto_378898 ) ( LIFTING ?auto_378896 ?auto_378893 ) ( not ( = ?auto_378897 ?auto_378896 ) ) ( ON ?auto_378888 ?auto_378887 ) ( ON ?auto_378889 ?auto_378888 ) ( ON ?auto_378890 ?auto_378889 ) ( ON ?auto_378891 ?auto_378890 ) ( not ( = ?auto_378887 ?auto_378888 ) ) ( not ( = ?auto_378887 ?auto_378889 ) ) ( not ( = ?auto_378887 ?auto_378890 ) ) ( not ( = ?auto_378887 ?auto_378891 ) ) ( not ( = ?auto_378887 ?auto_378892 ) ) ( not ( = ?auto_378887 ?auto_378893 ) ) ( not ( = ?auto_378888 ?auto_378889 ) ) ( not ( = ?auto_378888 ?auto_378890 ) ) ( not ( = ?auto_378888 ?auto_378891 ) ) ( not ( = ?auto_378888 ?auto_378892 ) ) ( not ( = ?auto_378888 ?auto_378893 ) ) ( not ( = ?auto_378889 ?auto_378890 ) ) ( not ( = ?auto_378889 ?auto_378891 ) ) ( not ( = ?auto_378889 ?auto_378892 ) ) ( not ( = ?auto_378889 ?auto_378893 ) ) ( not ( = ?auto_378890 ?auto_378891 ) ) ( not ( = ?auto_378890 ?auto_378892 ) ) ( not ( = ?auto_378890 ?auto_378893 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_378891 ?auto_378892 ?auto_378893 )
      ( MAKE-6CRATE-VERIFY ?auto_378887 ?auto_378888 ?auto_378889 ?auto_378890 ?auto_378891 ?auto_378892 ?auto_378893 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_378950 - SURFACE
      ?auto_378951 - SURFACE
      ?auto_378952 - SURFACE
      ?auto_378953 - SURFACE
      ?auto_378954 - SURFACE
      ?auto_378955 - SURFACE
      ?auto_378956 - SURFACE
    )
    :vars
    (
      ?auto_378960 - HOIST
      ?auto_378961 - PLACE
      ?auto_378958 - TRUCK
      ?auto_378959 - PLACE
      ?auto_378957 - HOIST
      ?auto_378962 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_378960 ?auto_378961 ) ( SURFACE-AT ?auto_378955 ?auto_378961 ) ( CLEAR ?auto_378955 ) ( IS-CRATE ?auto_378956 ) ( not ( = ?auto_378955 ?auto_378956 ) ) ( AVAILABLE ?auto_378960 ) ( ON ?auto_378955 ?auto_378954 ) ( not ( = ?auto_378954 ?auto_378955 ) ) ( not ( = ?auto_378954 ?auto_378956 ) ) ( TRUCK-AT ?auto_378958 ?auto_378959 ) ( not ( = ?auto_378959 ?auto_378961 ) ) ( HOIST-AT ?auto_378957 ?auto_378959 ) ( not ( = ?auto_378960 ?auto_378957 ) ) ( AVAILABLE ?auto_378957 ) ( SURFACE-AT ?auto_378956 ?auto_378959 ) ( ON ?auto_378956 ?auto_378962 ) ( CLEAR ?auto_378956 ) ( not ( = ?auto_378955 ?auto_378962 ) ) ( not ( = ?auto_378956 ?auto_378962 ) ) ( not ( = ?auto_378954 ?auto_378962 ) ) ( ON ?auto_378951 ?auto_378950 ) ( ON ?auto_378952 ?auto_378951 ) ( ON ?auto_378953 ?auto_378952 ) ( ON ?auto_378954 ?auto_378953 ) ( not ( = ?auto_378950 ?auto_378951 ) ) ( not ( = ?auto_378950 ?auto_378952 ) ) ( not ( = ?auto_378950 ?auto_378953 ) ) ( not ( = ?auto_378950 ?auto_378954 ) ) ( not ( = ?auto_378950 ?auto_378955 ) ) ( not ( = ?auto_378950 ?auto_378956 ) ) ( not ( = ?auto_378950 ?auto_378962 ) ) ( not ( = ?auto_378951 ?auto_378952 ) ) ( not ( = ?auto_378951 ?auto_378953 ) ) ( not ( = ?auto_378951 ?auto_378954 ) ) ( not ( = ?auto_378951 ?auto_378955 ) ) ( not ( = ?auto_378951 ?auto_378956 ) ) ( not ( = ?auto_378951 ?auto_378962 ) ) ( not ( = ?auto_378952 ?auto_378953 ) ) ( not ( = ?auto_378952 ?auto_378954 ) ) ( not ( = ?auto_378952 ?auto_378955 ) ) ( not ( = ?auto_378952 ?auto_378956 ) ) ( not ( = ?auto_378952 ?auto_378962 ) ) ( not ( = ?auto_378953 ?auto_378954 ) ) ( not ( = ?auto_378953 ?auto_378955 ) ) ( not ( = ?auto_378953 ?auto_378956 ) ) ( not ( = ?auto_378953 ?auto_378962 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_378954 ?auto_378955 ?auto_378956 )
      ( MAKE-6CRATE-VERIFY ?auto_378950 ?auto_378951 ?auto_378952 ?auto_378953 ?auto_378954 ?auto_378955 ?auto_378956 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_379014 - SURFACE
      ?auto_379015 - SURFACE
      ?auto_379016 - SURFACE
      ?auto_379017 - SURFACE
      ?auto_379018 - SURFACE
      ?auto_379019 - SURFACE
      ?auto_379020 - SURFACE
    )
    :vars
    (
      ?auto_379026 - HOIST
      ?auto_379021 - PLACE
      ?auto_379023 - PLACE
      ?auto_379022 - HOIST
      ?auto_379025 - SURFACE
      ?auto_379024 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_379026 ?auto_379021 ) ( SURFACE-AT ?auto_379019 ?auto_379021 ) ( CLEAR ?auto_379019 ) ( IS-CRATE ?auto_379020 ) ( not ( = ?auto_379019 ?auto_379020 ) ) ( AVAILABLE ?auto_379026 ) ( ON ?auto_379019 ?auto_379018 ) ( not ( = ?auto_379018 ?auto_379019 ) ) ( not ( = ?auto_379018 ?auto_379020 ) ) ( not ( = ?auto_379023 ?auto_379021 ) ) ( HOIST-AT ?auto_379022 ?auto_379023 ) ( not ( = ?auto_379026 ?auto_379022 ) ) ( AVAILABLE ?auto_379022 ) ( SURFACE-AT ?auto_379020 ?auto_379023 ) ( ON ?auto_379020 ?auto_379025 ) ( CLEAR ?auto_379020 ) ( not ( = ?auto_379019 ?auto_379025 ) ) ( not ( = ?auto_379020 ?auto_379025 ) ) ( not ( = ?auto_379018 ?auto_379025 ) ) ( TRUCK-AT ?auto_379024 ?auto_379021 ) ( ON ?auto_379015 ?auto_379014 ) ( ON ?auto_379016 ?auto_379015 ) ( ON ?auto_379017 ?auto_379016 ) ( ON ?auto_379018 ?auto_379017 ) ( not ( = ?auto_379014 ?auto_379015 ) ) ( not ( = ?auto_379014 ?auto_379016 ) ) ( not ( = ?auto_379014 ?auto_379017 ) ) ( not ( = ?auto_379014 ?auto_379018 ) ) ( not ( = ?auto_379014 ?auto_379019 ) ) ( not ( = ?auto_379014 ?auto_379020 ) ) ( not ( = ?auto_379014 ?auto_379025 ) ) ( not ( = ?auto_379015 ?auto_379016 ) ) ( not ( = ?auto_379015 ?auto_379017 ) ) ( not ( = ?auto_379015 ?auto_379018 ) ) ( not ( = ?auto_379015 ?auto_379019 ) ) ( not ( = ?auto_379015 ?auto_379020 ) ) ( not ( = ?auto_379015 ?auto_379025 ) ) ( not ( = ?auto_379016 ?auto_379017 ) ) ( not ( = ?auto_379016 ?auto_379018 ) ) ( not ( = ?auto_379016 ?auto_379019 ) ) ( not ( = ?auto_379016 ?auto_379020 ) ) ( not ( = ?auto_379016 ?auto_379025 ) ) ( not ( = ?auto_379017 ?auto_379018 ) ) ( not ( = ?auto_379017 ?auto_379019 ) ) ( not ( = ?auto_379017 ?auto_379020 ) ) ( not ( = ?auto_379017 ?auto_379025 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_379018 ?auto_379019 ?auto_379020 )
      ( MAKE-6CRATE-VERIFY ?auto_379014 ?auto_379015 ?auto_379016 ?auto_379017 ?auto_379018 ?auto_379019 ?auto_379020 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_379078 - SURFACE
      ?auto_379079 - SURFACE
      ?auto_379080 - SURFACE
      ?auto_379081 - SURFACE
      ?auto_379082 - SURFACE
      ?auto_379083 - SURFACE
      ?auto_379084 - SURFACE
    )
    :vars
    (
      ?auto_379088 - HOIST
      ?auto_379085 - PLACE
      ?auto_379089 - PLACE
      ?auto_379090 - HOIST
      ?auto_379087 - SURFACE
      ?auto_379086 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_379088 ?auto_379085 ) ( IS-CRATE ?auto_379084 ) ( not ( = ?auto_379083 ?auto_379084 ) ) ( not ( = ?auto_379082 ?auto_379083 ) ) ( not ( = ?auto_379082 ?auto_379084 ) ) ( not ( = ?auto_379089 ?auto_379085 ) ) ( HOIST-AT ?auto_379090 ?auto_379089 ) ( not ( = ?auto_379088 ?auto_379090 ) ) ( AVAILABLE ?auto_379090 ) ( SURFACE-AT ?auto_379084 ?auto_379089 ) ( ON ?auto_379084 ?auto_379087 ) ( CLEAR ?auto_379084 ) ( not ( = ?auto_379083 ?auto_379087 ) ) ( not ( = ?auto_379084 ?auto_379087 ) ) ( not ( = ?auto_379082 ?auto_379087 ) ) ( TRUCK-AT ?auto_379086 ?auto_379085 ) ( SURFACE-AT ?auto_379082 ?auto_379085 ) ( CLEAR ?auto_379082 ) ( LIFTING ?auto_379088 ?auto_379083 ) ( IS-CRATE ?auto_379083 ) ( ON ?auto_379079 ?auto_379078 ) ( ON ?auto_379080 ?auto_379079 ) ( ON ?auto_379081 ?auto_379080 ) ( ON ?auto_379082 ?auto_379081 ) ( not ( = ?auto_379078 ?auto_379079 ) ) ( not ( = ?auto_379078 ?auto_379080 ) ) ( not ( = ?auto_379078 ?auto_379081 ) ) ( not ( = ?auto_379078 ?auto_379082 ) ) ( not ( = ?auto_379078 ?auto_379083 ) ) ( not ( = ?auto_379078 ?auto_379084 ) ) ( not ( = ?auto_379078 ?auto_379087 ) ) ( not ( = ?auto_379079 ?auto_379080 ) ) ( not ( = ?auto_379079 ?auto_379081 ) ) ( not ( = ?auto_379079 ?auto_379082 ) ) ( not ( = ?auto_379079 ?auto_379083 ) ) ( not ( = ?auto_379079 ?auto_379084 ) ) ( not ( = ?auto_379079 ?auto_379087 ) ) ( not ( = ?auto_379080 ?auto_379081 ) ) ( not ( = ?auto_379080 ?auto_379082 ) ) ( not ( = ?auto_379080 ?auto_379083 ) ) ( not ( = ?auto_379080 ?auto_379084 ) ) ( not ( = ?auto_379080 ?auto_379087 ) ) ( not ( = ?auto_379081 ?auto_379082 ) ) ( not ( = ?auto_379081 ?auto_379083 ) ) ( not ( = ?auto_379081 ?auto_379084 ) ) ( not ( = ?auto_379081 ?auto_379087 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_379082 ?auto_379083 ?auto_379084 )
      ( MAKE-6CRATE-VERIFY ?auto_379078 ?auto_379079 ?auto_379080 ?auto_379081 ?auto_379082 ?auto_379083 ?auto_379084 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_379142 - SURFACE
      ?auto_379143 - SURFACE
      ?auto_379144 - SURFACE
      ?auto_379145 - SURFACE
      ?auto_379146 - SURFACE
      ?auto_379147 - SURFACE
      ?auto_379148 - SURFACE
    )
    :vars
    (
      ?auto_379150 - HOIST
      ?auto_379149 - PLACE
      ?auto_379151 - PLACE
      ?auto_379152 - HOIST
      ?auto_379153 - SURFACE
      ?auto_379154 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_379150 ?auto_379149 ) ( IS-CRATE ?auto_379148 ) ( not ( = ?auto_379147 ?auto_379148 ) ) ( not ( = ?auto_379146 ?auto_379147 ) ) ( not ( = ?auto_379146 ?auto_379148 ) ) ( not ( = ?auto_379151 ?auto_379149 ) ) ( HOIST-AT ?auto_379152 ?auto_379151 ) ( not ( = ?auto_379150 ?auto_379152 ) ) ( AVAILABLE ?auto_379152 ) ( SURFACE-AT ?auto_379148 ?auto_379151 ) ( ON ?auto_379148 ?auto_379153 ) ( CLEAR ?auto_379148 ) ( not ( = ?auto_379147 ?auto_379153 ) ) ( not ( = ?auto_379148 ?auto_379153 ) ) ( not ( = ?auto_379146 ?auto_379153 ) ) ( TRUCK-AT ?auto_379154 ?auto_379149 ) ( SURFACE-AT ?auto_379146 ?auto_379149 ) ( CLEAR ?auto_379146 ) ( IS-CRATE ?auto_379147 ) ( AVAILABLE ?auto_379150 ) ( IN ?auto_379147 ?auto_379154 ) ( ON ?auto_379143 ?auto_379142 ) ( ON ?auto_379144 ?auto_379143 ) ( ON ?auto_379145 ?auto_379144 ) ( ON ?auto_379146 ?auto_379145 ) ( not ( = ?auto_379142 ?auto_379143 ) ) ( not ( = ?auto_379142 ?auto_379144 ) ) ( not ( = ?auto_379142 ?auto_379145 ) ) ( not ( = ?auto_379142 ?auto_379146 ) ) ( not ( = ?auto_379142 ?auto_379147 ) ) ( not ( = ?auto_379142 ?auto_379148 ) ) ( not ( = ?auto_379142 ?auto_379153 ) ) ( not ( = ?auto_379143 ?auto_379144 ) ) ( not ( = ?auto_379143 ?auto_379145 ) ) ( not ( = ?auto_379143 ?auto_379146 ) ) ( not ( = ?auto_379143 ?auto_379147 ) ) ( not ( = ?auto_379143 ?auto_379148 ) ) ( not ( = ?auto_379143 ?auto_379153 ) ) ( not ( = ?auto_379144 ?auto_379145 ) ) ( not ( = ?auto_379144 ?auto_379146 ) ) ( not ( = ?auto_379144 ?auto_379147 ) ) ( not ( = ?auto_379144 ?auto_379148 ) ) ( not ( = ?auto_379144 ?auto_379153 ) ) ( not ( = ?auto_379145 ?auto_379146 ) ) ( not ( = ?auto_379145 ?auto_379147 ) ) ( not ( = ?auto_379145 ?auto_379148 ) ) ( not ( = ?auto_379145 ?auto_379153 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_379146 ?auto_379147 ?auto_379148 )
      ( MAKE-6CRATE-VERIFY ?auto_379142 ?auto_379143 ?auto_379144 ?auto_379145 ?auto_379146 ?auto_379147 ?auto_379148 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_381067 - SURFACE
      ?auto_381068 - SURFACE
      ?auto_381069 - SURFACE
      ?auto_381070 - SURFACE
      ?auto_381071 - SURFACE
      ?auto_381072 - SURFACE
      ?auto_381073 - SURFACE
      ?auto_381074 - SURFACE
    )
    :vars
    (
      ?auto_381075 - HOIST
      ?auto_381076 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_381075 ?auto_381076 ) ( SURFACE-AT ?auto_381073 ?auto_381076 ) ( CLEAR ?auto_381073 ) ( LIFTING ?auto_381075 ?auto_381074 ) ( IS-CRATE ?auto_381074 ) ( not ( = ?auto_381073 ?auto_381074 ) ) ( ON ?auto_381068 ?auto_381067 ) ( ON ?auto_381069 ?auto_381068 ) ( ON ?auto_381070 ?auto_381069 ) ( ON ?auto_381071 ?auto_381070 ) ( ON ?auto_381072 ?auto_381071 ) ( ON ?auto_381073 ?auto_381072 ) ( not ( = ?auto_381067 ?auto_381068 ) ) ( not ( = ?auto_381067 ?auto_381069 ) ) ( not ( = ?auto_381067 ?auto_381070 ) ) ( not ( = ?auto_381067 ?auto_381071 ) ) ( not ( = ?auto_381067 ?auto_381072 ) ) ( not ( = ?auto_381067 ?auto_381073 ) ) ( not ( = ?auto_381067 ?auto_381074 ) ) ( not ( = ?auto_381068 ?auto_381069 ) ) ( not ( = ?auto_381068 ?auto_381070 ) ) ( not ( = ?auto_381068 ?auto_381071 ) ) ( not ( = ?auto_381068 ?auto_381072 ) ) ( not ( = ?auto_381068 ?auto_381073 ) ) ( not ( = ?auto_381068 ?auto_381074 ) ) ( not ( = ?auto_381069 ?auto_381070 ) ) ( not ( = ?auto_381069 ?auto_381071 ) ) ( not ( = ?auto_381069 ?auto_381072 ) ) ( not ( = ?auto_381069 ?auto_381073 ) ) ( not ( = ?auto_381069 ?auto_381074 ) ) ( not ( = ?auto_381070 ?auto_381071 ) ) ( not ( = ?auto_381070 ?auto_381072 ) ) ( not ( = ?auto_381070 ?auto_381073 ) ) ( not ( = ?auto_381070 ?auto_381074 ) ) ( not ( = ?auto_381071 ?auto_381072 ) ) ( not ( = ?auto_381071 ?auto_381073 ) ) ( not ( = ?auto_381071 ?auto_381074 ) ) ( not ( = ?auto_381072 ?auto_381073 ) ) ( not ( = ?auto_381072 ?auto_381074 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_381073 ?auto_381074 )
      ( MAKE-7CRATE-VERIFY ?auto_381067 ?auto_381068 ?auto_381069 ?auto_381070 ?auto_381071 ?auto_381072 ?auto_381073 ?auto_381074 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_381122 - SURFACE
      ?auto_381123 - SURFACE
      ?auto_381124 - SURFACE
      ?auto_381125 - SURFACE
      ?auto_381126 - SURFACE
      ?auto_381127 - SURFACE
      ?auto_381128 - SURFACE
      ?auto_381129 - SURFACE
    )
    :vars
    (
      ?auto_381132 - HOIST
      ?auto_381130 - PLACE
      ?auto_381131 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_381132 ?auto_381130 ) ( SURFACE-AT ?auto_381128 ?auto_381130 ) ( CLEAR ?auto_381128 ) ( IS-CRATE ?auto_381129 ) ( not ( = ?auto_381128 ?auto_381129 ) ) ( TRUCK-AT ?auto_381131 ?auto_381130 ) ( AVAILABLE ?auto_381132 ) ( IN ?auto_381129 ?auto_381131 ) ( ON ?auto_381128 ?auto_381127 ) ( not ( = ?auto_381127 ?auto_381128 ) ) ( not ( = ?auto_381127 ?auto_381129 ) ) ( ON ?auto_381123 ?auto_381122 ) ( ON ?auto_381124 ?auto_381123 ) ( ON ?auto_381125 ?auto_381124 ) ( ON ?auto_381126 ?auto_381125 ) ( ON ?auto_381127 ?auto_381126 ) ( not ( = ?auto_381122 ?auto_381123 ) ) ( not ( = ?auto_381122 ?auto_381124 ) ) ( not ( = ?auto_381122 ?auto_381125 ) ) ( not ( = ?auto_381122 ?auto_381126 ) ) ( not ( = ?auto_381122 ?auto_381127 ) ) ( not ( = ?auto_381122 ?auto_381128 ) ) ( not ( = ?auto_381122 ?auto_381129 ) ) ( not ( = ?auto_381123 ?auto_381124 ) ) ( not ( = ?auto_381123 ?auto_381125 ) ) ( not ( = ?auto_381123 ?auto_381126 ) ) ( not ( = ?auto_381123 ?auto_381127 ) ) ( not ( = ?auto_381123 ?auto_381128 ) ) ( not ( = ?auto_381123 ?auto_381129 ) ) ( not ( = ?auto_381124 ?auto_381125 ) ) ( not ( = ?auto_381124 ?auto_381126 ) ) ( not ( = ?auto_381124 ?auto_381127 ) ) ( not ( = ?auto_381124 ?auto_381128 ) ) ( not ( = ?auto_381124 ?auto_381129 ) ) ( not ( = ?auto_381125 ?auto_381126 ) ) ( not ( = ?auto_381125 ?auto_381127 ) ) ( not ( = ?auto_381125 ?auto_381128 ) ) ( not ( = ?auto_381125 ?auto_381129 ) ) ( not ( = ?auto_381126 ?auto_381127 ) ) ( not ( = ?auto_381126 ?auto_381128 ) ) ( not ( = ?auto_381126 ?auto_381129 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_381127 ?auto_381128 ?auto_381129 )
      ( MAKE-7CRATE-VERIFY ?auto_381122 ?auto_381123 ?auto_381124 ?auto_381125 ?auto_381126 ?auto_381127 ?auto_381128 ?auto_381129 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_381185 - SURFACE
      ?auto_381186 - SURFACE
      ?auto_381187 - SURFACE
      ?auto_381188 - SURFACE
      ?auto_381189 - SURFACE
      ?auto_381190 - SURFACE
      ?auto_381191 - SURFACE
      ?auto_381192 - SURFACE
    )
    :vars
    (
      ?auto_381193 - HOIST
      ?auto_381196 - PLACE
      ?auto_381194 - TRUCK
      ?auto_381195 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_381193 ?auto_381196 ) ( SURFACE-AT ?auto_381191 ?auto_381196 ) ( CLEAR ?auto_381191 ) ( IS-CRATE ?auto_381192 ) ( not ( = ?auto_381191 ?auto_381192 ) ) ( AVAILABLE ?auto_381193 ) ( IN ?auto_381192 ?auto_381194 ) ( ON ?auto_381191 ?auto_381190 ) ( not ( = ?auto_381190 ?auto_381191 ) ) ( not ( = ?auto_381190 ?auto_381192 ) ) ( TRUCK-AT ?auto_381194 ?auto_381195 ) ( not ( = ?auto_381195 ?auto_381196 ) ) ( ON ?auto_381186 ?auto_381185 ) ( ON ?auto_381187 ?auto_381186 ) ( ON ?auto_381188 ?auto_381187 ) ( ON ?auto_381189 ?auto_381188 ) ( ON ?auto_381190 ?auto_381189 ) ( not ( = ?auto_381185 ?auto_381186 ) ) ( not ( = ?auto_381185 ?auto_381187 ) ) ( not ( = ?auto_381185 ?auto_381188 ) ) ( not ( = ?auto_381185 ?auto_381189 ) ) ( not ( = ?auto_381185 ?auto_381190 ) ) ( not ( = ?auto_381185 ?auto_381191 ) ) ( not ( = ?auto_381185 ?auto_381192 ) ) ( not ( = ?auto_381186 ?auto_381187 ) ) ( not ( = ?auto_381186 ?auto_381188 ) ) ( not ( = ?auto_381186 ?auto_381189 ) ) ( not ( = ?auto_381186 ?auto_381190 ) ) ( not ( = ?auto_381186 ?auto_381191 ) ) ( not ( = ?auto_381186 ?auto_381192 ) ) ( not ( = ?auto_381187 ?auto_381188 ) ) ( not ( = ?auto_381187 ?auto_381189 ) ) ( not ( = ?auto_381187 ?auto_381190 ) ) ( not ( = ?auto_381187 ?auto_381191 ) ) ( not ( = ?auto_381187 ?auto_381192 ) ) ( not ( = ?auto_381188 ?auto_381189 ) ) ( not ( = ?auto_381188 ?auto_381190 ) ) ( not ( = ?auto_381188 ?auto_381191 ) ) ( not ( = ?auto_381188 ?auto_381192 ) ) ( not ( = ?auto_381189 ?auto_381190 ) ) ( not ( = ?auto_381189 ?auto_381191 ) ) ( not ( = ?auto_381189 ?auto_381192 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_381190 ?auto_381191 ?auto_381192 )
      ( MAKE-7CRATE-VERIFY ?auto_381185 ?auto_381186 ?auto_381187 ?auto_381188 ?auto_381189 ?auto_381190 ?auto_381191 ?auto_381192 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_381255 - SURFACE
      ?auto_381256 - SURFACE
      ?auto_381257 - SURFACE
      ?auto_381258 - SURFACE
      ?auto_381259 - SURFACE
      ?auto_381260 - SURFACE
      ?auto_381261 - SURFACE
      ?auto_381262 - SURFACE
    )
    :vars
    (
      ?auto_381265 - HOIST
      ?auto_381267 - PLACE
      ?auto_381264 - TRUCK
      ?auto_381266 - PLACE
      ?auto_381263 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_381265 ?auto_381267 ) ( SURFACE-AT ?auto_381261 ?auto_381267 ) ( CLEAR ?auto_381261 ) ( IS-CRATE ?auto_381262 ) ( not ( = ?auto_381261 ?auto_381262 ) ) ( AVAILABLE ?auto_381265 ) ( ON ?auto_381261 ?auto_381260 ) ( not ( = ?auto_381260 ?auto_381261 ) ) ( not ( = ?auto_381260 ?auto_381262 ) ) ( TRUCK-AT ?auto_381264 ?auto_381266 ) ( not ( = ?auto_381266 ?auto_381267 ) ) ( HOIST-AT ?auto_381263 ?auto_381266 ) ( LIFTING ?auto_381263 ?auto_381262 ) ( not ( = ?auto_381265 ?auto_381263 ) ) ( ON ?auto_381256 ?auto_381255 ) ( ON ?auto_381257 ?auto_381256 ) ( ON ?auto_381258 ?auto_381257 ) ( ON ?auto_381259 ?auto_381258 ) ( ON ?auto_381260 ?auto_381259 ) ( not ( = ?auto_381255 ?auto_381256 ) ) ( not ( = ?auto_381255 ?auto_381257 ) ) ( not ( = ?auto_381255 ?auto_381258 ) ) ( not ( = ?auto_381255 ?auto_381259 ) ) ( not ( = ?auto_381255 ?auto_381260 ) ) ( not ( = ?auto_381255 ?auto_381261 ) ) ( not ( = ?auto_381255 ?auto_381262 ) ) ( not ( = ?auto_381256 ?auto_381257 ) ) ( not ( = ?auto_381256 ?auto_381258 ) ) ( not ( = ?auto_381256 ?auto_381259 ) ) ( not ( = ?auto_381256 ?auto_381260 ) ) ( not ( = ?auto_381256 ?auto_381261 ) ) ( not ( = ?auto_381256 ?auto_381262 ) ) ( not ( = ?auto_381257 ?auto_381258 ) ) ( not ( = ?auto_381257 ?auto_381259 ) ) ( not ( = ?auto_381257 ?auto_381260 ) ) ( not ( = ?auto_381257 ?auto_381261 ) ) ( not ( = ?auto_381257 ?auto_381262 ) ) ( not ( = ?auto_381258 ?auto_381259 ) ) ( not ( = ?auto_381258 ?auto_381260 ) ) ( not ( = ?auto_381258 ?auto_381261 ) ) ( not ( = ?auto_381258 ?auto_381262 ) ) ( not ( = ?auto_381259 ?auto_381260 ) ) ( not ( = ?auto_381259 ?auto_381261 ) ) ( not ( = ?auto_381259 ?auto_381262 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_381260 ?auto_381261 ?auto_381262 )
      ( MAKE-7CRATE-VERIFY ?auto_381255 ?auto_381256 ?auto_381257 ?auto_381258 ?auto_381259 ?auto_381260 ?auto_381261 ?auto_381262 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_381332 - SURFACE
      ?auto_381333 - SURFACE
      ?auto_381334 - SURFACE
      ?auto_381335 - SURFACE
      ?auto_381336 - SURFACE
      ?auto_381337 - SURFACE
      ?auto_381338 - SURFACE
      ?auto_381339 - SURFACE
    )
    :vars
    (
      ?auto_381342 - HOIST
      ?auto_381343 - PLACE
      ?auto_381340 - TRUCK
      ?auto_381345 - PLACE
      ?auto_381341 - HOIST
      ?auto_381344 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_381342 ?auto_381343 ) ( SURFACE-AT ?auto_381338 ?auto_381343 ) ( CLEAR ?auto_381338 ) ( IS-CRATE ?auto_381339 ) ( not ( = ?auto_381338 ?auto_381339 ) ) ( AVAILABLE ?auto_381342 ) ( ON ?auto_381338 ?auto_381337 ) ( not ( = ?auto_381337 ?auto_381338 ) ) ( not ( = ?auto_381337 ?auto_381339 ) ) ( TRUCK-AT ?auto_381340 ?auto_381345 ) ( not ( = ?auto_381345 ?auto_381343 ) ) ( HOIST-AT ?auto_381341 ?auto_381345 ) ( not ( = ?auto_381342 ?auto_381341 ) ) ( AVAILABLE ?auto_381341 ) ( SURFACE-AT ?auto_381339 ?auto_381345 ) ( ON ?auto_381339 ?auto_381344 ) ( CLEAR ?auto_381339 ) ( not ( = ?auto_381338 ?auto_381344 ) ) ( not ( = ?auto_381339 ?auto_381344 ) ) ( not ( = ?auto_381337 ?auto_381344 ) ) ( ON ?auto_381333 ?auto_381332 ) ( ON ?auto_381334 ?auto_381333 ) ( ON ?auto_381335 ?auto_381334 ) ( ON ?auto_381336 ?auto_381335 ) ( ON ?auto_381337 ?auto_381336 ) ( not ( = ?auto_381332 ?auto_381333 ) ) ( not ( = ?auto_381332 ?auto_381334 ) ) ( not ( = ?auto_381332 ?auto_381335 ) ) ( not ( = ?auto_381332 ?auto_381336 ) ) ( not ( = ?auto_381332 ?auto_381337 ) ) ( not ( = ?auto_381332 ?auto_381338 ) ) ( not ( = ?auto_381332 ?auto_381339 ) ) ( not ( = ?auto_381332 ?auto_381344 ) ) ( not ( = ?auto_381333 ?auto_381334 ) ) ( not ( = ?auto_381333 ?auto_381335 ) ) ( not ( = ?auto_381333 ?auto_381336 ) ) ( not ( = ?auto_381333 ?auto_381337 ) ) ( not ( = ?auto_381333 ?auto_381338 ) ) ( not ( = ?auto_381333 ?auto_381339 ) ) ( not ( = ?auto_381333 ?auto_381344 ) ) ( not ( = ?auto_381334 ?auto_381335 ) ) ( not ( = ?auto_381334 ?auto_381336 ) ) ( not ( = ?auto_381334 ?auto_381337 ) ) ( not ( = ?auto_381334 ?auto_381338 ) ) ( not ( = ?auto_381334 ?auto_381339 ) ) ( not ( = ?auto_381334 ?auto_381344 ) ) ( not ( = ?auto_381335 ?auto_381336 ) ) ( not ( = ?auto_381335 ?auto_381337 ) ) ( not ( = ?auto_381335 ?auto_381338 ) ) ( not ( = ?auto_381335 ?auto_381339 ) ) ( not ( = ?auto_381335 ?auto_381344 ) ) ( not ( = ?auto_381336 ?auto_381337 ) ) ( not ( = ?auto_381336 ?auto_381338 ) ) ( not ( = ?auto_381336 ?auto_381339 ) ) ( not ( = ?auto_381336 ?auto_381344 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_381337 ?auto_381338 ?auto_381339 )
      ( MAKE-7CRATE-VERIFY ?auto_381332 ?auto_381333 ?auto_381334 ?auto_381335 ?auto_381336 ?auto_381337 ?auto_381338 ?auto_381339 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_381410 - SURFACE
      ?auto_381411 - SURFACE
      ?auto_381412 - SURFACE
      ?auto_381413 - SURFACE
      ?auto_381414 - SURFACE
      ?auto_381415 - SURFACE
      ?auto_381416 - SURFACE
      ?auto_381417 - SURFACE
    )
    :vars
    (
      ?auto_381423 - HOIST
      ?auto_381418 - PLACE
      ?auto_381419 - PLACE
      ?auto_381421 - HOIST
      ?auto_381420 - SURFACE
      ?auto_381422 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_381423 ?auto_381418 ) ( SURFACE-AT ?auto_381416 ?auto_381418 ) ( CLEAR ?auto_381416 ) ( IS-CRATE ?auto_381417 ) ( not ( = ?auto_381416 ?auto_381417 ) ) ( AVAILABLE ?auto_381423 ) ( ON ?auto_381416 ?auto_381415 ) ( not ( = ?auto_381415 ?auto_381416 ) ) ( not ( = ?auto_381415 ?auto_381417 ) ) ( not ( = ?auto_381419 ?auto_381418 ) ) ( HOIST-AT ?auto_381421 ?auto_381419 ) ( not ( = ?auto_381423 ?auto_381421 ) ) ( AVAILABLE ?auto_381421 ) ( SURFACE-AT ?auto_381417 ?auto_381419 ) ( ON ?auto_381417 ?auto_381420 ) ( CLEAR ?auto_381417 ) ( not ( = ?auto_381416 ?auto_381420 ) ) ( not ( = ?auto_381417 ?auto_381420 ) ) ( not ( = ?auto_381415 ?auto_381420 ) ) ( TRUCK-AT ?auto_381422 ?auto_381418 ) ( ON ?auto_381411 ?auto_381410 ) ( ON ?auto_381412 ?auto_381411 ) ( ON ?auto_381413 ?auto_381412 ) ( ON ?auto_381414 ?auto_381413 ) ( ON ?auto_381415 ?auto_381414 ) ( not ( = ?auto_381410 ?auto_381411 ) ) ( not ( = ?auto_381410 ?auto_381412 ) ) ( not ( = ?auto_381410 ?auto_381413 ) ) ( not ( = ?auto_381410 ?auto_381414 ) ) ( not ( = ?auto_381410 ?auto_381415 ) ) ( not ( = ?auto_381410 ?auto_381416 ) ) ( not ( = ?auto_381410 ?auto_381417 ) ) ( not ( = ?auto_381410 ?auto_381420 ) ) ( not ( = ?auto_381411 ?auto_381412 ) ) ( not ( = ?auto_381411 ?auto_381413 ) ) ( not ( = ?auto_381411 ?auto_381414 ) ) ( not ( = ?auto_381411 ?auto_381415 ) ) ( not ( = ?auto_381411 ?auto_381416 ) ) ( not ( = ?auto_381411 ?auto_381417 ) ) ( not ( = ?auto_381411 ?auto_381420 ) ) ( not ( = ?auto_381412 ?auto_381413 ) ) ( not ( = ?auto_381412 ?auto_381414 ) ) ( not ( = ?auto_381412 ?auto_381415 ) ) ( not ( = ?auto_381412 ?auto_381416 ) ) ( not ( = ?auto_381412 ?auto_381417 ) ) ( not ( = ?auto_381412 ?auto_381420 ) ) ( not ( = ?auto_381413 ?auto_381414 ) ) ( not ( = ?auto_381413 ?auto_381415 ) ) ( not ( = ?auto_381413 ?auto_381416 ) ) ( not ( = ?auto_381413 ?auto_381417 ) ) ( not ( = ?auto_381413 ?auto_381420 ) ) ( not ( = ?auto_381414 ?auto_381415 ) ) ( not ( = ?auto_381414 ?auto_381416 ) ) ( not ( = ?auto_381414 ?auto_381417 ) ) ( not ( = ?auto_381414 ?auto_381420 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_381415 ?auto_381416 ?auto_381417 )
      ( MAKE-7CRATE-VERIFY ?auto_381410 ?auto_381411 ?auto_381412 ?auto_381413 ?auto_381414 ?auto_381415 ?auto_381416 ?auto_381417 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_381488 - SURFACE
      ?auto_381489 - SURFACE
      ?auto_381490 - SURFACE
      ?auto_381491 - SURFACE
      ?auto_381492 - SURFACE
      ?auto_381493 - SURFACE
      ?auto_381494 - SURFACE
      ?auto_381495 - SURFACE
    )
    :vars
    (
      ?auto_381500 - HOIST
      ?auto_381499 - PLACE
      ?auto_381496 - PLACE
      ?auto_381501 - HOIST
      ?auto_381497 - SURFACE
      ?auto_381498 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_381500 ?auto_381499 ) ( IS-CRATE ?auto_381495 ) ( not ( = ?auto_381494 ?auto_381495 ) ) ( not ( = ?auto_381493 ?auto_381494 ) ) ( not ( = ?auto_381493 ?auto_381495 ) ) ( not ( = ?auto_381496 ?auto_381499 ) ) ( HOIST-AT ?auto_381501 ?auto_381496 ) ( not ( = ?auto_381500 ?auto_381501 ) ) ( AVAILABLE ?auto_381501 ) ( SURFACE-AT ?auto_381495 ?auto_381496 ) ( ON ?auto_381495 ?auto_381497 ) ( CLEAR ?auto_381495 ) ( not ( = ?auto_381494 ?auto_381497 ) ) ( not ( = ?auto_381495 ?auto_381497 ) ) ( not ( = ?auto_381493 ?auto_381497 ) ) ( TRUCK-AT ?auto_381498 ?auto_381499 ) ( SURFACE-AT ?auto_381493 ?auto_381499 ) ( CLEAR ?auto_381493 ) ( LIFTING ?auto_381500 ?auto_381494 ) ( IS-CRATE ?auto_381494 ) ( ON ?auto_381489 ?auto_381488 ) ( ON ?auto_381490 ?auto_381489 ) ( ON ?auto_381491 ?auto_381490 ) ( ON ?auto_381492 ?auto_381491 ) ( ON ?auto_381493 ?auto_381492 ) ( not ( = ?auto_381488 ?auto_381489 ) ) ( not ( = ?auto_381488 ?auto_381490 ) ) ( not ( = ?auto_381488 ?auto_381491 ) ) ( not ( = ?auto_381488 ?auto_381492 ) ) ( not ( = ?auto_381488 ?auto_381493 ) ) ( not ( = ?auto_381488 ?auto_381494 ) ) ( not ( = ?auto_381488 ?auto_381495 ) ) ( not ( = ?auto_381488 ?auto_381497 ) ) ( not ( = ?auto_381489 ?auto_381490 ) ) ( not ( = ?auto_381489 ?auto_381491 ) ) ( not ( = ?auto_381489 ?auto_381492 ) ) ( not ( = ?auto_381489 ?auto_381493 ) ) ( not ( = ?auto_381489 ?auto_381494 ) ) ( not ( = ?auto_381489 ?auto_381495 ) ) ( not ( = ?auto_381489 ?auto_381497 ) ) ( not ( = ?auto_381490 ?auto_381491 ) ) ( not ( = ?auto_381490 ?auto_381492 ) ) ( not ( = ?auto_381490 ?auto_381493 ) ) ( not ( = ?auto_381490 ?auto_381494 ) ) ( not ( = ?auto_381490 ?auto_381495 ) ) ( not ( = ?auto_381490 ?auto_381497 ) ) ( not ( = ?auto_381491 ?auto_381492 ) ) ( not ( = ?auto_381491 ?auto_381493 ) ) ( not ( = ?auto_381491 ?auto_381494 ) ) ( not ( = ?auto_381491 ?auto_381495 ) ) ( not ( = ?auto_381491 ?auto_381497 ) ) ( not ( = ?auto_381492 ?auto_381493 ) ) ( not ( = ?auto_381492 ?auto_381494 ) ) ( not ( = ?auto_381492 ?auto_381495 ) ) ( not ( = ?auto_381492 ?auto_381497 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_381493 ?auto_381494 ?auto_381495 )
      ( MAKE-7CRATE-VERIFY ?auto_381488 ?auto_381489 ?auto_381490 ?auto_381491 ?auto_381492 ?auto_381493 ?auto_381494 ?auto_381495 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_381566 - SURFACE
      ?auto_381567 - SURFACE
      ?auto_381568 - SURFACE
      ?auto_381569 - SURFACE
      ?auto_381570 - SURFACE
      ?auto_381571 - SURFACE
      ?auto_381572 - SURFACE
      ?auto_381573 - SURFACE
    )
    :vars
    (
      ?auto_381576 - HOIST
      ?auto_381577 - PLACE
      ?auto_381575 - PLACE
      ?auto_381574 - HOIST
      ?auto_381578 - SURFACE
      ?auto_381579 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_381576 ?auto_381577 ) ( IS-CRATE ?auto_381573 ) ( not ( = ?auto_381572 ?auto_381573 ) ) ( not ( = ?auto_381571 ?auto_381572 ) ) ( not ( = ?auto_381571 ?auto_381573 ) ) ( not ( = ?auto_381575 ?auto_381577 ) ) ( HOIST-AT ?auto_381574 ?auto_381575 ) ( not ( = ?auto_381576 ?auto_381574 ) ) ( AVAILABLE ?auto_381574 ) ( SURFACE-AT ?auto_381573 ?auto_381575 ) ( ON ?auto_381573 ?auto_381578 ) ( CLEAR ?auto_381573 ) ( not ( = ?auto_381572 ?auto_381578 ) ) ( not ( = ?auto_381573 ?auto_381578 ) ) ( not ( = ?auto_381571 ?auto_381578 ) ) ( TRUCK-AT ?auto_381579 ?auto_381577 ) ( SURFACE-AT ?auto_381571 ?auto_381577 ) ( CLEAR ?auto_381571 ) ( IS-CRATE ?auto_381572 ) ( AVAILABLE ?auto_381576 ) ( IN ?auto_381572 ?auto_381579 ) ( ON ?auto_381567 ?auto_381566 ) ( ON ?auto_381568 ?auto_381567 ) ( ON ?auto_381569 ?auto_381568 ) ( ON ?auto_381570 ?auto_381569 ) ( ON ?auto_381571 ?auto_381570 ) ( not ( = ?auto_381566 ?auto_381567 ) ) ( not ( = ?auto_381566 ?auto_381568 ) ) ( not ( = ?auto_381566 ?auto_381569 ) ) ( not ( = ?auto_381566 ?auto_381570 ) ) ( not ( = ?auto_381566 ?auto_381571 ) ) ( not ( = ?auto_381566 ?auto_381572 ) ) ( not ( = ?auto_381566 ?auto_381573 ) ) ( not ( = ?auto_381566 ?auto_381578 ) ) ( not ( = ?auto_381567 ?auto_381568 ) ) ( not ( = ?auto_381567 ?auto_381569 ) ) ( not ( = ?auto_381567 ?auto_381570 ) ) ( not ( = ?auto_381567 ?auto_381571 ) ) ( not ( = ?auto_381567 ?auto_381572 ) ) ( not ( = ?auto_381567 ?auto_381573 ) ) ( not ( = ?auto_381567 ?auto_381578 ) ) ( not ( = ?auto_381568 ?auto_381569 ) ) ( not ( = ?auto_381568 ?auto_381570 ) ) ( not ( = ?auto_381568 ?auto_381571 ) ) ( not ( = ?auto_381568 ?auto_381572 ) ) ( not ( = ?auto_381568 ?auto_381573 ) ) ( not ( = ?auto_381568 ?auto_381578 ) ) ( not ( = ?auto_381569 ?auto_381570 ) ) ( not ( = ?auto_381569 ?auto_381571 ) ) ( not ( = ?auto_381569 ?auto_381572 ) ) ( not ( = ?auto_381569 ?auto_381573 ) ) ( not ( = ?auto_381569 ?auto_381578 ) ) ( not ( = ?auto_381570 ?auto_381571 ) ) ( not ( = ?auto_381570 ?auto_381572 ) ) ( not ( = ?auto_381570 ?auto_381573 ) ) ( not ( = ?auto_381570 ?auto_381578 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_381571 ?auto_381572 ?auto_381573 )
      ( MAKE-7CRATE-VERIFY ?auto_381566 ?auto_381567 ?auto_381568 ?auto_381569 ?auto_381570 ?auto_381571 ?auto_381572 ?auto_381573 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_384456 - SURFACE
      ?auto_384457 - SURFACE
      ?auto_384458 - SURFACE
      ?auto_384459 - SURFACE
      ?auto_384460 - SURFACE
      ?auto_384461 - SURFACE
      ?auto_384462 - SURFACE
      ?auto_384463 - SURFACE
      ?auto_384464 - SURFACE
    )
    :vars
    (
      ?auto_384465 - HOIST
      ?auto_384466 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_384465 ?auto_384466 ) ( SURFACE-AT ?auto_384463 ?auto_384466 ) ( CLEAR ?auto_384463 ) ( LIFTING ?auto_384465 ?auto_384464 ) ( IS-CRATE ?auto_384464 ) ( not ( = ?auto_384463 ?auto_384464 ) ) ( ON ?auto_384457 ?auto_384456 ) ( ON ?auto_384458 ?auto_384457 ) ( ON ?auto_384459 ?auto_384458 ) ( ON ?auto_384460 ?auto_384459 ) ( ON ?auto_384461 ?auto_384460 ) ( ON ?auto_384462 ?auto_384461 ) ( ON ?auto_384463 ?auto_384462 ) ( not ( = ?auto_384456 ?auto_384457 ) ) ( not ( = ?auto_384456 ?auto_384458 ) ) ( not ( = ?auto_384456 ?auto_384459 ) ) ( not ( = ?auto_384456 ?auto_384460 ) ) ( not ( = ?auto_384456 ?auto_384461 ) ) ( not ( = ?auto_384456 ?auto_384462 ) ) ( not ( = ?auto_384456 ?auto_384463 ) ) ( not ( = ?auto_384456 ?auto_384464 ) ) ( not ( = ?auto_384457 ?auto_384458 ) ) ( not ( = ?auto_384457 ?auto_384459 ) ) ( not ( = ?auto_384457 ?auto_384460 ) ) ( not ( = ?auto_384457 ?auto_384461 ) ) ( not ( = ?auto_384457 ?auto_384462 ) ) ( not ( = ?auto_384457 ?auto_384463 ) ) ( not ( = ?auto_384457 ?auto_384464 ) ) ( not ( = ?auto_384458 ?auto_384459 ) ) ( not ( = ?auto_384458 ?auto_384460 ) ) ( not ( = ?auto_384458 ?auto_384461 ) ) ( not ( = ?auto_384458 ?auto_384462 ) ) ( not ( = ?auto_384458 ?auto_384463 ) ) ( not ( = ?auto_384458 ?auto_384464 ) ) ( not ( = ?auto_384459 ?auto_384460 ) ) ( not ( = ?auto_384459 ?auto_384461 ) ) ( not ( = ?auto_384459 ?auto_384462 ) ) ( not ( = ?auto_384459 ?auto_384463 ) ) ( not ( = ?auto_384459 ?auto_384464 ) ) ( not ( = ?auto_384460 ?auto_384461 ) ) ( not ( = ?auto_384460 ?auto_384462 ) ) ( not ( = ?auto_384460 ?auto_384463 ) ) ( not ( = ?auto_384460 ?auto_384464 ) ) ( not ( = ?auto_384461 ?auto_384462 ) ) ( not ( = ?auto_384461 ?auto_384463 ) ) ( not ( = ?auto_384461 ?auto_384464 ) ) ( not ( = ?auto_384462 ?auto_384463 ) ) ( not ( = ?auto_384462 ?auto_384464 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_384463 ?auto_384464 )
      ( MAKE-8CRATE-VERIFY ?auto_384456 ?auto_384457 ?auto_384458 ?auto_384459 ?auto_384460 ?auto_384461 ?auto_384462 ?auto_384463 ?auto_384464 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_384523 - SURFACE
      ?auto_384524 - SURFACE
      ?auto_384525 - SURFACE
      ?auto_384526 - SURFACE
      ?auto_384527 - SURFACE
      ?auto_384528 - SURFACE
      ?auto_384529 - SURFACE
      ?auto_384530 - SURFACE
      ?auto_384531 - SURFACE
    )
    :vars
    (
      ?auto_384532 - HOIST
      ?auto_384534 - PLACE
      ?auto_384533 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_384532 ?auto_384534 ) ( SURFACE-AT ?auto_384530 ?auto_384534 ) ( CLEAR ?auto_384530 ) ( IS-CRATE ?auto_384531 ) ( not ( = ?auto_384530 ?auto_384531 ) ) ( TRUCK-AT ?auto_384533 ?auto_384534 ) ( AVAILABLE ?auto_384532 ) ( IN ?auto_384531 ?auto_384533 ) ( ON ?auto_384530 ?auto_384529 ) ( not ( = ?auto_384529 ?auto_384530 ) ) ( not ( = ?auto_384529 ?auto_384531 ) ) ( ON ?auto_384524 ?auto_384523 ) ( ON ?auto_384525 ?auto_384524 ) ( ON ?auto_384526 ?auto_384525 ) ( ON ?auto_384527 ?auto_384526 ) ( ON ?auto_384528 ?auto_384527 ) ( ON ?auto_384529 ?auto_384528 ) ( not ( = ?auto_384523 ?auto_384524 ) ) ( not ( = ?auto_384523 ?auto_384525 ) ) ( not ( = ?auto_384523 ?auto_384526 ) ) ( not ( = ?auto_384523 ?auto_384527 ) ) ( not ( = ?auto_384523 ?auto_384528 ) ) ( not ( = ?auto_384523 ?auto_384529 ) ) ( not ( = ?auto_384523 ?auto_384530 ) ) ( not ( = ?auto_384523 ?auto_384531 ) ) ( not ( = ?auto_384524 ?auto_384525 ) ) ( not ( = ?auto_384524 ?auto_384526 ) ) ( not ( = ?auto_384524 ?auto_384527 ) ) ( not ( = ?auto_384524 ?auto_384528 ) ) ( not ( = ?auto_384524 ?auto_384529 ) ) ( not ( = ?auto_384524 ?auto_384530 ) ) ( not ( = ?auto_384524 ?auto_384531 ) ) ( not ( = ?auto_384525 ?auto_384526 ) ) ( not ( = ?auto_384525 ?auto_384527 ) ) ( not ( = ?auto_384525 ?auto_384528 ) ) ( not ( = ?auto_384525 ?auto_384529 ) ) ( not ( = ?auto_384525 ?auto_384530 ) ) ( not ( = ?auto_384525 ?auto_384531 ) ) ( not ( = ?auto_384526 ?auto_384527 ) ) ( not ( = ?auto_384526 ?auto_384528 ) ) ( not ( = ?auto_384526 ?auto_384529 ) ) ( not ( = ?auto_384526 ?auto_384530 ) ) ( not ( = ?auto_384526 ?auto_384531 ) ) ( not ( = ?auto_384527 ?auto_384528 ) ) ( not ( = ?auto_384527 ?auto_384529 ) ) ( not ( = ?auto_384527 ?auto_384530 ) ) ( not ( = ?auto_384527 ?auto_384531 ) ) ( not ( = ?auto_384528 ?auto_384529 ) ) ( not ( = ?auto_384528 ?auto_384530 ) ) ( not ( = ?auto_384528 ?auto_384531 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_384529 ?auto_384530 ?auto_384531 )
      ( MAKE-8CRATE-VERIFY ?auto_384523 ?auto_384524 ?auto_384525 ?auto_384526 ?auto_384527 ?auto_384528 ?auto_384529 ?auto_384530 ?auto_384531 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_384599 - SURFACE
      ?auto_384600 - SURFACE
      ?auto_384601 - SURFACE
      ?auto_384602 - SURFACE
      ?auto_384603 - SURFACE
      ?auto_384604 - SURFACE
      ?auto_384605 - SURFACE
      ?auto_384606 - SURFACE
      ?auto_384607 - SURFACE
    )
    :vars
    (
      ?auto_384608 - HOIST
      ?auto_384610 - PLACE
      ?auto_384609 - TRUCK
      ?auto_384611 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_384608 ?auto_384610 ) ( SURFACE-AT ?auto_384606 ?auto_384610 ) ( CLEAR ?auto_384606 ) ( IS-CRATE ?auto_384607 ) ( not ( = ?auto_384606 ?auto_384607 ) ) ( AVAILABLE ?auto_384608 ) ( IN ?auto_384607 ?auto_384609 ) ( ON ?auto_384606 ?auto_384605 ) ( not ( = ?auto_384605 ?auto_384606 ) ) ( not ( = ?auto_384605 ?auto_384607 ) ) ( TRUCK-AT ?auto_384609 ?auto_384611 ) ( not ( = ?auto_384611 ?auto_384610 ) ) ( ON ?auto_384600 ?auto_384599 ) ( ON ?auto_384601 ?auto_384600 ) ( ON ?auto_384602 ?auto_384601 ) ( ON ?auto_384603 ?auto_384602 ) ( ON ?auto_384604 ?auto_384603 ) ( ON ?auto_384605 ?auto_384604 ) ( not ( = ?auto_384599 ?auto_384600 ) ) ( not ( = ?auto_384599 ?auto_384601 ) ) ( not ( = ?auto_384599 ?auto_384602 ) ) ( not ( = ?auto_384599 ?auto_384603 ) ) ( not ( = ?auto_384599 ?auto_384604 ) ) ( not ( = ?auto_384599 ?auto_384605 ) ) ( not ( = ?auto_384599 ?auto_384606 ) ) ( not ( = ?auto_384599 ?auto_384607 ) ) ( not ( = ?auto_384600 ?auto_384601 ) ) ( not ( = ?auto_384600 ?auto_384602 ) ) ( not ( = ?auto_384600 ?auto_384603 ) ) ( not ( = ?auto_384600 ?auto_384604 ) ) ( not ( = ?auto_384600 ?auto_384605 ) ) ( not ( = ?auto_384600 ?auto_384606 ) ) ( not ( = ?auto_384600 ?auto_384607 ) ) ( not ( = ?auto_384601 ?auto_384602 ) ) ( not ( = ?auto_384601 ?auto_384603 ) ) ( not ( = ?auto_384601 ?auto_384604 ) ) ( not ( = ?auto_384601 ?auto_384605 ) ) ( not ( = ?auto_384601 ?auto_384606 ) ) ( not ( = ?auto_384601 ?auto_384607 ) ) ( not ( = ?auto_384602 ?auto_384603 ) ) ( not ( = ?auto_384602 ?auto_384604 ) ) ( not ( = ?auto_384602 ?auto_384605 ) ) ( not ( = ?auto_384602 ?auto_384606 ) ) ( not ( = ?auto_384602 ?auto_384607 ) ) ( not ( = ?auto_384603 ?auto_384604 ) ) ( not ( = ?auto_384603 ?auto_384605 ) ) ( not ( = ?auto_384603 ?auto_384606 ) ) ( not ( = ?auto_384603 ?auto_384607 ) ) ( not ( = ?auto_384604 ?auto_384605 ) ) ( not ( = ?auto_384604 ?auto_384606 ) ) ( not ( = ?auto_384604 ?auto_384607 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_384605 ?auto_384606 ?auto_384607 )
      ( MAKE-8CRATE-VERIFY ?auto_384599 ?auto_384600 ?auto_384601 ?auto_384602 ?auto_384603 ?auto_384604 ?auto_384605 ?auto_384606 ?auto_384607 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_384683 - SURFACE
      ?auto_384684 - SURFACE
      ?auto_384685 - SURFACE
      ?auto_384686 - SURFACE
      ?auto_384687 - SURFACE
      ?auto_384688 - SURFACE
      ?auto_384689 - SURFACE
      ?auto_384690 - SURFACE
      ?auto_384691 - SURFACE
    )
    :vars
    (
      ?auto_384694 - HOIST
      ?auto_384696 - PLACE
      ?auto_384695 - TRUCK
      ?auto_384693 - PLACE
      ?auto_384692 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_384694 ?auto_384696 ) ( SURFACE-AT ?auto_384690 ?auto_384696 ) ( CLEAR ?auto_384690 ) ( IS-CRATE ?auto_384691 ) ( not ( = ?auto_384690 ?auto_384691 ) ) ( AVAILABLE ?auto_384694 ) ( ON ?auto_384690 ?auto_384689 ) ( not ( = ?auto_384689 ?auto_384690 ) ) ( not ( = ?auto_384689 ?auto_384691 ) ) ( TRUCK-AT ?auto_384695 ?auto_384693 ) ( not ( = ?auto_384693 ?auto_384696 ) ) ( HOIST-AT ?auto_384692 ?auto_384693 ) ( LIFTING ?auto_384692 ?auto_384691 ) ( not ( = ?auto_384694 ?auto_384692 ) ) ( ON ?auto_384684 ?auto_384683 ) ( ON ?auto_384685 ?auto_384684 ) ( ON ?auto_384686 ?auto_384685 ) ( ON ?auto_384687 ?auto_384686 ) ( ON ?auto_384688 ?auto_384687 ) ( ON ?auto_384689 ?auto_384688 ) ( not ( = ?auto_384683 ?auto_384684 ) ) ( not ( = ?auto_384683 ?auto_384685 ) ) ( not ( = ?auto_384683 ?auto_384686 ) ) ( not ( = ?auto_384683 ?auto_384687 ) ) ( not ( = ?auto_384683 ?auto_384688 ) ) ( not ( = ?auto_384683 ?auto_384689 ) ) ( not ( = ?auto_384683 ?auto_384690 ) ) ( not ( = ?auto_384683 ?auto_384691 ) ) ( not ( = ?auto_384684 ?auto_384685 ) ) ( not ( = ?auto_384684 ?auto_384686 ) ) ( not ( = ?auto_384684 ?auto_384687 ) ) ( not ( = ?auto_384684 ?auto_384688 ) ) ( not ( = ?auto_384684 ?auto_384689 ) ) ( not ( = ?auto_384684 ?auto_384690 ) ) ( not ( = ?auto_384684 ?auto_384691 ) ) ( not ( = ?auto_384685 ?auto_384686 ) ) ( not ( = ?auto_384685 ?auto_384687 ) ) ( not ( = ?auto_384685 ?auto_384688 ) ) ( not ( = ?auto_384685 ?auto_384689 ) ) ( not ( = ?auto_384685 ?auto_384690 ) ) ( not ( = ?auto_384685 ?auto_384691 ) ) ( not ( = ?auto_384686 ?auto_384687 ) ) ( not ( = ?auto_384686 ?auto_384688 ) ) ( not ( = ?auto_384686 ?auto_384689 ) ) ( not ( = ?auto_384686 ?auto_384690 ) ) ( not ( = ?auto_384686 ?auto_384691 ) ) ( not ( = ?auto_384687 ?auto_384688 ) ) ( not ( = ?auto_384687 ?auto_384689 ) ) ( not ( = ?auto_384687 ?auto_384690 ) ) ( not ( = ?auto_384687 ?auto_384691 ) ) ( not ( = ?auto_384688 ?auto_384689 ) ) ( not ( = ?auto_384688 ?auto_384690 ) ) ( not ( = ?auto_384688 ?auto_384691 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_384689 ?auto_384690 ?auto_384691 )
      ( MAKE-8CRATE-VERIFY ?auto_384683 ?auto_384684 ?auto_384685 ?auto_384686 ?auto_384687 ?auto_384688 ?auto_384689 ?auto_384690 ?auto_384691 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_384775 - SURFACE
      ?auto_384776 - SURFACE
      ?auto_384777 - SURFACE
      ?auto_384778 - SURFACE
      ?auto_384779 - SURFACE
      ?auto_384780 - SURFACE
      ?auto_384781 - SURFACE
      ?auto_384782 - SURFACE
      ?auto_384783 - SURFACE
    )
    :vars
    (
      ?auto_384789 - HOIST
      ?auto_384788 - PLACE
      ?auto_384784 - TRUCK
      ?auto_384786 - PLACE
      ?auto_384787 - HOIST
      ?auto_384785 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_384789 ?auto_384788 ) ( SURFACE-AT ?auto_384782 ?auto_384788 ) ( CLEAR ?auto_384782 ) ( IS-CRATE ?auto_384783 ) ( not ( = ?auto_384782 ?auto_384783 ) ) ( AVAILABLE ?auto_384789 ) ( ON ?auto_384782 ?auto_384781 ) ( not ( = ?auto_384781 ?auto_384782 ) ) ( not ( = ?auto_384781 ?auto_384783 ) ) ( TRUCK-AT ?auto_384784 ?auto_384786 ) ( not ( = ?auto_384786 ?auto_384788 ) ) ( HOIST-AT ?auto_384787 ?auto_384786 ) ( not ( = ?auto_384789 ?auto_384787 ) ) ( AVAILABLE ?auto_384787 ) ( SURFACE-AT ?auto_384783 ?auto_384786 ) ( ON ?auto_384783 ?auto_384785 ) ( CLEAR ?auto_384783 ) ( not ( = ?auto_384782 ?auto_384785 ) ) ( not ( = ?auto_384783 ?auto_384785 ) ) ( not ( = ?auto_384781 ?auto_384785 ) ) ( ON ?auto_384776 ?auto_384775 ) ( ON ?auto_384777 ?auto_384776 ) ( ON ?auto_384778 ?auto_384777 ) ( ON ?auto_384779 ?auto_384778 ) ( ON ?auto_384780 ?auto_384779 ) ( ON ?auto_384781 ?auto_384780 ) ( not ( = ?auto_384775 ?auto_384776 ) ) ( not ( = ?auto_384775 ?auto_384777 ) ) ( not ( = ?auto_384775 ?auto_384778 ) ) ( not ( = ?auto_384775 ?auto_384779 ) ) ( not ( = ?auto_384775 ?auto_384780 ) ) ( not ( = ?auto_384775 ?auto_384781 ) ) ( not ( = ?auto_384775 ?auto_384782 ) ) ( not ( = ?auto_384775 ?auto_384783 ) ) ( not ( = ?auto_384775 ?auto_384785 ) ) ( not ( = ?auto_384776 ?auto_384777 ) ) ( not ( = ?auto_384776 ?auto_384778 ) ) ( not ( = ?auto_384776 ?auto_384779 ) ) ( not ( = ?auto_384776 ?auto_384780 ) ) ( not ( = ?auto_384776 ?auto_384781 ) ) ( not ( = ?auto_384776 ?auto_384782 ) ) ( not ( = ?auto_384776 ?auto_384783 ) ) ( not ( = ?auto_384776 ?auto_384785 ) ) ( not ( = ?auto_384777 ?auto_384778 ) ) ( not ( = ?auto_384777 ?auto_384779 ) ) ( not ( = ?auto_384777 ?auto_384780 ) ) ( not ( = ?auto_384777 ?auto_384781 ) ) ( not ( = ?auto_384777 ?auto_384782 ) ) ( not ( = ?auto_384777 ?auto_384783 ) ) ( not ( = ?auto_384777 ?auto_384785 ) ) ( not ( = ?auto_384778 ?auto_384779 ) ) ( not ( = ?auto_384778 ?auto_384780 ) ) ( not ( = ?auto_384778 ?auto_384781 ) ) ( not ( = ?auto_384778 ?auto_384782 ) ) ( not ( = ?auto_384778 ?auto_384783 ) ) ( not ( = ?auto_384778 ?auto_384785 ) ) ( not ( = ?auto_384779 ?auto_384780 ) ) ( not ( = ?auto_384779 ?auto_384781 ) ) ( not ( = ?auto_384779 ?auto_384782 ) ) ( not ( = ?auto_384779 ?auto_384783 ) ) ( not ( = ?auto_384779 ?auto_384785 ) ) ( not ( = ?auto_384780 ?auto_384781 ) ) ( not ( = ?auto_384780 ?auto_384782 ) ) ( not ( = ?auto_384780 ?auto_384783 ) ) ( not ( = ?auto_384780 ?auto_384785 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_384781 ?auto_384782 ?auto_384783 )
      ( MAKE-8CRATE-VERIFY ?auto_384775 ?auto_384776 ?auto_384777 ?auto_384778 ?auto_384779 ?auto_384780 ?auto_384781 ?auto_384782 ?auto_384783 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_384868 - SURFACE
      ?auto_384869 - SURFACE
      ?auto_384870 - SURFACE
      ?auto_384871 - SURFACE
      ?auto_384872 - SURFACE
      ?auto_384873 - SURFACE
      ?auto_384874 - SURFACE
      ?auto_384875 - SURFACE
      ?auto_384876 - SURFACE
    )
    :vars
    (
      ?auto_384879 - HOIST
      ?auto_384881 - PLACE
      ?auto_384878 - PLACE
      ?auto_384882 - HOIST
      ?auto_384880 - SURFACE
      ?auto_384877 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_384879 ?auto_384881 ) ( SURFACE-AT ?auto_384875 ?auto_384881 ) ( CLEAR ?auto_384875 ) ( IS-CRATE ?auto_384876 ) ( not ( = ?auto_384875 ?auto_384876 ) ) ( AVAILABLE ?auto_384879 ) ( ON ?auto_384875 ?auto_384874 ) ( not ( = ?auto_384874 ?auto_384875 ) ) ( not ( = ?auto_384874 ?auto_384876 ) ) ( not ( = ?auto_384878 ?auto_384881 ) ) ( HOIST-AT ?auto_384882 ?auto_384878 ) ( not ( = ?auto_384879 ?auto_384882 ) ) ( AVAILABLE ?auto_384882 ) ( SURFACE-AT ?auto_384876 ?auto_384878 ) ( ON ?auto_384876 ?auto_384880 ) ( CLEAR ?auto_384876 ) ( not ( = ?auto_384875 ?auto_384880 ) ) ( not ( = ?auto_384876 ?auto_384880 ) ) ( not ( = ?auto_384874 ?auto_384880 ) ) ( TRUCK-AT ?auto_384877 ?auto_384881 ) ( ON ?auto_384869 ?auto_384868 ) ( ON ?auto_384870 ?auto_384869 ) ( ON ?auto_384871 ?auto_384870 ) ( ON ?auto_384872 ?auto_384871 ) ( ON ?auto_384873 ?auto_384872 ) ( ON ?auto_384874 ?auto_384873 ) ( not ( = ?auto_384868 ?auto_384869 ) ) ( not ( = ?auto_384868 ?auto_384870 ) ) ( not ( = ?auto_384868 ?auto_384871 ) ) ( not ( = ?auto_384868 ?auto_384872 ) ) ( not ( = ?auto_384868 ?auto_384873 ) ) ( not ( = ?auto_384868 ?auto_384874 ) ) ( not ( = ?auto_384868 ?auto_384875 ) ) ( not ( = ?auto_384868 ?auto_384876 ) ) ( not ( = ?auto_384868 ?auto_384880 ) ) ( not ( = ?auto_384869 ?auto_384870 ) ) ( not ( = ?auto_384869 ?auto_384871 ) ) ( not ( = ?auto_384869 ?auto_384872 ) ) ( not ( = ?auto_384869 ?auto_384873 ) ) ( not ( = ?auto_384869 ?auto_384874 ) ) ( not ( = ?auto_384869 ?auto_384875 ) ) ( not ( = ?auto_384869 ?auto_384876 ) ) ( not ( = ?auto_384869 ?auto_384880 ) ) ( not ( = ?auto_384870 ?auto_384871 ) ) ( not ( = ?auto_384870 ?auto_384872 ) ) ( not ( = ?auto_384870 ?auto_384873 ) ) ( not ( = ?auto_384870 ?auto_384874 ) ) ( not ( = ?auto_384870 ?auto_384875 ) ) ( not ( = ?auto_384870 ?auto_384876 ) ) ( not ( = ?auto_384870 ?auto_384880 ) ) ( not ( = ?auto_384871 ?auto_384872 ) ) ( not ( = ?auto_384871 ?auto_384873 ) ) ( not ( = ?auto_384871 ?auto_384874 ) ) ( not ( = ?auto_384871 ?auto_384875 ) ) ( not ( = ?auto_384871 ?auto_384876 ) ) ( not ( = ?auto_384871 ?auto_384880 ) ) ( not ( = ?auto_384872 ?auto_384873 ) ) ( not ( = ?auto_384872 ?auto_384874 ) ) ( not ( = ?auto_384872 ?auto_384875 ) ) ( not ( = ?auto_384872 ?auto_384876 ) ) ( not ( = ?auto_384872 ?auto_384880 ) ) ( not ( = ?auto_384873 ?auto_384874 ) ) ( not ( = ?auto_384873 ?auto_384875 ) ) ( not ( = ?auto_384873 ?auto_384876 ) ) ( not ( = ?auto_384873 ?auto_384880 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_384874 ?auto_384875 ?auto_384876 )
      ( MAKE-8CRATE-VERIFY ?auto_384868 ?auto_384869 ?auto_384870 ?auto_384871 ?auto_384872 ?auto_384873 ?auto_384874 ?auto_384875 ?auto_384876 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_384961 - SURFACE
      ?auto_384962 - SURFACE
      ?auto_384963 - SURFACE
      ?auto_384964 - SURFACE
      ?auto_384965 - SURFACE
      ?auto_384966 - SURFACE
      ?auto_384967 - SURFACE
      ?auto_384968 - SURFACE
      ?auto_384969 - SURFACE
    )
    :vars
    (
      ?auto_384970 - HOIST
      ?auto_384972 - PLACE
      ?auto_384971 - PLACE
      ?auto_384973 - HOIST
      ?auto_384975 - SURFACE
      ?auto_384974 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_384970 ?auto_384972 ) ( IS-CRATE ?auto_384969 ) ( not ( = ?auto_384968 ?auto_384969 ) ) ( not ( = ?auto_384967 ?auto_384968 ) ) ( not ( = ?auto_384967 ?auto_384969 ) ) ( not ( = ?auto_384971 ?auto_384972 ) ) ( HOIST-AT ?auto_384973 ?auto_384971 ) ( not ( = ?auto_384970 ?auto_384973 ) ) ( AVAILABLE ?auto_384973 ) ( SURFACE-AT ?auto_384969 ?auto_384971 ) ( ON ?auto_384969 ?auto_384975 ) ( CLEAR ?auto_384969 ) ( not ( = ?auto_384968 ?auto_384975 ) ) ( not ( = ?auto_384969 ?auto_384975 ) ) ( not ( = ?auto_384967 ?auto_384975 ) ) ( TRUCK-AT ?auto_384974 ?auto_384972 ) ( SURFACE-AT ?auto_384967 ?auto_384972 ) ( CLEAR ?auto_384967 ) ( LIFTING ?auto_384970 ?auto_384968 ) ( IS-CRATE ?auto_384968 ) ( ON ?auto_384962 ?auto_384961 ) ( ON ?auto_384963 ?auto_384962 ) ( ON ?auto_384964 ?auto_384963 ) ( ON ?auto_384965 ?auto_384964 ) ( ON ?auto_384966 ?auto_384965 ) ( ON ?auto_384967 ?auto_384966 ) ( not ( = ?auto_384961 ?auto_384962 ) ) ( not ( = ?auto_384961 ?auto_384963 ) ) ( not ( = ?auto_384961 ?auto_384964 ) ) ( not ( = ?auto_384961 ?auto_384965 ) ) ( not ( = ?auto_384961 ?auto_384966 ) ) ( not ( = ?auto_384961 ?auto_384967 ) ) ( not ( = ?auto_384961 ?auto_384968 ) ) ( not ( = ?auto_384961 ?auto_384969 ) ) ( not ( = ?auto_384961 ?auto_384975 ) ) ( not ( = ?auto_384962 ?auto_384963 ) ) ( not ( = ?auto_384962 ?auto_384964 ) ) ( not ( = ?auto_384962 ?auto_384965 ) ) ( not ( = ?auto_384962 ?auto_384966 ) ) ( not ( = ?auto_384962 ?auto_384967 ) ) ( not ( = ?auto_384962 ?auto_384968 ) ) ( not ( = ?auto_384962 ?auto_384969 ) ) ( not ( = ?auto_384962 ?auto_384975 ) ) ( not ( = ?auto_384963 ?auto_384964 ) ) ( not ( = ?auto_384963 ?auto_384965 ) ) ( not ( = ?auto_384963 ?auto_384966 ) ) ( not ( = ?auto_384963 ?auto_384967 ) ) ( not ( = ?auto_384963 ?auto_384968 ) ) ( not ( = ?auto_384963 ?auto_384969 ) ) ( not ( = ?auto_384963 ?auto_384975 ) ) ( not ( = ?auto_384964 ?auto_384965 ) ) ( not ( = ?auto_384964 ?auto_384966 ) ) ( not ( = ?auto_384964 ?auto_384967 ) ) ( not ( = ?auto_384964 ?auto_384968 ) ) ( not ( = ?auto_384964 ?auto_384969 ) ) ( not ( = ?auto_384964 ?auto_384975 ) ) ( not ( = ?auto_384965 ?auto_384966 ) ) ( not ( = ?auto_384965 ?auto_384967 ) ) ( not ( = ?auto_384965 ?auto_384968 ) ) ( not ( = ?auto_384965 ?auto_384969 ) ) ( not ( = ?auto_384965 ?auto_384975 ) ) ( not ( = ?auto_384966 ?auto_384967 ) ) ( not ( = ?auto_384966 ?auto_384968 ) ) ( not ( = ?auto_384966 ?auto_384969 ) ) ( not ( = ?auto_384966 ?auto_384975 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_384967 ?auto_384968 ?auto_384969 )
      ( MAKE-8CRATE-VERIFY ?auto_384961 ?auto_384962 ?auto_384963 ?auto_384964 ?auto_384965 ?auto_384966 ?auto_384967 ?auto_384968 ?auto_384969 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_385054 - SURFACE
      ?auto_385055 - SURFACE
      ?auto_385056 - SURFACE
      ?auto_385057 - SURFACE
      ?auto_385058 - SURFACE
      ?auto_385059 - SURFACE
      ?auto_385060 - SURFACE
      ?auto_385061 - SURFACE
      ?auto_385062 - SURFACE
    )
    :vars
    (
      ?auto_385063 - HOIST
      ?auto_385067 - PLACE
      ?auto_385064 - PLACE
      ?auto_385066 - HOIST
      ?auto_385065 - SURFACE
      ?auto_385068 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_385063 ?auto_385067 ) ( IS-CRATE ?auto_385062 ) ( not ( = ?auto_385061 ?auto_385062 ) ) ( not ( = ?auto_385060 ?auto_385061 ) ) ( not ( = ?auto_385060 ?auto_385062 ) ) ( not ( = ?auto_385064 ?auto_385067 ) ) ( HOIST-AT ?auto_385066 ?auto_385064 ) ( not ( = ?auto_385063 ?auto_385066 ) ) ( AVAILABLE ?auto_385066 ) ( SURFACE-AT ?auto_385062 ?auto_385064 ) ( ON ?auto_385062 ?auto_385065 ) ( CLEAR ?auto_385062 ) ( not ( = ?auto_385061 ?auto_385065 ) ) ( not ( = ?auto_385062 ?auto_385065 ) ) ( not ( = ?auto_385060 ?auto_385065 ) ) ( TRUCK-AT ?auto_385068 ?auto_385067 ) ( SURFACE-AT ?auto_385060 ?auto_385067 ) ( CLEAR ?auto_385060 ) ( IS-CRATE ?auto_385061 ) ( AVAILABLE ?auto_385063 ) ( IN ?auto_385061 ?auto_385068 ) ( ON ?auto_385055 ?auto_385054 ) ( ON ?auto_385056 ?auto_385055 ) ( ON ?auto_385057 ?auto_385056 ) ( ON ?auto_385058 ?auto_385057 ) ( ON ?auto_385059 ?auto_385058 ) ( ON ?auto_385060 ?auto_385059 ) ( not ( = ?auto_385054 ?auto_385055 ) ) ( not ( = ?auto_385054 ?auto_385056 ) ) ( not ( = ?auto_385054 ?auto_385057 ) ) ( not ( = ?auto_385054 ?auto_385058 ) ) ( not ( = ?auto_385054 ?auto_385059 ) ) ( not ( = ?auto_385054 ?auto_385060 ) ) ( not ( = ?auto_385054 ?auto_385061 ) ) ( not ( = ?auto_385054 ?auto_385062 ) ) ( not ( = ?auto_385054 ?auto_385065 ) ) ( not ( = ?auto_385055 ?auto_385056 ) ) ( not ( = ?auto_385055 ?auto_385057 ) ) ( not ( = ?auto_385055 ?auto_385058 ) ) ( not ( = ?auto_385055 ?auto_385059 ) ) ( not ( = ?auto_385055 ?auto_385060 ) ) ( not ( = ?auto_385055 ?auto_385061 ) ) ( not ( = ?auto_385055 ?auto_385062 ) ) ( not ( = ?auto_385055 ?auto_385065 ) ) ( not ( = ?auto_385056 ?auto_385057 ) ) ( not ( = ?auto_385056 ?auto_385058 ) ) ( not ( = ?auto_385056 ?auto_385059 ) ) ( not ( = ?auto_385056 ?auto_385060 ) ) ( not ( = ?auto_385056 ?auto_385061 ) ) ( not ( = ?auto_385056 ?auto_385062 ) ) ( not ( = ?auto_385056 ?auto_385065 ) ) ( not ( = ?auto_385057 ?auto_385058 ) ) ( not ( = ?auto_385057 ?auto_385059 ) ) ( not ( = ?auto_385057 ?auto_385060 ) ) ( not ( = ?auto_385057 ?auto_385061 ) ) ( not ( = ?auto_385057 ?auto_385062 ) ) ( not ( = ?auto_385057 ?auto_385065 ) ) ( not ( = ?auto_385058 ?auto_385059 ) ) ( not ( = ?auto_385058 ?auto_385060 ) ) ( not ( = ?auto_385058 ?auto_385061 ) ) ( not ( = ?auto_385058 ?auto_385062 ) ) ( not ( = ?auto_385058 ?auto_385065 ) ) ( not ( = ?auto_385059 ?auto_385060 ) ) ( not ( = ?auto_385059 ?auto_385061 ) ) ( not ( = ?auto_385059 ?auto_385062 ) ) ( not ( = ?auto_385059 ?auto_385065 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_385060 ?auto_385061 ?auto_385062 )
      ( MAKE-8CRATE-VERIFY ?auto_385054 ?auto_385055 ?auto_385056 ?auto_385057 ?auto_385058 ?auto_385059 ?auto_385060 ?auto_385061 ?auto_385062 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_389170 - SURFACE
      ?auto_389171 - SURFACE
      ?auto_389172 - SURFACE
      ?auto_389173 - SURFACE
      ?auto_389174 - SURFACE
      ?auto_389175 - SURFACE
      ?auto_389176 - SURFACE
      ?auto_389177 - SURFACE
      ?auto_389178 - SURFACE
      ?auto_389179 - SURFACE
    )
    :vars
    (
      ?auto_389180 - HOIST
      ?auto_389181 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_389180 ?auto_389181 ) ( SURFACE-AT ?auto_389178 ?auto_389181 ) ( CLEAR ?auto_389178 ) ( LIFTING ?auto_389180 ?auto_389179 ) ( IS-CRATE ?auto_389179 ) ( not ( = ?auto_389178 ?auto_389179 ) ) ( ON ?auto_389171 ?auto_389170 ) ( ON ?auto_389172 ?auto_389171 ) ( ON ?auto_389173 ?auto_389172 ) ( ON ?auto_389174 ?auto_389173 ) ( ON ?auto_389175 ?auto_389174 ) ( ON ?auto_389176 ?auto_389175 ) ( ON ?auto_389177 ?auto_389176 ) ( ON ?auto_389178 ?auto_389177 ) ( not ( = ?auto_389170 ?auto_389171 ) ) ( not ( = ?auto_389170 ?auto_389172 ) ) ( not ( = ?auto_389170 ?auto_389173 ) ) ( not ( = ?auto_389170 ?auto_389174 ) ) ( not ( = ?auto_389170 ?auto_389175 ) ) ( not ( = ?auto_389170 ?auto_389176 ) ) ( not ( = ?auto_389170 ?auto_389177 ) ) ( not ( = ?auto_389170 ?auto_389178 ) ) ( not ( = ?auto_389170 ?auto_389179 ) ) ( not ( = ?auto_389171 ?auto_389172 ) ) ( not ( = ?auto_389171 ?auto_389173 ) ) ( not ( = ?auto_389171 ?auto_389174 ) ) ( not ( = ?auto_389171 ?auto_389175 ) ) ( not ( = ?auto_389171 ?auto_389176 ) ) ( not ( = ?auto_389171 ?auto_389177 ) ) ( not ( = ?auto_389171 ?auto_389178 ) ) ( not ( = ?auto_389171 ?auto_389179 ) ) ( not ( = ?auto_389172 ?auto_389173 ) ) ( not ( = ?auto_389172 ?auto_389174 ) ) ( not ( = ?auto_389172 ?auto_389175 ) ) ( not ( = ?auto_389172 ?auto_389176 ) ) ( not ( = ?auto_389172 ?auto_389177 ) ) ( not ( = ?auto_389172 ?auto_389178 ) ) ( not ( = ?auto_389172 ?auto_389179 ) ) ( not ( = ?auto_389173 ?auto_389174 ) ) ( not ( = ?auto_389173 ?auto_389175 ) ) ( not ( = ?auto_389173 ?auto_389176 ) ) ( not ( = ?auto_389173 ?auto_389177 ) ) ( not ( = ?auto_389173 ?auto_389178 ) ) ( not ( = ?auto_389173 ?auto_389179 ) ) ( not ( = ?auto_389174 ?auto_389175 ) ) ( not ( = ?auto_389174 ?auto_389176 ) ) ( not ( = ?auto_389174 ?auto_389177 ) ) ( not ( = ?auto_389174 ?auto_389178 ) ) ( not ( = ?auto_389174 ?auto_389179 ) ) ( not ( = ?auto_389175 ?auto_389176 ) ) ( not ( = ?auto_389175 ?auto_389177 ) ) ( not ( = ?auto_389175 ?auto_389178 ) ) ( not ( = ?auto_389175 ?auto_389179 ) ) ( not ( = ?auto_389176 ?auto_389177 ) ) ( not ( = ?auto_389176 ?auto_389178 ) ) ( not ( = ?auto_389176 ?auto_389179 ) ) ( not ( = ?auto_389177 ?auto_389178 ) ) ( not ( = ?auto_389177 ?auto_389179 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_389178 ?auto_389179 )
      ( MAKE-9CRATE-VERIFY ?auto_389170 ?auto_389171 ?auto_389172 ?auto_389173 ?auto_389174 ?auto_389175 ?auto_389176 ?auto_389177 ?auto_389178 ?auto_389179 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_389250 - SURFACE
      ?auto_389251 - SURFACE
      ?auto_389252 - SURFACE
      ?auto_389253 - SURFACE
      ?auto_389254 - SURFACE
      ?auto_389255 - SURFACE
      ?auto_389256 - SURFACE
      ?auto_389257 - SURFACE
      ?auto_389258 - SURFACE
      ?auto_389259 - SURFACE
    )
    :vars
    (
      ?auto_389261 - HOIST
      ?auto_389260 - PLACE
      ?auto_389262 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_389261 ?auto_389260 ) ( SURFACE-AT ?auto_389258 ?auto_389260 ) ( CLEAR ?auto_389258 ) ( IS-CRATE ?auto_389259 ) ( not ( = ?auto_389258 ?auto_389259 ) ) ( TRUCK-AT ?auto_389262 ?auto_389260 ) ( AVAILABLE ?auto_389261 ) ( IN ?auto_389259 ?auto_389262 ) ( ON ?auto_389258 ?auto_389257 ) ( not ( = ?auto_389257 ?auto_389258 ) ) ( not ( = ?auto_389257 ?auto_389259 ) ) ( ON ?auto_389251 ?auto_389250 ) ( ON ?auto_389252 ?auto_389251 ) ( ON ?auto_389253 ?auto_389252 ) ( ON ?auto_389254 ?auto_389253 ) ( ON ?auto_389255 ?auto_389254 ) ( ON ?auto_389256 ?auto_389255 ) ( ON ?auto_389257 ?auto_389256 ) ( not ( = ?auto_389250 ?auto_389251 ) ) ( not ( = ?auto_389250 ?auto_389252 ) ) ( not ( = ?auto_389250 ?auto_389253 ) ) ( not ( = ?auto_389250 ?auto_389254 ) ) ( not ( = ?auto_389250 ?auto_389255 ) ) ( not ( = ?auto_389250 ?auto_389256 ) ) ( not ( = ?auto_389250 ?auto_389257 ) ) ( not ( = ?auto_389250 ?auto_389258 ) ) ( not ( = ?auto_389250 ?auto_389259 ) ) ( not ( = ?auto_389251 ?auto_389252 ) ) ( not ( = ?auto_389251 ?auto_389253 ) ) ( not ( = ?auto_389251 ?auto_389254 ) ) ( not ( = ?auto_389251 ?auto_389255 ) ) ( not ( = ?auto_389251 ?auto_389256 ) ) ( not ( = ?auto_389251 ?auto_389257 ) ) ( not ( = ?auto_389251 ?auto_389258 ) ) ( not ( = ?auto_389251 ?auto_389259 ) ) ( not ( = ?auto_389252 ?auto_389253 ) ) ( not ( = ?auto_389252 ?auto_389254 ) ) ( not ( = ?auto_389252 ?auto_389255 ) ) ( not ( = ?auto_389252 ?auto_389256 ) ) ( not ( = ?auto_389252 ?auto_389257 ) ) ( not ( = ?auto_389252 ?auto_389258 ) ) ( not ( = ?auto_389252 ?auto_389259 ) ) ( not ( = ?auto_389253 ?auto_389254 ) ) ( not ( = ?auto_389253 ?auto_389255 ) ) ( not ( = ?auto_389253 ?auto_389256 ) ) ( not ( = ?auto_389253 ?auto_389257 ) ) ( not ( = ?auto_389253 ?auto_389258 ) ) ( not ( = ?auto_389253 ?auto_389259 ) ) ( not ( = ?auto_389254 ?auto_389255 ) ) ( not ( = ?auto_389254 ?auto_389256 ) ) ( not ( = ?auto_389254 ?auto_389257 ) ) ( not ( = ?auto_389254 ?auto_389258 ) ) ( not ( = ?auto_389254 ?auto_389259 ) ) ( not ( = ?auto_389255 ?auto_389256 ) ) ( not ( = ?auto_389255 ?auto_389257 ) ) ( not ( = ?auto_389255 ?auto_389258 ) ) ( not ( = ?auto_389255 ?auto_389259 ) ) ( not ( = ?auto_389256 ?auto_389257 ) ) ( not ( = ?auto_389256 ?auto_389258 ) ) ( not ( = ?auto_389256 ?auto_389259 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_389257 ?auto_389258 ?auto_389259 )
      ( MAKE-9CRATE-VERIFY ?auto_389250 ?auto_389251 ?auto_389252 ?auto_389253 ?auto_389254 ?auto_389255 ?auto_389256 ?auto_389257 ?auto_389258 ?auto_389259 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_389340 - SURFACE
      ?auto_389341 - SURFACE
      ?auto_389342 - SURFACE
      ?auto_389343 - SURFACE
      ?auto_389344 - SURFACE
      ?auto_389345 - SURFACE
      ?auto_389346 - SURFACE
      ?auto_389347 - SURFACE
      ?auto_389348 - SURFACE
      ?auto_389349 - SURFACE
    )
    :vars
    (
      ?auto_389351 - HOIST
      ?auto_389352 - PLACE
      ?auto_389350 - TRUCK
      ?auto_389353 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_389351 ?auto_389352 ) ( SURFACE-AT ?auto_389348 ?auto_389352 ) ( CLEAR ?auto_389348 ) ( IS-CRATE ?auto_389349 ) ( not ( = ?auto_389348 ?auto_389349 ) ) ( AVAILABLE ?auto_389351 ) ( IN ?auto_389349 ?auto_389350 ) ( ON ?auto_389348 ?auto_389347 ) ( not ( = ?auto_389347 ?auto_389348 ) ) ( not ( = ?auto_389347 ?auto_389349 ) ) ( TRUCK-AT ?auto_389350 ?auto_389353 ) ( not ( = ?auto_389353 ?auto_389352 ) ) ( ON ?auto_389341 ?auto_389340 ) ( ON ?auto_389342 ?auto_389341 ) ( ON ?auto_389343 ?auto_389342 ) ( ON ?auto_389344 ?auto_389343 ) ( ON ?auto_389345 ?auto_389344 ) ( ON ?auto_389346 ?auto_389345 ) ( ON ?auto_389347 ?auto_389346 ) ( not ( = ?auto_389340 ?auto_389341 ) ) ( not ( = ?auto_389340 ?auto_389342 ) ) ( not ( = ?auto_389340 ?auto_389343 ) ) ( not ( = ?auto_389340 ?auto_389344 ) ) ( not ( = ?auto_389340 ?auto_389345 ) ) ( not ( = ?auto_389340 ?auto_389346 ) ) ( not ( = ?auto_389340 ?auto_389347 ) ) ( not ( = ?auto_389340 ?auto_389348 ) ) ( not ( = ?auto_389340 ?auto_389349 ) ) ( not ( = ?auto_389341 ?auto_389342 ) ) ( not ( = ?auto_389341 ?auto_389343 ) ) ( not ( = ?auto_389341 ?auto_389344 ) ) ( not ( = ?auto_389341 ?auto_389345 ) ) ( not ( = ?auto_389341 ?auto_389346 ) ) ( not ( = ?auto_389341 ?auto_389347 ) ) ( not ( = ?auto_389341 ?auto_389348 ) ) ( not ( = ?auto_389341 ?auto_389349 ) ) ( not ( = ?auto_389342 ?auto_389343 ) ) ( not ( = ?auto_389342 ?auto_389344 ) ) ( not ( = ?auto_389342 ?auto_389345 ) ) ( not ( = ?auto_389342 ?auto_389346 ) ) ( not ( = ?auto_389342 ?auto_389347 ) ) ( not ( = ?auto_389342 ?auto_389348 ) ) ( not ( = ?auto_389342 ?auto_389349 ) ) ( not ( = ?auto_389343 ?auto_389344 ) ) ( not ( = ?auto_389343 ?auto_389345 ) ) ( not ( = ?auto_389343 ?auto_389346 ) ) ( not ( = ?auto_389343 ?auto_389347 ) ) ( not ( = ?auto_389343 ?auto_389348 ) ) ( not ( = ?auto_389343 ?auto_389349 ) ) ( not ( = ?auto_389344 ?auto_389345 ) ) ( not ( = ?auto_389344 ?auto_389346 ) ) ( not ( = ?auto_389344 ?auto_389347 ) ) ( not ( = ?auto_389344 ?auto_389348 ) ) ( not ( = ?auto_389344 ?auto_389349 ) ) ( not ( = ?auto_389345 ?auto_389346 ) ) ( not ( = ?auto_389345 ?auto_389347 ) ) ( not ( = ?auto_389345 ?auto_389348 ) ) ( not ( = ?auto_389345 ?auto_389349 ) ) ( not ( = ?auto_389346 ?auto_389347 ) ) ( not ( = ?auto_389346 ?auto_389348 ) ) ( not ( = ?auto_389346 ?auto_389349 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_389347 ?auto_389348 ?auto_389349 )
      ( MAKE-9CRATE-VERIFY ?auto_389340 ?auto_389341 ?auto_389342 ?auto_389343 ?auto_389344 ?auto_389345 ?auto_389346 ?auto_389347 ?auto_389348 ?auto_389349 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_389439 - SURFACE
      ?auto_389440 - SURFACE
      ?auto_389441 - SURFACE
      ?auto_389442 - SURFACE
      ?auto_389443 - SURFACE
      ?auto_389444 - SURFACE
      ?auto_389445 - SURFACE
      ?auto_389446 - SURFACE
      ?auto_389447 - SURFACE
      ?auto_389448 - SURFACE
    )
    :vars
    (
      ?auto_389452 - HOIST
      ?auto_389450 - PLACE
      ?auto_389451 - TRUCK
      ?auto_389449 - PLACE
      ?auto_389453 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_389452 ?auto_389450 ) ( SURFACE-AT ?auto_389447 ?auto_389450 ) ( CLEAR ?auto_389447 ) ( IS-CRATE ?auto_389448 ) ( not ( = ?auto_389447 ?auto_389448 ) ) ( AVAILABLE ?auto_389452 ) ( ON ?auto_389447 ?auto_389446 ) ( not ( = ?auto_389446 ?auto_389447 ) ) ( not ( = ?auto_389446 ?auto_389448 ) ) ( TRUCK-AT ?auto_389451 ?auto_389449 ) ( not ( = ?auto_389449 ?auto_389450 ) ) ( HOIST-AT ?auto_389453 ?auto_389449 ) ( LIFTING ?auto_389453 ?auto_389448 ) ( not ( = ?auto_389452 ?auto_389453 ) ) ( ON ?auto_389440 ?auto_389439 ) ( ON ?auto_389441 ?auto_389440 ) ( ON ?auto_389442 ?auto_389441 ) ( ON ?auto_389443 ?auto_389442 ) ( ON ?auto_389444 ?auto_389443 ) ( ON ?auto_389445 ?auto_389444 ) ( ON ?auto_389446 ?auto_389445 ) ( not ( = ?auto_389439 ?auto_389440 ) ) ( not ( = ?auto_389439 ?auto_389441 ) ) ( not ( = ?auto_389439 ?auto_389442 ) ) ( not ( = ?auto_389439 ?auto_389443 ) ) ( not ( = ?auto_389439 ?auto_389444 ) ) ( not ( = ?auto_389439 ?auto_389445 ) ) ( not ( = ?auto_389439 ?auto_389446 ) ) ( not ( = ?auto_389439 ?auto_389447 ) ) ( not ( = ?auto_389439 ?auto_389448 ) ) ( not ( = ?auto_389440 ?auto_389441 ) ) ( not ( = ?auto_389440 ?auto_389442 ) ) ( not ( = ?auto_389440 ?auto_389443 ) ) ( not ( = ?auto_389440 ?auto_389444 ) ) ( not ( = ?auto_389440 ?auto_389445 ) ) ( not ( = ?auto_389440 ?auto_389446 ) ) ( not ( = ?auto_389440 ?auto_389447 ) ) ( not ( = ?auto_389440 ?auto_389448 ) ) ( not ( = ?auto_389441 ?auto_389442 ) ) ( not ( = ?auto_389441 ?auto_389443 ) ) ( not ( = ?auto_389441 ?auto_389444 ) ) ( not ( = ?auto_389441 ?auto_389445 ) ) ( not ( = ?auto_389441 ?auto_389446 ) ) ( not ( = ?auto_389441 ?auto_389447 ) ) ( not ( = ?auto_389441 ?auto_389448 ) ) ( not ( = ?auto_389442 ?auto_389443 ) ) ( not ( = ?auto_389442 ?auto_389444 ) ) ( not ( = ?auto_389442 ?auto_389445 ) ) ( not ( = ?auto_389442 ?auto_389446 ) ) ( not ( = ?auto_389442 ?auto_389447 ) ) ( not ( = ?auto_389442 ?auto_389448 ) ) ( not ( = ?auto_389443 ?auto_389444 ) ) ( not ( = ?auto_389443 ?auto_389445 ) ) ( not ( = ?auto_389443 ?auto_389446 ) ) ( not ( = ?auto_389443 ?auto_389447 ) ) ( not ( = ?auto_389443 ?auto_389448 ) ) ( not ( = ?auto_389444 ?auto_389445 ) ) ( not ( = ?auto_389444 ?auto_389446 ) ) ( not ( = ?auto_389444 ?auto_389447 ) ) ( not ( = ?auto_389444 ?auto_389448 ) ) ( not ( = ?auto_389445 ?auto_389446 ) ) ( not ( = ?auto_389445 ?auto_389447 ) ) ( not ( = ?auto_389445 ?auto_389448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_389446 ?auto_389447 ?auto_389448 )
      ( MAKE-9CRATE-VERIFY ?auto_389439 ?auto_389440 ?auto_389441 ?auto_389442 ?auto_389443 ?auto_389444 ?auto_389445 ?auto_389446 ?auto_389447 ?auto_389448 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_389547 - SURFACE
      ?auto_389548 - SURFACE
      ?auto_389549 - SURFACE
      ?auto_389550 - SURFACE
      ?auto_389551 - SURFACE
      ?auto_389552 - SURFACE
      ?auto_389553 - SURFACE
      ?auto_389554 - SURFACE
      ?auto_389555 - SURFACE
      ?auto_389556 - SURFACE
    )
    :vars
    (
      ?auto_389561 - HOIST
      ?auto_389559 - PLACE
      ?auto_389558 - TRUCK
      ?auto_389562 - PLACE
      ?auto_389560 - HOIST
      ?auto_389557 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_389561 ?auto_389559 ) ( SURFACE-AT ?auto_389555 ?auto_389559 ) ( CLEAR ?auto_389555 ) ( IS-CRATE ?auto_389556 ) ( not ( = ?auto_389555 ?auto_389556 ) ) ( AVAILABLE ?auto_389561 ) ( ON ?auto_389555 ?auto_389554 ) ( not ( = ?auto_389554 ?auto_389555 ) ) ( not ( = ?auto_389554 ?auto_389556 ) ) ( TRUCK-AT ?auto_389558 ?auto_389562 ) ( not ( = ?auto_389562 ?auto_389559 ) ) ( HOIST-AT ?auto_389560 ?auto_389562 ) ( not ( = ?auto_389561 ?auto_389560 ) ) ( AVAILABLE ?auto_389560 ) ( SURFACE-AT ?auto_389556 ?auto_389562 ) ( ON ?auto_389556 ?auto_389557 ) ( CLEAR ?auto_389556 ) ( not ( = ?auto_389555 ?auto_389557 ) ) ( not ( = ?auto_389556 ?auto_389557 ) ) ( not ( = ?auto_389554 ?auto_389557 ) ) ( ON ?auto_389548 ?auto_389547 ) ( ON ?auto_389549 ?auto_389548 ) ( ON ?auto_389550 ?auto_389549 ) ( ON ?auto_389551 ?auto_389550 ) ( ON ?auto_389552 ?auto_389551 ) ( ON ?auto_389553 ?auto_389552 ) ( ON ?auto_389554 ?auto_389553 ) ( not ( = ?auto_389547 ?auto_389548 ) ) ( not ( = ?auto_389547 ?auto_389549 ) ) ( not ( = ?auto_389547 ?auto_389550 ) ) ( not ( = ?auto_389547 ?auto_389551 ) ) ( not ( = ?auto_389547 ?auto_389552 ) ) ( not ( = ?auto_389547 ?auto_389553 ) ) ( not ( = ?auto_389547 ?auto_389554 ) ) ( not ( = ?auto_389547 ?auto_389555 ) ) ( not ( = ?auto_389547 ?auto_389556 ) ) ( not ( = ?auto_389547 ?auto_389557 ) ) ( not ( = ?auto_389548 ?auto_389549 ) ) ( not ( = ?auto_389548 ?auto_389550 ) ) ( not ( = ?auto_389548 ?auto_389551 ) ) ( not ( = ?auto_389548 ?auto_389552 ) ) ( not ( = ?auto_389548 ?auto_389553 ) ) ( not ( = ?auto_389548 ?auto_389554 ) ) ( not ( = ?auto_389548 ?auto_389555 ) ) ( not ( = ?auto_389548 ?auto_389556 ) ) ( not ( = ?auto_389548 ?auto_389557 ) ) ( not ( = ?auto_389549 ?auto_389550 ) ) ( not ( = ?auto_389549 ?auto_389551 ) ) ( not ( = ?auto_389549 ?auto_389552 ) ) ( not ( = ?auto_389549 ?auto_389553 ) ) ( not ( = ?auto_389549 ?auto_389554 ) ) ( not ( = ?auto_389549 ?auto_389555 ) ) ( not ( = ?auto_389549 ?auto_389556 ) ) ( not ( = ?auto_389549 ?auto_389557 ) ) ( not ( = ?auto_389550 ?auto_389551 ) ) ( not ( = ?auto_389550 ?auto_389552 ) ) ( not ( = ?auto_389550 ?auto_389553 ) ) ( not ( = ?auto_389550 ?auto_389554 ) ) ( not ( = ?auto_389550 ?auto_389555 ) ) ( not ( = ?auto_389550 ?auto_389556 ) ) ( not ( = ?auto_389550 ?auto_389557 ) ) ( not ( = ?auto_389551 ?auto_389552 ) ) ( not ( = ?auto_389551 ?auto_389553 ) ) ( not ( = ?auto_389551 ?auto_389554 ) ) ( not ( = ?auto_389551 ?auto_389555 ) ) ( not ( = ?auto_389551 ?auto_389556 ) ) ( not ( = ?auto_389551 ?auto_389557 ) ) ( not ( = ?auto_389552 ?auto_389553 ) ) ( not ( = ?auto_389552 ?auto_389554 ) ) ( not ( = ?auto_389552 ?auto_389555 ) ) ( not ( = ?auto_389552 ?auto_389556 ) ) ( not ( = ?auto_389552 ?auto_389557 ) ) ( not ( = ?auto_389553 ?auto_389554 ) ) ( not ( = ?auto_389553 ?auto_389555 ) ) ( not ( = ?auto_389553 ?auto_389556 ) ) ( not ( = ?auto_389553 ?auto_389557 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_389554 ?auto_389555 ?auto_389556 )
      ( MAKE-9CRATE-VERIFY ?auto_389547 ?auto_389548 ?auto_389549 ?auto_389550 ?auto_389551 ?auto_389552 ?auto_389553 ?auto_389554 ?auto_389555 ?auto_389556 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_389656 - SURFACE
      ?auto_389657 - SURFACE
      ?auto_389658 - SURFACE
      ?auto_389659 - SURFACE
      ?auto_389660 - SURFACE
      ?auto_389661 - SURFACE
      ?auto_389662 - SURFACE
      ?auto_389663 - SURFACE
      ?auto_389664 - SURFACE
      ?auto_389665 - SURFACE
    )
    :vars
    (
      ?auto_389669 - HOIST
      ?auto_389671 - PLACE
      ?auto_389668 - PLACE
      ?auto_389670 - HOIST
      ?auto_389666 - SURFACE
      ?auto_389667 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_389669 ?auto_389671 ) ( SURFACE-AT ?auto_389664 ?auto_389671 ) ( CLEAR ?auto_389664 ) ( IS-CRATE ?auto_389665 ) ( not ( = ?auto_389664 ?auto_389665 ) ) ( AVAILABLE ?auto_389669 ) ( ON ?auto_389664 ?auto_389663 ) ( not ( = ?auto_389663 ?auto_389664 ) ) ( not ( = ?auto_389663 ?auto_389665 ) ) ( not ( = ?auto_389668 ?auto_389671 ) ) ( HOIST-AT ?auto_389670 ?auto_389668 ) ( not ( = ?auto_389669 ?auto_389670 ) ) ( AVAILABLE ?auto_389670 ) ( SURFACE-AT ?auto_389665 ?auto_389668 ) ( ON ?auto_389665 ?auto_389666 ) ( CLEAR ?auto_389665 ) ( not ( = ?auto_389664 ?auto_389666 ) ) ( not ( = ?auto_389665 ?auto_389666 ) ) ( not ( = ?auto_389663 ?auto_389666 ) ) ( TRUCK-AT ?auto_389667 ?auto_389671 ) ( ON ?auto_389657 ?auto_389656 ) ( ON ?auto_389658 ?auto_389657 ) ( ON ?auto_389659 ?auto_389658 ) ( ON ?auto_389660 ?auto_389659 ) ( ON ?auto_389661 ?auto_389660 ) ( ON ?auto_389662 ?auto_389661 ) ( ON ?auto_389663 ?auto_389662 ) ( not ( = ?auto_389656 ?auto_389657 ) ) ( not ( = ?auto_389656 ?auto_389658 ) ) ( not ( = ?auto_389656 ?auto_389659 ) ) ( not ( = ?auto_389656 ?auto_389660 ) ) ( not ( = ?auto_389656 ?auto_389661 ) ) ( not ( = ?auto_389656 ?auto_389662 ) ) ( not ( = ?auto_389656 ?auto_389663 ) ) ( not ( = ?auto_389656 ?auto_389664 ) ) ( not ( = ?auto_389656 ?auto_389665 ) ) ( not ( = ?auto_389656 ?auto_389666 ) ) ( not ( = ?auto_389657 ?auto_389658 ) ) ( not ( = ?auto_389657 ?auto_389659 ) ) ( not ( = ?auto_389657 ?auto_389660 ) ) ( not ( = ?auto_389657 ?auto_389661 ) ) ( not ( = ?auto_389657 ?auto_389662 ) ) ( not ( = ?auto_389657 ?auto_389663 ) ) ( not ( = ?auto_389657 ?auto_389664 ) ) ( not ( = ?auto_389657 ?auto_389665 ) ) ( not ( = ?auto_389657 ?auto_389666 ) ) ( not ( = ?auto_389658 ?auto_389659 ) ) ( not ( = ?auto_389658 ?auto_389660 ) ) ( not ( = ?auto_389658 ?auto_389661 ) ) ( not ( = ?auto_389658 ?auto_389662 ) ) ( not ( = ?auto_389658 ?auto_389663 ) ) ( not ( = ?auto_389658 ?auto_389664 ) ) ( not ( = ?auto_389658 ?auto_389665 ) ) ( not ( = ?auto_389658 ?auto_389666 ) ) ( not ( = ?auto_389659 ?auto_389660 ) ) ( not ( = ?auto_389659 ?auto_389661 ) ) ( not ( = ?auto_389659 ?auto_389662 ) ) ( not ( = ?auto_389659 ?auto_389663 ) ) ( not ( = ?auto_389659 ?auto_389664 ) ) ( not ( = ?auto_389659 ?auto_389665 ) ) ( not ( = ?auto_389659 ?auto_389666 ) ) ( not ( = ?auto_389660 ?auto_389661 ) ) ( not ( = ?auto_389660 ?auto_389662 ) ) ( not ( = ?auto_389660 ?auto_389663 ) ) ( not ( = ?auto_389660 ?auto_389664 ) ) ( not ( = ?auto_389660 ?auto_389665 ) ) ( not ( = ?auto_389660 ?auto_389666 ) ) ( not ( = ?auto_389661 ?auto_389662 ) ) ( not ( = ?auto_389661 ?auto_389663 ) ) ( not ( = ?auto_389661 ?auto_389664 ) ) ( not ( = ?auto_389661 ?auto_389665 ) ) ( not ( = ?auto_389661 ?auto_389666 ) ) ( not ( = ?auto_389662 ?auto_389663 ) ) ( not ( = ?auto_389662 ?auto_389664 ) ) ( not ( = ?auto_389662 ?auto_389665 ) ) ( not ( = ?auto_389662 ?auto_389666 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_389663 ?auto_389664 ?auto_389665 )
      ( MAKE-9CRATE-VERIFY ?auto_389656 ?auto_389657 ?auto_389658 ?auto_389659 ?auto_389660 ?auto_389661 ?auto_389662 ?auto_389663 ?auto_389664 ?auto_389665 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_389765 - SURFACE
      ?auto_389766 - SURFACE
      ?auto_389767 - SURFACE
      ?auto_389768 - SURFACE
      ?auto_389769 - SURFACE
      ?auto_389770 - SURFACE
      ?auto_389771 - SURFACE
      ?auto_389772 - SURFACE
      ?auto_389773 - SURFACE
      ?auto_389774 - SURFACE
    )
    :vars
    (
      ?auto_389778 - HOIST
      ?auto_389780 - PLACE
      ?auto_389779 - PLACE
      ?auto_389777 - HOIST
      ?auto_389775 - SURFACE
      ?auto_389776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_389778 ?auto_389780 ) ( IS-CRATE ?auto_389774 ) ( not ( = ?auto_389773 ?auto_389774 ) ) ( not ( = ?auto_389772 ?auto_389773 ) ) ( not ( = ?auto_389772 ?auto_389774 ) ) ( not ( = ?auto_389779 ?auto_389780 ) ) ( HOIST-AT ?auto_389777 ?auto_389779 ) ( not ( = ?auto_389778 ?auto_389777 ) ) ( AVAILABLE ?auto_389777 ) ( SURFACE-AT ?auto_389774 ?auto_389779 ) ( ON ?auto_389774 ?auto_389775 ) ( CLEAR ?auto_389774 ) ( not ( = ?auto_389773 ?auto_389775 ) ) ( not ( = ?auto_389774 ?auto_389775 ) ) ( not ( = ?auto_389772 ?auto_389775 ) ) ( TRUCK-AT ?auto_389776 ?auto_389780 ) ( SURFACE-AT ?auto_389772 ?auto_389780 ) ( CLEAR ?auto_389772 ) ( LIFTING ?auto_389778 ?auto_389773 ) ( IS-CRATE ?auto_389773 ) ( ON ?auto_389766 ?auto_389765 ) ( ON ?auto_389767 ?auto_389766 ) ( ON ?auto_389768 ?auto_389767 ) ( ON ?auto_389769 ?auto_389768 ) ( ON ?auto_389770 ?auto_389769 ) ( ON ?auto_389771 ?auto_389770 ) ( ON ?auto_389772 ?auto_389771 ) ( not ( = ?auto_389765 ?auto_389766 ) ) ( not ( = ?auto_389765 ?auto_389767 ) ) ( not ( = ?auto_389765 ?auto_389768 ) ) ( not ( = ?auto_389765 ?auto_389769 ) ) ( not ( = ?auto_389765 ?auto_389770 ) ) ( not ( = ?auto_389765 ?auto_389771 ) ) ( not ( = ?auto_389765 ?auto_389772 ) ) ( not ( = ?auto_389765 ?auto_389773 ) ) ( not ( = ?auto_389765 ?auto_389774 ) ) ( not ( = ?auto_389765 ?auto_389775 ) ) ( not ( = ?auto_389766 ?auto_389767 ) ) ( not ( = ?auto_389766 ?auto_389768 ) ) ( not ( = ?auto_389766 ?auto_389769 ) ) ( not ( = ?auto_389766 ?auto_389770 ) ) ( not ( = ?auto_389766 ?auto_389771 ) ) ( not ( = ?auto_389766 ?auto_389772 ) ) ( not ( = ?auto_389766 ?auto_389773 ) ) ( not ( = ?auto_389766 ?auto_389774 ) ) ( not ( = ?auto_389766 ?auto_389775 ) ) ( not ( = ?auto_389767 ?auto_389768 ) ) ( not ( = ?auto_389767 ?auto_389769 ) ) ( not ( = ?auto_389767 ?auto_389770 ) ) ( not ( = ?auto_389767 ?auto_389771 ) ) ( not ( = ?auto_389767 ?auto_389772 ) ) ( not ( = ?auto_389767 ?auto_389773 ) ) ( not ( = ?auto_389767 ?auto_389774 ) ) ( not ( = ?auto_389767 ?auto_389775 ) ) ( not ( = ?auto_389768 ?auto_389769 ) ) ( not ( = ?auto_389768 ?auto_389770 ) ) ( not ( = ?auto_389768 ?auto_389771 ) ) ( not ( = ?auto_389768 ?auto_389772 ) ) ( not ( = ?auto_389768 ?auto_389773 ) ) ( not ( = ?auto_389768 ?auto_389774 ) ) ( not ( = ?auto_389768 ?auto_389775 ) ) ( not ( = ?auto_389769 ?auto_389770 ) ) ( not ( = ?auto_389769 ?auto_389771 ) ) ( not ( = ?auto_389769 ?auto_389772 ) ) ( not ( = ?auto_389769 ?auto_389773 ) ) ( not ( = ?auto_389769 ?auto_389774 ) ) ( not ( = ?auto_389769 ?auto_389775 ) ) ( not ( = ?auto_389770 ?auto_389771 ) ) ( not ( = ?auto_389770 ?auto_389772 ) ) ( not ( = ?auto_389770 ?auto_389773 ) ) ( not ( = ?auto_389770 ?auto_389774 ) ) ( not ( = ?auto_389770 ?auto_389775 ) ) ( not ( = ?auto_389771 ?auto_389772 ) ) ( not ( = ?auto_389771 ?auto_389773 ) ) ( not ( = ?auto_389771 ?auto_389774 ) ) ( not ( = ?auto_389771 ?auto_389775 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_389772 ?auto_389773 ?auto_389774 )
      ( MAKE-9CRATE-VERIFY ?auto_389765 ?auto_389766 ?auto_389767 ?auto_389768 ?auto_389769 ?auto_389770 ?auto_389771 ?auto_389772 ?auto_389773 ?auto_389774 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_389874 - SURFACE
      ?auto_389875 - SURFACE
      ?auto_389876 - SURFACE
      ?auto_389877 - SURFACE
      ?auto_389878 - SURFACE
      ?auto_389879 - SURFACE
      ?auto_389880 - SURFACE
      ?auto_389881 - SURFACE
      ?auto_389882 - SURFACE
      ?auto_389883 - SURFACE
    )
    :vars
    (
      ?auto_389884 - HOIST
      ?auto_389886 - PLACE
      ?auto_389888 - PLACE
      ?auto_389885 - HOIST
      ?auto_389887 - SURFACE
      ?auto_389889 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_389884 ?auto_389886 ) ( IS-CRATE ?auto_389883 ) ( not ( = ?auto_389882 ?auto_389883 ) ) ( not ( = ?auto_389881 ?auto_389882 ) ) ( not ( = ?auto_389881 ?auto_389883 ) ) ( not ( = ?auto_389888 ?auto_389886 ) ) ( HOIST-AT ?auto_389885 ?auto_389888 ) ( not ( = ?auto_389884 ?auto_389885 ) ) ( AVAILABLE ?auto_389885 ) ( SURFACE-AT ?auto_389883 ?auto_389888 ) ( ON ?auto_389883 ?auto_389887 ) ( CLEAR ?auto_389883 ) ( not ( = ?auto_389882 ?auto_389887 ) ) ( not ( = ?auto_389883 ?auto_389887 ) ) ( not ( = ?auto_389881 ?auto_389887 ) ) ( TRUCK-AT ?auto_389889 ?auto_389886 ) ( SURFACE-AT ?auto_389881 ?auto_389886 ) ( CLEAR ?auto_389881 ) ( IS-CRATE ?auto_389882 ) ( AVAILABLE ?auto_389884 ) ( IN ?auto_389882 ?auto_389889 ) ( ON ?auto_389875 ?auto_389874 ) ( ON ?auto_389876 ?auto_389875 ) ( ON ?auto_389877 ?auto_389876 ) ( ON ?auto_389878 ?auto_389877 ) ( ON ?auto_389879 ?auto_389878 ) ( ON ?auto_389880 ?auto_389879 ) ( ON ?auto_389881 ?auto_389880 ) ( not ( = ?auto_389874 ?auto_389875 ) ) ( not ( = ?auto_389874 ?auto_389876 ) ) ( not ( = ?auto_389874 ?auto_389877 ) ) ( not ( = ?auto_389874 ?auto_389878 ) ) ( not ( = ?auto_389874 ?auto_389879 ) ) ( not ( = ?auto_389874 ?auto_389880 ) ) ( not ( = ?auto_389874 ?auto_389881 ) ) ( not ( = ?auto_389874 ?auto_389882 ) ) ( not ( = ?auto_389874 ?auto_389883 ) ) ( not ( = ?auto_389874 ?auto_389887 ) ) ( not ( = ?auto_389875 ?auto_389876 ) ) ( not ( = ?auto_389875 ?auto_389877 ) ) ( not ( = ?auto_389875 ?auto_389878 ) ) ( not ( = ?auto_389875 ?auto_389879 ) ) ( not ( = ?auto_389875 ?auto_389880 ) ) ( not ( = ?auto_389875 ?auto_389881 ) ) ( not ( = ?auto_389875 ?auto_389882 ) ) ( not ( = ?auto_389875 ?auto_389883 ) ) ( not ( = ?auto_389875 ?auto_389887 ) ) ( not ( = ?auto_389876 ?auto_389877 ) ) ( not ( = ?auto_389876 ?auto_389878 ) ) ( not ( = ?auto_389876 ?auto_389879 ) ) ( not ( = ?auto_389876 ?auto_389880 ) ) ( not ( = ?auto_389876 ?auto_389881 ) ) ( not ( = ?auto_389876 ?auto_389882 ) ) ( not ( = ?auto_389876 ?auto_389883 ) ) ( not ( = ?auto_389876 ?auto_389887 ) ) ( not ( = ?auto_389877 ?auto_389878 ) ) ( not ( = ?auto_389877 ?auto_389879 ) ) ( not ( = ?auto_389877 ?auto_389880 ) ) ( not ( = ?auto_389877 ?auto_389881 ) ) ( not ( = ?auto_389877 ?auto_389882 ) ) ( not ( = ?auto_389877 ?auto_389883 ) ) ( not ( = ?auto_389877 ?auto_389887 ) ) ( not ( = ?auto_389878 ?auto_389879 ) ) ( not ( = ?auto_389878 ?auto_389880 ) ) ( not ( = ?auto_389878 ?auto_389881 ) ) ( not ( = ?auto_389878 ?auto_389882 ) ) ( not ( = ?auto_389878 ?auto_389883 ) ) ( not ( = ?auto_389878 ?auto_389887 ) ) ( not ( = ?auto_389879 ?auto_389880 ) ) ( not ( = ?auto_389879 ?auto_389881 ) ) ( not ( = ?auto_389879 ?auto_389882 ) ) ( not ( = ?auto_389879 ?auto_389883 ) ) ( not ( = ?auto_389879 ?auto_389887 ) ) ( not ( = ?auto_389880 ?auto_389881 ) ) ( not ( = ?auto_389880 ?auto_389882 ) ) ( not ( = ?auto_389880 ?auto_389883 ) ) ( not ( = ?auto_389880 ?auto_389887 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_389881 ?auto_389882 ?auto_389883 )
      ( MAKE-9CRATE-VERIFY ?auto_389874 ?auto_389875 ?auto_389876 ?auto_389877 ?auto_389878 ?auto_389879 ?auto_389880 ?auto_389881 ?auto_389882 ?auto_389883 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_395439 - SURFACE
      ?auto_395440 - SURFACE
      ?auto_395441 - SURFACE
      ?auto_395442 - SURFACE
      ?auto_395443 - SURFACE
      ?auto_395444 - SURFACE
      ?auto_395445 - SURFACE
      ?auto_395446 - SURFACE
      ?auto_395447 - SURFACE
      ?auto_395448 - SURFACE
      ?auto_395449 - SURFACE
    )
    :vars
    (
      ?auto_395451 - HOIST
      ?auto_395450 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_395451 ?auto_395450 ) ( SURFACE-AT ?auto_395448 ?auto_395450 ) ( CLEAR ?auto_395448 ) ( LIFTING ?auto_395451 ?auto_395449 ) ( IS-CRATE ?auto_395449 ) ( not ( = ?auto_395448 ?auto_395449 ) ) ( ON ?auto_395440 ?auto_395439 ) ( ON ?auto_395441 ?auto_395440 ) ( ON ?auto_395442 ?auto_395441 ) ( ON ?auto_395443 ?auto_395442 ) ( ON ?auto_395444 ?auto_395443 ) ( ON ?auto_395445 ?auto_395444 ) ( ON ?auto_395446 ?auto_395445 ) ( ON ?auto_395447 ?auto_395446 ) ( ON ?auto_395448 ?auto_395447 ) ( not ( = ?auto_395439 ?auto_395440 ) ) ( not ( = ?auto_395439 ?auto_395441 ) ) ( not ( = ?auto_395439 ?auto_395442 ) ) ( not ( = ?auto_395439 ?auto_395443 ) ) ( not ( = ?auto_395439 ?auto_395444 ) ) ( not ( = ?auto_395439 ?auto_395445 ) ) ( not ( = ?auto_395439 ?auto_395446 ) ) ( not ( = ?auto_395439 ?auto_395447 ) ) ( not ( = ?auto_395439 ?auto_395448 ) ) ( not ( = ?auto_395439 ?auto_395449 ) ) ( not ( = ?auto_395440 ?auto_395441 ) ) ( not ( = ?auto_395440 ?auto_395442 ) ) ( not ( = ?auto_395440 ?auto_395443 ) ) ( not ( = ?auto_395440 ?auto_395444 ) ) ( not ( = ?auto_395440 ?auto_395445 ) ) ( not ( = ?auto_395440 ?auto_395446 ) ) ( not ( = ?auto_395440 ?auto_395447 ) ) ( not ( = ?auto_395440 ?auto_395448 ) ) ( not ( = ?auto_395440 ?auto_395449 ) ) ( not ( = ?auto_395441 ?auto_395442 ) ) ( not ( = ?auto_395441 ?auto_395443 ) ) ( not ( = ?auto_395441 ?auto_395444 ) ) ( not ( = ?auto_395441 ?auto_395445 ) ) ( not ( = ?auto_395441 ?auto_395446 ) ) ( not ( = ?auto_395441 ?auto_395447 ) ) ( not ( = ?auto_395441 ?auto_395448 ) ) ( not ( = ?auto_395441 ?auto_395449 ) ) ( not ( = ?auto_395442 ?auto_395443 ) ) ( not ( = ?auto_395442 ?auto_395444 ) ) ( not ( = ?auto_395442 ?auto_395445 ) ) ( not ( = ?auto_395442 ?auto_395446 ) ) ( not ( = ?auto_395442 ?auto_395447 ) ) ( not ( = ?auto_395442 ?auto_395448 ) ) ( not ( = ?auto_395442 ?auto_395449 ) ) ( not ( = ?auto_395443 ?auto_395444 ) ) ( not ( = ?auto_395443 ?auto_395445 ) ) ( not ( = ?auto_395443 ?auto_395446 ) ) ( not ( = ?auto_395443 ?auto_395447 ) ) ( not ( = ?auto_395443 ?auto_395448 ) ) ( not ( = ?auto_395443 ?auto_395449 ) ) ( not ( = ?auto_395444 ?auto_395445 ) ) ( not ( = ?auto_395444 ?auto_395446 ) ) ( not ( = ?auto_395444 ?auto_395447 ) ) ( not ( = ?auto_395444 ?auto_395448 ) ) ( not ( = ?auto_395444 ?auto_395449 ) ) ( not ( = ?auto_395445 ?auto_395446 ) ) ( not ( = ?auto_395445 ?auto_395447 ) ) ( not ( = ?auto_395445 ?auto_395448 ) ) ( not ( = ?auto_395445 ?auto_395449 ) ) ( not ( = ?auto_395446 ?auto_395447 ) ) ( not ( = ?auto_395446 ?auto_395448 ) ) ( not ( = ?auto_395446 ?auto_395449 ) ) ( not ( = ?auto_395447 ?auto_395448 ) ) ( not ( = ?auto_395447 ?auto_395449 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_395448 ?auto_395449 )
      ( MAKE-10CRATE-VERIFY ?auto_395439 ?auto_395440 ?auto_395441 ?auto_395442 ?auto_395443 ?auto_395444 ?auto_395445 ?auto_395446 ?auto_395447 ?auto_395448 ?auto_395449 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_395533 - SURFACE
      ?auto_395534 - SURFACE
      ?auto_395535 - SURFACE
      ?auto_395536 - SURFACE
      ?auto_395537 - SURFACE
      ?auto_395538 - SURFACE
      ?auto_395539 - SURFACE
      ?auto_395540 - SURFACE
      ?auto_395541 - SURFACE
      ?auto_395542 - SURFACE
      ?auto_395543 - SURFACE
    )
    :vars
    (
      ?auto_395544 - HOIST
      ?auto_395545 - PLACE
      ?auto_395546 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_395544 ?auto_395545 ) ( SURFACE-AT ?auto_395542 ?auto_395545 ) ( CLEAR ?auto_395542 ) ( IS-CRATE ?auto_395543 ) ( not ( = ?auto_395542 ?auto_395543 ) ) ( TRUCK-AT ?auto_395546 ?auto_395545 ) ( AVAILABLE ?auto_395544 ) ( IN ?auto_395543 ?auto_395546 ) ( ON ?auto_395542 ?auto_395541 ) ( not ( = ?auto_395541 ?auto_395542 ) ) ( not ( = ?auto_395541 ?auto_395543 ) ) ( ON ?auto_395534 ?auto_395533 ) ( ON ?auto_395535 ?auto_395534 ) ( ON ?auto_395536 ?auto_395535 ) ( ON ?auto_395537 ?auto_395536 ) ( ON ?auto_395538 ?auto_395537 ) ( ON ?auto_395539 ?auto_395538 ) ( ON ?auto_395540 ?auto_395539 ) ( ON ?auto_395541 ?auto_395540 ) ( not ( = ?auto_395533 ?auto_395534 ) ) ( not ( = ?auto_395533 ?auto_395535 ) ) ( not ( = ?auto_395533 ?auto_395536 ) ) ( not ( = ?auto_395533 ?auto_395537 ) ) ( not ( = ?auto_395533 ?auto_395538 ) ) ( not ( = ?auto_395533 ?auto_395539 ) ) ( not ( = ?auto_395533 ?auto_395540 ) ) ( not ( = ?auto_395533 ?auto_395541 ) ) ( not ( = ?auto_395533 ?auto_395542 ) ) ( not ( = ?auto_395533 ?auto_395543 ) ) ( not ( = ?auto_395534 ?auto_395535 ) ) ( not ( = ?auto_395534 ?auto_395536 ) ) ( not ( = ?auto_395534 ?auto_395537 ) ) ( not ( = ?auto_395534 ?auto_395538 ) ) ( not ( = ?auto_395534 ?auto_395539 ) ) ( not ( = ?auto_395534 ?auto_395540 ) ) ( not ( = ?auto_395534 ?auto_395541 ) ) ( not ( = ?auto_395534 ?auto_395542 ) ) ( not ( = ?auto_395534 ?auto_395543 ) ) ( not ( = ?auto_395535 ?auto_395536 ) ) ( not ( = ?auto_395535 ?auto_395537 ) ) ( not ( = ?auto_395535 ?auto_395538 ) ) ( not ( = ?auto_395535 ?auto_395539 ) ) ( not ( = ?auto_395535 ?auto_395540 ) ) ( not ( = ?auto_395535 ?auto_395541 ) ) ( not ( = ?auto_395535 ?auto_395542 ) ) ( not ( = ?auto_395535 ?auto_395543 ) ) ( not ( = ?auto_395536 ?auto_395537 ) ) ( not ( = ?auto_395536 ?auto_395538 ) ) ( not ( = ?auto_395536 ?auto_395539 ) ) ( not ( = ?auto_395536 ?auto_395540 ) ) ( not ( = ?auto_395536 ?auto_395541 ) ) ( not ( = ?auto_395536 ?auto_395542 ) ) ( not ( = ?auto_395536 ?auto_395543 ) ) ( not ( = ?auto_395537 ?auto_395538 ) ) ( not ( = ?auto_395537 ?auto_395539 ) ) ( not ( = ?auto_395537 ?auto_395540 ) ) ( not ( = ?auto_395537 ?auto_395541 ) ) ( not ( = ?auto_395537 ?auto_395542 ) ) ( not ( = ?auto_395537 ?auto_395543 ) ) ( not ( = ?auto_395538 ?auto_395539 ) ) ( not ( = ?auto_395538 ?auto_395540 ) ) ( not ( = ?auto_395538 ?auto_395541 ) ) ( not ( = ?auto_395538 ?auto_395542 ) ) ( not ( = ?auto_395538 ?auto_395543 ) ) ( not ( = ?auto_395539 ?auto_395540 ) ) ( not ( = ?auto_395539 ?auto_395541 ) ) ( not ( = ?auto_395539 ?auto_395542 ) ) ( not ( = ?auto_395539 ?auto_395543 ) ) ( not ( = ?auto_395540 ?auto_395541 ) ) ( not ( = ?auto_395540 ?auto_395542 ) ) ( not ( = ?auto_395540 ?auto_395543 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_395541 ?auto_395542 ?auto_395543 )
      ( MAKE-10CRATE-VERIFY ?auto_395533 ?auto_395534 ?auto_395535 ?auto_395536 ?auto_395537 ?auto_395538 ?auto_395539 ?auto_395540 ?auto_395541 ?auto_395542 ?auto_395543 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_395638 - SURFACE
      ?auto_395639 - SURFACE
      ?auto_395640 - SURFACE
      ?auto_395641 - SURFACE
      ?auto_395642 - SURFACE
      ?auto_395643 - SURFACE
      ?auto_395644 - SURFACE
      ?auto_395645 - SURFACE
      ?auto_395646 - SURFACE
      ?auto_395647 - SURFACE
      ?auto_395648 - SURFACE
    )
    :vars
    (
      ?auto_395649 - HOIST
      ?auto_395651 - PLACE
      ?auto_395650 - TRUCK
      ?auto_395652 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_395649 ?auto_395651 ) ( SURFACE-AT ?auto_395647 ?auto_395651 ) ( CLEAR ?auto_395647 ) ( IS-CRATE ?auto_395648 ) ( not ( = ?auto_395647 ?auto_395648 ) ) ( AVAILABLE ?auto_395649 ) ( IN ?auto_395648 ?auto_395650 ) ( ON ?auto_395647 ?auto_395646 ) ( not ( = ?auto_395646 ?auto_395647 ) ) ( not ( = ?auto_395646 ?auto_395648 ) ) ( TRUCK-AT ?auto_395650 ?auto_395652 ) ( not ( = ?auto_395652 ?auto_395651 ) ) ( ON ?auto_395639 ?auto_395638 ) ( ON ?auto_395640 ?auto_395639 ) ( ON ?auto_395641 ?auto_395640 ) ( ON ?auto_395642 ?auto_395641 ) ( ON ?auto_395643 ?auto_395642 ) ( ON ?auto_395644 ?auto_395643 ) ( ON ?auto_395645 ?auto_395644 ) ( ON ?auto_395646 ?auto_395645 ) ( not ( = ?auto_395638 ?auto_395639 ) ) ( not ( = ?auto_395638 ?auto_395640 ) ) ( not ( = ?auto_395638 ?auto_395641 ) ) ( not ( = ?auto_395638 ?auto_395642 ) ) ( not ( = ?auto_395638 ?auto_395643 ) ) ( not ( = ?auto_395638 ?auto_395644 ) ) ( not ( = ?auto_395638 ?auto_395645 ) ) ( not ( = ?auto_395638 ?auto_395646 ) ) ( not ( = ?auto_395638 ?auto_395647 ) ) ( not ( = ?auto_395638 ?auto_395648 ) ) ( not ( = ?auto_395639 ?auto_395640 ) ) ( not ( = ?auto_395639 ?auto_395641 ) ) ( not ( = ?auto_395639 ?auto_395642 ) ) ( not ( = ?auto_395639 ?auto_395643 ) ) ( not ( = ?auto_395639 ?auto_395644 ) ) ( not ( = ?auto_395639 ?auto_395645 ) ) ( not ( = ?auto_395639 ?auto_395646 ) ) ( not ( = ?auto_395639 ?auto_395647 ) ) ( not ( = ?auto_395639 ?auto_395648 ) ) ( not ( = ?auto_395640 ?auto_395641 ) ) ( not ( = ?auto_395640 ?auto_395642 ) ) ( not ( = ?auto_395640 ?auto_395643 ) ) ( not ( = ?auto_395640 ?auto_395644 ) ) ( not ( = ?auto_395640 ?auto_395645 ) ) ( not ( = ?auto_395640 ?auto_395646 ) ) ( not ( = ?auto_395640 ?auto_395647 ) ) ( not ( = ?auto_395640 ?auto_395648 ) ) ( not ( = ?auto_395641 ?auto_395642 ) ) ( not ( = ?auto_395641 ?auto_395643 ) ) ( not ( = ?auto_395641 ?auto_395644 ) ) ( not ( = ?auto_395641 ?auto_395645 ) ) ( not ( = ?auto_395641 ?auto_395646 ) ) ( not ( = ?auto_395641 ?auto_395647 ) ) ( not ( = ?auto_395641 ?auto_395648 ) ) ( not ( = ?auto_395642 ?auto_395643 ) ) ( not ( = ?auto_395642 ?auto_395644 ) ) ( not ( = ?auto_395642 ?auto_395645 ) ) ( not ( = ?auto_395642 ?auto_395646 ) ) ( not ( = ?auto_395642 ?auto_395647 ) ) ( not ( = ?auto_395642 ?auto_395648 ) ) ( not ( = ?auto_395643 ?auto_395644 ) ) ( not ( = ?auto_395643 ?auto_395645 ) ) ( not ( = ?auto_395643 ?auto_395646 ) ) ( not ( = ?auto_395643 ?auto_395647 ) ) ( not ( = ?auto_395643 ?auto_395648 ) ) ( not ( = ?auto_395644 ?auto_395645 ) ) ( not ( = ?auto_395644 ?auto_395646 ) ) ( not ( = ?auto_395644 ?auto_395647 ) ) ( not ( = ?auto_395644 ?auto_395648 ) ) ( not ( = ?auto_395645 ?auto_395646 ) ) ( not ( = ?auto_395645 ?auto_395647 ) ) ( not ( = ?auto_395645 ?auto_395648 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_395646 ?auto_395647 ?auto_395648 )
      ( MAKE-10CRATE-VERIFY ?auto_395638 ?auto_395639 ?auto_395640 ?auto_395641 ?auto_395642 ?auto_395643 ?auto_395644 ?auto_395645 ?auto_395646 ?auto_395647 ?auto_395648 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_395753 - SURFACE
      ?auto_395754 - SURFACE
      ?auto_395755 - SURFACE
      ?auto_395756 - SURFACE
      ?auto_395757 - SURFACE
      ?auto_395758 - SURFACE
      ?auto_395759 - SURFACE
      ?auto_395760 - SURFACE
      ?auto_395761 - SURFACE
      ?auto_395762 - SURFACE
      ?auto_395763 - SURFACE
    )
    :vars
    (
      ?auto_395766 - HOIST
      ?auto_395767 - PLACE
      ?auto_395765 - TRUCK
      ?auto_395764 - PLACE
      ?auto_395768 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_395766 ?auto_395767 ) ( SURFACE-AT ?auto_395762 ?auto_395767 ) ( CLEAR ?auto_395762 ) ( IS-CRATE ?auto_395763 ) ( not ( = ?auto_395762 ?auto_395763 ) ) ( AVAILABLE ?auto_395766 ) ( ON ?auto_395762 ?auto_395761 ) ( not ( = ?auto_395761 ?auto_395762 ) ) ( not ( = ?auto_395761 ?auto_395763 ) ) ( TRUCK-AT ?auto_395765 ?auto_395764 ) ( not ( = ?auto_395764 ?auto_395767 ) ) ( HOIST-AT ?auto_395768 ?auto_395764 ) ( LIFTING ?auto_395768 ?auto_395763 ) ( not ( = ?auto_395766 ?auto_395768 ) ) ( ON ?auto_395754 ?auto_395753 ) ( ON ?auto_395755 ?auto_395754 ) ( ON ?auto_395756 ?auto_395755 ) ( ON ?auto_395757 ?auto_395756 ) ( ON ?auto_395758 ?auto_395757 ) ( ON ?auto_395759 ?auto_395758 ) ( ON ?auto_395760 ?auto_395759 ) ( ON ?auto_395761 ?auto_395760 ) ( not ( = ?auto_395753 ?auto_395754 ) ) ( not ( = ?auto_395753 ?auto_395755 ) ) ( not ( = ?auto_395753 ?auto_395756 ) ) ( not ( = ?auto_395753 ?auto_395757 ) ) ( not ( = ?auto_395753 ?auto_395758 ) ) ( not ( = ?auto_395753 ?auto_395759 ) ) ( not ( = ?auto_395753 ?auto_395760 ) ) ( not ( = ?auto_395753 ?auto_395761 ) ) ( not ( = ?auto_395753 ?auto_395762 ) ) ( not ( = ?auto_395753 ?auto_395763 ) ) ( not ( = ?auto_395754 ?auto_395755 ) ) ( not ( = ?auto_395754 ?auto_395756 ) ) ( not ( = ?auto_395754 ?auto_395757 ) ) ( not ( = ?auto_395754 ?auto_395758 ) ) ( not ( = ?auto_395754 ?auto_395759 ) ) ( not ( = ?auto_395754 ?auto_395760 ) ) ( not ( = ?auto_395754 ?auto_395761 ) ) ( not ( = ?auto_395754 ?auto_395762 ) ) ( not ( = ?auto_395754 ?auto_395763 ) ) ( not ( = ?auto_395755 ?auto_395756 ) ) ( not ( = ?auto_395755 ?auto_395757 ) ) ( not ( = ?auto_395755 ?auto_395758 ) ) ( not ( = ?auto_395755 ?auto_395759 ) ) ( not ( = ?auto_395755 ?auto_395760 ) ) ( not ( = ?auto_395755 ?auto_395761 ) ) ( not ( = ?auto_395755 ?auto_395762 ) ) ( not ( = ?auto_395755 ?auto_395763 ) ) ( not ( = ?auto_395756 ?auto_395757 ) ) ( not ( = ?auto_395756 ?auto_395758 ) ) ( not ( = ?auto_395756 ?auto_395759 ) ) ( not ( = ?auto_395756 ?auto_395760 ) ) ( not ( = ?auto_395756 ?auto_395761 ) ) ( not ( = ?auto_395756 ?auto_395762 ) ) ( not ( = ?auto_395756 ?auto_395763 ) ) ( not ( = ?auto_395757 ?auto_395758 ) ) ( not ( = ?auto_395757 ?auto_395759 ) ) ( not ( = ?auto_395757 ?auto_395760 ) ) ( not ( = ?auto_395757 ?auto_395761 ) ) ( not ( = ?auto_395757 ?auto_395762 ) ) ( not ( = ?auto_395757 ?auto_395763 ) ) ( not ( = ?auto_395758 ?auto_395759 ) ) ( not ( = ?auto_395758 ?auto_395760 ) ) ( not ( = ?auto_395758 ?auto_395761 ) ) ( not ( = ?auto_395758 ?auto_395762 ) ) ( not ( = ?auto_395758 ?auto_395763 ) ) ( not ( = ?auto_395759 ?auto_395760 ) ) ( not ( = ?auto_395759 ?auto_395761 ) ) ( not ( = ?auto_395759 ?auto_395762 ) ) ( not ( = ?auto_395759 ?auto_395763 ) ) ( not ( = ?auto_395760 ?auto_395761 ) ) ( not ( = ?auto_395760 ?auto_395762 ) ) ( not ( = ?auto_395760 ?auto_395763 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_395761 ?auto_395762 ?auto_395763 )
      ( MAKE-10CRATE-VERIFY ?auto_395753 ?auto_395754 ?auto_395755 ?auto_395756 ?auto_395757 ?auto_395758 ?auto_395759 ?auto_395760 ?auto_395761 ?auto_395762 ?auto_395763 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_395878 - SURFACE
      ?auto_395879 - SURFACE
      ?auto_395880 - SURFACE
      ?auto_395881 - SURFACE
      ?auto_395882 - SURFACE
      ?auto_395883 - SURFACE
      ?auto_395884 - SURFACE
      ?auto_395885 - SURFACE
      ?auto_395886 - SURFACE
      ?auto_395887 - SURFACE
      ?auto_395888 - SURFACE
    )
    :vars
    (
      ?auto_395893 - HOIST
      ?auto_395890 - PLACE
      ?auto_395892 - TRUCK
      ?auto_395889 - PLACE
      ?auto_395894 - HOIST
      ?auto_395891 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_395893 ?auto_395890 ) ( SURFACE-AT ?auto_395887 ?auto_395890 ) ( CLEAR ?auto_395887 ) ( IS-CRATE ?auto_395888 ) ( not ( = ?auto_395887 ?auto_395888 ) ) ( AVAILABLE ?auto_395893 ) ( ON ?auto_395887 ?auto_395886 ) ( not ( = ?auto_395886 ?auto_395887 ) ) ( not ( = ?auto_395886 ?auto_395888 ) ) ( TRUCK-AT ?auto_395892 ?auto_395889 ) ( not ( = ?auto_395889 ?auto_395890 ) ) ( HOIST-AT ?auto_395894 ?auto_395889 ) ( not ( = ?auto_395893 ?auto_395894 ) ) ( AVAILABLE ?auto_395894 ) ( SURFACE-AT ?auto_395888 ?auto_395889 ) ( ON ?auto_395888 ?auto_395891 ) ( CLEAR ?auto_395888 ) ( not ( = ?auto_395887 ?auto_395891 ) ) ( not ( = ?auto_395888 ?auto_395891 ) ) ( not ( = ?auto_395886 ?auto_395891 ) ) ( ON ?auto_395879 ?auto_395878 ) ( ON ?auto_395880 ?auto_395879 ) ( ON ?auto_395881 ?auto_395880 ) ( ON ?auto_395882 ?auto_395881 ) ( ON ?auto_395883 ?auto_395882 ) ( ON ?auto_395884 ?auto_395883 ) ( ON ?auto_395885 ?auto_395884 ) ( ON ?auto_395886 ?auto_395885 ) ( not ( = ?auto_395878 ?auto_395879 ) ) ( not ( = ?auto_395878 ?auto_395880 ) ) ( not ( = ?auto_395878 ?auto_395881 ) ) ( not ( = ?auto_395878 ?auto_395882 ) ) ( not ( = ?auto_395878 ?auto_395883 ) ) ( not ( = ?auto_395878 ?auto_395884 ) ) ( not ( = ?auto_395878 ?auto_395885 ) ) ( not ( = ?auto_395878 ?auto_395886 ) ) ( not ( = ?auto_395878 ?auto_395887 ) ) ( not ( = ?auto_395878 ?auto_395888 ) ) ( not ( = ?auto_395878 ?auto_395891 ) ) ( not ( = ?auto_395879 ?auto_395880 ) ) ( not ( = ?auto_395879 ?auto_395881 ) ) ( not ( = ?auto_395879 ?auto_395882 ) ) ( not ( = ?auto_395879 ?auto_395883 ) ) ( not ( = ?auto_395879 ?auto_395884 ) ) ( not ( = ?auto_395879 ?auto_395885 ) ) ( not ( = ?auto_395879 ?auto_395886 ) ) ( not ( = ?auto_395879 ?auto_395887 ) ) ( not ( = ?auto_395879 ?auto_395888 ) ) ( not ( = ?auto_395879 ?auto_395891 ) ) ( not ( = ?auto_395880 ?auto_395881 ) ) ( not ( = ?auto_395880 ?auto_395882 ) ) ( not ( = ?auto_395880 ?auto_395883 ) ) ( not ( = ?auto_395880 ?auto_395884 ) ) ( not ( = ?auto_395880 ?auto_395885 ) ) ( not ( = ?auto_395880 ?auto_395886 ) ) ( not ( = ?auto_395880 ?auto_395887 ) ) ( not ( = ?auto_395880 ?auto_395888 ) ) ( not ( = ?auto_395880 ?auto_395891 ) ) ( not ( = ?auto_395881 ?auto_395882 ) ) ( not ( = ?auto_395881 ?auto_395883 ) ) ( not ( = ?auto_395881 ?auto_395884 ) ) ( not ( = ?auto_395881 ?auto_395885 ) ) ( not ( = ?auto_395881 ?auto_395886 ) ) ( not ( = ?auto_395881 ?auto_395887 ) ) ( not ( = ?auto_395881 ?auto_395888 ) ) ( not ( = ?auto_395881 ?auto_395891 ) ) ( not ( = ?auto_395882 ?auto_395883 ) ) ( not ( = ?auto_395882 ?auto_395884 ) ) ( not ( = ?auto_395882 ?auto_395885 ) ) ( not ( = ?auto_395882 ?auto_395886 ) ) ( not ( = ?auto_395882 ?auto_395887 ) ) ( not ( = ?auto_395882 ?auto_395888 ) ) ( not ( = ?auto_395882 ?auto_395891 ) ) ( not ( = ?auto_395883 ?auto_395884 ) ) ( not ( = ?auto_395883 ?auto_395885 ) ) ( not ( = ?auto_395883 ?auto_395886 ) ) ( not ( = ?auto_395883 ?auto_395887 ) ) ( not ( = ?auto_395883 ?auto_395888 ) ) ( not ( = ?auto_395883 ?auto_395891 ) ) ( not ( = ?auto_395884 ?auto_395885 ) ) ( not ( = ?auto_395884 ?auto_395886 ) ) ( not ( = ?auto_395884 ?auto_395887 ) ) ( not ( = ?auto_395884 ?auto_395888 ) ) ( not ( = ?auto_395884 ?auto_395891 ) ) ( not ( = ?auto_395885 ?auto_395886 ) ) ( not ( = ?auto_395885 ?auto_395887 ) ) ( not ( = ?auto_395885 ?auto_395888 ) ) ( not ( = ?auto_395885 ?auto_395891 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_395886 ?auto_395887 ?auto_395888 )
      ( MAKE-10CRATE-VERIFY ?auto_395878 ?auto_395879 ?auto_395880 ?auto_395881 ?auto_395882 ?auto_395883 ?auto_395884 ?auto_395885 ?auto_395886 ?auto_395887 ?auto_395888 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_396004 - SURFACE
      ?auto_396005 - SURFACE
      ?auto_396006 - SURFACE
      ?auto_396007 - SURFACE
      ?auto_396008 - SURFACE
      ?auto_396009 - SURFACE
      ?auto_396010 - SURFACE
      ?auto_396011 - SURFACE
      ?auto_396012 - SURFACE
      ?auto_396013 - SURFACE
      ?auto_396014 - SURFACE
    )
    :vars
    (
      ?auto_396017 - HOIST
      ?auto_396018 - PLACE
      ?auto_396016 - PLACE
      ?auto_396019 - HOIST
      ?auto_396015 - SURFACE
      ?auto_396020 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_396017 ?auto_396018 ) ( SURFACE-AT ?auto_396013 ?auto_396018 ) ( CLEAR ?auto_396013 ) ( IS-CRATE ?auto_396014 ) ( not ( = ?auto_396013 ?auto_396014 ) ) ( AVAILABLE ?auto_396017 ) ( ON ?auto_396013 ?auto_396012 ) ( not ( = ?auto_396012 ?auto_396013 ) ) ( not ( = ?auto_396012 ?auto_396014 ) ) ( not ( = ?auto_396016 ?auto_396018 ) ) ( HOIST-AT ?auto_396019 ?auto_396016 ) ( not ( = ?auto_396017 ?auto_396019 ) ) ( AVAILABLE ?auto_396019 ) ( SURFACE-AT ?auto_396014 ?auto_396016 ) ( ON ?auto_396014 ?auto_396015 ) ( CLEAR ?auto_396014 ) ( not ( = ?auto_396013 ?auto_396015 ) ) ( not ( = ?auto_396014 ?auto_396015 ) ) ( not ( = ?auto_396012 ?auto_396015 ) ) ( TRUCK-AT ?auto_396020 ?auto_396018 ) ( ON ?auto_396005 ?auto_396004 ) ( ON ?auto_396006 ?auto_396005 ) ( ON ?auto_396007 ?auto_396006 ) ( ON ?auto_396008 ?auto_396007 ) ( ON ?auto_396009 ?auto_396008 ) ( ON ?auto_396010 ?auto_396009 ) ( ON ?auto_396011 ?auto_396010 ) ( ON ?auto_396012 ?auto_396011 ) ( not ( = ?auto_396004 ?auto_396005 ) ) ( not ( = ?auto_396004 ?auto_396006 ) ) ( not ( = ?auto_396004 ?auto_396007 ) ) ( not ( = ?auto_396004 ?auto_396008 ) ) ( not ( = ?auto_396004 ?auto_396009 ) ) ( not ( = ?auto_396004 ?auto_396010 ) ) ( not ( = ?auto_396004 ?auto_396011 ) ) ( not ( = ?auto_396004 ?auto_396012 ) ) ( not ( = ?auto_396004 ?auto_396013 ) ) ( not ( = ?auto_396004 ?auto_396014 ) ) ( not ( = ?auto_396004 ?auto_396015 ) ) ( not ( = ?auto_396005 ?auto_396006 ) ) ( not ( = ?auto_396005 ?auto_396007 ) ) ( not ( = ?auto_396005 ?auto_396008 ) ) ( not ( = ?auto_396005 ?auto_396009 ) ) ( not ( = ?auto_396005 ?auto_396010 ) ) ( not ( = ?auto_396005 ?auto_396011 ) ) ( not ( = ?auto_396005 ?auto_396012 ) ) ( not ( = ?auto_396005 ?auto_396013 ) ) ( not ( = ?auto_396005 ?auto_396014 ) ) ( not ( = ?auto_396005 ?auto_396015 ) ) ( not ( = ?auto_396006 ?auto_396007 ) ) ( not ( = ?auto_396006 ?auto_396008 ) ) ( not ( = ?auto_396006 ?auto_396009 ) ) ( not ( = ?auto_396006 ?auto_396010 ) ) ( not ( = ?auto_396006 ?auto_396011 ) ) ( not ( = ?auto_396006 ?auto_396012 ) ) ( not ( = ?auto_396006 ?auto_396013 ) ) ( not ( = ?auto_396006 ?auto_396014 ) ) ( not ( = ?auto_396006 ?auto_396015 ) ) ( not ( = ?auto_396007 ?auto_396008 ) ) ( not ( = ?auto_396007 ?auto_396009 ) ) ( not ( = ?auto_396007 ?auto_396010 ) ) ( not ( = ?auto_396007 ?auto_396011 ) ) ( not ( = ?auto_396007 ?auto_396012 ) ) ( not ( = ?auto_396007 ?auto_396013 ) ) ( not ( = ?auto_396007 ?auto_396014 ) ) ( not ( = ?auto_396007 ?auto_396015 ) ) ( not ( = ?auto_396008 ?auto_396009 ) ) ( not ( = ?auto_396008 ?auto_396010 ) ) ( not ( = ?auto_396008 ?auto_396011 ) ) ( not ( = ?auto_396008 ?auto_396012 ) ) ( not ( = ?auto_396008 ?auto_396013 ) ) ( not ( = ?auto_396008 ?auto_396014 ) ) ( not ( = ?auto_396008 ?auto_396015 ) ) ( not ( = ?auto_396009 ?auto_396010 ) ) ( not ( = ?auto_396009 ?auto_396011 ) ) ( not ( = ?auto_396009 ?auto_396012 ) ) ( not ( = ?auto_396009 ?auto_396013 ) ) ( not ( = ?auto_396009 ?auto_396014 ) ) ( not ( = ?auto_396009 ?auto_396015 ) ) ( not ( = ?auto_396010 ?auto_396011 ) ) ( not ( = ?auto_396010 ?auto_396012 ) ) ( not ( = ?auto_396010 ?auto_396013 ) ) ( not ( = ?auto_396010 ?auto_396014 ) ) ( not ( = ?auto_396010 ?auto_396015 ) ) ( not ( = ?auto_396011 ?auto_396012 ) ) ( not ( = ?auto_396011 ?auto_396013 ) ) ( not ( = ?auto_396011 ?auto_396014 ) ) ( not ( = ?auto_396011 ?auto_396015 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_396012 ?auto_396013 ?auto_396014 )
      ( MAKE-10CRATE-VERIFY ?auto_396004 ?auto_396005 ?auto_396006 ?auto_396007 ?auto_396008 ?auto_396009 ?auto_396010 ?auto_396011 ?auto_396012 ?auto_396013 ?auto_396014 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_396130 - SURFACE
      ?auto_396131 - SURFACE
      ?auto_396132 - SURFACE
      ?auto_396133 - SURFACE
      ?auto_396134 - SURFACE
      ?auto_396135 - SURFACE
      ?auto_396136 - SURFACE
      ?auto_396137 - SURFACE
      ?auto_396138 - SURFACE
      ?auto_396139 - SURFACE
      ?auto_396140 - SURFACE
    )
    :vars
    (
      ?auto_396144 - HOIST
      ?auto_396145 - PLACE
      ?auto_396143 - PLACE
      ?auto_396142 - HOIST
      ?auto_396141 - SURFACE
      ?auto_396146 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_396144 ?auto_396145 ) ( IS-CRATE ?auto_396140 ) ( not ( = ?auto_396139 ?auto_396140 ) ) ( not ( = ?auto_396138 ?auto_396139 ) ) ( not ( = ?auto_396138 ?auto_396140 ) ) ( not ( = ?auto_396143 ?auto_396145 ) ) ( HOIST-AT ?auto_396142 ?auto_396143 ) ( not ( = ?auto_396144 ?auto_396142 ) ) ( AVAILABLE ?auto_396142 ) ( SURFACE-AT ?auto_396140 ?auto_396143 ) ( ON ?auto_396140 ?auto_396141 ) ( CLEAR ?auto_396140 ) ( not ( = ?auto_396139 ?auto_396141 ) ) ( not ( = ?auto_396140 ?auto_396141 ) ) ( not ( = ?auto_396138 ?auto_396141 ) ) ( TRUCK-AT ?auto_396146 ?auto_396145 ) ( SURFACE-AT ?auto_396138 ?auto_396145 ) ( CLEAR ?auto_396138 ) ( LIFTING ?auto_396144 ?auto_396139 ) ( IS-CRATE ?auto_396139 ) ( ON ?auto_396131 ?auto_396130 ) ( ON ?auto_396132 ?auto_396131 ) ( ON ?auto_396133 ?auto_396132 ) ( ON ?auto_396134 ?auto_396133 ) ( ON ?auto_396135 ?auto_396134 ) ( ON ?auto_396136 ?auto_396135 ) ( ON ?auto_396137 ?auto_396136 ) ( ON ?auto_396138 ?auto_396137 ) ( not ( = ?auto_396130 ?auto_396131 ) ) ( not ( = ?auto_396130 ?auto_396132 ) ) ( not ( = ?auto_396130 ?auto_396133 ) ) ( not ( = ?auto_396130 ?auto_396134 ) ) ( not ( = ?auto_396130 ?auto_396135 ) ) ( not ( = ?auto_396130 ?auto_396136 ) ) ( not ( = ?auto_396130 ?auto_396137 ) ) ( not ( = ?auto_396130 ?auto_396138 ) ) ( not ( = ?auto_396130 ?auto_396139 ) ) ( not ( = ?auto_396130 ?auto_396140 ) ) ( not ( = ?auto_396130 ?auto_396141 ) ) ( not ( = ?auto_396131 ?auto_396132 ) ) ( not ( = ?auto_396131 ?auto_396133 ) ) ( not ( = ?auto_396131 ?auto_396134 ) ) ( not ( = ?auto_396131 ?auto_396135 ) ) ( not ( = ?auto_396131 ?auto_396136 ) ) ( not ( = ?auto_396131 ?auto_396137 ) ) ( not ( = ?auto_396131 ?auto_396138 ) ) ( not ( = ?auto_396131 ?auto_396139 ) ) ( not ( = ?auto_396131 ?auto_396140 ) ) ( not ( = ?auto_396131 ?auto_396141 ) ) ( not ( = ?auto_396132 ?auto_396133 ) ) ( not ( = ?auto_396132 ?auto_396134 ) ) ( not ( = ?auto_396132 ?auto_396135 ) ) ( not ( = ?auto_396132 ?auto_396136 ) ) ( not ( = ?auto_396132 ?auto_396137 ) ) ( not ( = ?auto_396132 ?auto_396138 ) ) ( not ( = ?auto_396132 ?auto_396139 ) ) ( not ( = ?auto_396132 ?auto_396140 ) ) ( not ( = ?auto_396132 ?auto_396141 ) ) ( not ( = ?auto_396133 ?auto_396134 ) ) ( not ( = ?auto_396133 ?auto_396135 ) ) ( not ( = ?auto_396133 ?auto_396136 ) ) ( not ( = ?auto_396133 ?auto_396137 ) ) ( not ( = ?auto_396133 ?auto_396138 ) ) ( not ( = ?auto_396133 ?auto_396139 ) ) ( not ( = ?auto_396133 ?auto_396140 ) ) ( not ( = ?auto_396133 ?auto_396141 ) ) ( not ( = ?auto_396134 ?auto_396135 ) ) ( not ( = ?auto_396134 ?auto_396136 ) ) ( not ( = ?auto_396134 ?auto_396137 ) ) ( not ( = ?auto_396134 ?auto_396138 ) ) ( not ( = ?auto_396134 ?auto_396139 ) ) ( not ( = ?auto_396134 ?auto_396140 ) ) ( not ( = ?auto_396134 ?auto_396141 ) ) ( not ( = ?auto_396135 ?auto_396136 ) ) ( not ( = ?auto_396135 ?auto_396137 ) ) ( not ( = ?auto_396135 ?auto_396138 ) ) ( not ( = ?auto_396135 ?auto_396139 ) ) ( not ( = ?auto_396135 ?auto_396140 ) ) ( not ( = ?auto_396135 ?auto_396141 ) ) ( not ( = ?auto_396136 ?auto_396137 ) ) ( not ( = ?auto_396136 ?auto_396138 ) ) ( not ( = ?auto_396136 ?auto_396139 ) ) ( not ( = ?auto_396136 ?auto_396140 ) ) ( not ( = ?auto_396136 ?auto_396141 ) ) ( not ( = ?auto_396137 ?auto_396138 ) ) ( not ( = ?auto_396137 ?auto_396139 ) ) ( not ( = ?auto_396137 ?auto_396140 ) ) ( not ( = ?auto_396137 ?auto_396141 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_396138 ?auto_396139 ?auto_396140 )
      ( MAKE-10CRATE-VERIFY ?auto_396130 ?auto_396131 ?auto_396132 ?auto_396133 ?auto_396134 ?auto_396135 ?auto_396136 ?auto_396137 ?auto_396138 ?auto_396139 ?auto_396140 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_396256 - SURFACE
      ?auto_396257 - SURFACE
      ?auto_396258 - SURFACE
      ?auto_396259 - SURFACE
      ?auto_396260 - SURFACE
      ?auto_396261 - SURFACE
      ?auto_396262 - SURFACE
      ?auto_396263 - SURFACE
      ?auto_396264 - SURFACE
      ?auto_396265 - SURFACE
      ?auto_396266 - SURFACE
    )
    :vars
    (
      ?auto_396271 - HOIST
      ?auto_396269 - PLACE
      ?auto_396270 - PLACE
      ?auto_396268 - HOIST
      ?auto_396272 - SURFACE
      ?auto_396267 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_396271 ?auto_396269 ) ( IS-CRATE ?auto_396266 ) ( not ( = ?auto_396265 ?auto_396266 ) ) ( not ( = ?auto_396264 ?auto_396265 ) ) ( not ( = ?auto_396264 ?auto_396266 ) ) ( not ( = ?auto_396270 ?auto_396269 ) ) ( HOIST-AT ?auto_396268 ?auto_396270 ) ( not ( = ?auto_396271 ?auto_396268 ) ) ( AVAILABLE ?auto_396268 ) ( SURFACE-AT ?auto_396266 ?auto_396270 ) ( ON ?auto_396266 ?auto_396272 ) ( CLEAR ?auto_396266 ) ( not ( = ?auto_396265 ?auto_396272 ) ) ( not ( = ?auto_396266 ?auto_396272 ) ) ( not ( = ?auto_396264 ?auto_396272 ) ) ( TRUCK-AT ?auto_396267 ?auto_396269 ) ( SURFACE-AT ?auto_396264 ?auto_396269 ) ( CLEAR ?auto_396264 ) ( IS-CRATE ?auto_396265 ) ( AVAILABLE ?auto_396271 ) ( IN ?auto_396265 ?auto_396267 ) ( ON ?auto_396257 ?auto_396256 ) ( ON ?auto_396258 ?auto_396257 ) ( ON ?auto_396259 ?auto_396258 ) ( ON ?auto_396260 ?auto_396259 ) ( ON ?auto_396261 ?auto_396260 ) ( ON ?auto_396262 ?auto_396261 ) ( ON ?auto_396263 ?auto_396262 ) ( ON ?auto_396264 ?auto_396263 ) ( not ( = ?auto_396256 ?auto_396257 ) ) ( not ( = ?auto_396256 ?auto_396258 ) ) ( not ( = ?auto_396256 ?auto_396259 ) ) ( not ( = ?auto_396256 ?auto_396260 ) ) ( not ( = ?auto_396256 ?auto_396261 ) ) ( not ( = ?auto_396256 ?auto_396262 ) ) ( not ( = ?auto_396256 ?auto_396263 ) ) ( not ( = ?auto_396256 ?auto_396264 ) ) ( not ( = ?auto_396256 ?auto_396265 ) ) ( not ( = ?auto_396256 ?auto_396266 ) ) ( not ( = ?auto_396256 ?auto_396272 ) ) ( not ( = ?auto_396257 ?auto_396258 ) ) ( not ( = ?auto_396257 ?auto_396259 ) ) ( not ( = ?auto_396257 ?auto_396260 ) ) ( not ( = ?auto_396257 ?auto_396261 ) ) ( not ( = ?auto_396257 ?auto_396262 ) ) ( not ( = ?auto_396257 ?auto_396263 ) ) ( not ( = ?auto_396257 ?auto_396264 ) ) ( not ( = ?auto_396257 ?auto_396265 ) ) ( not ( = ?auto_396257 ?auto_396266 ) ) ( not ( = ?auto_396257 ?auto_396272 ) ) ( not ( = ?auto_396258 ?auto_396259 ) ) ( not ( = ?auto_396258 ?auto_396260 ) ) ( not ( = ?auto_396258 ?auto_396261 ) ) ( not ( = ?auto_396258 ?auto_396262 ) ) ( not ( = ?auto_396258 ?auto_396263 ) ) ( not ( = ?auto_396258 ?auto_396264 ) ) ( not ( = ?auto_396258 ?auto_396265 ) ) ( not ( = ?auto_396258 ?auto_396266 ) ) ( not ( = ?auto_396258 ?auto_396272 ) ) ( not ( = ?auto_396259 ?auto_396260 ) ) ( not ( = ?auto_396259 ?auto_396261 ) ) ( not ( = ?auto_396259 ?auto_396262 ) ) ( not ( = ?auto_396259 ?auto_396263 ) ) ( not ( = ?auto_396259 ?auto_396264 ) ) ( not ( = ?auto_396259 ?auto_396265 ) ) ( not ( = ?auto_396259 ?auto_396266 ) ) ( not ( = ?auto_396259 ?auto_396272 ) ) ( not ( = ?auto_396260 ?auto_396261 ) ) ( not ( = ?auto_396260 ?auto_396262 ) ) ( not ( = ?auto_396260 ?auto_396263 ) ) ( not ( = ?auto_396260 ?auto_396264 ) ) ( not ( = ?auto_396260 ?auto_396265 ) ) ( not ( = ?auto_396260 ?auto_396266 ) ) ( not ( = ?auto_396260 ?auto_396272 ) ) ( not ( = ?auto_396261 ?auto_396262 ) ) ( not ( = ?auto_396261 ?auto_396263 ) ) ( not ( = ?auto_396261 ?auto_396264 ) ) ( not ( = ?auto_396261 ?auto_396265 ) ) ( not ( = ?auto_396261 ?auto_396266 ) ) ( not ( = ?auto_396261 ?auto_396272 ) ) ( not ( = ?auto_396262 ?auto_396263 ) ) ( not ( = ?auto_396262 ?auto_396264 ) ) ( not ( = ?auto_396262 ?auto_396265 ) ) ( not ( = ?auto_396262 ?auto_396266 ) ) ( not ( = ?auto_396262 ?auto_396272 ) ) ( not ( = ?auto_396263 ?auto_396264 ) ) ( not ( = ?auto_396263 ?auto_396265 ) ) ( not ( = ?auto_396263 ?auto_396266 ) ) ( not ( = ?auto_396263 ?auto_396272 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_396264 ?auto_396265 ?auto_396266 )
      ( MAKE-10CRATE-VERIFY ?auto_396256 ?auto_396257 ?auto_396258 ?auto_396259 ?auto_396260 ?auto_396261 ?auto_396262 ?auto_396263 ?auto_396264 ?auto_396265 ?auto_396266 ) )
  )

)

