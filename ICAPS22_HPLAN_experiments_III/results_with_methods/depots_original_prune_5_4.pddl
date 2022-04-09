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
      ?auto_24703 - SURFACE
      ?auto_24704 - SURFACE
    )
    :vars
    (
      ?auto_24705 - HOIST
      ?auto_24706 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24705 ?auto_24706 ) ( SURFACE-AT ?auto_24703 ?auto_24706 ) ( CLEAR ?auto_24703 ) ( LIFTING ?auto_24705 ?auto_24704 ) ( IS-CRATE ?auto_24704 ) ( not ( = ?auto_24703 ?auto_24704 ) ) )
    :subtasks
    ( ( !DROP ?auto_24705 ?auto_24704 ?auto_24703 ?auto_24706 )
      ( MAKE-1CRATE-VERIFY ?auto_24703 ?auto_24704 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24707 - SURFACE
      ?auto_24708 - SURFACE
    )
    :vars
    (
      ?auto_24709 - HOIST
      ?auto_24710 - PLACE
      ?auto_24711 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24709 ?auto_24710 ) ( SURFACE-AT ?auto_24707 ?auto_24710 ) ( CLEAR ?auto_24707 ) ( IS-CRATE ?auto_24708 ) ( not ( = ?auto_24707 ?auto_24708 ) ) ( TRUCK-AT ?auto_24711 ?auto_24710 ) ( AVAILABLE ?auto_24709 ) ( IN ?auto_24708 ?auto_24711 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24709 ?auto_24708 ?auto_24711 ?auto_24710 )
      ( MAKE-1CRATE ?auto_24707 ?auto_24708 )
      ( MAKE-1CRATE-VERIFY ?auto_24707 ?auto_24708 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24712 - SURFACE
      ?auto_24713 - SURFACE
    )
    :vars
    (
      ?auto_24716 - HOIST
      ?auto_24715 - PLACE
      ?auto_24714 - TRUCK
      ?auto_24717 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24716 ?auto_24715 ) ( SURFACE-AT ?auto_24712 ?auto_24715 ) ( CLEAR ?auto_24712 ) ( IS-CRATE ?auto_24713 ) ( not ( = ?auto_24712 ?auto_24713 ) ) ( AVAILABLE ?auto_24716 ) ( IN ?auto_24713 ?auto_24714 ) ( TRUCK-AT ?auto_24714 ?auto_24717 ) ( not ( = ?auto_24717 ?auto_24715 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24714 ?auto_24717 ?auto_24715 )
      ( MAKE-1CRATE ?auto_24712 ?auto_24713 )
      ( MAKE-1CRATE-VERIFY ?auto_24712 ?auto_24713 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24718 - SURFACE
      ?auto_24719 - SURFACE
    )
    :vars
    (
      ?auto_24720 - HOIST
      ?auto_24721 - PLACE
      ?auto_24722 - TRUCK
      ?auto_24723 - PLACE
      ?auto_24724 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24720 ?auto_24721 ) ( SURFACE-AT ?auto_24718 ?auto_24721 ) ( CLEAR ?auto_24718 ) ( IS-CRATE ?auto_24719 ) ( not ( = ?auto_24718 ?auto_24719 ) ) ( AVAILABLE ?auto_24720 ) ( TRUCK-AT ?auto_24722 ?auto_24723 ) ( not ( = ?auto_24723 ?auto_24721 ) ) ( HOIST-AT ?auto_24724 ?auto_24723 ) ( LIFTING ?auto_24724 ?auto_24719 ) ( not ( = ?auto_24720 ?auto_24724 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24724 ?auto_24719 ?auto_24722 ?auto_24723 )
      ( MAKE-1CRATE ?auto_24718 ?auto_24719 )
      ( MAKE-1CRATE-VERIFY ?auto_24718 ?auto_24719 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24725 - SURFACE
      ?auto_24726 - SURFACE
    )
    :vars
    (
      ?auto_24728 - HOIST
      ?auto_24730 - PLACE
      ?auto_24727 - TRUCK
      ?auto_24729 - PLACE
      ?auto_24731 - HOIST
      ?auto_24732 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24728 ?auto_24730 ) ( SURFACE-AT ?auto_24725 ?auto_24730 ) ( CLEAR ?auto_24725 ) ( IS-CRATE ?auto_24726 ) ( not ( = ?auto_24725 ?auto_24726 ) ) ( AVAILABLE ?auto_24728 ) ( TRUCK-AT ?auto_24727 ?auto_24729 ) ( not ( = ?auto_24729 ?auto_24730 ) ) ( HOIST-AT ?auto_24731 ?auto_24729 ) ( not ( = ?auto_24728 ?auto_24731 ) ) ( AVAILABLE ?auto_24731 ) ( SURFACE-AT ?auto_24726 ?auto_24729 ) ( ON ?auto_24726 ?auto_24732 ) ( CLEAR ?auto_24726 ) ( not ( = ?auto_24725 ?auto_24732 ) ) ( not ( = ?auto_24726 ?auto_24732 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24731 ?auto_24726 ?auto_24732 ?auto_24729 )
      ( MAKE-1CRATE ?auto_24725 ?auto_24726 )
      ( MAKE-1CRATE-VERIFY ?auto_24725 ?auto_24726 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24733 - SURFACE
      ?auto_24734 - SURFACE
    )
    :vars
    (
      ?auto_24740 - HOIST
      ?auto_24735 - PLACE
      ?auto_24738 - PLACE
      ?auto_24739 - HOIST
      ?auto_24737 - SURFACE
      ?auto_24736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24740 ?auto_24735 ) ( SURFACE-AT ?auto_24733 ?auto_24735 ) ( CLEAR ?auto_24733 ) ( IS-CRATE ?auto_24734 ) ( not ( = ?auto_24733 ?auto_24734 ) ) ( AVAILABLE ?auto_24740 ) ( not ( = ?auto_24738 ?auto_24735 ) ) ( HOIST-AT ?auto_24739 ?auto_24738 ) ( not ( = ?auto_24740 ?auto_24739 ) ) ( AVAILABLE ?auto_24739 ) ( SURFACE-AT ?auto_24734 ?auto_24738 ) ( ON ?auto_24734 ?auto_24737 ) ( CLEAR ?auto_24734 ) ( not ( = ?auto_24733 ?auto_24737 ) ) ( not ( = ?auto_24734 ?auto_24737 ) ) ( TRUCK-AT ?auto_24736 ?auto_24735 ) )
    :subtasks
    ( ( !DRIVE ?auto_24736 ?auto_24735 ?auto_24738 )
      ( MAKE-1CRATE ?auto_24733 ?auto_24734 )
      ( MAKE-1CRATE-VERIFY ?auto_24733 ?auto_24734 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24750 - SURFACE
      ?auto_24751 - SURFACE
      ?auto_24752 - SURFACE
    )
    :vars
    (
      ?auto_24753 - HOIST
      ?auto_24754 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24753 ?auto_24754 ) ( SURFACE-AT ?auto_24751 ?auto_24754 ) ( CLEAR ?auto_24751 ) ( LIFTING ?auto_24753 ?auto_24752 ) ( IS-CRATE ?auto_24752 ) ( not ( = ?auto_24751 ?auto_24752 ) ) ( ON ?auto_24751 ?auto_24750 ) ( not ( = ?auto_24750 ?auto_24751 ) ) ( not ( = ?auto_24750 ?auto_24752 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24751 ?auto_24752 )
      ( MAKE-2CRATE-VERIFY ?auto_24750 ?auto_24751 ?auto_24752 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24760 - SURFACE
      ?auto_24761 - SURFACE
      ?auto_24762 - SURFACE
    )
    :vars
    (
      ?auto_24763 - HOIST
      ?auto_24764 - PLACE
      ?auto_24765 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24763 ?auto_24764 ) ( SURFACE-AT ?auto_24761 ?auto_24764 ) ( CLEAR ?auto_24761 ) ( IS-CRATE ?auto_24762 ) ( not ( = ?auto_24761 ?auto_24762 ) ) ( TRUCK-AT ?auto_24765 ?auto_24764 ) ( AVAILABLE ?auto_24763 ) ( IN ?auto_24762 ?auto_24765 ) ( ON ?auto_24761 ?auto_24760 ) ( not ( = ?auto_24760 ?auto_24761 ) ) ( not ( = ?auto_24760 ?auto_24762 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24761 ?auto_24762 )
      ( MAKE-2CRATE-VERIFY ?auto_24760 ?auto_24761 ?auto_24762 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24766 - SURFACE
      ?auto_24767 - SURFACE
    )
    :vars
    (
      ?auto_24770 - HOIST
      ?auto_24771 - PLACE
      ?auto_24769 - TRUCK
      ?auto_24768 - SURFACE
      ?auto_24772 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24770 ?auto_24771 ) ( SURFACE-AT ?auto_24766 ?auto_24771 ) ( CLEAR ?auto_24766 ) ( IS-CRATE ?auto_24767 ) ( not ( = ?auto_24766 ?auto_24767 ) ) ( AVAILABLE ?auto_24770 ) ( IN ?auto_24767 ?auto_24769 ) ( ON ?auto_24766 ?auto_24768 ) ( not ( = ?auto_24768 ?auto_24766 ) ) ( not ( = ?auto_24768 ?auto_24767 ) ) ( TRUCK-AT ?auto_24769 ?auto_24772 ) ( not ( = ?auto_24772 ?auto_24771 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24769 ?auto_24772 ?auto_24771 )
      ( MAKE-2CRATE ?auto_24768 ?auto_24766 ?auto_24767 )
      ( MAKE-1CRATE-VERIFY ?auto_24766 ?auto_24767 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24773 - SURFACE
      ?auto_24774 - SURFACE
      ?auto_24775 - SURFACE
    )
    :vars
    (
      ?auto_24778 - HOIST
      ?auto_24776 - PLACE
      ?auto_24777 - TRUCK
      ?auto_24779 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24778 ?auto_24776 ) ( SURFACE-AT ?auto_24774 ?auto_24776 ) ( CLEAR ?auto_24774 ) ( IS-CRATE ?auto_24775 ) ( not ( = ?auto_24774 ?auto_24775 ) ) ( AVAILABLE ?auto_24778 ) ( IN ?auto_24775 ?auto_24777 ) ( ON ?auto_24774 ?auto_24773 ) ( not ( = ?auto_24773 ?auto_24774 ) ) ( not ( = ?auto_24773 ?auto_24775 ) ) ( TRUCK-AT ?auto_24777 ?auto_24779 ) ( not ( = ?auto_24779 ?auto_24776 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24774 ?auto_24775 )
      ( MAKE-2CRATE-VERIFY ?auto_24773 ?auto_24774 ?auto_24775 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24780 - SURFACE
      ?auto_24781 - SURFACE
    )
    :vars
    (
      ?auto_24784 - HOIST
      ?auto_24786 - PLACE
      ?auto_24782 - SURFACE
      ?auto_24783 - TRUCK
      ?auto_24785 - PLACE
      ?auto_24787 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24784 ?auto_24786 ) ( SURFACE-AT ?auto_24780 ?auto_24786 ) ( CLEAR ?auto_24780 ) ( IS-CRATE ?auto_24781 ) ( not ( = ?auto_24780 ?auto_24781 ) ) ( AVAILABLE ?auto_24784 ) ( ON ?auto_24780 ?auto_24782 ) ( not ( = ?auto_24782 ?auto_24780 ) ) ( not ( = ?auto_24782 ?auto_24781 ) ) ( TRUCK-AT ?auto_24783 ?auto_24785 ) ( not ( = ?auto_24785 ?auto_24786 ) ) ( HOIST-AT ?auto_24787 ?auto_24785 ) ( LIFTING ?auto_24787 ?auto_24781 ) ( not ( = ?auto_24784 ?auto_24787 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24787 ?auto_24781 ?auto_24783 ?auto_24785 )
      ( MAKE-2CRATE ?auto_24782 ?auto_24780 ?auto_24781 )
      ( MAKE-1CRATE-VERIFY ?auto_24780 ?auto_24781 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24788 - SURFACE
      ?auto_24789 - SURFACE
      ?auto_24790 - SURFACE
    )
    :vars
    (
      ?auto_24791 - HOIST
      ?auto_24793 - PLACE
      ?auto_24795 - TRUCK
      ?auto_24794 - PLACE
      ?auto_24792 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24791 ?auto_24793 ) ( SURFACE-AT ?auto_24789 ?auto_24793 ) ( CLEAR ?auto_24789 ) ( IS-CRATE ?auto_24790 ) ( not ( = ?auto_24789 ?auto_24790 ) ) ( AVAILABLE ?auto_24791 ) ( ON ?auto_24789 ?auto_24788 ) ( not ( = ?auto_24788 ?auto_24789 ) ) ( not ( = ?auto_24788 ?auto_24790 ) ) ( TRUCK-AT ?auto_24795 ?auto_24794 ) ( not ( = ?auto_24794 ?auto_24793 ) ) ( HOIST-AT ?auto_24792 ?auto_24794 ) ( LIFTING ?auto_24792 ?auto_24790 ) ( not ( = ?auto_24791 ?auto_24792 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24789 ?auto_24790 )
      ( MAKE-2CRATE-VERIFY ?auto_24788 ?auto_24789 ?auto_24790 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24796 - SURFACE
      ?auto_24797 - SURFACE
    )
    :vars
    (
      ?auto_24800 - HOIST
      ?auto_24802 - PLACE
      ?auto_24798 - SURFACE
      ?auto_24801 - TRUCK
      ?auto_24799 - PLACE
      ?auto_24803 - HOIST
      ?auto_24804 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24800 ?auto_24802 ) ( SURFACE-AT ?auto_24796 ?auto_24802 ) ( CLEAR ?auto_24796 ) ( IS-CRATE ?auto_24797 ) ( not ( = ?auto_24796 ?auto_24797 ) ) ( AVAILABLE ?auto_24800 ) ( ON ?auto_24796 ?auto_24798 ) ( not ( = ?auto_24798 ?auto_24796 ) ) ( not ( = ?auto_24798 ?auto_24797 ) ) ( TRUCK-AT ?auto_24801 ?auto_24799 ) ( not ( = ?auto_24799 ?auto_24802 ) ) ( HOIST-AT ?auto_24803 ?auto_24799 ) ( not ( = ?auto_24800 ?auto_24803 ) ) ( AVAILABLE ?auto_24803 ) ( SURFACE-AT ?auto_24797 ?auto_24799 ) ( ON ?auto_24797 ?auto_24804 ) ( CLEAR ?auto_24797 ) ( not ( = ?auto_24796 ?auto_24804 ) ) ( not ( = ?auto_24797 ?auto_24804 ) ) ( not ( = ?auto_24798 ?auto_24804 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24803 ?auto_24797 ?auto_24804 ?auto_24799 )
      ( MAKE-2CRATE ?auto_24798 ?auto_24796 ?auto_24797 )
      ( MAKE-1CRATE-VERIFY ?auto_24796 ?auto_24797 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24805 - SURFACE
      ?auto_24806 - SURFACE
      ?auto_24807 - SURFACE
    )
    :vars
    (
      ?auto_24809 - HOIST
      ?auto_24808 - PLACE
      ?auto_24810 - TRUCK
      ?auto_24812 - PLACE
      ?auto_24813 - HOIST
      ?auto_24811 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24809 ?auto_24808 ) ( SURFACE-AT ?auto_24806 ?auto_24808 ) ( CLEAR ?auto_24806 ) ( IS-CRATE ?auto_24807 ) ( not ( = ?auto_24806 ?auto_24807 ) ) ( AVAILABLE ?auto_24809 ) ( ON ?auto_24806 ?auto_24805 ) ( not ( = ?auto_24805 ?auto_24806 ) ) ( not ( = ?auto_24805 ?auto_24807 ) ) ( TRUCK-AT ?auto_24810 ?auto_24812 ) ( not ( = ?auto_24812 ?auto_24808 ) ) ( HOIST-AT ?auto_24813 ?auto_24812 ) ( not ( = ?auto_24809 ?auto_24813 ) ) ( AVAILABLE ?auto_24813 ) ( SURFACE-AT ?auto_24807 ?auto_24812 ) ( ON ?auto_24807 ?auto_24811 ) ( CLEAR ?auto_24807 ) ( not ( = ?auto_24806 ?auto_24811 ) ) ( not ( = ?auto_24807 ?auto_24811 ) ) ( not ( = ?auto_24805 ?auto_24811 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24806 ?auto_24807 )
      ( MAKE-2CRATE-VERIFY ?auto_24805 ?auto_24806 ?auto_24807 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24814 - SURFACE
      ?auto_24815 - SURFACE
    )
    :vars
    (
      ?auto_24817 - HOIST
      ?auto_24820 - PLACE
      ?auto_24818 - SURFACE
      ?auto_24816 - PLACE
      ?auto_24819 - HOIST
      ?auto_24822 - SURFACE
      ?auto_24821 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24817 ?auto_24820 ) ( SURFACE-AT ?auto_24814 ?auto_24820 ) ( CLEAR ?auto_24814 ) ( IS-CRATE ?auto_24815 ) ( not ( = ?auto_24814 ?auto_24815 ) ) ( AVAILABLE ?auto_24817 ) ( ON ?auto_24814 ?auto_24818 ) ( not ( = ?auto_24818 ?auto_24814 ) ) ( not ( = ?auto_24818 ?auto_24815 ) ) ( not ( = ?auto_24816 ?auto_24820 ) ) ( HOIST-AT ?auto_24819 ?auto_24816 ) ( not ( = ?auto_24817 ?auto_24819 ) ) ( AVAILABLE ?auto_24819 ) ( SURFACE-AT ?auto_24815 ?auto_24816 ) ( ON ?auto_24815 ?auto_24822 ) ( CLEAR ?auto_24815 ) ( not ( = ?auto_24814 ?auto_24822 ) ) ( not ( = ?auto_24815 ?auto_24822 ) ) ( not ( = ?auto_24818 ?auto_24822 ) ) ( TRUCK-AT ?auto_24821 ?auto_24820 ) )
    :subtasks
    ( ( !DRIVE ?auto_24821 ?auto_24820 ?auto_24816 )
      ( MAKE-2CRATE ?auto_24818 ?auto_24814 ?auto_24815 )
      ( MAKE-1CRATE-VERIFY ?auto_24814 ?auto_24815 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24823 - SURFACE
      ?auto_24824 - SURFACE
      ?auto_24825 - SURFACE
    )
    :vars
    (
      ?auto_24826 - HOIST
      ?auto_24829 - PLACE
      ?auto_24827 - PLACE
      ?auto_24828 - HOIST
      ?auto_24831 - SURFACE
      ?auto_24830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24826 ?auto_24829 ) ( SURFACE-AT ?auto_24824 ?auto_24829 ) ( CLEAR ?auto_24824 ) ( IS-CRATE ?auto_24825 ) ( not ( = ?auto_24824 ?auto_24825 ) ) ( AVAILABLE ?auto_24826 ) ( ON ?auto_24824 ?auto_24823 ) ( not ( = ?auto_24823 ?auto_24824 ) ) ( not ( = ?auto_24823 ?auto_24825 ) ) ( not ( = ?auto_24827 ?auto_24829 ) ) ( HOIST-AT ?auto_24828 ?auto_24827 ) ( not ( = ?auto_24826 ?auto_24828 ) ) ( AVAILABLE ?auto_24828 ) ( SURFACE-AT ?auto_24825 ?auto_24827 ) ( ON ?auto_24825 ?auto_24831 ) ( CLEAR ?auto_24825 ) ( not ( = ?auto_24824 ?auto_24831 ) ) ( not ( = ?auto_24825 ?auto_24831 ) ) ( not ( = ?auto_24823 ?auto_24831 ) ) ( TRUCK-AT ?auto_24830 ?auto_24829 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24824 ?auto_24825 )
      ( MAKE-2CRATE-VERIFY ?auto_24823 ?auto_24824 ?auto_24825 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24832 - SURFACE
      ?auto_24833 - SURFACE
    )
    :vars
    (
      ?auto_24840 - HOIST
      ?auto_24837 - PLACE
      ?auto_24839 - SURFACE
      ?auto_24836 - PLACE
      ?auto_24834 - HOIST
      ?auto_24838 - SURFACE
      ?auto_24835 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24840 ?auto_24837 ) ( IS-CRATE ?auto_24833 ) ( not ( = ?auto_24832 ?auto_24833 ) ) ( not ( = ?auto_24839 ?auto_24832 ) ) ( not ( = ?auto_24839 ?auto_24833 ) ) ( not ( = ?auto_24836 ?auto_24837 ) ) ( HOIST-AT ?auto_24834 ?auto_24836 ) ( not ( = ?auto_24840 ?auto_24834 ) ) ( AVAILABLE ?auto_24834 ) ( SURFACE-AT ?auto_24833 ?auto_24836 ) ( ON ?auto_24833 ?auto_24838 ) ( CLEAR ?auto_24833 ) ( not ( = ?auto_24832 ?auto_24838 ) ) ( not ( = ?auto_24833 ?auto_24838 ) ) ( not ( = ?auto_24839 ?auto_24838 ) ) ( TRUCK-AT ?auto_24835 ?auto_24837 ) ( SURFACE-AT ?auto_24839 ?auto_24837 ) ( CLEAR ?auto_24839 ) ( LIFTING ?auto_24840 ?auto_24832 ) ( IS-CRATE ?auto_24832 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24839 ?auto_24832 )
      ( MAKE-2CRATE ?auto_24839 ?auto_24832 ?auto_24833 )
      ( MAKE-1CRATE-VERIFY ?auto_24832 ?auto_24833 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24841 - SURFACE
      ?auto_24842 - SURFACE
      ?auto_24843 - SURFACE
    )
    :vars
    (
      ?auto_24844 - HOIST
      ?auto_24845 - PLACE
      ?auto_24846 - PLACE
      ?auto_24847 - HOIST
      ?auto_24849 - SURFACE
      ?auto_24848 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24844 ?auto_24845 ) ( IS-CRATE ?auto_24843 ) ( not ( = ?auto_24842 ?auto_24843 ) ) ( not ( = ?auto_24841 ?auto_24842 ) ) ( not ( = ?auto_24841 ?auto_24843 ) ) ( not ( = ?auto_24846 ?auto_24845 ) ) ( HOIST-AT ?auto_24847 ?auto_24846 ) ( not ( = ?auto_24844 ?auto_24847 ) ) ( AVAILABLE ?auto_24847 ) ( SURFACE-AT ?auto_24843 ?auto_24846 ) ( ON ?auto_24843 ?auto_24849 ) ( CLEAR ?auto_24843 ) ( not ( = ?auto_24842 ?auto_24849 ) ) ( not ( = ?auto_24843 ?auto_24849 ) ) ( not ( = ?auto_24841 ?auto_24849 ) ) ( TRUCK-AT ?auto_24848 ?auto_24845 ) ( SURFACE-AT ?auto_24841 ?auto_24845 ) ( CLEAR ?auto_24841 ) ( LIFTING ?auto_24844 ?auto_24842 ) ( IS-CRATE ?auto_24842 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24842 ?auto_24843 )
      ( MAKE-2CRATE-VERIFY ?auto_24841 ?auto_24842 ?auto_24843 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24850 - SURFACE
      ?auto_24851 - SURFACE
    )
    :vars
    (
      ?auto_24856 - HOIST
      ?auto_24854 - PLACE
      ?auto_24858 - SURFACE
      ?auto_24855 - PLACE
      ?auto_24852 - HOIST
      ?auto_24853 - SURFACE
      ?auto_24857 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24856 ?auto_24854 ) ( IS-CRATE ?auto_24851 ) ( not ( = ?auto_24850 ?auto_24851 ) ) ( not ( = ?auto_24858 ?auto_24850 ) ) ( not ( = ?auto_24858 ?auto_24851 ) ) ( not ( = ?auto_24855 ?auto_24854 ) ) ( HOIST-AT ?auto_24852 ?auto_24855 ) ( not ( = ?auto_24856 ?auto_24852 ) ) ( AVAILABLE ?auto_24852 ) ( SURFACE-AT ?auto_24851 ?auto_24855 ) ( ON ?auto_24851 ?auto_24853 ) ( CLEAR ?auto_24851 ) ( not ( = ?auto_24850 ?auto_24853 ) ) ( not ( = ?auto_24851 ?auto_24853 ) ) ( not ( = ?auto_24858 ?auto_24853 ) ) ( TRUCK-AT ?auto_24857 ?auto_24854 ) ( SURFACE-AT ?auto_24858 ?auto_24854 ) ( CLEAR ?auto_24858 ) ( IS-CRATE ?auto_24850 ) ( AVAILABLE ?auto_24856 ) ( IN ?auto_24850 ?auto_24857 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24856 ?auto_24850 ?auto_24857 ?auto_24854 )
      ( MAKE-2CRATE ?auto_24858 ?auto_24850 ?auto_24851 )
      ( MAKE-1CRATE-VERIFY ?auto_24850 ?auto_24851 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24859 - SURFACE
      ?auto_24860 - SURFACE
      ?auto_24861 - SURFACE
    )
    :vars
    (
      ?auto_24865 - HOIST
      ?auto_24864 - PLACE
      ?auto_24862 - PLACE
      ?auto_24867 - HOIST
      ?auto_24866 - SURFACE
      ?auto_24863 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24865 ?auto_24864 ) ( IS-CRATE ?auto_24861 ) ( not ( = ?auto_24860 ?auto_24861 ) ) ( not ( = ?auto_24859 ?auto_24860 ) ) ( not ( = ?auto_24859 ?auto_24861 ) ) ( not ( = ?auto_24862 ?auto_24864 ) ) ( HOIST-AT ?auto_24867 ?auto_24862 ) ( not ( = ?auto_24865 ?auto_24867 ) ) ( AVAILABLE ?auto_24867 ) ( SURFACE-AT ?auto_24861 ?auto_24862 ) ( ON ?auto_24861 ?auto_24866 ) ( CLEAR ?auto_24861 ) ( not ( = ?auto_24860 ?auto_24866 ) ) ( not ( = ?auto_24861 ?auto_24866 ) ) ( not ( = ?auto_24859 ?auto_24866 ) ) ( TRUCK-AT ?auto_24863 ?auto_24864 ) ( SURFACE-AT ?auto_24859 ?auto_24864 ) ( CLEAR ?auto_24859 ) ( IS-CRATE ?auto_24860 ) ( AVAILABLE ?auto_24865 ) ( IN ?auto_24860 ?auto_24863 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24860 ?auto_24861 )
      ( MAKE-2CRATE-VERIFY ?auto_24859 ?auto_24860 ?auto_24861 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24904 - SURFACE
      ?auto_24905 - SURFACE
    )
    :vars
    (
      ?auto_24908 - HOIST
      ?auto_24911 - PLACE
      ?auto_24909 - SURFACE
      ?auto_24907 - PLACE
      ?auto_24910 - HOIST
      ?auto_24912 - SURFACE
      ?auto_24906 - TRUCK
      ?auto_24913 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24908 ?auto_24911 ) ( SURFACE-AT ?auto_24904 ?auto_24911 ) ( CLEAR ?auto_24904 ) ( IS-CRATE ?auto_24905 ) ( not ( = ?auto_24904 ?auto_24905 ) ) ( AVAILABLE ?auto_24908 ) ( ON ?auto_24904 ?auto_24909 ) ( not ( = ?auto_24909 ?auto_24904 ) ) ( not ( = ?auto_24909 ?auto_24905 ) ) ( not ( = ?auto_24907 ?auto_24911 ) ) ( HOIST-AT ?auto_24910 ?auto_24907 ) ( not ( = ?auto_24908 ?auto_24910 ) ) ( AVAILABLE ?auto_24910 ) ( SURFACE-AT ?auto_24905 ?auto_24907 ) ( ON ?auto_24905 ?auto_24912 ) ( CLEAR ?auto_24905 ) ( not ( = ?auto_24904 ?auto_24912 ) ) ( not ( = ?auto_24905 ?auto_24912 ) ) ( not ( = ?auto_24909 ?auto_24912 ) ) ( TRUCK-AT ?auto_24906 ?auto_24913 ) ( not ( = ?auto_24913 ?auto_24911 ) ) ( not ( = ?auto_24907 ?auto_24913 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24906 ?auto_24913 ?auto_24911 )
      ( MAKE-1CRATE ?auto_24904 ?auto_24905 )
      ( MAKE-1CRATE-VERIFY ?auto_24904 ?auto_24905 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24943 - SURFACE
      ?auto_24944 - SURFACE
      ?auto_24945 - SURFACE
      ?auto_24946 - SURFACE
    )
    :vars
    (
      ?auto_24947 - HOIST
      ?auto_24948 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24947 ?auto_24948 ) ( SURFACE-AT ?auto_24945 ?auto_24948 ) ( CLEAR ?auto_24945 ) ( LIFTING ?auto_24947 ?auto_24946 ) ( IS-CRATE ?auto_24946 ) ( not ( = ?auto_24945 ?auto_24946 ) ) ( ON ?auto_24944 ?auto_24943 ) ( ON ?auto_24945 ?auto_24944 ) ( not ( = ?auto_24943 ?auto_24944 ) ) ( not ( = ?auto_24943 ?auto_24945 ) ) ( not ( = ?auto_24943 ?auto_24946 ) ) ( not ( = ?auto_24944 ?auto_24945 ) ) ( not ( = ?auto_24944 ?auto_24946 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24945 ?auto_24946 )
      ( MAKE-3CRATE-VERIFY ?auto_24943 ?auto_24944 ?auto_24945 ?auto_24946 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24960 - SURFACE
      ?auto_24961 - SURFACE
      ?auto_24962 - SURFACE
      ?auto_24963 - SURFACE
    )
    :vars
    (
      ?auto_24966 - HOIST
      ?auto_24964 - PLACE
      ?auto_24965 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24966 ?auto_24964 ) ( SURFACE-AT ?auto_24962 ?auto_24964 ) ( CLEAR ?auto_24962 ) ( IS-CRATE ?auto_24963 ) ( not ( = ?auto_24962 ?auto_24963 ) ) ( TRUCK-AT ?auto_24965 ?auto_24964 ) ( AVAILABLE ?auto_24966 ) ( IN ?auto_24963 ?auto_24965 ) ( ON ?auto_24962 ?auto_24961 ) ( not ( = ?auto_24961 ?auto_24962 ) ) ( not ( = ?auto_24961 ?auto_24963 ) ) ( ON ?auto_24961 ?auto_24960 ) ( not ( = ?auto_24960 ?auto_24961 ) ) ( not ( = ?auto_24960 ?auto_24962 ) ) ( not ( = ?auto_24960 ?auto_24963 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24961 ?auto_24962 ?auto_24963 )
      ( MAKE-3CRATE-VERIFY ?auto_24960 ?auto_24961 ?auto_24962 ?auto_24963 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24981 - SURFACE
      ?auto_24982 - SURFACE
      ?auto_24983 - SURFACE
      ?auto_24984 - SURFACE
    )
    :vars
    (
      ?auto_24988 - HOIST
      ?auto_24986 - PLACE
      ?auto_24985 - TRUCK
      ?auto_24987 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24988 ?auto_24986 ) ( SURFACE-AT ?auto_24983 ?auto_24986 ) ( CLEAR ?auto_24983 ) ( IS-CRATE ?auto_24984 ) ( not ( = ?auto_24983 ?auto_24984 ) ) ( AVAILABLE ?auto_24988 ) ( IN ?auto_24984 ?auto_24985 ) ( ON ?auto_24983 ?auto_24982 ) ( not ( = ?auto_24982 ?auto_24983 ) ) ( not ( = ?auto_24982 ?auto_24984 ) ) ( TRUCK-AT ?auto_24985 ?auto_24987 ) ( not ( = ?auto_24987 ?auto_24986 ) ) ( ON ?auto_24982 ?auto_24981 ) ( not ( = ?auto_24981 ?auto_24982 ) ) ( not ( = ?auto_24981 ?auto_24983 ) ) ( not ( = ?auto_24981 ?auto_24984 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24982 ?auto_24983 ?auto_24984 )
      ( MAKE-3CRATE-VERIFY ?auto_24981 ?auto_24982 ?auto_24983 ?auto_24984 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25005 - SURFACE
      ?auto_25006 - SURFACE
      ?auto_25007 - SURFACE
      ?auto_25008 - SURFACE
    )
    :vars
    (
      ?auto_25009 - HOIST
      ?auto_25010 - PLACE
      ?auto_25011 - TRUCK
      ?auto_25013 - PLACE
      ?auto_25012 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25009 ?auto_25010 ) ( SURFACE-AT ?auto_25007 ?auto_25010 ) ( CLEAR ?auto_25007 ) ( IS-CRATE ?auto_25008 ) ( not ( = ?auto_25007 ?auto_25008 ) ) ( AVAILABLE ?auto_25009 ) ( ON ?auto_25007 ?auto_25006 ) ( not ( = ?auto_25006 ?auto_25007 ) ) ( not ( = ?auto_25006 ?auto_25008 ) ) ( TRUCK-AT ?auto_25011 ?auto_25013 ) ( not ( = ?auto_25013 ?auto_25010 ) ) ( HOIST-AT ?auto_25012 ?auto_25013 ) ( LIFTING ?auto_25012 ?auto_25008 ) ( not ( = ?auto_25009 ?auto_25012 ) ) ( ON ?auto_25006 ?auto_25005 ) ( not ( = ?auto_25005 ?auto_25006 ) ) ( not ( = ?auto_25005 ?auto_25007 ) ) ( not ( = ?auto_25005 ?auto_25008 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25006 ?auto_25007 ?auto_25008 )
      ( MAKE-3CRATE-VERIFY ?auto_25005 ?auto_25006 ?auto_25007 ?auto_25008 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25032 - SURFACE
      ?auto_25033 - SURFACE
      ?auto_25034 - SURFACE
      ?auto_25035 - SURFACE
    )
    :vars
    (
      ?auto_25039 - HOIST
      ?auto_25036 - PLACE
      ?auto_25038 - TRUCK
      ?auto_25041 - PLACE
      ?auto_25037 - HOIST
      ?auto_25040 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25039 ?auto_25036 ) ( SURFACE-AT ?auto_25034 ?auto_25036 ) ( CLEAR ?auto_25034 ) ( IS-CRATE ?auto_25035 ) ( not ( = ?auto_25034 ?auto_25035 ) ) ( AVAILABLE ?auto_25039 ) ( ON ?auto_25034 ?auto_25033 ) ( not ( = ?auto_25033 ?auto_25034 ) ) ( not ( = ?auto_25033 ?auto_25035 ) ) ( TRUCK-AT ?auto_25038 ?auto_25041 ) ( not ( = ?auto_25041 ?auto_25036 ) ) ( HOIST-AT ?auto_25037 ?auto_25041 ) ( not ( = ?auto_25039 ?auto_25037 ) ) ( AVAILABLE ?auto_25037 ) ( SURFACE-AT ?auto_25035 ?auto_25041 ) ( ON ?auto_25035 ?auto_25040 ) ( CLEAR ?auto_25035 ) ( not ( = ?auto_25034 ?auto_25040 ) ) ( not ( = ?auto_25035 ?auto_25040 ) ) ( not ( = ?auto_25033 ?auto_25040 ) ) ( ON ?auto_25033 ?auto_25032 ) ( not ( = ?auto_25032 ?auto_25033 ) ) ( not ( = ?auto_25032 ?auto_25034 ) ) ( not ( = ?auto_25032 ?auto_25035 ) ) ( not ( = ?auto_25032 ?auto_25040 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25033 ?auto_25034 ?auto_25035 )
      ( MAKE-3CRATE-VERIFY ?auto_25032 ?auto_25033 ?auto_25034 ?auto_25035 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25060 - SURFACE
      ?auto_25061 - SURFACE
      ?auto_25062 - SURFACE
      ?auto_25063 - SURFACE
    )
    :vars
    (
      ?auto_25066 - HOIST
      ?auto_25069 - PLACE
      ?auto_25068 - PLACE
      ?auto_25067 - HOIST
      ?auto_25065 - SURFACE
      ?auto_25064 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25066 ?auto_25069 ) ( SURFACE-AT ?auto_25062 ?auto_25069 ) ( CLEAR ?auto_25062 ) ( IS-CRATE ?auto_25063 ) ( not ( = ?auto_25062 ?auto_25063 ) ) ( AVAILABLE ?auto_25066 ) ( ON ?auto_25062 ?auto_25061 ) ( not ( = ?auto_25061 ?auto_25062 ) ) ( not ( = ?auto_25061 ?auto_25063 ) ) ( not ( = ?auto_25068 ?auto_25069 ) ) ( HOIST-AT ?auto_25067 ?auto_25068 ) ( not ( = ?auto_25066 ?auto_25067 ) ) ( AVAILABLE ?auto_25067 ) ( SURFACE-AT ?auto_25063 ?auto_25068 ) ( ON ?auto_25063 ?auto_25065 ) ( CLEAR ?auto_25063 ) ( not ( = ?auto_25062 ?auto_25065 ) ) ( not ( = ?auto_25063 ?auto_25065 ) ) ( not ( = ?auto_25061 ?auto_25065 ) ) ( TRUCK-AT ?auto_25064 ?auto_25069 ) ( ON ?auto_25061 ?auto_25060 ) ( not ( = ?auto_25060 ?auto_25061 ) ) ( not ( = ?auto_25060 ?auto_25062 ) ) ( not ( = ?auto_25060 ?auto_25063 ) ) ( not ( = ?auto_25060 ?auto_25065 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25061 ?auto_25062 ?auto_25063 )
      ( MAKE-3CRATE-VERIFY ?auto_25060 ?auto_25061 ?auto_25062 ?auto_25063 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25088 - SURFACE
      ?auto_25089 - SURFACE
      ?auto_25090 - SURFACE
      ?auto_25091 - SURFACE
    )
    :vars
    (
      ?auto_25094 - HOIST
      ?auto_25092 - PLACE
      ?auto_25096 - PLACE
      ?auto_25097 - HOIST
      ?auto_25095 - SURFACE
      ?auto_25093 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25094 ?auto_25092 ) ( IS-CRATE ?auto_25091 ) ( not ( = ?auto_25090 ?auto_25091 ) ) ( not ( = ?auto_25089 ?auto_25090 ) ) ( not ( = ?auto_25089 ?auto_25091 ) ) ( not ( = ?auto_25096 ?auto_25092 ) ) ( HOIST-AT ?auto_25097 ?auto_25096 ) ( not ( = ?auto_25094 ?auto_25097 ) ) ( AVAILABLE ?auto_25097 ) ( SURFACE-AT ?auto_25091 ?auto_25096 ) ( ON ?auto_25091 ?auto_25095 ) ( CLEAR ?auto_25091 ) ( not ( = ?auto_25090 ?auto_25095 ) ) ( not ( = ?auto_25091 ?auto_25095 ) ) ( not ( = ?auto_25089 ?auto_25095 ) ) ( TRUCK-AT ?auto_25093 ?auto_25092 ) ( SURFACE-AT ?auto_25089 ?auto_25092 ) ( CLEAR ?auto_25089 ) ( LIFTING ?auto_25094 ?auto_25090 ) ( IS-CRATE ?auto_25090 ) ( ON ?auto_25089 ?auto_25088 ) ( not ( = ?auto_25088 ?auto_25089 ) ) ( not ( = ?auto_25088 ?auto_25090 ) ) ( not ( = ?auto_25088 ?auto_25091 ) ) ( not ( = ?auto_25088 ?auto_25095 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25089 ?auto_25090 ?auto_25091 )
      ( MAKE-3CRATE-VERIFY ?auto_25088 ?auto_25089 ?auto_25090 ?auto_25091 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25116 - SURFACE
      ?auto_25117 - SURFACE
      ?auto_25118 - SURFACE
      ?auto_25119 - SURFACE
    )
    :vars
    (
      ?auto_25122 - HOIST
      ?auto_25123 - PLACE
      ?auto_25120 - PLACE
      ?auto_25121 - HOIST
      ?auto_25125 - SURFACE
      ?auto_25124 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25122 ?auto_25123 ) ( IS-CRATE ?auto_25119 ) ( not ( = ?auto_25118 ?auto_25119 ) ) ( not ( = ?auto_25117 ?auto_25118 ) ) ( not ( = ?auto_25117 ?auto_25119 ) ) ( not ( = ?auto_25120 ?auto_25123 ) ) ( HOIST-AT ?auto_25121 ?auto_25120 ) ( not ( = ?auto_25122 ?auto_25121 ) ) ( AVAILABLE ?auto_25121 ) ( SURFACE-AT ?auto_25119 ?auto_25120 ) ( ON ?auto_25119 ?auto_25125 ) ( CLEAR ?auto_25119 ) ( not ( = ?auto_25118 ?auto_25125 ) ) ( not ( = ?auto_25119 ?auto_25125 ) ) ( not ( = ?auto_25117 ?auto_25125 ) ) ( TRUCK-AT ?auto_25124 ?auto_25123 ) ( SURFACE-AT ?auto_25117 ?auto_25123 ) ( CLEAR ?auto_25117 ) ( IS-CRATE ?auto_25118 ) ( AVAILABLE ?auto_25122 ) ( IN ?auto_25118 ?auto_25124 ) ( ON ?auto_25117 ?auto_25116 ) ( not ( = ?auto_25116 ?auto_25117 ) ) ( not ( = ?auto_25116 ?auto_25118 ) ) ( not ( = ?auto_25116 ?auto_25119 ) ) ( not ( = ?auto_25116 ?auto_25125 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25117 ?auto_25118 ?auto_25119 )
      ( MAKE-3CRATE-VERIFY ?auto_25116 ?auto_25117 ?auto_25118 ?auto_25119 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25407 - SURFACE
      ?auto_25408 - SURFACE
      ?auto_25409 - SURFACE
      ?auto_25411 - SURFACE
      ?auto_25410 - SURFACE
    )
    :vars
    (
      ?auto_25413 - HOIST
      ?auto_25412 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25413 ?auto_25412 ) ( SURFACE-AT ?auto_25411 ?auto_25412 ) ( CLEAR ?auto_25411 ) ( LIFTING ?auto_25413 ?auto_25410 ) ( IS-CRATE ?auto_25410 ) ( not ( = ?auto_25411 ?auto_25410 ) ) ( ON ?auto_25408 ?auto_25407 ) ( ON ?auto_25409 ?auto_25408 ) ( ON ?auto_25411 ?auto_25409 ) ( not ( = ?auto_25407 ?auto_25408 ) ) ( not ( = ?auto_25407 ?auto_25409 ) ) ( not ( = ?auto_25407 ?auto_25411 ) ) ( not ( = ?auto_25407 ?auto_25410 ) ) ( not ( = ?auto_25408 ?auto_25409 ) ) ( not ( = ?auto_25408 ?auto_25411 ) ) ( not ( = ?auto_25408 ?auto_25410 ) ) ( not ( = ?auto_25409 ?auto_25411 ) ) ( not ( = ?auto_25409 ?auto_25410 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25411 ?auto_25410 )
      ( MAKE-4CRATE-VERIFY ?auto_25407 ?auto_25408 ?auto_25409 ?auto_25411 ?auto_25410 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25432 - SURFACE
      ?auto_25433 - SURFACE
      ?auto_25434 - SURFACE
      ?auto_25436 - SURFACE
      ?auto_25435 - SURFACE
    )
    :vars
    (
      ?auto_25439 - HOIST
      ?auto_25437 - PLACE
      ?auto_25438 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25439 ?auto_25437 ) ( SURFACE-AT ?auto_25436 ?auto_25437 ) ( CLEAR ?auto_25436 ) ( IS-CRATE ?auto_25435 ) ( not ( = ?auto_25436 ?auto_25435 ) ) ( TRUCK-AT ?auto_25438 ?auto_25437 ) ( AVAILABLE ?auto_25439 ) ( IN ?auto_25435 ?auto_25438 ) ( ON ?auto_25436 ?auto_25434 ) ( not ( = ?auto_25434 ?auto_25436 ) ) ( not ( = ?auto_25434 ?auto_25435 ) ) ( ON ?auto_25433 ?auto_25432 ) ( ON ?auto_25434 ?auto_25433 ) ( not ( = ?auto_25432 ?auto_25433 ) ) ( not ( = ?auto_25432 ?auto_25434 ) ) ( not ( = ?auto_25432 ?auto_25436 ) ) ( not ( = ?auto_25432 ?auto_25435 ) ) ( not ( = ?auto_25433 ?auto_25434 ) ) ( not ( = ?auto_25433 ?auto_25436 ) ) ( not ( = ?auto_25433 ?auto_25435 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25434 ?auto_25436 ?auto_25435 )
      ( MAKE-4CRATE-VERIFY ?auto_25432 ?auto_25433 ?auto_25434 ?auto_25436 ?auto_25435 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25462 - SURFACE
      ?auto_25463 - SURFACE
      ?auto_25464 - SURFACE
      ?auto_25466 - SURFACE
      ?auto_25465 - SURFACE
    )
    :vars
    (
      ?auto_25470 - HOIST
      ?auto_25469 - PLACE
      ?auto_25467 - TRUCK
      ?auto_25468 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25470 ?auto_25469 ) ( SURFACE-AT ?auto_25466 ?auto_25469 ) ( CLEAR ?auto_25466 ) ( IS-CRATE ?auto_25465 ) ( not ( = ?auto_25466 ?auto_25465 ) ) ( AVAILABLE ?auto_25470 ) ( IN ?auto_25465 ?auto_25467 ) ( ON ?auto_25466 ?auto_25464 ) ( not ( = ?auto_25464 ?auto_25466 ) ) ( not ( = ?auto_25464 ?auto_25465 ) ) ( TRUCK-AT ?auto_25467 ?auto_25468 ) ( not ( = ?auto_25468 ?auto_25469 ) ) ( ON ?auto_25463 ?auto_25462 ) ( ON ?auto_25464 ?auto_25463 ) ( not ( = ?auto_25462 ?auto_25463 ) ) ( not ( = ?auto_25462 ?auto_25464 ) ) ( not ( = ?auto_25462 ?auto_25466 ) ) ( not ( = ?auto_25462 ?auto_25465 ) ) ( not ( = ?auto_25463 ?auto_25464 ) ) ( not ( = ?auto_25463 ?auto_25466 ) ) ( not ( = ?auto_25463 ?auto_25465 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25464 ?auto_25466 ?auto_25465 )
      ( MAKE-4CRATE-VERIFY ?auto_25462 ?auto_25463 ?auto_25464 ?auto_25466 ?auto_25465 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25496 - SURFACE
      ?auto_25497 - SURFACE
      ?auto_25498 - SURFACE
      ?auto_25500 - SURFACE
      ?auto_25499 - SURFACE
    )
    :vars
    (
      ?auto_25501 - HOIST
      ?auto_25505 - PLACE
      ?auto_25503 - TRUCK
      ?auto_25502 - PLACE
      ?auto_25504 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25501 ?auto_25505 ) ( SURFACE-AT ?auto_25500 ?auto_25505 ) ( CLEAR ?auto_25500 ) ( IS-CRATE ?auto_25499 ) ( not ( = ?auto_25500 ?auto_25499 ) ) ( AVAILABLE ?auto_25501 ) ( ON ?auto_25500 ?auto_25498 ) ( not ( = ?auto_25498 ?auto_25500 ) ) ( not ( = ?auto_25498 ?auto_25499 ) ) ( TRUCK-AT ?auto_25503 ?auto_25502 ) ( not ( = ?auto_25502 ?auto_25505 ) ) ( HOIST-AT ?auto_25504 ?auto_25502 ) ( LIFTING ?auto_25504 ?auto_25499 ) ( not ( = ?auto_25501 ?auto_25504 ) ) ( ON ?auto_25497 ?auto_25496 ) ( ON ?auto_25498 ?auto_25497 ) ( not ( = ?auto_25496 ?auto_25497 ) ) ( not ( = ?auto_25496 ?auto_25498 ) ) ( not ( = ?auto_25496 ?auto_25500 ) ) ( not ( = ?auto_25496 ?auto_25499 ) ) ( not ( = ?auto_25497 ?auto_25498 ) ) ( not ( = ?auto_25497 ?auto_25500 ) ) ( not ( = ?auto_25497 ?auto_25499 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25498 ?auto_25500 ?auto_25499 )
      ( MAKE-4CRATE-VERIFY ?auto_25496 ?auto_25497 ?auto_25498 ?auto_25500 ?auto_25499 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25534 - SURFACE
      ?auto_25535 - SURFACE
      ?auto_25536 - SURFACE
      ?auto_25538 - SURFACE
      ?auto_25537 - SURFACE
    )
    :vars
    (
      ?auto_25541 - HOIST
      ?auto_25543 - PLACE
      ?auto_25539 - TRUCK
      ?auto_25540 - PLACE
      ?auto_25542 - HOIST
      ?auto_25544 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25541 ?auto_25543 ) ( SURFACE-AT ?auto_25538 ?auto_25543 ) ( CLEAR ?auto_25538 ) ( IS-CRATE ?auto_25537 ) ( not ( = ?auto_25538 ?auto_25537 ) ) ( AVAILABLE ?auto_25541 ) ( ON ?auto_25538 ?auto_25536 ) ( not ( = ?auto_25536 ?auto_25538 ) ) ( not ( = ?auto_25536 ?auto_25537 ) ) ( TRUCK-AT ?auto_25539 ?auto_25540 ) ( not ( = ?auto_25540 ?auto_25543 ) ) ( HOIST-AT ?auto_25542 ?auto_25540 ) ( not ( = ?auto_25541 ?auto_25542 ) ) ( AVAILABLE ?auto_25542 ) ( SURFACE-AT ?auto_25537 ?auto_25540 ) ( ON ?auto_25537 ?auto_25544 ) ( CLEAR ?auto_25537 ) ( not ( = ?auto_25538 ?auto_25544 ) ) ( not ( = ?auto_25537 ?auto_25544 ) ) ( not ( = ?auto_25536 ?auto_25544 ) ) ( ON ?auto_25535 ?auto_25534 ) ( ON ?auto_25536 ?auto_25535 ) ( not ( = ?auto_25534 ?auto_25535 ) ) ( not ( = ?auto_25534 ?auto_25536 ) ) ( not ( = ?auto_25534 ?auto_25538 ) ) ( not ( = ?auto_25534 ?auto_25537 ) ) ( not ( = ?auto_25534 ?auto_25544 ) ) ( not ( = ?auto_25535 ?auto_25536 ) ) ( not ( = ?auto_25535 ?auto_25538 ) ) ( not ( = ?auto_25535 ?auto_25537 ) ) ( not ( = ?auto_25535 ?auto_25544 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25536 ?auto_25538 ?auto_25537 )
      ( MAKE-4CRATE-VERIFY ?auto_25534 ?auto_25535 ?auto_25536 ?auto_25538 ?auto_25537 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25573 - SURFACE
      ?auto_25574 - SURFACE
      ?auto_25575 - SURFACE
      ?auto_25577 - SURFACE
      ?auto_25576 - SURFACE
    )
    :vars
    (
      ?auto_25583 - HOIST
      ?auto_25581 - PLACE
      ?auto_25580 - PLACE
      ?auto_25578 - HOIST
      ?auto_25579 - SURFACE
      ?auto_25582 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25583 ?auto_25581 ) ( SURFACE-AT ?auto_25577 ?auto_25581 ) ( CLEAR ?auto_25577 ) ( IS-CRATE ?auto_25576 ) ( not ( = ?auto_25577 ?auto_25576 ) ) ( AVAILABLE ?auto_25583 ) ( ON ?auto_25577 ?auto_25575 ) ( not ( = ?auto_25575 ?auto_25577 ) ) ( not ( = ?auto_25575 ?auto_25576 ) ) ( not ( = ?auto_25580 ?auto_25581 ) ) ( HOIST-AT ?auto_25578 ?auto_25580 ) ( not ( = ?auto_25583 ?auto_25578 ) ) ( AVAILABLE ?auto_25578 ) ( SURFACE-AT ?auto_25576 ?auto_25580 ) ( ON ?auto_25576 ?auto_25579 ) ( CLEAR ?auto_25576 ) ( not ( = ?auto_25577 ?auto_25579 ) ) ( not ( = ?auto_25576 ?auto_25579 ) ) ( not ( = ?auto_25575 ?auto_25579 ) ) ( TRUCK-AT ?auto_25582 ?auto_25581 ) ( ON ?auto_25574 ?auto_25573 ) ( ON ?auto_25575 ?auto_25574 ) ( not ( = ?auto_25573 ?auto_25574 ) ) ( not ( = ?auto_25573 ?auto_25575 ) ) ( not ( = ?auto_25573 ?auto_25577 ) ) ( not ( = ?auto_25573 ?auto_25576 ) ) ( not ( = ?auto_25573 ?auto_25579 ) ) ( not ( = ?auto_25574 ?auto_25575 ) ) ( not ( = ?auto_25574 ?auto_25577 ) ) ( not ( = ?auto_25574 ?auto_25576 ) ) ( not ( = ?auto_25574 ?auto_25579 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25575 ?auto_25577 ?auto_25576 )
      ( MAKE-4CRATE-VERIFY ?auto_25573 ?auto_25574 ?auto_25575 ?auto_25577 ?auto_25576 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25612 - SURFACE
      ?auto_25613 - SURFACE
      ?auto_25614 - SURFACE
      ?auto_25616 - SURFACE
      ?auto_25615 - SURFACE
    )
    :vars
    (
      ?auto_25621 - HOIST
      ?auto_25622 - PLACE
      ?auto_25620 - PLACE
      ?auto_25618 - HOIST
      ?auto_25617 - SURFACE
      ?auto_25619 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25621 ?auto_25622 ) ( IS-CRATE ?auto_25615 ) ( not ( = ?auto_25616 ?auto_25615 ) ) ( not ( = ?auto_25614 ?auto_25616 ) ) ( not ( = ?auto_25614 ?auto_25615 ) ) ( not ( = ?auto_25620 ?auto_25622 ) ) ( HOIST-AT ?auto_25618 ?auto_25620 ) ( not ( = ?auto_25621 ?auto_25618 ) ) ( AVAILABLE ?auto_25618 ) ( SURFACE-AT ?auto_25615 ?auto_25620 ) ( ON ?auto_25615 ?auto_25617 ) ( CLEAR ?auto_25615 ) ( not ( = ?auto_25616 ?auto_25617 ) ) ( not ( = ?auto_25615 ?auto_25617 ) ) ( not ( = ?auto_25614 ?auto_25617 ) ) ( TRUCK-AT ?auto_25619 ?auto_25622 ) ( SURFACE-AT ?auto_25614 ?auto_25622 ) ( CLEAR ?auto_25614 ) ( LIFTING ?auto_25621 ?auto_25616 ) ( IS-CRATE ?auto_25616 ) ( ON ?auto_25613 ?auto_25612 ) ( ON ?auto_25614 ?auto_25613 ) ( not ( = ?auto_25612 ?auto_25613 ) ) ( not ( = ?auto_25612 ?auto_25614 ) ) ( not ( = ?auto_25612 ?auto_25616 ) ) ( not ( = ?auto_25612 ?auto_25615 ) ) ( not ( = ?auto_25612 ?auto_25617 ) ) ( not ( = ?auto_25613 ?auto_25614 ) ) ( not ( = ?auto_25613 ?auto_25616 ) ) ( not ( = ?auto_25613 ?auto_25615 ) ) ( not ( = ?auto_25613 ?auto_25617 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25614 ?auto_25616 ?auto_25615 )
      ( MAKE-4CRATE-VERIFY ?auto_25612 ?auto_25613 ?auto_25614 ?auto_25616 ?auto_25615 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25651 - SURFACE
      ?auto_25652 - SURFACE
      ?auto_25653 - SURFACE
      ?auto_25655 - SURFACE
      ?auto_25654 - SURFACE
    )
    :vars
    (
      ?auto_25658 - HOIST
      ?auto_25657 - PLACE
      ?auto_25660 - PLACE
      ?auto_25656 - HOIST
      ?auto_25659 - SURFACE
      ?auto_25661 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25658 ?auto_25657 ) ( IS-CRATE ?auto_25654 ) ( not ( = ?auto_25655 ?auto_25654 ) ) ( not ( = ?auto_25653 ?auto_25655 ) ) ( not ( = ?auto_25653 ?auto_25654 ) ) ( not ( = ?auto_25660 ?auto_25657 ) ) ( HOIST-AT ?auto_25656 ?auto_25660 ) ( not ( = ?auto_25658 ?auto_25656 ) ) ( AVAILABLE ?auto_25656 ) ( SURFACE-AT ?auto_25654 ?auto_25660 ) ( ON ?auto_25654 ?auto_25659 ) ( CLEAR ?auto_25654 ) ( not ( = ?auto_25655 ?auto_25659 ) ) ( not ( = ?auto_25654 ?auto_25659 ) ) ( not ( = ?auto_25653 ?auto_25659 ) ) ( TRUCK-AT ?auto_25661 ?auto_25657 ) ( SURFACE-AT ?auto_25653 ?auto_25657 ) ( CLEAR ?auto_25653 ) ( IS-CRATE ?auto_25655 ) ( AVAILABLE ?auto_25658 ) ( IN ?auto_25655 ?auto_25661 ) ( ON ?auto_25652 ?auto_25651 ) ( ON ?auto_25653 ?auto_25652 ) ( not ( = ?auto_25651 ?auto_25652 ) ) ( not ( = ?auto_25651 ?auto_25653 ) ) ( not ( = ?auto_25651 ?auto_25655 ) ) ( not ( = ?auto_25651 ?auto_25654 ) ) ( not ( = ?auto_25651 ?auto_25659 ) ) ( not ( = ?auto_25652 ?auto_25653 ) ) ( not ( = ?auto_25652 ?auto_25655 ) ) ( not ( = ?auto_25652 ?auto_25654 ) ) ( not ( = ?auto_25652 ?auto_25659 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25653 ?auto_25655 ?auto_25654 )
      ( MAKE-4CRATE-VERIFY ?auto_25651 ?auto_25652 ?auto_25653 ?auto_25655 ?auto_25654 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26311 - SURFACE
      ?auto_26312 - SURFACE
      ?auto_26313 - SURFACE
      ?auto_26315 - SURFACE
      ?auto_26314 - SURFACE
      ?auto_26316 - SURFACE
    )
    :vars
    (
      ?auto_26318 - HOIST
      ?auto_26317 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26318 ?auto_26317 ) ( SURFACE-AT ?auto_26314 ?auto_26317 ) ( CLEAR ?auto_26314 ) ( LIFTING ?auto_26318 ?auto_26316 ) ( IS-CRATE ?auto_26316 ) ( not ( = ?auto_26314 ?auto_26316 ) ) ( ON ?auto_26312 ?auto_26311 ) ( ON ?auto_26313 ?auto_26312 ) ( ON ?auto_26315 ?auto_26313 ) ( ON ?auto_26314 ?auto_26315 ) ( not ( = ?auto_26311 ?auto_26312 ) ) ( not ( = ?auto_26311 ?auto_26313 ) ) ( not ( = ?auto_26311 ?auto_26315 ) ) ( not ( = ?auto_26311 ?auto_26314 ) ) ( not ( = ?auto_26311 ?auto_26316 ) ) ( not ( = ?auto_26312 ?auto_26313 ) ) ( not ( = ?auto_26312 ?auto_26315 ) ) ( not ( = ?auto_26312 ?auto_26314 ) ) ( not ( = ?auto_26312 ?auto_26316 ) ) ( not ( = ?auto_26313 ?auto_26315 ) ) ( not ( = ?auto_26313 ?auto_26314 ) ) ( not ( = ?auto_26313 ?auto_26316 ) ) ( not ( = ?auto_26315 ?auto_26314 ) ) ( not ( = ?auto_26315 ?auto_26316 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26314 ?auto_26316 )
      ( MAKE-5CRATE-VERIFY ?auto_26311 ?auto_26312 ?auto_26313 ?auto_26315 ?auto_26314 ?auto_26316 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26345 - SURFACE
      ?auto_26346 - SURFACE
      ?auto_26347 - SURFACE
      ?auto_26349 - SURFACE
      ?auto_26348 - SURFACE
      ?auto_26350 - SURFACE
    )
    :vars
    (
      ?auto_26352 - HOIST
      ?auto_26353 - PLACE
      ?auto_26351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26352 ?auto_26353 ) ( SURFACE-AT ?auto_26348 ?auto_26353 ) ( CLEAR ?auto_26348 ) ( IS-CRATE ?auto_26350 ) ( not ( = ?auto_26348 ?auto_26350 ) ) ( TRUCK-AT ?auto_26351 ?auto_26353 ) ( AVAILABLE ?auto_26352 ) ( IN ?auto_26350 ?auto_26351 ) ( ON ?auto_26348 ?auto_26349 ) ( not ( = ?auto_26349 ?auto_26348 ) ) ( not ( = ?auto_26349 ?auto_26350 ) ) ( ON ?auto_26346 ?auto_26345 ) ( ON ?auto_26347 ?auto_26346 ) ( ON ?auto_26349 ?auto_26347 ) ( not ( = ?auto_26345 ?auto_26346 ) ) ( not ( = ?auto_26345 ?auto_26347 ) ) ( not ( = ?auto_26345 ?auto_26349 ) ) ( not ( = ?auto_26345 ?auto_26348 ) ) ( not ( = ?auto_26345 ?auto_26350 ) ) ( not ( = ?auto_26346 ?auto_26347 ) ) ( not ( = ?auto_26346 ?auto_26349 ) ) ( not ( = ?auto_26346 ?auto_26348 ) ) ( not ( = ?auto_26346 ?auto_26350 ) ) ( not ( = ?auto_26347 ?auto_26349 ) ) ( not ( = ?auto_26347 ?auto_26348 ) ) ( not ( = ?auto_26347 ?auto_26350 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26349 ?auto_26348 ?auto_26350 )
      ( MAKE-5CRATE-VERIFY ?auto_26345 ?auto_26346 ?auto_26347 ?auto_26349 ?auto_26348 ?auto_26350 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26385 - SURFACE
      ?auto_26386 - SURFACE
      ?auto_26387 - SURFACE
      ?auto_26389 - SURFACE
      ?auto_26388 - SURFACE
      ?auto_26390 - SURFACE
    )
    :vars
    (
      ?auto_26392 - HOIST
      ?auto_26394 - PLACE
      ?auto_26391 - TRUCK
      ?auto_26393 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26392 ?auto_26394 ) ( SURFACE-AT ?auto_26388 ?auto_26394 ) ( CLEAR ?auto_26388 ) ( IS-CRATE ?auto_26390 ) ( not ( = ?auto_26388 ?auto_26390 ) ) ( AVAILABLE ?auto_26392 ) ( IN ?auto_26390 ?auto_26391 ) ( ON ?auto_26388 ?auto_26389 ) ( not ( = ?auto_26389 ?auto_26388 ) ) ( not ( = ?auto_26389 ?auto_26390 ) ) ( TRUCK-AT ?auto_26391 ?auto_26393 ) ( not ( = ?auto_26393 ?auto_26394 ) ) ( ON ?auto_26386 ?auto_26385 ) ( ON ?auto_26387 ?auto_26386 ) ( ON ?auto_26389 ?auto_26387 ) ( not ( = ?auto_26385 ?auto_26386 ) ) ( not ( = ?auto_26385 ?auto_26387 ) ) ( not ( = ?auto_26385 ?auto_26389 ) ) ( not ( = ?auto_26385 ?auto_26388 ) ) ( not ( = ?auto_26385 ?auto_26390 ) ) ( not ( = ?auto_26386 ?auto_26387 ) ) ( not ( = ?auto_26386 ?auto_26389 ) ) ( not ( = ?auto_26386 ?auto_26388 ) ) ( not ( = ?auto_26386 ?auto_26390 ) ) ( not ( = ?auto_26387 ?auto_26389 ) ) ( not ( = ?auto_26387 ?auto_26388 ) ) ( not ( = ?auto_26387 ?auto_26390 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26389 ?auto_26388 ?auto_26390 )
      ( MAKE-5CRATE-VERIFY ?auto_26385 ?auto_26386 ?auto_26387 ?auto_26389 ?auto_26388 ?auto_26390 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26430 - SURFACE
      ?auto_26431 - SURFACE
      ?auto_26432 - SURFACE
      ?auto_26434 - SURFACE
      ?auto_26433 - SURFACE
      ?auto_26435 - SURFACE
    )
    :vars
    (
      ?auto_26438 - HOIST
      ?auto_26439 - PLACE
      ?auto_26437 - TRUCK
      ?auto_26436 - PLACE
      ?auto_26440 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26438 ?auto_26439 ) ( SURFACE-AT ?auto_26433 ?auto_26439 ) ( CLEAR ?auto_26433 ) ( IS-CRATE ?auto_26435 ) ( not ( = ?auto_26433 ?auto_26435 ) ) ( AVAILABLE ?auto_26438 ) ( ON ?auto_26433 ?auto_26434 ) ( not ( = ?auto_26434 ?auto_26433 ) ) ( not ( = ?auto_26434 ?auto_26435 ) ) ( TRUCK-AT ?auto_26437 ?auto_26436 ) ( not ( = ?auto_26436 ?auto_26439 ) ) ( HOIST-AT ?auto_26440 ?auto_26436 ) ( LIFTING ?auto_26440 ?auto_26435 ) ( not ( = ?auto_26438 ?auto_26440 ) ) ( ON ?auto_26431 ?auto_26430 ) ( ON ?auto_26432 ?auto_26431 ) ( ON ?auto_26434 ?auto_26432 ) ( not ( = ?auto_26430 ?auto_26431 ) ) ( not ( = ?auto_26430 ?auto_26432 ) ) ( not ( = ?auto_26430 ?auto_26434 ) ) ( not ( = ?auto_26430 ?auto_26433 ) ) ( not ( = ?auto_26430 ?auto_26435 ) ) ( not ( = ?auto_26431 ?auto_26432 ) ) ( not ( = ?auto_26431 ?auto_26434 ) ) ( not ( = ?auto_26431 ?auto_26433 ) ) ( not ( = ?auto_26431 ?auto_26435 ) ) ( not ( = ?auto_26432 ?auto_26434 ) ) ( not ( = ?auto_26432 ?auto_26433 ) ) ( not ( = ?auto_26432 ?auto_26435 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26434 ?auto_26433 ?auto_26435 )
      ( MAKE-5CRATE-VERIFY ?auto_26430 ?auto_26431 ?auto_26432 ?auto_26434 ?auto_26433 ?auto_26435 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26480 - SURFACE
      ?auto_26481 - SURFACE
      ?auto_26482 - SURFACE
      ?auto_26484 - SURFACE
      ?auto_26483 - SURFACE
      ?auto_26485 - SURFACE
    )
    :vars
    (
      ?auto_26488 - HOIST
      ?auto_26489 - PLACE
      ?auto_26487 - TRUCK
      ?auto_26491 - PLACE
      ?auto_26490 - HOIST
      ?auto_26486 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26488 ?auto_26489 ) ( SURFACE-AT ?auto_26483 ?auto_26489 ) ( CLEAR ?auto_26483 ) ( IS-CRATE ?auto_26485 ) ( not ( = ?auto_26483 ?auto_26485 ) ) ( AVAILABLE ?auto_26488 ) ( ON ?auto_26483 ?auto_26484 ) ( not ( = ?auto_26484 ?auto_26483 ) ) ( not ( = ?auto_26484 ?auto_26485 ) ) ( TRUCK-AT ?auto_26487 ?auto_26491 ) ( not ( = ?auto_26491 ?auto_26489 ) ) ( HOIST-AT ?auto_26490 ?auto_26491 ) ( not ( = ?auto_26488 ?auto_26490 ) ) ( AVAILABLE ?auto_26490 ) ( SURFACE-AT ?auto_26485 ?auto_26491 ) ( ON ?auto_26485 ?auto_26486 ) ( CLEAR ?auto_26485 ) ( not ( = ?auto_26483 ?auto_26486 ) ) ( not ( = ?auto_26485 ?auto_26486 ) ) ( not ( = ?auto_26484 ?auto_26486 ) ) ( ON ?auto_26481 ?auto_26480 ) ( ON ?auto_26482 ?auto_26481 ) ( ON ?auto_26484 ?auto_26482 ) ( not ( = ?auto_26480 ?auto_26481 ) ) ( not ( = ?auto_26480 ?auto_26482 ) ) ( not ( = ?auto_26480 ?auto_26484 ) ) ( not ( = ?auto_26480 ?auto_26483 ) ) ( not ( = ?auto_26480 ?auto_26485 ) ) ( not ( = ?auto_26480 ?auto_26486 ) ) ( not ( = ?auto_26481 ?auto_26482 ) ) ( not ( = ?auto_26481 ?auto_26484 ) ) ( not ( = ?auto_26481 ?auto_26483 ) ) ( not ( = ?auto_26481 ?auto_26485 ) ) ( not ( = ?auto_26481 ?auto_26486 ) ) ( not ( = ?auto_26482 ?auto_26484 ) ) ( not ( = ?auto_26482 ?auto_26483 ) ) ( not ( = ?auto_26482 ?auto_26485 ) ) ( not ( = ?auto_26482 ?auto_26486 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26484 ?auto_26483 ?auto_26485 )
      ( MAKE-5CRATE-VERIFY ?auto_26480 ?auto_26481 ?auto_26482 ?auto_26484 ?auto_26483 ?auto_26485 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26531 - SURFACE
      ?auto_26532 - SURFACE
      ?auto_26533 - SURFACE
      ?auto_26535 - SURFACE
      ?auto_26534 - SURFACE
      ?auto_26536 - SURFACE
    )
    :vars
    (
      ?auto_26538 - HOIST
      ?auto_26540 - PLACE
      ?auto_26541 - PLACE
      ?auto_26539 - HOIST
      ?auto_26542 - SURFACE
      ?auto_26537 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26538 ?auto_26540 ) ( SURFACE-AT ?auto_26534 ?auto_26540 ) ( CLEAR ?auto_26534 ) ( IS-CRATE ?auto_26536 ) ( not ( = ?auto_26534 ?auto_26536 ) ) ( AVAILABLE ?auto_26538 ) ( ON ?auto_26534 ?auto_26535 ) ( not ( = ?auto_26535 ?auto_26534 ) ) ( not ( = ?auto_26535 ?auto_26536 ) ) ( not ( = ?auto_26541 ?auto_26540 ) ) ( HOIST-AT ?auto_26539 ?auto_26541 ) ( not ( = ?auto_26538 ?auto_26539 ) ) ( AVAILABLE ?auto_26539 ) ( SURFACE-AT ?auto_26536 ?auto_26541 ) ( ON ?auto_26536 ?auto_26542 ) ( CLEAR ?auto_26536 ) ( not ( = ?auto_26534 ?auto_26542 ) ) ( not ( = ?auto_26536 ?auto_26542 ) ) ( not ( = ?auto_26535 ?auto_26542 ) ) ( TRUCK-AT ?auto_26537 ?auto_26540 ) ( ON ?auto_26532 ?auto_26531 ) ( ON ?auto_26533 ?auto_26532 ) ( ON ?auto_26535 ?auto_26533 ) ( not ( = ?auto_26531 ?auto_26532 ) ) ( not ( = ?auto_26531 ?auto_26533 ) ) ( not ( = ?auto_26531 ?auto_26535 ) ) ( not ( = ?auto_26531 ?auto_26534 ) ) ( not ( = ?auto_26531 ?auto_26536 ) ) ( not ( = ?auto_26531 ?auto_26542 ) ) ( not ( = ?auto_26532 ?auto_26533 ) ) ( not ( = ?auto_26532 ?auto_26535 ) ) ( not ( = ?auto_26532 ?auto_26534 ) ) ( not ( = ?auto_26532 ?auto_26536 ) ) ( not ( = ?auto_26532 ?auto_26542 ) ) ( not ( = ?auto_26533 ?auto_26535 ) ) ( not ( = ?auto_26533 ?auto_26534 ) ) ( not ( = ?auto_26533 ?auto_26536 ) ) ( not ( = ?auto_26533 ?auto_26542 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26535 ?auto_26534 ?auto_26536 )
      ( MAKE-5CRATE-VERIFY ?auto_26531 ?auto_26532 ?auto_26533 ?auto_26535 ?auto_26534 ?auto_26536 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26582 - SURFACE
      ?auto_26583 - SURFACE
      ?auto_26584 - SURFACE
      ?auto_26586 - SURFACE
      ?auto_26585 - SURFACE
      ?auto_26587 - SURFACE
    )
    :vars
    (
      ?auto_26591 - HOIST
      ?auto_26588 - PLACE
      ?auto_26592 - PLACE
      ?auto_26590 - HOIST
      ?auto_26589 - SURFACE
      ?auto_26593 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26591 ?auto_26588 ) ( IS-CRATE ?auto_26587 ) ( not ( = ?auto_26585 ?auto_26587 ) ) ( not ( = ?auto_26586 ?auto_26585 ) ) ( not ( = ?auto_26586 ?auto_26587 ) ) ( not ( = ?auto_26592 ?auto_26588 ) ) ( HOIST-AT ?auto_26590 ?auto_26592 ) ( not ( = ?auto_26591 ?auto_26590 ) ) ( AVAILABLE ?auto_26590 ) ( SURFACE-AT ?auto_26587 ?auto_26592 ) ( ON ?auto_26587 ?auto_26589 ) ( CLEAR ?auto_26587 ) ( not ( = ?auto_26585 ?auto_26589 ) ) ( not ( = ?auto_26587 ?auto_26589 ) ) ( not ( = ?auto_26586 ?auto_26589 ) ) ( TRUCK-AT ?auto_26593 ?auto_26588 ) ( SURFACE-AT ?auto_26586 ?auto_26588 ) ( CLEAR ?auto_26586 ) ( LIFTING ?auto_26591 ?auto_26585 ) ( IS-CRATE ?auto_26585 ) ( ON ?auto_26583 ?auto_26582 ) ( ON ?auto_26584 ?auto_26583 ) ( ON ?auto_26586 ?auto_26584 ) ( not ( = ?auto_26582 ?auto_26583 ) ) ( not ( = ?auto_26582 ?auto_26584 ) ) ( not ( = ?auto_26582 ?auto_26586 ) ) ( not ( = ?auto_26582 ?auto_26585 ) ) ( not ( = ?auto_26582 ?auto_26587 ) ) ( not ( = ?auto_26582 ?auto_26589 ) ) ( not ( = ?auto_26583 ?auto_26584 ) ) ( not ( = ?auto_26583 ?auto_26586 ) ) ( not ( = ?auto_26583 ?auto_26585 ) ) ( not ( = ?auto_26583 ?auto_26587 ) ) ( not ( = ?auto_26583 ?auto_26589 ) ) ( not ( = ?auto_26584 ?auto_26586 ) ) ( not ( = ?auto_26584 ?auto_26585 ) ) ( not ( = ?auto_26584 ?auto_26587 ) ) ( not ( = ?auto_26584 ?auto_26589 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26586 ?auto_26585 ?auto_26587 )
      ( MAKE-5CRATE-VERIFY ?auto_26582 ?auto_26583 ?auto_26584 ?auto_26586 ?auto_26585 ?auto_26587 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26633 - SURFACE
      ?auto_26634 - SURFACE
      ?auto_26635 - SURFACE
      ?auto_26637 - SURFACE
      ?auto_26636 - SURFACE
      ?auto_26638 - SURFACE
    )
    :vars
    (
      ?auto_26644 - HOIST
      ?auto_26643 - PLACE
      ?auto_26642 - PLACE
      ?auto_26641 - HOIST
      ?auto_26640 - SURFACE
      ?auto_26639 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26644 ?auto_26643 ) ( IS-CRATE ?auto_26638 ) ( not ( = ?auto_26636 ?auto_26638 ) ) ( not ( = ?auto_26637 ?auto_26636 ) ) ( not ( = ?auto_26637 ?auto_26638 ) ) ( not ( = ?auto_26642 ?auto_26643 ) ) ( HOIST-AT ?auto_26641 ?auto_26642 ) ( not ( = ?auto_26644 ?auto_26641 ) ) ( AVAILABLE ?auto_26641 ) ( SURFACE-AT ?auto_26638 ?auto_26642 ) ( ON ?auto_26638 ?auto_26640 ) ( CLEAR ?auto_26638 ) ( not ( = ?auto_26636 ?auto_26640 ) ) ( not ( = ?auto_26638 ?auto_26640 ) ) ( not ( = ?auto_26637 ?auto_26640 ) ) ( TRUCK-AT ?auto_26639 ?auto_26643 ) ( SURFACE-AT ?auto_26637 ?auto_26643 ) ( CLEAR ?auto_26637 ) ( IS-CRATE ?auto_26636 ) ( AVAILABLE ?auto_26644 ) ( IN ?auto_26636 ?auto_26639 ) ( ON ?auto_26634 ?auto_26633 ) ( ON ?auto_26635 ?auto_26634 ) ( ON ?auto_26637 ?auto_26635 ) ( not ( = ?auto_26633 ?auto_26634 ) ) ( not ( = ?auto_26633 ?auto_26635 ) ) ( not ( = ?auto_26633 ?auto_26637 ) ) ( not ( = ?auto_26633 ?auto_26636 ) ) ( not ( = ?auto_26633 ?auto_26638 ) ) ( not ( = ?auto_26633 ?auto_26640 ) ) ( not ( = ?auto_26634 ?auto_26635 ) ) ( not ( = ?auto_26634 ?auto_26637 ) ) ( not ( = ?auto_26634 ?auto_26636 ) ) ( not ( = ?auto_26634 ?auto_26638 ) ) ( not ( = ?auto_26634 ?auto_26640 ) ) ( not ( = ?auto_26635 ?auto_26637 ) ) ( not ( = ?auto_26635 ?auto_26636 ) ) ( not ( = ?auto_26635 ?auto_26638 ) ) ( not ( = ?auto_26635 ?auto_26640 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26637 ?auto_26636 ?auto_26638 )
      ( MAKE-5CRATE-VERIFY ?auto_26633 ?auto_26634 ?auto_26635 ?auto_26637 ?auto_26636 ?auto_26638 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27313 - SURFACE
      ?auto_27314 - SURFACE
    )
    :vars
    (
      ?auto_27318 - HOIST
      ?auto_27317 - PLACE
      ?auto_27315 - SURFACE
      ?auto_27316 - TRUCK
      ?auto_27320 - PLACE
      ?auto_27321 - HOIST
      ?auto_27319 - SURFACE
      ?auto_27322 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27318 ?auto_27317 ) ( SURFACE-AT ?auto_27313 ?auto_27317 ) ( CLEAR ?auto_27313 ) ( IS-CRATE ?auto_27314 ) ( not ( = ?auto_27313 ?auto_27314 ) ) ( AVAILABLE ?auto_27318 ) ( ON ?auto_27313 ?auto_27315 ) ( not ( = ?auto_27315 ?auto_27313 ) ) ( not ( = ?auto_27315 ?auto_27314 ) ) ( TRUCK-AT ?auto_27316 ?auto_27320 ) ( not ( = ?auto_27320 ?auto_27317 ) ) ( HOIST-AT ?auto_27321 ?auto_27320 ) ( not ( = ?auto_27318 ?auto_27321 ) ) ( SURFACE-AT ?auto_27314 ?auto_27320 ) ( ON ?auto_27314 ?auto_27319 ) ( CLEAR ?auto_27314 ) ( not ( = ?auto_27313 ?auto_27319 ) ) ( not ( = ?auto_27314 ?auto_27319 ) ) ( not ( = ?auto_27315 ?auto_27319 ) ) ( LIFTING ?auto_27321 ?auto_27322 ) ( IS-CRATE ?auto_27322 ) ( not ( = ?auto_27313 ?auto_27322 ) ) ( not ( = ?auto_27314 ?auto_27322 ) ) ( not ( = ?auto_27315 ?auto_27322 ) ) ( not ( = ?auto_27319 ?auto_27322 ) ) )
    :subtasks
    ( ( !LOAD ?auto_27321 ?auto_27322 ?auto_27316 ?auto_27320 )
      ( MAKE-1CRATE ?auto_27313 ?auto_27314 )
      ( MAKE-1CRATE-VERIFY ?auto_27313 ?auto_27314 ) )
  )

)

