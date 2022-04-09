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
      ?auto_5664 - SURFACE
      ?auto_5665 - SURFACE
    )
    :vars
    (
      ?auto_5666 - HOIST
      ?auto_5667 - PLACE
      ?auto_5669 - PLACE
      ?auto_5670 - HOIST
      ?auto_5671 - SURFACE
      ?auto_5668 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5666 ?auto_5667 ) ( SURFACE-AT ?auto_5664 ?auto_5667 ) ( CLEAR ?auto_5664 ) ( IS-CRATE ?auto_5665 ) ( AVAILABLE ?auto_5666 ) ( not ( = ?auto_5669 ?auto_5667 ) ) ( HOIST-AT ?auto_5670 ?auto_5669 ) ( AVAILABLE ?auto_5670 ) ( SURFACE-AT ?auto_5665 ?auto_5669 ) ( ON ?auto_5665 ?auto_5671 ) ( CLEAR ?auto_5665 ) ( TRUCK-AT ?auto_5668 ?auto_5667 ) ( not ( = ?auto_5664 ?auto_5665 ) ) ( not ( = ?auto_5664 ?auto_5671 ) ) ( not ( = ?auto_5665 ?auto_5671 ) ) ( not ( = ?auto_5666 ?auto_5670 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5668 ?auto_5667 ?auto_5669 )
      ( !LIFT ?auto_5670 ?auto_5665 ?auto_5671 ?auto_5669 )
      ( !LOAD ?auto_5670 ?auto_5665 ?auto_5668 ?auto_5669 )
      ( !DRIVE ?auto_5668 ?auto_5669 ?auto_5667 )
      ( !UNLOAD ?auto_5666 ?auto_5665 ?auto_5668 ?auto_5667 )
      ( !DROP ?auto_5666 ?auto_5665 ?auto_5664 ?auto_5667 )
      ( MAKE-1CRATE-VERIFY ?auto_5664 ?auto_5665 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5674 - SURFACE
      ?auto_5675 - SURFACE
    )
    :vars
    (
      ?auto_5676 - HOIST
      ?auto_5677 - PLACE
      ?auto_5679 - PLACE
      ?auto_5680 - HOIST
      ?auto_5681 - SURFACE
      ?auto_5678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5676 ?auto_5677 ) ( SURFACE-AT ?auto_5674 ?auto_5677 ) ( CLEAR ?auto_5674 ) ( IS-CRATE ?auto_5675 ) ( AVAILABLE ?auto_5676 ) ( not ( = ?auto_5679 ?auto_5677 ) ) ( HOIST-AT ?auto_5680 ?auto_5679 ) ( AVAILABLE ?auto_5680 ) ( SURFACE-AT ?auto_5675 ?auto_5679 ) ( ON ?auto_5675 ?auto_5681 ) ( CLEAR ?auto_5675 ) ( TRUCK-AT ?auto_5678 ?auto_5677 ) ( not ( = ?auto_5674 ?auto_5675 ) ) ( not ( = ?auto_5674 ?auto_5681 ) ) ( not ( = ?auto_5675 ?auto_5681 ) ) ( not ( = ?auto_5676 ?auto_5680 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5678 ?auto_5677 ?auto_5679 )
      ( !LIFT ?auto_5680 ?auto_5675 ?auto_5681 ?auto_5679 )
      ( !LOAD ?auto_5680 ?auto_5675 ?auto_5678 ?auto_5679 )
      ( !DRIVE ?auto_5678 ?auto_5679 ?auto_5677 )
      ( !UNLOAD ?auto_5676 ?auto_5675 ?auto_5678 ?auto_5677 )
      ( !DROP ?auto_5676 ?auto_5675 ?auto_5674 ?auto_5677 )
      ( MAKE-1CRATE-VERIFY ?auto_5674 ?auto_5675 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5685 - SURFACE
      ?auto_5686 - SURFACE
      ?auto_5687 - SURFACE
    )
    :vars
    (
      ?auto_5689 - HOIST
      ?auto_5688 - PLACE
      ?auto_5690 - PLACE
      ?auto_5692 - HOIST
      ?auto_5691 - SURFACE
      ?auto_5696 - PLACE
      ?auto_5694 - HOIST
      ?auto_5695 - SURFACE
      ?auto_5693 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5689 ?auto_5688 ) ( IS-CRATE ?auto_5687 ) ( not ( = ?auto_5690 ?auto_5688 ) ) ( HOIST-AT ?auto_5692 ?auto_5690 ) ( AVAILABLE ?auto_5692 ) ( SURFACE-AT ?auto_5687 ?auto_5690 ) ( ON ?auto_5687 ?auto_5691 ) ( CLEAR ?auto_5687 ) ( not ( = ?auto_5686 ?auto_5687 ) ) ( not ( = ?auto_5686 ?auto_5691 ) ) ( not ( = ?auto_5687 ?auto_5691 ) ) ( not ( = ?auto_5689 ?auto_5692 ) ) ( SURFACE-AT ?auto_5685 ?auto_5688 ) ( CLEAR ?auto_5685 ) ( IS-CRATE ?auto_5686 ) ( AVAILABLE ?auto_5689 ) ( not ( = ?auto_5696 ?auto_5688 ) ) ( HOIST-AT ?auto_5694 ?auto_5696 ) ( AVAILABLE ?auto_5694 ) ( SURFACE-AT ?auto_5686 ?auto_5696 ) ( ON ?auto_5686 ?auto_5695 ) ( CLEAR ?auto_5686 ) ( TRUCK-AT ?auto_5693 ?auto_5688 ) ( not ( = ?auto_5685 ?auto_5686 ) ) ( not ( = ?auto_5685 ?auto_5695 ) ) ( not ( = ?auto_5686 ?auto_5695 ) ) ( not ( = ?auto_5689 ?auto_5694 ) ) ( not ( = ?auto_5685 ?auto_5687 ) ) ( not ( = ?auto_5685 ?auto_5691 ) ) ( not ( = ?auto_5687 ?auto_5695 ) ) ( not ( = ?auto_5690 ?auto_5696 ) ) ( not ( = ?auto_5692 ?auto_5694 ) ) ( not ( = ?auto_5691 ?auto_5695 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5685 ?auto_5686 )
      ( MAKE-1CRATE ?auto_5686 ?auto_5687 )
      ( MAKE-2CRATE-VERIFY ?auto_5685 ?auto_5686 ?auto_5687 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5699 - SURFACE
      ?auto_5700 - SURFACE
    )
    :vars
    (
      ?auto_5701 - HOIST
      ?auto_5702 - PLACE
      ?auto_5704 - PLACE
      ?auto_5705 - HOIST
      ?auto_5706 - SURFACE
      ?auto_5703 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5701 ?auto_5702 ) ( SURFACE-AT ?auto_5699 ?auto_5702 ) ( CLEAR ?auto_5699 ) ( IS-CRATE ?auto_5700 ) ( AVAILABLE ?auto_5701 ) ( not ( = ?auto_5704 ?auto_5702 ) ) ( HOIST-AT ?auto_5705 ?auto_5704 ) ( AVAILABLE ?auto_5705 ) ( SURFACE-AT ?auto_5700 ?auto_5704 ) ( ON ?auto_5700 ?auto_5706 ) ( CLEAR ?auto_5700 ) ( TRUCK-AT ?auto_5703 ?auto_5702 ) ( not ( = ?auto_5699 ?auto_5700 ) ) ( not ( = ?auto_5699 ?auto_5706 ) ) ( not ( = ?auto_5700 ?auto_5706 ) ) ( not ( = ?auto_5701 ?auto_5705 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5703 ?auto_5702 ?auto_5704 )
      ( !LIFT ?auto_5705 ?auto_5700 ?auto_5706 ?auto_5704 )
      ( !LOAD ?auto_5705 ?auto_5700 ?auto_5703 ?auto_5704 )
      ( !DRIVE ?auto_5703 ?auto_5704 ?auto_5702 )
      ( !UNLOAD ?auto_5701 ?auto_5700 ?auto_5703 ?auto_5702 )
      ( !DROP ?auto_5701 ?auto_5700 ?auto_5699 ?auto_5702 )
      ( MAKE-1CRATE-VERIFY ?auto_5699 ?auto_5700 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5711 - SURFACE
      ?auto_5712 - SURFACE
      ?auto_5713 - SURFACE
      ?auto_5714 - SURFACE
    )
    :vars
    (
      ?auto_5720 - HOIST
      ?auto_5717 - PLACE
      ?auto_5715 - PLACE
      ?auto_5718 - HOIST
      ?auto_5719 - SURFACE
      ?auto_5724 - PLACE
      ?auto_5722 - HOIST
      ?auto_5723 - SURFACE
      ?auto_5721 - PLACE
      ?auto_5725 - HOIST
      ?auto_5726 - SURFACE
      ?auto_5716 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5720 ?auto_5717 ) ( IS-CRATE ?auto_5714 ) ( not ( = ?auto_5715 ?auto_5717 ) ) ( HOIST-AT ?auto_5718 ?auto_5715 ) ( AVAILABLE ?auto_5718 ) ( SURFACE-AT ?auto_5714 ?auto_5715 ) ( ON ?auto_5714 ?auto_5719 ) ( CLEAR ?auto_5714 ) ( not ( = ?auto_5713 ?auto_5714 ) ) ( not ( = ?auto_5713 ?auto_5719 ) ) ( not ( = ?auto_5714 ?auto_5719 ) ) ( not ( = ?auto_5720 ?auto_5718 ) ) ( IS-CRATE ?auto_5713 ) ( not ( = ?auto_5724 ?auto_5717 ) ) ( HOIST-AT ?auto_5722 ?auto_5724 ) ( AVAILABLE ?auto_5722 ) ( SURFACE-AT ?auto_5713 ?auto_5724 ) ( ON ?auto_5713 ?auto_5723 ) ( CLEAR ?auto_5713 ) ( not ( = ?auto_5712 ?auto_5713 ) ) ( not ( = ?auto_5712 ?auto_5723 ) ) ( not ( = ?auto_5713 ?auto_5723 ) ) ( not ( = ?auto_5720 ?auto_5722 ) ) ( SURFACE-AT ?auto_5711 ?auto_5717 ) ( CLEAR ?auto_5711 ) ( IS-CRATE ?auto_5712 ) ( AVAILABLE ?auto_5720 ) ( not ( = ?auto_5721 ?auto_5717 ) ) ( HOIST-AT ?auto_5725 ?auto_5721 ) ( AVAILABLE ?auto_5725 ) ( SURFACE-AT ?auto_5712 ?auto_5721 ) ( ON ?auto_5712 ?auto_5726 ) ( CLEAR ?auto_5712 ) ( TRUCK-AT ?auto_5716 ?auto_5717 ) ( not ( = ?auto_5711 ?auto_5712 ) ) ( not ( = ?auto_5711 ?auto_5726 ) ) ( not ( = ?auto_5712 ?auto_5726 ) ) ( not ( = ?auto_5720 ?auto_5725 ) ) ( not ( = ?auto_5711 ?auto_5713 ) ) ( not ( = ?auto_5711 ?auto_5723 ) ) ( not ( = ?auto_5713 ?auto_5726 ) ) ( not ( = ?auto_5724 ?auto_5721 ) ) ( not ( = ?auto_5722 ?auto_5725 ) ) ( not ( = ?auto_5723 ?auto_5726 ) ) ( not ( = ?auto_5711 ?auto_5714 ) ) ( not ( = ?auto_5711 ?auto_5719 ) ) ( not ( = ?auto_5712 ?auto_5714 ) ) ( not ( = ?auto_5712 ?auto_5719 ) ) ( not ( = ?auto_5714 ?auto_5723 ) ) ( not ( = ?auto_5714 ?auto_5726 ) ) ( not ( = ?auto_5715 ?auto_5724 ) ) ( not ( = ?auto_5715 ?auto_5721 ) ) ( not ( = ?auto_5718 ?auto_5722 ) ) ( not ( = ?auto_5718 ?auto_5725 ) ) ( not ( = ?auto_5719 ?auto_5723 ) ) ( not ( = ?auto_5719 ?auto_5726 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5711 ?auto_5712 ?auto_5713 )
      ( MAKE-1CRATE ?auto_5713 ?auto_5714 )
      ( MAKE-3CRATE-VERIFY ?auto_5711 ?auto_5712 ?auto_5713 ?auto_5714 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5729 - SURFACE
      ?auto_5730 - SURFACE
    )
    :vars
    (
      ?auto_5731 - HOIST
      ?auto_5732 - PLACE
      ?auto_5734 - PLACE
      ?auto_5735 - HOIST
      ?auto_5736 - SURFACE
      ?auto_5733 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5731 ?auto_5732 ) ( SURFACE-AT ?auto_5729 ?auto_5732 ) ( CLEAR ?auto_5729 ) ( IS-CRATE ?auto_5730 ) ( AVAILABLE ?auto_5731 ) ( not ( = ?auto_5734 ?auto_5732 ) ) ( HOIST-AT ?auto_5735 ?auto_5734 ) ( AVAILABLE ?auto_5735 ) ( SURFACE-AT ?auto_5730 ?auto_5734 ) ( ON ?auto_5730 ?auto_5736 ) ( CLEAR ?auto_5730 ) ( TRUCK-AT ?auto_5733 ?auto_5732 ) ( not ( = ?auto_5729 ?auto_5730 ) ) ( not ( = ?auto_5729 ?auto_5736 ) ) ( not ( = ?auto_5730 ?auto_5736 ) ) ( not ( = ?auto_5731 ?auto_5735 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5733 ?auto_5732 ?auto_5734 )
      ( !LIFT ?auto_5735 ?auto_5730 ?auto_5736 ?auto_5734 )
      ( !LOAD ?auto_5735 ?auto_5730 ?auto_5733 ?auto_5734 )
      ( !DRIVE ?auto_5733 ?auto_5734 ?auto_5732 )
      ( !UNLOAD ?auto_5731 ?auto_5730 ?auto_5733 ?auto_5732 )
      ( !DROP ?auto_5731 ?auto_5730 ?auto_5729 ?auto_5732 )
      ( MAKE-1CRATE-VERIFY ?auto_5729 ?auto_5730 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5742 - SURFACE
      ?auto_5743 - SURFACE
      ?auto_5744 - SURFACE
      ?auto_5745 - SURFACE
      ?auto_5746 - SURFACE
    )
    :vars
    (
      ?auto_5750 - HOIST
      ?auto_5747 - PLACE
      ?auto_5748 - PLACE
      ?auto_5752 - HOIST
      ?auto_5751 - SURFACE
      ?auto_5753 - PLACE
      ?auto_5757 - HOIST
      ?auto_5756 - SURFACE
      ?auto_5759 - PLACE
      ?auto_5755 - HOIST
      ?auto_5761 - SURFACE
      ?auto_5758 - PLACE
      ?auto_5760 - HOIST
      ?auto_5754 - SURFACE
      ?auto_5749 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5750 ?auto_5747 ) ( IS-CRATE ?auto_5746 ) ( not ( = ?auto_5748 ?auto_5747 ) ) ( HOIST-AT ?auto_5752 ?auto_5748 ) ( AVAILABLE ?auto_5752 ) ( SURFACE-AT ?auto_5746 ?auto_5748 ) ( ON ?auto_5746 ?auto_5751 ) ( CLEAR ?auto_5746 ) ( not ( = ?auto_5745 ?auto_5746 ) ) ( not ( = ?auto_5745 ?auto_5751 ) ) ( not ( = ?auto_5746 ?auto_5751 ) ) ( not ( = ?auto_5750 ?auto_5752 ) ) ( IS-CRATE ?auto_5745 ) ( not ( = ?auto_5753 ?auto_5747 ) ) ( HOIST-AT ?auto_5757 ?auto_5753 ) ( AVAILABLE ?auto_5757 ) ( SURFACE-AT ?auto_5745 ?auto_5753 ) ( ON ?auto_5745 ?auto_5756 ) ( CLEAR ?auto_5745 ) ( not ( = ?auto_5744 ?auto_5745 ) ) ( not ( = ?auto_5744 ?auto_5756 ) ) ( not ( = ?auto_5745 ?auto_5756 ) ) ( not ( = ?auto_5750 ?auto_5757 ) ) ( IS-CRATE ?auto_5744 ) ( not ( = ?auto_5759 ?auto_5747 ) ) ( HOIST-AT ?auto_5755 ?auto_5759 ) ( AVAILABLE ?auto_5755 ) ( SURFACE-AT ?auto_5744 ?auto_5759 ) ( ON ?auto_5744 ?auto_5761 ) ( CLEAR ?auto_5744 ) ( not ( = ?auto_5743 ?auto_5744 ) ) ( not ( = ?auto_5743 ?auto_5761 ) ) ( not ( = ?auto_5744 ?auto_5761 ) ) ( not ( = ?auto_5750 ?auto_5755 ) ) ( SURFACE-AT ?auto_5742 ?auto_5747 ) ( CLEAR ?auto_5742 ) ( IS-CRATE ?auto_5743 ) ( AVAILABLE ?auto_5750 ) ( not ( = ?auto_5758 ?auto_5747 ) ) ( HOIST-AT ?auto_5760 ?auto_5758 ) ( AVAILABLE ?auto_5760 ) ( SURFACE-AT ?auto_5743 ?auto_5758 ) ( ON ?auto_5743 ?auto_5754 ) ( CLEAR ?auto_5743 ) ( TRUCK-AT ?auto_5749 ?auto_5747 ) ( not ( = ?auto_5742 ?auto_5743 ) ) ( not ( = ?auto_5742 ?auto_5754 ) ) ( not ( = ?auto_5743 ?auto_5754 ) ) ( not ( = ?auto_5750 ?auto_5760 ) ) ( not ( = ?auto_5742 ?auto_5744 ) ) ( not ( = ?auto_5742 ?auto_5761 ) ) ( not ( = ?auto_5744 ?auto_5754 ) ) ( not ( = ?auto_5759 ?auto_5758 ) ) ( not ( = ?auto_5755 ?auto_5760 ) ) ( not ( = ?auto_5761 ?auto_5754 ) ) ( not ( = ?auto_5742 ?auto_5745 ) ) ( not ( = ?auto_5742 ?auto_5756 ) ) ( not ( = ?auto_5743 ?auto_5745 ) ) ( not ( = ?auto_5743 ?auto_5756 ) ) ( not ( = ?auto_5745 ?auto_5761 ) ) ( not ( = ?auto_5745 ?auto_5754 ) ) ( not ( = ?auto_5753 ?auto_5759 ) ) ( not ( = ?auto_5753 ?auto_5758 ) ) ( not ( = ?auto_5757 ?auto_5755 ) ) ( not ( = ?auto_5757 ?auto_5760 ) ) ( not ( = ?auto_5756 ?auto_5761 ) ) ( not ( = ?auto_5756 ?auto_5754 ) ) ( not ( = ?auto_5742 ?auto_5746 ) ) ( not ( = ?auto_5742 ?auto_5751 ) ) ( not ( = ?auto_5743 ?auto_5746 ) ) ( not ( = ?auto_5743 ?auto_5751 ) ) ( not ( = ?auto_5744 ?auto_5746 ) ) ( not ( = ?auto_5744 ?auto_5751 ) ) ( not ( = ?auto_5746 ?auto_5756 ) ) ( not ( = ?auto_5746 ?auto_5761 ) ) ( not ( = ?auto_5746 ?auto_5754 ) ) ( not ( = ?auto_5748 ?auto_5753 ) ) ( not ( = ?auto_5748 ?auto_5759 ) ) ( not ( = ?auto_5748 ?auto_5758 ) ) ( not ( = ?auto_5752 ?auto_5757 ) ) ( not ( = ?auto_5752 ?auto_5755 ) ) ( not ( = ?auto_5752 ?auto_5760 ) ) ( not ( = ?auto_5751 ?auto_5756 ) ) ( not ( = ?auto_5751 ?auto_5761 ) ) ( not ( = ?auto_5751 ?auto_5754 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_5742 ?auto_5743 ?auto_5744 ?auto_5745 )
      ( MAKE-1CRATE ?auto_5745 ?auto_5746 )
      ( MAKE-4CRATE-VERIFY ?auto_5742 ?auto_5743 ?auto_5744 ?auto_5745 ?auto_5746 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5764 - SURFACE
      ?auto_5765 - SURFACE
    )
    :vars
    (
      ?auto_5766 - HOIST
      ?auto_5767 - PLACE
      ?auto_5769 - PLACE
      ?auto_5770 - HOIST
      ?auto_5771 - SURFACE
      ?auto_5768 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5766 ?auto_5767 ) ( SURFACE-AT ?auto_5764 ?auto_5767 ) ( CLEAR ?auto_5764 ) ( IS-CRATE ?auto_5765 ) ( AVAILABLE ?auto_5766 ) ( not ( = ?auto_5769 ?auto_5767 ) ) ( HOIST-AT ?auto_5770 ?auto_5769 ) ( AVAILABLE ?auto_5770 ) ( SURFACE-AT ?auto_5765 ?auto_5769 ) ( ON ?auto_5765 ?auto_5771 ) ( CLEAR ?auto_5765 ) ( TRUCK-AT ?auto_5768 ?auto_5767 ) ( not ( = ?auto_5764 ?auto_5765 ) ) ( not ( = ?auto_5764 ?auto_5771 ) ) ( not ( = ?auto_5765 ?auto_5771 ) ) ( not ( = ?auto_5766 ?auto_5770 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5768 ?auto_5767 ?auto_5769 )
      ( !LIFT ?auto_5770 ?auto_5765 ?auto_5771 ?auto_5769 )
      ( !LOAD ?auto_5770 ?auto_5765 ?auto_5768 ?auto_5769 )
      ( !DRIVE ?auto_5768 ?auto_5769 ?auto_5767 )
      ( !UNLOAD ?auto_5766 ?auto_5765 ?auto_5768 ?auto_5767 )
      ( !DROP ?auto_5766 ?auto_5765 ?auto_5764 ?auto_5767 )
      ( MAKE-1CRATE-VERIFY ?auto_5764 ?auto_5765 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_5778 - SURFACE
      ?auto_5779 - SURFACE
      ?auto_5780 - SURFACE
      ?auto_5781 - SURFACE
      ?auto_5782 - SURFACE
      ?auto_5783 - SURFACE
    )
    :vars
    (
      ?auto_5785 - HOIST
      ?auto_5786 - PLACE
      ?auto_5787 - PLACE
      ?auto_5789 - HOIST
      ?auto_5784 - SURFACE
      ?auto_5795 - SURFACE
      ?auto_5799 - PLACE
      ?auto_5790 - HOIST
      ?auto_5798 - SURFACE
      ?auto_5794 - PLACE
      ?auto_5791 - HOIST
      ?auto_5792 - SURFACE
      ?auto_5793 - PLACE
      ?auto_5796 - HOIST
      ?auto_5797 - SURFACE
      ?auto_5788 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5785 ?auto_5786 ) ( IS-CRATE ?auto_5783 ) ( not ( = ?auto_5787 ?auto_5786 ) ) ( HOIST-AT ?auto_5789 ?auto_5787 ) ( SURFACE-AT ?auto_5783 ?auto_5787 ) ( ON ?auto_5783 ?auto_5784 ) ( CLEAR ?auto_5783 ) ( not ( = ?auto_5782 ?auto_5783 ) ) ( not ( = ?auto_5782 ?auto_5784 ) ) ( not ( = ?auto_5783 ?auto_5784 ) ) ( not ( = ?auto_5785 ?auto_5789 ) ) ( IS-CRATE ?auto_5782 ) ( AVAILABLE ?auto_5789 ) ( SURFACE-AT ?auto_5782 ?auto_5787 ) ( ON ?auto_5782 ?auto_5795 ) ( CLEAR ?auto_5782 ) ( not ( = ?auto_5781 ?auto_5782 ) ) ( not ( = ?auto_5781 ?auto_5795 ) ) ( not ( = ?auto_5782 ?auto_5795 ) ) ( IS-CRATE ?auto_5781 ) ( not ( = ?auto_5799 ?auto_5786 ) ) ( HOIST-AT ?auto_5790 ?auto_5799 ) ( AVAILABLE ?auto_5790 ) ( SURFACE-AT ?auto_5781 ?auto_5799 ) ( ON ?auto_5781 ?auto_5798 ) ( CLEAR ?auto_5781 ) ( not ( = ?auto_5780 ?auto_5781 ) ) ( not ( = ?auto_5780 ?auto_5798 ) ) ( not ( = ?auto_5781 ?auto_5798 ) ) ( not ( = ?auto_5785 ?auto_5790 ) ) ( IS-CRATE ?auto_5780 ) ( not ( = ?auto_5794 ?auto_5786 ) ) ( HOIST-AT ?auto_5791 ?auto_5794 ) ( AVAILABLE ?auto_5791 ) ( SURFACE-AT ?auto_5780 ?auto_5794 ) ( ON ?auto_5780 ?auto_5792 ) ( CLEAR ?auto_5780 ) ( not ( = ?auto_5779 ?auto_5780 ) ) ( not ( = ?auto_5779 ?auto_5792 ) ) ( not ( = ?auto_5780 ?auto_5792 ) ) ( not ( = ?auto_5785 ?auto_5791 ) ) ( SURFACE-AT ?auto_5778 ?auto_5786 ) ( CLEAR ?auto_5778 ) ( IS-CRATE ?auto_5779 ) ( AVAILABLE ?auto_5785 ) ( not ( = ?auto_5793 ?auto_5786 ) ) ( HOIST-AT ?auto_5796 ?auto_5793 ) ( AVAILABLE ?auto_5796 ) ( SURFACE-AT ?auto_5779 ?auto_5793 ) ( ON ?auto_5779 ?auto_5797 ) ( CLEAR ?auto_5779 ) ( TRUCK-AT ?auto_5788 ?auto_5786 ) ( not ( = ?auto_5778 ?auto_5779 ) ) ( not ( = ?auto_5778 ?auto_5797 ) ) ( not ( = ?auto_5779 ?auto_5797 ) ) ( not ( = ?auto_5785 ?auto_5796 ) ) ( not ( = ?auto_5778 ?auto_5780 ) ) ( not ( = ?auto_5778 ?auto_5792 ) ) ( not ( = ?auto_5780 ?auto_5797 ) ) ( not ( = ?auto_5794 ?auto_5793 ) ) ( not ( = ?auto_5791 ?auto_5796 ) ) ( not ( = ?auto_5792 ?auto_5797 ) ) ( not ( = ?auto_5778 ?auto_5781 ) ) ( not ( = ?auto_5778 ?auto_5798 ) ) ( not ( = ?auto_5779 ?auto_5781 ) ) ( not ( = ?auto_5779 ?auto_5798 ) ) ( not ( = ?auto_5781 ?auto_5792 ) ) ( not ( = ?auto_5781 ?auto_5797 ) ) ( not ( = ?auto_5799 ?auto_5794 ) ) ( not ( = ?auto_5799 ?auto_5793 ) ) ( not ( = ?auto_5790 ?auto_5791 ) ) ( not ( = ?auto_5790 ?auto_5796 ) ) ( not ( = ?auto_5798 ?auto_5792 ) ) ( not ( = ?auto_5798 ?auto_5797 ) ) ( not ( = ?auto_5778 ?auto_5782 ) ) ( not ( = ?auto_5778 ?auto_5795 ) ) ( not ( = ?auto_5779 ?auto_5782 ) ) ( not ( = ?auto_5779 ?auto_5795 ) ) ( not ( = ?auto_5780 ?auto_5782 ) ) ( not ( = ?auto_5780 ?auto_5795 ) ) ( not ( = ?auto_5782 ?auto_5798 ) ) ( not ( = ?auto_5782 ?auto_5792 ) ) ( not ( = ?auto_5782 ?auto_5797 ) ) ( not ( = ?auto_5787 ?auto_5799 ) ) ( not ( = ?auto_5787 ?auto_5794 ) ) ( not ( = ?auto_5787 ?auto_5793 ) ) ( not ( = ?auto_5789 ?auto_5790 ) ) ( not ( = ?auto_5789 ?auto_5791 ) ) ( not ( = ?auto_5789 ?auto_5796 ) ) ( not ( = ?auto_5795 ?auto_5798 ) ) ( not ( = ?auto_5795 ?auto_5792 ) ) ( not ( = ?auto_5795 ?auto_5797 ) ) ( not ( = ?auto_5778 ?auto_5783 ) ) ( not ( = ?auto_5778 ?auto_5784 ) ) ( not ( = ?auto_5779 ?auto_5783 ) ) ( not ( = ?auto_5779 ?auto_5784 ) ) ( not ( = ?auto_5780 ?auto_5783 ) ) ( not ( = ?auto_5780 ?auto_5784 ) ) ( not ( = ?auto_5781 ?auto_5783 ) ) ( not ( = ?auto_5781 ?auto_5784 ) ) ( not ( = ?auto_5783 ?auto_5795 ) ) ( not ( = ?auto_5783 ?auto_5798 ) ) ( not ( = ?auto_5783 ?auto_5792 ) ) ( not ( = ?auto_5783 ?auto_5797 ) ) ( not ( = ?auto_5784 ?auto_5795 ) ) ( not ( = ?auto_5784 ?auto_5798 ) ) ( not ( = ?auto_5784 ?auto_5792 ) ) ( not ( = ?auto_5784 ?auto_5797 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_5778 ?auto_5779 ?auto_5780 ?auto_5781 ?auto_5782 )
      ( MAKE-1CRATE ?auto_5782 ?auto_5783 )
      ( MAKE-5CRATE-VERIFY ?auto_5778 ?auto_5779 ?auto_5780 ?auto_5781 ?auto_5782 ?auto_5783 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5802 - SURFACE
      ?auto_5803 - SURFACE
    )
    :vars
    (
      ?auto_5804 - HOIST
      ?auto_5805 - PLACE
      ?auto_5807 - PLACE
      ?auto_5808 - HOIST
      ?auto_5809 - SURFACE
      ?auto_5806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5804 ?auto_5805 ) ( SURFACE-AT ?auto_5802 ?auto_5805 ) ( CLEAR ?auto_5802 ) ( IS-CRATE ?auto_5803 ) ( AVAILABLE ?auto_5804 ) ( not ( = ?auto_5807 ?auto_5805 ) ) ( HOIST-AT ?auto_5808 ?auto_5807 ) ( AVAILABLE ?auto_5808 ) ( SURFACE-AT ?auto_5803 ?auto_5807 ) ( ON ?auto_5803 ?auto_5809 ) ( CLEAR ?auto_5803 ) ( TRUCK-AT ?auto_5806 ?auto_5805 ) ( not ( = ?auto_5802 ?auto_5803 ) ) ( not ( = ?auto_5802 ?auto_5809 ) ) ( not ( = ?auto_5803 ?auto_5809 ) ) ( not ( = ?auto_5804 ?auto_5808 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5806 ?auto_5805 ?auto_5807 )
      ( !LIFT ?auto_5808 ?auto_5803 ?auto_5809 ?auto_5807 )
      ( !LOAD ?auto_5808 ?auto_5803 ?auto_5806 ?auto_5807 )
      ( !DRIVE ?auto_5806 ?auto_5807 ?auto_5805 )
      ( !UNLOAD ?auto_5804 ?auto_5803 ?auto_5806 ?auto_5805 )
      ( !DROP ?auto_5804 ?auto_5803 ?auto_5802 ?auto_5805 )
      ( MAKE-1CRATE-VERIFY ?auto_5802 ?auto_5803 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_5817 - SURFACE
      ?auto_5818 - SURFACE
      ?auto_5819 - SURFACE
      ?auto_5820 - SURFACE
      ?auto_5821 - SURFACE
      ?auto_5822 - SURFACE
      ?auto_5823 - SURFACE
    )
    :vars
    (
      ?auto_5825 - HOIST
      ?auto_5824 - PLACE
      ?auto_5828 - PLACE
      ?auto_5826 - HOIST
      ?auto_5827 - SURFACE
      ?auto_5835 - PLACE
      ?auto_5834 - HOIST
      ?auto_5832 - SURFACE
      ?auto_5839 - SURFACE
      ?auto_5838 - PLACE
      ?auto_5840 - HOIST
      ?auto_5830 - SURFACE
      ?auto_5833 - PLACE
      ?auto_5837 - HOIST
      ?auto_5836 - SURFACE
      ?auto_5831 - SURFACE
      ?auto_5829 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5825 ?auto_5824 ) ( IS-CRATE ?auto_5823 ) ( not ( = ?auto_5828 ?auto_5824 ) ) ( HOIST-AT ?auto_5826 ?auto_5828 ) ( SURFACE-AT ?auto_5823 ?auto_5828 ) ( ON ?auto_5823 ?auto_5827 ) ( CLEAR ?auto_5823 ) ( not ( = ?auto_5822 ?auto_5823 ) ) ( not ( = ?auto_5822 ?auto_5827 ) ) ( not ( = ?auto_5823 ?auto_5827 ) ) ( not ( = ?auto_5825 ?auto_5826 ) ) ( IS-CRATE ?auto_5822 ) ( not ( = ?auto_5835 ?auto_5824 ) ) ( HOIST-AT ?auto_5834 ?auto_5835 ) ( SURFACE-AT ?auto_5822 ?auto_5835 ) ( ON ?auto_5822 ?auto_5832 ) ( CLEAR ?auto_5822 ) ( not ( = ?auto_5821 ?auto_5822 ) ) ( not ( = ?auto_5821 ?auto_5832 ) ) ( not ( = ?auto_5822 ?auto_5832 ) ) ( not ( = ?auto_5825 ?auto_5834 ) ) ( IS-CRATE ?auto_5821 ) ( AVAILABLE ?auto_5834 ) ( SURFACE-AT ?auto_5821 ?auto_5835 ) ( ON ?auto_5821 ?auto_5839 ) ( CLEAR ?auto_5821 ) ( not ( = ?auto_5820 ?auto_5821 ) ) ( not ( = ?auto_5820 ?auto_5839 ) ) ( not ( = ?auto_5821 ?auto_5839 ) ) ( IS-CRATE ?auto_5820 ) ( not ( = ?auto_5838 ?auto_5824 ) ) ( HOIST-AT ?auto_5840 ?auto_5838 ) ( AVAILABLE ?auto_5840 ) ( SURFACE-AT ?auto_5820 ?auto_5838 ) ( ON ?auto_5820 ?auto_5830 ) ( CLEAR ?auto_5820 ) ( not ( = ?auto_5819 ?auto_5820 ) ) ( not ( = ?auto_5819 ?auto_5830 ) ) ( not ( = ?auto_5820 ?auto_5830 ) ) ( not ( = ?auto_5825 ?auto_5840 ) ) ( IS-CRATE ?auto_5819 ) ( not ( = ?auto_5833 ?auto_5824 ) ) ( HOIST-AT ?auto_5837 ?auto_5833 ) ( AVAILABLE ?auto_5837 ) ( SURFACE-AT ?auto_5819 ?auto_5833 ) ( ON ?auto_5819 ?auto_5836 ) ( CLEAR ?auto_5819 ) ( not ( = ?auto_5818 ?auto_5819 ) ) ( not ( = ?auto_5818 ?auto_5836 ) ) ( not ( = ?auto_5819 ?auto_5836 ) ) ( not ( = ?auto_5825 ?auto_5837 ) ) ( SURFACE-AT ?auto_5817 ?auto_5824 ) ( CLEAR ?auto_5817 ) ( IS-CRATE ?auto_5818 ) ( AVAILABLE ?auto_5825 ) ( AVAILABLE ?auto_5826 ) ( SURFACE-AT ?auto_5818 ?auto_5828 ) ( ON ?auto_5818 ?auto_5831 ) ( CLEAR ?auto_5818 ) ( TRUCK-AT ?auto_5829 ?auto_5824 ) ( not ( = ?auto_5817 ?auto_5818 ) ) ( not ( = ?auto_5817 ?auto_5831 ) ) ( not ( = ?auto_5818 ?auto_5831 ) ) ( not ( = ?auto_5817 ?auto_5819 ) ) ( not ( = ?auto_5817 ?auto_5836 ) ) ( not ( = ?auto_5819 ?auto_5831 ) ) ( not ( = ?auto_5833 ?auto_5828 ) ) ( not ( = ?auto_5837 ?auto_5826 ) ) ( not ( = ?auto_5836 ?auto_5831 ) ) ( not ( = ?auto_5817 ?auto_5820 ) ) ( not ( = ?auto_5817 ?auto_5830 ) ) ( not ( = ?auto_5818 ?auto_5820 ) ) ( not ( = ?auto_5818 ?auto_5830 ) ) ( not ( = ?auto_5820 ?auto_5836 ) ) ( not ( = ?auto_5820 ?auto_5831 ) ) ( not ( = ?auto_5838 ?auto_5833 ) ) ( not ( = ?auto_5838 ?auto_5828 ) ) ( not ( = ?auto_5840 ?auto_5837 ) ) ( not ( = ?auto_5840 ?auto_5826 ) ) ( not ( = ?auto_5830 ?auto_5836 ) ) ( not ( = ?auto_5830 ?auto_5831 ) ) ( not ( = ?auto_5817 ?auto_5821 ) ) ( not ( = ?auto_5817 ?auto_5839 ) ) ( not ( = ?auto_5818 ?auto_5821 ) ) ( not ( = ?auto_5818 ?auto_5839 ) ) ( not ( = ?auto_5819 ?auto_5821 ) ) ( not ( = ?auto_5819 ?auto_5839 ) ) ( not ( = ?auto_5821 ?auto_5830 ) ) ( not ( = ?auto_5821 ?auto_5836 ) ) ( not ( = ?auto_5821 ?auto_5831 ) ) ( not ( = ?auto_5835 ?auto_5838 ) ) ( not ( = ?auto_5835 ?auto_5833 ) ) ( not ( = ?auto_5835 ?auto_5828 ) ) ( not ( = ?auto_5834 ?auto_5840 ) ) ( not ( = ?auto_5834 ?auto_5837 ) ) ( not ( = ?auto_5834 ?auto_5826 ) ) ( not ( = ?auto_5839 ?auto_5830 ) ) ( not ( = ?auto_5839 ?auto_5836 ) ) ( not ( = ?auto_5839 ?auto_5831 ) ) ( not ( = ?auto_5817 ?auto_5822 ) ) ( not ( = ?auto_5817 ?auto_5832 ) ) ( not ( = ?auto_5818 ?auto_5822 ) ) ( not ( = ?auto_5818 ?auto_5832 ) ) ( not ( = ?auto_5819 ?auto_5822 ) ) ( not ( = ?auto_5819 ?auto_5832 ) ) ( not ( = ?auto_5820 ?auto_5822 ) ) ( not ( = ?auto_5820 ?auto_5832 ) ) ( not ( = ?auto_5822 ?auto_5839 ) ) ( not ( = ?auto_5822 ?auto_5830 ) ) ( not ( = ?auto_5822 ?auto_5836 ) ) ( not ( = ?auto_5822 ?auto_5831 ) ) ( not ( = ?auto_5832 ?auto_5839 ) ) ( not ( = ?auto_5832 ?auto_5830 ) ) ( not ( = ?auto_5832 ?auto_5836 ) ) ( not ( = ?auto_5832 ?auto_5831 ) ) ( not ( = ?auto_5817 ?auto_5823 ) ) ( not ( = ?auto_5817 ?auto_5827 ) ) ( not ( = ?auto_5818 ?auto_5823 ) ) ( not ( = ?auto_5818 ?auto_5827 ) ) ( not ( = ?auto_5819 ?auto_5823 ) ) ( not ( = ?auto_5819 ?auto_5827 ) ) ( not ( = ?auto_5820 ?auto_5823 ) ) ( not ( = ?auto_5820 ?auto_5827 ) ) ( not ( = ?auto_5821 ?auto_5823 ) ) ( not ( = ?auto_5821 ?auto_5827 ) ) ( not ( = ?auto_5823 ?auto_5832 ) ) ( not ( = ?auto_5823 ?auto_5839 ) ) ( not ( = ?auto_5823 ?auto_5830 ) ) ( not ( = ?auto_5823 ?auto_5836 ) ) ( not ( = ?auto_5823 ?auto_5831 ) ) ( not ( = ?auto_5827 ?auto_5832 ) ) ( not ( = ?auto_5827 ?auto_5839 ) ) ( not ( = ?auto_5827 ?auto_5830 ) ) ( not ( = ?auto_5827 ?auto_5836 ) ) ( not ( = ?auto_5827 ?auto_5831 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_5817 ?auto_5818 ?auto_5819 ?auto_5820 ?auto_5821 ?auto_5822 )
      ( MAKE-1CRATE ?auto_5822 ?auto_5823 )
      ( MAKE-6CRATE-VERIFY ?auto_5817 ?auto_5818 ?auto_5819 ?auto_5820 ?auto_5821 ?auto_5822 ?auto_5823 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5843 - SURFACE
      ?auto_5844 - SURFACE
    )
    :vars
    (
      ?auto_5845 - HOIST
      ?auto_5846 - PLACE
      ?auto_5848 - PLACE
      ?auto_5849 - HOIST
      ?auto_5850 - SURFACE
      ?auto_5847 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5845 ?auto_5846 ) ( SURFACE-AT ?auto_5843 ?auto_5846 ) ( CLEAR ?auto_5843 ) ( IS-CRATE ?auto_5844 ) ( AVAILABLE ?auto_5845 ) ( not ( = ?auto_5848 ?auto_5846 ) ) ( HOIST-AT ?auto_5849 ?auto_5848 ) ( AVAILABLE ?auto_5849 ) ( SURFACE-AT ?auto_5844 ?auto_5848 ) ( ON ?auto_5844 ?auto_5850 ) ( CLEAR ?auto_5844 ) ( TRUCK-AT ?auto_5847 ?auto_5846 ) ( not ( = ?auto_5843 ?auto_5844 ) ) ( not ( = ?auto_5843 ?auto_5850 ) ) ( not ( = ?auto_5844 ?auto_5850 ) ) ( not ( = ?auto_5845 ?auto_5849 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5847 ?auto_5846 ?auto_5848 )
      ( !LIFT ?auto_5849 ?auto_5844 ?auto_5850 ?auto_5848 )
      ( !LOAD ?auto_5849 ?auto_5844 ?auto_5847 ?auto_5848 )
      ( !DRIVE ?auto_5847 ?auto_5848 ?auto_5846 )
      ( !UNLOAD ?auto_5845 ?auto_5844 ?auto_5847 ?auto_5846 )
      ( !DROP ?auto_5845 ?auto_5844 ?auto_5843 ?auto_5846 )
      ( MAKE-1CRATE-VERIFY ?auto_5843 ?auto_5844 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_5859 - SURFACE
      ?auto_5860 - SURFACE
      ?auto_5861 - SURFACE
      ?auto_5862 - SURFACE
      ?auto_5863 - SURFACE
      ?auto_5864 - SURFACE
      ?auto_5866 - SURFACE
      ?auto_5865 - SURFACE
    )
    :vars
    (
      ?auto_5870 - HOIST
      ?auto_5868 - PLACE
      ?auto_5869 - PLACE
      ?auto_5872 - HOIST
      ?auto_5871 - SURFACE
      ?auto_5882 - PLACE
      ?auto_5878 - HOIST
      ?auto_5879 - SURFACE
      ?auto_5874 - PLACE
      ?auto_5883 - HOIST
      ?auto_5881 - SURFACE
      ?auto_5873 - SURFACE
      ?auto_5885 - PLACE
      ?auto_5884 - HOIST
      ?auto_5886 - SURFACE
      ?auto_5876 - PLACE
      ?auto_5875 - HOIST
      ?auto_5877 - SURFACE
      ?auto_5880 - SURFACE
      ?auto_5867 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5870 ?auto_5868 ) ( IS-CRATE ?auto_5865 ) ( not ( = ?auto_5869 ?auto_5868 ) ) ( HOIST-AT ?auto_5872 ?auto_5869 ) ( AVAILABLE ?auto_5872 ) ( SURFACE-AT ?auto_5865 ?auto_5869 ) ( ON ?auto_5865 ?auto_5871 ) ( CLEAR ?auto_5865 ) ( not ( = ?auto_5866 ?auto_5865 ) ) ( not ( = ?auto_5866 ?auto_5871 ) ) ( not ( = ?auto_5865 ?auto_5871 ) ) ( not ( = ?auto_5870 ?auto_5872 ) ) ( IS-CRATE ?auto_5866 ) ( not ( = ?auto_5882 ?auto_5868 ) ) ( HOIST-AT ?auto_5878 ?auto_5882 ) ( SURFACE-AT ?auto_5866 ?auto_5882 ) ( ON ?auto_5866 ?auto_5879 ) ( CLEAR ?auto_5866 ) ( not ( = ?auto_5864 ?auto_5866 ) ) ( not ( = ?auto_5864 ?auto_5879 ) ) ( not ( = ?auto_5866 ?auto_5879 ) ) ( not ( = ?auto_5870 ?auto_5878 ) ) ( IS-CRATE ?auto_5864 ) ( not ( = ?auto_5874 ?auto_5868 ) ) ( HOIST-AT ?auto_5883 ?auto_5874 ) ( SURFACE-AT ?auto_5864 ?auto_5874 ) ( ON ?auto_5864 ?auto_5881 ) ( CLEAR ?auto_5864 ) ( not ( = ?auto_5863 ?auto_5864 ) ) ( not ( = ?auto_5863 ?auto_5881 ) ) ( not ( = ?auto_5864 ?auto_5881 ) ) ( not ( = ?auto_5870 ?auto_5883 ) ) ( IS-CRATE ?auto_5863 ) ( AVAILABLE ?auto_5883 ) ( SURFACE-AT ?auto_5863 ?auto_5874 ) ( ON ?auto_5863 ?auto_5873 ) ( CLEAR ?auto_5863 ) ( not ( = ?auto_5862 ?auto_5863 ) ) ( not ( = ?auto_5862 ?auto_5873 ) ) ( not ( = ?auto_5863 ?auto_5873 ) ) ( IS-CRATE ?auto_5862 ) ( not ( = ?auto_5885 ?auto_5868 ) ) ( HOIST-AT ?auto_5884 ?auto_5885 ) ( AVAILABLE ?auto_5884 ) ( SURFACE-AT ?auto_5862 ?auto_5885 ) ( ON ?auto_5862 ?auto_5886 ) ( CLEAR ?auto_5862 ) ( not ( = ?auto_5861 ?auto_5862 ) ) ( not ( = ?auto_5861 ?auto_5886 ) ) ( not ( = ?auto_5862 ?auto_5886 ) ) ( not ( = ?auto_5870 ?auto_5884 ) ) ( IS-CRATE ?auto_5861 ) ( not ( = ?auto_5876 ?auto_5868 ) ) ( HOIST-AT ?auto_5875 ?auto_5876 ) ( AVAILABLE ?auto_5875 ) ( SURFACE-AT ?auto_5861 ?auto_5876 ) ( ON ?auto_5861 ?auto_5877 ) ( CLEAR ?auto_5861 ) ( not ( = ?auto_5860 ?auto_5861 ) ) ( not ( = ?auto_5860 ?auto_5877 ) ) ( not ( = ?auto_5861 ?auto_5877 ) ) ( not ( = ?auto_5870 ?auto_5875 ) ) ( SURFACE-AT ?auto_5859 ?auto_5868 ) ( CLEAR ?auto_5859 ) ( IS-CRATE ?auto_5860 ) ( AVAILABLE ?auto_5870 ) ( AVAILABLE ?auto_5878 ) ( SURFACE-AT ?auto_5860 ?auto_5882 ) ( ON ?auto_5860 ?auto_5880 ) ( CLEAR ?auto_5860 ) ( TRUCK-AT ?auto_5867 ?auto_5868 ) ( not ( = ?auto_5859 ?auto_5860 ) ) ( not ( = ?auto_5859 ?auto_5880 ) ) ( not ( = ?auto_5860 ?auto_5880 ) ) ( not ( = ?auto_5859 ?auto_5861 ) ) ( not ( = ?auto_5859 ?auto_5877 ) ) ( not ( = ?auto_5861 ?auto_5880 ) ) ( not ( = ?auto_5876 ?auto_5882 ) ) ( not ( = ?auto_5875 ?auto_5878 ) ) ( not ( = ?auto_5877 ?auto_5880 ) ) ( not ( = ?auto_5859 ?auto_5862 ) ) ( not ( = ?auto_5859 ?auto_5886 ) ) ( not ( = ?auto_5860 ?auto_5862 ) ) ( not ( = ?auto_5860 ?auto_5886 ) ) ( not ( = ?auto_5862 ?auto_5877 ) ) ( not ( = ?auto_5862 ?auto_5880 ) ) ( not ( = ?auto_5885 ?auto_5876 ) ) ( not ( = ?auto_5885 ?auto_5882 ) ) ( not ( = ?auto_5884 ?auto_5875 ) ) ( not ( = ?auto_5884 ?auto_5878 ) ) ( not ( = ?auto_5886 ?auto_5877 ) ) ( not ( = ?auto_5886 ?auto_5880 ) ) ( not ( = ?auto_5859 ?auto_5863 ) ) ( not ( = ?auto_5859 ?auto_5873 ) ) ( not ( = ?auto_5860 ?auto_5863 ) ) ( not ( = ?auto_5860 ?auto_5873 ) ) ( not ( = ?auto_5861 ?auto_5863 ) ) ( not ( = ?auto_5861 ?auto_5873 ) ) ( not ( = ?auto_5863 ?auto_5886 ) ) ( not ( = ?auto_5863 ?auto_5877 ) ) ( not ( = ?auto_5863 ?auto_5880 ) ) ( not ( = ?auto_5874 ?auto_5885 ) ) ( not ( = ?auto_5874 ?auto_5876 ) ) ( not ( = ?auto_5874 ?auto_5882 ) ) ( not ( = ?auto_5883 ?auto_5884 ) ) ( not ( = ?auto_5883 ?auto_5875 ) ) ( not ( = ?auto_5883 ?auto_5878 ) ) ( not ( = ?auto_5873 ?auto_5886 ) ) ( not ( = ?auto_5873 ?auto_5877 ) ) ( not ( = ?auto_5873 ?auto_5880 ) ) ( not ( = ?auto_5859 ?auto_5864 ) ) ( not ( = ?auto_5859 ?auto_5881 ) ) ( not ( = ?auto_5860 ?auto_5864 ) ) ( not ( = ?auto_5860 ?auto_5881 ) ) ( not ( = ?auto_5861 ?auto_5864 ) ) ( not ( = ?auto_5861 ?auto_5881 ) ) ( not ( = ?auto_5862 ?auto_5864 ) ) ( not ( = ?auto_5862 ?auto_5881 ) ) ( not ( = ?auto_5864 ?auto_5873 ) ) ( not ( = ?auto_5864 ?auto_5886 ) ) ( not ( = ?auto_5864 ?auto_5877 ) ) ( not ( = ?auto_5864 ?auto_5880 ) ) ( not ( = ?auto_5881 ?auto_5873 ) ) ( not ( = ?auto_5881 ?auto_5886 ) ) ( not ( = ?auto_5881 ?auto_5877 ) ) ( not ( = ?auto_5881 ?auto_5880 ) ) ( not ( = ?auto_5859 ?auto_5866 ) ) ( not ( = ?auto_5859 ?auto_5879 ) ) ( not ( = ?auto_5860 ?auto_5866 ) ) ( not ( = ?auto_5860 ?auto_5879 ) ) ( not ( = ?auto_5861 ?auto_5866 ) ) ( not ( = ?auto_5861 ?auto_5879 ) ) ( not ( = ?auto_5862 ?auto_5866 ) ) ( not ( = ?auto_5862 ?auto_5879 ) ) ( not ( = ?auto_5863 ?auto_5866 ) ) ( not ( = ?auto_5863 ?auto_5879 ) ) ( not ( = ?auto_5866 ?auto_5881 ) ) ( not ( = ?auto_5866 ?auto_5873 ) ) ( not ( = ?auto_5866 ?auto_5886 ) ) ( not ( = ?auto_5866 ?auto_5877 ) ) ( not ( = ?auto_5866 ?auto_5880 ) ) ( not ( = ?auto_5879 ?auto_5881 ) ) ( not ( = ?auto_5879 ?auto_5873 ) ) ( not ( = ?auto_5879 ?auto_5886 ) ) ( not ( = ?auto_5879 ?auto_5877 ) ) ( not ( = ?auto_5879 ?auto_5880 ) ) ( not ( = ?auto_5859 ?auto_5865 ) ) ( not ( = ?auto_5859 ?auto_5871 ) ) ( not ( = ?auto_5860 ?auto_5865 ) ) ( not ( = ?auto_5860 ?auto_5871 ) ) ( not ( = ?auto_5861 ?auto_5865 ) ) ( not ( = ?auto_5861 ?auto_5871 ) ) ( not ( = ?auto_5862 ?auto_5865 ) ) ( not ( = ?auto_5862 ?auto_5871 ) ) ( not ( = ?auto_5863 ?auto_5865 ) ) ( not ( = ?auto_5863 ?auto_5871 ) ) ( not ( = ?auto_5864 ?auto_5865 ) ) ( not ( = ?auto_5864 ?auto_5871 ) ) ( not ( = ?auto_5865 ?auto_5879 ) ) ( not ( = ?auto_5865 ?auto_5881 ) ) ( not ( = ?auto_5865 ?auto_5873 ) ) ( not ( = ?auto_5865 ?auto_5886 ) ) ( not ( = ?auto_5865 ?auto_5877 ) ) ( not ( = ?auto_5865 ?auto_5880 ) ) ( not ( = ?auto_5869 ?auto_5882 ) ) ( not ( = ?auto_5869 ?auto_5874 ) ) ( not ( = ?auto_5869 ?auto_5885 ) ) ( not ( = ?auto_5869 ?auto_5876 ) ) ( not ( = ?auto_5872 ?auto_5878 ) ) ( not ( = ?auto_5872 ?auto_5883 ) ) ( not ( = ?auto_5872 ?auto_5884 ) ) ( not ( = ?auto_5872 ?auto_5875 ) ) ( not ( = ?auto_5871 ?auto_5879 ) ) ( not ( = ?auto_5871 ?auto_5881 ) ) ( not ( = ?auto_5871 ?auto_5873 ) ) ( not ( = ?auto_5871 ?auto_5886 ) ) ( not ( = ?auto_5871 ?auto_5877 ) ) ( not ( = ?auto_5871 ?auto_5880 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_5859 ?auto_5860 ?auto_5861 ?auto_5862 ?auto_5863 ?auto_5864 ?auto_5866 )
      ( MAKE-1CRATE ?auto_5866 ?auto_5865 )
      ( MAKE-7CRATE-VERIFY ?auto_5859 ?auto_5860 ?auto_5861 ?auto_5862 ?auto_5863 ?auto_5864 ?auto_5866 ?auto_5865 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5889 - SURFACE
      ?auto_5890 - SURFACE
    )
    :vars
    (
      ?auto_5891 - HOIST
      ?auto_5892 - PLACE
      ?auto_5894 - PLACE
      ?auto_5895 - HOIST
      ?auto_5896 - SURFACE
      ?auto_5893 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5891 ?auto_5892 ) ( SURFACE-AT ?auto_5889 ?auto_5892 ) ( CLEAR ?auto_5889 ) ( IS-CRATE ?auto_5890 ) ( AVAILABLE ?auto_5891 ) ( not ( = ?auto_5894 ?auto_5892 ) ) ( HOIST-AT ?auto_5895 ?auto_5894 ) ( AVAILABLE ?auto_5895 ) ( SURFACE-AT ?auto_5890 ?auto_5894 ) ( ON ?auto_5890 ?auto_5896 ) ( CLEAR ?auto_5890 ) ( TRUCK-AT ?auto_5893 ?auto_5892 ) ( not ( = ?auto_5889 ?auto_5890 ) ) ( not ( = ?auto_5889 ?auto_5896 ) ) ( not ( = ?auto_5890 ?auto_5896 ) ) ( not ( = ?auto_5891 ?auto_5895 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5893 ?auto_5892 ?auto_5894 )
      ( !LIFT ?auto_5895 ?auto_5890 ?auto_5896 ?auto_5894 )
      ( !LOAD ?auto_5895 ?auto_5890 ?auto_5893 ?auto_5894 )
      ( !DRIVE ?auto_5893 ?auto_5894 ?auto_5892 )
      ( !UNLOAD ?auto_5891 ?auto_5890 ?auto_5893 ?auto_5892 )
      ( !DROP ?auto_5891 ?auto_5890 ?auto_5889 ?auto_5892 )
      ( MAKE-1CRATE-VERIFY ?auto_5889 ?auto_5890 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_5906 - SURFACE
      ?auto_5907 - SURFACE
      ?auto_5908 - SURFACE
      ?auto_5909 - SURFACE
      ?auto_5910 - SURFACE
      ?auto_5911 - SURFACE
      ?auto_5914 - SURFACE
      ?auto_5913 - SURFACE
      ?auto_5912 - SURFACE
    )
    :vars
    (
      ?auto_5915 - HOIST
      ?auto_5917 - PLACE
      ?auto_5918 - PLACE
      ?auto_5916 - HOIST
      ?auto_5919 - SURFACE
      ?auto_5921 - PLACE
      ?auto_5922 - HOIST
      ?auto_5923 - SURFACE
      ?auto_5930 - PLACE
      ?auto_5936 - HOIST
      ?auto_5935 - SURFACE
      ?auto_5924 - PLACE
      ?auto_5929 - HOIST
      ?auto_5928 - SURFACE
      ?auto_5927 - SURFACE
      ?auto_5932 - PLACE
      ?auto_5931 - HOIST
      ?auto_5933 - SURFACE
      ?auto_5925 - PLACE
      ?auto_5926 - HOIST
      ?auto_5937 - SURFACE
      ?auto_5934 - SURFACE
      ?auto_5920 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5915 ?auto_5917 ) ( IS-CRATE ?auto_5912 ) ( not ( = ?auto_5918 ?auto_5917 ) ) ( HOIST-AT ?auto_5916 ?auto_5918 ) ( AVAILABLE ?auto_5916 ) ( SURFACE-AT ?auto_5912 ?auto_5918 ) ( ON ?auto_5912 ?auto_5919 ) ( CLEAR ?auto_5912 ) ( not ( = ?auto_5913 ?auto_5912 ) ) ( not ( = ?auto_5913 ?auto_5919 ) ) ( not ( = ?auto_5912 ?auto_5919 ) ) ( not ( = ?auto_5915 ?auto_5916 ) ) ( IS-CRATE ?auto_5913 ) ( not ( = ?auto_5921 ?auto_5917 ) ) ( HOIST-AT ?auto_5922 ?auto_5921 ) ( AVAILABLE ?auto_5922 ) ( SURFACE-AT ?auto_5913 ?auto_5921 ) ( ON ?auto_5913 ?auto_5923 ) ( CLEAR ?auto_5913 ) ( not ( = ?auto_5914 ?auto_5913 ) ) ( not ( = ?auto_5914 ?auto_5923 ) ) ( not ( = ?auto_5913 ?auto_5923 ) ) ( not ( = ?auto_5915 ?auto_5922 ) ) ( IS-CRATE ?auto_5914 ) ( not ( = ?auto_5930 ?auto_5917 ) ) ( HOIST-AT ?auto_5936 ?auto_5930 ) ( SURFACE-AT ?auto_5914 ?auto_5930 ) ( ON ?auto_5914 ?auto_5935 ) ( CLEAR ?auto_5914 ) ( not ( = ?auto_5911 ?auto_5914 ) ) ( not ( = ?auto_5911 ?auto_5935 ) ) ( not ( = ?auto_5914 ?auto_5935 ) ) ( not ( = ?auto_5915 ?auto_5936 ) ) ( IS-CRATE ?auto_5911 ) ( not ( = ?auto_5924 ?auto_5917 ) ) ( HOIST-AT ?auto_5929 ?auto_5924 ) ( SURFACE-AT ?auto_5911 ?auto_5924 ) ( ON ?auto_5911 ?auto_5928 ) ( CLEAR ?auto_5911 ) ( not ( = ?auto_5910 ?auto_5911 ) ) ( not ( = ?auto_5910 ?auto_5928 ) ) ( not ( = ?auto_5911 ?auto_5928 ) ) ( not ( = ?auto_5915 ?auto_5929 ) ) ( IS-CRATE ?auto_5910 ) ( AVAILABLE ?auto_5929 ) ( SURFACE-AT ?auto_5910 ?auto_5924 ) ( ON ?auto_5910 ?auto_5927 ) ( CLEAR ?auto_5910 ) ( not ( = ?auto_5909 ?auto_5910 ) ) ( not ( = ?auto_5909 ?auto_5927 ) ) ( not ( = ?auto_5910 ?auto_5927 ) ) ( IS-CRATE ?auto_5909 ) ( not ( = ?auto_5932 ?auto_5917 ) ) ( HOIST-AT ?auto_5931 ?auto_5932 ) ( AVAILABLE ?auto_5931 ) ( SURFACE-AT ?auto_5909 ?auto_5932 ) ( ON ?auto_5909 ?auto_5933 ) ( CLEAR ?auto_5909 ) ( not ( = ?auto_5908 ?auto_5909 ) ) ( not ( = ?auto_5908 ?auto_5933 ) ) ( not ( = ?auto_5909 ?auto_5933 ) ) ( not ( = ?auto_5915 ?auto_5931 ) ) ( IS-CRATE ?auto_5908 ) ( not ( = ?auto_5925 ?auto_5917 ) ) ( HOIST-AT ?auto_5926 ?auto_5925 ) ( AVAILABLE ?auto_5926 ) ( SURFACE-AT ?auto_5908 ?auto_5925 ) ( ON ?auto_5908 ?auto_5937 ) ( CLEAR ?auto_5908 ) ( not ( = ?auto_5907 ?auto_5908 ) ) ( not ( = ?auto_5907 ?auto_5937 ) ) ( not ( = ?auto_5908 ?auto_5937 ) ) ( not ( = ?auto_5915 ?auto_5926 ) ) ( SURFACE-AT ?auto_5906 ?auto_5917 ) ( CLEAR ?auto_5906 ) ( IS-CRATE ?auto_5907 ) ( AVAILABLE ?auto_5915 ) ( AVAILABLE ?auto_5936 ) ( SURFACE-AT ?auto_5907 ?auto_5930 ) ( ON ?auto_5907 ?auto_5934 ) ( CLEAR ?auto_5907 ) ( TRUCK-AT ?auto_5920 ?auto_5917 ) ( not ( = ?auto_5906 ?auto_5907 ) ) ( not ( = ?auto_5906 ?auto_5934 ) ) ( not ( = ?auto_5907 ?auto_5934 ) ) ( not ( = ?auto_5906 ?auto_5908 ) ) ( not ( = ?auto_5906 ?auto_5937 ) ) ( not ( = ?auto_5908 ?auto_5934 ) ) ( not ( = ?auto_5925 ?auto_5930 ) ) ( not ( = ?auto_5926 ?auto_5936 ) ) ( not ( = ?auto_5937 ?auto_5934 ) ) ( not ( = ?auto_5906 ?auto_5909 ) ) ( not ( = ?auto_5906 ?auto_5933 ) ) ( not ( = ?auto_5907 ?auto_5909 ) ) ( not ( = ?auto_5907 ?auto_5933 ) ) ( not ( = ?auto_5909 ?auto_5937 ) ) ( not ( = ?auto_5909 ?auto_5934 ) ) ( not ( = ?auto_5932 ?auto_5925 ) ) ( not ( = ?auto_5932 ?auto_5930 ) ) ( not ( = ?auto_5931 ?auto_5926 ) ) ( not ( = ?auto_5931 ?auto_5936 ) ) ( not ( = ?auto_5933 ?auto_5937 ) ) ( not ( = ?auto_5933 ?auto_5934 ) ) ( not ( = ?auto_5906 ?auto_5910 ) ) ( not ( = ?auto_5906 ?auto_5927 ) ) ( not ( = ?auto_5907 ?auto_5910 ) ) ( not ( = ?auto_5907 ?auto_5927 ) ) ( not ( = ?auto_5908 ?auto_5910 ) ) ( not ( = ?auto_5908 ?auto_5927 ) ) ( not ( = ?auto_5910 ?auto_5933 ) ) ( not ( = ?auto_5910 ?auto_5937 ) ) ( not ( = ?auto_5910 ?auto_5934 ) ) ( not ( = ?auto_5924 ?auto_5932 ) ) ( not ( = ?auto_5924 ?auto_5925 ) ) ( not ( = ?auto_5924 ?auto_5930 ) ) ( not ( = ?auto_5929 ?auto_5931 ) ) ( not ( = ?auto_5929 ?auto_5926 ) ) ( not ( = ?auto_5929 ?auto_5936 ) ) ( not ( = ?auto_5927 ?auto_5933 ) ) ( not ( = ?auto_5927 ?auto_5937 ) ) ( not ( = ?auto_5927 ?auto_5934 ) ) ( not ( = ?auto_5906 ?auto_5911 ) ) ( not ( = ?auto_5906 ?auto_5928 ) ) ( not ( = ?auto_5907 ?auto_5911 ) ) ( not ( = ?auto_5907 ?auto_5928 ) ) ( not ( = ?auto_5908 ?auto_5911 ) ) ( not ( = ?auto_5908 ?auto_5928 ) ) ( not ( = ?auto_5909 ?auto_5911 ) ) ( not ( = ?auto_5909 ?auto_5928 ) ) ( not ( = ?auto_5911 ?auto_5927 ) ) ( not ( = ?auto_5911 ?auto_5933 ) ) ( not ( = ?auto_5911 ?auto_5937 ) ) ( not ( = ?auto_5911 ?auto_5934 ) ) ( not ( = ?auto_5928 ?auto_5927 ) ) ( not ( = ?auto_5928 ?auto_5933 ) ) ( not ( = ?auto_5928 ?auto_5937 ) ) ( not ( = ?auto_5928 ?auto_5934 ) ) ( not ( = ?auto_5906 ?auto_5914 ) ) ( not ( = ?auto_5906 ?auto_5935 ) ) ( not ( = ?auto_5907 ?auto_5914 ) ) ( not ( = ?auto_5907 ?auto_5935 ) ) ( not ( = ?auto_5908 ?auto_5914 ) ) ( not ( = ?auto_5908 ?auto_5935 ) ) ( not ( = ?auto_5909 ?auto_5914 ) ) ( not ( = ?auto_5909 ?auto_5935 ) ) ( not ( = ?auto_5910 ?auto_5914 ) ) ( not ( = ?auto_5910 ?auto_5935 ) ) ( not ( = ?auto_5914 ?auto_5928 ) ) ( not ( = ?auto_5914 ?auto_5927 ) ) ( not ( = ?auto_5914 ?auto_5933 ) ) ( not ( = ?auto_5914 ?auto_5937 ) ) ( not ( = ?auto_5914 ?auto_5934 ) ) ( not ( = ?auto_5935 ?auto_5928 ) ) ( not ( = ?auto_5935 ?auto_5927 ) ) ( not ( = ?auto_5935 ?auto_5933 ) ) ( not ( = ?auto_5935 ?auto_5937 ) ) ( not ( = ?auto_5935 ?auto_5934 ) ) ( not ( = ?auto_5906 ?auto_5913 ) ) ( not ( = ?auto_5906 ?auto_5923 ) ) ( not ( = ?auto_5907 ?auto_5913 ) ) ( not ( = ?auto_5907 ?auto_5923 ) ) ( not ( = ?auto_5908 ?auto_5913 ) ) ( not ( = ?auto_5908 ?auto_5923 ) ) ( not ( = ?auto_5909 ?auto_5913 ) ) ( not ( = ?auto_5909 ?auto_5923 ) ) ( not ( = ?auto_5910 ?auto_5913 ) ) ( not ( = ?auto_5910 ?auto_5923 ) ) ( not ( = ?auto_5911 ?auto_5913 ) ) ( not ( = ?auto_5911 ?auto_5923 ) ) ( not ( = ?auto_5913 ?auto_5935 ) ) ( not ( = ?auto_5913 ?auto_5928 ) ) ( not ( = ?auto_5913 ?auto_5927 ) ) ( not ( = ?auto_5913 ?auto_5933 ) ) ( not ( = ?auto_5913 ?auto_5937 ) ) ( not ( = ?auto_5913 ?auto_5934 ) ) ( not ( = ?auto_5921 ?auto_5930 ) ) ( not ( = ?auto_5921 ?auto_5924 ) ) ( not ( = ?auto_5921 ?auto_5932 ) ) ( not ( = ?auto_5921 ?auto_5925 ) ) ( not ( = ?auto_5922 ?auto_5936 ) ) ( not ( = ?auto_5922 ?auto_5929 ) ) ( not ( = ?auto_5922 ?auto_5931 ) ) ( not ( = ?auto_5922 ?auto_5926 ) ) ( not ( = ?auto_5923 ?auto_5935 ) ) ( not ( = ?auto_5923 ?auto_5928 ) ) ( not ( = ?auto_5923 ?auto_5927 ) ) ( not ( = ?auto_5923 ?auto_5933 ) ) ( not ( = ?auto_5923 ?auto_5937 ) ) ( not ( = ?auto_5923 ?auto_5934 ) ) ( not ( = ?auto_5906 ?auto_5912 ) ) ( not ( = ?auto_5906 ?auto_5919 ) ) ( not ( = ?auto_5907 ?auto_5912 ) ) ( not ( = ?auto_5907 ?auto_5919 ) ) ( not ( = ?auto_5908 ?auto_5912 ) ) ( not ( = ?auto_5908 ?auto_5919 ) ) ( not ( = ?auto_5909 ?auto_5912 ) ) ( not ( = ?auto_5909 ?auto_5919 ) ) ( not ( = ?auto_5910 ?auto_5912 ) ) ( not ( = ?auto_5910 ?auto_5919 ) ) ( not ( = ?auto_5911 ?auto_5912 ) ) ( not ( = ?auto_5911 ?auto_5919 ) ) ( not ( = ?auto_5914 ?auto_5912 ) ) ( not ( = ?auto_5914 ?auto_5919 ) ) ( not ( = ?auto_5912 ?auto_5923 ) ) ( not ( = ?auto_5912 ?auto_5935 ) ) ( not ( = ?auto_5912 ?auto_5928 ) ) ( not ( = ?auto_5912 ?auto_5927 ) ) ( not ( = ?auto_5912 ?auto_5933 ) ) ( not ( = ?auto_5912 ?auto_5937 ) ) ( not ( = ?auto_5912 ?auto_5934 ) ) ( not ( = ?auto_5918 ?auto_5921 ) ) ( not ( = ?auto_5918 ?auto_5930 ) ) ( not ( = ?auto_5918 ?auto_5924 ) ) ( not ( = ?auto_5918 ?auto_5932 ) ) ( not ( = ?auto_5918 ?auto_5925 ) ) ( not ( = ?auto_5916 ?auto_5922 ) ) ( not ( = ?auto_5916 ?auto_5936 ) ) ( not ( = ?auto_5916 ?auto_5929 ) ) ( not ( = ?auto_5916 ?auto_5931 ) ) ( not ( = ?auto_5916 ?auto_5926 ) ) ( not ( = ?auto_5919 ?auto_5923 ) ) ( not ( = ?auto_5919 ?auto_5935 ) ) ( not ( = ?auto_5919 ?auto_5928 ) ) ( not ( = ?auto_5919 ?auto_5927 ) ) ( not ( = ?auto_5919 ?auto_5933 ) ) ( not ( = ?auto_5919 ?auto_5937 ) ) ( not ( = ?auto_5919 ?auto_5934 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_5906 ?auto_5907 ?auto_5908 ?auto_5909 ?auto_5910 ?auto_5911 ?auto_5914 ?auto_5913 )
      ( MAKE-1CRATE ?auto_5913 ?auto_5912 )
      ( MAKE-8CRATE-VERIFY ?auto_5906 ?auto_5907 ?auto_5908 ?auto_5909 ?auto_5910 ?auto_5911 ?auto_5914 ?auto_5913 ?auto_5912 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5940 - SURFACE
      ?auto_5941 - SURFACE
    )
    :vars
    (
      ?auto_5942 - HOIST
      ?auto_5943 - PLACE
      ?auto_5945 - PLACE
      ?auto_5946 - HOIST
      ?auto_5947 - SURFACE
      ?auto_5944 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5942 ?auto_5943 ) ( SURFACE-AT ?auto_5940 ?auto_5943 ) ( CLEAR ?auto_5940 ) ( IS-CRATE ?auto_5941 ) ( AVAILABLE ?auto_5942 ) ( not ( = ?auto_5945 ?auto_5943 ) ) ( HOIST-AT ?auto_5946 ?auto_5945 ) ( AVAILABLE ?auto_5946 ) ( SURFACE-AT ?auto_5941 ?auto_5945 ) ( ON ?auto_5941 ?auto_5947 ) ( CLEAR ?auto_5941 ) ( TRUCK-AT ?auto_5944 ?auto_5943 ) ( not ( = ?auto_5940 ?auto_5941 ) ) ( not ( = ?auto_5940 ?auto_5947 ) ) ( not ( = ?auto_5941 ?auto_5947 ) ) ( not ( = ?auto_5942 ?auto_5946 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5944 ?auto_5943 ?auto_5945 )
      ( !LIFT ?auto_5946 ?auto_5941 ?auto_5947 ?auto_5945 )
      ( !LOAD ?auto_5946 ?auto_5941 ?auto_5944 ?auto_5945 )
      ( !DRIVE ?auto_5944 ?auto_5945 ?auto_5943 )
      ( !UNLOAD ?auto_5942 ?auto_5941 ?auto_5944 ?auto_5943 )
      ( !DROP ?auto_5942 ?auto_5941 ?auto_5940 ?auto_5943 )
      ( MAKE-1CRATE-VERIFY ?auto_5940 ?auto_5941 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_5958 - SURFACE
      ?auto_5959 - SURFACE
      ?auto_5960 - SURFACE
      ?auto_5961 - SURFACE
      ?auto_5962 - SURFACE
      ?auto_5963 - SURFACE
      ?auto_5966 - SURFACE
      ?auto_5965 - SURFACE
      ?auto_5964 - SURFACE
      ?auto_5967 - SURFACE
    )
    :vars
    (
      ?auto_5972 - HOIST
      ?auto_5973 - PLACE
      ?auto_5968 - PLACE
      ?auto_5969 - HOIST
      ?auto_5971 - SURFACE
      ?auto_5978 - PLACE
      ?auto_5990 - HOIST
      ?auto_5977 - SURFACE
      ?auto_5979 - PLACE
      ?auto_5975 - HOIST
      ?auto_5976 - SURFACE
      ?auto_5989 - SURFACE
      ?auto_5974 - PLACE
      ?auto_5981 - HOIST
      ?auto_5986 - SURFACE
      ?auto_5987 - SURFACE
      ?auto_5983 - PLACE
      ?auto_5982 - HOIST
      ?auto_5984 - SURFACE
      ?auto_5991 - PLACE
      ?auto_5988 - HOIST
      ?auto_5980 - SURFACE
      ?auto_5985 - SURFACE
      ?auto_5970 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5972 ?auto_5973 ) ( IS-CRATE ?auto_5967 ) ( not ( = ?auto_5968 ?auto_5973 ) ) ( HOIST-AT ?auto_5969 ?auto_5968 ) ( SURFACE-AT ?auto_5967 ?auto_5968 ) ( ON ?auto_5967 ?auto_5971 ) ( CLEAR ?auto_5967 ) ( not ( = ?auto_5964 ?auto_5967 ) ) ( not ( = ?auto_5964 ?auto_5971 ) ) ( not ( = ?auto_5967 ?auto_5971 ) ) ( not ( = ?auto_5972 ?auto_5969 ) ) ( IS-CRATE ?auto_5964 ) ( not ( = ?auto_5978 ?auto_5973 ) ) ( HOIST-AT ?auto_5990 ?auto_5978 ) ( AVAILABLE ?auto_5990 ) ( SURFACE-AT ?auto_5964 ?auto_5978 ) ( ON ?auto_5964 ?auto_5977 ) ( CLEAR ?auto_5964 ) ( not ( = ?auto_5965 ?auto_5964 ) ) ( not ( = ?auto_5965 ?auto_5977 ) ) ( not ( = ?auto_5964 ?auto_5977 ) ) ( not ( = ?auto_5972 ?auto_5990 ) ) ( IS-CRATE ?auto_5965 ) ( not ( = ?auto_5979 ?auto_5973 ) ) ( HOIST-AT ?auto_5975 ?auto_5979 ) ( AVAILABLE ?auto_5975 ) ( SURFACE-AT ?auto_5965 ?auto_5979 ) ( ON ?auto_5965 ?auto_5976 ) ( CLEAR ?auto_5965 ) ( not ( = ?auto_5966 ?auto_5965 ) ) ( not ( = ?auto_5966 ?auto_5976 ) ) ( not ( = ?auto_5965 ?auto_5976 ) ) ( not ( = ?auto_5972 ?auto_5975 ) ) ( IS-CRATE ?auto_5966 ) ( SURFACE-AT ?auto_5966 ?auto_5968 ) ( ON ?auto_5966 ?auto_5989 ) ( CLEAR ?auto_5966 ) ( not ( = ?auto_5963 ?auto_5966 ) ) ( not ( = ?auto_5963 ?auto_5989 ) ) ( not ( = ?auto_5966 ?auto_5989 ) ) ( IS-CRATE ?auto_5963 ) ( not ( = ?auto_5974 ?auto_5973 ) ) ( HOIST-AT ?auto_5981 ?auto_5974 ) ( SURFACE-AT ?auto_5963 ?auto_5974 ) ( ON ?auto_5963 ?auto_5986 ) ( CLEAR ?auto_5963 ) ( not ( = ?auto_5962 ?auto_5963 ) ) ( not ( = ?auto_5962 ?auto_5986 ) ) ( not ( = ?auto_5963 ?auto_5986 ) ) ( not ( = ?auto_5972 ?auto_5981 ) ) ( IS-CRATE ?auto_5962 ) ( AVAILABLE ?auto_5981 ) ( SURFACE-AT ?auto_5962 ?auto_5974 ) ( ON ?auto_5962 ?auto_5987 ) ( CLEAR ?auto_5962 ) ( not ( = ?auto_5961 ?auto_5962 ) ) ( not ( = ?auto_5961 ?auto_5987 ) ) ( not ( = ?auto_5962 ?auto_5987 ) ) ( IS-CRATE ?auto_5961 ) ( not ( = ?auto_5983 ?auto_5973 ) ) ( HOIST-AT ?auto_5982 ?auto_5983 ) ( AVAILABLE ?auto_5982 ) ( SURFACE-AT ?auto_5961 ?auto_5983 ) ( ON ?auto_5961 ?auto_5984 ) ( CLEAR ?auto_5961 ) ( not ( = ?auto_5960 ?auto_5961 ) ) ( not ( = ?auto_5960 ?auto_5984 ) ) ( not ( = ?auto_5961 ?auto_5984 ) ) ( not ( = ?auto_5972 ?auto_5982 ) ) ( IS-CRATE ?auto_5960 ) ( not ( = ?auto_5991 ?auto_5973 ) ) ( HOIST-AT ?auto_5988 ?auto_5991 ) ( AVAILABLE ?auto_5988 ) ( SURFACE-AT ?auto_5960 ?auto_5991 ) ( ON ?auto_5960 ?auto_5980 ) ( CLEAR ?auto_5960 ) ( not ( = ?auto_5959 ?auto_5960 ) ) ( not ( = ?auto_5959 ?auto_5980 ) ) ( not ( = ?auto_5960 ?auto_5980 ) ) ( not ( = ?auto_5972 ?auto_5988 ) ) ( SURFACE-AT ?auto_5958 ?auto_5973 ) ( CLEAR ?auto_5958 ) ( IS-CRATE ?auto_5959 ) ( AVAILABLE ?auto_5972 ) ( AVAILABLE ?auto_5969 ) ( SURFACE-AT ?auto_5959 ?auto_5968 ) ( ON ?auto_5959 ?auto_5985 ) ( CLEAR ?auto_5959 ) ( TRUCK-AT ?auto_5970 ?auto_5973 ) ( not ( = ?auto_5958 ?auto_5959 ) ) ( not ( = ?auto_5958 ?auto_5985 ) ) ( not ( = ?auto_5959 ?auto_5985 ) ) ( not ( = ?auto_5958 ?auto_5960 ) ) ( not ( = ?auto_5958 ?auto_5980 ) ) ( not ( = ?auto_5960 ?auto_5985 ) ) ( not ( = ?auto_5991 ?auto_5968 ) ) ( not ( = ?auto_5988 ?auto_5969 ) ) ( not ( = ?auto_5980 ?auto_5985 ) ) ( not ( = ?auto_5958 ?auto_5961 ) ) ( not ( = ?auto_5958 ?auto_5984 ) ) ( not ( = ?auto_5959 ?auto_5961 ) ) ( not ( = ?auto_5959 ?auto_5984 ) ) ( not ( = ?auto_5961 ?auto_5980 ) ) ( not ( = ?auto_5961 ?auto_5985 ) ) ( not ( = ?auto_5983 ?auto_5991 ) ) ( not ( = ?auto_5983 ?auto_5968 ) ) ( not ( = ?auto_5982 ?auto_5988 ) ) ( not ( = ?auto_5982 ?auto_5969 ) ) ( not ( = ?auto_5984 ?auto_5980 ) ) ( not ( = ?auto_5984 ?auto_5985 ) ) ( not ( = ?auto_5958 ?auto_5962 ) ) ( not ( = ?auto_5958 ?auto_5987 ) ) ( not ( = ?auto_5959 ?auto_5962 ) ) ( not ( = ?auto_5959 ?auto_5987 ) ) ( not ( = ?auto_5960 ?auto_5962 ) ) ( not ( = ?auto_5960 ?auto_5987 ) ) ( not ( = ?auto_5962 ?auto_5984 ) ) ( not ( = ?auto_5962 ?auto_5980 ) ) ( not ( = ?auto_5962 ?auto_5985 ) ) ( not ( = ?auto_5974 ?auto_5983 ) ) ( not ( = ?auto_5974 ?auto_5991 ) ) ( not ( = ?auto_5974 ?auto_5968 ) ) ( not ( = ?auto_5981 ?auto_5982 ) ) ( not ( = ?auto_5981 ?auto_5988 ) ) ( not ( = ?auto_5981 ?auto_5969 ) ) ( not ( = ?auto_5987 ?auto_5984 ) ) ( not ( = ?auto_5987 ?auto_5980 ) ) ( not ( = ?auto_5987 ?auto_5985 ) ) ( not ( = ?auto_5958 ?auto_5963 ) ) ( not ( = ?auto_5958 ?auto_5986 ) ) ( not ( = ?auto_5959 ?auto_5963 ) ) ( not ( = ?auto_5959 ?auto_5986 ) ) ( not ( = ?auto_5960 ?auto_5963 ) ) ( not ( = ?auto_5960 ?auto_5986 ) ) ( not ( = ?auto_5961 ?auto_5963 ) ) ( not ( = ?auto_5961 ?auto_5986 ) ) ( not ( = ?auto_5963 ?auto_5987 ) ) ( not ( = ?auto_5963 ?auto_5984 ) ) ( not ( = ?auto_5963 ?auto_5980 ) ) ( not ( = ?auto_5963 ?auto_5985 ) ) ( not ( = ?auto_5986 ?auto_5987 ) ) ( not ( = ?auto_5986 ?auto_5984 ) ) ( not ( = ?auto_5986 ?auto_5980 ) ) ( not ( = ?auto_5986 ?auto_5985 ) ) ( not ( = ?auto_5958 ?auto_5966 ) ) ( not ( = ?auto_5958 ?auto_5989 ) ) ( not ( = ?auto_5959 ?auto_5966 ) ) ( not ( = ?auto_5959 ?auto_5989 ) ) ( not ( = ?auto_5960 ?auto_5966 ) ) ( not ( = ?auto_5960 ?auto_5989 ) ) ( not ( = ?auto_5961 ?auto_5966 ) ) ( not ( = ?auto_5961 ?auto_5989 ) ) ( not ( = ?auto_5962 ?auto_5966 ) ) ( not ( = ?auto_5962 ?auto_5989 ) ) ( not ( = ?auto_5966 ?auto_5986 ) ) ( not ( = ?auto_5966 ?auto_5987 ) ) ( not ( = ?auto_5966 ?auto_5984 ) ) ( not ( = ?auto_5966 ?auto_5980 ) ) ( not ( = ?auto_5966 ?auto_5985 ) ) ( not ( = ?auto_5989 ?auto_5986 ) ) ( not ( = ?auto_5989 ?auto_5987 ) ) ( not ( = ?auto_5989 ?auto_5984 ) ) ( not ( = ?auto_5989 ?auto_5980 ) ) ( not ( = ?auto_5989 ?auto_5985 ) ) ( not ( = ?auto_5958 ?auto_5965 ) ) ( not ( = ?auto_5958 ?auto_5976 ) ) ( not ( = ?auto_5959 ?auto_5965 ) ) ( not ( = ?auto_5959 ?auto_5976 ) ) ( not ( = ?auto_5960 ?auto_5965 ) ) ( not ( = ?auto_5960 ?auto_5976 ) ) ( not ( = ?auto_5961 ?auto_5965 ) ) ( not ( = ?auto_5961 ?auto_5976 ) ) ( not ( = ?auto_5962 ?auto_5965 ) ) ( not ( = ?auto_5962 ?auto_5976 ) ) ( not ( = ?auto_5963 ?auto_5965 ) ) ( not ( = ?auto_5963 ?auto_5976 ) ) ( not ( = ?auto_5965 ?auto_5989 ) ) ( not ( = ?auto_5965 ?auto_5986 ) ) ( not ( = ?auto_5965 ?auto_5987 ) ) ( not ( = ?auto_5965 ?auto_5984 ) ) ( not ( = ?auto_5965 ?auto_5980 ) ) ( not ( = ?auto_5965 ?auto_5985 ) ) ( not ( = ?auto_5979 ?auto_5968 ) ) ( not ( = ?auto_5979 ?auto_5974 ) ) ( not ( = ?auto_5979 ?auto_5983 ) ) ( not ( = ?auto_5979 ?auto_5991 ) ) ( not ( = ?auto_5975 ?auto_5969 ) ) ( not ( = ?auto_5975 ?auto_5981 ) ) ( not ( = ?auto_5975 ?auto_5982 ) ) ( not ( = ?auto_5975 ?auto_5988 ) ) ( not ( = ?auto_5976 ?auto_5989 ) ) ( not ( = ?auto_5976 ?auto_5986 ) ) ( not ( = ?auto_5976 ?auto_5987 ) ) ( not ( = ?auto_5976 ?auto_5984 ) ) ( not ( = ?auto_5976 ?auto_5980 ) ) ( not ( = ?auto_5976 ?auto_5985 ) ) ( not ( = ?auto_5958 ?auto_5964 ) ) ( not ( = ?auto_5958 ?auto_5977 ) ) ( not ( = ?auto_5959 ?auto_5964 ) ) ( not ( = ?auto_5959 ?auto_5977 ) ) ( not ( = ?auto_5960 ?auto_5964 ) ) ( not ( = ?auto_5960 ?auto_5977 ) ) ( not ( = ?auto_5961 ?auto_5964 ) ) ( not ( = ?auto_5961 ?auto_5977 ) ) ( not ( = ?auto_5962 ?auto_5964 ) ) ( not ( = ?auto_5962 ?auto_5977 ) ) ( not ( = ?auto_5963 ?auto_5964 ) ) ( not ( = ?auto_5963 ?auto_5977 ) ) ( not ( = ?auto_5966 ?auto_5964 ) ) ( not ( = ?auto_5966 ?auto_5977 ) ) ( not ( = ?auto_5964 ?auto_5976 ) ) ( not ( = ?auto_5964 ?auto_5989 ) ) ( not ( = ?auto_5964 ?auto_5986 ) ) ( not ( = ?auto_5964 ?auto_5987 ) ) ( not ( = ?auto_5964 ?auto_5984 ) ) ( not ( = ?auto_5964 ?auto_5980 ) ) ( not ( = ?auto_5964 ?auto_5985 ) ) ( not ( = ?auto_5978 ?auto_5979 ) ) ( not ( = ?auto_5978 ?auto_5968 ) ) ( not ( = ?auto_5978 ?auto_5974 ) ) ( not ( = ?auto_5978 ?auto_5983 ) ) ( not ( = ?auto_5978 ?auto_5991 ) ) ( not ( = ?auto_5990 ?auto_5975 ) ) ( not ( = ?auto_5990 ?auto_5969 ) ) ( not ( = ?auto_5990 ?auto_5981 ) ) ( not ( = ?auto_5990 ?auto_5982 ) ) ( not ( = ?auto_5990 ?auto_5988 ) ) ( not ( = ?auto_5977 ?auto_5976 ) ) ( not ( = ?auto_5977 ?auto_5989 ) ) ( not ( = ?auto_5977 ?auto_5986 ) ) ( not ( = ?auto_5977 ?auto_5987 ) ) ( not ( = ?auto_5977 ?auto_5984 ) ) ( not ( = ?auto_5977 ?auto_5980 ) ) ( not ( = ?auto_5977 ?auto_5985 ) ) ( not ( = ?auto_5958 ?auto_5967 ) ) ( not ( = ?auto_5958 ?auto_5971 ) ) ( not ( = ?auto_5959 ?auto_5967 ) ) ( not ( = ?auto_5959 ?auto_5971 ) ) ( not ( = ?auto_5960 ?auto_5967 ) ) ( not ( = ?auto_5960 ?auto_5971 ) ) ( not ( = ?auto_5961 ?auto_5967 ) ) ( not ( = ?auto_5961 ?auto_5971 ) ) ( not ( = ?auto_5962 ?auto_5967 ) ) ( not ( = ?auto_5962 ?auto_5971 ) ) ( not ( = ?auto_5963 ?auto_5967 ) ) ( not ( = ?auto_5963 ?auto_5971 ) ) ( not ( = ?auto_5966 ?auto_5967 ) ) ( not ( = ?auto_5966 ?auto_5971 ) ) ( not ( = ?auto_5965 ?auto_5967 ) ) ( not ( = ?auto_5965 ?auto_5971 ) ) ( not ( = ?auto_5967 ?auto_5977 ) ) ( not ( = ?auto_5967 ?auto_5976 ) ) ( not ( = ?auto_5967 ?auto_5989 ) ) ( not ( = ?auto_5967 ?auto_5986 ) ) ( not ( = ?auto_5967 ?auto_5987 ) ) ( not ( = ?auto_5967 ?auto_5984 ) ) ( not ( = ?auto_5967 ?auto_5980 ) ) ( not ( = ?auto_5967 ?auto_5985 ) ) ( not ( = ?auto_5971 ?auto_5977 ) ) ( not ( = ?auto_5971 ?auto_5976 ) ) ( not ( = ?auto_5971 ?auto_5989 ) ) ( not ( = ?auto_5971 ?auto_5986 ) ) ( not ( = ?auto_5971 ?auto_5987 ) ) ( not ( = ?auto_5971 ?auto_5984 ) ) ( not ( = ?auto_5971 ?auto_5980 ) ) ( not ( = ?auto_5971 ?auto_5985 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_5958 ?auto_5959 ?auto_5960 ?auto_5961 ?auto_5962 ?auto_5963 ?auto_5966 ?auto_5965 ?auto_5964 )
      ( MAKE-1CRATE ?auto_5964 ?auto_5967 )
      ( MAKE-9CRATE-VERIFY ?auto_5958 ?auto_5959 ?auto_5960 ?auto_5961 ?auto_5962 ?auto_5963 ?auto_5966 ?auto_5965 ?auto_5964 ?auto_5967 ) )
  )

)

