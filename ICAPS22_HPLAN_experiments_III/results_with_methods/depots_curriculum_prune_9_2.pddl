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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5685 - SURFACE
      ?auto_5686 - SURFACE
      ?auto_5687 - SURFACE
    )
    :vars
    (
      ?auto_5692 - HOIST
      ?auto_5690 - PLACE
      ?auto_5691 - PLACE
      ?auto_5693 - HOIST
      ?auto_5689 - SURFACE
      ?auto_5694 - PLACE
      ?auto_5696 - HOIST
      ?auto_5695 - SURFACE
      ?auto_5688 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5692 ?auto_5690 ) ( IS-CRATE ?auto_5687 ) ( not ( = ?auto_5691 ?auto_5690 ) ) ( HOIST-AT ?auto_5693 ?auto_5691 ) ( AVAILABLE ?auto_5693 ) ( SURFACE-AT ?auto_5687 ?auto_5691 ) ( ON ?auto_5687 ?auto_5689 ) ( CLEAR ?auto_5687 ) ( not ( = ?auto_5686 ?auto_5687 ) ) ( not ( = ?auto_5686 ?auto_5689 ) ) ( not ( = ?auto_5687 ?auto_5689 ) ) ( not ( = ?auto_5692 ?auto_5693 ) ) ( SURFACE-AT ?auto_5685 ?auto_5690 ) ( CLEAR ?auto_5685 ) ( IS-CRATE ?auto_5686 ) ( AVAILABLE ?auto_5692 ) ( not ( = ?auto_5694 ?auto_5690 ) ) ( HOIST-AT ?auto_5696 ?auto_5694 ) ( AVAILABLE ?auto_5696 ) ( SURFACE-AT ?auto_5686 ?auto_5694 ) ( ON ?auto_5686 ?auto_5695 ) ( CLEAR ?auto_5686 ) ( TRUCK-AT ?auto_5688 ?auto_5690 ) ( not ( = ?auto_5685 ?auto_5686 ) ) ( not ( = ?auto_5685 ?auto_5695 ) ) ( not ( = ?auto_5686 ?auto_5695 ) ) ( not ( = ?auto_5692 ?auto_5696 ) ) ( not ( = ?auto_5685 ?auto_5687 ) ) ( not ( = ?auto_5685 ?auto_5689 ) ) ( not ( = ?auto_5687 ?auto_5695 ) ) ( not ( = ?auto_5691 ?auto_5694 ) ) ( not ( = ?auto_5693 ?auto_5696 ) ) ( not ( = ?auto_5689 ?auto_5695 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5685 ?auto_5686 )
      ( MAKE-1CRATE ?auto_5686 ?auto_5687 )
      ( MAKE-2CRATE-VERIFY ?auto_5685 ?auto_5686 ?auto_5687 ) )
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
      ?auto_5717 - HOIST
      ?auto_5718 - PLACE
      ?auto_5715 - PLACE
      ?auto_5719 - HOIST
      ?auto_5720 - SURFACE
      ?auto_5726 - PLACE
      ?auto_5725 - HOIST
      ?auto_5724 - SURFACE
      ?auto_5721 - PLACE
      ?auto_5722 - HOIST
      ?auto_5723 - SURFACE
      ?auto_5716 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5717 ?auto_5718 ) ( IS-CRATE ?auto_5714 ) ( not ( = ?auto_5715 ?auto_5718 ) ) ( HOIST-AT ?auto_5719 ?auto_5715 ) ( AVAILABLE ?auto_5719 ) ( SURFACE-AT ?auto_5714 ?auto_5715 ) ( ON ?auto_5714 ?auto_5720 ) ( CLEAR ?auto_5714 ) ( not ( = ?auto_5713 ?auto_5714 ) ) ( not ( = ?auto_5713 ?auto_5720 ) ) ( not ( = ?auto_5714 ?auto_5720 ) ) ( not ( = ?auto_5717 ?auto_5719 ) ) ( IS-CRATE ?auto_5713 ) ( not ( = ?auto_5726 ?auto_5718 ) ) ( HOIST-AT ?auto_5725 ?auto_5726 ) ( AVAILABLE ?auto_5725 ) ( SURFACE-AT ?auto_5713 ?auto_5726 ) ( ON ?auto_5713 ?auto_5724 ) ( CLEAR ?auto_5713 ) ( not ( = ?auto_5712 ?auto_5713 ) ) ( not ( = ?auto_5712 ?auto_5724 ) ) ( not ( = ?auto_5713 ?auto_5724 ) ) ( not ( = ?auto_5717 ?auto_5725 ) ) ( SURFACE-AT ?auto_5711 ?auto_5718 ) ( CLEAR ?auto_5711 ) ( IS-CRATE ?auto_5712 ) ( AVAILABLE ?auto_5717 ) ( not ( = ?auto_5721 ?auto_5718 ) ) ( HOIST-AT ?auto_5722 ?auto_5721 ) ( AVAILABLE ?auto_5722 ) ( SURFACE-AT ?auto_5712 ?auto_5721 ) ( ON ?auto_5712 ?auto_5723 ) ( CLEAR ?auto_5712 ) ( TRUCK-AT ?auto_5716 ?auto_5718 ) ( not ( = ?auto_5711 ?auto_5712 ) ) ( not ( = ?auto_5711 ?auto_5723 ) ) ( not ( = ?auto_5712 ?auto_5723 ) ) ( not ( = ?auto_5717 ?auto_5722 ) ) ( not ( = ?auto_5711 ?auto_5713 ) ) ( not ( = ?auto_5711 ?auto_5724 ) ) ( not ( = ?auto_5713 ?auto_5723 ) ) ( not ( = ?auto_5726 ?auto_5721 ) ) ( not ( = ?auto_5725 ?auto_5722 ) ) ( not ( = ?auto_5724 ?auto_5723 ) ) ( not ( = ?auto_5711 ?auto_5714 ) ) ( not ( = ?auto_5711 ?auto_5720 ) ) ( not ( = ?auto_5712 ?auto_5714 ) ) ( not ( = ?auto_5712 ?auto_5720 ) ) ( not ( = ?auto_5714 ?auto_5724 ) ) ( not ( = ?auto_5714 ?auto_5723 ) ) ( not ( = ?auto_5715 ?auto_5726 ) ) ( not ( = ?auto_5715 ?auto_5721 ) ) ( not ( = ?auto_5719 ?auto_5725 ) ) ( not ( = ?auto_5719 ?auto_5722 ) ) ( not ( = ?auto_5720 ?auto_5724 ) ) ( not ( = ?auto_5720 ?auto_5723 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5711 ?auto_5712 ?auto_5713 )
      ( MAKE-1CRATE ?auto_5713 ?auto_5714 )
      ( MAKE-3CRATE-VERIFY ?auto_5711 ?auto_5712 ?auto_5713 ?auto_5714 ) )
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
      ?auto_5749 - HOIST
      ?auto_5752 - PLACE
      ?auto_5747 - PLACE
      ?auto_5750 - HOIST
      ?auto_5751 - SURFACE
      ?auto_5754 - PLACE
      ?auto_5758 - HOIST
      ?auto_5756 - SURFACE
      ?auto_5759 - PLACE
      ?auto_5761 - HOIST
      ?auto_5755 - SURFACE
      ?auto_5753 - PLACE
      ?auto_5757 - HOIST
      ?auto_5760 - SURFACE
      ?auto_5748 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5749 ?auto_5752 ) ( IS-CRATE ?auto_5746 ) ( not ( = ?auto_5747 ?auto_5752 ) ) ( HOIST-AT ?auto_5750 ?auto_5747 ) ( AVAILABLE ?auto_5750 ) ( SURFACE-AT ?auto_5746 ?auto_5747 ) ( ON ?auto_5746 ?auto_5751 ) ( CLEAR ?auto_5746 ) ( not ( = ?auto_5745 ?auto_5746 ) ) ( not ( = ?auto_5745 ?auto_5751 ) ) ( not ( = ?auto_5746 ?auto_5751 ) ) ( not ( = ?auto_5749 ?auto_5750 ) ) ( IS-CRATE ?auto_5745 ) ( not ( = ?auto_5754 ?auto_5752 ) ) ( HOIST-AT ?auto_5758 ?auto_5754 ) ( AVAILABLE ?auto_5758 ) ( SURFACE-AT ?auto_5745 ?auto_5754 ) ( ON ?auto_5745 ?auto_5756 ) ( CLEAR ?auto_5745 ) ( not ( = ?auto_5744 ?auto_5745 ) ) ( not ( = ?auto_5744 ?auto_5756 ) ) ( not ( = ?auto_5745 ?auto_5756 ) ) ( not ( = ?auto_5749 ?auto_5758 ) ) ( IS-CRATE ?auto_5744 ) ( not ( = ?auto_5759 ?auto_5752 ) ) ( HOIST-AT ?auto_5761 ?auto_5759 ) ( AVAILABLE ?auto_5761 ) ( SURFACE-AT ?auto_5744 ?auto_5759 ) ( ON ?auto_5744 ?auto_5755 ) ( CLEAR ?auto_5744 ) ( not ( = ?auto_5743 ?auto_5744 ) ) ( not ( = ?auto_5743 ?auto_5755 ) ) ( not ( = ?auto_5744 ?auto_5755 ) ) ( not ( = ?auto_5749 ?auto_5761 ) ) ( SURFACE-AT ?auto_5742 ?auto_5752 ) ( CLEAR ?auto_5742 ) ( IS-CRATE ?auto_5743 ) ( AVAILABLE ?auto_5749 ) ( not ( = ?auto_5753 ?auto_5752 ) ) ( HOIST-AT ?auto_5757 ?auto_5753 ) ( AVAILABLE ?auto_5757 ) ( SURFACE-AT ?auto_5743 ?auto_5753 ) ( ON ?auto_5743 ?auto_5760 ) ( CLEAR ?auto_5743 ) ( TRUCK-AT ?auto_5748 ?auto_5752 ) ( not ( = ?auto_5742 ?auto_5743 ) ) ( not ( = ?auto_5742 ?auto_5760 ) ) ( not ( = ?auto_5743 ?auto_5760 ) ) ( not ( = ?auto_5749 ?auto_5757 ) ) ( not ( = ?auto_5742 ?auto_5744 ) ) ( not ( = ?auto_5742 ?auto_5755 ) ) ( not ( = ?auto_5744 ?auto_5760 ) ) ( not ( = ?auto_5759 ?auto_5753 ) ) ( not ( = ?auto_5761 ?auto_5757 ) ) ( not ( = ?auto_5755 ?auto_5760 ) ) ( not ( = ?auto_5742 ?auto_5745 ) ) ( not ( = ?auto_5742 ?auto_5756 ) ) ( not ( = ?auto_5743 ?auto_5745 ) ) ( not ( = ?auto_5743 ?auto_5756 ) ) ( not ( = ?auto_5745 ?auto_5755 ) ) ( not ( = ?auto_5745 ?auto_5760 ) ) ( not ( = ?auto_5754 ?auto_5759 ) ) ( not ( = ?auto_5754 ?auto_5753 ) ) ( not ( = ?auto_5758 ?auto_5761 ) ) ( not ( = ?auto_5758 ?auto_5757 ) ) ( not ( = ?auto_5756 ?auto_5755 ) ) ( not ( = ?auto_5756 ?auto_5760 ) ) ( not ( = ?auto_5742 ?auto_5746 ) ) ( not ( = ?auto_5742 ?auto_5751 ) ) ( not ( = ?auto_5743 ?auto_5746 ) ) ( not ( = ?auto_5743 ?auto_5751 ) ) ( not ( = ?auto_5744 ?auto_5746 ) ) ( not ( = ?auto_5744 ?auto_5751 ) ) ( not ( = ?auto_5746 ?auto_5756 ) ) ( not ( = ?auto_5746 ?auto_5755 ) ) ( not ( = ?auto_5746 ?auto_5760 ) ) ( not ( = ?auto_5747 ?auto_5754 ) ) ( not ( = ?auto_5747 ?auto_5759 ) ) ( not ( = ?auto_5747 ?auto_5753 ) ) ( not ( = ?auto_5750 ?auto_5758 ) ) ( not ( = ?auto_5750 ?auto_5761 ) ) ( not ( = ?auto_5750 ?auto_5757 ) ) ( not ( = ?auto_5751 ?auto_5756 ) ) ( not ( = ?auto_5751 ?auto_5755 ) ) ( not ( = ?auto_5751 ?auto_5760 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_5742 ?auto_5743 ?auto_5744 ?auto_5745 )
      ( MAKE-1CRATE ?auto_5745 ?auto_5746 )
      ( MAKE-4CRATE-VERIFY ?auto_5742 ?auto_5743 ?auto_5744 ?auto_5745 ?auto_5746 ) )
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
      ?auto_5787 - HOIST
      ?auto_5784 - PLACE
      ?auto_5788 - PLACE
      ?auto_5785 - HOIST
      ?auto_5789 - SURFACE
      ?auto_5792 - SURFACE
      ?auto_5791 - PLACE
      ?auto_5797 - HOIST
      ?auto_5795 - SURFACE
      ?auto_5798 - PLACE
      ?auto_5790 - HOIST
      ?auto_5793 - SURFACE
      ?auto_5794 - PLACE
      ?auto_5796 - HOIST
      ?auto_5799 - SURFACE
      ?auto_5786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5787 ?auto_5784 ) ( IS-CRATE ?auto_5783 ) ( not ( = ?auto_5788 ?auto_5784 ) ) ( HOIST-AT ?auto_5785 ?auto_5788 ) ( SURFACE-AT ?auto_5783 ?auto_5788 ) ( ON ?auto_5783 ?auto_5789 ) ( CLEAR ?auto_5783 ) ( not ( = ?auto_5782 ?auto_5783 ) ) ( not ( = ?auto_5782 ?auto_5789 ) ) ( not ( = ?auto_5783 ?auto_5789 ) ) ( not ( = ?auto_5787 ?auto_5785 ) ) ( IS-CRATE ?auto_5782 ) ( AVAILABLE ?auto_5785 ) ( SURFACE-AT ?auto_5782 ?auto_5788 ) ( ON ?auto_5782 ?auto_5792 ) ( CLEAR ?auto_5782 ) ( not ( = ?auto_5781 ?auto_5782 ) ) ( not ( = ?auto_5781 ?auto_5792 ) ) ( not ( = ?auto_5782 ?auto_5792 ) ) ( IS-CRATE ?auto_5781 ) ( not ( = ?auto_5791 ?auto_5784 ) ) ( HOIST-AT ?auto_5797 ?auto_5791 ) ( AVAILABLE ?auto_5797 ) ( SURFACE-AT ?auto_5781 ?auto_5791 ) ( ON ?auto_5781 ?auto_5795 ) ( CLEAR ?auto_5781 ) ( not ( = ?auto_5780 ?auto_5781 ) ) ( not ( = ?auto_5780 ?auto_5795 ) ) ( not ( = ?auto_5781 ?auto_5795 ) ) ( not ( = ?auto_5787 ?auto_5797 ) ) ( IS-CRATE ?auto_5780 ) ( not ( = ?auto_5798 ?auto_5784 ) ) ( HOIST-AT ?auto_5790 ?auto_5798 ) ( AVAILABLE ?auto_5790 ) ( SURFACE-AT ?auto_5780 ?auto_5798 ) ( ON ?auto_5780 ?auto_5793 ) ( CLEAR ?auto_5780 ) ( not ( = ?auto_5779 ?auto_5780 ) ) ( not ( = ?auto_5779 ?auto_5793 ) ) ( not ( = ?auto_5780 ?auto_5793 ) ) ( not ( = ?auto_5787 ?auto_5790 ) ) ( SURFACE-AT ?auto_5778 ?auto_5784 ) ( CLEAR ?auto_5778 ) ( IS-CRATE ?auto_5779 ) ( AVAILABLE ?auto_5787 ) ( not ( = ?auto_5794 ?auto_5784 ) ) ( HOIST-AT ?auto_5796 ?auto_5794 ) ( AVAILABLE ?auto_5796 ) ( SURFACE-AT ?auto_5779 ?auto_5794 ) ( ON ?auto_5779 ?auto_5799 ) ( CLEAR ?auto_5779 ) ( TRUCK-AT ?auto_5786 ?auto_5784 ) ( not ( = ?auto_5778 ?auto_5779 ) ) ( not ( = ?auto_5778 ?auto_5799 ) ) ( not ( = ?auto_5779 ?auto_5799 ) ) ( not ( = ?auto_5787 ?auto_5796 ) ) ( not ( = ?auto_5778 ?auto_5780 ) ) ( not ( = ?auto_5778 ?auto_5793 ) ) ( not ( = ?auto_5780 ?auto_5799 ) ) ( not ( = ?auto_5798 ?auto_5794 ) ) ( not ( = ?auto_5790 ?auto_5796 ) ) ( not ( = ?auto_5793 ?auto_5799 ) ) ( not ( = ?auto_5778 ?auto_5781 ) ) ( not ( = ?auto_5778 ?auto_5795 ) ) ( not ( = ?auto_5779 ?auto_5781 ) ) ( not ( = ?auto_5779 ?auto_5795 ) ) ( not ( = ?auto_5781 ?auto_5793 ) ) ( not ( = ?auto_5781 ?auto_5799 ) ) ( not ( = ?auto_5791 ?auto_5798 ) ) ( not ( = ?auto_5791 ?auto_5794 ) ) ( not ( = ?auto_5797 ?auto_5790 ) ) ( not ( = ?auto_5797 ?auto_5796 ) ) ( not ( = ?auto_5795 ?auto_5793 ) ) ( not ( = ?auto_5795 ?auto_5799 ) ) ( not ( = ?auto_5778 ?auto_5782 ) ) ( not ( = ?auto_5778 ?auto_5792 ) ) ( not ( = ?auto_5779 ?auto_5782 ) ) ( not ( = ?auto_5779 ?auto_5792 ) ) ( not ( = ?auto_5780 ?auto_5782 ) ) ( not ( = ?auto_5780 ?auto_5792 ) ) ( not ( = ?auto_5782 ?auto_5795 ) ) ( not ( = ?auto_5782 ?auto_5793 ) ) ( not ( = ?auto_5782 ?auto_5799 ) ) ( not ( = ?auto_5788 ?auto_5791 ) ) ( not ( = ?auto_5788 ?auto_5798 ) ) ( not ( = ?auto_5788 ?auto_5794 ) ) ( not ( = ?auto_5785 ?auto_5797 ) ) ( not ( = ?auto_5785 ?auto_5790 ) ) ( not ( = ?auto_5785 ?auto_5796 ) ) ( not ( = ?auto_5792 ?auto_5795 ) ) ( not ( = ?auto_5792 ?auto_5793 ) ) ( not ( = ?auto_5792 ?auto_5799 ) ) ( not ( = ?auto_5778 ?auto_5783 ) ) ( not ( = ?auto_5778 ?auto_5789 ) ) ( not ( = ?auto_5779 ?auto_5783 ) ) ( not ( = ?auto_5779 ?auto_5789 ) ) ( not ( = ?auto_5780 ?auto_5783 ) ) ( not ( = ?auto_5780 ?auto_5789 ) ) ( not ( = ?auto_5781 ?auto_5783 ) ) ( not ( = ?auto_5781 ?auto_5789 ) ) ( not ( = ?auto_5783 ?auto_5792 ) ) ( not ( = ?auto_5783 ?auto_5795 ) ) ( not ( = ?auto_5783 ?auto_5793 ) ) ( not ( = ?auto_5783 ?auto_5799 ) ) ( not ( = ?auto_5789 ?auto_5792 ) ) ( not ( = ?auto_5789 ?auto_5795 ) ) ( not ( = ?auto_5789 ?auto_5793 ) ) ( not ( = ?auto_5789 ?auto_5799 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_5778 ?auto_5779 ?auto_5780 ?auto_5781 ?auto_5782 )
      ( MAKE-1CRATE ?auto_5782 ?auto_5783 )
      ( MAKE-5CRATE-VERIFY ?auto_5778 ?auto_5779 ?auto_5780 ?auto_5781 ?auto_5782 ?auto_5783 ) )
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
      ?auto_5829 - HOIST
      ?auto_5826 - PLACE
      ?auto_5827 - PLACE
      ?auto_5825 - HOIST
      ?auto_5824 - SURFACE
      ?auto_5838 - PLACE
      ?auto_5831 - HOIST
      ?auto_5834 - SURFACE
      ?auto_5833 - SURFACE
      ?auto_5839 - PLACE
      ?auto_5837 - HOIST
      ?auto_5836 - SURFACE
      ?auto_5832 - PLACE
      ?auto_5830 - HOIST
      ?auto_5835 - SURFACE
      ?auto_5840 - SURFACE
      ?auto_5828 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5829 ?auto_5826 ) ( IS-CRATE ?auto_5823 ) ( not ( = ?auto_5827 ?auto_5826 ) ) ( HOIST-AT ?auto_5825 ?auto_5827 ) ( SURFACE-AT ?auto_5823 ?auto_5827 ) ( ON ?auto_5823 ?auto_5824 ) ( CLEAR ?auto_5823 ) ( not ( = ?auto_5822 ?auto_5823 ) ) ( not ( = ?auto_5822 ?auto_5824 ) ) ( not ( = ?auto_5823 ?auto_5824 ) ) ( not ( = ?auto_5829 ?auto_5825 ) ) ( IS-CRATE ?auto_5822 ) ( not ( = ?auto_5838 ?auto_5826 ) ) ( HOIST-AT ?auto_5831 ?auto_5838 ) ( SURFACE-AT ?auto_5822 ?auto_5838 ) ( ON ?auto_5822 ?auto_5834 ) ( CLEAR ?auto_5822 ) ( not ( = ?auto_5821 ?auto_5822 ) ) ( not ( = ?auto_5821 ?auto_5834 ) ) ( not ( = ?auto_5822 ?auto_5834 ) ) ( not ( = ?auto_5829 ?auto_5831 ) ) ( IS-CRATE ?auto_5821 ) ( AVAILABLE ?auto_5831 ) ( SURFACE-AT ?auto_5821 ?auto_5838 ) ( ON ?auto_5821 ?auto_5833 ) ( CLEAR ?auto_5821 ) ( not ( = ?auto_5820 ?auto_5821 ) ) ( not ( = ?auto_5820 ?auto_5833 ) ) ( not ( = ?auto_5821 ?auto_5833 ) ) ( IS-CRATE ?auto_5820 ) ( not ( = ?auto_5839 ?auto_5826 ) ) ( HOIST-AT ?auto_5837 ?auto_5839 ) ( AVAILABLE ?auto_5837 ) ( SURFACE-AT ?auto_5820 ?auto_5839 ) ( ON ?auto_5820 ?auto_5836 ) ( CLEAR ?auto_5820 ) ( not ( = ?auto_5819 ?auto_5820 ) ) ( not ( = ?auto_5819 ?auto_5836 ) ) ( not ( = ?auto_5820 ?auto_5836 ) ) ( not ( = ?auto_5829 ?auto_5837 ) ) ( IS-CRATE ?auto_5819 ) ( not ( = ?auto_5832 ?auto_5826 ) ) ( HOIST-AT ?auto_5830 ?auto_5832 ) ( AVAILABLE ?auto_5830 ) ( SURFACE-AT ?auto_5819 ?auto_5832 ) ( ON ?auto_5819 ?auto_5835 ) ( CLEAR ?auto_5819 ) ( not ( = ?auto_5818 ?auto_5819 ) ) ( not ( = ?auto_5818 ?auto_5835 ) ) ( not ( = ?auto_5819 ?auto_5835 ) ) ( not ( = ?auto_5829 ?auto_5830 ) ) ( SURFACE-AT ?auto_5817 ?auto_5826 ) ( CLEAR ?auto_5817 ) ( IS-CRATE ?auto_5818 ) ( AVAILABLE ?auto_5829 ) ( AVAILABLE ?auto_5825 ) ( SURFACE-AT ?auto_5818 ?auto_5827 ) ( ON ?auto_5818 ?auto_5840 ) ( CLEAR ?auto_5818 ) ( TRUCK-AT ?auto_5828 ?auto_5826 ) ( not ( = ?auto_5817 ?auto_5818 ) ) ( not ( = ?auto_5817 ?auto_5840 ) ) ( not ( = ?auto_5818 ?auto_5840 ) ) ( not ( = ?auto_5817 ?auto_5819 ) ) ( not ( = ?auto_5817 ?auto_5835 ) ) ( not ( = ?auto_5819 ?auto_5840 ) ) ( not ( = ?auto_5832 ?auto_5827 ) ) ( not ( = ?auto_5830 ?auto_5825 ) ) ( not ( = ?auto_5835 ?auto_5840 ) ) ( not ( = ?auto_5817 ?auto_5820 ) ) ( not ( = ?auto_5817 ?auto_5836 ) ) ( not ( = ?auto_5818 ?auto_5820 ) ) ( not ( = ?auto_5818 ?auto_5836 ) ) ( not ( = ?auto_5820 ?auto_5835 ) ) ( not ( = ?auto_5820 ?auto_5840 ) ) ( not ( = ?auto_5839 ?auto_5832 ) ) ( not ( = ?auto_5839 ?auto_5827 ) ) ( not ( = ?auto_5837 ?auto_5830 ) ) ( not ( = ?auto_5837 ?auto_5825 ) ) ( not ( = ?auto_5836 ?auto_5835 ) ) ( not ( = ?auto_5836 ?auto_5840 ) ) ( not ( = ?auto_5817 ?auto_5821 ) ) ( not ( = ?auto_5817 ?auto_5833 ) ) ( not ( = ?auto_5818 ?auto_5821 ) ) ( not ( = ?auto_5818 ?auto_5833 ) ) ( not ( = ?auto_5819 ?auto_5821 ) ) ( not ( = ?auto_5819 ?auto_5833 ) ) ( not ( = ?auto_5821 ?auto_5836 ) ) ( not ( = ?auto_5821 ?auto_5835 ) ) ( not ( = ?auto_5821 ?auto_5840 ) ) ( not ( = ?auto_5838 ?auto_5839 ) ) ( not ( = ?auto_5838 ?auto_5832 ) ) ( not ( = ?auto_5838 ?auto_5827 ) ) ( not ( = ?auto_5831 ?auto_5837 ) ) ( not ( = ?auto_5831 ?auto_5830 ) ) ( not ( = ?auto_5831 ?auto_5825 ) ) ( not ( = ?auto_5833 ?auto_5836 ) ) ( not ( = ?auto_5833 ?auto_5835 ) ) ( not ( = ?auto_5833 ?auto_5840 ) ) ( not ( = ?auto_5817 ?auto_5822 ) ) ( not ( = ?auto_5817 ?auto_5834 ) ) ( not ( = ?auto_5818 ?auto_5822 ) ) ( not ( = ?auto_5818 ?auto_5834 ) ) ( not ( = ?auto_5819 ?auto_5822 ) ) ( not ( = ?auto_5819 ?auto_5834 ) ) ( not ( = ?auto_5820 ?auto_5822 ) ) ( not ( = ?auto_5820 ?auto_5834 ) ) ( not ( = ?auto_5822 ?auto_5833 ) ) ( not ( = ?auto_5822 ?auto_5836 ) ) ( not ( = ?auto_5822 ?auto_5835 ) ) ( not ( = ?auto_5822 ?auto_5840 ) ) ( not ( = ?auto_5834 ?auto_5833 ) ) ( not ( = ?auto_5834 ?auto_5836 ) ) ( not ( = ?auto_5834 ?auto_5835 ) ) ( not ( = ?auto_5834 ?auto_5840 ) ) ( not ( = ?auto_5817 ?auto_5823 ) ) ( not ( = ?auto_5817 ?auto_5824 ) ) ( not ( = ?auto_5818 ?auto_5823 ) ) ( not ( = ?auto_5818 ?auto_5824 ) ) ( not ( = ?auto_5819 ?auto_5823 ) ) ( not ( = ?auto_5819 ?auto_5824 ) ) ( not ( = ?auto_5820 ?auto_5823 ) ) ( not ( = ?auto_5820 ?auto_5824 ) ) ( not ( = ?auto_5821 ?auto_5823 ) ) ( not ( = ?auto_5821 ?auto_5824 ) ) ( not ( = ?auto_5823 ?auto_5834 ) ) ( not ( = ?auto_5823 ?auto_5833 ) ) ( not ( = ?auto_5823 ?auto_5836 ) ) ( not ( = ?auto_5823 ?auto_5835 ) ) ( not ( = ?auto_5823 ?auto_5840 ) ) ( not ( = ?auto_5824 ?auto_5834 ) ) ( not ( = ?auto_5824 ?auto_5833 ) ) ( not ( = ?auto_5824 ?auto_5836 ) ) ( not ( = ?auto_5824 ?auto_5835 ) ) ( not ( = ?auto_5824 ?auto_5840 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_5817 ?auto_5818 ?auto_5819 ?auto_5820 ?auto_5821 ?auto_5822 )
      ( MAKE-1CRATE ?auto_5822 ?auto_5823 )
      ( MAKE-6CRATE-VERIFY ?auto_5817 ?auto_5818 ?auto_5819 ?auto_5820 ?auto_5821 ?auto_5822 ?auto_5823 ) )
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
      ?auto_5865 - SURFACE
      ?auto_5866 - SURFACE
    )
    :vars
    (
      ?auto_5867 - HOIST
      ?auto_5870 - PLACE
      ?auto_5871 - PLACE
      ?auto_5869 - HOIST
      ?auto_5868 - SURFACE
      ?auto_5874 - PLACE
      ?auto_5876 - HOIST
      ?auto_5877 - SURFACE
      ?auto_5878 - PLACE
      ?auto_5881 - HOIST
      ?auto_5873 - SURFACE
      ?auto_5884 - SURFACE
      ?auto_5882 - PLACE
      ?auto_5875 - HOIST
      ?auto_5885 - SURFACE
      ?auto_5883 - PLACE
      ?auto_5886 - HOIST
      ?auto_5879 - SURFACE
      ?auto_5880 - SURFACE
      ?auto_5872 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5867 ?auto_5870 ) ( IS-CRATE ?auto_5866 ) ( not ( = ?auto_5871 ?auto_5870 ) ) ( HOIST-AT ?auto_5869 ?auto_5871 ) ( AVAILABLE ?auto_5869 ) ( SURFACE-AT ?auto_5866 ?auto_5871 ) ( ON ?auto_5866 ?auto_5868 ) ( CLEAR ?auto_5866 ) ( not ( = ?auto_5865 ?auto_5866 ) ) ( not ( = ?auto_5865 ?auto_5868 ) ) ( not ( = ?auto_5866 ?auto_5868 ) ) ( not ( = ?auto_5867 ?auto_5869 ) ) ( IS-CRATE ?auto_5865 ) ( not ( = ?auto_5874 ?auto_5870 ) ) ( HOIST-AT ?auto_5876 ?auto_5874 ) ( SURFACE-AT ?auto_5865 ?auto_5874 ) ( ON ?auto_5865 ?auto_5877 ) ( CLEAR ?auto_5865 ) ( not ( = ?auto_5864 ?auto_5865 ) ) ( not ( = ?auto_5864 ?auto_5877 ) ) ( not ( = ?auto_5865 ?auto_5877 ) ) ( not ( = ?auto_5867 ?auto_5876 ) ) ( IS-CRATE ?auto_5864 ) ( not ( = ?auto_5878 ?auto_5870 ) ) ( HOIST-AT ?auto_5881 ?auto_5878 ) ( SURFACE-AT ?auto_5864 ?auto_5878 ) ( ON ?auto_5864 ?auto_5873 ) ( CLEAR ?auto_5864 ) ( not ( = ?auto_5863 ?auto_5864 ) ) ( not ( = ?auto_5863 ?auto_5873 ) ) ( not ( = ?auto_5864 ?auto_5873 ) ) ( not ( = ?auto_5867 ?auto_5881 ) ) ( IS-CRATE ?auto_5863 ) ( AVAILABLE ?auto_5881 ) ( SURFACE-AT ?auto_5863 ?auto_5878 ) ( ON ?auto_5863 ?auto_5884 ) ( CLEAR ?auto_5863 ) ( not ( = ?auto_5862 ?auto_5863 ) ) ( not ( = ?auto_5862 ?auto_5884 ) ) ( not ( = ?auto_5863 ?auto_5884 ) ) ( IS-CRATE ?auto_5862 ) ( not ( = ?auto_5882 ?auto_5870 ) ) ( HOIST-AT ?auto_5875 ?auto_5882 ) ( AVAILABLE ?auto_5875 ) ( SURFACE-AT ?auto_5862 ?auto_5882 ) ( ON ?auto_5862 ?auto_5885 ) ( CLEAR ?auto_5862 ) ( not ( = ?auto_5861 ?auto_5862 ) ) ( not ( = ?auto_5861 ?auto_5885 ) ) ( not ( = ?auto_5862 ?auto_5885 ) ) ( not ( = ?auto_5867 ?auto_5875 ) ) ( IS-CRATE ?auto_5861 ) ( not ( = ?auto_5883 ?auto_5870 ) ) ( HOIST-AT ?auto_5886 ?auto_5883 ) ( AVAILABLE ?auto_5886 ) ( SURFACE-AT ?auto_5861 ?auto_5883 ) ( ON ?auto_5861 ?auto_5879 ) ( CLEAR ?auto_5861 ) ( not ( = ?auto_5860 ?auto_5861 ) ) ( not ( = ?auto_5860 ?auto_5879 ) ) ( not ( = ?auto_5861 ?auto_5879 ) ) ( not ( = ?auto_5867 ?auto_5886 ) ) ( SURFACE-AT ?auto_5859 ?auto_5870 ) ( CLEAR ?auto_5859 ) ( IS-CRATE ?auto_5860 ) ( AVAILABLE ?auto_5867 ) ( AVAILABLE ?auto_5876 ) ( SURFACE-AT ?auto_5860 ?auto_5874 ) ( ON ?auto_5860 ?auto_5880 ) ( CLEAR ?auto_5860 ) ( TRUCK-AT ?auto_5872 ?auto_5870 ) ( not ( = ?auto_5859 ?auto_5860 ) ) ( not ( = ?auto_5859 ?auto_5880 ) ) ( not ( = ?auto_5860 ?auto_5880 ) ) ( not ( = ?auto_5859 ?auto_5861 ) ) ( not ( = ?auto_5859 ?auto_5879 ) ) ( not ( = ?auto_5861 ?auto_5880 ) ) ( not ( = ?auto_5883 ?auto_5874 ) ) ( not ( = ?auto_5886 ?auto_5876 ) ) ( not ( = ?auto_5879 ?auto_5880 ) ) ( not ( = ?auto_5859 ?auto_5862 ) ) ( not ( = ?auto_5859 ?auto_5885 ) ) ( not ( = ?auto_5860 ?auto_5862 ) ) ( not ( = ?auto_5860 ?auto_5885 ) ) ( not ( = ?auto_5862 ?auto_5879 ) ) ( not ( = ?auto_5862 ?auto_5880 ) ) ( not ( = ?auto_5882 ?auto_5883 ) ) ( not ( = ?auto_5882 ?auto_5874 ) ) ( not ( = ?auto_5875 ?auto_5886 ) ) ( not ( = ?auto_5875 ?auto_5876 ) ) ( not ( = ?auto_5885 ?auto_5879 ) ) ( not ( = ?auto_5885 ?auto_5880 ) ) ( not ( = ?auto_5859 ?auto_5863 ) ) ( not ( = ?auto_5859 ?auto_5884 ) ) ( not ( = ?auto_5860 ?auto_5863 ) ) ( not ( = ?auto_5860 ?auto_5884 ) ) ( not ( = ?auto_5861 ?auto_5863 ) ) ( not ( = ?auto_5861 ?auto_5884 ) ) ( not ( = ?auto_5863 ?auto_5885 ) ) ( not ( = ?auto_5863 ?auto_5879 ) ) ( not ( = ?auto_5863 ?auto_5880 ) ) ( not ( = ?auto_5878 ?auto_5882 ) ) ( not ( = ?auto_5878 ?auto_5883 ) ) ( not ( = ?auto_5878 ?auto_5874 ) ) ( not ( = ?auto_5881 ?auto_5875 ) ) ( not ( = ?auto_5881 ?auto_5886 ) ) ( not ( = ?auto_5881 ?auto_5876 ) ) ( not ( = ?auto_5884 ?auto_5885 ) ) ( not ( = ?auto_5884 ?auto_5879 ) ) ( not ( = ?auto_5884 ?auto_5880 ) ) ( not ( = ?auto_5859 ?auto_5864 ) ) ( not ( = ?auto_5859 ?auto_5873 ) ) ( not ( = ?auto_5860 ?auto_5864 ) ) ( not ( = ?auto_5860 ?auto_5873 ) ) ( not ( = ?auto_5861 ?auto_5864 ) ) ( not ( = ?auto_5861 ?auto_5873 ) ) ( not ( = ?auto_5862 ?auto_5864 ) ) ( not ( = ?auto_5862 ?auto_5873 ) ) ( not ( = ?auto_5864 ?auto_5884 ) ) ( not ( = ?auto_5864 ?auto_5885 ) ) ( not ( = ?auto_5864 ?auto_5879 ) ) ( not ( = ?auto_5864 ?auto_5880 ) ) ( not ( = ?auto_5873 ?auto_5884 ) ) ( not ( = ?auto_5873 ?auto_5885 ) ) ( not ( = ?auto_5873 ?auto_5879 ) ) ( not ( = ?auto_5873 ?auto_5880 ) ) ( not ( = ?auto_5859 ?auto_5865 ) ) ( not ( = ?auto_5859 ?auto_5877 ) ) ( not ( = ?auto_5860 ?auto_5865 ) ) ( not ( = ?auto_5860 ?auto_5877 ) ) ( not ( = ?auto_5861 ?auto_5865 ) ) ( not ( = ?auto_5861 ?auto_5877 ) ) ( not ( = ?auto_5862 ?auto_5865 ) ) ( not ( = ?auto_5862 ?auto_5877 ) ) ( not ( = ?auto_5863 ?auto_5865 ) ) ( not ( = ?auto_5863 ?auto_5877 ) ) ( not ( = ?auto_5865 ?auto_5873 ) ) ( not ( = ?auto_5865 ?auto_5884 ) ) ( not ( = ?auto_5865 ?auto_5885 ) ) ( not ( = ?auto_5865 ?auto_5879 ) ) ( not ( = ?auto_5865 ?auto_5880 ) ) ( not ( = ?auto_5877 ?auto_5873 ) ) ( not ( = ?auto_5877 ?auto_5884 ) ) ( not ( = ?auto_5877 ?auto_5885 ) ) ( not ( = ?auto_5877 ?auto_5879 ) ) ( not ( = ?auto_5877 ?auto_5880 ) ) ( not ( = ?auto_5859 ?auto_5866 ) ) ( not ( = ?auto_5859 ?auto_5868 ) ) ( not ( = ?auto_5860 ?auto_5866 ) ) ( not ( = ?auto_5860 ?auto_5868 ) ) ( not ( = ?auto_5861 ?auto_5866 ) ) ( not ( = ?auto_5861 ?auto_5868 ) ) ( not ( = ?auto_5862 ?auto_5866 ) ) ( not ( = ?auto_5862 ?auto_5868 ) ) ( not ( = ?auto_5863 ?auto_5866 ) ) ( not ( = ?auto_5863 ?auto_5868 ) ) ( not ( = ?auto_5864 ?auto_5866 ) ) ( not ( = ?auto_5864 ?auto_5868 ) ) ( not ( = ?auto_5866 ?auto_5877 ) ) ( not ( = ?auto_5866 ?auto_5873 ) ) ( not ( = ?auto_5866 ?auto_5884 ) ) ( not ( = ?auto_5866 ?auto_5885 ) ) ( not ( = ?auto_5866 ?auto_5879 ) ) ( not ( = ?auto_5866 ?auto_5880 ) ) ( not ( = ?auto_5871 ?auto_5874 ) ) ( not ( = ?auto_5871 ?auto_5878 ) ) ( not ( = ?auto_5871 ?auto_5882 ) ) ( not ( = ?auto_5871 ?auto_5883 ) ) ( not ( = ?auto_5869 ?auto_5876 ) ) ( not ( = ?auto_5869 ?auto_5881 ) ) ( not ( = ?auto_5869 ?auto_5875 ) ) ( not ( = ?auto_5869 ?auto_5886 ) ) ( not ( = ?auto_5868 ?auto_5877 ) ) ( not ( = ?auto_5868 ?auto_5873 ) ) ( not ( = ?auto_5868 ?auto_5884 ) ) ( not ( = ?auto_5868 ?auto_5885 ) ) ( not ( = ?auto_5868 ?auto_5879 ) ) ( not ( = ?auto_5868 ?auto_5880 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_5859 ?auto_5860 ?auto_5861 ?auto_5862 ?auto_5863 ?auto_5864 ?auto_5865 )
      ( MAKE-1CRATE ?auto_5865 ?auto_5866 )
      ( MAKE-7CRATE-VERIFY ?auto_5859 ?auto_5860 ?auto_5861 ?auto_5862 ?auto_5863 ?auto_5864 ?auto_5865 ?auto_5866 ) )
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
      ?auto_5912 - SURFACE
      ?auto_5913 - SURFACE
      ?auto_5914 - SURFACE
    )
    :vars
    (
      ?auto_5920 - HOIST
      ?auto_5919 - PLACE
      ?auto_5916 - PLACE
      ?auto_5915 - HOIST
      ?auto_5917 - SURFACE
      ?auto_5933 - PLACE
      ?auto_5932 - HOIST
      ?auto_5928 - SURFACE
      ?auto_5926 - PLACE
      ?auto_5930 - HOIST
      ?auto_5922 - SURFACE
      ?auto_5921 - PLACE
      ?auto_5931 - HOIST
      ?auto_5929 - SURFACE
      ?auto_5934 - SURFACE
      ?auto_5935 - PLACE
      ?auto_5937 - HOIST
      ?auto_5924 - SURFACE
      ?auto_5936 - PLACE
      ?auto_5927 - HOIST
      ?auto_5923 - SURFACE
      ?auto_5925 - SURFACE
      ?auto_5918 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5920 ?auto_5919 ) ( IS-CRATE ?auto_5914 ) ( not ( = ?auto_5916 ?auto_5919 ) ) ( HOIST-AT ?auto_5915 ?auto_5916 ) ( AVAILABLE ?auto_5915 ) ( SURFACE-AT ?auto_5914 ?auto_5916 ) ( ON ?auto_5914 ?auto_5917 ) ( CLEAR ?auto_5914 ) ( not ( = ?auto_5913 ?auto_5914 ) ) ( not ( = ?auto_5913 ?auto_5917 ) ) ( not ( = ?auto_5914 ?auto_5917 ) ) ( not ( = ?auto_5920 ?auto_5915 ) ) ( IS-CRATE ?auto_5913 ) ( not ( = ?auto_5933 ?auto_5919 ) ) ( HOIST-AT ?auto_5932 ?auto_5933 ) ( AVAILABLE ?auto_5932 ) ( SURFACE-AT ?auto_5913 ?auto_5933 ) ( ON ?auto_5913 ?auto_5928 ) ( CLEAR ?auto_5913 ) ( not ( = ?auto_5912 ?auto_5913 ) ) ( not ( = ?auto_5912 ?auto_5928 ) ) ( not ( = ?auto_5913 ?auto_5928 ) ) ( not ( = ?auto_5920 ?auto_5932 ) ) ( IS-CRATE ?auto_5912 ) ( not ( = ?auto_5926 ?auto_5919 ) ) ( HOIST-AT ?auto_5930 ?auto_5926 ) ( SURFACE-AT ?auto_5912 ?auto_5926 ) ( ON ?auto_5912 ?auto_5922 ) ( CLEAR ?auto_5912 ) ( not ( = ?auto_5911 ?auto_5912 ) ) ( not ( = ?auto_5911 ?auto_5922 ) ) ( not ( = ?auto_5912 ?auto_5922 ) ) ( not ( = ?auto_5920 ?auto_5930 ) ) ( IS-CRATE ?auto_5911 ) ( not ( = ?auto_5921 ?auto_5919 ) ) ( HOIST-AT ?auto_5931 ?auto_5921 ) ( SURFACE-AT ?auto_5911 ?auto_5921 ) ( ON ?auto_5911 ?auto_5929 ) ( CLEAR ?auto_5911 ) ( not ( = ?auto_5910 ?auto_5911 ) ) ( not ( = ?auto_5910 ?auto_5929 ) ) ( not ( = ?auto_5911 ?auto_5929 ) ) ( not ( = ?auto_5920 ?auto_5931 ) ) ( IS-CRATE ?auto_5910 ) ( AVAILABLE ?auto_5931 ) ( SURFACE-AT ?auto_5910 ?auto_5921 ) ( ON ?auto_5910 ?auto_5934 ) ( CLEAR ?auto_5910 ) ( not ( = ?auto_5909 ?auto_5910 ) ) ( not ( = ?auto_5909 ?auto_5934 ) ) ( not ( = ?auto_5910 ?auto_5934 ) ) ( IS-CRATE ?auto_5909 ) ( not ( = ?auto_5935 ?auto_5919 ) ) ( HOIST-AT ?auto_5937 ?auto_5935 ) ( AVAILABLE ?auto_5937 ) ( SURFACE-AT ?auto_5909 ?auto_5935 ) ( ON ?auto_5909 ?auto_5924 ) ( CLEAR ?auto_5909 ) ( not ( = ?auto_5908 ?auto_5909 ) ) ( not ( = ?auto_5908 ?auto_5924 ) ) ( not ( = ?auto_5909 ?auto_5924 ) ) ( not ( = ?auto_5920 ?auto_5937 ) ) ( IS-CRATE ?auto_5908 ) ( not ( = ?auto_5936 ?auto_5919 ) ) ( HOIST-AT ?auto_5927 ?auto_5936 ) ( AVAILABLE ?auto_5927 ) ( SURFACE-AT ?auto_5908 ?auto_5936 ) ( ON ?auto_5908 ?auto_5923 ) ( CLEAR ?auto_5908 ) ( not ( = ?auto_5907 ?auto_5908 ) ) ( not ( = ?auto_5907 ?auto_5923 ) ) ( not ( = ?auto_5908 ?auto_5923 ) ) ( not ( = ?auto_5920 ?auto_5927 ) ) ( SURFACE-AT ?auto_5906 ?auto_5919 ) ( CLEAR ?auto_5906 ) ( IS-CRATE ?auto_5907 ) ( AVAILABLE ?auto_5920 ) ( AVAILABLE ?auto_5930 ) ( SURFACE-AT ?auto_5907 ?auto_5926 ) ( ON ?auto_5907 ?auto_5925 ) ( CLEAR ?auto_5907 ) ( TRUCK-AT ?auto_5918 ?auto_5919 ) ( not ( = ?auto_5906 ?auto_5907 ) ) ( not ( = ?auto_5906 ?auto_5925 ) ) ( not ( = ?auto_5907 ?auto_5925 ) ) ( not ( = ?auto_5906 ?auto_5908 ) ) ( not ( = ?auto_5906 ?auto_5923 ) ) ( not ( = ?auto_5908 ?auto_5925 ) ) ( not ( = ?auto_5936 ?auto_5926 ) ) ( not ( = ?auto_5927 ?auto_5930 ) ) ( not ( = ?auto_5923 ?auto_5925 ) ) ( not ( = ?auto_5906 ?auto_5909 ) ) ( not ( = ?auto_5906 ?auto_5924 ) ) ( not ( = ?auto_5907 ?auto_5909 ) ) ( not ( = ?auto_5907 ?auto_5924 ) ) ( not ( = ?auto_5909 ?auto_5923 ) ) ( not ( = ?auto_5909 ?auto_5925 ) ) ( not ( = ?auto_5935 ?auto_5936 ) ) ( not ( = ?auto_5935 ?auto_5926 ) ) ( not ( = ?auto_5937 ?auto_5927 ) ) ( not ( = ?auto_5937 ?auto_5930 ) ) ( not ( = ?auto_5924 ?auto_5923 ) ) ( not ( = ?auto_5924 ?auto_5925 ) ) ( not ( = ?auto_5906 ?auto_5910 ) ) ( not ( = ?auto_5906 ?auto_5934 ) ) ( not ( = ?auto_5907 ?auto_5910 ) ) ( not ( = ?auto_5907 ?auto_5934 ) ) ( not ( = ?auto_5908 ?auto_5910 ) ) ( not ( = ?auto_5908 ?auto_5934 ) ) ( not ( = ?auto_5910 ?auto_5924 ) ) ( not ( = ?auto_5910 ?auto_5923 ) ) ( not ( = ?auto_5910 ?auto_5925 ) ) ( not ( = ?auto_5921 ?auto_5935 ) ) ( not ( = ?auto_5921 ?auto_5936 ) ) ( not ( = ?auto_5921 ?auto_5926 ) ) ( not ( = ?auto_5931 ?auto_5937 ) ) ( not ( = ?auto_5931 ?auto_5927 ) ) ( not ( = ?auto_5931 ?auto_5930 ) ) ( not ( = ?auto_5934 ?auto_5924 ) ) ( not ( = ?auto_5934 ?auto_5923 ) ) ( not ( = ?auto_5934 ?auto_5925 ) ) ( not ( = ?auto_5906 ?auto_5911 ) ) ( not ( = ?auto_5906 ?auto_5929 ) ) ( not ( = ?auto_5907 ?auto_5911 ) ) ( not ( = ?auto_5907 ?auto_5929 ) ) ( not ( = ?auto_5908 ?auto_5911 ) ) ( not ( = ?auto_5908 ?auto_5929 ) ) ( not ( = ?auto_5909 ?auto_5911 ) ) ( not ( = ?auto_5909 ?auto_5929 ) ) ( not ( = ?auto_5911 ?auto_5934 ) ) ( not ( = ?auto_5911 ?auto_5924 ) ) ( not ( = ?auto_5911 ?auto_5923 ) ) ( not ( = ?auto_5911 ?auto_5925 ) ) ( not ( = ?auto_5929 ?auto_5934 ) ) ( not ( = ?auto_5929 ?auto_5924 ) ) ( not ( = ?auto_5929 ?auto_5923 ) ) ( not ( = ?auto_5929 ?auto_5925 ) ) ( not ( = ?auto_5906 ?auto_5912 ) ) ( not ( = ?auto_5906 ?auto_5922 ) ) ( not ( = ?auto_5907 ?auto_5912 ) ) ( not ( = ?auto_5907 ?auto_5922 ) ) ( not ( = ?auto_5908 ?auto_5912 ) ) ( not ( = ?auto_5908 ?auto_5922 ) ) ( not ( = ?auto_5909 ?auto_5912 ) ) ( not ( = ?auto_5909 ?auto_5922 ) ) ( not ( = ?auto_5910 ?auto_5912 ) ) ( not ( = ?auto_5910 ?auto_5922 ) ) ( not ( = ?auto_5912 ?auto_5929 ) ) ( not ( = ?auto_5912 ?auto_5934 ) ) ( not ( = ?auto_5912 ?auto_5924 ) ) ( not ( = ?auto_5912 ?auto_5923 ) ) ( not ( = ?auto_5912 ?auto_5925 ) ) ( not ( = ?auto_5922 ?auto_5929 ) ) ( not ( = ?auto_5922 ?auto_5934 ) ) ( not ( = ?auto_5922 ?auto_5924 ) ) ( not ( = ?auto_5922 ?auto_5923 ) ) ( not ( = ?auto_5922 ?auto_5925 ) ) ( not ( = ?auto_5906 ?auto_5913 ) ) ( not ( = ?auto_5906 ?auto_5928 ) ) ( not ( = ?auto_5907 ?auto_5913 ) ) ( not ( = ?auto_5907 ?auto_5928 ) ) ( not ( = ?auto_5908 ?auto_5913 ) ) ( not ( = ?auto_5908 ?auto_5928 ) ) ( not ( = ?auto_5909 ?auto_5913 ) ) ( not ( = ?auto_5909 ?auto_5928 ) ) ( not ( = ?auto_5910 ?auto_5913 ) ) ( not ( = ?auto_5910 ?auto_5928 ) ) ( not ( = ?auto_5911 ?auto_5913 ) ) ( not ( = ?auto_5911 ?auto_5928 ) ) ( not ( = ?auto_5913 ?auto_5922 ) ) ( not ( = ?auto_5913 ?auto_5929 ) ) ( not ( = ?auto_5913 ?auto_5934 ) ) ( not ( = ?auto_5913 ?auto_5924 ) ) ( not ( = ?auto_5913 ?auto_5923 ) ) ( not ( = ?auto_5913 ?auto_5925 ) ) ( not ( = ?auto_5933 ?auto_5926 ) ) ( not ( = ?auto_5933 ?auto_5921 ) ) ( not ( = ?auto_5933 ?auto_5935 ) ) ( not ( = ?auto_5933 ?auto_5936 ) ) ( not ( = ?auto_5932 ?auto_5930 ) ) ( not ( = ?auto_5932 ?auto_5931 ) ) ( not ( = ?auto_5932 ?auto_5937 ) ) ( not ( = ?auto_5932 ?auto_5927 ) ) ( not ( = ?auto_5928 ?auto_5922 ) ) ( not ( = ?auto_5928 ?auto_5929 ) ) ( not ( = ?auto_5928 ?auto_5934 ) ) ( not ( = ?auto_5928 ?auto_5924 ) ) ( not ( = ?auto_5928 ?auto_5923 ) ) ( not ( = ?auto_5928 ?auto_5925 ) ) ( not ( = ?auto_5906 ?auto_5914 ) ) ( not ( = ?auto_5906 ?auto_5917 ) ) ( not ( = ?auto_5907 ?auto_5914 ) ) ( not ( = ?auto_5907 ?auto_5917 ) ) ( not ( = ?auto_5908 ?auto_5914 ) ) ( not ( = ?auto_5908 ?auto_5917 ) ) ( not ( = ?auto_5909 ?auto_5914 ) ) ( not ( = ?auto_5909 ?auto_5917 ) ) ( not ( = ?auto_5910 ?auto_5914 ) ) ( not ( = ?auto_5910 ?auto_5917 ) ) ( not ( = ?auto_5911 ?auto_5914 ) ) ( not ( = ?auto_5911 ?auto_5917 ) ) ( not ( = ?auto_5912 ?auto_5914 ) ) ( not ( = ?auto_5912 ?auto_5917 ) ) ( not ( = ?auto_5914 ?auto_5928 ) ) ( not ( = ?auto_5914 ?auto_5922 ) ) ( not ( = ?auto_5914 ?auto_5929 ) ) ( not ( = ?auto_5914 ?auto_5934 ) ) ( not ( = ?auto_5914 ?auto_5924 ) ) ( not ( = ?auto_5914 ?auto_5923 ) ) ( not ( = ?auto_5914 ?auto_5925 ) ) ( not ( = ?auto_5916 ?auto_5933 ) ) ( not ( = ?auto_5916 ?auto_5926 ) ) ( not ( = ?auto_5916 ?auto_5921 ) ) ( not ( = ?auto_5916 ?auto_5935 ) ) ( not ( = ?auto_5916 ?auto_5936 ) ) ( not ( = ?auto_5915 ?auto_5932 ) ) ( not ( = ?auto_5915 ?auto_5930 ) ) ( not ( = ?auto_5915 ?auto_5931 ) ) ( not ( = ?auto_5915 ?auto_5937 ) ) ( not ( = ?auto_5915 ?auto_5927 ) ) ( not ( = ?auto_5917 ?auto_5928 ) ) ( not ( = ?auto_5917 ?auto_5922 ) ) ( not ( = ?auto_5917 ?auto_5929 ) ) ( not ( = ?auto_5917 ?auto_5934 ) ) ( not ( = ?auto_5917 ?auto_5924 ) ) ( not ( = ?auto_5917 ?auto_5923 ) ) ( not ( = ?auto_5917 ?auto_5925 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_5906 ?auto_5907 ?auto_5908 ?auto_5909 ?auto_5910 ?auto_5911 ?auto_5912 ?auto_5913 )
      ( MAKE-1CRATE ?auto_5913 ?auto_5914 )
      ( MAKE-8CRATE-VERIFY ?auto_5906 ?auto_5907 ?auto_5908 ?auto_5909 ?auto_5910 ?auto_5911 ?auto_5912 ?auto_5913 ?auto_5914 ) )
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
      ?auto_5964 - SURFACE
      ?auto_5965 - SURFACE
      ?auto_5966 - SURFACE
      ?auto_5967 - SURFACE
    )
    :vars
    (
      ?auto_5973 - HOIST
      ?auto_5972 - PLACE
      ?auto_5968 - PLACE
      ?auto_5969 - HOIST
      ?auto_5970 - SURFACE
      ?auto_5975 - PLACE
      ?auto_5990 - HOIST
      ?auto_5980 - SURFACE
      ?auto_5983 - PLACE
      ?auto_5991 - HOIST
      ?auto_5979 - SURFACE
      ?auto_5974 - SURFACE
      ?auto_5986 - PLACE
      ?auto_5988 - HOIST
      ?auto_5989 - SURFACE
      ?auto_5985 - SURFACE
      ?auto_5976 - PLACE
      ?auto_5987 - HOIST
      ?auto_5982 - SURFACE
      ?auto_5984 - PLACE
      ?auto_5977 - HOIST
      ?auto_5981 - SURFACE
      ?auto_5978 - SURFACE
      ?auto_5971 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5973 ?auto_5972 ) ( IS-CRATE ?auto_5967 ) ( not ( = ?auto_5968 ?auto_5972 ) ) ( HOIST-AT ?auto_5969 ?auto_5968 ) ( SURFACE-AT ?auto_5967 ?auto_5968 ) ( ON ?auto_5967 ?auto_5970 ) ( CLEAR ?auto_5967 ) ( not ( = ?auto_5966 ?auto_5967 ) ) ( not ( = ?auto_5966 ?auto_5970 ) ) ( not ( = ?auto_5967 ?auto_5970 ) ) ( not ( = ?auto_5973 ?auto_5969 ) ) ( IS-CRATE ?auto_5966 ) ( not ( = ?auto_5975 ?auto_5972 ) ) ( HOIST-AT ?auto_5990 ?auto_5975 ) ( AVAILABLE ?auto_5990 ) ( SURFACE-AT ?auto_5966 ?auto_5975 ) ( ON ?auto_5966 ?auto_5980 ) ( CLEAR ?auto_5966 ) ( not ( = ?auto_5965 ?auto_5966 ) ) ( not ( = ?auto_5965 ?auto_5980 ) ) ( not ( = ?auto_5966 ?auto_5980 ) ) ( not ( = ?auto_5973 ?auto_5990 ) ) ( IS-CRATE ?auto_5965 ) ( not ( = ?auto_5983 ?auto_5972 ) ) ( HOIST-AT ?auto_5991 ?auto_5983 ) ( AVAILABLE ?auto_5991 ) ( SURFACE-AT ?auto_5965 ?auto_5983 ) ( ON ?auto_5965 ?auto_5979 ) ( CLEAR ?auto_5965 ) ( not ( = ?auto_5964 ?auto_5965 ) ) ( not ( = ?auto_5964 ?auto_5979 ) ) ( not ( = ?auto_5965 ?auto_5979 ) ) ( not ( = ?auto_5973 ?auto_5991 ) ) ( IS-CRATE ?auto_5964 ) ( SURFACE-AT ?auto_5964 ?auto_5968 ) ( ON ?auto_5964 ?auto_5974 ) ( CLEAR ?auto_5964 ) ( not ( = ?auto_5963 ?auto_5964 ) ) ( not ( = ?auto_5963 ?auto_5974 ) ) ( not ( = ?auto_5964 ?auto_5974 ) ) ( IS-CRATE ?auto_5963 ) ( not ( = ?auto_5986 ?auto_5972 ) ) ( HOIST-AT ?auto_5988 ?auto_5986 ) ( SURFACE-AT ?auto_5963 ?auto_5986 ) ( ON ?auto_5963 ?auto_5989 ) ( CLEAR ?auto_5963 ) ( not ( = ?auto_5962 ?auto_5963 ) ) ( not ( = ?auto_5962 ?auto_5989 ) ) ( not ( = ?auto_5963 ?auto_5989 ) ) ( not ( = ?auto_5973 ?auto_5988 ) ) ( IS-CRATE ?auto_5962 ) ( AVAILABLE ?auto_5988 ) ( SURFACE-AT ?auto_5962 ?auto_5986 ) ( ON ?auto_5962 ?auto_5985 ) ( CLEAR ?auto_5962 ) ( not ( = ?auto_5961 ?auto_5962 ) ) ( not ( = ?auto_5961 ?auto_5985 ) ) ( not ( = ?auto_5962 ?auto_5985 ) ) ( IS-CRATE ?auto_5961 ) ( not ( = ?auto_5976 ?auto_5972 ) ) ( HOIST-AT ?auto_5987 ?auto_5976 ) ( AVAILABLE ?auto_5987 ) ( SURFACE-AT ?auto_5961 ?auto_5976 ) ( ON ?auto_5961 ?auto_5982 ) ( CLEAR ?auto_5961 ) ( not ( = ?auto_5960 ?auto_5961 ) ) ( not ( = ?auto_5960 ?auto_5982 ) ) ( not ( = ?auto_5961 ?auto_5982 ) ) ( not ( = ?auto_5973 ?auto_5987 ) ) ( IS-CRATE ?auto_5960 ) ( not ( = ?auto_5984 ?auto_5972 ) ) ( HOIST-AT ?auto_5977 ?auto_5984 ) ( AVAILABLE ?auto_5977 ) ( SURFACE-AT ?auto_5960 ?auto_5984 ) ( ON ?auto_5960 ?auto_5981 ) ( CLEAR ?auto_5960 ) ( not ( = ?auto_5959 ?auto_5960 ) ) ( not ( = ?auto_5959 ?auto_5981 ) ) ( not ( = ?auto_5960 ?auto_5981 ) ) ( not ( = ?auto_5973 ?auto_5977 ) ) ( SURFACE-AT ?auto_5958 ?auto_5972 ) ( CLEAR ?auto_5958 ) ( IS-CRATE ?auto_5959 ) ( AVAILABLE ?auto_5973 ) ( AVAILABLE ?auto_5969 ) ( SURFACE-AT ?auto_5959 ?auto_5968 ) ( ON ?auto_5959 ?auto_5978 ) ( CLEAR ?auto_5959 ) ( TRUCK-AT ?auto_5971 ?auto_5972 ) ( not ( = ?auto_5958 ?auto_5959 ) ) ( not ( = ?auto_5958 ?auto_5978 ) ) ( not ( = ?auto_5959 ?auto_5978 ) ) ( not ( = ?auto_5958 ?auto_5960 ) ) ( not ( = ?auto_5958 ?auto_5981 ) ) ( not ( = ?auto_5960 ?auto_5978 ) ) ( not ( = ?auto_5984 ?auto_5968 ) ) ( not ( = ?auto_5977 ?auto_5969 ) ) ( not ( = ?auto_5981 ?auto_5978 ) ) ( not ( = ?auto_5958 ?auto_5961 ) ) ( not ( = ?auto_5958 ?auto_5982 ) ) ( not ( = ?auto_5959 ?auto_5961 ) ) ( not ( = ?auto_5959 ?auto_5982 ) ) ( not ( = ?auto_5961 ?auto_5981 ) ) ( not ( = ?auto_5961 ?auto_5978 ) ) ( not ( = ?auto_5976 ?auto_5984 ) ) ( not ( = ?auto_5976 ?auto_5968 ) ) ( not ( = ?auto_5987 ?auto_5977 ) ) ( not ( = ?auto_5987 ?auto_5969 ) ) ( not ( = ?auto_5982 ?auto_5981 ) ) ( not ( = ?auto_5982 ?auto_5978 ) ) ( not ( = ?auto_5958 ?auto_5962 ) ) ( not ( = ?auto_5958 ?auto_5985 ) ) ( not ( = ?auto_5959 ?auto_5962 ) ) ( not ( = ?auto_5959 ?auto_5985 ) ) ( not ( = ?auto_5960 ?auto_5962 ) ) ( not ( = ?auto_5960 ?auto_5985 ) ) ( not ( = ?auto_5962 ?auto_5982 ) ) ( not ( = ?auto_5962 ?auto_5981 ) ) ( not ( = ?auto_5962 ?auto_5978 ) ) ( not ( = ?auto_5986 ?auto_5976 ) ) ( not ( = ?auto_5986 ?auto_5984 ) ) ( not ( = ?auto_5986 ?auto_5968 ) ) ( not ( = ?auto_5988 ?auto_5987 ) ) ( not ( = ?auto_5988 ?auto_5977 ) ) ( not ( = ?auto_5988 ?auto_5969 ) ) ( not ( = ?auto_5985 ?auto_5982 ) ) ( not ( = ?auto_5985 ?auto_5981 ) ) ( not ( = ?auto_5985 ?auto_5978 ) ) ( not ( = ?auto_5958 ?auto_5963 ) ) ( not ( = ?auto_5958 ?auto_5989 ) ) ( not ( = ?auto_5959 ?auto_5963 ) ) ( not ( = ?auto_5959 ?auto_5989 ) ) ( not ( = ?auto_5960 ?auto_5963 ) ) ( not ( = ?auto_5960 ?auto_5989 ) ) ( not ( = ?auto_5961 ?auto_5963 ) ) ( not ( = ?auto_5961 ?auto_5989 ) ) ( not ( = ?auto_5963 ?auto_5985 ) ) ( not ( = ?auto_5963 ?auto_5982 ) ) ( not ( = ?auto_5963 ?auto_5981 ) ) ( not ( = ?auto_5963 ?auto_5978 ) ) ( not ( = ?auto_5989 ?auto_5985 ) ) ( not ( = ?auto_5989 ?auto_5982 ) ) ( not ( = ?auto_5989 ?auto_5981 ) ) ( not ( = ?auto_5989 ?auto_5978 ) ) ( not ( = ?auto_5958 ?auto_5964 ) ) ( not ( = ?auto_5958 ?auto_5974 ) ) ( not ( = ?auto_5959 ?auto_5964 ) ) ( not ( = ?auto_5959 ?auto_5974 ) ) ( not ( = ?auto_5960 ?auto_5964 ) ) ( not ( = ?auto_5960 ?auto_5974 ) ) ( not ( = ?auto_5961 ?auto_5964 ) ) ( not ( = ?auto_5961 ?auto_5974 ) ) ( not ( = ?auto_5962 ?auto_5964 ) ) ( not ( = ?auto_5962 ?auto_5974 ) ) ( not ( = ?auto_5964 ?auto_5989 ) ) ( not ( = ?auto_5964 ?auto_5985 ) ) ( not ( = ?auto_5964 ?auto_5982 ) ) ( not ( = ?auto_5964 ?auto_5981 ) ) ( not ( = ?auto_5964 ?auto_5978 ) ) ( not ( = ?auto_5974 ?auto_5989 ) ) ( not ( = ?auto_5974 ?auto_5985 ) ) ( not ( = ?auto_5974 ?auto_5982 ) ) ( not ( = ?auto_5974 ?auto_5981 ) ) ( not ( = ?auto_5974 ?auto_5978 ) ) ( not ( = ?auto_5958 ?auto_5965 ) ) ( not ( = ?auto_5958 ?auto_5979 ) ) ( not ( = ?auto_5959 ?auto_5965 ) ) ( not ( = ?auto_5959 ?auto_5979 ) ) ( not ( = ?auto_5960 ?auto_5965 ) ) ( not ( = ?auto_5960 ?auto_5979 ) ) ( not ( = ?auto_5961 ?auto_5965 ) ) ( not ( = ?auto_5961 ?auto_5979 ) ) ( not ( = ?auto_5962 ?auto_5965 ) ) ( not ( = ?auto_5962 ?auto_5979 ) ) ( not ( = ?auto_5963 ?auto_5965 ) ) ( not ( = ?auto_5963 ?auto_5979 ) ) ( not ( = ?auto_5965 ?auto_5974 ) ) ( not ( = ?auto_5965 ?auto_5989 ) ) ( not ( = ?auto_5965 ?auto_5985 ) ) ( not ( = ?auto_5965 ?auto_5982 ) ) ( not ( = ?auto_5965 ?auto_5981 ) ) ( not ( = ?auto_5965 ?auto_5978 ) ) ( not ( = ?auto_5983 ?auto_5968 ) ) ( not ( = ?auto_5983 ?auto_5986 ) ) ( not ( = ?auto_5983 ?auto_5976 ) ) ( not ( = ?auto_5983 ?auto_5984 ) ) ( not ( = ?auto_5991 ?auto_5969 ) ) ( not ( = ?auto_5991 ?auto_5988 ) ) ( not ( = ?auto_5991 ?auto_5987 ) ) ( not ( = ?auto_5991 ?auto_5977 ) ) ( not ( = ?auto_5979 ?auto_5974 ) ) ( not ( = ?auto_5979 ?auto_5989 ) ) ( not ( = ?auto_5979 ?auto_5985 ) ) ( not ( = ?auto_5979 ?auto_5982 ) ) ( not ( = ?auto_5979 ?auto_5981 ) ) ( not ( = ?auto_5979 ?auto_5978 ) ) ( not ( = ?auto_5958 ?auto_5966 ) ) ( not ( = ?auto_5958 ?auto_5980 ) ) ( not ( = ?auto_5959 ?auto_5966 ) ) ( not ( = ?auto_5959 ?auto_5980 ) ) ( not ( = ?auto_5960 ?auto_5966 ) ) ( not ( = ?auto_5960 ?auto_5980 ) ) ( not ( = ?auto_5961 ?auto_5966 ) ) ( not ( = ?auto_5961 ?auto_5980 ) ) ( not ( = ?auto_5962 ?auto_5966 ) ) ( not ( = ?auto_5962 ?auto_5980 ) ) ( not ( = ?auto_5963 ?auto_5966 ) ) ( not ( = ?auto_5963 ?auto_5980 ) ) ( not ( = ?auto_5964 ?auto_5966 ) ) ( not ( = ?auto_5964 ?auto_5980 ) ) ( not ( = ?auto_5966 ?auto_5979 ) ) ( not ( = ?auto_5966 ?auto_5974 ) ) ( not ( = ?auto_5966 ?auto_5989 ) ) ( not ( = ?auto_5966 ?auto_5985 ) ) ( not ( = ?auto_5966 ?auto_5982 ) ) ( not ( = ?auto_5966 ?auto_5981 ) ) ( not ( = ?auto_5966 ?auto_5978 ) ) ( not ( = ?auto_5975 ?auto_5983 ) ) ( not ( = ?auto_5975 ?auto_5968 ) ) ( not ( = ?auto_5975 ?auto_5986 ) ) ( not ( = ?auto_5975 ?auto_5976 ) ) ( not ( = ?auto_5975 ?auto_5984 ) ) ( not ( = ?auto_5990 ?auto_5991 ) ) ( not ( = ?auto_5990 ?auto_5969 ) ) ( not ( = ?auto_5990 ?auto_5988 ) ) ( not ( = ?auto_5990 ?auto_5987 ) ) ( not ( = ?auto_5990 ?auto_5977 ) ) ( not ( = ?auto_5980 ?auto_5979 ) ) ( not ( = ?auto_5980 ?auto_5974 ) ) ( not ( = ?auto_5980 ?auto_5989 ) ) ( not ( = ?auto_5980 ?auto_5985 ) ) ( not ( = ?auto_5980 ?auto_5982 ) ) ( not ( = ?auto_5980 ?auto_5981 ) ) ( not ( = ?auto_5980 ?auto_5978 ) ) ( not ( = ?auto_5958 ?auto_5967 ) ) ( not ( = ?auto_5958 ?auto_5970 ) ) ( not ( = ?auto_5959 ?auto_5967 ) ) ( not ( = ?auto_5959 ?auto_5970 ) ) ( not ( = ?auto_5960 ?auto_5967 ) ) ( not ( = ?auto_5960 ?auto_5970 ) ) ( not ( = ?auto_5961 ?auto_5967 ) ) ( not ( = ?auto_5961 ?auto_5970 ) ) ( not ( = ?auto_5962 ?auto_5967 ) ) ( not ( = ?auto_5962 ?auto_5970 ) ) ( not ( = ?auto_5963 ?auto_5967 ) ) ( not ( = ?auto_5963 ?auto_5970 ) ) ( not ( = ?auto_5964 ?auto_5967 ) ) ( not ( = ?auto_5964 ?auto_5970 ) ) ( not ( = ?auto_5965 ?auto_5967 ) ) ( not ( = ?auto_5965 ?auto_5970 ) ) ( not ( = ?auto_5967 ?auto_5980 ) ) ( not ( = ?auto_5967 ?auto_5979 ) ) ( not ( = ?auto_5967 ?auto_5974 ) ) ( not ( = ?auto_5967 ?auto_5989 ) ) ( not ( = ?auto_5967 ?auto_5985 ) ) ( not ( = ?auto_5967 ?auto_5982 ) ) ( not ( = ?auto_5967 ?auto_5981 ) ) ( not ( = ?auto_5967 ?auto_5978 ) ) ( not ( = ?auto_5970 ?auto_5980 ) ) ( not ( = ?auto_5970 ?auto_5979 ) ) ( not ( = ?auto_5970 ?auto_5974 ) ) ( not ( = ?auto_5970 ?auto_5989 ) ) ( not ( = ?auto_5970 ?auto_5985 ) ) ( not ( = ?auto_5970 ?auto_5982 ) ) ( not ( = ?auto_5970 ?auto_5981 ) ) ( not ( = ?auto_5970 ?auto_5978 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_5958 ?auto_5959 ?auto_5960 ?auto_5961 ?auto_5962 ?auto_5963 ?auto_5964 ?auto_5965 ?auto_5966 )
      ( MAKE-1CRATE ?auto_5966 ?auto_5967 )
      ( MAKE-9CRATE-VERIFY ?auto_5958 ?auto_5959 ?auto_5960 ?auto_5961 ?auto_5962 ?auto_5963 ?auto_5964 ?auto_5965 ?auto_5966 ?auto_5967 ) )
  )

)

