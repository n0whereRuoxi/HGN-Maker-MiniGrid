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
      ?auto_6650 - SURFACE
      ?auto_6651 - SURFACE
    )
    :vars
    (
      ?auto_6652 - HOIST
      ?auto_6653 - PLACE
      ?auto_6655 - PLACE
      ?auto_6656 - HOIST
      ?auto_6657 - SURFACE
      ?auto_6654 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6652 ?auto_6653 ) ( SURFACE-AT ?auto_6650 ?auto_6653 ) ( CLEAR ?auto_6650 ) ( IS-CRATE ?auto_6651 ) ( AVAILABLE ?auto_6652 ) ( not ( = ?auto_6655 ?auto_6653 ) ) ( HOIST-AT ?auto_6656 ?auto_6655 ) ( AVAILABLE ?auto_6656 ) ( SURFACE-AT ?auto_6651 ?auto_6655 ) ( ON ?auto_6651 ?auto_6657 ) ( CLEAR ?auto_6651 ) ( TRUCK-AT ?auto_6654 ?auto_6653 ) ( not ( = ?auto_6650 ?auto_6651 ) ) ( not ( = ?auto_6650 ?auto_6657 ) ) ( not ( = ?auto_6651 ?auto_6657 ) ) ( not ( = ?auto_6652 ?auto_6656 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6654 ?auto_6653 ?auto_6655 )
      ( !LIFT ?auto_6656 ?auto_6651 ?auto_6657 ?auto_6655 )
      ( !LOAD ?auto_6656 ?auto_6651 ?auto_6654 ?auto_6655 )
      ( !DRIVE ?auto_6654 ?auto_6655 ?auto_6653 )
      ( !UNLOAD ?auto_6652 ?auto_6651 ?auto_6654 ?auto_6653 )
      ( !DROP ?auto_6652 ?auto_6651 ?auto_6650 ?auto_6653 )
      ( MAKE-1CRATE-VERIFY ?auto_6650 ?auto_6651 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6671 - SURFACE
      ?auto_6672 - SURFACE
      ?auto_6673 - SURFACE
    )
    :vars
    (
      ?auto_6677 - HOIST
      ?auto_6676 - PLACE
      ?auto_6675 - PLACE
      ?auto_6679 - HOIST
      ?auto_6674 - SURFACE
      ?auto_6682 - PLACE
      ?auto_6680 - HOIST
      ?auto_6681 - SURFACE
      ?auto_6678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6677 ?auto_6676 ) ( IS-CRATE ?auto_6673 ) ( not ( = ?auto_6675 ?auto_6676 ) ) ( HOIST-AT ?auto_6679 ?auto_6675 ) ( AVAILABLE ?auto_6679 ) ( SURFACE-AT ?auto_6673 ?auto_6675 ) ( ON ?auto_6673 ?auto_6674 ) ( CLEAR ?auto_6673 ) ( not ( = ?auto_6672 ?auto_6673 ) ) ( not ( = ?auto_6672 ?auto_6674 ) ) ( not ( = ?auto_6673 ?auto_6674 ) ) ( not ( = ?auto_6677 ?auto_6679 ) ) ( SURFACE-AT ?auto_6671 ?auto_6676 ) ( CLEAR ?auto_6671 ) ( IS-CRATE ?auto_6672 ) ( AVAILABLE ?auto_6677 ) ( not ( = ?auto_6682 ?auto_6676 ) ) ( HOIST-AT ?auto_6680 ?auto_6682 ) ( AVAILABLE ?auto_6680 ) ( SURFACE-AT ?auto_6672 ?auto_6682 ) ( ON ?auto_6672 ?auto_6681 ) ( CLEAR ?auto_6672 ) ( TRUCK-AT ?auto_6678 ?auto_6676 ) ( not ( = ?auto_6671 ?auto_6672 ) ) ( not ( = ?auto_6671 ?auto_6681 ) ) ( not ( = ?auto_6672 ?auto_6681 ) ) ( not ( = ?auto_6677 ?auto_6680 ) ) ( not ( = ?auto_6671 ?auto_6673 ) ) ( not ( = ?auto_6671 ?auto_6674 ) ) ( not ( = ?auto_6673 ?auto_6681 ) ) ( not ( = ?auto_6675 ?auto_6682 ) ) ( not ( = ?auto_6679 ?auto_6680 ) ) ( not ( = ?auto_6674 ?auto_6681 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6671 ?auto_6672 )
      ( MAKE-1CRATE ?auto_6672 ?auto_6673 )
      ( MAKE-2CRATE-VERIFY ?auto_6671 ?auto_6672 ?auto_6673 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6697 - SURFACE
      ?auto_6698 - SURFACE
      ?auto_6699 - SURFACE
      ?auto_6700 - SURFACE
    )
    :vars
    (
      ?auto_6703 - HOIST
      ?auto_6705 - PLACE
      ?auto_6706 - PLACE
      ?auto_6704 - HOIST
      ?auto_6702 - SURFACE
      ?auto_6707 - PLACE
      ?auto_6711 - HOIST
      ?auto_6712 - SURFACE
      ?auto_6709 - PLACE
      ?auto_6710 - HOIST
      ?auto_6708 - SURFACE
      ?auto_6701 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6703 ?auto_6705 ) ( IS-CRATE ?auto_6700 ) ( not ( = ?auto_6706 ?auto_6705 ) ) ( HOIST-AT ?auto_6704 ?auto_6706 ) ( AVAILABLE ?auto_6704 ) ( SURFACE-AT ?auto_6700 ?auto_6706 ) ( ON ?auto_6700 ?auto_6702 ) ( CLEAR ?auto_6700 ) ( not ( = ?auto_6699 ?auto_6700 ) ) ( not ( = ?auto_6699 ?auto_6702 ) ) ( not ( = ?auto_6700 ?auto_6702 ) ) ( not ( = ?auto_6703 ?auto_6704 ) ) ( IS-CRATE ?auto_6699 ) ( not ( = ?auto_6707 ?auto_6705 ) ) ( HOIST-AT ?auto_6711 ?auto_6707 ) ( AVAILABLE ?auto_6711 ) ( SURFACE-AT ?auto_6699 ?auto_6707 ) ( ON ?auto_6699 ?auto_6712 ) ( CLEAR ?auto_6699 ) ( not ( = ?auto_6698 ?auto_6699 ) ) ( not ( = ?auto_6698 ?auto_6712 ) ) ( not ( = ?auto_6699 ?auto_6712 ) ) ( not ( = ?auto_6703 ?auto_6711 ) ) ( SURFACE-AT ?auto_6697 ?auto_6705 ) ( CLEAR ?auto_6697 ) ( IS-CRATE ?auto_6698 ) ( AVAILABLE ?auto_6703 ) ( not ( = ?auto_6709 ?auto_6705 ) ) ( HOIST-AT ?auto_6710 ?auto_6709 ) ( AVAILABLE ?auto_6710 ) ( SURFACE-AT ?auto_6698 ?auto_6709 ) ( ON ?auto_6698 ?auto_6708 ) ( CLEAR ?auto_6698 ) ( TRUCK-AT ?auto_6701 ?auto_6705 ) ( not ( = ?auto_6697 ?auto_6698 ) ) ( not ( = ?auto_6697 ?auto_6708 ) ) ( not ( = ?auto_6698 ?auto_6708 ) ) ( not ( = ?auto_6703 ?auto_6710 ) ) ( not ( = ?auto_6697 ?auto_6699 ) ) ( not ( = ?auto_6697 ?auto_6712 ) ) ( not ( = ?auto_6699 ?auto_6708 ) ) ( not ( = ?auto_6707 ?auto_6709 ) ) ( not ( = ?auto_6711 ?auto_6710 ) ) ( not ( = ?auto_6712 ?auto_6708 ) ) ( not ( = ?auto_6697 ?auto_6700 ) ) ( not ( = ?auto_6697 ?auto_6702 ) ) ( not ( = ?auto_6698 ?auto_6700 ) ) ( not ( = ?auto_6698 ?auto_6702 ) ) ( not ( = ?auto_6700 ?auto_6712 ) ) ( not ( = ?auto_6700 ?auto_6708 ) ) ( not ( = ?auto_6706 ?auto_6707 ) ) ( not ( = ?auto_6706 ?auto_6709 ) ) ( not ( = ?auto_6704 ?auto_6711 ) ) ( not ( = ?auto_6704 ?auto_6710 ) ) ( not ( = ?auto_6702 ?auto_6712 ) ) ( not ( = ?auto_6702 ?auto_6708 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6697 ?auto_6698 ?auto_6699 )
      ( MAKE-1CRATE ?auto_6699 ?auto_6700 )
      ( MAKE-3CRATE-VERIFY ?auto_6697 ?auto_6698 ?auto_6699 ?auto_6700 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6728 - SURFACE
      ?auto_6729 - SURFACE
      ?auto_6730 - SURFACE
      ?auto_6731 - SURFACE
      ?auto_6732 - SURFACE
    )
    :vars
    (
      ?auto_6736 - HOIST
      ?auto_6738 - PLACE
      ?auto_6737 - PLACE
      ?auto_6733 - HOIST
      ?auto_6734 - SURFACE
      ?auto_6745 - SURFACE
      ?auto_6739 - PLACE
      ?auto_6743 - HOIST
      ?auto_6741 - SURFACE
      ?auto_6742 - PLACE
      ?auto_6744 - HOIST
      ?auto_6740 - SURFACE
      ?auto_6735 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6736 ?auto_6738 ) ( IS-CRATE ?auto_6732 ) ( not ( = ?auto_6737 ?auto_6738 ) ) ( HOIST-AT ?auto_6733 ?auto_6737 ) ( SURFACE-AT ?auto_6732 ?auto_6737 ) ( ON ?auto_6732 ?auto_6734 ) ( CLEAR ?auto_6732 ) ( not ( = ?auto_6731 ?auto_6732 ) ) ( not ( = ?auto_6731 ?auto_6734 ) ) ( not ( = ?auto_6732 ?auto_6734 ) ) ( not ( = ?auto_6736 ?auto_6733 ) ) ( IS-CRATE ?auto_6731 ) ( AVAILABLE ?auto_6733 ) ( SURFACE-AT ?auto_6731 ?auto_6737 ) ( ON ?auto_6731 ?auto_6745 ) ( CLEAR ?auto_6731 ) ( not ( = ?auto_6730 ?auto_6731 ) ) ( not ( = ?auto_6730 ?auto_6745 ) ) ( not ( = ?auto_6731 ?auto_6745 ) ) ( IS-CRATE ?auto_6730 ) ( not ( = ?auto_6739 ?auto_6738 ) ) ( HOIST-AT ?auto_6743 ?auto_6739 ) ( AVAILABLE ?auto_6743 ) ( SURFACE-AT ?auto_6730 ?auto_6739 ) ( ON ?auto_6730 ?auto_6741 ) ( CLEAR ?auto_6730 ) ( not ( = ?auto_6729 ?auto_6730 ) ) ( not ( = ?auto_6729 ?auto_6741 ) ) ( not ( = ?auto_6730 ?auto_6741 ) ) ( not ( = ?auto_6736 ?auto_6743 ) ) ( SURFACE-AT ?auto_6728 ?auto_6738 ) ( CLEAR ?auto_6728 ) ( IS-CRATE ?auto_6729 ) ( AVAILABLE ?auto_6736 ) ( not ( = ?auto_6742 ?auto_6738 ) ) ( HOIST-AT ?auto_6744 ?auto_6742 ) ( AVAILABLE ?auto_6744 ) ( SURFACE-AT ?auto_6729 ?auto_6742 ) ( ON ?auto_6729 ?auto_6740 ) ( CLEAR ?auto_6729 ) ( TRUCK-AT ?auto_6735 ?auto_6738 ) ( not ( = ?auto_6728 ?auto_6729 ) ) ( not ( = ?auto_6728 ?auto_6740 ) ) ( not ( = ?auto_6729 ?auto_6740 ) ) ( not ( = ?auto_6736 ?auto_6744 ) ) ( not ( = ?auto_6728 ?auto_6730 ) ) ( not ( = ?auto_6728 ?auto_6741 ) ) ( not ( = ?auto_6730 ?auto_6740 ) ) ( not ( = ?auto_6739 ?auto_6742 ) ) ( not ( = ?auto_6743 ?auto_6744 ) ) ( not ( = ?auto_6741 ?auto_6740 ) ) ( not ( = ?auto_6728 ?auto_6731 ) ) ( not ( = ?auto_6728 ?auto_6745 ) ) ( not ( = ?auto_6729 ?auto_6731 ) ) ( not ( = ?auto_6729 ?auto_6745 ) ) ( not ( = ?auto_6731 ?auto_6741 ) ) ( not ( = ?auto_6731 ?auto_6740 ) ) ( not ( = ?auto_6737 ?auto_6739 ) ) ( not ( = ?auto_6737 ?auto_6742 ) ) ( not ( = ?auto_6733 ?auto_6743 ) ) ( not ( = ?auto_6733 ?auto_6744 ) ) ( not ( = ?auto_6745 ?auto_6741 ) ) ( not ( = ?auto_6745 ?auto_6740 ) ) ( not ( = ?auto_6728 ?auto_6732 ) ) ( not ( = ?auto_6728 ?auto_6734 ) ) ( not ( = ?auto_6729 ?auto_6732 ) ) ( not ( = ?auto_6729 ?auto_6734 ) ) ( not ( = ?auto_6730 ?auto_6732 ) ) ( not ( = ?auto_6730 ?auto_6734 ) ) ( not ( = ?auto_6732 ?auto_6745 ) ) ( not ( = ?auto_6732 ?auto_6741 ) ) ( not ( = ?auto_6732 ?auto_6740 ) ) ( not ( = ?auto_6734 ?auto_6745 ) ) ( not ( = ?auto_6734 ?auto_6741 ) ) ( not ( = ?auto_6734 ?auto_6740 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_6728 ?auto_6729 ?auto_6730 ?auto_6731 )
      ( MAKE-1CRATE ?auto_6731 ?auto_6732 )
      ( MAKE-4CRATE-VERIFY ?auto_6728 ?auto_6729 ?auto_6730 ?auto_6731 ?auto_6732 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_6762 - SURFACE
      ?auto_6763 - SURFACE
      ?auto_6764 - SURFACE
      ?auto_6765 - SURFACE
      ?auto_6766 - SURFACE
      ?auto_6767 - SURFACE
    )
    :vars
    (
      ?auto_6772 - HOIST
      ?auto_6769 - PLACE
      ?auto_6770 - PLACE
      ?auto_6768 - HOIST
      ?auto_6773 - SURFACE
      ?auto_6777 - PLACE
      ?auto_6779 - HOIST
      ?auto_6778 - SURFACE
      ?auto_6776 - SURFACE
      ?auto_6775 - PLACE
      ?auto_6781 - HOIST
      ?auto_6774 - SURFACE
      ?auto_6780 - SURFACE
      ?auto_6771 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6772 ?auto_6769 ) ( IS-CRATE ?auto_6767 ) ( not ( = ?auto_6770 ?auto_6769 ) ) ( HOIST-AT ?auto_6768 ?auto_6770 ) ( SURFACE-AT ?auto_6767 ?auto_6770 ) ( ON ?auto_6767 ?auto_6773 ) ( CLEAR ?auto_6767 ) ( not ( = ?auto_6766 ?auto_6767 ) ) ( not ( = ?auto_6766 ?auto_6773 ) ) ( not ( = ?auto_6767 ?auto_6773 ) ) ( not ( = ?auto_6772 ?auto_6768 ) ) ( IS-CRATE ?auto_6766 ) ( not ( = ?auto_6777 ?auto_6769 ) ) ( HOIST-AT ?auto_6779 ?auto_6777 ) ( SURFACE-AT ?auto_6766 ?auto_6777 ) ( ON ?auto_6766 ?auto_6778 ) ( CLEAR ?auto_6766 ) ( not ( = ?auto_6765 ?auto_6766 ) ) ( not ( = ?auto_6765 ?auto_6778 ) ) ( not ( = ?auto_6766 ?auto_6778 ) ) ( not ( = ?auto_6772 ?auto_6779 ) ) ( IS-CRATE ?auto_6765 ) ( AVAILABLE ?auto_6779 ) ( SURFACE-AT ?auto_6765 ?auto_6777 ) ( ON ?auto_6765 ?auto_6776 ) ( CLEAR ?auto_6765 ) ( not ( = ?auto_6764 ?auto_6765 ) ) ( not ( = ?auto_6764 ?auto_6776 ) ) ( not ( = ?auto_6765 ?auto_6776 ) ) ( IS-CRATE ?auto_6764 ) ( not ( = ?auto_6775 ?auto_6769 ) ) ( HOIST-AT ?auto_6781 ?auto_6775 ) ( AVAILABLE ?auto_6781 ) ( SURFACE-AT ?auto_6764 ?auto_6775 ) ( ON ?auto_6764 ?auto_6774 ) ( CLEAR ?auto_6764 ) ( not ( = ?auto_6763 ?auto_6764 ) ) ( not ( = ?auto_6763 ?auto_6774 ) ) ( not ( = ?auto_6764 ?auto_6774 ) ) ( not ( = ?auto_6772 ?auto_6781 ) ) ( SURFACE-AT ?auto_6762 ?auto_6769 ) ( CLEAR ?auto_6762 ) ( IS-CRATE ?auto_6763 ) ( AVAILABLE ?auto_6772 ) ( AVAILABLE ?auto_6768 ) ( SURFACE-AT ?auto_6763 ?auto_6770 ) ( ON ?auto_6763 ?auto_6780 ) ( CLEAR ?auto_6763 ) ( TRUCK-AT ?auto_6771 ?auto_6769 ) ( not ( = ?auto_6762 ?auto_6763 ) ) ( not ( = ?auto_6762 ?auto_6780 ) ) ( not ( = ?auto_6763 ?auto_6780 ) ) ( not ( = ?auto_6762 ?auto_6764 ) ) ( not ( = ?auto_6762 ?auto_6774 ) ) ( not ( = ?auto_6764 ?auto_6780 ) ) ( not ( = ?auto_6775 ?auto_6770 ) ) ( not ( = ?auto_6781 ?auto_6768 ) ) ( not ( = ?auto_6774 ?auto_6780 ) ) ( not ( = ?auto_6762 ?auto_6765 ) ) ( not ( = ?auto_6762 ?auto_6776 ) ) ( not ( = ?auto_6763 ?auto_6765 ) ) ( not ( = ?auto_6763 ?auto_6776 ) ) ( not ( = ?auto_6765 ?auto_6774 ) ) ( not ( = ?auto_6765 ?auto_6780 ) ) ( not ( = ?auto_6777 ?auto_6775 ) ) ( not ( = ?auto_6777 ?auto_6770 ) ) ( not ( = ?auto_6779 ?auto_6781 ) ) ( not ( = ?auto_6779 ?auto_6768 ) ) ( not ( = ?auto_6776 ?auto_6774 ) ) ( not ( = ?auto_6776 ?auto_6780 ) ) ( not ( = ?auto_6762 ?auto_6766 ) ) ( not ( = ?auto_6762 ?auto_6778 ) ) ( not ( = ?auto_6763 ?auto_6766 ) ) ( not ( = ?auto_6763 ?auto_6778 ) ) ( not ( = ?auto_6764 ?auto_6766 ) ) ( not ( = ?auto_6764 ?auto_6778 ) ) ( not ( = ?auto_6766 ?auto_6776 ) ) ( not ( = ?auto_6766 ?auto_6774 ) ) ( not ( = ?auto_6766 ?auto_6780 ) ) ( not ( = ?auto_6778 ?auto_6776 ) ) ( not ( = ?auto_6778 ?auto_6774 ) ) ( not ( = ?auto_6778 ?auto_6780 ) ) ( not ( = ?auto_6762 ?auto_6767 ) ) ( not ( = ?auto_6762 ?auto_6773 ) ) ( not ( = ?auto_6763 ?auto_6767 ) ) ( not ( = ?auto_6763 ?auto_6773 ) ) ( not ( = ?auto_6764 ?auto_6767 ) ) ( not ( = ?auto_6764 ?auto_6773 ) ) ( not ( = ?auto_6765 ?auto_6767 ) ) ( not ( = ?auto_6765 ?auto_6773 ) ) ( not ( = ?auto_6767 ?auto_6778 ) ) ( not ( = ?auto_6767 ?auto_6776 ) ) ( not ( = ?auto_6767 ?auto_6774 ) ) ( not ( = ?auto_6767 ?auto_6780 ) ) ( not ( = ?auto_6773 ?auto_6778 ) ) ( not ( = ?auto_6773 ?auto_6776 ) ) ( not ( = ?auto_6773 ?auto_6774 ) ) ( not ( = ?auto_6773 ?auto_6780 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_6762 ?auto_6763 ?auto_6764 ?auto_6765 ?auto_6766 )
      ( MAKE-1CRATE ?auto_6766 ?auto_6767 )
      ( MAKE-5CRATE-VERIFY ?auto_6762 ?auto_6763 ?auto_6764 ?auto_6765 ?auto_6766 ?auto_6767 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_6799 - SURFACE
      ?auto_6800 - SURFACE
      ?auto_6801 - SURFACE
      ?auto_6802 - SURFACE
      ?auto_6803 - SURFACE
      ?auto_6804 - SURFACE
      ?auto_6805 - SURFACE
    )
    :vars
    (
      ?auto_6809 - HOIST
      ?auto_6811 - PLACE
      ?auto_6810 - PLACE
      ?auto_6808 - HOIST
      ?auto_6807 - SURFACE
      ?auto_6814 - PLACE
      ?auto_6813 - HOIST
      ?auto_6821 - SURFACE
      ?auto_6815 - PLACE
      ?auto_6816 - HOIST
      ?auto_6819 - SURFACE
      ?auto_6822 - SURFACE
      ?auto_6817 - PLACE
      ?auto_6812 - HOIST
      ?auto_6818 - SURFACE
      ?auto_6820 - SURFACE
      ?auto_6806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6809 ?auto_6811 ) ( IS-CRATE ?auto_6805 ) ( not ( = ?auto_6810 ?auto_6811 ) ) ( HOIST-AT ?auto_6808 ?auto_6810 ) ( AVAILABLE ?auto_6808 ) ( SURFACE-AT ?auto_6805 ?auto_6810 ) ( ON ?auto_6805 ?auto_6807 ) ( CLEAR ?auto_6805 ) ( not ( = ?auto_6804 ?auto_6805 ) ) ( not ( = ?auto_6804 ?auto_6807 ) ) ( not ( = ?auto_6805 ?auto_6807 ) ) ( not ( = ?auto_6809 ?auto_6808 ) ) ( IS-CRATE ?auto_6804 ) ( not ( = ?auto_6814 ?auto_6811 ) ) ( HOIST-AT ?auto_6813 ?auto_6814 ) ( SURFACE-AT ?auto_6804 ?auto_6814 ) ( ON ?auto_6804 ?auto_6821 ) ( CLEAR ?auto_6804 ) ( not ( = ?auto_6803 ?auto_6804 ) ) ( not ( = ?auto_6803 ?auto_6821 ) ) ( not ( = ?auto_6804 ?auto_6821 ) ) ( not ( = ?auto_6809 ?auto_6813 ) ) ( IS-CRATE ?auto_6803 ) ( not ( = ?auto_6815 ?auto_6811 ) ) ( HOIST-AT ?auto_6816 ?auto_6815 ) ( SURFACE-AT ?auto_6803 ?auto_6815 ) ( ON ?auto_6803 ?auto_6819 ) ( CLEAR ?auto_6803 ) ( not ( = ?auto_6802 ?auto_6803 ) ) ( not ( = ?auto_6802 ?auto_6819 ) ) ( not ( = ?auto_6803 ?auto_6819 ) ) ( not ( = ?auto_6809 ?auto_6816 ) ) ( IS-CRATE ?auto_6802 ) ( AVAILABLE ?auto_6816 ) ( SURFACE-AT ?auto_6802 ?auto_6815 ) ( ON ?auto_6802 ?auto_6822 ) ( CLEAR ?auto_6802 ) ( not ( = ?auto_6801 ?auto_6802 ) ) ( not ( = ?auto_6801 ?auto_6822 ) ) ( not ( = ?auto_6802 ?auto_6822 ) ) ( IS-CRATE ?auto_6801 ) ( not ( = ?auto_6817 ?auto_6811 ) ) ( HOIST-AT ?auto_6812 ?auto_6817 ) ( AVAILABLE ?auto_6812 ) ( SURFACE-AT ?auto_6801 ?auto_6817 ) ( ON ?auto_6801 ?auto_6818 ) ( CLEAR ?auto_6801 ) ( not ( = ?auto_6800 ?auto_6801 ) ) ( not ( = ?auto_6800 ?auto_6818 ) ) ( not ( = ?auto_6801 ?auto_6818 ) ) ( not ( = ?auto_6809 ?auto_6812 ) ) ( SURFACE-AT ?auto_6799 ?auto_6811 ) ( CLEAR ?auto_6799 ) ( IS-CRATE ?auto_6800 ) ( AVAILABLE ?auto_6809 ) ( AVAILABLE ?auto_6813 ) ( SURFACE-AT ?auto_6800 ?auto_6814 ) ( ON ?auto_6800 ?auto_6820 ) ( CLEAR ?auto_6800 ) ( TRUCK-AT ?auto_6806 ?auto_6811 ) ( not ( = ?auto_6799 ?auto_6800 ) ) ( not ( = ?auto_6799 ?auto_6820 ) ) ( not ( = ?auto_6800 ?auto_6820 ) ) ( not ( = ?auto_6799 ?auto_6801 ) ) ( not ( = ?auto_6799 ?auto_6818 ) ) ( not ( = ?auto_6801 ?auto_6820 ) ) ( not ( = ?auto_6817 ?auto_6814 ) ) ( not ( = ?auto_6812 ?auto_6813 ) ) ( not ( = ?auto_6818 ?auto_6820 ) ) ( not ( = ?auto_6799 ?auto_6802 ) ) ( not ( = ?auto_6799 ?auto_6822 ) ) ( not ( = ?auto_6800 ?auto_6802 ) ) ( not ( = ?auto_6800 ?auto_6822 ) ) ( not ( = ?auto_6802 ?auto_6818 ) ) ( not ( = ?auto_6802 ?auto_6820 ) ) ( not ( = ?auto_6815 ?auto_6817 ) ) ( not ( = ?auto_6815 ?auto_6814 ) ) ( not ( = ?auto_6816 ?auto_6812 ) ) ( not ( = ?auto_6816 ?auto_6813 ) ) ( not ( = ?auto_6822 ?auto_6818 ) ) ( not ( = ?auto_6822 ?auto_6820 ) ) ( not ( = ?auto_6799 ?auto_6803 ) ) ( not ( = ?auto_6799 ?auto_6819 ) ) ( not ( = ?auto_6800 ?auto_6803 ) ) ( not ( = ?auto_6800 ?auto_6819 ) ) ( not ( = ?auto_6801 ?auto_6803 ) ) ( not ( = ?auto_6801 ?auto_6819 ) ) ( not ( = ?auto_6803 ?auto_6822 ) ) ( not ( = ?auto_6803 ?auto_6818 ) ) ( not ( = ?auto_6803 ?auto_6820 ) ) ( not ( = ?auto_6819 ?auto_6822 ) ) ( not ( = ?auto_6819 ?auto_6818 ) ) ( not ( = ?auto_6819 ?auto_6820 ) ) ( not ( = ?auto_6799 ?auto_6804 ) ) ( not ( = ?auto_6799 ?auto_6821 ) ) ( not ( = ?auto_6800 ?auto_6804 ) ) ( not ( = ?auto_6800 ?auto_6821 ) ) ( not ( = ?auto_6801 ?auto_6804 ) ) ( not ( = ?auto_6801 ?auto_6821 ) ) ( not ( = ?auto_6802 ?auto_6804 ) ) ( not ( = ?auto_6802 ?auto_6821 ) ) ( not ( = ?auto_6804 ?auto_6819 ) ) ( not ( = ?auto_6804 ?auto_6822 ) ) ( not ( = ?auto_6804 ?auto_6818 ) ) ( not ( = ?auto_6804 ?auto_6820 ) ) ( not ( = ?auto_6821 ?auto_6819 ) ) ( not ( = ?auto_6821 ?auto_6822 ) ) ( not ( = ?auto_6821 ?auto_6818 ) ) ( not ( = ?auto_6821 ?auto_6820 ) ) ( not ( = ?auto_6799 ?auto_6805 ) ) ( not ( = ?auto_6799 ?auto_6807 ) ) ( not ( = ?auto_6800 ?auto_6805 ) ) ( not ( = ?auto_6800 ?auto_6807 ) ) ( not ( = ?auto_6801 ?auto_6805 ) ) ( not ( = ?auto_6801 ?auto_6807 ) ) ( not ( = ?auto_6802 ?auto_6805 ) ) ( not ( = ?auto_6802 ?auto_6807 ) ) ( not ( = ?auto_6803 ?auto_6805 ) ) ( not ( = ?auto_6803 ?auto_6807 ) ) ( not ( = ?auto_6805 ?auto_6821 ) ) ( not ( = ?auto_6805 ?auto_6819 ) ) ( not ( = ?auto_6805 ?auto_6822 ) ) ( not ( = ?auto_6805 ?auto_6818 ) ) ( not ( = ?auto_6805 ?auto_6820 ) ) ( not ( = ?auto_6810 ?auto_6814 ) ) ( not ( = ?auto_6810 ?auto_6815 ) ) ( not ( = ?auto_6810 ?auto_6817 ) ) ( not ( = ?auto_6808 ?auto_6813 ) ) ( not ( = ?auto_6808 ?auto_6816 ) ) ( not ( = ?auto_6808 ?auto_6812 ) ) ( not ( = ?auto_6807 ?auto_6821 ) ) ( not ( = ?auto_6807 ?auto_6819 ) ) ( not ( = ?auto_6807 ?auto_6822 ) ) ( not ( = ?auto_6807 ?auto_6818 ) ) ( not ( = ?auto_6807 ?auto_6820 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_6799 ?auto_6800 ?auto_6801 ?auto_6802 ?auto_6803 ?auto_6804 )
      ( MAKE-1CRATE ?auto_6804 ?auto_6805 )
      ( MAKE-6CRATE-VERIFY ?auto_6799 ?auto_6800 ?auto_6801 ?auto_6802 ?auto_6803 ?auto_6804 ?auto_6805 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_6841 - SURFACE
      ?auto_6842 - SURFACE
      ?auto_6843 - SURFACE
      ?auto_6844 - SURFACE
      ?auto_6845 - SURFACE
      ?auto_6846 - SURFACE
      ?auto_6847 - SURFACE
      ?auto_6848 - SURFACE
    )
    :vars
    (
      ?auto_6854 - HOIST
      ?auto_6853 - PLACE
      ?auto_6850 - PLACE
      ?auto_6851 - HOIST
      ?auto_6852 - SURFACE
      ?auto_6865 - PLACE
      ?auto_6857 - HOIST
      ?auto_6858 - SURFACE
      ?auto_6855 - PLACE
      ?auto_6860 - HOIST
      ?auto_6861 - SURFACE
      ?auto_6868 - PLACE
      ?auto_6866 - HOIST
      ?auto_6859 - SURFACE
      ?auto_6863 - SURFACE
      ?auto_6867 - PLACE
      ?auto_6864 - HOIST
      ?auto_6856 - SURFACE
      ?auto_6862 - SURFACE
      ?auto_6849 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6854 ?auto_6853 ) ( IS-CRATE ?auto_6848 ) ( not ( = ?auto_6850 ?auto_6853 ) ) ( HOIST-AT ?auto_6851 ?auto_6850 ) ( AVAILABLE ?auto_6851 ) ( SURFACE-AT ?auto_6848 ?auto_6850 ) ( ON ?auto_6848 ?auto_6852 ) ( CLEAR ?auto_6848 ) ( not ( = ?auto_6847 ?auto_6848 ) ) ( not ( = ?auto_6847 ?auto_6852 ) ) ( not ( = ?auto_6848 ?auto_6852 ) ) ( not ( = ?auto_6854 ?auto_6851 ) ) ( IS-CRATE ?auto_6847 ) ( not ( = ?auto_6865 ?auto_6853 ) ) ( HOIST-AT ?auto_6857 ?auto_6865 ) ( AVAILABLE ?auto_6857 ) ( SURFACE-AT ?auto_6847 ?auto_6865 ) ( ON ?auto_6847 ?auto_6858 ) ( CLEAR ?auto_6847 ) ( not ( = ?auto_6846 ?auto_6847 ) ) ( not ( = ?auto_6846 ?auto_6858 ) ) ( not ( = ?auto_6847 ?auto_6858 ) ) ( not ( = ?auto_6854 ?auto_6857 ) ) ( IS-CRATE ?auto_6846 ) ( not ( = ?auto_6855 ?auto_6853 ) ) ( HOIST-AT ?auto_6860 ?auto_6855 ) ( SURFACE-AT ?auto_6846 ?auto_6855 ) ( ON ?auto_6846 ?auto_6861 ) ( CLEAR ?auto_6846 ) ( not ( = ?auto_6845 ?auto_6846 ) ) ( not ( = ?auto_6845 ?auto_6861 ) ) ( not ( = ?auto_6846 ?auto_6861 ) ) ( not ( = ?auto_6854 ?auto_6860 ) ) ( IS-CRATE ?auto_6845 ) ( not ( = ?auto_6868 ?auto_6853 ) ) ( HOIST-AT ?auto_6866 ?auto_6868 ) ( SURFACE-AT ?auto_6845 ?auto_6868 ) ( ON ?auto_6845 ?auto_6859 ) ( CLEAR ?auto_6845 ) ( not ( = ?auto_6844 ?auto_6845 ) ) ( not ( = ?auto_6844 ?auto_6859 ) ) ( not ( = ?auto_6845 ?auto_6859 ) ) ( not ( = ?auto_6854 ?auto_6866 ) ) ( IS-CRATE ?auto_6844 ) ( AVAILABLE ?auto_6866 ) ( SURFACE-AT ?auto_6844 ?auto_6868 ) ( ON ?auto_6844 ?auto_6863 ) ( CLEAR ?auto_6844 ) ( not ( = ?auto_6843 ?auto_6844 ) ) ( not ( = ?auto_6843 ?auto_6863 ) ) ( not ( = ?auto_6844 ?auto_6863 ) ) ( IS-CRATE ?auto_6843 ) ( not ( = ?auto_6867 ?auto_6853 ) ) ( HOIST-AT ?auto_6864 ?auto_6867 ) ( AVAILABLE ?auto_6864 ) ( SURFACE-AT ?auto_6843 ?auto_6867 ) ( ON ?auto_6843 ?auto_6856 ) ( CLEAR ?auto_6843 ) ( not ( = ?auto_6842 ?auto_6843 ) ) ( not ( = ?auto_6842 ?auto_6856 ) ) ( not ( = ?auto_6843 ?auto_6856 ) ) ( not ( = ?auto_6854 ?auto_6864 ) ) ( SURFACE-AT ?auto_6841 ?auto_6853 ) ( CLEAR ?auto_6841 ) ( IS-CRATE ?auto_6842 ) ( AVAILABLE ?auto_6854 ) ( AVAILABLE ?auto_6860 ) ( SURFACE-AT ?auto_6842 ?auto_6855 ) ( ON ?auto_6842 ?auto_6862 ) ( CLEAR ?auto_6842 ) ( TRUCK-AT ?auto_6849 ?auto_6853 ) ( not ( = ?auto_6841 ?auto_6842 ) ) ( not ( = ?auto_6841 ?auto_6862 ) ) ( not ( = ?auto_6842 ?auto_6862 ) ) ( not ( = ?auto_6841 ?auto_6843 ) ) ( not ( = ?auto_6841 ?auto_6856 ) ) ( not ( = ?auto_6843 ?auto_6862 ) ) ( not ( = ?auto_6867 ?auto_6855 ) ) ( not ( = ?auto_6864 ?auto_6860 ) ) ( not ( = ?auto_6856 ?auto_6862 ) ) ( not ( = ?auto_6841 ?auto_6844 ) ) ( not ( = ?auto_6841 ?auto_6863 ) ) ( not ( = ?auto_6842 ?auto_6844 ) ) ( not ( = ?auto_6842 ?auto_6863 ) ) ( not ( = ?auto_6844 ?auto_6856 ) ) ( not ( = ?auto_6844 ?auto_6862 ) ) ( not ( = ?auto_6868 ?auto_6867 ) ) ( not ( = ?auto_6868 ?auto_6855 ) ) ( not ( = ?auto_6866 ?auto_6864 ) ) ( not ( = ?auto_6866 ?auto_6860 ) ) ( not ( = ?auto_6863 ?auto_6856 ) ) ( not ( = ?auto_6863 ?auto_6862 ) ) ( not ( = ?auto_6841 ?auto_6845 ) ) ( not ( = ?auto_6841 ?auto_6859 ) ) ( not ( = ?auto_6842 ?auto_6845 ) ) ( not ( = ?auto_6842 ?auto_6859 ) ) ( not ( = ?auto_6843 ?auto_6845 ) ) ( not ( = ?auto_6843 ?auto_6859 ) ) ( not ( = ?auto_6845 ?auto_6863 ) ) ( not ( = ?auto_6845 ?auto_6856 ) ) ( not ( = ?auto_6845 ?auto_6862 ) ) ( not ( = ?auto_6859 ?auto_6863 ) ) ( not ( = ?auto_6859 ?auto_6856 ) ) ( not ( = ?auto_6859 ?auto_6862 ) ) ( not ( = ?auto_6841 ?auto_6846 ) ) ( not ( = ?auto_6841 ?auto_6861 ) ) ( not ( = ?auto_6842 ?auto_6846 ) ) ( not ( = ?auto_6842 ?auto_6861 ) ) ( not ( = ?auto_6843 ?auto_6846 ) ) ( not ( = ?auto_6843 ?auto_6861 ) ) ( not ( = ?auto_6844 ?auto_6846 ) ) ( not ( = ?auto_6844 ?auto_6861 ) ) ( not ( = ?auto_6846 ?auto_6859 ) ) ( not ( = ?auto_6846 ?auto_6863 ) ) ( not ( = ?auto_6846 ?auto_6856 ) ) ( not ( = ?auto_6846 ?auto_6862 ) ) ( not ( = ?auto_6861 ?auto_6859 ) ) ( not ( = ?auto_6861 ?auto_6863 ) ) ( not ( = ?auto_6861 ?auto_6856 ) ) ( not ( = ?auto_6861 ?auto_6862 ) ) ( not ( = ?auto_6841 ?auto_6847 ) ) ( not ( = ?auto_6841 ?auto_6858 ) ) ( not ( = ?auto_6842 ?auto_6847 ) ) ( not ( = ?auto_6842 ?auto_6858 ) ) ( not ( = ?auto_6843 ?auto_6847 ) ) ( not ( = ?auto_6843 ?auto_6858 ) ) ( not ( = ?auto_6844 ?auto_6847 ) ) ( not ( = ?auto_6844 ?auto_6858 ) ) ( not ( = ?auto_6845 ?auto_6847 ) ) ( not ( = ?auto_6845 ?auto_6858 ) ) ( not ( = ?auto_6847 ?auto_6861 ) ) ( not ( = ?auto_6847 ?auto_6859 ) ) ( not ( = ?auto_6847 ?auto_6863 ) ) ( not ( = ?auto_6847 ?auto_6856 ) ) ( not ( = ?auto_6847 ?auto_6862 ) ) ( not ( = ?auto_6865 ?auto_6855 ) ) ( not ( = ?auto_6865 ?auto_6868 ) ) ( not ( = ?auto_6865 ?auto_6867 ) ) ( not ( = ?auto_6857 ?auto_6860 ) ) ( not ( = ?auto_6857 ?auto_6866 ) ) ( not ( = ?auto_6857 ?auto_6864 ) ) ( not ( = ?auto_6858 ?auto_6861 ) ) ( not ( = ?auto_6858 ?auto_6859 ) ) ( not ( = ?auto_6858 ?auto_6863 ) ) ( not ( = ?auto_6858 ?auto_6856 ) ) ( not ( = ?auto_6858 ?auto_6862 ) ) ( not ( = ?auto_6841 ?auto_6848 ) ) ( not ( = ?auto_6841 ?auto_6852 ) ) ( not ( = ?auto_6842 ?auto_6848 ) ) ( not ( = ?auto_6842 ?auto_6852 ) ) ( not ( = ?auto_6843 ?auto_6848 ) ) ( not ( = ?auto_6843 ?auto_6852 ) ) ( not ( = ?auto_6844 ?auto_6848 ) ) ( not ( = ?auto_6844 ?auto_6852 ) ) ( not ( = ?auto_6845 ?auto_6848 ) ) ( not ( = ?auto_6845 ?auto_6852 ) ) ( not ( = ?auto_6846 ?auto_6848 ) ) ( not ( = ?auto_6846 ?auto_6852 ) ) ( not ( = ?auto_6848 ?auto_6858 ) ) ( not ( = ?auto_6848 ?auto_6861 ) ) ( not ( = ?auto_6848 ?auto_6859 ) ) ( not ( = ?auto_6848 ?auto_6863 ) ) ( not ( = ?auto_6848 ?auto_6856 ) ) ( not ( = ?auto_6848 ?auto_6862 ) ) ( not ( = ?auto_6850 ?auto_6865 ) ) ( not ( = ?auto_6850 ?auto_6855 ) ) ( not ( = ?auto_6850 ?auto_6868 ) ) ( not ( = ?auto_6850 ?auto_6867 ) ) ( not ( = ?auto_6851 ?auto_6857 ) ) ( not ( = ?auto_6851 ?auto_6860 ) ) ( not ( = ?auto_6851 ?auto_6866 ) ) ( not ( = ?auto_6851 ?auto_6864 ) ) ( not ( = ?auto_6852 ?auto_6858 ) ) ( not ( = ?auto_6852 ?auto_6861 ) ) ( not ( = ?auto_6852 ?auto_6859 ) ) ( not ( = ?auto_6852 ?auto_6863 ) ) ( not ( = ?auto_6852 ?auto_6856 ) ) ( not ( = ?auto_6852 ?auto_6862 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_6841 ?auto_6842 ?auto_6843 ?auto_6844 ?auto_6845 ?auto_6846 ?auto_6847 )
      ( MAKE-1CRATE ?auto_6847 ?auto_6848 )
      ( MAKE-7CRATE-VERIFY ?auto_6841 ?auto_6842 ?auto_6843 ?auto_6844 ?auto_6845 ?auto_6846 ?auto_6847 ?auto_6848 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_6888 - SURFACE
      ?auto_6889 - SURFACE
      ?auto_6890 - SURFACE
      ?auto_6891 - SURFACE
      ?auto_6892 - SURFACE
      ?auto_6893 - SURFACE
      ?auto_6894 - SURFACE
      ?auto_6895 - SURFACE
      ?auto_6896 - SURFACE
    )
    :vars
    (
      ?auto_6898 - HOIST
      ?auto_6901 - PLACE
      ?auto_6902 - PLACE
      ?auto_6900 - HOIST
      ?auto_6899 - SURFACE
      ?auto_6913 - PLACE
      ?auto_6916 - HOIST
      ?auto_6912 - SURFACE
      ?auto_6915 - PLACE
      ?auto_6919 - HOIST
      ?auto_6911 - SURFACE
      ?auto_6907 - PLACE
      ?auto_6905 - HOIST
      ?auto_6906 - SURFACE
      ?auto_6910 - PLACE
      ?auto_6917 - HOIST
      ?auto_6918 - SURFACE
      ?auto_6904 - SURFACE
      ?auto_6908 - PLACE
      ?auto_6909 - HOIST
      ?auto_6914 - SURFACE
      ?auto_6903 - SURFACE
      ?auto_6897 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6898 ?auto_6901 ) ( IS-CRATE ?auto_6896 ) ( not ( = ?auto_6902 ?auto_6901 ) ) ( HOIST-AT ?auto_6900 ?auto_6902 ) ( AVAILABLE ?auto_6900 ) ( SURFACE-AT ?auto_6896 ?auto_6902 ) ( ON ?auto_6896 ?auto_6899 ) ( CLEAR ?auto_6896 ) ( not ( = ?auto_6895 ?auto_6896 ) ) ( not ( = ?auto_6895 ?auto_6899 ) ) ( not ( = ?auto_6896 ?auto_6899 ) ) ( not ( = ?auto_6898 ?auto_6900 ) ) ( IS-CRATE ?auto_6895 ) ( not ( = ?auto_6913 ?auto_6901 ) ) ( HOIST-AT ?auto_6916 ?auto_6913 ) ( AVAILABLE ?auto_6916 ) ( SURFACE-AT ?auto_6895 ?auto_6913 ) ( ON ?auto_6895 ?auto_6912 ) ( CLEAR ?auto_6895 ) ( not ( = ?auto_6894 ?auto_6895 ) ) ( not ( = ?auto_6894 ?auto_6912 ) ) ( not ( = ?auto_6895 ?auto_6912 ) ) ( not ( = ?auto_6898 ?auto_6916 ) ) ( IS-CRATE ?auto_6894 ) ( not ( = ?auto_6915 ?auto_6901 ) ) ( HOIST-AT ?auto_6919 ?auto_6915 ) ( AVAILABLE ?auto_6919 ) ( SURFACE-AT ?auto_6894 ?auto_6915 ) ( ON ?auto_6894 ?auto_6911 ) ( CLEAR ?auto_6894 ) ( not ( = ?auto_6893 ?auto_6894 ) ) ( not ( = ?auto_6893 ?auto_6911 ) ) ( not ( = ?auto_6894 ?auto_6911 ) ) ( not ( = ?auto_6898 ?auto_6919 ) ) ( IS-CRATE ?auto_6893 ) ( not ( = ?auto_6907 ?auto_6901 ) ) ( HOIST-AT ?auto_6905 ?auto_6907 ) ( SURFACE-AT ?auto_6893 ?auto_6907 ) ( ON ?auto_6893 ?auto_6906 ) ( CLEAR ?auto_6893 ) ( not ( = ?auto_6892 ?auto_6893 ) ) ( not ( = ?auto_6892 ?auto_6906 ) ) ( not ( = ?auto_6893 ?auto_6906 ) ) ( not ( = ?auto_6898 ?auto_6905 ) ) ( IS-CRATE ?auto_6892 ) ( not ( = ?auto_6910 ?auto_6901 ) ) ( HOIST-AT ?auto_6917 ?auto_6910 ) ( SURFACE-AT ?auto_6892 ?auto_6910 ) ( ON ?auto_6892 ?auto_6918 ) ( CLEAR ?auto_6892 ) ( not ( = ?auto_6891 ?auto_6892 ) ) ( not ( = ?auto_6891 ?auto_6918 ) ) ( not ( = ?auto_6892 ?auto_6918 ) ) ( not ( = ?auto_6898 ?auto_6917 ) ) ( IS-CRATE ?auto_6891 ) ( AVAILABLE ?auto_6917 ) ( SURFACE-AT ?auto_6891 ?auto_6910 ) ( ON ?auto_6891 ?auto_6904 ) ( CLEAR ?auto_6891 ) ( not ( = ?auto_6890 ?auto_6891 ) ) ( not ( = ?auto_6890 ?auto_6904 ) ) ( not ( = ?auto_6891 ?auto_6904 ) ) ( IS-CRATE ?auto_6890 ) ( not ( = ?auto_6908 ?auto_6901 ) ) ( HOIST-AT ?auto_6909 ?auto_6908 ) ( AVAILABLE ?auto_6909 ) ( SURFACE-AT ?auto_6890 ?auto_6908 ) ( ON ?auto_6890 ?auto_6914 ) ( CLEAR ?auto_6890 ) ( not ( = ?auto_6889 ?auto_6890 ) ) ( not ( = ?auto_6889 ?auto_6914 ) ) ( not ( = ?auto_6890 ?auto_6914 ) ) ( not ( = ?auto_6898 ?auto_6909 ) ) ( SURFACE-AT ?auto_6888 ?auto_6901 ) ( CLEAR ?auto_6888 ) ( IS-CRATE ?auto_6889 ) ( AVAILABLE ?auto_6898 ) ( AVAILABLE ?auto_6905 ) ( SURFACE-AT ?auto_6889 ?auto_6907 ) ( ON ?auto_6889 ?auto_6903 ) ( CLEAR ?auto_6889 ) ( TRUCK-AT ?auto_6897 ?auto_6901 ) ( not ( = ?auto_6888 ?auto_6889 ) ) ( not ( = ?auto_6888 ?auto_6903 ) ) ( not ( = ?auto_6889 ?auto_6903 ) ) ( not ( = ?auto_6888 ?auto_6890 ) ) ( not ( = ?auto_6888 ?auto_6914 ) ) ( not ( = ?auto_6890 ?auto_6903 ) ) ( not ( = ?auto_6908 ?auto_6907 ) ) ( not ( = ?auto_6909 ?auto_6905 ) ) ( not ( = ?auto_6914 ?auto_6903 ) ) ( not ( = ?auto_6888 ?auto_6891 ) ) ( not ( = ?auto_6888 ?auto_6904 ) ) ( not ( = ?auto_6889 ?auto_6891 ) ) ( not ( = ?auto_6889 ?auto_6904 ) ) ( not ( = ?auto_6891 ?auto_6914 ) ) ( not ( = ?auto_6891 ?auto_6903 ) ) ( not ( = ?auto_6910 ?auto_6908 ) ) ( not ( = ?auto_6910 ?auto_6907 ) ) ( not ( = ?auto_6917 ?auto_6909 ) ) ( not ( = ?auto_6917 ?auto_6905 ) ) ( not ( = ?auto_6904 ?auto_6914 ) ) ( not ( = ?auto_6904 ?auto_6903 ) ) ( not ( = ?auto_6888 ?auto_6892 ) ) ( not ( = ?auto_6888 ?auto_6918 ) ) ( not ( = ?auto_6889 ?auto_6892 ) ) ( not ( = ?auto_6889 ?auto_6918 ) ) ( not ( = ?auto_6890 ?auto_6892 ) ) ( not ( = ?auto_6890 ?auto_6918 ) ) ( not ( = ?auto_6892 ?auto_6904 ) ) ( not ( = ?auto_6892 ?auto_6914 ) ) ( not ( = ?auto_6892 ?auto_6903 ) ) ( not ( = ?auto_6918 ?auto_6904 ) ) ( not ( = ?auto_6918 ?auto_6914 ) ) ( not ( = ?auto_6918 ?auto_6903 ) ) ( not ( = ?auto_6888 ?auto_6893 ) ) ( not ( = ?auto_6888 ?auto_6906 ) ) ( not ( = ?auto_6889 ?auto_6893 ) ) ( not ( = ?auto_6889 ?auto_6906 ) ) ( not ( = ?auto_6890 ?auto_6893 ) ) ( not ( = ?auto_6890 ?auto_6906 ) ) ( not ( = ?auto_6891 ?auto_6893 ) ) ( not ( = ?auto_6891 ?auto_6906 ) ) ( not ( = ?auto_6893 ?auto_6918 ) ) ( not ( = ?auto_6893 ?auto_6904 ) ) ( not ( = ?auto_6893 ?auto_6914 ) ) ( not ( = ?auto_6893 ?auto_6903 ) ) ( not ( = ?auto_6906 ?auto_6918 ) ) ( not ( = ?auto_6906 ?auto_6904 ) ) ( not ( = ?auto_6906 ?auto_6914 ) ) ( not ( = ?auto_6906 ?auto_6903 ) ) ( not ( = ?auto_6888 ?auto_6894 ) ) ( not ( = ?auto_6888 ?auto_6911 ) ) ( not ( = ?auto_6889 ?auto_6894 ) ) ( not ( = ?auto_6889 ?auto_6911 ) ) ( not ( = ?auto_6890 ?auto_6894 ) ) ( not ( = ?auto_6890 ?auto_6911 ) ) ( not ( = ?auto_6891 ?auto_6894 ) ) ( not ( = ?auto_6891 ?auto_6911 ) ) ( not ( = ?auto_6892 ?auto_6894 ) ) ( not ( = ?auto_6892 ?auto_6911 ) ) ( not ( = ?auto_6894 ?auto_6906 ) ) ( not ( = ?auto_6894 ?auto_6918 ) ) ( not ( = ?auto_6894 ?auto_6904 ) ) ( not ( = ?auto_6894 ?auto_6914 ) ) ( not ( = ?auto_6894 ?auto_6903 ) ) ( not ( = ?auto_6915 ?auto_6907 ) ) ( not ( = ?auto_6915 ?auto_6910 ) ) ( not ( = ?auto_6915 ?auto_6908 ) ) ( not ( = ?auto_6919 ?auto_6905 ) ) ( not ( = ?auto_6919 ?auto_6917 ) ) ( not ( = ?auto_6919 ?auto_6909 ) ) ( not ( = ?auto_6911 ?auto_6906 ) ) ( not ( = ?auto_6911 ?auto_6918 ) ) ( not ( = ?auto_6911 ?auto_6904 ) ) ( not ( = ?auto_6911 ?auto_6914 ) ) ( not ( = ?auto_6911 ?auto_6903 ) ) ( not ( = ?auto_6888 ?auto_6895 ) ) ( not ( = ?auto_6888 ?auto_6912 ) ) ( not ( = ?auto_6889 ?auto_6895 ) ) ( not ( = ?auto_6889 ?auto_6912 ) ) ( not ( = ?auto_6890 ?auto_6895 ) ) ( not ( = ?auto_6890 ?auto_6912 ) ) ( not ( = ?auto_6891 ?auto_6895 ) ) ( not ( = ?auto_6891 ?auto_6912 ) ) ( not ( = ?auto_6892 ?auto_6895 ) ) ( not ( = ?auto_6892 ?auto_6912 ) ) ( not ( = ?auto_6893 ?auto_6895 ) ) ( not ( = ?auto_6893 ?auto_6912 ) ) ( not ( = ?auto_6895 ?auto_6911 ) ) ( not ( = ?auto_6895 ?auto_6906 ) ) ( not ( = ?auto_6895 ?auto_6918 ) ) ( not ( = ?auto_6895 ?auto_6904 ) ) ( not ( = ?auto_6895 ?auto_6914 ) ) ( not ( = ?auto_6895 ?auto_6903 ) ) ( not ( = ?auto_6913 ?auto_6915 ) ) ( not ( = ?auto_6913 ?auto_6907 ) ) ( not ( = ?auto_6913 ?auto_6910 ) ) ( not ( = ?auto_6913 ?auto_6908 ) ) ( not ( = ?auto_6916 ?auto_6919 ) ) ( not ( = ?auto_6916 ?auto_6905 ) ) ( not ( = ?auto_6916 ?auto_6917 ) ) ( not ( = ?auto_6916 ?auto_6909 ) ) ( not ( = ?auto_6912 ?auto_6911 ) ) ( not ( = ?auto_6912 ?auto_6906 ) ) ( not ( = ?auto_6912 ?auto_6918 ) ) ( not ( = ?auto_6912 ?auto_6904 ) ) ( not ( = ?auto_6912 ?auto_6914 ) ) ( not ( = ?auto_6912 ?auto_6903 ) ) ( not ( = ?auto_6888 ?auto_6896 ) ) ( not ( = ?auto_6888 ?auto_6899 ) ) ( not ( = ?auto_6889 ?auto_6896 ) ) ( not ( = ?auto_6889 ?auto_6899 ) ) ( not ( = ?auto_6890 ?auto_6896 ) ) ( not ( = ?auto_6890 ?auto_6899 ) ) ( not ( = ?auto_6891 ?auto_6896 ) ) ( not ( = ?auto_6891 ?auto_6899 ) ) ( not ( = ?auto_6892 ?auto_6896 ) ) ( not ( = ?auto_6892 ?auto_6899 ) ) ( not ( = ?auto_6893 ?auto_6896 ) ) ( not ( = ?auto_6893 ?auto_6899 ) ) ( not ( = ?auto_6894 ?auto_6896 ) ) ( not ( = ?auto_6894 ?auto_6899 ) ) ( not ( = ?auto_6896 ?auto_6912 ) ) ( not ( = ?auto_6896 ?auto_6911 ) ) ( not ( = ?auto_6896 ?auto_6906 ) ) ( not ( = ?auto_6896 ?auto_6918 ) ) ( not ( = ?auto_6896 ?auto_6904 ) ) ( not ( = ?auto_6896 ?auto_6914 ) ) ( not ( = ?auto_6896 ?auto_6903 ) ) ( not ( = ?auto_6902 ?auto_6913 ) ) ( not ( = ?auto_6902 ?auto_6915 ) ) ( not ( = ?auto_6902 ?auto_6907 ) ) ( not ( = ?auto_6902 ?auto_6910 ) ) ( not ( = ?auto_6902 ?auto_6908 ) ) ( not ( = ?auto_6900 ?auto_6916 ) ) ( not ( = ?auto_6900 ?auto_6919 ) ) ( not ( = ?auto_6900 ?auto_6905 ) ) ( not ( = ?auto_6900 ?auto_6917 ) ) ( not ( = ?auto_6900 ?auto_6909 ) ) ( not ( = ?auto_6899 ?auto_6912 ) ) ( not ( = ?auto_6899 ?auto_6911 ) ) ( not ( = ?auto_6899 ?auto_6906 ) ) ( not ( = ?auto_6899 ?auto_6918 ) ) ( not ( = ?auto_6899 ?auto_6904 ) ) ( not ( = ?auto_6899 ?auto_6914 ) ) ( not ( = ?auto_6899 ?auto_6903 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_6888 ?auto_6889 ?auto_6890 ?auto_6891 ?auto_6892 ?auto_6893 ?auto_6894 ?auto_6895 )
      ( MAKE-1CRATE ?auto_6895 ?auto_6896 )
      ( MAKE-8CRATE-VERIFY ?auto_6888 ?auto_6889 ?auto_6890 ?auto_6891 ?auto_6892 ?auto_6893 ?auto_6894 ?auto_6895 ?auto_6896 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_6940 - SURFACE
      ?auto_6941 - SURFACE
      ?auto_6942 - SURFACE
      ?auto_6943 - SURFACE
      ?auto_6944 - SURFACE
      ?auto_6945 - SURFACE
      ?auto_6946 - SURFACE
      ?auto_6947 - SURFACE
      ?auto_6948 - SURFACE
      ?auto_6949 - SURFACE
    )
    :vars
    (
      ?auto_6950 - HOIST
      ?auto_6953 - PLACE
      ?auto_6954 - PLACE
      ?auto_6952 - HOIST
      ?auto_6951 - SURFACE
      ?auto_6959 - PLACE
      ?auto_6960 - HOIST
      ?auto_6963 - SURFACE
      ?auto_6967 - SURFACE
      ?auto_6968 - PLACE
      ?auto_6957 - HOIST
      ?auto_6966 - SURFACE
      ?auto_6970 - PLACE
      ?auto_6961 - HOIST
      ?auto_6962 - SURFACE
      ?auto_6971 - PLACE
      ?auto_6973 - HOIST
      ?auto_6964 - SURFACE
      ?auto_6958 - SURFACE
      ?auto_6965 - PLACE
      ?auto_6969 - HOIST
      ?auto_6956 - SURFACE
      ?auto_6972 - SURFACE
      ?auto_6955 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6950 ?auto_6953 ) ( IS-CRATE ?auto_6949 ) ( not ( = ?auto_6954 ?auto_6953 ) ) ( HOIST-AT ?auto_6952 ?auto_6954 ) ( SURFACE-AT ?auto_6949 ?auto_6954 ) ( ON ?auto_6949 ?auto_6951 ) ( CLEAR ?auto_6949 ) ( not ( = ?auto_6948 ?auto_6949 ) ) ( not ( = ?auto_6948 ?auto_6951 ) ) ( not ( = ?auto_6949 ?auto_6951 ) ) ( not ( = ?auto_6950 ?auto_6952 ) ) ( IS-CRATE ?auto_6948 ) ( not ( = ?auto_6959 ?auto_6953 ) ) ( HOIST-AT ?auto_6960 ?auto_6959 ) ( AVAILABLE ?auto_6960 ) ( SURFACE-AT ?auto_6948 ?auto_6959 ) ( ON ?auto_6948 ?auto_6963 ) ( CLEAR ?auto_6948 ) ( not ( = ?auto_6947 ?auto_6948 ) ) ( not ( = ?auto_6947 ?auto_6963 ) ) ( not ( = ?auto_6948 ?auto_6963 ) ) ( not ( = ?auto_6950 ?auto_6960 ) ) ( IS-CRATE ?auto_6947 ) ( AVAILABLE ?auto_6952 ) ( SURFACE-AT ?auto_6947 ?auto_6954 ) ( ON ?auto_6947 ?auto_6967 ) ( CLEAR ?auto_6947 ) ( not ( = ?auto_6946 ?auto_6947 ) ) ( not ( = ?auto_6946 ?auto_6967 ) ) ( not ( = ?auto_6947 ?auto_6967 ) ) ( IS-CRATE ?auto_6946 ) ( not ( = ?auto_6968 ?auto_6953 ) ) ( HOIST-AT ?auto_6957 ?auto_6968 ) ( AVAILABLE ?auto_6957 ) ( SURFACE-AT ?auto_6946 ?auto_6968 ) ( ON ?auto_6946 ?auto_6966 ) ( CLEAR ?auto_6946 ) ( not ( = ?auto_6945 ?auto_6946 ) ) ( not ( = ?auto_6945 ?auto_6966 ) ) ( not ( = ?auto_6946 ?auto_6966 ) ) ( not ( = ?auto_6950 ?auto_6957 ) ) ( IS-CRATE ?auto_6945 ) ( not ( = ?auto_6970 ?auto_6953 ) ) ( HOIST-AT ?auto_6961 ?auto_6970 ) ( SURFACE-AT ?auto_6945 ?auto_6970 ) ( ON ?auto_6945 ?auto_6962 ) ( CLEAR ?auto_6945 ) ( not ( = ?auto_6944 ?auto_6945 ) ) ( not ( = ?auto_6944 ?auto_6962 ) ) ( not ( = ?auto_6945 ?auto_6962 ) ) ( not ( = ?auto_6950 ?auto_6961 ) ) ( IS-CRATE ?auto_6944 ) ( not ( = ?auto_6971 ?auto_6953 ) ) ( HOIST-AT ?auto_6973 ?auto_6971 ) ( SURFACE-AT ?auto_6944 ?auto_6971 ) ( ON ?auto_6944 ?auto_6964 ) ( CLEAR ?auto_6944 ) ( not ( = ?auto_6943 ?auto_6944 ) ) ( not ( = ?auto_6943 ?auto_6964 ) ) ( not ( = ?auto_6944 ?auto_6964 ) ) ( not ( = ?auto_6950 ?auto_6973 ) ) ( IS-CRATE ?auto_6943 ) ( AVAILABLE ?auto_6973 ) ( SURFACE-AT ?auto_6943 ?auto_6971 ) ( ON ?auto_6943 ?auto_6958 ) ( CLEAR ?auto_6943 ) ( not ( = ?auto_6942 ?auto_6943 ) ) ( not ( = ?auto_6942 ?auto_6958 ) ) ( not ( = ?auto_6943 ?auto_6958 ) ) ( IS-CRATE ?auto_6942 ) ( not ( = ?auto_6965 ?auto_6953 ) ) ( HOIST-AT ?auto_6969 ?auto_6965 ) ( AVAILABLE ?auto_6969 ) ( SURFACE-AT ?auto_6942 ?auto_6965 ) ( ON ?auto_6942 ?auto_6956 ) ( CLEAR ?auto_6942 ) ( not ( = ?auto_6941 ?auto_6942 ) ) ( not ( = ?auto_6941 ?auto_6956 ) ) ( not ( = ?auto_6942 ?auto_6956 ) ) ( not ( = ?auto_6950 ?auto_6969 ) ) ( SURFACE-AT ?auto_6940 ?auto_6953 ) ( CLEAR ?auto_6940 ) ( IS-CRATE ?auto_6941 ) ( AVAILABLE ?auto_6950 ) ( AVAILABLE ?auto_6961 ) ( SURFACE-AT ?auto_6941 ?auto_6970 ) ( ON ?auto_6941 ?auto_6972 ) ( CLEAR ?auto_6941 ) ( TRUCK-AT ?auto_6955 ?auto_6953 ) ( not ( = ?auto_6940 ?auto_6941 ) ) ( not ( = ?auto_6940 ?auto_6972 ) ) ( not ( = ?auto_6941 ?auto_6972 ) ) ( not ( = ?auto_6940 ?auto_6942 ) ) ( not ( = ?auto_6940 ?auto_6956 ) ) ( not ( = ?auto_6942 ?auto_6972 ) ) ( not ( = ?auto_6965 ?auto_6970 ) ) ( not ( = ?auto_6969 ?auto_6961 ) ) ( not ( = ?auto_6956 ?auto_6972 ) ) ( not ( = ?auto_6940 ?auto_6943 ) ) ( not ( = ?auto_6940 ?auto_6958 ) ) ( not ( = ?auto_6941 ?auto_6943 ) ) ( not ( = ?auto_6941 ?auto_6958 ) ) ( not ( = ?auto_6943 ?auto_6956 ) ) ( not ( = ?auto_6943 ?auto_6972 ) ) ( not ( = ?auto_6971 ?auto_6965 ) ) ( not ( = ?auto_6971 ?auto_6970 ) ) ( not ( = ?auto_6973 ?auto_6969 ) ) ( not ( = ?auto_6973 ?auto_6961 ) ) ( not ( = ?auto_6958 ?auto_6956 ) ) ( not ( = ?auto_6958 ?auto_6972 ) ) ( not ( = ?auto_6940 ?auto_6944 ) ) ( not ( = ?auto_6940 ?auto_6964 ) ) ( not ( = ?auto_6941 ?auto_6944 ) ) ( not ( = ?auto_6941 ?auto_6964 ) ) ( not ( = ?auto_6942 ?auto_6944 ) ) ( not ( = ?auto_6942 ?auto_6964 ) ) ( not ( = ?auto_6944 ?auto_6958 ) ) ( not ( = ?auto_6944 ?auto_6956 ) ) ( not ( = ?auto_6944 ?auto_6972 ) ) ( not ( = ?auto_6964 ?auto_6958 ) ) ( not ( = ?auto_6964 ?auto_6956 ) ) ( not ( = ?auto_6964 ?auto_6972 ) ) ( not ( = ?auto_6940 ?auto_6945 ) ) ( not ( = ?auto_6940 ?auto_6962 ) ) ( not ( = ?auto_6941 ?auto_6945 ) ) ( not ( = ?auto_6941 ?auto_6962 ) ) ( not ( = ?auto_6942 ?auto_6945 ) ) ( not ( = ?auto_6942 ?auto_6962 ) ) ( not ( = ?auto_6943 ?auto_6945 ) ) ( not ( = ?auto_6943 ?auto_6962 ) ) ( not ( = ?auto_6945 ?auto_6964 ) ) ( not ( = ?auto_6945 ?auto_6958 ) ) ( not ( = ?auto_6945 ?auto_6956 ) ) ( not ( = ?auto_6945 ?auto_6972 ) ) ( not ( = ?auto_6962 ?auto_6964 ) ) ( not ( = ?auto_6962 ?auto_6958 ) ) ( not ( = ?auto_6962 ?auto_6956 ) ) ( not ( = ?auto_6962 ?auto_6972 ) ) ( not ( = ?auto_6940 ?auto_6946 ) ) ( not ( = ?auto_6940 ?auto_6966 ) ) ( not ( = ?auto_6941 ?auto_6946 ) ) ( not ( = ?auto_6941 ?auto_6966 ) ) ( not ( = ?auto_6942 ?auto_6946 ) ) ( not ( = ?auto_6942 ?auto_6966 ) ) ( not ( = ?auto_6943 ?auto_6946 ) ) ( not ( = ?auto_6943 ?auto_6966 ) ) ( not ( = ?auto_6944 ?auto_6946 ) ) ( not ( = ?auto_6944 ?auto_6966 ) ) ( not ( = ?auto_6946 ?auto_6962 ) ) ( not ( = ?auto_6946 ?auto_6964 ) ) ( not ( = ?auto_6946 ?auto_6958 ) ) ( not ( = ?auto_6946 ?auto_6956 ) ) ( not ( = ?auto_6946 ?auto_6972 ) ) ( not ( = ?auto_6968 ?auto_6970 ) ) ( not ( = ?auto_6968 ?auto_6971 ) ) ( not ( = ?auto_6968 ?auto_6965 ) ) ( not ( = ?auto_6957 ?auto_6961 ) ) ( not ( = ?auto_6957 ?auto_6973 ) ) ( not ( = ?auto_6957 ?auto_6969 ) ) ( not ( = ?auto_6966 ?auto_6962 ) ) ( not ( = ?auto_6966 ?auto_6964 ) ) ( not ( = ?auto_6966 ?auto_6958 ) ) ( not ( = ?auto_6966 ?auto_6956 ) ) ( not ( = ?auto_6966 ?auto_6972 ) ) ( not ( = ?auto_6940 ?auto_6947 ) ) ( not ( = ?auto_6940 ?auto_6967 ) ) ( not ( = ?auto_6941 ?auto_6947 ) ) ( not ( = ?auto_6941 ?auto_6967 ) ) ( not ( = ?auto_6942 ?auto_6947 ) ) ( not ( = ?auto_6942 ?auto_6967 ) ) ( not ( = ?auto_6943 ?auto_6947 ) ) ( not ( = ?auto_6943 ?auto_6967 ) ) ( not ( = ?auto_6944 ?auto_6947 ) ) ( not ( = ?auto_6944 ?auto_6967 ) ) ( not ( = ?auto_6945 ?auto_6947 ) ) ( not ( = ?auto_6945 ?auto_6967 ) ) ( not ( = ?auto_6947 ?auto_6966 ) ) ( not ( = ?auto_6947 ?auto_6962 ) ) ( not ( = ?auto_6947 ?auto_6964 ) ) ( not ( = ?auto_6947 ?auto_6958 ) ) ( not ( = ?auto_6947 ?auto_6956 ) ) ( not ( = ?auto_6947 ?auto_6972 ) ) ( not ( = ?auto_6954 ?auto_6968 ) ) ( not ( = ?auto_6954 ?auto_6970 ) ) ( not ( = ?auto_6954 ?auto_6971 ) ) ( not ( = ?auto_6954 ?auto_6965 ) ) ( not ( = ?auto_6952 ?auto_6957 ) ) ( not ( = ?auto_6952 ?auto_6961 ) ) ( not ( = ?auto_6952 ?auto_6973 ) ) ( not ( = ?auto_6952 ?auto_6969 ) ) ( not ( = ?auto_6967 ?auto_6966 ) ) ( not ( = ?auto_6967 ?auto_6962 ) ) ( not ( = ?auto_6967 ?auto_6964 ) ) ( not ( = ?auto_6967 ?auto_6958 ) ) ( not ( = ?auto_6967 ?auto_6956 ) ) ( not ( = ?auto_6967 ?auto_6972 ) ) ( not ( = ?auto_6940 ?auto_6948 ) ) ( not ( = ?auto_6940 ?auto_6963 ) ) ( not ( = ?auto_6941 ?auto_6948 ) ) ( not ( = ?auto_6941 ?auto_6963 ) ) ( not ( = ?auto_6942 ?auto_6948 ) ) ( not ( = ?auto_6942 ?auto_6963 ) ) ( not ( = ?auto_6943 ?auto_6948 ) ) ( not ( = ?auto_6943 ?auto_6963 ) ) ( not ( = ?auto_6944 ?auto_6948 ) ) ( not ( = ?auto_6944 ?auto_6963 ) ) ( not ( = ?auto_6945 ?auto_6948 ) ) ( not ( = ?auto_6945 ?auto_6963 ) ) ( not ( = ?auto_6946 ?auto_6948 ) ) ( not ( = ?auto_6946 ?auto_6963 ) ) ( not ( = ?auto_6948 ?auto_6967 ) ) ( not ( = ?auto_6948 ?auto_6966 ) ) ( not ( = ?auto_6948 ?auto_6962 ) ) ( not ( = ?auto_6948 ?auto_6964 ) ) ( not ( = ?auto_6948 ?auto_6958 ) ) ( not ( = ?auto_6948 ?auto_6956 ) ) ( not ( = ?auto_6948 ?auto_6972 ) ) ( not ( = ?auto_6959 ?auto_6954 ) ) ( not ( = ?auto_6959 ?auto_6968 ) ) ( not ( = ?auto_6959 ?auto_6970 ) ) ( not ( = ?auto_6959 ?auto_6971 ) ) ( not ( = ?auto_6959 ?auto_6965 ) ) ( not ( = ?auto_6960 ?auto_6952 ) ) ( not ( = ?auto_6960 ?auto_6957 ) ) ( not ( = ?auto_6960 ?auto_6961 ) ) ( not ( = ?auto_6960 ?auto_6973 ) ) ( not ( = ?auto_6960 ?auto_6969 ) ) ( not ( = ?auto_6963 ?auto_6967 ) ) ( not ( = ?auto_6963 ?auto_6966 ) ) ( not ( = ?auto_6963 ?auto_6962 ) ) ( not ( = ?auto_6963 ?auto_6964 ) ) ( not ( = ?auto_6963 ?auto_6958 ) ) ( not ( = ?auto_6963 ?auto_6956 ) ) ( not ( = ?auto_6963 ?auto_6972 ) ) ( not ( = ?auto_6940 ?auto_6949 ) ) ( not ( = ?auto_6940 ?auto_6951 ) ) ( not ( = ?auto_6941 ?auto_6949 ) ) ( not ( = ?auto_6941 ?auto_6951 ) ) ( not ( = ?auto_6942 ?auto_6949 ) ) ( not ( = ?auto_6942 ?auto_6951 ) ) ( not ( = ?auto_6943 ?auto_6949 ) ) ( not ( = ?auto_6943 ?auto_6951 ) ) ( not ( = ?auto_6944 ?auto_6949 ) ) ( not ( = ?auto_6944 ?auto_6951 ) ) ( not ( = ?auto_6945 ?auto_6949 ) ) ( not ( = ?auto_6945 ?auto_6951 ) ) ( not ( = ?auto_6946 ?auto_6949 ) ) ( not ( = ?auto_6946 ?auto_6951 ) ) ( not ( = ?auto_6947 ?auto_6949 ) ) ( not ( = ?auto_6947 ?auto_6951 ) ) ( not ( = ?auto_6949 ?auto_6963 ) ) ( not ( = ?auto_6949 ?auto_6967 ) ) ( not ( = ?auto_6949 ?auto_6966 ) ) ( not ( = ?auto_6949 ?auto_6962 ) ) ( not ( = ?auto_6949 ?auto_6964 ) ) ( not ( = ?auto_6949 ?auto_6958 ) ) ( not ( = ?auto_6949 ?auto_6956 ) ) ( not ( = ?auto_6949 ?auto_6972 ) ) ( not ( = ?auto_6951 ?auto_6963 ) ) ( not ( = ?auto_6951 ?auto_6967 ) ) ( not ( = ?auto_6951 ?auto_6966 ) ) ( not ( = ?auto_6951 ?auto_6962 ) ) ( not ( = ?auto_6951 ?auto_6964 ) ) ( not ( = ?auto_6951 ?auto_6958 ) ) ( not ( = ?auto_6951 ?auto_6956 ) ) ( not ( = ?auto_6951 ?auto_6972 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_6940 ?auto_6941 ?auto_6942 ?auto_6943 ?auto_6944 ?auto_6945 ?auto_6946 ?auto_6947 ?auto_6948 )
      ( MAKE-1CRATE ?auto_6948 ?auto_6949 )
      ( MAKE-9CRATE-VERIFY ?auto_6940 ?auto_6941 ?auto_6942 ?auto_6943 ?auto_6944 ?auto_6945 ?auto_6946 ?auto_6947 ?auto_6948 ?auto_6949 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_6995 - SURFACE
      ?auto_6996 - SURFACE
      ?auto_6997 - SURFACE
      ?auto_6998 - SURFACE
      ?auto_6999 - SURFACE
      ?auto_7000 - SURFACE
      ?auto_7001 - SURFACE
      ?auto_7002 - SURFACE
      ?auto_7003 - SURFACE
      ?auto_7004 - SURFACE
      ?auto_7005 - SURFACE
    )
    :vars
    (
      ?auto_7008 - HOIST
      ?auto_7007 - PLACE
      ?auto_7009 - PLACE
      ?auto_7011 - HOIST
      ?auto_7010 - SURFACE
      ?auto_7017 - PLACE
      ?auto_7030 - HOIST
      ?auto_7012 - SURFACE
      ?auto_7018 - PLACE
      ?auto_7024 - HOIST
      ?auto_7020 - SURFACE
      ?auto_7026 - SURFACE
      ?auto_7022 - PLACE
      ?auto_7014 - HOIST
      ?auto_7032 - SURFACE
      ?auto_7031 - PLACE
      ?auto_7028 - HOIST
      ?auto_7016 - SURFACE
      ?auto_7021 - PLACE
      ?auto_7029 - HOIST
      ?auto_7027 - SURFACE
      ?auto_7023 - SURFACE
      ?auto_7019 - PLACE
      ?auto_7015 - HOIST
      ?auto_7013 - SURFACE
      ?auto_7025 - SURFACE
      ?auto_7006 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7008 ?auto_7007 ) ( IS-CRATE ?auto_7005 ) ( not ( = ?auto_7009 ?auto_7007 ) ) ( HOIST-AT ?auto_7011 ?auto_7009 ) ( AVAILABLE ?auto_7011 ) ( SURFACE-AT ?auto_7005 ?auto_7009 ) ( ON ?auto_7005 ?auto_7010 ) ( CLEAR ?auto_7005 ) ( not ( = ?auto_7004 ?auto_7005 ) ) ( not ( = ?auto_7004 ?auto_7010 ) ) ( not ( = ?auto_7005 ?auto_7010 ) ) ( not ( = ?auto_7008 ?auto_7011 ) ) ( IS-CRATE ?auto_7004 ) ( not ( = ?auto_7017 ?auto_7007 ) ) ( HOIST-AT ?auto_7030 ?auto_7017 ) ( SURFACE-AT ?auto_7004 ?auto_7017 ) ( ON ?auto_7004 ?auto_7012 ) ( CLEAR ?auto_7004 ) ( not ( = ?auto_7003 ?auto_7004 ) ) ( not ( = ?auto_7003 ?auto_7012 ) ) ( not ( = ?auto_7004 ?auto_7012 ) ) ( not ( = ?auto_7008 ?auto_7030 ) ) ( IS-CRATE ?auto_7003 ) ( not ( = ?auto_7018 ?auto_7007 ) ) ( HOIST-AT ?auto_7024 ?auto_7018 ) ( AVAILABLE ?auto_7024 ) ( SURFACE-AT ?auto_7003 ?auto_7018 ) ( ON ?auto_7003 ?auto_7020 ) ( CLEAR ?auto_7003 ) ( not ( = ?auto_7002 ?auto_7003 ) ) ( not ( = ?auto_7002 ?auto_7020 ) ) ( not ( = ?auto_7003 ?auto_7020 ) ) ( not ( = ?auto_7008 ?auto_7024 ) ) ( IS-CRATE ?auto_7002 ) ( AVAILABLE ?auto_7030 ) ( SURFACE-AT ?auto_7002 ?auto_7017 ) ( ON ?auto_7002 ?auto_7026 ) ( CLEAR ?auto_7002 ) ( not ( = ?auto_7001 ?auto_7002 ) ) ( not ( = ?auto_7001 ?auto_7026 ) ) ( not ( = ?auto_7002 ?auto_7026 ) ) ( IS-CRATE ?auto_7001 ) ( not ( = ?auto_7022 ?auto_7007 ) ) ( HOIST-AT ?auto_7014 ?auto_7022 ) ( AVAILABLE ?auto_7014 ) ( SURFACE-AT ?auto_7001 ?auto_7022 ) ( ON ?auto_7001 ?auto_7032 ) ( CLEAR ?auto_7001 ) ( not ( = ?auto_7000 ?auto_7001 ) ) ( not ( = ?auto_7000 ?auto_7032 ) ) ( not ( = ?auto_7001 ?auto_7032 ) ) ( not ( = ?auto_7008 ?auto_7014 ) ) ( IS-CRATE ?auto_7000 ) ( not ( = ?auto_7031 ?auto_7007 ) ) ( HOIST-AT ?auto_7028 ?auto_7031 ) ( SURFACE-AT ?auto_7000 ?auto_7031 ) ( ON ?auto_7000 ?auto_7016 ) ( CLEAR ?auto_7000 ) ( not ( = ?auto_6999 ?auto_7000 ) ) ( not ( = ?auto_6999 ?auto_7016 ) ) ( not ( = ?auto_7000 ?auto_7016 ) ) ( not ( = ?auto_7008 ?auto_7028 ) ) ( IS-CRATE ?auto_6999 ) ( not ( = ?auto_7021 ?auto_7007 ) ) ( HOIST-AT ?auto_7029 ?auto_7021 ) ( SURFACE-AT ?auto_6999 ?auto_7021 ) ( ON ?auto_6999 ?auto_7027 ) ( CLEAR ?auto_6999 ) ( not ( = ?auto_6998 ?auto_6999 ) ) ( not ( = ?auto_6998 ?auto_7027 ) ) ( not ( = ?auto_6999 ?auto_7027 ) ) ( not ( = ?auto_7008 ?auto_7029 ) ) ( IS-CRATE ?auto_6998 ) ( AVAILABLE ?auto_7029 ) ( SURFACE-AT ?auto_6998 ?auto_7021 ) ( ON ?auto_6998 ?auto_7023 ) ( CLEAR ?auto_6998 ) ( not ( = ?auto_6997 ?auto_6998 ) ) ( not ( = ?auto_6997 ?auto_7023 ) ) ( not ( = ?auto_6998 ?auto_7023 ) ) ( IS-CRATE ?auto_6997 ) ( not ( = ?auto_7019 ?auto_7007 ) ) ( HOIST-AT ?auto_7015 ?auto_7019 ) ( AVAILABLE ?auto_7015 ) ( SURFACE-AT ?auto_6997 ?auto_7019 ) ( ON ?auto_6997 ?auto_7013 ) ( CLEAR ?auto_6997 ) ( not ( = ?auto_6996 ?auto_6997 ) ) ( not ( = ?auto_6996 ?auto_7013 ) ) ( not ( = ?auto_6997 ?auto_7013 ) ) ( not ( = ?auto_7008 ?auto_7015 ) ) ( SURFACE-AT ?auto_6995 ?auto_7007 ) ( CLEAR ?auto_6995 ) ( IS-CRATE ?auto_6996 ) ( AVAILABLE ?auto_7008 ) ( AVAILABLE ?auto_7028 ) ( SURFACE-AT ?auto_6996 ?auto_7031 ) ( ON ?auto_6996 ?auto_7025 ) ( CLEAR ?auto_6996 ) ( TRUCK-AT ?auto_7006 ?auto_7007 ) ( not ( = ?auto_6995 ?auto_6996 ) ) ( not ( = ?auto_6995 ?auto_7025 ) ) ( not ( = ?auto_6996 ?auto_7025 ) ) ( not ( = ?auto_6995 ?auto_6997 ) ) ( not ( = ?auto_6995 ?auto_7013 ) ) ( not ( = ?auto_6997 ?auto_7025 ) ) ( not ( = ?auto_7019 ?auto_7031 ) ) ( not ( = ?auto_7015 ?auto_7028 ) ) ( not ( = ?auto_7013 ?auto_7025 ) ) ( not ( = ?auto_6995 ?auto_6998 ) ) ( not ( = ?auto_6995 ?auto_7023 ) ) ( not ( = ?auto_6996 ?auto_6998 ) ) ( not ( = ?auto_6996 ?auto_7023 ) ) ( not ( = ?auto_6998 ?auto_7013 ) ) ( not ( = ?auto_6998 ?auto_7025 ) ) ( not ( = ?auto_7021 ?auto_7019 ) ) ( not ( = ?auto_7021 ?auto_7031 ) ) ( not ( = ?auto_7029 ?auto_7015 ) ) ( not ( = ?auto_7029 ?auto_7028 ) ) ( not ( = ?auto_7023 ?auto_7013 ) ) ( not ( = ?auto_7023 ?auto_7025 ) ) ( not ( = ?auto_6995 ?auto_6999 ) ) ( not ( = ?auto_6995 ?auto_7027 ) ) ( not ( = ?auto_6996 ?auto_6999 ) ) ( not ( = ?auto_6996 ?auto_7027 ) ) ( not ( = ?auto_6997 ?auto_6999 ) ) ( not ( = ?auto_6997 ?auto_7027 ) ) ( not ( = ?auto_6999 ?auto_7023 ) ) ( not ( = ?auto_6999 ?auto_7013 ) ) ( not ( = ?auto_6999 ?auto_7025 ) ) ( not ( = ?auto_7027 ?auto_7023 ) ) ( not ( = ?auto_7027 ?auto_7013 ) ) ( not ( = ?auto_7027 ?auto_7025 ) ) ( not ( = ?auto_6995 ?auto_7000 ) ) ( not ( = ?auto_6995 ?auto_7016 ) ) ( not ( = ?auto_6996 ?auto_7000 ) ) ( not ( = ?auto_6996 ?auto_7016 ) ) ( not ( = ?auto_6997 ?auto_7000 ) ) ( not ( = ?auto_6997 ?auto_7016 ) ) ( not ( = ?auto_6998 ?auto_7000 ) ) ( not ( = ?auto_6998 ?auto_7016 ) ) ( not ( = ?auto_7000 ?auto_7027 ) ) ( not ( = ?auto_7000 ?auto_7023 ) ) ( not ( = ?auto_7000 ?auto_7013 ) ) ( not ( = ?auto_7000 ?auto_7025 ) ) ( not ( = ?auto_7016 ?auto_7027 ) ) ( not ( = ?auto_7016 ?auto_7023 ) ) ( not ( = ?auto_7016 ?auto_7013 ) ) ( not ( = ?auto_7016 ?auto_7025 ) ) ( not ( = ?auto_6995 ?auto_7001 ) ) ( not ( = ?auto_6995 ?auto_7032 ) ) ( not ( = ?auto_6996 ?auto_7001 ) ) ( not ( = ?auto_6996 ?auto_7032 ) ) ( not ( = ?auto_6997 ?auto_7001 ) ) ( not ( = ?auto_6997 ?auto_7032 ) ) ( not ( = ?auto_6998 ?auto_7001 ) ) ( not ( = ?auto_6998 ?auto_7032 ) ) ( not ( = ?auto_6999 ?auto_7001 ) ) ( not ( = ?auto_6999 ?auto_7032 ) ) ( not ( = ?auto_7001 ?auto_7016 ) ) ( not ( = ?auto_7001 ?auto_7027 ) ) ( not ( = ?auto_7001 ?auto_7023 ) ) ( not ( = ?auto_7001 ?auto_7013 ) ) ( not ( = ?auto_7001 ?auto_7025 ) ) ( not ( = ?auto_7022 ?auto_7031 ) ) ( not ( = ?auto_7022 ?auto_7021 ) ) ( not ( = ?auto_7022 ?auto_7019 ) ) ( not ( = ?auto_7014 ?auto_7028 ) ) ( not ( = ?auto_7014 ?auto_7029 ) ) ( not ( = ?auto_7014 ?auto_7015 ) ) ( not ( = ?auto_7032 ?auto_7016 ) ) ( not ( = ?auto_7032 ?auto_7027 ) ) ( not ( = ?auto_7032 ?auto_7023 ) ) ( not ( = ?auto_7032 ?auto_7013 ) ) ( not ( = ?auto_7032 ?auto_7025 ) ) ( not ( = ?auto_6995 ?auto_7002 ) ) ( not ( = ?auto_6995 ?auto_7026 ) ) ( not ( = ?auto_6996 ?auto_7002 ) ) ( not ( = ?auto_6996 ?auto_7026 ) ) ( not ( = ?auto_6997 ?auto_7002 ) ) ( not ( = ?auto_6997 ?auto_7026 ) ) ( not ( = ?auto_6998 ?auto_7002 ) ) ( not ( = ?auto_6998 ?auto_7026 ) ) ( not ( = ?auto_6999 ?auto_7002 ) ) ( not ( = ?auto_6999 ?auto_7026 ) ) ( not ( = ?auto_7000 ?auto_7002 ) ) ( not ( = ?auto_7000 ?auto_7026 ) ) ( not ( = ?auto_7002 ?auto_7032 ) ) ( not ( = ?auto_7002 ?auto_7016 ) ) ( not ( = ?auto_7002 ?auto_7027 ) ) ( not ( = ?auto_7002 ?auto_7023 ) ) ( not ( = ?auto_7002 ?auto_7013 ) ) ( not ( = ?auto_7002 ?auto_7025 ) ) ( not ( = ?auto_7017 ?auto_7022 ) ) ( not ( = ?auto_7017 ?auto_7031 ) ) ( not ( = ?auto_7017 ?auto_7021 ) ) ( not ( = ?auto_7017 ?auto_7019 ) ) ( not ( = ?auto_7030 ?auto_7014 ) ) ( not ( = ?auto_7030 ?auto_7028 ) ) ( not ( = ?auto_7030 ?auto_7029 ) ) ( not ( = ?auto_7030 ?auto_7015 ) ) ( not ( = ?auto_7026 ?auto_7032 ) ) ( not ( = ?auto_7026 ?auto_7016 ) ) ( not ( = ?auto_7026 ?auto_7027 ) ) ( not ( = ?auto_7026 ?auto_7023 ) ) ( not ( = ?auto_7026 ?auto_7013 ) ) ( not ( = ?auto_7026 ?auto_7025 ) ) ( not ( = ?auto_6995 ?auto_7003 ) ) ( not ( = ?auto_6995 ?auto_7020 ) ) ( not ( = ?auto_6996 ?auto_7003 ) ) ( not ( = ?auto_6996 ?auto_7020 ) ) ( not ( = ?auto_6997 ?auto_7003 ) ) ( not ( = ?auto_6997 ?auto_7020 ) ) ( not ( = ?auto_6998 ?auto_7003 ) ) ( not ( = ?auto_6998 ?auto_7020 ) ) ( not ( = ?auto_6999 ?auto_7003 ) ) ( not ( = ?auto_6999 ?auto_7020 ) ) ( not ( = ?auto_7000 ?auto_7003 ) ) ( not ( = ?auto_7000 ?auto_7020 ) ) ( not ( = ?auto_7001 ?auto_7003 ) ) ( not ( = ?auto_7001 ?auto_7020 ) ) ( not ( = ?auto_7003 ?auto_7026 ) ) ( not ( = ?auto_7003 ?auto_7032 ) ) ( not ( = ?auto_7003 ?auto_7016 ) ) ( not ( = ?auto_7003 ?auto_7027 ) ) ( not ( = ?auto_7003 ?auto_7023 ) ) ( not ( = ?auto_7003 ?auto_7013 ) ) ( not ( = ?auto_7003 ?auto_7025 ) ) ( not ( = ?auto_7018 ?auto_7017 ) ) ( not ( = ?auto_7018 ?auto_7022 ) ) ( not ( = ?auto_7018 ?auto_7031 ) ) ( not ( = ?auto_7018 ?auto_7021 ) ) ( not ( = ?auto_7018 ?auto_7019 ) ) ( not ( = ?auto_7024 ?auto_7030 ) ) ( not ( = ?auto_7024 ?auto_7014 ) ) ( not ( = ?auto_7024 ?auto_7028 ) ) ( not ( = ?auto_7024 ?auto_7029 ) ) ( not ( = ?auto_7024 ?auto_7015 ) ) ( not ( = ?auto_7020 ?auto_7026 ) ) ( not ( = ?auto_7020 ?auto_7032 ) ) ( not ( = ?auto_7020 ?auto_7016 ) ) ( not ( = ?auto_7020 ?auto_7027 ) ) ( not ( = ?auto_7020 ?auto_7023 ) ) ( not ( = ?auto_7020 ?auto_7013 ) ) ( not ( = ?auto_7020 ?auto_7025 ) ) ( not ( = ?auto_6995 ?auto_7004 ) ) ( not ( = ?auto_6995 ?auto_7012 ) ) ( not ( = ?auto_6996 ?auto_7004 ) ) ( not ( = ?auto_6996 ?auto_7012 ) ) ( not ( = ?auto_6997 ?auto_7004 ) ) ( not ( = ?auto_6997 ?auto_7012 ) ) ( not ( = ?auto_6998 ?auto_7004 ) ) ( not ( = ?auto_6998 ?auto_7012 ) ) ( not ( = ?auto_6999 ?auto_7004 ) ) ( not ( = ?auto_6999 ?auto_7012 ) ) ( not ( = ?auto_7000 ?auto_7004 ) ) ( not ( = ?auto_7000 ?auto_7012 ) ) ( not ( = ?auto_7001 ?auto_7004 ) ) ( not ( = ?auto_7001 ?auto_7012 ) ) ( not ( = ?auto_7002 ?auto_7004 ) ) ( not ( = ?auto_7002 ?auto_7012 ) ) ( not ( = ?auto_7004 ?auto_7020 ) ) ( not ( = ?auto_7004 ?auto_7026 ) ) ( not ( = ?auto_7004 ?auto_7032 ) ) ( not ( = ?auto_7004 ?auto_7016 ) ) ( not ( = ?auto_7004 ?auto_7027 ) ) ( not ( = ?auto_7004 ?auto_7023 ) ) ( not ( = ?auto_7004 ?auto_7013 ) ) ( not ( = ?auto_7004 ?auto_7025 ) ) ( not ( = ?auto_7012 ?auto_7020 ) ) ( not ( = ?auto_7012 ?auto_7026 ) ) ( not ( = ?auto_7012 ?auto_7032 ) ) ( not ( = ?auto_7012 ?auto_7016 ) ) ( not ( = ?auto_7012 ?auto_7027 ) ) ( not ( = ?auto_7012 ?auto_7023 ) ) ( not ( = ?auto_7012 ?auto_7013 ) ) ( not ( = ?auto_7012 ?auto_7025 ) ) ( not ( = ?auto_6995 ?auto_7005 ) ) ( not ( = ?auto_6995 ?auto_7010 ) ) ( not ( = ?auto_6996 ?auto_7005 ) ) ( not ( = ?auto_6996 ?auto_7010 ) ) ( not ( = ?auto_6997 ?auto_7005 ) ) ( not ( = ?auto_6997 ?auto_7010 ) ) ( not ( = ?auto_6998 ?auto_7005 ) ) ( not ( = ?auto_6998 ?auto_7010 ) ) ( not ( = ?auto_6999 ?auto_7005 ) ) ( not ( = ?auto_6999 ?auto_7010 ) ) ( not ( = ?auto_7000 ?auto_7005 ) ) ( not ( = ?auto_7000 ?auto_7010 ) ) ( not ( = ?auto_7001 ?auto_7005 ) ) ( not ( = ?auto_7001 ?auto_7010 ) ) ( not ( = ?auto_7002 ?auto_7005 ) ) ( not ( = ?auto_7002 ?auto_7010 ) ) ( not ( = ?auto_7003 ?auto_7005 ) ) ( not ( = ?auto_7003 ?auto_7010 ) ) ( not ( = ?auto_7005 ?auto_7012 ) ) ( not ( = ?auto_7005 ?auto_7020 ) ) ( not ( = ?auto_7005 ?auto_7026 ) ) ( not ( = ?auto_7005 ?auto_7032 ) ) ( not ( = ?auto_7005 ?auto_7016 ) ) ( not ( = ?auto_7005 ?auto_7027 ) ) ( not ( = ?auto_7005 ?auto_7023 ) ) ( not ( = ?auto_7005 ?auto_7013 ) ) ( not ( = ?auto_7005 ?auto_7025 ) ) ( not ( = ?auto_7009 ?auto_7017 ) ) ( not ( = ?auto_7009 ?auto_7018 ) ) ( not ( = ?auto_7009 ?auto_7022 ) ) ( not ( = ?auto_7009 ?auto_7031 ) ) ( not ( = ?auto_7009 ?auto_7021 ) ) ( not ( = ?auto_7009 ?auto_7019 ) ) ( not ( = ?auto_7011 ?auto_7030 ) ) ( not ( = ?auto_7011 ?auto_7024 ) ) ( not ( = ?auto_7011 ?auto_7014 ) ) ( not ( = ?auto_7011 ?auto_7028 ) ) ( not ( = ?auto_7011 ?auto_7029 ) ) ( not ( = ?auto_7011 ?auto_7015 ) ) ( not ( = ?auto_7010 ?auto_7012 ) ) ( not ( = ?auto_7010 ?auto_7020 ) ) ( not ( = ?auto_7010 ?auto_7026 ) ) ( not ( = ?auto_7010 ?auto_7032 ) ) ( not ( = ?auto_7010 ?auto_7016 ) ) ( not ( = ?auto_7010 ?auto_7027 ) ) ( not ( = ?auto_7010 ?auto_7023 ) ) ( not ( = ?auto_7010 ?auto_7013 ) ) ( not ( = ?auto_7010 ?auto_7025 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_6995 ?auto_6996 ?auto_6997 ?auto_6998 ?auto_6999 ?auto_7000 ?auto_7001 ?auto_7002 ?auto_7003 ?auto_7004 )
      ( MAKE-1CRATE ?auto_7004 ?auto_7005 )
      ( MAKE-10CRATE-VERIFY ?auto_6995 ?auto_6996 ?auto_6997 ?auto_6998 ?auto_6999 ?auto_7000 ?auto_7001 ?auto_7002 ?auto_7003 ?auto_7004 ?auto_7005 ) )
  )

)

