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
      ?auto_15720 - SURFACE
      ?auto_15721 - SURFACE
    )
    :vars
    (
      ?auto_15722 - HOIST
      ?auto_15723 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15722 ?auto_15723 ) ( SURFACE-AT ?auto_15720 ?auto_15723 ) ( CLEAR ?auto_15720 ) ( LIFTING ?auto_15722 ?auto_15721 ) ( IS-CRATE ?auto_15721 ) ( not ( = ?auto_15720 ?auto_15721 ) ) )
    :subtasks
    ( ( !DROP ?auto_15722 ?auto_15721 ?auto_15720 ?auto_15723 )
      ( MAKE-1CRATE-VERIFY ?auto_15720 ?auto_15721 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15724 - SURFACE
      ?auto_15725 - SURFACE
    )
    :vars
    (
      ?auto_15727 - HOIST
      ?auto_15726 - PLACE
      ?auto_15728 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15727 ?auto_15726 ) ( SURFACE-AT ?auto_15724 ?auto_15726 ) ( CLEAR ?auto_15724 ) ( IS-CRATE ?auto_15725 ) ( not ( = ?auto_15724 ?auto_15725 ) ) ( TRUCK-AT ?auto_15728 ?auto_15726 ) ( AVAILABLE ?auto_15727 ) ( IN ?auto_15725 ?auto_15728 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15727 ?auto_15725 ?auto_15728 ?auto_15726 )
      ( MAKE-1CRATE ?auto_15724 ?auto_15725 )
      ( MAKE-1CRATE-VERIFY ?auto_15724 ?auto_15725 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15729 - SURFACE
      ?auto_15730 - SURFACE
    )
    :vars
    (
      ?auto_15732 - HOIST
      ?auto_15731 - PLACE
      ?auto_15733 - TRUCK
      ?auto_15734 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15732 ?auto_15731 ) ( SURFACE-AT ?auto_15729 ?auto_15731 ) ( CLEAR ?auto_15729 ) ( IS-CRATE ?auto_15730 ) ( not ( = ?auto_15729 ?auto_15730 ) ) ( AVAILABLE ?auto_15732 ) ( IN ?auto_15730 ?auto_15733 ) ( TRUCK-AT ?auto_15733 ?auto_15734 ) ( not ( = ?auto_15734 ?auto_15731 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15733 ?auto_15734 ?auto_15731 )
      ( MAKE-1CRATE ?auto_15729 ?auto_15730 )
      ( MAKE-1CRATE-VERIFY ?auto_15729 ?auto_15730 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15735 - SURFACE
      ?auto_15736 - SURFACE
    )
    :vars
    (
      ?auto_15739 - HOIST
      ?auto_15740 - PLACE
      ?auto_15738 - TRUCK
      ?auto_15737 - PLACE
      ?auto_15741 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15739 ?auto_15740 ) ( SURFACE-AT ?auto_15735 ?auto_15740 ) ( CLEAR ?auto_15735 ) ( IS-CRATE ?auto_15736 ) ( not ( = ?auto_15735 ?auto_15736 ) ) ( AVAILABLE ?auto_15739 ) ( TRUCK-AT ?auto_15738 ?auto_15737 ) ( not ( = ?auto_15737 ?auto_15740 ) ) ( HOIST-AT ?auto_15741 ?auto_15737 ) ( LIFTING ?auto_15741 ?auto_15736 ) ( not ( = ?auto_15739 ?auto_15741 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15741 ?auto_15736 ?auto_15738 ?auto_15737 )
      ( MAKE-1CRATE ?auto_15735 ?auto_15736 )
      ( MAKE-1CRATE-VERIFY ?auto_15735 ?auto_15736 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15742 - SURFACE
      ?auto_15743 - SURFACE
    )
    :vars
    (
      ?auto_15744 - HOIST
      ?auto_15746 - PLACE
      ?auto_15747 - TRUCK
      ?auto_15748 - PLACE
      ?auto_15745 - HOIST
      ?auto_15749 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15744 ?auto_15746 ) ( SURFACE-AT ?auto_15742 ?auto_15746 ) ( CLEAR ?auto_15742 ) ( IS-CRATE ?auto_15743 ) ( not ( = ?auto_15742 ?auto_15743 ) ) ( AVAILABLE ?auto_15744 ) ( TRUCK-AT ?auto_15747 ?auto_15748 ) ( not ( = ?auto_15748 ?auto_15746 ) ) ( HOIST-AT ?auto_15745 ?auto_15748 ) ( not ( = ?auto_15744 ?auto_15745 ) ) ( AVAILABLE ?auto_15745 ) ( SURFACE-AT ?auto_15743 ?auto_15748 ) ( ON ?auto_15743 ?auto_15749 ) ( CLEAR ?auto_15743 ) ( not ( = ?auto_15742 ?auto_15749 ) ) ( not ( = ?auto_15743 ?auto_15749 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15745 ?auto_15743 ?auto_15749 ?auto_15748 )
      ( MAKE-1CRATE ?auto_15742 ?auto_15743 )
      ( MAKE-1CRATE-VERIFY ?auto_15742 ?auto_15743 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15750 - SURFACE
      ?auto_15751 - SURFACE
    )
    :vars
    (
      ?auto_15756 - HOIST
      ?auto_15755 - PLACE
      ?auto_15754 - PLACE
      ?auto_15757 - HOIST
      ?auto_15752 - SURFACE
      ?auto_15753 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15756 ?auto_15755 ) ( SURFACE-AT ?auto_15750 ?auto_15755 ) ( CLEAR ?auto_15750 ) ( IS-CRATE ?auto_15751 ) ( not ( = ?auto_15750 ?auto_15751 ) ) ( AVAILABLE ?auto_15756 ) ( not ( = ?auto_15754 ?auto_15755 ) ) ( HOIST-AT ?auto_15757 ?auto_15754 ) ( not ( = ?auto_15756 ?auto_15757 ) ) ( AVAILABLE ?auto_15757 ) ( SURFACE-AT ?auto_15751 ?auto_15754 ) ( ON ?auto_15751 ?auto_15752 ) ( CLEAR ?auto_15751 ) ( not ( = ?auto_15750 ?auto_15752 ) ) ( not ( = ?auto_15751 ?auto_15752 ) ) ( TRUCK-AT ?auto_15753 ?auto_15755 ) )
    :subtasks
    ( ( !DRIVE ?auto_15753 ?auto_15755 ?auto_15754 )
      ( MAKE-1CRATE ?auto_15750 ?auto_15751 )
      ( MAKE-1CRATE-VERIFY ?auto_15750 ?auto_15751 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15763 - SURFACE
      ?auto_15764 - SURFACE
    )
    :vars
    (
      ?auto_15765 - HOIST
      ?auto_15766 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15765 ?auto_15766 ) ( SURFACE-AT ?auto_15763 ?auto_15766 ) ( CLEAR ?auto_15763 ) ( LIFTING ?auto_15765 ?auto_15764 ) ( IS-CRATE ?auto_15764 ) ( not ( = ?auto_15763 ?auto_15764 ) ) )
    :subtasks
    ( ( !DROP ?auto_15765 ?auto_15764 ?auto_15763 ?auto_15766 )
      ( MAKE-1CRATE-VERIFY ?auto_15763 ?auto_15764 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15767 - SURFACE
      ?auto_15768 - SURFACE
      ?auto_15769 - SURFACE
    )
    :vars
    (
      ?auto_15770 - HOIST
      ?auto_15771 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15770 ?auto_15771 ) ( SURFACE-AT ?auto_15768 ?auto_15771 ) ( CLEAR ?auto_15768 ) ( LIFTING ?auto_15770 ?auto_15769 ) ( IS-CRATE ?auto_15769 ) ( not ( = ?auto_15768 ?auto_15769 ) ) ( ON ?auto_15768 ?auto_15767 ) ( not ( = ?auto_15767 ?auto_15768 ) ) ( not ( = ?auto_15767 ?auto_15769 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15768 ?auto_15769 )
      ( MAKE-2CRATE-VERIFY ?auto_15767 ?auto_15768 ?auto_15769 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15772 - SURFACE
      ?auto_15773 - SURFACE
    )
    :vars
    (
      ?auto_15774 - HOIST
      ?auto_15775 - PLACE
      ?auto_15776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15774 ?auto_15775 ) ( SURFACE-AT ?auto_15772 ?auto_15775 ) ( CLEAR ?auto_15772 ) ( IS-CRATE ?auto_15773 ) ( not ( = ?auto_15772 ?auto_15773 ) ) ( TRUCK-AT ?auto_15776 ?auto_15775 ) ( AVAILABLE ?auto_15774 ) ( IN ?auto_15773 ?auto_15776 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15774 ?auto_15773 ?auto_15776 ?auto_15775 )
      ( MAKE-1CRATE ?auto_15772 ?auto_15773 )
      ( MAKE-1CRATE-VERIFY ?auto_15772 ?auto_15773 ) )
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
      ?auto_15781 - PLACE
      ?auto_15780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15782 ?auto_15781 ) ( SURFACE-AT ?auto_15778 ?auto_15781 ) ( CLEAR ?auto_15778 ) ( IS-CRATE ?auto_15779 ) ( not ( = ?auto_15778 ?auto_15779 ) ) ( TRUCK-AT ?auto_15780 ?auto_15781 ) ( AVAILABLE ?auto_15782 ) ( IN ?auto_15779 ?auto_15780 ) ( ON ?auto_15778 ?auto_15777 ) ( not ( = ?auto_15777 ?auto_15778 ) ) ( not ( = ?auto_15777 ?auto_15779 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15778 ?auto_15779 )
      ( MAKE-2CRATE-VERIFY ?auto_15777 ?auto_15778 ?auto_15779 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15783 - SURFACE
      ?auto_15784 - SURFACE
    )
    :vars
    (
      ?auto_15785 - HOIST
      ?auto_15787 - PLACE
      ?auto_15786 - TRUCK
      ?auto_15788 - SURFACE
      ?auto_15789 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15785 ?auto_15787 ) ( SURFACE-AT ?auto_15783 ?auto_15787 ) ( CLEAR ?auto_15783 ) ( IS-CRATE ?auto_15784 ) ( not ( = ?auto_15783 ?auto_15784 ) ) ( AVAILABLE ?auto_15785 ) ( IN ?auto_15784 ?auto_15786 ) ( ON ?auto_15783 ?auto_15788 ) ( not ( = ?auto_15788 ?auto_15783 ) ) ( not ( = ?auto_15788 ?auto_15784 ) ) ( TRUCK-AT ?auto_15786 ?auto_15789 ) ( not ( = ?auto_15789 ?auto_15787 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15786 ?auto_15789 ?auto_15787 )
      ( MAKE-2CRATE ?auto_15788 ?auto_15783 ?auto_15784 )
      ( MAKE-1CRATE-VERIFY ?auto_15783 ?auto_15784 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15790 - SURFACE
      ?auto_15791 - SURFACE
      ?auto_15792 - SURFACE
    )
    :vars
    (
      ?auto_15795 - HOIST
      ?auto_15793 - PLACE
      ?auto_15794 - TRUCK
      ?auto_15796 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15795 ?auto_15793 ) ( SURFACE-AT ?auto_15791 ?auto_15793 ) ( CLEAR ?auto_15791 ) ( IS-CRATE ?auto_15792 ) ( not ( = ?auto_15791 ?auto_15792 ) ) ( AVAILABLE ?auto_15795 ) ( IN ?auto_15792 ?auto_15794 ) ( ON ?auto_15791 ?auto_15790 ) ( not ( = ?auto_15790 ?auto_15791 ) ) ( not ( = ?auto_15790 ?auto_15792 ) ) ( TRUCK-AT ?auto_15794 ?auto_15796 ) ( not ( = ?auto_15796 ?auto_15793 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15791 ?auto_15792 )
      ( MAKE-2CRATE-VERIFY ?auto_15790 ?auto_15791 ?auto_15792 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15797 - SURFACE
      ?auto_15798 - SURFACE
    )
    :vars
    (
      ?auto_15801 - HOIST
      ?auto_15803 - PLACE
      ?auto_15799 - SURFACE
      ?auto_15802 - TRUCK
      ?auto_15800 - PLACE
      ?auto_15804 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15801 ?auto_15803 ) ( SURFACE-AT ?auto_15797 ?auto_15803 ) ( CLEAR ?auto_15797 ) ( IS-CRATE ?auto_15798 ) ( not ( = ?auto_15797 ?auto_15798 ) ) ( AVAILABLE ?auto_15801 ) ( ON ?auto_15797 ?auto_15799 ) ( not ( = ?auto_15799 ?auto_15797 ) ) ( not ( = ?auto_15799 ?auto_15798 ) ) ( TRUCK-AT ?auto_15802 ?auto_15800 ) ( not ( = ?auto_15800 ?auto_15803 ) ) ( HOIST-AT ?auto_15804 ?auto_15800 ) ( LIFTING ?auto_15804 ?auto_15798 ) ( not ( = ?auto_15801 ?auto_15804 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15804 ?auto_15798 ?auto_15802 ?auto_15800 )
      ( MAKE-2CRATE ?auto_15799 ?auto_15797 ?auto_15798 )
      ( MAKE-1CRATE-VERIFY ?auto_15797 ?auto_15798 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15805 - SURFACE
      ?auto_15806 - SURFACE
      ?auto_15807 - SURFACE
    )
    :vars
    (
      ?auto_15811 - HOIST
      ?auto_15812 - PLACE
      ?auto_15809 - TRUCK
      ?auto_15808 - PLACE
      ?auto_15810 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15811 ?auto_15812 ) ( SURFACE-AT ?auto_15806 ?auto_15812 ) ( CLEAR ?auto_15806 ) ( IS-CRATE ?auto_15807 ) ( not ( = ?auto_15806 ?auto_15807 ) ) ( AVAILABLE ?auto_15811 ) ( ON ?auto_15806 ?auto_15805 ) ( not ( = ?auto_15805 ?auto_15806 ) ) ( not ( = ?auto_15805 ?auto_15807 ) ) ( TRUCK-AT ?auto_15809 ?auto_15808 ) ( not ( = ?auto_15808 ?auto_15812 ) ) ( HOIST-AT ?auto_15810 ?auto_15808 ) ( LIFTING ?auto_15810 ?auto_15807 ) ( not ( = ?auto_15811 ?auto_15810 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15806 ?auto_15807 )
      ( MAKE-2CRATE-VERIFY ?auto_15805 ?auto_15806 ?auto_15807 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15813 - SURFACE
      ?auto_15814 - SURFACE
    )
    :vars
    (
      ?auto_15817 - HOIST
      ?auto_15820 - PLACE
      ?auto_15819 - SURFACE
      ?auto_15816 - TRUCK
      ?auto_15818 - PLACE
      ?auto_15815 - HOIST
      ?auto_15821 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15817 ?auto_15820 ) ( SURFACE-AT ?auto_15813 ?auto_15820 ) ( CLEAR ?auto_15813 ) ( IS-CRATE ?auto_15814 ) ( not ( = ?auto_15813 ?auto_15814 ) ) ( AVAILABLE ?auto_15817 ) ( ON ?auto_15813 ?auto_15819 ) ( not ( = ?auto_15819 ?auto_15813 ) ) ( not ( = ?auto_15819 ?auto_15814 ) ) ( TRUCK-AT ?auto_15816 ?auto_15818 ) ( not ( = ?auto_15818 ?auto_15820 ) ) ( HOIST-AT ?auto_15815 ?auto_15818 ) ( not ( = ?auto_15817 ?auto_15815 ) ) ( AVAILABLE ?auto_15815 ) ( SURFACE-AT ?auto_15814 ?auto_15818 ) ( ON ?auto_15814 ?auto_15821 ) ( CLEAR ?auto_15814 ) ( not ( = ?auto_15813 ?auto_15821 ) ) ( not ( = ?auto_15814 ?auto_15821 ) ) ( not ( = ?auto_15819 ?auto_15821 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15815 ?auto_15814 ?auto_15821 ?auto_15818 )
      ( MAKE-2CRATE ?auto_15819 ?auto_15813 ?auto_15814 )
      ( MAKE-1CRATE-VERIFY ?auto_15813 ?auto_15814 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15822 - SURFACE
      ?auto_15823 - SURFACE
      ?auto_15824 - SURFACE
    )
    :vars
    (
      ?auto_15826 - HOIST
      ?auto_15829 - PLACE
      ?auto_15828 - TRUCK
      ?auto_15830 - PLACE
      ?auto_15827 - HOIST
      ?auto_15825 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15826 ?auto_15829 ) ( SURFACE-AT ?auto_15823 ?auto_15829 ) ( CLEAR ?auto_15823 ) ( IS-CRATE ?auto_15824 ) ( not ( = ?auto_15823 ?auto_15824 ) ) ( AVAILABLE ?auto_15826 ) ( ON ?auto_15823 ?auto_15822 ) ( not ( = ?auto_15822 ?auto_15823 ) ) ( not ( = ?auto_15822 ?auto_15824 ) ) ( TRUCK-AT ?auto_15828 ?auto_15830 ) ( not ( = ?auto_15830 ?auto_15829 ) ) ( HOIST-AT ?auto_15827 ?auto_15830 ) ( not ( = ?auto_15826 ?auto_15827 ) ) ( AVAILABLE ?auto_15827 ) ( SURFACE-AT ?auto_15824 ?auto_15830 ) ( ON ?auto_15824 ?auto_15825 ) ( CLEAR ?auto_15824 ) ( not ( = ?auto_15823 ?auto_15825 ) ) ( not ( = ?auto_15824 ?auto_15825 ) ) ( not ( = ?auto_15822 ?auto_15825 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15823 ?auto_15824 )
      ( MAKE-2CRATE-VERIFY ?auto_15822 ?auto_15823 ?auto_15824 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15831 - SURFACE
      ?auto_15832 - SURFACE
    )
    :vars
    (
      ?auto_15839 - HOIST
      ?auto_15833 - PLACE
      ?auto_15838 - SURFACE
      ?auto_15835 - PLACE
      ?auto_15836 - HOIST
      ?auto_15837 - SURFACE
      ?auto_15834 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15839 ?auto_15833 ) ( SURFACE-AT ?auto_15831 ?auto_15833 ) ( CLEAR ?auto_15831 ) ( IS-CRATE ?auto_15832 ) ( not ( = ?auto_15831 ?auto_15832 ) ) ( AVAILABLE ?auto_15839 ) ( ON ?auto_15831 ?auto_15838 ) ( not ( = ?auto_15838 ?auto_15831 ) ) ( not ( = ?auto_15838 ?auto_15832 ) ) ( not ( = ?auto_15835 ?auto_15833 ) ) ( HOIST-AT ?auto_15836 ?auto_15835 ) ( not ( = ?auto_15839 ?auto_15836 ) ) ( AVAILABLE ?auto_15836 ) ( SURFACE-AT ?auto_15832 ?auto_15835 ) ( ON ?auto_15832 ?auto_15837 ) ( CLEAR ?auto_15832 ) ( not ( = ?auto_15831 ?auto_15837 ) ) ( not ( = ?auto_15832 ?auto_15837 ) ) ( not ( = ?auto_15838 ?auto_15837 ) ) ( TRUCK-AT ?auto_15834 ?auto_15833 ) )
    :subtasks
    ( ( !DRIVE ?auto_15834 ?auto_15833 ?auto_15835 )
      ( MAKE-2CRATE ?auto_15838 ?auto_15831 ?auto_15832 )
      ( MAKE-1CRATE-VERIFY ?auto_15831 ?auto_15832 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15840 - SURFACE
      ?auto_15841 - SURFACE
      ?auto_15842 - SURFACE
    )
    :vars
    (
      ?auto_15848 - HOIST
      ?auto_15845 - PLACE
      ?auto_15844 - PLACE
      ?auto_15843 - HOIST
      ?auto_15847 - SURFACE
      ?auto_15846 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15848 ?auto_15845 ) ( SURFACE-AT ?auto_15841 ?auto_15845 ) ( CLEAR ?auto_15841 ) ( IS-CRATE ?auto_15842 ) ( not ( = ?auto_15841 ?auto_15842 ) ) ( AVAILABLE ?auto_15848 ) ( ON ?auto_15841 ?auto_15840 ) ( not ( = ?auto_15840 ?auto_15841 ) ) ( not ( = ?auto_15840 ?auto_15842 ) ) ( not ( = ?auto_15844 ?auto_15845 ) ) ( HOIST-AT ?auto_15843 ?auto_15844 ) ( not ( = ?auto_15848 ?auto_15843 ) ) ( AVAILABLE ?auto_15843 ) ( SURFACE-AT ?auto_15842 ?auto_15844 ) ( ON ?auto_15842 ?auto_15847 ) ( CLEAR ?auto_15842 ) ( not ( = ?auto_15841 ?auto_15847 ) ) ( not ( = ?auto_15842 ?auto_15847 ) ) ( not ( = ?auto_15840 ?auto_15847 ) ) ( TRUCK-AT ?auto_15846 ?auto_15845 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15841 ?auto_15842 )
      ( MAKE-2CRATE-VERIFY ?auto_15840 ?auto_15841 ?auto_15842 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15849 - SURFACE
      ?auto_15850 - SURFACE
    )
    :vars
    (
      ?auto_15855 - HOIST
      ?auto_15851 - PLACE
      ?auto_15853 - SURFACE
      ?auto_15854 - PLACE
      ?auto_15856 - HOIST
      ?auto_15857 - SURFACE
      ?auto_15852 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15855 ?auto_15851 ) ( IS-CRATE ?auto_15850 ) ( not ( = ?auto_15849 ?auto_15850 ) ) ( not ( = ?auto_15853 ?auto_15849 ) ) ( not ( = ?auto_15853 ?auto_15850 ) ) ( not ( = ?auto_15854 ?auto_15851 ) ) ( HOIST-AT ?auto_15856 ?auto_15854 ) ( not ( = ?auto_15855 ?auto_15856 ) ) ( AVAILABLE ?auto_15856 ) ( SURFACE-AT ?auto_15850 ?auto_15854 ) ( ON ?auto_15850 ?auto_15857 ) ( CLEAR ?auto_15850 ) ( not ( = ?auto_15849 ?auto_15857 ) ) ( not ( = ?auto_15850 ?auto_15857 ) ) ( not ( = ?auto_15853 ?auto_15857 ) ) ( TRUCK-AT ?auto_15852 ?auto_15851 ) ( SURFACE-AT ?auto_15853 ?auto_15851 ) ( CLEAR ?auto_15853 ) ( LIFTING ?auto_15855 ?auto_15849 ) ( IS-CRATE ?auto_15849 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15853 ?auto_15849 )
      ( MAKE-2CRATE ?auto_15853 ?auto_15849 ?auto_15850 )
      ( MAKE-1CRATE-VERIFY ?auto_15849 ?auto_15850 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15858 - SURFACE
      ?auto_15859 - SURFACE
      ?auto_15860 - SURFACE
    )
    :vars
    (
      ?auto_15861 - HOIST
      ?auto_15862 - PLACE
      ?auto_15866 - PLACE
      ?auto_15865 - HOIST
      ?auto_15863 - SURFACE
      ?auto_15864 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15861 ?auto_15862 ) ( IS-CRATE ?auto_15860 ) ( not ( = ?auto_15859 ?auto_15860 ) ) ( not ( = ?auto_15858 ?auto_15859 ) ) ( not ( = ?auto_15858 ?auto_15860 ) ) ( not ( = ?auto_15866 ?auto_15862 ) ) ( HOIST-AT ?auto_15865 ?auto_15866 ) ( not ( = ?auto_15861 ?auto_15865 ) ) ( AVAILABLE ?auto_15865 ) ( SURFACE-AT ?auto_15860 ?auto_15866 ) ( ON ?auto_15860 ?auto_15863 ) ( CLEAR ?auto_15860 ) ( not ( = ?auto_15859 ?auto_15863 ) ) ( not ( = ?auto_15860 ?auto_15863 ) ) ( not ( = ?auto_15858 ?auto_15863 ) ) ( TRUCK-AT ?auto_15864 ?auto_15862 ) ( SURFACE-AT ?auto_15858 ?auto_15862 ) ( CLEAR ?auto_15858 ) ( LIFTING ?auto_15861 ?auto_15859 ) ( IS-CRATE ?auto_15859 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15859 ?auto_15860 )
      ( MAKE-2CRATE-VERIFY ?auto_15858 ?auto_15859 ?auto_15860 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15867 - SURFACE
      ?auto_15868 - SURFACE
    )
    :vars
    (
      ?auto_15873 - HOIST
      ?auto_15875 - PLACE
      ?auto_15870 - SURFACE
      ?auto_15872 - PLACE
      ?auto_15871 - HOIST
      ?auto_15869 - SURFACE
      ?auto_15874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15873 ?auto_15875 ) ( IS-CRATE ?auto_15868 ) ( not ( = ?auto_15867 ?auto_15868 ) ) ( not ( = ?auto_15870 ?auto_15867 ) ) ( not ( = ?auto_15870 ?auto_15868 ) ) ( not ( = ?auto_15872 ?auto_15875 ) ) ( HOIST-AT ?auto_15871 ?auto_15872 ) ( not ( = ?auto_15873 ?auto_15871 ) ) ( AVAILABLE ?auto_15871 ) ( SURFACE-AT ?auto_15868 ?auto_15872 ) ( ON ?auto_15868 ?auto_15869 ) ( CLEAR ?auto_15868 ) ( not ( = ?auto_15867 ?auto_15869 ) ) ( not ( = ?auto_15868 ?auto_15869 ) ) ( not ( = ?auto_15870 ?auto_15869 ) ) ( TRUCK-AT ?auto_15874 ?auto_15875 ) ( SURFACE-AT ?auto_15870 ?auto_15875 ) ( CLEAR ?auto_15870 ) ( IS-CRATE ?auto_15867 ) ( AVAILABLE ?auto_15873 ) ( IN ?auto_15867 ?auto_15874 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15873 ?auto_15867 ?auto_15874 ?auto_15875 )
      ( MAKE-2CRATE ?auto_15870 ?auto_15867 ?auto_15868 )
      ( MAKE-1CRATE-VERIFY ?auto_15867 ?auto_15868 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15876 - SURFACE
      ?auto_15877 - SURFACE
      ?auto_15878 - SURFACE
    )
    :vars
    (
      ?auto_15881 - HOIST
      ?auto_15883 - PLACE
      ?auto_15884 - PLACE
      ?auto_15880 - HOIST
      ?auto_15882 - SURFACE
      ?auto_15879 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15881 ?auto_15883 ) ( IS-CRATE ?auto_15878 ) ( not ( = ?auto_15877 ?auto_15878 ) ) ( not ( = ?auto_15876 ?auto_15877 ) ) ( not ( = ?auto_15876 ?auto_15878 ) ) ( not ( = ?auto_15884 ?auto_15883 ) ) ( HOIST-AT ?auto_15880 ?auto_15884 ) ( not ( = ?auto_15881 ?auto_15880 ) ) ( AVAILABLE ?auto_15880 ) ( SURFACE-AT ?auto_15878 ?auto_15884 ) ( ON ?auto_15878 ?auto_15882 ) ( CLEAR ?auto_15878 ) ( not ( = ?auto_15877 ?auto_15882 ) ) ( not ( = ?auto_15878 ?auto_15882 ) ) ( not ( = ?auto_15876 ?auto_15882 ) ) ( TRUCK-AT ?auto_15879 ?auto_15883 ) ( SURFACE-AT ?auto_15876 ?auto_15883 ) ( CLEAR ?auto_15876 ) ( IS-CRATE ?auto_15877 ) ( AVAILABLE ?auto_15881 ) ( IN ?auto_15877 ?auto_15879 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15877 ?auto_15878 )
      ( MAKE-2CRATE-VERIFY ?auto_15876 ?auto_15877 ?auto_15878 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15885 - SURFACE
      ?auto_15886 - SURFACE
    )
    :vars
    (
      ?auto_15887 - HOIST
      ?auto_15890 - PLACE
      ?auto_15888 - SURFACE
      ?auto_15893 - PLACE
      ?auto_15889 - HOIST
      ?auto_15892 - SURFACE
      ?auto_15891 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15887 ?auto_15890 ) ( IS-CRATE ?auto_15886 ) ( not ( = ?auto_15885 ?auto_15886 ) ) ( not ( = ?auto_15888 ?auto_15885 ) ) ( not ( = ?auto_15888 ?auto_15886 ) ) ( not ( = ?auto_15893 ?auto_15890 ) ) ( HOIST-AT ?auto_15889 ?auto_15893 ) ( not ( = ?auto_15887 ?auto_15889 ) ) ( AVAILABLE ?auto_15889 ) ( SURFACE-AT ?auto_15886 ?auto_15893 ) ( ON ?auto_15886 ?auto_15892 ) ( CLEAR ?auto_15886 ) ( not ( = ?auto_15885 ?auto_15892 ) ) ( not ( = ?auto_15886 ?auto_15892 ) ) ( not ( = ?auto_15888 ?auto_15892 ) ) ( SURFACE-AT ?auto_15888 ?auto_15890 ) ( CLEAR ?auto_15888 ) ( IS-CRATE ?auto_15885 ) ( AVAILABLE ?auto_15887 ) ( IN ?auto_15885 ?auto_15891 ) ( TRUCK-AT ?auto_15891 ?auto_15893 ) )
    :subtasks
    ( ( !DRIVE ?auto_15891 ?auto_15893 ?auto_15890 )
      ( MAKE-2CRATE ?auto_15888 ?auto_15885 ?auto_15886 )
      ( MAKE-1CRATE-VERIFY ?auto_15885 ?auto_15886 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15894 - SURFACE
      ?auto_15895 - SURFACE
      ?auto_15896 - SURFACE
    )
    :vars
    (
      ?auto_15900 - HOIST
      ?auto_15902 - PLACE
      ?auto_15897 - PLACE
      ?auto_15901 - HOIST
      ?auto_15898 - SURFACE
      ?auto_15899 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15900 ?auto_15902 ) ( IS-CRATE ?auto_15896 ) ( not ( = ?auto_15895 ?auto_15896 ) ) ( not ( = ?auto_15894 ?auto_15895 ) ) ( not ( = ?auto_15894 ?auto_15896 ) ) ( not ( = ?auto_15897 ?auto_15902 ) ) ( HOIST-AT ?auto_15901 ?auto_15897 ) ( not ( = ?auto_15900 ?auto_15901 ) ) ( AVAILABLE ?auto_15901 ) ( SURFACE-AT ?auto_15896 ?auto_15897 ) ( ON ?auto_15896 ?auto_15898 ) ( CLEAR ?auto_15896 ) ( not ( = ?auto_15895 ?auto_15898 ) ) ( not ( = ?auto_15896 ?auto_15898 ) ) ( not ( = ?auto_15894 ?auto_15898 ) ) ( SURFACE-AT ?auto_15894 ?auto_15902 ) ( CLEAR ?auto_15894 ) ( IS-CRATE ?auto_15895 ) ( AVAILABLE ?auto_15900 ) ( IN ?auto_15895 ?auto_15899 ) ( TRUCK-AT ?auto_15899 ?auto_15897 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15895 ?auto_15896 )
      ( MAKE-2CRATE-VERIFY ?auto_15894 ?auto_15895 ?auto_15896 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15903 - SURFACE
      ?auto_15904 - SURFACE
    )
    :vars
    (
      ?auto_15905 - HOIST
      ?auto_15906 - PLACE
      ?auto_15908 - SURFACE
      ?auto_15911 - PLACE
      ?auto_15909 - HOIST
      ?auto_15907 - SURFACE
      ?auto_15910 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15905 ?auto_15906 ) ( IS-CRATE ?auto_15904 ) ( not ( = ?auto_15903 ?auto_15904 ) ) ( not ( = ?auto_15908 ?auto_15903 ) ) ( not ( = ?auto_15908 ?auto_15904 ) ) ( not ( = ?auto_15911 ?auto_15906 ) ) ( HOIST-AT ?auto_15909 ?auto_15911 ) ( not ( = ?auto_15905 ?auto_15909 ) ) ( SURFACE-AT ?auto_15904 ?auto_15911 ) ( ON ?auto_15904 ?auto_15907 ) ( CLEAR ?auto_15904 ) ( not ( = ?auto_15903 ?auto_15907 ) ) ( not ( = ?auto_15904 ?auto_15907 ) ) ( not ( = ?auto_15908 ?auto_15907 ) ) ( SURFACE-AT ?auto_15908 ?auto_15906 ) ( CLEAR ?auto_15908 ) ( IS-CRATE ?auto_15903 ) ( AVAILABLE ?auto_15905 ) ( TRUCK-AT ?auto_15910 ?auto_15911 ) ( LIFTING ?auto_15909 ?auto_15903 ) )
    :subtasks
    ( ( !LOAD ?auto_15909 ?auto_15903 ?auto_15910 ?auto_15911 )
      ( MAKE-2CRATE ?auto_15908 ?auto_15903 ?auto_15904 )
      ( MAKE-1CRATE-VERIFY ?auto_15903 ?auto_15904 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15912 - SURFACE
      ?auto_15913 - SURFACE
      ?auto_15914 - SURFACE
    )
    :vars
    (
      ?auto_15915 - HOIST
      ?auto_15920 - PLACE
      ?auto_15918 - PLACE
      ?auto_15919 - HOIST
      ?auto_15917 - SURFACE
      ?auto_15916 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15915 ?auto_15920 ) ( IS-CRATE ?auto_15914 ) ( not ( = ?auto_15913 ?auto_15914 ) ) ( not ( = ?auto_15912 ?auto_15913 ) ) ( not ( = ?auto_15912 ?auto_15914 ) ) ( not ( = ?auto_15918 ?auto_15920 ) ) ( HOIST-AT ?auto_15919 ?auto_15918 ) ( not ( = ?auto_15915 ?auto_15919 ) ) ( SURFACE-AT ?auto_15914 ?auto_15918 ) ( ON ?auto_15914 ?auto_15917 ) ( CLEAR ?auto_15914 ) ( not ( = ?auto_15913 ?auto_15917 ) ) ( not ( = ?auto_15914 ?auto_15917 ) ) ( not ( = ?auto_15912 ?auto_15917 ) ) ( SURFACE-AT ?auto_15912 ?auto_15920 ) ( CLEAR ?auto_15912 ) ( IS-CRATE ?auto_15913 ) ( AVAILABLE ?auto_15915 ) ( TRUCK-AT ?auto_15916 ?auto_15918 ) ( LIFTING ?auto_15919 ?auto_15913 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15913 ?auto_15914 )
      ( MAKE-2CRATE-VERIFY ?auto_15912 ?auto_15913 ?auto_15914 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15921 - SURFACE
      ?auto_15922 - SURFACE
    )
    :vars
    (
      ?auto_15926 - HOIST
      ?auto_15928 - PLACE
      ?auto_15925 - SURFACE
      ?auto_15923 - PLACE
      ?auto_15927 - HOIST
      ?auto_15929 - SURFACE
      ?auto_15924 - TRUCK
      ?auto_15930 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15926 ?auto_15928 ) ( IS-CRATE ?auto_15922 ) ( not ( = ?auto_15921 ?auto_15922 ) ) ( not ( = ?auto_15925 ?auto_15921 ) ) ( not ( = ?auto_15925 ?auto_15922 ) ) ( not ( = ?auto_15923 ?auto_15928 ) ) ( HOIST-AT ?auto_15927 ?auto_15923 ) ( not ( = ?auto_15926 ?auto_15927 ) ) ( SURFACE-AT ?auto_15922 ?auto_15923 ) ( ON ?auto_15922 ?auto_15929 ) ( CLEAR ?auto_15922 ) ( not ( = ?auto_15921 ?auto_15929 ) ) ( not ( = ?auto_15922 ?auto_15929 ) ) ( not ( = ?auto_15925 ?auto_15929 ) ) ( SURFACE-AT ?auto_15925 ?auto_15928 ) ( CLEAR ?auto_15925 ) ( IS-CRATE ?auto_15921 ) ( AVAILABLE ?auto_15926 ) ( TRUCK-AT ?auto_15924 ?auto_15923 ) ( AVAILABLE ?auto_15927 ) ( SURFACE-AT ?auto_15921 ?auto_15923 ) ( ON ?auto_15921 ?auto_15930 ) ( CLEAR ?auto_15921 ) ( not ( = ?auto_15921 ?auto_15930 ) ) ( not ( = ?auto_15922 ?auto_15930 ) ) ( not ( = ?auto_15925 ?auto_15930 ) ) ( not ( = ?auto_15929 ?auto_15930 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15927 ?auto_15921 ?auto_15930 ?auto_15923 )
      ( MAKE-2CRATE ?auto_15925 ?auto_15921 ?auto_15922 )
      ( MAKE-1CRATE-VERIFY ?auto_15921 ?auto_15922 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15931 - SURFACE
      ?auto_15932 - SURFACE
      ?auto_15933 - SURFACE
    )
    :vars
    (
      ?auto_15939 - HOIST
      ?auto_15940 - PLACE
      ?auto_15934 - PLACE
      ?auto_15936 - HOIST
      ?auto_15938 - SURFACE
      ?auto_15935 - TRUCK
      ?auto_15937 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15939 ?auto_15940 ) ( IS-CRATE ?auto_15933 ) ( not ( = ?auto_15932 ?auto_15933 ) ) ( not ( = ?auto_15931 ?auto_15932 ) ) ( not ( = ?auto_15931 ?auto_15933 ) ) ( not ( = ?auto_15934 ?auto_15940 ) ) ( HOIST-AT ?auto_15936 ?auto_15934 ) ( not ( = ?auto_15939 ?auto_15936 ) ) ( SURFACE-AT ?auto_15933 ?auto_15934 ) ( ON ?auto_15933 ?auto_15938 ) ( CLEAR ?auto_15933 ) ( not ( = ?auto_15932 ?auto_15938 ) ) ( not ( = ?auto_15933 ?auto_15938 ) ) ( not ( = ?auto_15931 ?auto_15938 ) ) ( SURFACE-AT ?auto_15931 ?auto_15940 ) ( CLEAR ?auto_15931 ) ( IS-CRATE ?auto_15932 ) ( AVAILABLE ?auto_15939 ) ( TRUCK-AT ?auto_15935 ?auto_15934 ) ( AVAILABLE ?auto_15936 ) ( SURFACE-AT ?auto_15932 ?auto_15934 ) ( ON ?auto_15932 ?auto_15937 ) ( CLEAR ?auto_15932 ) ( not ( = ?auto_15932 ?auto_15937 ) ) ( not ( = ?auto_15933 ?auto_15937 ) ) ( not ( = ?auto_15931 ?auto_15937 ) ) ( not ( = ?auto_15938 ?auto_15937 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15932 ?auto_15933 )
      ( MAKE-2CRATE-VERIFY ?auto_15931 ?auto_15932 ?auto_15933 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15941 - SURFACE
      ?auto_15942 - SURFACE
    )
    :vars
    (
      ?auto_15946 - HOIST
      ?auto_15947 - PLACE
      ?auto_15943 - SURFACE
      ?auto_15948 - PLACE
      ?auto_15945 - HOIST
      ?auto_15944 - SURFACE
      ?auto_15949 - SURFACE
      ?auto_15950 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15946 ?auto_15947 ) ( IS-CRATE ?auto_15942 ) ( not ( = ?auto_15941 ?auto_15942 ) ) ( not ( = ?auto_15943 ?auto_15941 ) ) ( not ( = ?auto_15943 ?auto_15942 ) ) ( not ( = ?auto_15948 ?auto_15947 ) ) ( HOIST-AT ?auto_15945 ?auto_15948 ) ( not ( = ?auto_15946 ?auto_15945 ) ) ( SURFACE-AT ?auto_15942 ?auto_15948 ) ( ON ?auto_15942 ?auto_15944 ) ( CLEAR ?auto_15942 ) ( not ( = ?auto_15941 ?auto_15944 ) ) ( not ( = ?auto_15942 ?auto_15944 ) ) ( not ( = ?auto_15943 ?auto_15944 ) ) ( SURFACE-AT ?auto_15943 ?auto_15947 ) ( CLEAR ?auto_15943 ) ( IS-CRATE ?auto_15941 ) ( AVAILABLE ?auto_15946 ) ( AVAILABLE ?auto_15945 ) ( SURFACE-AT ?auto_15941 ?auto_15948 ) ( ON ?auto_15941 ?auto_15949 ) ( CLEAR ?auto_15941 ) ( not ( = ?auto_15941 ?auto_15949 ) ) ( not ( = ?auto_15942 ?auto_15949 ) ) ( not ( = ?auto_15943 ?auto_15949 ) ) ( not ( = ?auto_15944 ?auto_15949 ) ) ( TRUCK-AT ?auto_15950 ?auto_15947 ) )
    :subtasks
    ( ( !DRIVE ?auto_15950 ?auto_15947 ?auto_15948 )
      ( MAKE-2CRATE ?auto_15943 ?auto_15941 ?auto_15942 )
      ( MAKE-1CRATE-VERIFY ?auto_15941 ?auto_15942 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15951 - SURFACE
      ?auto_15952 - SURFACE
      ?auto_15953 - SURFACE
    )
    :vars
    (
      ?auto_15958 - HOIST
      ?auto_15960 - PLACE
      ?auto_15956 - PLACE
      ?auto_15954 - HOIST
      ?auto_15959 - SURFACE
      ?auto_15955 - SURFACE
      ?auto_15957 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15958 ?auto_15960 ) ( IS-CRATE ?auto_15953 ) ( not ( = ?auto_15952 ?auto_15953 ) ) ( not ( = ?auto_15951 ?auto_15952 ) ) ( not ( = ?auto_15951 ?auto_15953 ) ) ( not ( = ?auto_15956 ?auto_15960 ) ) ( HOIST-AT ?auto_15954 ?auto_15956 ) ( not ( = ?auto_15958 ?auto_15954 ) ) ( SURFACE-AT ?auto_15953 ?auto_15956 ) ( ON ?auto_15953 ?auto_15959 ) ( CLEAR ?auto_15953 ) ( not ( = ?auto_15952 ?auto_15959 ) ) ( not ( = ?auto_15953 ?auto_15959 ) ) ( not ( = ?auto_15951 ?auto_15959 ) ) ( SURFACE-AT ?auto_15951 ?auto_15960 ) ( CLEAR ?auto_15951 ) ( IS-CRATE ?auto_15952 ) ( AVAILABLE ?auto_15958 ) ( AVAILABLE ?auto_15954 ) ( SURFACE-AT ?auto_15952 ?auto_15956 ) ( ON ?auto_15952 ?auto_15955 ) ( CLEAR ?auto_15952 ) ( not ( = ?auto_15952 ?auto_15955 ) ) ( not ( = ?auto_15953 ?auto_15955 ) ) ( not ( = ?auto_15951 ?auto_15955 ) ) ( not ( = ?auto_15959 ?auto_15955 ) ) ( TRUCK-AT ?auto_15957 ?auto_15960 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15952 ?auto_15953 )
      ( MAKE-2CRATE-VERIFY ?auto_15951 ?auto_15952 ?auto_15953 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15970 - SURFACE
      ?auto_15971 - SURFACE
    )
    :vars
    (
      ?auto_15972 - HOIST
      ?auto_15973 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15972 ?auto_15973 ) ( SURFACE-AT ?auto_15970 ?auto_15973 ) ( CLEAR ?auto_15970 ) ( LIFTING ?auto_15972 ?auto_15971 ) ( IS-CRATE ?auto_15971 ) ( not ( = ?auto_15970 ?auto_15971 ) ) )
    :subtasks
    ( ( !DROP ?auto_15972 ?auto_15971 ?auto_15970 ?auto_15973 )
      ( MAKE-1CRATE-VERIFY ?auto_15970 ?auto_15971 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15974 - SURFACE
      ?auto_15975 - SURFACE
      ?auto_15976 - SURFACE
    )
    :vars
    (
      ?auto_15977 - HOIST
      ?auto_15978 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15977 ?auto_15978 ) ( SURFACE-AT ?auto_15975 ?auto_15978 ) ( CLEAR ?auto_15975 ) ( LIFTING ?auto_15977 ?auto_15976 ) ( IS-CRATE ?auto_15976 ) ( not ( = ?auto_15975 ?auto_15976 ) ) ( ON ?auto_15975 ?auto_15974 ) ( not ( = ?auto_15974 ?auto_15975 ) ) ( not ( = ?auto_15974 ?auto_15976 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15975 ?auto_15976 )
      ( MAKE-2CRATE-VERIFY ?auto_15974 ?auto_15975 ?auto_15976 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15979 - SURFACE
      ?auto_15980 - SURFACE
      ?auto_15981 - SURFACE
      ?auto_15982 - SURFACE
    )
    :vars
    (
      ?auto_15983 - HOIST
      ?auto_15984 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15983 ?auto_15984 ) ( SURFACE-AT ?auto_15981 ?auto_15984 ) ( CLEAR ?auto_15981 ) ( LIFTING ?auto_15983 ?auto_15982 ) ( IS-CRATE ?auto_15982 ) ( not ( = ?auto_15981 ?auto_15982 ) ) ( ON ?auto_15980 ?auto_15979 ) ( ON ?auto_15981 ?auto_15980 ) ( not ( = ?auto_15979 ?auto_15980 ) ) ( not ( = ?auto_15979 ?auto_15981 ) ) ( not ( = ?auto_15979 ?auto_15982 ) ) ( not ( = ?auto_15980 ?auto_15981 ) ) ( not ( = ?auto_15980 ?auto_15982 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15981 ?auto_15982 )
      ( MAKE-3CRATE-VERIFY ?auto_15979 ?auto_15980 ?auto_15981 ?auto_15982 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15985 - SURFACE
      ?auto_15986 - SURFACE
    )
    :vars
    (
      ?auto_15987 - HOIST
      ?auto_15988 - PLACE
      ?auto_15989 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15987 ?auto_15988 ) ( SURFACE-AT ?auto_15985 ?auto_15988 ) ( CLEAR ?auto_15985 ) ( IS-CRATE ?auto_15986 ) ( not ( = ?auto_15985 ?auto_15986 ) ) ( TRUCK-AT ?auto_15989 ?auto_15988 ) ( AVAILABLE ?auto_15987 ) ( IN ?auto_15986 ?auto_15989 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15987 ?auto_15986 ?auto_15989 ?auto_15988 )
      ( MAKE-1CRATE ?auto_15985 ?auto_15986 )
      ( MAKE-1CRATE-VERIFY ?auto_15985 ?auto_15986 ) )
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
      ?auto_15995 - HOIST
      ?auto_15993 - PLACE
      ?auto_15994 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15995 ?auto_15993 ) ( SURFACE-AT ?auto_15991 ?auto_15993 ) ( CLEAR ?auto_15991 ) ( IS-CRATE ?auto_15992 ) ( not ( = ?auto_15991 ?auto_15992 ) ) ( TRUCK-AT ?auto_15994 ?auto_15993 ) ( AVAILABLE ?auto_15995 ) ( IN ?auto_15992 ?auto_15994 ) ( ON ?auto_15991 ?auto_15990 ) ( not ( = ?auto_15990 ?auto_15991 ) ) ( not ( = ?auto_15990 ?auto_15992 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15991 ?auto_15992 )
      ( MAKE-2CRATE-VERIFY ?auto_15990 ?auto_15991 ?auto_15992 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15996 - SURFACE
      ?auto_15997 - SURFACE
      ?auto_15998 - SURFACE
      ?auto_15999 - SURFACE
    )
    :vars
    (
      ?auto_16001 - HOIST
      ?auto_16000 - PLACE
      ?auto_16002 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16001 ?auto_16000 ) ( SURFACE-AT ?auto_15998 ?auto_16000 ) ( CLEAR ?auto_15998 ) ( IS-CRATE ?auto_15999 ) ( not ( = ?auto_15998 ?auto_15999 ) ) ( TRUCK-AT ?auto_16002 ?auto_16000 ) ( AVAILABLE ?auto_16001 ) ( IN ?auto_15999 ?auto_16002 ) ( ON ?auto_15998 ?auto_15997 ) ( not ( = ?auto_15997 ?auto_15998 ) ) ( not ( = ?auto_15997 ?auto_15999 ) ) ( ON ?auto_15997 ?auto_15996 ) ( not ( = ?auto_15996 ?auto_15997 ) ) ( not ( = ?auto_15996 ?auto_15998 ) ) ( not ( = ?auto_15996 ?auto_15999 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15997 ?auto_15998 ?auto_15999 )
      ( MAKE-3CRATE-VERIFY ?auto_15996 ?auto_15997 ?auto_15998 ?auto_15999 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16003 - SURFACE
      ?auto_16004 - SURFACE
    )
    :vars
    (
      ?auto_16006 - HOIST
      ?auto_16005 - PLACE
      ?auto_16007 - TRUCK
      ?auto_16008 - SURFACE
      ?auto_16009 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16006 ?auto_16005 ) ( SURFACE-AT ?auto_16003 ?auto_16005 ) ( CLEAR ?auto_16003 ) ( IS-CRATE ?auto_16004 ) ( not ( = ?auto_16003 ?auto_16004 ) ) ( AVAILABLE ?auto_16006 ) ( IN ?auto_16004 ?auto_16007 ) ( ON ?auto_16003 ?auto_16008 ) ( not ( = ?auto_16008 ?auto_16003 ) ) ( not ( = ?auto_16008 ?auto_16004 ) ) ( TRUCK-AT ?auto_16007 ?auto_16009 ) ( not ( = ?auto_16009 ?auto_16005 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16007 ?auto_16009 ?auto_16005 )
      ( MAKE-2CRATE ?auto_16008 ?auto_16003 ?auto_16004 )
      ( MAKE-1CRATE-VERIFY ?auto_16003 ?auto_16004 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16010 - SURFACE
      ?auto_16011 - SURFACE
      ?auto_16012 - SURFACE
    )
    :vars
    (
      ?auto_16013 - HOIST
      ?auto_16016 - PLACE
      ?auto_16014 - TRUCK
      ?auto_16015 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16013 ?auto_16016 ) ( SURFACE-AT ?auto_16011 ?auto_16016 ) ( CLEAR ?auto_16011 ) ( IS-CRATE ?auto_16012 ) ( not ( = ?auto_16011 ?auto_16012 ) ) ( AVAILABLE ?auto_16013 ) ( IN ?auto_16012 ?auto_16014 ) ( ON ?auto_16011 ?auto_16010 ) ( not ( = ?auto_16010 ?auto_16011 ) ) ( not ( = ?auto_16010 ?auto_16012 ) ) ( TRUCK-AT ?auto_16014 ?auto_16015 ) ( not ( = ?auto_16015 ?auto_16016 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16011 ?auto_16012 )
      ( MAKE-2CRATE-VERIFY ?auto_16010 ?auto_16011 ?auto_16012 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16017 - SURFACE
      ?auto_16018 - SURFACE
      ?auto_16019 - SURFACE
      ?auto_16020 - SURFACE
    )
    :vars
    (
      ?auto_16021 - HOIST
      ?auto_16022 - PLACE
      ?auto_16023 - TRUCK
      ?auto_16024 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16021 ?auto_16022 ) ( SURFACE-AT ?auto_16019 ?auto_16022 ) ( CLEAR ?auto_16019 ) ( IS-CRATE ?auto_16020 ) ( not ( = ?auto_16019 ?auto_16020 ) ) ( AVAILABLE ?auto_16021 ) ( IN ?auto_16020 ?auto_16023 ) ( ON ?auto_16019 ?auto_16018 ) ( not ( = ?auto_16018 ?auto_16019 ) ) ( not ( = ?auto_16018 ?auto_16020 ) ) ( TRUCK-AT ?auto_16023 ?auto_16024 ) ( not ( = ?auto_16024 ?auto_16022 ) ) ( ON ?auto_16018 ?auto_16017 ) ( not ( = ?auto_16017 ?auto_16018 ) ) ( not ( = ?auto_16017 ?auto_16019 ) ) ( not ( = ?auto_16017 ?auto_16020 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16018 ?auto_16019 ?auto_16020 )
      ( MAKE-3CRATE-VERIFY ?auto_16017 ?auto_16018 ?auto_16019 ?auto_16020 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16025 - SURFACE
      ?auto_16026 - SURFACE
    )
    :vars
    (
      ?auto_16027 - HOIST
      ?auto_16028 - PLACE
      ?auto_16031 - SURFACE
      ?auto_16029 - TRUCK
      ?auto_16030 - PLACE
      ?auto_16032 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16027 ?auto_16028 ) ( SURFACE-AT ?auto_16025 ?auto_16028 ) ( CLEAR ?auto_16025 ) ( IS-CRATE ?auto_16026 ) ( not ( = ?auto_16025 ?auto_16026 ) ) ( AVAILABLE ?auto_16027 ) ( ON ?auto_16025 ?auto_16031 ) ( not ( = ?auto_16031 ?auto_16025 ) ) ( not ( = ?auto_16031 ?auto_16026 ) ) ( TRUCK-AT ?auto_16029 ?auto_16030 ) ( not ( = ?auto_16030 ?auto_16028 ) ) ( HOIST-AT ?auto_16032 ?auto_16030 ) ( LIFTING ?auto_16032 ?auto_16026 ) ( not ( = ?auto_16027 ?auto_16032 ) ) )
    :subtasks
    ( ( !LOAD ?auto_16032 ?auto_16026 ?auto_16029 ?auto_16030 )
      ( MAKE-2CRATE ?auto_16031 ?auto_16025 ?auto_16026 )
      ( MAKE-1CRATE-VERIFY ?auto_16025 ?auto_16026 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16033 - SURFACE
      ?auto_16034 - SURFACE
      ?auto_16035 - SURFACE
    )
    :vars
    (
      ?auto_16038 - HOIST
      ?auto_16039 - PLACE
      ?auto_16036 - TRUCK
      ?auto_16040 - PLACE
      ?auto_16037 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16038 ?auto_16039 ) ( SURFACE-AT ?auto_16034 ?auto_16039 ) ( CLEAR ?auto_16034 ) ( IS-CRATE ?auto_16035 ) ( not ( = ?auto_16034 ?auto_16035 ) ) ( AVAILABLE ?auto_16038 ) ( ON ?auto_16034 ?auto_16033 ) ( not ( = ?auto_16033 ?auto_16034 ) ) ( not ( = ?auto_16033 ?auto_16035 ) ) ( TRUCK-AT ?auto_16036 ?auto_16040 ) ( not ( = ?auto_16040 ?auto_16039 ) ) ( HOIST-AT ?auto_16037 ?auto_16040 ) ( LIFTING ?auto_16037 ?auto_16035 ) ( not ( = ?auto_16038 ?auto_16037 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16034 ?auto_16035 )
      ( MAKE-2CRATE-VERIFY ?auto_16033 ?auto_16034 ?auto_16035 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16041 - SURFACE
      ?auto_16042 - SURFACE
      ?auto_16043 - SURFACE
      ?auto_16044 - SURFACE
    )
    :vars
    (
      ?auto_16049 - HOIST
      ?auto_16045 - PLACE
      ?auto_16047 - TRUCK
      ?auto_16046 - PLACE
      ?auto_16048 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16049 ?auto_16045 ) ( SURFACE-AT ?auto_16043 ?auto_16045 ) ( CLEAR ?auto_16043 ) ( IS-CRATE ?auto_16044 ) ( not ( = ?auto_16043 ?auto_16044 ) ) ( AVAILABLE ?auto_16049 ) ( ON ?auto_16043 ?auto_16042 ) ( not ( = ?auto_16042 ?auto_16043 ) ) ( not ( = ?auto_16042 ?auto_16044 ) ) ( TRUCK-AT ?auto_16047 ?auto_16046 ) ( not ( = ?auto_16046 ?auto_16045 ) ) ( HOIST-AT ?auto_16048 ?auto_16046 ) ( LIFTING ?auto_16048 ?auto_16044 ) ( not ( = ?auto_16049 ?auto_16048 ) ) ( ON ?auto_16042 ?auto_16041 ) ( not ( = ?auto_16041 ?auto_16042 ) ) ( not ( = ?auto_16041 ?auto_16043 ) ) ( not ( = ?auto_16041 ?auto_16044 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16042 ?auto_16043 ?auto_16044 )
      ( MAKE-3CRATE-VERIFY ?auto_16041 ?auto_16042 ?auto_16043 ?auto_16044 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16050 - SURFACE
      ?auto_16051 - SURFACE
    )
    :vars
    (
      ?auto_16056 - HOIST
      ?auto_16052 - PLACE
      ?auto_16057 - SURFACE
      ?auto_16054 - TRUCK
      ?auto_16053 - PLACE
      ?auto_16055 - HOIST
      ?auto_16058 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16056 ?auto_16052 ) ( SURFACE-AT ?auto_16050 ?auto_16052 ) ( CLEAR ?auto_16050 ) ( IS-CRATE ?auto_16051 ) ( not ( = ?auto_16050 ?auto_16051 ) ) ( AVAILABLE ?auto_16056 ) ( ON ?auto_16050 ?auto_16057 ) ( not ( = ?auto_16057 ?auto_16050 ) ) ( not ( = ?auto_16057 ?auto_16051 ) ) ( TRUCK-AT ?auto_16054 ?auto_16053 ) ( not ( = ?auto_16053 ?auto_16052 ) ) ( HOIST-AT ?auto_16055 ?auto_16053 ) ( not ( = ?auto_16056 ?auto_16055 ) ) ( AVAILABLE ?auto_16055 ) ( SURFACE-AT ?auto_16051 ?auto_16053 ) ( ON ?auto_16051 ?auto_16058 ) ( CLEAR ?auto_16051 ) ( not ( = ?auto_16050 ?auto_16058 ) ) ( not ( = ?auto_16051 ?auto_16058 ) ) ( not ( = ?auto_16057 ?auto_16058 ) ) )
    :subtasks
    ( ( !LIFT ?auto_16055 ?auto_16051 ?auto_16058 ?auto_16053 )
      ( MAKE-2CRATE ?auto_16057 ?auto_16050 ?auto_16051 )
      ( MAKE-1CRATE-VERIFY ?auto_16050 ?auto_16051 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16059 - SURFACE
      ?auto_16060 - SURFACE
      ?auto_16061 - SURFACE
    )
    :vars
    (
      ?auto_16064 - HOIST
      ?auto_16065 - PLACE
      ?auto_16062 - TRUCK
      ?auto_16066 - PLACE
      ?auto_16067 - HOIST
      ?auto_16063 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16064 ?auto_16065 ) ( SURFACE-AT ?auto_16060 ?auto_16065 ) ( CLEAR ?auto_16060 ) ( IS-CRATE ?auto_16061 ) ( not ( = ?auto_16060 ?auto_16061 ) ) ( AVAILABLE ?auto_16064 ) ( ON ?auto_16060 ?auto_16059 ) ( not ( = ?auto_16059 ?auto_16060 ) ) ( not ( = ?auto_16059 ?auto_16061 ) ) ( TRUCK-AT ?auto_16062 ?auto_16066 ) ( not ( = ?auto_16066 ?auto_16065 ) ) ( HOIST-AT ?auto_16067 ?auto_16066 ) ( not ( = ?auto_16064 ?auto_16067 ) ) ( AVAILABLE ?auto_16067 ) ( SURFACE-AT ?auto_16061 ?auto_16066 ) ( ON ?auto_16061 ?auto_16063 ) ( CLEAR ?auto_16061 ) ( not ( = ?auto_16060 ?auto_16063 ) ) ( not ( = ?auto_16061 ?auto_16063 ) ) ( not ( = ?auto_16059 ?auto_16063 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16060 ?auto_16061 )
      ( MAKE-2CRATE-VERIFY ?auto_16059 ?auto_16060 ?auto_16061 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16068 - SURFACE
      ?auto_16069 - SURFACE
      ?auto_16070 - SURFACE
      ?auto_16071 - SURFACE
    )
    :vars
    (
      ?auto_16072 - HOIST
      ?auto_16076 - PLACE
      ?auto_16073 - TRUCK
      ?auto_16077 - PLACE
      ?auto_16074 - HOIST
      ?auto_16075 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16072 ?auto_16076 ) ( SURFACE-AT ?auto_16070 ?auto_16076 ) ( CLEAR ?auto_16070 ) ( IS-CRATE ?auto_16071 ) ( not ( = ?auto_16070 ?auto_16071 ) ) ( AVAILABLE ?auto_16072 ) ( ON ?auto_16070 ?auto_16069 ) ( not ( = ?auto_16069 ?auto_16070 ) ) ( not ( = ?auto_16069 ?auto_16071 ) ) ( TRUCK-AT ?auto_16073 ?auto_16077 ) ( not ( = ?auto_16077 ?auto_16076 ) ) ( HOIST-AT ?auto_16074 ?auto_16077 ) ( not ( = ?auto_16072 ?auto_16074 ) ) ( AVAILABLE ?auto_16074 ) ( SURFACE-AT ?auto_16071 ?auto_16077 ) ( ON ?auto_16071 ?auto_16075 ) ( CLEAR ?auto_16071 ) ( not ( = ?auto_16070 ?auto_16075 ) ) ( not ( = ?auto_16071 ?auto_16075 ) ) ( not ( = ?auto_16069 ?auto_16075 ) ) ( ON ?auto_16069 ?auto_16068 ) ( not ( = ?auto_16068 ?auto_16069 ) ) ( not ( = ?auto_16068 ?auto_16070 ) ) ( not ( = ?auto_16068 ?auto_16071 ) ) ( not ( = ?auto_16068 ?auto_16075 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16069 ?auto_16070 ?auto_16071 )
      ( MAKE-3CRATE-VERIFY ?auto_16068 ?auto_16069 ?auto_16070 ?auto_16071 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16078 - SURFACE
      ?auto_16079 - SURFACE
    )
    :vars
    (
      ?auto_16080 - HOIST
      ?auto_16085 - PLACE
      ?auto_16084 - SURFACE
      ?auto_16086 - PLACE
      ?auto_16082 - HOIST
      ?auto_16083 - SURFACE
      ?auto_16081 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16080 ?auto_16085 ) ( SURFACE-AT ?auto_16078 ?auto_16085 ) ( CLEAR ?auto_16078 ) ( IS-CRATE ?auto_16079 ) ( not ( = ?auto_16078 ?auto_16079 ) ) ( AVAILABLE ?auto_16080 ) ( ON ?auto_16078 ?auto_16084 ) ( not ( = ?auto_16084 ?auto_16078 ) ) ( not ( = ?auto_16084 ?auto_16079 ) ) ( not ( = ?auto_16086 ?auto_16085 ) ) ( HOIST-AT ?auto_16082 ?auto_16086 ) ( not ( = ?auto_16080 ?auto_16082 ) ) ( AVAILABLE ?auto_16082 ) ( SURFACE-AT ?auto_16079 ?auto_16086 ) ( ON ?auto_16079 ?auto_16083 ) ( CLEAR ?auto_16079 ) ( not ( = ?auto_16078 ?auto_16083 ) ) ( not ( = ?auto_16079 ?auto_16083 ) ) ( not ( = ?auto_16084 ?auto_16083 ) ) ( TRUCK-AT ?auto_16081 ?auto_16085 ) )
    :subtasks
    ( ( !DRIVE ?auto_16081 ?auto_16085 ?auto_16086 )
      ( MAKE-2CRATE ?auto_16084 ?auto_16078 ?auto_16079 )
      ( MAKE-1CRATE-VERIFY ?auto_16078 ?auto_16079 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16087 - SURFACE
      ?auto_16088 - SURFACE
      ?auto_16089 - SURFACE
    )
    :vars
    (
      ?auto_16095 - HOIST
      ?auto_16091 - PLACE
      ?auto_16090 - PLACE
      ?auto_16092 - HOIST
      ?auto_16094 - SURFACE
      ?auto_16093 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16095 ?auto_16091 ) ( SURFACE-AT ?auto_16088 ?auto_16091 ) ( CLEAR ?auto_16088 ) ( IS-CRATE ?auto_16089 ) ( not ( = ?auto_16088 ?auto_16089 ) ) ( AVAILABLE ?auto_16095 ) ( ON ?auto_16088 ?auto_16087 ) ( not ( = ?auto_16087 ?auto_16088 ) ) ( not ( = ?auto_16087 ?auto_16089 ) ) ( not ( = ?auto_16090 ?auto_16091 ) ) ( HOIST-AT ?auto_16092 ?auto_16090 ) ( not ( = ?auto_16095 ?auto_16092 ) ) ( AVAILABLE ?auto_16092 ) ( SURFACE-AT ?auto_16089 ?auto_16090 ) ( ON ?auto_16089 ?auto_16094 ) ( CLEAR ?auto_16089 ) ( not ( = ?auto_16088 ?auto_16094 ) ) ( not ( = ?auto_16089 ?auto_16094 ) ) ( not ( = ?auto_16087 ?auto_16094 ) ) ( TRUCK-AT ?auto_16093 ?auto_16091 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16088 ?auto_16089 )
      ( MAKE-2CRATE-VERIFY ?auto_16087 ?auto_16088 ?auto_16089 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16096 - SURFACE
      ?auto_16097 - SURFACE
      ?auto_16098 - SURFACE
      ?auto_16099 - SURFACE
    )
    :vars
    (
      ?auto_16100 - HOIST
      ?auto_16102 - PLACE
      ?auto_16104 - PLACE
      ?auto_16103 - HOIST
      ?auto_16105 - SURFACE
      ?auto_16101 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16100 ?auto_16102 ) ( SURFACE-AT ?auto_16098 ?auto_16102 ) ( CLEAR ?auto_16098 ) ( IS-CRATE ?auto_16099 ) ( not ( = ?auto_16098 ?auto_16099 ) ) ( AVAILABLE ?auto_16100 ) ( ON ?auto_16098 ?auto_16097 ) ( not ( = ?auto_16097 ?auto_16098 ) ) ( not ( = ?auto_16097 ?auto_16099 ) ) ( not ( = ?auto_16104 ?auto_16102 ) ) ( HOIST-AT ?auto_16103 ?auto_16104 ) ( not ( = ?auto_16100 ?auto_16103 ) ) ( AVAILABLE ?auto_16103 ) ( SURFACE-AT ?auto_16099 ?auto_16104 ) ( ON ?auto_16099 ?auto_16105 ) ( CLEAR ?auto_16099 ) ( not ( = ?auto_16098 ?auto_16105 ) ) ( not ( = ?auto_16099 ?auto_16105 ) ) ( not ( = ?auto_16097 ?auto_16105 ) ) ( TRUCK-AT ?auto_16101 ?auto_16102 ) ( ON ?auto_16097 ?auto_16096 ) ( not ( = ?auto_16096 ?auto_16097 ) ) ( not ( = ?auto_16096 ?auto_16098 ) ) ( not ( = ?auto_16096 ?auto_16099 ) ) ( not ( = ?auto_16096 ?auto_16105 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16097 ?auto_16098 ?auto_16099 )
      ( MAKE-3CRATE-VERIFY ?auto_16096 ?auto_16097 ?auto_16098 ?auto_16099 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16106 - SURFACE
      ?auto_16107 - SURFACE
    )
    :vars
    (
      ?auto_16109 - HOIST
      ?auto_16111 - PLACE
      ?auto_16108 - SURFACE
      ?auto_16113 - PLACE
      ?auto_16112 - HOIST
      ?auto_16114 - SURFACE
      ?auto_16110 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16109 ?auto_16111 ) ( IS-CRATE ?auto_16107 ) ( not ( = ?auto_16106 ?auto_16107 ) ) ( not ( = ?auto_16108 ?auto_16106 ) ) ( not ( = ?auto_16108 ?auto_16107 ) ) ( not ( = ?auto_16113 ?auto_16111 ) ) ( HOIST-AT ?auto_16112 ?auto_16113 ) ( not ( = ?auto_16109 ?auto_16112 ) ) ( AVAILABLE ?auto_16112 ) ( SURFACE-AT ?auto_16107 ?auto_16113 ) ( ON ?auto_16107 ?auto_16114 ) ( CLEAR ?auto_16107 ) ( not ( = ?auto_16106 ?auto_16114 ) ) ( not ( = ?auto_16107 ?auto_16114 ) ) ( not ( = ?auto_16108 ?auto_16114 ) ) ( TRUCK-AT ?auto_16110 ?auto_16111 ) ( SURFACE-AT ?auto_16108 ?auto_16111 ) ( CLEAR ?auto_16108 ) ( LIFTING ?auto_16109 ?auto_16106 ) ( IS-CRATE ?auto_16106 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16108 ?auto_16106 )
      ( MAKE-2CRATE ?auto_16108 ?auto_16106 ?auto_16107 )
      ( MAKE-1CRATE-VERIFY ?auto_16106 ?auto_16107 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16115 - SURFACE
      ?auto_16116 - SURFACE
      ?auto_16117 - SURFACE
    )
    :vars
    (
      ?auto_16122 - HOIST
      ?auto_16123 - PLACE
      ?auto_16118 - PLACE
      ?auto_16119 - HOIST
      ?auto_16121 - SURFACE
      ?auto_16120 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16122 ?auto_16123 ) ( IS-CRATE ?auto_16117 ) ( not ( = ?auto_16116 ?auto_16117 ) ) ( not ( = ?auto_16115 ?auto_16116 ) ) ( not ( = ?auto_16115 ?auto_16117 ) ) ( not ( = ?auto_16118 ?auto_16123 ) ) ( HOIST-AT ?auto_16119 ?auto_16118 ) ( not ( = ?auto_16122 ?auto_16119 ) ) ( AVAILABLE ?auto_16119 ) ( SURFACE-AT ?auto_16117 ?auto_16118 ) ( ON ?auto_16117 ?auto_16121 ) ( CLEAR ?auto_16117 ) ( not ( = ?auto_16116 ?auto_16121 ) ) ( not ( = ?auto_16117 ?auto_16121 ) ) ( not ( = ?auto_16115 ?auto_16121 ) ) ( TRUCK-AT ?auto_16120 ?auto_16123 ) ( SURFACE-AT ?auto_16115 ?auto_16123 ) ( CLEAR ?auto_16115 ) ( LIFTING ?auto_16122 ?auto_16116 ) ( IS-CRATE ?auto_16116 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16116 ?auto_16117 )
      ( MAKE-2CRATE-VERIFY ?auto_16115 ?auto_16116 ?auto_16117 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16124 - SURFACE
      ?auto_16125 - SURFACE
      ?auto_16126 - SURFACE
      ?auto_16127 - SURFACE
    )
    :vars
    (
      ?auto_16130 - HOIST
      ?auto_16129 - PLACE
      ?auto_16132 - PLACE
      ?auto_16131 - HOIST
      ?auto_16133 - SURFACE
      ?auto_16128 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16130 ?auto_16129 ) ( IS-CRATE ?auto_16127 ) ( not ( = ?auto_16126 ?auto_16127 ) ) ( not ( = ?auto_16125 ?auto_16126 ) ) ( not ( = ?auto_16125 ?auto_16127 ) ) ( not ( = ?auto_16132 ?auto_16129 ) ) ( HOIST-AT ?auto_16131 ?auto_16132 ) ( not ( = ?auto_16130 ?auto_16131 ) ) ( AVAILABLE ?auto_16131 ) ( SURFACE-AT ?auto_16127 ?auto_16132 ) ( ON ?auto_16127 ?auto_16133 ) ( CLEAR ?auto_16127 ) ( not ( = ?auto_16126 ?auto_16133 ) ) ( not ( = ?auto_16127 ?auto_16133 ) ) ( not ( = ?auto_16125 ?auto_16133 ) ) ( TRUCK-AT ?auto_16128 ?auto_16129 ) ( SURFACE-AT ?auto_16125 ?auto_16129 ) ( CLEAR ?auto_16125 ) ( LIFTING ?auto_16130 ?auto_16126 ) ( IS-CRATE ?auto_16126 ) ( ON ?auto_16125 ?auto_16124 ) ( not ( = ?auto_16124 ?auto_16125 ) ) ( not ( = ?auto_16124 ?auto_16126 ) ) ( not ( = ?auto_16124 ?auto_16127 ) ) ( not ( = ?auto_16124 ?auto_16133 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16125 ?auto_16126 ?auto_16127 )
      ( MAKE-3CRATE-VERIFY ?auto_16124 ?auto_16125 ?auto_16126 ?auto_16127 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16134 - SURFACE
      ?auto_16135 - SURFACE
    )
    :vars
    (
      ?auto_16139 - HOIST
      ?auto_16138 - PLACE
      ?auto_16137 - SURFACE
      ?auto_16141 - PLACE
      ?auto_16140 - HOIST
      ?auto_16142 - SURFACE
      ?auto_16136 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16139 ?auto_16138 ) ( IS-CRATE ?auto_16135 ) ( not ( = ?auto_16134 ?auto_16135 ) ) ( not ( = ?auto_16137 ?auto_16134 ) ) ( not ( = ?auto_16137 ?auto_16135 ) ) ( not ( = ?auto_16141 ?auto_16138 ) ) ( HOIST-AT ?auto_16140 ?auto_16141 ) ( not ( = ?auto_16139 ?auto_16140 ) ) ( AVAILABLE ?auto_16140 ) ( SURFACE-AT ?auto_16135 ?auto_16141 ) ( ON ?auto_16135 ?auto_16142 ) ( CLEAR ?auto_16135 ) ( not ( = ?auto_16134 ?auto_16142 ) ) ( not ( = ?auto_16135 ?auto_16142 ) ) ( not ( = ?auto_16137 ?auto_16142 ) ) ( TRUCK-AT ?auto_16136 ?auto_16138 ) ( SURFACE-AT ?auto_16137 ?auto_16138 ) ( CLEAR ?auto_16137 ) ( IS-CRATE ?auto_16134 ) ( AVAILABLE ?auto_16139 ) ( IN ?auto_16134 ?auto_16136 ) )
    :subtasks
    ( ( !UNLOAD ?auto_16139 ?auto_16134 ?auto_16136 ?auto_16138 )
      ( MAKE-2CRATE ?auto_16137 ?auto_16134 ?auto_16135 )
      ( MAKE-1CRATE-VERIFY ?auto_16134 ?auto_16135 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16143 - SURFACE
      ?auto_16144 - SURFACE
      ?auto_16145 - SURFACE
    )
    :vars
    (
      ?auto_16148 - HOIST
      ?auto_16146 - PLACE
      ?auto_16151 - PLACE
      ?auto_16150 - HOIST
      ?auto_16147 - SURFACE
      ?auto_16149 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16148 ?auto_16146 ) ( IS-CRATE ?auto_16145 ) ( not ( = ?auto_16144 ?auto_16145 ) ) ( not ( = ?auto_16143 ?auto_16144 ) ) ( not ( = ?auto_16143 ?auto_16145 ) ) ( not ( = ?auto_16151 ?auto_16146 ) ) ( HOIST-AT ?auto_16150 ?auto_16151 ) ( not ( = ?auto_16148 ?auto_16150 ) ) ( AVAILABLE ?auto_16150 ) ( SURFACE-AT ?auto_16145 ?auto_16151 ) ( ON ?auto_16145 ?auto_16147 ) ( CLEAR ?auto_16145 ) ( not ( = ?auto_16144 ?auto_16147 ) ) ( not ( = ?auto_16145 ?auto_16147 ) ) ( not ( = ?auto_16143 ?auto_16147 ) ) ( TRUCK-AT ?auto_16149 ?auto_16146 ) ( SURFACE-AT ?auto_16143 ?auto_16146 ) ( CLEAR ?auto_16143 ) ( IS-CRATE ?auto_16144 ) ( AVAILABLE ?auto_16148 ) ( IN ?auto_16144 ?auto_16149 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16144 ?auto_16145 )
      ( MAKE-2CRATE-VERIFY ?auto_16143 ?auto_16144 ?auto_16145 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16152 - SURFACE
      ?auto_16153 - SURFACE
      ?auto_16154 - SURFACE
      ?auto_16155 - SURFACE
    )
    :vars
    (
      ?auto_16161 - HOIST
      ?auto_16160 - PLACE
      ?auto_16158 - PLACE
      ?auto_16157 - HOIST
      ?auto_16159 - SURFACE
      ?auto_16156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16161 ?auto_16160 ) ( IS-CRATE ?auto_16155 ) ( not ( = ?auto_16154 ?auto_16155 ) ) ( not ( = ?auto_16153 ?auto_16154 ) ) ( not ( = ?auto_16153 ?auto_16155 ) ) ( not ( = ?auto_16158 ?auto_16160 ) ) ( HOIST-AT ?auto_16157 ?auto_16158 ) ( not ( = ?auto_16161 ?auto_16157 ) ) ( AVAILABLE ?auto_16157 ) ( SURFACE-AT ?auto_16155 ?auto_16158 ) ( ON ?auto_16155 ?auto_16159 ) ( CLEAR ?auto_16155 ) ( not ( = ?auto_16154 ?auto_16159 ) ) ( not ( = ?auto_16155 ?auto_16159 ) ) ( not ( = ?auto_16153 ?auto_16159 ) ) ( TRUCK-AT ?auto_16156 ?auto_16160 ) ( SURFACE-AT ?auto_16153 ?auto_16160 ) ( CLEAR ?auto_16153 ) ( IS-CRATE ?auto_16154 ) ( AVAILABLE ?auto_16161 ) ( IN ?auto_16154 ?auto_16156 ) ( ON ?auto_16153 ?auto_16152 ) ( not ( = ?auto_16152 ?auto_16153 ) ) ( not ( = ?auto_16152 ?auto_16154 ) ) ( not ( = ?auto_16152 ?auto_16155 ) ) ( not ( = ?auto_16152 ?auto_16159 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16153 ?auto_16154 ?auto_16155 )
      ( MAKE-3CRATE-VERIFY ?auto_16152 ?auto_16153 ?auto_16154 ?auto_16155 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16162 - SURFACE
      ?auto_16163 - SURFACE
    )
    :vars
    (
      ?auto_16170 - HOIST
      ?auto_16169 - PLACE
      ?auto_16164 - SURFACE
      ?auto_16167 - PLACE
      ?auto_16166 - HOIST
      ?auto_16168 - SURFACE
      ?auto_16165 - TRUCK
      ?auto_16171 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16170 ?auto_16169 ) ( IS-CRATE ?auto_16163 ) ( not ( = ?auto_16162 ?auto_16163 ) ) ( not ( = ?auto_16164 ?auto_16162 ) ) ( not ( = ?auto_16164 ?auto_16163 ) ) ( not ( = ?auto_16167 ?auto_16169 ) ) ( HOIST-AT ?auto_16166 ?auto_16167 ) ( not ( = ?auto_16170 ?auto_16166 ) ) ( AVAILABLE ?auto_16166 ) ( SURFACE-AT ?auto_16163 ?auto_16167 ) ( ON ?auto_16163 ?auto_16168 ) ( CLEAR ?auto_16163 ) ( not ( = ?auto_16162 ?auto_16168 ) ) ( not ( = ?auto_16163 ?auto_16168 ) ) ( not ( = ?auto_16164 ?auto_16168 ) ) ( SURFACE-AT ?auto_16164 ?auto_16169 ) ( CLEAR ?auto_16164 ) ( IS-CRATE ?auto_16162 ) ( AVAILABLE ?auto_16170 ) ( IN ?auto_16162 ?auto_16165 ) ( TRUCK-AT ?auto_16165 ?auto_16171 ) ( not ( = ?auto_16171 ?auto_16169 ) ) ( not ( = ?auto_16167 ?auto_16171 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16165 ?auto_16171 ?auto_16169 )
      ( MAKE-2CRATE ?auto_16164 ?auto_16162 ?auto_16163 )
      ( MAKE-1CRATE-VERIFY ?auto_16162 ?auto_16163 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16172 - SURFACE
      ?auto_16173 - SURFACE
      ?auto_16174 - SURFACE
    )
    :vars
    (
      ?auto_16181 - HOIST
      ?auto_16180 - PLACE
      ?auto_16177 - PLACE
      ?auto_16179 - HOIST
      ?auto_16176 - SURFACE
      ?auto_16175 - TRUCK
      ?auto_16178 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16181 ?auto_16180 ) ( IS-CRATE ?auto_16174 ) ( not ( = ?auto_16173 ?auto_16174 ) ) ( not ( = ?auto_16172 ?auto_16173 ) ) ( not ( = ?auto_16172 ?auto_16174 ) ) ( not ( = ?auto_16177 ?auto_16180 ) ) ( HOIST-AT ?auto_16179 ?auto_16177 ) ( not ( = ?auto_16181 ?auto_16179 ) ) ( AVAILABLE ?auto_16179 ) ( SURFACE-AT ?auto_16174 ?auto_16177 ) ( ON ?auto_16174 ?auto_16176 ) ( CLEAR ?auto_16174 ) ( not ( = ?auto_16173 ?auto_16176 ) ) ( not ( = ?auto_16174 ?auto_16176 ) ) ( not ( = ?auto_16172 ?auto_16176 ) ) ( SURFACE-AT ?auto_16172 ?auto_16180 ) ( CLEAR ?auto_16172 ) ( IS-CRATE ?auto_16173 ) ( AVAILABLE ?auto_16181 ) ( IN ?auto_16173 ?auto_16175 ) ( TRUCK-AT ?auto_16175 ?auto_16178 ) ( not ( = ?auto_16178 ?auto_16180 ) ) ( not ( = ?auto_16177 ?auto_16178 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16173 ?auto_16174 )
      ( MAKE-2CRATE-VERIFY ?auto_16172 ?auto_16173 ?auto_16174 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16182 - SURFACE
      ?auto_16183 - SURFACE
      ?auto_16184 - SURFACE
      ?auto_16185 - SURFACE
    )
    :vars
    (
      ?auto_16190 - HOIST
      ?auto_16188 - PLACE
      ?auto_16187 - PLACE
      ?auto_16189 - HOIST
      ?auto_16191 - SURFACE
      ?auto_16192 - TRUCK
      ?auto_16186 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16190 ?auto_16188 ) ( IS-CRATE ?auto_16185 ) ( not ( = ?auto_16184 ?auto_16185 ) ) ( not ( = ?auto_16183 ?auto_16184 ) ) ( not ( = ?auto_16183 ?auto_16185 ) ) ( not ( = ?auto_16187 ?auto_16188 ) ) ( HOIST-AT ?auto_16189 ?auto_16187 ) ( not ( = ?auto_16190 ?auto_16189 ) ) ( AVAILABLE ?auto_16189 ) ( SURFACE-AT ?auto_16185 ?auto_16187 ) ( ON ?auto_16185 ?auto_16191 ) ( CLEAR ?auto_16185 ) ( not ( = ?auto_16184 ?auto_16191 ) ) ( not ( = ?auto_16185 ?auto_16191 ) ) ( not ( = ?auto_16183 ?auto_16191 ) ) ( SURFACE-AT ?auto_16183 ?auto_16188 ) ( CLEAR ?auto_16183 ) ( IS-CRATE ?auto_16184 ) ( AVAILABLE ?auto_16190 ) ( IN ?auto_16184 ?auto_16192 ) ( TRUCK-AT ?auto_16192 ?auto_16186 ) ( not ( = ?auto_16186 ?auto_16188 ) ) ( not ( = ?auto_16187 ?auto_16186 ) ) ( ON ?auto_16183 ?auto_16182 ) ( not ( = ?auto_16182 ?auto_16183 ) ) ( not ( = ?auto_16182 ?auto_16184 ) ) ( not ( = ?auto_16182 ?auto_16185 ) ) ( not ( = ?auto_16182 ?auto_16191 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16183 ?auto_16184 ?auto_16185 )
      ( MAKE-3CRATE-VERIFY ?auto_16182 ?auto_16183 ?auto_16184 ?auto_16185 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16193 - SURFACE
      ?auto_16194 - SURFACE
    )
    :vars
    (
      ?auto_16199 - HOIST
      ?auto_16197 - PLACE
      ?auto_16202 - SURFACE
      ?auto_16196 - PLACE
      ?auto_16198 - HOIST
      ?auto_16200 - SURFACE
      ?auto_16201 - TRUCK
      ?auto_16195 - PLACE
      ?auto_16203 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16199 ?auto_16197 ) ( IS-CRATE ?auto_16194 ) ( not ( = ?auto_16193 ?auto_16194 ) ) ( not ( = ?auto_16202 ?auto_16193 ) ) ( not ( = ?auto_16202 ?auto_16194 ) ) ( not ( = ?auto_16196 ?auto_16197 ) ) ( HOIST-AT ?auto_16198 ?auto_16196 ) ( not ( = ?auto_16199 ?auto_16198 ) ) ( AVAILABLE ?auto_16198 ) ( SURFACE-AT ?auto_16194 ?auto_16196 ) ( ON ?auto_16194 ?auto_16200 ) ( CLEAR ?auto_16194 ) ( not ( = ?auto_16193 ?auto_16200 ) ) ( not ( = ?auto_16194 ?auto_16200 ) ) ( not ( = ?auto_16202 ?auto_16200 ) ) ( SURFACE-AT ?auto_16202 ?auto_16197 ) ( CLEAR ?auto_16202 ) ( IS-CRATE ?auto_16193 ) ( AVAILABLE ?auto_16199 ) ( TRUCK-AT ?auto_16201 ?auto_16195 ) ( not ( = ?auto_16195 ?auto_16197 ) ) ( not ( = ?auto_16196 ?auto_16195 ) ) ( HOIST-AT ?auto_16203 ?auto_16195 ) ( LIFTING ?auto_16203 ?auto_16193 ) ( not ( = ?auto_16199 ?auto_16203 ) ) ( not ( = ?auto_16198 ?auto_16203 ) ) )
    :subtasks
    ( ( !LOAD ?auto_16203 ?auto_16193 ?auto_16201 ?auto_16195 )
      ( MAKE-2CRATE ?auto_16202 ?auto_16193 ?auto_16194 )
      ( MAKE-1CRATE-VERIFY ?auto_16193 ?auto_16194 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16204 - SURFACE
      ?auto_16205 - SURFACE
      ?auto_16206 - SURFACE
    )
    :vars
    (
      ?auto_16208 - HOIST
      ?auto_16211 - PLACE
      ?auto_16210 - PLACE
      ?auto_16212 - HOIST
      ?auto_16207 - SURFACE
      ?auto_16214 - TRUCK
      ?auto_16213 - PLACE
      ?auto_16209 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16208 ?auto_16211 ) ( IS-CRATE ?auto_16206 ) ( not ( = ?auto_16205 ?auto_16206 ) ) ( not ( = ?auto_16204 ?auto_16205 ) ) ( not ( = ?auto_16204 ?auto_16206 ) ) ( not ( = ?auto_16210 ?auto_16211 ) ) ( HOIST-AT ?auto_16212 ?auto_16210 ) ( not ( = ?auto_16208 ?auto_16212 ) ) ( AVAILABLE ?auto_16212 ) ( SURFACE-AT ?auto_16206 ?auto_16210 ) ( ON ?auto_16206 ?auto_16207 ) ( CLEAR ?auto_16206 ) ( not ( = ?auto_16205 ?auto_16207 ) ) ( not ( = ?auto_16206 ?auto_16207 ) ) ( not ( = ?auto_16204 ?auto_16207 ) ) ( SURFACE-AT ?auto_16204 ?auto_16211 ) ( CLEAR ?auto_16204 ) ( IS-CRATE ?auto_16205 ) ( AVAILABLE ?auto_16208 ) ( TRUCK-AT ?auto_16214 ?auto_16213 ) ( not ( = ?auto_16213 ?auto_16211 ) ) ( not ( = ?auto_16210 ?auto_16213 ) ) ( HOIST-AT ?auto_16209 ?auto_16213 ) ( LIFTING ?auto_16209 ?auto_16205 ) ( not ( = ?auto_16208 ?auto_16209 ) ) ( not ( = ?auto_16212 ?auto_16209 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16205 ?auto_16206 )
      ( MAKE-2CRATE-VERIFY ?auto_16204 ?auto_16205 ?auto_16206 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16215 - SURFACE
      ?auto_16216 - SURFACE
      ?auto_16217 - SURFACE
      ?auto_16218 - SURFACE
    )
    :vars
    (
      ?auto_16224 - HOIST
      ?auto_16223 - PLACE
      ?auto_16219 - PLACE
      ?auto_16225 - HOIST
      ?auto_16221 - SURFACE
      ?auto_16222 - TRUCK
      ?auto_16226 - PLACE
      ?auto_16220 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16224 ?auto_16223 ) ( IS-CRATE ?auto_16218 ) ( not ( = ?auto_16217 ?auto_16218 ) ) ( not ( = ?auto_16216 ?auto_16217 ) ) ( not ( = ?auto_16216 ?auto_16218 ) ) ( not ( = ?auto_16219 ?auto_16223 ) ) ( HOIST-AT ?auto_16225 ?auto_16219 ) ( not ( = ?auto_16224 ?auto_16225 ) ) ( AVAILABLE ?auto_16225 ) ( SURFACE-AT ?auto_16218 ?auto_16219 ) ( ON ?auto_16218 ?auto_16221 ) ( CLEAR ?auto_16218 ) ( not ( = ?auto_16217 ?auto_16221 ) ) ( not ( = ?auto_16218 ?auto_16221 ) ) ( not ( = ?auto_16216 ?auto_16221 ) ) ( SURFACE-AT ?auto_16216 ?auto_16223 ) ( CLEAR ?auto_16216 ) ( IS-CRATE ?auto_16217 ) ( AVAILABLE ?auto_16224 ) ( TRUCK-AT ?auto_16222 ?auto_16226 ) ( not ( = ?auto_16226 ?auto_16223 ) ) ( not ( = ?auto_16219 ?auto_16226 ) ) ( HOIST-AT ?auto_16220 ?auto_16226 ) ( LIFTING ?auto_16220 ?auto_16217 ) ( not ( = ?auto_16224 ?auto_16220 ) ) ( not ( = ?auto_16225 ?auto_16220 ) ) ( ON ?auto_16216 ?auto_16215 ) ( not ( = ?auto_16215 ?auto_16216 ) ) ( not ( = ?auto_16215 ?auto_16217 ) ) ( not ( = ?auto_16215 ?auto_16218 ) ) ( not ( = ?auto_16215 ?auto_16221 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16216 ?auto_16217 ?auto_16218 )
      ( MAKE-3CRATE-VERIFY ?auto_16215 ?auto_16216 ?auto_16217 ?auto_16218 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16227 - SURFACE
      ?auto_16228 - SURFACE
    )
    :vars
    (
      ?auto_16235 - HOIST
      ?auto_16234 - PLACE
      ?auto_16233 - SURFACE
      ?auto_16229 - PLACE
      ?auto_16236 - HOIST
      ?auto_16231 - SURFACE
      ?auto_16232 - TRUCK
      ?auto_16237 - PLACE
      ?auto_16230 - HOIST
      ?auto_16238 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16235 ?auto_16234 ) ( IS-CRATE ?auto_16228 ) ( not ( = ?auto_16227 ?auto_16228 ) ) ( not ( = ?auto_16233 ?auto_16227 ) ) ( not ( = ?auto_16233 ?auto_16228 ) ) ( not ( = ?auto_16229 ?auto_16234 ) ) ( HOIST-AT ?auto_16236 ?auto_16229 ) ( not ( = ?auto_16235 ?auto_16236 ) ) ( AVAILABLE ?auto_16236 ) ( SURFACE-AT ?auto_16228 ?auto_16229 ) ( ON ?auto_16228 ?auto_16231 ) ( CLEAR ?auto_16228 ) ( not ( = ?auto_16227 ?auto_16231 ) ) ( not ( = ?auto_16228 ?auto_16231 ) ) ( not ( = ?auto_16233 ?auto_16231 ) ) ( SURFACE-AT ?auto_16233 ?auto_16234 ) ( CLEAR ?auto_16233 ) ( IS-CRATE ?auto_16227 ) ( AVAILABLE ?auto_16235 ) ( TRUCK-AT ?auto_16232 ?auto_16237 ) ( not ( = ?auto_16237 ?auto_16234 ) ) ( not ( = ?auto_16229 ?auto_16237 ) ) ( HOIST-AT ?auto_16230 ?auto_16237 ) ( not ( = ?auto_16235 ?auto_16230 ) ) ( not ( = ?auto_16236 ?auto_16230 ) ) ( AVAILABLE ?auto_16230 ) ( SURFACE-AT ?auto_16227 ?auto_16237 ) ( ON ?auto_16227 ?auto_16238 ) ( CLEAR ?auto_16227 ) ( not ( = ?auto_16227 ?auto_16238 ) ) ( not ( = ?auto_16228 ?auto_16238 ) ) ( not ( = ?auto_16233 ?auto_16238 ) ) ( not ( = ?auto_16231 ?auto_16238 ) ) )
    :subtasks
    ( ( !LIFT ?auto_16230 ?auto_16227 ?auto_16238 ?auto_16237 )
      ( MAKE-2CRATE ?auto_16233 ?auto_16227 ?auto_16228 )
      ( MAKE-1CRATE-VERIFY ?auto_16227 ?auto_16228 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16239 - SURFACE
      ?auto_16240 - SURFACE
      ?auto_16241 - SURFACE
    )
    :vars
    (
      ?auto_16245 - HOIST
      ?auto_16243 - PLACE
      ?auto_16247 - PLACE
      ?auto_16244 - HOIST
      ?auto_16246 - SURFACE
      ?auto_16248 - TRUCK
      ?auto_16242 - PLACE
      ?auto_16249 - HOIST
      ?auto_16250 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16245 ?auto_16243 ) ( IS-CRATE ?auto_16241 ) ( not ( = ?auto_16240 ?auto_16241 ) ) ( not ( = ?auto_16239 ?auto_16240 ) ) ( not ( = ?auto_16239 ?auto_16241 ) ) ( not ( = ?auto_16247 ?auto_16243 ) ) ( HOIST-AT ?auto_16244 ?auto_16247 ) ( not ( = ?auto_16245 ?auto_16244 ) ) ( AVAILABLE ?auto_16244 ) ( SURFACE-AT ?auto_16241 ?auto_16247 ) ( ON ?auto_16241 ?auto_16246 ) ( CLEAR ?auto_16241 ) ( not ( = ?auto_16240 ?auto_16246 ) ) ( not ( = ?auto_16241 ?auto_16246 ) ) ( not ( = ?auto_16239 ?auto_16246 ) ) ( SURFACE-AT ?auto_16239 ?auto_16243 ) ( CLEAR ?auto_16239 ) ( IS-CRATE ?auto_16240 ) ( AVAILABLE ?auto_16245 ) ( TRUCK-AT ?auto_16248 ?auto_16242 ) ( not ( = ?auto_16242 ?auto_16243 ) ) ( not ( = ?auto_16247 ?auto_16242 ) ) ( HOIST-AT ?auto_16249 ?auto_16242 ) ( not ( = ?auto_16245 ?auto_16249 ) ) ( not ( = ?auto_16244 ?auto_16249 ) ) ( AVAILABLE ?auto_16249 ) ( SURFACE-AT ?auto_16240 ?auto_16242 ) ( ON ?auto_16240 ?auto_16250 ) ( CLEAR ?auto_16240 ) ( not ( = ?auto_16240 ?auto_16250 ) ) ( not ( = ?auto_16241 ?auto_16250 ) ) ( not ( = ?auto_16239 ?auto_16250 ) ) ( not ( = ?auto_16246 ?auto_16250 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16240 ?auto_16241 )
      ( MAKE-2CRATE-VERIFY ?auto_16239 ?auto_16240 ?auto_16241 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16251 - SURFACE
      ?auto_16252 - SURFACE
      ?auto_16253 - SURFACE
      ?auto_16254 - SURFACE
    )
    :vars
    (
      ?auto_16255 - HOIST
      ?auto_16261 - PLACE
      ?auto_16257 - PLACE
      ?auto_16263 - HOIST
      ?auto_16260 - SURFACE
      ?auto_16259 - TRUCK
      ?auto_16256 - PLACE
      ?auto_16258 - HOIST
      ?auto_16262 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16255 ?auto_16261 ) ( IS-CRATE ?auto_16254 ) ( not ( = ?auto_16253 ?auto_16254 ) ) ( not ( = ?auto_16252 ?auto_16253 ) ) ( not ( = ?auto_16252 ?auto_16254 ) ) ( not ( = ?auto_16257 ?auto_16261 ) ) ( HOIST-AT ?auto_16263 ?auto_16257 ) ( not ( = ?auto_16255 ?auto_16263 ) ) ( AVAILABLE ?auto_16263 ) ( SURFACE-AT ?auto_16254 ?auto_16257 ) ( ON ?auto_16254 ?auto_16260 ) ( CLEAR ?auto_16254 ) ( not ( = ?auto_16253 ?auto_16260 ) ) ( not ( = ?auto_16254 ?auto_16260 ) ) ( not ( = ?auto_16252 ?auto_16260 ) ) ( SURFACE-AT ?auto_16252 ?auto_16261 ) ( CLEAR ?auto_16252 ) ( IS-CRATE ?auto_16253 ) ( AVAILABLE ?auto_16255 ) ( TRUCK-AT ?auto_16259 ?auto_16256 ) ( not ( = ?auto_16256 ?auto_16261 ) ) ( not ( = ?auto_16257 ?auto_16256 ) ) ( HOIST-AT ?auto_16258 ?auto_16256 ) ( not ( = ?auto_16255 ?auto_16258 ) ) ( not ( = ?auto_16263 ?auto_16258 ) ) ( AVAILABLE ?auto_16258 ) ( SURFACE-AT ?auto_16253 ?auto_16256 ) ( ON ?auto_16253 ?auto_16262 ) ( CLEAR ?auto_16253 ) ( not ( = ?auto_16253 ?auto_16262 ) ) ( not ( = ?auto_16254 ?auto_16262 ) ) ( not ( = ?auto_16252 ?auto_16262 ) ) ( not ( = ?auto_16260 ?auto_16262 ) ) ( ON ?auto_16252 ?auto_16251 ) ( not ( = ?auto_16251 ?auto_16252 ) ) ( not ( = ?auto_16251 ?auto_16253 ) ) ( not ( = ?auto_16251 ?auto_16254 ) ) ( not ( = ?auto_16251 ?auto_16260 ) ) ( not ( = ?auto_16251 ?auto_16262 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16252 ?auto_16253 ?auto_16254 )
      ( MAKE-3CRATE-VERIFY ?auto_16251 ?auto_16252 ?auto_16253 ?auto_16254 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16264 - SURFACE
      ?auto_16265 - SURFACE
    )
    :vars
    (
      ?auto_16266 - HOIST
      ?auto_16273 - PLACE
      ?auto_16272 - SURFACE
      ?auto_16268 - PLACE
      ?auto_16275 - HOIST
      ?auto_16271 - SURFACE
      ?auto_16267 - PLACE
      ?auto_16269 - HOIST
      ?auto_16274 - SURFACE
      ?auto_16270 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16266 ?auto_16273 ) ( IS-CRATE ?auto_16265 ) ( not ( = ?auto_16264 ?auto_16265 ) ) ( not ( = ?auto_16272 ?auto_16264 ) ) ( not ( = ?auto_16272 ?auto_16265 ) ) ( not ( = ?auto_16268 ?auto_16273 ) ) ( HOIST-AT ?auto_16275 ?auto_16268 ) ( not ( = ?auto_16266 ?auto_16275 ) ) ( AVAILABLE ?auto_16275 ) ( SURFACE-AT ?auto_16265 ?auto_16268 ) ( ON ?auto_16265 ?auto_16271 ) ( CLEAR ?auto_16265 ) ( not ( = ?auto_16264 ?auto_16271 ) ) ( not ( = ?auto_16265 ?auto_16271 ) ) ( not ( = ?auto_16272 ?auto_16271 ) ) ( SURFACE-AT ?auto_16272 ?auto_16273 ) ( CLEAR ?auto_16272 ) ( IS-CRATE ?auto_16264 ) ( AVAILABLE ?auto_16266 ) ( not ( = ?auto_16267 ?auto_16273 ) ) ( not ( = ?auto_16268 ?auto_16267 ) ) ( HOIST-AT ?auto_16269 ?auto_16267 ) ( not ( = ?auto_16266 ?auto_16269 ) ) ( not ( = ?auto_16275 ?auto_16269 ) ) ( AVAILABLE ?auto_16269 ) ( SURFACE-AT ?auto_16264 ?auto_16267 ) ( ON ?auto_16264 ?auto_16274 ) ( CLEAR ?auto_16264 ) ( not ( = ?auto_16264 ?auto_16274 ) ) ( not ( = ?auto_16265 ?auto_16274 ) ) ( not ( = ?auto_16272 ?auto_16274 ) ) ( not ( = ?auto_16271 ?auto_16274 ) ) ( TRUCK-AT ?auto_16270 ?auto_16273 ) )
    :subtasks
    ( ( !DRIVE ?auto_16270 ?auto_16273 ?auto_16267 )
      ( MAKE-2CRATE ?auto_16272 ?auto_16264 ?auto_16265 )
      ( MAKE-1CRATE-VERIFY ?auto_16264 ?auto_16265 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16276 - SURFACE
      ?auto_16277 - SURFACE
      ?auto_16278 - SURFACE
    )
    :vars
    (
      ?auto_16279 - HOIST
      ?auto_16281 - PLACE
      ?auto_16284 - PLACE
      ?auto_16285 - HOIST
      ?auto_16282 - SURFACE
      ?auto_16283 - PLACE
      ?auto_16280 - HOIST
      ?auto_16286 - SURFACE
      ?auto_16287 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16279 ?auto_16281 ) ( IS-CRATE ?auto_16278 ) ( not ( = ?auto_16277 ?auto_16278 ) ) ( not ( = ?auto_16276 ?auto_16277 ) ) ( not ( = ?auto_16276 ?auto_16278 ) ) ( not ( = ?auto_16284 ?auto_16281 ) ) ( HOIST-AT ?auto_16285 ?auto_16284 ) ( not ( = ?auto_16279 ?auto_16285 ) ) ( AVAILABLE ?auto_16285 ) ( SURFACE-AT ?auto_16278 ?auto_16284 ) ( ON ?auto_16278 ?auto_16282 ) ( CLEAR ?auto_16278 ) ( not ( = ?auto_16277 ?auto_16282 ) ) ( not ( = ?auto_16278 ?auto_16282 ) ) ( not ( = ?auto_16276 ?auto_16282 ) ) ( SURFACE-AT ?auto_16276 ?auto_16281 ) ( CLEAR ?auto_16276 ) ( IS-CRATE ?auto_16277 ) ( AVAILABLE ?auto_16279 ) ( not ( = ?auto_16283 ?auto_16281 ) ) ( not ( = ?auto_16284 ?auto_16283 ) ) ( HOIST-AT ?auto_16280 ?auto_16283 ) ( not ( = ?auto_16279 ?auto_16280 ) ) ( not ( = ?auto_16285 ?auto_16280 ) ) ( AVAILABLE ?auto_16280 ) ( SURFACE-AT ?auto_16277 ?auto_16283 ) ( ON ?auto_16277 ?auto_16286 ) ( CLEAR ?auto_16277 ) ( not ( = ?auto_16277 ?auto_16286 ) ) ( not ( = ?auto_16278 ?auto_16286 ) ) ( not ( = ?auto_16276 ?auto_16286 ) ) ( not ( = ?auto_16282 ?auto_16286 ) ) ( TRUCK-AT ?auto_16287 ?auto_16281 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16277 ?auto_16278 )
      ( MAKE-2CRATE-VERIFY ?auto_16276 ?auto_16277 ?auto_16278 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16288 - SURFACE
      ?auto_16289 - SURFACE
      ?auto_16290 - SURFACE
      ?auto_16291 - SURFACE
    )
    :vars
    (
      ?auto_16293 - HOIST
      ?auto_16292 - PLACE
      ?auto_16294 - PLACE
      ?auto_16295 - HOIST
      ?auto_16296 - SURFACE
      ?auto_16300 - PLACE
      ?auto_16297 - HOIST
      ?auto_16298 - SURFACE
      ?auto_16299 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16293 ?auto_16292 ) ( IS-CRATE ?auto_16291 ) ( not ( = ?auto_16290 ?auto_16291 ) ) ( not ( = ?auto_16289 ?auto_16290 ) ) ( not ( = ?auto_16289 ?auto_16291 ) ) ( not ( = ?auto_16294 ?auto_16292 ) ) ( HOIST-AT ?auto_16295 ?auto_16294 ) ( not ( = ?auto_16293 ?auto_16295 ) ) ( AVAILABLE ?auto_16295 ) ( SURFACE-AT ?auto_16291 ?auto_16294 ) ( ON ?auto_16291 ?auto_16296 ) ( CLEAR ?auto_16291 ) ( not ( = ?auto_16290 ?auto_16296 ) ) ( not ( = ?auto_16291 ?auto_16296 ) ) ( not ( = ?auto_16289 ?auto_16296 ) ) ( SURFACE-AT ?auto_16289 ?auto_16292 ) ( CLEAR ?auto_16289 ) ( IS-CRATE ?auto_16290 ) ( AVAILABLE ?auto_16293 ) ( not ( = ?auto_16300 ?auto_16292 ) ) ( not ( = ?auto_16294 ?auto_16300 ) ) ( HOIST-AT ?auto_16297 ?auto_16300 ) ( not ( = ?auto_16293 ?auto_16297 ) ) ( not ( = ?auto_16295 ?auto_16297 ) ) ( AVAILABLE ?auto_16297 ) ( SURFACE-AT ?auto_16290 ?auto_16300 ) ( ON ?auto_16290 ?auto_16298 ) ( CLEAR ?auto_16290 ) ( not ( = ?auto_16290 ?auto_16298 ) ) ( not ( = ?auto_16291 ?auto_16298 ) ) ( not ( = ?auto_16289 ?auto_16298 ) ) ( not ( = ?auto_16296 ?auto_16298 ) ) ( TRUCK-AT ?auto_16299 ?auto_16292 ) ( ON ?auto_16289 ?auto_16288 ) ( not ( = ?auto_16288 ?auto_16289 ) ) ( not ( = ?auto_16288 ?auto_16290 ) ) ( not ( = ?auto_16288 ?auto_16291 ) ) ( not ( = ?auto_16288 ?auto_16296 ) ) ( not ( = ?auto_16288 ?auto_16298 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16289 ?auto_16290 ?auto_16291 )
      ( MAKE-3CRATE-VERIFY ?auto_16288 ?auto_16289 ?auto_16290 ?auto_16291 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16301 - SURFACE
      ?auto_16302 - SURFACE
    )
    :vars
    (
      ?auto_16304 - HOIST
      ?auto_16303 - PLACE
      ?auto_16312 - SURFACE
      ?auto_16305 - PLACE
      ?auto_16306 - HOIST
      ?auto_16307 - SURFACE
      ?auto_16311 - PLACE
      ?auto_16308 - HOIST
      ?auto_16309 - SURFACE
      ?auto_16310 - TRUCK
      ?auto_16313 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16304 ?auto_16303 ) ( IS-CRATE ?auto_16302 ) ( not ( = ?auto_16301 ?auto_16302 ) ) ( not ( = ?auto_16312 ?auto_16301 ) ) ( not ( = ?auto_16312 ?auto_16302 ) ) ( not ( = ?auto_16305 ?auto_16303 ) ) ( HOIST-AT ?auto_16306 ?auto_16305 ) ( not ( = ?auto_16304 ?auto_16306 ) ) ( AVAILABLE ?auto_16306 ) ( SURFACE-AT ?auto_16302 ?auto_16305 ) ( ON ?auto_16302 ?auto_16307 ) ( CLEAR ?auto_16302 ) ( not ( = ?auto_16301 ?auto_16307 ) ) ( not ( = ?auto_16302 ?auto_16307 ) ) ( not ( = ?auto_16312 ?auto_16307 ) ) ( IS-CRATE ?auto_16301 ) ( not ( = ?auto_16311 ?auto_16303 ) ) ( not ( = ?auto_16305 ?auto_16311 ) ) ( HOIST-AT ?auto_16308 ?auto_16311 ) ( not ( = ?auto_16304 ?auto_16308 ) ) ( not ( = ?auto_16306 ?auto_16308 ) ) ( AVAILABLE ?auto_16308 ) ( SURFACE-AT ?auto_16301 ?auto_16311 ) ( ON ?auto_16301 ?auto_16309 ) ( CLEAR ?auto_16301 ) ( not ( = ?auto_16301 ?auto_16309 ) ) ( not ( = ?auto_16302 ?auto_16309 ) ) ( not ( = ?auto_16312 ?auto_16309 ) ) ( not ( = ?auto_16307 ?auto_16309 ) ) ( TRUCK-AT ?auto_16310 ?auto_16303 ) ( SURFACE-AT ?auto_16313 ?auto_16303 ) ( CLEAR ?auto_16313 ) ( LIFTING ?auto_16304 ?auto_16312 ) ( IS-CRATE ?auto_16312 ) ( not ( = ?auto_16313 ?auto_16312 ) ) ( not ( = ?auto_16301 ?auto_16313 ) ) ( not ( = ?auto_16302 ?auto_16313 ) ) ( not ( = ?auto_16307 ?auto_16313 ) ) ( not ( = ?auto_16309 ?auto_16313 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16313 ?auto_16312 )
      ( MAKE-2CRATE ?auto_16312 ?auto_16301 ?auto_16302 )
      ( MAKE-1CRATE-VERIFY ?auto_16301 ?auto_16302 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16314 - SURFACE
      ?auto_16315 - SURFACE
      ?auto_16316 - SURFACE
    )
    :vars
    (
      ?auto_16318 - HOIST
      ?auto_16322 - PLACE
      ?auto_16323 - PLACE
      ?auto_16319 - HOIST
      ?auto_16320 - SURFACE
      ?auto_16326 - PLACE
      ?auto_16321 - HOIST
      ?auto_16325 - SURFACE
      ?auto_16317 - TRUCK
      ?auto_16324 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16318 ?auto_16322 ) ( IS-CRATE ?auto_16316 ) ( not ( = ?auto_16315 ?auto_16316 ) ) ( not ( = ?auto_16314 ?auto_16315 ) ) ( not ( = ?auto_16314 ?auto_16316 ) ) ( not ( = ?auto_16323 ?auto_16322 ) ) ( HOIST-AT ?auto_16319 ?auto_16323 ) ( not ( = ?auto_16318 ?auto_16319 ) ) ( AVAILABLE ?auto_16319 ) ( SURFACE-AT ?auto_16316 ?auto_16323 ) ( ON ?auto_16316 ?auto_16320 ) ( CLEAR ?auto_16316 ) ( not ( = ?auto_16315 ?auto_16320 ) ) ( not ( = ?auto_16316 ?auto_16320 ) ) ( not ( = ?auto_16314 ?auto_16320 ) ) ( IS-CRATE ?auto_16315 ) ( not ( = ?auto_16326 ?auto_16322 ) ) ( not ( = ?auto_16323 ?auto_16326 ) ) ( HOIST-AT ?auto_16321 ?auto_16326 ) ( not ( = ?auto_16318 ?auto_16321 ) ) ( not ( = ?auto_16319 ?auto_16321 ) ) ( AVAILABLE ?auto_16321 ) ( SURFACE-AT ?auto_16315 ?auto_16326 ) ( ON ?auto_16315 ?auto_16325 ) ( CLEAR ?auto_16315 ) ( not ( = ?auto_16315 ?auto_16325 ) ) ( not ( = ?auto_16316 ?auto_16325 ) ) ( not ( = ?auto_16314 ?auto_16325 ) ) ( not ( = ?auto_16320 ?auto_16325 ) ) ( TRUCK-AT ?auto_16317 ?auto_16322 ) ( SURFACE-AT ?auto_16324 ?auto_16322 ) ( CLEAR ?auto_16324 ) ( LIFTING ?auto_16318 ?auto_16314 ) ( IS-CRATE ?auto_16314 ) ( not ( = ?auto_16324 ?auto_16314 ) ) ( not ( = ?auto_16315 ?auto_16324 ) ) ( not ( = ?auto_16316 ?auto_16324 ) ) ( not ( = ?auto_16320 ?auto_16324 ) ) ( not ( = ?auto_16325 ?auto_16324 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16315 ?auto_16316 )
      ( MAKE-2CRATE-VERIFY ?auto_16314 ?auto_16315 ?auto_16316 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16327 - SURFACE
      ?auto_16328 - SURFACE
      ?auto_16329 - SURFACE
      ?auto_16330 - SURFACE
    )
    :vars
    (
      ?auto_16336 - HOIST
      ?auto_16335 - PLACE
      ?auto_16339 - PLACE
      ?auto_16334 - HOIST
      ?auto_16333 - SURFACE
      ?auto_16338 - PLACE
      ?auto_16331 - HOIST
      ?auto_16332 - SURFACE
      ?auto_16337 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16336 ?auto_16335 ) ( IS-CRATE ?auto_16330 ) ( not ( = ?auto_16329 ?auto_16330 ) ) ( not ( = ?auto_16328 ?auto_16329 ) ) ( not ( = ?auto_16328 ?auto_16330 ) ) ( not ( = ?auto_16339 ?auto_16335 ) ) ( HOIST-AT ?auto_16334 ?auto_16339 ) ( not ( = ?auto_16336 ?auto_16334 ) ) ( AVAILABLE ?auto_16334 ) ( SURFACE-AT ?auto_16330 ?auto_16339 ) ( ON ?auto_16330 ?auto_16333 ) ( CLEAR ?auto_16330 ) ( not ( = ?auto_16329 ?auto_16333 ) ) ( not ( = ?auto_16330 ?auto_16333 ) ) ( not ( = ?auto_16328 ?auto_16333 ) ) ( IS-CRATE ?auto_16329 ) ( not ( = ?auto_16338 ?auto_16335 ) ) ( not ( = ?auto_16339 ?auto_16338 ) ) ( HOIST-AT ?auto_16331 ?auto_16338 ) ( not ( = ?auto_16336 ?auto_16331 ) ) ( not ( = ?auto_16334 ?auto_16331 ) ) ( AVAILABLE ?auto_16331 ) ( SURFACE-AT ?auto_16329 ?auto_16338 ) ( ON ?auto_16329 ?auto_16332 ) ( CLEAR ?auto_16329 ) ( not ( = ?auto_16329 ?auto_16332 ) ) ( not ( = ?auto_16330 ?auto_16332 ) ) ( not ( = ?auto_16328 ?auto_16332 ) ) ( not ( = ?auto_16333 ?auto_16332 ) ) ( TRUCK-AT ?auto_16337 ?auto_16335 ) ( SURFACE-AT ?auto_16327 ?auto_16335 ) ( CLEAR ?auto_16327 ) ( LIFTING ?auto_16336 ?auto_16328 ) ( IS-CRATE ?auto_16328 ) ( not ( = ?auto_16327 ?auto_16328 ) ) ( not ( = ?auto_16329 ?auto_16327 ) ) ( not ( = ?auto_16330 ?auto_16327 ) ) ( not ( = ?auto_16333 ?auto_16327 ) ) ( not ( = ?auto_16332 ?auto_16327 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16328 ?auto_16329 ?auto_16330 )
      ( MAKE-3CRATE-VERIFY ?auto_16327 ?auto_16328 ?auto_16329 ?auto_16330 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16340 - SURFACE
      ?auto_16341 - SURFACE
    )
    :vars
    (
      ?auto_16347 - HOIST
      ?auto_16346 - PLACE
      ?auto_16349 - SURFACE
      ?auto_16352 - PLACE
      ?auto_16345 - HOIST
      ?auto_16344 - SURFACE
      ?auto_16351 - PLACE
      ?auto_16342 - HOIST
      ?auto_16343 - SURFACE
      ?auto_16350 - TRUCK
      ?auto_16348 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16347 ?auto_16346 ) ( IS-CRATE ?auto_16341 ) ( not ( = ?auto_16340 ?auto_16341 ) ) ( not ( = ?auto_16349 ?auto_16340 ) ) ( not ( = ?auto_16349 ?auto_16341 ) ) ( not ( = ?auto_16352 ?auto_16346 ) ) ( HOIST-AT ?auto_16345 ?auto_16352 ) ( not ( = ?auto_16347 ?auto_16345 ) ) ( AVAILABLE ?auto_16345 ) ( SURFACE-AT ?auto_16341 ?auto_16352 ) ( ON ?auto_16341 ?auto_16344 ) ( CLEAR ?auto_16341 ) ( not ( = ?auto_16340 ?auto_16344 ) ) ( not ( = ?auto_16341 ?auto_16344 ) ) ( not ( = ?auto_16349 ?auto_16344 ) ) ( IS-CRATE ?auto_16340 ) ( not ( = ?auto_16351 ?auto_16346 ) ) ( not ( = ?auto_16352 ?auto_16351 ) ) ( HOIST-AT ?auto_16342 ?auto_16351 ) ( not ( = ?auto_16347 ?auto_16342 ) ) ( not ( = ?auto_16345 ?auto_16342 ) ) ( AVAILABLE ?auto_16342 ) ( SURFACE-AT ?auto_16340 ?auto_16351 ) ( ON ?auto_16340 ?auto_16343 ) ( CLEAR ?auto_16340 ) ( not ( = ?auto_16340 ?auto_16343 ) ) ( not ( = ?auto_16341 ?auto_16343 ) ) ( not ( = ?auto_16349 ?auto_16343 ) ) ( not ( = ?auto_16344 ?auto_16343 ) ) ( TRUCK-AT ?auto_16350 ?auto_16346 ) ( SURFACE-AT ?auto_16348 ?auto_16346 ) ( CLEAR ?auto_16348 ) ( IS-CRATE ?auto_16349 ) ( not ( = ?auto_16348 ?auto_16349 ) ) ( not ( = ?auto_16340 ?auto_16348 ) ) ( not ( = ?auto_16341 ?auto_16348 ) ) ( not ( = ?auto_16344 ?auto_16348 ) ) ( not ( = ?auto_16343 ?auto_16348 ) ) ( AVAILABLE ?auto_16347 ) ( IN ?auto_16349 ?auto_16350 ) )
    :subtasks
    ( ( !UNLOAD ?auto_16347 ?auto_16349 ?auto_16350 ?auto_16346 )
      ( MAKE-2CRATE ?auto_16349 ?auto_16340 ?auto_16341 )
      ( MAKE-1CRATE-VERIFY ?auto_16340 ?auto_16341 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16353 - SURFACE
      ?auto_16354 - SURFACE
      ?auto_16355 - SURFACE
    )
    :vars
    (
      ?auto_16362 - HOIST
      ?auto_16364 - PLACE
      ?auto_16358 - PLACE
      ?auto_16359 - HOIST
      ?auto_16360 - SURFACE
      ?auto_16365 - PLACE
      ?auto_16361 - HOIST
      ?auto_16356 - SURFACE
      ?auto_16363 - TRUCK
      ?auto_16357 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16362 ?auto_16364 ) ( IS-CRATE ?auto_16355 ) ( not ( = ?auto_16354 ?auto_16355 ) ) ( not ( = ?auto_16353 ?auto_16354 ) ) ( not ( = ?auto_16353 ?auto_16355 ) ) ( not ( = ?auto_16358 ?auto_16364 ) ) ( HOIST-AT ?auto_16359 ?auto_16358 ) ( not ( = ?auto_16362 ?auto_16359 ) ) ( AVAILABLE ?auto_16359 ) ( SURFACE-AT ?auto_16355 ?auto_16358 ) ( ON ?auto_16355 ?auto_16360 ) ( CLEAR ?auto_16355 ) ( not ( = ?auto_16354 ?auto_16360 ) ) ( not ( = ?auto_16355 ?auto_16360 ) ) ( not ( = ?auto_16353 ?auto_16360 ) ) ( IS-CRATE ?auto_16354 ) ( not ( = ?auto_16365 ?auto_16364 ) ) ( not ( = ?auto_16358 ?auto_16365 ) ) ( HOIST-AT ?auto_16361 ?auto_16365 ) ( not ( = ?auto_16362 ?auto_16361 ) ) ( not ( = ?auto_16359 ?auto_16361 ) ) ( AVAILABLE ?auto_16361 ) ( SURFACE-AT ?auto_16354 ?auto_16365 ) ( ON ?auto_16354 ?auto_16356 ) ( CLEAR ?auto_16354 ) ( not ( = ?auto_16354 ?auto_16356 ) ) ( not ( = ?auto_16355 ?auto_16356 ) ) ( not ( = ?auto_16353 ?auto_16356 ) ) ( not ( = ?auto_16360 ?auto_16356 ) ) ( TRUCK-AT ?auto_16363 ?auto_16364 ) ( SURFACE-AT ?auto_16357 ?auto_16364 ) ( CLEAR ?auto_16357 ) ( IS-CRATE ?auto_16353 ) ( not ( = ?auto_16357 ?auto_16353 ) ) ( not ( = ?auto_16354 ?auto_16357 ) ) ( not ( = ?auto_16355 ?auto_16357 ) ) ( not ( = ?auto_16360 ?auto_16357 ) ) ( not ( = ?auto_16356 ?auto_16357 ) ) ( AVAILABLE ?auto_16362 ) ( IN ?auto_16353 ?auto_16363 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16354 ?auto_16355 )
      ( MAKE-2CRATE-VERIFY ?auto_16353 ?auto_16354 ?auto_16355 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16366 - SURFACE
      ?auto_16367 - SURFACE
      ?auto_16368 - SURFACE
      ?auto_16369 - SURFACE
    )
    :vars
    (
      ?auto_16375 - HOIST
      ?auto_16373 - PLACE
      ?auto_16376 - PLACE
      ?auto_16374 - HOIST
      ?auto_16377 - SURFACE
      ?auto_16372 - PLACE
      ?auto_16378 - HOIST
      ?auto_16370 - SURFACE
      ?auto_16371 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16375 ?auto_16373 ) ( IS-CRATE ?auto_16369 ) ( not ( = ?auto_16368 ?auto_16369 ) ) ( not ( = ?auto_16367 ?auto_16368 ) ) ( not ( = ?auto_16367 ?auto_16369 ) ) ( not ( = ?auto_16376 ?auto_16373 ) ) ( HOIST-AT ?auto_16374 ?auto_16376 ) ( not ( = ?auto_16375 ?auto_16374 ) ) ( AVAILABLE ?auto_16374 ) ( SURFACE-AT ?auto_16369 ?auto_16376 ) ( ON ?auto_16369 ?auto_16377 ) ( CLEAR ?auto_16369 ) ( not ( = ?auto_16368 ?auto_16377 ) ) ( not ( = ?auto_16369 ?auto_16377 ) ) ( not ( = ?auto_16367 ?auto_16377 ) ) ( IS-CRATE ?auto_16368 ) ( not ( = ?auto_16372 ?auto_16373 ) ) ( not ( = ?auto_16376 ?auto_16372 ) ) ( HOIST-AT ?auto_16378 ?auto_16372 ) ( not ( = ?auto_16375 ?auto_16378 ) ) ( not ( = ?auto_16374 ?auto_16378 ) ) ( AVAILABLE ?auto_16378 ) ( SURFACE-AT ?auto_16368 ?auto_16372 ) ( ON ?auto_16368 ?auto_16370 ) ( CLEAR ?auto_16368 ) ( not ( = ?auto_16368 ?auto_16370 ) ) ( not ( = ?auto_16369 ?auto_16370 ) ) ( not ( = ?auto_16367 ?auto_16370 ) ) ( not ( = ?auto_16377 ?auto_16370 ) ) ( TRUCK-AT ?auto_16371 ?auto_16373 ) ( SURFACE-AT ?auto_16366 ?auto_16373 ) ( CLEAR ?auto_16366 ) ( IS-CRATE ?auto_16367 ) ( not ( = ?auto_16366 ?auto_16367 ) ) ( not ( = ?auto_16368 ?auto_16366 ) ) ( not ( = ?auto_16369 ?auto_16366 ) ) ( not ( = ?auto_16377 ?auto_16366 ) ) ( not ( = ?auto_16370 ?auto_16366 ) ) ( AVAILABLE ?auto_16375 ) ( IN ?auto_16367 ?auto_16371 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16367 ?auto_16368 ?auto_16369 )
      ( MAKE-3CRATE-VERIFY ?auto_16366 ?auto_16367 ?auto_16368 ?auto_16369 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16379 - SURFACE
      ?auto_16380 - SURFACE
    )
    :vars
    (
      ?auto_16387 - HOIST
      ?auto_16385 - PLACE
      ?auto_16382 - SURFACE
      ?auto_16388 - PLACE
      ?auto_16386 - HOIST
      ?auto_16389 - SURFACE
      ?auto_16384 - PLACE
      ?auto_16390 - HOIST
      ?auto_16381 - SURFACE
      ?auto_16391 - SURFACE
      ?auto_16383 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16387 ?auto_16385 ) ( IS-CRATE ?auto_16380 ) ( not ( = ?auto_16379 ?auto_16380 ) ) ( not ( = ?auto_16382 ?auto_16379 ) ) ( not ( = ?auto_16382 ?auto_16380 ) ) ( not ( = ?auto_16388 ?auto_16385 ) ) ( HOIST-AT ?auto_16386 ?auto_16388 ) ( not ( = ?auto_16387 ?auto_16386 ) ) ( AVAILABLE ?auto_16386 ) ( SURFACE-AT ?auto_16380 ?auto_16388 ) ( ON ?auto_16380 ?auto_16389 ) ( CLEAR ?auto_16380 ) ( not ( = ?auto_16379 ?auto_16389 ) ) ( not ( = ?auto_16380 ?auto_16389 ) ) ( not ( = ?auto_16382 ?auto_16389 ) ) ( IS-CRATE ?auto_16379 ) ( not ( = ?auto_16384 ?auto_16385 ) ) ( not ( = ?auto_16388 ?auto_16384 ) ) ( HOIST-AT ?auto_16390 ?auto_16384 ) ( not ( = ?auto_16387 ?auto_16390 ) ) ( not ( = ?auto_16386 ?auto_16390 ) ) ( AVAILABLE ?auto_16390 ) ( SURFACE-AT ?auto_16379 ?auto_16384 ) ( ON ?auto_16379 ?auto_16381 ) ( CLEAR ?auto_16379 ) ( not ( = ?auto_16379 ?auto_16381 ) ) ( not ( = ?auto_16380 ?auto_16381 ) ) ( not ( = ?auto_16382 ?auto_16381 ) ) ( not ( = ?auto_16389 ?auto_16381 ) ) ( SURFACE-AT ?auto_16391 ?auto_16385 ) ( CLEAR ?auto_16391 ) ( IS-CRATE ?auto_16382 ) ( not ( = ?auto_16391 ?auto_16382 ) ) ( not ( = ?auto_16379 ?auto_16391 ) ) ( not ( = ?auto_16380 ?auto_16391 ) ) ( not ( = ?auto_16389 ?auto_16391 ) ) ( not ( = ?auto_16381 ?auto_16391 ) ) ( AVAILABLE ?auto_16387 ) ( IN ?auto_16382 ?auto_16383 ) ( TRUCK-AT ?auto_16383 ?auto_16384 ) )
    :subtasks
    ( ( !DRIVE ?auto_16383 ?auto_16384 ?auto_16385 )
      ( MAKE-2CRATE ?auto_16382 ?auto_16379 ?auto_16380 )
      ( MAKE-1CRATE-VERIFY ?auto_16379 ?auto_16380 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16392 - SURFACE
      ?auto_16393 - SURFACE
      ?auto_16394 - SURFACE
    )
    :vars
    (
      ?auto_16399 - HOIST
      ?auto_16404 - PLACE
      ?auto_16401 - PLACE
      ?auto_16400 - HOIST
      ?auto_16396 - SURFACE
      ?auto_16397 - PLACE
      ?auto_16395 - HOIST
      ?auto_16403 - SURFACE
      ?auto_16398 - SURFACE
      ?auto_16402 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16399 ?auto_16404 ) ( IS-CRATE ?auto_16394 ) ( not ( = ?auto_16393 ?auto_16394 ) ) ( not ( = ?auto_16392 ?auto_16393 ) ) ( not ( = ?auto_16392 ?auto_16394 ) ) ( not ( = ?auto_16401 ?auto_16404 ) ) ( HOIST-AT ?auto_16400 ?auto_16401 ) ( not ( = ?auto_16399 ?auto_16400 ) ) ( AVAILABLE ?auto_16400 ) ( SURFACE-AT ?auto_16394 ?auto_16401 ) ( ON ?auto_16394 ?auto_16396 ) ( CLEAR ?auto_16394 ) ( not ( = ?auto_16393 ?auto_16396 ) ) ( not ( = ?auto_16394 ?auto_16396 ) ) ( not ( = ?auto_16392 ?auto_16396 ) ) ( IS-CRATE ?auto_16393 ) ( not ( = ?auto_16397 ?auto_16404 ) ) ( not ( = ?auto_16401 ?auto_16397 ) ) ( HOIST-AT ?auto_16395 ?auto_16397 ) ( not ( = ?auto_16399 ?auto_16395 ) ) ( not ( = ?auto_16400 ?auto_16395 ) ) ( AVAILABLE ?auto_16395 ) ( SURFACE-AT ?auto_16393 ?auto_16397 ) ( ON ?auto_16393 ?auto_16403 ) ( CLEAR ?auto_16393 ) ( not ( = ?auto_16393 ?auto_16403 ) ) ( not ( = ?auto_16394 ?auto_16403 ) ) ( not ( = ?auto_16392 ?auto_16403 ) ) ( not ( = ?auto_16396 ?auto_16403 ) ) ( SURFACE-AT ?auto_16398 ?auto_16404 ) ( CLEAR ?auto_16398 ) ( IS-CRATE ?auto_16392 ) ( not ( = ?auto_16398 ?auto_16392 ) ) ( not ( = ?auto_16393 ?auto_16398 ) ) ( not ( = ?auto_16394 ?auto_16398 ) ) ( not ( = ?auto_16396 ?auto_16398 ) ) ( not ( = ?auto_16403 ?auto_16398 ) ) ( AVAILABLE ?auto_16399 ) ( IN ?auto_16392 ?auto_16402 ) ( TRUCK-AT ?auto_16402 ?auto_16397 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16393 ?auto_16394 )
      ( MAKE-2CRATE-VERIFY ?auto_16392 ?auto_16393 ?auto_16394 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16405 - SURFACE
      ?auto_16406 - SURFACE
      ?auto_16407 - SURFACE
      ?auto_16408 - SURFACE
    )
    :vars
    (
      ?auto_16417 - HOIST
      ?auto_16416 - PLACE
      ?auto_16412 - PLACE
      ?auto_16411 - HOIST
      ?auto_16415 - SURFACE
      ?auto_16409 - PLACE
      ?auto_16410 - HOIST
      ?auto_16413 - SURFACE
      ?auto_16414 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16417 ?auto_16416 ) ( IS-CRATE ?auto_16408 ) ( not ( = ?auto_16407 ?auto_16408 ) ) ( not ( = ?auto_16406 ?auto_16407 ) ) ( not ( = ?auto_16406 ?auto_16408 ) ) ( not ( = ?auto_16412 ?auto_16416 ) ) ( HOIST-AT ?auto_16411 ?auto_16412 ) ( not ( = ?auto_16417 ?auto_16411 ) ) ( AVAILABLE ?auto_16411 ) ( SURFACE-AT ?auto_16408 ?auto_16412 ) ( ON ?auto_16408 ?auto_16415 ) ( CLEAR ?auto_16408 ) ( not ( = ?auto_16407 ?auto_16415 ) ) ( not ( = ?auto_16408 ?auto_16415 ) ) ( not ( = ?auto_16406 ?auto_16415 ) ) ( IS-CRATE ?auto_16407 ) ( not ( = ?auto_16409 ?auto_16416 ) ) ( not ( = ?auto_16412 ?auto_16409 ) ) ( HOIST-AT ?auto_16410 ?auto_16409 ) ( not ( = ?auto_16417 ?auto_16410 ) ) ( not ( = ?auto_16411 ?auto_16410 ) ) ( AVAILABLE ?auto_16410 ) ( SURFACE-AT ?auto_16407 ?auto_16409 ) ( ON ?auto_16407 ?auto_16413 ) ( CLEAR ?auto_16407 ) ( not ( = ?auto_16407 ?auto_16413 ) ) ( not ( = ?auto_16408 ?auto_16413 ) ) ( not ( = ?auto_16406 ?auto_16413 ) ) ( not ( = ?auto_16415 ?auto_16413 ) ) ( SURFACE-AT ?auto_16405 ?auto_16416 ) ( CLEAR ?auto_16405 ) ( IS-CRATE ?auto_16406 ) ( not ( = ?auto_16405 ?auto_16406 ) ) ( not ( = ?auto_16407 ?auto_16405 ) ) ( not ( = ?auto_16408 ?auto_16405 ) ) ( not ( = ?auto_16415 ?auto_16405 ) ) ( not ( = ?auto_16413 ?auto_16405 ) ) ( AVAILABLE ?auto_16417 ) ( IN ?auto_16406 ?auto_16414 ) ( TRUCK-AT ?auto_16414 ?auto_16409 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16406 ?auto_16407 ?auto_16408 )
      ( MAKE-3CRATE-VERIFY ?auto_16405 ?auto_16406 ?auto_16407 ?auto_16408 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16418 - SURFACE
      ?auto_16419 - SURFACE
    )
    :vars
    (
      ?auto_16430 - HOIST
      ?auto_16429 - PLACE
      ?auto_16420 - SURFACE
      ?auto_16424 - PLACE
      ?auto_16423 - HOIST
      ?auto_16427 - SURFACE
      ?auto_16421 - PLACE
      ?auto_16422 - HOIST
      ?auto_16425 - SURFACE
      ?auto_16428 - SURFACE
      ?auto_16426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16430 ?auto_16429 ) ( IS-CRATE ?auto_16419 ) ( not ( = ?auto_16418 ?auto_16419 ) ) ( not ( = ?auto_16420 ?auto_16418 ) ) ( not ( = ?auto_16420 ?auto_16419 ) ) ( not ( = ?auto_16424 ?auto_16429 ) ) ( HOIST-AT ?auto_16423 ?auto_16424 ) ( not ( = ?auto_16430 ?auto_16423 ) ) ( AVAILABLE ?auto_16423 ) ( SURFACE-AT ?auto_16419 ?auto_16424 ) ( ON ?auto_16419 ?auto_16427 ) ( CLEAR ?auto_16419 ) ( not ( = ?auto_16418 ?auto_16427 ) ) ( not ( = ?auto_16419 ?auto_16427 ) ) ( not ( = ?auto_16420 ?auto_16427 ) ) ( IS-CRATE ?auto_16418 ) ( not ( = ?auto_16421 ?auto_16429 ) ) ( not ( = ?auto_16424 ?auto_16421 ) ) ( HOIST-AT ?auto_16422 ?auto_16421 ) ( not ( = ?auto_16430 ?auto_16422 ) ) ( not ( = ?auto_16423 ?auto_16422 ) ) ( SURFACE-AT ?auto_16418 ?auto_16421 ) ( ON ?auto_16418 ?auto_16425 ) ( CLEAR ?auto_16418 ) ( not ( = ?auto_16418 ?auto_16425 ) ) ( not ( = ?auto_16419 ?auto_16425 ) ) ( not ( = ?auto_16420 ?auto_16425 ) ) ( not ( = ?auto_16427 ?auto_16425 ) ) ( SURFACE-AT ?auto_16428 ?auto_16429 ) ( CLEAR ?auto_16428 ) ( IS-CRATE ?auto_16420 ) ( not ( = ?auto_16428 ?auto_16420 ) ) ( not ( = ?auto_16418 ?auto_16428 ) ) ( not ( = ?auto_16419 ?auto_16428 ) ) ( not ( = ?auto_16427 ?auto_16428 ) ) ( not ( = ?auto_16425 ?auto_16428 ) ) ( AVAILABLE ?auto_16430 ) ( TRUCK-AT ?auto_16426 ?auto_16421 ) ( LIFTING ?auto_16422 ?auto_16420 ) )
    :subtasks
    ( ( !LOAD ?auto_16422 ?auto_16420 ?auto_16426 ?auto_16421 )
      ( MAKE-2CRATE ?auto_16420 ?auto_16418 ?auto_16419 )
      ( MAKE-1CRATE-VERIFY ?auto_16418 ?auto_16419 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16431 - SURFACE
      ?auto_16432 - SURFACE
      ?auto_16433 - SURFACE
    )
    :vars
    (
      ?auto_16442 - HOIST
      ?auto_16443 - PLACE
      ?auto_16436 - PLACE
      ?auto_16434 - HOIST
      ?auto_16438 - SURFACE
      ?auto_16441 - PLACE
      ?auto_16439 - HOIST
      ?auto_16435 - SURFACE
      ?auto_16437 - SURFACE
      ?auto_16440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16442 ?auto_16443 ) ( IS-CRATE ?auto_16433 ) ( not ( = ?auto_16432 ?auto_16433 ) ) ( not ( = ?auto_16431 ?auto_16432 ) ) ( not ( = ?auto_16431 ?auto_16433 ) ) ( not ( = ?auto_16436 ?auto_16443 ) ) ( HOIST-AT ?auto_16434 ?auto_16436 ) ( not ( = ?auto_16442 ?auto_16434 ) ) ( AVAILABLE ?auto_16434 ) ( SURFACE-AT ?auto_16433 ?auto_16436 ) ( ON ?auto_16433 ?auto_16438 ) ( CLEAR ?auto_16433 ) ( not ( = ?auto_16432 ?auto_16438 ) ) ( not ( = ?auto_16433 ?auto_16438 ) ) ( not ( = ?auto_16431 ?auto_16438 ) ) ( IS-CRATE ?auto_16432 ) ( not ( = ?auto_16441 ?auto_16443 ) ) ( not ( = ?auto_16436 ?auto_16441 ) ) ( HOIST-AT ?auto_16439 ?auto_16441 ) ( not ( = ?auto_16442 ?auto_16439 ) ) ( not ( = ?auto_16434 ?auto_16439 ) ) ( SURFACE-AT ?auto_16432 ?auto_16441 ) ( ON ?auto_16432 ?auto_16435 ) ( CLEAR ?auto_16432 ) ( not ( = ?auto_16432 ?auto_16435 ) ) ( not ( = ?auto_16433 ?auto_16435 ) ) ( not ( = ?auto_16431 ?auto_16435 ) ) ( not ( = ?auto_16438 ?auto_16435 ) ) ( SURFACE-AT ?auto_16437 ?auto_16443 ) ( CLEAR ?auto_16437 ) ( IS-CRATE ?auto_16431 ) ( not ( = ?auto_16437 ?auto_16431 ) ) ( not ( = ?auto_16432 ?auto_16437 ) ) ( not ( = ?auto_16433 ?auto_16437 ) ) ( not ( = ?auto_16438 ?auto_16437 ) ) ( not ( = ?auto_16435 ?auto_16437 ) ) ( AVAILABLE ?auto_16442 ) ( TRUCK-AT ?auto_16440 ?auto_16441 ) ( LIFTING ?auto_16439 ?auto_16431 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16432 ?auto_16433 )
      ( MAKE-2CRATE-VERIFY ?auto_16431 ?auto_16432 ?auto_16433 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16444 - SURFACE
      ?auto_16445 - SURFACE
      ?auto_16446 - SURFACE
      ?auto_16447 - SURFACE
    )
    :vars
    (
      ?auto_16449 - HOIST
      ?auto_16456 - PLACE
      ?auto_16451 - PLACE
      ?auto_16450 - HOIST
      ?auto_16448 - SURFACE
      ?auto_16453 - PLACE
      ?auto_16455 - HOIST
      ?auto_16454 - SURFACE
      ?auto_16452 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16449 ?auto_16456 ) ( IS-CRATE ?auto_16447 ) ( not ( = ?auto_16446 ?auto_16447 ) ) ( not ( = ?auto_16445 ?auto_16446 ) ) ( not ( = ?auto_16445 ?auto_16447 ) ) ( not ( = ?auto_16451 ?auto_16456 ) ) ( HOIST-AT ?auto_16450 ?auto_16451 ) ( not ( = ?auto_16449 ?auto_16450 ) ) ( AVAILABLE ?auto_16450 ) ( SURFACE-AT ?auto_16447 ?auto_16451 ) ( ON ?auto_16447 ?auto_16448 ) ( CLEAR ?auto_16447 ) ( not ( = ?auto_16446 ?auto_16448 ) ) ( not ( = ?auto_16447 ?auto_16448 ) ) ( not ( = ?auto_16445 ?auto_16448 ) ) ( IS-CRATE ?auto_16446 ) ( not ( = ?auto_16453 ?auto_16456 ) ) ( not ( = ?auto_16451 ?auto_16453 ) ) ( HOIST-AT ?auto_16455 ?auto_16453 ) ( not ( = ?auto_16449 ?auto_16455 ) ) ( not ( = ?auto_16450 ?auto_16455 ) ) ( SURFACE-AT ?auto_16446 ?auto_16453 ) ( ON ?auto_16446 ?auto_16454 ) ( CLEAR ?auto_16446 ) ( not ( = ?auto_16446 ?auto_16454 ) ) ( not ( = ?auto_16447 ?auto_16454 ) ) ( not ( = ?auto_16445 ?auto_16454 ) ) ( not ( = ?auto_16448 ?auto_16454 ) ) ( SURFACE-AT ?auto_16444 ?auto_16456 ) ( CLEAR ?auto_16444 ) ( IS-CRATE ?auto_16445 ) ( not ( = ?auto_16444 ?auto_16445 ) ) ( not ( = ?auto_16446 ?auto_16444 ) ) ( not ( = ?auto_16447 ?auto_16444 ) ) ( not ( = ?auto_16448 ?auto_16444 ) ) ( not ( = ?auto_16454 ?auto_16444 ) ) ( AVAILABLE ?auto_16449 ) ( TRUCK-AT ?auto_16452 ?auto_16453 ) ( LIFTING ?auto_16455 ?auto_16445 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16445 ?auto_16446 ?auto_16447 )
      ( MAKE-3CRATE-VERIFY ?auto_16444 ?auto_16445 ?auto_16446 ?auto_16447 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16457 - SURFACE
      ?auto_16458 - SURFACE
    )
    :vars
    (
      ?auto_16460 - HOIST
      ?auto_16469 - PLACE
      ?auto_16461 - SURFACE
      ?auto_16463 - PLACE
      ?auto_16462 - HOIST
      ?auto_16459 - SURFACE
      ?auto_16466 - PLACE
      ?auto_16468 - HOIST
      ?auto_16467 - SURFACE
      ?auto_16464 - SURFACE
      ?auto_16465 - TRUCK
      ?auto_16470 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16460 ?auto_16469 ) ( IS-CRATE ?auto_16458 ) ( not ( = ?auto_16457 ?auto_16458 ) ) ( not ( = ?auto_16461 ?auto_16457 ) ) ( not ( = ?auto_16461 ?auto_16458 ) ) ( not ( = ?auto_16463 ?auto_16469 ) ) ( HOIST-AT ?auto_16462 ?auto_16463 ) ( not ( = ?auto_16460 ?auto_16462 ) ) ( AVAILABLE ?auto_16462 ) ( SURFACE-AT ?auto_16458 ?auto_16463 ) ( ON ?auto_16458 ?auto_16459 ) ( CLEAR ?auto_16458 ) ( not ( = ?auto_16457 ?auto_16459 ) ) ( not ( = ?auto_16458 ?auto_16459 ) ) ( not ( = ?auto_16461 ?auto_16459 ) ) ( IS-CRATE ?auto_16457 ) ( not ( = ?auto_16466 ?auto_16469 ) ) ( not ( = ?auto_16463 ?auto_16466 ) ) ( HOIST-AT ?auto_16468 ?auto_16466 ) ( not ( = ?auto_16460 ?auto_16468 ) ) ( not ( = ?auto_16462 ?auto_16468 ) ) ( SURFACE-AT ?auto_16457 ?auto_16466 ) ( ON ?auto_16457 ?auto_16467 ) ( CLEAR ?auto_16457 ) ( not ( = ?auto_16457 ?auto_16467 ) ) ( not ( = ?auto_16458 ?auto_16467 ) ) ( not ( = ?auto_16461 ?auto_16467 ) ) ( not ( = ?auto_16459 ?auto_16467 ) ) ( SURFACE-AT ?auto_16464 ?auto_16469 ) ( CLEAR ?auto_16464 ) ( IS-CRATE ?auto_16461 ) ( not ( = ?auto_16464 ?auto_16461 ) ) ( not ( = ?auto_16457 ?auto_16464 ) ) ( not ( = ?auto_16458 ?auto_16464 ) ) ( not ( = ?auto_16459 ?auto_16464 ) ) ( not ( = ?auto_16467 ?auto_16464 ) ) ( AVAILABLE ?auto_16460 ) ( TRUCK-AT ?auto_16465 ?auto_16466 ) ( AVAILABLE ?auto_16468 ) ( SURFACE-AT ?auto_16461 ?auto_16466 ) ( ON ?auto_16461 ?auto_16470 ) ( CLEAR ?auto_16461 ) ( not ( = ?auto_16457 ?auto_16470 ) ) ( not ( = ?auto_16458 ?auto_16470 ) ) ( not ( = ?auto_16461 ?auto_16470 ) ) ( not ( = ?auto_16459 ?auto_16470 ) ) ( not ( = ?auto_16467 ?auto_16470 ) ) ( not ( = ?auto_16464 ?auto_16470 ) ) )
    :subtasks
    ( ( !LIFT ?auto_16468 ?auto_16461 ?auto_16470 ?auto_16466 )
      ( MAKE-2CRATE ?auto_16461 ?auto_16457 ?auto_16458 )
      ( MAKE-1CRATE-VERIFY ?auto_16457 ?auto_16458 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16471 - SURFACE
      ?auto_16472 - SURFACE
      ?auto_16473 - SURFACE
    )
    :vars
    (
      ?auto_16479 - HOIST
      ?auto_16475 - PLACE
      ?auto_16481 - PLACE
      ?auto_16482 - HOIST
      ?auto_16478 - SURFACE
      ?auto_16477 - PLACE
      ?auto_16474 - HOIST
      ?auto_16476 - SURFACE
      ?auto_16483 - SURFACE
      ?auto_16484 - TRUCK
      ?auto_16480 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16479 ?auto_16475 ) ( IS-CRATE ?auto_16473 ) ( not ( = ?auto_16472 ?auto_16473 ) ) ( not ( = ?auto_16471 ?auto_16472 ) ) ( not ( = ?auto_16471 ?auto_16473 ) ) ( not ( = ?auto_16481 ?auto_16475 ) ) ( HOIST-AT ?auto_16482 ?auto_16481 ) ( not ( = ?auto_16479 ?auto_16482 ) ) ( AVAILABLE ?auto_16482 ) ( SURFACE-AT ?auto_16473 ?auto_16481 ) ( ON ?auto_16473 ?auto_16478 ) ( CLEAR ?auto_16473 ) ( not ( = ?auto_16472 ?auto_16478 ) ) ( not ( = ?auto_16473 ?auto_16478 ) ) ( not ( = ?auto_16471 ?auto_16478 ) ) ( IS-CRATE ?auto_16472 ) ( not ( = ?auto_16477 ?auto_16475 ) ) ( not ( = ?auto_16481 ?auto_16477 ) ) ( HOIST-AT ?auto_16474 ?auto_16477 ) ( not ( = ?auto_16479 ?auto_16474 ) ) ( not ( = ?auto_16482 ?auto_16474 ) ) ( SURFACE-AT ?auto_16472 ?auto_16477 ) ( ON ?auto_16472 ?auto_16476 ) ( CLEAR ?auto_16472 ) ( not ( = ?auto_16472 ?auto_16476 ) ) ( not ( = ?auto_16473 ?auto_16476 ) ) ( not ( = ?auto_16471 ?auto_16476 ) ) ( not ( = ?auto_16478 ?auto_16476 ) ) ( SURFACE-AT ?auto_16483 ?auto_16475 ) ( CLEAR ?auto_16483 ) ( IS-CRATE ?auto_16471 ) ( not ( = ?auto_16483 ?auto_16471 ) ) ( not ( = ?auto_16472 ?auto_16483 ) ) ( not ( = ?auto_16473 ?auto_16483 ) ) ( not ( = ?auto_16478 ?auto_16483 ) ) ( not ( = ?auto_16476 ?auto_16483 ) ) ( AVAILABLE ?auto_16479 ) ( TRUCK-AT ?auto_16484 ?auto_16477 ) ( AVAILABLE ?auto_16474 ) ( SURFACE-AT ?auto_16471 ?auto_16477 ) ( ON ?auto_16471 ?auto_16480 ) ( CLEAR ?auto_16471 ) ( not ( = ?auto_16472 ?auto_16480 ) ) ( not ( = ?auto_16473 ?auto_16480 ) ) ( not ( = ?auto_16471 ?auto_16480 ) ) ( not ( = ?auto_16478 ?auto_16480 ) ) ( not ( = ?auto_16476 ?auto_16480 ) ) ( not ( = ?auto_16483 ?auto_16480 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16472 ?auto_16473 )
      ( MAKE-2CRATE-VERIFY ?auto_16471 ?auto_16472 ?auto_16473 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16485 - SURFACE
      ?auto_16486 - SURFACE
      ?auto_16487 - SURFACE
      ?auto_16488 - SURFACE
    )
    :vars
    (
      ?auto_16497 - HOIST
      ?auto_16493 - PLACE
      ?auto_16495 - PLACE
      ?auto_16490 - HOIST
      ?auto_16489 - SURFACE
      ?auto_16496 - PLACE
      ?auto_16491 - HOIST
      ?auto_16494 - SURFACE
      ?auto_16498 - TRUCK
      ?auto_16492 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16497 ?auto_16493 ) ( IS-CRATE ?auto_16488 ) ( not ( = ?auto_16487 ?auto_16488 ) ) ( not ( = ?auto_16486 ?auto_16487 ) ) ( not ( = ?auto_16486 ?auto_16488 ) ) ( not ( = ?auto_16495 ?auto_16493 ) ) ( HOIST-AT ?auto_16490 ?auto_16495 ) ( not ( = ?auto_16497 ?auto_16490 ) ) ( AVAILABLE ?auto_16490 ) ( SURFACE-AT ?auto_16488 ?auto_16495 ) ( ON ?auto_16488 ?auto_16489 ) ( CLEAR ?auto_16488 ) ( not ( = ?auto_16487 ?auto_16489 ) ) ( not ( = ?auto_16488 ?auto_16489 ) ) ( not ( = ?auto_16486 ?auto_16489 ) ) ( IS-CRATE ?auto_16487 ) ( not ( = ?auto_16496 ?auto_16493 ) ) ( not ( = ?auto_16495 ?auto_16496 ) ) ( HOIST-AT ?auto_16491 ?auto_16496 ) ( not ( = ?auto_16497 ?auto_16491 ) ) ( not ( = ?auto_16490 ?auto_16491 ) ) ( SURFACE-AT ?auto_16487 ?auto_16496 ) ( ON ?auto_16487 ?auto_16494 ) ( CLEAR ?auto_16487 ) ( not ( = ?auto_16487 ?auto_16494 ) ) ( not ( = ?auto_16488 ?auto_16494 ) ) ( not ( = ?auto_16486 ?auto_16494 ) ) ( not ( = ?auto_16489 ?auto_16494 ) ) ( SURFACE-AT ?auto_16485 ?auto_16493 ) ( CLEAR ?auto_16485 ) ( IS-CRATE ?auto_16486 ) ( not ( = ?auto_16485 ?auto_16486 ) ) ( not ( = ?auto_16487 ?auto_16485 ) ) ( not ( = ?auto_16488 ?auto_16485 ) ) ( not ( = ?auto_16489 ?auto_16485 ) ) ( not ( = ?auto_16494 ?auto_16485 ) ) ( AVAILABLE ?auto_16497 ) ( TRUCK-AT ?auto_16498 ?auto_16496 ) ( AVAILABLE ?auto_16491 ) ( SURFACE-AT ?auto_16486 ?auto_16496 ) ( ON ?auto_16486 ?auto_16492 ) ( CLEAR ?auto_16486 ) ( not ( = ?auto_16487 ?auto_16492 ) ) ( not ( = ?auto_16488 ?auto_16492 ) ) ( not ( = ?auto_16486 ?auto_16492 ) ) ( not ( = ?auto_16489 ?auto_16492 ) ) ( not ( = ?auto_16494 ?auto_16492 ) ) ( not ( = ?auto_16485 ?auto_16492 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16486 ?auto_16487 ?auto_16488 )
      ( MAKE-3CRATE-VERIFY ?auto_16485 ?auto_16486 ?auto_16487 ?auto_16488 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16499 - SURFACE
      ?auto_16500 - SURFACE
    )
    :vars
    (
      ?auto_16511 - HOIST
      ?auto_16506 - PLACE
      ?auto_16501 - SURFACE
      ?auto_16508 - PLACE
      ?auto_16503 - HOIST
      ?auto_16502 - SURFACE
      ?auto_16510 - PLACE
      ?auto_16504 - HOIST
      ?auto_16507 - SURFACE
      ?auto_16509 - SURFACE
      ?auto_16505 - SURFACE
      ?auto_16512 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16511 ?auto_16506 ) ( IS-CRATE ?auto_16500 ) ( not ( = ?auto_16499 ?auto_16500 ) ) ( not ( = ?auto_16501 ?auto_16499 ) ) ( not ( = ?auto_16501 ?auto_16500 ) ) ( not ( = ?auto_16508 ?auto_16506 ) ) ( HOIST-AT ?auto_16503 ?auto_16508 ) ( not ( = ?auto_16511 ?auto_16503 ) ) ( AVAILABLE ?auto_16503 ) ( SURFACE-AT ?auto_16500 ?auto_16508 ) ( ON ?auto_16500 ?auto_16502 ) ( CLEAR ?auto_16500 ) ( not ( = ?auto_16499 ?auto_16502 ) ) ( not ( = ?auto_16500 ?auto_16502 ) ) ( not ( = ?auto_16501 ?auto_16502 ) ) ( IS-CRATE ?auto_16499 ) ( not ( = ?auto_16510 ?auto_16506 ) ) ( not ( = ?auto_16508 ?auto_16510 ) ) ( HOIST-AT ?auto_16504 ?auto_16510 ) ( not ( = ?auto_16511 ?auto_16504 ) ) ( not ( = ?auto_16503 ?auto_16504 ) ) ( SURFACE-AT ?auto_16499 ?auto_16510 ) ( ON ?auto_16499 ?auto_16507 ) ( CLEAR ?auto_16499 ) ( not ( = ?auto_16499 ?auto_16507 ) ) ( not ( = ?auto_16500 ?auto_16507 ) ) ( not ( = ?auto_16501 ?auto_16507 ) ) ( not ( = ?auto_16502 ?auto_16507 ) ) ( SURFACE-AT ?auto_16509 ?auto_16506 ) ( CLEAR ?auto_16509 ) ( IS-CRATE ?auto_16501 ) ( not ( = ?auto_16509 ?auto_16501 ) ) ( not ( = ?auto_16499 ?auto_16509 ) ) ( not ( = ?auto_16500 ?auto_16509 ) ) ( not ( = ?auto_16502 ?auto_16509 ) ) ( not ( = ?auto_16507 ?auto_16509 ) ) ( AVAILABLE ?auto_16511 ) ( AVAILABLE ?auto_16504 ) ( SURFACE-AT ?auto_16501 ?auto_16510 ) ( ON ?auto_16501 ?auto_16505 ) ( CLEAR ?auto_16501 ) ( not ( = ?auto_16499 ?auto_16505 ) ) ( not ( = ?auto_16500 ?auto_16505 ) ) ( not ( = ?auto_16501 ?auto_16505 ) ) ( not ( = ?auto_16502 ?auto_16505 ) ) ( not ( = ?auto_16507 ?auto_16505 ) ) ( not ( = ?auto_16509 ?auto_16505 ) ) ( TRUCK-AT ?auto_16512 ?auto_16506 ) )
    :subtasks
    ( ( !DRIVE ?auto_16512 ?auto_16506 ?auto_16510 )
      ( MAKE-2CRATE ?auto_16501 ?auto_16499 ?auto_16500 )
      ( MAKE-1CRATE-VERIFY ?auto_16499 ?auto_16500 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16513 - SURFACE
      ?auto_16514 - SURFACE
      ?auto_16515 - SURFACE
    )
    :vars
    (
      ?auto_16520 - HOIST
      ?auto_16523 - PLACE
      ?auto_16525 - PLACE
      ?auto_16521 - HOIST
      ?auto_16524 - SURFACE
      ?auto_16522 - PLACE
      ?auto_16519 - HOIST
      ?auto_16526 - SURFACE
      ?auto_16518 - SURFACE
      ?auto_16516 - SURFACE
      ?auto_16517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16520 ?auto_16523 ) ( IS-CRATE ?auto_16515 ) ( not ( = ?auto_16514 ?auto_16515 ) ) ( not ( = ?auto_16513 ?auto_16514 ) ) ( not ( = ?auto_16513 ?auto_16515 ) ) ( not ( = ?auto_16525 ?auto_16523 ) ) ( HOIST-AT ?auto_16521 ?auto_16525 ) ( not ( = ?auto_16520 ?auto_16521 ) ) ( AVAILABLE ?auto_16521 ) ( SURFACE-AT ?auto_16515 ?auto_16525 ) ( ON ?auto_16515 ?auto_16524 ) ( CLEAR ?auto_16515 ) ( not ( = ?auto_16514 ?auto_16524 ) ) ( not ( = ?auto_16515 ?auto_16524 ) ) ( not ( = ?auto_16513 ?auto_16524 ) ) ( IS-CRATE ?auto_16514 ) ( not ( = ?auto_16522 ?auto_16523 ) ) ( not ( = ?auto_16525 ?auto_16522 ) ) ( HOIST-AT ?auto_16519 ?auto_16522 ) ( not ( = ?auto_16520 ?auto_16519 ) ) ( not ( = ?auto_16521 ?auto_16519 ) ) ( SURFACE-AT ?auto_16514 ?auto_16522 ) ( ON ?auto_16514 ?auto_16526 ) ( CLEAR ?auto_16514 ) ( not ( = ?auto_16514 ?auto_16526 ) ) ( not ( = ?auto_16515 ?auto_16526 ) ) ( not ( = ?auto_16513 ?auto_16526 ) ) ( not ( = ?auto_16524 ?auto_16526 ) ) ( SURFACE-AT ?auto_16518 ?auto_16523 ) ( CLEAR ?auto_16518 ) ( IS-CRATE ?auto_16513 ) ( not ( = ?auto_16518 ?auto_16513 ) ) ( not ( = ?auto_16514 ?auto_16518 ) ) ( not ( = ?auto_16515 ?auto_16518 ) ) ( not ( = ?auto_16524 ?auto_16518 ) ) ( not ( = ?auto_16526 ?auto_16518 ) ) ( AVAILABLE ?auto_16520 ) ( AVAILABLE ?auto_16519 ) ( SURFACE-AT ?auto_16513 ?auto_16522 ) ( ON ?auto_16513 ?auto_16516 ) ( CLEAR ?auto_16513 ) ( not ( = ?auto_16514 ?auto_16516 ) ) ( not ( = ?auto_16515 ?auto_16516 ) ) ( not ( = ?auto_16513 ?auto_16516 ) ) ( not ( = ?auto_16524 ?auto_16516 ) ) ( not ( = ?auto_16526 ?auto_16516 ) ) ( not ( = ?auto_16518 ?auto_16516 ) ) ( TRUCK-AT ?auto_16517 ?auto_16523 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16514 ?auto_16515 )
      ( MAKE-2CRATE-VERIFY ?auto_16513 ?auto_16514 ?auto_16515 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16527 - SURFACE
      ?auto_16528 - SURFACE
      ?auto_16529 - SURFACE
      ?auto_16530 - SURFACE
    )
    :vars
    (
      ?auto_16539 - HOIST
      ?auto_16533 - PLACE
      ?auto_16535 - PLACE
      ?auto_16540 - HOIST
      ?auto_16531 - SURFACE
      ?auto_16532 - PLACE
      ?auto_16537 - HOIST
      ?auto_16538 - SURFACE
      ?auto_16536 - SURFACE
      ?auto_16534 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16539 ?auto_16533 ) ( IS-CRATE ?auto_16530 ) ( not ( = ?auto_16529 ?auto_16530 ) ) ( not ( = ?auto_16528 ?auto_16529 ) ) ( not ( = ?auto_16528 ?auto_16530 ) ) ( not ( = ?auto_16535 ?auto_16533 ) ) ( HOIST-AT ?auto_16540 ?auto_16535 ) ( not ( = ?auto_16539 ?auto_16540 ) ) ( AVAILABLE ?auto_16540 ) ( SURFACE-AT ?auto_16530 ?auto_16535 ) ( ON ?auto_16530 ?auto_16531 ) ( CLEAR ?auto_16530 ) ( not ( = ?auto_16529 ?auto_16531 ) ) ( not ( = ?auto_16530 ?auto_16531 ) ) ( not ( = ?auto_16528 ?auto_16531 ) ) ( IS-CRATE ?auto_16529 ) ( not ( = ?auto_16532 ?auto_16533 ) ) ( not ( = ?auto_16535 ?auto_16532 ) ) ( HOIST-AT ?auto_16537 ?auto_16532 ) ( not ( = ?auto_16539 ?auto_16537 ) ) ( not ( = ?auto_16540 ?auto_16537 ) ) ( SURFACE-AT ?auto_16529 ?auto_16532 ) ( ON ?auto_16529 ?auto_16538 ) ( CLEAR ?auto_16529 ) ( not ( = ?auto_16529 ?auto_16538 ) ) ( not ( = ?auto_16530 ?auto_16538 ) ) ( not ( = ?auto_16528 ?auto_16538 ) ) ( not ( = ?auto_16531 ?auto_16538 ) ) ( SURFACE-AT ?auto_16527 ?auto_16533 ) ( CLEAR ?auto_16527 ) ( IS-CRATE ?auto_16528 ) ( not ( = ?auto_16527 ?auto_16528 ) ) ( not ( = ?auto_16529 ?auto_16527 ) ) ( not ( = ?auto_16530 ?auto_16527 ) ) ( not ( = ?auto_16531 ?auto_16527 ) ) ( not ( = ?auto_16538 ?auto_16527 ) ) ( AVAILABLE ?auto_16539 ) ( AVAILABLE ?auto_16537 ) ( SURFACE-AT ?auto_16528 ?auto_16532 ) ( ON ?auto_16528 ?auto_16536 ) ( CLEAR ?auto_16528 ) ( not ( = ?auto_16529 ?auto_16536 ) ) ( not ( = ?auto_16530 ?auto_16536 ) ) ( not ( = ?auto_16528 ?auto_16536 ) ) ( not ( = ?auto_16531 ?auto_16536 ) ) ( not ( = ?auto_16538 ?auto_16536 ) ) ( not ( = ?auto_16527 ?auto_16536 ) ) ( TRUCK-AT ?auto_16534 ?auto_16533 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16528 ?auto_16529 ?auto_16530 )
      ( MAKE-3CRATE-VERIFY ?auto_16527 ?auto_16528 ?auto_16529 ?auto_16530 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16555 - SURFACE
      ?auto_16556 - SURFACE
    )
    :vars
    (
      ?auto_16557 - HOIST
      ?auto_16558 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16557 ?auto_16558 ) ( SURFACE-AT ?auto_16555 ?auto_16558 ) ( CLEAR ?auto_16555 ) ( LIFTING ?auto_16557 ?auto_16556 ) ( IS-CRATE ?auto_16556 ) ( not ( = ?auto_16555 ?auto_16556 ) ) )
    :subtasks
    ( ( !DROP ?auto_16557 ?auto_16556 ?auto_16555 ?auto_16558 )
      ( MAKE-1CRATE-VERIFY ?auto_16555 ?auto_16556 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16559 - SURFACE
      ?auto_16560 - SURFACE
      ?auto_16561 - SURFACE
    )
    :vars
    (
      ?auto_16562 - HOIST
      ?auto_16563 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16562 ?auto_16563 ) ( SURFACE-AT ?auto_16560 ?auto_16563 ) ( CLEAR ?auto_16560 ) ( LIFTING ?auto_16562 ?auto_16561 ) ( IS-CRATE ?auto_16561 ) ( not ( = ?auto_16560 ?auto_16561 ) ) ( ON ?auto_16560 ?auto_16559 ) ( not ( = ?auto_16559 ?auto_16560 ) ) ( not ( = ?auto_16559 ?auto_16561 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16560 ?auto_16561 )
      ( MAKE-2CRATE-VERIFY ?auto_16559 ?auto_16560 ?auto_16561 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16564 - SURFACE
      ?auto_16565 - SURFACE
      ?auto_16566 - SURFACE
      ?auto_16567 - SURFACE
    )
    :vars
    (
      ?auto_16568 - HOIST
      ?auto_16569 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16568 ?auto_16569 ) ( SURFACE-AT ?auto_16566 ?auto_16569 ) ( CLEAR ?auto_16566 ) ( LIFTING ?auto_16568 ?auto_16567 ) ( IS-CRATE ?auto_16567 ) ( not ( = ?auto_16566 ?auto_16567 ) ) ( ON ?auto_16565 ?auto_16564 ) ( ON ?auto_16566 ?auto_16565 ) ( not ( = ?auto_16564 ?auto_16565 ) ) ( not ( = ?auto_16564 ?auto_16566 ) ) ( not ( = ?auto_16564 ?auto_16567 ) ) ( not ( = ?auto_16565 ?auto_16566 ) ) ( not ( = ?auto_16565 ?auto_16567 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16566 ?auto_16567 )
      ( MAKE-3CRATE-VERIFY ?auto_16564 ?auto_16565 ?auto_16566 ?auto_16567 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16570 - SURFACE
      ?auto_16571 - SURFACE
      ?auto_16572 - SURFACE
      ?auto_16573 - SURFACE
      ?auto_16574 - SURFACE
    )
    :vars
    (
      ?auto_16575 - HOIST
      ?auto_16576 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16575 ?auto_16576 ) ( SURFACE-AT ?auto_16573 ?auto_16576 ) ( CLEAR ?auto_16573 ) ( LIFTING ?auto_16575 ?auto_16574 ) ( IS-CRATE ?auto_16574 ) ( not ( = ?auto_16573 ?auto_16574 ) ) ( ON ?auto_16571 ?auto_16570 ) ( ON ?auto_16572 ?auto_16571 ) ( ON ?auto_16573 ?auto_16572 ) ( not ( = ?auto_16570 ?auto_16571 ) ) ( not ( = ?auto_16570 ?auto_16572 ) ) ( not ( = ?auto_16570 ?auto_16573 ) ) ( not ( = ?auto_16570 ?auto_16574 ) ) ( not ( = ?auto_16571 ?auto_16572 ) ) ( not ( = ?auto_16571 ?auto_16573 ) ) ( not ( = ?auto_16571 ?auto_16574 ) ) ( not ( = ?auto_16572 ?auto_16573 ) ) ( not ( = ?auto_16572 ?auto_16574 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16573 ?auto_16574 )
      ( MAKE-4CRATE-VERIFY ?auto_16570 ?auto_16571 ?auto_16572 ?auto_16573 ?auto_16574 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16577 - SURFACE
      ?auto_16578 - SURFACE
    )
    :vars
    (
      ?auto_16579 - HOIST
      ?auto_16580 - PLACE
      ?auto_16581 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16579 ?auto_16580 ) ( SURFACE-AT ?auto_16577 ?auto_16580 ) ( CLEAR ?auto_16577 ) ( IS-CRATE ?auto_16578 ) ( not ( = ?auto_16577 ?auto_16578 ) ) ( TRUCK-AT ?auto_16581 ?auto_16580 ) ( AVAILABLE ?auto_16579 ) ( IN ?auto_16578 ?auto_16581 ) )
    :subtasks
    ( ( !UNLOAD ?auto_16579 ?auto_16578 ?auto_16581 ?auto_16580 )
      ( MAKE-1CRATE ?auto_16577 ?auto_16578 )
      ( MAKE-1CRATE-VERIFY ?auto_16577 ?auto_16578 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16582 - SURFACE
      ?auto_16583 - SURFACE
      ?auto_16584 - SURFACE
    )
    :vars
    (
      ?auto_16585 - HOIST
      ?auto_16586 - PLACE
      ?auto_16587 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16585 ?auto_16586 ) ( SURFACE-AT ?auto_16583 ?auto_16586 ) ( CLEAR ?auto_16583 ) ( IS-CRATE ?auto_16584 ) ( not ( = ?auto_16583 ?auto_16584 ) ) ( TRUCK-AT ?auto_16587 ?auto_16586 ) ( AVAILABLE ?auto_16585 ) ( IN ?auto_16584 ?auto_16587 ) ( ON ?auto_16583 ?auto_16582 ) ( not ( = ?auto_16582 ?auto_16583 ) ) ( not ( = ?auto_16582 ?auto_16584 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16583 ?auto_16584 )
      ( MAKE-2CRATE-VERIFY ?auto_16582 ?auto_16583 ?auto_16584 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16588 - SURFACE
      ?auto_16589 - SURFACE
      ?auto_16590 - SURFACE
      ?auto_16591 - SURFACE
    )
    :vars
    (
      ?auto_16594 - HOIST
      ?auto_16592 - PLACE
      ?auto_16593 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16594 ?auto_16592 ) ( SURFACE-AT ?auto_16590 ?auto_16592 ) ( CLEAR ?auto_16590 ) ( IS-CRATE ?auto_16591 ) ( not ( = ?auto_16590 ?auto_16591 ) ) ( TRUCK-AT ?auto_16593 ?auto_16592 ) ( AVAILABLE ?auto_16594 ) ( IN ?auto_16591 ?auto_16593 ) ( ON ?auto_16590 ?auto_16589 ) ( not ( = ?auto_16589 ?auto_16590 ) ) ( not ( = ?auto_16589 ?auto_16591 ) ) ( ON ?auto_16589 ?auto_16588 ) ( not ( = ?auto_16588 ?auto_16589 ) ) ( not ( = ?auto_16588 ?auto_16590 ) ) ( not ( = ?auto_16588 ?auto_16591 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16589 ?auto_16590 ?auto_16591 )
      ( MAKE-3CRATE-VERIFY ?auto_16588 ?auto_16589 ?auto_16590 ?auto_16591 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16595 - SURFACE
      ?auto_16596 - SURFACE
      ?auto_16597 - SURFACE
      ?auto_16598 - SURFACE
      ?auto_16599 - SURFACE
    )
    :vars
    (
      ?auto_16602 - HOIST
      ?auto_16600 - PLACE
      ?auto_16601 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16602 ?auto_16600 ) ( SURFACE-AT ?auto_16598 ?auto_16600 ) ( CLEAR ?auto_16598 ) ( IS-CRATE ?auto_16599 ) ( not ( = ?auto_16598 ?auto_16599 ) ) ( TRUCK-AT ?auto_16601 ?auto_16600 ) ( AVAILABLE ?auto_16602 ) ( IN ?auto_16599 ?auto_16601 ) ( ON ?auto_16598 ?auto_16597 ) ( not ( = ?auto_16597 ?auto_16598 ) ) ( not ( = ?auto_16597 ?auto_16599 ) ) ( ON ?auto_16596 ?auto_16595 ) ( ON ?auto_16597 ?auto_16596 ) ( not ( = ?auto_16595 ?auto_16596 ) ) ( not ( = ?auto_16595 ?auto_16597 ) ) ( not ( = ?auto_16595 ?auto_16598 ) ) ( not ( = ?auto_16595 ?auto_16599 ) ) ( not ( = ?auto_16596 ?auto_16597 ) ) ( not ( = ?auto_16596 ?auto_16598 ) ) ( not ( = ?auto_16596 ?auto_16599 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16597 ?auto_16598 ?auto_16599 )
      ( MAKE-4CRATE-VERIFY ?auto_16595 ?auto_16596 ?auto_16597 ?auto_16598 ?auto_16599 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16603 - SURFACE
      ?auto_16604 - SURFACE
    )
    :vars
    (
      ?auto_16608 - HOIST
      ?auto_16605 - PLACE
      ?auto_16606 - TRUCK
      ?auto_16607 - SURFACE
      ?auto_16609 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16608 ?auto_16605 ) ( SURFACE-AT ?auto_16603 ?auto_16605 ) ( CLEAR ?auto_16603 ) ( IS-CRATE ?auto_16604 ) ( not ( = ?auto_16603 ?auto_16604 ) ) ( AVAILABLE ?auto_16608 ) ( IN ?auto_16604 ?auto_16606 ) ( ON ?auto_16603 ?auto_16607 ) ( not ( = ?auto_16607 ?auto_16603 ) ) ( not ( = ?auto_16607 ?auto_16604 ) ) ( TRUCK-AT ?auto_16606 ?auto_16609 ) ( not ( = ?auto_16609 ?auto_16605 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16606 ?auto_16609 ?auto_16605 )
      ( MAKE-2CRATE ?auto_16607 ?auto_16603 ?auto_16604 )
      ( MAKE-1CRATE-VERIFY ?auto_16603 ?auto_16604 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16610 - SURFACE
      ?auto_16611 - SURFACE
      ?auto_16612 - SURFACE
    )
    :vars
    (
      ?auto_16614 - HOIST
      ?auto_16615 - PLACE
      ?auto_16613 - TRUCK
      ?auto_16616 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16614 ?auto_16615 ) ( SURFACE-AT ?auto_16611 ?auto_16615 ) ( CLEAR ?auto_16611 ) ( IS-CRATE ?auto_16612 ) ( not ( = ?auto_16611 ?auto_16612 ) ) ( AVAILABLE ?auto_16614 ) ( IN ?auto_16612 ?auto_16613 ) ( ON ?auto_16611 ?auto_16610 ) ( not ( = ?auto_16610 ?auto_16611 ) ) ( not ( = ?auto_16610 ?auto_16612 ) ) ( TRUCK-AT ?auto_16613 ?auto_16616 ) ( not ( = ?auto_16616 ?auto_16615 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16611 ?auto_16612 )
      ( MAKE-2CRATE-VERIFY ?auto_16610 ?auto_16611 ?auto_16612 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16617 - SURFACE
      ?auto_16618 - SURFACE
      ?auto_16619 - SURFACE
      ?auto_16620 - SURFACE
    )
    :vars
    (
      ?auto_16621 - HOIST
      ?auto_16622 - PLACE
      ?auto_16623 - TRUCK
      ?auto_16624 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16621 ?auto_16622 ) ( SURFACE-AT ?auto_16619 ?auto_16622 ) ( CLEAR ?auto_16619 ) ( IS-CRATE ?auto_16620 ) ( not ( = ?auto_16619 ?auto_16620 ) ) ( AVAILABLE ?auto_16621 ) ( IN ?auto_16620 ?auto_16623 ) ( ON ?auto_16619 ?auto_16618 ) ( not ( = ?auto_16618 ?auto_16619 ) ) ( not ( = ?auto_16618 ?auto_16620 ) ) ( TRUCK-AT ?auto_16623 ?auto_16624 ) ( not ( = ?auto_16624 ?auto_16622 ) ) ( ON ?auto_16618 ?auto_16617 ) ( not ( = ?auto_16617 ?auto_16618 ) ) ( not ( = ?auto_16617 ?auto_16619 ) ) ( not ( = ?auto_16617 ?auto_16620 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16618 ?auto_16619 ?auto_16620 )
      ( MAKE-3CRATE-VERIFY ?auto_16617 ?auto_16618 ?auto_16619 ?auto_16620 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16625 - SURFACE
      ?auto_16626 - SURFACE
      ?auto_16627 - SURFACE
      ?auto_16628 - SURFACE
      ?auto_16629 - SURFACE
    )
    :vars
    (
      ?auto_16630 - HOIST
      ?auto_16631 - PLACE
      ?auto_16632 - TRUCK
      ?auto_16633 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16630 ?auto_16631 ) ( SURFACE-AT ?auto_16628 ?auto_16631 ) ( CLEAR ?auto_16628 ) ( IS-CRATE ?auto_16629 ) ( not ( = ?auto_16628 ?auto_16629 ) ) ( AVAILABLE ?auto_16630 ) ( IN ?auto_16629 ?auto_16632 ) ( ON ?auto_16628 ?auto_16627 ) ( not ( = ?auto_16627 ?auto_16628 ) ) ( not ( = ?auto_16627 ?auto_16629 ) ) ( TRUCK-AT ?auto_16632 ?auto_16633 ) ( not ( = ?auto_16633 ?auto_16631 ) ) ( ON ?auto_16626 ?auto_16625 ) ( ON ?auto_16627 ?auto_16626 ) ( not ( = ?auto_16625 ?auto_16626 ) ) ( not ( = ?auto_16625 ?auto_16627 ) ) ( not ( = ?auto_16625 ?auto_16628 ) ) ( not ( = ?auto_16625 ?auto_16629 ) ) ( not ( = ?auto_16626 ?auto_16627 ) ) ( not ( = ?auto_16626 ?auto_16628 ) ) ( not ( = ?auto_16626 ?auto_16629 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16627 ?auto_16628 ?auto_16629 )
      ( MAKE-4CRATE-VERIFY ?auto_16625 ?auto_16626 ?auto_16627 ?auto_16628 ?auto_16629 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16634 - SURFACE
      ?auto_16635 - SURFACE
    )
    :vars
    (
      ?auto_16636 - HOIST
      ?auto_16637 - PLACE
      ?auto_16638 - SURFACE
      ?auto_16639 - TRUCK
      ?auto_16640 - PLACE
      ?auto_16641 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16636 ?auto_16637 ) ( SURFACE-AT ?auto_16634 ?auto_16637 ) ( CLEAR ?auto_16634 ) ( IS-CRATE ?auto_16635 ) ( not ( = ?auto_16634 ?auto_16635 ) ) ( AVAILABLE ?auto_16636 ) ( ON ?auto_16634 ?auto_16638 ) ( not ( = ?auto_16638 ?auto_16634 ) ) ( not ( = ?auto_16638 ?auto_16635 ) ) ( TRUCK-AT ?auto_16639 ?auto_16640 ) ( not ( = ?auto_16640 ?auto_16637 ) ) ( HOIST-AT ?auto_16641 ?auto_16640 ) ( LIFTING ?auto_16641 ?auto_16635 ) ( not ( = ?auto_16636 ?auto_16641 ) ) )
    :subtasks
    ( ( !LOAD ?auto_16641 ?auto_16635 ?auto_16639 ?auto_16640 )
      ( MAKE-2CRATE ?auto_16638 ?auto_16634 ?auto_16635 )
      ( MAKE-1CRATE-VERIFY ?auto_16634 ?auto_16635 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16642 - SURFACE
      ?auto_16643 - SURFACE
      ?auto_16644 - SURFACE
    )
    :vars
    (
      ?auto_16645 - HOIST
      ?auto_16649 - PLACE
      ?auto_16647 - TRUCK
      ?auto_16648 - PLACE
      ?auto_16646 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16645 ?auto_16649 ) ( SURFACE-AT ?auto_16643 ?auto_16649 ) ( CLEAR ?auto_16643 ) ( IS-CRATE ?auto_16644 ) ( not ( = ?auto_16643 ?auto_16644 ) ) ( AVAILABLE ?auto_16645 ) ( ON ?auto_16643 ?auto_16642 ) ( not ( = ?auto_16642 ?auto_16643 ) ) ( not ( = ?auto_16642 ?auto_16644 ) ) ( TRUCK-AT ?auto_16647 ?auto_16648 ) ( not ( = ?auto_16648 ?auto_16649 ) ) ( HOIST-AT ?auto_16646 ?auto_16648 ) ( LIFTING ?auto_16646 ?auto_16644 ) ( not ( = ?auto_16645 ?auto_16646 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16643 ?auto_16644 )
      ( MAKE-2CRATE-VERIFY ?auto_16642 ?auto_16643 ?auto_16644 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16650 - SURFACE
      ?auto_16651 - SURFACE
      ?auto_16652 - SURFACE
      ?auto_16653 - SURFACE
    )
    :vars
    (
      ?auto_16657 - HOIST
      ?auto_16655 - PLACE
      ?auto_16656 - TRUCK
      ?auto_16658 - PLACE
      ?auto_16654 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16657 ?auto_16655 ) ( SURFACE-AT ?auto_16652 ?auto_16655 ) ( CLEAR ?auto_16652 ) ( IS-CRATE ?auto_16653 ) ( not ( = ?auto_16652 ?auto_16653 ) ) ( AVAILABLE ?auto_16657 ) ( ON ?auto_16652 ?auto_16651 ) ( not ( = ?auto_16651 ?auto_16652 ) ) ( not ( = ?auto_16651 ?auto_16653 ) ) ( TRUCK-AT ?auto_16656 ?auto_16658 ) ( not ( = ?auto_16658 ?auto_16655 ) ) ( HOIST-AT ?auto_16654 ?auto_16658 ) ( LIFTING ?auto_16654 ?auto_16653 ) ( not ( = ?auto_16657 ?auto_16654 ) ) ( ON ?auto_16651 ?auto_16650 ) ( not ( = ?auto_16650 ?auto_16651 ) ) ( not ( = ?auto_16650 ?auto_16652 ) ) ( not ( = ?auto_16650 ?auto_16653 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16651 ?auto_16652 ?auto_16653 )
      ( MAKE-3CRATE-VERIFY ?auto_16650 ?auto_16651 ?auto_16652 ?auto_16653 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16659 - SURFACE
      ?auto_16660 - SURFACE
      ?auto_16661 - SURFACE
      ?auto_16662 - SURFACE
      ?auto_16663 - SURFACE
    )
    :vars
    (
      ?auto_16667 - HOIST
      ?auto_16665 - PLACE
      ?auto_16666 - TRUCK
      ?auto_16668 - PLACE
      ?auto_16664 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16667 ?auto_16665 ) ( SURFACE-AT ?auto_16662 ?auto_16665 ) ( CLEAR ?auto_16662 ) ( IS-CRATE ?auto_16663 ) ( not ( = ?auto_16662 ?auto_16663 ) ) ( AVAILABLE ?auto_16667 ) ( ON ?auto_16662 ?auto_16661 ) ( not ( = ?auto_16661 ?auto_16662 ) ) ( not ( = ?auto_16661 ?auto_16663 ) ) ( TRUCK-AT ?auto_16666 ?auto_16668 ) ( not ( = ?auto_16668 ?auto_16665 ) ) ( HOIST-AT ?auto_16664 ?auto_16668 ) ( LIFTING ?auto_16664 ?auto_16663 ) ( not ( = ?auto_16667 ?auto_16664 ) ) ( ON ?auto_16660 ?auto_16659 ) ( ON ?auto_16661 ?auto_16660 ) ( not ( = ?auto_16659 ?auto_16660 ) ) ( not ( = ?auto_16659 ?auto_16661 ) ) ( not ( = ?auto_16659 ?auto_16662 ) ) ( not ( = ?auto_16659 ?auto_16663 ) ) ( not ( = ?auto_16660 ?auto_16661 ) ) ( not ( = ?auto_16660 ?auto_16662 ) ) ( not ( = ?auto_16660 ?auto_16663 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16661 ?auto_16662 ?auto_16663 )
      ( MAKE-4CRATE-VERIFY ?auto_16659 ?auto_16660 ?auto_16661 ?auto_16662 ?auto_16663 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16669 - SURFACE
      ?auto_16670 - SURFACE
    )
    :vars
    (
      ?auto_16675 - HOIST
      ?auto_16672 - PLACE
      ?auto_16674 - SURFACE
      ?auto_16673 - TRUCK
      ?auto_16676 - PLACE
      ?auto_16671 - HOIST
      ?auto_16677 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16675 ?auto_16672 ) ( SURFACE-AT ?auto_16669 ?auto_16672 ) ( CLEAR ?auto_16669 ) ( IS-CRATE ?auto_16670 ) ( not ( = ?auto_16669 ?auto_16670 ) ) ( AVAILABLE ?auto_16675 ) ( ON ?auto_16669 ?auto_16674 ) ( not ( = ?auto_16674 ?auto_16669 ) ) ( not ( = ?auto_16674 ?auto_16670 ) ) ( TRUCK-AT ?auto_16673 ?auto_16676 ) ( not ( = ?auto_16676 ?auto_16672 ) ) ( HOIST-AT ?auto_16671 ?auto_16676 ) ( not ( = ?auto_16675 ?auto_16671 ) ) ( AVAILABLE ?auto_16671 ) ( SURFACE-AT ?auto_16670 ?auto_16676 ) ( ON ?auto_16670 ?auto_16677 ) ( CLEAR ?auto_16670 ) ( not ( = ?auto_16669 ?auto_16677 ) ) ( not ( = ?auto_16670 ?auto_16677 ) ) ( not ( = ?auto_16674 ?auto_16677 ) ) )
    :subtasks
    ( ( !LIFT ?auto_16671 ?auto_16670 ?auto_16677 ?auto_16676 )
      ( MAKE-2CRATE ?auto_16674 ?auto_16669 ?auto_16670 )
      ( MAKE-1CRATE-VERIFY ?auto_16669 ?auto_16670 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16678 - SURFACE
      ?auto_16679 - SURFACE
      ?auto_16680 - SURFACE
    )
    :vars
    (
      ?auto_16683 - HOIST
      ?auto_16684 - PLACE
      ?auto_16681 - TRUCK
      ?auto_16682 - PLACE
      ?auto_16685 - HOIST
      ?auto_16686 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16683 ?auto_16684 ) ( SURFACE-AT ?auto_16679 ?auto_16684 ) ( CLEAR ?auto_16679 ) ( IS-CRATE ?auto_16680 ) ( not ( = ?auto_16679 ?auto_16680 ) ) ( AVAILABLE ?auto_16683 ) ( ON ?auto_16679 ?auto_16678 ) ( not ( = ?auto_16678 ?auto_16679 ) ) ( not ( = ?auto_16678 ?auto_16680 ) ) ( TRUCK-AT ?auto_16681 ?auto_16682 ) ( not ( = ?auto_16682 ?auto_16684 ) ) ( HOIST-AT ?auto_16685 ?auto_16682 ) ( not ( = ?auto_16683 ?auto_16685 ) ) ( AVAILABLE ?auto_16685 ) ( SURFACE-AT ?auto_16680 ?auto_16682 ) ( ON ?auto_16680 ?auto_16686 ) ( CLEAR ?auto_16680 ) ( not ( = ?auto_16679 ?auto_16686 ) ) ( not ( = ?auto_16680 ?auto_16686 ) ) ( not ( = ?auto_16678 ?auto_16686 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16679 ?auto_16680 )
      ( MAKE-2CRATE-VERIFY ?auto_16678 ?auto_16679 ?auto_16680 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16687 - SURFACE
      ?auto_16688 - SURFACE
      ?auto_16689 - SURFACE
      ?auto_16690 - SURFACE
    )
    :vars
    (
      ?auto_16693 - HOIST
      ?auto_16696 - PLACE
      ?auto_16691 - TRUCK
      ?auto_16692 - PLACE
      ?auto_16695 - HOIST
      ?auto_16694 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16693 ?auto_16696 ) ( SURFACE-AT ?auto_16689 ?auto_16696 ) ( CLEAR ?auto_16689 ) ( IS-CRATE ?auto_16690 ) ( not ( = ?auto_16689 ?auto_16690 ) ) ( AVAILABLE ?auto_16693 ) ( ON ?auto_16689 ?auto_16688 ) ( not ( = ?auto_16688 ?auto_16689 ) ) ( not ( = ?auto_16688 ?auto_16690 ) ) ( TRUCK-AT ?auto_16691 ?auto_16692 ) ( not ( = ?auto_16692 ?auto_16696 ) ) ( HOIST-AT ?auto_16695 ?auto_16692 ) ( not ( = ?auto_16693 ?auto_16695 ) ) ( AVAILABLE ?auto_16695 ) ( SURFACE-AT ?auto_16690 ?auto_16692 ) ( ON ?auto_16690 ?auto_16694 ) ( CLEAR ?auto_16690 ) ( not ( = ?auto_16689 ?auto_16694 ) ) ( not ( = ?auto_16690 ?auto_16694 ) ) ( not ( = ?auto_16688 ?auto_16694 ) ) ( ON ?auto_16688 ?auto_16687 ) ( not ( = ?auto_16687 ?auto_16688 ) ) ( not ( = ?auto_16687 ?auto_16689 ) ) ( not ( = ?auto_16687 ?auto_16690 ) ) ( not ( = ?auto_16687 ?auto_16694 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16688 ?auto_16689 ?auto_16690 )
      ( MAKE-3CRATE-VERIFY ?auto_16687 ?auto_16688 ?auto_16689 ?auto_16690 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16697 - SURFACE
      ?auto_16698 - SURFACE
      ?auto_16699 - SURFACE
      ?auto_16700 - SURFACE
      ?auto_16701 - SURFACE
    )
    :vars
    (
      ?auto_16704 - HOIST
      ?auto_16707 - PLACE
      ?auto_16702 - TRUCK
      ?auto_16703 - PLACE
      ?auto_16706 - HOIST
      ?auto_16705 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16704 ?auto_16707 ) ( SURFACE-AT ?auto_16700 ?auto_16707 ) ( CLEAR ?auto_16700 ) ( IS-CRATE ?auto_16701 ) ( not ( = ?auto_16700 ?auto_16701 ) ) ( AVAILABLE ?auto_16704 ) ( ON ?auto_16700 ?auto_16699 ) ( not ( = ?auto_16699 ?auto_16700 ) ) ( not ( = ?auto_16699 ?auto_16701 ) ) ( TRUCK-AT ?auto_16702 ?auto_16703 ) ( not ( = ?auto_16703 ?auto_16707 ) ) ( HOIST-AT ?auto_16706 ?auto_16703 ) ( not ( = ?auto_16704 ?auto_16706 ) ) ( AVAILABLE ?auto_16706 ) ( SURFACE-AT ?auto_16701 ?auto_16703 ) ( ON ?auto_16701 ?auto_16705 ) ( CLEAR ?auto_16701 ) ( not ( = ?auto_16700 ?auto_16705 ) ) ( not ( = ?auto_16701 ?auto_16705 ) ) ( not ( = ?auto_16699 ?auto_16705 ) ) ( ON ?auto_16698 ?auto_16697 ) ( ON ?auto_16699 ?auto_16698 ) ( not ( = ?auto_16697 ?auto_16698 ) ) ( not ( = ?auto_16697 ?auto_16699 ) ) ( not ( = ?auto_16697 ?auto_16700 ) ) ( not ( = ?auto_16697 ?auto_16701 ) ) ( not ( = ?auto_16697 ?auto_16705 ) ) ( not ( = ?auto_16698 ?auto_16699 ) ) ( not ( = ?auto_16698 ?auto_16700 ) ) ( not ( = ?auto_16698 ?auto_16701 ) ) ( not ( = ?auto_16698 ?auto_16705 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16699 ?auto_16700 ?auto_16701 )
      ( MAKE-4CRATE-VERIFY ?auto_16697 ?auto_16698 ?auto_16699 ?auto_16700 ?auto_16701 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16708 - SURFACE
      ?auto_16709 - SURFACE
    )
    :vars
    (
      ?auto_16712 - HOIST
      ?auto_16716 - PLACE
      ?auto_16715 - SURFACE
      ?auto_16711 - PLACE
      ?auto_16714 - HOIST
      ?auto_16713 - SURFACE
      ?auto_16710 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16712 ?auto_16716 ) ( SURFACE-AT ?auto_16708 ?auto_16716 ) ( CLEAR ?auto_16708 ) ( IS-CRATE ?auto_16709 ) ( not ( = ?auto_16708 ?auto_16709 ) ) ( AVAILABLE ?auto_16712 ) ( ON ?auto_16708 ?auto_16715 ) ( not ( = ?auto_16715 ?auto_16708 ) ) ( not ( = ?auto_16715 ?auto_16709 ) ) ( not ( = ?auto_16711 ?auto_16716 ) ) ( HOIST-AT ?auto_16714 ?auto_16711 ) ( not ( = ?auto_16712 ?auto_16714 ) ) ( AVAILABLE ?auto_16714 ) ( SURFACE-AT ?auto_16709 ?auto_16711 ) ( ON ?auto_16709 ?auto_16713 ) ( CLEAR ?auto_16709 ) ( not ( = ?auto_16708 ?auto_16713 ) ) ( not ( = ?auto_16709 ?auto_16713 ) ) ( not ( = ?auto_16715 ?auto_16713 ) ) ( TRUCK-AT ?auto_16710 ?auto_16716 ) )
    :subtasks
    ( ( !DRIVE ?auto_16710 ?auto_16716 ?auto_16711 )
      ( MAKE-2CRATE ?auto_16715 ?auto_16708 ?auto_16709 )
      ( MAKE-1CRATE-VERIFY ?auto_16708 ?auto_16709 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16717 - SURFACE
      ?auto_16718 - SURFACE
      ?auto_16719 - SURFACE
    )
    :vars
    (
      ?auto_16720 - HOIST
      ?auto_16721 - PLACE
      ?auto_16725 - PLACE
      ?auto_16723 - HOIST
      ?auto_16722 - SURFACE
      ?auto_16724 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16720 ?auto_16721 ) ( SURFACE-AT ?auto_16718 ?auto_16721 ) ( CLEAR ?auto_16718 ) ( IS-CRATE ?auto_16719 ) ( not ( = ?auto_16718 ?auto_16719 ) ) ( AVAILABLE ?auto_16720 ) ( ON ?auto_16718 ?auto_16717 ) ( not ( = ?auto_16717 ?auto_16718 ) ) ( not ( = ?auto_16717 ?auto_16719 ) ) ( not ( = ?auto_16725 ?auto_16721 ) ) ( HOIST-AT ?auto_16723 ?auto_16725 ) ( not ( = ?auto_16720 ?auto_16723 ) ) ( AVAILABLE ?auto_16723 ) ( SURFACE-AT ?auto_16719 ?auto_16725 ) ( ON ?auto_16719 ?auto_16722 ) ( CLEAR ?auto_16719 ) ( not ( = ?auto_16718 ?auto_16722 ) ) ( not ( = ?auto_16719 ?auto_16722 ) ) ( not ( = ?auto_16717 ?auto_16722 ) ) ( TRUCK-AT ?auto_16724 ?auto_16721 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16718 ?auto_16719 )
      ( MAKE-2CRATE-VERIFY ?auto_16717 ?auto_16718 ?auto_16719 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16726 - SURFACE
      ?auto_16727 - SURFACE
      ?auto_16728 - SURFACE
      ?auto_16729 - SURFACE
    )
    :vars
    (
      ?auto_16730 - HOIST
      ?auto_16733 - PLACE
      ?auto_16734 - PLACE
      ?auto_16735 - HOIST
      ?auto_16731 - SURFACE
      ?auto_16732 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16730 ?auto_16733 ) ( SURFACE-AT ?auto_16728 ?auto_16733 ) ( CLEAR ?auto_16728 ) ( IS-CRATE ?auto_16729 ) ( not ( = ?auto_16728 ?auto_16729 ) ) ( AVAILABLE ?auto_16730 ) ( ON ?auto_16728 ?auto_16727 ) ( not ( = ?auto_16727 ?auto_16728 ) ) ( not ( = ?auto_16727 ?auto_16729 ) ) ( not ( = ?auto_16734 ?auto_16733 ) ) ( HOIST-AT ?auto_16735 ?auto_16734 ) ( not ( = ?auto_16730 ?auto_16735 ) ) ( AVAILABLE ?auto_16735 ) ( SURFACE-AT ?auto_16729 ?auto_16734 ) ( ON ?auto_16729 ?auto_16731 ) ( CLEAR ?auto_16729 ) ( not ( = ?auto_16728 ?auto_16731 ) ) ( not ( = ?auto_16729 ?auto_16731 ) ) ( not ( = ?auto_16727 ?auto_16731 ) ) ( TRUCK-AT ?auto_16732 ?auto_16733 ) ( ON ?auto_16727 ?auto_16726 ) ( not ( = ?auto_16726 ?auto_16727 ) ) ( not ( = ?auto_16726 ?auto_16728 ) ) ( not ( = ?auto_16726 ?auto_16729 ) ) ( not ( = ?auto_16726 ?auto_16731 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16727 ?auto_16728 ?auto_16729 )
      ( MAKE-3CRATE-VERIFY ?auto_16726 ?auto_16727 ?auto_16728 ?auto_16729 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16736 - SURFACE
      ?auto_16737 - SURFACE
      ?auto_16738 - SURFACE
      ?auto_16739 - SURFACE
      ?auto_16740 - SURFACE
    )
    :vars
    (
      ?auto_16741 - HOIST
      ?auto_16744 - PLACE
      ?auto_16745 - PLACE
      ?auto_16746 - HOIST
      ?auto_16742 - SURFACE
      ?auto_16743 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16741 ?auto_16744 ) ( SURFACE-AT ?auto_16739 ?auto_16744 ) ( CLEAR ?auto_16739 ) ( IS-CRATE ?auto_16740 ) ( not ( = ?auto_16739 ?auto_16740 ) ) ( AVAILABLE ?auto_16741 ) ( ON ?auto_16739 ?auto_16738 ) ( not ( = ?auto_16738 ?auto_16739 ) ) ( not ( = ?auto_16738 ?auto_16740 ) ) ( not ( = ?auto_16745 ?auto_16744 ) ) ( HOIST-AT ?auto_16746 ?auto_16745 ) ( not ( = ?auto_16741 ?auto_16746 ) ) ( AVAILABLE ?auto_16746 ) ( SURFACE-AT ?auto_16740 ?auto_16745 ) ( ON ?auto_16740 ?auto_16742 ) ( CLEAR ?auto_16740 ) ( not ( = ?auto_16739 ?auto_16742 ) ) ( not ( = ?auto_16740 ?auto_16742 ) ) ( not ( = ?auto_16738 ?auto_16742 ) ) ( TRUCK-AT ?auto_16743 ?auto_16744 ) ( ON ?auto_16737 ?auto_16736 ) ( ON ?auto_16738 ?auto_16737 ) ( not ( = ?auto_16736 ?auto_16737 ) ) ( not ( = ?auto_16736 ?auto_16738 ) ) ( not ( = ?auto_16736 ?auto_16739 ) ) ( not ( = ?auto_16736 ?auto_16740 ) ) ( not ( = ?auto_16736 ?auto_16742 ) ) ( not ( = ?auto_16737 ?auto_16738 ) ) ( not ( = ?auto_16737 ?auto_16739 ) ) ( not ( = ?auto_16737 ?auto_16740 ) ) ( not ( = ?auto_16737 ?auto_16742 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16738 ?auto_16739 ?auto_16740 )
      ( MAKE-4CRATE-VERIFY ?auto_16736 ?auto_16737 ?auto_16738 ?auto_16739 ?auto_16740 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16747 - SURFACE
      ?auto_16748 - SURFACE
    )
    :vars
    (
      ?auto_16749 - HOIST
      ?auto_16753 - PLACE
      ?auto_16751 - SURFACE
      ?auto_16754 - PLACE
      ?auto_16755 - HOIST
      ?auto_16750 - SURFACE
      ?auto_16752 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16749 ?auto_16753 ) ( IS-CRATE ?auto_16748 ) ( not ( = ?auto_16747 ?auto_16748 ) ) ( not ( = ?auto_16751 ?auto_16747 ) ) ( not ( = ?auto_16751 ?auto_16748 ) ) ( not ( = ?auto_16754 ?auto_16753 ) ) ( HOIST-AT ?auto_16755 ?auto_16754 ) ( not ( = ?auto_16749 ?auto_16755 ) ) ( AVAILABLE ?auto_16755 ) ( SURFACE-AT ?auto_16748 ?auto_16754 ) ( ON ?auto_16748 ?auto_16750 ) ( CLEAR ?auto_16748 ) ( not ( = ?auto_16747 ?auto_16750 ) ) ( not ( = ?auto_16748 ?auto_16750 ) ) ( not ( = ?auto_16751 ?auto_16750 ) ) ( TRUCK-AT ?auto_16752 ?auto_16753 ) ( SURFACE-AT ?auto_16751 ?auto_16753 ) ( CLEAR ?auto_16751 ) ( LIFTING ?auto_16749 ?auto_16747 ) ( IS-CRATE ?auto_16747 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16751 ?auto_16747 )
      ( MAKE-2CRATE ?auto_16751 ?auto_16747 ?auto_16748 )
      ( MAKE-1CRATE-VERIFY ?auto_16747 ?auto_16748 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16756 - SURFACE
      ?auto_16757 - SURFACE
      ?auto_16758 - SURFACE
    )
    :vars
    (
      ?auto_16760 - HOIST
      ?auto_16763 - PLACE
      ?auto_16761 - PLACE
      ?auto_16762 - HOIST
      ?auto_16759 - SURFACE
      ?auto_16764 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16760 ?auto_16763 ) ( IS-CRATE ?auto_16758 ) ( not ( = ?auto_16757 ?auto_16758 ) ) ( not ( = ?auto_16756 ?auto_16757 ) ) ( not ( = ?auto_16756 ?auto_16758 ) ) ( not ( = ?auto_16761 ?auto_16763 ) ) ( HOIST-AT ?auto_16762 ?auto_16761 ) ( not ( = ?auto_16760 ?auto_16762 ) ) ( AVAILABLE ?auto_16762 ) ( SURFACE-AT ?auto_16758 ?auto_16761 ) ( ON ?auto_16758 ?auto_16759 ) ( CLEAR ?auto_16758 ) ( not ( = ?auto_16757 ?auto_16759 ) ) ( not ( = ?auto_16758 ?auto_16759 ) ) ( not ( = ?auto_16756 ?auto_16759 ) ) ( TRUCK-AT ?auto_16764 ?auto_16763 ) ( SURFACE-AT ?auto_16756 ?auto_16763 ) ( CLEAR ?auto_16756 ) ( LIFTING ?auto_16760 ?auto_16757 ) ( IS-CRATE ?auto_16757 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16757 ?auto_16758 )
      ( MAKE-2CRATE-VERIFY ?auto_16756 ?auto_16757 ?auto_16758 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16765 - SURFACE
      ?auto_16766 - SURFACE
      ?auto_16767 - SURFACE
      ?auto_16768 - SURFACE
    )
    :vars
    (
      ?auto_16771 - HOIST
      ?auto_16770 - PLACE
      ?auto_16769 - PLACE
      ?auto_16774 - HOIST
      ?auto_16773 - SURFACE
      ?auto_16772 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16771 ?auto_16770 ) ( IS-CRATE ?auto_16768 ) ( not ( = ?auto_16767 ?auto_16768 ) ) ( not ( = ?auto_16766 ?auto_16767 ) ) ( not ( = ?auto_16766 ?auto_16768 ) ) ( not ( = ?auto_16769 ?auto_16770 ) ) ( HOIST-AT ?auto_16774 ?auto_16769 ) ( not ( = ?auto_16771 ?auto_16774 ) ) ( AVAILABLE ?auto_16774 ) ( SURFACE-AT ?auto_16768 ?auto_16769 ) ( ON ?auto_16768 ?auto_16773 ) ( CLEAR ?auto_16768 ) ( not ( = ?auto_16767 ?auto_16773 ) ) ( not ( = ?auto_16768 ?auto_16773 ) ) ( not ( = ?auto_16766 ?auto_16773 ) ) ( TRUCK-AT ?auto_16772 ?auto_16770 ) ( SURFACE-AT ?auto_16766 ?auto_16770 ) ( CLEAR ?auto_16766 ) ( LIFTING ?auto_16771 ?auto_16767 ) ( IS-CRATE ?auto_16767 ) ( ON ?auto_16766 ?auto_16765 ) ( not ( = ?auto_16765 ?auto_16766 ) ) ( not ( = ?auto_16765 ?auto_16767 ) ) ( not ( = ?auto_16765 ?auto_16768 ) ) ( not ( = ?auto_16765 ?auto_16773 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16766 ?auto_16767 ?auto_16768 )
      ( MAKE-3CRATE-VERIFY ?auto_16765 ?auto_16766 ?auto_16767 ?auto_16768 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16775 - SURFACE
      ?auto_16776 - SURFACE
      ?auto_16777 - SURFACE
      ?auto_16778 - SURFACE
      ?auto_16779 - SURFACE
    )
    :vars
    (
      ?auto_16782 - HOIST
      ?auto_16781 - PLACE
      ?auto_16780 - PLACE
      ?auto_16785 - HOIST
      ?auto_16784 - SURFACE
      ?auto_16783 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16782 ?auto_16781 ) ( IS-CRATE ?auto_16779 ) ( not ( = ?auto_16778 ?auto_16779 ) ) ( not ( = ?auto_16777 ?auto_16778 ) ) ( not ( = ?auto_16777 ?auto_16779 ) ) ( not ( = ?auto_16780 ?auto_16781 ) ) ( HOIST-AT ?auto_16785 ?auto_16780 ) ( not ( = ?auto_16782 ?auto_16785 ) ) ( AVAILABLE ?auto_16785 ) ( SURFACE-AT ?auto_16779 ?auto_16780 ) ( ON ?auto_16779 ?auto_16784 ) ( CLEAR ?auto_16779 ) ( not ( = ?auto_16778 ?auto_16784 ) ) ( not ( = ?auto_16779 ?auto_16784 ) ) ( not ( = ?auto_16777 ?auto_16784 ) ) ( TRUCK-AT ?auto_16783 ?auto_16781 ) ( SURFACE-AT ?auto_16777 ?auto_16781 ) ( CLEAR ?auto_16777 ) ( LIFTING ?auto_16782 ?auto_16778 ) ( IS-CRATE ?auto_16778 ) ( ON ?auto_16776 ?auto_16775 ) ( ON ?auto_16777 ?auto_16776 ) ( not ( = ?auto_16775 ?auto_16776 ) ) ( not ( = ?auto_16775 ?auto_16777 ) ) ( not ( = ?auto_16775 ?auto_16778 ) ) ( not ( = ?auto_16775 ?auto_16779 ) ) ( not ( = ?auto_16775 ?auto_16784 ) ) ( not ( = ?auto_16776 ?auto_16777 ) ) ( not ( = ?auto_16776 ?auto_16778 ) ) ( not ( = ?auto_16776 ?auto_16779 ) ) ( not ( = ?auto_16776 ?auto_16784 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16777 ?auto_16778 ?auto_16779 )
      ( MAKE-4CRATE-VERIFY ?auto_16775 ?auto_16776 ?auto_16777 ?auto_16778 ?auto_16779 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16786 - SURFACE
      ?auto_16787 - SURFACE
    )
    :vars
    (
      ?auto_16791 - HOIST
      ?auto_16790 - PLACE
      ?auto_16788 - SURFACE
      ?auto_16789 - PLACE
      ?auto_16794 - HOIST
      ?auto_16793 - SURFACE
      ?auto_16792 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16791 ?auto_16790 ) ( IS-CRATE ?auto_16787 ) ( not ( = ?auto_16786 ?auto_16787 ) ) ( not ( = ?auto_16788 ?auto_16786 ) ) ( not ( = ?auto_16788 ?auto_16787 ) ) ( not ( = ?auto_16789 ?auto_16790 ) ) ( HOIST-AT ?auto_16794 ?auto_16789 ) ( not ( = ?auto_16791 ?auto_16794 ) ) ( AVAILABLE ?auto_16794 ) ( SURFACE-AT ?auto_16787 ?auto_16789 ) ( ON ?auto_16787 ?auto_16793 ) ( CLEAR ?auto_16787 ) ( not ( = ?auto_16786 ?auto_16793 ) ) ( not ( = ?auto_16787 ?auto_16793 ) ) ( not ( = ?auto_16788 ?auto_16793 ) ) ( TRUCK-AT ?auto_16792 ?auto_16790 ) ( SURFACE-AT ?auto_16788 ?auto_16790 ) ( CLEAR ?auto_16788 ) ( IS-CRATE ?auto_16786 ) ( AVAILABLE ?auto_16791 ) ( IN ?auto_16786 ?auto_16792 ) )
    :subtasks
    ( ( !UNLOAD ?auto_16791 ?auto_16786 ?auto_16792 ?auto_16790 )
      ( MAKE-2CRATE ?auto_16788 ?auto_16786 ?auto_16787 )
      ( MAKE-1CRATE-VERIFY ?auto_16786 ?auto_16787 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16795 - SURFACE
      ?auto_16796 - SURFACE
      ?auto_16797 - SURFACE
    )
    :vars
    (
      ?auto_16800 - HOIST
      ?auto_16798 - PLACE
      ?auto_16799 - PLACE
      ?auto_16803 - HOIST
      ?auto_16801 - SURFACE
      ?auto_16802 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16800 ?auto_16798 ) ( IS-CRATE ?auto_16797 ) ( not ( = ?auto_16796 ?auto_16797 ) ) ( not ( = ?auto_16795 ?auto_16796 ) ) ( not ( = ?auto_16795 ?auto_16797 ) ) ( not ( = ?auto_16799 ?auto_16798 ) ) ( HOIST-AT ?auto_16803 ?auto_16799 ) ( not ( = ?auto_16800 ?auto_16803 ) ) ( AVAILABLE ?auto_16803 ) ( SURFACE-AT ?auto_16797 ?auto_16799 ) ( ON ?auto_16797 ?auto_16801 ) ( CLEAR ?auto_16797 ) ( not ( = ?auto_16796 ?auto_16801 ) ) ( not ( = ?auto_16797 ?auto_16801 ) ) ( not ( = ?auto_16795 ?auto_16801 ) ) ( TRUCK-AT ?auto_16802 ?auto_16798 ) ( SURFACE-AT ?auto_16795 ?auto_16798 ) ( CLEAR ?auto_16795 ) ( IS-CRATE ?auto_16796 ) ( AVAILABLE ?auto_16800 ) ( IN ?auto_16796 ?auto_16802 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16796 ?auto_16797 )
      ( MAKE-2CRATE-VERIFY ?auto_16795 ?auto_16796 ?auto_16797 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16804 - SURFACE
      ?auto_16805 - SURFACE
      ?auto_16806 - SURFACE
      ?auto_16807 - SURFACE
    )
    :vars
    (
      ?auto_16809 - HOIST
      ?auto_16808 - PLACE
      ?auto_16811 - PLACE
      ?auto_16812 - HOIST
      ?auto_16810 - SURFACE
      ?auto_16813 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16809 ?auto_16808 ) ( IS-CRATE ?auto_16807 ) ( not ( = ?auto_16806 ?auto_16807 ) ) ( not ( = ?auto_16805 ?auto_16806 ) ) ( not ( = ?auto_16805 ?auto_16807 ) ) ( not ( = ?auto_16811 ?auto_16808 ) ) ( HOIST-AT ?auto_16812 ?auto_16811 ) ( not ( = ?auto_16809 ?auto_16812 ) ) ( AVAILABLE ?auto_16812 ) ( SURFACE-AT ?auto_16807 ?auto_16811 ) ( ON ?auto_16807 ?auto_16810 ) ( CLEAR ?auto_16807 ) ( not ( = ?auto_16806 ?auto_16810 ) ) ( not ( = ?auto_16807 ?auto_16810 ) ) ( not ( = ?auto_16805 ?auto_16810 ) ) ( TRUCK-AT ?auto_16813 ?auto_16808 ) ( SURFACE-AT ?auto_16805 ?auto_16808 ) ( CLEAR ?auto_16805 ) ( IS-CRATE ?auto_16806 ) ( AVAILABLE ?auto_16809 ) ( IN ?auto_16806 ?auto_16813 ) ( ON ?auto_16805 ?auto_16804 ) ( not ( = ?auto_16804 ?auto_16805 ) ) ( not ( = ?auto_16804 ?auto_16806 ) ) ( not ( = ?auto_16804 ?auto_16807 ) ) ( not ( = ?auto_16804 ?auto_16810 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16805 ?auto_16806 ?auto_16807 )
      ( MAKE-3CRATE-VERIFY ?auto_16804 ?auto_16805 ?auto_16806 ?auto_16807 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16814 - SURFACE
      ?auto_16815 - SURFACE
      ?auto_16816 - SURFACE
      ?auto_16817 - SURFACE
      ?auto_16818 - SURFACE
    )
    :vars
    (
      ?auto_16820 - HOIST
      ?auto_16819 - PLACE
      ?auto_16822 - PLACE
      ?auto_16823 - HOIST
      ?auto_16821 - SURFACE
      ?auto_16824 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16820 ?auto_16819 ) ( IS-CRATE ?auto_16818 ) ( not ( = ?auto_16817 ?auto_16818 ) ) ( not ( = ?auto_16816 ?auto_16817 ) ) ( not ( = ?auto_16816 ?auto_16818 ) ) ( not ( = ?auto_16822 ?auto_16819 ) ) ( HOIST-AT ?auto_16823 ?auto_16822 ) ( not ( = ?auto_16820 ?auto_16823 ) ) ( AVAILABLE ?auto_16823 ) ( SURFACE-AT ?auto_16818 ?auto_16822 ) ( ON ?auto_16818 ?auto_16821 ) ( CLEAR ?auto_16818 ) ( not ( = ?auto_16817 ?auto_16821 ) ) ( not ( = ?auto_16818 ?auto_16821 ) ) ( not ( = ?auto_16816 ?auto_16821 ) ) ( TRUCK-AT ?auto_16824 ?auto_16819 ) ( SURFACE-AT ?auto_16816 ?auto_16819 ) ( CLEAR ?auto_16816 ) ( IS-CRATE ?auto_16817 ) ( AVAILABLE ?auto_16820 ) ( IN ?auto_16817 ?auto_16824 ) ( ON ?auto_16815 ?auto_16814 ) ( ON ?auto_16816 ?auto_16815 ) ( not ( = ?auto_16814 ?auto_16815 ) ) ( not ( = ?auto_16814 ?auto_16816 ) ) ( not ( = ?auto_16814 ?auto_16817 ) ) ( not ( = ?auto_16814 ?auto_16818 ) ) ( not ( = ?auto_16814 ?auto_16821 ) ) ( not ( = ?auto_16815 ?auto_16816 ) ) ( not ( = ?auto_16815 ?auto_16817 ) ) ( not ( = ?auto_16815 ?auto_16818 ) ) ( not ( = ?auto_16815 ?auto_16821 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16816 ?auto_16817 ?auto_16818 )
      ( MAKE-4CRATE-VERIFY ?auto_16814 ?auto_16815 ?auto_16816 ?auto_16817 ?auto_16818 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16825 - SURFACE
      ?auto_16826 - SURFACE
    )
    :vars
    (
      ?auto_16829 - HOIST
      ?auto_16828 - PLACE
      ?auto_16827 - SURFACE
      ?auto_16831 - PLACE
      ?auto_16832 - HOIST
      ?auto_16830 - SURFACE
      ?auto_16833 - TRUCK
      ?auto_16834 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16829 ?auto_16828 ) ( IS-CRATE ?auto_16826 ) ( not ( = ?auto_16825 ?auto_16826 ) ) ( not ( = ?auto_16827 ?auto_16825 ) ) ( not ( = ?auto_16827 ?auto_16826 ) ) ( not ( = ?auto_16831 ?auto_16828 ) ) ( HOIST-AT ?auto_16832 ?auto_16831 ) ( not ( = ?auto_16829 ?auto_16832 ) ) ( AVAILABLE ?auto_16832 ) ( SURFACE-AT ?auto_16826 ?auto_16831 ) ( ON ?auto_16826 ?auto_16830 ) ( CLEAR ?auto_16826 ) ( not ( = ?auto_16825 ?auto_16830 ) ) ( not ( = ?auto_16826 ?auto_16830 ) ) ( not ( = ?auto_16827 ?auto_16830 ) ) ( SURFACE-AT ?auto_16827 ?auto_16828 ) ( CLEAR ?auto_16827 ) ( IS-CRATE ?auto_16825 ) ( AVAILABLE ?auto_16829 ) ( IN ?auto_16825 ?auto_16833 ) ( TRUCK-AT ?auto_16833 ?auto_16834 ) ( not ( = ?auto_16834 ?auto_16828 ) ) ( not ( = ?auto_16831 ?auto_16834 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16833 ?auto_16834 ?auto_16828 )
      ( MAKE-2CRATE ?auto_16827 ?auto_16825 ?auto_16826 )
      ( MAKE-1CRATE-VERIFY ?auto_16825 ?auto_16826 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16835 - SURFACE
      ?auto_16836 - SURFACE
      ?auto_16837 - SURFACE
    )
    :vars
    (
      ?auto_16840 - HOIST
      ?auto_16841 - PLACE
      ?auto_16839 - PLACE
      ?auto_16843 - HOIST
      ?auto_16842 - SURFACE
      ?auto_16844 - TRUCK
      ?auto_16838 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16840 ?auto_16841 ) ( IS-CRATE ?auto_16837 ) ( not ( = ?auto_16836 ?auto_16837 ) ) ( not ( = ?auto_16835 ?auto_16836 ) ) ( not ( = ?auto_16835 ?auto_16837 ) ) ( not ( = ?auto_16839 ?auto_16841 ) ) ( HOIST-AT ?auto_16843 ?auto_16839 ) ( not ( = ?auto_16840 ?auto_16843 ) ) ( AVAILABLE ?auto_16843 ) ( SURFACE-AT ?auto_16837 ?auto_16839 ) ( ON ?auto_16837 ?auto_16842 ) ( CLEAR ?auto_16837 ) ( not ( = ?auto_16836 ?auto_16842 ) ) ( not ( = ?auto_16837 ?auto_16842 ) ) ( not ( = ?auto_16835 ?auto_16842 ) ) ( SURFACE-AT ?auto_16835 ?auto_16841 ) ( CLEAR ?auto_16835 ) ( IS-CRATE ?auto_16836 ) ( AVAILABLE ?auto_16840 ) ( IN ?auto_16836 ?auto_16844 ) ( TRUCK-AT ?auto_16844 ?auto_16838 ) ( not ( = ?auto_16838 ?auto_16841 ) ) ( not ( = ?auto_16839 ?auto_16838 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16836 ?auto_16837 )
      ( MAKE-2CRATE-VERIFY ?auto_16835 ?auto_16836 ?auto_16837 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16845 - SURFACE
      ?auto_16846 - SURFACE
      ?auto_16847 - SURFACE
      ?auto_16848 - SURFACE
    )
    :vars
    (
      ?auto_16851 - HOIST
      ?auto_16855 - PLACE
      ?auto_16853 - PLACE
      ?auto_16849 - HOIST
      ?auto_16850 - SURFACE
      ?auto_16852 - TRUCK
      ?auto_16854 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16851 ?auto_16855 ) ( IS-CRATE ?auto_16848 ) ( not ( = ?auto_16847 ?auto_16848 ) ) ( not ( = ?auto_16846 ?auto_16847 ) ) ( not ( = ?auto_16846 ?auto_16848 ) ) ( not ( = ?auto_16853 ?auto_16855 ) ) ( HOIST-AT ?auto_16849 ?auto_16853 ) ( not ( = ?auto_16851 ?auto_16849 ) ) ( AVAILABLE ?auto_16849 ) ( SURFACE-AT ?auto_16848 ?auto_16853 ) ( ON ?auto_16848 ?auto_16850 ) ( CLEAR ?auto_16848 ) ( not ( = ?auto_16847 ?auto_16850 ) ) ( not ( = ?auto_16848 ?auto_16850 ) ) ( not ( = ?auto_16846 ?auto_16850 ) ) ( SURFACE-AT ?auto_16846 ?auto_16855 ) ( CLEAR ?auto_16846 ) ( IS-CRATE ?auto_16847 ) ( AVAILABLE ?auto_16851 ) ( IN ?auto_16847 ?auto_16852 ) ( TRUCK-AT ?auto_16852 ?auto_16854 ) ( not ( = ?auto_16854 ?auto_16855 ) ) ( not ( = ?auto_16853 ?auto_16854 ) ) ( ON ?auto_16846 ?auto_16845 ) ( not ( = ?auto_16845 ?auto_16846 ) ) ( not ( = ?auto_16845 ?auto_16847 ) ) ( not ( = ?auto_16845 ?auto_16848 ) ) ( not ( = ?auto_16845 ?auto_16850 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16846 ?auto_16847 ?auto_16848 )
      ( MAKE-3CRATE-VERIFY ?auto_16845 ?auto_16846 ?auto_16847 ?auto_16848 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16856 - SURFACE
      ?auto_16857 - SURFACE
      ?auto_16858 - SURFACE
      ?auto_16859 - SURFACE
      ?auto_16860 - SURFACE
    )
    :vars
    (
      ?auto_16863 - HOIST
      ?auto_16867 - PLACE
      ?auto_16865 - PLACE
      ?auto_16861 - HOIST
      ?auto_16862 - SURFACE
      ?auto_16864 - TRUCK
      ?auto_16866 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16863 ?auto_16867 ) ( IS-CRATE ?auto_16860 ) ( not ( = ?auto_16859 ?auto_16860 ) ) ( not ( = ?auto_16858 ?auto_16859 ) ) ( not ( = ?auto_16858 ?auto_16860 ) ) ( not ( = ?auto_16865 ?auto_16867 ) ) ( HOIST-AT ?auto_16861 ?auto_16865 ) ( not ( = ?auto_16863 ?auto_16861 ) ) ( AVAILABLE ?auto_16861 ) ( SURFACE-AT ?auto_16860 ?auto_16865 ) ( ON ?auto_16860 ?auto_16862 ) ( CLEAR ?auto_16860 ) ( not ( = ?auto_16859 ?auto_16862 ) ) ( not ( = ?auto_16860 ?auto_16862 ) ) ( not ( = ?auto_16858 ?auto_16862 ) ) ( SURFACE-AT ?auto_16858 ?auto_16867 ) ( CLEAR ?auto_16858 ) ( IS-CRATE ?auto_16859 ) ( AVAILABLE ?auto_16863 ) ( IN ?auto_16859 ?auto_16864 ) ( TRUCK-AT ?auto_16864 ?auto_16866 ) ( not ( = ?auto_16866 ?auto_16867 ) ) ( not ( = ?auto_16865 ?auto_16866 ) ) ( ON ?auto_16857 ?auto_16856 ) ( ON ?auto_16858 ?auto_16857 ) ( not ( = ?auto_16856 ?auto_16857 ) ) ( not ( = ?auto_16856 ?auto_16858 ) ) ( not ( = ?auto_16856 ?auto_16859 ) ) ( not ( = ?auto_16856 ?auto_16860 ) ) ( not ( = ?auto_16856 ?auto_16862 ) ) ( not ( = ?auto_16857 ?auto_16858 ) ) ( not ( = ?auto_16857 ?auto_16859 ) ) ( not ( = ?auto_16857 ?auto_16860 ) ) ( not ( = ?auto_16857 ?auto_16862 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16858 ?auto_16859 ?auto_16860 )
      ( MAKE-4CRATE-VERIFY ?auto_16856 ?auto_16857 ?auto_16858 ?auto_16859 ?auto_16860 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16868 - SURFACE
      ?auto_16869 - SURFACE
    )
    :vars
    (
      ?auto_16872 - HOIST
      ?auto_16876 - PLACE
      ?auto_16877 - SURFACE
      ?auto_16874 - PLACE
      ?auto_16870 - HOIST
      ?auto_16871 - SURFACE
      ?auto_16873 - TRUCK
      ?auto_16875 - PLACE
      ?auto_16878 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16872 ?auto_16876 ) ( IS-CRATE ?auto_16869 ) ( not ( = ?auto_16868 ?auto_16869 ) ) ( not ( = ?auto_16877 ?auto_16868 ) ) ( not ( = ?auto_16877 ?auto_16869 ) ) ( not ( = ?auto_16874 ?auto_16876 ) ) ( HOIST-AT ?auto_16870 ?auto_16874 ) ( not ( = ?auto_16872 ?auto_16870 ) ) ( AVAILABLE ?auto_16870 ) ( SURFACE-AT ?auto_16869 ?auto_16874 ) ( ON ?auto_16869 ?auto_16871 ) ( CLEAR ?auto_16869 ) ( not ( = ?auto_16868 ?auto_16871 ) ) ( not ( = ?auto_16869 ?auto_16871 ) ) ( not ( = ?auto_16877 ?auto_16871 ) ) ( SURFACE-AT ?auto_16877 ?auto_16876 ) ( CLEAR ?auto_16877 ) ( IS-CRATE ?auto_16868 ) ( AVAILABLE ?auto_16872 ) ( TRUCK-AT ?auto_16873 ?auto_16875 ) ( not ( = ?auto_16875 ?auto_16876 ) ) ( not ( = ?auto_16874 ?auto_16875 ) ) ( HOIST-AT ?auto_16878 ?auto_16875 ) ( LIFTING ?auto_16878 ?auto_16868 ) ( not ( = ?auto_16872 ?auto_16878 ) ) ( not ( = ?auto_16870 ?auto_16878 ) ) )
    :subtasks
    ( ( !LOAD ?auto_16878 ?auto_16868 ?auto_16873 ?auto_16875 )
      ( MAKE-2CRATE ?auto_16877 ?auto_16868 ?auto_16869 )
      ( MAKE-1CRATE-VERIFY ?auto_16868 ?auto_16869 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16879 - SURFACE
      ?auto_16880 - SURFACE
      ?auto_16881 - SURFACE
    )
    :vars
    (
      ?auto_16882 - HOIST
      ?auto_16886 - PLACE
      ?auto_16889 - PLACE
      ?auto_16888 - HOIST
      ?auto_16885 - SURFACE
      ?auto_16887 - TRUCK
      ?auto_16883 - PLACE
      ?auto_16884 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16882 ?auto_16886 ) ( IS-CRATE ?auto_16881 ) ( not ( = ?auto_16880 ?auto_16881 ) ) ( not ( = ?auto_16879 ?auto_16880 ) ) ( not ( = ?auto_16879 ?auto_16881 ) ) ( not ( = ?auto_16889 ?auto_16886 ) ) ( HOIST-AT ?auto_16888 ?auto_16889 ) ( not ( = ?auto_16882 ?auto_16888 ) ) ( AVAILABLE ?auto_16888 ) ( SURFACE-AT ?auto_16881 ?auto_16889 ) ( ON ?auto_16881 ?auto_16885 ) ( CLEAR ?auto_16881 ) ( not ( = ?auto_16880 ?auto_16885 ) ) ( not ( = ?auto_16881 ?auto_16885 ) ) ( not ( = ?auto_16879 ?auto_16885 ) ) ( SURFACE-AT ?auto_16879 ?auto_16886 ) ( CLEAR ?auto_16879 ) ( IS-CRATE ?auto_16880 ) ( AVAILABLE ?auto_16882 ) ( TRUCK-AT ?auto_16887 ?auto_16883 ) ( not ( = ?auto_16883 ?auto_16886 ) ) ( not ( = ?auto_16889 ?auto_16883 ) ) ( HOIST-AT ?auto_16884 ?auto_16883 ) ( LIFTING ?auto_16884 ?auto_16880 ) ( not ( = ?auto_16882 ?auto_16884 ) ) ( not ( = ?auto_16888 ?auto_16884 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16880 ?auto_16881 )
      ( MAKE-2CRATE-VERIFY ?auto_16879 ?auto_16880 ?auto_16881 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16890 - SURFACE
      ?auto_16891 - SURFACE
      ?auto_16892 - SURFACE
      ?auto_16893 - SURFACE
    )
    :vars
    (
      ?auto_16894 - HOIST
      ?auto_16895 - PLACE
      ?auto_16899 - PLACE
      ?auto_16897 - HOIST
      ?auto_16900 - SURFACE
      ?auto_16898 - TRUCK
      ?auto_16896 - PLACE
      ?auto_16901 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16894 ?auto_16895 ) ( IS-CRATE ?auto_16893 ) ( not ( = ?auto_16892 ?auto_16893 ) ) ( not ( = ?auto_16891 ?auto_16892 ) ) ( not ( = ?auto_16891 ?auto_16893 ) ) ( not ( = ?auto_16899 ?auto_16895 ) ) ( HOIST-AT ?auto_16897 ?auto_16899 ) ( not ( = ?auto_16894 ?auto_16897 ) ) ( AVAILABLE ?auto_16897 ) ( SURFACE-AT ?auto_16893 ?auto_16899 ) ( ON ?auto_16893 ?auto_16900 ) ( CLEAR ?auto_16893 ) ( not ( = ?auto_16892 ?auto_16900 ) ) ( not ( = ?auto_16893 ?auto_16900 ) ) ( not ( = ?auto_16891 ?auto_16900 ) ) ( SURFACE-AT ?auto_16891 ?auto_16895 ) ( CLEAR ?auto_16891 ) ( IS-CRATE ?auto_16892 ) ( AVAILABLE ?auto_16894 ) ( TRUCK-AT ?auto_16898 ?auto_16896 ) ( not ( = ?auto_16896 ?auto_16895 ) ) ( not ( = ?auto_16899 ?auto_16896 ) ) ( HOIST-AT ?auto_16901 ?auto_16896 ) ( LIFTING ?auto_16901 ?auto_16892 ) ( not ( = ?auto_16894 ?auto_16901 ) ) ( not ( = ?auto_16897 ?auto_16901 ) ) ( ON ?auto_16891 ?auto_16890 ) ( not ( = ?auto_16890 ?auto_16891 ) ) ( not ( = ?auto_16890 ?auto_16892 ) ) ( not ( = ?auto_16890 ?auto_16893 ) ) ( not ( = ?auto_16890 ?auto_16900 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16891 ?auto_16892 ?auto_16893 )
      ( MAKE-3CRATE-VERIFY ?auto_16890 ?auto_16891 ?auto_16892 ?auto_16893 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16902 - SURFACE
      ?auto_16903 - SURFACE
      ?auto_16904 - SURFACE
      ?auto_16905 - SURFACE
      ?auto_16906 - SURFACE
    )
    :vars
    (
      ?auto_16907 - HOIST
      ?auto_16908 - PLACE
      ?auto_16912 - PLACE
      ?auto_16910 - HOIST
      ?auto_16913 - SURFACE
      ?auto_16911 - TRUCK
      ?auto_16909 - PLACE
      ?auto_16914 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16907 ?auto_16908 ) ( IS-CRATE ?auto_16906 ) ( not ( = ?auto_16905 ?auto_16906 ) ) ( not ( = ?auto_16904 ?auto_16905 ) ) ( not ( = ?auto_16904 ?auto_16906 ) ) ( not ( = ?auto_16912 ?auto_16908 ) ) ( HOIST-AT ?auto_16910 ?auto_16912 ) ( not ( = ?auto_16907 ?auto_16910 ) ) ( AVAILABLE ?auto_16910 ) ( SURFACE-AT ?auto_16906 ?auto_16912 ) ( ON ?auto_16906 ?auto_16913 ) ( CLEAR ?auto_16906 ) ( not ( = ?auto_16905 ?auto_16913 ) ) ( not ( = ?auto_16906 ?auto_16913 ) ) ( not ( = ?auto_16904 ?auto_16913 ) ) ( SURFACE-AT ?auto_16904 ?auto_16908 ) ( CLEAR ?auto_16904 ) ( IS-CRATE ?auto_16905 ) ( AVAILABLE ?auto_16907 ) ( TRUCK-AT ?auto_16911 ?auto_16909 ) ( not ( = ?auto_16909 ?auto_16908 ) ) ( not ( = ?auto_16912 ?auto_16909 ) ) ( HOIST-AT ?auto_16914 ?auto_16909 ) ( LIFTING ?auto_16914 ?auto_16905 ) ( not ( = ?auto_16907 ?auto_16914 ) ) ( not ( = ?auto_16910 ?auto_16914 ) ) ( ON ?auto_16903 ?auto_16902 ) ( ON ?auto_16904 ?auto_16903 ) ( not ( = ?auto_16902 ?auto_16903 ) ) ( not ( = ?auto_16902 ?auto_16904 ) ) ( not ( = ?auto_16902 ?auto_16905 ) ) ( not ( = ?auto_16902 ?auto_16906 ) ) ( not ( = ?auto_16902 ?auto_16913 ) ) ( not ( = ?auto_16903 ?auto_16904 ) ) ( not ( = ?auto_16903 ?auto_16905 ) ) ( not ( = ?auto_16903 ?auto_16906 ) ) ( not ( = ?auto_16903 ?auto_16913 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16904 ?auto_16905 ?auto_16906 )
      ( MAKE-4CRATE-VERIFY ?auto_16902 ?auto_16903 ?auto_16904 ?auto_16905 ?auto_16906 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16915 - SURFACE
      ?auto_16916 - SURFACE
    )
    :vars
    (
      ?auto_16918 - HOIST
      ?auto_16919 - PLACE
      ?auto_16917 - SURFACE
      ?auto_16923 - PLACE
      ?auto_16921 - HOIST
      ?auto_16924 - SURFACE
      ?auto_16922 - TRUCK
      ?auto_16920 - PLACE
      ?auto_16925 - HOIST
      ?auto_16926 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16918 ?auto_16919 ) ( IS-CRATE ?auto_16916 ) ( not ( = ?auto_16915 ?auto_16916 ) ) ( not ( = ?auto_16917 ?auto_16915 ) ) ( not ( = ?auto_16917 ?auto_16916 ) ) ( not ( = ?auto_16923 ?auto_16919 ) ) ( HOIST-AT ?auto_16921 ?auto_16923 ) ( not ( = ?auto_16918 ?auto_16921 ) ) ( AVAILABLE ?auto_16921 ) ( SURFACE-AT ?auto_16916 ?auto_16923 ) ( ON ?auto_16916 ?auto_16924 ) ( CLEAR ?auto_16916 ) ( not ( = ?auto_16915 ?auto_16924 ) ) ( not ( = ?auto_16916 ?auto_16924 ) ) ( not ( = ?auto_16917 ?auto_16924 ) ) ( SURFACE-AT ?auto_16917 ?auto_16919 ) ( CLEAR ?auto_16917 ) ( IS-CRATE ?auto_16915 ) ( AVAILABLE ?auto_16918 ) ( TRUCK-AT ?auto_16922 ?auto_16920 ) ( not ( = ?auto_16920 ?auto_16919 ) ) ( not ( = ?auto_16923 ?auto_16920 ) ) ( HOIST-AT ?auto_16925 ?auto_16920 ) ( not ( = ?auto_16918 ?auto_16925 ) ) ( not ( = ?auto_16921 ?auto_16925 ) ) ( AVAILABLE ?auto_16925 ) ( SURFACE-AT ?auto_16915 ?auto_16920 ) ( ON ?auto_16915 ?auto_16926 ) ( CLEAR ?auto_16915 ) ( not ( = ?auto_16915 ?auto_16926 ) ) ( not ( = ?auto_16916 ?auto_16926 ) ) ( not ( = ?auto_16917 ?auto_16926 ) ) ( not ( = ?auto_16924 ?auto_16926 ) ) )
    :subtasks
    ( ( !LIFT ?auto_16925 ?auto_16915 ?auto_16926 ?auto_16920 )
      ( MAKE-2CRATE ?auto_16917 ?auto_16915 ?auto_16916 )
      ( MAKE-1CRATE-VERIFY ?auto_16915 ?auto_16916 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16927 - SURFACE
      ?auto_16928 - SURFACE
      ?auto_16929 - SURFACE
    )
    :vars
    (
      ?auto_16932 - HOIST
      ?auto_16938 - PLACE
      ?auto_16934 - PLACE
      ?auto_16935 - HOIST
      ?auto_16931 - SURFACE
      ?auto_16933 - TRUCK
      ?auto_16930 - PLACE
      ?auto_16937 - HOIST
      ?auto_16936 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16932 ?auto_16938 ) ( IS-CRATE ?auto_16929 ) ( not ( = ?auto_16928 ?auto_16929 ) ) ( not ( = ?auto_16927 ?auto_16928 ) ) ( not ( = ?auto_16927 ?auto_16929 ) ) ( not ( = ?auto_16934 ?auto_16938 ) ) ( HOIST-AT ?auto_16935 ?auto_16934 ) ( not ( = ?auto_16932 ?auto_16935 ) ) ( AVAILABLE ?auto_16935 ) ( SURFACE-AT ?auto_16929 ?auto_16934 ) ( ON ?auto_16929 ?auto_16931 ) ( CLEAR ?auto_16929 ) ( not ( = ?auto_16928 ?auto_16931 ) ) ( not ( = ?auto_16929 ?auto_16931 ) ) ( not ( = ?auto_16927 ?auto_16931 ) ) ( SURFACE-AT ?auto_16927 ?auto_16938 ) ( CLEAR ?auto_16927 ) ( IS-CRATE ?auto_16928 ) ( AVAILABLE ?auto_16932 ) ( TRUCK-AT ?auto_16933 ?auto_16930 ) ( not ( = ?auto_16930 ?auto_16938 ) ) ( not ( = ?auto_16934 ?auto_16930 ) ) ( HOIST-AT ?auto_16937 ?auto_16930 ) ( not ( = ?auto_16932 ?auto_16937 ) ) ( not ( = ?auto_16935 ?auto_16937 ) ) ( AVAILABLE ?auto_16937 ) ( SURFACE-AT ?auto_16928 ?auto_16930 ) ( ON ?auto_16928 ?auto_16936 ) ( CLEAR ?auto_16928 ) ( not ( = ?auto_16928 ?auto_16936 ) ) ( not ( = ?auto_16929 ?auto_16936 ) ) ( not ( = ?auto_16927 ?auto_16936 ) ) ( not ( = ?auto_16931 ?auto_16936 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16928 ?auto_16929 )
      ( MAKE-2CRATE-VERIFY ?auto_16927 ?auto_16928 ?auto_16929 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16939 - SURFACE
      ?auto_16940 - SURFACE
      ?auto_16941 - SURFACE
      ?auto_16942 - SURFACE
    )
    :vars
    (
      ?auto_16950 - HOIST
      ?auto_16951 - PLACE
      ?auto_16944 - PLACE
      ?auto_16947 - HOIST
      ?auto_16945 - SURFACE
      ?auto_16943 - TRUCK
      ?auto_16946 - PLACE
      ?auto_16949 - HOIST
      ?auto_16948 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16950 ?auto_16951 ) ( IS-CRATE ?auto_16942 ) ( not ( = ?auto_16941 ?auto_16942 ) ) ( not ( = ?auto_16940 ?auto_16941 ) ) ( not ( = ?auto_16940 ?auto_16942 ) ) ( not ( = ?auto_16944 ?auto_16951 ) ) ( HOIST-AT ?auto_16947 ?auto_16944 ) ( not ( = ?auto_16950 ?auto_16947 ) ) ( AVAILABLE ?auto_16947 ) ( SURFACE-AT ?auto_16942 ?auto_16944 ) ( ON ?auto_16942 ?auto_16945 ) ( CLEAR ?auto_16942 ) ( not ( = ?auto_16941 ?auto_16945 ) ) ( not ( = ?auto_16942 ?auto_16945 ) ) ( not ( = ?auto_16940 ?auto_16945 ) ) ( SURFACE-AT ?auto_16940 ?auto_16951 ) ( CLEAR ?auto_16940 ) ( IS-CRATE ?auto_16941 ) ( AVAILABLE ?auto_16950 ) ( TRUCK-AT ?auto_16943 ?auto_16946 ) ( not ( = ?auto_16946 ?auto_16951 ) ) ( not ( = ?auto_16944 ?auto_16946 ) ) ( HOIST-AT ?auto_16949 ?auto_16946 ) ( not ( = ?auto_16950 ?auto_16949 ) ) ( not ( = ?auto_16947 ?auto_16949 ) ) ( AVAILABLE ?auto_16949 ) ( SURFACE-AT ?auto_16941 ?auto_16946 ) ( ON ?auto_16941 ?auto_16948 ) ( CLEAR ?auto_16941 ) ( not ( = ?auto_16941 ?auto_16948 ) ) ( not ( = ?auto_16942 ?auto_16948 ) ) ( not ( = ?auto_16940 ?auto_16948 ) ) ( not ( = ?auto_16945 ?auto_16948 ) ) ( ON ?auto_16940 ?auto_16939 ) ( not ( = ?auto_16939 ?auto_16940 ) ) ( not ( = ?auto_16939 ?auto_16941 ) ) ( not ( = ?auto_16939 ?auto_16942 ) ) ( not ( = ?auto_16939 ?auto_16945 ) ) ( not ( = ?auto_16939 ?auto_16948 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16940 ?auto_16941 ?auto_16942 )
      ( MAKE-3CRATE-VERIFY ?auto_16939 ?auto_16940 ?auto_16941 ?auto_16942 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16952 - SURFACE
      ?auto_16953 - SURFACE
      ?auto_16954 - SURFACE
      ?auto_16955 - SURFACE
      ?auto_16956 - SURFACE
    )
    :vars
    (
      ?auto_16964 - HOIST
      ?auto_16965 - PLACE
      ?auto_16958 - PLACE
      ?auto_16961 - HOIST
      ?auto_16959 - SURFACE
      ?auto_16957 - TRUCK
      ?auto_16960 - PLACE
      ?auto_16963 - HOIST
      ?auto_16962 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16964 ?auto_16965 ) ( IS-CRATE ?auto_16956 ) ( not ( = ?auto_16955 ?auto_16956 ) ) ( not ( = ?auto_16954 ?auto_16955 ) ) ( not ( = ?auto_16954 ?auto_16956 ) ) ( not ( = ?auto_16958 ?auto_16965 ) ) ( HOIST-AT ?auto_16961 ?auto_16958 ) ( not ( = ?auto_16964 ?auto_16961 ) ) ( AVAILABLE ?auto_16961 ) ( SURFACE-AT ?auto_16956 ?auto_16958 ) ( ON ?auto_16956 ?auto_16959 ) ( CLEAR ?auto_16956 ) ( not ( = ?auto_16955 ?auto_16959 ) ) ( not ( = ?auto_16956 ?auto_16959 ) ) ( not ( = ?auto_16954 ?auto_16959 ) ) ( SURFACE-AT ?auto_16954 ?auto_16965 ) ( CLEAR ?auto_16954 ) ( IS-CRATE ?auto_16955 ) ( AVAILABLE ?auto_16964 ) ( TRUCK-AT ?auto_16957 ?auto_16960 ) ( not ( = ?auto_16960 ?auto_16965 ) ) ( not ( = ?auto_16958 ?auto_16960 ) ) ( HOIST-AT ?auto_16963 ?auto_16960 ) ( not ( = ?auto_16964 ?auto_16963 ) ) ( not ( = ?auto_16961 ?auto_16963 ) ) ( AVAILABLE ?auto_16963 ) ( SURFACE-AT ?auto_16955 ?auto_16960 ) ( ON ?auto_16955 ?auto_16962 ) ( CLEAR ?auto_16955 ) ( not ( = ?auto_16955 ?auto_16962 ) ) ( not ( = ?auto_16956 ?auto_16962 ) ) ( not ( = ?auto_16954 ?auto_16962 ) ) ( not ( = ?auto_16959 ?auto_16962 ) ) ( ON ?auto_16953 ?auto_16952 ) ( ON ?auto_16954 ?auto_16953 ) ( not ( = ?auto_16952 ?auto_16953 ) ) ( not ( = ?auto_16952 ?auto_16954 ) ) ( not ( = ?auto_16952 ?auto_16955 ) ) ( not ( = ?auto_16952 ?auto_16956 ) ) ( not ( = ?auto_16952 ?auto_16959 ) ) ( not ( = ?auto_16952 ?auto_16962 ) ) ( not ( = ?auto_16953 ?auto_16954 ) ) ( not ( = ?auto_16953 ?auto_16955 ) ) ( not ( = ?auto_16953 ?auto_16956 ) ) ( not ( = ?auto_16953 ?auto_16959 ) ) ( not ( = ?auto_16953 ?auto_16962 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16954 ?auto_16955 ?auto_16956 )
      ( MAKE-4CRATE-VERIFY ?auto_16952 ?auto_16953 ?auto_16954 ?auto_16955 ?auto_16956 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16966 - SURFACE
      ?auto_16967 - SURFACE
    )
    :vars
    (
      ?auto_16976 - HOIST
      ?auto_16977 - PLACE
      ?auto_16972 - SURFACE
      ?auto_16969 - PLACE
      ?auto_16973 - HOIST
      ?auto_16970 - SURFACE
      ?auto_16971 - PLACE
      ?auto_16975 - HOIST
      ?auto_16974 - SURFACE
      ?auto_16968 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16976 ?auto_16977 ) ( IS-CRATE ?auto_16967 ) ( not ( = ?auto_16966 ?auto_16967 ) ) ( not ( = ?auto_16972 ?auto_16966 ) ) ( not ( = ?auto_16972 ?auto_16967 ) ) ( not ( = ?auto_16969 ?auto_16977 ) ) ( HOIST-AT ?auto_16973 ?auto_16969 ) ( not ( = ?auto_16976 ?auto_16973 ) ) ( AVAILABLE ?auto_16973 ) ( SURFACE-AT ?auto_16967 ?auto_16969 ) ( ON ?auto_16967 ?auto_16970 ) ( CLEAR ?auto_16967 ) ( not ( = ?auto_16966 ?auto_16970 ) ) ( not ( = ?auto_16967 ?auto_16970 ) ) ( not ( = ?auto_16972 ?auto_16970 ) ) ( SURFACE-AT ?auto_16972 ?auto_16977 ) ( CLEAR ?auto_16972 ) ( IS-CRATE ?auto_16966 ) ( AVAILABLE ?auto_16976 ) ( not ( = ?auto_16971 ?auto_16977 ) ) ( not ( = ?auto_16969 ?auto_16971 ) ) ( HOIST-AT ?auto_16975 ?auto_16971 ) ( not ( = ?auto_16976 ?auto_16975 ) ) ( not ( = ?auto_16973 ?auto_16975 ) ) ( AVAILABLE ?auto_16975 ) ( SURFACE-AT ?auto_16966 ?auto_16971 ) ( ON ?auto_16966 ?auto_16974 ) ( CLEAR ?auto_16966 ) ( not ( = ?auto_16966 ?auto_16974 ) ) ( not ( = ?auto_16967 ?auto_16974 ) ) ( not ( = ?auto_16972 ?auto_16974 ) ) ( not ( = ?auto_16970 ?auto_16974 ) ) ( TRUCK-AT ?auto_16968 ?auto_16977 ) )
    :subtasks
    ( ( !DRIVE ?auto_16968 ?auto_16977 ?auto_16971 )
      ( MAKE-2CRATE ?auto_16972 ?auto_16966 ?auto_16967 )
      ( MAKE-1CRATE-VERIFY ?auto_16966 ?auto_16967 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16978 - SURFACE
      ?auto_16979 - SURFACE
      ?auto_16980 - SURFACE
    )
    :vars
    (
      ?auto_16984 - HOIST
      ?auto_16983 - PLACE
      ?auto_16985 - PLACE
      ?auto_16982 - HOIST
      ?auto_16987 - SURFACE
      ?auto_16988 - PLACE
      ?auto_16989 - HOIST
      ?auto_16981 - SURFACE
      ?auto_16986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16984 ?auto_16983 ) ( IS-CRATE ?auto_16980 ) ( not ( = ?auto_16979 ?auto_16980 ) ) ( not ( = ?auto_16978 ?auto_16979 ) ) ( not ( = ?auto_16978 ?auto_16980 ) ) ( not ( = ?auto_16985 ?auto_16983 ) ) ( HOIST-AT ?auto_16982 ?auto_16985 ) ( not ( = ?auto_16984 ?auto_16982 ) ) ( AVAILABLE ?auto_16982 ) ( SURFACE-AT ?auto_16980 ?auto_16985 ) ( ON ?auto_16980 ?auto_16987 ) ( CLEAR ?auto_16980 ) ( not ( = ?auto_16979 ?auto_16987 ) ) ( not ( = ?auto_16980 ?auto_16987 ) ) ( not ( = ?auto_16978 ?auto_16987 ) ) ( SURFACE-AT ?auto_16978 ?auto_16983 ) ( CLEAR ?auto_16978 ) ( IS-CRATE ?auto_16979 ) ( AVAILABLE ?auto_16984 ) ( not ( = ?auto_16988 ?auto_16983 ) ) ( not ( = ?auto_16985 ?auto_16988 ) ) ( HOIST-AT ?auto_16989 ?auto_16988 ) ( not ( = ?auto_16984 ?auto_16989 ) ) ( not ( = ?auto_16982 ?auto_16989 ) ) ( AVAILABLE ?auto_16989 ) ( SURFACE-AT ?auto_16979 ?auto_16988 ) ( ON ?auto_16979 ?auto_16981 ) ( CLEAR ?auto_16979 ) ( not ( = ?auto_16979 ?auto_16981 ) ) ( not ( = ?auto_16980 ?auto_16981 ) ) ( not ( = ?auto_16978 ?auto_16981 ) ) ( not ( = ?auto_16987 ?auto_16981 ) ) ( TRUCK-AT ?auto_16986 ?auto_16983 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16979 ?auto_16980 )
      ( MAKE-2CRATE-VERIFY ?auto_16978 ?auto_16979 ?auto_16980 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16990 - SURFACE
      ?auto_16991 - SURFACE
      ?auto_16992 - SURFACE
      ?auto_16993 - SURFACE
    )
    :vars
    (
      ?auto_17000 - HOIST
      ?auto_16999 - PLACE
      ?auto_16995 - PLACE
      ?auto_16997 - HOIST
      ?auto_17002 - SURFACE
      ?auto_16998 - PLACE
      ?auto_16994 - HOIST
      ?auto_16996 - SURFACE
      ?auto_17001 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17000 ?auto_16999 ) ( IS-CRATE ?auto_16993 ) ( not ( = ?auto_16992 ?auto_16993 ) ) ( not ( = ?auto_16991 ?auto_16992 ) ) ( not ( = ?auto_16991 ?auto_16993 ) ) ( not ( = ?auto_16995 ?auto_16999 ) ) ( HOIST-AT ?auto_16997 ?auto_16995 ) ( not ( = ?auto_17000 ?auto_16997 ) ) ( AVAILABLE ?auto_16997 ) ( SURFACE-AT ?auto_16993 ?auto_16995 ) ( ON ?auto_16993 ?auto_17002 ) ( CLEAR ?auto_16993 ) ( not ( = ?auto_16992 ?auto_17002 ) ) ( not ( = ?auto_16993 ?auto_17002 ) ) ( not ( = ?auto_16991 ?auto_17002 ) ) ( SURFACE-AT ?auto_16991 ?auto_16999 ) ( CLEAR ?auto_16991 ) ( IS-CRATE ?auto_16992 ) ( AVAILABLE ?auto_17000 ) ( not ( = ?auto_16998 ?auto_16999 ) ) ( not ( = ?auto_16995 ?auto_16998 ) ) ( HOIST-AT ?auto_16994 ?auto_16998 ) ( not ( = ?auto_17000 ?auto_16994 ) ) ( not ( = ?auto_16997 ?auto_16994 ) ) ( AVAILABLE ?auto_16994 ) ( SURFACE-AT ?auto_16992 ?auto_16998 ) ( ON ?auto_16992 ?auto_16996 ) ( CLEAR ?auto_16992 ) ( not ( = ?auto_16992 ?auto_16996 ) ) ( not ( = ?auto_16993 ?auto_16996 ) ) ( not ( = ?auto_16991 ?auto_16996 ) ) ( not ( = ?auto_17002 ?auto_16996 ) ) ( TRUCK-AT ?auto_17001 ?auto_16999 ) ( ON ?auto_16991 ?auto_16990 ) ( not ( = ?auto_16990 ?auto_16991 ) ) ( not ( = ?auto_16990 ?auto_16992 ) ) ( not ( = ?auto_16990 ?auto_16993 ) ) ( not ( = ?auto_16990 ?auto_17002 ) ) ( not ( = ?auto_16990 ?auto_16996 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16991 ?auto_16992 ?auto_16993 )
      ( MAKE-3CRATE-VERIFY ?auto_16990 ?auto_16991 ?auto_16992 ?auto_16993 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17003 - SURFACE
      ?auto_17004 - SURFACE
      ?auto_17005 - SURFACE
      ?auto_17006 - SURFACE
      ?auto_17007 - SURFACE
    )
    :vars
    (
      ?auto_17014 - HOIST
      ?auto_17013 - PLACE
      ?auto_17009 - PLACE
      ?auto_17011 - HOIST
      ?auto_17016 - SURFACE
      ?auto_17012 - PLACE
      ?auto_17008 - HOIST
      ?auto_17010 - SURFACE
      ?auto_17015 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17014 ?auto_17013 ) ( IS-CRATE ?auto_17007 ) ( not ( = ?auto_17006 ?auto_17007 ) ) ( not ( = ?auto_17005 ?auto_17006 ) ) ( not ( = ?auto_17005 ?auto_17007 ) ) ( not ( = ?auto_17009 ?auto_17013 ) ) ( HOIST-AT ?auto_17011 ?auto_17009 ) ( not ( = ?auto_17014 ?auto_17011 ) ) ( AVAILABLE ?auto_17011 ) ( SURFACE-AT ?auto_17007 ?auto_17009 ) ( ON ?auto_17007 ?auto_17016 ) ( CLEAR ?auto_17007 ) ( not ( = ?auto_17006 ?auto_17016 ) ) ( not ( = ?auto_17007 ?auto_17016 ) ) ( not ( = ?auto_17005 ?auto_17016 ) ) ( SURFACE-AT ?auto_17005 ?auto_17013 ) ( CLEAR ?auto_17005 ) ( IS-CRATE ?auto_17006 ) ( AVAILABLE ?auto_17014 ) ( not ( = ?auto_17012 ?auto_17013 ) ) ( not ( = ?auto_17009 ?auto_17012 ) ) ( HOIST-AT ?auto_17008 ?auto_17012 ) ( not ( = ?auto_17014 ?auto_17008 ) ) ( not ( = ?auto_17011 ?auto_17008 ) ) ( AVAILABLE ?auto_17008 ) ( SURFACE-AT ?auto_17006 ?auto_17012 ) ( ON ?auto_17006 ?auto_17010 ) ( CLEAR ?auto_17006 ) ( not ( = ?auto_17006 ?auto_17010 ) ) ( not ( = ?auto_17007 ?auto_17010 ) ) ( not ( = ?auto_17005 ?auto_17010 ) ) ( not ( = ?auto_17016 ?auto_17010 ) ) ( TRUCK-AT ?auto_17015 ?auto_17013 ) ( ON ?auto_17004 ?auto_17003 ) ( ON ?auto_17005 ?auto_17004 ) ( not ( = ?auto_17003 ?auto_17004 ) ) ( not ( = ?auto_17003 ?auto_17005 ) ) ( not ( = ?auto_17003 ?auto_17006 ) ) ( not ( = ?auto_17003 ?auto_17007 ) ) ( not ( = ?auto_17003 ?auto_17016 ) ) ( not ( = ?auto_17003 ?auto_17010 ) ) ( not ( = ?auto_17004 ?auto_17005 ) ) ( not ( = ?auto_17004 ?auto_17006 ) ) ( not ( = ?auto_17004 ?auto_17007 ) ) ( not ( = ?auto_17004 ?auto_17016 ) ) ( not ( = ?auto_17004 ?auto_17010 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17005 ?auto_17006 ?auto_17007 )
      ( MAKE-4CRATE-VERIFY ?auto_17003 ?auto_17004 ?auto_17005 ?auto_17006 ?auto_17007 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17017 - SURFACE
      ?auto_17018 - SURFACE
    )
    :vars
    (
      ?auto_17026 - HOIST
      ?auto_17025 - PLACE
      ?auto_17023 - SURFACE
      ?auto_17020 - PLACE
      ?auto_17022 - HOIST
      ?auto_17028 - SURFACE
      ?auto_17024 - PLACE
      ?auto_17019 - HOIST
      ?auto_17021 - SURFACE
      ?auto_17027 - TRUCK
      ?auto_17029 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17026 ?auto_17025 ) ( IS-CRATE ?auto_17018 ) ( not ( = ?auto_17017 ?auto_17018 ) ) ( not ( = ?auto_17023 ?auto_17017 ) ) ( not ( = ?auto_17023 ?auto_17018 ) ) ( not ( = ?auto_17020 ?auto_17025 ) ) ( HOIST-AT ?auto_17022 ?auto_17020 ) ( not ( = ?auto_17026 ?auto_17022 ) ) ( AVAILABLE ?auto_17022 ) ( SURFACE-AT ?auto_17018 ?auto_17020 ) ( ON ?auto_17018 ?auto_17028 ) ( CLEAR ?auto_17018 ) ( not ( = ?auto_17017 ?auto_17028 ) ) ( not ( = ?auto_17018 ?auto_17028 ) ) ( not ( = ?auto_17023 ?auto_17028 ) ) ( IS-CRATE ?auto_17017 ) ( not ( = ?auto_17024 ?auto_17025 ) ) ( not ( = ?auto_17020 ?auto_17024 ) ) ( HOIST-AT ?auto_17019 ?auto_17024 ) ( not ( = ?auto_17026 ?auto_17019 ) ) ( not ( = ?auto_17022 ?auto_17019 ) ) ( AVAILABLE ?auto_17019 ) ( SURFACE-AT ?auto_17017 ?auto_17024 ) ( ON ?auto_17017 ?auto_17021 ) ( CLEAR ?auto_17017 ) ( not ( = ?auto_17017 ?auto_17021 ) ) ( not ( = ?auto_17018 ?auto_17021 ) ) ( not ( = ?auto_17023 ?auto_17021 ) ) ( not ( = ?auto_17028 ?auto_17021 ) ) ( TRUCK-AT ?auto_17027 ?auto_17025 ) ( SURFACE-AT ?auto_17029 ?auto_17025 ) ( CLEAR ?auto_17029 ) ( LIFTING ?auto_17026 ?auto_17023 ) ( IS-CRATE ?auto_17023 ) ( not ( = ?auto_17029 ?auto_17023 ) ) ( not ( = ?auto_17017 ?auto_17029 ) ) ( not ( = ?auto_17018 ?auto_17029 ) ) ( not ( = ?auto_17028 ?auto_17029 ) ) ( not ( = ?auto_17021 ?auto_17029 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17029 ?auto_17023 )
      ( MAKE-2CRATE ?auto_17023 ?auto_17017 ?auto_17018 )
      ( MAKE-1CRATE-VERIFY ?auto_17017 ?auto_17018 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17030 - SURFACE
      ?auto_17031 - SURFACE
      ?auto_17032 - SURFACE
    )
    :vars
    (
      ?auto_17041 - HOIST
      ?auto_17036 - PLACE
      ?auto_17037 - PLACE
      ?auto_17034 - HOIST
      ?auto_17040 - SURFACE
      ?auto_17042 - PLACE
      ?auto_17038 - HOIST
      ?auto_17035 - SURFACE
      ?auto_17033 - TRUCK
      ?auto_17039 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17041 ?auto_17036 ) ( IS-CRATE ?auto_17032 ) ( not ( = ?auto_17031 ?auto_17032 ) ) ( not ( = ?auto_17030 ?auto_17031 ) ) ( not ( = ?auto_17030 ?auto_17032 ) ) ( not ( = ?auto_17037 ?auto_17036 ) ) ( HOIST-AT ?auto_17034 ?auto_17037 ) ( not ( = ?auto_17041 ?auto_17034 ) ) ( AVAILABLE ?auto_17034 ) ( SURFACE-AT ?auto_17032 ?auto_17037 ) ( ON ?auto_17032 ?auto_17040 ) ( CLEAR ?auto_17032 ) ( not ( = ?auto_17031 ?auto_17040 ) ) ( not ( = ?auto_17032 ?auto_17040 ) ) ( not ( = ?auto_17030 ?auto_17040 ) ) ( IS-CRATE ?auto_17031 ) ( not ( = ?auto_17042 ?auto_17036 ) ) ( not ( = ?auto_17037 ?auto_17042 ) ) ( HOIST-AT ?auto_17038 ?auto_17042 ) ( not ( = ?auto_17041 ?auto_17038 ) ) ( not ( = ?auto_17034 ?auto_17038 ) ) ( AVAILABLE ?auto_17038 ) ( SURFACE-AT ?auto_17031 ?auto_17042 ) ( ON ?auto_17031 ?auto_17035 ) ( CLEAR ?auto_17031 ) ( not ( = ?auto_17031 ?auto_17035 ) ) ( not ( = ?auto_17032 ?auto_17035 ) ) ( not ( = ?auto_17030 ?auto_17035 ) ) ( not ( = ?auto_17040 ?auto_17035 ) ) ( TRUCK-AT ?auto_17033 ?auto_17036 ) ( SURFACE-AT ?auto_17039 ?auto_17036 ) ( CLEAR ?auto_17039 ) ( LIFTING ?auto_17041 ?auto_17030 ) ( IS-CRATE ?auto_17030 ) ( not ( = ?auto_17039 ?auto_17030 ) ) ( not ( = ?auto_17031 ?auto_17039 ) ) ( not ( = ?auto_17032 ?auto_17039 ) ) ( not ( = ?auto_17040 ?auto_17039 ) ) ( not ( = ?auto_17035 ?auto_17039 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17031 ?auto_17032 )
      ( MAKE-2CRATE-VERIFY ?auto_17030 ?auto_17031 ?auto_17032 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17043 - SURFACE
      ?auto_17044 - SURFACE
      ?auto_17045 - SURFACE
      ?auto_17046 - SURFACE
    )
    :vars
    (
      ?auto_17050 - HOIST
      ?auto_17048 - PLACE
      ?auto_17054 - PLACE
      ?auto_17053 - HOIST
      ?auto_17047 - SURFACE
      ?auto_17051 - PLACE
      ?auto_17052 - HOIST
      ?auto_17049 - SURFACE
      ?auto_17055 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17050 ?auto_17048 ) ( IS-CRATE ?auto_17046 ) ( not ( = ?auto_17045 ?auto_17046 ) ) ( not ( = ?auto_17044 ?auto_17045 ) ) ( not ( = ?auto_17044 ?auto_17046 ) ) ( not ( = ?auto_17054 ?auto_17048 ) ) ( HOIST-AT ?auto_17053 ?auto_17054 ) ( not ( = ?auto_17050 ?auto_17053 ) ) ( AVAILABLE ?auto_17053 ) ( SURFACE-AT ?auto_17046 ?auto_17054 ) ( ON ?auto_17046 ?auto_17047 ) ( CLEAR ?auto_17046 ) ( not ( = ?auto_17045 ?auto_17047 ) ) ( not ( = ?auto_17046 ?auto_17047 ) ) ( not ( = ?auto_17044 ?auto_17047 ) ) ( IS-CRATE ?auto_17045 ) ( not ( = ?auto_17051 ?auto_17048 ) ) ( not ( = ?auto_17054 ?auto_17051 ) ) ( HOIST-AT ?auto_17052 ?auto_17051 ) ( not ( = ?auto_17050 ?auto_17052 ) ) ( not ( = ?auto_17053 ?auto_17052 ) ) ( AVAILABLE ?auto_17052 ) ( SURFACE-AT ?auto_17045 ?auto_17051 ) ( ON ?auto_17045 ?auto_17049 ) ( CLEAR ?auto_17045 ) ( not ( = ?auto_17045 ?auto_17049 ) ) ( not ( = ?auto_17046 ?auto_17049 ) ) ( not ( = ?auto_17044 ?auto_17049 ) ) ( not ( = ?auto_17047 ?auto_17049 ) ) ( TRUCK-AT ?auto_17055 ?auto_17048 ) ( SURFACE-AT ?auto_17043 ?auto_17048 ) ( CLEAR ?auto_17043 ) ( LIFTING ?auto_17050 ?auto_17044 ) ( IS-CRATE ?auto_17044 ) ( not ( = ?auto_17043 ?auto_17044 ) ) ( not ( = ?auto_17045 ?auto_17043 ) ) ( not ( = ?auto_17046 ?auto_17043 ) ) ( not ( = ?auto_17047 ?auto_17043 ) ) ( not ( = ?auto_17049 ?auto_17043 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17044 ?auto_17045 ?auto_17046 )
      ( MAKE-3CRATE-VERIFY ?auto_17043 ?auto_17044 ?auto_17045 ?auto_17046 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17056 - SURFACE
      ?auto_17057 - SURFACE
      ?auto_17058 - SURFACE
      ?auto_17059 - SURFACE
      ?auto_17060 - SURFACE
    )
    :vars
    (
      ?auto_17064 - HOIST
      ?auto_17062 - PLACE
      ?auto_17068 - PLACE
      ?auto_17067 - HOIST
      ?auto_17061 - SURFACE
      ?auto_17065 - PLACE
      ?auto_17066 - HOIST
      ?auto_17063 - SURFACE
      ?auto_17069 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17064 ?auto_17062 ) ( IS-CRATE ?auto_17060 ) ( not ( = ?auto_17059 ?auto_17060 ) ) ( not ( = ?auto_17058 ?auto_17059 ) ) ( not ( = ?auto_17058 ?auto_17060 ) ) ( not ( = ?auto_17068 ?auto_17062 ) ) ( HOIST-AT ?auto_17067 ?auto_17068 ) ( not ( = ?auto_17064 ?auto_17067 ) ) ( AVAILABLE ?auto_17067 ) ( SURFACE-AT ?auto_17060 ?auto_17068 ) ( ON ?auto_17060 ?auto_17061 ) ( CLEAR ?auto_17060 ) ( not ( = ?auto_17059 ?auto_17061 ) ) ( not ( = ?auto_17060 ?auto_17061 ) ) ( not ( = ?auto_17058 ?auto_17061 ) ) ( IS-CRATE ?auto_17059 ) ( not ( = ?auto_17065 ?auto_17062 ) ) ( not ( = ?auto_17068 ?auto_17065 ) ) ( HOIST-AT ?auto_17066 ?auto_17065 ) ( not ( = ?auto_17064 ?auto_17066 ) ) ( not ( = ?auto_17067 ?auto_17066 ) ) ( AVAILABLE ?auto_17066 ) ( SURFACE-AT ?auto_17059 ?auto_17065 ) ( ON ?auto_17059 ?auto_17063 ) ( CLEAR ?auto_17059 ) ( not ( = ?auto_17059 ?auto_17063 ) ) ( not ( = ?auto_17060 ?auto_17063 ) ) ( not ( = ?auto_17058 ?auto_17063 ) ) ( not ( = ?auto_17061 ?auto_17063 ) ) ( TRUCK-AT ?auto_17069 ?auto_17062 ) ( SURFACE-AT ?auto_17057 ?auto_17062 ) ( CLEAR ?auto_17057 ) ( LIFTING ?auto_17064 ?auto_17058 ) ( IS-CRATE ?auto_17058 ) ( not ( = ?auto_17057 ?auto_17058 ) ) ( not ( = ?auto_17059 ?auto_17057 ) ) ( not ( = ?auto_17060 ?auto_17057 ) ) ( not ( = ?auto_17061 ?auto_17057 ) ) ( not ( = ?auto_17063 ?auto_17057 ) ) ( ON ?auto_17057 ?auto_17056 ) ( not ( = ?auto_17056 ?auto_17057 ) ) ( not ( = ?auto_17056 ?auto_17058 ) ) ( not ( = ?auto_17056 ?auto_17059 ) ) ( not ( = ?auto_17056 ?auto_17060 ) ) ( not ( = ?auto_17056 ?auto_17061 ) ) ( not ( = ?auto_17056 ?auto_17063 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17058 ?auto_17059 ?auto_17060 )
      ( MAKE-4CRATE-VERIFY ?auto_17056 ?auto_17057 ?auto_17058 ?auto_17059 ?auto_17060 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17070 - SURFACE
      ?auto_17071 - SURFACE
    )
    :vars
    (
      ?auto_17075 - HOIST
      ?auto_17073 - PLACE
      ?auto_17078 - SURFACE
      ?auto_17080 - PLACE
      ?auto_17079 - HOIST
      ?auto_17072 - SURFACE
      ?auto_17076 - PLACE
      ?auto_17077 - HOIST
      ?auto_17074 - SURFACE
      ?auto_17082 - TRUCK
      ?auto_17081 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17075 ?auto_17073 ) ( IS-CRATE ?auto_17071 ) ( not ( = ?auto_17070 ?auto_17071 ) ) ( not ( = ?auto_17078 ?auto_17070 ) ) ( not ( = ?auto_17078 ?auto_17071 ) ) ( not ( = ?auto_17080 ?auto_17073 ) ) ( HOIST-AT ?auto_17079 ?auto_17080 ) ( not ( = ?auto_17075 ?auto_17079 ) ) ( AVAILABLE ?auto_17079 ) ( SURFACE-AT ?auto_17071 ?auto_17080 ) ( ON ?auto_17071 ?auto_17072 ) ( CLEAR ?auto_17071 ) ( not ( = ?auto_17070 ?auto_17072 ) ) ( not ( = ?auto_17071 ?auto_17072 ) ) ( not ( = ?auto_17078 ?auto_17072 ) ) ( IS-CRATE ?auto_17070 ) ( not ( = ?auto_17076 ?auto_17073 ) ) ( not ( = ?auto_17080 ?auto_17076 ) ) ( HOIST-AT ?auto_17077 ?auto_17076 ) ( not ( = ?auto_17075 ?auto_17077 ) ) ( not ( = ?auto_17079 ?auto_17077 ) ) ( AVAILABLE ?auto_17077 ) ( SURFACE-AT ?auto_17070 ?auto_17076 ) ( ON ?auto_17070 ?auto_17074 ) ( CLEAR ?auto_17070 ) ( not ( = ?auto_17070 ?auto_17074 ) ) ( not ( = ?auto_17071 ?auto_17074 ) ) ( not ( = ?auto_17078 ?auto_17074 ) ) ( not ( = ?auto_17072 ?auto_17074 ) ) ( TRUCK-AT ?auto_17082 ?auto_17073 ) ( SURFACE-AT ?auto_17081 ?auto_17073 ) ( CLEAR ?auto_17081 ) ( IS-CRATE ?auto_17078 ) ( not ( = ?auto_17081 ?auto_17078 ) ) ( not ( = ?auto_17070 ?auto_17081 ) ) ( not ( = ?auto_17071 ?auto_17081 ) ) ( not ( = ?auto_17072 ?auto_17081 ) ) ( not ( = ?auto_17074 ?auto_17081 ) ) ( AVAILABLE ?auto_17075 ) ( IN ?auto_17078 ?auto_17082 ) )
    :subtasks
    ( ( !UNLOAD ?auto_17075 ?auto_17078 ?auto_17082 ?auto_17073 )
      ( MAKE-2CRATE ?auto_17078 ?auto_17070 ?auto_17071 )
      ( MAKE-1CRATE-VERIFY ?auto_17070 ?auto_17071 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17083 - SURFACE
      ?auto_17084 - SURFACE
      ?auto_17085 - SURFACE
    )
    :vars
    (
      ?auto_17088 - HOIST
      ?auto_17091 - PLACE
      ?auto_17087 - PLACE
      ?auto_17093 - HOIST
      ?auto_17090 - SURFACE
      ?auto_17086 - PLACE
      ?auto_17094 - HOIST
      ?auto_17092 - SURFACE
      ?auto_17095 - TRUCK
      ?auto_17089 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17088 ?auto_17091 ) ( IS-CRATE ?auto_17085 ) ( not ( = ?auto_17084 ?auto_17085 ) ) ( not ( = ?auto_17083 ?auto_17084 ) ) ( not ( = ?auto_17083 ?auto_17085 ) ) ( not ( = ?auto_17087 ?auto_17091 ) ) ( HOIST-AT ?auto_17093 ?auto_17087 ) ( not ( = ?auto_17088 ?auto_17093 ) ) ( AVAILABLE ?auto_17093 ) ( SURFACE-AT ?auto_17085 ?auto_17087 ) ( ON ?auto_17085 ?auto_17090 ) ( CLEAR ?auto_17085 ) ( not ( = ?auto_17084 ?auto_17090 ) ) ( not ( = ?auto_17085 ?auto_17090 ) ) ( not ( = ?auto_17083 ?auto_17090 ) ) ( IS-CRATE ?auto_17084 ) ( not ( = ?auto_17086 ?auto_17091 ) ) ( not ( = ?auto_17087 ?auto_17086 ) ) ( HOIST-AT ?auto_17094 ?auto_17086 ) ( not ( = ?auto_17088 ?auto_17094 ) ) ( not ( = ?auto_17093 ?auto_17094 ) ) ( AVAILABLE ?auto_17094 ) ( SURFACE-AT ?auto_17084 ?auto_17086 ) ( ON ?auto_17084 ?auto_17092 ) ( CLEAR ?auto_17084 ) ( not ( = ?auto_17084 ?auto_17092 ) ) ( not ( = ?auto_17085 ?auto_17092 ) ) ( not ( = ?auto_17083 ?auto_17092 ) ) ( not ( = ?auto_17090 ?auto_17092 ) ) ( TRUCK-AT ?auto_17095 ?auto_17091 ) ( SURFACE-AT ?auto_17089 ?auto_17091 ) ( CLEAR ?auto_17089 ) ( IS-CRATE ?auto_17083 ) ( not ( = ?auto_17089 ?auto_17083 ) ) ( not ( = ?auto_17084 ?auto_17089 ) ) ( not ( = ?auto_17085 ?auto_17089 ) ) ( not ( = ?auto_17090 ?auto_17089 ) ) ( not ( = ?auto_17092 ?auto_17089 ) ) ( AVAILABLE ?auto_17088 ) ( IN ?auto_17083 ?auto_17095 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17084 ?auto_17085 )
      ( MAKE-2CRATE-VERIFY ?auto_17083 ?auto_17084 ?auto_17085 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17096 - SURFACE
      ?auto_17097 - SURFACE
      ?auto_17098 - SURFACE
      ?auto_17099 - SURFACE
    )
    :vars
    (
      ?auto_17103 - HOIST
      ?auto_17107 - PLACE
      ?auto_17104 - PLACE
      ?auto_17102 - HOIST
      ?auto_17108 - SURFACE
      ?auto_17101 - PLACE
      ?auto_17100 - HOIST
      ?auto_17106 - SURFACE
      ?auto_17105 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17103 ?auto_17107 ) ( IS-CRATE ?auto_17099 ) ( not ( = ?auto_17098 ?auto_17099 ) ) ( not ( = ?auto_17097 ?auto_17098 ) ) ( not ( = ?auto_17097 ?auto_17099 ) ) ( not ( = ?auto_17104 ?auto_17107 ) ) ( HOIST-AT ?auto_17102 ?auto_17104 ) ( not ( = ?auto_17103 ?auto_17102 ) ) ( AVAILABLE ?auto_17102 ) ( SURFACE-AT ?auto_17099 ?auto_17104 ) ( ON ?auto_17099 ?auto_17108 ) ( CLEAR ?auto_17099 ) ( not ( = ?auto_17098 ?auto_17108 ) ) ( not ( = ?auto_17099 ?auto_17108 ) ) ( not ( = ?auto_17097 ?auto_17108 ) ) ( IS-CRATE ?auto_17098 ) ( not ( = ?auto_17101 ?auto_17107 ) ) ( not ( = ?auto_17104 ?auto_17101 ) ) ( HOIST-AT ?auto_17100 ?auto_17101 ) ( not ( = ?auto_17103 ?auto_17100 ) ) ( not ( = ?auto_17102 ?auto_17100 ) ) ( AVAILABLE ?auto_17100 ) ( SURFACE-AT ?auto_17098 ?auto_17101 ) ( ON ?auto_17098 ?auto_17106 ) ( CLEAR ?auto_17098 ) ( not ( = ?auto_17098 ?auto_17106 ) ) ( not ( = ?auto_17099 ?auto_17106 ) ) ( not ( = ?auto_17097 ?auto_17106 ) ) ( not ( = ?auto_17108 ?auto_17106 ) ) ( TRUCK-AT ?auto_17105 ?auto_17107 ) ( SURFACE-AT ?auto_17096 ?auto_17107 ) ( CLEAR ?auto_17096 ) ( IS-CRATE ?auto_17097 ) ( not ( = ?auto_17096 ?auto_17097 ) ) ( not ( = ?auto_17098 ?auto_17096 ) ) ( not ( = ?auto_17099 ?auto_17096 ) ) ( not ( = ?auto_17108 ?auto_17096 ) ) ( not ( = ?auto_17106 ?auto_17096 ) ) ( AVAILABLE ?auto_17103 ) ( IN ?auto_17097 ?auto_17105 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17097 ?auto_17098 ?auto_17099 )
      ( MAKE-3CRATE-VERIFY ?auto_17096 ?auto_17097 ?auto_17098 ?auto_17099 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17109 - SURFACE
      ?auto_17110 - SURFACE
      ?auto_17111 - SURFACE
      ?auto_17112 - SURFACE
      ?auto_17113 - SURFACE
    )
    :vars
    (
      ?auto_17117 - HOIST
      ?auto_17121 - PLACE
      ?auto_17118 - PLACE
      ?auto_17116 - HOIST
      ?auto_17122 - SURFACE
      ?auto_17115 - PLACE
      ?auto_17114 - HOIST
      ?auto_17120 - SURFACE
      ?auto_17119 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17117 ?auto_17121 ) ( IS-CRATE ?auto_17113 ) ( not ( = ?auto_17112 ?auto_17113 ) ) ( not ( = ?auto_17111 ?auto_17112 ) ) ( not ( = ?auto_17111 ?auto_17113 ) ) ( not ( = ?auto_17118 ?auto_17121 ) ) ( HOIST-AT ?auto_17116 ?auto_17118 ) ( not ( = ?auto_17117 ?auto_17116 ) ) ( AVAILABLE ?auto_17116 ) ( SURFACE-AT ?auto_17113 ?auto_17118 ) ( ON ?auto_17113 ?auto_17122 ) ( CLEAR ?auto_17113 ) ( not ( = ?auto_17112 ?auto_17122 ) ) ( not ( = ?auto_17113 ?auto_17122 ) ) ( not ( = ?auto_17111 ?auto_17122 ) ) ( IS-CRATE ?auto_17112 ) ( not ( = ?auto_17115 ?auto_17121 ) ) ( not ( = ?auto_17118 ?auto_17115 ) ) ( HOIST-AT ?auto_17114 ?auto_17115 ) ( not ( = ?auto_17117 ?auto_17114 ) ) ( not ( = ?auto_17116 ?auto_17114 ) ) ( AVAILABLE ?auto_17114 ) ( SURFACE-AT ?auto_17112 ?auto_17115 ) ( ON ?auto_17112 ?auto_17120 ) ( CLEAR ?auto_17112 ) ( not ( = ?auto_17112 ?auto_17120 ) ) ( not ( = ?auto_17113 ?auto_17120 ) ) ( not ( = ?auto_17111 ?auto_17120 ) ) ( not ( = ?auto_17122 ?auto_17120 ) ) ( TRUCK-AT ?auto_17119 ?auto_17121 ) ( SURFACE-AT ?auto_17110 ?auto_17121 ) ( CLEAR ?auto_17110 ) ( IS-CRATE ?auto_17111 ) ( not ( = ?auto_17110 ?auto_17111 ) ) ( not ( = ?auto_17112 ?auto_17110 ) ) ( not ( = ?auto_17113 ?auto_17110 ) ) ( not ( = ?auto_17122 ?auto_17110 ) ) ( not ( = ?auto_17120 ?auto_17110 ) ) ( AVAILABLE ?auto_17117 ) ( IN ?auto_17111 ?auto_17119 ) ( ON ?auto_17110 ?auto_17109 ) ( not ( = ?auto_17109 ?auto_17110 ) ) ( not ( = ?auto_17109 ?auto_17111 ) ) ( not ( = ?auto_17109 ?auto_17112 ) ) ( not ( = ?auto_17109 ?auto_17113 ) ) ( not ( = ?auto_17109 ?auto_17122 ) ) ( not ( = ?auto_17109 ?auto_17120 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17111 ?auto_17112 ?auto_17113 )
      ( MAKE-4CRATE-VERIFY ?auto_17109 ?auto_17110 ?auto_17111 ?auto_17112 ?auto_17113 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17123 - SURFACE
      ?auto_17124 - SURFACE
    )
    :vars
    (
      ?auto_17128 - HOIST
      ?auto_17134 - PLACE
      ?auto_17133 - SURFACE
      ?auto_17129 - PLACE
      ?auto_17127 - HOIST
      ?auto_17135 - SURFACE
      ?auto_17126 - PLACE
      ?auto_17125 - HOIST
      ?auto_17132 - SURFACE
      ?auto_17131 - SURFACE
      ?auto_17130 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17128 ?auto_17134 ) ( IS-CRATE ?auto_17124 ) ( not ( = ?auto_17123 ?auto_17124 ) ) ( not ( = ?auto_17133 ?auto_17123 ) ) ( not ( = ?auto_17133 ?auto_17124 ) ) ( not ( = ?auto_17129 ?auto_17134 ) ) ( HOIST-AT ?auto_17127 ?auto_17129 ) ( not ( = ?auto_17128 ?auto_17127 ) ) ( AVAILABLE ?auto_17127 ) ( SURFACE-AT ?auto_17124 ?auto_17129 ) ( ON ?auto_17124 ?auto_17135 ) ( CLEAR ?auto_17124 ) ( not ( = ?auto_17123 ?auto_17135 ) ) ( not ( = ?auto_17124 ?auto_17135 ) ) ( not ( = ?auto_17133 ?auto_17135 ) ) ( IS-CRATE ?auto_17123 ) ( not ( = ?auto_17126 ?auto_17134 ) ) ( not ( = ?auto_17129 ?auto_17126 ) ) ( HOIST-AT ?auto_17125 ?auto_17126 ) ( not ( = ?auto_17128 ?auto_17125 ) ) ( not ( = ?auto_17127 ?auto_17125 ) ) ( AVAILABLE ?auto_17125 ) ( SURFACE-AT ?auto_17123 ?auto_17126 ) ( ON ?auto_17123 ?auto_17132 ) ( CLEAR ?auto_17123 ) ( not ( = ?auto_17123 ?auto_17132 ) ) ( not ( = ?auto_17124 ?auto_17132 ) ) ( not ( = ?auto_17133 ?auto_17132 ) ) ( not ( = ?auto_17135 ?auto_17132 ) ) ( SURFACE-AT ?auto_17131 ?auto_17134 ) ( CLEAR ?auto_17131 ) ( IS-CRATE ?auto_17133 ) ( not ( = ?auto_17131 ?auto_17133 ) ) ( not ( = ?auto_17123 ?auto_17131 ) ) ( not ( = ?auto_17124 ?auto_17131 ) ) ( not ( = ?auto_17135 ?auto_17131 ) ) ( not ( = ?auto_17132 ?auto_17131 ) ) ( AVAILABLE ?auto_17128 ) ( IN ?auto_17133 ?auto_17130 ) ( TRUCK-AT ?auto_17130 ?auto_17129 ) )
    :subtasks
    ( ( !DRIVE ?auto_17130 ?auto_17129 ?auto_17134 )
      ( MAKE-2CRATE ?auto_17133 ?auto_17123 ?auto_17124 )
      ( MAKE-1CRATE-VERIFY ?auto_17123 ?auto_17124 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17136 - SURFACE
      ?auto_17137 - SURFACE
      ?auto_17138 - SURFACE
    )
    :vars
    (
      ?auto_17141 - HOIST
      ?auto_17140 - PLACE
      ?auto_17144 - PLACE
      ?auto_17143 - HOIST
      ?auto_17148 - SURFACE
      ?auto_17145 - PLACE
      ?auto_17139 - HOIST
      ?auto_17142 - SURFACE
      ?auto_17146 - SURFACE
      ?auto_17147 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17141 ?auto_17140 ) ( IS-CRATE ?auto_17138 ) ( not ( = ?auto_17137 ?auto_17138 ) ) ( not ( = ?auto_17136 ?auto_17137 ) ) ( not ( = ?auto_17136 ?auto_17138 ) ) ( not ( = ?auto_17144 ?auto_17140 ) ) ( HOIST-AT ?auto_17143 ?auto_17144 ) ( not ( = ?auto_17141 ?auto_17143 ) ) ( AVAILABLE ?auto_17143 ) ( SURFACE-AT ?auto_17138 ?auto_17144 ) ( ON ?auto_17138 ?auto_17148 ) ( CLEAR ?auto_17138 ) ( not ( = ?auto_17137 ?auto_17148 ) ) ( not ( = ?auto_17138 ?auto_17148 ) ) ( not ( = ?auto_17136 ?auto_17148 ) ) ( IS-CRATE ?auto_17137 ) ( not ( = ?auto_17145 ?auto_17140 ) ) ( not ( = ?auto_17144 ?auto_17145 ) ) ( HOIST-AT ?auto_17139 ?auto_17145 ) ( not ( = ?auto_17141 ?auto_17139 ) ) ( not ( = ?auto_17143 ?auto_17139 ) ) ( AVAILABLE ?auto_17139 ) ( SURFACE-AT ?auto_17137 ?auto_17145 ) ( ON ?auto_17137 ?auto_17142 ) ( CLEAR ?auto_17137 ) ( not ( = ?auto_17137 ?auto_17142 ) ) ( not ( = ?auto_17138 ?auto_17142 ) ) ( not ( = ?auto_17136 ?auto_17142 ) ) ( not ( = ?auto_17148 ?auto_17142 ) ) ( SURFACE-AT ?auto_17146 ?auto_17140 ) ( CLEAR ?auto_17146 ) ( IS-CRATE ?auto_17136 ) ( not ( = ?auto_17146 ?auto_17136 ) ) ( not ( = ?auto_17137 ?auto_17146 ) ) ( not ( = ?auto_17138 ?auto_17146 ) ) ( not ( = ?auto_17148 ?auto_17146 ) ) ( not ( = ?auto_17142 ?auto_17146 ) ) ( AVAILABLE ?auto_17141 ) ( IN ?auto_17136 ?auto_17147 ) ( TRUCK-AT ?auto_17147 ?auto_17144 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17137 ?auto_17138 )
      ( MAKE-2CRATE-VERIFY ?auto_17136 ?auto_17137 ?auto_17138 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17149 - SURFACE
      ?auto_17150 - SURFACE
      ?auto_17151 - SURFACE
      ?auto_17152 - SURFACE
    )
    :vars
    (
      ?auto_17158 - HOIST
      ?auto_17157 - PLACE
      ?auto_17161 - PLACE
      ?auto_17160 - HOIST
      ?auto_17159 - SURFACE
      ?auto_17154 - PLACE
      ?auto_17155 - HOIST
      ?auto_17156 - SURFACE
      ?auto_17153 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17158 ?auto_17157 ) ( IS-CRATE ?auto_17152 ) ( not ( = ?auto_17151 ?auto_17152 ) ) ( not ( = ?auto_17150 ?auto_17151 ) ) ( not ( = ?auto_17150 ?auto_17152 ) ) ( not ( = ?auto_17161 ?auto_17157 ) ) ( HOIST-AT ?auto_17160 ?auto_17161 ) ( not ( = ?auto_17158 ?auto_17160 ) ) ( AVAILABLE ?auto_17160 ) ( SURFACE-AT ?auto_17152 ?auto_17161 ) ( ON ?auto_17152 ?auto_17159 ) ( CLEAR ?auto_17152 ) ( not ( = ?auto_17151 ?auto_17159 ) ) ( not ( = ?auto_17152 ?auto_17159 ) ) ( not ( = ?auto_17150 ?auto_17159 ) ) ( IS-CRATE ?auto_17151 ) ( not ( = ?auto_17154 ?auto_17157 ) ) ( not ( = ?auto_17161 ?auto_17154 ) ) ( HOIST-AT ?auto_17155 ?auto_17154 ) ( not ( = ?auto_17158 ?auto_17155 ) ) ( not ( = ?auto_17160 ?auto_17155 ) ) ( AVAILABLE ?auto_17155 ) ( SURFACE-AT ?auto_17151 ?auto_17154 ) ( ON ?auto_17151 ?auto_17156 ) ( CLEAR ?auto_17151 ) ( not ( = ?auto_17151 ?auto_17156 ) ) ( not ( = ?auto_17152 ?auto_17156 ) ) ( not ( = ?auto_17150 ?auto_17156 ) ) ( not ( = ?auto_17159 ?auto_17156 ) ) ( SURFACE-AT ?auto_17149 ?auto_17157 ) ( CLEAR ?auto_17149 ) ( IS-CRATE ?auto_17150 ) ( not ( = ?auto_17149 ?auto_17150 ) ) ( not ( = ?auto_17151 ?auto_17149 ) ) ( not ( = ?auto_17152 ?auto_17149 ) ) ( not ( = ?auto_17159 ?auto_17149 ) ) ( not ( = ?auto_17156 ?auto_17149 ) ) ( AVAILABLE ?auto_17158 ) ( IN ?auto_17150 ?auto_17153 ) ( TRUCK-AT ?auto_17153 ?auto_17161 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17150 ?auto_17151 ?auto_17152 )
      ( MAKE-3CRATE-VERIFY ?auto_17149 ?auto_17150 ?auto_17151 ?auto_17152 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17162 - SURFACE
      ?auto_17163 - SURFACE
      ?auto_17164 - SURFACE
      ?auto_17165 - SURFACE
      ?auto_17166 - SURFACE
    )
    :vars
    (
      ?auto_17172 - HOIST
      ?auto_17171 - PLACE
      ?auto_17175 - PLACE
      ?auto_17174 - HOIST
      ?auto_17173 - SURFACE
      ?auto_17168 - PLACE
      ?auto_17169 - HOIST
      ?auto_17170 - SURFACE
      ?auto_17167 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17172 ?auto_17171 ) ( IS-CRATE ?auto_17166 ) ( not ( = ?auto_17165 ?auto_17166 ) ) ( not ( = ?auto_17164 ?auto_17165 ) ) ( not ( = ?auto_17164 ?auto_17166 ) ) ( not ( = ?auto_17175 ?auto_17171 ) ) ( HOIST-AT ?auto_17174 ?auto_17175 ) ( not ( = ?auto_17172 ?auto_17174 ) ) ( AVAILABLE ?auto_17174 ) ( SURFACE-AT ?auto_17166 ?auto_17175 ) ( ON ?auto_17166 ?auto_17173 ) ( CLEAR ?auto_17166 ) ( not ( = ?auto_17165 ?auto_17173 ) ) ( not ( = ?auto_17166 ?auto_17173 ) ) ( not ( = ?auto_17164 ?auto_17173 ) ) ( IS-CRATE ?auto_17165 ) ( not ( = ?auto_17168 ?auto_17171 ) ) ( not ( = ?auto_17175 ?auto_17168 ) ) ( HOIST-AT ?auto_17169 ?auto_17168 ) ( not ( = ?auto_17172 ?auto_17169 ) ) ( not ( = ?auto_17174 ?auto_17169 ) ) ( AVAILABLE ?auto_17169 ) ( SURFACE-AT ?auto_17165 ?auto_17168 ) ( ON ?auto_17165 ?auto_17170 ) ( CLEAR ?auto_17165 ) ( not ( = ?auto_17165 ?auto_17170 ) ) ( not ( = ?auto_17166 ?auto_17170 ) ) ( not ( = ?auto_17164 ?auto_17170 ) ) ( not ( = ?auto_17173 ?auto_17170 ) ) ( SURFACE-AT ?auto_17163 ?auto_17171 ) ( CLEAR ?auto_17163 ) ( IS-CRATE ?auto_17164 ) ( not ( = ?auto_17163 ?auto_17164 ) ) ( not ( = ?auto_17165 ?auto_17163 ) ) ( not ( = ?auto_17166 ?auto_17163 ) ) ( not ( = ?auto_17173 ?auto_17163 ) ) ( not ( = ?auto_17170 ?auto_17163 ) ) ( AVAILABLE ?auto_17172 ) ( IN ?auto_17164 ?auto_17167 ) ( TRUCK-AT ?auto_17167 ?auto_17175 ) ( ON ?auto_17163 ?auto_17162 ) ( not ( = ?auto_17162 ?auto_17163 ) ) ( not ( = ?auto_17162 ?auto_17164 ) ) ( not ( = ?auto_17162 ?auto_17165 ) ) ( not ( = ?auto_17162 ?auto_17166 ) ) ( not ( = ?auto_17162 ?auto_17173 ) ) ( not ( = ?auto_17162 ?auto_17170 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17164 ?auto_17165 ?auto_17166 )
      ( MAKE-4CRATE-VERIFY ?auto_17162 ?auto_17163 ?auto_17164 ?auto_17165 ?auto_17166 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17176 - SURFACE
      ?auto_17177 - SURFACE
    )
    :vars
    (
      ?auto_17184 - HOIST
      ?auto_17183 - PLACE
      ?auto_17182 - SURFACE
      ?auto_17188 - PLACE
      ?auto_17187 - HOIST
      ?auto_17186 - SURFACE
      ?auto_17179 - PLACE
      ?auto_17180 - HOIST
      ?auto_17181 - SURFACE
      ?auto_17185 - SURFACE
      ?auto_17178 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17184 ?auto_17183 ) ( IS-CRATE ?auto_17177 ) ( not ( = ?auto_17176 ?auto_17177 ) ) ( not ( = ?auto_17182 ?auto_17176 ) ) ( not ( = ?auto_17182 ?auto_17177 ) ) ( not ( = ?auto_17188 ?auto_17183 ) ) ( HOIST-AT ?auto_17187 ?auto_17188 ) ( not ( = ?auto_17184 ?auto_17187 ) ) ( SURFACE-AT ?auto_17177 ?auto_17188 ) ( ON ?auto_17177 ?auto_17186 ) ( CLEAR ?auto_17177 ) ( not ( = ?auto_17176 ?auto_17186 ) ) ( not ( = ?auto_17177 ?auto_17186 ) ) ( not ( = ?auto_17182 ?auto_17186 ) ) ( IS-CRATE ?auto_17176 ) ( not ( = ?auto_17179 ?auto_17183 ) ) ( not ( = ?auto_17188 ?auto_17179 ) ) ( HOIST-AT ?auto_17180 ?auto_17179 ) ( not ( = ?auto_17184 ?auto_17180 ) ) ( not ( = ?auto_17187 ?auto_17180 ) ) ( AVAILABLE ?auto_17180 ) ( SURFACE-AT ?auto_17176 ?auto_17179 ) ( ON ?auto_17176 ?auto_17181 ) ( CLEAR ?auto_17176 ) ( not ( = ?auto_17176 ?auto_17181 ) ) ( not ( = ?auto_17177 ?auto_17181 ) ) ( not ( = ?auto_17182 ?auto_17181 ) ) ( not ( = ?auto_17186 ?auto_17181 ) ) ( SURFACE-AT ?auto_17185 ?auto_17183 ) ( CLEAR ?auto_17185 ) ( IS-CRATE ?auto_17182 ) ( not ( = ?auto_17185 ?auto_17182 ) ) ( not ( = ?auto_17176 ?auto_17185 ) ) ( not ( = ?auto_17177 ?auto_17185 ) ) ( not ( = ?auto_17186 ?auto_17185 ) ) ( not ( = ?auto_17181 ?auto_17185 ) ) ( AVAILABLE ?auto_17184 ) ( TRUCK-AT ?auto_17178 ?auto_17188 ) ( LIFTING ?auto_17187 ?auto_17182 ) )
    :subtasks
    ( ( !LOAD ?auto_17187 ?auto_17182 ?auto_17178 ?auto_17188 )
      ( MAKE-2CRATE ?auto_17182 ?auto_17176 ?auto_17177 )
      ( MAKE-1CRATE-VERIFY ?auto_17176 ?auto_17177 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17189 - SURFACE
      ?auto_17190 - SURFACE
      ?auto_17191 - SURFACE
    )
    :vars
    (
      ?auto_17199 - HOIST
      ?auto_17197 - PLACE
      ?auto_17194 - PLACE
      ?auto_17192 - HOIST
      ?auto_17193 - SURFACE
      ?auto_17201 - PLACE
      ?auto_17200 - HOIST
      ?auto_17198 - SURFACE
      ?auto_17195 - SURFACE
      ?auto_17196 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17199 ?auto_17197 ) ( IS-CRATE ?auto_17191 ) ( not ( = ?auto_17190 ?auto_17191 ) ) ( not ( = ?auto_17189 ?auto_17190 ) ) ( not ( = ?auto_17189 ?auto_17191 ) ) ( not ( = ?auto_17194 ?auto_17197 ) ) ( HOIST-AT ?auto_17192 ?auto_17194 ) ( not ( = ?auto_17199 ?auto_17192 ) ) ( SURFACE-AT ?auto_17191 ?auto_17194 ) ( ON ?auto_17191 ?auto_17193 ) ( CLEAR ?auto_17191 ) ( not ( = ?auto_17190 ?auto_17193 ) ) ( not ( = ?auto_17191 ?auto_17193 ) ) ( not ( = ?auto_17189 ?auto_17193 ) ) ( IS-CRATE ?auto_17190 ) ( not ( = ?auto_17201 ?auto_17197 ) ) ( not ( = ?auto_17194 ?auto_17201 ) ) ( HOIST-AT ?auto_17200 ?auto_17201 ) ( not ( = ?auto_17199 ?auto_17200 ) ) ( not ( = ?auto_17192 ?auto_17200 ) ) ( AVAILABLE ?auto_17200 ) ( SURFACE-AT ?auto_17190 ?auto_17201 ) ( ON ?auto_17190 ?auto_17198 ) ( CLEAR ?auto_17190 ) ( not ( = ?auto_17190 ?auto_17198 ) ) ( not ( = ?auto_17191 ?auto_17198 ) ) ( not ( = ?auto_17189 ?auto_17198 ) ) ( not ( = ?auto_17193 ?auto_17198 ) ) ( SURFACE-AT ?auto_17195 ?auto_17197 ) ( CLEAR ?auto_17195 ) ( IS-CRATE ?auto_17189 ) ( not ( = ?auto_17195 ?auto_17189 ) ) ( not ( = ?auto_17190 ?auto_17195 ) ) ( not ( = ?auto_17191 ?auto_17195 ) ) ( not ( = ?auto_17193 ?auto_17195 ) ) ( not ( = ?auto_17198 ?auto_17195 ) ) ( AVAILABLE ?auto_17199 ) ( TRUCK-AT ?auto_17196 ?auto_17194 ) ( LIFTING ?auto_17192 ?auto_17189 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17190 ?auto_17191 )
      ( MAKE-2CRATE-VERIFY ?auto_17189 ?auto_17190 ?auto_17191 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17202 - SURFACE
      ?auto_17203 - SURFACE
      ?auto_17204 - SURFACE
      ?auto_17205 - SURFACE
    )
    :vars
    (
      ?auto_17214 - HOIST
      ?auto_17213 - PLACE
      ?auto_17206 - PLACE
      ?auto_17209 - HOIST
      ?auto_17212 - SURFACE
      ?auto_17208 - PLACE
      ?auto_17210 - HOIST
      ?auto_17211 - SURFACE
      ?auto_17207 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17214 ?auto_17213 ) ( IS-CRATE ?auto_17205 ) ( not ( = ?auto_17204 ?auto_17205 ) ) ( not ( = ?auto_17203 ?auto_17204 ) ) ( not ( = ?auto_17203 ?auto_17205 ) ) ( not ( = ?auto_17206 ?auto_17213 ) ) ( HOIST-AT ?auto_17209 ?auto_17206 ) ( not ( = ?auto_17214 ?auto_17209 ) ) ( SURFACE-AT ?auto_17205 ?auto_17206 ) ( ON ?auto_17205 ?auto_17212 ) ( CLEAR ?auto_17205 ) ( not ( = ?auto_17204 ?auto_17212 ) ) ( not ( = ?auto_17205 ?auto_17212 ) ) ( not ( = ?auto_17203 ?auto_17212 ) ) ( IS-CRATE ?auto_17204 ) ( not ( = ?auto_17208 ?auto_17213 ) ) ( not ( = ?auto_17206 ?auto_17208 ) ) ( HOIST-AT ?auto_17210 ?auto_17208 ) ( not ( = ?auto_17214 ?auto_17210 ) ) ( not ( = ?auto_17209 ?auto_17210 ) ) ( AVAILABLE ?auto_17210 ) ( SURFACE-AT ?auto_17204 ?auto_17208 ) ( ON ?auto_17204 ?auto_17211 ) ( CLEAR ?auto_17204 ) ( not ( = ?auto_17204 ?auto_17211 ) ) ( not ( = ?auto_17205 ?auto_17211 ) ) ( not ( = ?auto_17203 ?auto_17211 ) ) ( not ( = ?auto_17212 ?auto_17211 ) ) ( SURFACE-AT ?auto_17202 ?auto_17213 ) ( CLEAR ?auto_17202 ) ( IS-CRATE ?auto_17203 ) ( not ( = ?auto_17202 ?auto_17203 ) ) ( not ( = ?auto_17204 ?auto_17202 ) ) ( not ( = ?auto_17205 ?auto_17202 ) ) ( not ( = ?auto_17212 ?auto_17202 ) ) ( not ( = ?auto_17211 ?auto_17202 ) ) ( AVAILABLE ?auto_17214 ) ( TRUCK-AT ?auto_17207 ?auto_17206 ) ( LIFTING ?auto_17209 ?auto_17203 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17203 ?auto_17204 ?auto_17205 )
      ( MAKE-3CRATE-VERIFY ?auto_17202 ?auto_17203 ?auto_17204 ?auto_17205 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17215 - SURFACE
      ?auto_17216 - SURFACE
      ?auto_17217 - SURFACE
      ?auto_17218 - SURFACE
      ?auto_17219 - SURFACE
    )
    :vars
    (
      ?auto_17228 - HOIST
      ?auto_17227 - PLACE
      ?auto_17220 - PLACE
      ?auto_17223 - HOIST
      ?auto_17226 - SURFACE
      ?auto_17222 - PLACE
      ?auto_17224 - HOIST
      ?auto_17225 - SURFACE
      ?auto_17221 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17228 ?auto_17227 ) ( IS-CRATE ?auto_17219 ) ( not ( = ?auto_17218 ?auto_17219 ) ) ( not ( = ?auto_17217 ?auto_17218 ) ) ( not ( = ?auto_17217 ?auto_17219 ) ) ( not ( = ?auto_17220 ?auto_17227 ) ) ( HOIST-AT ?auto_17223 ?auto_17220 ) ( not ( = ?auto_17228 ?auto_17223 ) ) ( SURFACE-AT ?auto_17219 ?auto_17220 ) ( ON ?auto_17219 ?auto_17226 ) ( CLEAR ?auto_17219 ) ( not ( = ?auto_17218 ?auto_17226 ) ) ( not ( = ?auto_17219 ?auto_17226 ) ) ( not ( = ?auto_17217 ?auto_17226 ) ) ( IS-CRATE ?auto_17218 ) ( not ( = ?auto_17222 ?auto_17227 ) ) ( not ( = ?auto_17220 ?auto_17222 ) ) ( HOIST-AT ?auto_17224 ?auto_17222 ) ( not ( = ?auto_17228 ?auto_17224 ) ) ( not ( = ?auto_17223 ?auto_17224 ) ) ( AVAILABLE ?auto_17224 ) ( SURFACE-AT ?auto_17218 ?auto_17222 ) ( ON ?auto_17218 ?auto_17225 ) ( CLEAR ?auto_17218 ) ( not ( = ?auto_17218 ?auto_17225 ) ) ( not ( = ?auto_17219 ?auto_17225 ) ) ( not ( = ?auto_17217 ?auto_17225 ) ) ( not ( = ?auto_17226 ?auto_17225 ) ) ( SURFACE-AT ?auto_17216 ?auto_17227 ) ( CLEAR ?auto_17216 ) ( IS-CRATE ?auto_17217 ) ( not ( = ?auto_17216 ?auto_17217 ) ) ( not ( = ?auto_17218 ?auto_17216 ) ) ( not ( = ?auto_17219 ?auto_17216 ) ) ( not ( = ?auto_17226 ?auto_17216 ) ) ( not ( = ?auto_17225 ?auto_17216 ) ) ( AVAILABLE ?auto_17228 ) ( TRUCK-AT ?auto_17221 ?auto_17220 ) ( LIFTING ?auto_17223 ?auto_17217 ) ( ON ?auto_17216 ?auto_17215 ) ( not ( = ?auto_17215 ?auto_17216 ) ) ( not ( = ?auto_17215 ?auto_17217 ) ) ( not ( = ?auto_17215 ?auto_17218 ) ) ( not ( = ?auto_17215 ?auto_17219 ) ) ( not ( = ?auto_17215 ?auto_17226 ) ) ( not ( = ?auto_17215 ?auto_17225 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17217 ?auto_17218 ?auto_17219 )
      ( MAKE-4CRATE-VERIFY ?auto_17215 ?auto_17216 ?auto_17217 ?auto_17218 ?auto_17219 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17229 - SURFACE
      ?auto_17230 - SURFACE
    )
    :vars
    (
      ?auto_17241 - HOIST
      ?auto_17240 - PLACE
      ?auto_17231 - SURFACE
      ?auto_17232 - PLACE
      ?auto_17235 - HOIST
      ?auto_17239 - SURFACE
      ?auto_17234 - PLACE
      ?auto_17236 - HOIST
      ?auto_17237 - SURFACE
      ?auto_17238 - SURFACE
      ?auto_17233 - TRUCK
      ?auto_17242 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17241 ?auto_17240 ) ( IS-CRATE ?auto_17230 ) ( not ( = ?auto_17229 ?auto_17230 ) ) ( not ( = ?auto_17231 ?auto_17229 ) ) ( not ( = ?auto_17231 ?auto_17230 ) ) ( not ( = ?auto_17232 ?auto_17240 ) ) ( HOIST-AT ?auto_17235 ?auto_17232 ) ( not ( = ?auto_17241 ?auto_17235 ) ) ( SURFACE-AT ?auto_17230 ?auto_17232 ) ( ON ?auto_17230 ?auto_17239 ) ( CLEAR ?auto_17230 ) ( not ( = ?auto_17229 ?auto_17239 ) ) ( not ( = ?auto_17230 ?auto_17239 ) ) ( not ( = ?auto_17231 ?auto_17239 ) ) ( IS-CRATE ?auto_17229 ) ( not ( = ?auto_17234 ?auto_17240 ) ) ( not ( = ?auto_17232 ?auto_17234 ) ) ( HOIST-AT ?auto_17236 ?auto_17234 ) ( not ( = ?auto_17241 ?auto_17236 ) ) ( not ( = ?auto_17235 ?auto_17236 ) ) ( AVAILABLE ?auto_17236 ) ( SURFACE-AT ?auto_17229 ?auto_17234 ) ( ON ?auto_17229 ?auto_17237 ) ( CLEAR ?auto_17229 ) ( not ( = ?auto_17229 ?auto_17237 ) ) ( not ( = ?auto_17230 ?auto_17237 ) ) ( not ( = ?auto_17231 ?auto_17237 ) ) ( not ( = ?auto_17239 ?auto_17237 ) ) ( SURFACE-AT ?auto_17238 ?auto_17240 ) ( CLEAR ?auto_17238 ) ( IS-CRATE ?auto_17231 ) ( not ( = ?auto_17238 ?auto_17231 ) ) ( not ( = ?auto_17229 ?auto_17238 ) ) ( not ( = ?auto_17230 ?auto_17238 ) ) ( not ( = ?auto_17239 ?auto_17238 ) ) ( not ( = ?auto_17237 ?auto_17238 ) ) ( AVAILABLE ?auto_17241 ) ( TRUCK-AT ?auto_17233 ?auto_17232 ) ( AVAILABLE ?auto_17235 ) ( SURFACE-AT ?auto_17231 ?auto_17232 ) ( ON ?auto_17231 ?auto_17242 ) ( CLEAR ?auto_17231 ) ( not ( = ?auto_17229 ?auto_17242 ) ) ( not ( = ?auto_17230 ?auto_17242 ) ) ( not ( = ?auto_17231 ?auto_17242 ) ) ( not ( = ?auto_17239 ?auto_17242 ) ) ( not ( = ?auto_17237 ?auto_17242 ) ) ( not ( = ?auto_17238 ?auto_17242 ) ) )
    :subtasks
    ( ( !LIFT ?auto_17235 ?auto_17231 ?auto_17242 ?auto_17232 )
      ( MAKE-2CRATE ?auto_17231 ?auto_17229 ?auto_17230 )
      ( MAKE-1CRATE-VERIFY ?auto_17229 ?auto_17230 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17243 - SURFACE
      ?auto_17244 - SURFACE
      ?auto_17245 - SURFACE
    )
    :vars
    (
      ?auto_17250 - HOIST
      ?auto_17253 - PLACE
      ?auto_17254 - PLACE
      ?auto_17255 - HOIST
      ?auto_17248 - SURFACE
      ?auto_17249 - PLACE
      ?auto_17247 - HOIST
      ?auto_17246 - SURFACE
      ?auto_17256 - SURFACE
      ?auto_17251 - TRUCK
      ?auto_17252 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17250 ?auto_17253 ) ( IS-CRATE ?auto_17245 ) ( not ( = ?auto_17244 ?auto_17245 ) ) ( not ( = ?auto_17243 ?auto_17244 ) ) ( not ( = ?auto_17243 ?auto_17245 ) ) ( not ( = ?auto_17254 ?auto_17253 ) ) ( HOIST-AT ?auto_17255 ?auto_17254 ) ( not ( = ?auto_17250 ?auto_17255 ) ) ( SURFACE-AT ?auto_17245 ?auto_17254 ) ( ON ?auto_17245 ?auto_17248 ) ( CLEAR ?auto_17245 ) ( not ( = ?auto_17244 ?auto_17248 ) ) ( not ( = ?auto_17245 ?auto_17248 ) ) ( not ( = ?auto_17243 ?auto_17248 ) ) ( IS-CRATE ?auto_17244 ) ( not ( = ?auto_17249 ?auto_17253 ) ) ( not ( = ?auto_17254 ?auto_17249 ) ) ( HOIST-AT ?auto_17247 ?auto_17249 ) ( not ( = ?auto_17250 ?auto_17247 ) ) ( not ( = ?auto_17255 ?auto_17247 ) ) ( AVAILABLE ?auto_17247 ) ( SURFACE-AT ?auto_17244 ?auto_17249 ) ( ON ?auto_17244 ?auto_17246 ) ( CLEAR ?auto_17244 ) ( not ( = ?auto_17244 ?auto_17246 ) ) ( not ( = ?auto_17245 ?auto_17246 ) ) ( not ( = ?auto_17243 ?auto_17246 ) ) ( not ( = ?auto_17248 ?auto_17246 ) ) ( SURFACE-AT ?auto_17256 ?auto_17253 ) ( CLEAR ?auto_17256 ) ( IS-CRATE ?auto_17243 ) ( not ( = ?auto_17256 ?auto_17243 ) ) ( not ( = ?auto_17244 ?auto_17256 ) ) ( not ( = ?auto_17245 ?auto_17256 ) ) ( not ( = ?auto_17248 ?auto_17256 ) ) ( not ( = ?auto_17246 ?auto_17256 ) ) ( AVAILABLE ?auto_17250 ) ( TRUCK-AT ?auto_17251 ?auto_17254 ) ( AVAILABLE ?auto_17255 ) ( SURFACE-AT ?auto_17243 ?auto_17254 ) ( ON ?auto_17243 ?auto_17252 ) ( CLEAR ?auto_17243 ) ( not ( = ?auto_17244 ?auto_17252 ) ) ( not ( = ?auto_17245 ?auto_17252 ) ) ( not ( = ?auto_17243 ?auto_17252 ) ) ( not ( = ?auto_17248 ?auto_17252 ) ) ( not ( = ?auto_17246 ?auto_17252 ) ) ( not ( = ?auto_17256 ?auto_17252 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17244 ?auto_17245 )
      ( MAKE-2CRATE-VERIFY ?auto_17243 ?auto_17244 ?auto_17245 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17257 - SURFACE
      ?auto_17258 - SURFACE
      ?auto_17259 - SURFACE
      ?auto_17260 - SURFACE
    )
    :vars
    (
      ?auto_17270 - HOIST
      ?auto_17261 - PLACE
      ?auto_17263 - PLACE
      ?auto_17267 - HOIST
      ?auto_17265 - SURFACE
      ?auto_17262 - PLACE
      ?auto_17266 - HOIST
      ?auto_17268 - SURFACE
      ?auto_17264 - TRUCK
      ?auto_17269 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17270 ?auto_17261 ) ( IS-CRATE ?auto_17260 ) ( not ( = ?auto_17259 ?auto_17260 ) ) ( not ( = ?auto_17258 ?auto_17259 ) ) ( not ( = ?auto_17258 ?auto_17260 ) ) ( not ( = ?auto_17263 ?auto_17261 ) ) ( HOIST-AT ?auto_17267 ?auto_17263 ) ( not ( = ?auto_17270 ?auto_17267 ) ) ( SURFACE-AT ?auto_17260 ?auto_17263 ) ( ON ?auto_17260 ?auto_17265 ) ( CLEAR ?auto_17260 ) ( not ( = ?auto_17259 ?auto_17265 ) ) ( not ( = ?auto_17260 ?auto_17265 ) ) ( not ( = ?auto_17258 ?auto_17265 ) ) ( IS-CRATE ?auto_17259 ) ( not ( = ?auto_17262 ?auto_17261 ) ) ( not ( = ?auto_17263 ?auto_17262 ) ) ( HOIST-AT ?auto_17266 ?auto_17262 ) ( not ( = ?auto_17270 ?auto_17266 ) ) ( not ( = ?auto_17267 ?auto_17266 ) ) ( AVAILABLE ?auto_17266 ) ( SURFACE-AT ?auto_17259 ?auto_17262 ) ( ON ?auto_17259 ?auto_17268 ) ( CLEAR ?auto_17259 ) ( not ( = ?auto_17259 ?auto_17268 ) ) ( not ( = ?auto_17260 ?auto_17268 ) ) ( not ( = ?auto_17258 ?auto_17268 ) ) ( not ( = ?auto_17265 ?auto_17268 ) ) ( SURFACE-AT ?auto_17257 ?auto_17261 ) ( CLEAR ?auto_17257 ) ( IS-CRATE ?auto_17258 ) ( not ( = ?auto_17257 ?auto_17258 ) ) ( not ( = ?auto_17259 ?auto_17257 ) ) ( not ( = ?auto_17260 ?auto_17257 ) ) ( not ( = ?auto_17265 ?auto_17257 ) ) ( not ( = ?auto_17268 ?auto_17257 ) ) ( AVAILABLE ?auto_17270 ) ( TRUCK-AT ?auto_17264 ?auto_17263 ) ( AVAILABLE ?auto_17267 ) ( SURFACE-AT ?auto_17258 ?auto_17263 ) ( ON ?auto_17258 ?auto_17269 ) ( CLEAR ?auto_17258 ) ( not ( = ?auto_17259 ?auto_17269 ) ) ( not ( = ?auto_17260 ?auto_17269 ) ) ( not ( = ?auto_17258 ?auto_17269 ) ) ( not ( = ?auto_17265 ?auto_17269 ) ) ( not ( = ?auto_17268 ?auto_17269 ) ) ( not ( = ?auto_17257 ?auto_17269 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17258 ?auto_17259 ?auto_17260 )
      ( MAKE-3CRATE-VERIFY ?auto_17257 ?auto_17258 ?auto_17259 ?auto_17260 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17271 - SURFACE
      ?auto_17272 - SURFACE
      ?auto_17273 - SURFACE
      ?auto_17274 - SURFACE
      ?auto_17275 - SURFACE
    )
    :vars
    (
      ?auto_17285 - HOIST
      ?auto_17276 - PLACE
      ?auto_17278 - PLACE
      ?auto_17282 - HOIST
      ?auto_17280 - SURFACE
      ?auto_17277 - PLACE
      ?auto_17281 - HOIST
      ?auto_17283 - SURFACE
      ?auto_17279 - TRUCK
      ?auto_17284 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17285 ?auto_17276 ) ( IS-CRATE ?auto_17275 ) ( not ( = ?auto_17274 ?auto_17275 ) ) ( not ( = ?auto_17273 ?auto_17274 ) ) ( not ( = ?auto_17273 ?auto_17275 ) ) ( not ( = ?auto_17278 ?auto_17276 ) ) ( HOIST-AT ?auto_17282 ?auto_17278 ) ( not ( = ?auto_17285 ?auto_17282 ) ) ( SURFACE-AT ?auto_17275 ?auto_17278 ) ( ON ?auto_17275 ?auto_17280 ) ( CLEAR ?auto_17275 ) ( not ( = ?auto_17274 ?auto_17280 ) ) ( not ( = ?auto_17275 ?auto_17280 ) ) ( not ( = ?auto_17273 ?auto_17280 ) ) ( IS-CRATE ?auto_17274 ) ( not ( = ?auto_17277 ?auto_17276 ) ) ( not ( = ?auto_17278 ?auto_17277 ) ) ( HOIST-AT ?auto_17281 ?auto_17277 ) ( not ( = ?auto_17285 ?auto_17281 ) ) ( not ( = ?auto_17282 ?auto_17281 ) ) ( AVAILABLE ?auto_17281 ) ( SURFACE-AT ?auto_17274 ?auto_17277 ) ( ON ?auto_17274 ?auto_17283 ) ( CLEAR ?auto_17274 ) ( not ( = ?auto_17274 ?auto_17283 ) ) ( not ( = ?auto_17275 ?auto_17283 ) ) ( not ( = ?auto_17273 ?auto_17283 ) ) ( not ( = ?auto_17280 ?auto_17283 ) ) ( SURFACE-AT ?auto_17272 ?auto_17276 ) ( CLEAR ?auto_17272 ) ( IS-CRATE ?auto_17273 ) ( not ( = ?auto_17272 ?auto_17273 ) ) ( not ( = ?auto_17274 ?auto_17272 ) ) ( not ( = ?auto_17275 ?auto_17272 ) ) ( not ( = ?auto_17280 ?auto_17272 ) ) ( not ( = ?auto_17283 ?auto_17272 ) ) ( AVAILABLE ?auto_17285 ) ( TRUCK-AT ?auto_17279 ?auto_17278 ) ( AVAILABLE ?auto_17282 ) ( SURFACE-AT ?auto_17273 ?auto_17278 ) ( ON ?auto_17273 ?auto_17284 ) ( CLEAR ?auto_17273 ) ( not ( = ?auto_17274 ?auto_17284 ) ) ( not ( = ?auto_17275 ?auto_17284 ) ) ( not ( = ?auto_17273 ?auto_17284 ) ) ( not ( = ?auto_17280 ?auto_17284 ) ) ( not ( = ?auto_17283 ?auto_17284 ) ) ( not ( = ?auto_17272 ?auto_17284 ) ) ( ON ?auto_17272 ?auto_17271 ) ( not ( = ?auto_17271 ?auto_17272 ) ) ( not ( = ?auto_17271 ?auto_17273 ) ) ( not ( = ?auto_17271 ?auto_17274 ) ) ( not ( = ?auto_17271 ?auto_17275 ) ) ( not ( = ?auto_17271 ?auto_17280 ) ) ( not ( = ?auto_17271 ?auto_17283 ) ) ( not ( = ?auto_17271 ?auto_17284 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17273 ?auto_17274 ?auto_17275 )
      ( MAKE-4CRATE-VERIFY ?auto_17271 ?auto_17272 ?auto_17273 ?auto_17274 ?auto_17275 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17286 - SURFACE
      ?auto_17287 - SURFACE
    )
    :vars
    (
      ?auto_17298 - HOIST
      ?auto_17288 - PLACE
      ?auto_17299 - SURFACE
      ?auto_17290 - PLACE
      ?auto_17294 - HOIST
      ?auto_17292 - SURFACE
      ?auto_17289 - PLACE
      ?auto_17293 - HOIST
      ?auto_17295 - SURFACE
      ?auto_17297 - SURFACE
      ?auto_17296 - SURFACE
      ?auto_17291 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17298 ?auto_17288 ) ( IS-CRATE ?auto_17287 ) ( not ( = ?auto_17286 ?auto_17287 ) ) ( not ( = ?auto_17299 ?auto_17286 ) ) ( not ( = ?auto_17299 ?auto_17287 ) ) ( not ( = ?auto_17290 ?auto_17288 ) ) ( HOIST-AT ?auto_17294 ?auto_17290 ) ( not ( = ?auto_17298 ?auto_17294 ) ) ( SURFACE-AT ?auto_17287 ?auto_17290 ) ( ON ?auto_17287 ?auto_17292 ) ( CLEAR ?auto_17287 ) ( not ( = ?auto_17286 ?auto_17292 ) ) ( not ( = ?auto_17287 ?auto_17292 ) ) ( not ( = ?auto_17299 ?auto_17292 ) ) ( IS-CRATE ?auto_17286 ) ( not ( = ?auto_17289 ?auto_17288 ) ) ( not ( = ?auto_17290 ?auto_17289 ) ) ( HOIST-AT ?auto_17293 ?auto_17289 ) ( not ( = ?auto_17298 ?auto_17293 ) ) ( not ( = ?auto_17294 ?auto_17293 ) ) ( AVAILABLE ?auto_17293 ) ( SURFACE-AT ?auto_17286 ?auto_17289 ) ( ON ?auto_17286 ?auto_17295 ) ( CLEAR ?auto_17286 ) ( not ( = ?auto_17286 ?auto_17295 ) ) ( not ( = ?auto_17287 ?auto_17295 ) ) ( not ( = ?auto_17299 ?auto_17295 ) ) ( not ( = ?auto_17292 ?auto_17295 ) ) ( SURFACE-AT ?auto_17297 ?auto_17288 ) ( CLEAR ?auto_17297 ) ( IS-CRATE ?auto_17299 ) ( not ( = ?auto_17297 ?auto_17299 ) ) ( not ( = ?auto_17286 ?auto_17297 ) ) ( not ( = ?auto_17287 ?auto_17297 ) ) ( not ( = ?auto_17292 ?auto_17297 ) ) ( not ( = ?auto_17295 ?auto_17297 ) ) ( AVAILABLE ?auto_17298 ) ( AVAILABLE ?auto_17294 ) ( SURFACE-AT ?auto_17299 ?auto_17290 ) ( ON ?auto_17299 ?auto_17296 ) ( CLEAR ?auto_17299 ) ( not ( = ?auto_17286 ?auto_17296 ) ) ( not ( = ?auto_17287 ?auto_17296 ) ) ( not ( = ?auto_17299 ?auto_17296 ) ) ( not ( = ?auto_17292 ?auto_17296 ) ) ( not ( = ?auto_17295 ?auto_17296 ) ) ( not ( = ?auto_17297 ?auto_17296 ) ) ( TRUCK-AT ?auto_17291 ?auto_17288 ) )
    :subtasks
    ( ( !DRIVE ?auto_17291 ?auto_17288 ?auto_17290 )
      ( MAKE-2CRATE ?auto_17299 ?auto_17286 ?auto_17287 )
      ( MAKE-1CRATE-VERIFY ?auto_17286 ?auto_17287 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17300 - SURFACE
      ?auto_17301 - SURFACE
      ?auto_17302 - SURFACE
    )
    :vars
    (
      ?auto_17306 - HOIST
      ?auto_17311 - PLACE
      ?auto_17308 - PLACE
      ?auto_17313 - HOIST
      ?auto_17304 - SURFACE
      ?auto_17305 - PLACE
      ?auto_17303 - HOIST
      ?auto_17307 - SURFACE
      ?auto_17309 - SURFACE
      ?auto_17310 - SURFACE
      ?auto_17312 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17306 ?auto_17311 ) ( IS-CRATE ?auto_17302 ) ( not ( = ?auto_17301 ?auto_17302 ) ) ( not ( = ?auto_17300 ?auto_17301 ) ) ( not ( = ?auto_17300 ?auto_17302 ) ) ( not ( = ?auto_17308 ?auto_17311 ) ) ( HOIST-AT ?auto_17313 ?auto_17308 ) ( not ( = ?auto_17306 ?auto_17313 ) ) ( SURFACE-AT ?auto_17302 ?auto_17308 ) ( ON ?auto_17302 ?auto_17304 ) ( CLEAR ?auto_17302 ) ( not ( = ?auto_17301 ?auto_17304 ) ) ( not ( = ?auto_17302 ?auto_17304 ) ) ( not ( = ?auto_17300 ?auto_17304 ) ) ( IS-CRATE ?auto_17301 ) ( not ( = ?auto_17305 ?auto_17311 ) ) ( not ( = ?auto_17308 ?auto_17305 ) ) ( HOIST-AT ?auto_17303 ?auto_17305 ) ( not ( = ?auto_17306 ?auto_17303 ) ) ( not ( = ?auto_17313 ?auto_17303 ) ) ( AVAILABLE ?auto_17303 ) ( SURFACE-AT ?auto_17301 ?auto_17305 ) ( ON ?auto_17301 ?auto_17307 ) ( CLEAR ?auto_17301 ) ( not ( = ?auto_17301 ?auto_17307 ) ) ( not ( = ?auto_17302 ?auto_17307 ) ) ( not ( = ?auto_17300 ?auto_17307 ) ) ( not ( = ?auto_17304 ?auto_17307 ) ) ( SURFACE-AT ?auto_17309 ?auto_17311 ) ( CLEAR ?auto_17309 ) ( IS-CRATE ?auto_17300 ) ( not ( = ?auto_17309 ?auto_17300 ) ) ( not ( = ?auto_17301 ?auto_17309 ) ) ( not ( = ?auto_17302 ?auto_17309 ) ) ( not ( = ?auto_17304 ?auto_17309 ) ) ( not ( = ?auto_17307 ?auto_17309 ) ) ( AVAILABLE ?auto_17306 ) ( AVAILABLE ?auto_17313 ) ( SURFACE-AT ?auto_17300 ?auto_17308 ) ( ON ?auto_17300 ?auto_17310 ) ( CLEAR ?auto_17300 ) ( not ( = ?auto_17301 ?auto_17310 ) ) ( not ( = ?auto_17302 ?auto_17310 ) ) ( not ( = ?auto_17300 ?auto_17310 ) ) ( not ( = ?auto_17304 ?auto_17310 ) ) ( not ( = ?auto_17307 ?auto_17310 ) ) ( not ( = ?auto_17309 ?auto_17310 ) ) ( TRUCK-AT ?auto_17312 ?auto_17311 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17301 ?auto_17302 )
      ( MAKE-2CRATE-VERIFY ?auto_17300 ?auto_17301 ?auto_17302 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17314 - SURFACE
      ?auto_17315 - SURFACE
      ?auto_17316 - SURFACE
      ?auto_17317 - SURFACE
    )
    :vars
    (
      ?auto_17324 - HOIST
      ?auto_17321 - PLACE
      ?auto_17322 - PLACE
      ?auto_17320 - HOIST
      ?auto_17319 - SURFACE
      ?auto_17318 - PLACE
      ?auto_17323 - HOIST
      ?auto_17325 - SURFACE
      ?auto_17326 - SURFACE
      ?auto_17327 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17324 ?auto_17321 ) ( IS-CRATE ?auto_17317 ) ( not ( = ?auto_17316 ?auto_17317 ) ) ( not ( = ?auto_17315 ?auto_17316 ) ) ( not ( = ?auto_17315 ?auto_17317 ) ) ( not ( = ?auto_17322 ?auto_17321 ) ) ( HOIST-AT ?auto_17320 ?auto_17322 ) ( not ( = ?auto_17324 ?auto_17320 ) ) ( SURFACE-AT ?auto_17317 ?auto_17322 ) ( ON ?auto_17317 ?auto_17319 ) ( CLEAR ?auto_17317 ) ( not ( = ?auto_17316 ?auto_17319 ) ) ( not ( = ?auto_17317 ?auto_17319 ) ) ( not ( = ?auto_17315 ?auto_17319 ) ) ( IS-CRATE ?auto_17316 ) ( not ( = ?auto_17318 ?auto_17321 ) ) ( not ( = ?auto_17322 ?auto_17318 ) ) ( HOIST-AT ?auto_17323 ?auto_17318 ) ( not ( = ?auto_17324 ?auto_17323 ) ) ( not ( = ?auto_17320 ?auto_17323 ) ) ( AVAILABLE ?auto_17323 ) ( SURFACE-AT ?auto_17316 ?auto_17318 ) ( ON ?auto_17316 ?auto_17325 ) ( CLEAR ?auto_17316 ) ( not ( = ?auto_17316 ?auto_17325 ) ) ( not ( = ?auto_17317 ?auto_17325 ) ) ( not ( = ?auto_17315 ?auto_17325 ) ) ( not ( = ?auto_17319 ?auto_17325 ) ) ( SURFACE-AT ?auto_17314 ?auto_17321 ) ( CLEAR ?auto_17314 ) ( IS-CRATE ?auto_17315 ) ( not ( = ?auto_17314 ?auto_17315 ) ) ( not ( = ?auto_17316 ?auto_17314 ) ) ( not ( = ?auto_17317 ?auto_17314 ) ) ( not ( = ?auto_17319 ?auto_17314 ) ) ( not ( = ?auto_17325 ?auto_17314 ) ) ( AVAILABLE ?auto_17324 ) ( AVAILABLE ?auto_17320 ) ( SURFACE-AT ?auto_17315 ?auto_17322 ) ( ON ?auto_17315 ?auto_17326 ) ( CLEAR ?auto_17315 ) ( not ( = ?auto_17316 ?auto_17326 ) ) ( not ( = ?auto_17317 ?auto_17326 ) ) ( not ( = ?auto_17315 ?auto_17326 ) ) ( not ( = ?auto_17319 ?auto_17326 ) ) ( not ( = ?auto_17325 ?auto_17326 ) ) ( not ( = ?auto_17314 ?auto_17326 ) ) ( TRUCK-AT ?auto_17327 ?auto_17321 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17315 ?auto_17316 ?auto_17317 )
      ( MAKE-3CRATE-VERIFY ?auto_17314 ?auto_17315 ?auto_17316 ?auto_17317 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17328 - SURFACE
      ?auto_17329 - SURFACE
      ?auto_17330 - SURFACE
      ?auto_17331 - SURFACE
      ?auto_17332 - SURFACE
    )
    :vars
    (
      ?auto_17339 - HOIST
      ?auto_17336 - PLACE
      ?auto_17337 - PLACE
      ?auto_17335 - HOIST
      ?auto_17334 - SURFACE
      ?auto_17333 - PLACE
      ?auto_17338 - HOIST
      ?auto_17340 - SURFACE
      ?auto_17341 - SURFACE
      ?auto_17342 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17339 ?auto_17336 ) ( IS-CRATE ?auto_17332 ) ( not ( = ?auto_17331 ?auto_17332 ) ) ( not ( = ?auto_17330 ?auto_17331 ) ) ( not ( = ?auto_17330 ?auto_17332 ) ) ( not ( = ?auto_17337 ?auto_17336 ) ) ( HOIST-AT ?auto_17335 ?auto_17337 ) ( not ( = ?auto_17339 ?auto_17335 ) ) ( SURFACE-AT ?auto_17332 ?auto_17337 ) ( ON ?auto_17332 ?auto_17334 ) ( CLEAR ?auto_17332 ) ( not ( = ?auto_17331 ?auto_17334 ) ) ( not ( = ?auto_17332 ?auto_17334 ) ) ( not ( = ?auto_17330 ?auto_17334 ) ) ( IS-CRATE ?auto_17331 ) ( not ( = ?auto_17333 ?auto_17336 ) ) ( not ( = ?auto_17337 ?auto_17333 ) ) ( HOIST-AT ?auto_17338 ?auto_17333 ) ( not ( = ?auto_17339 ?auto_17338 ) ) ( not ( = ?auto_17335 ?auto_17338 ) ) ( AVAILABLE ?auto_17338 ) ( SURFACE-AT ?auto_17331 ?auto_17333 ) ( ON ?auto_17331 ?auto_17340 ) ( CLEAR ?auto_17331 ) ( not ( = ?auto_17331 ?auto_17340 ) ) ( not ( = ?auto_17332 ?auto_17340 ) ) ( not ( = ?auto_17330 ?auto_17340 ) ) ( not ( = ?auto_17334 ?auto_17340 ) ) ( SURFACE-AT ?auto_17329 ?auto_17336 ) ( CLEAR ?auto_17329 ) ( IS-CRATE ?auto_17330 ) ( not ( = ?auto_17329 ?auto_17330 ) ) ( not ( = ?auto_17331 ?auto_17329 ) ) ( not ( = ?auto_17332 ?auto_17329 ) ) ( not ( = ?auto_17334 ?auto_17329 ) ) ( not ( = ?auto_17340 ?auto_17329 ) ) ( AVAILABLE ?auto_17339 ) ( AVAILABLE ?auto_17335 ) ( SURFACE-AT ?auto_17330 ?auto_17337 ) ( ON ?auto_17330 ?auto_17341 ) ( CLEAR ?auto_17330 ) ( not ( = ?auto_17331 ?auto_17341 ) ) ( not ( = ?auto_17332 ?auto_17341 ) ) ( not ( = ?auto_17330 ?auto_17341 ) ) ( not ( = ?auto_17334 ?auto_17341 ) ) ( not ( = ?auto_17340 ?auto_17341 ) ) ( not ( = ?auto_17329 ?auto_17341 ) ) ( TRUCK-AT ?auto_17342 ?auto_17336 ) ( ON ?auto_17329 ?auto_17328 ) ( not ( = ?auto_17328 ?auto_17329 ) ) ( not ( = ?auto_17328 ?auto_17330 ) ) ( not ( = ?auto_17328 ?auto_17331 ) ) ( not ( = ?auto_17328 ?auto_17332 ) ) ( not ( = ?auto_17328 ?auto_17334 ) ) ( not ( = ?auto_17328 ?auto_17340 ) ) ( not ( = ?auto_17328 ?auto_17341 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17330 ?auto_17331 ?auto_17332 )
      ( MAKE-4CRATE-VERIFY ?auto_17328 ?auto_17329 ?auto_17330 ?auto_17331 ?auto_17332 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17343 - SURFACE
      ?auto_17344 - SURFACE
    )
    :vars
    (
      ?auto_17353 - HOIST
      ?auto_17349 - PLACE
      ?auto_17345 - SURFACE
      ?auto_17350 - PLACE
      ?auto_17348 - HOIST
      ?auto_17347 - SURFACE
      ?auto_17346 - PLACE
      ?auto_17351 - HOIST
      ?auto_17354 - SURFACE
      ?auto_17352 - SURFACE
      ?auto_17355 - SURFACE
      ?auto_17356 - TRUCK
      ?auto_17357 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17353 ?auto_17349 ) ( IS-CRATE ?auto_17344 ) ( not ( = ?auto_17343 ?auto_17344 ) ) ( not ( = ?auto_17345 ?auto_17343 ) ) ( not ( = ?auto_17345 ?auto_17344 ) ) ( not ( = ?auto_17350 ?auto_17349 ) ) ( HOIST-AT ?auto_17348 ?auto_17350 ) ( not ( = ?auto_17353 ?auto_17348 ) ) ( SURFACE-AT ?auto_17344 ?auto_17350 ) ( ON ?auto_17344 ?auto_17347 ) ( CLEAR ?auto_17344 ) ( not ( = ?auto_17343 ?auto_17347 ) ) ( not ( = ?auto_17344 ?auto_17347 ) ) ( not ( = ?auto_17345 ?auto_17347 ) ) ( IS-CRATE ?auto_17343 ) ( not ( = ?auto_17346 ?auto_17349 ) ) ( not ( = ?auto_17350 ?auto_17346 ) ) ( HOIST-AT ?auto_17351 ?auto_17346 ) ( not ( = ?auto_17353 ?auto_17351 ) ) ( not ( = ?auto_17348 ?auto_17351 ) ) ( AVAILABLE ?auto_17351 ) ( SURFACE-AT ?auto_17343 ?auto_17346 ) ( ON ?auto_17343 ?auto_17354 ) ( CLEAR ?auto_17343 ) ( not ( = ?auto_17343 ?auto_17354 ) ) ( not ( = ?auto_17344 ?auto_17354 ) ) ( not ( = ?auto_17345 ?auto_17354 ) ) ( not ( = ?auto_17347 ?auto_17354 ) ) ( IS-CRATE ?auto_17345 ) ( not ( = ?auto_17352 ?auto_17345 ) ) ( not ( = ?auto_17343 ?auto_17352 ) ) ( not ( = ?auto_17344 ?auto_17352 ) ) ( not ( = ?auto_17347 ?auto_17352 ) ) ( not ( = ?auto_17354 ?auto_17352 ) ) ( AVAILABLE ?auto_17348 ) ( SURFACE-AT ?auto_17345 ?auto_17350 ) ( ON ?auto_17345 ?auto_17355 ) ( CLEAR ?auto_17345 ) ( not ( = ?auto_17343 ?auto_17355 ) ) ( not ( = ?auto_17344 ?auto_17355 ) ) ( not ( = ?auto_17345 ?auto_17355 ) ) ( not ( = ?auto_17347 ?auto_17355 ) ) ( not ( = ?auto_17354 ?auto_17355 ) ) ( not ( = ?auto_17352 ?auto_17355 ) ) ( TRUCK-AT ?auto_17356 ?auto_17349 ) ( SURFACE-AT ?auto_17357 ?auto_17349 ) ( CLEAR ?auto_17357 ) ( LIFTING ?auto_17353 ?auto_17352 ) ( IS-CRATE ?auto_17352 ) ( not ( = ?auto_17357 ?auto_17352 ) ) ( not ( = ?auto_17343 ?auto_17357 ) ) ( not ( = ?auto_17344 ?auto_17357 ) ) ( not ( = ?auto_17345 ?auto_17357 ) ) ( not ( = ?auto_17347 ?auto_17357 ) ) ( not ( = ?auto_17354 ?auto_17357 ) ) ( not ( = ?auto_17355 ?auto_17357 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17357 ?auto_17352 )
      ( MAKE-2CRATE ?auto_17345 ?auto_17343 ?auto_17344 )
      ( MAKE-1CRATE-VERIFY ?auto_17343 ?auto_17344 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17358 - SURFACE
      ?auto_17359 - SURFACE
      ?auto_17360 - SURFACE
    )
    :vars
    (
      ?auto_17361 - HOIST
      ?auto_17363 - PLACE
      ?auto_17369 - PLACE
      ?auto_17367 - HOIST
      ?auto_17368 - SURFACE
      ?auto_17364 - PLACE
      ?auto_17370 - HOIST
      ?auto_17371 - SURFACE
      ?auto_17366 - SURFACE
      ?auto_17365 - SURFACE
      ?auto_17362 - TRUCK
      ?auto_17372 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17361 ?auto_17363 ) ( IS-CRATE ?auto_17360 ) ( not ( = ?auto_17359 ?auto_17360 ) ) ( not ( = ?auto_17358 ?auto_17359 ) ) ( not ( = ?auto_17358 ?auto_17360 ) ) ( not ( = ?auto_17369 ?auto_17363 ) ) ( HOIST-AT ?auto_17367 ?auto_17369 ) ( not ( = ?auto_17361 ?auto_17367 ) ) ( SURFACE-AT ?auto_17360 ?auto_17369 ) ( ON ?auto_17360 ?auto_17368 ) ( CLEAR ?auto_17360 ) ( not ( = ?auto_17359 ?auto_17368 ) ) ( not ( = ?auto_17360 ?auto_17368 ) ) ( not ( = ?auto_17358 ?auto_17368 ) ) ( IS-CRATE ?auto_17359 ) ( not ( = ?auto_17364 ?auto_17363 ) ) ( not ( = ?auto_17369 ?auto_17364 ) ) ( HOIST-AT ?auto_17370 ?auto_17364 ) ( not ( = ?auto_17361 ?auto_17370 ) ) ( not ( = ?auto_17367 ?auto_17370 ) ) ( AVAILABLE ?auto_17370 ) ( SURFACE-AT ?auto_17359 ?auto_17364 ) ( ON ?auto_17359 ?auto_17371 ) ( CLEAR ?auto_17359 ) ( not ( = ?auto_17359 ?auto_17371 ) ) ( not ( = ?auto_17360 ?auto_17371 ) ) ( not ( = ?auto_17358 ?auto_17371 ) ) ( not ( = ?auto_17368 ?auto_17371 ) ) ( IS-CRATE ?auto_17358 ) ( not ( = ?auto_17366 ?auto_17358 ) ) ( not ( = ?auto_17359 ?auto_17366 ) ) ( not ( = ?auto_17360 ?auto_17366 ) ) ( not ( = ?auto_17368 ?auto_17366 ) ) ( not ( = ?auto_17371 ?auto_17366 ) ) ( AVAILABLE ?auto_17367 ) ( SURFACE-AT ?auto_17358 ?auto_17369 ) ( ON ?auto_17358 ?auto_17365 ) ( CLEAR ?auto_17358 ) ( not ( = ?auto_17359 ?auto_17365 ) ) ( not ( = ?auto_17360 ?auto_17365 ) ) ( not ( = ?auto_17358 ?auto_17365 ) ) ( not ( = ?auto_17368 ?auto_17365 ) ) ( not ( = ?auto_17371 ?auto_17365 ) ) ( not ( = ?auto_17366 ?auto_17365 ) ) ( TRUCK-AT ?auto_17362 ?auto_17363 ) ( SURFACE-AT ?auto_17372 ?auto_17363 ) ( CLEAR ?auto_17372 ) ( LIFTING ?auto_17361 ?auto_17366 ) ( IS-CRATE ?auto_17366 ) ( not ( = ?auto_17372 ?auto_17366 ) ) ( not ( = ?auto_17359 ?auto_17372 ) ) ( not ( = ?auto_17360 ?auto_17372 ) ) ( not ( = ?auto_17358 ?auto_17372 ) ) ( not ( = ?auto_17368 ?auto_17372 ) ) ( not ( = ?auto_17371 ?auto_17372 ) ) ( not ( = ?auto_17365 ?auto_17372 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17359 ?auto_17360 )
      ( MAKE-2CRATE-VERIFY ?auto_17358 ?auto_17359 ?auto_17360 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17373 - SURFACE
      ?auto_17374 - SURFACE
      ?auto_17375 - SURFACE
      ?auto_17376 - SURFACE
    )
    :vars
    (
      ?auto_17384 - HOIST
      ?auto_17378 - PLACE
      ?auto_17380 - PLACE
      ?auto_17377 - HOIST
      ?auto_17379 - SURFACE
      ?auto_17382 - PLACE
      ?auto_17381 - HOIST
      ?auto_17385 - SURFACE
      ?auto_17383 - SURFACE
      ?auto_17387 - TRUCK
      ?auto_17386 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17384 ?auto_17378 ) ( IS-CRATE ?auto_17376 ) ( not ( = ?auto_17375 ?auto_17376 ) ) ( not ( = ?auto_17374 ?auto_17375 ) ) ( not ( = ?auto_17374 ?auto_17376 ) ) ( not ( = ?auto_17380 ?auto_17378 ) ) ( HOIST-AT ?auto_17377 ?auto_17380 ) ( not ( = ?auto_17384 ?auto_17377 ) ) ( SURFACE-AT ?auto_17376 ?auto_17380 ) ( ON ?auto_17376 ?auto_17379 ) ( CLEAR ?auto_17376 ) ( not ( = ?auto_17375 ?auto_17379 ) ) ( not ( = ?auto_17376 ?auto_17379 ) ) ( not ( = ?auto_17374 ?auto_17379 ) ) ( IS-CRATE ?auto_17375 ) ( not ( = ?auto_17382 ?auto_17378 ) ) ( not ( = ?auto_17380 ?auto_17382 ) ) ( HOIST-AT ?auto_17381 ?auto_17382 ) ( not ( = ?auto_17384 ?auto_17381 ) ) ( not ( = ?auto_17377 ?auto_17381 ) ) ( AVAILABLE ?auto_17381 ) ( SURFACE-AT ?auto_17375 ?auto_17382 ) ( ON ?auto_17375 ?auto_17385 ) ( CLEAR ?auto_17375 ) ( not ( = ?auto_17375 ?auto_17385 ) ) ( not ( = ?auto_17376 ?auto_17385 ) ) ( not ( = ?auto_17374 ?auto_17385 ) ) ( not ( = ?auto_17379 ?auto_17385 ) ) ( IS-CRATE ?auto_17374 ) ( not ( = ?auto_17373 ?auto_17374 ) ) ( not ( = ?auto_17375 ?auto_17373 ) ) ( not ( = ?auto_17376 ?auto_17373 ) ) ( not ( = ?auto_17379 ?auto_17373 ) ) ( not ( = ?auto_17385 ?auto_17373 ) ) ( AVAILABLE ?auto_17377 ) ( SURFACE-AT ?auto_17374 ?auto_17380 ) ( ON ?auto_17374 ?auto_17383 ) ( CLEAR ?auto_17374 ) ( not ( = ?auto_17375 ?auto_17383 ) ) ( not ( = ?auto_17376 ?auto_17383 ) ) ( not ( = ?auto_17374 ?auto_17383 ) ) ( not ( = ?auto_17379 ?auto_17383 ) ) ( not ( = ?auto_17385 ?auto_17383 ) ) ( not ( = ?auto_17373 ?auto_17383 ) ) ( TRUCK-AT ?auto_17387 ?auto_17378 ) ( SURFACE-AT ?auto_17386 ?auto_17378 ) ( CLEAR ?auto_17386 ) ( LIFTING ?auto_17384 ?auto_17373 ) ( IS-CRATE ?auto_17373 ) ( not ( = ?auto_17386 ?auto_17373 ) ) ( not ( = ?auto_17375 ?auto_17386 ) ) ( not ( = ?auto_17376 ?auto_17386 ) ) ( not ( = ?auto_17374 ?auto_17386 ) ) ( not ( = ?auto_17379 ?auto_17386 ) ) ( not ( = ?auto_17385 ?auto_17386 ) ) ( not ( = ?auto_17383 ?auto_17386 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17374 ?auto_17375 ?auto_17376 )
      ( MAKE-3CRATE-VERIFY ?auto_17373 ?auto_17374 ?auto_17375 ?auto_17376 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17388 - SURFACE
      ?auto_17389 - SURFACE
      ?auto_17390 - SURFACE
      ?auto_17391 - SURFACE
      ?auto_17392 - SURFACE
    )
    :vars
    (
      ?auto_17400 - HOIST
      ?auto_17394 - PLACE
      ?auto_17396 - PLACE
      ?auto_17393 - HOIST
      ?auto_17395 - SURFACE
      ?auto_17398 - PLACE
      ?auto_17397 - HOIST
      ?auto_17401 - SURFACE
      ?auto_17399 - SURFACE
      ?auto_17402 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17400 ?auto_17394 ) ( IS-CRATE ?auto_17392 ) ( not ( = ?auto_17391 ?auto_17392 ) ) ( not ( = ?auto_17390 ?auto_17391 ) ) ( not ( = ?auto_17390 ?auto_17392 ) ) ( not ( = ?auto_17396 ?auto_17394 ) ) ( HOIST-AT ?auto_17393 ?auto_17396 ) ( not ( = ?auto_17400 ?auto_17393 ) ) ( SURFACE-AT ?auto_17392 ?auto_17396 ) ( ON ?auto_17392 ?auto_17395 ) ( CLEAR ?auto_17392 ) ( not ( = ?auto_17391 ?auto_17395 ) ) ( not ( = ?auto_17392 ?auto_17395 ) ) ( not ( = ?auto_17390 ?auto_17395 ) ) ( IS-CRATE ?auto_17391 ) ( not ( = ?auto_17398 ?auto_17394 ) ) ( not ( = ?auto_17396 ?auto_17398 ) ) ( HOIST-AT ?auto_17397 ?auto_17398 ) ( not ( = ?auto_17400 ?auto_17397 ) ) ( not ( = ?auto_17393 ?auto_17397 ) ) ( AVAILABLE ?auto_17397 ) ( SURFACE-AT ?auto_17391 ?auto_17398 ) ( ON ?auto_17391 ?auto_17401 ) ( CLEAR ?auto_17391 ) ( not ( = ?auto_17391 ?auto_17401 ) ) ( not ( = ?auto_17392 ?auto_17401 ) ) ( not ( = ?auto_17390 ?auto_17401 ) ) ( not ( = ?auto_17395 ?auto_17401 ) ) ( IS-CRATE ?auto_17390 ) ( not ( = ?auto_17389 ?auto_17390 ) ) ( not ( = ?auto_17391 ?auto_17389 ) ) ( not ( = ?auto_17392 ?auto_17389 ) ) ( not ( = ?auto_17395 ?auto_17389 ) ) ( not ( = ?auto_17401 ?auto_17389 ) ) ( AVAILABLE ?auto_17393 ) ( SURFACE-AT ?auto_17390 ?auto_17396 ) ( ON ?auto_17390 ?auto_17399 ) ( CLEAR ?auto_17390 ) ( not ( = ?auto_17391 ?auto_17399 ) ) ( not ( = ?auto_17392 ?auto_17399 ) ) ( not ( = ?auto_17390 ?auto_17399 ) ) ( not ( = ?auto_17395 ?auto_17399 ) ) ( not ( = ?auto_17401 ?auto_17399 ) ) ( not ( = ?auto_17389 ?auto_17399 ) ) ( TRUCK-AT ?auto_17402 ?auto_17394 ) ( SURFACE-AT ?auto_17388 ?auto_17394 ) ( CLEAR ?auto_17388 ) ( LIFTING ?auto_17400 ?auto_17389 ) ( IS-CRATE ?auto_17389 ) ( not ( = ?auto_17388 ?auto_17389 ) ) ( not ( = ?auto_17391 ?auto_17388 ) ) ( not ( = ?auto_17392 ?auto_17388 ) ) ( not ( = ?auto_17390 ?auto_17388 ) ) ( not ( = ?auto_17395 ?auto_17388 ) ) ( not ( = ?auto_17401 ?auto_17388 ) ) ( not ( = ?auto_17399 ?auto_17388 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17390 ?auto_17391 ?auto_17392 )
      ( MAKE-4CRATE-VERIFY ?auto_17388 ?auto_17389 ?auto_17390 ?auto_17391 ?auto_17392 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17403 - SURFACE
      ?auto_17404 - SURFACE
    )
    :vars
    (
      ?auto_17413 - HOIST
      ?auto_17406 - PLACE
      ?auto_17412 - SURFACE
      ?auto_17408 - PLACE
      ?auto_17405 - HOIST
      ?auto_17407 - SURFACE
      ?auto_17410 - PLACE
      ?auto_17409 - HOIST
      ?auto_17414 - SURFACE
      ?auto_17415 - SURFACE
      ?auto_17411 - SURFACE
      ?auto_17417 - TRUCK
      ?auto_17416 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17413 ?auto_17406 ) ( IS-CRATE ?auto_17404 ) ( not ( = ?auto_17403 ?auto_17404 ) ) ( not ( = ?auto_17412 ?auto_17403 ) ) ( not ( = ?auto_17412 ?auto_17404 ) ) ( not ( = ?auto_17408 ?auto_17406 ) ) ( HOIST-AT ?auto_17405 ?auto_17408 ) ( not ( = ?auto_17413 ?auto_17405 ) ) ( SURFACE-AT ?auto_17404 ?auto_17408 ) ( ON ?auto_17404 ?auto_17407 ) ( CLEAR ?auto_17404 ) ( not ( = ?auto_17403 ?auto_17407 ) ) ( not ( = ?auto_17404 ?auto_17407 ) ) ( not ( = ?auto_17412 ?auto_17407 ) ) ( IS-CRATE ?auto_17403 ) ( not ( = ?auto_17410 ?auto_17406 ) ) ( not ( = ?auto_17408 ?auto_17410 ) ) ( HOIST-AT ?auto_17409 ?auto_17410 ) ( not ( = ?auto_17413 ?auto_17409 ) ) ( not ( = ?auto_17405 ?auto_17409 ) ) ( AVAILABLE ?auto_17409 ) ( SURFACE-AT ?auto_17403 ?auto_17410 ) ( ON ?auto_17403 ?auto_17414 ) ( CLEAR ?auto_17403 ) ( not ( = ?auto_17403 ?auto_17414 ) ) ( not ( = ?auto_17404 ?auto_17414 ) ) ( not ( = ?auto_17412 ?auto_17414 ) ) ( not ( = ?auto_17407 ?auto_17414 ) ) ( IS-CRATE ?auto_17412 ) ( not ( = ?auto_17415 ?auto_17412 ) ) ( not ( = ?auto_17403 ?auto_17415 ) ) ( not ( = ?auto_17404 ?auto_17415 ) ) ( not ( = ?auto_17407 ?auto_17415 ) ) ( not ( = ?auto_17414 ?auto_17415 ) ) ( AVAILABLE ?auto_17405 ) ( SURFACE-AT ?auto_17412 ?auto_17408 ) ( ON ?auto_17412 ?auto_17411 ) ( CLEAR ?auto_17412 ) ( not ( = ?auto_17403 ?auto_17411 ) ) ( not ( = ?auto_17404 ?auto_17411 ) ) ( not ( = ?auto_17412 ?auto_17411 ) ) ( not ( = ?auto_17407 ?auto_17411 ) ) ( not ( = ?auto_17414 ?auto_17411 ) ) ( not ( = ?auto_17415 ?auto_17411 ) ) ( TRUCK-AT ?auto_17417 ?auto_17406 ) ( SURFACE-AT ?auto_17416 ?auto_17406 ) ( CLEAR ?auto_17416 ) ( IS-CRATE ?auto_17415 ) ( not ( = ?auto_17416 ?auto_17415 ) ) ( not ( = ?auto_17403 ?auto_17416 ) ) ( not ( = ?auto_17404 ?auto_17416 ) ) ( not ( = ?auto_17412 ?auto_17416 ) ) ( not ( = ?auto_17407 ?auto_17416 ) ) ( not ( = ?auto_17414 ?auto_17416 ) ) ( not ( = ?auto_17411 ?auto_17416 ) ) ( AVAILABLE ?auto_17413 ) ( IN ?auto_17415 ?auto_17417 ) )
    :subtasks
    ( ( !UNLOAD ?auto_17413 ?auto_17415 ?auto_17417 ?auto_17406 )
      ( MAKE-2CRATE ?auto_17412 ?auto_17403 ?auto_17404 )
      ( MAKE-1CRATE-VERIFY ?auto_17403 ?auto_17404 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17418 - SURFACE
      ?auto_17419 - SURFACE
      ?auto_17420 - SURFACE
    )
    :vars
    (
      ?auto_17430 - HOIST
      ?auto_17422 - PLACE
      ?auto_17426 - PLACE
      ?auto_17429 - HOIST
      ?auto_17421 - SURFACE
      ?auto_17425 - PLACE
      ?auto_17428 - HOIST
      ?auto_17427 - SURFACE
      ?auto_17424 - SURFACE
      ?auto_17423 - SURFACE
      ?auto_17432 - TRUCK
      ?auto_17431 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17430 ?auto_17422 ) ( IS-CRATE ?auto_17420 ) ( not ( = ?auto_17419 ?auto_17420 ) ) ( not ( = ?auto_17418 ?auto_17419 ) ) ( not ( = ?auto_17418 ?auto_17420 ) ) ( not ( = ?auto_17426 ?auto_17422 ) ) ( HOIST-AT ?auto_17429 ?auto_17426 ) ( not ( = ?auto_17430 ?auto_17429 ) ) ( SURFACE-AT ?auto_17420 ?auto_17426 ) ( ON ?auto_17420 ?auto_17421 ) ( CLEAR ?auto_17420 ) ( not ( = ?auto_17419 ?auto_17421 ) ) ( not ( = ?auto_17420 ?auto_17421 ) ) ( not ( = ?auto_17418 ?auto_17421 ) ) ( IS-CRATE ?auto_17419 ) ( not ( = ?auto_17425 ?auto_17422 ) ) ( not ( = ?auto_17426 ?auto_17425 ) ) ( HOIST-AT ?auto_17428 ?auto_17425 ) ( not ( = ?auto_17430 ?auto_17428 ) ) ( not ( = ?auto_17429 ?auto_17428 ) ) ( AVAILABLE ?auto_17428 ) ( SURFACE-AT ?auto_17419 ?auto_17425 ) ( ON ?auto_17419 ?auto_17427 ) ( CLEAR ?auto_17419 ) ( not ( = ?auto_17419 ?auto_17427 ) ) ( not ( = ?auto_17420 ?auto_17427 ) ) ( not ( = ?auto_17418 ?auto_17427 ) ) ( not ( = ?auto_17421 ?auto_17427 ) ) ( IS-CRATE ?auto_17418 ) ( not ( = ?auto_17424 ?auto_17418 ) ) ( not ( = ?auto_17419 ?auto_17424 ) ) ( not ( = ?auto_17420 ?auto_17424 ) ) ( not ( = ?auto_17421 ?auto_17424 ) ) ( not ( = ?auto_17427 ?auto_17424 ) ) ( AVAILABLE ?auto_17429 ) ( SURFACE-AT ?auto_17418 ?auto_17426 ) ( ON ?auto_17418 ?auto_17423 ) ( CLEAR ?auto_17418 ) ( not ( = ?auto_17419 ?auto_17423 ) ) ( not ( = ?auto_17420 ?auto_17423 ) ) ( not ( = ?auto_17418 ?auto_17423 ) ) ( not ( = ?auto_17421 ?auto_17423 ) ) ( not ( = ?auto_17427 ?auto_17423 ) ) ( not ( = ?auto_17424 ?auto_17423 ) ) ( TRUCK-AT ?auto_17432 ?auto_17422 ) ( SURFACE-AT ?auto_17431 ?auto_17422 ) ( CLEAR ?auto_17431 ) ( IS-CRATE ?auto_17424 ) ( not ( = ?auto_17431 ?auto_17424 ) ) ( not ( = ?auto_17419 ?auto_17431 ) ) ( not ( = ?auto_17420 ?auto_17431 ) ) ( not ( = ?auto_17418 ?auto_17431 ) ) ( not ( = ?auto_17421 ?auto_17431 ) ) ( not ( = ?auto_17427 ?auto_17431 ) ) ( not ( = ?auto_17423 ?auto_17431 ) ) ( AVAILABLE ?auto_17430 ) ( IN ?auto_17424 ?auto_17432 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17419 ?auto_17420 )
      ( MAKE-2CRATE-VERIFY ?auto_17418 ?auto_17419 ?auto_17420 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17433 - SURFACE
      ?auto_17434 - SURFACE
      ?auto_17435 - SURFACE
      ?auto_17436 - SURFACE
    )
    :vars
    (
      ?auto_17443 - HOIST
      ?auto_17438 - PLACE
      ?auto_17445 - PLACE
      ?auto_17444 - HOIST
      ?auto_17440 - SURFACE
      ?auto_17446 - PLACE
      ?auto_17441 - HOIST
      ?auto_17439 - SURFACE
      ?auto_17442 - SURFACE
      ?auto_17437 - TRUCK
      ?auto_17447 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17443 ?auto_17438 ) ( IS-CRATE ?auto_17436 ) ( not ( = ?auto_17435 ?auto_17436 ) ) ( not ( = ?auto_17434 ?auto_17435 ) ) ( not ( = ?auto_17434 ?auto_17436 ) ) ( not ( = ?auto_17445 ?auto_17438 ) ) ( HOIST-AT ?auto_17444 ?auto_17445 ) ( not ( = ?auto_17443 ?auto_17444 ) ) ( SURFACE-AT ?auto_17436 ?auto_17445 ) ( ON ?auto_17436 ?auto_17440 ) ( CLEAR ?auto_17436 ) ( not ( = ?auto_17435 ?auto_17440 ) ) ( not ( = ?auto_17436 ?auto_17440 ) ) ( not ( = ?auto_17434 ?auto_17440 ) ) ( IS-CRATE ?auto_17435 ) ( not ( = ?auto_17446 ?auto_17438 ) ) ( not ( = ?auto_17445 ?auto_17446 ) ) ( HOIST-AT ?auto_17441 ?auto_17446 ) ( not ( = ?auto_17443 ?auto_17441 ) ) ( not ( = ?auto_17444 ?auto_17441 ) ) ( AVAILABLE ?auto_17441 ) ( SURFACE-AT ?auto_17435 ?auto_17446 ) ( ON ?auto_17435 ?auto_17439 ) ( CLEAR ?auto_17435 ) ( not ( = ?auto_17435 ?auto_17439 ) ) ( not ( = ?auto_17436 ?auto_17439 ) ) ( not ( = ?auto_17434 ?auto_17439 ) ) ( not ( = ?auto_17440 ?auto_17439 ) ) ( IS-CRATE ?auto_17434 ) ( not ( = ?auto_17433 ?auto_17434 ) ) ( not ( = ?auto_17435 ?auto_17433 ) ) ( not ( = ?auto_17436 ?auto_17433 ) ) ( not ( = ?auto_17440 ?auto_17433 ) ) ( not ( = ?auto_17439 ?auto_17433 ) ) ( AVAILABLE ?auto_17444 ) ( SURFACE-AT ?auto_17434 ?auto_17445 ) ( ON ?auto_17434 ?auto_17442 ) ( CLEAR ?auto_17434 ) ( not ( = ?auto_17435 ?auto_17442 ) ) ( not ( = ?auto_17436 ?auto_17442 ) ) ( not ( = ?auto_17434 ?auto_17442 ) ) ( not ( = ?auto_17440 ?auto_17442 ) ) ( not ( = ?auto_17439 ?auto_17442 ) ) ( not ( = ?auto_17433 ?auto_17442 ) ) ( TRUCK-AT ?auto_17437 ?auto_17438 ) ( SURFACE-AT ?auto_17447 ?auto_17438 ) ( CLEAR ?auto_17447 ) ( IS-CRATE ?auto_17433 ) ( not ( = ?auto_17447 ?auto_17433 ) ) ( not ( = ?auto_17435 ?auto_17447 ) ) ( not ( = ?auto_17436 ?auto_17447 ) ) ( not ( = ?auto_17434 ?auto_17447 ) ) ( not ( = ?auto_17440 ?auto_17447 ) ) ( not ( = ?auto_17439 ?auto_17447 ) ) ( not ( = ?auto_17442 ?auto_17447 ) ) ( AVAILABLE ?auto_17443 ) ( IN ?auto_17433 ?auto_17437 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17434 ?auto_17435 ?auto_17436 )
      ( MAKE-3CRATE-VERIFY ?auto_17433 ?auto_17434 ?auto_17435 ?auto_17436 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17448 - SURFACE
      ?auto_17449 - SURFACE
      ?auto_17450 - SURFACE
      ?auto_17451 - SURFACE
      ?auto_17452 - SURFACE
    )
    :vars
    (
      ?auto_17459 - HOIST
      ?auto_17454 - PLACE
      ?auto_17461 - PLACE
      ?auto_17460 - HOIST
      ?auto_17456 - SURFACE
      ?auto_17462 - PLACE
      ?auto_17457 - HOIST
      ?auto_17455 - SURFACE
      ?auto_17458 - SURFACE
      ?auto_17453 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17459 ?auto_17454 ) ( IS-CRATE ?auto_17452 ) ( not ( = ?auto_17451 ?auto_17452 ) ) ( not ( = ?auto_17450 ?auto_17451 ) ) ( not ( = ?auto_17450 ?auto_17452 ) ) ( not ( = ?auto_17461 ?auto_17454 ) ) ( HOIST-AT ?auto_17460 ?auto_17461 ) ( not ( = ?auto_17459 ?auto_17460 ) ) ( SURFACE-AT ?auto_17452 ?auto_17461 ) ( ON ?auto_17452 ?auto_17456 ) ( CLEAR ?auto_17452 ) ( not ( = ?auto_17451 ?auto_17456 ) ) ( not ( = ?auto_17452 ?auto_17456 ) ) ( not ( = ?auto_17450 ?auto_17456 ) ) ( IS-CRATE ?auto_17451 ) ( not ( = ?auto_17462 ?auto_17454 ) ) ( not ( = ?auto_17461 ?auto_17462 ) ) ( HOIST-AT ?auto_17457 ?auto_17462 ) ( not ( = ?auto_17459 ?auto_17457 ) ) ( not ( = ?auto_17460 ?auto_17457 ) ) ( AVAILABLE ?auto_17457 ) ( SURFACE-AT ?auto_17451 ?auto_17462 ) ( ON ?auto_17451 ?auto_17455 ) ( CLEAR ?auto_17451 ) ( not ( = ?auto_17451 ?auto_17455 ) ) ( not ( = ?auto_17452 ?auto_17455 ) ) ( not ( = ?auto_17450 ?auto_17455 ) ) ( not ( = ?auto_17456 ?auto_17455 ) ) ( IS-CRATE ?auto_17450 ) ( not ( = ?auto_17449 ?auto_17450 ) ) ( not ( = ?auto_17451 ?auto_17449 ) ) ( not ( = ?auto_17452 ?auto_17449 ) ) ( not ( = ?auto_17456 ?auto_17449 ) ) ( not ( = ?auto_17455 ?auto_17449 ) ) ( AVAILABLE ?auto_17460 ) ( SURFACE-AT ?auto_17450 ?auto_17461 ) ( ON ?auto_17450 ?auto_17458 ) ( CLEAR ?auto_17450 ) ( not ( = ?auto_17451 ?auto_17458 ) ) ( not ( = ?auto_17452 ?auto_17458 ) ) ( not ( = ?auto_17450 ?auto_17458 ) ) ( not ( = ?auto_17456 ?auto_17458 ) ) ( not ( = ?auto_17455 ?auto_17458 ) ) ( not ( = ?auto_17449 ?auto_17458 ) ) ( TRUCK-AT ?auto_17453 ?auto_17454 ) ( SURFACE-AT ?auto_17448 ?auto_17454 ) ( CLEAR ?auto_17448 ) ( IS-CRATE ?auto_17449 ) ( not ( = ?auto_17448 ?auto_17449 ) ) ( not ( = ?auto_17451 ?auto_17448 ) ) ( not ( = ?auto_17452 ?auto_17448 ) ) ( not ( = ?auto_17450 ?auto_17448 ) ) ( not ( = ?auto_17456 ?auto_17448 ) ) ( not ( = ?auto_17455 ?auto_17448 ) ) ( not ( = ?auto_17458 ?auto_17448 ) ) ( AVAILABLE ?auto_17459 ) ( IN ?auto_17449 ?auto_17453 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17450 ?auto_17451 ?auto_17452 )
      ( MAKE-4CRATE-VERIFY ?auto_17448 ?auto_17449 ?auto_17450 ?auto_17451 ?auto_17452 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17463 - SURFACE
      ?auto_17464 - SURFACE
    )
    :vars
    (
      ?auto_17472 - HOIST
      ?auto_17466 - PLACE
      ?auto_17477 - SURFACE
      ?auto_17474 - PLACE
      ?auto_17473 - HOIST
      ?auto_17468 - SURFACE
      ?auto_17475 - PLACE
      ?auto_17469 - HOIST
      ?auto_17467 - SURFACE
      ?auto_17471 - SURFACE
      ?auto_17470 - SURFACE
      ?auto_17476 - SURFACE
      ?auto_17465 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17472 ?auto_17466 ) ( IS-CRATE ?auto_17464 ) ( not ( = ?auto_17463 ?auto_17464 ) ) ( not ( = ?auto_17477 ?auto_17463 ) ) ( not ( = ?auto_17477 ?auto_17464 ) ) ( not ( = ?auto_17474 ?auto_17466 ) ) ( HOIST-AT ?auto_17473 ?auto_17474 ) ( not ( = ?auto_17472 ?auto_17473 ) ) ( SURFACE-AT ?auto_17464 ?auto_17474 ) ( ON ?auto_17464 ?auto_17468 ) ( CLEAR ?auto_17464 ) ( not ( = ?auto_17463 ?auto_17468 ) ) ( not ( = ?auto_17464 ?auto_17468 ) ) ( not ( = ?auto_17477 ?auto_17468 ) ) ( IS-CRATE ?auto_17463 ) ( not ( = ?auto_17475 ?auto_17466 ) ) ( not ( = ?auto_17474 ?auto_17475 ) ) ( HOIST-AT ?auto_17469 ?auto_17475 ) ( not ( = ?auto_17472 ?auto_17469 ) ) ( not ( = ?auto_17473 ?auto_17469 ) ) ( AVAILABLE ?auto_17469 ) ( SURFACE-AT ?auto_17463 ?auto_17475 ) ( ON ?auto_17463 ?auto_17467 ) ( CLEAR ?auto_17463 ) ( not ( = ?auto_17463 ?auto_17467 ) ) ( not ( = ?auto_17464 ?auto_17467 ) ) ( not ( = ?auto_17477 ?auto_17467 ) ) ( not ( = ?auto_17468 ?auto_17467 ) ) ( IS-CRATE ?auto_17477 ) ( not ( = ?auto_17471 ?auto_17477 ) ) ( not ( = ?auto_17463 ?auto_17471 ) ) ( not ( = ?auto_17464 ?auto_17471 ) ) ( not ( = ?auto_17468 ?auto_17471 ) ) ( not ( = ?auto_17467 ?auto_17471 ) ) ( AVAILABLE ?auto_17473 ) ( SURFACE-AT ?auto_17477 ?auto_17474 ) ( ON ?auto_17477 ?auto_17470 ) ( CLEAR ?auto_17477 ) ( not ( = ?auto_17463 ?auto_17470 ) ) ( not ( = ?auto_17464 ?auto_17470 ) ) ( not ( = ?auto_17477 ?auto_17470 ) ) ( not ( = ?auto_17468 ?auto_17470 ) ) ( not ( = ?auto_17467 ?auto_17470 ) ) ( not ( = ?auto_17471 ?auto_17470 ) ) ( SURFACE-AT ?auto_17476 ?auto_17466 ) ( CLEAR ?auto_17476 ) ( IS-CRATE ?auto_17471 ) ( not ( = ?auto_17476 ?auto_17471 ) ) ( not ( = ?auto_17463 ?auto_17476 ) ) ( not ( = ?auto_17464 ?auto_17476 ) ) ( not ( = ?auto_17477 ?auto_17476 ) ) ( not ( = ?auto_17468 ?auto_17476 ) ) ( not ( = ?auto_17467 ?auto_17476 ) ) ( not ( = ?auto_17470 ?auto_17476 ) ) ( AVAILABLE ?auto_17472 ) ( IN ?auto_17471 ?auto_17465 ) ( TRUCK-AT ?auto_17465 ?auto_17474 ) )
    :subtasks
    ( ( !DRIVE ?auto_17465 ?auto_17474 ?auto_17466 )
      ( MAKE-2CRATE ?auto_17477 ?auto_17463 ?auto_17464 )
      ( MAKE-1CRATE-VERIFY ?auto_17463 ?auto_17464 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17478 - SURFACE
      ?auto_17479 - SURFACE
      ?auto_17480 - SURFACE
    )
    :vars
    (
      ?auto_17490 - HOIST
      ?auto_17492 - PLACE
      ?auto_17489 - PLACE
      ?auto_17488 - HOIST
      ?auto_17483 - SURFACE
      ?auto_17484 - PLACE
      ?auto_17491 - HOIST
      ?auto_17487 - SURFACE
      ?auto_17485 - SURFACE
      ?auto_17486 - SURFACE
      ?auto_17482 - SURFACE
      ?auto_17481 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17490 ?auto_17492 ) ( IS-CRATE ?auto_17480 ) ( not ( = ?auto_17479 ?auto_17480 ) ) ( not ( = ?auto_17478 ?auto_17479 ) ) ( not ( = ?auto_17478 ?auto_17480 ) ) ( not ( = ?auto_17489 ?auto_17492 ) ) ( HOIST-AT ?auto_17488 ?auto_17489 ) ( not ( = ?auto_17490 ?auto_17488 ) ) ( SURFACE-AT ?auto_17480 ?auto_17489 ) ( ON ?auto_17480 ?auto_17483 ) ( CLEAR ?auto_17480 ) ( not ( = ?auto_17479 ?auto_17483 ) ) ( not ( = ?auto_17480 ?auto_17483 ) ) ( not ( = ?auto_17478 ?auto_17483 ) ) ( IS-CRATE ?auto_17479 ) ( not ( = ?auto_17484 ?auto_17492 ) ) ( not ( = ?auto_17489 ?auto_17484 ) ) ( HOIST-AT ?auto_17491 ?auto_17484 ) ( not ( = ?auto_17490 ?auto_17491 ) ) ( not ( = ?auto_17488 ?auto_17491 ) ) ( AVAILABLE ?auto_17491 ) ( SURFACE-AT ?auto_17479 ?auto_17484 ) ( ON ?auto_17479 ?auto_17487 ) ( CLEAR ?auto_17479 ) ( not ( = ?auto_17479 ?auto_17487 ) ) ( not ( = ?auto_17480 ?auto_17487 ) ) ( not ( = ?auto_17478 ?auto_17487 ) ) ( not ( = ?auto_17483 ?auto_17487 ) ) ( IS-CRATE ?auto_17478 ) ( not ( = ?auto_17485 ?auto_17478 ) ) ( not ( = ?auto_17479 ?auto_17485 ) ) ( not ( = ?auto_17480 ?auto_17485 ) ) ( not ( = ?auto_17483 ?auto_17485 ) ) ( not ( = ?auto_17487 ?auto_17485 ) ) ( AVAILABLE ?auto_17488 ) ( SURFACE-AT ?auto_17478 ?auto_17489 ) ( ON ?auto_17478 ?auto_17486 ) ( CLEAR ?auto_17478 ) ( not ( = ?auto_17479 ?auto_17486 ) ) ( not ( = ?auto_17480 ?auto_17486 ) ) ( not ( = ?auto_17478 ?auto_17486 ) ) ( not ( = ?auto_17483 ?auto_17486 ) ) ( not ( = ?auto_17487 ?auto_17486 ) ) ( not ( = ?auto_17485 ?auto_17486 ) ) ( SURFACE-AT ?auto_17482 ?auto_17492 ) ( CLEAR ?auto_17482 ) ( IS-CRATE ?auto_17485 ) ( not ( = ?auto_17482 ?auto_17485 ) ) ( not ( = ?auto_17479 ?auto_17482 ) ) ( not ( = ?auto_17480 ?auto_17482 ) ) ( not ( = ?auto_17478 ?auto_17482 ) ) ( not ( = ?auto_17483 ?auto_17482 ) ) ( not ( = ?auto_17487 ?auto_17482 ) ) ( not ( = ?auto_17486 ?auto_17482 ) ) ( AVAILABLE ?auto_17490 ) ( IN ?auto_17485 ?auto_17481 ) ( TRUCK-AT ?auto_17481 ?auto_17489 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17479 ?auto_17480 )
      ( MAKE-2CRATE-VERIFY ?auto_17478 ?auto_17479 ?auto_17480 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17493 - SURFACE
      ?auto_17494 - SURFACE
      ?auto_17495 - SURFACE
      ?auto_17496 - SURFACE
    )
    :vars
    (
      ?auto_17506 - HOIST
      ?auto_17499 - PLACE
      ?auto_17502 - PLACE
      ?auto_17503 - HOIST
      ?auto_17498 - SURFACE
      ?auto_17497 - PLACE
      ?auto_17507 - HOIST
      ?auto_17500 - SURFACE
      ?auto_17501 - SURFACE
      ?auto_17504 - SURFACE
      ?auto_17505 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17506 ?auto_17499 ) ( IS-CRATE ?auto_17496 ) ( not ( = ?auto_17495 ?auto_17496 ) ) ( not ( = ?auto_17494 ?auto_17495 ) ) ( not ( = ?auto_17494 ?auto_17496 ) ) ( not ( = ?auto_17502 ?auto_17499 ) ) ( HOIST-AT ?auto_17503 ?auto_17502 ) ( not ( = ?auto_17506 ?auto_17503 ) ) ( SURFACE-AT ?auto_17496 ?auto_17502 ) ( ON ?auto_17496 ?auto_17498 ) ( CLEAR ?auto_17496 ) ( not ( = ?auto_17495 ?auto_17498 ) ) ( not ( = ?auto_17496 ?auto_17498 ) ) ( not ( = ?auto_17494 ?auto_17498 ) ) ( IS-CRATE ?auto_17495 ) ( not ( = ?auto_17497 ?auto_17499 ) ) ( not ( = ?auto_17502 ?auto_17497 ) ) ( HOIST-AT ?auto_17507 ?auto_17497 ) ( not ( = ?auto_17506 ?auto_17507 ) ) ( not ( = ?auto_17503 ?auto_17507 ) ) ( AVAILABLE ?auto_17507 ) ( SURFACE-AT ?auto_17495 ?auto_17497 ) ( ON ?auto_17495 ?auto_17500 ) ( CLEAR ?auto_17495 ) ( not ( = ?auto_17495 ?auto_17500 ) ) ( not ( = ?auto_17496 ?auto_17500 ) ) ( not ( = ?auto_17494 ?auto_17500 ) ) ( not ( = ?auto_17498 ?auto_17500 ) ) ( IS-CRATE ?auto_17494 ) ( not ( = ?auto_17493 ?auto_17494 ) ) ( not ( = ?auto_17495 ?auto_17493 ) ) ( not ( = ?auto_17496 ?auto_17493 ) ) ( not ( = ?auto_17498 ?auto_17493 ) ) ( not ( = ?auto_17500 ?auto_17493 ) ) ( AVAILABLE ?auto_17503 ) ( SURFACE-AT ?auto_17494 ?auto_17502 ) ( ON ?auto_17494 ?auto_17501 ) ( CLEAR ?auto_17494 ) ( not ( = ?auto_17495 ?auto_17501 ) ) ( not ( = ?auto_17496 ?auto_17501 ) ) ( not ( = ?auto_17494 ?auto_17501 ) ) ( not ( = ?auto_17498 ?auto_17501 ) ) ( not ( = ?auto_17500 ?auto_17501 ) ) ( not ( = ?auto_17493 ?auto_17501 ) ) ( SURFACE-AT ?auto_17504 ?auto_17499 ) ( CLEAR ?auto_17504 ) ( IS-CRATE ?auto_17493 ) ( not ( = ?auto_17504 ?auto_17493 ) ) ( not ( = ?auto_17495 ?auto_17504 ) ) ( not ( = ?auto_17496 ?auto_17504 ) ) ( not ( = ?auto_17494 ?auto_17504 ) ) ( not ( = ?auto_17498 ?auto_17504 ) ) ( not ( = ?auto_17500 ?auto_17504 ) ) ( not ( = ?auto_17501 ?auto_17504 ) ) ( AVAILABLE ?auto_17506 ) ( IN ?auto_17493 ?auto_17505 ) ( TRUCK-AT ?auto_17505 ?auto_17502 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17494 ?auto_17495 ?auto_17496 )
      ( MAKE-3CRATE-VERIFY ?auto_17493 ?auto_17494 ?auto_17495 ?auto_17496 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17508 - SURFACE
      ?auto_17509 - SURFACE
      ?auto_17510 - SURFACE
      ?auto_17511 - SURFACE
      ?auto_17512 - SURFACE
    )
    :vars
    (
      ?auto_17521 - HOIST
      ?auto_17515 - PLACE
      ?auto_17518 - PLACE
      ?auto_17519 - HOIST
      ?auto_17514 - SURFACE
      ?auto_17513 - PLACE
      ?auto_17522 - HOIST
      ?auto_17516 - SURFACE
      ?auto_17517 - SURFACE
      ?auto_17520 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17521 ?auto_17515 ) ( IS-CRATE ?auto_17512 ) ( not ( = ?auto_17511 ?auto_17512 ) ) ( not ( = ?auto_17510 ?auto_17511 ) ) ( not ( = ?auto_17510 ?auto_17512 ) ) ( not ( = ?auto_17518 ?auto_17515 ) ) ( HOIST-AT ?auto_17519 ?auto_17518 ) ( not ( = ?auto_17521 ?auto_17519 ) ) ( SURFACE-AT ?auto_17512 ?auto_17518 ) ( ON ?auto_17512 ?auto_17514 ) ( CLEAR ?auto_17512 ) ( not ( = ?auto_17511 ?auto_17514 ) ) ( not ( = ?auto_17512 ?auto_17514 ) ) ( not ( = ?auto_17510 ?auto_17514 ) ) ( IS-CRATE ?auto_17511 ) ( not ( = ?auto_17513 ?auto_17515 ) ) ( not ( = ?auto_17518 ?auto_17513 ) ) ( HOIST-AT ?auto_17522 ?auto_17513 ) ( not ( = ?auto_17521 ?auto_17522 ) ) ( not ( = ?auto_17519 ?auto_17522 ) ) ( AVAILABLE ?auto_17522 ) ( SURFACE-AT ?auto_17511 ?auto_17513 ) ( ON ?auto_17511 ?auto_17516 ) ( CLEAR ?auto_17511 ) ( not ( = ?auto_17511 ?auto_17516 ) ) ( not ( = ?auto_17512 ?auto_17516 ) ) ( not ( = ?auto_17510 ?auto_17516 ) ) ( not ( = ?auto_17514 ?auto_17516 ) ) ( IS-CRATE ?auto_17510 ) ( not ( = ?auto_17509 ?auto_17510 ) ) ( not ( = ?auto_17511 ?auto_17509 ) ) ( not ( = ?auto_17512 ?auto_17509 ) ) ( not ( = ?auto_17514 ?auto_17509 ) ) ( not ( = ?auto_17516 ?auto_17509 ) ) ( AVAILABLE ?auto_17519 ) ( SURFACE-AT ?auto_17510 ?auto_17518 ) ( ON ?auto_17510 ?auto_17517 ) ( CLEAR ?auto_17510 ) ( not ( = ?auto_17511 ?auto_17517 ) ) ( not ( = ?auto_17512 ?auto_17517 ) ) ( not ( = ?auto_17510 ?auto_17517 ) ) ( not ( = ?auto_17514 ?auto_17517 ) ) ( not ( = ?auto_17516 ?auto_17517 ) ) ( not ( = ?auto_17509 ?auto_17517 ) ) ( SURFACE-AT ?auto_17508 ?auto_17515 ) ( CLEAR ?auto_17508 ) ( IS-CRATE ?auto_17509 ) ( not ( = ?auto_17508 ?auto_17509 ) ) ( not ( = ?auto_17511 ?auto_17508 ) ) ( not ( = ?auto_17512 ?auto_17508 ) ) ( not ( = ?auto_17510 ?auto_17508 ) ) ( not ( = ?auto_17514 ?auto_17508 ) ) ( not ( = ?auto_17516 ?auto_17508 ) ) ( not ( = ?auto_17517 ?auto_17508 ) ) ( AVAILABLE ?auto_17521 ) ( IN ?auto_17509 ?auto_17520 ) ( TRUCK-AT ?auto_17520 ?auto_17518 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17510 ?auto_17511 ?auto_17512 )
      ( MAKE-4CRATE-VERIFY ?auto_17508 ?auto_17509 ?auto_17510 ?auto_17511 ?auto_17512 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17523 - SURFACE
      ?auto_17524 - SURFACE
    )
    :vars
    (
      ?auto_17536 - HOIST
      ?auto_17528 - PLACE
      ?auto_17533 - SURFACE
      ?auto_17531 - PLACE
      ?auto_17532 - HOIST
      ?auto_17527 - SURFACE
      ?auto_17526 - PLACE
      ?auto_17537 - HOIST
      ?auto_17529 - SURFACE
      ?auto_17525 - SURFACE
      ?auto_17530 - SURFACE
      ?auto_17534 - SURFACE
      ?auto_17535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17536 ?auto_17528 ) ( IS-CRATE ?auto_17524 ) ( not ( = ?auto_17523 ?auto_17524 ) ) ( not ( = ?auto_17533 ?auto_17523 ) ) ( not ( = ?auto_17533 ?auto_17524 ) ) ( not ( = ?auto_17531 ?auto_17528 ) ) ( HOIST-AT ?auto_17532 ?auto_17531 ) ( not ( = ?auto_17536 ?auto_17532 ) ) ( SURFACE-AT ?auto_17524 ?auto_17531 ) ( ON ?auto_17524 ?auto_17527 ) ( CLEAR ?auto_17524 ) ( not ( = ?auto_17523 ?auto_17527 ) ) ( not ( = ?auto_17524 ?auto_17527 ) ) ( not ( = ?auto_17533 ?auto_17527 ) ) ( IS-CRATE ?auto_17523 ) ( not ( = ?auto_17526 ?auto_17528 ) ) ( not ( = ?auto_17531 ?auto_17526 ) ) ( HOIST-AT ?auto_17537 ?auto_17526 ) ( not ( = ?auto_17536 ?auto_17537 ) ) ( not ( = ?auto_17532 ?auto_17537 ) ) ( AVAILABLE ?auto_17537 ) ( SURFACE-AT ?auto_17523 ?auto_17526 ) ( ON ?auto_17523 ?auto_17529 ) ( CLEAR ?auto_17523 ) ( not ( = ?auto_17523 ?auto_17529 ) ) ( not ( = ?auto_17524 ?auto_17529 ) ) ( not ( = ?auto_17533 ?auto_17529 ) ) ( not ( = ?auto_17527 ?auto_17529 ) ) ( IS-CRATE ?auto_17533 ) ( not ( = ?auto_17525 ?auto_17533 ) ) ( not ( = ?auto_17523 ?auto_17525 ) ) ( not ( = ?auto_17524 ?auto_17525 ) ) ( not ( = ?auto_17527 ?auto_17525 ) ) ( not ( = ?auto_17529 ?auto_17525 ) ) ( SURFACE-AT ?auto_17533 ?auto_17531 ) ( ON ?auto_17533 ?auto_17530 ) ( CLEAR ?auto_17533 ) ( not ( = ?auto_17523 ?auto_17530 ) ) ( not ( = ?auto_17524 ?auto_17530 ) ) ( not ( = ?auto_17533 ?auto_17530 ) ) ( not ( = ?auto_17527 ?auto_17530 ) ) ( not ( = ?auto_17529 ?auto_17530 ) ) ( not ( = ?auto_17525 ?auto_17530 ) ) ( SURFACE-AT ?auto_17534 ?auto_17528 ) ( CLEAR ?auto_17534 ) ( IS-CRATE ?auto_17525 ) ( not ( = ?auto_17534 ?auto_17525 ) ) ( not ( = ?auto_17523 ?auto_17534 ) ) ( not ( = ?auto_17524 ?auto_17534 ) ) ( not ( = ?auto_17533 ?auto_17534 ) ) ( not ( = ?auto_17527 ?auto_17534 ) ) ( not ( = ?auto_17529 ?auto_17534 ) ) ( not ( = ?auto_17530 ?auto_17534 ) ) ( AVAILABLE ?auto_17536 ) ( TRUCK-AT ?auto_17535 ?auto_17531 ) ( LIFTING ?auto_17532 ?auto_17525 ) )
    :subtasks
    ( ( !LOAD ?auto_17532 ?auto_17525 ?auto_17535 ?auto_17531 )
      ( MAKE-2CRATE ?auto_17533 ?auto_17523 ?auto_17524 )
      ( MAKE-1CRATE-VERIFY ?auto_17523 ?auto_17524 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17538 - SURFACE
      ?auto_17539 - SURFACE
      ?auto_17540 - SURFACE
    )
    :vars
    (
      ?auto_17549 - HOIST
      ?auto_17546 - PLACE
      ?auto_17547 - PLACE
      ?auto_17541 - HOIST
      ?auto_17550 - SURFACE
      ?auto_17552 - PLACE
      ?auto_17548 - HOIST
      ?auto_17551 - SURFACE
      ?auto_17544 - SURFACE
      ?auto_17545 - SURFACE
      ?auto_17543 - SURFACE
      ?auto_17542 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17549 ?auto_17546 ) ( IS-CRATE ?auto_17540 ) ( not ( = ?auto_17539 ?auto_17540 ) ) ( not ( = ?auto_17538 ?auto_17539 ) ) ( not ( = ?auto_17538 ?auto_17540 ) ) ( not ( = ?auto_17547 ?auto_17546 ) ) ( HOIST-AT ?auto_17541 ?auto_17547 ) ( not ( = ?auto_17549 ?auto_17541 ) ) ( SURFACE-AT ?auto_17540 ?auto_17547 ) ( ON ?auto_17540 ?auto_17550 ) ( CLEAR ?auto_17540 ) ( not ( = ?auto_17539 ?auto_17550 ) ) ( not ( = ?auto_17540 ?auto_17550 ) ) ( not ( = ?auto_17538 ?auto_17550 ) ) ( IS-CRATE ?auto_17539 ) ( not ( = ?auto_17552 ?auto_17546 ) ) ( not ( = ?auto_17547 ?auto_17552 ) ) ( HOIST-AT ?auto_17548 ?auto_17552 ) ( not ( = ?auto_17549 ?auto_17548 ) ) ( not ( = ?auto_17541 ?auto_17548 ) ) ( AVAILABLE ?auto_17548 ) ( SURFACE-AT ?auto_17539 ?auto_17552 ) ( ON ?auto_17539 ?auto_17551 ) ( CLEAR ?auto_17539 ) ( not ( = ?auto_17539 ?auto_17551 ) ) ( not ( = ?auto_17540 ?auto_17551 ) ) ( not ( = ?auto_17538 ?auto_17551 ) ) ( not ( = ?auto_17550 ?auto_17551 ) ) ( IS-CRATE ?auto_17538 ) ( not ( = ?auto_17544 ?auto_17538 ) ) ( not ( = ?auto_17539 ?auto_17544 ) ) ( not ( = ?auto_17540 ?auto_17544 ) ) ( not ( = ?auto_17550 ?auto_17544 ) ) ( not ( = ?auto_17551 ?auto_17544 ) ) ( SURFACE-AT ?auto_17538 ?auto_17547 ) ( ON ?auto_17538 ?auto_17545 ) ( CLEAR ?auto_17538 ) ( not ( = ?auto_17539 ?auto_17545 ) ) ( not ( = ?auto_17540 ?auto_17545 ) ) ( not ( = ?auto_17538 ?auto_17545 ) ) ( not ( = ?auto_17550 ?auto_17545 ) ) ( not ( = ?auto_17551 ?auto_17545 ) ) ( not ( = ?auto_17544 ?auto_17545 ) ) ( SURFACE-AT ?auto_17543 ?auto_17546 ) ( CLEAR ?auto_17543 ) ( IS-CRATE ?auto_17544 ) ( not ( = ?auto_17543 ?auto_17544 ) ) ( not ( = ?auto_17539 ?auto_17543 ) ) ( not ( = ?auto_17540 ?auto_17543 ) ) ( not ( = ?auto_17538 ?auto_17543 ) ) ( not ( = ?auto_17550 ?auto_17543 ) ) ( not ( = ?auto_17551 ?auto_17543 ) ) ( not ( = ?auto_17545 ?auto_17543 ) ) ( AVAILABLE ?auto_17549 ) ( TRUCK-AT ?auto_17542 ?auto_17547 ) ( LIFTING ?auto_17541 ?auto_17544 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17539 ?auto_17540 )
      ( MAKE-2CRATE-VERIFY ?auto_17538 ?auto_17539 ?auto_17540 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17553 - SURFACE
      ?auto_17554 - SURFACE
      ?auto_17555 - SURFACE
      ?auto_17556 - SURFACE
    )
    :vars
    (
      ?auto_17565 - HOIST
      ?auto_17561 - PLACE
      ?auto_17560 - PLACE
      ?auto_17559 - HOIST
      ?auto_17566 - SURFACE
      ?auto_17557 - PLACE
      ?auto_17567 - HOIST
      ?auto_17562 - SURFACE
      ?auto_17564 - SURFACE
      ?auto_17558 - SURFACE
      ?auto_17563 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17565 ?auto_17561 ) ( IS-CRATE ?auto_17556 ) ( not ( = ?auto_17555 ?auto_17556 ) ) ( not ( = ?auto_17554 ?auto_17555 ) ) ( not ( = ?auto_17554 ?auto_17556 ) ) ( not ( = ?auto_17560 ?auto_17561 ) ) ( HOIST-AT ?auto_17559 ?auto_17560 ) ( not ( = ?auto_17565 ?auto_17559 ) ) ( SURFACE-AT ?auto_17556 ?auto_17560 ) ( ON ?auto_17556 ?auto_17566 ) ( CLEAR ?auto_17556 ) ( not ( = ?auto_17555 ?auto_17566 ) ) ( not ( = ?auto_17556 ?auto_17566 ) ) ( not ( = ?auto_17554 ?auto_17566 ) ) ( IS-CRATE ?auto_17555 ) ( not ( = ?auto_17557 ?auto_17561 ) ) ( not ( = ?auto_17560 ?auto_17557 ) ) ( HOIST-AT ?auto_17567 ?auto_17557 ) ( not ( = ?auto_17565 ?auto_17567 ) ) ( not ( = ?auto_17559 ?auto_17567 ) ) ( AVAILABLE ?auto_17567 ) ( SURFACE-AT ?auto_17555 ?auto_17557 ) ( ON ?auto_17555 ?auto_17562 ) ( CLEAR ?auto_17555 ) ( not ( = ?auto_17555 ?auto_17562 ) ) ( not ( = ?auto_17556 ?auto_17562 ) ) ( not ( = ?auto_17554 ?auto_17562 ) ) ( not ( = ?auto_17566 ?auto_17562 ) ) ( IS-CRATE ?auto_17554 ) ( not ( = ?auto_17553 ?auto_17554 ) ) ( not ( = ?auto_17555 ?auto_17553 ) ) ( not ( = ?auto_17556 ?auto_17553 ) ) ( not ( = ?auto_17566 ?auto_17553 ) ) ( not ( = ?auto_17562 ?auto_17553 ) ) ( SURFACE-AT ?auto_17554 ?auto_17560 ) ( ON ?auto_17554 ?auto_17564 ) ( CLEAR ?auto_17554 ) ( not ( = ?auto_17555 ?auto_17564 ) ) ( not ( = ?auto_17556 ?auto_17564 ) ) ( not ( = ?auto_17554 ?auto_17564 ) ) ( not ( = ?auto_17566 ?auto_17564 ) ) ( not ( = ?auto_17562 ?auto_17564 ) ) ( not ( = ?auto_17553 ?auto_17564 ) ) ( SURFACE-AT ?auto_17558 ?auto_17561 ) ( CLEAR ?auto_17558 ) ( IS-CRATE ?auto_17553 ) ( not ( = ?auto_17558 ?auto_17553 ) ) ( not ( = ?auto_17555 ?auto_17558 ) ) ( not ( = ?auto_17556 ?auto_17558 ) ) ( not ( = ?auto_17554 ?auto_17558 ) ) ( not ( = ?auto_17566 ?auto_17558 ) ) ( not ( = ?auto_17562 ?auto_17558 ) ) ( not ( = ?auto_17564 ?auto_17558 ) ) ( AVAILABLE ?auto_17565 ) ( TRUCK-AT ?auto_17563 ?auto_17560 ) ( LIFTING ?auto_17559 ?auto_17553 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17554 ?auto_17555 ?auto_17556 )
      ( MAKE-3CRATE-VERIFY ?auto_17553 ?auto_17554 ?auto_17555 ?auto_17556 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17568 - SURFACE
      ?auto_17569 - SURFACE
      ?auto_17570 - SURFACE
      ?auto_17571 - SURFACE
      ?auto_17572 - SURFACE
    )
    :vars
    (
      ?auto_17580 - HOIST
      ?auto_17576 - PLACE
      ?auto_17575 - PLACE
      ?auto_17574 - HOIST
      ?auto_17581 - SURFACE
      ?auto_17573 - PLACE
      ?auto_17582 - HOIST
      ?auto_17577 - SURFACE
      ?auto_17579 - SURFACE
      ?auto_17578 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17580 ?auto_17576 ) ( IS-CRATE ?auto_17572 ) ( not ( = ?auto_17571 ?auto_17572 ) ) ( not ( = ?auto_17570 ?auto_17571 ) ) ( not ( = ?auto_17570 ?auto_17572 ) ) ( not ( = ?auto_17575 ?auto_17576 ) ) ( HOIST-AT ?auto_17574 ?auto_17575 ) ( not ( = ?auto_17580 ?auto_17574 ) ) ( SURFACE-AT ?auto_17572 ?auto_17575 ) ( ON ?auto_17572 ?auto_17581 ) ( CLEAR ?auto_17572 ) ( not ( = ?auto_17571 ?auto_17581 ) ) ( not ( = ?auto_17572 ?auto_17581 ) ) ( not ( = ?auto_17570 ?auto_17581 ) ) ( IS-CRATE ?auto_17571 ) ( not ( = ?auto_17573 ?auto_17576 ) ) ( not ( = ?auto_17575 ?auto_17573 ) ) ( HOIST-AT ?auto_17582 ?auto_17573 ) ( not ( = ?auto_17580 ?auto_17582 ) ) ( not ( = ?auto_17574 ?auto_17582 ) ) ( AVAILABLE ?auto_17582 ) ( SURFACE-AT ?auto_17571 ?auto_17573 ) ( ON ?auto_17571 ?auto_17577 ) ( CLEAR ?auto_17571 ) ( not ( = ?auto_17571 ?auto_17577 ) ) ( not ( = ?auto_17572 ?auto_17577 ) ) ( not ( = ?auto_17570 ?auto_17577 ) ) ( not ( = ?auto_17581 ?auto_17577 ) ) ( IS-CRATE ?auto_17570 ) ( not ( = ?auto_17569 ?auto_17570 ) ) ( not ( = ?auto_17571 ?auto_17569 ) ) ( not ( = ?auto_17572 ?auto_17569 ) ) ( not ( = ?auto_17581 ?auto_17569 ) ) ( not ( = ?auto_17577 ?auto_17569 ) ) ( SURFACE-AT ?auto_17570 ?auto_17575 ) ( ON ?auto_17570 ?auto_17579 ) ( CLEAR ?auto_17570 ) ( not ( = ?auto_17571 ?auto_17579 ) ) ( not ( = ?auto_17572 ?auto_17579 ) ) ( not ( = ?auto_17570 ?auto_17579 ) ) ( not ( = ?auto_17581 ?auto_17579 ) ) ( not ( = ?auto_17577 ?auto_17579 ) ) ( not ( = ?auto_17569 ?auto_17579 ) ) ( SURFACE-AT ?auto_17568 ?auto_17576 ) ( CLEAR ?auto_17568 ) ( IS-CRATE ?auto_17569 ) ( not ( = ?auto_17568 ?auto_17569 ) ) ( not ( = ?auto_17571 ?auto_17568 ) ) ( not ( = ?auto_17572 ?auto_17568 ) ) ( not ( = ?auto_17570 ?auto_17568 ) ) ( not ( = ?auto_17581 ?auto_17568 ) ) ( not ( = ?auto_17577 ?auto_17568 ) ) ( not ( = ?auto_17579 ?auto_17568 ) ) ( AVAILABLE ?auto_17580 ) ( TRUCK-AT ?auto_17578 ?auto_17575 ) ( LIFTING ?auto_17574 ?auto_17569 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17570 ?auto_17571 ?auto_17572 )
      ( MAKE-4CRATE-VERIFY ?auto_17568 ?auto_17569 ?auto_17570 ?auto_17571 ?auto_17572 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17583 - SURFACE
      ?auto_17584 - SURFACE
    )
    :vars
    (
      ?auto_17594 - HOIST
      ?auto_17589 - PLACE
      ?auto_17597 - SURFACE
      ?auto_17588 - PLACE
      ?auto_17587 - HOIST
      ?auto_17595 - SURFACE
      ?auto_17585 - PLACE
      ?auto_17596 - HOIST
      ?auto_17591 - SURFACE
      ?auto_17590 - SURFACE
      ?auto_17593 - SURFACE
      ?auto_17586 - SURFACE
      ?auto_17592 - TRUCK
      ?auto_17598 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17594 ?auto_17589 ) ( IS-CRATE ?auto_17584 ) ( not ( = ?auto_17583 ?auto_17584 ) ) ( not ( = ?auto_17597 ?auto_17583 ) ) ( not ( = ?auto_17597 ?auto_17584 ) ) ( not ( = ?auto_17588 ?auto_17589 ) ) ( HOIST-AT ?auto_17587 ?auto_17588 ) ( not ( = ?auto_17594 ?auto_17587 ) ) ( SURFACE-AT ?auto_17584 ?auto_17588 ) ( ON ?auto_17584 ?auto_17595 ) ( CLEAR ?auto_17584 ) ( not ( = ?auto_17583 ?auto_17595 ) ) ( not ( = ?auto_17584 ?auto_17595 ) ) ( not ( = ?auto_17597 ?auto_17595 ) ) ( IS-CRATE ?auto_17583 ) ( not ( = ?auto_17585 ?auto_17589 ) ) ( not ( = ?auto_17588 ?auto_17585 ) ) ( HOIST-AT ?auto_17596 ?auto_17585 ) ( not ( = ?auto_17594 ?auto_17596 ) ) ( not ( = ?auto_17587 ?auto_17596 ) ) ( AVAILABLE ?auto_17596 ) ( SURFACE-AT ?auto_17583 ?auto_17585 ) ( ON ?auto_17583 ?auto_17591 ) ( CLEAR ?auto_17583 ) ( not ( = ?auto_17583 ?auto_17591 ) ) ( not ( = ?auto_17584 ?auto_17591 ) ) ( not ( = ?auto_17597 ?auto_17591 ) ) ( not ( = ?auto_17595 ?auto_17591 ) ) ( IS-CRATE ?auto_17597 ) ( not ( = ?auto_17590 ?auto_17597 ) ) ( not ( = ?auto_17583 ?auto_17590 ) ) ( not ( = ?auto_17584 ?auto_17590 ) ) ( not ( = ?auto_17595 ?auto_17590 ) ) ( not ( = ?auto_17591 ?auto_17590 ) ) ( SURFACE-AT ?auto_17597 ?auto_17588 ) ( ON ?auto_17597 ?auto_17593 ) ( CLEAR ?auto_17597 ) ( not ( = ?auto_17583 ?auto_17593 ) ) ( not ( = ?auto_17584 ?auto_17593 ) ) ( not ( = ?auto_17597 ?auto_17593 ) ) ( not ( = ?auto_17595 ?auto_17593 ) ) ( not ( = ?auto_17591 ?auto_17593 ) ) ( not ( = ?auto_17590 ?auto_17593 ) ) ( SURFACE-AT ?auto_17586 ?auto_17589 ) ( CLEAR ?auto_17586 ) ( IS-CRATE ?auto_17590 ) ( not ( = ?auto_17586 ?auto_17590 ) ) ( not ( = ?auto_17583 ?auto_17586 ) ) ( not ( = ?auto_17584 ?auto_17586 ) ) ( not ( = ?auto_17597 ?auto_17586 ) ) ( not ( = ?auto_17595 ?auto_17586 ) ) ( not ( = ?auto_17591 ?auto_17586 ) ) ( not ( = ?auto_17593 ?auto_17586 ) ) ( AVAILABLE ?auto_17594 ) ( TRUCK-AT ?auto_17592 ?auto_17588 ) ( AVAILABLE ?auto_17587 ) ( SURFACE-AT ?auto_17590 ?auto_17588 ) ( ON ?auto_17590 ?auto_17598 ) ( CLEAR ?auto_17590 ) ( not ( = ?auto_17583 ?auto_17598 ) ) ( not ( = ?auto_17584 ?auto_17598 ) ) ( not ( = ?auto_17597 ?auto_17598 ) ) ( not ( = ?auto_17595 ?auto_17598 ) ) ( not ( = ?auto_17591 ?auto_17598 ) ) ( not ( = ?auto_17590 ?auto_17598 ) ) ( not ( = ?auto_17593 ?auto_17598 ) ) ( not ( = ?auto_17586 ?auto_17598 ) ) )
    :subtasks
    ( ( !LIFT ?auto_17587 ?auto_17590 ?auto_17598 ?auto_17588 )
      ( MAKE-2CRATE ?auto_17597 ?auto_17583 ?auto_17584 )
      ( MAKE-1CRATE-VERIFY ?auto_17583 ?auto_17584 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17599 - SURFACE
      ?auto_17600 - SURFACE
      ?auto_17601 - SURFACE
    )
    :vars
    (
      ?auto_17609 - HOIST
      ?auto_17603 - PLACE
      ?auto_17602 - PLACE
      ?auto_17613 - HOIST
      ?auto_17610 - SURFACE
      ?auto_17614 - PLACE
      ?auto_17607 - HOIST
      ?auto_17611 - SURFACE
      ?auto_17604 - SURFACE
      ?auto_17606 - SURFACE
      ?auto_17605 - SURFACE
      ?auto_17608 - TRUCK
      ?auto_17612 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17609 ?auto_17603 ) ( IS-CRATE ?auto_17601 ) ( not ( = ?auto_17600 ?auto_17601 ) ) ( not ( = ?auto_17599 ?auto_17600 ) ) ( not ( = ?auto_17599 ?auto_17601 ) ) ( not ( = ?auto_17602 ?auto_17603 ) ) ( HOIST-AT ?auto_17613 ?auto_17602 ) ( not ( = ?auto_17609 ?auto_17613 ) ) ( SURFACE-AT ?auto_17601 ?auto_17602 ) ( ON ?auto_17601 ?auto_17610 ) ( CLEAR ?auto_17601 ) ( not ( = ?auto_17600 ?auto_17610 ) ) ( not ( = ?auto_17601 ?auto_17610 ) ) ( not ( = ?auto_17599 ?auto_17610 ) ) ( IS-CRATE ?auto_17600 ) ( not ( = ?auto_17614 ?auto_17603 ) ) ( not ( = ?auto_17602 ?auto_17614 ) ) ( HOIST-AT ?auto_17607 ?auto_17614 ) ( not ( = ?auto_17609 ?auto_17607 ) ) ( not ( = ?auto_17613 ?auto_17607 ) ) ( AVAILABLE ?auto_17607 ) ( SURFACE-AT ?auto_17600 ?auto_17614 ) ( ON ?auto_17600 ?auto_17611 ) ( CLEAR ?auto_17600 ) ( not ( = ?auto_17600 ?auto_17611 ) ) ( not ( = ?auto_17601 ?auto_17611 ) ) ( not ( = ?auto_17599 ?auto_17611 ) ) ( not ( = ?auto_17610 ?auto_17611 ) ) ( IS-CRATE ?auto_17599 ) ( not ( = ?auto_17604 ?auto_17599 ) ) ( not ( = ?auto_17600 ?auto_17604 ) ) ( not ( = ?auto_17601 ?auto_17604 ) ) ( not ( = ?auto_17610 ?auto_17604 ) ) ( not ( = ?auto_17611 ?auto_17604 ) ) ( SURFACE-AT ?auto_17599 ?auto_17602 ) ( ON ?auto_17599 ?auto_17606 ) ( CLEAR ?auto_17599 ) ( not ( = ?auto_17600 ?auto_17606 ) ) ( not ( = ?auto_17601 ?auto_17606 ) ) ( not ( = ?auto_17599 ?auto_17606 ) ) ( not ( = ?auto_17610 ?auto_17606 ) ) ( not ( = ?auto_17611 ?auto_17606 ) ) ( not ( = ?auto_17604 ?auto_17606 ) ) ( SURFACE-AT ?auto_17605 ?auto_17603 ) ( CLEAR ?auto_17605 ) ( IS-CRATE ?auto_17604 ) ( not ( = ?auto_17605 ?auto_17604 ) ) ( not ( = ?auto_17600 ?auto_17605 ) ) ( not ( = ?auto_17601 ?auto_17605 ) ) ( not ( = ?auto_17599 ?auto_17605 ) ) ( not ( = ?auto_17610 ?auto_17605 ) ) ( not ( = ?auto_17611 ?auto_17605 ) ) ( not ( = ?auto_17606 ?auto_17605 ) ) ( AVAILABLE ?auto_17609 ) ( TRUCK-AT ?auto_17608 ?auto_17602 ) ( AVAILABLE ?auto_17613 ) ( SURFACE-AT ?auto_17604 ?auto_17602 ) ( ON ?auto_17604 ?auto_17612 ) ( CLEAR ?auto_17604 ) ( not ( = ?auto_17600 ?auto_17612 ) ) ( not ( = ?auto_17601 ?auto_17612 ) ) ( not ( = ?auto_17599 ?auto_17612 ) ) ( not ( = ?auto_17610 ?auto_17612 ) ) ( not ( = ?auto_17611 ?auto_17612 ) ) ( not ( = ?auto_17604 ?auto_17612 ) ) ( not ( = ?auto_17606 ?auto_17612 ) ) ( not ( = ?auto_17605 ?auto_17612 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17600 ?auto_17601 )
      ( MAKE-2CRATE-VERIFY ?auto_17599 ?auto_17600 ?auto_17601 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17615 - SURFACE
      ?auto_17616 - SURFACE
      ?auto_17617 - SURFACE
      ?auto_17618 - SURFACE
    )
    :vars
    (
      ?auto_17629 - HOIST
      ?auto_17621 - PLACE
      ?auto_17622 - PLACE
      ?auto_17626 - HOIST
      ?auto_17625 - SURFACE
      ?auto_17619 - PLACE
      ?auto_17623 - HOIST
      ?auto_17628 - SURFACE
      ?auto_17624 - SURFACE
      ?auto_17627 - SURFACE
      ?auto_17630 - TRUCK
      ?auto_17620 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17629 ?auto_17621 ) ( IS-CRATE ?auto_17618 ) ( not ( = ?auto_17617 ?auto_17618 ) ) ( not ( = ?auto_17616 ?auto_17617 ) ) ( not ( = ?auto_17616 ?auto_17618 ) ) ( not ( = ?auto_17622 ?auto_17621 ) ) ( HOIST-AT ?auto_17626 ?auto_17622 ) ( not ( = ?auto_17629 ?auto_17626 ) ) ( SURFACE-AT ?auto_17618 ?auto_17622 ) ( ON ?auto_17618 ?auto_17625 ) ( CLEAR ?auto_17618 ) ( not ( = ?auto_17617 ?auto_17625 ) ) ( not ( = ?auto_17618 ?auto_17625 ) ) ( not ( = ?auto_17616 ?auto_17625 ) ) ( IS-CRATE ?auto_17617 ) ( not ( = ?auto_17619 ?auto_17621 ) ) ( not ( = ?auto_17622 ?auto_17619 ) ) ( HOIST-AT ?auto_17623 ?auto_17619 ) ( not ( = ?auto_17629 ?auto_17623 ) ) ( not ( = ?auto_17626 ?auto_17623 ) ) ( AVAILABLE ?auto_17623 ) ( SURFACE-AT ?auto_17617 ?auto_17619 ) ( ON ?auto_17617 ?auto_17628 ) ( CLEAR ?auto_17617 ) ( not ( = ?auto_17617 ?auto_17628 ) ) ( not ( = ?auto_17618 ?auto_17628 ) ) ( not ( = ?auto_17616 ?auto_17628 ) ) ( not ( = ?auto_17625 ?auto_17628 ) ) ( IS-CRATE ?auto_17616 ) ( not ( = ?auto_17615 ?auto_17616 ) ) ( not ( = ?auto_17617 ?auto_17615 ) ) ( not ( = ?auto_17618 ?auto_17615 ) ) ( not ( = ?auto_17625 ?auto_17615 ) ) ( not ( = ?auto_17628 ?auto_17615 ) ) ( SURFACE-AT ?auto_17616 ?auto_17622 ) ( ON ?auto_17616 ?auto_17624 ) ( CLEAR ?auto_17616 ) ( not ( = ?auto_17617 ?auto_17624 ) ) ( not ( = ?auto_17618 ?auto_17624 ) ) ( not ( = ?auto_17616 ?auto_17624 ) ) ( not ( = ?auto_17625 ?auto_17624 ) ) ( not ( = ?auto_17628 ?auto_17624 ) ) ( not ( = ?auto_17615 ?auto_17624 ) ) ( SURFACE-AT ?auto_17627 ?auto_17621 ) ( CLEAR ?auto_17627 ) ( IS-CRATE ?auto_17615 ) ( not ( = ?auto_17627 ?auto_17615 ) ) ( not ( = ?auto_17617 ?auto_17627 ) ) ( not ( = ?auto_17618 ?auto_17627 ) ) ( not ( = ?auto_17616 ?auto_17627 ) ) ( not ( = ?auto_17625 ?auto_17627 ) ) ( not ( = ?auto_17628 ?auto_17627 ) ) ( not ( = ?auto_17624 ?auto_17627 ) ) ( AVAILABLE ?auto_17629 ) ( TRUCK-AT ?auto_17630 ?auto_17622 ) ( AVAILABLE ?auto_17626 ) ( SURFACE-AT ?auto_17615 ?auto_17622 ) ( ON ?auto_17615 ?auto_17620 ) ( CLEAR ?auto_17615 ) ( not ( = ?auto_17617 ?auto_17620 ) ) ( not ( = ?auto_17618 ?auto_17620 ) ) ( not ( = ?auto_17616 ?auto_17620 ) ) ( not ( = ?auto_17625 ?auto_17620 ) ) ( not ( = ?auto_17628 ?auto_17620 ) ) ( not ( = ?auto_17615 ?auto_17620 ) ) ( not ( = ?auto_17624 ?auto_17620 ) ) ( not ( = ?auto_17627 ?auto_17620 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17616 ?auto_17617 ?auto_17618 )
      ( MAKE-3CRATE-VERIFY ?auto_17615 ?auto_17616 ?auto_17617 ?auto_17618 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17631 - SURFACE
      ?auto_17632 - SURFACE
      ?auto_17633 - SURFACE
      ?auto_17634 - SURFACE
      ?auto_17635 - SURFACE
    )
    :vars
    (
      ?auto_17645 - HOIST
      ?auto_17638 - PLACE
      ?auto_17639 - PLACE
      ?auto_17643 - HOIST
      ?auto_17642 - SURFACE
      ?auto_17636 - PLACE
      ?auto_17640 - HOIST
      ?auto_17644 - SURFACE
      ?auto_17641 - SURFACE
      ?auto_17646 - TRUCK
      ?auto_17637 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17645 ?auto_17638 ) ( IS-CRATE ?auto_17635 ) ( not ( = ?auto_17634 ?auto_17635 ) ) ( not ( = ?auto_17633 ?auto_17634 ) ) ( not ( = ?auto_17633 ?auto_17635 ) ) ( not ( = ?auto_17639 ?auto_17638 ) ) ( HOIST-AT ?auto_17643 ?auto_17639 ) ( not ( = ?auto_17645 ?auto_17643 ) ) ( SURFACE-AT ?auto_17635 ?auto_17639 ) ( ON ?auto_17635 ?auto_17642 ) ( CLEAR ?auto_17635 ) ( not ( = ?auto_17634 ?auto_17642 ) ) ( not ( = ?auto_17635 ?auto_17642 ) ) ( not ( = ?auto_17633 ?auto_17642 ) ) ( IS-CRATE ?auto_17634 ) ( not ( = ?auto_17636 ?auto_17638 ) ) ( not ( = ?auto_17639 ?auto_17636 ) ) ( HOIST-AT ?auto_17640 ?auto_17636 ) ( not ( = ?auto_17645 ?auto_17640 ) ) ( not ( = ?auto_17643 ?auto_17640 ) ) ( AVAILABLE ?auto_17640 ) ( SURFACE-AT ?auto_17634 ?auto_17636 ) ( ON ?auto_17634 ?auto_17644 ) ( CLEAR ?auto_17634 ) ( not ( = ?auto_17634 ?auto_17644 ) ) ( not ( = ?auto_17635 ?auto_17644 ) ) ( not ( = ?auto_17633 ?auto_17644 ) ) ( not ( = ?auto_17642 ?auto_17644 ) ) ( IS-CRATE ?auto_17633 ) ( not ( = ?auto_17632 ?auto_17633 ) ) ( not ( = ?auto_17634 ?auto_17632 ) ) ( not ( = ?auto_17635 ?auto_17632 ) ) ( not ( = ?auto_17642 ?auto_17632 ) ) ( not ( = ?auto_17644 ?auto_17632 ) ) ( SURFACE-AT ?auto_17633 ?auto_17639 ) ( ON ?auto_17633 ?auto_17641 ) ( CLEAR ?auto_17633 ) ( not ( = ?auto_17634 ?auto_17641 ) ) ( not ( = ?auto_17635 ?auto_17641 ) ) ( not ( = ?auto_17633 ?auto_17641 ) ) ( not ( = ?auto_17642 ?auto_17641 ) ) ( not ( = ?auto_17644 ?auto_17641 ) ) ( not ( = ?auto_17632 ?auto_17641 ) ) ( SURFACE-AT ?auto_17631 ?auto_17638 ) ( CLEAR ?auto_17631 ) ( IS-CRATE ?auto_17632 ) ( not ( = ?auto_17631 ?auto_17632 ) ) ( not ( = ?auto_17634 ?auto_17631 ) ) ( not ( = ?auto_17635 ?auto_17631 ) ) ( not ( = ?auto_17633 ?auto_17631 ) ) ( not ( = ?auto_17642 ?auto_17631 ) ) ( not ( = ?auto_17644 ?auto_17631 ) ) ( not ( = ?auto_17641 ?auto_17631 ) ) ( AVAILABLE ?auto_17645 ) ( TRUCK-AT ?auto_17646 ?auto_17639 ) ( AVAILABLE ?auto_17643 ) ( SURFACE-AT ?auto_17632 ?auto_17639 ) ( ON ?auto_17632 ?auto_17637 ) ( CLEAR ?auto_17632 ) ( not ( = ?auto_17634 ?auto_17637 ) ) ( not ( = ?auto_17635 ?auto_17637 ) ) ( not ( = ?auto_17633 ?auto_17637 ) ) ( not ( = ?auto_17642 ?auto_17637 ) ) ( not ( = ?auto_17644 ?auto_17637 ) ) ( not ( = ?auto_17632 ?auto_17637 ) ) ( not ( = ?auto_17641 ?auto_17637 ) ) ( not ( = ?auto_17631 ?auto_17637 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17633 ?auto_17634 ?auto_17635 )
      ( MAKE-4CRATE-VERIFY ?auto_17631 ?auto_17632 ?auto_17633 ?auto_17634 ?auto_17635 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17647 - SURFACE
      ?auto_17648 - SURFACE
    )
    :vars
    (
      ?auto_17660 - HOIST
      ?auto_17651 - PLACE
      ?auto_17662 - SURFACE
      ?auto_17652 - PLACE
      ?auto_17657 - HOIST
      ?auto_17656 - SURFACE
      ?auto_17649 - PLACE
      ?auto_17653 - HOIST
      ?auto_17659 - SURFACE
      ?auto_17655 - SURFACE
      ?auto_17654 - SURFACE
      ?auto_17658 - SURFACE
      ?auto_17650 - SURFACE
      ?auto_17661 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17660 ?auto_17651 ) ( IS-CRATE ?auto_17648 ) ( not ( = ?auto_17647 ?auto_17648 ) ) ( not ( = ?auto_17662 ?auto_17647 ) ) ( not ( = ?auto_17662 ?auto_17648 ) ) ( not ( = ?auto_17652 ?auto_17651 ) ) ( HOIST-AT ?auto_17657 ?auto_17652 ) ( not ( = ?auto_17660 ?auto_17657 ) ) ( SURFACE-AT ?auto_17648 ?auto_17652 ) ( ON ?auto_17648 ?auto_17656 ) ( CLEAR ?auto_17648 ) ( not ( = ?auto_17647 ?auto_17656 ) ) ( not ( = ?auto_17648 ?auto_17656 ) ) ( not ( = ?auto_17662 ?auto_17656 ) ) ( IS-CRATE ?auto_17647 ) ( not ( = ?auto_17649 ?auto_17651 ) ) ( not ( = ?auto_17652 ?auto_17649 ) ) ( HOIST-AT ?auto_17653 ?auto_17649 ) ( not ( = ?auto_17660 ?auto_17653 ) ) ( not ( = ?auto_17657 ?auto_17653 ) ) ( AVAILABLE ?auto_17653 ) ( SURFACE-AT ?auto_17647 ?auto_17649 ) ( ON ?auto_17647 ?auto_17659 ) ( CLEAR ?auto_17647 ) ( not ( = ?auto_17647 ?auto_17659 ) ) ( not ( = ?auto_17648 ?auto_17659 ) ) ( not ( = ?auto_17662 ?auto_17659 ) ) ( not ( = ?auto_17656 ?auto_17659 ) ) ( IS-CRATE ?auto_17662 ) ( not ( = ?auto_17655 ?auto_17662 ) ) ( not ( = ?auto_17647 ?auto_17655 ) ) ( not ( = ?auto_17648 ?auto_17655 ) ) ( not ( = ?auto_17656 ?auto_17655 ) ) ( not ( = ?auto_17659 ?auto_17655 ) ) ( SURFACE-AT ?auto_17662 ?auto_17652 ) ( ON ?auto_17662 ?auto_17654 ) ( CLEAR ?auto_17662 ) ( not ( = ?auto_17647 ?auto_17654 ) ) ( not ( = ?auto_17648 ?auto_17654 ) ) ( not ( = ?auto_17662 ?auto_17654 ) ) ( not ( = ?auto_17656 ?auto_17654 ) ) ( not ( = ?auto_17659 ?auto_17654 ) ) ( not ( = ?auto_17655 ?auto_17654 ) ) ( SURFACE-AT ?auto_17658 ?auto_17651 ) ( CLEAR ?auto_17658 ) ( IS-CRATE ?auto_17655 ) ( not ( = ?auto_17658 ?auto_17655 ) ) ( not ( = ?auto_17647 ?auto_17658 ) ) ( not ( = ?auto_17648 ?auto_17658 ) ) ( not ( = ?auto_17662 ?auto_17658 ) ) ( not ( = ?auto_17656 ?auto_17658 ) ) ( not ( = ?auto_17659 ?auto_17658 ) ) ( not ( = ?auto_17654 ?auto_17658 ) ) ( AVAILABLE ?auto_17660 ) ( AVAILABLE ?auto_17657 ) ( SURFACE-AT ?auto_17655 ?auto_17652 ) ( ON ?auto_17655 ?auto_17650 ) ( CLEAR ?auto_17655 ) ( not ( = ?auto_17647 ?auto_17650 ) ) ( not ( = ?auto_17648 ?auto_17650 ) ) ( not ( = ?auto_17662 ?auto_17650 ) ) ( not ( = ?auto_17656 ?auto_17650 ) ) ( not ( = ?auto_17659 ?auto_17650 ) ) ( not ( = ?auto_17655 ?auto_17650 ) ) ( not ( = ?auto_17654 ?auto_17650 ) ) ( not ( = ?auto_17658 ?auto_17650 ) ) ( TRUCK-AT ?auto_17661 ?auto_17651 ) )
    :subtasks
    ( ( !DRIVE ?auto_17661 ?auto_17651 ?auto_17652 )
      ( MAKE-2CRATE ?auto_17662 ?auto_17647 ?auto_17648 )
      ( MAKE-1CRATE-VERIFY ?auto_17647 ?auto_17648 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17663 - SURFACE
      ?auto_17664 - SURFACE
      ?auto_17665 - SURFACE
    )
    :vars
    (
      ?auto_17675 - HOIST
      ?auto_17668 - PLACE
      ?auto_17672 - PLACE
      ?auto_17674 - HOIST
      ?auto_17666 - SURFACE
      ?auto_17676 - PLACE
      ?auto_17677 - HOIST
      ?auto_17678 - SURFACE
      ?auto_17667 - SURFACE
      ?auto_17671 - SURFACE
      ?auto_17670 - SURFACE
      ?auto_17673 - SURFACE
      ?auto_17669 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17675 ?auto_17668 ) ( IS-CRATE ?auto_17665 ) ( not ( = ?auto_17664 ?auto_17665 ) ) ( not ( = ?auto_17663 ?auto_17664 ) ) ( not ( = ?auto_17663 ?auto_17665 ) ) ( not ( = ?auto_17672 ?auto_17668 ) ) ( HOIST-AT ?auto_17674 ?auto_17672 ) ( not ( = ?auto_17675 ?auto_17674 ) ) ( SURFACE-AT ?auto_17665 ?auto_17672 ) ( ON ?auto_17665 ?auto_17666 ) ( CLEAR ?auto_17665 ) ( not ( = ?auto_17664 ?auto_17666 ) ) ( not ( = ?auto_17665 ?auto_17666 ) ) ( not ( = ?auto_17663 ?auto_17666 ) ) ( IS-CRATE ?auto_17664 ) ( not ( = ?auto_17676 ?auto_17668 ) ) ( not ( = ?auto_17672 ?auto_17676 ) ) ( HOIST-AT ?auto_17677 ?auto_17676 ) ( not ( = ?auto_17675 ?auto_17677 ) ) ( not ( = ?auto_17674 ?auto_17677 ) ) ( AVAILABLE ?auto_17677 ) ( SURFACE-AT ?auto_17664 ?auto_17676 ) ( ON ?auto_17664 ?auto_17678 ) ( CLEAR ?auto_17664 ) ( not ( = ?auto_17664 ?auto_17678 ) ) ( not ( = ?auto_17665 ?auto_17678 ) ) ( not ( = ?auto_17663 ?auto_17678 ) ) ( not ( = ?auto_17666 ?auto_17678 ) ) ( IS-CRATE ?auto_17663 ) ( not ( = ?auto_17667 ?auto_17663 ) ) ( not ( = ?auto_17664 ?auto_17667 ) ) ( not ( = ?auto_17665 ?auto_17667 ) ) ( not ( = ?auto_17666 ?auto_17667 ) ) ( not ( = ?auto_17678 ?auto_17667 ) ) ( SURFACE-AT ?auto_17663 ?auto_17672 ) ( ON ?auto_17663 ?auto_17671 ) ( CLEAR ?auto_17663 ) ( not ( = ?auto_17664 ?auto_17671 ) ) ( not ( = ?auto_17665 ?auto_17671 ) ) ( not ( = ?auto_17663 ?auto_17671 ) ) ( not ( = ?auto_17666 ?auto_17671 ) ) ( not ( = ?auto_17678 ?auto_17671 ) ) ( not ( = ?auto_17667 ?auto_17671 ) ) ( SURFACE-AT ?auto_17670 ?auto_17668 ) ( CLEAR ?auto_17670 ) ( IS-CRATE ?auto_17667 ) ( not ( = ?auto_17670 ?auto_17667 ) ) ( not ( = ?auto_17664 ?auto_17670 ) ) ( not ( = ?auto_17665 ?auto_17670 ) ) ( not ( = ?auto_17663 ?auto_17670 ) ) ( not ( = ?auto_17666 ?auto_17670 ) ) ( not ( = ?auto_17678 ?auto_17670 ) ) ( not ( = ?auto_17671 ?auto_17670 ) ) ( AVAILABLE ?auto_17675 ) ( AVAILABLE ?auto_17674 ) ( SURFACE-AT ?auto_17667 ?auto_17672 ) ( ON ?auto_17667 ?auto_17673 ) ( CLEAR ?auto_17667 ) ( not ( = ?auto_17664 ?auto_17673 ) ) ( not ( = ?auto_17665 ?auto_17673 ) ) ( not ( = ?auto_17663 ?auto_17673 ) ) ( not ( = ?auto_17666 ?auto_17673 ) ) ( not ( = ?auto_17678 ?auto_17673 ) ) ( not ( = ?auto_17667 ?auto_17673 ) ) ( not ( = ?auto_17671 ?auto_17673 ) ) ( not ( = ?auto_17670 ?auto_17673 ) ) ( TRUCK-AT ?auto_17669 ?auto_17668 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17664 ?auto_17665 )
      ( MAKE-2CRATE-VERIFY ?auto_17663 ?auto_17664 ?auto_17665 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17679 - SURFACE
      ?auto_17680 - SURFACE
      ?auto_17681 - SURFACE
      ?auto_17682 - SURFACE
    )
    :vars
    (
      ?auto_17688 - HOIST
      ?auto_17683 - PLACE
      ?auto_17694 - PLACE
      ?auto_17685 - HOIST
      ?auto_17689 - SURFACE
      ?auto_17691 - PLACE
      ?auto_17692 - HOIST
      ?auto_17690 - SURFACE
      ?auto_17684 - SURFACE
      ?auto_17686 - SURFACE
      ?auto_17693 - SURFACE
      ?auto_17687 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17688 ?auto_17683 ) ( IS-CRATE ?auto_17682 ) ( not ( = ?auto_17681 ?auto_17682 ) ) ( not ( = ?auto_17680 ?auto_17681 ) ) ( not ( = ?auto_17680 ?auto_17682 ) ) ( not ( = ?auto_17694 ?auto_17683 ) ) ( HOIST-AT ?auto_17685 ?auto_17694 ) ( not ( = ?auto_17688 ?auto_17685 ) ) ( SURFACE-AT ?auto_17682 ?auto_17694 ) ( ON ?auto_17682 ?auto_17689 ) ( CLEAR ?auto_17682 ) ( not ( = ?auto_17681 ?auto_17689 ) ) ( not ( = ?auto_17682 ?auto_17689 ) ) ( not ( = ?auto_17680 ?auto_17689 ) ) ( IS-CRATE ?auto_17681 ) ( not ( = ?auto_17691 ?auto_17683 ) ) ( not ( = ?auto_17694 ?auto_17691 ) ) ( HOIST-AT ?auto_17692 ?auto_17691 ) ( not ( = ?auto_17688 ?auto_17692 ) ) ( not ( = ?auto_17685 ?auto_17692 ) ) ( AVAILABLE ?auto_17692 ) ( SURFACE-AT ?auto_17681 ?auto_17691 ) ( ON ?auto_17681 ?auto_17690 ) ( CLEAR ?auto_17681 ) ( not ( = ?auto_17681 ?auto_17690 ) ) ( not ( = ?auto_17682 ?auto_17690 ) ) ( not ( = ?auto_17680 ?auto_17690 ) ) ( not ( = ?auto_17689 ?auto_17690 ) ) ( IS-CRATE ?auto_17680 ) ( not ( = ?auto_17679 ?auto_17680 ) ) ( not ( = ?auto_17681 ?auto_17679 ) ) ( not ( = ?auto_17682 ?auto_17679 ) ) ( not ( = ?auto_17689 ?auto_17679 ) ) ( not ( = ?auto_17690 ?auto_17679 ) ) ( SURFACE-AT ?auto_17680 ?auto_17694 ) ( ON ?auto_17680 ?auto_17684 ) ( CLEAR ?auto_17680 ) ( not ( = ?auto_17681 ?auto_17684 ) ) ( not ( = ?auto_17682 ?auto_17684 ) ) ( not ( = ?auto_17680 ?auto_17684 ) ) ( not ( = ?auto_17689 ?auto_17684 ) ) ( not ( = ?auto_17690 ?auto_17684 ) ) ( not ( = ?auto_17679 ?auto_17684 ) ) ( SURFACE-AT ?auto_17686 ?auto_17683 ) ( CLEAR ?auto_17686 ) ( IS-CRATE ?auto_17679 ) ( not ( = ?auto_17686 ?auto_17679 ) ) ( not ( = ?auto_17681 ?auto_17686 ) ) ( not ( = ?auto_17682 ?auto_17686 ) ) ( not ( = ?auto_17680 ?auto_17686 ) ) ( not ( = ?auto_17689 ?auto_17686 ) ) ( not ( = ?auto_17690 ?auto_17686 ) ) ( not ( = ?auto_17684 ?auto_17686 ) ) ( AVAILABLE ?auto_17688 ) ( AVAILABLE ?auto_17685 ) ( SURFACE-AT ?auto_17679 ?auto_17694 ) ( ON ?auto_17679 ?auto_17693 ) ( CLEAR ?auto_17679 ) ( not ( = ?auto_17681 ?auto_17693 ) ) ( not ( = ?auto_17682 ?auto_17693 ) ) ( not ( = ?auto_17680 ?auto_17693 ) ) ( not ( = ?auto_17689 ?auto_17693 ) ) ( not ( = ?auto_17690 ?auto_17693 ) ) ( not ( = ?auto_17679 ?auto_17693 ) ) ( not ( = ?auto_17684 ?auto_17693 ) ) ( not ( = ?auto_17686 ?auto_17693 ) ) ( TRUCK-AT ?auto_17687 ?auto_17683 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17680 ?auto_17681 ?auto_17682 )
      ( MAKE-3CRATE-VERIFY ?auto_17679 ?auto_17680 ?auto_17681 ?auto_17682 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17695 - SURFACE
      ?auto_17696 - SURFACE
      ?auto_17697 - SURFACE
      ?auto_17698 - SURFACE
      ?auto_17699 - SURFACE
    )
    :vars
    (
      ?auto_17704 - HOIST
      ?auto_17700 - PLACE
      ?auto_17710 - PLACE
      ?auto_17702 - HOIST
      ?auto_17705 - SURFACE
      ?auto_17707 - PLACE
      ?auto_17708 - HOIST
      ?auto_17706 - SURFACE
      ?auto_17701 - SURFACE
      ?auto_17709 - SURFACE
      ?auto_17703 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17704 ?auto_17700 ) ( IS-CRATE ?auto_17699 ) ( not ( = ?auto_17698 ?auto_17699 ) ) ( not ( = ?auto_17697 ?auto_17698 ) ) ( not ( = ?auto_17697 ?auto_17699 ) ) ( not ( = ?auto_17710 ?auto_17700 ) ) ( HOIST-AT ?auto_17702 ?auto_17710 ) ( not ( = ?auto_17704 ?auto_17702 ) ) ( SURFACE-AT ?auto_17699 ?auto_17710 ) ( ON ?auto_17699 ?auto_17705 ) ( CLEAR ?auto_17699 ) ( not ( = ?auto_17698 ?auto_17705 ) ) ( not ( = ?auto_17699 ?auto_17705 ) ) ( not ( = ?auto_17697 ?auto_17705 ) ) ( IS-CRATE ?auto_17698 ) ( not ( = ?auto_17707 ?auto_17700 ) ) ( not ( = ?auto_17710 ?auto_17707 ) ) ( HOIST-AT ?auto_17708 ?auto_17707 ) ( not ( = ?auto_17704 ?auto_17708 ) ) ( not ( = ?auto_17702 ?auto_17708 ) ) ( AVAILABLE ?auto_17708 ) ( SURFACE-AT ?auto_17698 ?auto_17707 ) ( ON ?auto_17698 ?auto_17706 ) ( CLEAR ?auto_17698 ) ( not ( = ?auto_17698 ?auto_17706 ) ) ( not ( = ?auto_17699 ?auto_17706 ) ) ( not ( = ?auto_17697 ?auto_17706 ) ) ( not ( = ?auto_17705 ?auto_17706 ) ) ( IS-CRATE ?auto_17697 ) ( not ( = ?auto_17696 ?auto_17697 ) ) ( not ( = ?auto_17698 ?auto_17696 ) ) ( not ( = ?auto_17699 ?auto_17696 ) ) ( not ( = ?auto_17705 ?auto_17696 ) ) ( not ( = ?auto_17706 ?auto_17696 ) ) ( SURFACE-AT ?auto_17697 ?auto_17710 ) ( ON ?auto_17697 ?auto_17701 ) ( CLEAR ?auto_17697 ) ( not ( = ?auto_17698 ?auto_17701 ) ) ( not ( = ?auto_17699 ?auto_17701 ) ) ( not ( = ?auto_17697 ?auto_17701 ) ) ( not ( = ?auto_17705 ?auto_17701 ) ) ( not ( = ?auto_17706 ?auto_17701 ) ) ( not ( = ?auto_17696 ?auto_17701 ) ) ( SURFACE-AT ?auto_17695 ?auto_17700 ) ( CLEAR ?auto_17695 ) ( IS-CRATE ?auto_17696 ) ( not ( = ?auto_17695 ?auto_17696 ) ) ( not ( = ?auto_17698 ?auto_17695 ) ) ( not ( = ?auto_17699 ?auto_17695 ) ) ( not ( = ?auto_17697 ?auto_17695 ) ) ( not ( = ?auto_17705 ?auto_17695 ) ) ( not ( = ?auto_17706 ?auto_17695 ) ) ( not ( = ?auto_17701 ?auto_17695 ) ) ( AVAILABLE ?auto_17704 ) ( AVAILABLE ?auto_17702 ) ( SURFACE-AT ?auto_17696 ?auto_17710 ) ( ON ?auto_17696 ?auto_17709 ) ( CLEAR ?auto_17696 ) ( not ( = ?auto_17698 ?auto_17709 ) ) ( not ( = ?auto_17699 ?auto_17709 ) ) ( not ( = ?auto_17697 ?auto_17709 ) ) ( not ( = ?auto_17705 ?auto_17709 ) ) ( not ( = ?auto_17706 ?auto_17709 ) ) ( not ( = ?auto_17696 ?auto_17709 ) ) ( not ( = ?auto_17701 ?auto_17709 ) ) ( not ( = ?auto_17695 ?auto_17709 ) ) ( TRUCK-AT ?auto_17703 ?auto_17700 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17697 ?auto_17698 ?auto_17699 )
      ( MAKE-4CRATE-VERIFY ?auto_17695 ?auto_17696 ?auto_17697 ?auto_17698 ?auto_17699 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17731 - SURFACE
      ?auto_17732 - SURFACE
    )
    :vars
    (
      ?auto_17733 - HOIST
      ?auto_17734 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17733 ?auto_17734 ) ( SURFACE-AT ?auto_17731 ?auto_17734 ) ( CLEAR ?auto_17731 ) ( LIFTING ?auto_17733 ?auto_17732 ) ( IS-CRATE ?auto_17732 ) ( not ( = ?auto_17731 ?auto_17732 ) ) )
    :subtasks
    ( ( !DROP ?auto_17733 ?auto_17732 ?auto_17731 ?auto_17734 )
      ( MAKE-1CRATE-VERIFY ?auto_17731 ?auto_17732 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17735 - SURFACE
      ?auto_17736 - SURFACE
      ?auto_17737 - SURFACE
    )
    :vars
    (
      ?auto_17739 - HOIST
      ?auto_17738 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17739 ?auto_17738 ) ( SURFACE-AT ?auto_17736 ?auto_17738 ) ( CLEAR ?auto_17736 ) ( LIFTING ?auto_17739 ?auto_17737 ) ( IS-CRATE ?auto_17737 ) ( not ( = ?auto_17736 ?auto_17737 ) ) ( ON ?auto_17736 ?auto_17735 ) ( not ( = ?auto_17735 ?auto_17736 ) ) ( not ( = ?auto_17735 ?auto_17737 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17736 ?auto_17737 )
      ( MAKE-2CRATE-VERIFY ?auto_17735 ?auto_17736 ?auto_17737 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17740 - SURFACE
      ?auto_17741 - SURFACE
      ?auto_17742 - SURFACE
      ?auto_17743 - SURFACE
    )
    :vars
    (
      ?auto_17745 - HOIST
      ?auto_17744 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17745 ?auto_17744 ) ( SURFACE-AT ?auto_17742 ?auto_17744 ) ( CLEAR ?auto_17742 ) ( LIFTING ?auto_17745 ?auto_17743 ) ( IS-CRATE ?auto_17743 ) ( not ( = ?auto_17742 ?auto_17743 ) ) ( ON ?auto_17741 ?auto_17740 ) ( ON ?auto_17742 ?auto_17741 ) ( not ( = ?auto_17740 ?auto_17741 ) ) ( not ( = ?auto_17740 ?auto_17742 ) ) ( not ( = ?auto_17740 ?auto_17743 ) ) ( not ( = ?auto_17741 ?auto_17742 ) ) ( not ( = ?auto_17741 ?auto_17743 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17742 ?auto_17743 )
      ( MAKE-3CRATE-VERIFY ?auto_17740 ?auto_17741 ?auto_17742 ?auto_17743 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17746 - SURFACE
      ?auto_17747 - SURFACE
      ?auto_17748 - SURFACE
      ?auto_17749 - SURFACE
      ?auto_17750 - SURFACE
    )
    :vars
    (
      ?auto_17752 - HOIST
      ?auto_17751 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17752 ?auto_17751 ) ( SURFACE-AT ?auto_17749 ?auto_17751 ) ( CLEAR ?auto_17749 ) ( LIFTING ?auto_17752 ?auto_17750 ) ( IS-CRATE ?auto_17750 ) ( not ( = ?auto_17749 ?auto_17750 ) ) ( ON ?auto_17747 ?auto_17746 ) ( ON ?auto_17748 ?auto_17747 ) ( ON ?auto_17749 ?auto_17748 ) ( not ( = ?auto_17746 ?auto_17747 ) ) ( not ( = ?auto_17746 ?auto_17748 ) ) ( not ( = ?auto_17746 ?auto_17749 ) ) ( not ( = ?auto_17746 ?auto_17750 ) ) ( not ( = ?auto_17747 ?auto_17748 ) ) ( not ( = ?auto_17747 ?auto_17749 ) ) ( not ( = ?auto_17747 ?auto_17750 ) ) ( not ( = ?auto_17748 ?auto_17749 ) ) ( not ( = ?auto_17748 ?auto_17750 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17749 ?auto_17750 )
      ( MAKE-4CRATE-VERIFY ?auto_17746 ?auto_17747 ?auto_17748 ?auto_17749 ?auto_17750 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17753 - SURFACE
      ?auto_17754 - SURFACE
      ?auto_17755 - SURFACE
      ?auto_17756 - SURFACE
      ?auto_17757 - SURFACE
      ?auto_17758 - SURFACE
    )
    :vars
    (
      ?auto_17760 - HOIST
      ?auto_17759 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17760 ?auto_17759 ) ( SURFACE-AT ?auto_17757 ?auto_17759 ) ( CLEAR ?auto_17757 ) ( LIFTING ?auto_17760 ?auto_17758 ) ( IS-CRATE ?auto_17758 ) ( not ( = ?auto_17757 ?auto_17758 ) ) ( ON ?auto_17754 ?auto_17753 ) ( ON ?auto_17755 ?auto_17754 ) ( ON ?auto_17756 ?auto_17755 ) ( ON ?auto_17757 ?auto_17756 ) ( not ( = ?auto_17753 ?auto_17754 ) ) ( not ( = ?auto_17753 ?auto_17755 ) ) ( not ( = ?auto_17753 ?auto_17756 ) ) ( not ( = ?auto_17753 ?auto_17757 ) ) ( not ( = ?auto_17753 ?auto_17758 ) ) ( not ( = ?auto_17754 ?auto_17755 ) ) ( not ( = ?auto_17754 ?auto_17756 ) ) ( not ( = ?auto_17754 ?auto_17757 ) ) ( not ( = ?auto_17754 ?auto_17758 ) ) ( not ( = ?auto_17755 ?auto_17756 ) ) ( not ( = ?auto_17755 ?auto_17757 ) ) ( not ( = ?auto_17755 ?auto_17758 ) ) ( not ( = ?auto_17756 ?auto_17757 ) ) ( not ( = ?auto_17756 ?auto_17758 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17757 ?auto_17758 )
      ( MAKE-5CRATE-VERIFY ?auto_17753 ?auto_17754 ?auto_17755 ?auto_17756 ?auto_17757 ?auto_17758 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17761 - SURFACE
      ?auto_17762 - SURFACE
    )
    :vars
    (
      ?auto_17764 - HOIST
      ?auto_17763 - PLACE
      ?auto_17765 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17764 ?auto_17763 ) ( SURFACE-AT ?auto_17761 ?auto_17763 ) ( CLEAR ?auto_17761 ) ( IS-CRATE ?auto_17762 ) ( not ( = ?auto_17761 ?auto_17762 ) ) ( TRUCK-AT ?auto_17765 ?auto_17763 ) ( AVAILABLE ?auto_17764 ) ( IN ?auto_17762 ?auto_17765 ) )
    :subtasks
    ( ( !UNLOAD ?auto_17764 ?auto_17762 ?auto_17765 ?auto_17763 )
      ( MAKE-1CRATE ?auto_17761 ?auto_17762 )
      ( MAKE-1CRATE-VERIFY ?auto_17761 ?auto_17762 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17766 - SURFACE
      ?auto_17767 - SURFACE
      ?auto_17768 - SURFACE
    )
    :vars
    (
      ?auto_17770 - HOIST
      ?auto_17771 - PLACE
      ?auto_17769 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17770 ?auto_17771 ) ( SURFACE-AT ?auto_17767 ?auto_17771 ) ( CLEAR ?auto_17767 ) ( IS-CRATE ?auto_17768 ) ( not ( = ?auto_17767 ?auto_17768 ) ) ( TRUCK-AT ?auto_17769 ?auto_17771 ) ( AVAILABLE ?auto_17770 ) ( IN ?auto_17768 ?auto_17769 ) ( ON ?auto_17767 ?auto_17766 ) ( not ( = ?auto_17766 ?auto_17767 ) ) ( not ( = ?auto_17766 ?auto_17768 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17767 ?auto_17768 )
      ( MAKE-2CRATE-VERIFY ?auto_17766 ?auto_17767 ?auto_17768 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17772 - SURFACE
      ?auto_17773 - SURFACE
      ?auto_17774 - SURFACE
      ?auto_17775 - SURFACE
    )
    :vars
    (
      ?auto_17778 - HOIST
      ?auto_17776 - PLACE
      ?auto_17777 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17778 ?auto_17776 ) ( SURFACE-AT ?auto_17774 ?auto_17776 ) ( CLEAR ?auto_17774 ) ( IS-CRATE ?auto_17775 ) ( not ( = ?auto_17774 ?auto_17775 ) ) ( TRUCK-AT ?auto_17777 ?auto_17776 ) ( AVAILABLE ?auto_17778 ) ( IN ?auto_17775 ?auto_17777 ) ( ON ?auto_17774 ?auto_17773 ) ( not ( = ?auto_17773 ?auto_17774 ) ) ( not ( = ?auto_17773 ?auto_17775 ) ) ( ON ?auto_17773 ?auto_17772 ) ( not ( = ?auto_17772 ?auto_17773 ) ) ( not ( = ?auto_17772 ?auto_17774 ) ) ( not ( = ?auto_17772 ?auto_17775 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17773 ?auto_17774 ?auto_17775 )
      ( MAKE-3CRATE-VERIFY ?auto_17772 ?auto_17773 ?auto_17774 ?auto_17775 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17779 - SURFACE
      ?auto_17780 - SURFACE
      ?auto_17781 - SURFACE
      ?auto_17782 - SURFACE
      ?auto_17783 - SURFACE
    )
    :vars
    (
      ?auto_17786 - HOIST
      ?auto_17784 - PLACE
      ?auto_17785 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17786 ?auto_17784 ) ( SURFACE-AT ?auto_17782 ?auto_17784 ) ( CLEAR ?auto_17782 ) ( IS-CRATE ?auto_17783 ) ( not ( = ?auto_17782 ?auto_17783 ) ) ( TRUCK-AT ?auto_17785 ?auto_17784 ) ( AVAILABLE ?auto_17786 ) ( IN ?auto_17783 ?auto_17785 ) ( ON ?auto_17782 ?auto_17781 ) ( not ( = ?auto_17781 ?auto_17782 ) ) ( not ( = ?auto_17781 ?auto_17783 ) ) ( ON ?auto_17780 ?auto_17779 ) ( ON ?auto_17781 ?auto_17780 ) ( not ( = ?auto_17779 ?auto_17780 ) ) ( not ( = ?auto_17779 ?auto_17781 ) ) ( not ( = ?auto_17779 ?auto_17782 ) ) ( not ( = ?auto_17779 ?auto_17783 ) ) ( not ( = ?auto_17780 ?auto_17781 ) ) ( not ( = ?auto_17780 ?auto_17782 ) ) ( not ( = ?auto_17780 ?auto_17783 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17781 ?auto_17782 ?auto_17783 )
      ( MAKE-4CRATE-VERIFY ?auto_17779 ?auto_17780 ?auto_17781 ?auto_17782 ?auto_17783 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17787 - SURFACE
      ?auto_17788 - SURFACE
      ?auto_17789 - SURFACE
      ?auto_17790 - SURFACE
      ?auto_17791 - SURFACE
      ?auto_17792 - SURFACE
    )
    :vars
    (
      ?auto_17795 - HOIST
      ?auto_17793 - PLACE
      ?auto_17794 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17795 ?auto_17793 ) ( SURFACE-AT ?auto_17791 ?auto_17793 ) ( CLEAR ?auto_17791 ) ( IS-CRATE ?auto_17792 ) ( not ( = ?auto_17791 ?auto_17792 ) ) ( TRUCK-AT ?auto_17794 ?auto_17793 ) ( AVAILABLE ?auto_17795 ) ( IN ?auto_17792 ?auto_17794 ) ( ON ?auto_17791 ?auto_17790 ) ( not ( = ?auto_17790 ?auto_17791 ) ) ( not ( = ?auto_17790 ?auto_17792 ) ) ( ON ?auto_17788 ?auto_17787 ) ( ON ?auto_17789 ?auto_17788 ) ( ON ?auto_17790 ?auto_17789 ) ( not ( = ?auto_17787 ?auto_17788 ) ) ( not ( = ?auto_17787 ?auto_17789 ) ) ( not ( = ?auto_17787 ?auto_17790 ) ) ( not ( = ?auto_17787 ?auto_17791 ) ) ( not ( = ?auto_17787 ?auto_17792 ) ) ( not ( = ?auto_17788 ?auto_17789 ) ) ( not ( = ?auto_17788 ?auto_17790 ) ) ( not ( = ?auto_17788 ?auto_17791 ) ) ( not ( = ?auto_17788 ?auto_17792 ) ) ( not ( = ?auto_17789 ?auto_17790 ) ) ( not ( = ?auto_17789 ?auto_17791 ) ) ( not ( = ?auto_17789 ?auto_17792 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17790 ?auto_17791 ?auto_17792 )
      ( MAKE-5CRATE-VERIFY ?auto_17787 ?auto_17788 ?auto_17789 ?auto_17790 ?auto_17791 ?auto_17792 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17796 - SURFACE
      ?auto_17797 - SURFACE
    )
    :vars
    (
      ?auto_17800 - HOIST
      ?auto_17798 - PLACE
      ?auto_17799 - TRUCK
      ?auto_17801 - SURFACE
      ?auto_17802 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17800 ?auto_17798 ) ( SURFACE-AT ?auto_17796 ?auto_17798 ) ( CLEAR ?auto_17796 ) ( IS-CRATE ?auto_17797 ) ( not ( = ?auto_17796 ?auto_17797 ) ) ( AVAILABLE ?auto_17800 ) ( IN ?auto_17797 ?auto_17799 ) ( ON ?auto_17796 ?auto_17801 ) ( not ( = ?auto_17801 ?auto_17796 ) ) ( not ( = ?auto_17801 ?auto_17797 ) ) ( TRUCK-AT ?auto_17799 ?auto_17802 ) ( not ( = ?auto_17802 ?auto_17798 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17799 ?auto_17802 ?auto_17798 )
      ( MAKE-2CRATE ?auto_17801 ?auto_17796 ?auto_17797 )
      ( MAKE-1CRATE-VERIFY ?auto_17796 ?auto_17797 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17803 - SURFACE
      ?auto_17804 - SURFACE
      ?auto_17805 - SURFACE
    )
    :vars
    (
      ?auto_17807 - HOIST
      ?auto_17806 - PLACE
      ?auto_17809 - TRUCK
      ?auto_17808 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17807 ?auto_17806 ) ( SURFACE-AT ?auto_17804 ?auto_17806 ) ( CLEAR ?auto_17804 ) ( IS-CRATE ?auto_17805 ) ( not ( = ?auto_17804 ?auto_17805 ) ) ( AVAILABLE ?auto_17807 ) ( IN ?auto_17805 ?auto_17809 ) ( ON ?auto_17804 ?auto_17803 ) ( not ( = ?auto_17803 ?auto_17804 ) ) ( not ( = ?auto_17803 ?auto_17805 ) ) ( TRUCK-AT ?auto_17809 ?auto_17808 ) ( not ( = ?auto_17808 ?auto_17806 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17804 ?auto_17805 )
      ( MAKE-2CRATE-VERIFY ?auto_17803 ?auto_17804 ?auto_17805 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17810 - SURFACE
      ?auto_17811 - SURFACE
      ?auto_17812 - SURFACE
      ?auto_17813 - SURFACE
    )
    :vars
    (
      ?auto_17815 - HOIST
      ?auto_17817 - PLACE
      ?auto_17814 - TRUCK
      ?auto_17816 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17815 ?auto_17817 ) ( SURFACE-AT ?auto_17812 ?auto_17817 ) ( CLEAR ?auto_17812 ) ( IS-CRATE ?auto_17813 ) ( not ( = ?auto_17812 ?auto_17813 ) ) ( AVAILABLE ?auto_17815 ) ( IN ?auto_17813 ?auto_17814 ) ( ON ?auto_17812 ?auto_17811 ) ( not ( = ?auto_17811 ?auto_17812 ) ) ( not ( = ?auto_17811 ?auto_17813 ) ) ( TRUCK-AT ?auto_17814 ?auto_17816 ) ( not ( = ?auto_17816 ?auto_17817 ) ) ( ON ?auto_17811 ?auto_17810 ) ( not ( = ?auto_17810 ?auto_17811 ) ) ( not ( = ?auto_17810 ?auto_17812 ) ) ( not ( = ?auto_17810 ?auto_17813 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17811 ?auto_17812 ?auto_17813 )
      ( MAKE-3CRATE-VERIFY ?auto_17810 ?auto_17811 ?auto_17812 ?auto_17813 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17818 - SURFACE
      ?auto_17819 - SURFACE
      ?auto_17820 - SURFACE
      ?auto_17821 - SURFACE
      ?auto_17822 - SURFACE
    )
    :vars
    (
      ?auto_17824 - HOIST
      ?auto_17826 - PLACE
      ?auto_17823 - TRUCK
      ?auto_17825 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17824 ?auto_17826 ) ( SURFACE-AT ?auto_17821 ?auto_17826 ) ( CLEAR ?auto_17821 ) ( IS-CRATE ?auto_17822 ) ( not ( = ?auto_17821 ?auto_17822 ) ) ( AVAILABLE ?auto_17824 ) ( IN ?auto_17822 ?auto_17823 ) ( ON ?auto_17821 ?auto_17820 ) ( not ( = ?auto_17820 ?auto_17821 ) ) ( not ( = ?auto_17820 ?auto_17822 ) ) ( TRUCK-AT ?auto_17823 ?auto_17825 ) ( not ( = ?auto_17825 ?auto_17826 ) ) ( ON ?auto_17819 ?auto_17818 ) ( ON ?auto_17820 ?auto_17819 ) ( not ( = ?auto_17818 ?auto_17819 ) ) ( not ( = ?auto_17818 ?auto_17820 ) ) ( not ( = ?auto_17818 ?auto_17821 ) ) ( not ( = ?auto_17818 ?auto_17822 ) ) ( not ( = ?auto_17819 ?auto_17820 ) ) ( not ( = ?auto_17819 ?auto_17821 ) ) ( not ( = ?auto_17819 ?auto_17822 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17820 ?auto_17821 ?auto_17822 )
      ( MAKE-4CRATE-VERIFY ?auto_17818 ?auto_17819 ?auto_17820 ?auto_17821 ?auto_17822 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17827 - SURFACE
      ?auto_17828 - SURFACE
      ?auto_17829 - SURFACE
      ?auto_17830 - SURFACE
      ?auto_17831 - SURFACE
      ?auto_17832 - SURFACE
    )
    :vars
    (
      ?auto_17834 - HOIST
      ?auto_17836 - PLACE
      ?auto_17833 - TRUCK
      ?auto_17835 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17834 ?auto_17836 ) ( SURFACE-AT ?auto_17831 ?auto_17836 ) ( CLEAR ?auto_17831 ) ( IS-CRATE ?auto_17832 ) ( not ( = ?auto_17831 ?auto_17832 ) ) ( AVAILABLE ?auto_17834 ) ( IN ?auto_17832 ?auto_17833 ) ( ON ?auto_17831 ?auto_17830 ) ( not ( = ?auto_17830 ?auto_17831 ) ) ( not ( = ?auto_17830 ?auto_17832 ) ) ( TRUCK-AT ?auto_17833 ?auto_17835 ) ( not ( = ?auto_17835 ?auto_17836 ) ) ( ON ?auto_17828 ?auto_17827 ) ( ON ?auto_17829 ?auto_17828 ) ( ON ?auto_17830 ?auto_17829 ) ( not ( = ?auto_17827 ?auto_17828 ) ) ( not ( = ?auto_17827 ?auto_17829 ) ) ( not ( = ?auto_17827 ?auto_17830 ) ) ( not ( = ?auto_17827 ?auto_17831 ) ) ( not ( = ?auto_17827 ?auto_17832 ) ) ( not ( = ?auto_17828 ?auto_17829 ) ) ( not ( = ?auto_17828 ?auto_17830 ) ) ( not ( = ?auto_17828 ?auto_17831 ) ) ( not ( = ?auto_17828 ?auto_17832 ) ) ( not ( = ?auto_17829 ?auto_17830 ) ) ( not ( = ?auto_17829 ?auto_17831 ) ) ( not ( = ?auto_17829 ?auto_17832 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17830 ?auto_17831 ?auto_17832 )
      ( MAKE-5CRATE-VERIFY ?auto_17827 ?auto_17828 ?auto_17829 ?auto_17830 ?auto_17831 ?auto_17832 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17837 - SURFACE
      ?auto_17838 - SURFACE
    )
    :vars
    (
      ?auto_17840 - HOIST
      ?auto_17842 - PLACE
      ?auto_17843 - SURFACE
      ?auto_17839 - TRUCK
      ?auto_17841 - PLACE
      ?auto_17844 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17840 ?auto_17842 ) ( SURFACE-AT ?auto_17837 ?auto_17842 ) ( CLEAR ?auto_17837 ) ( IS-CRATE ?auto_17838 ) ( not ( = ?auto_17837 ?auto_17838 ) ) ( AVAILABLE ?auto_17840 ) ( ON ?auto_17837 ?auto_17843 ) ( not ( = ?auto_17843 ?auto_17837 ) ) ( not ( = ?auto_17843 ?auto_17838 ) ) ( TRUCK-AT ?auto_17839 ?auto_17841 ) ( not ( = ?auto_17841 ?auto_17842 ) ) ( HOIST-AT ?auto_17844 ?auto_17841 ) ( LIFTING ?auto_17844 ?auto_17838 ) ( not ( = ?auto_17840 ?auto_17844 ) ) )
    :subtasks
    ( ( !LOAD ?auto_17844 ?auto_17838 ?auto_17839 ?auto_17841 )
      ( MAKE-2CRATE ?auto_17843 ?auto_17837 ?auto_17838 )
      ( MAKE-1CRATE-VERIFY ?auto_17837 ?auto_17838 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17845 - SURFACE
      ?auto_17846 - SURFACE
      ?auto_17847 - SURFACE
    )
    :vars
    (
      ?auto_17848 - HOIST
      ?auto_17851 - PLACE
      ?auto_17849 - TRUCK
      ?auto_17850 - PLACE
      ?auto_17852 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17848 ?auto_17851 ) ( SURFACE-AT ?auto_17846 ?auto_17851 ) ( CLEAR ?auto_17846 ) ( IS-CRATE ?auto_17847 ) ( not ( = ?auto_17846 ?auto_17847 ) ) ( AVAILABLE ?auto_17848 ) ( ON ?auto_17846 ?auto_17845 ) ( not ( = ?auto_17845 ?auto_17846 ) ) ( not ( = ?auto_17845 ?auto_17847 ) ) ( TRUCK-AT ?auto_17849 ?auto_17850 ) ( not ( = ?auto_17850 ?auto_17851 ) ) ( HOIST-AT ?auto_17852 ?auto_17850 ) ( LIFTING ?auto_17852 ?auto_17847 ) ( not ( = ?auto_17848 ?auto_17852 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17846 ?auto_17847 )
      ( MAKE-2CRATE-VERIFY ?auto_17845 ?auto_17846 ?auto_17847 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17853 - SURFACE
      ?auto_17854 - SURFACE
      ?auto_17855 - SURFACE
      ?auto_17856 - SURFACE
    )
    :vars
    (
      ?auto_17857 - HOIST
      ?auto_17861 - PLACE
      ?auto_17860 - TRUCK
      ?auto_17858 - PLACE
      ?auto_17859 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17857 ?auto_17861 ) ( SURFACE-AT ?auto_17855 ?auto_17861 ) ( CLEAR ?auto_17855 ) ( IS-CRATE ?auto_17856 ) ( not ( = ?auto_17855 ?auto_17856 ) ) ( AVAILABLE ?auto_17857 ) ( ON ?auto_17855 ?auto_17854 ) ( not ( = ?auto_17854 ?auto_17855 ) ) ( not ( = ?auto_17854 ?auto_17856 ) ) ( TRUCK-AT ?auto_17860 ?auto_17858 ) ( not ( = ?auto_17858 ?auto_17861 ) ) ( HOIST-AT ?auto_17859 ?auto_17858 ) ( LIFTING ?auto_17859 ?auto_17856 ) ( not ( = ?auto_17857 ?auto_17859 ) ) ( ON ?auto_17854 ?auto_17853 ) ( not ( = ?auto_17853 ?auto_17854 ) ) ( not ( = ?auto_17853 ?auto_17855 ) ) ( not ( = ?auto_17853 ?auto_17856 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17854 ?auto_17855 ?auto_17856 )
      ( MAKE-3CRATE-VERIFY ?auto_17853 ?auto_17854 ?auto_17855 ?auto_17856 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17862 - SURFACE
      ?auto_17863 - SURFACE
      ?auto_17864 - SURFACE
      ?auto_17865 - SURFACE
      ?auto_17866 - SURFACE
    )
    :vars
    (
      ?auto_17867 - HOIST
      ?auto_17871 - PLACE
      ?auto_17870 - TRUCK
      ?auto_17868 - PLACE
      ?auto_17869 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17867 ?auto_17871 ) ( SURFACE-AT ?auto_17865 ?auto_17871 ) ( CLEAR ?auto_17865 ) ( IS-CRATE ?auto_17866 ) ( not ( = ?auto_17865 ?auto_17866 ) ) ( AVAILABLE ?auto_17867 ) ( ON ?auto_17865 ?auto_17864 ) ( not ( = ?auto_17864 ?auto_17865 ) ) ( not ( = ?auto_17864 ?auto_17866 ) ) ( TRUCK-AT ?auto_17870 ?auto_17868 ) ( not ( = ?auto_17868 ?auto_17871 ) ) ( HOIST-AT ?auto_17869 ?auto_17868 ) ( LIFTING ?auto_17869 ?auto_17866 ) ( not ( = ?auto_17867 ?auto_17869 ) ) ( ON ?auto_17863 ?auto_17862 ) ( ON ?auto_17864 ?auto_17863 ) ( not ( = ?auto_17862 ?auto_17863 ) ) ( not ( = ?auto_17862 ?auto_17864 ) ) ( not ( = ?auto_17862 ?auto_17865 ) ) ( not ( = ?auto_17862 ?auto_17866 ) ) ( not ( = ?auto_17863 ?auto_17864 ) ) ( not ( = ?auto_17863 ?auto_17865 ) ) ( not ( = ?auto_17863 ?auto_17866 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17864 ?auto_17865 ?auto_17866 )
      ( MAKE-4CRATE-VERIFY ?auto_17862 ?auto_17863 ?auto_17864 ?auto_17865 ?auto_17866 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17872 - SURFACE
      ?auto_17873 - SURFACE
      ?auto_17874 - SURFACE
      ?auto_17875 - SURFACE
      ?auto_17876 - SURFACE
      ?auto_17877 - SURFACE
    )
    :vars
    (
      ?auto_17878 - HOIST
      ?auto_17882 - PLACE
      ?auto_17881 - TRUCK
      ?auto_17879 - PLACE
      ?auto_17880 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17878 ?auto_17882 ) ( SURFACE-AT ?auto_17876 ?auto_17882 ) ( CLEAR ?auto_17876 ) ( IS-CRATE ?auto_17877 ) ( not ( = ?auto_17876 ?auto_17877 ) ) ( AVAILABLE ?auto_17878 ) ( ON ?auto_17876 ?auto_17875 ) ( not ( = ?auto_17875 ?auto_17876 ) ) ( not ( = ?auto_17875 ?auto_17877 ) ) ( TRUCK-AT ?auto_17881 ?auto_17879 ) ( not ( = ?auto_17879 ?auto_17882 ) ) ( HOIST-AT ?auto_17880 ?auto_17879 ) ( LIFTING ?auto_17880 ?auto_17877 ) ( not ( = ?auto_17878 ?auto_17880 ) ) ( ON ?auto_17873 ?auto_17872 ) ( ON ?auto_17874 ?auto_17873 ) ( ON ?auto_17875 ?auto_17874 ) ( not ( = ?auto_17872 ?auto_17873 ) ) ( not ( = ?auto_17872 ?auto_17874 ) ) ( not ( = ?auto_17872 ?auto_17875 ) ) ( not ( = ?auto_17872 ?auto_17876 ) ) ( not ( = ?auto_17872 ?auto_17877 ) ) ( not ( = ?auto_17873 ?auto_17874 ) ) ( not ( = ?auto_17873 ?auto_17875 ) ) ( not ( = ?auto_17873 ?auto_17876 ) ) ( not ( = ?auto_17873 ?auto_17877 ) ) ( not ( = ?auto_17874 ?auto_17875 ) ) ( not ( = ?auto_17874 ?auto_17876 ) ) ( not ( = ?auto_17874 ?auto_17877 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17875 ?auto_17876 ?auto_17877 )
      ( MAKE-5CRATE-VERIFY ?auto_17872 ?auto_17873 ?auto_17874 ?auto_17875 ?auto_17876 ?auto_17877 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17883 - SURFACE
      ?auto_17884 - SURFACE
    )
    :vars
    (
      ?auto_17885 - HOIST
      ?auto_17889 - PLACE
      ?auto_17890 - SURFACE
      ?auto_17888 - TRUCK
      ?auto_17886 - PLACE
      ?auto_17887 - HOIST
      ?auto_17891 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17885 ?auto_17889 ) ( SURFACE-AT ?auto_17883 ?auto_17889 ) ( CLEAR ?auto_17883 ) ( IS-CRATE ?auto_17884 ) ( not ( = ?auto_17883 ?auto_17884 ) ) ( AVAILABLE ?auto_17885 ) ( ON ?auto_17883 ?auto_17890 ) ( not ( = ?auto_17890 ?auto_17883 ) ) ( not ( = ?auto_17890 ?auto_17884 ) ) ( TRUCK-AT ?auto_17888 ?auto_17886 ) ( not ( = ?auto_17886 ?auto_17889 ) ) ( HOIST-AT ?auto_17887 ?auto_17886 ) ( not ( = ?auto_17885 ?auto_17887 ) ) ( AVAILABLE ?auto_17887 ) ( SURFACE-AT ?auto_17884 ?auto_17886 ) ( ON ?auto_17884 ?auto_17891 ) ( CLEAR ?auto_17884 ) ( not ( = ?auto_17883 ?auto_17891 ) ) ( not ( = ?auto_17884 ?auto_17891 ) ) ( not ( = ?auto_17890 ?auto_17891 ) ) )
    :subtasks
    ( ( !LIFT ?auto_17887 ?auto_17884 ?auto_17891 ?auto_17886 )
      ( MAKE-2CRATE ?auto_17890 ?auto_17883 ?auto_17884 )
      ( MAKE-1CRATE-VERIFY ?auto_17883 ?auto_17884 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17892 - SURFACE
      ?auto_17893 - SURFACE
      ?auto_17894 - SURFACE
    )
    :vars
    (
      ?auto_17895 - HOIST
      ?auto_17898 - PLACE
      ?auto_17899 - TRUCK
      ?auto_17896 - PLACE
      ?auto_17897 - HOIST
      ?auto_17900 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17895 ?auto_17898 ) ( SURFACE-AT ?auto_17893 ?auto_17898 ) ( CLEAR ?auto_17893 ) ( IS-CRATE ?auto_17894 ) ( not ( = ?auto_17893 ?auto_17894 ) ) ( AVAILABLE ?auto_17895 ) ( ON ?auto_17893 ?auto_17892 ) ( not ( = ?auto_17892 ?auto_17893 ) ) ( not ( = ?auto_17892 ?auto_17894 ) ) ( TRUCK-AT ?auto_17899 ?auto_17896 ) ( not ( = ?auto_17896 ?auto_17898 ) ) ( HOIST-AT ?auto_17897 ?auto_17896 ) ( not ( = ?auto_17895 ?auto_17897 ) ) ( AVAILABLE ?auto_17897 ) ( SURFACE-AT ?auto_17894 ?auto_17896 ) ( ON ?auto_17894 ?auto_17900 ) ( CLEAR ?auto_17894 ) ( not ( = ?auto_17893 ?auto_17900 ) ) ( not ( = ?auto_17894 ?auto_17900 ) ) ( not ( = ?auto_17892 ?auto_17900 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17893 ?auto_17894 )
      ( MAKE-2CRATE-VERIFY ?auto_17892 ?auto_17893 ?auto_17894 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17901 - SURFACE
      ?auto_17902 - SURFACE
      ?auto_17903 - SURFACE
      ?auto_17904 - SURFACE
    )
    :vars
    (
      ?auto_17907 - HOIST
      ?auto_17909 - PLACE
      ?auto_17908 - TRUCK
      ?auto_17910 - PLACE
      ?auto_17905 - HOIST
      ?auto_17906 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17907 ?auto_17909 ) ( SURFACE-AT ?auto_17903 ?auto_17909 ) ( CLEAR ?auto_17903 ) ( IS-CRATE ?auto_17904 ) ( not ( = ?auto_17903 ?auto_17904 ) ) ( AVAILABLE ?auto_17907 ) ( ON ?auto_17903 ?auto_17902 ) ( not ( = ?auto_17902 ?auto_17903 ) ) ( not ( = ?auto_17902 ?auto_17904 ) ) ( TRUCK-AT ?auto_17908 ?auto_17910 ) ( not ( = ?auto_17910 ?auto_17909 ) ) ( HOIST-AT ?auto_17905 ?auto_17910 ) ( not ( = ?auto_17907 ?auto_17905 ) ) ( AVAILABLE ?auto_17905 ) ( SURFACE-AT ?auto_17904 ?auto_17910 ) ( ON ?auto_17904 ?auto_17906 ) ( CLEAR ?auto_17904 ) ( not ( = ?auto_17903 ?auto_17906 ) ) ( not ( = ?auto_17904 ?auto_17906 ) ) ( not ( = ?auto_17902 ?auto_17906 ) ) ( ON ?auto_17902 ?auto_17901 ) ( not ( = ?auto_17901 ?auto_17902 ) ) ( not ( = ?auto_17901 ?auto_17903 ) ) ( not ( = ?auto_17901 ?auto_17904 ) ) ( not ( = ?auto_17901 ?auto_17906 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17902 ?auto_17903 ?auto_17904 )
      ( MAKE-3CRATE-VERIFY ?auto_17901 ?auto_17902 ?auto_17903 ?auto_17904 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17911 - SURFACE
      ?auto_17912 - SURFACE
      ?auto_17913 - SURFACE
      ?auto_17914 - SURFACE
      ?auto_17915 - SURFACE
    )
    :vars
    (
      ?auto_17918 - HOIST
      ?auto_17920 - PLACE
      ?auto_17919 - TRUCK
      ?auto_17921 - PLACE
      ?auto_17916 - HOIST
      ?auto_17917 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17918 ?auto_17920 ) ( SURFACE-AT ?auto_17914 ?auto_17920 ) ( CLEAR ?auto_17914 ) ( IS-CRATE ?auto_17915 ) ( not ( = ?auto_17914 ?auto_17915 ) ) ( AVAILABLE ?auto_17918 ) ( ON ?auto_17914 ?auto_17913 ) ( not ( = ?auto_17913 ?auto_17914 ) ) ( not ( = ?auto_17913 ?auto_17915 ) ) ( TRUCK-AT ?auto_17919 ?auto_17921 ) ( not ( = ?auto_17921 ?auto_17920 ) ) ( HOIST-AT ?auto_17916 ?auto_17921 ) ( not ( = ?auto_17918 ?auto_17916 ) ) ( AVAILABLE ?auto_17916 ) ( SURFACE-AT ?auto_17915 ?auto_17921 ) ( ON ?auto_17915 ?auto_17917 ) ( CLEAR ?auto_17915 ) ( not ( = ?auto_17914 ?auto_17917 ) ) ( not ( = ?auto_17915 ?auto_17917 ) ) ( not ( = ?auto_17913 ?auto_17917 ) ) ( ON ?auto_17912 ?auto_17911 ) ( ON ?auto_17913 ?auto_17912 ) ( not ( = ?auto_17911 ?auto_17912 ) ) ( not ( = ?auto_17911 ?auto_17913 ) ) ( not ( = ?auto_17911 ?auto_17914 ) ) ( not ( = ?auto_17911 ?auto_17915 ) ) ( not ( = ?auto_17911 ?auto_17917 ) ) ( not ( = ?auto_17912 ?auto_17913 ) ) ( not ( = ?auto_17912 ?auto_17914 ) ) ( not ( = ?auto_17912 ?auto_17915 ) ) ( not ( = ?auto_17912 ?auto_17917 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17913 ?auto_17914 ?auto_17915 )
      ( MAKE-4CRATE-VERIFY ?auto_17911 ?auto_17912 ?auto_17913 ?auto_17914 ?auto_17915 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17922 - SURFACE
      ?auto_17923 - SURFACE
      ?auto_17924 - SURFACE
      ?auto_17925 - SURFACE
      ?auto_17926 - SURFACE
      ?auto_17927 - SURFACE
    )
    :vars
    (
      ?auto_17930 - HOIST
      ?auto_17932 - PLACE
      ?auto_17931 - TRUCK
      ?auto_17933 - PLACE
      ?auto_17928 - HOIST
      ?auto_17929 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17930 ?auto_17932 ) ( SURFACE-AT ?auto_17926 ?auto_17932 ) ( CLEAR ?auto_17926 ) ( IS-CRATE ?auto_17927 ) ( not ( = ?auto_17926 ?auto_17927 ) ) ( AVAILABLE ?auto_17930 ) ( ON ?auto_17926 ?auto_17925 ) ( not ( = ?auto_17925 ?auto_17926 ) ) ( not ( = ?auto_17925 ?auto_17927 ) ) ( TRUCK-AT ?auto_17931 ?auto_17933 ) ( not ( = ?auto_17933 ?auto_17932 ) ) ( HOIST-AT ?auto_17928 ?auto_17933 ) ( not ( = ?auto_17930 ?auto_17928 ) ) ( AVAILABLE ?auto_17928 ) ( SURFACE-AT ?auto_17927 ?auto_17933 ) ( ON ?auto_17927 ?auto_17929 ) ( CLEAR ?auto_17927 ) ( not ( = ?auto_17926 ?auto_17929 ) ) ( not ( = ?auto_17927 ?auto_17929 ) ) ( not ( = ?auto_17925 ?auto_17929 ) ) ( ON ?auto_17923 ?auto_17922 ) ( ON ?auto_17924 ?auto_17923 ) ( ON ?auto_17925 ?auto_17924 ) ( not ( = ?auto_17922 ?auto_17923 ) ) ( not ( = ?auto_17922 ?auto_17924 ) ) ( not ( = ?auto_17922 ?auto_17925 ) ) ( not ( = ?auto_17922 ?auto_17926 ) ) ( not ( = ?auto_17922 ?auto_17927 ) ) ( not ( = ?auto_17922 ?auto_17929 ) ) ( not ( = ?auto_17923 ?auto_17924 ) ) ( not ( = ?auto_17923 ?auto_17925 ) ) ( not ( = ?auto_17923 ?auto_17926 ) ) ( not ( = ?auto_17923 ?auto_17927 ) ) ( not ( = ?auto_17923 ?auto_17929 ) ) ( not ( = ?auto_17924 ?auto_17925 ) ) ( not ( = ?auto_17924 ?auto_17926 ) ) ( not ( = ?auto_17924 ?auto_17927 ) ) ( not ( = ?auto_17924 ?auto_17929 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17925 ?auto_17926 ?auto_17927 )
      ( MAKE-5CRATE-VERIFY ?auto_17922 ?auto_17923 ?auto_17924 ?auto_17925 ?auto_17926 ?auto_17927 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17934 - SURFACE
      ?auto_17935 - SURFACE
    )
    :vars
    (
      ?auto_17938 - HOIST
      ?auto_17940 - PLACE
      ?auto_17942 - SURFACE
      ?auto_17941 - PLACE
      ?auto_17936 - HOIST
      ?auto_17937 - SURFACE
      ?auto_17939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17938 ?auto_17940 ) ( SURFACE-AT ?auto_17934 ?auto_17940 ) ( CLEAR ?auto_17934 ) ( IS-CRATE ?auto_17935 ) ( not ( = ?auto_17934 ?auto_17935 ) ) ( AVAILABLE ?auto_17938 ) ( ON ?auto_17934 ?auto_17942 ) ( not ( = ?auto_17942 ?auto_17934 ) ) ( not ( = ?auto_17942 ?auto_17935 ) ) ( not ( = ?auto_17941 ?auto_17940 ) ) ( HOIST-AT ?auto_17936 ?auto_17941 ) ( not ( = ?auto_17938 ?auto_17936 ) ) ( AVAILABLE ?auto_17936 ) ( SURFACE-AT ?auto_17935 ?auto_17941 ) ( ON ?auto_17935 ?auto_17937 ) ( CLEAR ?auto_17935 ) ( not ( = ?auto_17934 ?auto_17937 ) ) ( not ( = ?auto_17935 ?auto_17937 ) ) ( not ( = ?auto_17942 ?auto_17937 ) ) ( TRUCK-AT ?auto_17939 ?auto_17940 ) )
    :subtasks
    ( ( !DRIVE ?auto_17939 ?auto_17940 ?auto_17941 )
      ( MAKE-2CRATE ?auto_17942 ?auto_17934 ?auto_17935 )
      ( MAKE-1CRATE-VERIFY ?auto_17934 ?auto_17935 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17943 - SURFACE
      ?auto_17944 - SURFACE
      ?auto_17945 - SURFACE
    )
    :vars
    (
      ?auto_17950 - HOIST
      ?auto_17946 - PLACE
      ?auto_17951 - PLACE
      ?auto_17947 - HOIST
      ?auto_17948 - SURFACE
      ?auto_17949 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17950 ?auto_17946 ) ( SURFACE-AT ?auto_17944 ?auto_17946 ) ( CLEAR ?auto_17944 ) ( IS-CRATE ?auto_17945 ) ( not ( = ?auto_17944 ?auto_17945 ) ) ( AVAILABLE ?auto_17950 ) ( ON ?auto_17944 ?auto_17943 ) ( not ( = ?auto_17943 ?auto_17944 ) ) ( not ( = ?auto_17943 ?auto_17945 ) ) ( not ( = ?auto_17951 ?auto_17946 ) ) ( HOIST-AT ?auto_17947 ?auto_17951 ) ( not ( = ?auto_17950 ?auto_17947 ) ) ( AVAILABLE ?auto_17947 ) ( SURFACE-AT ?auto_17945 ?auto_17951 ) ( ON ?auto_17945 ?auto_17948 ) ( CLEAR ?auto_17945 ) ( not ( = ?auto_17944 ?auto_17948 ) ) ( not ( = ?auto_17945 ?auto_17948 ) ) ( not ( = ?auto_17943 ?auto_17948 ) ) ( TRUCK-AT ?auto_17949 ?auto_17946 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17944 ?auto_17945 )
      ( MAKE-2CRATE-VERIFY ?auto_17943 ?auto_17944 ?auto_17945 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17952 - SURFACE
      ?auto_17953 - SURFACE
      ?auto_17954 - SURFACE
      ?auto_17955 - SURFACE
    )
    :vars
    (
      ?auto_17960 - HOIST
      ?auto_17959 - PLACE
      ?auto_17957 - PLACE
      ?auto_17961 - HOIST
      ?auto_17956 - SURFACE
      ?auto_17958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17960 ?auto_17959 ) ( SURFACE-AT ?auto_17954 ?auto_17959 ) ( CLEAR ?auto_17954 ) ( IS-CRATE ?auto_17955 ) ( not ( = ?auto_17954 ?auto_17955 ) ) ( AVAILABLE ?auto_17960 ) ( ON ?auto_17954 ?auto_17953 ) ( not ( = ?auto_17953 ?auto_17954 ) ) ( not ( = ?auto_17953 ?auto_17955 ) ) ( not ( = ?auto_17957 ?auto_17959 ) ) ( HOIST-AT ?auto_17961 ?auto_17957 ) ( not ( = ?auto_17960 ?auto_17961 ) ) ( AVAILABLE ?auto_17961 ) ( SURFACE-AT ?auto_17955 ?auto_17957 ) ( ON ?auto_17955 ?auto_17956 ) ( CLEAR ?auto_17955 ) ( not ( = ?auto_17954 ?auto_17956 ) ) ( not ( = ?auto_17955 ?auto_17956 ) ) ( not ( = ?auto_17953 ?auto_17956 ) ) ( TRUCK-AT ?auto_17958 ?auto_17959 ) ( ON ?auto_17953 ?auto_17952 ) ( not ( = ?auto_17952 ?auto_17953 ) ) ( not ( = ?auto_17952 ?auto_17954 ) ) ( not ( = ?auto_17952 ?auto_17955 ) ) ( not ( = ?auto_17952 ?auto_17956 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17953 ?auto_17954 ?auto_17955 )
      ( MAKE-3CRATE-VERIFY ?auto_17952 ?auto_17953 ?auto_17954 ?auto_17955 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17962 - SURFACE
      ?auto_17963 - SURFACE
      ?auto_17964 - SURFACE
      ?auto_17965 - SURFACE
      ?auto_17966 - SURFACE
    )
    :vars
    (
      ?auto_17971 - HOIST
      ?auto_17970 - PLACE
      ?auto_17968 - PLACE
      ?auto_17972 - HOIST
      ?auto_17967 - SURFACE
      ?auto_17969 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17971 ?auto_17970 ) ( SURFACE-AT ?auto_17965 ?auto_17970 ) ( CLEAR ?auto_17965 ) ( IS-CRATE ?auto_17966 ) ( not ( = ?auto_17965 ?auto_17966 ) ) ( AVAILABLE ?auto_17971 ) ( ON ?auto_17965 ?auto_17964 ) ( not ( = ?auto_17964 ?auto_17965 ) ) ( not ( = ?auto_17964 ?auto_17966 ) ) ( not ( = ?auto_17968 ?auto_17970 ) ) ( HOIST-AT ?auto_17972 ?auto_17968 ) ( not ( = ?auto_17971 ?auto_17972 ) ) ( AVAILABLE ?auto_17972 ) ( SURFACE-AT ?auto_17966 ?auto_17968 ) ( ON ?auto_17966 ?auto_17967 ) ( CLEAR ?auto_17966 ) ( not ( = ?auto_17965 ?auto_17967 ) ) ( not ( = ?auto_17966 ?auto_17967 ) ) ( not ( = ?auto_17964 ?auto_17967 ) ) ( TRUCK-AT ?auto_17969 ?auto_17970 ) ( ON ?auto_17963 ?auto_17962 ) ( ON ?auto_17964 ?auto_17963 ) ( not ( = ?auto_17962 ?auto_17963 ) ) ( not ( = ?auto_17962 ?auto_17964 ) ) ( not ( = ?auto_17962 ?auto_17965 ) ) ( not ( = ?auto_17962 ?auto_17966 ) ) ( not ( = ?auto_17962 ?auto_17967 ) ) ( not ( = ?auto_17963 ?auto_17964 ) ) ( not ( = ?auto_17963 ?auto_17965 ) ) ( not ( = ?auto_17963 ?auto_17966 ) ) ( not ( = ?auto_17963 ?auto_17967 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17964 ?auto_17965 ?auto_17966 )
      ( MAKE-4CRATE-VERIFY ?auto_17962 ?auto_17963 ?auto_17964 ?auto_17965 ?auto_17966 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17973 - SURFACE
      ?auto_17974 - SURFACE
      ?auto_17975 - SURFACE
      ?auto_17976 - SURFACE
      ?auto_17977 - SURFACE
      ?auto_17978 - SURFACE
    )
    :vars
    (
      ?auto_17983 - HOIST
      ?auto_17982 - PLACE
      ?auto_17980 - PLACE
      ?auto_17984 - HOIST
      ?auto_17979 - SURFACE
      ?auto_17981 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17983 ?auto_17982 ) ( SURFACE-AT ?auto_17977 ?auto_17982 ) ( CLEAR ?auto_17977 ) ( IS-CRATE ?auto_17978 ) ( not ( = ?auto_17977 ?auto_17978 ) ) ( AVAILABLE ?auto_17983 ) ( ON ?auto_17977 ?auto_17976 ) ( not ( = ?auto_17976 ?auto_17977 ) ) ( not ( = ?auto_17976 ?auto_17978 ) ) ( not ( = ?auto_17980 ?auto_17982 ) ) ( HOIST-AT ?auto_17984 ?auto_17980 ) ( not ( = ?auto_17983 ?auto_17984 ) ) ( AVAILABLE ?auto_17984 ) ( SURFACE-AT ?auto_17978 ?auto_17980 ) ( ON ?auto_17978 ?auto_17979 ) ( CLEAR ?auto_17978 ) ( not ( = ?auto_17977 ?auto_17979 ) ) ( not ( = ?auto_17978 ?auto_17979 ) ) ( not ( = ?auto_17976 ?auto_17979 ) ) ( TRUCK-AT ?auto_17981 ?auto_17982 ) ( ON ?auto_17974 ?auto_17973 ) ( ON ?auto_17975 ?auto_17974 ) ( ON ?auto_17976 ?auto_17975 ) ( not ( = ?auto_17973 ?auto_17974 ) ) ( not ( = ?auto_17973 ?auto_17975 ) ) ( not ( = ?auto_17973 ?auto_17976 ) ) ( not ( = ?auto_17973 ?auto_17977 ) ) ( not ( = ?auto_17973 ?auto_17978 ) ) ( not ( = ?auto_17973 ?auto_17979 ) ) ( not ( = ?auto_17974 ?auto_17975 ) ) ( not ( = ?auto_17974 ?auto_17976 ) ) ( not ( = ?auto_17974 ?auto_17977 ) ) ( not ( = ?auto_17974 ?auto_17978 ) ) ( not ( = ?auto_17974 ?auto_17979 ) ) ( not ( = ?auto_17975 ?auto_17976 ) ) ( not ( = ?auto_17975 ?auto_17977 ) ) ( not ( = ?auto_17975 ?auto_17978 ) ) ( not ( = ?auto_17975 ?auto_17979 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17976 ?auto_17977 ?auto_17978 )
      ( MAKE-5CRATE-VERIFY ?auto_17973 ?auto_17974 ?auto_17975 ?auto_17976 ?auto_17977 ?auto_17978 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17985 - SURFACE
      ?auto_17986 - SURFACE
    )
    :vars
    (
      ?auto_17991 - HOIST
      ?auto_17990 - PLACE
      ?auto_17993 - SURFACE
      ?auto_17988 - PLACE
      ?auto_17992 - HOIST
      ?auto_17987 - SURFACE
      ?auto_17989 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17991 ?auto_17990 ) ( IS-CRATE ?auto_17986 ) ( not ( = ?auto_17985 ?auto_17986 ) ) ( not ( = ?auto_17993 ?auto_17985 ) ) ( not ( = ?auto_17993 ?auto_17986 ) ) ( not ( = ?auto_17988 ?auto_17990 ) ) ( HOIST-AT ?auto_17992 ?auto_17988 ) ( not ( = ?auto_17991 ?auto_17992 ) ) ( AVAILABLE ?auto_17992 ) ( SURFACE-AT ?auto_17986 ?auto_17988 ) ( ON ?auto_17986 ?auto_17987 ) ( CLEAR ?auto_17986 ) ( not ( = ?auto_17985 ?auto_17987 ) ) ( not ( = ?auto_17986 ?auto_17987 ) ) ( not ( = ?auto_17993 ?auto_17987 ) ) ( TRUCK-AT ?auto_17989 ?auto_17990 ) ( SURFACE-AT ?auto_17993 ?auto_17990 ) ( CLEAR ?auto_17993 ) ( LIFTING ?auto_17991 ?auto_17985 ) ( IS-CRATE ?auto_17985 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17993 ?auto_17985 )
      ( MAKE-2CRATE ?auto_17993 ?auto_17985 ?auto_17986 )
      ( MAKE-1CRATE-VERIFY ?auto_17985 ?auto_17986 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17994 - SURFACE
      ?auto_17995 - SURFACE
      ?auto_17996 - SURFACE
    )
    :vars
    (
      ?auto_18001 - HOIST
      ?auto_17997 - PLACE
      ?auto_18002 - PLACE
      ?auto_17999 - HOIST
      ?auto_17998 - SURFACE
      ?auto_18000 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18001 ?auto_17997 ) ( IS-CRATE ?auto_17996 ) ( not ( = ?auto_17995 ?auto_17996 ) ) ( not ( = ?auto_17994 ?auto_17995 ) ) ( not ( = ?auto_17994 ?auto_17996 ) ) ( not ( = ?auto_18002 ?auto_17997 ) ) ( HOIST-AT ?auto_17999 ?auto_18002 ) ( not ( = ?auto_18001 ?auto_17999 ) ) ( AVAILABLE ?auto_17999 ) ( SURFACE-AT ?auto_17996 ?auto_18002 ) ( ON ?auto_17996 ?auto_17998 ) ( CLEAR ?auto_17996 ) ( not ( = ?auto_17995 ?auto_17998 ) ) ( not ( = ?auto_17996 ?auto_17998 ) ) ( not ( = ?auto_17994 ?auto_17998 ) ) ( TRUCK-AT ?auto_18000 ?auto_17997 ) ( SURFACE-AT ?auto_17994 ?auto_17997 ) ( CLEAR ?auto_17994 ) ( LIFTING ?auto_18001 ?auto_17995 ) ( IS-CRATE ?auto_17995 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17995 ?auto_17996 )
      ( MAKE-2CRATE-VERIFY ?auto_17994 ?auto_17995 ?auto_17996 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18003 - SURFACE
      ?auto_18004 - SURFACE
      ?auto_18005 - SURFACE
      ?auto_18006 - SURFACE
    )
    :vars
    (
      ?auto_18010 - HOIST
      ?auto_18011 - PLACE
      ?auto_18012 - PLACE
      ?auto_18009 - HOIST
      ?auto_18007 - SURFACE
      ?auto_18008 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18010 ?auto_18011 ) ( IS-CRATE ?auto_18006 ) ( not ( = ?auto_18005 ?auto_18006 ) ) ( not ( = ?auto_18004 ?auto_18005 ) ) ( not ( = ?auto_18004 ?auto_18006 ) ) ( not ( = ?auto_18012 ?auto_18011 ) ) ( HOIST-AT ?auto_18009 ?auto_18012 ) ( not ( = ?auto_18010 ?auto_18009 ) ) ( AVAILABLE ?auto_18009 ) ( SURFACE-AT ?auto_18006 ?auto_18012 ) ( ON ?auto_18006 ?auto_18007 ) ( CLEAR ?auto_18006 ) ( not ( = ?auto_18005 ?auto_18007 ) ) ( not ( = ?auto_18006 ?auto_18007 ) ) ( not ( = ?auto_18004 ?auto_18007 ) ) ( TRUCK-AT ?auto_18008 ?auto_18011 ) ( SURFACE-AT ?auto_18004 ?auto_18011 ) ( CLEAR ?auto_18004 ) ( LIFTING ?auto_18010 ?auto_18005 ) ( IS-CRATE ?auto_18005 ) ( ON ?auto_18004 ?auto_18003 ) ( not ( = ?auto_18003 ?auto_18004 ) ) ( not ( = ?auto_18003 ?auto_18005 ) ) ( not ( = ?auto_18003 ?auto_18006 ) ) ( not ( = ?auto_18003 ?auto_18007 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18004 ?auto_18005 ?auto_18006 )
      ( MAKE-3CRATE-VERIFY ?auto_18003 ?auto_18004 ?auto_18005 ?auto_18006 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18013 - SURFACE
      ?auto_18014 - SURFACE
      ?auto_18015 - SURFACE
      ?auto_18016 - SURFACE
      ?auto_18017 - SURFACE
    )
    :vars
    (
      ?auto_18021 - HOIST
      ?auto_18022 - PLACE
      ?auto_18023 - PLACE
      ?auto_18020 - HOIST
      ?auto_18018 - SURFACE
      ?auto_18019 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18021 ?auto_18022 ) ( IS-CRATE ?auto_18017 ) ( not ( = ?auto_18016 ?auto_18017 ) ) ( not ( = ?auto_18015 ?auto_18016 ) ) ( not ( = ?auto_18015 ?auto_18017 ) ) ( not ( = ?auto_18023 ?auto_18022 ) ) ( HOIST-AT ?auto_18020 ?auto_18023 ) ( not ( = ?auto_18021 ?auto_18020 ) ) ( AVAILABLE ?auto_18020 ) ( SURFACE-AT ?auto_18017 ?auto_18023 ) ( ON ?auto_18017 ?auto_18018 ) ( CLEAR ?auto_18017 ) ( not ( = ?auto_18016 ?auto_18018 ) ) ( not ( = ?auto_18017 ?auto_18018 ) ) ( not ( = ?auto_18015 ?auto_18018 ) ) ( TRUCK-AT ?auto_18019 ?auto_18022 ) ( SURFACE-AT ?auto_18015 ?auto_18022 ) ( CLEAR ?auto_18015 ) ( LIFTING ?auto_18021 ?auto_18016 ) ( IS-CRATE ?auto_18016 ) ( ON ?auto_18014 ?auto_18013 ) ( ON ?auto_18015 ?auto_18014 ) ( not ( = ?auto_18013 ?auto_18014 ) ) ( not ( = ?auto_18013 ?auto_18015 ) ) ( not ( = ?auto_18013 ?auto_18016 ) ) ( not ( = ?auto_18013 ?auto_18017 ) ) ( not ( = ?auto_18013 ?auto_18018 ) ) ( not ( = ?auto_18014 ?auto_18015 ) ) ( not ( = ?auto_18014 ?auto_18016 ) ) ( not ( = ?auto_18014 ?auto_18017 ) ) ( not ( = ?auto_18014 ?auto_18018 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18015 ?auto_18016 ?auto_18017 )
      ( MAKE-4CRATE-VERIFY ?auto_18013 ?auto_18014 ?auto_18015 ?auto_18016 ?auto_18017 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18024 - SURFACE
      ?auto_18025 - SURFACE
      ?auto_18026 - SURFACE
      ?auto_18027 - SURFACE
      ?auto_18028 - SURFACE
      ?auto_18029 - SURFACE
    )
    :vars
    (
      ?auto_18033 - HOIST
      ?auto_18034 - PLACE
      ?auto_18035 - PLACE
      ?auto_18032 - HOIST
      ?auto_18030 - SURFACE
      ?auto_18031 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18033 ?auto_18034 ) ( IS-CRATE ?auto_18029 ) ( not ( = ?auto_18028 ?auto_18029 ) ) ( not ( = ?auto_18027 ?auto_18028 ) ) ( not ( = ?auto_18027 ?auto_18029 ) ) ( not ( = ?auto_18035 ?auto_18034 ) ) ( HOIST-AT ?auto_18032 ?auto_18035 ) ( not ( = ?auto_18033 ?auto_18032 ) ) ( AVAILABLE ?auto_18032 ) ( SURFACE-AT ?auto_18029 ?auto_18035 ) ( ON ?auto_18029 ?auto_18030 ) ( CLEAR ?auto_18029 ) ( not ( = ?auto_18028 ?auto_18030 ) ) ( not ( = ?auto_18029 ?auto_18030 ) ) ( not ( = ?auto_18027 ?auto_18030 ) ) ( TRUCK-AT ?auto_18031 ?auto_18034 ) ( SURFACE-AT ?auto_18027 ?auto_18034 ) ( CLEAR ?auto_18027 ) ( LIFTING ?auto_18033 ?auto_18028 ) ( IS-CRATE ?auto_18028 ) ( ON ?auto_18025 ?auto_18024 ) ( ON ?auto_18026 ?auto_18025 ) ( ON ?auto_18027 ?auto_18026 ) ( not ( = ?auto_18024 ?auto_18025 ) ) ( not ( = ?auto_18024 ?auto_18026 ) ) ( not ( = ?auto_18024 ?auto_18027 ) ) ( not ( = ?auto_18024 ?auto_18028 ) ) ( not ( = ?auto_18024 ?auto_18029 ) ) ( not ( = ?auto_18024 ?auto_18030 ) ) ( not ( = ?auto_18025 ?auto_18026 ) ) ( not ( = ?auto_18025 ?auto_18027 ) ) ( not ( = ?auto_18025 ?auto_18028 ) ) ( not ( = ?auto_18025 ?auto_18029 ) ) ( not ( = ?auto_18025 ?auto_18030 ) ) ( not ( = ?auto_18026 ?auto_18027 ) ) ( not ( = ?auto_18026 ?auto_18028 ) ) ( not ( = ?auto_18026 ?auto_18029 ) ) ( not ( = ?auto_18026 ?auto_18030 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18027 ?auto_18028 ?auto_18029 )
      ( MAKE-5CRATE-VERIFY ?auto_18024 ?auto_18025 ?auto_18026 ?auto_18027 ?auto_18028 ?auto_18029 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18036 - SURFACE
      ?auto_18037 - SURFACE
    )
    :vars
    (
      ?auto_18041 - HOIST
      ?auto_18042 - PLACE
      ?auto_18044 - SURFACE
      ?auto_18043 - PLACE
      ?auto_18040 - HOIST
      ?auto_18038 - SURFACE
      ?auto_18039 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18041 ?auto_18042 ) ( IS-CRATE ?auto_18037 ) ( not ( = ?auto_18036 ?auto_18037 ) ) ( not ( = ?auto_18044 ?auto_18036 ) ) ( not ( = ?auto_18044 ?auto_18037 ) ) ( not ( = ?auto_18043 ?auto_18042 ) ) ( HOIST-AT ?auto_18040 ?auto_18043 ) ( not ( = ?auto_18041 ?auto_18040 ) ) ( AVAILABLE ?auto_18040 ) ( SURFACE-AT ?auto_18037 ?auto_18043 ) ( ON ?auto_18037 ?auto_18038 ) ( CLEAR ?auto_18037 ) ( not ( = ?auto_18036 ?auto_18038 ) ) ( not ( = ?auto_18037 ?auto_18038 ) ) ( not ( = ?auto_18044 ?auto_18038 ) ) ( TRUCK-AT ?auto_18039 ?auto_18042 ) ( SURFACE-AT ?auto_18044 ?auto_18042 ) ( CLEAR ?auto_18044 ) ( IS-CRATE ?auto_18036 ) ( AVAILABLE ?auto_18041 ) ( IN ?auto_18036 ?auto_18039 ) )
    :subtasks
    ( ( !UNLOAD ?auto_18041 ?auto_18036 ?auto_18039 ?auto_18042 )
      ( MAKE-2CRATE ?auto_18044 ?auto_18036 ?auto_18037 )
      ( MAKE-1CRATE-VERIFY ?auto_18036 ?auto_18037 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18045 - SURFACE
      ?auto_18046 - SURFACE
      ?auto_18047 - SURFACE
    )
    :vars
    (
      ?auto_18050 - HOIST
      ?auto_18049 - PLACE
      ?auto_18053 - PLACE
      ?auto_18052 - HOIST
      ?auto_18051 - SURFACE
      ?auto_18048 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18050 ?auto_18049 ) ( IS-CRATE ?auto_18047 ) ( not ( = ?auto_18046 ?auto_18047 ) ) ( not ( = ?auto_18045 ?auto_18046 ) ) ( not ( = ?auto_18045 ?auto_18047 ) ) ( not ( = ?auto_18053 ?auto_18049 ) ) ( HOIST-AT ?auto_18052 ?auto_18053 ) ( not ( = ?auto_18050 ?auto_18052 ) ) ( AVAILABLE ?auto_18052 ) ( SURFACE-AT ?auto_18047 ?auto_18053 ) ( ON ?auto_18047 ?auto_18051 ) ( CLEAR ?auto_18047 ) ( not ( = ?auto_18046 ?auto_18051 ) ) ( not ( = ?auto_18047 ?auto_18051 ) ) ( not ( = ?auto_18045 ?auto_18051 ) ) ( TRUCK-AT ?auto_18048 ?auto_18049 ) ( SURFACE-AT ?auto_18045 ?auto_18049 ) ( CLEAR ?auto_18045 ) ( IS-CRATE ?auto_18046 ) ( AVAILABLE ?auto_18050 ) ( IN ?auto_18046 ?auto_18048 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18046 ?auto_18047 )
      ( MAKE-2CRATE-VERIFY ?auto_18045 ?auto_18046 ?auto_18047 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18054 - SURFACE
      ?auto_18055 - SURFACE
      ?auto_18056 - SURFACE
      ?auto_18057 - SURFACE
    )
    :vars
    (
      ?auto_18060 - HOIST
      ?auto_18063 - PLACE
      ?auto_18059 - PLACE
      ?auto_18061 - HOIST
      ?auto_18062 - SURFACE
      ?auto_18058 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18060 ?auto_18063 ) ( IS-CRATE ?auto_18057 ) ( not ( = ?auto_18056 ?auto_18057 ) ) ( not ( = ?auto_18055 ?auto_18056 ) ) ( not ( = ?auto_18055 ?auto_18057 ) ) ( not ( = ?auto_18059 ?auto_18063 ) ) ( HOIST-AT ?auto_18061 ?auto_18059 ) ( not ( = ?auto_18060 ?auto_18061 ) ) ( AVAILABLE ?auto_18061 ) ( SURFACE-AT ?auto_18057 ?auto_18059 ) ( ON ?auto_18057 ?auto_18062 ) ( CLEAR ?auto_18057 ) ( not ( = ?auto_18056 ?auto_18062 ) ) ( not ( = ?auto_18057 ?auto_18062 ) ) ( not ( = ?auto_18055 ?auto_18062 ) ) ( TRUCK-AT ?auto_18058 ?auto_18063 ) ( SURFACE-AT ?auto_18055 ?auto_18063 ) ( CLEAR ?auto_18055 ) ( IS-CRATE ?auto_18056 ) ( AVAILABLE ?auto_18060 ) ( IN ?auto_18056 ?auto_18058 ) ( ON ?auto_18055 ?auto_18054 ) ( not ( = ?auto_18054 ?auto_18055 ) ) ( not ( = ?auto_18054 ?auto_18056 ) ) ( not ( = ?auto_18054 ?auto_18057 ) ) ( not ( = ?auto_18054 ?auto_18062 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18055 ?auto_18056 ?auto_18057 )
      ( MAKE-3CRATE-VERIFY ?auto_18054 ?auto_18055 ?auto_18056 ?auto_18057 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18064 - SURFACE
      ?auto_18065 - SURFACE
      ?auto_18066 - SURFACE
      ?auto_18067 - SURFACE
      ?auto_18068 - SURFACE
    )
    :vars
    (
      ?auto_18071 - HOIST
      ?auto_18074 - PLACE
      ?auto_18070 - PLACE
      ?auto_18072 - HOIST
      ?auto_18073 - SURFACE
      ?auto_18069 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18071 ?auto_18074 ) ( IS-CRATE ?auto_18068 ) ( not ( = ?auto_18067 ?auto_18068 ) ) ( not ( = ?auto_18066 ?auto_18067 ) ) ( not ( = ?auto_18066 ?auto_18068 ) ) ( not ( = ?auto_18070 ?auto_18074 ) ) ( HOIST-AT ?auto_18072 ?auto_18070 ) ( not ( = ?auto_18071 ?auto_18072 ) ) ( AVAILABLE ?auto_18072 ) ( SURFACE-AT ?auto_18068 ?auto_18070 ) ( ON ?auto_18068 ?auto_18073 ) ( CLEAR ?auto_18068 ) ( not ( = ?auto_18067 ?auto_18073 ) ) ( not ( = ?auto_18068 ?auto_18073 ) ) ( not ( = ?auto_18066 ?auto_18073 ) ) ( TRUCK-AT ?auto_18069 ?auto_18074 ) ( SURFACE-AT ?auto_18066 ?auto_18074 ) ( CLEAR ?auto_18066 ) ( IS-CRATE ?auto_18067 ) ( AVAILABLE ?auto_18071 ) ( IN ?auto_18067 ?auto_18069 ) ( ON ?auto_18065 ?auto_18064 ) ( ON ?auto_18066 ?auto_18065 ) ( not ( = ?auto_18064 ?auto_18065 ) ) ( not ( = ?auto_18064 ?auto_18066 ) ) ( not ( = ?auto_18064 ?auto_18067 ) ) ( not ( = ?auto_18064 ?auto_18068 ) ) ( not ( = ?auto_18064 ?auto_18073 ) ) ( not ( = ?auto_18065 ?auto_18066 ) ) ( not ( = ?auto_18065 ?auto_18067 ) ) ( not ( = ?auto_18065 ?auto_18068 ) ) ( not ( = ?auto_18065 ?auto_18073 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18066 ?auto_18067 ?auto_18068 )
      ( MAKE-4CRATE-VERIFY ?auto_18064 ?auto_18065 ?auto_18066 ?auto_18067 ?auto_18068 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18075 - SURFACE
      ?auto_18076 - SURFACE
      ?auto_18077 - SURFACE
      ?auto_18078 - SURFACE
      ?auto_18079 - SURFACE
      ?auto_18080 - SURFACE
    )
    :vars
    (
      ?auto_18083 - HOIST
      ?auto_18086 - PLACE
      ?auto_18082 - PLACE
      ?auto_18084 - HOIST
      ?auto_18085 - SURFACE
      ?auto_18081 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18083 ?auto_18086 ) ( IS-CRATE ?auto_18080 ) ( not ( = ?auto_18079 ?auto_18080 ) ) ( not ( = ?auto_18078 ?auto_18079 ) ) ( not ( = ?auto_18078 ?auto_18080 ) ) ( not ( = ?auto_18082 ?auto_18086 ) ) ( HOIST-AT ?auto_18084 ?auto_18082 ) ( not ( = ?auto_18083 ?auto_18084 ) ) ( AVAILABLE ?auto_18084 ) ( SURFACE-AT ?auto_18080 ?auto_18082 ) ( ON ?auto_18080 ?auto_18085 ) ( CLEAR ?auto_18080 ) ( not ( = ?auto_18079 ?auto_18085 ) ) ( not ( = ?auto_18080 ?auto_18085 ) ) ( not ( = ?auto_18078 ?auto_18085 ) ) ( TRUCK-AT ?auto_18081 ?auto_18086 ) ( SURFACE-AT ?auto_18078 ?auto_18086 ) ( CLEAR ?auto_18078 ) ( IS-CRATE ?auto_18079 ) ( AVAILABLE ?auto_18083 ) ( IN ?auto_18079 ?auto_18081 ) ( ON ?auto_18076 ?auto_18075 ) ( ON ?auto_18077 ?auto_18076 ) ( ON ?auto_18078 ?auto_18077 ) ( not ( = ?auto_18075 ?auto_18076 ) ) ( not ( = ?auto_18075 ?auto_18077 ) ) ( not ( = ?auto_18075 ?auto_18078 ) ) ( not ( = ?auto_18075 ?auto_18079 ) ) ( not ( = ?auto_18075 ?auto_18080 ) ) ( not ( = ?auto_18075 ?auto_18085 ) ) ( not ( = ?auto_18076 ?auto_18077 ) ) ( not ( = ?auto_18076 ?auto_18078 ) ) ( not ( = ?auto_18076 ?auto_18079 ) ) ( not ( = ?auto_18076 ?auto_18080 ) ) ( not ( = ?auto_18076 ?auto_18085 ) ) ( not ( = ?auto_18077 ?auto_18078 ) ) ( not ( = ?auto_18077 ?auto_18079 ) ) ( not ( = ?auto_18077 ?auto_18080 ) ) ( not ( = ?auto_18077 ?auto_18085 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18078 ?auto_18079 ?auto_18080 )
      ( MAKE-5CRATE-VERIFY ?auto_18075 ?auto_18076 ?auto_18077 ?auto_18078 ?auto_18079 ?auto_18080 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18087 - SURFACE
      ?auto_18088 - SURFACE
    )
    :vars
    (
      ?auto_18091 - HOIST
      ?auto_18094 - PLACE
      ?auto_18095 - SURFACE
      ?auto_18090 - PLACE
      ?auto_18092 - HOIST
      ?auto_18093 - SURFACE
      ?auto_18089 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18091 ?auto_18094 ) ( IS-CRATE ?auto_18088 ) ( not ( = ?auto_18087 ?auto_18088 ) ) ( not ( = ?auto_18095 ?auto_18087 ) ) ( not ( = ?auto_18095 ?auto_18088 ) ) ( not ( = ?auto_18090 ?auto_18094 ) ) ( HOIST-AT ?auto_18092 ?auto_18090 ) ( not ( = ?auto_18091 ?auto_18092 ) ) ( AVAILABLE ?auto_18092 ) ( SURFACE-AT ?auto_18088 ?auto_18090 ) ( ON ?auto_18088 ?auto_18093 ) ( CLEAR ?auto_18088 ) ( not ( = ?auto_18087 ?auto_18093 ) ) ( not ( = ?auto_18088 ?auto_18093 ) ) ( not ( = ?auto_18095 ?auto_18093 ) ) ( SURFACE-AT ?auto_18095 ?auto_18094 ) ( CLEAR ?auto_18095 ) ( IS-CRATE ?auto_18087 ) ( AVAILABLE ?auto_18091 ) ( IN ?auto_18087 ?auto_18089 ) ( TRUCK-AT ?auto_18089 ?auto_18090 ) )
    :subtasks
    ( ( !DRIVE ?auto_18089 ?auto_18090 ?auto_18094 )
      ( MAKE-2CRATE ?auto_18095 ?auto_18087 ?auto_18088 )
      ( MAKE-1CRATE-VERIFY ?auto_18087 ?auto_18088 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18096 - SURFACE
      ?auto_18097 - SURFACE
      ?auto_18098 - SURFACE
    )
    :vars
    (
      ?auto_18099 - HOIST
      ?auto_18101 - PLACE
      ?auto_18103 - PLACE
      ?auto_18102 - HOIST
      ?auto_18100 - SURFACE
      ?auto_18104 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18099 ?auto_18101 ) ( IS-CRATE ?auto_18098 ) ( not ( = ?auto_18097 ?auto_18098 ) ) ( not ( = ?auto_18096 ?auto_18097 ) ) ( not ( = ?auto_18096 ?auto_18098 ) ) ( not ( = ?auto_18103 ?auto_18101 ) ) ( HOIST-AT ?auto_18102 ?auto_18103 ) ( not ( = ?auto_18099 ?auto_18102 ) ) ( AVAILABLE ?auto_18102 ) ( SURFACE-AT ?auto_18098 ?auto_18103 ) ( ON ?auto_18098 ?auto_18100 ) ( CLEAR ?auto_18098 ) ( not ( = ?auto_18097 ?auto_18100 ) ) ( not ( = ?auto_18098 ?auto_18100 ) ) ( not ( = ?auto_18096 ?auto_18100 ) ) ( SURFACE-AT ?auto_18096 ?auto_18101 ) ( CLEAR ?auto_18096 ) ( IS-CRATE ?auto_18097 ) ( AVAILABLE ?auto_18099 ) ( IN ?auto_18097 ?auto_18104 ) ( TRUCK-AT ?auto_18104 ?auto_18103 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18097 ?auto_18098 )
      ( MAKE-2CRATE-VERIFY ?auto_18096 ?auto_18097 ?auto_18098 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18105 - SURFACE
      ?auto_18106 - SURFACE
      ?auto_18107 - SURFACE
      ?auto_18108 - SURFACE
    )
    :vars
    (
      ?auto_18112 - HOIST
      ?auto_18113 - PLACE
      ?auto_18111 - PLACE
      ?auto_18109 - HOIST
      ?auto_18114 - SURFACE
      ?auto_18110 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18112 ?auto_18113 ) ( IS-CRATE ?auto_18108 ) ( not ( = ?auto_18107 ?auto_18108 ) ) ( not ( = ?auto_18106 ?auto_18107 ) ) ( not ( = ?auto_18106 ?auto_18108 ) ) ( not ( = ?auto_18111 ?auto_18113 ) ) ( HOIST-AT ?auto_18109 ?auto_18111 ) ( not ( = ?auto_18112 ?auto_18109 ) ) ( AVAILABLE ?auto_18109 ) ( SURFACE-AT ?auto_18108 ?auto_18111 ) ( ON ?auto_18108 ?auto_18114 ) ( CLEAR ?auto_18108 ) ( not ( = ?auto_18107 ?auto_18114 ) ) ( not ( = ?auto_18108 ?auto_18114 ) ) ( not ( = ?auto_18106 ?auto_18114 ) ) ( SURFACE-AT ?auto_18106 ?auto_18113 ) ( CLEAR ?auto_18106 ) ( IS-CRATE ?auto_18107 ) ( AVAILABLE ?auto_18112 ) ( IN ?auto_18107 ?auto_18110 ) ( TRUCK-AT ?auto_18110 ?auto_18111 ) ( ON ?auto_18106 ?auto_18105 ) ( not ( = ?auto_18105 ?auto_18106 ) ) ( not ( = ?auto_18105 ?auto_18107 ) ) ( not ( = ?auto_18105 ?auto_18108 ) ) ( not ( = ?auto_18105 ?auto_18114 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18106 ?auto_18107 ?auto_18108 )
      ( MAKE-3CRATE-VERIFY ?auto_18105 ?auto_18106 ?auto_18107 ?auto_18108 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18115 - SURFACE
      ?auto_18116 - SURFACE
      ?auto_18117 - SURFACE
      ?auto_18118 - SURFACE
      ?auto_18119 - SURFACE
    )
    :vars
    (
      ?auto_18123 - HOIST
      ?auto_18124 - PLACE
      ?auto_18122 - PLACE
      ?auto_18120 - HOIST
      ?auto_18125 - SURFACE
      ?auto_18121 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18123 ?auto_18124 ) ( IS-CRATE ?auto_18119 ) ( not ( = ?auto_18118 ?auto_18119 ) ) ( not ( = ?auto_18117 ?auto_18118 ) ) ( not ( = ?auto_18117 ?auto_18119 ) ) ( not ( = ?auto_18122 ?auto_18124 ) ) ( HOIST-AT ?auto_18120 ?auto_18122 ) ( not ( = ?auto_18123 ?auto_18120 ) ) ( AVAILABLE ?auto_18120 ) ( SURFACE-AT ?auto_18119 ?auto_18122 ) ( ON ?auto_18119 ?auto_18125 ) ( CLEAR ?auto_18119 ) ( not ( = ?auto_18118 ?auto_18125 ) ) ( not ( = ?auto_18119 ?auto_18125 ) ) ( not ( = ?auto_18117 ?auto_18125 ) ) ( SURFACE-AT ?auto_18117 ?auto_18124 ) ( CLEAR ?auto_18117 ) ( IS-CRATE ?auto_18118 ) ( AVAILABLE ?auto_18123 ) ( IN ?auto_18118 ?auto_18121 ) ( TRUCK-AT ?auto_18121 ?auto_18122 ) ( ON ?auto_18116 ?auto_18115 ) ( ON ?auto_18117 ?auto_18116 ) ( not ( = ?auto_18115 ?auto_18116 ) ) ( not ( = ?auto_18115 ?auto_18117 ) ) ( not ( = ?auto_18115 ?auto_18118 ) ) ( not ( = ?auto_18115 ?auto_18119 ) ) ( not ( = ?auto_18115 ?auto_18125 ) ) ( not ( = ?auto_18116 ?auto_18117 ) ) ( not ( = ?auto_18116 ?auto_18118 ) ) ( not ( = ?auto_18116 ?auto_18119 ) ) ( not ( = ?auto_18116 ?auto_18125 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18117 ?auto_18118 ?auto_18119 )
      ( MAKE-4CRATE-VERIFY ?auto_18115 ?auto_18116 ?auto_18117 ?auto_18118 ?auto_18119 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18126 - SURFACE
      ?auto_18127 - SURFACE
      ?auto_18128 - SURFACE
      ?auto_18129 - SURFACE
      ?auto_18130 - SURFACE
      ?auto_18131 - SURFACE
    )
    :vars
    (
      ?auto_18135 - HOIST
      ?auto_18136 - PLACE
      ?auto_18134 - PLACE
      ?auto_18132 - HOIST
      ?auto_18137 - SURFACE
      ?auto_18133 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18135 ?auto_18136 ) ( IS-CRATE ?auto_18131 ) ( not ( = ?auto_18130 ?auto_18131 ) ) ( not ( = ?auto_18129 ?auto_18130 ) ) ( not ( = ?auto_18129 ?auto_18131 ) ) ( not ( = ?auto_18134 ?auto_18136 ) ) ( HOIST-AT ?auto_18132 ?auto_18134 ) ( not ( = ?auto_18135 ?auto_18132 ) ) ( AVAILABLE ?auto_18132 ) ( SURFACE-AT ?auto_18131 ?auto_18134 ) ( ON ?auto_18131 ?auto_18137 ) ( CLEAR ?auto_18131 ) ( not ( = ?auto_18130 ?auto_18137 ) ) ( not ( = ?auto_18131 ?auto_18137 ) ) ( not ( = ?auto_18129 ?auto_18137 ) ) ( SURFACE-AT ?auto_18129 ?auto_18136 ) ( CLEAR ?auto_18129 ) ( IS-CRATE ?auto_18130 ) ( AVAILABLE ?auto_18135 ) ( IN ?auto_18130 ?auto_18133 ) ( TRUCK-AT ?auto_18133 ?auto_18134 ) ( ON ?auto_18127 ?auto_18126 ) ( ON ?auto_18128 ?auto_18127 ) ( ON ?auto_18129 ?auto_18128 ) ( not ( = ?auto_18126 ?auto_18127 ) ) ( not ( = ?auto_18126 ?auto_18128 ) ) ( not ( = ?auto_18126 ?auto_18129 ) ) ( not ( = ?auto_18126 ?auto_18130 ) ) ( not ( = ?auto_18126 ?auto_18131 ) ) ( not ( = ?auto_18126 ?auto_18137 ) ) ( not ( = ?auto_18127 ?auto_18128 ) ) ( not ( = ?auto_18127 ?auto_18129 ) ) ( not ( = ?auto_18127 ?auto_18130 ) ) ( not ( = ?auto_18127 ?auto_18131 ) ) ( not ( = ?auto_18127 ?auto_18137 ) ) ( not ( = ?auto_18128 ?auto_18129 ) ) ( not ( = ?auto_18128 ?auto_18130 ) ) ( not ( = ?auto_18128 ?auto_18131 ) ) ( not ( = ?auto_18128 ?auto_18137 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18129 ?auto_18130 ?auto_18131 )
      ( MAKE-5CRATE-VERIFY ?auto_18126 ?auto_18127 ?auto_18128 ?auto_18129 ?auto_18130 ?auto_18131 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18138 - SURFACE
      ?auto_18139 - SURFACE
    )
    :vars
    (
      ?auto_18143 - HOIST
      ?auto_18144 - PLACE
      ?auto_18146 - SURFACE
      ?auto_18142 - PLACE
      ?auto_18140 - HOIST
      ?auto_18145 - SURFACE
      ?auto_18141 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18143 ?auto_18144 ) ( IS-CRATE ?auto_18139 ) ( not ( = ?auto_18138 ?auto_18139 ) ) ( not ( = ?auto_18146 ?auto_18138 ) ) ( not ( = ?auto_18146 ?auto_18139 ) ) ( not ( = ?auto_18142 ?auto_18144 ) ) ( HOIST-AT ?auto_18140 ?auto_18142 ) ( not ( = ?auto_18143 ?auto_18140 ) ) ( SURFACE-AT ?auto_18139 ?auto_18142 ) ( ON ?auto_18139 ?auto_18145 ) ( CLEAR ?auto_18139 ) ( not ( = ?auto_18138 ?auto_18145 ) ) ( not ( = ?auto_18139 ?auto_18145 ) ) ( not ( = ?auto_18146 ?auto_18145 ) ) ( SURFACE-AT ?auto_18146 ?auto_18144 ) ( CLEAR ?auto_18146 ) ( IS-CRATE ?auto_18138 ) ( AVAILABLE ?auto_18143 ) ( TRUCK-AT ?auto_18141 ?auto_18142 ) ( LIFTING ?auto_18140 ?auto_18138 ) )
    :subtasks
    ( ( !LOAD ?auto_18140 ?auto_18138 ?auto_18141 ?auto_18142 )
      ( MAKE-2CRATE ?auto_18146 ?auto_18138 ?auto_18139 )
      ( MAKE-1CRATE-VERIFY ?auto_18138 ?auto_18139 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18147 - SURFACE
      ?auto_18148 - SURFACE
      ?auto_18149 - SURFACE
    )
    :vars
    (
      ?auto_18151 - HOIST
      ?auto_18152 - PLACE
      ?auto_18155 - PLACE
      ?auto_18153 - HOIST
      ?auto_18154 - SURFACE
      ?auto_18150 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18151 ?auto_18152 ) ( IS-CRATE ?auto_18149 ) ( not ( = ?auto_18148 ?auto_18149 ) ) ( not ( = ?auto_18147 ?auto_18148 ) ) ( not ( = ?auto_18147 ?auto_18149 ) ) ( not ( = ?auto_18155 ?auto_18152 ) ) ( HOIST-AT ?auto_18153 ?auto_18155 ) ( not ( = ?auto_18151 ?auto_18153 ) ) ( SURFACE-AT ?auto_18149 ?auto_18155 ) ( ON ?auto_18149 ?auto_18154 ) ( CLEAR ?auto_18149 ) ( not ( = ?auto_18148 ?auto_18154 ) ) ( not ( = ?auto_18149 ?auto_18154 ) ) ( not ( = ?auto_18147 ?auto_18154 ) ) ( SURFACE-AT ?auto_18147 ?auto_18152 ) ( CLEAR ?auto_18147 ) ( IS-CRATE ?auto_18148 ) ( AVAILABLE ?auto_18151 ) ( TRUCK-AT ?auto_18150 ?auto_18155 ) ( LIFTING ?auto_18153 ?auto_18148 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18148 ?auto_18149 )
      ( MAKE-2CRATE-VERIFY ?auto_18147 ?auto_18148 ?auto_18149 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18156 - SURFACE
      ?auto_18157 - SURFACE
      ?auto_18158 - SURFACE
      ?auto_18159 - SURFACE
    )
    :vars
    (
      ?auto_18163 - HOIST
      ?auto_18164 - PLACE
      ?auto_18162 - PLACE
      ?auto_18165 - HOIST
      ?auto_18161 - SURFACE
      ?auto_18160 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18163 ?auto_18164 ) ( IS-CRATE ?auto_18159 ) ( not ( = ?auto_18158 ?auto_18159 ) ) ( not ( = ?auto_18157 ?auto_18158 ) ) ( not ( = ?auto_18157 ?auto_18159 ) ) ( not ( = ?auto_18162 ?auto_18164 ) ) ( HOIST-AT ?auto_18165 ?auto_18162 ) ( not ( = ?auto_18163 ?auto_18165 ) ) ( SURFACE-AT ?auto_18159 ?auto_18162 ) ( ON ?auto_18159 ?auto_18161 ) ( CLEAR ?auto_18159 ) ( not ( = ?auto_18158 ?auto_18161 ) ) ( not ( = ?auto_18159 ?auto_18161 ) ) ( not ( = ?auto_18157 ?auto_18161 ) ) ( SURFACE-AT ?auto_18157 ?auto_18164 ) ( CLEAR ?auto_18157 ) ( IS-CRATE ?auto_18158 ) ( AVAILABLE ?auto_18163 ) ( TRUCK-AT ?auto_18160 ?auto_18162 ) ( LIFTING ?auto_18165 ?auto_18158 ) ( ON ?auto_18157 ?auto_18156 ) ( not ( = ?auto_18156 ?auto_18157 ) ) ( not ( = ?auto_18156 ?auto_18158 ) ) ( not ( = ?auto_18156 ?auto_18159 ) ) ( not ( = ?auto_18156 ?auto_18161 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18157 ?auto_18158 ?auto_18159 )
      ( MAKE-3CRATE-VERIFY ?auto_18156 ?auto_18157 ?auto_18158 ?auto_18159 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18166 - SURFACE
      ?auto_18167 - SURFACE
      ?auto_18168 - SURFACE
      ?auto_18169 - SURFACE
      ?auto_18170 - SURFACE
    )
    :vars
    (
      ?auto_18174 - HOIST
      ?auto_18175 - PLACE
      ?auto_18173 - PLACE
      ?auto_18176 - HOIST
      ?auto_18172 - SURFACE
      ?auto_18171 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18174 ?auto_18175 ) ( IS-CRATE ?auto_18170 ) ( not ( = ?auto_18169 ?auto_18170 ) ) ( not ( = ?auto_18168 ?auto_18169 ) ) ( not ( = ?auto_18168 ?auto_18170 ) ) ( not ( = ?auto_18173 ?auto_18175 ) ) ( HOIST-AT ?auto_18176 ?auto_18173 ) ( not ( = ?auto_18174 ?auto_18176 ) ) ( SURFACE-AT ?auto_18170 ?auto_18173 ) ( ON ?auto_18170 ?auto_18172 ) ( CLEAR ?auto_18170 ) ( not ( = ?auto_18169 ?auto_18172 ) ) ( not ( = ?auto_18170 ?auto_18172 ) ) ( not ( = ?auto_18168 ?auto_18172 ) ) ( SURFACE-AT ?auto_18168 ?auto_18175 ) ( CLEAR ?auto_18168 ) ( IS-CRATE ?auto_18169 ) ( AVAILABLE ?auto_18174 ) ( TRUCK-AT ?auto_18171 ?auto_18173 ) ( LIFTING ?auto_18176 ?auto_18169 ) ( ON ?auto_18167 ?auto_18166 ) ( ON ?auto_18168 ?auto_18167 ) ( not ( = ?auto_18166 ?auto_18167 ) ) ( not ( = ?auto_18166 ?auto_18168 ) ) ( not ( = ?auto_18166 ?auto_18169 ) ) ( not ( = ?auto_18166 ?auto_18170 ) ) ( not ( = ?auto_18166 ?auto_18172 ) ) ( not ( = ?auto_18167 ?auto_18168 ) ) ( not ( = ?auto_18167 ?auto_18169 ) ) ( not ( = ?auto_18167 ?auto_18170 ) ) ( not ( = ?auto_18167 ?auto_18172 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18168 ?auto_18169 ?auto_18170 )
      ( MAKE-4CRATE-VERIFY ?auto_18166 ?auto_18167 ?auto_18168 ?auto_18169 ?auto_18170 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18177 - SURFACE
      ?auto_18178 - SURFACE
      ?auto_18179 - SURFACE
      ?auto_18180 - SURFACE
      ?auto_18181 - SURFACE
      ?auto_18182 - SURFACE
    )
    :vars
    (
      ?auto_18186 - HOIST
      ?auto_18187 - PLACE
      ?auto_18185 - PLACE
      ?auto_18188 - HOIST
      ?auto_18184 - SURFACE
      ?auto_18183 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18186 ?auto_18187 ) ( IS-CRATE ?auto_18182 ) ( not ( = ?auto_18181 ?auto_18182 ) ) ( not ( = ?auto_18180 ?auto_18181 ) ) ( not ( = ?auto_18180 ?auto_18182 ) ) ( not ( = ?auto_18185 ?auto_18187 ) ) ( HOIST-AT ?auto_18188 ?auto_18185 ) ( not ( = ?auto_18186 ?auto_18188 ) ) ( SURFACE-AT ?auto_18182 ?auto_18185 ) ( ON ?auto_18182 ?auto_18184 ) ( CLEAR ?auto_18182 ) ( not ( = ?auto_18181 ?auto_18184 ) ) ( not ( = ?auto_18182 ?auto_18184 ) ) ( not ( = ?auto_18180 ?auto_18184 ) ) ( SURFACE-AT ?auto_18180 ?auto_18187 ) ( CLEAR ?auto_18180 ) ( IS-CRATE ?auto_18181 ) ( AVAILABLE ?auto_18186 ) ( TRUCK-AT ?auto_18183 ?auto_18185 ) ( LIFTING ?auto_18188 ?auto_18181 ) ( ON ?auto_18178 ?auto_18177 ) ( ON ?auto_18179 ?auto_18178 ) ( ON ?auto_18180 ?auto_18179 ) ( not ( = ?auto_18177 ?auto_18178 ) ) ( not ( = ?auto_18177 ?auto_18179 ) ) ( not ( = ?auto_18177 ?auto_18180 ) ) ( not ( = ?auto_18177 ?auto_18181 ) ) ( not ( = ?auto_18177 ?auto_18182 ) ) ( not ( = ?auto_18177 ?auto_18184 ) ) ( not ( = ?auto_18178 ?auto_18179 ) ) ( not ( = ?auto_18178 ?auto_18180 ) ) ( not ( = ?auto_18178 ?auto_18181 ) ) ( not ( = ?auto_18178 ?auto_18182 ) ) ( not ( = ?auto_18178 ?auto_18184 ) ) ( not ( = ?auto_18179 ?auto_18180 ) ) ( not ( = ?auto_18179 ?auto_18181 ) ) ( not ( = ?auto_18179 ?auto_18182 ) ) ( not ( = ?auto_18179 ?auto_18184 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18180 ?auto_18181 ?auto_18182 )
      ( MAKE-5CRATE-VERIFY ?auto_18177 ?auto_18178 ?auto_18179 ?auto_18180 ?auto_18181 ?auto_18182 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18189 - SURFACE
      ?auto_18190 - SURFACE
    )
    :vars
    (
      ?auto_18194 - HOIST
      ?auto_18195 - PLACE
      ?auto_18197 - SURFACE
      ?auto_18193 - PLACE
      ?auto_18196 - HOIST
      ?auto_18192 - SURFACE
      ?auto_18191 - TRUCK
      ?auto_18198 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18194 ?auto_18195 ) ( IS-CRATE ?auto_18190 ) ( not ( = ?auto_18189 ?auto_18190 ) ) ( not ( = ?auto_18197 ?auto_18189 ) ) ( not ( = ?auto_18197 ?auto_18190 ) ) ( not ( = ?auto_18193 ?auto_18195 ) ) ( HOIST-AT ?auto_18196 ?auto_18193 ) ( not ( = ?auto_18194 ?auto_18196 ) ) ( SURFACE-AT ?auto_18190 ?auto_18193 ) ( ON ?auto_18190 ?auto_18192 ) ( CLEAR ?auto_18190 ) ( not ( = ?auto_18189 ?auto_18192 ) ) ( not ( = ?auto_18190 ?auto_18192 ) ) ( not ( = ?auto_18197 ?auto_18192 ) ) ( SURFACE-AT ?auto_18197 ?auto_18195 ) ( CLEAR ?auto_18197 ) ( IS-CRATE ?auto_18189 ) ( AVAILABLE ?auto_18194 ) ( TRUCK-AT ?auto_18191 ?auto_18193 ) ( AVAILABLE ?auto_18196 ) ( SURFACE-AT ?auto_18189 ?auto_18193 ) ( ON ?auto_18189 ?auto_18198 ) ( CLEAR ?auto_18189 ) ( not ( = ?auto_18189 ?auto_18198 ) ) ( not ( = ?auto_18190 ?auto_18198 ) ) ( not ( = ?auto_18197 ?auto_18198 ) ) ( not ( = ?auto_18192 ?auto_18198 ) ) )
    :subtasks
    ( ( !LIFT ?auto_18196 ?auto_18189 ?auto_18198 ?auto_18193 )
      ( MAKE-2CRATE ?auto_18197 ?auto_18189 ?auto_18190 )
      ( MAKE-1CRATE-VERIFY ?auto_18189 ?auto_18190 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18199 - SURFACE
      ?auto_18200 - SURFACE
      ?auto_18201 - SURFACE
    )
    :vars
    (
      ?auto_18204 - HOIST
      ?auto_18202 - PLACE
      ?auto_18206 - PLACE
      ?auto_18203 - HOIST
      ?auto_18208 - SURFACE
      ?auto_18205 - TRUCK
      ?auto_18207 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18204 ?auto_18202 ) ( IS-CRATE ?auto_18201 ) ( not ( = ?auto_18200 ?auto_18201 ) ) ( not ( = ?auto_18199 ?auto_18200 ) ) ( not ( = ?auto_18199 ?auto_18201 ) ) ( not ( = ?auto_18206 ?auto_18202 ) ) ( HOIST-AT ?auto_18203 ?auto_18206 ) ( not ( = ?auto_18204 ?auto_18203 ) ) ( SURFACE-AT ?auto_18201 ?auto_18206 ) ( ON ?auto_18201 ?auto_18208 ) ( CLEAR ?auto_18201 ) ( not ( = ?auto_18200 ?auto_18208 ) ) ( not ( = ?auto_18201 ?auto_18208 ) ) ( not ( = ?auto_18199 ?auto_18208 ) ) ( SURFACE-AT ?auto_18199 ?auto_18202 ) ( CLEAR ?auto_18199 ) ( IS-CRATE ?auto_18200 ) ( AVAILABLE ?auto_18204 ) ( TRUCK-AT ?auto_18205 ?auto_18206 ) ( AVAILABLE ?auto_18203 ) ( SURFACE-AT ?auto_18200 ?auto_18206 ) ( ON ?auto_18200 ?auto_18207 ) ( CLEAR ?auto_18200 ) ( not ( = ?auto_18200 ?auto_18207 ) ) ( not ( = ?auto_18201 ?auto_18207 ) ) ( not ( = ?auto_18199 ?auto_18207 ) ) ( not ( = ?auto_18208 ?auto_18207 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18200 ?auto_18201 )
      ( MAKE-2CRATE-VERIFY ?auto_18199 ?auto_18200 ?auto_18201 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18209 - SURFACE
      ?auto_18210 - SURFACE
      ?auto_18211 - SURFACE
      ?auto_18212 - SURFACE
    )
    :vars
    (
      ?auto_18215 - HOIST
      ?auto_18214 - PLACE
      ?auto_18216 - PLACE
      ?auto_18219 - HOIST
      ?auto_18217 - SURFACE
      ?auto_18218 - TRUCK
      ?auto_18213 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18215 ?auto_18214 ) ( IS-CRATE ?auto_18212 ) ( not ( = ?auto_18211 ?auto_18212 ) ) ( not ( = ?auto_18210 ?auto_18211 ) ) ( not ( = ?auto_18210 ?auto_18212 ) ) ( not ( = ?auto_18216 ?auto_18214 ) ) ( HOIST-AT ?auto_18219 ?auto_18216 ) ( not ( = ?auto_18215 ?auto_18219 ) ) ( SURFACE-AT ?auto_18212 ?auto_18216 ) ( ON ?auto_18212 ?auto_18217 ) ( CLEAR ?auto_18212 ) ( not ( = ?auto_18211 ?auto_18217 ) ) ( not ( = ?auto_18212 ?auto_18217 ) ) ( not ( = ?auto_18210 ?auto_18217 ) ) ( SURFACE-AT ?auto_18210 ?auto_18214 ) ( CLEAR ?auto_18210 ) ( IS-CRATE ?auto_18211 ) ( AVAILABLE ?auto_18215 ) ( TRUCK-AT ?auto_18218 ?auto_18216 ) ( AVAILABLE ?auto_18219 ) ( SURFACE-AT ?auto_18211 ?auto_18216 ) ( ON ?auto_18211 ?auto_18213 ) ( CLEAR ?auto_18211 ) ( not ( = ?auto_18211 ?auto_18213 ) ) ( not ( = ?auto_18212 ?auto_18213 ) ) ( not ( = ?auto_18210 ?auto_18213 ) ) ( not ( = ?auto_18217 ?auto_18213 ) ) ( ON ?auto_18210 ?auto_18209 ) ( not ( = ?auto_18209 ?auto_18210 ) ) ( not ( = ?auto_18209 ?auto_18211 ) ) ( not ( = ?auto_18209 ?auto_18212 ) ) ( not ( = ?auto_18209 ?auto_18217 ) ) ( not ( = ?auto_18209 ?auto_18213 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18210 ?auto_18211 ?auto_18212 )
      ( MAKE-3CRATE-VERIFY ?auto_18209 ?auto_18210 ?auto_18211 ?auto_18212 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18220 - SURFACE
      ?auto_18221 - SURFACE
      ?auto_18222 - SURFACE
      ?auto_18223 - SURFACE
      ?auto_18224 - SURFACE
    )
    :vars
    (
      ?auto_18227 - HOIST
      ?auto_18226 - PLACE
      ?auto_18228 - PLACE
      ?auto_18231 - HOIST
      ?auto_18229 - SURFACE
      ?auto_18230 - TRUCK
      ?auto_18225 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18227 ?auto_18226 ) ( IS-CRATE ?auto_18224 ) ( not ( = ?auto_18223 ?auto_18224 ) ) ( not ( = ?auto_18222 ?auto_18223 ) ) ( not ( = ?auto_18222 ?auto_18224 ) ) ( not ( = ?auto_18228 ?auto_18226 ) ) ( HOIST-AT ?auto_18231 ?auto_18228 ) ( not ( = ?auto_18227 ?auto_18231 ) ) ( SURFACE-AT ?auto_18224 ?auto_18228 ) ( ON ?auto_18224 ?auto_18229 ) ( CLEAR ?auto_18224 ) ( not ( = ?auto_18223 ?auto_18229 ) ) ( not ( = ?auto_18224 ?auto_18229 ) ) ( not ( = ?auto_18222 ?auto_18229 ) ) ( SURFACE-AT ?auto_18222 ?auto_18226 ) ( CLEAR ?auto_18222 ) ( IS-CRATE ?auto_18223 ) ( AVAILABLE ?auto_18227 ) ( TRUCK-AT ?auto_18230 ?auto_18228 ) ( AVAILABLE ?auto_18231 ) ( SURFACE-AT ?auto_18223 ?auto_18228 ) ( ON ?auto_18223 ?auto_18225 ) ( CLEAR ?auto_18223 ) ( not ( = ?auto_18223 ?auto_18225 ) ) ( not ( = ?auto_18224 ?auto_18225 ) ) ( not ( = ?auto_18222 ?auto_18225 ) ) ( not ( = ?auto_18229 ?auto_18225 ) ) ( ON ?auto_18221 ?auto_18220 ) ( ON ?auto_18222 ?auto_18221 ) ( not ( = ?auto_18220 ?auto_18221 ) ) ( not ( = ?auto_18220 ?auto_18222 ) ) ( not ( = ?auto_18220 ?auto_18223 ) ) ( not ( = ?auto_18220 ?auto_18224 ) ) ( not ( = ?auto_18220 ?auto_18229 ) ) ( not ( = ?auto_18220 ?auto_18225 ) ) ( not ( = ?auto_18221 ?auto_18222 ) ) ( not ( = ?auto_18221 ?auto_18223 ) ) ( not ( = ?auto_18221 ?auto_18224 ) ) ( not ( = ?auto_18221 ?auto_18229 ) ) ( not ( = ?auto_18221 ?auto_18225 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18222 ?auto_18223 ?auto_18224 )
      ( MAKE-4CRATE-VERIFY ?auto_18220 ?auto_18221 ?auto_18222 ?auto_18223 ?auto_18224 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18232 - SURFACE
      ?auto_18233 - SURFACE
      ?auto_18234 - SURFACE
      ?auto_18235 - SURFACE
      ?auto_18236 - SURFACE
      ?auto_18237 - SURFACE
    )
    :vars
    (
      ?auto_18240 - HOIST
      ?auto_18239 - PLACE
      ?auto_18241 - PLACE
      ?auto_18244 - HOIST
      ?auto_18242 - SURFACE
      ?auto_18243 - TRUCK
      ?auto_18238 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18240 ?auto_18239 ) ( IS-CRATE ?auto_18237 ) ( not ( = ?auto_18236 ?auto_18237 ) ) ( not ( = ?auto_18235 ?auto_18236 ) ) ( not ( = ?auto_18235 ?auto_18237 ) ) ( not ( = ?auto_18241 ?auto_18239 ) ) ( HOIST-AT ?auto_18244 ?auto_18241 ) ( not ( = ?auto_18240 ?auto_18244 ) ) ( SURFACE-AT ?auto_18237 ?auto_18241 ) ( ON ?auto_18237 ?auto_18242 ) ( CLEAR ?auto_18237 ) ( not ( = ?auto_18236 ?auto_18242 ) ) ( not ( = ?auto_18237 ?auto_18242 ) ) ( not ( = ?auto_18235 ?auto_18242 ) ) ( SURFACE-AT ?auto_18235 ?auto_18239 ) ( CLEAR ?auto_18235 ) ( IS-CRATE ?auto_18236 ) ( AVAILABLE ?auto_18240 ) ( TRUCK-AT ?auto_18243 ?auto_18241 ) ( AVAILABLE ?auto_18244 ) ( SURFACE-AT ?auto_18236 ?auto_18241 ) ( ON ?auto_18236 ?auto_18238 ) ( CLEAR ?auto_18236 ) ( not ( = ?auto_18236 ?auto_18238 ) ) ( not ( = ?auto_18237 ?auto_18238 ) ) ( not ( = ?auto_18235 ?auto_18238 ) ) ( not ( = ?auto_18242 ?auto_18238 ) ) ( ON ?auto_18233 ?auto_18232 ) ( ON ?auto_18234 ?auto_18233 ) ( ON ?auto_18235 ?auto_18234 ) ( not ( = ?auto_18232 ?auto_18233 ) ) ( not ( = ?auto_18232 ?auto_18234 ) ) ( not ( = ?auto_18232 ?auto_18235 ) ) ( not ( = ?auto_18232 ?auto_18236 ) ) ( not ( = ?auto_18232 ?auto_18237 ) ) ( not ( = ?auto_18232 ?auto_18242 ) ) ( not ( = ?auto_18232 ?auto_18238 ) ) ( not ( = ?auto_18233 ?auto_18234 ) ) ( not ( = ?auto_18233 ?auto_18235 ) ) ( not ( = ?auto_18233 ?auto_18236 ) ) ( not ( = ?auto_18233 ?auto_18237 ) ) ( not ( = ?auto_18233 ?auto_18242 ) ) ( not ( = ?auto_18233 ?auto_18238 ) ) ( not ( = ?auto_18234 ?auto_18235 ) ) ( not ( = ?auto_18234 ?auto_18236 ) ) ( not ( = ?auto_18234 ?auto_18237 ) ) ( not ( = ?auto_18234 ?auto_18242 ) ) ( not ( = ?auto_18234 ?auto_18238 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18235 ?auto_18236 ?auto_18237 )
      ( MAKE-5CRATE-VERIFY ?auto_18232 ?auto_18233 ?auto_18234 ?auto_18235 ?auto_18236 ?auto_18237 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18245 - SURFACE
      ?auto_18246 - SURFACE
    )
    :vars
    (
      ?auto_18249 - HOIST
      ?auto_18248 - PLACE
      ?auto_18254 - SURFACE
      ?auto_18250 - PLACE
      ?auto_18253 - HOIST
      ?auto_18251 - SURFACE
      ?auto_18247 - SURFACE
      ?auto_18252 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18249 ?auto_18248 ) ( IS-CRATE ?auto_18246 ) ( not ( = ?auto_18245 ?auto_18246 ) ) ( not ( = ?auto_18254 ?auto_18245 ) ) ( not ( = ?auto_18254 ?auto_18246 ) ) ( not ( = ?auto_18250 ?auto_18248 ) ) ( HOIST-AT ?auto_18253 ?auto_18250 ) ( not ( = ?auto_18249 ?auto_18253 ) ) ( SURFACE-AT ?auto_18246 ?auto_18250 ) ( ON ?auto_18246 ?auto_18251 ) ( CLEAR ?auto_18246 ) ( not ( = ?auto_18245 ?auto_18251 ) ) ( not ( = ?auto_18246 ?auto_18251 ) ) ( not ( = ?auto_18254 ?auto_18251 ) ) ( SURFACE-AT ?auto_18254 ?auto_18248 ) ( CLEAR ?auto_18254 ) ( IS-CRATE ?auto_18245 ) ( AVAILABLE ?auto_18249 ) ( AVAILABLE ?auto_18253 ) ( SURFACE-AT ?auto_18245 ?auto_18250 ) ( ON ?auto_18245 ?auto_18247 ) ( CLEAR ?auto_18245 ) ( not ( = ?auto_18245 ?auto_18247 ) ) ( not ( = ?auto_18246 ?auto_18247 ) ) ( not ( = ?auto_18254 ?auto_18247 ) ) ( not ( = ?auto_18251 ?auto_18247 ) ) ( TRUCK-AT ?auto_18252 ?auto_18248 ) )
    :subtasks
    ( ( !DRIVE ?auto_18252 ?auto_18248 ?auto_18250 )
      ( MAKE-2CRATE ?auto_18254 ?auto_18245 ?auto_18246 )
      ( MAKE-1CRATE-VERIFY ?auto_18245 ?auto_18246 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18255 - SURFACE
      ?auto_18256 - SURFACE
      ?auto_18257 - SURFACE
    )
    :vars
    (
      ?auto_18260 - HOIST
      ?auto_18263 - PLACE
      ?auto_18258 - PLACE
      ?auto_18262 - HOIST
      ?auto_18259 - SURFACE
      ?auto_18261 - SURFACE
      ?auto_18264 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18260 ?auto_18263 ) ( IS-CRATE ?auto_18257 ) ( not ( = ?auto_18256 ?auto_18257 ) ) ( not ( = ?auto_18255 ?auto_18256 ) ) ( not ( = ?auto_18255 ?auto_18257 ) ) ( not ( = ?auto_18258 ?auto_18263 ) ) ( HOIST-AT ?auto_18262 ?auto_18258 ) ( not ( = ?auto_18260 ?auto_18262 ) ) ( SURFACE-AT ?auto_18257 ?auto_18258 ) ( ON ?auto_18257 ?auto_18259 ) ( CLEAR ?auto_18257 ) ( not ( = ?auto_18256 ?auto_18259 ) ) ( not ( = ?auto_18257 ?auto_18259 ) ) ( not ( = ?auto_18255 ?auto_18259 ) ) ( SURFACE-AT ?auto_18255 ?auto_18263 ) ( CLEAR ?auto_18255 ) ( IS-CRATE ?auto_18256 ) ( AVAILABLE ?auto_18260 ) ( AVAILABLE ?auto_18262 ) ( SURFACE-AT ?auto_18256 ?auto_18258 ) ( ON ?auto_18256 ?auto_18261 ) ( CLEAR ?auto_18256 ) ( not ( = ?auto_18256 ?auto_18261 ) ) ( not ( = ?auto_18257 ?auto_18261 ) ) ( not ( = ?auto_18255 ?auto_18261 ) ) ( not ( = ?auto_18259 ?auto_18261 ) ) ( TRUCK-AT ?auto_18264 ?auto_18263 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18256 ?auto_18257 )
      ( MAKE-2CRATE-VERIFY ?auto_18255 ?auto_18256 ?auto_18257 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18265 - SURFACE
      ?auto_18266 - SURFACE
      ?auto_18267 - SURFACE
      ?auto_18268 - SURFACE
    )
    :vars
    (
      ?auto_18270 - HOIST
      ?auto_18271 - PLACE
      ?auto_18272 - PLACE
      ?auto_18273 - HOIST
      ?auto_18275 - SURFACE
      ?auto_18269 - SURFACE
      ?auto_18274 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18270 ?auto_18271 ) ( IS-CRATE ?auto_18268 ) ( not ( = ?auto_18267 ?auto_18268 ) ) ( not ( = ?auto_18266 ?auto_18267 ) ) ( not ( = ?auto_18266 ?auto_18268 ) ) ( not ( = ?auto_18272 ?auto_18271 ) ) ( HOIST-AT ?auto_18273 ?auto_18272 ) ( not ( = ?auto_18270 ?auto_18273 ) ) ( SURFACE-AT ?auto_18268 ?auto_18272 ) ( ON ?auto_18268 ?auto_18275 ) ( CLEAR ?auto_18268 ) ( not ( = ?auto_18267 ?auto_18275 ) ) ( not ( = ?auto_18268 ?auto_18275 ) ) ( not ( = ?auto_18266 ?auto_18275 ) ) ( SURFACE-AT ?auto_18266 ?auto_18271 ) ( CLEAR ?auto_18266 ) ( IS-CRATE ?auto_18267 ) ( AVAILABLE ?auto_18270 ) ( AVAILABLE ?auto_18273 ) ( SURFACE-AT ?auto_18267 ?auto_18272 ) ( ON ?auto_18267 ?auto_18269 ) ( CLEAR ?auto_18267 ) ( not ( = ?auto_18267 ?auto_18269 ) ) ( not ( = ?auto_18268 ?auto_18269 ) ) ( not ( = ?auto_18266 ?auto_18269 ) ) ( not ( = ?auto_18275 ?auto_18269 ) ) ( TRUCK-AT ?auto_18274 ?auto_18271 ) ( ON ?auto_18266 ?auto_18265 ) ( not ( = ?auto_18265 ?auto_18266 ) ) ( not ( = ?auto_18265 ?auto_18267 ) ) ( not ( = ?auto_18265 ?auto_18268 ) ) ( not ( = ?auto_18265 ?auto_18275 ) ) ( not ( = ?auto_18265 ?auto_18269 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18266 ?auto_18267 ?auto_18268 )
      ( MAKE-3CRATE-VERIFY ?auto_18265 ?auto_18266 ?auto_18267 ?auto_18268 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18276 - SURFACE
      ?auto_18277 - SURFACE
      ?auto_18278 - SURFACE
      ?auto_18279 - SURFACE
      ?auto_18280 - SURFACE
    )
    :vars
    (
      ?auto_18282 - HOIST
      ?auto_18283 - PLACE
      ?auto_18284 - PLACE
      ?auto_18285 - HOIST
      ?auto_18287 - SURFACE
      ?auto_18281 - SURFACE
      ?auto_18286 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18282 ?auto_18283 ) ( IS-CRATE ?auto_18280 ) ( not ( = ?auto_18279 ?auto_18280 ) ) ( not ( = ?auto_18278 ?auto_18279 ) ) ( not ( = ?auto_18278 ?auto_18280 ) ) ( not ( = ?auto_18284 ?auto_18283 ) ) ( HOIST-AT ?auto_18285 ?auto_18284 ) ( not ( = ?auto_18282 ?auto_18285 ) ) ( SURFACE-AT ?auto_18280 ?auto_18284 ) ( ON ?auto_18280 ?auto_18287 ) ( CLEAR ?auto_18280 ) ( not ( = ?auto_18279 ?auto_18287 ) ) ( not ( = ?auto_18280 ?auto_18287 ) ) ( not ( = ?auto_18278 ?auto_18287 ) ) ( SURFACE-AT ?auto_18278 ?auto_18283 ) ( CLEAR ?auto_18278 ) ( IS-CRATE ?auto_18279 ) ( AVAILABLE ?auto_18282 ) ( AVAILABLE ?auto_18285 ) ( SURFACE-AT ?auto_18279 ?auto_18284 ) ( ON ?auto_18279 ?auto_18281 ) ( CLEAR ?auto_18279 ) ( not ( = ?auto_18279 ?auto_18281 ) ) ( not ( = ?auto_18280 ?auto_18281 ) ) ( not ( = ?auto_18278 ?auto_18281 ) ) ( not ( = ?auto_18287 ?auto_18281 ) ) ( TRUCK-AT ?auto_18286 ?auto_18283 ) ( ON ?auto_18277 ?auto_18276 ) ( ON ?auto_18278 ?auto_18277 ) ( not ( = ?auto_18276 ?auto_18277 ) ) ( not ( = ?auto_18276 ?auto_18278 ) ) ( not ( = ?auto_18276 ?auto_18279 ) ) ( not ( = ?auto_18276 ?auto_18280 ) ) ( not ( = ?auto_18276 ?auto_18287 ) ) ( not ( = ?auto_18276 ?auto_18281 ) ) ( not ( = ?auto_18277 ?auto_18278 ) ) ( not ( = ?auto_18277 ?auto_18279 ) ) ( not ( = ?auto_18277 ?auto_18280 ) ) ( not ( = ?auto_18277 ?auto_18287 ) ) ( not ( = ?auto_18277 ?auto_18281 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18278 ?auto_18279 ?auto_18280 )
      ( MAKE-4CRATE-VERIFY ?auto_18276 ?auto_18277 ?auto_18278 ?auto_18279 ?auto_18280 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18288 - SURFACE
      ?auto_18289 - SURFACE
      ?auto_18290 - SURFACE
      ?auto_18291 - SURFACE
      ?auto_18292 - SURFACE
      ?auto_18293 - SURFACE
    )
    :vars
    (
      ?auto_18295 - HOIST
      ?auto_18296 - PLACE
      ?auto_18297 - PLACE
      ?auto_18298 - HOIST
      ?auto_18300 - SURFACE
      ?auto_18294 - SURFACE
      ?auto_18299 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18295 ?auto_18296 ) ( IS-CRATE ?auto_18293 ) ( not ( = ?auto_18292 ?auto_18293 ) ) ( not ( = ?auto_18291 ?auto_18292 ) ) ( not ( = ?auto_18291 ?auto_18293 ) ) ( not ( = ?auto_18297 ?auto_18296 ) ) ( HOIST-AT ?auto_18298 ?auto_18297 ) ( not ( = ?auto_18295 ?auto_18298 ) ) ( SURFACE-AT ?auto_18293 ?auto_18297 ) ( ON ?auto_18293 ?auto_18300 ) ( CLEAR ?auto_18293 ) ( not ( = ?auto_18292 ?auto_18300 ) ) ( not ( = ?auto_18293 ?auto_18300 ) ) ( not ( = ?auto_18291 ?auto_18300 ) ) ( SURFACE-AT ?auto_18291 ?auto_18296 ) ( CLEAR ?auto_18291 ) ( IS-CRATE ?auto_18292 ) ( AVAILABLE ?auto_18295 ) ( AVAILABLE ?auto_18298 ) ( SURFACE-AT ?auto_18292 ?auto_18297 ) ( ON ?auto_18292 ?auto_18294 ) ( CLEAR ?auto_18292 ) ( not ( = ?auto_18292 ?auto_18294 ) ) ( not ( = ?auto_18293 ?auto_18294 ) ) ( not ( = ?auto_18291 ?auto_18294 ) ) ( not ( = ?auto_18300 ?auto_18294 ) ) ( TRUCK-AT ?auto_18299 ?auto_18296 ) ( ON ?auto_18289 ?auto_18288 ) ( ON ?auto_18290 ?auto_18289 ) ( ON ?auto_18291 ?auto_18290 ) ( not ( = ?auto_18288 ?auto_18289 ) ) ( not ( = ?auto_18288 ?auto_18290 ) ) ( not ( = ?auto_18288 ?auto_18291 ) ) ( not ( = ?auto_18288 ?auto_18292 ) ) ( not ( = ?auto_18288 ?auto_18293 ) ) ( not ( = ?auto_18288 ?auto_18300 ) ) ( not ( = ?auto_18288 ?auto_18294 ) ) ( not ( = ?auto_18289 ?auto_18290 ) ) ( not ( = ?auto_18289 ?auto_18291 ) ) ( not ( = ?auto_18289 ?auto_18292 ) ) ( not ( = ?auto_18289 ?auto_18293 ) ) ( not ( = ?auto_18289 ?auto_18300 ) ) ( not ( = ?auto_18289 ?auto_18294 ) ) ( not ( = ?auto_18290 ?auto_18291 ) ) ( not ( = ?auto_18290 ?auto_18292 ) ) ( not ( = ?auto_18290 ?auto_18293 ) ) ( not ( = ?auto_18290 ?auto_18300 ) ) ( not ( = ?auto_18290 ?auto_18294 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18291 ?auto_18292 ?auto_18293 )
      ( MAKE-5CRATE-VERIFY ?auto_18288 ?auto_18289 ?auto_18290 ?auto_18291 ?auto_18292 ?auto_18293 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18301 - SURFACE
      ?auto_18302 - SURFACE
    )
    :vars
    (
      ?auto_18304 - HOIST
      ?auto_18305 - PLACE
      ?auto_18310 - SURFACE
      ?auto_18306 - PLACE
      ?auto_18307 - HOIST
      ?auto_18309 - SURFACE
      ?auto_18303 - SURFACE
      ?auto_18308 - TRUCK
      ?auto_18311 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18304 ?auto_18305 ) ( IS-CRATE ?auto_18302 ) ( not ( = ?auto_18301 ?auto_18302 ) ) ( not ( = ?auto_18310 ?auto_18301 ) ) ( not ( = ?auto_18310 ?auto_18302 ) ) ( not ( = ?auto_18306 ?auto_18305 ) ) ( HOIST-AT ?auto_18307 ?auto_18306 ) ( not ( = ?auto_18304 ?auto_18307 ) ) ( SURFACE-AT ?auto_18302 ?auto_18306 ) ( ON ?auto_18302 ?auto_18309 ) ( CLEAR ?auto_18302 ) ( not ( = ?auto_18301 ?auto_18309 ) ) ( not ( = ?auto_18302 ?auto_18309 ) ) ( not ( = ?auto_18310 ?auto_18309 ) ) ( IS-CRATE ?auto_18301 ) ( AVAILABLE ?auto_18307 ) ( SURFACE-AT ?auto_18301 ?auto_18306 ) ( ON ?auto_18301 ?auto_18303 ) ( CLEAR ?auto_18301 ) ( not ( = ?auto_18301 ?auto_18303 ) ) ( not ( = ?auto_18302 ?auto_18303 ) ) ( not ( = ?auto_18310 ?auto_18303 ) ) ( not ( = ?auto_18309 ?auto_18303 ) ) ( TRUCK-AT ?auto_18308 ?auto_18305 ) ( SURFACE-AT ?auto_18311 ?auto_18305 ) ( CLEAR ?auto_18311 ) ( LIFTING ?auto_18304 ?auto_18310 ) ( IS-CRATE ?auto_18310 ) ( not ( = ?auto_18311 ?auto_18310 ) ) ( not ( = ?auto_18301 ?auto_18311 ) ) ( not ( = ?auto_18302 ?auto_18311 ) ) ( not ( = ?auto_18309 ?auto_18311 ) ) ( not ( = ?auto_18303 ?auto_18311 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18311 ?auto_18310 )
      ( MAKE-2CRATE ?auto_18310 ?auto_18301 ?auto_18302 )
      ( MAKE-1CRATE-VERIFY ?auto_18301 ?auto_18302 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18312 - SURFACE
      ?auto_18313 - SURFACE
      ?auto_18314 - SURFACE
    )
    :vars
    (
      ?auto_18320 - HOIST
      ?auto_18318 - PLACE
      ?auto_18315 - PLACE
      ?auto_18316 - HOIST
      ?auto_18319 - SURFACE
      ?auto_18322 - SURFACE
      ?auto_18317 - TRUCK
      ?auto_18321 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18320 ?auto_18318 ) ( IS-CRATE ?auto_18314 ) ( not ( = ?auto_18313 ?auto_18314 ) ) ( not ( = ?auto_18312 ?auto_18313 ) ) ( not ( = ?auto_18312 ?auto_18314 ) ) ( not ( = ?auto_18315 ?auto_18318 ) ) ( HOIST-AT ?auto_18316 ?auto_18315 ) ( not ( = ?auto_18320 ?auto_18316 ) ) ( SURFACE-AT ?auto_18314 ?auto_18315 ) ( ON ?auto_18314 ?auto_18319 ) ( CLEAR ?auto_18314 ) ( not ( = ?auto_18313 ?auto_18319 ) ) ( not ( = ?auto_18314 ?auto_18319 ) ) ( not ( = ?auto_18312 ?auto_18319 ) ) ( IS-CRATE ?auto_18313 ) ( AVAILABLE ?auto_18316 ) ( SURFACE-AT ?auto_18313 ?auto_18315 ) ( ON ?auto_18313 ?auto_18322 ) ( CLEAR ?auto_18313 ) ( not ( = ?auto_18313 ?auto_18322 ) ) ( not ( = ?auto_18314 ?auto_18322 ) ) ( not ( = ?auto_18312 ?auto_18322 ) ) ( not ( = ?auto_18319 ?auto_18322 ) ) ( TRUCK-AT ?auto_18317 ?auto_18318 ) ( SURFACE-AT ?auto_18321 ?auto_18318 ) ( CLEAR ?auto_18321 ) ( LIFTING ?auto_18320 ?auto_18312 ) ( IS-CRATE ?auto_18312 ) ( not ( = ?auto_18321 ?auto_18312 ) ) ( not ( = ?auto_18313 ?auto_18321 ) ) ( not ( = ?auto_18314 ?auto_18321 ) ) ( not ( = ?auto_18319 ?auto_18321 ) ) ( not ( = ?auto_18322 ?auto_18321 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18313 ?auto_18314 )
      ( MAKE-2CRATE-VERIFY ?auto_18312 ?auto_18313 ?auto_18314 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18323 - SURFACE
      ?auto_18324 - SURFACE
      ?auto_18325 - SURFACE
      ?auto_18326 - SURFACE
    )
    :vars
    (
      ?auto_18329 - HOIST
      ?auto_18328 - PLACE
      ?auto_18333 - PLACE
      ?auto_18331 - HOIST
      ?auto_18332 - SURFACE
      ?auto_18330 - SURFACE
      ?auto_18327 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18329 ?auto_18328 ) ( IS-CRATE ?auto_18326 ) ( not ( = ?auto_18325 ?auto_18326 ) ) ( not ( = ?auto_18324 ?auto_18325 ) ) ( not ( = ?auto_18324 ?auto_18326 ) ) ( not ( = ?auto_18333 ?auto_18328 ) ) ( HOIST-AT ?auto_18331 ?auto_18333 ) ( not ( = ?auto_18329 ?auto_18331 ) ) ( SURFACE-AT ?auto_18326 ?auto_18333 ) ( ON ?auto_18326 ?auto_18332 ) ( CLEAR ?auto_18326 ) ( not ( = ?auto_18325 ?auto_18332 ) ) ( not ( = ?auto_18326 ?auto_18332 ) ) ( not ( = ?auto_18324 ?auto_18332 ) ) ( IS-CRATE ?auto_18325 ) ( AVAILABLE ?auto_18331 ) ( SURFACE-AT ?auto_18325 ?auto_18333 ) ( ON ?auto_18325 ?auto_18330 ) ( CLEAR ?auto_18325 ) ( not ( = ?auto_18325 ?auto_18330 ) ) ( not ( = ?auto_18326 ?auto_18330 ) ) ( not ( = ?auto_18324 ?auto_18330 ) ) ( not ( = ?auto_18332 ?auto_18330 ) ) ( TRUCK-AT ?auto_18327 ?auto_18328 ) ( SURFACE-AT ?auto_18323 ?auto_18328 ) ( CLEAR ?auto_18323 ) ( LIFTING ?auto_18329 ?auto_18324 ) ( IS-CRATE ?auto_18324 ) ( not ( = ?auto_18323 ?auto_18324 ) ) ( not ( = ?auto_18325 ?auto_18323 ) ) ( not ( = ?auto_18326 ?auto_18323 ) ) ( not ( = ?auto_18332 ?auto_18323 ) ) ( not ( = ?auto_18330 ?auto_18323 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18324 ?auto_18325 ?auto_18326 )
      ( MAKE-3CRATE-VERIFY ?auto_18323 ?auto_18324 ?auto_18325 ?auto_18326 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18334 - SURFACE
      ?auto_18335 - SURFACE
      ?auto_18336 - SURFACE
      ?auto_18337 - SURFACE
      ?auto_18338 - SURFACE
    )
    :vars
    (
      ?auto_18341 - HOIST
      ?auto_18340 - PLACE
      ?auto_18345 - PLACE
      ?auto_18343 - HOIST
      ?auto_18344 - SURFACE
      ?auto_18342 - SURFACE
      ?auto_18339 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18341 ?auto_18340 ) ( IS-CRATE ?auto_18338 ) ( not ( = ?auto_18337 ?auto_18338 ) ) ( not ( = ?auto_18336 ?auto_18337 ) ) ( not ( = ?auto_18336 ?auto_18338 ) ) ( not ( = ?auto_18345 ?auto_18340 ) ) ( HOIST-AT ?auto_18343 ?auto_18345 ) ( not ( = ?auto_18341 ?auto_18343 ) ) ( SURFACE-AT ?auto_18338 ?auto_18345 ) ( ON ?auto_18338 ?auto_18344 ) ( CLEAR ?auto_18338 ) ( not ( = ?auto_18337 ?auto_18344 ) ) ( not ( = ?auto_18338 ?auto_18344 ) ) ( not ( = ?auto_18336 ?auto_18344 ) ) ( IS-CRATE ?auto_18337 ) ( AVAILABLE ?auto_18343 ) ( SURFACE-AT ?auto_18337 ?auto_18345 ) ( ON ?auto_18337 ?auto_18342 ) ( CLEAR ?auto_18337 ) ( not ( = ?auto_18337 ?auto_18342 ) ) ( not ( = ?auto_18338 ?auto_18342 ) ) ( not ( = ?auto_18336 ?auto_18342 ) ) ( not ( = ?auto_18344 ?auto_18342 ) ) ( TRUCK-AT ?auto_18339 ?auto_18340 ) ( SURFACE-AT ?auto_18335 ?auto_18340 ) ( CLEAR ?auto_18335 ) ( LIFTING ?auto_18341 ?auto_18336 ) ( IS-CRATE ?auto_18336 ) ( not ( = ?auto_18335 ?auto_18336 ) ) ( not ( = ?auto_18337 ?auto_18335 ) ) ( not ( = ?auto_18338 ?auto_18335 ) ) ( not ( = ?auto_18344 ?auto_18335 ) ) ( not ( = ?auto_18342 ?auto_18335 ) ) ( ON ?auto_18335 ?auto_18334 ) ( not ( = ?auto_18334 ?auto_18335 ) ) ( not ( = ?auto_18334 ?auto_18336 ) ) ( not ( = ?auto_18334 ?auto_18337 ) ) ( not ( = ?auto_18334 ?auto_18338 ) ) ( not ( = ?auto_18334 ?auto_18344 ) ) ( not ( = ?auto_18334 ?auto_18342 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18336 ?auto_18337 ?auto_18338 )
      ( MAKE-4CRATE-VERIFY ?auto_18334 ?auto_18335 ?auto_18336 ?auto_18337 ?auto_18338 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18346 - SURFACE
      ?auto_18347 - SURFACE
      ?auto_18348 - SURFACE
      ?auto_18349 - SURFACE
      ?auto_18350 - SURFACE
      ?auto_18351 - SURFACE
    )
    :vars
    (
      ?auto_18354 - HOIST
      ?auto_18353 - PLACE
      ?auto_18358 - PLACE
      ?auto_18356 - HOIST
      ?auto_18357 - SURFACE
      ?auto_18355 - SURFACE
      ?auto_18352 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18354 ?auto_18353 ) ( IS-CRATE ?auto_18351 ) ( not ( = ?auto_18350 ?auto_18351 ) ) ( not ( = ?auto_18349 ?auto_18350 ) ) ( not ( = ?auto_18349 ?auto_18351 ) ) ( not ( = ?auto_18358 ?auto_18353 ) ) ( HOIST-AT ?auto_18356 ?auto_18358 ) ( not ( = ?auto_18354 ?auto_18356 ) ) ( SURFACE-AT ?auto_18351 ?auto_18358 ) ( ON ?auto_18351 ?auto_18357 ) ( CLEAR ?auto_18351 ) ( not ( = ?auto_18350 ?auto_18357 ) ) ( not ( = ?auto_18351 ?auto_18357 ) ) ( not ( = ?auto_18349 ?auto_18357 ) ) ( IS-CRATE ?auto_18350 ) ( AVAILABLE ?auto_18356 ) ( SURFACE-AT ?auto_18350 ?auto_18358 ) ( ON ?auto_18350 ?auto_18355 ) ( CLEAR ?auto_18350 ) ( not ( = ?auto_18350 ?auto_18355 ) ) ( not ( = ?auto_18351 ?auto_18355 ) ) ( not ( = ?auto_18349 ?auto_18355 ) ) ( not ( = ?auto_18357 ?auto_18355 ) ) ( TRUCK-AT ?auto_18352 ?auto_18353 ) ( SURFACE-AT ?auto_18348 ?auto_18353 ) ( CLEAR ?auto_18348 ) ( LIFTING ?auto_18354 ?auto_18349 ) ( IS-CRATE ?auto_18349 ) ( not ( = ?auto_18348 ?auto_18349 ) ) ( not ( = ?auto_18350 ?auto_18348 ) ) ( not ( = ?auto_18351 ?auto_18348 ) ) ( not ( = ?auto_18357 ?auto_18348 ) ) ( not ( = ?auto_18355 ?auto_18348 ) ) ( ON ?auto_18347 ?auto_18346 ) ( ON ?auto_18348 ?auto_18347 ) ( not ( = ?auto_18346 ?auto_18347 ) ) ( not ( = ?auto_18346 ?auto_18348 ) ) ( not ( = ?auto_18346 ?auto_18349 ) ) ( not ( = ?auto_18346 ?auto_18350 ) ) ( not ( = ?auto_18346 ?auto_18351 ) ) ( not ( = ?auto_18346 ?auto_18357 ) ) ( not ( = ?auto_18346 ?auto_18355 ) ) ( not ( = ?auto_18347 ?auto_18348 ) ) ( not ( = ?auto_18347 ?auto_18349 ) ) ( not ( = ?auto_18347 ?auto_18350 ) ) ( not ( = ?auto_18347 ?auto_18351 ) ) ( not ( = ?auto_18347 ?auto_18357 ) ) ( not ( = ?auto_18347 ?auto_18355 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18349 ?auto_18350 ?auto_18351 )
      ( MAKE-5CRATE-VERIFY ?auto_18346 ?auto_18347 ?auto_18348 ?auto_18349 ?auto_18350 ?auto_18351 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18359 - SURFACE
      ?auto_18360 - SURFACE
    )
    :vars
    (
      ?auto_18363 - HOIST
      ?auto_18362 - PLACE
      ?auto_18369 - SURFACE
      ?auto_18367 - PLACE
      ?auto_18365 - HOIST
      ?auto_18366 - SURFACE
      ?auto_18364 - SURFACE
      ?auto_18361 - TRUCK
      ?auto_18368 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18363 ?auto_18362 ) ( IS-CRATE ?auto_18360 ) ( not ( = ?auto_18359 ?auto_18360 ) ) ( not ( = ?auto_18369 ?auto_18359 ) ) ( not ( = ?auto_18369 ?auto_18360 ) ) ( not ( = ?auto_18367 ?auto_18362 ) ) ( HOIST-AT ?auto_18365 ?auto_18367 ) ( not ( = ?auto_18363 ?auto_18365 ) ) ( SURFACE-AT ?auto_18360 ?auto_18367 ) ( ON ?auto_18360 ?auto_18366 ) ( CLEAR ?auto_18360 ) ( not ( = ?auto_18359 ?auto_18366 ) ) ( not ( = ?auto_18360 ?auto_18366 ) ) ( not ( = ?auto_18369 ?auto_18366 ) ) ( IS-CRATE ?auto_18359 ) ( AVAILABLE ?auto_18365 ) ( SURFACE-AT ?auto_18359 ?auto_18367 ) ( ON ?auto_18359 ?auto_18364 ) ( CLEAR ?auto_18359 ) ( not ( = ?auto_18359 ?auto_18364 ) ) ( not ( = ?auto_18360 ?auto_18364 ) ) ( not ( = ?auto_18369 ?auto_18364 ) ) ( not ( = ?auto_18366 ?auto_18364 ) ) ( TRUCK-AT ?auto_18361 ?auto_18362 ) ( SURFACE-AT ?auto_18368 ?auto_18362 ) ( CLEAR ?auto_18368 ) ( IS-CRATE ?auto_18369 ) ( not ( = ?auto_18368 ?auto_18369 ) ) ( not ( = ?auto_18359 ?auto_18368 ) ) ( not ( = ?auto_18360 ?auto_18368 ) ) ( not ( = ?auto_18366 ?auto_18368 ) ) ( not ( = ?auto_18364 ?auto_18368 ) ) ( AVAILABLE ?auto_18363 ) ( IN ?auto_18369 ?auto_18361 ) )
    :subtasks
    ( ( !UNLOAD ?auto_18363 ?auto_18369 ?auto_18361 ?auto_18362 )
      ( MAKE-2CRATE ?auto_18369 ?auto_18359 ?auto_18360 )
      ( MAKE-1CRATE-VERIFY ?auto_18359 ?auto_18360 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18370 - SURFACE
      ?auto_18371 - SURFACE
      ?auto_18372 - SURFACE
    )
    :vars
    (
      ?auto_18378 - HOIST
      ?auto_18379 - PLACE
      ?auto_18376 - PLACE
      ?auto_18373 - HOIST
      ?auto_18377 - SURFACE
      ?auto_18380 - SURFACE
      ?auto_18375 - TRUCK
      ?auto_18374 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18378 ?auto_18379 ) ( IS-CRATE ?auto_18372 ) ( not ( = ?auto_18371 ?auto_18372 ) ) ( not ( = ?auto_18370 ?auto_18371 ) ) ( not ( = ?auto_18370 ?auto_18372 ) ) ( not ( = ?auto_18376 ?auto_18379 ) ) ( HOIST-AT ?auto_18373 ?auto_18376 ) ( not ( = ?auto_18378 ?auto_18373 ) ) ( SURFACE-AT ?auto_18372 ?auto_18376 ) ( ON ?auto_18372 ?auto_18377 ) ( CLEAR ?auto_18372 ) ( not ( = ?auto_18371 ?auto_18377 ) ) ( not ( = ?auto_18372 ?auto_18377 ) ) ( not ( = ?auto_18370 ?auto_18377 ) ) ( IS-CRATE ?auto_18371 ) ( AVAILABLE ?auto_18373 ) ( SURFACE-AT ?auto_18371 ?auto_18376 ) ( ON ?auto_18371 ?auto_18380 ) ( CLEAR ?auto_18371 ) ( not ( = ?auto_18371 ?auto_18380 ) ) ( not ( = ?auto_18372 ?auto_18380 ) ) ( not ( = ?auto_18370 ?auto_18380 ) ) ( not ( = ?auto_18377 ?auto_18380 ) ) ( TRUCK-AT ?auto_18375 ?auto_18379 ) ( SURFACE-AT ?auto_18374 ?auto_18379 ) ( CLEAR ?auto_18374 ) ( IS-CRATE ?auto_18370 ) ( not ( = ?auto_18374 ?auto_18370 ) ) ( not ( = ?auto_18371 ?auto_18374 ) ) ( not ( = ?auto_18372 ?auto_18374 ) ) ( not ( = ?auto_18377 ?auto_18374 ) ) ( not ( = ?auto_18380 ?auto_18374 ) ) ( AVAILABLE ?auto_18378 ) ( IN ?auto_18370 ?auto_18375 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18371 ?auto_18372 )
      ( MAKE-2CRATE-VERIFY ?auto_18370 ?auto_18371 ?auto_18372 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18381 - SURFACE
      ?auto_18382 - SURFACE
      ?auto_18383 - SURFACE
      ?auto_18384 - SURFACE
    )
    :vars
    (
      ?auto_18391 - HOIST
      ?auto_18387 - PLACE
      ?auto_18386 - PLACE
      ?auto_18389 - HOIST
      ?auto_18385 - SURFACE
      ?auto_18390 - SURFACE
      ?auto_18388 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18391 ?auto_18387 ) ( IS-CRATE ?auto_18384 ) ( not ( = ?auto_18383 ?auto_18384 ) ) ( not ( = ?auto_18382 ?auto_18383 ) ) ( not ( = ?auto_18382 ?auto_18384 ) ) ( not ( = ?auto_18386 ?auto_18387 ) ) ( HOIST-AT ?auto_18389 ?auto_18386 ) ( not ( = ?auto_18391 ?auto_18389 ) ) ( SURFACE-AT ?auto_18384 ?auto_18386 ) ( ON ?auto_18384 ?auto_18385 ) ( CLEAR ?auto_18384 ) ( not ( = ?auto_18383 ?auto_18385 ) ) ( not ( = ?auto_18384 ?auto_18385 ) ) ( not ( = ?auto_18382 ?auto_18385 ) ) ( IS-CRATE ?auto_18383 ) ( AVAILABLE ?auto_18389 ) ( SURFACE-AT ?auto_18383 ?auto_18386 ) ( ON ?auto_18383 ?auto_18390 ) ( CLEAR ?auto_18383 ) ( not ( = ?auto_18383 ?auto_18390 ) ) ( not ( = ?auto_18384 ?auto_18390 ) ) ( not ( = ?auto_18382 ?auto_18390 ) ) ( not ( = ?auto_18385 ?auto_18390 ) ) ( TRUCK-AT ?auto_18388 ?auto_18387 ) ( SURFACE-AT ?auto_18381 ?auto_18387 ) ( CLEAR ?auto_18381 ) ( IS-CRATE ?auto_18382 ) ( not ( = ?auto_18381 ?auto_18382 ) ) ( not ( = ?auto_18383 ?auto_18381 ) ) ( not ( = ?auto_18384 ?auto_18381 ) ) ( not ( = ?auto_18385 ?auto_18381 ) ) ( not ( = ?auto_18390 ?auto_18381 ) ) ( AVAILABLE ?auto_18391 ) ( IN ?auto_18382 ?auto_18388 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18382 ?auto_18383 ?auto_18384 )
      ( MAKE-3CRATE-VERIFY ?auto_18381 ?auto_18382 ?auto_18383 ?auto_18384 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18392 - SURFACE
      ?auto_18393 - SURFACE
      ?auto_18394 - SURFACE
      ?auto_18395 - SURFACE
      ?auto_18396 - SURFACE
    )
    :vars
    (
      ?auto_18403 - HOIST
      ?auto_18399 - PLACE
      ?auto_18398 - PLACE
      ?auto_18401 - HOIST
      ?auto_18397 - SURFACE
      ?auto_18402 - SURFACE
      ?auto_18400 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18403 ?auto_18399 ) ( IS-CRATE ?auto_18396 ) ( not ( = ?auto_18395 ?auto_18396 ) ) ( not ( = ?auto_18394 ?auto_18395 ) ) ( not ( = ?auto_18394 ?auto_18396 ) ) ( not ( = ?auto_18398 ?auto_18399 ) ) ( HOIST-AT ?auto_18401 ?auto_18398 ) ( not ( = ?auto_18403 ?auto_18401 ) ) ( SURFACE-AT ?auto_18396 ?auto_18398 ) ( ON ?auto_18396 ?auto_18397 ) ( CLEAR ?auto_18396 ) ( not ( = ?auto_18395 ?auto_18397 ) ) ( not ( = ?auto_18396 ?auto_18397 ) ) ( not ( = ?auto_18394 ?auto_18397 ) ) ( IS-CRATE ?auto_18395 ) ( AVAILABLE ?auto_18401 ) ( SURFACE-AT ?auto_18395 ?auto_18398 ) ( ON ?auto_18395 ?auto_18402 ) ( CLEAR ?auto_18395 ) ( not ( = ?auto_18395 ?auto_18402 ) ) ( not ( = ?auto_18396 ?auto_18402 ) ) ( not ( = ?auto_18394 ?auto_18402 ) ) ( not ( = ?auto_18397 ?auto_18402 ) ) ( TRUCK-AT ?auto_18400 ?auto_18399 ) ( SURFACE-AT ?auto_18393 ?auto_18399 ) ( CLEAR ?auto_18393 ) ( IS-CRATE ?auto_18394 ) ( not ( = ?auto_18393 ?auto_18394 ) ) ( not ( = ?auto_18395 ?auto_18393 ) ) ( not ( = ?auto_18396 ?auto_18393 ) ) ( not ( = ?auto_18397 ?auto_18393 ) ) ( not ( = ?auto_18402 ?auto_18393 ) ) ( AVAILABLE ?auto_18403 ) ( IN ?auto_18394 ?auto_18400 ) ( ON ?auto_18393 ?auto_18392 ) ( not ( = ?auto_18392 ?auto_18393 ) ) ( not ( = ?auto_18392 ?auto_18394 ) ) ( not ( = ?auto_18392 ?auto_18395 ) ) ( not ( = ?auto_18392 ?auto_18396 ) ) ( not ( = ?auto_18392 ?auto_18397 ) ) ( not ( = ?auto_18392 ?auto_18402 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18394 ?auto_18395 ?auto_18396 )
      ( MAKE-4CRATE-VERIFY ?auto_18392 ?auto_18393 ?auto_18394 ?auto_18395 ?auto_18396 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18404 - SURFACE
      ?auto_18405 - SURFACE
      ?auto_18406 - SURFACE
      ?auto_18407 - SURFACE
      ?auto_18408 - SURFACE
      ?auto_18409 - SURFACE
    )
    :vars
    (
      ?auto_18416 - HOIST
      ?auto_18412 - PLACE
      ?auto_18411 - PLACE
      ?auto_18414 - HOIST
      ?auto_18410 - SURFACE
      ?auto_18415 - SURFACE
      ?auto_18413 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18416 ?auto_18412 ) ( IS-CRATE ?auto_18409 ) ( not ( = ?auto_18408 ?auto_18409 ) ) ( not ( = ?auto_18407 ?auto_18408 ) ) ( not ( = ?auto_18407 ?auto_18409 ) ) ( not ( = ?auto_18411 ?auto_18412 ) ) ( HOIST-AT ?auto_18414 ?auto_18411 ) ( not ( = ?auto_18416 ?auto_18414 ) ) ( SURFACE-AT ?auto_18409 ?auto_18411 ) ( ON ?auto_18409 ?auto_18410 ) ( CLEAR ?auto_18409 ) ( not ( = ?auto_18408 ?auto_18410 ) ) ( not ( = ?auto_18409 ?auto_18410 ) ) ( not ( = ?auto_18407 ?auto_18410 ) ) ( IS-CRATE ?auto_18408 ) ( AVAILABLE ?auto_18414 ) ( SURFACE-AT ?auto_18408 ?auto_18411 ) ( ON ?auto_18408 ?auto_18415 ) ( CLEAR ?auto_18408 ) ( not ( = ?auto_18408 ?auto_18415 ) ) ( not ( = ?auto_18409 ?auto_18415 ) ) ( not ( = ?auto_18407 ?auto_18415 ) ) ( not ( = ?auto_18410 ?auto_18415 ) ) ( TRUCK-AT ?auto_18413 ?auto_18412 ) ( SURFACE-AT ?auto_18406 ?auto_18412 ) ( CLEAR ?auto_18406 ) ( IS-CRATE ?auto_18407 ) ( not ( = ?auto_18406 ?auto_18407 ) ) ( not ( = ?auto_18408 ?auto_18406 ) ) ( not ( = ?auto_18409 ?auto_18406 ) ) ( not ( = ?auto_18410 ?auto_18406 ) ) ( not ( = ?auto_18415 ?auto_18406 ) ) ( AVAILABLE ?auto_18416 ) ( IN ?auto_18407 ?auto_18413 ) ( ON ?auto_18405 ?auto_18404 ) ( ON ?auto_18406 ?auto_18405 ) ( not ( = ?auto_18404 ?auto_18405 ) ) ( not ( = ?auto_18404 ?auto_18406 ) ) ( not ( = ?auto_18404 ?auto_18407 ) ) ( not ( = ?auto_18404 ?auto_18408 ) ) ( not ( = ?auto_18404 ?auto_18409 ) ) ( not ( = ?auto_18404 ?auto_18410 ) ) ( not ( = ?auto_18404 ?auto_18415 ) ) ( not ( = ?auto_18405 ?auto_18406 ) ) ( not ( = ?auto_18405 ?auto_18407 ) ) ( not ( = ?auto_18405 ?auto_18408 ) ) ( not ( = ?auto_18405 ?auto_18409 ) ) ( not ( = ?auto_18405 ?auto_18410 ) ) ( not ( = ?auto_18405 ?auto_18415 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18407 ?auto_18408 ?auto_18409 )
      ( MAKE-5CRATE-VERIFY ?auto_18404 ?auto_18405 ?auto_18406 ?auto_18407 ?auto_18408 ?auto_18409 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18417 - SURFACE
      ?auto_18418 - SURFACE
    )
    :vars
    (
      ?auto_18425 - HOIST
      ?auto_18421 - PLACE
      ?auto_18427 - SURFACE
      ?auto_18420 - PLACE
      ?auto_18423 - HOIST
      ?auto_18419 - SURFACE
      ?auto_18424 - SURFACE
      ?auto_18426 - SURFACE
      ?auto_18422 - TRUCK
      ?auto_18428 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18425 ?auto_18421 ) ( IS-CRATE ?auto_18418 ) ( not ( = ?auto_18417 ?auto_18418 ) ) ( not ( = ?auto_18427 ?auto_18417 ) ) ( not ( = ?auto_18427 ?auto_18418 ) ) ( not ( = ?auto_18420 ?auto_18421 ) ) ( HOIST-AT ?auto_18423 ?auto_18420 ) ( not ( = ?auto_18425 ?auto_18423 ) ) ( SURFACE-AT ?auto_18418 ?auto_18420 ) ( ON ?auto_18418 ?auto_18419 ) ( CLEAR ?auto_18418 ) ( not ( = ?auto_18417 ?auto_18419 ) ) ( not ( = ?auto_18418 ?auto_18419 ) ) ( not ( = ?auto_18427 ?auto_18419 ) ) ( IS-CRATE ?auto_18417 ) ( AVAILABLE ?auto_18423 ) ( SURFACE-AT ?auto_18417 ?auto_18420 ) ( ON ?auto_18417 ?auto_18424 ) ( CLEAR ?auto_18417 ) ( not ( = ?auto_18417 ?auto_18424 ) ) ( not ( = ?auto_18418 ?auto_18424 ) ) ( not ( = ?auto_18427 ?auto_18424 ) ) ( not ( = ?auto_18419 ?auto_18424 ) ) ( SURFACE-AT ?auto_18426 ?auto_18421 ) ( CLEAR ?auto_18426 ) ( IS-CRATE ?auto_18427 ) ( not ( = ?auto_18426 ?auto_18427 ) ) ( not ( = ?auto_18417 ?auto_18426 ) ) ( not ( = ?auto_18418 ?auto_18426 ) ) ( not ( = ?auto_18419 ?auto_18426 ) ) ( not ( = ?auto_18424 ?auto_18426 ) ) ( AVAILABLE ?auto_18425 ) ( IN ?auto_18427 ?auto_18422 ) ( TRUCK-AT ?auto_18422 ?auto_18428 ) ( not ( = ?auto_18428 ?auto_18421 ) ) ( not ( = ?auto_18420 ?auto_18428 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18422 ?auto_18428 ?auto_18421 )
      ( MAKE-2CRATE ?auto_18427 ?auto_18417 ?auto_18418 )
      ( MAKE-1CRATE-VERIFY ?auto_18417 ?auto_18418 ) )
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
      ?auto_18435 - HOIST
      ?auto_18437 - PLACE
      ?auto_18433 - PLACE
      ?auto_18439 - HOIST
      ?auto_18438 - SURFACE
      ?auto_18436 - SURFACE
      ?auto_18434 - SURFACE
      ?auto_18432 - TRUCK
      ?auto_18440 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18435 ?auto_18437 ) ( IS-CRATE ?auto_18431 ) ( not ( = ?auto_18430 ?auto_18431 ) ) ( not ( = ?auto_18429 ?auto_18430 ) ) ( not ( = ?auto_18429 ?auto_18431 ) ) ( not ( = ?auto_18433 ?auto_18437 ) ) ( HOIST-AT ?auto_18439 ?auto_18433 ) ( not ( = ?auto_18435 ?auto_18439 ) ) ( SURFACE-AT ?auto_18431 ?auto_18433 ) ( ON ?auto_18431 ?auto_18438 ) ( CLEAR ?auto_18431 ) ( not ( = ?auto_18430 ?auto_18438 ) ) ( not ( = ?auto_18431 ?auto_18438 ) ) ( not ( = ?auto_18429 ?auto_18438 ) ) ( IS-CRATE ?auto_18430 ) ( AVAILABLE ?auto_18439 ) ( SURFACE-AT ?auto_18430 ?auto_18433 ) ( ON ?auto_18430 ?auto_18436 ) ( CLEAR ?auto_18430 ) ( not ( = ?auto_18430 ?auto_18436 ) ) ( not ( = ?auto_18431 ?auto_18436 ) ) ( not ( = ?auto_18429 ?auto_18436 ) ) ( not ( = ?auto_18438 ?auto_18436 ) ) ( SURFACE-AT ?auto_18434 ?auto_18437 ) ( CLEAR ?auto_18434 ) ( IS-CRATE ?auto_18429 ) ( not ( = ?auto_18434 ?auto_18429 ) ) ( not ( = ?auto_18430 ?auto_18434 ) ) ( not ( = ?auto_18431 ?auto_18434 ) ) ( not ( = ?auto_18438 ?auto_18434 ) ) ( not ( = ?auto_18436 ?auto_18434 ) ) ( AVAILABLE ?auto_18435 ) ( IN ?auto_18429 ?auto_18432 ) ( TRUCK-AT ?auto_18432 ?auto_18440 ) ( not ( = ?auto_18440 ?auto_18437 ) ) ( not ( = ?auto_18433 ?auto_18440 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18430 ?auto_18431 )
      ( MAKE-2CRATE-VERIFY ?auto_18429 ?auto_18430 ?auto_18431 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18441 - SURFACE
      ?auto_18442 - SURFACE
      ?auto_18443 - SURFACE
      ?auto_18444 - SURFACE
    )
    :vars
    (
      ?auto_18451 - HOIST
      ?auto_18446 - PLACE
      ?auto_18449 - PLACE
      ?auto_18452 - HOIST
      ?auto_18450 - SURFACE
      ?auto_18447 - SURFACE
      ?auto_18445 - TRUCK
      ?auto_18448 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18451 ?auto_18446 ) ( IS-CRATE ?auto_18444 ) ( not ( = ?auto_18443 ?auto_18444 ) ) ( not ( = ?auto_18442 ?auto_18443 ) ) ( not ( = ?auto_18442 ?auto_18444 ) ) ( not ( = ?auto_18449 ?auto_18446 ) ) ( HOIST-AT ?auto_18452 ?auto_18449 ) ( not ( = ?auto_18451 ?auto_18452 ) ) ( SURFACE-AT ?auto_18444 ?auto_18449 ) ( ON ?auto_18444 ?auto_18450 ) ( CLEAR ?auto_18444 ) ( not ( = ?auto_18443 ?auto_18450 ) ) ( not ( = ?auto_18444 ?auto_18450 ) ) ( not ( = ?auto_18442 ?auto_18450 ) ) ( IS-CRATE ?auto_18443 ) ( AVAILABLE ?auto_18452 ) ( SURFACE-AT ?auto_18443 ?auto_18449 ) ( ON ?auto_18443 ?auto_18447 ) ( CLEAR ?auto_18443 ) ( not ( = ?auto_18443 ?auto_18447 ) ) ( not ( = ?auto_18444 ?auto_18447 ) ) ( not ( = ?auto_18442 ?auto_18447 ) ) ( not ( = ?auto_18450 ?auto_18447 ) ) ( SURFACE-AT ?auto_18441 ?auto_18446 ) ( CLEAR ?auto_18441 ) ( IS-CRATE ?auto_18442 ) ( not ( = ?auto_18441 ?auto_18442 ) ) ( not ( = ?auto_18443 ?auto_18441 ) ) ( not ( = ?auto_18444 ?auto_18441 ) ) ( not ( = ?auto_18450 ?auto_18441 ) ) ( not ( = ?auto_18447 ?auto_18441 ) ) ( AVAILABLE ?auto_18451 ) ( IN ?auto_18442 ?auto_18445 ) ( TRUCK-AT ?auto_18445 ?auto_18448 ) ( not ( = ?auto_18448 ?auto_18446 ) ) ( not ( = ?auto_18449 ?auto_18448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18442 ?auto_18443 ?auto_18444 )
      ( MAKE-3CRATE-VERIFY ?auto_18441 ?auto_18442 ?auto_18443 ?auto_18444 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18453 - SURFACE
      ?auto_18454 - SURFACE
      ?auto_18455 - SURFACE
      ?auto_18456 - SURFACE
      ?auto_18457 - SURFACE
    )
    :vars
    (
      ?auto_18464 - HOIST
      ?auto_18459 - PLACE
      ?auto_18462 - PLACE
      ?auto_18465 - HOIST
      ?auto_18463 - SURFACE
      ?auto_18460 - SURFACE
      ?auto_18458 - TRUCK
      ?auto_18461 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18464 ?auto_18459 ) ( IS-CRATE ?auto_18457 ) ( not ( = ?auto_18456 ?auto_18457 ) ) ( not ( = ?auto_18455 ?auto_18456 ) ) ( not ( = ?auto_18455 ?auto_18457 ) ) ( not ( = ?auto_18462 ?auto_18459 ) ) ( HOIST-AT ?auto_18465 ?auto_18462 ) ( not ( = ?auto_18464 ?auto_18465 ) ) ( SURFACE-AT ?auto_18457 ?auto_18462 ) ( ON ?auto_18457 ?auto_18463 ) ( CLEAR ?auto_18457 ) ( not ( = ?auto_18456 ?auto_18463 ) ) ( not ( = ?auto_18457 ?auto_18463 ) ) ( not ( = ?auto_18455 ?auto_18463 ) ) ( IS-CRATE ?auto_18456 ) ( AVAILABLE ?auto_18465 ) ( SURFACE-AT ?auto_18456 ?auto_18462 ) ( ON ?auto_18456 ?auto_18460 ) ( CLEAR ?auto_18456 ) ( not ( = ?auto_18456 ?auto_18460 ) ) ( not ( = ?auto_18457 ?auto_18460 ) ) ( not ( = ?auto_18455 ?auto_18460 ) ) ( not ( = ?auto_18463 ?auto_18460 ) ) ( SURFACE-AT ?auto_18454 ?auto_18459 ) ( CLEAR ?auto_18454 ) ( IS-CRATE ?auto_18455 ) ( not ( = ?auto_18454 ?auto_18455 ) ) ( not ( = ?auto_18456 ?auto_18454 ) ) ( not ( = ?auto_18457 ?auto_18454 ) ) ( not ( = ?auto_18463 ?auto_18454 ) ) ( not ( = ?auto_18460 ?auto_18454 ) ) ( AVAILABLE ?auto_18464 ) ( IN ?auto_18455 ?auto_18458 ) ( TRUCK-AT ?auto_18458 ?auto_18461 ) ( not ( = ?auto_18461 ?auto_18459 ) ) ( not ( = ?auto_18462 ?auto_18461 ) ) ( ON ?auto_18454 ?auto_18453 ) ( not ( = ?auto_18453 ?auto_18454 ) ) ( not ( = ?auto_18453 ?auto_18455 ) ) ( not ( = ?auto_18453 ?auto_18456 ) ) ( not ( = ?auto_18453 ?auto_18457 ) ) ( not ( = ?auto_18453 ?auto_18463 ) ) ( not ( = ?auto_18453 ?auto_18460 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18455 ?auto_18456 ?auto_18457 )
      ( MAKE-4CRATE-VERIFY ?auto_18453 ?auto_18454 ?auto_18455 ?auto_18456 ?auto_18457 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18466 - SURFACE
      ?auto_18467 - SURFACE
      ?auto_18468 - SURFACE
      ?auto_18469 - SURFACE
      ?auto_18470 - SURFACE
      ?auto_18471 - SURFACE
    )
    :vars
    (
      ?auto_18478 - HOIST
      ?auto_18473 - PLACE
      ?auto_18476 - PLACE
      ?auto_18479 - HOIST
      ?auto_18477 - SURFACE
      ?auto_18474 - SURFACE
      ?auto_18472 - TRUCK
      ?auto_18475 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18478 ?auto_18473 ) ( IS-CRATE ?auto_18471 ) ( not ( = ?auto_18470 ?auto_18471 ) ) ( not ( = ?auto_18469 ?auto_18470 ) ) ( not ( = ?auto_18469 ?auto_18471 ) ) ( not ( = ?auto_18476 ?auto_18473 ) ) ( HOIST-AT ?auto_18479 ?auto_18476 ) ( not ( = ?auto_18478 ?auto_18479 ) ) ( SURFACE-AT ?auto_18471 ?auto_18476 ) ( ON ?auto_18471 ?auto_18477 ) ( CLEAR ?auto_18471 ) ( not ( = ?auto_18470 ?auto_18477 ) ) ( not ( = ?auto_18471 ?auto_18477 ) ) ( not ( = ?auto_18469 ?auto_18477 ) ) ( IS-CRATE ?auto_18470 ) ( AVAILABLE ?auto_18479 ) ( SURFACE-AT ?auto_18470 ?auto_18476 ) ( ON ?auto_18470 ?auto_18474 ) ( CLEAR ?auto_18470 ) ( not ( = ?auto_18470 ?auto_18474 ) ) ( not ( = ?auto_18471 ?auto_18474 ) ) ( not ( = ?auto_18469 ?auto_18474 ) ) ( not ( = ?auto_18477 ?auto_18474 ) ) ( SURFACE-AT ?auto_18468 ?auto_18473 ) ( CLEAR ?auto_18468 ) ( IS-CRATE ?auto_18469 ) ( not ( = ?auto_18468 ?auto_18469 ) ) ( not ( = ?auto_18470 ?auto_18468 ) ) ( not ( = ?auto_18471 ?auto_18468 ) ) ( not ( = ?auto_18477 ?auto_18468 ) ) ( not ( = ?auto_18474 ?auto_18468 ) ) ( AVAILABLE ?auto_18478 ) ( IN ?auto_18469 ?auto_18472 ) ( TRUCK-AT ?auto_18472 ?auto_18475 ) ( not ( = ?auto_18475 ?auto_18473 ) ) ( not ( = ?auto_18476 ?auto_18475 ) ) ( ON ?auto_18467 ?auto_18466 ) ( ON ?auto_18468 ?auto_18467 ) ( not ( = ?auto_18466 ?auto_18467 ) ) ( not ( = ?auto_18466 ?auto_18468 ) ) ( not ( = ?auto_18466 ?auto_18469 ) ) ( not ( = ?auto_18466 ?auto_18470 ) ) ( not ( = ?auto_18466 ?auto_18471 ) ) ( not ( = ?auto_18466 ?auto_18477 ) ) ( not ( = ?auto_18466 ?auto_18474 ) ) ( not ( = ?auto_18467 ?auto_18468 ) ) ( not ( = ?auto_18467 ?auto_18469 ) ) ( not ( = ?auto_18467 ?auto_18470 ) ) ( not ( = ?auto_18467 ?auto_18471 ) ) ( not ( = ?auto_18467 ?auto_18477 ) ) ( not ( = ?auto_18467 ?auto_18474 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18469 ?auto_18470 ?auto_18471 )
      ( MAKE-5CRATE-VERIFY ?auto_18466 ?auto_18467 ?auto_18468 ?auto_18469 ?auto_18470 ?auto_18471 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18480 - SURFACE
      ?auto_18481 - SURFACE
    )
    :vars
    (
      ?auto_18489 - HOIST
      ?auto_18483 - PLACE
      ?auto_18491 - SURFACE
      ?auto_18486 - PLACE
      ?auto_18490 - HOIST
      ?auto_18488 - SURFACE
      ?auto_18484 - SURFACE
      ?auto_18487 - SURFACE
      ?auto_18482 - TRUCK
      ?auto_18485 - PLACE
      ?auto_18492 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18489 ?auto_18483 ) ( IS-CRATE ?auto_18481 ) ( not ( = ?auto_18480 ?auto_18481 ) ) ( not ( = ?auto_18491 ?auto_18480 ) ) ( not ( = ?auto_18491 ?auto_18481 ) ) ( not ( = ?auto_18486 ?auto_18483 ) ) ( HOIST-AT ?auto_18490 ?auto_18486 ) ( not ( = ?auto_18489 ?auto_18490 ) ) ( SURFACE-AT ?auto_18481 ?auto_18486 ) ( ON ?auto_18481 ?auto_18488 ) ( CLEAR ?auto_18481 ) ( not ( = ?auto_18480 ?auto_18488 ) ) ( not ( = ?auto_18481 ?auto_18488 ) ) ( not ( = ?auto_18491 ?auto_18488 ) ) ( IS-CRATE ?auto_18480 ) ( AVAILABLE ?auto_18490 ) ( SURFACE-AT ?auto_18480 ?auto_18486 ) ( ON ?auto_18480 ?auto_18484 ) ( CLEAR ?auto_18480 ) ( not ( = ?auto_18480 ?auto_18484 ) ) ( not ( = ?auto_18481 ?auto_18484 ) ) ( not ( = ?auto_18491 ?auto_18484 ) ) ( not ( = ?auto_18488 ?auto_18484 ) ) ( SURFACE-AT ?auto_18487 ?auto_18483 ) ( CLEAR ?auto_18487 ) ( IS-CRATE ?auto_18491 ) ( not ( = ?auto_18487 ?auto_18491 ) ) ( not ( = ?auto_18480 ?auto_18487 ) ) ( not ( = ?auto_18481 ?auto_18487 ) ) ( not ( = ?auto_18488 ?auto_18487 ) ) ( not ( = ?auto_18484 ?auto_18487 ) ) ( AVAILABLE ?auto_18489 ) ( TRUCK-AT ?auto_18482 ?auto_18485 ) ( not ( = ?auto_18485 ?auto_18483 ) ) ( not ( = ?auto_18486 ?auto_18485 ) ) ( HOIST-AT ?auto_18492 ?auto_18485 ) ( LIFTING ?auto_18492 ?auto_18491 ) ( not ( = ?auto_18489 ?auto_18492 ) ) ( not ( = ?auto_18490 ?auto_18492 ) ) )
    :subtasks
    ( ( !LOAD ?auto_18492 ?auto_18491 ?auto_18482 ?auto_18485 )
      ( MAKE-2CRATE ?auto_18491 ?auto_18480 ?auto_18481 )
      ( MAKE-1CRATE-VERIFY ?auto_18480 ?auto_18481 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18493 - SURFACE
      ?auto_18494 - SURFACE
      ?auto_18495 - SURFACE
    )
    :vars
    (
      ?auto_18501 - HOIST
      ?auto_18500 - PLACE
      ?auto_18503 - PLACE
      ?auto_18502 - HOIST
      ?auto_18499 - SURFACE
      ?auto_18496 - SURFACE
      ?auto_18505 - SURFACE
      ?auto_18498 - TRUCK
      ?auto_18497 - PLACE
      ?auto_18504 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18501 ?auto_18500 ) ( IS-CRATE ?auto_18495 ) ( not ( = ?auto_18494 ?auto_18495 ) ) ( not ( = ?auto_18493 ?auto_18494 ) ) ( not ( = ?auto_18493 ?auto_18495 ) ) ( not ( = ?auto_18503 ?auto_18500 ) ) ( HOIST-AT ?auto_18502 ?auto_18503 ) ( not ( = ?auto_18501 ?auto_18502 ) ) ( SURFACE-AT ?auto_18495 ?auto_18503 ) ( ON ?auto_18495 ?auto_18499 ) ( CLEAR ?auto_18495 ) ( not ( = ?auto_18494 ?auto_18499 ) ) ( not ( = ?auto_18495 ?auto_18499 ) ) ( not ( = ?auto_18493 ?auto_18499 ) ) ( IS-CRATE ?auto_18494 ) ( AVAILABLE ?auto_18502 ) ( SURFACE-AT ?auto_18494 ?auto_18503 ) ( ON ?auto_18494 ?auto_18496 ) ( CLEAR ?auto_18494 ) ( not ( = ?auto_18494 ?auto_18496 ) ) ( not ( = ?auto_18495 ?auto_18496 ) ) ( not ( = ?auto_18493 ?auto_18496 ) ) ( not ( = ?auto_18499 ?auto_18496 ) ) ( SURFACE-AT ?auto_18505 ?auto_18500 ) ( CLEAR ?auto_18505 ) ( IS-CRATE ?auto_18493 ) ( not ( = ?auto_18505 ?auto_18493 ) ) ( not ( = ?auto_18494 ?auto_18505 ) ) ( not ( = ?auto_18495 ?auto_18505 ) ) ( not ( = ?auto_18499 ?auto_18505 ) ) ( not ( = ?auto_18496 ?auto_18505 ) ) ( AVAILABLE ?auto_18501 ) ( TRUCK-AT ?auto_18498 ?auto_18497 ) ( not ( = ?auto_18497 ?auto_18500 ) ) ( not ( = ?auto_18503 ?auto_18497 ) ) ( HOIST-AT ?auto_18504 ?auto_18497 ) ( LIFTING ?auto_18504 ?auto_18493 ) ( not ( = ?auto_18501 ?auto_18504 ) ) ( not ( = ?auto_18502 ?auto_18504 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18494 ?auto_18495 )
      ( MAKE-2CRATE-VERIFY ?auto_18493 ?auto_18494 ?auto_18495 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18506 - SURFACE
      ?auto_18507 - SURFACE
      ?auto_18508 - SURFACE
      ?auto_18509 - SURFACE
    )
    :vars
    (
      ?auto_18518 - HOIST
      ?auto_18513 - PLACE
      ?auto_18510 - PLACE
      ?auto_18517 - HOIST
      ?auto_18514 - SURFACE
      ?auto_18516 - SURFACE
      ?auto_18515 - TRUCK
      ?auto_18512 - PLACE
      ?auto_18511 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18518 ?auto_18513 ) ( IS-CRATE ?auto_18509 ) ( not ( = ?auto_18508 ?auto_18509 ) ) ( not ( = ?auto_18507 ?auto_18508 ) ) ( not ( = ?auto_18507 ?auto_18509 ) ) ( not ( = ?auto_18510 ?auto_18513 ) ) ( HOIST-AT ?auto_18517 ?auto_18510 ) ( not ( = ?auto_18518 ?auto_18517 ) ) ( SURFACE-AT ?auto_18509 ?auto_18510 ) ( ON ?auto_18509 ?auto_18514 ) ( CLEAR ?auto_18509 ) ( not ( = ?auto_18508 ?auto_18514 ) ) ( not ( = ?auto_18509 ?auto_18514 ) ) ( not ( = ?auto_18507 ?auto_18514 ) ) ( IS-CRATE ?auto_18508 ) ( AVAILABLE ?auto_18517 ) ( SURFACE-AT ?auto_18508 ?auto_18510 ) ( ON ?auto_18508 ?auto_18516 ) ( CLEAR ?auto_18508 ) ( not ( = ?auto_18508 ?auto_18516 ) ) ( not ( = ?auto_18509 ?auto_18516 ) ) ( not ( = ?auto_18507 ?auto_18516 ) ) ( not ( = ?auto_18514 ?auto_18516 ) ) ( SURFACE-AT ?auto_18506 ?auto_18513 ) ( CLEAR ?auto_18506 ) ( IS-CRATE ?auto_18507 ) ( not ( = ?auto_18506 ?auto_18507 ) ) ( not ( = ?auto_18508 ?auto_18506 ) ) ( not ( = ?auto_18509 ?auto_18506 ) ) ( not ( = ?auto_18514 ?auto_18506 ) ) ( not ( = ?auto_18516 ?auto_18506 ) ) ( AVAILABLE ?auto_18518 ) ( TRUCK-AT ?auto_18515 ?auto_18512 ) ( not ( = ?auto_18512 ?auto_18513 ) ) ( not ( = ?auto_18510 ?auto_18512 ) ) ( HOIST-AT ?auto_18511 ?auto_18512 ) ( LIFTING ?auto_18511 ?auto_18507 ) ( not ( = ?auto_18518 ?auto_18511 ) ) ( not ( = ?auto_18517 ?auto_18511 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18507 ?auto_18508 ?auto_18509 )
      ( MAKE-3CRATE-VERIFY ?auto_18506 ?auto_18507 ?auto_18508 ?auto_18509 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18519 - SURFACE
      ?auto_18520 - SURFACE
      ?auto_18521 - SURFACE
      ?auto_18522 - SURFACE
      ?auto_18523 - SURFACE
    )
    :vars
    (
      ?auto_18532 - HOIST
      ?auto_18527 - PLACE
      ?auto_18524 - PLACE
      ?auto_18531 - HOIST
      ?auto_18528 - SURFACE
      ?auto_18530 - SURFACE
      ?auto_18529 - TRUCK
      ?auto_18526 - PLACE
      ?auto_18525 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18532 ?auto_18527 ) ( IS-CRATE ?auto_18523 ) ( not ( = ?auto_18522 ?auto_18523 ) ) ( not ( = ?auto_18521 ?auto_18522 ) ) ( not ( = ?auto_18521 ?auto_18523 ) ) ( not ( = ?auto_18524 ?auto_18527 ) ) ( HOIST-AT ?auto_18531 ?auto_18524 ) ( not ( = ?auto_18532 ?auto_18531 ) ) ( SURFACE-AT ?auto_18523 ?auto_18524 ) ( ON ?auto_18523 ?auto_18528 ) ( CLEAR ?auto_18523 ) ( not ( = ?auto_18522 ?auto_18528 ) ) ( not ( = ?auto_18523 ?auto_18528 ) ) ( not ( = ?auto_18521 ?auto_18528 ) ) ( IS-CRATE ?auto_18522 ) ( AVAILABLE ?auto_18531 ) ( SURFACE-AT ?auto_18522 ?auto_18524 ) ( ON ?auto_18522 ?auto_18530 ) ( CLEAR ?auto_18522 ) ( not ( = ?auto_18522 ?auto_18530 ) ) ( not ( = ?auto_18523 ?auto_18530 ) ) ( not ( = ?auto_18521 ?auto_18530 ) ) ( not ( = ?auto_18528 ?auto_18530 ) ) ( SURFACE-AT ?auto_18520 ?auto_18527 ) ( CLEAR ?auto_18520 ) ( IS-CRATE ?auto_18521 ) ( not ( = ?auto_18520 ?auto_18521 ) ) ( not ( = ?auto_18522 ?auto_18520 ) ) ( not ( = ?auto_18523 ?auto_18520 ) ) ( not ( = ?auto_18528 ?auto_18520 ) ) ( not ( = ?auto_18530 ?auto_18520 ) ) ( AVAILABLE ?auto_18532 ) ( TRUCK-AT ?auto_18529 ?auto_18526 ) ( not ( = ?auto_18526 ?auto_18527 ) ) ( not ( = ?auto_18524 ?auto_18526 ) ) ( HOIST-AT ?auto_18525 ?auto_18526 ) ( LIFTING ?auto_18525 ?auto_18521 ) ( not ( = ?auto_18532 ?auto_18525 ) ) ( not ( = ?auto_18531 ?auto_18525 ) ) ( ON ?auto_18520 ?auto_18519 ) ( not ( = ?auto_18519 ?auto_18520 ) ) ( not ( = ?auto_18519 ?auto_18521 ) ) ( not ( = ?auto_18519 ?auto_18522 ) ) ( not ( = ?auto_18519 ?auto_18523 ) ) ( not ( = ?auto_18519 ?auto_18528 ) ) ( not ( = ?auto_18519 ?auto_18530 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18521 ?auto_18522 ?auto_18523 )
      ( MAKE-4CRATE-VERIFY ?auto_18519 ?auto_18520 ?auto_18521 ?auto_18522 ?auto_18523 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18533 - SURFACE
      ?auto_18534 - SURFACE
      ?auto_18535 - SURFACE
      ?auto_18536 - SURFACE
      ?auto_18537 - SURFACE
      ?auto_18538 - SURFACE
    )
    :vars
    (
      ?auto_18547 - HOIST
      ?auto_18542 - PLACE
      ?auto_18539 - PLACE
      ?auto_18546 - HOIST
      ?auto_18543 - SURFACE
      ?auto_18545 - SURFACE
      ?auto_18544 - TRUCK
      ?auto_18541 - PLACE
      ?auto_18540 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18547 ?auto_18542 ) ( IS-CRATE ?auto_18538 ) ( not ( = ?auto_18537 ?auto_18538 ) ) ( not ( = ?auto_18536 ?auto_18537 ) ) ( not ( = ?auto_18536 ?auto_18538 ) ) ( not ( = ?auto_18539 ?auto_18542 ) ) ( HOIST-AT ?auto_18546 ?auto_18539 ) ( not ( = ?auto_18547 ?auto_18546 ) ) ( SURFACE-AT ?auto_18538 ?auto_18539 ) ( ON ?auto_18538 ?auto_18543 ) ( CLEAR ?auto_18538 ) ( not ( = ?auto_18537 ?auto_18543 ) ) ( not ( = ?auto_18538 ?auto_18543 ) ) ( not ( = ?auto_18536 ?auto_18543 ) ) ( IS-CRATE ?auto_18537 ) ( AVAILABLE ?auto_18546 ) ( SURFACE-AT ?auto_18537 ?auto_18539 ) ( ON ?auto_18537 ?auto_18545 ) ( CLEAR ?auto_18537 ) ( not ( = ?auto_18537 ?auto_18545 ) ) ( not ( = ?auto_18538 ?auto_18545 ) ) ( not ( = ?auto_18536 ?auto_18545 ) ) ( not ( = ?auto_18543 ?auto_18545 ) ) ( SURFACE-AT ?auto_18535 ?auto_18542 ) ( CLEAR ?auto_18535 ) ( IS-CRATE ?auto_18536 ) ( not ( = ?auto_18535 ?auto_18536 ) ) ( not ( = ?auto_18537 ?auto_18535 ) ) ( not ( = ?auto_18538 ?auto_18535 ) ) ( not ( = ?auto_18543 ?auto_18535 ) ) ( not ( = ?auto_18545 ?auto_18535 ) ) ( AVAILABLE ?auto_18547 ) ( TRUCK-AT ?auto_18544 ?auto_18541 ) ( not ( = ?auto_18541 ?auto_18542 ) ) ( not ( = ?auto_18539 ?auto_18541 ) ) ( HOIST-AT ?auto_18540 ?auto_18541 ) ( LIFTING ?auto_18540 ?auto_18536 ) ( not ( = ?auto_18547 ?auto_18540 ) ) ( not ( = ?auto_18546 ?auto_18540 ) ) ( ON ?auto_18534 ?auto_18533 ) ( ON ?auto_18535 ?auto_18534 ) ( not ( = ?auto_18533 ?auto_18534 ) ) ( not ( = ?auto_18533 ?auto_18535 ) ) ( not ( = ?auto_18533 ?auto_18536 ) ) ( not ( = ?auto_18533 ?auto_18537 ) ) ( not ( = ?auto_18533 ?auto_18538 ) ) ( not ( = ?auto_18533 ?auto_18543 ) ) ( not ( = ?auto_18533 ?auto_18545 ) ) ( not ( = ?auto_18534 ?auto_18535 ) ) ( not ( = ?auto_18534 ?auto_18536 ) ) ( not ( = ?auto_18534 ?auto_18537 ) ) ( not ( = ?auto_18534 ?auto_18538 ) ) ( not ( = ?auto_18534 ?auto_18543 ) ) ( not ( = ?auto_18534 ?auto_18545 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18536 ?auto_18537 ?auto_18538 )
      ( MAKE-5CRATE-VERIFY ?auto_18533 ?auto_18534 ?auto_18535 ?auto_18536 ?auto_18537 ?auto_18538 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18548 - SURFACE
      ?auto_18549 - SURFACE
    )
    :vars
    (
      ?auto_18559 - HOIST
      ?auto_18553 - PLACE
      ?auto_18560 - SURFACE
      ?auto_18550 - PLACE
      ?auto_18557 - HOIST
      ?auto_18554 - SURFACE
      ?auto_18556 - SURFACE
      ?auto_18558 - SURFACE
      ?auto_18555 - TRUCK
      ?auto_18552 - PLACE
      ?auto_18551 - HOIST
      ?auto_18561 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18559 ?auto_18553 ) ( IS-CRATE ?auto_18549 ) ( not ( = ?auto_18548 ?auto_18549 ) ) ( not ( = ?auto_18560 ?auto_18548 ) ) ( not ( = ?auto_18560 ?auto_18549 ) ) ( not ( = ?auto_18550 ?auto_18553 ) ) ( HOIST-AT ?auto_18557 ?auto_18550 ) ( not ( = ?auto_18559 ?auto_18557 ) ) ( SURFACE-AT ?auto_18549 ?auto_18550 ) ( ON ?auto_18549 ?auto_18554 ) ( CLEAR ?auto_18549 ) ( not ( = ?auto_18548 ?auto_18554 ) ) ( not ( = ?auto_18549 ?auto_18554 ) ) ( not ( = ?auto_18560 ?auto_18554 ) ) ( IS-CRATE ?auto_18548 ) ( AVAILABLE ?auto_18557 ) ( SURFACE-AT ?auto_18548 ?auto_18550 ) ( ON ?auto_18548 ?auto_18556 ) ( CLEAR ?auto_18548 ) ( not ( = ?auto_18548 ?auto_18556 ) ) ( not ( = ?auto_18549 ?auto_18556 ) ) ( not ( = ?auto_18560 ?auto_18556 ) ) ( not ( = ?auto_18554 ?auto_18556 ) ) ( SURFACE-AT ?auto_18558 ?auto_18553 ) ( CLEAR ?auto_18558 ) ( IS-CRATE ?auto_18560 ) ( not ( = ?auto_18558 ?auto_18560 ) ) ( not ( = ?auto_18548 ?auto_18558 ) ) ( not ( = ?auto_18549 ?auto_18558 ) ) ( not ( = ?auto_18554 ?auto_18558 ) ) ( not ( = ?auto_18556 ?auto_18558 ) ) ( AVAILABLE ?auto_18559 ) ( TRUCK-AT ?auto_18555 ?auto_18552 ) ( not ( = ?auto_18552 ?auto_18553 ) ) ( not ( = ?auto_18550 ?auto_18552 ) ) ( HOIST-AT ?auto_18551 ?auto_18552 ) ( not ( = ?auto_18559 ?auto_18551 ) ) ( not ( = ?auto_18557 ?auto_18551 ) ) ( AVAILABLE ?auto_18551 ) ( SURFACE-AT ?auto_18560 ?auto_18552 ) ( ON ?auto_18560 ?auto_18561 ) ( CLEAR ?auto_18560 ) ( not ( = ?auto_18548 ?auto_18561 ) ) ( not ( = ?auto_18549 ?auto_18561 ) ) ( not ( = ?auto_18560 ?auto_18561 ) ) ( not ( = ?auto_18554 ?auto_18561 ) ) ( not ( = ?auto_18556 ?auto_18561 ) ) ( not ( = ?auto_18558 ?auto_18561 ) ) )
    :subtasks
    ( ( !LIFT ?auto_18551 ?auto_18560 ?auto_18561 ?auto_18552 )
      ( MAKE-2CRATE ?auto_18560 ?auto_18548 ?auto_18549 )
      ( MAKE-1CRATE-VERIFY ?auto_18548 ?auto_18549 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18562 - SURFACE
      ?auto_18563 - SURFACE
      ?auto_18564 - SURFACE
    )
    :vars
    (
      ?auto_18568 - HOIST
      ?auto_18570 - PLACE
      ?auto_18575 - PLACE
      ?auto_18572 - HOIST
      ?auto_18567 - SURFACE
      ?auto_18565 - SURFACE
      ?auto_18566 - SURFACE
      ?auto_18571 - TRUCK
      ?auto_18569 - PLACE
      ?auto_18574 - HOIST
      ?auto_18573 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18568 ?auto_18570 ) ( IS-CRATE ?auto_18564 ) ( not ( = ?auto_18563 ?auto_18564 ) ) ( not ( = ?auto_18562 ?auto_18563 ) ) ( not ( = ?auto_18562 ?auto_18564 ) ) ( not ( = ?auto_18575 ?auto_18570 ) ) ( HOIST-AT ?auto_18572 ?auto_18575 ) ( not ( = ?auto_18568 ?auto_18572 ) ) ( SURFACE-AT ?auto_18564 ?auto_18575 ) ( ON ?auto_18564 ?auto_18567 ) ( CLEAR ?auto_18564 ) ( not ( = ?auto_18563 ?auto_18567 ) ) ( not ( = ?auto_18564 ?auto_18567 ) ) ( not ( = ?auto_18562 ?auto_18567 ) ) ( IS-CRATE ?auto_18563 ) ( AVAILABLE ?auto_18572 ) ( SURFACE-AT ?auto_18563 ?auto_18575 ) ( ON ?auto_18563 ?auto_18565 ) ( CLEAR ?auto_18563 ) ( not ( = ?auto_18563 ?auto_18565 ) ) ( not ( = ?auto_18564 ?auto_18565 ) ) ( not ( = ?auto_18562 ?auto_18565 ) ) ( not ( = ?auto_18567 ?auto_18565 ) ) ( SURFACE-AT ?auto_18566 ?auto_18570 ) ( CLEAR ?auto_18566 ) ( IS-CRATE ?auto_18562 ) ( not ( = ?auto_18566 ?auto_18562 ) ) ( not ( = ?auto_18563 ?auto_18566 ) ) ( not ( = ?auto_18564 ?auto_18566 ) ) ( not ( = ?auto_18567 ?auto_18566 ) ) ( not ( = ?auto_18565 ?auto_18566 ) ) ( AVAILABLE ?auto_18568 ) ( TRUCK-AT ?auto_18571 ?auto_18569 ) ( not ( = ?auto_18569 ?auto_18570 ) ) ( not ( = ?auto_18575 ?auto_18569 ) ) ( HOIST-AT ?auto_18574 ?auto_18569 ) ( not ( = ?auto_18568 ?auto_18574 ) ) ( not ( = ?auto_18572 ?auto_18574 ) ) ( AVAILABLE ?auto_18574 ) ( SURFACE-AT ?auto_18562 ?auto_18569 ) ( ON ?auto_18562 ?auto_18573 ) ( CLEAR ?auto_18562 ) ( not ( = ?auto_18563 ?auto_18573 ) ) ( not ( = ?auto_18564 ?auto_18573 ) ) ( not ( = ?auto_18562 ?auto_18573 ) ) ( not ( = ?auto_18567 ?auto_18573 ) ) ( not ( = ?auto_18565 ?auto_18573 ) ) ( not ( = ?auto_18566 ?auto_18573 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18563 ?auto_18564 )
      ( MAKE-2CRATE-VERIFY ?auto_18562 ?auto_18563 ?auto_18564 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18576 - SURFACE
      ?auto_18577 - SURFACE
      ?auto_18578 - SURFACE
      ?auto_18579 - SURFACE
    )
    :vars
    (
      ?auto_18586 - HOIST
      ?auto_18580 - PLACE
      ?auto_18589 - PLACE
      ?auto_18582 - HOIST
      ?auto_18587 - SURFACE
      ?auto_18584 - SURFACE
      ?auto_18581 - TRUCK
      ?auto_18588 - PLACE
      ?auto_18585 - HOIST
      ?auto_18583 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18586 ?auto_18580 ) ( IS-CRATE ?auto_18579 ) ( not ( = ?auto_18578 ?auto_18579 ) ) ( not ( = ?auto_18577 ?auto_18578 ) ) ( not ( = ?auto_18577 ?auto_18579 ) ) ( not ( = ?auto_18589 ?auto_18580 ) ) ( HOIST-AT ?auto_18582 ?auto_18589 ) ( not ( = ?auto_18586 ?auto_18582 ) ) ( SURFACE-AT ?auto_18579 ?auto_18589 ) ( ON ?auto_18579 ?auto_18587 ) ( CLEAR ?auto_18579 ) ( not ( = ?auto_18578 ?auto_18587 ) ) ( not ( = ?auto_18579 ?auto_18587 ) ) ( not ( = ?auto_18577 ?auto_18587 ) ) ( IS-CRATE ?auto_18578 ) ( AVAILABLE ?auto_18582 ) ( SURFACE-AT ?auto_18578 ?auto_18589 ) ( ON ?auto_18578 ?auto_18584 ) ( CLEAR ?auto_18578 ) ( not ( = ?auto_18578 ?auto_18584 ) ) ( not ( = ?auto_18579 ?auto_18584 ) ) ( not ( = ?auto_18577 ?auto_18584 ) ) ( not ( = ?auto_18587 ?auto_18584 ) ) ( SURFACE-AT ?auto_18576 ?auto_18580 ) ( CLEAR ?auto_18576 ) ( IS-CRATE ?auto_18577 ) ( not ( = ?auto_18576 ?auto_18577 ) ) ( not ( = ?auto_18578 ?auto_18576 ) ) ( not ( = ?auto_18579 ?auto_18576 ) ) ( not ( = ?auto_18587 ?auto_18576 ) ) ( not ( = ?auto_18584 ?auto_18576 ) ) ( AVAILABLE ?auto_18586 ) ( TRUCK-AT ?auto_18581 ?auto_18588 ) ( not ( = ?auto_18588 ?auto_18580 ) ) ( not ( = ?auto_18589 ?auto_18588 ) ) ( HOIST-AT ?auto_18585 ?auto_18588 ) ( not ( = ?auto_18586 ?auto_18585 ) ) ( not ( = ?auto_18582 ?auto_18585 ) ) ( AVAILABLE ?auto_18585 ) ( SURFACE-AT ?auto_18577 ?auto_18588 ) ( ON ?auto_18577 ?auto_18583 ) ( CLEAR ?auto_18577 ) ( not ( = ?auto_18578 ?auto_18583 ) ) ( not ( = ?auto_18579 ?auto_18583 ) ) ( not ( = ?auto_18577 ?auto_18583 ) ) ( not ( = ?auto_18587 ?auto_18583 ) ) ( not ( = ?auto_18584 ?auto_18583 ) ) ( not ( = ?auto_18576 ?auto_18583 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18577 ?auto_18578 ?auto_18579 )
      ( MAKE-3CRATE-VERIFY ?auto_18576 ?auto_18577 ?auto_18578 ?auto_18579 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18590 - SURFACE
      ?auto_18591 - SURFACE
      ?auto_18592 - SURFACE
      ?auto_18593 - SURFACE
      ?auto_18594 - SURFACE
    )
    :vars
    (
      ?auto_18601 - HOIST
      ?auto_18595 - PLACE
      ?auto_18604 - PLACE
      ?auto_18597 - HOIST
      ?auto_18602 - SURFACE
      ?auto_18599 - SURFACE
      ?auto_18596 - TRUCK
      ?auto_18603 - PLACE
      ?auto_18600 - HOIST
      ?auto_18598 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18601 ?auto_18595 ) ( IS-CRATE ?auto_18594 ) ( not ( = ?auto_18593 ?auto_18594 ) ) ( not ( = ?auto_18592 ?auto_18593 ) ) ( not ( = ?auto_18592 ?auto_18594 ) ) ( not ( = ?auto_18604 ?auto_18595 ) ) ( HOIST-AT ?auto_18597 ?auto_18604 ) ( not ( = ?auto_18601 ?auto_18597 ) ) ( SURFACE-AT ?auto_18594 ?auto_18604 ) ( ON ?auto_18594 ?auto_18602 ) ( CLEAR ?auto_18594 ) ( not ( = ?auto_18593 ?auto_18602 ) ) ( not ( = ?auto_18594 ?auto_18602 ) ) ( not ( = ?auto_18592 ?auto_18602 ) ) ( IS-CRATE ?auto_18593 ) ( AVAILABLE ?auto_18597 ) ( SURFACE-AT ?auto_18593 ?auto_18604 ) ( ON ?auto_18593 ?auto_18599 ) ( CLEAR ?auto_18593 ) ( not ( = ?auto_18593 ?auto_18599 ) ) ( not ( = ?auto_18594 ?auto_18599 ) ) ( not ( = ?auto_18592 ?auto_18599 ) ) ( not ( = ?auto_18602 ?auto_18599 ) ) ( SURFACE-AT ?auto_18591 ?auto_18595 ) ( CLEAR ?auto_18591 ) ( IS-CRATE ?auto_18592 ) ( not ( = ?auto_18591 ?auto_18592 ) ) ( not ( = ?auto_18593 ?auto_18591 ) ) ( not ( = ?auto_18594 ?auto_18591 ) ) ( not ( = ?auto_18602 ?auto_18591 ) ) ( not ( = ?auto_18599 ?auto_18591 ) ) ( AVAILABLE ?auto_18601 ) ( TRUCK-AT ?auto_18596 ?auto_18603 ) ( not ( = ?auto_18603 ?auto_18595 ) ) ( not ( = ?auto_18604 ?auto_18603 ) ) ( HOIST-AT ?auto_18600 ?auto_18603 ) ( not ( = ?auto_18601 ?auto_18600 ) ) ( not ( = ?auto_18597 ?auto_18600 ) ) ( AVAILABLE ?auto_18600 ) ( SURFACE-AT ?auto_18592 ?auto_18603 ) ( ON ?auto_18592 ?auto_18598 ) ( CLEAR ?auto_18592 ) ( not ( = ?auto_18593 ?auto_18598 ) ) ( not ( = ?auto_18594 ?auto_18598 ) ) ( not ( = ?auto_18592 ?auto_18598 ) ) ( not ( = ?auto_18602 ?auto_18598 ) ) ( not ( = ?auto_18599 ?auto_18598 ) ) ( not ( = ?auto_18591 ?auto_18598 ) ) ( ON ?auto_18591 ?auto_18590 ) ( not ( = ?auto_18590 ?auto_18591 ) ) ( not ( = ?auto_18590 ?auto_18592 ) ) ( not ( = ?auto_18590 ?auto_18593 ) ) ( not ( = ?auto_18590 ?auto_18594 ) ) ( not ( = ?auto_18590 ?auto_18602 ) ) ( not ( = ?auto_18590 ?auto_18599 ) ) ( not ( = ?auto_18590 ?auto_18598 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18592 ?auto_18593 ?auto_18594 )
      ( MAKE-4CRATE-VERIFY ?auto_18590 ?auto_18591 ?auto_18592 ?auto_18593 ?auto_18594 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18605 - SURFACE
      ?auto_18606 - SURFACE
      ?auto_18607 - SURFACE
      ?auto_18608 - SURFACE
      ?auto_18609 - SURFACE
      ?auto_18610 - SURFACE
    )
    :vars
    (
      ?auto_18617 - HOIST
      ?auto_18611 - PLACE
      ?auto_18620 - PLACE
      ?auto_18613 - HOIST
      ?auto_18618 - SURFACE
      ?auto_18615 - SURFACE
      ?auto_18612 - TRUCK
      ?auto_18619 - PLACE
      ?auto_18616 - HOIST
      ?auto_18614 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18617 ?auto_18611 ) ( IS-CRATE ?auto_18610 ) ( not ( = ?auto_18609 ?auto_18610 ) ) ( not ( = ?auto_18608 ?auto_18609 ) ) ( not ( = ?auto_18608 ?auto_18610 ) ) ( not ( = ?auto_18620 ?auto_18611 ) ) ( HOIST-AT ?auto_18613 ?auto_18620 ) ( not ( = ?auto_18617 ?auto_18613 ) ) ( SURFACE-AT ?auto_18610 ?auto_18620 ) ( ON ?auto_18610 ?auto_18618 ) ( CLEAR ?auto_18610 ) ( not ( = ?auto_18609 ?auto_18618 ) ) ( not ( = ?auto_18610 ?auto_18618 ) ) ( not ( = ?auto_18608 ?auto_18618 ) ) ( IS-CRATE ?auto_18609 ) ( AVAILABLE ?auto_18613 ) ( SURFACE-AT ?auto_18609 ?auto_18620 ) ( ON ?auto_18609 ?auto_18615 ) ( CLEAR ?auto_18609 ) ( not ( = ?auto_18609 ?auto_18615 ) ) ( not ( = ?auto_18610 ?auto_18615 ) ) ( not ( = ?auto_18608 ?auto_18615 ) ) ( not ( = ?auto_18618 ?auto_18615 ) ) ( SURFACE-AT ?auto_18607 ?auto_18611 ) ( CLEAR ?auto_18607 ) ( IS-CRATE ?auto_18608 ) ( not ( = ?auto_18607 ?auto_18608 ) ) ( not ( = ?auto_18609 ?auto_18607 ) ) ( not ( = ?auto_18610 ?auto_18607 ) ) ( not ( = ?auto_18618 ?auto_18607 ) ) ( not ( = ?auto_18615 ?auto_18607 ) ) ( AVAILABLE ?auto_18617 ) ( TRUCK-AT ?auto_18612 ?auto_18619 ) ( not ( = ?auto_18619 ?auto_18611 ) ) ( not ( = ?auto_18620 ?auto_18619 ) ) ( HOIST-AT ?auto_18616 ?auto_18619 ) ( not ( = ?auto_18617 ?auto_18616 ) ) ( not ( = ?auto_18613 ?auto_18616 ) ) ( AVAILABLE ?auto_18616 ) ( SURFACE-AT ?auto_18608 ?auto_18619 ) ( ON ?auto_18608 ?auto_18614 ) ( CLEAR ?auto_18608 ) ( not ( = ?auto_18609 ?auto_18614 ) ) ( not ( = ?auto_18610 ?auto_18614 ) ) ( not ( = ?auto_18608 ?auto_18614 ) ) ( not ( = ?auto_18618 ?auto_18614 ) ) ( not ( = ?auto_18615 ?auto_18614 ) ) ( not ( = ?auto_18607 ?auto_18614 ) ) ( ON ?auto_18606 ?auto_18605 ) ( ON ?auto_18607 ?auto_18606 ) ( not ( = ?auto_18605 ?auto_18606 ) ) ( not ( = ?auto_18605 ?auto_18607 ) ) ( not ( = ?auto_18605 ?auto_18608 ) ) ( not ( = ?auto_18605 ?auto_18609 ) ) ( not ( = ?auto_18605 ?auto_18610 ) ) ( not ( = ?auto_18605 ?auto_18618 ) ) ( not ( = ?auto_18605 ?auto_18615 ) ) ( not ( = ?auto_18605 ?auto_18614 ) ) ( not ( = ?auto_18606 ?auto_18607 ) ) ( not ( = ?auto_18606 ?auto_18608 ) ) ( not ( = ?auto_18606 ?auto_18609 ) ) ( not ( = ?auto_18606 ?auto_18610 ) ) ( not ( = ?auto_18606 ?auto_18618 ) ) ( not ( = ?auto_18606 ?auto_18615 ) ) ( not ( = ?auto_18606 ?auto_18614 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18608 ?auto_18609 ?auto_18610 )
      ( MAKE-5CRATE-VERIFY ?auto_18605 ?auto_18606 ?auto_18607 ?auto_18608 ?auto_18609 ?auto_18610 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18621 - SURFACE
      ?auto_18622 - SURFACE
    )
    :vars
    (
      ?auto_18629 - HOIST
      ?auto_18623 - PLACE
      ?auto_18634 - SURFACE
      ?auto_18633 - PLACE
      ?auto_18625 - HOIST
      ?auto_18630 - SURFACE
      ?auto_18627 - SURFACE
      ?auto_18632 - SURFACE
      ?auto_18631 - PLACE
      ?auto_18628 - HOIST
      ?auto_18626 - SURFACE
      ?auto_18624 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18629 ?auto_18623 ) ( IS-CRATE ?auto_18622 ) ( not ( = ?auto_18621 ?auto_18622 ) ) ( not ( = ?auto_18634 ?auto_18621 ) ) ( not ( = ?auto_18634 ?auto_18622 ) ) ( not ( = ?auto_18633 ?auto_18623 ) ) ( HOIST-AT ?auto_18625 ?auto_18633 ) ( not ( = ?auto_18629 ?auto_18625 ) ) ( SURFACE-AT ?auto_18622 ?auto_18633 ) ( ON ?auto_18622 ?auto_18630 ) ( CLEAR ?auto_18622 ) ( not ( = ?auto_18621 ?auto_18630 ) ) ( not ( = ?auto_18622 ?auto_18630 ) ) ( not ( = ?auto_18634 ?auto_18630 ) ) ( IS-CRATE ?auto_18621 ) ( AVAILABLE ?auto_18625 ) ( SURFACE-AT ?auto_18621 ?auto_18633 ) ( ON ?auto_18621 ?auto_18627 ) ( CLEAR ?auto_18621 ) ( not ( = ?auto_18621 ?auto_18627 ) ) ( not ( = ?auto_18622 ?auto_18627 ) ) ( not ( = ?auto_18634 ?auto_18627 ) ) ( not ( = ?auto_18630 ?auto_18627 ) ) ( SURFACE-AT ?auto_18632 ?auto_18623 ) ( CLEAR ?auto_18632 ) ( IS-CRATE ?auto_18634 ) ( not ( = ?auto_18632 ?auto_18634 ) ) ( not ( = ?auto_18621 ?auto_18632 ) ) ( not ( = ?auto_18622 ?auto_18632 ) ) ( not ( = ?auto_18630 ?auto_18632 ) ) ( not ( = ?auto_18627 ?auto_18632 ) ) ( AVAILABLE ?auto_18629 ) ( not ( = ?auto_18631 ?auto_18623 ) ) ( not ( = ?auto_18633 ?auto_18631 ) ) ( HOIST-AT ?auto_18628 ?auto_18631 ) ( not ( = ?auto_18629 ?auto_18628 ) ) ( not ( = ?auto_18625 ?auto_18628 ) ) ( AVAILABLE ?auto_18628 ) ( SURFACE-AT ?auto_18634 ?auto_18631 ) ( ON ?auto_18634 ?auto_18626 ) ( CLEAR ?auto_18634 ) ( not ( = ?auto_18621 ?auto_18626 ) ) ( not ( = ?auto_18622 ?auto_18626 ) ) ( not ( = ?auto_18634 ?auto_18626 ) ) ( not ( = ?auto_18630 ?auto_18626 ) ) ( not ( = ?auto_18627 ?auto_18626 ) ) ( not ( = ?auto_18632 ?auto_18626 ) ) ( TRUCK-AT ?auto_18624 ?auto_18623 ) )
    :subtasks
    ( ( !DRIVE ?auto_18624 ?auto_18623 ?auto_18631 )
      ( MAKE-2CRATE ?auto_18634 ?auto_18621 ?auto_18622 )
      ( MAKE-1CRATE-VERIFY ?auto_18621 ?auto_18622 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18635 - SURFACE
      ?auto_18636 - SURFACE
      ?auto_18637 - SURFACE
    )
    :vars
    (
      ?auto_18641 - HOIST
      ?auto_18638 - PLACE
      ?auto_18645 - PLACE
      ?auto_18648 - HOIST
      ?auto_18643 - SURFACE
      ?auto_18647 - SURFACE
      ?auto_18639 - SURFACE
      ?auto_18646 - PLACE
      ?auto_18644 - HOIST
      ?auto_18640 - SURFACE
      ?auto_18642 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18641 ?auto_18638 ) ( IS-CRATE ?auto_18637 ) ( not ( = ?auto_18636 ?auto_18637 ) ) ( not ( = ?auto_18635 ?auto_18636 ) ) ( not ( = ?auto_18635 ?auto_18637 ) ) ( not ( = ?auto_18645 ?auto_18638 ) ) ( HOIST-AT ?auto_18648 ?auto_18645 ) ( not ( = ?auto_18641 ?auto_18648 ) ) ( SURFACE-AT ?auto_18637 ?auto_18645 ) ( ON ?auto_18637 ?auto_18643 ) ( CLEAR ?auto_18637 ) ( not ( = ?auto_18636 ?auto_18643 ) ) ( not ( = ?auto_18637 ?auto_18643 ) ) ( not ( = ?auto_18635 ?auto_18643 ) ) ( IS-CRATE ?auto_18636 ) ( AVAILABLE ?auto_18648 ) ( SURFACE-AT ?auto_18636 ?auto_18645 ) ( ON ?auto_18636 ?auto_18647 ) ( CLEAR ?auto_18636 ) ( not ( = ?auto_18636 ?auto_18647 ) ) ( not ( = ?auto_18637 ?auto_18647 ) ) ( not ( = ?auto_18635 ?auto_18647 ) ) ( not ( = ?auto_18643 ?auto_18647 ) ) ( SURFACE-AT ?auto_18639 ?auto_18638 ) ( CLEAR ?auto_18639 ) ( IS-CRATE ?auto_18635 ) ( not ( = ?auto_18639 ?auto_18635 ) ) ( not ( = ?auto_18636 ?auto_18639 ) ) ( not ( = ?auto_18637 ?auto_18639 ) ) ( not ( = ?auto_18643 ?auto_18639 ) ) ( not ( = ?auto_18647 ?auto_18639 ) ) ( AVAILABLE ?auto_18641 ) ( not ( = ?auto_18646 ?auto_18638 ) ) ( not ( = ?auto_18645 ?auto_18646 ) ) ( HOIST-AT ?auto_18644 ?auto_18646 ) ( not ( = ?auto_18641 ?auto_18644 ) ) ( not ( = ?auto_18648 ?auto_18644 ) ) ( AVAILABLE ?auto_18644 ) ( SURFACE-AT ?auto_18635 ?auto_18646 ) ( ON ?auto_18635 ?auto_18640 ) ( CLEAR ?auto_18635 ) ( not ( = ?auto_18636 ?auto_18640 ) ) ( not ( = ?auto_18637 ?auto_18640 ) ) ( not ( = ?auto_18635 ?auto_18640 ) ) ( not ( = ?auto_18643 ?auto_18640 ) ) ( not ( = ?auto_18647 ?auto_18640 ) ) ( not ( = ?auto_18639 ?auto_18640 ) ) ( TRUCK-AT ?auto_18642 ?auto_18638 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18636 ?auto_18637 )
      ( MAKE-2CRATE-VERIFY ?auto_18635 ?auto_18636 ?auto_18637 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18649 - SURFACE
      ?auto_18650 - SURFACE
      ?auto_18651 - SURFACE
      ?auto_18652 - SURFACE
    )
    :vars
    (
      ?auto_18661 - HOIST
      ?auto_18658 - PLACE
      ?auto_18657 - PLACE
      ?auto_18660 - HOIST
      ?auto_18656 - SURFACE
      ?auto_18659 - SURFACE
      ?auto_18655 - PLACE
      ?auto_18662 - HOIST
      ?auto_18654 - SURFACE
      ?auto_18653 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18661 ?auto_18658 ) ( IS-CRATE ?auto_18652 ) ( not ( = ?auto_18651 ?auto_18652 ) ) ( not ( = ?auto_18650 ?auto_18651 ) ) ( not ( = ?auto_18650 ?auto_18652 ) ) ( not ( = ?auto_18657 ?auto_18658 ) ) ( HOIST-AT ?auto_18660 ?auto_18657 ) ( not ( = ?auto_18661 ?auto_18660 ) ) ( SURFACE-AT ?auto_18652 ?auto_18657 ) ( ON ?auto_18652 ?auto_18656 ) ( CLEAR ?auto_18652 ) ( not ( = ?auto_18651 ?auto_18656 ) ) ( not ( = ?auto_18652 ?auto_18656 ) ) ( not ( = ?auto_18650 ?auto_18656 ) ) ( IS-CRATE ?auto_18651 ) ( AVAILABLE ?auto_18660 ) ( SURFACE-AT ?auto_18651 ?auto_18657 ) ( ON ?auto_18651 ?auto_18659 ) ( CLEAR ?auto_18651 ) ( not ( = ?auto_18651 ?auto_18659 ) ) ( not ( = ?auto_18652 ?auto_18659 ) ) ( not ( = ?auto_18650 ?auto_18659 ) ) ( not ( = ?auto_18656 ?auto_18659 ) ) ( SURFACE-AT ?auto_18649 ?auto_18658 ) ( CLEAR ?auto_18649 ) ( IS-CRATE ?auto_18650 ) ( not ( = ?auto_18649 ?auto_18650 ) ) ( not ( = ?auto_18651 ?auto_18649 ) ) ( not ( = ?auto_18652 ?auto_18649 ) ) ( not ( = ?auto_18656 ?auto_18649 ) ) ( not ( = ?auto_18659 ?auto_18649 ) ) ( AVAILABLE ?auto_18661 ) ( not ( = ?auto_18655 ?auto_18658 ) ) ( not ( = ?auto_18657 ?auto_18655 ) ) ( HOIST-AT ?auto_18662 ?auto_18655 ) ( not ( = ?auto_18661 ?auto_18662 ) ) ( not ( = ?auto_18660 ?auto_18662 ) ) ( AVAILABLE ?auto_18662 ) ( SURFACE-AT ?auto_18650 ?auto_18655 ) ( ON ?auto_18650 ?auto_18654 ) ( CLEAR ?auto_18650 ) ( not ( = ?auto_18651 ?auto_18654 ) ) ( not ( = ?auto_18652 ?auto_18654 ) ) ( not ( = ?auto_18650 ?auto_18654 ) ) ( not ( = ?auto_18656 ?auto_18654 ) ) ( not ( = ?auto_18659 ?auto_18654 ) ) ( not ( = ?auto_18649 ?auto_18654 ) ) ( TRUCK-AT ?auto_18653 ?auto_18658 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18650 ?auto_18651 ?auto_18652 )
      ( MAKE-3CRATE-VERIFY ?auto_18649 ?auto_18650 ?auto_18651 ?auto_18652 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18663 - SURFACE
      ?auto_18664 - SURFACE
      ?auto_18665 - SURFACE
      ?auto_18666 - SURFACE
      ?auto_18667 - SURFACE
    )
    :vars
    (
      ?auto_18676 - HOIST
      ?auto_18673 - PLACE
      ?auto_18672 - PLACE
      ?auto_18675 - HOIST
      ?auto_18671 - SURFACE
      ?auto_18674 - SURFACE
      ?auto_18670 - PLACE
      ?auto_18677 - HOIST
      ?auto_18669 - SURFACE
      ?auto_18668 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18676 ?auto_18673 ) ( IS-CRATE ?auto_18667 ) ( not ( = ?auto_18666 ?auto_18667 ) ) ( not ( = ?auto_18665 ?auto_18666 ) ) ( not ( = ?auto_18665 ?auto_18667 ) ) ( not ( = ?auto_18672 ?auto_18673 ) ) ( HOIST-AT ?auto_18675 ?auto_18672 ) ( not ( = ?auto_18676 ?auto_18675 ) ) ( SURFACE-AT ?auto_18667 ?auto_18672 ) ( ON ?auto_18667 ?auto_18671 ) ( CLEAR ?auto_18667 ) ( not ( = ?auto_18666 ?auto_18671 ) ) ( not ( = ?auto_18667 ?auto_18671 ) ) ( not ( = ?auto_18665 ?auto_18671 ) ) ( IS-CRATE ?auto_18666 ) ( AVAILABLE ?auto_18675 ) ( SURFACE-AT ?auto_18666 ?auto_18672 ) ( ON ?auto_18666 ?auto_18674 ) ( CLEAR ?auto_18666 ) ( not ( = ?auto_18666 ?auto_18674 ) ) ( not ( = ?auto_18667 ?auto_18674 ) ) ( not ( = ?auto_18665 ?auto_18674 ) ) ( not ( = ?auto_18671 ?auto_18674 ) ) ( SURFACE-AT ?auto_18664 ?auto_18673 ) ( CLEAR ?auto_18664 ) ( IS-CRATE ?auto_18665 ) ( not ( = ?auto_18664 ?auto_18665 ) ) ( not ( = ?auto_18666 ?auto_18664 ) ) ( not ( = ?auto_18667 ?auto_18664 ) ) ( not ( = ?auto_18671 ?auto_18664 ) ) ( not ( = ?auto_18674 ?auto_18664 ) ) ( AVAILABLE ?auto_18676 ) ( not ( = ?auto_18670 ?auto_18673 ) ) ( not ( = ?auto_18672 ?auto_18670 ) ) ( HOIST-AT ?auto_18677 ?auto_18670 ) ( not ( = ?auto_18676 ?auto_18677 ) ) ( not ( = ?auto_18675 ?auto_18677 ) ) ( AVAILABLE ?auto_18677 ) ( SURFACE-AT ?auto_18665 ?auto_18670 ) ( ON ?auto_18665 ?auto_18669 ) ( CLEAR ?auto_18665 ) ( not ( = ?auto_18666 ?auto_18669 ) ) ( not ( = ?auto_18667 ?auto_18669 ) ) ( not ( = ?auto_18665 ?auto_18669 ) ) ( not ( = ?auto_18671 ?auto_18669 ) ) ( not ( = ?auto_18674 ?auto_18669 ) ) ( not ( = ?auto_18664 ?auto_18669 ) ) ( TRUCK-AT ?auto_18668 ?auto_18673 ) ( ON ?auto_18664 ?auto_18663 ) ( not ( = ?auto_18663 ?auto_18664 ) ) ( not ( = ?auto_18663 ?auto_18665 ) ) ( not ( = ?auto_18663 ?auto_18666 ) ) ( not ( = ?auto_18663 ?auto_18667 ) ) ( not ( = ?auto_18663 ?auto_18671 ) ) ( not ( = ?auto_18663 ?auto_18674 ) ) ( not ( = ?auto_18663 ?auto_18669 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18665 ?auto_18666 ?auto_18667 )
      ( MAKE-4CRATE-VERIFY ?auto_18663 ?auto_18664 ?auto_18665 ?auto_18666 ?auto_18667 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18678 - SURFACE
      ?auto_18679 - SURFACE
      ?auto_18680 - SURFACE
      ?auto_18681 - SURFACE
      ?auto_18682 - SURFACE
      ?auto_18683 - SURFACE
    )
    :vars
    (
      ?auto_18692 - HOIST
      ?auto_18689 - PLACE
      ?auto_18688 - PLACE
      ?auto_18691 - HOIST
      ?auto_18687 - SURFACE
      ?auto_18690 - SURFACE
      ?auto_18686 - PLACE
      ?auto_18693 - HOIST
      ?auto_18685 - SURFACE
      ?auto_18684 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18692 ?auto_18689 ) ( IS-CRATE ?auto_18683 ) ( not ( = ?auto_18682 ?auto_18683 ) ) ( not ( = ?auto_18681 ?auto_18682 ) ) ( not ( = ?auto_18681 ?auto_18683 ) ) ( not ( = ?auto_18688 ?auto_18689 ) ) ( HOIST-AT ?auto_18691 ?auto_18688 ) ( not ( = ?auto_18692 ?auto_18691 ) ) ( SURFACE-AT ?auto_18683 ?auto_18688 ) ( ON ?auto_18683 ?auto_18687 ) ( CLEAR ?auto_18683 ) ( not ( = ?auto_18682 ?auto_18687 ) ) ( not ( = ?auto_18683 ?auto_18687 ) ) ( not ( = ?auto_18681 ?auto_18687 ) ) ( IS-CRATE ?auto_18682 ) ( AVAILABLE ?auto_18691 ) ( SURFACE-AT ?auto_18682 ?auto_18688 ) ( ON ?auto_18682 ?auto_18690 ) ( CLEAR ?auto_18682 ) ( not ( = ?auto_18682 ?auto_18690 ) ) ( not ( = ?auto_18683 ?auto_18690 ) ) ( not ( = ?auto_18681 ?auto_18690 ) ) ( not ( = ?auto_18687 ?auto_18690 ) ) ( SURFACE-AT ?auto_18680 ?auto_18689 ) ( CLEAR ?auto_18680 ) ( IS-CRATE ?auto_18681 ) ( not ( = ?auto_18680 ?auto_18681 ) ) ( not ( = ?auto_18682 ?auto_18680 ) ) ( not ( = ?auto_18683 ?auto_18680 ) ) ( not ( = ?auto_18687 ?auto_18680 ) ) ( not ( = ?auto_18690 ?auto_18680 ) ) ( AVAILABLE ?auto_18692 ) ( not ( = ?auto_18686 ?auto_18689 ) ) ( not ( = ?auto_18688 ?auto_18686 ) ) ( HOIST-AT ?auto_18693 ?auto_18686 ) ( not ( = ?auto_18692 ?auto_18693 ) ) ( not ( = ?auto_18691 ?auto_18693 ) ) ( AVAILABLE ?auto_18693 ) ( SURFACE-AT ?auto_18681 ?auto_18686 ) ( ON ?auto_18681 ?auto_18685 ) ( CLEAR ?auto_18681 ) ( not ( = ?auto_18682 ?auto_18685 ) ) ( not ( = ?auto_18683 ?auto_18685 ) ) ( not ( = ?auto_18681 ?auto_18685 ) ) ( not ( = ?auto_18687 ?auto_18685 ) ) ( not ( = ?auto_18690 ?auto_18685 ) ) ( not ( = ?auto_18680 ?auto_18685 ) ) ( TRUCK-AT ?auto_18684 ?auto_18689 ) ( ON ?auto_18679 ?auto_18678 ) ( ON ?auto_18680 ?auto_18679 ) ( not ( = ?auto_18678 ?auto_18679 ) ) ( not ( = ?auto_18678 ?auto_18680 ) ) ( not ( = ?auto_18678 ?auto_18681 ) ) ( not ( = ?auto_18678 ?auto_18682 ) ) ( not ( = ?auto_18678 ?auto_18683 ) ) ( not ( = ?auto_18678 ?auto_18687 ) ) ( not ( = ?auto_18678 ?auto_18690 ) ) ( not ( = ?auto_18678 ?auto_18685 ) ) ( not ( = ?auto_18679 ?auto_18680 ) ) ( not ( = ?auto_18679 ?auto_18681 ) ) ( not ( = ?auto_18679 ?auto_18682 ) ) ( not ( = ?auto_18679 ?auto_18683 ) ) ( not ( = ?auto_18679 ?auto_18687 ) ) ( not ( = ?auto_18679 ?auto_18690 ) ) ( not ( = ?auto_18679 ?auto_18685 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18681 ?auto_18682 ?auto_18683 )
      ( MAKE-5CRATE-VERIFY ?auto_18678 ?auto_18679 ?auto_18680 ?auto_18681 ?auto_18682 ?auto_18683 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18694 - SURFACE
      ?auto_18695 - SURFACE
    )
    :vars
    (
      ?auto_18705 - HOIST
      ?auto_18702 - PLACE
      ?auto_18707 - SURFACE
      ?auto_18701 - PLACE
      ?auto_18704 - HOIST
      ?auto_18700 - SURFACE
      ?auto_18703 - SURFACE
      ?auto_18696 - SURFACE
      ?auto_18699 - PLACE
      ?auto_18706 - HOIST
      ?auto_18698 - SURFACE
      ?auto_18697 - TRUCK
      ?auto_18708 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18705 ?auto_18702 ) ( IS-CRATE ?auto_18695 ) ( not ( = ?auto_18694 ?auto_18695 ) ) ( not ( = ?auto_18707 ?auto_18694 ) ) ( not ( = ?auto_18707 ?auto_18695 ) ) ( not ( = ?auto_18701 ?auto_18702 ) ) ( HOIST-AT ?auto_18704 ?auto_18701 ) ( not ( = ?auto_18705 ?auto_18704 ) ) ( SURFACE-AT ?auto_18695 ?auto_18701 ) ( ON ?auto_18695 ?auto_18700 ) ( CLEAR ?auto_18695 ) ( not ( = ?auto_18694 ?auto_18700 ) ) ( not ( = ?auto_18695 ?auto_18700 ) ) ( not ( = ?auto_18707 ?auto_18700 ) ) ( IS-CRATE ?auto_18694 ) ( AVAILABLE ?auto_18704 ) ( SURFACE-AT ?auto_18694 ?auto_18701 ) ( ON ?auto_18694 ?auto_18703 ) ( CLEAR ?auto_18694 ) ( not ( = ?auto_18694 ?auto_18703 ) ) ( not ( = ?auto_18695 ?auto_18703 ) ) ( not ( = ?auto_18707 ?auto_18703 ) ) ( not ( = ?auto_18700 ?auto_18703 ) ) ( IS-CRATE ?auto_18707 ) ( not ( = ?auto_18696 ?auto_18707 ) ) ( not ( = ?auto_18694 ?auto_18696 ) ) ( not ( = ?auto_18695 ?auto_18696 ) ) ( not ( = ?auto_18700 ?auto_18696 ) ) ( not ( = ?auto_18703 ?auto_18696 ) ) ( not ( = ?auto_18699 ?auto_18702 ) ) ( not ( = ?auto_18701 ?auto_18699 ) ) ( HOIST-AT ?auto_18706 ?auto_18699 ) ( not ( = ?auto_18705 ?auto_18706 ) ) ( not ( = ?auto_18704 ?auto_18706 ) ) ( AVAILABLE ?auto_18706 ) ( SURFACE-AT ?auto_18707 ?auto_18699 ) ( ON ?auto_18707 ?auto_18698 ) ( CLEAR ?auto_18707 ) ( not ( = ?auto_18694 ?auto_18698 ) ) ( not ( = ?auto_18695 ?auto_18698 ) ) ( not ( = ?auto_18707 ?auto_18698 ) ) ( not ( = ?auto_18700 ?auto_18698 ) ) ( not ( = ?auto_18703 ?auto_18698 ) ) ( not ( = ?auto_18696 ?auto_18698 ) ) ( TRUCK-AT ?auto_18697 ?auto_18702 ) ( SURFACE-AT ?auto_18708 ?auto_18702 ) ( CLEAR ?auto_18708 ) ( LIFTING ?auto_18705 ?auto_18696 ) ( IS-CRATE ?auto_18696 ) ( not ( = ?auto_18708 ?auto_18696 ) ) ( not ( = ?auto_18694 ?auto_18708 ) ) ( not ( = ?auto_18695 ?auto_18708 ) ) ( not ( = ?auto_18707 ?auto_18708 ) ) ( not ( = ?auto_18700 ?auto_18708 ) ) ( not ( = ?auto_18703 ?auto_18708 ) ) ( not ( = ?auto_18698 ?auto_18708 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18708 ?auto_18696 )
      ( MAKE-2CRATE ?auto_18707 ?auto_18694 ?auto_18695 )
      ( MAKE-1CRATE-VERIFY ?auto_18694 ?auto_18695 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18709 - SURFACE
      ?auto_18710 - SURFACE
      ?auto_18711 - SURFACE
    )
    :vars
    (
      ?auto_18714 - HOIST
      ?auto_18719 - PLACE
      ?auto_18722 - PLACE
      ?auto_18717 - HOIST
      ?auto_18712 - SURFACE
      ?auto_18715 - SURFACE
      ?auto_18718 - SURFACE
      ?auto_18720 - PLACE
      ?auto_18721 - HOIST
      ?auto_18713 - SURFACE
      ?auto_18716 - TRUCK
      ?auto_18723 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18714 ?auto_18719 ) ( IS-CRATE ?auto_18711 ) ( not ( = ?auto_18710 ?auto_18711 ) ) ( not ( = ?auto_18709 ?auto_18710 ) ) ( not ( = ?auto_18709 ?auto_18711 ) ) ( not ( = ?auto_18722 ?auto_18719 ) ) ( HOIST-AT ?auto_18717 ?auto_18722 ) ( not ( = ?auto_18714 ?auto_18717 ) ) ( SURFACE-AT ?auto_18711 ?auto_18722 ) ( ON ?auto_18711 ?auto_18712 ) ( CLEAR ?auto_18711 ) ( not ( = ?auto_18710 ?auto_18712 ) ) ( not ( = ?auto_18711 ?auto_18712 ) ) ( not ( = ?auto_18709 ?auto_18712 ) ) ( IS-CRATE ?auto_18710 ) ( AVAILABLE ?auto_18717 ) ( SURFACE-AT ?auto_18710 ?auto_18722 ) ( ON ?auto_18710 ?auto_18715 ) ( CLEAR ?auto_18710 ) ( not ( = ?auto_18710 ?auto_18715 ) ) ( not ( = ?auto_18711 ?auto_18715 ) ) ( not ( = ?auto_18709 ?auto_18715 ) ) ( not ( = ?auto_18712 ?auto_18715 ) ) ( IS-CRATE ?auto_18709 ) ( not ( = ?auto_18718 ?auto_18709 ) ) ( not ( = ?auto_18710 ?auto_18718 ) ) ( not ( = ?auto_18711 ?auto_18718 ) ) ( not ( = ?auto_18712 ?auto_18718 ) ) ( not ( = ?auto_18715 ?auto_18718 ) ) ( not ( = ?auto_18720 ?auto_18719 ) ) ( not ( = ?auto_18722 ?auto_18720 ) ) ( HOIST-AT ?auto_18721 ?auto_18720 ) ( not ( = ?auto_18714 ?auto_18721 ) ) ( not ( = ?auto_18717 ?auto_18721 ) ) ( AVAILABLE ?auto_18721 ) ( SURFACE-AT ?auto_18709 ?auto_18720 ) ( ON ?auto_18709 ?auto_18713 ) ( CLEAR ?auto_18709 ) ( not ( = ?auto_18710 ?auto_18713 ) ) ( not ( = ?auto_18711 ?auto_18713 ) ) ( not ( = ?auto_18709 ?auto_18713 ) ) ( not ( = ?auto_18712 ?auto_18713 ) ) ( not ( = ?auto_18715 ?auto_18713 ) ) ( not ( = ?auto_18718 ?auto_18713 ) ) ( TRUCK-AT ?auto_18716 ?auto_18719 ) ( SURFACE-AT ?auto_18723 ?auto_18719 ) ( CLEAR ?auto_18723 ) ( LIFTING ?auto_18714 ?auto_18718 ) ( IS-CRATE ?auto_18718 ) ( not ( = ?auto_18723 ?auto_18718 ) ) ( not ( = ?auto_18710 ?auto_18723 ) ) ( not ( = ?auto_18711 ?auto_18723 ) ) ( not ( = ?auto_18709 ?auto_18723 ) ) ( not ( = ?auto_18712 ?auto_18723 ) ) ( not ( = ?auto_18715 ?auto_18723 ) ) ( not ( = ?auto_18713 ?auto_18723 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18710 ?auto_18711 )
      ( MAKE-2CRATE-VERIFY ?auto_18709 ?auto_18710 ?auto_18711 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18724 - SURFACE
      ?auto_18725 - SURFACE
      ?auto_18726 - SURFACE
      ?auto_18727 - SURFACE
    )
    :vars
    (
      ?auto_18730 - HOIST
      ?auto_18728 - PLACE
      ?auto_18732 - PLACE
      ?auto_18729 - HOIST
      ?auto_18735 - SURFACE
      ?auto_18731 - SURFACE
      ?auto_18734 - PLACE
      ?auto_18733 - HOIST
      ?auto_18736 - SURFACE
      ?auto_18737 - TRUCK
      ?auto_18738 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18730 ?auto_18728 ) ( IS-CRATE ?auto_18727 ) ( not ( = ?auto_18726 ?auto_18727 ) ) ( not ( = ?auto_18725 ?auto_18726 ) ) ( not ( = ?auto_18725 ?auto_18727 ) ) ( not ( = ?auto_18732 ?auto_18728 ) ) ( HOIST-AT ?auto_18729 ?auto_18732 ) ( not ( = ?auto_18730 ?auto_18729 ) ) ( SURFACE-AT ?auto_18727 ?auto_18732 ) ( ON ?auto_18727 ?auto_18735 ) ( CLEAR ?auto_18727 ) ( not ( = ?auto_18726 ?auto_18735 ) ) ( not ( = ?auto_18727 ?auto_18735 ) ) ( not ( = ?auto_18725 ?auto_18735 ) ) ( IS-CRATE ?auto_18726 ) ( AVAILABLE ?auto_18729 ) ( SURFACE-AT ?auto_18726 ?auto_18732 ) ( ON ?auto_18726 ?auto_18731 ) ( CLEAR ?auto_18726 ) ( not ( = ?auto_18726 ?auto_18731 ) ) ( not ( = ?auto_18727 ?auto_18731 ) ) ( not ( = ?auto_18725 ?auto_18731 ) ) ( not ( = ?auto_18735 ?auto_18731 ) ) ( IS-CRATE ?auto_18725 ) ( not ( = ?auto_18724 ?auto_18725 ) ) ( not ( = ?auto_18726 ?auto_18724 ) ) ( not ( = ?auto_18727 ?auto_18724 ) ) ( not ( = ?auto_18735 ?auto_18724 ) ) ( not ( = ?auto_18731 ?auto_18724 ) ) ( not ( = ?auto_18734 ?auto_18728 ) ) ( not ( = ?auto_18732 ?auto_18734 ) ) ( HOIST-AT ?auto_18733 ?auto_18734 ) ( not ( = ?auto_18730 ?auto_18733 ) ) ( not ( = ?auto_18729 ?auto_18733 ) ) ( AVAILABLE ?auto_18733 ) ( SURFACE-AT ?auto_18725 ?auto_18734 ) ( ON ?auto_18725 ?auto_18736 ) ( CLEAR ?auto_18725 ) ( not ( = ?auto_18726 ?auto_18736 ) ) ( not ( = ?auto_18727 ?auto_18736 ) ) ( not ( = ?auto_18725 ?auto_18736 ) ) ( not ( = ?auto_18735 ?auto_18736 ) ) ( not ( = ?auto_18731 ?auto_18736 ) ) ( not ( = ?auto_18724 ?auto_18736 ) ) ( TRUCK-AT ?auto_18737 ?auto_18728 ) ( SURFACE-AT ?auto_18738 ?auto_18728 ) ( CLEAR ?auto_18738 ) ( LIFTING ?auto_18730 ?auto_18724 ) ( IS-CRATE ?auto_18724 ) ( not ( = ?auto_18738 ?auto_18724 ) ) ( not ( = ?auto_18726 ?auto_18738 ) ) ( not ( = ?auto_18727 ?auto_18738 ) ) ( not ( = ?auto_18725 ?auto_18738 ) ) ( not ( = ?auto_18735 ?auto_18738 ) ) ( not ( = ?auto_18731 ?auto_18738 ) ) ( not ( = ?auto_18736 ?auto_18738 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18725 ?auto_18726 ?auto_18727 )
      ( MAKE-3CRATE-VERIFY ?auto_18724 ?auto_18725 ?auto_18726 ?auto_18727 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18739 - SURFACE
      ?auto_18740 - SURFACE
      ?auto_18741 - SURFACE
      ?auto_18742 - SURFACE
      ?auto_18743 - SURFACE
    )
    :vars
    (
      ?auto_18746 - HOIST
      ?auto_18744 - PLACE
      ?auto_18748 - PLACE
      ?auto_18745 - HOIST
      ?auto_18751 - SURFACE
      ?auto_18747 - SURFACE
      ?auto_18750 - PLACE
      ?auto_18749 - HOIST
      ?auto_18752 - SURFACE
      ?auto_18753 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18746 ?auto_18744 ) ( IS-CRATE ?auto_18743 ) ( not ( = ?auto_18742 ?auto_18743 ) ) ( not ( = ?auto_18741 ?auto_18742 ) ) ( not ( = ?auto_18741 ?auto_18743 ) ) ( not ( = ?auto_18748 ?auto_18744 ) ) ( HOIST-AT ?auto_18745 ?auto_18748 ) ( not ( = ?auto_18746 ?auto_18745 ) ) ( SURFACE-AT ?auto_18743 ?auto_18748 ) ( ON ?auto_18743 ?auto_18751 ) ( CLEAR ?auto_18743 ) ( not ( = ?auto_18742 ?auto_18751 ) ) ( not ( = ?auto_18743 ?auto_18751 ) ) ( not ( = ?auto_18741 ?auto_18751 ) ) ( IS-CRATE ?auto_18742 ) ( AVAILABLE ?auto_18745 ) ( SURFACE-AT ?auto_18742 ?auto_18748 ) ( ON ?auto_18742 ?auto_18747 ) ( CLEAR ?auto_18742 ) ( not ( = ?auto_18742 ?auto_18747 ) ) ( not ( = ?auto_18743 ?auto_18747 ) ) ( not ( = ?auto_18741 ?auto_18747 ) ) ( not ( = ?auto_18751 ?auto_18747 ) ) ( IS-CRATE ?auto_18741 ) ( not ( = ?auto_18740 ?auto_18741 ) ) ( not ( = ?auto_18742 ?auto_18740 ) ) ( not ( = ?auto_18743 ?auto_18740 ) ) ( not ( = ?auto_18751 ?auto_18740 ) ) ( not ( = ?auto_18747 ?auto_18740 ) ) ( not ( = ?auto_18750 ?auto_18744 ) ) ( not ( = ?auto_18748 ?auto_18750 ) ) ( HOIST-AT ?auto_18749 ?auto_18750 ) ( not ( = ?auto_18746 ?auto_18749 ) ) ( not ( = ?auto_18745 ?auto_18749 ) ) ( AVAILABLE ?auto_18749 ) ( SURFACE-AT ?auto_18741 ?auto_18750 ) ( ON ?auto_18741 ?auto_18752 ) ( CLEAR ?auto_18741 ) ( not ( = ?auto_18742 ?auto_18752 ) ) ( not ( = ?auto_18743 ?auto_18752 ) ) ( not ( = ?auto_18741 ?auto_18752 ) ) ( not ( = ?auto_18751 ?auto_18752 ) ) ( not ( = ?auto_18747 ?auto_18752 ) ) ( not ( = ?auto_18740 ?auto_18752 ) ) ( TRUCK-AT ?auto_18753 ?auto_18744 ) ( SURFACE-AT ?auto_18739 ?auto_18744 ) ( CLEAR ?auto_18739 ) ( LIFTING ?auto_18746 ?auto_18740 ) ( IS-CRATE ?auto_18740 ) ( not ( = ?auto_18739 ?auto_18740 ) ) ( not ( = ?auto_18742 ?auto_18739 ) ) ( not ( = ?auto_18743 ?auto_18739 ) ) ( not ( = ?auto_18741 ?auto_18739 ) ) ( not ( = ?auto_18751 ?auto_18739 ) ) ( not ( = ?auto_18747 ?auto_18739 ) ) ( not ( = ?auto_18752 ?auto_18739 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18741 ?auto_18742 ?auto_18743 )
      ( MAKE-4CRATE-VERIFY ?auto_18739 ?auto_18740 ?auto_18741 ?auto_18742 ?auto_18743 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18754 - SURFACE
      ?auto_18755 - SURFACE
      ?auto_18756 - SURFACE
      ?auto_18757 - SURFACE
      ?auto_18758 - SURFACE
      ?auto_18759 - SURFACE
    )
    :vars
    (
      ?auto_18762 - HOIST
      ?auto_18760 - PLACE
      ?auto_18764 - PLACE
      ?auto_18761 - HOIST
      ?auto_18767 - SURFACE
      ?auto_18763 - SURFACE
      ?auto_18766 - PLACE
      ?auto_18765 - HOIST
      ?auto_18768 - SURFACE
      ?auto_18769 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18762 ?auto_18760 ) ( IS-CRATE ?auto_18759 ) ( not ( = ?auto_18758 ?auto_18759 ) ) ( not ( = ?auto_18757 ?auto_18758 ) ) ( not ( = ?auto_18757 ?auto_18759 ) ) ( not ( = ?auto_18764 ?auto_18760 ) ) ( HOIST-AT ?auto_18761 ?auto_18764 ) ( not ( = ?auto_18762 ?auto_18761 ) ) ( SURFACE-AT ?auto_18759 ?auto_18764 ) ( ON ?auto_18759 ?auto_18767 ) ( CLEAR ?auto_18759 ) ( not ( = ?auto_18758 ?auto_18767 ) ) ( not ( = ?auto_18759 ?auto_18767 ) ) ( not ( = ?auto_18757 ?auto_18767 ) ) ( IS-CRATE ?auto_18758 ) ( AVAILABLE ?auto_18761 ) ( SURFACE-AT ?auto_18758 ?auto_18764 ) ( ON ?auto_18758 ?auto_18763 ) ( CLEAR ?auto_18758 ) ( not ( = ?auto_18758 ?auto_18763 ) ) ( not ( = ?auto_18759 ?auto_18763 ) ) ( not ( = ?auto_18757 ?auto_18763 ) ) ( not ( = ?auto_18767 ?auto_18763 ) ) ( IS-CRATE ?auto_18757 ) ( not ( = ?auto_18756 ?auto_18757 ) ) ( not ( = ?auto_18758 ?auto_18756 ) ) ( not ( = ?auto_18759 ?auto_18756 ) ) ( not ( = ?auto_18767 ?auto_18756 ) ) ( not ( = ?auto_18763 ?auto_18756 ) ) ( not ( = ?auto_18766 ?auto_18760 ) ) ( not ( = ?auto_18764 ?auto_18766 ) ) ( HOIST-AT ?auto_18765 ?auto_18766 ) ( not ( = ?auto_18762 ?auto_18765 ) ) ( not ( = ?auto_18761 ?auto_18765 ) ) ( AVAILABLE ?auto_18765 ) ( SURFACE-AT ?auto_18757 ?auto_18766 ) ( ON ?auto_18757 ?auto_18768 ) ( CLEAR ?auto_18757 ) ( not ( = ?auto_18758 ?auto_18768 ) ) ( not ( = ?auto_18759 ?auto_18768 ) ) ( not ( = ?auto_18757 ?auto_18768 ) ) ( not ( = ?auto_18767 ?auto_18768 ) ) ( not ( = ?auto_18763 ?auto_18768 ) ) ( not ( = ?auto_18756 ?auto_18768 ) ) ( TRUCK-AT ?auto_18769 ?auto_18760 ) ( SURFACE-AT ?auto_18755 ?auto_18760 ) ( CLEAR ?auto_18755 ) ( LIFTING ?auto_18762 ?auto_18756 ) ( IS-CRATE ?auto_18756 ) ( not ( = ?auto_18755 ?auto_18756 ) ) ( not ( = ?auto_18758 ?auto_18755 ) ) ( not ( = ?auto_18759 ?auto_18755 ) ) ( not ( = ?auto_18757 ?auto_18755 ) ) ( not ( = ?auto_18767 ?auto_18755 ) ) ( not ( = ?auto_18763 ?auto_18755 ) ) ( not ( = ?auto_18768 ?auto_18755 ) ) ( ON ?auto_18755 ?auto_18754 ) ( not ( = ?auto_18754 ?auto_18755 ) ) ( not ( = ?auto_18754 ?auto_18756 ) ) ( not ( = ?auto_18754 ?auto_18757 ) ) ( not ( = ?auto_18754 ?auto_18758 ) ) ( not ( = ?auto_18754 ?auto_18759 ) ) ( not ( = ?auto_18754 ?auto_18767 ) ) ( not ( = ?auto_18754 ?auto_18763 ) ) ( not ( = ?auto_18754 ?auto_18768 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18757 ?auto_18758 ?auto_18759 )
      ( MAKE-5CRATE-VERIFY ?auto_18754 ?auto_18755 ?auto_18756 ?auto_18757 ?auto_18758 ?auto_18759 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18770 - SURFACE
      ?auto_18771 - SURFACE
    )
    :vars
    (
      ?auto_18774 - HOIST
      ?auto_18772 - PLACE
      ?auto_18784 - SURFACE
      ?auto_18776 - PLACE
      ?auto_18773 - HOIST
      ?auto_18779 - SURFACE
      ?auto_18775 - SURFACE
      ?auto_18780 - SURFACE
      ?auto_18778 - PLACE
      ?auto_18777 - HOIST
      ?auto_18781 - SURFACE
      ?auto_18782 - TRUCK
      ?auto_18783 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18774 ?auto_18772 ) ( IS-CRATE ?auto_18771 ) ( not ( = ?auto_18770 ?auto_18771 ) ) ( not ( = ?auto_18784 ?auto_18770 ) ) ( not ( = ?auto_18784 ?auto_18771 ) ) ( not ( = ?auto_18776 ?auto_18772 ) ) ( HOIST-AT ?auto_18773 ?auto_18776 ) ( not ( = ?auto_18774 ?auto_18773 ) ) ( SURFACE-AT ?auto_18771 ?auto_18776 ) ( ON ?auto_18771 ?auto_18779 ) ( CLEAR ?auto_18771 ) ( not ( = ?auto_18770 ?auto_18779 ) ) ( not ( = ?auto_18771 ?auto_18779 ) ) ( not ( = ?auto_18784 ?auto_18779 ) ) ( IS-CRATE ?auto_18770 ) ( AVAILABLE ?auto_18773 ) ( SURFACE-AT ?auto_18770 ?auto_18776 ) ( ON ?auto_18770 ?auto_18775 ) ( CLEAR ?auto_18770 ) ( not ( = ?auto_18770 ?auto_18775 ) ) ( not ( = ?auto_18771 ?auto_18775 ) ) ( not ( = ?auto_18784 ?auto_18775 ) ) ( not ( = ?auto_18779 ?auto_18775 ) ) ( IS-CRATE ?auto_18784 ) ( not ( = ?auto_18780 ?auto_18784 ) ) ( not ( = ?auto_18770 ?auto_18780 ) ) ( not ( = ?auto_18771 ?auto_18780 ) ) ( not ( = ?auto_18779 ?auto_18780 ) ) ( not ( = ?auto_18775 ?auto_18780 ) ) ( not ( = ?auto_18778 ?auto_18772 ) ) ( not ( = ?auto_18776 ?auto_18778 ) ) ( HOIST-AT ?auto_18777 ?auto_18778 ) ( not ( = ?auto_18774 ?auto_18777 ) ) ( not ( = ?auto_18773 ?auto_18777 ) ) ( AVAILABLE ?auto_18777 ) ( SURFACE-AT ?auto_18784 ?auto_18778 ) ( ON ?auto_18784 ?auto_18781 ) ( CLEAR ?auto_18784 ) ( not ( = ?auto_18770 ?auto_18781 ) ) ( not ( = ?auto_18771 ?auto_18781 ) ) ( not ( = ?auto_18784 ?auto_18781 ) ) ( not ( = ?auto_18779 ?auto_18781 ) ) ( not ( = ?auto_18775 ?auto_18781 ) ) ( not ( = ?auto_18780 ?auto_18781 ) ) ( TRUCK-AT ?auto_18782 ?auto_18772 ) ( SURFACE-AT ?auto_18783 ?auto_18772 ) ( CLEAR ?auto_18783 ) ( IS-CRATE ?auto_18780 ) ( not ( = ?auto_18783 ?auto_18780 ) ) ( not ( = ?auto_18770 ?auto_18783 ) ) ( not ( = ?auto_18771 ?auto_18783 ) ) ( not ( = ?auto_18784 ?auto_18783 ) ) ( not ( = ?auto_18779 ?auto_18783 ) ) ( not ( = ?auto_18775 ?auto_18783 ) ) ( not ( = ?auto_18781 ?auto_18783 ) ) ( AVAILABLE ?auto_18774 ) ( IN ?auto_18780 ?auto_18782 ) )
    :subtasks
    ( ( !UNLOAD ?auto_18774 ?auto_18780 ?auto_18782 ?auto_18772 )
      ( MAKE-2CRATE ?auto_18784 ?auto_18770 ?auto_18771 )
      ( MAKE-1CRATE-VERIFY ?auto_18770 ?auto_18771 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18785 - SURFACE
      ?auto_18786 - SURFACE
      ?auto_18787 - SURFACE
    )
    :vars
    (
      ?auto_18796 - HOIST
      ?auto_18789 - PLACE
      ?auto_18798 - PLACE
      ?auto_18795 - HOIST
      ?auto_18790 - SURFACE
      ?auto_18793 - SURFACE
      ?auto_18794 - SURFACE
      ?auto_18788 - PLACE
      ?auto_18799 - HOIST
      ?auto_18797 - SURFACE
      ?auto_18791 - TRUCK
      ?auto_18792 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18796 ?auto_18789 ) ( IS-CRATE ?auto_18787 ) ( not ( = ?auto_18786 ?auto_18787 ) ) ( not ( = ?auto_18785 ?auto_18786 ) ) ( not ( = ?auto_18785 ?auto_18787 ) ) ( not ( = ?auto_18798 ?auto_18789 ) ) ( HOIST-AT ?auto_18795 ?auto_18798 ) ( not ( = ?auto_18796 ?auto_18795 ) ) ( SURFACE-AT ?auto_18787 ?auto_18798 ) ( ON ?auto_18787 ?auto_18790 ) ( CLEAR ?auto_18787 ) ( not ( = ?auto_18786 ?auto_18790 ) ) ( not ( = ?auto_18787 ?auto_18790 ) ) ( not ( = ?auto_18785 ?auto_18790 ) ) ( IS-CRATE ?auto_18786 ) ( AVAILABLE ?auto_18795 ) ( SURFACE-AT ?auto_18786 ?auto_18798 ) ( ON ?auto_18786 ?auto_18793 ) ( CLEAR ?auto_18786 ) ( not ( = ?auto_18786 ?auto_18793 ) ) ( not ( = ?auto_18787 ?auto_18793 ) ) ( not ( = ?auto_18785 ?auto_18793 ) ) ( not ( = ?auto_18790 ?auto_18793 ) ) ( IS-CRATE ?auto_18785 ) ( not ( = ?auto_18794 ?auto_18785 ) ) ( not ( = ?auto_18786 ?auto_18794 ) ) ( not ( = ?auto_18787 ?auto_18794 ) ) ( not ( = ?auto_18790 ?auto_18794 ) ) ( not ( = ?auto_18793 ?auto_18794 ) ) ( not ( = ?auto_18788 ?auto_18789 ) ) ( not ( = ?auto_18798 ?auto_18788 ) ) ( HOIST-AT ?auto_18799 ?auto_18788 ) ( not ( = ?auto_18796 ?auto_18799 ) ) ( not ( = ?auto_18795 ?auto_18799 ) ) ( AVAILABLE ?auto_18799 ) ( SURFACE-AT ?auto_18785 ?auto_18788 ) ( ON ?auto_18785 ?auto_18797 ) ( CLEAR ?auto_18785 ) ( not ( = ?auto_18786 ?auto_18797 ) ) ( not ( = ?auto_18787 ?auto_18797 ) ) ( not ( = ?auto_18785 ?auto_18797 ) ) ( not ( = ?auto_18790 ?auto_18797 ) ) ( not ( = ?auto_18793 ?auto_18797 ) ) ( not ( = ?auto_18794 ?auto_18797 ) ) ( TRUCK-AT ?auto_18791 ?auto_18789 ) ( SURFACE-AT ?auto_18792 ?auto_18789 ) ( CLEAR ?auto_18792 ) ( IS-CRATE ?auto_18794 ) ( not ( = ?auto_18792 ?auto_18794 ) ) ( not ( = ?auto_18786 ?auto_18792 ) ) ( not ( = ?auto_18787 ?auto_18792 ) ) ( not ( = ?auto_18785 ?auto_18792 ) ) ( not ( = ?auto_18790 ?auto_18792 ) ) ( not ( = ?auto_18793 ?auto_18792 ) ) ( not ( = ?auto_18797 ?auto_18792 ) ) ( AVAILABLE ?auto_18796 ) ( IN ?auto_18794 ?auto_18791 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18786 ?auto_18787 )
      ( MAKE-2CRATE-VERIFY ?auto_18785 ?auto_18786 ?auto_18787 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18800 - SURFACE
      ?auto_18801 - SURFACE
      ?auto_18802 - SURFACE
      ?auto_18803 - SURFACE
    )
    :vars
    (
      ?auto_18811 - HOIST
      ?auto_18804 - PLACE
      ?auto_18805 - PLACE
      ?auto_18810 - HOIST
      ?auto_18814 - SURFACE
      ?auto_18806 - SURFACE
      ?auto_18809 - PLACE
      ?auto_18812 - HOIST
      ?auto_18808 - SURFACE
      ?auto_18813 - TRUCK
      ?auto_18807 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18811 ?auto_18804 ) ( IS-CRATE ?auto_18803 ) ( not ( = ?auto_18802 ?auto_18803 ) ) ( not ( = ?auto_18801 ?auto_18802 ) ) ( not ( = ?auto_18801 ?auto_18803 ) ) ( not ( = ?auto_18805 ?auto_18804 ) ) ( HOIST-AT ?auto_18810 ?auto_18805 ) ( not ( = ?auto_18811 ?auto_18810 ) ) ( SURFACE-AT ?auto_18803 ?auto_18805 ) ( ON ?auto_18803 ?auto_18814 ) ( CLEAR ?auto_18803 ) ( not ( = ?auto_18802 ?auto_18814 ) ) ( not ( = ?auto_18803 ?auto_18814 ) ) ( not ( = ?auto_18801 ?auto_18814 ) ) ( IS-CRATE ?auto_18802 ) ( AVAILABLE ?auto_18810 ) ( SURFACE-AT ?auto_18802 ?auto_18805 ) ( ON ?auto_18802 ?auto_18806 ) ( CLEAR ?auto_18802 ) ( not ( = ?auto_18802 ?auto_18806 ) ) ( not ( = ?auto_18803 ?auto_18806 ) ) ( not ( = ?auto_18801 ?auto_18806 ) ) ( not ( = ?auto_18814 ?auto_18806 ) ) ( IS-CRATE ?auto_18801 ) ( not ( = ?auto_18800 ?auto_18801 ) ) ( not ( = ?auto_18802 ?auto_18800 ) ) ( not ( = ?auto_18803 ?auto_18800 ) ) ( not ( = ?auto_18814 ?auto_18800 ) ) ( not ( = ?auto_18806 ?auto_18800 ) ) ( not ( = ?auto_18809 ?auto_18804 ) ) ( not ( = ?auto_18805 ?auto_18809 ) ) ( HOIST-AT ?auto_18812 ?auto_18809 ) ( not ( = ?auto_18811 ?auto_18812 ) ) ( not ( = ?auto_18810 ?auto_18812 ) ) ( AVAILABLE ?auto_18812 ) ( SURFACE-AT ?auto_18801 ?auto_18809 ) ( ON ?auto_18801 ?auto_18808 ) ( CLEAR ?auto_18801 ) ( not ( = ?auto_18802 ?auto_18808 ) ) ( not ( = ?auto_18803 ?auto_18808 ) ) ( not ( = ?auto_18801 ?auto_18808 ) ) ( not ( = ?auto_18814 ?auto_18808 ) ) ( not ( = ?auto_18806 ?auto_18808 ) ) ( not ( = ?auto_18800 ?auto_18808 ) ) ( TRUCK-AT ?auto_18813 ?auto_18804 ) ( SURFACE-AT ?auto_18807 ?auto_18804 ) ( CLEAR ?auto_18807 ) ( IS-CRATE ?auto_18800 ) ( not ( = ?auto_18807 ?auto_18800 ) ) ( not ( = ?auto_18802 ?auto_18807 ) ) ( not ( = ?auto_18803 ?auto_18807 ) ) ( not ( = ?auto_18801 ?auto_18807 ) ) ( not ( = ?auto_18814 ?auto_18807 ) ) ( not ( = ?auto_18806 ?auto_18807 ) ) ( not ( = ?auto_18808 ?auto_18807 ) ) ( AVAILABLE ?auto_18811 ) ( IN ?auto_18800 ?auto_18813 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18801 ?auto_18802 ?auto_18803 )
      ( MAKE-3CRATE-VERIFY ?auto_18800 ?auto_18801 ?auto_18802 ?auto_18803 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18815 - SURFACE
      ?auto_18816 - SURFACE
      ?auto_18817 - SURFACE
      ?auto_18818 - SURFACE
      ?auto_18819 - SURFACE
    )
    :vars
    (
      ?auto_18826 - HOIST
      ?auto_18820 - PLACE
      ?auto_18821 - PLACE
      ?auto_18825 - HOIST
      ?auto_18829 - SURFACE
      ?auto_18822 - SURFACE
      ?auto_18824 - PLACE
      ?auto_18827 - HOIST
      ?auto_18823 - SURFACE
      ?auto_18828 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18826 ?auto_18820 ) ( IS-CRATE ?auto_18819 ) ( not ( = ?auto_18818 ?auto_18819 ) ) ( not ( = ?auto_18817 ?auto_18818 ) ) ( not ( = ?auto_18817 ?auto_18819 ) ) ( not ( = ?auto_18821 ?auto_18820 ) ) ( HOIST-AT ?auto_18825 ?auto_18821 ) ( not ( = ?auto_18826 ?auto_18825 ) ) ( SURFACE-AT ?auto_18819 ?auto_18821 ) ( ON ?auto_18819 ?auto_18829 ) ( CLEAR ?auto_18819 ) ( not ( = ?auto_18818 ?auto_18829 ) ) ( not ( = ?auto_18819 ?auto_18829 ) ) ( not ( = ?auto_18817 ?auto_18829 ) ) ( IS-CRATE ?auto_18818 ) ( AVAILABLE ?auto_18825 ) ( SURFACE-AT ?auto_18818 ?auto_18821 ) ( ON ?auto_18818 ?auto_18822 ) ( CLEAR ?auto_18818 ) ( not ( = ?auto_18818 ?auto_18822 ) ) ( not ( = ?auto_18819 ?auto_18822 ) ) ( not ( = ?auto_18817 ?auto_18822 ) ) ( not ( = ?auto_18829 ?auto_18822 ) ) ( IS-CRATE ?auto_18817 ) ( not ( = ?auto_18816 ?auto_18817 ) ) ( not ( = ?auto_18818 ?auto_18816 ) ) ( not ( = ?auto_18819 ?auto_18816 ) ) ( not ( = ?auto_18829 ?auto_18816 ) ) ( not ( = ?auto_18822 ?auto_18816 ) ) ( not ( = ?auto_18824 ?auto_18820 ) ) ( not ( = ?auto_18821 ?auto_18824 ) ) ( HOIST-AT ?auto_18827 ?auto_18824 ) ( not ( = ?auto_18826 ?auto_18827 ) ) ( not ( = ?auto_18825 ?auto_18827 ) ) ( AVAILABLE ?auto_18827 ) ( SURFACE-AT ?auto_18817 ?auto_18824 ) ( ON ?auto_18817 ?auto_18823 ) ( CLEAR ?auto_18817 ) ( not ( = ?auto_18818 ?auto_18823 ) ) ( not ( = ?auto_18819 ?auto_18823 ) ) ( not ( = ?auto_18817 ?auto_18823 ) ) ( not ( = ?auto_18829 ?auto_18823 ) ) ( not ( = ?auto_18822 ?auto_18823 ) ) ( not ( = ?auto_18816 ?auto_18823 ) ) ( TRUCK-AT ?auto_18828 ?auto_18820 ) ( SURFACE-AT ?auto_18815 ?auto_18820 ) ( CLEAR ?auto_18815 ) ( IS-CRATE ?auto_18816 ) ( not ( = ?auto_18815 ?auto_18816 ) ) ( not ( = ?auto_18818 ?auto_18815 ) ) ( not ( = ?auto_18819 ?auto_18815 ) ) ( not ( = ?auto_18817 ?auto_18815 ) ) ( not ( = ?auto_18829 ?auto_18815 ) ) ( not ( = ?auto_18822 ?auto_18815 ) ) ( not ( = ?auto_18823 ?auto_18815 ) ) ( AVAILABLE ?auto_18826 ) ( IN ?auto_18816 ?auto_18828 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18817 ?auto_18818 ?auto_18819 )
      ( MAKE-4CRATE-VERIFY ?auto_18815 ?auto_18816 ?auto_18817 ?auto_18818 ?auto_18819 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18830 - SURFACE
      ?auto_18831 - SURFACE
      ?auto_18832 - SURFACE
      ?auto_18833 - SURFACE
      ?auto_18834 - SURFACE
      ?auto_18835 - SURFACE
    )
    :vars
    (
      ?auto_18842 - HOIST
      ?auto_18836 - PLACE
      ?auto_18837 - PLACE
      ?auto_18841 - HOIST
      ?auto_18845 - SURFACE
      ?auto_18838 - SURFACE
      ?auto_18840 - PLACE
      ?auto_18843 - HOIST
      ?auto_18839 - SURFACE
      ?auto_18844 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18842 ?auto_18836 ) ( IS-CRATE ?auto_18835 ) ( not ( = ?auto_18834 ?auto_18835 ) ) ( not ( = ?auto_18833 ?auto_18834 ) ) ( not ( = ?auto_18833 ?auto_18835 ) ) ( not ( = ?auto_18837 ?auto_18836 ) ) ( HOIST-AT ?auto_18841 ?auto_18837 ) ( not ( = ?auto_18842 ?auto_18841 ) ) ( SURFACE-AT ?auto_18835 ?auto_18837 ) ( ON ?auto_18835 ?auto_18845 ) ( CLEAR ?auto_18835 ) ( not ( = ?auto_18834 ?auto_18845 ) ) ( not ( = ?auto_18835 ?auto_18845 ) ) ( not ( = ?auto_18833 ?auto_18845 ) ) ( IS-CRATE ?auto_18834 ) ( AVAILABLE ?auto_18841 ) ( SURFACE-AT ?auto_18834 ?auto_18837 ) ( ON ?auto_18834 ?auto_18838 ) ( CLEAR ?auto_18834 ) ( not ( = ?auto_18834 ?auto_18838 ) ) ( not ( = ?auto_18835 ?auto_18838 ) ) ( not ( = ?auto_18833 ?auto_18838 ) ) ( not ( = ?auto_18845 ?auto_18838 ) ) ( IS-CRATE ?auto_18833 ) ( not ( = ?auto_18832 ?auto_18833 ) ) ( not ( = ?auto_18834 ?auto_18832 ) ) ( not ( = ?auto_18835 ?auto_18832 ) ) ( not ( = ?auto_18845 ?auto_18832 ) ) ( not ( = ?auto_18838 ?auto_18832 ) ) ( not ( = ?auto_18840 ?auto_18836 ) ) ( not ( = ?auto_18837 ?auto_18840 ) ) ( HOIST-AT ?auto_18843 ?auto_18840 ) ( not ( = ?auto_18842 ?auto_18843 ) ) ( not ( = ?auto_18841 ?auto_18843 ) ) ( AVAILABLE ?auto_18843 ) ( SURFACE-AT ?auto_18833 ?auto_18840 ) ( ON ?auto_18833 ?auto_18839 ) ( CLEAR ?auto_18833 ) ( not ( = ?auto_18834 ?auto_18839 ) ) ( not ( = ?auto_18835 ?auto_18839 ) ) ( not ( = ?auto_18833 ?auto_18839 ) ) ( not ( = ?auto_18845 ?auto_18839 ) ) ( not ( = ?auto_18838 ?auto_18839 ) ) ( not ( = ?auto_18832 ?auto_18839 ) ) ( TRUCK-AT ?auto_18844 ?auto_18836 ) ( SURFACE-AT ?auto_18831 ?auto_18836 ) ( CLEAR ?auto_18831 ) ( IS-CRATE ?auto_18832 ) ( not ( = ?auto_18831 ?auto_18832 ) ) ( not ( = ?auto_18834 ?auto_18831 ) ) ( not ( = ?auto_18835 ?auto_18831 ) ) ( not ( = ?auto_18833 ?auto_18831 ) ) ( not ( = ?auto_18845 ?auto_18831 ) ) ( not ( = ?auto_18838 ?auto_18831 ) ) ( not ( = ?auto_18839 ?auto_18831 ) ) ( AVAILABLE ?auto_18842 ) ( IN ?auto_18832 ?auto_18844 ) ( ON ?auto_18831 ?auto_18830 ) ( not ( = ?auto_18830 ?auto_18831 ) ) ( not ( = ?auto_18830 ?auto_18832 ) ) ( not ( = ?auto_18830 ?auto_18833 ) ) ( not ( = ?auto_18830 ?auto_18834 ) ) ( not ( = ?auto_18830 ?auto_18835 ) ) ( not ( = ?auto_18830 ?auto_18845 ) ) ( not ( = ?auto_18830 ?auto_18838 ) ) ( not ( = ?auto_18830 ?auto_18839 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18833 ?auto_18834 ?auto_18835 )
      ( MAKE-5CRATE-VERIFY ?auto_18830 ?auto_18831 ?auto_18832 ?auto_18833 ?auto_18834 ?auto_18835 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18846 - SURFACE
      ?auto_18847 - SURFACE
    )
    :vars
    (
      ?auto_18855 - HOIST
      ?auto_18848 - PLACE
      ?auto_18860 - SURFACE
      ?auto_18849 - PLACE
      ?auto_18854 - HOIST
      ?auto_18859 - SURFACE
      ?auto_18850 - SURFACE
      ?auto_18857 - SURFACE
      ?auto_18853 - PLACE
      ?auto_18856 - HOIST
      ?auto_18852 - SURFACE
      ?auto_18851 - SURFACE
      ?auto_18858 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18855 ?auto_18848 ) ( IS-CRATE ?auto_18847 ) ( not ( = ?auto_18846 ?auto_18847 ) ) ( not ( = ?auto_18860 ?auto_18846 ) ) ( not ( = ?auto_18860 ?auto_18847 ) ) ( not ( = ?auto_18849 ?auto_18848 ) ) ( HOIST-AT ?auto_18854 ?auto_18849 ) ( not ( = ?auto_18855 ?auto_18854 ) ) ( SURFACE-AT ?auto_18847 ?auto_18849 ) ( ON ?auto_18847 ?auto_18859 ) ( CLEAR ?auto_18847 ) ( not ( = ?auto_18846 ?auto_18859 ) ) ( not ( = ?auto_18847 ?auto_18859 ) ) ( not ( = ?auto_18860 ?auto_18859 ) ) ( IS-CRATE ?auto_18846 ) ( AVAILABLE ?auto_18854 ) ( SURFACE-AT ?auto_18846 ?auto_18849 ) ( ON ?auto_18846 ?auto_18850 ) ( CLEAR ?auto_18846 ) ( not ( = ?auto_18846 ?auto_18850 ) ) ( not ( = ?auto_18847 ?auto_18850 ) ) ( not ( = ?auto_18860 ?auto_18850 ) ) ( not ( = ?auto_18859 ?auto_18850 ) ) ( IS-CRATE ?auto_18860 ) ( not ( = ?auto_18857 ?auto_18860 ) ) ( not ( = ?auto_18846 ?auto_18857 ) ) ( not ( = ?auto_18847 ?auto_18857 ) ) ( not ( = ?auto_18859 ?auto_18857 ) ) ( not ( = ?auto_18850 ?auto_18857 ) ) ( not ( = ?auto_18853 ?auto_18848 ) ) ( not ( = ?auto_18849 ?auto_18853 ) ) ( HOIST-AT ?auto_18856 ?auto_18853 ) ( not ( = ?auto_18855 ?auto_18856 ) ) ( not ( = ?auto_18854 ?auto_18856 ) ) ( AVAILABLE ?auto_18856 ) ( SURFACE-AT ?auto_18860 ?auto_18853 ) ( ON ?auto_18860 ?auto_18852 ) ( CLEAR ?auto_18860 ) ( not ( = ?auto_18846 ?auto_18852 ) ) ( not ( = ?auto_18847 ?auto_18852 ) ) ( not ( = ?auto_18860 ?auto_18852 ) ) ( not ( = ?auto_18859 ?auto_18852 ) ) ( not ( = ?auto_18850 ?auto_18852 ) ) ( not ( = ?auto_18857 ?auto_18852 ) ) ( SURFACE-AT ?auto_18851 ?auto_18848 ) ( CLEAR ?auto_18851 ) ( IS-CRATE ?auto_18857 ) ( not ( = ?auto_18851 ?auto_18857 ) ) ( not ( = ?auto_18846 ?auto_18851 ) ) ( not ( = ?auto_18847 ?auto_18851 ) ) ( not ( = ?auto_18860 ?auto_18851 ) ) ( not ( = ?auto_18859 ?auto_18851 ) ) ( not ( = ?auto_18850 ?auto_18851 ) ) ( not ( = ?auto_18852 ?auto_18851 ) ) ( AVAILABLE ?auto_18855 ) ( IN ?auto_18857 ?auto_18858 ) ( TRUCK-AT ?auto_18858 ?auto_18849 ) )
    :subtasks
    ( ( !DRIVE ?auto_18858 ?auto_18849 ?auto_18848 )
      ( MAKE-2CRATE ?auto_18860 ?auto_18846 ?auto_18847 )
      ( MAKE-1CRATE-VERIFY ?auto_18846 ?auto_18847 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18861 - SURFACE
      ?auto_18862 - SURFACE
      ?auto_18863 - SURFACE
    )
    :vars
    (
      ?auto_18873 - HOIST
      ?auto_18875 - PLACE
      ?auto_18867 - PLACE
      ?auto_18874 - HOIST
      ?auto_18869 - SURFACE
      ?auto_18872 - SURFACE
      ?auto_18871 - SURFACE
      ?auto_18866 - PLACE
      ?auto_18864 - HOIST
      ?auto_18870 - SURFACE
      ?auto_18868 - SURFACE
      ?auto_18865 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18873 ?auto_18875 ) ( IS-CRATE ?auto_18863 ) ( not ( = ?auto_18862 ?auto_18863 ) ) ( not ( = ?auto_18861 ?auto_18862 ) ) ( not ( = ?auto_18861 ?auto_18863 ) ) ( not ( = ?auto_18867 ?auto_18875 ) ) ( HOIST-AT ?auto_18874 ?auto_18867 ) ( not ( = ?auto_18873 ?auto_18874 ) ) ( SURFACE-AT ?auto_18863 ?auto_18867 ) ( ON ?auto_18863 ?auto_18869 ) ( CLEAR ?auto_18863 ) ( not ( = ?auto_18862 ?auto_18869 ) ) ( not ( = ?auto_18863 ?auto_18869 ) ) ( not ( = ?auto_18861 ?auto_18869 ) ) ( IS-CRATE ?auto_18862 ) ( AVAILABLE ?auto_18874 ) ( SURFACE-AT ?auto_18862 ?auto_18867 ) ( ON ?auto_18862 ?auto_18872 ) ( CLEAR ?auto_18862 ) ( not ( = ?auto_18862 ?auto_18872 ) ) ( not ( = ?auto_18863 ?auto_18872 ) ) ( not ( = ?auto_18861 ?auto_18872 ) ) ( not ( = ?auto_18869 ?auto_18872 ) ) ( IS-CRATE ?auto_18861 ) ( not ( = ?auto_18871 ?auto_18861 ) ) ( not ( = ?auto_18862 ?auto_18871 ) ) ( not ( = ?auto_18863 ?auto_18871 ) ) ( not ( = ?auto_18869 ?auto_18871 ) ) ( not ( = ?auto_18872 ?auto_18871 ) ) ( not ( = ?auto_18866 ?auto_18875 ) ) ( not ( = ?auto_18867 ?auto_18866 ) ) ( HOIST-AT ?auto_18864 ?auto_18866 ) ( not ( = ?auto_18873 ?auto_18864 ) ) ( not ( = ?auto_18874 ?auto_18864 ) ) ( AVAILABLE ?auto_18864 ) ( SURFACE-AT ?auto_18861 ?auto_18866 ) ( ON ?auto_18861 ?auto_18870 ) ( CLEAR ?auto_18861 ) ( not ( = ?auto_18862 ?auto_18870 ) ) ( not ( = ?auto_18863 ?auto_18870 ) ) ( not ( = ?auto_18861 ?auto_18870 ) ) ( not ( = ?auto_18869 ?auto_18870 ) ) ( not ( = ?auto_18872 ?auto_18870 ) ) ( not ( = ?auto_18871 ?auto_18870 ) ) ( SURFACE-AT ?auto_18868 ?auto_18875 ) ( CLEAR ?auto_18868 ) ( IS-CRATE ?auto_18871 ) ( not ( = ?auto_18868 ?auto_18871 ) ) ( not ( = ?auto_18862 ?auto_18868 ) ) ( not ( = ?auto_18863 ?auto_18868 ) ) ( not ( = ?auto_18861 ?auto_18868 ) ) ( not ( = ?auto_18869 ?auto_18868 ) ) ( not ( = ?auto_18872 ?auto_18868 ) ) ( not ( = ?auto_18870 ?auto_18868 ) ) ( AVAILABLE ?auto_18873 ) ( IN ?auto_18871 ?auto_18865 ) ( TRUCK-AT ?auto_18865 ?auto_18867 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18862 ?auto_18863 )
      ( MAKE-2CRATE-VERIFY ?auto_18861 ?auto_18862 ?auto_18863 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18876 - SURFACE
      ?auto_18877 - SURFACE
      ?auto_18878 - SURFACE
      ?auto_18879 - SURFACE
    )
    :vars
    (
      ?auto_18885 - HOIST
      ?auto_18881 - PLACE
      ?auto_18887 - PLACE
      ?auto_18882 - HOIST
      ?auto_18888 - SURFACE
      ?auto_18889 - SURFACE
      ?auto_18883 - PLACE
      ?auto_18884 - HOIST
      ?auto_18886 - SURFACE
      ?auto_18880 - SURFACE
      ?auto_18890 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18885 ?auto_18881 ) ( IS-CRATE ?auto_18879 ) ( not ( = ?auto_18878 ?auto_18879 ) ) ( not ( = ?auto_18877 ?auto_18878 ) ) ( not ( = ?auto_18877 ?auto_18879 ) ) ( not ( = ?auto_18887 ?auto_18881 ) ) ( HOIST-AT ?auto_18882 ?auto_18887 ) ( not ( = ?auto_18885 ?auto_18882 ) ) ( SURFACE-AT ?auto_18879 ?auto_18887 ) ( ON ?auto_18879 ?auto_18888 ) ( CLEAR ?auto_18879 ) ( not ( = ?auto_18878 ?auto_18888 ) ) ( not ( = ?auto_18879 ?auto_18888 ) ) ( not ( = ?auto_18877 ?auto_18888 ) ) ( IS-CRATE ?auto_18878 ) ( AVAILABLE ?auto_18882 ) ( SURFACE-AT ?auto_18878 ?auto_18887 ) ( ON ?auto_18878 ?auto_18889 ) ( CLEAR ?auto_18878 ) ( not ( = ?auto_18878 ?auto_18889 ) ) ( not ( = ?auto_18879 ?auto_18889 ) ) ( not ( = ?auto_18877 ?auto_18889 ) ) ( not ( = ?auto_18888 ?auto_18889 ) ) ( IS-CRATE ?auto_18877 ) ( not ( = ?auto_18876 ?auto_18877 ) ) ( not ( = ?auto_18878 ?auto_18876 ) ) ( not ( = ?auto_18879 ?auto_18876 ) ) ( not ( = ?auto_18888 ?auto_18876 ) ) ( not ( = ?auto_18889 ?auto_18876 ) ) ( not ( = ?auto_18883 ?auto_18881 ) ) ( not ( = ?auto_18887 ?auto_18883 ) ) ( HOIST-AT ?auto_18884 ?auto_18883 ) ( not ( = ?auto_18885 ?auto_18884 ) ) ( not ( = ?auto_18882 ?auto_18884 ) ) ( AVAILABLE ?auto_18884 ) ( SURFACE-AT ?auto_18877 ?auto_18883 ) ( ON ?auto_18877 ?auto_18886 ) ( CLEAR ?auto_18877 ) ( not ( = ?auto_18878 ?auto_18886 ) ) ( not ( = ?auto_18879 ?auto_18886 ) ) ( not ( = ?auto_18877 ?auto_18886 ) ) ( not ( = ?auto_18888 ?auto_18886 ) ) ( not ( = ?auto_18889 ?auto_18886 ) ) ( not ( = ?auto_18876 ?auto_18886 ) ) ( SURFACE-AT ?auto_18880 ?auto_18881 ) ( CLEAR ?auto_18880 ) ( IS-CRATE ?auto_18876 ) ( not ( = ?auto_18880 ?auto_18876 ) ) ( not ( = ?auto_18878 ?auto_18880 ) ) ( not ( = ?auto_18879 ?auto_18880 ) ) ( not ( = ?auto_18877 ?auto_18880 ) ) ( not ( = ?auto_18888 ?auto_18880 ) ) ( not ( = ?auto_18889 ?auto_18880 ) ) ( not ( = ?auto_18886 ?auto_18880 ) ) ( AVAILABLE ?auto_18885 ) ( IN ?auto_18876 ?auto_18890 ) ( TRUCK-AT ?auto_18890 ?auto_18887 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18877 ?auto_18878 ?auto_18879 )
      ( MAKE-3CRATE-VERIFY ?auto_18876 ?auto_18877 ?auto_18878 ?auto_18879 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18891 - SURFACE
      ?auto_18892 - SURFACE
      ?auto_18893 - SURFACE
      ?auto_18894 - SURFACE
      ?auto_18895 - SURFACE
    )
    :vars
    (
      ?auto_18900 - HOIST
      ?auto_18896 - PLACE
      ?auto_18902 - PLACE
      ?auto_18897 - HOIST
      ?auto_18903 - SURFACE
      ?auto_18904 - SURFACE
      ?auto_18898 - PLACE
      ?auto_18899 - HOIST
      ?auto_18901 - SURFACE
      ?auto_18905 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18900 ?auto_18896 ) ( IS-CRATE ?auto_18895 ) ( not ( = ?auto_18894 ?auto_18895 ) ) ( not ( = ?auto_18893 ?auto_18894 ) ) ( not ( = ?auto_18893 ?auto_18895 ) ) ( not ( = ?auto_18902 ?auto_18896 ) ) ( HOIST-AT ?auto_18897 ?auto_18902 ) ( not ( = ?auto_18900 ?auto_18897 ) ) ( SURFACE-AT ?auto_18895 ?auto_18902 ) ( ON ?auto_18895 ?auto_18903 ) ( CLEAR ?auto_18895 ) ( not ( = ?auto_18894 ?auto_18903 ) ) ( not ( = ?auto_18895 ?auto_18903 ) ) ( not ( = ?auto_18893 ?auto_18903 ) ) ( IS-CRATE ?auto_18894 ) ( AVAILABLE ?auto_18897 ) ( SURFACE-AT ?auto_18894 ?auto_18902 ) ( ON ?auto_18894 ?auto_18904 ) ( CLEAR ?auto_18894 ) ( not ( = ?auto_18894 ?auto_18904 ) ) ( not ( = ?auto_18895 ?auto_18904 ) ) ( not ( = ?auto_18893 ?auto_18904 ) ) ( not ( = ?auto_18903 ?auto_18904 ) ) ( IS-CRATE ?auto_18893 ) ( not ( = ?auto_18892 ?auto_18893 ) ) ( not ( = ?auto_18894 ?auto_18892 ) ) ( not ( = ?auto_18895 ?auto_18892 ) ) ( not ( = ?auto_18903 ?auto_18892 ) ) ( not ( = ?auto_18904 ?auto_18892 ) ) ( not ( = ?auto_18898 ?auto_18896 ) ) ( not ( = ?auto_18902 ?auto_18898 ) ) ( HOIST-AT ?auto_18899 ?auto_18898 ) ( not ( = ?auto_18900 ?auto_18899 ) ) ( not ( = ?auto_18897 ?auto_18899 ) ) ( AVAILABLE ?auto_18899 ) ( SURFACE-AT ?auto_18893 ?auto_18898 ) ( ON ?auto_18893 ?auto_18901 ) ( CLEAR ?auto_18893 ) ( not ( = ?auto_18894 ?auto_18901 ) ) ( not ( = ?auto_18895 ?auto_18901 ) ) ( not ( = ?auto_18893 ?auto_18901 ) ) ( not ( = ?auto_18903 ?auto_18901 ) ) ( not ( = ?auto_18904 ?auto_18901 ) ) ( not ( = ?auto_18892 ?auto_18901 ) ) ( SURFACE-AT ?auto_18891 ?auto_18896 ) ( CLEAR ?auto_18891 ) ( IS-CRATE ?auto_18892 ) ( not ( = ?auto_18891 ?auto_18892 ) ) ( not ( = ?auto_18894 ?auto_18891 ) ) ( not ( = ?auto_18895 ?auto_18891 ) ) ( not ( = ?auto_18893 ?auto_18891 ) ) ( not ( = ?auto_18903 ?auto_18891 ) ) ( not ( = ?auto_18904 ?auto_18891 ) ) ( not ( = ?auto_18901 ?auto_18891 ) ) ( AVAILABLE ?auto_18900 ) ( IN ?auto_18892 ?auto_18905 ) ( TRUCK-AT ?auto_18905 ?auto_18902 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18893 ?auto_18894 ?auto_18895 )
      ( MAKE-4CRATE-VERIFY ?auto_18891 ?auto_18892 ?auto_18893 ?auto_18894 ?auto_18895 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18906 - SURFACE
      ?auto_18907 - SURFACE
      ?auto_18908 - SURFACE
      ?auto_18909 - SURFACE
      ?auto_18910 - SURFACE
      ?auto_18911 - SURFACE
    )
    :vars
    (
      ?auto_18916 - HOIST
      ?auto_18912 - PLACE
      ?auto_18918 - PLACE
      ?auto_18913 - HOIST
      ?auto_18919 - SURFACE
      ?auto_18920 - SURFACE
      ?auto_18914 - PLACE
      ?auto_18915 - HOIST
      ?auto_18917 - SURFACE
      ?auto_18921 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18916 ?auto_18912 ) ( IS-CRATE ?auto_18911 ) ( not ( = ?auto_18910 ?auto_18911 ) ) ( not ( = ?auto_18909 ?auto_18910 ) ) ( not ( = ?auto_18909 ?auto_18911 ) ) ( not ( = ?auto_18918 ?auto_18912 ) ) ( HOIST-AT ?auto_18913 ?auto_18918 ) ( not ( = ?auto_18916 ?auto_18913 ) ) ( SURFACE-AT ?auto_18911 ?auto_18918 ) ( ON ?auto_18911 ?auto_18919 ) ( CLEAR ?auto_18911 ) ( not ( = ?auto_18910 ?auto_18919 ) ) ( not ( = ?auto_18911 ?auto_18919 ) ) ( not ( = ?auto_18909 ?auto_18919 ) ) ( IS-CRATE ?auto_18910 ) ( AVAILABLE ?auto_18913 ) ( SURFACE-AT ?auto_18910 ?auto_18918 ) ( ON ?auto_18910 ?auto_18920 ) ( CLEAR ?auto_18910 ) ( not ( = ?auto_18910 ?auto_18920 ) ) ( not ( = ?auto_18911 ?auto_18920 ) ) ( not ( = ?auto_18909 ?auto_18920 ) ) ( not ( = ?auto_18919 ?auto_18920 ) ) ( IS-CRATE ?auto_18909 ) ( not ( = ?auto_18908 ?auto_18909 ) ) ( not ( = ?auto_18910 ?auto_18908 ) ) ( not ( = ?auto_18911 ?auto_18908 ) ) ( not ( = ?auto_18919 ?auto_18908 ) ) ( not ( = ?auto_18920 ?auto_18908 ) ) ( not ( = ?auto_18914 ?auto_18912 ) ) ( not ( = ?auto_18918 ?auto_18914 ) ) ( HOIST-AT ?auto_18915 ?auto_18914 ) ( not ( = ?auto_18916 ?auto_18915 ) ) ( not ( = ?auto_18913 ?auto_18915 ) ) ( AVAILABLE ?auto_18915 ) ( SURFACE-AT ?auto_18909 ?auto_18914 ) ( ON ?auto_18909 ?auto_18917 ) ( CLEAR ?auto_18909 ) ( not ( = ?auto_18910 ?auto_18917 ) ) ( not ( = ?auto_18911 ?auto_18917 ) ) ( not ( = ?auto_18909 ?auto_18917 ) ) ( not ( = ?auto_18919 ?auto_18917 ) ) ( not ( = ?auto_18920 ?auto_18917 ) ) ( not ( = ?auto_18908 ?auto_18917 ) ) ( SURFACE-AT ?auto_18907 ?auto_18912 ) ( CLEAR ?auto_18907 ) ( IS-CRATE ?auto_18908 ) ( not ( = ?auto_18907 ?auto_18908 ) ) ( not ( = ?auto_18910 ?auto_18907 ) ) ( not ( = ?auto_18911 ?auto_18907 ) ) ( not ( = ?auto_18909 ?auto_18907 ) ) ( not ( = ?auto_18919 ?auto_18907 ) ) ( not ( = ?auto_18920 ?auto_18907 ) ) ( not ( = ?auto_18917 ?auto_18907 ) ) ( AVAILABLE ?auto_18916 ) ( IN ?auto_18908 ?auto_18921 ) ( TRUCK-AT ?auto_18921 ?auto_18918 ) ( ON ?auto_18907 ?auto_18906 ) ( not ( = ?auto_18906 ?auto_18907 ) ) ( not ( = ?auto_18906 ?auto_18908 ) ) ( not ( = ?auto_18906 ?auto_18909 ) ) ( not ( = ?auto_18906 ?auto_18910 ) ) ( not ( = ?auto_18906 ?auto_18911 ) ) ( not ( = ?auto_18906 ?auto_18919 ) ) ( not ( = ?auto_18906 ?auto_18920 ) ) ( not ( = ?auto_18906 ?auto_18917 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18909 ?auto_18910 ?auto_18911 )
      ( MAKE-5CRATE-VERIFY ?auto_18906 ?auto_18907 ?auto_18908 ?auto_18909 ?auto_18910 ?auto_18911 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18922 - SURFACE
      ?auto_18923 - SURFACE
    )
    :vars
    (
      ?auto_18929 - HOIST
      ?auto_18925 - PLACE
      ?auto_18936 - SURFACE
      ?auto_18931 - PLACE
      ?auto_18926 - HOIST
      ?auto_18932 - SURFACE
      ?auto_18933 - SURFACE
      ?auto_18935 - SURFACE
      ?auto_18927 - PLACE
      ?auto_18928 - HOIST
      ?auto_18930 - SURFACE
      ?auto_18924 - SURFACE
      ?auto_18934 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18929 ?auto_18925 ) ( IS-CRATE ?auto_18923 ) ( not ( = ?auto_18922 ?auto_18923 ) ) ( not ( = ?auto_18936 ?auto_18922 ) ) ( not ( = ?auto_18936 ?auto_18923 ) ) ( not ( = ?auto_18931 ?auto_18925 ) ) ( HOIST-AT ?auto_18926 ?auto_18931 ) ( not ( = ?auto_18929 ?auto_18926 ) ) ( SURFACE-AT ?auto_18923 ?auto_18931 ) ( ON ?auto_18923 ?auto_18932 ) ( CLEAR ?auto_18923 ) ( not ( = ?auto_18922 ?auto_18932 ) ) ( not ( = ?auto_18923 ?auto_18932 ) ) ( not ( = ?auto_18936 ?auto_18932 ) ) ( IS-CRATE ?auto_18922 ) ( SURFACE-AT ?auto_18922 ?auto_18931 ) ( ON ?auto_18922 ?auto_18933 ) ( CLEAR ?auto_18922 ) ( not ( = ?auto_18922 ?auto_18933 ) ) ( not ( = ?auto_18923 ?auto_18933 ) ) ( not ( = ?auto_18936 ?auto_18933 ) ) ( not ( = ?auto_18932 ?auto_18933 ) ) ( IS-CRATE ?auto_18936 ) ( not ( = ?auto_18935 ?auto_18936 ) ) ( not ( = ?auto_18922 ?auto_18935 ) ) ( not ( = ?auto_18923 ?auto_18935 ) ) ( not ( = ?auto_18932 ?auto_18935 ) ) ( not ( = ?auto_18933 ?auto_18935 ) ) ( not ( = ?auto_18927 ?auto_18925 ) ) ( not ( = ?auto_18931 ?auto_18927 ) ) ( HOIST-AT ?auto_18928 ?auto_18927 ) ( not ( = ?auto_18929 ?auto_18928 ) ) ( not ( = ?auto_18926 ?auto_18928 ) ) ( AVAILABLE ?auto_18928 ) ( SURFACE-AT ?auto_18936 ?auto_18927 ) ( ON ?auto_18936 ?auto_18930 ) ( CLEAR ?auto_18936 ) ( not ( = ?auto_18922 ?auto_18930 ) ) ( not ( = ?auto_18923 ?auto_18930 ) ) ( not ( = ?auto_18936 ?auto_18930 ) ) ( not ( = ?auto_18932 ?auto_18930 ) ) ( not ( = ?auto_18933 ?auto_18930 ) ) ( not ( = ?auto_18935 ?auto_18930 ) ) ( SURFACE-AT ?auto_18924 ?auto_18925 ) ( CLEAR ?auto_18924 ) ( IS-CRATE ?auto_18935 ) ( not ( = ?auto_18924 ?auto_18935 ) ) ( not ( = ?auto_18922 ?auto_18924 ) ) ( not ( = ?auto_18923 ?auto_18924 ) ) ( not ( = ?auto_18936 ?auto_18924 ) ) ( not ( = ?auto_18932 ?auto_18924 ) ) ( not ( = ?auto_18933 ?auto_18924 ) ) ( not ( = ?auto_18930 ?auto_18924 ) ) ( AVAILABLE ?auto_18929 ) ( TRUCK-AT ?auto_18934 ?auto_18931 ) ( LIFTING ?auto_18926 ?auto_18935 ) )
    :subtasks
    ( ( !LOAD ?auto_18926 ?auto_18935 ?auto_18934 ?auto_18931 )
      ( MAKE-2CRATE ?auto_18936 ?auto_18922 ?auto_18923 )
      ( MAKE-1CRATE-VERIFY ?auto_18922 ?auto_18923 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18937 - SURFACE
      ?auto_18938 - SURFACE
      ?auto_18939 - SURFACE
    )
    :vars
    (
      ?auto_18942 - HOIST
      ?auto_18950 - PLACE
      ?auto_18946 - PLACE
      ?auto_18944 - HOIST
      ?auto_18947 - SURFACE
      ?auto_18941 - SURFACE
      ?auto_18951 - SURFACE
      ?auto_18943 - PLACE
      ?auto_18949 - HOIST
      ?auto_18940 - SURFACE
      ?auto_18948 - SURFACE
      ?auto_18945 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18942 ?auto_18950 ) ( IS-CRATE ?auto_18939 ) ( not ( = ?auto_18938 ?auto_18939 ) ) ( not ( = ?auto_18937 ?auto_18938 ) ) ( not ( = ?auto_18937 ?auto_18939 ) ) ( not ( = ?auto_18946 ?auto_18950 ) ) ( HOIST-AT ?auto_18944 ?auto_18946 ) ( not ( = ?auto_18942 ?auto_18944 ) ) ( SURFACE-AT ?auto_18939 ?auto_18946 ) ( ON ?auto_18939 ?auto_18947 ) ( CLEAR ?auto_18939 ) ( not ( = ?auto_18938 ?auto_18947 ) ) ( not ( = ?auto_18939 ?auto_18947 ) ) ( not ( = ?auto_18937 ?auto_18947 ) ) ( IS-CRATE ?auto_18938 ) ( SURFACE-AT ?auto_18938 ?auto_18946 ) ( ON ?auto_18938 ?auto_18941 ) ( CLEAR ?auto_18938 ) ( not ( = ?auto_18938 ?auto_18941 ) ) ( not ( = ?auto_18939 ?auto_18941 ) ) ( not ( = ?auto_18937 ?auto_18941 ) ) ( not ( = ?auto_18947 ?auto_18941 ) ) ( IS-CRATE ?auto_18937 ) ( not ( = ?auto_18951 ?auto_18937 ) ) ( not ( = ?auto_18938 ?auto_18951 ) ) ( not ( = ?auto_18939 ?auto_18951 ) ) ( not ( = ?auto_18947 ?auto_18951 ) ) ( not ( = ?auto_18941 ?auto_18951 ) ) ( not ( = ?auto_18943 ?auto_18950 ) ) ( not ( = ?auto_18946 ?auto_18943 ) ) ( HOIST-AT ?auto_18949 ?auto_18943 ) ( not ( = ?auto_18942 ?auto_18949 ) ) ( not ( = ?auto_18944 ?auto_18949 ) ) ( AVAILABLE ?auto_18949 ) ( SURFACE-AT ?auto_18937 ?auto_18943 ) ( ON ?auto_18937 ?auto_18940 ) ( CLEAR ?auto_18937 ) ( not ( = ?auto_18938 ?auto_18940 ) ) ( not ( = ?auto_18939 ?auto_18940 ) ) ( not ( = ?auto_18937 ?auto_18940 ) ) ( not ( = ?auto_18947 ?auto_18940 ) ) ( not ( = ?auto_18941 ?auto_18940 ) ) ( not ( = ?auto_18951 ?auto_18940 ) ) ( SURFACE-AT ?auto_18948 ?auto_18950 ) ( CLEAR ?auto_18948 ) ( IS-CRATE ?auto_18951 ) ( not ( = ?auto_18948 ?auto_18951 ) ) ( not ( = ?auto_18938 ?auto_18948 ) ) ( not ( = ?auto_18939 ?auto_18948 ) ) ( not ( = ?auto_18937 ?auto_18948 ) ) ( not ( = ?auto_18947 ?auto_18948 ) ) ( not ( = ?auto_18941 ?auto_18948 ) ) ( not ( = ?auto_18940 ?auto_18948 ) ) ( AVAILABLE ?auto_18942 ) ( TRUCK-AT ?auto_18945 ?auto_18946 ) ( LIFTING ?auto_18944 ?auto_18951 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18938 ?auto_18939 )
      ( MAKE-2CRATE-VERIFY ?auto_18937 ?auto_18938 ?auto_18939 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18952 - SURFACE
      ?auto_18953 - SURFACE
      ?auto_18954 - SURFACE
      ?auto_18955 - SURFACE
    )
    :vars
    (
      ?auto_18965 - HOIST
      ?auto_18962 - PLACE
      ?auto_18961 - PLACE
      ?auto_18960 - HOIST
      ?auto_18963 - SURFACE
      ?auto_18956 - SURFACE
      ?auto_18966 - PLACE
      ?auto_18958 - HOIST
      ?auto_18959 - SURFACE
      ?auto_18957 - SURFACE
      ?auto_18964 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18965 ?auto_18962 ) ( IS-CRATE ?auto_18955 ) ( not ( = ?auto_18954 ?auto_18955 ) ) ( not ( = ?auto_18953 ?auto_18954 ) ) ( not ( = ?auto_18953 ?auto_18955 ) ) ( not ( = ?auto_18961 ?auto_18962 ) ) ( HOIST-AT ?auto_18960 ?auto_18961 ) ( not ( = ?auto_18965 ?auto_18960 ) ) ( SURFACE-AT ?auto_18955 ?auto_18961 ) ( ON ?auto_18955 ?auto_18963 ) ( CLEAR ?auto_18955 ) ( not ( = ?auto_18954 ?auto_18963 ) ) ( not ( = ?auto_18955 ?auto_18963 ) ) ( not ( = ?auto_18953 ?auto_18963 ) ) ( IS-CRATE ?auto_18954 ) ( SURFACE-AT ?auto_18954 ?auto_18961 ) ( ON ?auto_18954 ?auto_18956 ) ( CLEAR ?auto_18954 ) ( not ( = ?auto_18954 ?auto_18956 ) ) ( not ( = ?auto_18955 ?auto_18956 ) ) ( not ( = ?auto_18953 ?auto_18956 ) ) ( not ( = ?auto_18963 ?auto_18956 ) ) ( IS-CRATE ?auto_18953 ) ( not ( = ?auto_18952 ?auto_18953 ) ) ( not ( = ?auto_18954 ?auto_18952 ) ) ( not ( = ?auto_18955 ?auto_18952 ) ) ( not ( = ?auto_18963 ?auto_18952 ) ) ( not ( = ?auto_18956 ?auto_18952 ) ) ( not ( = ?auto_18966 ?auto_18962 ) ) ( not ( = ?auto_18961 ?auto_18966 ) ) ( HOIST-AT ?auto_18958 ?auto_18966 ) ( not ( = ?auto_18965 ?auto_18958 ) ) ( not ( = ?auto_18960 ?auto_18958 ) ) ( AVAILABLE ?auto_18958 ) ( SURFACE-AT ?auto_18953 ?auto_18966 ) ( ON ?auto_18953 ?auto_18959 ) ( CLEAR ?auto_18953 ) ( not ( = ?auto_18954 ?auto_18959 ) ) ( not ( = ?auto_18955 ?auto_18959 ) ) ( not ( = ?auto_18953 ?auto_18959 ) ) ( not ( = ?auto_18963 ?auto_18959 ) ) ( not ( = ?auto_18956 ?auto_18959 ) ) ( not ( = ?auto_18952 ?auto_18959 ) ) ( SURFACE-AT ?auto_18957 ?auto_18962 ) ( CLEAR ?auto_18957 ) ( IS-CRATE ?auto_18952 ) ( not ( = ?auto_18957 ?auto_18952 ) ) ( not ( = ?auto_18954 ?auto_18957 ) ) ( not ( = ?auto_18955 ?auto_18957 ) ) ( not ( = ?auto_18953 ?auto_18957 ) ) ( not ( = ?auto_18963 ?auto_18957 ) ) ( not ( = ?auto_18956 ?auto_18957 ) ) ( not ( = ?auto_18959 ?auto_18957 ) ) ( AVAILABLE ?auto_18965 ) ( TRUCK-AT ?auto_18964 ?auto_18961 ) ( LIFTING ?auto_18960 ?auto_18952 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18953 ?auto_18954 ?auto_18955 )
      ( MAKE-3CRATE-VERIFY ?auto_18952 ?auto_18953 ?auto_18954 ?auto_18955 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18967 - SURFACE
      ?auto_18968 - SURFACE
      ?auto_18969 - SURFACE
      ?auto_18970 - SURFACE
      ?auto_18971 - SURFACE
    )
    :vars
    (
      ?auto_18980 - HOIST
      ?auto_18977 - PLACE
      ?auto_18976 - PLACE
      ?auto_18975 - HOIST
      ?auto_18978 - SURFACE
      ?auto_18972 - SURFACE
      ?auto_18981 - PLACE
      ?auto_18973 - HOIST
      ?auto_18974 - SURFACE
      ?auto_18979 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18980 ?auto_18977 ) ( IS-CRATE ?auto_18971 ) ( not ( = ?auto_18970 ?auto_18971 ) ) ( not ( = ?auto_18969 ?auto_18970 ) ) ( not ( = ?auto_18969 ?auto_18971 ) ) ( not ( = ?auto_18976 ?auto_18977 ) ) ( HOIST-AT ?auto_18975 ?auto_18976 ) ( not ( = ?auto_18980 ?auto_18975 ) ) ( SURFACE-AT ?auto_18971 ?auto_18976 ) ( ON ?auto_18971 ?auto_18978 ) ( CLEAR ?auto_18971 ) ( not ( = ?auto_18970 ?auto_18978 ) ) ( not ( = ?auto_18971 ?auto_18978 ) ) ( not ( = ?auto_18969 ?auto_18978 ) ) ( IS-CRATE ?auto_18970 ) ( SURFACE-AT ?auto_18970 ?auto_18976 ) ( ON ?auto_18970 ?auto_18972 ) ( CLEAR ?auto_18970 ) ( not ( = ?auto_18970 ?auto_18972 ) ) ( not ( = ?auto_18971 ?auto_18972 ) ) ( not ( = ?auto_18969 ?auto_18972 ) ) ( not ( = ?auto_18978 ?auto_18972 ) ) ( IS-CRATE ?auto_18969 ) ( not ( = ?auto_18968 ?auto_18969 ) ) ( not ( = ?auto_18970 ?auto_18968 ) ) ( not ( = ?auto_18971 ?auto_18968 ) ) ( not ( = ?auto_18978 ?auto_18968 ) ) ( not ( = ?auto_18972 ?auto_18968 ) ) ( not ( = ?auto_18981 ?auto_18977 ) ) ( not ( = ?auto_18976 ?auto_18981 ) ) ( HOIST-AT ?auto_18973 ?auto_18981 ) ( not ( = ?auto_18980 ?auto_18973 ) ) ( not ( = ?auto_18975 ?auto_18973 ) ) ( AVAILABLE ?auto_18973 ) ( SURFACE-AT ?auto_18969 ?auto_18981 ) ( ON ?auto_18969 ?auto_18974 ) ( CLEAR ?auto_18969 ) ( not ( = ?auto_18970 ?auto_18974 ) ) ( not ( = ?auto_18971 ?auto_18974 ) ) ( not ( = ?auto_18969 ?auto_18974 ) ) ( not ( = ?auto_18978 ?auto_18974 ) ) ( not ( = ?auto_18972 ?auto_18974 ) ) ( not ( = ?auto_18968 ?auto_18974 ) ) ( SURFACE-AT ?auto_18967 ?auto_18977 ) ( CLEAR ?auto_18967 ) ( IS-CRATE ?auto_18968 ) ( not ( = ?auto_18967 ?auto_18968 ) ) ( not ( = ?auto_18970 ?auto_18967 ) ) ( not ( = ?auto_18971 ?auto_18967 ) ) ( not ( = ?auto_18969 ?auto_18967 ) ) ( not ( = ?auto_18978 ?auto_18967 ) ) ( not ( = ?auto_18972 ?auto_18967 ) ) ( not ( = ?auto_18974 ?auto_18967 ) ) ( AVAILABLE ?auto_18980 ) ( TRUCK-AT ?auto_18979 ?auto_18976 ) ( LIFTING ?auto_18975 ?auto_18968 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18969 ?auto_18970 ?auto_18971 )
      ( MAKE-4CRATE-VERIFY ?auto_18967 ?auto_18968 ?auto_18969 ?auto_18970 ?auto_18971 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18982 - SURFACE
      ?auto_18983 - SURFACE
      ?auto_18984 - SURFACE
      ?auto_18985 - SURFACE
      ?auto_18986 - SURFACE
      ?auto_18987 - SURFACE
    )
    :vars
    (
      ?auto_18996 - HOIST
      ?auto_18993 - PLACE
      ?auto_18992 - PLACE
      ?auto_18991 - HOIST
      ?auto_18994 - SURFACE
      ?auto_18988 - SURFACE
      ?auto_18997 - PLACE
      ?auto_18989 - HOIST
      ?auto_18990 - SURFACE
      ?auto_18995 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18996 ?auto_18993 ) ( IS-CRATE ?auto_18987 ) ( not ( = ?auto_18986 ?auto_18987 ) ) ( not ( = ?auto_18985 ?auto_18986 ) ) ( not ( = ?auto_18985 ?auto_18987 ) ) ( not ( = ?auto_18992 ?auto_18993 ) ) ( HOIST-AT ?auto_18991 ?auto_18992 ) ( not ( = ?auto_18996 ?auto_18991 ) ) ( SURFACE-AT ?auto_18987 ?auto_18992 ) ( ON ?auto_18987 ?auto_18994 ) ( CLEAR ?auto_18987 ) ( not ( = ?auto_18986 ?auto_18994 ) ) ( not ( = ?auto_18987 ?auto_18994 ) ) ( not ( = ?auto_18985 ?auto_18994 ) ) ( IS-CRATE ?auto_18986 ) ( SURFACE-AT ?auto_18986 ?auto_18992 ) ( ON ?auto_18986 ?auto_18988 ) ( CLEAR ?auto_18986 ) ( not ( = ?auto_18986 ?auto_18988 ) ) ( not ( = ?auto_18987 ?auto_18988 ) ) ( not ( = ?auto_18985 ?auto_18988 ) ) ( not ( = ?auto_18994 ?auto_18988 ) ) ( IS-CRATE ?auto_18985 ) ( not ( = ?auto_18984 ?auto_18985 ) ) ( not ( = ?auto_18986 ?auto_18984 ) ) ( not ( = ?auto_18987 ?auto_18984 ) ) ( not ( = ?auto_18994 ?auto_18984 ) ) ( not ( = ?auto_18988 ?auto_18984 ) ) ( not ( = ?auto_18997 ?auto_18993 ) ) ( not ( = ?auto_18992 ?auto_18997 ) ) ( HOIST-AT ?auto_18989 ?auto_18997 ) ( not ( = ?auto_18996 ?auto_18989 ) ) ( not ( = ?auto_18991 ?auto_18989 ) ) ( AVAILABLE ?auto_18989 ) ( SURFACE-AT ?auto_18985 ?auto_18997 ) ( ON ?auto_18985 ?auto_18990 ) ( CLEAR ?auto_18985 ) ( not ( = ?auto_18986 ?auto_18990 ) ) ( not ( = ?auto_18987 ?auto_18990 ) ) ( not ( = ?auto_18985 ?auto_18990 ) ) ( not ( = ?auto_18994 ?auto_18990 ) ) ( not ( = ?auto_18988 ?auto_18990 ) ) ( not ( = ?auto_18984 ?auto_18990 ) ) ( SURFACE-AT ?auto_18983 ?auto_18993 ) ( CLEAR ?auto_18983 ) ( IS-CRATE ?auto_18984 ) ( not ( = ?auto_18983 ?auto_18984 ) ) ( not ( = ?auto_18986 ?auto_18983 ) ) ( not ( = ?auto_18987 ?auto_18983 ) ) ( not ( = ?auto_18985 ?auto_18983 ) ) ( not ( = ?auto_18994 ?auto_18983 ) ) ( not ( = ?auto_18988 ?auto_18983 ) ) ( not ( = ?auto_18990 ?auto_18983 ) ) ( AVAILABLE ?auto_18996 ) ( TRUCK-AT ?auto_18995 ?auto_18992 ) ( LIFTING ?auto_18991 ?auto_18984 ) ( ON ?auto_18983 ?auto_18982 ) ( not ( = ?auto_18982 ?auto_18983 ) ) ( not ( = ?auto_18982 ?auto_18984 ) ) ( not ( = ?auto_18982 ?auto_18985 ) ) ( not ( = ?auto_18982 ?auto_18986 ) ) ( not ( = ?auto_18982 ?auto_18987 ) ) ( not ( = ?auto_18982 ?auto_18994 ) ) ( not ( = ?auto_18982 ?auto_18988 ) ) ( not ( = ?auto_18982 ?auto_18990 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18985 ?auto_18986 ?auto_18987 )
      ( MAKE-5CRATE-VERIFY ?auto_18982 ?auto_18983 ?auto_18984 ?auto_18985 ?auto_18986 ?auto_18987 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18998 - SURFACE
      ?auto_18999 - SURFACE
    )
    :vars
    (
      ?auto_19010 - HOIST
      ?auto_19006 - PLACE
      ?auto_19012 - SURFACE
      ?auto_19005 - PLACE
      ?auto_19004 - HOIST
      ?auto_19008 - SURFACE
      ?auto_19000 - SURFACE
      ?auto_19007 - SURFACE
      ?auto_19011 - PLACE
      ?auto_19002 - HOIST
      ?auto_19003 - SURFACE
      ?auto_19001 - SURFACE
      ?auto_19009 - TRUCK
      ?auto_19013 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19010 ?auto_19006 ) ( IS-CRATE ?auto_18999 ) ( not ( = ?auto_18998 ?auto_18999 ) ) ( not ( = ?auto_19012 ?auto_18998 ) ) ( not ( = ?auto_19012 ?auto_18999 ) ) ( not ( = ?auto_19005 ?auto_19006 ) ) ( HOIST-AT ?auto_19004 ?auto_19005 ) ( not ( = ?auto_19010 ?auto_19004 ) ) ( SURFACE-AT ?auto_18999 ?auto_19005 ) ( ON ?auto_18999 ?auto_19008 ) ( CLEAR ?auto_18999 ) ( not ( = ?auto_18998 ?auto_19008 ) ) ( not ( = ?auto_18999 ?auto_19008 ) ) ( not ( = ?auto_19012 ?auto_19008 ) ) ( IS-CRATE ?auto_18998 ) ( SURFACE-AT ?auto_18998 ?auto_19005 ) ( ON ?auto_18998 ?auto_19000 ) ( CLEAR ?auto_18998 ) ( not ( = ?auto_18998 ?auto_19000 ) ) ( not ( = ?auto_18999 ?auto_19000 ) ) ( not ( = ?auto_19012 ?auto_19000 ) ) ( not ( = ?auto_19008 ?auto_19000 ) ) ( IS-CRATE ?auto_19012 ) ( not ( = ?auto_19007 ?auto_19012 ) ) ( not ( = ?auto_18998 ?auto_19007 ) ) ( not ( = ?auto_18999 ?auto_19007 ) ) ( not ( = ?auto_19008 ?auto_19007 ) ) ( not ( = ?auto_19000 ?auto_19007 ) ) ( not ( = ?auto_19011 ?auto_19006 ) ) ( not ( = ?auto_19005 ?auto_19011 ) ) ( HOIST-AT ?auto_19002 ?auto_19011 ) ( not ( = ?auto_19010 ?auto_19002 ) ) ( not ( = ?auto_19004 ?auto_19002 ) ) ( AVAILABLE ?auto_19002 ) ( SURFACE-AT ?auto_19012 ?auto_19011 ) ( ON ?auto_19012 ?auto_19003 ) ( CLEAR ?auto_19012 ) ( not ( = ?auto_18998 ?auto_19003 ) ) ( not ( = ?auto_18999 ?auto_19003 ) ) ( not ( = ?auto_19012 ?auto_19003 ) ) ( not ( = ?auto_19008 ?auto_19003 ) ) ( not ( = ?auto_19000 ?auto_19003 ) ) ( not ( = ?auto_19007 ?auto_19003 ) ) ( SURFACE-AT ?auto_19001 ?auto_19006 ) ( CLEAR ?auto_19001 ) ( IS-CRATE ?auto_19007 ) ( not ( = ?auto_19001 ?auto_19007 ) ) ( not ( = ?auto_18998 ?auto_19001 ) ) ( not ( = ?auto_18999 ?auto_19001 ) ) ( not ( = ?auto_19012 ?auto_19001 ) ) ( not ( = ?auto_19008 ?auto_19001 ) ) ( not ( = ?auto_19000 ?auto_19001 ) ) ( not ( = ?auto_19003 ?auto_19001 ) ) ( AVAILABLE ?auto_19010 ) ( TRUCK-AT ?auto_19009 ?auto_19005 ) ( AVAILABLE ?auto_19004 ) ( SURFACE-AT ?auto_19007 ?auto_19005 ) ( ON ?auto_19007 ?auto_19013 ) ( CLEAR ?auto_19007 ) ( not ( = ?auto_18998 ?auto_19013 ) ) ( not ( = ?auto_18999 ?auto_19013 ) ) ( not ( = ?auto_19012 ?auto_19013 ) ) ( not ( = ?auto_19008 ?auto_19013 ) ) ( not ( = ?auto_19000 ?auto_19013 ) ) ( not ( = ?auto_19007 ?auto_19013 ) ) ( not ( = ?auto_19003 ?auto_19013 ) ) ( not ( = ?auto_19001 ?auto_19013 ) ) )
    :subtasks
    ( ( !LIFT ?auto_19004 ?auto_19007 ?auto_19013 ?auto_19005 )
      ( MAKE-2CRATE ?auto_19012 ?auto_18998 ?auto_18999 )
      ( MAKE-1CRATE-VERIFY ?auto_18998 ?auto_18999 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19014 - SURFACE
      ?auto_19015 - SURFACE
      ?auto_19016 - SURFACE
    )
    :vars
    (
      ?auto_19023 - HOIST
      ?auto_19027 - PLACE
      ?auto_19020 - PLACE
      ?auto_19026 - HOIST
      ?auto_19029 - SURFACE
      ?auto_19021 - SURFACE
      ?auto_19024 - SURFACE
      ?auto_19018 - PLACE
      ?auto_19025 - HOIST
      ?auto_19017 - SURFACE
      ?auto_19022 - SURFACE
      ?auto_19019 - TRUCK
      ?auto_19028 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19023 ?auto_19027 ) ( IS-CRATE ?auto_19016 ) ( not ( = ?auto_19015 ?auto_19016 ) ) ( not ( = ?auto_19014 ?auto_19015 ) ) ( not ( = ?auto_19014 ?auto_19016 ) ) ( not ( = ?auto_19020 ?auto_19027 ) ) ( HOIST-AT ?auto_19026 ?auto_19020 ) ( not ( = ?auto_19023 ?auto_19026 ) ) ( SURFACE-AT ?auto_19016 ?auto_19020 ) ( ON ?auto_19016 ?auto_19029 ) ( CLEAR ?auto_19016 ) ( not ( = ?auto_19015 ?auto_19029 ) ) ( not ( = ?auto_19016 ?auto_19029 ) ) ( not ( = ?auto_19014 ?auto_19029 ) ) ( IS-CRATE ?auto_19015 ) ( SURFACE-AT ?auto_19015 ?auto_19020 ) ( ON ?auto_19015 ?auto_19021 ) ( CLEAR ?auto_19015 ) ( not ( = ?auto_19015 ?auto_19021 ) ) ( not ( = ?auto_19016 ?auto_19021 ) ) ( not ( = ?auto_19014 ?auto_19021 ) ) ( not ( = ?auto_19029 ?auto_19021 ) ) ( IS-CRATE ?auto_19014 ) ( not ( = ?auto_19024 ?auto_19014 ) ) ( not ( = ?auto_19015 ?auto_19024 ) ) ( not ( = ?auto_19016 ?auto_19024 ) ) ( not ( = ?auto_19029 ?auto_19024 ) ) ( not ( = ?auto_19021 ?auto_19024 ) ) ( not ( = ?auto_19018 ?auto_19027 ) ) ( not ( = ?auto_19020 ?auto_19018 ) ) ( HOIST-AT ?auto_19025 ?auto_19018 ) ( not ( = ?auto_19023 ?auto_19025 ) ) ( not ( = ?auto_19026 ?auto_19025 ) ) ( AVAILABLE ?auto_19025 ) ( SURFACE-AT ?auto_19014 ?auto_19018 ) ( ON ?auto_19014 ?auto_19017 ) ( CLEAR ?auto_19014 ) ( not ( = ?auto_19015 ?auto_19017 ) ) ( not ( = ?auto_19016 ?auto_19017 ) ) ( not ( = ?auto_19014 ?auto_19017 ) ) ( not ( = ?auto_19029 ?auto_19017 ) ) ( not ( = ?auto_19021 ?auto_19017 ) ) ( not ( = ?auto_19024 ?auto_19017 ) ) ( SURFACE-AT ?auto_19022 ?auto_19027 ) ( CLEAR ?auto_19022 ) ( IS-CRATE ?auto_19024 ) ( not ( = ?auto_19022 ?auto_19024 ) ) ( not ( = ?auto_19015 ?auto_19022 ) ) ( not ( = ?auto_19016 ?auto_19022 ) ) ( not ( = ?auto_19014 ?auto_19022 ) ) ( not ( = ?auto_19029 ?auto_19022 ) ) ( not ( = ?auto_19021 ?auto_19022 ) ) ( not ( = ?auto_19017 ?auto_19022 ) ) ( AVAILABLE ?auto_19023 ) ( TRUCK-AT ?auto_19019 ?auto_19020 ) ( AVAILABLE ?auto_19026 ) ( SURFACE-AT ?auto_19024 ?auto_19020 ) ( ON ?auto_19024 ?auto_19028 ) ( CLEAR ?auto_19024 ) ( not ( = ?auto_19015 ?auto_19028 ) ) ( not ( = ?auto_19016 ?auto_19028 ) ) ( not ( = ?auto_19014 ?auto_19028 ) ) ( not ( = ?auto_19029 ?auto_19028 ) ) ( not ( = ?auto_19021 ?auto_19028 ) ) ( not ( = ?auto_19024 ?auto_19028 ) ) ( not ( = ?auto_19017 ?auto_19028 ) ) ( not ( = ?auto_19022 ?auto_19028 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19015 ?auto_19016 )
      ( MAKE-2CRATE-VERIFY ?auto_19014 ?auto_19015 ?auto_19016 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19030 - SURFACE
      ?auto_19031 - SURFACE
      ?auto_19032 - SURFACE
      ?auto_19033 - SURFACE
    )
    :vars
    (
      ?auto_19034 - HOIST
      ?auto_19044 - PLACE
      ?auto_19035 - PLACE
      ?auto_19039 - HOIST
      ?auto_19041 - SURFACE
      ?auto_19040 - SURFACE
      ?auto_19045 - PLACE
      ?auto_19037 - HOIST
      ?auto_19042 - SURFACE
      ?auto_19036 - SURFACE
      ?auto_19038 - TRUCK
      ?auto_19043 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19034 ?auto_19044 ) ( IS-CRATE ?auto_19033 ) ( not ( = ?auto_19032 ?auto_19033 ) ) ( not ( = ?auto_19031 ?auto_19032 ) ) ( not ( = ?auto_19031 ?auto_19033 ) ) ( not ( = ?auto_19035 ?auto_19044 ) ) ( HOIST-AT ?auto_19039 ?auto_19035 ) ( not ( = ?auto_19034 ?auto_19039 ) ) ( SURFACE-AT ?auto_19033 ?auto_19035 ) ( ON ?auto_19033 ?auto_19041 ) ( CLEAR ?auto_19033 ) ( not ( = ?auto_19032 ?auto_19041 ) ) ( not ( = ?auto_19033 ?auto_19041 ) ) ( not ( = ?auto_19031 ?auto_19041 ) ) ( IS-CRATE ?auto_19032 ) ( SURFACE-AT ?auto_19032 ?auto_19035 ) ( ON ?auto_19032 ?auto_19040 ) ( CLEAR ?auto_19032 ) ( not ( = ?auto_19032 ?auto_19040 ) ) ( not ( = ?auto_19033 ?auto_19040 ) ) ( not ( = ?auto_19031 ?auto_19040 ) ) ( not ( = ?auto_19041 ?auto_19040 ) ) ( IS-CRATE ?auto_19031 ) ( not ( = ?auto_19030 ?auto_19031 ) ) ( not ( = ?auto_19032 ?auto_19030 ) ) ( not ( = ?auto_19033 ?auto_19030 ) ) ( not ( = ?auto_19041 ?auto_19030 ) ) ( not ( = ?auto_19040 ?auto_19030 ) ) ( not ( = ?auto_19045 ?auto_19044 ) ) ( not ( = ?auto_19035 ?auto_19045 ) ) ( HOIST-AT ?auto_19037 ?auto_19045 ) ( not ( = ?auto_19034 ?auto_19037 ) ) ( not ( = ?auto_19039 ?auto_19037 ) ) ( AVAILABLE ?auto_19037 ) ( SURFACE-AT ?auto_19031 ?auto_19045 ) ( ON ?auto_19031 ?auto_19042 ) ( CLEAR ?auto_19031 ) ( not ( = ?auto_19032 ?auto_19042 ) ) ( not ( = ?auto_19033 ?auto_19042 ) ) ( not ( = ?auto_19031 ?auto_19042 ) ) ( not ( = ?auto_19041 ?auto_19042 ) ) ( not ( = ?auto_19040 ?auto_19042 ) ) ( not ( = ?auto_19030 ?auto_19042 ) ) ( SURFACE-AT ?auto_19036 ?auto_19044 ) ( CLEAR ?auto_19036 ) ( IS-CRATE ?auto_19030 ) ( not ( = ?auto_19036 ?auto_19030 ) ) ( not ( = ?auto_19032 ?auto_19036 ) ) ( not ( = ?auto_19033 ?auto_19036 ) ) ( not ( = ?auto_19031 ?auto_19036 ) ) ( not ( = ?auto_19041 ?auto_19036 ) ) ( not ( = ?auto_19040 ?auto_19036 ) ) ( not ( = ?auto_19042 ?auto_19036 ) ) ( AVAILABLE ?auto_19034 ) ( TRUCK-AT ?auto_19038 ?auto_19035 ) ( AVAILABLE ?auto_19039 ) ( SURFACE-AT ?auto_19030 ?auto_19035 ) ( ON ?auto_19030 ?auto_19043 ) ( CLEAR ?auto_19030 ) ( not ( = ?auto_19032 ?auto_19043 ) ) ( not ( = ?auto_19033 ?auto_19043 ) ) ( not ( = ?auto_19031 ?auto_19043 ) ) ( not ( = ?auto_19041 ?auto_19043 ) ) ( not ( = ?auto_19040 ?auto_19043 ) ) ( not ( = ?auto_19030 ?auto_19043 ) ) ( not ( = ?auto_19042 ?auto_19043 ) ) ( not ( = ?auto_19036 ?auto_19043 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19031 ?auto_19032 ?auto_19033 )
      ( MAKE-3CRATE-VERIFY ?auto_19030 ?auto_19031 ?auto_19032 ?auto_19033 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19046 - SURFACE
      ?auto_19047 - SURFACE
      ?auto_19048 - SURFACE
      ?auto_19049 - SURFACE
      ?auto_19050 - SURFACE
    )
    :vars
    (
      ?auto_19051 - HOIST
      ?auto_19060 - PLACE
      ?auto_19052 - PLACE
      ?auto_19055 - HOIST
      ?auto_19057 - SURFACE
      ?auto_19056 - SURFACE
      ?auto_19061 - PLACE
      ?auto_19053 - HOIST
      ?auto_19058 - SURFACE
      ?auto_19054 - TRUCK
      ?auto_19059 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19051 ?auto_19060 ) ( IS-CRATE ?auto_19050 ) ( not ( = ?auto_19049 ?auto_19050 ) ) ( not ( = ?auto_19048 ?auto_19049 ) ) ( not ( = ?auto_19048 ?auto_19050 ) ) ( not ( = ?auto_19052 ?auto_19060 ) ) ( HOIST-AT ?auto_19055 ?auto_19052 ) ( not ( = ?auto_19051 ?auto_19055 ) ) ( SURFACE-AT ?auto_19050 ?auto_19052 ) ( ON ?auto_19050 ?auto_19057 ) ( CLEAR ?auto_19050 ) ( not ( = ?auto_19049 ?auto_19057 ) ) ( not ( = ?auto_19050 ?auto_19057 ) ) ( not ( = ?auto_19048 ?auto_19057 ) ) ( IS-CRATE ?auto_19049 ) ( SURFACE-AT ?auto_19049 ?auto_19052 ) ( ON ?auto_19049 ?auto_19056 ) ( CLEAR ?auto_19049 ) ( not ( = ?auto_19049 ?auto_19056 ) ) ( not ( = ?auto_19050 ?auto_19056 ) ) ( not ( = ?auto_19048 ?auto_19056 ) ) ( not ( = ?auto_19057 ?auto_19056 ) ) ( IS-CRATE ?auto_19048 ) ( not ( = ?auto_19047 ?auto_19048 ) ) ( not ( = ?auto_19049 ?auto_19047 ) ) ( not ( = ?auto_19050 ?auto_19047 ) ) ( not ( = ?auto_19057 ?auto_19047 ) ) ( not ( = ?auto_19056 ?auto_19047 ) ) ( not ( = ?auto_19061 ?auto_19060 ) ) ( not ( = ?auto_19052 ?auto_19061 ) ) ( HOIST-AT ?auto_19053 ?auto_19061 ) ( not ( = ?auto_19051 ?auto_19053 ) ) ( not ( = ?auto_19055 ?auto_19053 ) ) ( AVAILABLE ?auto_19053 ) ( SURFACE-AT ?auto_19048 ?auto_19061 ) ( ON ?auto_19048 ?auto_19058 ) ( CLEAR ?auto_19048 ) ( not ( = ?auto_19049 ?auto_19058 ) ) ( not ( = ?auto_19050 ?auto_19058 ) ) ( not ( = ?auto_19048 ?auto_19058 ) ) ( not ( = ?auto_19057 ?auto_19058 ) ) ( not ( = ?auto_19056 ?auto_19058 ) ) ( not ( = ?auto_19047 ?auto_19058 ) ) ( SURFACE-AT ?auto_19046 ?auto_19060 ) ( CLEAR ?auto_19046 ) ( IS-CRATE ?auto_19047 ) ( not ( = ?auto_19046 ?auto_19047 ) ) ( not ( = ?auto_19049 ?auto_19046 ) ) ( not ( = ?auto_19050 ?auto_19046 ) ) ( not ( = ?auto_19048 ?auto_19046 ) ) ( not ( = ?auto_19057 ?auto_19046 ) ) ( not ( = ?auto_19056 ?auto_19046 ) ) ( not ( = ?auto_19058 ?auto_19046 ) ) ( AVAILABLE ?auto_19051 ) ( TRUCK-AT ?auto_19054 ?auto_19052 ) ( AVAILABLE ?auto_19055 ) ( SURFACE-AT ?auto_19047 ?auto_19052 ) ( ON ?auto_19047 ?auto_19059 ) ( CLEAR ?auto_19047 ) ( not ( = ?auto_19049 ?auto_19059 ) ) ( not ( = ?auto_19050 ?auto_19059 ) ) ( not ( = ?auto_19048 ?auto_19059 ) ) ( not ( = ?auto_19057 ?auto_19059 ) ) ( not ( = ?auto_19056 ?auto_19059 ) ) ( not ( = ?auto_19047 ?auto_19059 ) ) ( not ( = ?auto_19058 ?auto_19059 ) ) ( not ( = ?auto_19046 ?auto_19059 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19048 ?auto_19049 ?auto_19050 )
      ( MAKE-4CRATE-VERIFY ?auto_19046 ?auto_19047 ?auto_19048 ?auto_19049 ?auto_19050 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19062 - SURFACE
      ?auto_19063 - SURFACE
      ?auto_19064 - SURFACE
      ?auto_19065 - SURFACE
      ?auto_19066 - SURFACE
      ?auto_19067 - SURFACE
    )
    :vars
    (
      ?auto_19068 - HOIST
      ?auto_19077 - PLACE
      ?auto_19069 - PLACE
      ?auto_19072 - HOIST
      ?auto_19074 - SURFACE
      ?auto_19073 - SURFACE
      ?auto_19078 - PLACE
      ?auto_19070 - HOIST
      ?auto_19075 - SURFACE
      ?auto_19071 - TRUCK
      ?auto_19076 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19068 ?auto_19077 ) ( IS-CRATE ?auto_19067 ) ( not ( = ?auto_19066 ?auto_19067 ) ) ( not ( = ?auto_19065 ?auto_19066 ) ) ( not ( = ?auto_19065 ?auto_19067 ) ) ( not ( = ?auto_19069 ?auto_19077 ) ) ( HOIST-AT ?auto_19072 ?auto_19069 ) ( not ( = ?auto_19068 ?auto_19072 ) ) ( SURFACE-AT ?auto_19067 ?auto_19069 ) ( ON ?auto_19067 ?auto_19074 ) ( CLEAR ?auto_19067 ) ( not ( = ?auto_19066 ?auto_19074 ) ) ( not ( = ?auto_19067 ?auto_19074 ) ) ( not ( = ?auto_19065 ?auto_19074 ) ) ( IS-CRATE ?auto_19066 ) ( SURFACE-AT ?auto_19066 ?auto_19069 ) ( ON ?auto_19066 ?auto_19073 ) ( CLEAR ?auto_19066 ) ( not ( = ?auto_19066 ?auto_19073 ) ) ( not ( = ?auto_19067 ?auto_19073 ) ) ( not ( = ?auto_19065 ?auto_19073 ) ) ( not ( = ?auto_19074 ?auto_19073 ) ) ( IS-CRATE ?auto_19065 ) ( not ( = ?auto_19064 ?auto_19065 ) ) ( not ( = ?auto_19066 ?auto_19064 ) ) ( not ( = ?auto_19067 ?auto_19064 ) ) ( not ( = ?auto_19074 ?auto_19064 ) ) ( not ( = ?auto_19073 ?auto_19064 ) ) ( not ( = ?auto_19078 ?auto_19077 ) ) ( not ( = ?auto_19069 ?auto_19078 ) ) ( HOIST-AT ?auto_19070 ?auto_19078 ) ( not ( = ?auto_19068 ?auto_19070 ) ) ( not ( = ?auto_19072 ?auto_19070 ) ) ( AVAILABLE ?auto_19070 ) ( SURFACE-AT ?auto_19065 ?auto_19078 ) ( ON ?auto_19065 ?auto_19075 ) ( CLEAR ?auto_19065 ) ( not ( = ?auto_19066 ?auto_19075 ) ) ( not ( = ?auto_19067 ?auto_19075 ) ) ( not ( = ?auto_19065 ?auto_19075 ) ) ( not ( = ?auto_19074 ?auto_19075 ) ) ( not ( = ?auto_19073 ?auto_19075 ) ) ( not ( = ?auto_19064 ?auto_19075 ) ) ( SURFACE-AT ?auto_19063 ?auto_19077 ) ( CLEAR ?auto_19063 ) ( IS-CRATE ?auto_19064 ) ( not ( = ?auto_19063 ?auto_19064 ) ) ( not ( = ?auto_19066 ?auto_19063 ) ) ( not ( = ?auto_19067 ?auto_19063 ) ) ( not ( = ?auto_19065 ?auto_19063 ) ) ( not ( = ?auto_19074 ?auto_19063 ) ) ( not ( = ?auto_19073 ?auto_19063 ) ) ( not ( = ?auto_19075 ?auto_19063 ) ) ( AVAILABLE ?auto_19068 ) ( TRUCK-AT ?auto_19071 ?auto_19069 ) ( AVAILABLE ?auto_19072 ) ( SURFACE-AT ?auto_19064 ?auto_19069 ) ( ON ?auto_19064 ?auto_19076 ) ( CLEAR ?auto_19064 ) ( not ( = ?auto_19066 ?auto_19076 ) ) ( not ( = ?auto_19067 ?auto_19076 ) ) ( not ( = ?auto_19065 ?auto_19076 ) ) ( not ( = ?auto_19074 ?auto_19076 ) ) ( not ( = ?auto_19073 ?auto_19076 ) ) ( not ( = ?auto_19064 ?auto_19076 ) ) ( not ( = ?auto_19075 ?auto_19076 ) ) ( not ( = ?auto_19063 ?auto_19076 ) ) ( ON ?auto_19063 ?auto_19062 ) ( not ( = ?auto_19062 ?auto_19063 ) ) ( not ( = ?auto_19062 ?auto_19064 ) ) ( not ( = ?auto_19062 ?auto_19065 ) ) ( not ( = ?auto_19062 ?auto_19066 ) ) ( not ( = ?auto_19062 ?auto_19067 ) ) ( not ( = ?auto_19062 ?auto_19074 ) ) ( not ( = ?auto_19062 ?auto_19073 ) ) ( not ( = ?auto_19062 ?auto_19075 ) ) ( not ( = ?auto_19062 ?auto_19076 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19065 ?auto_19066 ?auto_19067 )
      ( MAKE-5CRATE-VERIFY ?auto_19062 ?auto_19063 ?auto_19064 ?auto_19065 ?auto_19066 ?auto_19067 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19079 - SURFACE
      ?auto_19080 - SURFACE
    )
    :vars
    (
      ?auto_19081 - HOIST
      ?auto_19092 - PLACE
      ?auto_19094 - SURFACE
      ?auto_19082 - PLACE
      ?auto_19087 - HOIST
      ?auto_19089 - SURFACE
      ?auto_19088 - SURFACE
      ?auto_19083 - SURFACE
      ?auto_19093 - PLACE
      ?auto_19085 - HOIST
      ?auto_19090 - SURFACE
      ?auto_19084 - SURFACE
      ?auto_19091 - SURFACE
      ?auto_19086 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19081 ?auto_19092 ) ( IS-CRATE ?auto_19080 ) ( not ( = ?auto_19079 ?auto_19080 ) ) ( not ( = ?auto_19094 ?auto_19079 ) ) ( not ( = ?auto_19094 ?auto_19080 ) ) ( not ( = ?auto_19082 ?auto_19092 ) ) ( HOIST-AT ?auto_19087 ?auto_19082 ) ( not ( = ?auto_19081 ?auto_19087 ) ) ( SURFACE-AT ?auto_19080 ?auto_19082 ) ( ON ?auto_19080 ?auto_19089 ) ( CLEAR ?auto_19080 ) ( not ( = ?auto_19079 ?auto_19089 ) ) ( not ( = ?auto_19080 ?auto_19089 ) ) ( not ( = ?auto_19094 ?auto_19089 ) ) ( IS-CRATE ?auto_19079 ) ( SURFACE-AT ?auto_19079 ?auto_19082 ) ( ON ?auto_19079 ?auto_19088 ) ( CLEAR ?auto_19079 ) ( not ( = ?auto_19079 ?auto_19088 ) ) ( not ( = ?auto_19080 ?auto_19088 ) ) ( not ( = ?auto_19094 ?auto_19088 ) ) ( not ( = ?auto_19089 ?auto_19088 ) ) ( IS-CRATE ?auto_19094 ) ( not ( = ?auto_19083 ?auto_19094 ) ) ( not ( = ?auto_19079 ?auto_19083 ) ) ( not ( = ?auto_19080 ?auto_19083 ) ) ( not ( = ?auto_19089 ?auto_19083 ) ) ( not ( = ?auto_19088 ?auto_19083 ) ) ( not ( = ?auto_19093 ?auto_19092 ) ) ( not ( = ?auto_19082 ?auto_19093 ) ) ( HOIST-AT ?auto_19085 ?auto_19093 ) ( not ( = ?auto_19081 ?auto_19085 ) ) ( not ( = ?auto_19087 ?auto_19085 ) ) ( AVAILABLE ?auto_19085 ) ( SURFACE-AT ?auto_19094 ?auto_19093 ) ( ON ?auto_19094 ?auto_19090 ) ( CLEAR ?auto_19094 ) ( not ( = ?auto_19079 ?auto_19090 ) ) ( not ( = ?auto_19080 ?auto_19090 ) ) ( not ( = ?auto_19094 ?auto_19090 ) ) ( not ( = ?auto_19089 ?auto_19090 ) ) ( not ( = ?auto_19088 ?auto_19090 ) ) ( not ( = ?auto_19083 ?auto_19090 ) ) ( SURFACE-AT ?auto_19084 ?auto_19092 ) ( CLEAR ?auto_19084 ) ( IS-CRATE ?auto_19083 ) ( not ( = ?auto_19084 ?auto_19083 ) ) ( not ( = ?auto_19079 ?auto_19084 ) ) ( not ( = ?auto_19080 ?auto_19084 ) ) ( not ( = ?auto_19094 ?auto_19084 ) ) ( not ( = ?auto_19089 ?auto_19084 ) ) ( not ( = ?auto_19088 ?auto_19084 ) ) ( not ( = ?auto_19090 ?auto_19084 ) ) ( AVAILABLE ?auto_19081 ) ( AVAILABLE ?auto_19087 ) ( SURFACE-AT ?auto_19083 ?auto_19082 ) ( ON ?auto_19083 ?auto_19091 ) ( CLEAR ?auto_19083 ) ( not ( = ?auto_19079 ?auto_19091 ) ) ( not ( = ?auto_19080 ?auto_19091 ) ) ( not ( = ?auto_19094 ?auto_19091 ) ) ( not ( = ?auto_19089 ?auto_19091 ) ) ( not ( = ?auto_19088 ?auto_19091 ) ) ( not ( = ?auto_19083 ?auto_19091 ) ) ( not ( = ?auto_19090 ?auto_19091 ) ) ( not ( = ?auto_19084 ?auto_19091 ) ) ( TRUCK-AT ?auto_19086 ?auto_19092 ) )
    :subtasks
    ( ( !DRIVE ?auto_19086 ?auto_19092 ?auto_19082 )
      ( MAKE-2CRATE ?auto_19094 ?auto_19079 ?auto_19080 )
      ( MAKE-1CRATE-VERIFY ?auto_19079 ?auto_19080 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19095 - SURFACE
      ?auto_19096 - SURFACE
      ?auto_19097 - SURFACE
    )
    :vars
    (
      ?auto_19101 - HOIST
      ?auto_19106 - PLACE
      ?auto_19100 - PLACE
      ?auto_19098 - HOIST
      ?auto_19102 - SURFACE
      ?auto_19105 - SURFACE
      ?auto_19107 - SURFACE
      ?auto_19099 - PLACE
      ?auto_19103 - HOIST
      ?auto_19104 - SURFACE
      ?auto_19108 - SURFACE
      ?auto_19109 - SURFACE
      ?auto_19110 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19101 ?auto_19106 ) ( IS-CRATE ?auto_19097 ) ( not ( = ?auto_19096 ?auto_19097 ) ) ( not ( = ?auto_19095 ?auto_19096 ) ) ( not ( = ?auto_19095 ?auto_19097 ) ) ( not ( = ?auto_19100 ?auto_19106 ) ) ( HOIST-AT ?auto_19098 ?auto_19100 ) ( not ( = ?auto_19101 ?auto_19098 ) ) ( SURFACE-AT ?auto_19097 ?auto_19100 ) ( ON ?auto_19097 ?auto_19102 ) ( CLEAR ?auto_19097 ) ( not ( = ?auto_19096 ?auto_19102 ) ) ( not ( = ?auto_19097 ?auto_19102 ) ) ( not ( = ?auto_19095 ?auto_19102 ) ) ( IS-CRATE ?auto_19096 ) ( SURFACE-AT ?auto_19096 ?auto_19100 ) ( ON ?auto_19096 ?auto_19105 ) ( CLEAR ?auto_19096 ) ( not ( = ?auto_19096 ?auto_19105 ) ) ( not ( = ?auto_19097 ?auto_19105 ) ) ( not ( = ?auto_19095 ?auto_19105 ) ) ( not ( = ?auto_19102 ?auto_19105 ) ) ( IS-CRATE ?auto_19095 ) ( not ( = ?auto_19107 ?auto_19095 ) ) ( not ( = ?auto_19096 ?auto_19107 ) ) ( not ( = ?auto_19097 ?auto_19107 ) ) ( not ( = ?auto_19102 ?auto_19107 ) ) ( not ( = ?auto_19105 ?auto_19107 ) ) ( not ( = ?auto_19099 ?auto_19106 ) ) ( not ( = ?auto_19100 ?auto_19099 ) ) ( HOIST-AT ?auto_19103 ?auto_19099 ) ( not ( = ?auto_19101 ?auto_19103 ) ) ( not ( = ?auto_19098 ?auto_19103 ) ) ( AVAILABLE ?auto_19103 ) ( SURFACE-AT ?auto_19095 ?auto_19099 ) ( ON ?auto_19095 ?auto_19104 ) ( CLEAR ?auto_19095 ) ( not ( = ?auto_19096 ?auto_19104 ) ) ( not ( = ?auto_19097 ?auto_19104 ) ) ( not ( = ?auto_19095 ?auto_19104 ) ) ( not ( = ?auto_19102 ?auto_19104 ) ) ( not ( = ?auto_19105 ?auto_19104 ) ) ( not ( = ?auto_19107 ?auto_19104 ) ) ( SURFACE-AT ?auto_19108 ?auto_19106 ) ( CLEAR ?auto_19108 ) ( IS-CRATE ?auto_19107 ) ( not ( = ?auto_19108 ?auto_19107 ) ) ( not ( = ?auto_19096 ?auto_19108 ) ) ( not ( = ?auto_19097 ?auto_19108 ) ) ( not ( = ?auto_19095 ?auto_19108 ) ) ( not ( = ?auto_19102 ?auto_19108 ) ) ( not ( = ?auto_19105 ?auto_19108 ) ) ( not ( = ?auto_19104 ?auto_19108 ) ) ( AVAILABLE ?auto_19101 ) ( AVAILABLE ?auto_19098 ) ( SURFACE-AT ?auto_19107 ?auto_19100 ) ( ON ?auto_19107 ?auto_19109 ) ( CLEAR ?auto_19107 ) ( not ( = ?auto_19096 ?auto_19109 ) ) ( not ( = ?auto_19097 ?auto_19109 ) ) ( not ( = ?auto_19095 ?auto_19109 ) ) ( not ( = ?auto_19102 ?auto_19109 ) ) ( not ( = ?auto_19105 ?auto_19109 ) ) ( not ( = ?auto_19107 ?auto_19109 ) ) ( not ( = ?auto_19104 ?auto_19109 ) ) ( not ( = ?auto_19108 ?auto_19109 ) ) ( TRUCK-AT ?auto_19110 ?auto_19106 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19096 ?auto_19097 )
      ( MAKE-2CRATE-VERIFY ?auto_19095 ?auto_19096 ?auto_19097 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19111 - SURFACE
      ?auto_19112 - SURFACE
      ?auto_19113 - SURFACE
      ?auto_19114 - SURFACE
    )
    :vars
    (
      ?auto_19123 - HOIST
      ?auto_19116 - PLACE
      ?auto_19118 - PLACE
      ?auto_19124 - HOIST
      ?auto_19122 - SURFACE
      ?auto_19117 - SURFACE
      ?auto_19125 - PLACE
      ?auto_19119 - HOIST
      ?auto_19121 - SURFACE
      ?auto_19115 - SURFACE
      ?auto_19120 - SURFACE
      ?auto_19126 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19123 ?auto_19116 ) ( IS-CRATE ?auto_19114 ) ( not ( = ?auto_19113 ?auto_19114 ) ) ( not ( = ?auto_19112 ?auto_19113 ) ) ( not ( = ?auto_19112 ?auto_19114 ) ) ( not ( = ?auto_19118 ?auto_19116 ) ) ( HOIST-AT ?auto_19124 ?auto_19118 ) ( not ( = ?auto_19123 ?auto_19124 ) ) ( SURFACE-AT ?auto_19114 ?auto_19118 ) ( ON ?auto_19114 ?auto_19122 ) ( CLEAR ?auto_19114 ) ( not ( = ?auto_19113 ?auto_19122 ) ) ( not ( = ?auto_19114 ?auto_19122 ) ) ( not ( = ?auto_19112 ?auto_19122 ) ) ( IS-CRATE ?auto_19113 ) ( SURFACE-AT ?auto_19113 ?auto_19118 ) ( ON ?auto_19113 ?auto_19117 ) ( CLEAR ?auto_19113 ) ( not ( = ?auto_19113 ?auto_19117 ) ) ( not ( = ?auto_19114 ?auto_19117 ) ) ( not ( = ?auto_19112 ?auto_19117 ) ) ( not ( = ?auto_19122 ?auto_19117 ) ) ( IS-CRATE ?auto_19112 ) ( not ( = ?auto_19111 ?auto_19112 ) ) ( not ( = ?auto_19113 ?auto_19111 ) ) ( not ( = ?auto_19114 ?auto_19111 ) ) ( not ( = ?auto_19122 ?auto_19111 ) ) ( not ( = ?auto_19117 ?auto_19111 ) ) ( not ( = ?auto_19125 ?auto_19116 ) ) ( not ( = ?auto_19118 ?auto_19125 ) ) ( HOIST-AT ?auto_19119 ?auto_19125 ) ( not ( = ?auto_19123 ?auto_19119 ) ) ( not ( = ?auto_19124 ?auto_19119 ) ) ( AVAILABLE ?auto_19119 ) ( SURFACE-AT ?auto_19112 ?auto_19125 ) ( ON ?auto_19112 ?auto_19121 ) ( CLEAR ?auto_19112 ) ( not ( = ?auto_19113 ?auto_19121 ) ) ( not ( = ?auto_19114 ?auto_19121 ) ) ( not ( = ?auto_19112 ?auto_19121 ) ) ( not ( = ?auto_19122 ?auto_19121 ) ) ( not ( = ?auto_19117 ?auto_19121 ) ) ( not ( = ?auto_19111 ?auto_19121 ) ) ( SURFACE-AT ?auto_19115 ?auto_19116 ) ( CLEAR ?auto_19115 ) ( IS-CRATE ?auto_19111 ) ( not ( = ?auto_19115 ?auto_19111 ) ) ( not ( = ?auto_19113 ?auto_19115 ) ) ( not ( = ?auto_19114 ?auto_19115 ) ) ( not ( = ?auto_19112 ?auto_19115 ) ) ( not ( = ?auto_19122 ?auto_19115 ) ) ( not ( = ?auto_19117 ?auto_19115 ) ) ( not ( = ?auto_19121 ?auto_19115 ) ) ( AVAILABLE ?auto_19123 ) ( AVAILABLE ?auto_19124 ) ( SURFACE-AT ?auto_19111 ?auto_19118 ) ( ON ?auto_19111 ?auto_19120 ) ( CLEAR ?auto_19111 ) ( not ( = ?auto_19113 ?auto_19120 ) ) ( not ( = ?auto_19114 ?auto_19120 ) ) ( not ( = ?auto_19112 ?auto_19120 ) ) ( not ( = ?auto_19122 ?auto_19120 ) ) ( not ( = ?auto_19117 ?auto_19120 ) ) ( not ( = ?auto_19111 ?auto_19120 ) ) ( not ( = ?auto_19121 ?auto_19120 ) ) ( not ( = ?auto_19115 ?auto_19120 ) ) ( TRUCK-AT ?auto_19126 ?auto_19116 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19112 ?auto_19113 ?auto_19114 )
      ( MAKE-3CRATE-VERIFY ?auto_19111 ?auto_19112 ?auto_19113 ?auto_19114 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19127 - SURFACE
      ?auto_19128 - SURFACE
      ?auto_19129 - SURFACE
      ?auto_19130 - SURFACE
      ?auto_19131 - SURFACE
    )
    :vars
    (
      ?auto_19139 - HOIST
      ?auto_19132 - PLACE
      ?auto_19134 - PLACE
      ?auto_19140 - HOIST
      ?auto_19138 - SURFACE
      ?auto_19133 - SURFACE
      ?auto_19141 - PLACE
      ?auto_19135 - HOIST
      ?auto_19137 - SURFACE
      ?auto_19136 - SURFACE
      ?auto_19142 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19139 ?auto_19132 ) ( IS-CRATE ?auto_19131 ) ( not ( = ?auto_19130 ?auto_19131 ) ) ( not ( = ?auto_19129 ?auto_19130 ) ) ( not ( = ?auto_19129 ?auto_19131 ) ) ( not ( = ?auto_19134 ?auto_19132 ) ) ( HOIST-AT ?auto_19140 ?auto_19134 ) ( not ( = ?auto_19139 ?auto_19140 ) ) ( SURFACE-AT ?auto_19131 ?auto_19134 ) ( ON ?auto_19131 ?auto_19138 ) ( CLEAR ?auto_19131 ) ( not ( = ?auto_19130 ?auto_19138 ) ) ( not ( = ?auto_19131 ?auto_19138 ) ) ( not ( = ?auto_19129 ?auto_19138 ) ) ( IS-CRATE ?auto_19130 ) ( SURFACE-AT ?auto_19130 ?auto_19134 ) ( ON ?auto_19130 ?auto_19133 ) ( CLEAR ?auto_19130 ) ( not ( = ?auto_19130 ?auto_19133 ) ) ( not ( = ?auto_19131 ?auto_19133 ) ) ( not ( = ?auto_19129 ?auto_19133 ) ) ( not ( = ?auto_19138 ?auto_19133 ) ) ( IS-CRATE ?auto_19129 ) ( not ( = ?auto_19128 ?auto_19129 ) ) ( not ( = ?auto_19130 ?auto_19128 ) ) ( not ( = ?auto_19131 ?auto_19128 ) ) ( not ( = ?auto_19138 ?auto_19128 ) ) ( not ( = ?auto_19133 ?auto_19128 ) ) ( not ( = ?auto_19141 ?auto_19132 ) ) ( not ( = ?auto_19134 ?auto_19141 ) ) ( HOIST-AT ?auto_19135 ?auto_19141 ) ( not ( = ?auto_19139 ?auto_19135 ) ) ( not ( = ?auto_19140 ?auto_19135 ) ) ( AVAILABLE ?auto_19135 ) ( SURFACE-AT ?auto_19129 ?auto_19141 ) ( ON ?auto_19129 ?auto_19137 ) ( CLEAR ?auto_19129 ) ( not ( = ?auto_19130 ?auto_19137 ) ) ( not ( = ?auto_19131 ?auto_19137 ) ) ( not ( = ?auto_19129 ?auto_19137 ) ) ( not ( = ?auto_19138 ?auto_19137 ) ) ( not ( = ?auto_19133 ?auto_19137 ) ) ( not ( = ?auto_19128 ?auto_19137 ) ) ( SURFACE-AT ?auto_19127 ?auto_19132 ) ( CLEAR ?auto_19127 ) ( IS-CRATE ?auto_19128 ) ( not ( = ?auto_19127 ?auto_19128 ) ) ( not ( = ?auto_19130 ?auto_19127 ) ) ( not ( = ?auto_19131 ?auto_19127 ) ) ( not ( = ?auto_19129 ?auto_19127 ) ) ( not ( = ?auto_19138 ?auto_19127 ) ) ( not ( = ?auto_19133 ?auto_19127 ) ) ( not ( = ?auto_19137 ?auto_19127 ) ) ( AVAILABLE ?auto_19139 ) ( AVAILABLE ?auto_19140 ) ( SURFACE-AT ?auto_19128 ?auto_19134 ) ( ON ?auto_19128 ?auto_19136 ) ( CLEAR ?auto_19128 ) ( not ( = ?auto_19130 ?auto_19136 ) ) ( not ( = ?auto_19131 ?auto_19136 ) ) ( not ( = ?auto_19129 ?auto_19136 ) ) ( not ( = ?auto_19138 ?auto_19136 ) ) ( not ( = ?auto_19133 ?auto_19136 ) ) ( not ( = ?auto_19128 ?auto_19136 ) ) ( not ( = ?auto_19137 ?auto_19136 ) ) ( not ( = ?auto_19127 ?auto_19136 ) ) ( TRUCK-AT ?auto_19142 ?auto_19132 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19129 ?auto_19130 ?auto_19131 )
      ( MAKE-4CRATE-VERIFY ?auto_19127 ?auto_19128 ?auto_19129 ?auto_19130 ?auto_19131 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19143 - SURFACE
      ?auto_19144 - SURFACE
      ?auto_19145 - SURFACE
      ?auto_19146 - SURFACE
      ?auto_19147 - SURFACE
      ?auto_19148 - SURFACE
    )
    :vars
    (
      ?auto_19156 - HOIST
      ?auto_19149 - PLACE
      ?auto_19151 - PLACE
      ?auto_19157 - HOIST
      ?auto_19155 - SURFACE
      ?auto_19150 - SURFACE
      ?auto_19158 - PLACE
      ?auto_19152 - HOIST
      ?auto_19154 - SURFACE
      ?auto_19153 - SURFACE
      ?auto_19159 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19156 ?auto_19149 ) ( IS-CRATE ?auto_19148 ) ( not ( = ?auto_19147 ?auto_19148 ) ) ( not ( = ?auto_19146 ?auto_19147 ) ) ( not ( = ?auto_19146 ?auto_19148 ) ) ( not ( = ?auto_19151 ?auto_19149 ) ) ( HOIST-AT ?auto_19157 ?auto_19151 ) ( not ( = ?auto_19156 ?auto_19157 ) ) ( SURFACE-AT ?auto_19148 ?auto_19151 ) ( ON ?auto_19148 ?auto_19155 ) ( CLEAR ?auto_19148 ) ( not ( = ?auto_19147 ?auto_19155 ) ) ( not ( = ?auto_19148 ?auto_19155 ) ) ( not ( = ?auto_19146 ?auto_19155 ) ) ( IS-CRATE ?auto_19147 ) ( SURFACE-AT ?auto_19147 ?auto_19151 ) ( ON ?auto_19147 ?auto_19150 ) ( CLEAR ?auto_19147 ) ( not ( = ?auto_19147 ?auto_19150 ) ) ( not ( = ?auto_19148 ?auto_19150 ) ) ( not ( = ?auto_19146 ?auto_19150 ) ) ( not ( = ?auto_19155 ?auto_19150 ) ) ( IS-CRATE ?auto_19146 ) ( not ( = ?auto_19145 ?auto_19146 ) ) ( not ( = ?auto_19147 ?auto_19145 ) ) ( not ( = ?auto_19148 ?auto_19145 ) ) ( not ( = ?auto_19155 ?auto_19145 ) ) ( not ( = ?auto_19150 ?auto_19145 ) ) ( not ( = ?auto_19158 ?auto_19149 ) ) ( not ( = ?auto_19151 ?auto_19158 ) ) ( HOIST-AT ?auto_19152 ?auto_19158 ) ( not ( = ?auto_19156 ?auto_19152 ) ) ( not ( = ?auto_19157 ?auto_19152 ) ) ( AVAILABLE ?auto_19152 ) ( SURFACE-AT ?auto_19146 ?auto_19158 ) ( ON ?auto_19146 ?auto_19154 ) ( CLEAR ?auto_19146 ) ( not ( = ?auto_19147 ?auto_19154 ) ) ( not ( = ?auto_19148 ?auto_19154 ) ) ( not ( = ?auto_19146 ?auto_19154 ) ) ( not ( = ?auto_19155 ?auto_19154 ) ) ( not ( = ?auto_19150 ?auto_19154 ) ) ( not ( = ?auto_19145 ?auto_19154 ) ) ( SURFACE-AT ?auto_19144 ?auto_19149 ) ( CLEAR ?auto_19144 ) ( IS-CRATE ?auto_19145 ) ( not ( = ?auto_19144 ?auto_19145 ) ) ( not ( = ?auto_19147 ?auto_19144 ) ) ( not ( = ?auto_19148 ?auto_19144 ) ) ( not ( = ?auto_19146 ?auto_19144 ) ) ( not ( = ?auto_19155 ?auto_19144 ) ) ( not ( = ?auto_19150 ?auto_19144 ) ) ( not ( = ?auto_19154 ?auto_19144 ) ) ( AVAILABLE ?auto_19156 ) ( AVAILABLE ?auto_19157 ) ( SURFACE-AT ?auto_19145 ?auto_19151 ) ( ON ?auto_19145 ?auto_19153 ) ( CLEAR ?auto_19145 ) ( not ( = ?auto_19147 ?auto_19153 ) ) ( not ( = ?auto_19148 ?auto_19153 ) ) ( not ( = ?auto_19146 ?auto_19153 ) ) ( not ( = ?auto_19155 ?auto_19153 ) ) ( not ( = ?auto_19150 ?auto_19153 ) ) ( not ( = ?auto_19145 ?auto_19153 ) ) ( not ( = ?auto_19154 ?auto_19153 ) ) ( not ( = ?auto_19144 ?auto_19153 ) ) ( TRUCK-AT ?auto_19159 ?auto_19149 ) ( ON ?auto_19144 ?auto_19143 ) ( not ( = ?auto_19143 ?auto_19144 ) ) ( not ( = ?auto_19143 ?auto_19145 ) ) ( not ( = ?auto_19143 ?auto_19146 ) ) ( not ( = ?auto_19143 ?auto_19147 ) ) ( not ( = ?auto_19143 ?auto_19148 ) ) ( not ( = ?auto_19143 ?auto_19155 ) ) ( not ( = ?auto_19143 ?auto_19150 ) ) ( not ( = ?auto_19143 ?auto_19154 ) ) ( not ( = ?auto_19143 ?auto_19153 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19146 ?auto_19147 ?auto_19148 )
      ( MAKE-5CRATE-VERIFY ?auto_19143 ?auto_19144 ?auto_19145 ?auto_19146 ?auto_19147 ?auto_19148 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19160 - SURFACE
      ?auto_19161 - SURFACE
    )
    :vars
    (
      ?auto_19171 - HOIST
      ?auto_19164 - PLACE
      ?auto_19173 - SURFACE
      ?auto_19166 - PLACE
      ?auto_19172 - HOIST
      ?auto_19170 - SURFACE
      ?auto_19165 - SURFACE
      ?auto_19162 - SURFACE
      ?auto_19174 - PLACE
      ?auto_19167 - HOIST
      ?auto_19169 - SURFACE
      ?auto_19163 - SURFACE
      ?auto_19168 - SURFACE
      ?auto_19175 - TRUCK
      ?auto_19176 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19171 ?auto_19164 ) ( IS-CRATE ?auto_19161 ) ( not ( = ?auto_19160 ?auto_19161 ) ) ( not ( = ?auto_19173 ?auto_19160 ) ) ( not ( = ?auto_19173 ?auto_19161 ) ) ( not ( = ?auto_19166 ?auto_19164 ) ) ( HOIST-AT ?auto_19172 ?auto_19166 ) ( not ( = ?auto_19171 ?auto_19172 ) ) ( SURFACE-AT ?auto_19161 ?auto_19166 ) ( ON ?auto_19161 ?auto_19170 ) ( CLEAR ?auto_19161 ) ( not ( = ?auto_19160 ?auto_19170 ) ) ( not ( = ?auto_19161 ?auto_19170 ) ) ( not ( = ?auto_19173 ?auto_19170 ) ) ( IS-CRATE ?auto_19160 ) ( SURFACE-AT ?auto_19160 ?auto_19166 ) ( ON ?auto_19160 ?auto_19165 ) ( CLEAR ?auto_19160 ) ( not ( = ?auto_19160 ?auto_19165 ) ) ( not ( = ?auto_19161 ?auto_19165 ) ) ( not ( = ?auto_19173 ?auto_19165 ) ) ( not ( = ?auto_19170 ?auto_19165 ) ) ( IS-CRATE ?auto_19173 ) ( not ( = ?auto_19162 ?auto_19173 ) ) ( not ( = ?auto_19160 ?auto_19162 ) ) ( not ( = ?auto_19161 ?auto_19162 ) ) ( not ( = ?auto_19170 ?auto_19162 ) ) ( not ( = ?auto_19165 ?auto_19162 ) ) ( not ( = ?auto_19174 ?auto_19164 ) ) ( not ( = ?auto_19166 ?auto_19174 ) ) ( HOIST-AT ?auto_19167 ?auto_19174 ) ( not ( = ?auto_19171 ?auto_19167 ) ) ( not ( = ?auto_19172 ?auto_19167 ) ) ( AVAILABLE ?auto_19167 ) ( SURFACE-AT ?auto_19173 ?auto_19174 ) ( ON ?auto_19173 ?auto_19169 ) ( CLEAR ?auto_19173 ) ( not ( = ?auto_19160 ?auto_19169 ) ) ( not ( = ?auto_19161 ?auto_19169 ) ) ( not ( = ?auto_19173 ?auto_19169 ) ) ( not ( = ?auto_19170 ?auto_19169 ) ) ( not ( = ?auto_19165 ?auto_19169 ) ) ( not ( = ?auto_19162 ?auto_19169 ) ) ( IS-CRATE ?auto_19162 ) ( not ( = ?auto_19163 ?auto_19162 ) ) ( not ( = ?auto_19160 ?auto_19163 ) ) ( not ( = ?auto_19161 ?auto_19163 ) ) ( not ( = ?auto_19173 ?auto_19163 ) ) ( not ( = ?auto_19170 ?auto_19163 ) ) ( not ( = ?auto_19165 ?auto_19163 ) ) ( not ( = ?auto_19169 ?auto_19163 ) ) ( AVAILABLE ?auto_19172 ) ( SURFACE-AT ?auto_19162 ?auto_19166 ) ( ON ?auto_19162 ?auto_19168 ) ( CLEAR ?auto_19162 ) ( not ( = ?auto_19160 ?auto_19168 ) ) ( not ( = ?auto_19161 ?auto_19168 ) ) ( not ( = ?auto_19173 ?auto_19168 ) ) ( not ( = ?auto_19170 ?auto_19168 ) ) ( not ( = ?auto_19165 ?auto_19168 ) ) ( not ( = ?auto_19162 ?auto_19168 ) ) ( not ( = ?auto_19169 ?auto_19168 ) ) ( not ( = ?auto_19163 ?auto_19168 ) ) ( TRUCK-AT ?auto_19175 ?auto_19164 ) ( SURFACE-AT ?auto_19176 ?auto_19164 ) ( CLEAR ?auto_19176 ) ( LIFTING ?auto_19171 ?auto_19163 ) ( IS-CRATE ?auto_19163 ) ( not ( = ?auto_19176 ?auto_19163 ) ) ( not ( = ?auto_19160 ?auto_19176 ) ) ( not ( = ?auto_19161 ?auto_19176 ) ) ( not ( = ?auto_19173 ?auto_19176 ) ) ( not ( = ?auto_19170 ?auto_19176 ) ) ( not ( = ?auto_19165 ?auto_19176 ) ) ( not ( = ?auto_19162 ?auto_19176 ) ) ( not ( = ?auto_19169 ?auto_19176 ) ) ( not ( = ?auto_19168 ?auto_19176 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19176 ?auto_19163 )
      ( MAKE-2CRATE ?auto_19173 ?auto_19160 ?auto_19161 )
      ( MAKE-1CRATE-VERIFY ?auto_19160 ?auto_19161 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19177 - SURFACE
      ?auto_19178 - SURFACE
      ?auto_19179 - SURFACE
    )
    :vars
    (
      ?auto_19185 - HOIST
      ?auto_19186 - PLACE
      ?auto_19183 - PLACE
      ?auto_19189 - HOIST
      ?auto_19187 - SURFACE
      ?auto_19191 - SURFACE
      ?auto_19193 - SURFACE
      ?auto_19180 - PLACE
      ?auto_19184 - HOIST
      ?auto_19190 - SURFACE
      ?auto_19192 - SURFACE
      ?auto_19181 - SURFACE
      ?auto_19188 - TRUCK
      ?auto_19182 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19185 ?auto_19186 ) ( IS-CRATE ?auto_19179 ) ( not ( = ?auto_19178 ?auto_19179 ) ) ( not ( = ?auto_19177 ?auto_19178 ) ) ( not ( = ?auto_19177 ?auto_19179 ) ) ( not ( = ?auto_19183 ?auto_19186 ) ) ( HOIST-AT ?auto_19189 ?auto_19183 ) ( not ( = ?auto_19185 ?auto_19189 ) ) ( SURFACE-AT ?auto_19179 ?auto_19183 ) ( ON ?auto_19179 ?auto_19187 ) ( CLEAR ?auto_19179 ) ( not ( = ?auto_19178 ?auto_19187 ) ) ( not ( = ?auto_19179 ?auto_19187 ) ) ( not ( = ?auto_19177 ?auto_19187 ) ) ( IS-CRATE ?auto_19178 ) ( SURFACE-AT ?auto_19178 ?auto_19183 ) ( ON ?auto_19178 ?auto_19191 ) ( CLEAR ?auto_19178 ) ( not ( = ?auto_19178 ?auto_19191 ) ) ( not ( = ?auto_19179 ?auto_19191 ) ) ( not ( = ?auto_19177 ?auto_19191 ) ) ( not ( = ?auto_19187 ?auto_19191 ) ) ( IS-CRATE ?auto_19177 ) ( not ( = ?auto_19193 ?auto_19177 ) ) ( not ( = ?auto_19178 ?auto_19193 ) ) ( not ( = ?auto_19179 ?auto_19193 ) ) ( not ( = ?auto_19187 ?auto_19193 ) ) ( not ( = ?auto_19191 ?auto_19193 ) ) ( not ( = ?auto_19180 ?auto_19186 ) ) ( not ( = ?auto_19183 ?auto_19180 ) ) ( HOIST-AT ?auto_19184 ?auto_19180 ) ( not ( = ?auto_19185 ?auto_19184 ) ) ( not ( = ?auto_19189 ?auto_19184 ) ) ( AVAILABLE ?auto_19184 ) ( SURFACE-AT ?auto_19177 ?auto_19180 ) ( ON ?auto_19177 ?auto_19190 ) ( CLEAR ?auto_19177 ) ( not ( = ?auto_19178 ?auto_19190 ) ) ( not ( = ?auto_19179 ?auto_19190 ) ) ( not ( = ?auto_19177 ?auto_19190 ) ) ( not ( = ?auto_19187 ?auto_19190 ) ) ( not ( = ?auto_19191 ?auto_19190 ) ) ( not ( = ?auto_19193 ?auto_19190 ) ) ( IS-CRATE ?auto_19193 ) ( not ( = ?auto_19192 ?auto_19193 ) ) ( not ( = ?auto_19178 ?auto_19192 ) ) ( not ( = ?auto_19179 ?auto_19192 ) ) ( not ( = ?auto_19177 ?auto_19192 ) ) ( not ( = ?auto_19187 ?auto_19192 ) ) ( not ( = ?auto_19191 ?auto_19192 ) ) ( not ( = ?auto_19190 ?auto_19192 ) ) ( AVAILABLE ?auto_19189 ) ( SURFACE-AT ?auto_19193 ?auto_19183 ) ( ON ?auto_19193 ?auto_19181 ) ( CLEAR ?auto_19193 ) ( not ( = ?auto_19178 ?auto_19181 ) ) ( not ( = ?auto_19179 ?auto_19181 ) ) ( not ( = ?auto_19177 ?auto_19181 ) ) ( not ( = ?auto_19187 ?auto_19181 ) ) ( not ( = ?auto_19191 ?auto_19181 ) ) ( not ( = ?auto_19193 ?auto_19181 ) ) ( not ( = ?auto_19190 ?auto_19181 ) ) ( not ( = ?auto_19192 ?auto_19181 ) ) ( TRUCK-AT ?auto_19188 ?auto_19186 ) ( SURFACE-AT ?auto_19182 ?auto_19186 ) ( CLEAR ?auto_19182 ) ( LIFTING ?auto_19185 ?auto_19192 ) ( IS-CRATE ?auto_19192 ) ( not ( = ?auto_19182 ?auto_19192 ) ) ( not ( = ?auto_19178 ?auto_19182 ) ) ( not ( = ?auto_19179 ?auto_19182 ) ) ( not ( = ?auto_19177 ?auto_19182 ) ) ( not ( = ?auto_19187 ?auto_19182 ) ) ( not ( = ?auto_19191 ?auto_19182 ) ) ( not ( = ?auto_19193 ?auto_19182 ) ) ( not ( = ?auto_19190 ?auto_19182 ) ) ( not ( = ?auto_19181 ?auto_19182 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19178 ?auto_19179 )
      ( MAKE-2CRATE-VERIFY ?auto_19177 ?auto_19178 ?auto_19179 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19194 - SURFACE
      ?auto_19195 - SURFACE
      ?auto_19196 - SURFACE
      ?auto_19197 - SURFACE
    )
    :vars
    (
      ?auto_19201 - HOIST
      ?auto_19205 - PLACE
      ?auto_19199 - PLACE
      ?auto_19206 - HOIST
      ?auto_19207 - SURFACE
      ?auto_19209 - SURFACE
      ?auto_19204 - PLACE
      ?auto_19203 - HOIST
      ?auto_19202 - SURFACE
      ?auto_19208 - SURFACE
      ?auto_19200 - SURFACE
      ?auto_19198 - TRUCK
      ?auto_19210 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19201 ?auto_19205 ) ( IS-CRATE ?auto_19197 ) ( not ( = ?auto_19196 ?auto_19197 ) ) ( not ( = ?auto_19195 ?auto_19196 ) ) ( not ( = ?auto_19195 ?auto_19197 ) ) ( not ( = ?auto_19199 ?auto_19205 ) ) ( HOIST-AT ?auto_19206 ?auto_19199 ) ( not ( = ?auto_19201 ?auto_19206 ) ) ( SURFACE-AT ?auto_19197 ?auto_19199 ) ( ON ?auto_19197 ?auto_19207 ) ( CLEAR ?auto_19197 ) ( not ( = ?auto_19196 ?auto_19207 ) ) ( not ( = ?auto_19197 ?auto_19207 ) ) ( not ( = ?auto_19195 ?auto_19207 ) ) ( IS-CRATE ?auto_19196 ) ( SURFACE-AT ?auto_19196 ?auto_19199 ) ( ON ?auto_19196 ?auto_19209 ) ( CLEAR ?auto_19196 ) ( not ( = ?auto_19196 ?auto_19209 ) ) ( not ( = ?auto_19197 ?auto_19209 ) ) ( not ( = ?auto_19195 ?auto_19209 ) ) ( not ( = ?auto_19207 ?auto_19209 ) ) ( IS-CRATE ?auto_19195 ) ( not ( = ?auto_19194 ?auto_19195 ) ) ( not ( = ?auto_19196 ?auto_19194 ) ) ( not ( = ?auto_19197 ?auto_19194 ) ) ( not ( = ?auto_19207 ?auto_19194 ) ) ( not ( = ?auto_19209 ?auto_19194 ) ) ( not ( = ?auto_19204 ?auto_19205 ) ) ( not ( = ?auto_19199 ?auto_19204 ) ) ( HOIST-AT ?auto_19203 ?auto_19204 ) ( not ( = ?auto_19201 ?auto_19203 ) ) ( not ( = ?auto_19206 ?auto_19203 ) ) ( AVAILABLE ?auto_19203 ) ( SURFACE-AT ?auto_19195 ?auto_19204 ) ( ON ?auto_19195 ?auto_19202 ) ( CLEAR ?auto_19195 ) ( not ( = ?auto_19196 ?auto_19202 ) ) ( not ( = ?auto_19197 ?auto_19202 ) ) ( not ( = ?auto_19195 ?auto_19202 ) ) ( not ( = ?auto_19207 ?auto_19202 ) ) ( not ( = ?auto_19209 ?auto_19202 ) ) ( not ( = ?auto_19194 ?auto_19202 ) ) ( IS-CRATE ?auto_19194 ) ( not ( = ?auto_19208 ?auto_19194 ) ) ( not ( = ?auto_19196 ?auto_19208 ) ) ( not ( = ?auto_19197 ?auto_19208 ) ) ( not ( = ?auto_19195 ?auto_19208 ) ) ( not ( = ?auto_19207 ?auto_19208 ) ) ( not ( = ?auto_19209 ?auto_19208 ) ) ( not ( = ?auto_19202 ?auto_19208 ) ) ( AVAILABLE ?auto_19206 ) ( SURFACE-AT ?auto_19194 ?auto_19199 ) ( ON ?auto_19194 ?auto_19200 ) ( CLEAR ?auto_19194 ) ( not ( = ?auto_19196 ?auto_19200 ) ) ( not ( = ?auto_19197 ?auto_19200 ) ) ( not ( = ?auto_19195 ?auto_19200 ) ) ( not ( = ?auto_19207 ?auto_19200 ) ) ( not ( = ?auto_19209 ?auto_19200 ) ) ( not ( = ?auto_19194 ?auto_19200 ) ) ( not ( = ?auto_19202 ?auto_19200 ) ) ( not ( = ?auto_19208 ?auto_19200 ) ) ( TRUCK-AT ?auto_19198 ?auto_19205 ) ( SURFACE-AT ?auto_19210 ?auto_19205 ) ( CLEAR ?auto_19210 ) ( LIFTING ?auto_19201 ?auto_19208 ) ( IS-CRATE ?auto_19208 ) ( not ( = ?auto_19210 ?auto_19208 ) ) ( not ( = ?auto_19196 ?auto_19210 ) ) ( not ( = ?auto_19197 ?auto_19210 ) ) ( not ( = ?auto_19195 ?auto_19210 ) ) ( not ( = ?auto_19207 ?auto_19210 ) ) ( not ( = ?auto_19209 ?auto_19210 ) ) ( not ( = ?auto_19194 ?auto_19210 ) ) ( not ( = ?auto_19202 ?auto_19210 ) ) ( not ( = ?auto_19200 ?auto_19210 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19195 ?auto_19196 ?auto_19197 )
      ( MAKE-3CRATE-VERIFY ?auto_19194 ?auto_19195 ?auto_19196 ?auto_19197 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19211 - SURFACE
      ?auto_19212 - SURFACE
      ?auto_19213 - SURFACE
      ?auto_19214 - SURFACE
      ?auto_19215 - SURFACE
    )
    :vars
    (
      ?auto_19219 - HOIST
      ?auto_19223 - PLACE
      ?auto_19217 - PLACE
      ?auto_19224 - HOIST
      ?auto_19225 - SURFACE
      ?auto_19226 - SURFACE
      ?auto_19222 - PLACE
      ?auto_19221 - HOIST
      ?auto_19220 - SURFACE
      ?auto_19218 - SURFACE
      ?auto_19216 - TRUCK
      ?auto_19227 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19219 ?auto_19223 ) ( IS-CRATE ?auto_19215 ) ( not ( = ?auto_19214 ?auto_19215 ) ) ( not ( = ?auto_19213 ?auto_19214 ) ) ( not ( = ?auto_19213 ?auto_19215 ) ) ( not ( = ?auto_19217 ?auto_19223 ) ) ( HOIST-AT ?auto_19224 ?auto_19217 ) ( not ( = ?auto_19219 ?auto_19224 ) ) ( SURFACE-AT ?auto_19215 ?auto_19217 ) ( ON ?auto_19215 ?auto_19225 ) ( CLEAR ?auto_19215 ) ( not ( = ?auto_19214 ?auto_19225 ) ) ( not ( = ?auto_19215 ?auto_19225 ) ) ( not ( = ?auto_19213 ?auto_19225 ) ) ( IS-CRATE ?auto_19214 ) ( SURFACE-AT ?auto_19214 ?auto_19217 ) ( ON ?auto_19214 ?auto_19226 ) ( CLEAR ?auto_19214 ) ( not ( = ?auto_19214 ?auto_19226 ) ) ( not ( = ?auto_19215 ?auto_19226 ) ) ( not ( = ?auto_19213 ?auto_19226 ) ) ( not ( = ?auto_19225 ?auto_19226 ) ) ( IS-CRATE ?auto_19213 ) ( not ( = ?auto_19212 ?auto_19213 ) ) ( not ( = ?auto_19214 ?auto_19212 ) ) ( not ( = ?auto_19215 ?auto_19212 ) ) ( not ( = ?auto_19225 ?auto_19212 ) ) ( not ( = ?auto_19226 ?auto_19212 ) ) ( not ( = ?auto_19222 ?auto_19223 ) ) ( not ( = ?auto_19217 ?auto_19222 ) ) ( HOIST-AT ?auto_19221 ?auto_19222 ) ( not ( = ?auto_19219 ?auto_19221 ) ) ( not ( = ?auto_19224 ?auto_19221 ) ) ( AVAILABLE ?auto_19221 ) ( SURFACE-AT ?auto_19213 ?auto_19222 ) ( ON ?auto_19213 ?auto_19220 ) ( CLEAR ?auto_19213 ) ( not ( = ?auto_19214 ?auto_19220 ) ) ( not ( = ?auto_19215 ?auto_19220 ) ) ( not ( = ?auto_19213 ?auto_19220 ) ) ( not ( = ?auto_19225 ?auto_19220 ) ) ( not ( = ?auto_19226 ?auto_19220 ) ) ( not ( = ?auto_19212 ?auto_19220 ) ) ( IS-CRATE ?auto_19212 ) ( not ( = ?auto_19211 ?auto_19212 ) ) ( not ( = ?auto_19214 ?auto_19211 ) ) ( not ( = ?auto_19215 ?auto_19211 ) ) ( not ( = ?auto_19213 ?auto_19211 ) ) ( not ( = ?auto_19225 ?auto_19211 ) ) ( not ( = ?auto_19226 ?auto_19211 ) ) ( not ( = ?auto_19220 ?auto_19211 ) ) ( AVAILABLE ?auto_19224 ) ( SURFACE-AT ?auto_19212 ?auto_19217 ) ( ON ?auto_19212 ?auto_19218 ) ( CLEAR ?auto_19212 ) ( not ( = ?auto_19214 ?auto_19218 ) ) ( not ( = ?auto_19215 ?auto_19218 ) ) ( not ( = ?auto_19213 ?auto_19218 ) ) ( not ( = ?auto_19225 ?auto_19218 ) ) ( not ( = ?auto_19226 ?auto_19218 ) ) ( not ( = ?auto_19212 ?auto_19218 ) ) ( not ( = ?auto_19220 ?auto_19218 ) ) ( not ( = ?auto_19211 ?auto_19218 ) ) ( TRUCK-AT ?auto_19216 ?auto_19223 ) ( SURFACE-AT ?auto_19227 ?auto_19223 ) ( CLEAR ?auto_19227 ) ( LIFTING ?auto_19219 ?auto_19211 ) ( IS-CRATE ?auto_19211 ) ( not ( = ?auto_19227 ?auto_19211 ) ) ( not ( = ?auto_19214 ?auto_19227 ) ) ( not ( = ?auto_19215 ?auto_19227 ) ) ( not ( = ?auto_19213 ?auto_19227 ) ) ( not ( = ?auto_19225 ?auto_19227 ) ) ( not ( = ?auto_19226 ?auto_19227 ) ) ( not ( = ?auto_19212 ?auto_19227 ) ) ( not ( = ?auto_19220 ?auto_19227 ) ) ( not ( = ?auto_19218 ?auto_19227 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19213 ?auto_19214 ?auto_19215 )
      ( MAKE-4CRATE-VERIFY ?auto_19211 ?auto_19212 ?auto_19213 ?auto_19214 ?auto_19215 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19228 - SURFACE
      ?auto_19229 - SURFACE
      ?auto_19230 - SURFACE
      ?auto_19231 - SURFACE
      ?auto_19232 - SURFACE
      ?auto_19233 - SURFACE
    )
    :vars
    (
      ?auto_19237 - HOIST
      ?auto_19241 - PLACE
      ?auto_19235 - PLACE
      ?auto_19242 - HOIST
      ?auto_19243 - SURFACE
      ?auto_19244 - SURFACE
      ?auto_19240 - PLACE
      ?auto_19239 - HOIST
      ?auto_19238 - SURFACE
      ?auto_19236 - SURFACE
      ?auto_19234 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19237 ?auto_19241 ) ( IS-CRATE ?auto_19233 ) ( not ( = ?auto_19232 ?auto_19233 ) ) ( not ( = ?auto_19231 ?auto_19232 ) ) ( not ( = ?auto_19231 ?auto_19233 ) ) ( not ( = ?auto_19235 ?auto_19241 ) ) ( HOIST-AT ?auto_19242 ?auto_19235 ) ( not ( = ?auto_19237 ?auto_19242 ) ) ( SURFACE-AT ?auto_19233 ?auto_19235 ) ( ON ?auto_19233 ?auto_19243 ) ( CLEAR ?auto_19233 ) ( not ( = ?auto_19232 ?auto_19243 ) ) ( not ( = ?auto_19233 ?auto_19243 ) ) ( not ( = ?auto_19231 ?auto_19243 ) ) ( IS-CRATE ?auto_19232 ) ( SURFACE-AT ?auto_19232 ?auto_19235 ) ( ON ?auto_19232 ?auto_19244 ) ( CLEAR ?auto_19232 ) ( not ( = ?auto_19232 ?auto_19244 ) ) ( not ( = ?auto_19233 ?auto_19244 ) ) ( not ( = ?auto_19231 ?auto_19244 ) ) ( not ( = ?auto_19243 ?auto_19244 ) ) ( IS-CRATE ?auto_19231 ) ( not ( = ?auto_19230 ?auto_19231 ) ) ( not ( = ?auto_19232 ?auto_19230 ) ) ( not ( = ?auto_19233 ?auto_19230 ) ) ( not ( = ?auto_19243 ?auto_19230 ) ) ( not ( = ?auto_19244 ?auto_19230 ) ) ( not ( = ?auto_19240 ?auto_19241 ) ) ( not ( = ?auto_19235 ?auto_19240 ) ) ( HOIST-AT ?auto_19239 ?auto_19240 ) ( not ( = ?auto_19237 ?auto_19239 ) ) ( not ( = ?auto_19242 ?auto_19239 ) ) ( AVAILABLE ?auto_19239 ) ( SURFACE-AT ?auto_19231 ?auto_19240 ) ( ON ?auto_19231 ?auto_19238 ) ( CLEAR ?auto_19231 ) ( not ( = ?auto_19232 ?auto_19238 ) ) ( not ( = ?auto_19233 ?auto_19238 ) ) ( not ( = ?auto_19231 ?auto_19238 ) ) ( not ( = ?auto_19243 ?auto_19238 ) ) ( not ( = ?auto_19244 ?auto_19238 ) ) ( not ( = ?auto_19230 ?auto_19238 ) ) ( IS-CRATE ?auto_19230 ) ( not ( = ?auto_19229 ?auto_19230 ) ) ( not ( = ?auto_19232 ?auto_19229 ) ) ( not ( = ?auto_19233 ?auto_19229 ) ) ( not ( = ?auto_19231 ?auto_19229 ) ) ( not ( = ?auto_19243 ?auto_19229 ) ) ( not ( = ?auto_19244 ?auto_19229 ) ) ( not ( = ?auto_19238 ?auto_19229 ) ) ( AVAILABLE ?auto_19242 ) ( SURFACE-AT ?auto_19230 ?auto_19235 ) ( ON ?auto_19230 ?auto_19236 ) ( CLEAR ?auto_19230 ) ( not ( = ?auto_19232 ?auto_19236 ) ) ( not ( = ?auto_19233 ?auto_19236 ) ) ( not ( = ?auto_19231 ?auto_19236 ) ) ( not ( = ?auto_19243 ?auto_19236 ) ) ( not ( = ?auto_19244 ?auto_19236 ) ) ( not ( = ?auto_19230 ?auto_19236 ) ) ( not ( = ?auto_19238 ?auto_19236 ) ) ( not ( = ?auto_19229 ?auto_19236 ) ) ( TRUCK-AT ?auto_19234 ?auto_19241 ) ( SURFACE-AT ?auto_19228 ?auto_19241 ) ( CLEAR ?auto_19228 ) ( LIFTING ?auto_19237 ?auto_19229 ) ( IS-CRATE ?auto_19229 ) ( not ( = ?auto_19228 ?auto_19229 ) ) ( not ( = ?auto_19232 ?auto_19228 ) ) ( not ( = ?auto_19233 ?auto_19228 ) ) ( not ( = ?auto_19231 ?auto_19228 ) ) ( not ( = ?auto_19243 ?auto_19228 ) ) ( not ( = ?auto_19244 ?auto_19228 ) ) ( not ( = ?auto_19230 ?auto_19228 ) ) ( not ( = ?auto_19238 ?auto_19228 ) ) ( not ( = ?auto_19236 ?auto_19228 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19231 ?auto_19232 ?auto_19233 )
      ( MAKE-5CRATE-VERIFY ?auto_19228 ?auto_19229 ?auto_19230 ?auto_19231 ?auto_19232 ?auto_19233 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19245 - SURFACE
      ?auto_19246 - SURFACE
    )
    :vars
    (
      ?auto_19250 - HOIST
      ?auto_19254 - PLACE
      ?auto_19261 - SURFACE
      ?auto_19248 - PLACE
      ?auto_19256 - HOIST
      ?auto_19257 - SURFACE
      ?auto_19259 - SURFACE
      ?auto_19255 - SURFACE
      ?auto_19253 - PLACE
      ?auto_19252 - HOIST
      ?auto_19251 - SURFACE
      ?auto_19258 - SURFACE
      ?auto_19249 - SURFACE
      ?auto_19247 - TRUCK
      ?auto_19260 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19250 ?auto_19254 ) ( IS-CRATE ?auto_19246 ) ( not ( = ?auto_19245 ?auto_19246 ) ) ( not ( = ?auto_19261 ?auto_19245 ) ) ( not ( = ?auto_19261 ?auto_19246 ) ) ( not ( = ?auto_19248 ?auto_19254 ) ) ( HOIST-AT ?auto_19256 ?auto_19248 ) ( not ( = ?auto_19250 ?auto_19256 ) ) ( SURFACE-AT ?auto_19246 ?auto_19248 ) ( ON ?auto_19246 ?auto_19257 ) ( CLEAR ?auto_19246 ) ( not ( = ?auto_19245 ?auto_19257 ) ) ( not ( = ?auto_19246 ?auto_19257 ) ) ( not ( = ?auto_19261 ?auto_19257 ) ) ( IS-CRATE ?auto_19245 ) ( SURFACE-AT ?auto_19245 ?auto_19248 ) ( ON ?auto_19245 ?auto_19259 ) ( CLEAR ?auto_19245 ) ( not ( = ?auto_19245 ?auto_19259 ) ) ( not ( = ?auto_19246 ?auto_19259 ) ) ( not ( = ?auto_19261 ?auto_19259 ) ) ( not ( = ?auto_19257 ?auto_19259 ) ) ( IS-CRATE ?auto_19261 ) ( not ( = ?auto_19255 ?auto_19261 ) ) ( not ( = ?auto_19245 ?auto_19255 ) ) ( not ( = ?auto_19246 ?auto_19255 ) ) ( not ( = ?auto_19257 ?auto_19255 ) ) ( not ( = ?auto_19259 ?auto_19255 ) ) ( not ( = ?auto_19253 ?auto_19254 ) ) ( not ( = ?auto_19248 ?auto_19253 ) ) ( HOIST-AT ?auto_19252 ?auto_19253 ) ( not ( = ?auto_19250 ?auto_19252 ) ) ( not ( = ?auto_19256 ?auto_19252 ) ) ( AVAILABLE ?auto_19252 ) ( SURFACE-AT ?auto_19261 ?auto_19253 ) ( ON ?auto_19261 ?auto_19251 ) ( CLEAR ?auto_19261 ) ( not ( = ?auto_19245 ?auto_19251 ) ) ( not ( = ?auto_19246 ?auto_19251 ) ) ( not ( = ?auto_19261 ?auto_19251 ) ) ( not ( = ?auto_19257 ?auto_19251 ) ) ( not ( = ?auto_19259 ?auto_19251 ) ) ( not ( = ?auto_19255 ?auto_19251 ) ) ( IS-CRATE ?auto_19255 ) ( not ( = ?auto_19258 ?auto_19255 ) ) ( not ( = ?auto_19245 ?auto_19258 ) ) ( not ( = ?auto_19246 ?auto_19258 ) ) ( not ( = ?auto_19261 ?auto_19258 ) ) ( not ( = ?auto_19257 ?auto_19258 ) ) ( not ( = ?auto_19259 ?auto_19258 ) ) ( not ( = ?auto_19251 ?auto_19258 ) ) ( AVAILABLE ?auto_19256 ) ( SURFACE-AT ?auto_19255 ?auto_19248 ) ( ON ?auto_19255 ?auto_19249 ) ( CLEAR ?auto_19255 ) ( not ( = ?auto_19245 ?auto_19249 ) ) ( not ( = ?auto_19246 ?auto_19249 ) ) ( not ( = ?auto_19261 ?auto_19249 ) ) ( not ( = ?auto_19257 ?auto_19249 ) ) ( not ( = ?auto_19259 ?auto_19249 ) ) ( not ( = ?auto_19255 ?auto_19249 ) ) ( not ( = ?auto_19251 ?auto_19249 ) ) ( not ( = ?auto_19258 ?auto_19249 ) ) ( TRUCK-AT ?auto_19247 ?auto_19254 ) ( SURFACE-AT ?auto_19260 ?auto_19254 ) ( CLEAR ?auto_19260 ) ( IS-CRATE ?auto_19258 ) ( not ( = ?auto_19260 ?auto_19258 ) ) ( not ( = ?auto_19245 ?auto_19260 ) ) ( not ( = ?auto_19246 ?auto_19260 ) ) ( not ( = ?auto_19261 ?auto_19260 ) ) ( not ( = ?auto_19257 ?auto_19260 ) ) ( not ( = ?auto_19259 ?auto_19260 ) ) ( not ( = ?auto_19255 ?auto_19260 ) ) ( not ( = ?auto_19251 ?auto_19260 ) ) ( not ( = ?auto_19249 ?auto_19260 ) ) ( AVAILABLE ?auto_19250 ) ( IN ?auto_19258 ?auto_19247 ) )
    :subtasks
    ( ( !UNLOAD ?auto_19250 ?auto_19258 ?auto_19247 ?auto_19254 )
      ( MAKE-2CRATE ?auto_19261 ?auto_19245 ?auto_19246 )
      ( MAKE-1CRATE-VERIFY ?auto_19245 ?auto_19246 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19262 - SURFACE
      ?auto_19263 - SURFACE
      ?auto_19264 - SURFACE
    )
    :vars
    (
      ?auto_19268 - HOIST
      ?auto_19271 - PLACE
      ?auto_19270 - PLACE
      ?auto_19267 - HOIST
      ?auto_19273 - SURFACE
      ?auto_19274 - SURFACE
      ?auto_19269 - SURFACE
      ?auto_19265 - PLACE
      ?auto_19266 - HOIST
      ?auto_19275 - SURFACE
      ?auto_19278 - SURFACE
      ?auto_19277 - SURFACE
      ?auto_19276 - TRUCK
      ?auto_19272 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19268 ?auto_19271 ) ( IS-CRATE ?auto_19264 ) ( not ( = ?auto_19263 ?auto_19264 ) ) ( not ( = ?auto_19262 ?auto_19263 ) ) ( not ( = ?auto_19262 ?auto_19264 ) ) ( not ( = ?auto_19270 ?auto_19271 ) ) ( HOIST-AT ?auto_19267 ?auto_19270 ) ( not ( = ?auto_19268 ?auto_19267 ) ) ( SURFACE-AT ?auto_19264 ?auto_19270 ) ( ON ?auto_19264 ?auto_19273 ) ( CLEAR ?auto_19264 ) ( not ( = ?auto_19263 ?auto_19273 ) ) ( not ( = ?auto_19264 ?auto_19273 ) ) ( not ( = ?auto_19262 ?auto_19273 ) ) ( IS-CRATE ?auto_19263 ) ( SURFACE-AT ?auto_19263 ?auto_19270 ) ( ON ?auto_19263 ?auto_19274 ) ( CLEAR ?auto_19263 ) ( not ( = ?auto_19263 ?auto_19274 ) ) ( not ( = ?auto_19264 ?auto_19274 ) ) ( not ( = ?auto_19262 ?auto_19274 ) ) ( not ( = ?auto_19273 ?auto_19274 ) ) ( IS-CRATE ?auto_19262 ) ( not ( = ?auto_19269 ?auto_19262 ) ) ( not ( = ?auto_19263 ?auto_19269 ) ) ( not ( = ?auto_19264 ?auto_19269 ) ) ( not ( = ?auto_19273 ?auto_19269 ) ) ( not ( = ?auto_19274 ?auto_19269 ) ) ( not ( = ?auto_19265 ?auto_19271 ) ) ( not ( = ?auto_19270 ?auto_19265 ) ) ( HOIST-AT ?auto_19266 ?auto_19265 ) ( not ( = ?auto_19268 ?auto_19266 ) ) ( not ( = ?auto_19267 ?auto_19266 ) ) ( AVAILABLE ?auto_19266 ) ( SURFACE-AT ?auto_19262 ?auto_19265 ) ( ON ?auto_19262 ?auto_19275 ) ( CLEAR ?auto_19262 ) ( not ( = ?auto_19263 ?auto_19275 ) ) ( not ( = ?auto_19264 ?auto_19275 ) ) ( not ( = ?auto_19262 ?auto_19275 ) ) ( not ( = ?auto_19273 ?auto_19275 ) ) ( not ( = ?auto_19274 ?auto_19275 ) ) ( not ( = ?auto_19269 ?auto_19275 ) ) ( IS-CRATE ?auto_19269 ) ( not ( = ?auto_19278 ?auto_19269 ) ) ( not ( = ?auto_19263 ?auto_19278 ) ) ( not ( = ?auto_19264 ?auto_19278 ) ) ( not ( = ?auto_19262 ?auto_19278 ) ) ( not ( = ?auto_19273 ?auto_19278 ) ) ( not ( = ?auto_19274 ?auto_19278 ) ) ( not ( = ?auto_19275 ?auto_19278 ) ) ( AVAILABLE ?auto_19267 ) ( SURFACE-AT ?auto_19269 ?auto_19270 ) ( ON ?auto_19269 ?auto_19277 ) ( CLEAR ?auto_19269 ) ( not ( = ?auto_19263 ?auto_19277 ) ) ( not ( = ?auto_19264 ?auto_19277 ) ) ( not ( = ?auto_19262 ?auto_19277 ) ) ( not ( = ?auto_19273 ?auto_19277 ) ) ( not ( = ?auto_19274 ?auto_19277 ) ) ( not ( = ?auto_19269 ?auto_19277 ) ) ( not ( = ?auto_19275 ?auto_19277 ) ) ( not ( = ?auto_19278 ?auto_19277 ) ) ( TRUCK-AT ?auto_19276 ?auto_19271 ) ( SURFACE-AT ?auto_19272 ?auto_19271 ) ( CLEAR ?auto_19272 ) ( IS-CRATE ?auto_19278 ) ( not ( = ?auto_19272 ?auto_19278 ) ) ( not ( = ?auto_19263 ?auto_19272 ) ) ( not ( = ?auto_19264 ?auto_19272 ) ) ( not ( = ?auto_19262 ?auto_19272 ) ) ( not ( = ?auto_19273 ?auto_19272 ) ) ( not ( = ?auto_19274 ?auto_19272 ) ) ( not ( = ?auto_19269 ?auto_19272 ) ) ( not ( = ?auto_19275 ?auto_19272 ) ) ( not ( = ?auto_19277 ?auto_19272 ) ) ( AVAILABLE ?auto_19268 ) ( IN ?auto_19278 ?auto_19276 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19263 ?auto_19264 )
      ( MAKE-2CRATE-VERIFY ?auto_19262 ?auto_19263 ?auto_19264 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19279 - SURFACE
      ?auto_19280 - SURFACE
      ?auto_19281 - SURFACE
      ?auto_19282 - SURFACE
    )
    :vars
    (
      ?auto_19291 - HOIST
      ?auto_19286 - PLACE
      ?auto_19292 - PLACE
      ?auto_19287 - HOIST
      ?auto_19289 - SURFACE
      ?auto_19295 - SURFACE
      ?auto_19288 - PLACE
      ?auto_19285 - HOIST
      ?auto_19294 - SURFACE
      ?auto_19284 - SURFACE
      ?auto_19283 - SURFACE
      ?auto_19293 - TRUCK
      ?auto_19290 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19291 ?auto_19286 ) ( IS-CRATE ?auto_19282 ) ( not ( = ?auto_19281 ?auto_19282 ) ) ( not ( = ?auto_19280 ?auto_19281 ) ) ( not ( = ?auto_19280 ?auto_19282 ) ) ( not ( = ?auto_19292 ?auto_19286 ) ) ( HOIST-AT ?auto_19287 ?auto_19292 ) ( not ( = ?auto_19291 ?auto_19287 ) ) ( SURFACE-AT ?auto_19282 ?auto_19292 ) ( ON ?auto_19282 ?auto_19289 ) ( CLEAR ?auto_19282 ) ( not ( = ?auto_19281 ?auto_19289 ) ) ( not ( = ?auto_19282 ?auto_19289 ) ) ( not ( = ?auto_19280 ?auto_19289 ) ) ( IS-CRATE ?auto_19281 ) ( SURFACE-AT ?auto_19281 ?auto_19292 ) ( ON ?auto_19281 ?auto_19295 ) ( CLEAR ?auto_19281 ) ( not ( = ?auto_19281 ?auto_19295 ) ) ( not ( = ?auto_19282 ?auto_19295 ) ) ( not ( = ?auto_19280 ?auto_19295 ) ) ( not ( = ?auto_19289 ?auto_19295 ) ) ( IS-CRATE ?auto_19280 ) ( not ( = ?auto_19279 ?auto_19280 ) ) ( not ( = ?auto_19281 ?auto_19279 ) ) ( not ( = ?auto_19282 ?auto_19279 ) ) ( not ( = ?auto_19289 ?auto_19279 ) ) ( not ( = ?auto_19295 ?auto_19279 ) ) ( not ( = ?auto_19288 ?auto_19286 ) ) ( not ( = ?auto_19292 ?auto_19288 ) ) ( HOIST-AT ?auto_19285 ?auto_19288 ) ( not ( = ?auto_19291 ?auto_19285 ) ) ( not ( = ?auto_19287 ?auto_19285 ) ) ( AVAILABLE ?auto_19285 ) ( SURFACE-AT ?auto_19280 ?auto_19288 ) ( ON ?auto_19280 ?auto_19294 ) ( CLEAR ?auto_19280 ) ( not ( = ?auto_19281 ?auto_19294 ) ) ( not ( = ?auto_19282 ?auto_19294 ) ) ( not ( = ?auto_19280 ?auto_19294 ) ) ( not ( = ?auto_19289 ?auto_19294 ) ) ( not ( = ?auto_19295 ?auto_19294 ) ) ( not ( = ?auto_19279 ?auto_19294 ) ) ( IS-CRATE ?auto_19279 ) ( not ( = ?auto_19284 ?auto_19279 ) ) ( not ( = ?auto_19281 ?auto_19284 ) ) ( not ( = ?auto_19282 ?auto_19284 ) ) ( not ( = ?auto_19280 ?auto_19284 ) ) ( not ( = ?auto_19289 ?auto_19284 ) ) ( not ( = ?auto_19295 ?auto_19284 ) ) ( not ( = ?auto_19294 ?auto_19284 ) ) ( AVAILABLE ?auto_19287 ) ( SURFACE-AT ?auto_19279 ?auto_19292 ) ( ON ?auto_19279 ?auto_19283 ) ( CLEAR ?auto_19279 ) ( not ( = ?auto_19281 ?auto_19283 ) ) ( not ( = ?auto_19282 ?auto_19283 ) ) ( not ( = ?auto_19280 ?auto_19283 ) ) ( not ( = ?auto_19289 ?auto_19283 ) ) ( not ( = ?auto_19295 ?auto_19283 ) ) ( not ( = ?auto_19279 ?auto_19283 ) ) ( not ( = ?auto_19294 ?auto_19283 ) ) ( not ( = ?auto_19284 ?auto_19283 ) ) ( TRUCK-AT ?auto_19293 ?auto_19286 ) ( SURFACE-AT ?auto_19290 ?auto_19286 ) ( CLEAR ?auto_19290 ) ( IS-CRATE ?auto_19284 ) ( not ( = ?auto_19290 ?auto_19284 ) ) ( not ( = ?auto_19281 ?auto_19290 ) ) ( not ( = ?auto_19282 ?auto_19290 ) ) ( not ( = ?auto_19280 ?auto_19290 ) ) ( not ( = ?auto_19289 ?auto_19290 ) ) ( not ( = ?auto_19295 ?auto_19290 ) ) ( not ( = ?auto_19279 ?auto_19290 ) ) ( not ( = ?auto_19294 ?auto_19290 ) ) ( not ( = ?auto_19283 ?auto_19290 ) ) ( AVAILABLE ?auto_19291 ) ( IN ?auto_19284 ?auto_19293 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19280 ?auto_19281 ?auto_19282 )
      ( MAKE-3CRATE-VERIFY ?auto_19279 ?auto_19280 ?auto_19281 ?auto_19282 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19296 - SURFACE
      ?auto_19297 - SURFACE
      ?auto_19298 - SURFACE
      ?auto_19299 - SURFACE
      ?auto_19300 - SURFACE
    )
    :vars
    (
      ?auto_19308 - HOIST
      ?auto_19303 - PLACE
      ?auto_19309 - PLACE
      ?auto_19304 - HOIST
      ?auto_19306 - SURFACE
      ?auto_19312 - SURFACE
      ?auto_19305 - PLACE
      ?auto_19302 - HOIST
      ?auto_19311 - SURFACE
      ?auto_19301 - SURFACE
      ?auto_19310 - TRUCK
      ?auto_19307 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19308 ?auto_19303 ) ( IS-CRATE ?auto_19300 ) ( not ( = ?auto_19299 ?auto_19300 ) ) ( not ( = ?auto_19298 ?auto_19299 ) ) ( not ( = ?auto_19298 ?auto_19300 ) ) ( not ( = ?auto_19309 ?auto_19303 ) ) ( HOIST-AT ?auto_19304 ?auto_19309 ) ( not ( = ?auto_19308 ?auto_19304 ) ) ( SURFACE-AT ?auto_19300 ?auto_19309 ) ( ON ?auto_19300 ?auto_19306 ) ( CLEAR ?auto_19300 ) ( not ( = ?auto_19299 ?auto_19306 ) ) ( not ( = ?auto_19300 ?auto_19306 ) ) ( not ( = ?auto_19298 ?auto_19306 ) ) ( IS-CRATE ?auto_19299 ) ( SURFACE-AT ?auto_19299 ?auto_19309 ) ( ON ?auto_19299 ?auto_19312 ) ( CLEAR ?auto_19299 ) ( not ( = ?auto_19299 ?auto_19312 ) ) ( not ( = ?auto_19300 ?auto_19312 ) ) ( not ( = ?auto_19298 ?auto_19312 ) ) ( not ( = ?auto_19306 ?auto_19312 ) ) ( IS-CRATE ?auto_19298 ) ( not ( = ?auto_19297 ?auto_19298 ) ) ( not ( = ?auto_19299 ?auto_19297 ) ) ( not ( = ?auto_19300 ?auto_19297 ) ) ( not ( = ?auto_19306 ?auto_19297 ) ) ( not ( = ?auto_19312 ?auto_19297 ) ) ( not ( = ?auto_19305 ?auto_19303 ) ) ( not ( = ?auto_19309 ?auto_19305 ) ) ( HOIST-AT ?auto_19302 ?auto_19305 ) ( not ( = ?auto_19308 ?auto_19302 ) ) ( not ( = ?auto_19304 ?auto_19302 ) ) ( AVAILABLE ?auto_19302 ) ( SURFACE-AT ?auto_19298 ?auto_19305 ) ( ON ?auto_19298 ?auto_19311 ) ( CLEAR ?auto_19298 ) ( not ( = ?auto_19299 ?auto_19311 ) ) ( not ( = ?auto_19300 ?auto_19311 ) ) ( not ( = ?auto_19298 ?auto_19311 ) ) ( not ( = ?auto_19306 ?auto_19311 ) ) ( not ( = ?auto_19312 ?auto_19311 ) ) ( not ( = ?auto_19297 ?auto_19311 ) ) ( IS-CRATE ?auto_19297 ) ( not ( = ?auto_19296 ?auto_19297 ) ) ( not ( = ?auto_19299 ?auto_19296 ) ) ( not ( = ?auto_19300 ?auto_19296 ) ) ( not ( = ?auto_19298 ?auto_19296 ) ) ( not ( = ?auto_19306 ?auto_19296 ) ) ( not ( = ?auto_19312 ?auto_19296 ) ) ( not ( = ?auto_19311 ?auto_19296 ) ) ( AVAILABLE ?auto_19304 ) ( SURFACE-AT ?auto_19297 ?auto_19309 ) ( ON ?auto_19297 ?auto_19301 ) ( CLEAR ?auto_19297 ) ( not ( = ?auto_19299 ?auto_19301 ) ) ( not ( = ?auto_19300 ?auto_19301 ) ) ( not ( = ?auto_19298 ?auto_19301 ) ) ( not ( = ?auto_19306 ?auto_19301 ) ) ( not ( = ?auto_19312 ?auto_19301 ) ) ( not ( = ?auto_19297 ?auto_19301 ) ) ( not ( = ?auto_19311 ?auto_19301 ) ) ( not ( = ?auto_19296 ?auto_19301 ) ) ( TRUCK-AT ?auto_19310 ?auto_19303 ) ( SURFACE-AT ?auto_19307 ?auto_19303 ) ( CLEAR ?auto_19307 ) ( IS-CRATE ?auto_19296 ) ( not ( = ?auto_19307 ?auto_19296 ) ) ( not ( = ?auto_19299 ?auto_19307 ) ) ( not ( = ?auto_19300 ?auto_19307 ) ) ( not ( = ?auto_19298 ?auto_19307 ) ) ( not ( = ?auto_19306 ?auto_19307 ) ) ( not ( = ?auto_19312 ?auto_19307 ) ) ( not ( = ?auto_19297 ?auto_19307 ) ) ( not ( = ?auto_19311 ?auto_19307 ) ) ( not ( = ?auto_19301 ?auto_19307 ) ) ( AVAILABLE ?auto_19308 ) ( IN ?auto_19296 ?auto_19310 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19298 ?auto_19299 ?auto_19300 )
      ( MAKE-4CRATE-VERIFY ?auto_19296 ?auto_19297 ?auto_19298 ?auto_19299 ?auto_19300 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19313 - SURFACE
      ?auto_19314 - SURFACE
      ?auto_19315 - SURFACE
      ?auto_19316 - SURFACE
      ?auto_19317 - SURFACE
      ?auto_19318 - SURFACE
    )
    :vars
    (
      ?auto_19325 - HOIST
      ?auto_19321 - PLACE
      ?auto_19326 - PLACE
      ?auto_19322 - HOIST
      ?auto_19324 - SURFACE
      ?auto_19329 - SURFACE
      ?auto_19323 - PLACE
      ?auto_19320 - HOIST
      ?auto_19328 - SURFACE
      ?auto_19319 - SURFACE
      ?auto_19327 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19325 ?auto_19321 ) ( IS-CRATE ?auto_19318 ) ( not ( = ?auto_19317 ?auto_19318 ) ) ( not ( = ?auto_19316 ?auto_19317 ) ) ( not ( = ?auto_19316 ?auto_19318 ) ) ( not ( = ?auto_19326 ?auto_19321 ) ) ( HOIST-AT ?auto_19322 ?auto_19326 ) ( not ( = ?auto_19325 ?auto_19322 ) ) ( SURFACE-AT ?auto_19318 ?auto_19326 ) ( ON ?auto_19318 ?auto_19324 ) ( CLEAR ?auto_19318 ) ( not ( = ?auto_19317 ?auto_19324 ) ) ( not ( = ?auto_19318 ?auto_19324 ) ) ( not ( = ?auto_19316 ?auto_19324 ) ) ( IS-CRATE ?auto_19317 ) ( SURFACE-AT ?auto_19317 ?auto_19326 ) ( ON ?auto_19317 ?auto_19329 ) ( CLEAR ?auto_19317 ) ( not ( = ?auto_19317 ?auto_19329 ) ) ( not ( = ?auto_19318 ?auto_19329 ) ) ( not ( = ?auto_19316 ?auto_19329 ) ) ( not ( = ?auto_19324 ?auto_19329 ) ) ( IS-CRATE ?auto_19316 ) ( not ( = ?auto_19315 ?auto_19316 ) ) ( not ( = ?auto_19317 ?auto_19315 ) ) ( not ( = ?auto_19318 ?auto_19315 ) ) ( not ( = ?auto_19324 ?auto_19315 ) ) ( not ( = ?auto_19329 ?auto_19315 ) ) ( not ( = ?auto_19323 ?auto_19321 ) ) ( not ( = ?auto_19326 ?auto_19323 ) ) ( HOIST-AT ?auto_19320 ?auto_19323 ) ( not ( = ?auto_19325 ?auto_19320 ) ) ( not ( = ?auto_19322 ?auto_19320 ) ) ( AVAILABLE ?auto_19320 ) ( SURFACE-AT ?auto_19316 ?auto_19323 ) ( ON ?auto_19316 ?auto_19328 ) ( CLEAR ?auto_19316 ) ( not ( = ?auto_19317 ?auto_19328 ) ) ( not ( = ?auto_19318 ?auto_19328 ) ) ( not ( = ?auto_19316 ?auto_19328 ) ) ( not ( = ?auto_19324 ?auto_19328 ) ) ( not ( = ?auto_19329 ?auto_19328 ) ) ( not ( = ?auto_19315 ?auto_19328 ) ) ( IS-CRATE ?auto_19315 ) ( not ( = ?auto_19314 ?auto_19315 ) ) ( not ( = ?auto_19317 ?auto_19314 ) ) ( not ( = ?auto_19318 ?auto_19314 ) ) ( not ( = ?auto_19316 ?auto_19314 ) ) ( not ( = ?auto_19324 ?auto_19314 ) ) ( not ( = ?auto_19329 ?auto_19314 ) ) ( not ( = ?auto_19328 ?auto_19314 ) ) ( AVAILABLE ?auto_19322 ) ( SURFACE-AT ?auto_19315 ?auto_19326 ) ( ON ?auto_19315 ?auto_19319 ) ( CLEAR ?auto_19315 ) ( not ( = ?auto_19317 ?auto_19319 ) ) ( not ( = ?auto_19318 ?auto_19319 ) ) ( not ( = ?auto_19316 ?auto_19319 ) ) ( not ( = ?auto_19324 ?auto_19319 ) ) ( not ( = ?auto_19329 ?auto_19319 ) ) ( not ( = ?auto_19315 ?auto_19319 ) ) ( not ( = ?auto_19328 ?auto_19319 ) ) ( not ( = ?auto_19314 ?auto_19319 ) ) ( TRUCK-AT ?auto_19327 ?auto_19321 ) ( SURFACE-AT ?auto_19313 ?auto_19321 ) ( CLEAR ?auto_19313 ) ( IS-CRATE ?auto_19314 ) ( not ( = ?auto_19313 ?auto_19314 ) ) ( not ( = ?auto_19317 ?auto_19313 ) ) ( not ( = ?auto_19318 ?auto_19313 ) ) ( not ( = ?auto_19316 ?auto_19313 ) ) ( not ( = ?auto_19324 ?auto_19313 ) ) ( not ( = ?auto_19329 ?auto_19313 ) ) ( not ( = ?auto_19315 ?auto_19313 ) ) ( not ( = ?auto_19328 ?auto_19313 ) ) ( not ( = ?auto_19319 ?auto_19313 ) ) ( AVAILABLE ?auto_19325 ) ( IN ?auto_19314 ?auto_19327 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19316 ?auto_19317 ?auto_19318 )
      ( MAKE-5CRATE-VERIFY ?auto_19313 ?auto_19314 ?auto_19315 ?auto_19316 ?auto_19317 ?auto_19318 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19330 - SURFACE
      ?auto_19331 - SURFACE
    )
    :vars
    (
      ?auto_19340 - HOIST
      ?auto_19335 - PLACE
      ?auto_19341 - SURFACE
      ?auto_19343 - PLACE
      ?auto_19336 - HOIST
      ?auto_19338 - SURFACE
      ?auto_19346 - SURFACE
      ?auto_19342 - SURFACE
      ?auto_19337 - PLACE
      ?auto_19334 - HOIST
      ?auto_19345 - SURFACE
      ?auto_19333 - SURFACE
      ?auto_19332 - SURFACE
      ?auto_19339 - SURFACE
      ?auto_19344 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19340 ?auto_19335 ) ( IS-CRATE ?auto_19331 ) ( not ( = ?auto_19330 ?auto_19331 ) ) ( not ( = ?auto_19341 ?auto_19330 ) ) ( not ( = ?auto_19341 ?auto_19331 ) ) ( not ( = ?auto_19343 ?auto_19335 ) ) ( HOIST-AT ?auto_19336 ?auto_19343 ) ( not ( = ?auto_19340 ?auto_19336 ) ) ( SURFACE-AT ?auto_19331 ?auto_19343 ) ( ON ?auto_19331 ?auto_19338 ) ( CLEAR ?auto_19331 ) ( not ( = ?auto_19330 ?auto_19338 ) ) ( not ( = ?auto_19331 ?auto_19338 ) ) ( not ( = ?auto_19341 ?auto_19338 ) ) ( IS-CRATE ?auto_19330 ) ( SURFACE-AT ?auto_19330 ?auto_19343 ) ( ON ?auto_19330 ?auto_19346 ) ( CLEAR ?auto_19330 ) ( not ( = ?auto_19330 ?auto_19346 ) ) ( not ( = ?auto_19331 ?auto_19346 ) ) ( not ( = ?auto_19341 ?auto_19346 ) ) ( not ( = ?auto_19338 ?auto_19346 ) ) ( IS-CRATE ?auto_19341 ) ( not ( = ?auto_19342 ?auto_19341 ) ) ( not ( = ?auto_19330 ?auto_19342 ) ) ( not ( = ?auto_19331 ?auto_19342 ) ) ( not ( = ?auto_19338 ?auto_19342 ) ) ( not ( = ?auto_19346 ?auto_19342 ) ) ( not ( = ?auto_19337 ?auto_19335 ) ) ( not ( = ?auto_19343 ?auto_19337 ) ) ( HOIST-AT ?auto_19334 ?auto_19337 ) ( not ( = ?auto_19340 ?auto_19334 ) ) ( not ( = ?auto_19336 ?auto_19334 ) ) ( AVAILABLE ?auto_19334 ) ( SURFACE-AT ?auto_19341 ?auto_19337 ) ( ON ?auto_19341 ?auto_19345 ) ( CLEAR ?auto_19341 ) ( not ( = ?auto_19330 ?auto_19345 ) ) ( not ( = ?auto_19331 ?auto_19345 ) ) ( not ( = ?auto_19341 ?auto_19345 ) ) ( not ( = ?auto_19338 ?auto_19345 ) ) ( not ( = ?auto_19346 ?auto_19345 ) ) ( not ( = ?auto_19342 ?auto_19345 ) ) ( IS-CRATE ?auto_19342 ) ( not ( = ?auto_19333 ?auto_19342 ) ) ( not ( = ?auto_19330 ?auto_19333 ) ) ( not ( = ?auto_19331 ?auto_19333 ) ) ( not ( = ?auto_19341 ?auto_19333 ) ) ( not ( = ?auto_19338 ?auto_19333 ) ) ( not ( = ?auto_19346 ?auto_19333 ) ) ( not ( = ?auto_19345 ?auto_19333 ) ) ( AVAILABLE ?auto_19336 ) ( SURFACE-AT ?auto_19342 ?auto_19343 ) ( ON ?auto_19342 ?auto_19332 ) ( CLEAR ?auto_19342 ) ( not ( = ?auto_19330 ?auto_19332 ) ) ( not ( = ?auto_19331 ?auto_19332 ) ) ( not ( = ?auto_19341 ?auto_19332 ) ) ( not ( = ?auto_19338 ?auto_19332 ) ) ( not ( = ?auto_19346 ?auto_19332 ) ) ( not ( = ?auto_19342 ?auto_19332 ) ) ( not ( = ?auto_19345 ?auto_19332 ) ) ( not ( = ?auto_19333 ?auto_19332 ) ) ( SURFACE-AT ?auto_19339 ?auto_19335 ) ( CLEAR ?auto_19339 ) ( IS-CRATE ?auto_19333 ) ( not ( = ?auto_19339 ?auto_19333 ) ) ( not ( = ?auto_19330 ?auto_19339 ) ) ( not ( = ?auto_19331 ?auto_19339 ) ) ( not ( = ?auto_19341 ?auto_19339 ) ) ( not ( = ?auto_19338 ?auto_19339 ) ) ( not ( = ?auto_19346 ?auto_19339 ) ) ( not ( = ?auto_19342 ?auto_19339 ) ) ( not ( = ?auto_19345 ?auto_19339 ) ) ( not ( = ?auto_19332 ?auto_19339 ) ) ( AVAILABLE ?auto_19340 ) ( IN ?auto_19333 ?auto_19344 ) ( TRUCK-AT ?auto_19344 ?auto_19343 ) )
    :subtasks
    ( ( !DRIVE ?auto_19344 ?auto_19343 ?auto_19335 )
      ( MAKE-2CRATE ?auto_19341 ?auto_19330 ?auto_19331 )
      ( MAKE-1CRATE-VERIFY ?auto_19330 ?auto_19331 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19347 - SURFACE
      ?auto_19348 - SURFACE
      ?auto_19349 - SURFACE
    )
    :vars
    (
      ?auto_19350 - HOIST
      ?auto_19352 - PLACE
      ?auto_19360 - PLACE
      ?auto_19361 - HOIST
      ?auto_19354 - SURFACE
      ?auto_19363 - SURFACE
      ?auto_19357 - SURFACE
      ?auto_19358 - PLACE
      ?auto_19351 - HOIST
      ?auto_19362 - SURFACE
      ?auto_19353 - SURFACE
      ?auto_19356 - SURFACE
      ?auto_19359 - SURFACE
      ?auto_19355 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19350 ?auto_19352 ) ( IS-CRATE ?auto_19349 ) ( not ( = ?auto_19348 ?auto_19349 ) ) ( not ( = ?auto_19347 ?auto_19348 ) ) ( not ( = ?auto_19347 ?auto_19349 ) ) ( not ( = ?auto_19360 ?auto_19352 ) ) ( HOIST-AT ?auto_19361 ?auto_19360 ) ( not ( = ?auto_19350 ?auto_19361 ) ) ( SURFACE-AT ?auto_19349 ?auto_19360 ) ( ON ?auto_19349 ?auto_19354 ) ( CLEAR ?auto_19349 ) ( not ( = ?auto_19348 ?auto_19354 ) ) ( not ( = ?auto_19349 ?auto_19354 ) ) ( not ( = ?auto_19347 ?auto_19354 ) ) ( IS-CRATE ?auto_19348 ) ( SURFACE-AT ?auto_19348 ?auto_19360 ) ( ON ?auto_19348 ?auto_19363 ) ( CLEAR ?auto_19348 ) ( not ( = ?auto_19348 ?auto_19363 ) ) ( not ( = ?auto_19349 ?auto_19363 ) ) ( not ( = ?auto_19347 ?auto_19363 ) ) ( not ( = ?auto_19354 ?auto_19363 ) ) ( IS-CRATE ?auto_19347 ) ( not ( = ?auto_19357 ?auto_19347 ) ) ( not ( = ?auto_19348 ?auto_19357 ) ) ( not ( = ?auto_19349 ?auto_19357 ) ) ( not ( = ?auto_19354 ?auto_19357 ) ) ( not ( = ?auto_19363 ?auto_19357 ) ) ( not ( = ?auto_19358 ?auto_19352 ) ) ( not ( = ?auto_19360 ?auto_19358 ) ) ( HOIST-AT ?auto_19351 ?auto_19358 ) ( not ( = ?auto_19350 ?auto_19351 ) ) ( not ( = ?auto_19361 ?auto_19351 ) ) ( AVAILABLE ?auto_19351 ) ( SURFACE-AT ?auto_19347 ?auto_19358 ) ( ON ?auto_19347 ?auto_19362 ) ( CLEAR ?auto_19347 ) ( not ( = ?auto_19348 ?auto_19362 ) ) ( not ( = ?auto_19349 ?auto_19362 ) ) ( not ( = ?auto_19347 ?auto_19362 ) ) ( not ( = ?auto_19354 ?auto_19362 ) ) ( not ( = ?auto_19363 ?auto_19362 ) ) ( not ( = ?auto_19357 ?auto_19362 ) ) ( IS-CRATE ?auto_19357 ) ( not ( = ?auto_19353 ?auto_19357 ) ) ( not ( = ?auto_19348 ?auto_19353 ) ) ( not ( = ?auto_19349 ?auto_19353 ) ) ( not ( = ?auto_19347 ?auto_19353 ) ) ( not ( = ?auto_19354 ?auto_19353 ) ) ( not ( = ?auto_19363 ?auto_19353 ) ) ( not ( = ?auto_19362 ?auto_19353 ) ) ( AVAILABLE ?auto_19361 ) ( SURFACE-AT ?auto_19357 ?auto_19360 ) ( ON ?auto_19357 ?auto_19356 ) ( CLEAR ?auto_19357 ) ( not ( = ?auto_19348 ?auto_19356 ) ) ( not ( = ?auto_19349 ?auto_19356 ) ) ( not ( = ?auto_19347 ?auto_19356 ) ) ( not ( = ?auto_19354 ?auto_19356 ) ) ( not ( = ?auto_19363 ?auto_19356 ) ) ( not ( = ?auto_19357 ?auto_19356 ) ) ( not ( = ?auto_19362 ?auto_19356 ) ) ( not ( = ?auto_19353 ?auto_19356 ) ) ( SURFACE-AT ?auto_19359 ?auto_19352 ) ( CLEAR ?auto_19359 ) ( IS-CRATE ?auto_19353 ) ( not ( = ?auto_19359 ?auto_19353 ) ) ( not ( = ?auto_19348 ?auto_19359 ) ) ( not ( = ?auto_19349 ?auto_19359 ) ) ( not ( = ?auto_19347 ?auto_19359 ) ) ( not ( = ?auto_19354 ?auto_19359 ) ) ( not ( = ?auto_19363 ?auto_19359 ) ) ( not ( = ?auto_19357 ?auto_19359 ) ) ( not ( = ?auto_19362 ?auto_19359 ) ) ( not ( = ?auto_19356 ?auto_19359 ) ) ( AVAILABLE ?auto_19350 ) ( IN ?auto_19353 ?auto_19355 ) ( TRUCK-AT ?auto_19355 ?auto_19360 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19348 ?auto_19349 )
      ( MAKE-2CRATE-VERIFY ?auto_19347 ?auto_19348 ?auto_19349 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19364 - SURFACE
      ?auto_19365 - SURFACE
      ?auto_19366 - SURFACE
      ?auto_19367 - SURFACE
    )
    :vars
    (
      ?auto_19370 - HOIST
      ?auto_19369 - PLACE
      ?auto_19368 - PLACE
      ?auto_19373 - HOIST
      ?auto_19379 - SURFACE
      ?auto_19371 - SURFACE
      ?auto_19380 - PLACE
      ?auto_19377 - HOIST
      ?auto_19376 - SURFACE
      ?auto_19378 - SURFACE
      ?auto_19375 - SURFACE
      ?auto_19374 - SURFACE
      ?auto_19372 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19370 ?auto_19369 ) ( IS-CRATE ?auto_19367 ) ( not ( = ?auto_19366 ?auto_19367 ) ) ( not ( = ?auto_19365 ?auto_19366 ) ) ( not ( = ?auto_19365 ?auto_19367 ) ) ( not ( = ?auto_19368 ?auto_19369 ) ) ( HOIST-AT ?auto_19373 ?auto_19368 ) ( not ( = ?auto_19370 ?auto_19373 ) ) ( SURFACE-AT ?auto_19367 ?auto_19368 ) ( ON ?auto_19367 ?auto_19379 ) ( CLEAR ?auto_19367 ) ( not ( = ?auto_19366 ?auto_19379 ) ) ( not ( = ?auto_19367 ?auto_19379 ) ) ( not ( = ?auto_19365 ?auto_19379 ) ) ( IS-CRATE ?auto_19366 ) ( SURFACE-AT ?auto_19366 ?auto_19368 ) ( ON ?auto_19366 ?auto_19371 ) ( CLEAR ?auto_19366 ) ( not ( = ?auto_19366 ?auto_19371 ) ) ( not ( = ?auto_19367 ?auto_19371 ) ) ( not ( = ?auto_19365 ?auto_19371 ) ) ( not ( = ?auto_19379 ?auto_19371 ) ) ( IS-CRATE ?auto_19365 ) ( not ( = ?auto_19364 ?auto_19365 ) ) ( not ( = ?auto_19366 ?auto_19364 ) ) ( not ( = ?auto_19367 ?auto_19364 ) ) ( not ( = ?auto_19379 ?auto_19364 ) ) ( not ( = ?auto_19371 ?auto_19364 ) ) ( not ( = ?auto_19380 ?auto_19369 ) ) ( not ( = ?auto_19368 ?auto_19380 ) ) ( HOIST-AT ?auto_19377 ?auto_19380 ) ( not ( = ?auto_19370 ?auto_19377 ) ) ( not ( = ?auto_19373 ?auto_19377 ) ) ( AVAILABLE ?auto_19377 ) ( SURFACE-AT ?auto_19365 ?auto_19380 ) ( ON ?auto_19365 ?auto_19376 ) ( CLEAR ?auto_19365 ) ( not ( = ?auto_19366 ?auto_19376 ) ) ( not ( = ?auto_19367 ?auto_19376 ) ) ( not ( = ?auto_19365 ?auto_19376 ) ) ( not ( = ?auto_19379 ?auto_19376 ) ) ( not ( = ?auto_19371 ?auto_19376 ) ) ( not ( = ?auto_19364 ?auto_19376 ) ) ( IS-CRATE ?auto_19364 ) ( not ( = ?auto_19378 ?auto_19364 ) ) ( not ( = ?auto_19366 ?auto_19378 ) ) ( not ( = ?auto_19367 ?auto_19378 ) ) ( not ( = ?auto_19365 ?auto_19378 ) ) ( not ( = ?auto_19379 ?auto_19378 ) ) ( not ( = ?auto_19371 ?auto_19378 ) ) ( not ( = ?auto_19376 ?auto_19378 ) ) ( AVAILABLE ?auto_19373 ) ( SURFACE-AT ?auto_19364 ?auto_19368 ) ( ON ?auto_19364 ?auto_19375 ) ( CLEAR ?auto_19364 ) ( not ( = ?auto_19366 ?auto_19375 ) ) ( not ( = ?auto_19367 ?auto_19375 ) ) ( not ( = ?auto_19365 ?auto_19375 ) ) ( not ( = ?auto_19379 ?auto_19375 ) ) ( not ( = ?auto_19371 ?auto_19375 ) ) ( not ( = ?auto_19364 ?auto_19375 ) ) ( not ( = ?auto_19376 ?auto_19375 ) ) ( not ( = ?auto_19378 ?auto_19375 ) ) ( SURFACE-AT ?auto_19374 ?auto_19369 ) ( CLEAR ?auto_19374 ) ( IS-CRATE ?auto_19378 ) ( not ( = ?auto_19374 ?auto_19378 ) ) ( not ( = ?auto_19366 ?auto_19374 ) ) ( not ( = ?auto_19367 ?auto_19374 ) ) ( not ( = ?auto_19365 ?auto_19374 ) ) ( not ( = ?auto_19379 ?auto_19374 ) ) ( not ( = ?auto_19371 ?auto_19374 ) ) ( not ( = ?auto_19364 ?auto_19374 ) ) ( not ( = ?auto_19376 ?auto_19374 ) ) ( not ( = ?auto_19375 ?auto_19374 ) ) ( AVAILABLE ?auto_19370 ) ( IN ?auto_19378 ?auto_19372 ) ( TRUCK-AT ?auto_19372 ?auto_19368 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19365 ?auto_19366 ?auto_19367 )
      ( MAKE-3CRATE-VERIFY ?auto_19364 ?auto_19365 ?auto_19366 ?auto_19367 ) )
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
      ?auto_19388 - HOIST
      ?auto_19387 - PLACE
      ?auto_19386 - PLACE
      ?auto_19391 - HOIST
      ?auto_19396 - SURFACE
      ?auto_19389 - SURFACE
      ?auto_19397 - PLACE
      ?auto_19395 - HOIST
      ?auto_19394 - SURFACE
      ?auto_19393 - SURFACE
      ?auto_19392 - SURFACE
      ?auto_19390 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19388 ?auto_19387 ) ( IS-CRATE ?auto_19385 ) ( not ( = ?auto_19384 ?auto_19385 ) ) ( not ( = ?auto_19383 ?auto_19384 ) ) ( not ( = ?auto_19383 ?auto_19385 ) ) ( not ( = ?auto_19386 ?auto_19387 ) ) ( HOIST-AT ?auto_19391 ?auto_19386 ) ( not ( = ?auto_19388 ?auto_19391 ) ) ( SURFACE-AT ?auto_19385 ?auto_19386 ) ( ON ?auto_19385 ?auto_19396 ) ( CLEAR ?auto_19385 ) ( not ( = ?auto_19384 ?auto_19396 ) ) ( not ( = ?auto_19385 ?auto_19396 ) ) ( not ( = ?auto_19383 ?auto_19396 ) ) ( IS-CRATE ?auto_19384 ) ( SURFACE-AT ?auto_19384 ?auto_19386 ) ( ON ?auto_19384 ?auto_19389 ) ( CLEAR ?auto_19384 ) ( not ( = ?auto_19384 ?auto_19389 ) ) ( not ( = ?auto_19385 ?auto_19389 ) ) ( not ( = ?auto_19383 ?auto_19389 ) ) ( not ( = ?auto_19396 ?auto_19389 ) ) ( IS-CRATE ?auto_19383 ) ( not ( = ?auto_19382 ?auto_19383 ) ) ( not ( = ?auto_19384 ?auto_19382 ) ) ( not ( = ?auto_19385 ?auto_19382 ) ) ( not ( = ?auto_19396 ?auto_19382 ) ) ( not ( = ?auto_19389 ?auto_19382 ) ) ( not ( = ?auto_19397 ?auto_19387 ) ) ( not ( = ?auto_19386 ?auto_19397 ) ) ( HOIST-AT ?auto_19395 ?auto_19397 ) ( not ( = ?auto_19388 ?auto_19395 ) ) ( not ( = ?auto_19391 ?auto_19395 ) ) ( AVAILABLE ?auto_19395 ) ( SURFACE-AT ?auto_19383 ?auto_19397 ) ( ON ?auto_19383 ?auto_19394 ) ( CLEAR ?auto_19383 ) ( not ( = ?auto_19384 ?auto_19394 ) ) ( not ( = ?auto_19385 ?auto_19394 ) ) ( not ( = ?auto_19383 ?auto_19394 ) ) ( not ( = ?auto_19396 ?auto_19394 ) ) ( not ( = ?auto_19389 ?auto_19394 ) ) ( not ( = ?auto_19382 ?auto_19394 ) ) ( IS-CRATE ?auto_19382 ) ( not ( = ?auto_19381 ?auto_19382 ) ) ( not ( = ?auto_19384 ?auto_19381 ) ) ( not ( = ?auto_19385 ?auto_19381 ) ) ( not ( = ?auto_19383 ?auto_19381 ) ) ( not ( = ?auto_19396 ?auto_19381 ) ) ( not ( = ?auto_19389 ?auto_19381 ) ) ( not ( = ?auto_19394 ?auto_19381 ) ) ( AVAILABLE ?auto_19391 ) ( SURFACE-AT ?auto_19382 ?auto_19386 ) ( ON ?auto_19382 ?auto_19393 ) ( CLEAR ?auto_19382 ) ( not ( = ?auto_19384 ?auto_19393 ) ) ( not ( = ?auto_19385 ?auto_19393 ) ) ( not ( = ?auto_19383 ?auto_19393 ) ) ( not ( = ?auto_19396 ?auto_19393 ) ) ( not ( = ?auto_19389 ?auto_19393 ) ) ( not ( = ?auto_19382 ?auto_19393 ) ) ( not ( = ?auto_19394 ?auto_19393 ) ) ( not ( = ?auto_19381 ?auto_19393 ) ) ( SURFACE-AT ?auto_19392 ?auto_19387 ) ( CLEAR ?auto_19392 ) ( IS-CRATE ?auto_19381 ) ( not ( = ?auto_19392 ?auto_19381 ) ) ( not ( = ?auto_19384 ?auto_19392 ) ) ( not ( = ?auto_19385 ?auto_19392 ) ) ( not ( = ?auto_19383 ?auto_19392 ) ) ( not ( = ?auto_19396 ?auto_19392 ) ) ( not ( = ?auto_19389 ?auto_19392 ) ) ( not ( = ?auto_19382 ?auto_19392 ) ) ( not ( = ?auto_19394 ?auto_19392 ) ) ( not ( = ?auto_19393 ?auto_19392 ) ) ( AVAILABLE ?auto_19388 ) ( IN ?auto_19381 ?auto_19390 ) ( TRUCK-AT ?auto_19390 ?auto_19386 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19383 ?auto_19384 ?auto_19385 )
      ( MAKE-4CRATE-VERIFY ?auto_19381 ?auto_19382 ?auto_19383 ?auto_19384 ?auto_19385 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19398 - SURFACE
      ?auto_19399 - SURFACE
      ?auto_19400 - SURFACE
      ?auto_19401 - SURFACE
      ?auto_19402 - SURFACE
      ?auto_19403 - SURFACE
    )
    :vars
    (
      ?auto_19406 - HOIST
      ?auto_19405 - PLACE
      ?auto_19404 - PLACE
      ?auto_19409 - HOIST
      ?auto_19413 - SURFACE
      ?auto_19407 - SURFACE
      ?auto_19414 - PLACE
      ?auto_19412 - HOIST
      ?auto_19411 - SURFACE
      ?auto_19410 - SURFACE
      ?auto_19408 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19406 ?auto_19405 ) ( IS-CRATE ?auto_19403 ) ( not ( = ?auto_19402 ?auto_19403 ) ) ( not ( = ?auto_19401 ?auto_19402 ) ) ( not ( = ?auto_19401 ?auto_19403 ) ) ( not ( = ?auto_19404 ?auto_19405 ) ) ( HOIST-AT ?auto_19409 ?auto_19404 ) ( not ( = ?auto_19406 ?auto_19409 ) ) ( SURFACE-AT ?auto_19403 ?auto_19404 ) ( ON ?auto_19403 ?auto_19413 ) ( CLEAR ?auto_19403 ) ( not ( = ?auto_19402 ?auto_19413 ) ) ( not ( = ?auto_19403 ?auto_19413 ) ) ( not ( = ?auto_19401 ?auto_19413 ) ) ( IS-CRATE ?auto_19402 ) ( SURFACE-AT ?auto_19402 ?auto_19404 ) ( ON ?auto_19402 ?auto_19407 ) ( CLEAR ?auto_19402 ) ( not ( = ?auto_19402 ?auto_19407 ) ) ( not ( = ?auto_19403 ?auto_19407 ) ) ( not ( = ?auto_19401 ?auto_19407 ) ) ( not ( = ?auto_19413 ?auto_19407 ) ) ( IS-CRATE ?auto_19401 ) ( not ( = ?auto_19400 ?auto_19401 ) ) ( not ( = ?auto_19402 ?auto_19400 ) ) ( not ( = ?auto_19403 ?auto_19400 ) ) ( not ( = ?auto_19413 ?auto_19400 ) ) ( not ( = ?auto_19407 ?auto_19400 ) ) ( not ( = ?auto_19414 ?auto_19405 ) ) ( not ( = ?auto_19404 ?auto_19414 ) ) ( HOIST-AT ?auto_19412 ?auto_19414 ) ( not ( = ?auto_19406 ?auto_19412 ) ) ( not ( = ?auto_19409 ?auto_19412 ) ) ( AVAILABLE ?auto_19412 ) ( SURFACE-AT ?auto_19401 ?auto_19414 ) ( ON ?auto_19401 ?auto_19411 ) ( CLEAR ?auto_19401 ) ( not ( = ?auto_19402 ?auto_19411 ) ) ( not ( = ?auto_19403 ?auto_19411 ) ) ( not ( = ?auto_19401 ?auto_19411 ) ) ( not ( = ?auto_19413 ?auto_19411 ) ) ( not ( = ?auto_19407 ?auto_19411 ) ) ( not ( = ?auto_19400 ?auto_19411 ) ) ( IS-CRATE ?auto_19400 ) ( not ( = ?auto_19399 ?auto_19400 ) ) ( not ( = ?auto_19402 ?auto_19399 ) ) ( not ( = ?auto_19403 ?auto_19399 ) ) ( not ( = ?auto_19401 ?auto_19399 ) ) ( not ( = ?auto_19413 ?auto_19399 ) ) ( not ( = ?auto_19407 ?auto_19399 ) ) ( not ( = ?auto_19411 ?auto_19399 ) ) ( AVAILABLE ?auto_19409 ) ( SURFACE-AT ?auto_19400 ?auto_19404 ) ( ON ?auto_19400 ?auto_19410 ) ( CLEAR ?auto_19400 ) ( not ( = ?auto_19402 ?auto_19410 ) ) ( not ( = ?auto_19403 ?auto_19410 ) ) ( not ( = ?auto_19401 ?auto_19410 ) ) ( not ( = ?auto_19413 ?auto_19410 ) ) ( not ( = ?auto_19407 ?auto_19410 ) ) ( not ( = ?auto_19400 ?auto_19410 ) ) ( not ( = ?auto_19411 ?auto_19410 ) ) ( not ( = ?auto_19399 ?auto_19410 ) ) ( SURFACE-AT ?auto_19398 ?auto_19405 ) ( CLEAR ?auto_19398 ) ( IS-CRATE ?auto_19399 ) ( not ( = ?auto_19398 ?auto_19399 ) ) ( not ( = ?auto_19402 ?auto_19398 ) ) ( not ( = ?auto_19403 ?auto_19398 ) ) ( not ( = ?auto_19401 ?auto_19398 ) ) ( not ( = ?auto_19413 ?auto_19398 ) ) ( not ( = ?auto_19407 ?auto_19398 ) ) ( not ( = ?auto_19400 ?auto_19398 ) ) ( not ( = ?auto_19411 ?auto_19398 ) ) ( not ( = ?auto_19410 ?auto_19398 ) ) ( AVAILABLE ?auto_19406 ) ( IN ?auto_19399 ?auto_19408 ) ( TRUCK-AT ?auto_19408 ?auto_19404 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19401 ?auto_19402 ?auto_19403 )
      ( MAKE-5CRATE-VERIFY ?auto_19398 ?auto_19399 ?auto_19400 ?auto_19401 ?auto_19402 ?auto_19403 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19415 - SURFACE
      ?auto_19416 - SURFACE
    )
    :vars
    (
      ?auto_19419 - HOIST
      ?auto_19418 - PLACE
      ?auto_19428 - SURFACE
      ?auto_19417 - PLACE
      ?auto_19422 - HOIST
      ?auto_19430 - SURFACE
      ?auto_19420 - SURFACE
      ?auto_19429 - SURFACE
      ?auto_19431 - PLACE
      ?auto_19426 - HOIST
      ?auto_19425 - SURFACE
      ?auto_19427 - SURFACE
      ?auto_19424 - SURFACE
      ?auto_19423 - SURFACE
      ?auto_19421 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19419 ?auto_19418 ) ( IS-CRATE ?auto_19416 ) ( not ( = ?auto_19415 ?auto_19416 ) ) ( not ( = ?auto_19428 ?auto_19415 ) ) ( not ( = ?auto_19428 ?auto_19416 ) ) ( not ( = ?auto_19417 ?auto_19418 ) ) ( HOIST-AT ?auto_19422 ?auto_19417 ) ( not ( = ?auto_19419 ?auto_19422 ) ) ( SURFACE-AT ?auto_19416 ?auto_19417 ) ( ON ?auto_19416 ?auto_19430 ) ( CLEAR ?auto_19416 ) ( not ( = ?auto_19415 ?auto_19430 ) ) ( not ( = ?auto_19416 ?auto_19430 ) ) ( not ( = ?auto_19428 ?auto_19430 ) ) ( IS-CRATE ?auto_19415 ) ( SURFACE-AT ?auto_19415 ?auto_19417 ) ( ON ?auto_19415 ?auto_19420 ) ( CLEAR ?auto_19415 ) ( not ( = ?auto_19415 ?auto_19420 ) ) ( not ( = ?auto_19416 ?auto_19420 ) ) ( not ( = ?auto_19428 ?auto_19420 ) ) ( not ( = ?auto_19430 ?auto_19420 ) ) ( IS-CRATE ?auto_19428 ) ( not ( = ?auto_19429 ?auto_19428 ) ) ( not ( = ?auto_19415 ?auto_19429 ) ) ( not ( = ?auto_19416 ?auto_19429 ) ) ( not ( = ?auto_19430 ?auto_19429 ) ) ( not ( = ?auto_19420 ?auto_19429 ) ) ( not ( = ?auto_19431 ?auto_19418 ) ) ( not ( = ?auto_19417 ?auto_19431 ) ) ( HOIST-AT ?auto_19426 ?auto_19431 ) ( not ( = ?auto_19419 ?auto_19426 ) ) ( not ( = ?auto_19422 ?auto_19426 ) ) ( AVAILABLE ?auto_19426 ) ( SURFACE-AT ?auto_19428 ?auto_19431 ) ( ON ?auto_19428 ?auto_19425 ) ( CLEAR ?auto_19428 ) ( not ( = ?auto_19415 ?auto_19425 ) ) ( not ( = ?auto_19416 ?auto_19425 ) ) ( not ( = ?auto_19428 ?auto_19425 ) ) ( not ( = ?auto_19430 ?auto_19425 ) ) ( not ( = ?auto_19420 ?auto_19425 ) ) ( not ( = ?auto_19429 ?auto_19425 ) ) ( IS-CRATE ?auto_19429 ) ( not ( = ?auto_19427 ?auto_19429 ) ) ( not ( = ?auto_19415 ?auto_19427 ) ) ( not ( = ?auto_19416 ?auto_19427 ) ) ( not ( = ?auto_19428 ?auto_19427 ) ) ( not ( = ?auto_19430 ?auto_19427 ) ) ( not ( = ?auto_19420 ?auto_19427 ) ) ( not ( = ?auto_19425 ?auto_19427 ) ) ( SURFACE-AT ?auto_19429 ?auto_19417 ) ( ON ?auto_19429 ?auto_19424 ) ( CLEAR ?auto_19429 ) ( not ( = ?auto_19415 ?auto_19424 ) ) ( not ( = ?auto_19416 ?auto_19424 ) ) ( not ( = ?auto_19428 ?auto_19424 ) ) ( not ( = ?auto_19430 ?auto_19424 ) ) ( not ( = ?auto_19420 ?auto_19424 ) ) ( not ( = ?auto_19429 ?auto_19424 ) ) ( not ( = ?auto_19425 ?auto_19424 ) ) ( not ( = ?auto_19427 ?auto_19424 ) ) ( SURFACE-AT ?auto_19423 ?auto_19418 ) ( CLEAR ?auto_19423 ) ( IS-CRATE ?auto_19427 ) ( not ( = ?auto_19423 ?auto_19427 ) ) ( not ( = ?auto_19415 ?auto_19423 ) ) ( not ( = ?auto_19416 ?auto_19423 ) ) ( not ( = ?auto_19428 ?auto_19423 ) ) ( not ( = ?auto_19430 ?auto_19423 ) ) ( not ( = ?auto_19420 ?auto_19423 ) ) ( not ( = ?auto_19429 ?auto_19423 ) ) ( not ( = ?auto_19425 ?auto_19423 ) ) ( not ( = ?auto_19424 ?auto_19423 ) ) ( AVAILABLE ?auto_19419 ) ( TRUCK-AT ?auto_19421 ?auto_19417 ) ( LIFTING ?auto_19422 ?auto_19427 ) )
    :subtasks
    ( ( !LOAD ?auto_19422 ?auto_19427 ?auto_19421 ?auto_19417 )
      ( MAKE-2CRATE ?auto_19428 ?auto_19415 ?auto_19416 )
      ( MAKE-1CRATE-VERIFY ?auto_19415 ?auto_19416 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19432 - SURFACE
      ?auto_19433 - SURFACE
      ?auto_19434 - SURFACE
    )
    :vars
    (
      ?auto_19437 - HOIST
      ?auto_19438 - PLACE
      ?auto_19445 - PLACE
      ?auto_19448 - HOIST
      ?auto_19436 - SURFACE
      ?auto_19442 - SURFACE
      ?auto_19441 - SURFACE
      ?auto_19440 - PLACE
      ?auto_19439 - HOIST
      ?auto_19446 - SURFACE
      ?auto_19435 - SURFACE
      ?auto_19444 - SURFACE
      ?auto_19443 - SURFACE
      ?auto_19447 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19437 ?auto_19438 ) ( IS-CRATE ?auto_19434 ) ( not ( = ?auto_19433 ?auto_19434 ) ) ( not ( = ?auto_19432 ?auto_19433 ) ) ( not ( = ?auto_19432 ?auto_19434 ) ) ( not ( = ?auto_19445 ?auto_19438 ) ) ( HOIST-AT ?auto_19448 ?auto_19445 ) ( not ( = ?auto_19437 ?auto_19448 ) ) ( SURFACE-AT ?auto_19434 ?auto_19445 ) ( ON ?auto_19434 ?auto_19436 ) ( CLEAR ?auto_19434 ) ( not ( = ?auto_19433 ?auto_19436 ) ) ( not ( = ?auto_19434 ?auto_19436 ) ) ( not ( = ?auto_19432 ?auto_19436 ) ) ( IS-CRATE ?auto_19433 ) ( SURFACE-AT ?auto_19433 ?auto_19445 ) ( ON ?auto_19433 ?auto_19442 ) ( CLEAR ?auto_19433 ) ( not ( = ?auto_19433 ?auto_19442 ) ) ( not ( = ?auto_19434 ?auto_19442 ) ) ( not ( = ?auto_19432 ?auto_19442 ) ) ( not ( = ?auto_19436 ?auto_19442 ) ) ( IS-CRATE ?auto_19432 ) ( not ( = ?auto_19441 ?auto_19432 ) ) ( not ( = ?auto_19433 ?auto_19441 ) ) ( not ( = ?auto_19434 ?auto_19441 ) ) ( not ( = ?auto_19436 ?auto_19441 ) ) ( not ( = ?auto_19442 ?auto_19441 ) ) ( not ( = ?auto_19440 ?auto_19438 ) ) ( not ( = ?auto_19445 ?auto_19440 ) ) ( HOIST-AT ?auto_19439 ?auto_19440 ) ( not ( = ?auto_19437 ?auto_19439 ) ) ( not ( = ?auto_19448 ?auto_19439 ) ) ( AVAILABLE ?auto_19439 ) ( SURFACE-AT ?auto_19432 ?auto_19440 ) ( ON ?auto_19432 ?auto_19446 ) ( CLEAR ?auto_19432 ) ( not ( = ?auto_19433 ?auto_19446 ) ) ( not ( = ?auto_19434 ?auto_19446 ) ) ( not ( = ?auto_19432 ?auto_19446 ) ) ( not ( = ?auto_19436 ?auto_19446 ) ) ( not ( = ?auto_19442 ?auto_19446 ) ) ( not ( = ?auto_19441 ?auto_19446 ) ) ( IS-CRATE ?auto_19441 ) ( not ( = ?auto_19435 ?auto_19441 ) ) ( not ( = ?auto_19433 ?auto_19435 ) ) ( not ( = ?auto_19434 ?auto_19435 ) ) ( not ( = ?auto_19432 ?auto_19435 ) ) ( not ( = ?auto_19436 ?auto_19435 ) ) ( not ( = ?auto_19442 ?auto_19435 ) ) ( not ( = ?auto_19446 ?auto_19435 ) ) ( SURFACE-AT ?auto_19441 ?auto_19445 ) ( ON ?auto_19441 ?auto_19444 ) ( CLEAR ?auto_19441 ) ( not ( = ?auto_19433 ?auto_19444 ) ) ( not ( = ?auto_19434 ?auto_19444 ) ) ( not ( = ?auto_19432 ?auto_19444 ) ) ( not ( = ?auto_19436 ?auto_19444 ) ) ( not ( = ?auto_19442 ?auto_19444 ) ) ( not ( = ?auto_19441 ?auto_19444 ) ) ( not ( = ?auto_19446 ?auto_19444 ) ) ( not ( = ?auto_19435 ?auto_19444 ) ) ( SURFACE-AT ?auto_19443 ?auto_19438 ) ( CLEAR ?auto_19443 ) ( IS-CRATE ?auto_19435 ) ( not ( = ?auto_19443 ?auto_19435 ) ) ( not ( = ?auto_19433 ?auto_19443 ) ) ( not ( = ?auto_19434 ?auto_19443 ) ) ( not ( = ?auto_19432 ?auto_19443 ) ) ( not ( = ?auto_19436 ?auto_19443 ) ) ( not ( = ?auto_19442 ?auto_19443 ) ) ( not ( = ?auto_19441 ?auto_19443 ) ) ( not ( = ?auto_19446 ?auto_19443 ) ) ( not ( = ?auto_19444 ?auto_19443 ) ) ( AVAILABLE ?auto_19437 ) ( TRUCK-AT ?auto_19447 ?auto_19445 ) ( LIFTING ?auto_19448 ?auto_19435 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19433 ?auto_19434 )
      ( MAKE-2CRATE-VERIFY ?auto_19432 ?auto_19433 ?auto_19434 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19449 - SURFACE
      ?auto_19450 - SURFACE
      ?auto_19451 - SURFACE
      ?auto_19452 - SURFACE
    )
    :vars
    (
      ?auto_19459 - HOIST
      ?auto_19456 - PLACE
      ?auto_19454 - PLACE
      ?auto_19461 - HOIST
      ?auto_19453 - SURFACE
      ?auto_19458 - SURFACE
      ?auto_19463 - PLACE
      ?auto_19462 - HOIST
      ?auto_19457 - SURFACE
      ?auto_19464 - SURFACE
      ?auto_19455 - SURFACE
      ?auto_19460 - SURFACE
      ?auto_19465 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19459 ?auto_19456 ) ( IS-CRATE ?auto_19452 ) ( not ( = ?auto_19451 ?auto_19452 ) ) ( not ( = ?auto_19450 ?auto_19451 ) ) ( not ( = ?auto_19450 ?auto_19452 ) ) ( not ( = ?auto_19454 ?auto_19456 ) ) ( HOIST-AT ?auto_19461 ?auto_19454 ) ( not ( = ?auto_19459 ?auto_19461 ) ) ( SURFACE-AT ?auto_19452 ?auto_19454 ) ( ON ?auto_19452 ?auto_19453 ) ( CLEAR ?auto_19452 ) ( not ( = ?auto_19451 ?auto_19453 ) ) ( not ( = ?auto_19452 ?auto_19453 ) ) ( not ( = ?auto_19450 ?auto_19453 ) ) ( IS-CRATE ?auto_19451 ) ( SURFACE-AT ?auto_19451 ?auto_19454 ) ( ON ?auto_19451 ?auto_19458 ) ( CLEAR ?auto_19451 ) ( not ( = ?auto_19451 ?auto_19458 ) ) ( not ( = ?auto_19452 ?auto_19458 ) ) ( not ( = ?auto_19450 ?auto_19458 ) ) ( not ( = ?auto_19453 ?auto_19458 ) ) ( IS-CRATE ?auto_19450 ) ( not ( = ?auto_19449 ?auto_19450 ) ) ( not ( = ?auto_19451 ?auto_19449 ) ) ( not ( = ?auto_19452 ?auto_19449 ) ) ( not ( = ?auto_19453 ?auto_19449 ) ) ( not ( = ?auto_19458 ?auto_19449 ) ) ( not ( = ?auto_19463 ?auto_19456 ) ) ( not ( = ?auto_19454 ?auto_19463 ) ) ( HOIST-AT ?auto_19462 ?auto_19463 ) ( not ( = ?auto_19459 ?auto_19462 ) ) ( not ( = ?auto_19461 ?auto_19462 ) ) ( AVAILABLE ?auto_19462 ) ( SURFACE-AT ?auto_19450 ?auto_19463 ) ( ON ?auto_19450 ?auto_19457 ) ( CLEAR ?auto_19450 ) ( not ( = ?auto_19451 ?auto_19457 ) ) ( not ( = ?auto_19452 ?auto_19457 ) ) ( not ( = ?auto_19450 ?auto_19457 ) ) ( not ( = ?auto_19453 ?auto_19457 ) ) ( not ( = ?auto_19458 ?auto_19457 ) ) ( not ( = ?auto_19449 ?auto_19457 ) ) ( IS-CRATE ?auto_19449 ) ( not ( = ?auto_19464 ?auto_19449 ) ) ( not ( = ?auto_19451 ?auto_19464 ) ) ( not ( = ?auto_19452 ?auto_19464 ) ) ( not ( = ?auto_19450 ?auto_19464 ) ) ( not ( = ?auto_19453 ?auto_19464 ) ) ( not ( = ?auto_19458 ?auto_19464 ) ) ( not ( = ?auto_19457 ?auto_19464 ) ) ( SURFACE-AT ?auto_19449 ?auto_19454 ) ( ON ?auto_19449 ?auto_19455 ) ( CLEAR ?auto_19449 ) ( not ( = ?auto_19451 ?auto_19455 ) ) ( not ( = ?auto_19452 ?auto_19455 ) ) ( not ( = ?auto_19450 ?auto_19455 ) ) ( not ( = ?auto_19453 ?auto_19455 ) ) ( not ( = ?auto_19458 ?auto_19455 ) ) ( not ( = ?auto_19449 ?auto_19455 ) ) ( not ( = ?auto_19457 ?auto_19455 ) ) ( not ( = ?auto_19464 ?auto_19455 ) ) ( SURFACE-AT ?auto_19460 ?auto_19456 ) ( CLEAR ?auto_19460 ) ( IS-CRATE ?auto_19464 ) ( not ( = ?auto_19460 ?auto_19464 ) ) ( not ( = ?auto_19451 ?auto_19460 ) ) ( not ( = ?auto_19452 ?auto_19460 ) ) ( not ( = ?auto_19450 ?auto_19460 ) ) ( not ( = ?auto_19453 ?auto_19460 ) ) ( not ( = ?auto_19458 ?auto_19460 ) ) ( not ( = ?auto_19449 ?auto_19460 ) ) ( not ( = ?auto_19457 ?auto_19460 ) ) ( not ( = ?auto_19455 ?auto_19460 ) ) ( AVAILABLE ?auto_19459 ) ( TRUCK-AT ?auto_19465 ?auto_19454 ) ( LIFTING ?auto_19461 ?auto_19464 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19450 ?auto_19451 ?auto_19452 )
      ( MAKE-3CRATE-VERIFY ?auto_19449 ?auto_19450 ?auto_19451 ?auto_19452 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19466 - SURFACE
      ?auto_19467 - SURFACE
      ?auto_19468 - SURFACE
      ?auto_19469 - SURFACE
      ?auto_19470 - SURFACE
    )
    :vars
    (
      ?auto_19477 - HOIST
      ?auto_19474 - PLACE
      ?auto_19472 - PLACE
      ?auto_19479 - HOIST
      ?auto_19471 - SURFACE
      ?auto_19476 - SURFACE
      ?auto_19481 - PLACE
      ?auto_19480 - HOIST
      ?auto_19475 - SURFACE
      ?auto_19473 - SURFACE
      ?auto_19478 - SURFACE
      ?auto_19482 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19477 ?auto_19474 ) ( IS-CRATE ?auto_19470 ) ( not ( = ?auto_19469 ?auto_19470 ) ) ( not ( = ?auto_19468 ?auto_19469 ) ) ( not ( = ?auto_19468 ?auto_19470 ) ) ( not ( = ?auto_19472 ?auto_19474 ) ) ( HOIST-AT ?auto_19479 ?auto_19472 ) ( not ( = ?auto_19477 ?auto_19479 ) ) ( SURFACE-AT ?auto_19470 ?auto_19472 ) ( ON ?auto_19470 ?auto_19471 ) ( CLEAR ?auto_19470 ) ( not ( = ?auto_19469 ?auto_19471 ) ) ( not ( = ?auto_19470 ?auto_19471 ) ) ( not ( = ?auto_19468 ?auto_19471 ) ) ( IS-CRATE ?auto_19469 ) ( SURFACE-AT ?auto_19469 ?auto_19472 ) ( ON ?auto_19469 ?auto_19476 ) ( CLEAR ?auto_19469 ) ( not ( = ?auto_19469 ?auto_19476 ) ) ( not ( = ?auto_19470 ?auto_19476 ) ) ( not ( = ?auto_19468 ?auto_19476 ) ) ( not ( = ?auto_19471 ?auto_19476 ) ) ( IS-CRATE ?auto_19468 ) ( not ( = ?auto_19467 ?auto_19468 ) ) ( not ( = ?auto_19469 ?auto_19467 ) ) ( not ( = ?auto_19470 ?auto_19467 ) ) ( not ( = ?auto_19471 ?auto_19467 ) ) ( not ( = ?auto_19476 ?auto_19467 ) ) ( not ( = ?auto_19481 ?auto_19474 ) ) ( not ( = ?auto_19472 ?auto_19481 ) ) ( HOIST-AT ?auto_19480 ?auto_19481 ) ( not ( = ?auto_19477 ?auto_19480 ) ) ( not ( = ?auto_19479 ?auto_19480 ) ) ( AVAILABLE ?auto_19480 ) ( SURFACE-AT ?auto_19468 ?auto_19481 ) ( ON ?auto_19468 ?auto_19475 ) ( CLEAR ?auto_19468 ) ( not ( = ?auto_19469 ?auto_19475 ) ) ( not ( = ?auto_19470 ?auto_19475 ) ) ( not ( = ?auto_19468 ?auto_19475 ) ) ( not ( = ?auto_19471 ?auto_19475 ) ) ( not ( = ?auto_19476 ?auto_19475 ) ) ( not ( = ?auto_19467 ?auto_19475 ) ) ( IS-CRATE ?auto_19467 ) ( not ( = ?auto_19466 ?auto_19467 ) ) ( not ( = ?auto_19469 ?auto_19466 ) ) ( not ( = ?auto_19470 ?auto_19466 ) ) ( not ( = ?auto_19468 ?auto_19466 ) ) ( not ( = ?auto_19471 ?auto_19466 ) ) ( not ( = ?auto_19476 ?auto_19466 ) ) ( not ( = ?auto_19475 ?auto_19466 ) ) ( SURFACE-AT ?auto_19467 ?auto_19472 ) ( ON ?auto_19467 ?auto_19473 ) ( CLEAR ?auto_19467 ) ( not ( = ?auto_19469 ?auto_19473 ) ) ( not ( = ?auto_19470 ?auto_19473 ) ) ( not ( = ?auto_19468 ?auto_19473 ) ) ( not ( = ?auto_19471 ?auto_19473 ) ) ( not ( = ?auto_19476 ?auto_19473 ) ) ( not ( = ?auto_19467 ?auto_19473 ) ) ( not ( = ?auto_19475 ?auto_19473 ) ) ( not ( = ?auto_19466 ?auto_19473 ) ) ( SURFACE-AT ?auto_19478 ?auto_19474 ) ( CLEAR ?auto_19478 ) ( IS-CRATE ?auto_19466 ) ( not ( = ?auto_19478 ?auto_19466 ) ) ( not ( = ?auto_19469 ?auto_19478 ) ) ( not ( = ?auto_19470 ?auto_19478 ) ) ( not ( = ?auto_19468 ?auto_19478 ) ) ( not ( = ?auto_19471 ?auto_19478 ) ) ( not ( = ?auto_19476 ?auto_19478 ) ) ( not ( = ?auto_19467 ?auto_19478 ) ) ( not ( = ?auto_19475 ?auto_19478 ) ) ( not ( = ?auto_19473 ?auto_19478 ) ) ( AVAILABLE ?auto_19477 ) ( TRUCK-AT ?auto_19482 ?auto_19472 ) ( LIFTING ?auto_19479 ?auto_19466 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19468 ?auto_19469 ?auto_19470 )
      ( MAKE-4CRATE-VERIFY ?auto_19466 ?auto_19467 ?auto_19468 ?auto_19469 ?auto_19470 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19483 - SURFACE
      ?auto_19484 - SURFACE
      ?auto_19485 - SURFACE
      ?auto_19486 - SURFACE
      ?auto_19487 - SURFACE
      ?auto_19488 - SURFACE
    )
    :vars
    (
      ?auto_19495 - HOIST
      ?auto_19492 - PLACE
      ?auto_19490 - PLACE
      ?auto_19496 - HOIST
      ?auto_19489 - SURFACE
      ?auto_19494 - SURFACE
      ?auto_19498 - PLACE
      ?auto_19497 - HOIST
      ?auto_19493 - SURFACE
      ?auto_19491 - SURFACE
      ?auto_19499 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19495 ?auto_19492 ) ( IS-CRATE ?auto_19488 ) ( not ( = ?auto_19487 ?auto_19488 ) ) ( not ( = ?auto_19486 ?auto_19487 ) ) ( not ( = ?auto_19486 ?auto_19488 ) ) ( not ( = ?auto_19490 ?auto_19492 ) ) ( HOIST-AT ?auto_19496 ?auto_19490 ) ( not ( = ?auto_19495 ?auto_19496 ) ) ( SURFACE-AT ?auto_19488 ?auto_19490 ) ( ON ?auto_19488 ?auto_19489 ) ( CLEAR ?auto_19488 ) ( not ( = ?auto_19487 ?auto_19489 ) ) ( not ( = ?auto_19488 ?auto_19489 ) ) ( not ( = ?auto_19486 ?auto_19489 ) ) ( IS-CRATE ?auto_19487 ) ( SURFACE-AT ?auto_19487 ?auto_19490 ) ( ON ?auto_19487 ?auto_19494 ) ( CLEAR ?auto_19487 ) ( not ( = ?auto_19487 ?auto_19494 ) ) ( not ( = ?auto_19488 ?auto_19494 ) ) ( not ( = ?auto_19486 ?auto_19494 ) ) ( not ( = ?auto_19489 ?auto_19494 ) ) ( IS-CRATE ?auto_19486 ) ( not ( = ?auto_19485 ?auto_19486 ) ) ( not ( = ?auto_19487 ?auto_19485 ) ) ( not ( = ?auto_19488 ?auto_19485 ) ) ( not ( = ?auto_19489 ?auto_19485 ) ) ( not ( = ?auto_19494 ?auto_19485 ) ) ( not ( = ?auto_19498 ?auto_19492 ) ) ( not ( = ?auto_19490 ?auto_19498 ) ) ( HOIST-AT ?auto_19497 ?auto_19498 ) ( not ( = ?auto_19495 ?auto_19497 ) ) ( not ( = ?auto_19496 ?auto_19497 ) ) ( AVAILABLE ?auto_19497 ) ( SURFACE-AT ?auto_19486 ?auto_19498 ) ( ON ?auto_19486 ?auto_19493 ) ( CLEAR ?auto_19486 ) ( not ( = ?auto_19487 ?auto_19493 ) ) ( not ( = ?auto_19488 ?auto_19493 ) ) ( not ( = ?auto_19486 ?auto_19493 ) ) ( not ( = ?auto_19489 ?auto_19493 ) ) ( not ( = ?auto_19494 ?auto_19493 ) ) ( not ( = ?auto_19485 ?auto_19493 ) ) ( IS-CRATE ?auto_19485 ) ( not ( = ?auto_19484 ?auto_19485 ) ) ( not ( = ?auto_19487 ?auto_19484 ) ) ( not ( = ?auto_19488 ?auto_19484 ) ) ( not ( = ?auto_19486 ?auto_19484 ) ) ( not ( = ?auto_19489 ?auto_19484 ) ) ( not ( = ?auto_19494 ?auto_19484 ) ) ( not ( = ?auto_19493 ?auto_19484 ) ) ( SURFACE-AT ?auto_19485 ?auto_19490 ) ( ON ?auto_19485 ?auto_19491 ) ( CLEAR ?auto_19485 ) ( not ( = ?auto_19487 ?auto_19491 ) ) ( not ( = ?auto_19488 ?auto_19491 ) ) ( not ( = ?auto_19486 ?auto_19491 ) ) ( not ( = ?auto_19489 ?auto_19491 ) ) ( not ( = ?auto_19494 ?auto_19491 ) ) ( not ( = ?auto_19485 ?auto_19491 ) ) ( not ( = ?auto_19493 ?auto_19491 ) ) ( not ( = ?auto_19484 ?auto_19491 ) ) ( SURFACE-AT ?auto_19483 ?auto_19492 ) ( CLEAR ?auto_19483 ) ( IS-CRATE ?auto_19484 ) ( not ( = ?auto_19483 ?auto_19484 ) ) ( not ( = ?auto_19487 ?auto_19483 ) ) ( not ( = ?auto_19488 ?auto_19483 ) ) ( not ( = ?auto_19486 ?auto_19483 ) ) ( not ( = ?auto_19489 ?auto_19483 ) ) ( not ( = ?auto_19494 ?auto_19483 ) ) ( not ( = ?auto_19485 ?auto_19483 ) ) ( not ( = ?auto_19493 ?auto_19483 ) ) ( not ( = ?auto_19491 ?auto_19483 ) ) ( AVAILABLE ?auto_19495 ) ( TRUCK-AT ?auto_19499 ?auto_19490 ) ( LIFTING ?auto_19496 ?auto_19484 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19486 ?auto_19487 ?auto_19488 )
      ( MAKE-5CRATE-VERIFY ?auto_19483 ?auto_19484 ?auto_19485 ?auto_19486 ?auto_19487 ?auto_19488 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19500 - SURFACE
      ?auto_19501 - SURFACE
    )
    :vars
    (
      ?auto_19508 - HOIST
      ?auto_19505 - PLACE
      ?auto_19515 - SURFACE
      ?auto_19503 - PLACE
      ?auto_19511 - HOIST
      ?auto_19502 - SURFACE
      ?auto_19507 - SURFACE
      ?auto_19509 - SURFACE
      ?auto_19513 - PLACE
      ?auto_19512 - HOIST
      ?auto_19506 - SURFACE
      ?auto_19514 - SURFACE
      ?auto_19504 - SURFACE
      ?auto_19510 - SURFACE
      ?auto_19516 - TRUCK
      ?auto_19517 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19508 ?auto_19505 ) ( IS-CRATE ?auto_19501 ) ( not ( = ?auto_19500 ?auto_19501 ) ) ( not ( = ?auto_19515 ?auto_19500 ) ) ( not ( = ?auto_19515 ?auto_19501 ) ) ( not ( = ?auto_19503 ?auto_19505 ) ) ( HOIST-AT ?auto_19511 ?auto_19503 ) ( not ( = ?auto_19508 ?auto_19511 ) ) ( SURFACE-AT ?auto_19501 ?auto_19503 ) ( ON ?auto_19501 ?auto_19502 ) ( CLEAR ?auto_19501 ) ( not ( = ?auto_19500 ?auto_19502 ) ) ( not ( = ?auto_19501 ?auto_19502 ) ) ( not ( = ?auto_19515 ?auto_19502 ) ) ( IS-CRATE ?auto_19500 ) ( SURFACE-AT ?auto_19500 ?auto_19503 ) ( ON ?auto_19500 ?auto_19507 ) ( CLEAR ?auto_19500 ) ( not ( = ?auto_19500 ?auto_19507 ) ) ( not ( = ?auto_19501 ?auto_19507 ) ) ( not ( = ?auto_19515 ?auto_19507 ) ) ( not ( = ?auto_19502 ?auto_19507 ) ) ( IS-CRATE ?auto_19515 ) ( not ( = ?auto_19509 ?auto_19515 ) ) ( not ( = ?auto_19500 ?auto_19509 ) ) ( not ( = ?auto_19501 ?auto_19509 ) ) ( not ( = ?auto_19502 ?auto_19509 ) ) ( not ( = ?auto_19507 ?auto_19509 ) ) ( not ( = ?auto_19513 ?auto_19505 ) ) ( not ( = ?auto_19503 ?auto_19513 ) ) ( HOIST-AT ?auto_19512 ?auto_19513 ) ( not ( = ?auto_19508 ?auto_19512 ) ) ( not ( = ?auto_19511 ?auto_19512 ) ) ( AVAILABLE ?auto_19512 ) ( SURFACE-AT ?auto_19515 ?auto_19513 ) ( ON ?auto_19515 ?auto_19506 ) ( CLEAR ?auto_19515 ) ( not ( = ?auto_19500 ?auto_19506 ) ) ( not ( = ?auto_19501 ?auto_19506 ) ) ( not ( = ?auto_19515 ?auto_19506 ) ) ( not ( = ?auto_19502 ?auto_19506 ) ) ( not ( = ?auto_19507 ?auto_19506 ) ) ( not ( = ?auto_19509 ?auto_19506 ) ) ( IS-CRATE ?auto_19509 ) ( not ( = ?auto_19514 ?auto_19509 ) ) ( not ( = ?auto_19500 ?auto_19514 ) ) ( not ( = ?auto_19501 ?auto_19514 ) ) ( not ( = ?auto_19515 ?auto_19514 ) ) ( not ( = ?auto_19502 ?auto_19514 ) ) ( not ( = ?auto_19507 ?auto_19514 ) ) ( not ( = ?auto_19506 ?auto_19514 ) ) ( SURFACE-AT ?auto_19509 ?auto_19503 ) ( ON ?auto_19509 ?auto_19504 ) ( CLEAR ?auto_19509 ) ( not ( = ?auto_19500 ?auto_19504 ) ) ( not ( = ?auto_19501 ?auto_19504 ) ) ( not ( = ?auto_19515 ?auto_19504 ) ) ( not ( = ?auto_19502 ?auto_19504 ) ) ( not ( = ?auto_19507 ?auto_19504 ) ) ( not ( = ?auto_19509 ?auto_19504 ) ) ( not ( = ?auto_19506 ?auto_19504 ) ) ( not ( = ?auto_19514 ?auto_19504 ) ) ( SURFACE-AT ?auto_19510 ?auto_19505 ) ( CLEAR ?auto_19510 ) ( IS-CRATE ?auto_19514 ) ( not ( = ?auto_19510 ?auto_19514 ) ) ( not ( = ?auto_19500 ?auto_19510 ) ) ( not ( = ?auto_19501 ?auto_19510 ) ) ( not ( = ?auto_19515 ?auto_19510 ) ) ( not ( = ?auto_19502 ?auto_19510 ) ) ( not ( = ?auto_19507 ?auto_19510 ) ) ( not ( = ?auto_19509 ?auto_19510 ) ) ( not ( = ?auto_19506 ?auto_19510 ) ) ( not ( = ?auto_19504 ?auto_19510 ) ) ( AVAILABLE ?auto_19508 ) ( TRUCK-AT ?auto_19516 ?auto_19503 ) ( AVAILABLE ?auto_19511 ) ( SURFACE-AT ?auto_19514 ?auto_19503 ) ( ON ?auto_19514 ?auto_19517 ) ( CLEAR ?auto_19514 ) ( not ( = ?auto_19500 ?auto_19517 ) ) ( not ( = ?auto_19501 ?auto_19517 ) ) ( not ( = ?auto_19515 ?auto_19517 ) ) ( not ( = ?auto_19502 ?auto_19517 ) ) ( not ( = ?auto_19507 ?auto_19517 ) ) ( not ( = ?auto_19509 ?auto_19517 ) ) ( not ( = ?auto_19506 ?auto_19517 ) ) ( not ( = ?auto_19514 ?auto_19517 ) ) ( not ( = ?auto_19504 ?auto_19517 ) ) ( not ( = ?auto_19510 ?auto_19517 ) ) )
    :subtasks
    ( ( !LIFT ?auto_19511 ?auto_19514 ?auto_19517 ?auto_19503 )
      ( MAKE-2CRATE ?auto_19515 ?auto_19500 ?auto_19501 )
      ( MAKE-1CRATE-VERIFY ?auto_19500 ?auto_19501 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19518 - SURFACE
      ?auto_19519 - SURFACE
      ?auto_19520 - SURFACE
    )
    :vars
    (
      ?auto_19530 - HOIST
      ?auto_19526 - PLACE
      ?auto_19528 - PLACE
      ?auto_19521 - HOIST
      ?auto_19534 - SURFACE
      ?auto_19525 - SURFACE
      ?auto_19529 - SURFACE
      ?auto_19524 - PLACE
      ?auto_19532 - HOIST
      ?auto_19522 - SURFACE
      ?auto_19527 - SURFACE
      ?auto_19533 - SURFACE
      ?auto_19523 - SURFACE
      ?auto_19531 - TRUCK
      ?auto_19535 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19530 ?auto_19526 ) ( IS-CRATE ?auto_19520 ) ( not ( = ?auto_19519 ?auto_19520 ) ) ( not ( = ?auto_19518 ?auto_19519 ) ) ( not ( = ?auto_19518 ?auto_19520 ) ) ( not ( = ?auto_19528 ?auto_19526 ) ) ( HOIST-AT ?auto_19521 ?auto_19528 ) ( not ( = ?auto_19530 ?auto_19521 ) ) ( SURFACE-AT ?auto_19520 ?auto_19528 ) ( ON ?auto_19520 ?auto_19534 ) ( CLEAR ?auto_19520 ) ( not ( = ?auto_19519 ?auto_19534 ) ) ( not ( = ?auto_19520 ?auto_19534 ) ) ( not ( = ?auto_19518 ?auto_19534 ) ) ( IS-CRATE ?auto_19519 ) ( SURFACE-AT ?auto_19519 ?auto_19528 ) ( ON ?auto_19519 ?auto_19525 ) ( CLEAR ?auto_19519 ) ( not ( = ?auto_19519 ?auto_19525 ) ) ( not ( = ?auto_19520 ?auto_19525 ) ) ( not ( = ?auto_19518 ?auto_19525 ) ) ( not ( = ?auto_19534 ?auto_19525 ) ) ( IS-CRATE ?auto_19518 ) ( not ( = ?auto_19529 ?auto_19518 ) ) ( not ( = ?auto_19519 ?auto_19529 ) ) ( not ( = ?auto_19520 ?auto_19529 ) ) ( not ( = ?auto_19534 ?auto_19529 ) ) ( not ( = ?auto_19525 ?auto_19529 ) ) ( not ( = ?auto_19524 ?auto_19526 ) ) ( not ( = ?auto_19528 ?auto_19524 ) ) ( HOIST-AT ?auto_19532 ?auto_19524 ) ( not ( = ?auto_19530 ?auto_19532 ) ) ( not ( = ?auto_19521 ?auto_19532 ) ) ( AVAILABLE ?auto_19532 ) ( SURFACE-AT ?auto_19518 ?auto_19524 ) ( ON ?auto_19518 ?auto_19522 ) ( CLEAR ?auto_19518 ) ( not ( = ?auto_19519 ?auto_19522 ) ) ( not ( = ?auto_19520 ?auto_19522 ) ) ( not ( = ?auto_19518 ?auto_19522 ) ) ( not ( = ?auto_19534 ?auto_19522 ) ) ( not ( = ?auto_19525 ?auto_19522 ) ) ( not ( = ?auto_19529 ?auto_19522 ) ) ( IS-CRATE ?auto_19529 ) ( not ( = ?auto_19527 ?auto_19529 ) ) ( not ( = ?auto_19519 ?auto_19527 ) ) ( not ( = ?auto_19520 ?auto_19527 ) ) ( not ( = ?auto_19518 ?auto_19527 ) ) ( not ( = ?auto_19534 ?auto_19527 ) ) ( not ( = ?auto_19525 ?auto_19527 ) ) ( not ( = ?auto_19522 ?auto_19527 ) ) ( SURFACE-AT ?auto_19529 ?auto_19528 ) ( ON ?auto_19529 ?auto_19533 ) ( CLEAR ?auto_19529 ) ( not ( = ?auto_19519 ?auto_19533 ) ) ( not ( = ?auto_19520 ?auto_19533 ) ) ( not ( = ?auto_19518 ?auto_19533 ) ) ( not ( = ?auto_19534 ?auto_19533 ) ) ( not ( = ?auto_19525 ?auto_19533 ) ) ( not ( = ?auto_19529 ?auto_19533 ) ) ( not ( = ?auto_19522 ?auto_19533 ) ) ( not ( = ?auto_19527 ?auto_19533 ) ) ( SURFACE-AT ?auto_19523 ?auto_19526 ) ( CLEAR ?auto_19523 ) ( IS-CRATE ?auto_19527 ) ( not ( = ?auto_19523 ?auto_19527 ) ) ( not ( = ?auto_19519 ?auto_19523 ) ) ( not ( = ?auto_19520 ?auto_19523 ) ) ( not ( = ?auto_19518 ?auto_19523 ) ) ( not ( = ?auto_19534 ?auto_19523 ) ) ( not ( = ?auto_19525 ?auto_19523 ) ) ( not ( = ?auto_19529 ?auto_19523 ) ) ( not ( = ?auto_19522 ?auto_19523 ) ) ( not ( = ?auto_19533 ?auto_19523 ) ) ( AVAILABLE ?auto_19530 ) ( TRUCK-AT ?auto_19531 ?auto_19528 ) ( AVAILABLE ?auto_19521 ) ( SURFACE-AT ?auto_19527 ?auto_19528 ) ( ON ?auto_19527 ?auto_19535 ) ( CLEAR ?auto_19527 ) ( not ( = ?auto_19519 ?auto_19535 ) ) ( not ( = ?auto_19520 ?auto_19535 ) ) ( not ( = ?auto_19518 ?auto_19535 ) ) ( not ( = ?auto_19534 ?auto_19535 ) ) ( not ( = ?auto_19525 ?auto_19535 ) ) ( not ( = ?auto_19529 ?auto_19535 ) ) ( not ( = ?auto_19522 ?auto_19535 ) ) ( not ( = ?auto_19527 ?auto_19535 ) ) ( not ( = ?auto_19533 ?auto_19535 ) ) ( not ( = ?auto_19523 ?auto_19535 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19519 ?auto_19520 )
      ( MAKE-2CRATE-VERIFY ?auto_19518 ?auto_19519 ?auto_19520 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19536 - SURFACE
      ?auto_19537 - SURFACE
      ?auto_19538 - SURFACE
      ?auto_19539 - SURFACE
    )
    :vars
    (
      ?auto_19543 - HOIST
      ?auto_19540 - PLACE
      ?auto_19553 - PLACE
      ?auto_19544 - HOIST
      ?auto_19546 - SURFACE
      ?auto_19542 - SURFACE
      ?auto_19551 - PLACE
      ?auto_19547 - HOIST
      ?auto_19549 - SURFACE
      ?auto_19550 - SURFACE
      ?auto_19541 - SURFACE
      ?auto_19545 - SURFACE
      ?auto_19548 - TRUCK
      ?auto_19552 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19543 ?auto_19540 ) ( IS-CRATE ?auto_19539 ) ( not ( = ?auto_19538 ?auto_19539 ) ) ( not ( = ?auto_19537 ?auto_19538 ) ) ( not ( = ?auto_19537 ?auto_19539 ) ) ( not ( = ?auto_19553 ?auto_19540 ) ) ( HOIST-AT ?auto_19544 ?auto_19553 ) ( not ( = ?auto_19543 ?auto_19544 ) ) ( SURFACE-AT ?auto_19539 ?auto_19553 ) ( ON ?auto_19539 ?auto_19546 ) ( CLEAR ?auto_19539 ) ( not ( = ?auto_19538 ?auto_19546 ) ) ( not ( = ?auto_19539 ?auto_19546 ) ) ( not ( = ?auto_19537 ?auto_19546 ) ) ( IS-CRATE ?auto_19538 ) ( SURFACE-AT ?auto_19538 ?auto_19553 ) ( ON ?auto_19538 ?auto_19542 ) ( CLEAR ?auto_19538 ) ( not ( = ?auto_19538 ?auto_19542 ) ) ( not ( = ?auto_19539 ?auto_19542 ) ) ( not ( = ?auto_19537 ?auto_19542 ) ) ( not ( = ?auto_19546 ?auto_19542 ) ) ( IS-CRATE ?auto_19537 ) ( not ( = ?auto_19536 ?auto_19537 ) ) ( not ( = ?auto_19538 ?auto_19536 ) ) ( not ( = ?auto_19539 ?auto_19536 ) ) ( not ( = ?auto_19546 ?auto_19536 ) ) ( not ( = ?auto_19542 ?auto_19536 ) ) ( not ( = ?auto_19551 ?auto_19540 ) ) ( not ( = ?auto_19553 ?auto_19551 ) ) ( HOIST-AT ?auto_19547 ?auto_19551 ) ( not ( = ?auto_19543 ?auto_19547 ) ) ( not ( = ?auto_19544 ?auto_19547 ) ) ( AVAILABLE ?auto_19547 ) ( SURFACE-AT ?auto_19537 ?auto_19551 ) ( ON ?auto_19537 ?auto_19549 ) ( CLEAR ?auto_19537 ) ( not ( = ?auto_19538 ?auto_19549 ) ) ( not ( = ?auto_19539 ?auto_19549 ) ) ( not ( = ?auto_19537 ?auto_19549 ) ) ( not ( = ?auto_19546 ?auto_19549 ) ) ( not ( = ?auto_19542 ?auto_19549 ) ) ( not ( = ?auto_19536 ?auto_19549 ) ) ( IS-CRATE ?auto_19536 ) ( not ( = ?auto_19550 ?auto_19536 ) ) ( not ( = ?auto_19538 ?auto_19550 ) ) ( not ( = ?auto_19539 ?auto_19550 ) ) ( not ( = ?auto_19537 ?auto_19550 ) ) ( not ( = ?auto_19546 ?auto_19550 ) ) ( not ( = ?auto_19542 ?auto_19550 ) ) ( not ( = ?auto_19549 ?auto_19550 ) ) ( SURFACE-AT ?auto_19536 ?auto_19553 ) ( ON ?auto_19536 ?auto_19541 ) ( CLEAR ?auto_19536 ) ( not ( = ?auto_19538 ?auto_19541 ) ) ( not ( = ?auto_19539 ?auto_19541 ) ) ( not ( = ?auto_19537 ?auto_19541 ) ) ( not ( = ?auto_19546 ?auto_19541 ) ) ( not ( = ?auto_19542 ?auto_19541 ) ) ( not ( = ?auto_19536 ?auto_19541 ) ) ( not ( = ?auto_19549 ?auto_19541 ) ) ( not ( = ?auto_19550 ?auto_19541 ) ) ( SURFACE-AT ?auto_19545 ?auto_19540 ) ( CLEAR ?auto_19545 ) ( IS-CRATE ?auto_19550 ) ( not ( = ?auto_19545 ?auto_19550 ) ) ( not ( = ?auto_19538 ?auto_19545 ) ) ( not ( = ?auto_19539 ?auto_19545 ) ) ( not ( = ?auto_19537 ?auto_19545 ) ) ( not ( = ?auto_19546 ?auto_19545 ) ) ( not ( = ?auto_19542 ?auto_19545 ) ) ( not ( = ?auto_19536 ?auto_19545 ) ) ( not ( = ?auto_19549 ?auto_19545 ) ) ( not ( = ?auto_19541 ?auto_19545 ) ) ( AVAILABLE ?auto_19543 ) ( TRUCK-AT ?auto_19548 ?auto_19553 ) ( AVAILABLE ?auto_19544 ) ( SURFACE-AT ?auto_19550 ?auto_19553 ) ( ON ?auto_19550 ?auto_19552 ) ( CLEAR ?auto_19550 ) ( not ( = ?auto_19538 ?auto_19552 ) ) ( not ( = ?auto_19539 ?auto_19552 ) ) ( not ( = ?auto_19537 ?auto_19552 ) ) ( not ( = ?auto_19546 ?auto_19552 ) ) ( not ( = ?auto_19542 ?auto_19552 ) ) ( not ( = ?auto_19536 ?auto_19552 ) ) ( not ( = ?auto_19549 ?auto_19552 ) ) ( not ( = ?auto_19550 ?auto_19552 ) ) ( not ( = ?auto_19541 ?auto_19552 ) ) ( not ( = ?auto_19545 ?auto_19552 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19537 ?auto_19538 ?auto_19539 )
      ( MAKE-3CRATE-VERIFY ?auto_19536 ?auto_19537 ?auto_19538 ?auto_19539 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19554 - SURFACE
      ?auto_19555 - SURFACE
      ?auto_19556 - SURFACE
      ?auto_19557 - SURFACE
      ?auto_19558 - SURFACE
    )
    :vars
    (
      ?auto_19562 - HOIST
      ?auto_19559 - PLACE
      ?auto_19571 - PLACE
      ?auto_19563 - HOIST
      ?auto_19565 - SURFACE
      ?auto_19561 - SURFACE
      ?auto_19569 - PLACE
      ?auto_19566 - HOIST
      ?auto_19568 - SURFACE
      ?auto_19560 - SURFACE
      ?auto_19564 - SURFACE
      ?auto_19567 - TRUCK
      ?auto_19570 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19562 ?auto_19559 ) ( IS-CRATE ?auto_19558 ) ( not ( = ?auto_19557 ?auto_19558 ) ) ( not ( = ?auto_19556 ?auto_19557 ) ) ( not ( = ?auto_19556 ?auto_19558 ) ) ( not ( = ?auto_19571 ?auto_19559 ) ) ( HOIST-AT ?auto_19563 ?auto_19571 ) ( not ( = ?auto_19562 ?auto_19563 ) ) ( SURFACE-AT ?auto_19558 ?auto_19571 ) ( ON ?auto_19558 ?auto_19565 ) ( CLEAR ?auto_19558 ) ( not ( = ?auto_19557 ?auto_19565 ) ) ( not ( = ?auto_19558 ?auto_19565 ) ) ( not ( = ?auto_19556 ?auto_19565 ) ) ( IS-CRATE ?auto_19557 ) ( SURFACE-AT ?auto_19557 ?auto_19571 ) ( ON ?auto_19557 ?auto_19561 ) ( CLEAR ?auto_19557 ) ( not ( = ?auto_19557 ?auto_19561 ) ) ( not ( = ?auto_19558 ?auto_19561 ) ) ( not ( = ?auto_19556 ?auto_19561 ) ) ( not ( = ?auto_19565 ?auto_19561 ) ) ( IS-CRATE ?auto_19556 ) ( not ( = ?auto_19555 ?auto_19556 ) ) ( not ( = ?auto_19557 ?auto_19555 ) ) ( not ( = ?auto_19558 ?auto_19555 ) ) ( not ( = ?auto_19565 ?auto_19555 ) ) ( not ( = ?auto_19561 ?auto_19555 ) ) ( not ( = ?auto_19569 ?auto_19559 ) ) ( not ( = ?auto_19571 ?auto_19569 ) ) ( HOIST-AT ?auto_19566 ?auto_19569 ) ( not ( = ?auto_19562 ?auto_19566 ) ) ( not ( = ?auto_19563 ?auto_19566 ) ) ( AVAILABLE ?auto_19566 ) ( SURFACE-AT ?auto_19556 ?auto_19569 ) ( ON ?auto_19556 ?auto_19568 ) ( CLEAR ?auto_19556 ) ( not ( = ?auto_19557 ?auto_19568 ) ) ( not ( = ?auto_19558 ?auto_19568 ) ) ( not ( = ?auto_19556 ?auto_19568 ) ) ( not ( = ?auto_19565 ?auto_19568 ) ) ( not ( = ?auto_19561 ?auto_19568 ) ) ( not ( = ?auto_19555 ?auto_19568 ) ) ( IS-CRATE ?auto_19555 ) ( not ( = ?auto_19554 ?auto_19555 ) ) ( not ( = ?auto_19557 ?auto_19554 ) ) ( not ( = ?auto_19558 ?auto_19554 ) ) ( not ( = ?auto_19556 ?auto_19554 ) ) ( not ( = ?auto_19565 ?auto_19554 ) ) ( not ( = ?auto_19561 ?auto_19554 ) ) ( not ( = ?auto_19568 ?auto_19554 ) ) ( SURFACE-AT ?auto_19555 ?auto_19571 ) ( ON ?auto_19555 ?auto_19560 ) ( CLEAR ?auto_19555 ) ( not ( = ?auto_19557 ?auto_19560 ) ) ( not ( = ?auto_19558 ?auto_19560 ) ) ( not ( = ?auto_19556 ?auto_19560 ) ) ( not ( = ?auto_19565 ?auto_19560 ) ) ( not ( = ?auto_19561 ?auto_19560 ) ) ( not ( = ?auto_19555 ?auto_19560 ) ) ( not ( = ?auto_19568 ?auto_19560 ) ) ( not ( = ?auto_19554 ?auto_19560 ) ) ( SURFACE-AT ?auto_19564 ?auto_19559 ) ( CLEAR ?auto_19564 ) ( IS-CRATE ?auto_19554 ) ( not ( = ?auto_19564 ?auto_19554 ) ) ( not ( = ?auto_19557 ?auto_19564 ) ) ( not ( = ?auto_19558 ?auto_19564 ) ) ( not ( = ?auto_19556 ?auto_19564 ) ) ( not ( = ?auto_19565 ?auto_19564 ) ) ( not ( = ?auto_19561 ?auto_19564 ) ) ( not ( = ?auto_19555 ?auto_19564 ) ) ( not ( = ?auto_19568 ?auto_19564 ) ) ( not ( = ?auto_19560 ?auto_19564 ) ) ( AVAILABLE ?auto_19562 ) ( TRUCK-AT ?auto_19567 ?auto_19571 ) ( AVAILABLE ?auto_19563 ) ( SURFACE-AT ?auto_19554 ?auto_19571 ) ( ON ?auto_19554 ?auto_19570 ) ( CLEAR ?auto_19554 ) ( not ( = ?auto_19557 ?auto_19570 ) ) ( not ( = ?auto_19558 ?auto_19570 ) ) ( not ( = ?auto_19556 ?auto_19570 ) ) ( not ( = ?auto_19565 ?auto_19570 ) ) ( not ( = ?auto_19561 ?auto_19570 ) ) ( not ( = ?auto_19555 ?auto_19570 ) ) ( not ( = ?auto_19568 ?auto_19570 ) ) ( not ( = ?auto_19554 ?auto_19570 ) ) ( not ( = ?auto_19560 ?auto_19570 ) ) ( not ( = ?auto_19564 ?auto_19570 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19556 ?auto_19557 ?auto_19558 )
      ( MAKE-4CRATE-VERIFY ?auto_19554 ?auto_19555 ?auto_19556 ?auto_19557 ?auto_19558 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19572 - SURFACE
      ?auto_19573 - SURFACE
      ?auto_19574 - SURFACE
      ?auto_19575 - SURFACE
      ?auto_19576 - SURFACE
      ?auto_19577 - SURFACE
    )
    :vars
    (
      ?auto_19581 - HOIST
      ?auto_19578 - PLACE
      ?auto_19589 - PLACE
      ?auto_19582 - HOIST
      ?auto_19583 - SURFACE
      ?auto_19580 - SURFACE
      ?auto_19587 - PLACE
      ?auto_19584 - HOIST
      ?auto_19586 - SURFACE
      ?auto_19579 - SURFACE
      ?auto_19585 - TRUCK
      ?auto_19588 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19581 ?auto_19578 ) ( IS-CRATE ?auto_19577 ) ( not ( = ?auto_19576 ?auto_19577 ) ) ( not ( = ?auto_19575 ?auto_19576 ) ) ( not ( = ?auto_19575 ?auto_19577 ) ) ( not ( = ?auto_19589 ?auto_19578 ) ) ( HOIST-AT ?auto_19582 ?auto_19589 ) ( not ( = ?auto_19581 ?auto_19582 ) ) ( SURFACE-AT ?auto_19577 ?auto_19589 ) ( ON ?auto_19577 ?auto_19583 ) ( CLEAR ?auto_19577 ) ( not ( = ?auto_19576 ?auto_19583 ) ) ( not ( = ?auto_19577 ?auto_19583 ) ) ( not ( = ?auto_19575 ?auto_19583 ) ) ( IS-CRATE ?auto_19576 ) ( SURFACE-AT ?auto_19576 ?auto_19589 ) ( ON ?auto_19576 ?auto_19580 ) ( CLEAR ?auto_19576 ) ( not ( = ?auto_19576 ?auto_19580 ) ) ( not ( = ?auto_19577 ?auto_19580 ) ) ( not ( = ?auto_19575 ?auto_19580 ) ) ( not ( = ?auto_19583 ?auto_19580 ) ) ( IS-CRATE ?auto_19575 ) ( not ( = ?auto_19574 ?auto_19575 ) ) ( not ( = ?auto_19576 ?auto_19574 ) ) ( not ( = ?auto_19577 ?auto_19574 ) ) ( not ( = ?auto_19583 ?auto_19574 ) ) ( not ( = ?auto_19580 ?auto_19574 ) ) ( not ( = ?auto_19587 ?auto_19578 ) ) ( not ( = ?auto_19589 ?auto_19587 ) ) ( HOIST-AT ?auto_19584 ?auto_19587 ) ( not ( = ?auto_19581 ?auto_19584 ) ) ( not ( = ?auto_19582 ?auto_19584 ) ) ( AVAILABLE ?auto_19584 ) ( SURFACE-AT ?auto_19575 ?auto_19587 ) ( ON ?auto_19575 ?auto_19586 ) ( CLEAR ?auto_19575 ) ( not ( = ?auto_19576 ?auto_19586 ) ) ( not ( = ?auto_19577 ?auto_19586 ) ) ( not ( = ?auto_19575 ?auto_19586 ) ) ( not ( = ?auto_19583 ?auto_19586 ) ) ( not ( = ?auto_19580 ?auto_19586 ) ) ( not ( = ?auto_19574 ?auto_19586 ) ) ( IS-CRATE ?auto_19574 ) ( not ( = ?auto_19573 ?auto_19574 ) ) ( not ( = ?auto_19576 ?auto_19573 ) ) ( not ( = ?auto_19577 ?auto_19573 ) ) ( not ( = ?auto_19575 ?auto_19573 ) ) ( not ( = ?auto_19583 ?auto_19573 ) ) ( not ( = ?auto_19580 ?auto_19573 ) ) ( not ( = ?auto_19586 ?auto_19573 ) ) ( SURFACE-AT ?auto_19574 ?auto_19589 ) ( ON ?auto_19574 ?auto_19579 ) ( CLEAR ?auto_19574 ) ( not ( = ?auto_19576 ?auto_19579 ) ) ( not ( = ?auto_19577 ?auto_19579 ) ) ( not ( = ?auto_19575 ?auto_19579 ) ) ( not ( = ?auto_19583 ?auto_19579 ) ) ( not ( = ?auto_19580 ?auto_19579 ) ) ( not ( = ?auto_19574 ?auto_19579 ) ) ( not ( = ?auto_19586 ?auto_19579 ) ) ( not ( = ?auto_19573 ?auto_19579 ) ) ( SURFACE-AT ?auto_19572 ?auto_19578 ) ( CLEAR ?auto_19572 ) ( IS-CRATE ?auto_19573 ) ( not ( = ?auto_19572 ?auto_19573 ) ) ( not ( = ?auto_19576 ?auto_19572 ) ) ( not ( = ?auto_19577 ?auto_19572 ) ) ( not ( = ?auto_19575 ?auto_19572 ) ) ( not ( = ?auto_19583 ?auto_19572 ) ) ( not ( = ?auto_19580 ?auto_19572 ) ) ( not ( = ?auto_19574 ?auto_19572 ) ) ( not ( = ?auto_19586 ?auto_19572 ) ) ( not ( = ?auto_19579 ?auto_19572 ) ) ( AVAILABLE ?auto_19581 ) ( TRUCK-AT ?auto_19585 ?auto_19589 ) ( AVAILABLE ?auto_19582 ) ( SURFACE-AT ?auto_19573 ?auto_19589 ) ( ON ?auto_19573 ?auto_19588 ) ( CLEAR ?auto_19573 ) ( not ( = ?auto_19576 ?auto_19588 ) ) ( not ( = ?auto_19577 ?auto_19588 ) ) ( not ( = ?auto_19575 ?auto_19588 ) ) ( not ( = ?auto_19583 ?auto_19588 ) ) ( not ( = ?auto_19580 ?auto_19588 ) ) ( not ( = ?auto_19574 ?auto_19588 ) ) ( not ( = ?auto_19586 ?auto_19588 ) ) ( not ( = ?auto_19573 ?auto_19588 ) ) ( not ( = ?auto_19579 ?auto_19588 ) ) ( not ( = ?auto_19572 ?auto_19588 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19575 ?auto_19576 ?auto_19577 )
      ( MAKE-5CRATE-VERIFY ?auto_19572 ?auto_19573 ?auto_19574 ?auto_19575 ?auto_19576 ?auto_19577 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19590 - SURFACE
      ?auto_19591 - SURFACE
    )
    :vars
    (
      ?auto_19596 - HOIST
      ?auto_19593 - PLACE
      ?auto_19603 - SURFACE
      ?auto_19607 - PLACE
      ?auto_19597 - HOIST
      ?auto_19599 - SURFACE
      ?auto_19595 - SURFACE
      ?auto_19592 - SURFACE
      ?auto_19605 - PLACE
      ?auto_19600 - HOIST
      ?auto_19602 - SURFACE
      ?auto_19604 - SURFACE
      ?auto_19594 - SURFACE
      ?auto_19598 - SURFACE
      ?auto_19606 - SURFACE
      ?auto_19601 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19596 ?auto_19593 ) ( IS-CRATE ?auto_19591 ) ( not ( = ?auto_19590 ?auto_19591 ) ) ( not ( = ?auto_19603 ?auto_19590 ) ) ( not ( = ?auto_19603 ?auto_19591 ) ) ( not ( = ?auto_19607 ?auto_19593 ) ) ( HOIST-AT ?auto_19597 ?auto_19607 ) ( not ( = ?auto_19596 ?auto_19597 ) ) ( SURFACE-AT ?auto_19591 ?auto_19607 ) ( ON ?auto_19591 ?auto_19599 ) ( CLEAR ?auto_19591 ) ( not ( = ?auto_19590 ?auto_19599 ) ) ( not ( = ?auto_19591 ?auto_19599 ) ) ( not ( = ?auto_19603 ?auto_19599 ) ) ( IS-CRATE ?auto_19590 ) ( SURFACE-AT ?auto_19590 ?auto_19607 ) ( ON ?auto_19590 ?auto_19595 ) ( CLEAR ?auto_19590 ) ( not ( = ?auto_19590 ?auto_19595 ) ) ( not ( = ?auto_19591 ?auto_19595 ) ) ( not ( = ?auto_19603 ?auto_19595 ) ) ( not ( = ?auto_19599 ?auto_19595 ) ) ( IS-CRATE ?auto_19603 ) ( not ( = ?auto_19592 ?auto_19603 ) ) ( not ( = ?auto_19590 ?auto_19592 ) ) ( not ( = ?auto_19591 ?auto_19592 ) ) ( not ( = ?auto_19599 ?auto_19592 ) ) ( not ( = ?auto_19595 ?auto_19592 ) ) ( not ( = ?auto_19605 ?auto_19593 ) ) ( not ( = ?auto_19607 ?auto_19605 ) ) ( HOIST-AT ?auto_19600 ?auto_19605 ) ( not ( = ?auto_19596 ?auto_19600 ) ) ( not ( = ?auto_19597 ?auto_19600 ) ) ( AVAILABLE ?auto_19600 ) ( SURFACE-AT ?auto_19603 ?auto_19605 ) ( ON ?auto_19603 ?auto_19602 ) ( CLEAR ?auto_19603 ) ( not ( = ?auto_19590 ?auto_19602 ) ) ( not ( = ?auto_19591 ?auto_19602 ) ) ( not ( = ?auto_19603 ?auto_19602 ) ) ( not ( = ?auto_19599 ?auto_19602 ) ) ( not ( = ?auto_19595 ?auto_19602 ) ) ( not ( = ?auto_19592 ?auto_19602 ) ) ( IS-CRATE ?auto_19592 ) ( not ( = ?auto_19604 ?auto_19592 ) ) ( not ( = ?auto_19590 ?auto_19604 ) ) ( not ( = ?auto_19591 ?auto_19604 ) ) ( not ( = ?auto_19603 ?auto_19604 ) ) ( not ( = ?auto_19599 ?auto_19604 ) ) ( not ( = ?auto_19595 ?auto_19604 ) ) ( not ( = ?auto_19602 ?auto_19604 ) ) ( SURFACE-AT ?auto_19592 ?auto_19607 ) ( ON ?auto_19592 ?auto_19594 ) ( CLEAR ?auto_19592 ) ( not ( = ?auto_19590 ?auto_19594 ) ) ( not ( = ?auto_19591 ?auto_19594 ) ) ( not ( = ?auto_19603 ?auto_19594 ) ) ( not ( = ?auto_19599 ?auto_19594 ) ) ( not ( = ?auto_19595 ?auto_19594 ) ) ( not ( = ?auto_19592 ?auto_19594 ) ) ( not ( = ?auto_19602 ?auto_19594 ) ) ( not ( = ?auto_19604 ?auto_19594 ) ) ( SURFACE-AT ?auto_19598 ?auto_19593 ) ( CLEAR ?auto_19598 ) ( IS-CRATE ?auto_19604 ) ( not ( = ?auto_19598 ?auto_19604 ) ) ( not ( = ?auto_19590 ?auto_19598 ) ) ( not ( = ?auto_19591 ?auto_19598 ) ) ( not ( = ?auto_19603 ?auto_19598 ) ) ( not ( = ?auto_19599 ?auto_19598 ) ) ( not ( = ?auto_19595 ?auto_19598 ) ) ( not ( = ?auto_19592 ?auto_19598 ) ) ( not ( = ?auto_19602 ?auto_19598 ) ) ( not ( = ?auto_19594 ?auto_19598 ) ) ( AVAILABLE ?auto_19596 ) ( AVAILABLE ?auto_19597 ) ( SURFACE-AT ?auto_19604 ?auto_19607 ) ( ON ?auto_19604 ?auto_19606 ) ( CLEAR ?auto_19604 ) ( not ( = ?auto_19590 ?auto_19606 ) ) ( not ( = ?auto_19591 ?auto_19606 ) ) ( not ( = ?auto_19603 ?auto_19606 ) ) ( not ( = ?auto_19599 ?auto_19606 ) ) ( not ( = ?auto_19595 ?auto_19606 ) ) ( not ( = ?auto_19592 ?auto_19606 ) ) ( not ( = ?auto_19602 ?auto_19606 ) ) ( not ( = ?auto_19604 ?auto_19606 ) ) ( not ( = ?auto_19594 ?auto_19606 ) ) ( not ( = ?auto_19598 ?auto_19606 ) ) ( TRUCK-AT ?auto_19601 ?auto_19593 ) )
    :subtasks
    ( ( !DRIVE ?auto_19601 ?auto_19593 ?auto_19607 )
      ( MAKE-2CRATE ?auto_19603 ?auto_19590 ?auto_19591 )
      ( MAKE-1CRATE-VERIFY ?auto_19590 ?auto_19591 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19608 - SURFACE
      ?auto_19609 - SURFACE
      ?auto_19610 - SURFACE
    )
    :vars
    (
      ?auto_19612 - HOIST
      ?auto_19623 - PLACE
      ?auto_19618 - PLACE
      ?auto_19611 - HOIST
      ?auto_19617 - SURFACE
      ?auto_19619 - SURFACE
      ?auto_19624 - SURFACE
      ?auto_19614 - PLACE
      ?auto_19621 - HOIST
      ?auto_19613 - SURFACE
      ?auto_19622 - SURFACE
      ?auto_19616 - SURFACE
      ?auto_19620 - SURFACE
      ?auto_19625 - SURFACE
      ?auto_19615 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19612 ?auto_19623 ) ( IS-CRATE ?auto_19610 ) ( not ( = ?auto_19609 ?auto_19610 ) ) ( not ( = ?auto_19608 ?auto_19609 ) ) ( not ( = ?auto_19608 ?auto_19610 ) ) ( not ( = ?auto_19618 ?auto_19623 ) ) ( HOIST-AT ?auto_19611 ?auto_19618 ) ( not ( = ?auto_19612 ?auto_19611 ) ) ( SURFACE-AT ?auto_19610 ?auto_19618 ) ( ON ?auto_19610 ?auto_19617 ) ( CLEAR ?auto_19610 ) ( not ( = ?auto_19609 ?auto_19617 ) ) ( not ( = ?auto_19610 ?auto_19617 ) ) ( not ( = ?auto_19608 ?auto_19617 ) ) ( IS-CRATE ?auto_19609 ) ( SURFACE-AT ?auto_19609 ?auto_19618 ) ( ON ?auto_19609 ?auto_19619 ) ( CLEAR ?auto_19609 ) ( not ( = ?auto_19609 ?auto_19619 ) ) ( not ( = ?auto_19610 ?auto_19619 ) ) ( not ( = ?auto_19608 ?auto_19619 ) ) ( not ( = ?auto_19617 ?auto_19619 ) ) ( IS-CRATE ?auto_19608 ) ( not ( = ?auto_19624 ?auto_19608 ) ) ( not ( = ?auto_19609 ?auto_19624 ) ) ( not ( = ?auto_19610 ?auto_19624 ) ) ( not ( = ?auto_19617 ?auto_19624 ) ) ( not ( = ?auto_19619 ?auto_19624 ) ) ( not ( = ?auto_19614 ?auto_19623 ) ) ( not ( = ?auto_19618 ?auto_19614 ) ) ( HOIST-AT ?auto_19621 ?auto_19614 ) ( not ( = ?auto_19612 ?auto_19621 ) ) ( not ( = ?auto_19611 ?auto_19621 ) ) ( AVAILABLE ?auto_19621 ) ( SURFACE-AT ?auto_19608 ?auto_19614 ) ( ON ?auto_19608 ?auto_19613 ) ( CLEAR ?auto_19608 ) ( not ( = ?auto_19609 ?auto_19613 ) ) ( not ( = ?auto_19610 ?auto_19613 ) ) ( not ( = ?auto_19608 ?auto_19613 ) ) ( not ( = ?auto_19617 ?auto_19613 ) ) ( not ( = ?auto_19619 ?auto_19613 ) ) ( not ( = ?auto_19624 ?auto_19613 ) ) ( IS-CRATE ?auto_19624 ) ( not ( = ?auto_19622 ?auto_19624 ) ) ( not ( = ?auto_19609 ?auto_19622 ) ) ( not ( = ?auto_19610 ?auto_19622 ) ) ( not ( = ?auto_19608 ?auto_19622 ) ) ( not ( = ?auto_19617 ?auto_19622 ) ) ( not ( = ?auto_19619 ?auto_19622 ) ) ( not ( = ?auto_19613 ?auto_19622 ) ) ( SURFACE-AT ?auto_19624 ?auto_19618 ) ( ON ?auto_19624 ?auto_19616 ) ( CLEAR ?auto_19624 ) ( not ( = ?auto_19609 ?auto_19616 ) ) ( not ( = ?auto_19610 ?auto_19616 ) ) ( not ( = ?auto_19608 ?auto_19616 ) ) ( not ( = ?auto_19617 ?auto_19616 ) ) ( not ( = ?auto_19619 ?auto_19616 ) ) ( not ( = ?auto_19624 ?auto_19616 ) ) ( not ( = ?auto_19613 ?auto_19616 ) ) ( not ( = ?auto_19622 ?auto_19616 ) ) ( SURFACE-AT ?auto_19620 ?auto_19623 ) ( CLEAR ?auto_19620 ) ( IS-CRATE ?auto_19622 ) ( not ( = ?auto_19620 ?auto_19622 ) ) ( not ( = ?auto_19609 ?auto_19620 ) ) ( not ( = ?auto_19610 ?auto_19620 ) ) ( not ( = ?auto_19608 ?auto_19620 ) ) ( not ( = ?auto_19617 ?auto_19620 ) ) ( not ( = ?auto_19619 ?auto_19620 ) ) ( not ( = ?auto_19624 ?auto_19620 ) ) ( not ( = ?auto_19613 ?auto_19620 ) ) ( not ( = ?auto_19616 ?auto_19620 ) ) ( AVAILABLE ?auto_19612 ) ( AVAILABLE ?auto_19611 ) ( SURFACE-AT ?auto_19622 ?auto_19618 ) ( ON ?auto_19622 ?auto_19625 ) ( CLEAR ?auto_19622 ) ( not ( = ?auto_19609 ?auto_19625 ) ) ( not ( = ?auto_19610 ?auto_19625 ) ) ( not ( = ?auto_19608 ?auto_19625 ) ) ( not ( = ?auto_19617 ?auto_19625 ) ) ( not ( = ?auto_19619 ?auto_19625 ) ) ( not ( = ?auto_19624 ?auto_19625 ) ) ( not ( = ?auto_19613 ?auto_19625 ) ) ( not ( = ?auto_19622 ?auto_19625 ) ) ( not ( = ?auto_19616 ?auto_19625 ) ) ( not ( = ?auto_19620 ?auto_19625 ) ) ( TRUCK-AT ?auto_19615 ?auto_19623 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19609 ?auto_19610 )
      ( MAKE-2CRATE-VERIFY ?auto_19608 ?auto_19609 ?auto_19610 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19626 - SURFACE
      ?auto_19627 - SURFACE
      ?auto_19628 - SURFACE
      ?auto_19629 - SURFACE
    )
    :vars
    (
      ?auto_19638 - HOIST
      ?auto_19635 - PLACE
      ?auto_19632 - PLACE
      ?auto_19639 - HOIST
      ?auto_19634 - SURFACE
      ?auto_19642 - SURFACE
      ?auto_19631 - PLACE
      ?auto_19637 - HOIST
      ?auto_19641 - SURFACE
      ?auto_19633 - SURFACE
      ?auto_19643 - SURFACE
      ?auto_19636 - SURFACE
      ?auto_19640 - SURFACE
      ?auto_19630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19638 ?auto_19635 ) ( IS-CRATE ?auto_19629 ) ( not ( = ?auto_19628 ?auto_19629 ) ) ( not ( = ?auto_19627 ?auto_19628 ) ) ( not ( = ?auto_19627 ?auto_19629 ) ) ( not ( = ?auto_19632 ?auto_19635 ) ) ( HOIST-AT ?auto_19639 ?auto_19632 ) ( not ( = ?auto_19638 ?auto_19639 ) ) ( SURFACE-AT ?auto_19629 ?auto_19632 ) ( ON ?auto_19629 ?auto_19634 ) ( CLEAR ?auto_19629 ) ( not ( = ?auto_19628 ?auto_19634 ) ) ( not ( = ?auto_19629 ?auto_19634 ) ) ( not ( = ?auto_19627 ?auto_19634 ) ) ( IS-CRATE ?auto_19628 ) ( SURFACE-AT ?auto_19628 ?auto_19632 ) ( ON ?auto_19628 ?auto_19642 ) ( CLEAR ?auto_19628 ) ( not ( = ?auto_19628 ?auto_19642 ) ) ( not ( = ?auto_19629 ?auto_19642 ) ) ( not ( = ?auto_19627 ?auto_19642 ) ) ( not ( = ?auto_19634 ?auto_19642 ) ) ( IS-CRATE ?auto_19627 ) ( not ( = ?auto_19626 ?auto_19627 ) ) ( not ( = ?auto_19628 ?auto_19626 ) ) ( not ( = ?auto_19629 ?auto_19626 ) ) ( not ( = ?auto_19634 ?auto_19626 ) ) ( not ( = ?auto_19642 ?auto_19626 ) ) ( not ( = ?auto_19631 ?auto_19635 ) ) ( not ( = ?auto_19632 ?auto_19631 ) ) ( HOIST-AT ?auto_19637 ?auto_19631 ) ( not ( = ?auto_19638 ?auto_19637 ) ) ( not ( = ?auto_19639 ?auto_19637 ) ) ( AVAILABLE ?auto_19637 ) ( SURFACE-AT ?auto_19627 ?auto_19631 ) ( ON ?auto_19627 ?auto_19641 ) ( CLEAR ?auto_19627 ) ( not ( = ?auto_19628 ?auto_19641 ) ) ( not ( = ?auto_19629 ?auto_19641 ) ) ( not ( = ?auto_19627 ?auto_19641 ) ) ( not ( = ?auto_19634 ?auto_19641 ) ) ( not ( = ?auto_19642 ?auto_19641 ) ) ( not ( = ?auto_19626 ?auto_19641 ) ) ( IS-CRATE ?auto_19626 ) ( not ( = ?auto_19633 ?auto_19626 ) ) ( not ( = ?auto_19628 ?auto_19633 ) ) ( not ( = ?auto_19629 ?auto_19633 ) ) ( not ( = ?auto_19627 ?auto_19633 ) ) ( not ( = ?auto_19634 ?auto_19633 ) ) ( not ( = ?auto_19642 ?auto_19633 ) ) ( not ( = ?auto_19641 ?auto_19633 ) ) ( SURFACE-AT ?auto_19626 ?auto_19632 ) ( ON ?auto_19626 ?auto_19643 ) ( CLEAR ?auto_19626 ) ( not ( = ?auto_19628 ?auto_19643 ) ) ( not ( = ?auto_19629 ?auto_19643 ) ) ( not ( = ?auto_19627 ?auto_19643 ) ) ( not ( = ?auto_19634 ?auto_19643 ) ) ( not ( = ?auto_19642 ?auto_19643 ) ) ( not ( = ?auto_19626 ?auto_19643 ) ) ( not ( = ?auto_19641 ?auto_19643 ) ) ( not ( = ?auto_19633 ?auto_19643 ) ) ( SURFACE-AT ?auto_19636 ?auto_19635 ) ( CLEAR ?auto_19636 ) ( IS-CRATE ?auto_19633 ) ( not ( = ?auto_19636 ?auto_19633 ) ) ( not ( = ?auto_19628 ?auto_19636 ) ) ( not ( = ?auto_19629 ?auto_19636 ) ) ( not ( = ?auto_19627 ?auto_19636 ) ) ( not ( = ?auto_19634 ?auto_19636 ) ) ( not ( = ?auto_19642 ?auto_19636 ) ) ( not ( = ?auto_19626 ?auto_19636 ) ) ( not ( = ?auto_19641 ?auto_19636 ) ) ( not ( = ?auto_19643 ?auto_19636 ) ) ( AVAILABLE ?auto_19638 ) ( AVAILABLE ?auto_19639 ) ( SURFACE-AT ?auto_19633 ?auto_19632 ) ( ON ?auto_19633 ?auto_19640 ) ( CLEAR ?auto_19633 ) ( not ( = ?auto_19628 ?auto_19640 ) ) ( not ( = ?auto_19629 ?auto_19640 ) ) ( not ( = ?auto_19627 ?auto_19640 ) ) ( not ( = ?auto_19634 ?auto_19640 ) ) ( not ( = ?auto_19642 ?auto_19640 ) ) ( not ( = ?auto_19626 ?auto_19640 ) ) ( not ( = ?auto_19641 ?auto_19640 ) ) ( not ( = ?auto_19633 ?auto_19640 ) ) ( not ( = ?auto_19643 ?auto_19640 ) ) ( not ( = ?auto_19636 ?auto_19640 ) ) ( TRUCK-AT ?auto_19630 ?auto_19635 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19627 ?auto_19628 ?auto_19629 )
      ( MAKE-3CRATE-VERIFY ?auto_19626 ?auto_19627 ?auto_19628 ?auto_19629 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19644 - SURFACE
      ?auto_19645 - SURFACE
      ?auto_19646 - SURFACE
      ?auto_19647 - SURFACE
      ?auto_19648 - SURFACE
    )
    :vars
    (
      ?auto_19656 - HOIST
      ?auto_19653 - PLACE
      ?auto_19651 - PLACE
      ?auto_19657 - HOIST
      ?auto_19652 - SURFACE
      ?auto_19660 - SURFACE
      ?auto_19650 - PLACE
      ?auto_19655 - HOIST
      ?auto_19659 - SURFACE
      ?auto_19661 - SURFACE
      ?auto_19654 - SURFACE
      ?auto_19658 - SURFACE
      ?auto_19649 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19656 ?auto_19653 ) ( IS-CRATE ?auto_19648 ) ( not ( = ?auto_19647 ?auto_19648 ) ) ( not ( = ?auto_19646 ?auto_19647 ) ) ( not ( = ?auto_19646 ?auto_19648 ) ) ( not ( = ?auto_19651 ?auto_19653 ) ) ( HOIST-AT ?auto_19657 ?auto_19651 ) ( not ( = ?auto_19656 ?auto_19657 ) ) ( SURFACE-AT ?auto_19648 ?auto_19651 ) ( ON ?auto_19648 ?auto_19652 ) ( CLEAR ?auto_19648 ) ( not ( = ?auto_19647 ?auto_19652 ) ) ( not ( = ?auto_19648 ?auto_19652 ) ) ( not ( = ?auto_19646 ?auto_19652 ) ) ( IS-CRATE ?auto_19647 ) ( SURFACE-AT ?auto_19647 ?auto_19651 ) ( ON ?auto_19647 ?auto_19660 ) ( CLEAR ?auto_19647 ) ( not ( = ?auto_19647 ?auto_19660 ) ) ( not ( = ?auto_19648 ?auto_19660 ) ) ( not ( = ?auto_19646 ?auto_19660 ) ) ( not ( = ?auto_19652 ?auto_19660 ) ) ( IS-CRATE ?auto_19646 ) ( not ( = ?auto_19645 ?auto_19646 ) ) ( not ( = ?auto_19647 ?auto_19645 ) ) ( not ( = ?auto_19648 ?auto_19645 ) ) ( not ( = ?auto_19652 ?auto_19645 ) ) ( not ( = ?auto_19660 ?auto_19645 ) ) ( not ( = ?auto_19650 ?auto_19653 ) ) ( not ( = ?auto_19651 ?auto_19650 ) ) ( HOIST-AT ?auto_19655 ?auto_19650 ) ( not ( = ?auto_19656 ?auto_19655 ) ) ( not ( = ?auto_19657 ?auto_19655 ) ) ( AVAILABLE ?auto_19655 ) ( SURFACE-AT ?auto_19646 ?auto_19650 ) ( ON ?auto_19646 ?auto_19659 ) ( CLEAR ?auto_19646 ) ( not ( = ?auto_19647 ?auto_19659 ) ) ( not ( = ?auto_19648 ?auto_19659 ) ) ( not ( = ?auto_19646 ?auto_19659 ) ) ( not ( = ?auto_19652 ?auto_19659 ) ) ( not ( = ?auto_19660 ?auto_19659 ) ) ( not ( = ?auto_19645 ?auto_19659 ) ) ( IS-CRATE ?auto_19645 ) ( not ( = ?auto_19644 ?auto_19645 ) ) ( not ( = ?auto_19647 ?auto_19644 ) ) ( not ( = ?auto_19648 ?auto_19644 ) ) ( not ( = ?auto_19646 ?auto_19644 ) ) ( not ( = ?auto_19652 ?auto_19644 ) ) ( not ( = ?auto_19660 ?auto_19644 ) ) ( not ( = ?auto_19659 ?auto_19644 ) ) ( SURFACE-AT ?auto_19645 ?auto_19651 ) ( ON ?auto_19645 ?auto_19661 ) ( CLEAR ?auto_19645 ) ( not ( = ?auto_19647 ?auto_19661 ) ) ( not ( = ?auto_19648 ?auto_19661 ) ) ( not ( = ?auto_19646 ?auto_19661 ) ) ( not ( = ?auto_19652 ?auto_19661 ) ) ( not ( = ?auto_19660 ?auto_19661 ) ) ( not ( = ?auto_19645 ?auto_19661 ) ) ( not ( = ?auto_19659 ?auto_19661 ) ) ( not ( = ?auto_19644 ?auto_19661 ) ) ( SURFACE-AT ?auto_19654 ?auto_19653 ) ( CLEAR ?auto_19654 ) ( IS-CRATE ?auto_19644 ) ( not ( = ?auto_19654 ?auto_19644 ) ) ( not ( = ?auto_19647 ?auto_19654 ) ) ( not ( = ?auto_19648 ?auto_19654 ) ) ( not ( = ?auto_19646 ?auto_19654 ) ) ( not ( = ?auto_19652 ?auto_19654 ) ) ( not ( = ?auto_19660 ?auto_19654 ) ) ( not ( = ?auto_19645 ?auto_19654 ) ) ( not ( = ?auto_19659 ?auto_19654 ) ) ( not ( = ?auto_19661 ?auto_19654 ) ) ( AVAILABLE ?auto_19656 ) ( AVAILABLE ?auto_19657 ) ( SURFACE-AT ?auto_19644 ?auto_19651 ) ( ON ?auto_19644 ?auto_19658 ) ( CLEAR ?auto_19644 ) ( not ( = ?auto_19647 ?auto_19658 ) ) ( not ( = ?auto_19648 ?auto_19658 ) ) ( not ( = ?auto_19646 ?auto_19658 ) ) ( not ( = ?auto_19652 ?auto_19658 ) ) ( not ( = ?auto_19660 ?auto_19658 ) ) ( not ( = ?auto_19645 ?auto_19658 ) ) ( not ( = ?auto_19659 ?auto_19658 ) ) ( not ( = ?auto_19644 ?auto_19658 ) ) ( not ( = ?auto_19661 ?auto_19658 ) ) ( not ( = ?auto_19654 ?auto_19658 ) ) ( TRUCK-AT ?auto_19649 ?auto_19653 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19646 ?auto_19647 ?auto_19648 )
      ( MAKE-4CRATE-VERIFY ?auto_19644 ?auto_19645 ?auto_19646 ?auto_19647 ?auto_19648 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19662 - SURFACE
      ?auto_19663 - SURFACE
      ?auto_19664 - SURFACE
      ?auto_19665 - SURFACE
      ?auto_19666 - SURFACE
      ?auto_19667 - SURFACE
    )
    :vars
    (
      ?auto_19674 - HOIST
      ?auto_19672 - PLACE
      ?auto_19670 - PLACE
      ?auto_19675 - HOIST
      ?auto_19671 - SURFACE
      ?auto_19678 - SURFACE
      ?auto_19669 - PLACE
      ?auto_19673 - HOIST
      ?auto_19677 - SURFACE
      ?auto_19679 - SURFACE
      ?auto_19676 - SURFACE
      ?auto_19668 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19674 ?auto_19672 ) ( IS-CRATE ?auto_19667 ) ( not ( = ?auto_19666 ?auto_19667 ) ) ( not ( = ?auto_19665 ?auto_19666 ) ) ( not ( = ?auto_19665 ?auto_19667 ) ) ( not ( = ?auto_19670 ?auto_19672 ) ) ( HOIST-AT ?auto_19675 ?auto_19670 ) ( not ( = ?auto_19674 ?auto_19675 ) ) ( SURFACE-AT ?auto_19667 ?auto_19670 ) ( ON ?auto_19667 ?auto_19671 ) ( CLEAR ?auto_19667 ) ( not ( = ?auto_19666 ?auto_19671 ) ) ( not ( = ?auto_19667 ?auto_19671 ) ) ( not ( = ?auto_19665 ?auto_19671 ) ) ( IS-CRATE ?auto_19666 ) ( SURFACE-AT ?auto_19666 ?auto_19670 ) ( ON ?auto_19666 ?auto_19678 ) ( CLEAR ?auto_19666 ) ( not ( = ?auto_19666 ?auto_19678 ) ) ( not ( = ?auto_19667 ?auto_19678 ) ) ( not ( = ?auto_19665 ?auto_19678 ) ) ( not ( = ?auto_19671 ?auto_19678 ) ) ( IS-CRATE ?auto_19665 ) ( not ( = ?auto_19664 ?auto_19665 ) ) ( not ( = ?auto_19666 ?auto_19664 ) ) ( not ( = ?auto_19667 ?auto_19664 ) ) ( not ( = ?auto_19671 ?auto_19664 ) ) ( not ( = ?auto_19678 ?auto_19664 ) ) ( not ( = ?auto_19669 ?auto_19672 ) ) ( not ( = ?auto_19670 ?auto_19669 ) ) ( HOIST-AT ?auto_19673 ?auto_19669 ) ( not ( = ?auto_19674 ?auto_19673 ) ) ( not ( = ?auto_19675 ?auto_19673 ) ) ( AVAILABLE ?auto_19673 ) ( SURFACE-AT ?auto_19665 ?auto_19669 ) ( ON ?auto_19665 ?auto_19677 ) ( CLEAR ?auto_19665 ) ( not ( = ?auto_19666 ?auto_19677 ) ) ( not ( = ?auto_19667 ?auto_19677 ) ) ( not ( = ?auto_19665 ?auto_19677 ) ) ( not ( = ?auto_19671 ?auto_19677 ) ) ( not ( = ?auto_19678 ?auto_19677 ) ) ( not ( = ?auto_19664 ?auto_19677 ) ) ( IS-CRATE ?auto_19664 ) ( not ( = ?auto_19663 ?auto_19664 ) ) ( not ( = ?auto_19666 ?auto_19663 ) ) ( not ( = ?auto_19667 ?auto_19663 ) ) ( not ( = ?auto_19665 ?auto_19663 ) ) ( not ( = ?auto_19671 ?auto_19663 ) ) ( not ( = ?auto_19678 ?auto_19663 ) ) ( not ( = ?auto_19677 ?auto_19663 ) ) ( SURFACE-AT ?auto_19664 ?auto_19670 ) ( ON ?auto_19664 ?auto_19679 ) ( CLEAR ?auto_19664 ) ( not ( = ?auto_19666 ?auto_19679 ) ) ( not ( = ?auto_19667 ?auto_19679 ) ) ( not ( = ?auto_19665 ?auto_19679 ) ) ( not ( = ?auto_19671 ?auto_19679 ) ) ( not ( = ?auto_19678 ?auto_19679 ) ) ( not ( = ?auto_19664 ?auto_19679 ) ) ( not ( = ?auto_19677 ?auto_19679 ) ) ( not ( = ?auto_19663 ?auto_19679 ) ) ( SURFACE-AT ?auto_19662 ?auto_19672 ) ( CLEAR ?auto_19662 ) ( IS-CRATE ?auto_19663 ) ( not ( = ?auto_19662 ?auto_19663 ) ) ( not ( = ?auto_19666 ?auto_19662 ) ) ( not ( = ?auto_19667 ?auto_19662 ) ) ( not ( = ?auto_19665 ?auto_19662 ) ) ( not ( = ?auto_19671 ?auto_19662 ) ) ( not ( = ?auto_19678 ?auto_19662 ) ) ( not ( = ?auto_19664 ?auto_19662 ) ) ( not ( = ?auto_19677 ?auto_19662 ) ) ( not ( = ?auto_19679 ?auto_19662 ) ) ( AVAILABLE ?auto_19674 ) ( AVAILABLE ?auto_19675 ) ( SURFACE-AT ?auto_19663 ?auto_19670 ) ( ON ?auto_19663 ?auto_19676 ) ( CLEAR ?auto_19663 ) ( not ( = ?auto_19666 ?auto_19676 ) ) ( not ( = ?auto_19667 ?auto_19676 ) ) ( not ( = ?auto_19665 ?auto_19676 ) ) ( not ( = ?auto_19671 ?auto_19676 ) ) ( not ( = ?auto_19678 ?auto_19676 ) ) ( not ( = ?auto_19664 ?auto_19676 ) ) ( not ( = ?auto_19677 ?auto_19676 ) ) ( not ( = ?auto_19663 ?auto_19676 ) ) ( not ( = ?auto_19679 ?auto_19676 ) ) ( not ( = ?auto_19662 ?auto_19676 ) ) ( TRUCK-AT ?auto_19668 ?auto_19672 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19665 ?auto_19666 ?auto_19667 )
      ( MAKE-5CRATE-VERIFY ?auto_19662 ?auto_19663 ?auto_19664 ?auto_19665 ?auto_19666 ?auto_19667 ) )
  )

)

