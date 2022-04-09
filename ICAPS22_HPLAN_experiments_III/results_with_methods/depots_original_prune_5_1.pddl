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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15576 - SURFACE
      ?auto_15577 - SURFACE
    )
    :vars
    (
      ?auto_15578 - HOIST
      ?auto_15579 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15578 ?auto_15579 ) ( SURFACE-AT ?auto_15576 ?auto_15579 ) ( CLEAR ?auto_15576 ) ( LIFTING ?auto_15578 ?auto_15577 ) ( IS-CRATE ?auto_15577 ) ( not ( = ?auto_15576 ?auto_15577 ) ) )
    :subtasks
    ( ( !DROP ?auto_15578 ?auto_15577 ?auto_15576 ?auto_15579 )
      ( MAKE-1CRATE-VERIFY ?auto_15576 ?auto_15577 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15580 - SURFACE
      ?auto_15581 - SURFACE
    )
    :vars
    (
      ?auto_15583 - HOIST
      ?auto_15582 - PLACE
      ?auto_15584 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15583 ?auto_15582 ) ( SURFACE-AT ?auto_15580 ?auto_15582 ) ( CLEAR ?auto_15580 ) ( IS-CRATE ?auto_15581 ) ( not ( = ?auto_15580 ?auto_15581 ) ) ( TRUCK-AT ?auto_15584 ?auto_15582 ) ( AVAILABLE ?auto_15583 ) ( IN ?auto_15581 ?auto_15584 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15583 ?auto_15581 ?auto_15584 ?auto_15582 )
      ( MAKE-1CRATE ?auto_15580 ?auto_15581 )
      ( MAKE-1CRATE-VERIFY ?auto_15580 ?auto_15581 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15585 - SURFACE
      ?auto_15586 - SURFACE
    )
    :vars
    (
      ?auto_15589 - HOIST
      ?auto_15588 - PLACE
      ?auto_15587 - TRUCK
      ?auto_15590 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15589 ?auto_15588 ) ( SURFACE-AT ?auto_15585 ?auto_15588 ) ( CLEAR ?auto_15585 ) ( IS-CRATE ?auto_15586 ) ( not ( = ?auto_15585 ?auto_15586 ) ) ( AVAILABLE ?auto_15589 ) ( IN ?auto_15586 ?auto_15587 ) ( TRUCK-AT ?auto_15587 ?auto_15590 ) ( not ( = ?auto_15590 ?auto_15588 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15587 ?auto_15590 ?auto_15588 )
      ( MAKE-1CRATE ?auto_15585 ?auto_15586 )
      ( MAKE-1CRATE-VERIFY ?auto_15585 ?auto_15586 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15591 - SURFACE
      ?auto_15592 - SURFACE
    )
    :vars
    (
      ?auto_15594 - HOIST
      ?auto_15596 - PLACE
      ?auto_15593 - TRUCK
      ?auto_15595 - PLACE
      ?auto_15597 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15594 ?auto_15596 ) ( SURFACE-AT ?auto_15591 ?auto_15596 ) ( CLEAR ?auto_15591 ) ( IS-CRATE ?auto_15592 ) ( not ( = ?auto_15591 ?auto_15592 ) ) ( AVAILABLE ?auto_15594 ) ( TRUCK-AT ?auto_15593 ?auto_15595 ) ( not ( = ?auto_15595 ?auto_15596 ) ) ( HOIST-AT ?auto_15597 ?auto_15595 ) ( LIFTING ?auto_15597 ?auto_15592 ) ( not ( = ?auto_15594 ?auto_15597 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15597 ?auto_15592 ?auto_15593 ?auto_15595 )
      ( MAKE-1CRATE ?auto_15591 ?auto_15592 )
      ( MAKE-1CRATE-VERIFY ?auto_15591 ?auto_15592 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15598 - SURFACE
      ?auto_15599 - SURFACE
    )
    :vars
    (
      ?auto_15603 - HOIST
      ?auto_15600 - PLACE
      ?auto_15601 - TRUCK
      ?auto_15602 - PLACE
      ?auto_15604 - HOIST
      ?auto_15605 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15603 ?auto_15600 ) ( SURFACE-AT ?auto_15598 ?auto_15600 ) ( CLEAR ?auto_15598 ) ( IS-CRATE ?auto_15599 ) ( not ( = ?auto_15598 ?auto_15599 ) ) ( AVAILABLE ?auto_15603 ) ( TRUCK-AT ?auto_15601 ?auto_15602 ) ( not ( = ?auto_15602 ?auto_15600 ) ) ( HOIST-AT ?auto_15604 ?auto_15602 ) ( not ( = ?auto_15603 ?auto_15604 ) ) ( AVAILABLE ?auto_15604 ) ( SURFACE-AT ?auto_15599 ?auto_15602 ) ( ON ?auto_15599 ?auto_15605 ) ( CLEAR ?auto_15599 ) ( not ( = ?auto_15598 ?auto_15605 ) ) ( not ( = ?auto_15599 ?auto_15605 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15604 ?auto_15599 ?auto_15605 ?auto_15602 )
      ( MAKE-1CRATE ?auto_15598 ?auto_15599 )
      ( MAKE-1CRATE-VERIFY ?auto_15598 ?auto_15599 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15606 - SURFACE
      ?auto_15607 - SURFACE
    )
    :vars
    (
      ?auto_15608 - HOIST
      ?auto_15610 - PLACE
      ?auto_15611 - PLACE
      ?auto_15612 - HOIST
      ?auto_15609 - SURFACE
      ?auto_15613 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15608 ?auto_15610 ) ( SURFACE-AT ?auto_15606 ?auto_15610 ) ( CLEAR ?auto_15606 ) ( IS-CRATE ?auto_15607 ) ( not ( = ?auto_15606 ?auto_15607 ) ) ( AVAILABLE ?auto_15608 ) ( not ( = ?auto_15611 ?auto_15610 ) ) ( HOIST-AT ?auto_15612 ?auto_15611 ) ( not ( = ?auto_15608 ?auto_15612 ) ) ( AVAILABLE ?auto_15612 ) ( SURFACE-AT ?auto_15607 ?auto_15611 ) ( ON ?auto_15607 ?auto_15609 ) ( CLEAR ?auto_15607 ) ( not ( = ?auto_15606 ?auto_15609 ) ) ( not ( = ?auto_15607 ?auto_15609 ) ) ( TRUCK-AT ?auto_15613 ?auto_15610 ) )
    :subtasks
    ( ( !DRIVE ?auto_15613 ?auto_15610 ?auto_15611 )
      ( MAKE-1CRATE ?auto_15606 ?auto_15607 )
      ( MAKE-1CRATE-VERIFY ?auto_15606 ?auto_15607 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15623 - SURFACE
      ?auto_15624 - SURFACE
      ?auto_15625 - SURFACE
    )
    :vars
    (
      ?auto_15626 - HOIST
      ?auto_15627 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15626 ?auto_15627 ) ( SURFACE-AT ?auto_15624 ?auto_15627 ) ( CLEAR ?auto_15624 ) ( LIFTING ?auto_15626 ?auto_15625 ) ( IS-CRATE ?auto_15625 ) ( not ( = ?auto_15624 ?auto_15625 ) ) ( ON ?auto_15624 ?auto_15623 ) ( not ( = ?auto_15623 ?auto_15624 ) ) ( not ( = ?auto_15623 ?auto_15625 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15624 ?auto_15625 )
      ( MAKE-2CRATE-VERIFY ?auto_15623 ?auto_15624 ?auto_15625 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15633 - SURFACE
      ?auto_15634 - SURFACE
      ?auto_15635 - SURFACE
    )
    :vars
    (
      ?auto_15637 - HOIST
      ?auto_15636 - PLACE
      ?auto_15638 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15637 ?auto_15636 ) ( SURFACE-AT ?auto_15634 ?auto_15636 ) ( CLEAR ?auto_15634 ) ( IS-CRATE ?auto_15635 ) ( not ( = ?auto_15634 ?auto_15635 ) ) ( TRUCK-AT ?auto_15638 ?auto_15636 ) ( AVAILABLE ?auto_15637 ) ( IN ?auto_15635 ?auto_15638 ) ( ON ?auto_15634 ?auto_15633 ) ( not ( = ?auto_15633 ?auto_15634 ) ) ( not ( = ?auto_15633 ?auto_15635 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15634 ?auto_15635 )
      ( MAKE-2CRATE-VERIFY ?auto_15633 ?auto_15634 ?auto_15635 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15639 - SURFACE
      ?auto_15640 - SURFACE
    )
    :vars
    (
      ?auto_15643 - HOIST
      ?auto_15641 - PLACE
      ?auto_15642 - TRUCK
      ?auto_15644 - SURFACE
      ?auto_15645 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15643 ?auto_15641 ) ( SURFACE-AT ?auto_15639 ?auto_15641 ) ( CLEAR ?auto_15639 ) ( IS-CRATE ?auto_15640 ) ( not ( = ?auto_15639 ?auto_15640 ) ) ( AVAILABLE ?auto_15643 ) ( IN ?auto_15640 ?auto_15642 ) ( ON ?auto_15639 ?auto_15644 ) ( not ( = ?auto_15644 ?auto_15639 ) ) ( not ( = ?auto_15644 ?auto_15640 ) ) ( TRUCK-AT ?auto_15642 ?auto_15645 ) ( not ( = ?auto_15645 ?auto_15641 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15642 ?auto_15645 ?auto_15641 )
      ( MAKE-2CRATE ?auto_15644 ?auto_15639 ?auto_15640 )
      ( MAKE-1CRATE-VERIFY ?auto_15639 ?auto_15640 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15646 - SURFACE
      ?auto_15647 - SURFACE
      ?auto_15648 - SURFACE
    )
    :vars
    (
      ?auto_15652 - HOIST
      ?auto_15651 - PLACE
      ?auto_15649 - TRUCK
      ?auto_15650 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15652 ?auto_15651 ) ( SURFACE-AT ?auto_15647 ?auto_15651 ) ( CLEAR ?auto_15647 ) ( IS-CRATE ?auto_15648 ) ( not ( = ?auto_15647 ?auto_15648 ) ) ( AVAILABLE ?auto_15652 ) ( IN ?auto_15648 ?auto_15649 ) ( ON ?auto_15647 ?auto_15646 ) ( not ( = ?auto_15646 ?auto_15647 ) ) ( not ( = ?auto_15646 ?auto_15648 ) ) ( TRUCK-AT ?auto_15649 ?auto_15650 ) ( not ( = ?auto_15650 ?auto_15651 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15647 ?auto_15648 )
      ( MAKE-2CRATE-VERIFY ?auto_15646 ?auto_15647 ?auto_15648 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15653 - SURFACE
      ?auto_15654 - SURFACE
    )
    :vars
    (
      ?auto_15657 - HOIST
      ?auto_15658 - PLACE
      ?auto_15655 - SURFACE
      ?auto_15659 - TRUCK
      ?auto_15656 - PLACE
      ?auto_15660 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15657 ?auto_15658 ) ( SURFACE-AT ?auto_15653 ?auto_15658 ) ( CLEAR ?auto_15653 ) ( IS-CRATE ?auto_15654 ) ( not ( = ?auto_15653 ?auto_15654 ) ) ( AVAILABLE ?auto_15657 ) ( ON ?auto_15653 ?auto_15655 ) ( not ( = ?auto_15655 ?auto_15653 ) ) ( not ( = ?auto_15655 ?auto_15654 ) ) ( TRUCK-AT ?auto_15659 ?auto_15656 ) ( not ( = ?auto_15656 ?auto_15658 ) ) ( HOIST-AT ?auto_15660 ?auto_15656 ) ( LIFTING ?auto_15660 ?auto_15654 ) ( not ( = ?auto_15657 ?auto_15660 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15660 ?auto_15654 ?auto_15659 ?auto_15656 )
      ( MAKE-2CRATE ?auto_15655 ?auto_15653 ?auto_15654 )
      ( MAKE-1CRATE-VERIFY ?auto_15653 ?auto_15654 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15661 - SURFACE
      ?auto_15662 - SURFACE
      ?auto_15663 - SURFACE
    )
    :vars
    (
      ?auto_15665 - HOIST
      ?auto_15664 - PLACE
      ?auto_15666 - TRUCK
      ?auto_15668 - PLACE
      ?auto_15667 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15665 ?auto_15664 ) ( SURFACE-AT ?auto_15662 ?auto_15664 ) ( CLEAR ?auto_15662 ) ( IS-CRATE ?auto_15663 ) ( not ( = ?auto_15662 ?auto_15663 ) ) ( AVAILABLE ?auto_15665 ) ( ON ?auto_15662 ?auto_15661 ) ( not ( = ?auto_15661 ?auto_15662 ) ) ( not ( = ?auto_15661 ?auto_15663 ) ) ( TRUCK-AT ?auto_15666 ?auto_15668 ) ( not ( = ?auto_15668 ?auto_15664 ) ) ( HOIST-AT ?auto_15667 ?auto_15668 ) ( LIFTING ?auto_15667 ?auto_15663 ) ( not ( = ?auto_15665 ?auto_15667 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15662 ?auto_15663 )
      ( MAKE-2CRATE-VERIFY ?auto_15661 ?auto_15662 ?auto_15663 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15669 - SURFACE
      ?auto_15670 - SURFACE
    )
    :vars
    (
      ?auto_15672 - HOIST
      ?auto_15676 - PLACE
      ?auto_15674 - SURFACE
      ?auto_15675 - TRUCK
      ?auto_15671 - PLACE
      ?auto_15673 - HOIST
      ?auto_15677 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15672 ?auto_15676 ) ( SURFACE-AT ?auto_15669 ?auto_15676 ) ( CLEAR ?auto_15669 ) ( IS-CRATE ?auto_15670 ) ( not ( = ?auto_15669 ?auto_15670 ) ) ( AVAILABLE ?auto_15672 ) ( ON ?auto_15669 ?auto_15674 ) ( not ( = ?auto_15674 ?auto_15669 ) ) ( not ( = ?auto_15674 ?auto_15670 ) ) ( TRUCK-AT ?auto_15675 ?auto_15671 ) ( not ( = ?auto_15671 ?auto_15676 ) ) ( HOIST-AT ?auto_15673 ?auto_15671 ) ( not ( = ?auto_15672 ?auto_15673 ) ) ( AVAILABLE ?auto_15673 ) ( SURFACE-AT ?auto_15670 ?auto_15671 ) ( ON ?auto_15670 ?auto_15677 ) ( CLEAR ?auto_15670 ) ( not ( = ?auto_15669 ?auto_15677 ) ) ( not ( = ?auto_15670 ?auto_15677 ) ) ( not ( = ?auto_15674 ?auto_15677 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15673 ?auto_15670 ?auto_15677 ?auto_15671 )
      ( MAKE-2CRATE ?auto_15674 ?auto_15669 ?auto_15670 )
      ( MAKE-1CRATE-VERIFY ?auto_15669 ?auto_15670 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15678 - SURFACE
      ?auto_15679 - SURFACE
      ?auto_15680 - SURFACE
    )
    :vars
    (
      ?auto_15683 - HOIST
      ?auto_15682 - PLACE
      ?auto_15684 - TRUCK
      ?auto_15686 - PLACE
      ?auto_15681 - HOIST
      ?auto_15685 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15683 ?auto_15682 ) ( SURFACE-AT ?auto_15679 ?auto_15682 ) ( CLEAR ?auto_15679 ) ( IS-CRATE ?auto_15680 ) ( not ( = ?auto_15679 ?auto_15680 ) ) ( AVAILABLE ?auto_15683 ) ( ON ?auto_15679 ?auto_15678 ) ( not ( = ?auto_15678 ?auto_15679 ) ) ( not ( = ?auto_15678 ?auto_15680 ) ) ( TRUCK-AT ?auto_15684 ?auto_15686 ) ( not ( = ?auto_15686 ?auto_15682 ) ) ( HOIST-AT ?auto_15681 ?auto_15686 ) ( not ( = ?auto_15683 ?auto_15681 ) ) ( AVAILABLE ?auto_15681 ) ( SURFACE-AT ?auto_15680 ?auto_15686 ) ( ON ?auto_15680 ?auto_15685 ) ( CLEAR ?auto_15680 ) ( not ( = ?auto_15679 ?auto_15685 ) ) ( not ( = ?auto_15680 ?auto_15685 ) ) ( not ( = ?auto_15678 ?auto_15685 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15679 ?auto_15680 )
      ( MAKE-2CRATE-VERIFY ?auto_15678 ?auto_15679 ?auto_15680 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15687 - SURFACE
      ?auto_15688 - SURFACE
    )
    :vars
    (
      ?auto_15692 - HOIST
      ?auto_15689 - PLACE
      ?auto_15694 - SURFACE
      ?auto_15695 - PLACE
      ?auto_15693 - HOIST
      ?auto_15690 - SURFACE
      ?auto_15691 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15692 ?auto_15689 ) ( SURFACE-AT ?auto_15687 ?auto_15689 ) ( CLEAR ?auto_15687 ) ( IS-CRATE ?auto_15688 ) ( not ( = ?auto_15687 ?auto_15688 ) ) ( AVAILABLE ?auto_15692 ) ( ON ?auto_15687 ?auto_15694 ) ( not ( = ?auto_15694 ?auto_15687 ) ) ( not ( = ?auto_15694 ?auto_15688 ) ) ( not ( = ?auto_15695 ?auto_15689 ) ) ( HOIST-AT ?auto_15693 ?auto_15695 ) ( not ( = ?auto_15692 ?auto_15693 ) ) ( AVAILABLE ?auto_15693 ) ( SURFACE-AT ?auto_15688 ?auto_15695 ) ( ON ?auto_15688 ?auto_15690 ) ( CLEAR ?auto_15688 ) ( not ( = ?auto_15687 ?auto_15690 ) ) ( not ( = ?auto_15688 ?auto_15690 ) ) ( not ( = ?auto_15694 ?auto_15690 ) ) ( TRUCK-AT ?auto_15691 ?auto_15689 ) )
    :subtasks
    ( ( !DRIVE ?auto_15691 ?auto_15689 ?auto_15695 )
      ( MAKE-2CRATE ?auto_15694 ?auto_15687 ?auto_15688 )
      ( MAKE-1CRATE-VERIFY ?auto_15687 ?auto_15688 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15696 - SURFACE
      ?auto_15697 - SURFACE
      ?auto_15698 - SURFACE
    )
    :vars
    (
      ?auto_15700 - HOIST
      ?auto_15704 - PLACE
      ?auto_15701 - PLACE
      ?auto_15699 - HOIST
      ?auto_15703 - SURFACE
      ?auto_15702 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15700 ?auto_15704 ) ( SURFACE-AT ?auto_15697 ?auto_15704 ) ( CLEAR ?auto_15697 ) ( IS-CRATE ?auto_15698 ) ( not ( = ?auto_15697 ?auto_15698 ) ) ( AVAILABLE ?auto_15700 ) ( ON ?auto_15697 ?auto_15696 ) ( not ( = ?auto_15696 ?auto_15697 ) ) ( not ( = ?auto_15696 ?auto_15698 ) ) ( not ( = ?auto_15701 ?auto_15704 ) ) ( HOIST-AT ?auto_15699 ?auto_15701 ) ( not ( = ?auto_15700 ?auto_15699 ) ) ( AVAILABLE ?auto_15699 ) ( SURFACE-AT ?auto_15698 ?auto_15701 ) ( ON ?auto_15698 ?auto_15703 ) ( CLEAR ?auto_15698 ) ( not ( = ?auto_15697 ?auto_15703 ) ) ( not ( = ?auto_15698 ?auto_15703 ) ) ( not ( = ?auto_15696 ?auto_15703 ) ) ( TRUCK-AT ?auto_15702 ?auto_15704 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15697 ?auto_15698 )
      ( MAKE-2CRATE-VERIFY ?auto_15696 ?auto_15697 ?auto_15698 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15705 - SURFACE
      ?auto_15706 - SURFACE
    )
    :vars
    (
      ?auto_15708 - HOIST
      ?auto_15712 - PLACE
      ?auto_15707 - SURFACE
      ?auto_15713 - PLACE
      ?auto_15709 - HOIST
      ?auto_15710 - SURFACE
      ?auto_15711 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15708 ?auto_15712 ) ( IS-CRATE ?auto_15706 ) ( not ( = ?auto_15705 ?auto_15706 ) ) ( not ( = ?auto_15707 ?auto_15705 ) ) ( not ( = ?auto_15707 ?auto_15706 ) ) ( not ( = ?auto_15713 ?auto_15712 ) ) ( HOIST-AT ?auto_15709 ?auto_15713 ) ( not ( = ?auto_15708 ?auto_15709 ) ) ( AVAILABLE ?auto_15709 ) ( SURFACE-AT ?auto_15706 ?auto_15713 ) ( ON ?auto_15706 ?auto_15710 ) ( CLEAR ?auto_15706 ) ( not ( = ?auto_15705 ?auto_15710 ) ) ( not ( = ?auto_15706 ?auto_15710 ) ) ( not ( = ?auto_15707 ?auto_15710 ) ) ( TRUCK-AT ?auto_15711 ?auto_15712 ) ( SURFACE-AT ?auto_15707 ?auto_15712 ) ( CLEAR ?auto_15707 ) ( LIFTING ?auto_15708 ?auto_15705 ) ( IS-CRATE ?auto_15705 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15707 ?auto_15705 )
      ( MAKE-2CRATE ?auto_15707 ?auto_15705 ?auto_15706 )
      ( MAKE-1CRATE-VERIFY ?auto_15705 ?auto_15706 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15714 - SURFACE
      ?auto_15715 - SURFACE
      ?auto_15716 - SURFACE
    )
    :vars
    (
      ?auto_15721 - HOIST
      ?auto_15718 - PLACE
      ?auto_15722 - PLACE
      ?auto_15717 - HOIST
      ?auto_15720 - SURFACE
      ?auto_15719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15721 ?auto_15718 ) ( IS-CRATE ?auto_15716 ) ( not ( = ?auto_15715 ?auto_15716 ) ) ( not ( = ?auto_15714 ?auto_15715 ) ) ( not ( = ?auto_15714 ?auto_15716 ) ) ( not ( = ?auto_15722 ?auto_15718 ) ) ( HOIST-AT ?auto_15717 ?auto_15722 ) ( not ( = ?auto_15721 ?auto_15717 ) ) ( AVAILABLE ?auto_15717 ) ( SURFACE-AT ?auto_15716 ?auto_15722 ) ( ON ?auto_15716 ?auto_15720 ) ( CLEAR ?auto_15716 ) ( not ( = ?auto_15715 ?auto_15720 ) ) ( not ( = ?auto_15716 ?auto_15720 ) ) ( not ( = ?auto_15714 ?auto_15720 ) ) ( TRUCK-AT ?auto_15719 ?auto_15718 ) ( SURFACE-AT ?auto_15714 ?auto_15718 ) ( CLEAR ?auto_15714 ) ( LIFTING ?auto_15721 ?auto_15715 ) ( IS-CRATE ?auto_15715 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15715 ?auto_15716 )
      ( MAKE-2CRATE-VERIFY ?auto_15714 ?auto_15715 ?auto_15716 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15723 - SURFACE
      ?auto_15724 - SURFACE
    )
    :vars
    (
      ?auto_15730 - HOIST
      ?auto_15727 - PLACE
      ?auto_15729 - SURFACE
      ?auto_15728 - PLACE
      ?auto_15731 - HOIST
      ?auto_15725 - SURFACE
      ?auto_15726 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15730 ?auto_15727 ) ( IS-CRATE ?auto_15724 ) ( not ( = ?auto_15723 ?auto_15724 ) ) ( not ( = ?auto_15729 ?auto_15723 ) ) ( not ( = ?auto_15729 ?auto_15724 ) ) ( not ( = ?auto_15728 ?auto_15727 ) ) ( HOIST-AT ?auto_15731 ?auto_15728 ) ( not ( = ?auto_15730 ?auto_15731 ) ) ( AVAILABLE ?auto_15731 ) ( SURFACE-AT ?auto_15724 ?auto_15728 ) ( ON ?auto_15724 ?auto_15725 ) ( CLEAR ?auto_15724 ) ( not ( = ?auto_15723 ?auto_15725 ) ) ( not ( = ?auto_15724 ?auto_15725 ) ) ( not ( = ?auto_15729 ?auto_15725 ) ) ( TRUCK-AT ?auto_15726 ?auto_15727 ) ( SURFACE-AT ?auto_15729 ?auto_15727 ) ( CLEAR ?auto_15729 ) ( IS-CRATE ?auto_15723 ) ( AVAILABLE ?auto_15730 ) ( IN ?auto_15723 ?auto_15726 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15730 ?auto_15723 ?auto_15726 ?auto_15727 )
      ( MAKE-2CRATE ?auto_15729 ?auto_15723 ?auto_15724 )
      ( MAKE-1CRATE-VERIFY ?auto_15723 ?auto_15724 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15732 - SURFACE
      ?auto_15733 - SURFACE
      ?auto_15734 - SURFACE
    )
    :vars
    (
      ?auto_15737 - HOIST
      ?auto_15739 - PLACE
      ?auto_15740 - PLACE
      ?auto_15738 - HOIST
      ?auto_15736 - SURFACE
      ?auto_15735 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15737 ?auto_15739 ) ( IS-CRATE ?auto_15734 ) ( not ( = ?auto_15733 ?auto_15734 ) ) ( not ( = ?auto_15732 ?auto_15733 ) ) ( not ( = ?auto_15732 ?auto_15734 ) ) ( not ( = ?auto_15740 ?auto_15739 ) ) ( HOIST-AT ?auto_15738 ?auto_15740 ) ( not ( = ?auto_15737 ?auto_15738 ) ) ( AVAILABLE ?auto_15738 ) ( SURFACE-AT ?auto_15734 ?auto_15740 ) ( ON ?auto_15734 ?auto_15736 ) ( CLEAR ?auto_15734 ) ( not ( = ?auto_15733 ?auto_15736 ) ) ( not ( = ?auto_15734 ?auto_15736 ) ) ( not ( = ?auto_15732 ?auto_15736 ) ) ( TRUCK-AT ?auto_15735 ?auto_15739 ) ( SURFACE-AT ?auto_15732 ?auto_15739 ) ( CLEAR ?auto_15732 ) ( IS-CRATE ?auto_15733 ) ( AVAILABLE ?auto_15737 ) ( IN ?auto_15733 ?auto_15735 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15733 ?auto_15734 )
      ( MAKE-2CRATE-VERIFY ?auto_15732 ?auto_15733 ?auto_15734 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15777 - SURFACE
      ?auto_15778 - SURFACE
    )
    :vars
    (
      ?auto_15783 - HOIST
      ?auto_15779 - PLACE
      ?auto_15785 - SURFACE
      ?auto_15784 - PLACE
      ?auto_15782 - HOIST
      ?auto_15780 - SURFACE
      ?auto_15781 - TRUCK
      ?auto_15786 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15783 ?auto_15779 ) ( SURFACE-AT ?auto_15777 ?auto_15779 ) ( CLEAR ?auto_15777 ) ( IS-CRATE ?auto_15778 ) ( not ( = ?auto_15777 ?auto_15778 ) ) ( AVAILABLE ?auto_15783 ) ( ON ?auto_15777 ?auto_15785 ) ( not ( = ?auto_15785 ?auto_15777 ) ) ( not ( = ?auto_15785 ?auto_15778 ) ) ( not ( = ?auto_15784 ?auto_15779 ) ) ( HOIST-AT ?auto_15782 ?auto_15784 ) ( not ( = ?auto_15783 ?auto_15782 ) ) ( AVAILABLE ?auto_15782 ) ( SURFACE-AT ?auto_15778 ?auto_15784 ) ( ON ?auto_15778 ?auto_15780 ) ( CLEAR ?auto_15778 ) ( not ( = ?auto_15777 ?auto_15780 ) ) ( not ( = ?auto_15778 ?auto_15780 ) ) ( not ( = ?auto_15785 ?auto_15780 ) ) ( TRUCK-AT ?auto_15781 ?auto_15786 ) ( not ( = ?auto_15786 ?auto_15779 ) ) ( not ( = ?auto_15784 ?auto_15786 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15781 ?auto_15786 ?auto_15779 )
      ( MAKE-1CRATE ?auto_15777 ?auto_15778 )
      ( MAKE-1CRATE-VERIFY ?auto_15777 ?auto_15778 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15816 - SURFACE
      ?auto_15817 - SURFACE
      ?auto_15818 - SURFACE
      ?auto_15819 - SURFACE
    )
    :vars
    (
      ?auto_15821 - HOIST
      ?auto_15820 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15821 ?auto_15820 ) ( SURFACE-AT ?auto_15818 ?auto_15820 ) ( CLEAR ?auto_15818 ) ( LIFTING ?auto_15821 ?auto_15819 ) ( IS-CRATE ?auto_15819 ) ( not ( = ?auto_15818 ?auto_15819 ) ) ( ON ?auto_15817 ?auto_15816 ) ( ON ?auto_15818 ?auto_15817 ) ( not ( = ?auto_15816 ?auto_15817 ) ) ( not ( = ?auto_15816 ?auto_15818 ) ) ( not ( = ?auto_15816 ?auto_15819 ) ) ( not ( = ?auto_15817 ?auto_15818 ) ) ( not ( = ?auto_15817 ?auto_15819 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15818 ?auto_15819 )
      ( MAKE-3CRATE-VERIFY ?auto_15816 ?auto_15817 ?auto_15818 ?auto_15819 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15833 - SURFACE
      ?auto_15834 - SURFACE
      ?auto_15835 - SURFACE
      ?auto_15836 - SURFACE
    )
    :vars
    (
      ?auto_15838 - HOIST
      ?auto_15837 - PLACE
      ?auto_15839 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15838 ?auto_15837 ) ( SURFACE-AT ?auto_15835 ?auto_15837 ) ( CLEAR ?auto_15835 ) ( IS-CRATE ?auto_15836 ) ( not ( = ?auto_15835 ?auto_15836 ) ) ( TRUCK-AT ?auto_15839 ?auto_15837 ) ( AVAILABLE ?auto_15838 ) ( IN ?auto_15836 ?auto_15839 ) ( ON ?auto_15835 ?auto_15834 ) ( not ( = ?auto_15834 ?auto_15835 ) ) ( not ( = ?auto_15834 ?auto_15836 ) ) ( ON ?auto_15834 ?auto_15833 ) ( not ( = ?auto_15833 ?auto_15834 ) ) ( not ( = ?auto_15833 ?auto_15835 ) ) ( not ( = ?auto_15833 ?auto_15836 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15834 ?auto_15835 ?auto_15836 )
      ( MAKE-3CRATE-VERIFY ?auto_15833 ?auto_15834 ?auto_15835 ?auto_15836 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15854 - SURFACE
      ?auto_15855 - SURFACE
      ?auto_15856 - SURFACE
      ?auto_15857 - SURFACE
    )
    :vars
    (
      ?auto_15861 - HOIST
      ?auto_15860 - PLACE
      ?auto_15859 - TRUCK
      ?auto_15858 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15861 ?auto_15860 ) ( SURFACE-AT ?auto_15856 ?auto_15860 ) ( CLEAR ?auto_15856 ) ( IS-CRATE ?auto_15857 ) ( not ( = ?auto_15856 ?auto_15857 ) ) ( AVAILABLE ?auto_15861 ) ( IN ?auto_15857 ?auto_15859 ) ( ON ?auto_15856 ?auto_15855 ) ( not ( = ?auto_15855 ?auto_15856 ) ) ( not ( = ?auto_15855 ?auto_15857 ) ) ( TRUCK-AT ?auto_15859 ?auto_15858 ) ( not ( = ?auto_15858 ?auto_15860 ) ) ( ON ?auto_15855 ?auto_15854 ) ( not ( = ?auto_15854 ?auto_15855 ) ) ( not ( = ?auto_15854 ?auto_15856 ) ) ( not ( = ?auto_15854 ?auto_15857 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15855 ?auto_15856 ?auto_15857 )
      ( MAKE-3CRATE-VERIFY ?auto_15854 ?auto_15855 ?auto_15856 ?auto_15857 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15878 - SURFACE
      ?auto_15879 - SURFACE
      ?auto_15880 - SURFACE
      ?auto_15881 - SURFACE
    )
    :vars
    (
      ?auto_15884 - HOIST
      ?auto_15882 - PLACE
      ?auto_15886 - TRUCK
      ?auto_15883 - PLACE
      ?auto_15885 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15884 ?auto_15882 ) ( SURFACE-AT ?auto_15880 ?auto_15882 ) ( CLEAR ?auto_15880 ) ( IS-CRATE ?auto_15881 ) ( not ( = ?auto_15880 ?auto_15881 ) ) ( AVAILABLE ?auto_15884 ) ( ON ?auto_15880 ?auto_15879 ) ( not ( = ?auto_15879 ?auto_15880 ) ) ( not ( = ?auto_15879 ?auto_15881 ) ) ( TRUCK-AT ?auto_15886 ?auto_15883 ) ( not ( = ?auto_15883 ?auto_15882 ) ) ( HOIST-AT ?auto_15885 ?auto_15883 ) ( LIFTING ?auto_15885 ?auto_15881 ) ( not ( = ?auto_15884 ?auto_15885 ) ) ( ON ?auto_15879 ?auto_15878 ) ( not ( = ?auto_15878 ?auto_15879 ) ) ( not ( = ?auto_15878 ?auto_15880 ) ) ( not ( = ?auto_15878 ?auto_15881 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15879 ?auto_15880 ?auto_15881 )
      ( MAKE-3CRATE-VERIFY ?auto_15878 ?auto_15879 ?auto_15880 ?auto_15881 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15905 - SURFACE
      ?auto_15906 - SURFACE
      ?auto_15907 - SURFACE
      ?auto_15908 - SURFACE
    )
    :vars
    (
      ?auto_15912 - HOIST
      ?auto_15909 - PLACE
      ?auto_15914 - TRUCK
      ?auto_15913 - PLACE
      ?auto_15911 - HOIST
      ?auto_15910 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15912 ?auto_15909 ) ( SURFACE-AT ?auto_15907 ?auto_15909 ) ( CLEAR ?auto_15907 ) ( IS-CRATE ?auto_15908 ) ( not ( = ?auto_15907 ?auto_15908 ) ) ( AVAILABLE ?auto_15912 ) ( ON ?auto_15907 ?auto_15906 ) ( not ( = ?auto_15906 ?auto_15907 ) ) ( not ( = ?auto_15906 ?auto_15908 ) ) ( TRUCK-AT ?auto_15914 ?auto_15913 ) ( not ( = ?auto_15913 ?auto_15909 ) ) ( HOIST-AT ?auto_15911 ?auto_15913 ) ( not ( = ?auto_15912 ?auto_15911 ) ) ( AVAILABLE ?auto_15911 ) ( SURFACE-AT ?auto_15908 ?auto_15913 ) ( ON ?auto_15908 ?auto_15910 ) ( CLEAR ?auto_15908 ) ( not ( = ?auto_15907 ?auto_15910 ) ) ( not ( = ?auto_15908 ?auto_15910 ) ) ( not ( = ?auto_15906 ?auto_15910 ) ) ( ON ?auto_15906 ?auto_15905 ) ( not ( = ?auto_15905 ?auto_15906 ) ) ( not ( = ?auto_15905 ?auto_15907 ) ) ( not ( = ?auto_15905 ?auto_15908 ) ) ( not ( = ?auto_15905 ?auto_15910 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15906 ?auto_15907 ?auto_15908 )
      ( MAKE-3CRATE-VERIFY ?auto_15905 ?auto_15906 ?auto_15907 ?auto_15908 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15933 - SURFACE
      ?auto_15934 - SURFACE
      ?auto_15935 - SURFACE
      ?auto_15936 - SURFACE
    )
    :vars
    (
      ?auto_15942 - HOIST
      ?auto_15941 - PLACE
      ?auto_15939 - PLACE
      ?auto_15940 - HOIST
      ?auto_15938 - SURFACE
      ?auto_15937 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15942 ?auto_15941 ) ( SURFACE-AT ?auto_15935 ?auto_15941 ) ( CLEAR ?auto_15935 ) ( IS-CRATE ?auto_15936 ) ( not ( = ?auto_15935 ?auto_15936 ) ) ( AVAILABLE ?auto_15942 ) ( ON ?auto_15935 ?auto_15934 ) ( not ( = ?auto_15934 ?auto_15935 ) ) ( not ( = ?auto_15934 ?auto_15936 ) ) ( not ( = ?auto_15939 ?auto_15941 ) ) ( HOIST-AT ?auto_15940 ?auto_15939 ) ( not ( = ?auto_15942 ?auto_15940 ) ) ( AVAILABLE ?auto_15940 ) ( SURFACE-AT ?auto_15936 ?auto_15939 ) ( ON ?auto_15936 ?auto_15938 ) ( CLEAR ?auto_15936 ) ( not ( = ?auto_15935 ?auto_15938 ) ) ( not ( = ?auto_15936 ?auto_15938 ) ) ( not ( = ?auto_15934 ?auto_15938 ) ) ( TRUCK-AT ?auto_15937 ?auto_15941 ) ( ON ?auto_15934 ?auto_15933 ) ( not ( = ?auto_15933 ?auto_15934 ) ) ( not ( = ?auto_15933 ?auto_15935 ) ) ( not ( = ?auto_15933 ?auto_15936 ) ) ( not ( = ?auto_15933 ?auto_15938 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15934 ?auto_15935 ?auto_15936 )
      ( MAKE-3CRATE-VERIFY ?auto_15933 ?auto_15934 ?auto_15935 ?auto_15936 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15961 - SURFACE
      ?auto_15962 - SURFACE
      ?auto_15963 - SURFACE
      ?auto_15964 - SURFACE
    )
    :vars
    (
      ?auto_15967 - HOIST
      ?auto_15968 - PLACE
      ?auto_15965 - PLACE
      ?auto_15966 - HOIST
      ?auto_15970 - SURFACE
      ?auto_15969 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15967 ?auto_15968 ) ( IS-CRATE ?auto_15964 ) ( not ( = ?auto_15963 ?auto_15964 ) ) ( not ( = ?auto_15962 ?auto_15963 ) ) ( not ( = ?auto_15962 ?auto_15964 ) ) ( not ( = ?auto_15965 ?auto_15968 ) ) ( HOIST-AT ?auto_15966 ?auto_15965 ) ( not ( = ?auto_15967 ?auto_15966 ) ) ( AVAILABLE ?auto_15966 ) ( SURFACE-AT ?auto_15964 ?auto_15965 ) ( ON ?auto_15964 ?auto_15970 ) ( CLEAR ?auto_15964 ) ( not ( = ?auto_15963 ?auto_15970 ) ) ( not ( = ?auto_15964 ?auto_15970 ) ) ( not ( = ?auto_15962 ?auto_15970 ) ) ( TRUCK-AT ?auto_15969 ?auto_15968 ) ( SURFACE-AT ?auto_15962 ?auto_15968 ) ( CLEAR ?auto_15962 ) ( LIFTING ?auto_15967 ?auto_15963 ) ( IS-CRATE ?auto_15963 ) ( ON ?auto_15962 ?auto_15961 ) ( not ( = ?auto_15961 ?auto_15962 ) ) ( not ( = ?auto_15961 ?auto_15963 ) ) ( not ( = ?auto_15961 ?auto_15964 ) ) ( not ( = ?auto_15961 ?auto_15970 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15962 ?auto_15963 ?auto_15964 )
      ( MAKE-3CRATE-VERIFY ?auto_15961 ?auto_15962 ?auto_15963 ?auto_15964 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15989 - SURFACE
      ?auto_15990 - SURFACE
      ?auto_15991 - SURFACE
      ?auto_15992 - SURFACE
    )
    :vars
    (
      ?auto_15993 - HOIST
      ?auto_15998 - PLACE
      ?auto_15994 - PLACE
      ?auto_15997 - HOIST
      ?auto_15995 - SURFACE
      ?auto_15996 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15993 ?auto_15998 ) ( IS-CRATE ?auto_15992 ) ( not ( = ?auto_15991 ?auto_15992 ) ) ( not ( = ?auto_15990 ?auto_15991 ) ) ( not ( = ?auto_15990 ?auto_15992 ) ) ( not ( = ?auto_15994 ?auto_15998 ) ) ( HOIST-AT ?auto_15997 ?auto_15994 ) ( not ( = ?auto_15993 ?auto_15997 ) ) ( AVAILABLE ?auto_15997 ) ( SURFACE-AT ?auto_15992 ?auto_15994 ) ( ON ?auto_15992 ?auto_15995 ) ( CLEAR ?auto_15992 ) ( not ( = ?auto_15991 ?auto_15995 ) ) ( not ( = ?auto_15992 ?auto_15995 ) ) ( not ( = ?auto_15990 ?auto_15995 ) ) ( TRUCK-AT ?auto_15996 ?auto_15998 ) ( SURFACE-AT ?auto_15990 ?auto_15998 ) ( CLEAR ?auto_15990 ) ( IS-CRATE ?auto_15991 ) ( AVAILABLE ?auto_15993 ) ( IN ?auto_15991 ?auto_15996 ) ( ON ?auto_15990 ?auto_15989 ) ( not ( = ?auto_15989 ?auto_15990 ) ) ( not ( = ?auto_15989 ?auto_15991 ) ) ( not ( = ?auto_15989 ?auto_15992 ) ) ( not ( = ?auto_15989 ?auto_15995 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15990 ?auto_15991 ?auto_15992 )
      ( MAKE-3CRATE-VERIFY ?auto_15989 ?auto_15990 ?auto_15991 ?auto_15992 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16174 - SURFACE
      ?auto_16175 - SURFACE
    )
    :vars
    (
      ?auto_16178 - HOIST
      ?auto_16176 - PLACE
      ?auto_16177 - SURFACE
      ?auto_16180 - TRUCK
      ?auto_16182 - PLACE
      ?auto_16181 - HOIST
      ?auto_16179 - SURFACE
      ?auto_16183 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16178 ?auto_16176 ) ( SURFACE-AT ?auto_16174 ?auto_16176 ) ( CLEAR ?auto_16174 ) ( IS-CRATE ?auto_16175 ) ( not ( = ?auto_16174 ?auto_16175 ) ) ( AVAILABLE ?auto_16178 ) ( ON ?auto_16174 ?auto_16177 ) ( not ( = ?auto_16177 ?auto_16174 ) ) ( not ( = ?auto_16177 ?auto_16175 ) ) ( TRUCK-AT ?auto_16180 ?auto_16182 ) ( not ( = ?auto_16182 ?auto_16176 ) ) ( HOIST-AT ?auto_16181 ?auto_16182 ) ( not ( = ?auto_16178 ?auto_16181 ) ) ( SURFACE-AT ?auto_16175 ?auto_16182 ) ( ON ?auto_16175 ?auto_16179 ) ( CLEAR ?auto_16175 ) ( not ( = ?auto_16174 ?auto_16179 ) ) ( not ( = ?auto_16175 ?auto_16179 ) ) ( not ( = ?auto_16177 ?auto_16179 ) ) ( LIFTING ?auto_16181 ?auto_16183 ) ( IS-CRATE ?auto_16183 ) ( not ( = ?auto_16174 ?auto_16183 ) ) ( not ( = ?auto_16175 ?auto_16183 ) ) ( not ( = ?auto_16177 ?auto_16183 ) ) ( not ( = ?auto_16179 ?auto_16183 ) ) )
    :subtasks
    ( ( !LOAD ?auto_16181 ?auto_16183 ?auto_16180 ?auto_16182 )
      ( MAKE-1CRATE ?auto_16174 ?auto_16175 )
      ( MAKE-1CRATE-VERIFY ?auto_16174 ?auto_16175 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16282 - SURFACE
      ?auto_16283 - SURFACE
      ?auto_16284 - SURFACE
      ?auto_16285 - SURFACE
      ?auto_16286 - SURFACE
    )
    :vars
    (
      ?auto_16288 - HOIST
      ?auto_16287 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16288 ?auto_16287 ) ( SURFACE-AT ?auto_16285 ?auto_16287 ) ( CLEAR ?auto_16285 ) ( LIFTING ?auto_16288 ?auto_16286 ) ( IS-CRATE ?auto_16286 ) ( not ( = ?auto_16285 ?auto_16286 ) ) ( ON ?auto_16283 ?auto_16282 ) ( ON ?auto_16284 ?auto_16283 ) ( ON ?auto_16285 ?auto_16284 ) ( not ( = ?auto_16282 ?auto_16283 ) ) ( not ( = ?auto_16282 ?auto_16284 ) ) ( not ( = ?auto_16282 ?auto_16285 ) ) ( not ( = ?auto_16282 ?auto_16286 ) ) ( not ( = ?auto_16283 ?auto_16284 ) ) ( not ( = ?auto_16283 ?auto_16285 ) ) ( not ( = ?auto_16283 ?auto_16286 ) ) ( not ( = ?auto_16284 ?auto_16285 ) ) ( not ( = ?auto_16284 ?auto_16286 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16285 ?auto_16286 )
      ( MAKE-4CRATE-VERIFY ?auto_16282 ?auto_16283 ?auto_16284 ?auto_16285 ?auto_16286 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16307 - SURFACE
      ?auto_16308 - SURFACE
      ?auto_16309 - SURFACE
      ?auto_16310 - SURFACE
      ?auto_16311 - SURFACE
    )
    :vars
    (
      ?auto_16314 - HOIST
      ?auto_16312 - PLACE
      ?auto_16313 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16314 ?auto_16312 ) ( SURFACE-AT ?auto_16310 ?auto_16312 ) ( CLEAR ?auto_16310 ) ( IS-CRATE ?auto_16311 ) ( not ( = ?auto_16310 ?auto_16311 ) ) ( TRUCK-AT ?auto_16313 ?auto_16312 ) ( AVAILABLE ?auto_16314 ) ( IN ?auto_16311 ?auto_16313 ) ( ON ?auto_16310 ?auto_16309 ) ( not ( = ?auto_16309 ?auto_16310 ) ) ( not ( = ?auto_16309 ?auto_16311 ) ) ( ON ?auto_16308 ?auto_16307 ) ( ON ?auto_16309 ?auto_16308 ) ( not ( = ?auto_16307 ?auto_16308 ) ) ( not ( = ?auto_16307 ?auto_16309 ) ) ( not ( = ?auto_16307 ?auto_16310 ) ) ( not ( = ?auto_16307 ?auto_16311 ) ) ( not ( = ?auto_16308 ?auto_16309 ) ) ( not ( = ?auto_16308 ?auto_16310 ) ) ( not ( = ?auto_16308 ?auto_16311 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16309 ?auto_16310 ?auto_16311 )
      ( MAKE-4CRATE-VERIFY ?auto_16307 ?auto_16308 ?auto_16309 ?auto_16310 ?auto_16311 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16337 - SURFACE
      ?auto_16338 - SURFACE
      ?auto_16339 - SURFACE
      ?auto_16340 - SURFACE
      ?auto_16341 - SURFACE
    )
    :vars
    (
      ?auto_16343 - HOIST
      ?auto_16345 - PLACE
      ?auto_16344 - TRUCK
      ?auto_16342 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16343 ?auto_16345 ) ( SURFACE-AT ?auto_16340 ?auto_16345 ) ( CLEAR ?auto_16340 ) ( IS-CRATE ?auto_16341 ) ( not ( = ?auto_16340 ?auto_16341 ) ) ( AVAILABLE ?auto_16343 ) ( IN ?auto_16341 ?auto_16344 ) ( ON ?auto_16340 ?auto_16339 ) ( not ( = ?auto_16339 ?auto_16340 ) ) ( not ( = ?auto_16339 ?auto_16341 ) ) ( TRUCK-AT ?auto_16344 ?auto_16342 ) ( not ( = ?auto_16342 ?auto_16345 ) ) ( ON ?auto_16338 ?auto_16337 ) ( ON ?auto_16339 ?auto_16338 ) ( not ( = ?auto_16337 ?auto_16338 ) ) ( not ( = ?auto_16337 ?auto_16339 ) ) ( not ( = ?auto_16337 ?auto_16340 ) ) ( not ( = ?auto_16337 ?auto_16341 ) ) ( not ( = ?auto_16338 ?auto_16339 ) ) ( not ( = ?auto_16338 ?auto_16340 ) ) ( not ( = ?auto_16338 ?auto_16341 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16339 ?auto_16340 ?auto_16341 )
      ( MAKE-4CRATE-VERIFY ?auto_16337 ?auto_16338 ?auto_16339 ?auto_16340 ?auto_16341 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16371 - SURFACE
      ?auto_16372 - SURFACE
      ?auto_16373 - SURFACE
      ?auto_16374 - SURFACE
      ?auto_16375 - SURFACE
    )
    :vars
    (
      ?auto_16380 - HOIST
      ?auto_16378 - PLACE
      ?auto_16379 - TRUCK
      ?auto_16376 - PLACE
      ?auto_16377 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16380 ?auto_16378 ) ( SURFACE-AT ?auto_16374 ?auto_16378 ) ( CLEAR ?auto_16374 ) ( IS-CRATE ?auto_16375 ) ( not ( = ?auto_16374 ?auto_16375 ) ) ( AVAILABLE ?auto_16380 ) ( ON ?auto_16374 ?auto_16373 ) ( not ( = ?auto_16373 ?auto_16374 ) ) ( not ( = ?auto_16373 ?auto_16375 ) ) ( TRUCK-AT ?auto_16379 ?auto_16376 ) ( not ( = ?auto_16376 ?auto_16378 ) ) ( HOIST-AT ?auto_16377 ?auto_16376 ) ( LIFTING ?auto_16377 ?auto_16375 ) ( not ( = ?auto_16380 ?auto_16377 ) ) ( ON ?auto_16372 ?auto_16371 ) ( ON ?auto_16373 ?auto_16372 ) ( not ( = ?auto_16371 ?auto_16372 ) ) ( not ( = ?auto_16371 ?auto_16373 ) ) ( not ( = ?auto_16371 ?auto_16374 ) ) ( not ( = ?auto_16371 ?auto_16375 ) ) ( not ( = ?auto_16372 ?auto_16373 ) ) ( not ( = ?auto_16372 ?auto_16374 ) ) ( not ( = ?auto_16372 ?auto_16375 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16373 ?auto_16374 ?auto_16375 )
      ( MAKE-4CRATE-VERIFY ?auto_16371 ?auto_16372 ?auto_16373 ?auto_16374 ?auto_16375 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16409 - SURFACE
      ?auto_16410 - SURFACE
      ?auto_16411 - SURFACE
      ?auto_16412 - SURFACE
      ?auto_16413 - SURFACE
    )
    :vars
    (
      ?auto_16419 - HOIST
      ?auto_16415 - PLACE
      ?auto_16417 - TRUCK
      ?auto_16414 - PLACE
      ?auto_16418 - HOIST
      ?auto_16416 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16419 ?auto_16415 ) ( SURFACE-AT ?auto_16412 ?auto_16415 ) ( CLEAR ?auto_16412 ) ( IS-CRATE ?auto_16413 ) ( not ( = ?auto_16412 ?auto_16413 ) ) ( AVAILABLE ?auto_16419 ) ( ON ?auto_16412 ?auto_16411 ) ( not ( = ?auto_16411 ?auto_16412 ) ) ( not ( = ?auto_16411 ?auto_16413 ) ) ( TRUCK-AT ?auto_16417 ?auto_16414 ) ( not ( = ?auto_16414 ?auto_16415 ) ) ( HOIST-AT ?auto_16418 ?auto_16414 ) ( not ( = ?auto_16419 ?auto_16418 ) ) ( AVAILABLE ?auto_16418 ) ( SURFACE-AT ?auto_16413 ?auto_16414 ) ( ON ?auto_16413 ?auto_16416 ) ( CLEAR ?auto_16413 ) ( not ( = ?auto_16412 ?auto_16416 ) ) ( not ( = ?auto_16413 ?auto_16416 ) ) ( not ( = ?auto_16411 ?auto_16416 ) ) ( ON ?auto_16410 ?auto_16409 ) ( ON ?auto_16411 ?auto_16410 ) ( not ( = ?auto_16409 ?auto_16410 ) ) ( not ( = ?auto_16409 ?auto_16411 ) ) ( not ( = ?auto_16409 ?auto_16412 ) ) ( not ( = ?auto_16409 ?auto_16413 ) ) ( not ( = ?auto_16409 ?auto_16416 ) ) ( not ( = ?auto_16410 ?auto_16411 ) ) ( not ( = ?auto_16410 ?auto_16412 ) ) ( not ( = ?auto_16410 ?auto_16413 ) ) ( not ( = ?auto_16410 ?auto_16416 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16411 ?auto_16412 ?auto_16413 )
      ( MAKE-4CRATE-VERIFY ?auto_16409 ?auto_16410 ?auto_16411 ?auto_16412 ?auto_16413 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16448 - SURFACE
      ?auto_16449 - SURFACE
      ?auto_16450 - SURFACE
      ?auto_16451 - SURFACE
      ?auto_16452 - SURFACE
    )
    :vars
    (
      ?auto_16457 - HOIST
      ?auto_16454 - PLACE
      ?auto_16455 - PLACE
      ?auto_16453 - HOIST
      ?auto_16458 - SURFACE
      ?auto_16456 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16457 ?auto_16454 ) ( SURFACE-AT ?auto_16451 ?auto_16454 ) ( CLEAR ?auto_16451 ) ( IS-CRATE ?auto_16452 ) ( not ( = ?auto_16451 ?auto_16452 ) ) ( AVAILABLE ?auto_16457 ) ( ON ?auto_16451 ?auto_16450 ) ( not ( = ?auto_16450 ?auto_16451 ) ) ( not ( = ?auto_16450 ?auto_16452 ) ) ( not ( = ?auto_16455 ?auto_16454 ) ) ( HOIST-AT ?auto_16453 ?auto_16455 ) ( not ( = ?auto_16457 ?auto_16453 ) ) ( AVAILABLE ?auto_16453 ) ( SURFACE-AT ?auto_16452 ?auto_16455 ) ( ON ?auto_16452 ?auto_16458 ) ( CLEAR ?auto_16452 ) ( not ( = ?auto_16451 ?auto_16458 ) ) ( not ( = ?auto_16452 ?auto_16458 ) ) ( not ( = ?auto_16450 ?auto_16458 ) ) ( TRUCK-AT ?auto_16456 ?auto_16454 ) ( ON ?auto_16449 ?auto_16448 ) ( ON ?auto_16450 ?auto_16449 ) ( not ( = ?auto_16448 ?auto_16449 ) ) ( not ( = ?auto_16448 ?auto_16450 ) ) ( not ( = ?auto_16448 ?auto_16451 ) ) ( not ( = ?auto_16448 ?auto_16452 ) ) ( not ( = ?auto_16448 ?auto_16458 ) ) ( not ( = ?auto_16449 ?auto_16450 ) ) ( not ( = ?auto_16449 ?auto_16451 ) ) ( not ( = ?auto_16449 ?auto_16452 ) ) ( not ( = ?auto_16449 ?auto_16458 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16450 ?auto_16451 ?auto_16452 )
      ( MAKE-4CRATE-VERIFY ?auto_16448 ?auto_16449 ?auto_16450 ?auto_16451 ?auto_16452 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16487 - SURFACE
      ?auto_16488 - SURFACE
      ?auto_16489 - SURFACE
      ?auto_16490 - SURFACE
      ?auto_16491 - SURFACE
    )
    :vars
    (
      ?auto_16494 - HOIST
      ?auto_16495 - PLACE
      ?auto_16497 - PLACE
      ?auto_16493 - HOIST
      ?auto_16492 - SURFACE
      ?auto_16496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16494 ?auto_16495 ) ( IS-CRATE ?auto_16491 ) ( not ( = ?auto_16490 ?auto_16491 ) ) ( not ( = ?auto_16489 ?auto_16490 ) ) ( not ( = ?auto_16489 ?auto_16491 ) ) ( not ( = ?auto_16497 ?auto_16495 ) ) ( HOIST-AT ?auto_16493 ?auto_16497 ) ( not ( = ?auto_16494 ?auto_16493 ) ) ( AVAILABLE ?auto_16493 ) ( SURFACE-AT ?auto_16491 ?auto_16497 ) ( ON ?auto_16491 ?auto_16492 ) ( CLEAR ?auto_16491 ) ( not ( = ?auto_16490 ?auto_16492 ) ) ( not ( = ?auto_16491 ?auto_16492 ) ) ( not ( = ?auto_16489 ?auto_16492 ) ) ( TRUCK-AT ?auto_16496 ?auto_16495 ) ( SURFACE-AT ?auto_16489 ?auto_16495 ) ( CLEAR ?auto_16489 ) ( LIFTING ?auto_16494 ?auto_16490 ) ( IS-CRATE ?auto_16490 ) ( ON ?auto_16488 ?auto_16487 ) ( ON ?auto_16489 ?auto_16488 ) ( not ( = ?auto_16487 ?auto_16488 ) ) ( not ( = ?auto_16487 ?auto_16489 ) ) ( not ( = ?auto_16487 ?auto_16490 ) ) ( not ( = ?auto_16487 ?auto_16491 ) ) ( not ( = ?auto_16487 ?auto_16492 ) ) ( not ( = ?auto_16488 ?auto_16489 ) ) ( not ( = ?auto_16488 ?auto_16490 ) ) ( not ( = ?auto_16488 ?auto_16491 ) ) ( not ( = ?auto_16488 ?auto_16492 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16489 ?auto_16490 ?auto_16491 )
      ( MAKE-4CRATE-VERIFY ?auto_16487 ?auto_16488 ?auto_16489 ?auto_16490 ?auto_16491 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16526 - SURFACE
      ?auto_16527 - SURFACE
      ?auto_16528 - SURFACE
      ?auto_16529 - SURFACE
      ?auto_16530 - SURFACE
    )
    :vars
    (
      ?auto_16531 - HOIST
      ?auto_16534 - PLACE
      ?auto_16533 - PLACE
      ?auto_16532 - HOIST
      ?auto_16536 - SURFACE
      ?auto_16535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16531 ?auto_16534 ) ( IS-CRATE ?auto_16530 ) ( not ( = ?auto_16529 ?auto_16530 ) ) ( not ( = ?auto_16528 ?auto_16529 ) ) ( not ( = ?auto_16528 ?auto_16530 ) ) ( not ( = ?auto_16533 ?auto_16534 ) ) ( HOIST-AT ?auto_16532 ?auto_16533 ) ( not ( = ?auto_16531 ?auto_16532 ) ) ( AVAILABLE ?auto_16532 ) ( SURFACE-AT ?auto_16530 ?auto_16533 ) ( ON ?auto_16530 ?auto_16536 ) ( CLEAR ?auto_16530 ) ( not ( = ?auto_16529 ?auto_16536 ) ) ( not ( = ?auto_16530 ?auto_16536 ) ) ( not ( = ?auto_16528 ?auto_16536 ) ) ( TRUCK-AT ?auto_16535 ?auto_16534 ) ( SURFACE-AT ?auto_16528 ?auto_16534 ) ( CLEAR ?auto_16528 ) ( IS-CRATE ?auto_16529 ) ( AVAILABLE ?auto_16531 ) ( IN ?auto_16529 ?auto_16535 ) ( ON ?auto_16527 ?auto_16526 ) ( ON ?auto_16528 ?auto_16527 ) ( not ( = ?auto_16526 ?auto_16527 ) ) ( not ( = ?auto_16526 ?auto_16528 ) ) ( not ( = ?auto_16526 ?auto_16529 ) ) ( not ( = ?auto_16526 ?auto_16530 ) ) ( not ( = ?auto_16526 ?auto_16536 ) ) ( not ( = ?auto_16527 ?auto_16528 ) ) ( not ( = ?auto_16527 ?auto_16529 ) ) ( not ( = ?auto_16527 ?auto_16530 ) ) ( not ( = ?auto_16527 ?auto_16536 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16528 ?auto_16529 ?auto_16530 )
      ( MAKE-4CRATE-VERIFY ?auto_16526 ?auto_16527 ?auto_16528 ?auto_16529 ?auto_16530 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17027 - SURFACE
      ?auto_17028 - SURFACE
    )
    :vars
    (
      ?auto_17029 - HOIST
      ?auto_17032 - PLACE
      ?auto_17034 - SURFACE
      ?auto_17033 - PLACE
      ?auto_17030 - HOIST
      ?auto_17031 - SURFACE
      ?auto_17035 - TRUCK
      ?auto_17036 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17029 ?auto_17032 ) ( SURFACE-AT ?auto_17027 ?auto_17032 ) ( CLEAR ?auto_17027 ) ( IS-CRATE ?auto_17028 ) ( not ( = ?auto_17027 ?auto_17028 ) ) ( ON ?auto_17027 ?auto_17034 ) ( not ( = ?auto_17034 ?auto_17027 ) ) ( not ( = ?auto_17034 ?auto_17028 ) ) ( not ( = ?auto_17033 ?auto_17032 ) ) ( HOIST-AT ?auto_17030 ?auto_17033 ) ( not ( = ?auto_17029 ?auto_17030 ) ) ( AVAILABLE ?auto_17030 ) ( SURFACE-AT ?auto_17028 ?auto_17033 ) ( ON ?auto_17028 ?auto_17031 ) ( CLEAR ?auto_17028 ) ( not ( = ?auto_17027 ?auto_17031 ) ) ( not ( = ?auto_17028 ?auto_17031 ) ) ( not ( = ?auto_17034 ?auto_17031 ) ) ( TRUCK-AT ?auto_17035 ?auto_17032 ) ( LIFTING ?auto_17029 ?auto_17036 ) ( IS-CRATE ?auto_17036 ) ( not ( = ?auto_17027 ?auto_17036 ) ) ( not ( = ?auto_17028 ?auto_17036 ) ) ( not ( = ?auto_17034 ?auto_17036 ) ) ( not ( = ?auto_17031 ?auto_17036 ) ) )
    :subtasks
    ( ( !LOAD ?auto_17029 ?auto_17036 ?auto_17035 ?auto_17032 )
      ( MAKE-1CRATE ?auto_17027 ?auto_17028 )
      ( MAKE-1CRATE-VERIFY ?auto_17027 ?auto_17028 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17186 - SURFACE
      ?auto_17187 - SURFACE
      ?auto_17188 - SURFACE
      ?auto_17189 - SURFACE
      ?auto_17190 - SURFACE
      ?auto_17191 - SURFACE
    )
    :vars
    (
      ?auto_17193 - HOIST
      ?auto_17192 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17193 ?auto_17192 ) ( SURFACE-AT ?auto_17190 ?auto_17192 ) ( CLEAR ?auto_17190 ) ( LIFTING ?auto_17193 ?auto_17191 ) ( IS-CRATE ?auto_17191 ) ( not ( = ?auto_17190 ?auto_17191 ) ) ( ON ?auto_17187 ?auto_17186 ) ( ON ?auto_17188 ?auto_17187 ) ( ON ?auto_17189 ?auto_17188 ) ( ON ?auto_17190 ?auto_17189 ) ( not ( = ?auto_17186 ?auto_17187 ) ) ( not ( = ?auto_17186 ?auto_17188 ) ) ( not ( = ?auto_17186 ?auto_17189 ) ) ( not ( = ?auto_17186 ?auto_17190 ) ) ( not ( = ?auto_17186 ?auto_17191 ) ) ( not ( = ?auto_17187 ?auto_17188 ) ) ( not ( = ?auto_17187 ?auto_17189 ) ) ( not ( = ?auto_17187 ?auto_17190 ) ) ( not ( = ?auto_17187 ?auto_17191 ) ) ( not ( = ?auto_17188 ?auto_17189 ) ) ( not ( = ?auto_17188 ?auto_17190 ) ) ( not ( = ?auto_17188 ?auto_17191 ) ) ( not ( = ?auto_17189 ?auto_17190 ) ) ( not ( = ?auto_17189 ?auto_17191 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17190 ?auto_17191 )
      ( MAKE-5CRATE-VERIFY ?auto_17186 ?auto_17187 ?auto_17188 ?auto_17189 ?auto_17190 ?auto_17191 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17220 - SURFACE
      ?auto_17221 - SURFACE
      ?auto_17222 - SURFACE
      ?auto_17223 - SURFACE
      ?auto_17224 - SURFACE
      ?auto_17225 - SURFACE
    )
    :vars
    (
      ?auto_17226 - HOIST
      ?auto_17228 - PLACE
      ?auto_17227 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17226 ?auto_17228 ) ( SURFACE-AT ?auto_17224 ?auto_17228 ) ( CLEAR ?auto_17224 ) ( IS-CRATE ?auto_17225 ) ( not ( = ?auto_17224 ?auto_17225 ) ) ( TRUCK-AT ?auto_17227 ?auto_17228 ) ( AVAILABLE ?auto_17226 ) ( IN ?auto_17225 ?auto_17227 ) ( ON ?auto_17224 ?auto_17223 ) ( not ( = ?auto_17223 ?auto_17224 ) ) ( not ( = ?auto_17223 ?auto_17225 ) ) ( ON ?auto_17221 ?auto_17220 ) ( ON ?auto_17222 ?auto_17221 ) ( ON ?auto_17223 ?auto_17222 ) ( not ( = ?auto_17220 ?auto_17221 ) ) ( not ( = ?auto_17220 ?auto_17222 ) ) ( not ( = ?auto_17220 ?auto_17223 ) ) ( not ( = ?auto_17220 ?auto_17224 ) ) ( not ( = ?auto_17220 ?auto_17225 ) ) ( not ( = ?auto_17221 ?auto_17222 ) ) ( not ( = ?auto_17221 ?auto_17223 ) ) ( not ( = ?auto_17221 ?auto_17224 ) ) ( not ( = ?auto_17221 ?auto_17225 ) ) ( not ( = ?auto_17222 ?auto_17223 ) ) ( not ( = ?auto_17222 ?auto_17224 ) ) ( not ( = ?auto_17222 ?auto_17225 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17223 ?auto_17224 ?auto_17225 )
      ( MAKE-5CRATE-VERIFY ?auto_17220 ?auto_17221 ?auto_17222 ?auto_17223 ?auto_17224 ?auto_17225 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17260 - SURFACE
      ?auto_17261 - SURFACE
      ?auto_17262 - SURFACE
      ?auto_17263 - SURFACE
      ?auto_17264 - SURFACE
      ?auto_17265 - SURFACE
    )
    :vars
    (
      ?auto_17267 - HOIST
      ?auto_17266 - PLACE
      ?auto_17268 - TRUCK
      ?auto_17269 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17267 ?auto_17266 ) ( SURFACE-AT ?auto_17264 ?auto_17266 ) ( CLEAR ?auto_17264 ) ( IS-CRATE ?auto_17265 ) ( not ( = ?auto_17264 ?auto_17265 ) ) ( AVAILABLE ?auto_17267 ) ( IN ?auto_17265 ?auto_17268 ) ( ON ?auto_17264 ?auto_17263 ) ( not ( = ?auto_17263 ?auto_17264 ) ) ( not ( = ?auto_17263 ?auto_17265 ) ) ( TRUCK-AT ?auto_17268 ?auto_17269 ) ( not ( = ?auto_17269 ?auto_17266 ) ) ( ON ?auto_17261 ?auto_17260 ) ( ON ?auto_17262 ?auto_17261 ) ( ON ?auto_17263 ?auto_17262 ) ( not ( = ?auto_17260 ?auto_17261 ) ) ( not ( = ?auto_17260 ?auto_17262 ) ) ( not ( = ?auto_17260 ?auto_17263 ) ) ( not ( = ?auto_17260 ?auto_17264 ) ) ( not ( = ?auto_17260 ?auto_17265 ) ) ( not ( = ?auto_17261 ?auto_17262 ) ) ( not ( = ?auto_17261 ?auto_17263 ) ) ( not ( = ?auto_17261 ?auto_17264 ) ) ( not ( = ?auto_17261 ?auto_17265 ) ) ( not ( = ?auto_17262 ?auto_17263 ) ) ( not ( = ?auto_17262 ?auto_17264 ) ) ( not ( = ?auto_17262 ?auto_17265 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17263 ?auto_17264 ?auto_17265 )
      ( MAKE-5CRATE-VERIFY ?auto_17260 ?auto_17261 ?auto_17262 ?auto_17263 ?auto_17264 ?auto_17265 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17305 - SURFACE
      ?auto_17306 - SURFACE
      ?auto_17307 - SURFACE
      ?auto_17308 - SURFACE
      ?auto_17309 - SURFACE
      ?auto_17310 - SURFACE
    )
    :vars
    (
      ?auto_17311 - HOIST
      ?auto_17315 - PLACE
      ?auto_17312 - TRUCK
      ?auto_17313 - PLACE
      ?auto_17314 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17311 ?auto_17315 ) ( SURFACE-AT ?auto_17309 ?auto_17315 ) ( CLEAR ?auto_17309 ) ( IS-CRATE ?auto_17310 ) ( not ( = ?auto_17309 ?auto_17310 ) ) ( AVAILABLE ?auto_17311 ) ( ON ?auto_17309 ?auto_17308 ) ( not ( = ?auto_17308 ?auto_17309 ) ) ( not ( = ?auto_17308 ?auto_17310 ) ) ( TRUCK-AT ?auto_17312 ?auto_17313 ) ( not ( = ?auto_17313 ?auto_17315 ) ) ( HOIST-AT ?auto_17314 ?auto_17313 ) ( LIFTING ?auto_17314 ?auto_17310 ) ( not ( = ?auto_17311 ?auto_17314 ) ) ( ON ?auto_17306 ?auto_17305 ) ( ON ?auto_17307 ?auto_17306 ) ( ON ?auto_17308 ?auto_17307 ) ( not ( = ?auto_17305 ?auto_17306 ) ) ( not ( = ?auto_17305 ?auto_17307 ) ) ( not ( = ?auto_17305 ?auto_17308 ) ) ( not ( = ?auto_17305 ?auto_17309 ) ) ( not ( = ?auto_17305 ?auto_17310 ) ) ( not ( = ?auto_17306 ?auto_17307 ) ) ( not ( = ?auto_17306 ?auto_17308 ) ) ( not ( = ?auto_17306 ?auto_17309 ) ) ( not ( = ?auto_17306 ?auto_17310 ) ) ( not ( = ?auto_17307 ?auto_17308 ) ) ( not ( = ?auto_17307 ?auto_17309 ) ) ( not ( = ?auto_17307 ?auto_17310 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17308 ?auto_17309 ?auto_17310 )
      ( MAKE-5CRATE-VERIFY ?auto_17305 ?auto_17306 ?auto_17307 ?auto_17308 ?auto_17309 ?auto_17310 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17355 - SURFACE
      ?auto_17356 - SURFACE
      ?auto_17357 - SURFACE
      ?auto_17358 - SURFACE
      ?auto_17359 - SURFACE
      ?auto_17360 - SURFACE
    )
    :vars
    (
      ?auto_17364 - HOIST
      ?auto_17361 - PLACE
      ?auto_17363 - TRUCK
      ?auto_17366 - PLACE
      ?auto_17365 - HOIST
      ?auto_17362 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17364 ?auto_17361 ) ( SURFACE-AT ?auto_17359 ?auto_17361 ) ( CLEAR ?auto_17359 ) ( IS-CRATE ?auto_17360 ) ( not ( = ?auto_17359 ?auto_17360 ) ) ( AVAILABLE ?auto_17364 ) ( ON ?auto_17359 ?auto_17358 ) ( not ( = ?auto_17358 ?auto_17359 ) ) ( not ( = ?auto_17358 ?auto_17360 ) ) ( TRUCK-AT ?auto_17363 ?auto_17366 ) ( not ( = ?auto_17366 ?auto_17361 ) ) ( HOIST-AT ?auto_17365 ?auto_17366 ) ( not ( = ?auto_17364 ?auto_17365 ) ) ( AVAILABLE ?auto_17365 ) ( SURFACE-AT ?auto_17360 ?auto_17366 ) ( ON ?auto_17360 ?auto_17362 ) ( CLEAR ?auto_17360 ) ( not ( = ?auto_17359 ?auto_17362 ) ) ( not ( = ?auto_17360 ?auto_17362 ) ) ( not ( = ?auto_17358 ?auto_17362 ) ) ( ON ?auto_17356 ?auto_17355 ) ( ON ?auto_17357 ?auto_17356 ) ( ON ?auto_17358 ?auto_17357 ) ( not ( = ?auto_17355 ?auto_17356 ) ) ( not ( = ?auto_17355 ?auto_17357 ) ) ( not ( = ?auto_17355 ?auto_17358 ) ) ( not ( = ?auto_17355 ?auto_17359 ) ) ( not ( = ?auto_17355 ?auto_17360 ) ) ( not ( = ?auto_17355 ?auto_17362 ) ) ( not ( = ?auto_17356 ?auto_17357 ) ) ( not ( = ?auto_17356 ?auto_17358 ) ) ( not ( = ?auto_17356 ?auto_17359 ) ) ( not ( = ?auto_17356 ?auto_17360 ) ) ( not ( = ?auto_17356 ?auto_17362 ) ) ( not ( = ?auto_17357 ?auto_17358 ) ) ( not ( = ?auto_17357 ?auto_17359 ) ) ( not ( = ?auto_17357 ?auto_17360 ) ) ( not ( = ?auto_17357 ?auto_17362 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17358 ?auto_17359 ?auto_17360 )
      ( MAKE-5CRATE-VERIFY ?auto_17355 ?auto_17356 ?auto_17357 ?auto_17358 ?auto_17359 ?auto_17360 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17406 - SURFACE
      ?auto_17407 - SURFACE
      ?auto_17408 - SURFACE
      ?auto_17409 - SURFACE
      ?auto_17410 - SURFACE
      ?auto_17411 - SURFACE
    )
    :vars
    (
      ?auto_17412 - HOIST
      ?auto_17416 - PLACE
      ?auto_17415 - PLACE
      ?auto_17417 - HOIST
      ?auto_17414 - SURFACE
      ?auto_17413 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17412 ?auto_17416 ) ( SURFACE-AT ?auto_17410 ?auto_17416 ) ( CLEAR ?auto_17410 ) ( IS-CRATE ?auto_17411 ) ( not ( = ?auto_17410 ?auto_17411 ) ) ( AVAILABLE ?auto_17412 ) ( ON ?auto_17410 ?auto_17409 ) ( not ( = ?auto_17409 ?auto_17410 ) ) ( not ( = ?auto_17409 ?auto_17411 ) ) ( not ( = ?auto_17415 ?auto_17416 ) ) ( HOIST-AT ?auto_17417 ?auto_17415 ) ( not ( = ?auto_17412 ?auto_17417 ) ) ( AVAILABLE ?auto_17417 ) ( SURFACE-AT ?auto_17411 ?auto_17415 ) ( ON ?auto_17411 ?auto_17414 ) ( CLEAR ?auto_17411 ) ( not ( = ?auto_17410 ?auto_17414 ) ) ( not ( = ?auto_17411 ?auto_17414 ) ) ( not ( = ?auto_17409 ?auto_17414 ) ) ( TRUCK-AT ?auto_17413 ?auto_17416 ) ( ON ?auto_17407 ?auto_17406 ) ( ON ?auto_17408 ?auto_17407 ) ( ON ?auto_17409 ?auto_17408 ) ( not ( = ?auto_17406 ?auto_17407 ) ) ( not ( = ?auto_17406 ?auto_17408 ) ) ( not ( = ?auto_17406 ?auto_17409 ) ) ( not ( = ?auto_17406 ?auto_17410 ) ) ( not ( = ?auto_17406 ?auto_17411 ) ) ( not ( = ?auto_17406 ?auto_17414 ) ) ( not ( = ?auto_17407 ?auto_17408 ) ) ( not ( = ?auto_17407 ?auto_17409 ) ) ( not ( = ?auto_17407 ?auto_17410 ) ) ( not ( = ?auto_17407 ?auto_17411 ) ) ( not ( = ?auto_17407 ?auto_17414 ) ) ( not ( = ?auto_17408 ?auto_17409 ) ) ( not ( = ?auto_17408 ?auto_17410 ) ) ( not ( = ?auto_17408 ?auto_17411 ) ) ( not ( = ?auto_17408 ?auto_17414 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17409 ?auto_17410 ?auto_17411 )
      ( MAKE-5CRATE-VERIFY ?auto_17406 ?auto_17407 ?auto_17408 ?auto_17409 ?auto_17410 ?auto_17411 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17457 - SURFACE
      ?auto_17458 - SURFACE
      ?auto_17459 - SURFACE
      ?auto_17460 - SURFACE
      ?auto_17461 - SURFACE
      ?auto_17462 - SURFACE
    )
    :vars
    (
      ?auto_17463 - HOIST
      ?auto_17467 - PLACE
      ?auto_17466 - PLACE
      ?auto_17464 - HOIST
      ?auto_17465 - SURFACE
      ?auto_17468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17463 ?auto_17467 ) ( IS-CRATE ?auto_17462 ) ( not ( = ?auto_17461 ?auto_17462 ) ) ( not ( = ?auto_17460 ?auto_17461 ) ) ( not ( = ?auto_17460 ?auto_17462 ) ) ( not ( = ?auto_17466 ?auto_17467 ) ) ( HOIST-AT ?auto_17464 ?auto_17466 ) ( not ( = ?auto_17463 ?auto_17464 ) ) ( AVAILABLE ?auto_17464 ) ( SURFACE-AT ?auto_17462 ?auto_17466 ) ( ON ?auto_17462 ?auto_17465 ) ( CLEAR ?auto_17462 ) ( not ( = ?auto_17461 ?auto_17465 ) ) ( not ( = ?auto_17462 ?auto_17465 ) ) ( not ( = ?auto_17460 ?auto_17465 ) ) ( TRUCK-AT ?auto_17468 ?auto_17467 ) ( SURFACE-AT ?auto_17460 ?auto_17467 ) ( CLEAR ?auto_17460 ) ( LIFTING ?auto_17463 ?auto_17461 ) ( IS-CRATE ?auto_17461 ) ( ON ?auto_17458 ?auto_17457 ) ( ON ?auto_17459 ?auto_17458 ) ( ON ?auto_17460 ?auto_17459 ) ( not ( = ?auto_17457 ?auto_17458 ) ) ( not ( = ?auto_17457 ?auto_17459 ) ) ( not ( = ?auto_17457 ?auto_17460 ) ) ( not ( = ?auto_17457 ?auto_17461 ) ) ( not ( = ?auto_17457 ?auto_17462 ) ) ( not ( = ?auto_17457 ?auto_17465 ) ) ( not ( = ?auto_17458 ?auto_17459 ) ) ( not ( = ?auto_17458 ?auto_17460 ) ) ( not ( = ?auto_17458 ?auto_17461 ) ) ( not ( = ?auto_17458 ?auto_17462 ) ) ( not ( = ?auto_17458 ?auto_17465 ) ) ( not ( = ?auto_17459 ?auto_17460 ) ) ( not ( = ?auto_17459 ?auto_17461 ) ) ( not ( = ?auto_17459 ?auto_17462 ) ) ( not ( = ?auto_17459 ?auto_17465 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17460 ?auto_17461 ?auto_17462 )
      ( MAKE-5CRATE-VERIFY ?auto_17457 ?auto_17458 ?auto_17459 ?auto_17460 ?auto_17461 ?auto_17462 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17508 - SURFACE
      ?auto_17509 - SURFACE
      ?auto_17510 - SURFACE
      ?auto_17511 - SURFACE
      ?auto_17512 - SURFACE
      ?auto_17513 - SURFACE
    )
    :vars
    (
      ?auto_17516 - HOIST
      ?auto_17514 - PLACE
      ?auto_17515 - PLACE
      ?auto_17517 - HOIST
      ?auto_17519 - SURFACE
      ?auto_17518 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17516 ?auto_17514 ) ( IS-CRATE ?auto_17513 ) ( not ( = ?auto_17512 ?auto_17513 ) ) ( not ( = ?auto_17511 ?auto_17512 ) ) ( not ( = ?auto_17511 ?auto_17513 ) ) ( not ( = ?auto_17515 ?auto_17514 ) ) ( HOIST-AT ?auto_17517 ?auto_17515 ) ( not ( = ?auto_17516 ?auto_17517 ) ) ( AVAILABLE ?auto_17517 ) ( SURFACE-AT ?auto_17513 ?auto_17515 ) ( ON ?auto_17513 ?auto_17519 ) ( CLEAR ?auto_17513 ) ( not ( = ?auto_17512 ?auto_17519 ) ) ( not ( = ?auto_17513 ?auto_17519 ) ) ( not ( = ?auto_17511 ?auto_17519 ) ) ( TRUCK-AT ?auto_17518 ?auto_17514 ) ( SURFACE-AT ?auto_17511 ?auto_17514 ) ( CLEAR ?auto_17511 ) ( IS-CRATE ?auto_17512 ) ( AVAILABLE ?auto_17516 ) ( IN ?auto_17512 ?auto_17518 ) ( ON ?auto_17509 ?auto_17508 ) ( ON ?auto_17510 ?auto_17509 ) ( ON ?auto_17511 ?auto_17510 ) ( not ( = ?auto_17508 ?auto_17509 ) ) ( not ( = ?auto_17508 ?auto_17510 ) ) ( not ( = ?auto_17508 ?auto_17511 ) ) ( not ( = ?auto_17508 ?auto_17512 ) ) ( not ( = ?auto_17508 ?auto_17513 ) ) ( not ( = ?auto_17508 ?auto_17519 ) ) ( not ( = ?auto_17509 ?auto_17510 ) ) ( not ( = ?auto_17509 ?auto_17511 ) ) ( not ( = ?auto_17509 ?auto_17512 ) ) ( not ( = ?auto_17509 ?auto_17513 ) ) ( not ( = ?auto_17509 ?auto_17519 ) ) ( not ( = ?auto_17510 ?auto_17511 ) ) ( not ( = ?auto_17510 ?auto_17512 ) ) ( not ( = ?auto_17510 ?auto_17513 ) ) ( not ( = ?auto_17510 ?auto_17519 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17511 ?auto_17512 ?auto_17513 )
      ( MAKE-5CRATE-VERIFY ?auto_17508 ?auto_17509 ?auto_17510 ?auto_17511 ?auto_17512 ?auto_17513 ) )
  )

)

