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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5650 - SURFACE
      ?auto_5651 - SURFACE
    )
    :vars
    (
      ?auto_5652 - HOIST
      ?auto_5653 - PLACE
      ?auto_5655 - PLACE
      ?auto_5656 - HOIST
      ?auto_5657 - SURFACE
      ?auto_5654 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5652 ?auto_5653 ) ( SURFACE-AT ?auto_5650 ?auto_5653 ) ( CLEAR ?auto_5650 ) ( IS-CRATE ?auto_5651 ) ( AVAILABLE ?auto_5652 ) ( not ( = ?auto_5655 ?auto_5653 ) ) ( HOIST-AT ?auto_5656 ?auto_5655 ) ( AVAILABLE ?auto_5656 ) ( SURFACE-AT ?auto_5651 ?auto_5655 ) ( ON ?auto_5651 ?auto_5657 ) ( CLEAR ?auto_5651 ) ( TRUCK-AT ?auto_5654 ?auto_5653 ) ( not ( = ?auto_5650 ?auto_5651 ) ) ( not ( = ?auto_5650 ?auto_5657 ) ) ( not ( = ?auto_5651 ?auto_5657 ) ) ( not ( = ?auto_5652 ?auto_5656 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5654 ?auto_5653 ?auto_5655 )
      ( !LIFT ?auto_5656 ?auto_5651 ?auto_5657 ?auto_5655 )
      ( !LOAD ?auto_5656 ?auto_5651 ?auto_5654 ?auto_5655 )
      ( !DRIVE ?auto_5654 ?auto_5655 ?auto_5653 )
      ( !UNLOAD ?auto_5652 ?auto_5651 ?auto_5654 ?auto_5653 )
      ( !DROP ?auto_5652 ?auto_5651 ?auto_5650 ?auto_5653 )
      ( MAKE-1CRATE-VERIFY ?auto_5650 ?auto_5651 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5671 - SURFACE
      ?auto_5672 - SURFACE
      ?auto_5673 - SURFACE
    )
    :vars
    (
      ?auto_5677 - HOIST
      ?auto_5679 - PLACE
      ?auto_5676 - PLACE
      ?auto_5675 - HOIST
      ?auto_5674 - SURFACE
      ?auto_5682 - PLACE
      ?auto_5680 - HOIST
      ?auto_5681 - SURFACE
      ?auto_5678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5677 ?auto_5679 ) ( IS-CRATE ?auto_5673 ) ( not ( = ?auto_5676 ?auto_5679 ) ) ( HOIST-AT ?auto_5675 ?auto_5676 ) ( AVAILABLE ?auto_5675 ) ( SURFACE-AT ?auto_5673 ?auto_5676 ) ( ON ?auto_5673 ?auto_5674 ) ( CLEAR ?auto_5673 ) ( not ( = ?auto_5672 ?auto_5673 ) ) ( not ( = ?auto_5672 ?auto_5674 ) ) ( not ( = ?auto_5673 ?auto_5674 ) ) ( not ( = ?auto_5677 ?auto_5675 ) ) ( SURFACE-AT ?auto_5671 ?auto_5679 ) ( CLEAR ?auto_5671 ) ( IS-CRATE ?auto_5672 ) ( AVAILABLE ?auto_5677 ) ( not ( = ?auto_5682 ?auto_5679 ) ) ( HOIST-AT ?auto_5680 ?auto_5682 ) ( AVAILABLE ?auto_5680 ) ( SURFACE-AT ?auto_5672 ?auto_5682 ) ( ON ?auto_5672 ?auto_5681 ) ( CLEAR ?auto_5672 ) ( TRUCK-AT ?auto_5678 ?auto_5679 ) ( not ( = ?auto_5671 ?auto_5672 ) ) ( not ( = ?auto_5671 ?auto_5681 ) ) ( not ( = ?auto_5672 ?auto_5681 ) ) ( not ( = ?auto_5677 ?auto_5680 ) ) ( not ( = ?auto_5671 ?auto_5673 ) ) ( not ( = ?auto_5671 ?auto_5674 ) ) ( not ( = ?auto_5673 ?auto_5681 ) ) ( not ( = ?auto_5676 ?auto_5682 ) ) ( not ( = ?auto_5675 ?auto_5680 ) ) ( not ( = ?auto_5674 ?auto_5681 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5671 ?auto_5672 )
      ( MAKE-1CRATE ?auto_5672 ?auto_5673 )
      ( MAKE-2CRATE-VERIFY ?auto_5671 ?auto_5672 ?auto_5673 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5697 - SURFACE
      ?auto_5698 - SURFACE
      ?auto_5699 - SURFACE
      ?auto_5700 - SURFACE
    )
    :vars
    (
      ?auto_5704 - HOIST
      ?auto_5706 - PLACE
      ?auto_5701 - PLACE
      ?auto_5703 - HOIST
      ?auto_5705 - SURFACE
      ?auto_5712 - PLACE
      ?auto_5711 - HOIST
      ?auto_5709 - SURFACE
      ?auto_5708 - PLACE
      ?auto_5710 - HOIST
      ?auto_5707 - SURFACE
      ?auto_5702 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5704 ?auto_5706 ) ( IS-CRATE ?auto_5700 ) ( not ( = ?auto_5701 ?auto_5706 ) ) ( HOIST-AT ?auto_5703 ?auto_5701 ) ( AVAILABLE ?auto_5703 ) ( SURFACE-AT ?auto_5700 ?auto_5701 ) ( ON ?auto_5700 ?auto_5705 ) ( CLEAR ?auto_5700 ) ( not ( = ?auto_5699 ?auto_5700 ) ) ( not ( = ?auto_5699 ?auto_5705 ) ) ( not ( = ?auto_5700 ?auto_5705 ) ) ( not ( = ?auto_5704 ?auto_5703 ) ) ( IS-CRATE ?auto_5699 ) ( not ( = ?auto_5712 ?auto_5706 ) ) ( HOIST-AT ?auto_5711 ?auto_5712 ) ( AVAILABLE ?auto_5711 ) ( SURFACE-AT ?auto_5699 ?auto_5712 ) ( ON ?auto_5699 ?auto_5709 ) ( CLEAR ?auto_5699 ) ( not ( = ?auto_5698 ?auto_5699 ) ) ( not ( = ?auto_5698 ?auto_5709 ) ) ( not ( = ?auto_5699 ?auto_5709 ) ) ( not ( = ?auto_5704 ?auto_5711 ) ) ( SURFACE-AT ?auto_5697 ?auto_5706 ) ( CLEAR ?auto_5697 ) ( IS-CRATE ?auto_5698 ) ( AVAILABLE ?auto_5704 ) ( not ( = ?auto_5708 ?auto_5706 ) ) ( HOIST-AT ?auto_5710 ?auto_5708 ) ( AVAILABLE ?auto_5710 ) ( SURFACE-AT ?auto_5698 ?auto_5708 ) ( ON ?auto_5698 ?auto_5707 ) ( CLEAR ?auto_5698 ) ( TRUCK-AT ?auto_5702 ?auto_5706 ) ( not ( = ?auto_5697 ?auto_5698 ) ) ( not ( = ?auto_5697 ?auto_5707 ) ) ( not ( = ?auto_5698 ?auto_5707 ) ) ( not ( = ?auto_5704 ?auto_5710 ) ) ( not ( = ?auto_5697 ?auto_5699 ) ) ( not ( = ?auto_5697 ?auto_5709 ) ) ( not ( = ?auto_5699 ?auto_5707 ) ) ( not ( = ?auto_5712 ?auto_5708 ) ) ( not ( = ?auto_5711 ?auto_5710 ) ) ( not ( = ?auto_5709 ?auto_5707 ) ) ( not ( = ?auto_5697 ?auto_5700 ) ) ( not ( = ?auto_5697 ?auto_5705 ) ) ( not ( = ?auto_5698 ?auto_5700 ) ) ( not ( = ?auto_5698 ?auto_5705 ) ) ( not ( = ?auto_5700 ?auto_5709 ) ) ( not ( = ?auto_5700 ?auto_5707 ) ) ( not ( = ?auto_5701 ?auto_5712 ) ) ( not ( = ?auto_5701 ?auto_5708 ) ) ( not ( = ?auto_5703 ?auto_5711 ) ) ( not ( = ?auto_5703 ?auto_5710 ) ) ( not ( = ?auto_5705 ?auto_5709 ) ) ( not ( = ?auto_5705 ?auto_5707 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5697 ?auto_5698 ?auto_5699 )
      ( MAKE-1CRATE ?auto_5699 ?auto_5700 )
      ( MAKE-3CRATE-VERIFY ?auto_5697 ?auto_5698 ?auto_5699 ?auto_5700 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5728 - SURFACE
      ?auto_5729 - SURFACE
      ?auto_5730 - SURFACE
      ?auto_5731 - SURFACE
      ?auto_5732 - SURFACE
    )
    :vars
    (
      ?auto_5734 - HOIST
      ?auto_5733 - PLACE
      ?auto_5735 - PLACE
      ?auto_5736 - HOIST
      ?auto_5738 - SURFACE
      ?auto_5742 - PLACE
      ?auto_5741 - HOIST
      ?auto_5745 - SURFACE
      ?auto_5746 - PLACE
      ?auto_5743 - HOIST
      ?auto_5747 - SURFACE
      ?auto_5739 - PLACE
      ?auto_5744 - HOIST
      ?auto_5740 - SURFACE
      ?auto_5737 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5734 ?auto_5733 ) ( IS-CRATE ?auto_5732 ) ( not ( = ?auto_5735 ?auto_5733 ) ) ( HOIST-AT ?auto_5736 ?auto_5735 ) ( AVAILABLE ?auto_5736 ) ( SURFACE-AT ?auto_5732 ?auto_5735 ) ( ON ?auto_5732 ?auto_5738 ) ( CLEAR ?auto_5732 ) ( not ( = ?auto_5731 ?auto_5732 ) ) ( not ( = ?auto_5731 ?auto_5738 ) ) ( not ( = ?auto_5732 ?auto_5738 ) ) ( not ( = ?auto_5734 ?auto_5736 ) ) ( IS-CRATE ?auto_5731 ) ( not ( = ?auto_5742 ?auto_5733 ) ) ( HOIST-AT ?auto_5741 ?auto_5742 ) ( AVAILABLE ?auto_5741 ) ( SURFACE-AT ?auto_5731 ?auto_5742 ) ( ON ?auto_5731 ?auto_5745 ) ( CLEAR ?auto_5731 ) ( not ( = ?auto_5730 ?auto_5731 ) ) ( not ( = ?auto_5730 ?auto_5745 ) ) ( not ( = ?auto_5731 ?auto_5745 ) ) ( not ( = ?auto_5734 ?auto_5741 ) ) ( IS-CRATE ?auto_5730 ) ( not ( = ?auto_5746 ?auto_5733 ) ) ( HOIST-AT ?auto_5743 ?auto_5746 ) ( AVAILABLE ?auto_5743 ) ( SURFACE-AT ?auto_5730 ?auto_5746 ) ( ON ?auto_5730 ?auto_5747 ) ( CLEAR ?auto_5730 ) ( not ( = ?auto_5729 ?auto_5730 ) ) ( not ( = ?auto_5729 ?auto_5747 ) ) ( not ( = ?auto_5730 ?auto_5747 ) ) ( not ( = ?auto_5734 ?auto_5743 ) ) ( SURFACE-AT ?auto_5728 ?auto_5733 ) ( CLEAR ?auto_5728 ) ( IS-CRATE ?auto_5729 ) ( AVAILABLE ?auto_5734 ) ( not ( = ?auto_5739 ?auto_5733 ) ) ( HOIST-AT ?auto_5744 ?auto_5739 ) ( AVAILABLE ?auto_5744 ) ( SURFACE-AT ?auto_5729 ?auto_5739 ) ( ON ?auto_5729 ?auto_5740 ) ( CLEAR ?auto_5729 ) ( TRUCK-AT ?auto_5737 ?auto_5733 ) ( not ( = ?auto_5728 ?auto_5729 ) ) ( not ( = ?auto_5728 ?auto_5740 ) ) ( not ( = ?auto_5729 ?auto_5740 ) ) ( not ( = ?auto_5734 ?auto_5744 ) ) ( not ( = ?auto_5728 ?auto_5730 ) ) ( not ( = ?auto_5728 ?auto_5747 ) ) ( not ( = ?auto_5730 ?auto_5740 ) ) ( not ( = ?auto_5746 ?auto_5739 ) ) ( not ( = ?auto_5743 ?auto_5744 ) ) ( not ( = ?auto_5747 ?auto_5740 ) ) ( not ( = ?auto_5728 ?auto_5731 ) ) ( not ( = ?auto_5728 ?auto_5745 ) ) ( not ( = ?auto_5729 ?auto_5731 ) ) ( not ( = ?auto_5729 ?auto_5745 ) ) ( not ( = ?auto_5731 ?auto_5747 ) ) ( not ( = ?auto_5731 ?auto_5740 ) ) ( not ( = ?auto_5742 ?auto_5746 ) ) ( not ( = ?auto_5742 ?auto_5739 ) ) ( not ( = ?auto_5741 ?auto_5743 ) ) ( not ( = ?auto_5741 ?auto_5744 ) ) ( not ( = ?auto_5745 ?auto_5747 ) ) ( not ( = ?auto_5745 ?auto_5740 ) ) ( not ( = ?auto_5728 ?auto_5732 ) ) ( not ( = ?auto_5728 ?auto_5738 ) ) ( not ( = ?auto_5729 ?auto_5732 ) ) ( not ( = ?auto_5729 ?auto_5738 ) ) ( not ( = ?auto_5730 ?auto_5732 ) ) ( not ( = ?auto_5730 ?auto_5738 ) ) ( not ( = ?auto_5732 ?auto_5745 ) ) ( not ( = ?auto_5732 ?auto_5747 ) ) ( not ( = ?auto_5732 ?auto_5740 ) ) ( not ( = ?auto_5735 ?auto_5742 ) ) ( not ( = ?auto_5735 ?auto_5746 ) ) ( not ( = ?auto_5735 ?auto_5739 ) ) ( not ( = ?auto_5736 ?auto_5741 ) ) ( not ( = ?auto_5736 ?auto_5743 ) ) ( not ( = ?auto_5736 ?auto_5744 ) ) ( not ( = ?auto_5738 ?auto_5745 ) ) ( not ( = ?auto_5738 ?auto_5747 ) ) ( not ( = ?auto_5738 ?auto_5740 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_5728 ?auto_5729 ?auto_5730 ?auto_5731 )
      ( MAKE-1CRATE ?auto_5731 ?auto_5732 )
      ( MAKE-4CRATE-VERIFY ?auto_5728 ?auto_5729 ?auto_5730 ?auto_5731 ?auto_5732 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_5764 - SURFACE
      ?auto_5765 - SURFACE
      ?auto_5766 - SURFACE
      ?auto_5767 - SURFACE
      ?auto_5768 - SURFACE
      ?auto_5769 - SURFACE
    )
    :vars
    (
      ?auto_5772 - HOIST
      ?auto_5773 - PLACE
      ?auto_5775 - PLACE
      ?auto_5774 - HOIST
      ?auto_5770 - SURFACE
      ?auto_5776 - PLACE
      ?auto_5781 - HOIST
      ?auto_5777 - SURFACE
      ?auto_5782 - SURFACE
      ?auto_5783 - PLACE
      ?auto_5785 - HOIST
      ?auto_5779 - SURFACE
      ?auto_5778 - PLACE
      ?auto_5784 - HOIST
      ?auto_5780 - SURFACE
      ?auto_5771 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5772 ?auto_5773 ) ( IS-CRATE ?auto_5769 ) ( not ( = ?auto_5775 ?auto_5773 ) ) ( HOIST-AT ?auto_5774 ?auto_5775 ) ( SURFACE-AT ?auto_5769 ?auto_5775 ) ( ON ?auto_5769 ?auto_5770 ) ( CLEAR ?auto_5769 ) ( not ( = ?auto_5768 ?auto_5769 ) ) ( not ( = ?auto_5768 ?auto_5770 ) ) ( not ( = ?auto_5769 ?auto_5770 ) ) ( not ( = ?auto_5772 ?auto_5774 ) ) ( IS-CRATE ?auto_5768 ) ( not ( = ?auto_5776 ?auto_5773 ) ) ( HOIST-AT ?auto_5781 ?auto_5776 ) ( AVAILABLE ?auto_5781 ) ( SURFACE-AT ?auto_5768 ?auto_5776 ) ( ON ?auto_5768 ?auto_5777 ) ( CLEAR ?auto_5768 ) ( not ( = ?auto_5767 ?auto_5768 ) ) ( not ( = ?auto_5767 ?auto_5777 ) ) ( not ( = ?auto_5768 ?auto_5777 ) ) ( not ( = ?auto_5772 ?auto_5781 ) ) ( IS-CRATE ?auto_5767 ) ( AVAILABLE ?auto_5774 ) ( SURFACE-AT ?auto_5767 ?auto_5775 ) ( ON ?auto_5767 ?auto_5782 ) ( CLEAR ?auto_5767 ) ( not ( = ?auto_5766 ?auto_5767 ) ) ( not ( = ?auto_5766 ?auto_5782 ) ) ( not ( = ?auto_5767 ?auto_5782 ) ) ( IS-CRATE ?auto_5766 ) ( not ( = ?auto_5783 ?auto_5773 ) ) ( HOIST-AT ?auto_5785 ?auto_5783 ) ( AVAILABLE ?auto_5785 ) ( SURFACE-AT ?auto_5766 ?auto_5783 ) ( ON ?auto_5766 ?auto_5779 ) ( CLEAR ?auto_5766 ) ( not ( = ?auto_5765 ?auto_5766 ) ) ( not ( = ?auto_5765 ?auto_5779 ) ) ( not ( = ?auto_5766 ?auto_5779 ) ) ( not ( = ?auto_5772 ?auto_5785 ) ) ( SURFACE-AT ?auto_5764 ?auto_5773 ) ( CLEAR ?auto_5764 ) ( IS-CRATE ?auto_5765 ) ( AVAILABLE ?auto_5772 ) ( not ( = ?auto_5778 ?auto_5773 ) ) ( HOIST-AT ?auto_5784 ?auto_5778 ) ( AVAILABLE ?auto_5784 ) ( SURFACE-AT ?auto_5765 ?auto_5778 ) ( ON ?auto_5765 ?auto_5780 ) ( CLEAR ?auto_5765 ) ( TRUCK-AT ?auto_5771 ?auto_5773 ) ( not ( = ?auto_5764 ?auto_5765 ) ) ( not ( = ?auto_5764 ?auto_5780 ) ) ( not ( = ?auto_5765 ?auto_5780 ) ) ( not ( = ?auto_5772 ?auto_5784 ) ) ( not ( = ?auto_5764 ?auto_5766 ) ) ( not ( = ?auto_5764 ?auto_5779 ) ) ( not ( = ?auto_5766 ?auto_5780 ) ) ( not ( = ?auto_5783 ?auto_5778 ) ) ( not ( = ?auto_5785 ?auto_5784 ) ) ( not ( = ?auto_5779 ?auto_5780 ) ) ( not ( = ?auto_5764 ?auto_5767 ) ) ( not ( = ?auto_5764 ?auto_5782 ) ) ( not ( = ?auto_5765 ?auto_5767 ) ) ( not ( = ?auto_5765 ?auto_5782 ) ) ( not ( = ?auto_5767 ?auto_5779 ) ) ( not ( = ?auto_5767 ?auto_5780 ) ) ( not ( = ?auto_5775 ?auto_5783 ) ) ( not ( = ?auto_5775 ?auto_5778 ) ) ( not ( = ?auto_5774 ?auto_5785 ) ) ( not ( = ?auto_5774 ?auto_5784 ) ) ( not ( = ?auto_5782 ?auto_5779 ) ) ( not ( = ?auto_5782 ?auto_5780 ) ) ( not ( = ?auto_5764 ?auto_5768 ) ) ( not ( = ?auto_5764 ?auto_5777 ) ) ( not ( = ?auto_5765 ?auto_5768 ) ) ( not ( = ?auto_5765 ?auto_5777 ) ) ( not ( = ?auto_5766 ?auto_5768 ) ) ( not ( = ?auto_5766 ?auto_5777 ) ) ( not ( = ?auto_5768 ?auto_5782 ) ) ( not ( = ?auto_5768 ?auto_5779 ) ) ( not ( = ?auto_5768 ?auto_5780 ) ) ( not ( = ?auto_5776 ?auto_5775 ) ) ( not ( = ?auto_5776 ?auto_5783 ) ) ( not ( = ?auto_5776 ?auto_5778 ) ) ( not ( = ?auto_5781 ?auto_5774 ) ) ( not ( = ?auto_5781 ?auto_5785 ) ) ( not ( = ?auto_5781 ?auto_5784 ) ) ( not ( = ?auto_5777 ?auto_5782 ) ) ( not ( = ?auto_5777 ?auto_5779 ) ) ( not ( = ?auto_5777 ?auto_5780 ) ) ( not ( = ?auto_5764 ?auto_5769 ) ) ( not ( = ?auto_5764 ?auto_5770 ) ) ( not ( = ?auto_5765 ?auto_5769 ) ) ( not ( = ?auto_5765 ?auto_5770 ) ) ( not ( = ?auto_5766 ?auto_5769 ) ) ( not ( = ?auto_5766 ?auto_5770 ) ) ( not ( = ?auto_5767 ?auto_5769 ) ) ( not ( = ?auto_5767 ?auto_5770 ) ) ( not ( = ?auto_5769 ?auto_5777 ) ) ( not ( = ?auto_5769 ?auto_5782 ) ) ( not ( = ?auto_5769 ?auto_5779 ) ) ( not ( = ?auto_5769 ?auto_5780 ) ) ( not ( = ?auto_5770 ?auto_5777 ) ) ( not ( = ?auto_5770 ?auto_5782 ) ) ( not ( = ?auto_5770 ?auto_5779 ) ) ( not ( = ?auto_5770 ?auto_5780 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_5764 ?auto_5765 ?auto_5766 ?auto_5767 ?auto_5768 )
      ( MAKE-1CRATE ?auto_5768 ?auto_5769 )
      ( MAKE-5CRATE-VERIFY ?auto_5764 ?auto_5765 ?auto_5766 ?auto_5767 ?auto_5768 ?auto_5769 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_5803 - SURFACE
      ?auto_5804 - SURFACE
      ?auto_5805 - SURFACE
      ?auto_5806 - SURFACE
      ?auto_5807 - SURFACE
      ?auto_5808 - SURFACE
      ?auto_5809 - SURFACE
    )
    :vars
    (
      ?auto_5814 - HOIST
      ?auto_5815 - PLACE
      ?auto_5813 - PLACE
      ?auto_5812 - HOIST
      ?auto_5810 - SURFACE
      ?auto_5820 - SURFACE
      ?auto_5819 - PLACE
      ?auto_5825 - HOIST
      ?auto_5826 - SURFACE
      ?auto_5824 - SURFACE
      ?auto_5816 - PLACE
      ?auto_5818 - HOIST
      ?auto_5822 - SURFACE
      ?auto_5821 - PLACE
      ?auto_5817 - HOIST
      ?auto_5823 - SURFACE
      ?auto_5811 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5814 ?auto_5815 ) ( IS-CRATE ?auto_5809 ) ( not ( = ?auto_5813 ?auto_5815 ) ) ( HOIST-AT ?auto_5812 ?auto_5813 ) ( SURFACE-AT ?auto_5809 ?auto_5813 ) ( ON ?auto_5809 ?auto_5810 ) ( CLEAR ?auto_5809 ) ( not ( = ?auto_5808 ?auto_5809 ) ) ( not ( = ?auto_5808 ?auto_5810 ) ) ( not ( = ?auto_5809 ?auto_5810 ) ) ( not ( = ?auto_5814 ?auto_5812 ) ) ( IS-CRATE ?auto_5808 ) ( SURFACE-AT ?auto_5808 ?auto_5813 ) ( ON ?auto_5808 ?auto_5820 ) ( CLEAR ?auto_5808 ) ( not ( = ?auto_5807 ?auto_5808 ) ) ( not ( = ?auto_5807 ?auto_5820 ) ) ( not ( = ?auto_5808 ?auto_5820 ) ) ( IS-CRATE ?auto_5807 ) ( not ( = ?auto_5819 ?auto_5815 ) ) ( HOIST-AT ?auto_5825 ?auto_5819 ) ( AVAILABLE ?auto_5825 ) ( SURFACE-AT ?auto_5807 ?auto_5819 ) ( ON ?auto_5807 ?auto_5826 ) ( CLEAR ?auto_5807 ) ( not ( = ?auto_5806 ?auto_5807 ) ) ( not ( = ?auto_5806 ?auto_5826 ) ) ( not ( = ?auto_5807 ?auto_5826 ) ) ( not ( = ?auto_5814 ?auto_5825 ) ) ( IS-CRATE ?auto_5806 ) ( AVAILABLE ?auto_5812 ) ( SURFACE-AT ?auto_5806 ?auto_5813 ) ( ON ?auto_5806 ?auto_5824 ) ( CLEAR ?auto_5806 ) ( not ( = ?auto_5805 ?auto_5806 ) ) ( not ( = ?auto_5805 ?auto_5824 ) ) ( not ( = ?auto_5806 ?auto_5824 ) ) ( IS-CRATE ?auto_5805 ) ( not ( = ?auto_5816 ?auto_5815 ) ) ( HOIST-AT ?auto_5818 ?auto_5816 ) ( AVAILABLE ?auto_5818 ) ( SURFACE-AT ?auto_5805 ?auto_5816 ) ( ON ?auto_5805 ?auto_5822 ) ( CLEAR ?auto_5805 ) ( not ( = ?auto_5804 ?auto_5805 ) ) ( not ( = ?auto_5804 ?auto_5822 ) ) ( not ( = ?auto_5805 ?auto_5822 ) ) ( not ( = ?auto_5814 ?auto_5818 ) ) ( SURFACE-AT ?auto_5803 ?auto_5815 ) ( CLEAR ?auto_5803 ) ( IS-CRATE ?auto_5804 ) ( AVAILABLE ?auto_5814 ) ( not ( = ?auto_5821 ?auto_5815 ) ) ( HOIST-AT ?auto_5817 ?auto_5821 ) ( AVAILABLE ?auto_5817 ) ( SURFACE-AT ?auto_5804 ?auto_5821 ) ( ON ?auto_5804 ?auto_5823 ) ( CLEAR ?auto_5804 ) ( TRUCK-AT ?auto_5811 ?auto_5815 ) ( not ( = ?auto_5803 ?auto_5804 ) ) ( not ( = ?auto_5803 ?auto_5823 ) ) ( not ( = ?auto_5804 ?auto_5823 ) ) ( not ( = ?auto_5814 ?auto_5817 ) ) ( not ( = ?auto_5803 ?auto_5805 ) ) ( not ( = ?auto_5803 ?auto_5822 ) ) ( not ( = ?auto_5805 ?auto_5823 ) ) ( not ( = ?auto_5816 ?auto_5821 ) ) ( not ( = ?auto_5818 ?auto_5817 ) ) ( not ( = ?auto_5822 ?auto_5823 ) ) ( not ( = ?auto_5803 ?auto_5806 ) ) ( not ( = ?auto_5803 ?auto_5824 ) ) ( not ( = ?auto_5804 ?auto_5806 ) ) ( not ( = ?auto_5804 ?auto_5824 ) ) ( not ( = ?auto_5806 ?auto_5822 ) ) ( not ( = ?auto_5806 ?auto_5823 ) ) ( not ( = ?auto_5813 ?auto_5816 ) ) ( not ( = ?auto_5813 ?auto_5821 ) ) ( not ( = ?auto_5812 ?auto_5818 ) ) ( not ( = ?auto_5812 ?auto_5817 ) ) ( not ( = ?auto_5824 ?auto_5822 ) ) ( not ( = ?auto_5824 ?auto_5823 ) ) ( not ( = ?auto_5803 ?auto_5807 ) ) ( not ( = ?auto_5803 ?auto_5826 ) ) ( not ( = ?auto_5804 ?auto_5807 ) ) ( not ( = ?auto_5804 ?auto_5826 ) ) ( not ( = ?auto_5805 ?auto_5807 ) ) ( not ( = ?auto_5805 ?auto_5826 ) ) ( not ( = ?auto_5807 ?auto_5824 ) ) ( not ( = ?auto_5807 ?auto_5822 ) ) ( not ( = ?auto_5807 ?auto_5823 ) ) ( not ( = ?auto_5819 ?auto_5813 ) ) ( not ( = ?auto_5819 ?auto_5816 ) ) ( not ( = ?auto_5819 ?auto_5821 ) ) ( not ( = ?auto_5825 ?auto_5812 ) ) ( not ( = ?auto_5825 ?auto_5818 ) ) ( not ( = ?auto_5825 ?auto_5817 ) ) ( not ( = ?auto_5826 ?auto_5824 ) ) ( not ( = ?auto_5826 ?auto_5822 ) ) ( not ( = ?auto_5826 ?auto_5823 ) ) ( not ( = ?auto_5803 ?auto_5808 ) ) ( not ( = ?auto_5803 ?auto_5820 ) ) ( not ( = ?auto_5804 ?auto_5808 ) ) ( not ( = ?auto_5804 ?auto_5820 ) ) ( not ( = ?auto_5805 ?auto_5808 ) ) ( not ( = ?auto_5805 ?auto_5820 ) ) ( not ( = ?auto_5806 ?auto_5808 ) ) ( not ( = ?auto_5806 ?auto_5820 ) ) ( not ( = ?auto_5808 ?auto_5826 ) ) ( not ( = ?auto_5808 ?auto_5824 ) ) ( not ( = ?auto_5808 ?auto_5822 ) ) ( not ( = ?auto_5808 ?auto_5823 ) ) ( not ( = ?auto_5820 ?auto_5826 ) ) ( not ( = ?auto_5820 ?auto_5824 ) ) ( not ( = ?auto_5820 ?auto_5822 ) ) ( not ( = ?auto_5820 ?auto_5823 ) ) ( not ( = ?auto_5803 ?auto_5809 ) ) ( not ( = ?auto_5803 ?auto_5810 ) ) ( not ( = ?auto_5804 ?auto_5809 ) ) ( not ( = ?auto_5804 ?auto_5810 ) ) ( not ( = ?auto_5805 ?auto_5809 ) ) ( not ( = ?auto_5805 ?auto_5810 ) ) ( not ( = ?auto_5806 ?auto_5809 ) ) ( not ( = ?auto_5806 ?auto_5810 ) ) ( not ( = ?auto_5807 ?auto_5809 ) ) ( not ( = ?auto_5807 ?auto_5810 ) ) ( not ( = ?auto_5809 ?auto_5820 ) ) ( not ( = ?auto_5809 ?auto_5826 ) ) ( not ( = ?auto_5809 ?auto_5824 ) ) ( not ( = ?auto_5809 ?auto_5822 ) ) ( not ( = ?auto_5809 ?auto_5823 ) ) ( not ( = ?auto_5810 ?auto_5820 ) ) ( not ( = ?auto_5810 ?auto_5826 ) ) ( not ( = ?auto_5810 ?auto_5824 ) ) ( not ( = ?auto_5810 ?auto_5822 ) ) ( not ( = ?auto_5810 ?auto_5823 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_5803 ?auto_5804 ?auto_5805 ?auto_5806 ?auto_5807 ?auto_5808 )
      ( MAKE-1CRATE ?auto_5808 ?auto_5809 )
      ( MAKE-6CRATE-VERIFY ?auto_5803 ?auto_5804 ?auto_5805 ?auto_5806 ?auto_5807 ?auto_5808 ?auto_5809 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_5845 - SURFACE
      ?auto_5846 - SURFACE
      ?auto_5847 - SURFACE
      ?auto_5848 - SURFACE
      ?auto_5849 - SURFACE
      ?auto_5850 - SURFACE
      ?auto_5851 - SURFACE
      ?auto_5852 - SURFACE
    )
    :vars
    (
      ?auto_5857 - HOIST
      ?auto_5856 - PLACE
      ?auto_5858 - PLACE
      ?auto_5853 - HOIST
      ?auto_5854 - SURFACE
      ?auto_5866 - PLACE
      ?auto_5868 - HOIST
      ?auto_5867 - SURFACE
      ?auto_5861 - SURFACE
      ?auto_5865 - PLACE
      ?auto_5862 - HOIST
      ?auto_5869 - SURFACE
      ?auto_5870 - SURFACE
      ?auto_5859 - PLACE
      ?auto_5863 - HOIST
      ?auto_5864 - SURFACE
      ?auto_5860 - SURFACE
      ?auto_5855 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5857 ?auto_5856 ) ( IS-CRATE ?auto_5852 ) ( not ( = ?auto_5858 ?auto_5856 ) ) ( HOIST-AT ?auto_5853 ?auto_5858 ) ( SURFACE-AT ?auto_5852 ?auto_5858 ) ( ON ?auto_5852 ?auto_5854 ) ( CLEAR ?auto_5852 ) ( not ( = ?auto_5851 ?auto_5852 ) ) ( not ( = ?auto_5851 ?auto_5854 ) ) ( not ( = ?auto_5852 ?auto_5854 ) ) ( not ( = ?auto_5857 ?auto_5853 ) ) ( IS-CRATE ?auto_5851 ) ( not ( = ?auto_5866 ?auto_5856 ) ) ( HOIST-AT ?auto_5868 ?auto_5866 ) ( SURFACE-AT ?auto_5851 ?auto_5866 ) ( ON ?auto_5851 ?auto_5867 ) ( CLEAR ?auto_5851 ) ( not ( = ?auto_5850 ?auto_5851 ) ) ( not ( = ?auto_5850 ?auto_5867 ) ) ( not ( = ?auto_5851 ?auto_5867 ) ) ( not ( = ?auto_5857 ?auto_5868 ) ) ( IS-CRATE ?auto_5850 ) ( SURFACE-AT ?auto_5850 ?auto_5866 ) ( ON ?auto_5850 ?auto_5861 ) ( CLEAR ?auto_5850 ) ( not ( = ?auto_5849 ?auto_5850 ) ) ( not ( = ?auto_5849 ?auto_5861 ) ) ( not ( = ?auto_5850 ?auto_5861 ) ) ( IS-CRATE ?auto_5849 ) ( not ( = ?auto_5865 ?auto_5856 ) ) ( HOIST-AT ?auto_5862 ?auto_5865 ) ( AVAILABLE ?auto_5862 ) ( SURFACE-AT ?auto_5849 ?auto_5865 ) ( ON ?auto_5849 ?auto_5869 ) ( CLEAR ?auto_5849 ) ( not ( = ?auto_5848 ?auto_5849 ) ) ( not ( = ?auto_5848 ?auto_5869 ) ) ( not ( = ?auto_5849 ?auto_5869 ) ) ( not ( = ?auto_5857 ?auto_5862 ) ) ( IS-CRATE ?auto_5848 ) ( AVAILABLE ?auto_5868 ) ( SURFACE-AT ?auto_5848 ?auto_5866 ) ( ON ?auto_5848 ?auto_5870 ) ( CLEAR ?auto_5848 ) ( not ( = ?auto_5847 ?auto_5848 ) ) ( not ( = ?auto_5847 ?auto_5870 ) ) ( not ( = ?auto_5848 ?auto_5870 ) ) ( IS-CRATE ?auto_5847 ) ( not ( = ?auto_5859 ?auto_5856 ) ) ( HOIST-AT ?auto_5863 ?auto_5859 ) ( AVAILABLE ?auto_5863 ) ( SURFACE-AT ?auto_5847 ?auto_5859 ) ( ON ?auto_5847 ?auto_5864 ) ( CLEAR ?auto_5847 ) ( not ( = ?auto_5846 ?auto_5847 ) ) ( not ( = ?auto_5846 ?auto_5864 ) ) ( not ( = ?auto_5847 ?auto_5864 ) ) ( not ( = ?auto_5857 ?auto_5863 ) ) ( SURFACE-AT ?auto_5845 ?auto_5856 ) ( CLEAR ?auto_5845 ) ( IS-CRATE ?auto_5846 ) ( AVAILABLE ?auto_5857 ) ( AVAILABLE ?auto_5853 ) ( SURFACE-AT ?auto_5846 ?auto_5858 ) ( ON ?auto_5846 ?auto_5860 ) ( CLEAR ?auto_5846 ) ( TRUCK-AT ?auto_5855 ?auto_5856 ) ( not ( = ?auto_5845 ?auto_5846 ) ) ( not ( = ?auto_5845 ?auto_5860 ) ) ( not ( = ?auto_5846 ?auto_5860 ) ) ( not ( = ?auto_5845 ?auto_5847 ) ) ( not ( = ?auto_5845 ?auto_5864 ) ) ( not ( = ?auto_5847 ?auto_5860 ) ) ( not ( = ?auto_5859 ?auto_5858 ) ) ( not ( = ?auto_5863 ?auto_5853 ) ) ( not ( = ?auto_5864 ?auto_5860 ) ) ( not ( = ?auto_5845 ?auto_5848 ) ) ( not ( = ?auto_5845 ?auto_5870 ) ) ( not ( = ?auto_5846 ?auto_5848 ) ) ( not ( = ?auto_5846 ?auto_5870 ) ) ( not ( = ?auto_5848 ?auto_5864 ) ) ( not ( = ?auto_5848 ?auto_5860 ) ) ( not ( = ?auto_5866 ?auto_5859 ) ) ( not ( = ?auto_5866 ?auto_5858 ) ) ( not ( = ?auto_5868 ?auto_5863 ) ) ( not ( = ?auto_5868 ?auto_5853 ) ) ( not ( = ?auto_5870 ?auto_5864 ) ) ( not ( = ?auto_5870 ?auto_5860 ) ) ( not ( = ?auto_5845 ?auto_5849 ) ) ( not ( = ?auto_5845 ?auto_5869 ) ) ( not ( = ?auto_5846 ?auto_5849 ) ) ( not ( = ?auto_5846 ?auto_5869 ) ) ( not ( = ?auto_5847 ?auto_5849 ) ) ( not ( = ?auto_5847 ?auto_5869 ) ) ( not ( = ?auto_5849 ?auto_5870 ) ) ( not ( = ?auto_5849 ?auto_5864 ) ) ( not ( = ?auto_5849 ?auto_5860 ) ) ( not ( = ?auto_5865 ?auto_5866 ) ) ( not ( = ?auto_5865 ?auto_5859 ) ) ( not ( = ?auto_5865 ?auto_5858 ) ) ( not ( = ?auto_5862 ?auto_5868 ) ) ( not ( = ?auto_5862 ?auto_5863 ) ) ( not ( = ?auto_5862 ?auto_5853 ) ) ( not ( = ?auto_5869 ?auto_5870 ) ) ( not ( = ?auto_5869 ?auto_5864 ) ) ( not ( = ?auto_5869 ?auto_5860 ) ) ( not ( = ?auto_5845 ?auto_5850 ) ) ( not ( = ?auto_5845 ?auto_5861 ) ) ( not ( = ?auto_5846 ?auto_5850 ) ) ( not ( = ?auto_5846 ?auto_5861 ) ) ( not ( = ?auto_5847 ?auto_5850 ) ) ( not ( = ?auto_5847 ?auto_5861 ) ) ( not ( = ?auto_5848 ?auto_5850 ) ) ( not ( = ?auto_5848 ?auto_5861 ) ) ( not ( = ?auto_5850 ?auto_5869 ) ) ( not ( = ?auto_5850 ?auto_5870 ) ) ( not ( = ?auto_5850 ?auto_5864 ) ) ( not ( = ?auto_5850 ?auto_5860 ) ) ( not ( = ?auto_5861 ?auto_5869 ) ) ( not ( = ?auto_5861 ?auto_5870 ) ) ( not ( = ?auto_5861 ?auto_5864 ) ) ( not ( = ?auto_5861 ?auto_5860 ) ) ( not ( = ?auto_5845 ?auto_5851 ) ) ( not ( = ?auto_5845 ?auto_5867 ) ) ( not ( = ?auto_5846 ?auto_5851 ) ) ( not ( = ?auto_5846 ?auto_5867 ) ) ( not ( = ?auto_5847 ?auto_5851 ) ) ( not ( = ?auto_5847 ?auto_5867 ) ) ( not ( = ?auto_5848 ?auto_5851 ) ) ( not ( = ?auto_5848 ?auto_5867 ) ) ( not ( = ?auto_5849 ?auto_5851 ) ) ( not ( = ?auto_5849 ?auto_5867 ) ) ( not ( = ?auto_5851 ?auto_5861 ) ) ( not ( = ?auto_5851 ?auto_5869 ) ) ( not ( = ?auto_5851 ?auto_5870 ) ) ( not ( = ?auto_5851 ?auto_5864 ) ) ( not ( = ?auto_5851 ?auto_5860 ) ) ( not ( = ?auto_5867 ?auto_5861 ) ) ( not ( = ?auto_5867 ?auto_5869 ) ) ( not ( = ?auto_5867 ?auto_5870 ) ) ( not ( = ?auto_5867 ?auto_5864 ) ) ( not ( = ?auto_5867 ?auto_5860 ) ) ( not ( = ?auto_5845 ?auto_5852 ) ) ( not ( = ?auto_5845 ?auto_5854 ) ) ( not ( = ?auto_5846 ?auto_5852 ) ) ( not ( = ?auto_5846 ?auto_5854 ) ) ( not ( = ?auto_5847 ?auto_5852 ) ) ( not ( = ?auto_5847 ?auto_5854 ) ) ( not ( = ?auto_5848 ?auto_5852 ) ) ( not ( = ?auto_5848 ?auto_5854 ) ) ( not ( = ?auto_5849 ?auto_5852 ) ) ( not ( = ?auto_5849 ?auto_5854 ) ) ( not ( = ?auto_5850 ?auto_5852 ) ) ( not ( = ?auto_5850 ?auto_5854 ) ) ( not ( = ?auto_5852 ?auto_5867 ) ) ( not ( = ?auto_5852 ?auto_5861 ) ) ( not ( = ?auto_5852 ?auto_5869 ) ) ( not ( = ?auto_5852 ?auto_5870 ) ) ( not ( = ?auto_5852 ?auto_5864 ) ) ( not ( = ?auto_5852 ?auto_5860 ) ) ( not ( = ?auto_5854 ?auto_5867 ) ) ( not ( = ?auto_5854 ?auto_5861 ) ) ( not ( = ?auto_5854 ?auto_5869 ) ) ( not ( = ?auto_5854 ?auto_5870 ) ) ( not ( = ?auto_5854 ?auto_5864 ) ) ( not ( = ?auto_5854 ?auto_5860 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_5845 ?auto_5846 ?auto_5847 ?auto_5848 ?auto_5849 ?auto_5850 ?auto_5851 )
      ( MAKE-1CRATE ?auto_5851 ?auto_5852 )
      ( MAKE-7CRATE-VERIFY ?auto_5845 ?auto_5846 ?auto_5847 ?auto_5848 ?auto_5849 ?auto_5850 ?auto_5851 ?auto_5852 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_5890 - SURFACE
      ?auto_5891 - SURFACE
      ?auto_5892 - SURFACE
      ?auto_5893 - SURFACE
      ?auto_5894 - SURFACE
      ?auto_5895 - SURFACE
      ?auto_5896 - SURFACE
      ?auto_5897 - SURFACE
      ?auto_5898 - SURFACE
    )
    :vars
    (
      ?auto_5903 - HOIST
      ?auto_5902 - PLACE
      ?auto_5904 - PLACE
      ?auto_5900 - HOIST
      ?auto_5899 - SURFACE
      ?auto_5910 - PLACE
      ?auto_5911 - HOIST
      ?auto_5912 - SURFACE
      ?auto_5906 - PLACE
      ?auto_5917 - HOIST
      ?auto_5909 - SURFACE
      ?auto_5915 - SURFACE
      ?auto_5907 - PLACE
      ?auto_5916 - HOIST
      ?auto_5905 - SURFACE
      ?auto_5914 - SURFACE
      ?auto_5908 - SURFACE
      ?auto_5913 - SURFACE
      ?auto_5901 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5903 ?auto_5902 ) ( IS-CRATE ?auto_5898 ) ( not ( = ?auto_5904 ?auto_5902 ) ) ( HOIST-AT ?auto_5900 ?auto_5904 ) ( SURFACE-AT ?auto_5898 ?auto_5904 ) ( ON ?auto_5898 ?auto_5899 ) ( CLEAR ?auto_5898 ) ( not ( = ?auto_5897 ?auto_5898 ) ) ( not ( = ?auto_5897 ?auto_5899 ) ) ( not ( = ?auto_5898 ?auto_5899 ) ) ( not ( = ?auto_5903 ?auto_5900 ) ) ( IS-CRATE ?auto_5897 ) ( not ( = ?auto_5910 ?auto_5902 ) ) ( HOIST-AT ?auto_5911 ?auto_5910 ) ( SURFACE-AT ?auto_5897 ?auto_5910 ) ( ON ?auto_5897 ?auto_5912 ) ( CLEAR ?auto_5897 ) ( not ( = ?auto_5896 ?auto_5897 ) ) ( not ( = ?auto_5896 ?auto_5912 ) ) ( not ( = ?auto_5897 ?auto_5912 ) ) ( not ( = ?auto_5903 ?auto_5911 ) ) ( IS-CRATE ?auto_5896 ) ( not ( = ?auto_5906 ?auto_5902 ) ) ( HOIST-AT ?auto_5917 ?auto_5906 ) ( SURFACE-AT ?auto_5896 ?auto_5906 ) ( ON ?auto_5896 ?auto_5909 ) ( CLEAR ?auto_5896 ) ( not ( = ?auto_5895 ?auto_5896 ) ) ( not ( = ?auto_5895 ?auto_5909 ) ) ( not ( = ?auto_5896 ?auto_5909 ) ) ( not ( = ?auto_5903 ?auto_5917 ) ) ( IS-CRATE ?auto_5895 ) ( SURFACE-AT ?auto_5895 ?auto_5906 ) ( ON ?auto_5895 ?auto_5915 ) ( CLEAR ?auto_5895 ) ( not ( = ?auto_5894 ?auto_5895 ) ) ( not ( = ?auto_5894 ?auto_5915 ) ) ( not ( = ?auto_5895 ?auto_5915 ) ) ( IS-CRATE ?auto_5894 ) ( not ( = ?auto_5907 ?auto_5902 ) ) ( HOIST-AT ?auto_5916 ?auto_5907 ) ( AVAILABLE ?auto_5916 ) ( SURFACE-AT ?auto_5894 ?auto_5907 ) ( ON ?auto_5894 ?auto_5905 ) ( CLEAR ?auto_5894 ) ( not ( = ?auto_5893 ?auto_5894 ) ) ( not ( = ?auto_5893 ?auto_5905 ) ) ( not ( = ?auto_5894 ?auto_5905 ) ) ( not ( = ?auto_5903 ?auto_5916 ) ) ( IS-CRATE ?auto_5893 ) ( AVAILABLE ?auto_5917 ) ( SURFACE-AT ?auto_5893 ?auto_5906 ) ( ON ?auto_5893 ?auto_5914 ) ( CLEAR ?auto_5893 ) ( not ( = ?auto_5892 ?auto_5893 ) ) ( not ( = ?auto_5892 ?auto_5914 ) ) ( not ( = ?auto_5893 ?auto_5914 ) ) ( IS-CRATE ?auto_5892 ) ( AVAILABLE ?auto_5900 ) ( SURFACE-AT ?auto_5892 ?auto_5904 ) ( ON ?auto_5892 ?auto_5908 ) ( CLEAR ?auto_5892 ) ( not ( = ?auto_5891 ?auto_5892 ) ) ( not ( = ?auto_5891 ?auto_5908 ) ) ( not ( = ?auto_5892 ?auto_5908 ) ) ( SURFACE-AT ?auto_5890 ?auto_5902 ) ( CLEAR ?auto_5890 ) ( IS-CRATE ?auto_5891 ) ( AVAILABLE ?auto_5903 ) ( AVAILABLE ?auto_5911 ) ( SURFACE-AT ?auto_5891 ?auto_5910 ) ( ON ?auto_5891 ?auto_5913 ) ( CLEAR ?auto_5891 ) ( TRUCK-AT ?auto_5901 ?auto_5902 ) ( not ( = ?auto_5890 ?auto_5891 ) ) ( not ( = ?auto_5890 ?auto_5913 ) ) ( not ( = ?auto_5891 ?auto_5913 ) ) ( not ( = ?auto_5890 ?auto_5892 ) ) ( not ( = ?auto_5890 ?auto_5908 ) ) ( not ( = ?auto_5892 ?auto_5913 ) ) ( not ( = ?auto_5904 ?auto_5910 ) ) ( not ( = ?auto_5900 ?auto_5911 ) ) ( not ( = ?auto_5908 ?auto_5913 ) ) ( not ( = ?auto_5890 ?auto_5893 ) ) ( not ( = ?auto_5890 ?auto_5914 ) ) ( not ( = ?auto_5891 ?auto_5893 ) ) ( not ( = ?auto_5891 ?auto_5914 ) ) ( not ( = ?auto_5893 ?auto_5908 ) ) ( not ( = ?auto_5893 ?auto_5913 ) ) ( not ( = ?auto_5906 ?auto_5904 ) ) ( not ( = ?auto_5906 ?auto_5910 ) ) ( not ( = ?auto_5917 ?auto_5900 ) ) ( not ( = ?auto_5917 ?auto_5911 ) ) ( not ( = ?auto_5914 ?auto_5908 ) ) ( not ( = ?auto_5914 ?auto_5913 ) ) ( not ( = ?auto_5890 ?auto_5894 ) ) ( not ( = ?auto_5890 ?auto_5905 ) ) ( not ( = ?auto_5891 ?auto_5894 ) ) ( not ( = ?auto_5891 ?auto_5905 ) ) ( not ( = ?auto_5892 ?auto_5894 ) ) ( not ( = ?auto_5892 ?auto_5905 ) ) ( not ( = ?auto_5894 ?auto_5914 ) ) ( not ( = ?auto_5894 ?auto_5908 ) ) ( not ( = ?auto_5894 ?auto_5913 ) ) ( not ( = ?auto_5907 ?auto_5906 ) ) ( not ( = ?auto_5907 ?auto_5904 ) ) ( not ( = ?auto_5907 ?auto_5910 ) ) ( not ( = ?auto_5916 ?auto_5917 ) ) ( not ( = ?auto_5916 ?auto_5900 ) ) ( not ( = ?auto_5916 ?auto_5911 ) ) ( not ( = ?auto_5905 ?auto_5914 ) ) ( not ( = ?auto_5905 ?auto_5908 ) ) ( not ( = ?auto_5905 ?auto_5913 ) ) ( not ( = ?auto_5890 ?auto_5895 ) ) ( not ( = ?auto_5890 ?auto_5915 ) ) ( not ( = ?auto_5891 ?auto_5895 ) ) ( not ( = ?auto_5891 ?auto_5915 ) ) ( not ( = ?auto_5892 ?auto_5895 ) ) ( not ( = ?auto_5892 ?auto_5915 ) ) ( not ( = ?auto_5893 ?auto_5895 ) ) ( not ( = ?auto_5893 ?auto_5915 ) ) ( not ( = ?auto_5895 ?auto_5905 ) ) ( not ( = ?auto_5895 ?auto_5914 ) ) ( not ( = ?auto_5895 ?auto_5908 ) ) ( not ( = ?auto_5895 ?auto_5913 ) ) ( not ( = ?auto_5915 ?auto_5905 ) ) ( not ( = ?auto_5915 ?auto_5914 ) ) ( not ( = ?auto_5915 ?auto_5908 ) ) ( not ( = ?auto_5915 ?auto_5913 ) ) ( not ( = ?auto_5890 ?auto_5896 ) ) ( not ( = ?auto_5890 ?auto_5909 ) ) ( not ( = ?auto_5891 ?auto_5896 ) ) ( not ( = ?auto_5891 ?auto_5909 ) ) ( not ( = ?auto_5892 ?auto_5896 ) ) ( not ( = ?auto_5892 ?auto_5909 ) ) ( not ( = ?auto_5893 ?auto_5896 ) ) ( not ( = ?auto_5893 ?auto_5909 ) ) ( not ( = ?auto_5894 ?auto_5896 ) ) ( not ( = ?auto_5894 ?auto_5909 ) ) ( not ( = ?auto_5896 ?auto_5915 ) ) ( not ( = ?auto_5896 ?auto_5905 ) ) ( not ( = ?auto_5896 ?auto_5914 ) ) ( not ( = ?auto_5896 ?auto_5908 ) ) ( not ( = ?auto_5896 ?auto_5913 ) ) ( not ( = ?auto_5909 ?auto_5915 ) ) ( not ( = ?auto_5909 ?auto_5905 ) ) ( not ( = ?auto_5909 ?auto_5914 ) ) ( not ( = ?auto_5909 ?auto_5908 ) ) ( not ( = ?auto_5909 ?auto_5913 ) ) ( not ( = ?auto_5890 ?auto_5897 ) ) ( not ( = ?auto_5890 ?auto_5912 ) ) ( not ( = ?auto_5891 ?auto_5897 ) ) ( not ( = ?auto_5891 ?auto_5912 ) ) ( not ( = ?auto_5892 ?auto_5897 ) ) ( not ( = ?auto_5892 ?auto_5912 ) ) ( not ( = ?auto_5893 ?auto_5897 ) ) ( not ( = ?auto_5893 ?auto_5912 ) ) ( not ( = ?auto_5894 ?auto_5897 ) ) ( not ( = ?auto_5894 ?auto_5912 ) ) ( not ( = ?auto_5895 ?auto_5897 ) ) ( not ( = ?auto_5895 ?auto_5912 ) ) ( not ( = ?auto_5897 ?auto_5909 ) ) ( not ( = ?auto_5897 ?auto_5915 ) ) ( not ( = ?auto_5897 ?auto_5905 ) ) ( not ( = ?auto_5897 ?auto_5914 ) ) ( not ( = ?auto_5897 ?auto_5908 ) ) ( not ( = ?auto_5897 ?auto_5913 ) ) ( not ( = ?auto_5912 ?auto_5909 ) ) ( not ( = ?auto_5912 ?auto_5915 ) ) ( not ( = ?auto_5912 ?auto_5905 ) ) ( not ( = ?auto_5912 ?auto_5914 ) ) ( not ( = ?auto_5912 ?auto_5908 ) ) ( not ( = ?auto_5912 ?auto_5913 ) ) ( not ( = ?auto_5890 ?auto_5898 ) ) ( not ( = ?auto_5890 ?auto_5899 ) ) ( not ( = ?auto_5891 ?auto_5898 ) ) ( not ( = ?auto_5891 ?auto_5899 ) ) ( not ( = ?auto_5892 ?auto_5898 ) ) ( not ( = ?auto_5892 ?auto_5899 ) ) ( not ( = ?auto_5893 ?auto_5898 ) ) ( not ( = ?auto_5893 ?auto_5899 ) ) ( not ( = ?auto_5894 ?auto_5898 ) ) ( not ( = ?auto_5894 ?auto_5899 ) ) ( not ( = ?auto_5895 ?auto_5898 ) ) ( not ( = ?auto_5895 ?auto_5899 ) ) ( not ( = ?auto_5896 ?auto_5898 ) ) ( not ( = ?auto_5896 ?auto_5899 ) ) ( not ( = ?auto_5898 ?auto_5912 ) ) ( not ( = ?auto_5898 ?auto_5909 ) ) ( not ( = ?auto_5898 ?auto_5915 ) ) ( not ( = ?auto_5898 ?auto_5905 ) ) ( not ( = ?auto_5898 ?auto_5914 ) ) ( not ( = ?auto_5898 ?auto_5908 ) ) ( not ( = ?auto_5898 ?auto_5913 ) ) ( not ( = ?auto_5899 ?auto_5912 ) ) ( not ( = ?auto_5899 ?auto_5909 ) ) ( not ( = ?auto_5899 ?auto_5915 ) ) ( not ( = ?auto_5899 ?auto_5905 ) ) ( not ( = ?auto_5899 ?auto_5914 ) ) ( not ( = ?auto_5899 ?auto_5908 ) ) ( not ( = ?auto_5899 ?auto_5913 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_5890 ?auto_5891 ?auto_5892 ?auto_5893 ?auto_5894 ?auto_5895 ?auto_5896 ?auto_5897 )
      ( MAKE-1CRATE ?auto_5897 ?auto_5898 )
      ( MAKE-8CRATE-VERIFY ?auto_5890 ?auto_5891 ?auto_5892 ?auto_5893 ?auto_5894 ?auto_5895 ?auto_5896 ?auto_5897 ?auto_5898 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_5938 - SURFACE
      ?auto_5939 - SURFACE
      ?auto_5940 - SURFACE
      ?auto_5941 - SURFACE
      ?auto_5942 - SURFACE
      ?auto_5943 - SURFACE
      ?auto_5944 - SURFACE
      ?auto_5945 - SURFACE
      ?auto_5946 - SURFACE
      ?auto_5947 - SURFACE
    )
    :vars
    (
      ?auto_5951 - HOIST
      ?auto_5953 - PLACE
      ?auto_5952 - PLACE
      ?auto_5949 - HOIST
      ?auto_5950 - SURFACE
      ?auto_5966 - PLACE
      ?auto_5968 - HOIST
      ?auto_5965 - SURFACE
      ?auto_5969 - PLACE
      ?auto_5956 - HOIST
      ?auto_5957 - SURFACE
      ?auto_5958 - PLACE
      ?auto_5955 - HOIST
      ?auto_5963 - SURFACE
      ?auto_5954 - SURFACE
      ?auto_5962 - PLACE
      ?auto_5960 - HOIST
      ?auto_5961 - SURFACE
      ?auto_5959 - SURFACE
      ?auto_5964 - SURFACE
      ?auto_5967 - SURFACE
      ?auto_5948 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5951 ?auto_5953 ) ( IS-CRATE ?auto_5947 ) ( not ( = ?auto_5952 ?auto_5953 ) ) ( HOIST-AT ?auto_5949 ?auto_5952 ) ( AVAILABLE ?auto_5949 ) ( SURFACE-AT ?auto_5947 ?auto_5952 ) ( ON ?auto_5947 ?auto_5950 ) ( CLEAR ?auto_5947 ) ( not ( = ?auto_5946 ?auto_5947 ) ) ( not ( = ?auto_5946 ?auto_5950 ) ) ( not ( = ?auto_5947 ?auto_5950 ) ) ( not ( = ?auto_5951 ?auto_5949 ) ) ( IS-CRATE ?auto_5946 ) ( not ( = ?auto_5966 ?auto_5953 ) ) ( HOIST-AT ?auto_5968 ?auto_5966 ) ( SURFACE-AT ?auto_5946 ?auto_5966 ) ( ON ?auto_5946 ?auto_5965 ) ( CLEAR ?auto_5946 ) ( not ( = ?auto_5945 ?auto_5946 ) ) ( not ( = ?auto_5945 ?auto_5965 ) ) ( not ( = ?auto_5946 ?auto_5965 ) ) ( not ( = ?auto_5951 ?auto_5968 ) ) ( IS-CRATE ?auto_5945 ) ( not ( = ?auto_5969 ?auto_5953 ) ) ( HOIST-AT ?auto_5956 ?auto_5969 ) ( SURFACE-AT ?auto_5945 ?auto_5969 ) ( ON ?auto_5945 ?auto_5957 ) ( CLEAR ?auto_5945 ) ( not ( = ?auto_5944 ?auto_5945 ) ) ( not ( = ?auto_5944 ?auto_5957 ) ) ( not ( = ?auto_5945 ?auto_5957 ) ) ( not ( = ?auto_5951 ?auto_5956 ) ) ( IS-CRATE ?auto_5944 ) ( not ( = ?auto_5958 ?auto_5953 ) ) ( HOIST-AT ?auto_5955 ?auto_5958 ) ( SURFACE-AT ?auto_5944 ?auto_5958 ) ( ON ?auto_5944 ?auto_5963 ) ( CLEAR ?auto_5944 ) ( not ( = ?auto_5943 ?auto_5944 ) ) ( not ( = ?auto_5943 ?auto_5963 ) ) ( not ( = ?auto_5944 ?auto_5963 ) ) ( not ( = ?auto_5951 ?auto_5955 ) ) ( IS-CRATE ?auto_5943 ) ( SURFACE-AT ?auto_5943 ?auto_5958 ) ( ON ?auto_5943 ?auto_5954 ) ( CLEAR ?auto_5943 ) ( not ( = ?auto_5942 ?auto_5943 ) ) ( not ( = ?auto_5942 ?auto_5954 ) ) ( not ( = ?auto_5943 ?auto_5954 ) ) ( IS-CRATE ?auto_5942 ) ( not ( = ?auto_5962 ?auto_5953 ) ) ( HOIST-AT ?auto_5960 ?auto_5962 ) ( AVAILABLE ?auto_5960 ) ( SURFACE-AT ?auto_5942 ?auto_5962 ) ( ON ?auto_5942 ?auto_5961 ) ( CLEAR ?auto_5942 ) ( not ( = ?auto_5941 ?auto_5942 ) ) ( not ( = ?auto_5941 ?auto_5961 ) ) ( not ( = ?auto_5942 ?auto_5961 ) ) ( not ( = ?auto_5951 ?auto_5960 ) ) ( IS-CRATE ?auto_5941 ) ( AVAILABLE ?auto_5955 ) ( SURFACE-AT ?auto_5941 ?auto_5958 ) ( ON ?auto_5941 ?auto_5959 ) ( CLEAR ?auto_5941 ) ( not ( = ?auto_5940 ?auto_5941 ) ) ( not ( = ?auto_5940 ?auto_5959 ) ) ( not ( = ?auto_5941 ?auto_5959 ) ) ( IS-CRATE ?auto_5940 ) ( AVAILABLE ?auto_5968 ) ( SURFACE-AT ?auto_5940 ?auto_5966 ) ( ON ?auto_5940 ?auto_5964 ) ( CLEAR ?auto_5940 ) ( not ( = ?auto_5939 ?auto_5940 ) ) ( not ( = ?auto_5939 ?auto_5964 ) ) ( not ( = ?auto_5940 ?auto_5964 ) ) ( SURFACE-AT ?auto_5938 ?auto_5953 ) ( CLEAR ?auto_5938 ) ( IS-CRATE ?auto_5939 ) ( AVAILABLE ?auto_5951 ) ( AVAILABLE ?auto_5956 ) ( SURFACE-AT ?auto_5939 ?auto_5969 ) ( ON ?auto_5939 ?auto_5967 ) ( CLEAR ?auto_5939 ) ( TRUCK-AT ?auto_5948 ?auto_5953 ) ( not ( = ?auto_5938 ?auto_5939 ) ) ( not ( = ?auto_5938 ?auto_5967 ) ) ( not ( = ?auto_5939 ?auto_5967 ) ) ( not ( = ?auto_5938 ?auto_5940 ) ) ( not ( = ?auto_5938 ?auto_5964 ) ) ( not ( = ?auto_5940 ?auto_5967 ) ) ( not ( = ?auto_5966 ?auto_5969 ) ) ( not ( = ?auto_5968 ?auto_5956 ) ) ( not ( = ?auto_5964 ?auto_5967 ) ) ( not ( = ?auto_5938 ?auto_5941 ) ) ( not ( = ?auto_5938 ?auto_5959 ) ) ( not ( = ?auto_5939 ?auto_5941 ) ) ( not ( = ?auto_5939 ?auto_5959 ) ) ( not ( = ?auto_5941 ?auto_5964 ) ) ( not ( = ?auto_5941 ?auto_5967 ) ) ( not ( = ?auto_5958 ?auto_5966 ) ) ( not ( = ?auto_5958 ?auto_5969 ) ) ( not ( = ?auto_5955 ?auto_5968 ) ) ( not ( = ?auto_5955 ?auto_5956 ) ) ( not ( = ?auto_5959 ?auto_5964 ) ) ( not ( = ?auto_5959 ?auto_5967 ) ) ( not ( = ?auto_5938 ?auto_5942 ) ) ( not ( = ?auto_5938 ?auto_5961 ) ) ( not ( = ?auto_5939 ?auto_5942 ) ) ( not ( = ?auto_5939 ?auto_5961 ) ) ( not ( = ?auto_5940 ?auto_5942 ) ) ( not ( = ?auto_5940 ?auto_5961 ) ) ( not ( = ?auto_5942 ?auto_5959 ) ) ( not ( = ?auto_5942 ?auto_5964 ) ) ( not ( = ?auto_5942 ?auto_5967 ) ) ( not ( = ?auto_5962 ?auto_5958 ) ) ( not ( = ?auto_5962 ?auto_5966 ) ) ( not ( = ?auto_5962 ?auto_5969 ) ) ( not ( = ?auto_5960 ?auto_5955 ) ) ( not ( = ?auto_5960 ?auto_5968 ) ) ( not ( = ?auto_5960 ?auto_5956 ) ) ( not ( = ?auto_5961 ?auto_5959 ) ) ( not ( = ?auto_5961 ?auto_5964 ) ) ( not ( = ?auto_5961 ?auto_5967 ) ) ( not ( = ?auto_5938 ?auto_5943 ) ) ( not ( = ?auto_5938 ?auto_5954 ) ) ( not ( = ?auto_5939 ?auto_5943 ) ) ( not ( = ?auto_5939 ?auto_5954 ) ) ( not ( = ?auto_5940 ?auto_5943 ) ) ( not ( = ?auto_5940 ?auto_5954 ) ) ( not ( = ?auto_5941 ?auto_5943 ) ) ( not ( = ?auto_5941 ?auto_5954 ) ) ( not ( = ?auto_5943 ?auto_5961 ) ) ( not ( = ?auto_5943 ?auto_5959 ) ) ( not ( = ?auto_5943 ?auto_5964 ) ) ( not ( = ?auto_5943 ?auto_5967 ) ) ( not ( = ?auto_5954 ?auto_5961 ) ) ( not ( = ?auto_5954 ?auto_5959 ) ) ( not ( = ?auto_5954 ?auto_5964 ) ) ( not ( = ?auto_5954 ?auto_5967 ) ) ( not ( = ?auto_5938 ?auto_5944 ) ) ( not ( = ?auto_5938 ?auto_5963 ) ) ( not ( = ?auto_5939 ?auto_5944 ) ) ( not ( = ?auto_5939 ?auto_5963 ) ) ( not ( = ?auto_5940 ?auto_5944 ) ) ( not ( = ?auto_5940 ?auto_5963 ) ) ( not ( = ?auto_5941 ?auto_5944 ) ) ( not ( = ?auto_5941 ?auto_5963 ) ) ( not ( = ?auto_5942 ?auto_5944 ) ) ( not ( = ?auto_5942 ?auto_5963 ) ) ( not ( = ?auto_5944 ?auto_5954 ) ) ( not ( = ?auto_5944 ?auto_5961 ) ) ( not ( = ?auto_5944 ?auto_5959 ) ) ( not ( = ?auto_5944 ?auto_5964 ) ) ( not ( = ?auto_5944 ?auto_5967 ) ) ( not ( = ?auto_5963 ?auto_5954 ) ) ( not ( = ?auto_5963 ?auto_5961 ) ) ( not ( = ?auto_5963 ?auto_5959 ) ) ( not ( = ?auto_5963 ?auto_5964 ) ) ( not ( = ?auto_5963 ?auto_5967 ) ) ( not ( = ?auto_5938 ?auto_5945 ) ) ( not ( = ?auto_5938 ?auto_5957 ) ) ( not ( = ?auto_5939 ?auto_5945 ) ) ( not ( = ?auto_5939 ?auto_5957 ) ) ( not ( = ?auto_5940 ?auto_5945 ) ) ( not ( = ?auto_5940 ?auto_5957 ) ) ( not ( = ?auto_5941 ?auto_5945 ) ) ( not ( = ?auto_5941 ?auto_5957 ) ) ( not ( = ?auto_5942 ?auto_5945 ) ) ( not ( = ?auto_5942 ?auto_5957 ) ) ( not ( = ?auto_5943 ?auto_5945 ) ) ( not ( = ?auto_5943 ?auto_5957 ) ) ( not ( = ?auto_5945 ?auto_5963 ) ) ( not ( = ?auto_5945 ?auto_5954 ) ) ( not ( = ?auto_5945 ?auto_5961 ) ) ( not ( = ?auto_5945 ?auto_5959 ) ) ( not ( = ?auto_5945 ?auto_5964 ) ) ( not ( = ?auto_5945 ?auto_5967 ) ) ( not ( = ?auto_5957 ?auto_5963 ) ) ( not ( = ?auto_5957 ?auto_5954 ) ) ( not ( = ?auto_5957 ?auto_5961 ) ) ( not ( = ?auto_5957 ?auto_5959 ) ) ( not ( = ?auto_5957 ?auto_5964 ) ) ( not ( = ?auto_5957 ?auto_5967 ) ) ( not ( = ?auto_5938 ?auto_5946 ) ) ( not ( = ?auto_5938 ?auto_5965 ) ) ( not ( = ?auto_5939 ?auto_5946 ) ) ( not ( = ?auto_5939 ?auto_5965 ) ) ( not ( = ?auto_5940 ?auto_5946 ) ) ( not ( = ?auto_5940 ?auto_5965 ) ) ( not ( = ?auto_5941 ?auto_5946 ) ) ( not ( = ?auto_5941 ?auto_5965 ) ) ( not ( = ?auto_5942 ?auto_5946 ) ) ( not ( = ?auto_5942 ?auto_5965 ) ) ( not ( = ?auto_5943 ?auto_5946 ) ) ( not ( = ?auto_5943 ?auto_5965 ) ) ( not ( = ?auto_5944 ?auto_5946 ) ) ( not ( = ?auto_5944 ?auto_5965 ) ) ( not ( = ?auto_5946 ?auto_5957 ) ) ( not ( = ?auto_5946 ?auto_5963 ) ) ( not ( = ?auto_5946 ?auto_5954 ) ) ( not ( = ?auto_5946 ?auto_5961 ) ) ( not ( = ?auto_5946 ?auto_5959 ) ) ( not ( = ?auto_5946 ?auto_5964 ) ) ( not ( = ?auto_5946 ?auto_5967 ) ) ( not ( = ?auto_5965 ?auto_5957 ) ) ( not ( = ?auto_5965 ?auto_5963 ) ) ( not ( = ?auto_5965 ?auto_5954 ) ) ( not ( = ?auto_5965 ?auto_5961 ) ) ( not ( = ?auto_5965 ?auto_5959 ) ) ( not ( = ?auto_5965 ?auto_5964 ) ) ( not ( = ?auto_5965 ?auto_5967 ) ) ( not ( = ?auto_5938 ?auto_5947 ) ) ( not ( = ?auto_5938 ?auto_5950 ) ) ( not ( = ?auto_5939 ?auto_5947 ) ) ( not ( = ?auto_5939 ?auto_5950 ) ) ( not ( = ?auto_5940 ?auto_5947 ) ) ( not ( = ?auto_5940 ?auto_5950 ) ) ( not ( = ?auto_5941 ?auto_5947 ) ) ( not ( = ?auto_5941 ?auto_5950 ) ) ( not ( = ?auto_5942 ?auto_5947 ) ) ( not ( = ?auto_5942 ?auto_5950 ) ) ( not ( = ?auto_5943 ?auto_5947 ) ) ( not ( = ?auto_5943 ?auto_5950 ) ) ( not ( = ?auto_5944 ?auto_5947 ) ) ( not ( = ?auto_5944 ?auto_5950 ) ) ( not ( = ?auto_5945 ?auto_5947 ) ) ( not ( = ?auto_5945 ?auto_5950 ) ) ( not ( = ?auto_5947 ?auto_5965 ) ) ( not ( = ?auto_5947 ?auto_5957 ) ) ( not ( = ?auto_5947 ?auto_5963 ) ) ( not ( = ?auto_5947 ?auto_5954 ) ) ( not ( = ?auto_5947 ?auto_5961 ) ) ( not ( = ?auto_5947 ?auto_5959 ) ) ( not ( = ?auto_5947 ?auto_5964 ) ) ( not ( = ?auto_5947 ?auto_5967 ) ) ( not ( = ?auto_5952 ?auto_5966 ) ) ( not ( = ?auto_5952 ?auto_5969 ) ) ( not ( = ?auto_5952 ?auto_5958 ) ) ( not ( = ?auto_5952 ?auto_5962 ) ) ( not ( = ?auto_5949 ?auto_5968 ) ) ( not ( = ?auto_5949 ?auto_5956 ) ) ( not ( = ?auto_5949 ?auto_5955 ) ) ( not ( = ?auto_5949 ?auto_5960 ) ) ( not ( = ?auto_5950 ?auto_5965 ) ) ( not ( = ?auto_5950 ?auto_5957 ) ) ( not ( = ?auto_5950 ?auto_5963 ) ) ( not ( = ?auto_5950 ?auto_5954 ) ) ( not ( = ?auto_5950 ?auto_5961 ) ) ( not ( = ?auto_5950 ?auto_5959 ) ) ( not ( = ?auto_5950 ?auto_5964 ) ) ( not ( = ?auto_5950 ?auto_5967 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_5938 ?auto_5939 ?auto_5940 ?auto_5941 ?auto_5942 ?auto_5943 ?auto_5944 ?auto_5945 ?auto_5946 )
      ( MAKE-1CRATE ?auto_5946 ?auto_5947 )
      ( MAKE-9CRATE-VERIFY ?auto_5938 ?auto_5939 ?auto_5940 ?auto_5941 ?auto_5942 ?auto_5943 ?auto_5944 ?auto_5945 ?auto_5946 ?auto_5947 ) )
  )

)

