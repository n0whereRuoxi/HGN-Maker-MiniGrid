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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6622 - SURFACE
      ?auto_6623 - SURFACE
    )
    :vars
    (
      ?auto_6624 - HOIST
      ?auto_6625 - PLACE
      ?auto_6627 - PLACE
      ?auto_6628 - HOIST
      ?auto_6629 - SURFACE
      ?auto_6626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6624 ?auto_6625 ) ( SURFACE-AT ?auto_6622 ?auto_6625 ) ( CLEAR ?auto_6622 ) ( IS-CRATE ?auto_6623 ) ( AVAILABLE ?auto_6624 ) ( not ( = ?auto_6627 ?auto_6625 ) ) ( HOIST-AT ?auto_6628 ?auto_6627 ) ( AVAILABLE ?auto_6628 ) ( SURFACE-AT ?auto_6623 ?auto_6627 ) ( ON ?auto_6623 ?auto_6629 ) ( CLEAR ?auto_6623 ) ( TRUCK-AT ?auto_6626 ?auto_6625 ) ( not ( = ?auto_6622 ?auto_6623 ) ) ( not ( = ?auto_6622 ?auto_6629 ) ) ( not ( = ?auto_6623 ?auto_6629 ) ) ( not ( = ?auto_6624 ?auto_6628 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6626 ?auto_6625 ?auto_6627 )
      ( !LIFT ?auto_6628 ?auto_6623 ?auto_6629 ?auto_6627 )
      ( !LOAD ?auto_6628 ?auto_6623 ?auto_6626 ?auto_6627 )
      ( !DRIVE ?auto_6626 ?auto_6627 ?auto_6625 )
      ( !UNLOAD ?auto_6624 ?auto_6623 ?auto_6626 ?auto_6625 )
      ( !DROP ?auto_6624 ?auto_6623 ?auto_6622 ?auto_6625 )
      ( MAKE-1CRATE-VERIFY ?auto_6622 ?auto_6623 ) )
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
      ?auto_6636 - HOIST
      ?auto_6640 - PLACE
      ?auto_6641 - PLACE
      ?auto_6637 - HOIST
      ?auto_6638 - SURFACE
      ?auto_6643 - PLACE
      ?auto_6644 - HOIST
      ?auto_6642 - SURFACE
      ?auto_6639 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6636 ?auto_6640 ) ( IS-CRATE ?auto_6635 ) ( not ( = ?auto_6641 ?auto_6640 ) ) ( HOIST-AT ?auto_6637 ?auto_6641 ) ( AVAILABLE ?auto_6637 ) ( SURFACE-AT ?auto_6635 ?auto_6641 ) ( ON ?auto_6635 ?auto_6638 ) ( CLEAR ?auto_6635 ) ( not ( = ?auto_6634 ?auto_6635 ) ) ( not ( = ?auto_6634 ?auto_6638 ) ) ( not ( = ?auto_6635 ?auto_6638 ) ) ( not ( = ?auto_6636 ?auto_6637 ) ) ( SURFACE-AT ?auto_6633 ?auto_6640 ) ( CLEAR ?auto_6633 ) ( IS-CRATE ?auto_6634 ) ( AVAILABLE ?auto_6636 ) ( not ( = ?auto_6643 ?auto_6640 ) ) ( HOIST-AT ?auto_6644 ?auto_6643 ) ( AVAILABLE ?auto_6644 ) ( SURFACE-AT ?auto_6634 ?auto_6643 ) ( ON ?auto_6634 ?auto_6642 ) ( CLEAR ?auto_6634 ) ( TRUCK-AT ?auto_6639 ?auto_6640 ) ( not ( = ?auto_6633 ?auto_6634 ) ) ( not ( = ?auto_6633 ?auto_6642 ) ) ( not ( = ?auto_6634 ?auto_6642 ) ) ( not ( = ?auto_6636 ?auto_6644 ) ) ( not ( = ?auto_6633 ?auto_6635 ) ) ( not ( = ?auto_6633 ?auto_6638 ) ) ( not ( = ?auto_6635 ?auto_6642 ) ) ( not ( = ?auto_6641 ?auto_6643 ) ) ( not ( = ?auto_6637 ?auto_6644 ) ) ( not ( = ?auto_6638 ?auto_6642 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6633 ?auto_6634 )
      ( MAKE-1CRATE ?auto_6634 ?auto_6635 )
      ( MAKE-2CRATE-VERIFY ?auto_6633 ?auto_6634 ?auto_6635 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6647 - SURFACE
      ?auto_6648 - SURFACE
    )
    :vars
    (
      ?auto_6649 - HOIST
      ?auto_6650 - PLACE
      ?auto_6652 - PLACE
      ?auto_6653 - HOIST
      ?auto_6654 - SURFACE
      ?auto_6651 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6649 ?auto_6650 ) ( SURFACE-AT ?auto_6647 ?auto_6650 ) ( CLEAR ?auto_6647 ) ( IS-CRATE ?auto_6648 ) ( AVAILABLE ?auto_6649 ) ( not ( = ?auto_6652 ?auto_6650 ) ) ( HOIST-AT ?auto_6653 ?auto_6652 ) ( AVAILABLE ?auto_6653 ) ( SURFACE-AT ?auto_6648 ?auto_6652 ) ( ON ?auto_6648 ?auto_6654 ) ( CLEAR ?auto_6648 ) ( TRUCK-AT ?auto_6651 ?auto_6650 ) ( not ( = ?auto_6647 ?auto_6648 ) ) ( not ( = ?auto_6647 ?auto_6654 ) ) ( not ( = ?auto_6648 ?auto_6654 ) ) ( not ( = ?auto_6649 ?auto_6653 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6651 ?auto_6650 ?auto_6652 )
      ( !LIFT ?auto_6653 ?auto_6648 ?auto_6654 ?auto_6652 )
      ( !LOAD ?auto_6653 ?auto_6648 ?auto_6651 ?auto_6652 )
      ( !DRIVE ?auto_6651 ?auto_6652 ?auto_6650 )
      ( !UNLOAD ?auto_6649 ?auto_6648 ?auto_6651 ?auto_6650 )
      ( !DROP ?auto_6649 ?auto_6648 ?auto_6647 ?auto_6650 )
      ( MAKE-1CRATE-VERIFY ?auto_6647 ?auto_6648 ) )
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
      ?auto_6663 - HOIST
      ?auto_6664 - PLACE
      ?auto_6667 - PLACE
      ?auto_6665 - HOIST
      ?auto_6668 - SURFACE
      ?auto_6671 - PLACE
      ?auto_6672 - HOIST
      ?auto_6670 - SURFACE
      ?auto_6673 - PLACE
      ?auto_6669 - HOIST
      ?auto_6674 - SURFACE
      ?auto_6666 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6663 ?auto_6664 ) ( IS-CRATE ?auto_6662 ) ( not ( = ?auto_6667 ?auto_6664 ) ) ( HOIST-AT ?auto_6665 ?auto_6667 ) ( AVAILABLE ?auto_6665 ) ( SURFACE-AT ?auto_6662 ?auto_6667 ) ( ON ?auto_6662 ?auto_6668 ) ( CLEAR ?auto_6662 ) ( not ( = ?auto_6661 ?auto_6662 ) ) ( not ( = ?auto_6661 ?auto_6668 ) ) ( not ( = ?auto_6662 ?auto_6668 ) ) ( not ( = ?auto_6663 ?auto_6665 ) ) ( IS-CRATE ?auto_6661 ) ( not ( = ?auto_6671 ?auto_6664 ) ) ( HOIST-AT ?auto_6672 ?auto_6671 ) ( AVAILABLE ?auto_6672 ) ( SURFACE-AT ?auto_6661 ?auto_6671 ) ( ON ?auto_6661 ?auto_6670 ) ( CLEAR ?auto_6661 ) ( not ( = ?auto_6660 ?auto_6661 ) ) ( not ( = ?auto_6660 ?auto_6670 ) ) ( not ( = ?auto_6661 ?auto_6670 ) ) ( not ( = ?auto_6663 ?auto_6672 ) ) ( SURFACE-AT ?auto_6659 ?auto_6664 ) ( CLEAR ?auto_6659 ) ( IS-CRATE ?auto_6660 ) ( AVAILABLE ?auto_6663 ) ( not ( = ?auto_6673 ?auto_6664 ) ) ( HOIST-AT ?auto_6669 ?auto_6673 ) ( AVAILABLE ?auto_6669 ) ( SURFACE-AT ?auto_6660 ?auto_6673 ) ( ON ?auto_6660 ?auto_6674 ) ( CLEAR ?auto_6660 ) ( TRUCK-AT ?auto_6666 ?auto_6664 ) ( not ( = ?auto_6659 ?auto_6660 ) ) ( not ( = ?auto_6659 ?auto_6674 ) ) ( not ( = ?auto_6660 ?auto_6674 ) ) ( not ( = ?auto_6663 ?auto_6669 ) ) ( not ( = ?auto_6659 ?auto_6661 ) ) ( not ( = ?auto_6659 ?auto_6670 ) ) ( not ( = ?auto_6661 ?auto_6674 ) ) ( not ( = ?auto_6671 ?auto_6673 ) ) ( not ( = ?auto_6672 ?auto_6669 ) ) ( not ( = ?auto_6670 ?auto_6674 ) ) ( not ( = ?auto_6659 ?auto_6662 ) ) ( not ( = ?auto_6659 ?auto_6668 ) ) ( not ( = ?auto_6660 ?auto_6662 ) ) ( not ( = ?auto_6660 ?auto_6668 ) ) ( not ( = ?auto_6662 ?auto_6670 ) ) ( not ( = ?auto_6662 ?auto_6674 ) ) ( not ( = ?auto_6667 ?auto_6671 ) ) ( not ( = ?auto_6667 ?auto_6673 ) ) ( not ( = ?auto_6665 ?auto_6672 ) ) ( not ( = ?auto_6665 ?auto_6669 ) ) ( not ( = ?auto_6668 ?auto_6670 ) ) ( not ( = ?auto_6668 ?auto_6674 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6659 ?auto_6660 ?auto_6661 )
      ( MAKE-1CRATE ?auto_6661 ?auto_6662 )
      ( MAKE-3CRATE-VERIFY ?auto_6659 ?auto_6660 ?auto_6661 ?auto_6662 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6677 - SURFACE
      ?auto_6678 - SURFACE
    )
    :vars
    (
      ?auto_6679 - HOIST
      ?auto_6680 - PLACE
      ?auto_6682 - PLACE
      ?auto_6683 - HOIST
      ?auto_6684 - SURFACE
      ?auto_6681 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6679 ?auto_6680 ) ( SURFACE-AT ?auto_6677 ?auto_6680 ) ( CLEAR ?auto_6677 ) ( IS-CRATE ?auto_6678 ) ( AVAILABLE ?auto_6679 ) ( not ( = ?auto_6682 ?auto_6680 ) ) ( HOIST-AT ?auto_6683 ?auto_6682 ) ( AVAILABLE ?auto_6683 ) ( SURFACE-AT ?auto_6678 ?auto_6682 ) ( ON ?auto_6678 ?auto_6684 ) ( CLEAR ?auto_6678 ) ( TRUCK-AT ?auto_6681 ?auto_6680 ) ( not ( = ?auto_6677 ?auto_6678 ) ) ( not ( = ?auto_6677 ?auto_6684 ) ) ( not ( = ?auto_6678 ?auto_6684 ) ) ( not ( = ?auto_6679 ?auto_6683 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6681 ?auto_6680 ?auto_6682 )
      ( !LIFT ?auto_6683 ?auto_6678 ?auto_6684 ?auto_6682 )
      ( !LOAD ?auto_6683 ?auto_6678 ?auto_6681 ?auto_6682 )
      ( !DRIVE ?auto_6681 ?auto_6682 ?auto_6680 )
      ( !UNLOAD ?auto_6679 ?auto_6678 ?auto_6681 ?auto_6680 )
      ( !DROP ?auto_6679 ?auto_6678 ?auto_6677 ?auto_6680 )
      ( MAKE-1CRATE-VERIFY ?auto_6677 ?auto_6678 ) )
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
      ?auto_6698 - HOIST
      ?auto_6699 - PLACE
      ?auto_6697 - PLACE
      ?auto_6696 - HOIST
      ?auto_6700 - SURFACE
      ?auto_6709 - PLACE
      ?auto_6704 - HOIST
      ?auto_6703 - SURFACE
      ?auto_6707 - PLACE
      ?auto_6705 - HOIST
      ?auto_6702 - SURFACE
      ?auto_6706 - PLACE
      ?auto_6701 - HOIST
      ?auto_6708 - SURFACE
      ?auto_6695 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6698 ?auto_6699 ) ( IS-CRATE ?auto_6694 ) ( not ( = ?auto_6697 ?auto_6699 ) ) ( HOIST-AT ?auto_6696 ?auto_6697 ) ( AVAILABLE ?auto_6696 ) ( SURFACE-AT ?auto_6694 ?auto_6697 ) ( ON ?auto_6694 ?auto_6700 ) ( CLEAR ?auto_6694 ) ( not ( = ?auto_6693 ?auto_6694 ) ) ( not ( = ?auto_6693 ?auto_6700 ) ) ( not ( = ?auto_6694 ?auto_6700 ) ) ( not ( = ?auto_6698 ?auto_6696 ) ) ( IS-CRATE ?auto_6693 ) ( not ( = ?auto_6709 ?auto_6699 ) ) ( HOIST-AT ?auto_6704 ?auto_6709 ) ( AVAILABLE ?auto_6704 ) ( SURFACE-AT ?auto_6693 ?auto_6709 ) ( ON ?auto_6693 ?auto_6703 ) ( CLEAR ?auto_6693 ) ( not ( = ?auto_6692 ?auto_6693 ) ) ( not ( = ?auto_6692 ?auto_6703 ) ) ( not ( = ?auto_6693 ?auto_6703 ) ) ( not ( = ?auto_6698 ?auto_6704 ) ) ( IS-CRATE ?auto_6692 ) ( not ( = ?auto_6707 ?auto_6699 ) ) ( HOIST-AT ?auto_6705 ?auto_6707 ) ( AVAILABLE ?auto_6705 ) ( SURFACE-AT ?auto_6692 ?auto_6707 ) ( ON ?auto_6692 ?auto_6702 ) ( CLEAR ?auto_6692 ) ( not ( = ?auto_6691 ?auto_6692 ) ) ( not ( = ?auto_6691 ?auto_6702 ) ) ( not ( = ?auto_6692 ?auto_6702 ) ) ( not ( = ?auto_6698 ?auto_6705 ) ) ( SURFACE-AT ?auto_6690 ?auto_6699 ) ( CLEAR ?auto_6690 ) ( IS-CRATE ?auto_6691 ) ( AVAILABLE ?auto_6698 ) ( not ( = ?auto_6706 ?auto_6699 ) ) ( HOIST-AT ?auto_6701 ?auto_6706 ) ( AVAILABLE ?auto_6701 ) ( SURFACE-AT ?auto_6691 ?auto_6706 ) ( ON ?auto_6691 ?auto_6708 ) ( CLEAR ?auto_6691 ) ( TRUCK-AT ?auto_6695 ?auto_6699 ) ( not ( = ?auto_6690 ?auto_6691 ) ) ( not ( = ?auto_6690 ?auto_6708 ) ) ( not ( = ?auto_6691 ?auto_6708 ) ) ( not ( = ?auto_6698 ?auto_6701 ) ) ( not ( = ?auto_6690 ?auto_6692 ) ) ( not ( = ?auto_6690 ?auto_6702 ) ) ( not ( = ?auto_6692 ?auto_6708 ) ) ( not ( = ?auto_6707 ?auto_6706 ) ) ( not ( = ?auto_6705 ?auto_6701 ) ) ( not ( = ?auto_6702 ?auto_6708 ) ) ( not ( = ?auto_6690 ?auto_6693 ) ) ( not ( = ?auto_6690 ?auto_6703 ) ) ( not ( = ?auto_6691 ?auto_6693 ) ) ( not ( = ?auto_6691 ?auto_6703 ) ) ( not ( = ?auto_6693 ?auto_6702 ) ) ( not ( = ?auto_6693 ?auto_6708 ) ) ( not ( = ?auto_6709 ?auto_6707 ) ) ( not ( = ?auto_6709 ?auto_6706 ) ) ( not ( = ?auto_6704 ?auto_6705 ) ) ( not ( = ?auto_6704 ?auto_6701 ) ) ( not ( = ?auto_6703 ?auto_6702 ) ) ( not ( = ?auto_6703 ?auto_6708 ) ) ( not ( = ?auto_6690 ?auto_6694 ) ) ( not ( = ?auto_6690 ?auto_6700 ) ) ( not ( = ?auto_6691 ?auto_6694 ) ) ( not ( = ?auto_6691 ?auto_6700 ) ) ( not ( = ?auto_6692 ?auto_6694 ) ) ( not ( = ?auto_6692 ?auto_6700 ) ) ( not ( = ?auto_6694 ?auto_6703 ) ) ( not ( = ?auto_6694 ?auto_6702 ) ) ( not ( = ?auto_6694 ?auto_6708 ) ) ( not ( = ?auto_6697 ?auto_6709 ) ) ( not ( = ?auto_6697 ?auto_6707 ) ) ( not ( = ?auto_6697 ?auto_6706 ) ) ( not ( = ?auto_6696 ?auto_6704 ) ) ( not ( = ?auto_6696 ?auto_6705 ) ) ( not ( = ?auto_6696 ?auto_6701 ) ) ( not ( = ?auto_6700 ?auto_6703 ) ) ( not ( = ?auto_6700 ?auto_6702 ) ) ( not ( = ?auto_6700 ?auto_6708 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_6690 ?auto_6691 ?auto_6692 ?auto_6693 )
      ( MAKE-1CRATE ?auto_6693 ?auto_6694 )
      ( MAKE-4CRATE-VERIFY ?auto_6690 ?auto_6691 ?auto_6692 ?auto_6693 ?auto_6694 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6712 - SURFACE
      ?auto_6713 - SURFACE
    )
    :vars
    (
      ?auto_6714 - HOIST
      ?auto_6715 - PLACE
      ?auto_6717 - PLACE
      ?auto_6718 - HOIST
      ?auto_6719 - SURFACE
      ?auto_6716 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6714 ?auto_6715 ) ( SURFACE-AT ?auto_6712 ?auto_6715 ) ( CLEAR ?auto_6712 ) ( IS-CRATE ?auto_6713 ) ( AVAILABLE ?auto_6714 ) ( not ( = ?auto_6717 ?auto_6715 ) ) ( HOIST-AT ?auto_6718 ?auto_6717 ) ( AVAILABLE ?auto_6718 ) ( SURFACE-AT ?auto_6713 ?auto_6717 ) ( ON ?auto_6713 ?auto_6719 ) ( CLEAR ?auto_6713 ) ( TRUCK-AT ?auto_6716 ?auto_6715 ) ( not ( = ?auto_6712 ?auto_6713 ) ) ( not ( = ?auto_6712 ?auto_6719 ) ) ( not ( = ?auto_6713 ?auto_6719 ) ) ( not ( = ?auto_6714 ?auto_6718 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6716 ?auto_6715 ?auto_6717 )
      ( !LIFT ?auto_6718 ?auto_6713 ?auto_6719 ?auto_6717 )
      ( !LOAD ?auto_6718 ?auto_6713 ?auto_6716 ?auto_6717 )
      ( !DRIVE ?auto_6716 ?auto_6717 ?auto_6715 )
      ( !UNLOAD ?auto_6714 ?auto_6713 ?auto_6716 ?auto_6715 )
      ( !DROP ?auto_6714 ?auto_6713 ?auto_6712 ?auto_6715 )
      ( MAKE-1CRATE-VERIFY ?auto_6712 ?auto_6713 ) )
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
      ?auto_6734 - HOIST
      ?auto_6737 - PLACE
      ?auto_6733 - PLACE
      ?auto_6736 - HOIST
      ?auto_6735 - SURFACE
      ?auto_6745 - PLACE
      ?auto_6744 - HOIST
      ?auto_6743 - SURFACE
      ?auto_6742 - PLACE
      ?auto_6739 - HOIST
      ?auto_6741 - SURFACE
      ?auto_6746 - PLACE
      ?auto_6748 - HOIST
      ?auto_6738 - SURFACE
      ?auto_6749 - PLACE
      ?auto_6740 - HOIST
      ?auto_6747 - SURFACE
      ?auto_6732 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6734 ?auto_6737 ) ( IS-CRATE ?auto_6731 ) ( not ( = ?auto_6733 ?auto_6737 ) ) ( HOIST-AT ?auto_6736 ?auto_6733 ) ( AVAILABLE ?auto_6736 ) ( SURFACE-AT ?auto_6731 ?auto_6733 ) ( ON ?auto_6731 ?auto_6735 ) ( CLEAR ?auto_6731 ) ( not ( = ?auto_6730 ?auto_6731 ) ) ( not ( = ?auto_6730 ?auto_6735 ) ) ( not ( = ?auto_6731 ?auto_6735 ) ) ( not ( = ?auto_6734 ?auto_6736 ) ) ( IS-CRATE ?auto_6730 ) ( not ( = ?auto_6745 ?auto_6737 ) ) ( HOIST-AT ?auto_6744 ?auto_6745 ) ( AVAILABLE ?auto_6744 ) ( SURFACE-AT ?auto_6730 ?auto_6745 ) ( ON ?auto_6730 ?auto_6743 ) ( CLEAR ?auto_6730 ) ( not ( = ?auto_6729 ?auto_6730 ) ) ( not ( = ?auto_6729 ?auto_6743 ) ) ( not ( = ?auto_6730 ?auto_6743 ) ) ( not ( = ?auto_6734 ?auto_6744 ) ) ( IS-CRATE ?auto_6729 ) ( not ( = ?auto_6742 ?auto_6737 ) ) ( HOIST-AT ?auto_6739 ?auto_6742 ) ( AVAILABLE ?auto_6739 ) ( SURFACE-AT ?auto_6729 ?auto_6742 ) ( ON ?auto_6729 ?auto_6741 ) ( CLEAR ?auto_6729 ) ( not ( = ?auto_6728 ?auto_6729 ) ) ( not ( = ?auto_6728 ?auto_6741 ) ) ( not ( = ?auto_6729 ?auto_6741 ) ) ( not ( = ?auto_6734 ?auto_6739 ) ) ( IS-CRATE ?auto_6728 ) ( not ( = ?auto_6746 ?auto_6737 ) ) ( HOIST-AT ?auto_6748 ?auto_6746 ) ( AVAILABLE ?auto_6748 ) ( SURFACE-AT ?auto_6728 ?auto_6746 ) ( ON ?auto_6728 ?auto_6738 ) ( CLEAR ?auto_6728 ) ( not ( = ?auto_6727 ?auto_6728 ) ) ( not ( = ?auto_6727 ?auto_6738 ) ) ( not ( = ?auto_6728 ?auto_6738 ) ) ( not ( = ?auto_6734 ?auto_6748 ) ) ( SURFACE-AT ?auto_6726 ?auto_6737 ) ( CLEAR ?auto_6726 ) ( IS-CRATE ?auto_6727 ) ( AVAILABLE ?auto_6734 ) ( not ( = ?auto_6749 ?auto_6737 ) ) ( HOIST-AT ?auto_6740 ?auto_6749 ) ( AVAILABLE ?auto_6740 ) ( SURFACE-AT ?auto_6727 ?auto_6749 ) ( ON ?auto_6727 ?auto_6747 ) ( CLEAR ?auto_6727 ) ( TRUCK-AT ?auto_6732 ?auto_6737 ) ( not ( = ?auto_6726 ?auto_6727 ) ) ( not ( = ?auto_6726 ?auto_6747 ) ) ( not ( = ?auto_6727 ?auto_6747 ) ) ( not ( = ?auto_6734 ?auto_6740 ) ) ( not ( = ?auto_6726 ?auto_6728 ) ) ( not ( = ?auto_6726 ?auto_6738 ) ) ( not ( = ?auto_6728 ?auto_6747 ) ) ( not ( = ?auto_6746 ?auto_6749 ) ) ( not ( = ?auto_6748 ?auto_6740 ) ) ( not ( = ?auto_6738 ?auto_6747 ) ) ( not ( = ?auto_6726 ?auto_6729 ) ) ( not ( = ?auto_6726 ?auto_6741 ) ) ( not ( = ?auto_6727 ?auto_6729 ) ) ( not ( = ?auto_6727 ?auto_6741 ) ) ( not ( = ?auto_6729 ?auto_6738 ) ) ( not ( = ?auto_6729 ?auto_6747 ) ) ( not ( = ?auto_6742 ?auto_6746 ) ) ( not ( = ?auto_6742 ?auto_6749 ) ) ( not ( = ?auto_6739 ?auto_6748 ) ) ( not ( = ?auto_6739 ?auto_6740 ) ) ( not ( = ?auto_6741 ?auto_6738 ) ) ( not ( = ?auto_6741 ?auto_6747 ) ) ( not ( = ?auto_6726 ?auto_6730 ) ) ( not ( = ?auto_6726 ?auto_6743 ) ) ( not ( = ?auto_6727 ?auto_6730 ) ) ( not ( = ?auto_6727 ?auto_6743 ) ) ( not ( = ?auto_6728 ?auto_6730 ) ) ( not ( = ?auto_6728 ?auto_6743 ) ) ( not ( = ?auto_6730 ?auto_6741 ) ) ( not ( = ?auto_6730 ?auto_6738 ) ) ( not ( = ?auto_6730 ?auto_6747 ) ) ( not ( = ?auto_6745 ?auto_6742 ) ) ( not ( = ?auto_6745 ?auto_6746 ) ) ( not ( = ?auto_6745 ?auto_6749 ) ) ( not ( = ?auto_6744 ?auto_6739 ) ) ( not ( = ?auto_6744 ?auto_6748 ) ) ( not ( = ?auto_6744 ?auto_6740 ) ) ( not ( = ?auto_6743 ?auto_6741 ) ) ( not ( = ?auto_6743 ?auto_6738 ) ) ( not ( = ?auto_6743 ?auto_6747 ) ) ( not ( = ?auto_6726 ?auto_6731 ) ) ( not ( = ?auto_6726 ?auto_6735 ) ) ( not ( = ?auto_6727 ?auto_6731 ) ) ( not ( = ?auto_6727 ?auto_6735 ) ) ( not ( = ?auto_6728 ?auto_6731 ) ) ( not ( = ?auto_6728 ?auto_6735 ) ) ( not ( = ?auto_6729 ?auto_6731 ) ) ( not ( = ?auto_6729 ?auto_6735 ) ) ( not ( = ?auto_6731 ?auto_6743 ) ) ( not ( = ?auto_6731 ?auto_6741 ) ) ( not ( = ?auto_6731 ?auto_6738 ) ) ( not ( = ?auto_6731 ?auto_6747 ) ) ( not ( = ?auto_6733 ?auto_6745 ) ) ( not ( = ?auto_6733 ?auto_6742 ) ) ( not ( = ?auto_6733 ?auto_6746 ) ) ( not ( = ?auto_6733 ?auto_6749 ) ) ( not ( = ?auto_6736 ?auto_6744 ) ) ( not ( = ?auto_6736 ?auto_6739 ) ) ( not ( = ?auto_6736 ?auto_6748 ) ) ( not ( = ?auto_6736 ?auto_6740 ) ) ( not ( = ?auto_6735 ?auto_6743 ) ) ( not ( = ?auto_6735 ?auto_6741 ) ) ( not ( = ?auto_6735 ?auto_6738 ) ) ( not ( = ?auto_6735 ?auto_6747 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_6726 ?auto_6727 ?auto_6728 ?auto_6729 ?auto_6730 )
      ( MAKE-1CRATE ?auto_6730 ?auto_6731 )
      ( MAKE-5CRATE-VERIFY ?auto_6726 ?auto_6727 ?auto_6728 ?auto_6729 ?auto_6730 ?auto_6731 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6752 - SURFACE
      ?auto_6753 - SURFACE
    )
    :vars
    (
      ?auto_6754 - HOIST
      ?auto_6755 - PLACE
      ?auto_6757 - PLACE
      ?auto_6758 - HOIST
      ?auto_6759 - SURFACE
      ?auto_6756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6754 ?auto_6755 ) ( SURFACE-AT ?auto_6752 ?auto_6755 ) ( CLEAR ?auto_6752 ) ( IS-CRATE ?auto_6753 ) ( AVAILABLE ?auto_6754 ) ( not ( = ?auto_6757 ?auto_6755 ) ) ( HOIST-AT ?auto_6758 ?auto_6757 ) ( AVAILABLE ?auto_6758 ) ( SURFACE-AT ?auto_6753 ?auto_6757 ) ( ON ?auto_6753 ?auto_6759 ) ( CLEAR ?auto_6753 ) ( TRUCK-AT ?auto_6756 ?auto_6755 ) ( not ( = ?auto_6752 ?auto_6753 ) ) ( not ( = ?auto_6752 ?auto_6759 ) ) ( not ( = ?auto_6753 ?auto_6759 ) ) ( not ( = ?auto_6754 ?auto_6758 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6756 ?auto_6755 ?auto_6757 )
      ( !LIFT ?auto_6758 ?auto_6753 ?auto_6759 ?auto_6757 )
      ( !LOAD ?auto_6758 ?auto_6753 ?auto_6756 ?auto_6757 )
      ( !DRIVE ?auto_6756 ?auto_6757 ?auto_6755 )
      ( !UNLOAD ?auto_6754 ?auto_6753 ?auto_6756 ?auto_6755 )
      ( !DROP ?auto_6754 ?auto_6753 ?auto_6752 ?auto_6755 )
      ( MAKE-1CRATE-VERIFY ?auto_6752 ?auto_6753 ) )
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
      ?auto_6779 - HOIST
      ?auto_6778 - PLACE
      ?auto_6777 - PLACE
      ?auto_6775 - HOIST
      ?auto_6776 - SURFACE
      ?auto_6788 - PLACE
      ?auto_6789 - HOIST
      ?auto_6790 - SURFACE
      ?auto_6787 - PLACE
      ?auto_6780 - HOIST
      ?auto_6786 - SURFACE
      ?auto_6794 - PLACE
      ?auto_6792 - HOIST
      ?auto_6781 - SURFACE
      ?auto_6782 - PLACE
      ?auto_6784 - HOIST
      ?auto_6785 - SURFACE
      ?auto_6783 - PLACE
      ?auto_6791 - HOIST
      ?auto_6793 - SURFACE
      ?auto_6774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6779 ?auto_6778 ) ( IS-CRATE ?auto_6773 ) ( not ( = ?auto_6777 ?auto_6778 ) ) ( HOIST-AT ?auto_6775 ?auto_6777 ) ( AVAILABLE ?auto_6775 ) ( SURFACE-AT ?auto_6773 ?auto_6777 ) ( ON ?auto_6773 ?auto_6776 ) ( CLEAR ?auto_6773 ) ( not ( = ?auto_6772 ?auto_6773 ) ) ( not ( = ?auto_6772 ?auto_6776 ) ) ( not ( = ?auto_6773 ?auto_6776 ) ) ( not ( = ?auto_6779 ?auto_6775 ) ) ( IS-CRATE ?auto_6772 ) ( not ( = ?auto_6788 ?auto_6778 ) ) ( HOIST-AT ?auto_6789 ?auto_6788 ) ( AVAILABLE ?auto_6789 ) ( SURFACE-AT ?auto_6772 ?auto_6788 ) ( ON ?auto_6772 ?auto_6790 ) ( CLEAR ?auto_6772 ) ( not ( = ?auto_6771 ?auto_6772 ) ) ( not ( = ?auto_6771 ?auto_6790 ) ) ( not ( = ?auto_6772 ?auto_6790 ) ) ( not ( = ?auto_6779 ?auto_6789 ) ) ( IS-CRATE ?auto_6771 ) ( not ( = ?auto_6787 ?auto_6778 ) ) ( HOIST-AT ?auto_6780 ?auto_6787 ) ( AVAILABLE ?auto_6780 ) ( SURFACE-AT ?auto_6771 ?auto_6787 ) ( ON ?auto_6771 ?auto_6786 ) ( CLEAR ?auto_6771 ) ( not ( = ?auto_6770 ?auto_6771 ) ) ( not ( = ?auto_6770 ?auto_6786 ) ) ( not ( = ?auto_6771 ?auto_6786 ) ) ( not ( = ?auto_6779 ?auto_6780 ) ) ( IS-CRATE ?auto_6770 ) ( not ( = ?auto_6794 ?auto_6778 ) ) ( HOIST-AT ?auto_6792 ?auto_6794 ) ( AVAILABLE ?auto_6792 ) ( SURFACE-AT ?auto_6770 ?auto_6794 ) ( ON ?auto_6770 ?auto_6781 ) ( CLEAR ?auto_6770 ) ( not ( = ?auto_6769 ?auto_6770 ) ) ( not ( = ?auto_6769 ?auto_6781 ) ) ( not ( = ?auto_6770 ?auto_6781 ) ) ( not ( = ?auto_6779 ?auto_6792 ) ) ( IS-CRATE ?auto_6769 ) ( not ( = ?auto_6782 ?auto_6778 ) ) ( HOIST-AT ?auto_6784 ?auto_6782 ) ( AVAILABLE ?auto_6784 ) ( SURFACE-AT ?auto_6769 ?auto_6782 ) ( ON ?auto_6769 ?auto_6785 ) ( CLEAR ?auto_6769 ) ( not ( = ?auto_6768 ?auto_6769 ) ) ( not ( = ?auto_6768 ?auto_6785 ) ) ( not ( = ?auto_6769 ?auto_6785 ) ) ( not ( = ?auto_6779 ?auto_6784 ) ) ( SURFACE-AT ?auto_6767 ?auto_6778 ) ( CLEAR ?auto_6767 ) ( IS-CRATE ?auto_6768 ) ( AVAILABLE ?auto_6779 ) ( not ( = ?auto_6783 ?auto_6778 ) ) ( HOIST-AT ?auto_6791 ?auto_6783 ) ( AVAILABLE ?auto_6791 ) ( SURFACE-AT ?auto_6768 ?auto_6783 ) ( ON ?auto_6768 ?auto_6793 ) ( CLEAR ?auto_6768 ) ( TRUCK-AT ?auto_6774 ?auto_6778 ) ( not ( = ?auto_6767 ?auto_6768 ) ) ( not ( = ?auto_6767 ?auto_6793 ) ) ( not ( = ?auto_6768 ?auto_6793 ) ) ( not ( = ?auto_6779 ?auto_6791 ) ) ( not ( = ?auto_6767 ?auto_6769 ) ) ( not ( = ?auto_6767 ?auto_6785 ) ) ( not ( = ?auto_6769 ?auto_6793 ) ) ( not ( = ?auto_6782 ?auto_6783 ) ) ( not ( = ?auto_6784 ?auto_6791 ) ) ( not ( = ?auto_6785 ?auto_6793 ) ) ( not ( = ?auto_6767 ?auto_6770 ) ) ( not ( = ?auto_6767 ?auto_6781 ) ) ( not ( = ?auto_6768 ?auto_6770 ) ) ( not ( = ?auto_6768 ?auto_6781 ) ) ( not ( = ?auto_6770 ?auto_6785 ) ) ( not ( = ?auto_6770 ?auto_6793 ) ) ( not ( = ?auto_6794 ?auto_6782 ) ) ( not ( = ?auto_6794 ?auto_6783 ) ) ( not ( = ?auto_6792 ?auto_6784 ) ) ( not ( = ?auto_6792 ?auto_6791 ) ) ( not ( = ?auto_6781 ?auto_6785 ) ) ( not ( = ?auto_6781 ?auto_6793 ) ) ( not ( = ?auto_6767 ?auto_6771 ) ) ( not ( = ?auto_6767 ?auto_6786 ) ) ( not ( = ?auto_6768 ?auto_6771 ) ) ( not ( = ?auto_6768 ?auto_6786 ) ) ( not ( = ?auto_6769 ?auto_6771 ) ) ( not ( = ?auto_6769 ?auto_6786 ) ) ( not ( = ?auto_6771 ?auto_6781 ) ) ( not ( = ?auto_6771 ?auto_6785 ) ) ( not ( = ?auto_6771 ?auto_6793 ) ) ( not ( = ?auto_6787 ?auto_6794 ) ) ( not ( = ?auto_6787 ?auto_6782 ) ) ( not ( = ?auto_6787 ?auto_6783 ) ) ( not ( = ?auto_6780 ?auto_6792 ) ) ( not ( = ?auto_6780 ?auto_6784 ) ) ( not ( = ?auto_6780 ?auto_6791 ) ) ( not ( = ?auto_6786 ?auto_6781 ) ) ( not ( = ?auto_6786 ?auto_6785 ) ) ( not ( = ?auto_6786 ?auto_6793 ) ) ( not ( = ?auto_6767 ?auto_6772 ) ) ( not ( = ?auto_6767 ?auto_6790 ) ) ( not ( = ?auto_6768 ?auto_6772 ) ) ( not ( = ?auto_6768 ?auto_6790 ) ) ( not ( = ?auto_6769 ?auto_6772 ) ) ( not ( = ?auto_6769 ?auto_6790 ) ) ( not ( = ?auto_6770 ?auto_6772 ) ) ( not ( = ?auto_6770 ?auto_6790 ) ) ( not ( = ?auto_6772 ?auto_6786 ) ) ( not ( = ?auto_6772 ?auto_6781 ) ) ( not ( = ?auto_6772 ?auto_6785 ) ) ( not ( = ?auto_6772 ?auto_6793 ) ) ( not ( = ?auto_6788 ?auto_6787 ) ) ( not ( = ?auto_6788 ?auto_6794 ) ) ( not ( = ?auto_6788 ?auto_6782 ) ) ( not ( = ?auto_6788 ?auto_6783 ) ) ( not ( = ?auto_6789 ?auto_6780 ) ) ( not ( = ?auto_6789 ?auto_6792 ) ) ( not ( = ?auto_6789 ?auto_6784 ) ) ( not ( = ?auto_6789 ?auto_6791 ) ) ( not ( = ?auto_6790 ?auto_6786 ) ) ( not ( = ?auto_6790 ?auto_6781 ) ) ( not ( = ?auto_6790 ?auto_6785 ) ) ( not ( = ?auto_6790 ?auto_6793 ) ) ( not ( = ?auto_6767 ?auto_6773 ) ) ( not ( = ?auto_6767 ?auto_6776 ) ) ( not ( = ?auto_6768 ?auto_6773 ) ) ( not ( = ?auto_6768 ?auto_6776 ) ) ( not ( = ?auto_6769 ?auto_6773 ) ) ( not ( = ?auto_6769 ?auto_6776 ) ) ( not ( = ?auto_6770 ?auto_6773 ) ) ( not ( = ?auto_6770 ?auto_6776 ) ) ( not ( = ?auto_6771 ?auto_6773 ) ) ( not ( = ?auto_6771 ?auto_6776 ) ) ( not ( = ?auto_6773 ?auto_6790 ) ) ( not ( = ?auto_6773 ?auto_6786 ) ) ( not ( = ?auto_6773 ?auto_6781 ) ) ( not ( = ?auto_6773 ?auto_6785 ) ) ( not ( = ?auto_6773 ?auto_6793 ) ) ( not ( = ?auto_6777 ?auto_6788 ) ) ( not ( = ?auto_6777 ?auto_6787 ) ) ( not ( = ?auto_6777 ?auto_6794 ) ) ( not ( = ?auto_6777 ?auto_6782 ) ) ( not ( = ?auto_6777 ?auto_6783 ) ) ( not ( = ?auto_6775 ?auto_6789 ) ) ( not ( = ?auto_6775 ?auto_6780 ) ) ( not ( = ?auto_6775 ?auto_6792 ) ) ( not ( = ?auto_6775 ?auto_6784 ) ) ( not ( = ?auto_6775 ?auto_6791 ) ) ( not ( = ?auto_6776 ?auto_6790 ) ) ( not ( = ?auto_6776 ?auto_6786 ) ) ( not ( = ?auto_6776 ?auto_6781 ) ) ( not ( = ?auto_6776 ?auto_6785 ) ) ( not ( = ?auto_6776 ?auto_6793 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_6767 ?auto_6768 ?auto_6769 ?auto_6770 ?auto_6771 ?auto_6772 )
      ( MAKE-1CRATE ?auto_6772 ?auto_6773 )
      ( MAKE-6CRATE-VERIFY ?auto_6767 ?auto_6768 ?auto_6769 ?auto_6770 ?auto_6771 ?auto_6772 ?auto_6773 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6797 - SURFACE
      ?auto_6798 - SURFACE
    )
    :vars
    (
      ?auto_6799 - HOIST
      ?auto_6800 - PLACE
      ?auto_6802 - PLACE
      ?auto_6803 - HOIST
      ?auto_6804 - SURFACE
      ?auto_6801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6799 ?auto_6800 ) ( SURFACE-AT ?auto_6797 ?auto_6800 ) ( CLEAR ?auto_6797 ) ( IS-CRATE ?auto_6798 ) ( AVAILABLE ?auto_6799 ) ( not ( = ?auto_6802 ?auto_6800 ) ) ( HOIST-AT ?auto_6803 ?auto_6802 ) ( AVAILABLE ?auto_6803 ) ( SURFACE-AT ?auto_6798 ?auto_6802 ) ( ON ?auto_6798 ?auto_6804 ) ( CLEAR ?auto_6798 ) ( TRUCK-AT ?auto_6801 ?auto_6800 ) ( not ( = ?auto_6797 ?auto_6798 ) ) ( not ( = ?auto_6797 ?auto_6804 ) ) ( not ( = ?auto_6798 ?auto_6804 ) ) ( not ( = ?auto_6799 ?auto_6803 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6801 ?auto_6800 ?auto_6802 )
      ( !LIFT ?auto_6803 ?auto_6798 ?auto_6804 ?auto_6802 )
      ( !LOAD ?auto_6803 ?auto_6798 ?auto_6801 ?auto_6802 )
      ( !DRIVE ?auto_6801 ?auto_6802 ?auto_6800 )
      ( !UNLOAD ?auto_6799 ?auto_6798 ?auto_6801 ?auto_6800 )
      ( !DROP ?auto_6799 ?auto_6798 ?auto_6797 ?auto_6800 )
      ( MAKE-1CRATE-VERIFY ?auto_6797 ?auto_6798 ) )
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
      ?auto_6822 - HOIST
      ?auto_6824 - PLACE
      ?auto_6825 - PLACE
      ?auto_6823 - HOIST
      ?auto_6821 - SURFACE
      ?auto_6831 - PLACE
      ?auto_6844 - HOIST
      ?auto_6841 - SURFACE
      ?auto_6827 - PLACE
      ?auto_6833 - HOIST
      ?auto_6828 - SURFACE
      ?auto_6837 - PLACE
      ?auto_6832 - HOIST
      ?auto_6838 - SURFACE
      ?auto_6829 - PLACE
      ?auto_6835 - HOIST
      ?auto_6843 - SURFACE
      ?auto_6842 - PLACE
      ?auto_6840 - HOIST
      ?auto_6839 - SURFACE
      ?auto_6830 - PLACE
      ?auto_6834 - HOIST
      ?auto_6836 - SURFACE
      ?auto_6826 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6822 ?auto_6824 ) ( IS-CRATE ?auto_6820 ) ( not ( = ?auto_6825 ?auto_6824 ) ) ( HOIST-AT ?auto_6823 ?auto_6825 ) ( AVAILABLE ?auto_6823 ) ( SURFACE-AT ?auto_6820 ?auto_6825 ) ( ON ?auto_6820 ?auto_6821 ) ( CLEAR ?auto_6820 ) ( not ( = ?auto_6819 ?auto_6820 ) ) ( not ( = ?auto_6819 ?auto_6821 ) ) ( not ( = ?auto_6820 ?auto_6821 ) ) ( not ( = ?auto_6822 ?auto_6823 ) ) ( IS-CRATE ?auto_6819 ) ( not ( = ?auto_6831 ?auto_6824 ) ) ( HOIST-AT ?auto_6844 ?auto_6831 ) ( AVAILABLE ?auto_6844 ) ( SURFACE-AT ?auto_6819 ?auto_6831 ) ( ON ?auto_6819 ?auto_6841 ) ( CLEAR ?auto_6819 ) ( not ( = ?auto_6818 ?auto_6819 ) ) ( not ( = ?auto_6818 ?auto_6841 ) ) ( not ( = ?auto_6819 ?auto_6841 ) ) ( not ( = ?auto_6822 ?auto_6844 ) ) ( IS-CRATE ?auto_6818 ) ( not ( = ?auto_6827 ?auto_6824 ) ) ( HOIST-AT ?auto_6833 ?auto_6827 ) ( AVAILABLE ?auto_6833 ) ( SURFACE-AT ?auto_6818 ?auto_6827 ) ( ON ?auto_6818 ?auto_6828 ) ( CLEAR ?auto_6818 ) ( not ( = ?auto_6817 ?auto_6818 ) ) ( not ( = ?auto_6817 ?auto_6828 ) ) ( not ( = ?auto_6818 ?auto_6828 ) ) ( not ( = ?auto_6822 ?auto_6833 ) ) ( IS-CRATE ?auto_6817 ) ( not ( = ?auto_6837 ?auto_6824 ) ) ( HOIST-AT ?auto_6832 ?auto_6837 ) ( AVAILABLE ?auto_6832 ) ( SURFACE-AT ?auto_6817 ?auto_6837 ) ( ON ?auto_6817 ?auto_6838 ) ( CLEAR ?auto_6817 ) ( not ( = ?auto_6816 ?auto_6817 ) ) ( not ( = ?auto_6816 ?auto_6838 ) ) ( not ( = ?auto_6817 ?auto_6838 ) ) ( not ( = ?auto_6822 ?auto_6832 ) ) ( IS-CRATE ?auto_6816 ) ( not ( = ?auto_6829 ?auto_6824 ) ) ( HOIST-AT ?auto_6835 ?auto_6829 ) ( AVAILABLE ?auto_6835 ) ( SURFACE-AT ?auto_6816 ?auto_6829 ) ( ON ?auto_6816 ?auto_6843 ) ( CLEAR ?auto_6816 ) ( not ( = ?auto_6815 ?auto_6816 ) ) ( not ( = ?auto_6815 ?auto_6843 ) ) ( not ( = ?auto_6816 ?auto_6843 ) ) ( not ( = ?auto_6822 ?auto_6835 ) ) ( IS-CRATE ?auto_6815 ) ( not ( = ?auto_6842 ?auto_6824 ) ) ( HOIST-AT ?auto_6840 ?auto_6842 ) ( AVAILABLE ?auto_6840 ) ( SURFACE-AT ?auto_6815 ?auto_6842 ) ( ON ?auto_6815 ?auto_6839 ) ( CLEAR ?auto_6815 ) ( not ( = ?auto_6814 ?auto_6815 ) ) ( not ( = ?auto_6814 ?auto_6839 ) ) ( not ( = ?auto_6815 ?auto_6839 ) ) ( not ( = ?auto_6822 ?auto_6840 ) ) ( SURFACE-AT ?auto_6813 ?auto_6824 ) ( CLEAR ?auto_6813 ) ( IS-CRATE ?auto_6814 ) ( AVAILABLE ?auto_6822 ) ( not ( = ?auto_6830 ?auto_6824 ) ) ( HOIST-AT ?auto_6834 ?auto_6830 ) ( AVAILABLE ?auto_6834 ) ( SURFACE-AT ?auto_6814 ?auto_6830 ) ( ON ?auto_6814 ?auto_6836 ) ( CLEAR ?auto_6814 ) ( TRUCK-AT ?auto_6826 ?auto_6824 ) ( not ( = ?auto_6813 ?auto_6814 ) ) ( not ( = ?auto_6813 ?auto_6836 ) ) ( not ( = ?auto_6814 ?auto_6836 ) ) ( not ( = ?auto_6822 ?auto_6834 ) ) ( not ( = ?auto_6813 ?auto_6815 ) ) ( not ( = ?auto_6813 ?auto_6839 ) ) ( not ( = ?auto_6815 ?auto_6836 ) ) ( not ( = ?auto_6842 ?auto_6830 ) ) ( not ( = ?auto_6840 ?auto_6834 ) ) ( not ( = ?auto_6839 ?auto_6836 ) ) ( not ( = ?auto_6813 ?auto_6816 ) ) ( not ( = ?auto_6813 ?auto_6843 ) ) ( not ( = ?auto_6814 ?auto_6816 ) ) ( not ( = ?auto_6814 ?auto_6843 ) ) ( not ( = ?auto_6816 ?auto_6839 ) ) ( not ( = ?auto_6816 ?auto_6836 ) ) ( not ( = ?auto_6829 ?auto_6842 ) ) ( not ( = ?auto_6829 ?auto_6830 ) ) ( not ( = ?auto_6835 ?auto_6840 ) ) ( not ( = ?auto_6835 ?auto_6834 ) ) ( not ( = ?auto_6843 ?auto_6839 ) ) ( not ( = ?auto_6843 ?auto_6836 ) ) ( not ( = ?auto_6813 ?auto_6817 ) ) ( not ( = ?auto_6813 ?auto_6838 ) ) ( not ( = ?auto_6814 ?auto_6817 ) ) ( not ( = ?auto_6814 ?auto_6838 ) ) ( not ( = ?auto_6815 ?auto_6817 ) ) ( not ( = ?auto_6815 ?auto_6838 ) ) ( not ( = ?auto_6817 ?auto_6843 ) ) ( not ( = ?auto_6817 ?auto_6839 ) ) ( not ( = ?auto_6817 ?auto_6836 ) ) ( not ( = ?auto_6837 ?auto_6829 ) ) ( not ( = ?auto_6837 ?auto_6842 ) ) ( not ( = ?auto_6837 ?auto_6830 ) ) ( not ( = ?auto_6832 ?auto_6835 ) ) ( not ( = ?auto_6832 ?auto_6840 ) ) ( not ( = ?auto_6832 ?auto_6834 ) ) ( not ( = ?auto_6838 ?auto_6843 ) ) ( not ( = ?auto_6838 ?auto_6839 ) ) ( not ( = ?auto_6838 ?auto_6836 ) ) ( not ( = ?auto_6813 ?auto_6818 ) ) ( not ( = ?auto_6813 ?auto_6828 ) ) ( not ( = ?auto_6814 ?auto_6818 ) ) ( not ( = ?auto_6814 ?auto_6828 ) ) ( not ( = ?auto_6815 ?auto_6818 ) ) ( not ( = ?auto_6815 ?auto_6828 ) ) ( not ( = ?auto_6816 ?auto_6818 ) ) ( not ( = ?auto_6816 ?auto_6828 ) ) ( not ( = ?auto_6818 ?auto_6838 ) ) ( not ( = ?auto_6818 ?auto_6843 ) ) ( not ( = ?auto_6818 ?auto_6839 ) ) ( not ( = ?auto_6818 ?auto_6836 ) ) ( not ( = ?auto_6827 ?auto_6837 ) ) ( not ( = ?auto_6827 ?auto_6829 ) ) ( not ( = ?auto_6827 ?auto_6842 ) ) ( not ( = ?auto_6827 ?auto_6830 ) ) ( not ( = ?auto_6833 ?auto_6832 ) ) ( not ( = ?auto_6833 ?auto_6835 ) ) ( not ( = ?auto_6833 ?auto_6840 ) ) ( not ( = ?auto_6833 ?auto_6834 ) ) ( not ( = ?auto_6828 ?auto_6838 ) ) ( not ( = ?auto_6828 ?auto_6843 ) ) ( not ( = ?auto_6828 ?auto_6839 ) ) ( not ( = ?auto_6828 ?auto_6836 ) ) ( not ( = ?auto_6813 ?auto_6819 ) ) ( not ( = ?auto_6813 ?auto_6841 ) ) ( not ( = ?auto_6814 ?auto_6819 ) ) ( not ( = ?auto_6814 ?auto_6841 ) ) ( not ( = ?auto_6815 ?auto_6819 ) ) ( not ( = ?auto_6815 ?auto_6841 ) ) ( not ( = ?auto_6816 ?auto_6819 ) ) ( not ( = ?auto_6816 ?auto_6841 ) ) ( not ( = ?auto_6817 ?auto_6819 ) ) ( not ( = ?auto_6817 ?auto_6841 ) ) ( not ( = ?auto_6819 ?auto_6828 ) ) ( not ( = ?auto_6819 ?auto_6838 ) ) ( not ( = ?auto_6819 ?auto_6843 ) ) ( not ( = ?auto_6819 ?auto_6839 ) ) ( not ( = ?auto_6819 ?auto_6836 ) ) ( not ( = ?auto_6831 ?auto_6827 ) ) ( not ( = ?auto_6831 ?auto_6837 ) ) ( not ( = ?auto_6831 ?auto_6829 ) ) ( not ( = ?auto_6831 ?auto_6842 ) ) ( not ( = ?auto_6831 ?auto_6830 ) ) ( not ( = ?auto_6844 ?auto_6833 ) ) ( not ( = ?auto_6844 ?auto_6832 ) ) ( not ( = ?auto_6844 ?auto_6835 ) ) ( not ( = ?auto_6844 ?auto_6840 ) ) ( not ( = ?auto_6844 ?auto_6834 ) ) ( not ( = ?auto_6841 ?auto_6828 ) ) ( not ( = ?auto_6841 ?auto_6838 ) ) ( not ( = ?auto_6841 ?auto_6843 ) ) ( not ( = ?auto_6841 ?auto_6839 ) ) ( not ( = ?auto_6841 ?auto_6836 ) ) ( not ( = ?auto_6813 ?auto_6820 ) ) ( not ( = ?auto_6813 ?auto_6821 ) ) ( not ( = ?auto_6814 ?auto_6820 ) ) ( not ( = ?auto_6814 ?auto_6821 ) ) ( not ( = ?auto_6815 ?auto_6820 ) ) ( not ( = ?auto_6815 ?auto_6821 ) ) ( not ( = ?auto_6816 ?auto_6820 ) ) ( not ( = ?auto_6816 ?auto_6821 ) ) ( not ( = ?auto_6817 ?auto_6820 ) ) ( not ( = ?auto_6817 ?auto_6821 ) ) ( not ( = ?auto_6818 ?auto_6820 ) ) ( not ( = ?auto_6818 ?auto_6821 ) ) ( not ( = ?auto_6820 ?auto_6841 ) ) ( not ( = ?auto_6820 ?auto_6828 ) ) ( not ( = ?auto_6820 ?auto_6838 ) ) ( not ( = ?auto_6820 ?auto_6843 ) ) ( not ( = ?auto_6820 ?auto_6839 ) ) ( not ( = ?auto_6820 ?auto_6836 ) ) ( not ( = ?auto_6825 ?auto_6831 ) ) ( not ( = ?auto_6825 ?auto_6827 ) ) ( not ( = ?auto_6825 ?auto_6837 ) ) ( not ( = ?auto_6825 ?auto_6829 ) ) ( not ( = ?auto_6825 ?auto_6842 ) ) ( not ( = ?auto_6825 ?auto_6830 ) ) ( not ( = ?auto_6823 ?auto_6844 ) ) ( not ( = ?auto_6823 ?auto_6833 ) ) ( not ( = ?auto_6823 ?auto_6832 ) ) ( not ( = ?auto_6823 ?auto_6835 ) ) ( not ( = ?auto_6823 ?auto_6840 ) ) ( not ( = ?auto_6823 ?auto_6834 ) ) ( not ( = ?auto_6821 ?auto_6841 ) ) ( not ( = ?auto_6821 ?auto_6828 ) ) ( not ( = ?auto_6821 ?auto_6838 ) ) ( not ( = ?auto_6821 ?auto_6843 ) ) ( not ( = ?auto_6821 ?auto_6839 ) ) ( not ( = ?auto_6821 ?auto_6836 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_6813 ?auto_6814 ?auto_6815 ?auto_6816 ?auto_6817 ?auto_6818 ?auto_6819 )
      ( MAKE-1CRATE ?auto_6819 ?auto_6820 )
      ( MAKE-7CRATE-VERIFY ?auto_6813 ?auto_6814 ?auto_6815 ?auto_6816 ?auto_6817 ?auto_6818 ?auto_6819 ?auto_6820 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6847 - SURFACE
      ?auto_6848 - SURFACE
    )
    :vars
    (
      ?auto_6849 - HOIST
      ?auto_6850 - PLACE
      ?auto_6852 - PLACE
      ?auto_6853 - HOIST
      ?auto_6854 - SURFACE
      ?auto_6851 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6849 ?auto_6850 ) ( SURFACE-AT ?auto_6847 ?auto_6850 ) ( CLEAR ?auto_6847 ) ( IS-CRATE ?auto_6848 ) ( AVAILABLE ?auto_6849 ) ( not ( = ?auto_6852 ?auto_6850 ) ) ( HOIST-AT ?auto_6853 ?auto_6852 ) ( AVAILABLE ?auto_6853 ) ( SURFACE-AT ?auto_6848 ?auto_6852 ) ( ON ?auto_6848 ?auto_6854 ) ( CLEAR ?auto_6848 ) ( TRUCK-AT ?auto_6851 ?auto_6850 ) ( not ( = ?auto_6847 ?auto_6848 ) ) ( not ( = ?auto_6847 ?auto_6854 ) ) ( not ( = ?auto_6848 ?auto_6854 ) ) ( not ( = ?auto_6849 ?auto_6853 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6851 ?auto_6850 ?auto_6852 )
      ( !LIFT ?auto_6853 ?auto_6848 ?auto_6854 ?auto_6852 )
      ( !LOAD ?auto_6853 ?auto_6848 ?auto_6851 ?auto_6852 )
      ( !DRIVE ?auto_6851 ?auto_6852 ?auto_6850 )
      ( !UNLOAD ?auto_6849 ?auto_6848 ?auto_6851 ?auto_6850 )
      ( !DROP ?auto_6849 ?auto_6848 ?auto_6847 ?auto_6850 )
      ( MAKE-1CRATE-VERIFY ?auto_6847 ?auto_6848 ) )
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
      ?auto_6872 - SURFACE
      ?auto_6871 - SURFACE
    )
    :vars
    (
      ?auto_6876 - HOIST
      ?auto_6874 - PLACE
      ?auto_6878 - PLACE
      ?auto_6875 - HOIST
      ?auto_6877 - SURFACE
      ?auto_6883 - PLACE
      ?auto_6898 - HOIST
      ?auto_6882 - SURFACE
      ?auto_6896 - PLACE
      ?auto_6899 - HOIST
      ?auto_6880 - SURFACE
      ?auto_6885 - PLACE
      ?auto_6894 - HOIST
      ?auto_6884 - SURFACE
      ?auto_6888 - PLACE
      ?auto_6895 - HOIST
      ?auto_6890 - SURFACE
      ?auto_6881 - PLACE
      ?auto_6887 - HOIST
      ?auto_6879 - SURFACE
      ?auto_6886 - PLACE
      ?auto_6892 - HOIST
      ?auto_6891 - SURFACE
      ?auto_6897 - PLACE
      ?auto_6893 - HOIST
      ?auto_6889 - SURFACE
      ?auto_6873 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6876 ?auto_6874 ) ( IS-CRATE ?auto_6871 ) ( not ( = ?auto_6878 ?auto_6874 ) ) ( HOIST-AT ?auto_6875 ?auto_6878 ) ( AVAILABLE ?auto_6875 ) ( SURFACE-AT ?auto_6871 ?auto_6878 ) ( ON ?auto_6871 ?auto_6877 ) ( CLEAR ?auto_6871 ) ( not ( = ?auto_6872 ?auto_6871 ) ) ( not ( = ?auto_6872 ?auto_6877 ) ) ( not ( = ?auto_6871 ?auto_6877 ) ) ( not ( = ?auto_6876 ?auto_6875 ) ) ( IS-CRATE ?auto_6872 ) ( not ( = ?auto_6883 ?auto_6874 ) ) ( HOIST-AT ?auto_6898 ?auto_6883 ) ( AVAILABLE ?auto_6898 ) ( SURFACE-AT ?auto_6872 ?auto_6883 ) ( ON ?auto_6872 ?auto_6882 ) ( CLEAR ?auto_6872 ) ( not ( = ?auto_6870 ?auto_6872 ) ) ( not ( = ?auto_6870 ?auto_6882 ) ) ( not ( = ?auto_6872 ?auto_6882 ) ) ( not ( = ?auto_6876 ?auto_6898 ) ) ( IS-CRATE ?auto_6870 ) ( not ( = ?auto_6896 ?auto_6874 ) ) ( HOIST-AT ?auto_6899 ?auto_6896 ) ( AVAILABLE ?auto_6899 ) ( SURFACE-AT ?auto_6870 ?auto_6896 ) ( ON ?auto_6870 ?auto_6880 ) ( CLEAR ?auto_6870 ) ( not ( = ?auto_6869 ?auto_6870 ) ) ( not ( = ?auto_6869 ?auto_6880 ) ) ( not ( = ?auto_6870 ?auto_6880 ) ) ( not ( = ?auto_6876 ?auto_6899 ) ) ( IS-CRATE ?auto_6869 ) ( not ( = ?auto_6885 ?auto_6874 ) ) ( HOIST-AT ?auto_6894 ?auto_6885 ) ( AVAILABLE ?auto_6894 ) ( SURFACE-AT ?auto_6869 ?auto_6885 ) ( ON ?auto_6869 ?auto_6884 ) ( CLEAR ?auto_6869 ) ( not ( = ?auto_6868 ?auto_6869 ) ) ( not ( = ?auto_6868 ?auto_6884 ) ) ( not ( = ?auto_6869 ?auto_6884 ) ) ( not ( = ?auto_6876 ?auto_6894 ) ) ( IS-CRATE ?auto_6868 ) ( not ( = ?auto_6888 ?auto_6874 ) ) ( HOIST-AT ?auto_6895 ?auto_6888 ) ( AVAILABLE ?auto_6895 ) ( SURFACE-AT ?auto_6868 ?auto_6888 ) ( ON ?auto_6868 ?auto_6890 ) ( CLEAR ?auto_6868 ) ( not ( = ?auto_6867 ?auto_6868 ) ) ( not ( = ?auto_6867 ?auto_6890 ) ) ( not ( = ?auto_6868 ?auto_6890 ) ) ( not ( = ?auto_6876 ?auto_6895 ) ) ( IS-CRATE ?auto_6867 ) ( not ( = ?auto_6881 ?auto_6874 ) ) ( HOIST-AT ?auto_6887 ?auto_6881 ) ( AVAILABLE ?auto_6887 ) ( SURFACE-AT ?auto_6867 ?auto_6881 ) ( ON ?auto_6867 ?auto_6879 ) ( CLEAR ?auto_6867 ) ( not ( = ?auto_6866 ?auto_6867 ) ) ( not ( = ?auto_6866 ?auto_6879 ) ) ( not ( = ?auto_6867 ?auto_6879 ) ) ( not ( = ?auto_6876 ?auto_6887 ) ) ( IS-CRATE ?auto_6866 ) ( not ( = ?auto_6886 ?auto_6874 ) ) ( HOIST-AT ?auto_6892 ?auto_6886 ) ( AVAILABLE ?auto_6892 ) ( SURFACE-AT ?auto_6866 ?auto_6886 ) ( ON ?auto_6866 ?auto_6891 ) ( CLEAR ?auto_6866 ) ( not ( = ?auto_6865 ?auto_6866 ) ) ( not ( = ?auto_6865 ?auto_6891 ) ) ( not ( = ?auto_6866 ?auto_6891 ) ) ( not ( = ?auto_6876 ?auto_6892 ) ) ( SURFACE-AT ?auto_6864 ?auto_6874 ) ( CLEAR ?auto_6864 ) ( IS-CRATE ?auto_6865 ) ( AVAILABLE ?auto_6876 ) ( not ( = ?auto_6897 ?auto_6874 ) ) ( HOIST-AT ?auto_6893 ?auto_6897 ) ( AVAILABLE ?auto_6893 ) ( SURFACE-AT ?auto_6865 ?auto_6897 ) ( ON ?auto_6865 ?auto_6889 ) ( CLEAR ?auto_6865 ) ( TRUCK-AT ?auto_6873 ?auto_6874 ) ( not ( = ?auto_6864 ?auto_6865 ) ) ( not ( = ?auto_6864 ?auto_6889 ) ) ( not ( = ?auto_6865 ?auto_6889 ) ) ( not ( = ?auto_6876 ?auto_6893 ) ) ( not ( = ?auto_6864 ?auto_6866 ) ) ( not ( = ?auto_6864 ?auto_6891 ) ) ( not ( = ?auto_6866 ?auto_6889 ) ) ( not ( = ?auto_6886 ?auto_6897 ) ) ( not ( = ?auto_6892 ?auto_6893 ) ) ( not ( = ?auto_6891 ?auto_6889 ) ) ( not ( = ?auto_6864 ?auto_6867 ) ) ( not ( = ?auto_6864 ?auto_6879 ) ) ( not ( = ?auto_6865 ?auto_6867 ) ) ( not ( = ?auto_6865 ?auto_6879 ) ) ( not ( = ?auto_6867 ?auto_6891 ) ) ( not ( = ?auto_6867 ?auto_6889 ) ) ( not ( = ?auto_6881 ?auto_6886 ) ) ( not ( = ?auto_6881 ?auto_6897 ) ) ( not ( = ?auto_6887 ?auto_6892 ) ) ( not ( = ?auto_6887 ?auto_6893 ) ) ( not ( = ?auto_6879 ?auto_6891 ) ) ( not ( = ?auto_6879 ?auto_6889 ) ) ( not ( = ?auto_6864 ?auto_6868 ) ) ( not ( = ?auto_6864 ?auto_6890 ) ) ( not ( = ?auto_6865 ?auto_6868 ) ) ( not ( = ?auto_6865 ?auto_6890 ) ) ( not ( = ?auto_6866 ?auto_6868 ) ) ( not ( = ?auto_6866 ?auto_6890 ) ) ( not ( = ?auto_6868 ?auto_6879 ) ) ( not ( = ?auto_6868 ?auto_6891 ) ) ( not ( = ?auto_6868 ?auto_6889 ) ) ( not ( = ?auto_6888 ?auto_6881 ) ) ( not ( = ?auto_6888 ?auto_6886 ) ) ( not ( = ?auto_6888 ?auto_6897 ) ) ( not ( = ?auto_6895 ?auto_6887 ) ) ( not ( = ?auto_6895 ?auto_6892 ) ) ( not ( = ?auto_6895 ?auto_6893 ) ) ( not ( = ?auto_6890 ?auto_6879 ) ) ( not ( = ?auto_6890 ?auto_6891 ) ) ( not ( = ?auto_6890 ?auto_6889 ) ) ( not ( = ?auto_6864 ?auto_6869 ) ) ( not ( = ?auto_6864 ?auto_6884 ) ) ( not ( = ?auto_6865 ?auto_6869 ) ) ( not ( = ?auto_6865 ?auto_6884 ) ) ( not ( = ?auto_6866 ?auto_6869 ) ) ( not ( = ?auto_6866 ?auto_6884 ) ) ( not ( = ?auto_6867 ?auto_6869 ) ) ( not ( = ?auto_6867 ?auto_6884 ) ) ( not ( = ?auto_6869 ?auto_6890 ) ) ( not ( = ?auto_6869 ?auto_6879 ) ) ( not ( = ?auto_6869 ?auto_6891 ) ) ( not ( = ?auto_6869 ?auto_6889 ) ) ( not ( = ?auto_6885 ?auto_6888 ) ) ( not ( = ?auto_6885 ?auto_6881 ) ) ( not ( = ?auto_6885 ?auto_6886 ) ) ( not ( = ?auto_6885 ?auto_6897 ) ) ( not ( = ?auto_6894 ?auto_6895 ) ) ( not ( = ?auto_6894 ?auto_6887 ) ) ( not ( = ?auto_6894 ?auto_6892 ) ) ( not ( = ?auto_6894 ?auto_6893 ) ) ( not ( = ?auto_6884 ?auto_6890 ) ) ( not ( = ?auto_6884 ?auto_6879 ) ) ( not ( = ?auto_6884 ?auto_6891 ) ) ( not ( = ?auto_6884 ?auto_6889 ) ) ( not ( = ?auto_6864 ?auto_6870 ) ) ( not ( = ?auto_6864 ?auto_6880 ) ) ( not ( = ?auto_6865 ?auto_6870 ) ) ( not ( = ?auto_6865 ?auto_6880 ) ) ( not ( = ?auto_6866 ?auto_6870 ) ) ( not ( = ?auto_6866 ?auto_6880 ) ) ( not ( = ?auto_6867 ?auto_6870 ) ) ( not ( = ?auto_6867 ?auto_6880 ) ) ( not ( = ?auto_6868 ?auto_6870 ) ) ( not ( = ?auto_6868 ?auto_6880 ) ) ( not ( = ?auto_6870 ?auto_6884 ) ) ( not ( = ?auto_6870 ?auto_6890 ) ) ( not ( = ?auto_6870 ?auto_6879 ) ) ( not ( = ?auto_6870 ?auto_6891 ) ) ( not ( = ?auto_6870 ?auto_6889 ) ) ( not ( = ?auto_6896 ?auto_6885 ) ) ( not ( = ?auto_6896 ?auto_6888 ) ) ( not ( = ?auto_6896 ?auto_6881 ) ) ( not ( = ?auto_6896 ?auto_6886 ) ) ( not ( = ?auto_6896 ?auto_6897 ) ) ( not ( = ?auto_6899 ?auto_6894 ) ) ( not ( = ?auto_6899 ?auto_6895 ) ) ( not ( = ?auto_6899 ?auto_6887 ) ) ( not ( = ?auto_6899 ?auto_6892 ) ) ( not ( = ?auto_6899 ?auto_6893 ) ) ( not ( = ?auto_6880 ?auto_6884 ) ) ( not ( = ?auto_6880 ?auto_6890 ) ) ( not ( = ?auto_6880 ?auto_6879 ) ) ( not ( = ?auto_6880 ?auto_6891 ) ) ( not ( = ?auto_6880 ?auto_6889 ) ) ( not ( = ?auto_6864 ?auto_6872 ) ) ( not ( = ?auto_6864 ?auto_6882 ) ) ( not ( = ?auto_6865 ?auto_6872 ) ) ( not ( = ?auto_6865 ?auto_6882 ) ) ( not ( = ?auto_6866 ?auto_6872 ) ) ( not ( = ?auto_6866 ?auto_6882 ) ) ( not ( = ?auto_6867 ?auto_6872 ) ) ( not ( = ?auto_6867 ?auto_6882 ) ) ( not ( = ?auto_6868 ?auto_6872 ) ) ( not ( = ?auto_6868 ?auto_6882 ) ) ( not ( = ?auto_6869 ?auto_6872 ) ) ( not ( = ?auto_6869 ?auto_6882 ) ) ( not ( = ?auto_6872 ?auto_6880 ) ) ( not ( = ?auto_6872 ?auto_6884 ) ) ( not ( = ?auto_6872 ?auto_6890 ) ) ( not ( = ?auto_6872 ?auto_6879 ) ) ( not ( = ?auto_6872 ?auto_6891 ) ) ( not ( = ?auto_6872 ?auto_6889 ) ) ( not ( = ?auto_6883 ?auto_6896 ) ) ( not ( = ?auto_6883 ?auto_6885 ) ) ( not ( = ?auto_6883 ?auto_6888 ) ) ( not ( = ?auto_6883 ?auto_6881 ) ) ( not ( = ?auto_6883 ?auto_6886 ) ) ( not ( = ?auto_6883 ?auto_6897 ) ) ( not ( = ?auto_6898 ?auto_6899 ) ) ( not ( = ?auto_6898 ?auto_6894 ) ) ( not ( = ?auto_6898 ?auto_6895 ) ) ( not ( = ?auto_6898 ?auto_6887 ) ) ( not ( = ?auto_6898 ?auto_6892 ) ) ( not ( = ?auto_6898 ?auto_6893 ) ) ( not ( = ?auto_6882 ?auto_6880 ) ) ( not ( = ?auto_6882 ?auto_6884 ) ) ( not ( = ?auto_6882 ?auto_6890 ) ) ( not ( = ?auto_6882 ?auto_6879 ) ) ( not ( = ?auto_6882 ?auto_6891 ) ) ( not ( = ?auto_6882 ?auto_6889 ) ) ( not ( = ?auto_6864 ?auto_6871 ) ) ( not ( = ?auto_6864 ?auto_6877 ) ) ( not ( = ?auto_6865 ?auto_6871 ) ) ( not ( = ?auto_6865 ?auto_6877 ) ) ( not ( = ?auto_6866 ?auto_6871 ) ) ( not ( = ?auto_6866 ?auto_6877 ) ) ( not ( = ?auto_6867 ?auto_6871 ) ) ( not ( = ?auto_6867 ?auto_6877 ) ) ( not ( = ?auto_6868 ?auto_6871 ) ) ( not ( = ?auto_6868 ?auto_6877 ) ) ( not ( = ?auto_6869 ?auto_6871 ) ) ( not ( = ?auto_6869 ?auto_6877 ) ) ( not ( = ?auto_6870 ?auto_6871 ) ) ( not ( = ?auto_6870 ?auto_6877 ) ) ( not ( = ?auto_6871 ?auto_6882 ) ) ( not ( = ?auto_6871 ?auto_6880 ) ) ( not ( = ?auto_6871 ?auto_6884 ) ) ( not ( = ?auto_6871 ?auto_6890 ) ) ( not ( = ?auto_6871 ?auto_6879 ) ) ( not ( = ?auto_6871 ?auto_6891 ) ) ( not ( = ?auto_6871 ?auto_6889 ) ) ( not ( = ?auto_6878 ?auto_6883 ) ) ( not ( = ?auto_6878 ?auto_6896 ) ) ( not ( = ?auto_6878 ?auto_6885 ) ) ( not ( = ?auto_6878 ?auto_6888 ) ) ( not ( = ?auto_6878 ?auto_6881 ) ) ( not ( = ?auto_6878 ?auto_6886 ) ) ( not ( = ?auto_6878 ?auto_6897 ) ) ( not ( = ?auto_6875 ?auto_6898 ) ) ( not ( = ?auto_6875 ?auto_6899 ) ) ( not ( = ?auto_6875 ?auto_6894 ) ) ( not ( = ?auto_6875 ?auto_6895 ) ) ( not ( = ?auto_6875 ?auto_6887 ) ) ( not ( = ?auto_6875 ?auto_6892 ) ) ( not ( = ?auto_6875 ?auto_6893 ) ) ( not ( = ?auto_6877 ?auto_6882 ) ) ( not ( = ?auto_6877 ?auto_6880 ) ) ( not ( = ?auto_6877 ?auto_6884 ) ) ( not ( = ?auto_6877 ?auto_6890 ) ) ( not ( = ?auto_6877 ?auto_6879 ) ) ( not ( = ?auto_6877 ?auto_6891 ) ) ( not ( = ?auto_6877 ?auto_6889 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_6864 ?auto_6865 ?auto_6866 ?auto_6867 ?auto_6868 ?auto_6869 ?auto_6870 ?auto_6872 )
      ( MAKE-1CRATE ?auto_6872 ?auto_6871 )
      ( MAKE-8CRATE-VERIFY ?auto_6864 ?auto_6865 ?auto_6866 ?auto_6867 ?auto_6868 ?auto_6869 ?auto_6870 ?auto_6872 ?auto_6871 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6902 - SURFACE
      ?auto_6903 - SURFACE
    )
    :vars
    (
      ?auto_6904 - HOIST
      ?auto_6905 - PLACE
      ?auto_6907 - PLACE
      ?auto_6908 - HOIST
      ?auto_6909 - SURFACE
      ?auto_6906 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6904 ?auto_6905 ) ( SURFACE-AT ?auto_6902 ?auto_6905 ) ( CLEAR ?auto_6902 ) ( IS-CRATE ?auto_6903 ) ( AVAILABLE ?auto_6904 ) ( not ( = ?auto_6907 ?auto_6905 ) ) ( HOIST-AT ?auto_6908 ?auto_6907 ) ( AVAILABLE ?auto_6908 ) ( SURFACE-AT ?auto_6903 ?auto_6907 ) ( ON ?auto_6903 ?auto_6909 ) ( CLEAR ?auto_6903 ) ( TRUCK-AT ?auto_6906 ?auto_6905 ) ( not ( = ?auto_6902 ?auto_6903 ) ) ( not ( = ?auto_6902 ?auto_6909 ) ) ( not ( = ?auto_6903 ?auto_6909 ) ) ( not ( = ?auto_6904 ?auto_6908 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6906 ?auto_6905 ?auto_6907 )
      ( !LIFT ?auto_6908 ?auto_6903 ?auto_6909 ?auto_6907 )
      ( !LOAD ?auto_6908 ?auto_6903 ?auto_6906 ?auto_6907 )
      ( !DRIVE ?auto_6906 ?auto_6907 ?auto_6905 )
      ( !UNLOAD ?auto_6904 ?auto_6903 ?auto_6906 ?auto_6905 )
      ( !DROP ?auto_6904 ?auto_6903 ?auto_6902 ?auto_6905 )
      ( MAKE-1CRATE-VERIFY ?auto_6902 ?auto_6903 ) )
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
      ?auto_6929 - SURFACE
      ?auto_6928 - SURFACE
      ?auto_6927 - SURFACE
    )
    :vars
    (
      ?auto_6935 - HOIST
      ?auto_6932 - PLACE
      ?auto_6934 - PLACE
      ?auto_6930 - HOIST
      ?auto_6931 - SURFACE
      ?auto_6957 - PLACE
      ?auto_6954 - HOIST
      ?auto_6955 - SURFACE
      ?auto_6952 - PLACE
      ?auto_6943 - HOIST
      ?auto_6959 - SURFACE
      ?auto_6941 - PLACE
      ?auto_6936 - HOIST
      ?auto_6953 - SURFACE
      ?auto_6950 - PLACE
      ?auto_6942 - HOIST
      ?auto_6951 - SURFACE
      ?auto_6945 - PLACE
      ?auto_6939 - HOIST
      ?auto_6946 - SURFACE
      ?auto_6956 - PLACE
      ?auto_6937 - HOIST
      ?auto_6940 - SURFACE
      ?auto_6949 - PLACE
      ?auto_6948 - HOIST
      ?auto_6947 - SURFACE
      ?auto_6938 - PLACE
      ?auto_6958 - HOIST
      ?auto_6944 - SURFACE
      ?auto_6933 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6935 ?auto_6932 ) ( IS-CRATE ?auto_6927 ) ( not ( = ?auto_6934 ?auto_6932 ) ) ( HOIST-AT ?auto_6930 ?auto_6934 ) ( AVAILABLE ?auto_6930 ) ( SURFACE-AT ?auto_6927 ?auto_6934 ) ( ON ?auto_6927 ?auto_6931 ) ( CLEAR ?auto_6927 ) ( not ( = ?auto_6928 ?auto_6927 ) ) ( not ( = ?auto_6928 ?auto_6931 ) ) ( not ( = ?auto_6927 ?auto_6931 ) ) ( not ( = ?auto_6935 ?auto_6930 ) ) ( IS-CRATE ?auto_6928 ) ( not ( = ?auto_6957 ?auto_6932 ) ) ( HOIST-AT ?auto_6954 ?auto_6957 ) ( AVAILABLE ?auto_6954 ) ( SURFACE-AT ?auto_6928 ?auto_6957 ) ( ON ?auto_6928 ?auto_6955 ) ( CLEAR ?auto_6928 ) ( not ( = ?auto_6929 ?auto_6928 ) ) ( not ( = ?auto_6929 ?auto_6955 ) ) ( not ( = ?auto_6928 ?auto_6955 ) ) ( not ( = ?auto_6935 ?auto_6954 ) ) ( IS-CRATE ?auto_6929 ) ( not ( = ?auto_6952 ?auto_6932 ) ) ( HOIST-AT ?auto_6943 ?auto_6952 ) ( AVAILABLE ?auto_6943 ) ( SURFACE-AT ?auto_6929 ?auto_6952 ) ( ON ?auto_6929 ?auto_6959 ) ( CLEAR ?auto_6929 ) ( not ( = ?auto_6926 ?auto_6929 ) ) ( not ( = ?auto_6926 ?auto_6959 ) ) ( not ( = ?auto_6929 ?auto_6959 ) ) ( not ( = ?auto_6935 ?auto_6943 ) ) ( IS-CRATE ?auto_6926 ) ( not ( = ?auto_6941 ?auto_6932 ) ) ( HOIST-AT ?auto_6936 ?auto_6941 ) ( AVAILABLE ?auto_6936 ) ( SURFACE-AT ?auto_6926 ?auto_6941 ) ( ON ?auto_6926 ?auto_6953 ) ( CLEAR ?auto_6926 ) ( not ( = ?auto_6925 ?auto_6926 ) ) ( not ( = ?auto_6925 ?auto_6953 ) ) ( not ( = ?auto_6926 ?auto_6953 ) ) ( not ( = ?auto_6935 ?auto_6936 ) ) ( IS-CRATE ?auto_6925 ) ( not ( = ?auto_6950 ?auto_6932 ) ) ( HOIST-AT ?auto_6942 ?auto_6950 ) ( AVAILABLE ?auto_6942 ) ( SURFACE-AT ?auto_6925 ?auto_6950 ) ( ON ?auto_6925 ?auto_6951 ) ( CLEAR ?auto_6925 ) ( not ( = ?auto_6924 ?auto_6925 ) ) ( not ( = ?auto_6924 ?auto_6951 ) ) ( not ( = ?auto_6925 ?auto_6951 ) ) ( not ( = ?auto_6935 ?auto_6942 ) ) ( IS-CRATE ?auto_6924 ) ( not ( = ?auto_6945 ?auto_6932 ) ) ( HOIST-AT ?auto_6939 ?auto_6945 ) ( AVAILABLE ?auto_6939 ) ( SURFACE-AT ?auto_6924 ?auto_6945 ) ( ON ?auto_6924 ?auto_6946 ) ( CLEAR ?auto_6924 ) ( not ( = ?auto_6923 ?auto_6924 ) ) ( not ( = ?auto_6923 ?auto_6946 ) ) ( not ( = ?auto_6924 ?auto_6946 ) ) ( not ( = ?auto_6935 ?auto_6939 ) ) ( IS-CRATE ?auto_6923 ) ( not ( = ?auto_6956 ?auto_6932 ) ) ( HOIST-AT ?auto_6937 ?auto_6956 ) ( AVAILABLE ?auto_6937 ) ( SURFACE-AT ?auto_6923 ?auto_6956 ) ( ON ?auto_6923 ?auto_6940 ) ( CLEAR ?auto_6923 ) ( not ( = ?auto_6922 ?auto_6923 ) ) ( not ( = ?auto_6922 ?auto_6940 ) ) ( not ( = ?auto_6923 ?auto_6940 ) ) ( not ( = ?auto_6935 ?auto_6937 ) ) ( IS-CRATE ?auto_6922 ) ( not ( = ?auto_6949 ?auto_6932 ) ) ( HOIST-AT ?auto_6948 ?auto_6949 ) ( AVAILABLE ?auto_6948 ) ( SURFACE-AT ?auto_6922 ?auto_6949 ) ( ON ?auto_6922 ?auto_6947 ) ( CLEAR ?auto_6922 ) ( not ( = ?auto_6921 ?auto_6922 ) ) ( not ( = ?auto_6921 ?auto_6947 ) ) ( not ( = ?auto_6922 ?auto_6947 ) ) ( not ( = ?auto_6935 ?auto_6948 ) ) ( SURFACE-AT ?auto_6920 ?auto_6932 ) ( CLEAR ?auto_6920 ) ( IS-CRATE ?auto_6921 ) ( AVAILABLE ?auto_6935 ) ( not ( = ?auto_6938 ?auto_6932 ) ) ( HOIST-AT ?auto_6958 ?auto_6938 ) ( AVAILABLE ?auto_6958 ) ( SURFACE-AT ?auto_6921 ?auto_6938 ) ( ON ?auto_6921 ?auto_6944 ) ( CLEAR ?auto_6921 ) ( TRUCK-AT ?auto_6933 ?auto_6932 ) ( not ( = ?auto_6920 ?auto_6921 ) ) ( not ( = ?auto_6920 ?auto_6944 ) ) ( not ( = ?auto_6921 ?auto_6944 ) ) ( not ( = ?auto_6935 ?auto_6958 ) ) ( not ( = ?auto_6920 ?auto_6922 ) ) ( not ( = ?auto_6920 ?auto_6947 ) ) ( not ( = ?auto_6922 ?auto_6944 ) ) ( not ( = ?auto_6949 ?auto_6938 ) ) ( not ( = ?auto_6948 ?auto_6958 ) ) ( not ( = ?auto_6947 ?auto_6944 ) ) ( not ( = ?auto_6920 ?auto_6923 ) ) ( not ( = ?auto_6920 ?auto_6940 ) ) ( not ( = ?auto_6921 ?auto_6923 ) ) ( not ( = ?auto_6921 ?auto_6940 ) ) ( not ( = ?auto_6923 ?auto_6947 ) ) ( not ( = ?auto_6923 ?auto_6944 ) ) ( not ( = ?auto_6956 ?auto_6949 ) ) ( not ( = ?auto_6956 ?auto_6938 ) ) ( not ( = ?auto_6937 ?auto_6948 ) ) ( not ( = ?auto_6937 ?auto_6958 ) ) ( not ( = ?auto_6940 ?auto_6947 ) ) ( not ( = ?auto_6940 ?auto_6944 ) ) ( not ( = ?auto_6920 ?auto_6924 ) ) ( not ( = ?auto_6920 ?auto_6946 ) ) ( not ( = ?auto_6921 ?auto_6924 ) ) ( not ( = ?auto_6921 ?auto_6946 ) ) ( not ( = ?auto_6922 ?auto_6924 ) ) ( not ( = ?auto_6922 ?auto_6946 ) ) ( not ( = ?auto_6924 ?auto_6940 ) ) ( not ( = ?auto_6924 ?auto_6947 ) ) ( not ( = ?auto_6924 ?auto_6944 ) ) ( not ( = ?auto_6945 ?auto_6956 ) ) ( not ( = ?auto_6945 ?auto_6949 ) ) ( not ( = ?auto_6945 ?auto_6938 ) ) ( not ( = ?auto_6939 ?auto_6937 ) ) ( not ( = ?auto_6939 ?auto_6948 ) ) ( not ( = ?auto_6939 ?auto_6958 ) ) ( not ( = ?auto_6946 ?auto_6940 ) ) ( not ( = ?auto_6946 ?auto_6947 ) ) ( not ( = ?auto_6946 ?auto_6944 ) ) ( not ( = ?auto_6920 ?auto_6925 ) ) ( not ( = ?auto_6920 ?auto_6951 ) ) ( not ( = ?auto_6921 ?auto_6925 ) ) ( not ( = ?auto_6921 ?auto_6951 ) ) ( not ( = ?auto_6922 ?auto_6925 ) ) ( not ( = ?auto_6922 ?auto_6951 ) ) ( not ( = ?auto_6923 ?auto_6925 ) ) ( not ( = ?auto_6923 ?auto_6951 ) ) ( not ( = ?auto_6925 ?auto_6946 ) ) ( not ( = ?auto_6925 ?auto_6940 ) ) ( not ( = ?auto_6925 ?auto_6947 ) ) ( not ( = ?auto_6925 ?auto_6944 ) ) ( not ( = ?auto_6950 ?auto_6945 ) ) ( not ( = ?auto_6950 ?auto_6956 ) ) ( not ( = ?auto_6950 ?auto_6949 ) ) ( not ( = ?auto_6950 ?auto_6938 ) ) ( not ( = ?auto_6942 ?auto_6939 ) ) ( not ( = ?auto_6942 ?auto_6937 ) ) ( not ( = ?auto_6942 ?auto_6948 ) ) ( not ( = ?auto_6942 ?auto_6958 ) ) ( not ( = ?auto_6951 ?auto_6946 ) ) ( not ( = ?auto_6951 ?auto_6940 ) ) ( not ( = ?auto_6951 ?auto_6947 ) ) ( not ( = ?auto_6951 ?auto_6944 ) ) ( not ( = ?auto_6920 ?auto_6926 ) ) ( not ( = ?auto_6920 ?auto_6953 ) ) ( not ( = ?auto_6921 ?auto_6926 ) ) ( not ( = ?auto_6921 ?auto_6953 ) ) ( not ( = ?auto_6922 ?auto_6926 ) ) ( not ( = ?auto_6922 ?auto_6953 ) ) ( not ( = ?auto_6923 ?auto_6926 ) ) ( not ( = ?auto_6923 ?auto_6953 ) ) ( not ( = ?auto_6924 ?auto_6926 ) ) ( not ( = ?auto_6924 ?auto_6953 ) ) ( not ( = ?auto_6926 ?auto_6951 ) ) ( not ( = ?auto_6926 ?auto_6946 ) ) ( not ( = ?auto_6926 ?auto_6940 ) ) ( not ( = ?auto_6926 ?auto_6947 ) ) ( not ( = ?auto_6926 ?auto_6944 ) ) ( not ( = ?auto_6941 ?auto_6950 ) ) ( not ( = ?auto_6941 ?auto_6945 ) ) ( not ( = ?auto_6941 ?auto_6956 ) ) ( not ( = ?auto_6941 ?auto_6949 ) ) ( not ( = ?auto_6941 ?auto_6938 ) ) ( not ( = ?auto_6936 ?auto_6942 ) ) ( not ( = ?auto_6936 ?auto_6939 ) ) ( not ( = ?auto_6936 ?auto_6937 ) ) ( not ( = ?auto_6936 ?auto_6948 ) ) ( not ( = ?auto_6936 ?auto_6958 ) ) ( not ( = ?auto_6953 ?auto_6951 ) ) ( not ( = ?auto_6953 ?auto_6946 ) ) ( not ( = ?auto_6953 ?auto_6940 ) ) ( not ( = ?auto_6953 ?auto_6947 ) ) ( not ( = ?auto_6953 ?auto_6944 ) ) ( not ( = ?auto_6920 ?auto_6929 ) ) ( not ( = ?auto_6920 ?auto_6959 ) ) ( not ( = ?auto_6921 ?auto_6929 ) ) ( not ( = ?auto_6921 ?auto_6959 ) ) ( not ( = ?auto_6922 ?auto_6929 ) ) ( not ( = ?auto_6922 ?auto_6959 ) ) ( not ( = ?auto_6923 ?auto_6929 ) ) ( not ( = ?auto_6923 ?auto_6959 ) ) ( not ( = ?auto_6924 ?auto_6929 ) ) ( not ( = ?auto_6924 ?auto_6959 ) ) ( not ( = ?auto_6925 ?auto_6929 ) ) ( not ( = ?auto_6925 ?auto_6959 ) ) ( not ( = ?auto_6929 ?auto_6953 ) ) ( not ( = ?auto_6929 ?auto_6951 ) ) ( not ( = ?auto_6929 ?auto_6946 ) ) ( not ( = ?auto_6929 ?auto_6940 ) ) ( not ( = ?auto_6929 ?auto_6947 ) ) ( not ( = ?auto_6929 ?auto_6944 ) ) ( not ( = ?auto_6952 ?auto_6941 ) ) ( not ( = ?auto_6952 ?auto_6950 ) ) ( not ( = ?auto_6952 ?auto_6945 ) ) ( not ( = ?auto_6952 ?auto_6956 ) ) ( not ( = ?auto_6952 ?auto_6949 ) ) ( not ( = ?auto_6952 ?auto_6938 ) ) ( not ( = ?auto_6943 ?auto_6936 ) ) ( not ( = ?auto_6943 ?auto_6942 ) ) ( not ( = ?auto_6943 ?auto_6939 ) ) ( not ( = ?auto_6943 ?auto_6937 ) ) ( not ( = ?auto_6943 ?auto_6948 ) ) ( not ( = ?auto_6943 ?auto_6958 ) ) ( not ( = ?auto_6959 ?auto_6953 ) ) ( not ( = ?auto_6959 ?auto_6951 ) ) ( not ( = ?auto_6959 ?auto_6946 ) ) ( not ( = ?auto_6959 ?auto_6940 ) ) ( not ( = ?auto_6959 ?auto_6947 ) ) ( not ( = ?auto_6959 ?auto_6944 ) ) ( not ( = ?auto_6920 ?auto_6928 ) ) ( not ( = ?auto_6920 ?auto_6955 ) ) ( not ( = ?auto_6921 ?auto_6928 ) ) ( not ( = ?auto_6921 ?auto_6955 ) ) ( not ( = ?auto_6922 ?auto_6928 ) ) ( not ( = ?auto_6922 ?auto_6955 ) ) ( not ( = ?auto_6923 ?auto_6928 ) ) ( not ( = ?auto_6923 ?auto_6955 ) ) ( not ( = ?auto_6924 ?auto_6928 ) ) ( not ( = ?auto_6924 ?auto_6955 ) ) ( not ( = ?auto_6925 ?auto_6928 ) ) ( not ( = ?auto_6925 ?auto_6955 ) ) ( not ( = ?auto_6926 ?auto_6928 ) ) ( not ( = ?auto_6926 ?auto_6955 ) ) ( not ( = ?auto_6928 ?auto_6959 ) ) ( not ( = ?auto_6928 ?auto_6953 ) ) ( not ( = ?auto_6928 ?auto_6951 ) ) ( not ( = ?auto_6928 ?auto_6946 ) ) ( not ( = ?auto_6928 ?auto_6940 ) ) ( not ( = ?auto_6928 ?auto_6947 ) ) ( not ( = ?auto_6928 ?auto_6944 ) ) ( not ( = ?auto_6957 ?auto_6952 ) ) ( not ( = ?auto_6957 ?auto_6941 ) ) ( not ( = ?auto_6957 ?auto_6950 ) ) ( not ( = ?auto_6957 ?auto_6945 ) ) ( not ( = ?auto_6957 ?auto_6956 ) ) ( not ( = ?auto_6957 ?auto_6949 ) ) ( not ( = ?auto_6957 ?auto_6938 ) ) ( not ( = ?auto_6954 ?auto_6943 ) ) ( not ( = ?auto_6954 ?auto_6936 ) ) ( not ( = ?auto_6954 ?auto_6942 ) ) ( not ( = ?auto_6954 ?auto_6939 ) ) ( not ( = ?auto_6954 ?auto_6937 ) ) ( not ( = ?auto_6954 ?auto_6948 ) ) ( not ( = ?auto_6954 ?auto_6958 ) ) ( not ( = ?auto_6955 ?auto_6959 ) ) ( not ( = ?auto_6955 ?auto_6953 ) ) ( not ( = ?auto_6955 ?auto_6951 ) ) ( not ( = ?auto_6955 ?auto_6946 ) ) ( not ( = ?auto_6955 ?auto_6940 ) ) ( not ( = ?auto_6955 ?auto_6947 ) ) ( not ( = ?auto_6955 ?auto_6944 ) ) ( not ( = ?auto_6920 ?auto_6927 ) ) ( not ( = ?auto_6920 ?auto_6931 ) ) ( not ( = ?auto_6921 ?auto_6927 ) ) ( not ( = ?auto_6921 ?auto_6931 ) ) ( not ( = ?auto_6922 ?auto_6927 ) ) ( not ( = ?auto_6922 ?auto_6931 ) ) ( not ( = ?auto_6923 ?auto_6927 ) ) ( not ( = ?auto_6923 ?auto_6931 ) ) ( not ( = ?auto_6924 ?auto_6927 ) ) ( not ( = ?auto_6924 ?auto_6931 ) ) ( not ( = ?auto_6925 ?auto_6927 ) ) ( not ( = ?auto_6925 ?auto_6931 ) ) ( not ( = ?auto_6926 ?auto_6927 ) ) ( not ( = ?auto_6926 ?auto_6931 ) ) ( not ( = ?auto_6929 ?auto_6927 ) ) ( not ( = ?auto_6929 ?auto_6931 ) ) ( not ( = ?auto_6927 ?auto_6955 ) ) ( not ( = ?auto_6927 ?auto_6959 ) ) ( not ( = ?auto_6927 ?auto_6953 ) ) ( not ( = ?auto_6927 ?auto_6951 ) ) ( not ( = ?auto_6927 ?auto_6946 ) ) ( not ( = ?auto_6927 ?auto_6940 ) ) ( not ( = ?auto_6927 ?auto_6947 ) ) ( not ( = ?auto_6927 ?auto_6944 ) ) ( not ( = ?auto_6934 ?auto_6957 ) ) ( not ( = ?auto_6934 ?auto_6952 ) ) ( not ( = ?auto_6934 ?auto_6941 ) ) ( not ( = ?auto_6934 ?auto_6950 ) ) ( not ( = ?auto_6934 ?auto_6945 ) ) ( not ( = ?auto_6934 ?auto_6956 ) ) ( not ( = ?auto_6934 ?auto_6949 ) ) ( not ( = ?auto_6934 ?auto_6938 ) ) ( not ( = ?auto_6930 ?auto_6954 ) ) ( not ( = ?auto_6930 ?auto_6943 ) ) ( not ( = ?auto_6930 ?auto_6936 ) ) ( not ( = ?auto_6930 ?auto_6942 ) ) ( not ( = ?auto_6930 ?auto_6939 ) ) ( not ( = ?auto_6930 ?auto_6937 ) ) ( not ( = ?auto_6930 ?auto_6948 ) ) ( not ( = ?auto_6930 ?auto_6958 ) ) ( not ( = ?auto_6931 ?auto_6955 ) ) ( not ( = ?auto_6931 ?auto_6959 ) ) ( not ( = ?auto_6931 ?auto_6953 ) ) ( not ( = ?auto_6931 ?auto_6951 ) ) ( not ( = ?auto_6931 ?auto_6946 ) ) ( not ( = ?auto_6931 ?auto_6940 ) ) ( not ( = ?auto_6931 ?auto_6947 ) ) ( not ( = ?auto_6931 ?auto_6944 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_6920 ?auto_6921 ?auto_6922 ?auto_6923 ?auto_6924 ?auto_6925 ?auto_6926 ?auto_6929 ?auto_6928 )
      ( MAKE-1CRATE ?auto_6928 ?auto_6927 )
      ( MAKE-9CRATE-VERIFY ?auto_6920 ?auto_6921 ?auto_6922 ?auto_6923 ?auto_6924 ?auto_6925 ?auto_6926 ?auto_6929 ?auto_6928 ?auto_6927 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6962 - SURFACE
      ?auto_6963 - SURFACE
    )
    :vars
    (
      ?auto_6964 - HOIST
      ?auto_6965 - PLACE
      ?auto_6967 - PLACE
      ?auto_6968 - HOIST
      ?auto_6969 - SURFACE
      ?auto_6966 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6964 ?auto_6965 ) ( SURFACE-AT ?auto_6962 ?auto_6965 ) ( CLEAR ?auto_6962 ) ( IS-CRATE ?auto_6963 ) ( AVAILABLE ?auto_6964 ) ( not ( = ?auto_6967 ?auto_6965 ) ) ( HOIST-AT ?auto_6968 ?auto_6967 ) ( AVAILABLE ?auto_6968 ) ( SURFACE-AT ?auto_6963 ?auto_6967 ) ( ON ?auto_6963 ?auto_6969 ) ( CLEAR ?auto_6963 ) ( TRUCK-AT ?auto_6966 ?auto_6965 ) ( not ( = ?auto_6962 ?auto_6963 ) ) ( not ( = ?auto_6962 ?auto_6969 ) ) ( not ( = ?auto_6963 ?auto_6969 ) ) ( not ( = ?auto_6964 ?auto_6968 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6966 ?auto_6965 ?auto_6967 )
      ( !LIFT ?auto_6968 ?auto_6963 ?auto_6969 ?auto_6967 )
      ( !LOAD ?auto_6968 ?auto_6963 ?auto_6966 ?auto_6967 )
      ( !DRIVE ?auto_6966 ?auto_6967 ?auto_6965 )
      ( !UNLOAD ?auto_6964 ?auto_6963 ?auto_6966 ?auto_6965 )
      ( !DROP ?auto_6964 ?auto_6963 ?auto_6962 ?auto_6965 )
      ( MAKE-1CRATE-VERIFY ?auto_6962 ?auto_6963 ) )
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
      ?auto_6990 - SURFACE
      ?auto_6989 - SURFACE
      ?auto_6988 - SURFACE
      ?auto_6991 - SURFACE
    )
    :vars
    (
      ?auto_6992 - HOIST
      ?auto_6995 - PLACE
      ?auto_6993 - PLACE
      ?auto_6996 - HOIST
      ?auto_6997 - SURFACE
      ?auto_7001 - SURFACE
      ?auto_7007 - PLACE
      ?auto_6998 - HOIST
      ?auto_7003 - SURFACE
      ?auto_7004 - PLACE
      ?auto_7014 - HOIST
      ?auto_7021 - SURFACE
      ?auto_7000 - PLACE
      ?auto_7008 - HOIST
      ?auto_7019 - SURFACE
      ?auto_7022 - PLACE
      ?auto_7010 - HOIST
      ?auto_7016 - SURFACE
      ?auto_7012 - PLACE
      ?auto_7020 - HOIST
      ?auto_7006 - SURFACE
      ?auto_7002 - PLACE
      ?auto_7009 - HOIST
      ?auto_6999 - SURFACE
      ?auto_7013 - PLACE
      ?auto_7018 - HOIST
      ?auto_7015 - SURFACE
      ?auto_7005 - PLACE
      ?auto_7017 - HOIST
      ?auto_7011 - SURFACE
      ?auto_6994 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6992 ?auto_6995 ) ( IS-CRATE ?auto_6991 ) ( not ( = ?auto_6993 ?auto_6995 ) ) ( HOIST-AT ?auto_6996 ?auto_6993 ) ( SURFACE-AT ?auto_6991 ?auto_6993 ) ( ON ?auto_6991 ?auto_6997 ) ( CLEAR ?auto_6991 ) ( not ( = ?auto_6988 ?auto_6991 ) ) ( not ( = ?auto_6988 ?auto_6997 ) ) ( not ( = ?auto_6991 ?auto_6997 ) ) ( not ( = ?auto_6992 ?auto_6996 ) ) ( IS-CRATE ?auto_6988 ) ( AVAILABLE ?auto_6996 ) ( SURFACE-AT ?auto_6988 ?auto_6993 ) ( ON ?auto_6988 ?auto_7001 ) ( CLEAR ?auto_6988 ) ( not ( = ?auto_6989 ?auto_6988 ) ) ( not ( = ?auto_6989 ?auto_7001 ) ) ( not ( = ?auto_6988 ?auto_7001 ) ) ( IS-CRATE ?auto_6989 ) ( not ( = ?auto_7007 ?auto_6995 ) ) ( HOIST-AT ?auto_6998 ?auto_7007 ) ( AVAILABLE ?auto_6998 ) ( SURFACE-AT ?auto_6989 ?auto_7007 ) ( ON ?auto_6989 ?auto_7003 ) ( CLEAR ?auto_6989 ) ( not ( = ?auto_6990 ?auto_6989 ) ) ( not ( = ?auto_6990 ?auto_7003 ) ) ( not ( = ?auto_6989 ?auto_7003 ) ) ( not ( = ?auto_6992 ?auto_6998 ) ) ( IS-CRATE ?auto_6990 ) ( not ( = ?auto_7004 ?auto_6995 ) ) ( HOIST-AT ?auto_7014 ?auto_7004 ) ( AVAILABLE ?auto_7014 ) ( SURFACE-AT ?auto_6990 ?auto_7004 ) ( ON ?auto_6990 ?auto_7021 ) ( CLEAR ?auto_6990 ) ( not ( = ?auto_6987 ?auto_6990 ) ) ( not ( = ?auto_6987 ?auto_7021 ) ) ( not ( = ?auto_6990 ?auto_7021 ) ) ( not ( = ?auto_6992 ?auto_7014 ) ) ( IS-CRATE ?auto_6987 ) ( not ( = ?auto_7000 ?auto_6995 ) ) ( HOIST-AT ?auto_7008 ?auto_7000 ) ( AVAILABLE ?auto_7008 ) ( SURFACE-AT ?auto_6987 ?auto_7000 ) ( ON ?auto_6987 ?auto_7019 ) ( CLEAR ?auto_6987 ) ( not ( = ?auto_6986 ?auto_6987 ) ) ( not ( = ?auto_6986 ?auto_7019 ) ) ( not ( = ?auto_6987 ?auto_7019 ) ) ( not ( = ?auto_6992 ?auto_7008 ) ) ( IS-CRATE ?auto_6986 ) ( not ( = ?auto_7022 ?auto_6995 ) ) ( HOIST-AT ?auto_7010 ?auto_7022 ) ( AVAILABLE ?auto_7010 ) ( SURFACE-AT ?auto_6986 ?auto_7022 ) ( ON ?auto_6986 ?auto_7016 ) ( CLEAR ?auto_6986 ) ( not ( = ?auto_6985 ?auto_6986 ) ) ( not ( = ?auto_6985 ?auto_7016 ) ) ( not ( = ?auto_6986 ?auto_7016 ) ) ( not ( = ?auto_6992 ?auto_7010 ) ) ( IS-CRATE ?auto_6985 ) ( not ( = ?auto_7012 ?auto_6995 ) ) ( HOIST-AT ?auto_7020 ?auto_7012 ) ( AVAILABLE ?auto_7020 ) ( SURFACE-AT ?auto_6985 ?auto_7012 ) ( ON ?auto_6985 ?auto_7006 ) ( CLEAR ?auto_6985 ) ( not ( = ?auto_6984 ?auto_6985 ) ) ( not ( = ?auto_6984 ?auto_7006 ) ) ( not ( = ?auto_6985 ?auto_7006 ) ) ( not ( = ?auto_6992 ?auto_7020 ) ) ( IS-CRATE ?auto_6984 ) ( not ( = ?auto_7002 ?auto_6995 ) ) ( HOIST-AT ?auto_7009 ?auto_7002 ) ( AVAILABLE ?auto_7009 ) ( SURFACE-AT ?auto_6984 ?auto_7002 ) ( ON ?auto_6984 ?auto_6999 ) ( CLEAR ?auto_6984 ) ( not ( = ?auto_6983 ?auto_6984 ) ) ( not ( = ?auto_6983 ?auto_6999 ) ) ( not ( = ?auto_6984 ?auto_6999 ) ) ( not ( = ?auto_6992 ?auto_7009 ) ) ( IS-CRATE ?auto_6983 ) ( not ( = ?auto_7013 ?auto_6995 ) ) ( HOIST-AT ?auto_7018 ?auto_7013 ) ( AVAILABLE ?auto_7018 ) ( SURFACE-AT ?auto_6983 ?auto_7013 ) ( ON ?auto_6983 ?auto_7015 ) ( CLEAR ?auto_6983 ) ( not ( = ?auto_6982 ?auto_6983 ) ) ( not ( = ?auto_6982 ?auto_7015 ) ) ( not ( = ?auto_6983 ?auto_7015 ) ) ( not ( = ?auto_6992 ?auto_7018 ) ) ( SURFACE-AT ?auto_6981 ?auto_6995 ) ( CLEAR ?auto_6981 ) ( IS-CRATE ?auto_6982 ) ( AVAILABLE ?auto_6992 ) ( not ( = ?auto_7005 ?auto_6995 ) ) ( HOIST-AT ?auto_7017 ?auto_7005 ) ( AVAILABLE ?auto_7017 ) ( SURFACE-AT ?auto_6982 ?auto_7005 ) ( ON ?auto_6982 ?auto_7011 ) ( CLEAR ?auto_6982 ) ( TRUCK-AT ?auto_6994 ?auto_6995 ) ( not ( = ?auto_6981 ?auto_6982 ) ) ( not ( = ?auto_6981 ?auto_7011 ) ) ( not ( = ?auto_6982 ?auto_7011 ) ) ( not ( = ?auto_6992 ?auto_7017 ) ) ( not ( = ?auto_6981 ?auto_6983 ) ) ( not ( = ?auto_6981 ?auto_7015 ) ) ( not ( = ?auto_6983 ?auto_7011 ) ) ( not ( = ?auto_7013 ?auto_7005 ) ) ( not ( = ?auto_7018 ?auto_7017 ) ) ( not ( = ?auto_7015 ?auto_7011 ) ) ( not ( = ?auto_6981 ?auto_6984 ) ) ( not ( = ?auto_6981 ?auto_6999 ) ) ( not ( = ?auto_6982 ?auto_6984 ) ) ( not ( = ?auto_6982 ?auto_6999 ) ) ( not ( = ?auto_6984 ?auto_7015 ) ) ( not ( = ?auto_6984 ?auto_7011 ) ) ( not ( = ?auto_7002 ?auto_7013 ) ) ( not ( = ?auto_7002 ?auto_7005 ) ) ( not ( = ?auto_7009 ?auto_7018 ) ) ( not ( = ?auto_7009 ?auto_7017 ) ) ( not ( = ?auto_6999 ?auto_7015 ) ) ( not ( = ?auto_6999 ?auto_7011 ) ) ( not ( = ?auto_6981 ?auto_6985 ) ) ( not ( = ?auto_6981 ?auto_7006 ) ) ( not ( = ?auto_6982 ?auto_6985 ) ) ( not ( = ?auto_6982 ?auto_7006 ) ) ( not ( = ?auto_6983 ?auto_6985 ) ) ( not ( = ?auto_6983 ?auto_7006 ) ) ( not ( = ?auto_6985 ?auto_6999 ) ) ( not ( = ?auto_6985 ?auto_7015 ) ) ( not ( = ?auto_6985 ?auto_7011 ) ) ( not ( = ?auto_7012 ?auto_7002 ) ) ( not ( = ?auto_7012 ?auto_7013 ) ) ( not ( = ?auto_7012 ?auto_7005 ) ) ( not ( = ?auto_7020 ?auto_7009 ) ) ( not ( = ?auto_7020 ?auto_7018 ) ) ( not ( = ?auto_7020 ?auto_7017 ) ) ( not ( = ?auto_7006 ?auto_6999 ) ) ( not ( = ?auto_7006 ?auto_7015 ) ) ( not ( = ?auto_7006 ?auto_7011 ) ) ( not ( = ?auto_6981 ?auto_6986 ) ) ( not ( = ?auto_6981 ?auto_7016 ) ) ( not ( = ?auto_6982 ?auto_6986 ) ) ( not ( = ?auto_6982 ?auto_7016 ) ) ( not ( = ?auto_6983 ?auto_6986 ) ) ( not ( = ?auto_6983 ?auto_7016 ) ) ( not ( = ?auto_6984 ?auto_6986 ) ) ( not ( = ?auto_6984 ?auto_7016 ) ) ( not ( = ?auto_6986 ?auto_7006 ) ) ( not ( = ?auto_6986 ?auto_6999 ) ) ( not ( = ?auto_6986 ?auto_7015 ) ) ( not ( = ?auto_6986 ?auto_7011 ) ) ( not ( = ?auto_7022 ?auto_7012 ) ) ( not ( = ?auto_7022 ?auto_7002 ) ) ( not ( = ?auto_7022 ?auto_7013 ) ) ( not ( = ?auto_7022 ?auto_7005 ) ) ( not ( = ?auto_7010 ?auto_7020 ) ) ( not ( = ?auto_7010 ?auto_7009 ) ) ( not ( = ?auto_7010 ?auto_7018 ) ) ( not ( = ?auto_7010 ?auto_7017 ) ) ( not ( = ?auto_7016 ?auto_7006 ) ) ( not ( = ?auto_7016 ?auto_6999 ) ) ( not ( = ?auto_7016 ?auto_7015 ) ) ( not ( = ?auto_7016 ?auto_7011 ) ) ( not ( = ?auto_6981 ?auto_6987 ) ) ( not ( = ?auto_6981 ?auto_7019 ) ) ( not ( = ?auto_6982 ?auto_6987 ) ) ( not ( = ?auto_6982 ?auto_7019 ) ) ( not ( = ?auto_6983 ?auto_6987 ) ) ( not ( = ?auto_6983 ?auto_7019 ) ) ( not ( = ?auto_6984 ?auto_6987 ) ) ( not ( = ?auto_6984 ?auto_7019 ) ) ( not ( = ?auto_6985 ?auto_6987 ) ) ( not ( = ?auto_6985 ?auto_7019 ) ) ( not ( = ?auto_6987 ?auto_7016 ) ) ( not ( = ?auto_6987 ?auto_7006 ) ) ( not ( = ?auto_6987 ?auto_6999 ) ) ( not ( = ?auto_6987 ?auto_7015 ) ) ( not ( = ?auto_6987 ?auto_7011 ) ) ( not ( = ?auto_7000 ?auto_7022 ) ) ( not ( = ?auto_7000 ?auto_7012 ) ) ( not ( = ?auto_7000 ?auto_7002 ) ) ( not ( = ?auto_7000 ?auto_7013 ) ) ( not ( = ?auto_7000 ?auto_7005 ) ) ( not ( = ?auto_7008 ?auto_7010 ) ) ( not ( = ?auto_7008 ?auto_7020 ) ) ( not ( = ?auto_7008 ?auto_7009 ) ) ( not ( = ?auto_7008 ?auto_7018 ) ) ( not ( = ?auto_7008 ?auto_7017 ) ) ( not ( = ?auto_7019 ?auto_7016 ) ) ( not ( = ?auto_7019 ?auto_7006 ) ) ( not ( = ?auto_7019 ?auto_6999 ) ) ( not ( = ?auto_7019 ?auto_7015 ) ) ( not ( = ?auto_7019 ?auto_7011 ) ) ( not ( = ?auto_6981 ?auto_6990 ) ) ( not ( = ?auto_6981 ?auto_7021 ) ) ( not ( = ?auto_6982 ?auto_6990 ) ) ( not ( = ?auto_6982 ?auto_7021 ) ) ( not ( = ?auto_6983 ?auto_6990 ) ) ( not ( = ?auto_6983 ?auto_7021 ) ) ( not ( = ?auto_6984 ?auto_6990 ) ) ( not ( = ?auto_6984 ?auto_7021 ) ) ( not ( = ?auto_6985 ?auto_6990 ) ) ( not ( = ?auto_6985 ?auto_7021 ) ) ( not ( = ?auto_6986 ?auto_6990 ) ) ( not ( = ?auto_6986 ?auto_7021 ) ) ( not ( = ?auto_6990 ?auto_7019 ) ) ( not ( = ?auto_6990 ?auto_7016 ) ) ( not ( = ?auto_6990 ?auto_7006 ) ) ( not ( = ?auto_6990 ?auto_6999 ) ) ( not ( = ?auto_6990 ?auto_7015 ) ) ( not ( = ?auto_6990 ?auto_7011 ) ) ( not ( = ?auto_7004 ?auto_7000 ) ) ( not ( = ?auto_7004 ?auto_7022 ) ) ( not ( = ?auto_7004 ?auto_7012 ) ) ( not ( = ?auto_7004 ?auto_7002 ) ) ( not ( = ?auto_7004 ?auto_7013 ) ) ( not ( = ?auto_7004 ?auto_7005 ) ) ( not ( = ?auto_7014 ?auto_7008 ) ) ( not ( = ?auto_7014 ?auto_7010 ) ) ( not ( = ?auto_7014 ?auto_7020 ) ) ( not ( = ?auto_7014 ?auto_7009 ) ) ( not ( = ?auto_7014 ?auto_7018 ) ) ( not ( = ?auto_7014 ?auto_7017 ) ) ( not ( = ?auto_7021 ?auto_7019 ) ) ( not ( = ?auto_7021 ?auto_7016 ) ) ( not ( = ?auto_7021 ?auto_7006 ) ) ( not ( = ?auto_7021 ?auto_6999 ) ) ( not ( = ?auto_7021 ?auto_7015 ) ) ( not ( = ?auto_7021 ?auto_7011 ) ) ( not ( = ?auto_6981 ?auto_6989 ) ) ( not ( = ?auto_6981 ?auto_7003 ) ) ( not ( = ?auto_6982 ?auto_6989 ) ) ( not ( = ?auto_6982 ?auto_7003 ) ) ( not ( = ?auto_6983 ?auto_6989 ) ) ( not ( = ?auto_6983 ?auto_7003 ) ) ( not ( = ?auto_6984 ?auto_6989 ) ) ( not ( = ?auto_6984 ?auto_7003 ) ) ( not ( = ?auto_6985 ?auto_6989 ) ) ( not ( = ?auto_6985 ?auto_7003 ) ) ( not ( = ?auto_6986 ?auto_6989 ) ) ( not ( = ?auto_6986 ?auto_7003 ) ) ( not ( = ?auto_6987 ?auto_6989 ) ) ( not ( = ?auto_6987 ?auto_7003 ) ) ( not ( = ?auto_6989 ?auto_7021 ) ) ( not ( = ?auto_6989 ?auto_7019 ) ) ( not ( = ?auto_6989 ?auto_7016 ) ) ( not ( = ?auto_6989 ?auto_7006 ) ) ( not ( = ?auto_6989 ?auto_6999 ) ) ( not ( = ?auto_6989 ?auto_7015 ) ) ( not ( = ?auto_6989 ?auto_7011 ) ) ( not ( = ?auto_7007 ?auto_7004 ) ) ( not ( = ?auto_7007 ?auto_7000 ) ) ( not ( = ?auto_7007 ?auto_7022 ) ) ( not ( = ?auto_7007 ?auto_7012 ) ) ( not ( = ?auto_7007 ?auto_7002 ) ) ( not ( = ?auto_7007 ?auto_7013 ) ) ( not ( = ?auto_7007 ?auto_7005 ) ) ( not ( = ?auto_6998 ?auto_7014 ) ) ( not ( = ?auto_6998 ?auto_7008 ) ) ( not ( = ?auto_6998 ?auto_7010 ) ) ( not ( = ?auto_6998 ?auto_7020 ) ) ( not ( = ?auto_6998 ?auto_7009 ) ) ( not ( = ?auto_6998 ?auto_7018 ) ) ( not ( = ?auto_6998 ?auto_7017 ) ) ( not ( = ?auto_7003 ?auto_7021 ) ) ( not ( = ?auto_7003 ?auto_7019 ) ) ( not ( = ?auto_7003 ?auto_7016 ) ) ( not ( = ?auto_7003 ?auto_7006 ) ) ( not ( = ?auto_7003 ?auto_6999 ) ) ( not ( = ?auto_7003 ?auto_7015 ) ) ( not ( = ?auto_7003 ?auto_7011 ) ) ( not ( = ?auto_6981 ?auto_6988 ) ) ( not ( = ?auto_6981 ?auto_7001 ) ) ( not ( = ?auto_6982 ?auto_6988 ) ) ( not ( = ?auto_6982 ?auto_7001 ) ) ( not ( = ?auto_6983 ?auto_6988 ) ) ( not ( = ?auto_6983 ?auto_7001 ) ) ( not ( = ?auto_6984 ?auto_6988 ) ) ( not ( = ?auto_6984 ?auto_7001 ) ) ( not ( = ?auto_6985 ?auto_6988 ) ) ( not ( = ?auto_6985 ?auto_7001 ) ) ( not ( = ?auto_6986 ?auto_6988 ) ) ( not ( = ?auto_6986 ?auto_7001 ) ) ( not ( = ?auto_6987 ?auto_6988 ) ) ( not ( = ?auto_6987 ?auto_7001 ) ) ( not ( = ?auto_6990 ?auto_6988 ) ) ( not ( = ?auto_6990 ?auto_7001 ) ) ( not ( = ?auto_6988 ?auto_7003 ) ) ( not ( = ?auto_6988 ?auto_7021 ) ) ( not ( = ?auto_6988 ?auto_7019 ) ) ( not ( = ?auto_6988 ?auto_7016 ) ) ( not ( = ?auto_6988 ?auto_7006 ) ) ( not ( = ?auto_6988 ?auto_6999 ) ) ( not ( = ?auto_6988 ?auto_7015 ) ) ( not ( = ?auto_6988 ?auto_7011 ) ) ( not ( = ?auto_6993 ?auto_7007 ) ) ( not ( = ?auto_6993 ?auto_7004 ) ) ( not ( = ?auto_6993 ?auto_7000 ) ) ( not ( = ?auto_6993 ?auto_7022 ) ) ( not ( = ?auto_6993 ?auto_7012 ) ) ( not ( = ?auto_6993 ?auto_7002 ) ) ( not ( = ?auto_6993 ?auto_7013 ) ) ( not ( = ?auto_6993 ?auto_7005 ) ) ( not ( = ?auto_6996 ?auto_6998 ) ) ( not ( = ?auto_6996 ?auto_7014 ) ) ( not ( = ?auto_6996 ?auto_7008 ) ) ( not ( = ?auto_6996 ?auto_7010 ) ) ( not ( = ?auto_6996 ?auto_7020 ) ) ( not ( = ?auto_6996 ?auto_7009 ) ) ( not ( = ?auto_6996 ?auto_7018 ) ) ( not ( = ?auto_6996 ?auto_7017 ) ) ( not ( = ?auto_7001 ?auto_7003 ) ) ( not ( = ?auto_7001 ?auto_7021 ) ) ( not ( = ?auto_7001 ?auto_7019 ) ) ( not ( = ?auto_7001 ?auto_7016 ) ) ( not ( = ?auto_7001 ?auto_7006 ) ) ( not ( = ?auto_7001 ?auto_6999 ) ) ( not ( = ?auto_7001 ?auto_7015 ) ) ( not ( = ?auto_7001 ?auto_7011 ) ) ( not ( = ?auto_6981 ?auto_6991 ) ) ( not ( = ?auto_6981 ?auto_6997 ) ) ( not ( = ?auto_6982 ?auto_6991 ) ) ( not ( = ?auto_6982 ?auto_6997 ) ) ( not ( = ?auto_6983 ?auto_6991 ) ) ( not ( = ?auto_6983 ?auto_6997 ) ) ( not ( = ?auto_6984 ?auto_6991 ) ) ( not ( = ?auto_6984 ?auto_6997 ) ) ( not ( = ?auto_6985 ?auto_6991 ) ) ( not ( = ?auto_6985 ?auto_6997 ) ) ( not ( = ?auto_6986 ?auto_6991 ) ) ( not ( = ?auto_6986 ?auto_6997 ) ) ( not ( = ?auto_6987 ?auto_6991 ) ) ( not ( = ?auto_6987 ?auto_6997 ) ) ( not ( = ?auto_6990 ?auto_6991 ) ) ( not ( = ?auto_6990 ?auto_6997 ) ) ( not ( = ?auto_6989 ?auto_6991 ) ) ( not ( = ?auto_6989 ?auto_6997 ) ) ( not ( = ?auto_6991 ?auto_7001 ) ) ( not ( = ?auto_6991 ?auto_7003 ) ) ( not ( = ?auto_6991 ?auto_7021 ) ) ( not ( = ?auto_6991 ?auto_7019 ) ) ( not ( = ?auto_6991 ?auto_7016 ) ) ( not ( = ?auto_6991 ?auto_7006 ) ) ( not ( = ?auto_6991 ?auto_6999 ) ) ( not ( = ?auto_6991 ?auto_7015 ) ) ( not ( = ?auto_6991 ?auto_7011 ) ) ( not ( = ?auto_6997 ?auto_7001 ) ) ( not ( = ?auto_6997 ?auto_7003 ) ) ( not ( = ?auto_6997 ?auto_7021 ) ) ( not ( = ?auto_6997 ?auto_7019 ) ) ( not ( = ?auto_6997 ?auto_7016 ) ) ( not ( = ?auto_6997 ?auto_7006 ) ) ( not ( = ?auto_6997 ?auto_6999 ) ) ( not ( = ?auto_6997 ?auto_7015 ) ) ( not ( = ?auto_6997 ?auto_7011 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_6981 ?auto_6982 ?auto_6983 ?auto_6984 ?auto_6985 ?auto_6986 ?auto_6987 ?auto_6990 ?auto_6989 ?auto_6988 )
      ( MAKE-1CRATE ?auto_6988 ?auto_6991 )
      ( MAKE-10CRATE-VERIFY ?auto_6981 ?auto_6982 ?auto_6983 ?auto_6984 ?auto_6985 ?auto_6986 ?auto_6987 ?auto_6990 ?auto_6989 ?auto_6988 ?auto_6991 ) )
  )

)

