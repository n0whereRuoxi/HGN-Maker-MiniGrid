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
      ?auto_15581 - SURFACE
      ?auto_15582 - SURFACE
    )
    :vars
    (
      ?auto_15583 - HOIST
      ?auto_15584 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15583 ?auto_15584 ) ( SURFACE-AT ?auto_15581 ?auto_15584 ) ( CLEAR ?auto_15581 ) ( LIFTING ?auto_15583 ?auto_15582 ) ( IS-CRATE ?auto_15582 ) ( not ( = ?auto_15581 ?auto_15582 ) ) )
    :subtasks
    ( ( !DROP ?auto_15583 ?auto_15582 ?auto_15581 ?auto_15584 )
      ( MAKE-1CRATE-VERIFY ?auto_15581 ?auto_15582 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15585 - SURFACE
      ?auto_15586 - SURFACE
    )
    :vars
    (
      ?auto_15588 - HOIST
      ?auto_15587 - PLACE
      ?auto_15589 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15588 ?auto_15587 ) ( SURFACE-AT ?auto_15585 ?auto_15587 ) ( CLEAR ?auto_15585 ) ( IS-CRATE ?auto_15586 ) ( not ( = ?auto_15585 ?auto_15586 ) ) ( TRUCK-AT ?auto_15589 ?auto_15587 ) ( AVAILABLE ?auto_15588 ) ( IN ?auto_15586 ?auto_15589 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15588 ?auto_15586 ?auto_15589 ?auto_15587 )
      ( MAKE-1CRATE ?auto_15585 ?auto_15586 )
      ( MAKE-1CRATE-VERIFY ?auto_15585 ?auto_15586 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15590 - SURFACE
      ?auto_15591 - SURFACE
    )
    :vars
    (
      ?auto_15594 - HOIST
      ?auto_15592 - PLACE
      ?auto_15593 - TRUCK
      ?auto_15595 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15594 ?auto_15592 ) ( SURFACE-AT ?auto_15590 ?auto_15592 ) ( CLEAR ?auto_15590 ) ( IS-CRATE ?auto_15591 ) ( not ( = ?auto_15590 ?auto_15591 ) ) ( AVAILABLE ?auto_15594 ) ( IN ?auto_15591 ?auto_15593 ) ( TRUCK-AT ?auto_15593 ?auto_15595 ) ( not ( = ?auto_15595 ?auto_15592 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15593 ?auto_15595 ?auto_15592 )
      ( MAKE-1CRATE ?auto_15590 ?auto_15591 )
      ( MAKE-1CRATE-VERIFY ?auto_15590 ?auto_15591 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15596 - SURFACE
      ?auto_15597 - SURFACE
    )
    :vars
    (
      ?auto_15600 - HOIST
      ?auto_15598 - PLACE
      ?auto_15601 - TRUCK
      ?auto_15599 - PLACE
      ?auto_15602 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15600 ?auto_15598 ) ( SURFACE-AT ?auto_15596 ?auto_15598 ) ( CLEAR ?auto_15596 ) ( IS-CRATE ?auto_15597 ) ( not ( = ?auto_15596 ?auto_15597 ) ) ( AVAILABLE ?auto_15600 ) ( TRUCK-AT ?auto_15601 ?auto_15599 ) ( not ( = ?auto_15599 ?auto_15598 ) ) ( HOIST-AT ?auto_15602 ?auto_15599 ) ( LIFTING ?auto_15602 ?auto_15597 ) ( not ( = ?auto_15600 ?auto_15602 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15602 ?auto_15597 ?auto_15601 ?auto_15599 )
      ( MAKE-1CRATE ?auto_15596 ?auto_15597 )
      ( MAKE-1CRATE-VERIFY ?auto_15596 ?auto_15597 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15603 - SURFACE
      ?auto_15604 - SURFACE
    )
    :vars
    (
      ?auto_15609 - HOIST
      ?auto_15605 - PLACE
      ?auto_15606 - TRUCK
      ?auto_15608 - PLACE
      ?auto_15607 - HOIST
      ?auto_15610 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15609 ?auto_15605 ) ( SURFACE-AT ?auto_15603 ?auto_15605 ) ( CLEAR ?auto_15603 ) ( IS-CRATE ?auto_15604 ) ( not ( = ?auto_15603 ?auto_15604 ) ) ( AVAILABLE ?auto_15609 ) ( TRUCK-AT ?auto_15606 ?auto_15608 ) ( not ( = ?auto_15608 ?auto_15605 ) ) ( HOIST-AT ?auto_15607 ?auto_15608 ) ( not ( = ?auto_15609 ?auto_15607 ) ) ( AVAILABLE ?auto_15607 ) ( SURFACE-AT ?auto_15604 ?auto_15608 ) ( ON ?auto_15604 ?auto_15610 ) ( CLEAR ?auto_15604 ) ( not ( = ?auto_15603 ?auto_15610 ) ) ( not ( = ?auto_15604 ?auto_15610 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15607 ?auto_15604 ?auto_15610 ?auto_15608 )
      ( MAKE-1CRATE ?auto_15603 ?auto_15604 )
      ( MAKE-1CRATE-VERIFY ?auto_15603 ?auto_15604 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15611 - SURFACE
      ?auto_15612 - SURFACE
    )
    :vars
    (
      ?auto_15616 - HOIST
      ?auto_15613 - PLACE
      ?auto_15614 - PLACE
      ?auto_15615 - HOIST
      ?auto_15618 - SURFACE
      ?auto_15617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15616 ?auto_15613 ) ( SURFACE-AT ?auto_15611 ?auto_15613 ) ( CLEAR ?auto_15611 ) ( IS-CRATE ?auto_15612 ) ( not ( = ?auto_15611 ?auto_15612 ) ) ( AVAILABLE ?auto_15616 ) ( not ( = ?auto_15614 ?auto_15613 ) ) ( HOIST-AT ?auto_15615 ?auto_15614 ) ( not ( = ?auto_15616 ?auto_15615 ) ) ( AVAILABLE ?auto_15615 ) ( SURFACE-AT ?auto_15612 ?auto_15614 ) ( ON ?auto_15612 ?auto_15618 ) ( CLEAR ?auto_15612 ) ( not ( = ?auto_15611 ?auto_15618 ) ) ( not ( = ?auto_15612 ?auto_15618 ) ) ( TRUCK-AT ?auto_15617 ?auto_15613 ) )
    :subtasks
    ( ( !DRIVE ?auto_15617 ?auto_15613 ?auto_15614 )
      ( MAKE-1CRATE ?auto_15611 ?auto_15612 )
      ( MAKE-1CRATE-VERIFY ?auto_15611 ?auto_15612 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15624 - SURFACE
      ?auto_15625 - SURFACE
    )
    :vars
    (
      ?auto_15626 - HOIST
      ?auto_15627 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15626 ?auto_15627 ) ( SURFACE-AT ?auto_15624 ?auto_15627 ) ( CLEAR ?auto_15624 ) ( LIFTING ?auto_15626 ?auto_15625 ) ( IS-CRATE ?auto_15625 ) ( not ( = ?auto_15624 ?auto_15625 ) ) )
    :subtasks
    ( ( !DROP ?auto_15626 ?auto_15625 ?auto_15624 ?auto_15627 )
      ( MAKE-1CRATE-VERIFY ?auto_15624 ?auto_15625 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15628 - SURFACE
      ?auto_15629 - SURFACE
      ?auto_15630 - SURFACE
    )
    :vars
    (
      ?auto_15631 - HOIST
      ?auto_15632 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15631 ?auto_15632 ) ( SURFACE-AT ?auto_15629 ?auto_15632 ) ( CLEAR ?auto_15629 ) ( LIFTING ?auto_15631 ?auto_15630 ) ( IS-CRATE ?auto_15630 ) ( not ( = ?auto_15629 ?auto_15630 ) ) ( ON ?auto_15629 ?auto_15628 ) ( not ( = ?auto_15628 ?auto_15629 ) ) ( not ( = ?auto_15628 ?auto_15630 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15629 ?auto_15630 )
      ( MAKE-2CRATE-VERIFY ?auto_15628 ?auto_15629 ?auto_15630 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15633 - SURFACE
      ?auto_15634 - SURFACE
    )
    :vars
    (
      ?auto_15635 - HOIST
      ?auto_15636 - PLACE
      ?auto_15637 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15635 ?auto_15636 ) ( SURFACE-AT ?auto_15633 ?auto_15636 ) ( CLEAR ?auto_15633 ) ( IS-CRATE ?auto_15634 ) ( not ( = ?auto_15633 ?auto_15634 ) ) ( TRUCK-AT ?auto_15637 ?auto_15636 ) ( AVAILABLE ?auto_15635 ) ( IN ?auto_15634 ?auto_15637 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15635 ?auto_15634 ?auto_15637 ?auto_15636 )
      ( MAKE-1CRATE ?auto_15633 ?auto_15634 )
      ( MAKE-1CRATE-VERIFY ?auto_15633 ?auto_15634 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15638 - SURFACE
      ?auto_15639 - SURFACE
      ?auto_15640 - SURFACE
    )
    :vars
    (
      ?auto_15643 - HOIST
      ?auto_15642 - PLACE
      ?auto_15641 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15643 ?auto_15642 ) ( SURFACE-AT ?auto_15639 ?auto_15642 ) ( CLEAR ?auto_15639 ) ( IS-CRATE ?auto_15640 ) ( not ( = ?auto_15639 ?auto_15640 ) ) ( TRUCK-AT ?auto_15641 ?auto_15642 ) ( AVAILABLE ?auto_15643 ) ( IN ?auto_15640 ?auto_15641 ) ( ON ?auto_15639 ?auto_15638 ) ( not ( = ?auto_15638 ?auto_15639 ) ) ( not ( = ?auto_15638 ?auto_15640 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15639 ?auto_15640 )
      ( MAKE-2CRATE-VERIFY ?auto_15638 ?auto_15639 ?auto_15640 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15644 - SURFACE
      ?auto_15645 - SURFACE
    )
    :vars
    (
      ?auto_15648 - HOIST
      ?auto_15647 - PLACE
      ?auto_15646 - TRUCK
      ?auto_15649 - SURFACE
      ?auto_15650 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15648 ?auto_15647 ) ( SURFACE-AT ?auto_15644 ?auto_15647 ) ( CLEAR ?auto_15644 ) ( IS-CRATE ?auto_15645 ) ( not ( = ?auto_15644 ?auto_15645 ) ) ( AVAILABLE ?auto_15648 ) ( IN ?auto_15645 ?auto_15646 ) ( ON ?auto_15644 ?auto_15649 ) ( not ( = ?auto_15649 ?auto_15644 ) ) ( not ( = ?auto_15649 ?auto_15645 ) ) ( TRUCK-AT ?auto_15646 ?auto_15650 ) ( not ( = ?auto_15650 ?auto_15647 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15646 ?auto_15650 ?auto_15647 )
      ( MAKE-2CRATE ?auto_15649 ?auto_15644 ?auto_15645 )
      ( MAKE-1CRATE-VERIFY ?auto_15644 ?auto_15645 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15651 - SURFACE
      ?auto_15652 - SURFACE
      ?auto_15653 - SURFACE
    )
    :vars
    (
      ?auto_15654 - HOIST
      ?auto_15656 - PLACE
      ?auto_15655 - TRUCK
      ?auto_15657 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15654 ?auto_15656 ) ( SURFACE-AT ?auto_15652 ?auto_15656 ) ( CLEAR ?auto_15652 ) ( IS-CRATE ?auto_15653 ) ( not ( = ?auto_15652 ?auto_15653 ) ) ( AVAILABLE ?auto_15654 ) ( IN ?auto_15653 ?auto_15655 ) ( ON ?auto_15652 ?auto_15651 ) ( not ( = ?auto_15651 ?auto_15652 ) ) ( not ( = ?auto_15651 ?auto_15653 ) ) ( TRUCK-AT ?auto_15655 ?auto_15657 ) ( not ( = ?auto_15657 ?auto_15656 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15652 ?auto_15653 )
      ( MAKE-2CRATE-VERIFY ?auto_15651 ?auto_15652 ?auto_15653 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15658 - SURFACE
      ?auto_15659 - SURFACE
    )
    :vars
    (
      ?auto_15662 - HOIST
      ?auto_15661 - PLACE
      ?auto_15660 - SURFACE
      ?auto_15663 - TRUCK
      ?auto_15664 - PLACE
      ?auto_15665 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15662 ?auto_15661 ) ( SURFACE-AT ?auto_15658 ?auto_15661 ) ( CLEAR ?auto_15658 ) ( IS-CRATE ?auto_15659 ) ( not ( = ?auto_15658 ?auto_15659 ) ) ( AVAILABLE ?auto_15662 ) ( ON ?auto_15658 ?auto_15660 ) ( not ( = ?auto_15660 ?auto_15658 ) ) ( not ( = ?auto_15660 ?auto_15659 ) ) ( TRUCK-AT ?auto_15663 ?auto_15664 ) ( not ( = ?auto_15664 ?auto_15661 ) ) ( HOIST-AT ?auto_15665 ?auto_15664 ) ( LIFTING ?auto_15665 ?auto_15659 ) ( not ( = ?auto_15662 ?auto_15665 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15665 ?auto_15659 ?auto_15663 ?auto_15664 )
      ( MAKE-2CRATE ?auto_15660 ?auto_15658 ?auto_15659 )
      ( MAKE-1CRATE-VERIFY ?auto_15658 ?auto_15659 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15666 - SURFACE
      ?auto_15667 - SURFACE
      ?auto_15668 - SURFACE
    )
    :vars
    (
      ?auto_15671 - HOIST
      ?auto_15672 - PLACE
      ?auto_15669 - TRUCK
      ?auto_15670 - PLACE
      ?auto_15673 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15671 ?auto_15672 ) ( SURFACE-AT ?auto_15667 ?auto_15672 ) ( CLEAR ?auto_15667 ) ( IS-CRATE ?auto_15668 ) ( not ( = ?auto_15667 ?auto_15668 ) ) ( AVAILABLE ?auto_15671 ) ( ON ?auto_15667 ?auto_15666 ) ( not ( = ?auto_15666 ?auto_15667 ) ) ( not ( = ?auto_15666 ?auto_15668 ) ) ( TRUCK-AT ?auto_15669 ?auto_15670 ) ( not ( = ?auto_15670 ?auto_15672 ) ) ( HOIST-AT ?auto_15673 ?auto_15670 ) ( LIFTING ?auto_15673 ?auto_15668 ) ( not ( = ?auto_15671 ?auto_15673 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15667 ?auto_15668 )
      ( MAKE-2CRATE-VERIFY ?auto_15666 ?auto_15667 ?auto_15668 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15674 - SURFACE
      ?auto_15675 - SURFACE
    )
    :vars
    (
      ?auto_15676 - HOIST
      ?auto_15681 - PLACE
      ?auto_15680 - SURFACE
      ?auto_15678 - TRUCK
      ?auto_15677 - PLACE
      ?auto_15679 - HOIST
      ?auto_15682 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15676 ?auto_15681 ) ( SURFACE-AT ?auto_15674 ?auto_15681 ) ( CLEAR ?auto_15674 ) ( IS-CRATE ?auto_15675 ) ( not ( = ?auto_15674 ?auto_15675 ) ) ( AVAILABLE ?auto_15676 ) ( ON ?auto_15674 ?auto_15680 ) ( not ( = ?auto_15680 ?auto_15674 ) ) ( not ( = ?auto_15680 ?auto_15675 ) ) ( TRUCK-AT ?auto_15678 ?auto_15677 ) ( not ( = ?auto_15677 ?auto_15681 ) ) ( HOIST-AT ?auto_15679 ?auto_15677 ) ( not ( = ?auto_15676 ?auto_15679 ) ) ( AVAILABLE ?auto_15679 ) ( SURFACE-AT ?auto_15675 ?auto_15677 ) ( ON ?auto_15675 ?auto_15682 ) ( CLEAR ?auto_15675 ) ( not ( = ?auto_15674 ?auto_15682 ) ) ( not ( = ?auto_15675 ?auto_15682 ) ) ( not ( = ?auto_15680 ?auto_15682 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15679 ?auto_15675 ?auto_15682 ?auto_15677 )
      ( MAKE-2CRATE ?auto_15680 ?auto_15674 ?auto_15675 )
      ( MAKE-1CRATE-VERIFY ?auto_15674 ?auto_15675 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15683 - SURFACE
      ?auto_15684 - SURFACE
      ?auto_15685 - SURFACE
    )
    :vars
    (
      ?auto_15686 - HOIST
      ?auto_15687 - PLACE
      ?auto_15691 - TRUCK
      ?auto_15689 - PLACE
      ?auto_15688 - HOIST
      ?auto_15690 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15686 ?auto_15687 ) ( SURFACE-AT ?auto_15684 ?auto_15687 ) ( CLEAR ?auto_15684 ) ( IS-CRATE ?auto_15685 ) ( not ( = ?auto_15684 ?auto_15685 ) ) ( AVAILABLE ?auto_15686 ) ( ON ?auto_15684 ?auto_15683 ) ( not ( = ?auto_15683 ?auto_15684 ) ) ( not ( = ?auto_15683 ?auto_15685 ) ) ( TRUCK-AT ?auto_15691 ?auto_15689 ) ( not ( = ?auto_15689 ?auto_15687 ) ) ( HOIST-AT ?auto_15688 ?auto_15689 ) ( not ( = ?auto_15686 ?auto_15688 ) ) ( AVAILABLE ?auto_15688 ) ( SURFACE-AT ?auto_15685 ?auto_15689 ) ( ON ?auto_15685 ?auto_15690 ) ( CLEAR ?auto_15685 ) ( not ( = ?auto_15684 ?auto_15690 ) ) ( not ( = ?auto_15685 ?auto_15690 ) ) ( not ( = ?auto_15683 ?auto_15690 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15684 ?auto_15685 )
      ( MAKE-2CRATE-VERIFY ?auto_15683 ?auto_15684 ?auto_15685 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15692 - SURFACE
      ?auto_15693 - SURFACE
    )
    :vars
    (
      ?auto_15700 - HOIST
      ?auto_15698 - PLACE
      ?auto_15694 - SURFACE
      ?auto_15697 - PLACE
      ?auto_15696 - HOIST
      ?auto_15699 - SURFACE
      ?auto_15695 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15700 ?auto_15698 ) ( SURFACE-AT ?auto_15692 ?auto_15698 ) ( CLEAR ?auto_15692 ) ( IS-CRATE ?auto_15693 ) ( not ( = ?auto_15692 ?auto_15693 ) ) ( AVAILABLE ?auto_15700 ) ( ON ?auto_15692 ?auto_15694 ) ( not ( = ?auto_15694 ?auto_15692 ) ) ( not ( = ?auto_15694 ?auto_15693 ) ) ( not ( = ?auto_15697 ?auto_15698 ) ) ( HOIST-AT ?auto_15696 ?auto_15697 ) ( not ( = ?auto_15700 ?auto_15696 ) ) ( AVAILABLE ?auto_15696 ) ( SURFACE-AT ?auto_15693 ?auto_15697 ) ( ON ?auto_15693 ?auto_15699 ) ( CLEAR ?auto_15693 ) ( not ( = ?auto_15692 ?auto_15699 ) ) ( not ( = ?auto_15693 ?auto_15699 ) ) ( not ( = ?auto_15694 ?auto_15699 ) ) ( TRUCK-AT ?auto_15695 ?auto_15698 ) )
    :subtasks
    ( ( !DRIVE ?auto_15695 ?auto_15698 ?auto_15697 )
      ( MAKE-2CRATE ?auto_15694 ?auto_15692 ?auto_15693 )
      ( MAKE-1CRATE-VERIFY ?auto_15692 ?auto_15693 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15701 - SURFACE
      ?auto_15702 - SURFACE
      ?auto_15703 - SURFACE
    )
    :vars
    (
      ?auto_15709 - HOIST
      ?auto_15704 - PLACE
      ?auto_15706 - PLACE
      ?auto_15708 - HOIST
      ?auto_15705 - SURFACE
      ?auto_15707 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15709 ?auto_15704 ) ( SURFACE-AT ?auto_15702 ?auto_15704 ) ( CLEAR ?auto_15702 ) ( IS-CRATE ?auto_15703 ) ( not ( = ?auto_15702 ?auto_15703 ) ) ( AVAILABLE ?auto_15709 ) ( ON ?auto_15702 ?auto_15701 ) ( not ( = ?auto_15701 ?auto_15702 ) ) ( not ( = ?auto_15701 ?auto_15703 ) ) ( not ( = ?auto_15706 ?auto_15704 ) ) ( HOIST-AT ?auto_15708 ?auto_15706 ) ( not ( = ?auto_15709 ?auto_15708 ) ) ( AVAILABLE ?auto_15708 ) ( SURFACE-AT ?auto_15703 ?auto_15706 ) ( ON ?auto_15703 ?auto_15705 ) ( CLEAR ?auto_15703 ) ( not ( = ?auto_15702 ?auto_15705 ) ) ( not ( = ?auto_15703 ?auto_15705 ) ) ( not ( = ?auto_15701 ?auto_15705 ) ) ( TRUCK-AT ?auto_15707 ?auto_15704 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15702 ?auto_15703 )
      ( MAKE-2CRATE-VERIFY ?auto_15701 ?auto_15702 ?auto_15703 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15710 - SURFACE
      ?auto_15711 - SURFACE
    )
    :vars
    (
      ?auto_15715 - HOIST
      ?auto_15712 - PLACE
      ?auto_15716 - SURFACE
      ?auto_15714 - PLACE
      ?auto_15718 - HOIST
      ?auto_15713 - SURFACE
      ?auto_15717 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15715 ?auto_15712 ) ( IS-CRATE ?auto_15711 ) ( not ( = ?auto_15710 ?auto_15711 ) ) ( not ( = ?auto_15716 ?auto_15710 ) ) ( not ( = ?auto_15716 ?auto_15711 ) ) ( not ( = ?auto_15714 ?auto_15712 ) ) ( HOIST-AT ?auto_15718 ?auto_15714 ) ( not ( = ?auto_15715 ?auto_15718 ) ) ( AVAILABLE ?auto_15718 ) ( SURFACE-AT ?auto_15711 ?auto_15714 ) ( ON ?auto_15711 ?auto_15713 ) ( CLEAR ?auto_15711 ) ( not ( = ?auto_15710 ?auto_15713 ) ) ( not ( = ?auto_15711 ?auto_15713 ) ) ( not ( = ?auto_15716 ?auto_15713 ) ) ( TRUCK-AT ?auto_15717 ?auto_15712 ) ( SURFACE-AT ?auto_15716 ?auto_15712 ) ( CLEAR ?auto_15716 ) ( LIFTING ?auto_15715 ?auto_15710 ) ( IS-CRATE ?auto_15710 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15716 ?auto_15710 )
      ( MAKE-2CRATE ?auto_15716 ?auto_15710 ?auto_15711 )
      ( MAKE-1CRATE-VERIFY ?auto_15710 ?auto_15711 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15719 - SURFACE
      ?auto_15720 - SURFACE
      ?auto_15721 - SURFACE
    )
    :vars
    (
      ?auto_15726 - HOIST
      ?auto_15725 - PLACE
      ?auto_15727 - PLACE
      ?auto_15723 - HOIST
      ?auto_15722 - SURFACE
      ?auto_15724 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15726 ?auto_15725 ) ( IS-CRATE ?auto_15721 ) ( not ( = ?auto_15720 ?auto_15721 ) ) ( not ( = ?auto_15719 ?auto_15720 ) ) ( not ( = ?auto_15719 ?auto_15721 ) ) ( not ( = ?auto_15727 ?auto_15725 ) ) ( HOIST-AT ?auto_15723 ?auto_15727 ) ( not ( = ?auto_15726 ?auto_15723 ) ) ( AVAILABLE ?auto_15723 ) ( SURFACE-AT ?auto_15721 ?auto_15727 ) ( ON ?auto_15721 ?auto_15722 ) ( CLEAR ?auto_15721 ) ( not ( = ?auto_15720 ?auto_15722 ) ) ( not ( = ?auto_15721 ?auto_15722 ) ) ( not ( = ?auto_15719 ?auto_15722 ) ) ( TRUCK-AT ?auto_15724 ?auto_15725 ) ( SURFACE-AT ?auto_15719 ?auto_15725 ) ( CLEAR ?auto_15719 ) ( LIFTING ?auto_15726 ?auto_15720 ) ( IS-CRATE ?auto_15720 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15720 ?auto_15721 )
      ( MAKE-2CRATE-VERIFY ?auto_15719 ?auto_15720 ?auto_15721 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15728 - SURFACE
      ?auto_15729 - SURFACE
    )
    :vars
    (
      ?auto_15735 - HOIST
      ?auto_15732 - PLACE
      ?auto_15736 - SURFACE
      ?auto_15734 - PLACE
      ?auto_15733 - HOIST
      ?auto_15730 - SURFACE
      ?auto_15731 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15735 ?auto_15732 ) ( IS-CRATE ?auto_15729 ) ( not ( = ?auto_15728 ?auto_15729 ) ) ( not ( = ?auto_15736 ?auto_15728 ) ) ( not ( = ?auto_15736 ?auto_15729 ) ) ( not ( = ?auto_15734 ?auto_15732 ) ) ( HOIST-AT ?auto_15733 ?auto_15734 ) ( not ( = ?auto_15735 ?auto_15733 ) ) ( AVAILABLE ?auto_15733 ) ( SURFACE-AT ?auto_15729 ?auto_15734 ) ( ON ?auto_15729 ?auto_15730 ) ( CLEAR ?auto_15729 ) ( not ( = ?auto_15728 ?auto_15730 ) ) ( not ( = ?auto_15729 ?auto_15730 ) ) ( not ( = ?auto_15736 ?auto_15730 ) ) ( TRUCK-AT ?auto_15731 ?auto_15732 ) ( SURFACE-AT ?auto_15736 ?auto_15732 ) ( CLEAR ?auto_15736 ) ( IS-CRATE ?auto_15728 ) ( AVAILABLE ?auto_15735 ) ( IN ?auto_15728 ?auto_15731 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15735 ?auto_15728 ?auto_15731 ?auto_15732 )
      ( MAKE-2CRATE ?auto_15736 ?auto_15728 ?auto_15729 )
      ( MAKE-1CRATE-VERIFY ?auto_15728 ?auto_15729 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15737 - SURFACE
      ?auto_15738 - SURFACE
      ?auto_15739 - SURFACE
    )
    :vars
    (
      ?auto_15743 - HOIST
      ?auto_15744 - PLACE
      ?auto_15741 - PLACE
      ?auto_15742 - HOIST
      ?auto_15740 - SURFACE
      ?auto_15745 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15743 ?auto_15744 ) ( IS-CRATE ?auto_15739 ) ( not ( = ?auto_15738 ?auto_15739 ) ) ( not ( = ?auto_15737 ?auto_15738 ) ) ( not ( = ?auto_15737 ?auto_15739 ) ) ( not ( = ?auto_15741 ?auto_15744 ) ) ( HOIST-AT ?auto_15742 ?auto_15741 ) ( not ( = ?auto_15743 ?auto_15742 ) ) ( AVAILABLE ?auto_15742 ) ( SURFACE-AT ?auto_15739 ?auto_15741 ) ( ON ?auto_15739 ?auto_15740 ) ( CLEAR ?auto_15739 ) ( not ( = ?auto_15738 ?auto_15740 ) ) ( not ( = ?auto_15739 ?auto_15740 ) ) ( not ( = ?auto_15737 ?auto_15740 ) ) ( TRUCK-AT ?auto_15745 ?auto_15744 ) ( SURFACE-AT ?auto_15737 ?auto_15744 ) ( CLEAR ?auto_15737 ) ( IS-CRATE ?auto_15738 ) ( AVAILABLE ?auto_15743 ) ( IN ?auto_15738 ?auto_15745 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15738 ?auto_15739 )
      ( MAKE-2CRATE-VERIFY ?auto_15737 ?auto_15738 ?auto_15739 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15746 - SURFACE
      ?auto_15747 - SURFACE
    )
    :vars
    (
      ?auto_15751 - HOIST
      ?auto_15750 - PLACE
      ?auto_15754 - SURFACE
      ?auto_15749 - PLACE
      ?auto_15752 - HOIST
      ?auto_15753 - SURFACE
      ?auto_15748 - TRUCK
      ?auto_15755 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15751 ?auto_15750 ) ( IS-CRATE ?auto_15747 ) ( not ( = ?auto_15746 ?auto_15747 ) ) ( not ( = ?auto_15754 ?auto_15746 ) ) ( not ( = ?auto_15754 ?auto_15747 ) ) ( not ( = ?auto_15749 ?auto_15750 ) ) ( HOIST-AT ?auto_15752 ?auto_15749 ) ( not ( = ?auto_15751 ?auto_15752 ) ) ( AVAILABLE ?auto_15752 ) ( SURFACE-AT ?auto_15747 ?auto_15749 ) ( ON ?auto_15747 ?auto_15753 ) ( CLEAR ?auto_15747 ) ( not ( = ?auto_15746 ?auto_15753 ) ) ( not ( = ?auto_15747 ?auto_15753 ) ) ( not ( = ?auto_15754 ?auto_15753 ) ) ( SURFACE-AT ?auto_15754 ?auto_15750 ) ( CLEAR ?auto_15754 ) ( IS-CRATE ?auto_15746 ) ( AVAILABLE ?auto_15751 ) ( IN ?auto_15746 ?auto_15748 ) ( TRUCK-AT ?auto_15748 ?auto_15755 ) ( not ( = ?auto_15755 ?auto_15750 ) ) ( not ( = ?auto_15749 ?auto_15755 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15748 ?auto_15755 ?auto_15750 )
      ( MAKE-2CRATE ?auto_15754 ?auto_15746 ?auto_15747 )
      ( MAKE-1CRATE-VERIFY ?auto_15746 ?auto_15747 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15756 - SURFACE
      ?auto_15757 - SURFACE
      ?auto_15758 - SURFACE
    )
    :vars
    (
      ?auto_15759 - HOIST
      ?auto_15760 - PLACE
      ?auto_15761 - PLACE
      ?auto_15762 - HOIST
      ?auto_15763 - SURFACE
      ?auto_15765 - TRUCK
      ?auto_15764 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15759 ?auto_15760 ) ( IS-CRATE ?auto_15758 ) ( not ( = ?auto_15757 ?auto_15758 ) ) ( not ( = ?auto_15756 ?auto_15757 ) ) ( not ( = ?auto_15756 ?auto_15758 ) ) ( not ( = ?auto_15761 ?auto_15760 ) ) ( HOIST-AT ?auto_15762 ?auto_15761 ) ( not ( = ?auto_15759 ?auto_15762 ) ) ( AVAILABLE ?auto_15762 ) ( SURFACE-AT ?auto_15758 ?auto_15761 ) ( ON ?auto_15758 ?auto_15763 ) ( CLEAR ?auto_15758 ) ( not ( = ?auto_15757 ?auto_15763 ) ) ( not ( = ?auto_15758 ?auto_15763 ) ) ( not ( = ?auto_15756 ?auto_15763 ) ) ( SURFACE-AT ?auto_15756 ?auto_15760 ) ( CLEAR ?auto_15756 ) ( IS-CRATE ?auto_15757 ) ( AVAILABLE ?auto_15759 ) ( IN ?auto_15757 ?auto_15765 ) ( TRUCK-AT ?auto_15765 ?auto_15764 ) ( not ( = ?auto_15764 ?auto_15760 ) ) ( not ( = ?auto_15761 ?auto_15764 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15757 ?auto_15758 )
      ( MAKE-2CRATE-VERIFY ?auto_15756 ?auto_15757 ?auto_15758 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15766 - SURFACE
      ?auto_15767 - SURFACE
    )
    :vars
    (
      ?auto_15771 - HOIST
      ?auto_15772 - PLACE
      ?auto_15775 - SURFACE
      ?auto_15774 - PLACE
      ?auto_15768 - HOIST
      ?auto_15770 - SURFACE
      ?auto_15773 - TRUCK
      ?auto_15769 - PLACE
      ?auto_15776 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15771 ?auto_15772 ) ( IS-CRATE ?auto_15767 ) ( not ( = ?auto_15766 ?auto_15767 ) ) ( not ( = ?auto_15775 ?auto_15766 ) ) ( not ( = ?auto_15775 ?auto_15767 ) ) ( not ( = ?auto_15774 ?auto_15772 ) ) ( HOIST-AT ?auto_15768 ?auto_15774 ) ( not ( = ?auto_15771 ?auto_15768 ) ) ( AVAILABLE ?auto_15768 ) ( SURFACE-AT ?auto_15767 ?auto_15774 ) ( ON ?auto_15767 ?auto_15770 ) ( CLEAR ?auto_15767 ) ( not ( = ?auto_15766 ?auto_15770 ) ) ( not ( = ?auto_15767 ?auto_15770 ) ) ( not ( = ?auto_15775 ?auto_15770 ) ) ( SURFACE-AT ?auto_15775 ?auto_15772 ) ( CLEAR ?auto_15775 ) ( IS-CRATE ?auto_15766 ) ( AVAILABLE ?auto_15771 ) ( TRUCK-AT ?auto_15773 ?auto_15769 ) ( not ( = ?auto_15769 ?auto_15772 ) ) ( not ( = ?auto_15774 ?auto_15769 ) ) ( HOIST-AT ?auto_15776 ?auto_15769 ) ( LIFTING ?auto_15776 ?auto_15766 ) ( not ( = ?auto_15771 ?auto_15776 ) ) ( not ( = ?auto_15768 ?auto_15776 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15776 ?auto_15766 ?auto_15773 ?auto_15769 )
      ( MAKE-2CRATE ?auto_15775 ?auto_15766 ?auto_15767 )
      ( MAKE-1CRATE-VERIFY ?auto_15766 ?auto_15767 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15777 - SURFACE
      ?auto_15778 - SURFACE
      ?auto_15779 - SURFACE
    )
    :vars
    (
      ?auto_15782 - HOIST
      ?auto_15785 - PLACE
      ?auto_15780 - PLACE
      ?auto_15787 - HOIST
      ?auto_15783 - SURFACE
      ?auto_15784 - TRUCK
      ?auto_15786 - PLACE
      ?auto_15781 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15782 ?auto_15785 ) ( IS-CRATE ?auto_15779 ) ( not ( = ?auto_15778 ?auto_15779 ) ) ( not ( = ?auto_15777 ?auto_15778 ) ) ( not ( = ?auto_15777 ?auto_15779 ) ) ( not ( = ?auto_15780 ?auto_15785 ) ) ( HOIST-AT ?auto_15787 ?auto_15780 ) ( not ( = ?auto_15782 ?auto_15787 ) ) ( AVAILABLE ?auto_15787 ) ( SURFACE-AT ?auto_15779 ?auto_15780 ) ( ON ?auto_15779 ?auto_15783 ) ( CLEAR ?auto_15779 ) ( not ( = ?auto_15778 ?auto_15783 ) ) ( not ( = ?auto_15779 ?auto_15783 ) ) ( not ( = ?auto_15777 ?auto_15783 ) ) ( SURFACE-AT ?auto_15777 ?auto_15785 ) ( CLEAR ?auto_15777 ) ( IS-CRATE ?auto_15778 ) ( AVAILABLE ?auto_15782 ) ( TRUCK-AT ?auto_15784 ?auto_15786 ) ( not ( = ?auto_15786 ?auto_15785 ) ) ( not ( = ?auto_15780 ?auto_15786 ) ) ( HOIST-AT ?auto_15781 ?auto_15786 ) ( LIFTING ?auto_15781 ?auto_15778 ) ( not ( = ?auto_15782 ?auto_15781 ) ) ( not ( = ?auto_15787 ?auto_15781 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15778 ?auto_15779 )
      ( MAKE-2CRATE-VERIFY ?auto_15777 ?auto_15778 ?auto_15779 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15788 - SURFACE
      ?auto_15789 - SURFACE
    )
    :vars
    (
      ?auto_15797 - HOIST
      ?auto_15795 - PLACE
      ?auto_15798 - SURFACE
      ?auto_15790 - PLACE
      ?auto_15794 - HOIST
      ?auto_15791 - SURFACE
      ?auto_15796 - TRUCK
      ?auto_15793 - PLACE
      ?auto_15792 - HOIST
      ?auto_15799 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15797 ?auto_15795 ) ( IS-CRATE ?auto_15789 ) ( not ( = ?auto_15788 ?auto_15789 ) ) ( not ( = ?auto_15798 ?auto_15788 ) ) ( not ( = ?auto_15798 ?auto_15789 ) ) ( not ( = ?auto_15790 ?auto_15795 ) ) ( HOIST-AT ?auto_15794 ?auto_15790 ) ( not ( = ?auto_15797 ?auto_15794 ) ) ( AVAILABLE ?auto_15794 ) ( SURFACE-AT ?auto_15789 ?auto_15790 ) ( ON ?auto_15789 ?auto_15791 ) ( CLEAR ?auto_15789 ) ( not ( = ?auto_15788 ?auto_15791 ) ) ( not ( = ?auto_15789 ?auto_15791 ) ) ( not ( = ?auto_15798 ?auto_15791 ) ) ( SURFACE-AT ?auto_15798 ?auto_15795 ) ( CLEAR ?auto_15798 ) ( IS-CRATE ?auto_15788 ) ( AVAILABLE ?auto_15797 ) ( TRUCK-AT ?auto_15796 ?auto_15793 ) ( not ( = ?auto_15793 ?auto_15795 ) ) ( not ( = ?auto_15790 ?auto_15793 ) ) ( HOIST-AT ?auto_15792 ?auto_15793 ) ( not ( = ?auto_15797 ?auto_15792 ) ) ( not ( = ?auto_15794 ?auto_15792 ) ) ( AVAILABLE ?auto_15792 ) ( SURFACE-AT ?auto_15788 ?auto_15793 ) ( ON ?auto_15788 ?auto_15799 ) ( CLEAR ?auto_15788 ) ( not ( = ?auto_15788 ?auto_15799 ) ) ( not ( = ?auto_15789 ?auto_15799 ) ) ( not ( = ?auto_15798 ?auto_15799 ) ) ( not ( = ?auto_15791 ?auto_15799 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15792 ?auto_15788 ?auto_15799 ?auto_15793 )
      ( MAKE-2CRATE ?auto_15798 ?auto_15788 ?auto_15789 )
      ( MAKE-1CRATE-VERIFY ?auto_15788 ?auto_15789 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15800 - SURFACE
      ?auto_15801 - SURFACE
      ?auto_15802 - SURFACE
    )
    :vars
    (
      ?auto_15807 - HOIST
      ?auto_15804 - PLACE
      ?auto_15808 - PLACE
      ?auto_15803 - HOIST
      ?auto_15810 - SURFACE
      ?auto_15805 - TRUCK
      ?auto_15811 - PLACE
      ?auto_15806 - HOIST
      ?auto_15809 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15807 ?auto_15804 ) ( IS-CRATE ?auto_15802 ) ( not ( = ?auto_15801 ?auto_15802 ) ) ( not ( = ?auto_15800 ?auto_15801 ) ) ( not ( = ?auto_15800 ?auto_15802 ) ) ( not ( = ?auto_15808 ?auto_15804 ) ) ( HOIST-AT ?auto_15803 ?auto_15808 ) ( not ( = ?auto_15807 ?auto_15803 ) ) ( AVAILABLE ?auto_15803 ) ( SURFACE-AT ?auto_15802 ?auto_15808 ) ( ON ?auto_15802 ?auto_15810 ) ( CLEAR ?auto_15802 ) ( not ( = ?auto_15801 ?auto_15810 ) ) ( not ( = ?auto_15802 ?auto_15810 ) ) ( not ( = ?auto_15800 ?auto_15810 ) ) ( SURFACE-AT ?auto_15800 ?auto_15804 ) ( CLEAR ?auto_15800 ) ( IS-CRATE ?auto_15801 ) ( AVAILABLE ?auto_15807 ) ( TRUCK-AT ?auto_15805 ?auto_15811 ) ( not ( = ?auto_15811 ?auto_15804 ) ) ( not ( = ?auto_15808 ?auto_15811 ) ) ( HOIST-AT ?auto_15806 ?auto_15811 ) ( not ( = ?auto_15807 ?auto_15806 ) ) ( not ( = ?auto_15803 ?auto_15806 ) ) ( AVAILABLE ?auto_15806 ) ( SURFACE-AT ?auto_15801 ?auto_15811 ) ( ON ?auto_15801 ?auto_15809 ) ( CLEAR ?auto_15801 ) ( not ( = ?auto_15801 ?auto_15809 ) ) ( not ( = ?auto_15802 ?auto_15809 ) ) ( not ( = ?auto_15800 ?auto_15809 ) ) ( not ( = ?auto_15810 ?auto_15809 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15801 ?auto_15802 )
      ( MAKE-2CRATE-VERIFY ?auto_15800 ?auto_15801 ?auto_15802 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15812 - SURFACE
      ?auto_15813 - SURFACE
    )
    :vars
    (
      ?auto_15816 - HOIST
      ?auto_15820 - PLACE
      ?auto_15821 - SURFACE
      ?auto_15814 - PLACE
      ?auto_15823 - HOIST
      ?auto_15822 - SURFACE
      ?auto_15818 - PLACE
      ?auto_15817 - HOIST
      ?auto_15819 - SURFACE
      ?auto_15815 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15816 ?auto_15820 ) ( IS-CRATE ?auto_15813 ) ( not ( = ?auto_15812 ?auto_15813 ) ) ( not ( = ?auto_15821 ?auto_15812 ) ) ( not ( = ?auto_15821 ?auto_15813 ) ) ( not ( = ?auto_15814 ?auto_15820 ) ) ( HOIST-AT ?auto_15823 ?auto_15814 ) ( not ( = ?auto_15816 ?auto_15823 ) ) ( AVAILABLE ?auto_15823 ) ( SURFACE-AT ?auto_15813 ?auto_15814 ) ( ON ?auto_15813 ?auto_15822 ) ( CLEAR ?auto_15813 ) ( not ( = ?auto_15812 ?auto_15822 ) ) ( not ( = ?auto_15813 ?auto_15822 ) ) ( not ( = ?auto_15821 ?auto_15822 ) ) ( SURFACE-AT ?auto_15821 ?auto_15820 ) ( CLEAR ?auto_15821 ) ( IS-CRATE ?auto_15812 ) ( AVAILABLE ?auto_15816 ) ( not ( = ?auto_15818 ?auto_15820 ) ) ( not ( = ?auto_15814 ?auto_15818 ) ) ( HOIST-AT ?auto_15817 ?auto_15818 ) ( not ( = ?auto_15816 ?auto_15817 ) ) ( not ( = ?auto_15823 ?auto_15817 ) ) ( AVAILABLE ?auto_15817 ) ( SURFACE-AT ?auto_15812 ?auto_15818 ) ( ON ?auto_15812 ?auto_15819 ) ( CLEAR ?auto_15812 ) ( not ( = ?auto_15812 ?auto_15819 ) ) ( not ( = ?auto_15813 ?auto_15819 ) ) ( not ( = ?auto_15821 ?auto_15819 ) ) ( not ( = ?auto_15822 ?auto_15819 ) ) ( TRUCK-AT ?auto_15815 ?auto_15820 ) )
    :subtasks
    ( ( !DRIVE ?auto_15815 ?auto_15820 ?auto_15818 )
      ( MAKE-2CRATE ?auto_15821 ?auto_15812 ?auto_15813 )
      ( MAKE-1CRATE-VERIFY ?auto_15812 ?auto_15813 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15824 - SURFACE
      ?auto_15825 - SURFACE
      ?auto_15826 - SURFACE
    )
    :vars
    (
      ?auto_15827 - HOIST
      ?auto_15830 - PLACE
      ?auto_15832 - PLACE
      ?auto_15833 - HOIST
      ?auto_15829 - SURFACE
      ?auto_15828 - PLACE
      ?auto_15834 - HOIST
      ?auto_15835 - SURFACE
      ?auto_15831 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15827 ?auto_15830 ) ( IS-CRATE ?auto_15826 ) ( not ( = ?auto_15825 ?auto_15826 ) ) ( not ( = ?auto_15824 ?auto_15825 ) ) ( not ( = ?auto_15824 ?auto_15826 ) ) ( not ( = ?auto_15832 ?auto_15830 ) ) ( HOIST-AT ?auto_15833 ?auto_15832 ) ( not ( = ?auto_15827 ?auto_15833 ) ) ( AVAILABLE ?auto_15833 ) ( SURFACE-AT ?auto_15826 ?auto_15832 ) ( ON ?auto_15826 ?auto_15829 ) ( CLEAR ?auto_15826 ) ( not ( = ?auto_15825 ?auto_15829 ) ) ( not ( = ?auto_15826 ?auto_15829 ) ) ( not ( = ?auto_15824 ?auto_15829 ) ) ( SURFACE-AT ?auto_15824 ?auto_15830 ) ( CLEAR ?auto_15824 ) ( IS-CRATE ?auto_15825 ) ( AVAILABLE ?auto_15827 ) ( not ( = ?auto_15828 ?auto_15830 ) ) ( not ( = ?auto_15832 ?auto_15828 ) ) ( HOIST-AT ?auto_15834 ?auto_15828 ) ( not ( = ?auto_15827 ?auto_15834 ) ) ( not ( = ?auto_15833 ?auto_15834 ) ) ( AVAILABLE ?auto_15834 ) ( SURFACE-AT ?auto_15825 ?auto_15828 ) ( ON ?auto_15825 ?auto_15835 ) ( CLEAR ?auto_15825 ) ( not ( = ?auto_15825 ?auto_15835 ) ) ( not ( = ?auto_15826 ?auto_15835 ) ) ( not ( = ?auto_15824 ?auto_15835 ) ) ( not ( = ?auto_15829 ?auto_15835 ) ) ( TRUCK-AT ?auto_15831 ?auto_15830 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15825 ?auto_15826 )
      ( MAKE-2CRATE-VERIFY ?auto_15824 ?auto_15825 ?auto_15826 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15845 - SURFACE
      ?auto_15846 - SURFACE
    )
    :vars
    (
      ?auto_15847 - HOIST
      ?auto_15848 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15847 ?auto_15848 ) ( SURFACE-AT ?auto_15845 ?auto_15848 ) ( CLEAR ?auto_15845 ) ( LIFTING ?auto_15847 ?auto_15846 ) ( IS-CRATE ?auto_15846 ) ( not ( = ?auto_15845 ?auto_15846 ) ) )
    :subtasks
    ( ( !DROP ?auto_15847 ?auto_15846 ?auto_15845 ?auto_15848 )
      ( MAKE-1CRATE-VERIFY ?auto_15845 ?auto_15846 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15849 - SURFACE
      ?auto_15850 - SURFACE
      ?auto_15851 - SURFACE
    )
    :vars
    (
      ?auto_15852 - HOIST
      ?auto_15853 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15852 ?auto_15853 ) ( SURFACE-AT ?auto_15850 ?auto_15853 ) ( CLEAR ?auto_15850 ) ( LIFTING ?auto_15852 ?auto_15851 ) ( IS-CRATE ?auto_15851 ) ( not ( = ?auto_15850 ?auto_15851 ) ) ( ON ?auto_15850 ?auto_15849 ) ( not ( = ?auto_15849 ?auto_15850 ) ) ( not ( = ?auto_15849 ?auto_15851 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15850 ?auto_15851 )
      ( MAKE-2CRATE-VERIFY ?auto_15849 ?auto_15850 ?auto_15851 ) )
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
      ?auto_15858 - HOIST
      ?auto_15859 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15858 ?auto_15859 ) ( SURFACE-AT ?auto_15856 ?auto_15859 ) ( CLEAR ?auto_15856 ) ( LIFTING ?auto_15858 ?auto_15857 ) ( IS-CRATE ?auto_15857 ) ( not ( = ?auto_15856 ?auto_15857 ) ) ( ON ?auto_15855 ?auto_15854 ) ( ON ?auto_15856 ?auto_15855 ) ( not ( = ?auto_15854 ?auto_15855 ) ) ( not ( = ?auto_15854 ?auto_15856 ) ) ( not ( = ?auto_15854 ?auto_15857 ) ) ( not ( = ?auto_15855 ?auto_15856 ) ) ( not ( = ?auto_15855 ?auto_15857 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15856 ?auto_15857 )
      ( MAKE-3CRATE-VERIFY ?auto_15854 ?auto_15855 ?auto_15856 ?auto_15857 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15860 - SURFACE
      ?auto_15861 - SURFACE
    )
    :vars
    (
      ?auto_15862 - HOIST
      ?auto_15863 - PLACE
      ?auto_15864 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15862 ?auto_15863 ) ( SURFACE-AT ?auto_15860 ?auto_15863 ) ( CLEAR ?auto_15860 ) ( IS-CRATE ?auto_15861 ) ( not ( = ?auto_15860 ?auto_15861 ) ) ( TRUCK-AT ?auto_15864 ?auto_15863 ) ( AVAILABLE ?auto_15862 ) ( IN ?auto_15861 ?auto_15864 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15862 ?auto_15861 ?auto_15864 ?auto_15863 )
      ( MAKE-1CRATE ?auto_15860 ?auto_15861 )
      ( MAKE-1CRATE-VERIFY ?auto_15860 ?auto_15861 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15865 - SURFACE
      ?auto_15866 - SURFACE
      ?auto_15867 - SURFACE
    )
    :vars
    (
      ?auto_15868 - HOIST
      ?auto_15870 - PLACE
      ?auto_15869 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15868 ?auto_15870 ) ( SURFACE-AT ?auto_15866 ?auto_15870 ) ( CLEAR ?auto_15866 ) ( IS-CRATE ?auto_15867 ) ( not ( = ?auto_15866 ?auto_15867 ) ) ( TRUCK-AT ?auto_15869 ?auto_15870 ) ( AVAILABLE ?auto_15868 ) ( IN ?auto_15867 ?auto_15869 ) ( ON ?auto_15866 ?auto_15865 ) ( not ( = ?auto_15865 ?auto_15866 ) ) ( not ( = ?auto_15865 ?auto_15867 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15866 ?auto_15867 )
      ( MAKE-2CRATE-VERIFY ?auto_15865 ?auto_15866 ?auto_15867 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15871 - SURFACE
      ?auto_15872 - SURFACE
      ?auto_15873 - SURFACE
      ?auto_15874 - SURFACE
    )
    :vars
    (
      ?auto_15875 - HOIST
      ?auto_15876 - PLACE
      ?auto_15877 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15875 ?auto_15876 ) ( SURFACE-AT ?auto_15873 ?auto_15876 ) ( CLEAR ?auto_15873 ) ( IS-CRATE ?auto_15874 ) ( not ( = ?auto_15873 ?auto_15874 ) ) ( TRUCK-AT ?auto_15877 ?auto_15876 ) ( AVAILABLE ?auto_15875 ) ( IN ?auto_15874 ?auto_15877 ) ( ON ?auto_15873 ?auto_15872 ) ( not ( = ?auto_15872 ?auto_15873 ) ) ( not ( = ?auto_15872 ?auto_15874 ) ) ( ON ?auto_15872 ?auto_15871 ) ( not ( = ?auto_15871 ?auto_15872 ) ) ( not ( = ?auto_15871 ?auto_15873 ) ) ( not ( = ?auto_15871 ?auto_15874 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15872 ?auto_15873 ?auto_15874 )
      ( MAKE-3CRATE-VERIFY ?auto_15871 ?auto_15872 ?auto_15873 ?auto_15874 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15878 - SURFACE
      ?auto_15879 - SURFACE
    )
    :vars
    (
      ?auto_15880 - HOIST
      ?auto_15881 - PLACE
      ?auto_15882 - TRUCK
      ?auto_15883 - SURFACE
      ?auto_15884 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15880 ?auto_15881 ) ( SURFACE-AT ?auto_15878 ?auto_15881 ) ( CLEAR ?auto_15878 ) ( IS-CRATE ?auto_15879 ) ( not ( = ?auto_15878 ?auto_15879 ) ) ( AVAILABLE ?auto_15880 ) ( IN ?auto_15879 ?auto_15882 ) ( ON ?auto_15878 ?auto_15883 ) ( not ( = ?auto_15883 ?auto_15878 ) ) ( not ( = ?auto_15883 ?auto_15879 ) ) ( TRUCK-AT ?auto_15882 ?auto_15884 ) ( not ( = ?auto_15884 ?auto_15881 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15882 ?auto_15884 ?auto_15881 )
      ( MAKE-2CRATE ?auto_15883 ?auto_15878 ?auto_15879 )
      ( MAKE-1CRATE-VERIFY ?auto_15878 ?auto_15879 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15885 - SURFACE
      ?auto_15886 - SURFACE
      ?auto_15887 - SURFACE
    )
    :vars
    (
      ?auto_15889 - HOIST
      ?auto_15888 - PLACE
      ?auto_15890 - TRUCK
      ?auto_15891 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15889 ?auto_15888 ) ( SURFACE-AT ?auto_15886 ?auto_15888 ) ( CLEAR ?auto_15886 ) ( IS-CRATE ?auto_15887 ) ( not ( = ?auto_15886 ?auto_15887 ) ) ( AVAILABLE ?auto_15889 ) ( IN ?auto_15887 ?auto_15890 ) ( ON ?auto_15886 ?auto_15885 ) ( not ( = ?auto_15885 ?auto_15886 ) ) ( not ( = ?auto_15885 ?auto_15887 ) ) ( TRUCK-AT ?auto_15890 ?auto_15891 ) ( not ( = ?auto_15891 ?auto_15888 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15886 ?auto_15887 )
      ( MAKE-2CRATE-VERIFY ?auto_15885 ?auto_15886 ?auto_15887 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15892 - SURFACE
      ?auto_15893 - SURFACE
      ?auto_15894 - SURFACE
      ?auto_15895 - SURFACE
    )
    :vars
    (
      ?auto_15899 - HOIST
      ?auto_15896 - PLACE
      ?auto_15898 - TRUCK
      ?auto_15897 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15899 ?auto_15896 ) ( SURFACE-AT ?auto_15894 ?auto_15896 ) ( CLEAR ?auto_15894 ) ( IS-CRATE ?auto_15895 ) ( not ( = ?auto_15894 ?auto_15895 ) ) ( AVAILABLE ?auto_15899 ) ( IN ?auto_15895 ?auto_15898 ) ( ON ?auto_15894 ?auto_15893 ) ( not ( = ?auto_15893 ?auto_15894 ) ) ( not ( = ?auto_15893 ?auto_15895 ) ) ( TRUCK-AT ?auto_15898 ?auto_15897 ) ( not ( = ?auto_15897 ?auto_15896 ) ) ( ON ?auto_15893 ?auto_15892 ) ( not ( = ?auto_15892 ?auto_15893 ) ) ( not ( = ?auto_15892 ?auto_15894 ) ) ( not ( = ?auto_15892 ?auto_15895 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15893 ?auto_15894 ?auto_15895 )
      ( MAKE-3CRATE-VERIFY ?auto_15892 ?auto_15893 ?auto_15894 ?auto_15895 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15900 - SURFACE
      ?auto_15901 - SURFACE
    )
    :vars
    (
      ?auto_15906 - HOIST
      ?auto_15902 - PLACE
      ?auto_15905 - SURFACE
      ?auto_15904 - TRUCK
      ?auto_15903 - PLACE
      ?auto_15907 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15906 ?auto_15902 ) ( SURFACE-AT ?auto_15900 ?auto_15902 ) ( CLEAR ?auto_15900 ) ( IS-CRATE ?auto_15901 ) ( not ( = ?auto_15900 ?auto_15901 ) ) ( AVAILABLE ?auto_15906 ) ( ON ?auto_15900 ?auto_15905 ) ( not ( = ?auto_15905 ?auto_15900 ) ) ( not ( = ?auto_15905 ?auto_15901 ) ) ( TRUCK-AT ?auto_15904 ?auto_15903 ) ( not ( = ?auto_15903 ?auto_15902 ) ) ( HOIST-AT ?auto_15907 ?auto_15903 ) ( LIFTING ?auto_15907 ?auto_15901 ) ( not ( = ?auto_15906 ?auto_15907 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15907 ?auto_15901 ?auto_15904 ?auto_15903 )
      ( MAKE-2CRATE ?auto_15905 ?auto_15900 ?auto_15901 )
      ( MAKE-1CRATE-VERIFY ?auto_15900 ?auto_15901 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15908 - SURFACE
      ?auto_15909 - SURFACE
      ?auto_15910 - SURFACE
    )
    :vars
    (
      ?auto_15913 - HOIST
      ?auto_15914 - PLACE
      ?auto_15911 - TRUCK
      ?auto_15915 - PLACE
      ?auto_15912 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15913 ?auto_15914 ) ( SURFACE-AT ?auto_15909 ?auto_15914 ) ( CLEAR ?auto_15909 ) ( IS-CRATE ?auto_15910 ) ( not ( = ?auto_15909 ?auto_15910 ) ) ( AVAILABLE ?auto_15913 ) ( ON ?auto_15909 ?auto_15908 ) ( not ( = ?auto_15908 ?auto_15909 ) ) ( not ( = ?auto_15908 ?auto_15910 ) ) ( TRUCK-AT ?auto_15911 ?auto_15915 ) ( not ( = ?auto_15915 ?auto_15914 ) ) ( HOIST-AT ?auto_15912 ?auto_15915 ) ( LIFTING ?auto_15912 ?auto_15910 ) ( not ( = ?auto_15913 ?auto_15912 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15909 ?auto_15910 )
      ( MAKE-2CRATE-VERIFY ?auto_15908 ?auto_15909 ?auto_15910 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15916 - SURFACE
      ?auto_15917 - SURFACE
      ?auto_15918 - SURFACE
      ?auto_15919 - SURFACE
    )
    :vars
    (
      ?auto_15922 - HOIST
      ?auto_15920 - PLACE
      ?auto_15921 - TRUCK
      ?auto_15924 - PLACE
      ?auto_15923 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15922 ?auto_15920 ) ( SURFACE-AT ?auto_15918 ?auto_15920 ) ( CLEAR ?auto_15918 ) ( IS-CRATE ?auto_15919 ) ( not ( = ?auto_15918 ?auto_15919 ) ) ( AVAILABLE ?auto_15922 ) ( ON ?auto_15918 ?auto_15917 ) ( not ( = ?auto_15917 ?auto_15918 ) ) ( not ( = ?auto_15917 ?auto_15919 ) ) ( TRUCK-AT ?auto_15921 ?auto_15924 ) ( not ( = ?auto_15924 ?auto_15920 ) ) ( HOIST-AT ?auto_15923 ?auto_15924 ) ( LIFTING ?auto_15923 ?auto_15919 ) ( not ( = ?auto_15922 ?auto_15923 ) ) ( ON ?auto_15917 ?auto_15916 ) ( not ( = ?auto_15916 ?auto_15917 ) ) ( not ( = ?auto_15916 ?auto_15918 ) ) ( not ( = ?auto_15916 ?auto_15919 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15917 ?auto_15918 ?auto_15919 )
      ( MAKE-3CRATE-VERIFY ?auto_15916 ?auto_15917 ?auto_15918 ?auto_15919 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15925 - SURFACE
      ?auto_15926 - SURFACE
    )
    :vars
    (
      ?auto_15929 - HOIST
      ?auto_15927 - PLACE
      ?auto_15930 - SURFACE
      ?auto_15928 - TRUCK
      ?auto_15932 - PLACE
      ?auto_15931 - HOIST
      ?auto_15933 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15929 ?auto_15927 ) ( SURFACE-AT ?auto_15925 ?auto_15927 ) ( CLEAR ?auto_15925 ) ( IS-CRATE ?auto_15926 ) ( not ( = ?auto_15925 ?auto_15926 ) ) ( AVAILABLE ?auto_15929 ) ( ON ?auto_15925 ?auto_15930 ) ( not ( = ?auto_15930 ?auto_15925 ) ) ( not ( = ?auto_15930 ?auto_15926 ) ) ( TRUCK-AT ?auto_15928 ?auto_15932 ) ( not ( = ?auto_15932 ?auto_15927 ) ) ( HOIST-AT ?auto_15931 ?auto_15932 ) ( not ( = ?auto_15929 ?auto_15931 ) ) ( AVAILABLE ?auto_15931 ) ( SURFACE-AT ?auto_15926 ?auto_15932 ) ( ON ?auto_15926 ?auto_15933 ) ( CLEAR ?auto_15926 ) ( not ( = ?auto_15925 ?auto_15933 ) ) ( not ( = ?auto_15926 ?auto_15933 ) ) ( not ( = ?auto_15930 ?auto_15933 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15931 ?auto_15926 ?auto_15933 ?auto_15932 )
      ( MAKE-2CRATE ?auto_15930 ?auto_15925 ?auto_15926 )
      ( MAKE-1CRATE-VERIFY ?auto_15925 ?auto_15926 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15934 - SURFACE
      ?auto_15935 - SURFACE
      ?auto_15936 - SURFACE
    )
    :vars
    (
      ?auto_15942 - HOIST
      ?auto_15940 - PLACE
      ?auto_15941 - TRUCK
      ?auto_15938 - PLACE
      ?auto_15939 - HOIST
      ?auto_15937 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15942 ?auto_15940 ) ( SURFACE-AT ?auto_15935 ?auto_15940 ) ( CLEAR ?auto_15935 ) ( IS-CRATE ?auto_15936 ) ( not ( = ?auto_15935 ?auto_15936 ) ) ( AVAILABLE ?auto_15942 ) ( ON ?auto_15935 ?auto_15934 ) ( not ( = ?auto_15934 ?auto_15935 ) ) ( not ( = ?auto_15934 ?auto_15936 ) ) ( TRUCK-AT ?auto_15941 ?auto_15938 ) ( not ( = ?auto_15938 ?auto_15940 ) ) ( HOIST-AT ?auto_15939 ?auto_15938 ) ( not ( = ?auto_15942 ?auto_15939 ) ) ( AVAILABLE ?auto_15939 ) ( SURFACE-AT ?auto_15936 ?auto_15938 ) ( ON ?auto_15936 ?auto_15937 ) ( CLEAR ?auto_15936 ) ( not ( = ?auto_15935 ?auto_15937 ) ) ( not ( = ?auto_15936 ?auto_15937 ) ) ( not ( = ?auto_15934 ?auto_15937 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15935 ?auto_15936 )
      ( MAKE-2CRATE-VERIFY ?auto_15934 ?auto_15935 ?auto_15936 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15943 - SURFACE
      ?auto_15944 - SURFACE
      ?auto_15945 - SURFACE
      ?auto_15946 - SURFACE
    )
    :vars
    (
      ?auto_15947 - HOIST
      ?auto_15949 - PLACE
      ?auto_15950 - TRUCK
      ?auto_15951 - PLACE
      ?auto_15948 - HOIST
      ?auto_15952 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15947 ?auto_15949 ) ( SURFACE-AT ?auto_15945 ?auto_15949 ) ( CLEAR ?auto_15945 ) ( IS-CRATE ?auto_15946 ) ( not ( = ?auto_15945 ?auto_15946 ) ) ( AVAILABLE ?auto_15947 ) ( ON ?auto_15945 ?auto_15944 ) ( not ( = ?auto_15944 ?auto_15945 ) ) ( not ( = ?auto_15944 ?auto_15946 ) ) ( TRUCK-AT ?auto_15950 ?auto_15951 ) ( not ( = ?auto_15951 ?auto_15949 ) ) ( HOIST-AT ?auto_15948 ?auto_15951 ) ( not ( = ?auto_15947 ?auto_15948 ) ) ( AVAILABLE ?auto_15948 ) ( SURFACE-AT ?auto_15946 ?auto_15951 ) ( ON ?auto_15946 ?auto_15952 ) ( CLEAR ?auto_15946 ) ( not ( = ?auto_15945 ?auto_15952 ) ) ( not ( = ?auto_15946 ?auto_15952 ) ) ( not ( = ?auto_15944 ?auto_15952 ) ) ( ON ?auto_15944 ?auto_15943 ) ( not ( = ?auto_15943 ?auto_15944 ) ) ( not ( = ?auto_15943 ?auto_15945 ) ) ( not ( = ?auto_15943 ?auto_15946 ) ) ( not ( = ?auto_15943 ?auto_15952 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15944 ?auto_15945 ?auto_15946 )
      ( MAKE-3CRATE-VERIFY ?auto_15943 ?auto_15944 ?auto_15945 ?auto_15946 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15953 - SURFACE
      ?auto_15954 - SURFACE
    )
    :vars
    (
      ?auto_15955 - HOIST
      ?auto_15957 - PLACE
      ?auto_15960 - SURFACE
      ?auto_15959 - PLACE
      ?auto_15956 - HOIST
      ?auto_15961 - SURFACE
      ?auto_15958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15955 ?auto_15957 ) ( SURFACE-AT ?auto_15953 ?auto_15957 ) ( CLEAR ?auto_15953 ) ( IS-CRATE ?auto_15954 ) ( not ( = ?auto_15953 ?auto_15954 ) ) ( AVAILABLE ?auto_15955 ) ( ON ?auto_15953 ?auto_15960 ) ( not ( = ?auto_15960 ?auto_15953 ) ) ( not ( = ?auto_15960 ?auto_15954 ) ) ( not ( = ?auto_15959 ?auto_15957 ) ) ( HOIST-AT ?auto_15956 ?auto_15959 ) ( not ( = ?auto_15955 ?auto_15956 ) ) ( AVAILABLE ?auto_15956 ) ( SURFACE-AT ?auto_15954 ?auto_15959 ) ( ON ?auto_15954 ?auto_15961 ) ( CLEAR ?auto_15954 ) ( not ( = ?auto_15953 ?auto_15961 ) ) ( not ( = ?auto_15954 ?auto_15961 ) ) ( not ( = ?auto_15960 ?auto_15961 ) ) ( TRUCK-AT ?auto_15958 ?auto_15957 ) )
    :subtasks
    ( ( !DRIVE ?auto_15958 ?auto_15957 ?auto_15959 )
      ( MAKE-2CRATE ?auto_15960 ?auto_15953 ?auto_15954 )
      ( MAKE-1CRATE-VERIFY ?auto_15953 ?auto_15954 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15962 - SURFACE
      ?auto_15963 - SURFACE
      ?auto_15964 - SURFACE
    )
    :vars
    (
      ?auto_15965 - HOIST
      ?auto_15968 - PLACE
      ?auto_15967 - PLACE
      ?auto_15966 - HOIST
      ?auto_15970 - SURFACE
      ?auto_15969 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15965 ?auto_15968 ) ( SURFACE-AT ?auto_15963 ?auto_15968 ) ( CLEAR ?auto_15963 ) ( IS-CRATE ?auto_15964 ) ( not ( = ?auto_15963 ?auto_15964 ) ) ( AVAILABLE ?auto_15965 ) ( ON ?auto_15963 ?auto_15962 ) ( not ( = ?auto_15962 ?auto_15963 ) ) ( not ( = ?auto_15962 ?auto_15964 ) ) ( not ( = ?auto_15967 ?auto_15968 ) ) ( HOIST-AT ?auto_15966 ?auto_15967 ) ( not ( = ?auto_15965 ?auto_15966 ) ) ( AVAILABLE ?auto_15966 ) ( SURFACE-AT ?auto_15964 ?auto_15967 ) ( ON ?auto_15964 ?auto_15970 ) ( CLEAR ?auto_15964 ) ( not ( = ?auto_15963 ?auto_15970 ) ) ( not ( = ?auto_15964 ?auto_15970 ) ) ( not ( = ?auto_15962 ?auto_15970 ) ) ( TRUCK-AT ?auto_15969 ?auto_15968 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15963 ?auto_15964 )
      ( MAKE-2CRATE-VERIFY ?auto_15962 ?auto_15963 ?auto_15964 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15971 - SURFACE
      ?auto_15972 - SURFACE
      ?auto_15973 - SURFACE
      ?auto_15974 - SURFACE
    )
    :vars
    (
      ?auto_15979 - HOIST
      ?auto_15977 - PLACE
      ?auto_15978 - PLACE
      ?auto_15976 - HOIST
      ?auto_15980 - SURFACE
      ?auto_15975 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15979 ?auto_15977 ) ( SURFACE-AT ?auto_15973 ?auto_15977 ) ( CLEAR ?auto_15973 ) ( IS-CRATE ?auto_15974 ) ( not ( = ?auto_15973 ?auto_15974 ) ) ( AVAILABLE ?auto_15979 ) ( ON ?auto_15973 ?auto_15972 ) ( not ( = ?auto_15972 ?auto_15973 ) ) ( not ( = ?auto_15972 ?auto_15974 ) ) ( not ( = ?auto_15978 ?auto_15977 ) ) ( HOIST-AT ?auto_15976 ?auto_15978 ) ( not ( = ?auto_15979 ?auto_15976 ) ) ( AVAILABLE ?auto_15976 ) ( SURFACE-AT ?auto_15974 ?auto_15978 ) ( ON ?auto_15974 ?auto_15980 ) ( CLEAR ?auto_15974 ) ( not ( = ?auto_15973 ?auto_15980 ) ) ( not ( = ?auto_15974 ?auto_15980 ) ) ( not ( = ?auto_15972 ?auto_15980 ) ) ( TRUCK-AT ?auto_15975 ?auto_15977 ) ( ON ?auto_15972 ?auto_15971 ) ( not ( = ?auto_15971 ?auto_15972 ) ) ( not ( = ?auto_15971 ?auto_15973 ) ) ( not ( = ?auto_15971 ?auto_15974 ) ) ( not ( = ?auto_15971 ?auto_15980 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15972 ?auto_15973 ?auto_15974 )
      ( MAKE-3CRATE-VERIFY ?auto_15971 ?auto_15972 ?auto_15973 ?auto_15974 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15981 - SURFACE
      ?auto_15982 - SURFACE
    )
    :vars
    (
      ?auto_15988 - HOIST
      ?auto_15986 - PLACE
      ?auto_15983 - SURFACE
      ?auto_15987 - PLACE
      ?auto_15985 - HOIST
      ?auto_15989 - SURFACE
      ?auto_15984 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15988 ?auto_15986 ) ( IS-CRATE ?auto_15982 ) ( not ( = ?auto_15981 ?auto_15982 ) ) ( not ( = ?auto_15983 ?auto_15981 ) ) ( not ( = ?auto_15983 ?auto_15982 ) ) ( not ( = ?auto_15987 ?auto_15986 ) ) ( HOIST-AT ?auto_15985 ?auto_15987 ) ( not ( = ?auto_15988 ?auto_15985 ) ) ( AVAILABLE ?auto_15985 ) ( SURFACE-AT ?auto_15982 ?auto_15987 ) ( ON ?auto_15982 ?auto_15989 ) ( CLEAR ?auto_15982 ) ( not ( = ?auto_15981 ?auto_15989 ) ) ( not ( = ?auto_15982 ?auto_15989 ) ) ( not ( = ?auto_15983 ?auto_15989 ) ) ( TRUCK-AT ?auto_15984 ?auto_15986 ) ( SURFACE-AT ?auto_15983 ?auto_15986 ) ( CLEAR ?auto_15983 ) ( LIFTING ?auto_15988 ?auto_15981 ) ( IS-CRATE ?auto_15981 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15983 ?auto_15981 )
      ( MAKE-2CRATE ?auto_15983 ?auto_15981 ?auto_15982 )
      ( MAKE-1CRATE-VERIFY ?auto_15981 ?auto_15982 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15990 - SURFACE
      ?auto_15991 - SURFACE
      ?auto_15992 - SURFACE
    )
    :vars
    (
      ?auto_15997 - HOIST
      ?auto_15995 - PLACE
      ?auto_15996 - PLACE
      ?auto_15993 - HOIST
      ?auto_15998 - SURFACE
      ?auto_15994 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15997 ?auto_15995 ) ( IS-CRATE ?auto_15992 ) ( not ( = ?auto_15991 ?auto_15992 ) ) ( not ( = ?auto_15990 ?auto_15991 ) ) ( not ( = ?auto_15990 ?auto_15992 ) ) ( not ( = ?auto_15996 ?auto_15995 ) ) ( HOIST-AT ?auto_15993 ?auto_15996 ) ( not ( = ?auto_15997 ?auto_15993 ) ) ( AVAILABLE ?auto_15993 ) ( SURFACE-AT ?auto_15992 ?auto_15996 ) ( ON ?auto_15992 ?auto_15998 ) ( CLEAR ?auto_15992 ) ( not ( = ?auto_15991 ?auto_15998 ) ) ( not ( = ?auto_15992 ?auto_15998 ) ) ( not ( = ?auto_15990 ?auto_15998 ) ) ( TRUCK-AT ?auto_15994 ?auto_15995 ) ( SURFACE-AT ?auto_15990 ?auto_15995 ) ( CLEAR ?auto_15990 ) ( LIFTING ?auto_15997 ?auto_15991 ) ( IS-CRATE ?auto_15991 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15991 ?auto_15992 )
      ( MAKE-2CRATE-VERIFY ?auto_15990 ?auto_15991 ?auto_15992 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15999 - SURFACE
      ?auto_16000 - SURFACE
      ?auto_16001 - SURFACE
      ?auto_16002 - SURFACE
    )
    :vars
    (
      ?auto_16008 - HOIST
      ?auto_16006 - PLACE
      ?auto_16007 - PLACE
      ?auto_16003 - HOIST
      ?auto_16005 - SURFACE
      ?auto_16004 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16008 ?auto_16006 ) ( IS-CRATE ?auto_16002 ) ( not ( = ?auto_16001 ?auto_16002 ) ) ( not ( = ?auto_16000 ?auto_16001 ) ) ( not ( = ?auto_16000 ?auto_16002 ) ) ( not ( = ?auto_16007 ?auto_16006 ) ) ( HOIST-AT ?auto_16003 ?auto_16007 ) ( not ( = ?auto_16008 ?auto_16003 ) ) ( AVAILABLE ?auto_16003 ) ( SURFACE-AT ?auto_16002 ?auto_16007 ) ( ON ?auto_16002 ?auto_16005 ) ( CLEAR ?auto_16002 ) ( not ( = ?auto_16001 ?auto_16005 ) ) ( not ( = ?auto_16002 ?auto_16005 ) ) ( not ( = ?auto_16000 ?auto_16005 ) ) ( TRUCK-AT ?auto_16004 ?auto_16006 ) ( SURFACE-AT ?auto_16000 ?auto_16006 ) ( CLEAR ?auto_16000 ) ( LIFTING ?auto_16008 ?auto_16001 ) ( IS-CRATE ?auto_16001 ) ( ON ?auto_16000 ?auto_15999 ) ( not ( = ?auto_15999 ?auto_16000 ) ) ( not ( = ?auto_15999 ?auto_16001 ) ) ( not ( = ?auto_15999 ?auto_16002 ) ) ( not ( = ?auto_15999 ?auto_16005 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16000 ?auto_16001 ?auto_16002 )
      ( MAKE-3CRATE-VERIFY ?auto_15999 ?auto_16000 ?auto_16001 ?auto_16002 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16009 - SURFACE
      ?auto_16010 - SURFACE
    )
    :vars
    (
      ?auto_16017 - HOIST
      ?auto_16014 - PLACE
      ?auto_16016 - SURFACE
      ?auto_16015 - PLACE
      ?auto_16011 - HOIST
      ?auto_16013 - SURFACE
      ?auto_16012 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16017 ?auto_16014 ) ( IS-CRATE ?auto_16010 ) ( not ( = ?auto_16009 ?auto_16010 ) ) ( not ( = ?auto_16016 ?auto_16009 ) ) ( not ( = ?auto_16016 ?auto_16010 ) ) ( not ( = ?auto_16015 ?auto_16014 ) ) ( HOIST-AT ?auto_16011 ?auto_16015 ) ( not ( = ?auto_16017 ?auto_16011 ) ) ( AVAILABLE ?auto_16011 ) ( SURFACE-AT ?auto_16010 ?auto_16015 ) ( ON ?auto_16010 ?auto_16013 ) ( CLEAR ?auto_16010 ) ( not ( = ?auto_16009 ?auto_16013 ) ) ( not ( = ?auto_16010 ?auto_16013 ) ) ( not ( = ?auto_16016 ?auto_16013 ) ) ( TRUCK-AT ?auto_16012 ?auto_16014 ) ( SURFACE-AT ?auto_16016 ?auto_16014 ) ( CLEAR ?auto_16016 ) ( IS-CRATE ?auto_16009 ) ( AVAILABLE ?auto_16017 ) ( IN ?auto_16009 ?auto_16012 ) )
    :subtasks
    ( ( !UNLOAD ?auto_16017 ?auto_16009 ?auto_16012 ?auto_16014 )
      ( MAKE-2CRATE ?auto_16016 ?auto_16009 ?auto_16010 )
      ( MAKE-1CRATE-VERIFY ?auto_16009 ?auto_16010 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16018 - SURFACE
      ?auto_16019 - SURFACE
      ?auto_16020 - SURFACE
    )
    :vars
    (
      ?auto_16024 - HOIST
      ?auto_16021 - PLACE
      ?auto_16025 - PLACE
      ?auto_16023 - HOIST
      ?auto_16026 - SURFACE
      ?auto_16022 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16024 ?auto_16021 ) ( IS-CRATE ?auto_16020 ) ( not ( = ?auto_16019 ?auto_16020 ) ) ( not ( = ?auto_16018 ?auto_16019 ) ) ( not ( = ?auto_16018 ?auto_16020 ) ) ( not ( = ?auto_16025 ?auto_16021 ) ) ( HOIST-AT ?auto_16023 ?auto_16025 ) ( not ( = ?auto_16024 ?auto_16023 ) ) ( AVAILABLE ?auto_16023 ) ( SURFACE-AT ?auto_16020 ?auto_16025 ) ( ON ?auto_16020 ?auto_16026 ) ( CLEAR ?auto_16020 ) ( not ( = ?auto_16019 ?auto_16026 ) ) ( not ( = ?auto_16020 ?auto_16026 ) ) ( not ( = ?auto_16018 ?auto_16026 ) ) ( TRUCK-AT ?auto_16022 ?auto_16021 ) ( SURFACE-AT ?auto_16018 ?auto_16021 ) ( CLEAR ?auto_16018 ) ( IS-CRATE ?auto_16019 ) ( AVAILABLE ?auto_16024 ) ( IN ?auto_16019 ?auto_16022 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16019 ?auto_16020 )
      ( MAKE-2CRATE-VERIFY ?auto_16018 ?auto_16019 ?auto_16020 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16027 - SURFACE
      ?auto_16028 - SURFACE
      ?auto_16029 - SURFACE
      ?auto_16030 - SURFACE
    )
    :vars
    (
      ?auto_16035 - HOIST
      ?auto_16036 - PLACE
      ?auto_16034 - PLACE
      ?auto_16031 - HOIST
      ?auto_16033 - SURFACE
      ?auto_16032 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16035 ?auto_16036 ) ( IS-CRATE ?auto_16030 ) ( not ( = ?auto_16029 ?auto_16030 ) ) ( not ( = ?auto_16028 ?auto_16029 ) ) ( not ( = ?auto_16028 ?auto_16030 ) ) ( not ( = ?auto_16034 ?auto_16036 ) ) ( HOIST-AT ?auto_16031 ?auto_16034 ) ( not ( = ?auto_16035 ?auto_16031 ) ) ( AVAILABLE ?auto_16031 ) ( SURFACE-AT ?auto_16030 ?auto_16034 ) ( ON ?auto_16030 ?auto_16033 ) ( CLEAR ?auto_16030 ) ( not ( = ?auto_16029 ?auto_16033 ) ) ( not ( = ?auto_16030 ?auto_16033 ) ) ( not ( = ?auto_16028 ?auto_16033 ) ) ( TRUCK-AT ?auto_16032 ?auto_16036 ) ( SURFACE-AT ?auto_16028 ?auto_16036 ) ( CLEAR ?auto_16028 ) ( IS-CRATE ?auto_16029 ) ( AVAILABLE ?auto_16035 ) ( IN ?auto_16029 ?auto_16032 ) ( ON ?auto_16028 ?auto_16027 ) ( not ( = ?auto_16027 ?auto_16028 ) ) ( not ( = ?auto_16027 ?auto_16029 ) ) ( not ( = ?auto_16027 ?auto_16030 ) ) ( not ( = ?auto_16027 ?auto_16033 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16028 ?auto_16029 ?auto_16030 )
      ( MAKE-3CRATE-VERIFY ?auto_16027 ?auto_16028 ?auto_16029 ?auto_16030 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16037 - SURFACE
      ?auto_16038 - SURFACE
    )
    :vars
    (
      ?auto_16043 - HOIST
      ?auto_16045 - PLACE
      ?auto_16044 - SURFACE
      ?auto_16042 - PLACE
      ?auto_16039 - HOIST
      ?auto_16041 - SURFACE
      ?auto_16040 - TRUCK
      ?auto_16046 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16043 ?auto_16045 ) ( IS-CRATE ?auto_16038 ) ( not ( = ?auto_16037 ?auto_16038 ) ) ( not ( = ?auto_16044 ?auto_16037 ) ) ( not ( = ?auto_16044 ?auto_16038 ) ) ( not ( = ?auto_16042 ?auto_16045 ) ) ( HOIST-AT ?auto_16039 ?auto_16042 ) ( not ( = ?auto_16043 ?auto_16039 ) ) ( AVAILABLE ?auto_16039 ) ( SURFACE-AT ?auto_16038 ?auto_16042 ) ( ON ?auto_16038 ?auto_16041 ) ( CLEAR ?auto_16038 ) ( not ( = ?auto_16037 ?auto_16041 ) ) ( not ( = ?auto_16038 ?auto_16041 ) ) ( not ( = ?auto_16044 ?auto_16041 ) ) ( SURFACE-AT ?auto_16044 ?auto_16045 ) ( CLEAR ?auto_16044 ) ( IS-CRATE ?auto_16037 ) ( AVAILABLE ?auto_16043 ) ( IN ?auto_16037 ?auto_16040 ) ( TRUCK-AT ?auto_16040 ?auto_16046 ) ( not ( = ?auto_16046 ?auto_16045 ) ) ( not ( = ?auto_16042 ?auto_16046 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16040 ?auto_16046 ?auto_16045 )
      ( MAKE-2CRATE ?auto_16044 ?auto_16037 ?auto_16038 )
      ( MAKE-1CRATE-VERIFY ?auto_16037 ?auto_16038 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16047 - SURFACE
      ?auto_16048 - SURFACE
      ?auto_16049 - SURFACE
    )
    :vars
    (
      ?auto_16054 - HOIST
      ?auto_16050 - PLACE
      ?auto_16052 - PLACE
      ?auto_16056 - HOIST
      ?auto_16053 - SURFACE
      ?auto_16055 - TRUCK
      ?auto_16051 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16054 ?auto_16050 ) ( IS-CRATE ?auto_16049 ) ( not ( = ?auto_16048 ?auto_16049 ) ) ( not ( = ?auto_16047 ?auto_16048 ) ) ( not ( = ?auto_16047 ?auto_16049 ) ) ( not ( = ?auto_16052 ?auto_16050 ) ) ( HOIST-AT ?auto_16056 ?auto_16052 ) ( not ( = ?auto_16054 ?auto_16056 ) ) ( AVAILABLE ?auto_16056 ) ( SURFACE-AT ?auto_16049 ?auto_16052 ) ( ON ?auto_16049 ?auto_16053 ) ( CLEAR ?auto_16049 ) ( not ( = ?auto_16048 ?auto_16053 ) ) ( not ( = ?auto_16049 ?auto_16053 ) ) ( not ( = ?auto_16047 ?auto_16053 ) ) ( SURFACE-AT ?auto_16047 ?auto_16050 ) ( CLEAR ?auto_16047 ) ( IS-CRATE ?auto_16048 ) ( AVAILABLE ?auto_16054 ) ( IN ?auto_16048 ?auto_16055 ) ( TRUCK-AT ?auto_16055 ?auto_16051 ) ( not ( = ?auto_16051 ?auto_16050 ) ) ( not ( = ?auto_16052 ?auto_16051 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16048 ?auto_16049 )
      ( MAKE-2CRATE-VERIFY ?auto_16047 ?auto_16048 ?auto_16049 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16057 - SURFACE
      ?auto_16058 - SURFACE
      ?auto_16059 - SURFACE
      ?auto_16060 - SURFACE
    )
    :vars
    (
      ?auto_16067 - HOIST
      ?auto_16066 - PLACE
      ?auto_16065 - PLACE
      ?auto_16062 - HOIST
      ?auto_16061 - SURFACE
      ?auto_16064 - TRUCK
      ?auto_16063 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16067 ?auto_16066 ) ( IS-CRATE ?auto_16060 ) ( not ( = ?auto_16059 ?auto_16060 ) ) ( not ( = ?auto_16058 ?auto_16059 ) ) ( not ( = ?auto_16058 ?auto_16060 ) ) ( not ( = ?auto_16065 ?auto_16066 ) ) ( HOIST-AT ?auto_16062 ?auto_16065 ) ( not ( = ?auto_16067 ?auto_16062 ) ) ( AVAILABLE ?auto_16062 ) ( SURFACE-AT ?auto_16060 ?auto_16065 ) ( ON ?auto_16060 ?auto_16061 ) ( CLEAR ?auto_16060 ) ( not ( = ?auto_16059 ?auto_16061 ) ) ( not ( = ?auto_16060 ?auto_16061 ) ) ( not ( = ?auto_16058 ?auto_16061 ) ) ( SURFACE-AT ?auto_16058 ?auto_16066 ) ( CLEAR ?auto_16058 ) ( IS-CRATE ?auto_16059 ) ( AVAILABLE ?auto_16067 ) ( IN ?auto_16059 ?auto_16064 ) ( TRUCK-AT ?auto_16064 ?auto_16063 ) ( not ( = ?auto_16063 ?auto_16066 ) ) ( not ( = ?auto_16065 ?auto_16063 ) ) ( ON ?auto_16058 ?auto_16057 ) ( not ( = ?auto_16057 ?auto_16058 ) ) ( not ( = ?auto_16057 ?auto_16059 ) ) ( not ( = ?auto_16057 ?auto_16060 ) ) ( not ( = ?auto_16057 ?auto_16061 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16058 ?auto_16059 ?auto_16060 )
      ( MAKE-3CRATE-VERIFY ?auto_16057 ?auto_16058 ?auto_16059 ?auto_16060 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16068 - SURFACE
      ?auto_16069 - SURFACE
    )
    :vars
    (
      ?auto_16077 - HOIST
      ?auto_16075 - PLACE
      ?auto_16076 - SURFACE
      ?auto_16074 - PLACE
      ?auto_16071 - HOIST
      ?auto_16070 - SURFACE
      ?auto_16073 - TRUCK
      ?auto_16072 - PLACE
      ?auto_16078 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16077 ?auto_16075 ) ( IS-CRATE ?auto_16069 ) ( not ( = ?auto_16068 ?auto_16069 ) ) ( not ( = ?auto_16076 ?auto_16068 ) ) ( not ( = ?auto_16076 ?auto_16069 ) ) ( not ( = ?auto_16074 ?auto_16075 ) ) ( HOIST-AT ?auto_16071 ?auto_16074 ) ( not ( = ?auto_16077 ?auto_16071 ) ) ( AVAILABLE ?auto_16071 ) ( SURFACE-AT ?auto_16069 ?auto_16074 ) ( ON ?auto_16069 ?auto_16070 ) ( CLEAR ?auto_16069 ) ( not ( = ?auto_16068 ?auto_16070 ) ) ( not ( = ?auto_16069 ?auto_16070 ) ) ( not ( = ?auto_16076 ?auto_16070 ) ) ( SURFACE-AT ?auto_16076 ?auto_16075 ) ( CLEAR ?auto_16076 ) ( IS-CRATE ?auto_16068 ) ( AVAILABLE ?auto_16077 ) ( TRUCK-AT ?auto_16073 ?auto_16072 ) ( not ( = ?auto_16072 ?auto_16075 ) ) ( not ( = ?auto_16074 ?auto_16072 ) ) ( HOIST-AT ?auto_16078 ?auto_16072 ) ( LIFTING ?auto_16078 ?auto_16068 ) ( not ( = ?auto_16077 ?auto_16078 ) ) ( not ( = ?auto_16071 ?auto_16078 ) ) )
    :subtasks
    ( ( !LOAD ?auto_16078 ?auto_16068 ?auto_16073 ?auto_16072 )
      ( MAKE-2CRATE ?auto_16076 ?auto_16068 ?auto_16069 )
      ( MAKE-1CRATE-VERIFY ?auto_16068 ?auto_16069 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16079 - SURFACE
      ?auto_16080 - SURFACE
      ?auto_16081 - SURFACE
    )
    :vars
    (
      ?auto_16084 - HOIST
      ?auto_16089 - PLACE
      ?auto_16088 - PLACE
      ?auto_16087 - HOIST
      ?auto_16085 - SURFACE
      ?auto_16083 - TRUCK
      ?auto_16086 - PLACE
      ?auto_16082 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16084 ?auto_16089 ) ( IS-CRATE ?auto_16081 ) ( not ( = ?auto_16080 ?auto_16081 ) ) ( not ( = ?auto_16079 ?auto_16080 ) ) ( not ( = ?auto_16079 ?auto_16081 ) ) ( not ( = ?auto_16088 ?auto_16089 ) ) ( HOIST-AT ?auto_16087 ?auto_16088 ) ( not ( = ?auto_16084 ?auto_16087 ) ) ( AVAILABLE ?auto_16087 ) ( SURFACE-AT ?auto_16081 ?auto_16088 ) ( ON ?auto_16081 ?auto_16085 ) ( CLEAR ?auto_16081 ) ( not ( = ?auto_16080 ?auto_16085 ) ) ( not ( = ?auto_16081 ?auto_16085 ) ) ( not ( = ?auto_16079 ?auto_16085 ) ) ( SURFACE-AT ?auto_16079 ?auto_16089 ) ( CLEAR ?auto_16079 ) ( IS-CRATE ?auto_16080 ) ( AVAILABLE ?auto_16084 ) ( TRUCK-AT ?auto_16083 ?auto_16086 ) ( not ( = ?auto_16086 ?auto_16089 ) ) ( not ( = ?auto_16088 ?auto_16086 ) ) ( HOIST-AT ?auto_16082 ?auto_16086 ) ( LIFTING ?auto_16082 ?auto_16080 ) ( not ( = ?auto_16084 ?auto_16082 ) ) ( not ( = ?auto_16087 ?auto_16082 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16080 ?auto_16081 )
      ( MAKE-2CRATE-VERIFY ?auto_16079 ?auto_16080 ?auto_16081 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16090 - SURFACE
      ?auto_16091 - SURFACE
      ?auto_16092 - SURFACE
      ?auto_16093 - SURFACE
    )
    :vars
    (
      ?auto_16095 - HOIST
      ?auto_16099 - PLACE
      ?auto_16094 - PLACE
      ?auto_16101 - HOIST
      ?auto_16098 - SURFACE
      ?auto_16096 - TRUCK
      ?auto_16097 - PLACE
      ?auto_16100 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16095 ?auto_16099 ) ( IS-CRATE ?auto_16093 ) ( not ( = ?auto_16092 ?auto_16093 ) ) ( not ( = ?auto_16091 ?auto_16092 ) ) ( not ( = ?auto_16091 ?auto_16093 ) ) ( not ( = ?auto_16094 ?auto_16099 ) ) ( HOIST-AT ?auto_16101 ?auto_16094 ) ( not ( = ?auto_16095 ?auto_16101 ) ) ( AVAILABLE ?auto_16101 ) ( SURFACE-AT ?auto_16093 ?auto_16094 ) ( ON ?auto_16093 ?auto_16098 ) ( CLEAR ?auto_16093 ) ( not ( = ?auto_16092 ?auto_16098 ) ) ( not ( = ?auto_16093 ?auto_16098 ) ) ( not ( = ?auto_16091 ?auto_16098 ) ) ( SURFACE-AT ?auto_16091 ?auto_16099 ) ( CLEAR ?auto_16091 ) ( IS-CRATE ?auto_16092 ) ( AVAILABLE ?auto_16095 ) ( TRUCK-AT ?auto_16096 ?auto_16097 ) ( not ( = ?auto_16097 ?auto_16099 ) ) ( not ( = ?auto_16094 ?auto_16097 ) ) ( HOIST-AT ?auto_16100 ?auto_16097 ) ( LIFTING ?auto_16100 ?auto_16092 ) ( not ( = ?auto_16095 ?auto_16100 ) ) ( not ( = ?auto_16101 ?auto_16100 ) ) ( ON ?auto_16091 ?auto_16090 ) ( not ( = ?auto_16090 ?auto_16091 ) ) ( not ( = ?auto_16090 ?auto_16092 ) ) ( not ( = ?auto_16090 ?auto_16093 ) ) ( not ( = ?auto_16090 ?auto_16098 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16091 ?auto_16092 ?auto_16093 )
      ( MAKE-3CRATE-VERIFY ?auto_16090 ?auto_16091 ?auto_16092 ?auto_16093 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16102 - SURFACE
      ?auto_16103 - SURFACE
    )
    :vars
    (
      ?auto_16106 - HOIST
      ?auto_16110 - PLACE
      ?auto_16104 - SURFACE
      ?auto_16105 - PLACE
      ?auto_16112 - HOIST
      ?auto_16109 - SURFACE
      ?auto_16107 - TRUCK
      ?auto_16108 - PLACE
      ?auto_16111 - HOIST
      ?auto_16113 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16106 ?auto_16110 ) ( IS-CRATE ?auto_16103 ) ( not ( = ?auto_16102 ?auto_16103 ) ) ( not ( = ?auto_16104 ?auto_16102 ) ) ( not ( = ?auto_16104 ?auto_16103 ) ) ( not ( = ?auto_16105 ?auto_16110 ) ) ( HOIST-AT ?auto_16112 ?auto_16105 ) ( not ( = ?auto_16106 ?auto_16112 ) ) ( AVAILABLE ?auto_16112 ) ( SURFACE-AT ?auto_16103 ?auto_16105 ) ( ON ?auto_16103 ?auto_16109 ) ( CLEAR ?auto_16103 ) ( not ( = ?auto_16102 ?auto_16109 ) ) ( not ( = ?auto_16103 ?auto_16109 ) ) ( not ( = ?auto_16104 ?auto_16109 ) ) ( SURFACE-AT ?auto_16104 ?auto_16110 ) ( CLEAR ?auto_16104 ) ( IS-CRATE ?auto_16102 ) ( AVAILABLE ?auto_16106 ) ( TRUCK-AT ?auto_16107 ?auto_16108 ) ( not ( = ?auto_16108 ?auto_16110 ) ) ( not ( = ?auto_16105 ?auto_16108 ) ) ( HOIST-AT ?auto_16111 ?auto_16108 ) ( not ( = ?auto_16106 ?auto_16111 ) ) ( not ( = ?auto_16112 ?auto_16111 ) ) ( AVAILABLE ?auto_16111 ) ( SURFACE-AT ?auto_16102 ?auto_16108 ) ( ON ?auto_16102 ?auto_16113 ) ( CLEAR ?auto_16102 ) ( not ( = ?auto_16102 ?auto_16113 ) ) ( not ( = ?auto_16103 ?auto_16113 ) ) ( not ( = ?auto_16104 ?auto_16113 ) ) ( not ( = ?auto_16109 ?auto_16113 ) ) )
    :subtasks
    ( ( !LIFT ?auto_16111 ?auto_16102 ?auto_16113 ?auto_16108 )
      ( MAKE-2CRATE ?auto_16104 ?auto_16102 ?auto_16103 )
      ( MAKE-1CRATE-VERIFY ?auto_16102 ?auto_16103 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16114 - SURFACE
      ?auto_16115 - SURFACE
      ?auto_16116 - SURFACE
    )
    :vars
    (
      ?auto_16118 - HOIST
      ?auto_16124 - PLACE
      ?auto_16125 - PLACE
      ?auto_16119 - HOIST
      ?auto_16122 - SURFACE
      ?auto_16117 - TRUCK
      ?auto_16123 - PLACE
      ?auto_16120 - HOIST
      ?auto_16121 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16118 ?auto_16124 ) ( IS-CRATE ?auto_16116 ) ( not ( = ?auto_16115 ?auto_16116 ) ) ( not ( = ?auto_16114 ?auto_16115 ) ) ( not ( = ?auto_16114 ?auto_16116 ) ) ( not ( = ?auto_16125 ?auto_16124 ) ) ( HOIST-AT ?auto_16119 ?auto_16125 ) ( not ( = ?auto_16118 ?auto_16119 ) ) ( AVAILABLE ?auto_16119 ) ( SURFACE-AT ?auto_16116 ?auto_16125 ) ( ON ?auto_16116 ?auto_16122 ) ( CLEAR ?auto_16116 ) ( not ( = ?auto_16115 ?auto_16122 ) ) ( not ( = ?auto_16116 ?auto_16122 ) ) ( not ( = ?auto_16114 ?auto_16122 ) ) ( SURFACE-AT ?auto_16114 ?auto_16124 ) ( CLEAR ?auto_16114 ) ( IS-CRATE ?auto_16115 ) ( AVAILABLE ?auto_16118 ) ( TRUCK-AT ?auto_16117 ?auto_16123 ) ( not ( = ?auto_16123 ?auto_16124 ) ) ( not ( = ?auto_16125 ?auto_16123 ) ) ( HOIST-AT ?auto_16120 ?auto_16123 ) ( not ( = ?auto_16118 ?auto_16120 ) ) ( not ( = ?auto_16119 ?auto_16120 ) ) ( AVAILABLE ?auto_16120 ) ( SURFACE-AT ?auto_16115 ?auto_16123 ) ( ON ?auto_16115 ?auto_16121 ) ( CLEAR ?auto_16115 ) ( not ( = ?auto_16115 ?auto_16121 ) ) ( not ( = ?auto_16116 ?auto_16121 ) ) ( not ( = ?auto_16114 ?auto_16121 ) ) ( not ( = ?auto_16122 ?auto_16121 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16115 ?auto_16116 )
      ( MAKE-2CRATE-VERIFY ?auto_16114 ?auto_16115 ?auto_16116 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16126 - SURFACE
      ?auto_16127 - SURFACE
      ?auto_16128 - SURFACE
      ?auto_16129 - SURFACE
    )
    :vars
    (
      ?auto_16136 - HOIST
      ?auto_16135 - PLACE
      ?auto_16130 - PLACE
      ?auto_16138 - HOIST
      ?auto_16134 - SURFACE
      ?auto_16133 - TRUCK
      ?auto_16137 - PLACE
      ?auto_16131 - HOIST
      ?auto_16132 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16136 ?auto_16135 ) ( IS-CRATE ?auto_16129 ) ( not ( = ?auto_16128 ?auto_16129 ) ) ( not ( = ?auto_16127 ?auto_16128 ) ) ( not ( = ?auto_16127 ?auto_16129 ) ) ( not ( = ?auto_16130 ?auto_16135 ) ) ( HOIST-AT ?auto_16138 ?auto_16130 ) ( not ( = ?auto_16136 ?auto_16138 ) ) ( AVAILABLE ?auto_16138 ) ( SURFACE-AT ?auto_16129 ?auto_16130 ) ( ON ?auto_16129 ?auto_16134 ) ( CLEAR ?auto_16129 ) ( not ( = ?auto_16128 ?auto_16134 ) ) ( not ( = ?auto_16129 ?auto_16134 ) ) ( not ( = ?auto_16127 ?auto_16134 ) ) ( SURFACE-AT ?auto_16127 ?auto_16135 ) ( CLEAR ?auto_16127 ) ( IS-CRATE ?auto_16128 ) ( AVAILABLE ?auto_16136 ) ( TRUCK-AT ?auto_16133 ?auto_16137 ) ( not ( = ?auto_16137 ?auto_16135 ) ) ( not ( = ?auto_16130 ?auto_16137 ) ) ( HOIST-AT ?auto_16131 ?auto_16137 ) ( not ( = ?auto_16136 ?auto_16131 ) ) ( not ( = ?auto_16138 ?auto_16131 ) ) ( AVAILABLE ?auto_16131 ) ( SURFACE-AT ?auto_16128 ?auto_16137 ) ( ON ?auto_16128 ?auto_16132 ) ( CLEAR ?auto_16128 ) ( not ( = ?auto_16128 ?auto_16132 ) ) ( not ( = ?auto_16129 ?auto_16132 ) ) ( not ( = ?auto_16127 ?auto_16132 ) ) ( not ( = ?auto_16134 ?auto_16132 ) ) ( ON ?auto_16127 ?auto_16126 ) ( not ( = ?auto_16126 ?auto_16127 ) ) ( not ( = ?auto_16126 ?auto_16128 ) ) ( not ( = ?auto_16126 ?auto_16129 ) ) ( not ( = ?auto_16126 ?auto_16134 ) ) ( not ( = ?auto_16126 ?auto_16132 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16127 ?auto_16128 ?auto_16129 )
      ( MAKE-3CRATE-VERIFY ?auto_16126 ?auto_16127 ?auto_16128 ?auto_16129 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16139 - SURFACE
      ?auto_16140 - SURFACE
    )
    :vars
    (
      ?auto_16148 - HOIST
      ?auto_16147 - PLACE
      ?auto_16143 - SURFACE
      ?auto_16141 - PLACE
      ?auto_16150 - HOIST
      ?auto_16146 - SURFACE
      ?auto_16149 - PLACE
      ?auto_16142 - HOIST
      ?auto_16144 - SURFACE
      ?auto_16145 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16148 ?auto_16147 ) ( IS-CRATE ?auto_16140 ) ( not ( = ?auto_16139 ?auto_16140 ) ) ( not ( = ?auto_16143 ?auto_16139 ) ) ( not ( = ?auto_16143 ?auto_16140 ) ) ( not ( = ?auto_16141 ?auto_16147 ) ) ( HOIST-AT ?auto_16150 ?auto_16141 ) ( not ( = ?auto_16148 ?auto_16150 ) ) ( AVAILABLE ?auto_16150 ) ( SURFACE-AT ?auto_16140 ?auto_16141 ) ( ON ?auto_16140 ?auto_16146 ) ( CLEAR ?auto_16140 ) ( not ( = ?auto_16139 ?auto_16146 ) ) ( not ( = ?auto_16140 ?auto_16146 ) ) ( not ( = ?auto_16143 ?auto_16146 ) ) ( SURFACE-AT ?auto_16143 ?auto_16147 ) ( CLEAR ?auto_16143 ) ( IS-CRATE ?auto_16139 ) ( AVAILABLE ?auto_16148 ) ( not ( = ?auto_16149 ?auto_16147 ) ) ( not ( = ?auto_16141 ?auto_16149 ) ) ( HOIST-AT ?auto_16142 ?auto_16149 ) ( not ( = ?auto_16148 ?auto_16142 ) ) ( not ( = ?auto_16150 ?auto_16142 ) ) ( AVAILABLE ?auto_16142 ) ( SURFACE-AT ?auto_16139 ?auto_16149 ) ( ON ?auto_16139 ?auto_16144 ) ( CLEAR ?auto_16139 ) ( not ( = ?auto_16139 ?auto_16144 ) ) ( not ( = ?auto_16140 ?auto_16144 ) ) ( not ( = ?auto_16143 ?auto_16144 ) ) ( not ( = ?auto_16146 ?auto_16144 ) ) ( TRUCK-AT ?auto_16145 ?auto_16147 ) )
    :subtasks
    ( ( !DRIVE ?auto_16145 ?auto_16147 ?auto_16149 )
      ( MAKE-2CRATE ?auto_16143 ?auto_16139 ?auto_16140 )
      ( MAKE-1CRATE-VERIFY ?auto_16139 ?auto_16140 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16151 - SURFACE
      ?auto_16152 - SURFACE
      ?auto_16153 - SURFACE
    )
    :vars
    (
      ?auto_16154 - HOIST
      ?auto_16159 - PLACE
      ?auto_16158 - PLACE
      ?auto_16156 - HOIST
      ?auto_16161 - SURFACE
      ?auto_16160 - PLACE
      ?auto_16162 - HOIST
      ?auto_16155 - SURFACE
      ?auto_16157 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16154 ?auto_16159 ) ( IS-CRATE ?auto_16153 ) ( not ( = ?auto_16152 ?auto_16153 ) ) ( not ( = ?auto_16151 ?auto_16152 ) ) ( not ( = ?auto_16151 ?auto_16153 ) ) ( not ( = ?auto_16158 ?auto_16159 ) ) ( HOIST-AT ?auto_16156 ?auto_16158 ) ( not ( = ?auto_16154 ?auto_16156 ) ) ( AVAILABLE ?auto_16156 ) ( SURFACE-AT ?auto_16153 ?auto_16158 ) ( ON ?auto_16153 ?auto_16161 ) ( CLEAR ?auto_16153 ) ( not ( = ?auto_16152 ?auto_16161 ) ) ( not ( = ?auto_16153 ?auto_16161 ) ) ( not ( = ?auto_16151 ?auto_16161 ) ) ( SURFACE-AT ?auto_16151 ?auto_16159 ) ( CLEAR ?auto_16151 ) ( IS-CRATE ?auto_16152 ) ( AVAILABLE ?auto_16154 ) ( not ( = ?auto_16160 ?auto_16159 ) ) ( not ( = ?auto_16158 ?auto_16160 ) ) ( HOIST-AT ?auto_16162 ?auto_16160 ) ( not ( = ?auto_16154 ?auto_16162 ) ) ( not ( = ?auto_16156 ?auto_16162 ) ) ( AVAILABLE ?auto_16162 ) ( SURFACE-AT ?auto_16152 ?auto_16160 ) ( ON ?auto_16152 ?auto_16155 ) ( CLEAR ?auto_16152 ) ( not ( = ?auto_16152 ?auto_16155 ) ) ( not ( = ?auto_16153 ?auto_16155 ) ) ( not ( = ?auto_16151 ?auto_16155 ) ) ( not ( = ?auto_16161 ?auto_16155 ) ) ( TRUCK-AT ?auto_16157 ?auto_16159 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16152 ?auto_16153 )
      ( MAKE-2CRATE-VERIFY ?auto_16151 ?auto_16152 ?auto_16153 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16163 - SURFACE
      ?auto_16164 - SURFACE
      ?auto_16165 - SURFACE
      ?auto_16166 - SURFACE
    )
    :vars
    (
      ?auto_16170 - HOIST
      ?auto_16169 - PLACE
      ?auto_16167 - PLACE
      ?auto_16173 - HOIST
      ?auto_16175 - SURFACE
      ?auto_16172 - PLACE
      ?auto_16168 - HOIST
      ?auto_16171 - SURFACE
      ?auto_16174 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16170 ?auto_16169 ) ( IS-CRATE ?auto_16166 ) ( not ( = ?auto_16165 ?auto_16166 ) ) ( not ( = ?auto_16164 ?auto_16165 ) ) ( not ( = ?auto_16164 ?auto_16166 ) ) ( not ( = ?auto_16167 ?auto_16169 ) ) ( HOIST-AT ?auto_16173 ?auto_16167 ) ( not ( = ?auto_16170 ?auto_16173 ) ) ( AVAILABLE ?auto_16173 ) ( SURFACE-AT ?auto_16166 ?auto_16167 ) ( ON ?auto_16166 ?auto_16175 ) ( CLEAR ?auto_16166 ) ( not ( = ?auto_16165 ?auto_16175 ) ) ( not ( = ?auto_16166 ?auto_16175 ) ) ( not ( = ?auto_16164 ?auto_16175 ) ) ( SURFACE-AT ?auto_16164 ?auto_16169 ) ( CLEAR ?auto_16164 ) ( IS-CRATE ?auto_16165 ) ( AVAILABLE ?auto_16170 ) ( not ( = ?auto_16172 ?auto_16169 ) ) ( not ( = ?auto_16167 ?auto_16172 ) ) ( HOIST-AT ?auto_16168 ?auto_16172 ) ( not ( = ?auto_16170 ?auto_16168 ) ) ( not ( = ?auto_16173 ?auto_16168 ) ) ( AVAILABLE ?auto_16168 ) ( SURFACE-AT ?auto_16165 ?auto_16172 ) ( ON ?auto_16165 ?auto_16171 ) ( CLEAR ?auto_16165 ) ( not ( = ?auto_16165 ?auto_16171 ) ) ( not ( = ?auto_16166 ?auto_16171 ) ) ( not ( = ?auto_16164 ?auto_16171 ) ) ( not ( = ?auto_16175 ?auto_16171 ) ) ( TRUCK-AT ?auto_16174 ?auto_16169 ) ( ON ?auto_16164 ?auto_16163 ) ( not ( = ?auto_16163 ?auto_16164 ) ) ( not ( = ?auto_16163 ?auto_16165 ) ) ( not ( = ?auto_16163 ?auto_16166 ) ) ( not ( = ?auto_16163 ?auto_16175 ) ) ( not ( = ?auto_16163 ?auto_16171 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16164 ?auto_16165 ?auto_16166 )
      ( MAKE-3CRATE-VERIFY ?auto_16163 ?auto_16164 ?auto_16165 ?auto_16166 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16176 - SURFACE
      ?auto_16177 - SURFACE
    )
    :vars
    (
      ?auto_16182 - HOIST
      ?auto_16181 - PLACE
      ?auto_16178 - SURFACE
      ?auto_16179 - PLACE
      ?auto_16185 - HOIST
      ?auto_16187 - SURFACE
      ?auto_16184 - PLACE
      ?auto_16180 - HOIST
      ?auto_16183 - SURFACE
      ?auto_16186 - TRUCK
      ?auto_16188 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16182 ?auto_16181 ) ( IS-CRATE ?auto_16177 ) ( not ( = ?auto_16176 ?auto_16177 ) ) ( not ( = ?auto_16178 ?auto_16176 ) ) ( not ( = ?auto_16178 ?auto_16177 ) ) ( not ( = ?auto_16179 ?auto_16181 ) ) ( HOIST-AT ?auto_16185 ?auto_16179 ) ( not ( = ?auto_16182 ?auto_16185 ) ) ( AVAILABLE ?auto_16185 ) ( SURFACE-AT ?auto_16177 ?auto_16179 ) ( ON ?auto_16177 ?auto_16187 ) ( CLEAR ?auto_16177 ) ( not ( = ?auto_16176 ?auto_16187 ) ) ( not ( = ?auto_16177 ?auto_16187 ) ) ( not ( = ?auto_16178 ?auto_16187 ) ) ( IS-CRATE ?auto_16176 ) ( not ( = ?auto_16184 ?auto_16181 ) ) ( not ( = ?auto_16179 ?auto_16184 ) ) ( HOIST-AT ?auto_16180 ?auto_16184 ) ( not ( = ?auto_16182 ?auto_16180 ) ) ( not ( = ?auto_16185 ?auto_16180 ) ) ( AVAILABLE ?auto_16180 ) ( SURFACE-AT ?auto_16176 ?auto_16184 ) ( ON ?auto_16176 ?auto_16183 ) ( CLEAR ?auto_16176 ) ( not ( = ?auto_16176 ?auto_16183 ) ) ( not ( = ?auto_16177 ?auto_16183 ) ) ( not ( = ?auto_16178 ?auto_16183 ) ) ( not ( = ?auto_16187 ?auto_16183 ) ) ( TRUCK-AT ?auto_16186 ?auto_16181 ) ( SURFACE-AT ?auto_16188 ?auto_16181 ) ( CLEAR ?auto_16188 ) ( LIFTING ?auto_16182 ?auto_16178 ) ( IS-CRATE ?auto_16178 ) ( not ( = ?auto_16188 ?auto_16178 ) ) ( not ( = ?auto_16176 ?auto_16188 ) ) ( not ( = ?auto_16177 ?auto_16188 ) ) ( not ( = ?auto_16187 ?auto_16188 ) ) ( not ( = ?auto_16183 ?auto_16188 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16188 ?auto_16178 )
      ( MAKE-2CRATE ?auto_16178 ?auto_16176 ?auto_16177 )
      ( MAKE-1CRATE-VERIFY ?auto_16176 ?auto_16177 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16189 - SURFACE
      ?auto_16190 - SURFACE
      ?auto_16191 - SURFACE
    )
    :vars
    (
      ?auto_16200 - HOIST
      ?auto_16195 - PLACE
      ?auto_16196 - PLACE
      ?auto_16199 - HOIST
      ?auto_16198 - SURFACE
      ?auto_16193 - PLACE
      ?auto_16194 - HOIST
      ?auto_16201 - SURFACE
      ?auto_16192 - TRUCK
      ?auto_16197 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16200 ?auto_16195 ) ( IS-CRATE ?auto_16191 ) ( not ( = ?auto_16190 ?auto_16191 ) ) ( not ( = ?auto_16189 ?auto_16190 ) ) ( not ( = ?auto_16189 ?auto_16191 ) ) ( not ( = ?auto_16196 ?auto_16195 ) ) ( HOIST-AT ?auto_16199 ?auto_16196 ) ( not ( = ?auto_16200 ?auto_16199 ) ) ( AVAILABLE ?auto_16199 ) ( SURFACE-AT ?auto_16191 ?auto_16196 ) ( ON ?auto_16191 ?auto_16198 ) ( CLEAR ?auto_16191 ) ( not ( = ?auto_16190 ?auto_16198 ) ) ( not ( = ?auto_16191 ?auto_16198 ) ) ( not ( = ?auto_16189 ?auto_16198 ) ) ( IS-CRATE ?auto_16190 ) ( not ( = ?auto_16193 ?auto_16195 ) ) ( not ( = ?auto_16196 ?auto_16193 ) ) ( HOIST-AT ?auto_16194 ?auto_16193 ) ( not ( = ?auto_16200 ?auto_16194 ) ) ( not ( = ?auto_16199 ?auto_16194 ) ) ( AVAILABLE ?auto_16194 ) ( SURFACE-AT ?auto_16190 ?auto_16193 ) ( ON ?auto_16190 ?auto_16201 ) ( CLEAR ?auto_16190 ) ( not ( = ?auto_16190 ?auto_16201 ) ) ( not ( = ?auto_16191 ?auto_16201 ) ) ( not ( = ?auto_16189 ?auto_16201 ) ) ( not ( = ?auto_16198 ?auto_16201 ) ) ( TRUCK-AT ?auto_16192 ?auto_16195 ) ( SURFACE-AT ?auto_16197 ?auto_16195 ) ( CLEAR ?auto_16197 ) ( LIFTING ?auto_16200 ?auto_16189 ) ( IS-CRATE ?auto_16189 ) ( not ( = ?auto_16197 ?auto_16189 ) ) ( not ( = ?auto_16190 ?auto_16197 ) ) ( not ( = ?auto_16191 ?auto_16197 ) ) ( not ( = ?auto_16198 ?auto_16197 ) ) ( not ( = ?auto_16201 ?auto_16197 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16190 ?auto_16191 )
      ( MAKE-2CRATE-VERIFY ?auto_16189 ?auto_16190 ?auto_16191 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16202 - SURFACE
      ?auto_16203 - SURFACE
      ?auto_16204 - SURFACE
      ?auto_16205 - SURFACE
    )
    :vars
    (
      ?auto_16208 - HOIST
      ?auto_16209 - PLACE
      ?auto_16206 - PLACE
      ?auto_16212 - HOIST
      ?auto_16213 - SURFACE
      ?auto_16207 - PLACE
      ?auto_16211 - HOIST
      ?auto_16210 - SURFACE
      ?auto_16214 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16208 ?auto_16209 ) ( IS-CRATE ?auto_16205 ) ( not ( = ?auto_16204 ?auto_16205 ) ) ( not ( = ?auto_16203 ?auto_16204 ) ) ( not ( = ?auto_16203 ?auto_16205 ) ) ( not ( = ?auto_16206 ?auto_16209 ) ) ( HOIST-AT ?auto_16212 ?auto_16206 ) ( not ( = ?auto_16208 ?auto_16212 ) ) ( AVAILABLE ?auto_16212 ) ( SURFACE-AT ?auto_16205 ?auto_16206 ) ( ON ?auto_16205 ?auto_16213 ) ( CLEAR ?auto_16205 ) ( not ( = ?auto_16204 ?auto_16213 ) ) ( not ( = ?auto_16205 ?auto_16213 ) ) ( not ( = ?auto_16203 ?auto_16213 ) ) ( IS-CRATE ?auto_16204 ) ( not ( = ?auto_16207 ?auto_16209 ) ) ( not ( = ?auto_16206 ?auto_16207 ) ) ( HOIST-AT ?auto_16211 ?auto_16207 ) ( not ( = ?auto_16208 ?auto_16211 ) ) ( not ( = ?auto_16212 ?auto_16211 ) ) ( AVAILABLE ?auto_16211 ) ( SURFACE-AT ?auto_16204 ?auto_16207 ) ( ON ?auto_16204 ?auto_16210 ) ( CLEAR ?auto_16204 ) ( not ( = ?auto_16204 ?auto_16210 ) ) ( not ( = ?auto_16205 ?auto_16210 ) ) ( not ( = ?auto_16203 ?auto_16210 ) ) ( not ( = ?auto_16213 ?auto_16210 ) ) ( TRUCK-AT ?auto_16214 ?auto_16209 ) ( SURFACE-AT ?auto_16202 ?auto_16209 ) ( CLEAR ?auto_16202 ) ( LIFTING ?auto_16208 ?auto_16203 ) ( IS-CRATE ?auto_16203 ) ( not ( = ?auto_16202 ?auto_16203 ) ) ( not ( = ?auto_16204 ?auto_16202 ) ) ( not ( = ?auto_16205 ?auto_16202 ) ) ( not ( = ?auto_16213 ?auto_16202 ) ) ( not ( = ?auto_16210 ?auto_16202 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16203 ?auto_16204 ?auto_16205 )
      ( MAKE-3CRATE-VERIFY ?auto_16202 ?auto_16203 ?auto_16204 ?auto_16205 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16215 - SURFACE
      ?auto_16216 - SURFACE
    )
    :vars
    (
      ?auto_16220 - HOIST
      ?auto_16222 - PLACE
      ?auto_16221 - SURFACE
      ?auto_16218 - PLACE
      ?auto_16225 - HOIST
      ?auto_16226 - SURFACE
      ?auto_16219 - PLACE
      ?auto_16224 - HOIST
      ?auto_16223 - SURFACE
      ?auto_16227 - TRUCK
      ?auto_16217 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16220 ?auto_16222 ) ( IS-CRATE ?auto_16216 ) ( not ( = ?auto_16215 ?auto_16216 ) ) ( not ( = ?auto_16221 ?auto_16215 ) ) ( not ( = ?auto_16221 ?auto_16216 ) ) ( not ( = ?auto_16218 ?auto_16222 ) ) ( HOIST-AT ?auto_16225 ?auto_16218 ) ( not ( = ?auto_16220 ?auto_16225 ) ) ( AVAILABLE ?auto_16225 ) ( SURFACE-AT ?auto_16216 ?auto_16218 ) ( ON ?auto_16216 ?auto_16226 ) ( CLEAR ?auto_16216 ) ( not ( = ?auto_16215 ?auto_16226 ) ) ( not ( = ?auto_16216 ?auto_16226 ) ) ( not ( = ?auto_16221 ?auto_16226 ) ) ( IS-CRATE ?auto_16215 ) ( not ( = ?auto_16219 ?auto_16222 ) ) ( not ( = ?auto_16218 ?auto_16219 ) ) ( HOIST-AT ?auto_16224 ?auto_16219 ) ( not ( = ?auto_16220 ?auto_16224 ) ) ( not ( = ?auto_16225 ?auto_16224 ) ) ( AVAILABLE ?auto_16224 ) ( SURFACE-AT ?auto_16215 ?auto_16219 ) ( ON ?auto_16215 ?auto_16223 ) ( CLEAR ?auto_16215 ) ( not ( = ?auto_16215 ?auto_16223 ) ) ( not ( = ?auto_16216 ?auto_16223 ) ) ( not ( = ?auto_16221 ?auto_16223 ) ) ( not ( = ?auto_16226 ?auto_16223 ) ) ( TRUCK-AT ?auto_16227 ?auto_16222 ) ( SURFACE-AT ?auto_16217 ?auto_16222 ) ( CLEAR ?auto_16217 ) ( IS-CRATE ?auto_16221 ) ( not ( = ?auto_16217 ?auto_16221 ) ) ( not ( = ?auto_16215 ?auto_16217 ) ) ( not ( = ?auto_16216 ?auto_16217 ) ) ( not ( = ?auto_16226 ?auto_16217 ) ) ( not ( = ?auto_16223 ?auto_16217 ) ) ( AVAILABLE ?auto_16220 ) ( IN ?auto_16221 ?auto_16227 ) )
    :subtasks
    ( ( !UNLOAD ?auto_16220 ?auto_16221 ?auto_16227 ?auto_16222 )
      ( MAKE-2CRATE ?auto_16221 ?auto_16215 ?auto_16216 )
      ( MAKE-1CRATE-VERIFY ?auto_16215 ?auto_16216 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16228 - SURFACE
      ?auto_16229 - SURFACE
      ?auto_16230 - SURFACE
    )
    :vars
    (
      ?auto_16238 - HOIST
      ?auto_16239 - PLACE
      ?auto_16235 - PLACE
      ?auto_16234 - HOIST
      ?auto_16240 - SURFACE
      ?auto_16232 - PLACE
      ?auto_16231 - HOIST
      ?auto_16236 - SURFACE
      ?auto_16237 - TRUCK
      ?auto_16233 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16238 ?auto_16239 ) ( IS-CRATE ?auto_16230 ) ( not ( = ?auto_16229 ?auto_16230 ) ) ( not ( = ?auto_16228 ?auto_16229 ) ) ( not ( = ?auto_16228 ?auto_16230 ) ) ( not ( = ?auto_16235 ?auto_16239 ) ) ( HOIST-AT ?auto_16234 ?auto_16235 ) ( not ( = ?auto_16238 ?auto_16234 ) ) ( AVAILABLE ?auto_16234 ) ( SURFACE-AT ?auto_16230 ?auto_16235 ) ( ON ?auto_16230 ?auto_16240 ) ( CLEAR ?auto_16230 ) ( not ( = ?auto_16229 ?auto_16240 ) ) ( not ( = ?auto_16230 ?auto_16240 ) ) ( not ( = ?auto_16228 ?auto_16240 ) ) ( IS-CRATE ?auto_16229 ) ( not ( = ?auto_16232 ?auto_16239 ) ) ( not ( = ?auto_16235 ?auto_16232 ) ) ( HOIST-AT ?auto_16231 ?auto_16232 ) ( not ( = ?auto_16238 ?auto_16231 ) ) ( not ( = ?auto_16234 ?auto_16231 ) ) ( AVAILABLE ?auto_16231 ) ( SURFACE-AT ?auto_16229 ?auto_16232 ) ( ON ?auto_16229 ?auto_16236 ) ( CLEAR ?auto_16229 ) ( not ( = ?auto_16229 ?auto_16236 ) ) ( not ( = ?auto_16230 ?auto_16236 ) ) ( not ( = ?auto_16228 ?auto_16236 ) ) ( not ( = ?auto_16240 ?auto_16236 ) ) ( TRUCK-AT ?auto_16237 ?auto_16239 ) ( SURFACE-AT ?auto_16233 ?auto_16239 ) ( CLEAR ?auto_16233 ) ( IS-CRATE ?auto_16228 ) ( not ( = ?auto_16233 ?auto_16228 ) ) ( not ( = ?auto_16229 ?auto_16233 ) ) ( not ( = ?auto_16230 ?auto_16233 ) ) ( not ( = ?auto_16240 ?auto_16233 ) ) ( not ( = ?auto_16236 ?auto_16233 ) ) ( AVAILABLE ?auto_16238 ) ( IN ?auto_16228 ?auto_16237 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16229 ?auto_16230 )
      ( MAKE-2CRATE-VERIFY ?auto_16228 ?auto_16229 ?auto_16230 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16241 - SURFACE
      ?auto_16242 - SURFACE
      ?auto_16243 - SURFACE
      ?auto_16244 - SURFACE
    )
    :vars
    (
      ?auto_16253 - HOIST
      ?auto_16249 - PLACE
      ?auto_16247 - PLACE
      ?auto_16246 - HOIST
      ?auto_16248 - SURFACE
      ?auto_16250 - PLACE
      ?auto_16251 - HOIST
      ?auto_16245 - SURFACE
      ?auto_16252 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16253 ?auto_16249 ) ( IS-CRATE ?auto_16244 ) ( not ( = ?auto_16243 ?auto_16244 ) ) ( not ( = ?auto_16242 ?auto_16243 ) ) ( not ( = ?auto_16242 ?auto_16244 ) ) ( not ( = ?auto_16247 ?auto_16249 ) ) ( HOIST-AT ?auto_16246 ?auto_16247 ) ( not ( = ?auto_16253 ?auto_16246 ) ) ( AVAILABLE ?auto_16246 ) ( SURFACE-AT ?auto_16244 ?auto_16247 ) ( ON ?auto_16244 ?auto_16248 ) ( CLEAR ?auto_16244 ) ( not ( = ?auto_16243 ?auto_16248 ) ) ( not ( = ?auto_16244 ?auto_16248 ) ) ( not ( = ?auto_16242 ?auto_16248 ) ) ( IS-CRATE ?auto_16243 ) ( not ( = ?auto_16250 ?auto_16249 ) ) ( not ( = ?auto_16247 ?auto_16250 ) ) ( HOIST-AT ?auto_16251 ?auto_16250 ) ( not ( = ?auto_16253 ?auto_16251 ) ) ( not ( = ?auto_16246 ?auto_16251 ) ) ( AVAILABLE ?auto_16251 ) ( SURFACE-AT ?auto_16243 ?auto_16250 ) ( ON ?auto_16243 ?auto_16245 ) ( CLEAR ?auto_16243 ) ( not ( = ?auto_16243 ?auto_16245 ) ) ( not ( = ?auto_16244 ?auto_16245 ) ) ( not ( = ?auto_16242 ?auto_16245 ) ) ( not ( = ?auto_16248 ?auto_16245 ) ) ( TRUCK-AT ?auto_16252 ?auto_16249 ) ( SURFACE-AT ?auto_16241 ?auto_16249 ) ( CLEAR ?auto_16241 ) ( IS-CRATE ?auto_16242 ) ( not ( = ?auto_16241 ?auto_16242 ) ) ( not ( = ?auto_16243 ?auto_16241 ) ) ( not ( = ?auto_16244 ?auto_16241 ) ) ( not ( = ?auto_16248 ?auto_16241 ) ) ( not ( = ?auto_16245 ?auto_16241 ) ) ( AVAILABLE ?auto_16253 ) ( IN ?auto_16242 ?auto_16252 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16242 ?auto_16243 ?auto_16244 )
      ( MAKE-3CRATE-VERIFY ?auto_16241 ?auto_16242 ?auto_16243 ?auto_16244 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16254 - SURFACE
      ?auto_16255 - SURFACE
    )
    :vars
    (
      ?auto_16266 - HOIST
      ?auto_16262 - PLACE
      ?auto_16261 - SURFACE
      ?auto_16259 - PLACE
      ?auto_16257 - HOIST
      ?auto_16260 - SURFACE
      ?auto_16263 - PLACE
      ?auto_16264 - HOIST
      ?auto_16256 - SURFACE
      ?auto_16258 - SURFACE
      ?auto_16265 - TRUCK
      ?auto_16267 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16266 ?auto_16262 ) ( IS-CRATE ?auto_16255 ) ( not ( = ?auto_16254 ?auto_16255 ) ) ( not ( = ?auto_16261 ?auto_16254 ) ) ( not ( = ?auto_16261 ?auto_16255 ) ) ( not ( = ?auto_16259 ?auto_16262 ) ) ( HOIST-AT ?auto_16257 ?auto_16259 ) ( not ( = ?auto_16266 ?auto_16257 ) ) ( AVAILABLE ?auto_16257 ) ( SURFACE-AT ?auto_16255 ?auto_16259 ) ( ON ?auto_16255 ?auto_16260 ) ( CLEAR ?auto_16255 ) ( not ( = ?auto_16254 ?auto_16260 ) ) ( not ( = ?auto_16255 ?auto_16260 ) ) ( not ( = ?auto_16261 ?auto_16260 ) ) ( IS-CRATE ?auto_16254 ) ( not ( = ?auto_16263 ?auto_16262 ) ) ( not ( = ?auto_16259 ?auto_16263 ) ) ( HOIST-AT ?auto_16264 ?auto_16263 ) ( not ( = ?auto_16266 ?auto_16264 ) ) ( not ( = ?auto_16257 ?auto_16264 ) ) ( AVAILABLE ?auto_16264 ) ( SURFACE-AT ?auto_16254 ?auto_16263 ) ( ON ?auto_16254 ?auto_16256 ) ( CLEAR ?auto_16254 ) ( not ( = ?auto_16254 ?auto_16256 ) ) ( not ( = ?auto_16255 ?auto_16256 ) ) ( not ( = ?auto_16261 ?auto_16256 ) ) ( not ( = ?auto_16260 ?auto_16256 ) ) ( SURFACE-AT ?auto_16258 ?auto_16262 ) ( CLEAR ?auto_16258 ) ( IS-CRATE ?auto_16261 ) ( not ( = ?auto_16258 ?auto_16261 ) ) ( not ( = ?auto_16254 ?auto_16258 ) ) ( not ( = ?auto_16255 ?auto_16258 ) ) ( not ( = ?auto_16260 ?auto_16258 ) ) ( not ( = ?auto_16256 ?auto_16258 ) ) ( AVAILABLE ?auto_16266 ) ( IN ?auto_16261 ?auto_16265 ) ( TRUCK-AT ?auto_16265 ?auto_16267 ) ( not ( = ?auto_16267 ?auto_16262 ) ) ( not ( = ?auto_16259 ?auto_16267 ) ) ( not ( = ?auto_16263 ?auto_16267 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16265 ?auto_16267 ?auto_16262 )
      ( MAKE-2CRATE ?auto_16261 ?auto_16254 ?auto_16255 )
      ( MAKE-1CRATE-VERIFY ?auto_16254 ?auto_16255 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16268 - SURFACE
      ?auto_16269 - SURFACE
      ?auto_16270 - SURFACE
    )
    :vars
    (
      ?auto_16278 - HOIST
      ?auto_16276 - PLACE
      ?auto_16277 - PLACE
      ?auto_16280 - HOIST
      ?auto_16272 - SURFACE
      ?auto_16274 - PLACE
      ?auto_16275 - HOIST
      ?auto_16279 - SURFACE
      ?auto_16271 - SURFACE
      ?auto_16273 - TRUCK
      ?auto_16281 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16278 ?auto_16276 ) ( IS-CRATE ?auto_16270 ) ( not ( = ?auto_16269 ?auto_16270 ) ) ( not ( = ?auto_16268 ?auto_16269 ) ) ( not ( = ?auto_16268 ?auto_16270 ) ) ( not ( = ?auto_16277 ?auto_16276 ) ) ( HOIST-AT ?auto_16280 ?auto_16277 ) ( not ( = ?auto_16278 ?auto_16280 ) ) ( AVAILABLE ?auto_16280 ) ( SURFACE-AT ?auto_16270 ?auto_16277 ) ( ON ?auto_16270 ?auto_16272 ) ( CLEAR ?auto_16270 ) ( not ( = ?auto_16269 ?auto_16272 ) ) ( not ( = ?auto_16270 ?auto_16272 ) ) ( not ( = ?auto_16268 ?auto_16272 ) ) ( IS-CRATE ?auto_16269 ) ( not ( = ?auto_16274 ?auto_16276 ) ) ( not ( = ?auto_16277 ?auto_16274 ) ) ( HOIST-AT ?auto_16275 ?auto_16274 ) ( not ( = ?auto_16278 ?auto_16275 ) ) ( not ( = ?auto_16280 ?auto_16275 ) ) ( AVAILABLE ?auto_16275 ) ( SURFACE-AT ?auto_16269 ?auto_16274 ) ( ON ?auto_16269 ?auto_16279 ) ( CLEAR ?auto_16269 ) ( not ( = ?auto_16269 ?auto_16279 ) ) ( not ( = ?auto_16270 ?auto_16279 ) ) ( not ( = ?auto_16268 ?auto_16279 ) ) ( not ( = ?auto_16272 ?auto_16279 ) ) ( SURFACE-AT ?auto_16271 ?auto_16276 ) ( CLEAR ?auto_16271 ) ( IS-CRATE ?auto_16268 ) ( not ( = ?auto_16271 ?auto_16268 ) ) ( not ( = ?auto_16269 ?auto_16271 ) ) ( not ( = ?auto_16270 ?auto_16271 ) ) ( not ( = ?auto_16272 ?auto_16271 ) ) ( not ( = ?auto_16279 ?auto_16271 ) ) ( AVAILABLE ?auto_16278 ) ( IN ?auto_16268 ?auto_16273 ) ( TRUCK-AT ?auto_16273 ?auto_16281 ) ( not ( = ?auto_16281 ?auto_16276 ) ) ( not ( = ?auto_16277 ?auto_16281 ) ) ( not ( = ?auto_16274 ?auto_16281 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16269 ?auto_16270 )
      ( MAKE-2CRATE-VERIFY ?auto_16268 ?auto_16269 ?auto_16270 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16282 - SURFACE
      ?auto_16283 - SURFACE
      ?auto_16284 - SURFACE
      ?auto_16285 - SURFACE
    )
    :vars
    (
      ?auto_16294 - HOIST
      ?auto_16295 - PLACE
      ?auto_16293 - PLACE
      ?auto_16289 - HOIST
      ?auto_16291 - SURFACE
      ?auto_16287 - PLACE
      ?auto_16288 - HOIST
      ?auto_16292 - SURFACE
      ?auto_16290 - TRUCK
      ?auto_16286 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16294 ?auto_16295 ) ( IS-CRATE ?auto_16285 ) ( not ( = ?auto_16284 ?auto_16285 ) ) ( not ( = ?auto_16283 ?auto_16284 ) ) ( not ( = ?auto_16283 ?auto_16285 ) ) ( not ( = ?auto_16293 ?auto_16295 ) ) ( HOIST-AT ?auto_16289 ?auto_16293 ) ( not ( = ?auto_16294 ?auto_16289 ) ) ( AVAILABLE ?auto_16289 ) ( SURFACE-AT ?auto_16285 ?auto_16293 ) ( ON ?auto_16285 ?auto_16291 ) ( CLEAR ?auto_16285 ) ( not ( = ?auto_16284 ?auto_16291 ) ) ( not ( = ?auto_16285 ?auto_16291 ) ) ( not ( = ?auto_16283 ?auto_16291 ) ) ( IS-CRATE ?auto_16284 ) ( not ( = ?auto_16287 ?auto_16295 ) ) ( not ( = ?auto_16293 ?auto_16287 ) ) ( HOIST-AT ?auto_16288 ?auto_16287 ) ( not ( = ?auto_16294 ?auto_16288 ) ) ( not ( = ?auto_16289 ?auto_16288 ) ) ( AVAILABLE ?auto_16288 ) ( SURFACE-AT ?auto_16284 ?auto_16287 ) ( ON ?auto_16284 ?auto_16292 ) ( CLEAR ?auto_16284 ) ( not ( = ?auto_16284 ?auto_16292 ) ) ( not ( = ?auto_16285 ?auto_16292 ) ) ( not ( = ?auto_16283 ?auto_16292 ) ) ( not ( = ?auto_16291 ?auto_16292 ) ) ( SURFACE-AT ?auto_16282 ?auto_16295 ) ( CLEAR ?auto_16282 ) ( IS-CRATE ?auto_16283 ) ( not ( = ?auto_16282 ?auto_16283 ) ) ( not ( = ?auto_16284 ?auto_16282 ) ) ( not ( = ?auto_16285 ?auto_16282 ) ) ( not ( = ?auto_16291 ?auto_16282 ) ) ( not ( = ?auto_16292 ?auto_16282 ) ) ( AVAILABLE ?auto_16294 ) ( IN ?auto_16283 ?auto_16290 ) ( TRUCK-AT ?auto_16290 ?auto_16286 ) ( not ( = ?auto_16286 ?auto_16295 ) ) ( not ( = ?auto_16293 ?auto_16286 ) ) ( not ( = ?auto_16287 ?auto_16286 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16283 ?auto_16284 ?auto_16285 )
      ( MAKE-3CRATE-VERIFY ?auto_16282 ?auto_16283 ?auto_16284 ?auto_16285 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16296 - SURFACE
      ?auto_16297 - SURFACE
    )
    :vars
    (
      ?auto_16307 - HOIST
      ?auto_16309 - PLACE
      ?auto_16308 - SURFACE
      ?auto_16306 - PLACE
      ?auto_16301 - HOIST
      ?auto_16304 - SURFACE
      ?auto_16299 - PLACE
      ?auto_16300 - HOIST
      ?auto_16305 - SURFACE
      ?auto_16302 - SURFACE
      ?auto_16303 - TRUCK
      ?auto_16298 - PLACE
      ?auto_16310 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16307 ?auto_16309 ) ( IS-CRATE ?auto_16297 ) ( not ( = ?auto_16296 ?auto_16297 ) ) ( not ( = ?auto_16308 ?auto_16296 ) ) ( not ( = ?auto_16308 ?auto_16297 ) ) ( not ( = ?auto_16306 ?auto_16309 ) ) ( HOIST-AT ?auto_16301 ?auto_16306 ) ( not ( = ?auto_16307 ?auto_16301 ) ) ( AVAILABLE ?auto_16301 ) ( SURFACE-AT ?auto_16297 ?auto_16306 ) ( ON ?auto_16297 ?auto_16304 ) ( CLEAR ?auto_16297 ) ( not ( = ?auto_16296 ?auto_16304 ) ) ( not ( = ?auto_16297 ?auto_16304 ) ) ( not ( = ?auto_16308 ?auto_16304 ) ) ( IS-CRATE ?auto_16296 ) ( not ( = ?auto_16299 ?auto_16309 ) ) ( not ( = ?auto_16306 ?auto_16299 ) ) ( HOIST-AT ?auto_16300 ?auto_16299 ) ( not ( = ?auto_16307 ?auto_16300 ) ) ( not ( = ?auto_16301 ?auto_16300 ) ) ( AVAILABLE ?auto_16300 ) ( SURFACE-AT ?auto_16296 ?auto_16299 ) ( ON ?auto_16296 ?auto_16305 ) ( CLEAR ?auto_16296 ) ( not ( = ?auto_16296 ?auto_16305 ) ) ( not ( = ?auto_16297 ?auto_16305 ) ) ( not ( = ?auto_16308 ?auto_16305 ) ) ( not ( = ?auto_16304 ?auto_16305 ) ) ( SURFACE-AT ?auto_16302 ?auto_16309 ) ( CLEAR ?auto_16302 ) ( IS-CRATE ?auto_16308 ) ( not ( = ?auto_16302 ?auto_16308 ) ) ( not ( = ?auto_16296 ?auto_16302 ) ) ( not ( = ?auto_16297 ?auto_16302 ) ) ( not ( = ?auto_16304 ?auto_16302 ) ) ( not ( = ?auto_16305 ?auto_16302 ) ) ( AVAILABLE ?auto_16307 ) ( TRUCK-AT ?auto_16303 ?auto_16298 ) ( not ( = ?auto_16298 ?auto_16309 ) ) ( not ( = ?auto_16306 ?auto_16298 ) ) ( not ( = ?auto_16299 ?auto_16298 ) ) ( HOIST-AT ?auto_16310 ?auto_16298 ) ( LIFTING ?auto_16310 ?auto_16308 ) ( not ( = ?auto_16307 ?auto_16310 ) ) ( not ( = ?auto_16301 ?auto_16310 ) ) ( not ( = ?auto_16300 ?auto_16310 ) ) )
    :subtasks
    ( ( !LOAD ?auto_16310 ?auto_16308 ?auto_16303 ?auto_16298 )
      ( MAKE-2CRATE ?auto_16308 ?auto_16296 ?auto_16297 )
      ( MAKE-1CRATE-VERIFY ?auto_16296 ?auto_16297 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16311 - SURFACE
      ?auto_16312 - SURFACE
      ?auto_16313 - SURFACE
    )
    :vars
    (
      ?auto_16325 - HOIST
      ?auto_16314 - PLACE
      ?auto_16315 - PLACE
      ?auto_16323 - HOIST
      ?auto_16321 - SURFACE
      ?auto_16322 - PLACE
      ?auto_16318 - HOIST
      ?auto_16316 - SURFACE
      ?auto_16319 - SURFACE
      ?auto_16317 - TRUCK
      ?auto_16324 - PLACE
      ?auto_16320 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16325 ?auto_16314 ) ( IS-CRATE ?auto_16313 ) ( not ( = ?auto_16312 ?auto_16313 ) ) ( not ( = ?auto_16311 ?auto_16312 ) ) ( not ( = ?auto_16311 ?auto_16313 ) ) ( not ( = ?auto_16315 ?auto_16314 ) ) ( HOIST-AT ?auto_16323 ?auto_16315 ) ( not ( = ?auto_16325 ?auto_16323 ) ) ( AVAILABLE ?auto_16323 ) ( SURFACE-AT ?auto_16313 ?auto_16315 ) ( ON ?auto_16313 ?auto_16321 ) ( CLEAR ?auto_16313 ) ( not ( = ?auto_16312 ?auto_16321 ) ) ( not ( = ?auto_16313 ?auto_16321 ) ) ( not ( = ?auto_16311 ?auto_16321 ) ) ( IS-CRATE ?auto_16312 ) ( not ( = ?auto_16322 ?auto_16314 ) ) ( not ( = ?auto_16315 ?auto_16322 ) ) ( HOIST-AT ?auto_16318 ?auto_16322 ) ( not ( = ?auto_16325 ?auto_16318 ) ) ( not ( = ?auto_16323 ?auto_16318 ) ) ( AVAILABLE ?auto_16318 ) ( SURFACE-AT ?auto_16312 ?auto_16322 ) ( ON ?auto_16312 ?auto_16316 ) ( CLEAR ?auto_16312 ) ( not ( = ?auto_16312 ?auto_16316 ) ) ( not ( = ?auto_16313 ?auto_16316 ) ) ( not ( = ?auto_16311 ?auto_16316 ) ) ( not ( = ?auto_16321 ?auto_16316 ) ) ( SURFACE-AT ?auto_16319 ?auto_16314 ) ( CLEAR ?auto_16319 ) ( IS-CRATE ?auto_16311 ) ( not ( = ?auto_16319 ?auto_16311 ) ) ( not ( = ?auto_16312 ?auto_16319 ) ) ( not ( = ?auto_16313 ?auto_16319 ) ) ( not ( = ?auto_16321 ?auto_16319 ) ) ( not ( = ?auto_16316 ?auto_16319 ) ) ( AVAILABLE ?auto_16325 ) ( TRUCK-AT ?auto_16317 ?auto_16324 ) ( not ( = ?auto_16324 ?auto_16314 ) ) ( not ( = ?auto_16315 ?auto_16324 ) ) ( not ( = ?auto_16322 ?auto_16324 ) ) ( HOIST-AT ?auto_16320 ?auto_16324 ) ( LIFTING ?auto_16320 ?auto_16311 ) ( not ( = ?auto_16325 ?auto_16320 ) ) ( not ( = ?auto_16323 ?auto_16320 ) ) ( not ( = ?auto_16318 ?auto_16320 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16312 ?auto_16313 )
      ( MAKE-2CRATE-VERIFY ?auto_16311 ?auto_16312 ?auto_16313 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16326 - SURFACE
      ?auto_16327 - SURFACE
      ?auto_16328 - SURFACE
      ?auto_16329 - SURFACE
    )
    :vars
    (
      ?auto_16336 - HOIST
      ?auto_16335 - PLACE
      ?auto_16330 - PLACE
      ?auto_16340 - HOIST
      ?auto_16332 - SURFACE
      ?auto_16339 - PLACE
      ?auto_16337 - HOIST
      ?auto_16331 - SURFACE
      ?auto_16333 - TRUCK
      ?auto_16334 - PLACE
      ?auto_16338 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16336 ?auto_16335 ) ( IS-CRATE ?auto_16329 ) ( not ( = ?auto_16328 ?auto_16329 ) ) ( not ( = ?auto_16327 ?auto_16328 ) ) ( not ( = ?auto_16327 ?auto_16329 ) ) ( not ( = ?auto_16330 ?auto_16335 ) ) ( HOIST-AT ?auto_16340 ?auto_16330 ) ( not ( = ?auto_16336 ?auto_16340 ) ) ( AVAILABLE ?auto_16340 ) ( SURFACE-AT ?auto_16329 ?auto_16330 ) ( ON ?auto_16329 ?auto_16332 ) ( CLEAR ?auto_16329 ) ( not ( = ?auto_16328 ?auto_16332 ) ) ( not ( = ?auto_16329 ?auto_16332 ) ) ( not ( = ?auto_16327 ?auto_16332 ) ) ( IS-CRATE ?auto_16328 ) ( not ( = ?auto_16339 ?auto_16335 ) ) ( not ( = ?auto_16330 ?auto_16339 ) ) ( HOIST-AT ?auto_16337 ?auto_16339 ) ( not ( = ?auto_16336 ?auto_16337 ) ) ( not ( = ?auto_16340 ?auto_16337 ) ) ( AVAILABLE ?auto_16337 ) ( SURFACE-AT ?auto_16328 ?auto_16339 ) ( ON ?auto_16328 ?auto_16331 ) ( CLEAR ?auto_16328 ) ( not ( = ?auto_16328 ?auto_16331 ) ) ( not ( = ?auto_16329 ?auto_16331 ) ) ( not ( = ?auto_16327 ?auto_16331 ) ) ( not ( = ?auto_16332 ?auto_16331 ) ) ( SURFACE-AT ?auto_16326 ?auto_16335 ) ( CLEAR ?auto_16326 ) ( IS-CRATE ?auto_16327 ) ( not ( = ?auto_16326 ?auto_16327 ) ) ( not ( = ?auto_16328 ?auto_16326 ) ) ( not ( = ?auto_16329 ?auto_16326 ) ) ( not ( = ?auto_16332 ?auto_16326 ) ) ( not ( = ?auto_16331 ?auto_16326 ) ) ( AVAILABLE ?auto_16336 ) ( TRUCK-AT ?auto_16333 ?auto_16334 ) ( not ( = ?auto_16334 ?auto_16335 ) ) ( not ( = ?auto_16330 ?auto_16334 ) ) ( not ( = ?auto_16339 ?auto_16334 ) ) ( HOIST-AT ?auto_16338 ?auto_16334 ) ( LIFTING ?auto_16338 ?auto_16327 ) ( not ( = ?auto_16336 ?auto_16338 ) ) ( not ( = ?auto_16340 ?auto_16338 ) ) ( not ( = ?auto_16337 ?auto_16338 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16327 ?auto_16328 ?auto_16329 )
      ( MAKE-3CRATE-VERIFY ?auto_16326 ?auto_16327 ?auto_16328 ?auto_16329 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16341 - SURFACE
      ?auto_16342 - SURFACE
    )
    :vars
    (
      ?auto_16350 - HOIST
      ?auto_16349 - PLACE
      ?auto_16348 - SURFACE
      ?auto_16343 - PLACE
      ?auto_16355 - HOIST
      ?auto_16345 - SURFACE
      ?auto_16354 - PLACE
      ?auto_16351 - HOIST
      ?auto_16344 - SURFACE
      ?auto_16353 - SURFACE
      ?auto_16346 - TRUCK
      ?auto_16347 - PLACE
      ?auto_16352 - HOIST
      ?auto_16356 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16350 ?auto_16349 ) ( IS-CRATE ?auto_16342 ) ( not ( = ?auto_16341 ?auto_16342 ) ) ( not ( = ?auto_16348 ?auto_16341 ) ) ( not ( = ?auto_16348 ?auto_16342 ) ) ( not ( = ?auto_16343 ?auto_16349 ) ) ( HOIST-AT ?auto_16355 ?auto_16343 ) ( not ( = ?auto_16350 ?auto_16355 ) ) ( AVAILABLE ?auto_16355 ) ( SURFACE-AT ?auto_16342 ?auto_16343 ) ( ON ?auto_16342 ?auto_16345 ) ( CLEAR ?auto_16342 ) ( not ( = ?auto_16341 ?auto_16345 ) ) ( not ( = ?auto_16342 ?auto_16345 ) ) ( not ( = ?auto_16348 ?auto_16345 ) ) ( IS-CRATE ?auto_16341 ) ( not ( = ?auto_16354 ?auto_16349 ) ) ( not ( = ?auto_16343 ?auto_16354 ) ) ( HOIST-AT ?auto_16351 ?auto_16354 ) ( not ( = ?auto_16350 ?auto_16351 ) ) ( not ( = ?auto_16355 ?auto_16351 ) ) ( AVAILABLE ?auto_16351 ) ( SURFACE-AT ?auto_16341 ?auto_16354 ) ( ON ?auto_16341 ?auto_16344 ) ( CLEAR ?auto_16341 ) ( not ( = ?auto_16341 ?auto_16344 ) ) ( not ( = ?auto_16342 ?auto_16344 ) ) ( not ( = ?auto_16348 ?auto_16344 ) ) ( not ( = ?auto_16345 ?auto_16344 ) ) ( SURFACE-AT ?auto_16353 ?auto_16349 ) ( CLEAR ?auto_16353 ) ( IS-CRATE ?auto_16348 ) ( not ( = ?auto_16353 ?auto_16348 ) ) ( not ( = ?auto_16341 ?auto_16353 ) ) ( not ( = ?auto_16342 ?auto_16353 ) ) ( not ( = ?auto_16345 ?auto_16353 ) ) ( not ( = ?auto_16344 ?auto_16353 ) ) ( AVAILABLE ?auto_16350 ) ( TRUCK-AT ?auto_16346 ?auto_16347 ) ( not ( = ?auto_16347 ?auto_16349 ) ) ( not ( = ?auto_16343 ?auto_16347 ) ) ( not ( = ?auto_16354 ?auto_16347 ) ) ( HOIST-AT ?auto_16352 ?auto_16347 ) ( not ( = ?auto_16350 ?auto_16352 ) ) ( not ( = ?auto_16355 ?auto_16352 ) ) ( not ( = ?auto_16351 ?auto_16352 ) ) ( AVAILABLE ?auto_16352 ) ( SURFACE-AT ?auto_16348 ?auto_16347 ) ( ON ?auto_16348 ?auto_16356 ) ( CLEAR ?auto_16348 ) ( not ( = ?auto_16341 ?auto_16356 ) ) ( not ( = ?auto_16342 ?auto_16356 ) ) ( not ( = ?auto_16348 ?auto_16356 ) ) ( not ( = ?auto_16345 ?auto_16356 ) ) ( not ( = ?auto_16344 ?auto_16356 ) ) ( not ( = ?auto_16353 ?auto_16356 ) ) )
    :subtasks
    ( ( !LIFT ?auto_16352 ?auto_16348 ?auto_16356 ?auto_16347 )
      ( MAKE-2CRATE ?auto_16348 ?auto_16341 ?auto_16342 )
      ( MAKE-1CRATE-VERIFY ?auto_16341 ?auto_16342 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16357 - SURFACE
      ?auto_16358 - SURFACE
      ?auto_16359 - SURFACE
    )
    :vars
    (
      ?auto_16363 - HOIST
      ?auto_16367 - PLACE
      ?auto_16370 - PLACE
      ?auto_16364 - HOIST
      ?auto_16361 - SURFACE
      ?auto_16362 - PLACE
      ?auto_16368 - HOIST
      ?auto_16369 - SURFACE
      ?auto_16365 - SURFACE
      ?auto_16360 - TRUCK
      ?auto_16366 - PLACE
      ?auto_16371 - HOIST
      ?auto_16372 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16363 ?auto_16367 ) ( IS-CRATE ?auto_16359 ) ( not ( = ?auto_16358 ?auto_16359 ) ) ( not ( = ?auto_16357 ?auto_16358 ) ) ( not ( = ?auto_16357 ?auto_16359 ) ) ( not ( = ?auto_16370 ?auto_16367 ) ) ( HOIST-AT ?auto_16364 ?auto_16370 ) ( not ( = ?auto_16363 ?auto_16364 ) ) ( AVAILABLE ?auto_16364 ) ( SURFACE-AT ?auto_16359 ?auto_16370 ) ( ON ?auto_16359 ?auto_16361 ) ( CLEAR ?auto_16359 ) ( not ( = ?auto_16358 ?auto_16361 ) ) ( not ( = ?auto_16359 ?auto_16361 ) ) ( not ( = ?auto_16357 ?auto_16361 ) ) ( IS-CRATE ?auto_16358 ) ( not ( = ?auto_16362 ?auto_16367 ) ) ( not ( = ?auto_16370 ?auto_16362 ) ) ( HOIST-AT ?auto_16368 ?auto_16362 ) ( not ( = ?auto_16363 ?auto_16368 ) ) ( not ( = ?auto_16364 ?auto_16368 ) ) ( AVAILABLE ?auto_16368 ) ( SURFACE-AT ?auto_16358 ?auto_16362 ) ( ON ?auto_16358 ?auto_16369 ) ( CLEAR ?auto_16358 ) ( not ( = ?auto_16358 ?auto_16369 ) ) ( not ( = ?auto_16359 ?auto_16369 ) ) ( not ( = ?auto_16357 ?auto_16369 ) ) ( not ( = ?auto_16361 ?auto_16369 ) ) ( SURFACE-AT ?auto_16365 ?auto_16367 ) ( CLEAR ?auto_16365 ) ( IS-CRATE ?auto_16357 ) ( not ( = ?auto_16365 ?auto_16357 ) ) ( not ( = ?auto_16358 ?auto_16365 ) ) ( not ( = ?auto_16359 ?auto_16365 ) ) ( not ( = ?auto_16361 ?auto_16365 ) ) ( not ( = ?auto_16369 ?auto_16365 ) ) ( AVAILABLE ?auto_16363 ) ( TRUCK-AT ?auto_16360 ?auto_16366 ) ( not ( = ?auto_16366 ?auto_16367 ) ) ( not ( = ?auto_16370 ?auto_16366 ) ) ( not ( = ?auto_16362 ?auto_16366 ) ) ( HOIST-AT ?auto_16371 ?auto_16366 ) ( not ( = ?auto_16363 ?auto_16371 ) ) ( not ( = ?auto_16364 ?auto_16371 ) ) ( not ( = ?auto_16368 ?auto_16371 ) ) ( AVAILABLE ?auto_16371 ) ( SURFACE-AT ?auto_16357 ?auto_16366 ) ( ON ?auto_16357 ?auto_16372 ) ( CLEAR ?auto_16357 ) ( not ( = ?auto_16358 ?auto_16372 ) ) ( not ( = ?auto_16359 ?auto_16372 ) ) ( not ( = ?auto_16357 ?auto_16372 ) ) ( not ( = ?auto_16361 ?auto_16372 ) ) ( not ( = ?auto_16369 ?auto_16372 ) ) ( not ( = ?auto_16365 ?auto_16372 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16358 ?auto_16359 )
      ( MAKE-2CRATE-VERIFY ?auto_16357 ?auto_16358 ?auto_16359 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16373 - SURFACE
      ?auto_16374 - SURFACE
      ?auto_16375 - SURFACE
      ?auto_16376 - SURFACE
    )
    :vars
    (
      ?auto_16386 - HOIST
      ?auto_16377 - PLACE
      ?auto_16380 - PLACE
      ?auto_16387 - HOIST
      ?auto_16388 - SURFACE
      ?auto_16385 - PLACE
      ?auto_16381 - HOIST
      ?auto_16383 - SURFACE
      ?auto_16379 - TRUCK
      ?auto_16384 - PLACE
      ?auto_16378 - HOIST
      ?auto_16382 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16386 ?auto_16377 ) ( IS-CRATE ?auto_16376 ) ( not ( = ?auto_16375 ?auto_16376 ) ) ( not ( = ?auto_16374 ?auto_16375 ) ) ( not ( = ?auto_16374 ?auto_16376 ) ) ( not ( = ?auto_16380 ?auto_16377 ) ) ( HOIST-AT ?auto_16387 ?auto_16380 ) ( not ( = ?auto_16386 ?auto_16387 ) ) ( AVAILABLE ?auto_16387 ) ( SURFACE-AT ?auto_16376 ?auto_16380 ) ( ON ?auto_16376 ?auto_16388 ) ( CLEAR ?auto_16376 ) ( not ( = ?auto_16375 ?auto_16388 ) ) ( not ( = ?auto_16376 ?auto_16388 ) ) ( not ( = ?auto_16374 ?auto_16388 ) ) ( IS-CRATE ?auto_16375 ) ( not ( = ?auto_16385 ?auto_16377 ) ) ( not ( = ?auto_16380 ?auto_16385 ) ) ( HOIST-AT ?auto_16381 ?auto_16385 ) ( not ( = ?auto_16386 ?auto_16381 ) ) ( not ( = ?auto_16387 ?auto_16381 ) ) ( AVAILABLE ?auto_16381 ) ( SURFACE-AT ?auto_16375 ?auto_16385 ) ( ON ?auto_16375 ?auto_16383 ) ( CLEAR ?auto_16375 ) ( not ( = ?auto_16375 ?auto_16383 ) ) ( not ( = ?auto_16376 ?auto_16383 ) ) ( not ( = ?auto_16374 ?auto_16383 ) ) ( not ( = ?auto_16388 ?auto_16383 ) ) ( SURFACE-AT ?auto_16373 ?auto_16377 ) ( CLEAR ?auto_16373 ) ( IS-CRATE ?auto_16374 ) ( not ( = ?auto_16373 ?auto_16374 ) ) ( not ( = ?auto_16375 ?auto_16373 ) ) ( not ( = ?auto_16376 ?auto_16373 ) ) ( not ( = ?auto_16388 ?auto_16373 ) ) ( not ( = ?auto_16383 ?auto_16373 ) ) ( AVAILABLE ?auto_16386 ) ( TRUCK-AT ?auto_16379 ?auto_16384 ) ( not ( = ?auto_16384 ?auto_16377 ) ) ( not ( = ?auto_16380 ?auto_16384 ) ) ( not ( = ?auto_16385 ?auto_16384 ) ) ( HOIST-AT ?auto_16378 ?auto_16384 ) ( not ( = ?auto_16386 ?auto_16378 ) ) ( not ( = ?auto_16387 ?auto_16378 ) ) ( not ( = ?auto_16381 ?auto_16378 ) ) ( AVAILABLE ?auto_16378 ) ( SURFACE-AT ?auto_16374 ?auto_16384 ) ( ON ?auto_16374 ?auto_16382 ) ( CLEAR ?auto_16374 ) ( not ( = ?auto_16375 ?auto_16382 ) ) ( not ( = ?auto_16376 ?auto_16382 ) ) ( not ( = ?auto_16374 ?auto_16382 ) ) ( not ( = ?auto_16388 ?auto_16382 ) ) ( not ( = ?auto_16383 ?auto_16382 ) ) ( not ( = ?auto_16373 ?auto_16382 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16374 ?auto_16375 ?auto_16376 )
      ( MAKE-3CRATE-VERIFY ?auto_16373 ?auto_16374 ?auto_16375 ?auto_16376 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16389 - SURFACE
      ?auto_16390 - SURFACE
    )
    :vars
    (
      ?auto_16401 - HOIST
      ?auto_16391 - PLACE
      ?auto_16399 - SURFACE
      ?auto_16394 - PLACE
      ?auto_16403 - HOIST
      ?auto_16404 - SURFACE
      ?auto_16400 - PLACE
      ?auto_16395 - HOIST
      ?auto_16397 - SURFACE
      ?auto_16402 - SURFACE
      ?auto_16398 - PLACE
      ?auto_16392 - HOIST
      ?auto_16396 - SURFACE
      ?auto_16393 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16401 ?auto_16391 ) ( IS-CRATE ?auto_16390 ) ( not ( = ?auto_16389 ?auto_16390 ) ) ( not ( = ?auto_16399 ?auto_16389 ) ) ( not ( = ?auto_16399 ?auto_16390 ) ) ( not ( = ?auto_16394 ?auto_16391 ) ) ( HOIST-AT ?auto_16403 ?auto_16394 ) ( not ( = ?auto_16401 ?auto_16403 ) ) ( AVAILABLE ?auto_16403 ) ( SURFACE-AT ?auto_16390 ?auto_16394 ) ( ON ?auto_16390 ?auto_16404 ) ( CLEAR ?auto_16390 ) ( not ( = ?auto_16389 ?auto_16404 ) ) ( not ( = ?auto_16390 ?auto_16404 ) ) ( not ( = ?auto_16399 ?auto_16404 ) ) ( IS-CRATE ?auto_16389 ) ( not ( = ?auto_16400 ?auto_16391 ) ) ( not ( = ?auto_16394 ?auto_16400 ) ) ( HOIST-AT ?auto_16395 ?auto_16400 ) ( not ( = ?auto_16401 ?auto_16395 ) ) ( not ( = ?auto_16403 ?auto_16395 ) ) ( AVAILABLE ?auto_16395 ) ( SURFACE-AT ?auto_16389 ?auto_16400 ) ( ON ?auto_16389 ?auto_16397 ) ( CLEAR ?auto_16389 ) ( not ( = ?auto_16389 ?auto_16397 ) ) ( not ( = ?auto_16390 ?auto_16397 ) ) ( not ( = ?auto_16399 ?auto_16397 ) ) ( not ( = ?auto_16404 ?auto_16397 ) ) ( SURFACE-AT ?auto_16402 ?auto_16391 ) ( CLEAR ?auto_16402 ) ( IS-CRATE ?auto_16399 ) ( not ( = ?auto_16402 ?auto_16399 ) ) ( not ( = ?auto_16389 ?auto_16402 ) ) ( not ( = ?auto_16390 ?auto_16402 ) ) ( not ( = ?auto_16404 ?auto_16402 ) ) ( not ( = ?auto_16397 ?auto_16402 ) ) ( AVAILABLE ?auto_16401 ) ( not ( = ?auto_16398 ?auto_16391 ) ) ( not ( = ?auto_16394 ?auto_16398 ) ) ( not ( = ?auto_16400 ?auto_16398 ) ) ( HOIST-AT ?auto_16392 ?auto_16398 ) ( not ( = ?auto_16401 ?auto_16392 ) ) ( not ( = ?auto_16403 ?auto_16392 ) ) ( not ( = ?auto_16395 ?auto_16392 ) ) ( AVAILABLE ?auto_16392 ) ( SURFACE-AT ?auto_16399 ?auto_16398 ) ( ON ?auto_16399 ?auto_16396 ) ( CLEAR ?auto_16399 ) ( not ( = ?auto_16389 ?auto_16396 ) ) ( not ( = ?auto_16390 ?auto_16396 ) ) ( not ( = ?auto_16399 ?auto_16396 ) ) ( not ( = ?auto_16404 ?auto_16396 ) ) ( not ( = ?auto_16397 ?auto_16396 ) ) ( not ( = ?auto_16402 ?auto_16396 ) ) ( TRUCK-AT ?auto_16393 ?auto_16391 ) )
    :subtasks
    ( ( !DRIVE ?auto_16393 ?auto_16391 ?auto_16398 )
      ( MAKE-2CRATE ?auto_16399 ?auto_16389 ?auto_16390 )
      ( MAKE-1CRATE-VERIFY ?auto_16389 ?auto_16390 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16405 - SURFACE
      ?auto_16406 - SURFACE
      ?auto_16407 - SURFACE
    )
    :vars
    (
      ?auto_16418 - HOIST
      ?auto_16413 - PLACE
      ?auto_16408 - PLACE
      ?auto_16414 - HOIST
      ?auto_16415 - SURFACE
      ?auto_16416 - PLACE
      ?auto_16419 - HOIST
      ?auto_16412 - SURFACE
      ?auto_16417 - SURFACE
      ?auto_16411 - PLACE
      ?auto_16420 - HOIST
      ?auto_16409 - SURFACE
      ?auto_16410 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16418 ?auto_16413 ) ( IS-CRATE ?auto_16407 ) ( not ( = ?auto_16406 ?auto_16407 ) ) ( not ( = ?auto_16405 ?auto_16406 ) ) ( not ( = ?auto_16405 ?auto_16407 ) ) ( not ( = ?auto_16408 ?auto_16413 ) ) ( HOIST-AT ?auto_16414 ?auto_16408 ) ( not ( = ?auto_16418 ?auto_16414 ) ) ( AVAILABLE ?auto_16414 ) ( SURFACE-AT ?auto_16407 ?auto_16408 ) ( ON ?auto_16407 ?auto_16415 ) ( CLEAR ?auto_16407 ) ( not ( = ?auto_16406 ?auto_16415 ) ) ( not ( = ?auto_16407 ?auto_16415 ) ) ( not ( = ?auto_16405 ?auto_16415 ) ) ( IS-CRATE ?auto_16406 ) ( not ( = ?auto_16416 ?auto_16413 ) ) ( not ( = ?auto_16408 ?auto_16416 ) ) ( HOIST-AT ?auto_16419 ?auto_16416 ) ( not ( = ?auto_16418 ?auto_16419 ) ) ( not ( = ?auto_16414 ?auto_16419 ) ) ( AVAILABLE ?auto_16419 ) ( SURFACE-AT ?auto_16406 ?auto_16416 ) ( ON ?auto_16406 ?auto_16412 ) ( CLEAR ?auto_16406 ) ( not ( = ?auto_16406 ?auto_16412 ) ) ( not ( = ?auto_16407 ?auto_16412 ) ) ( not ( = ?auto_16405 ?auto_16412 ) ) ( not ( = ?auto_16415 ?auto_16412 ) ) ( SURFACE-AT ?auto_16417 ?auto_16413 ) ( CLEAR ?auto_16417 ) ( IS-CRATE ?auto_16405 ) ( not ( = ?auto_16417 ?auto_16405 ) ) ( not ( = ?auto_16406 ?auto_16417 ) ) ( not ( = ?auto_16407 ?auto_16417 ) ) ( not ( = ?auto_16415 ?auto_16417 ) ) ( not ( = ?auto_16412 ?auto_16417 ) ) ( AVAILABLE ?auto_16418 ) ( not ( = ?auto_16411 ?auto_16413 ) ) ( not ( = ?auto_16408 ?auto_16411 ) ) ( not ( = ?auto_16416 ?auto_16411 ) ) ( HOIST-AT ?auto_16420 ?auto_16411 ) ( not ( = ?auto_16418 ?auto_16420 ) ) ( not ( = ?auto_16414 ?auto_16420 ) ) ( not ( = ?auto_16419 ?auto_16420 ) ) ( AVAILABLE ?auto_16420 ) ( SURFACE-AT ?auto_16405 ?auto_16411 ) ( ON ?auto_16405 ?auto_16409 ) ( CLEAR ?auto_16405 ) ( not ( = ?auto_16406 ?auto_16409 ) ) ( not ( = ?auto_16407 ?auto_16409 ) ) ( not ( = ?auto_16405 ?auto_16409 ) ) ( not ( = ?auto_16415 ?auto_16409 ) ) ( not ( = ?auto_16412 ?auto_16409 ) ) ( not ( = ?auto_16417 ?auto_16409 ) ) ( TRUCK-AT ?auto_16410 ?auto_16413 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16406 ?auto_16407 )
      ( MAKE-2CRATE-VERIFY ?auto_16405 ?auto_16406 ?auto_16407 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16421 - SURFACE
      ?auto_16422 - SURFACE
      ?auto_16423 - SURFACE
      ?auto_16424 - SURFACE
    )
    :vars
    (
      ?auto_16426 - HOIST
      ?auto_16435 - PLACE
      ?auto_16431 - PLACE
      ?auto_16432 - HOIST
      ?auto_16429 - SURFACE
      ?auto_16425 - PLACE
      ?auto_16428 - HOIST
      ?auto_16430 - SURFACE
      ?auto_16436 - PLACE
      ?auto_16433 - HOIST
      ?auto_16427 - SURFACE
      ?auto_16434 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16426 ?auto_16435 ) ( IS-CRATE ?auto_16424 ) ( not ( = ?auto_16423 ?auto_16424 ) ) ( not ( = ?auto_16422 ?auto_16423 ) ) ( not ( = ?auto_16422 ?auto_16424 ) ) ( not ( = ?auto_16431 ?auto_16435 ) ) ( HOIST-AT ?auto_16432 ?auto_16431 ) ( not ( = ?auto_16426 ?auto_16432 ) ) ( AVAILABLE ?auto_16432 ) ( SURFACE-AT ?auto_16424 ?auto_16431 ) ( ON ?auto_16424 ?auto_16429 ) ( CLEAR ?auto_16424 ) ( not ( = ?auto_16423 ?auto_16429 ) ) ( not ( = ?auto_16424 ?auto_16429 ) ) ( not ( = ?auto_16422 ?auto_16429 ) ) ( IS-CRATE ?auto_16423 ) ( not ( = ?auto_16425 ?auto_16435 ) ) ( not ( = ?auto_16431 ?auto_16425 ) ) ( HOIST-AT ?auto_16428 ?auto_16425 ) ( not ( = ?auto_16426 ?auto_16428 ) ) ( not ( = ?auto_16432 ?auto_16428 ) ) ( AVAILABLE ?auto_16428 ) ( SURFACE-AT ?auto_16423 ?auto_16425 ) ( ON ?auto_16423 ?auto_16430 ) ( CLEAR ?auto_16423 ) ( not ( = ?auto_16423 ?auto_16430 ) ) ( not ( = ?auto_16424 ?auto_16430 ) ) ( not ( = ?auto_16422 ?auto_16430 ) ) ( not ( = ?auto_16429 ?auto_16430 ) ) ( SURFACE-AT ?auto_16421 ?auto_16435 ) ( CLEAR ?auto_16421 ) ( IS-CRATE ?auto_16422 ) ( not ( = ?auto_16421 ?auto_16422 ) ) ( not ( = ?auto_16423 ?auto_16421 ) ) ( not ( = ?auto_16424 ?auto_16421 ) ) ( not ( = ?auto_16429 ?auto_16421 ) ) ( not ( = ?auto_16430 ?auto_16421 ) ) ( AVAILABLE ?auto_16426 ) ( not ( = ?auto_16436 ?auto_16435 ) ) ( not ( = ?auto_16431 ?auto_16436 ) ) ( not ( = ?auto_16425 ?auto_16436 ) ) ( HOIST-AT ?auto_16433 ?auto_16436 ) ( not ( = ?auto_16426 ?auto_16433 ) ) ( not ( = ?auto_16432 ?auto_16433 ) ) ( not ( = ?auto_16428 ?auto_16433 ) ) ( AVAILABLE ?auto_16433 ) ( SURFACE-AT ?auto_16422 ?auto_16436 ) ( ON ?auto_16422 ?auto_16427 ) ( CLEAR ?auto_16422 ) ( not ( = ?auto_16423 ?auto_16427 ) ) ( not ( = ?auto_16424 ?auto_16427 ) ) ( not ( = ?auto_16422 ?auto_16427 ) ) ( not ( = ?auto_16429 ?auto_16427 ) ) ( not ( = ?auto_16430 ?auto_16427 ) ) ( not ( = ?auto_16421 ?auto_16427 ) ) ( TRUCK-AT ?auto_16434 ?auto_16435 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16422 ?auto_16423 ?auto_16424 )
      ( MAKE-3CRATE-VERIFY ?auto_16421 ?auto_16422 ?auto_16423 ?auto_16424 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16451 - SURFACE
      ?auto_16452 - SURFACE
    )
    :vars
    (
      ?auto_16453 - HOIST
      ?auto_16454 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16453 ?auto_16454 ) ( SURFACE-AT ?auto_16451 ?auto_16454 ) ( CLEAR ?auto_16451 ) ( LIFTING ?auto_16453 ?auto_16452 ) ( IS-CRATE ?auto_16452 ) ( not ( = ?auto_16451 ?auto_16452 ) ) )
    :subtasks
    ( ( !DROP ?auto_16453 ?auto_16452 ?auto_16451 ?auto_16454 )
      ( MAKE-1CRATE-VERIFY ?auto_16451 ?auto_16452 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16455 - SURFACE
      ?auto_16456 - SURFACE
      ?auto_16457 - SURFACE
    )
    :vars
    (
      ?auto_16459 - HOIST
      ?auto_16458 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16459 ?auto_16458 ) ( SURFACE-AT ?auto_16456 ?auto_16458 ) ( CLEAR ?auto_16456 ) ( LIFTING ?auto_16459 ?auto_16457 ) ( IS-CRATE ?auto_16457 ) ( not ( = ?auto_16456 ?auto_16457 ) ) ( ON ?auto_16456 ?auto_16455 ) ( not ( = ?auto_16455 ?auto_16456 ) ) ( not ( = ?auto_16455 ?auto_16457 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16456 ?auto_16457 )
      ( MAKE-2CRATE-VERIFY ?auto_16455 ?auto_16456 ?auto_16457 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16460 - SURFACE
      ?auto_16461 - SURFACE
      ?auto_16462 - SURFACE
      ?auto_16463 - SURFACE
    )
    :vars
    (
      ?auto_16465 - HOIST
      ?auto_16464 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16465 ?auto_16464 ) ( SURFACE-AT ?auto_16462 ?auto_16464 ) ( CLEAR ?auto_16462 ) ( LIFTING ?auto_16465 ?auto_16463 ) ( IS-CRATE ?auto_16463 ) ( not ( = ?auto_16462 ?auto_16463 ) ) ( ON ?auto_16461 ?auto_16460 ) ( ON ?auto_16462 ?auto_16461 ) ( not ( = ?auto_16460 ?auto_16461 ) ) ( not ( = ?auto_16460 ?auto_16462 ) ) ( not ( = ?auto_16460 ?auto_16463 ) ) ( not ( = ?auto_16461 ?auto_16462 ) ) ( not ( = ?auto_16461 ?auto_16463 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16462 ?auto_16463 )
      ( MAKE-3CRATE-VERIFY ?auto_16460 ?auto_16461 ?auto_16462 ?auto_16463 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16466 - SURFACE
      ?auto_16467 - SURFACE
      ?auto_16468 - SURFACE
      ?auto_16469 - SURFACE
      ?auto_16470 - SURFACE
    )
    :vars
    (
      ?auto_16472 - HOIST
      ?auto_16471 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16472 ?auto_16471 ) ( SURFACE-AT ?auto_16469 ?auto_16471 ) ( CLEAR ?auto_16469 ) ( LIFTING ?auto_16472 ?auto_16470 ) ( IS-CRATE ?auto_16470 ) ( not ( = ?auto_16469 ?auto_16470 ) ) ( ON ?auto_16467 ?auto_16466 ) ( ON ?auto_16468 ?auto_16467 ) ( ON ?auto_16469 ?auto_16468 ) ( not ( = ?auto_16466 ?auto_16467 ) ) ( not ( = ?auto_16466 ?auto_16468 ) ) ( not ( = ?auto_16466 ?auto_16469 ) ) ( not ( = ?auto_16466 ?auto_16470 ) ) ( not ( = ?auto_16467 ?auto_16468 ) ) ( not ( = ?auto_16467 ?auto_16469 ) ) ( not ( = ?auto_16467 ?auto_16470 ) ) ( not ( = ?auto_16468 ?auto_16469 ) ) ( not ( = ?auto_16468 ?auto_16470 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16469 ?auto_16470 )
      ( MAKE-4CRATE-VERIFY ?auto_16466 ?auto_16467 ?auto_16468 ?auto_16469 ?auto_16470 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16473 - SURFACE
      ?auto_16474 - SURFACE
    )
    :vars
    (
      ?auto_16476 - HOIST
      ?auto_16475 - PLACE
      ?auto_16477 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16476 ?auto_16475 ) ( SURFACE-AT ?auto_16473 ?auto_16475 ) ( CLEAR ?auto_16473 ) ( IS-CRATE ?auto_16474 ) ( not ( = ?auto_16473 ?auto_16474 ) ) ( TRUCK-AT ?auto_16477 ?auto_16475 ) ( AVAILABLE ?auto_16476 ) ( IN ?auto_16474 ?auto_16477 ) )
    :subtasks
    ( ( !UNLOAD ?auto_16476 ?auto_16474 ?auto_16477 ?auto_16475 )
      ( MAKE-1CRATE ?auto_16473 ?auto_16474 )
      ( MAKE-1CRATE-VERIFY ?auto_16473 ?auto_16474 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16478 - SURFACE
      ?auto_16479 - SURFACE
      ?auto_16480 - SURFACE
    )
    :vars
    (
      ?auto_16483 - HOIST
      ?auto_16481 - PLACE
      ?auto_16482 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16483 ?auto_16481 ) ( SURFACE-AT ?auto_16479 ?auto_16481 ) ( CLEAR ?auto_16479 ) ( IS-CRATE ?auto_16480 ) ( not ( = ?auto_16479 ?auto_16480 ) ) ( TRUCK-AT ?auto_16482 ?auto_16481 ) ( AVAILABLE ?auto_16483 ) ( IN ?auto_16480 ?auto_16482 ) ( ON ?auto_16479 ?auto_16478 ) ( not ( = ?auto_16478 ?auto_16479 ) ) ( not ( = ?auto_16478 ?auto_16480 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16479 ?auto_16480 )
      ( MAKE-2CRATE-VERIFY ?auto_16478 ?auto_16479 ?auto_16480 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16484 - SURFACE
      ?auto_16485 - SURFACE
      ?auto_16486 - SURFACE
      ?auto_16487 - SURFACE
    )
    :vars
    (
      ?auto_16490 - HOIST
      ?auto_16489 - PLACE
      ?auto_16488 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16490 ?auto_16489 ) ( SURFACE-AT ?auto_16486 ?auto_16489 ) ( CLEAR ?auto_16486 ) ( IS-CRATE ?auto_16487 ) ( not ( = ?auto_16486 ?auto_16487 ) ) ( TRUCK-AT ?auto_16488 ?auto_16489 ) ( AVAILABLE ?auto_16490 ) ( IN ?auto_16487 ?auto_16488 ) ( ON ?auto_16486 ?auto_16485 ) ( not ( = ?auto_16485 ?auto_16486 ) ) ( not ( = ?auto_16485 ?auto_16487 ) ) ( ON ?auto_16485 ?auto_16484 ) ( not ( = ?auto_16484 ?auto_16485 ) ) ( not ( = ?auto_16484 ?auto_16486 ) ) ( not ( = ?auto_16484 ?auto_16487 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16485 ?auto_16486 ?auto_16487 )
      ( MAKE-3CRATE-VERIFY ?auto_16484 ?auto_16485 ?auto_16486 ?auto_16487 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16491 - SURFACE
      ?auto_16492 - SURFACE
      ?auto_16493 - SURFACE
      ?auto_16494 - SURFACE
      ?auto_16495 - SURFACE
    )
    :vars
    (
      ?auto_16498 - HOIST
      ?auto_16497 - PLACE
      ?auto_16496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16498 ?auto_16497 ) ( SURFACE-AT ?auto_16494 ?auto_16497 ) ( CLEAR ?auto_16494 ) ( IS-CRATE ?auto_16495 ) ( not ( = ?auto_16494 ?auto_16495 ) ) ( TRUCK-AT ?auto_16496 ?auto_16497 ) ( AVAILABLE ?auto_16498 ) ( IN ?auto_16495 ?auto_16496 ) ( ON ?auto_16494 ?auto_16493 ) ( not ( = ?auto_16493 ?auto_16494 ) ) ( not ( = ?auto_16493 ?auto_16495 ) ) ( ON ?auto_16492 ?auto_16491 ) ( ON ?auto_16493 ?auto_16492 ) ( not ( = ?auto_16491 ?auto_16492 ) ) ( not ( = ?auto_16491 ?auto_16493 ) ) ( not ( = ?auto_16491 ?auto_16494 ) ) ( not ( = ?auto_16491 ?auto_16495 ) ) ( not ( = ?auto_16492 ?auto_16493 ) ) ( not ( = ?auto_16492 ?auto_16494 ) ) ( not ( = ?auto_16492 ?auto_16495 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16493 ?auto_16494 ?auto_16495 )
      ( MAKE-4CRATE-VERIFY ?auto_16491 ?auto_16492 ?auto_16493 ?auto_16494 ?auto_16495 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16499 - SURFACE
      ?auto_16500 - SURFACE
    )
    :vars
    (
      ?auto_16504 - HOIST
      ?auto_16503 - PLACE
      ?auto_16501 - TRUCK
      ?auto_16502 - SURFACE
      ?auto_16505 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16504 ?auto_16503 ) ( SURFACE-AT ?auto_16499 ?auto_16503 ) ( CLEAR ?auto_16499 ) ( IS-CRATE ?auto_16500 ) ( not ( = ?auto_16499 ?auto_16500 ) ) ( AVAILABLE ?auto_16504 ) ( IN ?auto_16500 ?auto_16501 ) ( ON ?auto_16499 ?auto_16502 ) ( not ( = ?auto_16502 ?auto_16499 ) ) ( not ( = ?auto_16502 ?auto_16500 ) ) ( TRUCK-AT ?auto_16501 ?auto_16505 ) ( not ( = ?auto_16505 ?auto_16503 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16501 ?auto_16505 ?auto_16503 )
      ( MAKE-2CRATE ?auto_16502 ?auto_16499 ?auto_16500 )
      ( MAKE-1CRATE-VERIFY ?auto_16499 ?auto_16500 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16506 - SURFACE
      ?auto_16507 - SURFACE
      ?auto_16508 - SURFACE
    )
    :vars
    (
      ?auto_16512 - HOIST
      ?auto_16511 - PLACE
      ?auto_16509 - TRUCK
      ?auto_16510 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16512 ?auto_16511 ) ( SURFACE-AT ?auto_16507 ?auto_16511 ) ( CLEAR ?auto_16507 ) ( IS-CRATE ?auto_16508 ) ( not ( = ?auto_16507 ?auto_16508 ) ) ( AVAILABLE ?auto_16512 ) ( IN ?auto_16508 ?auto_16509 ) ( ON ?auto_16507 ?auto_16506 ) ( not ( = ?auto_16506 ?auto_16507 ) ) ( not ( = ?auto_16506 ?auto_16508 ) ) ( TRUCK-AT ?auto_16509 ?auto_16510 ) ( not ( = ?auto_16510 ?auto_16511 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16507 ?auto_16508 )
      ( MAKE-2CRATE-VERIFY ?auto_16506 ?auto_16507 ?auto_16508 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16513 - SURFACE
      ?auto_16514 - SURFACE
      ?auto_16515 - SURFACE
      ?auto_16516 - SURFACE
    )
    :vars
    (
      ?auto_16517 - HOIST
      ?auto_16519 - PLACE
      ?auto_16520 - TRUCK
      ?auto_16518 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16517 ?auto_16519 ) ( SURFACE-AT ?auto_16515 ?auto_16519 ) ( CLEAR ?auto_16515 ) ( IS-CRATE ?auto_16516 ) ( not ( = ?auto_16515 ?auto_16516 ) ) ( AVAILABLE ?auto_16517 ) ( IN ?auto_16516 ?auto_16520 ) ( ON ?auto_16515 ?auto_16514 ) ( not ( = ?auto_16514 ?auto_16515 ) ) ( not ( = ?auto_16514 ?auto_16516 ) ) ( TRUCK-AT ?auto_16520 ?auto_16518 ) ( not ( = ?auto_16518 ?auto_16519 ) ) ( ON ?auto_16514 ?auto_16513 ) ( not ( = ?auto_16513 ?auto_16514 ) ) ( not ( = ?auto_16513 ?auto_16515 ) ) ( not ( = ?auto_16513 ?auto_16516 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16514 ?auto_16515 ?auto_16516 )
      ( MAKE-3CRATE-VERIFY ?auto_16513 ?auto_16514 ?auto_16515 ?auto_16516 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16521 - SURFACE
      ?auto_16522 - SURFACE
      ?auto_16523 - SURFACE
      ?auto_16524 - SURFACE
      ?auto_16525 - SURFACE
    )
    :vars
    (
      ?auto_16526 - HOIST
      ?auto_16528 - PLACE
      ?auto_16529 - TRUCK
      ?auto_16527 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16526 ?auto_16528 ) ( SURFACE-AT ?auto_16524 ?auto_16528 ) ( CLEAR ?auto_16524 ) ( IS-CRATE ?auto_16525 ) ( not ( = ?auto_16524 ?auto_16525 ) ) ( AVAILABLE ?auto_16526 ) ( IN ?auto_16525 ?auto_16529 ) ( ON ?auto_16524 ?auto_16523 ) ( not ( = ?auto_16523 ?auto_16524 ) ) ( not ( = ?auto_16523 ?auto_16525 ) ) ( TRUCK-AT ?auto_16529 ?auto_16527 ) ( not ( = ?auto_16527 ?auto_16528 ) ) ( ON ?auto_16522 ?auto_16521 ) ( ON ?auto_16523 ?auto_16522 ) ( not ( = ?auto_16521 ?auto_16522 ) ) ( not ( = ?auto_16521 ?auto_16523 ) ) ( not ( = ?auto_16521 ?auto_16524 ) ) ( not ( = ?auto_16521 ?auto_16525 ) ) ( not ( = ?auto_16522 ?auto_16523 ) ) ( not ( = ?auto_16522 ?auto_16524 ) ) ( not ( = ?auto_16522 ?auto_16525 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16523 ?auto_16524 ?auto_16525 )
      ( MAKE-4CRATE-VERIFY ?auto_16521 ?auto_16522 ?auto_16523 ?auto_16524 ?auto_16525 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16530 - SURFACE
      ?auto_16531 - SURFACE
    )
    :vars
    (
      ?auto_16532 - HOIST
      ?auto_16534 - PLACE
      ?auto_16535 - SURFACE
      ?auto_16536 - TRUCK
      ?auto_16533 - PLACE
      ?auto_16537 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16532 ?auto_16534 ) ( SURFACE-AT ?auto_16530 ?auto_16534 ) ( CLEAR ?auto_16530 ) ( IS-CRATE ?auto_16531 ) ( not ( = ?auto_16530 ?auto_16531 ) ) ( AVAILABLE ?auto_16532 ) ( ON ?auto_16530 ?auto_16535 ) ( not ( = ?auto_16535 ?auto_16530 ) ) ( not ( = ?auto_16535 ?auto_16531 ) ) ( TRUCK-AT ?auto_16536 ?auto_16533 ) ( not ( = ?auto_16533 ?auto_16534 ) ) ( HOIST-AT ?auto_16537 ?auto_16533 ) ( LIFTING ?auto_16537 ?auto_16531 ) ( not ( = ?auto_16532 ?auto_16537 ) ) )
    :subtasks
    ( ( !LOAD ?auto_16537 ?auto_16531 ?auto_16536 ?auto_16533 )
      ( MAKE-2CRATE ?auto_16535 ?auto_16530 ?auto_16531 )
      ( MAKE-1CRATE-VERIFY ?auto_16530 ?auto_16531 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16538 - SURFACE
      ?auto_16539 - SURFACE
      ?auto_16540 - SURFACE
    )
    :vars
    (
      ?auto_16543 - HOIST
      ?auto_16542 - PLACE
      ?auto_16541 - TRUCK
      ?auto_16544 - PLACE
      ?auto_16545 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16543 ?auto_16542 ) ( SURFACE-AT ?auto_16539 ?auto_16542 ) ( CLEAR ?auto_16539 ) ( IS-CRATE ?auto_16540 ) ( not ( = ?auto_16539 ?auto_16540 ) ) ( AVAILABLE ?auto_16543 ) ( ON ?auto_16539 ?auto_16538 ) ( not ( = ?auto_16538 ?auto_16539 ) ) ( not ( = ?auto_16538 ?auto_16540 ) ) ( TRUCK-AT ?auto_16541 ?auto_16544 ) ( not ( = ?auto_16544 ?auto_16542 ) ) ( HOIST-AT ?auto_16545 ?auto_16544 ) ( LIFTING ?auto_16545 ?auto_16540 ) ( not ( = ?auto_16543 ?auto_16545 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16539 ?auto_16540 )
      ( MAKE-2CRATE-VERIFY ?auto_16538 ?auto_16539 ?auto_16540 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16546 - SURFACE
      ?auto_16547 - SURFACE
      ?auto_16548 - SURFACE
      ?auto_16549 - SURFACE
    )
    :vars
    (
      ?auto_16550 - HOIST
      ?auto_16552 - PLACE
      ?auto_16554 - TRUCK
      ?auto_16551 - PLACE
      ?auto_16553 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16550 ?auto_16552 ) ( SURFACE-AT ?auto_16548 ?auto_16552 ) ( CLEAR ?auto_16548 ) ( IS-CRATE ?auto_16549 ) ( not ( = ?auto_16548 ?auto_16549 ) ) ( AVAILABLE ?auto_16550 ) ( ON ?auto_16548 ?auto_16547 ) ( not ( = ?auto_16547 ?auto_16548 ) ) ( not ( = ?auto_16547 ?auto_16549 ) ) ( TRUCK-AT ?auto_16554 ?auto_16551 ) ( not ( = ?auto_16551 ?auto_16552 ) ) ( HOIST-AT ?auto_16553 ?auto_16551 ) ( LIFTING ?auto_16553 ?auto_16549 ) ( not ( = ?auto_16550 ?auto_16553 ) ) ( ON ?auto_16547 ?auto_16546 ) ( not ( = ?auto_16546 ?auto_16547 ) ) ( not ( = ?auto_16546 ?auto_16548 ) ) ( not ( = ?auto_16546 ?auto_16549 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16547 ?auto_16548 ?auto_16549 )
      ( MAKE-3CRATE-VERIFY ?auto_16546 ?auto_16547 ?auto_16548 ?auto_16549 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16555 - SURFACE
      ?auto_16556 - SURFACE
      ?auto_16557 - SURFACE
      ?auto_16558 - SURFACE
      ?auto_16559 - SURFACE
    )
    :vars
    (
      ?auto_16560 - HOIST
      ?auto_16562 - PLACE
      ?auto_16564 - TRUCK
      ?auto_16561 - PLACE
      ?auto_16563 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16560 ?auto_16562 ) ( SURFACE-AT ?auto_16558 ?auto_16562 ) ( CLEAR ?auto_16558 ) ( IS-CRATE ?auto_16559 ) ( not ( = ?auto_16558 ?auto_16559 ) ) ( AVAILABLE ?auto_16560 ) ( ON ?auto_16558 ?auto_16557 ) ( not ( = ?auto_16557 ?auto_16558 ) ) ( not ( = ?auto_16557 ?auto_16559 ) ) ( TRUCK-AT ?auto_16564 ?auto_16561 ) ( not ( = ?auto_16561 ?auto_16562 ) ) ( HOIST-AT ?auto_16563 ?auto_16561 ) ( LIFTING ?auto_16563 ?auto_16559 ) ( not ( = ?auto_16560 ?auto_16563 ) ) ( ON ?auto_16556 ?auto_16555 ) ( ON ?auto_16557 ?auto_16556 ) ( not ( = ?auto_16555 ?auto_16556 ) ) ( not ( = ?auto_16555 ?auto_16557 ) ) ( not ( = ?auto_16555 ?auto_16558 ) ) ( not ( = ?auto_16555 ?auto_16559 ) ) ( not ( = ?auto_16556 ?auto_16557 ) ) ( not ( = ?auto_16556 ?auto_16558 ) ) ( not ( = ?auto_16556 ?auto_16559 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16557 ?auto_16558 ?auto_16559 )
      ( MAKE-4CRATE-VERIFY ?auto_16555 ?auto_16556 ?auto_16557 ?auto_16558 ?auto_16559 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16565 - SURFACE
      ?auto_16566 - SURFACE
    )
    :vars
    (
      ?auto_16568 - HOIST
      ?auto_16570 - PLACE
      ?auto_16567 - SURFACE
      ?auto_16572 - TRUCK
      ?auto_16569 - PLACE
      ?auto_16571 - HOIST
      ?auto_16573 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16568 ?auto_16570 ) ( SURFACE-AT ?auto_16565 ?auto_16570 ) ( CLEAR ?auto_16565 ) ( IS-CRATE ?auto_16566 ) ( not ( = ?auto_16565 ?auto_16566 ) ) ( AVAILABLE ?auto_16568 ) ( ON ?auto_16565 ?auto_16567 ) ( not ( = ?auto_16567 ?auto_16565 ) ) ( not ( = ?auto_16567 ?auto_16566 ) ) ( TRUCK-AT ?auto_16572 ?auto_16569 ) ( not ( = ?auto_16569 ?auto_16570 ) ) ( HOIST-AT ?auto_16571 ?auto_16569 ) ( not ( = ?auto_16568 ?auto_16571 ) ) ( AVAILABLE ?auto_16571 ) ( SURFACE-AT ?auto_16566 ?auto_16569 ) ( ON ?auto_16566 ?auto_16573 ) ( CLEAR ?auto_16566 ) ( not ( = ?auto_16565 ?auto_16573 ) ) ( not ( = ?auto_16566 ?auto_16573 ) ) ( not ( = ?auto_16567 ?auto_16573 ) ) )
    :subtasks
    ( ( !LIFT ?auto_16571 ?auto_16566 ?auto_16573 ?auto_16569 )
      ( MAKE-2CRATE ?auto_16567 ?auto_16565 ?auto_16566 )
      ( MAKE-1CRATE-VERIFY ?auto_16565 ?auto_16566 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16574 - SURFACE
      ?auto_16575 - SURFACE
      ?auto_16576 - SURFACE
    )
    :vars
    (
      ?auto_16579 - HOIST
      ?auto_16581 - PLACE
      ?auto_16580 - TRUCK
      ?auto_16578 - PLACE
      ?auto_16577 - HOIST
      ?auto_16582 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16579 ?auto_16581 ) ( SURFACE-AT ?auto_16575 ?auto_16581 ) ( CLEAR ?auto_16575 ) ( IS-CRATE ?auto_16576 ) ( not ( = ?auto_16575 ?auto_16576 ) ) ( AVAILABLE ?auto_16579 ) ( ON ?auto_16575 ?auto_16574 ) ( not ( = ?auto_16574 ?auto_16575 ) ) ( not ( = ?auto_16574 ?auto_16576 ) ) ( TRUCK-AT ?auto_16580 ?auto_16578 ) ( not ( = ?auto_16578 ?auto_16581 ) ) ( HOIST-AT ?auto_16577 ?auto_16578 ) ( not ( = ?auto_16579 ?auto_16577 ) ) ( AVAILABLE ?auto_16577 ) ( SURFACE-AT ?auto_16576 ?auto_16578 ) ( ON ?auto_16576 ?auto_16582 ) ( CLEAR ?auto_16576 ) ( not ( = ?auto_16575 ?auto_16582 ) ) ( not ( = ?auto_16576 ?auto_16582 ) ) ( not ( = ?auto_16574 ?auto_16582 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16575 ?auto_16576 )
      ( MAKE-2CRATE-VERIFY ?auto_16574 ?auto_16575 ?auto_16576 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16583 - SURFACE
      ?auto_16584 - SURFACE
      ?auto_16585 - SURFACE
      ?auto_16586 - SURFACE
    )
    :vars
    (
      ?auto_16591 - HOIST
      ?auto_16588 - PLACE
      ?auto_16587 - TRUCK
      ?auto_16589 - PLACE
      ?auto_16590 - HOIST
      ?auto_16592 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16591 ?auto_16588 ) ( SURFACE-AT ?auto_16585 ?auto_16588 ) ( CLEAR ?auto_16585 ) ( IS-CRATE ?auto_16586 ) ( not ( = ?auto_16585 ?auto_16586 ) ) ( AVAILABLE ?auto_16591 ) ( ON ?auto_16585 ?auto_16584 ) ( not ( = ?auto_16584 ?auto_16585 ) ) ( not ( = ?auto_16584 ?auto_16586 ) ) ( TRUCK-AT ?auto_16587 ?auto_16589 ) ( not ( = ?auto_16589 ?auto_16588 ) ) ( HOIST-AT ?auto_16590 ?auto_16589 ) ( not ( = ?auto_16591 ?auto_16590 ) ) ( AVAILABLE ?auto_16590 ) ( SURFACE-AT ?auto_16586 ?auto_16589 ) ( ON ?auto_16586 ?auto_16592 ) ( CLEAR ?auto_16586 ) ( not ( = ?auto_16585 ?auto_16592 ) ) ( not ( = ?auto_16586 ?auto_16592 ) ) ( not ( = ?auto_16584 ?auto_16592 ) ) ( ON ?auto_16584 ?auto_16583 ) ( not ( = ?auto_16583 ?auto_16584 ) ) ( not ( = ?auto_16583 ?auto_16585 ) ) ( not ( = ?auto_16583 ?auto_16586 ) ) ( not ( = ?auto_16583 ?auto_16592 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16584 ?auto_16585 ?auto_16586 )
      ( MAKE-3CRATE-VERIFY ?auto_16583 ?auto_16584 ?auto_16585 ?auto_16586 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16593 - SURFACE
      ?auto_16594 - SURFACE
      ?auto_16595 - SURFACE
      ?auto_16596 - SURFACE
      ?auto_16597 - SURFACE
    )
    :vars
    (
      ?auto_16602 - HOIST
      ?auto_16599 - PLACE
      ?auto_16598 - TRUCK
      ?auto_16600 - PLACE
      ?auto_16601 - HOIST
      ?auto_16603 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16602 ?auto_16599 ) ( SURFACE-AT ?auto_16596 ?auto_16599 ) ( CLEAR ?auto_16596 ) ( IS-CRATE ?auto_16597 ) ( not ( = ?auto_16596 ?auto_16597 ) ) ( AVAILABLE ?auto_16602 ) ( ON ?auto_16596 ?auto_16595 ) ( not ( = ?auto_16595 ?auto_16596 ) ) ( not ( = ?auto_16595 ?auto_16597 ) ) ( TRUCK-AT ?auto_16598 ?auto_16600 ) ( not ( = ?auto_16600 ?auto_16599 ) ) ( HOIST-AT ?auto_16601 ?auto_16600 ) ( not ( = ?auto_16602 ?auto_16601 ) ) ( AVAILABLE ?auto_16601 ) ( SURFACE-AT ?auto_16597 ?auto_16600 ) ( ON ?auto_16597 ?auto_16603 ) ( CLEAR ?auto_16597 ) ( not ( = ?auto_16596 ?auto_16603 ) ) ( not ( = ?auto_16597 ?auto_16603 ) ) ( not ( = ?auto_16595 ?auto_16603 ) ) ( ON ?auto_16594 ?auto_16593 ) ( ON ?auto_16595 ?auto_16594 ) ( not ( = ?auto_16593 ?auto_16594 ) ) ( not ( = ?auto_16593 ?auto_16595 ) ) ( not ( = ?auto_16593 ?auto_16596 ) ) ( not ( = ?auto_16593 ?auto_16597 ) ) ( not ( = ?auto_16593 ?auto_16603 ) ) ( not ( = ?auto_16594 ?auto_16595 ) ) ( not ( = ?auto_16594 ?auto_16596 ) ) ( not ( = ?auto_16594 ?auto_16597 ) ) ( not ( = ?auto_16594 ?auto_16603 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16595 ?auto_16596 ?auto_16597 )
      ( MAKE-4CRATE-VERIFY ?auto_16593 ?auto_16594 ?auto_16595 ?auto_16596 ?auto_16597 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16604 - SURFACE
      ?auto_16605 - SURFACE
    )
    :vars
    (
      ?auto_16610 - HOIST
      ?auto_16607 - PLACE
      ?auto_16612 - SURFACE
      ?auto_16608 - PLACE
      ?auto_16609 - HOIST
      ?auto_16611 - SURFACE
      ?auto_16606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16610 ?auto_16607 ) ( SURFACE-AT ?auto_16604 ?auto_16607 ) ( CLEAR ?auto_16604 ) ( IS-CRATE ?auto_16605 ) ( not ( = ?auto_16604 ?auto_16605 ) ) ( AVAILABLE ?auto_16610 ) ( ON ?auto_16604 ?auto_16612 ) ( not ( = ?auto_16612 ?auto_16604 ) ) ( not ( = ?auto_16612 ?auto_16605 ) ) ( not ( = ?auto_16608 ?auto_16607 ) ) ( HOIST-AT ?auto_16609 ?auto_16608 ) ( not ( = ?auto_16610 ?auto_16609 ) ) ( AVAILABLE ?auto_16609 ) ( SURFACE-AT ?auto_16605 ?auto_16608 ) ( ON ?auto_16605 ?auto_16611 ) ( CLEAR ?auto_16605 ) ( not ( = ?auto_16604 ?auto_16611 ) ) ( not ( = ?auto_16605 ?auto_16611 ) ) ( not ( = ?auto_16612 ?auto_16611 ) ) ( TRUCK-AT ?auto_16606 ?auto_16607 ) )
    :subtasks
    ( ( !DRIVE ?auto_16606 ?auto_16607 ?auto_16608 )
      ( MAKE-2CRATE ?auto_16612 ?auto_16604 ?auto_16605 )
      ( MAKE-1CRATE-VERIFY ?auto_16604 ?auto_16605 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16613 - SURFACE
      ?auto_16614 - SURFACE
      ?auto_16615 - SURFACE
    )
    :vars
    (
      ?auto_16619 - HOIST
      ?auto_16618 - PLACE
      ?auto_16621 - PLACE
      ?auto_16617 - HOIST
      ?auto_16620 - SURFACE
      ?auto_16616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16619 ?auto_16618 ) ( SURFACE-AT ?auto_16614 ?auto_16618 ) ( CLEAR ?auto_16614 ) ( IS-CRATE ?auto_16615 ) ( not ( = ?auto_16614 ?auto_16615 ) ) ( AVAILABLE ?auto_16619 ) ( ON ?auto_16614 ?auto_16613 ) ( not ( = ?auto_16613 ?auto_16614 ) ) ( not ( = ?auto_16613 ?auto_16615 ) ) ( not ( = ?auto_16621 ?auto_16618 ) ) ( HOIST-AT ?auto_16617 ?auto_16621 ) ( not ( = ?auto_16619 ?auto_16617 ) ) ( AVAILABLE ?auto_16617 ) ( SURFACE-AT ?auto_16615 ?auto_16621 ) ( ON ?auto_16615 ?auto_16620 ) ( CLEAR ?auto_16615 ) ( not ( = ?auto_16614 ?auto_16620 ) ) ( not ( = ?auto_16615 ?auto_16620 ) ) ( not ( = ?auto_16613 ?auto_16620 ) ) ( TRUCK-AT ?auto_16616 ?auto_16618 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16614 ?auto_16615 )
      ( MAKE-2CRATE-VERIFY ?auto_16613 ?auto_16614 ?auto_16615 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16622 - SURFACE
      ?auto_16623 - SURFACE
      ?auto_16624 - SURFACE
      ?auto_16625 - SURFACE
    )
    :vars
    (
      ?auto_16627 - HOIST
      ?auto_16630 - PLACE
      ?auto_16629 - PLACE
      ?auto_16628 - HOIST
      ?auto_16631 - SURFACE
      ?auto_16626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16627 ?auto_16630 ) ( SURFACE-AT ?auto_16624 ?auto_16630 ) ( CLEAR ?auto_16624 ) ( IS-CRATE ?auto_16625 ) ( not ( = ?auto_16624 ?auto_16625 ) ) ( AVAILABLE ?auto_16627 ) ( ON ?auto_16624 ?auto_16623 ) ( not ( = ?auto_16623 ?auto_16624 ) ) ( not ( = ?auto_16623 ?auto_16625 ) ) ( not ( = ?auto_16629 ?auto_16630 ) ) ( HOIST-AT ?auto_16628 ?auto_16629 ) ( not ( = ?auto_16627 ?auto_16628 ) ) ( AVAILABLE ?auto_16628 ) ( SURFACE-AT ?auto_16625 ?auto_16629 ) ( ON ?auto_16625 ?auto_16631 ) ( CLEAR ?auto_16625 ) ( not ( = ?auto_16624 ?auto_16631 ) ) ( not ( = ?auto_16625 ?auto_16631 ) ) ( not ( = ?auto_16623 ?auto_16631 ) ) ( TRUCK-AT ?auto_16626 ?auto_16630 ) ( ON ?auto_16623 ?auto_16622 ) ( not ( = ?auto_16622 ?auto_16623 ) ) ( not ( = ?auto_16622 ?auto_16624 ) ) ( not ( = ?auto_16622 ?auto_16625 ) ) ( not ( = ?auto_16622 ?auto_16631 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16623 ?auto_16624 ?auto_16625 )
      ( MAKE-3CRATE-VERIFY ?auto_16622 ?auto_16623 ?auto_16624 ?auto_16625 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16632 - SURFACE
      ?auto_16633 - SURFACE
      ?auto_16634 - SURFACE
      ?auto_16635 - SURFACE
      ?auto_16636 - SURFACE
    )
    :vars
    (
      ?auto_16638 - HOIST
      ?auto_16641 - PLACE
      ?auto_16640 - PLACE
      ?auto_16639 - HOIST
      ?auto_16642 - SURFACE
      ?auto_16637 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16638 ?auto_16641 ) ( SURFACE-AT ?auto_16635 ?auto_16641 ) ( CLEAR ?auto_16635 ) ( IS-CRATE ?auto_16636 ) ( not ( = ?auto_16635 ?auto_16636 ) ) ( AVAILABLE ?auto_16638 ) ( ON ?auto_16635 ?auto_16634 ) ( not ( = ?auto_16634 ?auto_16635 ) ) ( not ( = ?auto_16634 ?auto_16636 ) ) ( not ( = ?auto_16640 ?auto_16641 ) ) ( HOIST-AT ?auto_16639 ?auto_16640 ) ( not ( = ?auto_16638 ?auto_16639 ) ) ( AVAILABLE ?auto_16639 ) ( SURFACE-AT ?auto_16636 ?auto_16640 ) ( ON ?auto_16636 ?auto_16642 ) ( CLEAR ?auto_16636 ) ( not ( = ?auto_16635 ?auto_16642 ) ) ( not ( = ?auto_16636 ?auto_16642 ) ) ( not ( = ?auto_16634 ?auto_16642 ) ) ( TRUCK-AT ?auto_16637 ?auto_16641 ) ( ON ?auto_16633 ?auto_16632 ) ( ON ?auto_16634 ?auto_16633 ) ( not ( = ?auto_16632 ?auto_16633 ) ) ( not ( = ?auto_16632 ?auto_16634 ) ) ( not ( = ?auto_16632 ?auto_16635 ) ) ( not ( = ?auto_16632 ?auto_16636 ) ) ( not ( = ?auto_16632 ?auto_16642 ) ) ( not ( = ?auto_16633 ?auto_16634 ) ) ( not ( = ?auto_16633 ?auto_16635 ) ) ( not ( = ?auto_16633 ?auto_16636 ) ) ( not ( = ?auto_16633 ?auto_16642 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16634 ?auto_16635 ?auto_16636 )
      ( MAKE-4CRATE-VERIFY ?auto_16632 ?auto_16633 ?auto_16634 ?auto_16635 ?auto_16636 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16643 - SURFACE
      ?auto_16644 - SURFACE
    )
    :vars
    (
      ?auto_16646 - HOIST
      ?auto_16650 - PLACE
      ?auto_16648 - SURFACE
      ?auto_16649 - PLACE
      ?auto_16647 - HOIST
      ?auto_16651 - SURFACE
      ?auto_16645 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16646 ?auto_16650 ) ( IS-CRATE ?auto_16644 ) ( not ( = ?auto_16643 ?auto_16644 ) ) ( not ( = ?auto_16648 ?auto_16643 ) ) ( not ( = ?auto_16648 ?auto_16644 ) ) ( not ( = ?auto_16649 ?auto_16650 ) ) ( HOIST-AT ?auto_16647 ?auto_16649 ) ( not ( = ?auto_16646 ?auto_16647 ) ) ( AVAILABLE ?auto_16647 ) ( SURFACE-AT ?auto_16644 ?auto_16649 ) ( ON ?auto_16644 ?auto_16651 ) ( CLEAR ?auto_16644 ) ( not ( = ?auto_16643 ?auto_16651 ) ) ( not ( = ?auto_16644 ?auto_16651 ) ) ( not ( = ?auto_16648 ?auto_16651 ) ) ( TRUCK-AT ?auto_16645 ?auto_16650 ) ( SURFACE-AT ?auto_16648 ?auto_16650 ) ( CLEAR ?auto_16648 ) ( LIFTING ?auto_16646 ?auto_16643 ) ( IS-CRATE ?auto_16643 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16648 ?auto_16643 )
      ( MAKE-2CRATE ?auto_16648 ?auto_16643 ?auto_16644 )
      ( MAKE-1CRATE-VERIFY ?auto_16643 ?auto_16644 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16652 - SURFACE
      ?auto_16653 - SURFACE
      ?auto_16654 - SURFACE
    )
    :vars
    (
      ?auto_16655 - HOIST
      ?auto_16660 - PLACE
      ?auto_16656 - PLACE
      ?auto_16658 - HOIST
      ?auto_16657 - SURFACE
      ?auto_16659 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16655 ?auto_16660 ) ( IS-CRATE ?auto_16654 ) ( not ( = ?auto_16653 ?auto_16654 ) ) ( not ( = ?auto_16652 ?auto_16653 ) ) ( not ( = ?auto_16652 ?auto_16654 ) ) ( not ( = ?auto_16656 ?auto_16660 ) ) ( HOIST-AT ?auto_16658 ?auto_16656 ) ( not ( = ?auto_16655 ?auto_16658 ) ) ( AVAILABLE ?auto_16658 ) ( SURFACE-AT ?auto_16654 ?auto_16656 ) ( ON ?auto_16654 ?auto_16657 ) ( CLEAR ?auto_16654 ) ( not ( = ?auto_16653 ?auto_16657 ) ) ( not ( = ?auto_16654 ?auto_16657 ) ) ( not ( = ?auto_16652 ?auto_16657 ) ) ( TRUCK-AT ?auto_16659 ?auto_16660 ) ( SURFACE-AT ?auto_16652 ?auto_16660 ) ( CLEAR ?auto_16652 ) ( LIFTING ?auto_16655 ?auto_16653 ) ( IS-CRATE ?auto_16653 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16653 ?auto_16654 )
      ( MAKE-2CRATE-VERIFY ?auto_16652 ?auto_16653 ?auto_16654 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16661 - SURFACE
      ?auto_16662 - SURFACE
      ?auto_16663 - SURFACE
      ?auto_16664 - SURFACE
    )
    :vars
    (
      ?auto_16665 - HOIST
      ?auto_16666 - PLACE
      ?auto_16668 - PLACE
      ?auto_16667 - HOIST
      ?auto_16669 - SURFACE
      ?auto_16670 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16665 ?auto_16666 ) ( IS-CRATE ?auto_16664 ) ( not ( = ?auto_16663 ?auto_16664 ) ) ( not ( = ?auto_16662 ?auto_16663 ) ) ( not ( = ?auto_16662 ?auto_16664 ) ) ( not ( = ?auto_16668 ?auto_16666 ) ) ( HOIST-AT ?auto_16667 ?auto_16668 ) ( not ( = ?auto_16665 ?auto_16667 ) ) ( AVAILABLE ?auto_16667 ) ( SURFACE-AT ?auto_16664 ?auto_16668 ) ( ON ?auto_16664 ?auto_16669 ) ( CLEAR ?auto_16664 ) ( not ( = ?auto_16663 ?auto_16669 ) ) ( not ( = ?auto_16664 ?auto_16669 ) ) ( not ( = ?auto_16662 ?auto_16669 ) ) ( TRUCK-AT ?auto_16670 ?auto_16666 ) ( SURFACE-AT ?auto_16662 ?auto_16666 ) ( CLEAR ?auto_16662 ) ( LIFTING ?auto_16665 ?auto_16663 ) ( IS-CRATE ?auto_16663 ) ( ON ?auto_16662 ?auto_16661 ) ( not ( = ?auto_16661 ?auto_16662 ) ) ( not ( = ?auto_16661 ?auto_16663 ) ) ( not ( = ?auto_16661 ?auto_16664 ) ) ( not ( = ?auto_16661 ?auto_16669 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16662 ?auto_16663 ?auto_16664 )
      ( MAKE-3CRATE-VERIFY ?auto_16661 ?auto_16662 ?auto_16663 ?auto_16664 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16671 - SURFACE
      ?auto_16672 - SURFACE
      ?auto_16673 - SURFACE
      ?auto_16674 - SURFACE
      ?auto_16675 - SURFACE
    )
    :vars
    (
      ?auto_16676 - HOIST
      ?auto_16677 - PLACE
      ?auto_16679 - PLACE
      ?auto_16678 - HOIST
      ?auto_16680 - SURFACE
      ?auto_16681 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16676 ?auto_16677 ) ( IS-CRATE ?auto_16675 ) ( not ( = ?auto_16674 ?auto_16675 ) ) ( not ( = ?auto_16673 ?auto_16674 ) ) ( not ( = ?auto_16673 ?auto_16675 ) ) ( not ( = ?auto_16679 ?auto_16677 ) ) ( HOIST-AT ?auto_16678 ?auto_16679 ) ( not ( = ?auto_16676 ?auto_16678 ) ) ( AVAILABLE ?auto_16678 ) ( SURFACE-AT ?auto_16675 ?auto_16679 ) ( ON ?auto_16675 ?auto_16680 ) ( CLEAR ?auto_16675 ) ( not ( = ?auto_16674 ?auto_16680 ) ) ( not ( = ?auto_16675 ?auto_16680 ) ) ( not ( = ?auto_16673 ?auto_16680 ) ) ( TRUCK-AT ?auto_16681 ?auto_16677 ) ( SURFACE-AT ?auto_16673 ?auto_16677 ) ( CLEAR ?auto_16673 ) ( LIFTING ?auto_16676 ?auto_16674 ) ( IS-CRATE ?auto_16674 ) ( ON ?auto_16672 ?auto_16671 ) ( ON ?auto_16673 ?auto_16672 ) ( not ( = ?auto_16671 ?auto_16672 ) ) ( not ( = ?auto_16671 ?auto_16673 ) ) ( not ( = ?auto_16671 ?auto_16674 ) ) ( not ( = ?auto_16671 ?auto_16675 ) ) ( not ( = ?auto_16671 ?auto_16680 ) ) ( not ( = ?auto_16672 ?auto_16673 ) ) ( not ( = ?auto_16672 ?auto_16674 ) ) ( not ( = ?auto_16672 ?auto_16675 ) ) ( not ( = ?auto_16672 ?auto_16680 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16673 ?auto_16674 ?auto_16675 )
      ( MAKE-4CRATE-VERIFY ?auto_16671 ?auto_16672 ?auto_16673 ?auto_16674 ?auto_16675 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16682 - SURFACE
      ?auto_16683 - SURFACE
    )
    :vars
    (
      ?auto_16684 - HOIST
      ?auto_16685 - PLACE
      ?auto_16686 - SURFACE
      ?auto_16688 - PLACE
      ?auto_16687 - HOIST
      ?auto_16689 - SURFACE
      ?auto_16690 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16684 ?auto_16685 ) ( IS-CRATE ?auto_16683 ) ( not ( = ?auto_16682 ?auto_16683 ) ) ( not ( = ?auto_16686 ?auto_16682 ) ) ( not ( = ?auto_16686 ?auto_16683 ) ) ( not ( = ?auto_16688 ?auto_16685 ) ) ( HOIST-AT ?auto_16687 ?auto_16688 ) ( not ( = ?auto_16684 ?auto_16687 ) ) ( AVAILABLE ?auto_16687 ) ( SURFACE-AT ?auto_16683 ?auto_16688 ) ( ON ?auto_16683 ?auto_16689 ) ( CLEAR ?auto_16683 ) ( not ( = ?auto_16682 ?auto_16689 ) ) ( not ( = ?auto_16683 ?auto_16689 ) ) ( not ( = ?auto_16686 ?auto_16689 ) ) ( TRUCK-AT ?auto_16690 ?auto_16685 ) ( SURFACE-AT ?auto_16686 ?auto_16685 ) ( CLEAR ?auto_16686 ) ( IS-CRATE ?auto_16682 ) ( AVAILABLE ?auto_16684 ) ( IN ?auto_16682 ?auto_16690 ) )
    :subtasks
    ( ( !UNLOAD ?auto_16684 ?auto_16682 ?auto_16690 ?auto_16685 )
      ( MAKE-2CRATE ?auto_16686 ?auto_16682 ?auto_16683 )
      ( MAKE-1CRATE-VERIFY ?auto_16682 ?auto_16683 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16691 - SURFACE
      ?auto_16692 - SURFACE
      ?auto_16693 - SURFACE
    )
    :vars
    (
      ?auto_16698 - HOIST
      ?auto_16699 - PLACE
      ?auto_16697 - PLACE
      ?auto_16696 - HOIST
      ?auto_16695 - SURFACE
      ?auto_16694 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16698 ?auto_16699 ) ( IS-CRATE ?auto_16693 ) ( not ( = ?auto_16692 ?auto_16693 ) ) ( not ( = ?auto_16691 ?auto_16692 ) ) ( not ( = ?auto_16691 ?auto_16693 ) ) ( not ( = ?auto_16697 ?auto_16699 ) ) ( HOIST-AT ?auto_16696 ?auto_16697 ) ( not ( = ?auto_16698 ?auto_16696 ) ) ( AVAILABLE ?auto_16696 ) ( SURFACE-AT ?auto_16693 ?auto_16697 ) ( ON ?auto_16693 ?auto_16695 ) ( CLEAR ?auto_16693 ) ( not ( = ?auto_16692 ?auto_16695 ) ) ( not ( = ?auto_16693 ?auto_16695 ) ) ( not ( = ?auto_16691 ?auto_16695 ) ) ( TRUCK-AT ?auto_16694 ?auto_16699 ) ( SURFACE-AT ?auto_16691 ?auto_16699 ) ( CLEAR ?auto_16691 ) ( IS-CRATE ?auto_16692 ) ( AVAILABLE ?auto_16698 ) ( IN ?auto_16692 ?auto_16694 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16692 ?auto_16693 )
      ( MAKE-2CRATE-VERIFY ?auto_16691 ?auto_16692 ?auto_16693 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16700 - SURFACE
      ?auto_16701 - SURFACE
      ?auto_16702 - SURFACE
      ?auto_16703 - SURFACE
    )
    :vars
    (
      ?auto_16706 - HOIST
      ?auto_16704 - PLACE
      ?auto_16708 - PLACE
      ?auto_16707 - HOIST
      ?auto_16705 - SURFACE
      ?auto_16709 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16706 ?auto_16704 ) ( IS-CRATE ?auto_16703 ) ( not ( = ?auto_16702 ?auto_16703 ) ) ( not ( = ?auto_16701 ?auto_16702 ) ) ( not ( = ?auto_16701 ?auto_16703 ) ) ( not ( = ?auto_16708 ?auto_16704 ) ) ( HOIST-AT ?auto_16707 ?auto_16708 ) ( not ( = ?auto_16706 ?auto_16707 ) ) ( AVAILABLE ?auto_16707 ) ( SURFACE-AT ?auto_16703 ?auto_16708 ) ( ON ?auto_16703 ?auto_16705 ) ( CLEAR ?auto_16703 ) ( not ( = ?auto_16702 ?auto_16705 ) ) ( not ( = ?auto_16703 ?auto_16705 ) ) ( not ( = ?auto_16701 ?auto_16705 ) ) ( TRUCK-AT ?auto_16709 ?auto_16704 ) ( SURFACE-AT ?auto_16701 ?auto_16704 ) ( CLEAR ?auto_16701 ) ( IS-CRATE ?auto_16702 ) ( AVAILABLE ?auto_16706 ) ( IN ?auto_16702 ?auto_16709 ) ( ON ?auto_16701 ?auto_16700 ) ( not ( = ?auto_16700 ?auto_16701 ) ) ( not ( = ?auto_16700 ?auto_16702 ) ) ( not ( = ?auto_16700 ?auto_16703 ) ) ( not ( = ?auto_16700 ?auto_16705 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16701 ?auto_16702 ?auto_16703 )
      ( MAKE-3CRATE-VERIFY ?auto_16700 ?auto_16701 ?auto_16702 ?auto_16703 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16710 - SURFACE
      ?auto_16711 - SURFACE
      ?auto_16712 - SURFACE
      ?auto_16713 - SURFACE
      ?auto_16714 - SURFACE
    )
    :vars
    (
      ?auto_16717 - HOIST
      ?auto_16715 - PLACE
      ?auto_16719 - PLACE
      ?auto_16718 - HOIST
      ?auto_16716 - SURFACE
      ?auto_16720 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16717 ?auto_16715 ) ( IS-CRATE ?auto_16714 ) ( not ( = ?auto_16713 ?auto_16714 ) ) ( not ( = ?auto_16712 ?auto_16713 ) ) ( not ( = ?auto_16712 ?auto_16714 ) ) ( not ( = ?auto_16719 ?auto_16715 ) ) ( HOIST-AT ?auto_16718 ?auto_16719 ) ( not ( = ?auto_16717 ?auto_16718 ) ) ( AVAILABLE ?auto_16718 ) ( SURFACE-AT ?auto_16714 ?auto_16719 ) ( ON ?auto_16714 ?auto_16716 ) ( CLEAR ?auto_16714 ) ( not ( = ?auto_16713 ?auto_16716 ) ) ( not ( = ?auto_16714 ?auto_16716 ) ) ( not ( = ?auto_16712 ?auto_16716 ) ) ( TRUCK-AT ?auto_16720 ?auto_16715 ) ( SURFACE-AT ?auto_16712 ?auto_16715 ) ( CLEAR ?auto_16712 ) ( IS-CRATE ?auto_16713 ) ( AVAILABLE ?auto_16717 ) ( IN ?auto_16713 ?auto_16720 ) ( ON ?auto_16711 ?auto_16710 ) ( ON ?auto_16712 ?auto_16711 ) ( not ( = ?auto_16710 ?auto_16711 ) ) ( not ( = ?auto_16710 ?auto_16712 ) ) ( not ( = ?auto_16710 ?auto_16713 ) ) ( not ( = ?auto_16710 ?auto_16714 ) ) ( not ( = ?auto_16710 ?auto_16716 ) ) ( not ( = ?auto_16711 ?auto_16712 ) ) ( not ( = ?auto_16711 ?auto_16713 ) ) ( not ( = ?auto_16711 ?auto_16714 ) ) ( not ( = ?auto_16711 ?auto_16716 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16712 ?auto_16713 ?auto_16714 )
      ( MAKE-4CRATE-VERIFY ?auto_16710 ?auto_16711 ?auto_16712 ?auto_16713 ?auto_16714 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16721 - SURFACE
      ?auto_16722 - SURFACE
    )
    :vars
    (
      ?auto_16726 - HOIST
      ?auto_16724 - PLACE
      ?auto_16723 - SURFACE
      ?auto_16728 - PLACE
      ?auto_16727 - HOIST
      ?auto_16725 - SURFACE
      ?auto_16729 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16726 ?auto_16724 ) ( IS-CRATE ?auto_16722 ) ( not ( = ?auto_16721 ?auto_16722 ) ) ( not ( = ?auto_16723 ?auto_16721 ) ) ( not ( = ?auto_16723 ?auto_16722 ) ) ( not ( = ?auto_16728 ?auto_16724 ) ) ( HOIST-AT ?auto_16727 ?auto_16728 ) ( not ( = ?auto_16726 ?auto_16727 ) ) ( AVAILABLE ?auto_16727 ) ( SURFACE-AT ?auto_16722 ?auto_16728 ) ( ON ?auto_16722 ?auto_16725 ) ( CLEAR ?auto_16722 ) ( not ( = ?auto_16721 ?auto_16725 ) ) ( not ( = ?auto_16722 ?auto_16725 ) ) ( not ( = ?auto_16723 ?auto_16725 ) ) ( SURFACE-AT ?auto_16723 ?auto_16724 ) ( CLEAR ?auto_16723 ) ( IS-CRATE ?auto_16721 ) ( AVAILABLE ?auto_16726 ) ( IN ?auto_16721 ?auto_16729 ) ( TRUCK-AT ?auto_16729 ?auto_16728 ) )
    :subtasks
    ( ( !DRIVE ?auto_16729 ?auto_16728 ?auto_16724 )
      ( MAKE-2CRATE ?auto_16723 ?auto_16721 ?auto_16722 )
      ( MAKE-1CRATE-VERIFY ?auto_16721 ?auto_16722 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16730 - SURFACE
      ?auto_16731 - SURFACE
      ?auto_16732 - SURFACE
    )
    :vars
    (
      ?auto_16738 - HOIST
      ?auto_16734 - PLACE
      ?auto_16737 - PLACE
      ?auto_16735 - HOIST
      ?auto_16733 - SURFACE
      ?auto_16736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16738 ?auto_16734 ) ( IS-CRATE ?auto_16732 ) ( not ( = ?auto_16731 ?auto_16732 ) ) ( not ( = ?auto_16730 ?auto_16731 ) ) ( not ( = ?auto_16730 ?auto_16732 ) ) ( not ( = ?auto_16737 ?auto_16734 ) ) ( HOIST-AT ?auto_16735 ?auto_16737 ) ( not ( = ?auto_16738 ?auto_16735 ) ) ( AVAILABLE ?auto_16735 ) ( SURFACE-AT ?auto_16732 ?auto_16737 ) ( ON ?auto_16732 ?auto_16733 ) ( CLEAR ?auto_16732 ) ( not ( = ?auto_16731 ?auto_16733 ) ) ( not ( = ?auto_16732 ?auto_16733 ) ) ( not ( = ?auto_16730 ?auto_16733 ) ) ( SURFACE-AT ?auto_16730 ?auto_16734 ) ( CLEAR ?auto_16730 ) ( IS-CRATE ?auto_16731 ) ( AVAILABLE ?auto_16738 ) ( IN ?auto_16731 ?auto_16736 ) ( TRUCK-AT ?auto_16736 ?auto_16737 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16731 ?auto_16732 )
      ( MAKE-2CRATE-VERIFY ?auto_16730 ?auto_16731 ?auto_16732 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16739 - SURFACE
      ?auto_16740 - SURFACE
      ?auto_16741 - SURFACE
      ?auto_16742 - SURFACE
    )
    :vars
    (
      ?auto_16743 - HOIST
      ?auto_16746 - PLACE
      ?auto_16747 - PLACE
      ?auto_16748 - HOIST
      ?auto_16745 - SURFACE
      ?auto_16744 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16743 ?auto_16746 ) ( IS-CRATE ?auto_16742 ) ( not ( = ?auto_16741 ?auto_16742 ) ) ( not ( = ?auto_16740 ?auto_16741 ) ) ( not ( = ?auto_16740 ?auto_16742 ) ) ( not ( = ?auto_16747 ?auto_16746 ) ) ( HOIST-AT ?auto_16748 ?auto_16747 ) ( not ( = ?auto_16743 ?auto_16748 ) ) ( AVAILABLE ?auto_16748 ) ( SURFACE-AT ?auto_16742 ?auto_16747 ) ( ON ?auto_16742 ?auto_16745 ) ( CLEAR ?auto_16742 ) ( not ( = ?auto_16741 ?auto_16745 ) ) ( not ( = ?auto_16742 ?auto_16745 ) ) ( not ( = ?auto_16740 ?auto_16745 ) ) ( SURFACE-AT ?auto_16740 ?auto_16746 ) ( CLEAR ?auto_16740 ) ( IS-CRATE ?auto_16741 ) ( AVAILABLE ?auto_16743 ) ( IN ?auto_16741 ?auto_16744 ) ( TRUCK-AT ?auto_16744 ?auto_16747 ) ( ON ?auto_16740 ?auto_16739 ) ( not ( = ?auto_16739 ?auto_16740 ) ) ( not ( = ?auto_16739 ?auto_16741 ) ) ( not ( = ?auto_16739 ?auto_16742 ) ) ( not ( = ?auto_16739 ?auto_16745 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16740 ?auto_16741 ?auto_16742 )
      ( MAKE-3CRATE-VERIFY ?auto_16739 ?auto_16740 ?auto_16741 ?auto_16742 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16749 - SURFACE
      ?auto_16750 - SURFACE
      ?auto_16751 - SURFACE
      ?auto_16752 - SURFACE
      ?auto_16753 - SURFACE
    )
    :vars
    (
      ?auto_16754 - HOIST
      ?auto_16757 - PLACE
      ?auto_16758 - PLACE
      ?auto_16759 - HOIST
      ?auto_16756 - SURFACE
      ?auto_16755 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16754 ?auto_16757 ) ( IS-CRATE ?auto_16753 ) ( not ( = ?auto_16752 ?auto_16753 ) ) ( not ( = ?auto_16751 ?auto_16752 ) ) ( not ( = ?auto_16751 ?auto_16753 ) ) ( not ( = ?auto_16758 ?auto_16757 ) ) ( HOIST-AT ?auto_16759 ?auto_16758 ) ( not ( = ?auto_16754 ?auto_16759 ) ) ( AVAILABLE ?auto_16759 ) ( SURFACE-AT ?auto_16753 ?auto_16758 ) ( ON ?auto_16753 ?auto_16756 ) ( CLEAR ?auto_16753 ) ( not ( = ?auto_16752 ?auto_16756 ) ) ( not ( = ?auto_16753 ?auto_16756 ) ) ( not ( = ?auto_16751 ?auto_16756 ) ) ( SURFACE-AT ?auto_16751 ?auto_16757 ) ( CLEAR ?auto_16751 ) ( IS-CRATE ?auto_16752 ) ( AVAILABLE ?auto_16754 ) ( IN ?auto_16752 ?auto_16755 ) ( TRUCK-AT ?auto_16755 ?auto_16758 ) ( ON ?auto_16750 ?auto_16749 ) ( ON ?auto_16751 ?auto_16750 ) ( not ( = ?auto_16749 ?auto_16750 ) ) ( not ( = ?auto_16749 ?auto_16751 ) ) ( not ( = ?auto_16749 ?auto_16752 ) ) ( not ( = ?auto_16749 ?auto_16753 ) ) ( not ( = ?auto_16749 ?auto_16756 ) ) ( not ( = ?auto_16750 ?auto_16751 ) ) ( not ( = ?auto_16750 ?auto_16752 ) ) ( not ( = ?auto_16750 ?auto_16753 ) ) ( not ( = ?auto_16750 ?auto_16756 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16751 ?auto_16752 ?auto_16753 )
      ( MAKE-4CRATE-VERIFY ?auto_16749 ?auto_16750 ?auto_16751 ?auto_16752 ?auto_16753 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16760 - SURFACE
      ?auto_16761 - SURFACE
    )
    :vars
    (
      ?auto_16762 - HOIST
      ?auto_16765 - PLACE
      ?auto_16768 - SURFACE
      ?auto_16766 - PLACE
      ?auto_16767 - HOIST
      ?auto_16764 - SURFACE
      ?auto_16763 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16762 ?auto_16765 ) ( IS-CRATE ?auto_16761 ) ( not ( = ?auto_16760 ?auto_16761 ) ) ( not ( = ?auto_16768 ?auto_16760 ) ) ( not ( = ?auto_16768 ?auto_16761 ) ) ( not ( = ?auto_16766 ?auto_16765 ) ) ( HOIST-AT ?auto_16767 ?auto_16766 ) ( not ( = ?auto_16762 ?auto_16767 ) ) ( SURFACE-AT ?auto_16761 ?auto_16766 ) ( ON ?auto_16761 ?auto_16764 ) ( CLEAR ?auto_16761 ) ( not ( = ?auto_16760 ?auto_16764 ) ) ( not ( = ?auto_16761 ?auto_16764 ) ) ( not ( = ?auto_16768 ?auto_16764 ) ) ( SURFACE-AT ?auto_16768 ?auto_16765 ) ( CLEAR ?auto_16768 ) ( IS-CRATE ?auto_16760 ) ( AVAILABLE ?auto_16762 ) ( TRUCK-AT ?auto_16763 ?auto_16766 ) ( LIFTING ?auto_16767 ?auto_16760 ) )
    :subtasks
    ( ( !LOAD ?auto_16767 ?auto_16760 ?auto_16763 ?auto_16766 )
      ( MAKE-2CRATE ?auto_16768 ?auto_16760 ?auto_16761 )
      ( MAKE-1CRATE-VERIFY ?auto_16760 ?auto_16761 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16769 - SURFACE
      ?auto_16770 - SURFACE
      ?auto_16771 - SURFACE
    )
    :vars
    (
      ?auto_16774 - HOIST
      ?auto_16775 - PLACE
      ?auto_16772 - PLACE
      ?auto_16776 - HOIST
      ?auto_16773 - SURFACE
      ?auto_16777 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16774 ?auto_16775 ) ( IS-CRATE ?auto_16771 ) ( not ( = ?auto_16770 ?auto_16771 ) ) ( not ( = ?auto_16769 ?auto_16770 ) ) ( not ( = ?auto_16769 ?auto_16771 ) ) ( not ( = ?auto_16772 ?auto_16775 ) ) ( HOIST-AT ?auto_16776 ?auto_16772 ) ( not ( = ?auto_16774 ?auto_16776 ) ) ( SURFACE-AT ?auto_16771 ?auto_16772 ) ( ON ?auto_16771 ?auto_16773 ) ( CLEAR ?auto_16771 ) ( not ( = ?auto_16770 ?auto_16773 ) ) ( not ( = ?auto_16771 ?auto_16773 ) ) ( not ( = ?auto_16769 ?auto_16773 ) ) ( SURFACE-AT ?auto_16769 ?auto_16775 ) ( CLEAR ?auto_16769 ) ( IS-CRATE ?auto_16770 ) ( AVAILABLE ?auto_16774 ) ( TRUCK-AT ?auto_16777 ?auto_16772 ) ( LIFTING ?auto_16776 ?auto_16770 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16770 ?auto_16771 )
      ( MAKE-2CRATE-VERIFY ?auto_16769 ?auto_16770 ?auto_16771 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16778 - SURFACE
      ?auto_16779 - SURFACE
      ?auto_16780 - SURFACE
      ?auto_16781 - SURFACE
    )
    :vars
    (
      ?auto_16787 - HOIST
      ?auto_16782 - PLACE
      ?auto_16785 - PLACE
      ?auto_16784 - HOIST
      ?auto_16783 - SURFACE
      ?auto_16786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16787 ?auto_16782 ) ( IS-CRATE ?auto_16781 ) ( not ( = ?auto_16780 ?auto_16781 ) ) ( not ( = ?auto_16779 ?auto_16780 ) ) ( not ( = ?auto_16779 ?auto_16781 ) ) ( not ( = ?auto_16785 ?auto_16782 ) ) ( HOIST-AT ?auto_16784 ?auto_16785 ) ( not ( = ?auto_16787 ?auto_16784 ) ) ( SURFACE-AT ?auto_16781 ?auto_16785 ) ( ON ?auto_16781 ?auto_16783 ) ( CLEAR ?auto_16781 ) ( not ( = ?auto_16780 ?auto_16783 ) ) ( not ( = ?auto_16781 ?auto_16783 ) ) ( not ( = ?auto_16779 ?auto_16783 ) ) ( SURFACE-AT ?auto_16779 ?auto_16782 ) ( CLEAR ?auto_16779 ) ( IS-CRATE ?auto_16780 ) ( AVAILABLE ?auto_16787 ) ( TRUCK-AT ?auto_16786 ?auto_16785 ) ( LIFTING ?auto_16784 ?auto_16780 ) ( ON ?auto_16779 ?auto_16778 ) ( not ( = ?auto_16778 ?auto_16779 ) ) ( not ( = ?auto_16778 ?auto_16780 ) ) ( not ( = ?auto_16778 ?auto_16781 ) ) ( not ( = ?auto_16778 ?auto_16783 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16779 ?auto_16780 ?auto_16781 )
      ( MAKE-3CRATE-VERIFY ?auto_16778 ?auto_16779 ?auto_16780 ?auto_16781 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16788 - SURFACE
      ?auto_16789 - SURFACE
      ?auto_16790 - SURFACE
      ?auto_16791 - SURFACE
      ?auto_16792 - SURFACE
    )
    :vars
    (
      ?auto_16798 - HOIST
      ?auto_16793 - PLACE
      ?auto_16796 - PLACE
      ?auto_16795 - HOIST
      ?auto_16794 - SURFACE
      ?auto_16797 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16798 ?auto_16793 ) ( IS-CRATE ?auto_16792 ) ( not ( = ?auto_16791 ?auto_16792 ) ) ( not ( = ?auto_16790 ?auto_16791 ) ) ( not ( = ?auto_16790 ?auto_16792 ) ) ( not ( = ?auto_16796 ?auto_16793 ) ) ( HOIST-AT ?auto_16795 ?auto_16796 ) ( not ( = ?auto_16798 ?auto_16795 ) ) ( SURFACE-AT ?auto_16792 ?auto_16796 ) ( ON ?auto_16792 ?auto_16794 ) ( CLEAR ?auto_16792 ) ( not ( = ?auto_16791 ?auto_16794 ) ) ( not ( = ?auto_16792 ?auto_16794 ) ) ( not ( = ?auto_16790 ?auto_16794 ) ) ( SURFACE-AT ?auto_16790 ?auto_16793 ) ( CLEAR ?auto_16790 ) ( IS-CRATE ?auto_16791 ) ( AVAILABLE ?auto_16798 ) ( TRUCK-AT ?auto_16797 ?auto_16796 ) ( LIFTING ?auto_16795 ?auto_16791 ) ( ON ?auto_16789 ?auto_16788 ) ( ON ?auto_16790 ?auto_16789 ) ( not ( = ?auto_16788 ?auto_16789 ) ) ( not ( = ?auto_16788 ?auto_16790 ) ) ( not ( = ?auto_16788 ?auto_16791 ) ) ( not ( = ?auto_16788 ?auto_16792 ) ) ( not ( = ?auto_16788 ?auto_16794 ) ) ( not ( = ?auto_16789 ?auto_16790 ) ) ( not ( = ?auto_16789 ?auto_16791 ) ) ( not ( = ?auto_16789 ?auto_16792 ) ) ( not ( = ?auto_16789 ?auto_16794 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16790 ?auto_16791 ?auto_16792 )
      ( MAKE-4CRATE-VERIFY ?auto_16788 ?auto_16789 ?auto_16790 ?auto_16791 ?auto_16792 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16799 - SURFACE
      ?auto_16800 - SURFACE
    )
    :vars
    (
      ?auto_16807 - HOIST
      ?auto_16801 - PLACE
      ?auto_16806 - SURFACE
      ?auto_16804 - PLACE
      ?auto_16803 - HOIST
      ?auto_16802 - SURFACE
      ?auto_16805 - TRUCK
      ?auto_16808 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16807 ?auto_16801 ) ( IS-CRATE ?auto_16800 ) ( not ( = ?auto_16799 ?auto_16800 ) ) ( not ( = ?auto_16806 ?auto_16799 ) ) ( not ( = ?auto_16806 ?auto_16800 ) ) ( not ( = ?auto_16804 ?auto_16801 ) ) ( HOIST-AT ?auto_16803 ?auto_16804 ) ( not ( = ?auto_16807 ?auto_16803 ) ) ( SURFACE-AT ?auto_16800 ?auto_16804 ) ( ON ?auto_16800 ?auto_16802 ) ( CLEAR ?auto_16800 ) ( not ( = ?auto_16799 ?auto_16802 ) ) ( not ( = ?auto_16800 ?auto_16802 ) ) ( not ( = ?auto_16806 ?auto_16802 ) ) ( SURFACE-AT ?auto_16806 ?auto_16801 ) ( CLEAR ?auto_16806 ) ( IS-CRATE ?auto_16799 ) ( AVAILABLE ?auto_16807 ) ( TRUCK-AT ?auto_16805 ?auto_16804 ) ( AVAILABLE ?auto_16803 ) ( SURFACE-AT ?auto_16799 ?auto_16804 ) ( ON ?auto_16799 ?auto_16808 ) ( CLEAR ?auto_16799 ) ( not ( = ?auto_16799 ?auto_16808 ) ) ( not ( = ?auto_16800 ?auto_16808 ) ) ( not ( = ?auto_16806 ?auto_16808 ) ) ( not ( = ?auto_16802 ?auto_16808 ) ) )
    :subtasks
    ( ( !LIFT ?auto_16803 ?auto_16799 ?auto_16808 ?auto_16804 )
      ( MAKE-2CRATE ?auto_16806 ?auto_16799 ?auto_16800 )
      ( MAKE-1CRATE-VERIFY ?auto_16799 ?auto_16800 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16809 - SURFACE
      ?auto_16810 - SURFACE
      ?auto_16811 - SURFACE
    )
    :vars
    (
      ?auto_16814 - HOIST
      ?auto_16812 - PLACE
      ?auto_16813 - PLACE
      ?auto_16818 - HOIST
      ?auto_16817 - SURFACE
      ?auto_16815 - TRUCK
      ?auto_16816 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16814 ?auto_16812 ) ( IS-CRATE ?auto_16811 ) ( not ( = ?auto_16810 ?auto_16811 ) ) ( not ( = ?auto_16809 ?auto_16810 ) ) ( not ( = ?auto_16809 ?auto_16811 ) ) ( not ( = ?auto_16813 ?auto_16812 ) ) ( HOIST-AT ?auto_16818 ?auto_16813 ) ( not ( = ?auto_16814 ?auto_16818 ) ) ( SURFACE-AT ?auto_16811 ?auto_16813 ) ( ON ?auto_16811 ?auto_16817 ) ( CLEAR ?auto_16811 ) ( not ( = ?auto_16810 ?auto_16817 ) ) ( not ( = ?auto_16811 ?auto_16817 ) ) ( not ( = ?auto_16809 ?auto_16817 ) ) ( SURFACE-AT ?auto_16809 ?auto_16812 ) ( CLEAR ?auto_16809 ) ( IS-CRATE ?auto_16810 ) ( AVAILABLE ?auto_16814 ) ( TRUCK-AT ?auto_16815 ?auto_16813 ) ( AVAILABLE ?auto_16818 ) ( SURFACE-AT ?auto_16810 ?auto_16813 ) ( ON ?auto_16810 ?auto_16816 ) ( CLEAR ?auto_16810 ) ( not ( = ?auto_16810 ?auto_16816 ) ) ( not ( = ?auto_16811 ?auto_16816 ) ) ( not ( = ?auto_16809 ?auto_16816 ) ) ( not ( = ?auto_16817 ?auto_16816 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16810 ?auto_16811 )
      ( MAKE-2CRATE-VERIFY ?auto_16809 ?auto_16810 ?auto_16811 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16819 - SURFACE
      ?auto_16820 - SURFACE
      ?auto_16821 - SURFACE
      ?auto_16822 - SURFACE
    )
    :vars
    (
      ?auto_16827 - HOIST
      ?auto_16826 - PLACE
      ?auto_16828 - PLACE
      ?auto_16829 - HOIST
      ?auto_16825 - SURFACE
      ?auto_16823 - TRUCK
      ?auto_16824 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16827 ?auto_16826 ) ( IS-CRATE ?auto_16822 ) ( not ( = ?auto_16821 ?auto_16822 ) ) ( not ( = ?auto_16820 ?auto_16821 ) ) ( not ( = ?auto_16820 ?auto_16822 ) ) ( not ( = ?auto_16828 ?auto_16826 ) ) ( HOIST-AT ?auto_16829 ?auto_16828 ) ( not ( = ?auto_16827 ?auto_16829 ) ) ( SURFACE-AT ?auto_16822 ?auto_16828 ) ( ON ?auto_16822 ?auto_16825 ) ( CLEAR ?auto_16822 ) ( not ( = ?auto_16821 ?auto_16825 ) ) ( not ( = ?auto_16822 ?auto_16825 ) ) ( not ( = ?auto_16820 ?auto_16825 ) ) ( SURFACE-AT ?auto_16820 ?auto_16826 ) ( CLEAR ?auto_16820 ) ( IS-CRATE ?auto_16821 ) ( AVAILABLE ?auto_16827 ) ( TRUCK-AT ?auto_16823 ?auto_16828 ) ( AVAILABLE ?auto_16829 ) ( SURFACE-AT ?auto_16821 ?auto_16828 ) ( ON ?auto_16821 ?auto_16824 ) ( CLEAR ?auto_16821 ) ( not ( = ?auto_16821 ?auto_16824 ) ) ( not ( = ?auto_16822 ?auto_16824 ) ) ( not ( = ?auto_16820 ?auto_16824 ) ) ( not ( = ?auto_16825 ?auto_16824 ) ) ( ON ?auto_16820 ?auto_16819 ) ( not ( = ?auto_16819 ?auto_16820 ) ) ( not ( = ?auto_16819 ?auto_16821 ) ) ( not ( = ?auto_16819 ?auto_16822 ) ) ( not ( = ?auto_16819 ?auto_16825 ) ) ( not ( = ?auto_16819 ?auto_16824 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16820 ?auto_16821 ?auto_16822 )
      ( MAKE-3CRATE-VERIFY ?auto_16819 ?auto_16820 ?auto_16821 ?auto_16822 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16830 - SURFACE
      ?auto_16831 - SURFACE
      ?auto_16832 - SURFACE
      ?auto_16833 - SURFACE
      ?auto_16834 - SURFACE
    )
    :vars
    (
      ?auto_16839 - HOIST
      ?auto_16838 - PLACE
      ?auto_16840 - PLACE
      ?auto_16841 - HOIST
      ?auto_16837 - SURFACE
      ?auto_16835 - TRUCK
      ?auto_16836 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16839 ?auto_16838 ) ( IS-CRATE ?auto_16834 ) ( not ( = ?auto_16833 ?auto_16834 ) ) ( not ( = ?auto_16832 ?auto_16833 ) ) ( not ( = ?auto_16832 ?auto_16834 ) ) ( not ( = ?auto_16840 ?auto_16838 ) ) ( HOIST-AT ?auto_16841 ?auto_16840 ) ( not ( = ?auto_16839 ?auto_16841 ) ) ( SURFACE-AT ?auto_16834 ?auto_16840 ) ( ON ?auto_16834 ?auto_16837 ) ( CLEAR ?auto_16834 ) ( not ( = ?auto_16833 ?auto_16837 ) ) ( not ( = ?auto_16834 ?auto_16837 ) ) ( not ( = ?auto_16832 ?auto_16837 ) ) ( SURFACE-AT ?auto_16832 ?auto_16838 ) ( CLEAR ?auto_16832 ) ( IS-CRATE ?auto_16833 ) ( AVAILABLE ?auto_16839 ) ( TRUCK-AT ?auto_16835 ?auto_16840 ) ( AVAILABLE ?auto_16841 ) ( SURFACE-AT ?auto_16833 ?auto_16840 ) ( ON ?auto_16833 ?auto_16836 ) ( CLEAR ?auto_16833 ) ( not ( = ?auto_16833 ?auto_16836 ) ) ( not ( = ?auto_16834 ?auto_16836 ) ) ( not ( = ?auto_16832 ?auto_16836 ) ) ( not ( = ?auto_16837 ?auto_16836 ) ) ( ON ?auto_16831 ?auto_16830 ) ( ON ?auto_16832 ?auto_16831 ) ( not ( = ?auto_16830 ?auto_16831 ) ) ( not ( = ?auto_16830 ?auto_16832 ) ) ( not ( = ?auto_16830 ?auto_16833 ) ) ( not ( = ?auto_16830 ?auto_16834 ) ) ( not ( = ?auto_16830 ?auto_16837 ) ) ( not ( = ?auto_16830 ?auto_16836 ) ) ( not ( = ?auto_16831 ?auto_16832 ) ) ( not ( = ?auto_16831 ?auto_16833 ) ) ( not ( = ?auto_16831 ?auto_16834 ) ) ( not ( = ?auto_16831 ?auto_16837 ) ) ( not ( = ?auto_16831 ?auto_16836 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16832 ?auto_16833 ?auto_16834 )
      ( MAKE-4CRATE-VERIFY ?auto_16830 ?auto_16831 ?auto_16832 ?auto_16833 ?auto_16834 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16842 - SURFACE
      ?auto_16843 - SURFACE
    )
    :vars
    (
      ?auto_16849 - HOIST
      ?auto_16848 - PLACE
      ?auto_16846 - SURFACE
      ?auto_16850 - PLACE
      ?auto_16851 - HOIST
      ?auto_16847 - SURFACE
      ?auto_16845 - SURFACE
      ?auto_16844 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16849 ?auto_16848 ) ( IS-CRATE ?auto_16843 ) ( not ( = ?auto_16842 ?auto_16843 ) ) ( not ( = ?auto_16846 ?auto_16842 ) ) ( not ( = ?auto_16846 ?auto_16843 ) ) ( not ( = ?auto_16850 ?auto_16848 ) ) ( HOIST-AT ?auto_16851 ?auto_16850 ) ( not ( = ?auto_16849 ?auto_16851 ) ) ( SURFACE-AT ?auto_16843 ?auto_16850 ) ( ON ?auto_16843 ?auto_16847 ) ( CLEAR ?auto_16843 ) ( not ( = ?auto_16842 ?auto_16847 ) ) ( not ( = ?auto_16843 ?auto_16847 ) ) ( not ( = ?auto_16846 ?auto_16847 ) ) ( SURFACE-AT ?auto_16846 ?auto_16848 ) ( CLEAR ?auto_16846 ) ( IS-CRATE ?auto_16842 ) ( AVAILABLE ?auto_16849 ) ( AVAILABLE ?auto_16851 ) ( SURFACE-AT ?auto_16842 ?auto_16850 ) ( ON ?auto_16842 ?auto_16845 ) ( CLEAR ?auto_16842 ) ( not ( = ?auto_16842 ?auto_16845 ) ) ( not ( = ?auto_16843 ?auto_16845 ) ) ( not ( = ?auto_16846 ?auto_16845 ) ) ( not ( = ?auto_16847 ?auto_16845 ) ) ( TRUCK-AT ?auto_16844 ?auto_16848 ) )
    :subtasks
    ( ( !DRIVE ?auto_16844 ?auto_16848 ?auto_16850 )
      ( MAKE-2CRATE ?auto_16846 ?auto_16842 ?auto_16843 )
      ( MAKE-1CRATE-VERIFY ?auto_16842 ?auto_16843 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16852 - SURFACE
      ?auto_16853 - SURFACE
      ?auto_16854 - SURFACE
    )
    :vars
    (
      ?auto_16858 - HOIST
      ?auto_16855 - PLACE
      ?auto_16857 - PLACE
      ?auto_16860 - HOIST
      ?auto_16861 - SURFACE
      ?auto_16859 - SURFACE
      ?auto_16856 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16858 ?auto_16855 ) ( IS-CRATE ?auto_16854 ) ( not ( = ?auto_16853 ?auto_16854 ) ) ( not ( = ?auto_16852 ?auto_16853 ) ) ( not ( = ?auto_16852 ?auto_16854 ) ) ( not ( = ?auto_16857 ?auto_16855 ) ) ( HOIST-AT ?auto_16860 ?auto_16857 ) ( not ( = ?auto_16858 ?auto_16860 ) ) ( SURFACE-AT ?auto_16854 ?auto_16857 ) ( ON ?auto_16854 ?auto_16861 ) ( CLEAR ?auto_16854 ) ( not ( = ?auto_16853 ?auto_16861 ) ) ( not ( = ?auto_16854 ?auto_16861 ) ) ( not ( = ?auto_16852 ?auto_16861 ) ) ( SURFACE-AT ?auto_16852 ?auto_16855 ) ( CLEAR ?auto_16852 ) ( IS-CRATE ?auto_16853 ) ( AVAILABLE ?auto_16858 ) ( AVAILABLE ?auto_16860 ) ( SURFACE-AT ?auto_16853 ?auto_16857 ) ( ON ?auto_16853 ?auto_16859 ) ( CLEAR ?auto_16853 ) ( not ( = ?auto_16853 ?auto_16859 ) ) ( not ( = ?auto_16854 ?auto_16859 ) ) ( not ( = ?auto_16852 ?auto_16859 ) ) ( not ( = ?auto_16861 ?auto_16859 ) ) ( TRUCK-AT ?auto_16856 ?auto_16855 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16853 ?auto_16854 )
      ( MAKE-2CRATE-VERIFY ?auto_16852 ?auto_16853 ?auto_16854 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16862 - SURFACE
      ?auto_16863 - SURFACE
      ?auto_16864 - SURFACE
      ?auto_16865 - SURFACE
    )
    :vars
    (
      ?auto_16868 - HOIST
      ?auto_16869 - PLACE
      ?auto_16871 - PLACE
      ?auto_16867 - HOIST
      ?auto_16872 - SURFACE
      ?auto_16866 - SURFACE
      ?auto_16870 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16868 ?auto_16869 ) ( IS-CRATE ?auto_16865 ) ( not ( = ?auto_16864 ?auto_16865 ) ) ( not ( = ?auto_16863 ?auto_16864 ) ) ( not ( = ?auto_16863 ?auto_16865 ) ) ( not ( = ?auto_16871 ?auto_16869 ) ) ( HOIST-AT ?auto_16867 ?auto_16871 ) ( not ( = ?auto_16868 ?auto_16867 ) ) ( SURFACE-AT ?auto_16865 ?auto_16871 ) ( ON ?auto_16865 ?auto_16872 ) ( CLEAR ?auto_16865 ) ( not ( = ?auto_16864 ?auto_16872 ) ) ( not ( = ?auto_16865 ?auto_16872 ) ) ( not ( = ?auto_16863 ?auto_16872 ) ) ( SURFACE-AT ?auto_16863 ?auto_16869 ) ( CLEAR ?auto_16863 ) ( IS-CRATE ?auto_16864 ) ( AVAILABLE ?auto_16868 ) ( AVAILABLE ?auto_16867 ) ( SURFACE-AT ?auto_16864 ?auto_16871 ) ( ON ?auto_16864 ?auto_16866 ) ( CLEAR ?auto_16864 ) ( not ( = ?auto_16864 ?auto_16866 ) ) ( not ( = ?auto_16865 ?auto_16866 ) ) ( not ( = ?auto_16863 ?auto_16866 ) ) ( not ( = ?auto_16872 ?auto_16866 ) ) ( TRUCK-AT ?auto_16870 ?auto_16869 ) ( ON ?auto_16863 ?auto_16862 ) ( not ( = ?auto_16862 ?auto_16863 ) ) ( not ( = ?auto_16862 ?auto_16864 ) ) ( not ( = ?auto_16862 ?auto_16865 ) ) ( not ( = ?auto_16862 ?auto_16872 ) ) ( not ( = ?auto_16862 ?auto_16866 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16863 ?auto_16864 ?auto_16865 )
      ( MAKE-3CRATE-VERIFY ?auto_16862 ?auto_16863 ?auto_16864 ?auto_16865 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16873 - SURFACE
      ?auto_16874 - SURFACE
      ?auto_16875 - SURFACE
      ?auto_16876 - SURFACE
      ?auto_16877 - SURFACE
    )
    :vars
    (
      ?auto_16880 - HOIST
      ?auto_16881 - PLACE
      ?auto_16883 - PLACE
      ?auto_16879 - HOIST
      ?auto_16884 - SURFACE
      ?auto_16878 - SURFACE
      ?auto_16882 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16880 ?auto_16881 ) ( IS-CRATE ?auto_16877 ) ( not ( = ?auto_16876 ?auto_16877 ) ) ( not ( = ?auto_16875 ?auto_16876 ) ) ( not ( = ?auto_16875 ?auto_16877 ) ) ( not ( = ?auto_16883 ?auto_16881 ) ) ( HOIST-AT ?auto_16879 ?auto_16883 ) ( not ( = ?auto_16880 ?auto_16879 ) ) ( SURFACE-AT ?auto_16877 ?auto_16883 ) ( ON ?auto_16877 ?auto_16884 ) ( CLEAR ?auto_16877 ) ( not ( = ?auto_16876 ?auto_16884 ) ) ( not ( = ?auto_16877 ?auto_16884 ) ) ( not ( = ?auto_16875 ?auto_16884 ) ) ( SURFACE-AT ?auto_16875 ?auto_16881 ) ( CLEAR ?auto_16875 ) ( IS-CRATE ?auto_16876 ) ( AVAILABLE ?auto_16880 ) ( AVAILABLE ?auto_16879 ) ( SURFACE-AT ?auto_16876 ?auto_16883 ) ( ON ?auto_16876 ?auto_16878 ) ( CLEAR ?auto_16876 ) ( not ( = ?auto_16876 ?auto_16878 ) ) ( not ( = ?auto_16877 ?auto_16878 ) ) ( not ( = ?auto_16875 ?auto_16878 ) ) ( not ( = ?auto_16884 ?auto_16878 ) ) ( TRUCK-AT ?auto_16882 ?auto_16881 ) ( ON ?auto_16874 ?auto_16873 ) ( ON ?auto_16875 ?auto_16874 ) ( not ( = ?auto_16873 ?auto_16874 ) ) ( not ( = ?auto_16873 ?auto_16875 ) ) ( not ( = ?auto_16873 ?auto_16876 ) ) ( not ( = ?auto_16873 ?auto_16877 ) ) ( not ( = ?auto_16873 ?auto_16884 ) ) ( not ( = ?auto_16873 ?auto_16878 ) ) ( not ( = ?auto_16874 ?auto_16875 ) ) ( not ( = ?auto_16874 ?auto_16876 ) ) ( not ( = ?auto_16874 ?auto_16877 ) ) ( not ( = ?auto_16874 ?auto_16884 ) ) ( not ( = ?auto_16874 ?auto_16878 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16875 ?auto_16876 ?auto_16877 )
      ( MAKE-4CRATE-VERIFY ?auto_16873 ?auto_16874 ?auto_16875 ?auto_16876 ?auto_16877 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16885 - SURFACE
      ?auto_16886 - SURFACE
    )
    :vars
    (
      ?auto_16889 - HOIST
      ?auto_16891 - PLACE
      ?auto_16890 - SURFACE
      ?auto_16893 - PLACE
      ?auto_16888 - HOIST
      ?auto_16894 - SURFACE
      ?auto_16887 - SURFACE
      ?auto_16892 - TRUCK
      ?auto_16895 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16889 ?auto_16891 ) ( IS-CRATE ?auto_16886 ) ( not ( = ?auto_16885 ?auto_16886 ) ) ( not ( = ?auto_16890 ?auto_16885 ) ) ( not ( = ?auto_16890 ?auto_16886 ) ) ( not ( = ?auto_16893 ?auto_16891 ) ) ( HOIST-AT ?auto_16888 ?auto_16893 ) ( not ( = ?auto_16889 ?auto_16888 ) ) ( SURFACE-AT ?auto_16886 ?auto_16893 ) ( ON ?auto_16886 ?auto_16894 ) ( CLEAR ?auto_16886 ) ( not ( = ?auto_16885 ?auto_16894 ) ) ( not ( = ?auto_16886 ?auto_16894 ) ) ( not ( = ?auto_16890 ?auto_16894 ) ) ( IS-CRATE ?auto_16885 ) ( AVAILABLE ?auto_16888 ) ( SURFACE-AT ?auto_16885 ?auto_16893 ) ( ON ?auto_16885 ?auto_16887 ) ( CLEAR ?auto_16885 ) ( not ( = ?auto_16885 ?auto_16887 ) ) ( not ( = ?auto_16886 ?auto_16887 ) ) ( not ( = ?auto_16890 ?auto_16887 ) ) ( not ( = ?auto_16894 ?auto_16887 ) ) ( TRUCK-AT ?auto_16892 ?auto_16891 ) ( SURFACE-AT ?auto_16895 ?auto_16891 ) ( CLEAR ?auto_16895 ) ( LIFTING ?auto_16889 ?auto_16890 ) ( IS-CRATE ?auto_16890 ) ( not ( = ?auto_16895 ?auto_16890 ) ) ( not ( = ?auto_16885 ?auto_16895 ) ) ( not ( = ?auto_16886 ?auto_16895 ) ) ( not ( = ?auto_16894 ?auto_16895 ) ) ( not ( = ?auto_16887 ?auto_16895 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16895 ?auto_16890 )
      ( MAKE-2CRATE ?auto_16890 ?auto_16885 ?auto_16886 )
      ( MAKE-1CRATE-VERIFY ?auto_16885 ?auto_16886 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16896 - SURFACE
      ?auto_16897 - SURFACE
      ?auto_16898 - SURFACE
    )
    :vars
    (
      ?auto_16903 - HOIST
      ?auto_16902 - PLACE
      ?auto_16904 - PLACE
      ?auto_16900 - HOIST
      ?auto_16906 - SURFACE
      ?auto_16899 - SURFACE
      ?auto_16905 - TRUCK
      ?auto_16901 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16903 ?auto_16902 ) ( IS-CRATE ?auto_16898 ) ( not ( = ?auto_16897 ?auto_16898 ) ) ( not ( = ?auto_16896 ?auto_16897 ) ) ( not ( = ?auto_16896 ?auto_16898 ) ) ( not ( = ?auto_16904 ?auto_16902 ) ) ( HOIST-AT ?auto_16900 ?auto_16904 ) ( not ( = ?auto_16903 ?auto_16900 ) ) ( SURFACE-AT ?auto_16898 ?auto_16904 ) ( ON ?auto_16898 ?auto_16906 ) ( CLEAR ?auto_16898 ) ( not ( = ?auto_16897 ?auto_16906 ) ) ( not ( = ?auto_16898 ?auto_16906 ) ) ( not ( = ?auto_16896 ?auto_16906 ) ) ( IS-CRATE ?auto_16897 ) ( AVAILABLE ?auto_16900 ) ( SURFACE-AT ?auto_16897 ?auto_16904 ) ( ON ?auto_16897 ?auto_16899 ) ( CLEAR ?auto_16897 ) ( not ( = ?auto_16897 ?auto_16899 ) ) ( not ( = ?auto_16898 ?auto_16899 ) ) ( not ( = ?auto_16896 ?auto_16899 ) ) ( not ( = ?auto_16906 ?auto_16899 ) ) ( TRUCK-AT ?auto_16905 ?auto_16902 ) ( SURFACE-AT ?auto_16901 ?auto_16902 ) ( CLEAR ?auto_16901 ) ( LIFTING ?auto_16903 ?auto_16896 ) ( IS-CRATE ?auto_16896 ) ( not ( = ?auto_16901 ?auto_16896 ) ) ( not ( = ?auto_16897 ?auto_16901 ) ) ( not ( = ?auto_16898 ?auto_16901 ) ) ( not ( = ?auto_16906 ?auto_16901 ) ) ( not ( = ?auto_16899 ?auto_16901 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16897 ?auto_16898 )
      ( MAKE-2CRATE-VERIFY ?auto_16896 ?auto_16897 ?auto_16898 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16907 - SURFACE
      ?auto_16908 - SURFACE
      ?auto_16909 - SURFACE
      ?auto_16910 - SURFACE
    )
    :vars
    (
      ?auto_16915 - HOIST
      ?auto_16912 - PLACE
      ?auto_16911 - PLACE
      ?auto_16914 - HOIST
      ?auto_16917 - SURFACE
      ?auto_16916 - SURFACE
      ?auto_16913 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16915 ?auto_16912 ) ( IS-CRATE ?auto_16910 ) ( not ( = ?auto_16909 ?auto_16910 ) ) ( not ( = ?auto_16908 ?auto_16909 ) ) ( not ( = ?auto_16908 ?auto_16910 ) ) ( not ( = ?auto_16911 ?auto_16912 ) ) ( HOIST-AT ?auto_16914 ?auto_16911 ) ( not ( = ?auto_16915 ?auto_16914 ) ) ( SURFACE-AT ?auto_16910 ?auto_16911 ) ( ON ?auto_16910 ?auto_16917 ) ( CLEAR ?auto_16910 ) ( not ( = ?auto_16909 ?auto_16917 ) ) ( not ( = ?auto_16910 ?auto_16917 ) ) ( not ( = ?auto_16908 ?auto_16917 ) ) ( IS-CRATE ?auto_16909 ) ( AVAILABLE ?auto_16914 ) ( SURFACE-AT ?auto_16909 ?auto_16911 ) ( ON ?auto_16909 ?auto_16916 ) ( CLEAR ?auto_16909 ) ( not ( = ?auto_16909 ?auto_16916 ) ) ( not ( = ?auto_16910 ?auto_16916 ) ) ( not ( = ?auto_16908 ?auto_16916 ) ) ( not ( = ?auto_16917 ?auto_16916 ) ) ( TRUCK-AT ?auto_16913 ?auto_16912 ) ( SURFACE-AT ?auto_16907 ?auto_16912 ) ( CLEAR ?auto_16907 ) ( LIFTING ?auto_16915 ?auto_16908 ) ( IS-CRATE ?auto_16908 ) ( not ( = ?auto_16907 ?auto_16908 ) ) ( not ( = ?auto_16909 ?auto_16907 ) ) ( not ( = ?auto_16910 ?auto_16907 ) ) ( not ( = ?auto_16917 ?auto_16907 ) ) ( not ( = ?auto_16916 ?auto_16907 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16908 ?auto_16909 ?auto_16910 )
      ( MAKE-3CRATE-VERIFY ?auto_16907 ?auto_16908 ?auto_16909 ?auto_16910 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16918 - SURFACE
      ?auto_16919 - SURFACE
      ?auto_16920 - SURFACE
      ?auto_16921 - SURFACE
      ?auto_16922 - SURFACE
    )
    :vars
    (
      ?auto_16927 - HOIST
      ?auto_16924 - PLACE
      ?auto_16923 - PLACE
      ?auto_16926 - HOIST
      ?auto_16929 - SURFACE
      ?auto_16928 - SURFACE
      ?auto_16925 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16927 ?auto_16924 ) ( IS-CRATE ?auto_16922 ) ( not ( = ?auto_16921 ?auto_16922 ) ) ( not ( = ?auto_16920 ?auto_16921 ) ) ( not ( = ?auto_16920 ?auto_16922 ) ) ( not ( = ?auto_16923 ?auto_16924 ) ) ( HOIST-AT ?auto_16926 ?auto_16923 ) ( not ( = ?auto_16927 ?auto_16926 ) ) ( SURFACE-AT ?auto_16922 ?auto_16923 ) ( ON ?auto_16922 ?auto_16929 ) ( CLEAR ?auto_16922 ) ( not ( = ?auto_16921 ?auto_16929 ) ) ( not ( = ?auto_16922 ?auto_16929 ) ) ( not ( = ?auto_16920 ?auto_16929 ) ) ( IS-CRATE ?auto_16921 ) ( AVAILABLE ?auto_16926 ) ( SURFACE-AT ?auto_16921 ?auto_16923 ) ( ON ?auto_16921 ?auto_16928 ) ( CLEAR ?auto_16921 ) ( not ( = ?auto_16921 ?auto_16928 ) ) ( not ( = ?auto_16922 ?auto_16928 ) ) ( not ( = ?auto_16920 ?auto_16928 ) ) ( not ( = ?auto_16929 ?auto_16928 ) ) ( TRUCK-AT ?auto_16925 ?auto_16924 ) ( SURFACE-AT ?auto_16919 ?auto_16924 ) ( CLEAR ?auto_16919 ) ( LIFTING ?auto_16927 ?auto_16920 ) ( IS-CRATE ?auto_16920 ) ( not ( = ?auto_16919 ?auto_16920 ) ) ( not ( = ?auto_16921 ?auto_16919 ) ) ( not ( = ?auto_16922 ?auto_16919 ) ) ( not ( = ?auto_16929 ?auto_16919 ) ) ( not ( = ?auto_16928 ?auto_16919 ) ) ( ON ?auto_16919 ?auto_16918 ) ( not ( = ?auto_16918 ?auto_16919 ) ) ( not ( = ?auto_16918 ?auto_16920 ) ) ( not ( = ?auto_16918 ?auto_16921 ) ) ( not ( = ?auto_16918 ?auto_16922 ) ) ( not ( = ?auto_16918 ?auto_16929 ) ) ( not ( = ?auto_16918 ?auto_16928 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16920 ?auto_16921 ?auto_16922 )
      ( MAKE-4CRATE-VERIFY ?auto_16918 ?auto_16919 ?auto_16920 ?auto_16921 ?auto_16922 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16930 - SURFACE
      ?auto_16931 - SURFACE
    )
    :vars
    (
      ?auto_16936 - HOIST
      ?auto_16933 - PLACE
      ?auto_16937 - SURFACE
      ?auto_16932 - PLACE
      ?auto_16935 - HOIST
      ?auto_16940 - SURFACE
      ?auto_16938 - SURFACE
      ?auto_16934 - TRUCK
      ?auto_16939 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16936 ?auto_16933 ) ( IS-CRATE ?auto_16931 ) ( not ( = ?auto_16930 ?auto_16931 ) ) ( not ( = ?auto_16937 ?auto_16930 ) ) ( not ( = ?auto_16937 ?auto_16931 ) ) ( not ( = ?auto_16932 ?auto_16933 ) ) ( HOIST-AT ?auto_16935 ?auto_16932 ) ( not ( = ?auto_16936 ?auto_16935 ) ) ( SURFACE-AT ?auto_16931 ?auto_16932 ) ( ON ?auto_16931 ?auto_16940 ) ( CLEAR ?auto_16931 ) ( not ( = ?auto_16930 ?auto_16940 ) ) ( not ( = ?auto_16931 ?auto_16940 ) ) ( not ( = ?auto_16937 ?auto_16940 ) ) ( IS-CRATE ?auto_16930 ) ( AVAILABLE ?auto_16935 ) ( SURFACE-AT ?auto_16930 ?auto_16932 ) ( ON ?auto_16930 ?auto_16938 ) ( CLEAR ?auto_16930 ) ( not ( = ?auto_16930 ?auto_16938 ) ) ( not ( = ?auto_16931 ?auto_16938 ) ) ( not ( = ?auto_16937 ?auto_16938 ) ) ( not ( = ?auto_16940 ?auto_16938 ) ) ( TRUCK-AT ?auto_16934 ?auto_16933 ) ( SURFACE-AT ?auto_16939 ?auto_16933 ) ( CLEAR ?auto_16939 ) ( IS-CRATE ?auto_16937 ) ( not ( = ?auto_16939 ?auto_16937 ) ) ( not ( = ?auto_16930 ?auto_16939 ) ) ( not ( = ?auto_16931 ?auto_16939 ) ) ( not ( = ?auto_16940 ?auto_16939 ) ) ( not ( = ?auto_16938 ?auto_16939 ) ) ( AVAILABLE ?auto_16936 ) ( IN ?auto_16937 ?auto_16934 ) )
    :subtasks
    ( ( !UNLOAD ?auto_16936 ?auto_16937 ?auto_16934 ?auto_16933 )
      ( MAKE-2CRATE ?auto_16937 ?auto_16930 ?auto_16931 )
      ( MAKE-1CRATE-VERIFY ?auto_16930 ?auto_16931 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16941 - SURFACE
      ?auto_16942 - SURFACE
      ?auto_16943 - SURFACE
    )
    :vars
    (
      ?auto_16950 - HOIST
      ?auto_16944 - PLACE
      ?auto_16945 - PLACE
      ?auto_16948 - HOIST
      ?auto_16946 - SURFACE
      ?auto_16949 - SURFACE
      ?auto_16947 - TRUCK
      ?auto_16951 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16950 ?auto_16944 ) ( IS-CRATE ?auto_16943 ) ( not ( = ?auto_16942 ?auto_16943 ) ) ( not ( = ?auto_16941 ?auto_16942 ) ) ( not ( = ?auto_16941 ?auto_16943 ) ) ( not ( = ?auto_16945 ?auto_16944 ) ) ( HOIST-AT ?auto_16948 ?auto_16945 ) ( not ( = ?auto_16950 ?auto_16948 ) ) ( SURFACE-AT ?auto_16943 ?auto_16945 ) ( ON ?auto_16943 ?auto_16946 ) ( CLEAR ?auto_16943 ) ( not ( = ?auto_16942 ?auto_16946 ) ) ( not ( = ?auto_16943 ?auto_16946 ) ) ( not ( = ?auto_16941 ?auto_16946 ) ) ( IS-CRATE ?auto_16942 ) ( AVAILABLE ?auto_16948 ) ( SURFACE-AT ?auto_16942 ?auto_16945 ) ( ON ?auto_16942 ?auto_16949 ) ( CLEAR ?auto_16942 ) ( not ( = ?auto_16942 ?auto_16949 ) ) ( not ( = ?auto_16943 ?auto_16949 ) ) ( not ( = ?auto_16941 ?auto_16949 ) ) ( not ( = ?auto_16946 ?auto_16949 ) ) ( TRUCK-AT ?auto_16947 ?auto_16944 ) ( SURFACE-AT ?auto_16951 ?auto_16944 ) ( CLEAR ?auto_16951 ) ( IS-CRATE ?auto_16941 ) ( not ( = ?auto_16951 ?auto_16941 ) ) ( not ( = ?auto_16942 ?auto_16951 ) ) ( not ( = ?auto_16943 ?auto_16951 ) ) ( not ( = ?auto_16946 ?auto_16951 ) ) ( not ( = ?auto_16949 ?auto_16951 ) ) ( AVAILABLE ?auto_16950 ) ( IN ?auto_16941 ?auto_16947 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16942 ?auto_16943 )
      ( MAKE-2CRATE-VERIFY ?auto_16941 ?auto_16942 ?auto_16943 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16952 - SURFACE
      ?auto_16953 - SURFACE
      ?auto_16954 - SURFACE
      ?auto_16955 - SURFACE
    )
    :vars
    (
      ?auto_16959 - HOIST
      ?auto_16956 - PLACE
      ?auto_16958 - PLACE
      ?auto_16961 - HOIST
      ?auto_16962 - SURFACE
      ?auto_16957 - SURFACE
      ?auto_16960 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16959 ?auto_16956 ) ( IS-CRATE ?auto_16955 ) ( not ( = ?auto_16954 ?auto_16955 ) ) ( not ( = ?auto_16953 ?auto_16954 ) ) ( not ( = ?auto_16953 ?auto_16955 ) ) ( not ( = ?auto_16958 ?auto_16956 ) ) ( HOIST-AT ?auto_16961 ?auto_16958 ) ( not ( = ?auto_16959 ?auto_16961 ) ) ( SURFACE-AT ?auto_16955 ?auto_16958 ) ( ON ?auto_16955 ?auto_16962 ) ( CLEAR ?auto_16955 ) ( not ( = ?auto_16954 ?auto_16962 ) ) ( not ( = ?auto_16955 ?auto_16962 ) ) ( not ( = ?auto_16953 ?auto_16962 ) ) ( IS-CRATE ?auto_16954 ) ( AVAILABLE ?auto_16961 ) ( SURFACE-AT ?auto_16954 ?auto_16958 ) ( ON ?auto_16954 ?auto_16957 ) ( CLEAR ?auto_16954 ) ( not ( = ?auto_16954 ?auto_16957 ) ) ( not ( = ?auto_16955 ?auto_16957 ) ) ( not ( = ?auto_16953 ?auto_16957 ) ) ( not ( = ?auto_16962 ?auto_16957 ) ) ( TRUCK-AT ?auto_16960 ?auto_16956 ) ( SURFACE-AT ?auto_16952 ?auto_16956 ) ( CLEAR ?auto_16952 ) ( IS-CRATE ?auto_16953 ) ( not ( = ?auto_16952 ?auto_16953 ) ) ( not ( = ?auto_16954 ?auto_16952 ) ) ( not ( = ?auto_16955 ?auto_16952 ) ) ( not ( = ?auto_16962 ?auto_16952 ) ) ( not ( = ?auto_16957 ?auto_16952 ) ) ( AVAILABLE ?auto_16959 ) ( IN ?auto_16953 ?auto_16960 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16953 ?auto_16954 ?auto_16955 )
      ( MAKE-3CRATE-VERIFY ?auto_16952 ?auto_16953 ?auto_16954 ?auto_16955 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16963 - SURFACE
      ?auto_16964 - SURFACE
      ?auto_16965 - SURFACE
      ?auto_16966 - SURFACE
      ?auto_16967 - SURFACE
    )
    :vars
    (
      ?auto_16971 - HOIST
      ?auto_16968 - PLACE
      ?auto_16970 - PLACE
      ?auto_16973 - HOIST
      ?auto_16974 - SURFACE
      ?auto_16969 - SURFACE
      ?auto_16972 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16971 ?auto_16968 ) ( IS-CRATE ?auto_16967 ) ( not ( = ?auto_16966 ?auto_16967 ) ) ( not ( = ?auto_16965 ?auto_16966 ) ) ( not ( = ?auto_16965 ?auto_16967 ) ) ( not ( = ?auto_16970 ?auto_16968 ) ) ( HOIST-AT ?auto_16973 ?auto_16970 ) ( not ( = ?auto_16971 ?auto_16973 ) ) ( SURFACE-AT ?auto_16967 ?auto_16970 ) ( ON ?auto_16967 ?auto_16974 ) ( CLEAR ?auto_16967 ) ( not ( = ?auto_16966 ?auto_16974 ) ) ( not ( = ?auto_16967 ?auto_16974 ) ) ( not ( = ?auto_16965 ?auto_16974 ) ) ( IS-CRATE ?auto_16966 ) ( AVAILABLE ?auto_16973 ) ( SURFACE-AT ?auto_16966 ?auto_16970 ) ( ON ?auto_16966 ?auto_16969 ) ( CLEAR ?auto_16966 ) ( not ( = ?auto_16966 ?auto_16969 ) ) ( not ( = ?auto_16967 ?auto_16969 ) ) ( not ( = ?auto_16965 ?auto_16969 ) ) ( not ( = ?auto_16974 ?auto_16969 ) ) ( TRUCK-AT ?auto_16972 ?auto_16968 ) ( SURFACE-AT ?auto_16964 ?auto_16968 ) ( CLEAR ?auto_16964 ) ( IS-CRATE ?auto_16965 ) ( not ( = ?auto_16964 ?auto_16965 ) ) ( not ( = ?auto_16966 ?auto_16964 ) ) ( not ( = ?auto_16967 ?auto_16964 ) ) ( not ( = ?auto_16974 ?auto_16964 ) ) ( not ( = ?auto_16969 ?auto_16964 ) ) ( AVAILABLE ?auto_16971 ) ( IN ?auto_16965 ?auto_16972 ) ( ON ?auto_16964 ?auto_16963 ) ( not ( = ?auto_16963 ?auto_16964 ) ) ( not ( = ?auto_16963 ?auto_16965 ) ) ( not ( = ?auto_16963 ?auto_16966 ) ) ( not ( = ?auto_16963 ?auto_16967 ) ) ( not ( = ?auto_16963 ?auto_16974 ) ) ( not ( = ?auto_16963 ?auto_16969 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16965 ?auto_16966 ?auto_16967 )
      ( MAKE-4CRATE-VERIFY ?auto_16963 ?auto_16964 ?auto_16965 ?auto_16966 ?auto_16967 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16975 - SURFACE
      ?auto_16976 - SURFACE
    )
    :vars
    (
      ?auto_16982 - HOIST
      ?auto_16979 - PLACE
      ?auto_16978 - SURFACE
      ?auto_16981 - PLACE
      ?auto_16984 - HOIST
      ?auto_16985 - SURFACE
      ?auto_16980 - SURFACE
      ?auto_16977 - SURFACE
      ?auto_16983 - TRUCK
      ?auto_16986 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16982 ?auto_16979 ) ( IS-CRATE ?auto_16976 ) ( not ( = ?auto_16975 ?auto_16976 ) ) ( not ( = ?auto_16978 ?auto_16975 ) ) ( not ( = ?auto_16978 ?auto_16976 ) ) ( not ( = ?auto_16981 ?auto_16979 ) ) ( HOIST-AT ?auto_16984 ?auto_16981 ) ( not ( = ?auto_16982 ?auto_16984 ) ) ( SURFACE-AT ?auto_16976 ?auto_16981 ) ( ON ?auto_16976 ?auto_16985 ) ( CLEAR ?auto_16976 ) ( not ( = ?auto_16975 ?auto_16985 ) ) ( not ( = ?auto_16976 ?auto_16985 ) ) ( not ( = ?auto_16978 ?auto_16985 ) ) ( IS-CRATE ?auto_16975 ) ( AVAILABLE ?auto_16984 ) ( SURFACE-AT ?auto_16975 ?auto_16981 ) ( ON ?auto_16975 ?auto_16980 ) ( CLEAR ?auto_16975 ) ( not ( = ?auto_16975 ?auto_16980 ) ) ( not ( = ?auto_16976 ?auto_16980 ) ) ( not ( = ?auto_16978 ?auto_16980 ) ) ( not ( = ?auto_16985 ?auto_16980 ) ) ( SURFACE-AT ?auto_16977 ?auto_16979 ) ( CLEAR ?auto_16977 ) ( IS-CRATE ?auto_16978 ) ( not ( = ?auto_16977 ?auto_16978 ) ) ( not ( = ?auto_16975 ?auto_16977 ) ) ( not ( = ?auto_16976 ?auto_16977 ) ) ( not ( = ?auto_16985 ?auto_16977 ) ) ( not ( = ?auto_16980 ?auto_16977 ) ) ( AVAILABLE ?auto_16982 ) ( IN ?auto_16978 ?auto_16983 ) ( TRUCK-AT ?auto_16983 ?auto_16986 ) ( not ( = ?auto_16986 ?auto_16979 ) ) ( not ( = ?auto_16981 ?auto_16986 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16983 ?auto_16986 ?auto_16979 )
      ( MAKE-2CRATE ?auto_16978 ?auto_16975 ?auto_16976 )
      ( MAKE-1CRATE-VERIFY ?auto_16975 ?auto_16976 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16987 - SURFACE
      ?auto_16988 - SURFACE
      ?auto_16989 - SURFACE
    )
    :vars
    (
      ?auto_16991 - HOIST
      ?auto_16998 - PLACE
      ?auto_16997 - PLACE
      ?auto_16990 - HOIST
      ?auto_16993 - SURFACE
      ?auto_16992 - SURFACE
      ?auto_16996 - SURFACE
      ?auto_16994 - TRUCK
      ?auto_16995 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16991 ?auto_16998 ) ( IS-CRATE ?auto_16989 ) ( not ( = ?auto_16988 ?auto_16989 ) ) ( not ( = ?auto_16987 ?auto_16988 ) ) ( not ( = ?auto_16987 ?auto_16989 ) ) ( not ( = ?auto_16997 ?auto_16998 ) ) ( HOIST-AT ?auto_16990 ?auto_16997 ) ( not ( = ?auto_16991 ?auto_16990 ) ) ( SURFACE-AT ?auto_16989 ?auto_16997 ) ( ON ?auto_16989 ?auto_16993 ) ( CLEAR ?auto_16989 ) ( not ( = ?auto_16988 ?auto_16993 ) ) ( not ( = ?auto_16989 ?auto_16993 ) ) ( not ( = ?auto_16987 ?auto_16993 ) ) ( IS-CRATE ?auto_16988 ) ( AVAILABLE ?auto_16990 ) ( SURFACE-AT ?auto_16988 ?auto_16997 ) ( ON ?auto_16988 ?auto_16992 ) ( CLEAR ?auto_16988 ) ( not ( = ?auto_16988 ?auto_16992 ) ) ( not ( = ?auto_16989 ?auto_16992 ) ) ( not ( = ?auto_16987 ?auto_16992 ) ) ( not ( = ?auto_16993 ?auto_16992 ) ) ( SURFACE-AT ?auto_16996 ?auto_16998 ) ( CLEAR ?auto_16996 ) ( IS-CRATE ?auto_16987 ) ( not ( = ?auto_16996 ?auto_16987 ) ) ( not ( = ?auto_16988 ?auto_16996 ) ) ( not ( = ?auto_16989 ?auto_16996 ) ) ( not ( = ?auto_16993 ?auto_16996 ) ) ( not ( = ?auto_16992 ?auto_16996 ) ) ( AVAILABLE ?auto_16991 ) ( IN ?auto_16987 ?auto_16994 ) ( TRUCK-AT ?auto_16994 ?auto_16995 ) ( not ( = ?auto_16995 ?auto_16998 ) ) ( not ( = ?auto_16997 ?auto_16995 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16988 ?auto_16989 )
      ( MAKE-2CRATE-VERIFY ?auto_16987 ?auto_16988 ?auto_16989 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16999 - SURFACE
      ?auto_17000 - SURFACE
      ?auto_17001 - SURFACE
      ?auto_17002 - SURFACE
    )
    :vars
    (
      ?auto_17006 - HOIST
      ?auto_17009 - PLACE
      ?auto_17005 - PLACE
      ?auto_17010 - HOIST
      ?auto_17004 - SURFACE
      ?auto_17008 - SURFACE
      ?auto_17007 - TRUCK
      ?auto_17003 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17006 ?auto_17009 ) ( IS-CRATE ?auto_17002 ) ( not ( = ?auto_17001 ?auto_17002 ) ) ( not ( = ?auto_17000 ?auto_17001 ) ) ( not ( = ?auto_17000 ?auto_17002 ) ) ( not ( = ?auto_17005 ?auto_17009 ) ) ( HOIST-AT ?auto_17010 ?auto_17005 ) ( not ( = ?auto_17006 ?auto_17010 ) ) ( SURFACE-AT ?auto_17002 ?auto_17005 ) ( ON ?auto_17002 ?auto_17004 ) ( CLEAR ?auto_17002 ) ( not ( = ?auto_17001 ?auto_17004 ) ) ( not ( = ?auto_17002 ?auto_17004 ) ) ( not ( = ?auto_17000 ?auto_17004 ) ) ( IS-CRATE ?auto_17001 ) ( AVAILABLE ?auto_17010 ) ( SURFACE-AT ?auto_17001 ?auto_17005 ) ( ON ?auto_17001 ?auto_17008 ) ( CLEAR ?auto_17001 ) ( not ( = ?auto_17001 ?auto_17008 ) ) ( not ( = ?auto_17002 ?auto_17008 ) ) ( not ( = ?auto_17000 ?auto_17008 ) ) ( not ( = ?auto_17004 ?auto_17008 ) ) ( SURFACE-AT ?auto_16999 ?auto_17009 ) ( CLEAR ?auto_16999 ) ( IS-CRATE ?auto_17000 ) ( not ( = ?auto_16999 ?auto_17000 ) ) ( not ( = ?auto_17001 ?auto_16999 ) ) ( not ( = ?auto_17002 ?auto_16999 ) ) ( not ( = ?auto_17004 ?auto_16999 ) ) ( not ( = ?auto_17008 ?auto_16999 ) ) ( AVAILABLE ?auto_17006 ) ( IN ?auto_17000 ?auto_17007 ) ( TRUCK-AT ?auto_17007 ?auto_17003 ) ( not ( = ?auto_17003 ?auto_17009 ) ) ( not ( = ?auto_17005 ?auto_17003 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17000 ?auto_17001 ?auto_17002 )
      ( MAKE-3CRATE-VERIFY ?auto_16999 ?auto_17000 ?auto_17001 ?auto_17002 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17011 - SURFACE
      ?auto_17012 - SURFACE
      ?auto_17013 - SURFACE
      ?auto_17014 - SURFACE
      ?auto_17015 - SURFACE
    )
    :vars
    (
      ?auto_17019 - HOIST
      ?auto_17022 - PLACE
      ?auto_17018 - PLACE
      ?auto_17023 - HOIST
      ?auto_17017 - SURFACE
      ?auto_17021 - SURFACE
      ?auto_17020 - TRUCK
      ?auto_17016 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17019 ?auto_17022 ) ( IS-CRATE ?auto_17015 ) ( not ( = ?auto_17014 ?auto_17015 ) ) ( not ( = ?auto_17013 ?auto_17014 ) ) ( not ( = ?auto_17013 ?auto_17015 ) ) ( not ( = ?auto_17018 ?auto_17022 ) ) ( HOIST-AT ?auto_17023 ?auto_17018 ) ( not ( = ?auto_17019 ?auto_17023 ) ) ( SURFACE-AT ?auto_17015 ?auto_17018 ) ( ON ?auto_17015 ?auto_17017 ) ( CLEAR ?auto_17015 ) ( not ( = ?auto_17014 ?auto_17017 ) ) ( not ( = ?auto_17015 ?auto_17017 ) ) ( not ( = ?auto_17013 ?auto_17017 ) ) ( IS-CRATE ?auto_17014 ) ( AVAILABLE ?auto_17023 ) ( SURFACE-AT ?auto_17014 ?auto_17018 ) ( ON ?auto_17014 ?auto_17021 ) ( CLEAR ?auto_17014 ) ( not ( = ?auto_17014 ?auto_17021 ) ) ( not ( = ?auto_17015 ?auto_17021 ) ) ( not ( = ?auto_17013 ?auto_17021 ) ) ( not ( = ?auto_17017 ?auto_17021 ) ) ( SURFACE-AT ?auto_17012 ?auto_17022 ) ( CLEAR ?auto_17012 ) ( IS-CRATE ?auto_17013 ) ( not ( = ?auto_17012 ?auto_17013 ) ) ( not ( = ?auto_17014 ?auto_17012 ) ) ( not ( = ?auto_17015 ?auto_17012 ) ) ( not ( = ?auto_17017 ?auto_17012 ) ) ( not ( = ?auto_17021 ?auto_17012 ) ) ( AVAILABLE ?auto_17019 ) ( IN ?auto_17013 ?auto_17020 ) ( TRUCK-AT ?auto_17020 ?auto_17016 ) ( not ( = ?auto_17016 ?auto_17022 ) ) ( not ( = ?auto_17018 ?auto_17016 ) ) ( ON ?auto_17012 ?auto_17011 ) ( not ( = ?auto_17011 ?auto_17012 ) ) ( not ( = ?auto_17011 ?auto_17013 ) ) ( not ( = ?auto_17011 ?auto_17014 ) ) ( not ( = ?auto_17011 ?auto_17015 ) ) ( not ( = ?auto_17011 ?auto_17017 ) ) ( not ( = ?auto_17011 ?auto_17021 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17013 ?auto_17014 ?auto_17015 )
      ( MAKE-4CRATE-VERIFY ?auto_17011 ?auto_17012 ?auto_17013 ?auto_17014 ?auto_17015 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17024 - SURFACE
      ?auto_17025 - SURFACE
    )
    :vars
    (
      ?auto_17031 - HOIST
      ?auto_17034 - PLACE
      ?auto_17026 - SURFACE
      ?auto_17030 - PLACE
      ?auto_17035 - HOIST
      ?auto_17029 - SURFACE
      ?auto_17033 - SURFACE
      ?auto_17028 - SURFACE
      ?auto_17032 - TRUCK
      ?auto_17027 - PLACE
      ?auto_17036 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17031 ?auto_17034 ) ( IS-CRATE ?auto_17025 ) ( not ( = ?auto_17024 ?auto_17025 ) ) ( not ( = ?auto_17026 ?auto_17024 ) ) ( not ( = ?auto_17026 ?auto_17025 ) ) ( not ( = ?auto_17030 ?auto_17034 ) ) ( HOIST-AT ?auto_17035 ?auto_17030 ) ( not ( = ?auto_17031 ?auto_17035 ) ) ( SURFACE-AT ?auto_17025 ?auto_17030 ) ( ON ?auto_17025 ?auto_17029 ) ( CLEAR ?auto_17025 ) ( not ( = ?auto_17024 ?auto_17029 ) ) ( not ( = ?auto_17025 ?auto_17029 ) ) ( not ( = ?auto_17026 ?auto_17029 ) ) ( IS-CRATE ?auto_17024 ) ( AVAILABLE ?auto_17035 ) ( SURFACE-AT ?auto_17024 ?auto_17030 ) ( ON ?auto_17024 ?auto_17033 ) ( CLEAR ?auto_17024 ) ( not ( = ?auto_17024 ?auto_17033 ) ) ( not ( = ?auto_17025 ?auto_17033 ) ) ( not ( = ?auto_17026 ?auto_17033 ) ) ( not ( = ?auto_17029 ?auto_17033 ) ) ( SURFACE-AT ?auto_17028 ?auto_17034 ) ( CLEAR ?auto_17028 ) ( IS-CRATE ?auto_17026 ) ( not ( = ?auto_17028 ?auto_17026 ) ) ( not ( = ?auto_17024 ?auto_17028 ) ) ( not ( = ?auto_17025 ?auto_17028 ) ) ( not ( = ?auto_17029 ?auto_17028 ) ) ( not ( = ?auto_17033 ?auto_17028 ) ) ( AVAILABLE ?auto_17031 ) ( TRUCK-AT ?auto_17032 ?auto_17027 ) ( not ( = ?auto_17027 ?auto_17034 ) ) ( not ( = ?auto_17030 ?auto_17027 ) ) ( HOIST-AT ?auto_17036 ?auto_17027 ) ( LIFTING ?auto_17036 ?auto_17026 ) ( not ( = ?auto_17031 ?auto_17036 ) ) ( not ( = ?auto_17035 ?auto_17036 ) ) )
    :subtasks
    ( ( !LOAD ?auto_17036 ?auto_17026 ?auto_17032 ?auto_17027 )
      ( MAKE-2CRATE ?auto_17026 ?auto_17024 ?auto_17025 )
      ( MAKE-1CRATE-VERIFY ?auto_17024 ?auto_17025 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17037 - SURFACE
      ?auto_17038 - SURFACE
      ?auto_17039 - SURFACE
    )
    :vars
    (
      ?auto_17043 - HOIST
      ?auto_17046 - PLACE
      ?auto_17047 - PLACE
      ?auto_17045 - HOIST
      ?auto_17048 - SURFACE
      ?auto_17044 - SURFACE
      ?auto_17042 - SURFACE
      ?auto_17049 - TRUCK
      ?auto_17040 - PLACE
      ?auto_17041 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17043 ?auto_17046 ) ( IS-CRATE ?auto_17039 ) ( not ( = ?auto_17038 ?auto_17039 ) ) ( not ( = ?auto_17037 ?auto_17038 ) ) ( not ( = ?auto_17037 ?auto_17039 ) ) ( not ( = ?auto_17047 ?auto_17046 ) ) ( HOIST-AT ?auto_17045 ?auto_17047 ) ( not ( = ?auto_17043 ?auto_17045 ) ) ( SURFACE-AT ?auto_17039 ?auto_17047 ) ( ON ?auto_17039 ?auto_17048 ) ( CLEAR ?auto_17039 ) ( not ( = ?auto_17038 ?auto_17048 ) ) ( not ( = ?auto_17039 ?auto_17048 ) ) ( not ( = ?auto_17037 ?auto_17048 ) ) ( IS-CRATE ?auto_17038 ) ( AVAILABLE ?auto_17045 ) ( SURFACE-AT ?auto_17038 ?auto_17047 ) ( ON ?auto_17038 ?auto_17044 ) ( CLEAR ?auto_17038 ) ( not ( = ?auto_17038 ?auto_17044 ) ) ( not ( = ?auto_17039 ?auto_17044 ) ) ( not ( = ?auto_17037 ?auto_17044 ) ) ( not ( = ?auto_17048 ?auto_17044 ) ) ( SURFACE-AT ?auto_17042 ?auto_17046 ) ( CLEAR ?auto_17042 ) ( IS-CRATE ?auto_17037 ) ( not ( = ?auto_17042 ?auto_17037 ) ) ( not ( = ?auto_17038 ?auto_17042 ) ) ( not ( = ?auto_17039 ?auto_17042 ) ) ( not ( = ?auto_17048 ?auto_17042 ) ) ( not ( = ?auto_17044 ?auto_17042 ) ) ( AVAILABLE ?auto_17043 ) ( TRUCK-AT ?auto_17049 ?auto_17040 ) ( not ( = ?auto_17040 ?auto_17046 ) ) ( not ( = ?auto_17047 ?auto_17040 ) ) ( HOIST-AT ?auto_17041 ?auto_17040 ) ( LIFTING ?auto_17041 ?auto_17037 ) ( not ( = ?auto_17043 ?auto_17041 ) ) ( not ( = ?auto_17045 ?auto_17041 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17038 ?auto_17039 )
      ( MAKE-2CRATE-VERIFY ?auto_17037 ?auto_17038 ?auto_17039 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17050 - SURFACE
      ?auto_17051 - SURFACE
      ?auto_17052 - SURFACE
      ?auto_17053 - SURFACE
    )
    :vars
    (
      ?auto_17057 - HOIST
      ?auto_17060 - PLACE
      ?auto_17056 - PLACE
      ?auto_17054 - HOIST
      ?auto_17058 - SURFACE
      ?auto_17062 - SURFACE
      ?auto_17059 - TRUCK
      ?auto_17055 - PLACE
      ?auto_17061 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17057 ?auto_17060 ) ( IS-CRATE ?auto_17053 ) ( not ( = ?auto_17052 ?auto_17053 ) ) ( not ( = ?auto_17051 ?auto_17052 ) ) ( not ( = ?auto_17051 ?auto_17053 ) ) ( not ( = ?auto_17056 ?auto_17060 ) ) ( HOIST-AT ?auto_17054 ?auto_17056 ) ( not ( = ?auto_17057 ?auto_17054 ) ) ( SURFACE-AT ?auto_17053 ?auto_17056 ) ( ON ?auto_17053 ?auto_17058 ) ( CLEAR ?auto_17053 ) ( not ( = ?auto_17052 ?auto_17058 ) ) ( not ( = ?auto_17053 ?auto_17058 ) ) ( not ( = ?auto_17051 ?auto_17058 ) ) ( IS-CRATE ?auto_17052 ) ( AVAILABLE ?auto_17054 ) ( SURFACE-AT ?auto_17052 ?auto_17056 ) ( ON ?auto_17052 ?auto_17062 ) ( CLEAR ?auto_17052 ) ( not ( = ?auto_17052 ?auto_17062 ) ) ( not ( = ?auto_17053 ?auto_17062 ) ) ( not ( = ?auto_17051 ?auto_17062 ) ) ( not ( = ?auto_17058 ?auto_17062 ) ) ( SURFACE-AT ?auto_17050 ?auto_17060 ) ( CLEAR ?auto_17050 ) ( IS-CRATE ?auto_17051 ) ( not ( = ?auto_17050 ?auto_17051 ) ) ( not ( = ?auto_17052 ?auto_17050 ) ) ( not ( = ?auto_17053 ?auto_17050 ) ) ( not ( = ?auto_17058 ?auto_17050 ) ) ( not ( = ?auto_17062 ?auto_17050 ) ) ( AVAILABLE ?auto_17057 ) ( TRUCK-AT ?auto_17059 ?auto_17055 ) ( not ( = ?auto_17055 ?auto_17060 ) ) ( not ( = ?auto_17056 ?auto_17055 ) ) ( HOIST-AT ?auto_17061 ?auto_17055 ) ( LIFTING ?auto_17061 ?auto_17051 ) ( not ( = ?auto_17057 ?auto_17061 ) ) ( not ( = ?auto_17054 ?auto_17061 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17051 ?auto_17052 ?auto_17053 )
      ( MAKE-3CRATE-VERIFY ?auto_17050 ?auto_17051 ?auto_17052 ?auto_17053 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17063 - SURFACE
      ?auto_17064 - SURFACE
      ?auto_17065 - SURFACE
      ?auto_17066 - SURFACE
      ?auto_17067 - SURFACE
    )
    :vars
    (
      ?auto_17071 - HOIST
      ?auto_17074 - PLACE
      ?auto_17070 - PLACE
      ?auto_17068 - HOIST
      ?auto_17072 - SURFACE
      ?auto_17076 - SURFACE
      ?auto_17073 - TRUCK
      ?auto_17069 - PLACE
      ?auto_17075 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17071 ?auto_17074 ) ( IS-CRATE ?auto_17067 ) ( not ( = ?auto_17066 ?auto_17067 ) ) ( not ( = ?auto_17065 ?auto_17066 ) ) ( not ( = ?auto_17065 ?auto_17067 ) ) ( not ( = ?auto_17070 ?auto_17074 ) ) ( HOIST-AT ?auto_17068 ?auto_17070 ) ( not ( = ?auto_17071 ?auto_17068 ) ) ( SURFACE-AT ?auto_17067 ?auto_17070 ) ( ON ?auto_17067 ?auto_17072 ) ( CLEAR ?auto_17067 ) ( not ( = ?auto_17066 ?auto_17072 ) ) ( not ( = ?auto_17067 ?auto_17072 ) ) ( not ( = ?auto_17065 ?auto_17072 ) ) ( IS-CRATE ?auto_17066 ) ( AVAILABLE ?auto_17068 ) ( SURFACE-AT ?auto_17066 ?auto_17070 ) ( ON ?auto_17066 ?auto_17076 ) ( CLEAR ?auto_17066 ) ( not ( = ?auto_17066 ?auto_17076 ) ) ( not ( = ?auto_17067 ?auto_17076 ) ) ( not ( = ?auto_17065 ?auto_17076 ) ) ( not ( = ?auto_17072 ?auto_17076 ) ) ( SURFACE-AT ?auto_17064 ?auto_17074 ) ( CLEAR ?auto_17064 ) ( IS-CRATE ?auto_17065 ) ( not ( = ?auto_17064 ?auto_17065 ) ) ( not ( = ?auto_17066 ?auto_17064 ) ) ( not ( = ?auto_17067 ?auto_17064 ) ) ( not ( = ?auto_17072 ?auto_17064 ) ) ( not ( = ?auto_17076 ?auto_17064 ) ) ( AVAILABLE ?auto_17071 ) ( TRUCK-AT ?auto_17073 ?auto_17069 ) ( not ( = ?auto_17069 ?auto_17074 ) ) ( not ( = ?auto_17070 ?auto_17069 ) ) ( HOIST-AT ?auto_17075 ?auto_17069 ) ( LIFTING ?auto_17075 ?auto_17065 ) ( not ( = ?auto_17071 ?auto_17075 ) ) ( not ( = ?auto_17068 ?auto_17075 ) ) ( ON ?auto_17064 ?auto_17063 ) ( not ( = ?auto_17063 ?auto_17064 ) ) ( not ( = ?auto_17063 ?auto_17065 ) ) ( not ( = ?auto_17063 ?auto_17066 ) ) ( not ( = ?auto_17063 ?auto_17067 ) ) ( not ( = ?auto_17063 ?auto_17072 ) ) ( not ( = ?auto_17063 ?auto_17076 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17065 ?auto_17066 ?auto_17067 )
      ( MAKE-4CRATE-VERIFY ?auto_17063 ?auto_17064 ?auto_17065 ?auto_17066 ?auto_17067 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17077 - SURFACE
      ?auto_17078 - SURFACE
    )
    :vars
    (
      ?auto_17083 - HOIST
      ?auto_17087 - PLACE
      ?auto_17079 - SURFACE
      ?auto_17082 - PLACE
      ?auto_17080 - HOIST
      ?auto_17084 - SURFACE
      ?auto_17089 - SURFACE
      ?auto_17085 - SURFACE
      ?auto_17086 - TRUCK
      ?auto_17081 - PLACE
      ?auto_17088 - HOIST
      ?auto_17090 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17083 ?auto_17087 ) ( IS-CRATE ?auto_17078 ) ( not ( = ?auto_17077 ?auto_17078 ) ) ( not ( = ?auto_17079 ?auto_17077 ) ) ( not ( = ?auto_17079 ?auto_17078 ) ) ( not ( = ?auto_17082 ?auto_17087 ) ) ( HOIST-AT ?auto_17080 ?auto_17082 ) ( not ( = ?auto_17083 ?auto_17080 ) ) ( SURFACE-AT ?auto_17078 ?auto_17082 ) ( ON ?auto_17078 ?auto_17084 ) ( CLEAR ?auto_17078 ) ( not ( = ?auto_17077 ?auto_17084 ) ) ( not ( = ?auto_17078 ?auto_17084 ) ) ( not ( = ?auto_17079 ?auto_17084 ) ) ( IS-CRATE ?auto_17077 ) ( AVAILABLE ?auto_17080 ) ( SURFACE-AT ?auto_17077 ?auto_17082 ) ( ON ?auto_17077 ?auto_17089 ) ( CLEAR ?auto_17077 ) ( not ( = ?auto_17077 ?auto_17089 ) ) ( not ( = ?auto_17078 ?auto_17089 ) ) ( not ( = ?auto_17079 ?auto_17089 ) ) ( not ( = ?auto_17084 ?auto_17089 ) ) ( SURFACE-AT ?auto_17085 ?auto_17087 ) ( CLEAR ?auto_17085 ) ( IS-CRATE ?auto_17079 ) ( not ( = ?auto_17085 ?auto_17079 ) ) ( not ( = ?auto_17077 ?auto_17085 ) ) ( not ( = ?auto_17078 ?auto_17085 ) ) ( not ( = ?auto_17084 ?auto_17085 ) ) ( not ( = ?auto_17089 ?auto_17085 ) ) ( AVAILABLE ?auto_17083 ) ( TRUCK-AT ?auto_17086 ?auto_17081 ) ( not ( = ?auto_17081 ?auto_17087 ) ) ( not ( = ?auto_17082 ?auto_17081 ) ) ( HOIST-AT ?auto_17088 ?auto_17081 ) ( not ( = ?auto_17083 ?auto_17088 ) ) ( not ( = ?auto_17080 ?auto_17088 ) ) ( AVAILABLE ?auto_17088 ) ( SURFACE-AT ?auto_17079 ?auto_17081 ) ( ON ?auto_17079 ?auto_17090 ) ( CLEAR ?auto_17079 ) ( not ( = ?auto_17077 ?auto_17090 ) ) ( not ( = ?auto_17078 ?auto_17090 ) ) ( not ( = ?auto_17079 ?auto_17090 ) ) ( not ( = ?auto_17084 ?auto_17090 ) ) ( not ( = ?auto_17089 ?auto_17090 ) ) ( not ( = ?auto_17085 ?auto_17090 ) ) )
    :subtasks
    ( ( !LIFT ?auto_17088 ?auto_17079 ?auto_17090 ?auto_17081 )
      ( MAKE-2CRATE ?auto_17079 ?auto_17077 ?auto_17078 )
      ( MAKE-1CRATE-VERIFY ?auto_17077 ?auto_17078 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17091 - SURFACE
      ?auto_17092 - SURFACE
      ?auto_17093 - SURFACE
    )
    :vars
    (
      ?auto_17099 - HOIST
      ?auto_17101 - PLACE
      ?auto_17094 - PLACE
      ?auto_17104 - HOIST
      ?auto_17102 - SURFACE
      ?auto_17100 - SURFACE
      ?auto_17103 - SURFACE
      ?auto_17097 - TRUCK
      ?auto_17095 - PLACE
      ?auto_17098 - HOIST
      ?auto_17096 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17099 ?auto_17101 ) ( IS-CRATE ?auto_17093 ) ( not ( = ?auto_17092 ?auto_17093 ) ) ( not ( = ?auto_17091 ?auto_17092 ) ) ( not ( = ?auto_17091 ?auto_17093 ) ) ( not ( = ?auto_17094 ?auto_17101 ) ) ( HOIST-AT ?auto_17104 ?auto_17094 ) ( not ( = ?auto_17099 ?auto_17104 ) ) ( SURFACE-AT ?auto_17093 ?auto_17094 ) ( ON ?auto_17093 ?auto_17102 ) ( CLEAR ?auto_17093 ) ( not ( = ?auto_17092 ?auto_17102 ) ) ( not ( = ?auto_17093 ?auto_17102 ) ) ( not ( = ?auto_17091 ?auto_17102 ) ) ( IS-CRATE ?auto_17092 ) ( AVAILABLE ?auto_17104 ) ( SURFACE-AT ?auto_17092 ?auto_17094 ) ( ON ?auto_17092 ?auto_17100 ) ( CLEAR ?auto_17092 ) ( not ( = ?auto_17092 ?auto_17100 ) ) ( not ( = ?auto_17093 ?auto_17100 ) ) ( not ( = ?auto_17091 ?auto_17100 ) ) ( not ( = ?auto_17102 ?auto_17100 ) ) ( SURFACE-AT ?auto_17103 ?auto_17101 ) ( CLEAR ?auto_17103 ) ( IS-CRATE ?auto_17091 ) ( not ( = ?auto_17103 ?auto_17091 ) ) ( not ( = ?auto_17092 ?auto_17103 ) ) ( not ( = ?auto_17093 ?auto_17103 ) ) ( not ( = ?auto_17102 ?auto_17103 ) ) ( not ( = ?auto_17100 ?auto_17103 ) ) ( AVAILABLE ?auto_17099 ) ( TRUCK-AT ?auto_17097 ?auto_17095 ) ( not ( = ?auto_17095 ?auto_17101 ) ) ( not ( = ?auto_17094 ?auto_17095 ) ) ( HOIST-AT ?auto_17098 ?auto_17095 ) ( not ( = ?auto_17099 ?auto_17098 ) ) ( not ( = ?auto_17104 ?auto_17098 ) ) ( AVAILABLE ?auto_17098 ) ( SURFACE-AT ?auto_17091 ?auto_17095 ) ( ON ?auto_17091 ?auto_17096 ) ( CLEAR ?auto_17091 ) ( not ( = ?auto_17092 ?auto_17096 ) ) ( not ( = ?auto_17093 ?auto_17096 ) ) ( not ( = ?auto_17091 ?auto_17096 ) ) ( not ( = ?auto_17102 ?auto_17096 ) ) ( not ( = ?auto_17100 ?auto_17096 ) ) ( not ( = ?auto_17103 ?auto_17096 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17092 ?auto_17093 )
      ( MAKE-2CRATE-VERIFY ?auto_17091 ?auto_17092 ?auto_17093 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17105 - SURFACE
      ?auto_17106 - SURFACE
      ?auto_17107 - SURFACE
      ?auto_17108 - SURFACE
    )
    :vars
    (
      ?auto_17111 - HOIST
      ?auto_17109 - PLACE
      ?auto_17115 - PLACE
      ?auto_17118 - HOIST
      ?auto_17110 - SURFACE
      ?auto_17117 - SURFACE
      ?auto_17116 - TRUCK
      ?auto_17113 - PLACE
      ?auto_17114 - HOIST
      ?auto_17112 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17111 ?auto_17109 ) ( IS-CRATE ?auto_17108 ) ( not ( = ?auto_17107 ?auto_17108 ) ) ( not ( = ?auto_17106 ?auto_17107 ) ) ( not ( = ?auto_17106 ?auto_17108 ) ) ( not ( = ?auto_17115 ?auto_17109 ) ) ( HOIST-AT ?auto_17118 ?auto_17115 ) ( not ( = ?auto_17111 ?auto_17118 ) ) ( SURFACE-AT ?auto_17108 ?auto_17115 ) ( ON ?auto_17108 ?auto_17110 ) ( CLEAR ?auto_17108 ) ( not ( = ?auto_17107 ?auto_17110 ) ) ( not ( = ?auto_17108 ?auto_17110 ) ) ( not ( = ?auto_17106 ?auto_17110 ) ) ( IS-CRATE ?auto_17107 ) ( AVAILABLE ?auto_17118 ) ( SURFACE-AT ?auto_17107 ?auto_17115 ) ( ON ?auto_17107 ?auto_17117 ) ( CLEAR ?auto_17107 ) ( not ( = ?auto_17107 ?auto_17117 ) ) ( not ( = ?auto_17108 ?auto_17117 ) ) ( not ( = ?auto_17106 ?auto_17117 ) ) ( not ( = ?auto_17110 ?auto_17117 ) ) ( SURFACE-AT ?auto_17105 ?auto_17109 ) ( CLEAR ?auto_17105 ) ( IS-CRATE ?auto_17106 ) ( not ( = ?auto_17105 ?auto_17106 ) ) ( not ( = ?auto_17107 ?auto_17105 ) ) ( not ( = ?auto_17108 ?auto_17105 ) ) ( not ( = ?auto_17110 ?auto_17105 ) ) ( not ( = ?auto_17117 ?auto_17105 ) ) ( AVAILABLE ?auto_17111 ) ( TRUCK-AT ?auto_17116 ?auto_17113 ) ( not ( = ?auto_17113 ?auto_17109 ) ) ( not ( = ?auto_17115 ?auto_17113 ) ) ( HOIST-AT ?auto_17114 ?auto_17113 ) ( not ( = ?auto_17111 ?auto_17114 ) ) ( not ( = ?auto_17118 ?auto_17114 ) ) ( AVAILABLE ?auto_17114 ) ( SURFACE-AT ?auto_17106 ?auto_17113 ) ( ON ?auto_17106 ?auto_17112 ) ( CLEAR ?auto_17106 ) ( not ( = ?auto_17107 ?auto_17112 ) ) ( not ( = ?auto_17108 ?auto_17112 ) ) ( not ( = ?auto_17106 ?auto_17112 ) ) ( not ( = ?auto_17110 ?auto_17112 ) ) ( not ( = ?auto_17117 ?auto_17112 ) ) ( not ( = ?auto_17105 ?auto_17112 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17106 ?auto_17107 ?auto_17108 )
      ( MAKE-3CRATE-VERIFY ?auto_17105 ?auto_17106 ?auto_17107 ?auto_17108 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17119 - SURFACE
      ?auto_17120 - SURFACE
      ?auto_17121 - SURFACE
      ?auto_17122 - SURFACE
      ?auto_17123 - SURFACE
    )
    :vars
    (
      ?auto_17126 - HOIST
      ?auto_17124 - PLACE
      ?auto_17130 - PLACE
      ?auto_17133 - HOIST
      ?auto_17125 - SURFACE
      ?auto_17132 - SURFACE
      ?auto_17131 - TRUCK
      ?auto_17128 - PLACE
      ?auto_17129 - HOIST
      ?auto_17127 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17126 ?auto_17124 ) ( IS-CRATE ?auto_17123 ) ( not ( = ?auto_17122 ?auto_17123 ) ) ( not ( = ?auto_17121 ?auto_17122 ) ) ( not ( = ?auto_17121 ?auto_17123 ) ) ( not ( = ?auto_17130 ?auto_17124 ) ) ( HOIST-AT ?auto_17133 ?auto_17130 ) ( not ( = ?auto_17126 ?auto_17133 ) ) ( SURFACE-AT ?auto_17123 ?auto_17130 ) ( ON ?auto_17123 ?auto_17125 ) ( CLEAR ?auto_17123 ) ( not ( = ?auto_17122 ?auto_17125 ) ) ( not ( = ?auto_17123 ?auto_17125 ) ) ( not ( = ?auto_17121 ?auto_17125 ) ) ( IS-CRATE ?auto_17122 ) ( AVAILABLE ?auto_17133 ) ( SURFACE-AT ?auto_17122 ?auto_17130 ) ( ON ?auto_17122 ?auto_17132 ) ( CLEAR ?auto_17122 ) ( not ( = ?auto_17122 ?auto_17132 ) ) ( not ( = ?auto_17123 ?auto_17132 ) ) ( not ( = ?auto_17121 ?auto_17132 ) ) ( not ( = ?auto_17125 ?auto_17132 ) ) ( SURFACE-AT ?auto_17120 ?auto_17124 ) ( CLEAR ?auto_17120 ) ( IS-CRATE ?auto_17121 ) ( not ( = ?auto_17120 ?auto_17121 ) ) ( not ( = ?auto_17122 ?auto_17120 ) ) ( not ( = ?auto_17123 ?auto_17120 ) ) ( not ( = ?auto_17125 ?auto_17120 ) ) ( not ( = ?auto_17132 ?auto_17120 ) ) ( AVAILABLE ?auto_17126 ) ( TRUCK-AT ?auto_17131 ?auto_17128 ) ( not ( = ?auto_17128 ?auto_17124 ) ) ( not ( = ?auto_17130 ?auto_17128 ) ) ( HOIST-AT ?auto_17129 ?auto_17128 ) ( not ( = ?auto_17126 ?auto_17129 ) ) ( not ( = ?auto_17133 ?auto_17129 ) ) ( AVAILABLE ?auto_17129 ) ( SURFACE-AT ?auto_17121 ?auto_17128 ) ( ON ?auto_17121 ?auto_17127 ) ( CLEAR ?auto_17121 ) ( not ( = ?auto_17122 ?auto_17127 ) ) ( not ( = ?auto_17123 ?auto_17127 ) ) ( not ( = ?auto_17121 ?auto_17127 ) ) ( not ( = ?auto_17125 ?auto_17127 ) ) ( not ( = ?auto_17132 ?auto_17127 ) ) ( not ( = ?auto_17120 ?auto_17127 ) ) ( ON ?auto_17120 ?auto_17119 ) ( not ( = ?auto_17119 ?auto_17120 ) ) ( not ( = ?auto_17119 ?auto_17121 ) ) ( not ( = ?auto_17119 ?auto_17122 ) ) ( not ( = ?auto_17119 ?auto_17123 ) ) ( not ( = ?auto_17119 ?auto_17125 ) ) ( not ( = ?auto_17119 ?auto_17132 ) ) ( not ( = ?auto_17119 ?auto_17127 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17121 ?auto_17122 ?auto_17123 )
      ( MAKE-4CRATE-VERIFY ?auto_17119 ?auto_17120 ?auto_17121 ?auto_17122 ?auto_17123 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17134 - SURFACE
      ?auto_17135 - SURFACE
    )
    :vars
    (
      ?auto_17138 - HOIST
      ?auto_17136 - PLACE
      ?auto_17145 - SURFACE
      ?auto_17143 - PLACE
      ?auto_17147 - HOIST
      ?auto_17137 - SURFACE
      ?auto_17146 - SURFACE
      ?auto_17141 - SURFACE
      ?auto_17140 - PLACE
      ?auto_17142 - HOIST
      ?auto_17139 - SURFACE
      ?auto_17144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17138 ?auto_17136 ) ( IS-CRATE ?auto_17135 ) ( not ( = ?auto_17134 ?auto_17135 ) ) ( not ( = ?auto_17145 ?auto_17134 ) ) ( not ( = ?auto_17145 ?auto_17135 ) ) ( not ( = ?auto_17143 ?auto_17136 ) ) ( HOIST-AT ?auto_17147 ?auto_17143 ) ( not ( = ?auto_17138 ?auto_17147 ) ) ( SURFACE-AT ?auto_17135 ?auto_17143 ) ( ON ?auto_17135 ?auto_17137 ) ( CLEAR ?auto_17135 ) ( not ( = ?auto_17134 ?auto_17137 ) ) ( not ( = ?auto_17135 ?auto_17137 ) ) ( not ( = ?auto_17145 ?auto_17137 ) ) ( IS-CRATE ?auto_17134 ) ( AVAILABLE ?auto_17147 ) ( SURFACE-AT ?auto_17134 ?auto_17143 ) ( ON ?auto_17134 ?auto_17146 ) ( CLEAR ?auto_17134 ) ( not ( = ?auto_17134 ?auto_17146 ) ) ( not ( = ?auto_17135 ?auto_17146 ) ) ( not ( = ?auto_17145 ?auto_17146 ) ) ( not ( = ?auto_17137 ?auto_17146 ) ) ( SURFACE-AT ?auto_17141 ?auto_17136 ) ( CLEAR ?auto_17141 ) ( IS-CRATE ?auto_17145 ) ( not ( = ?auto_17141 ?auto_17145 ) ) ( not ( = ?auto_17134 ?auto_17141 ) ) ( not ( = ?auto_17135 ?auto_17141 ) ) ( not ( = ?auto_17137 ?auto_17141 ) ) ( not ( = ?auto_17146 ?auto_17141 ) ) ( AVAILABLE ?auto_17138 ) ( not ( = ?auto_17140 ?auto_17136 ) ) ( not ( = ?auto_17143 ?auto_17140 ) ) ( HOIST-AT ?auto_17142 ?auto_17140 ) ( not ( = ?auto_17138 ?auto_17142 ) ) ( not ( = ?auto_17147 ?auto_17142 ) ) ( AVAILABLE ?auto_17142 ) ( SURFACE-AT ?auto_17145 ?auto_17140 ) ( ON ?auto_17145 ?auto_17139 ) ( CLEAR ?auto_17145 ) ( not ( = ?auto_17134 ?auto_17139 ) ) ( not ( = ?auto_17135 ?auto_17139 ) ) ( not ( = ?auto_17145 ?auto_17139 ) ) ( not ( = ?auto_17137 ?auto_17139 ) ) ( not ( = ?auto_17146 ?auto_17139 ) ) ( not ( = ?auto_17141 ?auto_17139 ) ) ( TRUCK-AT ?auto_17144 ?auto_17136 ) )
    :subtasks
    ( ( !DRIVE ?auto_17144 ?auto_17136 ?auto_17140 )
      ( MAKE-2CRATE ?auto_17145 ?auto_17134 ?auto_17135 )
      ( MAKE-1CRATE-VERIFY ?auto_17134 ?auto_17135 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17148 - SURFACE
      ?auto_17149 - SURFACE
      ?auto_17150 - SURFACE
    )
    :vars
    (
      ?auto_17157 - HOIST
      ?auto_17159 - PLACE
      ?auto_17161 - PLACE
      ?auto_17151 - HOIST
      ?auto_17160 - SURFACE
      ?auto_17158 - SURFACE
      ?auto_17153 - SURFACE
      ?auto_17154 - PLACE
      ?auto_17156 - HOIST
      ?auto_17155 - SURFACE
      ?auto_17152 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17157 ?auto_17159 ) ( IS-CRATE ?auto_17150 ) ( not ( = ?auto_17149 ?auto_17150 ) ) ( not ( = ?auto_17148 ?auto_17149 ) ) ( not ( = ?auto_17148 ?auto_17150 ) ) ( not ( = ?auto_17161 ?auto_17159 ) ) ( HOIST-AT ?auto_17151 ?auto_17161 ) ( not ( = ?auto_17157 ?auto_17151 ) ) ( SURFACE-AT ?auto_17150 ?auto_17161 ) ( ON ?auto_17150 ?auto_17160 ) ( CLEAR ?auto_17150 ) ( not ( = ?auto_17149 ?auto_17160 ) ) ( not ( = ?auto_17150 ?auto_17160 ) ) ( not ( = ?auto_17148 ?auto_17160 ) ) ( IS-CRATE ?auto_17149 ) ( AVAILABLE ?auto_17151 ) ( SURFACE-AT ?auto_17149 ?auto_17161 ) ( ON ?auto_17149 ?auto_17158 ) ( CLEAR ?auto_17149 ) ( not ( = ?auto_17149 ?auto_17158 ) ) ( not ( = ?auto_17150 ?auto_17158 ) ) ( not ( = ?auto_17148 ?auto_17158 ) ) ( not ( = ?auto_17160 ?auto_17158 ) ) ( SURFACE-AT ?auto_17153 ?auto_17159 ) ( CLEAR ?auto_17153 ) ( IS-CRATE ?auto_17148 ) ( not ( = ?auto_17153 ?auto_17148 ) ) ( not ( = ?auto_17149 ?auto_17153 ) ) ( not ( = ?auto_17150 ?auto_17153 ) ) ( not ( = ?auto_17160 ?auto_17153 ) ) ( not ( = ?auto_17158 ?auto_17153 ) ) ( AVAILABLE ?auto_17157 ) ( not ( = ?auto_17154 ?auto_17159 ) ) ( not ( = ?auto_17161 ?auto_17154 ) ) ( HOIST-AT ?auto_17156 ?auto_17154 ) ( not ( = ?auto_17157 ?auto_17156 ) ) ( not ( = ?auto_17151 ?auto_17156 ) ) ( AVAILABLE ?auto_17156 ) ( SURFACE-AT ?auto_17148 ?auto_17154 ) ( ON ?auto_17148 ?auto_17155 ) ( CLEAR ?auto_17148 ) ( not ( = ?auto_17149 ?auto_17155 ) ) ( not ( = ?auto_17150 ?auto_17155 ) ) ( not ( = ?auto_17148 ?auto_17155 ) ) ( not ( = ?auto_17160 ?auto_17155 ) ) ( not ( = ?auto_17158 ?auto_17155 ) ) ( not ( = ?auto_17153 ?auto_17155 ) ) ( TRUCK-AT ?auto_17152 ?auto_17159 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17149 ?auto_17150 )
      ( MAKE-2CRATE-VERIFY ?auto_17148 ?auto_17149 ?auto_17150 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17162 - SURFACE
      ?auto_17163 - SURFACE
      ?auto_17164 - SURFACE
      ?auto_17165 - SURFACE
    )
    :vars
    (
      ?auto_17167 - HOIST
      ?auto_17174 - PLACE
      ?auto_17172 - PLACE
      ?auto_17166 - HOIST
      ?auto_17173 - SURFACE
      ?auto_17171 - SURFACE
      ?auto_17170 - PLACE
      ?auto_17168 - HOIST
      ?auto_17169 - SURFACE
      ?auto_17175 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17167 ?auto_17174 ) ( IS-CRATE ?auto_17165 ) ( not ( = ?auto_17164 ?auto_17165 ) ) ( not ( = ?auto_17163 ?auto_17164 ) ) ( not ( = ?auto_17163 ?auto_17165 ) ) ( not ( = ?auto_17172 ?auto_17174 ) ) ( HOIST-AT ?auto_17166 ?auto_17172 ) ( not ( = ?auto_17167 ?auto_17166 ) ) ( SURFACE-AT ?auto_17165 ?auto_17172 ) ( ON ?auto_17165 ?auto_17173 ) ( CLEAR ?auto_17165 ) ( not ( = ?auto_17164 ?auto_17173 ) ) ( not ( = ?auto_17165 ?auto_17173 ) ) ( not ( = ?auto_17163 ?auto_17173 ) ) ( IS-CRATE ?auto_17164 ) ( AVAILABLE ?auto_17166 ) ( SURFACE-AT ?auto_17164 ?auto_17172 ) ( ON ?auto_17164 ?auto_17171 ) ( CLEAR ?auto_17164 ) ( not ( = ?auto_17164 ?auto_17171 ) ) ( not ( = ?auto_17165 ?auto_17171 ) ) ( not ( = ?auto_17163 ?auto_17171 ) ) ( not ( = ?auto_17173 ?auto_17171 ) ) ( SURFACE-AT ?auto_17162 ?auto_17174 ) ( CLEAR ?auto_17162 ) ( IS-CRATE ?auto_17163 ) ( not ( = ?auto_17162 ?auto_17163 ) ) ( not ( = ?auto_17164 ?auto_17162 ) ) ( not ( = ?auto_17165 ?auto_17162 ) ) ( not ( = ?auto_17173 ?auto_17162 ) ) ( not ( = ?auto_17171 ?auto_17162 ) ) ( AVAILABLE ?auto_17167 ) ( not ( = ?auto_17170 ?auto_17174 ) ) ( not ( = ?auto_17172 ?auto_17170 ) ) ( HOIST-AT ?auto_17168 ?auto_17170 ) ( not ( = ?auto_17167 ?auto_17168 ) ) ( not ( = ?auto_17166 ?auto_17168 ) ) ( AVAILABLE ?auto_17168 ) ( SURFACE-AT ?auto_17163 ?auto_17170 ) ( ON ?auto_17163 ?auto_17169 ) ( CLEAR ?auto_17163 ) ( not ( = ?auto_17164 ?auto_17169 ) ) ( not ( = ?auto_17165 ?auto_17169 ) ) ( not ( = ?auto_17163 ?auto_17169 ) ) ( not ( = ?auto_17173 ?auto_17169 ) ) ( not ( = ?auto_17171 ?auto_17169 ) ) ( not ( = ?auto_17162 ?auto_17169 ) ) ( TRUCK-AT ?auto_17175 ?auto_17174 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17163 ?auto_17164 ?auto_17165 )
      ( MAKE-3CRATE-VERIFY ?auto_17162 ?auto_17163 ?auto_17164 ?auto_17165 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17176 - SURFACE
      ?auto_17177 - SURFACE
      ?auto_17178 - SURFACE
      ?auto_17179 - SURFACE
      ?auto_17180 - SURFACE
    )
    :vars
    (
      ?auto_17182 - HOIST
      ?auto_17189 - PLACE
      ?auto_17187 - PLACE
      ?auto_17181 - HOIST
      ?auto_17188 - SURFACE
      ?auto_17186 - SURFACE
      ?auto_17185 - PLACE
      ?auto_17183 - HOIST
      ?auto_17184 - SURFACE
      ?auto_17190 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17182 ?auto_17189 ) ( IS-CRATE ?auto_17180 ) ( not ( = ?auto_17179 ?auto_17180 ) ) ( not ( = ?auto_17178 ?auto_17179 ) ) ( not ( = ?auto_17178 ?auto_17180 ) ) ( not ( = ?auto_17187 ?auto_17189 ) ) ( HOIST-AT ?auto_17181 ?auto_17187 ) ( not ( = ?auto_17182 ?auto_17181 ) ) ( SURFACE-AT ?auto_17180 ?auto_17187 ) ( ON ?auto_17180 ?auto_17188 ) ( CLEAR ?auto_17180 ) ( not ( = ?auto_17179 ?auto_17188 ) ) ( not ( = ?auto_17180 ?auto_17188 ) ) ( not ( = ?auto_17178 ?auto_17188 ) ) ( IS-CRATE ?auto_17179 ) ( AVAILABLE ?auto_17181 ) ( SURFACE-AT ?auto_17179 ?auto_17187 ) ( ON ?auto_17179 ?auto_17186 ) ( CLEAR ?auto_17179 ) ( not ( = ?auto_17179 ?auto_17186 ) ) ( not ( = ?auto_17180 ?auto_17186 ) ) ( not ( = ?auto_17178 ?auto_17186 ) ) ( not ( = ?auto_17188 ?auto_17186 ) ) ( SURFACE-AT ?auto_17177 ?auto_17189 ) ( CLEAR ?auto_17177 ) ( IS-CRATE ?auto_17178 ) ( not ( = ?auto_17177 ?auto_17178 ) ) ( not ( = ?auto_17179 ?auto_17177 ) ) ( not ( = ?auto_17180 ?auto_17177 ) ) ( not ( = ?auto_17188 ?auto_17177 ) ) ( not ( = ?auto_17186 ?auto_17177 ) ) ( AVAILABLE ?auto_17182 ) ( not ( = ?auto_17185 ?auto_17189 ) ) ( not ( = ?auto_17187 ?auto_17185 ) ) ( HOIST-AT ?auto_17183 ?auto_17185 ) ( not ( = ?auto_17182 ?auto_17183 ) ) ( not ( = ?auto_17181 ?auto_17183 ) ) ( AVAILABLE ?auto_17183 ) ( SURFACE-AT ?auto_17178 ?auto_17185 ) ( ON ?auto_17178 ?auto_17184 ) ( CLEAR ?auto_17178 ) ( not ( = ?auto_17179 ?auto_17184 ) ) ( not ( = ?auto_17180 ?auto_17184 ) ) ( not ( = ?auto_17178 ?auto_17184 ) ) ( not ( = ?auto_17188 ?auto_17184 ) ) ( not ( = ?auto_17186 ?auto_17184 ) ) ( not ( = ?auto_17177 ?auto_17184 ) ) ( TRUCK-AT ?auto_17190 ?auto_17189 ) ( ON ?auto_17177 ?auto_17176 ) ( not ( = ?auto_17176 ?auto_17177 ) ) ( not ( = ?auto_17176 ?auto_17178 ) ) ( not ( = ?auto_17176 ?auto_17179 ) ) ( not ( = ?auto_17176 ?auto_17180 ) ) ( not ( = ?auto_17176 ?auto_17188 ) ) ( not ( = ?auto_17176 ?auto_17186 ) ) ( not ( = ?auto_17176 ?auto_17184 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17178 ?auto_17179 ?auto_17180 )
      ( MAKE-4CRATE-VERIFY ?auto_17176 ?auto_17177 ?auto_17178 ?auto_17179 ?auto_17180 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17191 - SURFACE
      ?auto_17192 - SURFACE
    )
    :vars
    (
      ?auto_17194 - HOIST
      ?auto_17203 - PLACE
      ?auto_17199 - SURFACE
      ?auto_17201 - PLACE
      ?auto_17193 - HOIST
      ?auto_17202 - SURFACE
      ?auto_17198 - SURFACE
      ?auto_17200 - SURFACE
      ?auto_17197 - PLACE
      ?auto_17195 - HOIST
      ?auto_17196 - SURFACE
      ?auto_17204 - TRUCK
      ?auto_17205 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17194 ?auto_17203 ) ( IS-CRATE ?auto_17192 ) ( not ( = ?auto_17191 ?auto_17192 ) ) ( not ( = ?auto_17199 ?auto_17191 ) ) ( not ( = ?auto_17199 ?auto_17192 ) ) ( not ( = ?auto_17201 ?auto_17203 ) ) ( HOIST-AT ?auto_17193 ?auto_17201 ) ( not ( = ?auto_17194 ?auto_17193 ) ) ( SURFACE-AT ?auto_17192 ?auto_17201 ) ( ON ?auto_17192 ?auto_17202 ) ( CLEAR ?auto_17192 ) ( not ( = ?auto_17191 ?auto_17202 ) ) ( not ( = ?auto_17192 ?auto_17202 ) ) ( not ( = ?auto_17199 ?auto_17202 ) ) ( IS-CRATE ?auto_17191 ) ( AVAILABLE ?auto_17193 ) ( SURFACE-AT ?auto_17191 ?auto_17201 ) ( ON ?auto_17191 ?auto_17198 ) ( CLEAR ?auto_17191 ) ( not ( = ?auto_17191 ?auto_17198 ) ) ( not ( = ?auto_17192 ?auto_17198 ) ) ( not ( = ?auto_17199 ?auto_17198 ) ) ( not ( = ?auto_17202 ?auto_17198 ) ) ( IS-CRATE ?auto_17199 ) ( not ( = ?auto_17200 ?auto_17199 ) ) ( not ( = ?auto_17191 ?auto_17200 ) ) ( not ( = ?auto_17192 ?auto_17200 ) ) ( not ( = ?auto_17202 ?auto_17200 ) ) ( not ( = ?auto_17198 ?auto_17200 ) ) ( not ( = ?auto_17197 ?auto_17203 ) ) ( not ( = ?auto_17201 ?auto_17197 ) ) ( HOIST-AT ?auto_17195 ?auto_17197 ) ( not ( = ?auto_17194 ?auto_17195 ) ) ( not ( = ?auto_17193 ?auto_17195 ) ) ( AVAILABLE ?auto_17195 ) ( SURFACE-AT ?auto_17199 ?auto_17197 ) ( ON ?auto_17199 ?auto_17196 ) ( CLEAR ?auto_17199 ) ( not ( = ?auto_17191 ?auto_17196 ) ) ( not ( = ?auto_17192 ?auto_17196 ) ) ( not ( = ?auto_17199 ?auto_17196 ) ) ( not ( = ?auto_17202 ?auto_17196 ) ) ( not ( = ?auto_17198 ?auto_17196 ) ) ( not ( = ?auto_17200 ?auto_17196 ) ) ( TRUCK-AT ?auto_17204 ?auto_17203 ) ( SURFACE-AT ?auto_17205 ?auto_17203 ) ( CLEAR ?auto_17205 ) ( LIFTING ?auto_17194 ?auto_17200 ) ( IS-CRATE ?auto_17200 ) ( not ( = ?auto_17205 ?auto_17200 ) ) ( not ( = ?auto_17191 ?auto_17205 ) ) ( not ( = ?auto_17192 ?auto_17205 ) ) ( not ( = ?auto_17199 ?auto_17205 ) ) ( not ( = ?auto_17202 ?auto_17205 ) ) ( not ( = ?auto_17198 ?auto_17205 ) ) ( not ( = ?auto_17196 ?auto_17205 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17205 ?auto_17200 )
      ( MAKE-2CRATE ?auto_17199 ?auto_17191 ?auto_17192 )
      ( MAKE-1CRATE-VERIFY ?auto_17191 ?auto_17192 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17206 - SURFACE
      ?auto_17207 - SURFACE
      ?auto_17208 - SURFACE
    )
    :vars
    (
      ?auto_17218 - HOIST
      ?auto_17210 - PLACE
      ?auto_17209 - PLACE
      ?auto_17219 - HOIST
      ?auto_17217 - SURFACE
      ?auto_17214 - SURFACE
      ?auto_17216 - SURFACE
      ?auto_17211 - PLACE
      ?auto_17213 - HOIST
      ?auto_17212 - SURFACE
      ?auto_17220 - TRUCK
      ?auto_17215 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17218 ?auto_17210 ) ( IS-CRATE ?auto_17208 ) ( not ( = ?auto_17207 ?auto_17208 ) ) ( not ( = ?auto_17206 ?auto_17207 ) ) ( not ( = ?auto_17206 ?auto_17208 ) ) ( not ( = ?auto_17209 ?auto_17210 ) ) ( HOIST-AT ?auto_17219 ?auto_17209 ) ( not ( = ?auto_17218 ?auto_17219 ) ) ( SURFACE-AT ?auto_17208 ?auto_17209 ) ( ON ?auto_17208 ?auto_17217 ) ( CLEAR ?auto_17208 ) ( not ( = ?auto_17207 ?auto_17217 ) ) ( not ( = ?auto_17208 ?auto_17217 ) ) ( not ( = ?auto_17206 ?auto_17217 ) ) ( IS-CRATE ?auto_17207 ) ( AVAILABLE ?auto_17219 ) ( SURFACE-AT ?auto_17207 ?auto_17209 ) ( ON ?auto_17207 ?auto_17214 ) ( CLEAR ?auto_17207 ) ( not ( = ?auto_17207 ?auto_17214 ) ) ( not ( = ?auto_17208 ?auto_17214 ) ) ( not ( = ?auto_17206 ?auto_17214 ) ) ( not ( = ?auto_17217 ?auto_17214 ) ) ( IS-CRATE ?auto_17206 ) ( not ( = ?auto_17216 ?auto_17206 ) ) ( not ( = ?auto_17207 ?auto_17216 ) ) ( not ( = ?auto_17208 ?auto_17216 ) ) ( not ( = ?auto_17217 ?auto_17216 ) ) ( not ( = ?auto_17214 ?auto_17216 ) ) ( not ( = ?auto_17211 ?auto_17210 ) ) ( not ( = ?auto_17209 ?auto_17211 ) ) ( HOIST-AT ?auto_17213 ?auto_17211 ) ( not ( = ?auto_17218 ?auto_17213 ) ) ( not ( = ?auto_17219 ?auto_17213 ) ) ( AVAILABLE ?auto_17213 ) ( SURFACE-AT ?auto_17206 ?auto_17211 ) ( ON ?auto_17206 ?auto_17212 ) ( CLEAR ?auto_17206 ) ( not ( = ?auto_17207 ?auto_17212 ) ) ( not ( = ?auto_17208 ?auto_17212 ) ) ( not ( = ?auto_17206 ?auto_17212 ) ) ( not ( = ?auto_17217 ?auto_17212 ) ) ( not ( = ?auto_17214 ?auto_17212 ) ) ( not ( = ?auto_17216 ?auto_17212 ) ) ( TRUCK-AT ?auto_17220 ?auto_17210 ) ( SURFACE-AT ?auto_17215 ?auto_17210 ) ( CLEAR ?auto_17215 ) ( LIFTING ?auto_17218 ?auto_17216 ) ( IS-CRATE ?auto_17216 ) ( not ( = ?auto_17215 ?auto_17216 ) ) ( not ( = ?auto_17207 ?auto_17215 ) ) ( not ( = ?auto_17208 ?auto_17215 ) ) ( not ( = ?auto_17206 ?auto_17215 ) ) ( not ( = ?auto_17217 ?auto_17215 ) ) ( not ( = ?auto_17214 ?auto_17215 ) ) ( not ( = ?auto_17212 ?auto_17215 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17207 ?auto_17208 )
      ( MAKE-2CRATE-VERIFY ?auto_17206 ?auto_17207 ?auto_17208 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17221 - SURFACE
      ?auto_17222 - SURFACE
      ?auto_17223 - SURFACE
      ?auto_17224 - SURFACE
    )
    :vars
    (
      ?auto_17234 - HOIST
      ?auto_17228 - PLACE
      ?auto_17231 - PLACE
      ?auto_17229 - HOIST
      ?auto_17235 - SURFACE
      ?auto_17230 - SURFACE
      ?auto_17227 - PLACE
      ?auto_17226 - HOIST
      ?auto_17232 - SURFACE
      ?auto_17225 - TRUCK
      ?auto_17233 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17234 ?auto_17228 ) ( IS-CRATE ?auto_17224 ) ( not ( = ?auto_17223 ?auto_17224 ) ) ( not ( = ?auto_17222 ?auto_17223 ) ) ( not ( = ?auto_17222 ?auto_17224 ) ) ( not ( = ?auto_17231 ?auto_17228 ) ) ( HOIST-AT ?auto_17229 ?auto_17231 ) ( not ( = ?auto_17234 ?auto_17229 ) ) ( SURFACE-AT ?auto_17224 ?auto_17231 ) ( ON ?auto_17224 ?auto_17235 ) ( CLEAR ?auto_17224 ) ( not ( = ?auto_17223 ?auto_17235 ) ) ( not ( = ?auto_17224 ?auto_17235 ) ) ( not ( = ?auto_17222 ?auto_17235 ) ) ( IS-CRATE ?auto_17223 ) ( AVAILABLE ?auto_17229 ) ( SURFACE-AT ?auto_17223 ?auto_17231 ) ( ON ?auto_17223 ?auto_17230 ) ( CLEAR ?auto_17223 ) ( not ( = ?auto_17223 ?auto_17230 ) ) ( not ( = ?auto_17224 ?auto_17230 ) ) ( not ( = ?auto_17222 ?auto_17230 ) ) ( not ( = ?auto_17235 ?auto_17230 ) ) ( IS-CRATE ?auto_17222 ) ( not ( = ?auto_17221 ?auto_17222 ) ) ( not ( = ?auto_17223 ?auto_17221 ) ) ( not ( = ?auto_17224 ?auto_17221 ) ) ( not ( = ?auto_17235 ?auto_17221 ) ) ( not ( = ?auto_17230 ?auto_17221 ) ) ( not ( = ?auto_17227 ?auto_17228 ) ) ( not ( = ?auto_17231 ?auto_17227 ) ) ( HOIST-AT ?auto_17226 ?auto_17227 ) ( not ( = ?auto_17234 ?auto_17226 ) ) ( not ( = ?auto_17229 ?auto_17226 ) ) ( AVAILABLE ?auto_17226 ) ( SURFACE-AT ?auto_17222 ?auto_17227 ) ( ON ?auto_17222 ?auto_17232 ) ( CLEAR ?auto_17222 ) ( not ( = ?auto_17223 ?auto_17232 ) ) ( not ( = ?auto_17224 ?auto_17232 ) ) ( not ( = ?auto_17222 ?auto_17232 ) ) ( not ( = ?auto_17235 ?auto_17232 ) ) ( not ( = ?auto_17230 ?auto_17232 ) ) ( not ( = ?auto_17221 ?auto_17232 ) ) ( TRUCK-AT ?auto_17225 ?auto_17228 ) ( SURFACE-AT ?auto_17233 ?auto_17228 ) ( CLEAR ?auto_17233 ) ( LIFTING ?auto_17234 ?auto_17221 ) ( IS-CRATE ?auto_17221 ) ( not ( = ?auto_17233 ?auto_17221 ) ) ( not ( = ?auto_17223 ?auto_17233 ) ) ( not ( = ?auto_17224 ?auto_17233 ) ) ( not ( = ?auto_17222 ?auto_17233 ) ) ( not ( = ?auto_17235 ?auto_17233 ) ) ( not ( = ?auto_17230 ?auto_17233 ) ) ( not ( = ?auto_17232 ?auto_17233 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17222 ?auto_17223 ?auto_17224 )
      ( MAKE-3CRATE-VERIFY ?auto_17221 ?auto_17222 ?auto_17223 ?auto_17224 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17236 - SURFACE
      ?auto_17237 - SURFACE
      ?auto_17238 - SURFACE
      ?auto_17239 - SURFACE
      ?auto_17240 - SURFACE
    )
    :vars
    (
      ?auto_17249 - HOIST
      ?auto_17244 - PLACE
      ?auto_17247 - PLACE
      ?auto_17245 - HOIST
      ?auto_17250 - SURFACE
      ?auto_17246 - SURFACE
      ?auto_17243 - PLACE
      ?auto_17242 - HOIST
      ?auto_17248 - SURFACE
      ?auto_17241 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17249 ?auto_17244 ) ( IS-CRATE ?auto_17240 ) ( not ( = ?auto_17239 ?auto_17240 ) ) ( not ( = ?auto_17238 ?auto_17239 ) ) ( not ( = ?auto_17238 ?auto_17240 ) ) ( not ( = ?auto_17247 ?auto_17244 ) ) ( HOIST-AT ?auto_17245 ?auto_17247 ) ( not ( = ?auto_17249 ?auto_17245 ) ) ( SURFACE-AT ?auto_17240 ?auto_17247 ) ( ON ?auto_17240 ?auto_17250 ) ( CLEAR ?auto_17240 ) ( not ( = ?auto_17239 ?auto_17250 ) ) ( not ( = ?auto_17240 ?auto_17250 ) ) ( not ( = ?auto_17238 ?auto_17250 ) ) ( IS-CRATE ?auto_17239 ) ( AVAILABLE ?auto_17245 ) ( SURFACE-AT ?auto_17239 ?auto_17247 ) ( ON ?auto_17239 ?auto_17246 ) ( CLEAR ?auto_17239 ) ( not ( = ?auto_17239 ?auto_17246 ) ) ( not ( = ?auto_17240 ?auto_17246 ) ) ( not ( = ?auto_17238 ?auto_17246 ) ) ( not ( = ?auto_17250 ?auto_17246 ) ) ( IS-CRATE ?auto_17238 ) ( not ( = ?auto_17237 ?auto_17238 ) ) ( not ( = ?auto_17239 ?auto_17237 ) ) ( not ( = ?auto_17240 ?auto_17237 ) ) ( not ( = ?auto_17250 ?auto_17237 ) ) ( not ( = ?auto_17246 ?auto_17237 ) ) ( not ( = ?auto_17243 ?auto_17244 ) ) ( not ( = ?auto_17247 ?auto_17243 ) ) ( HOIST-AT ?auto_17242 ?auto_17243 ) ( not ( = ?auto_17249 ?auto_17242 ) ) ( not ( = ?auto_17245 ?auto_17242 ) ) ( AVAILABLE ?auto_17242 ) ( SURFACE-AT ?auto_17238 ?auto_17243 ) ( ON ?auto_17238 ?auto_17248 ) ( CLEAR ?auto_17238 ) ( not ( = ?auto_17239 ?auto_17248 ) ) ( not ( = ?auto_17240 ?auto_17248 ) ) ( not ( = ?auto_17238 ?auto_17248 ) ) ( not ( = ?auto_17250 ?auto_17248 ) ) ( not ( = ?auto_17246 ?auto_17248 ) ) ( not ( = ?auto_17237 ?auto_17248 ) ) ( TRUCK-AT ?auto_17241 ?auto_17244 ) ( SURFACE-AT ?auto_17236 ?auto_17244 ) ( CLEAR ?auto_17236 ) ( LIFTING ?auto_17249 ?auto_17237 ) ( IS-CRATE ?auto_17237 ) ( not ( = ?auto_17236 ?auto_17237 ) ) ( not ( = ?auto_17239 ?auto_17236 ) ) ( not ( = ?auto_17240 ?auto_17236 ) ) ( not ( = ?auto_17238 ?auto_17236 ) ) ( not ( = ?auto_17250 ?auto_17236 ) ) ( not ( = ?auto_17246 ?auto_17236 ) ) ( not ( = ?auto_17248 ?auto_17236 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17238 ?auto_17239 ?auto_17240 )
      ( MAKE-4CRATE-VERIFY ?auto_17236 ?auto_17237 ?auto_17238 ?auto_17239 ?auto_17240 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17251 - SURFACE
      ?auto_17252 - SURFACE
    )
    :vars
    (
      ?auto_17264 - HOIST
      ?auto_17257 - PLACE
      ?auto_17255 - SURFACE
      ?auto_17261 - PLACE
      ?auto_17258 - HOIST
      ?auto_17265 - SURFACE
      ?auto_17259 - SURFACE
      ?auto_17260 - SURFACE
      ?auto_17256 - PLACE
      ?auto_17254 - HOIST
      ?auto_17262 - SURFACE
      ?auto_17253 - TRUCK
      ?auto_17263 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17264 ?auto_17257 ) ( IS-CRATE ?auto_17252 ) ( not ( = ?auto_17251 ?auto_17252 ) ) ( not ( = ?auto_17255 ?auto_17251 ) ) ( not ( = ?auto_17255 ?auto_17252 ) ) ( not ( = ?auto_17261 ?auto_17257 ) ) ( HOIST-AT ?auto_17258 ?auto_17261 ) ( not ( = ?auto_17264 ?auto_17258 ) ) ( SURFACE-AT ?auto_17252 ?auto_17261 ) ( ON ?auto_17252 ?auto_17265 ) ( CLEAR ?auto_17252 ) ( not ( = ?auto_17251 ?auto_17265 ) ) ( not ( = ?auto_17252 ?auto_17265 ) ) ( not ( = ?auto_17255 ?auto_17265 ) ) ( IS-CRATE ?auto_17251 ) ( AVAILABLE ?auto_17258 ) ( SURFACE-AT ?auto_17251 ?auto_17261 ) ( ON ?auto_17251 ?auto_17259 ) ( CLEAR ?auto_17251 ) ( not ( = ?auto_17251 ?auto_17259 ) ) ( not ( = ?auto_17252 ?auto_17259 ) ) ( not ( = ?auto_17255 ?auto_17259 ) ) ( not ( = ?auto_17265 ?auto_17259 ) ) ( IS-CRATE ?auto_17255 ) ( not ( = ?auto_17260 ?auto_17255 ) ) ( not ( = ?auto_17251 ?auto_17260 ) ) ( not ( = ?auto_17252 ?auto_17260 ) ) ( not ( = ?auto_17265 ?auto_17260 ) ) ( not ( = ?auto_17259 ?auto_17260 ) ) ( not ( = ?auto_17256 ?auto_17257 ) ) ( not ( = ?auto_17261 ?auto_17256 ) ) ( HOIST-AT ?auto_17254 ?auto_17256 ) ( not ( = ?auto_17264 ?auto_17254 ) ) ( not ( = ?auto_17258 ?auto_17254 ) ) ( AVAILABLE ?auto_17254 ) ( SURFACE-AT ?auto_17255 ?auto_17256 ) ( ON ?auto_17255 ?auto_17262 ) ( CLEAR ?auto_17255 ) ( not ( = ?auto_17251 ?auto_17262 ) ) ( not ( = ?auto_17252 ?auto_17262 ) ) ( not ( = ?auto_17255 ?auto_17262 ) ) ( not ( = ?auto_17265 ?auto_17262 ) ) ( not ( = ?auto_17259 ?auto_17262 ) ) ( not ( = ?auto_17260 ?auto_17262 ) ) ( TRUCK-AT ?auto_17253 ?auto_17257 ) ( SURFACE-AT ?auto_17263 ?auto_17257 ) ( CLEAR ?auto_17263 ) ( IS-CRATE ?auto_17260 ) ( not ( = ?auto_17263 ?auto_17260 ) ) ( not ( = ?auto_17251 ?auto_17263 ) ) ( not ( = ?auto_17252 ?auto_17263 ) ) ( not ( = ?auto_17255 ?auto_17263 ) ) ( not ( = ?auto_17265 ?auto_17263 ) ) ( not ( = ?auto_17259 ?auto_17263 ) ) ( not ( = ?auto_17262 ?auto_17263 ) ) ( AVAILABLE ?auto_17264 ) ( IN ?auto_17260 ?auto_17253 ) )
    :subtasks
    ( ( !UNLOAD ?auto_17264 ?auto_17260 ?auto_17253 ?auto_17257 )
      ( MAKE-2CRATE ?auto_17255 ?auto_17251 ?auto_17252 )
      ( MAKE-1CRATE-VERIFY ?auto_17251 ?auto_17252 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17266 - SURFACE
      ?auto_17267 - SURFACE
      ?auto_17268 - SURFACE
    )
    :vars
    (
      ?auto_17280 - HOIST
      ?auto_17270 - PLACE
      ?auto_17272 - PLACE
      ?auto_17277 - HOIST
      ?auto_17273 - SURFACE
      ?auto_17275 - SURFACE
      ?auto_17279 - SURFACE
      ?auto_17276 - PLACE
      ?auto_17274 - HOIST
      ?auto_17271 - SURFACE
      ?auto_17269 - TRUCK
      ?auto_17278 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17280 ?auto_17270 ) ( IS-CRATE ?auto_17268 ) ( not ( = ?auto_17267 ?auto_17268 ) ) ( not ( = ?auto_17266 ?auto_17267 ) ) ( not ( = ?auto_17266 ?auto_17268 ) ) ( not ( = ?auto_17272 ?auto_17270 ) ) ( HOIST-AT ?auto_17277 ?auto_17272 ) ( not ( = ?auto_17280 ?auto_17277 ) ) ( SURFACE-AT ?auto_17268 ?auto_17272 ) ( ON ?auto_17268 ?auto_17273 ) ( CLEAR ?auto_17268 ) ( not ( = ?auto_17267 ?auto_17273 ) ) ( not ( = ?auto_17268 ?auto_17273 ) ) ( not ( = ?auto_17266 ?auto_17273 ) ) ( IS-CRATE ?auto_17267 ) ( AVAILABLE ?auto_17277 ) ( SURFACE-AT ?auto_17267 ?auto_17272 ) ( ON ?auto_17267 ?auto_17275 ) ( CLEAR ?auto_17267 ) ( not ( = ?auto_17267 ?auto_17275 ) ) ( not ( = ?auto_17268 ?auto_17275 ) ) ( not ( = ?auto_17266 ?auto_17275 ) ) ( not ( = ?auto_17273 ?auto_17275 ) ) ( IS-CRATE ?auto_17266 ) ( not ( = ?auto_17279 ?auto_17266 ) ) ( not ( = ?auto_17267 ?auto_17279 ) ) ( not ( = ?auto_17268 ?auto_17279 ) ) ( not ( = ?auto_17273 ?auto_17279 ) ) ( not ( = ?auto_17275 ?auto_17279 ) ) ( not ( = ?auto_17276 ?auto_17270 ) ) ( not ( = ?auto_17272 ?auto_17276 ) ) ( HOIST-AT ?auto_17274 ?auto_17276 ) ( not ( = ?auto_17280 ?auto_17274 ) ) ( not ( = ?auto_17277 ?auto_17274 ) ) ( AVAILABLE ?auto_17274 ) ( SURFACE-AT ?auto_17266 ?auto_17276 ) ( ON ?auto_17266 ?auto_17271 ) ( CLEAR ?auto_17266 ) ( not ( = ?auto_17267 ?auto_17271 ) ) ( not ( = ?auto_17268 ?auto_17271 ) ) ( not ( = ?auto_17266 ?auto_17271 ) ) ( not ( = ?auto_17273 ?auto_17271 ) ) ( not ( = ?auto_17275 ?auto_17271 ) ) ( not ( = ?auto_17279 ?auto_17271 ) ) ( TRUCK-AT ?auto_17269 ?auto_17270 ) ( SURFACE-AT ?auto_17278 ?auto_17270 ) ( CLEAR ?auto_17278 ) ( IS-CRATE ?auto_17279 ) ( not ( = ?auto_17278 ?auto_17279 ) ) ( not ( = ?auto_17267 ?auto_17278 ) ) ( not ( = ?auto_17268 ?auto_17278 ) ) ( not ( = ?auto_17266 ?auto_17278 ) ) ( not ( = ?auto_17273 ?auto_17278 ) ) ( not ( = ?auto_17275 ?auto_17278 ) ) ( not ( = ?auto_17271 ?auto_17278 ) ) ( AVAILABLE ?auto_17280 ) ( IN ?auto_17279 ?auto_17269 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17267 ?auto_17268 )
      ( MAKE-2CRATE-VERIFY ?auto_17266 ?auto_17267 ?auto_17268 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17281 - SURFACE
      ?auto_17282 - SURFACE
      ?auto_17283 - SURFACE
      ?auto_17284 - SURFACE
    )
    :vars
    (
      ?auto_17285 - HOIST
      ?auto_17286 - PLACE
      ?auto_17291 - PLACE
      ?auto_17293 - HOIST
      ?auto_17288 - SURFACE
      ?auto_17287 - SURFACE
      ?auto_17289 - PLACE
      ?auto_17295 - HOIST
      ?auto_17290 - SURFACE
      ?auto_17292 - TRUCK
      ?auto_17294 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17285 ?auto_17286 ) ( IS-CRATE ?auto_17284 ) ( not ( = ?auto_17283 ?auto_17284 ) ) ( not ( = ?auto_17282 ?auto_17283 ) ) ( not ( = ?auto_17282 ?auto_17284 ) ) ( not ( = ?auto_17291 ?auto_17286 ) ) ( HOIST-AT ?auto_17293 ?auto_17291 ) ( not ( = ?auto_17285 ?auto_17293 ) ) ( SURFACE-AT ?auto_17284 ?auto_17291 ) ( ON ?auto_17284 ?auto_17288 ) ( CLEAR ?auto_17284 ) ( not ( = ?auto_17283 ?auto_17288 ) ) ( not ( = ?auto_17284 ?auto_17288 ) ) ( not ( = ?auto_17282 ?auto_17288 ) ) ( IS-CRATE ?auto_17283 ) ( AVAILABLE ?auto_17293 ) ( SURFACE-AT ?auto_17283 ?auto_17291 ) ( ON ?auto_17283 ?auto_17287 ) ( CLEAR ?auto_17283 ) ( not ( = ?auto_17283 ?auto_17287 ) ) ( not ( = ?auto_17284 ?auto_17287 ) ) ( not ( = ?auto_17282 ?auto_17287 ) ) ( not ( = ?auto_17288 ?auto_17287 ) ) ( IS-CRATE ?auto_17282 ) ( not ( = ?auto_17281 ?auto_17282 ) ) ( not ( = ?auto_17283 ?auto_17281 ) ) ( not ( = ?auto_17284 ?auto_17281 ) ) ( not ( = ?auto_17288 ?auto_17281 ) ) ( not ( = ?auto_17287 ?auto_17281 ) ) ( not ( = ?auto_17289 ?auto_17286 ) ) ( not ( = ?auto_17291 ?auto_17289 ) ) ( HOIST-AT ?auto_17295 ?auto_17289 ) ( not ( = ?auto_17285 ?auto_17295 ) ) ( not ( = ?auto_17293 ?auto_17295 ) ) ( AVAILABLE ?auto_17295 ) ( SURFACE-AT ?auto_17282 ?auto_17289 ) ( ON ?auto_17282 ?auto_17290 ) ( CLEAR ?auto_17282 ) ( not ( = ?auto_17283 ?auto_17290 ) ) ( not ( = ?auto_17284 ?auto_17290 ) ) ( not ( = ?auto_17282 ?auto_17290 ) ) ( not ( = ?auto_17288 ?auto_17290 ) ) ( not ( = ?auto_17287 ?auto_17290 ) ) ( not ( = ?auto_17281 ?auto_17290 ) ) ( TRUCK-AT ?auto_17292 ?auto_17286 ) ( SURFACE-AT ?auto_17294 ?auto_17286 ) ( CLEAR ?auto_17294 ) ( IS-CRATE ?auto_17281 ) ( not ( = ?auto_17294 ?auto_17281 ) ) ( not ( = ?auto_17283 ?auto_17294 ) ) ( not ( = ?auto_17284 ?auto_17294 ) ) ( not ( = ?auto_17282 ?auto_17294 ) ) ( not ( = ?auto_17288 ?auto_17294 ) ) ( not ( = ?auto_17287 ?auto_17294 ) ) ( not ( = ?auto_17290 ?auto_17294 ) ) ( AVAILABLE ?auto_17285 ) ( IN ?auto_17281 ?auto_17292 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17282 ?auto_17283 ?auto_17284 )
      ( MAKE-3CRATE-VERIFY ?auto_17281 ?auto_17282 ?auto_17283 ?auto_17284 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17296 - SURFACE
      ?auto_17297 - SURFACE
      ?auto_17298 - SURFACE
      ?auto_17299 - SURFACE
      ?auto_17300 - SURFACE
    )
    :vars
    (
      ?auto_17301 - HOIST
      ?auto_17302 - PLACE
      ?auto_17307 - PLACE
      ?auto_17309 - HOIST
      ?auto_17304 - SURFACE
      ?auto_17303 - SURFACE
      ?auto_17305 - PLACE
      ?auto_17310 - HOIST
      ?auto_17306 - SURFACE
      ?auto_17308 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17301 ?auto_17302 ) ( IS-CRATE ?auto_17300 ) ( not ( = ?auto_17299 ?auto_17300 ) ) ( not ( = ?auto_17298 ?auto_17299 ) ) ( not ( = ?auto_17298 ?auto_17300 ) ) ( not ( = ?auto_17307 ?auto_17302 ) ) ( HOIST-AT ?auto_17309 ?auto_17307 ) ( not ( = ?auto_17301 ?auto_17309 ) ) ( SURFACE-AT ?auto_17300 ?auto_17307 ) ( ON ?auto_17300 ?auto_17304 ) ( CLEAR ?auto_17300 ) ( not ( = ?auto_17299 ?auto_17304 ) ) ( not ( = ?auto_17300 ?auto_17304 ) ) ( not ( = ?auto_17298 ?auto_17304 ) ) ( IS-CRATE ?auto_17299 ) ( AVAILABLE ?auto_17309 ) ( SURFACE-AT ?auto_17299 ?auto_17307 ) ( ON ?auto_17299 ?auto_17303 ) ( CLEAR ?auto_17299 ) ( not ( = ?auto_17299 ?auto_17303 ) ) ( not ( = ?auto_17300 ?auto_17303 ) ) ( not ( = ?auto_17298 ?auto_17303 ) ) ( not ( = ?auto_17304 ?auto_17303 ) ) ( IS-CRATE ?auto_17298 ) ( not ( = ?auto_17297 ?auto_17298 ) ) ( not ( = ?auto_17299 ?auto_17297 ) ) ( not ( = ?auto_17300 ?auto_17297 ) ) ( not ( = ?auto_17304 ?auto_17297 ) ) ( not ( = ?auto_17303 ?auto_17297 ) ) ( not ( = ?auto_17305 ?auto_17302 ) ) ( not ( = ?auto_17307 ?auto_17305 ) ) ( HOIST-AT ?auto_17310 ?auto_17305 ) ( not ( = ?auto_17301 ?auto_17310 ) ) ( not ( = ?auto_17309 ?auto_17310 ) ) ( AVAILABLE ?auto_17310 ) ( SURFACE-AT ?auto_17298 ?auto_17305 ) ( ON ?auto_17298 ?auto_17306 ) ( CLEAR ?auto_17298 ) ( not ( = ?auto_17299 ?auto_17306 ) ) ( not ( = ?auto_17300 ?auto_17306 ) ) ( not ( = ?auto_17298 ?auto_17306 ) ) ( not ( = ?auto_17304 ?auto_17306 ) ) ( not ( = ?auto_17303 ?auto_17306 ) ) ( not ( = ?auto_17297 ?auto_17306 ) ) ( TRUCK-AT ?auto_17308 ?auto_17302 ) ( SURFACE-AT ?auto_17296 ?auto_17302 ) ( CLEAR ?auto_17296 ) ( IS-CRATE ?auto_17297 ) ( not ( = ?auto_17296 ?auto_17297 ) ) ( not ( = ?auto_17299 ?auto_17296 ) ) ( not ( = ?auto_17300 ?auto_17296 ) ) ( not ( = ?auto_17298 ?auto_17296 ) ) ( not ( = ?auto_17304 ?auto_17296 ) ) ( not ( = ?auto_17303 ?auto_17296 ) ) ( not ( = ?auto_17306 ?auto_17296 ) ) ( AVAILABLE ?auto_17301 ) ( IN ?auto_17297 ?auto_17308 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17298 ?auto_17299 ?auto_17300 )
      ( MAKE-4CRATE-VERIFY ?auto_17296 ?auto_17297 ?auto_17298 ?auto_17299 ?auto_17300 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17311 - SURFACE
      ?auto_17312 - SURFACE
    )
    :vars
    (
      ?auto_17313 - HOIST
      ?auto_17314 - PLACE
      ?auto_17325 - SURFACE
      ?auto_17320 - PLACE
      ?auto_17322 - HOIST
      ?auto_17316 - SURFACE
      ?auto_17315 - SURFACE
      ?auto_17317 - SURFACE
      ?auto_17318 - PLACE
      ?auto_17324 - HOIST
      ?auto_17319 - SURFACE
      ?auto_17323 - SURFACE
      ?auto_17321 - TRUCK
      ?auto_17326 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17313 ?auto_17314 ) ( IS-CRATE ?auto_17312 ) ( not ( = ?auto_17311 ?auto_17312 ) ) ( not ( = ?auto_17325 ?auto_17311 ) ) ( not ( = ?auto_17325 ?auto_17312 ) ) ( not ( = ?auto_17320 ?auto_17314 ) ) ( HOIST-AT ?auto_17322 ?auto_17320 ) ( not ( = ?auto_17313 ?auto_17322 ) ) ( SURFACE-AT ?auto_17312 ?auto_17320 ) ( ON ?auto_17312 ?auto_17316 ) ( CLEAR ?auto_17312 ) ( not ( = ?auto_17311 ?auto_17316 ) ) ( not ( = ?auto_17312 ?auto_17316 ) ) ( not ( = ?auto_17325 ?auto_17316 ) ) ( IS-CRATE ?auto_17311 ) ( AVAILABLE ?auto_17322 ) ( SURFACE-AT ?auto_17311 ?auto_17320 ) ( ON ?auto_17311 ?auto_17315 ) ( CLEAR ?auto_17311 ) ( not ( = ?auto_17311 ?auto_17315 ) ) ( not ( = ?auto_17312 ?auto_17315 ) ) ( not ( = ?auto_17325 ?auto_17315 ) ) ( not ( = ?auto_17316 ?auto_17315 ) ) ( IS-CRATE ?auto_17325 ) ( not ( = ?auto_17317 ?auto_17325 ) ) ( not ( = ?auto_17311 ?auto_17317 ) ) ( not ( = ?auto_17312 ?auto_17317 ) ) ( not ( = ?auto_17316 ?auto_17317 ) ) ( not ( = ?auto_17315 ?auto_17317 ) ) ( not ( = ?auto_17318 ?auto_17314 ) ) ( not ( = ?auto_17320 ?auto_17318 ) ) ( HOIST-AT ?auto_17324 ?auto_17318 ) ( not ( = ?auto_17313 ?auto_17324 ) ) ( not ( = ?auto_17322 ?auto_17324 ) ) ( AVAILABLE ?auto_17324 ) ( SURFACE-AT ?auto_17325 ?auto_17318 ) ( ON ?auto_17325 ?auto_17319 ) ( CLEAR ?auto_17325 ) ( not ( = ?auto_17311 ?auto_17319 ) ) ( not ( = ?auto_17312 ?auto_17319 ) ) ( not ( = ?auto_17325 ?auto_17319 ) ) ( not ( = ?auto_17316 ?auto_17319 ) ) ( not ( = ?auto_17315 ?auto_17319 ) ) ( not ( = ?auto_17317 ?auto_17319 ) ) ( SURFACE-AT ?auto_17323 ?auto_17314 ) ( CLEAR ?auto_17323 ) ( IS-CRATE ?auto_17317 ) ( not ( = ?auto_17323 ?auto_17317 ) ) ( not ( = ?auto_17311 ?auto_17323 ) ) ( not ( = ?auto_17312 ?auto_17323 ) ) ( not ( = ?auto_17325 ?auto_17323 ) ) ( not ( = ?auto_17316 ?auto_17323 ) ) ( not ( = ?auto_17315 ?auto_17323 ) ) ( not ( = ?auto_17319 ?auto_17323 ) ) ( AVAILABLE ?auto_17313 ) ( IN ?auto_17317 ?auto_17321 ) ( TRUCK-AT ?auto_17321 ?auto_17326 ) ( not ( = ?auto_17326 ?auto_17314 ) ) ( not ( = ?auto_17320 ?auto_17326 ) ) ( not ( = ?auto_17318 ?auto_17326 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17321 ?auto_17326 ?auto_17314 )
      ( MAKE-2CRATE ?auto_17325 ?auto_17311 ?auto_17312 )
      ( MAKE-1CRATE-VERIFY ?auto_17311 ?auto_17312 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17327 - SURFACE
      ?auto_17328 - SURFACE
      ?auto_17329 - SURFACE
    )
    :vars
    (
      ?auto_17342 - HOIST
      ?auto_17339 - PLACE
      ?auto_17332 - PLACE
      ?auto_17335 - HOIST
      ?auto_17331 - SURFACE
      ?auto_17333 - SURFACE
      ?auto_17338 - SURFACE
      ?auto_17336 - PLACE
      ?auto_17330 - HOIST
      ?auto_17337 - SURFACE
      ?auto_17341 - SURFACE
      ?auto_17334 - TRUCK
      ?auto_17340 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17342 ?auto_17339 ) ( IS-CRATE ?auto_17329 ) ( not ( = ?auto_17328 ?auto_17329 ) ) ( not ( = ?auto_17327 ?auto_17328 ) ) ( not ( = ?auto_17327 ?auto_17329 ) ) ( not ( = ?auto_17332 ?auto_17339 ) ) ( HOIST-AT ?auto_17335 ?auto_17332 ) ( not ( = ?auto_17342 ?auto_17335 ) ) ( SURFACE-AT ?auto_17329 ?auto_17332 ) ( ON ?auto_17329 ?auto_17331 ) ( CLEAR ?auto_17329 ) ( not ( = ?auto_17328 ?auto_17331 ) ) ( not ( = ?auto_17329 ?auto_17331 ) ) ( not ( = ?auto_17327 ?auto_17331 ) ) ( IS-CRATE ?auto_17328 ) ( AVAILABLE ?auto_17335 ) ( SURFACE-AT ?auto_17328 ?auto_17332 ) ( ON ?auto_17328 ?auto_17333 ) ( CLEAR ?auto_17328 ) ( not ( = ?auto_17328 ?auto_17333 ) ) ( not ( = ?auto_17329 ?auto_17333 ) ) ( not ( = ?auto_17327 ?auto_17333 ) ) ( not ( = ?auto_17331 ?auto_17333 ) ) ( IS-CRATE ?auto_17327 ) ( not ( = ?auto_17338 ?auto_17327 ) ) ( not ( = ?auto_17328 ?auto_17338 ) ) ( not ( = ?auto_17329 ?auto_17338 ) ) ( not ( = ?auto_17331 ?auto_17338 ) ) ( not ( = ?auto_17333 ?auto_17338 ) ) ( not ( = ?auto_17336 ?auto_17339 ) ) ( not ( = ?auto_17332 ?auto_17336 ) ) ( HOIST-AT ?auto_17330 ?auto_17336 ) ( not ( = ?auto_17342 ?auto_17330 ) ) ( not ( = ?auto_17335 ?auto_17330 ) ) ( AVAILABLE ?auto_17330 ) ( SURFACE-AT ?auto_17327 ?auto_17336 ) ( ON ?auto_17327 ?auto_17337 ) ( CLEAR ?auto_17327 ) ( not ( = ?auto_17328 ?auto_17337 ) ) ( not ( = ?auto_17329 ?auto_17337 ) ) ( not ( = ?auto_17327 ?auto_17337 ) ) ( not ( = ?auto_17331 ?auto_17337 ) ) ( not ( = ?auto_17333 ?auto_17337 ) ) ( not ( = ?auto_17338 ?auto_17337 ) ) ( SURFACE-AT ?auto_17341 ?auto_17339 ) ( CLEAR ?auto_17341 ) ( IS-CRATE ?auto_17338 ) ( not ( = ?auto_17341 ?auto_17338 ) ) ( not ( = ?auto_17328 ?auto_17341 ) ) ( not ( = ?auto_17329 ?auto_17341 ) ) ( not ( = ?auto_17327 ?auto_17341 ) ) ( not ( = ?auto_17331 ?auto_17341 ) ) ( not ( = ?auto_17333 ?auto_17341 ) ) ( not ( = ?auto_17337 ?auto_17341 ) ) ( AVAILABLE ?auto_17342 ) ( IN ?auto_17338 ?auto_17334 ) ( TRUCK-AT ?auto_17334 ?auto_17340 ) ( not ( = ?auto_17340 ?auto_17339 ) ) ( not ( = ?auto_17332 ?auto_17340 ) ) ( not ( = ?auto_17336 ?auto_17340 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17328 ?auto_17329 )
      ( MAKE-2CRATE-VERIFY ?auto_17327 ?auto_17328 ?auto_17329 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17343 - SURFACE
      ?auto_17344 - SURFACE
      ?auto_17345 - SURFACE
      ?auto_17346 - SURFACE
    )
    :vars
    (
      ?auto_17354 - HOIST
      ?auto_17350 - PLACE
      ?auto_17347 - PLACE
      ?auto_17353 - HOIST
      ?auto_17355 - SURFACE
      ?auto_17349 - SURFACE
      ?auto_17358 - PLACE
      ?auto_17357 - HOIST
      ?auto_17356 - SURFACE
      ?auto_17348 - SURFACE
      ?auto_17351 - TRUCK
      ?auto_17352 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17354 ?auto_17350 ) ( IS-CRATE ?auto_17346 ) ( not ( = ?auto_17345 ?auto_17346 ) ) ( not ( = ?auto_17344 ?auto_17345 ) ) ( not ( = ?auto_17344 ?auto_17346 ) ) ( not ( = ?auto_17347 ?auto_17350 ) ) ( HOIST-AT ?auto_17353 ?auto_17347 ) ( not ( = ?auto_17354 ?auto_17353 ) ) ( SURFACE-AT ?auto_17346 ?auto_17347 ) ( ON ?auto_17346 ?auto_17355 ) ( CLEAR ?auto_17346 ) ( not ( = ?auto_17345 ?auto_17355 ) ) ( not ( = ?auto_17346 ?auto_17355 ) ) ( not ( = ?auto_17344 ?auto_17355 ) ) ( IS-CRATE ?auto_17345 ) ( AVAILABLE ?auto_17353 ) ( SURFACE-AT ?auto_17345 ?auto_17347 ) ( ON ?auto_17345 ?auto_17349 ) ( CLEAR ?auto_17345 ) ( not ( = ?auto_17345 ?auto_17349 ) ) ( not ( = ?auto_17346 ?auto_17349 ) ) ( not ( = ?auto_17344 ?auto_17349 ) ) ( not ( = ?auto_17355 ?auto_17349 ) ) ( IS-CRATE ?auto_17344 ) ( not ( = ?auto_17343 ?auto_17344 ) ) ( not ( = ?auto_17345 ?auto_17343 ) ) ( not ( = ?auto_17346 ?auto_17343 ) ) ( not ( = ?auto_17355 ?auto_17343 ) ) ( not ( = ?auto_17349 ?auto_17343 ) ) ( not ( = ?auto_17358 ?auto_17350 ) ) ( not ( = ?auto_17347 ?auto_17358 ) ) ( HOIST-AT ?auto_17357 ?auto_17358 ) ( not ( = ?auto_17354 ?auto_17357 ) ) ( not ( = ?auto_17353 ?auto_17357 ) ) ( AVAILABLE ?auto_17357 ) ( SURFACE-AT ?auto_17344 ?auto_17358 ) ( ON ?auto_17344 ?auto_17356 ) ( CLEAR ?auto_17344 ) ( not ( = ?auto_17345 ?auto_17356 ) ) ( not ( = ?auto_17346 ?auto_17356 ) ) ( not ( = ?auto_17344 ?auto_17356 ) ) ( not ( = ?auto_17355 ?auto_17356 ) ) ( not ( = ?auto_17349 ?auto_17356 ) ) ( not ( = ?auto_17343 ?auto_17356 ) ) ( SURFACE-AT ?auto_17348 ?auto_17350 ) ( CLEAR ?auto_17348 ) ( IS-CRATE ?auto_17343 ) ( not ( = ?auto_17348 ?auto_17343 ) ) ( not ( = ?auto_17345 ?auto_17348 ) ) ( not ( = ?auto_17346 ?auto_17348 ) ) ( not ( = ?auto_17344 ?auto_17348 ) ) ( not ( = ?auto_17355 ?auto_17348 ) ) ( not ( = ?auto_17349 ?auto_17348 ) ) ( not ( = ?auto_17356 ?auto_17348 ) ) ( AVAILABLE ?auto_17354 ) ( IN ?auto_17343 ?auto_17351 ) ( TRUCK-AT ?auto_17351 ?auto_17352 ) ( not ( = ?auto_17352 ?auto_17350 ) ) ( not ( = ?auto_17347 ?auto_17352 ) ) ( not ( = ?auto_17358 ?auto_17352 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17344 ?auto_17345 ?auto_17346 )
      ( MAKE-3CRATE-VERIFY ?auto_17343 ?auto_17344 ?auto_17345 ?auto_17346 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17359 - SURFACE
      ?auto_17360 - SURFACE
      ?auto_17361 - SURFACE
      ?auto_17362 - SURFACE
      ?auto_17363 - SURFACE
    )
    :vars
    (
      ?auto_17370 - HOIST
      ?auto_17366 - PLACE
      ?auto_17364 - PLACE
      ?auto_17369 - HOIST
      ?auto_17371 - SURFACE
      ?auto_17365 - SURFACE
      ?auto_17374 - PLACE
      ?auto_17373 - HOIST
      ?auto_17372 - SURFACE
      ?auto_17367 - TRUCK
      ?auto_17368 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17370 ?auto_17366 ) ( IS-CRATE ?auto_17363 ) ( not ( = ?auto_17362 ?auto_17363 ) ) ( not ( = ?auto_17361 ?auto_17362 ) ) ( not ( = ?auto_17361 ?auto_17363 ) ) ( not ( = ?auto_17364 ?auto_17366 ) ) ( HOIST-AT ?auto_17369 ?auto_17364 ) ( not ( = ?auto_17370 ?auto_17369 ) ) ( SURFACE-AT ?auto_17363 ?auto_17364 ) ( ON ?auto_17363 ?auto_17371 ) ( CLEAR ?auto_17363 ) ( not ( = ?auto_17362 ?auto_17371 ) ) ( not ( = ?auto_17363 ?auto_17371 ) ) ( not ( = ?auto_17361 ?auto_17371 ) ) ( IS-CRATE ?auto_17362 ) ( AVAILABLE ?auto_17369 ) ( SURFACE-AT ?auto_17362 ?auto_17364 ) ( ON ?auto_17362 ?auto_17365 ) ( CLEAR ?auto_17362 ) ( not ( = ?auto_17362 ?auto_17365 ) ) ( not ( = ?auto_17363 ?auto_17365 ) ) ( not ( = ?auto_17361 ?auto_17365 ) ) ( not ( = ?auto_17371 ?auto_17365 ) ) ( IS-CRATE ?auto_17361 ) ( not ( = ?auto_17360 ?auto_17361 ) ) ( not ( = ?auto_17362 ?auto_17360 ) ) ( not ( = ?auto_17363 ?auto_17360 ) ) ( not ( = ?auto_17371 ?auto_17360 ) ) ( not ( = ?auto_17365 ?auto_17360 ) ) ( not ( = ?auto_17374 ?auto_17366 ) ) ( not ( = ?auto_17364 ?auto_17374 ) ) ( HOIST-AT ?auto_17373 ?auto_17374 ) ( not ( = ?auto_17370 ?auto_17373 ) ) ( not ( = ?auto_17369 ?auto_17373 ) ) ( AVAILABLE ?auto_17373 ) ( SURFACE-AT ?auto_17361 ?auto_17374 ) ( ON ?auto_17361 ?auto_17372 ) ( CLEAR ?auto_17361 ) ( not ( = ?auto_17362 ?auto_17372 ) ) ( not ( = ?auto_17363 ?auto_17372 ) ) ( not ( = ?auto_17361 ?auto_17372 ) ) ( not ( = ?auto_17371 ?auto_17372 ) ) ( not ( = ?auto_17365 ?auto_17372 ) ) ( not ( = ?auto_17360 ?auto_17372 ) ) ( SURFACE-AT ?auto_17359 ?auto_17366 ) ( CLEAR ?auto_17359 ) ( IS-CRATE ?auto_17360 ) ( not ( = ?auto_17359 ?auto_17360 ) ) ( not ( = ?auto_17362 ?auto_17359 ) ) ( not ( = ?auto_17363 ?auto_17359 ) ) ( not ( = ?auto_17361 ?auto_17359 ) ) ( not ( = ?auto_17371 ?auto_17359 ) ) ( not ( = ?auto_17365 ?auto_17359 ) ) ( not ( = ?auto_17372 ?auto_17359 ) ) ( AVAILABLE ?auto_17370 ) ( IN ?auto_17360 ?auto_17367 ) ( TRUCK-AT ?auto_17367 ?auto_17368 ) ( not ( = ?auto_17368 ?auto_17366 ) ) ( not ( = ?auto_17364 ?auto_17368 ) ) ( not ( = ?auto_17374 ?auto_17368 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17361 ?auto_17362 ?auto_17363 )
      ( MAKE-4CRATE-VERIFY ?auto_17359 ?auto_17360 ?auto_17361 ?auto_17362 ?auto_17363 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17375 - SURFACE
      ?auto_17376 - SURFACE
    )
    :vars
    (
      ?auto_17386 - HOIST
      ?auto_17380 - PLACE
      ?auto_17382 - SURFACE
      ?auto_17377 - PLACE
      ?auto_17385 - HOIST
      ?auto_17387 - SURFACE
      ?auto_17379 - SURFACE
      ?auto_17383 - SURFACE
      ?auto_17390 - PLACE
      ?auto_17389 - HOIST
      ?auto_17388 - SURFACE
      ?auto_17378 - SURFACE
      ?auto_17381 - TRUCK
      ?auto_17384 - PLACE
      ?auto_17391 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17386 ?auto_17380 ) ( IS-CRATE ?auto_17376 ) ( not ( = ?auto_17375 ?auto_17376 ) ) ( not ( = ?auto_17382 ?auto_17375 ) ) ( not ( = ?auto_17382 ?auto_17376 ) ) ( not ( = ?auto_17377 ?auto_17380 ) ) ( HOIST-AT ?auto_17385 ?auto_17377 ) ( not ( = ?auto_17386 ?auto_17385 ) ) ( SURFACE-AT ?auto_17376 ?auto_17377 ) ( ON ?auto_17376 ?auto_17387 ) ( CLEAR ?auto_17376 ) ( not ( = ?auto_17375 ?auto_17387 ) ) ( not ( = ?auto_17376 ?auto_17387 ) ) ( not ( = ?auto_17382 ?auto_17387 ) ) ( IS-CRATE ?auto_17375 ) ( AVAILABLE ?auto_17385 ) ( SURFACE-AT ?auto_17375 ?auto_17377 ) ( ON ?auto_17375 ?auto_17379 ) ( CLEAR ?auto_17375 ) ( not ( = ?auto_17375 ?auto_17379 ) ) ( not ( = ?auto_17376 ?auto_17379 ) ) ( not ( = ?auto_17382 ?auto_17379 ) ) ( not ( = ?auto_17387 ?auto_17379 ) ) ( IS-CRATE ?auto_17382 ) ( not ( = ?auto_17383 ?auto_17382 ) ) ( not ( = ?auto_17375 ?auto_17383 ) ) ( not ( = ?auto_17376 ?auto_17383 ) ) ( not ( = ?auto_17387 ?auto_17383 ) ) ( not ( = ?auto_17379 ?auto_17383 ) ) ( not ( = ?auto_17390 ?auto_17380 ) ) ( not ( = ?auto_17377 ?auto_17390 ) ) ( HOIST-AT ?auto_17389 ?auto_17390 ) ( not ( = ?auto_17386 ?auto_17389 ) ) ( not ( = ?auto_17385 ?auto_17389 ) ) ( AVAILABLE ?auto_17389 ) ( SURFACE-AT ?auto_17382 ?auto_17390 ) ( ON ?auto_17382 ?auto_17388 ) ( CLEAR ?auto_17382 ) ( not ( = ?auto_17375 ?auto_17388 ) ) ( not ( = ?auto_17376 ?auto_17388 ) ) ( not ( = ?auto_17382 ?auto_17388 ) ) ( not ( = ?auto_17387 ?auto_17388 ) ) ( not ( = ?auto_17379 ?auto_17388 ) ) ( not ( = ?auto_17383 ?auto_17388 ) ) ( SURFACE-AT ?auto_17378 ?auto_17380 ) ( CLEAR ?auto_17378 ) ( IS-CRATE ?auto_17383 ) ( not ( = ?auto_17378 ?auto_17383 ) ) ( not ( = ?auto_17375 ?auto_17378 ) ) ( not ( = ?auto_17376 ?auto_17378 ) ) ( not ( = ?auto_17382 ?auto_17378 ) ) ( not ( = ?auto_17387 ?auto_17378 ) ) ( not ( = ?auto_17379 ?auto_17378 ) ) ( not ( = ?auto_17388 ?auto_17378 ) ) ( AVAILABLE ?auto_17386 ) ( TRUCK-AT ?auto_17381 ?auto_17384 ) ( not ( = ?auto_17384 ?auto_17380 ) ) ( not ( = ?auto_17377 ?auto_17384 ) ) ( not ( = ?auto_17390 ?auto_17384 ) ) ( HOIST-AT ?auto_17391 ?auto_17384 ) ( LIFTING ?auto_17391 ?auto_17383 ) ( not ( = ?auto_17386 ?auto_17391 ) ) ( not ( = ?auto_17385 ?auto_17391 ) ) ( not ( = ?auto_17389 ?auto_17391 ) ) )
    :subtasks
    ( ( !LOAD ?auto_17391 ?auto_17383 ?auto_17381 ?auto_17384 )
      ( MAKE-2CRATE ?auto_17382 ?auto_17375 ?auto_17376 )
      ( MAKE-1CRATE-VERIFY ?auto_17375 ?auto_17376 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17392 - SURFACE
      ?auto_17393 - SURFACE
      ?auto_17394 - SURFACE
    )
    :vars
    (
      ?auto_17405 - HOIST
      ?auto_17401 - PLACE
      ?auto_17403 - PLACE
      ?auto_17406 - HOIST
      ?auto_17404 - SURFACE
      ?auto_17395 - SURFACE
      ?auto_17397 - SURFACE
      ?auto_17396 - PLACE
      ?auto_17402 - HOIST
      ?auto_17399 - SURFACE
      ?auto_17408 - SURFACE
      ?auto_17398 - TRUCK
      ?auto_17400 - PLACE
      ?auto_17407 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17405 ?auto_17401 ) ( IS-CRATE ?auto_17394 ) ( not ( = ?auto_17393 ?auto_17394 ) ) ( not ( = ?auto_17392 ?auto_17393 ) ) ( not ( = ?auto_17392 ?auto_17394 ) ) ( not ( = ?auto_17403 ?auto_17401 ) ) ( HOIST-AT ?auto_17406 ?auto_17403 ) ( not ( = ?auto_17405 ?auto_17406 ) ) ( SURFACE-AT ?auto_17394 ?auto_17403 ) ( ON ?auto_17394 ?auto_17404 ) ( CLEAR ?auto_17394 ) ( not ( = ?auto_17393 ?auto_17404 ) ) ( not ( = ?auto_17394 ?auto_17404 ) ) ( not ( = ?auto_17392 ?auto_17404 ) ) ( IS-CRATE ?auto_17393 ) ( AVAILABLE ?auto_17406 ) ( SURFACE-AT ?auto_17393 ?auto_17403 ) ( ON ?auto_17393 ?auto_17395 ) ( CLEAR ?auto_17393 ) ( not ( = ?auto_17393 ?auto_17395 ) ) ( not ( = ?auto_17394 ?auto_17395 ) ) ( not ( = ?auto_17392 ?auto_17395 ) ) ( not ( = ?auto_17404 ?auto_17395 ) ) ( IS-CRATE ?auto_17392 ) ( not ( = ?auto_17397 ?auto_17392 ) ) ( not ( = ?auto_17393 ?auto_17397 ) ) ( not ( = ?auto_17394 ?auto_17397 ) ) ( not ( = ?auto_17404 ?auto_17397 ) ) ( not ( = ?auto_17395 ?auto_17397 ) ) ( not ( = ?auto_17396 ?auto_17401 ) ) ( not ( = ?auto_17403 ?auto_17396 ) ) ( HOIST-AT ?auto_17402 ?auto_17396 ) ( not ( = ?auto_17405 ?auto_17402 ) ) ( not ( = ?auto_17406 ?auto_17402 ) ) ( AVAILABLE ?auto_17402 ) ( SURFACE-AT ?auto_17392 ?auto_17396 ) ( ON ?auto_17392 ?auto_17399 ) ( CLEAR ?auto_17392 ) ( not ( = ?auto_17393 ?auto_17399 ) ) ( not ( = ?auto_17394 ?auto_17399 ) ) ( not ( = ?auto_17392 ?auto_17399 ) ) ( not ( = ?auto_17404 ?auto_17399 ) ) ( not ( = ?auto_17395 ?auto_17399 ) ) ( not ( = ?auto_17397 ?auto_17399 ) ) ( SURFACE-AT ?auto_17408 ?auto_17401 ) ( CLEAR ?auto_17408 ) ( IS-CRATE ?auto_17397 ) ( not ( = ?auto_17408 ?auto_17397 ) ) ( not ( = ?auto_17393 ?auto_17408 ) ) ( not ( = ?auto_17394 ?auto_17408 ) ) ( not ( = ?auto_17392 ?auto_17408 ) ) ( not ( = ?auto_17404 ?auto_17408 ) ) ( not ( = ?auto_17395 ?auto_17408 ) ) ( not ( = ?auto_17399 ?auto_17408 ) ) ( AVAILABLE ?auto_17405 ) ( TRUCK-AT ?auto_17398 ?auto_17400 ) ( not ( = ?auto_17400 ?auto_17401 ) ) ( not ( = ?auto_17403 ?auto_17400 ) ) ( not ( = ?auto_17396 ?auto_17400 ) ) ( HOIST-AT ?auto_17407 ?auto_17400 ) ( LIFTING ?auto_17407 ?auto_17397 ) ( not ( = ?auto_17405 ?auto_17407 ) ) ( not ( = ?auto_17406 ?auto_17407 ) ) ( not ( = ?auto_17402 ?auto_17407 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17393 ?auto_17394 )
      ( MAKE-2CRATE-VERIFY ?auto_17392 ?auto_17393 ?auto_17394 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17409 - SURFACE
      ?auto_17410 - SURFACE
      ?auto_17411 - SURFACE
      ?auto_17412 - SURFACE
    )
    :vars
    (
      ?auto_17422 - HOIST
      ?auto_17416 - PLACE
      ?auto_17415 - PLACE
      ?auto_17425 - HOIST
      ?auto_17414 - SURFACE
      ?auto_17419 - SURFACE
      ?auto_17418 - PLACE
      ?auto_17421 - HOIST
      ?auto_17420 - SURFACE
      ?auto_17423 - SURFACE
      ?auto_17424 - TRUCK
      ?auto_17417 - PLACE
      ?auto_17413 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17422 ?auto_17416 ) ( IS-CRATE ?auto_17412 ) ( not ( = ?auto_17411 ?auto_17412 ) ) ( not ( = ?auto_17410 ?auto_17411 ) ) ( not ( = ?auto_17410 ?auto_17412 ) ) ( not ( = ?auto_17415 ?auto_17416 ) ) ( HOIST-AT ?auto_17425 ?auto_17415 ) ( not ( = ?auto_17422 ?auto_17425 ) ) ( SURFACE-AT ?auto_17412 ?auto_17415 ) ( ON ?auto_17412 ?auto_17414 ) ( CLEAR ?auto_17412 ) ( not ( = ?auto_17411 ?auto_17414 ) ) ( not ( = ?auto_17412 ?auto_17414 ) ) ( not ( = ?auto_17410 ?auto_17414 ) ) ( IS-CRATE ?auto_17411 ) ( AVAILABLE ?auto_17425 ) ( SURFACE-AT ?auto_17411 ?auto_17415 ) ( ON ?auto_17411 ?auto_17419 ) ( CLEAR ?auto_17411 ) ( not ( = ?auto_17411 ?auto_17419 ) ) ( not ( = ?auto_17412 ?auto_17419 ) ) ( not ( = ?auto_17410 ?auto_17419 ) ) ( not ( = ?auto_17414 ?auto_17419 ) ) ( IS-CRATE ?auto_17410 ) ( not ( = ?auto_17409 ?auto_17410 ) ) ( not ( = ?auto_17411 ?auto_17409 ) ) ( not ( = ?auto_17412 ?auto_17409 ) ) ( not ( = ?auto_17414 ?auto_17409 ) ) ( not ( = ?auto_17419 ?auto_17409 ) ) ( not ( = ?auto_17418 ?auto_17416 ) ) ( not ( = ?auto_17415 ?auto_17418 ) ) ( HOIST-AT ?auto_17421 ?auto_17418 ) ( not ( = ?auto_17422 ?auto_17421 ) ) ( not ( = ?auto_17425 ?auto_17421 ) ) ( AVAILABLE ?auto_17421 ) ( SURFACE-AT ?auto_17410 ?auto_17418 ) ( ON ?auto_17410 ?auto_17420 ) ( CLEAR ?auto_17410 ) ( not ( = ?auto_17411 ?auto_17420 ) ) ( not ( = ?auto_17412 ?auto_17420 ) ) ( not ( = ?auto_17410 ?auto_17420 ) ) ( not ( = ?auto_17414 ?auto_17420 ) ) ( not ( = ?auto_17419 ?auto_17420 ) ) ( not ( = ?auto_17409 ?auto_17420 ) ) ( SURFACE-AT ?auto_17423 ?auto_17416 ) ( CLEAR ?auto_17423 ) ( IS-CRATE ?auto_17409 ) ( not ( = ?auto_17423 ?auto_17409 ) ) ( not ( = ?auto_17411 ?auto_17423 ) ) ( not ( = ?auto_17412 ?auto_17423 ) ) ( not ( = ?auto_17410 ?auto_17423 ) ) ( not ( = ?auto_17414 ?auto_17423 ) ) ( not ( = ?auto_17419 ?auto_17423 ) ) ( not ( = ?auto_17420 ?auto_17423 ) ) ( AVAILABLE ?auto_17422 ) ( TRUCK-AT ?auto_17424 ?auto_17417 ) ( not ( = ?auto_17417 ?auto_17416 ) ) ( not ( = ?auto_17415 ?auto_17417 ) ) ( not ( = ?auto_17418 ?auto_17417 ) ) ( HOIST-AT ?auto_17413 ?auto_17417 ) ( LIFTING ?auto_17413 ?auto_17409 ) ( not ( = ?auto_17422 ?auto_17413 ) ) ( not ( = ?auto_17425 ?auto_17413 ) ) ( not ( = ?auto_17421 ?auto_17413 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17410 ?auto_17411 ?auto_17412 )
      ( MAKE-3CRATE-VERIFY ?auto_17409 ?auto_17410 ?auto_17411 ?auto_17412 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17426 - SURFACE
      ?auto_17427 - SURFACE
      ?auto_17428 - SURFACE
      ?auto_17429 - SURFACE
      ?auto_17430 - SURFACE
    )
    :vars
    (
      ?auto_17440 - HOIST
      ?auto_17434 - PLACE
      ?auto_17433 - PLACE
      ?auto_17442 - HOIST
      ?auto_17432 - SURFACE
      ?auto_17437 - SURFACE
      ?auto_17436 - PLACE
      ?auto_17439 - HOIST
      ?auto_17438 - SURFACE
      ?auto_17441 - TRUCK
      ?auto_17435 - PLACE
      ?auto_17431 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17440 ?auto_17434 ) ( IS-CRATE ?auto_17430 ) ( not ( = ?auto_17429 ?auto_17430 ) ) ( not ( = ?auto_17428 ?auto_17429 ) ) ( not ( = ?auto_17428 ?auto_17430 ) ) ( not ( = ?auto_17433 ?auto_17434 ) ) ( HOIST-AT ?auto_17442 ?auto_17433 ) ( not ( = ?auto_17440 ?auto_17442 ) ) ( SURFACE-AT ?auto_17430 ?auto_17433 ) ( ON ?auto_17430 ?auto_17432 ) ( CLEAR ?auto_17430 ) ( not ( = ?auto_17429 ?auto_17432 ) ) ( not ( = ?auto_17430 ?auto_17432 ) ) ( not ( = ?auto_17428 ?auto_17432 ) ) ( IS-CRATE ?auto_17429 ) ( AVAILABLE ?auto_17442 ) ( SURFACE-AT ?auto_17429 ?auto_17433 ) ( ON ?auto_17429 ?auto_17437 ) ( CLEAR ?auto_17429 ) ( not ( = ?auto_17429 ?auto_17437 ) ) ( not ( = ?auto_17430 ?auto_17437 ) ) ( not ( = ?auto_17428 ?auto_17437 ) ) ( not ( = ?auto_17432 ?auto_17437 ) ) ( IS-CRATE ?auto_17428 ) ( not ( = ?auto_17427 ?auto_17428 ) ) ( not ( = ?auto_17429 ?auto_17427 ) ) ( not ( = ?auto_17430 ?auto_17427 ) ) ( not ( = ?auto_17432 ?auto_17427 ) ) ( not ( = ?auto_17437 ?auto_17427 ) ) ( not ( = ?auto_17436 ?auto_17434 ) ) ( not ( = ?auto_17433 ?auto_17436 ) ) ( HOIST-AT ?auto_17439 ?auto_17436 ) ( not ( = ?auto_17440 ?auto_17439 ) ) ( not ( = ?auto_17442 ?auto_17439 ) ) ( AVAILABLE ?auto_17439 ) ( SURFACE-AT ?auto_17428 ?auto_17436 ) ( ON ?auto_17428 ?auto_17438 ) ( CLEAR ?auto_17428 ) ( not ( = ?auto_17429 ?auto_17438 ) ) ( not ( = ?auto_17430 ?auto_17438 ) ) ( not ( = ?auto_17428 ?auto_17438 ) ) ( not ( = ?auto_17432 ?auto_17438 ) ) ( not ( = ?auto_17437 ?auto_17438 ) ) ( not ( = ?auto_17427 ?auto_17438 ) ) ( SURFACE-AT ?auto_17426 ?auto_17434 ) ( CLEAR ?auto_17426 ) ( IS-CRATE ?auto_17427 ) ( not ( = ?auto_17426 ?auto_17427 ) ) ( not ( = ?auto_17429 ?auto_17426 ) ) ( not ( = ?auto_17430 ?auto_17426 ) ) ( not ( = ?auto_17428 ?auto_17426 ) ) ( not ( = ?auto_17432 ?auto_17426 ) ) ( not ( = ?auto_17437 ?auto_17426 ) ) ( not ( = ?auto_17438 ?auto_17426 ) ) ( AVAILABLE ?auto_17440 ) ( TRUCK-AT ?auto_17441 ?auto_17435 ) ( not ( = ?auto_17435 ?auto_17434 ) ) ( not ( = ?auto_17433 ?auto_17435 ) ) ( not ( = ?auto_17436 ?auto_17435 ) ) ( HOIST-AT ?auto_17431 ?auto_17435 ) ( LIFTING ?auto_17431 ?auto_17427 ) ( not ( = ?auto_17440 ?auto_17431 ) ) ( not ( = ?auto_17442 ?auto_17431 ) ) ( not ( = ?auto_17439 ?auto_17431 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17428 ?auto_17429 ?auto_17430 )
      ( MAKE-4CRATE-VERIFY ?auto_17426 ?auto_17427 ?auto_17428 ?auto_17429 ?auto_17430 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17443 - SURFACE
      ?auto_17444 - SURFACE
    )
    :vars
    (
      ?auto_17454 - HOIST
      ?auto_17448 - PLACE
      ?auto_17459 - SURFACE
      ?auto_17447 - PLACE
      ?auto_17458 - HOIST
      ?auto_17446 - SURFACE
      ?auto_17451 - SURFACE
      ?auto_17457 - SURFACE
      ?auto_17450 - PLACE
      ?auto_17453 - HOIST
      ?auto_17452 - SURFACE
      ?auto_17455 - SURFACE
      ?auto_17456 - TRUCK
      ?auto_17449 - PLACE
      ?auto_17445 - HOIST
      ?auto_17460 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17454 ?auto_17448 ) ( IS-CRATE ?auto_17444 ) ( not ( = ?auto_17443 ?auto_17444 ) ) ( not ( = ?auto_17459 ?auto_17443 ) ) ( not ( = ?auto_17459 ?auto_17444 ) ) ( not ( = ?auto_17447 ?auto_17448 ) ) ( HOIST-AT ?auto_17458 ?auto_17447 ) ( not ( = ?auto_17454 ?auto_17458 ) ) ( SURFACE-AT ?auto_17444 ?auto_17447 ) ( ON ?auto_17444 ?auto_17446 ) ( CLEAR ?auto_17444 ) ( not ( = ?auto_17443 ?auto_17446 ) ) ( not ( = ?auto_17444 ?auto_17446 ) ) ( not ( = ?auto_17459 ?auto_17446 ) ) ( IS-CRATE ?auto_17443 ) ( AVAILABLE ?auto_17458 ) ( SURFACE-AT ?auto_17443 ?auto_17447 ) ( ON ?auto_17443 ?auto_17451 ) ( CLEAR ?auto_17443 ) ( not ( = ?auto_17443 ?auto_17451 ) ) ( not ( = ?auto_17444 ?auto_17451 ) ) ( not ( = ?auto_17459 ?auto_17451 ) ) ( not ( = ?auto_17446 ?auto_17451 ) ) ( IS-CRATE ?auto_17459 ) ( not ( = ?auto_17457 ?auto_17459 ) ) ( not ( = ?auto_17443 ?auto_17457 ) ) ( not ( = ?auto_17444 ?auto_17457 ) ) ( not ( = ?auto_17446 ?auto_17457 ) ) ( not ( = ?auto_17451 ?auto_17457 ) ) ( not ( = ?auto_17450 ?auto_17448 ) ) ( not ( = ?auto_17447 ?auto_17450 ) ) ( HOIST-AT ?auto_17453 ?auto_17450 ) ( not ( = ?auto_17454 ?auto_17453 ) ) ( not ( = ?auto_17458 ?auto_17453 ) ) ( AVAILABLE ?auto_17453 ) ( SURFACE-AT ?auto_17459 ?auto_17450 ) ( ON ?auto_17459 ?auto_17452 ) ( CLEAR ?auto_17459 ) ( not ( = ?auto_17443 ?auto_17452 ) ) ( not ( = ?auto_17444 ?auto_17452 ) ) ( not ( = ?auto_17459 ?auto_17452 ) ) ( not ( = ?auto_17446 ?auto_17452 ) ) ( not ( = ?auto_17451 ?auto_17452 ) ) ( not ( = ?auto_17457 ?auto_17452 ) ) ( SURFACE-AT ?auto_17455 ?auto_17448 ) ( CLEAR ?auto_17455 ) ( IS-CRATE ?auto_17457 ) ( not ( = ?auto_17455 ?auto_17457 ) ) ( not ( = ?auto_17443 ?auto_17455 ) ) ( not ( = ?auto_17444 ?auto_17455 ) ) ( not ( = ?auto_17459 ?auto_17455 ) ) ( not ( = ?auto_17446 ?auto_17455 ) ) ( not ( = ?auto_17451 ?auto_17455 ) ) ( not ( = ?auto_17452 ?auto_17455 ) ) ( AVAILABLE ?auto_17454 ) ( TRUCK-AT ?auto_17456 ?auto_17449 ) ( not ( = ?auto_17449 ?auto_17448 ) ) ( not ( = ?auto_17447 ?auto_17449 ) ) ( not ( = ?auto_17450 ?auto_17449 ) ) ( HOIST-AT ?auto_17445 ?auto_17449 ) ( not ( = ?auto_17454 ?auto_17445 ) ) ( not ( = ?auto_17458 ?auto_17445 ) ) ( not ( = ?auto_17453 ?auto_17445 ) ) ( AVAILABLE ?auto_17445 ) ( SURFACE-AT ?auto_17457 ?auto_17449 ) ( ON ?auto_17457 ?auto_17460 ) ( CLEAR ?auto_17457 ) ( not ( = ?auto_17443 ?auto_17460 ) ) ( not ( = ?auto_17444 ?auto_17460 ) ) ( not ( = ?auto_17459 ?auto_17460 ) ) ( not ( = ?auto_17446 ?auto_17460 ) ) ( not ( = ?auto_17451 ?auto_17460 ) ) ( not ( = ?auto_17457 ?auto_17460 ) ) ( not ( = ?auto_17452 ?auto_17460 ) ) ( not ( = ?auto_17455 ?auto_17460 ) ) )
    :subtasks
    ( ( !LIFT ?auto_17445 ?auto_17457 ?auto_17460 ?auto_17449 )
      ( MAKE-2CRATE ?auto_17459 ?auto_17443 ?auto_17444 )
      ( MAKE-1CRATE-VERIFY ?auto_17443 ?auto_17444 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17461 - SURFACE
      ?auto_17462 - SURFACE
      ?auto_17463 - SURFACE
    )
    :vars
    (
      ?auto_17467 - HOIST
      ?auto_17472 - PLACE
      ?auto_17477 - PLACE
      ?auto_17464 - HOIST
      ?auto_17471 - SURFACE
      ?auto_17473 - SURFACE
      ?auto_17475 - SURFACE
      ?auto_17474 - PLACE
      ?auto_17468 - HOIST
      ?auto_17465 - SURFACE
      ?auto_17470 - SURFACE
      ?auto_17466 - TRUCK
      ?auto_17469 - PLACE
      ?auto_17478 - HOIST
      ?auto_17476 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17467 ?auto_17472 ) ( IS-CRATE ?auto_17463 ) ( not ( = ?auto_17462 ?auto_17463 ) ) ( not ( = ?auto_17461 ?auto_17462 ) ) ( not ( = ?auto_17461 ?auto_17463 ) ) ( not ( = ?auto_17477 ?auto_17472 ) ) ( HOIST-AT ?auto_17464 ?auto_17477 ) ( not ( = ?auto_17467 ?auto_17464 ) ) ( SURFACE-AT ?auto_17463 ?auto_17477 ) ( ON ?auto_17463 ?auto_17471 ) ( CLEAR ?auto_17463 ) ( not ( = ?auto_17462 ?auto_17471 ) ) ( not ( = ?auto_17463 ?auto_17471 ) ) ( not ( = ?auto_17461 ?auto_17471 ) ) ( IS-CRATE ?auto_17462 ) ( AVAILABLE ?auto_17464 ) ( SURFACE-AT ?auto_17462 ?auto_17477 ) ( ON ?auto_17462 ?auto_17473 ) ( CLEAR ?auto_17462 ) ( not ( = ?auto_17462 ?auto_17473 ) ) ( not ( = ?auto_17463 ?auto_17473 ) ) ( not ( = ?auto_17461 ?auto_17473 ) ) ( not ( = ?auto_17471 ?auto_17473 ) ) ( IS-CRATE ?auto_17461 ) ( not ( = ?auto_17475 ?auto_17461 ) ) ( not ( = ?auto_17462 ?auto_17475 ) ) ( not ( = ?auto_17463 ?auto_17475 ) ) ( not ( = ?auto_17471 ?auto_17475 ) ) ( not ( = ?auto_17473 ?auto_17475 ) ) ( not ( = ?auto_17474 ?auto_17472 ) ) ( not ( = ?auto_17477 ?auto_17474 ) ) ( HOIST-AT ?auto_17468 ?auto_17474 ) ( not ( = ?auto_17467 ?auto_17468 ) ) ( not ( = ?auto_17464 ?auto_17468 ) ) ( AVAILABLE ?auto_17468 ) ( SURFACE-AT ?auto_17461 ?auto_17474 ) ( ON ?auto_17461 ?auto_17465 ) ( CLEAR ?auto_17461 ) ( not ( = ?auto_17462 ?auto_17465 ) ) ( not ( = ?auto_17463 ?auto_17465 ) ) ( not ( = ?auto_17461 ?auto_17465 ) ) ( not ( = ?auto_17471 ?auto_17465 ) ) ( not ( = ?auto_17473 ?auto_17465 ) ) ( not ( = ?auto_17475 ?auto_17465 ) ) ( SURFACE-AT ?auto_17470 ?auto_17472 ) ( CLEAR ?auto_17470 ) ( IS-CRATE ?auto_17475 ) ( not ( = ?auto_17470 ?auto_17475 ) ) ( not ( = ?auto_17462 ?auto_17470 ) ) ( not ( = ?auto_17463 ?auto_17470 ) ) ( not ( = ?auto_17461 ?auto_17470 ) ) ( not ( = ?auto_17471 ?auto_17470 ) ) ( not ( = ?auto_17473 ?auto_17470 ) ) ( not ( = ?auto_17465 ?auto_17470 ) ) ( AVAILABLE ?auto_17467 ) ( TRUCK-AT ?auto_17466 ?auto_17469 ) ( not ( = ?auto_17469 ?auto_17472 ) ) ( not ( = ?auto_17477 ?auto_17469 ) ) ( not ( = ?auto_17474 ?auto_17469 ) ) ( HOIST-AT ?auto_17478 ?auto_17469 ) ( not ( = ?auto_17467 ?auto_17478 ) ) ( not ( = ?auto_17464 ?auto_17478 ) ) ( not ( = ?auto_17468 ?auto_17478 ) ) ( AVAILABLE ?auto_17478 ) ( SURFACE-AT ?auto_17475 ?auto_17469 ) ( ON ?auto_17475 ?auto_17476 ) ( CLEAR ?auto_17475 ) ( not ( = ?auto_17462 ?auto_17476 ) ) ( not ( = ?auto_17463 ?auto_17476 ) ) ( not ( = ?auto_17461 ?auto_17476 ) ) ( not ( = ?auto_17471 ?auto_17476 ) ) ( not ( = ?auto_17473 ?auto_17476 ) ) ( not ( = ?auto_17475 ?auto_17476 ) ) ( not ( = ?auto_17465 ?auto_17476 ) ) ( not ( = ?auto_17470 ?auto_17476 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17462 ?auto_17463 )
      ( MAKE-2CRATE-VERIFY ?auto_17461 ?auto_17462 ?auto_17463 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17479 - SURFACE
      ?auto_17480 - SURFACE
      ?auto_17481 - SURFACE
      ?auto_17482 - SURFACE
    )
    :vars
    (
      ?auto_17485 - HOIST
      ?auto_17492 - PLACE
      ?auto_17489 - PLACE
      ?auto_17484 - HOIST
      ?auto_17495 - SURFACE
      ?auto_17494 - SURFACE
      ?auto_17493 - PLACE
      ?auto_17488 - HOIST
      ?auto_17487 - SURFACE
      ?auto_17496 - SURFACE
      ?auto_17491 - TRUCK
      ?auto_17483 - PLACE
      ?auto_17486 - HOIST
      ?auto_17490 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17485 ?auto_17492 ) ( IS-CRATE ?auto_17482 ) ( not ( = ?auto_17481 ?auto_17482 ) ) ( not ( = ?auto_17480 ?auto_17481 ) ) ( not ( = ?auto_17480 ?auto_17482 ) ) ( not ( = ?auto_17489 ?auto_17492 ) ) ( HOIST-AT ?auto_17484 ?auto_17489 ) ( not ( = ?auto_17485 ?auto_17484 ) ) ( SURFACE-AT ?auto_17482 ?auto_17489 ) ( ON ?auto_17482 ?auto_17495 ) ( CLEAR ?auto_17482 ) ( not ( = ?auto_17481 ?auto_17495 ) ) ( not ( = ?auto_17482 ?auto_17495 ) ) ( not ( = ?auto_17480 ?auto_17495 ) ) ( IS-CRATE ?auto_17481 ) ( AVAILABLE ?auto_17484 ) ( SURFACE-AT ?auto_17481 ?auto_17489 ) ( ON ?auto_17481 ?auto_17494 ) ( CLEAR ?auto_17481 ) ( not ( = ?auto_17481 ?auto_17494 ) ) ( not ( = ?auto_17482 ?auto_17494 ) ) ( not ( = ?auto_17480 ?auto_17494 ) ) ( not ( = ?auto_17495 ?auto_17494 ) ) ( IS-CRATE ?auto_17480 ) ( not ( = ?auto_17479 ?auto_17480 ) ) ( not ( = ?auto_17481 ?auto_17479 ) ) ( not ( = ?auto_17482 ?auto_17479 ) ) ( not ( = ?auto_17495 ?auto_17479 ) ) ( not ( = ?auto_17494 ?auto_17479 ) ) ( not ( = ?auto_17493 ?auto_17492 ) ) ( not ( = ?auto_17489 ?auto_17493 ) ) ( HOIST-AT ?auto_17488 ?auto_17493 ) ( not ( = ?auto_17485 ?auto_17488 ) ) ( not ( = ?auto_17484 ?auto_17488 ) ) ( AVAILABLE ?auto_17488 ) ( SURFACE-AT ?auto_17480 ?auto_17493 ) ( ON ?auto_17480 ?auto_17487 ) ( CLEAR ?auto_17480 ) ( not ( = ?auto_17481 ?auto_17487 ) ) ( not ( = ?auto_17482 ?auto_17487 ) ) ( not ( = ?auto_17480 ?auto_17487 ) ) ( not ( = ?auto_17495 ?auto_17487 ) ) ( not ( = ?auto_17494 ?auto_17487 ) ) ( not ( = ?auto_17479 ?auto_17487 ) ) ( SURFACE-AT ?auto_17496 ?auto_17492 ) ( CLEAR ?auto_17496 ) ( IS-CRATE ?auto_17479 ) ( not ( = ?auto_17496 ?auto_17479 ) ) ( not ( = ?auto_17481 ?auto_17496 ) ) ( not ( = ?auto_17482 ?auto_17496 ) ) ( not ( = ?auto_17480 ?auto_17496 ) ) ( not ( = ?auto_17495 ?auto_17496 ) ) ( not ( = ?auto_17494 ?auto_17496 ) ) ( not ( = ?auto_17487 ?auto_17496 ) ) ( AVAILABLE ?auto_17485 ) ( TRUCK-AT ?auto_17491 ?auto_17483 ) ( not ( = ?auto_17483 ?auto_17492 ) ) ( not ( = ?auto_17489 ?auto_17483 ) ) ( not ( = ?auto_17493 ?auto_17483 ) ) ( HOIST-AT ?auto_17486 ?auto_17483 ) ( not ( = ?auto_17485 ?auto_17486 ) ) ( not ( = ?auto_17484 ?auto_17486 ) ) ( not ( = ?auto_17488 ?auto_17486 ) ) ( AVAILABLE ?auto_17486 ) ( SURFACE-AT ?auto_17479 ?auto_17483 ) ( ON ?auto_17479 ?auto_17490 ) ( CLEAR ?auto_17479 ) ( not ( = ?auto_17481 ?auto_17490 ) ) ( not ( = ?auto_17482 ?auto_17490 ) ) ( not ( = ?auto_17480 ?auto_17490 ) ) ( not ( = ?auto_17495 ?auto_17490 ) ) ( not ( = ?auto_17494 ?auto_17490 ) ) ( not ( = ?auto_17479 ?auto_17490 ) ) ( not ( = ?auto_17487 ?auto_17490 ) ) ( not ( = ?auto_17496 ?auto_17490 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17480 ?auto_17481 ?auto_17482 )
      ( MAKE-3CRATE-VERIFY ?auto_17479 ?auto_17480 ?auto_17481 ?auto_17482 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17497 - SURFACE
      ?auto_17498 - SURFACE
      ?auto_17499 - SURFACE
      ?auto_17500 - SURFACE
      ?auto_17501 - SURFACE
    )
    :vars
    (
      ?auto_17504 - HOIST
      ?auto_17511 - PLACE
      ?auto_17508 - PLACE
      ?auto_17503 - HOIST
      ?auto_17514 - SURFACE
      ?auto_17513 - SURFACE
      ?auto_17512 - PLACE
      ?auto_17507 - HOIST
      ?auto_17506 - SURFACE
      ?auto_17510 - TRUCK
      ?auto_17502 - PLACE
      ?auto_17505 - HOIST
      ?auto_17509 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17504 ?auto_17511 ) ( IS-CRATE ?auto_17501 ) ( not ( = ?auto_17500 ?auto_17501 ) ) ( not ( = ?auto_17499 ?auto_17500 ) ) ( not ( = ?auto_17499 ?auto_17501 ) ) ( not ( = ?auto_17508 ?auto_17511 ) ) ( HOIST-AT ?auto_17503 ?auto_17508 ) ( not ( = ?auto_17504 ?auto_17503 ) ) ( SURFACE-AT ?auto_17501 ?auto_17508 ) ( ON ?auto_17501 ?auto_17514 ) ( CLEAR ?auto_17501 ) ( not ( = ?auto_17500 ?auto_17514 ) ) ( not ( = ?auto_17501 ?auto_17514 ) ) ( not ( = ?auto_17499 ?auto_17514 ) ) ( IS-CRATE ?auto_17500 ) ( AVAILABLE ?auto_17503 ) ( SURFACE-AT ?auto_17500 ?auto_17508 ) ( ON ?auto_17500 ?auto_17513 ) ( CLEAR ?auto_17500 ) ( not ( = ?auto_17500 ?auto_17513 ) ) ( not ( = ?auto_17501 ?auto_17513 ) ) ( not ( = ?auto_17499 ?auto_17513 ) ) ( not ( = ?auto_17514 ?auto_17513 ) ) ( IS-CRATE ?auto_17499 ) ( not ( = ?auto_17498 ?auto_17499 ) ) ( not ( = ?auto_17500 ?auto_17498 ) ) ( not ( = ?auto_17501 ?auto_17498 ) ) ( not ( = ?auto_17514 ?auto_17498 ) ) ( not ( = ?auto_17513 ?auto_17498 ) ) ( not ( = ?auto_17512 ?auto_17511 ) ) ( not ( = ?auto_17508 ?auto_17512 ) ) ( HOIST-AT ?auto_17507 ?auto_17512 ) ( not ( = ?auto_17504 ?auto_17507 ) ) ( not ( = ?auto_17503 ?auto_17507 ) ) ( AVAILABLE ?auto_17507 ) ( SURFACE-AT ?auto_17499 ?auto_17512 ) ( ON ?auto_17499 ?auto_17506 ) ( CLEAR ?auto_17499 ) ( not ( = ?auto_17500 ?auto_17506 ) ) ( not ( = ?auto_17501 ?auto_17506 ) ) ( not ( = ?auto_17499 ?auto_17506 ) ) ( not ( = ?auto_17514 ?auto_17506 ) ) ( not ( = ?auto_17513 ?auto_17506 ) ) ( not ( = ?auto_17498 ?auto_17506 ) ) ( SURFACE-AT ?auto_17497 ?auto_17511 ) ( CLEAR ?auto_17497 ) ( IS-CRATE ?auto_17498 ) ( not ( = ?auto_17497 ?auto_17498 ) ) ( not ( = ?auto_17500 ?auto_17497 ) ) ( not ( = ?auto_17501 ?auto_17497 ) ) ( not ( = ?auto_17499 ?auto_17497 ) ) ( not ( = ?auto_17514 ?auto_17497 ) ) ( not ( = ?auto_17513 ?auto_17497 ) ) ( not ( = ?auto_17506 ?auto_17497 ) ) ( AVAILABLE ?auto_17504 ) ( TRUCK-AT ?auto_17510 ?auto_17502 ) ( not ( = ?auto_17502 ?auto_17511 ) ) ( not ( = ?auto_17508 ?auto_17502 ) ) ( not ( = ?auto_17512 ?auto_17502 ) ) ( HOIST-AT ?auto_17505 ?auto_17502 ) ( not ( = ?auto_17504 ?auto_17505 ) ) ( not ( = ?auto_17503 ?auto_17505 ) ) ( not ( = ?auto_17507 ?auto_17505 ) ) ( AVAILABLE ?auto_17505 ) ( SURFACE-AT ?auto_17498 ?auto_17502 ) ( ON ?auto_17498 ?auto_17509 ) ( CLEAR ?auto_17498 ) ( not ( = ?auto_17500 ?auto_17509 ) ) ( not ( = ?auto_17501 ?auto_17509 ) ) ( not ( = ?auto_17499 ?auto_17509 ) ) ( not ( = ?auto_17514 ?auto_17509 ) ) ( not ( = ?auto_17513 ?auto_17509 ) ) ( not ( = ?auto_17498 ?auto_17509 ) ) ( not ( = ?auto_17506 ?auto_17509 ) ) ( not ( = ?auto_17497 ?auto_17509 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17499 ?auto_17500 ?auto_17501 )
      ( MAKE-4CRATE-VERIFY ?auto_17497 ?auto_17498 ?auto_17499 ?auto_17500 ?auto_17501 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17515 - SURFACE
      ?auto_17516 - SURFACE
    )
    :vars
    (
      ?auto_17519 - HOIST
      ?auto_17527 - PLACE
      ?auto_17532 - SURFACE
      ?auto_17524 - PLACE
      ?auto_17518 - HOIST
      ?auto_17530 - SURFACE
      ?auto_17529 - SURFACE
      ?auto_17523 - SURFACE
      ?auto_17528 - PLACE
      ?auto_17522 - HOIST
      ?auto_17521 - SURFACE
      ?auto_17531 - SURFACE
      ?auto_17517 - PLACE
      ?auto_17520 - HOIST
      ?auto_17525 - SURFACE
      ?auto_17526 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17519 ?auto_17527 ) ( IS-CRATE ?auto_17516 ) ( not ( = ?auto_17515 ?auto_17516 ) ) ( not ( = ?auto_17532 ?auto_17515 ) ) ( not ( = ?auto_17532 ?auto_17516 ) ) ( not ( = ?auto_17524 ?auto_17527 ) ) ( HOIST-AT ?auto_17518 ?auto_17524 ) ( not ( = ?auto_17519 ?auto_17518 ) ) ( SURFACE-AT ?auto_17516 ?auto_17524 ) ( ON ?auto_17516 ?auto_17530 ) ( CLEAR ?auto_17516 ) ( not ( = ?auto_17515 ?auto_17530 ) ) ( not ( = ?auto_17516 ?auto_17530 ) ) ( not ( = ?auto_17532 ?auto_17530 ) ) ( IS-CRATE ?auto_17515 ) ( AVAILABLE ?auto_17518 ) ( SURFACE-AT ?auto_17515 ?auto_17524 ) ( ON ?auto_17515 ?auto_17529 ) ( CLEAR ?auto_17515 ) ( not ( = ?auto_17515 ?auto_17529 ) ) ( not ( = ?auto_17516 ?auto_17529 ) ) ( not ( = ?auto_17532 ?auto_17529 ) ) ( not ( = ?auto_17530 ?auto_17529 ) ) ( IS-CRATE ?auto_17532 ) ( not ( = ?auto_17523 ?auto_17532 ) ) ( not ( = ?auto_17515 ?auto_17523 ) ) ( not ( = ?auto_17516 ?auto_17523 ) ) ( not ( = ?auto_17530 ?auto_17523 ) ) ( not ( = ?auto_17529 ?auto_17523 ) ) ( not ( = ?auto_17528 ?auto_17527 ) ) ( not ( = ?auto_17524 ?auto_17528 ) ) ( HOIST-AT ?auto_17522 ?auto_17528 ) ( not ( = ?auto_17519 ?auto_17522 ) ) ( not ( = ?auto_17518 ?auto_17522 ) ) ( AVAILABLE ?auto_17522 ) ( SURFACE-AT ?auto_17532 ?auto_17528 ) ( ON ?auto_17532 ?auto_17521 ) ( CLEAR ?auto_17532 ) ( not ( = ?auto_17515 ?auto_17521 ) ) ( not ( = ?auto_17516 ?auto_17521 ) ) ( not ( = ?auto_17532 ?auto_17521 ) ) ( not ( = ?auto_17530 ?auto_17521 ) ) ( not ( = ?auto_17529 ?auto_17521 ) ) ( not ( = ?auto_17523 ?auto_17521 ) ) ( SURFACE-AT ?auto_17531 ?auto_17527 ) ( CLEAR ?auto_17531 ) ( IS-CRATE ?auto_17523 ) ( not ( = ?auto_17531 ?auto_17523 ) ) ( not ( = ?auto_17515 ?auto_17531 ) ) ( not ( = ?auto_17516 ?auto_17531 ) ) ( not ( = ?auto_17532 ?auto_17531 ) ) ( not ( = ?auto_17530 ?auto_17531 ) ) ( not ( = ?auto_17529 ?auto_17531 ) ) ( not ( = ?auto_17521 ?auto_17531 ) ) ( AVAILABLE ?auto_17519 ) ( not ( = ?auto_17517 ?auto_17527 ) ) ( not ( = ?auto_17524 ?auto_17517 ) ) ( not ( = ?auto_17528 ?auto_17517 ) ) ( HOIST-AT ?auto_17520 ?auto_17517 ) ( not ( = ?auto_17519 ?auto_17520 ) ) ( not ( = ?auto_17518 ?auto_17520 ) ) ( not ( = ?auto_17522 ?auto_17520 ) ) ( AVAILABLE ?auto_17520 ) ( SURFACE-AT ?auto_17523 ?auto_17517 ) ( ON ?auto_17523 ?auto_17525 ) ( CLEAR ?auto_17523 ) ( not ( = ?auto_17515 ?auto_17525 ) ) ( not ( = ?auto_17516 ?auto_17525 ) ) ( not ( = ?auto_17532 ?auto_17525 ) ) ( not ( = ?auto_17530 ?auto_17525 ) ) ( not ( = ?auto_17529 ?auto_17525 ) ) ( not ( = ?auto_17523 ?auto_17525 ) ) ( not ( = ?auto_17521 ?auto_17525 ) ) ( not ( = ?auto_17531 ?auto_17525 ) ) ( TRUCK-AT ?auto_17526 ?auto_17527 ) )
    :subtasks
    ( ( !DRIVE ?auto_17526 ?auto_17527 ?auto_17517 )
      ( MAKE-2CRATE ?auto_17532 ?auto_17515 ?auto_17516 )
      ( MAKE-1CRATE-VERIFY ?auto_17515 ?auto_17516 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17533 - SURFACE
      ?auto_17534 - SURFACE
      ?auto_17535 - SURFACE
    )
    :vars
    (
      ?auto_17549 - HOIST
      ?auto_17550 - PLACE
      ?auto_17543 - PLACE
      ?auto_17542 - HOIST
      ?auto_17544 - SURFACE
      ?auto_17537 - SURFACE
      ?auto_17539 - SURFACE
      ?auto_17546 - PLACE
      ?auto_17536 - HOIST
      ?auto_17548 - SURFACE
      ?auto_17538 - SURFACE
      ?auto_17547 - PLACE
      ?auto_17540 - HOIST
      ?auto_17545 - SURFACE
      ?auto_17541 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17549 ?auto_17550 ) ( IS-CRATE ?auto_17535 ) ( not ( = ?auto_17534 ?auto_17535 ) ) ( not ( = ?auto_17533 ?auto_17534 ) ) ( not ( = ?auto_17533 ?auto_17535 ) ) ( not ( = ?auto_17543 ?auto_17550 ) ) ( HOIST-AT ?auto_17542 ?auto_17543 ) ( not ( = ?auto_17549 ?auto_17542 ) ) ( SURFACE-AT ?auto_17535 ?auto_17543 ) ( ON ?auto_17535 ?auto_17544 ) ( CLEAR ?auto_17535 ) ( not ( = ?auto_17534 ?auto_17544 ) ) ( not ( = ?auto_17535 ?auto_17544 ) ) ( not ( = ?auto_17533 ?auto_17544 ) ) ( IS-CRATE ?auto_17534 ) ( AVAILABLE ?auto_17542 ) ( SURFACE-AT ?auto_17534 ?auto_17543 ) ( ON ?auto_17534 ?auto_17537 ) ( CLEAR ?auto_17534 ) ( not ( = ?auto_17534 ?auto_17537 ) ) ( not ( = ?auto_17535 ?auto_17537 ) ) ( not ( = ?auto_17533 ?auto_17537 ) ) ( not ( = ?auto_17544 ?auto_17537 ) ) ( IS-CRATE ?auto_17533 ) ( not ( = ?auto_17539 ?auto_17533 ) ) ( not ( = ?auto_17534 ?auto_17539 ) ) ( not ( = ?auto_17535 ?auto_17539 ) ) ( not ( = ?auto_17544 ?auto_17539 ) ) ( not ( = ?auto_17537 ?auto_17539 ) ) ( not ( = ?auto_17546 ?auto_17550 ) ) ( not ( = ?auto_17543 ?auto_17546 ) ) ( HOIST-AT ?auto_17536 ?auto_17546 ) ( not ( = ?auto_17549 ?auto_17536 ) ) ( not ( = ?auto_17542 ?auto_17536 ) ) ( AVAILABLE ?auto_17536 ) ( SURFACE-AT ?auto_17533 ?auto_17546 ) ( ON ?auto_17533 ?auto_17548 ) ( CLEAR ?auto_17533 ) ( not ( = ?auto_17534 ?auto_17548 ) ) ( not ( = ?auto_17535 ?auto_17548 ) ) ( not ( = ?auto_17533 ?auto_17548 ) ) ( not ( = ?auto_17544 ?auto_17548 ) ) ( not ( = ?auto_17537 ?auto_17548 ) ) ( not ( = ?auto_17539 ?auto_17548 ) ) ( SURFACE-AT ?auto_17538 ?auto_17550 ) ( CLEAR ?auto_17538 ) ( IS-CRATE ?auto_17539 ) ( not ( = ?auto_17538 ?auto_17539 ) ) ( not ( = ?auto_17534 ?auto_17538 ) ) ( not ( = ?auto_17535 ?auto_17538 ) ) ( not ( = ?auto_17533 ?auto_17538 ) ) ( not ( = ?auto_17544 ?auto_17538 ) ) ( not ( = ?auto_17537 ?auto_17538 ) ) ( not ( = ?auto_17548 ?auto_17538 ) ) ( AVAILABLE ?auto_17549 ) ( not ( = ?auto_17547 ?auto_17550 ) ) ( not ( = ?auto_17543 ?auto_17547 ) ) ( not ( = ?auto_17546 ?auto_17547 ) ) ( HOIST-AT ?auto_17540 ?auto_17547 ) ( not ( = ?auto_17549 ?auto_17540 ) ) ( not ( = ?auto_17542 ?auto_17540 ) ) ( not ( = ?auto_17536 ?auto_17540 ) ) ( AVAILABLE ?auto_17540 ) ( SURFACE-AT ?auto_17539 ?auto_17547 ) ( ON ?auto_17539 ?auto_17545 ) ( CLEAR ?auto_17539 ) ( not ( = ?auto_17534 ?auto_17545 ) ) ( not ( = ?auto_17535 ?auto_17545 ) ) ( not ( = ?auto_17533 ?auto_17545 ) ) ( not ( = ?auto_17544 ?auto_17545 ) ) ( not ( = ?auto_17537 ?auto_17545 ) ) ( not ( = ?auto_17539 ?auto_17545 ) ) ( not ( = ?auto_17548 ?auto_17545 ) ) ( not ( = ?auto_17538 ?auto_17545 ) ) ( TRUCK-AT ?auto_17541 ?auto_17550 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17534 ?auto_17535 )
      ( MAKE-2CRATE-VERIFY ?auto_17533 ?auto_17534 ?auto_17535 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17551 - SURFACE
      ?auto_17552 - SURFACE
      ?auto_17553 - SURFACE
      ?auto_17554 - SURFACE
    )
    :vars
    (
      ?auto_17565 - HOIST
      ?auto_17560 - PLACE
      ?auto_17568 - PLACE
      ?auto_17555 - HOIST
      ?auto_17558 - SURFACE
      ?auto_17567 - SURFACE
      ?auto_17564 - PLACE
      ?auto_17562 - HOIST
      ?auto_17563 - SURFACE
      ?auto_17556 - SURFACE
      ?auto_17566 - PLACE
      ?auto_17557 - HOIST
      ?auto_17561 - SURFACE
      ?auto_17559 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17565 ?auto_17560 ) ( IS-CRATE ?auto_17554 ) ( not ( = ?auto_17553 ?auto_17554 ) ) ( not ( = ?auto_17552 ?auto_17553 ) ) ( not ( = ?auto_17552 ?auto_17554 ) ) ( not ( = ?auto_17568 ?auto_17560 ) ) ( HOIST-AT ?auto_17555 ?auto_17568 ) ( not ( = ?auto_17565 ?auto_17555 ) ) ( SURFACE-AT ?auto_17554 ?auto_17568 ) ( ON ?auto_17554 ?auto_17558 ) ( CLEAR ?auto_17554 ) ( not ( = ?auto_17553 ?auto_17558 ) ) ( not ( = ?auto_17554 ?auto_17558 ) ) ( not ( = ?auto_17552 ?auto_17558 ) ) ( IS-CRATE ?auto_17553 ) ( AVAILABLE ?auto_17555 ) ( SURFACE-AT ?auto_17553 ?auto_17568 ) ( ON ?auto_17553 ?auto_17567 ) ( CLEAR ?auto_17553 ) ( not ( = ?auto_17553 ?auto_17567 ) ) ( not ( = ?auto_17554 ?auto_17567 ) ) ( not ( = ?auto_17552 ?auto_17567 ) ) ( not ( = ?auto_17558 ?auto_17567 ) ) ( IS-CRATE ?auto_17552 ) ( not ( = ?auto_17551 ?auto_17552 ) ) ( not ( = ?auto_17553 ?auto_17551 ) ) ( not ( = ?auto_17554 ?auto_17551 ) ) ( not ( = ?auto_17558 ?auto_17551 ) ) ( not ( = ?auto_17567 ?auto_17551 ) ) ( not ( = ?auto_17564 ?auto_17560 ) ) ( not ( = ?auto_17568 ?auto_17564 ) ) ( HOIST-AT ?auto_17562 ?auto_17564 ) ( not ( = ?auto_17565 ?auto_17562 ) ) ( not ( = ?auto_17555 ?auto_17562 ) ) ( AVAILABLE ?auto_17562 ) ( SURFACE-AT ?auto_17552 ?auto_17564 ) ( ON ?auto_17552 ?auto_17563 ) ( CLEAR ?auto_17552 ) ( not ( = ?auto_17553 ?auto_17563 ) ) ( not ( = ?auto_17554 ?auto_17563 ) ) ( not ( = ?auto_17552 ?auto_17563 ) ) ( not ( = ?auto_17558 ?auto_17563 ) ) ( not ( = ?auto_17567 ?auto_17563 ) ) ( not ( = ?auto_17551 ?auto_17563 ) ) ( SURFACE-AT ?auto_17556 ?auto_17560 ) ( CLEAR ?auto_17556 ) ( IS-CRATE ?auto_17551 ) ( not ( = ?auto_17556 ?auto_17551 ) ) ( not ( = ?auto_17553 ?auto_17556 ) ) ( not ( = ?auto_17554 ?auto_17556 ) ) ( not ( = ?auto_17552 ?auto_17556 ) ) ( not ( = ?auto_17558 ?auto_17556 ) ) ( not ( = ?auto_17567 ?auto_17556 ) ) ( not ( = ?auto_17563 ?auto_17556 ) ) ( AVAILABLE ?auto_17565 ) ( not ( = ?auto_17566 ?auto_17560 ) ) ( not ( = ?auto_17568 ?auto_17566 ) ) ( not ( = ?auto_17564 ?auto_17566 ) ) ( HOIST-AT ?auto_17557 ?auto_17566 ) ( not ( = ?auto_17565 ?auto_17557 ) ) ( not ( = ?auto_17555 ?auto_17557 ) ) ( not ( = ?auto_17562 ?auto_17557 ) ) ( AVAILABLE ?auto_17557 ) ( SURFACE-AT ?auto_17551 ?auto_17566 ) ( ON ?auto_17551 ?auto_17561 ) ( CLEAR ?auto_17551 ) ( not ( = ?auto_17553 ?auto_17561 ) ) ( not ( = ?auto_17554 ?auto_17561 ) ) ( not ( = ?auto_17552 ?auto_17561 ) ) ( not ( = ?auto_17558 ?auto_17561 ) ) ( not ( = ?auto_17567 ?auto_17561 ) ) ( not ( = ?auto_17551 ?auto_17561 ) ) ( not ( = ?auto_17563 ?auto_17561 ) ) ( not ( = ?auto_17556 ?auto_17561 ) ) ( TRUCK-AT ?auto_17559 ?auto_17560 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17552 ?auto_17553 ?auto_17554 )
      ( MAKE-3CRATE-VERIFY ?auto_17551 ?auto_17552 ?auto_17553 ?auto_17554 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17569 - SURFACE
      ?auto_17570 - SURFACE
      ?auto_17571 - SURFACE
      ?auto_17572 - SURFACE
      ?auto_17573 - SURFACE
    )
    :vars
    (
      ?auto_17583 - HOIST
      ?auto_17578 - PLACE
      ?auto_17586 - PLACE
      ?auto_17574 - HOIST
      ?auto_17576 - SURFACE
      ?auto_17585 - SURFACE
      ?auto_17582 - PLACE
      ?auto_17580 - HOIST
      ?auto_17581 - SURFACE
      ?auto_17584 - PLACE
      ?auto_17575 - HOIST
      ?auto_17579 - SURFACE
      ?auto_17577 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17583 ?auto_17578 ) ( IS-CRATE ?auto_17573 ) ( not ( = ?auto_17572 ?auto_17573 ) ) ( not ( = ?auto_17571 ?auto_17572 ) ) ( not ( = ?auto_17571 ?auto_17573 ) ) ( not ( = ?auto_17586 ?auto_17578 ) ) ( HOIST-AT ?auto_17574 ?auto_17586 ) ( not ( = ?auto_17583 ?auto_17574 ) ) ( SURFACE-AT ?auto_17573 ?auto_17586 ) ( ON ?auto_17573 ?auto_17576 ) ( CLEAR ?auto_17573 ) ( not ( = ?auto_17572 ?auto_17576 ) ) ( not ( = ?auto_17573 ?auto_17576 ) ) ( not ( = ?auto_17571 ?auto_17576 ) ) ( IS-CRATE ?auto_17572 ) ( AVAILABLE ?auto_17574 ) ( SURFACE-AT ?auto_17572 ?auto_17586 ) ( ON ?auto_17572 ?auto_17585 ) ( CLEAR ?auto_17572 ) ( not ( = ?auto_17572 ?auto_17585 ) ) ( not ( = ?auto_17573 ?auto_17585 ) ) ( not ( = ?auto_17571 ?auto_17585 ) ) ( not ( = ?auto_17576 ?auto_17585 ) ) ( IS-CRATE ?auto_17571 ) ( not ( = ?auto_17570 ?auto_17571 ) ) ( not ( = ?auto_17572 ?auto_17570 ) ) ( not ( = ?auto_17573 ?auto_17570 ) ) ( not ( = ?auto_17576 ?auto_17570 ) ) ( not ( = ?auto_17585 ?auto_17570 ) ) ( not ( = ?auto_17582 ?auto_17578 ) ) ( not ( = ?auto_17586 ?auto_17582 ) ) ( HOIST-AT ?auto_17580 ?auto_17582 ) ( not ( = ?auto_17583 ?auto_17580 ) ) ( not ( = ?auto_17574 ?auto_17580 ) ) ( AVAILABLE ?auto_17580 ) ( SURFACE-AT ?auto_17571 ?auto_17582 ) ( ON ?auto_17571 ?auto_17581 ) ( CLEAR ?auto_17571 ) ( not ( = ?auto_17572 ?auto_17581 ) ) ( not ( = ?auto_17573 ?auto_17581 ) ) ( not ( = ?auto_17571 ?auto_17581 ) ) ( not ( = ?auto_17576 ?auto_17581 ) ) ( not ( = ?auto_17585 ?auto_17581 ) ) ( not ( = ?auto_17570 ?auto_17581 ) ) ( SURFACE-AT ?auto_17569 ?auto_17578 ) ( CLEAR ?auto_17569 ) ( IS-CRATE ?auto_17570 ) ( not ( = ?auto_17569 ?auto_17570 ) ) ( not ( = ?auto_17572 ?auto_17569 ) ) ( not ( = ?auto_17573 ?auto_17569 ) ) ( not ( = ?auto_17571 ?auto_17569 ) ) ( not ( = ?auto_17576 ?auto_17569 ) ) ( not ( = ?auto_17585 ?auto_17569 ) ) ( not ( = ?auto_17581 ?auto_17569 ) ) ( AVAILABLE ?auto_17583 ) ( not ( = ?auto_17584 ?auto_17578 ) ) ( not ( = ?auto_17586 ?auto_17584 ) ) ( not ( = ?auto_17582 ?auto_17584 ) ) ( HOIST-AT ?auto_17575 ?auto_17584 ) ( not ( = ?auto_17583 ?auto_17575 ) ) ( not ( = ?auto_17574 ?auto_17575 ) ) ( not ( = ?auto_17580 ?auto_17575 ) ) ( AVAILABLE ?auto_17575 ) ( SURFACE-AT ?auto_17570 ?auto_17584 ) ( ON ?auto_17570 ?auto_17579 ) ( CLEAR ?auto_17570 ) ( not ( = ?auto_17572 ?auto_17579 ) ) ( not ( = ?auto_17573 ?auto_17579 ) ) ( not ( = ?auto_17571 ?auto_17579 ) ) ( not ( = ?auto_17576 ?auto_17579 ) ) ( not ( = ?auto_17585 ?auto_17579 ) ) ( not ( = ?auto_17570 ?auto_17579 ) ) ( not ( = ?auto_17581 ?auto_17579 ) ) ( not ( = ?auto_17569 ?auto_17579 ) ) ( TRUCK-AT ?auto_17577 ?auto_17578 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17571 ?auto_17572 ?auto_17573 )
      ( MAKE-4CRATE-VERIFY ?auto_17569 ?auto_17570 ?auto_17571 ?auto_17572 ?auto_17573 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17607 - SURFACE
      ?auto_17608 - SURFACE
    )
    :vars
    (
      ?auto_17609 - HOIST
      ?auto_17610 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17609 ?auto_17610 ) ( SURFACE-AT ?auto_17607 ?auto_17610 ) ( CLEAR ?auto_17607 ) ( LIFTING ?auto_17609 ?auto_17608 ) ( IS-CRATE ?auto_17608 ) ( not ( = ?auto_17607 ?auto_17608 ) ) )
    :subtasks
    ( ( !DROP ?auto_17609 ?auto_17608 ?auto_17607 ?auto_17610 )
      ( MAKE-1CRATE-VERIFY ?auto_17607 ?auto_17608 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17611 - SURFACE
      ?auto_17612 - SURFACE
      ?auto_17613 - SURFACE
    )
    :vars
    (
      ?auto_17615 - HOIST
      ?auto_17614 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17615 ?auto_17614 ) ( SURFACE-AT ?auto_17612 ?auto_17614 ) ( CLEAR ?auto_17612 ) ( LIFTING ?auto_17615 ?auto_17613 ) ( IS-CRATE ?auto_17613 ) ( not ( = ?auto_17612 ?auto_17613 ) ) ( ON ?auto_17612 ?auto_17611 ) ( not ( = ?auto_17611 ?auto_17612 ) ) ( not ( = ?auto_17611 ?auto_17613 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17612 ?auto_17613 )
      ( MAKE-2CRATE-VERIFY ?auto_17611 ?auto_17612 ?auto_17613 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17616 - SURFACE
      ?auto_17617 - SURFACE
      ?auto_17618 - SURFACE
      ?auto_17619 - SURFACE
    )
    :vars
    (
      ?auto_17621 - HOIST
      ?auto_17620 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17621 ?auto_17620 ) ( SURFACE-AT ?auto_17618 ?auto_17620 ) ( CLEAR ?auto_17618 ) ( LIFTING ?auto_17621 ?auto_17619 ) ( IS-CRATE ?auto_17619 ) ( not ( = ?auto_17618 ?auto_17619 ) ) ( ON ?auto_17617 ?auto_17616 ) ( ON ?auto_17618 ?auto_17617 ) ( not ( = ?auto_17616 ?auto_17617 ) ) ( not ( = ?auto_17616 ?auto_17618 ) ) ( not ( = ?auto_17616 ?auto_17619 ) ) ( not ( = ?auto_17617 ?auto_17618 ) ) ( not ( = ?auto_17617 ?auto_17619 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17618 ?auto_17619 )
      ( MAKE-3CRATE-VERIFY ?auto_17616 ?auto_17617 ?auto_17618 ?auto_17619 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17622 - SURFACE
      ?auto_17623 - SURFACE
      ?auto_17624 - SURFACE
      ?auto_17625 - SURFACE
      ?auto_17626 - SURFACE
    )
    :vars
    (
      ?auto_17628 - HOIST
      ?auto_17627 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17628 ?auto_17627 ) ( SURFACE-AT ?auto_17625 ?auto_17627 ) ( CLEAR ?auto_17625 ) ( LIFTING ?auto_17628 ?auto_17626 ) ( IS-CRATE ?auto_17626 ) ( not ( = ?auto_17625 ?auto_17626 ) ) ( ON ?auto_17623 ?auto_17622 ) ( ON ?auto_17624 ?auto_17623 ) ( ON ?auto_17625 ?auto_17624 ) ( not ( = ?auto_17622 ?auto_17623 ) ) ( not ( = ?auto_17622 ?auto_17624 ) ) ( not ( = ?auto_17622 ?auto_17625 ) ) ( not ( = ?auto_17622 ?auto_17626 ) ) ( not ( = ?auto_17623 ?auto_17624 ) ) ( not ( = ?auto_17623 ?auto_17625 ) ) ( not ( = ?auto_17623 ?auto_17626 ) ) ( not ( = ?auto_17624 ?auto_17625 ) ) ( not ( = ?auto_17624 ?auto_17626 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17625 ?auto_17626 )
      ( MAKE-4CRATE-VERIFY ?auto_17622 ?auto_17623 ?auto_17624 ?auto_17625 ?auto_17626 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17629 - SURFACE
      ?auto_17630 - SURFACE
      ?auto_17631 - SURFACE
      ?auto_17632 - SURFACE
      ?auto_17633 - SURFACE
      ?auto_17634 - SURFACE
    )
    :vars
    (
      ?auto_17636 - HOIST
      ?auto_17635 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17636 ?auto_17635 ) ( SURFACE-AT ?auto_17633 ?auto_17635 ) ( CLEAR ?auto_17633 ) ( LIFTING ?auto_17636 ?auto_17634 ) ( IS-CRATE ?auto_17634 ) ( not ( = ?auto_17633 ?auto_17634 ) ) ( ON ?auto_17630 ?auto_17629 ) ( ON ?auto_17631 ?auto_17630 ) ( ON ?auto_17632 ?auto_17631 ) ( ON ?auto_17633 ?auto_17632 ) ( not ( = ?auto_17629 ?auto_17630 ) ) ( not ( = ?auto_17629 ?auto_17631 ) ) ( not ( = ?auto_17629 ?auto_17632 ) ) ( not ( = ?auto_17629 ?auto_17633 ) ) ( not ( = ?auto_17629 ?auto_17634 ) ) ( not ( = ?auto_17630 ?auto_17631 ) ) ( not ( = ?auto_17630 ?auto_17632 ) ) ( not ( = ?auto_17630 ?auto_17633 ) ) ( not ( = ?auto_17630 ?auto_17634 ) ) ( not ( = ?auto_17631 ?auto_17632 ) ) ( not ( = ?auto_17631 ?auto_17633 ) ) ( not ( = ?auto_17631 ?auto_17634 ) ) ( not ( = ?auto_17632 ?auto_17633 ) ) ( not ( = ?auto_17632 ?auto_17634 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17633 ?auto_17634 )
      ( MAKE-5CRATE-VERIFY ?auto_17629 ?auto_17630 ?auto_17631 ?auto_17632 ?auto_17633 ?auto_17634 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17637 - SURFACE
      ?auto_17638 - SURFACE
    )
    :vars
    (
      ?auto_17640 - HOIST
      ?auto_17639 - PLACE
      ?auto_17641 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17640 ?auto_17639 ) ( SURFACE-AT ?auto_17637 ?auto_17639 ) ( CLEAR ?auto_17637 ) ( IS-CRATE ?auto_17638 ) ( not ( = ?auto_17637 ?auto_17638 ) ) ( TRUCK-AT ?auto_17641 ?auto_17639 ) ( AVAILABLE ?auto_17640 ) ( IN ?auto_17638 ?auto_17641 ) )
    :subtasks
    ( ( !UNLOAD ?auto_17640 ?auto_17638 ?auto_17641 ?auto_17639 )
      ( MAKE-1CRATE ?auto_17637 ?auto_17638 )
      ( MAKE-1CRATE-VERIFY ?auto_17637 ?auto_17638 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17642 - SURFACE
      ?auto_17643 - SURFACE
      ?auto_17644 - SURFACE
    )
    :vars
    (
      ?auto_17646 - HOIST
      ?auto_17647 - PLACE
      ?auto_17645 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17646 ?auto_17647 ) ( SURFACE-AT ?auto_17643 ?auto_17647 ) ( CLEAR ?auto_17643 ) ( IS-CRATE ?auto_17644 ) ( not ( = ?auto_17643 ?auto_17644 ) ) ( TRUCK-AT ?auto_17645 ?auto_17647 ) ( AVAILABLE ?auto_17646 ) ( IN ?auto_17644 ?auto_17645 ) ( ON ?auto_17643 ?auto_17642 ) ( not ( = ?auto_17642 ?auto_17643 ) ) ( not ( = ?auto_17642 ?auto_17644 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17643 ?auto_17644 )
      ( MAKE-2CRATE-VERIFY ?auto_17642 ?auto_17643 ?auto_17644 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17648 - SURFACE
      ?auto_17649 - SURFACE
      ?auto_17650 - SURFACE
      ?auto_17651 - SURFACE
    )
    :vars
    (
      ?auto_17654 - HOIST
      ?auto_17652 - PLACE
      ?auto_17653 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17654 ?auto_17652 ) ( SURFACE-AT ?auto_17650 ?auto_17652 ) ( CLEAR ?auto_17650 ) ( IS-CRATE ?auto_17651 ) ( not ( = ?auto_17650 ?auto_17651 ) ) ( TRUCK-AT ?auto_17653 ?auto_17652 ) ( AVAILABLE ?auto_17654 ) ( IN ?auto_17651 ?auto_17653 ) ( ON ?auto_17650 ?auto_17649 ) ( not ( = ?auto_17649 ?auto_17650 ) ) ( not ( = ?auto_17649 ?auto_17651 ) ) ( ON ?auto_17649 ?auto_17648 ) ( not ( = ?auto_17648 ?auto_17649 ) ) ( not ( = ?auto_17648 ?auto_17650 ) ) ( not ( = ?auto_17648 ?auto_17651 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17649 ?auto_17650 ?auto_17651 )
      ( MAKE-3CRATE-VERIFY ?auto_17648 ?auto_17649 ?auto_17650 ?auto_17651 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17655 - SURFACE
      ?auto_17656 - SURFACE
      ?auto_17657 - SURFACE
      ?auto_17658 - SURFACE
      ?auto_17659 - SURFACE
    )
    :vars
    (
      ?auto_17662 - HOIST
      ?auto_17660 - PLACE
      ?auto_17661 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17662 ?auto_17660 ) ( SURFACE-AT ?auto_17658 ?auto_17660 ) ( CLEAR ?auto_17658 ) ( IS-CRATE ?auto_17659 ) ( not ( = ?auto_17658 ?auto_17659 ) ) ( TRUCK-AT ?auto_17661 ?auto_17660 ) ( AVAILABLE ?auto_17662 ) ( IN ?auto_17659 ?auto_17661 ) ( ON ?auto_17658 ?auto_17657 ) ( not ( = ?auto_17657 ?auto_17658 ) ) ( not ( = ?auto_17657 ?auto_17659 ) ) ( ON ?auto_17656 ?auto_17655 ) ( ON ?auto_17657 ?auto_17656 ) ( not ( = ?auto_17655 ?auto_17656 ) ) ( not ( = ?auto_17655 ?auto_17657 ) ) ( not ( = ?auto_17655 ?auto_17658 ) ) ( not ( = ?auto_17655 ?auto_17659 ) ) ( not ( = ?auto_17656 ?auto_17657 ) ) ( not ( = ?auto_17656 ?auto_17658 ) ) ( not ( = ?auto_17656 ?auto_17659 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17657 ?auto_17658 ?auto_17659 )
      ( MAKE-4CRATE-VERIFY ?auto_17655 ?auto_17656 ?auto_17657 ?auto_17658 ?auto_17659 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17663 - SURFACE
      ?auto_17664 - SURFACE
      ?auto_17665 - SURFACE
      ?auto_17666 - SURFACE
      ?auto_17667 - SURFACE
      ?auto_17668 - SURFACE
    )
    :vars
    (
      ?auto_17671 - HOIST
      ?auto_17669 - PLACE
      ?auto_17670 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17671 ?auto_17669 ) ( SURFACE-AT ?auto_17667 ?auto_17669 ) ( CLEAR ?auto_17667 ) ( IS-CRATE ?auto_17668 ) ( not ( = ?auto_17667 ?auto_17668 ) ) ( TRUCK-AT ?auto_17670 ?auto_17669 ) ( AVAILABLE ?auto_17671 ) ( IN ?auto_17668 ?auto_17670 ) ( ON ?auto_17667 ?auto_17666 ) ( not ( = ?auto_17666 ?auto_17667 ) ) ( not ( = ?auto_17666 ?auto_17668 ) ) ( ON ?auto_17664 ?auto_17663 ) ( ON ?auto_17665 ?auto_17664 ) ( ON ?auto_17666 ?auto_17665 ) ( not ( = ?auto_17663 ?auto_17664 ) ) ( not ( = ?auto_17663 ?auto_17665 ) ) ( not ( = ?auto_17663 ?auto_17666 ) ) ( not ( = ?auto_17663 ?auto_17667 ) ) ( not ( = ?auto_17663 ?auto_17668 ) ) ( not ( = ?auto_17664 ?auto_17665 ) ) ( not ( = ?auto_17664 ?auto_17666 ) ) ( not ( = ?auto_17664 ?auto_17667 ) ) ( not ( = ?auto_17664 ?auto_17668 ) ) ( not ( = ?auto_17665 ?auto_17666 ) ) ( not ( = ?auto_17665 ?auto_17667 ) ) ( not ( = ?auto_17665 ?auto_17668 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17666 ?auto_17667 ?auto_17668 )
      ( MAKE-5CRATE-VERIFY ?auto_17663 ?auto_17664 ?auto_17665 ?auto_17666 ?auto_17667 ?auto_17668 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17672 - SURFACE
      ?auto_17673 - SURFACE
    )
    :vars
    (
      ?auto_17676 - HOIST
      ?auto_17674 - PLACE
      ?auto_17675 - TRUCK
      ?auto_17677 - SURFACE
      ?auto_17678 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17676 ?auto_17674 ) ( SURFACE-AT ?auto_17672 ?auto_17674 ) ( CLEAR ?auto_17672 ) ( IS-CRATE ?auto_17673 ) ( not ( = ?auto_17672 ?auto_17673 ) ) ( AVAILABLE ?auto_17676 ) ( IN ?auto_17673 ?auto_17675 ) ( ON ?auto_17672 ?auto_17677 ) ( not ( = ?auto_17677 ?auto_17672 ) ) ( not ( = ?auto_17677 ?auto_17673 ) ) ( TRUCK-AT ?auto_17675 ?auto_17678 ) ( not ( = ?auto_17678 ?auto_17674 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17675 ?auto_17678 ?auto_17674 )
      ( MAKE-2CRATE ?auto_17677 ?auto_17672 ?auto_17673 )
      ( MAKE-1CRATE-VERIFY ?auto_17672 ?auto_17673 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17679 - SURFACE
      ?auto_17680 - SURFACE
      ?auto_17681 - SURFACE
    )
    :vars
    (
      ?auto_17683 - HOIST
      ?auto_17682 - PLACE
      ?auto_17685 - TRUCK
      ?auto_17684 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17683 ?auto_17682 ) ( SURFACE-AT ?auto_17680 ?auto_17682 ) ( CLEAR ?auto_17680 ) ( IS-CRATE ?auto_17681 ) ( not ( = ?auto_17680 ?auto_17681 ) ) ( AVAILABLE ?auto_17683 ) ( IN ?auto_17681 ?auto_17685 ) ( ON ?auto_17680 ?auto_17679 ) ( not ( = ?auto_17679 ?auto_17680 ) ) ( not ( = ?auto_17679 ?auto_17681 ) ) ( TRUCK-AT ?auto_17685 ?auto_17684 ) ( not ( = ?auto_17684 ?auto_17682 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17680 ?auto_17681 )
      ( MAKE-2CRATE-VERIFY ?auto_17679 ?auto_17680 ?auto_17681 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17686 - SURFACE
      ?auto_17687 - SURFACE
      ?auto_17688 - SURFACE
      ?auto_17689 - SURFACE
    )
    :vars
    (
      ?auto_17691 - HOIST
      ?auto_17693 - PLACE
      ?auto_17690 - TRUCK
      ?auto_17692 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17691 ?auto_17693 ) ( SURFACE-AT ?auto_17688 ?auto_17693 ) ( CLEAR ?auto_17688 ) ( IS-CRATE ?auto_17689 ) ( not ( = ?auto_17688 ?auto_17689 ) ) ( AVAILABLE ?auto_17691 ) ( IN ?auto_17689 ?auto_17690 ) ( ON ?auto_17688 ?auto_17687 ) ( not ( = ?auto_17687 ?auto_17688 ) ) ( not ( = ?auto_17687 ?auto_17689 ) ) ( TRUCK-AT ?auto_17690 ?auto_17692 ) ( not ( = ?auto_17692 ?auto_17693 ) ) ( ON ?auto_17687 ?auto_17686 ) ( not ( = ?auto_17686 ?auto_17687 ) ) ( not ( = ?auto_17686 ?auto_17688 ) ) ( not ( = ?auto_17686 ?auto_17689 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17687 ?auto_17688 ?auto_17689 )
      ( MAKE-3CRATE-VERIFY ?auto_17686 ?auto_17687 ?auto_17688 ?auto_17689 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17694 - SURFACE
      ?auto_17695 - SURFACE
      ?auto_17696 - SURFACE
      ?auto_17697 - SURFACE
      ?auto_17698 - SURFACE
    )
    :vars
    (
      ?auto_17700 - HOIST
      ?auto_17702 - PLACE
      ?auto_17699 - TRUCK
      ?auto_17701 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17700 ?auto_17702 ) ( SURFACE-AT ?auto_17697 ?auto_17702 ) ( CLEAR ?auto_17697 ) ( IS-CRATE ?auto_17698 ) ( not ( = ?auto_17697 ?auto_17698 ) ) ( AVAILABLE ?auto_17700 ) ( IN ?auto_17698 ?auto_17699 ) ( ON ?auto_17697 ?auto_17696 ) ( not ( = ?auto_17696 ?auto_17697 ) ) ( not ( = ?auto_17696 ?auto_17698 ) ) ( TRUCK-AT ?auto_17699 ?auto_17701 ) ( not ( = ?auto_17701 ?auto_17702 ) ) ( ON ?auto_17695 ?auto_17694 ) ( ON ?auto_17696 ?auto_17695 ) ( not ( = ?auto_17694 ?auto_17695 ) ) ( not ( = ?auto_17694 ?auto_17696 ) ) ( not ( = ?auto_17694 ?auto_17697 ) ) ( not ( = ?auto_17694 ?auto_17698 ) ) ( not ( = ?auto_17695 ?auto_17696 ) ) ( not ( = ?auto_17695 ?auto_17697 ) ) ( not ( = ?auto_17695 ?auto_17698 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17696 ?auto_17697 ?auto_17698 )
      ( MAKE-4CRATE-VERIFY ?auto_17694 ?auto_17695 ?auto_17696 ?auto_17697 ?auto_17698 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17703 - SURFACE
      ?auto_17704 - SURFACE
      ?auto_17705 - SURFACE
      ?auto_17706 - SURFACE
      ?auto_17707 - SURFACE
      ?auto_17708 - SURFACE
    )
    :vars
    (
      ?auto_17710 - HOIST
      ?auto_17712 - PLACE
      ?auto_17709 - TRUCK
      ?auto_17711 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17710 ?auto_17712 ) ( SURFACE-AT ?auto_17707 ?auto_17712 ) ( CLEAR ?auto_17707 ) ( IS-CRATE ?auto_17708 ) ( not ( = ?auto_17707 ?auto_17708 ) ) ( AVAILABLE ?auto_17710 ) ( IN ?auto_17708 ?auto_17709 ) ( ON ?auto_17707 ?auto_17706 ) ( not ( = ?auto_17706 ?auto_17707 ) ) ( not ( = ?auto_17706 ?auto_17708 ) ) ( TRUCK-AT ?auto_17709 ?auto_17711 ) ( not ( = ?auto_17711 ?auto_17712 ) ) ( ON ?auto_17704 ?auto_17703 ) ( ON ?auto_17705 ?auto_17704 ) ( ON ?auto_17706 ?auto_17705 ) ( not ( = ?auto_17703 ?auto_17704 ) ) ( not ( = ?auto_17703 ?auto_17705 ) ) ( not ( = ?auto_17703 ?auto_17706 ) ) ( not ( = ?auto_17703 ?auto_17707 ) ) ( not ( = ?auto_17703 ?auto_17708 ) ) ( not ( = ?auto_17704 ?auto_17705 ) ) ( not ( = ?auto_17704 ?auto_17706 ) ) ( not ( = ?auto_17704 ?auto_17707 ) ) ( not ( = ?auto_17704 ?auto_17708 ) ) ( not ( = ?auto_17705 ?auto_17706 ) ) ( not ( = ?auto_17705 ?auto_17707 ) ) ( not ( = ?auto_17705 ?auto_17708 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17706 ?auto_17707 ?auto_17708 )
      ( MAKE-5CRATE-VERIFY ?auto_17703 ?auto_17704 ?auto_17705 ?auto_17706 ?auto_17707 ?auto_17708 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17713 - SURFACE
      ?auto_17714 - SURFACE
    )
    :vars
    (
      ?auto_17716 - HOIST
      ?auto_17718 - PLACE
      ?auto_17719 - SURFACE
      ?auto_17715 - TRUCK
      ?auto_17717 - PLACE
      ?auto_17720 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17716 ?auto_17718 ) ( SURFACE-AT ?auto_17713 ?auto_17718 ) ( CLEAR ?auto_17713 ) ( IS-CRATE ?auto_17714 ) ( not ( = ?auto_17713 ?auto_17714 ) ) ( AVAILABLE ?auto_17716 ) ( ON ?auto_17713 ?auto_17719 ) ( not ( = ?auto_17719 ?auto_17713 ) ) ( not ( = ?auto_17719 ?auto_17714 ) ) ( TRUCK-AT ?auto_17715 ?auto_17717 ) ( not ( = ?auto_17717 ?auto_17718 ) ) ( HOIST-AT ?auto_17720 ?auto_17717 ) ( LIFTING ?auto_17720 ?auto_17714 ) ( not ( = ?auto_17716 ?auto_17720 ) ) )
    :subtasks
    ( ( !LOAD ?auto_17720 ?auto_17714 ?auto_17715 ?auto_17717 )
      ( MAKE-2CRATE ?auto_17719 ?auto_17713 ?auto_17714 )
      ( MAKE-1CRATE-VERIFY ?auto_17713 ?auto_17714 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17721 - SURFACE
      ?auto_17722 - SURFACE
      ?auto_17723 - SURFACE
    )
    :vars
    (
      ?auto_17724 - HOIST
      ?auto_17725 - PLACE
      ?auto_17727 - TRUCK
      ?auto_17726 - PLACE
      ?auto_17728 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17724 ?auto_17725 ) ( SURFACE-AT ?auto_17722 ?auto_17725 ) ( CLEAR ?auto_17722 ) ( IS-CRATE ?auto_17723 ) ( not ( = ?auto_17722 ?auto_17723 ) ) ( AVAILABLE ?auto_17724 ) ( ON ?auto_17722 ?auto_17721 ) ( not ( = ?auto_17721 ?auto_17722 ) ) ( not ( = ?auto_17721 ?auto_17723 ) ) ( TRUCK-AT ?auto_17727 ?auto_17726 ) ( not ( = ?auto_17726 ?auto_17725 ) ) ( HOIST-AT ?auto_17728 ?auto_17726 ) ( LIFTING ?auto_17728 ?auto_17723 ) ( not ( = ?auto_17724 ?auto_17728 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17722 ?auto_17723 )
      ( MAKE-2CRATE-VERIFY ?auto_17721 ?auto_17722 ?auto_17723 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17729 - SURFACE
      ?auto_17730 - SURFACE
      ?auto_17731 - SURFACE
      ?auto_17732 - SURFACE
    )
    :vars
    (
      ?auto_17733 - HOIST
      ?auto_17735 - PLACE
      ?auto_17736 - TRUCK
      ?auto_17737 - PLACE
      ?auto_17734 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17733 ?auto_17735 ) ( SURFACE-AT ?auto_17731 ?auto_17735 ) ( CLEAR ?auto_17731 ) ( IS-CRATE ?auto_17732 ) ( not ( = ?auto_17731 ?auto_17732 ) ) ( AVAILABLE ?auto_17733 ) ( ON ?auto_17731 ?auto_17730 ) ( not ( = ?auto_17730 ?auto_17731 ) ) ( not ( = ?auto_17730 ?auto_17732 ) ) ( TRUCK-AT ?auto_17736 ?auto_17737 ) ( not ( = ?auto_17737 ?auto_17735 ) ) ( HOIST-AT ?auto_17734 ?auto_17737 ) ( LIFTING ?auto_17734 ?auto_17732 ) ( not ( = ?auto_17733 ?auto_17734 ) ) ( ON ?auto_17730 ?auto_17729 ) ( not ( = ?auto_17729 ?auto_17730 ) ) ( not ( = ?auto_17729 ?auto_17731 ) ) ( not ( = ?auto_17729 ?auto_17732 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17730 ?auto_17731 ?auto_17732 )
      ( MAKE-3CRATE-VERIFY ?auto_17729 ?auto_17730 ?auto_17731 ?auto_17732 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17738 - SURFACE
      ?auto_17739 - SURFACE
      ?auto_17740 - SURFACE
      ?auto_17741 - SURFACE
      ?auto_17742 - SURFACE
    )
    :vars
    (
      ?auto_17743 - HOIST
      ?auto_17745 - PLACE
      ?auto_17746 - TRUCK
      ?auto_17747 - PLACE
      ?auto_17744 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17743 ?auto_17745 ) ( SURFACE-AT ?auto_17741 ?auto_17745 ) ( CLEAR ?auto_17741 ) ( IS-CRATE ?auto_17742 ) ( not ( = ?auto_17741 ?auto_17742 ) ) ( AVAILABLE ?auto_17743 ) ( ON ?auto_17741 ?auto_17740 ) ( not ( = ?auto_17740 ?auto_17741 ) ) ( not ( = ?auto_17740 ?auto_17742 ) ) ( TRUCK-AT ?auto_17746 ?auto_17747 ) ( not ( = ?auto_17747 ?auto_17745 ) ) ( HOIST-AT ?auto_17744 ?auto_17747 ) ( LIFTING ?auto_17744 ?auto_17742 ) ( not ( = ?auto_17743 ?auto_17744 ) ) ( ON ?auto_17739 ?auto_17738 ) ( ON ?auto_17740 ?auto_17739 ) ( not ( = ?auto_17738 ?auto_17739 ) ) ( not ( = ?auto_17738 ?auto_17740 ) ) ( not ( = ?auto_17738 ?auto_17741 ) ) ( not ( = ?auto_17738 ?auto_17742 ) ) ( not ( = ?auto_17739 ?auto_17740 ) ) ( not ( = ?auto_17739 ?auto_17741 ) ) ( not ( = ?auto_17739 ?auto_17742 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17740 ?auto_17741 ?auto_17742 )
      ( MAKE-4CRATE-VERIFY ?auto_17738 ?auto_17739 ?auto_17740 ?auto_17741 ?auto_17742 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17748 - SURFACE
      ?auto_17749 - SURFACE
      ?auto_17750 - SURFACE
      ?auto_17751 - SURFACE
      ?auto_17752 - SURFACE
      ?auto_17753 - SURFACE
    )
    :vars
    (
      ?auto_17754 - HOIST
      ?auto_17756 - PLACE
      ?auto_17757 - TRUCK
      ?auto_17758 - PLACE
      ?auto_17755 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17754 ?auto_17756 ) ( SURFACE-AT ?auto_17752 ?auto_17756 ) ( CLEAR ?auto_17752 ) ( IS-CRATE ?auto_17753 ) ( not ( = ?auto_17752 ?auto_17753 ) ) ( AVAILABLE ?auto_17754 ) ( ON ?auto_17752 ?auto_17751 ) ( not ( = ?auto_17751 ?auto_17752 ) ) ( not ( = ?auto_17751 ?auto_17753 ) ) ( TRUCK-AT ?auto_17757 ?auto_17758 ) ( not ( = ?auto_17758 ?auto_17756 ) ) ( HOIST-AT ?auto_17755 ?auto_17758 ) ( LIFTING ?auto_17755 ?auto_17753 ) ( not ( = ?auto_17754 ?auto_17755 ) ) ( ON ?auto_17749 ?auto_17748 ) ( ON ?auto_17750 ?auto_17749 ) ( ON ?auto_17751 ?auto_17750 ) ( not ( = ?auto_17748 ?auto_17749 ) ) ( not ( = ?auto_17748 ?auto_17750 ) ) ( not ( = ?auto_17748 ?auto_17751 ) ) ( not ( = ?auto_17748 ?auto_17752 ) ) ( not ( = ?auto_17748 ?auto_17753 ) ) ( not ( = ?auto_17749 ?auto_17750 ) ) ( not ( = ?auto_17749 ?auto_17751 ) ) ( not ( = ?auto_17749 ?auto_17752 ) ) ( not ( = ?auto_17749 ?auto_17753 ) ) ( not ( = ?auto_17750 ?auto_17751 ) ) ( not ( = ?auto_17750 ?auto_17752 ) ) ( not ( = ?auto_17750 ?auto_17753 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17751 ?auto_17752 ?auto_17753 )
      ( MAKE-5CRATE-VERIFY ?auto_17748 ?auto_17749 ?auto_17750 ?auto_17751 ?auto_17752 ?auto_17753 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17759 - SURFACE
      ?auto_17760 - SURFACE
    )
    :vars
    (
      ?auto_17761 - HOIST
      ?auto_17763 - PLACE
      ?auto_17766 - SURFACE
      ?auto_17764 - TRUCK
      ?auto_17765 - PLACE
      ?auto_17762 - HOIST
      ?auto_17767 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17761 ?auto_17763 ) ( SURFACE-AT ?auto_17759 ?auto_17763 ) ( CLEAR ?auto_17759 ) ( IS-CRATE ?auto_17760 ) ( not ( = ?auto_17759 ?auto_17760 ) ) ( AVAILABLE ?auto_17761 ) ( ON ?auto_17759 ?auto_17766 ) ( not ( = ?auto_17766 ?auto_17759 ) ) ( not ( = ?auto_17766 ?auto_17760 ) ) ( TRUCK-AT ?auto_17764 ?auto_17765 ) ( not ( = ?auto_17765 ?auto_17763 ) ) ( HOIST-AT ?auto_17762 ?auto_17765 ) ( not ( = ?auto_17761 ?auto_17762 ) ) ( AVAILABLE ?auto_17762 ) ( SURFACE-AT ?auto_17760 ?auto_17765 ) ( ON ?auto_17760 ?auto_17767 ) ( CLEAR ?auto_17760 ) ( not ( = ?auto_17759 ?auto_17767 ) ) ( not ( = ?auto_17760 ?auto_17767 ) ) ( not ( = ?auto_17766 ?auto_17767 ) ) )
    :subtasks
    ( ( !LIFT ?auto_17762 ?auto_17760 ?auto_17767 ?auto_17765 )
      ( MAKE-2CRATE ?auto_17766 ?auto_17759 ?auto_17760 )
      ( MAKE-1CRATE-VERIFY ?auto_17759 ?auto_17760 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17768 - SURFACE
      ?auto_17769 - SURFACE
      ?auto_17770 - SURFACE
    )
    :vars
    (
      ?auto_17771 - HOIST
      ?auto_17773 - PLACE
      ?auto_17775 - TRUCK
      ?auto_17774 - PLACE
      ?auto_17772 - HOIST
      ?auto_17776 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17771 ?auto_17773 ) ( SURFACE-AT ?auto_17769 ?auto_17773 ) ( CLEAR ?auto_17769 ) ( IS-CRATE ?auto_17770 ) ( not ( = ?auto_17769 ?auto_17770 ) ) ( AVAILABLE ?auto_17771 ) ( ON ?auto_17769 ?auto_17768 ) ( not ( = ?auto_17768 ?auto_17769 ) ) ( not ( = ?auto_17768 ?auto_17770 ) ) ( TRUCK-AT ?auto_17775 ?auto_17774 ) ( not ( = ?auto_17774 ?auto_17773 ) ) ( HOIST-AT ?auto_17772 ?auto_17774 ) ( not ( = ?auto_17771 ?auto_17772 ) ) ( AVAILABLE ?auto_17772 ) ( SURFACE-AT ?auto_17770 ?auto_17774 ) ( ON ?auto_17770 ?auto_17776 ) ( CLEAR ?auto_17770 ) ( not ( = ?auto_17769 ?auto_17776 ) ) ( not ( = ?auto_17770 ?auto_17776 ) ) ( not ( = ?auto_17768 ?auto_17776 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17769 ?auto_17770 )
      ( MAKE-2CRATE-VERIFY ?auto_17768 ?auto_17769 ?auto_17770 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17777 - SURFACE
      ?auto_17778 - SURFACE
      ?auto_17779 - SURFACE
      ?auto_17780 - SURFACE
    )
    :vars
    (
      ?auto_17783 - HOIST
      ?auto_17781 - PLACE
      ?auto_17784 - TRUCK
      ?auto_17785 - PLACE
      ?auto_17786 - HOIST
      ?auto_17782 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17783 ?auto_17781 ) ( SURFACE-AT ?auto_17779 ?auto_17781 ) ( CLEAR ?auto_17779 ) ( IS-CRATE ?auto_17780 ) ( not ( = ?auto_17779 ?auto_17780 ) ) ( AVAILABLE ?auto_17783 ) ( ON ?auto_17779 ?auto_17778 ) ( not ( = ?auto_17778 ?auto_17779 ) ) ( not ( = ?auto_17778 ?auto_17780 ) ) ( TRUCK-AT ?auto_17784 ?auto_17785 ) ( not ( = ?auto_17785 ?auto_17781 ) ) ( HOIST-AT ?auto_17786 ?auto_17785 ) ( not ( = ?auto_17783 ?auto_17786 ) ) ( AVAILABLE ?auto_17786 ) ( SURFACE-AT ?auto_17780 ?auto_17785 ) ( ON ?auto_17780 ?auto_17782 ) ( CLEAR ?auto_17780 ) ( not ( = ?auto_17779 ?auto_17782 ) ) ( not ( = ?auto_17780 ?auto_17782 ) ) ( not ( = ?auto_17778 ?auto_17782 ) ) ( ON ?auto_17778 ?auto_17777 ) ( not ( = ?auto_17777 ?auto_17778 ) ) ( not ( = ?auto_17777 ?auto_17779 ) ) ( not ( = ?auto_17777 ?auto_17780 ) ) ( not ( = ?auto_17777 ?auto_17782 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17778 ?auto_17779 ?auto_17780 )
      ( MAKE-3CRATE-VERIFY ?auto_17777 ?auto_17778 ?auto_17779 ?auto_17780 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17787 - SURFACE
      ?auto_17788 - SURFACE
      ?auto_17789 - SURFACE
      ?auto_17790 - SURFACE
      ?auto_17791 - SURFACE
    )
    :vars
    (
      ?auto_17794 - HOIST
      ?auto_17792 - PLACE
      ?auto_17795 - TRUCK
      ?auto_17796 - PLACE
      ?auto_17797 - HOIST
      ?auto_17793 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17794 ?auto_17792 ) ( SURFACE-AT ?auto_17790 ?auto_17792 ) ( CLEAR ?auto_17790 ) ( IS-CRATE ?auto_17791 ) ( not ( = ?auto_17790 ?auto_17791 ) ) ( AVAILABLE ?auto_17794 ) ( ON ?auto_17790 ?auto_17789 ) ( not ( = ?auto_17789 ?auto_17790 ) ) ( not ( = ?auto_17789 ?auto_17791 ) ) ( TRUCK-AT ?auto_17795 ?auto_17796 ) ( not ( = ?auto_17796 ?auto_17792 ) ) ( HOIST-AT ?auto_17797 ?auto_17796 ) ( not ( = ?auto_17794 ?auto_17797 ) ) ( AVAILABLE ?auto_17797 ) ( SURFACE-AT ?auto_17791 ?auto_17796 ) ( ON ?auto_17791 ?auto_17793 ) ( CLEAR ?auto_17791 ) ( not ( = ?auto_17790 ?auto_17793 ) ) ( not ( = ?auto_17791 ?auto_17793 ) ) ( not ( = ?auto_17789 ?auto_17793 ) ) ( ON ?auto_17788 ?auto_17787 ) ( ON ?auto_17789 ?auto_17788 ) ( not ( = ?auto_17787 ?auto_17788 ) ) ( not ( = ?auto_17787 ?auto_17789 ) ) ( not ( = ?auto_17787 ?auto_17790 ) ) ( not ( = ?auto_17787 ?auto_17791 ) ) ( not ( = ?auto_17787 ?auto_17793 ) ) ( not ( = ?auto_17788 ?auto_17789 ) ) ( not ( = ?auto_17788 ?auto_17790 ) ) ( not ( = ?auto_17788 ?auto_17791 ) ) ( not ( = ?auto_17788 ?auto_17793 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17789 ?auto_17790 ?auto_17791 )
      ( MAKE-4CRATE-VERIFY ?auto_17787 ?auto_17788 ?auto_17789 ?auto_17790 ?auto_17791 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17798 - SURFACE
      ?auto_17799 - SURFACE
      ?auto_17800 - SURFACE
      ?auto_17801 - SURFACE
      ?auto_17802 - SURFACE
      ?auto_17803 - SURFACE
    )
    :vars
    (
      ?auto_17806 - HOIST
      ?auto_17804 - PLACE
      ?auto_17807 - TRUCK
      ?auto_17808 - PLACE
      ?auto_17809 - HOIST
      ?auto_17805 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17806 ?auto_17804 ) ( SURFACE-AT ?auto_17802 ?auto_17804 ) ( CLEAR ?auto_17802 ) ( IS-CRATE ?auto_17803 ) ( not ( = ?auto_17802 ?auto_17803 ) ) ( AVAILABLE ?auto_17806 ) ( ON ?auto_17802 ?auto_17801 ) ( not ( = ?auto_17801 ?auto_17802 ) ) ( not ( = ?auto_17801 ?auto_17803 ) ) ( TRUCK-AT ?auto_17807 ?auto_17808 ) ( not ( = ?auto_17808 ?auto_17804 ) ) ( HOIST-AT ?auto_17809 ?auto_17808 ) ( not ( = ?auto_17806 ?auto_17809 ) ) ( AVAILABLE ?auto_17809 ) ( SURFACE-AT ?auto_17803 ?auto_17808 ) ( ON ?auto_17803 ?auto_17805 ) ( CLEAR ?auto_17803 ) ( not ( = ?auto_17802 ?auto_17805 ) ) ( not ( = ?auto_17803 ?auto_17805 ) ) ( not ( = ?auto_17801 ?auto_17805 ) ) ( ON ?auto_17799 ?auto_17798 ) ( ON ?auto_17800 ?auto_17799 ) ( ON ?auto_17801 ?auto_17800 ) ( not ( = ?auto_17798 ?auto_17799 ) ) ( not ( = ?auto_17798 ?auto_17800 ) ) ( not ( = ?auto_17798 ?auto_17801 ) ) ( not ( = ?auto_17798 ?auto_17802 ) ) ( not ( = ?auto_17798 ?auto_17803 ) ) ( not ( = ?auto_17798 ?auto_17805 ) ) ( not ( = ?auto_17799 ?auto_17800 ) ) ( not ( = ?auto_17799 ?auto_17801 ) ) ( not ( = ?auto_17799 ?auto_17802 ) ) ( not ( = ?auto_17799 ?auto_17803 ) ) ( not ( = ?auto_17799 ?auto_17805 ) ) ( not ( = ?auto_17800 ?auto_17801 ) ) ( not ( = ?auto_17800 ?auto_17802 ) ) ( not ( = ?auto_17800 ?auto_17803 ) ) ( not ( = ?auto_17800 ?auto_17805 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17801 ?auto_17802 ?auto_17803 )
      ( MAKE-5CRATE-VERIFY ?auto_17798 ?auto_17799 ?auto_17800 ?auto_17801 ?auto_17802 ?auto_17803 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17810 - SURFACE
      ?auto_17811 - SURFACE
    )
    :vars
    (
      ?auto_17814 - HOIST
      ?auto_17812 - PLACE
      ?auto_17818 - SURFACE
      ?auto_17816 - PLACE
      ?auto_17817 - HOIST
      ?auto_17813 - SURFACE
      ?auto_17815 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17814 ?auto_17812 ) ( SURFACE-AT ?auto_17810 ?auto_17812 ) ( CLEAR ?auto_17810 ) ( IS-CRATE ?auto_17811 ) ( not ( = ?auto_17810 ?auto_17811 ) ) ( AVAILABLE ?auto_17814 ) ( ON ?auto_17810 ?auto_17818 ) ( not ( = ?auto_17818 ?auto_17810 ) ) ( not ( = ?auto_17818 ?auto_17811 ) ) ( not ( = ?auto_17816 ?auto_17812 ) ) ( HOIST-AT ?auto_17817 ?auto_17816 ) ( not ( = ?auto_17814 ?auto_17817 ) ) ( AVAILABLE ?auto_17817 ) ( SURFACE-AT ?auto_17811 ?auto_17816 ) ( ON ?auto_17811 ?auto_17813 ) ( CLEAR ?auto_17811 ) ( not ( = ?auto_17810 ?auto_17813 ) ) ( not ( = ?auto_17811 ?auto_17813 ) ) ( not ( = ?auto_17818 ?auto_17813 ) ) ( TRUCK-AT ?auto_17815 ?auto_17812 ) )
    :subtasks
    ( ( !DRIVE ?auto_17815 ?auto_17812 ?auto_17816 )
      ( MAKE-2CRATE ?auto_17818 ?auto_17810 ?auto_17811 )
      ( MAKE-1CRATE-VERIFY ?auto_17810 ?auto_17811 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17819 - SURFACE
      ?auto_17820 - SURFACE
      ?auto_17821 - SURFACE
    )
    :vars
    (
      ?auto_17826 - HOIST
      ?auto_17823 - PLACE
      ?auto_17822 - PLACE
      ?auto_17827 - HOIST
      ?auto_17824 - SURFACE
      ?auto_17825 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17826 ?auto_17823 ) ( SURFACE-AT ?auto_17820 ?auto_17823 ) ( CLEAR ?auto_17820 ) ( IS-CRATE ?auto_17821 ) ( not ( = ?auto_17820 ?auto_17821 ) ) ( AVAILABLE ?auto_17826 ) ( ON ?auto_17820 ?auto_17819 ) ( not ( = ?auto_17819 ?auto_17820 ) ) ( not ( = ?auto_17819 ?auto_17821 ) ) ( not ( = ?auto_17822 ?auto_17823 ) ) ( HOIST-AT ?auto_17827 ?auto_17822 ) ( not ( = ?auto_17826 ?auto_17827 ) ) ( AVAILABLE ?auto_17827 ) ( SURFACE-AT ?auto_17821 ?auto_17822 ) ( ON ?auto_17821 ?auto_17824 ) ( CLEAR ?auto_17821 ) ( not ( = ?auto_17820 ?auto_17824 ) ) ( not ( = ?auto_17821 ?auto_17824 ) ) ( not ( = ?auto_17819 ?auto_17824 ) ) ( TRUCK-AT ?auto_17825 ?auto_17823 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17820 ?auto_17821 )
      ( MAKE-2CRATE-VERIFY ?auto_17819 ?auto_17820 ?auto_17821 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17828 - SURFACE
      ?auto_17829 - SURFACE
      ?auto_17830 - SURFACE
      ?auto_17831 - SURFACE
    )
    :vars
    (
      ?auto_17836 - HOIST
      ?auto_17837 - PLACE
      ?auto_17835 - PLACE
      ?auto_17833 - HOIST
      ?auto_17832 - SURFACE
      ?auto_17834 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17836 ?auto_17837 ) ( SURFACE-AT ?auto_17830 ?auto_17837 ) ( CLEAR ?auto_17830 ) ( IS-CRATE ?auto_17831 ) ( not ( = ?auto_17830 ?auto_17831 ) ) ( AVAILABLE ?auto_17836 ) ( ON ?auto_17830 ?auto_17829 ) ( not ( = ?auto_17829 ?auto_17830 ) ) ( not ( = ?auto_17829 ?auto_17831 ) ) ( not ( = ?auto_17835 ?auto_17837 ) ) ( HOIST-AT ?auto_17833 ?auto_17835 ) ( not ( = ?auto_17836 ?auto_17833 ) ) ( AVAILABLE ?auto_17833 ) ( SURFACE-AT ?auto_17831 ?auto_17835 ) ( ON ?auto_17831 ?auto_17832 ) ( CLEAR ?auto_17831 ) ( not ( = ?auto_17830 ?auto_17832 ) ) ( not ( = ?auto_17831 ?auto_17832 ) ) ( not ( = ?auto_17829 ?auto_17832 ) ) ( TRUCK-AT ?auto_17834 ?auto_17837 ) ( ON ?auto_17829 ?auto_17828 ) ( not ( = ?auto_17828 ?auto_17829 ) ) ( not ( = ?auto_17828 ?auto_17830 ) ) ( not ( = ?auto_17828 ?auto_17831 ) ) ( not ( = ?auto_17828 ?auto_17832 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17829 ?auto_17830 ?auto_17831 )
      ( MAKE-3CRATE-VERIFY ?auto_17828 ?auto_17829 ?auto_17830 ?auto_17831 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17838 - SURFACE
      ?auto_17839 - SURFACE
      ?auto_17840 - SURFACE
      ?auto_17841 - SURFACE
      ?auto_17842 - SURFACE
    )
    :vars
    (
      ?auto_17847 - HOIST
      ?auto_17848 - PLACE
      ?auto_17846 - PLACE
      ?auto_17844 - HOIST
      ?auto_17843 - SURFACE
      ?auto_17845 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17847 ?auto_17848 ) ( SURFACE-AT ?auto_17841 ?auto_17848 ) ( CLEAR ?auto_17841 ) ( IS-CRATE ?auto_17842 ) ( not ( = ?auto_17841 ?auto_17842 ) ) ( AVAILABLE ?auto_17847 ) ( ON ?auto_17841 ?auto_17840 ) ( not ( = ?auto_17840 ?auto_17841 ) ) ( not ( = ?auto_17840 ?auto_17842 ) ) ( not ( = ?auto_17846 ?auto_17848 ) ) ( HOIST-AT ?auto_17844 ?auto_17846 ) ( not ( = ?auto_17847 ?auto_17844 ) ) ( AVAILABLE ?auto_17844 ) ( SURFACE-AT ?auto_17842 ?auto_17846 ) ( ON ?auto_17842 ?auto_17843 ) ( CLEAR ?auto_17842 ) ( not ( = ?auto_17841 ?auto_17843 ) ) ( not ( = ?auto_17842 ?auto_17843 ) ) ( not ( = ?auto_17840 ?auto_17843 ) ) ( TRUCK-AT ?auto_17845 ?auto_17848 ) ( ON ?auto_17839 ?auto_17838 ) ( ON ?auto_17840 ?auto_17839 ) ( not ( = ?auto_17838 ?auto_17839 ) ) ( not ( = ?auto_17838 ?auto_17840 ) ) ( not ( = ?auto_17838 ?auto_17841 ) ) ( not ( = ?auto_17838 ?auto_17842 ) ) ( not ( = ?auto_17838 ?auto_17843 ) ) ( not ( = ?auto_17839 ?auto_17840 ) ) ( not ( = ?auto_17839 ?auto_17841 ) ) ( not ( = ?auto_17839 ?auto_17842 ) ) ( not ( = ?auto_17839 ?auto_17843 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17840 ?auto_17841 ?auto_17842 )
      ( MAKE-4CRATE-VERIFY ?auto_17838 ?auto_17839 ?auto_17840 ?auto_17841 ?auto_17842 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17849 - SURFACE
      ?auto_17850 - SURFACE
      ?auto_17851 - SURFACE
      ?auto_17852 - SURFACE
      ?auto_17853 - SURFACE
      ?auto_17854 - SURFACE
    )
    :vars
    (
      ?auto_17859 - HOIST
      ?auto_17860 - PLACE
      ?auto_17858 - PLACE
      ?auto_17856 - HOIST
      ?auto_17855 - SURFACE
      ?auto_17857 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17859 ?auto_17860 ) ( SURFACE-AT ?auto_17853 ?auto_17860 ) ( CLEAR ?auto_17853 ) ( IS-CRATE ?auto_17854 ) ( not ( = ?auto_17853 ?auto_17854 ) ) ( AVAILABLE ?auto_17859 ) ( ON ?auto_17853 ?auto_17852 ) ( not ( = ?auto_17852 ?auto_17853 ) ) ( not ( = ?auto_17852 ?auto_17854 ) ) ( not ( = ?auto_17858 ?auto_17860 ) ) ( HOIST-AT ?auto_17856 ?auto_17858 ) ( not ( = ?auto_17859 ?auto_17856 ) ) ( AVAILABLE ?auto_17856 ) ( SURFACE-AT ?auto_17854 ?auto_17858 ) ( ON ?auto_17854 ?auto_17855 ) ( CLEAR ?auto_17854 ) ( not ( = ?auto_17853 ?auto_17855 ) ) ( not ( = ?auto_17854 ?auto_17855 ) ) ( not ( = ?auto_17852 ?auto_17855 ) ) ( TRUCK-AT ?auto_17857 ?auto_17860 ) ( ON ?auto_17850 ?auto_17849 ) ( ON ?auto_17851 ?auto_17850 ) ( ON ?auto_17852 ?auto_17851 ) ( not ( = ?auto_17849 ?auto_17850 ) ) ( not ( = ?auto_17849 ?auto_17851 ) ) ( not ( = ?auto_17849 ?auto_17852 ) ) ( not ( = ?auto_17849 ?auto_17853 ) ) ( not ( = ?auto_17849 ?auto_17854 ) ) ( not ( = ?auto_17849 ?auto_17855 ) ) ( not ( = ?auto_17850 ?auto_17851 ) ) ( not ( = ?auto_17850 ?auto_17852 ) ) ( not ( = ?auto_17850 ?auto_17853 ) ) ( not ( = ?auto_17850 ?auto_17854 ) ) ( not ( = ?auto_17850 ?auto_17855 ) ) ( not ( = ?auto_17851 ?auto_17852 ) ) ( not ( = ?auto_17851 ?auto_17853 ) ) ( not ( = ?auto_17851 ?auto_17854 ) ) ( not ( = ?auto_17851 ?auto_17855 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17852 ?auto_17853 ?auto_17854 )
      ( MAKE-5CRATE-VERIFY ?auto_17849 ?auto_17850 ?auto_17851 ?auto_17852 ?auto_17853 ?auto_17854 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17861 - SURFACE
      ?auto_17862 - SURFACE
    )
    :vars
    (
      ?auto_17867 - HOIST
      ?auto_17868 - PLACE
      ?auto_17869 - SURFACE
      ?auto_17866 - PLACE
      ?auto_17864 - HOIST
      ?auto_17863 - SURFACE
      ?auto_17865 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17867 ?auto_17868 ) ( IS-CRATE ?auto_17862 ) ( not ( = ?auto_17861 ?auto_17862 ) ) ( not ( = ?auto_17869 ?auto_17861 ) ) ( not ( = ?auto_17869 ?auto_17862 ) ) ( not ( = ?auto_17866 ?auto_17868 ) ) ( HOIST-AT ?auto_17864 ?auto_17866 ) ( not ( = ?auto_17867 ?auto_17864 ) ) ( AVAILABLE ?auto_17864 ) ( SURFACE-AT ?auto_17862 ?auto_17866 ) ( ON ?auto_17862 ?auto_17863 ) ( CLEAR ?auto_17862 ) ( not ( = ?auto_17861 ?auto_17863 ) ) ( not ( = ?auto_17862 ?auto_17863 ) ) ( not ( = ?auto_17869 ?auto_17863 ) ) ( TRUCK-AT ?auto_17865 ?auto_17868 ) ( SURFACE-AT ?auto_17869 ?auto_17868 ) ( CLEAR ?auto_17869 ) ( LIFTING ?auto_17867 ?auto_17861 ) ( IS-CRATE ?auto_17861 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17869 ?auto_17861 )
      ( MAKE-2CRATE ?auto_17869 ?auto_17861 ?auto_17862 )
      ( MAKE-1CRATE-VERIFY ?auto_17861 ?auto_17862 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17870 - SURFACE
      ?auto_17871 - SURFACE
      ?auto_17872 - SURFACE
    )
    :vars
    (
      ?auto_17877 - HOIST
      ?auto_17875 - PLACE
      ?auto_17873 - PLACE
      ?auto_17878 - HOIST
      ?auto_17874 - SURFACE
      ?auto_17876 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17877 ?auto_17875 ) ( IS-CRATE ?auto_17872 ) ( not ( = ?auto_17871 ?auto_17872 ) ) ( not ( = ?auto_17870 ?auto_17871 ) ) ( not ( = ?auto_17870 ?auto_17872 ) ) ( not ( = ?auto_17873 ?auto_17875 ) ) ( HOIST-AT ?auto_17878 ?auto_17873 ) ( not ( = ?auto_17877 ?auto_17878 ) ) ( AVAILABLE ?auto_17878 ) ( SURFACE-AT ?auto_17872 ?auto_17873 ) ( ON ?auto_17872 ?auto_17874 ) ( CLEAR ?auto_17872 ) ( not ( = ?auto_17871 ?auto_17874 ) ) ( not ( = ?auto_17872 ?auto_17874 ) ) ( not ( = ?auto_17870 ?auto_17874 ) ) ( TRUCK-AT ?auto_17876 ?auto_17875 ) ( SURFACE-AT ?auto_17870 ?auto_17875 ) ( CLEAR ?auto_17870 ) ( LIFTING ?auto_17877 ?auto_17871 ) ( IS-CRATE ?auto_17871 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17871 ?auto_17872 )
      ( MAKE-2CRATE-VERIFY ?auto_17870 ?auto_17871 ?auto_17872 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17879 - SURFACE
      ?auto_17880 - SURFACE
      ?auto_17881 - SURFACE
      ?auto_17882 - SURFACE
    )
    :vars
    (
      ?auto_17886 - HOIST
      ?auto_17885 - PLACE
      ?auto_17887 - PLACE
      ?auto_17888 - HOIST
      ?auto_17883 - SURFACE
      ?auto_17884 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17886 ?auto_17885 ) ( IS-CRATE ?auto_17882 ) ( not ( = ?auto_17881 ?auto_17882 ) ) ( not ( = ?auto_17880 ?auto_17881 ) ) ( not ( = ?auto_17880 ?auto_17882 ) ) ( not ( = ?auto_17887 ?auto_17885 ) ) ( HOIST-AT ?auto_17888 ?auto_17887 ) ( not ( = ?auto_17886 ?auto_17888 ) ) ( AVAILABLE ?auto_17888 ) ( SURFACE-AT ?auto_17882 ?auto_17887 ) ( ON ?auto_17882 ?auto_17883 ) ( CLEAR ?auto_17882 ) ( not ( = ?auto_17881 ?auto_17883 ) ) ( not ( = ?auto_17882 ?auto_17883 ) ) ( not ( = ?auto_17880 ?auto_17883 ) ) ( TRUCK-AT ?auto_17884 ?auto_17885 ) ( SURFACE-AT ?auto_17880 ?auto_17885 ) ( CLEAR ?auto_17880 ) ( LIFTING ?auto_17886 ?auto_17881 ) ( IS-CRATE ?auto_17881 ) ( ON ?auto_17880 ?auto_17879 ) ( not ( = ?auto_17879 ?auto_17880 ) ) ( not ( = ?auto_17879 ?auto_17881 ) ) ( not ( = ?auto_17879 ?auto_17882 ) ) ( not ( = ?auto_17879 ?auto_17883 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17880 ?auto_17881 ?auto_17882 )
      ( MAKE-3CRATE-VERIFY ?auto_17879 ?auto_17880 ?auto_17881 ?auto_17882 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17889 - SURFACE
      ?auto_17890 - SURFACE
      ?auto_17891 - SURFACE
      ?auto_17892 - SURFACE
      ?auto_17893 - SURFACE
    )
    :vars
    (
      ?auto_17897 - HOIST
      ?auto_17896 - PLACE
      ?auto_17898 - PLACE
      ?auto_17899 - HOIST
      ?auto_17894 - SURFACE
      ?auto_17895 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17897 ?auto_17896 ) ( IS-CRATE ?auto_17893 ) ( not ( = ?auto_17892 ?auto_17893 ) ) ( not ( = ?auto_17891 ?auto_17892 ) ) ( not ( = ?auto_17891 ?auto_17893 ) ) ( not ( = ?auto_17898 ?auto_17896 ) ) ( HOIST-AT ?auto_17899 ?auto_17898 ) ( not ( = ?auto_17897 ?auto_17899 ) ) ( AVAILABLE ?auto_17899 ) ( SURFACE-AT ?auto_17893 ?auto_17898 ) ( ON ?auto_17893 ?auto_17894 ) ( CLEAR ?auto_17893 ) ( not ( = ?auto_17892 ?auto_17894 ) ) ( not ( = ?auto_17893 ?auto_17894 ) ) ( not ( = ?auto_17891 ?auto_17894 ) ) ( TRUCK-AT ?auto_17895 ?auto_17896 ) ( SURFACE-AT ?auto_17891 ?auto_17896 ) ( CLEAR ?auto_17891 ) ( LIFTING ?auto_17897 ?auto_17892 ) ( IS-CRATE ?auto_17892 ) ( ON ?auto_17890 ?auto_17889 ) ( ON ?auto_17891 ?auto_17890 ) ( not ( = ?auto_17889 ?auto_17890 ) ) ( not ( = ?auto_17889 ?auto_17891 ) ) ( not ( = ?auto_17889 ?auto_17892 ) ) ( not ( = ?auto_17889 ?auto_17893 ) ) ( not ( = ?auto_17889 ?auto_17894 ) ) ( not ( = ?auto_17890 ?auto_17891 ) ) ( not ( = ?auto_17890 ?auto_17892 ) ) ( not ( = ?auto_17890 ?auto_17893 ) ) ( not ( = ?auto_17890 ?auto_17894 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17891 ?auto_17892 ?auto_17893 )
      ( MAKE-4CRATE-VERIFY ?auto_17889 ?auto_17890 ?auto_17891 ?auto_17892 ?auto_17893 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17900 - SURFACE
      ?auto_17901 - SURFACE
      ?auto_17902 - SURFACE
      ?auto_17903 - SURFACE
      ?auto_17904 - SURFACE
      ?auto_17905 - SURFACE
    )
    :vars
    (
      ?auto_17909 - HOIST
      ?auto_17908 - PLACE
      ?auto_17910 - PLACE
      ?auto_17911 - HOIST
      ?auto_17906 - SURFACE
      ?auto_17907 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17909 ?auto_17908 ) ( IS-CRATE ?auto_17905 ) ( not ( = ?auto_17904 ?auto_17905 ) ) ( not ( = ?auto_17903 ?auto_17904 ) ) ( not ( = ?auto_17903 ?auto_17905 ) ) ( not ( = ?auto_17910 ?auto_17908 ) ) ( HOIST-AT ?auto_17911 ?auto_17910 ) ( not ( = ?auto_17909 ?auto_17911 ) ) ( AVAILABLE ?auto_17911 ) ( SURFACE-AT ?auto_17905 ?auto_17910 ) ( ON ?auto_17905 ?auto_17906 ) ( CLEAR ?auto_17905 ) ( not ( = ?auto_17904 ?auto_17906 ) ) ( not ( = ?auto_17905 ?auto_17906 ) ) ( not ( = ?auto_17903 ?auto_17906 ) ) ( TRUCK-AT ?auto_17907 ?auto_17908 ) ( SURFACE-AT ?auto_17903 ?auto_17908 ) ( CLEAR ?auto_17903 ) ( LIFTING ?auto_17909 ?auto_17904 ) ( IS-CRATE ?auto_17904 ) ( ON ?auto_17901 ?auto_17900 ) ( ON ?auto_17902 ?auto_17901 ) ( ON ?auto_17903 ?auto_17902 ) ( not ( = ?auto_17900 ?auto_17901 ) ) ( not ( = ?auto_17900 ?auto_17902 ) ) ( not ( = ?auto_17900 ?auto_17903 ) ) ( not ( = ?auto_17900 ?auto_17904 ) ) ( not ( = ?auto_17900 ?auto_17905 ) ) ( not ( = ?auto_17900 ?auto_17906 ) ) ( not ( = ?auto_17901 ?auto_17902 ) ) ( not ( = ?auto_17901 ?auto_17903 ) ) ( not ( = ?auto_17901 ?auto_17904 ) ) ( not ( = ?auto_17901 ?auto_17905 ) ) ( not ( = ?auto_17901 ?auto_17906 ) ) ( not ( = ?auto_17902 ?auto_17903 ) ) ( not ( = ?auto_17902 ?auto_17904 ) ) ( not ( = ?auto_17902 ?auto_17905 ) ) ( not ( = ?auto_17902 ?auto_17906 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17903 ?auto_17904 ?auto_17905 )
      ( MAKE-5CRATE-VERIFY ?auto_17900 ?auto_17901 ?auto_17902 ?auto_17903 ?auto_17904 ?auto_17905 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17912 - SURFACE
      ?auto_17913 - SURFACE
    )
    :vars
    (
      ?auto_17917 - HOIST
      ?auto_17916 - PLACE
      ?auto_17920 - SURFACE
      ?auto_17918 - PLACE
      ?auto_17919 - HOIST
      ?auto_17914 - SURFACE
      ?auto_17915 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17917 ?auto_17916 ) ( IS-CRATE ?auto_17913 ) ( not ( = ?auto_17912 ?auto_17913 ) ) ( not ( = ?auto_17920 ?auto_17912 ) ) ( not ( = ?auto_17920 ?auto_17913 ) ) ( not ( = ?auto_17918 ?auto_17916 ) ) ( HOIST-AT ?auto_17919 ?auto_17918 ) ( not ( = ?auto_17917 ?auto_17919 ) ) ( AVAILABLE ?auto_17919 ) ( SURFACE-AT ?auto_17913 ?auto_17918 ) ( ON ?auto_17913 ?auto_17914 ) ( CLEAR ?auto_17913 ) ( not ( = ?auto_17912 ?auto_17914 ) ) ( not ( = ?auto_17913 ?auto_17914 ) ) ( not ( = ?auto_17920 ?auto_17914 ) ) ( TRUCK-AT ?auto_17915 ?auto_17916 ) ( SURFACE-AT ?auto_17920 ?auto_17916 ) ( CLEAR ?auto_17920 ) ( IS-CRATE ?auto_17912 ) ( AVAILABLE ?auto_17917 ) ( IN ?auto_17912 ?auto_17915 ) )
    :subtasks
    ( ( !UNLOAD ?auto_17917 ?auto_17912 ?auto_17915 ?auto_17916 )
      ( MAKE-2CRATE ?auto_17920 ?auto_17912 ?auto_17913 )
      ( MAKE-1CRATE-VERIFY ?auto_17912 ?auto_17913 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17921 - SURFACE
      ?auto_17922 - SURFACE
      ?auto_17923 - SURFACE
    )
    :vars
    (
      ?auto_17926 - HOIST
      ?auto_17928 - PLACE
      ?auto_17925 - PLACE
      ?auto_17929 - HOIST
      ?auto_17927 - SURFACE
      ?auto_17924 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17926 ?auto_17928 ) ( IS-CRATE ?auto_17923 ) ( not ( = ?auto_17922 ?auto_17923 ) ) ( not ( = ?auto_17921 ?auto_17922 ) ) ( not ( = ?auto_17921 ?auto_17923 ) ) ( not ( = ?auto_17925 ?auto_17928 ) ) ( HOIST-AT ?auto_17929 ?auto_17925 ) ( not ( = ?auto_17926 ?auto_17929 ) ) ( AVAILABLE ?auto_17929 ) ( SURFACE-AT ?auto_17923 ?auto_17925 ) ( ON ?auto_17923 ?auto_17927 ) ( CLEAR ?auto_17923 ) ( not ( = ?auto_17922 ?auto_17927 ) ) ( not ( = ?auto_17923 ?auto_17927 ) ) ( not ( = ?auto_17921 ?auto_17927 ) ) ( TRUCK-AT ?auto_17924 ?auto_17928 ) ( SURFACE-AT ?auto_17921 ?auto_17928 ) ( CLEAR ?auto_17921 ) ( IS-CRATE ?auto_17922 ) ( AVAILABLE ?auto_17926 ) ( IN ?auto_17922 ?auto_17924 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17922 ?auto_17923 )
      ( MAKE-2CRATE-VERIFY ?auto_17921 ?auto_17922 ?auto_17923 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17930 - SURFACE
      ?auto_17931 - SURFACE
      ?auto_17932 - SURFACE
      ?auto_17933 - SURFACE
    )
    :vars
    (
      ?auto_17936 - HOIST
      ?auto_17937 - PLACE
      ?auto_17939 - PLACE
      ?auto_17935 - HOIST
      ?auto_17938 - SURFACE
      ?auto_17934 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17936 ?auto_17937 ) ( IS-CRATE ?auto_17933 ) ( not ( = ?auto_17932 ?auto_17933 ) ) ( not ( = ?auto_17931 ?auto_17932 ) ) ( not ( = ?auto_17931 ?auto_17933 ) ) ( not ( = ?auto_17939 ?auto_17937 ) ) ( HOIST-AT ?auto_17935 ?auto_17939 ) ( not ( = ?auto_17936 ?auto_17935 ) ) ( AVAILABLE ?auto_17935 ) ( SURFACE-AT ?auto_17933 ?auto_17939 ) ( ON ?auto_17933 ?auto_17938 ) ( CLEAR ?auto_17933 ) ( not ( = ?auto_17932 ?auto_17938 ) ) ( not ( = ?auto_17933 ?auto_17938 ) ) ( not ( = ?auto_17931 ?auto_17938 ) ) ( TRUCK-AT ?auto_17934 ?auto_17937 ) ( SURFACE-AT ?auto_17931 ?auto_17937 ) ( CLEAR ?auto_17931 ) ( IS-CRATE ?auto_17932 ) ( AVAILABLE ?auto_17936 ) ( IN ?auto_17932 ?auto_17934 ) ( ON ?auto_17931 ?auto_17930 ) ( not ( = ?auto_17930 ?auto_17931 ) ) ( not ( = ?auto_17930 ?auto_17932 ) ) ( not ( = ?auto_17930 ?auto_17933 ) ) ( not ( = ?auto_17930 ?auto_17938 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17931 ?auto_17932 ?auto_17933 )
      ( MAKE-3CRATE-VERIFY ?auto_17930 ?auto_17931 ?auto_17932 ?auto_17933 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17940 - SURFACE
      ?auto_17941 - SURFACE
      ?auto_17942 - SURFACE
      ?auto_17943 - SURFACE
      ?auto_17944 - SURFACE
    )
    :vars
    (
      ?auto_17947 - HOIST
      ?auto_17948 - PLACE
      ?auto_17950 - PLACE
      ?auto_17946 - HOIST
      ?auto_17949 - SURFACE
      ?auto_17945 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17947 ?auto_17948 ) ( IS-CRATE ?auto_17944 ) ( not ( = ?auto_17943 ?auto_17944 ) ) ( not ( = ?auto_17942 ?auto_17943 ) ) ( not ( = ?auto_17942 ?auto_17944 ) ) ( not ( = ?auto_17950 ?auto_17948 ) ) ( HOIST-AT ?auto_17946 ?auto_17950 ) ( not ( = ?auto_17947 ?auto_17946 ) ) ( AVAILABLE ?auto_17946 ) ( SURFACE-AT ?auto_17944 ?auto_17950 ) ( ON ?auto_17944 ?auto_17949 ) ( CLEAR ?auto_17944 ) ( not ( = ?auto_17943 ?auto_17949 ) ) ( not ( = ?auto_17944 ?auto_17949 ) ) ( not ( = ?auto_17942 ?auto_17949 ) ) ( TRUCK-AT ?auto_17945 ?auto_17948 ) ( SURFACE-AT ?auto_17942 ?auto_17948 ) ( CLEAR ?auto_17942 ) ( IS-CRATE ?auto_17943 ) ( AVAILABLE ?auto_17947 ) ( IN ?auto_17943 ?auto_17945 ) ( ON ?auto_17941 ?auto_17940 ) ( ON ?auto_17942 ?auto_17941 ) ( not ( = ?auto_17940 ?auto_17941 ) ) ( not ( = ?auto_17940 ?auto_17942 ) ) ( not ( = ?auto_17940 ?auto_17943 ) ) ( not ( = ?auto_17940 ?auto_17944 ) ) ( not ( = ?auto_17940 ?auto_17949 ) ) ( not ( = ?auto_17941 ?auto_17942 ) ) ( not ( = ?auto_17941 ?auto_17943 ) ) ( not ( = ?auto_17941 ?auto_17944 ) ) ( not ( = ?auto_17941 ?auto_17949 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17942 ?auto_17943 ?auto_17944 )
      ( MAKE-4CRATE-VERIFY ?auto_17940 ?auto_17941 ?auto_17942 ?auto_17943 ?auto_17944 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17951 - SURFACE
      ?auto_17952 - SURFACE
      ?auto_17953 - SURFACE
      ?auto_17954 - SURFACE
      ?auto_17955 - SURFACE
      ?auto_17956 - SURFACE
    )
    :vars
    (
      ?auto_17959 - HOIST
      ?auto_17960 - PLACE
      ?auto_17962 - PLACE
      ?auto_17958 - HOIST
      ?auto_17961 - SURFACE
      ?auto_17957 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17959 ?auto_17960 ) ( IS-CRATE ?auto_17956 ) ( not ( = ?auto_17955 ?auto_17956 ) ) ( not ( = ?auto_17954 ?auto_17955 ) ) ( not ( = ?auto_17954 ?auto_17956 ) ) ( not ( = ?auto_17962 ?auto_17960 ) ) ( HOIST-AT ?auto_17958 ?auto_17962 ) ( not ( = ?auto_17959 ?auto_17958 ) ) ( AVAILABLE ?auto_17958 ) ( SURFACE-AT ?auto_17956 ?auto_17962 ) ( ON ?auto_17956 ?auto_17961 ) ( CLEAR ?auto_17956 ) ( not ( = ?auto_17955 ?auto_17961 ) ) ( not ( = ?auto_17956 ?auto_17961 ) ) ( not ( = ?auto_17954 ?auto_17961 ) ) ( TRUCK-AT ?auto_17957 ?auto_17960 ) ( SURFACE-AT ?auto_17954 ?auto_17960 ) ( CLEAR ?auto_17954 ) ( IS-CRATE ?auto_17955 ) ( AVAILABLE ?auto_17959 ) ( IN ?auto_17955 ?auto_17957 ) ( ON ?auto_17952 ?auto_17951 ) ( ON ?auto_17953 ?auto_17952 ) ( ON ?auto_17954 ?auto_17953 ) ( not ( = ?auto_17951 ?auto_17952 ) ) ( not ( = ?auto_17951 ?auto_17953 ) ) ( not ( = ?auto_17951 ?auto_17954 ) ) ( not ( = ?auto_17951 ?auto_17955 ) ) ( not ( = ?auto_17951 ?auto_17956 ) ) ( not ( = ?auto_17951 ?auto_17961 ) ) ( not ( = ?auto_17952 ?auto_17953 ) ) ( not ( = ?auto_17952 ?auto_17954 ) ) ( not ( = ?auto_17952 ?auto_17955 ) ) ( not ( = ?auto_17952 ?auto_17956 ) ) ( not ( = ?auto_17952 ?auto_17961 ) ) ( not ( = ?auto_17953 ?auto_17954 ) ) ( not ( = ?auto_17953 ?auto_17955 ) ) ( not ( = ?auto_17953 ?auto_17956 ) ) ( not ( = ?auto_17953 ?auto_17961 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17954 ?auto_17955 ?auto_17956 )
      ( MAKE-5CRATE-VERIFY ?auto_17951 ?auto_17952 ?auto_17953 ?auto_17954 ?auto_17955 ?auto_17956 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17963 - SURFACE
      ?auto_17964 - SURFACE
    )
    :vars
    (
      ?auto_17967 - HOIST
      ?auto_17968 - PLACE
      ?auto_17971 - SURFACE
      ?auto_17970 - PLACE
      ?auto_17966 - HOIST
      ?auto_17969 - SURFACE
      ?auto_17965 - TRUCK
      ?auto_17972 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17967 ?auto_17968 ) ( IS-CRATE ?auto_17964 ) ( not ( = ?auto_17963 ?auto_17964 ) ) ( not ( = ?auto_17971 ?auto_17963 ) ) ( not ( = ?auto_17971 ?auto_17964 ) ) ( not ( = ?auto_17970 ?auto_17968 ) ) ( HOIST-AT ?auto_17966 ?auto_17970 ) ( not ( = ?auto_17967 ?auto_17966 ) ) ( AVAILABLE ?auto_17966 ) ( SURFACE-AT ?auto_17964 ?auto_17970 ) ( ON ?auto_17964 ?auto_17969 ) ( CLEAR ?auto_17964 ) ( not ( = ?auto_17963 ?auto_17969 ) ) ( not ( = ?auto_17964 ?auto_17969 ) ) ( not ( = ?auto_17971 ?auto_17969 ) ) ( SURFACE-AT ?auto_17971 ?auto_17968 ) ( CLEAR ?auto_17971 ) ( IS-CRATE ?auto_17963 ) ( AVAILABLE ?auto_17967 ) ( IN ?auto_17963 ?auto_17965 ) ( TRUCK-AT ?auto_17965 ?auto_17972 ) ( not ( = ?auto_17972 ?auto_17968 ) ) ( not ( = ?auto_17970 ?auto_17972 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17965 ?auto_17972 ?auto_17968 )
      ( MAKE-2CRATE ?auto_17971 ?auto_17963 ?auto_17964 )
      ( MAKE-1CRATE-VERIFY ?auto_17963 ?auto_17964 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17973 - SURFACE
      ?auto_17974 - SURFACE
      ?auto_17975 - SURFACE
    )
    :vars
    (
      ?auto_17977 - HOIST
      ?auto_17978 - PLACE
      ?auto_17976 - PLACE
      ?auto_17981 - HOIST
      ?auto_17979 - SURFACE
      ?auto_17982 - TRUCK
      ?auto_17980 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17977 ?auto_17978 ) ( IS-CRATE ?auto_17975 ) ( not ( = ?auto_17974 ?auto_17975 ) ) ( not ( = ?auto_17973 ?auto_17974 ) ) ( not ( = ?auto_17973 ?auto_17975 ) ) ( not ( = ?auto_17976 ?auto_17978 ) ) ( HOIST-AT ?auto_17981 ?auto_17976 ) ( not ( = ?auto_17977 ?auto_17981 ) ) ( AVAILABLE ?auto_17981 ) ( SURFACE-AT ?auto_17975 ?auto_17976 ) ( ON ?auto_17975 ?auto_17979 ) ( CLEAR ?auto_17975 ) ( not ( = ?auto_17974 ?auto_17979 ) ) ( not ( = ?auto_17975 ?auto_17979 ) ) ( not ( = ?auto_17973 ?auto_17979 ) ) ( SURFACE-AT ?auto_17973 ?auto_17978 ) ( CLEAR ?auto_17973 ) ( IS-CRATE ?auto_17974 ) ( AVAILABLE ?auto_17977 ) ( IN ?auto_17974 ?auto_17982 ) ( TRUCK-AT ?auto_17982 ?auto_17980 ) ( not ( = ?auto_17980 ?auto_17978 ) ) ( not ( = ?auto_17976 ?auto_17980 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17974 ?auto_17975 )
      ( MAKE-2CRATE-VERIFY ?auto_17973 ?auto_17974 ?auto_17975 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17983 - SURFACE
      ?auto_17984 - SURFACE
      ?auto_17985 - SURFACE
      ?auto_17986 - SURFACE
    )
    :vars
    (
      ?auto_17993 - HOIST
      ?auto_17989 - PLACE
      ?auto_17987 - PLACE
      ?auto_17990 - HOIST
      ?auto_17988 - SURFACE
      ?auto_17991 - TRUCK
      ?auto_17992 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17993 ?auto_17989 ) ( IS-CRATE ?auto_17986 ) ( not ( = ?auto_17985 ?auto_17986 ) ) ( not ( = ?auto_17984 ?auto_17985 ) ) ( not ( = ?auto_17984 ?auto_17986 ) ) ( not ( = ?auto_17987 ?auto_17989 ) ) ( HOIST-AT ?auto_17990 ?auto_17987 ) ( not ( = ?auto_17993 ?auto_17990 ) ) ( AVAILABLE ?auto_17990 ) ( SURFACE-AT ?auto_17986 ?auto_17987 ) ( ON ?auto_17986 ?auto_17988 ) ( CLEAR ?auto_17986 ) ( not ( = ?auto_17985 ?auto_17988 ) ) ( not ( = ?auto_17986 ?auto_17988 ) ) ( not ( = ?auto_17984 ?auto_17988 ) ) ( SURFACE-AT ?auto_17984 ?auto_17989 ) ( CLEAR ?auto_17984 ) ( IS-CRATE ?auto_17985 ) ( AVAILABLE ?auto_17993 ) ( IN ?auto_17985 ?auto_17991 ) ( TRUCK-AT ?auto_17991 ?auto_17992 ) ( not ( = ?auto_17992 ?auto_17989 ) ) ( not ( = ?auto_17987 ?auto_17992 ) ) ( ON ?auto_17984 ?auto_17983 ) ( not ( = ?auto_17983 ?auto_17984 ) ) ( not ( = ?auto_17983 ?auto_17985 ) ) ( not ( = ?auto_17983 ?auto_17986 ) ) ( not ( = ?auto_17983 ?auto_17988 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17984 ?auto_17985 ?auto_17986 )
      ( MAKE-3CRATE-VERIFY ?auto_17983 ?auto_17984 ?auto_17985 ?auto_17986 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17994 - SURFACE
      ?auto_17995 - SURFACE
      ?auto_17996 - SURFACE
      ?auto_17997 - SURFACE
      ?auto_17998 - SURFACE
    )
    :vars
    (
      ?auto_18005 - HOIST
      ?auto_18001 - PLACE
      ?auto_17999 - PLACE
      ?auto_18002 - HOIST
      ?auto_18000 - SURFACE
      ?auto_18003 - TRUCK
      ?auto_18004 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18005 ?auto_18001 ) ( IS-CRATE ?auto_17998 ) ( not ( = ?auto_17997 ?auto_17998 ) ) ( not ( = ?auto_17996 ?auto_17997 ) ) ( not ( = ?auto_17996 ?auto_17998 ) ) ( not ( = ?auto_17999 ?auto_18001 ) ) ( HOIST-AT ?auto_18002 ?auto_17999 ) ( not ( = ?auto_18005 ?auto_18002 ) ) ( AVAILABLE ?auto_18002 ) ( SURFACE-AT ?auto_17998 ?auto_17999 ) ( ON ?auto_17998 ?auto_18000 ) ( CLEAR ?auto_17998 ) ( not ( = ?auto_17997 ?auto_18000 ) ) ( not ( = ?auto_17998 ?auto_18000 ) ) ( not ( = ?auto_17996 ?auto_18000 ) ) ( SURFACE-AT ?auto_17996 ?auto_18001 ) ( CLEAR ?auto_17996 ) ( IS-CRATE ?auto_17997 ) ( AVAILABLE ?auto_18005 ) ( IN ?auto_17997 ?auto_18003 ) ( TRUCK-AT ?auto_18003 ?auto_18004 ) ( not ( = ?auto_18004 ?auto_18001 ) ) ( not ( = ?auto_17999 ?auto_18004 ) ) ( ON ?auto_17995 ?auto_17994 ) ( ON ?auto_17996 ?auto_17995 ) ( not ( = ?auto_17994 ?auto_17995 ) ) ( not ( = ?auto_17994 ?auto_17996 ) ) ( not ( = ?auto_17994 ?auto_17997 ) ) ( not ( = ?auto_17994 ?auto_17998 ) ) ( not ( = ?auto_17994 ?auto_18000 ) ) ( not ( = ?auto_17995 ?auto_17996 ) ) ( not ( = ?auto_17995 ?auto_17997 ) ) ( not ( = ?auto_17995 ?auto_17998 ) ) ( not ( = ?auto_17995 ?auto_18000 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17996 ?auto_17997 ?auto_17998 )
      ( MAKE-4CRATE-VERIFY ?auto_17994 ?auto_17995 ?auto_17996 ?auto_17997 ?auto_17998 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18006 - SURFACE
      ?auto_18007 - SURFACE
      ?auto_18008 - SURFACE
      ?auto_18009 - SURFACE
      ?auto_18010 - SURFACE
      ?auto_18011 - SURFACE
    )
    :vars
    (
      ?auto_18018 - HOIST
      ?auto_18014 - PLACE
      ?auto_18012 - PLACE
      ?auto_18015 - HOIST
      ?auto_18013 - SURFACE
      ?auto_18016 - TRUCK
      ?auto_18017 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18018 ?auto_18014 ) ( IS-CRATE ?auto_18011 ) ( not ( = ?auto_18010 ?auto_18011 ) ) ( not ( = ?auto_18009 ?auto_18010 ) ) ( not ( = ?auto_18009 ?auto_18011 ) ) ( not ( = ?auto_18012 ?auto_18014 ) ) ( HOIST-AT ?auto_18015 ?auto_18012 ) ( not ( = ?auto_18018 ?auto_18015 ) ) ( AVAILABLE ?auto_18015 ) ( SURFACE-AT ?auto_18011 ?auto_18012 ) ( ON ?auto_18011 ?auto_18013 ) ( CLEAR ?auto_18011 ) ( not ( = ?auto_18010 ?auto_18013 ) ) ( not ( = ?auto_18011 ?auto_18013 ) ) ( not ( = ?auto_18009 ?auto_18013 ) ) ( SURFACE-AT ?auto_18009 ?auto_18014 ) ( CLEAR ?auto_18009 ) ( IS-CRATE ?auto_18010 ) ( AVAILABLE ?auto_18018 ) ( IN ?auto_18010 ?auto_18016 ) ( TRUCK-AT ?auto_18016 ?auto_18017 ) ( not ( = ?auto_18017 ?auto_18014 ) ) ( not ( = ?auto_18012 ?auto_18017 ) ) ( ON ?auto_18007 ?auto_18006 ) ( ON ?auto_18008 ?auto_18007 ) ( ON ?auto_18009 ?auto_18008 ) ( not ( = ?auto_18006 ?auto_18007 ) ) ( not ( = ?auto_18006 ?auto_18008 ) ) ( not ( = ?auto_18006 ?auto_18009 ) ) ( not ( = ?auto_18006 ?auto_18010 ) ) ( not ( = ?auto_18006 ?auto_18011 ) ) ( not ( = ?auto_18006 ?auto_18013 ) ) ( not ( = ?auto_18007 ?auto_18008 ) ) ( not ( = ?auto_18007 ?auto_18009 ) ) ( not ( = ?auto_18007 ?auto_18010 ) ) ( not ( = ?auto_18007 ?auto_18011 ) ) ( not ( = ?auto_18007 ?auto_18013 ) ) ( not ( = ?auto_18008 ?auto_18009 ) ) ( not ( = ?auto_18008 ?auto_18010 ) ) ( not ( = ?auto_18008 ?auto_18011 ) ) ( not ( = ?auto_18008 ?auto_18013 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18009 ?auto_18010 ?auto_18011 )
      ( MAKE-5CRATE-VERIFY ?auto_18006 ?auto_18007 ?auto_18008 ?auto_18009 ?auto_18010 ?auto_18011 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18019 - SURFACE
      ?auto_18020 - SURFACE
    )
    :vars
    (
      ?auto_18027 - HOIST
      ?auto_18023 - PLACE
      ?auto_18028 - SURFACE
      ?auto_18021 - PLACE
      ?auto_18024 - HOIST
      ?auto_18022 - SURFACE
      ?auto_18025 - TRUCK
      ?auto_18026 - PLACE
      ?auto_18029 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18027 ?auto_18023 ) ( IS-CRATE ?auto_18020 ) ( not ( = ?auto_18019 ?auto_18020 ) ) ( not ( = ?auto_18028 ?auto_18019 ) ) ( not ( = ?auto_18028 ?auto_18020 ) ) ( not ( = ?auto_18021 ?auto_18023 ) ) ( HOIST-AT ?auto_18024 ?auto_18021 ) ( not ( = ?auto_18027 ?auto_18024 ) ) ( AVAILABLE ?auto_18024 ) ( SURFACE-AT ?auto_18020 ?auto_18021 ) ( ON ?auto_18020 ?auto_18022 ) ( CLEAR ?auto_18020 ) ( not ( = ?auto_18019 ?auto_18022 ) ) ( not ( = ?auto_18020 ?auto_18022 ) ) ( not ( = ?auto_18028 ?auto_18022 ) ) ( SURFACE-AT ?auto_18028 ?auto_18023 ) ( CLEAR ?auto_18028 ) ( IS-CRATE ?auto_18019 ) ( AVAILABLE ?auto_18027 ) ( TRUCK-AT ?auto_18025 ?auto_18026 ) ( not ( = ?auto_18026 ?auto_18023 ) ) ( not ( = ?auto_18021 ?auto_18026 ) ) ( HOIST-AT ?auto_18029 ?auto_18026 ) ( LIFTING ?auto_18029 ?auto_18019 ) ( not ( = ?auto_18027 ?auto_18029 ) ) ( not ( = ?auto_18024 ?auto_18029 ) ) )
    :subtasks
    ( ( !LOAD ?auto_18029 ?auto_18019 ?auto_18025 ?auto_18026 )
      ( MAKE-2CRATE ?auto_18028 ?auto_18019 ?auto_18020 )
      ( MAKE-1CRATE-VERIFY ?auto_18019 ?auto_18020 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18030 - SURFACE
      ?auto_18031 - SURFACE
      ?auto_18032 - SURFACE
    )
    :vars
    (
      ?auto_18036 - HOIST
      ?auto_18040 - PLACE
      ?auto_18035 - PLACE
      ?auto_18037 - HOIST
      ?auto_18038 - SURFACE
      ?auto_18033 - TRUCK
      ?auto_18034 - PLACE
      ?auto_18039 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18036 ?auto_18040 ) ( IS-CRATE ?auto_18032 ) ( not ( = ?auto_18031 ?auto_18032 ) ) ( not ( = ?auto_18030 ?auto_18031 ) ) ( not ( = ?auto_18030 ?auto_18032 ) ) ( not ( = ?auto_18035 ?auto_18040 ) ) ( HOIST-AT ?auto_18037 ?auto_18035 ) ( not ( = ?auto_18036 ?auto_18037 ) ) ( AVAILABLE ?auto_18037 ) ( SURFACE-AT ?auto_18032 ?auto_18035 ) ( ON ?auto_18032 ?auto_18038 ) ( CLEAR ?auto_18032 ) ( not ( = ?auto_18031 ?auto_18038 ) ) ( not ( = ?auto_18032 ?auto_18038 ) ) ( not ( = ?auto_18030 ?auto_18038 ) ) ( SURFACE-AT ?auto_18030 ?auto_18040 ) ( CLEAR ?auto_18030 ) ( IS-CRATE ?auto_18031 ) ( AVAILABLE ?auto_18036 ) ( TRUCK-AT ?auto_18033 ?auto_18034 ) ( not ( = ?auto_18034 ?auto_18040 ) ) ( not ( = ?auto_18035 ?auto_18034 ) ) ( HOIST-AT ?auto_18039 ?auto_18034 ) ( LIFTING ?auto_18039 ?auto_18031 ) ( not ( = ?auto_18036 ?auto_18039 ) ) ( not ( = ?auto_18037 ?auto_18039 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18031 ?auto_18032 )
      ( MAKE-2CRATE-VERIFY ?auto_18030 ?auto_18031 ?auto_18032 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18041 - SURFACE
      ?auto_18042 - SURFACE
      ?auto_18043 - SURFACE
      ?auto_18044 - SURFACE
    )
    :vars
    (
      ?auto_18052 - HOIST
      ?auto_18045 - PLACE
      ?auto_18049 - PLACE
      ?auto_18048 - HOIST
      ?auto_18050 - SURFACE
      ?auto_18051 - TRUCK
      ?auto_18046 - PLACE
      ?auto_18047 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18052 ?auto_18045 ) ( IS-CRATE ?auto_18044 ) ( not ( = ?auto_18043 ?auto_18044 ) ) ( not ( = ?auto_18042 ?auto_18043 ) ) ( not ( = ?auto_18042 ?auto_18044 ) ) ( not ( = ?auto_18049 ?auto_18045 ) ) ( HOIST-AT ?auto_18048 ?auto_18049 ) ( not ( = ?auto_18052 ?auto_18048 ) ) ( AVAILABLE ?auto_18048 ) ( SURFACE-AT ?auto_18044 ?auto_18049 ) ( ON ?auto_18044 ?auto_18050 ) ( CLEAR ?auto_18044 ) ( not ( = ?auto_18043 ?auto_18050 ) ) ( not ( = ?auto_18044 ?auto_18050 ) ) ( not ( = ?auto_18042 ?auto_18050 ) ) ( SURFACE-AT ?auto_18042 ?auto_18045 ) ( CLEAR ?auto_18042 ) ( IS-CRATE ?auto_18043 ) ( AVAILABLE ?auto_18052 ) ( TRUCK-AT ?auto_18051 ?auto_18046 ) ( not ( = ?auto_18046 ?auto_18045 ) ) ( not ( = ?auto_18049 ?auto_18046 ) ) ( HOIST-AT ?auto_18047 ?auto_18046 ) ( LIFTING ?auto_18047 ?auto_18043 ) ( not ( = ?auto_18052 ?auto_18047 ) ) ( not ( = ?auto_18048 ?auto_18047 ) ) ( ON ?auto_18042 ?auto_18041 ) ( not ( = ?auto_18041 ?auto_18042 ) ) ( not ( = ?auto_18041 ?auto_18043 ) ) ( not ( = ?auto_18041 ?auto_18044 ) ) ( not ( = ?auto_18041 ?auto_18050 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18042 ?auto_18043 ?auto_18044 )
      ( MAKE-3CRATE-VERIFY ?auto_18041 ?auto_18042 ?auto_18043 ?auto_18044 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18053 - SURFACE
      ?auto_18054 - SURFACE
      ?auto_18055 - SURFACE
      ?auto_18056 - SURFACE
      ?auto_18057 - SURFACE
    )
    :vars
    (
      ?auto_18065 - HOIST
      ?auto_18058 - PLACE
      ?auto_18062 - PLACE
      ?auto_18061 - HOIST
      ?auto_18063 - SURFACE
      ?auto_18064 - TRUCK
      ?auto_18059 - PLACE
      ?auto_18060 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18065 ?auto_18058 ) ( IS-CRATE ?auto_18057 ) ( not ( = ?auto_18056 ?auto_18057 ) ) ( not ( = ?auto_18055 ?auto_18056 ) ) ( not ( = ?auto_18055 ?auto_18057 ) ) ( not ( = ?auto_18062 ?auto_18058 ) ) ( HOIST-AT ?auto_18061 ?auto_18062 ) ( not ( = ?auto_18065 ?auto_18061 ) ) ( AVAILABLE ?auto_18061 ) ( SURFACE-AT ?auto_18057 ?auto_18062 ) ( ON ?auto_18057 ?auto_18063 ) ( CLEAR ?auto_18057 ) ( not ( = ?auto_18056 ?auto_18063 ) ) ( not ( = ?auto_18057 ?auto_18063 ) ) ( not ( = ?auto_18055 ?auto_18063 ) ) ( SURFACE-AT ?auto_18055 ?auto_18058 ) ( CLEAR ?auto_18055 ) ( IS-CRATE ?auto_18056 ) ( AVAILABLE ?auto_18065 ) ( TRUCK-AT ?auto_18064 ?auto_18059 ) ( not ( = ?auto_18059 ?auto_18058 ) ) ( not ( = ?auto_18062 ?auto_18059 ) ) ( HOIST-AT ?auto_18060 ?auto_18059 ) ( LIFTING ?auto_18060 ?auto_18056 ) ( not ( = ?auto_18065 ?auto_18060 ) ) ( not ( = ?auto_18061 ?auto_18060 ) ) ( ON ?auto_18054 ?auto_18053 ) ( ON ?auto_18055 ?auto_18054 ) ( not ( = ?auto_18053 ?auto_18054 ) ) ( not ( = ?auto_18053 ?auto_18055 ) ) ( not ( = ?auto_18053 ?auto_18056 ) ) ( not ( = ?auto_18053 ?auto_18057 ) ) ( not ( = ?auto_18053 ?auto_18063 ) ) ( not ( = ?auto_18054 ?auto_18055 ) ) ( not ( = ?auto_18054 ?auto_18056 ) ) ( not ( = ?auto_18054 ?auto_18057 ) ) ( not ( = ?auto_18054 ?auto_18063 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18055 ?auto_18056 ?auto_18057 )
      ( MAKE-4CRATE-VERIFY ?auto_18053 ?auto_18054 ?auto_18055 ?auto_18056 ?auto_18057 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18066 - SURFACE
      ?auto_18067 - SURFACE
      ?auto_18068 - SURFACE
      ?auto_18069 - SURFACE
      ?auto_18070 - SURFACE
      ?auto_18071 - SURFACE
    )
    :vars
    (
      ?auto_18079 - HOIST
      ?auto_18072 - PLACE
      ?auto_18076 - PLACE
      ?auto_18075 - HOIST
      ?auto_18077 - SURFACE
      ?auto_18078 - TRUCK
      ?auto_18073 - PLACE
      ?auto_18074 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18079 ?auto_18072 ) ( IS-CRATE ?auto_18071 ) ( not ( = ?auto_18070 ?auto_18071 ) ) ( not ( = ?auto_18069 ?auto_18070 ) ) ( not ( = ?auto_18069 ?auto_18071 ) ) ( not ( = ?auto_18076 ?auto_18072 ) ) ( HOIST-AT ?auto_18075 ?auto_18076 ) ( not ( = ?auto_18079 ?auto_18075 ) ) ( AVAILABLE ?auto_18075 ) ( SURFACE-AT ?auto_18071 ?auto_18076 ) ( ON ?auto_18071 ?auto_18077 ) ( CLEAR ?auto_18071 ) ( not ( = ?auto_18070 ?auto_18077 ) ) ( not ( = ?auto_18071 ?auto_18077 ) ) ( not ( = ?auto_18069 ?auto_18077 ) ) ( SURFACE-AT ?auto_18069 ?auto_18072 ) ( CLEAR ?auto_18069 ) ( IS-CRATE ?auto_18070 ) ( AVAILABLE ?auto_18079 ) ( TRUCK-AT ?auto_18078 ?auto_18073 ) ( not ( = ?auto_18073 ?auto_18072 ) ) ( not ( = ?auto_18076 ?auto_18073 ) ) ( HOIST-AT ?auto_18074 ?auto_18073 ) ( LIFTING ?auto_18074 ?auto_18070 ) ( not ( = ?auto_18079 ?auto_18074 ) ) ( not ( = ?auto_18075 ?auto_18074 ) ) ( ON ?auto_18067 ?auto_18066 ) ( ON ?auto_18068 ?auto_18067 ) ( ON ?auto_18069 ?auto_18068 ) ( not ( = ?auto_18066 ?auto_18067 ) ) ( not ( = ?auto_18066 ?auto_18068 ) ) ( not ( = ?auto_18066 ?auto_18069 ) ) ( not ( = ?auto_18066 ?auto_18070 ) ) ( not ( = ?auto_18066 ?auto_18071 ) ) ( not ( = ?auto_18066 ?auto_18077 ) ) ( not ( = ?auto_18067 ?auto_18068 ) ) ( not ( = ?auto_18067 ?auto_18069 ) ) ( not ( = ?auto_18067 ?auto_18070 ) ) ( not ( = ?auto_18067 ?auto_18071 ) ) ( not ( = ?auto_18067 ?auto_18077 ) ) ( not ( = ?auto_18068 ?auto_18069 ) ) ( not ( = ?auto_18068 ?auto_18070 ) ) ( not ( = ?auto_18068 ?auto_18071 ) ) ( not ( = ?auto_18068 ?auto_18077 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18069 ?auto_18070 ?auto_18071 )
      ( MAKE-5CRATE-VERIFY ?auto_18066 ?auto_18067 ?auto_18068 ?auto_18069 ?auto_18070 ?auto_18071 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18080 - SURFACE
      ?auto_18081 - SURFACE
    )
    :vars
    (
      ?auto_18089 - HOIST
      ?auto_18082 - PLACE
      ?auto_18090 - SURFACE
      ?auto_18086 - PLACE
      ?auto_18085 - HOIST
      ?auto_18087 - SURFACE
      ?auto_18088 - TRUCK
      ?auto_18083 - PLACE
      ?auto_18084 - HOIST
      ?auto_18091 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18089 ?auto_18082 ) ( IS-CRATE ?auto_18081 ) ( not ( = ?auto_18080 ?auto_18081 ) ) ( not ( = ?auto_18090 ?auto_18080 ) ) ( not ( = ?auto_18090 ?auto_18081 ) ) ( not ( = ?auto_18086 ?auto_18082 ) ) ( HOIST-AT ?auto_18085 ?auto_18086 ) ( not ( = ?auto_18089 ?auto_18085 ) ) ( AVAILABLE ?auto_18085 ) ( SURFACE-AT ?auto_18081 ?auto_18086 ) ( ON ?auto_18081 ?auto_18087 ) ( CLEAR ?auto_18081 ) ( not ( = ?auto_18080 ?auto_18087 ) ) ( not ( = ?auto_18081 ?auto_18087 ) ) ( not ( = ?auto_18090 ?auto_18087 ) ) ( SURFACE-AT ?auto_18090 ?auto_18082 ) ( CLEAR ?auto_18090 ) ( IS-CRATE ?auto_18080 ) ( AVAILABLE ?auto_18089 ) ( TRUCK-AT ?auto_18088 ?auto_18083 ) ( not ( = ?auto_18083 ?auto_18082 ) ) ( not ( = ?auto_18086 ?auto_18083 ) ) ( HOIST-AT ?auto_18084 ?auto_18083 ) ( not ( = ?auto_18089 ?auto_18084 ) ) ( not ( = ?auto_18085 ?auto_18084 ) ) ( AVAILABLE ?auto_18084 ) ( SURFACE-AT ?auto_18080 ?auto_18083 ) ( ON ?auto_18080 ?auto_18091 ) ( CLEAR ?auto_18080 ) ( not ( = ?auto_18080 ?auto_18091 ) ) ( not ( = ?auto_18081 ?auto_18091 ) ) ( not ( = ?auto_18090 ?auto_18091 ) ) ( not ( = ?auto_18087 ?auto_18091 ) ) )
    :subtasks
    ( ( !LIFT ?auto_18084 ?auto_18080 ?auto_18091 ?auto_18083 )
      ( MAKE-2CRATE ?auto_18090 ?auto_18080 ?auto_18081 )
      ( MAKE-1CRATE-VERIFY ?auto_18080 ?auto_18081 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18092 - SURFACE
      ?auto_18093 - SURFACE
      ?auto_18094 - SURFACE
    )
    :vars
    (
      ?auto_18100 - HOIST
      ?auto_18099 - PLACE
      ?auto_18102 - PLACE
      ?auto_18097 - HOIST
      ?auto_18096 - SURFACE
      ?auto_18098 - TRUCK
      ?auto_18101 - PLACE
      ?auto_18095 - HOIST
      ?auto_18103 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18100 ?auto_18099 ) ( IS-CRATE ?auto_18094 ) ( not ( = ?auto_18093 ?auto_18094 ) ) ( not ( = ?auto_18092 ?auto_18093 ) ) ( not ( = ?auto_18092 ?auto_18094 ) ) ( not ( = ?auto_18102 ?auto_18099 ) ) ( HOIST-AT ?auto_18097 ?auto_18102 ) ( not ( = ?auto_18100 ?auto_18097 ) ) ( AVAILABLE ?auto_18097 ) ( SURFACE-AT ?auto_18094 ?auto_18102 ) ( ON ?auto_18094 ?auto_18096 ) ( CLEAR ?auto_18094 ) ( not ( = ?auto_18093 ?auto_18096 ) ) ( not ( = ?auto_18094 ?auto_18096 ) ) ( not ( = ?auto_18092 ?auto_18096 ) ) ( SURFACE-AT ?auto_18092 ?auto_18099 ) ( CLEAR ?auto_18092 ) ( IS-CRATE ?auto_18093 ) ( AVAILABLE ?auto_18100 ) ( TRUCK-AT ?auto_18098 ?auto_18101 ) ( not ( = ?auto_18101 ?auto_18099 ) ) ( not ( = ?auto_18102 ?auto_18101 ) ) ( HOIST-AT ?auto_18095 ?auto_18101 ) ( not ( = ?auto_18100 ?auto_18095 ) ) ( not ( = ?auto_18097 ?auto_18095 ) ) ( AVAILABLE ?auto_18095 ) ( SURFACE-AT ?auto_18093 ?auto_18101 ) ( ON ?auto_18093 ?auto_18103 ) ( CLEAR ?auto_18093 ) ( not ( = ?auto_18093 ?auto_18103 ) ) ( not ( = ?auto_18094 ?auto_18103 ) ) ( not ( = ?auto_18092 ?auto_18103 ) ) ( not ( = ?auto_18096 ?auto_18103 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18093 ?auto_18094 )
      ( MAKE-2CRATE-VERIFY ?auto_18092 ?auto_18093 ?auto_18094 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18104 - SURFACE
      ?auto_18105 - SURFACE
      ?auto_18106 - SURFACE
      ?auto_18107 - SURFACE
    )
    :vars
    (
      ?auto_18112 - HOIST
      ?auto_18115 - PLACE
      ?auto_18111 - PLACE
      ?auto_18109 - HOIST
      ?auto_18116 - SURFACE
      ?auto_18113 - TRUCK
      ?auto_18114 - PLACE
      ?auto_18108 - HOIST
      ?auto_18110 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18112 ?auto_18115 ) ( IS-CRATE ?auto_18107 ) ( not ( = ?auto_18106 ?auto_18107 ) ) ( not ( = ?auto_18105 ?auto_18106 ) ) ( not ( = ?auto_18105 ?auto_18107 ) ) ( not ( = ?auto_18111 ?auto_18115 ) ) ( HOIST-AT ?auto_18109 ?auto_18111 ) ( not ( = ?auto_18112 ?auto_18109 ) ) ( AVAILABLE ?auto_18109 ) ( SURFACE-AT ?auto_18107 ?auto_18111 ) ( ON ?auto_18107 ?auto_18116 ) ( CLEAR ?auto_18107 ) ( not ( = ?auto_18106 ?auto_18116 ) ) ( not ( = ?auto_18107 ?auto_18116 ) ) ( not ( = ?auto_18105 ?auto_18116 ) ) ( SURFACE-AT ?auto_18105 ?auto_18115 ) ( CLEAR ?auto_18105 ) ( IS-CRATE ?auto_18106 ) ( AVAILABLE ?auto_18112 ) ( TRUCK-AT ?auto_18113 ?auto_18114 ) ( not ( = ?auto_18114 ?auto_18115 ) ) ( not ( = ?auto_18111 ?auto_18114 ) ) ( HOIST-AT ?auto_18108 ?auto_18114 ) ( not ( = ?auto_18112 ?auto_18108 ) ) ( not ( = ?auto_18109 ?auto_18108 ) ) ( AVAILABLE ?auto_18108 ) ( SURFACE-AT ?auto_18106 ?auto_18114 ) ( ON ?auto_18106 ?auto_18110 ) ( CLEAR ?auto_18106 ) ( not ( = ?auto_18106 ?auto_18110 ) ) ( not ( = ?auto_18107 ?auto_18110 ) ) ( not ( = ?auto_18105 ?auto_18110 ) ) ( not ( = ?auto_18116 ?auto_18110 ) ) ( ON ?auto_18105 ?auto_18104 ) ( not ( = ?auto_18104 ?auto_18105 ) ) ( not ( = ?auto_18104 ?auto_18106 ) ) ( not ( = ?auto_18104 ?auto_18107 ) ) ( not ( = ?auto_18104 ?auto_18116 ) ) ( not ( = ?auto_18104 ?auto_18110 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18105 ?auto_18106 ?auto_18107 )
      ( MAKE-3CRATE-VERIFY ?auto_18104 ?auto_18105 ?auto_18106 ?auto_18107 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18117 - SURFACE
      ?auto_18118 - SURFACE
      ?auto_18119 - SURFACE
      ?auto_18120 - SURFACE
      ?auto_18121 - SURFACE
    )
    :vars
    (
      ?auto_18126 - HOIST
      ?auto_18129 - PLACE
      ?auto_18125 - PLACE
      ?auto_18123 - HOIST
      ?auto_18130 - SURFACE
      ?auto_18127 - TRUCK
      ?auto_18128 - PLACE
      ?auto_18122 - HOIST
      ?auto_18124 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18126 ?auto_18129 ) ( IS-CRATE ?auto_18121 ) ( not ( = ?auto_18120 ?auto_18121 ) ) ( not ( = ?auto_18119 ?auto_18120 ) ) ( not ( = ?auto_18119 ?auto_18121 ) ) ( not ( = ?auto_18125 ?auto_18129 ) ) ( HOIST-AT ?auto_18123 ?auto_18125 ) ( not ( = ?auto_18126 ?auto_18123 ) ) ( AVAILABLE ?auto_18123 ) ( SURFACE-AT ?auto_18121 ?auto_18125 ) ( ON ?auto_18121 ?auto_18130 ) ( CLEAR ?auto_18121 ) ( not ( = ?auto_18120 ?auto_18130 ) ) ( not ( = ?auto_18121 ?auto_18130 ) ) ( not ( = ?auto_18119 ?auto_18130 ) ) ( SURFACE-AT ?auto_18119 ?auto_18129 ) ( CLEAR ?auto_18119 ) ( IS-CRATE ?auto_18120 ) ( AVAILABLE ?auto_18126 ) ( TRUCK-AT ?auto_18127 ?auto_18128 ) ( not ( = ?auto_18128 ?auto_18129 ) ) ( not ( = ?auto_18125 ?auto_18128 ) ) ( HOIST-AT ?auto_18122 ?auto_18128 ) ( not ( = ?auto_18126 ?auto_18122 ) ) ( not ( = ?auto_18123 ?auto_18122 ) ) ( AVAILABLE ?auto_18122 ) ( SURFACE-AT ?auto_18120 ?auto_18128 ) ( ON ?auto_18120 ?auto_18124 ) ( CLEAR ?auto_18120 ) ( not ( = ?auto_18120 ?auto_18124 ) ) ( not ( = ?auto_18121 ?auto_18124 ) ) ( not ( = ?auto_18119 ?auto_18124 ) ) ( not ( = ?auto_18130 ?auto_18124 ) ) ( ON ?auto_18118 ?auto_18117 ) ( ON ?auto_18119 ?auto_18118 ) ( not ( = ?auto_18117 ?auto_18118 ) ) ( not ( = ?auto_18117 ?auto_18119 ) ) ( not ( = ?auto_18117 ?auto_18120 ) ) ( not ( = ?auto_18117 ?auto_18121 ) ) ( not ( = ?auto_18117 ?auto_18130 ) ) ( not ( = ?auto_18117 ?auto_18124 ) ) ( not ( = ?auto_18118 ?auto_18119 ) ) ( not ( = ?auto_18118 ?auto_18120 ) ) ( not ( = ?auto_18118 ?auto_18121 ) ) ( not ( = ?auto_18118 ?auto_18130 ) ) ( not ( = ?auto_18118 ?auto_18124 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18119 ?auto_18120 ?auto_18121 )
      ( MAKE-4CRATE-VERIFY ?auto_18117 ?auto_18118 ?auto_18119 ?auto_18120 ?auto_18121 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18131 - SURFACE
      ?auto_18132 - SURFACE
      ?auto_18133 - SURFACE
      ?auto_18134 - SURFACE
      ?auto_18135 - SURFACE
      ?auto_18136 - SURFACE
    )
    :vars
    (
      ?auto_18141 - HOIST
      ?auto_18144 - PLACE
      ?auto_18140 - PLACE
      ?auto_18138 - HOIST
      ?auto_18145 - SURFACE
      ?auto_18142 - TRUCK
      ?auto_18143 - PLACE
      ?auto_18137 - HOIST
      ?auto_18139 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18141 ?auto_18144 ) ( IS-CRATE ?auto_18136 ) ( not ( = ?auto_18135 ?auto_18136 ) ) ( not ( = ?auto_18134 ?auto_18135 ) ) ( not ( = ?auto_18134 ?auto_18136 ) ) ( not ( = ?auto_18140 ?auto_18144 ) ) ( HOIST-AT ?auto_18138 ?auto_18140 ) ( not ( = ?auto_18141 ?auto_18138 ) ) ( AVAILABLE ?auto_18138 ) ( SURFACE-AT ?auto_18136 ?auto_18140 ) ( ON ?auto_18136 ?auto_18145 ) ( CLEAR ?auto_18136 ) ( not ( = ?auto_18135 ?auto_18145 ) ) ( not ( = ?auto_18136 ?auto_18145 ) ) ( not ( = ?auto_18134 ?auto_18145 ) ) ( SURFACE-AT ?auto_18134 ?auto_18144 ) ( CLEAR ?auto_18134 ) ( IS-CRATE ?auto_18135 ) ( AVAILABLE ?auto_18141 ) ( TRUCK-AT ?auto_18142 ?auto_18143 ) ( not ( = ?auto_18143 ?auto_18144 ) ) ( not ( = ?auto_18140 ?auto_18143 ) ) ( HOIST-AT ?auto_18137 ?auto_18143 ) ( not ( = ?auto_18141 ?auto_18137 ) ) ( not ( = ?auto_18138 ?auto_18137 ) ) ( AVAILABLE ?auto_18137 ) ( SURFACE-AT ?auto_18135 ?auto_18143 ) ( ON ?auto_18135 ?auto_18139 ) ( CLEAR ?auto_18135 ) ( not ( = ?auto_18135 ?auto_18139 ) ) ( not ( = ?auto_18136 ?auto_18139 ) ) ( not ( = ?auto_18134 ?auto_18139 ) ) ( not ( = ?auto_18145 ?auto_18139 ) ) ( ON ?auto_18132 ?auto_18131 ) ( ON ?auto_18133 ?auto_18132 ) ( ON ?auto_18134 ?auto_18133 ) ( not ( = ?auto_18131 ?auto_18132 ) ) ( not ( = ?auto_18131 ?auto_18133 ) ) ( not ( = ?auto_18131 ?auto_18134 ) ) ( not ( = ?auto_18131 ?auto_18135 ) ) ( not ( = ?auto_18131 ?auto_18136 ) ) ( not ( = ?auto_18131 ?auto_18145 ) ) ( not ( = ?auto_18131 ?auto_18139 ) ) ( not ( = ?auto_18132 ?auto_18133 ) ) ( not ( = ?auto_18132 ?auto_18134 ) ) ( not ( = ?auto_18132 ?auto_18135 ) ) ( not ( = ?auto_18132 ?auto_18136 ) ) ( not ( = ?auto_18132 ?auto_18145 ) ) ( not ( = ?auto_18132 ?auto_18139 ) ) ( not ( = ?auto_18133 ?auto_18134 ) ) ( not ( = ?auto_18133 ?auto_18135 ) ) ( not ( = ?auto_18133 ?auto_18136 ) ) ( not ( = ?auto_18133 ?auto_18145 ) ) ( not ( = ?auto_18133 ?auto_18139 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18134 ?auto_18135 ?auto_18136 )
      ( MAKE-5CRATE-VERIFY ?auto_18131 ?auto_18132 ?auto_18133 ?auto_18134 ?auto_18135 ?auto_18136 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18146 - SURFACE
      ?auto_18147 - SURFACE
    )
    :vars
    (
      ?auto_18152 - HOIST
      ?auto_18155 - PLACE
      ?auto_18157 - SURFACE
      ?auto_18151 - PLACE
      ?auto_18149 - HOIST
      ?auto_18156 - SURFACE
      ?auto_18154 - PLACE
      ?auto_18148 - HOIST
      ?auto_18150 - SURFACE
      ?auto_18153 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18152 ?auto_18155 ) ( IS-CRATE ?auto_18147 ) ( not ( = ?auto_18146 ?auto_18147 ) ) ( not ( = ?auto_18157 ?auto_18146 ) ) ( not ( = ?auto_18157 ?auto_18147 ) ) ( not ( = ?auto_18151 ?auto_18155 ) ) ( HOIST-AT ?auto_18149 ?auto_18151 ) ( not ( = ?auto_18152 ?auto_18149 ) ) ( AVAILABLE ?auto_18149 ) ( SURFACE-AT ?auto_18147 ?auto_18151 ) ( ON ?auto_18147 ?auto_18156 ) ( CLEAR ?auto_18147 ) ( not ( = ?auto_18146 ?auto_18156 ) ) ( not ( = ?auto_18147 ?auto_18156 ) ) ( not ( = ?auto_18157 ?auto_18156 ) ) ( SURFACE-AT ?auto_18157 ?auto_18155 ) ( CLEAR ?auto_18157 ) ( IS-CRATE ?auto_18146 ) ( AVAILABLE ?auto_18152 ) ( not ( = ?auto_18154 ?auto_18155 ) ) ( not ( = ?auto_18151 ?auto_18154 ) ) ( HOIST-AT ?auto_18148 ?auto_18154 ) ( not ( = ?auto_18152 ?auto_18148 ) ) ( not ( = ?auto_18149 ?auto_18148 ) ) ( AVAILABLE ?auto_18148 ) ( SURFACE-AT ?auto_18146 ?auto_18154 ) ( ON ?auto_18146 ?auto_18150 ) ( CLEAR ?auto_18146 ) ( not ( = ?auto_18146 ?auto_18150 ) ) ( not ( = ?auto_18147 ?auto_18150 ) ) ( not ( = ?auto_18157 ?auto_18150 ) ) ( not ( = ?auto_18156 ?auto_18150 ) ) ( TRUCK-AT ?auto_18153 ?auto_18155 ) )
    :subtasks
    ( ( !DRIVE ?auto_18153 ?auto_18155 ?auto_18154 )
      ( MAKE-2CRATE ?auto_18157 ?auto_18146 ?auto_18147 )
      ( MAKE-1CRATE-VERIFY ?auto_18146 ?auto_18147 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18158 - SURFACE
      ?auto_18159 - SURFACE
      ?auto_18160 - SURFACE
    )
    :vars
    (
      ?auto_18168 - HOIST
      ?auto_18165 - PLACE
      ?auto_18163 - PLACE
      ?auto_18166 - HOIST
      ?auto_18167 - SURFACE
      ?auto_18164 - PLACE
      ?auto_18161 - HOIST
      ?auto_18162 - SURFACE
      ?auto_18169 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18168 ?auto_18165 ) ( IS-CRATE ?auto_18160 ) ( not ( = ?auto_18159 ?auto_18160 ) ) ( not ( = ?auto_18158 ?auto_18159 ) ) ( not ( = ?auto_18158 ?auto_18160 ) ) ( not ( = ?auto_18163 ?auto_18165 ) ) ( HOIST-AT ?auto_18166 ?auto_18163 ) ( not ( = ?auto_18168 ?auto_18166 ) ) ( AVAILABLE ?auto_18166 ) ( SURFACE-AT ?auto_18160 ?auto_18163 ) ( ON ?auto_18160 ?auto_18167 ) ( CLEAR ?auto_18160 ) ( not ( = ?auto_18159 ?auto_18167 ) ) ( not ( = ?auto_18160 ?auto_18167 ) ) ( not ( = ?auto_18158 ?auto_18167 ) ) ( SURFACE-AT ?auto_18158 ?auto_18165 ) ( CLEAR ?auto_18158 ) ( IS-CRATE ?auto_18159 ) ( AVAILABLE ?auto_18168 ) ( not ( = ?auto_18164 ?auto_18165 ) ) ( not ( = ?auto_18163 ?auto_18164 ) ) ( HOIST-AT ?auto_18161 ?auto_18164 ) ( not ( = ?auto_18168 ?auto_18161 ) ) ( not ( = ?auto_18166 ?auto_18161 ) ) ( AVAILABLE ?auto_18161 ) ( SURFACE-AT ?auto_18159 ?auto_18164 ) ( ON ?auto_18159 ?auto_18162 ) ( CLEAR ?auto_18159 ) ( not ( = ?auto_18159 ?auto_18162 ) ) ( not ( = ?auto_18160 ?auto_18162 ) ) ( not ( = ?auto_18158 ?auto_18162 ) ) ( not ( = ?auto_18167 ?auto_18162 ) ) ( TRUCK-AT ?auto_18169 ?auto_18165 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18159 ?auto_18160 )
      ( MAKE-2CRATE-VERIFY ?auto_18158 ?auto_18159 ?auto_18160 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18170 - SURFACE
      ?auto_18171 - SURFACE
      ?auto_18172 - SURFACE
      ?auto_18173 - SURFACE
    )
    :vars
    (
      ?auto_18180 - HOIST
      ?auto_18178 - PLACE
      ?auto_18179 - PLACE
      ?auto_18182 - HOIST
      ?auto_18177 - SURFACE
      ?auto_18175 - PLACE
      ?auto_18174 - HOIST
      ?auto_18176 - SURFACE
      ?auto_18181 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18180 ?auto_18178 ) ( IS-CRATE ?auto_18173 ) ( not ( = ?auto_18172 ?auto_18173 ) ) ( not ( = ?auto_18171 ?auto_18172 ) ) ( not ( = ?auto_18171 ?auto_18173 ) ) ( not ( = ?auto_18179 ?auto_18178 ) ) ( HOIST-AT ?auto_18182 ?auto_18179 ) ( not ( = ?auto_18180 ?auto_18182 ) ) ( AVAILABLE ?auto_18182 ) ( SURFACE-AT ?auto_18173 ?auto_18179 ) ( ON ?auto_18173 ?auto_18177 ) ( CLEAR ?auto_18173 ) ( not ( = ?auto_18172 ?auto_18177 ) ) ( not ( = ?auto_18173 ?auto_18177 ) ) ( not ( = ?auto_18171 ?auto_18177 ) ) ( SURFACE-AT ?auto_18171 ?auto_18178 ) ( CLEAR ?auto_18171 ) ( IS-CRATE ?auto_18172 ) ( AVAILABLE ?auto_18180 ) ( not ( = ?auto_18175 ?auto_18178 ) ) ( not ( = ?auto_18179 ?auto_18175 ) ) ( HOIST-AT ?auto_18174 ?auto_18175 ) ( not ( = ?auto_18180 ?auto_18174 ) ) ( not ( = ?auto_18182 ?auto_18174 ) ) ( AVAILABLE ?auto_18174 ) ( SURFACE-AT ?auto_18172 ?auto_18175 ) ( ON ?auto_18172 ?auto_18176 ) ( CLEAR ?auto_18172 ) ( not ( = ?auto_18172 ?auto_18176 ) ) ( not ( = ?auto_18173 ?auto_18176 ) ) ( not ( = ?auto_18171 ?auto_18176 ) ) ( not ( = ?auto_18177 ?auto_18176 ) ) ( TRUCK-AT ?auto_18181 ?auto_18178 ) ( ON ?auto_18171 ?auto_18170 ) ( not ( = ?auto_18170 ?auto_18171 ) ) ( not ( = ?auto_18170 ?auto_18172 ) ) ( not ( = ?auto_18170 ?auto_18173 ) ) ( not ( = ?auto_18170 ?auto_18177 ) ) ( not ( = ?auto_18170 ?auto_18176 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18171 ?auto_18172 ?auto_18173 )
      ( MAKE-3CRATE-VERIFY ?auto_18170 ?auto_18171 ?auto_18172 ?auto_18173 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18183 - SURFACE
      ?auto_18184 - SURFACE
      ?auto_18185 - SURFACE
      ?auto_18186 - SURFACE
      ?auto_18187 - SURFACE
    )
    :vars
    (
      ?auto_18194 - HOIST
      ?auto_18192 - PLACE
      ?auto_18193 - PLACE
      ?auto_18196 - HOIST
      ?auto_18191 - SURFACE
      ?auto_18189 - PLACE
      ?auto_18188 - HOIST
      ?auto_18190 - SURFACE
      ?auto_18195 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18194 ?auto_18192 ) ( IS-CRATE ?auto_18187 ) ( not ( = ?auto_18186 ?auto_18187 ) ) ( not ( = ?auto_18185 ?auto_18186 ) ) ( not ( = ?auto_18185 ?auto_18187 ) ) ( not ( = ?auto_18193 ?auto_18192 ) ) ( HOIST-AT ?auto_18196 ?auto_18193 ) ( not ( = ?auto_18194 ?auto_18196 ) ) ( AVAILABLE ?auto_18196 ) ( SURFACE-AT ?auto_18187 ?auto_18193 ) ( ON ?auto_18187 ?auto_18191 ) ( CLEAR ?auto_18187 ) ( not ( = ?auto_18186 ?auto_18191 ) ) ( not ( = ?auto_18187 ?auto_18191 ) ) ( not ( = ?auto_18185 ?auto_18191 ) ) ( SURFACE-AT ?auto_18185 ?auto_18192 ) ( CLEAR ?auto_18185 ) ( IS-CRATE ?auto_18186 ) ( AVAILABLE ?auto_18194 ) ( not ( = ?auto_18189 ?auto_18192 ) ) ( not ( = ?auto_18193 ?auto_18189 ) ) ( HOIST-AT ?auto_18188 ?auto_18189 ) ( not ( = ?auto_18194 ?auto_18188 ) ) ( not ( = ?auto_18196 ?auto_18188 ) ) ( AVAILABLE ?auto_18188 ) ( SURFACE-AT ?auto_18186 ?auto_18189 ) ( ON ?auto_18186 ?auto_18190 ) ( CLEAR ?auto_18186 ) ( not ( = ?auto_18186 ?auto_18190 ) ) ( not ( = ?auto_18187 ?auto_18190 ) ) ( not ( = ?auto_18185 ?auto_18190 ) ) ( not ( = ?auto_18191 ?auto_18190 ) ) ( TRUCK-AT ?auto_18195 ?auto_18192 ) ( ON ?auto_18184 ?auto_18183 ) ( ON ?auto_18185 ?auto_18184 ) ( not ( = ?auto_18183 ?auto_18184 ) ) ( not ( = ?auto_18183 ?auto_18185 ) ) ( not ( = ?auto_18183 ?auto_18186 ) ) ( not ( = ?auto_18183 ?auto_18187 ) ) ( not ( = ?auto_18183 ?auto_18191 ) ) ( not ( = ?auto_18183 ?auto_18190 ) ) ( not ( = ?auto_18184 ?auto_18185 ) ) ( not ( = ?auto_18184 ?auto_18186 ) ) ( not ( = ?auto_18184 ?auto_18187 ) ) ( not ( = ?auto_18184 ?auto_18191 ) ) ( not ( = ?auto_18184 ?auto_18190 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18185 ?auto_18186 ?auto_18187 )
      ( MAKE-4CRATE-VERIFY ?auto_18183 ?auto_18184 ?auto_18185 ?auto_18186 ?auto_18187 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18197 - SURFACE
      ?auto_18198 - SURFACE
      ?auto_18199 - SURFACE
      ?auto_18200 - SURFACE
      ?auto_18201 - SURFACE
      ?auto_18202 - SURFACE
    )
    :vars
    (
      ?auto_18209 - HOIST
      ?auto_18207 - PLACE
      ?auto_18208 - PLACE
      ?auto_18211 - HOIST
      ?auto_18206 - SURFACE
      ?auto_18204 - PLACE
      ?auto_18203 - HOIST
      ?auto_18205 - SURFACE
      ?auto_18210 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18209 ?auto_18207 ) ( IS-CRATE ?auto_18202 ) ( not ( = ?auto_18201 ?auto_18202 ) ) ( not ( = ?auto_18200 ?auto_18201 ) ) ( not ( = ?auto_18200 ?auto_18202 ) ) ( not ( = ?auto_18208 ?auto_18207 ) ) ( HOIST-AT ?auto_18211 ?auto_18208 ) ( not ( = ?auto_18209 ?auto_18211 ) ) ( AVAILABLE ?auto_18211 ) ( SURFACE-AT ?auto_18202 ?auto_18208 ) ( ON ?auto_18202 ?auto_18206 ) ( CLEAR ?auto_18202 ) ( not ( = ?auto_18201 ?auto_18206 ) ) ( not ( = ?auto_18202 ?auto_18206 ) ) ( not ( = ?auto_18200 ?auto_18206 ) ) ( SURFACE-AT ?auto_18200 ?auto_18207 ) ( CLEAR ?auto_18200 ) ( IS-CRATE ?auto_18201 ) ( AVAILABLE ?auto_18209 ) ( not ( = ?auto_18204 ?auto_18207 ) ) ( not ( = ?auto_18208 ?auto_18204 ) ) ( HOIST-AT ?auto_18203 ?auto_18204 ) ( not ( = ?auto_18209 ?auto_18203 ) ) ( not ( = ?auto_18211 ?auto_18203 ) ) ( AVAILABLE ?auto_18203 ) ( SURFACE-AT ?auto_18201 ?auto_18204 ) ( ON ?auto_18201 ?auto_18205 ) ( CLEAR ?auto_18201 ) ( not ( = ?auto_18201 ?auto_18205 ) ) ( not ( = ?auto_18202 ?auto_18205 ) ) ( not ( = ?auto_18200 ?auto_18205 ) ) ( not ( = ?auto_18206 ?auto_18205 ) ) ( TRUCK-AT ?auto_18210 ?auto_18207 ) ( ON ?auto_18198 ?auto_18197 ) ( ON ?auto_18199 ?auto_18198 ) ( ON ?auto_18200 ?auto_18199 ) ( not ( = ?auto_18197 ?auto_18198 ) ) ( not ( = ?auto_18197 ?auto_18199 ) ) ( not ( = ?auto_18197 ?auto_18200 ) ) ( not ( = ?auto_18197 ?auto_18201 ) ) ( not ( = ?auto_18197 ?auto_18202 ) ) ( not ( = ?auto_18197 ?auto_18206 ) ) ( not ( = ?auto_18197 ?auto_18205 ) ) ( not ( = ?auto_18198 ?auto_18199 ) ) ( not ( = ?auto_18198 ?auto_18200 ) ) ( not ( = ?auto_18198 ?auto_18201 ) ) ( not ( = ?auto_18198 ?auto_18202 ) ) ( not ( = ?auto_18198 ?auto_18206 ) ) ( not ( = ?auto_18198 ?auto_18205 ) ) ( not ( = ?auto_18199 ?auto_18200 ) ) ( not ( = ?auto_18199 ?auto_18201 ) ) ( not ( = ?auto_18199 ?auto_18202 ) ) ( not ( = ?auto_18199 ?auto_18206 ) ) ( not ( = ?auto_18199 ?auto_18205 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18200 ?auto_18201 ?auto_18202 )
      ( MAKE-5CRATE-VERIFY ?auto_18197 ?auto_18198 ?auto_18199 ?auto_18200 ?auto_18201 ?auto_18202 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18212 - SURFACE
      ?auto_18213 - SURFACE
    )
    :vars
    (
      ?auto_18220 - HOIST
      ?auto_18218 - PLACE
      ?auto_18223 - SURFACE
      ?auto_18219 - PLACE
      ?auto_18222 - HOIST
      ?auto_18217 - SURFACE
      ?auto_18215 - PLACE
      ?auto_18214 - HOIST
      ?auto_18216 - SURFACE
      ?auto_18221 - TRUCK
      ?auto_18224 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18220 ?auto_18218 ) ( IS-CRATE ?auto_18213 ) ( not ( = ?auto_18212 ?auto_18213 ) ) ( not ( = ?auto_18223 ?auto_18212 ) ) ( not ( = ?auto_18223 ?auto_18213 ) ) ( not ( = ?auto_18219 ?auto_18218 ) ) ( HOIST-AT ?auto_18222 ?auto_18219 ) ( not ( = ?auto_18220 ?auto_18222 ) ) ( AVAILABLE ?auto_18222 ) ( SURFACE-AT ?auto_18213 ?auto_18219 ) ( ON ?auto_18213 ?auto_18217 ) ( CLEAR ?auto_18213 ) ( not ( = ?auto_18212 ?auto_18217 ) ) ( not ( = ?auto_18213 ?auto_18217 ) ) ( not ( = ?auto_18223 ?auto_18217 ) ) ( IS-CRATE ?auto_18212 ) ( not ( = ?auto_18215 ?auto_18218 ) ) ( not ( = ?auto_18219 ?auto_18215 ) ) ( HOIST-AT ?auto_18214 ?auto_18215 ) ( not ( = ?auto_18220 ?auto_18214 ) ) ( not ( = ?auto_18222 ?auto_18214 ) ) ( AVAILABLE ?auto_18214 ) ( SURFACE-AT ?auto_18212 ?auto_18215 ) ( ON ?auto_18212 ?auto_18216 ) ( CLEAR ?auto_18212 ) ( not ( = ?auto_18212 ?auto_18216 ) ) ( not ( = ?auto_18213 ?auto_18216 ) ) ( not ( = ?auto_18223 ?auto_18216 ) ) ( not ( = ?auto_18217 ?auto_18216 ) ) ( TRUCK-AT ?auto_18221 ?auto_18218 ) ( SURFACE-AT ?auto_18224 ?auto_18218 ) ( CLEAR ?auto_18224 ) ( LIFTING ?auto_18220 ?auto_18223 ) ( IS-CRATE ?auto_18223 ) ( not ( = ?auto_18224 ?auto_18223 ) ) ( not ( = ?auto_18212 ?auto_18224 ) ) ( not ( = ?auto_18213 ?auto_18224 ) ) ( not ( = ?auto_18217 ?auto_18224 ) ) ( not ( = ?auto_18216 ?auto_18224 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18224 ?auto_18223 )
      ( MAKE-2CRATE ?auto_18223 ?auto_18212 ?auto_18213 )
      ( MAKE-1CRATE-VERIFY ?auto_18212 ?auto_18213 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18225 - SURFACE
      ?auto_18226 - SURFACE
      ?auto_18227 - SURFACE
    )
    :vars
    (
      ?auto_18232 - HOIST
      ?auto_18231 - PLACE
      ?auto_18230 - PLACE
      ?auto_18234 - HOIST
      ?auto_18229 - SURFACE
      ?auto_18235 - PLACE
      ?auto_18237 - HOIST
      ?auto_18233 - SURFACE
      ?auto_18228 - TRUCK
      ?auto_18236 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18232 ?auto_18231 ) ( IS-CRATE ?auto_18227 ) ( not ( = ?auto_18226 ?auto_18227 ) ) ( not ( = ?auto_18225 ?auto_18226 ) ) ( not ( = ?auto_18225 ?auto_18227 ) ) ( not ( = ?auto_18230 ?auto_18231 ) ) ( HOIST-AT ?auto_18234 ?auto_18230 ) ( not ( = ?auto_18232 ?auto_18234 ) ) ( AVAILABLE ?auto_18234 ) ( SURFACE-AT ?auto_18227 ?auto_18230 ) ( ON ?auto_18227 ?auto_18229 ) ( CLEAR ?auto_18227 ) ( not ( = ?auto_18226 ?auto_18229 ) ) ( not ( = ?auto_18227 ?auto_18229 ) ) ( not ( = ?auto_18225 ?auto_18229 ) ) ( IS-CRATE ?auto_18226 ) ( not ( = ?auto_18235 ?auto_18231 ) ) ( not ( = ?auto_18230 ?auto_18235 ) ) ( HOIST-AT ?auto_18237 ?auto_18235 ) ( not ( = ?auto_18232 ?auto_18237 ) ) ( not ( = ?auto_18234 ?auto_18237 ) ) ( AVAILABLE ?auto_18237 ) ( SURFACE-AT ?auto_18226 ?auto_18235 ) ( ON ?auto_18226 ?auto_18233 ) ( CLEAR ?auto_18226 ) ( not ( = ?auto_18226 ?auto_18233 ) ) ( not ( = ?auto_18227 ?auto_18233 ) ) ( not ( = ?auto_18225 ?auto_18233 ) ) ( not ( = ?auto_18229 ?auto_18233 ) ) ( TRUCK-AT ?auto_18228 ?auto_18231 ) ( SURFACE-AT ?auto_18236 ?auto_18231 ) ( CLEAR ?auto_18236 ) ( LIFTING ?auto_18232 ?auto_18225 ) ( IS-CRATE ?auto_18225 ) ( not ( = ?auto_18236 ?auto_18225 ) ) ( not ( = ?auto_18226 ?auto_18236 ) ) ( not ( = ?auto_18227 ?auto_18236 ) ) ( not ( = ?auto_18229 ?auto_18236 ) ) ( not ( = ?auto_18233 ?auto_18236 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18226 ?auto_18227 )
      ( MAKE-2CRATE-VERIFY ?auto_18225 ?auto_18226 ?auto_18227 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18238 - SURFACE
      ?auto_18239 - SURFACE
      ?auto_18240 - SURFACE
      ?auto_18241 - SURFACE
    )
    :vars
    (
      ?auto_18249 - HOIST
      ?auto_18242 - PLACE
      ?auto_18244 - PLACE
      ?auto_18248 - HOIST
      ?auto_18247 - SURFACE
      ?auto_18246 - PLACE
      ?auto_18243 - HOIST
      ?auto_18245 - SURFACE
      ?auto_18250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18249 ?auto_18242 ) ( IS-CRATE ?auto_18241 ) ( not ( = ?auto_18240 ?auto_18241 ) ) ( not ( = ?auto_18239 ?auto_18240 ) ) ( not ( = ?auto_18239 ?auto_18241 ) ) ( not ( = ?auto_18244 ?auto_18242 ) ) ( HOIST-AT ?auto_18248 ?auto_18244 ) ( not ( = ?auto_18249 ?auto_18248 ) ) ( AVAILABLE ?auto_18248 ) ( SURFACE-AT ?auto_18241 ?auto_18244 ) ( ON ?auto_18241 ?auto_18247 ) ( CLEAR ?auto_18241 ) ( not ( = ?auto_18240 ?auto_18247 ) ) ( not ( = ?auto_18241 ?auto_18247 ) ) ( not ( = ?auto_18239 ?auto_18247 ) ) ( IS-CRATE ?auto_18240 ) ( not ( = ?auto_18246 ?auto_18242 ) ) ( not ( = ?auto_18244 ?auto_18246 ) ) ( HOIST-AT ?auto_18243 ?auto_18246 ) ( not ( = ?auto_18249 ?auto_18243 ) ) ( not ( = ?auto_18248 ?auto_18243 ) ) ( AVAILABLE ?auto_18243 ) ( SURFACE-AT ?auto_18240 ?auto_18246 ) ( ON ?auto_18240 ?auto_18245 ) ( CLEAR ?auto_18240 ) ( not ( = ?auto_18240 ?auto_18245 ) ) ( not ( = ?auto_18241 ?auto_18245 ) ) ( not ( = ?auto_18239 ?auto_18245 ) ) ( not ( = ?auto_18247 ?auto_18245 ) ) ( TRUCK-AT ?auto_18250 ?auto_18242 ) ( SURFACE-AT ?auto_18238 ?auto_18242 ) ( CLEAR ?auto_18238 ) ( LIFTING ?auto_18249 ?auto_18239 ) ( IS-CRATE ?auto_18239 ) ( not ( = ?auto_18238 ?auto_18239 ) ) ( not ( = ?auto_18240 ?auto_18238 ) ) ( not ( = ?auto_18241 ?auto_18238 ) ) ( not ( = ?auto_18247 ?auto_18238 ) ) ( not ( = ?auto_18245 ?auto_18238 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18239 ?auto_18240 ?auto_18241 )
      ( MAKE-3CRATE-VERIFY ?auto_18238 ?auto_18239 ?auto_18240 ?auto_18241 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18251 - SURFACE
      ?auto_18252 - SURFACE
      ?auto_18253 - SURFACE
      ?auto_18254 - SURFACE
      ?auto_18255 - SURFACE
    )
    :vars
    (
      ?auto_18263 - HOIST
      ?auto_18256 - PLACE
      ?auto_18258 - PLACE
      ?auto_18262 - HOIST
      ?auto_18261 - SURFACE
      ?auto_18260 - PLACE
      ?auto_18257 - HOIST
      ?auto_18259 - SURFACE
      ?auto_18264 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18263 ?auto_18256 ) ( IS-CRATE ?auto_18255 ) ( not ( = ?auto_18254 ?auto_18255 ) ) ( not ( = ?auto_18253 ?auto_18254 ) ) ( not ( = ?auto_18253 ?auto_18255 ) ) ( not ( = ?auto_18258 ?auto_18256 ) ) ( HOIST-AT ?auto_18262 ?auto_18258 ) ( not ( = ?auto_18263 ?auto_18262 ) ) ( AVAILABLE ?auto_18262 ) ( SURFACE-AT ?auto_18255 ?auto_18258 ) ( ON ?auto_18255 ?auto_18261 ) ( CLEAR ?auto_18255 ) ( not ( = ?auto_18254 ?auto_18261 ) ) ( not ( = ?auto_18255 ?auto_18261 ) ) ( not ( = ?auto_18253 ?auto_18261 ) ) ( IS-CRATE ?auto_18254 ) ( not ( = ?auto_18260 ?auto_18256 ) ) ( not ( = ?auto_18258 ?auto_18260 ) ) ( HOIST-AT ?auto_18257 ?auto_18260 ) ( not ( = ?auto_18263 ?auto_18257 ) ) ( not ( = ?auto_18262 ?auto_18257 ) ) ( AVAILABLE ?auto_18257 ) ( SURFACE-AT ?auto_18254 ?auto_18260 ) ( ON ?auto_18254 ?auto_18259 ) ( CLEAR ?auto_18254 ) ( not ( = ?auto_18254 ?auto_18259 ) ) ( not ( = ?auto_18255 ?auto_18259 ) ) ( not ( = ?auto_18253 ?auto_18259 ) ) ( not ( = ?auto_18261 ?auto_18259 ) ) ( TRUCK-AT ?auto_18264 ?auto_18256 ) ( SURFACE-AT ?auto_18252 ?auto_18256 ) ( CLEAR ?auto_18252 ) ( LIFTING ?auto_18263 ?auto_18253 ) ( IS-CRATE ?auto_18253 ) ( not ( = ?auto_18252 ?auto_18253 ) ) ( not ( = ?auto_18254 ?auto_18252 ) ) ( not ( = ?auto_18255 ?auto_18252 ) ) ( not ( = ?auto_18261 ?auto_18252 ) ) ( not ( = ?auto_18259 ?auto_18252 ) ) ( ON ?auto_18252 ?auto_18251 ) ( not ( = ?auto_18251 ?auto_18252 ) ) ( not ( = ?auto_18251 ?auto_18253 ) ) ( not ( = ?auto_18251 ?auto_18254 ) ) ( not ( = ?auto_18251 ?auto_18255 ) ) ( not ( = ?auto_18251 ?auto_18261 ) ) ( not ( = ?auto_18251 ?auto_18259 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18253 ?auto_18254 ?auto_18255 )
      ( MAKE-4CRATE-VERIFY ?auto_18251 ?auto_18252 ?auto_18253 ?auto_18254 ?auto_18255 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18265 - SURFACE
      ?auto_18266 - SURFACE
      ?auto_18267 - SURFACE
      ?auto_18268 - SURFACE
      ?auto_18269 - SURFACE
      ?auto_18270 - SURFACE
    )
    :vars
    (
      ?auto_18278 - HOIST
      ?auto_18271 - PLACE
      ?auto_18273 - PLACE
      ?auto_18277 - HOIST
      ?auto_18276 - SURFACE
      ?auto_18275 - PLACE
      ?auto_18272 - HOIST
      ?auto_18274 - SURFACE
      ?auto_18279 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18278 ?auto_18271 ) ( IS-CRATE ?auto_18270 ) ( not ( = ?auto_18269 ?auto_18270 ) ) ( not ( = ?auto_18268 ?auto_18269 ) ) ( not ( = ?auto_18268 ?auto_18270 ) ) ( not ( = ?auto_18273 ?auto_18271 ) ) ( HOIST-AT ?auto_18277 ?auto_18273 ) ( not ( = ?auto_18278 ?auto_18277 ) ) ( AVAILABLE ?auto_18277 ) ( SURFACE-AT ?auto_18270 ?auto_18273 ) ( ON ?auto_18270 ?auto_18276 ) ( CLEAR ?auto_18270 ) ( not ( = ?auto_18269 ?auto_18276 ) ) ( not ( = ?auto_18270 ?auto_18276 ) ) ( not ( = ?auto_18268 ?auto_18276 ) ) ( IS-CRATE ?auto_18269 ) ( not ( = ?auto_18275 ?auto_18271 ) ) ( not ( = ?auto_18273 ?auto_18275 ) ) ( HOIST-AT ?auto_18272 ?auto_18275 ) ( not ( = ?auto_18278 ?auto_18272 ) ) ( not ( = ?auto_18277 ?auto_18272 ) ) ( AVAILABLE ?auto_18272 ) ( SURFACE-AT ?auto_18269 ?auto_18275 ) ( ON ?auto_18269 ?auto_18274 ) ( CLEAR ?auto_18269 ) ( not ( = ?auto_18269 ?auto_18274 ) ) ( not ( = ?auto_18270 ?auto_18274 ) ) ( not ( = ?auto_18268 ?auto_18274 ) ) ( not ( = ?auto_18276 ?auto_18274 ) ) ( TRUCK-AT ?auto_18279 ?auto_18271 ) ( SURFACE-AT ?auto_18267 ?auto_18271 ) ( CLEAR ?auto_18267 ) ( LIFTING ?auto_18278 ?auto_18268 ) ( IS-CRATE ?auto_18268 ) ( not ( = ?auto_18267 ?auto_18268 ) ) ( not ( = ?auto_18269 ?auto_18267 ) ) ( not ( = ?auto_18270 ?auto_18267 ) ) ( not ( = ?auto_18276 ?auto_18267 ) ) ( not ( = ?auto_18274 ?auto_18267 ) ) ( ON ?auto_18266 ?auto_18265 ) ( ON ?auto_18267 ?auto_18266 ) ( not ( = ?auto_18265 ?auto_18266 ) ) ( not ( = ?auto_18265 ?auto_18267 ) ) ( not ( = ?auto_18265 ?auto_18268 ) ) ( not ( = ?auto_18265 ?auto_18269 ) ) ( not ( = ?auto_18265 ?auto_18270 ) ) ( not ( = ?auto_18265 ?auto_18276 ) ) ( not ( = ?auto_18265 ?auto_18274 ) ) ( not ( = ?auto_18266 ?auto_18267 ) ) ( not ( = ?auto_18266 ?auto_18268 ) ) ( not ( = ?auto_18266 ?auto_18269 ) ) ( not ( = ?auto_18266 ?auto_18270 ) ) ( not ( = ?auto_18266 ?auto_18276 ) ) ( not ( = ?auto_18266 ?auto_18274 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18268 ?auto_18269 ?auto_18270 )
      ( MAKE-5CRATE-VERIFY ?auto_18265 ?auto_18266 ?auto_18267 ?auto_18268 ?auto_18269 ?auto_18270 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18280 - SURFACE
      ?auto_18281 - SURFACE
    )
    :vars
    (
      ?auto_18290 - HOIST
      ?auto_18282 - PLACE
      ?auto_18292 - SURFACE
      ?auto_18284 - PLACE
      ?auto_18289 - HOIST
      ?auto_18288 - SURFACE
      ?auto_18286 - PLACE
      ?auto_18283 - HOIST
      ?auto_18285 - SURFACE
      ?auto_18291 - TRUCK
      ?auto_18287 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18290 ?auto_18282 ) ( IS-CRATE ?auto_18281 ) ( not ( = ?auto_18280 ?auto_18281 ) ) ( not ( = ?auto_18292 ?auto_18280 ) ) ( not ( = ?auto_18292 ?auto_18281 ) ) ( not ( = ?auto_18284 ?auto_18282 ) ) ( HOIST-AT ?auto_18289 ?auto_18284 ) ( not ( = ?auto_18290 ?auto_18289 ) ) ( AVAILABLE ?auto_18289 ) ( SURFACE-AT ?auto_18281 ?auto_18284 ) ( ON ?auto_18281 ?auto_18288 ) ( CLEAR ?auto_18281 ) ( not ( = ?auto_18280 ?auto_18288 ) ) ( not ( = ?auto_18281 ?auto_18288 ) ) ( not ( = ?auto_18292 ?auto_18288 ) ) ( IS-CRATE ?auto_18280 ) ( not ( = ?auto_18286 ?auto_18282 ) ) ( not ( = ?auto_18284 ?auto_18286 ) ) ( HOIST-AT ?auto_18283 ?auto_18286 ) ( not ( = ?auto_18290 ?auto_18283 ) ) ( not ( = ?auto_18289 ?auto_18283 ) ) ( AVAILABLE ?auto_18283 ) ( SURFACE-AT ?auto_18280 ?auto_18286 ) ( ON ?auto_18280 ?auto_18285 ) ( CLEAR ?auto_18280 ) ( not ( = ?auto_18280 ?auto_18285 ) ) ( not ( = ?auto_18281 ?auto_18285 ) ) ( not ( = ?auto_18292 ?auto_18285 ) ) ( not ( = ?auto_18288 ?auto_18285 ) ) ( TRUCK-AT ?auto_18291 ?auto_18282 ) ( SURFACE-AT ?auto_18287 ?auto_18282 ) ( CLEAR ?auto_18287 ) ( IS-CRATE ?auto_18292 ) ( not ( = ?auto_18287 ?auto_18292 ) ) ( not ( = ?auto_18280 ?auto_18287 ) ) ( not ( = ?auto_18281 ?auto_18287 ) ) ( not ( = ?auto_18288 ?auto_18287 ) ) ( not ( = ?auto_18285 ?auto_18287 ) ) ( AVAILABLE ?auto_18290 ) ( IN ?auto_18292 ?auto_18291 ) )
    :subtasks
    ( ( !UNLOAD ?auto_18290 ?auto_18292 ?auto_18291 ?auto_18282 )
      ( MAKE-2CRATE ?auto_18292 ?auto_18280 ?auto_18281 )
      ( MAKE-1CRATE-VERIFY ?auto_18280 ?auto_18281 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18293 - SURFACE
      ?auto_18294 - SURFACE
      ?auto_18295 - SURFACE
    )
    :vars
    (
      ?auto_18301 - HOIST
      ?auto_18299 - PLACE
      ?auto_18302 - PLACE
      ?auto_18304 - HOIST
      ?auto_18298 - SURFACE
      ?auto_18296 - PLACE
      ?auto_18297 - HOIST
      ?auto_18303 - SURFACE
      ?auto_18305 - TRUCK
      ?auto_18300 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18301 ?auto_18299 ) ( IS-CRATE ?auto_18295 ) ( not ( = ?auto_18294 ?auto_18295 ) ) ( not ( = ?auto_18293 ?auto_18294 ) ) ( not ( = ?auto_18293 ?auto_18295 ) ) ( not ( = ?auto_18302 ?auto_18299 ) ) ( HOIST-AT ?auto_18304 ?auto_18302 ) ( not ( = ?auto_18301 ?auto_18304 ) ) ( AVAILABLE ?auto_18304 ) ( SURFACE-AT ?auto_18295 ?auto_18302 ) ( ON ?auto_18295 ?auto_18298 ) ( CLEAR ?auto_18295 ) ( not ( = ?auto_18294 ?auto_18298 ) ) ( not ( = ?auto_18295 ?auto_18298 ) ) ( not ( = ?auto_18293 ?auto_18298 ) ) ( IS-CRATE ?auto_18294 ) ( not ( = ?auto_18296 ?auto_18299 ) ) ( not ( = ?auto_18302 ?auto_18296 ) ) ( HOIST-AT ?auto_18297 ?auto_18296 ) ( not ( = ?auto_18301 ?auto_18297 ) ) ( not ( = ?auto_18304 ?auto_18297 ) ) ( AVAILABLE ?auto_18297 ) ( SURFACE-AT ?auto_18294 ?auto_18296 ) ( ON ?auto_18294 ?auto_18303 ) ( CLEAR ?auto_18294 ) ( not ( = ?auto_18294 ?auto_18303 ) ) ( not ( = ?auto_18295 ?auto_18303 ) ) ( not ( = ?auto_18293 ?auto_18303 ) ) ( not ( = ?auto_18298 ?auto_18303 ) ) ( TRUCK-AT ?auto_18305 ?auto_18299 ) ( SURFACE-AT ?auto_18300 ?auto_18299 ) ( CLEAR ?auto_18300 ) ( IS-CRATE ?auto_18293 ) ( not ( = ?auto_18300 ?auto_18293 ) ) ( not ( = ?auto_18294 ?auto_18300 ) ) ( not ( = ?auto_18295 ?auto_18300 ) ) ( not ( = ?auto_18298 ?auto_18300 ) ) ( not ( = ?auto_18303 ?auto_18300 ) ) ( AVAILABLE ?auto_18301 ) ( IN ?auto_18293 ?auto_18305 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18294 ?auto_18295 )
      ( MAKE-2CRATE-VERIFY ?auto_18293 ?auto_18294 ?auto_18295 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18306 - SURFACE
      ?auto_18307 - SURFACE
      ?auto_18308 - SURFACE
      ?auto_18309 - SURFACE
    )
    :vars
    (
      ?auto_18312 - HOIST
      ?auto_18310 - PLACE
      ?auto_18311 - PLACE
      ?auto_18318 - HOIST
      ?auto_18317 - SURFACE
      ?auto_18314 - PLACE
      ?auto_18315 - HOIST
      ?auto_18313 - SURFACE
      ?auto_18316 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18312 ?auto_18310 ) ( IS-CRATE ?auto_18309 ) ( not ( = ?auto_18308 ?auto_18309 ) ) ( not ( = ?auto_18307 ?auto_18308 ) ) ( not ( = ?auto_18307 ?auto_18309 ) ) ( not ( = ?auto_18311 ?auto_18310 ) ) ( HOIST-AT ?auto_18318 ?auto_18311 ) ( not ( = ?auto_18312 ?auto_18318 ) ) ( AVAILABLE ?auto_18318 ) ( SURFACE-AT ?auto_18309 ?auto_18311 ) ( ON ?auto_18309 ?auto_18317 ) ( CLEAR ?auto_18309 ) ( not ( = ?auto_18308 ?auto_18317 ) ) ( not ( = ?auto_18309 ?auto_18317 ) ) ( not ( = ?auto_18307 ?auto_18317 ) ) ( IS-CRATE ?auto_18308 ) ( not ( = ?auto_18314 ?auto_18310 ) ) ( not ( = ?auto_18311 ?auto_18314 ) ) ( HOIST-AT ?auto_18315 ?auto_18314 ) ( not ( = ?auto_18312 ?auto_18315 ) ) ( not ( = ?auto_18318 ?auto_18315 ) ) ( AVAILABLE ?auto_18315 ) ( SURFACE-AT ?auto_18308 ?auto_18314 ) ( ON ?auto_18308 ?auto_18313 ) ( CLEAR ?auto_18308 ) ( not ( = ?auto_18308 ?auto_18313 ) ) ( not ( = ?auto_18309 ?auto_18313 ) ) ( not ( = ?auto_18307 ?auto_18313 ) ) ( not ( = ?auto_18317 ?auto_18313 ) ) ( TRUCK-AT ?auto_18316 ?auto_18310 ) ( SURFACE-AT ?auto_18306 ?auto_18310 ) ( CLEAR ?auto_18306 ) ( IS-CRATE ?auto_18307 ) ( not ( = ?auto_18306 ?auto_18307 ) ) ( not ( = ?auto_18308 ?auto_18306 ) ) ( not ( = ?auto_18309 ?auto_18306 ) ) ( not ( = ?auto_18317 ?auto_18306 ) ) ( not ( = ?auto_18313 ?auto_18306 ) ) ( AVAILABLE ?auto_18312 ) ( IN ?auto_18307 ?auto_18316 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18307 ?auto_18308 ?auto_18309 )
      ( MAKE-3CRATE-VERIFY ?auto_18306 ?auto_18307 ?auto_18308 ?auto_18309 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18319 - SURFACE
      ?auto_18320 - SURFACE
      ?auto_18321 - SURFACE
      ?auto_18322 - SURFACE
      ?auto_18323 - SURFACE
    )
    :vars
    (
      ?auto_18326 - HOIST
      ?auto_18324 - PLACE
      ?auto_18325 - PLACE
      ?auto_18332 - HOIST
      ?auto_18331 - SURFACE
      ?auto_18328 - PLACE
      ?auto_18329 - HOIST
      ?auto_18327 - SURFACE
      ?auto_18330 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18326 ?auto_18324 ) ( IS-CRATE ?auto_18323 ) ( not ( = ?auto_18322 ?auto_18323 ) ) ( not ( = ?auto_18321 ?auto_18322 ) ) ( not ( = ?auto_18321 ?auto_18323 ) ) ( not ( = ?auto_18325 ?auto_18324 ) ) ( HOIST-AT ?auto_18332 ?auto_18325 ) ( not ( = ?auto_18326 ?auto_18332 ) ) ( AVAILABLE ?auto_18332 ) ( SURFACE-AT ?auto_18323 ?auto_18325 ) ( ON ?auto_18323 ?auto_18331 ) ( CLEAR ?auto_18323 ) ( not ( = ?auto_18322 ?auto_18331 ) ) ( not ( = ?auto_18323 ?auto_18331 ) ) ( not ( = ?auto_18321 ?auto_18331 ) ) ( IS-CRATE ?auto_18322 ) ( not ( = ?auto_18328 ?auto_18324 ) ) ( not ( = ?auto_18325 ?auto_18328 ) ) ( HOIST-AT ?auto_18329 ?auto_18328 ) ( not ( = ?auto_18326 ?auto_18329 ) ) ( not ( = ?auto_18332 ?auto_18329 ) ) ( AVAILABLE ?auto_18329 ) ( SURFACE-AT ?auto_18322 ?auto_18328 ) ( ON ?auto_18322 ?auto_18327 ) ( CLEAR ?auto_18322 ) ( not ( = ?auto_18322 ?auto_18327 ) ) ( not ( = ?auto_18323 ?auto_18327 ) ) ( not ( = ?auto_18321 ?auto_18327 ) ) ( not ( = ?auto_18331 ?auto_18327 ) ) ( TRUCK-AT ?auto_18330 ?auto_18324 ) ( SURFACE-AT ?auto_18320 ?auto_18324 ) ( CLEAR ?auto_18320 ) ( IS-CRATE ?auto_18321 ) ( not ( = ?auto_18320 ?auto_18321 ) ) ( not ( = ?auto_18322 ?auto_18320 ) ) ( not ( = ?auto_18323 ?auto_18320 ) ) ( not ( = ?auto_18331 ?auto_18320 ) ) ( not ( = ?auto_18327 ?auto_18320 ) ) ( AVAILABLE ?auto_18326 ) ( IN ?auto_18321 ?auto_18330 ) ( ON ?auto_18320 ?auto_18319 ) ( not ( = ?auto_18319 ?auto_18320 ) ) ( not ( = ?auto_18319 ?auto_18321 ) ) ( not ( = ?auto_18319 ?auto_18322 ) ) ( not ( = ?auto_18319 ?auto_18323 ) ) ( not ( = ?auto_18319 ?auto_18331 ) ) ( not ( = ?auto_18319 ?auto_18327 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18321 ?auto_18322 ?auto_18323 )
      ( MAKE-4CRATE-VERIFY ?auto_18319 ?auto_18320 ?auto_18321 ?auto_18322 ?auto_18323 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18333 - SURFACE
      ?auto_18334 - SURFACE
      ?auto_18335 - SURFACE
      ?auto_18336 - SURFACE
      ?auto_18337 - SURFACE
      ?auto_18338 - SURFACE
    )
    :vars
    (
      ?auto_18341 - HOIST
      ?auto_18339 - PLACE
      ?auto_18340 - PLACE
      ?auto_18347 - HOIST
      ?auto_18346 - SURFACE
      ?auto_18343 - PLACE
      ?auto_18344 - HOIST
      ?auto_18342 - SURFACE
      ?auto_18345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18341 ?auto_18339 ) ( IS-CRATE ?auto_18338 ) ( not ( = ?auto_18337 ?auto_18338 ) ) ( not ( = ?auto_18336 ?auto_18337 ) ) ( not ( = ?auto_18336 ?auto_18338 ) ) ( not ( = ?auto_18340 ?auto_18339 ) ) ( HOIST-AT ?auto_18347 ?auto_18340 ) ( not ( = ?auto_18341 ?auto_18347 ) ) ( AVAILABLE ?auto_18347 ) ( SURFACE-AT ?auto_18338 ?auto_18340 ) ( ON ?auto_18338 ?auto_18346 ) ( CLEAR ?auto_18338 ) ( not ( = ?auto_18337 ?auto_18346 ) ) ( not ( = ?auto_18338 ?auto_18346 ) ) ( not ( = ?auto_18336 ?auto_18346 ) ) ( IS-CRATE ?auto_18337 ) ( not ( = ?auto_18343 ?auto_18339 ) ) ( not ( = ?auto_18340 ?auto_18343 ) ) ( HOIST-AT ?auto_18344 ?auto_18343 ) ( not ( = ?auto_18341 ?auto_18344 ) ) ( not ( = ?auto_18347 ?auto_18344 ) ) ( AVAILABLE ?auto_18344 ) ( SURFACE-AT ?auto_18337 ?auto_18343 ) ( ON ?auto_18337 ?auto_18342 ) ( CLEAR ?auto_18337 ) ( not ( = ?auto_18337 ?auto_18342 ) ) ( not ( = ?auto_18338 ?auto_18342 ) ) ( not ( = ?auto_18336 ?auto_18342 ) ) ( not ( = ?auto_18346 ?auto_18342 ) ) ( TRUCK-AT ?auto_18345 ?auto_18339 ) ( SURFACE-AT ?auto_18335 ?auto_18339 ) ( CLEAR ?auto_18335 ) ( IS-CRATE ?auto_18336 ) ( not ( = ?auto_18335 ?auto_18336 ) ) ( not ( = ?auto_18337 ?auto_18335 ) ) ( not ( = ?auto_18338 ?auto_18335 ) ) ( not ( = ?auto_18346 ?auto_18335 ) ) ( not ( = ?auto_18342 ?auto_18335 ) ) ( AVAILABLE ?auto_18341 ) ( IN ?auto_18336 ?auto_18345 ) ( ON ?auto_18334 ?auto_18333 ) ( ON ?auto_18335 ?auto_18334 ) ( not ( = ?auto_18333 ?auto_18334 ) ) ( not ( = ?auto_18333 ?auto_18335 ) ) ( not ( = ?auto_18333 ?auto_18336 ) ) ( not ( = ?auto_18333 ?auto_18337 ) ) ( not ( = ?auto_18333 ?auto_18338 ) ) ( not ( = ?auto_18333 ?auto_18346 ) ) ( not ( = ?auto_18333 ?auto_18342 ) ) ( not ( = ?auto_18334 ?auto_18335 ) ) ( not ( = ?auto_18334 ?auto_18336 ) ) ( not ( = ?auto_18334 ?auto_18337 ) ) ( not ( = ?auto_18334 ?auto_18338 ) ) ( not ( = ?auto_18334 ?auto_18346 ) ) ( not ( = ?auto_18334 ?auto_18342 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18336 ?auto_18337 ?auto_18338 )
      ( MAKE-5CRATE-VERIFY ?auto_18333 ?auto_18334 ?auto_18335 ?auto_18336 ?auto_18337 ?auto_18338 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18348 - SURFACE
      ?auto_18349 - SURFACE
    )
    :vars
    (
      ?auto_18353 - HOIST
      ?auto_18350 - PLACE
      ?auto_18360 - SURFACE
      ?auto_18351 - PLACE
      ?auto_18359 - HOIST
      ?auto_18358 - SURFACE
      ?auto_18355 - PLACE
      ?auto_18356 - HOIST
      ?auto_18354 - SURFACE
      ?auto_18352 - SURFACE
      ?auto_18357 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18353 ?auto_18350 ) ( IS-CRATE ?auto_18349 ) ( not ( = ?auto_18348 ?auto_18349 ) ) ( not ( = ?auto_18360 ?auto_18348 ) ) ( not ( = ?auto_18360 ?auto_18349 ) ) ( not ( = ?auto_18351 ?auto_18350 ) ) ( HOIST-AT ?auto_18359 ?auto_18351 ) ( not ( = ?auto_18353 ?auto_18359 ) ) ( AVAILABLE ?auto_18359 ) ( SURFACE-AT ?auto_18349 ?auto_18351 ) ( ON ?auto_18349 ?auto_18358 ) ( CLEAR ?auto_18349 ) ( not ( = ?auto_18348 ?auto_18358 ) ) ( not ( = ?auto_18349 ?auto_18358 ) ) ( not ( = ?auto_18360 ?auto_18358 ) ) ( IS-CRATE ?auto_18348 ) ( not ( = ?auto_18355 ?auto_18350 ) ) ( not ( = ?auto_18351 ?auto_18355 ) ) ( HOIST-AT ?auto_18356 ?auto_18355 ) ( not ( = ?auto_18353 ?auto_18356 ) ) ( not ( = ?auto_18359 ?auto_18356 ) ) ( AVAILABLE ?auto_18356 ) ( SURFACE-AT ?auto_18348 ?auto_18355 ) ( ON ?auto_18348 ?auto_18354 ) ( CLEAR ?auto_18348 ) ( not ( = ?auto_18348 ?auto_18354 ) ) ( not ( = ?auto_18349 ?auto_18354 ) ) ( not ( = ?auto_18360 ?auto_18354 ) ) ( not ( = ?auto_18358 ?auto_18354 ) ) ( SURFACE-AT ?auto_18352 ?auto_18350 ) ( CLEAR ?auto_18352 ) ( IS-CRATE ?auto_18360 ) ( not ( = ?auto_18352 ?auto_18360 ) ) ( not ( = ?auto_18348 ?auto_18352 ) ) ( not ( = ?auto_18349 ?auto_18352 ) ) ( not ( = ?auto_18358 ?auto_18352 ) ) ( not ( = ?auto_18354 ?auto_18352 ) ) ( AVAILABLE ?auto_18353 ) ( IN ?auto_18360 ?auto_18357 ) ( TRUCK-AT ?auto_18357 ?auto_18355 ) )
    :subtasks
    ( ( !DRIVE ?auto_18357 ?auto_18355 ?auto_18350 )
      ( MAKE-2CRATE ?auto_18360 ?auto_18348 ?auto_18349 )
      ( MAKE-1CRATE-VERIFY ?auto_18348 ?auto_18349 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18361 - SURFACE
      ?auto_18362 - SURFACE
      ?auto_18363 - SURFACE
    )
    :vars
    (
      ?auto_18369 - HOIST
      ?auto_18370 - PLACE
      ?auto_18365 - PLACE
      ?auto_18366 - HOIST
      ?auto_18373 - SURFACE
      ?auto_18371 - PLACE
      ?auto_18367 - HOIST
      ?auto_18372 - SURFACE
      ?auto_18364 - SURFACE
      ?auto_18368 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18369 ?auto_18370 ) ( IS-CRATE ?auto_18363 ) ( not ( = ?auto_18362 ?auto_18363 ) ) ( not ( = ?auto_18361 ?auto_18362 ) ) ( not ( = ?auto_18361 ?auto_18363 ) ) ( not ( = ?auto_18365 ?auto_18370 ) ) ( HOIST-AT ?auto_18366 ?auto_18365 ) ( not ( = ?auto_18369 ?auto_18366 ) ) ( AVAILABLE ?auto_18366 ) ( SURFACE-AT ?auto_18363 ?auto_18365 ) ( ON ?auto_18363 ?auto_18373 ) ( CLEAR ?auto_18363 ) ( not ( = ?auto_18362 ?auto_18373 ) ) ( not ( = ?auto_18363 ?auto_18373 ) ) ( not ( = ?auto_18361 ?auto_18373 ) ) ( IS-CRATE ?auto_18362 ) ( not ( = ?auto_18371 ?auto_18370 ) ) ( not ( = ?auto_18365 ?auto_18371 ) ) ( HOIST-AT ?auto_18367 ?auto_18371 ) ( not ( = ?auto_18369 ?auto_18367 ) ) ( not ( = ?auto_18366 ?auto_18367 ) ) ( AVAILABLE ?auto_18367 ) ( SURFACE-AT ?auto_18362 ?auto_18371 ) ( ON ?auto_18362 ?auto_18372 ) ( CLEAR ?auto_18362 ) ( not ( = ?auto_18362 ?auto_18372 ) ) ( not ( = ?auto_18363 ?auto_18372 ) ) ( not ( = ?auto_18361 ?auto_18372 ) ) ( not ( = ?auto_18373 ?auto_18372 ) ) ( SURFACE-AT ?auto_18364 ?auto_18370 ) ( CLEAR ?auto_18364 ) ( IS-CRATE ?auto_18361 ) ( not ( = ?auto_18364 ?auto_18361 ) ) ( not ( = ?auto_18362 ?auto_18364 ) ) ( not ( = ?auto_18363 ?auto_18364 ) ) ( not ( = ?auto_18373 ?auto_18364 ) ) ( not ( = ?auto_18372 ?auto_18364 ) ) ( AVAILABLE ?auto_18369 ) ( IN ?auto_18361 ?auto_18368 ) ( TRUCK-AT ?auto_18368 ?auto_18371 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18362 ?auto_18363 )
      ( MAKE-2CRATE-VERIFY ?auto_18361 ?auto_18362 ?auto_18363 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18374 - SURFACE
      ?auto_18375 - SURFACE
      ?auto_18376 - SURFACE
      ?auto_18377 - SURFACE
    )
    :vars
    (
      ?auto_18380 - HOIST
      ?auto_18383 - PLACE
      ?auto_18386 - PLACE
      ?auto_18381 - HOIST
      ?auto_18384 - SURFACE
      ?auto_18378 - PLACE
      ?auto_18379 - HOIST
      ?auto_18385 - SURFACE
      ?auto_18382 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18380 ?auto_18383 ) ( IS-CRATE ?auto_18377 ) ( not ( = ?auto_18376 ?auto_18377 ) ) ( not ( = ?auto_18375 ?auto_18376 ) ) ( not ( = ?auto_18375 ?auto_18377 ) ) ( not ( = ?auto_18386 ?auto_18383 ) ) ( HOIST-AT ?auto_18381 ?auto_18386 ) ( not ( = ?auto_18380 ?auto_18381 ) ) ( AVAILABLE ?auto_18381 ) ( SURFACE-AT ?auto_18377 ?auto_18386 ) ( ON ?auto_18377 ?auto_18384 ) ( CLEAR ?auto_18377 ) ( not ( = ?auto_18376 ?auto_18384 ) ) ( not ( = ?auto_18377 ?auto_18384 ) ) ( not ( = ?auto_18375 ?auto_18384 ) ) ( IS-CRATE ?auto_18376 ) ( not ( = ?auto_18378 ?auto_18383 ) ) ( not ( = ?auto_18386 ?auto_18378 ) ) ( HOIST-AT ?auto_18379 ?auto_18378 ) ( not ( = ?auto_18380 ?auto_18379 ) ) ( not ( = ?auto_18381 ?auto_18379 ) ) ( AVAILABLE ?auto_18379 ) ( SURFACE-AT ?auto_18376 ?auto_18378 ) ( ON ?auto_18376 ?auto_18385 ) ( CLEAR ?auto_18376 ) ( not ( = ?auto_18376 ?auto_18385 ) ) ( not ( = ?auto_18377 ?auto_18385 ) ) ( not ( = ?auto_18375 ?auto_18385 ) ) ( not ( = ?auto_18384 ?auto_18385 ) ) ( SURFACE-AT ?auto_18374 ?auto_18383 ) ( CLEAR ?auto_18374 ) ( IS-CRATE ?auto_18375 ) ( not ( = ?auto_18374 ?auto_18375 ) ) ( not ( = ?auto_18376 ?auto_18374 ) ) ( not ( = ?auto_18377 ?auto_18374 ) ) ( not ( = ?auto_18384 ?auto_18374 ) ) ( not ( = ?auto_18385 ?auto_18374 ) ) ( AVAILABLE ?auto_18380 ) ( IN ?auto_18375 ?auto_18382 ) ( TRUCK-AT ?auto_18382 ?auto_18378 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18375 ?auto_18376 ?auto_18377 )
      ( MAKE-3CRATE-VERIFY ?auto_18374 ?auto_18375 ?auto_18376 ?auto_18377 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18387 - SURFACE
      ?auto_18388 - SURFACE
      ?auto_18389 - SURFACE
      ?auto_18390 - SURFACE
      ?auto_18391 - SURFACE
    )
    :vars
    (
      ?auto_18394 - HOIST
      ?auto_18397 - PLACE
      ?auto_18400 - PLACE
      ?auto_18395 - HOIST
      ?auto_18398 - SURFACE
      ?auto_18392 - PLACE
      ?auto_18393 - HOIST
      ?auto_18399 - SURFACE
      ?auto_18396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18394 ?auto_18397 ) ( IS-CRATE ?auto_18391 ) ( not ( = ?auto_18390 ?auto_18391 ) ) ( not ( = ?auto_18389 ?auto_18390 ) ) ( not ( = ?auto_18389 ?auto_18391 ) ) ( not ( = ?auto_18400 ?auto_18397 ) ) ( HOIST-AT ?auto_18395 ?auto_18400 ) ( not ( = ?auto_18394 ?auto_18395 ) ) ( AVAILABLE ?auto_18395 ) ( SURFACE-AT ?auto_18391 ?auto_18400 ) ( ON ?auto_18391 ?auto_18398 ) ( CLEAR ?auto_18391 ) ( not ( = ?auto_18390 ?auto_18398 ) ) ( not ( = ?auto_18391 ?auto_18398 ) ) ( not ( = ?auto_18389 ?auto_18398 ) ) ( IS-CRATE ?auto_18390 ) ( not ( = ?auto_18392 ?auto_18397 ) ) ( not ( = ?auto_18400 ?auto_18392 ) ) ( HOIST-AT ?auto_18393 ?auto_18392 ) ( not ( = ?auto_18394 ?auto_18393 ) ) ( not ( = ?auto_18395 ?auto_18393 ) ) ( AVAILABLE ?auto_18393 ) ( SURFACE-AT ?auto_18390 ?auto_18392 ) ( ON ?auto_18390 ?auto_18399 ) ( CLEAR ?auto_18390 ) ( not ( = ?auto_18390 ?auto_18399 ) ) ( not ( = ?auto_18391 ?auto_18399 ) ) ( not ( = ?auto_18389 ?auto_18399 ) ) ( not ( = ?auto_18398 ?auto_18399 ) ) ( SURFACE-AT ?auto_18388 ?auto_18397 ) ( CLEAR ?auto_18388 ) ( IS-CRATE ?auto_18389 ) ( not ( = ?auto_18388 ?auto_18389 ) ) ( not ( = ?auto_18390 ?auto_18388 ) ) ( not ( = ?auto_18391 ?auto_18388 ) ) ( not ( = ?auto_18398 ?auto_18388 ) ) ( not ( = ?auto_18399 ?auto_18388 ) ) ( AVAILABLE ?auto_18394 ) ( IN ?auto_18389 ?auto_18396 ) ( TRUCK-AT ?auto_18396 ?auto_18392 ) ( ON ?auto_18388 ?auto_18387 ) ( not ( = ?auto_18387 ?auto_18388 ) ) ( not ( = ?auto_18387 ?auto_18389 ) ) ( not ( = ?auto_18387 ?auto_18390 ) ) ( not ( = ?auto_18387 ?auto_18391 ) ) ( not ( = ?auto_18387 ?auto_18398 ) ) ( not ( = ?auto_18387 ?auto_18399 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18389 ?auto_18390 ?auto_18391 )
      ( MAKE-4CRATE-VERIFY ?auto_18387 ?auto_18388 ?auto_18389 ?auto_18390 ?auto_18391 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18401 - SURFACE
      ?auto_18402 - SURFACE
      ?auto_18403 - SURFACE
      ?auto_18404 - SURFACE
      ?auto_18405 - SURFACE
      ?auto_18406 - SURFACE
    )
    :vars
    (
      ?auto_18409 - HOIST
      ?auto_18412 - PLACE
      ?auto_18415 - PLACE
      ?auto_18410 - HOIST
      ?auto_18413 - SURFACE
      ?auto_18407 - PLACE
      ?auto_18408 - HOIST
      ?auto_18414 - SURFACE
      ?auto_18411 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18409 ?auto_18412 ) ( IS-CRATE ?auto_18406 ) ( not ( = ?auto_18405 ?auto_18406 ) ) ( not ( = ?auto_18404 ?auto_18405 ) ) ( not ( = ?auto_18404 ?auto_18406 ) ) ( not ( = ?auto_18415 ?auto_18412 ) ) ( HOIST-AT ?auto_18410 ?auto_18415 ) ( not ( = ?auto_18409 ?auto_18410 ) ) ( AVAILABLE ?auto_18410 ) ( SURFACE-AT ?auto_18406 ?auto_18415 ) ( ON ?auto_18406 ?auto_18413 ) ( CLEAR ?auto_18406 ) ( not ( = ?auto_18405 ?auto_18413 ) ) ( not ( = ?auto_18406 ?auto_18413 ) ) ( not ( = ?auto_18404 ?auto_18413 ) ) ( IS-CRATE ?auto_18405 ) ( not ( = ?auto_18407 ?auto_18412 ) ) ( not ( = ?auto_18415 ?auto_18407 ) ) ( HOIST-AT ?auto_18408 ?auto_18407 ) ( not ( = ?auto_18409 ?auto_18408 ) ) ( not ( = ?auto_18410 ?auto_18408 ) ) ( AVAILABLE ?auto_18408 ) ( SURFACE-AT ?auto_18405 ?auto_18407 ) ( ON ?auto_18405 ?auto_18414 ) ( CLEAR ?auto_18405 ) ( not ( = ?auto_18405 ?auto_18414 ) ) ( not ( = ?auto_18406 ?auto_18414 ) ) ( not ( = ?auto_18404 ?auto_18414 ) ) ( not ( = ?auto_18413 ?auto_18414 ) ) ( SURFACE-AT ?auto_18403 ?auto_18412 ) ( CLEAR ?auto_18403 ) ( IS-CRATE ?auto_18404 ) ( not ( = ?auto_18403 ?auto_18404 ) ) ( not ( = ?auto_18405 ?auto_18403 ) ) ( not ( = ?auto_18406 ?auto_18403 ) ) ( not ( = ?auto_18413 ?auto_18403 ) ) ( not ( = ?auto_18414 ?auto_18403 ) ) ( AVAILABLE ?auto_18409 ) ( IN ?auto_18404 ?auto_18411 ) ( TRUCK-AT ?auto_18411 ?auto_18407 ) ( ON ?auto_18402 ?auto_18401 ) ( ON ?auto_18403 ?auto_18402 ) ( not ( = ?auto_18401 ?auto_18402 ) ) ( not ( = ?auto_18401 ?auto_18403 ) ) ( not ( = ?auto_18401 ?auto_18404 ) ) ( not ( = ?auto_18401 ?auto_18405 ) ) ( not ( = ?auto_18401 ?auto_18406 ) ) ( not ( = ?auto_18401 ?auto_18413 ) ) ( not ( = ?auto_18401 ?auto_18414 ) ) ( not ( = ?auto_18402 ?auto_18403 ) ) ( not ( = ?auto_18402 ?auto_18404 ) ) ( not ( = ?auto_18402 ?auto_18405 ) ) ( not ( = ?auto_18402 ?auto_18406 ) ) ( not ( = ?auto_18402 ?auto_18413 ) ) ( not ( = ?auto_18402 ?auto_18414 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18404 ?auto_18405 ?auto_18406 )
      ( MAKE-5CRATE-VERIFY ?auto_18401 ?auto_18402 ?auto_18403 ?auto_18404 ?auto_18405 ?auto_18406 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18416 - SURFACE
      ?auto_18417 - SURFACE
    )
    :vars
    (
      ?auto_18420 - HOIST
      ?auto_18423 - PLACE
      ?auto_18428 - SURFACE
      ?auto_18427 - PLACE
      ?auto_18421 - HOIST
      ?auto_18424 - SURFACE
      ?auto_18418 - PLACE
      ?auto_18419 - HOIST
      ?auto_18425 - SURFACE
      ?auto_18426 - SURFACE
      ?auto_18422 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18420 ?auto_18423 ) ( IS-CRATE ?auto_18417 ) ( not ( = ?auto_18416 ?auto_18417 ) ) ( not ( = ?auto_18428 ?auto_18416 ) ) ( not ( = ?auto_18428 ?auto_18417 ) ) ( not ( = ?auto_18427 ?auto_18423 ) ) ( HOIST-AT ?auto_18421 ?auto_18427 ) ( not ( = ?auto_18420 ?auto_18421 ) ) ( AVAILABLE ?auto_18421 ) ( SURFACE-AT ?auto_18417 ?auto_18427 ) ( ON ?auto_18417 ?auto_18424 ) ( CLEAR ?auto_18417 ) ( not ( = ?auto_18416 ?auto_18424 ) ) ( not ( = ?auto_18417 ?auto_18424 ) ) ( not ( = ?auto_18428 ?auto_18424 ) ) ( IS-CRATE ?auto_18416 ) ( not ( = ?auto_18418 ?auto_18423 ) ) ( not ( = ?auto_18427 ?auto_18418 ) ) ( HOIST-AT ?auto_18419 ?auto_18418 ) ( not ( = ?auto_18420 ?auto_18419 ) ) ( not ( = ?auto_18421 ?auto_18419 ) ) ( SURFACE-AT ?auto_18416 ?auto_18418 ) ( ON ?auto_18416 ?auto_18425 ) ( CLEAR ?auto_18416 ) ( not ( = ?auto_18416 ?auto_18425 ) ) ( not ( = ?auto_18417 ?auto_18425 ) ) ( not ( = ?auto_18428 ?auto_18425 ) ) ( not ( = ?auto_18424 ?auto_18425 ) ) ( SURFACE-AT ?auto_18426 ?auto_18423 ) ( CLEAR ?auto_18426 ) ( IS-CRATE ?auto_18428 ) ( not ( = ?auto_18426 ?auto_18428 ) ) ( not ( = ?auto_18416 ?auto_18426 ) ) ( not ( = ?auto_18417 ?auto_18426 ) ) ( not ( = ?auto_18424 ?auto_18426 ) ) ( not ( = ?auto_18425 ?auto_18426 ) ) ( AVAILABLE ?auto_18420 ) ( TRUCK-AT ?auto_18422 ?auto_18418 ) ( LIFTING ?auto_18419 ?auto_18428 ) )
    :subtasks
    ( ( !LOAD ?auto_18419 ?auto_18428 ?auto_18422 ?auto_18418 )
      ( MAKE-2CRATE ?auto_18428 ?auto_18416 ?auto_18417 )
      ( MAKE-1CRATE-VERIFY ?auto_18416 ?auto_18417 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18429 - SURFACE
      ?auto_18430 - SURFACE
      ?auto_18431 - SURFACE
    )
    :vars
    (
      ?auto_18432 - HOIST
      ?auto_18441 - PLACE
      ?auto_18439 - PLACE
      ?auto_18437 - HOIST
      ?auto_18436 - SURFACE
      ?auto_18438 - PLACE
      ?auto_18434 - HOIST
      ?auto_18433 - SURFACE
      ?auto_18440 - SURFACE
      ?auto_18435 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18432 ?auto_18441 ) ( IS-CRATE ?auto_18431 ) ( not ( = ?auto_18430 ?auto_18431 ) ) ( not ( = ?auto_18429 ?auto_18430 ) ) ( not ( = ?auto_18429 ?auto_18431 ) ) ( not ( = ?auto_18439 ?auto_18441 ) ) ( HOIST-AT ?auto_18437 ?auto_18439 ) ( not ( = ?auto_18432 ?auto_18437 ) ) ( AVAILABLE ?auto_18437 ) ( SURFACE-AT ?auto_18431 ?auto_18439 ) ( ON ?auto_18431 ?auto_18436 ) ( CLEAR ?auto_18431 ) ( not ( = ?auto_18430 ?auto_18436 ) ) ( not ( = ?auto_18431 ?auto_18436 ) ) ( not ( = ?auto_18429 ?auto_18436 ) ) ( IS-CRATE ?auto_18430 ) ( not ( = ?auto_18438 ?auto_18441 ) ) ( not ( = ?auto_18439 ?auto_18438 ) ) ( HOIST-AT ?auto_18434 ?auto_18438 ) ( not ( = ?auto_18432 ?auto_18434 ) ) ( not ( = ?auto_18437 ?auto_18434 ) ) ( SURFACE-AT ?auto_18430 ?auto_18438 ) ( ON ?auto_18430 ?auto_18433 ) ( CLEAR ?auto_18430 ) ( not ( = ?auto_18430 ?auto_18433 ) ) ( not ( = ?auto_18431 ?auto_18433 ) ) ( not ( = ?auto_18429 ?auto_18433 ) ) ( not ( = ?auto_18436 ?auto_18433 ) ) ( SURFACE-AT ?auto_18440 ?auto_18441 ) ( CLEAR ?auto_18440 ) ( IS-CRATE ?auto_18429 ) ( not ( = ?auto_18440 ?auto_18429 ) ) ( not ( = ?auto_18430 ?auto_18440 ) ) ( not ( = ?auto_18431 ?auto_18440 ) ) ( not ( = ?auto_18436 ?auto_18440 ) ) ( not ( = ?auto_18433 ?auto_18440 ) ) ( AVAILABLE ?auto_18432 ) ( TRUCK-AT ?auto_18435 ?auto_18438 ) ( LIFTING ?auto_18434 ?auto_18429 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18430 ?auto_18431 )
      ( MAKE-2CRATE-VERIFY ?auto_18429 ?auto_18430 ?auto_18431 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18442 - SURFACE
      ?auto_18443 - SURFACE
      ?auto_18444 - SURFACE
      ?auto_18445 - SURFACE
    )
    :vars
    (
      ?auto_18452 - HOIST
      ?auto_18453 - PLACE
      ?auto_18447 - PLACE
      ?auto_18449 - HOIST
      ?auto_18451 - SURFACE
      ?auto_18448 - PLACE
      ?auto_18450 - HOIST
      ?auto_18454 - SURFACE
      ?auto_18446 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18452 ?auto_18453 ) ( IS-CRATE ?auto_18445 ) ( not ( = ?auto_18444 ?auto_18445 ) ) ( not ( = ?auto_18443 ?auto_18444 ) ) ( not ( = ?auto_18443 ?auto_18445 ) ) ( not ( = ?auto_18447 ?auto_18453 ) ) ( HOIST-AT ?auto_18449 ?auto_18447 ) ( not ( = ?auto_18452 ?auto_18449 ) ) ( AVAILABLE ?auto_18449 ) ( SURFACE-AT ?auto_18445 ?auto_18447 ) ( ON ?auto_18445 ?auto_18451 ) ( CLEAR ?auto_18445 ) ( not ( = ?auto_18444 ?auto_18451 ) ) ( not ( = ?auto_18445 ?auto_18451 ) ) ( not ( = ?auto_18443 ?auto_18451 ) ) ( IS-CRATE ?auto_18444 ) ( not ( = ?auto_18448 ?auto_18453 ) ) ( not ( = ?auto_18447 ?auto_18448 ) ) ( HOIST-AT ?auto_18450 ?auto_18448 ) ( not ( = ?auto_18452 ?auto_18450 ) ) ( not ( = ?auto_18449 ?auto_18450 ) ) ( SURFACE-AT ?auto_18444 ?auto_18448 ) ( ON ?auto_18444 ?auto_18454 ) ( CLEAR ?auto_18444 ) ( not ( = ?auto_18444 ?auto_18454 ) ) ( not ( = ?auto_18445 ?auto_18454 ) ) ( not ( = ?auto_18443 ?auto_18454 ) ) ( not ( = ?auto_18451 ?auto_18454 ) ) ( SURFACE-AT ?auto_18442 ?auto_18453 ) ( CLEAR ?auto_18442 ) ( IS-CRATE ?auto_18443 ) ( not ( = ?auto_18442 ?auto_18443 ) ) ( not ( = ?auto_18444 ?auto_18442 ) ) ( not ( = ?auto_18445 ?auto_18442 ) ) ( not ( = ?auto_18451 ?auto_18442 ) ) ( not ( = ?auto_18454 ?auto_18442 ) ) ( AVAILABLE ?auto_18452 ) ( TRUCK-AT ?auto_18446 ?auto_18448 ) ( LIFTING ?auto_18450 ?auto_18443 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18443 ?auto_18444 ?auto_18445 )
      ( MAKE-3CRATE-VERIFY ?auto_18442 ?auto_18443 ?auto_18444 ?auto_18445 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18455 - SURFACE
      ?auto_18456 - SURFACE
      ?auto_18457 - SURFACE
      ?auto_18458 - SURFACE
      ?auto_18459 - SURFACE
    )
    :vars
    (
      ?auto_18466 - HOIST
      ?auto_18467 - PLACE
      ?auto_18461 - PLACE
      ?auto_18463 - HOIST
      ?auto_18465 - SURFACE
      ?auto_18462 - PLACE
      ?auto_18464 - HOIST
      ?auto_18468 - SURFACE
      ?auto_18460 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18466 ?auto_18467 ) ( IS-CRATE ?auto_18459 ) ( not ( = ?auto_18458 ?auto_18459 ) ) ( not ( = ?auto_18457 ?auto_18458 ) ) ( not ( = ?auto_18457 ?auto_18459 ) ) ( not ( = ?auto_18461 ?auto_18467 ) ) ( HOIST-AT ?auto_18463 ?auto_18461 ) ( not ( = ?auto_18466 ?auto_18463 ) ) ( AVAILABLE ?auto_18463 ) ( SURFACE-AT ?auto_18459 ?auto_18461 ) ( ON ?auto_18459 ?auto_18465 ) ( CLEAR ?auto_18459 ) ( not ( = ?auto_18458 ?auto_18465 ) ) ( not ( = ?auto_18459 ?auto_18465 ) ) ( not ( = ?auto_18457 ?auto_18465 ) ) ( IS-CRATE ?auto_18458 ) ( not ( = ?auto_18462 ?auto_18467 ) ) ( not ( = ?auto_18461 ?auto_18462 ) ) ( HOIST-AT ?auto_18464 ?auto_18462 ) ( not ( = ?auto_18466 ?auto_18464 ) ) ( not ( = ?auto_18463 ?auto_18464 ) ) ( SURFACE-AT ?auto_18458 ?auto_18462 ) ( ON ?auto_18458 ?auto_18468 ) ( CLEAR ?auto_18458 ) ( not ( = ?auto_18458 ?auto_18468 ) ) ( not ( = ?auto_18459 ?auto_18468 ) ) ( not ( = ?auto_18457 ?auto_18468 ) ) ( not ( = ?auto_18465 ?auto_18468 ) ) ( SURFACE-AT ?auto_18456 ?auto_18467 ) ( CLEAR ?auto_18456 ) ( IS-CRATE ?auto_18457 ) ( not ( = ?auto_18456 ?auto_18457 ) ) ( not ( = ?auto_18458 ?auto_18456 ) ) ( not ( = ?auto_18459 ?auto_18456 ) ) ( not ( = ?auto_18465 ?auto_18456 ) ) ( not ( = ?auto_18468 ?auto_18456 ) ) ( AVAILABLE ?auto_18466 ) ( TRUCK-AT ?auto_18460 ?auto_18462 ) ( LIFTING ?auto_18464 ?auto_18457 ) ( ON ?auto_18456 ?auto_18455 ) ( not ( = ?auto_18455 ?auto_18456 ) ) ( not ( = ?auto_18455 ?auto_18457 ) ) ( not ( = ?auto_18455 ?auto_18458 ) ) ( not ( = ?auto_18455 ?auto_18459 ) ) ( not ( = ?auto_18455 ?auto_18465 ) ) ( not ( = ?auto_18455 ?auto_18468 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18457 ?auto_18458 ?auto_18459 )
      ( MAKE-4CRATE-VERIFY ?auto_18455 ?auto_18456 ?auto_18457 ?auto_18458 ?auto_18459 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18469 - SURFACE
      ?auto_18470 - SURFACE
      ?auto_18471 - SURFACE
      ?auto_18472 - SURFACE
      ?auto_18473 - SURFACE
      ?auto_18474 - SURFACE
    )
    :vars
    (
      ?auto_18481 - HOIST
      ?auto_18482 - PLACE
      ?auto_18476 - PLACE
      ?auto_18478 - HOIST
      ?auto_18480 - SURFACE
      ?auto_18477 - PLACE
      ?auto_18479 - HOIST
      ?auto_18483 - SURFACE
      ?auto_18475 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18481 ?auto_18482 ) ( IS-CRATE ?auto_18474 ) ( not ( = ?auto_18473 ?auto_18474 ) ) ( not ( = ?auto_18472 ?auto_18473 ) ) ( not ( = ?auto_18472 ?auto_18474 ) ) ( not ( = ?auto_18476 ?auto_18482 ) ) ( HOIST-AT ?auto_18478 ?auto_18476 ) ( not ( = ?auto_18481 ?auto_18478 ) ) ( AVAILABLE ?auto_18478 ) ( SURFACE-AT ?auto_18474 ?auto_18476 ) ( ON ?auto_18474 ?auto_18480 ) ( CLEAR ?auto_18474 ) ( not ( = ?auto_18473 ?auto_18480 ) ) ( not ( = ?auto_18474 ?auto_18480 ) ) ( not ( = ?auto_18472 ?auto_18480 ) ) ( IS-CRATE ?auto_18473 ) ( not ( = ?auto_18477 ?auto_18482 ) ) ( not ( = ?auto_18476 ?auto_18477 ) ) ( HOIST-AT ?auto_18479 ?auto_18477 ) ( not ( = ?auto_18481 ?auto_18479 ) ) ( not ( = ?auto_18478 ?auto_18479 ) ) ( SURFACE-AT ?auto_18473 ?auto_18477 ) ( ON ?auto_18473 ?auto_18483 ) ( CLEAR ?auto_18473 ) ( not ( = ?auto_18473 ?auto_18483 ) ) ( not ( = ?auto_18474 ?auto_18483 ) ) ( not ( = ?auto_18472 ?auto_18483 ) ) ( not ( = ?auto_18480 ?auto_18483 ) ) ( SURFACE-AT ?auto_18471 ?auto_18482 ) ( CLEAR ?auto_18471 ) ( IS-CRATE ?auto_18472 ) ( not ( = ?auto_18471 ?auto_18472 ) ) ( not ( = ?auto_18473 ?auto_18471 ) ) ( not ( = ?auto_18474 ?auto_18471 ) ) ( not ( = ?auto_18480 ?auto_18471 ) ) ( not ( = ?auto_18483 ?auto_18471 ) ) ( AVAILABLE ?auto_18481 ) ( TRUCK-AT ?auto_18475 ?auto_18477 ) ( LIFTING ?auto_18479 ?auto_18472 ) ( ON ?auto_18470 ?auto_18469 ) ( ON ?auto_18471 ?auto_18470 ) ( not ( = ?auto_18469 ?auto_18470 ) ) ( not ( = ?auto_18469 ?auto_18471 ) ) ( not ( = ?auto_18469 ?auto_18472 ) ) ( not ( = ?auto_18469 ?auto_18473 ) ) ( not ( = ?auto_18469 ?auto_18474 ) ) ( not ( = ?auto_18469 ?auto_18480 ) ) ( not ( = ?auto_18469 ?auto_18483 ) ) ( not ( = ?auto_18470 ?auto_18471 ) ) ( not ( = ?auto_18470 ?auto_18472 ) ) ( not ( = ?auto_18470 ?auto_18473 ) ) ( not ( = ?auto_18470 ?auto_18474 ) ) ( not ( = ?auto_18470 ?auto_18480 ) ) ( not ( = ?auto_18470 ?auto_18483 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18472 ?auto_18473 ?auto_18474 )
      ( MAKE-5CRATE-VERIFY ?auto_18469 ?auto_18470 ?auto_18471 ?auto_18472 ?auto_18473 ?auto_18474 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18484 - SURFACE
      ?auto_18485 - SURFACE
    )
    :vars
    (
      ?auto_18493 - HOIST
      ?auto_18494 - PLACE
      ?auto_18496 - SURFACE
      ?auto_18487 - PLACE
      ?auto_18489 - HOIST
      ?auto_18492 - SURFACE
      ?auto_18488 - PLACE
      ?auto_18491 - HOIST
      ?auto_18495 - SURFACE
      ?auto_18490 - SURFACE
      ?auto_18486 - TRUCK
      ?auto_18497 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18493 ?auto_18494 ) ( IS-CRATE ?auto_18485 ) ( not ( = ?auto_18484 ?auto_18485 ) ) ( not ( = ?auto_18496 ?auto_18484 ) ) ( not ( = ?auto_18496 ?auto_18485 ) ) ( not ( = ?auto_18487 ?auto_18494 ) ) ( HOIST-AT ?auto_18489 ?auto_18487 ) ( not ( = ?auto_18493 ?auto_18489 ) ) ( AVAILABLE ?auto_18489 ) ( SURFACE-AT ?auto_18485 ?auto_18487 ) ( ON ?auto_18485 ?auto_18492 ) ( CLEAR ?auto_18485 ) ( not ( = ?auto_18484 ?auto_18492 ) ) ( not ( = ?auto_18485 ?auto_18492 ) ) ( not ( = ?auto_18496 ?auto_18492 ) ) ( IS-CRATE ?auto_18484 ) ( not ( = ?auto_18488 ?auto_18494 ) ) ( not ( = ?auto_18487 ?auto_18488 ) ) ( HOIST-AT ?auto_18491 ?auto_18488 ) ( not ( = ?auto_18493 ?auto_18491 ) ) ( not ( = ?auto_18489 ?auto_18491 ) ) ( SURFACE-AT ?auto_18484 ?auto_18488 ) ( ON ?auto_18484 ?auto_18495 ) ( CLEAR ?auto_18484 ) ( not ( = ?auto_18484 ?auto_18495 ) ) ( not ( = ?auto_18485 ?auto_18495 ) ) ( not ( = ?auto_18496 ?auto_18495 ) ) ( not ( = ?auto_18492 ?auto_18495 ) ) ( SURFACE-AT ?auto_18490 ?auto_18494 ) ( CLEAR ?auto_18490 ) ( IS-CRATE ?auto_18496 ) ( not ( = ?auto_18490 ?auto_18496 ) ) ( not ( = ?auto_18484 ?auto_18490 ) ) ( not ( = ?auto_18485 ?auto_18490 ) ) ( not ( = ?auto_18492 ?auto_18490 ) ) ( not ( = ?auto_18495 ?auto_18490 ) ) ( AVAILABLE ?auto_18493 ) ( TRUCK-AT ?auto_18486 ?auto_18488 ) ( AVAILABLE ?auto_18491 ) ( SURFACE-AT ?auto_18496 ?auto_18488 ) ( ON ?auto_18496 ?auto_18497 ) ( CLEAR ?auto_18496 ) ( not ( = ?auto_18484 ?auto_18497 ) ) ( not ( = ?auto_18485 ?auto_18497 ) ) ( not ( = ?auto_18496 ?auto_18497 ) ) ( not ( = ?auto_18492 ?auto_18497 ) ) ( not ( = ?auto_18495 ?auto_18497 ) ) ( not ( = ?auto_18490 ?auto_18497 ) ) )
    :subtasks
    ( ( !LIFT ?auto_18491 ?auto_18496 ?auto_18497 ?auto_18488 )
      ( MAKE-2CRATE ?auto_18496 ?auto_18484 ?auto_18485 )
      ( MAKE-1CRATE-VERIFY ?auto_18484 ?auto_18485 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18498 - SURFACE
      ?auto_18499 - SURFACE
      ?auto_18500 - SURFACE
    )
    :vars
    (
      ?auto_18507 - HOIST
      ?auto_18508 - PLACE
      ?auto_18510 - PLACE
      ?auto_18505 - HOIST
      ?auto_18501 - SURFACE
      ?auto_18504 - PLACE
      ?auto_18506 - HOIST
      ?auto_18503 - SURFACE
      ?auto_18502 - SURFACE
      ?auto_18511 - TRUCK
      ?auto_18509 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18507 ?auto_18508 ) ( IS-CRATE ?auto_18500 ) ( not ( = ?auto_18499 ?auto_18500 ) ) ( not ( = ?auto_18498 ?auto_18499 ) ) ( not ( = ?auto_18498 ?auto_18500 ) ) ( not ( = ?auto_18510 ?auto_18508 ) ) ( HOIST-AT ?auto_18505 ?auto_18510 ) ( not ( = ?auto_18507 ?auto_18505 ) ) ( AVAILABLE ?auto_18505 ) ( SURFACE-AT ?auto_18500 ?auto_18510 ) ( ON ?auto_18500 ?auto_18501 ) ( CLEAR ?auto_18500 ) ( not ( = ?auto_18499 ?auto_18501 ) ) ( not ( = ?auto_18500 ?auto_18501 ) ) ( not ( = ?auto_18498 ?auto_18501 ) ) ( IS-CRATE ?auto_18499 ) ( not ( = ?auto_18504 ?auto_18508 ) ) ( not ( = ?auto_18510 ?auto_18504 ) ) ( HOIST-AT ?auto_18506 ?auto_18504 ) ( not ( = ?auto_18507 ?auto_18506 ) ) ( not ( = ?auto_18505 ?auto_18506 ) ) ( SURFACE-AT ?auto_18499 ?auto_18504 ) ( ON ?auto_18499 ?auto_18503 ) ( CLEAR ?auto_18499 ) ( not ( = ?auto_18499 ?auto_18503 ) ) ( not ( = ?auto_18500 ?auto_18503 ) ) ( not ( = ?auto_18498 ?auto_18503 ) ) ( not ( = ?auto_18501 ?auto_18503 ) ) ( SURFACE-AT ?auto_18502 ?auto_18508 ) ( CLEAR ?auto_18502 ) ( IS-CRATE ?auto_18498 ) ( not ( = ?auto_18502 ?auto_18498 ) ) ( not ( = ?auto_18499 ?auto_18502 ) ) ( not ( = ?auto_18500 ?auto_18502 ) ) ( not ( = ?auto_18501 ?auto_18502 ) ) ( not ( = ?auto_18503 ?auto_18502 ) ) ( AVAILABLE ?auto_18507 ) ( TRUCK-AT ?auto_18511 ?auto_18504 ) ( AVAILABLE ?auto_18506 ) ( SURFACE-AT ?auto_18498 ?auto_18504 ) ( ON ?auto_18498 ?auto_18509 ) ( CLEAR ?auto_18498 ) ( not ( = ?auto_18499 ?auto_18509 ) ) ( not ( = ?auto_18500 ?auto_18509 ) ) ( not ( = ?auto_18498 ?auto_18509 ) ) ( not ( = ?auto_18501 ?auto_18509 ) ) ( not ( = ?auto_18503 ?auto_18509 ) ) ( not ( = ?auto_18502 ?auto_18509 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18499 ?auto_18500 )
      ( MAKE-2CRATE-VERIFY ?auto_18498 ?auto_18499 ?auto_18500 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18512 - SURFACE
      ?auto_18513 - SURFACE
      ?auto_18514 - SURFACE
      ?auto_18515 - SURFACE
    )
    :vars
    (
      ?auto_18519 - HOIST
      ?auto_18520 - PLACE
      ?auto_18521 - PLACE
      ?auto_18524 - HOIST
      ?auto_18518 - SURFACE
      ?auto_18523 - PLACE
      ?auto_18516 - HOIST
      ?auto_18517 - SURFACE
      ?auto_18525 - TRUCK
      ?auto_18522 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18519 ?auto_18520 ) ( IS-CRATE ?auto_18515 ) ( not ( = ?auto_18514 ?auto_18515 ) ) ( not ( = ?auto_18513 ?auto_18514 ) ) ( not ( = ?auto_18513 ?auto_18515 ) ) ( not ( = ?auto_18521 ?auto_18520 ) ) ( HOIST-AT ?auto_18524 ?auto_18521 ) ( not ( = ?auto_18519 ?auto_18524 ) ) ( AVAILABLE ?auto_18524 ) ( SURFACE-AT ?auto_18515 ?auto_18521 ) ( ON ?auto_18515 ?auto_18518 ) ( CLEAR ?auto_18515 ) ( not ( = ?auto_18514 ?auto_18518 ) ) ( not ( = ?auto_18515 ?auto_18518 ) ) ( not ( = ?auto_18513 ?auto_18518 ) ) ( IS-CRATE ?auto_18514 ) ( not ( = ?auto_18523 ?auto_18520 ) ) ( not ( = ?auto_18521 ?auto_18523 ) ) ( HOIST-AT ?auto_18516 ?auto_18523 ) ( not ( = ?auto_18519 ?auto_18516 ) ) ( not ( = ?auto_18524 ?auto_18516 ) ) ( SURFACE-AT ?auto_18514 ?auto_18523 ) ( ON ?auto_18514 ?auto_18517 ) ( CLEAR ?auto_18514 ) ( not ( = ?auto_18514 ?auto_18517 ) ) ( not ( = ?auto_18515 ?auto_18517 ) ) ( not ( = ?auto_18513 ?auto_18517 ) ) ( not ( = ?auto_18518 ?auto_18517 ) ) ( SURFACE-AT ?auto_18512 ?auto_18520 ) ( CLEAR ?auto_18512 ) ( IS-CRATE ?auto_18513 ) ( not ( = ?auto_18512 ?auto_18513 ) ) ( not ( = ?auto_18514 ?auto_18512 ) ) ( not ( = ?auto_18515 ?auto_18512 ) ) ( not ( = ?auto_18518 ?auto_18512 ) ) ( not ( = ?auto_18517 ?auto_18512 ) ) ( AVAILABLE ?auto_18519 ) ( TRUCK-AT ?auto_18525 ?auto_18523 ) ( AVAILABLE ?auto_18516 ) ( SURFACE-AT ?auto_18513 ?auto_18523 ) ( ON ?auto_18513 ?auto_18522 ) ( CLEAR ?auto_18513 ) ( not ( = ?auto_18514 ?auto_18522 ) ) ( not ( = ?auto_18515 ?auto_18522 ) ) ( not ( = ?auto_18513 ?auto_18522 ) ) ( not ( = ?auto_18518 ?auto_18522 ) ) ( not ( = ?auto_18517 ?auto_18522 ) ) ( not ( = ?auto_18512 ?auto_18522 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18513 ?auto_18514 ?auto_18515 )
      ( MAKE-3CRATE-VERIFY ?auto_18512 ?auto_18513 ?auto_18514 ?auto_18515 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18526 - SURFACE
      ?auto_18527 - SURFACE
      ?auto_18528 - SURFACE
      ?auto_18529 - SURFACE
      ?auto_18530 - SURFACE
    )
    :vars
    (
      ?auto_18534 - HOIST
      ?auto_18535 - PLACE
      ?auto_18536 - PLACE
      ?auto_18539 - HOIST
      ?auto_18533 - SURFACE
      ?auto_18538 - PLACE
      ?auto_18531 - HOIST
      ?auto_18532 - SURFACE
      ?auto_18540 - TRUCK
      ?auto_18537 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18534 ?auto_18535 ) ( IS-CRATE ?auto_18530 ) ( not ( = ?auto_18529 ?auto_18530 ) ) ( not ( = ?auto_18528 ?auto_18529 ) ) ( not ( = ?auto_18528 ?auto_18530 ) ) ( not ( = ?auto_18536 ?auto_18535 ) ) ( HOIST-AT ?auto_18539 ?auto_18536 ) ( not ( = ?auto_18534 ?auto_18539 ) ) ( AVAILABLE ?auto_18539 ) ( SURFACE-AT ?auto_18530 ?auto_18536 ) ( ON ?auto_18530 ?auto_18533 ) ( CLEAR ?auto_18530 ) ( not ( = ?auto_18529 ?auto_18533 ) ) ( not ( = ?auto_18530 ?auto_18533 ) ) ( not ( = ?auto_18528 ?auto_18533 ) ) ( IS-CRATE ?auto_18529 ) ( not ( = ?auto_18538 ?auto_18535 ) ) ( not ( = ?auto_18536 ?auto_18538 ) ) ( HOIST-AT ?auto_18531 ?auto_18538 ) ( not ( = ?auto_18534 ?auto_18531 ) ) ( not ( = ?auto_18539 ?auto_18531 ) ) ( SURFACE-AT ?auto_18529 ?auto_18538 ) ( ON ?auto_18529 ?auto_18532 ) ( CLEAR ?auto_18529 ) ( not ( = ?auto_18529 ?auto_18532 ) ) ( not ( = ?auto_18530 ?auto_18532 ) ) ( not ( = ?auto_18528 ?auto_18532 ) ) ( not ( = ?auto_18533 ?auto_18532 ) ) ( SURFACE-AT ?auto_18527 ?auto_18535 ) ( CLEAR ?auto_18527 ) ( IS-CRATE ?auto_18528 ) ( not ( = ?auto_18527 ?auto_18528 ) ) ( not ( = ?auto_18529 ?auto_18527 ) ) ( not ( = ?auto_18530 ?auto_18527 ) ) ( not ( = ?auto_18533 ?auto_18527 ) ) ( not ( = ?auto_18532 ?auto_18527 ) ) ( AVAILABLE ?auto_18534 ) ( TRUCK-AT ?auto_18540 ?auto_18538 ) ( AVAILABLE ?auto_18531 ) ( SURFACE-AT ?auto_18528 ?auto_18538 ) ( ON ?auto_18528 ?auto_18537 ) ( CLEAR ?auto_18528 ) ( not ( = ?auto_18529 ?auto_18537 ) ) ( not ( = ?auto_18530 ?auto_18537 ) ) ( not ( = ?auto_18528 ?auto_18537 ) ) ( not ( = ?auto_18533 ?auto_18537 ) ) ( not ( = ?auto_18532 ?auto_18537 ) ) ( not ( = ?auto_18527 ?auto_18537 ) ) ( ON ?auto_18527 ?auto_18526 ) ( not ( = ?auto_18526 ?auto_18527 ) ) ( not ( = ?auto_18526 ?auto_18528 ) ) ( not ( = ?auto_18526 ?auto_18529 ) ) ( not ( = ?auto_18526 ?auto_18530 ) ) ( not ( = ?auto_18526 ?auto_18533 ) ) ( not ( = ?auto_18526 ?auto_18532 ) ) ( not ( = ?auto_18526 ?auto_18537 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18528 ?auto_18529 ?auto_18530 )
      ( MAKE-4CRATE-VERIFY ?auto_18526 ?auto_18527 ?auto_18528 ?auto_18529 ?auto_18530 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18541 - SURFACE
      ?auto_18542 - SURFACE
      ?auto_18543 - SURFACE
      ?auto_18544 - SURFACE
      ?auto_18545 - SURFACE
      ?auto_18546 - SURFACE
    )
    :vars
    (
      ?auto_18550 - HOIST
      ?auto_18551 - PLACE
      ?auto_18552 - PLACE
      ?auto_18555 - HOIST
      ?auto_18549 - SURFACE
      ?auto_18554 - PLACE
      ?auto_18547 - HOIST
      ?auto_18548 - SURFACE
      ?auto_18556 - TRUCK
      ?auto_18553 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18550 ?auto_18551 ) ( IS-CRATE ?auto_18546 ) ( not ( = ?auto_18545 ?auto_18546 ) ) ( not ( = ?auto_18544 ?auto_18545 ) ) ( not ( = ?auto_18544 ?auto_18546 ) ) ( not ( = ?auto_18552 ?auto_18551 ) ) ( HOIST-AT ?auto_18555 ?auto_18552 ) ( not ( = ?auto_18550 ?auto_18555 ) ) ( AVAILABLE ?auto_18555 ) ( SURFACE-AT ?auto_18546 ?auto_18552 ) ( ON ?auto_18546 ?auto_18549 ) ( CLEAR ?auto_18546 ) ( not ( = ?auto_18545 ?auto_18549 ) ) ( not ( = ?auto_18546 ?auto_18549 ) ) ( not ( = ?auto_18544 ?auto_18549 ) ) ( IS-CRATE ?auto_18545 ) ( not ( = ?auto_18554 ?auto_18551 ) ) ( not ( = ?auto_18552 ?auto_18554 ) ) ( HOIST-AT ?auto_18547 ?auto_18554 ) ( not ( = ?auto_18550 ?auto_18547 ) ) ( not ( = ?auto_18555 ?auto_18547 ) ) ( SURFACE-AT ?auto_18545 ?auto_18554 ) ( ON ?auto_18545 ?auto_18548 ) ( CLEAR ?auto_18545 ) ( not ( = ?auto_18545 ?auto_18548 ) ) ( not ( = ?auto_18546 ?auto_18548 ) ) ( not ( = ?auto_18544 ?auto_18548 ) ) ( not ( = ?auto_18549 ?auto_18548 ) ) ( SURFACE-AT ?auto_18543 ?auto_18551 ) ( CLEAR ?auto_18543 ) ( IS-CRATE ?auto_18544 ) ( not ( = ?auto_18543 ?auto_18544 ) ) ( not ( = ?auto_18545 ?auto_18543 ) ) ( not ( = ?auto_18546 ?auto_18543 ) ) ( not ( = ?auto_18549 ?auto_18543 ) ) ( not ( = ?auto_18548 ?auto_18543 ) ) ( AVAILABLE ?auto_18550 ) ( TRUCK-AT ?auto_18556 ?auto_18554 ) ( AVAILABLE ?auto_18547 ) ( SURFACE-AT ?auto_18544 ?auto_18554 ) ( ON ?auto_18544 ?auto_18553 ) ( CLEAR ?auto_18544 ) ( not ( = ?auto_18545 ?auto_18553 ) ) ( not ( = ?auto_18546 ?auto_18553 ) ) ( not ( = ?auto_18544 ?auto_18553 ) ) ( not ( = ?auto_18549 ?auto_18553 ) ) ( not ( = ?auto_18548 ?auto_18553 ) ) ( not ( = ?auto_18543 ?auto_18553 ) ) ( ON ?auto_18542 ?auto_18541 ) ( ON ?auto_18543 ?auto_18542 ) ( not ( = ?auto_18541 ?auto_18542 ) ) ( not ( = ?auto_18541 ?auto_18543 ) ) ( not ( = ?auto_18541 ?auto_18544 ) ) ( not ( = ?auto_18541 ?auto_18545 ) ) ( not ( = ?auto_18541 ?auto_18546 ) ) ( not ( = ?auto_18541 ?auto_18549 ) ) ( not ( = ?auto_18541 ?auto_18548 ) ) ( not ( = ?auto_18541 ?auto_18553 ) ) ( not ( = ?auto_18542 ?auto_18543 ) ) ( not ( = ?auto_18542 ?auto_18544 ) ) ( not ( = ?auto_18542 ?auto_18545 ) ) ( not ( = ?auto_18542 ?auto_18546 ) ) ( not ( = ?auto_18542 ?auto_18549 ) ) ( not ( = ?auto_18542 ?auto_18548 ) ) ( not ( = ?auto_18542 ?auto_18553 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18544 ?auto_18545 ?auto_18546 )
      ( MAKE-5CRATE-VERIFY ?auto_18541 ?auto_18542 ?auto_18543 ?auto_18544 ?auto_18545 ?auto_18546 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18557 - SURFACE
      ?auto_18558 - SURFACE
    )
    :vars
    (
      ?auto_18562 - HOIST
      ?auto_18563 - PLACE
      ?auto_18570 - SURFACE
      ?auto_18564 - PLACE
      ?auto_18567 - HOIST
      ?auto_18561 - SURFACE
      ?auto_18566 - PLACE
      ?auto_18559 - HOIST
      ?auto_18560 - SURFACE
      ?auto_18568 - SURFACE
      ?auto_18565 - SURFACE
      ?auto_18569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18562 ?auto_18563 ) ( IS-CRATE ?auto_18558 ) ( not ( = ?auto_18557 ?auto_18558 ) ) ( not ( = ?auto_18570 ?auto_18557 ) ) ( not ( = ?auto_18570 ?auto_18558 ) ) ( not ( = ?auto_18564 ?auto_18563 ) ) ( HOIST-AT ?auto_18567 ?auto_18564 ) ( not ( = ?auto_18562 ?auto_18567 ) ) ( AVAILABLE ?auto_18567 ) ( SURFACE-AT ?auto_18558 ?auto_18564 ) ( ON ?auto_18558 ?auto_18561 ) ( CLEAR ?auto_18558 ) ( not ( = ?auto_18557 ?auto_18561 ) ) ( not ( = ?auto_18558 ?auto_18561 ) ) ( not ( = ?auto_18570 ?auto_18561 ) ) ( IS-CRATE ?auto_18557 ) ( not ( = ?auto_18566 ?auto_18563 ) ) ( not ( = ?auto_18564 ?auto_18566 ) ) ( HOIST-AT ?auto_18559 ?auto_18566 ) ( not ( = ?auto_18562 ?auto_18559 ) ) ( not ( = ?auto_18567 ?auto_18559 ) ) ( SURFACE-AT ?auto_18557 ?auto_18566 ) ( ON ?auto_18557 ?auto_18560 ) ( CLEAR ?auto_18557 ) ( not ( = ?auto_18557 ?auto_18560 ) ) ( not ( = ?auto_18558 ?auto_18560 ) ) ( not ( = ?auto_18570 ?auto_18560 ) ) ( not ( = ?auto_18561 ?auto_18560 ) ) ( SURFACE-AT ?auto_18568 ?auto_18563 ) ( CLEAR ?auto_18568 ) ( IS-CRATE ?auto_18570 ) ( not ( = ?auto_18568 ?auto_18570 ) ) ( not ( = ?auto_18557 ?auto_18568 ) ) ( not ( = ?auto_18558 ?auto_18568 ) ) ( not ( = ?auto_18561 ?auto_18568 ) ) ( not ( = ?auto_18560 ?auto_18568 ) ) ( AVAILABLE ?auto_18562 ) ( AVAILABLE ?auto_18559 ) ( SURFACE-AT ?auto_18570 ?auto_18566 ) ( ON ?auto_18570 ?auto_18565 ) ( CLEAR ?auto_18570 ) ( not ( = ?auto_18557 ?auto_18565 ) ) ( not ( = ?auto_18558 ?auto_18565 ) ) ( not ( = ?auto_18570 ?auto_18565 ) ) ( not ( = ?auto_18561 ?auto_18565 ) ) ( not ( = ?auto_18560 ?auto_18565 ) ) ( not ( = ?auto_18568 ?auto_18565 ) ) ( TRUCK-AT ?auto_18569 ?auto_18563 ) )
    :subtasks
    ( ( !DRIVE ?auto_18569 ?auto_18563 ?auto_18566 )
      ( MAKE-2CRATE ?auto_18570 ?auto_18557 ?auto_18558 )
      ( MAKE-1CRATE-VERIFY ?auto_18557 ?auto_18558 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18571 - SURFACE
      ?auto_18572 - SURFACE
      ?auto_18573 - SURFACE
    )
    :vars
    (
      ?auto_18576 - HOIST
      ?auto_18583 - PLACE
      ?auto_18580 - PLACE
      ?auto_18582 - HOIST
      ?auto_18584 - SURFACE
      ?auto_18579 - PLACE
      ?auto_18574 - HOIST
      ?auto_18578 - SURFACE
      ?auto_18575 - SURFACE
      ?auto_18577 - SURFACE
      ?auto_18581 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18576 ?auto_18583 ) ( IS-CRATE ?auto_18573 ) ( not ( = ?auto_18572 ?auto_18573 ) ) ( not ( = ?auto_18571 ?auto_18572 ) ) ( not ( = ?auto_18571 ?auto_18573 ) ) ( not ( = ?auto_18580 ?auto_18583 ) ) ( HOIST-AT ?auto_18582 ?auto_18580 ) ( not ( = ?auto_18576 ?auto_18582 ) ) ( AVAILABLE ?auto_18582 ) ( SURFACE-AT ?auto_18573 ?auto_18580 ) ( ON ?auto_18573 ?auto_18584 ) ( CLEAR ?auto_18573 ) ( not ( = ?auto_18572 ?auto_18584 ) ) ( not ( = ?auto_18573 ?auto_18584 ) ) ( not ( = ?auto_18571 ?auto_18584 ) ) ( IS-CRATE ?auto_18572 ) ( not ( = ?auto_18579 ?auto_18583 ) ) ( not ( = ?auto_18580 ?auto_18579 ) ) ( HOIST-AT ?auto_18574 ?auto_18579 ) ( not ( = ?auto_18576 ?auto_18574 ) ) ( not ( = ?auto_18582 ?auto_18574 ) ) ( SURFACE-AT ?auto_18572 ?auto_18579 ) ( ON ?auto_18572 ?auto_18578 ) ( CLEAR ?auto_18572 ) ( not ( = ?auto_18572 ?auto_18578 ) ) ( not ( = ?auto_18573 ?auto_18578 ) ) ( not ( = ?auto_18571 ?auto_18578 ) ) ( not ( = ?auto_18584 ?auto_18578 ) ) ( SURFACE-AT ?auto_18575 ?auto_18583 ) ( CLEAR ?auto_18575 ) ( IS-CRATE ?auto_18571 ) ( not ( = ?auto_18575 ?auto_18571 ) ) ( not ( = ?auto_18572 ?auto_18575 ) ) ( not ( = ?auto_18573 ?auto_18575 ) ) ( not ( = ?auto_18584 ?auto_18575 ) ) ( not ( = ?auto_18578 ?auto_18575 ) ) ( AVAILABLE ?auto_18576 ) ( AVAILABLE ?auto_18574 ) ( SURFACE-AT ?auto_18571 ?auto_18579 ) ( ON ?auto_18571 ?auto_18577 ) ( CLEAR ?auto_18571 ) ( not ( = ?auto_18572 ?auto_18577 ) ) ( not ( = ?auto_18573 ?auto_18577 ) ) ( not ( = ?auto_18571 ?auto_18577 ) ) ( not ( = ?auto_18584 ?auto_18577 ) ) ( not ( = ?auto_18578 ?auto_18577 ) ) ( not ( = ?auto_18575 ?auto_18577 ) ) ( TRUCK-AT ?auto_18581 ?auto_18583 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18572 ?auto_18573 )
      ( MAKE-2CRATE-VERIFY ?auto_18571 ?auto_18572 ?auto_18573 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18585 - SURFACE
      ?auto_18586 - SURFACE
      ?auto_18587 - SURFACE
      ?auto_18588 - SURFACE
    )
    :vars
    (
      ?auto_18594 - HOIST
      ?auto_18596 - PLACE
      ?auto_18598 - PLACE
      ?auto_18589 - HOIST
      ?auto_18595 - SURFACE
      ?auto_18592 - PLACE
      ?auto_18593 - HOIST
      ?auto_18590 - SURFACE
      ?auto_18597 - SURFACE
      ?auto_18591 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18594 ?auto_18596 ) ( IS-CRATE ?auto_18588 ) ( not ( = ?auto_18587 ?auto_18588 ) ) ( not ( = ?auto_18586 ?auto_18587 ) ) ( not ( = ?auto_18586 ?auto_18588 ) ) ( not ( = ?auto_18598 ?auto_18596 ) ) ( HOIST-AT ?auto_18589 ?auto_18598 ) ( not ( = ?auto_18594 ?auto_18589 ) ) ( AVAILABLE ?auto_18589 ) ( SURFACE-AT ?auto_18588 ?auto_18598 ) ( ON ?auto_18588 ?auto_18595 ) ( CLEAR ?auto_18588 ) ( not ( = ?auto_18587 ?auto_18595 ) ) ( not ( = ?auto_18588 ?auto_18595 ) ) ( not ( = ?auto_18586 ?auto_18595 ) ) ( IS-CRATE ?auto_18587 ) ( not ( = ?auto_18592 ?auto_18596 ) ) ( not ( = ?auto_18598 ?auto_18592 ) ) ( HOIST-AT ?auto_18593 ?auto_18592 ) ( not ( = ?auto_18594 ?auto_18593 ) ) ( not ( = ?auto_18589 ?auto_18593 ) ) ( SURFACE-AT ?auto_18587 ?auto_18592 ) ( ON ?auto_18587 ?auto_18590 ) ( CLEAR ?auto_18587 ) ( not ( = ?auto_18587 ?auto_18590 ) ) ( not ( = ?auto_18588 ?auto_18590 ) ) ( not ( = ?auto_18586 ?auto_18590 ) ) ( not ( = ?auto_18595 ?auto_18590 ) ) ( SURFACE-AT ?auto_18585 ?auto_18596 ) ( CLEAR ?auto_18585 ) ( IS-CRATE ?auto_18586 ) ( not ( = ?auto_18585 ?auto_18586 ) ) ( not ( = ?auto_18587 ?auto_18585 ) ) ( not ( = ?auto_18588 ?auto_18585 ) ) ( not ( = ?auto_18595 ?auto_18585 ) ) ( not ( = ?auto_18590 ?auto_18585 ) ) ( AVAILABLE ?auto_18594 ) ( AVAILABLE ?auto_18593 ) ( SURFACE-AT ?auto_18586 ?auto_18592 ) ( ON ?auto_18586 ?auto_18597 ) ( CLEAR ?auto_18586 ) ( not ( = ?auto_18587 ?auto_18597 ) ) ( not ( = ?auto_18588 ?auto_18597 ) ) ( not ( = ?auto_18586 ?auto_18597 ) ) ( not ( = ?auto_18595 ?auto_18597 ) ) ( not ( = ?auto_18590 ?auto_18597 ) ) ( not ( = ?auto_18585 ?auto_18597 ) ) ( TRUCK-AT ?auto_18591 ?auto_18596 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18586 ?auto_18587 ?auto_18588 )
      ( MAKE-3CRATE-VERIFY ?auto_18585 ?auto_18586 ?auto_18587 ?auto_18588 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18599 - SURFACE
      ?auto_18600 - SURFACE
      ?auto_18601 - SURFACE
      ?auto_18602 - SURFACE
      ?auto_18603 - SURFACE
    )
    :vars
    (
      ?auto_18609 - HOIST
      ?auto_18611 - PLACE
      ?auto_18613 - PLACE
      ?auto_18604 - HOIST
      ?auto_18610 - SURFACE
      ?auto_18607 - PLACE
      ?auto_18608 - HOIST
      ?auto_18605 - SURFACE
      ?auto_18612 - SURFACE
      ?auto_18606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18609 ?auto_18611 ) ( IS-CRATE ?auto_18603 ) ( not ( = ?auto_18602 ?auto_18603 ) ) ( not ( = ?auto_18601 ?auto_18602 ) ) ( not ( = ?auto_18601 ?auto_18603 ) ) ( not ( = ?auto_18613 ?auto_18611 ) ) ( HOIST-AT ?auto_18604 ?auto_18613 ) ( not ( = ?auto_18609 ?auto_18604 ) ) ( AVAILABLE ?auto_18604 ) ( SURFACE-AT ?auto_18603 ?auto_18613 ) ( ON ?auto_18603 ?auto_18610 ) ( CLEAR ?auto_18603 ) ( not ( = ?auto_18602 ?auto_18610 ) ) ( not ( = ?auto_18603 ?auto_18610 ) ) ( not ( = ?auto_18601 ?auto_18610 ) ) ( IS-CRATE ?auto_18602 ) ( not ( = ?auto_18607 ?auto_18611 ) ) ( not ( = ?auto_18613 ?auto_18607 ) ) ( HOIST-AT ?auto_18608 ?auto_18607 ) ( not ( = ?auto_18609 ?auto_18608 ) ) ( not ( = ?auto_18604 ?auto_18608 ) ) ( SURFACE-AT ?auto_18602 ?auto_18607 ) ( ON ?auto_18602 ?auto_18605 ) ( CLEAR ?auto_18602 ) ( not ( = ?auto_18602 ?auto_18605 ) ) ( not ( = ?auto_18603 ?auto_18605 ) ) ( not ( = ?auto_18601 ?auto_18605 ) ) ( not ( = ?auto_18610 ?auto_18605 ) ) ( SURFACE-AT ?auto_18600 ?auto_18611 ) ( CLEAR ?auto_18600 ) ( IS-CRATE ?auto_18601 ) ( not ( = ?auto_18600 ?auto_18601 ) ) ( not ( = ?auto_18602 ?auto_18600 ) ) ( not ( = ?auto_18603 ?auto_18600 ) ) ( not ( = ?auto_18610 ?auto_18600 ) ) ( not ( = ?auto_18605 ?auto_18600 ) ) ( AVAILABLE ?auto_18609 ) ( AVAILABLE ?auto_18608 ) ( SURFACE-AT ?auto_18601 ?auto_18607 ) ( ON ?auto_18601 ?auto_18612 ) ( CLEAR ?auto_18601 ) ( not ( = ?auto_18602 ?auto_18612 ) ) ( not ( = ?auto_18603 ?auto_18612 ) ) ( not ( = ?auto_18601 ?auto_18612 ) ) ( not ( = ?auto_18610 ?auto_18612 ) ) ( not ( = ?auto_18605 ?auto_18612 ) ) ( not ( = ?auto_18600 ?auto_18612 ) ) ( TRUCK-AT ?auto_18606 ?auto_18611 ) ( ON ?auto_18600 ?auto_18599 ) ( not ( = ?auto_18599 ?auto_18600 ) ) ( not ( = ?auto_18599 ?auto_18601 ) ) ( not ( = ?auto_18599 ?auto_18602 ) ) ( not ( = ?auto_18599 ?auto_18603 ) ) ( not ( = ?auto_18599 ?auto_18610 ) ) ( not ( = ?auto_18599 ?auto_18605 ) ) ( not ( = ?auto_18599 ?auto_18612 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18601 ?auto_18602 ?auto_18603 )
      ( MAKE-4CRATE-VERIFY ?auto_18599 ?auto_18600 ?auto_18601 ?auto_18602 ?auto_18603 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18614 - SURFACE
      ?auto_18615 - SURFACE
      ?auto_18616 - SURFACE
      ?auto_18617 - SURFACE
      ?auto_18618 - SURFACE
      ?auto_18619 - SURFACE
    )
    :vars
    (
      ?auto_18625 - HOIST
      ?auto_18627 - PLACE
      ?auto_18629 - PLACE
      ?auto_18620 - HOIST
      ?auto_18626 - SURFACE
      ?auto_18623 - PLACE
      ?auto_18624 - HOIST
      ?auto_18621 - SURFACE
      ?auto_18628 - SURFACE
      ?auto_18622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18625 ?auto_18627 ) ( IS-CRATE ?auto_18619 ) ( not ( = ?auto_18618 ?auto_18619 ) ) ( not ( = ?auto_18617 ?auto_18618 ) ) ( not ( = ?auto_18617 ?auto_18619 ) ) ( not ( = ?auto_18629 ?auto_18627 ) ) ( HOIST-AT ?auto_18620 ?auto_18629 ) ( not ( = ?auto_18625 ?auto_18620 ) ) ( AVAILABLE ?auto_18620 ) ( SURFACE-AT ?auto_18619 ?auto_18629 ) ( ON ?auto_18619 ?auto_18626 ) ( CLEAR ?auto_18619 ) ( not ( = ?auto_18618 ?auto_18626 ) ) ( not ( = ?auto_18619 ?auto_18626 ) ) ( not ( = ?auto_18617 ?auto_18626 ) ) ( IS-CRATE ?auto_18618 ) ( not ( = ?auto_18623 ?auto_18627 ) ) ( not ( = ?auto_18629 ?auto_18623 ) ) ( HOIST-AT ?auto_18624 ?auto_18623 ) ( not ( = ?auto_18625 ?auto_18624 ) ) ( not ( = ?auto_18620 ?auto_18624 ) ) ( SURFACE-AT ?auto_18618 ?auto_18623 ) ( ON ?auto_18618 ?auto_18621 ) ( CLEAR ?auto_18618 ) ( not ( = ?auto_18618 ?auto_18621 ) ) ( not ( = ?auto_18619 ?auto_18621 ) ) ( not ( = ?auto_18617 ?auto_18621 ) ) ( not ( = ?auto_18626 ?auto_18621 ) ) ( SURFACE-AT ?auto_18616 ?auto_18627 ) ( CLEAR ?auto_18616 ) ( IS-CRATE ?auto_18617 ) ( not ( = ?auto_18616 ?auto_18617 ) ) ( not ( = ?auto_18618 ?auto_18616 ) ) ( not ( = ?auto_18619 ?auto_18616 ) ) ( not ( = ?auto_18626 ?auto_18616 ) ) ( not ( = ?auto_18621 ?auto_18616 ) ) ( AVAILABLE ?auto_18625 ) ( AVAILABLE ?auto_18624 ) ( SURFACE-AT ?auto_18617 ?auto_18623 ) ( ON ?auto_18617 ?auto_18628 ) ( CLEAR ?auto_18617 ) ( not ( = ?auto_18618 ?auto_18628 ) ) ( not ( = ?auto_18619 ?auto_18628 ) ) ( not ( = ?auto_18617 ?auto_18628 ) ) ( not ( = ?auto_18626 ?auto_18628 ) ) ( not ( = ?auto_18621 ?auto_18628 ) ) ( not ( = ?auto_18616 ?auto_18628 ) ) ( TRUCK-AT ?auto_18622 ?auto_18627 ) ( ON ?auto_18615 ?auto_18614 ) ( ON ?auto_18616 ?auto_18615 ) ( not ( = ?auto_18614 ?auto_18615 ) ) ( not ( = ?auto_18614 ?auto_18616 ) ) ( not ( = ?auto_18614 ?auto_18617 ) ) ( not ( = ?auto_18614 ?auto_18618 ) ) ( not ( = ?auto_18614 ?auto_18619 ) ) ( not ( = ?auto_18614 ?auto_18626 ) ) ( not ( = ?auto_18614 ?auto_18621 ) ) ( not ( = ?auto_18614 ?auto_18628 ) ) ( not ( = ?auto_18615 ?auto_18616 ) ) ( not ( = ?auto_18615 ?auto_18617 ) ) ( not ( = ?auto_18615 ?auto_18618 ) ) ( not ( = ?auto_18615 ?auto_18619 ) ) ( not ( = ?auto_18615 ?auto_18626 ) ) ( not ( = ?auto_18615 ?auto_18621 ) ) ( not ( = ?auto_18615 ?auto_18628 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18617 ?auto_18618 ?auto_18619 )
      ( MAKE-5CRATE-VERIFY ?auto_18614 ?auto_18615 ?auto_18616 ?auto_18617 ?auto_18618 ?auto_18619 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18630 - SURFACE
      ?auto_18631 - SURFACE
    )
    :vars
    (
      ?auto_18637 - HOIST
      ?auto_18639 - PLACE
      ?auto_18643 - SURFACE
      ?auto_18642 - PLACE
      ?auto_18632 - HOIST
      ?auto_18638 - SURFACE
      ?auto_18635 - PLACE
      ?auto_18636 - HOIST
      ?auto_18633 - SURFACE
      ?auto_18640 - SURFACE
      ?auto_18641 - SURFACE
      ?auto_18634 - TRUCK
      ?auto_18644 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18637 ?auto_18639 ) ( IS-CRATE ?auto_18631 ) ( not ( = ?auto_18630 ?auto_18631 ) ) ( not ( = ?auto_18643 ?auto_18630 ) ) ( not ( = ?auto_18643 ?auto_18631 ) ) ( not ( = ?auto_18642 ?auto_18639 ) ) ( HOIST-AT ?auto_18632 ?auto_18642 ) ( not ( = ?auto_18637 ?auto_18632 ) ) ( AVAILABLE ?auto_18632 ) ( SURFACE-AT ?auto_18631 ?auto_18642 ) ( ON ?auto_18631 ?auto_18638 ) ( CLEAR ?auto_18631 ) ( not ( = ?auto_18630 ?auto_18638 ) ) ( not ( = ?auto_18631 ?auto_18638 ) ) ( not ( = ?auto_18643 ?auto_18638 ) ) ( IS-CRATE ?auto_18630 ) ( not ( = ?auto_18635 ?auto_18639 ) ) ( not ( = ?auto_18642 ?auto_18635 ) ) ( HOIST-AT ?auto_18636 ?auto_18635 ) ( not ( = ?auto_18637 ?auto_18636 ) ) ( not ( = ?auto_18632 ?auto_18636 ) ) ( SURFACE-AT ?auto_18630 ?auto_18635 ) ( ON ?auto_18630 ?auto_18633 ) ( CLEAR ?auto_18630 ) ( not ( = ?auto_18630 ?auto_18633 ) ) ( not ( = ?auto_18631 ?auto_18633 ) ) ( not ( = ?auto_18643 ?auto_18633 ) ) ( not ( = ?auto_18638 ?auto_18633 ) ) ( IS-CRATE ?auto_18643 ) ( not ( = ?auto_18640 ?auto_18643 ) ) ( not ( = ?auto_18630 ?auto_18640 ) ) ( not ( = ?auto_18631 ?auto_18640 ) ) ( not ( = ?auto_18638 ?auto_18640 ) ) ( not ( = ?auto_18633 ?auto_18640 ) ) ( AVAILABLE ?auto_18636 ) ( SURFACE-AT ?auto_18643 ?auto_18635 ) ( ON ?auto_18643 ?auto_18641 ) ( CLEAR ?auto_18643 ) ( not ( = ?auto_18630 ?auto_18641 ) ) ( not ( = ?auto_18631 ?auto_18641 ) ) ( not ( = ?auto_18643 ?auto_18641 ) ) ( not ( = ?auto_18638 ?auto_18641 ) ) ( not ( = ?auto_18633 ?auto_18641 ) ) ( not ( = ?auto_18640 ?auto_18641 ) ) ( TRUCK-AT ?auto_18634 ?auto_18639 ) ( SURFACE-AT ?auto_18644 ?auto_18639 ) ( CLEAR ?auto_18644 ) ( LIFTING ?auto_18637 ?auto_18640 ) ( IS-CRATE ?auto_18640 ) ( not ( = ?auto_18644 ?auto_18640 ) ) ( not ( = ?auto_18630 ?auto_18644 ) ) ( not ( = ?auto_18631 ?auto_18644 ) ) ( not ( = ?auto_18643 ?auto_18644 ) ) ( not ( = ?auto_18638 ?auto_18644 ) ) ( not ( = ?auto_18633 ?auto_18644 ) ) ( not ( = ?auto_18641 ?auto_18644 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18644 ?auto_18640 )
      ( MAKE-2CRATE ?auto_18643 ?auto_18630 ?auto_18631 )
      ( MAKE-1CRATE-VERIFY ?auto_18630 ?auto_18631 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18645 - SURFACE
      ?auto_18646 - SURFACE
      ?auto_18647 - SURFACE
    )
    :vars
    (
      ?auto_18658 - HOIST
      ?auto_18649 - PLACE
      ?auto_18657 - PLACE
      ?auto_18654 - HOIST
      ?auto_18655 - SURFACE
      ?auto_18656 - PLACE
      ?auto_18648 - HOIST
      ?auto_18652 - SURFACE
      ?auto_18653 - SURFACE
      ?auto_18650 - SURFACE
      ?auto_18651 - TRUCK
      ?auto_18659 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18658 ?auto_18649 ) ( IS-CRATE ?auto_18647 ) ( not ( = ?auto_18646 ?auto_18647 ) ) ( not ( = ?auto_18645 ?auto_18646 ) ) ( not ( = ?auto_18645 ?auto_18647 ) ) ( not ( = ?auto_18657 ?auto_18649 ) ) ( HOIST-AT ?auto_18654 ?auto_18657 ) ( not ( = ?auto_18658 ?auto_18654 ) ) ( AVAILABLE ?auto_18654 ) ( SURFACE-AT ?auto_18647 ?auto_18657 ) ( ON ?auto_18647 ?auto_18655 ) ( CLEAR ?auto_18647 ) ( not ( = ?auto_18646 ?auto_18655 ) ) ( not ( = ?auto_18647 ?auto_18655 ) ) ( not ( = ?auto_18645 ?auto_18655 ) ) ( IS-CRATE ?auto_18646 ) ( not ( = ?auto_18656 ?auto_18649 ) ) ( not ( = ?auto_18657 ?auto_18656 ) ) ( HOIST-AT ?auto_18648 ?auto_18656 ) ( not ( = ?auto_18658 ?auto_18648 ) ) ( not ( = ?auto_18654 ?auto_18648 ) ) ( SURFACE-AT ?auto_18646 ?auto_18656 ) ( ON ?auto_18646 ?auto_18652 ) ( CLEAR ?auto_18646 ) ( not ( = ?auto_18646 ?auto_18652 ) ) ( not ( = ?auto_18647 ?auto_18652 ) ) ( not ( = ?auto_18645 ?auto_18652 ) ) ( not ( = ?auto_18655 ?auto_18652 ) ) ( IS-CRATE ?auto_18645 ) ( not ( = ?auto_18653 ?auto_18645 ) ) ( not ( = ?auto_18646 ?auto_18653 ) ) ( not ( = ?auto_18647 ?auto_18653 ) ) ( not ( = ?auto_18655 ?auto_18653 ) ) ( not ( = ?auto_18652 ?auto_18653 ) ) ( AVAILABLE ?auto_18648 ) ( SURFACE-AT ?auto_18645 ?auto_18656 ) ( ON ?auto_18645 ?auto_18650 ) ( CLEAR ?auto_18645 ) ( not ( = ?auto_18646 ?auto_18650 ) ) ( not ( = ?auto_18647 ?auto_18650 ) ) ( not ( = ?auto_18645 ?auto_18650 ) ) ( not ( = ?auto_18655 ?auto_18650 ) ) ( not ( = ?auto_18652 ?auto_18650 ) ) ( not ( = ?auto_18653 ?auto_18650 ) ) ( TRUCK-AT ?auto_18651 ?auto_18649 ) ( SURFACE-AT ?auto_18659 ?auto_18649 ) ( CLEAR ?auto_18659 ) ( LIFTING ?auto_18658 ?auto_18653 ) ( IS-CRATE ?auto_18653 ) ( not ( = ?auto_18659 ?auto_18653 ) ) ( not ( = ?auto_18646 ?auto_18659 ) ) ( not ( = ?auto_18647 ?auto_18659 ) ) ( not ( = ?auto_18645 ?auto_18659 ) ) ( not ( = ?auto_18655 ?auto_18659 ) ) ( not ( = ?auto_18652 ?auto_18659 ) ) ( not ( = ?auto_18650 ?auto_18659 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18646 ?auto_18647 )
      ( MAKE-2CRATE-VERIFY ?auto_18645 ?auto_18646 ?auto_18647 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18660 - SURFACE
      ?auto_18661 - SURFACE
      ?auto_18662 - SURFACE
      ?auto_18663 - SURFACE
    )
    :vars
    (
      ?auto_18666 - HOIST
      ?auto_18671 - PLACE
      ?auto_18668 - PLACE
      ?auto_18673 - HOIST
      ?auto_18665 - SURFACE
      ?auto_18669 - PLACE
      ?auto_18670 - HOIST
      ?auto_18672 - SURFACE
      ?auto_18664 - SURFACE
      ?auto_18667 - TRUCK
      ?auto_18674 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18666 ?auto_18671 ) ( IS-CRATE ?auto_18663 ) ( not ( = ?auto_18662 ?auto_18663 ) ) ( not ( = ?auto_18661 ?auto_18662 ) ) ( not ( = ?auto_18661 ?auto_18663 ) ) ( not ( = ?auto_18668 ?auto_18671 ) ) ( HOIST-AT ?auto_18673 ?auto_18668 ) ( not ( = ?auto_18666 ?auto_18673 ) ) ( AVAILABLE ?auto_18673 ) ( SURFACE-AT ?auto_18663 ?auto_18668 ) ( ON ?auto_18663 ?auto_18665 ) ( CLEAR ?auto_18663 ) ( not ( = ?auto_18662 ?auto_18665 ) ) ( not ( = ?auto_18663 ?auto_18665 ) ) ( not ( = ?auto_18661 ?auto_18665 ) ) ( IS-CRATE ?auto_18662 ) ( not ( = ?auto_18669 ?auto_18671 ) ) ( not ( = ?auto_18668 ?auto_18669 ) ) ( HOIST-AT ?auto_18670 ?auto_18669 ) ( not ( = ?auto_18666 ?auto_18670 ) ) ( not ( = ?auto_18673 ?auto_18670 ) ) ( SURFACE-AT ?auto_18662 ?auto_18669 ) ( ON ?auto_18662 ?auto_18672 ) ( CLEAR ?auto_18662 ) ( not ( = ?auto_18662 ?auto_18672 ) ) ( not ( = ?auto_18663 ?auto_18672 ) ) ( not ( = ?auto_18661 ?auto_18672 ) ) ( not ( = ?auto_18665 ?auto_18672 ) ) ( IS-CRATE ?auto_18661 ) ( not ( = ?auto_18660 ?auto_18661 ) ) ( not ( = ?auto_18662 ?auto_18660 ) ) ( not ( = ?auto_18663 ?auto_18660 ) ) ( not ( = ?auto_18665 ?auto_18660 ) ) ( not ( = ?auto_18672 ?auto_18660 ) ) ( AVAILABLE ?auto_18670 ) ( SURFACE-AT ?auto_18661 ?auto_18669 ) ( ON ?auto_18661 ?auto_18664 ) ( CLEAR ?auto_18661 ) ( not ( = ?auto_18662 ?auto_18664 ) ) ( not ( = ?auto_18663 ?auto_18664 ) ) ( not ( = ?auto_18661 ?auto_18664 ) ) ( not ( = ?auto_18665 ?auto_18664 ) ) ( not ( = ?auto_18672 ?auto_18664 ) ) ( not ( = ?auto_18660 ?auto_18664 ) ) ( TRUCK-AT ?auto_18667 ?auto_18671 ) ( SURFACE-AT ?auto_18674 ?auto_18671 ) ( CLEAR ?auto_18674 ) ( LIFTING ?auto_18666 ?auto_18660 ) ( IS-CRATE ?auto_18660 ) ( not ( = ?auto_18674 ?auto_18660 ) ) ( not ( = ?auto_18662 ?auto_18674 ) ) ( not ( = ?auto_18663 ?auto_18674 ) ) ( not ( = ?auto_18661 ?auto_18674 ) ) ( not ( = ?auto_18665 ?auto_18674 ) ) ( not ( = ?auto_18672 ?auto_18674 ) ) ( not ( = ?auto_18664 ?auto_18674 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18661 ?auto_18662 ?auto_18663 )
      ( MAKE-3CRATE-VERIFY ?auto_18660 ?auto_18661 ?auto_18662 ?auto_18663 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18675 - SURFACE
      ?auto_18676 - SURFACE
      ?auto_18677 - SURFACE
      ?auto_18678 - SURFACE
      ?auto_18679 - SURFACE
    )
    :vars
    (
      ?auto_18682 - HOIST
      ?auto_18687 - PLACE
      ?auto_18684 - PLACE
      ?auto_18689 - HOIST
      ?auto_18681 - SURFACE
      ?auto_18685 - PLACE
      ?auto_18686 - HOIST
      ?auto_18688 - SURFACE
      ?auto_18680 - SURFACE
      ?auto_18683 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18682 ?auto_18687 ) ( IS-CRATE ?auto_18679 ) ( not ( = ?auto_18678 ?auto_18679 ) ) ( not ( = ?auto_18677 ?auto_18678 ) ) ( not ( = ?auto_18677 ?auto_18679 ) ) ( not ( = ?auto_18684 ?auto_18687 ) ) ( HOIST-AT ?auto_18689 ?auto_18684 ) ( not ( = ?auto_18682 ?auto_18689 ) ) ( AVAILABLE ?auto_18689 ) ( SURFACE-AT ?auto_18679 ?auto_18684 ) ( ON ?auto_18679 ?auto_18681 ) ( CLEAR ?auto_18679 ) ( not ( = ?auto_18678 ?auto_18681 ) ) ( not ( = ?auto_18679 ?auto_18681 ) ) ( not ( = ?auto_18677 ?auto_18681 ) ) ( IS-CRATE ?auto_18678 ) ( not ( = ?auto_18685 ?auto_18687 ) ) ( not ( = ?auto_18684 ?auto_18685 ) ) ( HOIST-AT ?auto_18686 ?auto_18685 ) ( not ( = ?auto_18682 ?auto_18686 ) ) ( not ( = ?auto_18689 ?auto_18686 ) ) ( SURFACE-AT ?auto_18678 ?auto_18685 ) ( ON ?auto_18678 ?auto_18688 ) ( CLEAR ?auto_18678 ) ( not ( = ?auto_18678 ?auto_18688 ) ) ( not ( = ?auto_18679 ?auto_18688 ) ) ( not ( = ?auto_18677 ?auto_18688 ) ) ( not ( = ?auto_18681 ?auto_18688 ) ) ( IS-CRATE ?auto_18677 ) ( not ( = ?auto_18676 ?auto_18677 ) ) ( not ( = ?auto_18678 ?auto_18676 ) ) ( not ( = ?auto_18679 ?auto_18676 ) ) ( not ( = ?auto_18681 ?auto_18676 ) ) ( not ( = ?auto_18688 ?auto_18676 ) ) ( AVAILABLE ?auto_18686 ) ( SURFACE-AT ?auto_18677 ?auto_18685 ) ( ON ?auto_18677 ?auto_18680 ) ( CLEAR ?auto_18677 ) ( not ( = ?auto_18678 ?auto_18680 ) ) ( not ( = ?auto_18679 ?auto_18680 ) ) ( not ( = ?auto_18677 ?auto_18680 ) ) ( not ( = ?auto_18681 ?auto_18680 ) ) ( not ( = ?auto_18688 ?auto_18680 ) ) ( not ( = ?auto_18676 ?auto_18680 ) ) ( TRUCK-AT ?auto_18683 ?auto_18687 ) ( SURFACE-AT ?auto_18675 ?auto_18687 ) ( CLEAR ?auto_18675 ) ( LIFTING ?auto_18682 ?auto_18676 ) ( IS-CRATE ?auto_18676 ) ( not ( = ?auto_18675 ?auto_18676 ) ) ( not ( = ?auto_18678 ?auto_18675 ) ) ( not ( = ?auto_18679 ?auto_18675 ) ) ( not ( = ?auto_18677 ?auto_18675 ) ) ( not ( = ?auto_18681 ?auto_18675 ) ) ( not ( = ?auto_18688 ?auto_18675 ) ) ( not ( = ?auto_18680 ?auto_18675 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18677 ?auto_18678 ?auto_18679 )
      ( MAKE-4CRATE-VERIFY ?auto_18675 ?auto_18676 ?auto_18677 ?auto_18678 ?auto_18679 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18690 - SURFACE
      ?auto_18691 - SURFACE
      ?auto_18692 - SURFACE
      ?auto_18693 - SURFACE
      ?auto_18694 - SURFACE
      ?auto_18695 - SURFACE
    )
    :vars
    (
      ?auto_18698 - HOIST
      ?auto_18703 - PLACE
      ?auto_18700 - PLACE
      ?auto_18705 - HOIST
      ?auto_18697 - SURFACE
      ?auto_18701 - PLACE
      ?auto_18702 - HOIST
      ?auto_18704 - SURFACE
      ?auto_18696 - SURFACE
      ?auto_18699 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18698 ?auto_18703 ) ( IS-CRATE ?auto_18695 ) ( not ( = ?auto_18694 ?auto_18695 ) ) ( not ( = ?auto_18693 ?auto_18694 ) ) ( not ( = ?auto_18693 ?auto_18695 ) ) ( not ( = ?auto_18700 ?auto_18703 ) ) ( HOIST-AT ?auto_18705 ?auto_18700 ) ( not ( = ?auto_18698 ?auto_18705 ) ) ( AVAILABLE ?auto_18705 ) ( SURFACE-AT ?auto_18695 ?auto_18700 ) ( ON ?auto_18695 ?auto_18697 ) ( CLEAR ?auto_18695 ) ( not ( = ?auto_18694 ?auto_18697 ) ) ( not ( = ?auto_18695 ?auto_18697 ) ) ( not ( = ?auto_18693 ?auto_18697 ) ) ( IS-CRATE ?auto_18694 ) ( not ( = ?auto_18701 ?auto_18703 ) ) ( not ( = ?auto_18700 ?auto_18701 ) ) ( HOIST-AT ?auto_18702 ?auto_18701 ) ( not ( = ?auto_18698 ?auto_18702 ) ) ( not ( = ?auto_18705 ?auto_18702 ) ) ( SURFACE-AT ?auto_18694 ?auto_18701 ) ( ON ?auto_18694 ?auto_18704 ) ( CLEAR ?auto_18694 ) ( not ( = ?auto_18694 ?auto_18704 ) ) ( not ( = ?auto_18695 ?auto_18704 ) ) ( not ( = ?auto_18693 ?auto_18704 ) ) ( not ( = ?auto_18697 ?auto_18704 ) ) ( IS-CRATE ?auto_18693 ) ( not ( = ?auto_18692 ?auto_18693 ) ) ( not ( = ?auto_18694 ?auto_18692 ) ) ( not ( = ?auto_18695 ?auto_18692 ) ) ( not ( = ?auto_18697 ?auto_18692 ) ) ( not ( = ?auto_18704 ?auto_18692 ) ) ( AVAILABLE ?auto_18702 ) ( SURFACE-AT ?auto_18693 ?auto_18701 ) ( ON ?auto_18693 ?auto_18696 ) ( CLEAR ?auto_18693 ) ( not ( = ?auto_18694 ?auto_18696 ) ) ( not ( = ?auto_18695 ?auto_18696 ) ) ( not ( = ?auto_18693 ?auto_18696 ) ) ( not ( = ?auto_18697 ?auto_18696 ) ) ( not ( = ?auto_18704 ?auto_18696 ) ) ( not ( = ?auto_18692 ?auto_18696 ) ) ( TRUCK-AT ?auto_18699 ?auto_18703 ) ( SURFACE-AT ?auto_18691 ?auto_18703 ) ( CLEAR ?auto_18691 ) ( LIFTING ?auto_18698 ?auto_18692 ) ( IS-CRATE ?auto_18692 ) ( not ( = ?auto_18691 ?auto_18692 ) ) ( not ( = ?auto_18694 ?auto_18691 ) ) ( not ( = ?auto_18695 ?auto_18691 ) ) ( not ( = ?auto_18693 ?auto_18691 ) ) ( not ( = ?auto_18697 ?auto_18691 ) ) ( not ( = ?auto_18704 ?auto_18691 ) ) ( not ( = ?auto_18696 ?auto_18691 ) ) ( ON ?auto_18691 ?auto_18690 ) ( not ( = ?auto_18690 ?auto_18691 ) ) ( not ( = ?auto_18690 ?auto_18692 ) ) ( not ( = ?auto_18690 ?auto_18693 ) ) ( not ( = ?auto_18690 ?auto_18694 ) ) ( not ( = ?auto_18690 ?auto_18695 ) ) ( not ( = ?auto_18690 ?auto_18697 ) ) ( not ( = ?auto_18690 ?auto_18704 ) ) ( not ( = ?auto_18690 ?auto_18696 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18693 ?auto_18694 ?auto_18695 )
      ( MAKE-5CRATE-VERIFY ?auto_18690 ?auto_18691 ?auto_18692 ?auto_18693 ?auto_18694 ?auto_18695 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18706 - SURFACE
      ?auto_18707 - SURFACE
    )
    :vars
    (
      ?auto_18711 - HOIST
      ?auto_18716 - PLACE
      ?auto_18720 - SURFACE
      ?auto_18713 - PLACE
      ?auto_18718 - HOIST
      ?auto_18709 - SURFACE
      ?auto_18714 - PLACE
      ?auto_18715 - HOIST
      ?auto_18717 - SURFACE
      ?auto_18710 - SURFACE
      ?auto_18708 - SURFACE
      ?auto_18712 - TRUCK
      ?auto_18719 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18711 ?auto_18716 ) ( IS-CRATE ?auto_18707 ) ( not ( = ?auto_18706 ?auto_18707 ) ) ( not ( = ?auto_18720 ?auto_18706 ) ) ( not ( = ?auto_18720 ?auto_18707 ) ) ( not ( = ?auto_18713 ?auto_18716 ) ) ( HOIST-AT ?auto_18718 ?auto_18713 ) ( not ( = ?auto_18711 ?auto_18718 ) ) ( AVAILABLE ?auto_18718 ) ( SURFACE-AT ?auto_18707 ?auto_18713 ) ( ON ?auto_18707 ?auto_18709 ) ( CLEAR ?auto_18707 ) ( not ( = ?auto_18706 ?auto_18709 ) ) ( not ( = ?auto_18707 ?auto_18709 ) ) ( not ( = ?auto_18720 ?auto_18709 ) ) ( IS-CRATE ?auto_18706 ) ( not ( = ?auto_18714 ?auto_18716 ) ) ( not ( = ?auto_18713 ?auto_18714 ) ) ( HOIST-AT ?auto_18715 ?auto_18714 ) ( not ( = ?auto_18711 ?auto_18715 ) ) ( not ( = ?auto_18718 ?auto_18715 ) ) ( SURFACE-AT ?auto_18706 ?auto_18714 ) ( ON ?auto_18706 ?auto_18717 ) ( CLEAR ?auto_18706 ) ( not ( = ?auto_18706 ?auto_18717 ) ) ( not ( = ?auto_18707 ?auto_18717 ) ) ( not ( = ?auto_18720 ?auto_18717 ) ) ( not ( = ?auto_18709 ?auto_18717 ) ) ( IS-CRATE ?auto_18720 ) ( not ( = ?auto_18710 ?auto_18720 ) ) ( not ( = ?auto_18706 ?auto_18710 ) ) ( not ( = ?auto_18707 ?auto_18710 ) ) ( not ( = ?auto_18709 ?auto_18710 ) ) ( not ( = ?auto_18717 ?auto_18710 ) ) ( AVAILABLE ?auto_18715 ) ( SURFACE-AT ?auto_18720 ?auto_18714 ) ( ON ?auto_18720 ?auto_18708 ) ( CLEAR ?auto_18720 ) ( not ( = ?auto_18706 ?auto_18708 ) ) ( not ( = ?auto_18707 ?auto_18708 ) ) ( not ( = ?auto_18720 ?auto_18708 ) ) ( not ( = ?auto_18709 ?auto_18708 ) ) ( not ( = ?auto_18717 ?auto_18708 ) ) ( not ( = ?auto_18710 ?auto_18708 ) ) ( TRUCK-AT ?auto_18712 ?auto_18716 ) ( SURFACE-AT ?auto_18719 ?auto_18716 ) ( CLEAR ?auto_18719 ) ( IS-CRATE ?auto_18710 ) ( not ( = ?auto_18719 ?auto_18710 ) ) ( not ( = ?auto_18706 ?auto_18719 ) ) ( not ( = ?auto_18707 ?auto_18719 ) ) ( not ( = ?auto_18720 ?auto_18719 ) ) ( not ( = ?auto_18709 ?auto_18719 ) ) ( not ( = ?auto_18717 ?auto_18719 ) ) ( not ( = ?auto_18708 ?auto_18719 ) ) ( AVAILABLE ?auto_18711 ) ( IN ?auto_18710 ?auto_18712 ) )
    :subtasks
    ( ( !UNLOAD ?auto_18711 ?auto_18710 ?auto_18712 ?auto_18716 )
      ( MAKE-2CRATE ?auto_18720 ?auto_18706 ?auto_18707 )
      ( MAKE-1CRATE-VERIFY ?auto_18706 ?auto_18707 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18721 - SURFACE
      ?auto_18722 - SURFACE
      ?auto_18723 - SURFACE
    )
    :vars
    (
      ?auto_18729 - HOIST
      ?auto_18730 - PLACE
      ?auto_18735 - PLACE
      ?auto_18727 - HOIST
      ?auto_18731 - SURFACE
      ?auto_18724 - PLACE
      ?auto_18726 - HOIST
      ?auto_18733 - SURFACE
      ?auto_18732 - SURFACE
      ?auto_18725 - SURFACE
      ?auto_18734 - TRUCK
      ?auto_18728 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18729 ?auto_18730 ) ( IS-CRATE ?auto_18723 ) ( not ( = ?auto_18722 ?auto_18723 ) ) ( not ( = ?auto_18721 ?auto_18722 ) ) ( not ( = ?auto_18721 ?auto_18723 ) ) ( not ( = ?auto_18735 ?auto_18730 ) ) ( HOIST-AT ?auto_18727 ?auto_18735 ) ( not ( = ?auto_18729 ?auto_18727 ) ) ( AVAILABLE ?auto_18727 ) ( SURFACE-AT ?auto_18723 ?auto_18735 ) ( ON ?auto_18723 ?auto_18731 ) ( CLEAR ?auto_18723 ) ( not ( = ?auto_18722 ?auto_18731 ) ) ( not ( = ?auto_18723 ?auto_18731 ) ) ( not ( = ?auto_18721 ?auto_18731 ) ) ( IS-CRATE ?auto_18722 ) ( not ( = ?auto_18724 ?auto_18730 ) ) ( not ( = ?auto_18735 ?auto_18724 ) ) ( HOIST-AT ?auto_18726 ?auto_18724 ) ( not ( = ?auto_18729 ?auto_18726 ) ) ( not ( = ?auto_18727 ?auto_18726 ) ) ( SURFACE-AT ?auto_18722 ?auto_18724 ) ( ON ?auto_18722 ?auto_18733 ) ( CLEAR ?auto_18722 ) ( not ( = ?auto_18722 ?auto_18733 ) ) ( not ( = ?auto_18723 ?auto_18733 ) ) ( not ( = ?auto_18721 ?auto_18733 ) ) ( not ( = ?auto_18731 ?auto_18733 ) ) ( IS-CRATE ?auto_18721 ) ( not ( = ?auto_18732 ?auto_18721 ) ) ( not ( = ?auto_18722 ?auto_18732 ) ) ( not ( = ?auto_18723 ?auto_18732 ) ) ( not ( = ?auto_18731 ?auto_18732 ) ) ( not ( = ?auto_18733 ?auto_18732 ) ) ( AVAILABLE ?auto_18726 ) ( SURFACE-AT ?auto_18721 ?auto_18724 ) ( ON ?auto_18721 ?auto_18725 ) ( CLEAR ?auto_18721 ) ( not ( = ?auto_18722 ?auto_18725 ) ) ( not ( = ?auto_18723 ?auto_18725 ) ) ( not ( = ?auto_18721 ?auto_18725 ) ) ( not ( = ?auto_18731 ?auto_18725 ) ) ( not ( = ?auto_18733 ?auto_18725 ) ) ( not ( = ?auto_18732 ?auto_18725 ) ) ( TRUCK-AT ?auto_18734 ?auto_18730 ) ( SURFACE-AT ?auto_18728 ?auto_18730 ) ( CLEAR ?auto_18728 ) ( IS-CRATE ?auto_18732 ) ( not ( = ?auto_18728 ?auto_18732 ) ) ( not ( = ?auto_18722 ?auto_18728 ) ) ( not ( = ?auto_18723 ?auto_18728 ) ) ( not ( = ?auto_18721 ?auto_18728 ) ) ( not ( = ?auto_18731 ?auto_18728 ) ) ( not ( = ?auto_18733 ?auto_18728 ) ) ( not ( = ?auto_18725 ?auto_18728 ) ) ( AVAILABLE ?auto_18729 ) ( IN ?auto_18732 ?auto_18734 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18722 ?auto_18723 )
      ( MAKE-2CRATE-VERIFY ?auto_18721 ?auto_18722 ?auto_18723 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18736 - SURFACE
      ?auto_18737 - SURFACE
      ?auto_18738 - SURFACE
      ?auto_18739 - SURFACE
    )
    :vars
    (
      ?auto_18743 - HOIST
      ?auto_18748 - PLACE
      ?auto_18746 - PLACE
      ?auto_18749 - HOIST
      ?auto_18747 - SURFACE
      ?auto_18742 - PLACE
      ?auto_18750 - HOIST
      ?auto_18744 - SURFACE
      ?auto_18740 - SURFACE
      ?auto_18741 - TRUCK
      ?auto_18745 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18743 ?auto_18748 ) ( IS-CRATE ?auto_18739 ) ( not ( = ?auto_18738 ?auto_18739 ) ) ( not ( = ?auto_18737 ?auto_18738 ) ) ( not ( = ?auto_18737 ?auto_18739 ) ) ( not ( = ?auto_18746 ?auto_18748 ) ) ( HOIST-AT ?auto_18749 ?auto_18746 ) ( not ( = ?auto_18743 ?auto_18749 ) ) ( AVAILABLE ?auto_18749 ) ( SURFACE-AT ?auto_18739 ?auto_18746 ) ( ON ?auto_18739 ?auto_18747 ) ( CLEAR ?auto_18739 ) ( not ( = ?auto_18738 ?auto_18747 ) ) ( not ( = ?auto_18739 ?auto_18747 ) ) ( not ( = ?auto_18737 ?auto_18747 ) ) ( IS-CRATE ?auto_18738 ) ( not ( = ?auto_18742 ?auto_18748 ) ) ( not ( = ?auto_18746 ?auto_18742 ) ) ( HOIST-AT ?auto_18750 ?auto_18742 ) ( not ( = ?auto_18743 ?auto_18750 ) ) ( not ( = ?auto_18749 ?auto_18750 ) ) ( SURFACE-AT ?auto_18738 ?auto_18742 ) ( ON ?auto_18738 ?auto_18744 ) ( CLEAR ?auto_18738 ) ( not ( = ?auto_18738 ?auto_18744 ) ) ( not ( = ?auto_18739 ?auto_18744 ) ) ( not ( = ?auto_18737 ?auto_18744 ) ) ( not ( = ?auto_18747 ?auto_18744 ) ) ( IS-CRATE ?auto_18737 ) ( not ( = ?auto_18736 ?auto_18737 ) ) ( not ( = ?auto_18738 ?auto_18736 ) ) ( not ( = ?auto_18739 ?auto_18736 ) ) ( not ( = ?auto_18747 ?auto_18736 ) ) ( not ( = ?auto_18744 ?auto_18736 ) ) ( AVAILABLE ?auto_18750 ) ( SURFACE-AT ?auto_18737 ?auto_18742 ) ( ON ?auto_18737 ?auto_18740 ) ( CLEAR ?auto_18737 ) ( not ( = ?auto_18738 ?auto_18740 ) ) ( not ( = ?auto_18739 ?auto_18740 ) ) ( not ( = ?auto_18737 ?auto_18740 ) ) ( not ( = ?auto_18747 ?auto_18740 ) ) ( not ( = ?auto_18744 ?auto_18740 ) ) ( not ( = ?auto_18736 ?auto_18740 ) ) ( TRUCK-AT ?auto_18741 ?auto_18748 ) ( SURFACE-AT ?auto_18745 ?auto_18748 ) ( CLEAR ?auto_18745 ) ( IS-CRATE ?auto_18736 ) ( not ( = ?auto_18745 ?auto_18736 ) ) ( not ( = ?auto_18738 ?auto_18745 ) ) ( not ( = ?auto_18739 ?auto_18745 ) ) ( not ( = ?auto_18737 ?auto_18745 ) ) ( not ( = ?auto_18747 ?auto_18745 ) ) ( not ( = ?auto_18744 ?auto_18745 ) ) ( not ( = ?auto_18740 ?auto_18745 ) ) ( AVAILABLE ?auto_18743 ) ( IN ?auto_18736 ?auto_18741 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18737 ?auto_18738 ?auto_18739 )
      ( MAKE-3CRATE-VERIFY ?auto_18736 ?auto_18737 ?auto_18738 ?auto_18739 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18751 - SURFACE
      ?auto_18752 - SURFACE
      ?auto_18753 - SURFACE
      ?auto_18754 - SURFACE
      ?auto_18755 - SURFACE
    )
    :vars
    (
      ?auto_18759 - HOIST
      ?auto_18763 - PLACE
      ?auto_18761 - PLACE
      ?auto_18764 - HOIST
      ?auto_18762 - SURFACE
      ?auto_18758 - PLACE
      ?auto_18765 - HOIST
      ?auto_18760 - SURFACE
      ?auto_18756 - SURFACE
      ?auto_18757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18759 ?auto_18763 ) ( IS-CRATE ?auto_18755 ) ( not ( = ?auto_18754 ?auto_18755 ) ) ( not ( = ?auto_18753 ?auto_18754 ) ) ( not ( = ?auto_18753 ?auto_18755 ) ) ( not ( = ?auto_18761 ?auto_18763 ) ) ( HOIST-AT ?auto_18764 ?auto_18761 ) ( not ( = ?auto_18759 ?auto_18764 ) ) ( AVAILABLE ?auto_18764 ) ( SURFACE-AT ?auto_18755 ?auto_18761 ) ( ON ?auto_18755 ?auto_18762 ) ( CLEAR ?auto_18755 ) ( not ( = ?auto_18754 ?auto_18762 ) ) ( not ( = ?auto_18755 ?auto_18762 ) ) ( not ( = ?auto_18753 ?auto_18762 ) ) ( IS-CRATE ?auto_18754 ) ( not ( = ?auto_18758 ?auto_18763 ) ) ( not ( = ?auto_18761 ?auto_18758 ) ) ( HOIST-AT ?auto_18765 ?auto_18758 ) ( not ( = ?auto_18759 ?auto_18765 ) ) ( not ( = ?auto_18764 ?auto_18765 ) ) ( SURFACE-AT ?auto_18754 ?auto_18758 ) ( ON ?auto_18754 ?auto_18760 ) ( CLEAR ?auto_18754 ) ( not ( = ?auto_18754 ?auto_18760 ) ) ( not ( = ?auto_18755 ?auto_18760 ) ) ( not ( = ?auto_18753 ?auto_18760 ) ) ( not ( = ?auto_18762 ?auto_18760 ) ) ( IS-CRATE ?auto_18753 ) ( not ( = ?auto_18752 ?auto_18753 ) ) ( not ( = ?auto_18754 ?auto_18752 ) ) ( not ( = ?auto_18755 ?auto_18752 ) ) ( not ( = ?auto_18762 ?auto_18752 ) ) ( not ( = ?auto_18760 ?auto_18752 ) ) ( AVAILABLE ?auto_18765 ) ( SURFACE-AT ?auto_18753 ?auto_18758 ) ( ON ?auto_18753 ?auto_18756 ) ( CLEAR ?auto_18753 ) ( not ( = ?auto_18754 ?auto_18756 ) ) ( not ( = ?auto_18755 ?auto_18756 ) ) ( not ( = ?auto_18753 ?auto_18756 ) ) ( not ( = ?auto_18762 ?auto_18756 ) ) ( not ( = ?auto_18760 ?auto_18756 ) ) ( not ( = ?auto_18752 ?auto_18756 ) ) ( TRUCK-AT ?auto_18757 ?auto_18763 ) ( SURFACE-AT ?auto_18751 ?auto_18763 ) ( CLEAR ?auto_18751 ) ( IS-CRATE ?auto_18752 ) ( not ( = ?auto_18751 ?auto_18752 ) ) ( not ( = ?auto_18754 ?auto_18751 ) ) ( not ( = ?auto_18755 ?auto_18751 ) ) ( not ( = ?auto_18753 ?auto_18751 ) ) ( not ( = ?auto_18762 ?auto_18751 ) ) ( not ( = ?auto_18760 ?auto_18751 ) ) ( not ( = ?auto_18756 ?auto_18751 ) ) ( AVAILABLE ?auto_18759 ) ( IN ?auto_18752 ?auto_18757 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18753 ?auto_18754 ?auto_18755 )
      ( MAKE-4CRATE-VERIFY ?auto_18751 ?auto_18752 ?auto_18753 ?auto_18754 ?auto_18755 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18766 - SURFACE
      ?auto_18767 - SURFACE
      ?auto_18768 - SURFACE
      ?auto_18769 - SURFACE
      ?auto_18770 - SURFACE
      ?auto_18771 - SURFACE
    )
    :vars
    (
      ?auto_18775 - HOIST
      ?auto_18779 - PLACE
      ?auto_18777 - PLACE
      ?auto_18780 - HOIST
      ?auto_18778 - SURFACE
      ?auto_18774 - PLACE
      ?auto_18781 - HOIST
      ?auto_18776 - SURFACE
      ?auto_18772 - SURFACE
      ?auto_18773 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18775 ?auto_18779 ) ( IS-CRATE ?auto_18771 ) ( not ( = ?auto_18770 ?auto_18771 ) ) ( not ( = ?auto_18769 ?auto_18770 ) ) ( not ( = ?auto_18769 ?auto_18771 ) ) ( not ( = ?auto_18777 ?auto_18779 ) ) ( HOIST-AT ?auto_18780 ?auto_18777 ) ( not ( = ?auto_18775 ?auto_18780 ) ) ( AVAILABLE ?auto_18780 ) ( SURFACE-AT ?auto_18771 ?auto_18777 ) ( ON ?auto_18771 ?auto_18778 ) ( CLEAR ?auto_18771 ) ( not ( = ?auto_18770 ?auto_18778 ) ) ( not ( = ?auto_18771 ?auto_18778 ) ) ( not ( = ?auto_18769 ?auto_18778 ) ) ( IS-CRATE ?auto_18770 ) ( not ( = ?auto_18774 ?auto_18779 ) ) ( not ( = ?auto_18777 ?auto_18774 ) ) ( HOIST-AT ?auto_18781 ?auto_18774 ) ( not ( = ?auto_18775 ?auto_18781 ) ) ( not ( = ?auto_18780 ?auto_18781 ) ) ( SURFACE-AT ?auto_18770 ?auto_18774 ) ( ON ?auto_18770 ?auto_18776 ) ( CLEAR ?auto_18770 ) ( not ( = ?auto_18770 ?auto_18776 ) ) ( not ( = ?auto_18771 ?auto_18776 ) ) ( not ( = ?auto_18769 ?auto_18776 ) ) ( not ( = ?auto_18778 ?auto_18776 ) ) ( IS-CRATE ?auto_18769 ) ( not ( = ?auto_18768 ?auto_18769 ) ) ( not ( = ?auto_18770 ?auto_18768 ) ) ( not ( = ?auto_18771 ?auto_18768 ) ) ( not ( = ?auto_18778 ?auto_18768 ) ) ( not ( = ?auto_18776 ?auto_18768 ) ) ( AVAILABLE ?auto_18781 ) ( SURFACE-AT ?auto_18769 ?auto_18774 ) ( ON ?auto_18769 ?auto_18772 ) ( CLEAR ?auto_18769 ) ( not ( = ?auto_18770 ?auto_18772 ) ) ( not ( = ?auto_18771 ?auto_18772 ) ) ( not ( = ?auto_18769 ?auto_18772 ) ) ( not ( = ?auto_18778 ?auto_18772 ) ) ( not ( = ?auto_18776 ?auto_18772 ) ) ( not ( = ?auto_18768 ?auto_18772 ) ) ( TRUCK-AT ?auto_18773 ?auto_18779 ) ( SURFACE-AT ?auto_18767 ?auto_18779 ) ( CLEAR ?auto_18767 ) ( IS-CRATE ?auto_18768 ) ( not ( = ?auto_18767 ?auto_18768 ) ) ( not ( = ?auto_18770 ?auto_18767 ) ) ( not ( = ?auto_18771 ?auto_18767 ) ) ( not ( = ?auto_18769 ?auto_18767 ) ) ( not ( = ?auto_18778 ?auto_18767 ) ) ( not ( = ?auto_18776 ?auto_18767 ) ) ( not ( = ?auto_18772 ?auto_18767 ) ) ( AVAILABLE ?auto_18775 ) ( IN ?auto_18768 ?auto_18773 ) ( ON ?auto_18767 ?auto_18766 ) ( not ( = ?auto_18766 ?auto_18767 ) ) ( not ( = ?auto_18766 ?auto_18768 ) ) ( not ( = ?auto_18766 ?auto_18769 ) ) ( not ( = ?auto_18766 ?auto_18770 ) ) ( not ( = ?auto_18766 ?auto_18771 ) ) ( not ( = ?auto_18766 ?auto_18778 ) ) ( not ( = ?auto_18766 ?auto_18776 ) ) ( not ( = ?auto_18766 ?auto_18772 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18769 ?auto_18770 ?auto_18771 )
      ( MAKE-5CRATE-VERIFY ?auto_18766 ?auto_18767 ?auto_18768 ?auto_18769 ?auto_18770 ?auto_18771 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18782 - SURFACE
      ?auto_18783 - SURFACE
    )
    :vars
    (
      ?auto_18787 - HOIST
      ?auto_18793 - PLACE
      ?auto_18796 - SURFACE
      ?auto_18790 - PLACE
      ?auto_18794 - HOIST
      ?auto_18792 - SURFACE
      ?auto_18786 - PLACE
      ?auto_18795 - HOIST
      ?auto_18788 - SURFACE
      ?auto_18791 - SURFACE
      ?auto_18784 - SURFACE
      ?auto_18789 - SURFACE
      ?auto_18785 - TRUCK
      ?auto_18797 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18787 ?auto_18793 ) ( IS-CRATE ?auto_18783 ) ( not ( = ?auto_18782 ?auto_18783 ) ) ( not ( = ?auto_18796 ?auto_18782 ) ) ( not ( = ?auto_18796 ?auto_18783 ) ) ( not ( = ?auto_18790 ?auto_18793 ) ) ( HOIST-AT ?auto_18794 ?auto_18790 ) ( not ( = ?auto_18787 ?auto_18794 ) ) ( AVAILABLE ?auto_18794 ) ( SURFACE-AT ?auto_18783 ?auto_18790 ) ( ON ?auto_18783 ?auto_18792 ) ( CLEAR ?auto_18783 ) ( not ( = ?auto_18782 ?auto_18792 ) ) ( not ( = ?auto_18783 ?auto_18792 ) ) ( not ( = ?auto_18796 ?auto_18792 ) ) ( IS-CRATE ?auto_18782 ) ( not ( = ?auto_18786 ?auto_18793 ) ) ( not ( = ?auto_18790 ?auto_18786 ) ) ( HOIST-AT ?auto_18795 ?auto_18786 ) ( not ( = ?auto_18787 ?auto_18795 ) ) ( not ( = ?auto_18794 ?auto_18795 ) ) ( SURFACE-AT ?auto_18782 ?auto_18786 ) ( ON ?auto_18782 ?auto_18788 ) ( CLEAR ?auto_18782 ) ( not ( = ?auto_18782 ?auto_18788 ) ) ( not ( = ?auto_18783 ?auto_18788 ) ) ( not ( = ?auto_18796 ?auto_18788 ) ) ( not ( = ?auto_18792 ?auto_18788 ) ) ( IS-CRATE ?auto_18796 ) ( not ( = ?auto_18791 ?auto_18796 ) ) ( not ( = ?auto_18782 ?auto_18791 ) ) ( not ( = ?auto_18783 ?auto_18791 ) ) ( not ( = ?auto_18792 ?auto_18791 ) ) ( not ( = ?auto_18788 ?auto_18791 ) ) ( AVAILABLE ?auto_18795 ) ( SURFACE-AT ?auto_18796 ?auto_18786 ) ( ON ?auto_18796 ?auto_18784 ) ( CLEAR ?auto_18796 ) ( not ( = ?auto_18782 ?auto_18784 ) ) ( not ( = ?auto_18783 ?auto_18784 ) ) ( not ( = ?auto_18796 ?auto_18784 ) ) ( not ( = ?auto_18792 ?auto_18784 ) ) ( not ( = ?auto_18788 ?auto_18784 ) ) ( not ( = ?auto_18791 ?auto_18784 ) ) ( SURFACE-AT ?auto_18789 ?auto_18793 ) ( CLEAR ?auto_18789 ) ( IS-CRATE ?auto_18791 ) ( not ( = ?auto_18789 ?auto_18791 ) ) ( not ( = ?auto_18782 ?auto_18789 ) ) ( not ( = ?auto_18783 ?auto_18789 ) ) ( not ( = ?auto_18796 ?auto_18789 ) ) ( not ( = ?auto_18792 ?auto_18789 ) ) ( not ( = ?auto_18788 ?auto_18789 ) ) ( not ( = ?auto_18784 ?auto_18789 ) ) ( AVAILABLE ?auto_18787 ) ( IN ?auto_18791 ?auto_18785 ) ( TRUCK-AT ?auto_18785 ?auto_18797 ) ( not ( = ?auto_18797 ?auto_18793 ) ) ( not ( = ?auto_18790 ?auto_18797 ) ) ( not ( = ?auto_18786 ?auto_18797 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18785 ?auto_18797 ?auto_18793 )
      ( MAKE-2CRATE ?auto_18796 ?auto_18782 ?auto_18783 )
      ( MAKE-1CRATE-VERIFY ?auto_18782 ?auto_18783 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18798 - SURFACE
      ?auto_18799 - SURFACE
      ?auto_18800 - SURFACE
    )
    :vars
    (
      ?auto_18803 - HOIST
      ?auto_18808 - PLACE
      ?auto_18811 - PLACE
      ?auto_18807 - HOIST
      ?auto_18802 - SURFACE
      ?auto_18809 - PLACE
      ?auto_18804 - HOIST
      ?auto_18806 - SURFACE
      ?auto_18810 - SURFACE
      ?auto_18813 - SURFACE
      ?auto_18805 - SURFACE
      ?auto_18801 - TRUCK
      ?auto_18812 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18803 ?auto_18808 ) ( IS-CRATE ?auto_18800 ) ( not ( = ?auto_18799 ?auto_18800 ) ) ( not ( = ?auto_18798 ?auto_18799 ) ) ( not ( = ?auto_18798 ?auto_18800 ) ) ( not ( = ?auto_18811 ?auto_18808 ) ) ( HOIST-AT ?auto_18807 ?auto_18811 ) ( not ( = ?auto_18803 ?auto_18807 ) ) ( AVAILABLE ?auto_18807 ) ( SURFACE-AT ?auto_18800 ?auto_18811 ) ( ON ?auto_18800 ?auto_18802 ) ( CLEAR ?auto_18800 ) ( not ( = ?auto_18799 ?auto_18802 ) ) ( not ( = ?auto_18800 ?auto_18802 ) ) ( not ( = ?auto_18798 ?auto_18802 ) ) ( IS-CRATE ?auto_18799 ) ( not ( = ?auto_18809 ?auto_18808 ) ) ( not ( = ?auto_18811 ?auto_18809 ) ) ( HOIST-AT ?auto_18804 ?auto_18809 ) ( not ( = ?auto_18803 ?auto_18804 ) ) ( not ( = ?auto_18807 ?auto_18804 ) ) ( SURFACE-AT ?auto_18799 ?auto_18809 ) ( ON ?auto_18799 ?auto_18806 ) ( CLEAR ?auto_18799 ) ( not ( = ?auto_18799 ?auto_18806 ) ) ( not ( = ?auto_18800 ?auto_18806 ) ) ( not ( = ?auto_18798 ?auto_18806 ) ) ( not ( = ?auto_18802 ?auto_18806 ) ) ( IS-CRATE ?auto_18798 ) ( not ( = ?auto_18810 ?auto_18798 ) ) ( not ( = ?auto_18799 ?auto_18810 ) ) ( not ( = ?auto_18800 ?auto_18810 ) ) ( not ( = ?auto_18802 ?auto_18810 ) ) ( not ( = ?auto_18806 ?auto_18810 ) ) ( AVAILABLE ?auto_18804 ) ( SURFACE-AT ?auto_18798 ?auto_18809 ) ( ON ?auto_18798 ?auto_18813 ) ( CLEAR ?auto_18798 ) ( not ( = ?auto_18799 ?auto_18813 ) ) ( not ( = ?auto_18800 ?auto_18813 ) ) ( not ( = ?auto_18798 ?auto_18813 ) ) ( not ( = ?auto_18802 ?auto_18813 ) ) ( not ( = ?auto_18806 ?auto_18813 ) ) ( not ( = ?auto_18810 ?auto_18813 ) ) ( SURFACE-AT ?auto_18805 ?auto_18808 ) ( CLEAR ?auto_18805 ) ( IS-CRATE ?auto_18810 ) ( not ( = ?auto_18805 ?auto_18810 ) ) ( not ( = ?auto_18799 ?auto_18805 ) ) ( not ( = ?auto_18800 ?auto_18805 ) ) ( not ( = ?auto_18798 ?auto_18805 ) ) ( not ( = ?auto_18802 ?auto_18805 ) ) ( not ( = ?auto_18806 ?auto_18805 ) ) ( not ( = ?auto_18813 ?auto_18805 ) ) ( AVAILABLE ?auto_18803 ) ( IN ?auto_18810 ?auto_18801 ) ( TRUCK-AT ?auto_18801 ?auto_18812 ) ( not ( = ?auto_18812 ?auto_18808 ) ) ( not ( = ?auto_18811 ?auto_18812 ) ) ( not ( = ?auto_18809 ?auto_18812 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18799 ?auto_18800 )
      ( MAKE-2CRATE-VERIFY ?auto_18798 ?auto_18799 ?auto_18800 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18814 - SURFACE
      ?auto_18815 - SURFACE
      ?auto_18816 - SURFACE
      ?auto_18817 - SURFACE
    )
    :vars
    (
      ?auto_18824 - HOIST
      ?auto_18826 - PLACE
      ?auto_18829 - PLACE
      ?auto_18825 - HOIST
      ?auto_18818 - SURFACE
      ?auto_18820 - PLACE
      ?auto_18827 - HOIST
      ?auto_18819 - SURFACE
      ?auto_18823 - SURFACE
      ?auto_18828 - SURFACE
      ?auto_18821 - TRUCK
      ?auto_18822 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18824 ?auto_18826 ) ( IS-CRATE ?auto_18817 ) ( not ( = ?auto_18816 ?auto_18817 ) ) ( not ( = ?auto_18815 ?auto_18816 ) ) ( not ( = ?auto_18815 ?auto_18817 ) ) ( not ( = ?auto_18829 ?auto_18826 ) ) ( HOIST-AT ?auto_18825 ?auto_18829 ) ( not ( = ?auto_18824 ?auto_18825 ) ) ( AVAILABLE ?auto_18825 ) ( SURFACE-AT ?auto_18817 ?auto_18829 ) ( ON ?auto_18817 ?auto_18818 ) ( CLEAR ?auto_18817 ) ( not ( = ?auto_18816 ?auto_18818 ) ) ( not ( = ?auto_18817 ?auto_18818 ) ) ( not ( = ?auto_18815 ?auto_18818 ) ) ( IS-CRATE ?auto_18816 ) ( not ( = ?auto_18820 ?auto_18826 ) ) ( not ( = ?auto_18829 ?auto_18820 ) ) ( HOIST-AT ?auto_18827 ?auto_18820 ) ( not ( = ?auto_18824 ?auto_18827 ) ) ( not ( = ?auto_18825 ?auto_18827 ) ) ( SURFACE-AT ?auto_18816 ?auto_18820 ) ( ON ?auto_18816 ?auto_18819 ) ( CLEAR ?auto_18816 ) ( not ( = ?auto_18816 ?auto_18819 ) ) ( not ( = ?auto_18817 ?auto_18819 ) ) ( not ( = ?auto_18815 ?auto_18819 ) ) ( not ( = ?auto_18818 ?auto_18819 ) ) ( IS-CRATE ?auto_18815 ) ( not ( = ?auto_18814 ?auto_18815 ) ) ( not ( = ?auto_18816 ?auto_18814 ) ) ( not ( = ?auto_18817 ?auto_18814 ) ) ( not ( = ?auto_18818 ?auto_18814 ) ) ( not ( = ?auto_18819 ?auto_18814 ) ) ( AVAILABLE ?auto_18827 ) ( SURFACE-AT ?auto_18815 ?auto_18820 ) ( ON ?auto_18815 ?auto_18823 ) ( CLEAR ?auto_18815 ) ( not ( = ?auto_18816 ?auto_18823 ) ) ( not ( = ?auto_18817 ?auto_18823 ) ) ( not ( = ?auto_18815 ?auto_18823 ) ) ( not ( = ?auto_18818 ?auto_18823 ) ) ( not ( = ?auto_18819 ?auto_18823 ) ) ( not ( = ?auto_18814 ?auto_18823 ) ) ( SURFACE-AT ?auto_18828 ?auto_18826 ) ( CLEAR ?auto_18828 ) ( IS-CRATE ?auto_18814 ) ( not ( = ?auto_18828 ?auto_18814 ) ) ( not ( = ?auto_18816 ?auto_18828 ) ) ( not ( = ?auto_18817 ?auto_18828 ) ) ( not ( = ?auto_18815 ?auto_18828 ) ) ( not ( = ?auto_18818 ?auto_18828 ) ) ( not ( = ?auto_18819 ?auto_18828 ) ) ( not ( = ?auto_18823 ?auto_18828 ) ) ( AVAILABLE ?auto_18824 ) ( IN ?auto_18814 ?auto_18821 ) ( TRUCK-AT ?auto_18821 ?auto_18822 ) ( not ( = ?auto_18822 ?auto_18826 ) ) ( not ( = ?auto_18829 ?auto_18822 ) ) ( not ( = ?auto_18820 ?auto_18822 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18815 ?auto_18816 ?auto_18817 )
      ( MAKE-3CRATE-VERIFY ?auto_18814 ?auto_18815 ?auto_18816 ?auto_18817 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18830 - SURFACE
      ?auto_18831 - SURFACE
      ?auto_18832 - SURFACE
      ?auto_18833 - SURFACE
      ?auto_18834 - SURFACE
    )
    :vars
    (
      ?auto_18841 - HOIST
      ?auto_18843 - PLACE
      ?auto_18845 - PLACE
      ?auto_18842 - HOIST
      ?auto_18835 - SURFACE
      ?auto_18837 - PLACE
      ?auto_18844 - HOIST
      ?auto_18836 - SURFACE
      ?auto_18840 - SURFACE
      ?auto_18838 - TRUCK
      ?auto_18839 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18841 ?auto_18843 ) ( IS-CRATE ?auto_18834 ) ( not ( = ?auto_18833 ?auto_18834 ) ) ( not ( = ?auto_18832 ?auto_18833 ) ) ( not ( = ?auto_18832 ?auto_18834 ) ) ( not ( = ?auto_18845 ?auto_18843 ) ) ( HOIST-AT ?auto_18842 ?auto_18845 ) ( not ( = ?auto_18841 ?auto_18842 ) ) ( AVAILABLE ?auto_18842 ) ( SURFACE-AT ?auto_18834 ?auto_18845 ) ( ON ?auto_18834 ?auto_18835 ) ( CLEAR ?auto_18834 ) ( not ( = ?auto_18833 ?auto_18835 ) ) ( not ( = ?auto_18834 ?auto_18835 ) ) ( not ( = ?auto_18832 ?auto_18835 ) ) ( IS-CRATE ?auto_18833 ) ( not ( = ?auto_18837 ?auto_18843 ) ) ( not ( = ?auto_18845 ?auto_18837 ) ) ( HOIST-AT ?auto_18844 ?auto_18837 ) ( not ( = ?auto_18841 ?auto_18844 ) ) ( not ( = ?auto_18842 ?auto_18844 ) ) ( SURFACE-AT ?auto_18833 ?auto_18837 ) ( ON ?auto_18833 ?auto_18836 ) ( CLEAR ?auto_18833 ) ( not ( = ?auto_18833 ?auto_18836 ) ) ( not ( = ?auto_18834 ?auto_18836 ) ) ( not ( = ?auto_18832 ?auto_18836 ) ) ( not ( = ?auto_18835 ?auto_18836 ) ) ( IS-CRATE ?auto_18832 ) ( not ( = ?auto_18831 ?auto_18832 ) ) ( not ( = ?auto_18833 ?auto_18831 ) ) ( not ( = ?auto_18834 ?auto_18831 ) ) ( not ( = ?auto_18835 ?auto_18831 ) ) ( not ( = ?auto_18836 ?auto_18831 ) ) ( AVAILABLE ?auto_18844 ) ( SURFACE-AT ?auto_18832 ?auto_18837 ) ( ON ?auto_18832 ?auto_18840 ) ( CLEAR ?auto_18832 ) ( not ( = ?auto_18833 ?auto_18840 ) ) ( not ( = ?auto_18834 ?auto_18840 ) ) ( not ( = ?auto_18832 ?auto_18840 ) ) ( not ( = ?auto_18835 ?auto_18840 ) ) ( not ( = ?auto_18836 ?auto_18840 ) ) ( not ( = ?auto_18831 ?auto_18840 ) ) ( SURFACE-AT ?auto_18830 ?auto_18843 ) ( CLEAR ?auto_18830 ) ( IS-CRATE ?auto_18831 ) ( not ( = ?auto_18830 ?auto_18831 ) ) ( not ( = ?auto_18833 ?auto_18830 ) ) ( not ( = ?auto_18834 ?auto_18830 ) ) ( not ( = ?auto_18832 ?auto_18830 ) ) ( not ( = ?auto_18835 ?auto_18830 ) ) ( not ( = ?auto_18836 ?auto_18830 ) ) ( not ( = ?auto_18840 ?auto_18830 ) ) ( AVAILABLE ?auto_18841 ) ( IN ?auto_18831 ?auto_18838 ) ( TRUCK-AT ?auto_18838 ?auto_18839 ) ( not ( = ?auto_18839 ?auto_18843 ) ) ( not ( = ?auto_18845 ?auto_18839 ) ) ( not ( = ?auto_18837 ?auto_18839 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18832 ?auto_18833 ?auto_18834 )
      ( MAKE-4CRATE-VERIFY ?auto_18830 ?auto_18831 ?auto_18832 ?auto_18833 ?auto_18834 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18846 - SURFACE
      ?auto_18847 - SURFACE
      ?auto_18848 - SURFACE
      ?auto_18849 - SURFACE
      ?auto_18850 - SURFACE
      ?auto_18851 - SURFACE
    )
    :vars
    (
      ?auto_18858 - HOIST
      ?auto_18860 - PLACE
      ?auto_18862 - PLACE
      ?auto_18859 - HOIST
      ?auto_18852 - SURFACE
      ?auto_18854 - PLACE
      ?auto_18861 - HOIST
      ?auto_18853 - SURFACE
      ?auto_18857 - SURFACE
      ?auto_18855 - TRUCK
      ?auto_18856 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18858 ?auto_18860 ) ( IS-CRATE ?auto_18851 ) ( not ( = ?auto_18850 ?auto_18851 ) ) ( not ( = ?auto_18849 ?auto_18850 ) ) ( not ( = ?auto_18849 ?auto_18851 ) ) ( not ( = ?auto_18862 ?auto_18860 ) ) ( HOIST-AT ?auto_18859 ?auto_18862 ) ( not ( = ?auto_18858 ?auto_18859 ) ) ( AVAILABLE ?auto_18859 ) ( SURFACE-AT ?auto_18851 ?auto_18862 ) ( ON ?auto_18851 ?auto_18852 ) ( CLEAR ?auto_18851 ) ( not ( = ?auto_18850 ?auto_18852 ) ) ( not ( = ?auto_18851 ?auto_18852 ) ) ( not ( = ?auto_18849 ?auto_18852 ) ) ( IS-CRATE ?auto_18850 ) ( not ( = ?auto_18854 ?auto_18860 ) ) ( not ( = ?auto_18862 ?auto_18854 ) ) ( HOIST-AT ?auto_18861 ?auto_18854 ) ( not ( = ?auto_18858 ?auto_18861 ) ) ( not ( = ?auto_18859 ?auto_18861 ) ) ( SURFACE-AT ?auto_18850 ?auto_18854 ) ( ON ?auto_18850 ?auto_18853 ) ( CLEAR ?auto_18850 ) ( not ( = ?auto_18850 ?auto_18853 ) ) ( not ( = ?auto_18851 ?auto_18853 ) ) ( not ( = ?auto_18849 ?auto_18853 ) ) ( not ( = ?auto_18852 ?auto_18853 ) ) ( IS-CRATE ?auto_18849 ) ( not ( = ?auto_18848 ?auto_18849 ) ) ( not ( = ?auto_18850 ?auto_18848 ) ) ( not ( = ?auto_18851 ?auto_18848 ) ) ( not ( = ?auto_18852 ?auto_18848 ) ) ( not ( = ?auto_18853 ?auto_18848 ) ) ( AVAILABLE ?auto_18861 ) ( SURFACE-AT ?auto_18849 ?auto_18854 ) ( ON ?auto_18849 ?auto_18857 ) ( CLEAR ?auto_18849 ) ( not ( = ?auto_18850 ?auto_18857 ) ) ( not ( = ?auto_18851 ?auto_18857 ) ) ( not ( = ?auto_18849 ?auto_18857 ) ) ( not ( = ?auto_18852 ?auto_18857 ) ) ( not ( = ?auto_18853 ?auto_18857 ) ) ( not ( = ?auto_18848 ?auto_18857 ) ) ( SURFACE-AT ?auto_18847 ?auto_18860 ) ( CLEAR ?auto_18847 ) ( IS-CRATE ?auto_18848 ) ( not ( = ?auto_18847 ?auto_18848 ) ) ( not ( = ?auto_18850 ?auto_18847 ) ) ( not ( = ?auto_18851 ?auto_18847 ) ) ( not ( = ?auto_18849 ?auto_18847 ) ) ( not ( = ?auto_18852 ?auto_18847 ) ) ( not ( = ?auto_18853 ?auto_18847 ) ) ( not ( = ?auto_18857 ?auto_18847 ) ) ( AVAILABLE ?auto_18858 ) ( IN ?auto_18848 ?auto_18855 ) ( TRUCK-AT ?auto_18855 ?auto_18856 ) ( not ( = ?auto_18856 ?auto_18860 ) ) ( not ( = ?auto_18862 ?auto_18856 ) ) ( not ( = ?auto_18854 ?auto_18856 ) ) ( ON ?auto_18847 ?auto_18846 ) ( not ( = ?auto_18846 ?auto_18847 ) ) ( not ( = ?auto_18846 ?auto_18848 ) ) ( not ( = ?auto_18846 ?auto_18849 ) ) ( not ( = ?auto_18846 ?auto_18850 ) ) ( not ( = ?auto_18846 ?auto_18851 ) ) ( not ( = ?auto_18846 ?auto_18852 ) ) ( not ( = ?auto_18846 ?auto_18853 ) ) ( not ( = ?auto_18846 ?auto_18857 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18849 ?auto_18850 ?auto_18851 )
      ( MAKE-5CRATE-VERIFY ?auto_18846 ?auto_18847 ?auto_18848 ?auto_18849 ?auto_18850 ?auto_18851 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18863 - SURFACE
      ?auto_18864 - SURFACE
    )
    :vars
    (
      ?auto_18872 - HOIST
      ?auto_18874 - PLACE
      ?auto_18878 - SURFACE
      ?auto_18877 - PLACE
      ?auto_18873 - HOIST
      ?auto_18865 - SURFACE
      ?auto_18867 - PLACE
      ?auto_18875 - HOIST
      ?auto_18866 - SURFACE
      ?auto_18868 - SURFACE
      ?auto_18871 - SURFACE
      ?auto_18876 - SURFACE
      ?auto_18869 - TRUCK
      ?auto_18870 - PLACE
      ?auto_18879 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18872 ?auto_18874 ) ( IS-CRATE ?auto_18864 ) ( not ( = ?auto_18863 ?auto_18864 ) ) ( not ( = ?auto_18878 ?auto_18863 ) ) ( not ( = ?auto_18878 ?auto_18864 ) ) ( not ( = ?auto_18877 ?auto_18874 ) ) ( HOIST-AT ?auto_18873 ?auto_18877 ) ( not ( = ?auto_18872 ?auto_18873 ) ) ( AVAILABLE ?auto_18873 ) ( SURFACE-AT ?auto_18864 ?auto_18877 ) ( ON ?auto_18864 ?auto_18865 ) ( CLEAR ?auto_18864 ) ( not ( = ?auto_18863 ?auto_18865 ) ) ( not ( = ?auto_18864 ?auto_18865 ) ) ( not ( = ?auto_18878 ?auto_18865 ) ) ( IS-CRATE ?auto_18863 ) ( not ( = ?auto_18867 ?auto_18874 ) ) ( not ( = ?auto_18877 ?auto_18867 ) ) ( HOIST-AT ?auto_18875 ?auto_18867 ) ( not ( = ?auto_18872 ?auto_18875 ) ) ( not ( = ?auto_18873 ?auto_18875 ) ) ( SURFACE-AT ?auto_18863 ?auto_18867 ) ( ON ?auto_18863 ?auto_18866 ) ( CLEAR ?auto_18863 ) ( not ( = ?auto_18863 ?auto_18866 ) ) ( not ( = ?auto_18864 ?auto_18866 ) ) ( not ( = ?auto_18878 ?auto_18866 ) ) ( not ( = ?auto_18865 ?auto_18866 ) ) ( IS-CRATE ?auto_18878 ) ( not ( = ?auto_18868 ?auto_18878 ) ) ( not ( = ?auto_18863 ?auto_18868 ) ) ( not ( = ?auto_18864 ?auto_18868 ) ) ( not ( = ?auto_18865 ?auto_18868 ) ) ( not ( = ?auto_18866 ?auto_18868 ) ) ( AVAILABLE ?auto_18875 ) ( SURFACE-AT ?auto_18878 ?auto_18867 ) ( ON ?auto_18878 ?auto_18871 ) ( CLEAR ?auto_18878 ) ( not ( = ?auto_18863 ?auto_18871 ) ) ( not ( = ?auto_18864 ?auto_18871 ) ) ( not ( = ?auto_18878 ?auto_18871 ) ) ( not ( = ?auto_18865 ?auto_18871 ) ) ( not ( = ?auto_18866 ?auto_18871 ) ) ( not ( = ?auto_18868 ?auto_18871 ) ) ( SURFACE-AT ?auto_18876 ?auto_18874 ) ( CLEAR ?auto_18876 ) ( IS-CRATE ?auto_18868 ) ( not ( = ?auto_18876 ?auto_18868 ) ) ( not ( = ?auto_18863 ?auto_18876 ) ) ( not ( = ?auto_18864 ?auto_18876 ) ) ( not ( = ?auto_18878 ?auto_18876 ) ) ( not ( = ?auto_18865 ?auto_18876 ) ) ( not ( = ?auto_18866 ?auto_18876 ) ) ( not ( = ?auto_18871 ?auto_18876 ) ) ( AVAILABLE ?auto_18872 ) ( TRUCK-AT ?auto_18869 ?auto_18870 ) ( not ( = ?auto_18870 ?auto_18874 ) ) ( not ( = ?auto_18877 ?auto_18870 ) ) ( not ( = ?auto_18867 ?auto_18870 ) ) ( HOIST-AT ?auto_18879 ?auto_18870 ) ( LIFTING ?auto_18879 ?auto_18868 ) ( not ( = ?auto_18872 ?auto_18879 ) ) ( not ( = ?auto_18873 ?auto_18879 ) ) ( not ( = ?auto_18875 ?auto_18879 ) ) )
    :subtasks
    ( ( !LOAD ?auto_18879 ?auto_18868 ?auto_18869 ?auto_18870 )
      ( MAKE-2CRATE ?auto_18878 ?auto_18863 ?auto_18864 )
      ( MAKE-1CRATE-VERIFY ?auto_18863 ?auto_18864 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18880 - SURFACE
      ?auto_18881 - SURFACE
      ?auto_18882 - SURFACE
    )
    :vars
    (
      ?auto_18893 - HOIST
      ?auto_18887 - PLACE
      ?auto_18883 - PLACE
      ?auto_18892 - HOIST
      ?auto_18886 - SURFACE
      ?auto_18889 - PLACE
      ?auto_18890 - HOIST
      ?auto_18894 - SURFACE
      ?auto_18885 - SURFACE
      ?auto_18884 - SURFACE
      ?auto_18896 - SURFACE
      ?auto_18888 - TRUCK
      ?auto_18891 - PLACE
      ?auto_18895 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18893 ?auto_18887 ) ( IS-CRATE ?auto_18882 ) ( not ( = ?auto_18881 ?auto_18882 ) ) ( not ( = ?auto_18880 ?auto_18881 ) ) ( not ( = ?auto_18880 ?auto_18882 ) ) ( not ( = ?auto_18883 ?auto_18887 ) ) ( HOIST-AT ?auto_18892 ?auto_18883 ) ( not ( = ?auto_18893 ?auto_18892 ) ) ( AVAILABLE ?auto_18892 ) ( SURFACE-AT ?auto_18882 ?auto_18883 ) ( ON ?auto_18882 ?auto_18886 ) ( CLEAR ?auto_18882 ) ( not ( = ?auto_18881 ?auto_18886 ) ) ( not ( = ?auto_18882 ?auto_18886 ) ) ( not ( = ?auto_18880 ?auto_18886 ) ) ( IS-CRATE ?auto_18881 ) ( not ( = ?auto_18889 ?auto_18887 ) ) ( not ( = ?auto_18883 ?auto_18889 ) ) ( HOIST-AT ?auto_18890 ?auto_18889 ) ( not ( = ?auto_18893 ?auto_18890 ) ) ( not ( = ?auto_18892 ?auto_18890 ) ) ( SURFACE-AT ?auto_18881 ?auto_18889 ) ( ON ?auto_18881 ?auto_18894 ) ( CLEAR ?auto_18881 ) ( not ( = ?auto_18881 ?auto_18894 ) ) ( not ( = ?auto_18882 ?auto_18894 ) ) ( not ( = ?auto_18880 ?auto_18894 ) ) ( not ( = ?auto_18886 ?auto_18894 ) ) ( IS-CRATE ?auto_18880 ) ( not ( = ?auto_18885 ?auto_18880 ) ) ( not ( = ?auto_18881 ?auto_18885 ) ) ( not ( = ?auto_18882 ?auto_18885 ) ) ( not ( = ?auto_18886 ?auto_18885 ) ) ( not ( = ?auto_18894 ?auto_18885 ) ) ( AVAILABLE ?auto_18890 ) ( SURFACE-AT ?auto_18880 ?auto_18889 ) ( ON ?auto_18880 ?auto_18884 ) ( CLEAR ?auto_18880 ) ( not ( = ?auto_18881 ?auto_18884 ) ) ( not ( = ?auto_18882 ?auto_18884 ) ) ( not ( = ?auto_18880 ?auto_18884 ) ) ( not ( = ?auto_18886 ?auto_18884 ) ) ( not ( = ?auto_18894 ?auto_18884 ) ) ( not ( = ?auto_18885 ?auto_18884 ) ) ( SURFACE-AT ?auto_18896 ?auto_18887 ) ( CLEAR ?auto_18896 ) ( IS-CRATE ?auto_18885 ) ( not ( = ?auto_18896 ?auto_18885 ) ) ( not ( = ?auto_18881 ?auto_18896 ) ) ( not ( = ?auto_18882 ?auto_18896 ) ) ( not ( = ?auto_18880 ?auto_18896 ) ) ( not ( = ?auto_18886 ?auto_18896 ) ) ( not ( = ?auto_18894 ?auto_18896 ) ) ( not ( = ?auto_18884 ?auto_18896 ) ) ( AVAILABLE ?auto_18893 ) ( TRUCK-AT ?auto_18888 ?auto_18891 ) ( not ( = ?auto_18891 ?auto_18887 ) ) ( not ( = ?auto_18883 ?auto_18891 ) ) ( not ( = ?auto_18889 ?auto_18891 ) ) ( HOIST-AT ?auto_18895 ?auto_18891 ) ( LIFTING ?auto_18895 ?auto_18885 ) ( not ( = ?auto_18893 ?auto_18895 ) ) ( not ( = ?auto_18892 ?auto_18895 ) ) ( not ( = ?auto_18890 ?auto_18895 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18881 ?auto_18882 )
      ( MAKE-2CRATE-VERIFY ?auto_18880 ?auto_18881 ?auto_18882 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18897 - SURFACE
      ?auto_18898 - SURFACE
      ?auto_18899 - SURFACE
      ?auto_18900 - SURFACE
    )
    :vars
    (
      ?auto_18904 - HOIST
      ?auto_18912 - PLACE
      ?auto_18907 - PLACE
      ?auto_18911 - HOIST
      ?auto_18903 - SURFACE
      ?auto_18905 - PLACE
      ?auto_18909 - HOIST
      ?auto_18902 - SURFACE
      ?auto_18910 - SURFACE
      ?auto_18913 - SURFACE
      ?auto_18908 - TRUCK
      ?auto_18906 - PLACE
      ?auto_18901 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18904 ?auto_18912 ) ( IS-CRATE ?auto_18900 ) ( not ( = ?auto_18899 ?auto_18900 ) ) ( not ( = ?auto_18898 ?auto_18899 ) ) ( not ( = ?auto_18898 ?auto_18900 ) ) ( not ( = ?auto_18907 ?auto_18912 ) ) ( HOIST-AT ?auto_18911 ?auto_18907 ) ( not ( = ?auto_18904 ?auto_18911 ) ) ( AVAILABLE ?auto_18911 ) ( SURFACE-AT ?auto_18900 ?auto_18907 ) ( ON ?auto_18900 ?auto_18903 ) ( CLEAR ?auto_18900 ) ( not ( = ?auto_18899 ?auto_18903 ) ) ( not ( = ?auto_18900 ?auto_18903 ) ) ( not ( = ?auto_18898 ?auto_18903 ) ) ( IS-CRATE ?auto_18899 ) ( not ( = ?auto_18905 ?auto_18912 ) ) ( not ( = ?auto_18907 ?auto_18905 ) ) ( HOIST-AT ?auto_18909 ?auto_18905 ) ( not ( = ?auto_18904 ?auto_18909 ) ) ( not ( = ?auto_18911 ?auto_18909 ) ) ( SURFACE-AT ?auto_18899 ?auto_18905 ) ( ON ?auto_18899 ?auto_18902 ) ( CLEAR ?auto_18899 ) ( not ( = ?auto_18899 ?auto_18902 ) ) ( not ( = ?auto_18900 ?auto_18902 ) ) ( not ( = ?auto_18898 ?auto_18902 ) ) ( not ( = ?auto_18903 ?auto_18902 ) ) ( IS-CRATE ?auto_18898 ) ( not ( = ?auto_18897 ?auto_18898 ) ) ( not ( = ?auto_18899 ?auto_18897 ) ) ( not ( = ?auto_18900 ?auto_18897 ) ) ( not ( = ?auto_18903 ?auto_18897 ) ) ( not ( = ?auto_18902 ?auto_18897 ) ) ( AVAILABLE ?auto_18909 ) ( SURFACE-AT ?auto_18898 ?auto_18905 ) ( ON ?auto_18898 ?auto_18910 ) ( CLEAR ?auto_18898 ) ( not ( = ?auto_18899 ?auto_18910 ) ) ( not ( = ?auto_18900 ?auto_18910 ) ) ( not ( = ?auto_18898 ?auto_18910 ) ) ( not ( = ?auto_18903 ?auto_18910 ) ) ( not ( = ?auto_18902 ?auto_18910 ) ) ( not ( = ?auto_18897 ?auto_18910 ) ) ( SURFACE-AT ?auto_18913 ?auto_18912 ) ( CLEAR ?auto_18913 ) ( IS-CRATE ?auto_18897 ) ( not ( = ?auto_18913 ?auto_18897 ) ) ( not ( = ?auto_18899 ?auto_18913 ) ) ( not ( = ?auto_18900 ?auto_18913 ) ) ( not ( = ?auto_18898 ?auto_18913 ) ) ( not ( = ?auto_18903 ?auto_18913 ) ) ( not ( = ?auto_18902 ?auto_18913 ) ) ( not ( = ?auto_18910 ?auto_18913 ) ) ( AVAILABLE ?auto_18904 ) ( TRUCK-AT ?auto_18908 ?auto_18906 ) ( not ( = ?auto_18906 ?auto_18912 ) ) ( not ( = ?auto_18907 ?auto_18906 ) ) ( not ( = ?auto_18905 ?auto_18906 ) ) ( HOIST-AT ?auto_18901 ?auto_18906 ) ( LIFTING ?auto_18901 ?auto_18897 ) ( not ( = ?auto_18904 ?auto_18901 ) ) ( not ( = ?auto_18911 ?auto_18901 ) ) ( not ( = ?auto_18909 ?auto_18901 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18898 ?auto_18899 ?auto_18900 )
      ( MAKE-3CRATE-VERIFY ?auto_18897 ?auto_18898 ?auto_18899 ?auto_18900 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18914 - SURFACE
      ?auto_18915 - SURFACE
      ?auto_18916 - SURFACE
      ?auto_18917 - SURFACE
      ?auto_18918 - SURFACE
    )
    :vars
    (
      ?auto_18922 - HOIST
      ?auto_18930 - PLACE
      ?auto_18925 - PLACE
      ?auto_18929 - HOIST
      ?auto_18921 - SURFACE
      ?auto_18923 - PLACE
      ?auto_18927 - HOIST
      ?auto_18920 - SURFACE
      ?auto_18928 - SURFACE
      ?auto_18926 - TRUCK
      ?auto_18924 - PLACE
      ?auto_18919 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18922 ?auto_18930 ) ( IS-CRATE ?auto_18918 ) ( not ( = ?auto_18917 ?auto_18918 ) ) ( not ( = ?auto_18916 ?auto_18917 ) ) ( not ( = ?auto_18916 ?auto_18918 ) ) ( not ( = ?auto_18925 ?auto_18930 ) ) ( HOIST-AT ?auto_18929 ?auto_18925 ) ( not ( = ?auto_18922 ?auto_18929 ) ) ( AVAILABLE ?auto_18929 ) ( SURFACE-AT ?auto_18918 ?auto_18925 ) ( ON ?auto_18918 ?auto_18921 ) ( CLEAR ?auto_18918 ) ( not ( = ?auto_18917 ?auto_18921 ) ) ( not ( = ?auto_18918 ?auto_18921 ) ) ( not ( = ?auto_18916 ?auto_18921 ) ) ( IS-CRATE ?auto_18917 ) ( not ( = ?auto_18923 ?auto_18930 ) ) ( not ( = ?auto_18925 ?auto_18923 ) ) ( HOIST-AT ?auto_18927 ?auto_18923 ) ( not ( = ?auto_18922 ?auto_18927 ) ) ( not ( = ?auto_18929 ?auto_18927 ) ) ( SURFACE-AT ?auto_18917 ?auto_18923 ) ( ON ?auto_18917 ?auto_18920 ) ( CLEAR ?auto_18917 ) ( not ( = ?auto_18917 ?auto_18920 ) ) ( not ( = ?auto_18918 ?auto_18920 ) ) ( not ( = ?auto_18916 ?auto_18920 ) ) ( not ( = ?auto_18921 ?auto_18920 ) ) ( IS-CRATE ?auto_18916 ) ( not ( = ?auto_18915 ?auto_18916 ) ) ( not ( = ?auto_18917 ?auto_18915 ) ) ( not ( = ?auto_18918 ?auto_18915 ) ) ( not ( = ?auto_18921 ?auto_18915 ) ) ( not ( = ?auto_18920 ?auto_18915 ) ) ( AVAILABLE ?auto_18927 ) ( SURFACE-AT ?auto_18916 ?auto_18923 ) ( ON ?auto_18916 ?auto_18928 ) ( CLEAR ?auto_18916 ) ( not ( = ?auto_18917 ?auto_18928 ) ) ( not ( = ?auto_18918 ?auto_18928 ) ) ( not ( = ?auto_18916 ?auto_18928 ) ) ( not ( = ?auto_18921 ?auto_18928 ) ) ( not ( = ?auto_18920 ?auto_18928 ) ) ( not ( = ?auto_18915 ?auto_18928 ) ) ( SURFACE-AT ?auto_18914 ?auto_18930 ) ( CLEAR ?auto_18914 ) ( IS-CRATE ?auto_18915 ) ( not ( = ?auto_18914 ?auto_18915 ) ) ( not ( = ?auto_18917 ?auto_18914 ) ) ( not ( = ?auto_18918 ?auto_18914 ) ) ( not ( = ?auto_18916 ?auto_18914 ) ) ( not ( = ?auto_18921 ?auto_18914 ) ) ( not ( = ?auto_18920 ?auto_18914 ) ) ( not ( = ?auto_18928 ?auto_18914 ) ) ( AVAILABLE ?auto_18922 ) ( TRUCK-AT ?auto_18926 ?auto_18924 ) ( not ( = ?auto_18924 ?auto_18930 ) ) ( not ( = ?auto_18925 ?auto_18924 ) ) ( not ( = ?auto_18923 ?auto_18924 ) ) ( HOIST-AT ?auto_18919 ?auto_18924 ) ( LIFTING ?auto_18919 ?auto_18915 ) ( not ( = ?auto_18922 ?auto_18919 ) ) ( not ( = ?auto_18929 ?auto_18919 ) ) ( not ( = ?auto_18927 ?auto_18919 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18916 ?auto_18917 ?auto_18918 )
      ( MAKE-4CRATE-VERIFY ?auto_18914 ?auto_18915 ?auto_18916 ?auto_18917 ?auto_18918 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18931 - SURFACE
      ?auto_18932 - SURFACE
      ?auto_18933 - SURFACE
      ?auto_18934 - SURFACE
      ?auto_18935 - SURFACE
      ?auto_18936 - SURFACE
    )
    :vars
    (
      ?auto_18940 - HOIST
      ?auto_18948 - PLACE
      ?auto_18943 - PLACE
      ?auto_18947 - HOIST
      ?auto_18939 - SURFACE
      ?auto_18941 - PLACE
      ?auto_18945 - HOIST
      ?auto_18938 - SURFACE
      ?auto_18946 - SURFACE
      ?auto_18944 - TRUCK
      ?auto_18942 - PLACE
      ?auto_18937 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18940 ?auto_18948 ) ( IS-CRATE ?auto_18936 ) ( not ( = ?auto_18935 ?auto_18936 ) ) ( not ( = ?auto_18934 ?auto_18935 ) ) ( not ( = ?auto_18934 ?auto_18936 ) ) ( not ( = ?auto_18943 ?auto_18948 ) ) ( HOIST-AT ?auto_18947 ?auto_18943 ) ( not ( = ?auto_18940 ?auto_18947 ) ) ( AVAILABLE ?auto_18947 ) ( SURFACE-AT ?auto_18936 ?auto_18943 ) ( ON ?auto_18936 ?auto_18939 ) ( CLEAR ?auto_18936 ) ( not ( = ?auto_18935 ?auto_18939 ) ) ( not ( = ?auto_18936 ?auto_18939 ) ) ( not ( = ?auto_18934 ?auto_18939 ) ) ( IS-CRATE ?auto_18935 ) ( not ( = ?auto_18941 ?auto_18948 ) ) ( not ( = ?auto_18943 ?auto_18941 ) ) ( HOIST-AT ?auto_18945 ?auto_18941 ) ( not ( = ?auto_18940 ?auto_18945 ) ) ( not ( = ?auto_18947 ?auto_18945 ) ) ( SURFACE-AT ?auto_18935 ?auto_18941 ) ( ON ?auto_18935 ?auto_18938 ) ( CLEAR ?auto_18935 ) ( not ( = ?auto_18935 ?auto_18938 ) ) ( not ( = ?auto_18936 ?auto_18938 ) ) ( not ( = ?auto_18934 ?auto_18938 ) ) ( not ( = ?auto_18939 ?auto_18938 ) ) ( IS-CRATE ?auto_18934 ) ( not ( = ?auto_18933 ?auto_18934 ) ) ( not ( = ?auto_18935 ?auto_18933 ) ) ( not ( = ?auto_18936 ?auto_18933 ) ) ( not ( = ?auto_18939 ?auto_18933 ) ) ( not ( = ?auto_18938 ?auto_18933 ) ) ( AVAILABLE ?auto_18945 ) ( SURFACE-AT ?auto_18934 ?auto_18941 ) ( ON ?auto_18934 ?auto_18946 ) ( CLEAR ?auto_18934 ) ( not ( = ?auto_18935 ?auto_18946 ) ) ( not ( = ?auto_18936 ?auto_18946 ) ) ( not ( = ?auto_18934 ?auto_18946 ) ) ( not ( = ?auto_18939 ?auto_18946 ) ) ( not ( = ?auto_18938 ?auto_18946 ) ) ( not ( = ?auto_18933 ?auto_18946 ) ) ( SURFACE-AT ?auto_18932 ?auto_18948 ) ( CLEAR ?auto_18932 ) ( IS-CRATE ?auto_18933 ) ( not ( = ?auto_18932 ?auto_18933 ) ) ( not ( = ?auto_18935 ?auto_18932 ) ) ( not ( = ?auto_18936 ?auto_18932 ) ) ( not ( = ?auto_18934 ?auto_18932 ) ) ( not ( = ?auto_18939 ?auto_18932 ) ) ( not ( = ?auto_18938 ?auto_18932 ) ) ( not ( = ?auto_18946 ?auto_18932 ) ) ( AVAILABLE ?auto_18940 ) ( TRUCK-AT ?auto_18944 ?auto_18942 ) ( not ( = ?auto_18942 ?auto_18948 ) ) ( not ( = ?auto_18943 ?auto_18942 ) ) ( not ( = ?auto_18941 ?auto_18942 ) ) ( HOIST-AT ?auto_18937 ?auto_18942 ) ( LIFTING ?auto_18937 ?auto_18933 ) ( not ( = ?auto_18940 ?auto_18937 ) ) ( not ( = ?auto_18947 ?auto_18937 ) ) ( not ( = ?auto_18945 ?auto_18937 ) ) ( ON ?auto_18932 ?auto_18931 ) ( not ( = ?auto_18931 ?auto_18932 ) ) ( not ( = ?auto_18931 ?auto_18933 ) ) ( not ( = ?auto_18931 ?auto_18934 ) ) ( not ( = ?auto_18931 ?auto_18935 ) ) ( not ( = ?auto_18931 ?auto_18936 ) ) ( not ( = ?auto_18931 ?auto_18939 ) ) ( not ( = ?auto_18931 ?auto_18938 ) ) ( not ( = ?auto_18931 ?auto_18946 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18934 ?auto_18935 ?auto_18936 )
      ( MAKE-5CRATE-VERIFY ?auto_18931 ?auto_18932 ?auto_18933 ?auto_18934 ?auto_18935 ?auto_18936 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18949 - SURFACE
      ?auto_18950 - SURFACE
    )
    :vars
    (
      ?auto_18954 - HOIST
      ?auto_18962 - PLACE
      ?auto_18965 - SURFACE
      ?auto_18957 - PLACE
      ?auto_18961 - HOIST
      ?auto_18953 - SURFACE
      ?auto_18955 - PLACE
      ?auto_18959 - HOIST
      ?auto_18952 - SURFACE
      ?auto_18963 - SURFACE
      ?auto_18960 - SURFACE
      ?auto_18964 - SURFACE
      ?auto_18958 - TRUCK
      ?auto_18956 - PLACE
      ?auto_18951 - HOIST
      ?auto_18966 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18954 ?auto_18962 ) ( IS-CRATE ?auto_18950 ) ( not ( = ?auto_18949 ?auto_18950 ) ) ( not ( = ?auto_18965 ?auto_18949 ) ) ( not ( = ?auto_18965 ?auto_18950 ) ) ( not ( = ?auto_18957 ?auto_18962 ) ) ( HOIST-AT ?auto_18961 ?auto_18957 ) ( not ( = ?auto_18954 ?auto_18961 ) ) ( AVAILABLE ?auto_18961 ) ( SURFACE-AT ?auto_18950 ?auto_18957 ) ( ON ?auto_18950 ?auto_18953 ) ( CLEAR ?auto_18950 ) ( not ( = ?auto_18949 ?auto_18953 ) ) ( not ( = ?auto_18950 ?auto_18953 ) ) ( not ( = ?auto_18965 ?auto_18953 ) ) ( IS-CRATE ?auto_18949 ) ( not ( = ?auto_18955 ?auto_18962 ) ) ( not ( = ?auto_18957 ?auto_18955 ) ) ( HOIST-AT ?auto_18959 ?auto_18955 ) ( not ( = ?auto_18954 ?auto_18959 ) ) ( not ( = ?auto_18961 ?auto_18959 ) ) ( SURFACE-AT ?auto_18949 ?auto_18955 ) ( ON ?auto_18949 ?auto_18952 ) ( CLEAR ?auto_18949 ) ( not ( = ?auto_18949 ?auto_18952 ) ) ( not ( = ?auto_18950 ?auto_18952 ) ) ( not ( = ?auto_18965 ?auto_18952 ) ) ( not ( = ?auto_18953 ?auto_18952 ) ) ( IS-CRATE ?auto_18965 ) ( not ( = ?auto_18963 ?auto_18965 ) ) ( not ( = ?auto_18949 ?auto_18963 ) ) ( not ( = ?auto_18950 ?auto_18963 ) ) ( not ( = ?auto_18953 ?auto_18963 ) ) ( not ( = ?auto_18952 ?auto_18963 ) ) ( AVAILABLE ?auto_18959 ) ( SURFACE-AT ?auto_18965 ?auto_18955 ) ( ON ?auto_18965 ?auto_18960 ) ( CLEAR ?auto_18965 ) ( not ( = ?auto_18949 ?auto_18960 ) ) ( not ( = ?auto_18950 ?auto_18960 ) ) ( not ( = ?auto_18965 ?auto_18960 ) ) ( not ( = ?auto_18953 ?auto_18960 ) ) ( not ( = ?auto_18952 ?auto_18960 ) ) ( not ( = ?auto_18963 ?auto_18960 ) ) ( SURFACE-AT ?auto_18964 ?auto_18962 ) ( CLEAR ?auto_18964 ) ( IS-CRATE ?auto_18963 ) ( not ( = ?auto_18964 ?auto_18963 ) ) ( not ( = ?auto_18949 ?auto_18964 ) ) ( not ( = ?auto_18950 ?auto_18964 ) ) ( not ( = ?auto_18965 ?auto_18964 ) ) ( not ( = ?auto_18953 ?auto_18964 ) ) ( not ( = ?auto_18952 ?auto_18964 ) ) ( not ( = ?auto_18960 ?auto_18964 ) ) ( AVAILABLE ?auto_18954 ) ( TRUCK-AT ?auto_18958 ?auto_18956 ) ( not ( = ?auto_18956 ?auto_18962 ) ) ( not ( = ?auto_18957 ?auto_18956 ) ) ( not ( = ?auto_18955 ?auto_18956 ) ) ( HOIST-AT ?auto_18951 ?auto_18956 ) ( not ( = ?auto_18954 ?auto_18951 ) ) ( not ( = ?auto_18961 ?auto_18951 ) ) ( not ( = ?auto_18959 ?auto_18951 ) ) ( AVAILABLE ?auto_18951 ) ( SURFACE-AT ?auto_18963 ?auto_18956 ) ( ON ?auto_18963 ?auto_18966 ) ( CLEAR ?auto_18963 ) ( not ( = ?auto_18949 ?auto_18966 ) ) ( not ( = ?auto_18950 ?auto_18966 ) ) ( not ( = ?auto_18965 ?auto_18966 ) ) ( not ( = ?auto_18953 ?auto_18966 ) ) ( not ( = ?auto_18952 ?auto_18966 ) ) ( not ( = ?auto_18963 ?auto_18966 ) ) ( not ( = ?auto_18960 ?auto_18966 ) ) ( not ( = ?auto_18964 ?auto_18966 ) ) )
    :subtasks
    ( ( !LIFT ?auto_18951 ?auto_18963 ?auto_18966 ?auto_18956 )
      ( MAKE-2CRATE ?auto_18965 ?auto_18949 ?auto_18950 )
      ( MAKE-1CRATE-VERIFY ?auto_18949 ?auto_18950 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18967 - SURFACE
      ?auto_18968 - SURFACE
      ?auto_18969 - SURFACE
    )
    :vars
    (
      ?auto_18979 - HOIST
      ?auto_18972 - PLACE
      ?auto_18982 - PLACE
      ?auto_18976 - HOIST
      ?auto_18970 - SURFACE
      ?auto_18973 - PLACE
      ?auto_18984 - HOIST
      ?auto_18975 - SURFACE
      ?auto_18981 - SURFACE
      ?auto_18980 - SURFACE
      ?auto_18971 - SURFACE
      ?auto_18977 - TRUCK
      ?auto_18978 - PLACE
      ?auto_18974 - HOIST
      ?auto_18983 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18979 ?auto_18972 ) ( IS-CRATE ?auto_18969 ) ( not ( = ?auto_18968 ?auto_18969 ) ) ( not ( = ?auto_18967 ?auto_18968 ) ) ( not ( = ?auto_18967 ?auto_18969 ) ) ( not ( = ?auto_18982 ?auto_18972 ) ) ( HOIST-AT ?auto_18976 ?auto_18982 ) ( not ( = ?auto_18979 ?auto_18976 ) ) ( AVAILABLE ?auto_18976 ) ( SURFACE-AT ?auto_18969 ?auto_18982 ) ( ON ?auto_18969 ?auto_18970 ) ( CLEAR ?auto_18969 ) ( not ( = ?auto_18968 ?auto_18970 ) ) ( not ( = ?auto_18969 ?auto_18970 ) ) ( not ( = ?auto_18967 ?auto_18970 ) ) ( IS-CRATE ?auto_18968 ) ( not ( = ?auto_18973 ?auto_18972 ) ) ( not ( = ?auto_18982 ?auto_18973 ) ) ( HOIST-AT ?auto_18984 ?auto_18973 ) ( not ( = ?auto_18979 ?auto_18984 ) ) ( not ( = ?auto_18976 ?auto_18984 ) ) ( SURFACE-AT ?auto_18968 ?auto_18973 ) ( ON ?auto_18968 ?auto_18975 ) ( CLEAR ?auto_18968 ) ( not ( = ?auto_18968 ?auto_18975 ) ) ( not ( = ?auto_18969 ?auto_18975 ) ) ( not ( = ?auto_18967 ?auto_18975 ) ) ( not ( = ?auto_18970 ?auto_18975 ) ) ( IS-CRATE ?auto_18967 ) ( not ( = ?auto_18981 ?auto_18967 ) ) ( not ( = ?auto_18968 ?auto_18981 ) ) ( not ( = ?auto_18969 ?auto_18981 ) ) ( not ( = ?auto_18970 ?auto_18981 ) ) ( not ( = ?auto_18975 ?auto_18981 ) ) ( AVAILABLE ?auto_18984 ) ( SURFACE-AT ?auto_18967 ?auto_18973 ) ( ON ?auto_18967 ?auto_18980 ) ( CLEAR ?auto_18967 ) ( not ( = ?auto_18968 ?auto_18980 ) ) ( not ( = ?auto_18969 ?auto_18980 ) ) ( not ( = ?auto_18967 ?auto_18980 ) ) ( not ( = ?auto_18970 ?auto_18980 ) ) ( not ( = ?auto_18975 ?auto_18980 ) ) ( not ( = ?auto_18981 ?auto_18980 ) ) ( SURFACE-AT ?auto_18971 ?auto_18972 ) ( CLEAR ?auto_18971 ) ( IS-CRATE ?auto_18981 ) ( not ( = ?auto_18971 ?auto_18981 ) ) ( not ( = ?auto_18968 ?auto_18971 ) ) ( not ( = ?auto_18969 ?auto_18971 ) ) ( not ( = ?auto_18967 ?auto_18971 ) ) ( not ( = ?auto_18970 ?auto_18971 ) ) ( not ( = ?auto_18975 ?auto_18971 ) ) ( not ( = ?auto_18980 ?auto_18971 ) ) ( AVAILABLE ?auto_18979 ) ( TRUCK-AT ?auto_18977 ?auto_18978 ) ( not ( = ?auto_18978 ?auto_18972 ) ) ( not ( = ?auto_18982 ?auto_18978 ) ) ( not ( = ?auto_18973 ?auto_18978 ) ) ( HOIST-AT ?auto_18974 ?auto_18978 ) ( not ( = ?auto_18979 ?auto_18974 ) ) ( not ( = ?auto_18976 ?auto_18974 ) ) ( not ( = ?auto_18984 ?auto_18974 ) ) ( AVAILABLE ?auto_18974 ) ( SURFACE-AT ?auto_18981 ?auto_18978 ) ( ON ?auto_18981 ?auto_18983 ) ( CLEAR ?auto_18981 ) ( not ( = ?auto_18968 ?auto_18983 ) ) ( not ( = ?auto_18969 ?auto_18983 ) ) ( not ( = ?auto_18967 ?auto_18983 ) ) ( not ( = ?auto_18970 ?auto_18983 ) ) ( not ( = ?auto_18975 ?auto_18983 ) ) ( not ( = ?auto_18981 ?auto_18983 ) ) ( not ( = ?auto_18980 ?auto_18983 ) ) ( not ( = ?auto_18971 ?auto_18983 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18968 ?auto_18969 )
      ( MAKE-2CRATE-VERIFY ?auto_18967 ?auto_18968 ?auto_18969 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18985 - SURFACE
      ?auto_18986 - SURFACE
      ?auto_18987 - SURFACE
      ?auto_18988 - SURFACE
    )
    :vars
    (
      ?auto_18994 - HOIST
      ?auto_18993 - PLACE
      ?auto_18999 - PLACE
      ?auto_18991 - HOIST
      ?auto_18998 - SURFACE
      ?auto_18997 - PLACE
      ?auto_18990 - HOIST
      ?auto_18992 - SURFACE
      ?auto_19000 - SURFACE
      ?auto_19002 - SURFACE
      ?auto_18996 - TRUCK
      ?auto_18995 - PLACE
      ?auto_18989 - HOIST
      ?auto_19001 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18994 ?auto_18993 ) ( IS-CRATE ?auto_18988 ) ( not ( = ?auto_18987 ?auto_18988 ) ) ( not ( = ?auto_18986 ?auto_18987 ) ) ( not ( = ?auto_18986 ?auto_18988 ) ) ( not ( = ?auto_18999 ?auto_18993 ) ) ( HOIST-AT ?auto_18991 ?auto_18999 ) ( not ( = ?auto_18994 ?auto_18991 ) ) ( AVAILABLE ?auto_18991 ) ( SURFACE-AT ?auto_18988 ?auto_18999 ) ( ON ?auto_18988 ?auto_18998 ) ( CLEAR ?auto_18988 ) ( not ( = ?auto_18987 ?auto_18998 ) ) ( not ( = ?auto_18988 ?auto_18998 ) ) ( not ( = ?auto_18986 ?auto_18998 ) ) ( IS-CRATE ?auto_18987 ) ( not ( = ?auto_18997 ?auto_18993 ) ) ( not ( = ?auto_18999 ?auto_18997 ) ) ( HOIST-AT ?auto_18990 ?auto_18997 ) ( not ( = ?auto_18994 ?auto_18990 ) ) ( not ( = ?auto_18991 ?auto_18990 ) ) ( SURFACE-AT ?auto_18987 ?auto_18997 ) ( ON ?auto_18987 ?auto_18992 ) ( CLEAR ?auto_18987 ) ( not ( = ?auto_18987 ?auto_18992 ) ) ( not ( = ?auto_18988 ?auto_18992 ) ) ( not ( = ?auto_18986 ?auto_18992 ) ) ( not ( = ?auto_18998 ?auto_18992 ) ) ( IS-CRATE ?auto_18986 ) ( not ( = ?auto_18985 ?auto_18986 ) ) ( not ( = ?auto_18987 ?auto_18985 ) ) ( not ( = ?auto_18988 ?auto_18985 ) ) ( not ( = ?auto_18998 ?auto_18985 ) ) ( not ( = ?auto_18992 ?auto_18985 ) ) ( AVAILABLE ?auto_18990 ) ( SURFACE-AT ?auto_18986 ?auto_18997 ) ( ON ?auto_18986 ?auto_19000 ) ( CLEAR ?auto_18986 ) ( not ( = ?auto_18987 ?auto_19000 ) ) ( not ( = ?auto_18988 ?auto_19000 ) ) ( not ( = ?auto_18986 ?auto_19000 ) ) ( not ( = ?auto_18998 ?auto_19000 ) ) ( not ( = ?auto_18992 ?auto_19000 ) ) ( not ( = ?auto_18985 ?auto_19000 ) ) ( SURFACE-AT ?auto_19002 ?auto_18993 ) ( CLEAR ?auto_19002 ) ( IS-CRATE ?auto_18985 ) ( not ( = ?auto_19002 ?auto_18985 ) ) ( not ( = ?auto_18987 ?auto_19002 ) ) ( not ( = ?auto_18988 ?auto_19002 ) ) ( not ( = ?auto_18986 ?auto_19002 ) ) ( not ( = ?auto_18998 ?auto_19002 ) ) ( not ( = ?auto_18992 ?auto_19002 ) ) ( not ( = ?auto_19000 ?auto_19002 ) ) ( AVAILABLE ?auto_18994 ) ( TRUCK-AT ?auto_18996 ?auto_18995 ) ( not ( = ?auto_18995 ?auto_18993 ) ) ( not ( = ?auto_18999 ?auto_18995 ) ) ( not ( = ?auto_18997 ?auto_18995 ) ) ( HOIST-AT ?auto_18989 ?auto_18995 ) ( not ( = ?auto_18994 ?auto_18989 ) ) ( not ( = ?auto_18991 ?auto_18989 ) ) ( not ( = ?auto_18990 ?auto_18989 ) ) ( AVAILABLE ?auto_18989 ) ( SURFACE-AT ?auto_18985 ?auto_18995 ) ( ON ?auto_18985 ?auto_19001 ) ( CLEAR ?auto_18985 ) ( not ( = ?auto_18987 ?auto_19001 ) ) ( not ( = ?auto_18988 ?auto_19001 ) ) ( not ( = ?auto_18986 ?auto_19001 ) ) ( not ( = ?auto_18998 ?auto_19001 ) ) ( not ( = ?auto_18992 ?auto_19001 ) ) ( not ( = ?auto_18985 ?auto_19001 ) ) ( not ( = ?auto_19000 ?auto_19001 ) ) ( not ( = ?auto_19002 ?auto_19001 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18986 ?auto_18987 ?auto_18988 )
      ( MAKE-3CRATE-VERIFY ?auto_18985 ?auto_18986 ?auto_18987 ?auto_18988 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19003 - SURFACE
      ?auto_19004 - SURFACE
      ?auto_19005 - SURFACE
      ?auto_19006 - SURFACE
      ?auto_19007 - SURFACE
    )
    :vars
    (
      ?auto_19013 - HOIST
      ?auto_19012 - PLACE
      ?auto_19018 - PLACE
      ?auto_19010 - HOIST
      ?auto_19017 - SURFACE
      ?auto_19016 - PLACE
      ?auto_19009 - HOIST
      ?auto_19011 - SURFACE
      ?auto_19019 - SURFACE
      ?auto_19015 - TRUCK
      ?auto_19014 - PLACE
      ?auto_19008 - HOIST
      ?auto_19020 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19013 ?auto_19012 ) ( IS-CRATE ?auto_19007 ) ( not ( = ?auto_19006 ?auto_19007 ) ) ( not ( = ?auto_19005 ?auto_19006 ) ) ( not ( = ?auto_19005 ?auto_19007 ) ) ( not ( = ?auto_19018 ?auto_19012 ) ) ( HOIST-AT ?auto_19010 ?auto_19018 ) ( not ( = ?auto_19013 ?auto_19010 ) ) ( AVAILABLE ?auto_19010 ) ( SURFACE-AT ?auto_19007 ?auto_19018 ) ( ON ?auto_19007 ?auto_19017 ) ( CLEAR ?auto_19007 ) ( not ( = ?auto_19006 ?auto_19017 ) ) ( not ( = ?auto_19007 ?auto_19017 ) ) ( not ( = ?auto_19005 ?auto_19017 ) ) ( IS-CRATE ?auto_19006 ) ( not ( = ?auto_19016 ?auto_19012 ) ) ( not ( = ?auto_19018 ?auto_19016 ) ) ( HOIST-AT ?auto_19009 ?auto_19016 ) ( not ( = ?auto_19013 ?auto_19009 ) ) ( not ( = ?auto_19010 ?auto_19009 ) ) ( SURFACE-AT ?auto_19006 ?auto_19016 ) ( ON ?auto_19006 ?auto_19011 ) ( CLEAR ?auto_19006 ) ( not ( = ?auto_19006 ?auto_19011 ) ) ( not ( = ?auto_19007 ?auto_19011 ) ) ( not ( = ?auto_19005 ?auto_19011 ) ) ( not ( = ?auto_19017 ?auto_19011 ) ) ( IS-CRATE ?auto_19005 ) ( not ( = ?auto_19004 ?auto_19005 ) ) ( not ( = ?auto_19006 ?auto_19004 ) ) ( not ( = ?auto_19007 ?auto_19004 ) ) ( not ( = ?auto_19017 ?auto_19004 ) ) ( not ( = ?auto_19011 ?auto_19004 ) ) ( AVAILABLE ?auto_19009 ) ( SURFACE-AT ?auto_19005 ?auto_19016 ) ( ON ?auto_19005 ?auto_19019 ) ( CLEAR ?auto_19005 ) ( not ( = ?auto_19006 ?auto_19019 ) ) ( not ( = ?auto_19007 ?auto_19019 ) ) ( not ( = ?auto_19005 ?auto_19019 ) ) ( not ( = ?auto_19017 ?auto_19019 ) ) ( not ( = ?auto_19011 ?auto_19019 ) ) ( not ( = ?auto_19004 ?auto_19019 ) ) ( SURFACE-AT ?auto_19003 ?auto_19012 ) ( CLEAR ?auto_19003 ) ( IS-CRATE ?auto_19004 ) ( not ( = ?auto_19003 ?auto_19004 ) ) ( not ( = ?auto_19006 ?auto_19003 ) ) ( not ( = ?auto_19007 ?auto_19003 ) ) ( not ( = ?auto_19005 ?auto_19003 ) ) ( not ( = ?auto_19017 ?auto_19003 ) ) ( not ( = ?auto_19011 ?auto_19003 ) ) ( not ( = ?auto_19019 ?auto_19003 ) ) ( AVAILABLE ?auto_19013 ) ( TRUCK-AT ?auto_19015 ?auto_19014 ) ( not ( = ?auto_19014 ?auto_19012 ) ) ( not ( = ?auto_19018 ?auto_19014 ) ) ( not ( = ?auto_19016 ?auto_19014 ) ) ( HOIST-AT ?auto_19008 ?auto_19014 ) ( not ( = ?auto_19013 ?auto_19008 ) ) ( not ( = ?auto_19010 ?auto_19008 ) ) ( not ( = ?auto_19009 ?auto_19008 ) ) ( AVAILABLE ?auto_19008 ) ( SURFACE-AT ?auto_19004 ?auto_19014 ) ( ON ?auto_19004 ?auto_19020 ) ( CLEAR ?auto_19004 ) ( not ( = ?auto_19006 ?auto_19020 ) ) ( not ( = ?auto_19007 ?auto_19020 ) ) ( not ( = ?auto_19005 ?auto_19020 ) ) ( not ( = ?auto_19017 ?auto_19020 ) ) ( not ( = ?auto_19011 ?auto_19020 ) ) ( not ( = ?auto_19004 ?auto_19020 ) ) ( not ( = ?auto_19019 ?auto_19020 ) ) ( not ( = ?auto_19003 ?auto_19020 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19005 ?auto_19006 ?auto_19007 )
      ( MAKE-4CRATE-VERIFY ?auto_19003 ?auto_19004 ?auto_19005 ?auto_19006 ?auto_19007 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19021 - SURFACE
      ?auto_19022 - SURFACE
      ?auto_19023 - SURFACE
      ?auto_19024 - SURFACE
      ?auto_19025 - SURFACE
      ?auto_19026 - SURFACE
    )
    :vars
    (
      ?auto_19032 - HOIST
      ?auto_19031 - PLACE
      ?auto_19037 - PLACE
      ?auto_19029 - HOIST
      ?auto_19036 - SURFACE
      ?auto_19035 - PLACE
      ?auto_19028 - HOIST
      ?auto_19030 - SURFACE
      ?auto_19038 - SURFACE
      ?auto_19034 - TRUCK
      ?auto_19033 - PLACE
      ?auto_19027 - HOIST
      ?auto_19039 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19032 ?auto_19031 ) ( IS-CRATE ?auto_19026 ) ( not ( = ?auto_19025 ?auto_19026 ) ) ( not ( = ?auto_19024 ?auto_19025 ) ) ( not ( = ?auto_19024 ?auto_19026 ) ) ( not ( = ?auto_19037 ?auto_19031 ) ) ( HOIST-AT ?auto_19029 ?auto_19037 ) ( not ( = ?auto_19032 ?auto_19029 ) ) ( AVAILABLE ?auto_19029 ) ( SURFACE-AT ?auto_19026 ?auto_19037 ) ( ON ?auto_19026 ?auto_19036 ) ( CLEAR ?auto_19026 ) ( not ( = ?auto_19025 ?auto_19036 ) ) ( not ( = ?auto_19026 ?auto_19036 ) ) ( not ( = ?auto_19024 ?auto_19036 ) ) ( IS-CRATE ?auto_19025 ) ( not ( = ?auto_19035 ?auto_19031 ) ) ( not ( = ?auto_19037 ?auto_19035 ) ) ( HOIST-AT ?auto_19028 ?auto_19035 ) ( not ( = ?auto_19032 ?auto_19028 ) ) ( not ( = ?auto_19029 ?auto_19028 ) ) ( SURFACE-AT ?auto_19025 ?auto_19035 ) ( ON ?auto_19025 ?auto_19030 ) ( CLEAR ?auto_19025 ) ( not ( = ?auto_19025 ?auto_19030 ) ) ( not ( = ?auto_19026 ?auto_19030 ) ) ( not ( = ?auto_19024 ?auto_19030 ) ) ( not ( = ?auto_19036 ?auto_19030 ) ) ( IS-CRATE ?auto_19024 ) ( not ( = ?auto_19023 ?auto_19024 ) ) ( not ( = ?auto_19025 ?auto_19023 ) ) ( not ( = ?auto_19026 ?auto_19023 ) ) ( not ( = ?auto_19036 ?auto_19023 ) ) ( not ( = ?auto_19030 ?auto_19023 ) ) ( AVAILABLE ?auto_19028 ) ( SURFACE-AT ?auto_19024 ?auto_19035 ) ( ON ?auto_19024 ?auto_19038 ) ( CLEAR ?auto_19024 ) ( not ( = ?auto_19025 ?auto_19038 ) ) ( not ( = ?auto_19026 ?auto_19038 ) ) ( not ( = ?auto_19024 ?auto_19038 ) ) ( not ( = ?auto_19036 ?auto_19038 ) ) ( not ( = ?auto_19030 ?auto_19038 ) ) ( not ( = ?auto_19023 ?auto_19038 ) ) ( SURFACE-AT ?auto_19022 ?auto_19031 ) ( CLEAR ?auto_19022 ) ( IS-CRATE ?auto_19023 ) ( not ( = ?auto_19022 ?auto_19023 ) ) ( not ( = ?auto_19025 ?auto_19022 ) ) ( not ( = ?auto_19026 ?auto_19022 ) ) ( not ( = ?auto_19024 ?auto_19022 ) ) ( not ( = ?auto_19036 ?auto_19022 ) ) ( not ( = ?auto_19030 ?auto_19022 ) ) ( not ( = ?auto_19038 ?auto_19022 ) ) ( AVAILABLE ?auto_19032 ) ( TRUCK-AT ?auto_19034 ?auto_19033 ) ( not ( = ?auto_19033 ?auto_19031 ) ) ( not ( = ?auto_19037 ?auto_19033 ) ) ( not ( = ?auto_19035 ?auto_19033 ) ) ( HOIST-AT ?auto_19027 ?auto_19033 ) ( not ( = ?auto_19032 ?auto_19027 ) ) ( not ( = ?auto_19029 ?auto_19027 ) ) ( not ( = ?auto_19028 ?auto_19027 ) ) ( AVAILABLE ?auto_19027 ) ( SURFACE-AT ?auto_19023 ?auto_19033 ) ( ON ?auto_19023 ?auto_19039 ) ( CLEAR ?auto_19023 ) ( not ( = ?auto_19025 ?auto_19039 ) ) ( not ( = ?auto_19026 ?auto_19039 ) ) ( not ( = ?auto_19024 ?auto_19039 ) ) ( not ( = ?auto_19036 ?auto_19039 ) ) ( not ( = ?auto_19030 ?auto_19039 ) ) ( not ( = ?auto_19023 ?auto_19039 ) ) ( not ( = ?auto_19038 ?auto_19039 ) ) ( not ( = ?auto_19022 ?auto_19039 ) ) ( ON ?auto_19022 ?auto_19021 ) ( not ( = ?auto_19021 ?auto_19022 ) ) ( not ( = ?auto_19021 ?auto_19023 ) ) ( not ( = ?auto_19021 ?auto_19024 ) ) ( not ( = ?auto_19021 ?auto_19025 ) ) ( not ( = ?auto_19021 ?auto_19026 ) ) ( not ( = ?auto_19021 ?auto_19036 ) ) ( not ( = ?auto_19021 ?auto_19030 ) ) ( not ( = ?auto_19021 ?auto_19038 ) ) ( not ( = ?auto_19021 ?auto_19039 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19024 ?auto_19025 ?auto_19026 )
      ( MAKE-5CRATE-VERIFY ?auto_19021 ?auto_19022 ?auto_19023 ?auto_19024 ?auto_19025 ?auto_19026 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19040 - SURFACE
      ?auto_19041 - SURFACE
    )
    :vars
    (
      ?auto_19047 - HOIST
      ?auto_19046 - PLACE
      ?auto_19057 - SURFACE
      ?auto_19052 - PLACE
      ?auto_19044 - HOIST
      ?auto_19051 - SURFACE
      ?auto_19050 - PLACE
      ?auto_19043 - HOIST
      ?auto_19045 - SURFACE
      ?auto_19054 - SURFACE
      ?auto_19053 - SURFACE
      ?auto_19056 - SURFACE
      ?auto_19048 - PLACE
      ?auto_19042 - HOIST
      ?auto_19055 - SURFACE
      ?auto_19049 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19047 ?auto_19046 ) ( IS-CRATE ?auto_19041 ) ( not ( = ?auto_19040 ?auto_19041 ) ) ( not ( = ?auto_19057 ?auto_19040 ) ) ( not ( = ?auto_19057 ?auto_19041 ) ) ( not ( = ?auto_19052 ?auto_19046 ) ) ( HOIST-AT ?auto_19044 ?auto_19052 ) ( not ( = ?auto_19047 ?auto_19044 ) ) ( AVAILABLE ?auto_19044 ) ( SURFACE-AT ?auto_19041 ?auto_19052 ) ( ON ?auto_19041 ?auto_19051 ) ( CLEAR ?auto_19041 ) ( not ( = ?auto_19040 ?auto_19051 ) ) ( not ( = ?auto_19041 ?auto_19051 ) ) ( not ( = ?auto_19057 ?auto_19051 ) ) ( IS-CRATE ?auto_19040 ) ( not ( = ?auto_19050 ?auto_19046 ) ) ( not ( = ?auto_19052 ?auto_19050 ) ) ( HOIST-AT ?auto_19043 ?auto_19050 ) ( not ( = ?auto_19047 ?auto_19043 ) ) ( not ( = ?auto_19044 ?auto_19043 ) ) ( SURFACE-AT ?auto_19040 ?auto_19050 ) ( ON ?auto_19040 ?auto_19045 ) ( CLEAR ?auto_19040 ) ( not ( = ?auto_19040 ?auto_19045 ) ) ( not ( = ?auto_19041 ?auto_19045 ) ) ( not ( = ?auto_19057 ?auto_19045 ) ) ( not ( = ?auto_19051 ?auto_19045 ) ) ( IS-CRATE ?auto_19057 ) ( not ( = ?auto_19054 ?auto_19057 ) ) ( not ( = ?auto_19040 ?auto_19054 ) ) ( not ( = ?auto_19041 ?auto_19054 ) ) ( not ( = ?auto_19051 ?auto_19054 ) ) ( not ( = ?auto_19045 ?auto_19054 ) ) ( AVAILABLE ?auto_19043 ) ( SURFACE-AT ?auto_19057 ?auto_19050 ) ( ON ?auto_19057 ?auto_19053 ) ( CLEAR ?auto_19057 ) ( not ( = ?auto_19040 ?auto_19053 ) ) ( not ( = ?auto_19041 ?auto_19053 ) ) ( not ( = ?auto_19057 ?auto_19053 ) ) ( not ( = ?auto_19051 ?auto_19053 ) ) ( not ( = ?auto_19045 ?auto_19053 ) ) ( not ( = ?auto_19054 ?auto_19053 ) ) ( SURFACE-AT ?auto_19056 ?auto_19046 ) ( CLEAR ?auto_19056 ) ( IS-CRATE ?auto_19054 ) ( not ( = ?auto_19056 ?auto_19054 ) ) ( not ( = ?auto_19040 ?auto_19056 ) ) ( not ( = ?auto_19041 ?auto_19056 ) ) ( not ( = ?auto_19057 ?auto_19056 ) ) ( not ( = ?auto_19051 ?auto_19056 ) ) ( not ( = ?auto_19045 ?auto_19056 ) ) ( not ( = ?auto_19053 ?auto_19056 ) ) ( AVAILABLE ?auto_19047 ) ( not ( = ?auto_19048 ?auto_19046 ) ) ( not ( = ?auto_19052 ?auto_19048 ) ) ( not ( = ?auto_19050 ?auto_19048 ) ) ( HOIST-AT ?auto_19042 ?auto_19048 ) ( not ( = ?auto_19047 ?auto_19042 ) ) ( not ( = ?auto_19044 ?auto_19042 ) ) ( not ( = ?auto_19043 ?auto_19042 ) ) ( AVAILABLE ?auto_19042 ) ( SURFACE-AT ?auto_19054 ?auto_19048 ) ( ON ?auto_19054 ?auto_19055 ) ( CLEAR ?auto_19054 ) ( not ( = ?auto_19040 ?auto_19055 ) ) ( not ( = ?auto_19041 ?auto_19055 ) ) ( not ( = ?auto_19057 ?auto_19055 ) ) ( not ( = ?auto_19051 ?auto_19055 ) ) ( not ( = ?auto_19045 ?auto_19055 ) ) ( not ( = ?auto_19054 ?auto_19055 ) ) ( not ( = ?auto_19053 ?auto_19055 ) ) ( not ( = ?auto_19056 ?auto_19055 ) ) ( TRUCK-AT ?auto_19049 ?auto_19046 ) )
    :subtasks
    ( ( !DRIVE ?auto_19049 ?auto_19046 ?auto_19048 )
      ( MAKE-2CRATE ?auto_19057 ?auto_19040 ?auto_19041 )
      ( MAKE-1CRATE-VERIFY ?auto_19040 ?auto_19041 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19058 - SURFACE
      ?auto_19059 - SURFACE
      ?auto_19060 - SURFACE
    )
    :vars
    (
      ?auto_19075 - HOIST
      ?auto_19067 - PLACE
      ?auto_19074 - PLACE
      ?auto_19064 - HOIST
      ?auto_19070 - SURFACE
      ?auto_19066 - PLACE
      ?auto_19069 - HOIST
      ?auto_19063 - SURFACE
      ?auto_19072 - SURFACE
      ?auto_19065 - SURFACE
      ?auto_19061 - SURFACE
      ?auto_19068 - PLACE
      ?auto_19062 - HOIST
      ?auto_19071 - SURFACE
      ?auto_19073 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19075 ?auto_19067 ) ( IS-CRATE ?auto_19060 ) ( not ( = ?auto_19059 ?auto_19060 ) ) ( not ( = ?auto_19058 ?auto_19059 ) ) ( not ( = ?auto_19058 ?auto_19060 ) ) ( not ( = ?auto_19074 ?auto_19067 ) ) ( HOIST-AT ?auto_19064 ?auto_19074 ) ( not ( = ?auto_19075 ?auto_19064 ) ) ( AVAILABLE ?auto_19064 ) ( SURFACE-AT ?auto_19060 ?auto_19074 ) ( ON ?auto_19060 ?auto_19070 ) ( CLEAR ?auto_19060 ) ( not ( = ?auto_19059 ?auto_19070 ) ) ( not ( = ?auto_19060 ?auto_19070 ) ) ( not ( = ?auto_19058 ?auto_19070 ) ) ( IS-CRATE ?auto_19059 ) ( not ( = ?auto_19066 ?auto_19067 ) ) ( not ( = ?auto_19074 ?auto_19066 ) ) ( HOIST-AT ?auto_19069 ?auto_19066 ) ( not ( = ?auto_19075 ?auto_19069 ) ) ( not ( = ?auto_19064 ?auto_19069 ) ) ( SURFACE-AT ?auto_19059 ?auto_19066 ) ( ON ?auto_19059 ?auto_19063 ) ( CLEAR ?auto_19059 ) ( not ( = ?auto_19059 ?auto_19063 ) ) ( not ( = ?auto_19060 ?auto_19063 ) ) ( not ( = ?auto_19058 ?auto_19063 ) ) ( not ( = ?auto_19070 ?auto_19063 ) ) ( IS-CRATE ?auto_19058 ) ( not ( = ?auto_19072 ?auto_19058 ) ) ( not ( = ?auto_19059 ?auto_19072 ) ) ( not ( = ?auto_19060 ?auto_19072 ) ) ( not ( = ?auto_19070 ?auto_19072 ) ) ( not ( = ?auto_19063 ?auto_19072 ) ) ( AVAILABLE ?auto_19069 ) ( SURFACE-AT ?auto_19058 ?auto_19066 ) ( ON ?auto_19058 ?auto_19065 ) ( CLEAR ?auto_19058 ) ( not ( = ?auto_19059 ?auto_19065 ) ) ( not ( = ?auto_19060 ?auto_19065 ) ) ( not ( = ?auto_19058 ?auto_19065 ) ) ( not ( = ?auto_19070 ?auto_19065 ) ) ( not ( = ?auto_19063 ?auto_19065 ) ) ( not ( = ?auto_19072 ?auto_19065 ) ) ( SURFACE-AT ?auto_19061 ?auto_19067 ) ( CLEAR ?auto_19061 ) ( IS-CRATE ?auto_19072 ) ( not ( = ?auto_19061 ?auto_19072 ) ) ( not ( = ?auto_19059 ?auto_19061 ) ) ( not ( = ?auto_19060 ?auto_19061 ) ) ( not ( = ?auto_19058 ?auto_19061 ) ) ( not ( = ?auto_19070 ?auto_19061 ) ) ( not ( = ?auto_19063 ?auto_19061 ) ) ( not ( = ?auto_19065 ?auto_19061 ) ) ( AVAILABLE ?auto_19075 ) ( not ( = ?auto_19068 ?auto_19067 ) ) ( not ( = ?auto_19074 ?auto_19068 ) ) ( not ( = ?auto_19066 ?auto_19068 ) ) ( HOIST-AT ?auto_19062 ?auto_19068 ) ( not ( = ?auto_19075 ?auto_19062 ) ) ( not ( = ?auto_19064 ?auto_19062 ) ) ( not ( = ?auto_19069 ?auto_19062 ) ) ( AVAILABLE ?auto_19062 ) ( SURFACE-AT ?auto_19072 ?auto_19068 ) ( ON ?auto_19072 ?auto_19071 ) ( CLEAR ?auto_19072 ) ( not ( = ?auto_19059 ?auto_19071 ) ) ( not ( = ?auto_19060 ?auto_19071 ) ) ( not ( = ?auto_19058 ?auto_19071 ) ) ( not ( = ?auto_19070 ?auto_19071 ) ) ( not ( = ?auto_19063 ?auto_19071 ) ) ( not ( = ?auto_19072 ?auto_19071 ) ) ( not ( = ?auto_19065 ?auto_19071 ) ) ( not ( = ?auto_19061 ?auto_19071 ) ) ( TRUCK-AT ?auto_19073 ?auto_19067 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19059 ?auto_19060 )
      ( MAKE-2CRATE-VERIFY ?auto_19058 ?auto_19059 ?auto_19060 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19076 - SURFACE
      ?auto_19077 - SURFACE
      ?auto_19078 - SURFACE
      ?auto_19079 - SURFACE
    )
    :vars
    (
      ?auto_19081 - HOIST
      ?auto_19088 - PLACE
      ?auto_19083 - PLACE
      ?auto_19090 - HOIST
      ?auto_19086 - SURFACE
      ?auto_19082 - PLACE
      ?auto_19087 - HOIST
      ?auto_19080 - SURFACE
      ?auto_19092 - SURFACE
      ?auto_19089 - SURFACE
      ?auto_19085 - PLACE
      ?auto_19091 - HOIST
      ?auto_19084 - SURFACE
      ?auto_19093 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19081 ?auto_19088 ) ( IS-CRATE ?auto_19079 ) ( not ( = ?auto_19078 ?auto_19079 ) ) ( not ( = ?auto_19077 ?auto_19078 ) ) ( not ( = ?auto_19077 ?auto_19079 ) ) ( not ( = ?auto_19083 ?auto_19088 ) ) ( HOIST-AT ?auto_19090 ?auto_19083 ) ( not ( = ?auto_19081 ?auto_19090 ) ) ( AVAILABLE ?auto_19090 ) ( SURFACE-AT ?auto_19079 ?auto_19083 ) ( ON ?auto_19079 ?auto_19086 ) ( CLEAR ?auto_19079 ) ( not ( = ?auto_19078 ?auto_19086 ) ) ( not ( = ?auto_19079 ?auto_19086 ) ) ( not ( = ?auto_19077 ?auto_19086 ) ) ( IS-CRATE ?auto_19078 ) ( not ( = ?auto_19082 ?auto_19088 ) ) ( not ( = ?auto_19083 ?auto_19082 ) ) ( HOIST-AT ?auto_19087 ?auto_19082 ) ( not ( = ?auto_19081 ?auto_19087 ) ) ( not ( = ?auto_19090 ?auto_19087 ) ) ( SURFACE-AT ?auto_19078 ?auto_19082 ) ( ON ?auto_19078 ?auto_19080 ) ( CLEAR ?auto_19078 ) ( not ( = ?auto_19078 ?auto_19080 ) ) ( not ( = ?auto_19079 ?auto_19080 ) ) ( not ( = ?auto_19077 ?auto_19080 ) ) ( not ( = ?auto_19086 ?auto_19080 ) ) ( IS-CRATE ?auto_19077 ) ( not ( = ?auto_19076 ?auto_19077 ) ) ( not ( = ?auto_19078 ?auto_19076 ) ) ( not ( = ?auto_19079 ?auto_19076 ) ) ( not ( = ?auto_19086 ?auto_19076 ) ) ( not ( = ?auto_19080 ?auto_19076 ) ) ( AVAILABLE ?auto_19087 ) ( SURFACE-AT ?auto_19077 ?auto_19082 ) ( ON ?auto_19077 ?auto_19092 ) ( CLEAR ?auto_19077 ) ( not ( = ?auto_19078 ?auto_19092 ) ) ( not ( = ?auto_19079 ?auto_19092 ) ) ( not ( = ?auto_19077 ?auto_19092 ) ) ( not ( = ?auto_19086 ?auto_19092 ) ) ( not ( = ?auto_19080 ?auto_19092 ) ) ( not ( = ?auto_19076 ?auto_19092 ) ) ( SURFACE-AT ?auto_19089 ?auto_19088 ) ( CLEAR ?auto_19089 ) ( IS-CRATE ?auto_19076 ) ( not ( = ?auto_19089 ?auto_19076 ) ) ( not ( = ?auto_19078 ?auto_19089 ) ) ( not ( = ?auto_19079 ?auto_19089 ) ) ( not ( = ?auto_19077 ?auto_19089 ) ) ( not ( = ?auto_19086 ?auto_19089 ) ) ( not ( = ?auto_19080 ?auto_19089 ) ) ( not ( = ?auto_19092 ?auto_19089 ) ) ( AVAILABLE ?auto_19081 ) ( not ( = ?auto_19085 ?auto_19088 ) ) ( not ( = ?auto_19083 ?auto_19085 ) ) ( not ( = ?auto_19082 ?auto_19085 ) ) ( HOIST-AT ?auto_19091 ?auto_19085 ) ( not ( = ?auto_19081 ?auto_19091 ) ) ( not ( = ?auto_19090 ?auto_19091 ) ) ( not ( = ?auto_19087 ?auto_19091 ) ) ( AVAILABLE ?auto_19091 ) ( SURFACE-AT ?auto_19076 ?auto_19085 ) ( ON ?auto_19076 ?auto_19084 ) ( CLEAR ?auto_19076 ) ( not ( = ?auto_19078 ?auto_19084 ) ) ( not ( = ?auto_19079 ?auto_19084 ) ) ( not ( = ?auto_19077 ?auto_19084 ) ) ( not ( = ?auto_19086 ?auto_19084 ) ) ( not ( = ?auto_19080 ?auto_19084 ) ) ( not ( = ?auto_19076 ?auto_19084 ) ) ( not ( = ?auto_19092 ?auto_19084 ) ) ( not ( = ?auto_19089 ?auto_19084 ) ) ( TRUCK-AT ?auto_19093 ?auto_19088 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19077 ?auto_19078 ?auto_19079 )
      ( MAKE-3CRATE-VERIFY ?auto_19076 ?auto_19077 ?auto_19078 ?auto_19079 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19094 - SURFACE
      ?auto_19095 - SURFACE
      ?auto_19096 - SURFACE
      ?auto_19097 - SURFACE
      ?auto_19098 - SURFACE
    )
    :vars
    (
      ?auto_19100 - HOIST
      ?auto_19107 - PLACE
      ?auto_19102 - PLACE
      ?auto_19108 - HOIST
      ?auto_19105 - SURFACE
      ?auto_19101 - PLACE
      ?auto_19106 - HOIST
      ?auto_19099 - SURFACE
      ?auto_19110 - SURFACE
      ?auto_19104 - PLACE
      ?auto_19109 - HOIST
      ?auto_19103 - SURFACE
      ?auto_19111 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19100 ?auto_19107 ) ( IS-CRATE ?auto_19098 ) ( not ( = ?auto_19097 ?auto_19098 ) ) ( not ( = ?auto_19096 ?auto_19097 ) ) ( not ( = ?auto_19096 ?auto_19098 ) ) ( not ( = ?auto_19102 ?auto_19107 ) ) ( HOIST-AT ?auto_19108 ?auto_19102 ) ( not ( = ?auto_19100 ?auto_19108 ) ) ( AVAILABLE ?auto_19108 ) ( SURFACE-AT ?auto_19098 ?auto_19102 ) ( ON ?auto_19098 ?auto_19105 ) ( CLEAR ?auto_19098 ) ( not ( = ?auto_19097 ?auto_19105 ) ) ( not ( = ?auto_19098 ?auto_19105 ) ) ( not ( = ?auto_19096 ?auto_19105 ) ) ( IS-CRATE ?auto_19097 ) ( not ( = ?auto_19101 ?auto_19107 ) ) ( not ( = ?auto_19102 ?auto_19101 ) ) ( HOIST-AT ?auto_19106 ?auto_19101 ) ( not ( = ?auto_19100 ?auto_19106 ) ) ( not ( = ?auto_19108 ?auto_19106 ) ) ( SURFACE-AT ?auto_19097 ?auto_19101 ) ( ON ?auto_19097 ?auto_19099 ) ( CLEAR ?auto_19097 ) ( not ( = ?auto_19097 ?auto_19099 ) ) ( not ( = ?auto_19098 ?auto_19099 ) ) ( not ( = ?auto_19096 ?auto_19099 ) ) ( not ( = ?auto_19105 ?auto_19099 ) ) ( IS-CRATE ?auto_19096 ) ( not ( = ?auto_19095 ?auto_19096 ) ) ( not ( = ?auto_19097 ?auto_19095 ) ) ( not ( = ?auto_19098 ?auto_19095 ) ) ( not ( = ?auto_19105 ?auto_19095 ) ) ( not ( = ?auto_19099 ?auto_19095 ) ) ( AVAILABLE ?auto_19106 ) ( SURFACE-AT ?auto_19096 ?auto_19101 ) ( ON ?auto_19096 ?auto_19110 ) ( CLEAR ?auto_19096 ) ( not ( = ?auto_19097 ?auto_19110 ) ) ( not ( = ?auto_19098 ?auto_19110 ) ) ( not ( = ?auto_19096 ?auto_19110 ) ) ( not ( = ?auto_19105 ?auto_19110 ) ) ( not ( = ?auto_19099 ?auto_19110 ) ) ( not ( = ?auto_19095 ?auto_19110 ) ) ( SURFACE-AT ?auto_19094 ?auto_19107 ) ( CLEAR ?auto_19094 ) ( IS-CRATE ?auto_19095 ) ( not ( = ?auto_19094 ?auto_19095 ) ) ( not ( = ?auto_19097 ?auto_19094 ) ) ( not ( = ?auto_19098 ?auto_19094 ) ) ( not ( = ?auto_19096 ?auto_19094 ) ) ( not ( = ?auto_19105 ?auto_19094 ) ) ( not ( = ?auto_19099 ?auto_19094 ) ) ( not ( = ?auto_19110 ?auto_19094 ) ) ( AVAILABLE ?auto_19100 ) ( not ( = ?auto_19104 ?auto_19107 ) ) ( not ( = ?auto_19102 ?auto_19104 ) ) ( not ( = ?auto_19101 ?auto_19104 ) ) ( HOIST-AT ?auto_19109 ?auto_19104 ) ( not ( = ?auto_19100 ?auto_19109 ) ) ( not ( = ?auto_19108 ?auto_19109 ) ) ( not ( = ?auto_19106 ?auto_19109 ) ) ( AVAILABLE ?auto_19109 ) ( SURFACE-AT ?auto_19095 ?auto_19104 ) ( ON ?auto_19095 ?auto_19103 ) ( CLEAR ?auto_19095 ) ( not ( = ?auto_19097 ?auto_19103 ) ) ( not ( = ?auto_19098 ?auto_19103 ) ) ( not ( = ?auto_19096 ?auto_19103 ) ) ( not ( = ?auto_19105 ?auto_19103 ) ) ( not ( = ?auto_19099 ?auto_19103 ) ) ( not ( = ?auto_19095 ?auto_19103 ) ) ( not ( = ?auto_19110 ?auto_19103 ) ) ( not ( = ?auto_19094 ?auto_19103 ) ) ( TRUCK-AT ?auto_19111 ?auto_19107 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19096 ?auto_19097 ?auto_19098 )
      ( MAKE-4CRATE-VERIFY ?auto_19094 ?auto_19095 ?auto_19096 ?auto_19097 ?auto_19098 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19112 - SURFACE
      ?auto_19113 - SURFACE
      ?auto_19114 - SURFACE
      ?auto_19115 - SURFACE
      ?auto_19116 - SURFACE
      ?auto_19117 - SURFACE
    )
    :vars
    (
      ?auto_19119 - HOIST
      ?auto_19126 - PLACE
      ?auto_19121 - PLACE
      ?auto_19127 - HOIST
      ?auto_19124 - SURFACE
      ?auto_19120 - PLACE
      ?auto_19125 - HOIST
      ?auto_19118 - SURFACE
      ?auto_19129 - SURFACE
      ?auto_19123 - PLACE
      ?auto_19128 - HOIST
      ?auto_19122 - SURFACE
      ?auto_19130 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19119 ?auto_19126 ) ( IS-CRATE ?auto_19117 ) ( not ( = ?auto_19116 ?auto_19117 ) ) ( not ( = ?auto_19115 ?auto_19116 ) ) ( not ( = ?auto_19115 ?auto_19117 ) ) ( not ( = ?auto_19121 ?auto_19126 ) ) ( HOIST-AT ?auto_19127 ?auto_19121 ) ( not ( = ?auto_19119 ?auto_19127 ) ) ( AVAILABLE ?auto_19127 ) ( SURFACE-AT ?auto_19117 ?auto_19121 ) ( ON ?auto_19117 ?auto_19124 ) ( CLEAR ?auto_19117 ) ( not ( = ?auto_19116 ?auto_19124 ) ) ( not ( = ?auto_19117 ?auto_19124 ) ) ( not ( = ?auto_19115 ?auto_19124 ) ) ( IS-CRATE ?auto_19116 ) ( not ( = ?auto_19120 ?auto_19126 ) ) ( not ( = ?auto_19121 ?auto_19120 ) ) ( HOIST-AT ?auto_19125 ?auto_19120 ) ( not ( = ?auto_19119 ?auto_19125 ) ) ( not ( = ?auto_19127 ?auto_19125 ) ) ( SURFACE-AT ?auto_19116 ?auto_19120 ) ( ON ?auto_19116 ?auto_19118 ) ( CLEAR ?auto_19116 ) ( not ( = ?auto_19116 ?auto_19118 ) ) ( not ( = ?auto_19117 ?auto_19118 ) ) ( not ( = ?auto_19115 ?auto_19118 ) ) ( not ( = ?auto_19124 ?auto_19118 ) ) ( IS-CRATE ?auto_19115 ) ( not ( = ?auto_19114 ?auto_19115 ) ) ( not ( = ?auto_19116 ?auto_19114 ) ) ( not ( = ?auto_19117 ?auto_19114 ) ) ( not ( = ?auto_19124 ?auto_19114 ) ) ( not ( = ?auto_19118 ?auto_19114 ) ) ( AVAILABLE ?auto_19125 ) ( SURFACE-AT ?auto_19115 ?auto_19120 ) ( ON ?auto_19115 ?auto_19129 ) ( CLEAR ?auto_19115 ) ( not ( = ?auto_19116 ?auto_19129 ) ) ( not ( = ?auto_19117 ?auto_19129 ) ) ( not ( = ?auto_19115 ?auto_19129 ) ) ( not ( = ?auto_19124 ?auto_19129 ) ) ( not ( = ?auto_19118 ?auto_19129 ) ) ( not ( = ?auto_19114 ?auto_19129 ) ) ( SURFACE-AT ?auto_19113 ?auto_19126 ) ( CLEAR ?auto_19113 ) ( IS-CRATE ?auto_19114 ) ( not ( = ?auto_19113 ?auto_19114 ) ) ( not ( = ?auto_19116 ?auto_19113 ) ) ( not ( = ?auto_19117 ?auto_19113 ) ) ( not ( = ?auto_19115 ?auto_19113 ) ) ( not ( = ?auto_19124 ?auto_19113 ) ) ( not ( = ?auto_19118 ?auto_19113 ) ) ( not ( = ?auto_19129 ?auto_19113 ) ) ( AVAILABLE ?auto_19119 ) ( not ( = ?auto_19123 ?auto_19126 ) ) ( not ( = ?auto_19121 ?auto_19123 ) ) ( not ( = ?auto_19120 ?auto_19123 ) ) ( HOIST-AT ?auto_19128 ?auto_19123 ) ( not ( = ?auto_19119 ?auto_19128 ) ) ( not ( = ?auto_19127 ?auto_19128 ) ) ( not ( = ?auto_19125 ?auto_19128 ) ) ( AVAILABLE ?auto_19128 ) ( SURFACE-AT ?auto_19114 ?auto_19123 ) ( ON ?auto_19114 ?auto_19122 ) ( CLEAR ?auto_19114 ) ( not ( = ?auto_19116 ?auto_19122 ) ) ( not ( = ?auto_19117 ?auto_19122 ) ) ( not ( = ?auto_19115 ?auto_19122 ) ) ( not ( = ?auto_19124 ?auto_19122 ) ) ( not ( = ?auto_19118 ?auto_19122 ) ) ( not ( = ?auto_19114 ?auto_19122 ) ) ( not ( = ?auto_19129 ?auto_19122 ) ) ( not ( = ?auto_19113 ?auto_19122 ) ) ( TRUCK-AT ?auto_19130 ?auto_19126 ) ( ON ?auto_19113 ?auto_19112 ) ( not ( = ?auto_19112 ?auto_19113 ) ) ( not ( = ?auto_19112 ?auto_19114 ) ) ( not ( = ?auto_19112 ?auto_19115 ) ) ( not ( = ?auto_19112 ?auto_19116 ) ) ( not ( = ?auto_19112 ?auto_19117 ) ) ( not ( = ?auto_19112 ?auto_19124 ) ) ( not ( = ?auto_19112 ?auto_19118 ) ) ( not ( = ?auto_19112 ?auto_19129 ) ) ( not ( = ?auto_19112 ?auto_19122 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19115 ?auto_19116 ?auto_19117 )
      ( MAKE-5CRATE-VERIFY ?auto_19112 ?auto_19113 ?auto_19114 ?auto_19115 ?auto_19116 ?auto_19117 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19131 - SURFACE
      ?auto_19132 - SURFACE
    )
    :vars
    (
      ?auto_19135 - HOIST
      ?auto_19142 - PLACE
      ?auto_19145 - SURFACE
      ?auto_19137 - PLACE
      ?auto_19144 - HOIST
      ?auto_19140 - SURFACE
      ?auto_19136 - PLACE
      ?auto_19141 - HOIST
      ?auto_19133 - SURFACE
      ?auto_19134 - SURFACE
      ?auto_19147 - SURFACE
      ?auto_19143 - SURFACE
      ?auto_19139 - PLACE
      ?auto_19146 - HOIST
      ?auto_19138 - SURFACE
      ?auto_19148 - TRUCK
      ?auto_19149 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19135 ?auto_19142 ) ( IS-CRATE ?auto_19132 ) ( not ( = ?auto_19131 ?auto_19132 ) ) ( not ( = ?auto_19145 ?auto_19131 ) ) ( not ( = ?auto_19145 ?auto_19132 ) ) ( not ( = ?auto_19137 ?auto_19142 ) ) ( HOIST-AT ?auto_19144 ?auto_19137 ) ( not ( = ?auto_19135 ?auto_19144 ) ) ( AVAILABLE ?auto_19144 ) ( SURFACE-AT ?auto_19132 ?auto_19137 ) ( ON ?auto_19132 ?auto_19140 ) ( CLEAR ?auto_19132 ) ( not ( = ?auto_19131 ?auto_19140 ) ) ( not ( = ?auto_19132 ?auto_19140 ) ) ( not ( = ?auto_19145 ?auto_19140 ) ) ( IS-CRATE ?auto_19131 ) ( not ( = ?auto_19136 ?auto_19142 ) ) ( not ( = ?auto_19137 ?auto_19136 ) ) ( HOIST-AT ?auto_19141 ?auto_19136 ) ( not ( = ?auto_19135 ?auto_19141 ) ) ( not ( = ?auto_19144 ?auto_19141 ) ) ( SURFACE-AT ?auto_19131 ?auto_19136 ) ( ON ?auto_19131 ?auto_19133 ) ( CLEAR ?auto_19131 ) ( not ( = ?auto_19131 ?auto_19133 ) ) ( not ( = ?auto_19132 ?auto_19133 ) ) ( not ( = ?auto_19145 ?auto_19133 ) ) ( not ( = ?auto_19140 ?auto_19133 ) ) ( IS-CRATE ?auto_19145 ) ( not ( = ?auto_19134 ?auto_19145 ) ) ( not ( = ?auto_19131 ?auto_19134 ) ) ( not ( = ?auto_19132 ?auto_19134 ) ) ( not ( = ?auto_19140 ?auto_19134 ) ) ( not ( = ?auto_19133 ?auto_19134 ) ) ( AVAILABLE ?auto_19141 ) ( SURFACE-AT ?auto_19145 ?auto_19136 ) ( ON ?auto_19145 ?auto_19147 ) ( CLEAR ?auto_19145 ) ( not ( = ?auto_19131 ?auto_19147 ) ) ( not ( = ?auto_19132 ?auto_19147 ) ) ( not ( = ?auto_19145 ?auto_19147 ) ) ( not ( = ?auto_19140 ?auto_19147 ) ) ( not ( = ?auto_19133 ?auto_19147 ) ) ( not ( = ?auto_19134 ?auto_19147 ) ) ( IS-CRATE ?auto_19134 ) ( not ( = ?auto_19143 ?auto_19134 ) ) ( not ( = ?auto_19131 ?auto_19143 ) ) ( not ( = ?auto_19132 ?auto_19143 ) ) ( not ( = ?auto_19145 ?auto_19143 ) ) ( not ( = ?auto_19140 ?auto_19143 ) ) ( not ( = ?auto_19133 ?auto_19143 ) ) ( not ( = ?auto_19147 ?auto_19143 ) ) ( not ( = ?auto_19139 ?auto_19142 ) ) ( not ( = ?auto_19137 ?auto_19139 ) ) ( not ( = ?auto_19136 ?auto_19139 ) ) ( HOIST-AT ?auto_19146 ?auto_19139 ) ( not ( = ?auto_19135 ?auto_19146 ) ) ( not ( = ?auto_19144 ?auto_19146 ) ) ( not ( = ?auto_19141 ?auto_19146 ) ) ( AVAILABLE ?auto_19146 ) ( SURFACE-AT ?auto_19134 ?auto_19139 ) ( ON ?auto_19134 ?auto_19138 ) ( CLEAR ?auto_19134 ) ( not ( = ?auto_19131 ?auto_19138 ) ) ( not ( = ?auto_19132 ?auto_19138 ) ) ( not ( = ?auto_19145 ?auto_19138 ) ) ( not ( = ?auto_19140 ?auto_19138 ) ) ( not ( = ?auto_19133 ?auto_19138 ) ) ( not ( = ?auto_19134 ?auto_19138 ) ) ( not ( = ?auto_19147 ?auto_19138 ) ) ( not ( = ?auto_19143 ?auto_19138 ) ) ( TRUCK-AT ?auto_19148 ?auto_19142 ) ( SURFACE-AT ?auto_19149 ?auto_19142 ) ( CLEAR ?auto_19149 ) ( LIFTING ?auto_19135 ?auto_19143 ) ( IS-CRATE ?auto_19143 ) ( not ( = ?auto_19149 ?auto_19143 ) ) ( not ( = ?auto_19131 ?auto_19149 ) ) ( not ( = ?auto_19132 ?auto_19149 ) ) ( not ( = ?auto_19145 ?auto_19149 ) ) ( not ( = ?auto_19140 ?auto_19149 ) ) ( not ( = ?auto_19133 ?auto_19149 ) ) ( not ( = ?auto_19134 ?auto_19149 ) ) ( not ( = ?auto_19147 ?auto_19149 ) ) ( not ( = ?auto_19138 ?auto_19149 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19149 ?auto_19143 )
      ( MAKE-2CRATE ?auto_19145 ?auto_19131 ?auto_19132 )
      ( MAKE-1CRATE-VERIFY ?auto_19131 ?auto_19132 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19150 - SURFACE
      ?auto_19151 - SURFACE
      ?auto_19152 - SURFACE
    )
    :vars
    (
      ?auto_19156 - HOIST
      ?auto_19161 - PLACE
      ?auto_19155 - PLACE
      ?auto_19163 - HOIST
      ?auto_19164 - SURFACE
      ?auto_19166 - PLACE
      ?auto_19157 - HOIST
      ?auto_19168 - SURFACE
      ?auto_19167 - SURFACE
      ?auto_19165 - SURFACE
      ?auto_19162 - SURFACE
      ?auto_19158 - PLACE
      ?auto_19160 - HOIST
      ?auto_19159 - SURFACE
      ?auto_19153 - TRUCK
      ?auto_19154 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19156 ?auto_19161 ) ( IS-CRATE ?auto_19152 ) ( not ( = ?auto_19151 ?auto_19152 ) ) ( not ( = ?auto_19150 ?auto_19151 ) ) ( not ( = ?auto_19150 ?auto_19152 ) ) ( not ( = ?auto_19155 ?auto_19161 ) ) ( HOIST-AT ?auto_19163 ?auto_19155 ) ( not ( = ?auto_19156 ?auto_19163 ) ) ( AVAILABLE ?auto_19163 ) ( SURFACE-AT ?auto_19152 ?auto_19155 ) ( ON ?auto_19152 ?auto_19164 ) ( CLEAR ?auto_19152 ) ( not ( = ?auto_19151 ?auto_19164 ) ) ( not ( = ?auto_19152 ?auto_19164 ) ) ( not ( = ?auto_19150 ?auto_19164 ) ) ( IS-CRATE ?auto_19151 ) ( not ( = ?auto_19166 ?auto_19161 ) ) ( not ( = ?auto_19155 ?auto_19166 ) ) ( HOIST-AT ?auto_19157 ?auto_19166 ) ( not ( = ?auto_19156 ?auto_19157 ) ) ( not ( = ?auto_19163 ?auto_19157 ) ) ( SURFACE-AT ?auto_19151 ?auto_19166 ) ( ON ?auto_19151 ?auto_19168 ) ( CLEAR ?auto_19151 ) ( not ( = ?auto_19151 ?auto_19168 ) ) ( not ( = ?auto_19152 ?auto_19168 ) ) ( not ( = ?auto_19150 ?auto_19168 ) ) ( not ( = ?auto_19164 ?auto_19168 ) ) ( IS-CRATE ?auto_19150 ) ( not ( = ?auto_19167 ?auto_19150 ) ) ( not ( = ?auto_19151 ?auto_19167 ) ) ( not ( = ?auto_19152 ?auto_19167 ) ) ( not ( = ?auto_19164 ?auto_19167 ) ) ( not ( = ?auto_19168 ?auto_19167 ) ) ( AVAILABLE ?auto_19157 ) ( SURFACE-AT ?auto_19150 ?auto_19166 ) ( ON ?auto_19150 ?auto_19165 ) ( CLEAR ?auto_19150 ) ( not ( = ?auto_19151 ?auto_19165 ) ) ( not ( = ?auto_19152 ?auto_19165 ) ) ( not ( = ?auto_19150 ?auto_19165 ) ) ( not ( = ?auto_19164 ?auto_19165 ) ) ( not ( = ?auto_19168 ?auto_19165 ) ) ( not ( = ?auto_19167 ?auto_19165 ) ) ( IS-CRATE ?auto_19167 ) ( not ( = ?auto_19162 ?auto_19167 ) ) ( not ( = ?auto_19151 ?auto_19162 ) ) ( not ( = ?auto_19152 ?auto_19162 ) ) ( not ( = ?auto_19150 ?auto_19162 ) ) ( not ( = ?auto_19164 ?auto_19162 ) ) ( not ( = ?auto_19168 ?auto_19162 ) ) ( not ( = ?auto_19165 ?auto_19162 ) ) ( not ( = ?auto_19158 ?auto_19161 ) ) ( not ( = ?auto_19155 ?auto_19158 ) ) ( not ( = ?auto_19166 ?auto_19158 ) ) ( HOIST-AT ?auto_19160 ?auto_19158 ) ( not ( = ?auto_19156 ?auto_19160 ) ) ( not ( = ?auto_19163 ?auto_19160 ) ) ( not ( = ?auto_19157 ?auto_19160 ) ) ( AVAILABLE ?auto_19160 ) ( SURFACE-AT ?auto_19167 ?auto_19158 ) ( ON ?auto_19167 ?auto_19159 ) ( CLEAR ?auto_19167 ) ( not ( = ?auto_19151 ?auto_19159 ) ) ( not ( = ?auto_19152 ?auto_19159 ) ) ( not ( = ?auto_19150 ?auto_19159 ) ) ( not ( = ?auto_19164 ?auto_19159 ) ) ( not ( = ?auto_19168 ?auto_19159 ) ) ( not ( = ?auto_19167 ?auto_19159 ) ) ( not ( = ?auto_19165 ?auto_19159 ) ) ( not ( = ?auto_19162 ?auto_19159 ) ) ( TRUCK-AT ?auto_19153 ?auto_19161 ) ( SURFACE-AT ?auto_19154 ?auto_19161 ) ( CLEAR ?auto_19154 ) ( LIFTING ?auto_19156 ?auto_19162 ) ( IS-CRATE ?auto_19162 ) ( not ( = ?auto_19154 ?auto_19162 ) ) ( not ( = ?auto_19151 ?auto_19154 ) ) ( not ( = ?auto_19152 ?auto_19154 ) ) ( not ( = ?auto_19150 ?auto_19154 ) ) ( not ( = ?auto_19164 ?auto_19154 ) ) ( not ( = ?auto_19168 ?auto_19154 ) ) ( not ( = ?auto_19167 ?auto_19154 ) ) ( not ( = ?auto_19165 ?auto_19154 ) ) ( not ( = ?auto_19159 ?auto_19154 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19151 ?auto_19152 )
      ( MAKE-2CRATE-VERIFY ?auto_19150 ?auto_19151 ?auto_19152 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19169 - SURFACE
      ?auto_19170 - SURFACE
      ?auto_19171 - SURFACE
      ?auto_19172 - SURFACE
    )
    :vars
    (
      ?auto_19174 - HOIST
      ?auto_19173 - PLACE
      ?auto_19180 - PLACE
      ?auto_19187 - HOIST
      ?auto_19175 - SURFACE
      ?auto_19185 - PLACE
      ?auto_19186 - HOIST
      ?auto_19176 - SURFACE
      ?auto_19181 - SURFACE
      ?auto_19184 - SURFACE
      ?auto_19183 - PLACE
      ?auto_19182 - HOIST
      ?auto_19179 - SURFACE
      ?auto_19178 - TRUCK
      ?auto_19177 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19174 ?auto_19173 ) ( IS-CRATE ?auto_19172 ) ( not ( = ?auto_19171 ?auto_19172 ) ) ( not ( = ?auto_19170 ?auto_19171 ) ) ( not ( = ?auto_19170 ?auto_19172 ) ) ( not ( = ?auto_19180 ?auto_19173 ) ) ( HOIST-AT ?auto_19187 ?auto_19180 ) ( not ( = ?auto_19174 ?auto_19187 ) ) ( AVAILABLE ?auto_19187 ) ( SURFACE-AT ?auto_19172 ?auto_19180 ) ( ON ?auto_19172 ?auto_19175 ) ( CLEAR ?auto_19172 ) ( not ( = ?auto_19171 ?auto_19175 ) ) ( not ( = ?auto_19172 ?auto_19175 ) ) ( not ( = ?auto_19170 ?auto_19175 ) ) ( IS-CRATE ?auto_19171 ) ( not ( = ?auto_19185 ?auto_19173 ) ) ( not ( = ?auto_19180 ?auto_19185 ) ) ( HOIST-AT ?auto_19186 ?auto_19185 ) ( not ( = ?auto_19174 ?auto_19186 ) ) ( not ( = ?auto_19187 ?auto_19186 ) ) ( SURFACE-AT ?auto_19171 ?auto_19185 ) ( ON ?auto_19171 ?auto_19176 ) ( CLEAR ?auto_19171 ) ( not ( = ?auto_19171 ?auto_19176 ) ) ( not ( = ?auto_19172 ?auto_19176 ) ) ( not ( = ?auto_19170 ?auto_19176 ) ) ( not ( = ?auto_19175 ?auto_19176 ) ) ( IS-CRATE ?auto_19170 ) ( not ( = ?auto_19169 ?auto_19170 ) ) ( not ( = ?auto_19171 ?auto_19169 ) ) ( not ( = ?auto_19172 ?auto_19169 ) ) ( not ( = ?auto_19175 ?auto_19169 ) ) ( not ( = ?auto_19176 ?auto_19169 ) ) ( AVAILABLE ?auto_19186 ) ( SURFACE-AT ?auto_19170 ?auto_19185 ) ( ON ?auto_19170 ?auto_19181 ) ( CLEAR ?auto_19170 ) ( not ( = ?auto_19171 ?auto_19181 ) ) ( not ( = ?auto_19172 ?auto_19181 ) ) ( not ( = ?auto_19170 ?auto_19181 ) ) ( not ( = ?auto_19175 ?auto_19181 ) ) ( not ( = ?auto_19176 ?auto_19181 ) ) ( not ( = ?auto_19169 ?auto_19181 ) ) ( IS-CRATE ?auto_19169 ) ( not ( = ?auto_19184 ?auto_19169 ) ) ( not ( = ?auto_19171 ?auto_19184 ) ) ( not ( = ?auto_19172 ?auto_19184 ) ) ( not ( = ?auto_19170 ?auto_19184 ) ) ( not ( = ?auto_19175 ?auto_19184 ) ) ( not ( = ?auto_19176 ?auto_19184 ) ) ( not ( = ?auto_19181 ?auto_19184 ) ) ( not ( = ?auto_19183 ?auto_19173 ) ) ( not ( = ?auto_19180 ?auto_19183 ) ) ( not ( = ?auto_19185 ?auto_19183 ) ) ( HOIST-AT ?auto_19182 ?auto_19183 ) ( not ( = ?auto_19174 ?auto_19182 ) ) ( not ( = ?auto_19187 ?auto_19182 ) ) ( not ( = ?auto_19186 ?auto_19182 ) ) ( AVAILABLE ?auto_19182 ) ( SURFACE-AT ?auto_19169 ?auto_19183 ) ( ON ?auto_19169 ?auto_19179 ) ( CLEAR ?auto_19169 ) ( not ( = ?auto_19171 ?auto_19179 ) ) ( not ( = ?auto_19172 ?auto_19179 ) ) ( not ( = ?auto_19170 ?auto_19179 ) ) ( not ( = ?auto_19175 ?auto_19179 ) ) ( not ( = ?auto_19176 ?auto_19179 ) ) ( not ( = ?auto_19169 ?auto_19179 ) ) ( not ( = ?auto_19181 ?auto_19179 ) ) ( not ( = ?auto_19184 ?auto_19179 ) ) ( TRUCK-AT ?auto_19178 ?auto_19173 ) ( SURFACE-AT ?auto_19177 ?auto_19173 ) ( CLEAR ?auto_19177 ) ( LIFTING ?auto_19174 ?auto_19184 ) ( IS-CRATE ?auto_19184 ) ( not ( = ?auto_19177 ?auto_19184 ) ) ( not ( = ?auto_19171 ?auto_19177 ) ) ( not ( = ?auto_19172 ?auto_19177 ) ) ( not ( = ?auto_19170 ?auto_19177 ) ) ( not ( = ?auto_19175 ?auto_19177 ) ) ( not ( = ?auto_19176 ?auto_19177 ) ) ( not ( = ?auto_19169 ?auto_19177 ) ) ( not ( = ?auto_19181 ?auto_19177 ) ) ( not ( = ?auto_19179 ?auto_19177 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19170 ?auto_19171 ?auto_19172 )
      ( MAKE-3CRATE-VERIFY ?auto_19169 ?auto_19170 ?auto_19171 ?auto_19172 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19188 - SURFACE
      ?auto_19189 - SURFACE
      ?auto_19190 - SURFACE
      ?auto_19191 - SURFACE
      ?auto_19192 - SURFACE
    )
    :vars
    (
      ?auto_19194 - HOIST
      ?auto_19193 - PLACE
      ?auto_19200 - PLACE
      ?auto_19206 - HOIST
      ?auto_19195 - SURFACE
      ?auto_19204 - PLACE
      ?auto_19205 - HOIST
      ?auto_19196 - SURFACE
      ?auto_19201 - SURFACE
      ?auto_19203 - PLACE
      ?auto_19202 - HOIST
      ?auto_19199 - SURFACE
      ?auto_19198 - TRUCK
      ?auto_19197 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19194 ?auto_19193 ) ( IS-CRATE ?auto_19192 ) ( not ( = ?auto_19191 ?auto_19192 ) ) ( not ( = ?auto_19190 ?auto_19191 ) ) ( not ( = ?auto_19190 ?auto_19192 ) ) ( not ( = ?auto_19200 ?auto_19193 ) ) ( HOIST-AT ?auto_19206 ?auto_19200 ) ( not ( = ?auto_19194 ?auto_19206 ) ) ( AVAILABLE ?auto_19206 ) ( SURFACE-AT ?auto_19192 ?auto_19200 ) ( ON ?auto_19192 ?auto_19195 ) ( CLEAR ?auto_19192 ) ( not ( = ?auto_19191 ?auto_19195 ) ) ( not ( = ?auto_19192 ?auto_19195 ) ) ( not ( = ?auto_19190 ?auto_19195 ) ) ( IS-CRATE ?auto_19191 ) ( not ( = ?auto_19204 ?auto_19193 ) ) ( not ( = ?auto_19200 ?auto_19204 ) ) ( HOIST-AT ?auto_19205 ?auto_19204 ) ( not ( = ?auto_19194 ?auto_19205 ) ) ( not ( = ?auto_19206 ?auto_19205 ) ) ( SURFACE-AT ?auto_19191 ?auto_19204 ) ( ON ?auto_19191 ?auto_19196 ) ( CLEAR ?auto_19191 ) ( not ( = ?auto_19191 ?auto_19196 ) ) ( not ( = ?auto_19192 ?auto_19196 ) ) ( not ( = ?auto_19190 ?auto_19196 ) ) ( not ( = ?auto_19195 ?auto_19196 ) ) ( IS-CRATE ?auto_19190 ) ( not ( = ?auto_19189 ?auto_19190 ) ) ( not ( = ?auto_19191 ?auto_19189 ) ) ( not ( = ?auto_19192 ?auto_19189 ) ) ( not ( = ?auto_19195 ?auto_19189 ) ) ( not ( = ?auto_19196 ?auto_19189 ) ) ( AVAILABLE ?auto_19205 ) ( SURFACE-AT ?auto_19190 ?auto_19204 ) ( ON ?auto_19190 ?auto_19201 ) ( CLEAR ?auto_19190 ) ( not ( = ?auto_19191 ?auto_19201 ) ) ( not ( = ?auto_19192 ?auto_19201 ) ) ( not ( = ?auto_19190 ?auto_19201 ) ) ( not ( = ?auto_19195 ?auto_19201 ) ) ( not ( = ?auto_19196 ?auto_19201 ) ) ( not ( = ?auto_19189 ?auto_19201 ) ) ( IS-CRATE ?auto_19189 ) ( not ( = ?auto_19188 ?auto_19189 ) ) ( not ( = ?auto_19191 ?auto_19188 ) ) ( not ( = ?auto_19192 ?auto_19188 ) ) ( not ( = ?auto_19190 ?auto_19188 ) ) ( not ( = ?auto_19195 ?auto_19188 ) ) ( not ( = ?auto_19196 ?auto_19188 ) ) ( not ( = ?auto_19201 ?auto_19188 ) ) ( not ( = ?auto_19203 ?auto_19193 ) ) ( not ( = ?auto_19200 ?auto_19203 ) ) ( not ( = ?auto_19204 ?auto_19203 ) ) ( HOIST-AT ?auto_19202 ?auto_19203 ) ( not ( = ?auto_19194 ?auto_19202 ) ) ( not ( = ?auto_19206 ?auto_19202 ) ) ( not ( = ?auto_19205 ?auto_19202 ) ) ( AVAILABLE ?auto_19202 ) ( SURFACE-AT ?auto_19189 ?auto_19203 ) ( ON ?auto_19189 ?auto_19199 ) ( CLEAR ?auto_19189 ) ( not ( = ?auto_19191 ?auto_19199 ) ) ( not ( = ?auto_19192 ?auto_19199 ) ) ( not ( = ?auto_19190 ?auto_19199 ) ) ( not ( = ?auto_19195 ?auto_19199 ) ) ( not ( = ?auto_19196 ?auto_19199 ) ) ( not ( = ?auto_19189 ?auto_19199 ) ) ( not ( = ?auto_19201 ?auto_19199 ) ) ( not ( = ?auto_19188 ?auto_19199 ) ) ( TRUCK-AT ?auto_19198 ?auto_19193 ) ( SURFACE-AT ?auto_19197 ?auto_19193 ) ( CLEAR ?auto_19197 ) ( LIFTING ?auto_19194 ?auto_19188 ) ( IS-CRATE ?auto_19188 ) ( not ( = ?auto_19197 ?auto_19188 ) ) ( not ( = ?auto_19191 ?auto_19197 ) ) ( not ( = ?auto_19192 ?auto_19197 ) ) ( not ( = ?auto_19190 ?auto_19197 ) ) ( not ( = ?auto_19195 ?auto_19197 ) ) ( not ( = ?auto_19196 ?auto_19197 ) ) ( not ( = ?auto_19189 ?auto_19197 ) ) ( not ( = ?auto_19201 ?auto_19197 ) ) ( not ( = ?auto_19199 ?auto_19197 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19190 ?auto_19191 ?auto_19192 )
      ( MAKE-4CRATE-VERIFY ?auto_19188 ?auto_19189 ?auto_19190 ?auto_19191 ?auto_19192 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19207 - SURFACE
      ?auto_19208 - SURFACE
      ?auto_19209 - SURFACE
      ?auto_19210 - SURFACE
      ?auto_19211 - SURFACE
      ?auto_19212 - SURFACE
    )
    :vars
    (
      ?auto_19214 - HOIST
      ?auto_19213 - PLACE
      ?auto_19219 - PLACE
      ?auto_19225 - HOIST
      ?auto_19215 - SURFACE
      ?auto_19223 - PLACE
      ?auto_19224 - HOIST
      ?auto_19216 - SURFACE
      ?auto_19220 - SURFACE
      ?auto_19222 - PLACE
      ?auto_19221 - HOIST
      ?auto_19218 - SURFACE
      ?auto_19217 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19214 ?auto_19213 ) ( IS-CRATE ?auto_19212 ) ( not ( = ?auto_19211 ?auto_19212 ) ) ( not ( = ?auto_19210 ?auto_19211 ) ) ( not ( = ?auto_19210 ?auto_19212 ) ) ( not ( = ?auto_19219 ?auto_19213 ) ) ( HOIST-AT ?auto_19225 ?auto_19219 ) ( not ( = ?auto_19214 ?auto_19225 ) ) ( AVAILABLE ?auto_19225 ) ( SURFACE-AT ?auto_19212 ?auto_19219 ) ( ON ?auto_19212 ?auto_19215 ) ( CLEAR ?auto_19212 ) ( not ( = ?auto_19211 ?auto_19215 ) ) ( not ( = ?auto_19212 ?auto_19215 ) ) ( not ( = ?auto_19210 ?auto_19215 ) ) ( IS-CRATE ?auto_19211 ) ( not ( = ?auto_19223 ?auto_19213 ) ) ( not ( = ?auto_19219 ?auto_19223 ) ) ( HOIST-AT ?auto_19224 ?auto_19223 ) ( not ( = ?auto_19214 ?auto_19224 ) ) ( not ( = ?auto_19225 ?auto_19224 ) ) ( SURFACE-AT ?auto_19211 ?auto_19223 ) ( ON ?auto_19211 ?auto_19216 ) ( CLEAR ?auto_19211 ) ( not ( = ?auto_19211 ?auto_19216 ) ) ( not ( = ?auto_19212 ?auto_19216 ) ) ( not ( = ?auto_19210 ?auto_19216 ) ) ( not ( = ?auto_19215 ?auto_19216 ) ) ( IS-CRATE ?auto_19210 ) ( not ( = ?auto_19209 ?auto_19210 ) ) ( not ( = ?auto_19211 ?auto_19209 ) ) ( not ( = ?auto_19212 ?auto_19209 ) ) ( not ( = ?auto_19215 ?auto_19209 ) ) ( not ( = ?auto_19216 ?auto_19209 ) ) ( AVAILABLE ?auto_19224 ) ( SURFACE-AT ?auto_19210 ?auto_19223 ) ( ON ?auto_19210 ?auto_19220 ) ( CLEAR ?auto_19210 ) ( not ( = ?auto_19211 ?auto_19220 ) ) ( not ( = ?auto_19212 ?auto_19220 ) ) ( not ( = ?auto_19210 ?auto_19220 ) ) ( not ( = ?auto_19215 ?auto_19220 ) ) ( not ( = ?auto_19216 ?auto_19220 ) ) ( not ( = ?auto_19209 ?auto_19220 ) ) ( IS-CRATE ?auto_19209 ) ( not ( = ?auto_19208 ?auto_19209 ) ) ( not ( = ?auto_19211 ?auto_19208 ) ) ( not ( = ?auto_19212 ?auto_19208 ) ) ( not ( = ?auto_19210 ?auto_19208 ) ) ( not ( = ?auto_19215 ?auto_19208 ) ) ( not ( = ?auto_19216 ?auto_19208 ) ) ( not ( = ?auto_19220 ?auto_19208 ) ) ( not ( = ?auto_19222 ?auto_19213 ) ) ( not ( = ?auto_19219 ?auto_19222 ) ) ( not ( = ?auto_19223 ?auto_19222 ) ) ( HOIST-AT ?auto_19221 ?auto_19222 ) ( not ( = ?auto_19214 ?auto_19221 ) ) ( not ( = ?auto_19225 ?auto_19221 ) ) ( not ( = ?auto_19224 ?auto_19221 ) ) ( AVAILABLE ?auto_19221 ) ( SURFACE-AT ?auto_19209 ?auto_19222 ) ( ON ?auto_19209 ?auto_19218 ) ( CLEAR ?auto_19209 ) ( not ( = ?auto_19211 ?auto_19218 ) ) ( not ( = ?auto_19212 ?auto_19218 ) ) ( not ( = ?auto_19210 ?auto_19218 ) ) ( not ( = ?auto_19215 ?auto_19218 ) ) ( not ( = ?auto_19216 ?auto_19218 ) ) ( not ( = ?auto_19209 ?auto_19218 ) ) ( not ( = ?auto_19220 ?auto_19218 ) ) ( not ( = ?auto_19208 ?auto_19218 ) ) ( TRUCK-AT ?auto_19217 ?auto_19213 ) ( SURFACE-AT ?auto_19207 ?auto_19213 ) ( CLEAR ?auto_19207 ) ( LIFTING ?auto_19214 ?auto_19208 ) ( IS-CRATE ?auto_19208 ) ( not ( = ?auto_19207 ?auto_19208 ) ) ( not ( = ?auto_19211 ?auto_19207 ) ) ( not ( = ?auto_19212 ?auto_19207 ) ) ( not ( = ?auto_19210 ?auto_19207 ) ) ( not ( = ?auto_19215 ?auto_19207 ) ) ( not ( = ?auto_19216 ?auto_19207 ) ) ( not ( = ?auto_19209 ?auto_19207 ) ) ( not ( = ?auto_19220 ?auto_19207 ) ) ( not ( = ?auto_19218 ?auto_19207 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19210 ?auto_19211 ?auto_19212 )
      ( MAKE-5CRATE-VERIFY ?auto_19207 ?auto_19208 ?auto_19209 ?auto_19210 ?auto_19211 ?auto_19212 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19226 - SURFACE
      ?auto_19227 - SURFACE
    )
    :vars
    (
      ?auto_19229 - HOIST
      ?auto_19228 - PLACE
      ?auto_19243 - SURFACE
      ?auto_19235 - PLACE
      ?auto_19244 - HOIST
      ?auto_19230 - SURFACE
      ?auto_19241 - PLACE
      ?auto_19242 - HOIST
      ?auto_19231 - SURFACE
      ?auto_19236 - SURFACE
      ?auto_19237 - SURFACE
      ?auto_19240 - SURFACE
      ?auto_19239 - PLACE
      ?auto_19238 - HOIST
      ?auto_19234 - SURFACE
      ?auto_19233 - TRUCK
      ?auto_19232 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19229 ?auto_19228 ) ( IS-CRATE ?auto_19227 ) ( not ( = ?auto_19226 ?auto_19227 ) ) ( not ( = ?auto_19243 ?auto_19226 ) ) ( not ( = ?auto_19243 ?auto_19227 ) ) ( not ( = ?auto_19235 ?auto_19228 ) ) ( HOIST-AT ?auto_19244 ?auto_19235 ) ( not ( = ?auto_19229 ?auto_19244 ) ) ( AVAILABLE ?auto_19244 ) ( SURFACE-AT ?auto_19227 ?auto_19235 ) ( ON ?auto_19227 ?auto_19230 ) ( CLEAR ?auto_19227 ) ( not ( = ?auto_19226 ?auto_19230 ) ) ( not ( = ?auto_19227 ?auto_19230 ) ) ( not ( = ?auto_19243 ?auto_19230 ) ) ( IS-CRATE ?auto_19226 ) ( not ( = ?auto_19241 ?auto_19228 ) ) ( not ( = ?auto_19235 ?auto_19241 ) ) ( HOIST-AT ?auto_19242 ?auto_19241 ) ( not ( = ?auto_19229 ?auto_19242 ) ) ( not ( = ?auto_19244 ?auto_19242 ) ) ( SURFACE-AT ?auto_19226 ?auto_19241 ) ( ON ?auto_19226 ?auto_19231 ) ( CLEAR ?auto_19226 ) ( not ( = ?auto_19226 ?auto_19231 ) ) ( not ( = ?auto_19227 ?auto_19231 ) ) ( not ( = ?auto_19243 ?auto_19231 ) ) ( not ( = ?auto_19230 ?auto_19231 ) ) ( IS-CRATE ?auto_19243 ) ( not ( = ?auto_19236 ?auto_19243 ) ) ( not ( = ?auto_19226 ?auto_19236 ) ) ( not ( = ?auto_19227 ?auto_19236 ) ) ( not ( = ?auto_19230 ?auto_19236 ) ) ( not ( = ?auto_19231 ?auto_19236 ) ) ( AVAILABLE ?auto_19242 ) ( SURFACE-AT ?auto_19243 ?auto_19241 ) ( ON ?auto_19243 ?auto_19237 ) ( CLEAR ?auto_19243 ) ( not ( = ?auto_19226 ?auto_19237 ) ) ( not ( = ?auto_19227 ?auto_19237 ) ) ( not ( = ?auto_19243 ?auto_19237 ) ) ( not ( = ?auto_19230 ?auto_19237 ) ) ( not ( = ?auto_19231 ?auto_19237 ) ) ( not ( = ?auto_19236 ?auto_19237 ) ) ( IS-CRATE ?auto_19236 ) ( not ( = ?auto_19240 ?auto_19236 ) ) ( not ( = ?auto_19226 ?auto_19240 ) ) ( not ( = ?auto_19227 ?auto_19240 ) ) ( not ( = ?auto_19243 ?auto_19240 ) ) ( not ( = ?auto_19230 ?auto_19240 ) ) ( not ( = ?auto_19231 ?auto_19240 ) ) ( not ( = ?auto_19237 ?auto_19240 ) ) ( not ( = ?auto_19239 ?auto_19228 ) ) ( not ( = ?auto_19235 ?auto_19239 ) ) ( not ( = ?auto_19241 ?auto_19239 ) ) ( HOIST-AT ?auto_19238 ?auto_19239 ) ( not ( = ?auto_19229 ?auto_19238 ) ) ( not ( = ?auto_19244 ?auto_19238 ) ) ( not ( = ?auto_19242 ?auto_19238 ) ) ( AVAILABLE ?auto_19238 ) ( SURFACE-AT ?auto_19236 ?auto_19239 ) ( ON ?auto_19236 ?auto_19234 ) ( CLEAR ?auto_19236 ) ( not ( = ?auto_19226 ?auto_19234 ) ) ( not ( = ?auto_19227 ?auto_19234 ) ) ( not ( = ?auto_19243 ?auto_19234 ) ) ( not ( = ?auto_19230 ?auto_19234 ) ) ( not ( = ?auto_19231 ?auto_19234 ) ) ( not ( = ?auto_19236 ?auto_19234 ) ) ( not ( = ?auto_19237 ?auto_19234 ) ) ( not ( = ?auto_19240 ?auto_19234 ) ) ( TRUCK-AT ?auto_19233 ?auto_19228 ) ( SURFACE-AT ?auto_19232 ?auto_19228 ) ( CLEAR ?auto_19232 ) ( IS-CRATE ?auto_19240 ) ( not ( = ?auto_19232 ?auto_19240 ) ) ( not ( = ?auto_19226 ?auto_19232 ) ) ( not ( = ?auto_19227 ?auto_19232 ) ) ( not ( = ?auto_19243 ?auto_19232 ) ) ( not ( = ?auto_19230 ?auto_19232 ) ) ( not ( = ?auto_19231 ?auto_19232 ) ) ( not ( = ?auto_19236 ?auto_19232 ) ) ( not ( = ?auto_19237 ?auto_19232 ) ) ( not ( = ?auto_19234 ?auto_19232 ) ) ( AVAILABLE ?auto_19229 ) ( IN ?auto_19240 ?auto_19233 ) )
    :subtasks
    ( ( !UNLOAD ?auto_19229 ?auto_19240 ?auto_19233 ?auto_19228 )
      ( MAKE-2CRATE ?auto_19243 ?auto_19226 ?auto_19227 )
      ( MAKE-1CRATE-VERIFY ?auto_19226 ?auto_19227 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19245 - SURFACE
      ?auto_19246 - SURFACE
      ?auto_19247 - SURFACE
    )
    :vars
    (
      ?auto_19250 - HOIST
      ?auto_19261 - PLACE
      ?auto_19257 - PLACE
      ?auto_19253 - HOIST
      ?auto_19262 - SURFACE
      ?auto_19249 - PLACE
      ?auto_19259 - HOIST
      ?auto_19256 - SURFACE
      ?auto_19248 - SURFACE
      ?auto_19260 - SURFACE
      ?auto_19251 - SURFACE
      ?auto_19263 - PLACE
      ?auto_19258 - HOIST
      ?auto_19252 - SURFACE
      ?auto_19254 - TRUCK
      ?auto_19255 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19250 ?auto_19261 ) ( IS-CRATE ?auto_19247 ) ( not ( = ?auto_19246 ?auto_19247 ) ) ( not ( = ?auto_19245 ?auto_19246 ) ) ( not ( = ?auto_19245 ?auto_19247 ) ) ( not ( = ?auto_19257 ?auto_19261 ) ) ( HOIST-AT ?auto_19253 ?auto_19257 ) ( not ( = ?auto_19250 ?auto_19253 ) ) ( AVAILABLE ?auto_19253 ) ( SURFACE-AT ?auto_19247 ?auto_19257 ) ( ON ?auto_19247 ?auto_19262 ) ( CLEAR ?auto_19247 ) ( not ( = ?auto_19246 ?auto_19262 ) ) ( not ( = ?auto_19247 ?auto_19262 ) ) ( not ( = ?auto_19245 ?auto_19262 ) ) ( IS-CRATE ?auto_19246 ) ( not ( = ?auto_19249 ?auto_19261 ) ) ( not ( = ?auto_19257 ?auto_19249 ) ) ( HOIST-AT ?auto_19259 ?auto_19249 ) ( not ( = ?auto_19250 ?auto_19259 ) ) ( not ( = ?auto_19253 ?auto_19259 ) ) ( SURFACE-AT ?auto_19246 ?auto_19249 ) ( ON ?auto_19246 ?auto_19256 ) ( CLEAR ?auto_19246 ) ( not ( = ?auto_19246 ?auto_19256 ) ) ( not ( = ?auto_19247 ?auto_19256 ) ) ( not ( = ?auto_19245 ?auto_19256 ) ) ( not ( = ?auto_19262 ?auto_19256 ) ) ( IS-CRATE ?auto_19245 ) ( not ( = ?auto_19248 ?auto_19245 ) ) ( not ( = ?auto_19246 ?auto_19248 ) ) ( not ( = ?auto_19247 ?auto_19248 ) ) ( not ( = ?auto_19262 ?auto_19248 ) ) ( not ( = ?auto_19256 ?auto_19248 ) ) ( AVAILABLE ?auto_19259 ) ( SURFACE-AT ?auto_19245 ?auto_19249 ) ( ON ?auto_19245 ?auto_19260 ) ( CLEAR ?auto_19245 ) ( not ( = ?auto_19246 ?auto_19260 ) ) ( not ( = ?auto_19247 ?auto_19260 ) ) ( not ( = ?auto_19245 ?auto_19260 ) ) ( not ( = ?auto_19262 ?auto_19260 ) ) ( not ( = ?auto_19256 ?auto_19260 ) ) ( not ( = ?auto_19248 ?auto_19260 ) ) ( IS-CRATE ?auto_19248 ) ( not ( = ?auto_19251 ?auto_19248 ) ) ( not ( = ?auto_19246 ?auto_19251 ) ) ( not ( = ?auto_19247 ?auto_19251 ) ) ( not ( = ?auto_19245 ?auto_19251 ) ) ( not ( = ?auto_19262 ?auto_19251 ) ) ( not ( = ?auto_19256 ?auto_19251 ) ) ( not ( = ?auto_19260 ?auto_19251 ) ) ( not ( = ?auto_19263 ?auto_19261 ) ) ( not ( = ?auto_19257 ?auto_19263 ) ) ( not ( = ?auto_19249 ?auto_19263 ) ) ( HOIST-AT ?auto_19258 ?auto_19263 ) ( not ( = ?auto_19250 ?auto_19258 ) ) ( not ( = ?auto_19253 ?auto_19258 ) ) ( not ( = ?auto_19259 ?auto_19258 ) ) ( AVAILABLE ?auto_19258 ) ( SURFACE-AT ?auto_19248 ?auto_19263 ) ( ON ?auto_19248 ?auto_19252 ) ( CLEAR ?auto_19248 ) ( not ( = ?auto_19246 ?auto_19252 ) ) ( not ( = ?auto_19247 ?auto_19252 ) ) ( not ( = ?auto_19245 ?auto_19252 ) ) ( not ( = ?auto_19262 ?auto_19252 ) ) ( not ( = ?auto_19256 ?auto_19252 ) ) ( not ( = ?auto_19248 ?auto_19252 ) ) ( not ( = ?auto_19260 ?auto_19252 ) ) ( not ( = ?auto_19251 ?auto_19252 ) ) ( TRUCK-AT ?auto_19254 ?auto_19261 ) ( SURFACE-AT ?auto_19255 ?auto_19261 ) ( CLEAR ?auto_19255 ) ( IS-CRATE ?auto_19251 ) ( not ( = ?auto_19255 ?auto_19251 ) ) ( not ( = ?auto_19246 ?auto_19255 ) ) ( not ( = ?auto_19247 ?auto_19255 ) ) ( not ( = ?auto_19245 ?auto_19255 ) ) ( not ( = ?auto_19262 ?auto_19255 ) ) ( not ( = ?auto_19256 ?auto_19255 ) ) ( not ( = ?auto_19248 ?auto_19255 ) ) ( not ( = ?auto_19260 ?auto_19255 ) ) ( not ( = ?auto_19252 ?auto_19255 ) ) ( AVAILABLE ?auto_19250 ) ( IN ?auto_19251 ?auto_19254 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19246 ?auto_19247 )
      ( MAKE-2CRATE-VERIFY ?auto_19245 ?auto_19246 ?auto_19247 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19264 - SURFACE
      ?auto_19265 - SURFACE
      ?auto_19266 - SURFACE
      ?auto_19267 - SURFACE
    )
    :vars
    (
      ?auto_19269 - HOIST
      ?auto_19276 - PLACE
      ?auto_19281 - PLACE
      ?auto_19274 - HOIST
      ?auto_19272 - SURFACE
      ?auto_19277 - PLACE
      ?auto_19270 - HOIST
      ?auto_19268 - SURFACE
      ?auto_19278 - SURFACE
      ?auto_19280 - SURFACE
      ?auto_19275 - PLACE
      ?auto_19282 - HOIST
      ?auto_19273 - SURFACE
      ?auto_19271 - TRUCK
      ?auto_19279 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19269 ?auto_19276 ) ( IS-CRATE ?auto_19267 ) ( not ( = ?auto_19266 ?auto_19267 ) ) ( not ( = ?auto_19265 ?auto_19266 ) ) ( not ( = ?auto_19265 ?auto_19267 ) ) ( not ( = ?auto_19281 ?auto_19276 ) ) ( HOIST-AT ?auto_19274 ?auto_19281 ) ( not ( = ?auto_19269 ?auto_19274 ) ) ( AVAILABLE ?auto_19274 ) ( SURFACE-AT ?auto_19267 ?auto_19281 ) ( ON ?auto_19267 ?auto_19272 ) ( CLEAR ?auto_19267 ) ( not ( = ?auto_19266 ?auto_19272 ) ) ( not ( = ?auto_19267 ?auto_19272 ) ) ( not ( = ?auto_19265 ?auto_19272 ) ) ( IS-CRATE ?auto_19266 ) ( not ( = ?auto_19277 ?auto_19276 ) ) ( not ( = ?auto_19281 ?auto_19277 ) ) ( HOIST-AT ?auto_19270 ?auto_19277 ) ( not ( = ?auto_19269 ?auto_19270 ) ) ( not ( = ?auto_19274 ?auto_19270 ) ) ( SURFACE-AT ?auto_19266 ?auto_19277 ) ( ON ?auto_19266 ?auto_19268 ) ( CLEAR ?auto_19266 ) ( not ( = ?auto_19266 ?auto_19268 ) ) ( not ( = ?auto_19267 ?auto_19268 ) ) ( not ( = ?auto_19265 ?auto_19268 ) ) ( not ( = ?auto_19272 ?auto_19268 ) ) ( IS-CRATE ?auto_19265 ) ( not ( = ?auto_19264 ?auto_19265 ) ) ( not ( = ?auto_19266 ?auto_19264 ) ) ( not ( = ?auto_19267 ?auto_19264 ) ) ( not ( = ?auto_19272 ?auto_19264 ) ) ( not ( = ?auto_19268 ?auto_19264 ) ) ( AVAILABLE ?auto_19270 ) ( SURFACE-AT ?auto_19265 ?auto_19277 ) ( ON ?auto_19265 ?auto_19278 ) ( CLEAR ?auto_19265 ) ( not ( = ?auto_19266 ?auto_19278 ) ) ( not ( = ?auto_19267 ?auto_19278 ) ) ( not ( = ?auto_19265 ?auto_19278 ) ) ( not ( = ?auto_19272 ?auto_19278 ) ) ( not ( = ?auto_19268 ?auto_19278 ) ) ( not ( = ?auto_19264 ?auto_19278 ) ) ( IS-CRATE ?auto_19264 ) ( not ( = ?auto_19280 ?auto_19264 ) ) ( not ( = ?auto_19266 ?auto_19280 ) ) ( not ( = ?auto_19267 ?auto_19280 ) ) ( not ( = ?auto_19265 ?auto_19280 ) ) ( not ( = ?auto_19272 ?auto_19280 ) ) ( not ( = ?auto_19268 ?auto_19280 ) ) ( not ( = ?auto_19278 ?auto_19280 ) ) ( not ( = ?auto_19275 ?auto_19276 ) ) ( not ( = ?auto_19281 ?auto_19275 ) ) ( not ( = ?auto_19277 ?auto_19275 ) ) ( HOIST-AT ?auto_19282 ?auto_19275 ) ( not ( = ?auto_19269 ?auto_19282 ) ) ( not ( = ?auto_19274 ?auto_19282 ) ) ( not ( = ?auto_19270 ?auto_19282 ) ) ( AVAILABLE ?auto_19282 ) ( SURFACE-AT ?auto_19264 ?auto_19275 ) ( ON ?auto_19264 ?auto_19273 ) ( CLEAR ?auto_19264 ) ( not ( = ?auto_19266 ?auto_19273 ) ) ( not ( = ?auto_19267 ?auto_19273 ) ) ( not ( = ?auto_19265 ?auto_19273 ) ) ( not ( = ?auto_19272 ?auto_19273 ) ) ( not ( = ?auto_19268 ?auto_19273 ) ) ( not ( = ?auto_19264 ?auto_19273 ) ) ( not ( = ?auto_19278 ?auto_19273 ) ) ( not ( = ?auto_19280 ?auto_19273 ) ) ( TRUCK-AT ?auto_19271 ?auto_19276 ) ( SURFACE-AT ?auto_19279 ?auto_19276 ) ( CLEAR ?auto_19279 ) ( IS-CRATE ?auto_19280 ) ( not ( = ?auto_19279 ?auto_19280 ) ) ( not ( = ?auto_19266 ?auto_19279 ) ) ( not ( = ?auto_19267 ?auto_19279 ) ) ( not ( = ?auto_19265 ?auto_19279 ) ) ( not ( = ?auto_19272 ?auto_19279 ) ) ( not ( = ?auto_19268 ?auto_19279 ) ) ( not ( = ?auto_19264 ?auto_19279 ) ) ( not ( = ?auto_19278 ?auto_19279 ) ) ( not ( = ?auto_19273 ?auto_19279 ) ) ( AVAILABLE ?auto_19269 ) ( IN ?auto_19280 ?auto_19271 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19265 ?auto_19266 ?auto_19267 )
      ( MAKE-3CRATE-VERIFY ?auto_19264 ?auto_19265 ?auto_19266 ?auto_19267 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19283 - SURFACE
      ?auto_19284 - SURFACE
      ?auto_19285 - SURFACE
      ?auto_19286 - SURFACE
      ?auto_19287 - SURFACE
    )
    :vars
    (
      ?auto_19289 - HOIST
      ?auto_19296 - PLACE
      ?auto_19300 - PLACE
      ?auto_19294 - HOIST
      ?auto_19292 - SURFACE
      ?auto_19297 - PLACE
      ?auto_19290 - HOIST
      ?auto_19288 - SURFACE
      ?auto_19298 - SURFACE
      ?auto_19295 - PLACE
      ?auto_19301 - HOIST
      ?auto_19293 - SURFACE
      ?auto_19291 - TRUCK
      ?auto_19299 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19289 ?auto_19296 ) ( IS-CRATE ?auto_19287 ) ( not ( = ?auto_19286 ?auto_19287 ) ) ( not ( = ?auto_19285 ?auto_19286 ) ) ( not ( = ?auto_19285 ?auto_19287 ) ) ( not ( = ?auto_19300 ?auto_19296 ) ) ( HOIST-AT ?auto_19294 ?auto_19300 ) ( not ( = ?auto_19289 ?auto_19294 ) ) ( AVAILABLE ?auto_19294 ) ( SURFACE-AT ?auto_19287 ?auto_19300 ) ( ON ?auto_19287 ?auto_19292 ) ( CLEAR ?auto_19287 ) ( not ( = ?auto_19286 ?auto_19292 ) ) ( not ( = ?auto_19287 ?auto_19292 ) ) ( not ( = ?auto_19285 ?auto_19292 ) ) ( IS-CRATE ?auto_19286 ) ( not ( = ?auto_19297 ?auto_19296 ) ) ( not ( = ?auto_19300 ?auto_19297 ) ) ( HOIST-AT ?auto_19290 ?auto_19297 ) ( not ( = ?auto_19289 ?auto_19290 ) ) ( not ( = ?auto_19294 ?auto_19290 ) ) ( SURFACE-AT ?auto_19286 ?auto_19297 ) ( ON ?auto_19286 ?auto_19288 ) ( CLEAR ?auto_19286 ) ( not ( = ?auto_19286 ?auto_19288 ) ) ( not ( = ?auto_19287 ?auto_19288 ) ) ( not ( = ?auto_19285 ?auto_19288 ) ) ( not ( = ?auto_19292 ?auto_19288 ) ) ( IS-CRATE ?auto_19285 ) ( not ( = ?auto_19284 ?auto_19285 ) ) ( not ( = ?auto_19286 ?auto_19284 ) ) ( not ( = ?auto_19287 ?auto_19284 ) ) ( not ( = ?auto_19292 ?auto_19284 ) ) ( not ( = ?auto_19288 ?auto_19284 ) ) ( AVAILABLE ?auto_19290 ) ( SURFACE-AT ?auto_19285 ?auto_19297 ) ( ON ?auto_19285 ?auto_19298 ) ( CLEAR ?auto_19285 ) ( not ( = ?auto_19286 ?auto_19298 ) ) ( not ( = ?auto_19287 ?auto_19298 ) ) ( not ( = ?auto_19285 ?auto_19298 ) ) ( not ( = ?auto_19292 ?auto_19298 ) ) ( not ( = ?auto_19288 ?auto_19298 ) ) ( not ( = ?auto_19284 ?auto_19298 ) ) ( IS-CRATE ?auto_19284 ) ( not ( = ?auto_19283 ?auto_19284 ) ) ( not ( = ?auto_19286 ?auto_19283 ) ) ( not ( = ?auto_19287 ?auto_19283 ) ) ( not ( = ?auto_19285 ?auto_19283 ) ) ( not ( = ?auto_19292 ?auto_19283 ) ) ( not ( = ?auto_19288 ?auto_19283 ) ) ( not ( = ?auto_19298 ?auto_19283 ) ) ( not ( = ?auto_19295 ?auto_19296 ) ) ( not ( = ?auto_19300 ?auto_19295 ) ) ( not ( = ?auto_19297 ?auto_19295 ) ) ( HOIST-AT ?auto_19301 ?auto_19295 ) ( not ( = ?auto_19289 ?auto_19301 ) ) ( not ( = ?auto_19294 ?auto_19301 ) ) ( not ( = ?auto_19290 ?auto_19301 ) ) ( AVAILABLE ?auto_19301 ) ( SURFACE-AT ?auto_19284 ?auto_19295 ) ( ON ?auto_19284 ?auto_19293 ) ( CLEAR ?auto_19284 ) ( not ( = ?auto_19286 ?auto_19293 ) ) ( not ( = ?auto_19287 ?auto_19293 ) ) ( not ( = ?auto_19285 ?auto_19293 ) ) ( not ( = ?auto_19292 ?auto_19293 ) ) ( not ( = ?auto_19288 ?auto_19293 ) ) ( not ( = ?auto_19284 ?auto_19293 ) ) ( not ( = ?auto_19298 ?auto_19293 ) ) ( not ( = ?auto_19283 ?auto_19293 ) ) ( TRUCK-AT ?auto_19291 ?auto_19296 ) ( SURFACE-AT ?auto_19299 ?auto_19296 ) ( CLEAR ?auto_19299 ) ( IS-CRATE ?auto_19283 ) ( not ( = ?auto_19299 ?auto_19283 ) ) ( not ( = ?auto_19286 ?auto_19299 ) ) ( not ( = ?auto_19287 ?auto_19299 ) ) ( not ( = ?auto_19285 ?auto_19299 ) ) ( not ( = ?auto_19292 ?auto_19299 ) ) ( not ( = ?auto_19288 ?auto_19299 ) ) ( not ( = ?auto_19284 ?auto_19299 ) ) ( not ( = ?auto_19298 ?auto_19299 ) ) ( not ( = ?auto_19293 ?auto_19299 ) ) ( AVAILABLE ?auto_19289 ) ( IN ?auto_19283 ?auto_19291 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19285 ?auto_19286 ?auto_19287 )
      ( MAKE-4CRATE-VERIFY ?auto_19283 ?auto_19284 ?auto_19285 ?auto_19286 ?auto_19287 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19302 - SURFACE
      ?auto_19303 - SURFACE
      ?auto_19304 - SURFACE
      ?auto_19305 - SURFACE
      ?auto_19306 - SURFACE
      ?auto_19307 - SURFACE
    )
    :vars
    (
      ?auto_19309 - HOIST
      ?auto_19316 - PLACE
      ?auto_19319 - PLACE
      ?auto_19314 - HOIST
      ?auto_19312 - SURFACE
      ?auto_19317 - PLACE
      ?auto_19310 - HOIST
      ?auto_19308 - SURFACE
      ?auto_19318 - SURFACE
      ?auto_19315 - PLACE
      ?auto_19320 - HOIST
      ?auto_19313 - SURFACE
      ?auto_19311 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19309 ?auto_19316 ) ( IS-CRATE ?auto_19307 ) ( not ( = ?auto_19306 ?auto_19307 ) ) ( not ( = ?auto_19305 ?auto_19306 ) ) ( not ( = ?auto_19305 ?auto_19307 ) ) ( not ( = ?auto_19319 ?auto_19316 ) ) ( HOIST-AT ?auto_19314 ?auto_19319 ) ( not ( = ?auto_19309 ?auto_19314 ) ) ( AVAILABLE ?auto_19314 ) ( SURFACE-AT ?auto_19307 ?auto_19319 ) ( ON ?auto_19307 ?auto_19312 ) ( CLEAR ?auto_19307 ) ( not ( = ?auto_19306 ?auto_19312 ) ) ( not ( = ?auto_19307 ?auto_19312 ) ) ( not ( = ?auto_19305 ?auto_19312 ) ) ( IS-CRATE ?auto_19306 ) ( not ( = ?auto_19317 ?auto_19316 ) ) ( not ( = ?auto_19319 ?auto_19317 ) ) ( HOIST-AT ?auto_19310 ?auto_19317 ) ( not ( = ?auto_19309 ?auto_19310 ) ) ( not ( = ?auto_19314 ?auto_19310 ) ) ( SURFACE-AT ?auto_19306 ?auto_19317 ) ( ON ?auto_19306 ?auto_19308 ) ( CLEAR ?auto_19306 ) ( not ( = ?auto_19306 ?auto_19308 ) ) ( not ( = ?auto_19307 ?auto_19308 ) ) ( not ( = ?auto_19305 ?auto_19308 ) ) ( not ( = ?auto_19312 ?auto_19308 ) ) ( IS-CRATE ?auto_19305 ) ( not ( = ?auto_19304 ?auto_19305 ) ) ( not ( = ?auto_19306 ?auto_19304 ) ) ( not ( = ?auto_19307 ?auto_19304 ) ) ( not ( = ?auto_19312 ?auto_19304 ) ) ( not ( = ?auto_19308 ?auto_19304 ) ) ( AVAILABLE ?auto_19310 ) ( SURFACE-AT ?auto_19305 ?auto_19317 ) ( ON ?auto_19305 ?auto_19318 ) ( CLEAR ?auto_19305 ) ( not ( = ?auto_19306 ?auto_19318 ) ) ( not ( = ?auto_19307 ?auto_19318 ) ) ( not ( = ?auto_19305 ?auto_19318 ) ) ( not ( = ?auto_19312 ?auto_19318 ) ) ( not ( = ?auto_19308 ?auto_19318 ) ) ( not ( = ?auto_19304 ?auto_19318 ) ) ( IS-CRATE ?auto_19304 ) ( not ( = ?auto_19303 ?auto_19304 ) ) ( not ( = ?auto_19306 ?auto_19303 ) ) ( not ( = ?auto_19307 ?auto_19303 ) ) ( not ( = ?auto_19305 ?auto_19303 ) ) ( not ( = ?auto_19312 ?auto_19303 ) ) ( not ( = ?auto_19308 ?auto_19303 ) ) ( not ( = ?auto_19318 ?auto_19303 ) ) ( not ( = ?auto_19315 ?auto_19316 ) ) ( not ( = ?auto_19319 ?auto_19315 ) ) ( not ( = ?auto_19317 ?auto_19315 ) ) ( HOIST-AT ?auto_19320 ?auto_19315 ) ( not ( = ?auto_19309 ?auto_19320 ) ) ( not ( = ?auto_19314 ?auto_19320 ) ) ( not ( = ?auto_19310 ?auto_19320 ) ) ( AVAILABLE ?auto_19320 ) ( SURFACE-AT ?auto_19304 ?auto_19315 ) ( ON ?auto_19304 ?auto_19313 ) ( CLEAR ?auto_19304 ) ( not ( = ?auto_19306 ?auto_19313 ) ) ( not ( = ?auto_19307 ?auto_19313 ) ) ( not ( = ?auto_19305 ?auto_19313 ) ) ( not ( = ?auto_19312 ?auto_19313 ) ) ( not ( = ?auto_19308 ?auto_19313 ) ) ( not ( = ?auto_19304 ?auto_19313 ) ) ( not ( = ?auto_19318 ?auto_19313 ) ) ( not ( = ?auto_19303 ?auto_19313 ) ) ( TRUCK-AT ?auto_19311 ?auto_19316 ) ( SURFACE-AT ?auto_19302 ?auto_19316 ) ( CLEAR ?auto_19302 ) ( IS-CRATE ?auto_19303 ) ( not ( = ?auto_19302 ?auto_19303 ) ) ( not ( = ?auto_19306 ?auto_19302 ) ) ( not ( = ?auto_19307 ?auto_19302 ) ) ( not ( = ?auto_19305 ?auto_19302 ) ) ( not ( = ?auto_19312 ?auto_19302 ) ) ( not ( = ?auto_19308 ?auto_19302 ) ) ( not ( = ?auto_19304 ?auto_19302 ) ) ( not ( = ?auto_19318 ?auto_19302 ) ) ( not ( = ?auto_19313 ?auto_19302 ) ) ( AVAILABLE ?auto_19309 ) ( IN ?auto_19303 ?auto_19311 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19305 ?auto_19306 ?auto_19307 )
      ( MAKE-5CRATE-VERIFY ?auto_19302 ?auto_19303 ?auto_19304 ?auto_19305 ?auto_19306 ?auto_19307 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19321 - SURFACE
      ?auto_19322 - SURFACE
    )
    :vars
    (
      ?auto_19324 - HOIST
      ?auto_19331 - PLACE
      ?auto_19337 - SURFACE
      ?auto_19338 - PLACE
      ?auto_19329 - HOIST
      ?auto_19327 - SURFACE
      ?auto_19333 - PLACE
      ?auto_19325 - HOIST
      ?auto_19323 - SURFACE
      ?auto_19332 - SURFACE
      ?auto_19334 - SURFACE
      ?auto_19336 - SURFACE
      ?auto_19330 - PLACE
      ?auto_19339 - HOIST
      ?auto_19328 - SURFACE
      ?auto_19335 - SURFACE
      ?auto_19326 - TRUCK
      ?auto_19340 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19324 ?auto_19331 ) ( IS-CRATE ?auto_19322 ) ( not ( = ?auto_19321 ?auto_19322 ) ) ( not ( = ?auto_19337 ?auto_19321 ) ) ( not ( = ?auto_19337 ?auto_19322 ) ) ( not ( = ?auto_19338 ?auto_19331 ) ) ( HOIST-AT ?auto_19329 ?auto_19338 ) ( not ( = ?auto_19324 ?auto_19329 ) ) ( AVAILABLE ?auto_19329 ) ( SURFACE-AT ?auto_19322 ?auto_19338 ) ( ON ?auto_19322 ?auto_19327 ) ( CLEAR ?auto_19322 ) ( not ( = ?auto_19321 ?auto_19327 ) ) ( not ( = ?auto_19322 ?auto_19327 ) ) ( not ( = ?auto_19337 ?auto_19327 ) ) ( IS-CRATE ?auto_19321 ) ( not ( = ?auto_19333 ?auto_19331 ) ) ( not ( = ?auto_19338 ?auto_19333 ) ) ( HOIST-AT ?auto_19325 ?auto_19333 ) ( not ( = ?auto_19324 ?auto_19325 ) ) ( not ( = ?auto_19329 ?auto_19325 ) ) ( SURFACE-AT ?auto_19321 ?auto_19333 ) ( ON ?auto_19321 ?auto_19323 ) ( CLEAR ?auto_19321 ) ( not ( = ?auto_19321 ?auto_19323 ) ) ( not ( = ?auto_19322 ?auto_19323 ) ) ( not ( = ?auto_19337 ?auto_19323 ) ) ( not ( = ?auto_19327 ?auto_19323 ) ) ( IS-CRATE ?auto_19337 ) ( not ( = ?auto_19332 ?auto_19337 ) ) ( not ( = ?auto_19321 ?auto_19332 ) ) ( not ( = ?auto_19322 ?auto_19332 ) ) ( not ( = ?auto_19327 ?auto_19332 ) ) ( not ( = ?auto_19323 ?auto_19332 ) ) ( AVAILABLE ?auto_19325 ) ( SURFACE-AT ?auto_19337 ?auto_19333 ) ( ON ?auto_19337 ?auto_19334 ) ( CLEAR ?auto_19337 ) ( not ( = ?auto_19321 ?auto_19334 ) ) ( not ( = ?auto_19322 ?auto_19334 ) ) ( not ( = ?auto_19337 ?auto_19334 ) ) ( not ( = ?auto_19327 ?auto_19334 ) ) ( not ( = ?auto_19323 ?auto_19334 ) ) ( not ( = ?auto_19332 ?auto_19334 ) ) ( IS-CRATE ?auto_19332 ) ( not ( = ?auto_19336 ?auto_19332 ) ) ( not ( = ?auto_19321 ?auto_19336 ) ) ( not ( = ?auto_19322 ?auto_19336 ) ) ( not ( = ?auto_19337 ?auto_19336 ) ) ( not ( = ?auto_19327 ?auto_19336 ) ) ( not ( = ?auto_19323 ?auto_19336 ) ) ( not ( = ?auto_19334 ?auto_19336 ) ) ( not ( = ?auto_19330 ?auto_19331 ) ) ( not ( = ?auto_19338 ?auto_19330 ) ) ( not ( = ?auto_19333 ?auto_19330 ) ) ( HOIST-AT ?auto_19339 ?auto_19330 ) ( not ( = ?auto_19324 ?auto_19339 ) ) ( not ( = ?auto_19329 ?auto_19339 ) ) ( not ( = ?auto_19325 ?auto_19339 ) ) ( AVAILABLE ?auto_19339 ) ( SURFACE-AT ?auto_19332 ?auto_19330 ) ( ON ?auto_19332 ?auto_19328 ) ( CLEAR ?auto_19332 ) ( not ( = ?auto_19321 ?auto_19328 ) ) ( not ( = ?auto_19322 ?auto_19328 ) ) ( not ( = ?auto_19337 ?auto_19328 ) ) ( not ( = ?auto_19327 ?auto_19328 ) ) ( not ( = ?auto_19323 ?auto_19328 ) ) ( not ( = ?auto_19332 ?auto_19328 ) ) ( not ( = ?auto_19334 ?auto_19328 ) ) ( not ( = ?auto_19336 ?auto_19328 ) ) ( SURFACE-AT ?auto_19335 ?auto_19331 ) ( CLEAR ?auto_19335 ) ( IS-CRATE ?auto_19336 ) ( not ( = ?auto_19335 ?auto_19336 ) ) ( not ( = ?auto_19321 ?auto_19335 ) ) ( not ( = ?auto_19322 ?auto_19335 ) ) ( not ( = ?auto_19337 ?auto_19335 ) ) ( not ( = ?auto_19327 ?auto_19335 ) ) ( not ( = ?auto_19323 ?auto_19335 ) ) ( not ( = ?auto_19332 ?auto_19335 ) ) ( not ( = ?auto_19334 ?auto_19335 ) ) ( not ( = ?auto_19328 ?auto_19335 ) ) ( AVAILABLE ?auto_19324 ) ( IN ?auto_19336 ?auto_19326 ) ( TRUCK-AT ?auto_19326 ?auto_19340 ) ( not ( = ?auto_19340 ?auto_19331 ) ) ( not ( = ?auto_19338 ?auto_19340 ) ) ( not ( = ?auto_19333 ?auto_19340 ) ) ( not ( = ?auto_19330 ?auto_19340 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19326 ?auto_19340 ?auto_19331 )
      ( MAKE-2CRATE ?auto_19337 ?auto_19321 ?auto_19322 )
      ( MAKE-1CRATE-VERIFY ?auto_19321 ?auto_19322 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19341 - SURFACE
      ?auto_19342 - SURFACE
      ?auto_19343 - SURFACE
    )
    :vars
    (
      ?auto_19347 - HOIST
      ?auto_19344 - PLACE
      ?auto_19351 - PLACE
      ?auto_19348 - HOIST
      ?auto_19357 - SURFACE
      ?auto_19355 - PLACE
      ?auto_19350 - HOIST
      ?auto_19352 - SURFACE
      ?auto_19356 - SURFACE
      ?auto_19360 - SURFACE
      ?auto_19358 - SURFACE
      ?auto_19359 - PLACE
      ?auto_19346 - HOIST
      ?auto_19345 - SURFACE
      ?auto_19349 - SURFACE
      ?auto_19353 - TRUCK
      ?auto_19354 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19347 ?auto_19344 ) ( IS-CRATE ?auto_19343 ) ( not ( = ?auto_19342 ?auto_19343 ) ) ( not ( = ?auto_19341 ?auto_19342 ) ) ( not ( = ?auto_19341 ?auto_19343 ) ) ( not ( = ?auto_19351 ?auto_19344 ) ) ( HOIST-AT ?auto_19348 ?auto_19351 ) ( not ( = ?auto_19347 ?auto_19348 ) ) ( AVAILABLE ?auto_19348 ) ( SURFACE-AT ?auto_19343 ?auto_19351 ) ( ON ?auto_19343 ?auto_19357 ) ( CLEAR ?auto_19343 ) ( not ( = ?auto_19342 ?auto_19357 ) ) ( not ( = ?auto_19343 ?auto_19357 ) ) ( not ( = ?auto_19341 ?auto_19357 ) ) ( IS-CRATE ?auto_19342 ) ( not ( = ?auto_19355 ?auto_19344 ) ) ( not ( = ?auto_19351 ?auto_19355 ) ) ( HOIST-AT ?auto_19350 ?auto_19355 ) ( not ( = ?auto_19347 ?auto_19350 ) ) ( not ( = ?auto_19348 ?auto_19350 ) ) ( SURFACE-AT ?auto_19342 ?auto_19355 ) ( ON ?auto_19342 ?auto_19352 ) ( CLEAR ?auto_19342 ) ( not ( = ?auto_19342 ?auto_19352 ) ) ( not ( = ?auto_19343 ?auto_19352 ) ) ( not ( = ?auto_19341 ?auto_19352 ) ) ( not ( = ?auto_19357 ?auto_19352 ) ) ( IS-CRATE ?auto_19341 ) ( not ( = ?auto_19356 ?auto_19341 ) ) ( not ( = ?auto_19342 ?auto_19356 ) ) ( not ( = ?auto_19343 ?auto_19356 ) ) ( not ( = ?auto_19357 ?auto_19356 ) ) ( not ( = ?auto_19352 ?auto_19356 ) ) ( AVAILABLE ?auto_19350 ) ( SURFACE-AT ?auto_19341 ?auto_19355 ) ( ON ?auto_19341 ?auto_19360 ) ( CLEAR ?auto_19341 ) ( not ( = ?auto_19342 ?auto_19360 ) ) ( not ( = ?auto_19343 ?auto_19360 ) ) ( not ( = ?auto_19341 ?auto_19360 ) ) ( not ( = ?auto_19357 ?auto_19360 ) ) ( not ( = ?auto_19352 ?auto_19360 ) ) ( not ( = ?auto_19356 ?auto_19360 ) ) ( IS-CRATE ?auto_19356 ) ( not ( = ?auto_19358 ?auto_19356 ) ) ( not ( = ?auto_19342 ?auto_19358 ) ) ( not ( = ?auto_19343 ?auto_19358 ) ) ( not ( = ?auto_19341 ?auto_19358 ) ) ( not ( = ?auto_19357 ?auto_19358 ) ) ( not ( = ?auto_19352 ?auto_19358 ) ) ( not ( = ?auto_19360 ?auto_19358 ) ) ( not ( = ?auto_19359 ?auto_19344 ) ) ( not ( = ?auto_19351 ?auto_19359 ) ) ( not ( = ?auto_19355 ?auto_19359 ) ) ( HOIST-AT ?auto_19346 ?auto_19359 ) ( not ( = ?auto_19347 ?auto_19346 ) ) ( not ( = ?auto_19348 ?auto_19346 ) ) ( not ( = ?auto_19350 ?auto_19346 ) ) ( AVAILABLE ?auto_19346 ) ( SURFACE-AT ?auto_19356 ?auto_19359 ) ( ON ?auto_19356 ?auto_19345 ) ( CLEAR ?auto_19356 ) ( not ( = ?auto_19342 ?auto_19345 ) ) ( not ( = ?auto_19343 ?auto_19345 ) ) ( not ( = ?auto_19341 ?auto_19345 ) ) ( not ( = ?auto_19357 ?auto_19345 ) ) ( not ( = ?auto_19352 ?auto_19345 ) ) ( not ( = ?auto_19356 ?auto_19345 ) ) ( not ( = ?auto_19360 ?auto_19345 ) ) ( not ( = ?auto_19358 ?auto_19345 ) ) ( SURFACE-AT ?auto_19349 ?auto_19344 ) ( CLEAR ?auto_19349 ) ( IS-CRATE ?auto_19358 ) ( not ( = ?auto_19349 ?auto_19358 ) ) ( not ( = ?auto_19342 ?auto_19349 ) ) ( not ( = ?auto_19343 ?auto_19349 ) ) ( not ( = ?auto_19341 ?auto_19349 ) ) ( not ( = ?auto_19357 ?auto_19349 ) ) ( not ( = ?auto_19352 ?auto_19349 ) ) ( not ( = ?auto_19356 ?auto_19349 ) ) ( not ( = ?auto_19360 ?auto_19349 ) ) ( not ( = ?auto_19345 ?auto_19349 ) ) ( AVAILABLE ?auto_19347 ) ( IN ?auto_19358 ?auto_19353 ) ( TRUCK-AT ?auto_19353 ?auto_19354 ) ( not ( = ?auto_19354 ?auto_19344 ) ) ( not ( = ?auto_19351 ?auto_19354 ) ) ( not ( = ?auto_19355 ?auto_19354 ) ) ( not ( = ?auto_19359 ?auto_19354 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19342 ?auto_19343 )
      ( MAKE-2CRATE-VERIFY ?auto_19341 ?auto_19342 ?auto_19343 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19361 - SURFACE
      ?auto_19362 - SURFACE
      ?auto_19363 - SURFACE
      ?auto_19364 - SURFACE
    )
    :vars
    (
      ?auto_19375 - HOIST
      ?auto_19370 - PLACE
      ?auto_19379 - PLACE
      ?auto_19378 - HOIST
      ?auto_19372 - SURFACE
      ?auto_19371 - PLACE
      ?auto_19374 - HOIST
      ?auto_19377 - SURFACE
      ?auto_19380 - SURFACE
      ?auto_19367 - SURFACE
      ?auto_19365 - PLACE
      ?auto_19366 - HOIST
      ?auto_19368 - SURFACE
      ?auto_19376 - SURFACE
      ?auto_19369 - TRUCK
      ?auto_19373 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19375 ?auto_19370 ) ( IS-CRATE ?auto_19364 ) ( not ( = ?auto_19363 ?auto_19364 ) ) ( not ( = ?auto_19362 ?auto_19363 ) ) ( not ( = ?auto_19362 ?auto_19364 ) ) ( not ( = ?auto_19379 ?auto_19370 ) ) ( HOIST-AT ?auto_19378 ?auto_19379 ) ( not ( = ?auto_19375 ?auto_19378 ) ) ( AVAILABLE ?auto_19378 ) ( SURFACE-AT ?auto_19364 ?auto_19379 ) ( ON ?auto_19364 ?auto_19372 ) ( CLEAR ?auto_19364 ) ( not ( = ?auto_19363 ?auto_19372 ) ) ( not ( = ?auto_19364 ?auto_19372 ) ) ( not ( = ?auto_19362 ?auto_19372 ) ) ( IS-CRATE ?auto_19363 ) ( not ( = ?auto_19371 ?auto_19370 ) ) ( not ( = ?auto_19379 ?auto_19371 ) ) ( HOIST-AT ?auto_19374 ?auto_19371 ) ( not ( = ?auto_19375 ?auto_19374 ) ) ( not ( = ?auto_19378 ?auto_19374 ) ) ( SURFACE-AT ?auto_19363 ?auto_19371 ) ( ON ?auto_19363 ?auto_19377 ) ( CLEAR ?auto_19363 ) ( not ( = ?auto_19363 ?auto_19377 ) ) ( not ( = ?auto_19364 ?auto_19377 ) ) ( not ( = ?auto_19362 ?auto_19377 ) ) ( not ( = ?auto_19372 ?auto_19377 ) ) ( IS-CRATE ?auto_19362 ) ( not ( = ?auto_19361 ?auto_19362 ) ) ( not ( = ?auto_19363 ?auto_19361 ) ) ( not ( = ?auto_19364 ?auto_19361 ) ) ( not ( = ?auto_19372 ?auto_19361 ) ) ( not ( = ?auto_19377 ?auto_19361 ) ) ( AVAILABLE ?auto_19374 ) ( SURFACE-AT ?auto_19362 ?auto_19371 ) ( ON ?auto_19362 ?auto_19380 ) ( CLEAR ?auto_19362 ) ( not ( = ?auto_19363 ?auto_19380 ) ) ( not ( = ?auto_19364 ?auto_19380 ) ) ( not ( = ?auto_19362 ?auto_19380 ) ) ( not ( = ?auto_19372 ?auto_19380 ) ) ( not ( = ?auto_19377 ?auto_19380 ) ) ( not ( = ?auto_19361 ?auto_19380 ) ) ( IS-CRATE ?auto_19361 ) ( not ( = ?auto_19367 ?auto_19361 ) ) ( not ( = ?auto_19363 ?auto_19367 ) ) ( not ( = ?auto_19364 ?auto_19367 ) ) ( not ( = ?auto_19362 ?auto_19367 ) ) ( not ( = ?auto_19372 ?auto_19367 ) ) ( not ( = ?auto_19377 ?auto_19367 ) ) ( not ( = ?auto_19380 ?auto_19367 ) ) ( not ( = ?auto_19365 ?auto_19370 ) ) ( not ( = ?auto_19379 ?auto_19365 ) ) ( not ( = ?auto_19371 ?auto_19365 ) ) ( HOIST-AT ?auto_19366 ?auto_19365 ) ( not ( = ?auto_19375 ?auto_19366 ) ) ( not ( = ?auto_19378 ?auto_19366 ) ) ( not ( = ?auto_19374 ?auto_19366 ) ) ( AVAILABLE ?auto_19366 ) ( SURFACE-AT ?auto_19361 ?auto_19365 ) ( ON ?auto_19361 ?auto_19368 ) ( CLEAR ?auto_19361 ) ( not ( = ?auto_19363 ?auto_19368 ) ) ( not ( = ?auto_19364 ?auto_19368 ) ) ( not ( = ?auto_19362 ?auto_19368 ) ) ( not ( = ?auto_19372 ?auto_19368 ) ) ( not ( = ?auto_19377 ?auto_19368 ) ) ( not ( = ?auto_19361 ?auto_19368 ) ) ( not ( = ?auto_19380 ?auto_19368 ) ) ( not ( = ?auto_19367 ?auto_19368 ) ) ( SURFACE-AT ?auto_19376 ?auto_19370 ) ( CLEAR ?auto_19376 ) ( IS-CRATE ?auto_19367 ) ( not ( = ?auto_19376 ?auto_19367 ) ) ( not ( = ?auto_19363 ?auto_19376 ) ) ( not ( = ?auto_19364 ?auto_19376 ) ) ( not ( = ?auto_19362 ?auto_19376 ) ) ( not ( = ?auto_19372 ?auto_19376 ) ) ( not ( = ?auto_19377 ?auto_19376 ) ) ( not ( = ?auto_19361 ?auto_19376 ) ) ( not ( = ?auto_19380 ?auto_19376 ) ) ( not ( = ?auto_19368 ?auto_19376 ) ) ( AVAILABLE ?auto_19375 ) ( IN ?auto_19367 ?auto_19369 ) ( TRUCK-AT ?auto_19369 ?auto_19373 ) ( not ( = ?auto_19373 ?auto_19370 ) ) ( not ( = ?auto_19379 ?auto_19373 ) ) ( not ( = ?auto_19371 ?auto_19373 ) ) ( not ( = ?auto_19365 ?auto_19373 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19362 ?auto_19363 ?auto_19364 )
      ( MAKE-3CRATE-VERIFY ?auto_19361 ?auto_19362 ?auto_19363 ?auto_19364 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19381 - SURFACE
      ?auto_19382 - SURFACE
      ?auto_19383 - SURFACE
      ?auto_19384 - SURFACE
      ?auto_19385 - SURFACE
    )
    :vars
    (
      ?auto_19395 - HOIST
      ?auto_19390 - PLACE
      ?auto_19399 - PLACE
      ?auto_19398 - HOIST
      ?auto_19392 - SURFACE
      ?auto_19391 - PLACE
      ?auto_19394 - HOIST
      ?auto_19397 - SURFACE
      ?auto_19400 - SURFACE
      ?auto_19386 - PLACE
      ?auto_19387 - HOIST
      ?auto_19388 - SURFACE
      ?auto_19396 - SURFACE
      ?auto_19389 - TRUCK
      ?auto_19393 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19395 ?auto_19390 ) ( IS-CRATE ?auto_19385 ) ( not ( = ?auto_19384 ?auto_19385 ) ) ( not ( = ?auto_19383 ?auto_19384 ) ) ( not ( = ?auto_19383 ?auto_19385 ) ) ( not ( = ?auto_19399 ?auto_19390 ) ) ( HOIST-AT ?auto_19398 ?auto_19399 ) ( not ( = ?auto_19395 ?auto_19398 ) ) ( AVAILABLE ?auto_19398 ) ( SURFACE-AT ?auto_19385 ?auto_19399 ) ( ON ?auto_19385 ?auto_19392 ) ( CLEAR ?auto_19385 ) ( not ( = ?auto_19384 ?auto_19392 ) ) ( not ( = ?auto_19385 ?auto_19392 ) ) ( not ( = ?auto_19383 ?auto_19392 ) ) ( IS-CRATE ?auto_19384 ) ( not ( = ?auto_19391 ?auto_19390 ) ) ( not ( = ?auto_19399 ?auto_19391 ) ) ( HOIST-AT ?auto_19394 ?auto_19391 ) ( not ( = ?auto_19395 ?auto_19394 ) ) ( not ( = ?auto_19398 ?auto_19394 ) ) ( SURFACE-AT ?auto_19384 ?auto_19391 ) ( ON ?auto_19384 ?auto_19397 ) ( CLEAR ?auto_19384 ) ( not ( = ?auto_19384 ?auto_19397 ) ) ( not ( = ?auto_19385 ?auto_19397 ) ) ( not ( = ?auto_19383 ?auto_19397 ) ) ( not ( = ?auto_19392 ?auto_19397 ) ) ( IS-CRATE ?auto_19383 ) ( not ( = ?auto_19382 ?auto_19383 ) ) ( not ( = ?auto_19384 ?auto_19382 ) ) ( not ( = ?auto_19385 ?auto_19382 ) ) ( not ( = ?auto_19392 ?auto_19382 ) ) ( not ( = ?auto_19397 ?auto_19382 ) ) ( AVAILABLE ?auto_19394 ) ( SURFACE-AT ?auto_19383 ?auto_19391 ) ( ON ?auto_19383 ?auto_19400 ) ( CLEAR ?auto_19383 ) ( not ( = ?auto_19384 ?auto_19400 ) ) ( not ( = ?auto_19385 ?auto_19400 ) ) ( not ( = ?auto_19383 ?auto_19400 ) ) ( not ( = ?auto_19392 ?auto_19400 ) ) ( not ( = ?auto_19397 ?auto_19400 ) ) ( not ( = ?auto_19382 ?auto_19400 ) ) ( IS-CRATE ?auto_19382 ) ( not ( = ?auto_19381 ?auto_19382 ) ) ( not ( = ?auto_19384 ?auto_19381 ) ) ( not ( = ?auto_19385 ?auto_19381 ) ) ( not ( = ?auto_19383 ?auto_19381 ) ) ( not ( = ?auto_19392 ?auto_19381 ) ) ( not ( = ?auto_19397 ?auto_19381 ) ) ( not ( = ?auto_19400 ?auto_19381 ) ) ( not ( = ?auto_19386 ?auto_19390 ) ) ( not ( = ?auto_19399 ?auto_19386 ) ) ( not ( = ?auto_19391 ?auto_19386 ) ) ( HOIST-AT ?auto_19387 ?auto_19386 ) ( not ( = ?auto_19395 ?auto_19387 ) ) ( not ( = ?auto_19398 ?auto_19387 ) ) ( not ( = ?auto_19394 ?auto_19387 ) ) ( AVAILABLE ?auto_19387 ) ( SURFACE-AT ?auto_19382 ?auto_19386 ) ( ON ?auto_19382 ?auto_19388 ) ( CLEAR ?auto_19382 ) ( not ( = ?auto_19384 ?auto_19388 ) ) ( not ( = ?auto_19385 ?auto_19388 ) ) ( not ( = ?auto_19383 ?auto_19388 ) ) ( not ( = ?auto_19392 ?auto_19388 ) ) ( not ( = ?auto_19397 ?auto_19388 ) ) ( not ( = ?auto_19382 ?auto_19388 ) ) ( not ( = ?auto_19400 ?auto_19388 ) ) ( not ( = ?auto_19381 ?auto_19388 ) ) ( SURFACE-AT ?auto_19396 ?auto_19390 ) ( CLEAR ?auto_19396 ) ( IS-CRATE ?auto_19381 ) ( not ( = ?auto_19396 ?auto_19381 ) ) ( not ( = ?auto_19384 ?auto_19396 ) ) ( not ( = ?auto_19385 ?auto_19396 ) ) ( not ( = ?auto_19383 ?auto_19396 ) ) ( not ( = ?auto_19392 ?auto_19396 ) ) ( not ( = ?auto_19397 ?auto_19396 ) ) ( not ( = ?auto_19382 ?auto_19396 ) ) ( not ( = ?auto_19400 ?auto_19396 ) ) ( not ( = ?auto_19388 ?auto_19396 ) ) ( AVAILABLE ?auto_19395 ) ( IN ?auto_19381 ?auto_19389 ) ( TRUCK-AT ?auto_19389 ?auto_19393 ) ( not ( = ?auto_19393 ?auto_19390 ) ) ( not ( = ?auto_19399 ?auto_19393 ) ) ( not ( = ?auto_19391 ?auto_19393 ) ) ( not ( = ?auto_19386 ?auto_19393 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19383 ?auto_19384 ?auto_19385 )
      ( MAKE-4CRATE-VERIFY ?auto_19381 ?auto_19382 ?auto_19383 ?auto_19384 ?auto_19385 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19401 - SURFACE
      ?auto_19402 - SURFACE
      ?auto_19403 - SURFACE
      ?auto_19404 - SURFACE
      ?auto_19405 - SURFACE
      ?auto_19406 - SURFACE
    )
    :vars
    (
      ?auto_19416 - HOIST
      ?auto_19411 - PLACE
      ?auto_19419 - PLACE
      ?auto_19418 - HOIST
      ?auto_19413 - SURFACE
      ?auto_19412 - PLACE
      ?auto_19415 - HOIST
      ?auto_19417 - SURFACE
      ?auto_19420 - SURFACE
      ?auto_19407 - PLACE
      ?auto_19408 - HOIST
      ?auto_19409 - SURFACE
      ?auto_19410 - TRUCK
      ?auto_19414 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19416 ?auto_19411 ) ( IS-CRATE ?auto_19406 ) ( not ( = ?auto_19405 ?auto_19406 ) ) ( not ( = ?auto_19404 ?auto_19405 ) ) ( not ( = ?auto_19404 ?auto_19406 ) ) ( not ( = ?auto_19419 ?auto_19411 ) ) ( HOIST-AT ?auto_19418 ?auto_19419 ) ( not ( = ?auto_19416 ?auto_19418 ) ) ( AVAILABLE ?auto_19418 ) ( SURFACE-AT ?auto_19406 ?auto_19419 ) ( ON ?auto_19406 ?auto_19413 ) ( CLEAR ?auto_19406 ) ( not ( = ?auto_19405 ?auto_19413 ) ) ( not ( = ?auto_19406 ?auto_19413 ) ) ( not ( = ?auto_19404 ?auto_19413 ) ) ( IS-CRATE ?auto_19405 ) ( not ( = ?auto_19412 ?auto_19411 ) ) ( not ( = ?auto_19419 ?auto_19412 ) ) ( HOIST-AT ?auto_19415 ?auto_19412 ) ( not ( = ?auto_19416 ?auto_19415 ) ) ( not ( = ?auto_19418 ?auto_19415 ) ) ( SURFACE-AT ?auto_19405 ?auto_19412 ) ( ON ?auto_19405 ?auto_19417 ) ( CLEAR ?auto_19405 ) ( not ( = ?auto_19405 ?auto_19417 ) ) ( not ( = ?auto_19406 ?auto_19417 ) ) ( not ( = ?auto_19404 ?auto_19417 ) ) ( not ( = ?auto_19413 ?auto_19417 ) ) ( IS-CRATE ?auto_19404 ) ( not ( = ?auto_19403 ?auto_19404 ) ) ( not ( = ?auto_19405 ?auto_19403 ) ) ( not ( = ?auto_19406 ?auto_19403 ) ) ( not ( = ?auto_19413 ?auto_19403 ) ) ( not ( = ?auto_19417 ?auto_19403 ) ) ( AVAILABLE ?auto_19415 ) ( SURFACE-AT ?auto_19404 ?auto_19412 ) ( ON ?auto_19404 ?auto_19420 ) ( CLEAR ?auto_19404 ) ( not ( = ?auto_19405 ?auto_19420 ) ) ( not ( = ?auto_19406 ?auto_19420 ) ) ( not ( = ?auto_19404 ?auto_19420 ) ) ( not ( = ?auto_19413 ?auto_19420 ) ) ( not ( = ?auto_19417 ?auto_19420 ) ) ( not ( = ?auto_19403 ?auto_19420 ) ) ( IS-CRATE ?auto_19403 ) ( not ( = ?auto_19402 ?auto_19403 ) ) ( not ( = ?auto_19405 ?auto_19402 ) ) ( not ( = ?auto_19406 ?auto_19402 ) ) ( not ( = ?auto_19404 ?auto_19402 ) ) ( not ( = ?auto_19413 ?auto_19402 ) ) ( not ( = ?auto_19417 ?auto_19402 ) ) ( not ( = ?auto_19420 ?auto_19402 ) ) ( not ( = ?auto_19407 ?auto_19411 ) ) ( not ( = ?auto_19419 ?auto_19407 ) ) ( not ( = ?auto_19412 ?auto_19407 ) ) ( HOIST-AT ?auto_19408 ?auto_19407 ) ( not ( = ?auto_19416 ?auto_19408 ) ) ( not ( = ?auto_19418 ?auto_19408 ) ) ( not ( = ?auto_19415 ?auto_19408 ) ) ( AVAILABLE ?auto_19408 ) ( SURFACE-AT ?auto_19403 ?auto_19407 ) ( ON ?auto_19403 ?auto_19409 ) ( CLEAR ?auto_19403 ) ( not ( = ?auto_19405 ?auto_19409 ) ) ( not ( = ?auto_19406 ?auto_19409 ) ) ( not ( = ?auto_19404 ?auto_19409 ) ) ( not ( = ?auto_19413 ?auto_19409 ) ) ( not ( = ?auto_19417 ?auto_19409 ) ) ( not ( = ?auto_19403 ?auto_19409 ) ) ( not ( = ?auto_19420 ?auto_19409 ) ) ( not ( = ?auto_19402 ?auto_19409 ) ) ( SURFACE-AT ?auto_19401 ?auto_19411 ) ( CLEAR ?auto_19401 ) ( IS-CRATE ?auto_19402 ) ( not ( = ?auto_19401 ?auto_19402 ) ) ( not ( = ?auto_19405 ?auto_19401 ) ) ( not ( = ?auto_19406 ?auto_19401 ) ) ( not ( = ?auto_19404 ?auto_19401 ) ) ( not ( = ?auto_19413 ?auto_19401 ) ) ( not ( = ?auto_19417 ?auto_19401 ) ) ( not ( = ?auto_19403 ?auto_19401 ) ) ( not ( = ?auto_19420 ?auto_19401 ) ) ( not ( = ?auto_19409 ?auto_19401 ) ) ( AVAILABLE ?auto_19416 ) ( IN ?auto_19402 ?auto_19410 ) ( TRUCK-AT ?auto_19410 ?auto_19414 ) ( not ( = ?auto_19414 ?auto_19411 ) ) ( not ( = ?auto_19419 ?auto_19414 ) ) ( not ( = ?auto_19412 ?auto_19414 ) ) ( not ( = ?auto_19407 ?auto_19414 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19404 ?auto_19405 ?auto_19406 )
      ( MAKE-5CRATE-VERIFY ?auto_19401 ?auto_19402 ?auto_19403 ?auto_19404 ?auto_19405 ?auto_19406 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19421 - SURFACE
      ?auto_19422 - SURFACE
    )
    :vars
    (
      ?auto_19433 - HOIST
      ?auto_19428 - PLACE
      ?auto_19435 - SURFACE
      ?auto_19439 - PLACE
      ?auto_19438 - HOIST
      ?auto_19430 - SURFACE
      ?auto_19429 - PLACE
      ?auto_19432 - HOIST
      ?auto_19437 - SURFACE
      ?auto_19436 - SURFACE
      ?auto_19440 - SURFACE
      ?auto_19425 - SURFACE
      ?auto_19423 - PLACE
      ?auto_19424 - HOIST
      ?auto_19426 - SURFACE
      ?auto_19434 - SURFACE
      ?auto_19427 - TRUCK
      ?auto_19431 - PLACE
      ?auto_19441 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19433 ?auto_19428 ) ( IS-CRATE ?auto_19422 ) ( not ( = ?auto_19421 ?auto_19422 ) ) ( not ( = ?auto_19435 ?auto_19421 ) ) ( not ( = ?auto_19435 ?auto_19422 ) ) ( not ( = ?auto_19439 ?auto_19428 ) ) ( HOIST-AT ?auto_19438 ?auto_19439 ) ( not ( = ?auto_19433 ?auto_19438 ) ) ( AVAILABLE ?auto_19438 ) ( SURFACE-AT ?auto_19422 ?auto_19439 ) ( ON ?auto_19422 ?auto_19430 ) ( CLEAR ?auto_19422 ) ( not ( = ?auto_19421 ?auto_19430 ) ) ( not ( = ?auto_19422 ?auto_19430 ) ) ( not ( = ?auto_19435 ?auto_19430 ) ) ( IS-CRATE ?auto_19421 ) ( not ( = ?auto_19429 ?auto_19428 ) ) ( not ( = ?auto_19439 ?auto_19429 ) ) ( HOIST-AT ?auto_19432 ?auto_19429 ) ( not ( = ?auto_19433 ?auto_19432 ) ) ( not ( = ?auto_19438 ?auto_19432 ) ) ( SURFACE-AT ?auto_19421 ?auto_19429 ) ( ON ?auto_19421 ?auto_19437 ) ( CLEAR ?auto_19421 ) ( not ( = ?auto_19421 ?auto_19437 ) ) ( not ( = ?auto_19422 ?auto_19437 ) ) ( not ( = ?auto_19435 ?auto_19437 ) ) ( not ( = ?auto_19430 ?auto_19437 ) ) ( IS-CRATE ?auto_19435 ) ( not ( = ?auto_19436 ?auto_19435 ) ) ( not ( = ?auto_19421 ?auto_19436 ) ) ( not ( = ?auto_19422 ?auto_19436 ) ) ( not ( = ?auto_19430 ?auto_19436 ) ) ( not ( = ?auto_19437 ?auto_19436 ) ) ( AVAILABLE ?auto_19432 ) ( SURFACE-AT ?auto_19435 ?auto_19429 ) ( ON ?auto_19435 ?auto_19440 ) ( CLEAR ?auto_19435 ) ( not ( = ?auto_19421 ?auto_19440 ) ) ( not ( = ?auto_19422 ?auto_19440 ) ) ( not ( = ?auto_19435 ?auto_19440 ) ) ( not ( = ?auto_19430 ?auto_19440 ) ) ( not ( = ?auto_19437 ?auto_19440 ) ) ( not ( = ?auto_19436 ?auto_19440 ) ) ( IS-CRATE ?auto_19436 ) ( not ( = ?auto_19425 ?auto_19436 ) ) ( not ( = ?auto_19421 ?auto_19425 ) ) ( not ( = ?auto_19422 ?auto_19425 ) ) ( not ( = ?auto_19435 ?auto_19425 ) ) ( not ( = ?auto_19430 ?auto_19425 ) ) ( not ( = ?auto_19437 ?auto_19425 ) ) ( not ( = ?auto_19440 ?auto_19425 ) ) ( not ( = ?auto_19423 ?auto_19428 ) ) ( not ( = ?auto_19439 ?auto_19423 ) ) ( not ( = ?auto_19429 ?auto_19423 ) ) ( HOIST-AT ?auto_19424 ?auto_19423 ) ( not ( = ?auto_19433 ?auto_19424 ) ) ( not ( = ?auto_19438 ?auto_19424 ) ) ( not ( = ?auto_19432 ?auto_19424 ) ) ( AVAILABLE ?auto_19424 ) ( SURFACE-AT ?auto_19436 ?auto_19423 ) ( ON ?auto_19436 ?auto_19426 ) ( CLEAR ?auto_19436 ) ( not ( = ?auto_19421 ?auto_19426 ) ) ( not ( = ?auto_19422 ?auto_19426 ) ) ( not ( = ?auto_19435 ?auto_19426 ) ) ( not ( = ?auto_19430 ?auto_19426 ) ) ( not ( = ?auto_19437 ?auto_19426 ) ) ( not ( = ?auto_19436 ?auto_19426 ) ) ( not ( = ?auto_19440 ?auto_19426 ) ) ( not ( = ?auto_19425 ?auto_19426 ) ) ( SURFACE-AT ?auto_19434 ?auto_19428 ) ( CLEAR ?auto_19434 ) ( IS-CRATE ?auto_19425 ) ( not ( = ?auto_19434 ?auto_19425 ) ) ( not ( = ?auto_19421 ?auto_19434 ) ) ( not ( = ?auto_19422 ?auto_19434 ) ) ( not ( = ?auto_19435 ?auto_19434 ) ) ( not ( = ?auto_19430 ?auto_19434 ) ) ( not ( = ?auto_19437 ?auto_19434 ) ) ( not ( = ?auto_19436 ?auto_19434 ) ) ( not ( = ?auto_19440 ?auto_19434 ) ) ( not ( = ?auto_19426 ?auto_19434 ) ) ( AVAILABLE ?auto_19433 ) ( TRUCK-AT ?auto_19427 ?auto_19431 ) ( not ( = ?auto_19431 ?auto_19428 ) ) ( not ( = ?auto_19439 ?auto_19431 ) ) ( not ( = ?auto_19429 ?auto_19431 ) ) ( not ( = ?auto_19423 ?auto_19431 ) ) ( HOIST-AT ?auto_19441 ?auto_19431 ) ( LIFTING ?auto_19441 ?auto_19425 ) ( not ( = ?auto_19433 ?auto_19441 ) ) ( not ( = ?auto_19438 ?auto_19441 ) ) ( not ( = ?auto_19432 ?auto_19441 ) ) ( not ( = ?auto_19424 ?auto_19441 ) ) )
    :subtasks
    ( ( !LOAD ?auto_19441 ?auto_19425 ?auto_19427 ?auto_19431 )
      ( MAKE-2CRATE ?auto_19435 ?auto_19421 ?auto_19422 )
      ( MAKE-1CRATE-VERIFY ?auto_19421 ?auto_19422 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19442 - SURFACE
      ?auto_19443 - SURFACE
      ?auto_19444 - SURFACE
    )
    :vars
    (
      ?auto_19448 - HOIST
      ?auto_19461 - PLACE
      ?auto_19456 - PLACE
      ?auto_19454 - HOIST
      ?auto_19457 - SURFACE
      ?auto_19445 - PLACE
      ?auto_19449 - HOIST
      ?auto_19451 - SURFACE
      ?auto_19452 - SURFACE
      ?auto_19459 - SURFACE
      ?auto_19453 - SURFACE
      ?auto_19455 - PLACE
      ?auto_19458 - HOIST
      ?auto_19447 - SURFACE
      ?auto_19450 - SURFACE
      ?auto_19460 - TRUCK
      ?auto_19446 - PLACE
      ?auto_19462 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19448 ?auto_19461 ) ( IS-CRATE ?auto_19444 ) ( not ( = ?auto_19443 ?auto_19444 ) ) ( not ( = ?auto_19442 ?auto_19443 ) ) ( not ( = ?auto_19442 ?auto_19444 ) ) ( not ( = ?auto_19456 ?auto_19461 ) ) ( HOIST-AT ?auto_19454 ?auto_19456 ) ( not ( = ?auto_19448 ?auto_19454 ) ) ( AVAILABLE ?auto_19454 ) ( SURFACE-AT ?auto_19444 ?auto_19456 ) ( ON ?auto_19444 ?auto_19457 ) ( CLEAR ?auto_19444 ) ( not ( = ?auto_19443 ?auto_19457 ) ) ( not ( = ?auto_19444 ?auto_19457 ) ) ( not ( = ?auto_19442 ?auto_19457 ) ) ( IS-CRATE ?auto_19443 ) ( not ( = ?auto_19445 ?auto_19461 ) ) ( not ( = ?auto_19456 ?auto_19445 ) ) ( HOIST-AT ?auto_19449 ?auto_19445 ) ( not ( = ?auto_19448 ?auto_19449 ) ) ( not ( = ?auto_19454 ?auto_19449 ) ) ( SURFACE-AT ?auto_19443 ?auto_19445 ) ( ON ?auto_19443 ?auto_19451 ) ( CLEAR ?auto_19443 ) ( not ( = ?auto_19443 ?auto_19451 ) ) ( not ( = ?auto_19444 ?auto_19451 ) ) ( not ( = ?auto_19442 ?auto_19451 ) ) ( not ( = ?auto_19457 ?auto_19451 ) ) ( IS-CRATE ?auto_19442 ) ( not ( = ?auto_19452 ?auto_19442 ) ) ( not ( = ?auto_19443 ?auto_19452 ) ) ( not ( = ?auto_19444 ?auto_19452 ) ) ( not ( = ?auto_19457 ?auto_19452 ) ) ( not ( = ?auto_19451 ?auto_19452 ) ) ( AVAILABLE ?auto_19449 ) ( SURFACE-AT ?auto_19442 ?auto_19445 ) ( ON ?auto_19442 ?auto_19459 ) ( CLEAR ?auto_19442 ) ( not ( = ?auto_19443 ?auto_19459 ) ) ( not ( = ?auto_19444 ?auto_19459 ) ) ( not ( = ?auto_19442 ?auto_19459 ) ) ( not ( = ?auto_19457 ?auto_19459 ) ) ( not ( = ?auto_19451 ?auto_19459 ) ) ( not ( = ?auto_19452 ?auto_19459 ) ) ( IS-CRATE ?auto_19452 ) ( not ( = ?auto_19453 ?auto_19452 ) ) ( not ( = ?auto_19443 ?auto_19453 ) ) ( not ( = ?auto_19444 ?auto_19453 ) ) ( not ( = ?auto_19442 ?auto_19453 ) ) ( not ( = ?auto_19457 ?auto_19453 ) ) ( not ( = ?auto_19451 ?auto_19453 ) ) ( not ( = ?auto_19459 ?auto_19453 ) ) ( not ( = ?auto_19455 ?auto_19461 ) ) ( not ( = ?auto_19456 ?auto_19455 ) ) ( not ( = ?auto_19445 ?auto_19455 ) ) ( HOIST-AT ?auto_19458 ?auto_19455 ) ( not ( = ?auto_19448 ?auto_19458 ) ) ( not ( = ?auto_19454 ?auto_19458 ) ) ( not ( = ?auto_19449 ?auto_19458 ) ) ( AVAILABLE ?auto_19458 ) ( SURFACE-AT ?auto_19452 ?auto_19455 ) ( ON ?auto_19452 ?auto_19447 ) ( CLEAR ?auto_19452 ) ( not ( = ?auto_19443 ?auto_19447 ) ) ( not ( = ?auto_19444 ?auto_19447 ) ) ( not ( = ?auto_19442 ?auto_19447 ) ) ( not ( = ?auto_19457 ?auto_19447 ) ) ( not ( = ?auto_19451 ?auto_19447 ) ) ( not ( = ?auto_19452 ?auto_19447 ) ) ( not ( = ?auto_19459 ?auto_19447 ) ) ( not ( = ?auto_19453 ?auto_19447 ) ) ( SURFACE-AT ?auto_19450 ?auto_19461 ) ( CLEAR ?auto_19450 ) ( IS-CRATE ?auto_19453 ) ( not ( = ?auto_19450 ?auto_19453 ) ) ( not ( = ?auto_19443 ?auto_19450 ) ) ( not ( = ?auto_19444 ?auto_19450 ) ) ( not ( = ?auto_19442 ?auto_19450 ) ) ( not ( = ?auto_19457 ?auto_19450 ) ) ( not ( = ?auto_19451 ?auto_19450 ) ) ( not ( = ?auto_19452 ?auto_19450 ) ) ( not ( = ?auto_19459 ?auto_19450 ) ) ( not ( = ?auto_19447 ?auto_19450 ) ) ( AVAILABLE ?auto_19448 ) ( TRUCK-AT ?auto_19460 ?auto_19446 ) ( not ( = ?auto_19446 ?auto_19461 ) ) ( not ( = ?auto_19456 ?auto_19446 ) ) ( not ( = ?auto_19445 ?auto_19446 ) ) ( not ( = ?auto_19455 ?auto_19446 ) ) ( HOIST-AT ?auto_19462 ?auto_19446 ) ( LIFTING ?auto_19462 ?auto_19453 ) ( not ( = ?auto_19448 ?auto_19462 ) ) ( not ( = ?auto_19454 ?auto_19462 ) ) ( not ( = ?auto_19449 ?auto_19462 ) ) ( not ( = ?auto_19458 ?auto_19462 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19443 ?auto_19444 )
      ( MAKE-2CRATE-VERIFY ?auto_19442 ?auto_19443 ?auto_19444 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19463 - SURFACE
      ?auto_19464 - SURFACE
      ?auto_19465 - SURFACE
      ?auto_19466 - SURFACE
    )
    :vars
    (
      ?auto_19469 - HOIST
      ?auto_19472 - PLACE
      ?auto_19471 - PLACE
      ?auto_19479 - HOIST
      ?auto_19478 - SURFACE
      ?auto_19481 - PLACE
      ?auto_19470 - HOIST
      ?auto_19475 - SURFACE
      ?auto_19482 - SURFACE
      ?auto_19473 - SURFACE
      ?auto_19476 - PLACE
      ?auto_19468 - HOIST
      ?auto_19483 - SURFACE
      ?auto_19474 - SURFACE
      ?auto_19480 - TRUCK
      ?auto_19477 - PLACE
      ?auto_19467 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19469 ?auto_19472 ) ( IS-CRATE ?auto_19466 ) ( not ( = ?auto_19465 ?auto_19466 ) ) ( not ( = ?auto_19464 ?auto_19465 ) ) ( not ( = ?auto_19464 ?auto_19466 ) ) ( not ( = ?auto_19471 ?auto_19472 ) ) ( HOIST-AT ?auto_19479 ?auto_19471 ) ( not ( = ?auto_19469 ?auto_19479 ) ) ( AVAILABLE ?auto_19479 ) ( SURFACE-AT ?auto_19466 ?auto_19471 ) ( ON ?auto_19466 ?auto_19478 ) ( CLEAR ?auto_19466 ) ( not ( = ?auto_19465 ?auto_19478 ) ) ( not ( = ?auto_19466 ?auto_19478 ) ) ( not ( = ?auto_19464 ?auto_19478 ) ) ( IS-CRATE ?auto_19465 ) ( not ( = ?auto_19481 ?auto_19472 ) ) ( not ( = ?auto_19471 ?auto_19481 ) ) ( HOIST-AT ?auto_19470 ?auto_19481 ) ( not ( = ?auto_19469 ?auto_19470 ) ) ( not ( = ?auto_19479 ?auto_19470 ) ) ( SURFACE-AT ?auto_19465 ?auto_19481 ) ( ON ?auto_19465 ?auto_19475 ) ( CLEAR ?auto_19465 ) ( not ( = ?auto_19465 ?auto_19475 ) ) ( not ( = ?auto_19466 ?auto_19475 ) ) ( not ( = ?auto_19464 ?auto_19475 ) ) ( not ( = ?auto_19478 ?auto_19475 ) ) ( IS-CRATE ?auto_19464 ) ( not ( = ?auto_19463 ?auto_19464 ) ) ( not ( = ?auto_19465 ?auto_19463 ) ) ( not ( = ?auto_19466 ?auto_19463 ) ) ( not ( = ?auto_19478 ?auto_19463 ) ) ( not ( = ?auto_19475 ?auto_19463 ) ) ( AVAILABLE ?auto_19470 ) ( SURFACE-AT ?auto_19464 ?auto_19481 ) ( ON ?auto_19464 ?auto_19482 ) ( CLEAR ?auto_19464 ) ( not ( = ?auto_19465 ?auto_19482 ) ) ( not ( = ?auto_19466 ?auto_19482 ) ) ( not ( = ?auto_19464 ?auto_19482 ) ) ( not ( = ?auto_19478 ?auto_19482 ) ) ( not ( = ?auto_19475 ?auto_19482 ) ) ( not ( = ?auto_19463 ?auto_19482 ) ) ( IS-CRATE ?auto_19463 ) ( not ( = ?auto_19473 ?auto_19463 ) ) ( not ( = ?auto_19465 ?auto_19473 ) ) ( not ( = ?auto_19466 ?auto_19473 ) ) ( not ( = ?auto_19464 ?auto_19473 ) ) ( not ( = ?auto_19478 ?auto_19473 ) ) ( not ( = ?auto_19475 ?auto_19473 ) ) ( not ( = ?auto_19482 ?auto_19473 ) ) ( not ( = ?auto_19476 ?auto_19472 ) ) ( not ( = ?auto_19471 ?auto_19476 ) ) ( not ( = ?auto_19481 ?auto_19476 ) ) ( HOIST-AT ?auto_19468 ?auto_19476 ) ( not ( = ?auto_19469 ?auto_19468 ) ) ( not ( = ?auto_19479 ?auto_19468 ) ) ( not ( = ?auto_19470 ?auto_19468 ) ) ( AVAILABLE ?auto_19468 ) ( SURFACE-AT ?auto_19463 ?auto_19476 ) ( ON ?auto_19463 ?auto_19483 ) ( CLEAR ?auto_19463 ) ( not ( = ?auto_19465 ?auto_19483 ) ) ( not ( = ?auto_19466 ?auto_19483 ) ) ( not ( = ?auto_19464 ?auto_19483 ) ) ( not ( = ?auto_19478 ?auto_19483 ) ) ( not ( = ?auto_19475 ?auto_19483 ) ) ( not ( = ?auto_19463 ?auto_19483 ) ) ( not ( = ?auto_19482 ?auto_19483 ) ) ( not ( = ?auto_19473 ?auto_19483 ) ) ( SURFACE-AT ?auto_19474 ?auto_19472 ) ( CLEAR ?auto_19474 ) ( IS-CRATE ?auto_19473 ) ( not ( = ?auto_19474 ?auto_19473 ) ) ( not ( = ?auto_19465 ?auto_19474 ) ) ( not ( = ?auto_19466 ?auto_19474 ) ) ( not ( = ?auto_19464 ?auto_19474 ) ) ( not ( = ?auto_19478 ?auto_19474 ) ) ( not ( = ?auto_19475 ?auto_19474 ) ) ( not ( = ?auto_19463 ?auto_19474 ) ) ( not ( = ?auto_19482 ?auto_19474 ) ) ( not ( = ?auto_19483 ?auto_19474 ) ) ( AVAILABLE ?auto_19469 ) ( TRUCK-AT ?auto_19480 ?auto_19477 ) ( not ( = ?auto_19477 ?auto_19472 ) ) ( not ( = ?auto_19471 ?auto_19477 ) ) ( not ( = ?auto_19481 ?auto_19477 ) ) ( not ( = ?auto_19476 ?auto_19477 ) ) ( HOIST-AT ?auto_19467 ?auto_19477 ) ( LIFTING ?auto_19467 ?auto_19473 ) ( not ( = ?auto_19469 ?auto_19467 ) ) ( not ( = ?auto_19479 ?auto_19467 ) ) ( not ( = ?auto_19470 ?auto_19467 ) ) ( not ( = ?auto_19468 ?auto_19467 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19464 ?auto_19465 ?auto_19466 )
      ( MAKE-3CRATE-VERIFY ?auto_19463 ?auto_19464 ?auto_19465 ?auto_19466 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19484 - SURFACE
      ?auto_19485 - SURFACE
      ?auto_19486 - SURFACE
      ?auto_19487 - SURFACE
      ?auto_19488 - SURFACE
    )
    :vars
    (
      ?auto_19491 - HOIST
      ?auto_19494 - PLACE
      ?auto_19493 - PLACE
      ?auto_19500 - HOIST
      ?auto_19499 - SURFACE
      ?auto_19502 - PLACE
      ?auto_19492 - HOIST
      ?auto_19496 - SURFACE
      ?auto_19503 - SURFACE
      ?auto_19497 - PLACE
      ?auto_19490 - HOIST
      ?auto_19504 - SURFACE
      ?auto_19495 - SURFACE
      ?auto_19501 - TRUCK
      ?auto_19498 - PLACE
      ?auto_19489 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19491 ?auto_19494 ) ( IS-CRATE ?auto_19488 ) ( not ( = ?auto_19487 ?auto_19488 ) ) ( not ( = ?auto_19486 ?auto_19487 ) ) ( not ( = ?auto_19486 ?auto_19488 ) ) ( not ( = ?auto_19493 ?auto_19494 ) ) ( HOIST-AT ?auto_19500 ?auto_19493 ) ( not ( = ?auto_19491 ?auto_19500 ) ) ( AVAILABLE ?auto_19500 ) ( SURFACE-AT ?auto_19488 ?auto_19493 ) ( ON ?auto_19488 ?auto_19499 ) ( CLEAR ?auto_19488 ) ( not ( = ?auto_19487 ?auto_19499 ) ) ( not ( = ?auto_19488 ?auto_19499 ) ) ( not ( = ?auto_19486 ?auto_19499 ) ) ( IS-CRATE ?auto_19487 ) ( not ( = ?auto_19502 ?auto_19494 ) ) ( not ( = ?auto_19493 ?auto_19502 ) ) ( HOIST-AT ?auto_19492 ?auto_19502 ) ( not ( = ?auto_19491 ?auto_19492 ) ) ( not ( = ?auto_19500 ?auto_19492 ) ) ( SURFACE-AT ?auto_19487 ?auto_19502 ) ( ON ?auto_19487 ?auto_19496 ) ( CLEAR ?auto_19487 ) ( not ( = ?auto_19487 ?auto_19496 ) ) ( not ( = ?auto_19488 ?auto_19496 ) ) ( not ( = ?auto_19486 ?auto_19496 ) ) ( not ( = ?auto_19499 ?auto_19496 ) ) ( IS-CRATE ?auto_19486 ) ( not ( = ?auto_19485 ?auto_19486 ) ) ( not ( = ?auto_19487 ?auto_19485 ) ) ( not ( = ?auto_19488 ?auto_19485 ) ) ( not ( = ?auto_19499 ?auto_19485 ) ) ( not ( = ?auto_19496 ?auto_19485 ) ) ( AVAILABLE ?auto_19492 ) ( SURFACE-AT ?auto_19486 ?auto_19502 ) ( ON ?auto_19486 ?auto_19503 ) ( CLEAR ?auto_19486 ) ( not ( = ?auto_19487 ?auto_19503 ) ) ( not ( = ?auto_19488 ?auto_19503 ) ) ( not ( = ?auto_19486 ?auto_19503 ) ) ( not ( = ?auto_19499 ?auto_19503 ) ) ( not ( = ?auto_19496 ?auto_19503 ) ) ( not ( = ?auto_19485 ?auto_19503 ) ) ( IS-CRATE ?auto_19485 ) ( not ( = ?auto_19484 ?auto_19485 ) ) ( not ( = ?auto_19487 ?auto_19484 ) ) ( not ( = ?auto_19488 ?auto_19484 ) ) ( not ( = ?auto_19486 ?auto_19484 ) ) ( not ( = ?auto_19499 ?auto_19484 ) ) ( not ( = ?auto_19496 ?auto_19484 ) ) ( not ( = ?auto_19503 ?auto_19484 ) ) ( not ( = ?auto_19497 ?auto_19494 ) ) ( not ( = ?auto_19493 ?auto_19497 ) ) ( not ( = ?auto_19502 ?auto_19497 ) ) ( HOIST-AT ?auto_19490 ?auto_19497 ) ( not ( = ?auto_19491 ?auto_19490 ) ) ( not ( = ?auto_19500 ?auto_19490 ) ) ( not ( = ?auto_19492 ?auto_19490 ) ) ( AVAILABLE ?auto_19490 ) ( SURFACE-AT ?auto_19485 ?auto_19497 ) ( ON ?auto_19485 ?auto_19504 ) ( CLEAR ?auto_19485 ) ( not ( = ?auto_19487 ?auto_19504 ) ) ( not ( = ?auto_19488 ?auto_19504 ) ) ( not ( = ?auto_19486 ?auto_19504 ) ) ( not ( = ?auto_19499 ?auto_19504 ) ) ( not ( = ?auto_19496 ?auto_19504 ) ) ( not ( = ?auto_19485 ?auto_19504 ) ) ( not ( = ?auto_19503 ?auto_19504 ) ) ( not ( = ?auto_19484 ?auto_19504 ) ) ( SURFACE-AT ?auto_19495 ?auto_19494 ) ( CLEAR ?auto_19495 ) ( IS-CRATE ?auto_19484 ) ( not ( = ?auto_19495 ?auto_19484 ) ) ( not ( = ?auto_19487 ?auto_19495 ) ) ( not ( = ?auto_19488 ?auto_19495 ) ) ( not ( = ?auto_19486 ?auto_19495 ) ) ( not ( = ?auto_19499 ?auto_19495 ) ) ( not ( = ?auto_19496 ?auto_19495 ) ) ( not ( = ?auto_19485 ?auto_19495 ) ) ( not ( = ?auto_19503 ?auto_19495 ) ) ( not ( = ?auto_19504 ?auto_19495 ) ) ( AVAILABLE ?auto_19491 ) ( TRUCK-AT ?auto_19501 ?auto_19498 ) ( not ( = ?auto_19498 ?auto_19494 ) ) ( not ( = ?auto_19493 ?auto_19498 ) ) ( not ( = ?auto_19502 ?auto_19498 ) ) ( not ( = ?auto_19497 ?auto_19498 ) ) ( HOIST-AT ?auto_19489 ?auto_19498 ) ( LIFTING ?auto_19489 ?auto_19484 ) ( not ( = ?auto_19491 ?auto_19489 ) ) ( not ( = ?auto_19500 ?auto_19489 ) ) ( not ( = ?auto_19492 ?auto_19489 ) ) ( not ( = ?auto_19490 ?auto_19489 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19486 ?auto_19487 ?auto_19488 )
      ( MAKE-4CRATE-VERIFY ?auto_19484 ?auto_19485 ?auto_19486 ?auto_19487 ?auto_19488 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19505 - SURFACE
      ?auto_19506 - SURFACE
      ?auto_19507 - SURFACE
      ?auto_19508 - SURFACE
      ?auto_19509 - SURFACE
      ?auto_19510 - SURFACE
    )
    :vars
    (
      ?auto_19513 - HOIST
      ?auto_19516 - PLACE
      ?auto_19515 - PLACE
      ?auto_19521 - HOIST
      ?auto_19520 - SURFACE
      ?auto_19523 - PLACE
      ?auto_19514 - HOIST
      ?auto_19517 - SURFACE
      ?auto_19524 - SURFACE
      ?auto_19518 - PLACE
      ?auto_19512 - HOIST
      ?auto_19525 - SURFACE
      ?auto_19522 - TRUCK
      ?auto_19519 - PLACE
      ?auto_19511 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19513 ?auto_19516 ) ( IS-CRATE ?auto_19510 ) ( not ( = ?auto_19509 ?auto_19510 ) ) ( not ( = ?auto_19508 ?auto_19509 ) ) ( not ( = ?auto_19508 ?auto_19510 ) ) ( not ( = ?auto_19515 ?auto_19516 ) ) ( HOIST-AT ?auto_19521 ?auto_19515 ) ( not ( = ?auto_19513 ?auto_19521 ) ) ( AVAILABLE ?auto_19521 ) ( SURFACE-AT ?auto_19510 ?auto_19515 ) ( ON ?auto_19510 ?auto_19520 ) ( CLEAR ?auto_19510 ) ( not ( = ?auto_19509 ?auto_19520 ) ) ( not ( = ?auto_19510 ?auto_19520 ) ) ( not ( = ?auto_19508 ?auto_19520 ) ) ( IS-CRATE ?auto_19509 ) ( not ( = ?auto_19523 ?auto_19516 ) ) ( not ( = ?auto_19515 ?auto_19523 ) ) ( HOIST-AT ?auto_19514 ?auto_19523 ) ( not ( = ?auto_19513 ?auto_19514 ) ) ( not ( = ?auto_19521 ?auto_19514 ) ) ( SURFACE-AT ?auto_19509 ?auto_19523 ) ( ON ?auto_19509 ?auto_19517 ) ( CLEAR ?auto_19509 ) ( not ( = ?auto_19509 ?auto_19517 ) ) ( not ( = ?auto_19510 ?auto_19517 ) ) ( not ( = ?auto_19508 ?auto_19517 ) ) ( not ( = ?auto_19520 ?auto_19517 ) ) ( IS-CRATE ?auto_19508 ) ( not ( = ?auto_19507 ?auto_19508 ) ) ( not ( = ?auto_19509 ?auto_19507 ) ) ( not ( = ?auto_19510 ?auto_19507 ) ) ( not ( = ?auto_19520 ?auto_19507 ) ) ( not ( = ?auto_19517 ?auto_19507 ) ) ( AVAILABLE ?auto_19514 ) ( SURFACE-AT ?auto_19508 ?auto_19523 ) ( ON ?auto_19508 ?auto_19524 ) ( CLEAR ?auto_19508 ) ( not ( = ?auto_19509 ?auto_19524 ) ) ( not ( = ?auto_19510 ?auto_19524 ) ) ( not ( = ?auto_19508 ?auto_19524 ) ) ( not ( = ?auto_19520 ?auto_19524 ) ) ( not ( = ?auto_19517 ?auto_19524 ) ) ( not ( = ?auto_19507 ?auto_19524 ) ) ( IS-CRATE ?auto_19507 ) ( not ( = ?auto_19506 ?auto_19507 ) ) ( not ( = ?auto_19509 ?auto_19506 ) ) ( not ( = ?auto_19510 ?auto_19506 ) ) ( not ( = ?auto_19508 ?auto_19506 ) ) ( not ( = ?auto_19520 ?auto_19506 ) ) ( not ( = ?auto_19517 ?auto_19506 ) ) ( not ( = ?auto_19524 ?auto_19506 ) ) ( not ( = ?auto_19518 ?auto_19516 ) ) ( not ( = ?auto_19515 ?auto_19518 ) ) ( not ( = ?auto_19523 ?auto_19518 ) ) ( HOIST-AT ?auto_19512 ?auto_19518 ) ( not ( = ?auto_19513 ?auto_19512 ) ) ( not ( = ?auto_19521 ?auto_19512 ) ) ( not ( = ?auto_19514 ?auto_19512 ) ) ( AVAILABLE ?auto_19512 ) ( SURFACE-AT ?auto_19507 ?auto_19518 ) ( ON ?auto_19507 ?auto_19525 ) ( CLEAR ?auto_19507 ) ( not ( = ?auto_19509 ?auto_19525 ) ) ( not ( = ?auto_19510 ?auto_19525 ) ) ( not ( = ?auto_19508 ?auto_19525 ) ) ( not ( = ?auto_19520 ?auto_19525 ) ) ( not ( = ?auto_19517 ?auto_19525 ) ) ( not ( = ?auto_19507 ?auto_19525 ) ) ( not ( = ?auto_19524 ?auto_19525 ) ) ( not ( = ?auto_19506 ?auto_19525 ) ) ( SURFACE-AT ?auto_19505 ?auto_19516 ) ( CLEAR ?auto_19505 ) ( IS-CRATE ?auto_19506 ) ( not ( = ?auto_19505 ?auto_19506 ) ) ( not ( = ?auto_19509 ?auto_19505 ) ) ( not ( = ?auto_19510 ?auto_19505 ) ) ( not ( = ?auto_19508 ?auto_19505 ) ) ( not ( = ?auto_19520 ?auto_19505 ) ) ( not ( = ?auto_19517 ?auto_19505 ) ) ( not ( = ?auto_19507 ?auto_19505 ) ) ( not ( = ?auto_19524 ?auto_19505 ) ) ( not ( = ?auto_19525 ?auto_19505 ) ) ( AVAILABLE ?auto_19513 ) ( TRUCK-AT ?auto_19522 ?auto_19519 ) ( not ( = ?auto_19519 ?auto_19516 ) ) ( not ( = ?auto_19515 ?auto_19519 ) ) ( not ( = ?auto_19523 ?auto_19519 ) ) ( not ( = ?auto_19518 ?auto_19519 ) ) ( HOIST-AT ?auto_19511 ?auto_19519 ) ( LIFTING ?auto_19511 ?auto_19506 ) ( not ( = ?auto_19513 ?auto_19511 ) ) ( not ( = ?auto_19521 ?auto_19511 ) ) ( not ( = ?auto_19514 ?auto_19511 ) ) ( not ( = ?auto_19512 ?auto_19511 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19508 ?auto_19509 ?auto_19510 )
      ( MAKE-5CRATE-VERIFY ?auto_19505 ?auto_19506 ?auto_19507 ?auto_19508 ?auto_19509 ?auto_19510 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19526 - SURFACE
      ?auto_19527 - SURFACE
    )
    :vars
    (
      ?auto_19531 - HOIST
      ?auto_19534 - PLACE
      ?auto_19541 - SURFACE
      ?auto_19533 - PLACE
      ?auto_19542 - HOIST
      ?auto_19540 - SURFACE
      ?auto_19544 - PLACE
      ?auto_19532 - HOIST
      ?auto_19537 - SURFACE
      ?auto_19529 - SURFACE
      ?auto_19545 - SURFACE
      ?auto_19535 - SURFACE
      ?auto_19538 - PLACE
      ?auto_19530 - HOIST
      ?auto_19546 - SURFACE
      ?auto_19536 - SURFACE
      ?auto_19543 - TRUCK
      ?auto_19539 - PLACE
      ?auto_19528 - HOIST
      ?auto_19547 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19531 ?auto_19534 ) ( IS-CRATE ?auto_19527 ) ( not ( = ?auto_19526 ?auto_19527 ) ) ( not ( = ?auto_19541 ?auto_19526 ) ) ( not ( = ?auto_19541 ?auto_19527 ) ) ( not ( = ?auto_19533 ?auto_19534 ) ) ( HOIST-AT ?auto_19542 ?auto_19533 ) ( not ( = ?auto_19531 ?auto_19542 ) ) ( AVAILABLE ?auto_19542 ) ( SURFACE-AT ?auto_19527 ?auto_19533 ) ( ON ?auto_19527 ?auto_19540 ) ( CLEAR ?auto_19527 ) ( not ( = ?auto_19526 ?auto_19540 ) ) ( not ( = ?auto_19527 ?auto_19540 ) ) ( not ( = ?auto_19541 ?auto_19540 ) ) ( IS-CRATE ?auto_19526 ) ( not ( = ?auto_19544 ?auto_19534 ) ) ( not ( = ?auto_19533 ?auto_19544 ) ) ( HOIST-AT ?auto_19532 ?auto_19544 ) ( not ( = ?auto_19531 ?auto_19532 ) ) ( not ( = ?auto_19542 ?auto_19532 ) ) ( SURFACE-AT ?auto_19526 ?auto_19544 ) ( ON ?auto_19526 ?auto_19537 ) ( CLEAR ?auto_19526 ) ( not ( = ?auto_19526 ?auto_19537 ) ) ( not ( = ?auto_19527 ?auto_19537 ) ) ( not ( = ?auto_19541 ?auto_19537 ) ) ( not ( = ?auto_19540 ?auto_19537 ) ) ( IS-CRATE ?auto_19541 ) ( not ( = ?auto_19529 ?auto_19541 ) ) ( not ( = ?auto_19526 ?auto_19529 ) ) ( not ( = ?auto_19527 ?auto_19529 ) ) ( not ( = ?auto_19540 ?auto_19529 ) ) ( not ( = ?auto_19537 ?auto_19529 ) ) ( AVAILABLE ?auto_19532 ) ( SURFACE-AT ?auto_19541 ?auto_19544 ) ( ON ?auto_19541 ?auto_19545 ) ( CLEAR ?auto_19541 ) ( not ( = ?auto_19526 ?auto_19545 ) ) ( not ( = ?auto_19527 ?auto_19545 ) ) ( not ( = ?auto_19541 ?auto_19545 ) ) ( not ( = ?auto_19540 ?auto_19545 ) ) ( not ( = ?auto_19537 ?auto_19545 ) ) ( not ( = ?auto_19529 ?auto_19545 ) ) ( IS-CRATE ?auto_19529 ) ( not ( = ?auto_19535 ?auto_19529 ) ) ( not ( = ?auto_19526 ?auto_19535 ) ) ( not ( = ?auto_19527 ?auto_19535 ) ) ( not ( = ?auto_19541 ?auto_19535 ) ) ( not ( = ?auto_19540 ?auto_19535 ) ) ( not ( = ?auto_19537 ?auto_19535 ) ) ( not ( = ?auto_19545 ?auto_19535 ) ) ( not ( = ?auto_19538 ?auto_19534 ) ) ( not ( = ?auto_19533 ?auto_19538 ) ) ( not ( = ?auto_19544 ?auto_19538 ) ) ( HOIST-AT ?auto_19530 ?auto_19538 ) ( not ( = ?auto_19531 ?auto_19530 ) ) ( not ( = ?auto_19542 ?auto_19530 ) ) ( not ( = ?auto_19532 ?auto_19530 ) ) ( AVAILABLE ?auto_19530 ) ( SURFACE-AT ?auto_19529 ?auto_19538 ) ( ON ?auto_19529 ?auto_19546 ) ( CLEAR ?auto_19529 ) ( not ( = ?auto_19526 ?auto_19546 ) ) ( not ( = ?auto_19527 ?auto_19546 ) ) ( not ( = ?auto_19541 ?auto_19546 ) ) ( not ( = ?auto_19540 ?auto_19546 ) ) ( not ( = ?auto_19537 ?auto_19546 ) ) ( not ( = ?auto_19529 ?auto_19546 ) ) ( not ( = ?auto_19545 ?auto_19546 ) ) ( not ( = ?auto_19535 ?auto_19546 ) ) ( SURFACE-AT ?auto_19536 ?auto_19534 ) ( CLEAR ?auto_19536 ) ( IS-CRATE ?auto_19535 ) ( not ( = ?auto_19536 ?auto_19535 ) ) ( not ( = ?auto_19526 ?auto_19536 ) ) ( not ( = ?auto_19527 ?auto_19536 ) ) ( not ( = ?auto_19541 ?auto_19536 ) ) ( not ( = ?auto_19540 ?auto_19536 ) ) ( not ( = ?auto_19537 ?auto_19536 ) ) ( not ( = ?auto_19529 ?auto_19536 ) ) ( not ( = ?auto_19545 ?auto_19536 ) ) ( not ( = ?auto_19546 ?auto_19536 ) ) ( AVAILABLE ?auto_19531 ) ( TRUCK-AT ?auto_19543 ?auto_19539 ) ( not ( = ?auto_19539 ?auto_19534 ) ) ( not ( = ?auto_19533 ?auto_19539 ) ) ( not ( = ?auto_19544 ?auto_19539 ) ) ( not ( = ?auto_19538 ?auto_19539 ) ) ( HOIST-AT ?auto_19528 ?auto_19539 ) ( not ( = ?auto_19531 ?auto_19528 ) ) ( not ( = ?auto_19542 ?auto_19528 ) ) ( not ( = ?auto_19532 ?auto_19528 ) ) ( not ( = ?auto_19530 ?auto_19528 ) ) ( AVAILABLE ?auto_19528 ) ( SURFACE-AT ?auto_19535 ?auto_19539 ) ( ON ?auto_19535 ?auto_19547 ) ( CLEAR ?auto_19535 ) ( not ( = ?auto_19526 ?auto_19547 ) ) ( not ( = ?auto_19527 ?auto_19547 ) ) ( not ( = ?auto_19541 ?auto_19547 ) ) ( not ( = ?auto_19540 ?auto_19547 ) ) ( not ( = ?auto_19537 ?auto_19547 ) ) ( not ( = ?auto_19529 ?auto_19547 ) ) ( not ( = ?auto_19545 ?auto_19547 ) ) ( not ( = ?auto_19535 ?auto_19547 ) ) ( not ( = ?auto_19546 ?auto_19547 ) ) ( not ( = ?auto_19536 ?auto_19547 ) ) )
    :subtasks
    ( ( !LIFT ?auto_19528 ?auto_19535 ?auto_19547 ?auto_19539 )
      ( MAKE-2CRATE ?auto_19541 ?auto_19526 ?auto_19527 )
      ( MAKE-1CRATE-VERIFY ?auto_19526 ?auto_19527 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19548 - SURFACE
      ?auto_19549 - SURFACE
      ?auto_19550 - SURFACE
    )
    :vars
    (
      ?auto_19567 - HOIST
      ?auto_19553 - PLACE
      ?auto_19566 - PLACE
      ?auto_19563 - HOIST
      ?auto_19554 - SURFACE
      ?auto_19555 - PLACE
      ?auto_19559 - HOIST
      ?auto_19561 - SURFACE
      ?auto_19551 - SURFACE
      ?auto_19556 - SURFACE
      ?auto_19557 - SURFACE
      ?auto_19565 - PLACE
      ?auto_19562 - HOIST
      ?auto_19564 - SURFACE
      ?auto_19552 - SURFACE
      ?auto_19568 - TRUCK
      ?auto_19558 - PLACE
      ?auto_19569 - HOIST
      ?auto_19560 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19567 ?auto_19553 ) ( IS-CRATE ?auto_19550 ) ( not ( = ?auto_19549 ?auto_19550 ) ) ( not ( = ?auto_19548 ?auto_19549 ) ) ( not ( = ?auto_19548 ?auto_19550 ) ) ( not ( = ?auto_19566 ?auto_19553 ) ) ( HOIST-AT ?auto_19563 ?auto_19566 ) ( not ( = ?auto_19567 ?auto_19563 ) ) ( AVAILABLE ?auto_19563 ) ( SURFACE-AT ?auto_19550 ?auto_19566 ) ( ON ?auto_19550 ?auto_19554 ) ( CLEAR ?auto_19550 ) ( not ( = ?auto_19549 ?auto_19554 ) ) ( not ( = ?auto_19550 ?auto_19554 ) ) ( not ( = ?auto_19548 ?auto_19554 ) ) ( IS-CRATE ?auto_19549 ) ( not ( = ?auto_19555 ?auto_19553 ) ) ( not ( = ?auto_19566 ?auto_19555 ) ) ( HOIST-AT ?auto_19559 ?auto_19555 ) ( not ( = ?auto_19567 ?auto_19559 ) ) ( not ( = ?auto_19563 ?auto_19559 ) ) ( SURFACE-AT ?auto_19549 ?auto_19555 ) ( ON ?auto_19549 ?auto_19561 ) ( CLEAR ?auto_19549 ) ( not ( = ?auto_19549 ?auto_19561 ) ) ( not ( = ?auto_19550 ?auto_19561 ) ) ( not ( = ?auto_19548 ?auto_19561 ) ) ( not ( = ?auto_19554 ?auto_19561 ) ) ( IS-CRATE ?auto_19548 ) ( not ( = ?auto_19551 ?auto_19548 ) ) ( not ( = ?auto_19549 ?auto_19551 ) ) ( not ( = ?auto_19550 ?auto_19551 ) ) ( not ( = ?auto_19554 ?auto_19551 ) ) ( not ( = ?auto_19561 ?auto_19551 ) ) ( AVAILABLE ?auto_19559 ) ( SURFACE-AT ?auto_19548 ?auto_19555 ) ( ON ?auto_19548 ?auto_19556 ) ( CLEAR ?auto_19548 ) ( not ( = ?auto_19549 ?auto_19556 ) ) ( not ( = ?auto_19550 ?auto_19556 ) ) ( not ( = ?auto_19548 ?auto_19556 ) ) ( not ( = ?auto_19554 ?auto_19556 ) ) ( not ( = ?auto_19561 ?auto_19556 ) ) ( not ( = ?auto_19551 ?auto_19556 ) ) ( IS-CRATE ?auto_19551 ) ( not ( = ?auto_19557 ?auto_19551 ) ) ( not ( = ?auto_19549 ?auto_19557 ) ) ( not ( = ?auto_19550 ?auto_19557 ) ) ( not ( = ?auto_19548 ?auto_19557 ) ) ( not ( = ?auto_19554 ?auto_19557 ) ) ( not ( = ?auto_19561 ?auto_19557 ) ) ( not ( = ?auto_19556 ?auto_19557 ) ) ( not ( = ?auto_19565 ?auto_19553 ) ) ( not ( = ?auto_19566 ?auto_19565 ) ) ( not ( = ?auto_19555 ?auto_19565 ) ) ( HOIST-AT ?auto_19562 ?auto_19565 ) ( not ( = ?auto_19567 ?auto_19562 ) ) ( not ( = ?auto_19563 ?auto_19562 ) ) ( not ( = ?auto_19559 ?auto_19562 ) ) ( AVAILABLE ?auto_19562 ) ( SURFACE-AT ?auto_19551 ?auto_19565 ) ( ON ?auto_19551 ?auto_19564 ) ( CLEAR ?auto_19551 ) ( not ( = ?auto_19549 ?auto_19564 ) ) ( not ( = ?auto_19550 ?auto_19564 ) ) ( not ( = ?auto_19548 ?auto_19564 ) ) ( not ( = ?auto_19554 ?auto_19564 ) ) ( not ( = ?auto_19561 ?auto_19564 ) ) ( not ( = ?auto_19551 ?auto_19564 ) ) ( not ( = ?auto_19556 ?auto_19564 ) ) ( not ( = ?auto_19557 ?auto_19564 ) ) ( SURFACE-AT ?auto_19552 ?auto_19553 ) ( CLEAR ?auto_19552 ) ( IS-CRATE ?auto_19557 ) ( not ( = ?auto_19552 ?auto_19557 ) ) ( not ( = ?auto_19549 ?auto_19552 ) ) ( not ( = ?auto_19550 ?auto_19552 ) ) ( not ( = ?auto_19548 ?auto_19552 ) ) ( not ( = ?auto_19554 ?auto_19552 ) ) ( not ( = ?auto_19561 ?auto_19552 ) ) ( not ( = ?auto_19551 ?auto_19552 ) ) ( not ( = ?auto_19556 ?auto_19552 ) ) ( not ( = ?auto_19564 ?auto_19552 ) ) ( AVAILABLE ?auto_19567 ) ( TRUCK-AT ?auto_19568 ?auto_19558 ) ( not ( = ?auto_19558 ?auto_19553 ) ) ( not ( = ?auto_19566 ?auto_19558 ) ) ( not ( = ?auto_19555 ?auto_19558 ) ) ( not ( = ?auto_19565 ?auto_19558 ) ) ( HOIST-AT ?auto_19569 ?auto_19558 ) ( not ( = ?auto_19567 ?auto_19569 ) ) ( not ( = ?auto_19563 ?auto_19569 ) ) ( not ( = ?auto_19559 ?auto_19569 ) ) ( not ( = ?auto_19562 ?auto_19569 ) ) ( AVAILABLE ?auto_19569 ) ( SURFACE-AT ?auto_19557 ?auto_19558 ) ( ON ?auto_19557 ?auto_19560 ) ( CLEAR ?auto_19557 ) ( not ( = ?auto_19549 ?auto_19560 ) ) ( not ( = ?auto_19550 ?auto_19560 ) ) ( not ( = ?auto_19548 ?auto_19560 ) ) ( not ( = ?auto_19554 ?auto_19560 ) ) ( not ( = ?auto_19561 ?auto_19560 ) ) ( not ( = ?auto_19551 ?auto_19560 ) ) ( not ( = ?auto_19556 ?auto_19560 ) ) ( not ( = ?auto_19557 ?auto_19560 ) ) ( not ( = ?auto_19564 ?auto_19560 ) ) ( not ( = ?auto_19552 ?auto_19560 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19549 ?auto_19550 )
      ( MAKE-2CRATE-VERIFY ?auto_19548 ?auto_19549 ?auto_19550 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19570 - SURFACE
      ?auto_19571 - SURFACE
      ?auto_19572 - SURFACE
      ?auto_19573 - SURFACE
    )
    :vars
    (
      ?auto_19576 - HOIST
      ?auto_19583 - PLACE
      ?auto_19574 - PLACE
      ?auto_19587 - HOIST
      ?auto_19591 - SURFACE
      ?auto_19584 - PLACE
      ?auto_19588 - HOIST
      ?auto_19579 - SURFACE
      ?auto_19575 - SURFACE
      ?auto_19589 - SURFACE
      ?auto_19581 - PLACE
      ?auto_19578 - HOIST
      ?auto_19577 - SURFACE
      ?auto_19580 - SURFACE
      ?auto_19586 - TRUCK
      ?auto_19582 - PLACE
      ?auto_19585 - HOIST
      ?auto_19590 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19576 ?auto_19583 ) ( IS-CRATE ?auto_19573 ) ( not ( = ?auto_19572 ?auto_19573 ) ) ( not ( = ?auto_19571 ?auto_19572 ) ) ( not ( = ?auto_19571 ?auto_19573 ) ) ( not ( = ?auto_19574 ?auto_19583 ) ) ( HOIST-AT ?auto_19587 ?auto_19574 ) ( not ( = ?auto_19576 ?auto_19587 ) ) ( AVAILABLE ?auto_19587 ) ( SURFACE-AT ?auto_19573 ?auto_19574 ) ( ON ?auto_19573 ?auto_19591 ) ( CLEAR ?auto_19573 ) ( not ( = ?auto_19572 ?auto_19591 ) ) ( not ( = ?auto_19573 ?auto_19591 ) ) ( not ( = ?auto_19571 ?auto_19591 ) ) ( IS-CRATE ?auto_19572 ) ( not ( = ?auto_19584 ?auto_19583 ) ) ( not ( = ?auto_19574 ?auto_19584 ) ) ( HOIST-AT ?auto_19588 ?auto_19584 ) ( not ( = ?auto_19576 ?auto_19588 ) ) ( not ( = ?auto_19587 ?auto_19588 ) ) ( SURFACE-AT ?auto_19572 ?auto_19584 ) ( ON ?auto_19572 ?auto_19579 ) ( CLEAR ?auto_19572 ) ( not ( = ?auto_19572 ?auto_19579 ) ) ( not ( = ?auto_19573 ?auto_19579 ) ) ( not ( = ?auto_19571 ?auto_19579 ) ) ( not ( = ?auto_19591 ?auto_19579 ) ) ( IS-CRATE ?auto_19571 ) ( not ( = ?auto_19570 ?auto_19571 ) ) ( not ( = ?auto_19572 ?auto_19570 ) ) ( not ( = ?auto_19573 ?auto_19570 ) ) ( not ( = ?auto_19591 ?auto_19570 ) ) ( not ( = ?auto_19579 ?auto_19570 ) ) ( AVAILABLE ?auto_19588 ) ( SURFACE-AT ?auto_19571 ?auto_19584 ) ( ON ?auto_19571 ?auto_19575 ) ( CLEAR ?auto_19571 ) ( not ( = ?auto_19572 ?auto_19575 ) ) ( not ( = ?auto_19573 ?auto_19575 ) ) ( not ( = ?auto_19571 ?auto_19575 ) ) ( not ( = ?auto_19591 ?auto_19575 ) ) ( not ( = ?auto_19579 ?auto_19575 ) ) ( not ( = ?auto_19570 ?auto_19575 ) ) ( IS-CRATE ?auto_19570 ) ( not ( = ?auto_19589 ?auto_19570 ) ) ( not ( = ?auto_19572 ?auto_19589 ) ) ( not ( = ?auto_19573 ?auto_19589 ) ) ( not ( = ?auto_19571 ?auto_19589 ) ) ( not ( = ?auto_19591 ?auto_19589 ) ) ( not ( = ?auto_19579 ?auto_19589 ) ) ( not ( = ?auto_19575 ?auto_19589 ) ) ( not ( = ?auto_19581 ?auto_19583 ) ) ( not ( = ?auto_19574 ?auto_19581 ) ) ( not ( = ?auto_19584 ?auto_19581 ) ) ( HOIST-AT ?auto_19578 ?auto_19581 ) ( not ( = ?auto_19576 ?auto_19578 ) ) ( not ( = ?auto_19587 ?auto_19578 ) ) ( not ( = ?auto_19588 ?auto_19578 ) ) ( AVAILABLE ?auto_19578 ) ( SURFACE-AT ?auto_19570 ?auto_19581 ) ( ON ?auto_19570 ?auto_19577 ) ( CLEAR ?auto_19570 ) ( not ( = ?auto_19572 ?auto_19577 ) ) ( not ( = ?auto_19573 ?auto_19577 ) ) ( not ( = ?auto_19571 ?auto_19577 ) ) ( not ( = ?auto_19591 ?auto_19577 ) ) ( not ( = ?auto_19579 ?auto_19577 ) ) ( not ( = ?auto_19570 ?auto_19577 ) ) ( not ( = ?auto_19575 ?auto_19577 ) ) ( not ( = ?auto_19589 ?auto_19577 ) ) ( SURFACE-AT ?auto_19580 ?auto_19583 ) ( CLEAR ?auto_19580 ) ( IS-CRATE ?auto_19589 ) ( not ( = ?auto_19580 ?auto_19589 ) ) ( not ( = ?auto_19572 ?auto_19580 ) ) ( not ( = ?auto_19573 ?auto_19580 ) ) ( not ( = ?auto_19571 ?auto_19580 ) ) ( not ( = ?auto_19591 ?auto_19580 ) ) ( not ( = ?auto_19579 ?auto_19580 ) ) ( not ( = ?auto_19570 ?auto_19580 ) ) ( not ( = ?auto_19575 ?auto_19580 ) ) ( not ( = ?auto_19577 ?auto_19580 ) ) ( AVAILABLE ?auto_19576 ) ( TRUCK-AT ?auto_19586 ?auto_19582 ) ( not ( = ?auto_19582 ?auto_19583 ) ) ( not ( = ?auto_19574 ?auto_19582 ) ) ( not ( = ?auto_19584 ?auto_19582 ) ) ( not ( = ?auto_19581 ?auto_19582 ) ) ( HOIST-AT ?auto_19585 ?auto_19582 ) ( not ( = ?auto_19576 ?auto_19585 ) ) ( not ( = ?auto_19587 ?auto_19585 ) ) ( not ( = ?auto_19588 ?auto_19585 ) ) ( not ( = ?auto_19578 ?auto_19585 ) ) ( AVAILABLE ?auto_19585 ) ( SURFACE-AT ?auto_19589 ?auto_19582 ) ( ON ?auto_19589 ?auto_19590 ) ( CLEAR ?auto_19589 ) ( not ( = ?auto_19572 ?auto_19590 ) ) ( not ( = ?auto_19573 ?auto_19590 ) ) ( not ( = ?auto_19571 ?auto_19590 ) ) ( not ( = ?auto_19591 ?auto_19590 ) ) ( not ( = ?auto_19579 ?auto_19590 ) ) ( not ( = ?auto_19570 ?auto_19590 ) ) ( not ( = ?auto_19575 ?auto_19590 ) ) ( not ( = ?auto_19589 ?auto_19590 ) ) ( not ( = ?auto_19577 ?auto_19590 ) ) ( not ( = ?auto_19580 ?auto_19590 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19571 ?auto_19572 ?auto_19573 )
      ( MAKE-3CRATE-VERIFY ?auto_19570 ?auto_19571 ?auto_19572 ?auto_19573 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19592 - SURFACE
      ?auto_19593 - SURFACE
      ?auto_19594 - SURFACE
      ?auto_19595 - SURFACE
      ?auto_19596 - SURFACE
    )
    :vars
    (
      ?auto_19599 - HOIST
      ?auto_19606 - PLACE
      ?auto_19597 - PLACE
      ?auto_19610 - HOIST
      ?auto_19613 - SURFACE
      ?auto_19607 - PLACE
      ?auto_19611 - HOIST
      ?auto_19602 - SURFACE
      ?auto_19598 - SURFACE
      ?auto_19604 - PLACE
      ?auto_19601 - HOIST
      ?auto_19600 - SURFACE
      ?auto_19603 - SURFACE
      ?auto_19609 - TRUCK
      ?auto_19605 - PLACE
      ?auto_19608 - HOIST
      ?auto_19612 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19599 ?auto_19606 ) ( IS-CRATE ?auto_19596 ) ( not ( = ?auto_19595 ?auto_19596 ) ) ( not ( = ?auto_19594 ?auto_19595 ) ) ( not ( = ?auto_19594 ?auto_19596 ) ) ( not ( = ?auto_19597 ?auto_19606 ) ) ( HOIST-AT ?auto_19610 ?auto_19597 ) ( not ( = ?auto_19599 ?auto_19610 ) ) ( AVAILABLE ?auto_19610 ) ( SURFACE-AT ?auto_19596 ?auto_19597 ) ( ON ?auto_19596 ?auto_19613 ) ( CLEAR ?auto_19596 ) ( not ( = ?auto_19595 ?auto_19613 ) ) ( not ( = ?auto_19596 ?auto_19613 ) ) ( not ( = ?auto_19594 ?auto_19613 ) ) ( IS-CRATE ?auto_19595 ) ( not ( = ?auto_19607 ?auto_19606 ) ) ( not ( = ?auto_19597 ?auto_19607 ) ) ( HOIST-AT ?auto_19611 ?auto_19607 ) ( not ( = ?auto_19599 ?auto_19611 ) ) ( not ( = ?auto_19610 ?auto_19611 ) ) ( SURFACE-AT ?auto_19595 ?auto_19607 ) ( ON ?auto_19595 ?auto_19602 ) ( CLEAR ?auto_19595 ) ( not ( = ?auto_19595 ?auto_19602 ) ) ( not ( = ?auto_19596 ?auto_19602 ) ) ( not ( = ?auto_19594 ?auto_19602 ) ) ( not ( = ?auto_19613 ?auto_19602 ) ) ( IS-CRATE ?auto_19594 ) ( not ( = ?auto_19593 ?auto_19594 ) ) ( not ( = ?auto_19595 ?auto_19593 ) ) ( not ( = ?auto_19596 ?auto_19593 ) ) ( not ( = ?auto_19613 ?auto_19593 ) ) ( not ( = ?auto_19602 ?auto_19593 ) ) ( AVAILABLE ?auto_19611 ) ( SURFACE-AT ?auto_19594 ?auto_19607 ) ( ON ?auto_19594 ?auto_19598 ) ( CLEAR ?auto_19594 ) ( not ( = ?auto_19595 ?auto_19598 ) ) ( not ( = ?auto_19596 ?auto_19598 ) ) ( not ( = ?auto_19594 ?auto_19598 ) ) ( not ( = ?auto_19613 ?auto_19598 ) ) ( not ( = ?auto_19602 ?auto_19598 ) ) ( not ( = ?auto_19593 ?auto_19598 ) ) ( IS-CRATE ?auto_19593 ) ( not ( = ?auto_19592 ?auto_19593 ) ) ( not ( = ?auto_19595 ?auto_19592 ) ) ( not ( = ?auto_19596 ?auto_19592 ) ) ( not ( = ?auto_19594 ?auto_19592 ) ) ( not ( = ?auto_19613 ?auto_19592 ) ) ( not ( = ?auto_19602 ?auto_19592 ) ) ( not ( = ?auto_19598 ?auto_19592 ) ) ( not ( = ?auto_19604 ?auto_19606 ) ) ( not ( = ?auto_19597 ?auto_19604 ) ) ( not ( = ?auto_19607 ?auto_19604 ) ) ( HOIST-AT ?auto_19601 ?auto_19604 ) ( not ( = ?auto_19599 ?auto_19601 ) ) ( not ( = ?auto_19610 ?auto_19601 ) ) ( not ( = ?auto_19611 ?auto_19601 ) ) ( AVAILABLE ?auto_19601 ) ( SURFACE-AT ?auto_19593 ?auto_19604 ) ( ON ?auto_19593 ?auto_19600 ) ( CLEAR ?auto_19593 ) ( not ( = ?auto_19595 ?auto_19600 ) ) ( not ( = ?auto_19596 ?auto_19600 ) ) ( not ( = ?auto_19594 ?auto_19600 ) ) ( not ( = ?auto_19613 ?auto_19600 ) ) ( not ( = ?auto_19602 ?auto_19600 ) ) ( not ( = ?auto_19593 ?auto_19600 ) ) ( not ( = ?auto_19598 ?auto_19600 ) ) ( not ( = ?auto_19592 ?auto_19600 ) ) ( SURFACE-AT ?auto_19603 ?auto_19606 ) ( CLEAR ?auto_19603 ) ( IS-CRATE ?auto_19592 ) ( not ( = ?auto_19603 ?auto_19592 ) ) ( not ( = ?auto_19595 ?auto_19603 ) ) ( not ( = ?auto_19596 ?auto_19603 ) ) ( not ( = ?auto_19594 ?auto_19603 ) ) ( not ( = ?auto_19613 ?auto_19603 ) ) ( not ( = ?auto_19602 ?auto_19603 ) ) ( not ( = ?auto_19593 ?auto_19603 ) ) ( not ( = ?auto_19598 ?auto_19603 ) ) ( not ( = ?auto_19600 ?auto_19603 ) ) ( AVAILABLE ?auto_19599 ) ( TRUCK-AT ?auto_19609 ?auto_19605 ) ( not ( = ?auto_19605 ?auto_19606 ) ) ( not ( = ?auto_19597 ?auto_19605 ) ) ( not ( = ?auto_19607 ?auto_19605 ) ) ( not ( = ?auto_19604 ?auto_19605 ) ) ( HOIST-AT ?auto_19608 ?auto_19605 ) ( not ( = ?auto_19599 ?auto_19608 ) ) ( not ( = ?auto_19610 ?auto_19608 ) ) ( not ( = ?auto_19611 ?auto_19608 ) ) ( not ( = ?auto_19601 ?auto_19608 ) ) ( AVAILABLE ?auto_19608 ) ( SURFACE-AT ?auto_19592 ?auto_19605 ) ( ON ?auto_19592 ?auto_19612 ) ( CLEAR ?auto_19592 ) ( not ( = ?auto_19595 ?auto_19612 ) ) ( not ( = ?auto_19596 ?auto_19612 ) ) ( not ( = ?auto_19594 ?auto_19612 ) ) ( not ( = ?auto_19613 ?auto_19612 ) ) ( not ( = ?auto_19602 ?auto_19612 ) ) ( not ( = ?auto_19593 ?auto_19612 ) ) ( not ( = ?auto_19598 ?auto_19612 ) ) ( not ( = ?auto_19592 ?auto_19612 ) ) ( not ( = ?auto_19600 ?auto_19612 ) ) ( not ( = ?auto_19603 ?auto_19612 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19594 ?auto_19595 ?auto_19596 )
      ( MAKE-4CRATE-VERIFY ?auto_19592 ?auto_19593 ?auto_19594 ?auto_19595 ?auto_19596 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19614 - SURFACE
      ?auto_19615 - SURFACE
      ?auto_19616 - SURFACE
      ?auto_19617 - SURFACE
      ?auto_19618 - SURFACE
      ?auto_19619 - SURFACE
    )
    :vars
    (
      ?auto_19622 - HOIST
      ?auto_19628 - PLACE
      ?auto_19620 - PLACE
      ?auto_19632 - HOIST
      ?auto_19635 - SURFACE
      ?auto_19629 - PLACE
      ?auto_19633 - HOIST
      ?auto_19625 - SURFACE
      ?auto_19621 - SURFACE
      ?auto_19626 - PLACE
      ?auto_19624 - HOIST
      ?auto_19623 - SURFACE
      ?auto_19631 - TRUCK
      ?auto_19627 - PLACE
      ?auto_19630 - HOIST
      ?auto_19634 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19622 ?auto_19628 ) ( IS-CRATE ?auto_19619 ) ( not ( = ?auto_19618 ?auto_19619 ) ) ( not ( = ?auto_19617 ?auto_19618 ) ) ( not ( = ?auto_19617 ?auto_19619 ) ) ( not ( = ?auto_19620 ?auto_19628 ) ) ( HOIST-AT ?auto_19632 ?auto_19620 ) ( not ( = ?auto_19622 ?auto_19632 ) ) ( AVAILABLE ?auto_19632 ) ( SURFACE-AT ?auto_19619 ?auto_19620 ) ( ON ?auto_19619 ?auto_19635 ) ( CLEAR ?auto_19619 ) ( not ( = ?auto_19618 ?auto_19635 ) ) ( not ( = ?auto_19619 ?auto_19635 ) ) ( not ( = ?auto_19617 ?auto_19635 ) ) ( IS-CRATE ?auto_19618 ) ( not ( = ?auto_19629 ?auto_19628 ) ) ( not ( = ?auto_19620 ?auto_19629 ) ) ( HOIST-AT ?auto_19633 ?auto_19629 ) ( not ( = ?auto_19622 ?auto_19633 ) ) ( not ( = ?auto_19632 ?auto_19633 ) ) ( SURFACE-AT ?auto_19618 ?auto_19629 ) ( ON ?auto_19618 ?auto_19625 ) ( CLEAR ?auto_19618 ) ( not ( = ?auto_19618 ?auto_19625 ) ) ( not ( = ?auto_19619 ?auto_19625 ) ) ( not ( = ?auto_19617 ?auto_19625 ) ) ( not ( = ?auto_19635 ?auto_19625 ) ) ( IS-CRATE ?auto_19617 ) ( not ( = ?auto_19616 ?auto_19617 ) ) ( not ( = ?auto_19618 ?auto_19616 ) ) ( not ( = ?auto_19619 ?auto_19616 ) ) ( not ( = ?auto_19635 ?auto_19616 ) ) ( not ( = ?auto_19625 ?auto_19616 ) ) ( AVAILABLE ?auto_19633 ) ( SURFACE-AT ?auto_19617 ?auto_19629 ) ( ON ?auto_19617 ?auto_19621 ) ( CLEAR ?auto_19617 ) ( not ( = ?auto_19618 ?auto_19621 ) ) ( not ( = ?auto_19619 ?auto_19621 ) ) ( not ( = ?auto_19617 ?auto_19621 ) ) ( not ( = ?auto_19635 ?auto_19621 ) ) ( not ( = ?auto_19625 ?auto_19621 ) ) ( not ( = ?auto_19616 ?auto_19621 ) ) ( IS-CRATE ?auto_19616 ) ( not ( = ?auto_19615 ?auto_19616 ) ) ( not ( = ?auto_19618 ?auto_19615 ) ) ( not ( = ?auto_19619 ?auto_19615 ) ) ( not ( = ?auto_19617 ?auto_19615 ) ) ( not ( = ?auto_19635 ?auto_19615 ) ) ( not ( = ?auto_19625 ?auto_19615 ) ) ( not ( = ?auto_19621 ?auto_19615 ) ) ( not ( = ?auto_19626 ?auto_19628 ) ) ( not ( = ?auto_19620 ?auto_19626 ) ) ( not ( = ?auto_19629 ?auto_19626 ) ) ( HOIST-AT ?auto_19624 ?auto_19626 ) ( not ( = ?auto_19622 ?auto_19624 ) ) ( not ( = ?auto_19632 ?auto_19624 ) ) ( not ( = ?auto_19633 ?auto_19624 ) ) ( AVAILABLE ?auto_19624 ) ( SURFACE-AT ?auto_19616 ?auto_19626 ) ( ON ?auto_19616 ?auto_19623 ) ( CLEAR ?auto_19616 ) ( not ( = ?auto_19618 ?auto_19623 ) ) ( not ( = ?auto_19619 ?auto_19623 ) ) ( not ( = ?auto_19617 ?auto_19623 ) ) ( not ( = ?auto_19635 ?auto_19623 ) ) ( not ( = ?auto_19625 ?auto_19623 ) ) ( not ( = ?auto_19616 ?auto_19623 ) ) ( not ( = ?auto_19621 ?auto_19623 ) ) ( not ( = ?auto_19615 ?auto_19623 ) ) ( SURFACE-AT ?auto_19614 ?auto_19628 ) ( CLEAR ?auto_19614 ) ( IS-CRATE ?auto_19615 ) ( not ( = ?auto_19614 ?auto_19615 ) ) ( not ( = ?auto_19618 ?auto_19614 ) ) ( not ( = ?auto_19619 ?auto_19614 ) ) ( not ( = ?auto_19617 ?auto_19614 ) ) ( not ( = ?auto_19635 ?auto_19614 ) ) ( not ( = ?auto_19625 ?auto_19614 ) ) ( not ( = ?auto_19616 ?auto_19614 ) ) ( not ( = ?auto_19621 ?auto_19614 ) ) ( not ( = ?auto_19623 ?auto_19614 ) ) ( AVAILABLE ?auto_19622 ) ( TRUCK-AT ?auto_19631 ?auto_19627 ) ( not ( = ?auto_19627 ?auto_19628 ) ) ( not ( = ?auto_19620 ?auto_19627 ) ) ( not ( = ?auto_19629 ?auto_19627 ) ) ( not ( = ?auto_19626 ?auto_19627 ) ) ( HOIST-AT ?auto_19630 ?auto_19627 ) ( not ( = ?auto_19622 ?auto_19630 ) ) ( not ( = ?auto_19632 ?auto_19630 ) ) ( not ( = ?auto_19633 ?auto_19630 ) ) ( not ( = ?auto_19624 ?auto_19630 ) ) ( AVAILABLE ?auto_19630 ) ( SURFACE-AT ?auto_19615 ?auto_19627 ) ( ON ?auto_19615 ?auto_19634 ) ( CLEAR ?auto_19615 ) ( not ( = ?auto_19618 ?auto_19634 ) ) ( not ( = ?auto_19619 ?auto_19634 ) ) ( not ( = ?auto_19617 ?auto_19634 ) ) ( not ( = ?auto_19635 ?auto_19634 ) ) ( not ( = ?auto_19625 ?auto_19634 ) ) ( not ( = ?auto_19616 ?auto_19634 ) ) ( not ( = ?auto_19621 ?auto_19634 ) ) ( not ( = ?auto_19615 ?auto_19634 ) ) ( not ( = ?auto_19623 ?auto_19634 ) ) ( not ( = ?auto_19614 ?auto_19634 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19617 ?auto_19618 ?auto_19619 )
      ( MAKE-5CRATE-VERIFY ?auto_19614 ?auto_19615 ?auto_19616 ?auto_19617 ?auto_19618 ?auto_19619 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19636 - SURFACE
      ?auto_19637 - SURFACE
    )
    :vars
    (
      ?auto_19641 - HOIST
      ?auto_19649 - PLACE
      ?auto_19646 - SURFACE
      ?auto_19638 - PLACE
      ?auto_19653 - HOIST
      ?auto_19657 - SURFACE
      ?auto_19650 - PLACE
      ?auto_19654 - HOIST
      ?auto_19644 - SURFACE
      ?auto_19639 - SURFACE
      ?auto_19640 - SURFACE
      ?auto_19655 - SURFACE
      ?auto_19647 - PLACE
      ?auto_19643 - HOIST
      ?auto_19642 - SURFACE
      ?auto_19645 - SURFACE
      ?auto_19648 - PLACE
      ?auto_19651 - HOIST
      ?auto_19656 - SURFACE
      ?auto_19652 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19641 ?auto_19649 ) ( IS-CRATE ?auto_19637 ) ( not ( = ?auto_19636 ?auto_19637 ) ) ( not ( = ?auto_19646 ?auto_19636 ) ) ( not ( = ?auto_19646 ?auto_19637 ) ) ( not ( = ?auto_19638 ?auto_19649 ) ) ( HOIST-AT ?auto_19653 ?auto_19638 ) ( not ( = ?auto_19641 ?auto_19653 ) ) ( AVAILABLE ?auto_19653 ) ( SURFACE-AT ?auto_19637 ?auto_19638 ) ( ON ?auto_19637 ?auto_19657 ) ( CLEAR ?auto_19637 ) ( not ( = ?auto_19636 ?auto_19657 ) ) ( not ( = ?auto_19637 ?auto_19657 ) ) ( not ( = ?auto_19646 ?auto_19657 ) ) ( IS-CRATE ?auto_19636 ) ( not ( = ?auto_19650 ?auto_19649 ) ) ( not ( = ?auto_19638 ?auto_19650 ) ) ( HOIST-AT ?auto_19654 ?auto_19650 ) ( not ( = ?auto_19641 ?auto_19654 ) ) ( not ( = ?auto_19653 ?auto_19654 ) ) ( SURFACE-AT ?auto_19636 ?auto_19650 ) ( ON ?auto_19636 ?auto_19644 ) ( CLEAR ?auto_19636 ) ( not ( = ?auto_19636 ?auto_19644 ) ) ( not ( = ?auto_19637 ?auto_19644 ) ) ( not ( = ?auto_19646 ?auto_19644 ) ) ( not ( = ?auto_19657 ?auto_19644 ) ) ( IS-CRATE ?auto_19646 ) ( not ( = ?auto_19639 ?auto_19646 ) ) ( not ( = ?auto_19636 ?auto_19639 ) ) ( not ( = ?auto_19637 ?auto_19639 ) ) ( not ( = ?auto_19657 ?auto_19639 ) ) ( not ( = ?auto_19644 ?auto_19639 ) ) ( AVAILABLE ?auto_19654 ) ( SURFACE-AT ?auto_19646 ?auto_19650 ) ( ON ?auto_19646 ?auto_19640 ) ( CLEAR ?auto_19646 ) ( not ( = ?auto_19636 ?auto_19640 ) ) ( not ( = ?auto_19637 ?auto_19640 ) ) ( not ( = ?auto_19646 ?auto_19640 ) ) ( not ( = ?auto_19657 ?auto_19640 ) ) ( not ( = ?auto_19644 ?auto_19640 ) ) ( not ( = ?auto_19639 ?auto_19640 ) ) ( IS-CRATE ?auto_19639 ) ( not ( = ?auto_19655 ?auto_19639 ) ) ( not ( = ?auto_19636 ?auto_19655 ) ) ( not ( = ?auto_19637 ?auto_19655 ) ) ( not ( = ?auto_19646 ?auto_19655 ) ) ( not ( = ?auto_19657 ?auto_19655 ) ) ( not ( = ?auto_19644 ?auto_19655 ) ) ( not ( = ?auto_19640 ?auto_19655 ) ) ( not ( = ?auto_19647 ?auto_19649 ) ) ( not ( = ?auto_19638 ?auto_19647 ) ) ( not ( = ?auto_19650 ?auto_19647 ) ) ( HOIST-AT ?auto_19643 ?auto_19647 ) ( not ( = ?auto_19641 ?auto_19643 ) ) ( not ( = ?auto_19653 ?auto_19643 ) ) ( not ( = ?auto_19654 ?auto_19643 ) ) ( AVAILABLE ?auto_19643 ) ( SURFACE-AT ?auto_19639 ?auto_19647 ) ( ON ?auto_19639 ?auto_19642 ) ( CLEAR ?auto_19639 ) ( not ( = ?auto_19636 ?auto_19642 ) ) ( not ( = ?auto_19637 ?auto_19642 ) ) ( not ( = ?auto_19646 ?auto_19642 ) ) ( not ( = ?auto_19657 ?auto_19642 ) ) ( not ( = ?auto_19644 ?auto_19642 ) ) ( not ( = ?auto_19639 ?auto_19642 ) ) ( not ( = ?auto_19640 ?auto_19642 ) ) ( not ( = ?auto_19655 ?auto_19642 ) ) ( SURFACE-AT ?auto_19645 ?auto_19649 ) ( CLEAR ?auto_19645 ) ( IS-CRATE ?auto_19655 ) ( not ( = ?auto_19645 ?auto_19655 ) ) ( not ( = ?auto_19636 ?auto_19645 ) ) ( not ( = ?auto_19637 ?auto_19645 ) ) ( not ( = ?auto_19646 ?auto_19645 ) ) ( not ( = ?auto_19657 ?auto_19645 ) ) ( not ( = ?auto_19644 ?auto_19645 ) ) ( not ( = ?auto_19639 ?auto_19645 ) ) ( not ( = ?auto_19640 ?auto_19645 ) ) ( not ( = ?auto_19642 ?auto_19645 ) ) ( AVAILABLE ?auto_19641 ) ( not ( = ?auto_19648 ?auto_19649 ) ) ( not ( = ?auto_19638 ?auto_19648 ) ) ( not ( = ?auto_19650 ?auto_19648 ) ) ( not ( = ?auto_19647 ?auto_19648 ) ) ( HOIST-AT ?auto_19651 ?auto_19648 ) ( not ( = ?auto_19641 ?auto_19651 ) ) ( not ( = ?auto_19653 ?auto_19651 ) ) ( not ( = ?auto_19654 ?auto_19651 ) ) ( not ( = ?auto_19643 ?auto_19651 ) ) ( AVAILABLE ?auto_19651 ) ( SURFACE-AT ?auto_19655 ?auto_19648 ) ( ON ?auto_19655 ?auto_19656 ) ( CLEAR ?auto_19655 ) ( not ( = ?auto_19636 ?auto_19656 ) ) ( not ( = ?auto_19637 ?auto_19656 ) ) ( not ( = ?auto_19646 ?auto_19656 ) ) ( not ( = ?auto_19657 ?auto_19656 ) ) ( not ( = ?auto_19644 ?auto_19656 ) ) ( not ( = ?auto_19639 ?auto_19656 ) ) ( not ( = ?auto_19640 ?auto_19656 ) ) ( not ( = ?auto_19655 ?auto_19656 ) ) ( not ( = ?auto_19642 ?auto_19656 ) ) ( not ( = ?auto_19645 ?auto_19656 ) ) ( TRUCK-AT ?auto_19652 ?auto_19649 ) )
    :subtasks
    ( ( !DRIVE ?auto_19652 ?auto_19649 ?auto_19648 )
      ( MAKE-2CRATE ?auto_19646 ?auto_19636 ?auto_19637 )
      ( MAKE-1CRATE-VERIFY ?auto_19636 ?auto_19637 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19658 - SURFACE
      ?auto_19659 - SURFACE
      ?auto_19660 - SURFACE
    )
    :vars
    (
      ?auto_19673 - HOIST
      ?auto_19679 - PLACE
      ?auto_19676 - PLACE
      ?auto_19668 - HOIST
      ?auto_19669 - SURFACE
      ?auto_19674 - PLACE
      ?auto_19677 - HOIST
      ?auto_19672 - SURFACE
      ?auto_19675 - SURFACE
      ?auto_19670 - SURFACE
      ?auto_19664 - SURFACE
      ?auto_19662 - PLACE
      ?auto_19671 - HOIST
      ?auto_19665 - SURFACE
      ?auto_19661 - SURFACE
      ?auto_19667 - PLACE
      ?auto_19663 - HOIST
      ?auto_19666 - SURFACE
      ?auto_19678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19673 ?auto_19679 ) ( IS-CRATE ?auto_19660 ) ( not ( = ?auto_19659 ?auto_19660 ) ) ( not ( = ?auto_19658 ?auto_19659 ) ) ( not ( = ?auto_19658 ?auto_19660 ) ) ( not ( = ?auto_19676 ?auto_19679 ) ) ( HOIST-AT ?auto_19668 ?auto_19676 ) ( not ( = ?auto_19673 ?auto_19668 ) ) ( AVAILABLE ?auto_19668 ) ( SURFACE-AT ?auto_19660 ?auto_19676 ) ( ON ?auto_19660 ?auto_19669 ) ( CLEAR ?auto_19660 ) ( not ( = ?auto_19659 ?auto_19669 ) ) ( not ( = ?auto_19660 ?auto_19669 ) ) ( not ( = ?auto_19658 ?auto_19669 ) ) ( IS-CRATE ?auto_19659 ) ( not ( = ?auto_19674 ?auto_19679 ) ) ( not ( = ?auto_19676 ?auto_19674 ) ) ( HOIST-AT ?auto_19677 ?auto_19674 ) ( not ( = ?auto_19673 ?auto_19677 ) ) ( not ( = ?auto_19668 ?auto_19677 ) ) ( SURFACE-AT ?auto_19659 ?auto_19674 ) ( ON ?auto_19659 ?auto_19672 ) ( CLEAR ?auto_19659 ) ( not ( = ?auto_19659 ?auto_19672 ) ) ( not ( = ?auto_19660 ?auto_19672 ) ) ( not ( = ?auto_19658 ?auto_19672 ) ) ( not ( = ?auto_19669 ?auto_19672 ) ) ( IS-CRATE ?auto_19658 ) ( not ( = ?auto_19675 ?auto_19658 ) ) ( not ( = ?auto_19659 ?auto_19675 ) ) ( not ( = ?auto_19660 ?auto_19675 ) ) ( not ( = ?auto_19669 ?auto_19675 ) ) ( not ( = ?auto_19672 ?auto_19675 ) ) ( AVAILABLE ?auto_19677 ) ( SURFACE-AT ?auto_19658 ?auto_19674 ) ( ON ?auto_19658 ?auto_19670 ) ( CLEAR ?auto_19658 ) ( not ( = ?auto_19659 ?auto_19670 ) ) ( not ( = ?auto_19660 ?auto_19670 ) ) ( not ( = ?auto_19658 ?auto_19670 ) ) ( not ( = ?auto_19669 ?auto_19670 ) ) ( not ( = ?auto_19672 ?auto_19670 ) ) ( not ( = ?auto_19675 ?auto_19670 ) ) ( IS-CRATE ?auto_19675 ) ( not ( = ?auto_19664 ?auto_19675 ) ) ( not ( = ?auto_19659 ?auto_19664 ) ) ( not ( = ?auto_19660 ?auto_19664 ) ) ( not ( = ?auto_19658 ?auto_19664 ) ) ( not ( = ?auto_19669 ?auto_19664 ) ) ( not ( = ?auto_19672 ?auto_19664 ) ) ( not ( = ?auto_19670 ?auto_19664 ) ) ( not ( = ?auto_19662 ?auto_19679 ) ) ( not ( = ?auto_19676 ?auto_19662 ) ) ( not ( = ?auto_19674 ?auto_19662 ) ) ( HOIST-AT ?auto_19671 ?auto_19662 ) ( not ( = ?auto_19673 ?auto_19671 ) ) ( not ( = ?auto_19668 ?auto_19671 ) ) ( not ( = ?auto_19677 ?auto_19671 ) ) ( AVAILABLE ?auto_19671 ) ( SURFACE-AT ?auto_19675 ?auto_19662 ) ( ON ?auto_19675 ?auto_19665 ) ( CLEAR ?auto_19675 ) ( not ( = ?auto_19659 ?auto_19665 ) ) ( not ( = ?auto_19660 ?auto_19665 ) ) ( not ( = ?auto_19658 ?auto_19665 ) ) ( not ( = ?auto_19669 ?auto_19665 ) ) ( not ( = ?auto_19672 ?auto_19665 ) ) ( not ( = ?auto_19675 ?auto_19665 ) ) ( not ( = ?auto_19670 ?auto_19665 ) ) ( not ( = ?auto_19664 ?auto_19665 ) ) ( SURFACE-AT ?auto_19661 ?auto_19679 ) ( CLEAR ?auto_19661 ) ( IS-CRATE ?auto_19664 ) ( not ( = ?auto_19661 ?auto_19664 ) ) ( not ( = ?auto_19659 ?auto_19661 ) ) ( not ( = ?auto_19660 ?auto_19661 ) ) ( not ( = ?auto_19658 ?auto_19661 ) ) ( not ( = ?auto_19669 ?auto_19661 ) ) ( not ( = ?auto_19672 ?auto_19661 ) ) ( not ( = ?auto_19675 ?auto_19661 ) ) ( not ( = ?auto_19670 ?auto_19661 ) ) ( not ( = ?auto_19665 ?auto_19661 ) ) ( AVAILABLE ?auto_19673 ) ( not ( = ?auto_19667 ?auto_19679 ) ) ( not ( = ?auto_19676 ?auto_19667 ) ) ( not ( = ?auto_19674 ?auto_19667 ) ) ( not ( = ?auto_19662 ?auto_19667 ) ) ( HOIST-AT ?auto_19663 ?auto_19667 ) ( not ( = ?auto_19673 ?auto_19663 ) ) ( not ( = ?auto_19668 ?auto_19663 ) ) ( not ( = ?auto_19677 ?auto_19663 ) ) ( not ( = ?auto_19671 ?auto_19663 ) ) ( AVAILABLE ?auto_19663 ) ( SURFACE-AT ?auto_19664 ?auto_19667 ) ( ON ?auto_19664 ?auto_19666 ) ( CLEAR ?auto_19664 ) ( not ( = ?auto_19659 ?auto_19666 ) ) ( not ( = ?auto_19660 ?auto_19666 ) ) ( not ( = ?auto_19658 ?auto_19666 ) ) ( not ( = ?auto_19669 ?auto_19666 ) ) ( not ( = ?auto_19672 ?auto_19666 ) ) ( not ( = ?auto_19675 ?auto_19666 ) ) ( not ( = ?auto_19670 ?auto_19666 ) ) ( not ( = ?auto_19664 ?auto_19666 ) ) ( not ( = ?auto_19665 ?auto_19666 ) ) ( not ( = ?auto_19661 ?auto_19666 ) ) ( TRUCK-AT ?auto_19678 ?auto_19679 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19659 ?auto_19660 )
      ( MAKE-2CRATE-VERIFY ?auto_19658 ?auto_19659 ?auto_19660 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19680 - SURFACE
      ?auto_19681 - SURFACE
      ?auto_19682 - SURFACE
      ?auto_19683 - SURFACE
    )
    :vars
    (
      ?auto_19695 - HOIST
      ?auto_19696 - PLACE
      ?auto_19700 - PLACE
      ?auto_19689 - HOIST
      ?auto_19686 - SURFACE
      ?auto_19691 - PLACE
      ?auto_19699 - HOIST
      ?auto_19692 - SURFACE
      ?auto_19687 - SURFACE
      ?auto_19701 - SURFACE
      ?auto_19697 - PLACE
      ?auto_19694 - HOIST
      ?auto_19693 - SURFACE
      ?auto_19698 - SURFACE
      ?auto_19685 - PLACE
      ?auto_19684 - HOIST
      ?auto_19688 - SURFACE
      ?auto_19690 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19695 ?auto_19696 ) ( IS-CRATE ?auto_19683 ) ( not ( = ?auto_19682 ?auto_19683 ) ) ( not ( = ?auto_19681 ?auto_19682 ) ) ( not ( = ?auto_19681 ?auto_19683 ) ) ( not ( = ?auto_19700 ?auto_19696 ) ) ( HOIST-AT ?auto_19689 ?auto_19700 ) ( not ( = ?auto_19695 ?auto_19689 ) ) ( AVAILABLE ?auto_19689 ) ( SURFACE-AT ?auto_19683 ?auto_19700 ) ( ON ?auto_19683 ?auto_19686 ) ( CLEAR ?auto_19683 ) ( not ( = ?auto_19682 ?auto_19686 ) ) ( not ( = ?auto_19683 ?auto_19686 ) ) ( not ( = ?auto_19681 ?auto_19686 ) ) ( IS-CRATE ?auto_19682 ) ( not ( = ?auto_19691 ?auto_19696 ) ) ( not ( = ?auto_19700 ?auto_19691 ) ) ( HOIST-AT ?auto_19699 ?auto_19691 ) ( not ( = ?auto_19695 ?auto_19699 ) ) ( not ( = ?auto_19689 ?auto_19699 ) ) ( SURFACE-AT ?auto_19682 ?auto_19691 ) ( ON ?auto_19682 ?auto_19692 ) ( CLEAR ?auto_19682 ) ( not ( = ?auto_19682 ?auto_19692 ) ) ( not ( = ?auto_19683 ?auto_19692 ) ) ( not ( = ?auto_19681 ?auto_19692 ) ) ( not ( = ?auto_19686 ?auto_19692 ) ) ( IS-CRATE ?auto_19681 ) ( not ( = ?auto_19680 ?auto_19681 ) ) ( not ( = ?auto_19682 ?auto_19680 ) ) ( not ( = ?auto_19683 ?auto_19680 ) ) ( not ( = ?auto_19686 ?auto_19680 ) ) ( not ( = ?auto_19692 ?auto_19680 ) ) ( AVAILABLE ?auto_19699 ) ( SURFACE-AT ?auto_19681 ?auto_19691 ) ( ON ?auto_19681 ?auto_19687 ) ( CLEAR ?auto_19681 ) ( not ( = ?auto_19682 ?auto_19687 ) ) ( not ( = ?auto_19683 ?auto_19687 ) ) ( not ( = ?auto_19681 ?auto_19687 ) ) ( not ( = ?auto_19686 ?auto_19687 ) ) ( not ( = ?auto_19692 ?auto_19687 ) ) ( not ( = ?auto_19680 ?auto_19687 ) ) ( IS-CRATE ?auto_19680 ) ( not ( = ?auto_19701 ?auto_19680 ) ) ( not ( = ?auto_19682 ?auto_19701 ) ) ( not ( = ?auto_19683 ?auto_19701 ) ) ( not ( = ?auto_19681 ?auto_19701 ) ) ( not ( = ?auto_19686 ?auto_19701 ) ) ( not ( = ?auto_19692 ?auto_19701 ) ) ( not ( = ?auto_19687 ?auto_19701 ) ) ( not ( = ?auto_19697 ?auto_19696 ) ) ( not ( = ?auto_19700 ?auto_19697 ) ) ( not ( = ?auto_19691 ?auto_19697 ) ) ( HOIST-AT ?auto_19694 ?auto_19697 ) ( not ( = ?auto_19695 ?auto_19694 ) ) ( not ( = ?auto_19689 ?auto_19694 ) ) ( not ( = ?auto_19699 ?auto_19694 ) ) ( AVAILABLE ?auto_19694 ) ( SURFACE-AT ?auto_19680 ?auto_19697 ) ( ON ?auto_19680 ?auto_19693 ) ( CLEAR ?auto_19680 ) ( not ( = ?auto_19682 ?auto_19693 ) ) ( not ( = ?auto_19683 ?auto_19693 ) ) ( not ( = ?auto_19681 ?auto_19693 ) ) ( not ( = ?auto_19686 ?auto_19693 ) ) ( not ( = ?auto_19692 ?auto_19693 ) ) ( not ( = ?auto_19680 ?auto_19693 ) ) ( not ( = ?auto_19687 ?auto_19693 ) ) ( not ( = ?auto_19701 ?auto_19693 ) ) ( SURFACE-AT ?auto_19698 ?auto_19696 ) ( CLEAR ?auto_19698 ) ( IS-CRATE ?auto_19701 ) ( not ( = ?auto_19698 ?auto_19701 ) ) ( not ( = ?auto_19682 ?auto_19698 ) ) ( not ( = ?auto_19683 ?auto_19698 ) ) ( not ( = ?auto_19681 ?auto_19698 ) ) ( not ( = ?auto_19686 ?auto_19698 ) ) ( not ( = ?auto_19692 ?auto_19698 ) ) ( not ( = ?auto_19680 ?auto_19698 ) ) ( not ( = ?auto_19687 ?auto_19698 ) ) ( not ( = ?auto_19693 ?auto_19698 ) ) ( AVAILABLE ?auto_19695 ) ( not ( = ?auto_19685 ?auto_19696 ) ) ( not ( = ?auto_19700 ?auto_19685 ) ) ( not ( = ?auto_19691 ?auto_19685 ) ) ( not ( = ?auto_19697 ?auto_19685 ) ) ( HOIST-AT ?auto_19684 ?auto_19685 ) ( not ( = ?auto_19695 ?auto_19684 ) ) ( not ( = ?auto_19689 ?auto_19684 ) ) ( not ( = ?auto_19699 ?auto_19684 ) ) ( not ( = ?auto_19694 ?auto_19684 ) ) ( AVAILABLE ?auto_19684 ) ( SURFACE-AT ?auto_19701 ?auto_19685 ) ( ON ?auto_19701 ?auto_19688 ) ( CLEAR ?auto_19701 ) ( not ( = ?auto_19682 ?auto_19688 ) ) ( not ( = ?auto_19683 ?auto_19688 ) ) ( not ( = ?auto_19681 ?auto_19688 ) ) ( not ( = ?auto_19686 ?auto_19688 ) ) ( not ( = ?auto_19692 ?auto_19688 ) ) ( not ( = ?auto_19680 ?auto_19688 ) ) ( not ( = ?auto_19687 ?auto_19688 ) ) ( not ( = ?auto_19701 ?auto_19688 ) ) ( not ( = ?auto_19693 ?auto_19688 ) ) ( not ( = ?auto_19698 ?auto_19688 ) ) ( TRUCK-AT ?auto_19690 ?auto_19696 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19681 ?auto_19682 ?auto_19683 )
      ( MAKE-3CRATE-VERIFY ?auto_19680 ?auto_19681 ?auto_19682 ?auto_19683 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19702 - SURFACE
      ?auto_19703 - SURFACE
      ?auto_19704 - SURFACE
      ?auto_19705 - SURFACE
      ?auto_19706 - SURFACE
    )
    :vars
    (
      ?auto_19718 - HOIST
      ?auto_19719 - PLACE
      ?auto_19723 - PLACE
      ?auto_19712 - HOIST
      ?auto_19709 - SURFACE
      ?auto_19714 - PLACE
      ?auto_19722 - HOIST
      ?auto_19715 - SURFACE
      ?auto_19710 - SURFACE
      ?auto_19720 - PLACE
      ?auto_19717 - HOIST
      ?auto_19716 - SURFACE
      ?auto_19721 - SURFACE
      ?auto_19708 - PLACE
      ?auto_19707 - HOIST
      ?auto_19711 - SURFACE
      ?auto_19713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19718 ?auto_19719 ) ( IS-CRATE ?auto_19706 ) ( not ( = ?auto_19705 ?auto_19706 ) ) ( not ( = ?auto_19704 ?auto_19705 ) ) ( not ( = ?auto_19704 ?auto_19706 ) ) ( not ( = ?auto_19723 ?auto_19719 ) ) ( HOIST-AT ?auto_19712 ?auto_19723 ) ( not ( = ?auto_19718 ?auto_19712 ) ) ( AVAILABLE ?auto_19712 ) ( SURFACE-AT ?auto_19706 ?auto_19723 ) ( ON ?auto_19706 ?auto_19709 ) ( CLEAR ?auto_19706 ) ( not ( = ?auto_19705 ?auto_19709 ) ) ( not ( = ?auto_19706 ?auto_19709 ) ) ( not ( = ?auto_19704 ?auto_19709 ) ) ( IS-CRATE ?auto_19705 ) ( not ( = ?auto_19714 ?auto_19719 ) ) ( not ( = ?auto_19723 ?auto_19714 ) ) ( HOIST-AT ?auto_19722 ?auto_19714 ) ( not ( = ?auto_19718 ?auto_19722 ) ) ( not ( = ?auto_19712 ?auto_19722 ) ) ( SURFACE-AT ?auto_19705 ?auto_19714 ) ( ON ?auto_19705 ?auto_19715 ) ( CLEAR ?auto_19705 ) ( not ( = ?auto_19705 ?auto_19715 ) ) ( not ( = ?auto_19706 ?auto_19715 ) ) ( not ( = ?auto_19704 ?auto_19715 ) ) ( not ( = ?auto_19709 ?auto_19715 ) ) ( IS-CRATE ?auto_19704 ) ( not ( = ?auto_19703 ?auto_19704 ) ) ( not ( = ?auto_19705 ?auto_19703 ) ) ( not ( = ?auto_19706 ?auto_19703 ) ) ( not ( = ?auto_19709 ?auto_19703 ) ) ( not ( = ?auto_19715 ?auto_19703 ) ) ( AVAILABLE ?auto_19722 ) ( SURFACE-AT ?auto_19704 ?auto_19714 ) ( ON ?auto_19704 ?auto_19710 ) ( CLEAR ?auto_19704 ) ( not ( = ?auto_19705 ?auto_19710 ) ) ( not ( = ?auto_19706 ?auto_19710 ) ) ( not ( = ?auto_19704 ?auto_19710 ) ) ( not ( = ?auto_19709 ?auto_19710 ) ) ( not ( = ?auto_19715 ?auto_19710 ) ) ( not ( = ?auto_19703 ?auto_19710 ) ) ( IS-CRATE ?auto_19703 ) ( not ( = ?auto_19702 ?auto_19703 ) ) ( not ( = ?auto_19705 ?auto_19702 ) ) ( not ( = ?auto_19706 ?auto_19702 ) ) ( not ( = ?auto_19704 ?auto_19702 ) ) ( not ( = ?auto_19709 ?auto_19702 ) ) ( not ( = ?auto_19715 ?auto_19702 ) ) ( not ( = ?auto_19710 ?auto_19702 ) ) ( not ( = ?auto_19720 ?auto_19719 ) ) ( not ( = ?auto_19723 ?auto_19720 ) ) ( not ( = ?auto_19714 ?auto_19720 ) ) ( HOIST-AT ?auto_19717 ?auto_19720 ) ( not ( = ?auto_19718 ?auto_19717 ) ) ( not ( = ?auto_19712 ?auto_19717 ) ) ( not ( = ?auto_19722 ?auto_19717 ) ) ( AVAILABLE ?auto_19717 ) ( SURFACE-AT ?auto_19703 ?auto_19720 ) ( ON ?auto_19703 ?auto_19716 ) ( CLEAR ?auto_19703 ) ( not ( = ?auto_19705 ?auto_19716 ) ) ( not ( = ?auto_19706 ?auto_19716 ) ) ( not ( = ?auto_19704 ?auto_19716 ) ) ( not ( = ?auto_19709 ?auto_19716 ) ) ( not ( = ?auto_19715 ?auto_19716 ) ) ( not ( = ?auto_19703 ?auto_19716 ) ) ( not ( = ?auto_19710 ?auto_19716 ) ) ( not ( = ?auto_19702 ?auto_19716 ) ) ( SURFACE-AT ?auto_19721 ?auto_19719 ) ( CLEAR ?auto_19721 ) ( IS-CRATE ?auto_19702 ) ( not ( = ?auto_19721 ?auto_19702 ) ) ( not ( = ?auto_19705 ?auto_19721 ) ) ( not ( = ?auto_19706 ?auto_19721 ) ) ( not ( = ?auto_19704 ?auto_19721 ) ) ( not ( = ?auto_19709 ?auto_19721 ) ) ( not ( = ?auto_19715 ?auto_19721 ) ) ( not ( = ?auto_19703 ?auto_19721 ) ) ( not ( = ?auto_19710 ?auto_19721 ) ) ( not ( = ?auto_19716 ?auto_19721 ) ) ( AVAILABLE ?auto_19718 ) ( not ( = ?auto_19708 ?auto_19719 ) ) ( not ( = ?auto_19723 ?auto_19708 ) ) ( not ( = ?auto_19714 ?auto_19708 ) ) ( not ( = ?auto_19720 ?auto_19708 ) ) ( HOIST-AT ?auto_19707 ?auto_19708 ) ( not ( = ?auto_19718 ?auto_19707 ) ) ( not ( = ?auto_19712 ?auto_19707 ) ) ( not ( = ?auto_19722 ?auto_19707 ) ) ( not ( = ?auto_19717 ?auto_19707 ) ) ( AVAILABLE ?auto_19707 ) ( SURFACE-AT ?auto_19702 ?auto_19708 ) ( ON ?auto_19702 ?auto_19711 ) ( CLEAR ?auto_19702 ) ( not ( = ?auto_19705 ?auto_19711 ) ) ( not ( = ?auto_19706 ?auto_19711 ) ) ( not ( = ?auto_19704 ?auto_19711 ) ) ( not ( = ?auto_19709 ?auto_19711 ) ) ( not ( = ?auto_19715 ?auto_19711 ) ) ( not ( = ?auto_19703 ?auto_19711 ) ) ( not ( = ?auto_19710 ?auto_19711 ) ) ( not ( = ?auto_19702 ?auto_19711 ) ) ( not ( = ?auto_19716 ?auto_19711 ) ) ( not ( = ?auto_19721 ?auto_19711 ) ) ( TRUCK-AT ?auto_19713 ?auto_19719 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19704 ?auto_19705 ?auto_19706 )
      ( MAKE-4CRATE-VERIFY ?auto_19702 ?auto_19703 ?auto_19704 ?auto_19705 ?auto_19706 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19724 - SURFACE
      ?auto_19725 - SURFACE
      ?auto_19726 - SURFACE
      ?auto_19727 - SURFACE
      ?auto_19728 - SURFACE
      ?auto_19729 - SURFACE
    )
    :vars
    (
      ?auto_19741 - HOIST
      ?auto_19742 - PLACE
      ?auto_19745 - PLACE
      ?auto_19735 - HOIST
      ?auto_19732 - SURFACE
      ?auto_19737 - PLACE
      ?auto_19744 - HOIST
      ?auto_19738 - SURFACE
      ?auto_19733 - SURFACE
      ?auto_19743 - PLACE
      ?auto_19740 - HOIST
      ?auto_19739 - SURFACE
      ?auto_19731 - PLACE
      ?auto_19730 - HOIST
      ?auto_19734 - SURFACE
      ?auto_19736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19741 ?auto_19742 ) ( IS-CRATE ?auto_19729 ) ( not ( = ?auto_19728 ?auto_19729 ) ) ( not ( = ?auto_19727 ?auto_19728 ) ) ( not ( = ?auto_19727 ?auto_19729 ) ) ( not ( = ?auto_19745 ?auto_19742 ) ) ( HOIST-AT ?auto_19735 ?auto_19745 ) ( not ( = ?auto_19741 ?auto_19735 ) ) ( AVAILABLE ?auto_19735 ) ( SURFACE-AT ?auto_19729 ?auto_19745 ) ( ON ?auto_19729 ?auto_19732 ) ( CLEAR ?auto_19729 ) ( not ( = ?auto_19728 ?auto_19732 ) ) ( not ( = ?auto_19729 ?auto_19732 ) ) ( not ( = ?auto_19727 ?auto_19732 ) ) ( IS-CRATE ?auto_19728 ) ( not ( = ?auto_19737 ?auto_19742 ) ) ( not ( = ?auto_19745 ?auto_19737 ) ) ( HOIST-AT ?auto_19744 ?auto_19737 ) ( not ( = ?auto_19741 ?auto_19744 ) ) ( not ( = ?auto_19735 ?auto_19744 ) ) ( SURFACE-AT ?auto_19728 ?auto_19737 ) ( ON ?auto_19728 ?auto_19738 ) ( CLEAR ?auto_19728 ) ( not ( = ?auto_19728 ?auto_19738 ) ) ( not ( = ?auto_19729 ?auto_19738 ) ) ( not ( = ?auto_19727 ?auto_19738 ) ) ( not ( = ?auto_19732 ?auto_19738 ) ) ( IS-CRATE ?auto_19727 ) ( not ( = ?auto_19726 ?auto_19727 ) ) ( not ( = ?auto_19728 ?auto_19726 ) ) ( not ( = ?auto_19729 ?auto_19726 ) ) ( not ( = ?auto_19732 ?auto_19726 ) ) ( not ( = ?auto_19738 ?auto_19726 ) ) ( AVAILABLE ?auto_19744 ) ( SURFACE-AT ?auto_19727 ?auto_19737 ) ( ON ?auto_19727 ?auto_19733 ) ( CLEAR ?auto_19727 ) ( not ( = ?auto_19728 ?auto_19733 ) ) ( not ( = ?auto_19729 ?auto_19733 ) ) ( not ( = ?auto_19727 ?auto_19733 ) ) ( not ( = ?auto_19732 ?auto_19733 ) ) ( not ( = ?auto_19738 ?auto_19733 ) ) ( not ( = ?auto_19726 ?auto_19733 ) ) ( IS-CRATE ?auto_19726 ) ( not ( = ?auto_19725 ?auto_19726 ) ) ( not ( = ?auto_19728 ?auto_19725 ) ) ( not ( = ?auto_19729 ?auto_19725 ) ) ( not ( = ?auto_19727 ?auto_19725 ) ) ( not ( = ?auto_19732 ?auto_19725 ) ) ( not ( = ?auto_19738 ?auto_19725 ) ) ( not ( = ?auto_19733 ?auto_19725 ) ) ( not ( = ?auto_19743 ?auto_19742 ) ) ( not ( = ?auto_19745 ?auto_19743 ) ) ( not ( = ?auto_19737 ?auto_19743 ) ) ( HOIST-AT ?auto_19740 ?auto_19743 ) ( not ( = ?auto_19741 ?auto_19740 ) ) ( not ( = ?auto_19735 ?auto_19740 ) ) ( not ( = ?auto_19744 ?auto_19740 ) ) ( AVAILABLE ?auto_19740 ) ( SURFACE-AT ?auto_19726 ?auto_19743 ) ( ON ?auto_19726 ?auto_19739 ) ( CLEAR ?auto_19726 ) ( not ( = ?auto_19728 ?auto_19739 ) ) ( not ( = ?auto_19729 ?auto_19739 ) ) ( not ( = ?auto_19727 ?auto_19739 ) ) ( not ( = ?auto_19732 ?auto_19739 ) ) ( not ( = ?auto_19738 ?auto_19739 ) ) ( not ( = ?auto_19726 ?auto_19739 ) ) ( not ( = ?auto_19733 ?auto_19739 ) ) ( not ( = ?auto_19725 ?auto_19739 ) ) ( SURFACE-AT ?auto_19724 ?auto_19742 ) ( CLEAR ?auto_19724 ) ( IS-CRATE ?auto_19725 ) ( not ( = ?auto_19724 ?auto_19725 ) ) ( not ( = ?auto_19728 ?auto_19724 ) ) ( not ( = ?auto_19729 ?auto_19724 ) ) ( not ( = ?auto_19727 ?auto_19724 ) ) ( not ( = ?auto_19732 ?auto_19724 ) ) ( not ( = ?auto_19738 ?auto_19724 ) ) ( not ( = ?auto_19726 ?auto_19724 ) ) ( not ( = ?auto_19733 ?auto_19724 ) ) ( not ( = ?auto_19739 ?auto_19724 ) ) ( AVAILABLE ?auto_19741 ) ( not ( = ?auto_19731 ?auto_19742 ) ) ( not ( = ?auto_19745 ?auto_19731 ) ) ( not ( = ?auto_19737 ?auto_19731 ) ) ( not ( = ?auto_19743 ?auto_19731 ) ) ( HOIST-AT ?auto_19730 ?auto_19731 ) ( not ( = ?auto_19741 ?auto_19730 ) ) ( not ( = ?auto_19735 ?auto_19730 ) ) ( not ( = ?auto_19744 ?auto_19730 ) ) ( not ( = ?auto_19740 ?auto_19730 ) ) ( AVAILABLE ?auto_19730 ) ( SURFACE-AT ?auto_19725 ?auto_19731 ) ( ON ?auto_19725 ?auto_19734 ) ( CLEAR ?auto_19725 ) ( not ( = ?auto_19728 ?auto_19734 ) ) ( not ( = ?auto_19729 ?auto_19734 ) ) ( not ( = ?auto_19727 ?auto_19734 ) ) ( not ( = ?auto_19732 ?auto_19734 ) ) ( not ( = ?auto_19738 ?auto_19734 ) ) ( not ( = ?auto_19726 ?auto_19734 ) ) ( not ( = ?auto_19733 ?auto_19734 ) ) ( not ( = ?auto_19725 ?auto_19734 ) ) ( not ( = ?auto_19739 ?auto_19734 ) ) ( not ( = ?auto_19724 ?auto_19734 ) ) ( TRUCK-AT ?auto_19736 ?auto_19742 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19727 ?auto_19728 ?auto_19729 )
      ( MAKE-5CRATE-VERIFY ?auto_19724 ?auto_19725 ?auto_19726 ?auto_19727 ?auto_19728 ?auto_19729 ) )
  )

)

