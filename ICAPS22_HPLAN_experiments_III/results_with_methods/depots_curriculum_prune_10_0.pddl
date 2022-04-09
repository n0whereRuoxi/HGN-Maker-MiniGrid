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
      ?auto_6612 - SURFACE
      ?auto_6613 - SURFACE
    )
    :vars
    (
      ?auto_6614 - HOIST
      ?auto_6615 - PLACE
      ?auto_6617 - PLACE
      ?auto_6618 - HOIST
      ?auto_6619 - SURFACE
      ?auto_6616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6614 ?auto_6615 ) ( SURFACE-AT ?auto_6612 ?auto_6615 ) ( CLEAR ?auto_6612 ) ( IS-CRATE ?auto_6613 ) ( AVAILABLE ?auto_6614 ) ( not ( = ?auto_6617 ?auto_6615 ) ) ( HOIST-AT ?auto_6618 ?auto_6617 ) ( AVAILABLE ?auto_6618 ) ( SURFACE-AT ?auto_6613 ?auto_6617 ) ( ON ?auto_6613 ?auto_6619 ) ( CLEAR ?auto_6613 ) ( TRUCK-AT ?auto_6616 ?auto_6615 ) ( not ( = ?auto_6612 ?auto_6613 ) ) ( not ( = ?auto_6612 ?auto_6619 ) ) ( not ( = ?auto_6613 ?auto_6619 ) ) ( not ( = ?auto_6614 ?auto_6618 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6616 ?auto_6615 ?auto_6617 )
      ( !LIFT ?auto_6618 ?auto_6613 ?auto_6619 ?auto_6617 )
      ( !LOAD ?auto_6618 ?auto_6613 ?auto_6616 ?auto_6617 )
      ( !DRIVE ?auto_6616 ?auto_6617 ?auto_6615 )
      ( !UNLOAD ?auto_6614 ?auto_6613 ?auto_6616 ?auto_6615 )
      ( !DROP ?auto_6614 ?auto_6613 ?auto_6612 ?auto_6615 )
      ( MAKE-1CRATE-VERIFY ?auto_6612 ?auto_6613 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6633 - SURFACE
      ?auto_6634 - SURFACE
      ?auto_6635 - SURFACE
    )
    :vars
    (
      ?auto_6640 - HOIST
      ?auto_6637 - PLACE
      ?auto_6638 - PLACE
      ?auto_6636 - HOIST
      ?auto_6641 - SURFACE
      ?auto_6643 - PLACE
      ?auto_6642 - HOIST
      ?auto_6644 - SURFACE
      ?auto_6639 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6640 ?auto_6637 ) ( IS-CRATE ?auto_6635 ) ( not ( = ?auto_6638 ?auto_6637 ) ) ( HOIST-AT ?auto_6636 ?auto_6638 ) ( AVAILABLE ?auto_6636 ) ( SURFACE-AT ?auto_6635 ?auto_6638 ) ( ON ?auto_6635 ?auto_6641 ) ( CLEAR ?auto_6635 ) ( not ( = ?auto_6634 ?auto_6635 ) ) ( not ( = ?auto_6634 ?auto_6641 ) ) ( not ( = ?auto_6635 ?auto_6641 ) ) ( not ( = ?auto_6640 ?auto_6636 ) ) ( SURFACE-AT ?auto_6633 ?auto_6637 ) ( CLEAR ?auto_6633 ) ( IS-CRATE ?auto_6634 ) ( AVAILABLE ?auto_6640 ) ( not ( = ?auto_6643 ?auto_6637 ) ) ( HOIST-AT ?auto_6642 ?auto_6643 ) ( AVAILABLE ?auto_6642 ) ( SURFACE-AT ?auto_6634 ?auto_6643 ) ( ON ?auto_6634 ?auto_6644 ) ( CLEAR ?auto_6634 ) ( TRUCK-AT ?auto_6639 ?auto_6637 ) ( not ( = ?auto_6633 ?auto_6634 ) ) ( not ( = ?auto_6633 ?auto_6644 ) ) ( not ( = ?auto_6634 ?auto_6644 ) ) ( not ( = ?auto_6640 ?auto_6642 ) ) ( not ( = ?auto_6633 ?auto_6635 ) ) ( not ( = ?auto_6633 ?auto_6641 ) ) ( not ( = ?auto_6635 ?auto_6644 ) ) ( not ( = ?auto_6638 ?auto_6643 ) ) ( not ( = ?auto_6636 ?auto_6642 ) ) ( not ( = ?auto_6641 ?auto_6644 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6633 ?auto_6634 )
      ( MAKE-1CRATE ?auto_6634 ?auto_6635 )
      ( MAKE-2CRATE-VERIFY ?auto_6633 ?auto_6634 ?auto_6635 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6659 - SURFACE
      ?auto_6660 - SURFACE
      ?auto_6661 - SURFACE
      ?auto_6662 - SURFACE
    )
    :vars
    (
      ?auto_6664 - HOIST
      ?auto_6667 - PLACE
      ?auto_6666 - PLACE
      ?auto_6663 - HOIST
      ?auto_6665 - SURFACE
      ?auto_6669 - PLACE
      ?auto_6673 - HOIST
      ?auto_6672 - SURFACE
      ?auto_6671 - PLACE
      ?auto_6674 - HOIST
      ?auto_6670 - SURFACE
      ?auto_6668 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6664 ?auto_6667 ) ( IS-CRATE ?auto_6662 ) ( not ( = ?auto_6666 ?auto_6667 ) ) ( HOIST-AT ?auto_6663 ?auto_6666 ) ( AVAILABLE ?auto_6663 ) ( SURFACE-AT ?auto_6662 ?auto_6666 ) ( ON ?auto_6662 ?auto_6665 ) ( CLEAR ?auto_6662 ) ( not ( = ?auto_6661 ?auto_6662 ) ) ( not ( = ?auto_6661 ?auto_6665 ) ) ( not ( = ?auto_6662 ?auto_6665 ) ) ( not ( = ?auto_6664 ?auto_6663 ) ) ( IS-CRATE ?auto_6661 ) ( not ( = ?auto_6669 ?auto_6667 ) ) ( HOIST-AT ?auto_6673 ?auto_6669 ) ( AVAILABLE ?auto_6673 ) ( SURFACE-AT ?auto_6661 ?auto_6669 ) ( ON ?auto_6661 ?auto_6672 ) ( CLEAR ?auto_6661 ) ( not ( = ?auto_6660 ?auto_6661 ) ) ( not ( = ?auto_6660 ?auto_6672 ) ) ( not ( = ?auto_6661 ?auto_6672 ) ) ( not ( = ?auto_6664 ?auto_6673 ) ) ( SURFACE-AT ?auto_6659 ?auto_6667 ) ( CLEAR ?auto_6659 ) ( IS-CRATE ?auto_6660 ) ( AVAILABLE ?auto_6664 ) ( not ( = ?auto_6671 ?auto_6667 ) ) ( HOIST-AT ?auto_6674 ?auto_6671 ) ( AVAILABLE ?auto_6674 ) ( SURFACE-AT ?auto_6660 ?auto_6671 ) ( ON ?auto_6660 ?auto_6670 ) ( CLEAR ?auto_6660 ) ( TRUCK-AT ?auto_6668 ?auto_6667 ) ( not ( = ?auto_6659 ?auto_6660 ) ) ( not ( = ?auto_6659 ?auto_6670 ) ) ( not ( = ?auto_6660 ?auto_6670 ) ) ( not ( = ?auto_6664 ?auto_6674 ) ) ( not ( = ?auto_6659 ?auto_6661 ) ) ( not ( = ?auto_6659 ?auto_6672 ) ) ( not ( = ?auto_6661 ?auto_6670 ) ) ( not ( = ?auto_6669 ?auto_6671 ) ) ( not ( = ?auto_6673 ?auto_6674 ) ) ( not ( = ?auto_6672 ?auto_6670 ) ) ( not ( = ?auto_6659 ?auto_6662 ) ) ( not ( = ?auto_6659 ?auto_6665 ) ) ( not ( = ?auto_6660 ?auto_6662 ) ) ( not ( = ?auto_6660 ?auto_6665 ) ) ( not ( = ?auto_6662 ?auto_6672 ) ) ( not ( = ?auto_6662 ?auto_6670 ) ) ( not ( = ?auto_6666 ?auto_6669 ) ) ( not ( = ?auto_6666 ?auto_6671 ) ) ( not ( = ?auto_6663 ?auto_6673 ) ) ( not ( = ?auto_6663 ?auto_6674 ) ) ( not ( = ?auto_6665 ?auto_6672 ) ) ( not ( = ?auto_6665 ?auto_6670 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6659 ?auto_6660 ?auto_6661 )
      ( MAKE-1CRATE ?auto_6661 ?auto_6662 )
      ( MAKE-3CRATE-VERIFY ?auto_6659 ?auto_6660 ?auto_6661 ?auto_6662 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6690 - SURFACE
      ?auto_6691 - SURFACE
      ?auto_6692 - SURFACE
      ?auto_6693 - SURFACE
      ?auto_6694 - SURFACE
    )
    :vars
    (
      ?auto_6699 - HOIST
      ?auto_6697 - PLACE
      ?auto_6696 - PLACE
      ?auto_6700 - HOIST
      ?auto_6698 - SURFACE
      ?auto_6701 - PLACE
      ?auto_6707 - HOIST
      ?auto_6704 - SURFACE
      ?auto_6705 - PLACE
      ?auto_6702 - HOIST
      ?auto_6703 - SURFACE
      ?auto_6709 - PLACE
      ?auto_6708 - HOIST
      ?auto_6706 - SURFACE
      ?auto_6695 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6699 ?auto_6697 ) ( IS-CRATE ?auto_6694 ) ( not ( = ?auto_6696 ?auto_6697 ) ) ( HOIST-AT ?auto_6700 ?auto_6696 ) ( AVAILABLE ?auto_6700 ) ( SURFACE-AT ?auto_6694 ?auto_6696 ) ( ON ?auto_6694 ?auto_6698 ) ( CLEAR ?auto_6694 ) ( not ( = ?auto_6693 ?auto_6694 ) ) ( not ( = ?auto_6693 ?auto_6698 ) ) ( not ( = ?auto_6694 ?auto_6698 ) ) ( not ( = ?auto_6699 ?auto_6700 ) ) ( IS-CRATE ?auto_6693 ) ( not ( = ?auto_6701 ?auto_6697 ) ) ( HOIST-AT ?auto_6707 ?auto_6701 ) ( AVAILABLE ?auto_6707 ) ( SURFACE-AT ?auto_6693 ?auto_6701 ) ( ON ?auto_6693 ?auto_6704 ) ( CLEAR ?auto_6693 ) ( not ( = ?auto_6692 ?auto_6693 ) ) ( not ( = ?auto_6692 ?auto_6704 ) ) ( not ( = ?auto_6693 ?auto_6704 ) ) ( not ( = ?auto_6699 ?auto_6707 ) ) ( IS-CRATE ?auto_6692 ) ( not ( = ?auto_6705 ?auto_6697 ) ) ( HOIST-AT ?auto_6702 ?auto_6705 ) ( AVAILABLE ?auto_6702 ) ( SURFACE-AT ?auto_6692 ?auto_6705 ) ( ON ?auto_6692 ?auto_6703 ) ( CLEAR ?auto_6692 ) ( not ( = ?auto_6691 ?auto_6692 ) ) ( not ( = ?auto_6691 ?auto_6703 ) ) ( not ( = ?auto_6692 ?auto_6703 ) ) ( not ( = ?auto_6699 ?auto_6702 ) ) ( SURFACE-AT ?auto_6690 ?auto_6697 ) ( CLEAR ?auto_6690 ) ( IS-CRATE ?auto_6691 ) ( AVAILABLE ?auto_6699 ) ( not ( = ?auto_6709 ?auto_6697 ) ) ( HOIST-AT ?auto_6708 ?auto_6709 ) ( AVAILABLE ?auto_6708 ) ( SURFACE-AT ?auto_6691 ?auto_6709 ) ( ON ?auto_6691 ?auto_6706 ) ( CLEAR ?auto_6691 ) ( TRUCK-AT ?auto_6695 ?auto_6697 ) ( not ( = ?auto_6690 ?auto_6691 ) ) ( not ( = ?auto_6690 ?auto_6706 ) ) ( not ( = ?auto_6691 ?auto_6706 ) ) ( not ( = ?auto_6699 ?auto_6708 ) ) ( not ( = ?auto_6690 ?auto_6692 ) ) ( not ( = ?auto_6690 ?auto_6703 ) ) ( not ( = ?auto_6692 ?auto_6706 ) ) ( not ( = ?auto_6705 ?auto_6709 ) ) ( not ( = ?auto_6702 ?auto_6708 ) ) ( not ( = ?auto_6703 ?auto_6706 ) ) ( not ( = ?auto_6690 ?auto_6693 ) ) ( not ( = ?auto_6690 ?auto_6704 ) ) ( not ( = ?auto_6691 ?auto_6693 ) ) ( not ( = ?auto_6691 ?auto_6704 ) ) ( not ( = ?auto_6693 ?auto_6703 ) ) ( not ( = ?auto_6693 ?auto_6706 ) ) ( not ( = ?auto_6701 ?auto_6705 ) ) ( not ( = ?auto_6701 ?auto_6709 ) ) ( not ( = ?auto_6707 ?auto_6702 ) ) ( not ( = ?auto_6707 ?auto_6708 ) ) ( not ( = ?auto_6704 ?auto_6703 ) ) ( not ( = ?auto_6704 ?auto_6706 ) ) ( not ( = ?auto_6690 ?auto_6694 ) ) ( not ( = ?auto_6690 ?auto_6698 ) ) ( not ( = ?auto_6691 ?auto_6694 ) ) ( not ( = ?auto_6691 ?auto_6698 ) ) ( not ( = ?auto_6692 ?auto_6694 ) ) ( not ( = ?auto_6692 ?auto_6698 ) ) ( not ( = ?auto_6694 ?auto_6704 ) ) ( not ( = ?auto_6694 ?auto_6703 ) ) ( not ( = ?auto_6694 ?auto_6706 ) ) ( not ( = ?auto_6696 ?auto_6701 ) ) ( not ( = ?auto_6696 ?auto_6705 ) ) ( not ( = ?auto_6696 ?auto_6709 ) ) ( not ( = ?auto_6700 ?auto_6707 ) ) ( not ( = ?auto_6700 ?auto_6702 ) ) ( not ( = ?auto_6700 ?auto_6708 ) ) ( not ( = ?auto_6698 ?auto_6704 ) ) ( not ( = ?auto_6698 ?auto_6703 ) ) ( not ( = ?auto_6698 ?auto_6706 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_6690 ?auto_6691 ?auto_6692 ?auto_6693 )
      ( MAKE-1CRATE ?auto_6693 ?auto_6694 )
      ( MAKE-4CRATE-VERIFY ?auto_6690 ?auto_6691 ?auto_6692 ?auto_6693 ?auto_6694 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_6726 - SURFACE
      ?auto_6727 - SURFACE
      ?auto_6728 - SURFACE
      ?auto_6729 - SURFACE
      ?auto_6730 - SURFACE
      ?auto_6731 - SURFACE
    )
    :vars
    (
      ?auto_6736 - HOIST
      ?auto_6737 - PLACE
      ?auto_6732 - PLACE
      ?auto_6733 - HOIST
      ?auto_6734 - SURFACE
      ?auto_6743 - PLACE
      ?auto_6744 - HOIST
      ?auto_6749 - SURFACE
      ?auto_6738 - PLACE
      ?auto_6745 - HOIST
      ?auto_6748 - SURFACE
      ?auto_6747 - PLACE
      ?auto_6741 - HOIST
      ?auto_6740 - SURFACE
      ?auto_6739 - PLACE
      ?auto_6742 - HOIST
      ?auto_6746 - SURFACE
      ?auto_6735 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6736 ?auto_6737 ) ( IS-CRATE ?auto_6731 ) ( not ( = ?auto_6732 ?auto_6737 ) ) ( HOIST-AT ?auto_6733 ?auto_6732 ) ( AVAILABLE ?auto_6733 ) ( SURFACE-AT ?auto_6731 ?auto_6732 ) ( ON ?auto_6731 ?auto_6734 ) ( CLEAR ?auto_6731 ) ( not ( = ?auto_6730 ?auto_6731 ) ) ( not ( = ?auto_6730 ?auto_6734 ) ) ( not ( = ?auto_6731 ?auto_6734 ) ) ( not ( = ?auto_6736 ?auto_6733 ) ) ( IS-CRATE ?auto_6730 ) ( not ( = ?auto_6743 ?auto_6737 ) ) ( HOIST-AT ?auto_6744 ?auto_6743 ) ( AVAILABLE ?auto_6744 ) ( SURFACE-AT ?auto_6730 ?auto_6743 ) ( ON ?auto_6730 ?auto_6749 ) ( CLEAR ?auto_6730 ) ( not ( = ?auto_6729 ?auto_6730 ) ) ( not ( = ?auto_6729 ?auto_6749 ) ) ( not ( = ?auto_6730 ?auto_6749 ) ) ( not ( = ?auto_6736 ?auto_6744 ) ) ( IS-CRATE ?auto_6729 ) ( not ( = ?auto_6738 ?auto_6737 ) ) ( HOIST-AT ?auto_6745 ?auto_6738 ) ( AVAILABLE ?auto_6745 ) ( SURFACE-AT ?auto_6729 ?auto_6738 ) ( ON ?auto_6729 ?auto_6748 ) ( CLEAR ?auto_6729 ) ( not ( = ?auto_6728 ?auto_6729 ) ) ( not ( = ?auto_6728 ?auto_6748 ) ) ( not ( = ?auto_6729 ?auto_6748 ) ) ( not ( = ?auto_6736 ?auto_6745 ) ) ( IS-CRATE ?auto_6728 ) ( not ( = ?auto_6747 ?auto_6737 ) ) ( HOIST-AT ?auto_6741 ?auto_6747 ) ( AVAILABLE ?auto_6741 ) ( SURFACE-AT ?auto_6728 ?auto_6747 ) ( ON ?auto_6728 ?auto_6740 ) ( CLEAR ?auto_6728 ) ( not ( = ?auto_6727 ?auto_6728 ) ) ( not ( = ?auto_6727 ?auto_6740 ) ) ( not ( = ?auto_6728 ?auto_6740 ) ) ( not ( = ?auto_6736 ?auto_6741 ) ) ( SURFACE-AT ?auto_6726 ?auto_6737 ) ( CLEAR ?auto_6726 ) ( IS-CRATE ?auto_6727 ) ( AVAILABLE ?auto_6736 ) ( not ( = ?auto_6739 ?auto_6737 ) ) ( HOIST-AT ?auto_6742 ?auto_6739 ) ( AVAILABLE ?auto_6742 ) ( SURFACE-AT ?auto_6727 ?auto_6739 ) ( ON ?auto_6727 ?auto_6746 ) ( CLEAR ?auto_6727 ) ( TRUCK-AT ?auto_6735 ?auto_6737 ) ( not ( = ?auto_6726 ?auto_6727 ) ) ( not ( = ?auto_6726 ?auto_6746 ) ) ( not ( = ?auto_6727 ?auto_6746 ) ) ( not ( = ?auto_6736 ?auto_6742 ) ) ( not ( = ?auto_6726 ?auto_6728 ) ) ( not ( = ?auto_6726 ?auto_6740 ) ) ( not ( = ?auto_6728 ?auto_6746 ) ) ( not ( = ?auto_6747 ?auto_6739 ) ) ( not ( = ?auto_6741 ?auto_6742 ) ) ( not ( = ?auto_6740 ?auto_6746 ) ) ( not ( = ?auto_6726 ?auto_6729 ) ) ( not ( = ?auto_6726 ?auto_6748 ) ) ( not ( = ?auto_6727 ?auto_6729 ) ) ( not ( = ?auto_6727 ?auto_6748 ) ) ( not ( = ?auto_6729 ?auto_6740 ) ) ( not ( = ?auto_6729 ?auto_6746 ) ) ( not ( = ?auto_6738 ?auto_6747 ) ) ( not ( = ?auto_6738 ?auto_6739 ) ) ( not ( = ?auto_6745 ?auto_6741 ) ) ( not ( = ?auto_6745 ?auto_6742 ) ) ( not ( = ?auto_6748 ?auto_6740 ) ) ( not ( = ?auto_6748 ?auto_6746 ) ) ( not ( = ?auto_6726 ?auto_6730 ) ) ( not ( = ?auto_6726 ?auto_6749 ) ) ( not ( = ?auto_6727 ?auto_6730 ) ) ( not ( = ?auto_6727 ?auto_6749 ) ) ( not ( = ?auto_6728 ?auto_6730 ) ) ( not ( = ?auto_6728 ?auto_6749 ) ) ( not ( = ?auto_6730 ?auto_6748 ) ) ( not ( = ?auto_6730 ?auto_6740 ) ) ( not ( = ?auto_6730 ?auto_6746 ) ) ( not ( = ?auto_6743 ?auto_6738 ) ) ( not ( = ?auto_6743 ?auto_6747 ) ) ( not ( = ?auto_6743 ?auto_6739 ) ) ( not ( = ?auto_6744 ?auto_6745 ) ) ( not ( = ?auto_6744 ?auto_6741 ) ) ( not ( = ?auto_6744 ?auto_6742 ) ) ( not ( = ?auto_6749 ?auto_6748 ) ) ( not ( = ?auto_6749 ?auto_6740 ) ) ( not ( = ?auto_6749 ?auto_6746 ) ) ( not ( = ?auto_6726 ?auto_6731 ) ) ( not ( = ?auto_6726 ?auto_6734 ) ) ( not ( = ?auto_6727 ?auto_6731 ) ) ( not ( = ?auto_6727 ?auto_6734 ) ) ( not ( = ?auto_6728 ?auto_6731 ) ) ( not ( = ?auto_6728 ?auto_6734 ) ) ( not ( = ?auto_6729 ?auto_6731 ) ) ( not ( = ?auto_6729 ?auto_6734 ) ) ( not ( = ?auto_6731 ?auto_6749 ) ) ( not ( = ?auto_6731 ?auto_6748 ) ) ( not ( = ?auto_6731 ?auto_6740 ) ) ( not ( = ?auto_6731 ?auto_6746 ) ) ( not ( = ?auto_6732 ?auto_6743 ) ) ( not ( = ?auto_6732 ?auto_6738 ) ) ( not ( = ?auto_6732 ?auto_6747 ) ) ( not ( = ?auto_6732 ?auto_6739 ) ) ( not ( = ?auto_6733 ?auto_6744 ) ) ( not ( = ?auto_6733 ?auto_6745 ) ) ( not ( = ?auto_6733 ?auto_6741 ) ) ( not ( = ?auto_6733 ?auto_6742 ) ) ( not ( = ?auto_6734 ?auto_6749 ) ) ( not ( = ?auto_6734 ?auto_6748 ) ) ( not ( = ?auto_6734 ?auto_6740 ) ) ( not ( = ?auto_6734 ?auto_6746 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_6726 ?auto_6727 ?auto_6728 ?auto_6729 ?auto_6730 )
      ( MAKE-1CRATE ?auto_6730 ?auto_6731 )
      ( MAKE-5CRATE-VERIFY ?auto_6726 ?auto_6727 ?auto_6728 ?auto_6729 ?auto_6730 ?auto_6731 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_6767 - SURFACE
      ?auto_6768 - SURFACE
      ?auto_6769 - SURFACE
      ?auto_6770 - SURFACE
      ?auto_6771 - SURFACE
      ?auto_6772 - SURFACE
      ?auto_6773 - SURFACE
    )
    :vars
    (
      ?auto_6774 - HOIST
      ?auto_6777 - PLACE
      ?auto_6778 - PLACE
      ?auto_6776 - HOIST
      ?auto_6775 - SURFACE
      ?auto_6782 - PLACE
      ?auto_6781 - HOIST
      ?auto_6780 - SURFACE
      ?auto_6794 - PLACE
      ?auto_6788 - HOIST
      ?auto_6786 - SURFACE
      ?auto_6792 - PLACE
      ?auto_6789 - HOIST
      ?auto_6783 - SURFACE
      ?auto_6784 - PLACE
      ?auto_6793 - HOIST
      ?auto_6790 - SURFACE
      ?auto_6791 - PLACE
      ?auto_6787 - HOIST
      ?auto_6785 - SURFACE
      ?auto_6779 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6774 ?auto_6777 ) ( IS-CRATE ?auto_6773 ) ( not ( = ?auto_6778 ?auto_6777 ) ) ( HOIST-AT ?auto_6776 ?auto_6778 ) ( AVAILABLE ?auto_6776 ) ( SURFACE-AT ?auto_6773 ?auto_6778 ) ( ON ?auto_6773 ?auto_6775 ) ( CLEAR ?auto_6773 ) ( not ( = ?auto_6772 ?auto_6773 ) ) ( not ( = ?auto_6772 ?auto_6775 ) ) ( not ( = ?auto_6773 ?auto_6775 ) ) ( not ( = ?auto_6774 ?auto_6776 ) ) ( IS-CRATE ?auto_6772 ) ( not ( = ?auto_6782 ?auto_6777 ) ) ( HOIST-AT ?auto_6781 ?auto_6782 ) ( AVAILABLE ?auto_6781 ) ( SURFACE-AT ?auto_6772 ?auto_6782 ) ( ON ?auto_6772 ?auto_6780 ) ( CLEAR ?auto_6772 ) ( not ( = ?auto_6771 ?auto_6772 ) ) ( not ( = ?auto_6771 ?auto_6780 ) ) ( not ( = ?auto_6772 ?auto_6780 ) ) ( not ( = ?auto_6774 ?auto_6781 ) ) ( IS-CRATE ?auto_6771 ) ( not ( = ?auto_6794 ?auto_6777 ) ) ( HOIST-AT ?auto_6788 ?auto_6794 ) ( AVAILABLE ?auto_6788 ) ( SURFACE-AT ?auto_6771 ?auto_6794 ) ( ON ?auto_6771 ?auto_6786 ) ( CLEAR ?auto_6771 ) ( not ( = ?auto_6770 ?auto_6771 ) ) ( not ( = ?auto_6770 ?auto_6786 ) ) ( not ( = ?auto_6771 ?auto_6786 ) ) ( not ( = ?auto_6774 ?auto_6788 ) ) ( IS-CRATE ?auto_6770 ) ( not ( = ?auto_6792 ?auto_6777 ) ) ( HOIST-AT ?auto_6789 ?auto_6792 ) ( AVAILABLE ?auto_6789 ) ( SURFACE-AT ?auto_6770 ?auto_6792 ) ( ON ?auto_6770 ?auto_6783 ) ( CLEAR ?auto_6770 ) ( not ( = ?auto_6769 ?auto_6770 ) ) ( not ( = ?auto_6769 ?auto_6783 ) ) ( not ( = ?auto_6770 ?auto_6783 ) ) ( not ( = ?auto_6774 ?auto_6789 ) ) ( IS-CRATE ?auto_6769 ) ( not ( = ?auto_6784 ?auto_6777 ) ) ( HOIST-AT ?auto_6793 ?auto_6784 ) ( AVAILABLE ?auto_6793 ) ( SURFACE-AT ?auto_6769 ?auto_6784 ) ( ON ?auto_6769 ?auto_6790 ) ( CLEAR ?auto_6769 ) ( not ( = ?auto_6768 ?auto_6769 ) ) ( not ( = ?auto_6768 ?auto_6790 ) ) ( not ( = ?auto_6769 ?auto_6790 ) ) ( not ( = ?auto_6774 ?auto_6793 ) ) ( SURFACE-AT ?auto_6767 ?auto_6777 ) ( CLEAR ?auto_6767 ) ( IS-CRATE ?auto_6768 ) ( AVAILABLE ?auto_6774 ) ( not ( = ?auto_6791 ?auto_6777 ) ) ( HOIST-AT ?auto_6787 ?auto_6791 ) ( AVAILABLE ?auto_6787 ) ( SURFACE-AT ?auto_6768 ?auto_6791 ) ( ON ?auto_6768 ?auto_6785 ) ( CLEAR ?auto_6768 ) ( TRUCK-AT ?auto_6779 ?auto_6777 ) ( not ( = ?auto_6767 ?auto_6768 ) ) ( not ( = ?auto_6767 ?auto_6785 ) ) ( not ( = ?auto_6768 ?auto_6785 ) ) ( not ( = ?auto_6774 ?auto_6787 ) ) ( not ( = ?auto_6767 ?auto_6769 ) ) ( not ( = ?auto_6767 ?auto_6790 ) ) ( not ( = ?auto_6769 ?auto_6785 ) ) ( not ( = ?auto_6784 ?auto_6791 ) ) ( not ( = ?auto_6793 ?auto_6787 ) ) ( not ( = ?auto_6790 ?auto_6785 ) ) ( not ( = ?auto_6767 ?auto_6770 ) ) ( not ( = ?auto_6767 ?auto_6783 ) ) ( not ( = ?auto_6768 ?auto_6770 ) ) ( not ( = ?auto_6768 ?auto_6783 ) ) ( not ( = ?auto_6770 ?auto_6790 ) ) ( not ( = ?auto_6770 ?auto_6785 ) ) ( not ( = ?auto_6792 ?auto_6784 ) ) ( not ( = ?auto_6792 ?auto_6791 ) ) ( not ( = ?auto_6789 ?auto_6793 ) ) ( not ( = ?auto_6789 ?auto_6787 ) ) ( not ( = ?auto_6783 ?auto_6790 ) ) ( not ( = ?auto_6783 ?auto_6785 ) ) ( not ( = ?auto_6767 ?auto_6771 ) ) ( not ( = ?auto_6767 ?auto_6786 ) ) ( not ( = ?auto_6768 ?auto_6771 ) ) ( not ( = ?auto_6768 ?auto_6786 ) ) ( not ( = ?auto_6769 ?auto_6771 ) ) ( not ( = ?auto_6769 ?auto_6786 ) ) ( not ( = ?auto_6771 ?auto_6783 ) ) ( not ( = ?auto_6771 ?auto_6790 ) ) ( not ( = ?auto_6771 ?auto_6785 ) ) ( not ( = ?auto_6794 ?auto_6792 ) ) ( not ( = ?auto_6794 ?auto_6784 ) ) ( not ( = ?auto_6794 ?auto_6791 ) ) ( not ( = ?auto_6788 ?auto_6789 ) ) ( not ( = ?auto_6788 ?auto_6793 ) ) ( not ( = ?auto_6788 ?auto_6787 ) ) ( not ( = ?auto_6786 ?auto_6783 ) ) ( not ( = ?auto_6786 ?auto_6790 ) ) ( not ( = ?auto_6786 ?auto_6785 ) ) ( not ( = ?auto_6767 ?auto_6772 ) ) ( not ( = ?auto_6767 ?auto_6780 ) ) ( not ( = ?auto_6768 ?auto_6772 ) ) ( not ( = ?auto_6768 ?auto_6780 ) ) ( not ( = ?auto_6769 ?auto_6772 ) ) ( not ( = ?auto_6769 ?auto_6780 ) ) ( not ( = ?auto_6770 ?auto_6772 ) ) ( not ( = ?auto_6770 ?auto_6780 ) ) ( not ( = ?auto_6772 ?auto_6786 ) ) ( not ( = ?auto_6772 ?auto_6783 ) ) ( not ( = ?auto_6772 ?auto_6790 ) ) ( not ( = ?auto_6772 ?auto_6785 ) ) ( not ( = ?auto_6782 ?auto_6794 ) ) ( not ( = ?auto_6782 ?auto_6792 ) ) ( not ( = ?auto_6782 ?auto_6784 ) ) ( not ( = ?auto_6782 ?auto_6791 ) ) ( not ( = ?auto_6781 ?auto_6788 ) ) ( not ( = ?auto_6781 ?auto_6789 ) ) ( not ( = ?auto_6781 ?auto_6793 ) ) ( not ( = ?auto_6781 ?auto_6787 ) ) ( not ( = ?auto_6780 ?auto_6786 ) ) ( not ( = ?auto_6780 ?auto_6783 ) ) ( not ( = ?auto_6780 ?auto_6790 ) ) ( not ( = ?auto_6780 ?auto_6785 ) ) ( not ( = ?auto_6767 ?auto_6773 ) ) ( not ( = ?auto_6767 ?auto_6775 ) ) ( not ( = ?auto_6768 ?auto_6773 ) ) ( not ( = ?auto_6768 ?auto_6775 ) ) ( not ( = ?auto_6769 ?auto_6773 ) ) ( not ( = ?auto_6769 ?auto_6775 ) ) ( not ( = ?auto_6770 ?auto_6773 ) ) ( not ( = ?auto_6770 ?auto_6775 ) ) ( not ( = ?auto_6771 ?auto_6773 ) ) ( not ( = ?auto_6771 ?auto_6775 ) ) ( not ( = ?auto_6773 ?auto_6780 ) ) ( not ( = ?auto_6773 ?auto_6786 ) ) ( not ( = ?auto_6773 ?auto_6783 ) ) ( not ( = ?auto_6773 ?auto_6790 ) ) ( not ( = ?auto_6773 ?auto_6785 ) ) ( not ( = ?auto_6778 ?auto_6782 ) ) ( not ( = ?auto_6778 ?auto_6794 ) ) ( not ( = ?auto_6778 ?auto_6792 ) ) ( not ( = ?auto_6778 ?auto_6784 ) ) ( not ( = ?auto_6778 ?auto_6791 ) ) ( not ( = ?auto_6776 ?auto_6781 ) ) ( not ( = ?auto_6776 ?auto_6788 ) ) ( not ( = ?auto_6776 ?auto_6789 ) ) ( not ( = ?auto_6776 ?auto_6793 ) ) ( not ( = ?auto_6776 ?auto_6787 ) ) ( not ( = ?auto_6775 ?auto_6780 ) ) ( not ( = ?auto_6775 ?auto_6786 ) ) ( not ( = ?auto_6775 ?auto_6783 ) ) ( not ( = ?auto_6775 ?auto_6790 ) ) ( not ( = ?auto_6775 ?auto_6785 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_6767 ?auto_6768 ?auto_6769 ?auto_6770 ?auto_6771 ?auto_6772 )
      ( MAKE-1CRATE ?auto_6772 ?auto_6773 )
      ( MAKE-6CRATE-VERIFY ?auto_6767 ?auto_6768 ?auto_6769 ?auto_6770 ?auto_6771 ?auto_6772 ?auto_6773 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_6813 - SURFACE
      ?auto_6814 - SURFACE
      ?auto_6815 - SURFACE
      ?auto_6816 - SURFACE
      ?auto_6817 - SURFACE
      ?auto_6818 - SURFACE
      ?auto_6819 - SURFACE
      ?auto_6820 - SURFACE
    )
    :vars
    (
      ?auto_6825 - HOIST
      ?auto_6821 - PLACE
      ?auto_6826 - PLACE
      ?auto_6822 - HOIST
      ?auto_6824 - SURFACE
      ?auto_6838 - PLACE
      ?auto_6840 - HOIST
      ?auto_6843 - SURFACE
      ?auto_6831 - PLACE
      ?auto_6829 - HOIST
      ?auto_6828 - SURFACE
      ?auto_6832 - PLACE
      ?auto_6844 - HOIST
      ?auto_6834 - SURFACE
      ?auto_6837 - PLACE
      ?auto_6830 - HOIST
      ?auto_6839 - SURFACE
      ?auto_6833 - PLACE
      ?auto_6827 - HOIST
      ?auto_6835 - SURFACE
      ?auto_6842 - PLACE
      ?auto_6841 - HOIST
      ?auto_6836 - SURFACE
      ?auto_6823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6825 ?auto_6821 ) ( IS-CRATE ?auto_6820 ) ( not ( = ?auto_6826 ?auto_6821 ) ) ( HOIST-AT ?auto_6822 ?auto_6826 ) ( AVAILABLE ?auto_6822 ) ( SURFACE-AT ?auto_6820 ?auto_6826 ) ( ON ?auto_6820 ?auto_6824 ) ( CLEAR ?auto_6820 ) ( not ( = ?auto_6819 ?auto_6820 ) ) ( not ( = ?auto_6819 ?auto_6824 ) ) ( not ( = ?auto_6820 ?auto_6824 ) ) ( not ( = ?auto_6825 ?auto_6822 ) ) ( IS-CRATE ?auto_6819 ) ( not ( = ?auto_6838 ?auto_6821 ) ) ( HOIST-AT ?auto_6840 ?auto_6838 ) ( AVAILABLE ?auto_6840 ) ( SURFACE-AT ?auto_6819 ?auto_6838 ) ( ON ?auto_6819 ?auto_6843 ) ( CLEAR ?auto_6819 ) ( not ( = ?auto_6818 ?auto_6819 ) ) ( not ( = ?auto_6818 ?auto_6843 ) ) ( not ( = ?auto_6819 ?auto_6843 ) ) ( not ( = ?auto_6825 ?auto_6840 ) ) ( IS-CRATE ?auto_6818 ) ( not ( = ?auto_6831 ?auto_6821 ) ) ( HOIST-AT ?auto_6829 ?auto_6831 ) ( AVAILABLE ?auto_6829 ) ( SURFACE-AT ?auto_6818 ?auto_6831 ) ( ON ?auto_6818 ?auto_6828 ) ( CLEAR ?auto_6818 ) ( not ( = ?auto_6817 ?auto_6818 ) ) ( not ( = ?auto_6817 ?auto_6828 ) ) ( not ( = ?auto_6818 ?auto_6828 ) ) ( not ( = ?auto_6825 ?auto_6829 ) ) ( IS-CRATE ?auto_6817 ) ( not ( = ?auto_6832 ?auto_6821 ) ) ( HOIST-AT ?auto_6844 ?auto_6832 ) ( AVAILABLE ?auto_6844 ) ( SURFACE-AT ?auto_6817 ?auto_6832 ) ( ON ?auto_6817 ?auto_6834 ) ( CLEAR ?auto_6817 ) ( not ( = ?auto_6816 ?auto_6817 ) ) ( not ( = ?auto_6816 ?auto_6834 ) ) ( not ( = ?auto_6817 ?auto_6834 ) ) ( not ( = ?auto_6825 ?auto_6844 ) ) ( IS-CRATE ?auto_6816 ) ( not ( = ?auto_6837 ?auto_6821 ) ) ( HOIST-AT ?auto_6830 ?auto_6837 ) ( AVAILABLE ?auto_6830 ) ( SURFACE-AT ?auto_6816 ?auto_6837 ) ( ON ?auto_6816 ?auto_6839 ) ( CLEAR ?auto_6816 ) ( not ( = ?auto_6815 ?auto_6816 ) ) ( not ( = ?auto_6815 ?auto_6839 ) ) ( not ( = ?auto_6816 ?auto_6839 ) ) ( not ( = ?auto_6825 ?auto_6830 ) ) ( IS-CRATE ?auto_6815 ) ( not ( = ?auto_6833 ?auto_6821 ) ) ( HOIST-AT ?auto_6827 ?auto_6833 ) ( AVAILABLE ?auto_6827 ) ( SURFACE-AT ?auto_6815 ?auto_6833 ) ( ON ?auto_6815 ?auto_6835 ) ( CLEAR ?auto_6815 ) ( not ( = ?auto_6814 ?auto_6815 ) ) ( not ( = ?auto_6814 ?auto_6835 ) ) ( not ( = ?auto_6815 ?auto_6835 ) ) ( not ( = ?auto_6825 ?auto_6827 ) ) ( SURFACE-AT ?auto_6813 ?auto_6821 ) ( CLEAR ?auto_6813 ) ( IS-CRATE ?auto_6814 ) ( AVAILABLE ?auto_6825 ) ( not ( = ?auto_6842 ?auto_6821 ) ) ( HOIST-AT ?auto_6841 ?auto_6842 ) ( AVAILABLE ?auto_6841 ) ( SURFACE-AT ?auto_6814 ?auto_6842 ) ( ON ?auto_6814 ?auto_6836 ) ( CLEAR ?auto_6814 ) ( TRUCK-AT ?auto_6823 ?auto_6821 ) ( not ( = ?auto_6813 ?auto_6814 ) ) ( not ( = ?auto_6813 ?auto_6836 ) ) ( not ( = ?auto_6814 ?auto_6836 ) ) ( not ( = ?auto_6825 ?auto_6841 ) ) ( not ( = ?auto_6813 ?auto_6815 ) ) ( not ( = ?auto_6813 ?auto_6835 ) ) ( not ( = ?auto_6815 ?auto_6836 ) ) ( not ( = ?auto_6833 ?auto_6842 ) ) ( not ( = ?auto_6827 ?auto_6841 ) ) ( not ( = ?auto_6835 ?auto_6836 ) ) ( not ( = ?auto_6813 ?auto_6816 ) ) ( not ( = ?auto_6813 ?auto_6839 ) ) ( not ( = ?auto_6814 ?auto_6816 ) ) ( not ( = ?auto_6814 ?auto_6839 ) ) ( not ( = ?auto_6816 ?auto_6835 ) ) ( not ( = ?auto_6816 ?auto_6836 ) ) ( not ( = ?auto_6837 ?auto_6833 ) ) ( not ( = ?auto_6837 ?auto_6842 ) ) ( not ( = ?auto_6830 ?auto_6827 ) ) ( not ( = ?auto_6830 ?auto_6841 ) ) ( not ( = ?auto_6839 ?auto_6835 ) ) ( not ( = ?auto_6839 ?auto_6836 ) ) ( not ( = ?auto_6813 ?auto_6817 ) ) ( not ( = ?auto_6813 ?auto_6834 ) ) ( not ( = ?auto_6814 ?auto_6817 ) ) ( not ( = ?auto_6814 ?auto_6834 ) ) ( not ( = ?auto_6815 ?auto_6817 ) ) ( not ( = ?auto_6815 ?auto_6834 ) ) ( not ( = ?auto_6817 ?auto_6839 ) ) ( not ( = ?auto_6817 ?auto_6835 ) ) ( not ( = ?auto_6817 ?auto_6836 ) ) ( not ( = ?auto_6832 ?auto_6837 ) ) ( not ( = ?auto_6832 ?auto_6833 ) ) ( not ( = ?auto_6832 ?auto_6842 ) ) ( not ( = ?auto_6844 ?auto_6830 ) ) ( not ( = ?auto_6844 ?auto_6827 ) ) ( not ( = ?auto_6844 ?auto_6841 ) ) ( not ( = ?auto_6834 ?auto_6839 ) ) ( not ( = ?auto_6834 ?auto_6835 ) ) ( not ( = ?auto_6834 ?auto_6836 ) ) ( not ( = ?auto_6813 ?auto_6818 ) ) ( not ( = ?auto_6813 ?auto_6828 ) ) ( not ( = ?auto_6814 ?auto_6818 ) ) ( not ( = ?auto_6814 ?auto_6828 ) ) ( not ( = ?auto_6815 ?auto_6818 ) ) ( not ( = ?auto_6815 ?auto_6828 ) ) ( not ( = ?auto_6816 ?auto_6818 ) ) ( not ( = ?auto_6816 ?auto_6828 ) ) ( not ( = ?auto_6818 ?auto_6834 ) ) ( not ( = ?auto_6818 ?auto_6839 ) ) ( not ( = ?auto_6818 ?auto_6835 ) ) ( not ( = ?auto_6818 ?auto_6836 ) ) ( not ( = ?auto_6831 ?auto_6832 ) ) ( not ( = ?auto_6831 ?auto_6837 ) ) ( not ( = ?auto_6831 ?auto_6833 ) ) ( not ( = ?auto_6831 ?auto_6842 ) ) ( not ( = ?auto_6829 ?auto_6844 ) ) ( not ( = ?auto_6829 ?auto_6830 ) ) ( not ( = ?auto_6829 ?auto_6827 ) ) ( not ( = ?auto_6829 ?auto_6841 ) ) ( not ( = ?auto_6828 ?auto_6834 ) ) ( not ( = ?auto_6828 ?auto_6839 ) ) ( not ( = ?auto_6828 ?auto_6835 ) ) ( not ( = ?auto_6828 ?auto_6836 ) ) ( not ( = ?auto_6813 ?auto_6819 ) ) ( not ( = ?auto_6813 ?auto_6843 ) ) ( not ( = ?auto_6814 ?auto_6819 ) ) ( not ( = ?auto_6814 ?auto_6843 ) ) ( not ( = ?auto_6815 ?auto_6819 ) ) ( not ( = ?auto_6815 ?auto_6843 ) ) ( not ( = ?auto_6816 ?auto_6819 ) ) ( not ( = ?auto_6816 ?auto_6843 ) ) ( not ( = ?auto_6817 ?auto_6819 ) ) ( not ( = ?auto_6817 ?auto_6843 ) ) ( not ( = ?auto_6819 ?auto_6828 ) ) ( not ( = ?auto_6819 ?auto_6834 ) ) ( not ( = ?auto_6819 ?auto_6839 ) ) ( not ( = ?auto_6819 ?auto_6835 ) ) ( not ( = ?auto_6819 ?auto_6836 ) ) ( not ( = ?auto_6838 ?auto_6831 ) ) ( not ( = ?auto_6838 ?auto_6832 ) ) ( not ( = ?auto_6838 ?auto_6837 ) ) ( not ( = ?auto_6838 ?auto_6833 ) ) ( not ( = ?auto_6838 ?auto_6842 ) ) ( not ( = ?auto_6840 ?auto_6829 ) ) ( not ( = ?auto_6840 ?auto_6844 ) ) ( not ( = ?auto_6840 ?auto_6830 ) ) ( not ( = ?auto_6840 ?auto_6827 ) ) ( not ( = ?auto_6840 ?auto_6841 ) ) ( not ( = ?auto_6843 ?auto_6828 ) ) ( not ( = ?auto_6843 ?auto_6834 ) ) ( not ( = ?auto_6843 ?auto_6839 ) ) ( not ( = ?auto_6843 ?auto_6835 ) ) ( not ( = ?auto_6843 ?auto_6836 ) ) ( not ( = ?auto_6813 ?auto_6820 ) ) ( not ( = ?auto_6813 ?auto_6824 ) ) ( not ( = ?auto_6814 ?auto_6820 ) ) ( not ( = ?auto_6814 ?auto_6824 ) ) ( not ( = ?auto_6815 ?auto_6820 ) ) ( not ( = ?auto_6815 ?auto_6824 ) ) ( not ( = ?auto_6816 ?auto_6820 ) ) ( not ( = ?auto_6816 ?auto_6824 ) ) ( not ( = ?auto_6817 ?auto_6820 ) ) ( not ( = ?auto_6817 ?auto_6824 ) ) ( not ( = ?auto_6818 ?auto_6820 ) ) ( not ( = ?auto_6818 ?auto_6824 ) ) ( not ( = ?auto_6820 ?auto_6843 ) ) ( not ( = ?auto_6820 ?auto_6828 ) ) ( not ( = ?auto_6820 ?auto_6834 ) ) ( not ( = ?auto_6820 ?auto_6839 ) ) ( not ( = ?auto_6820 ?auto_6835 ) ) ( not ( = ?auto_6820 ?auto_6836 ) ) ( not ( = ?auto_6826 ?auto_6838 ) ) ( not ( = ?auto_6826 ?auto_6831 ) ) ( not ( = ?auto_6826 ?auto_6832 ) ) ( not ( = ?auto_6826 ?auto_6837 ) ) ( not ( = ?auto_6826 ?auto_6833 ) ) ( not ( = ?auto_6826 ?auto_6842 ) ) ( not ( = ?auto_6822 ?auto_6840 ) ) ( not ( = ?auto_6822 ?auto_6829 ) ) ( not ( = ?auto_6822 ?auto_6844 ) ) ( not ( = ?auto_6822 ?auto_6830 ) ) ( not ( = ?auto_6822 ?auto_6827 ) ) ( not ( = ?auto_6822 ?auto_6841 ) ) ( not ( = ?auto_6824 ?auto_6843 ) ) ( not ( = ?auto_6824 ?auto_6828 ) ) ( not ( = ?auto_6824 ?auto_6834 ) ) ( not ( = ?auto_6824 ?auto_6839 ) ) ( not ( = ?auto_6824 ?auto_6835 ) ) ( not ( = ?auto_6824 ?auto_6836 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_6813 ?auto_6814 ?auto_6815 ?auto_6816 ?auto_6817 ?auto_6818 ?auto_6819 )
      ( MAKE-1CRATE ?auto_6819 ?auto_6820 )
      ( MAKE-7CRATE-VERIFY ?auto_6813 ?auto_6814 ?auto_6815 ?auto_6816 ?auto_6817 ?auto_6818 ?auto_6819 ?auto_6820 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_6864 - SURFACE
      ?auto_6865 - SURFACE
      ?auto_6866 - SURFACE
      ?auto_6867 - SURFACE
      ?auto_6868 - SURFACE
      ?auto_6869 - SURFACE
      ?auto_6870 - SURFACE
      ?auto_6871 - SURFACE
      ?auto_6872 - SURFACE
    )
    :vars
    (
      ?auto_6875 - HOIST
      ?auto_6874 - PLACE
      ?auto_6877 - PLACE
      ?auto_6878 - HOIST
      ?auto_6873 - SURFACE
      ?auto_6884 - PLACE
      ?auto_6892 - HOIST
      ?auto_6897 - SURFACE
      ?auto_6899 - PLACE
      ?auto_6888 - HOIST
      ?auto_6885 - SURFACE
      ?auto_6886 - PLACE
      ?auto_6889 - HOIST
      ?auto_6893 - SURFACE
      ?auto_6890 - PLACE
      ?auto_6898 - HOIST
      ?auto_6891 - SURFACE
      ?auto_6895 - PLACE
      ?auto_6883 - HOIST
      ?auto_6881 - SURFACE
      ?auto_6894 - PLACE
      ?auto_6880 - HOIST
      ?auto_6896 - SURFACE
      ?auto_6887 - PLACE
      ?auto_6882 - HOIST
      ?auto_6879 - SURFACE
      ?auto_6876 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6875 ?auto_6874 ) ( IS-CRATE ?auto_6872 ) ( not ( = ?auto_6877 ?auto_6874 ) ) ( HOIST-AT ?auto_6878 ?auto_6877 ) ( AVAILABLE ?auto_6878 ) ( SURFACE-AT ?auto_6872 ?auto_6877 ) ( ON ?auto_6872 ?auto_6873 ) ( CLEAR ?auto_6872 ) ( not ( = ?auto_6871 ?auto_6872 ) ) ( not ( = ?auto_6871 ?auto_6873 ) ) ( not ( = ?auto_6872 ?auto_6873 ) ) ( not ( = ?auto_6875 ?auto_6878 ) ) ( IS-CRATE ?auto_6871 ) ( not ( = ?auto_6884 ?auto_6874 ) ) ( HOIST-AT ?auto_6892 ?auto_6884 ) ( AVAILABLE ?auto_6892 ) ( SURFACE-AT ?auto_6871 ?auto_6884 ) ( ON ?auto_6871 ?auto_6897 ) ( CLEAR ?auto_6871 ) ( not ( = ?auto_6870 ?auto_6871 ) ) ( not ( = ?auto_6870 ?auto_6897 ) ) ( not ( = ?auto_6871 ?auto_6897 ) ) ( not ( = ?auto_6875 ?auto_6892 ) ) ( IS-CRATE ?auto_6870 ) ( not ( = ?auto_6899 ?auto_6874 ) ) ( HOIST-AT ?auto_6888 ?auto_6899 ) ( AVAILABLE ?auto_6888 ) ( SURFACE-AT ?auto_6870 ?auto_6899 ) ( ON ?auto_6870 ?auto_6885 ) ( CLEAR ?auto_6870 ) ( not ( = ?auto_6869 ?auto_6870 ) ) ( not ( = ?auto_6869 ?auto_6885 ) ) ( not ( = ?auto_6870 ?auto_6885 ) ) ( not ( = ?auto_6875 ?auto_6888 ) ) ( IS-CRATE ?auto_6869 ) ( not ( = ?auto_6886 ?auto_6874 ) ) ( HOIST-AT ?auto_6889 ?auto_6886 ) ( AVAILABLE ?auto_6889 ) ( SURFACE-AT ?auto_6869 ?auto_6886 ) ( ON ?auto_6869 ?auto_6893 ) ( CLEAR ?auto_6869 ) ( not ( = ?auto_6868 ?auto_6869 ) ) ( not ( = ?auto_6868 ?auto_6893 ) ) ( not ( = ?auto_6869 ?auto_6893 ) ) ( not ( = ?auto_6875 ?auto_6889 ) ) ( IS-CRATE ?auto_6868 ) ( not ( = ?auto_6890 ?auto_6874 ) ) ( HOIST-AT ?auto_6898 ?auto_6890 ) ( AVAILABLE ?auto_6898 ) ( SURFACE-AT ?auto_6868 ?auto_6890 ) ( ON ?auto_6868 ?auto_6891 ) ( CLEAR ?auto_6868 ) ( not ( = ?auto_6867 ?auto_6868 ) ) ( not ( = ?auto_6867 ?auto_6891 ) ) ( not ( = ?auto_6868 ?auto_6891 ) ) ( not ( = ?auto_6875 ?auto_6898 ) ) ( IS-CRATE ?auto_6867 ) ( not ( = ?auto_6895 ?auto_6874 ) ) ( HOIST-AT ?auto_6883 ?auto_6895 ) ( AVAILABLE ?auto_6883 ) ( SURFACE-AT ?auto_6867 ?auto_6895 ) ( ON ?auto_6867 ?auto_6881 ) ( CLEAR ?auto_6867 ) ( not ( = ?auto_6866 ?auto_6867 ) ) ( not ( = ?auto_6866 ?auto_6881 ) ) ( not ( = ?auto_6867 ?auto_6881 ) ) ( not ( = ?auto_6875 ?auto_6883 ) ) ( IS-CRATE ?auto_6866 ) ( not ( = ?auto_6894 ?auto_6874 ) ) ( HOIST-AT ?auto_6880 ?auto_6894 ) ( AVAILABLE ?auto_6880 ) ( SURFACE-AT ?auto_6866 ?auto_6894 ) ( ON ?auto_6866 ?auto_6896 ) ( CLEAR ?auto_6866 ) ( not ( = ?auto_6865 ?auto_6866 ) ) ( not ( = ?auto_6865 ?auto_6896 ) ) ( not ( = ?auto_6866 ?auto_6896 ) ) ( not ( = ?auto_6875 ?auto_6880 ) ) ( SURFACE-AT ?auto_6864 ?auto_6874 ) ( CLEAR ?auto_6864 ) ( IS-CRATE ?auto_6865 ) ( AVAILABLE ?auto_6875 ) ( not ( = ?auto_6887 ?auto_6874 ) ) ( HOIST-AT ?auto_6882 ?auto_6887 ) ( AVAILABLE ?auto_6882 ) ( SURFACE-AT ?auto_6865 ?auto_6887 ) ( ON ?auto_6865 ?auto_6879 ) ( CLEAR ?auto_6865 ) ( TRUCK-AT ?auto_6876 ?auto_6874 ) ( not ( = ?auto_6864 ?auto_6865 ) ) ( not ( = ?auto_6864 ?auto_6879 ) ) ( not ( = ?auto_6865 ?auto_6879 ) ) ( not ( = ?auto_6875 ?auto_6882 ) ) ( not ( = ?auto_6864 ?auto_6866 ) ) ( not ( = ?auto_6864 ?auto_6896 ) ) ( not ( = ?auto_6866 ?auto_6879 ) ) ( not ( = ?auto_6894 ?auto_6887 ) ) ( not ( = ?auto_6880 ?auto_6882 ) ) ( not ( = ?auto_6896 ?auto_6879 ) ) ( not ( = ?auto_6864 ?auto_6867 ) ) ( not ( = ?auto_6864 ?auto_6881 ) ) ( not ( = ?auto_6865 ?auto_6867 ) ) ( not ( = ?auto_6865 ?auto_6881 ) ) ( not ( = ?auto_6867 ?auto_6896 ) ) ( not ( = ?auto_6867 ?auto_6879 ) ) ( not ( = ?auto_6895 ?auto_6894 ) ) ( not ( = ?auto_6895 ?auto_6887 ) ) ( not ( = ?auto_6883 ?auto_6880 ) ) ( not ( = ?auto_6883 ?auto_6882 ) ) ( not ( = ?auto_6881 ?auto_6896 ) ) ( not ( = ?auto_6881 ?auto_6879 ) ) ( not ( = ?auto_6864 ?auto_6868 ) ) ( not ( = ?auto_6864 ?auto_6891 ) ) ( not ( = ?auto_6865 ?auto_6868 ) ) ( not ( = ?auto_6865 ?auto_6891 ) ) ( not ( = ?auto_6866 ?auto_6868 ) ) ( not ( = ?auto_6866 ?auto_6891 ) ) ( not ( = ?auto_6868 ?auto_6881 ) ) ( not ( = ?auto_6868 ?auto_6896 ) ) ( not ( = ?auto_6868 ?auto_6879 ) ) ( not ( = ?auto_6890 ?auto_6895 ) ) ( not ( = ?auto_6890 ?auto_6894 ) ) ( not ( = ?auto_6890 ?auto_6887 ) ) ( not ( = ?auto_6898 ?auto_6883 ) ) ( not ( = ?auto_6898 ?auto_6880 ) ) ( not ( = ?auto_6898 ?auto_6882 ) ) ( not ( = ?auto_6891 ?auto_6881 ) ) ( not ( = ?auto_6891 ?auto_6896 ) ) ( not ( = ?auto_6891 ?auto_6879 ) ) ( not ( = ?auto_6864 ?auto_6869 ) ) ( not ( = ?auto_6864 ?auto_6893 ) ) ( not ( = ?auto_6865 ?auto_6869 ) ) ( not ( = ?auto_6865 ?auto_6893 ) ) ( not ( = ?auto_6866 ?auto_6869 ) ) ( not ( = ?auto_6866 ?auto_6893 ) ) ( not ( = ?auto_6867 ?auto_6869 ) ) ( not ( = ?auto_6867 ?auto_6893 ) ) ( not ( = ?auto_6869 ?auto_6891 ) ) ( not ( = ?auto_6869 ?auto_6881 ) ) ( not ( = ?auto_6869 ?auto_6896 ) ) ( not ( = ?auto_6869 ?auto_6879 ) ) ( not ( = ?auto_6886 ?auto_6890 ) ) ( not ( = ?auto_6886 ?auto_6895 ) ) ( not ( = ?auto_6886 ?auto_6894 ) ) ( not ( = ?auto_6886 ?auto_6887 ) ) ( not ( = ?auto_6889 ?auto_6898 ) ) ( not ( = ?auto_6889 ?auto_6883 ) ) ( not ( = ?auto_6889 ?auto_6880 ) ) ( not ( = ?auto_6889 ?auto_6882 ) ) ( not ( = ?auto_6893 ?auto_6891 ) ) ( not ( = ?auto_6893 ?auto_6881 ) ) ( not ( = ?auto_6893 ?auto_6896 ) ) ( not ( = ?auto_6893 ?auto_6879 ) ) ( not ( = ?auto_6864 ?auto_6870 ) ) ( not ( = ?auto_6864 ?auto_6885 ) ) ( not ( = ?auto_6865 ?auto_6870 ) ) ( not ( = ?auto_6865 ?auto_6885 ) ) ( not ( = ?auto_6866 ?auto_6870 ) ) ( not ( = ?auto_6866 ?auto_6885 ) ) ( not ( = ?auto_6867 ?auto_6870 ) ) ( not ( = ?auto_6867 ?auto_6885 ) ) ( not ( = ?auto_6868 ?auto_6870 ) ) ( not ( = ?auto_6868 ?auto_6885 ) ) ( not ( = ?auto_6870 ?auto_6893 ) ) ( not ( = ?auto_6870 ?auto_6891 ) ) ( not ( = ?auto_6870 ?auto_6881 ) ) ( not ( = ?auto_6870 ?auto_6896 ) ) ( not ( = ?auto_6870 ?auto_6879 ) ) ( not ( = ?auto_6899 ?auto_6886 ) ) ( not ( = ?auto_6899 ?auto_6890 ) ) ( not ( = ?auto_6899 ?auto_6895 ) ) ( not ( = ?auto_6899 ?auto_6894 ) ) ( not ( = ?auto_6899 ?auto_6887 ) ) ( not ( = ?auto_6888 ?auto_6889 ) ) ( not ( = ?auto_6888 ?auto_6898 ) ) ( not ( = ?auto_6888 ?auto_6883 ) ) ( not ( = ?auto_6888 ?auto_6880 ) ) ( not ( = ?auto_6888 ?auto_6882 ) ) ( not ( = ?auto_6885 ?auto_6893 ) ) ( not ( = ?auto_6885 ?auto_6891 ) ) ( not ( = ?auto_6885 ?auto_6881 ) ) ( not ( = ?auto_6885 ?auto_6896 ) ) ( not ( = ?auto_6885 ?auto_6879 ) ) ( not ( = ?auto_6864 ?auto_6871 ) ) ( not ( = ?auto_6864 ?auto_6897 ) ) ( not ( = ?auto_6865 ?auto_6871 ) ) ( not ( = ?auto_6865 ?auto_6897 ) ) ( not ( = ?auto_6866 ?auto_6871 ) ) ( not ( = ?auto_6866 ?auto_6897 ) ) ( not ( = ?auto_6867 ?auto_6871 ) ) ( not ( = ?auto_6867 ?auto_6897 ) ) ( not ( = ?auto_6868 ?auto_6871 ) ) ( not ( = ?auto_6868 ?auto_6897 ) ) ( not ( = ?auto_6869 ?auto_6871 ) ) ( not ( = ?auto_6869 ?auto_6897 ) ) ( not ( = ?auto_6871 ?auto_6885 ) ) ( not ( = ?auto_6871 ?auto_6893 ) ) ( not ( = ?auto_6871 ?auto_6891 ) ) ( not ( = ?auto_6871 ?auto_6881 ) ) ( not ( = ?auto_6871 ?auto_6896 ) ) ( not ( = ?auto_6871 ?auto_6879 ) ) ( not ( = ?auto_6884 ?auto_6899 ) ) ( not ( = ?auto_6884 ?auto_6886 ) ) ( not ( = ?auto_6884 ?auto_6890 ) ) ( not ( = ?auto_6884 ?auto_6895 ) ) ( not ( = ?auto_6884 ?auto_6894 ) ) ( not ( = ?auto_6884 ?auto_6887 ) ) ( not ( = ?auto_6892 ?auto_6888 ) ) ( not ( = ?auto_6892 ?auto_6889 ) ) ( not ( = ?auto_6892 ?auto_6898 ) ) ( not ( = ?auto_6892 ?auto_6883 ) ) ( not ( = ?auto_6892 ?auto_6880 ) ) ( not ( = ?auto_6892 ?auto_6882 ) ) ( not ( = ?auto_6897 ?auto_6885 ) ) ( not ( = ?auto_6897 ?auto_6893 ) ) ( not ( = ?auto_6897 ?auto_6891 ) ) ( not ( = ?auto_6897 ?auto_6881 ) ) ( not ( = ?auto_6897 ?auto_6896 ) ) ( not ( = ?auto_6897 ?auto_6879 ) ) ( not ( = ?auto_6864 ?auto_6872 ) ) ( not ( = ?auto_6864 ?auto_6873 ) ) ( not ( = ?auto_6865 ?auto_6872 ) ) ( not ( = ?auto_6865 ?auto_6873 ) ) ( not ( = ?auto_6866 ?auto_6872 ) ) ( not ( = ?auto_6866 ?auto_6873 ) ) ( not ( = ?auto_6867 ?auto_6872 ) ) ( not ( = ?auto_6867 ?auto_6873 ) ) ( not ( = ?auto_6868 ?auto_6872 ) ) ( not ( = ?auto_6868 ?auto_6873 ) ) ( not ( = ?auto_6869 ?auto_6872 ) ) ( not ( = ?auto_6869 ?auto_6873 ) ) ( not ( = ?auto_6870 ?auto_6872 ) ) ( not ( = ?auto_6870 ?auto_6873 ) ) ( not ( = ?auto_6872 ?auto_6897 ) ) ( not ( = ?auto_6872 ?auto_6885 ) ) ( not ( = ?auto_6872 ?auto_6893 ) ) ( not ( = ?auto_6872 ?auto_6891 ) ) ( not ( = ?auto_6872 ?auto_6881 ) ) ( not ( = ?auto_6872 ?auto_6896 ) ) ( not ( = ?auto_6872 ?auto_6879 ) ) ( not ( = ?auto_6877 ?auto_6884 ) ) ( not ( = ?auto_6877 ?auto_6899 ) ) ( not ( = ?auto_6877 ?auto_6886 ) ) ( not ( = ?auto_6877 ?auto_6890 ) ) ( not ( = ?auto_6877 ?auto_6895 ) ) ( not ( = ?auto_6877 ?auto_6894 ) ) ( not ( = ?auto_6877 ?auto_6887 ) ) ( not ( = ?auto_6878 ?auto_6892 ) ) ( not ( = ?auto_6878 ?auto_6888 ) ) ( not ( = ?auto_6878 ?auto_6889 ) ) ( not ( = ?auto_6878 ?auto_6898 ) ) ( not ( = ?auto_6878 ?auto_6883 ) ) ( not ( = ?auto_6878 ?auto_6880 ) ) ( not ( = ?auto_6878 ?auto_6882 ) ) ( not ( = ?auto_6873 ?auto_6897 ) ) ( not ( = ?auto_6873 ?auto_6885 ) ) ( not ( = ?auto_6873 ?auto_6893 ) ) ( not ( = ?auto_6873 ?auto_6891 ) ) ( not ( = ?auto_6873 ?auto_6881 ) ) ( not ( = ?auto_6873 ?auto_6896 ) ) ( not ( = ?auto_6873 ?auto_6879 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_6864 ?auto_6865 ?auto_6866 ?auto_6867 ?auto_6868 ?auto_6869 ?auto_6870 ?auto_6871 )
      ( MAKE-1CRATE ?auto_6871 ?auto_6872 )
      ( MAKE-8CRATE-VERIFY ?auto_6864 ?auto_6865 ?auto_6866 ?auto_6867 ?auto_6868 ?auto_6869 ?auto_6870 ?auto_6871 ?auto_6872 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_6920 - SURFACE
      ?auto_6921 - SURFACE
      ?auto_6922 - SURFACE
      ?auto_6923 - SURFACE
      ?auto_6924 - SURFACE
      ?auto_6925 - SURFACE
      ?auto_6926 - SURFACE
      ?auto_6927 - SURFACE
      ?auto_6928 - SURFACE
      ?auto_6929 - SURFACE
    )
    :vars
    (
      ?auto_6933 - HOIST
      ?auto_6935 - PLACE
      ?auto_6934 - PLACE
      ?auto_6930 - HOIST
      ?auto_6931 - SURFACE
      ?auto_6959 - PLACE
      ?auto_6958 - HOIST
      ?auto_6957 - SURFACE
      ?auto_6948 - PLACE
      ?auto_6941 - HOIST
      ?auto_6944 - SURFACE
      ?auto_6945 - PLACE
      ?auto_6951 - HOIST
      ?auto_6947 - SURFACE
      ?auto_6943 - PLACE
      ?auto_6955 - HOIST
      ?auto_6954 - SURFACE
      ?auto_6938 - PLACE
      ?auto_6956 - HOIST
      ?auto_6942 - SURFACE
      ?auto_6952 - PLACE
      ?auto_6946 - HOIST
      ?auto_6937 - SURFACE
      ?auto_6949 - PLACE
      ?auto_6940 - HOIST
      ?auto_6953 - SURFACE
      ?auto_6950 - PLACE
      ?auto_6936 - HOIST
      ?auto_6939 - SURFACE
      ?auto_6932 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6933 ?auto_6935 ) ( IS-CRATE ?auto_6929 ) ( not ( = ?auto_6934 ?auto_6935 ) ) ( HOIST-AT ?auto_6930 ?auto_6934 ) ( AVAILABLE ?auto_6930 ) ( SURFACE-AT ?auto_6929 ?auto_6934 ) ( ON ?auto_6929 ?auto_6931 ) ( CLEAR ?auto_6929 ) ( not ( = ?auto_6928 ?auto_6929 ) ) ( not ( = ?auto_6928 ?auto_6931 ) ) ( not ( = ?auto_6929 ?auto_6931 ) ) ( not ( = ?auto_6933 ?auto_6930 ) ) ( IS-CRATE ?auto_6928 ) ( not ( = ?auto_6959 ?auto_6935 ) ) ( HOIST-AT ?auto_6958 ?auto_6959 ) ( AVAILABLE ?auto_6958 ) ( SURFACE-AT ?auto_6928 ?auto_6959 ) ( ON ?auto_6928 ?auto_6957 ) ( CLEAR ?auto_6928 ) ( not ( = ?auto_6927 ?auto_6928 ) ) ( not ( = ?auto_6927 ?auto_6957 ) ) ( not ( = ?auto_6928 ?auto_6957 ) ) ( not ( = ?auto_6933 ?auto_6958 ) ) ( IS-CRATE ?auto_6927 ) ( not ( = ?auto_6948 ?auto_6935 ) ) ( HOIST-AT ?auto_6941 ?auto_6948 ) ( AVAILABLE ?auto_6941 ) ( SURFACE-AT ?auto_6927 ?auto_6948 ) ( ON ?auto_6927 ?auto_6944 ) ( CLEAR ?auto_6927 ) ( not ( = ?auto_6926 ?auto_6927 ) ) ( not ( = ?auto_6926 ?auto_6944 ) ) ( not ( = ?auto_6927 ?auto_6944 ) ) ( not ( = ?auto_6933 ?auto_6941 ) ) ( IS-CRATE ?auto_6926 ) ( not ( = ?auto_6945 ?auto_6935 ) ) ( HOIST-AT ?auto_6951 ?auto_6945 ) ( AVAILABLE ?auto_6951 ) ( SURFACE-AT ?auto_6926 ?auto_6945 ) ( ON ?auto_6926 ?auto_6947 ) ( CLEAR ?auto_6926 ) ( not ( = ?auto_6925 ?auto_6926 ) ) ( not ( = ?auto_6925 ?auto_6947 ) ) ( not ( = ?auto_6926 ?auto_6947 ) ) ( not ( = ?auto_6933 ?auto_6951 ) ) ( IS-CRATE ?auto_6925 ) ( not ( = ?auto_6943 ?auto_6935 ) ) ( HOIST-AT ?auto_6955 ?auto_6943 ) ( AVAILABLE ?auto_6955 ) ( SURFACE-AT ?auto_6925 ?auto_6943 ) ( ON ?auto_6925 ?auto_6954 ) ( CLEAR ?auto_6925 ) ( not ( = ?auto_6924 ?auto_6925 ) ) ( not ( = ?auto_6924 ?auto_6954 ) ) ( not ( = ?auto_6925 ?auto_6954 ) ) ( not ( = ?auto_6933 ?auto_6955 ) ) ( IS-CRATE ?auto_6924 ) ( not ( = ?auto_6938 ?auto_6935 ) ) ( HOIST-AT ?auto_6956 ?auto_6938 ) ( AVAILABLE ?auto_6956 ) ( SURFACE-AT ?auto_6924 ?auto_6938 ) ( ON ?auto_6924 ?auto_6942 ) ( CLEAR ?auto_6924 ) ( not ( = ?auto_6923 ?auto_6924 ) ) ( not ( = ?auto_6923 ?auto_6942 ) ) ( not ( = ?auto_6924 ?auto_6942 ) ) ( not ( = ?auto_6933 ?auto_6956 ) ) ( IS-CRATE ?auto_6923 ) ( not ( = ?auto_6952 ?auto_6935 ) ) ( HOIST-AT ?auto_6946 ?auto_6952 ) ( AVAILABLE ?auto_6946 ) ( SURFACE-AT ?auto_6923 ?auto_6952 ) ( ON ?auto_6923 ?auto_6937 ) ( CLEAR ?auto_6923 ) ( not ( = ?auto_6922 ?auto_6923 ) ) ( not ( = ?auto_6922 ?auto_6937 ) ) ( not ( = ?auto_6923 ?auto_6937 ) ) ( not ( = ?auto_6933 ?auto_6946 ) ) ( IS-CRATE ?auto_6922 ) ( not ( = ?auto_6949 ?auto_6935 ) ) ( HOIST-AT ?auto_6940 ?auto_6949 ) ( AVAILABLE ?auto_6940 ) ( SURFACE-AT ?auto_6922 ?auto_6949 ) ( ON ?auto_6922 ?auto_6953 ) ( CLEAR ?auto_6922 ) ( not ( = ?auto_6921 ?auto_6922 ) ) ( not ( = ?auto_6921 ?auto_6953 ) ) ( not ( = ?auto_6922 ?auto_6953 ) ) ( not ( = ?auto_6933 ?auto_6940 ) ) ( SURFACE-AT ?auto_6920 ?auto_6935 ) ( CLEAR ?auto_6920 ) ( IS-CRATE ?auto_6921 ) ( AVAILABLE ?auto_6933 ) ( not ( = ?auto_6950 ?auto_6935 ) ) ( HOIST-AT ?auto_6936 ?auto_6950 ) ( AVAILABLE ?auto_6936 ) ( SURFACE-AT ?auto_6921 ?auto_6950 ) ( ON ?auto_6921 ?auto_6939 ) ( CLEAR ?auto_6921 ) ( TRUCK-AT ?auto_6932 ?auto_6935 ) ( not ( = ?auto_6920 ?auto_6921 ) ) ( not ( = ?auto_6920 ?auto_6939 ) ) ( not ( = ?auto_6921 ?auto_6939 ) ) ( not ( = ?auto_6933 ?auto_6936 ) ) ( not ( = ?auto_6920 ?auto_6922 ) ) ( not ( = ?auto_6920 ?auto_6953 ) ) ( not ( = ?auto_6922 ?auto_6939 ) ) ( not ( = ?auto_6949 ?auto_6950 ) ) ( not ( = ?auto_6940 ?auto_6936 ) ) ( not ( = ?auto_6953 ?auto_6939 ) ) ( not ( = ?auto_6920 ?auto_6923 ) ) ( not ( = ?auto_6920 ?auto_6937 ) ) ( not ( = ?auto_6921 ?auto_6923 ) ) ( not ( = ?auto_6921 ?auto_6937 ) ) ( not ( = ?auto_6923 ?auto_6953 ) ) ( not ( = ?auto_6923 ?auto_6939 ) ) ( not ( = ?auto_6952 ?auto_6949 ) ) ( not ( = ?auto_6952 ?auto_6950 ) ) ( not ( = ?auto_6946 ?auto_6940 ) ) ( not ( = ?auto_6946 ?auto_6936 ) ) ( not ( = ?auto_6937 ?auto_6953 ) ) ( not ( = ?auto_6937 ?auto_6939 ) ) ( not ( = ?auto_6920 ?auto_6924 ) ) ( not ( = ?auto_6920 ?auto_6942 ) ) ( not ( = ?auto_6921 ?auto_6924 ) ) ( not ( = ?auto_6921 ?auto_6942 ) ) ( not ( = ?auto_6922 ?auto_6924 ) ) ( not ( = ?auto_6922 ?auto_6942 ) ) ( not ( = ?auto_6924 ?auto_6937 ) ) ( not ( = ?auto_6924 ?auto_6953 ) ) ( not ( = ?auto_6924 ?auto_6939 ) ) ( not ( = ?auto_6938 ?auto_6952 ) ) ( not ( = ?auto_6938 ?auto_6949 ) ) ( not ( = ?auto_6938 ?auto_6950 ) ) ( not ( = ?auto_6956 ?auto_6946 ) ) ( not ( = ?auto_6956 ?auto_6940 ) ) ( not ( = ?auto_6956 ?auto_6936 ) ) ( not ( = ?auto_6942 ?auto_6937 ) ) ( not ( = ?auto_6942 ?auto_6953 ) ) ( not ( = ?auto_6942 ?auto_6939 ) ) ( not ( = ?auto_6920 ?auto_6925 ) ) ( not ( = ?auto_6920 ?auto_6954 ) ) ( not ( = ?auto_6921 ?auto_6925 ) ) ( not ( = ?auto_6921 ?auto_6954 ) ) ( not ( = ?auto_6922 ?auto_6925 ) ) ( not ( = ?auto_6922 ?auto_6954 ) ) ( not ( = ?auto_6923 ?auto_6925 ) ) ( not ( = ?auto_6923 ?auto_6954 ) ) ( not ( = ?auto_6925 ?auto_6942 ) ) ( not ( = ?auto_6925 ?auto_6937 ) ) ( not ( = ?auto_6925 ?auto_6953 ) ) ( not ( = ?auto_6925 ?auto_6939 ) ) ( not ( = ?auto_6943 ?auto_6938 ) ) ( not ( = ?auto_6943 ?auto_6952 ) ) ( not ( = ?auto_6943 ?auto_6949 ) ) ( not ( = ?auto_6943 ?auto_6950 ) ) ( not ( = ?auto_6955 ?auto_6956 ) ) ( not ( = ?auto_6955 ?auto_6946 ) ) ( not ( = ?auto_6955 ?auto_6940 ) ) ( not ( = ?auto_6955 ?auto_6936 ) ) ( not ( = ?auto_6954 ?auto_6942 ) ) ( not ( = ?auto_6954 ?auto_6937 ) ) ( not ( = ?auto_6954 ?auto_6953 ) ) ( not ( = ?auto_6954 ?auto_6939 ) ) ( not ( = ?auto_6920 ?auto_6926 ) ) ( not ( = ?auto_6920 ?auto_6947 ) ) ( not ( = ?auto_6921 ?auto_6926 ) ) ( not ( = ?auto_6921 ?auto_6947 ) ) ( not ( = ?auto_6922 ?auto_6926 ) ) ( not ( = ?auto_6922 ?auto_6947 ) ) ( not ( = ?auto_6923 ?auto_6926 ) ) ( not ( = ?auto_6923 ?auto_6947 ) ) ( not ( = ?auto_6924 ?auto_6926 ) ) ( not ( = ?auto_6924 ?auto_6947 ) ) ( not ( = ?auto_6926 ?auto_6954 ) ) ( not ( = ?auto_6926 ?auto_6942 ) ) ( not ( = ?auto_6926 ?auto_6937 ) ) ( not ( = ?auto_6926 ?auto_6953 ) ) ( not ( = ?auto_6926 ?auto_6939 ) ) ( not ( = ?auto_6945 ?auto_6943 ) ) ( not ( = ?auto_6945 ?auto_6938 ) ) ( not ( = ?auto_6945 ?auto_6952 ) ) ( not ( = ?auto_6945 ?auto_6949 ) ) ( not ( = ?auto_6945 ?auto_6950 ) ) ( not ( = ?auto_6951 ?auto_6955 ) ) ( not ( = ?auto_6951 ?auto_6956 ) ) ( not ( = ?auto_6951 ?auto_6946 ) ) ( not ( = ?auto_6951 ?auto_6940 ) ) ( not ( = ?auto_6951 ?auto_6936 ) ) ( not ( = ?auto_6947 ?auto_6954 ) ) ( not ( = ?auto_6947 ?auto_6942 ) ) ( not ( = ?auto_6947 ?auto_6937 ) ) ( not ( = ?auto_6947 ?auto_6953 ) ) ( not ( = ?auto_6947 ?auto_6939 ) ) ( not ( = ?auto_6920 ?auto_6927 ) ) ( not ( = ?auto_6920 ?auto_6944 ) ) ( not ( = ?auto_6921 ?auto_6927 ) ) ( not ( = ?auto_6921 ?auto_6944 ) ) ( not ( = ?auto_6922 ?auto_6927 ) ) ( not ( = ?auto_6922 ?auto_6944 ) ) ( not ( = ?auto_6923 ?auto_6927 ) ) ( not ( = ?auto_6923 ?auto_6944 ) ) ( not ( = ?auto_6924 ?auto_6927 ) ) ( not ( = ?auto_6924 ?auto_6944 ) ) ( not ( = ?auto_6925 ?auto_6927 ) ) ( not ( = ?auto_6925 ?auto_6944 ) ) ( not ( = ?auto_6927 ?auto_6947 ) ) ( not ( = ?auto_6927 ?auto_6954 ) ) ( not ( = ?auto_6927 ?auto_6942 ) ) ( not ( = ?auto_6927 ?auto_6937 ) ) ( not ( = ?auto_6927 ?auto_6953 ) ) ( not ( = ?auto_6927 ?auto_6939 ) ) ( not ( = ?auto_6948 ?auto_6945 ) ) ( not ( = ?auto_6948 ?auto_6943 ) ) ( not ( = ?auto_6948 ?auto_6938 ) ) ( not ( = ?auto_6948 ?auto_6952 ) ) ( not ( = ?auto_6948 ?auto_6949 ) ) ( not ( = ?auto_6948 ?auto_6950 ) ) ( not ( = ?auto_6941 ?auto_6951 ) ) ( not ( = ?auto_6941 ?auto_6955 ) ) ( not ( = ?auto_6941 ?auto_6956 ) ) ( not ( = ?auto_6941 ?auto_6946 ) ) ( not ( = ?auto_6941 ?auto_6940 ) ) ( not ( = ?auto_6941 ?auto_6936 ) ) ( not ( = ?auto_6944 ?auto_6947 ) ) ( not ( = ?auto_6944 ?auto_6954 ) ) ( not ( = ?auto_6944 ?auto_6942 ) ) ( not ( = ?auto_6944 ?auto_6937 ) ) ( not ( = ?auto_6944 ?auto_6953 ) ) ( not ( = ?auto_6944 ?auto_6939 ) ) ( not ( = ?auto_6920 ?auto_6928 ) ) ( not ( = ?auto_6920 ?auto_6957 ) ) ( not ( = ?auto_6921 ?auto_6928 ) ) ( not ( = ?auto_6921 ?auto_6957 ) ) ( not ( = ?auto_6922 ?auto_6928 ) ) ( not ( = ?auto_6922 ?auto_6957 ) ) ( not ( = ?auto_6923 ?auto_6928 ) ) ( not ( = ?auto_6923 ?auto_6957 ) ) ( not ( = ?auto_6924 ?auto_6928 ) ) ( not ( = ?auto_6924 ?auto_6957 ) ) ( not ( = ?auto_6925 ?auto_6928 ) ) ( not ( = ?auto_6925 ?auto_6957 ) ) ( not ( = ?auto_6926 ?auto_6928 ) ) ( not ( = ?auto_6926 ?auto_6957 ) ) ( not ( = ?auto_6928 ?auto_6944 ) ) ( not ( = ?auto_6928 ?auto_6947 ) ) ( not ( = ?auto_6928 ?auto_6954 ) ) ( not ( = ?auto_6928 ?auto_6942 ) ) ( not ( = ?auto_6928 ?auto_6937 ) ) ( not ( = ?auto_6928 ?auto_6953 ) ) ( not ( = ?auto_6928 ?auto_6939 ) ) ( not ( = ?auto_6959 ?auto_6948 ) ) ( not ( = ?auto_6959 ?auto_6945 ) ) ( not ( = ?auto_6959 ?auto_6943 ) ) ( not ( = ?auto_6959 ?auto_6938 ) ) ( not ( = ?auto_6959 ?auto_6952 ) ) ( not ( = ?auto_6959 ?auto_6949 ) ) ( not ( = ?auto_6959 ?auto_6950 ) ) ( not ( = ?auto_6958 ?auto_6941 ) ) ( not ( = ?auto_6958 ?auto_6951 ) ) ( not ( = ?auto_6958 ?auto_6955 ) ) ( not ( = ?auto_6958 ?auto_6956 ) ) ( not ( = ?auto_6958 ?auto_6946 ) ) ( not ( = ?auto_6958 ?auto_6940 ) ) ( not ( = ?auto_6958 ?auto_6936 ) ) ( not ( = ?auto_6957 ?auto_6944 ) ) ( not ( = ?auto_6957 ?auto_6947 ) ) ( not ( = ?auto_6957 ?auto_6954 ) ) ( not ( = ?auto_6957 ?auto_6942 ) ) ( not ( = ?auto_6957 ?auto_6937 ) ) ( not ( = ?auto_6957 ?auto_6953 ) ) ( not ( = ?auto_6957 ?auto_6939 ) ) ( not ( = ?auto_6920 ?auto_6929 ) ) ( not ( = ?auto_6920 ?auto_6931 ) ) ( not ( = ?auto_6921 ?auto_6929 ) ) ( not ( = ?auto_6921 ?auto_6931 ) ) ( not ( = ?auto_6922 ?auto_6929 ) ) ( not ( = ?auto_6922 ?auto_6931 ) ) ( not ( = ?auto_6923 ?auto_6929 ) ) ( not ( = ?auto_6923 ?auto_6931 ) ) ( not ( = ?auto_6924 ?auto_6929 ) ) ( not ( = ?auto_6924 ?auto_6931 ) ) ( not ( = ?auto_6925 ?auto_6929 ) ) ( not ( = ?auto_6925 ?auto_6931 ) ) ( not ( = ?auto_6926 ?auto_6929 ) ) ( not ( = ?auto_6926 ?auto_6931 ) ) ( not ( = ?auto_6927 ?auto_6929 ) ) ( not ( = ?auto_6927 ?auto_6931 ) ) ( not ( = ?auto_6929 ?auto_6957 ) ) ( not ( = ?auto_6929 ?auto_6944 ) ) ( not ( = ?auto_6929 ?auto_6947 ) ) ( not ( = ?auto_6929 ?auto_6954 ) ) ( not ( = ?auto_6929 ?auto_6942 ) ) ( not ( = ?auto_6929 ?auto_6937 ) ) ( not ( = ?auto_6929 ?auto_6953 ) ) ( not ( = ?auto_6929 ?auto_6939 ) ) ( not ( = ?auto_6934 ?auto_6959 ) ) ( not ( = ?auto_6934 ?auto_6948 ) ) ( not ( = ?auto_6934 ?auto_6945 ) ) ( not ( = ?auto_6934 ?auto_6943 ) ) ( not ( = ?auto_6934 ?auto_6938 ) ) ( not ( = ?auto_6934 ?auto_6952 ) ) ( not ( = ?auto_6934 ?auto_6949 ) ) ( not ( = ?auto_6934 ?auto_6950 ) ) ( not ( = ?auto_6930 ?auto_6958 ) ) ( not ( = ?auto_6930 ?auto_6941 ) ) ( not ( = ?auto_6930 ?auto_6951 ) ) ( not ( = ?auto_6930 ?auto_6955 ) ) ( not ( = ?auto_6930 ?auto_6956 ) ) ( not ( = ?auto_6930 ?auto_6946 ) ) ( not ( = ?auto_6930 ?auto_6940 ) ) ( not ( = ?auto_6930 ?auto_6936 ) ) ( not ( = ?auto_6931 ?auto_6957 ) ) ( not ( = ?auto_6931 ?auto_6944 ) ) ( not ( = ?auto_6931 ?auto_6947 ) ) ( not ( = ?auto_6931 ?auto_6954 ) ) ( not ( = ?auto_6931 ?auto_6942 ) ) ( not ( = ?auto_6931 ?auto_6937 ) ) ( not ( = ?auto_6931 ?auto_6953 ) ) ( not ( = ?auto_6931 ?auto_6939 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_6920 ?auto_6921 ?auto_6922 ?auto_6923 ?auto_6924 ?auto_6925 ?auto_6926 ?auto_6927 ?auto_6928 )
      ( MAKE-1CRATE ?auto_6928 ?auto_6929 )
      ( MAKE-9CRATE-VERIFY ?auto_6920 ?auto_6921 ?auto_6922 ?auto_6923 ?auto_6924 ?auto_6925 ?auto_6926 ?auto_6927 ?auto_6928 ?auto_6929 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_6981 - SURFACE
      ?auto_6982 - SURFACE
      ?auto_6983 - SURFACE
      ?auto_6984 - SURFACE
      ?auto_6985 - SURFACE
      ?auto_6986 - SURFACE
      ?auto_6987 - SURFACE
      ?auto_6988 - SURFACE
      ?auto_6989 - SURFACE
      ?auto_6990 - SURFACE
      ?auto_6991 - SURFACE
    )
    :vars
    (
      ?auto_6992 - HOIST
      ?auto_6995 - PLACE
      ?auto_6996 - PLACE
      ?auto_6994 - HOIST
      ?auto_6993 - SURFACE
      ?auto_7020 - SURFACE
      ?auto_7007 - PLACE
      ?auto_7011 - HOIST
      ?auto_7002 - SURFACE
      ?auto_6999 - PLACE
      ?auto_7004 - HOIST
      ?auto_7003 - SURFACE
      ?auto_7000 - PLACE
      ?auto_7005 - HOIST
      ?auto_7014 - SURFACE
      ?auto_7013 - PLACE
      ?auto_7019 - HOIST
      ?auto_7010 - SURFACE
      ?auto_7008 - PLACE
      ?auto_7006 - HOIST
      ?auto_7017 - SURFACE
      ?auto_7001 - PLACE
      ?auto_6998 - HOIST
      ?auto_7022 - SURFACE
      ?auto_7012 - PLACE
      ?auto_7009 - HOIST
      ?auto_7015 - SURFACE
      ?auto_7016 - PLACE
      ?auto_7021 - HOIST
      ?auto_7018 - SURFACE
      ?auto_6997 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6992 ?auto_6995 ) ( IS-CRATE ?auto_6991 ) ( not ( = ?auto_6996 ?auto_6995 ) ) ( HOIST-AT ?auto_6994 ?auto_6996 ) ( SURFACE-AT ?auto_6991 ?auto_6996 ) ( ON ?auto_6991 ?auto_6993 ) ( CLEAR ?auto_6991 ) ( not ( = ?auto_6990 ?auto_6991 ) ) ( not ( = ?auto_6990 ?auto_6993 ) ) ( not ( = ?auto_6991 ?auto_6993 ) ) ( not ( = ?auto_6992 ?auto_6994 ) ) ( IS-CRATE ?auto_6990 ) ( AVAILABLE ?auto_6994 ) ( SURFACE-AT ?auto_6990 ?auto_6996 ) ( ON ?auto_6990 ?auto_7020 ) ( CLEAR ?auto_6990 ) ( not ( = ?auto_6989 ?auto_6990 ) ) ( not ( = ?auto_6989 ?auto_7020 ) ) ( not ( = ?auto_6990 ?auto_7020 ) ) ( IS-CRATE ?auto_6989 ) ( not ( = ?auto_7007 ?auto_6995 ) ) ( HOIST-AT ?auto_7011 ?auto_7007 ) ( AVAILABLE ?auto_7011 ) ( SURFACE-AT ?auto_6989 ?auto_7007 ) ( ON ?auto_6989 ?auto_7002 ) ( CLEAR ?auto_6989 ) ( not ( = ?auto_6988 ?auto_6989 ) ) ( not ( = ?auto_6988 ?auto_7002 ) ) ( not ( = ?auto_6989 ?auto_7002 ) ) ( not ( = ?auto_6992 ?auto_7011 ) ) ( IS-CRATE ?auto_6988 ) ( not ( = ?auto_6999 ?auto_6995 ) ) ( HOIST-AT ?auto_7004 ?auto_6999 ) ( AVAILABLE ?auto_7004 ) ( SURFACE-AT ?auto_6988 ?auto_6999 ) ( ON ?auto_6988 ?auto_7003 ) ( CLEAR ?auto_6988 ) ( not ( = ?auto_6987 ?auto_6988 ) ) ( not ( = ?auto_6987 ?auto_7003 ) ) ( not ( = ?auto_6988 ?auto_7003 ) ) ( not ( = ?auto_6992 ?auto_7004 ) ) ( IS-CRATE ?auto_6987 ) ( not ( = ?auto_7000 ?auto_6995 ) ) ( HOIST-AT ?auto_7005 ?auto_7000 ) ( AVAILABLE ?auto_7005 ) ( SURFACE-AT ?auto_6987 ?auto_7000 ) ( ON ?auto_6987 ?auto_7014 ) ( CLEAR ?auto_6987 ) ( not ( = ?auto_6986 ?auto_6987 ) ) ( not ( = ?auto_6986 ?auto_7014 ) ) ( not ( = ?auto_6987 ?auto_7014 ) ) ( not ( = ?auto_6992 ?auto_7005 ) ) ( IS-CRATE ?auto_6986 ) ( not ( = ?auto_7013 ?auto_6995 ) ) ( HOIST-AT ?auto_7019 ?auto_7013 ) ( AVAILABLE ?auto_7019 ) ( SURFACE-AT ?auto_6986 ?auto_7013 ) ( ON ?auto_6986 ?auto_7010 ) ( CLEAR ?auto_6986 ) ( not ( = ?auto_6985 ?auto_6986 ) ) ( not ( = ?auto_6985 ?auto_7010 ) ) ( not ( = ?auto_6986 ?auto_7010 ) ) ( not ( = ?auto_6992 ?auto_7019 ) ) ( IS-CRATE ?auto_6985 ) ( not ( = ?auto_7008 ?auto_6995 ) ) ( HOIST-AT ?auto_7006 ?auto_7008 ) ( AVAILABLE ?auto_7006 ) ( SURFACE-AT ?auto_6985 ?auto_7008 ) ( ON ?auto_6985 ?auto_7017 ) ( CLEAR ?auto_6985 ) ( not ( = ?auto_6984 ?auto_6985 ) ) ( not ( = ?auto_6984 ?auto_7017 ) ) ( not ( = ?auto_6985 ?auto_7017 ) ) ( not ( = ?auto_6992 ?auto_7006 ) ) ( IS-CRATE ?auto_6984 ) ( not ( = ?auto_7001 ?auto_6995 ) ) ( HOIST-AT ?auto_6998 ?auto_7001 ) ( AVAILABLE ?auto_6998 ) ( SURFACE-AT ?auto_6984 ?auto_7001 ) ( ON ?auto_6984 ?auto_7022 ) ( CLEAR ?auto_6984 ) ( not ( = ?auto_6983 ?auto_6984 ) ) ( not ( = ?auto_6983 ?auto_7022 ) ) ( not ( = ?auto_6984 ?auto_7022 ) ) ( not ( = ?auto_6992 ?auto_6998 ) ) ( IS-CRATE ?auto_6983 ) ( not ( = ?auto_7012 ?auto_6995 ) ) ( HOIST-AT ?auto_7009 ?auto_7012 ) ( AVAILABLE ?auto_7009 ) ( SURFACE-AT ?auto_6983 ?auto_7012 ) ( ON ?auto_6983 ?auto_7015 ) ( CLEAR ?auto_6983 ) ( not ( = ?auto_6982 ?auto_6983 ) ) ( not ( = ?auto_6982 ?auto_7015 ) ) ( not ( = ?auto_6983 ?auto_7015 ) ) ( not ( = ?auto_6992 ?auto_7009 ) ) ( SURFACE-AT ?auto_6981 ?auto_6995 ) ( CLEAR ?auto_6981 ) ( IS-CRATE ?auto_6982 ) ( AVAILABLE ?auto_6992 ) ( not ( = ?auto_7016 ?auto_6995 ) ) ( HOIST-AT ?auto_7021 ?auto_7016 ) ( AVAILABLE ?auto_7021 ) ( SURFACE-AT ?auto_6982 ?auto_7016 ) ( ON ?auto_6982 ?auto_7018 ) ( CLEAR ?auto_6982 ) ( TRUCK-AT ?auto_6997 ?auto_6995 ) ( not ( = ?auto_6981 ?auto_6982 ) ) ( not ( = ?auto_6981 ?auto_7018 ) ) ( not ( = ?auto_6982 ?auto_7018 ) ) ( not ( = ?auto_6992 ?auto_7021 ) ) ( not ( = ?auto_6981 ?auto_6983 ) ) ( not ( = ?auto_6981 ?auto_7015 ) ) ( not ( = ?auto_6983 ?auto_7018 ) ) ( not ( = ?auto_7012 ?auto_7016 ) ) ( not ( = ?auto_7009 ?auto_7021 ) ) ( not ( = ?auto_7015 ?auto_7018 ) ) ( not ( = ?auto_6981 ?auto_6984 ) ) ( not ( = ?auto_6981 ?auto_7022 ) ) ( not ( = ?auto_6982 ?auto_6984 ) ) ( not ( = ?auto_6982 ?auto_7022 ) ) ( not ( = ?auto_6984 ?auto_7015 ) ) ( not ( = ?auto_6984 ?auto_7018 ) ) ( not ( = ?auto_7001 ?auto_7012 ) ) ( not ( = ?auto_7001 ?auto_7016 ) ) ( not ( = ?auto_6998 ?auto_7009 ) ) ( not ( = ?auto_6998 ?auto_7021 ) ) ( not ( = ?auto_7022 ?auto_7015 ) ) ( not ( = ?auto_7022 ?auto_7018 ) ) ( not ( = ?auto_6981 ?auto_6985 ) ) ( not ( = ?auto_6981 ?auto_7017 ) ) ( not ( = ?auto_6982 ?auto_6985 ) ) ( not ( = ?auto_6982 ?auto_7017 ) ) ( not ( = ?auto_6983 ?auto_6985 ) ) ( not ( = ?auto_6983 ?auto_7017 ) ) ( not ( = ?auto_6985 ?auto_7022 ) ) ( not ( = ?auto_6985 ?auto_7015 ) ) ( not ( = ?auto_6985 ?auto_7018 ) ) ( not ( = ?auto_7008 ?auto_7001 ) ) ( not ( = ?auto_7008 ?auto_7012 ) ) ( not ( = ?auto_7008 ?auto_7016 ) ) ( not ( = ?auto_7006 ?auto_6998 ) ) ( not ( = ?auto_7006 ?auto_7009 ) ) ( not ( = ?auto_7006 ?auto_7021 ) ) ( not ( = ?auto_7017 ?auto_7022 ) ) ( not ( = ?auto_7017 ?auto_7015 ) ) ( not ( = ?auto_7017 ?auto_7018 ) ) ( not ( = ?auto_6981 ?auto_6986 ) ) ( not ( = ?auto_6981 ?auto_7010 ) ) ( not ( = ?auto_6982 ?auto_6986 ) ) ( not ( = ?auto_6982 ?auto_7010 ) ) ( not ( = ?auto_6983 ?auto_6986 ) ) ( not ( = ?auto_6983 ?auto_7010 ) ) ( not ( = ?auto_6984 ?auto_6986 ) ) ( not ( = ?auto_6984 ?auto_7010 ) ) ( not ( = ?auto_6986 ?auto_7017 ) ) ( not ( = ?auto_6986 ?auto_7022 ) ) ( not ( = ?auto_6986 ?auto_7015 ) ) ( not ( = ?auto_6986 ?auto_7018 ) ) ( not ( = ?auto_7013 ?auto_7008 ) ) ( not ( = ?auto_7013 ?auto_7001 ) ) ( not ( = ?auto_7013 ?auto_7012 ) ) ( not ( = ?auto_7013 ?auto_7016 ) ) ( not ( = ?auto_7019 ?auto_7006 ) ) ( not ( = ?auto_7019 ?auto_6998 ) ) ( not ( = ?auto_7019 ?auto_7009 ) ) ( not ( = ?auto_7019 ?auto_7021 ) ) ( not ( = ?auto_7010 ?auto_7017 ) ) ( not ( = ?auto_7010 ?auto_7022 ) ) ( not ( = ?auto_7010 ?auto_7015 ) ) ( not ( = ?auto_7010 ?auto_7018 ) ) ( not ( = ?auto_6981 ?auto_6987 ) ) ( not ( = ?auto_6981 ?auto_7014 ) ) ( not ( = ?auto_6982 ?auto_6987 ) ) ( not ( = ?auto_6982 ?auto_7014 ) ) ( not ( = ?auto_6983 ?auto_6987 ) ) ( not ( = ?auto_6983 ?auto_7014 ) ) ( not ( = ?auto_6984 ?auto_6987 ) ) ( not ( = ?auto_6984 ?auto_7014 ) ) ( not ( = ?auto_6985 ?auto_6987 ) ) ( not ( = ?auto_6985 ?auto_7014 ) ) ( not ( = ?auto_6987 ?auto_7010 ) ) ( not ( = ?auto_6987 ?auto_7017 ) ) ( not ( = ?auto_6987 ?auto_7022 ) ) ( not ( = ?auto_6987 ?auto_7015 ) ) ( not ( = ?auto_6987 ?auto_7018 ) ) ( not ( = ?auto_7000 ?auto_7013 ) ) ( not ( = ?auto_7000 ?auto_7008 ) ) ( not ( = ?auto_7000 ?auto_7001 ) ) ( not ( = ?auto_7000 ?auto_7012 ) ) ( not ( = ?auto_7000 ?auto_7016 ) ) ( not ( = ?auto_7005 ?auto_7019 ) ) ( not ( = ?auto_7005 ?auto_7006 ) ) ( not ( = ?auto_7005 ?auto_6998 ) ) ( not ( = ?auto_7005 ?auto_7009 ) ) ( not ( = ?auto_7005 ?auto_7021 ) ) ( not ( = ?auto_7014 ?auto_7010 ) ) ( not ( = ?auto_7014 ?auto_7017 ) ) ( not ( = ?auto_7014 ?auto_7022 ) ) ( not ( = ?auto_7014 ?auto_7015 ) ) ( not ( = ?auto_7014 ?auto_7018 ) ) ( not ( = ?auto_6981 ?auto_6988 ) ) ( not ( = ?auto_6981 ?auto_7003 ) ) ( not ( = ?auto_6982 ?auto_6988 ) ) ( not ( = ?auto_6982 ?auto_7003 ) ) ( not ( = ?auto_6983 ?auto_6988 ) ) ( not ( = ?auto_6983 ?auto_7003 ) ) ( not ( = ?auto_6984 ?auto_6988 ) ) ( not ( = ?auto_6984 ?auto_7003 ) ) ( not ( = ?auto_6985 ?auto_6988 ) ) ( not ( = ?auto_6985 ?auto_7003 ) ) ( not ( = ?auto_6986 ?auto_6988 ) ) ( not ( = ?auto_6986 ?auto_7003 ) ) ( not ( = ?auto_6988 ?auto_7014 ) ) ( not ( = ?auto_6988 ?auto_7010 ) ) ( not ( = ?auto_6988 ?auto_7017 ) ) ( not ( = ?auto_6988 ?auto_7022 ) ) ( not ( = ?auto_6988 ?auto_7015 ) ) ( not ( = ?auto_6988 ?auto_7018 ) ) ( not ( = ?auto_6999 ?auto_7000 ) ) ( not ( = ?auto_6999 ?auto_7013 ) ) ( not ( = ?auto_6999 ?auto_7008 ) ) ( not ( = ?auto_6999 ?auto_7001 ) ) ( not ( = ?auto_6999 ?auto_7012 ) ) ( not ( = ?auto_6999 ?auto_7016 ) ) ( not ( = ?auto_7004 ?auto_7005 ) ) ( not ( = ?auto_7004 ?auto_7019 ) ) ( not ( = ?auto_7004 ?auto_7006 ) ) ( not ( = ?auto_7004 ?auto_6998 ) ) ( not ( = ?auto_7004 ?auto_7009 ) ) ( not ( = ?auto_7004 ?auto_7021 ) ) ( not ( = ?auto_7003 ?auto_7014 ) ) ( not ( = ?auto_7003 ?auto_7010 ) ) ( not ( = ?auto_7003 ?auto_7017 ) ) ( not ( = ?auto_7003 ?auto_7022 ) ) ( not ( = ?auto_7003 ?auto_7015 ) ) ( not ( = ?auto_7003 ?auto_7018 ) ) ( not ( = ?auto_6981 ?auto_6989 ) ) ( not ( = ?auto_6981 ?auto_7002 ) ) ( not ( = ?auto_6982 ?auto_6989 ) ) ( not ( = ?auto_6982 ?auto_7002 ) ) ( not ( = ?auto_6983 ?auto_6989 ) ) ( not ( = ?auto_6983 ?auto_7002 ) ) ( not ( = ?auto_6984 ?auto_6989 ) ) ( not ( = ?auto_6984 ?auto_7002 ) ) ( not ( = ?auto_6985 ?auto_6989 ) ) ( not ( = ?auto_6985 ?auto_7002 ) ) ( not ( = ?auto_6986 ?auto_6989 ) ) ( not ( = ?auto_6986 ?auto_7002 ) ) ( not ( = ?auto_6987 ?auto_6989 ) ) ( not ( = ?auto_6987 ?auto_7002 ) ) ( not ( = ?auto_6989 ?auto_7003 ) ) ( not ( = ?auto_6989 ?auto_7014 ) ) ( not ( = ?auto_6989 ?auto_7010 ) ) ( not ( = ?auto_6989 ?auto_7017 ) ) ( not ( = ?auto_6989 ?auto_7022 ) ) ( not ( = ?auto_6989 ?auto_7015 ) ) ( not ( = ?auto_6989 ?auto_7018 ) ) ( not ( = ?auto_7007 ?auto_6999 ) ) ( not ( = ?auto_7007 ?auto_7000 ) ) ( not ( = ?auto_7007 ?auto_7013 ) ) ( not ( = ?auto_7007 ?auto_7008 ) ) ( not ( = ?auto_7007 ?auto_7001 ) ) ( not ( = ?auto_7007 ?auto_7012 ) ) ( not ( = ?auto_7007 ?auto_7016 ) ) ( not ( = ?auto_7011 ?auto_7004 ) ) ( not ( = ?auto_7011 ?auto_7005 ) ) ( not ( = ?auto_7011 ?auto_7019 ) ) ( not ( = ?auto_7011 ?auto_7006 ) ) ( not ( = ?auto_7011 ?auto_6998 ) ) ( not ( = ?auto_7011 ?auto_7009 ) ) ( not ( = ?auto_7011 ?auto_7021 ) ) ( not ( = ?auto_7002 ?auto_7003 ) ) ( not ( = ?auto_7002 ?auto_7014 ) ) ( not ( = ?auto_7002 ?auto_7010 ) ) ( not ( = ?auto_7002 ?auto_7017 ) ) ( not ( = ?auto_7002 ?auto_7022 ) ) ( not ( = ?auto_7002 ?auto_7015 ) ) ( not ( = ?auto_7002 ?auto_7018 ) ) ( not ( = ?auto_6981 ?auto_6990 ) ) ( not ( = ?auto_6981 ?auto_7020 ) ) ( not ( = ?auto_6982 ?auto_6990 ) ) ( not ( = ?auto_6982 ?auto_7020 ) ) ( not ( = ?auto_6983 ?auto_6990 ) ) ( not ( = ?auto_6983 ?auto_7020 ) ) ( not ( = ?auto_6984 ?auto_6990 ) ) ( not ( = ?auto_6984 ?auto_7020 ) ) ( not ( = ?auto_6985 ?auto_6990 ) ) ( not ( = ?auto_6985 ?auto_7020 ) ) ( not ( = ?auto_6986 ?auto_6990 ) ) ( not ( = ?auto_6986 ?auto_7020 ) ) ( not ( = ?auto_6987 ?auto_6990 ) ) ( not ( = ?auto_6987 ?auto_7020 ) ) ( not ( = ?auto_6988 ?auto_6990 ) ) ( not ( = ?auto_6988 ?auto_7020 ) ) ( not ( = ?auto_6990 ?auto_7002 ) ) ( not ( = ?auto_6990 ?auto_7003 ) ) ( not ( = ?auto_6990 ?auto_7014 ) ) ( not ( = ?auto_6990 ?auto_7010 ) ) ( not ( = ?auto_6990 ?auto_7017 ) ) ( not ( = ?auto_6990 ?auto_7022 ) ) ( not ( = ?auto_6990 ?auto_7015 ) ) ( not ( = ?auto_6990 ?auto_7018 ) ) ( not ( = ?auto_6996 ?auto_7007 ) ) ( not ( = ?auto_6996 ?auto_6999 ) ) ( not ( = ?auto_6996 ?auto_7000 ) ) ( not ( = ?auto_6996 ?auto_7013 ) ) ( not ( = ?auto_6996 ?auto_7008 ) ) ( not ( = ?auto_6996 ?auto_7001 ) ) ( not ( = ?auto_6996 ?auto_7012 ) ) ( not ( = ?auto_6996 ?auto_7016 ) ) ( not ( = ?auto_6994 ?auto_7011 ) ) ( not ( = ?auto_6994 ?auto_7004 ) ) ( not ( = ?auto_6994 ?auto_7005 ) ) ( not ( = ?auto_6994 ?auto_7019 ) ) ( not ( = ?auto_6994 ?auto_7006 ) ) ( not ( = ?auto_6994 ?auto_6998 ) ) ( not ( = ?auto_6994 ?auto_7009 ) ) ( not ( = ?auto_6994 ?auto_7021 ) ) ( not ( = ?auto_7020 ?auto_7002 ) ) ( not ( = ?auto_7020 ?auto_7003 ) ) ( not ( = ?auto_7020 ?auto_7014 ) ) ( not ( = ?auto_7020 ?auto_7010 ) ) ( not ( = ?auto_7020 ?auto_7017 ) ) ( not ( = ?auto_7020 ?auto_7022 ) ) ( not ( = ?auto_7020 ?auto_7015 ) ) ( not ( = ?auto_7020 ?auto_7018 ) ) ( not ( = ?auto_6981 ?auto_6991 ) ) ( not ( = ?auto_6981 ?auto_6993 ) ) ( not ( = ?auto_6982 ?auto_6991 ) ) ( not ( = ?auto_6982 ?auto_6993 ) ) ( not ( = ?auto_6983 ?auto_6991 ) ) ( not ( = ?auto_6983 ?auto_6993 ) ) ( not ( = ?auto_6984 ?auto_6991 ) ) ( not ( = ?auto_6984 ?auto_6993 ) ) ( not ( = ?auto_6985 ?auto_6991 ) ) ( not ( = ?auto_6985 ?auto_6993 ) ) ( not ( = ?auto_6986 ?auto_6991 ) ) ( not ( = ?auto_6986 ?auto_6993 ) ) ( not ( = ?auto_6987 ?auto_6991 ) ) ( not ( = ?auto_6987 ?auto_6993 ) ) ( not ( = ?auto_6988 ?auto_6991 ) ) ( not ( = ?auto_6988 ?auto_6993 ) ) ( not ( = ?auto_6989 ?auto_6991 ) ) ( not ( = ?auto_6989 ?auto_6993 ) ) ( not ( = ?auto_6991 ?auto_7020 ) ) ( not ( = ?auto_6991 ?auto_7002 ) ) ( not ( = ?auto_6991 ?auto_7003 ) ) ( not ( = ?auto_6991 ?auto_7014 ) ) ( not ( = ?auto_6991 ?auto_7010 ) ) ( not ( = ?auto_6991 ?auto_7017 ) ) ( not ( = ?auto_6991 ?auto_7022 ) ) ( not ( = ?auto_6991 ?auto_7015 ) ) ( not ( = ?auto_6991 ?auto_7018 ) ) ( not ( = ?auto_6993 ?auto_7020 ) ) ( not ( = ?auto_6993 ?auto_7002 ) ) ( not ( = ?auto_6993 ?auto_7003 ) ) ( not ( = ?auto_6993 ?auto_7014 ) ) ( not ( = ?auto_6993 ?auto_7010 ) ) ( not ( = ?auto_6993 ?auto_7017 ) ) ( not ( = ?auto_6993 ?auto_7022 ) ) ( not ( = ?auto_6993 ?auto_7015 ) ) ( not ( = ?auto_6993 ?auto_7018 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_6981 ?auto_6982 ?auto_6983 ?auto_6984 ?auto_6985 ?auto_6986 ?auto_6987 ?auto_6988 ?auto_6989 ?auto_6990 )
      ( MAKE-1CRATE ?auto_6990 ?auto_6991 )
      ( MAKE-10CRATE-VERIFY ?auto_6981 ?auto_6982 ?auto_6983 ?auto_6984 ?auto_6985 ?auto_6986 ?auto_6987 ?auto_6988 ?auto_6989 ?auto_6990 ?auto_6991 ) )
  )

)

