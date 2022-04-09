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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5660 - SURFACE
      ?auto_5661 - SURFACE
    )
    :vars
    (
      ?auto_5662 - HOIST
      ?auto_5663 - PLACE
      ?auto_5665 - PLACE
      ?auto_5666 - HOIST
      ?auto_5667 - SURFACE
      ?auto_5664 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5662 ?auto_5663 ) ( SURFACE-AT ?auto_5660 ?auto_5663 ) ( CLEAR ?auto_5660 ) ( IS-CRATE ?auto_5661 ) ( AVAILABLE ?auto_5662 ) ( not ( = ?auto_5665 ?auto_5663 ) ) ( HOIST-AT ?auto_5666 ?auto_5665 ) ( AVAILABLE ?auto_5666 ) ( SURFACE-AT ?auto_5661 ?auto_5665 ) ( ON ?auto_5661 ?auto_5667 ) ( CLEAR ?auto_5661 ) ( TRUCK-AT ?auto_5664 ?auto_5663 ) ( not ( = ?auto_5660 ?auto_5661 ) ) ( not ( = ?auto_5660 ?auto_5667 ) ) ( not ( = ?auto_5661 ?auto_5667 ) ) ( not ( = ?auto_5662 ?auto_5666 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5664 ?auto_5663 ?auto_5665 )
      ( !LIFT ?auto_5666 ?auto_5661 ?auto_5667 ?auto_5665 )
      ( !LOAD ?auto_5666 ?auto_5661 ?auto_5664 ?auto_5665 )
      ( !DRIVE ?auto_5664 ?auto_5665 ?auto_5663 )
      ( !UNLOAD ?auto_5662 ?auto_5661 ?auto_5664 ?auto_5663 )
      ( !DROP ?auto_5662 ?auto_5661 ?auto_5660 ?auto_5663 )
      ( MAKE-1CRATE-VERIFY ?auto_5660 ?auto_5661 ) )
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
      ?auto_5674 - HOIST
      ?auto_5676 - PLACE
      ?auto_5678 - PLACE
      ?auto_5677 - HOIST
      ?auto_5675 - SURFACE
      ?auto_5681 - PLACE
      ?auto_5682 - HOIST
      ?auto_5680 - SURFACE
      ?auto_5679 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5674 ?auto_5676 ) ( IS-CRATE ?auto_5673 ) ( not ( = ?auto_5678 ?auto_5676 ) ) ( HOIST-AT ?auto_5677 ?auto_5678 ) ( AVAILABLE ?auto_5677 ) ( SURFACE-AT ?auto_5673 ?auto_5678 ) ( ON ?auto_5673 ?auto_5675 ) ( CLEAR ?auto_5673 ) ( not ( = ?auto_5672 ?auto_5673 ) ) ( not ( = ?auto_5672 ?auto_5675 ) ) ( not ( = ?auto_5673 ?auto_5675 ) ) ( not ( = ?auto_5674 ?auto_5677 ) ) ( SURFACE-AT ?auto_5671 ?auto_5676 ) ( CLEAR ?auto_5671 ) ( IS-CRATE ?auto_5672 ) ( AVAILABLE ?auto_5674 ) ( not ( = ?auto_5681 ?auto_5676 ) ) ( HOIST-AT ?auto_5682 ?auto_5681 ) ( AVAILABLE ?auto_5682 ) ( SURFACE-AT ?auto_5672 ?auto_5681 ) ( ON ?auto_5672 ?auto_5680 ) ( CLEAR ?auto_5672 ) ( TRUCK-AT ?auto_5679 ?auto_5676 ) ( not ( = ?auto_5671 ?auto_5672 ) ) ( not ( = ?auto_5671 ?auto_5680 ) ) ( not ( = ?auto_5672 ?auto_5680 ) ) ( not ( = ?auto_5674 ?auto_5682 ) ) ( not ( = ?auto_5671 ?auto_5673 ) ) ( not ( = ?auto_5671 ?auto_5675 ) ) ( not ( = ?auto_5673 ?auto_5680 ) ) ( not ( = ?auto_5678 ?auto_5681 ) ) ( not ( = ?auto_5677 ?auto_5682 ) ) ( not ( = ?auto_5675 ?auto_5680 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5671 ?auto_5672 )
      ( MAKE-1CRATE ?auto_5672 ?auto_5673 )
      ( MAKE-2CRATE-VERIFY ?auto_5671 ?auto_5672 ?auto_5673 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5685 - SURFACE
      ?auto_5686 - SURFACE
    )
    :vars
    (
      ?auto_5687 - HOIST
      ?auto_5688 - PLACE
      ?auto_5690 - PLACE
      ?auto_5691 - HOIST
      ?auto_5692 - SURFACE
      ?auto_5689 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5687 ?auto_5688 ) ( SURFACE-AT ?auto_5685 ?auto_5688 ) ( CLEAR ?auto_5685 ) ( IS-CRATE ?auto_5686 ) ( AVAILABLE ?auto_5687 ) ( not ( = ?auto_5690 ?auto_5688 ) ) ( HOIST-AT ?auto_5691 ?auto_5690 ) ( AVAILABLE ?auto_5691 ) ( SURFACE-AT ?auto_5686 ?auto_5690 ) ( ON ?auto_5686 ?auto_5692 ) ( CLEAR ?auto_5686 ) ( TRUCK-AT ?auto_5689 ?auto_5688 ) ( not ( = ?auto_5685 ?auto_5686 ) ) ( not ( = ?auto_5685 ?auto_5692 ) ) ( not ( = ?auto_5686 ?auto_5692 ) ) ( not ( = ?auto_5687 ?auto_5691 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5689 ?auto_5688 ?auto_5690 )
      ( !LIFT ?auto_5691 ?auto_5686 ?auto_5692 ?auto_5690 )
      ( !LOAD ?auto_5691 ?auto_5686 ?auto_5689 ?auto_5690 )
      ( !DRIVE ?auto_5689 ?auto_5690 ?auto_5688 )
      ( !UNLOAD ?auto_5687 ?auto_5686 ?auto_5689 ?auto_5688 )
      ( !DROP ?auto_5687 ?auto_5686 ?auto_5685 ?auto_5688 )
      ( MAKE-1CRATE-VERIFY ?auto_5685 ?auto_5686 ) )
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
      ?auto_5706 - HOIST
      ?auto_5702 - PLACE
      ?auto_5705 - PLACE
      ?auto_5704 - HOIST
      ?auto_5703 - SURFACE
      ?auto_5709 - PLACE
      ?auto_5710 - HOIST
      ?auto_5711 - SURFACE
      ?auto_5712 - PLACE
      ?auto_5708 - HOIST
      ?auto_5707 - SURFACE
      ?auto_5701 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5706 ?auto_5702 ) ( IS-CRATE ?auto_5700 ) ( not ( = ?auto_5705 ?auto_5702 ) ) ( HOIST-AT ?auto_5704 ?auto_5705 ) ( AVAILABLE ?auto_5704 ) ( SURFACE-AT ?auto_5700 ?auto_5705 ) ( ON ?auto_5700 ?auto_5703 ) ( CLEAR ?auto_5700 ) ( not ( = ?auto_5699 ?auto_5700 ) ) ( not ( = ?auto_5699 ?auto_5703 ) ) ( not ( = ?auto_5700 ?auto_5703 ) ) ( not ( = ?auto_5706 ?auto_5704 ) ) ( IS-CRATE ?auto_5699 ) ( not ( = ?auto_5709 ?auto_5702 ) ) ( HOIST-AT ?auto_5710 ?auto_5709 ) ( AVAILABLE ?auto_5710 ) ( SURFACE-AT ?auto_5699 ?auto_5709 ) ( ON ?auto_5699 ?auto_5711 ) ( CLEAR ?auto_5699 ) ( not ( = ?auto_5698 ?auto_5699 ) ) ( not ( = ?auto_5698 ?auto_5711 ) ) ( not ( = ?auto_5699 ?auto_5711 ) ) ( not ( = ?auto_5706 ?auto_5710 ) ) ( SURFACE-AT ?auto_5697 ?auto_5702 ) ( CLEAR ?auto_5697 ) ( IS-CRATE ?auto_5698 ) ( AVAILABLE ?auto_5706 ) ( not ( = ?auto_5712 ?auto_5702 ) ) ( HOIST-AT ?auto_5708 ?auto_5712 ) ( AVAILABLE ?auto_5708 ) ( SURFACE-AT ?auto_5698 ?auto_5712 ) ( ON ?auto_5698 ?auto_5707 ) ( CLEAR ?auto_5698 ) ( TRUCK-AT ?auto_5701 ?auto_5702 ) ( not ( = ?auto_5697 ?auto_5698 ) ) ( not ( = ?auto_5697 ?auto_5707 ) ) ( not ( = ?auto_5698 ?auto_5707 ) ) ( not ( = ?auto_5706 ?auto_5708 ) ) ( not ( = ?auto_5697 ?auto_5699 ) ) ( not ( = ?auto_5697 ?auto_5711 ) ) ( not ( = ?auto_5699 ?auto_5707 ) ) ( not ( = ?auto_5709 ?auto_5712 ) ) ( not ( = ?auto_5710 ?auto_5708 ) ) ( not ( = ?auto_5711 ?auto_5707 ) ) ( not ( = ?auto_5697 ?auto_5700 ) ) ( not ( = ?auto_5697 ?auto_5703 ) ) ( not ( = ?auto_5698 ?auto_5700 ) ) ( not ( = ?auto_5698 ?auto_5703 ) ) ( not ( = ?auto_5700 ?auto_5711 ) ) ( not ( = ?auto_5700 ?auto_5707 ) ) ( not ( = ?auto_5705 ?auto_5709 ) ) ( not ( = ?auto_5705 ?auto_5712 ) ) ( not ( = ?auto_5704 ?auto_5710 ) ) ( not ( = ?auto_5704 ?auto_5708 ) ) ( not ( = ?auto_5703 ?auto_5711 ) ) ( not ( = ?auto_5703 ?auto_5707 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5697 ?auto_5698 ?auto_5699 )
      ( MAKE-1CRATE ?auto_5699 ?auto_5700 )
      ( MAKE-3CRATE-VERIFY ?auto_5697 ?auto_5698 ?auto_5699 ?auto_5700 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5715 - SURFACE
      ?auto_5716 - SURFACE
    )
    :vars
    (
      ?auto_5717 - HOIST
      ?auto_5718 - PLACE
      ?auto_5720 - PLACE
      ?auto_5721 - HOIST
      ?auto_5722 - SURFACE
      ?auto_5719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5717 ?auto_5718 ) ( SURFACE-AT ?auto_5715 ?auto_5718 ) ( CLEAR ?auto_5715 ) ( IS-CRATE ?auto_5716 ) ( AVAILABLE ?auto_5717 ) ( not ( = ?auto_5720 ?auto_5718 ) ) ( HOIST-AT ?auto_5721 ?auto_5720 ) ( AVAILABLE ?auto_5721 ) ( SURFACE-AT ?auto_5716 ?auto_5720 ) ( ON ?auto_5716 ?auto_5722 ) ( CLEAR ?auto_5716 ) ( TRUCK-AT ?auto_5719 ?auto_5718 ) ( not ( = ?auto_5715 ?auto_5716 ) ) ( not ( = ?auto_5715 ?auto_5722 ) ) ( not ( = ?auto_5716 ?auto_5722 ) ) ( not ( = ?auto_5717 ?auto_5721 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5719 ?auto_5718 ?auto_5720 )
      ( !LIFT ?auto_5721 ?auto_5716 ?auto_5722 ?auto_5720 )
      ( !LOAD ?auto_5721 ?auto_5716 ?auto_5719 ?auto_5720 )
      ( !DRIVE ?auto_5719 ?auto_5720 ?auto_5718 )
      ( !UNLOAD ?auto_5717 ?auto_5716 ?auto_5719 ?auto_5718 )
      ( !DROP ?auto_5717 ?auto_5716 ?auto_5715 ?auto_5718 )
      ( MAKE-1CRATE-VERIFY ?auto_5715 ?auto_5716 ) )
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
      ?auto_5733 - HOIST
      ?auto_5736 - PLACE
      ?auto_5737 - PLACE
      ?auto_5735 - HOIST
      ?auto_5734 - SURFACE
      ?auto_5744 - PLACE
      ?auto_5745 - HOIST
      ?auto_5747 - SURFACE
      ?auto_5740 - PLACE
      ?auto_5743 - HOIST
      ?auto_5742 - SURFACE
      ?auto_5739 - PLACE
      ?auto_5741 - HOIST
      ?auto_5746 - SURFACE
      ?auto_5738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5733 ?auto_5736 ) ( IS-CRATE ?auto_5732 ) ( not ( = ?auto_5737 ?auto_5736 ) ) ( HOIST-AT ?auto_5735 ?auto_5737 ) ( AVAILABLE ?auto_5735 ) ( SURFACE-AT ?auto_5732 ?auto_5737 ) ( ON ?auto_5732 ?auto_5734 ) ( CLEAR ?auto_5732 ) ( not ( = ?auto_5731 ?auto_5732 ) ) ( not ( = ?auto_5731 ?auto_5734 ) ) ( not ( = ?auto_5732 ?auto_5734 ) ) ( not ( = ?auto_5733 ?auto_5735 ) ) ( IS-CRATE ?auto_5731 ) ( not ( = ?auto_5744 ?auto_5736 ) ) ( HOIST-AT ?auto_5745 ?auto_5744 ) ( AVAILABLE ?auto_5745 ) ( SURFACE-AT ?auto_5731 ?auto_5744 ) ( ON ?auto_5731 ?auto_5747 ) ( CLEAR ?auto_5731 ) ( not ( = ?auto_5730 ?auto_5731 ) ) ( not ( = ?auto_5730 ?auto_5747 ) ) ( not ( = ?auto_5731 ?auto_5747 ) ) ( not ( = ?auto_5733 ?auto_5745 ) ) ( IS-CRATE ?auto_5730 ) ( not ( = ?auto_5740 ?auto_5736 ) ) ( HOIST-AT ?auto_5743 ?auto_5740 ) ( AVAILABLE ?auto_5743 ) ( SURFACE-AT ?auto_5730 ?auto_5740 ) ( ON ?auto_5730 ?auto_5742 ) ( CLEAR ?auto_5730 ) ( not ( = ?auto_5729 ?auto_5730 ) ) ( not ( = ?auto_5729 ?auto_5742 ) ) ( not ( = ?auto_5730 ?auto_5742 ) ) ( not ( = ?auto_5733 ?auto_5743 ) ) ( SURFACE-AT ?auto_5728 ?auto_5736 ) ( CLEAR ?auto_5728 ) ( IS-CRATE ?auto_5729 ) ( AVAILABLE ?auto_5733 ) ( not ( = ?auto_5739 ?auto_5736 ) ) ( HOIST-AT ?auto_5741 ?auto_5739 ) ( AVAILABLE ?auto_5741 ) ( SURFACE-AT ?auto_5729 ?auto_5739 ) ( ON ?auto_5729 ?auto_5746 ) ( CLEAR ?auto_5729 ) ( TRUCK-AT ?auto_5738 ?auto_5736 ) ( not ( = ?auto_5728 ?auto_5729 ) ) ( not ( = ?auto_5728 ?auto_5746 ) ) ( not ( = ?auto_5729 ?auto_5746 ) ) ( not ( = ?auto_5733 ?auto_5741 ) ) ( not ( = ?auto_5728 ?auto_5730 ) ) ( not ( = ?auto_5728 ?auto_5742 ) ) ( not ( = ?auto_5730 ?auto_5746 ) ) ( not ( = ?auto_5740 ?auto_5739 ) ) ( not ( = ?auto_5743 ?auto_5741 ) ) ( not ( = ?auto_5742 ?auto_5746 ) ) ( not ( = ?auto_5728 ?auto_5731 ) ) ( not ( = ?auto_5728 ?auto_5747 ) ) ( not ( = ?auto_5729 ?auto_5731 ) ) ( not ( = ?auto_5729 ?auto_5747 ) ) ( not ( = ?auto_5731 ?auto_5742 ) ) ( not ( = ?auto_5731 ?auto_5746 ) ) ( not ( = ?auto_5744 ?auto_5740 ) ) ( not ( = ?auto_5744 ?auto_5739 ) ) ( not ( = ?auto_5745 ?auto_5743 ) ) ( not ( = ?auto_5745 ?auto_5741 ) ) ( not ( = ?auto_5747 ?auto_5742 ) ) ( not ( = ?auto_5747 ?auto_5746 ) ) ( not ( = ?auto_5728 ?auto_5732 ) ) ( not ( = ?auto_5728 ?auto_5734 ) ) ( not ( = ?auto_5729 ?auto_5732 ) ) ( not ( = ?auto_5729 ?auto_5734 ) ) ( not ( = ?auto_5730 ?auto_5732 ) ) ( not ( = ?auto_5730 ?auto_5734 ) ) ( not ( = ?auto_5732 ?auto_5747 ) ) ( not ( = ?auto_5732 ?auto_5742 ) ) ( not ( = ?auto_5732 ?auto_5746 ) ) ( not ( = ?auto_5737 ?auto_5744 ) ) ( not ( = ?auto_5737 ?auto_5740 ) ) ( not ( = ?auto_5737 ?auto_5739 ) ) ( not ( = ?auto_5735 ?auto_5745 ) ) ( not ( = ?auto_5735 ?auto_5743 ) ) ( not ( = ?auto_5735 ?auto_5741 ) ) ( not ( = ?auto_5734 ?auto_5747 ) ) ( not ( = ?auto_5734 ?auto_5742 ) ) ( not ( = ?auto_5734 ?auto_5746 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_5728 ?auto_5729 ?auto_5730 ?auto_5731 )
      ( MAKE-1CRATE ?auto_5731 ?auto_5732 )
      ( MAKE-4CRATE-VERIFY ?auto_5728 ?auto_5729 ?auto_5730 ?auto_5731 ?auto_5732 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5750 - SURFACE
      ?auto_5751 - SURFACE
    )
    :vars
    (
      ?auto_5752 - HOIST
      ?auto_5753 - PLACE
      ?auto_5755 - PLACE
      ?auto_5756 - HOIST
      ?auto_5757 - SURFACE
      ?auto_5754 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5752 ?auto_5753 ) ( SURFACE-AT ?auto_5750 ?auto_5753 ) ( CLEAR ?auto_5750 ) ( IS-CRATE ?auto_5751 ) ( AVAILABLE ?auto_5752 ) ( not ( = ?auto_5755 ?auto_5753 ) ) ( HOIST-AT ?auto_5756 ?auto_5755 ) ( AVAILABLE ?auto_5756 ) ( SURFACE-AT ?auto_5751 ?auto_5755 ) ( ON ?auto_5751 ?auto_5757 ) ( CLEAR ?auto_5751 ) ( TRUCK-AT ?auto_5754 ?auto_5753 ) ( not ( = ?auto_5750 ?auto_5751 ) ) ( not ( = ?auto_5750 ?auto_5757 ) ) ( not ( = ?auto_5751 ?auto_5757 ) ) ( not ( = ?auto_5752 ?auto_5756 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5754 ?auto_5753 ?auto_5755 )
      ( !LIFT ?auto_5756 ?auto_5751 ?auto_5757 ?auto_5755 )
      ( !LOAD ?auto_5756 ?auto_5751 ?auto_5754 ?auto_5755 )
      ( !DRIVE ?auto_5754 ?auto_5755 ?auto_5753 )
      ( !UNLOAD ?auto_5752 ?auto_5751 ?auto_5754 ?auto_5753 )
      ( !DROP ?auto_5752 ?auto_5751 ?auto_5750 ?auto_5753 )
      ( MAKE-1CRATE-VERIFY ?auto_5750 ?auto_5751 ) )
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
      ?auto_5774 - PLACE
      ?auto_5770 - PLACE
      ?auto_5771 - HOIST
      ?auto_5773 - SURFACE
      ?auto_5785 - PLACE
      ?auto_5781 - HOIST
      ?auto_5784 - SURFACE
      ?auto_5780 - SURFACE
      ?auto_5776 - PLACE
      ?auto_5782 - HOIST
      ?auto_5777 - SURFACE
      ?auto_5778 - PLACE
      ?auto_5779 - HOIST
      ?auto_5783 - SURFACE
      ?auto_5775 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5772 ?auto_5774 ) ( IS-CRATE ?auto_5769 ) ( not ( = ?auto_5770 ?auto_5774 ) ) ( HOIST-AT ?auto_5771 ?auto_5770 ) ( SURFACE-AT ?auto_5769 ?auto_5770 ) ( ON ?auto_5769 ?auto_5773 ) ( CLEAR ?auto_5769 ) ( not ( = ?auto_5768 ?auto_5769 ) ) ( not ( = ?auto_5768 ?auto_5773 ) ) ( not ( = ?auto_5769 ?auto_5773 ) ) ( not ( = ?auto_5772 ?auto_5771 ) ) ( IS-CRATE ?auto_5768 ) ( not ( = ?auto_5785 ?auto_5774 ) ) ( HOIST-AT ?auto_5781 ?auto_5785 ) ( AVAILABLE ?auto_5781 ) ( SURFACE-AT ?auto_5768 ?auto_5785 ) ( ON ?auto_5768 ?auto_5784 ) ( CLEAR ?auto_5768 ) ( not ( = ?auto_5767 ?auto_5768 ) ) ( not ( = ?auto_5767 ?auto_5784 ) ) ( not ( = ?auto_5768 ?auto_5784 ) ) ( not ( = ?auto_5772 ?auto_5781 ) ) ( IS-CRATE ?auto_5767 ) ( AVAILABLE ?auto_5771 ) ( SURFACE-AT ?auto_5767 ?auto_5770 ) ( ON ?auto_5767 ?auto_5780 ) ( CLEAR ?auto_5767 ) ( not ( = ?auto_5766 ?auto_5767 ) ) ( not ( = ?auto_5766 ?auto_5780 ) ) ( not ( = ?auto_5767 ?auto_5780 ) ) ( IS-CRATE ?auto_5766 ) ( not ( = ?auto_5776 ?auto_5774 ) ) ( HOIST-AT ?auto_5782 ?auto_5776 ) ( AVAILABLE ?auto_5782 ) ( SURFACE-AT ?auto_5766 ?auto_5776 ) ( ON ?auto_5766 ?auto_5777 ) ( CLEAR ?auto_5766 ) ( not ( = ?auto_5765 ?auto_5766 ) ) ( not ( = ?auto_5765 ?auto_5777 ) ) ( not ( = ?auto_5766 ?auto_5777 ) ) ( not ( = ?auto_5772 ?auto_5782 ) ) ( SURFACE-AT ?auto_5764 ?auto_5774 ) ( CLEAR ?auto_5764 ) ( IS-CRATE ?auto_5765 ) ( AVAILABLE ?auto_5772 ) ( not ( = ?auto_5778 ?auto_5774 ) ) ( HOIST-AT ?auto_5779 ?auto_5778 ) ( AVAILABLE ?auto_5779 ) ( SURFACE-AT ?auto_5765 ?auto_5778 ) ( ON ?auto_5765 ?auto_5783 ) ( CLEAR ?auto_5765 ) ( TRUCK-AT ?auto_5775 ?auto_5774 ) ( not ( = ?auto_5764 ?auto_5765 ) ) ( not ( = ?auto_5764 ?auto_5783 ) ) ( not ( = ?auto_5765 ?auto_5783 ) ) ( not ( = ?auto_5772 ?auto_5779 ) ) ( not ( = ?auto_5764 ?auto_5766 ) ) ( not ( = ?auto_5764 ?auto_5777 ) ) ( not ( = ?auto_5766 ?auto_5783 ) ) ( not ( = ?auto_5776 ?auto_5778 ) ) ( not ( = ?auto_5782 ?auto_5779 ) ) ( not ( = ?auto_5777 ?auto_5783 ) ) ( not ( = ?auto_5764 ?auto_5767 ) ) ( not ( = ?auto_5764 ?auto_5780 ) ) ( not ( = ?auto_5765 ?auto_5767 ) ) ( not ( = ?auto_5765 ?auto_5780 ) ) ( not ( = ?auto_5767 ?auto_5777 ) ) ( not ( = ?auto_5767 ?auto_5783 ) ) ( not ( = ?auto_5770 ?auto_5776 ) ) ( not ( = ?auto_5770 ?auto_5778 ) ) ( not ( = ?auto_5771 ?auto_5782 ) ) ( not ( = ?auto_5771 ?auto_5779 ) ) ( not ( = ?auto_5780 ?auto_5777 ) ) ( not ( = ?auto_5780 ?auto_5783 ) ) ( not ( = ?auto_5764 ?auto_5768 ) ) ( not ( = ?auto_5764 ?auto_5784 ) ) ( not ( = ?auto_5765 ?auto_5768 ) ) ( not ( = ?auto_5765 ?auto_5784 ) ) ( not ( = ?auto_5766 ?auto_5768 ) ) ( not ( = ?auto_5766 ?auto_5784 ) ) ( not ( = ?auto_5768 ?auto_5780 ) ) ( not ( = ?auto_5768 ?auto_5777 ) ) ( not ( = ?auto_5768 ?auto_5783 ) ) ( not ( = ?auto_5785 ?auto_5770 ) ) ( not ( = ?auto_5785 ?auto_5776 ) ) ( not ( = ?auto_5785 ?auto_5778 ) ) ( not ( = ?auto_5781 ?auto_5771 ) ) ( not ( = ?auto_5781 ?auto_5782 ) ) ( not ( = ?auto_5781 ?auto_5779 ) ) ( not ( = ?auto_5784 ?auto_5780 ) ) ( not ( = ?auto_5784 ?auto_5777 ) ) ( not ( = ?auto_5784 ?auto_5783 ) ) ( not ( = ?auto_5764 ?auto_5769 ) ) ( not ( = ?auto_5764 ?auto_5773 ) ) ( not ( = ?auto_5765 ?auto_5769 ) ) ( not ( = ?auto_5765 ?auto_5773 ) ) ( not ( = ?auto_5766 ?auto_5769 ) ) ( not ( = ?auto_5766 ?auto_5773 ) ) ( not ( = ?auto_5767 ?auto_5769 ) ) ( not ( = ?auto_5767 ?auto_5773 ) ) ( not ( = ?auto_5769 ?auto_5784 ) ) ( not ( = ?auto_5769 ?auto_5780 ) ) ( not ( = ?auto_5769 ?auto_5777 ) ) ( not ( = ?auto_5769 ?auto_5783 ) ) ( not ( = ?auto_5773 ?auto_5784 ) ) ( not ( = ?auto_5773 ?auto_5780 ) ) ( not ( = ?auto_5773 ?auto_5777 ) ) ( not ( = ?auto_5773 ?auto_5783 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_5764 ?auto_5765 ?auto_5766 ?auto_5767 ?auto_5768 )
      ( MAKE-1CRATE ?auto_5768 ?auto_5769 )
      ( MAKE-5CRATE-VERIFY ?auto_5764 ?auto_5765 ?auto_5766 ?auto_5767 ?auto_5768 ?auto_5769 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5788 - SURFACE
      ?auto_5789 - SURFACE
    )
    :vars
    (
      ?auto_5790 - HOIST
      ?auto_5791 - PLACE
      ?auto_5793 - PLACE
      ?auto_5794 - HOIST
      ?auto_5795 - SURFACE
      ?auto_5792 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5790 ?auto_5791 ) ( SURFACE-AT ?auto_5788 ?auto_5791 ) ( CLEAR ?auto_5788 ) ( IS-CRATE ?auto_5789 ) ( AVAILABLE ?auto_5790 ) ( not ( = ?auto_5793 ?auto_5791 ) ) ( HOIST-AT ?auto_5794 ?auto_5793 ) ( AVAILABLE ?auto_5794 ) ( SURFACE-AT ?auto_5789 ?auto_5793 ) ( ON ?auto_5789 ?auto_5795 ) ( CLEAR ?auto_5789 ) ( TRUCK-AT ?auto_5792 ?auto_5791 ) ( not ( = ?auto_5788 ?auto_5789 ) ) ( not ( = ?auto_5788 ?auto_5795 ) ) ( not ( = ?auto_5789 ?auto_5795 ) ) ( not ( = ?auto_5790 ?auto_5794 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5792 ?auto_5791 ?auto_5793 )
      ( !LIFT ?auto_5794 ?auto_5789 ?auto_5795 ?auto_5793 )
      ( !LOAD ?auto_5794 ?auto_5789 ?auto_5792 ?auto_5793 )
      ( !DRIVE ?auto_5792 ?auto_5793 ?auto_5791 )
      ( !UNLOAD ?auto_5790 ?auto_5789 ?auto_5792 ?auto_5791 )
      ( !DROP ?auto_5790 ?auto_5789 ?auto_5788 ?auto_5791 )
      ( MAKE-1CRATE-VERIFY ?auto_5788 ?auto_5789 ) )
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
      ?auto_5811 - HOIST
      ?auto_5813 - PLACE
      ?auto_5812 - PLACE
      ?auto_5815 - HOIST
      ?auto_5810 - SURFACE
      ?auto_5826 - SURFACE
      ?auto_5822 - PLACE
      ?auto_5824 - HOIST
      ?auto_5819 - SURFACE
      ?auto_5820 - SURFACE
      ?auto_5825 - PLACE
      ?auto_5816 - HOIST
      ?auto_5823 - SURFACE
      ?auto_5821 - PLACE
      ?auto_5818 - HOIST
      ?auto_5817 - SURFACE
      ?auto_5814 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5811 ?auto_5813 ) ( IS-CRATE ?auto_5809 ) ( not ( = ?auto_5812 ?auto_5813 ) ) ( HOIST-AT ?auto_5815 ?auto_5812 ) ( SURFACE-AT ?auto_5809 ?auto_5812 ) ( ON ?auto_5809 ?auto_5810 ) ( CLEAR ?auto_5809 ) ( not ( = ?auto_5808 ?auto_5809 ) ) ( not ( = ?auto_5808 ?auto_5810 ) ) ( not ( = ?auto_5809 ?auto_5810 ) ) ( not ( = ?auto_5811 ?auto_5815 ) ) ( IS-CRATE ?auto_5808 ) ( SURFACE-AT ?auto_5808 ?auto_5812 ) ( ON ?auto_5808 ?auto_5826 ) ( CLEAR ?auto_5808 ) ( not ( = ?auto_5807 ?auto_5808 ) ) ( not ( = ?auto_5807 ?auto_5826 ) ) ( not ( = ?auto_5808 ?auto_5826 ) ) ( IS-CRATE ?auto_5807 ) ( not ( = ?auto_5822 ?auto_5813 ) ) ( HOIST-AT ?auto_5824 ?auto_5822 ) ( AVAILABLE ?auto_5824 ) ( SURFACE-AT ?auto_5807 ?auto_5822 ) ( ON ?auto_5807 ?auto_5819 ) ( CLEAR ?auto_5807 ) ( not ( = ?auto_5806 ?auto_5807 ) ) ( not ( = ?auto_5806 ?auto_5819 ) ) ( not ( = ?auto_5807 ?auto_5819 ) ) ( not ( = ?auto_5811 ?auto_5824 ) ) ( IS-CRATE ?auto_5806 ) ( AVAILABLE ?auto_5815 ) ( SURFACE-AT ?auto_5806 ?auto_5812 ) ( ON ?auto_5806 ?auto_5820 ) ( CLEAR ?auto_5806 ) ( not ( = ?auto_5805 ?auto_5806 ) ) ( not ( = ?auto_5805 ?auto_5820 ) ) ( not ( = ?auto_5806 ?auto_5820 ) ) ( IS-CRATE ?auto_5805 ) ( not ( = ?auto_5825 ?auto_5813 ) ) ( HOIST-AT ?auto_5816 ?auto_5825 ) ( AVAILABLE ?auto_5816 ) ( SURFACE-AT ?auto_5805 ?auto_5825 ) ( ON ?auto_5805 ?auto_5823 ) ( CLEAR ?auto_5805 ) ( not ( = ?auto_5804 ?auto_5805 ) ) ( not ( = ?auto_5804 ?auto_5823 ) ) ( not ( = ?auto_5805 ?auto_5823 ) ) ( not ( = ?auto_5811 ?auto_5816 ) ) ( SURFACE-AT ?auto_5803 ?auto_5813 ) ( CLEAR ?auto_5803 ) ( IS-CRATE ?auto_5804 ) ( AVAILABLE ?auto_5811 ) ( not ( = ?auto_5821 ?auto_5813 ) ) ( HOIST-AT ?auto_5818 ?auto_5821 ) ( AVAILABLE ?auto_5818 ) ( SURFACE-AT ?auto_5804 ?auto_5821 ) ( ON ?auto_5804 ?auto_5817 ) ( CLEAR ?auto_5804 ) ( TRUCK-AT ?auto_5814 ?auto_5813 ) ( not ( = ?auto_5803 ?auto_5804 ) ) ( not ( = ?auto_5803 ?auto_5817 ) ) ( not ( = ?auto_5804 ?auto_5817 ) ) ( not ( = ?auto_5811 ?auto_5818 ) ) ( not ( = ?auto_5803 ?auto_5805 ) ) ( not ( = ?auto_5803 ?auto_5823 ) ) ( not ( = ?auto_5805 ?auto_5817 ) ) ( not ( = ?auto_5825 ?auto_5821 ) ) ( not ( = ?auto_5816 ?auto_5818 ) ) ( not ( = ?auto_5823 ?auto_5817 ) ) ( not ( = ?auto_5803 ?auto_5806 ) ) ( not ( = ?auto_5803 ?auto_5820 ) ) ( not ( = ?auto_5804 ?auto_5806 ) ) ( not ( = ?auto_5804 ?auto_5820 ) ) ( not ( = ?auto_5806 ?auto_5823 ) ) ( not ( = ?auto_5806 ?auto_5817 ) ) ( not ( = ?auto_5812 ?auto_5825 ) ) ( not ( = ?auto_5812 ?auto_5821 ) ) ( not ( = ?auto_5815 ?auto_5816 ) ) ( not ( = ?auto_5815 ?auto_5818 ) ) ( not ( = ?auto_5820 ?auto_5823 ) ) ( not ( = ?auto_5820 ?auto_5817 ) ) ( not ( = ?auto_5803 ?auto_5807 ) ) ( not ( = ?auto_5803 ?auto_5819 ) ) ( not ( = ?auto_5804 ?auto_5807 ) ) ( not ( = ?auto_5804 ?auto_5819 ) ) ( not ( = ?auto_5805 ?auto_5807 ) ) ( not ( = ?auto_5805 ?auto_5819 ) ) ( not ( = ?auto_5807 ?auto_5820 ) ) ( not ( = ?auto_5807 ?auto_5823 ) ) ( not ( = ?auto_5807 ?auto_5817 ) ) ( not ( = ?auto_5822 ?auto_5812 ) ) ( not ( = ?auto_5822 ?auto_5825 ) ) ( not ( = ?auto_5822 ?auto_5821 ) ) ( not ( = ?auto_5824 ?auto_5815 ) ) ( not ( = ?auto_5824 ?auto_5816 ) ) ( not ( = ?auto_5824 ?auto_5818 ) ) ( not ( = ?auto_5819 ?auto_5820 ) ) ( not ( = ?auto_5819 ?auto_5823 ) ) ( not ( = ?auto_5819 ?auto_5817 ) ) ( not ( = ?auto_5803 ?auto_5808 ) ) ( not ( = ?auto_5803 ?auto_5826 ) ) ( not ( = ?auto_5804 ?auto_5808 ) ) ( not ( = ?auto_5804 ?auto_5826 ) ) ( not ( = ?auto_5805 ?auto_5808 ) ) ( not ( = ?auto_5805 ?auto_5826 ) ) ( not ( = ?auto_5806 ?auto_5808 ) ) ( not ( = ?auto_5806 ?auto_5826 ) ) ( not ( = ?auto_5808 ?auto_5819 ) ) ( not ( = ?auto_5808 ?auto_5820 ) ) ( not ( = ?auto_5808 ?auto_5823 ) ) ( not ( = ?auto_5808 ?auto_5817 ) ) ( not ( = ?auto_5826 ?auto_5819 ) ) ( not ( = ?auto_5826 ?auto_5820 ) ) ( not ( = ?auto_5826 ?auto_5823 ) ) ( not ( = ?auto_5826 ?auto_5817 ) ) ( not ( = ?auto_5803 ?auto_5809 ) ) ( not ( = ?auto_5803 ?auto_5810 ) ) ( not ( = ?auto_5804 ?auto_5809 ) ) ( not ( = ?auto_5804 ?auto_5810 ) ) ( not ( = ?auto_5805 ?auto_5809 ) ) ( not ( = ?auto_5805 ?auto_5810 ) ) ( not ( = ?auto_5806 ?auto_5809 ) ) ( not ( = ?auto_5806 ?auto_5810 ) ) ( not ( = ?auto_5807 ?auto_5809 ) ) ( not ( = ?auto_5807 ?auto_5810 ) ) ( not ( = ?auto_5809 ?auto_5826 ) ) ( not ( = ?auto_5809 ?auto_5819 ) ) ( not ( = ?auto_5809 ?auto_5820 ) ) ( not ( = ?auto_5809 ?auto_5823 ) ) ( not ( = ?auto_5809 ?auto_5817 ) ) ( not ( = ?auto_5810 ?auto_5826 ) ) ( not ( = ?auto_5810 ?auto_5819 ) ) ( not ( = ?auto_5810 ?auto_5820 ) ) ( not ( = ?auto_5810 ?auto_5823 ) ) ( not ( = ?auto_5810 ?auto_5817 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_5803 ?auto_5804 ?auto_5805 ?auto_5806 ?auto_5807 ?auto_5808 )
      ( MAKE-1CRATE ?auto_5808 ?auto_5809 )
      ( MAKE-6CRATE-VERIFY ?auto_5803 ?auto_5804 ?auto_5805 ?auto_5806 ?auto_5807 ?auto_5808 ?auto_5809 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5829 - SURFACE
      ?auto_5830 - SURFACE
    )
    :vars
    (
      ?auto_5831 - HOIST
      ?auto_5832 - PLACE
      ?auto_5834 - PLACE
      ?auto_5835 - HOIST
      ?auto_5836 - SURFACE
      ?auto_5833 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5831 ?auto_5832 ) ( SURFACE-AT ?auto_5829 ?auto_5832 ) ( CLEAR ?auto_5829 ) ( IS-CRATE ?auto_5830 ) ( AVAILABLE ?auto_5831 ) ( not ( = ?auto_5834 ?auto_5832 ) ) ( HOIST-AT ?auto_5835 ?auto_5834 ) ( AVAILABLE ?auto_5835 ) ( SURFACE-AT ?auto_5830 ?auto_5834 ) ( ON ?auto_5830 ?auto_5836 ) ( CLEAR ?auto_5830 ) ( TRUCK-AT ?auto_5833 ?auto_5832 ) ( not ( = ?auto_5829 ?auto_5830 ) ) ( not ( = ?auto_5829 ?auto_5836 ) ) ( not ( = ?auto_5830 ?auto_5836 ) ) ( not ( = ?auto_5831 ?auto_5835 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5833 ?auto_5832 ?auto_5834 )
      ( !LIFT ?auto_5835 ?auto_5830 ?auto_5836 ?auto_5834 )
      ( !LOAD ?auto_5835 ?auto_5830 ?auto_5833 ?auto_5834 )
      ( !DRIVE ?auto_5833 ?auto_5834 ?auto_5832 )
      ( !UNLOAD ?auto_5831 ?auto_5830 ?auto_5833 ?auto_5832 )
      ( !DROP ?auto_5831 ?auto_5830 ?auto_5829 ?auto_5832 )
      ( MAKE-1CRATE-VERIFY ?auto_5829 ?auto_5830 ) )
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
      ?auto_5856 - HOIST
      ?auto_5855 - PLACE
      ?auto_5858 - PLACE
      ?auto_5854 - HOIST
      ?auto_5857 - SURFACE
      ?auto_5862 - PLACE
      ?auto_5867 - HOIST
      ?auto_5863 - SURFACE
      ?auto_5868 - SURFACE
      ?auto_5865 - PLACE
      ?auto_5859 - HOIST
      ?auto_5860 - SURFACE
      ?auto_5866 - SURFACE
      ?auto_5869 - PLACE
      ?auto_5870 - HOIST
      ?auto_5864 - SURFACE
      ?auto_5861 - SURFACE
      ?auto_5853 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5856 ?auto_5855 ) ( IS-CRATE ?auto_5852 ) ( not ( = ?auto_5858 ?auto_5855 ) ) ( HOIST-AT ?auto_5854 ?auto_5858 ) ( SURFACE-AT ?auto_5852 ?auto_5858 ) ( ON ?auto_5852 ?auto_5857 ) ( CLEAR ?auto_5852 ) ( not ( = ?auto_5851 ?auto_5852 ) ) ( not ( = ?auto_5851 ?auto_5857 ) ) ( not ( = ?auto_5852 ?auto_5857 ) ) ( not ( = ?auto_5856 ?auto_5854 ) ) ( IS-CRATE ?auto_5851 ) ( not ( = ?auto_5862 ?auto_5855 ) ) ( HOIST-AT ?auto_5867 ?auto_5862 ) ( SURFACE-AT ?auto_5851 ?auto_5862 ) ( ON ?auto_5851 ?auto_5863 ) ( CLEAR ?auto_5851 ) ( not ( = ?auto_5850 ?auto_5851 ) ) ( not ( = ?auto_5850 ?auto_5863 ) ) ( not ( = ?auto_5851 ?auto_5863 ) ) ( not ( = ?auto_5856 ?auto_5867 ) ) ( IS-CRATE ?auto_5850 ) ( SURFACE-AT ?auto_5850 ?auto_5862 ) ( ON ?auto_5850 ?auto_5868 ) ( CLEAR ?auto_5850 ) ( not ( = ?auto_5849 ?auto_5850 ) ) ( not ( = ?auto_5849 ?auto_5868 ) ) ( not ( = ?auto_5850 ?auto_5868 ) ) ( IS-CRATE ?auto_5849 ) ( not ( = ?auto_5865 ?auto_5855 ) ) ( HOIST-AT ?auto_5859 ?auto_5865 ) ( AVAILABLE ?auto_5859 ) ( SURFACE-AT ?auto_5849 ?auto_5865 ) ( ON ?auto_5849 ?auto_5860 ) ( CLEAR ?auto_5849 ) ( not ( = ?auto_5848 ?auto_5849 ) ) ( not ( = ?auto_5848 ?auto_5860 ) ) ( not ( = ?auto_5849 ?auto_5860 ) ) ( not ( = ?auto_5856 ?auto_5859 ) ) ( IS-CRATE ?auto_5848 ) ( AVAILABLE ?auto_5867 ) ( SURFACE-AT ?auto_5848 ?auto_5862 ) ( ON ?auto_5848 ?auto_5866 ) ( CLEAR ?auto_5848 ) ( not ( = ?auto_5847 ?auto_5848 ) ) ( not ( = ?auto_5847 ?auto_5866 ) ) ( not ( = ?auto_5848 ?auto_5866 ) ) ( IS-CRATE ?auto_5847 ) ( not ( = ?auto_5869 ?auto_5855 ) ) ( HOIST-AT ?auto_5870 ?auto_5869 ) ( AVAILABLE ?auto_5870 ) ( SURFACE-AT ?auto_5847 ?auto_5869 ) ( ON ?auto_5847 ?auto_5864 ) ( CLEAR ?auto_5847 ) ( not ( = ?auto_5846 ?auto_5847 ) ) ( not ( = ?auto_5846 ?auto_5864 ) ) ( not ( = ?auto_5847 ?auto_5864 ) ) ( not ( = ?auto_5856 ?auto_5870 ) ) ( SURFACE-AT ?auto_5845 ?auto_5855 ) ( CLEAR ?auto_5845 ) ( IS-CRATE ?auto_5846 ) ( AVAILABLE ?auto_5856 ) ( AVAILABLE ?auto_5854 ) ( SURFACE-AT ?auto_5846 ?auto_5858 ) ( ON ?auto_5846 ?auto_5861 ) ( CLEAR ?auto_5846 ) ( TRUCK-AT ?auto_5853 ?auto_5855 ) ( not ( = ?auto_5845 ?auto_5846 ) ) ( not ( = ?auto_5845 ?auto_5861 ) ) ( not ( = ?auto_5846 ?auto_5861 ) ) ( not ( = ?auto_5845 ?auto_5847 ) ) ( not ( = ?auto_5845 ?auto_5864 ) ) ( not ( = ?auto_5847 ?auto_5861 ) ) ( not ( = ?auto_5869 ?auto_5858 ) ) ( not ( = ?auto_5870 ?auto_5854 ) ) ( not ( = ?auto_5864 ?auto_5861 ) ) ( not ( = ?auto_5845 ?auto_5848 ) ) ( not ( = ?auto_5845 ?auto_5866 ) ) ( not ( = ?auto_5846 ?auto_5848 ) ) ( not ( = ?auto_5846 ?auto_5866 ) ) ( not ( = ?auto_5848 ?auto_5864 ) ) ( not ( = ?auto_5848 ?auto_5861 ) ) ( not ( = ?auto_5862 ?auto_5869 ) ) ( not ( = ?auto_5862 ?auto_5858 ) ) ( not ( = ?auto_5867 ?auto_5870 ) ) ( not ( = ?auto_5867 ?auto_5854 ) ) ( not ( = ?auto_5866 ?auto_5864 ) ) ( not ( = ?auto_5866 ?auto_5861 ) ) ( not ( = ?auto_5845 ?auto_5849 ) ) ( not ( = ?auto_5845 ?auto_5860 ) ) ( not ( = ?auto_5846 ?auto_5849 ) ) ( not ( = ?auto_5846 ?auto_5860 ) ) ( not ( = ?auto_5847 ?auto_5849 ) ) ( not ( = ?auto_5847 ?auto_5860 ) ) ( not ( = ?auto_5849 ?auto_5866 ) ) ( not ( = ?auto_5849 ?auto_5864 ) ) ( not ( = ?auto_5849 ?auto_5861 ) ) ( not ( = ?auto_5865 ?auto_5862 ) ) ( not ( = ?auto_5865 ?auto_5869 ) ) ( not ( = ?auto_5865 ?auto_5858 ) ) ( not ( = ?auto_5859 ?auto_5867 ) ) ( not ( = ?auto_5859 ?auto_5870 ) ) ( not ( = ?auto_5859 ?auto_5854 ) ) ( not ( = ?auto_5860 ?auto_5866 ) ) ( not ( = ?auto_5860 ?auto_5864 ) ) ( not ( = ?auto_5860 ?auto_5861 ) ) ( not ( = ?auto_5845 ?auto_5850 ) ) ( not ( = ?auto_5845 ?auto_5868 ) ) ( not ( = ?auto_5846 ?auto_5850 ) ) ( not ( = ?auto_5846 ?auto_5868 ) ) ( not ( = ?auto_5847 ?auto_5850 ) ) ( not ( = ?auto_5847 ?auto_5868 ) ) ( not ( = ?auto_5848 ?auto_5850 ) ) ( not ( = ?auto_5848 ?auto_5868 ) ) ( not ( = ?auto_5850 ?auto_5860 ) ) ( not ( = ?auto_5850 ?auto_5866 ) ) ( not ( = ?auto_5850 ?auto_5864 ) ) ( not ( = ?auto_5850 ?auto_5861 ) ) ( not ( = ?auto_5868 ?auto_5860 ) ) ( not ( = ?auto_5868 ?auto_5866 ) ) ( not ( = ?auto_5868 ?auto_5864 ) ) ( not ( = ?auto_5868 ?auto_5861 ) ) ( not ( = ?auto_5845 ?auto_5851 ) ) ( not ( = ?auto_5845 ?auto_5863 ) ) ( not ( = ?auto_5846 ?auto_5851 ) ) ( not ( = ?auto_5846 ?auto_5863 ) ) ( not ( = ?auto_5847 ?auto_5851 ) ) ( not ( = ?auto_5847 ?auto_5863 ) ) ( not ( = ?auto_5848 ?auto_5851 ) ) ( not ( = ?auto_5848 ?auto_5863 ) ) ( not ( = ?auto_5849 ?auto_5851 ) ) ( not ( = ?auto_5849 ?auto_5863 ) ) ( not ( = ?auto_5851 ?auto_5868 ) ) ( not ( = ?auto_5851 ?auto_5860 ) ) ( not ( = ?auto_5851 ?auto_5866 ) ) ( not ( = ?auto_5851 ?auto_5864 ) ) ( not ( = ?auto_5851 ?auto_5861 ) ) ( not ( = ?auto_5863 ?auto_5868 ) ) ( not ( = ?auto_5863 ?auto_5860 ) ) ( not ( = ?auto_5863 ?auto_5866 ) ) ( not ( = ?auto_5863 ?auto_5864 ) ) ( not ( = ?auto_5863 ?auto_5861 ) ) ( not ( = ?auto_5845 ?auto_5852 ) ) ( not ( = ?auto_5845 ?auto_5857 ) ) ( not ( = ?auto_5846 ?auto_5852 ) ) ( not ( = ?auto_5846 ?auto_5857 ) ) ( not ( = ?auto_5847 ?auto_5852 ) ) ( not ( = ?auto_5847 ?auto_5857 ) ) ( not ( = ?auto_5848 ?auto_5852 ) ) ( not ( = ?auto_5848 ?auto_5857 ) ) ( not ( = ?auto_5849 ?auto_5852 ) ) ( not ( = ?auto_5849 ?auto_5857 ) ) ( not ( = ?auto_5850 ?auto_5852 ) ) ( not ( = ?auto_5850 ?auto_5857 ) ) ( not ( = ?auto_5852 ?auto_5863 ) ) ( not ( = ?auto_5852 ?auto_5868 ) ) ( not ( = ?auto_5852 ?auto_5860 ) ) ( not ( = ?auto_5852 ?auto_5866 ) ) ( not ( = ?auto_5852 ?auto_5864 ) ) ( not ( = ?auto_5852 ?auto_5861 ) ) ( not ( = ?auto_5857 ?auto_5863 ) ) ( not ( = ?auto_5857 ?auto_5868 ) ) ( not ( = ?auto_5857 ?auto_5860 ) ) ( not ( = ?auto_5857 ?auto_5866 ) ) ( not ( = ?auto_5857 ?auto_5864 ) ) ( not ( = ?auto_5857 ?auto_5861 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_5845 ?auto_5846 ?auto_5847 ?auto_5848 ?auto_5849 ?auto_5850 ?auto_5851 )
      ( MAKE-1CRATE ?auto_5851 ?auto_5852 )
      ( MAKE-7CRATE-VERIFY ?auto_5845 ?auto_5846 ?auto_5847 ?auto_5848 ?auto_5849 ?auto_5850 ?auto_5851 ?auto_5852 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5873 - SURFACE
      ?auto_5874 - SURFACE
    )
    :vars
    (
      ?auto_5875 - HOIST
      ?auto_5876 - PLACE
      ?auto_5878 - PLACE
      ?auto_5879 - HOIST
      ?auto_5880 - SURFACE
      ?auto_5877 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5875 ?auto_5876 ) ( SURFACE-AT ?auto_5873 ?auto_5876 ) ( CLEAR ?auto_5873 ) ( IS-CRATE ?auto_5874 ) ( AVAILABLE ?auto_5875 ) ( not ( = ?auto_5878 ?auto_5876 ) ) ( HOIST-AT ?auto_5879 ?auto_5878 ) ( AVAILABLE ?auto_5879 ) ( SURFACE-AT ?auto_5874 ?auto_5878 ) ( ON ?auto_5874 ?auto_5880 ) ( CLEAR ?auto_5874 ) ( TRUCK-AT ?auto_5877 ?auto_5876 ) ( not ( = ?auto_5873 ?auto_5874 ) ) ( not ( = ?auto_5873 ?auto_5880 ) ) ( not ( = ?auto_5874 ?auto_5880 ) ) ( not ( = ?auto_5875 ?auto_5879 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5877 ?auto_5876 ?auto_5878 )
      ( !LIFT ?auto_5879 ?auto_5874 ?auto_5880 ?auto_5878 )
      ( !LOAD ?auto_5879 ?auto_5874 ?auto_5877 ?auto_5878 )
      ( !DRIVE ?auto_5877 ?auto_5878 ?auto_5876 )
      ( !UNLOAD ?auto_5875 ?auto_5874 ?auto_5877 ?auto_5876 )
      ( !DROP ?auto_5875 ?auto_5874 ?auto_5873 ?auto_5876 )
      ( MAKE-1CRATE-VERIFY ?auto_5873 ?auto_5874 ) )
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
      ?auto_5898 - SURFACE
      ?auto_5897 - SURFACE
    )
    :vars
    (
      ?auto_5901 - HOIST
      ?auto_5902 - PLACE
      ?auto_5899 - PLACE
      ?auto_5903 - HOIST
      ?auto_5904 - SURFACE
      ?auto_5916 - PLACE
      ?auto_5905 - HOIST
      ?auto_5917 - SURFACE
      ?auto_5906 - PLACE
      ?auto_5910 - HOIST
      ?auto_5915 - SURFACE
      ?auto_5911 - SURFACE
      ?auto_5913 - PLACE
      ?auto_5909 - HOIST
      ?auto_5907 - SURFACE
      ?auto_5912 - SURFACE
      ?auto_5914 - SURFACE
      ?auto_5908 - SURFACE
      ?auto_5900 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5901 ?auto_5902 ) ( IS-CRATE ?auto_5897 ) ( not ( = ?auto_5899 ?auto_5902 ) ) ( HOIST-AT ?auto_5903 ?auto_5899 ) ( SURFACE-AT ?auto_5897 ?auto_5899 ) ( ON ?auto_5897 ?auto_5904 ) ( CLEAR ?auto_5897 ) ( not ( = ?auto_5898 ?auto_5897 ) ) ( not ( = ?auto_5898 ?auto_5904 ) ) ( not ( = ?auto_5897 ?auto_5904 ) ) ( not ( = ?auto_5901 ?auto_5903 ) ) ( IS-CRATE ?auto_5898 ) ( not ( = ?auto_5916 ?auto_5902 ) ) ( HOIST-AT ?auto_5905 ?auto_5916 ) ( SURFACE-AT ?auto_5898 ?auto_5916 ) ( ON ?auto_5898 ?auto_5917 ) ( CLEAR ?auto_5898 ) ( not ( = ?auto_5896 ?auto_5898 ) ) ( not ( = ?auto_5896 ?auto_5917 ) ) ( not ( = ?auto_5898 ?auto_5917 ) ) ( not ( = ?auto_5901 ?auto_5905 ) ) ( IS-CRATE ?auto_5896 ) ( not ( = ?auto_5906 ?auto_5902 ) ) ( HOIST-AT ?auto_5910 ?auto_5906 ) ( SURFACE-AT ?auto_5896 ?auto_5906 ) ( ON ?auto_5896 ?auto_5915 ) ( CLEAR ?auto_5896 ) ( not ( = ?auto_5895 ?auto_5896 ) ) ( not ( = ?auto_5895 ?auto_5915 ) ) ( not ( = ?auto_5896 ?auto_5915 ) ) ( not ( = ?auto_5901 ?auto_5910 ) ) ( IS-CRATE ?auto_5895 ) ( SURFACE-AT ?auto_5895 ?auto_5906 ) ( ON ?auto_5895 ?auto_5911 ) ( CLEAR ?auto_5895 ) ( not ( = ?auto_5894 ?auto_5895 ) ) ( not ( = ?auto_5894 ?auto_5911 ) ) ( not ( = ?auto_5895 ?auto_5911 ) ) ( IS-CRATE ?auto_5894 ) ( not ( = ?auto_5913 ?auto_5902 ) ) ( HOIST-AT ?auto_5909 ?auto_5913 ) ( AVAILABLE ?auto_5909 ) ( SURFACE-AT ?auto_5894 ?auto_5913 ) ( ON ?auto_5894 ?auto_5907 ) ( CLEAR ?auto_5894 ) ( not ( = ?auto_5893 ?auto_5894 ) ) ( not ( = ?auto_5893 ?auto_5907 ) ) ( not ( = ?auto_5894 ?auto_5907 ) ) ( not ( = ?auto_5901 ?auto_5909 ) ) ( IS-CRATE ?auto_5893 ) ( AVAILABLE ?auto_5910 ) ( SURFACE-AT ?auto_5893 ?auto_5906 ) ( ON ?auto_5893 ?auto_5912 ) ( CLEAR ?auto_5893 ) ( not ( = ?auto_5892 ?auto_5893 ) ) ( not ( = ?auto_5892 ?auto_5912 ) ) ( not ( = ?auto_5893 ?auto_5912 ) ) ( IS-CRATE ?auto_5892 ) ( AVAILABLE ?auto_5903 ) ( SURFACE-AT ?auto_5892 ?auto_5899 ) ( ON ?auto_5892 ?auto_5914 ) ( CLEAR ?auto_5892 ) ( not ( = ?auto_5891 ?auto_5892 ) ) ( not ( = ?auto_5891 ?auto_5914 ) ) ( not ( = ?auto_5892 ?auto_5914 ) ) ( SURFACE-AT ?auto_5890 ?auto_5902 ) ( CLEAR ?auto_5890 ) ( IS-CRATE ?auto_5891 ) ( AVAILABLE ?auto_5901 ) ( AVAILABLE ?auto_5905 ) ( SURFACE-AT ?auto_5891 ?auto_5916 ) ( ON ?auto_5891 ?auto_5908 ) ( CLEAR ?auto_5891 ) ( TRUCK-AT ?auto_5900 ?auto_5902 ) ( not ( = ?auto_5890 ?auto_5891 ) ) ( not ( = ?auto_5890 ?auto_5908 ) ) ( not ( = ?auto_5891 ?auto_5908 ) ) ( not ( = ?auto_5890 ?auto_5892 ) ) ( not ( = ?auto_5890 ?auto_5914 ) ) ( not ( = ?auto_5892 ?auto_5908 ) ) ( not ( = ?auto_5899 ?auto_5916 ) ) ( not ( = ?auto_5903 ?auto_5905 ) ) ( not ( = ?auto_5914 ?auto_5908 ) ) ( not ( = ?auto_5890 ?auto_5893 ) ) ( not ( = ?auto_5890 ?auto_5912 ) ) ( not ( = ?auto_5891 ?auto_5893 ) ) ( not ( = ?auto_5891 ?auto_5912 ) ) ( not ( = ?auto_5893 ?auto_5914 ) ) ( not ( = ?auto_5893 ?auto_5908 ) ) ( not ( = ?auto_5906 ?auto_5899 ) ) ( not ( = ?auto_5906 ?auto_5916 ) ) ( not ( = ?auto_5910 ?auto_5903 ) ) ( not ( = ?auto_5910 ?auto_5905 ) ) ( not ( = ?auto_5912 ?auto_5914 ) ) ( not ( = ?auto_5912 ?auto_5908 ) ) ( not ( = ?auto_5890 ?auto_5894 ) ) ( not ( = ?auto_5890 ?auto_5907 ) ) ( not ( = ?auto_5891 ?auto_5894 ) ) ( not ( = ?auto_5891 ?auto_5907 ) ) ( not ( = ?auto_5892 ?auto_5894 ) ) ( not ( = ?auto_5892 ?auto_5907 ) ) ( not ( = ?auto_5894 ?auto_5912 ) ) ( not ( = ?auto_5894 ?auto_5914 ) ) ( not ( = ?auto_5894 ?auto_5908 ) ) ( not ( = ?auto_5913 ?auto_5906 ) ) ( not ( = ?auto_5913 ?auto_5899 ) ) ( not ( = ?auto_5913 ?auto_5916 ) ) ( not ( = ?auto_5909 ?auto_5910 ) ) ( not ( = ?auto_5909 ?auto_5903 ) ) ( not ( = ?auto_5909 ?auto_5905 ) ) ( not ( = ?auto_5907 ?auto_5912 ) ) ( not ( = ?auto_5907 ?auto_5914 ) ) ( not ( = ?auto_5907 ?auto_5908 ) ) ( not ( = ?auto_5890 ?auto_5895 ) ) ( not ( = ?auto_5890 ?auto_5911 ) ) ( not ( = ?auto_5891 ?auto_5895 ) ) ( not ( = ?auto_5891 ?auto_5911 ) ) ( not ( = ?auto_5892 ?auto_5895 ) ) ( not ( = ?auto_5892 ?auto_5911 ) ) ( not ( = ?auto_5893 ?auto_5895 ) ) ( not ( = ?auto_5893 ?auto_5911 ) ) ( not ( = ?auto_5895 ?auto_5907 ) ) ( not ( = ?auto_5895 ?auto_5912 ) ) ( not ( = ?auto_5895 ?auto_5914 ) ) ( not ( = ?auto_5895 ?auto_5908 ) ) ( not ( = ?auto_5911 ?auto_5907 ) ) ( not ( = ?auto_5911 ?auto_5912 ) ) ( not ( = ?auto_5911 ?auto_5914 ) ) ( not ( = ?auto_5911 ?auto_5908 ) ) ( not ( = ?auto_5890 ?auto_5896 ) ) ( not ( = ?auto_5890 ?auto_5915 ) ) ( not ( = ?auto_5891 ?auto_5896 ) ) ( not ( = ?auto_5891 ?auto_5915 ) ) ( not ( = ?auto_5892 ?auto_5896 ) ) ( not ( = ?auto_5892 ?auto_5915 ) ) ( not ( = ?auto_5893 ?auto_5896 ) ) ( not ( = ?auto_5893 ?auto_5915 ) ) ( not ( = ?auto_5894 ?auto_5896 ) ) ( not ( = ?auto_5894 ?auto_5915 ) ) ( not ( = ?auto_5896 ?auto_5911 ) ) ( not ( = ?auto_5896 ?auto_5907 ) ) ( not ( = ?auto_5896 ?auto_5912 ) ) ( not ( = ?auto_5896 ?auto_5914 ) ) ( not ( = ?auto_5896 ?auto_5908 ) ) ( not ( = ?auto_5915 ?auto_5911 ) ) ( not ( = ?auto_5915 ?auto_5907 ) ) ( not ( = ?auto_5915 ?auto_5912 ) ) ( not ( = ?auto_5915 ?auto_5914 ) ) ( not ( = ?auto_5915 ?auto_5908 ) ) ( not ( = ?auto_5890 ?auto_5898 ) ) ( not ( = ?auto_5890 ?auto_5917 ) ) ( not ( = ?auto_5891 ?auto_5898 ) ) ( not ( = ?auto_5891 ?auto_5917 ) ) ( not ( = ?auto_5892 ?auto_5898 ) ) ( not ( = ?auto_5892 ?auto_5917 ) ) ( not ( = ?auto_5893 ?auto_5898 ) ) ( not ( = ?auto_5893 ?auto_5917 ) ) ( not ( = ?auto_5894 ?auto_5898 ) ) ( not ( = ?auto_5894 ?auto_5917 ) ) ( not ( = ?auto_5895 ?auto_5898 ) ) ( not ( = ?auto_5895 ?auto_5917 ) ) ( not ( = ?auto_5898 ?auto_5915 ) ) ( not ( = ?auto_5898 ?auto_5911 ) ) ( not ( = ?auto_5898 ?auto_5907 ) ) ( not ( = ?auto_5898 ?auto_5912 ) ) ( not ( = ?auto_5898 ?auto_5914 ) ) ( not ( = ?auto_5898 ?auto_5908 ) ) ( not ( = ?auto_5917 ?auto_5915 ) ) ( not ( = ?auto_5917 ?auto_5911 ) ) ( not ( = ?auto_5917 ?auto_5907 ) ) ( not ( = ?auto_5917 ?auto_5912 ) ) ( not ( = ?auto_5917 ?auto_5914 ) ) ( not ( = ?auto_5917 ?auto_5908 ) ) ( not ( = ?auto_5890 ?auto_5897 ) ) ( not ( = ?auto_5890 ?auto_5904 ) ) ( not ( = ?auto_5891 ?auto_5897 ) ) ( not ( = ?auto_5891 ?auto_5904 ) ) ( not ( = ?auto_5892 ?auto_5897 ) ) ( not ( = ?auto_5892 ?auto_5904 ) ) ( not ( = ?auto_5893 ?auto_5897 ) ) ( not ( = ?auto_5893 ?auto_5904 ) ) ( not ( = ?auto_5894 ?auto_5897 ) ) ( not ( = ?auto_5894 ?auto_5904 ) ) ( not ( = ?auto_5895 ?auto_5897 ) ) ( not ( = ?auto_5895 ?auto_5904 ) ) ( not ( = ?auto_5896 ?auto_5897 ) ) ( not ( = ?auto_5896 ?auto_5904 ) ) ( not ( = ?auto_5897 ?auto_5917 ) ) ( not ( = ?auto_5897 ?auto_5915 ) ) ( not ( = ?auto_5897 ?auto_5911 ) ) ( not ( = ?auto_5897 ?auto_5907 ) ) ( not ( = ?auto_5897 ?auto_5912 ) ) ( not ( = ?auto_5897 ?auto_5914 ) ) ( not ( = ?auto_5897 ?auto_5908 ) ) ( not ( = ?auto_5904 ?auto_5917 ) ) ( not ( = ?auto_5904 ?auto_5915 ) ) ( not ( = ?auto_5904 ?auto_5911 ) ) ( not ( = ?auto_5904 ?auto_5907 ) ) ( not ( = ?auto_5904 ?auto_5912 ) ) ( not ( = ?auto_5904 ?auto_5914 ) ) ( not ( = ?auto_5904 ?auto_5908 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_5890 ?auto_5891 ?auto_5892 ?auto_5893 ?auto_5894 ?auto_5895 ?auto_5896 ?auto_5898 )
      ( MAKE-1CRATE ?auto_5898 ?auto_5897 )
      ( MAKE-8CRATE-VERIFY ?auto_5890 ?auto_5891 ?auto_5892 ?auto_5893 ?auto_5894 ?auto_5895 ?auto_5896 ?auto_5898 ?auto_5897 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5920 - SURFACE
      ?auto_5921 - SURFACE
    )
    :vars
    (
      ?auto_5922 - HOIST
      ?auto_5923 - PLACE
      ?auto_5925 - PLACE
      ?auto_5926 - HOIST
      ?auto_5927 - SURFACE
      ?auto_5924 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5922 ?auto_5923 ) ( SURFACE-AT ?auto_5920 ?auto_5923 ) ( CLEAR ?auto_5920 ) ( IS-CRATE ?auto_5921 ) ( AVAILABLE ?auto_5922 ) ( not ( = ?auto_5925 ?auto_5923 ) ) ( HOIST-AT ?auto_5926 ?auto_5925 ) ( AVAILABLE ?auto_5926 ) ( SURFACE-AT ?auto_5921 ?auto_5925 ) ( ON ?auto_5921 ?auto_5927 ) ( CLEAR ?auto_5921 ) ( TRUCK-AT ?auto_5924 ?auto_5923 ) ( not ( = ?auto_5920 ?auto_5921 ) ) ( not ( = ?auto_5920 ?auto_5927 ) ) ( not ( = ?auto_5921 ?auto_5927 ) ) ( not ( = ?auto_5922 ?auto_5926 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5924 ?auto_5923 ?auto_5925 )
      ( !LIFT ?auto_5926 ?auto_5921 ?auto_5927 ?auto_5925 )
      ( !LOAD ?auto_5926 ?auto_5921 ?auto_5924 ?auto_5925 )
      ( !DRIVE ?auto_5924 ?auto_5925 ?auto_5923 )
      ( !UNLOAD ?auto_5922 ?auto_5921 ?auto_5924 ?auto_5923 )
      ( !DROP ?auto_5922 ?auto_5921 ?auto_5920 ?auto_5923 )
      ( MAKE-1CRATE-VERIFY ?auto_5920 ?auto_5921 ) )
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
      ?auto_5947 - SURFACE
      ?auto_5946 - SURFACE
      ?auto_5945 - SURFACE
    )
    :vars
    (
      ?auto_5948 - HOIST
      ?auto_5953 - PLACE
      ?auto_5949 - PLACE
      ?auto_5951 - HOIST
      ?auto_5952 - SURFACE
      ?auto_5963 - PLACE
      ?auto_5964 - HOIST
      ?auto_5954 - SURFACE
      ?auto_5967 - PLACE
      ?auto_5959 - HOIST
      ?auto_5968 - SURFACE
      ?auto_5969 - PLACE
      ?auto_5957 - HOIST
      ?auto_5962 - SURFACE
      ?auto_5956 - SURFACE
      ?auto_5961 - PLACE
      ?auto_5958 - HOIST
      ?auto_5955 - SURFACE
      ?auto_5965 - SURFACE
      ?auto_5960 - SURFACE
      ?auto_5966 - SURFACE
      ?auto_5950 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5948 ?auto_5953 ) ( IS-CRATE ?auto_5945 ) ( not ( = ?auto_5949 ?auto_5953 ) ) ( HOIST-AT ?auto_5951 ?auto_5949 ) ( AVAILABLE ?auto_5951 ) ( SURFACE-AT ?auto_5945 ?auto_5949 ) ( ON ?auto_5945 ?auto_5952 ) ( CLEAR ?auto_5945 ) ( not ( = ?auto_5946 ?auto_5945 ) ) ( not ( = ?auto_5946 ?auto_5952 ) ) ( not ( = ?auto_5945 ?auto_5952 ) ) ( not ( = ?auto_5948 ?auto_5951 ) ) ( IS-CRATE ?auto_5946 ) ( not ( = ?auto_5963 ?auto_5953 ) ) ( HOIST-AT ?auto_5964 ?auto_5963 ) ( SURFACE-AT ?auto_5946 ?auto_5963 ) ( ON ?auto_5946 ?auto_5954 ) ( CLEAR ?auto_5946 ) ( not ( = ?auto_5947 ?auto_5946 ) ) ( not ( = ?auto_5947 ?auto_5954 ) ) ( not ( = ?auto_5946 ?auto_5954 ) ) ( not ( = ?auto_5948 ?auto_5964 ) ) ( IS-CRATE ?auto_5947 ) ( not ( = ?auto_5967 ?auto_5953 ) ) ( HOIST-AT ?auto_5959 ?auto_5967 ) ( SURFACE-AT ?auto_5947 ?auto_5967 ) ( ON ?auto_5947 ?auto_5968 ) ( CLEAR ?auto_5947 ) ( not ( = ?auto_5944 ?auto_5947 ) ) ( not ( = ?auto_5944 ?auto_5968 ) ) ( not ( = ?auto_5947 ?auto_5968 ) ) ( not ( = ?auto_5948 ?auto_5959 ) ) ( IS-CRATE ?auto_5944 ) ( not ( = ?auto_5969 ?auto_5953 ) ) ( HOIST-AT ?auto_5957 ?auto_5969 ) ( SURFACE-AT ?auto_5944 ?auto_5969 ) ( ON ?auto_5944 ?auto_5962 ) ( CLEAR ?auto_5944 ) ( not ( = ?auto_5943 ?auto_5944 ) ) ( not ( = ?auto_5943 ?auto_5962 ) ) ( not ( = ?auto_5944 ?auto_5962 ) ) ( not ( = ?auto_5948 ?auto_5957 ) ) ( IS-CRATE ?auto_5943 ) ( SURFACE-AT ?auto_5943 ?auto_5969 ) ( ON ?auto_5943 ?auto_5956 ) ( CLEAR ?auto_5943 ) ( not ( = ?auto_5942 ?auto_5943 ) ) ( not ( = ?auto_5942 ?auto_5956 ) ) ( not ( = ?auto_5943 ?auto_5956 ) ) ( IS-CRATE ?auto_5942 ) ( not ( = ?auto_5961 ?auto_5953 ) ) ( HOIST-AT ?auto_5958 ?auto_5961 ) ( AVAILABLE ?auto_5958 ) ( SURFACE-AT ?auto_5942 ?auto_5961 ) ( ON ?auto_5942 ?auto_5955 ) ( CLEAR ?auto_5942 ) ( not ( = ?auto_5941 ?auto_5942 ) ) ( not ( = ?auto_5941 ?auto_5955 ) ) ( not ( = ?auto_5942 ?auto_5955 ) ) ( not ( = ?auto_5948 ?auto_5958 ) ) ( IS-CRATE ?auto_5941 ) ( AVAILABLE ?auto_5957 ) ( SURFACE-AT ?auto_5941 ?auto_5969 ) ( ON ?auto_5941 ?auto_5965 ) ( CLEAR ?auto_5941 ) ( not ( = ?auto_5940 ?auto_5941 ) ) ( not ( = ?auto_5940 ?auto_5965 ) ) ( not ( = ?auto_5941 ?auto_5965 ) ) ( IS-CRATE ?auto_5940 ) ( AVAILABLE ?auto_5964 ) ( SURFACE-AT ?auto_5940 ?auto_5963 ) ( ON ?auto_5940 ?auto_5960 ) ( CLEAR ?auto_5940 ) ( not ( = ?auto_5939 ?auto_5940 ) ) ( not ( = ?auto_5939 ?auto_5960 ) ) ( not ( = ?auto_5940 ?auto_5960 ) ) ( SURFACE-AT ?auto_5938 ?auto_5953 ) ( CLEAR ?auto_5938 ) ( IS-CRATE ?auto_5939 ) ( AVAILABLE ?auto_5948 ) ( AVAILABLE ?auto_5959 ) ( SURFACE-AT ?auto_5939 ?auto_5967 ) ( ON ?auto_5939 ?auto_5966 ) ( CLEAR ?auto_5939 ) ( TRUCK-AT ?auto_5950 ?auto_5953 ) ( not ( = ?auto_5938 ?auto_5939 ) ) ( not ( = ?auto_5938 ?auto_5966 ) ) ( not ( = ?auto_5939 ?auto_5966 ) ) ( not ( = ?auto_5938 ?auto_5940 ) ) ( not ( = ?auto_5938 ?auto_5960 ) ) ( not ( = ?auto_5940 ?auto_5966 ) ) ( not ( = ?auto_5963 ?auto_5967 ) ) ( not ( = ?auto_5964 ?auto_5959 ) ) ( not ( = ?auto_5960 ?auto_5966 ) ) ( not ( = ?auto_5938 ?auto_5941 ) ) ( not ( = ?auto_5938 ?auto_5965 ) ) ( not ( = ?auto_5939 ?auto_5941 ) ) ( not ( = ?auto_5939 ?auto_5965 ) ) ( not ( = ?auto_5941 ?auto_5960 ) ) ( not ( = ?auto_5941 ?auto_5966 ) ) ( not ( = ?auto_5969 ?auto_5963 ) ) ( not ( = ?auto_5969 ?auto_5967 ) ) ( not ( = ?auto_5957 ?auto_5964 ) ) ( not ( = ?auto_5957 ?auto_5959 ) ) ( not ( = ?auto_5965 ?auto_5960 ) ) ( not ( = ?auto_5965 ?auto_5966 ) ) ( not ( = ?auto_5938 ?auto_5942 ) ) ( not ( = ?auto_5938 ?auto_5955 ) ) ( not ( = ?auto_5939 ?auto_5942 ) ) ( not ( = ?auto_5939 ?auto_5955 ) ) ( not ( = ?auto_5940 ?auto_5942 ) ) ( not ( = ?auto_5940 ?auto_5955 ) ) ( not ( = ?auto_5942 ?auto_5965 ) ) ( not ( = ?auto_5942 ?auto_5960 ) ) ( not ( = ?auto_5942 ?auto_5966 ) ) ( not ( = ?auto_5961 ?auto_5969 ) ) ( not ( = ?auto_5961 ?auto_5963 ) ) ( not ( = ?auto_5961 ?auto_5967 ) ) ( not ( = ?auto_5958 ?auto_5957 ) ) ( not ( = ?auto_5958 ?auto_5964 ) ) ( not ( = ?auto_5958 ?auto_5959 ) ) ( not ( = ?auto_5955 ?auto_5965 ) ) ( not ( = ?auto_5955 ?auto_5960 ) ) ( not ( = ?auto_5955 ?auto_5966 ) ) ( not ( = ?auto_5938 ?auto_5943 ) ) ( not ( = ?auto_5938 ?auto_5956 ) ) ( not ( = ?auto_5939 ?auto_5943 ) ) ( not ( = ?auto_5939 ?auto_5956 ) ) ( not ( = ?auto_5940 ?auto_5943 ) ) ( not ( = ?auto_5940 ?auto_5956 ) ) ( not ( = ?auto_5941 ?auto_5943 ) ) ( not ( = ?auto_5941 ?auto_5956 ) ) ( not ( = ?auto_5943 ?auto_5955 ) ) ( not ( = ?auto_5943 ?auto_5965 ) ) ( not ( = ?auto_5943 ?auto_5960 ) ) ( not ( = ?auto_5943 ?auto_5966 ) ) ( not ( = ?auto_5956 ?auto_5955 ) ) ( not ( = ?auto_5956 ?auto_5965 ) ) ( not ( = ?auto_5956 ?auto_5960 ) ) ( not ( = ?auto_5956 ?auto_5966 ) ) ( not ( = ?auto_5938 ?auto_5944 ) ) ( not ( = ?auto_5938 ?auto_5962 ) ) ( not ( = ?auto_5939 ?auto_5944 ) ) ( not ( = ?auto_5939 ?auto_5962 ) ) ( not ( = ?auto_5940 ?auto_5944 ) ) ( not ( = ?auto_5940 ?auto_5962 ) ) ( not ( = ?auto_5941 ?auto_5944 ) ) ( not ( = ?auto_5941 ?auto_5962 ) ) ( not ( = ?auto_5942 ?auto_5944 ) ) ( not ( = ?auto_5942 ?auto_5962 ) ) ( not ( = ?auto_5944 ?auto_5956 ) ) ( not ( = ?auto_5944 ?auto_5955 ) ) ( not ( = ?auto_5944 ?auto_5965 ) ) ( not ( = ?auto_5944 ?auto_5960 ) ) ( not ( = ?auto_5944 ?auto_5966 ) ) ( not ( = ?auto_5962 ?auto_5956 ) ) ( not ( = ?auto_5962 ?auto_5955 ) ) ( not ( = ?auto_5962 ?auto_5965 ) ) ( not ( = ?auto_5962 ?auto_5960 ) ) ( not ( = ?auto_5962 ?auto_5966 ) ) ( not ( = ?auto_5938 ?auto_5947 ) ) ( not ( = ?auto_5938 ?auto_5968 ) ) ( not ( = ?auto_5939 ?auto_5947 ) ) ( not ( = ?auto_5939 ?auto_5968 ) ) ( not ( = ?auto_5940 ?auto_5947 ) ) ( not ( = ?auto_5940 ?auto_5968 ) ) ( not ( = ?auto_5941 ?auto_5947 ) ) ( not ( = ?auto_5941 ?auto_5968 ) ) ( not ( = ?auto_5942 ?auto_5947 ) ) ( not ( = ?auto_5942 ?auto_5968 ) ) ( not ( = ?auto_5943 ?auto_5947 ) ) ( not ( = ?auto_5943 ?auto_5968 ) ) ( not ( = ?auto_5947 ?auto_5962 ) ) ( not ( = ?auto_5947 ?auto_5956 ) ) ( not ( = ?auto_5947 ?auto_5955 ) ) ( not ( = ?auto_5947 ?auto_5965 ) ) ( not ( = ?auto_5947 ?auto_5960 ) ) ( not ( = ?auto_5947 ?auto_5966 ) ) ( not ( = ?auto_5968 ?auto_5962 ) ) ( not ( = ?auto_5968 ?auto_5956 ) ) ( not ( = ?auto_5968 ?auto_5955 ) ) ( not ( = ?auto_5968 ?auto_5965 ) ) ( not ( = ?auto_5968 ?auto_5960 ) ) ( not ( = ?auto_5968 ?auto_5966 ) ) ( not ( = ?auto_5938 ?auto_5946 ) ) ( not ( = ?auto_5938 ?auto_5954 ) ) ( not ( = ?auto_5939 ?auto_5946 ) ) ( not ( = ?auto_5939 ?auto_5954 ) ) ( not ( = ?auto_5940 ?auto_5946 ) ) ( not ( = ?auto_5940 ?auto_5954 ) ) ( not ( = ?auto_5941 ?auto_5946 ) ) ( not ( = ?auto_5941 ?auto_5954 ) ) ( not ( = ?auto_5942 ?auto_5946 ) ) ( not ( = ?auto_5942 ?auto_5954 ) ) ( not ( = ?auto_5943 ?auto_5946 ) ) ( not ( = ?auto_5943 ?auto_5954 ) ) ( not ( = ?auto_5944 ?auto_5946 ) ) ( not ( = ?auto_5944 ?auto_5954 ) ) ( not ( = ?auto_5946 ?auto_5968 ) ) ( not ( = ?auto_5946 ?auto_5962 ) ) ( not ( = ?auto_5946 ?auto_5956 ) ) ( not ( = ?auto_5946 ?auto_5955 ) ) ( not ( = ?auto_5946 ?auto_5965 ) ) ( not ( = ?auto_5946 ?auto_5960 ) ) ( not ( = ?auto_5946 ?auto_5966 ) ) ( not ( = ?auto_5954 ?auto_5968 ) ) ( not ( = ?auto_5954 ?auto_5962 ) ) ( not ( = ?auto_5954 ?auto_5956 ) ) ( not ( = ?auto_5954 ?auto_5955 ) ) ( not ( = ?auto_5954 ?auto_5965 ) ) ( not ( = ?auto_5954 ?auto_5960 ) ) ( not ( = ?auto_5954 ?auto_5966 ) ) ( not ( = ?auto_5938 ?auto_5945 ) ) ( not ( = ?auto_5938 ?auto_5952 ) ) ( not ( = ?auto_5939 ?auto_5945 ) ) ( not ( = ?auto_5939 ?auto_5952 ) ) ( not ( = ?auto_5940 ?auto_5945 ) ) ( not ( = ?auto_5940 ?auto_5952 ) ) ( not ( = ?auto_5941 ?auto_5945 ) ) ( not ( = ?auto_5941 ?auto_5952 ) ) ( not ( = ?auto_5942 ?auto_5945 ) ) ( not ( = ?auto_5942 ?auto_5952 ) ) ( not ( = ?auto_5943 ?auto_5945 ) ) ( not ( = ?auto_5943 ?auto_5952 ) ) ( not ( = ?auto_5944 ?auto_5945 ) ) ( not ( = ?auto_5944 ?auto_5952 ) ) ( not ( = ?auto_5947 ?auto_5945 ) ) ( not ( = ?auto_5947 ?auto_5952 ) ) ( not ( = ?auto_5945 ?auto_5954 ) ) ( not ( = ?auto_5945 ?auto_5968 ) ) ( not ( = ?auto_5945 ?auto_5962 ) ) ( not ( = ?auto_5945 ?auto_5956 ) ) ( not ( = ?auto_5945 ?auto_5955 ) ) ( not ( = ?auto_5945 ?auto_5965 ) ) ( not ( = ?auto_5945 ?auto_5960 ) ) ( not ( = ?auto_5945 ?auto_5966 ) ) ( not ( = ?auto_5949 ?auto_5963 ) ) ( not ( = ?auto_5949 ?auto_5967 ) ) ( not ( = ?auto_5949 ?auto_5969 ) ) ( not ( = ?auto_5949 ?auto_5961 ) ) ( not ( = ?auto_5951 ?auto_5964 ) ) ( not ( = ?auto_5951 ?auto_5959 ) ) ( not ( = ?auto_5951 ?auto_5957 ) ) ( not ( = ?auto_5951 ?auto_5958 ) ) ( not ( = ?auto_5952 ?auto_5954 ) ) ( not ( = ?auto_5952 ?auto_5968 ) ) ( not ( = ?auto_5952 ?auto_5962 ) ) ( not ( = ?auto_5952 ?auto_5956 ) ) ( not ( = ?auto_5952 ?auto_5955 ) ) ( not ( = ?auto_5952 ?auto_5965 ) ) ( not ( = ?auto_5952 ?auto_5960 ) ) ( not ( = ?auto_5952 ?auto_5966 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_5938 ?auto_5939 ?auto_5940 ?auto_5941 ?auto_5942 ?auto_5943 ?auto_5944 ?auto_5947 ?auto_5946 )
      ( MAKE-1CRATE ?auto_5946 ?auto_5945 )
      ( MAKE-9CRATE-VERIFY ?auto_5938 ?auto_5939 ?auto_5940 ?auto_5941 ?auto_5942 ?auto_5943 ?auto_5944 ?auto_5947 ?auto_5946 ?auto_5945 ) )
  )

)

