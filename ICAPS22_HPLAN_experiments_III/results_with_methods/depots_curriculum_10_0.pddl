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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6660 - SURFACE
      ?auto_6661 - SURFACE
    )
    :vars
    (
      ?auto_6662 - HOIST
      ?auto_6663 - PLACE
      ?auto_6665 - PLACE
      ?auto_6666 - HOIST
      ?auto_6667 - SURFACE
      ?auto_6664 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6662 ?auto_6663 ) ( SURFACE-AT ?auto_6660 ?auto_6663 ) ( CLEAR ?auto_6660 ) ( IS-CRATE ?auto_6661 ) ( AVAILABLE ?auto_6662 ) ( not ( = ?auto_6665 ?auto_6663 ) ) ( HOIST-AT ?auto_6666 ?auto_6665 ) ( AVAILABLE ?auto_6666 ) ( SURFACE-AT ?auto_6661 ?auto_6665 ) ( ON ?auto_6661 ?auto_6667 ) ( CLEAR ?auto_6661 ) ( TRUCK-AT ?auto_6664 ?auto_6663 ) ( not ( = ?auto_6660 ?auto_6661 ) ) ( not ( = ?auto_6660 ?auto_6667 ) ) ( not ( = ?auto_6661 ?auto_6667 ) ) ( not ( = ?auto_6662 ?auto_6666 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6664 ?auto_6663 ?auto_6665 )
      ( !LIFT ?auto_6666 ?auto_6661 ?auto_6667 ?auto_6665 )
      ( !LOAD ?auto_6666 ?auto_6661 ?auto_6664 ?auto_6665 )
      ( !DRIVE ?auto_6664 ?auto_6665 ?auto_6663 )
      ( !UNLOAD ?auto_6662 ?auto_6661 ?auto_6664 ?auto_6663 )
      ( !DROP ?auto_6662 ?auto_6661 ?auto_6660 ?auto_6663 )
      ( MAKE-1CRATE-VERIFY ?auto_6660 ?auto_6661 ) )
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
      ?auto_6679 - PLACE
      ?auto_6678 - HOIST
      ?auto_6675 - SURFACE
      ?auto_6680 - PLACE
      ?auto_6682 - HOIST
      ?auto_6681 - SURFACE
      ?auto_6674 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6677 ?auto_6676 ) ( IS-CRATE ?auto_6673 ) ( not ( = ?auto_6679 ?auto_6676 ) ) ( HOIST-AT ?auto_6678 ?auto_6679 ) ( AVAILABLE ?auto_6678 ) ( SURFACE-AT ?auto_6673 ?auto_6679 ) ( ON ?auto_6673 ?auto_6675 ) ( CLEAR ?auto_6673 ) ( not ( = ?auto_6672 ?auto_6673 ) ) ( not ( = ?auto_6672 ?auto_6675 ) ) ( not ( = ?auto_6673 ?auto_6675 ) ) ( not ( = ?auto_6677 ?auto_6678 ) ) ( SURFACE-AT ?auto_6671 ?auto_6676 ) ( CLEAR ?auto_6671 ) ( IS-CRATE ?auto_6672 ) ( AVAILABLE ?auto_6677 ) ( not ( = ?auto_6680 ?auto_6676 ) ) ( HOIST-AT ?auto_6682 ?auto_6680 ) ( AVAILABLE ?auto_6682 ) ( SURFACE-AT ?auto_6672 ?auto_6680 ) ( ON ?auto_6672 ?auto_6681 ) ( CLEAR ?auto_6672 ) ( TRUCK-AT ?auto_6674 ?auto_6676 ) ( not ( = ?auto_6671 ?auto_6672 ) ) ( not ( = ?auto_6671 ?auto_6681 ) ) ( not ( = ?auto_6672 ?auto_6681 ) ) ( not ( = ?auto_6677 ?auto_6682 ) ) ( not ( = ?auto_6671 ?auto_6673 ) ) ( not ( = ?auto_6671 ?auto_6675 ) ) ( not ( = ?auto_6673 ?auto_6681 ) ) ( not ( = ?auto_6679 ?auto_6680 ) ) ( not ( = ?auto_6678 ?auto_6682 ) ) ( not ( = ?auto_6675 ?auto_6681 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6671 ?auto_6672 )
      ( MAKE-1CRATE ?auto_6672 ?auto_6673 )
      ( MAKE-2CRATE-VERIFY ?auto_6671 ?auto_6672 ?auto_6673 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6685 - SURFACE
      ?auto_6686 - SURFACE
    )
    :vars
    (
      ?auto_6687 - HOIST
      ?auto_6688 - PLACE
      ?auto_6690 - PLACE
      ?auto_6691 - HOIST
      ?auto_6692 - SURFACE
      ?auto_6689 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6687 ?auto_6688 ) ( SURFACE-AT ?auto_6685 ?auto_6688 ) ( CLEAR ?auto_6685 ) ( IS-CRATE ?auto_6686 ) ( AVAILABLE ?auto_6687 ) ( not ( = ?auto_6690 ?auto_6688 ) ) ( HOIST-AT ?auto_6691 ?auto_6690 ) ( AVAILABLE ?auto_6691 ) ( SURFACE-AT ?auto_6686 ?auto_6690 ) ( ON ?auto_6686 ?auto_6692 ) ( CLEAR ?auto_6686 ) ( TRUCK-AT ?auto_6689 ?auto_6688 ) ( not ( = ?auto_6685 ?auto_6686 ) ) ( not ( = ?auto_6685 ?auto_6692 ) ) ( not ( = ?auto_6686 ?auto_6692 ) ) ( not ( = ?auto_6687 ?auto_6691 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6689 ?auto_6688 ?auto_6690 )
      ( !LIFT ?auto_6691 ?auto_6686 ?auto_6692 ?auto_6690 )
      ( !LOAD ?auto_6691 ?auto_6686 ?auto_6689 ?auto_6690 )
      ( !DRIVE ?auto_6689 ?auto_6690 ?auto_6688 )
      ( !UNLOAD ?auto_6687 ?auto_6686 ?auto_6689 ?auto_6688 )
      ( !DROP ?auto_6687 ?auto_6686 ?auto_6685 ?auto_6688 )
      ( MAKE-1CRATE-VERIFY ?auto_6685 ?auto_6686 ) )
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
      ?auto_6705 - HOIST
      ?auto_6702 - PLACE
      ?auto_6704 - PLACE
      ?auto_6703 - HOIST
      ?auto_6701 - SURFACE
      ?auto_6710 - PLACE
      ?auto_6712 - HOIST
      ?auto_6711 - SURFACE
      ?auto_6709 - PLACE
      ?auto_6708 - HOIST
      ?auto_6707 - SURFACE
      ?auto_6706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6705 ?auto_6702 ) ( IS-CRATE ?auto_6700 ) ( not ( = ?auto_6704 ?auto_6702 ) ) ( HOIST-AT ?auto_6703 ?auto_6704 ) ( AVAILABLE ?auto_6703 ) ( SURFACE-AT ?auto_6700 ?auto_6704 ) ( ON ?auto_6700 ?auto_6701 ) ( CLEAR ?auto_6700 ) ( not ( = ?auto_6699 ?auto_6700 ) ) ( not ( = ?auto_6699 ?auto_6701 ) ) ( not ( = ?auto_6700 ?auto_6701 ) ) ( not ( = ?auto_6705 ?auto_6703 ) ) ( IS-CRATE ?auto_6699 ) ( not ( = ?auto_6710 ?auto_6702 ) ) ( HOIST-AT ?auto_6712 ?auto_6710 ) ( AVAILABLE ?auto_6712 ) ( SURFACE-AT ?auto_6699 ?auto_6710 ) ( ON ?auto_6699 ?auto_6711 ) ( CLEAR ?auto_6699 ) ( not ( = ?auto_6698 ?auto_6699 ) ) ( not ( = ?auto_6698 ?auto_6711 ) ) ( not ( = ?auto_6699 ?auto_6711 ) ) ( not ( = ?auto_6705 ?auto_6712 ) ) ( SURFACE-AT ?auto_6697 ?auto_6702 ) ( CLEAR ?auto_6697 ) ( IS-CRATE ?auto_6698 ) ( AVAILABLE ?auto_6705 ) ( not ( = ?auto_6709 ?auto_6702 ) ) ( HOIST-AT ?auto_6708 ?auto_6709 ) ( AVAILABLE ?auto_6708 ) ( SURFACE-AT ?auto_6698 ?auto_6709 ) ( ON ?auto_6698 ?auto_6707 ) ( CLEAR ?auto_6698 ) ( TRUCK-AT ?auto_6706 ?auto_6702 ) ( not ( = ?auto_6697 ?auto_6698 ) ) ( not ( = ?auto_6697 ?auto_6707 ) ) ( not ( = ?auto_6698 ?auto_6707 ) ) ( not ( = ?auto_6705 ?auto_6708 ) ) ( not ( = ?auto_6697 ?auto_6699 ) ) ( not ( = ?auto_6697 ?auto_6711 ) ) ( not ( = ?auto_6699 ?auto_6707 ) ) ( not ( = ?auto_6710 ?auto_6709 ) ) ( not ( = ?auto_6712 ?auto_6708 ) ) ( not ( = ?auto_6711 ?auto_6707 ) ) ( not ( = ?auto_6697 ?auto_6700 ) ) ( not ( = ?auto_6697 ?auto_6701 ) ) ( not ( = ?auto_6698 ?auto_6700 ) ) ( not ( = ?auto_6698 ?auto_6701 ) ) ( not ( = ?auto_6700 ?auto_6711 ) ) ( not ( = ?auto_6700 ?auto_6707 ) ) ( not ( = ?auto_6704 ?auto_6710 ) ) ( not ( = ?auto_6704 ?auto_6709 ) ) ( not ( = ?auto_6703 ?auto_6712 ) ) ( not ( = ?auto_6703 ?auto_6708 ) ) ( not ( = ?auto_6701 ?auto_6711 ) ) ( not ( = ?auto_6701 ?auto_6707 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6697 ?auto_6698 ?auto_6699 )
      ( MAKE-1CRATE ?auto_6699 ?auto_6700 )
      ( MAKE-3CRATE-VERIFY ?auto_6697 ?auto_6698 ?auto_6699 ?auto_6700 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6715 - SURFACE
      ?auto_6716 - SURFACE
    )
    :vars
    (
      ?auto_6717 - HOIST
      ?auto_6718 - PLACE
      ?auto_6720 - PLACE
      ?auto_6721 - HOIST
      ?auto_6722 - SURFACE
      ?auto_6719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6717 ?auto_6718 ) ( SURFACE-AT ?auto_6715 ?auto_6718 ) ( CLEAR ?auto_6715 ) ( IS-CRATE ?auto_6716 ) ( AVAILABLE ?auto_6717 ) ( not ( = ?auto_6720 ?auto_6718 ) ) ( HOIST-AT ?auto_6721 ?auto_6720 ) ( AVAILABLE ?auto_6721 ) ( SURFACE-AT ?auto_6716 ?auto_6720 ) ( ON ?auto_6716 ?auto_6722 ) ( CLEAR ?auto_6716 ) ( TRUCK-AT ?auto_6719 ?auto_6718 ) ( not ( = ?auto_6715 ?auto_6716 ) ) ( not ( = ?auto_6715 ?auto_6722 ) ) ( not ( = ?auto_6716 ?auto_6722 ) ) ( not ( = ?auto_6717 ?auto_6721 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6719 ?auto_6718 ?auto_6720 )
      ( !LIFT ?auto_6721 ?auto_6716 ?auto_6722 ?auto_6720 )
      ( !LOAD ?auto_6721 ?auto_6716 ?auto_6719 ?auto_6720 )
      ( !DRIVE ?auto_6719 ?auto_6720 ?auto_6718 )
      ( !UNLOAD ?auto_6717 ?auto_6716 ?auto_6719 ?auto_6718 )
      ( !DROP ?auto_6717 ?auto_6716 ?auto_6715 ?auto_6718 )
      ( MAKE-1CRATE-VERIFY ?auto_6715 ?auto_6716 ) )
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
      ?auto_6735 - HOIST
      ?auto_6733 - PLACE
      ?auto_6734 - PLACE
      ?auto_6737 - HOIST
      ?auto_6736 - SURFACE
      ?auto_6743 - SURFACE
      ?auto_6742 - PLACE
      ?auto_6739 - HOIST
      ?auto_6741 - SURFACE
      ?auto_6740 - PLACE
      ?auto_6744 - HOIST
      ?auto_6745 - SURFACE
      ?auto_6738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6735 ?auto_6733 ) ( IS-CRATE ?auto_6732 ) ( not ( = ?auto_6734 ?auto_6733 ) ) ( HOIST-AT ?auto_6737 ?auto_6734 ) ( SURFACE-AT ?auto_6732 ?auto_6734 ) ( ON ?auto_6732 ?auto_6736 ) ( CLEAR ?auto_6732 ) ( not ( = ?auto_6731 ?auto_6732 ) ) ( not ( = ?auto_6731 ?auto_6736 ) ) ( not ( = ?auto_6732 ?auto_6736 ) ) ( not ( = ?auto_6735 ?auto_6737 ) ) ( IS-CRATE ?auto_6731 ) ( AVAILABLE ?auto_6737 ) ( SURFACE-AT ?auto_6731 ?auto_6734 ) ( ON ?auto_6731 ?auto_6743 ) ( CLEAR ?auto_6731 ) ( not ( = ?auto_6730 ?auto_6731 ) ) ( not ( = ?auto_6730 ?auto_6743 ) ) ( not ( = ?auto_6731 ?auto_6743 ) ) ( IS-CRATE ?auto_6730 ) ( not ( = ?auto_6742 ?auto_6733 ) ) ( HOIST-AT ?auto_6739 ?auto_6742 ) ( AVAILABLE ?auto_6739 ) ( SURFACE-AT ?auto_6730 ?auto_6742 ) ( ON ?auto_6730 ?auto_6741 ) ( CLEAR ?auto_6730 ) ( not ( = ?auto_6729 ?auto_6730 ) ) ( not ( = ?auto_6729 ?auto_6741 ) ) ( not ( = ?auto_6730 ?auto_6741 ) ) ( not ( = ?auto_6735 ?auto_6739 ) ) ( SURFACE-AT ?auto_6728 ?auto_6733 ) ( CLEAR ?auto_6728 ) ( IS-CRATE ?auto_6729 ) ( AVAILABLE ?auto_6735 ) ( not ( = ?auto_6740 ?auto_6733 ) ) ( HOIST-AT ?auto_6744 ?auto_6740 ) ( AVAILABLE ?auto_6744 ) ( SURFACE-AT ?auto_6729 ?auto_6740 ) ( ON ?auto_6729 ?auto_6745 ) ( CLEAR ?auto_6729 ) ( TRUCK-AT ?auto_6738 ?auto_6733 ) ( not ( = ?auto_6728 ?auto_6729 ) ) ( not ( = ?auto_6728 ?auto_6745 ) ) ( not ( = ?auto_6729 ?auto_6745 ) ) ( not ( = ?auto_6735 ?auto_6744 ) ) ( not ( = ?auto_6728 ?auto_6730 ) ) ( not ( = ?auto_6728 ?auto_6741 ) ) ( not ( = ?auto_6730 ?auto_6745 ) ) ( not ( = ?auto_6742 ?auto_6740 ) ) ( not ( = ?auto_6739 ?auto_6744 ) ) ( not ( = ?auto_6741 ?auto_6745 ) ) ( not ( = ?auto_6728 ?auto_6731 ) ) ( not ( = ?auto_6728 ?auto_6743 ) ) ( not ( = ?auto_6729 ?auto_6731 ) ) ( not ( = ?auto_6729 ?auto_6743 ) ) ( not ( = ?auto_6731 ?auto_6741 ) ) ( not ( = ?auto_6731 ?auto_6745 ) ) ( not ( = ?auto_6734 ?auto_6742 ) ) ( not ( = ?auto_6734 ?auto_6740 ) ) ( not ( = ?auto_6737 ?auto_6739 ) ) ( not ( = ?auto_6737 ?auto_6744 ) ) ( not ( = ?auto_6743 ?auto_6741 ) ) ( not ( = ?auto_6743 ?auto_6745 ) ) ( not ( = ?auto_6728 ?auto_6732 ) ) ( not ( = ?auto_6728 ?auto_6736 ) ) ( not ( = ?auto_6729 ?auto_6732 ) ) ( not ( = ?auto_6729 ?auto_6736 ) ) ( not ( = ?auto_6730 ?auto_6732 ) ) ( not ( = ?auto_6730 ?auto_6736 ) ) ( not ( = ?auto_6732 ?auto_6743 ) ) ( not ( = ?auto_6732 ?auto_6741 ) ) ( not ( = ?auto_6732 ?auto_6745 ) ) ( not ( = ?auto_6736 ?auto_6743 ) ) ( not ( = ?auto_6736 ?auto_6741 ) ) ( not ( = ?auto_6736 ?auto_6745 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_6728 ?auto_6729 ?auto_6730 ?auto_6731 )
      ( MAKE-1CRATE ?auto_6731 ?auto_6732 )
      ( MAKE-4CRATE-VERIFY ?auto_6728 ?auto_6729 ?auto_6730 ?auto_6731 ?auto_6732 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6748 - SURFACE
      ?auto_6749 - SURFACE
    )
    :vars
    (
      ?auto_6750 - HOIST
      ?auto_6751 - PLACE
      ?auto_6753 - PLACE
      ?auto_6754 - HOIST
      ?auto_6755 - SURFACE
      ?auto_6752 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6750 ?auto_6751 ) ( SURFACE-AT ?auto_6748 ?auto_6751 ) ( CLEAR ?auto_6748 ) ( IS-CRATE ?auto_6749 ) ( AVAILABLE ?auto_6750 ) ( not ( = ?auto_6753 ?auto_6751 ) ) ( HOIST-AT ?auto_6754 ?auto_6753 ) ( AVAILABLE ?auto_6754 ) ( SURFACE-AT ?auto_6749 ?auto_6753 ) ( ON ?auto_6749 ?auto_6755 ) ( CLEAR ?auto_6749 ) ( TRUCK-AT ?auto_6752 ?auto_6751 ) ( not ( = ?auto_6748 ?auto_6749 ) ) ( not ( = ?auto_6748 ?auto_6755 ) ) ( not ( = ?auto_6749 ?auto_6755 ) ) ( not ( = ?auto_6750 ?auto_6754 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6752 ?auto_6751 ?auto_6753 )
      ( !LIFT ?auto_6754 ?auto_6749 ?auto_6755 ?auto_6753 )
      ( !LOAD ?auto_6754 ?auto_6749 ?auto_6752 ?auto_6753 )
      ( !DRIVE ?auto_6752 ?auto_6753 ?auto_6751 )
      ( !UNLOAD ?auto_6750 ?auto_6749 ?auto_6752 ?auto_6751 )
      ( !DROP ?auto_6750 ?auto_6749 ?auto_6748 ?auto_6751 )
      ( MAKE-1CRATE-VERIFY ?auto_6748 ?auto_6749 ) )
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
      ?auto_6768 - PLACE
      ?auto_6773 - HOIST
      ?auto_6771 - SURFACE
      ?auto_6779 - PLACE
      ?auto_6775 - HOIST
      ?auto_6781 - SURFACE
      ?auto_6774 - SURFACE
      ?auto_6780 - PLACE
      ?auto_6777 - HOIST
      ?auto_6778 - SURFACE
      ?auto_6776 - SURFACE
      ?auto_6770 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6772 ?auto_6769 ) ( IS-CRATE ?auto_6767 ) ( not ( = ?auto_6768 ?auto_6769 ) ) ( HOIST-AT ?auto_6773 ?auto_6768 ) ( SURFACE-AT ?auto_6767 ?auto_6768 ) ( ON ?auto_6767 ?auto_6771 ) ( CLEAR ?auto_6767 ) ( not ( = ?auto_6766 ?auto_6767 ) ) ( not ( = ?auto_6766 ?auto_6771 ) ) ( not ( = ?auto_6767 ?auto_6771 ) ) ( not ( = ?auto_6772 ?auto_6773 ) ) ( IS-CRATE ?auto_6766 ) ( not ( = ?auto_6779 ?auto_6769 ) ) ( HOIST-AT ?auto_6775 ?auto_6779 ) ( SURFACE-AT ?auto_6766 ?auto_6779 ) ( ON ?auto_6766 ?auto_6781 ) ( CLEAR ?auto_6766 ) ( not ( = ?auto_6765 ?auto_6766 ) ) ( not ( = ?auto_6765 ?auto_6781 ) ) ( not ( = ?auto_6766 ?auto_6781 ) ) ( not ( = ?auto_6772 ?auto_6775 ) ) ( IS-CRATE ?auto_6765 ) ( AVAILABLE ?auto_6775 ) ( SURFACE-AT ?auto_6765 ?auto_6779 ) ( ON ?auto_6765 ?auto_6774 ) ( CLEAR ?auto_6765 ) ( not ( = ?auto_6764 ?auto_6765 ) ) ( not ( = ?auto_6764 ?auto_6774 ) ) ( not ( = ?auto_6765 ?auto_6774 ) ) ( IS-CRATE ?auto_6764 ) ( not ( = ?auto_6780 ?auto_6769 ) ) ( HOIST-AT ?auto_6777 ?auto_6780 ) ( AVAILABLE ?auto_6777 ) ( SURFACE-AT ?auto_6764 ?auto_6780 ) ( ON ?auto_6764 ?auto_6778 ) ( CLEAR ?auto_6764 ) ( not ( = ?auto_6763 ?auto_6764 ) ) ( not ( = ?auto_6763 ?auto_6778 ) ) ( not ( = ?auto_6764 ?auto_6778 ) ) ( not ( = ?auto_6772 ?auto_6777 ) ) ( SURFACE-AT ?auto_6762 ?auto_6769 ) ( CLEAR ?auto_6762 ) ( IS-CRATE ?auto_6763 ) ( AVAILABLE ?auto_6772 ) ( AVAILABLE ?auto_6773 ) ( SURFACE-AT ?auto_6763 ?auto_6768 ) ( ON ?auto_6763 ?auto_6776 ) ( CLEAR ?auto_6763 ) ( TRUCK-AT ?auto_6770 ?auto_6769 ) ( not ( = ?auto_6762 ?auto_6763 ) ) ( not ( = ?auto_6762 ?auto_6776 ) ) ( not ( = ?auto_6763 ?auto_6776 ) ) ( not ( = ?auto_6762 ?auto_6764 ) ) ( not ( = ?auto_6762 ?auto_6778 ) ) ( not ( = ?auto_6764 ?auto_6776 ) ) ( not ( = ?auto_6780 ?auto_6768 ) ) ( not ( = ?auto_6777 ?auto_6773 ) ) ( not ( = ?auto_6778 ?auto_6776 ) ) ( not ( = ?auto_6762 ?auto_6765 ) ) ( not ( = ?auto_6762 ?auto_6774 ) ) ( not ( = ?auto_6763 ?auto_6765 ) ) ( not ( = ?auto_6763 ?auto_6774 ) ) ( not ( = ?auto_6765 ?auto_6778 ) ) ( not ( = ?auto_6765 ?auto_6776 ) ) ( not ( = ?auto_6779 ?auto_6780 ) ) ( not ( = ?auto_6779 ?auto_6768 ) ) ( not ( = ?auto_6775 ?auto_6777 ) ) ( not ( = ?auto_6775 ?auto_6773 ) ) ( not ( = ?auto_6774 ?auto_6778 ) ) ( not ( = ?auto_6774 ?auto_6776 ) ) ( not ( = ?auto_6762 ?auto_6766 ) ) ( not ( = ?auto_6762 ?auto_6781 ) ) ( not ( = ?auto_6763 ?auto_6766 ) ) ( not ( = ?auto_6763 ?auto_6781 ) ) ( not ( = ?auto_6764 ?auto_6766 ) ) ( not ( = ?auto_6764 ?auto_6781 ) ) ( not ( = ?auto_6766 ?auto_6774 ) ) ( not ( = ?auto_6766 ?auto_6778 ) ) ( not ( = ?auto_6766 ?auto_6776 ) ) ( not ( = ?auto_6781 ?auto_6774 ) ) ( not ( = ?auto_6781 ?auto_6778 ) ) ( not ( = ?auto_6781 ?auto_6776 ) ) ( not ( = ?auto_6762 ?auto_6767 ) ) ( not ( = ?auto_6762 ?auto_6771 ) ) ( not ( = ?auto_6763 ?auto_6767 ) ) ( not ( = ?auto_6763 ?auto_6771 ) ) ( not ( = ?auto_6764 ?auto_6767 ) ) ( not ( = ?auto_6764 ?auto_6771 ) ) ( not ( = ?auto_6765 ?auto_6767 ) ) ( not ( = ?auto_6765 ?auto_6771 ) ) ( not ( = ?auto_6767 ?auto_6781 ) ) ( not ( = ?auto_6767 ?auto_6774 ) ) ( not ( = ?auto_6767 ?auto_6778 ) ) ( not ( = ?auto_6767 ?auto_6776 ) ) ( not ( = ?auto_6771 ?auto_6781 ) ) ( not ( = ?auto_6771 ?auto_6774 ) ) ( not ( = ?auto_6771 ?auto_6778 ) ) ( not ( = ?auto_6771 ?auto_6776 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_6762 ?auto_6763 ?auto_6764 ?auto_6765 ?auto_6766 )
      ( MAKE-1CRATE ?auto_6766 ?auto_6767 )
      ( MAKE-5CRATE-VERIFY ?auto_6762 ?auto_6763 ?auto_6764 ?auto_6765 ?auto_6766 ?auto_6767 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6784 - SURFACE
      ?auto_6785 - SURFACE
    )
    :vars
    (
      ?auto_6786 - HOIST
      ?auto_6787 - PLACE
      ?auto_6789 - PLACE
      ?auto_6790 - HOIST
      ?auto_6791 - SURFACE
      ?auto_6788 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6786 ?auto_6787 ) ( SURFACE-AT ?auto_6784 ?auto_6787 ) ( CLEAR ?auto_6784 ) ( IS-CRATE ?auto_6785 ) ( AVAILABLE ?auto_6786 ) ( not ( = ?auto_6789 ?auto_6787 ) ) ( HOIST-AT ?auto_6790 ?auto_6789 ) ( AVAILABLE ?auto_6790 ) ( SURFACE-AT ?auto_6785 ?auto_6789 ) ( ON ?auto_6785 ?auto_6791 ) ( CLEAR ?auto_6785 ) ( TRUCK-AT ?auto_6788 ?auto_6787 ) ( not ( = ?auto_6784 ?auto_6785 ) ) ( not ( = ?auto_6784 ?auto_6791 ) ) ( not ( = ?auto_6785 ?auto_6791 ) ) ( not ( = ?auto_6786 ?auto_6790 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6788 ?auto_6787 ?auto_6789 )
      ( !LIFT ?auto_6790 ?auto_6785 ?auto_6791 ?auto_6789 )
      ( !LOAD ?auto_6790 ?auto_6785 ?auto_6788 ?auto_6789 )
      ( !DRIVE ?auto_6788 ?auto_6789 ?auto_6787 )
      ( !UNLOAD ?auto_6786 ?auto_6785 ?auto_6788 ?auto_6787 )
      ( !DROP ?auto_6786 ?auto_6785 ?auto_6784 ?auto_6787 )
      ( MAKE-1CRATE-VERIFY ?auto_6784 ?auto_6785 ) )
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
      ?auto_6807 - PLACE
      ?auto_6808 - HOIST
      ?auto_6806 - SURFACE
      ?auto_6816 - PLACE
      ?auto_6822 - HOIST
      ?auto_6812 - SURFACE
      ?auto_6817 - PLACE
      ?auto_6821 - HOIST
      ?auto_6815 - SURFACE
      ?auto_6820 - SURFACE
      ?auto_6818 - PLACE
      ?auto_6813 - HOIST
      ?auto_6819 - SURFACE
      ?auto_6814 - SURFACE
      ?auto_6810 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6809 ?auto_6811 ) ( IS-CRATE ?auto_6805 ) ( not ( = ?auto_6807 ?auto_6811 ) ) ( HOIST-AT ?auto_6808 ?auto_6807 ) ( AVAILABLE ?auto_6808 ) ( SURFACE-AT ?auto_6805 ?auto_6807 ) ( ON ?auto_6805 ?auto_6806 ) ( CLEAR ?auto_6805 ) ( not ( = ?auto_6804 ?auto_6805 ) ) ( not ( = ?auto_6804 ?auto_6806 ) ) ( not ( = ?auto_6805 ?auto_6806 ) ) ( not ( = ?auto_6809 ?auto_6808 ) ) ( IS-CRATE ?auto_6804 ) ( not ( = ?auto_6816 ?auto_6811 ) ) ( HOIST-AT ?auto_6822 ?auto_6816 ) ( SURFACE-AT ?auto_6804 ?auto_6816 ) ( ON ?auto_6804 ?auto_6812 ) ( CLEAR ?auto_6804 ) ( not ( = ?auto_6803 ?auto_6804 ) ) ( not ( = ?auto_6803 ?auto_6812 ) ) ( not ( = ?auto_6804 ?auto_6812 ) ) ( not ( = ?auto_6809 ?auto_6822 ) ) ( IS-CRATE ?auto_6803 ) ( not ( = ?auto_6817 ?auto_6811 ) ) ( HOIST-AT ?auto_6821 ?auto_6817 ) ( SURFACE-AT ?auto_6803 ?auto_6817 ) ( ON ?auto_6803 ?auto_6815 ) ( CLEAR ?auto_6803 ) ( not ( = ?auto_6802 ?auto_6803 ) ) ( not ( = ?auto_6802 ?auto_6815 ) ) ( not ( = ?auto_6803 ?auto_6815 ) ) ( not ( = ?auto_6809 ?auto_6821 ) ) ( IS-CRATE ?auto_6802 ) ( AVAILABLE ?auto_6821 ) ( SURFACE-AT ?auto_6802 ?auto_6817 ) ( ON ?auto_6802 ?auto_6820 ) ( CLEAR ?auto_6802 ) ( not ( = ?auto_6801 ?auto_6802 ) ) ( not ( = ?auto_6801 ?auto_6820 ) ) ( not ( = ?auto_6802 ?auto_6820 ) ) ( IS-CRATE ?auto_6801 ) ( not ( = ?auto_6818 ?auto_6811 ) ) ( HOIST-AT ?auto_6813 ?auto_6818 ) ( AVAILABLE ?auto_6813 ) ( SURFACE-AT ?auto_6801 ?auto_6818 ) ( ON ?auto_6801 ?auto_6819 ) ( CLEAR ?auto_6801 ) ( not ( = ?auto_6800 ?auto_6801 ) ) ( not ( = ?auto_6800 ?auto_6819 ) ) ( not ( = ?auto_6801 ?auto_6819 ) ) ( not ( = ?auto_6809 ?auto_6813 ) ) ( SURFACE-AT ?auto_6799 ?auto_6811 ) ( CLEAR ?auto_6799 ) ( IS-CRATE ?auto_6800 ) ( AVAILABLE ?auto_6809 ) ( AVAILABLE ?auto_6822 ) ( SURFACE-AT ?auto_6800 ?auto_6816 ) ( ON ?auto_6800 ?auto_6814 ) ( CLEAR ?auto_6800 ) ( TRUCK-AT ?auto_6810 ?auto_6811 ) ( not ( = ?auto_6799 ?auto_6800 ) ) ( not ( = ?auto_6799 ?auto_6814 ) ) ( not ( = ?auto_6800 ?auto_6814 ) ) ( not ( = ?auto_6799 ?auto_6801 ) ) ( not ( = ?auto_6799 ?auto_6819 ) ) ( not ( = ?auto_6801 ?auto_6814 ) ) ( not ( = ?auto_6818 ?auto_6816 ) ) ( not ( = ?auto_6813 ?auto_6822 ) ) ( not ( = ?auto_6819 ?auto_6814 ) ) ( not ( = ?auto_6799 ?auto_6802 ) ) ( not ( = ?auto_6799 ?auto_6820 ) ) ( not ( = ?auto_6800 ?auto_6802 ) ) ( not ( = ?auto_6800 ?auto_6820 ) ) ( not ( = ?auto_6802 ?auto_6819 ) ) ( not ( = ?auto_6802 ?auto_6814 ) ) ( not ( = ?auto_6817 ?auto_6818 ) ) ( not ( = ?auto_6817 ?auto_6816 ) ) ( not ( = ?auto_6821 ?auto_6813 ) ) ( not ( = ?auto_6821 ?auto_6822 ) ) ( not ( = ?auto_6820 ?auto_6819 ) ) ( not ( = ?auto_6820 ?auto_6814 ) ) ( not ( = ?auto_6799 ?auto_6803 ) ) ( not ( = ?auto_6799 ?auto_6815 ) ) ( not ( = ?auto_6800 ?auto_6803 ) ) ( not ( = ?auto_6800 ?auto_6815 ) ) ( not ( = ?auto_6801 ?auto_6803 ) ) ( not ( = ?auto_6801 ?auto_6815 ) ) ( not ( = ?auto_6803 ?auto_6820 ) ) ( not ( = ?auto_6803 ?auto_6819 ) ) ( not ( = ?auto_6803 ?auto_6814 ) ) ( not ( = ?auto_6815 ?auto_6820 ) ) ( not ( = ?auto_6815 ?auto_6819 ) ) ( not ( = ?auto_6815 ?auto_6814 ) ) ( not ( = ?auto_6799 ?auto_6804 ) ) ( not ( = ?auto_6799 ?auto_6812 ) ) ( not ( = ?auto_6800 ?auto_6804 ) ) ( not ( = ?auto_6800 ?auto_6812 ) ) ( not ( = ?auto_6801 ?auto_6804 ) ) ( not ( = ?auto_6801 ?auto_6812 ) ) ( not ( = ?auto_6802 ?auto_6804 ) ) ( not ( = ?auto_6802 ?auto_6812 ) ) ( not ( = ?auto_6804 ?auto_6815 ) ) ( not ( = ?auto_6804 ?auto_6820 ) ) ( not ( = ?auto_6804 ?auto_6819 ) ) ( not ( = ?auto_6804 ?auto_6814 ) ) ( not ( = ?auto_6812 ?auto_6815 ) ) ( not ( = ?auto_6812 ?auto_6820 ) ) ( not ( = ?auto_6812 ?auto_6819 ) ) ( not ( = ?auto_6812 ?auto_6814 ) ) ( not ( = ?auto_6799 ?auto_6805 ) ) ( not ( = ?auto_6799 ?auto_6806 ) ) ( not ( = ?auto_6800 ?auto_6805 ) ) ( not ( = ?auto_6800 ?auto_6806 ) ) ( not ( = ?auto_6801 ?auto_6805 ) ) ( not ( = ?auto_6801 ?auto_6806 ) ) ( not ( = ?auto_6802 ?auto_6805 ) ) ( not ( = ?auto_6802 ?auto_6806 ) ) ( not ( = ?auto_6803 ?auto_6805 ) ) ( not ( = ?auto_6803 ?auto_6806 ) ) ( not ( = ?auto_6805 ?auto_6812 ) ) ( not ( = ?auto_6805 ?auto_6815 ) ) ( not ( = ?auto_6805 ?auto_6820 ) ) ( not ( = ?auto_6805 ?auto_6819 ) ) ( not ( = ?auto_6805 ?auto_6814 ) ) ( not ( = ?auto_6807 ?auto_6816 ) ) ( not ( = ?auto_6807 ?auto_6817 ) ) ( not ( = ?auto_6807 ?auto_6818 ) ) ( not ( = ?auto_6808 ?auto_6822 ) ) ( not ( = ?auto_6808 ?auto_6821 ) ) ( not ( = ?auto_6808 ?auto_6813 ) ) ( not ( = ?auto_6806 ?auto_6812 ) ) ( not ( = ?auto_6806 ?auto_6815 ) ) ( not ( = ?auto_6806 ?auto_6820 ) ) ( not ( = ?auto_6806 ?auto_6819 ) ) ( not ( = ?auto_6806 ?auto_6814 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_6799 ?auto_6800 ?auto_6801 ?auto_6802 ?auto_6803 ?auto_6804 )
      ( MAKE-1CRATE ?auto_6804 ?auto_6805 )
      ( MAKE-6CRATE-VERIFY ?auto_6799 ?auto_6800 ?auto_6801 ?auto_6802 ?auto_6803 ?auto_6804 ?auto_6805 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6825 - SURFACE
      ?auto_6826 - SURFACE
    )
    :vars
    (
      ?auto_6827 - HOIST
      ?auto_6828 - PLACE
      ?auto_6830 - PLACE
      ?auto_6831 - HOIST
      ?auto_6832 - SURFACE
      ?auto_6829 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6827 ?auto_6828 ) ( SURFACE-AT ?auto_6825 ?auto_6828 ) ( CLEAR ?auto_6825 ) ( IS-CRATE ?auto_6826 ) ( AVAILABLE ?auto_6827 ) ( not ( = ?auto_6830 ?auto_6828 ) ) ( HOIST-AT ?auto_6831 ?auto_6830 ) ( AVAILABLE ?auto_6831 ) ( SURFACE-AT ?auto_6826 ?auto_6830 ) ( ON ?auto_6826 ?auto_6832 ) ( CLEAR ?auto_6826 ) ( TRUCK-AT ?auto_6829 ?auto_6828 ) ( not ( = ?auto_6825 ?auto_6826 ) ) ( not ( = ?auto_6825 ?auto_6832 ) ) ( not ( = ?auto_6826 ?auto_6832 ) ) ( not ( = ?auto_6827 ?auto_6831 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6829 ?auto_6828 ?auto_6830 )
      ( !LIFT ?auto_6831 ?auto_6826 ?auto_6832 ?auto_6830 )
      ( !LOAD ?auto_6831 ?auto_6826 ?auto_6829 ?auto_6830 )
      ( !DRIVE ?auto_6829 ?auto_6830 ?auto_6828 )
      ( !UNLOAD ?auto_6827 ?auto_6826 ?auto_6829 ?auto_6828 )
      ( !DROP ?auto_6827 ?auto_6826 ?auto_6825 ?auto_6828 )
      ( MAKE-1CRATE-VERIFY ?auto_6825 ?auto_6826 ) )
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
      ?auto_6848 - SURFACE
      ?auto_6847 - SURFACE
    )
    :vars
    (
      ?auto_6852 - HOIST
      ?auto_6850 - PLACE
      ?auto_6851 - PLACE
      ?auto_6853 - HOIST
      ?auto_6854 - SURFACE
      ?auto_6867 - PLACE
      ?auto_6857 - HOIST
      ?auto_6856 - SURFACE
      ?auto_6865 - PLACE
      ?auto_6860 - HOIST
      ?auto_6855 - SURFACE
      ?auto_6864 - PLACE
      ?auto_6861 - HOIST
      ?auto_6858 - SURFACE
      ?auto_6859 - SURFACE
      ?auto_6863 - PLACE
      ?auto_6868 - HOIST
      ?auto_6862 - SURFACE
      ?auto_6866 - SURFACE
      ?auto_6849 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6852 ?auto_6850 ) ( IS-CRATE ?auto_6847 ) ( not ( = ?auto_6851 ?auto_6850 ) ) ( HOIST-AT ?auto_6853 ?auto_6851 ) ( AVAILABLE ?auto_6853 ) ( SURFACE-AT ?auto_6847 ?auto_6851 ) ( ON ?auto_6847 ?auto_6854 ) ( CLEAR ?auto_6847 ) ( not ( = ?auto_6848 ?auto_6847 ) ) ( not ( = ?auto_6848 ?auto_6854 ) ) ( not ( = ?auto_6847 ?auto_6854 ) ) ( not ( = ?auto_6852 ?auto_6853 ) ) ( IS-CRATE ?auto_6848 ) ( not ( = ?auto_6867 ?auto_6850 ) ) ( HOIST-AT ?auto_6857 ?auto_6867 ) ( AVAILABLE ?auto_6857 ) ( SURFACE-AT ?auto_6848 ?auto_6867 ) ( ON ?auto_6848 ?auto_6856 ) ( CLEAR ?auto_6848 ) ( not ( = ?auto_6846 ?auto_6848 ) ) ( not ( = ?auto_6846 ?auto_6856 ) ) ( not ( = ?auto_6848 ?auto_6856 ) ) ( not ( = ?auto_6852 ?auto_6857 ) ) ( IS-CRATE ?auto_6846 ) ( not ( = ?auto_6865 ?auto_6850 ) ) ( HOIST-AT ?auto_6860 ?auto_6865 ) ( SURFACE-AT ?auto_6846 ?auto_6865 ) ( ON ?auto_6846 ?auto_6855 ) ( CLEAR ?auto_6846 ) ( not ( = ?auto_6845 ?auto_6846 ) ) ( not ( = ?auto_6845 ?auto_6855 ) ) ( not ( = ?auto_6846 ?auto_6855 ) ) ( not ( = ?auto_6852 ?auto_6860 ) ) ( IS-CRATE ?auto_6845 ) ( not ( = ?auto_6864 ?auto_6850 ) ) ( HOIST-AT ?auto_6861 ?auto_6864 ) ( SURFACE-AT ?auto_6845 ?auto_6864 ) ( ON ?auto_6845 ?auto_6858 ) ( CLEAR ?auto_6845 ) ( not ( = ?auto_6844 ?auto_6845 ) ) ( not ( = ?auto_6844 ?auto_6858 ) ) ( not ( = ?auto_6845 ?auto_6858 ) ) ( not ( = ?auto_6852 ?auto_6861 ) ) ( IS-CRATE ?auto_6844 ) ( AVAILABLE ?auto_6861 ) ( SURFACE-AT ?auto_6844 ?auto_6864 ) ( ON ?auto_6844 ?auto_6859 ) ( CLEAR ?auto_6844 ) ( not ( = ?auto_6843 ?auto_6844 ) ) ( not ( = ?auto_6843 ?auto_6859 ) ) ( not ( = ?auto_6844 ?auto_6859 ) ) ( IS-CRATE ?auto_6843 ) ( not ( = ?auto_6863 ?auto_6850 ) ) ( HOIST-AT ?auto_6868 ?auto_6863 ) ( AVAILABLE ?auto_6868 ) ( SURFACE-AT ?auto_6843 ?auto_6863 ) ( ON ?auto_6843 ?auto_6862 ) ( CLEAR ?auto_6843 ) ( not ( = ?auto_6842 ?auto_6843 ) ) ( not ( = ?auto_6842 ?auto_6862 ) ) ( not ( = ?auto_6843 ?auto_6862 ) ) ( not ( = ?auto_6852 ?auto_6868 ) ) ( SURFACE-AT ?auto_6841 ?auto_6850 ) ( CLEAR ?auto_6841 ) ( IS-CRATE ?auto_6842 ) ( AVAILABLE ?auto_6852 ) ( AVAILABLE ?auto_6860 ) ( SURFACE-AT ?auto_6842 ?auto_6865 ) ( ON ?auto_6842 ?auto_6866 ) ( CLEAR ?auto_6842 ) ( TRUCK-AT ?auto_6849 ?auto_6850 ) ( not ( = ?auto_6841 ?auto_6842 ) ) ( not ( = ?auto_6841 ?auto_6866 ) ) ( not ( = ?auto_6842 ?auto_6866 ) ) ( not ( = ?auto_6841 ?auto_6843 ) ) ( not ( = ?auto_6841 ?auto_6862 ) ) ( not ( = ?auto_6843 ?auto_6866 ) ) ( not ( = ?auto_6863 ?auto_6865 ) ) ( not ( = ?auto_6868 ?auto_6860 ) ) ( not ( = ?auto_6862 ?auto_6866 ) ) ( not ( = ?auto_6841 ?auto_6844 ) ) ( not ( = ?auto_6841 ?auto_6859 ) ) ( not ( = ?auto_6842 ?auto_6844 ) ) ( not ( = ?auto_6842 ?auto_6859 ) ) ( not ( = ?auto_6844 ?auto_6862 ) ) ( not ( = ?auto_6844 ?auto_6866 ) ) ( not ( = ?auto_6864 ?auto_6863 ) ) ( not ( = ?auto_6864 ?auto_6865 ) ) ( not ( = ?auto_6861 ?auto_6868 ) ) ( not ( = ?auto_6861 ?auto_6860 ) ) ( not ( = ?auto_6859 ?auto_6862 ) ) ( not ( = ?auto_6859 ?auto_6866 ) ) ( not ( = ?auto_6841 ?auto_6845 ) ) ( not ( = ?auto_6841 ?auto_6858 ) ) ( not ( = ?auto_6842 ?auto_6845 ) ) ( not ( = ?auto_6842 ?auto_6858 ) ) ( not ( = ?auto_6843 ?auto_6845 ) ) ( not ( = ?auto_6843 ?auto_6858 ) ) ( not ( = ?auto_6845 ?auto_6859 ) ) ( not ( = ?auto_6845 ?auto_6862 ) ) ( not ( = ?auto_6845 ?auto_6866 ) ) ( not ( = ?auto_6858 ?auto_6859 ) ) ( not ( = ?auto_6858 ?auto_6862 ) ) ( not ( = ?auto_6858 ?auto_6866 ) ) ( not ( = ?auto_6841 ?auto_6846 ) ) ( not ( = ?auto_6841 ?auto_6855 ) ) ( not ( = ?auto_6842 ?auto_6846 ) ) ( not ( = ?auto_6842 ?auto_6855 ) ) ( not ( = ?auto_6843 ?auto_6846 ) ) ( not ( = ?auto_6843 ?auto_6855 ) ) ( not ( = ?auto_6844 ?auto_6846 ) ) ( not ( = ?auto_6844 ?auto_6855 ) ) ( not ( = ?auto_6846 ?auto_6858 ) ) ( not ( = ?auto_6846 ?auto_6859 ) ) ( not ( = ?auto_6846 ?auto_6862 ) ) ( not ( = ?auto_6846 ?auto_6866 ) ) ( not ( = ?auto_6855 ?auto_6858 ) ) ( not ( = ?auto_6855 ?auto_6859 ) ) ( not ( = ?auto_6855 ?auto_6862 ) ) ( not ( = ?auto_6855 ?auto_6866 ) ) ( not ( = ?auto_6841 ?auto_6848 ) ) ( not ( = ?auto_6841 ?auto_6856 ) ) ( not ( = ?auto_6842 ?auto_6848 ) ) ( not ( = ?auto_6842 ?auto_6856 ) ) ( not ( = ?auto_6843 ?auto_6848 ) ) ( not ( = ?auto_6843 ?auto_6856 ) ) ( not ( = ?auto_6844 ?auto_6848 ) ) ( not ( = ?auto_6844 ?auto_6856 ) ) ( not ( = ?auto_6845 ?auto_6848 ) ) ( not ( = ?auto_6845 ?auto_6856 ) ) ( not ( = ?auto_6848 ?auto_6855 ) ) ( not ( = ?auto_6848 ?auto_6858 ) ) ( not ( = ?auto_6848 ?auto_6859 ) ) ( not ( = ?auto_6848 ?auto_6862 ) ) ( not ( = ?auto_6848 ?auto_6866 ) ) ( not ( = ?auto_6867 ?auto_6865 ) ) ( not ( = ?auto_6867 ?auto_6864 ) ) ( not ( = ?auto_6867 ?auto_6863 ) ) ( not ( = ?auto_6857 ?auto_6860 ) ) ( not ( = ?auto_6857 ?auto_6861 ) ) ( not ( = ?auto_6857 ?auto_6868 ) ) ( not ( = ?auto_6856 ?auto_6855 ) ) ( not ( = ?auto_6856 ?auto_6858 ) ) ( not ( = ?auto_6856 ?auto_6859 ) ) ( not ( = ?auto_6856 ?auto_6862 ) ) ( not ( = ?auto_6856 ?auto_6866 ) ) ( not ( = ?auto_6841 ?auto_6847 ) ) ( not ( = ?auto_6841 ?auto_6854 ) ) ( not ( = ?auto_6842 ?auto_6847 ) ) ( not ( = ?auto_6842 ?auto_6854 ) ) ( not ( = ?auto_6843 ?auto_6847 ) ) ( not ( = ?auto_6843 ?auto_6854 ) ) ( not ( = ?auto_6844 ?auto_6847 ) ) ( not ( = ?auto_6844 ?auto_6854 ) ) ( not ( = ?auto_6845 ?auto_6847 ) ) ( not ( = ?auto_6845 ?auto_6854 ) ) ( not ( = ?auto_6846 ?auto_6847 ) ) ( not ( = ?auto_6846 ?auto_6854 ) ) ( not ( = ?auto_6847 ?auto_6856 ) ) ( not ( = ?auto_6847 ?auto_6855 ) ) ( not ( = ?auto_6847 ?auto_6858 ) ) ( not ( = ?auto_6847 ?auto_6859 ) ) ( not ( = ?auto_6847 ?auto_6862 ) ) ( not ( = ?auto_6847 ?auto_6866 ) ) ( not ( = ?auto_6851 ?auto_6867 ) ) ( not ( = ?auto_6851 ?auto_6865 ) ) ( not ( = ?auto_6851 ?auto_6864 ) ) ( not ( = ?auto_6851 ?auto_6863 ) ) ( not ( = ?auto_6853 ?auto_6857 ) ) ( not ( = ?auto_6853 ?auto_6860 ) ) ( not ( = ?auto_6853 ?auto_6861 ) ) ( not ( = ?auto_6853 ?auto_6868 ) ) ( not ( = ?auto_6854 ?auto_6856 ) ) ( not ( = ?auto_6854 ?auto_6855 ) ) ( not ( = ?auto_6854 ?auto_6858 ) ) ( not ( = ?auto_6854 ?auto_6859 ) ) ( not ( = ?auto_6854 ?auto_6862 ) ) ( not ( = ?auto_6854 ?auto_6866 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_6841 ?auto_6842 ?auto_6843 ?auto_6844 ?auto_6845 ?auto_6846 ?auto_6848 )
      ( MAKE-1CRATE ?auto_6848 ?auto_6847 )
      ( MAKE-7CRATE-VERIFY ?auto_6841 ?auto_6842 ?auto_6843 ?auto_6844 ?auto_6845 ?auto_6846 ?auto_6848 ?auto_6847 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6871 - SURFACE
      ?auto_6872 - SURFACE
    )
    :vars
    (
      ?auto_6873 - HOIST
      ?auto_6874 - PLACE
      ?auto_6876 - PLACE
      ?auto_6877 - HOIST
      ?auto_6878 - SURFACE
      ?auto_6875 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6873 ?auto_6874 ) ( SURFACE-AT ?auto_6871 ?auto_6874 ) ( CLEAR ?auto_6871 ) ( IS-CRATE ?auto_6872 ) ( AVAILABLE ?auto_6873 ) ( not ( = ?auto_6876 ?auto_6874 ) ) ( HOIST-AT ?auto_6877 ?auto_6876 ) ( AVAILABLE ?auto_6877 ) ( SURFACE-AT ?auto_6872 ?auto_6876 ) ( ON ?auto_6872 ?auto_6878 ) ( CLEAR ?auto_6872 ) ( TRUCK-AT ?auto_6875 ?auto_6874 ) ( not ( = ?auto_6871 ?auto_6872 ) ) ( not ( = ?auto_6871 ?auto_6878 ) ) ( not ( = ?auto_6872 ?auto_6878 ) ) ( not ( = ?auto_6873 ?auto_6877 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6875 ?auto_6874 ?auto_6876 )
      ( !LIFT ?auto_6877 ?auto_6872 ?auto_6878 ?auto_6876 )
      ( !LOAD ?auto_6877 ?auto_6872 ?auto_6875 ?auto_6876 )
      ( !DRIVE ?auto_6875 ?auto_6876 ?auto_6874 )
      ( !UNLOAD ?auto_6873 ?auto_6872 ?auto_6875 ?auto_6874 )
      ( !DROP ?auto_6873 ?auto_6872 ?auto_6871 ?auto_6874 )
      ( MAKE-1CRATE-VERIFY ?auto_6871 ?auto_6872 ) )
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
      ?auto_6896 - SURFACE
      ?auto_6895 - SURFACE
      ?auto_6894 - SURFACE
    )
    :vars
    (
      ?auto_6899 - HOIST
      ?auto_6898 - PLACE
      ?auto_6900 - PLACE
      ?auto_6897 - HOIST
      ?auto_6901 - SURFACE
      ?auto_6919 - PLACE
      ?auto_6915 - HOIST
      ?auto_6916 - SURFACE
      ?auto_6909 - PLACE
      ?auto_6903 - HOIST
      ?auto_6918 - SURFACE
      ?auto_6906 - PLACE
      ?auto_6913 - HOIST
      ?auto_6904 - SURFACE
      ?auto_6907 - PLACE
      ?auto_6912 - HOIST
      ?auto_6917 - SURFACE
      ?auto_6914 - SURFACE
      ?auto_6905 - PLACE
      ?auto_6910 - HOIST
      ?auto_6911 - SURFACE
      ?auto_6908 - SURFACE
      ?auto_6902 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6899 ?auto_6898 ) ( IS-CRATE ?auto_6894 ) ( not ( = ?auto_6900 ?auto_6898 ) ) ( HOIST-AT ?auto_6897 ?auto_6900 ) ( AVAILABLE ?auto_6897 ) ( SURFACE-AT ?auto_6894 ?auto_6900 ) ( ON ?auto_6894 ?auto_6901 ) ( CLEAR ?auto_6894 ) ( not ( = ?auto_6895 ?auto_6894 ) ) ( not ( = ?auto_6895 ?auto_6901 ) ) ( not ( = ?auto_6894 ?auto_6901 ) ) ( not ( = ?auto_6899 ?auto_6897 ) ) ( IS-CRATE ?auto_6895 ) ( not ( = ?auto_6919 ?auto_6898 ) ) ( HOIST-AT ?auto_6915 ?auto_6919 ) ( AVAILABLE ?auto_6915 ) ( SURFACE-AT ?auto_6895 ?auto_6919 ) ( ON ?auto_6895 ?auto_6916 ) ( CLEAR ?auto_6895 ) ( not ( = ?auto_6896 ?auto_6895 ) ) ( not ( = ?auto_6896 ?auto_6916 ) ) ( not ( = ?auto_6895 ?auto_6916 ) ) ( not ( = ?auto_6899 ?auto_6915 ) ) ( IS-CRATE ?auto_6896 ) ( not ( = ?auto_6909 ?auto_6898 ) ) ( HOIST-AT ?auto_6903 ?auto_6909 ) ( AVAILABLE ?auto_6903 ) ( SURFACE-AT ?auto_6896 ?auto_6909 ) ( ON ?auto_6896 ?auto_6918 ) ( CLEAR ?auto_6896 ) ( not ( = ?auto_6893 ?auto_6896 ) ) ( not ( = ?auto_6893 ?auto_6918 ) ) ( not ( = ?auto_6896 ?auto_6918 ) ) ( not ( = ?auto_6899 ?auto_6903 ) ) ( IS-CRATE ?auto_6893 ) ( not ( = ?auto_6906 ?auto_6898 ) ) ( HOIST-AT ?auto_6913 ?auto_6906 ) ( SURFACE-AT ?auto_6893 ?auto_6906 ) ( ON ?auto_6893 ?auto_6904 ) ( CLEAR ?auto_6893 ) ( not ( = ?auto_6892 ?auto_6893 ) ) ( not ( = ?auto_6892 ?auto_6904 ) ) ( not ( = ?auto_6893 ?auto_6904 ) ) ( not ( = ?auto_6899 ?auto_6913 ) ) ( IS-CRATE ?auto_6892 ) ( not ( = ?auto_6907 ?auto_6898 ) ) ( HOIST-AT ?auto_6912 ?auto_6907 ) ( SURFACE-AT ?auto_6892 ?auto_6907 ) ( ON ?auto_6892 ?auto_6917 ) ( CLEAR ?auto_6892 ) ( not ( = ?auto_6891 ?auto_6892 ) ) ( not ( = ?auto_6891 ?auto_6917 ) ) ( not ( = ?auto_6892 ?auto_6917 ) ) ( not ( = ?auto_6899 ?auto_6912 ) ) ( IS-CRATE ?auto_6891 ) ( AVAILABLE ?auto_6912 ) ( SURFACE-AT ?auto_6891 ?auto_6907 ) ( ON ?auto_6891 ?auto_6914 ) ( CLEAR ?auto_6891 ) ( not ( = ?auto_6890 ?auto_6891 ) ) ( not ( = ?auto_6890 ?auto_6914 ) ) ( not ( = ?auto_6891 ?auto_6914 ) ) ( IS-CRATE ?auto_6890 ) ( not ( = ?auto_6905 ?auto_6898 ) ) ( HOIST-AT ?auto_6910 ?auto_6905 ) ( AVAILABLE ?auto_6910 ) ( SURFACE-AT ?auto_6890 ?auto_6905 ) ( ON ?auto_6890 ?auto_6911 ) ( CLEAR ?auto_6890 ) ( not ( = ?auto_6889 ?auto_6890 ) ) ( not ( = ?auto_6889 ?auto_6911 ) ) ( not ( = ?auto_6890 ?auto_6911 ) ) ( not ( = ?auto_6899 ?auto_6910 ) ) ( SURFACE-AT ?auto_6888 ?auto_6898 ) ( CLEAR ?auto_6888 ) ( IS-CRATE ?auto_6889 ) ( AVAILABLE ?auto_6899 ) ( AVAILABLE ?auto_6913 ) ( SURFACE-AT ?auto_6889 ?auto_6906 ) ( ON ?auto_6889 ?auto_6908 ) ( CLEAR ?auto_6889 ) ( TRUCK-AT ?auto_6902 ?auto_6898 ) ( not ( = ?auto_6888 ?auto_6889 ) ) ( not ( = ?auto_6888 ?auto_6908 ) ) ( not ( = ?auto_6889 ?auto_6908 ) ) ( not ( = ?auto_6888 ?auto_6890 ) ) ( not ( = ?auto_6888 ?auto_6911 ) ) ( not ( = ?auto_6890 ?auto_6908 ) ) ( not ( = ?auto_6905 ?auto_6906 ) ) ( not ( = ?auto_6910 ?auto_6913 ) ) ( not ( = ?auto_6911 ?auto_6908 ) ) ( not ( = ?auto_6888 ?auto_6891 ) ) ( not ( = ?auto_6888 ?auto_6914 ) ) ( not ( = ?auto_6889 ?auto_6891 ) ) ( not ( = ?auto_6889 ?auto_6914 ) ) ( not ( = ?auto_6891 ?auto_6911 ) ) ( not ( = ?auto_6891 ?auto_6908 ) ) ( not ( = ?auto_6907 ?auto_6905 ) ) ( not ( = ?auto_6907 ?auto_6906 ) ) ( not ( = ?auto_6912 ?auto_6910 ) ) ( not ( = ?auto_6912 ?auto_6913 ) ) ( not ( = ?auto_6914 ?auto_6911 ) ) ( not ( = ?auto_6914 ?auto_6908 ) ) ( not ( = ?auto_6888 ?auto_6892 ) ) ( not ( = ?auto_6888 ?auto_6917 ) ) ( not ( = ?auto_6889 ?auto_6892 ) ) ( not ( = ?auto_6889 ?auto_6917 ) ) ( not ( = ?auto_6890 ?auto_6892 ) ) ( not ( = ?auto_6890 ?auto_6917 ) ) ( not ( = ?auto_6892 ?auto_6914 ) ) ( not ( = ?auto_6892 ?auto_6911 ) ) ( not ( = ?auto_6892 ?auto_6908 ) ) ( not ( = ?auto_6917 ?auto_6914 ) ) ( not ( = ?auto_6917 ?auto_6911 ) ) ( not ( = ?auto_6917 ?auto_6908 ) ) ( not ( = ?auto_6888 ?auto_6893 ) ) ( not ( = ?auto_6888 ?auto_6904 ) ) ( not ( = ?auto_6889 ?auto_6893 ) ) ( not ( = ?auto_6889 ?auto_6904 ) ) ( not ( = ?auto_6890 ?auto_6893 ) ) ( not ( = ?auto_6890 ?auto_6904 ) ) ( not ( = ?auto_6891 ?auto_6893 ) ) ( not ( = ?auto_6891 ?auto_6904 ) ) ( not ( = ?auto_6893 ?auto_6917 ) ) ( not ( = ?auto_6893 ?auto_6914 ) ) ( not ( = ?auto_6893 ?auto_6911 ) ) ( not ( = ?auto_6893 ?auto_6908 ) ) ( not ( = ?auto_6904 ?auto_6917 ) ) ( not ( = ?auto_6904 ?auto_6914 ) ) ( not ( = ?auto_6904 ?auto_6911 ) ) ( not ( = ?auto_6904 ?auto_6908 ) ) ( not ( = ?auto_6888 ?auto_6896 ) ) ( not ( = ?auto_6888 ?auto_6918 ) ) ( not ( = ?auto_6889 ?auto_6896 ) ) ( not ( = ?auto_6889 ?auto_6918 ) ) ( not ( = ?auto_6890 ?auto_6896 ) ) ( not ( = ?auto_6890 ?auto_6918 ) ) ( not ( = ?auto_6891 ?auto_6896 ) ) ( not ( = ?auto_6891 ?auto_6918 ) ) ( not ( = ?auto_6892 ?auto_6896 ) ) ( not ( = ?auto_6892 ?auto_6918 ) ) ( not ( = ?auto_6896 ?auto_6904 ) ) ( not ( = ?auto_6896 ?auto_6917 ) ) ( not ( = ?auto_6896 ?auto_6914 ) ) ( not ( = ?auto_6896 ?auto_6911 ) ) ( not ( = ?auto_6896 ?auto_6908 ) ) ( not ( = ?auto_6909 ?auto_6906 ) ) ( not ( = ?auto_6909 ?auto_6907 ) ) ( not ( = ?auto_6909 ?auto_6905 ) ) ( not ( = ?auto_6903 ?auto_6913 ) ) ( not ( = ?auto_6903 ?auto_6912 ) ) ( not ( = ?auto_6903 ?auto_6910 ) ) ( not ( = ?auto_6918 ?auto_6904 ) ) ( not ( = ?auto_6918 ?auto_6917 ) ) ( not ( = ?auto_6918 ?auto_6914 ) ) ( not ( = ?auto_6918 ?auto_6911 ) ) ( not ( = ?auto_6918 ?auto_6908 ) ) ( not ( = ?auto_6888 ?auto_6895 ) ) ( not ( = ?auto_6888 ?auto_6916 ) ) ( not ( = ?auto_6889 ?auto_6895 ) ) ( not ( = ?auto_6889 ?auto_6916 ) ) ( not ( = ?auto_6890 ?auto_6895 ) ) ( not ( = ?auto_6890 ?auto_6916 ) ) ( not ( = ?auto_6891 ?auto_6895 ) ) ( not ( = ?auto_6891 ?auto_6916 ) ) ( not ( = ?auto_6892 ?auto_6895 ) ) ( not ( = ?auto_6892 ?auto_6916 ) ) ( not ( = ?auto_6893 ?auto_6895 ) ) ( not ( = ?auto_6893 ?auto_6916 ) ) ( not ( = ?auto_6895 ?auto_6918 ) ) ( not ( = ?auto_6895 ?auto_6904 ) ) ( not ( = ?auto_6895 ?auto_6917 ) ) ( not ( = ?auto_6895 ?auto_6914 ) ) ( not ( = ?auto_6895 ?auto_6911 ) ) ( not ( = ?auto_6895 ?auto_6908 ) ) ( not ( = ?auto_6919 ?auto_6909 ) ) ( not ( = ?auto_6919 ?auto_6906 ) ) ( not ( = ?auto_6919 ?auto_6907 ) ) ( not ( = ?auto_6919 ?auto_6905 ) ) ( not ( = ?auto_6915 ?auto_6903 ) ) ( not ( = ?auto_6915 ?auto_6913 ) ) ( not ( = ?auto_6915 ?auto_6912 ) ) ( not ( = ?auto_6915 ?auto_6910 ) ) ( not ( = ?auto_6916 ?auto_6918 ) ) ( not ( = ?auto_6916 ?auto_6904 ) ) ( not ( = ?auto_6916 ?auto_6917 ) ) ( not ( = ?auto_6916 ?auto_6914 ) ) ( not ( = ?auto_6916 ?auto_6911 ) ) ( not ( = ?auto_6916 ?auto_6908 ) ) ( not ( = ?auto_6888 ?auto_6894 ) ) ( not ( = ?auto_6888 ?auto_6901 ) ) ( not ( = ?auto_6889 ?auto_6894 ) ) ( not ( = ?auto_6889 ?auto_6901 ) ) ( not ( = ?auto_6890 ?auto_6894 ) ) ( not ( = ?auto_6890 ?auto_6901 ) ) ( not ( = ?auto_6891 ?auto_6894 ) ) ( not ( = ?auto_6891 ?auto_6901 ) ) ( not ( = ?auto_6892 ?auto_6894 ) ) ( not ( = ?auto_6892 ?auto_6901 ) ) ( not ( = ?auto_6893 ?auto_6894 ) ) ( not ( = ?auto_6893 ?auto_6901 ) ) ( not ( = ?auto_6896 ?auto_6894 ) ) ( not ( = ?auto_6896 ?auto_6901 ) ) ( not ( = ?auto_6894 ?auto_6916 ) ) ( not ( = ?auto_6894 ?auto_6918 ) ) ( not ( = ?auto_6894 ?auto_6904 ) ) ( not ( = ?auto_6894 ?auto_6917 ) ) ( not ( = ?auto_6894 ?auto_6914 ) ) ( not ( = ?auto_6894 ?auto_6911 ) ) ( not ( = ?auto_6894 ?auto_6908 ) ) ( not ( = ?auto_6900 ?auto_6919 ) ) ( not ( = ?auto_6900 ?auto_6909 ) ) ( not ( = ?auto_6900 ?auto_6906 ) ) ( not ( = ?auto_6900 ?auto_6907 ) ) ( not ( = ?auto_6900 ?auto_6905 ) ) ( not ( = ?auto_6897 ?auto_6915 ) ) ( not ( = ?auto_6897 ?auto_6903 ) ) ( not ( = ?auto_6897 ?auto_6913 ) ) ( not ( = ?auto_6897 ?auto_6912 ) ) ( not ( = ?auto_6897 ?auto_6910 ) ) ( not ( = ?auto_6901 ?auto_6916 ) ) ( not ( = ?auto_6901 ?auto_6918 ) ) ( not ( = ?auto_6901 ?auto_6904 ) ) ( not ( = ?auto_6901 ?auto_6917 ) ) ( not ( = ?auto_6901 ?auto_6914 ) ) ( not ( = ?auto_6901 ?auto_6911 ) ) ( not ( = ?auto_6901 ?auto_6908 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_6888 ?auto_6889 ?auto_6890 ?auto_6891 ?auto_6892 ?auto_6893 ?auto_6896 ?auto_6895 )
      ( MAKE-1CRATE ?auto_6895 ?auto_6894 )
      ( MAKE-8CRATE-VERIFY ?auto_6888 ?auto_6889 ?auto_6890 ?auto_6891 ?auto_6892 ?auto_6893 ?auto_6896 ?auto_6895 ?auto_6894 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6922 - SURFACE
      ?auto_6923 - SURFACE
    )
    :vars
    (
      ?auto_6924 - HOIST
      ?auto_6925 - PLACE
      ?auto_6927 - PLACE
      ?auto_6928 - HOIST
      ?auto_6929 - SURFACE
      ?auto_6926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6924 ?auto_6925 ) ( SURFACE-AT ?auto_6922 ?auto_6925 ) ( CLEAR ?auto_6922 ) ( IS-CRATE ?auto_6923 ) ( AVAILABLE ?auto_6924 ) ( not ( = ?auto_6927 ?auto_6925 ) ) ( HOIST-AT ?auto_6928 ?auto_6927 ) ( AVAILABLE ?auto_6928 ) ( SURFACE-AT ?auto_6923 ?auto_6927 ) ( ON ?auto_6923 ?auto_6929 ) ( CLEAR ?auto_6923 ) ( TRUCK-AT ?auto_6926 ?auto_6925 ) ( not ( = ?auto_6922 ?auto_6923 ) ) ( not ( = ?auto_6922 ?auto_6929 ) ) ( not ( = ?auto_6923 ?auto_6929 ) ) ( not ( = ?auto_6924 ?auto_6928 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6926 ?auto_6925 ?auto_6927 )
      ( !LIFT ?auto_6928 ?auto_6923 ?auto_6929 ?auto_6927 )
      ( !LOAD ?auto_6928 ?auto_6923 ?auto_6926 ?auto_6927 )
      ( !DRIVE ?auto_6926 ?auto_6927 ?auto_6925 )
      ( !UNLOAD ?auto_6924 ?auto_6923 ?auto_6926 ?auto_6925 )
      ( !DROP ?auto_6924 ?auto_6923 ?auto_6922 ?auto_6925 )
      ( MAKE-1CRATE-VERIFY ?auto_6922 ?auto_6923 ) )
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
      ?auto_6948 - SURFACE
      ?auto_6947 - SURFACE
      ?auto_6946 - SURFACE
      ?auto_6949 - SURFACE
    )
    :vars
    (
      ?auto_6954 - HOIST
      ?auto_6951 - PLACE
      ?auto_6950 - PLACE
      ?auto_6955 - HOIST
      ?auto_6952 - SURFACE
      ?auto_6957 - PLACE
      ?auto_6956 - HOIST
      ?auto_6961 - SURFACE
      ?auto_6968 - SURFACE
      ?auto_6970 - PLACE
      ?auto_6962 - HOIST
      ?auto_6963 - SURFACE
      ?auto_6973 - PLACE
      ?auto_6965 - HOIST
      ?auto_6958 - SURFACE
      ?auto_6972 - PLACE
      ?auto_6966 - HOIST
      ?auto_6959 - SURFACE
      ?auto_6967 - SURFACE
      ?auto_6960 - PLACE
      ?auto_6969 - HOIST
      ?auto_6964 - SURFACE
      ?auto_6971 - SURFACE
      ?auto_6953 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6954 ?auto_6951 ) ( IS-CRATE ?auto_6949 ) ( not ( = ?auto_6950 ?auto_6951 ) ) ( HOIST-AT ?auto_6955 ?auto_6950 ) ( SURFACE-AT ?auto_6949 ?auto_6950 ) ( ON ?auto_6949 ?auto_6952 ) ( CLEAR ?auto_6949 ) ( not ( = ?auto_6946 ?auto_6949 ) ) ( not ( = ?auto_6946 ?auto_6952 ) ) ( not ( = ?auto_6949 ?auto_6952 ) ) ( not ( = ?auto_6954 ?auto_6955 ) ) ( IS-CRATE ?auto_6946 ) ( not ( = ?auto_6957 ?auto_6951 ) ) ( HOIST-AT ?auto_6956 ?auto_6957 ) ( AVAILABLE ?auto_6956 ) ( SURFACE-AT ?auto_6946 ?auto_6957 ) ( ON ?auto_6946 ?auto_6961 ) ( CLEAR ?auto_6946 ) ( not ( = ?auto_6947 ?auto_6946 ) ) ( not ( = ?auto_6947 ?auto_6961 ) ) ( not ( = ?auto_6946 ?auto_6961 ) ) ( not ( = ?auto_6954 ?auto_6956 ) ) ( IS-CRATE ?auto_6947 ) ( AVAILABLE ?auto_6955 ) ( SURFACE-AT ?auto_6947 ?auto_6950 ) ( ON ?auto_6947 ?auto_6968 ) ( CLEAR ?auto_6947 ) ( not ( = ?auto_6948 ?auto_6947 ) ) ( not ( = ?auto_6948 ?auto_6968 ) ) ( not ( = ?auto_6947 ?auto_6968 ) ) ( IS-CRATE ?auto_6948 ) ( not ( = ?auto_6970 ?auto_6951 ) ) ( HOIST-AT ?auto_6962 ?auto_6970 ) ( AVAILABLE ?auto_6962 ) ( SURFACE-AT ?auto_6948 ?auto_6970 ) ( ON ?auto_6948 ?auto_6963 ) ( CLEAR ?auto_6948 ) ( not ( = ?auto_6945 ?auto_6948 ) ) ( not ( = ?auto_6945 ?auto_6963 ) ) ( not ( = ?auto_6948 ?auto_6963 ) ) ( not ( = ?auto_6954 ?auto_6962 ) ) ( IS-CRATE ?auto_6945 ) ( not ( = ?auto_6973 ?auto_6951 ) ) ( HOIST-AT ?auto_6965 ?auto_6973 ) ( SURFACE-AT ?auto_6945 ?auto_6973 ) ( ON ?auto_6945 ?auto_6958 ) ( CLEAR ?auto_6945 ) ( not ( = ?auto_6944 ?auto_6945 ) ) ( not ( = ?auto_6944 ?auto_6958 ) ) ( not ( = ?auto_6945 ?auto_6958 ) ) ( not ( = ?auto_6954 ?auto_6965 ) ) ( IS-CRATE ?auto_6944 ) ( not ( = ?auto_6972 ?auto_6951 ) ) ( HOIST-AT ?auto_6966 ?auto_6972 ) ( SURFACE-AT ?auto_6944 ?auto_6972 ) ( ON ?auto_6944 ?auto_6959 ) ( CLEAR ?auto_6944 ) ( not ( = ?auto_6943 ?auto_6944 ) ) ( not ( = ?auto_6943 ?auto_6959 ) ) ( not ( = ?auto_6944 ?auto_6959 ) ) ( not ( = ?auto_6954 ?auto_6966 ) ) ( IS-CRATE ?auto_6943 ) ( AVAILABLE ?auto_6966 ) ( SURFACE-AT ?auto_6943 ?auto_6972 ) ( ON ?auto_6943 ?auto_6967 ) ( CLEAR ?auto_6943 ) ( not ( = ?auto_6942 ?auto_6943 ) ) ( not ( = ?auto_6942 ?auto_6967 ) ) ( not ( = ?auto_6943 ?auto_6967 ) ) ( IS-CRATE ?auto_6942 ) ( not ( = ?auto_6960 ?auto_6951 ) ) ( HOIST-AT ?auto_6969 ?auto_6960 ) ( AVAILABLE ?auto_6969 ) ( SURFACE-AT ?auto_6942 ?auto_6960 ) ( ON ?auto_6942 ?auto_6964 ) ( CLEAR ?auto_6942 ) ( not ( = ?auto_6941 ?auto_6942 ) ) ( not ( = ?auto_6941 ?auto_6964 ) ) ( not ( = ?auto_6942 ?auto_6964 ) ) ( not ( = ?auto_6954 ?auto_6969 ) ) ( SURFACE-AT ?auto_6940 ?auto_6951 ) ( CLEAR ?auto_6940 ) ( IS-CRATE ?auto_6941 ) ( AVAILABLE ?auto_6954 ) ( AVAILABLE ?auto_6965 ) ( SURFACE-AT ?auto_6941 ?auto_6973 ) ( ON ?auto_6941 ?auto_6971 ) ( CLEAR ?auto_6941 ) ( TRUCK-AT ?auto_6953 ?auto_6951 ) ( not ( = ?auto_6940 ?auto_6941 ) ) ( not ( = ?auto_6940 ?auto_6971 ) ) ( not ( = ?auto_6941 ?auto_6971 ) ) ( not ( = ?auto_6940 ?auto_6942 ) ) ( not ( = ?auto_6940 ?auto_6964 ) ) ( not ( = ?auto_6942 ?auto_6971 ) ) ( not ( = ?auto_6960 ?auto_6973 ) ) ( not ( = ?auto_6969 ?auto_6965 ) ) ( not ( = ?auto_6964 ?auto_6971 ) ) ( not ( = ?auto_6940 ?auto_6943 ) ) ( not ( = ?auto_6940 ?auto_6967 ) ) ( not ( = ?auto_6941 ?auto_6943 ) ) ( not ( = ?auto_6941 ?auto_6967 ) ) ( not ( = ?auto_6943 ?auto_6964 ) ) ( not ( = ?auto_6943 ?auto_6971 ) ) ( not ( = ?auto_6972 ?auto_6960 ) ) ( not ( = ?auto_6972 ?auto_6973 ) ) ( not ( = ?auto_6966 ?auto_6969 ) ) ( not ( = ?auto_6966 ?auto_6965 ) ) ( not ( = ?auto_6967 ?auto_6964 ) ) ( not ( = ?auto_6967 ?auto_6971 ) ) ( not ( = ?auto_6940 ?auto_6944 ) ) ( not ( = ?auto_6940 ?auto_6959 ) ) ( not ( = ?auto_6941 ?auto_6944 ) ) ( not ( = ?auto_6941 ?auto_6959 ) ) ( not ( = ?auto_6942 ?auto_6944 ) ) ( not ( = ?auto_6942 ?auto_6959 ) ) ( not ( = ?auto_6944 ?auto_6967 ) ) ( not ( = ?auto_6944 ?auto_6964 ) ) ( not ( = ?auto_6944 ?auto_6971 ) ) ( not ( = ?auto_6959 ?auto_6967 ) ) ( not ( = ?auto_6959 ?auto_6964 ) ) ( not ( = ?auto_6959 ?auto_6971 ) ) ( not ( = ?auto_6940 ?auto_6945 ) ) ( not ( = ?auto_6940 ?auto_6958 ) ) ( not ( = ?auto_6941 ?auto_6945 ) ) ( not ( = ?auto_6941 ?auto_6958 ) ) ( not ( = ?auto_6942 ?auto_6945 ) ) ( not ( = ?auto_6942 ?auto_6958 ) ) ( not ( = ?auto_6943 ?auto_6945 ) ) ( not ( = ?auto_6943 ?auto_6958 ) ) ( not ( = ?auto_6945 ?auto_6959 ) ) ( not ( = ?auto_6945 ?auto_6967 ) ) ( not ( = ?auto_6945 ?auto_6964 ) ) ( not ( = ?auto_6945 ?auto_6971 ) ) ( not ( = ?auto_6958 ?auto_6959 ) ) ( not ( = ?auto_6958 ?auto_6967 ) ) ( not ( = ?auto_6958 ?auto_6964 ) ) ( not ( = ?auto_6958 ?auto_6971 ) ) ( not ( = ?auto_6940 ?auto_6948 ) ) ( not ( = ?auto_6940 ?auto_6963 ) ) ( not ( = ?auto_6941 ?auto_6948 ) ) ( not ( = ?auto_6941 ?auto_6963 ) ) ( not ( = ?auto_6942 ?auto_6948 ) ) ( not ( = ?auto_6942 ?auto_6963 ) ) ( not ( = ?auto_6943 ?auto_6948 ) ) ( not ( = ?auto_6943 ?auto_6963 ) ) ( not ( = ?auto_6944 ?auto_6948 ) ) ( not ( = ?auto_6944 ?auto_6963 ) ) ( not ( = ?auto_6948 ?auto_6958 ) ) ( not ( = ?auto_6948 ?auto_6959 ) ) ( not ( = ?auto_6948 ?auto_6967 ) ) ( not ( = ?auto_6948 ?auto_6964 ) ) ( not ( = ?auto_6948 ?auto_6971 ) ) ( not ( = ?auto_6970 ?auto_6973 ) ) ( not ( = ?auto_6970 ?auto_6972 ) ) ( not ( = ?auto_6970 ?auto_6960 ) ) ( not ( = ?auto_6962 ?auto_6965 ) ) ( not ( = ?auto_6962 ?auto_6966 ) ) ( not ( = ?auto_6962 ?auto_6969 ) ) ( not ( = ?auto_6963 ?auto_6958 ) ) ( not ( = ?auto_6963 ?auto_6959 ) ) ( not ( = ?auto_6963 ?auto_6967 ) ) ( not ( = ?auto_6963 ?auto_6964 ) ) ( not ( = ?auto_6963 ?auto_6971 ) ) ( not ( = ?auto_6940 ?auto_6947 ) ) ( not ( = ?auto_6940 ?auto_6968 ) ) ( not ( = ?auto_6941 ?auto_6947 ) ) ( not ( = ?auto_6941 ?auto_6968 ) ) ( not ( = ?auto_6942 ?auto_6947 ) ) ( not ( = ?auto_6942 ?auto_6968 ) ) ( not ( = ?auto_6943 ?auto_6947 ) ) ( not ( = ?auto_6943 ?auto_6968 ) ) ( not ( = ?auto_6944 ?auto_6947 ) ) ( not ( = ?auto_6944 ?auto_6968 ) ) ( not ( = ?auto_6945 ?auto_6947 ) ) ( not ( = ?auto_6945 ?auto_6968 ) ) ( not ( = ?auto_6947 ?auto_6963 ) ) ( not ( = ?auto_6947 ?auto_6958 ) ) ( not ( = ?auto_6947 ?auto_6959 ) ) ( not ( = ?auto_6947 ?auto_6967 ) ) ( not ( = ?auto_6947 ?auto_6964 ) ) ( not ( = ?auto_6947 ?auto_6971 ) ) ( not ( = ?auto_6950 ?auto_6970 ) ) ( not ( = ?auto_6950 ?auto_6973 ) ) ( not ( = ?auto_6950 ?auto_6972 ) ) ( not ( = ?auto_6950 ?auto_6960 ) ) ( not ( = ?auto_6955 ?auto_6962 ) ) ( not ( = ?auto_6955 ?auto_6965 ) ) ( not ( = ?auto_6955 ?auto_6966 ) ) ( not ( = ?auto_6955 ?auto_6969 ) ) ( not ( = ?auto_6968 ?auto_6963 ) ) ( not ( = ?auto_6968 ?auto_6958 ) ) ( not ( = ?auto_6968 ?auto_6959 ) ) ( not ( = ?auto_6968 ?auto_6967 ) ) ( not ( = ?auto_6968 ?auto_6964 ) ) ( not ( = ?auto_6968 ?auto_6971 ) ) ( not ( = ?auto_6940 ?auto_6946 ) ) ( not ( = ?auto_6940 ?auto_6961 ) ) ( not ( = ?auto_6941 ?auto_6946 ) ) ( not ( = ?auto_6941 ?auto_6961 ) ) ( not ( = ?auto_6942 ?auto_6946 ) ) ( not ( = ?auto_6942 ?auto_6961 ) ) ( not ( = ?auto_6943 ?auto_6946 ) ) ( not ( = ?auto_6943 ?auto_6961 ) ) ( not ( = ?auto_6944 ?auto_6946 ) ) ( not ( = ?auto_6944 ?auto_6961 ) ) ( not ( = ?auto_6945 ?auto_6946 ) ) ( not ( = ?auto_6945 ?auto_6961 ) ) ( not ( = ?auto_6948 ?auto_6946 ) ) ( not ( = ?auto_6948 ?auto_6961 ) ) ( not ( = ?auto_6946 ?auto_6968 ) ) ( not ( = ?auto_6946 ?auto_6963 ) ) ( not ( = ?auto_6946 ?auto_6958 ) ) ( not ( = ?auto_6946 ?auto_6959 ) ) ( not ( = ?auto_6946 ?auto_6967 ) ) ( not ( = ?auto_6946 ?auto_6964 ) ) ( not ( = ?auto_6946 ?auto_6971 ) ) ( not ( = ?auto_6957 ?auto_6950 ) ) ( not ( = ?auto_6957 ?auto_6970 ) ) ( not ( = ?auto_6957 ?auto_6973 ) ) ( not ( = ?auto_6957 ?auto_6972 ) ) ( not ( = ?auto_6957 ?auto_6960 ) ) ( not ( = ?auto_6956 ?auto_6955 ) ) ( not ( = ?auto_6956 ?auto_6962 ) ) ( not ( = ?auto_6956 ?auto_6965 ) ) ( not ( = ?auto_6956 ?auto_6966 ) ) ( not ( = ?auto_6956 ?auto_6969 ) ) ( not ( = ?auto_6961 ?auto_6968 ) ) ( not ( = ?auto_6961 ?auto_6963 ) ) ( not ( = ?auto_6961 ?auto_6958 ) ) ( not ( = ?auto_6961 ?auto_6959 ) ) ( not ( = ?auto_6961 ?auto_6967 ) ) ( not ( = ?auto_6961 ?auto_6964 ) ) ( not ( = ?auto_6961 ?auto_6971 ) ) ( not ( = ?auto_6940 ?auto_6949 ) ) ( not ( = ?auto_6940 ?auto_6952 ) ) ( not ( = ?auto_6941 ?auto_6949 ) ) ( not ( = ?auto_6941 ?auto_6952 ) ) ( not ( = ?auto_6942 ?auto_6949 ) ) ( not ( = ?auto_6942 ?auto_6952 ) ) ( not ( = ?auto_6943 ?auto_6949 ) ) ( not ( = ?auto_6943 ?auto_6952 ) ) ( not ( = ?auto_6944 ?auto_6949 ) ) ( not ( = ?auto_6944 ?auto_6952 ) ) ( not ( = ?auto_6945 ?auto_6949 ) ) ( not ( = ?auto_6945 ?auto_6952 ) ) ( not ( = ?auto_6948 ?auto_6949 ) ) ( not ( = ?auto_6948 ?auto_6952 ) ) ( not ( = ?auto_6947 ?auto_6949 ) ) ( not ( = ?auto_6947 ?auto_6952 ) ) ( not ( = ?auto_6949 ?auto_6961 ) ) ( not ( = ?auto_6949 ?auto_6968 ) ) ( not ( = ?auto_6949 ?auto_6963 ) ) ( not ( = ?auto_6949 ?auto_6958 ) ) ( not ( = ?auto_6949 ?auto_6959 ) ) ( not ( = ?auto_6949 ?auto_6967 ) ) ( not ( = ?auto_6949 ?auto_6964 ) ) ( not ( = ?auto_6949 ?auto_6971 ) ) ( not ( = ?auto_6952 ?auto_6961 ) ) ( not ( = ?auto_6952 ?auto_6968 ) ) ( not ( = ?auto_6952 ?auto_6963 ) ) ( not ( = ?auto_6952 ?auto_6958 ) ) ( not ( = ?auto_6952 ?auto_6959 ) ) ( not ( = ?auto_6952 ?auto_6967 ) ) ( not ( = ?auto_6952 ?auto_6964 ) ) ( not ( = ?auto_6952 ?auto_6971 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_6940 ?auto_6941 ?auto_6942 ?auto_6943 ?auto_6944 ?auto_6945 ?auto_6948 ?auto_6947 ?auto_6946 )
      ( MAKE-1CRATE ?auto_6946 ?auto_6949 )
      ( MAKE-9CRATE-VERIFY ?auto_6940 ?auto_6941 ?auto_6942 ?auto_6943 ?auto_6944 ?auto_6945 ?auto_6948 ?auto_6947 ?auto_6946 ?auto_6949 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6976 - SURFACE
      ?auto_6977 - SURFACE
    )
    :vars
    (
      ?auto_6978 - HOIST
      ?auto_6979 - PLACE
      ?auto_6981 - PLACE
      ?auto_6982 - HOIST
      ?auto_6983 - SURFACE
      ?auto_6980 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6978 ?auto_6979 ) ( SURFACE-AT ?auto_6976 ?auto_6979 ) ( CLEAR ?auto_6976 ) ( IS-CRATE ?auto_6977 ) ( AVAILABLE ?auto_6978 ) ( not ( = ?auto_6981 ?auto_6979 ) ) ( HOIST-AT ?auto_6982 ?auto_6981 ) ( AVAILABLE ?auto_6982 ) ( SURFACE-AT ?auto_6977 ?auto_6981 ) ( ON ?auto_6977 ?auto_6983 ) ( CLEAR ?auto_6977 ) ( TRUCK-AT ?auto_6980 ?auto_6979 ) ( not ( = ?auto_6976 ?auto_6977 ) ) ( not ( = ?auto_6976 ?auto_6983 ) ) ( not ( = ?auto_6977 ?auto_6983 ) ) ( not ( = ?auto_6978 ?auto_6982 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6980 ?auto_6979 ?auto_6981 )
      ( !LIFT ?auto_6982 ?auto_6977 ?auto_6983 ?auto_6981 )
      ( !LOAD ?auto_6982 ?auto_6977 ?auto_6980 ?auto_6981 )
      ( !DRIVE ?auto_6980 ?auto_6981 ?auto_6979 )
      ( !UNLOAD ?auto_6978 ?auto_6977 ?auto_6980 ?auto_6979 )
      ( !DROP ?auto_6978 ?auto_6977 ?auto_6976 ?auto_6979 )
      ( MAKE-1CRATE-VERIFY ?auto_6976 ?auto_6977 ) )
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
      ?auto_7003 - SURFACE
      ?auto_7002 - SURFACE
      ?auto_7001 - SURFACE
      ?auto_7004 - SURFACE
      ?auto_7005 - SURFACE
    )
    :vars
    (
      ?auto_7006 - HOIST
      ?auto_7009 - PLACE
      ?auto_7007 - PLACE
      ?auto_7011 - HOIST
      ?auto_7008 - SURFACE
      ?auto_7018 - PLACE
      ?auto_7023 - HOIST
      ?auto_7031 - SURFACE
      ?auto_7025 - PLACE
      ?auto_7024 - HOIST
      ?auto_7013 - SURFACE
      ?auto_7028 - SURFACE
      ?auto_7032 - PLACE
      ?auto_7014 - HOIST
      ?auto_7022 - SURFACE
      ?auto_7029 - PLACE
      ?auto_7020 - HOIST
      ?auto_7016 - SURFACE
      ?auto_7015 - PLACE
      ?auto_7017 - HOIST
      ?auto_7030 - SURFACE
      ?auto_7026 - SURFACE
      ?auto_7012 - PLACE
      ?auto_7021 - HOIST
      ?auto_7019 - SURFACE
      ?auto_7027 - SURFACE
      ?auto_7010 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7006 ?auto_7009 ) ( IS-CRATE ?auto_7005 ) ( not ( = ?auto_7007 ?auto_7009 ) ) ( HOIST-AT ?auto_7011 ?auto_7007 ) ( AVAILABLE ?auto_7011 ) ( SURFACE-AT ?auto_7005 ?auto_7007 ) ( ON ?auto_7005 ?auto_7008 ) ( CLEAR ?auto_7005 ) ( not ( = ?auto_7004 ?auto_7005 ) ) ( not ( = ?auto_7004 ?auto_7008 ) ) ( not ( = ?auto_7005 ?auto_7008 ) ) ( not ( = ?auto_7006 ?auto_7011 ) ) ( IS-CRATE ?auto_7004 ) ( not ( = ?auto_7018 ?auto_7009 ) ) ( HOIST-AT ?auto_7023 ?auto_7018 ) ( SURFACE-AT ?auto_7004 ?auto_7018 ) ( ON ?auto_7004 ?auto_7031 ) ( CLEAR ?auto_7004 ) ( not ( = ?auto_7001 ?auto_7004 ) ) ( not ( = ?auto_7001 ?auto_7031 ) ) ( not ( = ?auto_7004 ?auto_7031 ) ) ( not ( = ?auto_7006 ?auto_7023 ) ) ( IS-CRATE ?auto_7001 ) ( not ( = ?auto_7025 ?auto_7009 ) ) ( HOIST-AT ?auto_7024 ?auto_7025 ) ( AVAILABLE ?auto_7024 ) ( SURFACE-AT ?auto_7001 ?auto_7025 ) ( ON ?auto_7001 ?auto_7013 ) ( CLEAR ?auto_7001 ) ( not ( = ?auto_7002 ?auto_7001 ) ) ( not ( = ?auto_7002 ?auto_7013 ) ) ( not ( = ?auto_7001 ?auto_7013 ) ) ( not ( = ?auto_7006 ?auto_7024 ) ) ( IS-CRATE ?auto_7002 ) ( AVAILABLE ?auto_7023 ) ( SURFACE-AT ?auto_7002 ?auto_7018 ) ( ON ?auto_7002 ?auto_7028 ) ( CLEAR ?auto_7002 ) ( not ( = ?auto_7003 ?auto_7002 ) ) ( not ( = ?auto_7003 ?auto_7028 ) ) ( not ( = ?auto_7002 ?auto_7028 ) ) ( IS-CRATE ?auto_7003 ) ( not ( = ?auto_7032 ?auto_7009 ) ) ( HOIST-AT ?auto_7014 ?auto_7032 ) ( AVAILABLE ?auto_7014 ) ( SURFACE-AT ?auto_7003 ?auto_7032 ) ( ON ?auto_7003 ?auto_7022 ) ( CLEAR ?auto_7003 ) ( not ( = ?auto_7000 ?auto_7003 ) ) ( not ( = ?auto_7000 ?auto_7022 ) ) ( not ( = ?auto_7003 ?auto_7022 ) ) ( not ( = ?auto_7006 ?auto_7014 ) ) ( IS-CRATE ?auto_7000 ) ( not ( = ?auto_7029 ?auto_7009 ) ) ( HOIST-AT ?auto_7020 ?auto_7029 ) ( SURFACE-AT ?auto_7000 ?auto_7029 ) ( ON ?auto_7000 ?auto_7016 ) ( CLEAR ?auto_7000 ) ( not ( = ?auto_6999 ?auto_7000 ) ) ( not ( = ?auto_6999 ?auto_7016 ) ) ( not ( = ?auto_7000 ?auto_7016 ) ) ( not ( = ?auto_7006 ?auto_7020 ) ) ( IS-CRATE ?auto_6999 ) ( not ( = ?auto_7015 ?auto_7009 ) ) ( HOIST-AT ?auto_7017 ?auto_7015 ) ( SURFACE-AT ?auto_6999 ?auto_7015 ) ( ON ?auto_6999 ?auto_7030 ) ( CLEAR ?auto_6999 ) ( not ( = ?auto_6998 ?auto_6999 ) ) ( not ( = ?auto_6998 ?auto_7030 ) ) ( not ( = ?auto_6999 ?auto_7030 ) ) ( not ( = ?auto_7006 ?auto_7017 ) ) ( IS-CRATE ?auto_6998 ) ( AVAILABLE ?auto_7017 ) ( SURFACE-AT ?auto_6998 ?auto_7015 ) ( ON ?auto_6998 ?auto_7026 ) ( CLEAR ?auto_6998 ) ( not ( = ?auto_6997 ?auto_6998 ) ) ( not ( = ?auto_6997 ?auto_7026 ) ) ( not ( = ?auto_6998 ?auto_7026 ) ) ( IS-CRATE ?auto_6997 ) ( not ( = ?auto_7012 ?auto_7009 ) ) ( HOIST-AT ?auto_7021 ?auto_7012 ) ( AVAILABLE ?auto_7021 ) ( SURFACE-AT ?auto_6997 ?auto_7012 ) ( ON ?auto_6997 ?auto_7019 ) ( CLEAR ?auto_6997 ) ( not ( = ?auto_6996 ?auto_6997 ) ) ( not ( = ?auto_6996 ?auto_7019 ) ) ( not ( = ?auto_6997 ?auto_7019 ) ) ( not ( = ?auto_7006 ?auto_7021 ) ) ( SURFACE-AT ?auto_6995 ?auto_7009 ) ( CLEAR ?auto_6995 ) ( IS-CRATE ?auto_6996 ) ( AVAILABLE ?auto_7006 ) ( AVAILABLE ?auto_7020 ) ( SURFACE-AT ?auto_6996 ?auto_7029 ) ( ON ?auto_6996 ?auto_7027 ) ( CLEAR ?auto_6996 ) ( TRUCK-AT ?auto_7010 ?auto_7009 ) ( not ( = ?auto_6995 ?auto_6996 ) ) ( not ( = ?auto_6995 ?auto_7027 ) ) ( not ( = ?auto_6996 ?auto_7027 ) ) ( not ( = ?auto_6995 ?auto_6997 ) ) ( not ( = ?auto_6995 ?auto_7019 ) ) ( not ( = ?auto_6997 ?auto_7027 ) ) ( not ( = ?auto_7012 ?auto_7029 ) ) ( not ( = ?auto_7021 ?auto_7020 ) ) ( not ( = ?auto_7019 ?auto_7027 ) ) ( not ( = ?auto_6995 ?auto_6998 ) ) ( not ( = ?auto_6995 ?auto_7026 ) ) ( not ( = ?auto_6996 ?auto_6998 ) ) ( not ( = ?auto_6996 ?auto_7026 ) ) ( not ( = ?auto_6998 ?auto_7019 ) ) ( not ( = ?auto_6998 ?auto_7027 ) ) ( not ( = ?auto_7015 ?auto_7012 ) ) ( not ( = ?auto_7015 ?auto_7029 ) ) ( not ( = ?auto_7017 ?auto_7021 ) ) ( not ( = ?auto_7017 ?auto_7020 ) ) ( not ( = ?auto_7026 ?auto_7019 ) ) ( not ( = ?auto_7026 ?auto_7027 ) ) ( not ( = ?auto_6995 ?auto_6999 ) ) ( not ( = ?auto_6995 ?auto_7030 ) ) ( not ( = ?auto_6996 ?auto_6999 ) ) ( not ( = ?auto_6996 ?auto_7030 ) ) ( not ( = ?auto_6997 ?auto_6999 ) ) ( not ( = ?auto_6997 ?auto_7030 ) ) ( not ( = ?auto_6999 ?auto_7026 ) ) ( not ( = ?auto_6999 ?auto_7019 ) ) ( not ( = ?auto_6999 ?auto_7027 ) ) ( not ( = ?auto_7030 ?auto_7026 ) ) ( not ( = ?auto_7030 ?auto_7019 ) ) ( not ( = ?auto_7030 ?auto_7027 ) ) ( not ( = ?auto_6995 ?auto_7000 ) ) ( not ( = ?auto_6995 ?auto_7016 ) ) ( not ( = ?auto_6996 ?auto_7000 ) ) ( not ( = ?auto_6996 ?auto_7016 ) ) ( not ( = ?auto_6997 ?auto_7000 ) ) ( not ( = ?auto_6997 ?auto_7016 ) ) ( not ( = ?auto_6998 ?auto_7000 ) ) ( not ( = ?auto_6998 ?auto_7016 ) ) ( not ( = ?auto_7000 ?auto_7030 ) ) ( not ( = ?auto_7000 ?auto_7026 ) ) ( not ( = ?auto_7000 ?auto_7019 ) ) ( not ( = ?auto_7000 ?auto_7027 ) ) ( not ( = ?auto_7016 ?auto_7030 ) ) ( not ( = ?auto_7016 ?auto_7026 ) ) ( not ( = ?auto_7016 ?auto_7019 ) ) ( not ( = ?auto_7016 ?auto_7027 ) ) ( not ( = ?auto_6995 ?auto_7003 ) ) ( not ( = ?auto_6995 ?auto_7022 ) ) ( not ( = ?auto_6996 ?auto_7003 ) ) ( not ( = ?auto_6996 ?auto_7022 ) ) ( not ( = ?auto_6997 ?auto_7003 ) ) ( not ( = ?auto_6997 ?auto_7022 ) ) ( not ( = ?auto_6998 ?auto_7003 ) ) ( not ( = ?auto_6998 ?auto_7022 ) ) ( not ( = ?auto_6999 ?auto_7003 ) ) ( not ( = ?auto_6999 ?auto_7022 ) ) ( not ( = ?auto_7003 ?auto_7016 ) ) ( not ( = ?auto_7003 ?auto_7030 ) ) ( not ( = ?auto_7003 ?auto_7026 ) ) ( not ( = ?auto_7003 ?auto_7019 ) ) ( not ( = ?auto_7003 ?auto_7027 ) ) ( not ( = ?auto_7032 ?auto_7029 ) ) ( not ( = ?auto_7032 ?auto_7015 ) ) ( not ( = ?auto_7032 ?auto_7012 ) ) ( not ( = ?auto_7014 ?auto_7020 ) ) ( not ( = ?auto_7014 ?auto_7017 ) ) ( not ( = ?auto_7014 ?auto_7021 ) ) ( not ( = ?auto_7022 ?auto_7016 ) ) ( not ( = ?auto_7022 ?auto_7030 ) ) ( not ( = ?auto_7022 ?auto_7026 ) ) ( not ( = ?auto_7022 ?auto_7019 ) ) ( not ( = ?auto_7022 ?auto_7027 ) ) ( not ( = ?auto_6995 ?auto_7002 ) ) ( not ( = ?auto_6995 ?auto_7028 ) ) ( not ( = ?auto_6996 ?auto_7002 ) ) ( not ( = ?auto_6996 ?auto_7028 ) ) ( not ( = ?auto_6997 ?auto_7002 ) ) ( not ( = ?auto_6997 ?auto_7028 ) ) ( not ( = ?auto_6998 ?auto_7002 ) ) ( not ( = ?auto_6998 ?auto_7028 ) ) ( not ( = ?auto_6999 ?auto_7002 ) ) ( not ( = ?auto_6999 ?auto_7028 ) ) ( not ( = ?auto_7000 ?auto_7002 ) ) ( not ( = ?auto_7000 ?auto_7028 ) ) ( not ( = ?auto_7002 ?auto_7022 ) ) ( not ( = ?auto_7002 ?auto_7016 ) ) ( not ( = ?auto_7002 ?auto_7030 ) ) ( not ( = ?auto_7002 ?auto_7026 ) ) ( not ( = ?auto_7002 ?auto_7019 ) ) ( not ( = ?auto_7002 ?auto_7027 ) ) ( not ( = ?auto_7018 ?auto_7032 ) ) ( not ( = ?auto_7018 ?auto_7029 ) ) ( not ( = ?auto_7018 ?auto_7015 ) ) ( not ( = ?auto_7018 ?auto_7012 ) ) ( not ( = ?auto_7023 ?auto_7014 ) ) ( not ( = ?auto_7023 ?auto_7020 ) ) ( not ( = ?auto_7023 ?auto_7017 ) ) ( not ( = ?auto_7023 ?auto_7021 ) ) ( not ( = ?auto_7028 ?auto_7022 ) ) ( not ( = ?auto_7028 ?auto_7016 ) ) ( not ( = ?auto_7028 ?auto_7030 ) ) ( not ( = ?auto_7028 ?auto_7026 ) ) ( not ( = ?auto_7028 ?auto_7019 ) ) ( not ( = ?auto_7028 ?auto_7027 ) ) ( not ( = ?auto_6995 ?auto_7001 ) ) ( not ( = ?auto_6995 ?auto_7013 ) ) ( not ( = ?auto_6996 ?auto_7001 ) ) ( not ( = ?auto_6996 ?auto_7013 ) ) ( not ( = ?auto_6997 ?auto_7001 ) ) ( not ( = ?auto_6997 ?auto_7013 ) ) ( not ( = ?auto_6998 ?auto_7001 ) ) ( not ( = ?auto_6998 ?auto_7013 ) ) ( not ( = ?auto_6999 ?auto_7001 ) ) ( not ( = ?auto_6999 ?auto_7013 ) ) ( not ( = ?auto_7000 ?auto_7001 ) ) ( not ( = ?auto_7000 ?auto_7013 ) ) ( not ( = ?auto_7003 ?auto_7001 ) ) ( not ( = ?auto_7003 ?auto_7013 ) ) ( not ( = ?auto_7001 ?auto_7028 ) ) ( not ( = ?auto_7001 ?auto_7022 ) ) ( not ( = ?auto_7001 ?auto_7016 ) ) ( not ( = ?auto_7001 ?auto_7030 ) ) ( not ( = ?auto_7001 ?auto_7026 ) ) ( not ( = ?auto_7001 ?auto_7019 ) ) ( not ( = ?auto_7001 ?auto_7027 ) ) ( not ( = ?auto_7025 ?auto_7018 ) ) ( not ( = ?auto_7025 ?auto_7032 ) ) ( not ( = ?auto_7025 ?auto_7029 ) ) ( not ( = ?auto_7025 ?auto_7015 ) ) ( not ( = ?auto_7025 ?auto_7012 ) ) ( not ( = ?auto_7024 ?auto_7023 ) ) ( not ( = ?auto_7024 ?auto_7014 ) ) ( not ( = ?auto_7024 ?auto_7020 ) ) ( not ( = ?auto_7024 ?auto_7017 ) ) ( not ( = ?auto_7024 ?auto_7021 ) ) ( not ( = ?auto_7013 ?auto_7028 ) ) ( not ( = ?auto_7013 ?auto_7022 ) ) ( not ( = ?auto_7013 ?auto_7016 ) ) ( not ( = ?auto_7013 ?auto_7030 ) ) ( not ( = ?auto_7013 ?auto_7026 ) ) ( not ( = ?auto_7013 ?auto_7019 ) ) ( not ( = ?auto_7013 ?auto_7027 ) ) ( not ( = ?auto_6995 ?auto_7004 ) ) ( not ( = ?auto_6995 ?auto_7031 ) ) ( not ( = ?auto_6996 ?auto_7004 ) ) ( not ( = ?auto_6996 ?auto_7031 ) ) ( not ( = ?auto_6997 ?auto_7004 ) ) ( not ( = ?auto_6997 ?auto_7031 ) ) ( not ( = ?auto_6998 ?auto_7004 ) ) ( not ( = ?auto_6998 ?auto_7031 ) ) ( not ( = ?auto_6999 ?auto_7004 ) ) ( not ( = ?auto_6999 ?auto_7031 ) ) ( not ( = ?auto_7000 ?auto_7004 ) ) ( not ( = ?auto_7000 ?auto_7031 ) ) ( not ( = ?auto_7003 ?auto_7004 ) ) ( not ( = ?auto_7003 ?auto_7031 ) ) ( not ( = ?auto_7002 ?auto_7004 ) ) ( not ( = ?auto_7002 ?auto_7031 ) ) ( not ( = ?auto_7004 ?auto_7013 ) ) ( not ( = ?auto_7004 ?auto_7028 ) ) ( not ( = ?auto_7004 ?auto_7022 ) ) ( not ( = ?auto_7004 ?auto_7016 ) ) ( not ( = ?auto_7004 ?auto_7030 ) ) ( not ( = ?auto_7004 ?auto_7026 ) ) ( not ( = ?auto_7004 ?auto_7019 ) ) ( not ( = ?auto_7004 ?auto_7027 ) ) ( not ( = ?auto_7031 ?auto_7013 ) ) ( not ( = ?auto_7031 ?auto_7028 ) ) ( not ( = ?auto_7031 ?auto_7022 ) ) ( not ( = ?auto_7031 ?auto_7016 ) ) ( not ( = ?auto_7031 ?auto_7030 ) ) ( not ( = ?auto_7031 ?auto_7026 ) ) ( not ( = ?auto_7031 ?auto_7019 ) ) ( not ( = ?auto_7031 ?auto_7027 ) ) ( not ( = ?auto_6995 ?auto_7005 ) ) ( not ( = ?auto_6995 ?auto_7008 ) ) ( not ( = ?auto_6996 ?auto_7005 ) ) ( not ( = ?auto_6996 ?auto_7008 ) ) ( not ( = ?auto_6997 ?auto_7005 ) ) ( not ( = ?auto_6997 ?auto_7008 ) ) ( not ( = ?auto_6998 ?auto_7005 ) ) ( not ( = ?auto_6998 ?auto_7008 ) ) ( not ( = ?auto_6999 ?auto_7005 ) ) ( not ( = ?auto_6999 ?auto_7008 ) ) ( not ( = ?auto_7000 ?auto_7005 ) ) ( not ( = ?auto_7000 ?auto_7008 ) ) ( not ( = ?auto_7003 ?auto_7005 ) ) ( not ( = ?auto_7003 ?auto_7008 ) ) ( not ( = ?auto_7002 ?auto_7005 ) ) ( not ( = ?auto_7002 ?auto_7008 ) ) ( not ( = ?auto_7001 ?auto_7005 ) ) ( not ( = ?auto_7001 ?auto_7008 ) ) ( not ( = ?auto_7005 ?auto_7031 ) ) ( not ( = ?auto_7005 ?auto_7013 ) ) ( not ( = ?auto_7005 ?auto_7028 ) ) ( not ( = ?auto_7005 ?auto_7022 ) ) ( not ( = ?auto_7005 ?auto_7016 ) ) ( not ( = ?auto_7005 ?auto_7030 ) ) ( not ( = ?auto_7005 ?auto_7026 ) ) ( not ( = ?auto_7005 ?auto_7019 ) ) ( not ( = ?auto_7005 ?auto_7027 ) ) ( not ( = ?auto_7007 ?auto_7018 ) ) ( not ( = ?auto_7007 ?auto_7025 ) ) ( not ( = ?auto_7007 ?auto_7032 ) ) ( not ( = ?auto_7007 ?auto_7029 ) ) ( not ( = ?auto_7007 ?auto_7015 ) ) ( not ( = ?auto_7007 ?auto_7012 ) ) ( not ( = ?auto_7011 ?auto_7023 ) ) ( not ( = ?auto_7011 ?auto_7024 ) ) ( not ( = ?auto_7011 ?auto_7014 ) ) ( not ( = ?auto_7011 ?auto_7020 ) ) ( not ( = ?auto_7011 ?auto_7017 ) ) ( not ( = ?auto_7011 ?auto_7021 ) ) ( not ( = ?auto_7008 ?auto_7031 ) ) ( not ( = ?auto_7008 ?auto_7013 ) ) ( not ( = ?auto_7008 ?auto_7028 ) ) ( not ( = ?auto_7008 ?auto_7022 ) ) ( not ( = ?auto_7008 ?auto_7016 ) ) ( not ( = ?auto_7008 ?auto_7030 ) ) ( not ( = ?auto_7008 ?auto_7026 ) ) ( not ( = ?auto_7008 ?auto_7019 ) ) ( not ( = ?auto_7008 ?auto_7027 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_6995 ?auto_6996 ?auto_6997 ?auto_6998 ?auto_6999 ?auto_7000 ?auto_7003 ?auto_7002 ?auto_7001 ?auto_7004 )
      ( MAKE-1CRATE ?auto_7004 ?auto_7005 )
      ( MAKE-10CRATE-VERIFY ?auto_6995 ?auto_6996 ?auto_6997 ?auto_6998 ?auto_6999 ?auto_7000 ?auto_7003 ?auto_7002 ?auto_7001 ?auto_7004 ?auto_7005 ) )
  )

)

