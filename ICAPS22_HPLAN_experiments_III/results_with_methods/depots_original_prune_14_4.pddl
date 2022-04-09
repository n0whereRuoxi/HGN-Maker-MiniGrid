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

  ( :method MAKE-11CRATE-VERIFY
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
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-12CRATE-VERIFY
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
      ?c11 - SURFACE
      ?c12 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( CLEAR ?c12 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-13CRATE-VERIFY
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
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( CLEAR ?c13 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-14CRATE-VERIFY
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
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
      ?c14 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( CLEAR ?c14 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1512748 - SURFACE
      ?auto_1512749 - SURFACE
    )
    :vars
    (
      ?auto_1512750 - HOIST
      ?auto_1512751 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512750 ?auto_1512751 ) ( SURFACE-AT ?auto_1512748 ?auto_1512751 ) ( CLEAR ?auto_1512748 ) ( LIFTING ?auto_1512750 ?auto_1512749 ) ( IS-CRATE ?auto_1512749 ) ( not ( = ?auto_1512748 ?auto_1512749 ) ) )
    :subtasks
    ( ( !DROP ?auto_1512750 ?auto_1512749 ?auto_1512748 ?auto_1512751 )
      ( MAKE-1CRATE-VERIFY ?auto_1512748 ?auto_1512749 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1512752 - SURFACE
      ?auto_1512753 - SURFACE
    )
    :vars
    (
      ?auto_1512755 - HOIST
      ?auto_1512754 - PLACE
      ?auto_1512756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512755 ?auto_1512754 ) ( SURFACE-AT ?auto_1512752 ?auto_1512754 ) ( CLEAR ?auto_1512752 ) ( IS-CRATE ?auto_1512753 ) ( not ( = ?auto_1512752 ?auto_1512753 ) ) ( TRUCK-AT ?auto_1512756 ?auto_1512754 ) ( AVAILABLE ?auto_1512755 ) ( IN ?auto_1512753 ?auto_1512756 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1512755 ?auto_1512753 ?auto_1512756 ?auto_1512754 )
      ( MAKE-1CRATE ?auto_1512752 ?auto_1512753 )
      ( MAKE-1CRATE-VERIFY ?auto_1512752 ?auto_1512753 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1512757 - SURFACE
      ?auto_1512758 - SURFACE
    )
    :vars
    (
      ?auto_1512761 - HOIST
      ?auto_1512759 - PLACE
      ?auto_1512760 - TRUCK
      ?auto_1512762 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512761 ?auto_1512759 ) ( SURFACE-AT ?auto_1512757 ?auto_1512759 ) ( CLEAR ?auto_1512757 ) ( IS-CRATE ?auto_1512758 ) ( not ( = ?auto_1512757 ?auto_1512758 ) ) ( AVAILABLE ?auto_1512761 ) ( IN ?auto_1512758 ?auto_1512760 ) ( TRUCK-AT ?auto_1512760 ?auto_1512762 ) ( not ( = ?auto_1512762 ?auto_1512759 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1512760 ?auto_1512762 ?auto_1512759 )
      ( MAKE-1CRATE ?auto_1512757 ?auto_1512758 )
      ( MAKE-1CRATE-VERIFY ?auto_1512757 ?auto_1512758 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1512763 - SURFACE
      ?auto_1512764 - SURFACE
    )
    :vars
    (
      ?auto_1512767 - HOIST
      ?auto_1512768 - PLACE
      ?auto_1512765 - TRUCK
      ?auto_1512766 - PLACE
      ?auto_1512769 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512767 ?auto_1512768 ) ( SURFACE-AT ?auto_1512763 ?auto_1512768 ) ( CLEAR ?auto_1512763 ) ( IS-CRATE ?auto_1512764 ) ( not ( = ?auto_1512763 ?auto_1512764 ) ) ( AVAILABLE ?auto_1512767 ) ( TRUCK-AT ?auto_1512765 ?auto_1512766 ) ( not ( = ?auto_1512766 ?auto_1512768 ) ) ( HOIST-AT ?auto_1512769 ?auto_1512766 ) ( LIFTING ?auto_1512769 ?auto_1512764 ) ( not ( = ?auto_1512767 ?auto_1512769 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1512769 ?auto_1512764 ?auto_1512765 ?auto_1512766 )
      ( MAKE-1CRATE ?auto_1512763 ?auto_1512764 )
      ( MAKE-1CRATE-VERIFY ?auto_1512763 ?auto_1512764 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1512770 - SURFACE
      ?auto_1512771 - SURFACE
    )
    :vars
    (
      ?auto_1512775 - HOIST
      ?auto_1512774 - PLACE
      ?auto_1512772 - TRUCK
      ?auto_1512776 - PLACE
      ?auto_1512773 - HOIST
      ?auto_1512777 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512775 ?auto_1512774 ) ( SURFACE-AT ?auto_1512770 ?auto_1512774 ) ( CLEAR ?auto_1512770 ) ( IS-CRATE ?auto_1512771 ) ( not ( = ?auto_1512770 ?auto_1512771 ) ) ( AVAILABLE ?auto_1512775 ) ( TRUCK-AT ?auto_1512772 ?auto_1512776 ) ( not ( = ?auto_1512776 ?auto_1512774 ) ) ( HOIST-AT ?auto_1512773 ?auto_1512776 ) ( not ( = ?auto_1512775 ?auto_1512773 ) ) ( AVAILABLE ?auto_1512773 ) ( SURFACE-AT ?auto_1512771 ?auto_1512776 ) ( ON ?auto_1512771 ?auto_1512777 ) ( CLEAR ?auto_1512771 ) ( not ( = ?auto_1512770 ?auto_1512777 ) ) ( not ( = ?auto_1512771 ?auto_1512777 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1512773 ?auto_1512771 ?auto_1512777 ?auto_1512776 )
      ( MAKE-1CRATE ?auto_1512770 ?auto_1512771 )
      ( MAKE-1CRATE-VERIFY ?auto_1512770 ?auto_1512771 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1512778 - SURFACE
      ?auto_1512779 - SURFACE
    )
    :vars
    (
      ?auto_1512782 - HOIST
      ?auto_1512784 - PLACE
      ?auto_1512785 - PLACE
      ?auto_1512780 - HOIST
      ?auto_1512781 - SURFACE
      ?auto_1512783 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512782 ?auto_1512784 ) ( SURFACE-AT ?auto_1512778 ?auto_1512784 ) ( CLEAR ?auto_1512778 ) ( IS-CRATE ?auto_1512779 ) ( not ( = ?auto_1512778 ?auto_1512779 ) ) ( AVAILABLE ?auto_1512782 ) ( not ( = ?auto_1512785 ?auto_1512784 ) ) ( HOIST-AT ?auto_1512780 ?auto_1512785 ) ( not ( = ?auto_1512782 ?auto_1512780 ) ) ( AVAILABLE ?auto_1512780 ) ( SURFACE-AT ?auto_1512779 ?auto_1512785 ) ( ON ?auto_1512779 ?auto_1512781 ) ( CLEAR ?auto_1512779 ) ( not ( = ?auto_1512778 ?auto_1512781 ) ) ( not ( = ?auto_1512779 ?auto_1512781 ) ) ( TRUCK-AT ?auto_1512783 ?auto_1512784 ) )
    :subtasks
    ( ( !DRIVE ?auto_1512783 ?auto_1512784 ?auto_1512785 )
      ( MAKE-1CRATE ?auto_1512778 ?auto_1512779 )
      ( MAKE-1CRATE-VERIFY ?auto_1512778 ?auto_1512779 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1512795 - SURFACE
      ?auto_1512796 - SURFACE
      ?auto_1512797 - SURFACE
    )
    :vars
    (
      ?auto_1512799 - HOIST
      ?auto_1512798 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512799 ?auto_1512798 ) ( SURFACE-AT ?auto_1512796 ?auto_1512798 ) ( CLEAR ?auto_1512796 ) ( LIFTING ?auto_1512799 ?auto_1512797 ) ( IS-CRATE ?auto_1512797 ) ( not ( = ?auto_1512796 ?auto_1512797 ) ) ( ON ?auto_1512796 ?auto_1512795 ) ( not ( = ?auto_1512795 ?auto_1512796 ) ) ( not ( = ?auto_1512795 ?auto_1512797 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1512796 ?auto_1512797 )
      ( MAKE-2CRATE-VERIFY ?auto_1512795 ?auto_1512796 ?auto_1512797 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1512805 - SURFACE
      ?auto_1512806 - SURFACE
      ?auto_1512807 - SURFACE
    )
    :vars
    (
      ?auto_1512810 - HOIST
      ?auto_1512808 - PLACE
      ?auto_1512809 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512810 ?auto_1512808 ) ( SURFACE-AT ?auto_1512806 ?auto_1512808 ) ( CLEAR ?auto_1512806 ) ( IS-CRATE ?auto_1512807 ) ( not ( = ?auto_1512806 ?auto_1512807 ) ) ( TRUCK-AT ?auto_1512809 ?auto_1512808 ) ( AVAILABLE ?auto_1512810 ) ( IN ?auto_1512807 ?auto_1512809 ) ( ON ?auto_1512806 ?auto_1512805 ) ( not ( = ?auto_1512805 ?auto_1512806 ) ) ( not ( = ?auto_1512805 ?auto_1512807 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1512806 ?auto_1512807 )
      ( MAKE-2CRATE-VERIFY ?auto_1512805 ?auto_1512806 ?auto_1512807 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1512811 - SURFACE
      ?auto_1512812 - SURFACE
    )
    :vars
    (
      ?auto_1512815 - HOIST
      ?auto_1512814 - PLACE
      ?auto_1512813 - TRUCK
      ?auto_1512816 - SURFACE
      ?auto_1512817 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512815 ?auto_1512814 ) ( SURFACE-AT ?auto_1512811 ?auto_1512814 ) ( CLEAR ?auto_1512811 ) ( IS-CRATE ?auto_1512812 ) ( not ( = ?auto_1512811 ?auto_1512812 ) ) ( AVAILABLE ?auto_1512815 ) ( IN ?auto_1512812 ?auto_1512813 ) ( ON ?auto_1512811 ?auto_1512816 ) ( not ( = ?auto_1512816 ?auto_1512811 ) ) ( not ( = ?auto_1512816 ?auto_1512812 ) ) ( TRUCK-AT ?auto_1512813 ?auto_1512817 ) ( not ( = ?auto_1512817 ?auto_1512814 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1512813 ?auto_1512817 ?auto_1512814 )
      ( MAKE-2CRATE ?auto_1512816 ?auto_1512811 ?auto_1512812 )
      ( MAKE-1CRATE-VERIFY ?auto_1512811 ?auto_1512812 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1512818 - SURFACE
      ?auto_1512819 - SURFACE
      ?auto_1512820 - SURFACE
    )
    :vars
    (
      ?auto_1512823 - HOIST
      ?auto_1512822 - PLACE
      ?auto_1512821 - TRUCK
      ?auto_1512824 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512823 ?auto_1512822 ) ( SURFACE-AT ?auto_1512819 ?auto_1512822 ) ( CLEAR ?auto_1512819 ) ( IS-CRATE ?auto_1512820 ) ( not ( = ?auto_1512819 ?auto_1512820 ) ) ( AVAILABLE ?auto_1512823 ) ( IN ?auto_1512820 ?auto_1512821 ) ( ON ?auto_1512819 ?auto_1512818 ) ( not ( = ?auto_1512818 ?auto_1512819 ) ) ( not ( = ?auto_1512818 ?auto_1512820 ) ) ( TRUCK-AT ?auto_1512821 ?auto_1512824 ) ( not ( = ?auto_1512824 ?auto_1512822 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1512819 ?auto_1512820 )
      ( MAKE-2CRATE-VERIFY ?auto_1512818 ?auto_1512819 ?auto_1512820 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1512825 - SURFACE
      ?auto_1512826 - SURFACE
    )
    :vars
    (
      ?auto_1512827 - HOIST
      ?auto_1512830 - PLACE
      ?auto_1512828 - SURFACE
      ?auto_1512829 - TRUCK
      ?auto_1512831 - PLACE
      ?auto_1512832 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512827 ?auto_1512830 ) ( SURFACE-AT ?auto_1512825 ?auto_1512830 ) ( CLEAR ?auto_1512825 ) ( IS-CRATE ?auto_1512826 ) ( not ( = ?auto_1512825 ?auto_1512826 ) ) ( AVAILABLE ?auto_1512827 ) ( ON ?auto_1512825 ?auto_1512828 ) ( not ( = ?auto_1512828 ?auto_1512825 ) ) ( not ( = ?auto_1512828 ?auto_1512826 ) ) ( TRUCK-AT ?auto_1512829 ?auto_1512831 ) ( not ( = ?auto_1512831 ?auto_1512830 ) ) ( HOIST-AT ?auto_1512832 ?auto_1512831 ) ( LIFTING ?auto_1512832 ?auto_1512826 ) ( not ( = ?auto_1512827 ?auto_1512832 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1512832 ?auto_1512826 ?auto_1512829 ?auto_1512831 )
      ( MAKE-2CRATE ?auto_1512828 ?auto_1512825 ?auto_1512826 )
      ( MAKE-1CRATE-VERIFY ?auto_1512825 ?auto_1512826 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1512833 - SURFACE
      ?auto_1512834 - SURFACE
      ?auto_1512835 - SURFACE
    )
    :vars
    (
      ?auto_1512839 - HOIST
      ?auto_1512837 - PLACE
      ?auto_1512840 - TRUCK
      ?auto_1512838 - PLACE
      ?auto_1512836 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512839 ?auto_1512837 ) ( SURFACE-AT ?auto_1512834 ?auto_1512837 ) ( CLEAR ?auto_1512834 ) ( IS-CRATE ?auto_1512835 ) ( not ( = ?auto_1512834 ?auto_1512835 ) ) ( AVAILABLE ?auto_1512839 ) ( ON ?auto_1512834 ?auto_1512833 ) ( not ( = ?auto_1512833 ?auto_1512834 ) ) ( not ( = ?auto_1512833 ?auto_1512835 ) ) ( TRUCK-AT ?auto_1512840 ?auto_1512838 ) ( not ( = ?auto_1512838 ?auto_1512837 ) ) ( HOIST-AT ?auto_1512836 ?auto_1512838 ) ( LIFTING ?auto_1512836 ?auto_1512835 ) ( not ( = ?auto_1512839 ?auto_1512836 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1512834 ?auto_1512835 )
      ( MAKE-2CRATE-VERIFY ?auto_1512833 ?auto_1512834 ?auto_1512835 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1512841 - SURFACE
      ?auto_1512842 - SURFACE
    )
    :vars
    (
      ?auto_1512846 - HOIST
      ?auto_1512844 - PLACE
      ?auto_1512845 - SURFACE
      ?auto_1512848 - TRUCK
      ?auto_1512847 - PLACE
      ?auto_1512843 - HOIST
      ?auto_1512849 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512846 ?auto_1512844 ) ( SURFACE-AT ?auto_1512841 ?auto_1512844 ) ( CLEAR ?auto_1512841 ) ( IS-CRATE ?auto_1512842 ) ( not ( = ?auto_1512841 ?auto_1512842 ) ) ( AVAILABLE ?auto_1512846 ) ( ON ?auto_1512841 ?auto_1512845 ) ( not ( = ?auto_1512845 ?auto_1512841 ) ) ( not ( = ?auto_1512845 ?auto_1512842 ) ) ( TRUCK-AT ?auto_1512848 ?auto_1512847 ) ( not ( = ?auto_1512847 ?auto_1512844 ) ) ( HOIST-AT ?auto_1512843 ?auto_1512847 ) ( not ( = ?auto_1512846 ?auto_1512843 ) ) ( AVAILABLE ?auto_1512843 ) ( SURFACE-AT ?auto_1512842 ?auto_1512847 ) ( ON ?auto_1512842 ?auto_1512849 ) ( CLEAR ?auto_1512842 ) ( not ( = ?auto_1512841 ?auto_1512849 ) ) ( not ( = ?auto_1512842 ?auto_1512849 ) ) ( not ( = ?auto_1512845 ?auto_1512849 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1512843 ?auto_1512842 ?auto_1512849 ?auto_1512847 )
      ( MAKE-2CRATE ?auto_1512845 ?auto_1512841 ?auto_1512842 )
      ( MAKE-1CRATE-VERIFY ?auto_1512841 ?auto_1512842 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1512850 - SURFACE
      ?auto_1512851 - SURFACE
      ?auto_1512852 - SURFACE
    )
    :vars
    (
      ?auto_1512858 - HOIST
      ?auto_1512854 - PLACE
      ?auto_1512855 - TRUCK
      ?auto_1512856 - PLACE
      ?auto_1512853 - HOIST
      ?auto_1512857 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512858 ?auto_1512854 ) ( SURFACE-AT ?auto_1512851 ?auto_1512854 ) ( CLEAR ?auto_1512851 ) ( IS-CRATE ?auto_1512852 ) ( not ( = ?auto_1512851 ?auto_1512852 ) ) ( AVAILABLE ?auto_1512858 ) ( ON ?auto_1512851 ?auto_1512850 ) ( not ( = ?auto_1512850 ?auto_1512851 ) ) ( not ( = ?auto_1512850 ?auto_1512852 ) ) ( TRUCK-AT ?auto_1512855 ?auto_1512856 ) ( not ( = ?auto_1512856 ?auto_1512854 ) ) ( HOIST-AT ?auto_1512853 ?auto_1512856 ) ( not ( = ?auto_1512858 ?auto_1512853 ) ) ( AVAILABLE ?auto_1512853 ) ( SURFACE-AT ?auto_1512852 ?auto_1512856 ) ( ON ?auto_1512852 ?auto_1512857 ) ( CLEAR ?auto_1512852 ) ( not ( = ?auto_1512851 ?auto_1512857 ) ) ( not ( = ?auto_1512852 ?auto_1512857 ) ) ( not ( = ?auto_1512850 ?auto_1512857 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1512851 ?auto_1512852 )
      ( MAKE-2CRATE-VERIFY ?auto_1512850 ?auto_1512851 ?auto_1512852 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1512859 - SURFACE
      ?auto_1512860 - SURFACE
    )
    :vars
    (
      ?auto_1512867 - HOIST
      ?auto_1512866 - PLACE
      ?auto_1512865 - SURFACE
      ?auto_1512862 - PLACE
      ?auto_1512863 - HOIST
      ?auto_1512861 - SURFACE
      ?auto_1512864 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512867 ?auto_1512866 ) ( SURFACE-AT ?auto_1512859 ?auto_1512866 ) ( CLEAR ?auto_1512859 ) ( IS-CRATE ?auto_1512860 ) ( not ( = ?auto_1512859 ?auto_1512860 ) ) ( AVAILABLE ?auto_1512867 ) ( ON ?auto_1512859 ?auto_1512865 ) ( not ( = ?auto_1512865 ?auto_1512859 ) ) ( not ( = ?auto_1512865 ?auto_1512860 ) ) ( not ( = ?auto_1512862 ?auto_1512866 ) ) ( HOIST-AT ?auto_1512863 ?auto_1512862 ) ( not ( = ?auto_1512867 ?auto_1512863 ) ) ( AVAILABLE ?auto_1512863 ) ( SURFACE-AT ?auto_1512860 ?auto_1512862 ) ( ON ?auto_1512860 ?auto_1512861 ) ( CLEAR ?auto_1512860 ) ( not ( = ?auto_1512859 ?auto_1512861 ) ) ( not ( = ?auto_1512860 ?auto_1512861 ) ) ( not ( = ?auto_1512865 ?auto_1512861 ) ) ( TRUCK-AT ?auto_1512864 ?auto_1512866 ) )
    :subtasks
    ( ( !DRIVE ?auto_1512864 ?auto_1512866 ?auto_1512862 )
      ( MAKE-2CRATE ?auto_1512865 ?auto_1512859 ?auto_1512860 )
      ( MAKE-1CRATE-VERIFY ?auto_1512859 ?auto_1512860 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1512868 - SURFACE
      ?auto_1512869 - SURFACE
      ?auto_1512870 - SURFACE
    )
    :vars
    (
      ?auto_1512872 - HOIST
      ?auto_1512874 - PLACE
      ?auto_1512873 - PLACE
      ?auto_1512871 - HOIST
      ?auto_1512875 - SURFACE
      ?auto_1512876 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512872 ?auto_1512874 ) ( SURFACE-AT ?auto_1512869 ?auto_1512874 ) ( CLEAR ?auto_1512869 ) ( IS-CRATE ?auto_1512870 ) ( not ( = ?auto_1512869 ?auto_1512870 ) ) ( AVAILABLE ?auto_1512872 ) ( ON ?auto_1512869 ?auto_1512868 ) ( not ( = ?auto_1512868 ?auto_1512869 ) ) ( not ( = ?auto_1512868 ?auto_1512870 ) ) ( not ( = ?auto_1512873 ?auto_1512874 ) ) ( HOIST-AT ?auto_1512871 ?auto_1512873 ) ( not ( = ?auto_1512872 ?auto_1512871 ) ) ( AVAILABLE ?auto_1512871 ) ( SURFACE-AT ?auto_1512870 ?auto_1512873 ) ( ON ?auto_1512870 ?auto_1512875 ) ( CLEAR ?auto_1512870 ) ( not ( = ?auto_1512869 ?auto_1512875 ) ) ( not ( = ?auto_1512870 ?auto_1512875 ) ) ( not ( = ?auto_1512868 ?auto_1512875 ) ) ( TRUCK-AT ?auto_1512876 ?auto_1512874 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1512869 ?auto_1512870 )
      ( MAKE-2CRATE-VERIFY ?auto_1512868 ?auto_1512869 ?auto_1512870 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1512877 - SURFACE
      ?auto_1512878 - SURFACE
    )
    :vars
    (
      ?auto_1512884 - HOIST
      ?auto_1512882 - PLACE
      ?auto_1512880 - SURFACE
      ?auto_1512881 - PLACE
      ?auto_1512883 - HOIST
      ?auto_1512885 - SURFACE
      ?auto_1512879 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512884 ?auto_1512882 ) ( IS-CRATE ?auto_1512878 ) ( not ( = ?auto_1512877 ?auto_1512878 ) ) ( not ( = ?auto_1512880 ?auto_1512877 ) ) ( not ( = ?auto_1512880 ?auto_1512878 ) ) ( not ( = ?auto_1512881 ?auto_1512882 ) ) ( HOIST-AT ?auto_1512883 ?auto_1512881 ) ( not ( = ?auto_1512884 ?auto_1512883 ) ) ( AVAILABLE ?auto_1512883 ) ( SURFACE-AT ?auto_1512878 ?auto_1512881 ) ( ON ?auto_1512878 ?auto_1512885 ) ( CLEAR ?auto_1512878 ) ( not ( = ?auto_1512877 ?auto_1512885 ) ) ( not ( = ?auto_1512878 ?auto_1512885 ) ) ( not ( = ?auto_1512880 ?auto_1512885 ) ) ( TRUCK-AT ?auto_1512879 ?auto_1512882 ) ( SURFACE-AT ?auto_1512880 ?auto_1512882 ) ( CLEAR ?auto_1512880 ) ( LIFTING ?auto_1512884 ?auto_1512877 ) ( IS-CRATE ?auto_1512877 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1512880 ?auto_1512877 )
      ( MAKE-2CRATE ?auto_1512880 ?auto_1512877 ?auto_1512878 )
      ( MAKE-1CRATE-VERIFY ?auto_1512877 ?auto_1512878 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1512886 - SURFACE
      ?auto_1512887 - SURFACE
      ?auto_1512888 - SURFACE
    )
    :vars
    (
      ?auto_1512891 - HOIST
      ?auto_1512889 - PLACE
      ?auto_1512894 - PLACE
      ?auto_1512893 - HOIST
      ?auto_1512892 - SURFACE
      ?auto_1512890 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512891 ?auto_1512889 ) ( IS-CRATE ?auto_1512888 ) ( not ( = ?auto_1512887 ?auto_1512888 ) ) ( not ( = ?auto_1512886 ?auto_1512887 ) ) ( not ( = ?auto_1512886 ?auto_1512888 ) ) ( not ( = ?auto_1512894 ?auto_1512889 ) ) ( HOIST-AT ?auto_1512893 ?auto_1512894 ) ( not ( = ?auto_1512891 ?auto_1512893 ) ) ( AVAILABLE ?auto_1512893 ) ( SURFACE-AT ?auto_1512888 ?auto_1512894 ) ( ON ?auto_1512888 ?auto_1512892 ) ( CLEAR ?auto_1512888 ) ( not ( = ?auto_1512887 ?auto_1512892 ) ) ( not ( = ?auto_1512888 ?auto_1512892 ) ) ( not ( = ?auto_1512886 ?auto_1512892 ) ) ( TRUCK-AT ?auto_1512890 ?auto_1512889 ) ( SURFACE-AT ?auto_1512886 ?auto_1512889 ) ( CLEAR ?auto_1512886 ) ( LIFTING ?auto_1512891 ?auto_1512887 ) ( IS-CRATE ?auto_1512887 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1512887 ?auto_1512888 )
      ( MAKE-2CRATE-VERIFY ?auto_1512886 ?auto_1512887 ?auto_1512888 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1512895 - SURFACE
      ?auto_1512896 - SURFACE
    )
    :vars
    (
      ?auto_1512897 - HOIST
      ?auto_1512902 - PLACE
      ?auto_1512900 - SURFACE
      ?auto_1512899 - PLACE
      ?auto_1512901 - HOIST
      ?auto_1512903 - SURFACE
      ?auto_1512898 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512897 ?auto_1512902 ) ( IS-CRATE ?auto_1512896 ) ( not ( = ?auto_1512895 ?auto_1512896 ) ) ( not ( = ?auto_1512900 ?auto_1512895 ) ) ( not ( = ?auto_1512900 ?auto_1512896 ) ) ( not ( = ?auto_1512899 ?auto_1512902 ) ) ( HOIST-AT ?auto_1512901 ?auto_1512899 ) ( not ( = ?auto_1512897 ?auto_1512901 ) ) ( AVAILABLE ?auto_1512901 ) ( SURFACE-AT ?auto_1512896 ?auto_1512899 ) ( ON ?auto_1512896 ?auto_1512903 ) ( CLEAR ?auto_1512896 ) ( not ( = ?auto_1512895 ?auto_1512903 ) ) ( not ( = ?auto_1512896 ?auto_1512903 ) ) ( not ( = ?auto_1512900 ?auto_1512903 ) ) ( TRUCK-AT ?auto_1512898 ?auto_1512902 ) ( SURFACE-AT ?auto_1512900 ?auto_1512902 ) ( CLEAR ?auto_1512900 ) ( IS-CRATE ?auto_1512895 ) ( AVAILABLE ?auto_1512897 ) ( IN ?auto_1512895 ?auto_1512898 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1512897 ?auto_1512895 ?auto_1512898 ?auto_1512902 )
      ( MAKE-2CRATE ?auto_1512900 ?auto_1512895 ?auto_1512896 )
      ( MAKE-1CRATE-VERIFY ?auto_1512895 ?auto_1512896 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1512904 - SURFACE
      ?auto_1512905 - SURFACE
      ?auto_1512906 - SURFACE
    )
    :vars
    (
      ?auto_1512909 - HOIST
      ?auto_1512912 - PLACE
      ?auto_1512907 - PLACE
      ?auto_1512908 - HOIST
      ?auto_1512910 - SURFACE
      ?auto_1512911 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512909 ?auto_1512912 ) ( IS-CRATE ?auto_1512906 ) ( not ( = ?auto_1512905 ?auto_1512906 ) ) ( not ( = ?auto_1512904 ?auto_1512905 ) ) ( not ( = ?auto_1512904 ?auto_1512906 ) ) ( not ( = ?auto_1512907 ?auto_1512912 ) ) ( HOIST-AT ?auto_1512908 ?auto_1512907 ) ( not ( = ?auto_1512909 ?auto_1512908 ) ) ( AVAILABLE ?auto_1512908 ) ( SURFACE-AT ?auto_1512906 ?auto_1512907 ) ( ON ?auto_1512906 ?auto_1512910 ) ( CLEAR ?auto_1512906 ) ( not ( = ?auto_1512905 ?auto_1512910 ) ) ( not ( = ?auto_1512906 ?auto_1512910 ) ) ( not ( = ?auto_1512904 ?auto_1512910 ) ) ( TRUCK-AT ?auto_1512911 ?auto_1512912 ) ( SURFACE-AT ?auto_1512904 ?auto_1512912 ) ( CLEAR ?auto_1512904 ) ( IS-CRATE ?auto_1512905 ) ( AVAILABLE ?auto_1512909 ) ( IN ?auto_1512905 ?auto_1512911 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1512905 ?auto_1512906 )
      ( MAKE-2CRATE-VERIFY ?auto_1512904 ?auto_1512905 ?auto_1512906 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1512949 - SURFACE
      ?auto_1512950 - SURFACE
    )
    :vars
    (
      ?auto_1512952 - HOIST
      ?auto_1512953 - PLACE
      ?auto_1512956 - SURFACE
      ?auto_1512955 - PLACE
      ?auto_1512951 - HOIST
      ?auto_1512954 - SURFACE
      ?auto_1512957 - TRUCK
      ?auto_1512958 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512952 ?auto_1512953 ) ( SURFACE-AT ?auto_1512949 ?auto_1512953 ) ( CLEAR ?auto_1512949 ) ( IS-CRATE ?auto_1512950 ) ( not ( = ?auto_1512949 ?auto_1512950 ) ) ( AVAILABLE ?auto_1512952 ) ( ON ?auto_1512949 ?auto_1512956 ) ( not ( = ?auto_1512956 ?auto_1512949 ) ) ( not ( = ?auto_1512956 ?auto_1512950 ) ) ( not ( = ?auto_1512955 ?auto_1512953 ) ) ( HOIST-AT ?auto_1512951 ?auto_1512955 ) ( not ( = ?auto_1512952 ?auto_1512951 ) ) ( AVAILABLE ?auto_1512951 ) ( SURFACE-AT ?auto_1512950 ?auto_1512955 ) ( ON ?auto_1512950 ?auto_1512954 ) ( CLEAR ?auto_1512950 ) ( not ( = ?auto_1512949 ?auto_1512954 ) ) ( not ( = ?auto_1512950 ?auto_1512954 ) ) ( not ( = ?auto_1512956 ?auto_1512954 ) ) ( TRUCK-AT ?auto_1512957 ?auto_1512958 ) ( not ( = ?auto_1512958 ?auto_1512953 ) ) ( not ( = ?auto_1512955 ?auto_1512958 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1512957 ?auto_1512958 ?auto_1512953 )
      ( MAKE-1CRATE ?auto_1512949 ?auto_1512950 )
      ( MAKE-1CRATE-VERIFY ?auto_1512949 ?auto_1512950 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1512988 - SURFACE
      ?auto_1512989 - SURFACE
      ?auto_1512990 - SURFACE
      ?auto_1512991 - SURFACE
    )
    :vars
    (
      ?auto_1512992 - HOIST
      ?auto_1512993 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512992 ?auto_1512993 ) ( SURFACE-AT ?auto_1512990 ?auto_1512993 ) ( CLEAR ?auto_1512990 ) ( LIFTING ?auto_1512992 ?auto_1512991 ) ( IS-CRATE ?auto_1512991 ) ( not ( = ?auto_1512990 ?auto_1512991 ) ) ( ON ?auto_1512989 ?auto_1512988 ) ( ON ?auto_1512990 ?auto_1512989 ) ( not ( = ?auto_1512988 ?auto_1512989 ) ) ( not ( = ?auto_1512988 ?auto_1512990 ) ) ( not ( = ?auto_1512988 ?auto_1512991 ) ) ( not ( = ?auto_1512989 ?auto_1512990 ) ) ( not ( = ?auto_1512989 ?auto_1512991 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1512990 ?auto_1512991 )
      ( MAKE-3CRATE-VERIFY ?auto_1512988 ?auto_1512989 ?auto_1512990 ?auto_1512991 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1513005 - SURFACE
      ?auto_1513006 - SURFACE
      ?auto_1513007 - SURFACE
      ?auto_1513008 - SURFACE
    )
    :vars
    (
      ?auto_1513011 - HOIST
      ?auto_1513010 - PLACE
      ?auto_1513009 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1513011 ?auto_1513010 ) ( SURFACE-AT ?auto_1513007 ?auto_1513010 ) ( CLEAR ?auto_1513007 ) ( IS-CRATE ?auto_1513008 ) ( not ( = ?auto_1513007 ?auto_1513008 ) ) ( TRUCK-AT ?auto_1513009 ?auto_1513010 ) ( AVAILABLE ?auto_1513011 ) ( IN ?auto_1513008 ?auto_1513009 ) ( ON ?auto_1513007 ?auto_1513006 ) ( not ( = ?auto_1513006 ?auto_1513007 ) ) ( not ( = ?auto_1513006 ?auto_1513008 ) ) ( ON ?auto_1513006 ?auto_1513005 ) ( not ( = ?auto_1513005 ?auto_1513006 ) ) ( not ( = ?auto_1513005 ?auto_1513007 ) ) ( not ( = ?auto_1513005 ?auto_1513008 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1513006 ?auto_1513007 ?auto_1513008 )
      ( MAKE-3CRATE-VERIFY ?auto_1513005 ?auto_1513006 ?auto_1513007 ?auto_1513008 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1513026 - SURFACE
      ?auto_1513027 - SURFACE
      ?auto_1513028 - SURFACE
      ?auto_1513029 - SURFACE
    )
    :vars
    (
      ?auto_1513030 - HOIST
      ?auto_1513032 - PLACE
      ?auto_1513031 - TRUCK
      ?auto_1513033 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1513030 ?auto_1513032 ) ( SURFACE-AT ?auto_1513028 ?auto_1513032 ) ( CLEAR ?auto_1513028 ) ( IS-CRATE ?auto_1513029 ) ( not ( = ?auto_1513028 ?auto_1513029 ) ) ( AVAILABLE ?auto_1513030 ) ( IN ?auto_1513029 ?auto_1513031 ) ( ON ?auto_1513028 ?auto_1513027 ) ( not ( = ?auto_1513027 ?auto_1513028 ) ) ( not ( = ?auto_1513027 ?auto_1513029 ) ) ( TRUCK-AT ?auto_1513031 ?auto_1513033 ) ( not ( = ?auto_1513033 ?auto_1513032 ) ) ( ON ?auto_1513027 ?auto_1513026 ) ( not ( = ?auto_1513026 ?auto_1513027 ) ) ( not ( = ?auto_1513026 ?auto_1513028 ) ) ( not ( = ?auto_1513026 ?auto_1513029 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1513027 ?auto_1513028 ?auto_1513029 )
      ( MAKE-3CRATE-VERIFY ?auto_1513026 ?auto_1513027 ?auto_1513028 ?auto_1513029 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1513050 - SURFACE
      ?auto_1513051 - SURFACE
      ?auto_1513052 - SURFACE
      ?auto_1513053 - SURFACE
    )
    :vars
    (
      ?auto_1513056 - HOIST
      ?auto_1513058 - PLACE
      ?auto_1513054 - TRUCK
      ?auto_1513055 - PLACE
      ?auto_1513057 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1513056 ?auto_1513058 ) ( SURFACE-AT ?auto_1513052 ?auto_1513058 ) ( CLEAR ?auto_1513052 ) ( IS-CRATE ?auto_1513053 ) ( not ( = ?auto_1513052 ?auto_1513053 ) ) ( AVAILABLE ?auto_1513056 ) ( ON ?auto_1513052 ?auto_1513051 ) ( not ( = ?auto_1513051 ?auto_1513052 ) ) ( not ( = ?auto_1513051 ?auto_1513053 ) ) ( TRUCK-AT ?auto_1513054 ?auto_1513055 ) ( not ( = ?auto_1513055 ?auto_1513058 ) ) ( HOIST-AT ?auto_1513057 ?auto_1513055 ) ( LIFTING ?auto_1513057 ?auto_1513053 ) ( not ( = ?auto_1513056 ?auto_1513057 ) ) ( ON ?auto_1513051 ?auto_1513050 ) ( not ( = ?auto_1513050 ?auto_1513051 ) ) ( not ( = ?auto_1513050 ?auto_1513052 ) ) ( not ( = ?auto_1513050 ?auto_1513053 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1513051 ?auto_1513052 ?auto_1513053 )
      ( MAKE-3CRATE-VERIFY ?auto_1513050 ?auto_1513051 ?auto_1513052 ?auto_1513053 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1513077 - SURFACE
      ?auto_1513078 - SURFACE
      ?auto_1513079 - SURFACE
      ?auto_1513080 - SURFACE
    )
    :vars
    (
      ?auto_1513082 - HOIST
      ?auto_1513084 - PLACE
      ?auto_1513083 - TRUCK
      ?auto_1513081 - PLACE
      ?auto_1513085 - HOIST
      ?auto_1513086 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1513082 ?auto_1513084 ) ( SURFACE-AT ?auto_1513079 ?auto_1513084 ) ( CLEAR ?auto_1513079 ) ( IS-CRATE ?auto_1513080 ) ( not ( = ?auto_1513079 ?auto_1513080 ) ) ( AVAILABLE ?auto_1513082 ) ( ON ?auto_1513079 ?auto_1513078 ) ( not ( = ?auto_1513078 ?auto_1513079 ) ) ( not ( = ?auto_1513078 ?auto_1513080 ) ) ( TRUCK-AT ?auto_1513083 ?auto_1513081 ) ( not ( = ?auto_1513081 ?auto_1513084 ) ) ( HOIST-AT ?auto_1513085 ?auto_1513081 ) ( not ( = ?auto_1513082 ?auto_1513085 ) ) ( AVAILABLE ?auto_1513085 ) ( SURFACE-AT ?auto_1513080 ?auto_1513081 ) ( ON ?auto_1513080 ?auto_1513086 ) ( CLEAR ?auto_1513080 ) ( not ( = ?auto_1513079 ?auto_1513086 ) ) ( not ( = ?auto_1513080 ?auto_1513086 ) ) ( not ( = ?auto_1513078 ?auto_1513086 ) ) ( ON ?auto_1513078 ?auto_1513077 ) ( not ( = ?auto_1513077 ?auto_1513078 ) ) ( not ( = ?auto_1513077 ?auto_1513079 ) ) ( not ( = ?auto_1513077 ?auto_1513080 ) ) ( not ( = ?auto_1513077 ?auto_1513086 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1513078 ?auto_1513079 ?auto_1513080 )
      ( MAKE-3CRATE-VERIFY ?auto_1513077 ?auto_1513078 ?auto_1513079 ?auto_1513080 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1513105 - SURFACE
      ?auto_1513106 - SURFACE
      ?auto_1513107 - SURFACE
      ?auto_1513108 - SURFACE
    )
    :vars
    (
      ?auto_1513113 - HOIST
      ?auto_1513112 - PLACE
      ?auto_1513109 - PLACE
      ?auto_1513110 - HOIST
      ?auto_1513111 - SURFACE
      ?auto_1513114 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1513113 ?auto_1513112 ) ( SURFACE-AT ?auto_1513107 ?auto_1513112 ) ( CLEAR ?auto_1513107 ) ( IS-CRATE ?auto_1513108 ) ( not ( = ?auto_1513107 ?auto_1513108 ) ) ( AVAILABLE ?auto_1513113 ) ( ON ?auto_1513107 ?auto_1513106 ) ( not ( = ?auto_1513106 ?auto_1513107 ) ) ( not ( = ?auto_1513106 ?auto_1513108 ) ) ( not ( = ?auto_1513109 ?auto_1513112 ) ) ( HOIST-AT ?auto_1513110 ?auto_1513109 ) ( not ( = ?auto_1513113 ?auto_1513110 ) ) ( AVAILABLE ?auto_1513110 ) ( SURFACE-AT ?auto_1513108 ?auto_1513109 ) ( ON ?auto_1513108 ?auto_1513111 ) ( CLEAR ?auto_1513108 ) ( not ( = ?auto_1513107 ?auto_1513111 ) ) ( not ( = ?auto_1513108 ?auto_1513111 ) ) ( not ( = ?auto_1513106 ?auto_1513111 ) ) ( TRUCK-AT ?auto_1513114 ?auto_1513112 ) ( ON ?auto_1513106 ?auto_1513105 ) ( not ( = ?auto_1513105 ?auto_1513106 ) ) ( not ( = ?auto_1513105 ?auto_1513107 ) ) ( not ( = ?auto_1513105 ?auto_1513108 ) ) ( not ( = ?auto_1513105 ?auto_1513111 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1513106 ?auto_1513107 ?auto_1513108 )
      ( MAKE-3CRATE-VERIFY ?auto_1513105 ?auto_1513106 ?auto_1513107 ?auto_1513108 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1513133 - SURFACE
      ?auto_1513134 - SURFACE
      ?auto_1513135 - SURFACE
      ?auto_1513136 - SURFACE
    )
    :vars
    (
      ?auto_1513137 - HOIST
      ?auto_1513139 - PLACE
      ?auto_1513141 - PLACE
      ?auto_1513140 - HOIST
      ?auto_1513142 - SURFACE
      ?auto_1513138 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1513137 ?auto_1513139 ) ( IS-CRATE ?auto_1513136 ) ( not ( = ?auto_1513135 ?auto_1513136 ) ) ( not ( = ?auto_1513134 ?auto_1513135 ) ) ( not ( = ?auto_1513134 ?auto_1513136 ) ) ( not ( = ?auto_1513141 ?auto_1513139 ) ) ( HOIST-AT ?auto_1513140 ?auto_1513141 ) ( not ( = ?auto_1513137 ?auto_1513140 ) ) ( AVAILABLE ?auto_1513140 ) ( SURFACE-AT ?auto_1513136 ?auto_1513141 ) ( ON ?auto_1513136 ?auto_1513142 ) ( CLEAR ?auto_1513136 ) ( not ( = ?auto_1513135 ?auto_1513142 ) ) ( not ( = ?auto_1513136 ?auto_1513142 ) ) ( not ( = ?auto_1513134 ?auto_1513142 ) ) ( TRUCK-AT ?auto_1513138 ?auto_1513139 ) ( SURFACE-AT ?auto_1513134 ?auto_1513139 ) ( CLEAR ?auto_1513134 ) ( LIFTING ?auto_1513137 ?auto_1513135 ) ( IS-CRATE ?auto_1513135 ) ( ON ?auto_1513134 ?auto_1513133 ) ( not ( = ?auto_1513133 ?auto_1513134 ) ) ( not ( = ?auto_1513133 ?auto_1513135 ) ) ( not ( = ?auto_1513133 ?auto_1513136 ) ) ( not ( = ?auto_1513133 ?auto_1513142 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1513134 ?auto_1513135 ?auto_1513136 )
      ( MAKE-3CRATE-VERIFY ?auto_1513133 ?auto_1513134 ?auto_1513135 ?auto_1513136 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1513161 - SURFACE
      ?auto_1513162 - SURFACE
      ?auto_1513163 - SURFACE
      ?auto_1513164 - SURFACE
    )
    :vars
    (
      ?auto_1513166 - HOIST
      ?auto_1513168 - PLACE
      ?auto_1513169 - PLACE
      ?auto_1513170 - HOIST
      ?auto_1513165 - SURFACE
      ?auto_1513167 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1513166 ?auto_1513168 ) ( IS-CRATE ?auto_1513164 ) ( not ( = ?auto_1513163 ?auto_1513164 ) ) ( not ( = ?auto_1513162 ?auto_1513163 ) ) ( not ( = ?auto_1513162 ?auto_1513164 ) ) ( not ( = ?auto_1513169 ?auto_1513168 ) ) ( HOIST-AT ?auto_1513170 ?auto_1513169 ) ( not ( = ?auto_1513166 ?auto_1513170 ) ) ( AVAILABLE ?auto_1513170 ) ( SURFACE-AT ?auto_1513164 ?auto_1513169 ) ( ON ?auto_1513164 ?auto_1513165 ) ( CLEAR ?auto_1513164 ) ( not ( = ?auto_1513163 ?auto_1513165 ) ) ( not ( = ?auto_1513164 ?auto_1513165 ) ) ( not ( = ?auto_1513162 ?auto_1513165 ) ) ( TRUCK-AT ?auto_1513167 ?auto_1513168 ) ( SURFACE-AT ?auto_1513162 ?auto_1513168 ) ( CLEAR ?auto_1513162 ) ( IS-CRATE ?auto_1513163 ) ( AVAILABLE ?auto_1513166 ) ( IN ?auto_1513163 ?auto_1513167 ) ( ON ?auto_1513162 ?auto_1513161 ) ( not ( = ?auto_1513161 ?auto_1513162 ) ) ( not ( = ?auto_1513161 ?auto_1513163 ) ) ( not ( = ?auto_1513161 ?auto_1513164 ) ) ( not ( = ?auto_1513161 ?auto_1513165 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1513162 ?auto_1513163 ?auto_1513164 )
      ( MAKE-3CRATE-VERIFY ?auto_1513161 ?auto_1513162 ?auto_1513163 ?auto_1513164 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1513452 - SURFACE
      ?auto_1513453 - SURFACE
      ?auto_1513454 - SURFACE
      ?auto_1513455 - SURFACE
      ?auto_1513456 - SURFACE
    )
    :vars
    (
      ?auto_1513458 - HOIST
      ?auto_1513457 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1513458 ?auto_1513457 ) ( SURFACE-AT ?auto_1513455 ?auto_1513457 ) ( CLEAR ?auto_1513455 ) ( LIFTING ?auto_1513458 ?auto_1513456 ) ( IS-CRATE ?auto_1513456 ) ( not ( = ?auto_1513455 ?auto_1513456 ) ) ( ON ?auto_1513453 ?auto_1513452 ) ( ON ?auto_1513454 ?auto_1513453 ) ( ON ?auto_1513455 ?auto_1513454 ) ( not ( = ?auto_1513452 ?auto_1513453 ) ) ( not ( = ?auto_1513452 ?auto_1513454 ) ) ( not ( = ?auto_1513452 ?auto_1513455 ) ) ( not ( = ?auto_1513452 ?auto_1513456 ) ) ( not ( = ?auto_1513453 ?auto_1513454 ) ) ( not ( = ?auto_1513453 ?auto_1513455 ) ) ( not ( = ?auto_1513453 ?auto_1513456 ) ) ( not ( = ?auto_1513454 ?auto_1513455 ) ) ( not ( = ?auto_1513454 ?auto_1513456 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1513455 ?auto_1513456 )
      ( MAKE-4CRATE-VERIFY ?auto_1513452 ?auto_1513453 ?auto_1513454 ?auto_1513455 ?auto_1513456 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1513477 - SURFACE
      ?auto_1513478 - SURFACE
      ?auto_1513479 - SURFACE
      ?auto_1513480 - SURFACE
      ?auto_1513481 - SURFACE
    )
    :vars
    (
      ?auto_1513484 - HOIST
      ?auto_1513483 - PLACE
      ?auto_1513482 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1513484 ?auto_1513483 ) ( SURFACE-AT ?auto_1513480 ?auto_1513483 ) ( CLEAR ?auto_1513480 ) ( IS-CRATE ?auto_1513481 ) ( not ( = ?auto_1513480 ?auto_1513481 ) ) ( TRUCK-AT ?auto_1513482 ?auto_1513483 ) ( AVAILABLE ?auto_1513484 ) ( IN ?auto_1513481 ?auto_1513482 ) ( ON ?auto_1513480 ?auto_1513479 ) ( not ( = ?auto_1513479 ?auto_1513480 ) ) ( not ( = ?auto_1513479 ?auto_1513481 ) ) ( ON ?auto_1513478 ?auto_1513477 ) ( ON ?auto_1513479 ?auto_1513478 ) ( not ( = ?auto_1513477 ?auto_1513478 ) ) ( not ( = ?auto_1513477 ?auto_1513479 ) ) ( not ( = ?auto_1513477 ?auto_1513480 ) ) ( not ( = ?auto_1513477 ?auto_1513481 ) ) ( not ( = ?auto_1513478 ?auto_1513479 ) ) ( not ( = ?auto_1513478 ?auto_1513480 ) ) ( not ( = ?auto_1513478 ?auto_1513481 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1513479 ?auto_1513480 ?auto_1513481 )
      ( MAKE-4CRATE-VERIFY ?auto_1513477 ?auto_1513478 ?auto_1513479 ?auto_1513480 ?auto_1513481 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1513507 - SURFACE
      ?auto_1513508 - SURFACE
      ?auto_1513509 - SURFACE
      ?auto_1513510 - SURFACE
      ?auto_1513511 - SURFACE
    )
    :vars
    (
      ?auto_1513515 - HOIST
      ?auto_1513512 - PLACE
      ?auto_1513513 - TRUCK
      ?auto_1513514 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1513515 ?auto_1513512 ) ( SURFACE-AT ?auto_1513510 ?auto_1513512 ) ( CLEAR ?auto_1513510 ) ( IS-CRATE ?auto_1513511 ) ( not ( = ?auto_1513510 ?auto_1513511 ) ) ( AVAILABLE ?auto_1513515 ) ( IN ?auto_1513511 ?auto_1513513 ) ( ON ?auto_1513510 ?auto_1513509 ) ( not ( = ?auto_1513509 ?auto_1513510 ) ) ( not ( = ?auto_1513509 ?auto_1513511 ) ) ( TRUCK-AT ?auto_1513513 ?auto_1513514 ) ( not ( = ?auto_1513514 ?auto_1513512 ) ) ( ON ?auto_1513508 ?auto_1513507 ) ( ON ?auto_1513509 ?auto_1513508 ) ( not ( = ?auto_1513507 ?auto_1513508 ) ) ( not ( = ?auto_1513507 ?auto_1513509 ) ) ( not ( = ?auto_1513507 ?auto_1513510 ) ) ( not ( = ?auto_1513507 ?auto_1513511 ) ) ( not ( = ?auto_1513508 ?auto_1513509 ) ) ( not ( = ?auto_1513508 ?auto_1513510 ) ) ( not ( = ?auto_1513508 ?auto_1513511 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1513509 ?auto_1513510 ?auto_1513511 )
      ( MAKE-4CRATE-VERIFY ?auto_1513507 ?auto_1513508 ?auto_1513509 ?auto_1513510 ?auto_1513511 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1513541 - SURFACE
      ?auto_1513542 - SURFACE
      ?auto_1513543 - SURFACE
      ?auto_1513544 - SURFACE
      ?auto_1513545 - SURFACE
    )
    :vars
    (
      ?auto_1513548 - HOIST
      ?auto_1513550 - PLACE
      ?auto_1513546 - TRUCK
      ?auto_1513549 - PLACE
      ?auto_1513547 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1513548 ?auto_1513550 ) ( SURFACE-AT ?auto_1513544 ?auto_1513550 ) ( CLEAR ?auto_1513544 ) ( IS-CRATE ?auto_1513545 ) ( not ( = ?auto_1513544 ?auto_1513545 ) ) ( AVAILABLE ?auto_1513548 ) ( ON ?auto_1513544 ?auto_1513543 ) ( not ( = ?auto_1513543 ?auto_1513544 ) ) ( not ( = ?auto_1513543 ?auto_1513545 ) ) ( TRUCK-AT ?auto_1513546 ?auto_1513549 ) ( not ( = ?auto_1513549 ?auto_1513550 ) ) ( HOIST-AT ?auto_1513547 ?auto_1513549 ) ( LIFTING ?auto_1513547 ?auto_1513545 ) ( not ( = ?auto_1513548 ?auto_1513547 ) ) ( ON ?auto_1513542 ?auto_1513541 ) ( ON ?auto_1513543 ?auto_1513542 ) ( not ( = ?auto_1513541 ?auto_1513542 ) ) ( not ( = ?auto_1513541 ?auto_1513543 ) ) ( not ( = ?auto_1513541 ?auto_1513544 ) ) ( not ( = ?auto_1513541 ?auto_1513545 ) ) ( not ( = ?auto_1513542 ?auto_1513543 ) ) ( not ( = ?auto_1513542 ?auto_1513544 ) ) ( not ( = ?auto_1513542 ?auto_1513545 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1513543 ?auto_1513544 ?auto_1513545 )
      ( MAKE-4CRATE-VERIFY ?auto_1513541 ?auto_1513542 ?auto_1513543 ?auto_1513544 ?auto_1513545 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1513579 - SURFACE
      ?auto_1513580 - SURFACE
      ?auto_1513581 - SURFACE
      ?auto_1513582 - SURFACE
      ?auto_1513583 - SURFACE
    )
    :vars
    (
      ?auto_1513589 - HOIST
      ?auto_1513585 - PLACE
      ?auto_1513588 - TRUCK
      ?auto_1513587 - PLACE
      ?auto_1513584 - HOIST
      ?auto_1513586 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1513589 ?auto_1513585 ) ( SURFACE-AT ?auto_1513582 ?auto_1513585 ) ( CLEAR ?auto_1513582 ) ( IS-CRATE ?auto_1513583 ) ( not ( = ?auto_1513582 ?auto_1513583 ) ) ( AVAILABLE ?auto_1513589 ) ( ON ?auto_1513582 ?auto_1513581 ) ( not ( = ?auto_1513581 ?auto_1513582 ) ) ( not ( = ?auto_1513581 ?auto_1513583 ) ) ( TRUCK-AT ?auto_1513588 ?auto_1513587 ) ( not ( = ?auto_1513587 ?auto_1513585 ) ) ( HOIST-AT ?auto_1513584 ?auto_1513587 ) ( not ( = ?auto_1513589 ?auto_1513584 ) ) ( AVAILABLE ?auto_1513584 ) ( SURFACE-AT ?auto_1513583 ?auto_1513587 ) ( ON ?auto_1513583 ?auto_1513586 ) ( CLEAR ?auto_1513583 ) ( not ( = ?auto_1513582 ?auto_1513586 ) ) ( not ( = ?auto_1513583 ?auto_1513586 ) ) ( not ( = ?auto_1513581 ?auto_1513586 ) ) ( ON ?auto_1513580 ?auto_1513579 ) ( ON ?auto_1513581 ?auto_1513580 ) ( not ( = ?auto_1513579 ?auto_1513580 ) ) ( not ( = ?auto_1513579 ?auto_1513581 ) ) ( not ( = ?auto_1513579 ?auto_1513582 ) ) ( not ( = ?auto_1513579 ?auto_1513583 ) ) ( not ( = ?auto_1513579 ?auto_1513586 ) ) ( not ( = ?auto_1513580 ?auto_1513581 ) ) ( not ( = ?auto_1513580 ?auto_1513582 ) ) ( not ( = ?auto_1513580 ?auto_1513583 ) ) ( not ( = ?auto_1513580 ?auto_1513586 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1513581 ?auto_1513582 ?auto_1513583 )
      ( MAKE-4CRATE-VERIFY ?auto_1513579 ?auto_1513580 ?auto_1513581 ?auto_1513582 ?auto_1513583 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1513618 - SURFACE
      ?auto_1513619 - SURFACE
      ?auto_1513620 - SURFACE
      ?auto_1513621 - SURFACE
      ?auto_1513622 - SURFACE
    )
    :vars
    (
      ?auto_1513624 - HOIST
      ?auto_1513628 - PLACE
      ?auto_1513627 - PLACE
      ?auto_1513625 - HOIST
      ?auto_1513623 - SURFACE
      ?auto_1513626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1513624 ?auto_1513628 ) ( SURFACE-AT ?auto_1513621 ?auto_1513628 ) ( CLEAR ?auto_1513621 ) ( IS-CRATE ?auto_1513622 ) ( not ( = ?auto_1513621 ?auto_1513622 ) ) ( AVAILABLE ?auto_1513624 ) ( ON ?auto_1513621 ?auto_1513620 ) ( not ( = ?auto_1513620 ?auto_1513621 ) ) ( not ( = ?auto_1513620 ?auto_1513622 ) ) ( not ( = ?auto_1513627 ?auto_1513628 ) ) ( HOIST-AT ?auto_1513625 ?auto_1513627 ) ( not ( = ?auto_1513624 ?auto_1513625 ) ) ( AVAILABLE ?auto_1513625 ) ( SURFACE-AT ?auto_1513622 ?auto_1513627 ) ( ON ?auto_1513622 ?auto_1513623 ) ( CLEAR ?auto_1513622 ) ( not ( = ?auto_1513621 ?auto_1513623 ) ) ( not ( = ?auto_1513622 ?auto_1513623 ) ) ( not ( = ?auto_1513620 ?auto_1513623 ) ) ( TRUCK-AT ?auto_1513626 ?auto_1513628 ) ( ON ?auto_1513619 ?auto_1513618 ) ( ON ?auto_1513620 ?auto_1513619 ) ( not ( = ?auto_1513618 ?auto_1513619 ) ) ( not ( = ?auto_1513618 ?auto_1513620 ) ) ( not ( = ?auto_1513618 ?auto_1513621 ) ) ( not ( = ?auto_1513618 ?auto_1513622 ) ) ( not ( = ?auto_1513618 ?auto_1513623 ) ) ( not ( = ?auto_1513619 ?auto_1513620 ) ) ( not ( = ?auto_1513619 ?auto_1513621 ) ) ( not ( = ?auto_1513619 ?auto_1513622 ) ) ( not ( = ?auto_1513619 ?auto_1513623 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1513620 ?auto_1513621 ?auto_1513622 )
      ( MAKE-4CRATE-VERIFY ?auto_1513618 ?auto_1513619 ?auto_1513620 ?auto_1513621 ?auto_1513622 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1513657 - SURFACE
      ?auto_1513658 - SURFACE
      ?auto_1513659 - SURFACE
      ?auto_1513660 - SURFACE
      ?auto_1513661 - SURFACE
    )
    :vars
    (
      ?auto_1513665 - HOIST
      ?auto_1513666 - PLACE
      ?auto_1513664 - PLACE
      ?auto_1513667 - HOIST
      ?auto_1513662 - SURFACE
      ?auto_1513663 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1513665 ?auto_1513666 ) ( IS-CRATE ?auto_1513661 ) ( not ( = ?auto_1513660 ?auto_1513661 ) ) ( not ( = ?auto_1513659 ?auto_1513660 ) ) ( not ( = ?auto_1513659 ?auto_1513661 ) ) ( not ( = ?auto_1513664 ?auto_1513666 ) ) ( HOIST-AT ?auto_1513667 ?auto_1513664 ) ( not ( = ?auto_1513665 ?auto_1513667 ) ) ( AVAILABLE ?auto_1513667 ) ( SURFACE-AT ?auto_1513661 ?auto_1513664 ) ( ON ?auto_1513661 ?auto_1513662 ) ( CLEAR ?auto_1513661 ) ( not ( = ?auto_1513660 ?auto_1513662 ) ) ( not ( = ?auto_1513661 ?auto_1513662 ) ) ( not ( = ?auto_1513659 ?auto_1513662 ) ) ( TRUCK-AT ?auto_1513663 ?auto_1513666 ) ( SURFACE-AT ?auto_1513659 ?auto_1513666 ) ( CLEAR ?auto_1513659 ) ( LIFTING ?auto_1513665 ?auto_1513660 ) ( IS-CRATE ?auto_1513660 ) ( ON ?auto_1513658 ?auto_1513657 ) ( ON ?auto_1513659 ?auto_1513658 ) ( not ( = ?auto_1513657 ?auto_1513658 ) ) ( not ( = ?auto_1513657 ?auto_1513659 ) ) ( not ( = ?auto_1513657 ?auto_1513660 ) ) ( not ( = ?auto_1513657 ?auto_1513661 ) ) ( not ( = ?auto_1513657 ?auto_1513662 ) ) ( not ( = ?auto_1513658 ?auto_1513659 ) ) ( not ( = ?auto_1513658 ?auto_1513660 ) ) ( not ( = ?auto_1513658 ?auto_1513661 ) ) ( not ( = ?auto_1513658 ?auto_1513662 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1513659 ?auto_1513660 ?auto_1513661 )
      ( MAKE-4CRATE-VERIFY ?auto_1513657 ?auto_1513658 ?auto_1513659 ?auto_1513660 ?auto_1513661 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1513696 - SURFACE
      ?auto_1513697 - SURFACE
      ?auto_1513698 - SURFACE
      ?auto_1513699 - SURFACE
      ?auto_1513700 - SURFACE
    )
    :vars
    (
      ?auto_1513704 - HOIST
      ?auto_1513703 - PLACE
      ?auto_1513706 - PLACE
      ?auto_1513705 - HOIST
      ?auto_1513702 - SURFACE
      ?auto_1513701 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1513704 ?auto_1513703 ) ( IS-CRATE ?auto_1513700 ) ( not ( = ?auto_1513699 ?auto_1513700 ) ) ( not ( = ?auto_1513698 ?auto_1513699 ) ) ( not ( = ?auto_1513698 ?auto_1513700 ) ) ( not ( = ?auto_1513706 ?auto_1513703 ) ) ( HOIST-AT ?auto_1513705 ?auto_1513706 ) ( not ( = ?auto_1513704 ?auto_1513705 ) ) ( AVAILABLE ?auto_1513705 ) ( SURFACE-AT ?auto_1513700 ?auto_1513706 ) ( ON ?auto_1513700 ?auto_1513702 ) ( CLEAR ?auto_1513700 ) ( not ( = ?auto_1513699 ?auto_1513702 ) ) ( not ( = ?auto_1513700 ?auto_1513702 ) ) ( not ( = ?auto_1513698 ?auto_1513702 ) ) ( TRUCK-AT ?auto_1513701 ?auto_1513703 ) ( SURFACE-AT ?auto_1513698 ?auto_1513703 ) ( CLEAR ?auto_1513698 ) ( IS-CRATE ?auto_1513699 ) ( AVAILABLE ?auto_1513704 ) ( IN ?auto_1513699 ?auto_1513701 ) ( ON ?auto_1513697 ?auto_1513696 ) ( ON ?auto_1513698 ?auto_1513697 ) ( not ( = ?auto_1513696 ?auto_1513697 ) ) ( not ( = ?auto_1513696 ?auto_1513698 ) ) ( not ( = ?auto_1513696 ?auto_1513699 ) ) ( not ( = ?auto_1513696 ?auto_1513700 ) ) ( not ( = ?auto_1513696 ?auto_1513702 ) ) ( not ( = ?auto_1513697 ?auto_1513698 ) ) ( not ( = ?auto_1513697 ?auto_1513699 ) ) ( not ( = ?auto_1513697 ?auto_1513700 ) ) ( not ( = ?auto_1513697 ?auto_1513702 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1513698 ?auto_1513699 ?auto_1513700 )
      ( MAKE-4CRATE-VERIFY ?auto_1513696 ?auto_1513697 ?auto_1513698 ?auto_1513699 ?auto_1513700 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1514356 - SURFACE
      ?auto_1514357 - SURFACE
      ?auto_1514358 - SURFACE
      ?auto_1514359 - SURFACE
      ?auto_1514360 - SURFACE
      ?auto_1514361 - SURFACE
    )
    :vars
    (
      ?auto_1514363 - HOIST
      ?auto_1514362 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1514363 ?auto_1514362 ) ( SURFACE-AT ?auto_1514360 ?auto_1514362 ) ( CLEAR ?auto_1514360 ) ( LIFTING ?auto_1514363 ?auto_1514361 ) ( IS-CRATE ?auto_1514361 ) ( not ( = ?auto_1514360 ?auto_1514361 ) ) ( ON ?auto_1514357 ?auto_1514356 ) ( ON ?auto_1514358 ?auto_1514357 ) ( ON ?auto_1514359 ?auto_1514358 ) ( ON ?auto_1514360 ?auto_1514359 ) ( not ( = ?auto_1514356 ?auto_1514357 ) ) ( not ( = ?auto_1514356 ?auto_1514358 ) ) ( not ( = ?auto_1514356 ?auto_1514359 ) ) ( not ( = ?auto_1514356 ?auto_1514360 ) ) ( not ( = ?auto_1514356 ?auto_1514361 ) ) ( not ( = ?auto_1514357 ?auto_1514358 ) ) ( not ( = ?auto_1514357 ?auto_1514359 ) ) ( not ( = ?auto_1514357 ?auto_1514360 ) ) ( not ( = ?auto_1514357 ?auto_1514361 ) ) ( not ( = ?auto_1514358 ?auto_1514359 ) ) ( not ( = ?auto_1514358 ?auto_1514360 ) ) ( not ( = ?auto_1514358 ?auto_1514361 ) ) ( not ( = ?auto_1514359 ?auto_1514360 ) ) ( not ( = ?auto_1514359 ?auto_1514361 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1514360 ?auto_1514361 )
      ( MAKE-5CRATE-VERIFY ?auto_1514356 ?auto_1514357 ?auto_1514358 ?auto_1514359 ?auto_1514360 ?auto_1514361 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1514390 - SURFACE
      ?auto_1514391 - SURFACE
      ?auto_1514392 - SURFACE
      ?auto_1514393 - SURFACE
      ?auto_1514394 - SURFACE
      ?auto_1514395 - SURFACE
    )
    :vars
    (
      ?auto_1514398 - HOIST
      ?auto_1514397 - PLACE
      ?auto_1514396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1514398 ?auto_1514397 ) ( SURFACE-AT ?auto_1514394 ?auto_1514397 ) ( CLEAR ?auto_1514394 ) ( IS-CRATE ?auto_1514395 ) ( not ( = ?auto_1514394 ?auto_1514395 ) ) ( TRUCK-AT ?auto_1514396 ?auto_1514397 ) ( AVAILABLE ?auto_1514398 ) ( IN ?auto_1514395 ?auto_1514396 ) ( ON ?auto_1514394 ?auto_1514393 ) ( not ( = ?auto_1514393 ?auto_1514394 ) ) ( not ( = ?auto_1514393 ?auto_1514395 ) ) ( ON ?auto_1514391 ?auto_1514390 ) ( ON ?auto_1514392 ?auto_1514391 ) ( ON ?auto_1514393 ?auto_1514392 ) ( not ( = ?auto_1514390 ?auto_1514391 ) ) ( not ( = ?auto_1514390 ?auto_1514392 ) ) ( not ( = ?auto_1514390 ?auto_1514393 ) ) ( not ( = ?auto_1514390 ?auto_1514394 ) ) ( not ( = ?auto_1514390 ?auto_1514395 ) ) ( not ( = ?auto_1514391 ?auto_1514392 ) ) ( not ( = ?auto_1514391 ?auto_1514393 ) ) ( not ( = ?auto_1514391 ?auto_1514394 ) ) ( not ( = ?auto_1514391 ?auto_1514395 ) ) ( not ( = ?auto_1514392 ?auto_1514393 ) ) ( not ( = ?auto_1514392 ?auto_1514394 ) ) ( not ( = ?auto_1514392 ?auto_1514395 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1514393 ?auto_1514394 ?auto_1514395 )
      ( MAKE-5CRATE-VERIFY ?auto_1514390 ?auto_1514391 ?auto_1514392 ?auto_1514393 ?auto_1514394 ?auto_1514395 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1514430 - SURFACE
      ?auto_1514431 - SURFACE
      ?auto_1514432 - SURFACE
      ?auto_1514433 - SURFACE
      ?auto_1514434 - SURFACE
      ?auto_1514435 - SURFACE
    )
    :vars
    (
      ?auto_1514437 - HOIST
      ?auto_1514438 - PLACE
      ?auto_1514439 - TRUCK
      ?auto_1514436 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1514437 ?auto_1514438 ) ( SURFACE-AT ?auto_1514434 ?auto_1514438 ) ( CLEAR ?auto_1514434 ) ( IS-CRATE ?auto_1514435 ) ( not ( = ?auto_1514434 ?auto_1514435 ) ) ( AVAILABLE ?auto_1514437 ) ( IN ?auto_1514435 ?auto_1514439 ) ( ON ?auto_1514434 ?auto_1514433 ) ( not ( = ?auto_1514433 ?auto_1514434 ) ) ( not ( = ?auto_1514433 ?auto_1514435 ) ) ( TRUCK-AT ?auto_1514439 ?auto_1514436 ) ( not ( = ?auto_1514436 ?auto_1514438 ) ) ( ON ?auto_1514431 ?auto_1514430 ) ( ON ?auto_1514432 ?auto_1514431 ) ( ON ?auto_1514433 ?auto_1514432 ) ( not ( = ?auto_1514430 ?auto_1514431 ) ) ( not ( = ?auto_1514430 ?auto_1514432 ) ) ( not ( = ?auto_1514430 ?auto_1514433 ) ) ( not ( = ?auto_1514430 ?auto_1514434 ) ) ( not ( = ?auto_1514430 ?auto_1514435 ) ) ( not ( = ?auto_1514431 ?auto_1514432 ) ) ( not ( = ?auto_1514431 ?auto_1514433 ) ) ( not ( = ?auto_1514431 ?auto_1514434 ) ) ( not ( = ?auto_1514431 ?auto_1514435 ) ) ( not ( = ?auto_1514432 ?auto_1514433 ) ) ( not ( = ?auto_1514432 ?auto_1514434 ) ) ( not ( = ?auto_1514432 ?auto_1514435 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1514433 ?auto_1514434 ?auto_1514435 )
      ( MAKE-5CRATE-VERIFY ?auto_1514430 ?auto_1514431 ?auto_1514432 ?auto_1514433 ?auto_1514434 ?auto_1514435 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1514475 - SURFACE
      ?auto_1514476 - SURFACE
      ?auto_1514477 - SURFACE
      ?auto_1514478 - SURFACE
      ?auto_1514479 - SURFACE
      ?auto_1514480 - SURFACE
    )
    :vars
    (
      ?auto_1514482 - HOIST
      ?auto_1514483 - PLACE
      ?auto_1514481 - TRUCK
      ?auto_1514485 - PLACE
      ?auto_1514484 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1514482 ?auto_1514483 ) ( SURFACE-AT ?auto_1514479 ?auto_1514483 ) ( CLEAR ?auto_1514479 ) ( IS-CRATE ?auto_1514480 ) ( not ( = ?auto_1514479 ?auto_1514480 ) ) ( AVAILABLE ?auto_1514482 ) ( ON ?auto_1514479 ?auto_1514478 ) ( not ( = ?auto_1514478 ?auto_1514479 ) ) ( not ( = ?auto_1514478 ?auto_1514480 ) ) ( TRUCK-AT ?auto_1514481 ?auto_1514485 ) ( not ( = ?auto_1514485 ?auto_1514483 ) ) ( HOIST-AT ?auto_1514484 ?auto_1514485 ) ( LIFTING ?auto_1514484 ?auto_1514480 ) ( not ( = ?auto_1514482 ?auto_1514484 ) ) ( ON ?auto_1514476 ?auto_1514475 ) ( ON ?auto_1514477 ?auto_1514476 ) ( ON ?auto_1514478 ?auto_1514477 ) ( not ( = ?auto_1514475 ?auto_1514476 ) ) ( not ( = ?auto_1514475 ?auto_1514477 ) ) ( not ( = ?auto_1514475 ?auto_1514478 ) ) ( not ( = ?auto_1514475 ?auto_1514479 ) ) ( not ( = ?auto_1514475 ?auto_1514480 ) ) ( not ( = ?auto_1514476 ?auto_1514477 ) ) ( not ( = ?auto_1514476 ?auto_1514478 ) ) ( not ( = ?auto_1514476 ?auto_1514479 ) ) ( not ( = ?auto_1514476 ?auto_1514480 ) ) ( not ( = ?auto_1514477 ?auto_1514478 ) ) ( not ( = ?auto_1514477 ?auto_1514479 ) ) ( not ( = ?auto_1514477 ?auto_1514480 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1514478 ?auto_1514479 ?auto_1514480 )
      ( MAKE-5CRATE-VERIFY ?auto_1514475 ?auto_1514476 ?auto_1514477 ?auto_1514478 ?auto_1514479 ?auto_1514480 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1514525 - SURFACE
      ?auto_1514526 - SURFACE
      ?auto_1514527 - SURFACE
      ?auto_1514528 - SURFACE
      ?auto_1514529 - SURFACE
      ?auto_1514530 - SURFACE
    )
    :vars
    (
      ?auto_1514532 - HOIST
      ?auto_1514535 - PLACE
      ?auto_1514533 - TRUCK
      ?auto_1514531 - PLACE
      ?auto_1514534 - HOIST
      ?auto_1514536 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1514532 ?auto_1514535 ) ( SURFACE-AT ?auto_1514529 ?auto_1514535 ) ( CLEAR ?auto_1514529 ) ( IS-CRATE ?auto_1514530 ) ( not ( = ?auto_1514529 ?auto_1514530 ) ) ( AVAILABLE ?auto_1514532 ) ( ON ?auto_1514529 ?auto_1514528 ) ( not ( = ?auto_1514528 ?auto_1514529 ) ) ( not ( = ?auto_1514528 ?auto_1514530 ) ) ( TRUCK-AT ?auto_1514533 ?auto_1514531 ) ( not ( = ?auto_1514531 ?auto_1514535 ) ) ( HOIST-AT ?auto_1514534 ?auto_1514531 ) ( not ( = ?auto_1514532 ?auto_1514534 ) ) ( AVAILABLE ?auto_1514534 ) ( SURFACE-AT ?auto_1514530 ?auto_1514531 ) ( ON ?auto_1514530 ?auto_1514536 ) ( CLEAR ?auto_1514530 ) ( not ( = ?auto_1514529 ?auto_1514536 ) ) ( not ( = ?auto_1514530 ?auto_1514536 ) ) ( not ( = ?auto_1514528 ?auto_1514536 ) ) ( ON ?auto_1514526 ?auto_1514525 ) ( ON ?auto_1514527 ?auto_1514526 ) ( ON ?auto_1514528 ?auto_1514527 ) ( not ( = ?auto_1514525 ?auto_1514526 ) ) ( not ( = ?auto_1514525 ?auto_1514527 ) ) ( not ( = ?auto_1514525 ?auto_1514528 ) ) ( not ( = ?auto_1514525 ?auto_1514529 ) ) ( not ( = ?auto_1514525 ?auto_1514530 ) ) ( not ( = ?auto_1514525 ?auto_1514536 ) ) ( not ( = ?auto_1514526 ?auto_1514527 ) ) ( not ( = ?auto_1514526 ?auto_1514528 ) ) ( not ( = ?auto_1514526 ?auto_1514529 ) ) ( not ( = ?auto_1514526 ?auto_1514530 ) ) ( not ( = ?auto_1514526 ?auto_1514536 ) ) ( not ( = ?auto_1514527 ?auto_1514528 ) ) ( not ( = ?auto_1514527 ?auto_1514529 ) ) ( not ( = ?auto_1514527 ?auto_1514530 ) ) ( not ( = ?auto_1514527 ?auto_1514536 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1514528 ?auto_1514529 ?auto_1514530 )
      ( MAKE-5CRATE-VERIFY ?auto_1514525 ?auto_1514526 ?auto_1514527 ?auto_1514528 ?auto_1514529 ?auto_1514530 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1514576 - SURFACE
      ?auto_1514577 - SURFACE
      ?auto_1514578 - SURFACE
      ?auto_1514579 - SURFACE
      ?auto_1514580 - SURFACE
      ?auto_1514581 - SURFACE
    )
    :vars
    (
      ?auto_1514583 - HOIST
      ?auto_1514587 - PLACE
      ?auto_1514582 - PLACE
      ?auto_1514586 - HOIST
      ?auto_1514584 - SURFACE
      ?auto_1514585 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1514583 ?auto_1514587 ) ( SURFACE-AT ?auto_1514580 ?auto_1514587 ) ( CLEAR ?auto_1514580 ) ( IS-CRATE ?auto_1514581 ) ( not ( = ?auto_1514580 ?auto_1514581 ) ) ( AVAILABLE ?auto_1514583 ) ( ON ?auto_1514580 ?auto_1514579 ) ( not ( = ?auto_1514579 ?auto_1514580 ) ) ( not ( = ?auto_1514579 ?auto_1514581 ) ) ( not ( = ?auto_1514582 ?auto_1514587 ) ) ( HOIST-AT ?auto_1514586 ?auto_1514582 ) ( not ( = ?auto_1514583 ?auto_1514586 ) ) ( AVAILABLE ?auto_1514586 ) ( SURFACE-AT ?auto_1514581 ?auto_1514582 ) ( ON ?auto_1514581 ?auto_1514584 ) ( CLEAR ?auto_1514581 ) ( not ( = ?auto_1514580 ?auto_1514584 ) ) ( not ( = ?auto_1514581 ?auto_1514584 ) ) ( not ( = ?auto_1514579 ?auto_1514584 ) ) ( TRUCK-AT ?auto_1514585 ?auto_1514587 ) ( ON ?auto_1514577 ?auto_1514576 ) ( ON ?auto_1514578 ?auto_1514577 ) ( ON ?auto_1514579 ?auto_1514578 ) ( not ( = ?auto_1514576 ?auto_1514577 ) ) ( not ( = ?auto_1514576 ?auto_1514578 ) ) ( not ( = ?auto_1514576 ?auto_1514579 ) ) ( not ( = ?auto_1514576 ?auto_1514580 ) ) ( not ( = ?auto_1514576 ?auto_1514581 ) ) ( not ( = ?auto_1514576 ?auto_1514584 ) ) ( not ( = ?auto_1514577 ?auto_1514578 ) ) ( not ( = ?auto_1514577 ?auto_1514579 ) ) ( not ( = ?auto_1514577 ?auto_1514580 ) ) ( not ( = ?auto_1514577 ?auto_1514581 ) ) ( not ( = ?auto_1514577 ?auto_1514584 ) ) ( not ( = ?auto_1514578 ?auto_1514579 ) ) ( not ( = ?auto_1514578 ?auto_1514580 ) ) ( not ( = ?auto_1514578 ?auto_1514581 ) ) ( not ( = ?auto_1514578 ?auto_1514584 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1514579 ?auto_1514580 ?auto_1514581 )
      ( MAKE-5CRATE-VERIFY ?auto_1514576 ?auto_1514577 ?auto_1514578 ?auto_1514579 ?auto_1514580 ?auto_1514581 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1514627 - SURFACE
      ?auto_1514628 - SURFACE
      ?auto_1514629 - SURFACE
      ?auto_1514630 - SURFACE
      ?auto_1514631 - SURFACE
      ?auto_1514632 - SURFACE
    )
    :vars
    (
      ?auto_1514637 - HOIST
      ?auto_1514634 - PLACE
      ?auto_1514633 - PLACE
      ?auto_1514638 - HOIST
      ?auto_1514636 - SURFACE
      ?auto_1514635 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1514637 ?auto_1514634 ) ( IS-CRATE ?auto_1514632 ) ( not ( = ?auto_1514631 ?auto_1514632 ) ) ( not ( = ?auto_1514630 ?auto_1514631 ) ) ( not ( = ?auto_1514630 ?auto_1514632 ) ) ( not ( = ?auto_1514633 ?auto_1514634 ) ) ( HOIST-AT ?auto_1514638 ?auto_1514633 ) ( not ( = ?auto_1514637 ?auto_1514638 ) ) ( AVAILABLE ?auto_1514638 ) ( SURFACE-AT ?auto_1514632 ?auto_1514633 ) ( ON ?auto_1514632 ?auto_1514636 ) ( CLEAR ?auto_1514632 ) ( not ( = ?auto_1514631 ?auto_1514636 ) ) ( not ( = ?auto_1514632 ?auto_1514636 ) ) ( not ( = ?auto_1514630 ?auto_1514636 ) ) ( TRUCK-AT ?auto_1514635 ?auto_1514634 ) ( SURFACE-AT ?auto_1514630 ?auto_1514634 ) ( CLEAR ?auto_1514630 ) ( LIFTING ?auto_1514637 ?auto_1514631 ) ( IS-CRATE ?auto_1514631 ) ( ON ?auto_1514628 ?auto_1514627 ) ( ON ?auto_1514629 ?auto_1514628 ) ( ON ?auto_1514630 ?auto_1514629 ) ( not ( = ?auto_1514627 ?auto_1514628 ) ) ( not ( = ?auto_1514627 ?auto_1514629 ) ) ( not ( = ?auto_1514627 ?auto_1514630 ) ) ( not ( = ?auto_1514627 ?auto_1514631 ) ) ( not ( = ?auto_1514627 ?auto_1514632 ) ) ( not ( = ?auto_1514627 ?auto_1514636 ) ) ( not ( = ?auto_1514628 ?auto_1514629 ) ) ( not ( = ?auto_1514628 ?auto_1514630 ) ) ( not ( = ?auto_1514628 ?auto_1514631 ) ) ( not ( = ?auto_1514628 ?auto_1514632 ) ) ( not ( = ?auto_1514628 ?auto_1514636 ) ) ( not ( = ?auto_1514629 ?auto_1514630 ) ) ( not ( = ?auto_1514629 ?auto_1514631 ) ) ( not ( = ?auto_1514629 ?auto_1514632 ) ) ( not ( = ?auto_1514629 ?auto_1514636 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1514630 ?auto_1514631 ?auto_1514632 )
      ( MAKE-5CRATE-VERIFY ?auto_1514627 ?auto_1514628 ?auto_1514629 ?auto_1514630 ?auto_1514631 ?auto_1514632 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1514678 - SURFACE
      ?auto_1514679 - SURFACE
      ?auto_1514680 - SURFACE
      ?auto_1514681 - SURFACE
      ?auto_1514682 - SURFACE
      ?auto_1514683 - SURFACE
    )
    :vars
    (
      ?auto_1514688 - HOIST
      ?auto_1514689 - PLACE
      ?auto_1514687 - PLACE
      ?auto_1514685 - HOIST
      ?auto_1514684 - SURFACE
      ?auto_1514686 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1514688 ?auto_1514689 ) ( IS-CRATE ?auto_1514683 ) ( not ( = ?auto_1514682 ?auto_1514683 ) ) ( not ( = ?auto_1514681 ?auto_1514682 ) ) ( not ( = ?auto_1514681 ?auto_1514683 ) ) ( not ( = ?auto_1514687 ?auto_1514689 ) ) ( HOIST-AT ?auto_1514685 ?auto_1514687 ) ( not ( = ?auto_1514688 ?auto_1514685 ) ) ( AVAILABLE ?auto_1514685 ) ( SURFACE-AT ?auto_1514683 ?auto_1514687 ) ( ON ?auto_1514683 ?auto_1514684 ) ( CLEAR ?auto_1514683 ) ( not ( = ?auto_1514682 ?auto_1514684 ) ) ( not ( = ?auto_1514683 ?auto_1514684 ) ) ( not ( = ?auto_1514681 ?auto_1514684 ) ) ( TRUCK-AT ?auto_1514686 ?auto_1514689 ) ( SURFACE-AT ?auto_1514681 ?auto_1514689 ) ( CLEAR ?auto_1514681 ) ( IS-CRATE ?auto_1514682 ) ( AVAILABLE ?auto_1514688 ) ( IN ?auto_1514682 ?auto_1514686 ) ( ON ?auto_1514679 ?auto_1514678 ) ( ON ?auto_1514680 ?auto_1514679 ) ( ON ?auto_1514681 ?auto_1514680 ) ( not ( = ?auto_1514678 ?auto_1514679 ) ) ( not ( = ?auto_1514678 ?auto_1514680 ) ) ( not ( = ?auto_1514678 ?auto_1514681 ) ) ( not ( = ?auto_1514678 ?auto_1514682 ) ) ( not ( = ?auto_1514678 ?auto_1514683 ) ) ( not ( = ?auto_1514678 ?auto_1514684 ) ) ( not ( = ?auto_1514679 ?auto_1514680 ) ) ( not ( = ?auto_1514679 ?auto_1514681 ) ) ( not ( = ?auto_1514679 ?auto_1514682 ) ) ( not ( = ?auto_1514679 ?auto_1514683 ) ) ( not ( = ?auto_1514679 ?auto_1514684 ) ) ( not ( = ?auto_1514680 ?auto_1514681 ) ) ( not ( = ?auto_1514680 ?auto_1514682 ) ) ( not ( = ?auto_1514680 ?auto_1514683 ) ) ( not ( = ?auto_1514680 ?auto_1514684 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1514681 ?auto_1514682 ?auto_1514683 )
      ( MAKE-5CRATE-VERIFY ?auto_1514678 ?auto_1514679 ?auto_1514680 ?auto_1514681 ?auto_1514682 ?auto_1514683 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1515670 - SURFACE
      ?auto_1515671 - SURFACE
    )
    :vars
    (
      ?auto_1515677 - HOIST
      ?auto_1515672 - PLACE
      ?auto_1515678 - SURFACE
      ?auto_1515676 - TRUCK
      ?auto_1515674 - PLACE
      ?auto_1515675 - HOIST
      ?auto_1515673 - SURFACE
      ?auto_1515679 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1515677 ?auto_1515672 ) ( SURFACE-AT ?auto_1515670 ?auto_1515672 ) ( CLEAR ?auto_1515670 ) ( IS-CRATE ?auto_1515671 ) ( not ( = ?auto_1515670 ?auto_1515671 ) ) ( AVAILABLE ?auto_1515677 ) ( ON ?auto_1515670 ?auto_1515678 ) ( not ( = ?auto_1515678 ?auto_1515670 ) ) ( not ( = ?auto_1515678 ?auto_1515671 ) ) ( TRUCK-AT ?auto_1515676 ?auto_1515674 ) ( not ( = ?auto_1515674 ?auto_1515672 ) ) ( HOIST-AT ?auto_1515675 ?auto_1515674 ) ( not ( = ?auto_1515677 ?auto_1515675 ) ) ( SURFACE-AT ?auto_1515671 ?auto_1515674 ) ( ON ?auto_1515671 ?auto_1515673 ) ( CLEAR ?auto_1515671 ) ( not ( = ?auto_1515670 ?auto_1515673 ) ) ( not ( = ?auto_1515671 ?auto_1515673 ) ) ( not ( = ?auto_1515678 ?auto_1515673 ) ) ( LIFTING ?auto_1515675 ?auto_1515679 ) ( IS-CRATE ?auto_1515679 ) ( not ( = ?auto_1515670 ?auto_1515679 ) ) ( not ( = ?auto_1515671 ?auto_1515679 ) ) ( not ( = ?auto_1515678 ?auto_1515679 ) ) ( not ( = ?auto_1515673 ?auto_1515679 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1515675 ?auto_1515679 ?auto_1515676 ?auto_1515674 )
      ( MAKE-1CRATE ?auto_1515670 ?auto_1515671 )
      ( MAKE-1CRATE-VERIFY ?auto_1515670 ?auto_1515671 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1515885 - SURFACE
      ?auto_1515886 - SURFACE
      ?auto_1515887 - SURFACE
      ?auto_1515888 - SURFACE
      ?auto_1515889 - SURFACE
      ?auto_1515890 - SURFACE
      ?auto_1515891 - SURFACE
    )
    :vars
    (
      ?auto_1515893 - HOIST
      ?auto_1515892 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1515893 ?auto_1515892 ) ( SURFACE-AT ?auto_1515890 ?auto_1515892 ) ( CLEAR ?auto_1515890 ) ( LIFTING ?auto_1515893 ?auto_1515891 ) ( IS-CRATE ?auto_1515891 ) ( not ( = ?auto_1515890 ?auto_1515891 ) ) ( ON ?auto_1515886 ?auto_1515885 ) ( ON ?auto_1515887 ?auto_1515886 ) ( ON ?auto_1515888 ?auto_1515887 ) ( ON ?auto_1515889 ?auto_1515888 ) ( ON ?auto_1515890 ?auto_1515889 ) ( not ( = ?auto_1515885 ?auto_1515886 ) ) ( not ( = ?auto_1515885 ?auto_1515887 ) ) ( not ( = ?auto_1515885 ?auto_1515888 ) ) ( not ( = ?auto_1515885 ?auto_1515889 ) ) ( not ( = ?auto_1515885 ?auto_1515890 ) ) ( not ( = ?auto_1515885 ?auto_1515891 ) ) ( not ( = ?auto_1515886 ?auto_1515887 ) ) ( not ( = ?auto_1515886 ?auto_1515888 ) ) ( not ( = ?auto_1515886 ?auto_1515889 ) ) ( not ( = ?auto_1515886 ?auto_1515890 ) ) ( not ( = ?auto_1515886 ?auto_1515891 ) ) ( not ( = ?auto_1515887 ?auto_1515888 ) ) ( not ( = ?auto_1515887 ?auto_1515889 ) ) ( not ( = ?auto_1515887 ?auto_1515890 ) ) ( not ( = ?auto_1515887 ?auto_1515891 ) ) ( not ( = ?auto_1515888 ?auto_1515889 ) ) ( not ( = ?auto_1515888 ?auto_1515890 ) ) ( not ( = ?auto_1515888 ?auto_1515891 ) ) ( not ( = ?auto_1515889 ?auto_1515890 ) ) ( not ( = ?auto_1515889 ?auto_1515891 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1515890 ?auto_1515891 )
      ( MAKE-6CRATE-VERIFY ?auto_1515885 ?auto_1515886 ?auto_1515887 ?auto_1515888 ?auto_1515889 ?auto_1515890 ?auto_1515891 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1515929 - SURFACE
      ?auto_1515930 - SURFACE
      ?auto_1515931 - SURFACE
      ?auto_1515932 - SURFACE
      ?auto_1515933 - SURFACE
      ?auto_1515934 - SURFACE
      ?auto_1515935 - SURFACE
    )
    :vars
    (
      ?auto_1515937 - HOIST
      ?auto_1515938 - PLACE
      ?auto_1515936 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1515937 ?auto_1515938 ) ( SURFACE-AT ?auto_1515934 ?auto_1515938 ) ( CLEAR ?auto_1515934 ) ( IS-CRATE ?auto_1515935 ) ( not ( = ?auto_1515934 ?auto_1515935 ) ) ( TRUCK-AT ?auto_1515936 ?auto_1515938 ) ( AVAILABLE ?auto_1515937 ) ( IN ?auto_1515935 ?auto_1515936 ) ( ON ?auto_1515934 ?auto_1515933 ) ( not ( = ?auto_1515933 ?auto_1515934 ) ) ( not ( = ?auto_1515933 ?auto_1515935 ) ) ( ON ?auto_1515930 ?auto_1515929 ) ( ON ?auto_1515931 ?auto_1515930 ) ( ON ?auto_1515932 ?auto_1515931 ) ( ON ?auto_1515933 ?auto_1515932 ) ( not ( = ?auto_1515929 ?auto_1515930 ) ) ( not ( = ?auto_1515929 ?auto_1515931 ) ) ( not ( = ?auto_1515929 ?auto_1515932 ) ) ( not ( = ?auto_1515929 ?auto_1515933 ) ) ( not ( = ?auto_1515929 ?auto_1515934 ) ) ( not ( = ?auto_1515929 ?auto_1515935 ) ) ( not ( = ?auto_1515930 ?auto_1515931 ) ) ( not ( = ?auto_1515930 ?auto_1515932 ) ) ( not ( = ?auto_1515930 ?auto_1515933 ) ) ( not ( = ?auto_1515930 ?auto_1515934 ) ) ( not ( = ?auto_1515930 ?auto_1515935 ) ) ( not ( = ?auto_1515931 ?auto_1515932 ) ) ( not ( = ?auto_1515931 ?auto_1515933 ) ) ( not ( = ?auto_1515931 ?auto_1515934 ) ) ( not ( = ?auto_1515931 ?auto_1515935 ) ) ( not ( = ?auto_1515932 ?auto_1515933 ) ) ( not ( = ?auto_1515932 ?auto_1515934 ) ) ( not ( = ?auto_1515932 ?auto_1515935 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1515933 ?auto_1515934 ?auto_1515935 )
      ( MAKE-6CRATE-VERIFY ?auto_1515929 ?auto_1515930 ?auto_1515931 ?auto_1515932 ?auto_1515933 ?auto_1515934 ?auto_1515935 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1515980 - SURFACE
      ?auto_1515981 - SURFACE
      ?auto_1515982 - SURFACE
      ?auto_1515983 - SURFACE
      ?auto_1515984 - SURFACE
      ?auto_1515985 - SURFACE
      ?auto_1515986 - SURFACE
    )
    :vars
    (
      ?auto_1515987 - HOIST
      ?auto_1515988 - PLACE
      ?auto_1515990 - TRUCK
      ?auto_1515989 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1515987 ?auto_1515988 ) ( SURFACE-AT ?auto_1515985 ?auto_1515988 ) ( CLEAR ?auto_1515985 ) ( IS-CRATE ?auto_1515986 ) ( not ( = ?auto_1515985 ?auto_1515986 ) ) ( AVAILABLE ?auto_1515987 ) ( IN ?auto_1515986 ?auto_1515990 ) ( ON ?auto_1515985 ?auto_1515984 ) ( not ( = ?auto_1515984 ?auto_1515985 ) ) ( not ( = ?auto_1515984 ?auto_1515986 ) ) ( TRUCK-AT ?auto_1515990 ?auto_1515989 ) ( not ( = ?auto_1515989 ?auto_1515988 ) ) ( ON ?auto_1515981 ?auto_1515980 ) ( ON ?auto_1515982 ?auto_1515981 ) ( ON ?auto_1515983 ?auto_1515982 ) ( ON ?auto_1515984 ?auto_1515983 ) ( not ( = ?auto_1515980 ?auto_1515981 ) ) ( not ( = ?auto_1515980 ?auto_1515982 ) ) ( not ( = ?auto_1515980 ?auto_1515983 ) ) ( not ( = ?auto_1515980 ?auto_1515984 ) ) ( not ( = ?auto_1515980 ?auto_1515985 ) ) ( not ( = ?auto_1515980 ?auto_1515986 ) ) ( not ( = ?auto_1515981 ?auto_1515982 ) ) ( not ( = ?auto_1515981 ?auto_1515983 ) ) ( not ( = ?auto_1515981 ?auto_1515984 ) ) ( not ( = ?auto_1515981 ?auto_1515985 ) ) ( not ( = ?auto_1515981 ?auto_1515986 ) ) ( not ( = ?auto_1515982 ?auto_1515983 ) ) ( not ( = ?auto_1515982 ?auto_1515984 ) ) ( not ( = ?auto_1515982 ?auto_1515985 ) ) ( not ( = ?auto_1515982 ?auto_1515986 ) ) ( not ( = ?auto_1515983 ?auto_1515984 ) ) ( not ( = ?auto_1515983 ?auto_1515985 ) ) ( not ( = ?auto_1515983 ?auto_1515986 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1515984 ?auto_1515985 ?auto_1515986 )
      ( MAKE-6CRATE-VERIFY ?auto_1515980 ?auto_1515981 ?auto_1515982 ?auto_1515983 ?auto_1515984 ?auto_1515985 ?auto_1515986 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1516037 - SURFACE
      ?auto_1516038 - SURFACE
      ?auto_1516039 - SURFACE
      ?auto_1516040 - SURFACE
      ?auto_1516041 - SURFACE
      ?auto_1516042 - SURFACE
      ?auto_1516043 - SURFACE
    )
    :vars
    (
      ?auto_1516045 - HOIST
      ?auto_1516046 - PLACE
      ?auto_1516048 - TRUCK
      ?auto_1516047 - PLACE
      ?auto_1516044 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1516045 ?auto_1516046 ) ( SURFACE-AT ?auto_1516042 ?auto_1516046 ) ( CLEAR ?auto_1516042 ) ( IS-CRATE ?auto_1516043 ) ( not ( = ?auto_1516042 ?auto_1516043 ) ) ( AVAILABLE ?auto_1516045 ) ( ON ?auto_1516042 ?auto_1516041 ) ( not ( = ?auto_1516041 ?auto_1516042 ) ) ( not ( = ?auto_1516041 ?auto_1516043 ) ) ( TRUCK-AT ?auto_1516048 ?auto_1516047 ) ( not ( = ?auto_1516047 ?auto_1516046 ) ) ( HOIST-AT ?auto_1516044 ?auto_1516047 ) ( LIFTING ?auto_1516044 ?auto_1516043 ) ( not ( = ?auto_1516045 ?auto_1516044 ) ) ( ON ?auto_1516038 ?auto_1516037 ) ( ON ?auto_1516039 ?auto_1516038 ) ( ON ?auto_1516040 ?auto_1516039 ) ( ON ?auto_1516041 ?auto_1516040 ) ( not ( = ?auto_1516037 ?auto_1516038 ) ) ( not ( = ?auto_1516037 ?auto_1516039 ) ) ( not ( = ?auto_1516037 ?auto_1516040 ) ) ( not ( = ?auto_1516037 ?auto_1516041 ) ) ( not ( = ?auto_1516037 ?auto_1516042 ) ) ( not ( = ?auto_1516037 ?auto_1516043 ) ) ( not ( = ?auto_1516038 ?auto_1516039 ) ) ( not ( = ?auto_1516038 ?auto_1516040 ) ) ( not ( = ?auto_1516038 ?auto_1516041 ) ) ( not ( = ?auto_1516038 ?auto_1516042 ) ) ( not ( = ?auto_1516038 ?auto_1516043 ) ) ( not ( = ?auto_1516039 ?auto_1516040 ) ) ( not ( = ?auto_1516039 ?auto_1516041 ) ) ( not ( = ?auto_1516039 ?auto_1516042 ) ) ( not ( = ?auto_1516039 ?auto_1516043 ) ) ( not ( = ?auto_1516040 ?auto_1516041 ) ) ( not ( = ?auto_1516040 ?auto_1516042 ) ) ( not ( = ?auto_1516040 ?auto_1516043 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1516041 ?auto_1516042 ?auto_1516043 )
      ( MAKE-6CRATE-VERIFY ?auto_1516037 ?auto_1516038 ?auto_1516039 ?auto_1516040 ?auto_1516041 ?auto_1516042 ?auto_1516043 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1516100 - SURFACE
      ?auto_1516101 - SURFACE
      ?auto_1516102 - SURFACE
      ?auto_1516103 - SURFACE
      ?auto_1516104 - SURFACE
      ?auto_1516105 - SURFACE
      ?auto_1516106 - SURFACE
    )
    :vars
    (
      ?auto_1516111 - HOIST
      ?auto_1516107 - PLACE
      ?auto_1516109 - TRUCK
      ?auto_1516112 - PLACE
      ?auto_1516110 - HOIST
      ?auto_1516108 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1516111 ?auto_1516107 ) ( SURFACE-AT ?auto_1516105 ?auto_1516107 ) ( CLEAR ?auto_1516105 ) ( IS-CRATE ?auto_1516106 ) ( not ( = ?auto_1516105 ?auto_1516106 ) ) ( AVAILABLE ?auto_1516111 ) ( ON ?auto_1516105 ?auto_1516104 ) ( not ( = ?auto_1516104 ?auto_1516105 ) ) ( not ( = ?auto_1516104 ?auto_1516106 ) ) ( TRUCK-AT ?auto_1516109 ?auto_1516112 ) ( not ( = ?auto_1516112 ?auto_1516107 ) ) ( HOIST-AT ?auto_1516110 ?auto_1516112 ) ( not ( = ?auto_1516111 ?auto_1516110 ) ) ( AVAILABLE ?auto_1516110 ) ( SURFACE-AT ?auto_1516106 ?auto_1516112 ) ( ON ?auto_1516106 ?auto_1516108 ) ( CLEAR ?auto_1516106 ) ( not ( = ?auto_1516105 ?auto_1516108 ) ) ( not ( = ?auto_1516106 ?auto_1516108 ) ) ( not ( = ?auto_1516104 ?auto_1516108 ) ) ( ON ?auto_1516101 ?auto_1516100 ) ( ON ?auto_1516102 ?auto_1516101 ) ( ON ?auto_1516103 ?auto_1516102 ) ( ON ?auto_1516104 ?auto_1516103 ) ( not ( = ?auto_1516100 ?auto_1516101 ) ) ( not ( = ?auto_1516100 ?auto_1516102 ) ) ( not ( = ?auto_1516100 ?auto_1516103 ) ) ( not ( = ?auto_1516100 ?auto_1516104 ) ) ( not ( = ?auto_1516100 ?auto_1516105 ) ) ( not ( = ?auto_1516100 ?auto_1516106 ) ) ( not ( = ?auto_1516100 ?auto_1516108 ) ) ( not ( = ?auto_1516101 ?auto_1516102 ) ) ( not ( = ?auto_1516101 ?auto_1516103 ) ) ( not ( = ?auto_1516101 ?auto_1516104 ) ) ( not ( = ?auto_1516101 ?auto_1516105 ) ) ( not ( = ?auto_1516101 ?auto_1516106 ) ) ( not ( = ?auto_1516101 ?auto_1516108 ) ) ( not ( = ?auto_1516102 ?auto_1516103 ) ) ( not ( = ?auto_1516102 ?auto_1516104 ) ) ( not ( = ?auto_1516102 ?auto_1516105 ) ) ( not ( = ?auto_1516102 ?auto_1516106 ) ) ( not ( = ?auto_1516102 ?auto_1516108 ) ) ( not ( = ?auto_1516103 ?auto_1516104 ) ) ( not ( = ?auto_1516103 ?auto_1516105 ) ) ( not ( = ?auto_1516103 ?auto_1516106 ) ) ( not ( = ?auto_1516103 ?auto_1516108 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1516104 ?auto_1516105 ?auto_1516106 )
      ( MAKE-6CRATE-VERIFY ?auto_1516100 ?auto_1516101 ?auto_1516102 ?auto_1516103 ?auto_1516104 ?auto_1516105 ?auto_1516106 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1516164 - SURFACE
      ?auto_1516165 - SURFACE
      ?auto_1516166 - SURFACE
      ?auto_1516167 - SURFACE
      ?auto_1516168 - SURFACE
      ?auto_1516169 - SURFACE
      ?auto_1516170 - SURFACE
    )
    :vars
    (
      ?auto_1516176 - HOIST
      ?auto_1516174 - PLACE
      ?auto_1516172 - PLACE
      ?auto_1516173 - HOIST
      ?auto_1516171 - SURFACE
      ?auto_1516175 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1516176 ?auto_1516174 ) ( SURFACE-AT ?auto_1516169 ?auto_1516174 ) ( CLEAR ?auto_1516169 ) ( IS-CRATE ?auto_1516170 ) ( not ( = ?auto_1516169 ?auto_1516170 ) ) ( AVAILABLE ?auto_1516176 ) ( ON ?auto_1516169 ?auto_1516168 ) ( not ( = ?auto_1516168 ?auto_1516169 ) ) ( not ( = ?auto_1516168 ?auto_1516170 ) ) ( not ( = ?auto_1516172 ?auto_1516174 ) ) ( HOIST-AT ?auto_1516173 ?auto_1516172 ) ( not ( = ?auto_1516176 ?auto_1516173 ) ) ( AVAILABLE ?auto_1516173 ) ( SURFACE-AT ?auto_1516170 ?auto_1516172 ) ( ON ?auto_1516170 ?auto_1516171 ) ( CLEAR ?auto_1516170 ) ( not ( = ?auto_1516169 ?auto_1516171 ) ) ( not ( = ?auto_1516170 ?auto_1516171 ) ) ( not ( = ?auto_1516168 ?auto_1516171 ) ) ( TRUCK-AT ?auto_1516175 ?auto_1516174 ) ( ON ?auto_1516165 ?auto_1516164 ) ( ON ?auto_1516166 ?auto_1516165 ) ( ON ?auto_1516167 ?auto_1516166 ) ( ON ?auto_1516168 ?auto_1516167 ) ( not ( = ?auto_1516164 ?auto_1516165 ) ) ( not ( = ?auto_1516164 ?auto_1516166 ) ) ( not ( = ?auto_1516164 ?auto_1516167 ) ) ( not ( = ?auto_1516164 ?auto_1516168 ) ) ( not ( = ?auto_1516164 ?auto_1516169 ) ) ( not ( = ?auto_1516164 ?auto_1516170 ) ) ( not ( = ?auto_1516164 ?auto_1516171 ) ) ( not ( = ?auto_1516165 ?auto_1516166 ) ) ( not ( = ?auto_1516165 ?auto_1516167 ) ) ( not ( = ?auto_1516165 ?auto_1516168 ) ) ( not ( = ?auto_1516165 ?auto_1516169 ) ) ( not ( = ?auto_1516165 ?auto_1516170 ) ) ( not ( = ?auto_1516165 ?auto_1516171 ) ) ( not ( = ?auto_1516166 ?auto_1516167 ) ) ( not ( = ?auto_1516166 ?auto_1516168 ) ) ( not ( = ?auto_1516166 ?auto_1516169 ) ) ( not ( = ?auto_1516166 ?auto_1516170 ) ) ( not ( = ?auto_1516166 ?auto_1516171 ) ) ( not ( = ?auto_1516167 ?auto_1516168 ) ) ( not ( = ?auto_1516167 ?auto_1516169 ) ) ( not ( = ?auto_1516167 ?auto_1516170 ) ) ( not ( = ?auto_1516167 ?auto_1516171 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1516168 ?auto_1516169 ?auto_1516170 )
      ( MAKE-6CRATE-VERIFY ?auto_1516164 ?auto_1516165 ?auto_1516166 ?auto_1516167 ?auto_1516168 ?auto_1516169 ?auto_1516170 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1516228 - SURFACE
      ?auto_1516229 - SURFACE
      ?auto_1516230 - SURFACE
      ?auto_1516231 - SURFACE
      ?auto_1516232 - SURFACE
      ?auto_1516233 - SURFACE
      ?auto_1516234 - SURFACE
    )
    :vars
    (
      ?auto_1516238 - HOIST
      ?auto_1516236 - PLACE
      ?auto_1516235 - PLACE
      ?auto_1516239 - HOIST
      ?auto_1516240 - SURFACE
      ?auto_1516237 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1516238 ?auto_1516236 ) ( IS-CRATE ?auto_1516234 ) ( not ( = ?auto_1516233 ?auto_1516234 ) ) ( not ( = ?auto_1516232 ?auto_1516233 ) ) ( not ( = ?auto_1516232 ?auto_1516234 ) ) ( not ( = ?auto_1516235 ?auto_1516236 ) ) ( HOIST-AT ?auto_1516239 ?auto_1516235 ) ( not ( = ?auto_1516238 ?auto_1516239 ) ) ( AVAILABLE ?auto_1516239 ) ( SURFACE-AT ?auto_1516234 ?auto_1516235 ) ( ON ?auto_1516234 ?auto_1516240 ) ( CLEAR ?auto_1516234 ) ( not ( = ?auto_1516233 ?auto_1516240 ) ) ( not ( = ?auto_1516234 ?auto_1516240 ) ) ( not ( = ?auto_1516232 ?auto_1516240 ) ) ( TRUCK-AT ?auto_1516237 ?auto_1516236 ) ( SURFACE-AT ?auto_1516232 ?auto_1516236 ) ( CLEAR ?auto_1516232 ) ( LIFTING ?auto_1516238 ?auto_1516233 ) ( IS-CRATE ?auto_1516233 ) ( ON ?auto_1516229 ?auto_1516228 ) ( ON ?auto_1516230 ?auto_1516229 ) ( ON ?auto_1516231 ?auto_1516230 ) ( ON ?auto_1516232 ?auto_1516231 ) ( not ( = ?auto_1516228 ?auto_1516229 ) ) ( not ( = ?auto_1516228 ?auto_1516230 ) ) ( not ( = ?auto_1516228 ?auto_1516231 ) ) ( not ( = ?auto_1516228 ?auto_1516232 ) ) ( not ( = ?auto_1516228 ?auto_1516233 ) ) ( not ( = ?auto_1516228 ?auto_1516234 ) ) ( not ( = ?auto_1516228 ?auto_1516240 ) ) ( not ( = ?auto_1516229 ?auto_1516230 ) ) ( not ( = ?auto_1516229 ?auto_1516231 ) ) ( not ( = ?auto_1516229 ?auto_1516232 ) ) ( not ( = ?auto_1516229 ?auto_1516233 ) ) ( not ( = ?auto_1516229 ?auto_1516234 ) ) ( not ( = ?auto_1516229 ?auto_1516240 ) ) ( not ( = ?auto_1516230 ?auto_1516231 ) ) ( not ( = ?auto_1516230 ?auto_1516232 ) ) ( not ( = ?auto_1516230 ?auto_1516233 ) ) ( not ( = ?auto_1516230 ?auto_1516234 ) ) ( not ( = ?auto_1516230 ?auto_1516240 ) ) ( not ( = ?auto_1516231 ?auto_1516232 ) ) ( not ( = ?auto_1516231 ?auto_1516233 ) ) ( not ( = ?auto_1516231 ?auto_1516234 ) ) ( not ( = ?auto_1516231 ?auto_1516240 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1516232 ?auto_1516233 ?auto_1516234 )
      ( MAKE-6CRATE-VERIFY ?auto_1516228 ?auto_1516229 ?auto_1516230 ?auto_1516231 ?auto_1516232 ?auto_1516233 ?auto_1516234 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1516292 - SURFACE
      ?auto_1516293 - SURFACE
      ?auto_1516294 - SURFACE
      ?auto_1516295 - SURFACE
      ?auto_1516296 - SURFACE
      ?auto_1516297 - SURFACE
      ?auto_1516298 - SURFACE
    )
    :vars
    (
      ?auto_1516299 - HOIST
      ?auto_1516300 - PLACE
      ?auto_1516301 - PLACE
      ?auto_1516303 - HOIST
      ?auto_1516302 - SURFACE
      ?auto_1516304 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1516299 ?auto_1516300 ) ( IS-CRATE ?auto_1516298 ) ( not ( = ?auto_1516297 ?auto_1516298 ) ) ( not ( = ?auto_1516296 ?auto_1516297 ) ) ( not ( = ?auto_1516296 ?auto_1516298 ) ) ( not ( = ?auto_1516301 ?auto_1516300 ) ) ( HOIST-AT ?auto_1516303 ?auto_1516301 ) ( not ( = ?auto_1516299 ?auto_1516303 ) ) ( AVAILABLE ?auto_1516303 ) ( SURFACE-AT ?auto_1516298 ?auto_1516301 ) ( ON ?auto_1516298 ?auto_1516302 ) ( CLEAR ?auto_1516298 ) ( not ( = ?auto_1516297 ?auto_1516302 ) ) ( not ( = ?auto_1516298 ?auto_1516302 ) ) ( not ( = ?auto_1516296 ?auto_1516302 ) ) ( TRUCK-AT ?auto_1516304 ?auto_1516300 ) ( SURFACE-AT ?auto_1516296 ?auto_1516300 ) ( CLEAR ?auto_1516296 ) ( IS-CRATE ?auto_1516297 ) ( AVAILABLE ?auto_1516299 ) ( IN ?auto_1516297 ?auto_1516304 ) ( ON ?auto_1516293 ?auto_1516292 ) ( ON ?auto_1516294 ?auto_1516293 ) ( ON ?auto_1516295 ?auto_1516294 ) ( ON ?auto_1516296 ?auto_1516295 ) ( not ( = ?auto_1516292 ?auto_1516293 ) ) ( not ( = ?auto_1516292 ?auto_1516294 ) ) ( not ( = ?auto_1516292 ?auto_1516295 ) ) ( not ( = ?auto_1516292 ?auto_1516296 ) ) ( not ( = ?auto_1516292 ?auto_1516297 ) ) ( not ( = ?auto_1516292 ?auto_1516298 ) ) ( not ( = ?auto_1516292 ?auto_1516302 ) ) ( not ( = ?auto_1516293 ?auto_1516294 ) ) ( not ( = ?auto_1516293 ?auto_1516295 ) ) ( not ( = ?auto_1516293 ?auto_1516296 ) ) ( not ( = ?auto_1516293 ?auto_1516297 ) ) ( not ( = ?auto_1516293 ?auto_1516298 ) ) ( not ( = ?auto_1516293 ?auto_1516302 ) ) ( not ( = ?auto_1516294 ?auto_1516295 ) ) ( not ( = ?auto_1516294 ?auto_1516296 ) ) ( not ( = ?auto_1516294 ?auto_1516297 ) ) ( not ( = ?auto_1516294 ?auto_1516298 ) ) ( not ( = ?auto_1516294 ?auto_1516302 ) ) ( not ( = ?auto_1516295 ?auto_1516296 ) ) ( not ( = ?auto_1516295 ?auto_1516297 ) ) ( not ( = ?auto_1516295 ?auto_1516298 ) ) ( not ( = ?auto_1516295 ?auto_1516302 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1516296 ?auto_1516297 ?auto_1516298 )
      ( MAKE-6CRATE-VERIFY ?auto_1516292 ?auto_1516293 ?auto_1516294 ?auto_1516295 ?auto_1516296 ?auto_1516297 ?auto_1516298 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1517963 - SURFACE
      ?auto_1517964 - SURFACE
    )
    :vars
    (
      ?auto_1517967 - HOIST
      ?auto_1517971 - PLACE
      ?auto_1517965 - SURFACE
      ?auto_1517968 - PLACE
      ?auto_1517970 - HOIST
      ?auto_1517969 - SURFACE
      ?auto_1517966 - TRUCK
      ?auto_1517972 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1517967 ?auto_1517971 ) ( SURFACE-AT ?auto_1517963 ?auto_1517971 ) ( CLEAR ?auto_1517963 ) ( IS-CRATE ?auto_1517964 ) ( not ( = ?auto_1517963 ?auto_1517964 ) ) ( ON ?auto_1517963 ?auto_1517965 ) ( not ( = ?auto_1517965 ?auto_1517963 ) ) ( not ( = ?auto_1517965 ?auto_1517964 ) ) ( not ( = ?auto_1517968 ?auto_1517971 ) ) ( HOIST-AT ?auto_1517970 ?auto_1517968 ) ( not ( = ?auto_1517967 ?auto_1517970 ) ) ( AVAILABLE ?auto_1517970 ) ( SURFACE-AT ?auto_1517964 ?auto_1517968 ) ( ON ?auto_1517964 ?auto_1517969 ) ( CLEAR ?auto_1517964 ) ( not ( = ?auto_1517963 ?auto_1517969 ) ) ( not ( = ?auto_1517964 ?auto_1517969 ) ) ( not ( = ?auto_1517965 ?auto_1517969 ) ) ( TRUCK-AT ?auto_1517966 ?auto_1517971 ) ( LIFTING ?auto_1517967 ?auto_1517972 ) ( IS-CRATE ?auto_1517972 ) ( not ( = ?auto_1517963 ?auto_1517972 ) ) ( not ( = ?auto_1517964 ?auto_1517972 ) ) ( not ( = ?auto_1517965 ?auto_1517972 ) ) ( not ( = ?auto_1517969 ?auto_1517972 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1517967 ?auto_1517972 ?auto_1517966 ?auto_1517971 )
      ( MAKE-1CRATE ?auto_1517963 ?auto_1517964 )
      ( MAKE-1CRATE-VERIFY ?auto_1517963 ?auto_1517964 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1518239 - SURFACE
      ?auto_1518240 - SURFACE
      ?auto_1518241 - SURFACE
      ?auto_1518242 - SURFACE
      ?auto_1518243 - SURFACE
      ?auto_1518244 - SURFACE
      ?auto_1518245 - SURFACE
      ?auto_1518246 - SURFACE
    )
    :vars
    (
      ?auto_1518247 - HOIST
      ?auto_1518248 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1518247 ?auto_1518248 ) ( SURFACE-AT ?auto_1518245 ?auto_1518248 ) ( CLEAR ?auto_1518245 ) ( LIFTING ?auto_1518247 ?auto_1518246 ) ( IS-CRATE ?auto_1518246 ) ( not ( = ?auto_1518245 ?auto_1518246 ) ) ( ON ?auto_1518240 ?auto_1518239 ) ( ON ?auto_1518241 ?auto_1518240 ) ( ON ?auto_1518242 ?auto_1518241 ) ( ON ?auto_1518243 ?auto_1518242 ) ( ON ?auto_1518244 ?auto_1518243 ) ( ON ?auto_1518245 ?auto_1518244 ) ( not ( = ?auto_1518239 ?auto_1518240 ) ) ( not ( = ?auto_1518239 ?auto_1518241 ) ) ( not ( = ?auto_1518239 ?auto_1518242 ) ) ( not ( = ?auto_1518239 ?auto_1518243 ) ) ( not ( = ?auto_1518239 ?auto_1518244 ) ) ( not ( = ?auto_1518239 ?auto_1518245 ) ) ( not ( = ?auto_1518239 ?auto_1518246 ) ) ( not ( = ?auto_1518240 ?auto_1518241 ) ) ( not ( = ?auto_1518240 ?auto_1518242 ) ) ( not ( = ?auto_1518240 ?auto_1518243 ) ) ( not ( = ?auto_1518240 ?auto_1518244 ) ) ( not ( = ?auto_1518240 ?auto_1518245 ) ) ( not ( = ?auto_1518240 ?auto_1518246 ) ) ( not ( = ?auto_1518241 ?auto_1518242 ) ) ( not ( = ?auto_1518241 ?auto_1518243 ) ) ( not ( = ?auto_1518241 ?auto_1518244 ) ) ( not ( = ?auto_1518241 ?auto_1518245 ) ) ( not ( = ?auto_1518241 ?auto_1518246 ) ) ( not ( = ?auto_1518242 ?auto_1518243 ) ) ( not ( = ?auto_1518242 ?auto_1518244 ) ) ( not ( = ?auto_1518242 ?auto_1518245 ) ) ( not ( = ?auto_1518242 ?auto_1518246 ) ) ( not ( = ?auto_1518243 ?auto_1518244 ) ) ( not ( = ?auto_1518243 ?auto_1518245 ) ) ( not ( = ?auto_1518243 ?auto_1518246 ) ) ( not ( = ?auto_1518244 ?auto_1518245 ) ) ( not ( = ?auto_1518244 ?auto_1518246 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1518245 ?auto_1518246 )
      ( MAKE-7CRATE-VERIFY ?auto_1518239 ?auto_1518240 ?auto_1518241 ?auto_1518242 ?auto_1518243 ?auto_1518244 ?auto_1518245 ?auto_1518246 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1518294 - SURFACE
      ?auto_1518295 - SURFACE
      ?auto_1518296 - SURFACE
      ?auto_1518297 - SURFACE
      ?auto_1518298 - SURFACE
      ?auto_1518299 - SURFACE
      ?auto_1518300 - SURFACE
      ?auto_1518301 - SURFACE
    )
    :vars
    (
      ?auto_1518302 - HOIST
      ?auto_1518303 - PLACE
      ?auto_1518304 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1518302 ?auto_1518303 ) ( SURFACE-AT ?auto_1518300 ?auto_1518303 ) ( CLEAR ?auto_1518300 ) ( IS-CRATE ?auto_1518301 ) ( not ( = ?auto_1518300 ?auto_1518301 ) ) ( TRUCK-AT ?auto_1518304 ?auto_1518303 ) ( AVAILABLE ?auto_1518302 ) ( IN ?auto_1518301 ?auto_1518304 ) ( ON ?auto_1518300 ?auto_1518299 ) ( not ( = ?auto_1518299 ?auto_1518300 ) ) ( not ( = ?auto_1518299 ?auto_1518301 ) ) ( ON ?auto_1518295 ?auto_1518294 ) ( ON ?auto_1518296 ?auto_1518295 ) ( ON ?auto_1518297 ?auto_1518296 ) ( ON ?auto_1518298 ?auto_1518297 ) ( ON ?auto_1518299 ?auto_1518298 ) ( not ( = ?auto_1518294 ?auto_1518295 ) ) ( not ( = ?auto_1518294 ?auto_1518296 ) ) ( not ( = ?auto_1518294 ?auto_1518297 ) ) ( not ( = ?auto_1518294 ?auto_1518298 ) ) ( not ( = ?auto_1518294 ?auto_1518299 ) ) ( not ( = ?auto_1518294 ?auto_1518300 ) ) ( not ( = ?auto_1518294 ?auto_1518301 ) ) ( not ( = ?auto_1518295 ?auto_1518296 ) ) ( not ( = ?auto_1518295 ?auto_1518297 ) ) ( not ( = ?auto_1518295 ?auto_1518298 ) ) ( not ( = ?auto_1518295 ?auto_1518299 ) ) ( not ( = ?auto_1518295 ?auto_1518300 ) ) ( not ( = ?auto_1518295 ?auto_1518301 ) ) ( not ( = ?auto_1518296 ?auto_1518297 ) ) ( not ( = ?auto_1518296 ?auto_1518298 ) ) ( not ( = ?auto_1518296 ?auto_1518299 ) ) ( not ( = ?auto_1518296 ?auto_1518300 ) ) ( not ( = ?auto_1518296 ?auto_1518301 ) ) ( not ( = ?auto_1518297 ?auto_1518298 ) ) ( not ( = ?auto_1518297 ?auto_1518299 ) ) ( not ( = ?auto_1518297 ?auto_1518300 ) ) ( not ( = ?auto_1518297 ?auto_1518301 ) ) ( not ( = ?auto_1518298 ?auto_1518299 ) ) ( not ( = ?auto_1518298 ?auto_1518300 ) ) ( not ( = ?auto_1518298 ?auto_1518301 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1518299 ?auto_1518300 ?auto_1518301 )
      ( MAKE-7CRATE-VERIFY ?auto_1518294 ?auto_1518295 ?auto_1518296 ?auto_1518297 ?auto_1518298 ?auto_1518299 ?auto_1518300 ?auto_1518301 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1518357 - SURFACE
      ?auto_1518358 - SURFACE
      ?auto_1518359 - SURFACE
      ?auto_1518360 - SURFACE
      ?auto_1518361 - SURFACE
      ?auto_1518362 - SURFACE
      ?auto_1518363 - SURFACE
      ?auto_1518364 - SURFACE
    )
    :vars
    (
      ?auto_1518366 - HOIST
      ?auto_1518367 - PLACE
      ?auto_1518365 - TRUCK
      ?auto_1518368 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1518366 ?auto_1518367 ) ( SURFACE-AT ?auto_1518363 ?auto_1518367 ) ( CLEAR ?auto_1518363 ) ( IS-CRATE ?auto_1518364 ) ( not ( = ?auto_1518363 ?auto_1518364 ) ) ( AVAILABLE ?auto_1518366 ) ( IN ?auto_1518364 ?auto_1518365 ) ( ON ?auto_1518363 ?auto_1518362 ) ( not ( = ?auto_1518362 ?auto_1518363 ) ) ( not ( = ?auto_1518362 ?auto_1518364 ) ) ( TRUCK-AT ?auto_1518365 ?auto_1518368 ) ( not ( = ?auto_1518368 ?auto_1518367 ) ) ( ON ?auto_1518358 ?auto_1518357 ) ( ON ?auto_1518359 ?auto_1518358 ) ( ON ?auto_1518360 ?auto_1518359 ) ( ON ?auto_1518361 ?auto_1518360 ) ( ON ?auto_1518362 ?auto_1518361 ) ( not ( = ?auto_1518357 ?auto_1518358 ) ) ( not ( = ?auto_1518357 ?auto_1518359 ) ) ( not ( = ?auto_1518357 ?auto_1518360 ) ) ( not ( = ?auto_1518357 ?auto_1518361 ) ) ( not ( = ?auto_1518357 ?auto_1518362 ) ) ( not ( = ?auto_1518357 ?auto_1518363 ) ) ( not ( = ?auto_1518357 ?auto_1518364 ) ) ( not ( = ?auto_1518358 ?auto_1518359 ) ) ( not ( = ?auto_1518358 ?auto_1518360 ) ) ( not ( = ?auto_1518358 ?auto_1518361 ) ) ( not ( = ?auto_1518358 ?auto_1518362 ) ) ( not ( = ?auto_1518358 ?auto_1518363 ) ) ( not ( = ?auto_1518358 ?auto_1518364 ) ) ( not ( = ?auto_1518359 ?auto_1518360 ) ) ( not ( = ?auto_1518359 ?auto_1518361 ) ) ( not ( = ?auto_1518359 ?auto_1518362 ) ) ( not ( = ?auto_1518359 ?auto_1518363 ) ) ( not ( = ?auto_1518359 ?auto_1518364 ) ) ( not ( = ?auto_1518360 ?auto_1518361 ) ) ( not ( = ?auto_1518360 ?auto_1518362 ) ) ( not ( = ?auto_1518360 ?auto_1518363 ) ) ( not ( = ?auto_1518360 ?auto_1518364 ) ) ( not ( = ?auto_1518361 ?auto_1518362 ) ) ( not ( = ?auto_1518361 ?auto_1518363 ) ) ( not ( = ?auto_1518361 ?auto_1518364 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1518362 ?auto_1518363 ?auto_1518364 )
      ( MAKE-7CRATE-VERIFY ?auto_1518357 ?auto_1518358 ?auto_1518359 ?auto_1518360 ?auto_1518361 ?auto_1518362 ?auto_1518363 ?auto_1518364 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1518427 - SURFACE
      ?auto_1518428 - SURFACE
      ?auto_1518429 - SURFACE
      ?auto_1518430 - SURFACE
      ?auto_1518431 - SURFACE
      ?auto_1518432 - SURFACE
      ?auto_1518433 - SURFACE
      ?auto_1518434 - SURFACE
    )
    :vars
    (
      ?auto_1518435 - HOIST
      ?auto_1518438 - PLACE
      ?auto_1518436 - TRUCK
      ?auto_1518437 - PLACE
      ?auto_1518439 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1518435 ?auto_1518438 ) ( SURFACE-AT ?auto_1518433 ?auto_1518438 ) ( CLEAR ?auto_1518433 ) ( IS-CRATE ?auto_1518434 ) ( not ( = ?auto_1518433 ?auto_1518434 ) ) ( AVAILABLE ?auto_1518435 ) ( ON ?auto_1518433 ?auto_1518432 ) ( not ( = ?auto_1518432 ?auto_1518433 ) ) ( not ( = ?auto_1518432 ?auto_1518434 ) ) ( TRUCK-AT ?auto_1518436 ?auto_1518437 ) ( not ( = ?auto_1518437 ?auto_1518438 ) ) ( HOIST-AT ?auto_1518439 ?auto_1518437 ) ( LIFTING ?auto_1518439 ?auto_1518434 ) ( not ( = ?auto_1518435 ?auto_1518439 ) ) ( ON ?auto_1518428 ?auto_1518427 ) ( ON ?auto_1518429 ?auto_1518428 ) ( ON ?auto_1518430 ?auto_1518429 ) ( ON ?auto_1518431 ?auto_1518430 ) ( ON ?auto_1518432 ?auto_1518431 ) ( not ( = ?auto_1518427 ?auto_1518428 ) ) ( not ( = ?auto_1518427 ?auto_1518429 ) ) ( not ( = ?auto_1518427 ?auto_1518430 ) ) ( not ( = ?auto_1518427 ?auto_1518431 ) ) ( not ( = ?auto_1518427 ?auto_1518432 ) ) ( not ( = ?auto_1518427 ?auto_1518433 ) ) ( not ( = ?auto_1518427 ?auto_1518434 ) ) ( not ( = ?auto_1518428 ?auto_1518429 ) ) ( not ( = ?auto_1518428 ?auto_1518430 ) ) ( not ( = ?auto_1518428 ?auto_1518431 ) ) ( not ( = ?auto_1518428 ?auto_1518432 ) ) ( not ( = ?auto_1518428 ?auto_1518433 ) ) ( not ( = ?auto_1518428 ?auto_1518434 ) ) ( not ( = ?auto_1518429 ?auto_1518430 ) ) ( not ( = ?auto_1518429 ?auto_1518431 ) ) ( not ( = ?auto_1518429 ?auto_1518432 ) ) ( not ( = ?auto_1518429 ?auto_1518433 ) ) ( not ( = ?auto_1518429 ?auto_1518434 ) ) ( not ( = ?auto_1518430 ?auto_1518431 ) ) ( not ( = ?auto_1518430 ?auto_1518432 ) ) ( not ( = ?auto_1518430 ?auto_1518433 ) ) ( not ( = ?auto_1518430 ?auto_1518434 ) ) ( not ( = ?auto_1518431 ?auto_1518432 ) ) ( not ( = ?auto_1518431 ?auto_1518433 ) ) ( not ( = ?auto_1518431 ?auto_1518434 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1518432 ?auto_1518433 ?auto_1518434 )
      ( MAKE-7CRATE-VERIFY ?auto_1518427 ?auto_1518428 ?auto_1518429 ?auto_1518430 ?auto_1518431 ?auto_1518432 ?auto_1518433 ?auto_1518434 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1518504 - SURFACE
      ?auto_1518505 - SURFACE
      ?auto_1518506 - SURFACE
      ?auto_1518507 - SURFACE
      ?auto_1518508 - SURFACE
      ?auto_1518509 - SURFACE
      ?auto_1518510 - SURFACE
      ?auto_1518511 - SURFACE
    )
    :vars
    (
      ?auto_1518513 - HOIST
      ?auto_1518514 - PLACE
      ?auto_1518512 - TRUCK
      ?auto_1518516 - PLACE
      ?auto_1518515 - HOIST
      ?auto_1518517 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1518513 ?auto_1518514 ) ( SURFACE-AT ?auto_1518510 ?auto_1518514 ) ( CLEAR ?auto_1518510 ) ( IS-CRATE ?auto_1518511 ) ( not ( = ?auto_1518510 ?auto_1518511 ) ) ( AVAILABLE ?auto_1518513 ) ( ON ?auto_1518510 ?auto_1518509 ) ( not ( = ?auto_1518509 ?auto_1518510 ) ) ( not ( = ?auto_1518509 ?auto_1518511 ) ) ( TRUCK-AT ?auto_1518512 ?auto_1518516 ) ( not ( = ?auto_1518516 ?auto_1518514 ) ) ( HOIST-AT ?auto_1518515 ?auto_1518516 ) ( not ( = ?auto_1518513 ?auto_1518515 ) ) ( AVAILABLE ?auto_1518515 ) ( SURFACE-AT ?auto_1518511 ?auto_1518516 ) ( ON ?auto_1518511 ?auto_1518517 ) ( CLEAR ?auto_1518511 ) ( not ( = ?auto_1518510 ?auto_1518517 ) ) ( not ( = ?auto_1518511 ?auto_1518517 ) ) ( not ( = ?auto_1518509 ?auto_1518517 ) ) ( ON ?auto_1518505 ?auto_1518504 ) ( ON ?auto_1518506 ?auto_1518505 ) ( ON ?auto_1518507 ?auto_1518506 ) ( ON ?auto_1518508 ?auto_1518507 ) ( ON ?auto_1518509 ?auto_1518508 ) ( not ( = ?auto_1518504 ?auto_1518505 ) ) ( not ( = ?auto_1518504 ?auto_1518506 ) ) ( not ( = ?auto_1518504 ?auto_1518507 ) ) ( not ( = ?auto_1518504 ?auto_1518508 ) ) ( not ( = ?auto_1518504 ?auto_1518509 ) ) ( not ( = ?auto_1518504 ?auto_1518510 ) ) ( not ( = ?auto_1518504 ?auto_1518511 ) ) ( not ( = ?auto_1518504 ?auto_1518517 ) ) ( not ( = ?auto_1518505 ?auto_1518506 ) ) ( not ( = ?auto_1518505 ?auto_1518507 ) ) ( not ( = ?auto_1518505 ?auto_1518508 ) ) ( not ( = ?auto_1518505 ?auto_1518509 ) ) ( not ( = ?auto_1518505 ?auto_1518510 ) ) ( not ( = ?auto_1518505 ?auto_1518511 ) ) ( not ( = ?auto_1518505 ?auto_1518517 ) ) ( not ( = ?auto_1518506 ?auto_1518507 ) ) ( not ( = ?auto_1518506 ?auto_1518508 ) ) ( not ( = ?auto_1518506 ?auto_1518509 ) ) ( not ( = ?auto_1518506 ?auto_1518510 ) ) ( not ( = ?auto_1518506 ?auto_1518511 ) ) ( not ( = ?auto_1518506 ?auto_1518517 ) ) ( not ( = ?auto_1518507 ?auto_1518508 ) ) ( not ( = ?auto_1518507 ?auto_1518509 ) ) ( not ( = ?auto_1518507 ?auto_1518510 ) ) ( not ( = ?auto_1518507 ?auto_1518511 ) ) ( not ( = ?auto_1518507 ?auto_1518517 ) ) ( not ( = ?auto_1518508 ?auto_1518509 ) ) ( not ( = ?auto_1518508 ?auto_1518510 ) ) ( not ( = ?auto_1518508 ?auto_1518511 ) ) ( not ( = ?auto_1518508 ?auto_1518517 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1518509 ?auto_1518510 ?auto_1518511 )
      ( MAKE-7CRATE-VERIFY ?auto_1518504 ?auto_1518505 ?auto_1518506 ?auto_1518507 ?auto_1518508 ?auto_1518509 ?auto_1518510 ?auto_1518511 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1518582 - SURFACE
      ?auto_1518583 - SURFACE
      ?auto_1518584 - SURFACE
      ?auto_1518585 - SURFACE
      ?auto_1518586 - SURFACE
      ?auto_1518587 - SURFACE
      ?auto_1518588 - SURFACE
      ?auto_1518589 - SURFACE
    )
    :vars
    (
      ?auto_1518593 - HOIST
      ?auto_1518590 - PLACE
      ?auto_1518591 - PLACE
      ?auto_1518592 - HOIST
      ?auto_1518594 - SURFACE
      ?auto_1518595 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1518593 ?auto_1518590 ) ( SURFACE-AT ?auto_1518588 ?auto_1518590 ) ( CLEAR ?auto_1518588 ) ( IS-CRATE ?auto_1518589 ) ( not ( = ?auto_1518588 ?auto_1518589 ) ) ( AVAILABLE ?auto_1518593 ) ( ON ?auto_1518588 ?auto_1518587 ) ( not ( = ?auto_1518587 ?auto_1518588 ) ) ( not ( = ?auto_1518587 ?auto_1518589 ) ) ( not ( = ?auto_1518591 ?auto_1518590 ) ) ( HOIST-AT ?auto_1518592 ?auto_1518591 ) ( not ( = ?auto_1518593 ?auto_1518592 ) ) ( AVAILABLE ?auto_1518592 ) ( SURFACE-AT ?auto_1518589 ?auto_1518591 ) ( ON ?auto_1518589 ?auto_1518594 ) ( CLEAR ?auto_1518589 ) ( not ( = ?auto_1518588 ?auto_1518594 ) ) ( not ( = ?auto_1518589 ?auto_1518594 ) ) ( not ( = ?auto_1518587 ?auto_1518594 ) ) ( TRUCK-AT ?auto_1518595 ?auto_1518590 ) ( ON ?auto_1518583 ?auto_1518582 ) ( ON ?auto_1518584 ?auto_1518583 ) ( ON ?auto_1518585 ?auto_1518584 ) ( ON ?auto_1518586 ?auto_1518585 ) ( ON ?auto_1518587 ?auto_1518586 ) ( not ( = ?auto_1518582 ?auto_1518583 ) ) ( not ( = ?auto_1518582 ?auto_1518584 ) ) ( not ( = ?auto_1518582 ?auto_1518585 ) ) ( not ( = ?auto_1518582 ?auto_1518586 ) ) ( not ( = ?auto_1518582 ?auto_1518587 ) ) ( not ( = ?auto_1518582 ?auto_1518588 ) ) ( not ( = ?auto_1518582 ?auto_1518589 ) ) ( not ( = ?auto_1518582 ?auto_1518594 ) ) ( not ( = ?auto_1518583 ?auto_1518584 ) ) ( not ( = ?auto_1518583 ?auto_1518585 ) ) ( not ( = ?auto_1518583 ?auto_1518586 ) ) ( not ( = ?auto_1518583 ?auto_1518587 ) ) ( not ( = ?auto_1518583 ?auto_1518588 ) ) ( not ( = ?auto_1518583 ?auto_1518589 ) ) ( not ( = ?auto_1518583 ?auto_1518594 ) ) ( not ( = ?auto_1518584 ?auto_1518585 ) ) ( not ( = ?auto_1518584 ?auto_1518586 ) ) ( not ( = ?auto_1518584 ?auto_1518587 ) ) ( not ( = ?auto_1518584 ?auto_1518588 ) ) ( not ( = ?auto_1518584 ?auto_1518589 ) ) ( not ( = ?auto_1518584 ?auto_1518594 ) ) ( not ( = ?auto_1518585 ?auto_1518586 ) ) ( not ( = ?auto_1518585 ?auto_1518587 ) ) ( not ( = ?auto_1518585 ?auto_1518588 ) ) ( not ( = ?auto_1518585 ?auto_1518589 ) ) ( not ( = ?auto_1518585 ?auto_1518594 ) ) ( not ( = ?auto_1518586 ?auto_1518587 ) ) ( not ( = ?auto_1518586 ?auto_1518588 ) ) ( not ( = ?auto_1518586 ?auto_1518589 ) ) ( not ( = ?auto_1518586 ?auto_1518594 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1518587 ?auto_1518588 ?auto_1518589 )
      ( MAKE-7CRATE-VERIFY ?auto_1518582 ?auto_1518583 ?auto_1518584 ?auto_1518585 ?auto_1518586 ?auto_1518587 ?auto_1518588 ?auto_1518589 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1518660 - SURFACE
      ?auto_1518661 - SURFACE
      ?auto_1518662 - SURFACE
      ?auto_1518663 - SURFACE
      ?auto_1518664 - SURFACE
      ?auto_1518665 - SURFACE
      ?auto_1518666 - SURFACE
      ?auto_1518667 - SURFACE
    )
    :vars
    (
      ?auto_1518673 - HOIST
      ?auto_1518670 - PLACE
      ?auto_1518668 - PLACE
      ?auto_1518672 - HOIST
      ?auto_1518669 - SURFACE
      ?auto_1518671 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1518673 ?auto_1518670 ) ( IS-CRATE ?auto_1518667 ) ( not ( = ?auto_1518666 ?auto_1518667 ) ) ( not ( = ?auto_1518665 ?auto_1518666 ) ) ( not ( = ?auto_1518665 ?auto_1518667 ) ) ( not ( = ?auto_1518668 ?auto_1518670 ) ) ( HOIST-AT ?auto_1518672 ?auto_1518668 ) ( not ( = ?auto_1518673 ?auto_1518672 ) ) ( AVAILABLE ?auto_1518672 ) ( SURFACE-AT ?auto_1518667 ?auto_1518668 ) ( ON ?auto_1518667 ?auto_1518669 ) ( CLEAR ?auto_1518667 ) ( not ( = ?auto_1518666 ?auto_1518669 ) ) ( not ( = ?auto_1518667 ?auto_1518669 ) ) ( not ( = ?auto_1518665 ?auto_1518669 ) ) ( TRUCK-AT ?auto_1518671 ?auto_1518670 ) ( SURFACE-AT ?auto_1518665 ?auto_1518670 ) ( CLEAR ?auto_1518665 ) ( LIFTING ?auto_1518673 ?auto_1518666 ) ( IS-CRATE ?auto_1518666 ) ( ON ?auto_1518661 ?auto_1518660 ) ( ON ?auto_1518662 ?auto_1518661 ) ( ON ?auto_1518663 ?auto_1518662 ) ( ON ?auto_1518664 ?auto_1518663 ) ( ON ?auto_1518665 ?auto_1518664 ) ( not ( = ?auto_1518660 ?auto_1518661 ) ) ( not ( = ?auto_1518660 ?auto_1518662 ) ) ( not ( = ?auto_1518660 ?auto_1518663 ) ) ( not ( = ?auto_1518660 ?auto_1518664 ) ) ( not ( = ?auto_1518660 ?auto_1518665 ) ) ( not ( = ?auto_1518660 ?auto_1518666 ) ) ( not ( = ?auto_1518660 ?auto_1518667 ) ) ( not ( = ?auto_1518660 ?auto_1518669 ) ) ( not ( = ?auto_1518661 ?auto_1518662 ) ) ( not ( = ?auto_1518661 ?auto_1518663 ) ) ( not ( = ?auto_1518661 ?auto_1518664 ) ) ( not ( = ?auto_1518661 ?auto_1518665 ) ) ( not ( = ?auto_1518661 ?auto_1518666 ) ) ( not ( = ?auto_1518661 ?auto_1518667 ) ) ( not ( = ?auto_1518661 ?auto_1518669 ) ) ( not ( = ?auto_1518662 ?auto_1518663 ) ) ( not ( = ?auto_1518662 ?auto_1518664 ) ) ( not ( = ?auto_1518662 ?auto_1518665 ) ) ( not ( = ?auto_1518662 ?auto_1518666 ) ) ( not ( = ?auto_1518662 ?auto_1518667 ) ) ( not ( = ?auto_1518662 ?auto_1518669 ) ) ( not ( = ?auto_1518663 ?auto_1518664 ) ) ( not ( = ?auto_1518663 ?auto_1518665 ) ) ( not ( = ?auto_1518663 ?auto_1518666 ) ) ( not ( = ?auto_1518663 ?auto_1518667 ) ) ( not ( = ?auto_1518663 ?auto_1518669 ) ) ( not ( = ?auto_1518664 ?auto_1518665 ) ) ( not ( = ?auto_1518664 ?auto_1518666 ) ) ( not ( = ?auto_1518664 ?auto_1518667 ) ) ( not ( = ?auto_1518664 ?auto_1518669 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1518665 ?auto_1518666 ?auto_1518667 )
      ( MAKE-7CRATE-VERIFY ?auto_1518660 ?auto_1518661 ?auto_1518662 ?auto_1518663 ?auto_1518664 ?auto_1518665 ?auto_1518666 ?auto_1518667 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1518738 - SURFACE
      ?auto_1518739 - SURFACE
      ?auto_1518740 - SURFACE
      ?auto_1518741 - SURFACE
      ?auto_1518742 - SURFACE
      ?auto_1518743 - SURFACE
      ?auto_1518744 - SURFACE
      ?auto_1518745 - SURFACE
    )
    :vars
    (
      ?auto_1518748 - HOIST
      ?auto_1518750 - PLACE
      ?auto_1518749 - PLACE
      ?auto_1518746 - HOIST
      ?auto_1518751 - SURFACE
      ?auto_1518747 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1518748 ?auto_1518750 ) ( IS-CRATE ?auto_1518745 ) ( not ( = ?auto_1518744 ?auto_1518745 ) ) ( not ( = ?auto_1518743 ?auto_1518744 ) ) ( not ( = ?auto_1518743 ?auto_1518745 ) ) ( not ( = ?auto_1518749 ?auto_1518750 ) ) ( HOIST-AT ?auto_1518746 ?auto_1518749 ) ( not ( = ?auto_1518748 ?auto_1518746 ) ) ( AVAILABLE ?auto_1518746 ) ( SURFACE-AT ?auto_1518745 ?auto_1518749 ) ( ON ?auto_1518745 ?auto_1518751 ) ( CLEAR ?auto_1518745 ) ( not ( = ?auto_1518744 ?auto_1518751 ) ) ( not ( = ?auto_1518745 ?auto_1518751 ) ) ( not ( = ?auto_1518743 ?auto_1518751 ) ) ( TRUCK-AT ?auto_1518747 ?auto_1518750 ) ( SURFACE-AT ?auto_1518743 ?auto_1518750 ) ( CLEAR ?auto_1518743 ) ( IS-CRATE ?auto_1518744 ) ( AVAILABLE ?auto_1518748 ) ( IN ?auto_1518744 ?auto_1518747 ) ( ON ?auto_1518739 ?auto_1518738 ) ( ON ?auto_1518740 ?auto_1518739 ) ( ON ?auto_1518741 ?auto_1518740 ) ( ON ?auto_1518742 ?auto_1518741 ) ( ON ?auto_1518743 ?auto_1518742 ) ( not ( = ?auto_1518738 ?auto_1518739 ) ) ( not ( = ?auto_1518738 ?auto_1518740 ) ) ( not ( = ?auto_1518738 ?auto_1518741 ) ) ( not ( = ?auto_1518738 ?auto_1518742 ) ) ( not ( = ?auto_1518738 ?auto_1518743 ) ) ( not ( = ?auto_1518738 ?auto_1518744 ) ) ( not ( = ?auto_1518738 ?auto_1518745 ) ) ( not ( = ?auto_1518738 ?auto_1518751 ) ) ( not ( = ?auto_1518739 ?auto_1518740 ) ) ( not ( = ?auto_1518739 ?auto_1518741 ) ) ( not ( = ?auto_1518739 ?auto_1518742 ) ) ( not ( = ?auto_1518739 ?auto_1518743 ) ) ( not ( = ?auto_1518739 ?auto_1518744 ) ) ( not ( = ?auto_1518739 ?auto_1518745 ) ) ( not ( = ?auto_1518739 ?auto_1518751 ) ) ( not ( = ?auto_1518740 ?auto_1518741 ) ) ( not ( = ?auto_1518740 ?auto_1518742 ) ) ( not ( = ?auto_1518740 ?auto_1518743 ) ) ( not ( = ?auto_1518740 ?auto_1518744 ) ) ( not ( = ?auto_1518740 ?auto_1518745 ) ) ( not ( = ?auto_1518740 ?auto_1518751 ) ) ( not ( = ?auto_1518741 ?auto_1518742 ) ) ( not ( = ?auto_1518741 ?auto_1518743 ) ) ( not ( = ?auto_1518741 ?auto_1518744 ) ) ( not ( = ?auto_1518741 ?auto_1518745 ) ) ( not ( = ?auto_1518741 ?auto_1518751 ) ) ( not ( = ?auto_1518742 ?auto_1518743 ) ) ( not ( = ?auto_1518742 ?auto_1518744 ) ) ( not ( = ?auto_1518742 ?auto_1518745 ) ) ( not ( = ?auto_1518742 ?auto_1518751 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1518743 ?auto_1518744 ?auto_1518745 )
      ( MAKE-7CRATE-VERIFY ?auto_1518738 ?auto_1518739 ?auto_1518740 ?auto_1518741 ?auto_1518742 ?auto_1518743 ?auto_1518744 ?auto_1518745 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1521641 - SURFACE
      ?auto_1521642 - SURFACE
      ?auto_1521643 - SURFACE
      ?auto_1521644 - SURFACE
      ?auto_1521645 - SURFACE
      ?auto_1521646 - SURFACE
      ?auto_1521647 - SURFACE
      ?auto_1521648 - SURFACE
      ?auto_1521649 - SURFACE
    )
    :vars
    (
      ?auto_1521650 - HOIST
      ?auto_1521651 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1521650 ?auto_1521651 ) ( SURFACE-AT ?auto_1521648 ?auto_1521651 ) ( CLEAR ?auto_1521648 ) ( LIFTING ?auto_1521650 ?auto_1521649 ) ( IS-CRATE ?auto_1521649 ) ( not ( = ?auto_1521648 ?auto_1521649 ) ) ( ON ?auto_1521642 ?auto_1521641 ) ( ON ?auto_1521643 ?auto_1521642 ) ( ON ?auto_1521644 ?auto_1521643 ) ( ON ?auto_1521645 ?auto_1521644 ) ( ON ?auto_1521646 ?auto_1521645 ) ( ON ?auto_1521647 ?auto_1521646 ) ( ON ?auto_1521648 ?auto_1521647 ) ( not ( = ?auto_1521641 ?auto_1521642 ) ) ( not ( = ?auto_1521641 ?auto_1521643 ) ) ( not ( = ?auto_1521641 ?auto_1521644 ) ) ( not ( = ?auto_1521641 ?auto_1521645 ) ) ( not ( = ?auto_1521641 ?auto_1521646 ) ) ( not ( = ?auto_1521641 ?auto_1521647 ) ) ( not ( = ?auto_1521641 ?auto_1521648 ) ) ( not ( = ?auto_1521641 ?auto_1521649 ) ) ( not ( = ?auto_1521642 ?auto_1521643 ) ) ( not ( = ?auto_1521642 ?auto_1521644 ) ) ( not ( = ?auto_1521642 ?auto_1521645 ) ) ( not ( = ?auto_1521642 ?auto_1521646 ) ) ( not ( = ?auto_1521642 ?auto_1521647 ) ) ( not ( = ?auto_1521642 ?auto_1521648 ) ) ( not ( = ?auto_1521642 ?auto_1521649 ) ) ( not ( = ?auto_1521643 ?auto_1521644 ) ) ( not ( = ?auto_1521643 ?auto_1521645 ) ) ( not ( = ?auto_1521643 ?auto_1521646 ) ) ( not ( = ?auto_1521643 ?auto_1521647 ) ) ( not ( = ?auto_1521643 ?auto_1521648 ) ) ( not ( = ?auto_1521643 ?auto_1521649 ) ) ( not ( = ?auto_1521644 ?auto_1521645 ) ) ( not ( = ?auto_1521644 ?auto_1521646 ) ) ( not ( = ?auto_1521644 ?auto_1521647 ) ) ( not ( = ?auto_1521644 ?auto_1521648 ) ) ( not ( = ?auto_1521644 ?auto_1521649 ) ) ( not ( = ?auto_1521645 ?auto_1521646 ) ) ( not ( = ?auto_1521645 ?auto_1521647 ) ) ( not ( = ?auto_1521645 ?auto_1521648 ) ) ( not ( = ?auto_1521645 ?auto_1521649 ) ) ( not ( = ?auto_1521646 ?auto_1521647 ) ) ( not ( = ?auto_1521646 ?auto_1521648 ) ) ( not ( = ?auto_1521646 ?auto_1521649 ) ) ( not ( = ?auto_1521647 ?auto_1521648 ) ) ( not ( = ?auto_1521647 ?auto_1521649 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1521648 ?auto_1521649 )
      ( MAKE-8CRATE-VERIFY ?auto_1521641 ?auto_1521642 ?auto_1521643 ?auto_1521644 ?auto_1521645 ?auto_1521646 ?auto_1521647 ?auto_1521648 ?auto_1521649 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1521708 - SURFACE
      ?auto_1521709 - SURFACE
      ?auto_1521710 - SURFACE
      ?auto_1521711 - SURFACE
      ?auto_1521712 - SURFACE
      ?auto_1521713 - SURFACE
      ?auto_1521714 - SURFACE
      ?auto_1521715 - SURFACE
      ?auto_1521716 - SURFACE
    )
    :vars
    (
      ?auto_1521717 - HOIST
      ?auto_1521718 - PLACE
      ?auto_1521719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1521717 ?auto_1521718 ) ( SURFACE-AT ?auto_1521715 ?auto_1521718 ) ( CLEAR ?auto_1521715 ) ( IS-CRATE ?auto_1521716 ) ( not ( = ?auto_1521715 ?auto_1521716 ) ) ( TRUCK-AT ?auto_1521719 ?auto_1521718 ) ( AVAILABLE ?auto_1521717 ) ( IN ?auto_1521716 ?auto_1521719 ) ( ON ?auto_1521715 ?auto_1521714 ) ( not ( = ?auto_1521714 ?auto_1521715 ) ) ( not ( = ?auto_1521714 ?auto_1521716 ) ) ( ON ?auto_1521709 ?auto_1521708 ) ( ON ?auto_1521710 ?auto_1521709 ) ( ON ?auto_1521711 ?auto_1521710 ) ( ON ?auto_1521712 ?auto_1521711 ) ( ON ?auto_1521713 ?auto_1521712 ) ( ON ?auto_1521714 ?auto_1521713 ) ( not ( = ?auto_1521708 ?auto_1521709 ) ) ( not ( = ?auto_1521708 ?auto_1521710 ) ) ( not ( = ?auto_1521708 ?auto_1521711 ) ) ( not ( = ?auto_1521708 ?auto_1521712 ) ) ( not ( = ?auto_1521708 ?auto_1521713 ) ) ( not ( = ?auto_1521708 ?auto_1521714 ) ) ( not ( = ?auto_1521708 ?auto_1521715 ) ) ( not ( = ?auto_1521708 ?auto_1521716 ) ) ( not ( = ?auto_1521709 ?auto_1521710 ) ) ( not ( = ?auto_1521709 ?auto_1521711 ) ) ( not ( = ?auto_1521709 ?auto_1521712 ) ) ( not ( = ?auto_1521709 ?auto_1521713 ) ) ( not ( = ?auto_1521709 ?auto_1521714 ) ) ( not ( = ?auto_1521709 ?auto_1521715 ) ) ( not ( = ?auto_1521709 ?auto_1521716 ) ) ( not ( = ?auto_1521710 ?auto_1521711 ) ) ( not ( = ?auto_1521710 ?auto_1521712 ) ) ( not ( = ?auto_1521710 ?auto_1521713 ) ) ( not ( = ?auto_1521710 ?auto_1521714 ) ) ( not ( = ?auto_1521710 ?auto_1521715 ) ) ( not ( = ?auto_1521710 ?auto_1521716 ) ) ( not ( = ?auto_1521711 ?auto_1521712 ) ) ( not ( = ?auto_1521711 ?auto_1521713 ) ) ( not ( = ?auto_1521711 ?auto_1521714 ) ) ( not ( = ?auto_1521711 ?auto_1521715 ) ) ( not ( = ?auto_1521711 ?auto_1521716 ) ) ( not ( = ?auto_1521712 ?auto_1521713 ) ) ( not ( = ?auto_1521712 ?auto_1521714 ) ) ( not ( = ?auto_1521712 ?auto_1521715 ) ) ( not ( = ?auto_1521712 ?auto_1521716 ) ) ( not ( = ?auto_1521713 ?auto_1521714 ) ) ( not ( = ?auto_1521713 ?auto_1521715 ) ) ( not ( = ?auto_1521713 ?auto_1521716 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1521714 ?auto_1521715 ?auto_1521716 )
      ( MAKE-8CRATE-VERIFY ?auto_1521708 ?auto_1521709 ?auto_1521710 ?auto_1521711 ?auto_1521712 ?auto_1521713 ?auto_1521714 ?auto_1521715 ?auto_1521716 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1521784 - SURFACE
      ?auto_1521785 - SURFACE
      ?auto_1521786 - SURFACE
      ?auto_1521787 - SURFACE
      ?auto_1521788 - SURFACE
      ?auto_1521789 - SURFACE
      ?auto_1521790 - SURFACE
      ?auto_1521791 - SURFACE
      ?auto_1521792 - SURFACE
    )
    :vars
    (
      ?auto_1521795 - HOIST
      ?auto_1521793 - PLACE
      ?auto_1521796 - TRUCK
      ?auto_1521794 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1521795 ?auto_1521793 ) ( SURFACE-AT ?auto_1521791 ?auto_1521793 ) ( CLEAR ?auto_1521791 ) ( IS-CRATE ?auto_1521792 ) ( not ( = ?auto_1521791 ?auto_1521792 ) ) ( AVAILABLE ?auto_1521795 ) ( IN ?auto_1521792 ?auto_1521796 ) ( ON ?auto_1521791 ?auto_1521790 ) ( not ( = ?auto_1521790 ?auto_1521791 ) ) ( not ( = ?auto_1521790 ?auto_1521792 ) ) ( TRUCK-AT ?auto_1521796 ?auto_1521794 ) ( not ( = ?auto_1521794 ?auto_1521793 ) ) ( ON ?auto_1521785 ?auto_1521784 ) ( ON ?auto_1521786 ?auto_1521785 ) ( ON ?auto_1521787 ?auto_1521786 ) ( ON ?auto_1521788 ?auto_1521787 ) ( ON ?auto_1521789 ?auto_1521788 ) ( ON ?auto_1521790 ?auto_1521789 ) ( not ( = ?auto_1521784 ?auto_1521785 ) ) ( not ( = ?auto_1521784 ?auto_1521786 ) ) ( not ( = ?auto_1521784 ?auto_1521787 ) ) ( not ( = ?auto_1521784 ?auto_1521788 ) ) ( not ( = ?auto_1521784 ?auto_1521789 ) ) ( not ( = ?auto_1521784 ?auto_1521790 ) ) ( not ( = ?auto_1521784 ?auto_1521791 ) ) ( not ( = ?auto_1521784 ?auto_1521792 ) ) ( not ( = ?auto_1521785 ?auto_1521786 ) ) ( not ( = ?auto_1521785 ?auto_1521787 ) ) ( not ( = ?auto_1521785 ?auto_1521788 ) ) ( not ( = ?auto_1521785 ?auto_1521789 ) ) ( not ( = ?auto_1521785 ?auto_1521790 ) ) ( not ( = ?auto_1521785 ?auto_1521791 ) ) ( not ( = ?auto_1521785 ?auto_1521792 ) ) ( not ( = ?auto_1521786 ?auto_1521787 ) ) ( not ( = ?auto_1521786 ?auto_1521788 ) ) ( not ( = ?auto_1521786 ?auto_1521789 ) ) ( not ( = ?auto_1521786 ?auto_1521790 ) ) ( not ( = ?auto_1521786 ?auto_1521791 ) ) ( not ( = ?auto_1521786 ?auto_1521792 ) ) ( not ( = ?auto_1521787 ?auto_1521788 ) ) ( not ( = ?auto_1521787 ?auto_1521789 ) ) ( not ( = ?auto_1521787 ?auto_1521790 ) ) ( not ( = ?auto_1521787 ?auto_1521791 ) ) ( not ( = ?auto_1521787 ?auto_1521792 ) ) ( not ( = ?auto_1521788 ?auto_1521789 ) ) ( not ( = ?auto_1521788 ?auto_1521790 ) ) ( not ( = ?auto_1521788 ?auto_1521791 ) ) ( not ( = ?auto_1521788 ?auto_1521792 ) ) ( not ( = ?auto_1521789 ?auto_1521790 ) ) ( not ( = ?auto_1521789 ?auto_1521791 ) ) ( not ( = ?auto_1521789 ?auto_1521792 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1521790 ?auto_1521791 ?auto_1521792 )
      ( MAKE-8CRATE-VERIFY ?auto_1521784 ?auto_1521785 ?auto_1521786 ?auto_1521787 ?auto_1521788 ?auto_1521789 ?auto_1521790 ?auto_1521791 ?auto_1521792 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1521868 - SURFACE
      ?auto_1521869 - SURFACE
      ?auto_1521870 - SURFACE
      ?auto_1521871 - SURFACE
      ?auto_1521872 - SURFACE
      ?auto_1521873 - SURFACE
      ?auto_1521874 - SURFACE
      ?auto_1521875 - SURFACE
      ?auto_1521876 - SURFACE
    )
    :vars
    (
      ?auto_1521877 - HOIST
      ?auto_1521881 - PLACE
      ?auto_1521880 - TRUCK
      ?auto_1521878 - PLACE
      ?auto_1521879 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1521877 ?auto_1521881 ) ( SURFACE-AT ?auto_1521875 ?auto_1521881 ) ( CLEAR ?auto_1521875 ) ( IS-CRATE ?auto_1521876 ) ( not ( = ?auto_1521875 ?auto_1521876 ) ) ( AVAILABLE ?auto_1521877 ) ( ON ?auto_1521875 ?auto_1521874 ) ( not ( = ?auto_1521874 ?auto_1521875 ) ) ( not ( = ?auto_1521874 ?auto_1521876 ) ) ( TRUCK-AT ?auto_1521880 ?auto_1521878 ) ( not ( = ?auto_1521878 ?auto_1521881 ) ) ( HOIST-AT ?auto_1521879 ?auto_1521878 ) ( LIFTING ?auto_1521879 ?auto_1521876 ) ( not ( = ?auto_1521877 ?auto_1521879 ) ) ( ON ?auto_1521869 ?auto_1521868 ) ( ON ?auto_1521870 ?auto_1521869 ) ( ON ?auto_1521871 ?auto_1521870 ) ( ON ?auto_1521872 ?auto_1521871 ) ( ON ?auto_1521873 ?auto_1521872 ) ( ON ?auto_1521874 ?auto_1521873 ) ( not ( = ?auto_1521868 ?auto_1521869 ) ) ( not ( = ?auto_1521868 ?auto_1521870 ) ) ( not ( = ?auto_1521868 ?auto_1521871 ) ) ( not ( = ?auto_1521868 ?auto_1521872 ) ) ( not ( = ?auto_1521868 ?auto_1521873 ) ) ( not ( = ?auto_1521868 ?auto_1521874 ) ) ( not ( = ?auto_1521868 ?auto_1521875 ) ) ( not ( = ?auto_1521868 ?auto_1521876 ) ) ( not ( = ?auto_1521869 ?auto_1521870 ) ) ( not ( = ?auto_1521869 ?auto_1521871 ) ) ( not ( = ?auto_1521869 ?auto_1521872 ) ) ( not ( = ?auto_1521869 ?auto_1521873 ) ) ( not ( = ?auto_1521869 ?auto_1521874 ) ) ( not ( = ?auto_1521869 ?auto_1521875 ) ) ( not ( = ?auto_1521869 ?auto_1521876 ) ) ( not ( = ?auto_1521870 ?auto_1521871 ) ) ( not ( = ?auto_1521870 ?auto_1521872 ) ) ( not ( = ?auto_1521870 ?auto_1521873 ) ) ( not ( = ?auto_1521870 ?auto_1521874 ) ) ( not ( = ?auto_1521870 ?auto_1521875 ) ) ( not ( = ?auto_1521870 ?auto_1521876 ) ) ( not ( = ?auto_1521871 ?auto_1521872 ) ) ( not ( = ?auto_1521871 ?auto_1521873 ) ) ( not ( = ?auto_1521871 ?auto_1521874 ) ) ( not ( = ?auto_1521871 ?auto_1521875 ) ) ( not ( = ?auto_1521871 ?auto_1521876 ) ) ( not ( = ?auto_1521872 ?auto_1521873 ) ) ( not ( = ?auto_1521872 ?auto_1521874 ) ) ( not ( = ?auto_1521872 ?auto_1521875 ) ) ( not ( = ?auto_1521872 ?auto_1521876 ) ) ( not ( = ?auto_1521873 ?auto_1521874 ) ) ( not ( = ?auto_1521873 ?auto_1521875 ) ) ( not ( = ?auto_1521873 ?auto_1521876 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1521874 ?auto_1521875 ?auto_1521876 )
      ( MAKE-8CRATE-VERIFY ?auto_1521868 ?auto_1521869 ?auto_1521870 ?auto_1521871 ?auto_1521872 ?auto_1521873 ?auto_1521874 ?auto_1521875 ?auto_1521876 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1521960 - SURFACE
      ?auto_1521961 - SURFACE
      ?auto_1521962 - SURFACE
      ?auto_1521963 - SURFACE
      ?auto_1521964 - SURFACE
      ?auto_1521965 - SURFACE
      ?auto_1521966 - SURFACE
      ?auto_1521967 - SURFACE
      ?auto_1521968 - SURFACE
    )
    :vars
    (
      ?auto_1521969 - HOIST
      ?auto_1521971 - PLACE
      ?auto_1521970 - TRUCK
      ?auto_1521973 - PLACE
      ?auto_1521972 - HOIST
      ?auto_1521974 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1521969 ?auto_1521971 ) ( SURFACE-AT ?auto_1521967 ?auto_1521971 ) ( CLEAR ?auto_1521967 ) ( IS-CRATE ?auto_1521968 ) ( not ( = ?auto_1521967 ?auto_1521968 ) ) ( AVAILABLE ?auto_1521969 ) ( ON ?auto_1521967 ?auto_1521966 ) ( not ( = ?auto_1521966 ?auto_1521967 ) ) ( not ( = ?auto_1521966 ?auto_1521968 ) ) ( TRUCK-AT ?auto_1521970 ?auto_1521973 ) ( not ( = ?auto_1521973 ?auto_1521971 ) ) ( HOIST-AT ?auto_1521972 ?auto_1521973 ) ( not ( = ?auto_1521969 ?auto_1521972 ) ) ( AVAILABLE ?auto_1521972 ) ( SURFACE-AT ?auto_1521968 ?auto_1521973 ) ( ON ?auto_1521968 ?auto_1521974 ) ( CLEAR ?auto_1521968 ) ( not ( = ?auto_1521967 ?auto_1521974 ) ) ( not ( = ?auto_1521968 ?auto_1521974 ) ) ( not ( = ?auto_1521966 ?auto_1521974 ) ) ( ON ?auto_1521961 ?auto_1521960 ) ( ON ?auto_1521962 ?auto_1521961 ) ( ON ?auto_1521963 ?auto_1521962 ) ( ON ?auto_1521964 ?auto_1521963 ) ( ON ?auto_1521965 ?auto_1521964 ) ( ON ?auto_1521966 ?auto_1521965 ) ( not ( = ?auto_1521960 ?auto_1521961 ) ) ( not ( = ?auto_1521960 ?auto_1521962 ) ) ( not ( = ?auto_1521960 ?auto_1521963 ) ) ( not ( = ?auto_1521960 ?auto_1521964 ) ) ( not ( = ?auto_1521960 ?auto_1521965 ) ) ( not ( = ?auto_1521960 ?auto_1521966 ) ) ( not ( = ?auto_1521960 ?auto_1521967 ) ) ( not ( = ?auto_1521960 ?auto_1521968 ) ) ( not ( = ?auto_1521960 ?auto_1521974 ) ) ( not ( = ?auto_1521961 ?auto_1521962 ) ) ( not ( = ?auto_1521961 ?auto_1521963 ) ) ( not ( = ?auto_1521961 ?auto_1521964 ) ) ( not ( = ?auto_1521961 ?auto_1521965 ) ) ( not ( = ?auto_1521961 ?auto_1521966 ) ) ( not ( = ?auto_1521961 ?auto_1521967 ) ) ( not ( = ?auto_1521961 ?auto_1521968 ) ) ( not ( = ?auto_1521961 ?auto_1521974 ) ) ( not ( = ?auto_1521962 ?auto_1521963 ) ) ( not ( = ?auto_1521962 ?auto_1521964 ) ) ( not ( = ?auto_1521962 ?auto_1521965 ) ) ( not ( = ?auto_1521962 ?auto_1521966 ) ) ( not ( = ?auto_1521962 ?auto_1521967 ) ) ( not ( = ?auto_1521962 ?auto_1521968 ) ) ( not ( = ?auto_1521962 ?auto_1521974 ) ) ( not ( = ?auto_1521963 ?auto_1521964 ) ) ( not ( = ?auto_1521963 ?auto_1521965 ) ) ( not ( = ?auto_1521963 ?auto_1521966 ) ) ( not ( = ?auto_1521963 ?auto_1521967 ) ) ( not ( = ?auto_1521963 ?auto_1521968 ) ) ( not ( = ?auto_1521963 ?auto_1521974 ) ) ( not ( = ?auto_1521964 ?auto_1521965 ) ) ( not ( = ?auto_1521964 ?auto_1521966 ) ) ( not ( = ?auto_1521964 ?auto_1521967 ) ) ( not ( = ?auto_1521964 ?auto_1521968 ) ) ( not ( = ?auto_1521964 ?auto_1521974 ) ) ( not ( = ?auto_1521965 ?auto_1521966 ) ) ( not ( = ?auto_1521965 ?auto_1521967 ) ) ( not ( = ?auto_1521965 ?auto_1521968 ) ) ( not ( = ?auto_1521965 ?auto_1521974 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1521966 ?auto_1521967 ?auto_1521968 )
      ( MAKE-8CRATE-VERIFY ?auto_1521960 ?auto_1521961 ?auto_1521962 ?auto_1521963 ?auto_1521964 ?auto_1521965 ?auto_1521966 ?auto_1521967 ?auto_1521968 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1522053 - SURFACE
      ?auto_1522054 - SURFACE
      ?auto_1522055 - SURFACE
      ?auto_1522056 - SURFACE
      ?auto_1522057 - SURFACE
      ?auto_1522058 - SURFACE
      ?auto_1522059 - SURFACE
      ?auto_1522060 - SURFACE
      ?auto_1522061 - SURFACE
    )
    :vars
    (
      ?auto_1522063 - HOIST
      ?auto_1522066 - PLACE
      ?auto_1522062 - PLACE
      ?auto_1522065 - HOIST
      ?auto_1522064 - SURFACE
      ?auto_1522067 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1522063 ?auto_1522066 ) ( SURFACE-AT ?auto_1522060 ?auto_1522066 ) ( CLEAR ?auto_1522060 ) ( IS-CRATE ?auto_1522061 ) ( not ( = ?auto_1522060 ?auto_1522061 ) ) ( AVAILABLE ?auto_1522063 ) ( ON ?auto_1522060 ?auto_1522059 ) ( not ( = ?auto_1522059 ?auto_1522060 ) ) ( not ( = ?auto_1522059 ?auto_1522061 ) ) ( not ( = ?auto_1522062 ?auto_1522066 ) ) ( HOIST-AT ?auto_1522065 ?auto_1522062 ) ( not ( = ?auto_1522063 ?auto_1522065 ) ) ( AVAILABLE ?auto_1522065 ) ( SURFACE-AT ?auto_1522061 ?auto_1522062 ) ( ON ?auto_1522061 ?auto_1522064 ) ( CLEAR ?auto_1522061 ) ( not ( = ?auto_1522060 ?auto_1522064 ) ) ( not ( = ?auto_1522061 ?auto_1522064 ) ) ( not ( = ?auto_1522059 ?auto_1522064 ) ) ( TRUCK-AT ?auto_1522067 ?auto_1522066 ) ( ON ?auto_1522054 ?auto_1522053 ) ( ON ?auto_1522055 ?auto_1522054 ) ( ON ?auto_1522056 ?auto_1522055 ) ( ON ?auto_1522057 ?auto_1522056 ) ( ON ?auto_1522058 ?auto_1522057 ) ( ON ?auto_1522059 ?auto_1522058 ) ( not ( = ?auto_1522053 ?auto_1522054 ) ) ( not ( = ?auto_1522053 ?auto_1522055 ) ) ( not ( = ?auto_1522053 ?auto_1522056 ) ) ( not ( = ?auto_1522053 ?auto_1522057 ) ) ( not ( = ?auto_1522053 ?auto_1522058 ) ) ( not ( = ?auto_1522053 ?auto_1522059 ) ) ( not ( = ?auto_1522053 ?auto_1522060 ) ) ( not ( = ?auto_1522053 ?auto_1522061 ) ) ( not ( = ?auto_1522053 ?auto_1522064 ) ) ( not ( = ?auto_1522054 ?auto_1522055 ) ) ( not ( = ?auto_1522054 ?auto_1522056 ) ) ( not ( = ?auto_1522054 ?auto_1522057 ) ) ( not ( = ?auto_1522054 ?auto_1522058 ) ) ( not ( = ?auto_1522054 ?auto_1522059 ) ) ( not ( = ?auto_1522054 ?auto_1522060 ) ) ( not ( = ?auto_1522054 ?auto_1522061 ) ) ( not ( = ?auto_1522054 ?auto_1522064 ) ) ( not ( = ?auto_1522055 ?auto_1522056 ) ) ( not ( = ?auto_1522055 ?auto_1522057 ) ) ( not ( = ?auto_1522055 ?auto_1522058 ) ) ( not ( = ?auto_1522055 ?auto_1522059 ) ) ( not ( = ?auto_1522055 ?auto_1522060 ) ) ( not ( = ?auto_1522055 ?auto_1522061 ) ) ( not ( = ?auto_1522055 ?auto_1522064 ) ) ( not ( = ?auto_1522056 ?auto_1522057 ) ) ( not ( = ?auto_1522056 ?auto_1522058 ) ) ( not ( = ?auto_1522056 ?auto_1522059 ) ) ( not ( = ?auto_1522056 ?auto_1522060 ) ) ( not ( = ?auto_1522056 ?auto_1522061 ) ) ( not ( = ?auto_1522056 ?auto_1522064 ) ) ( not ( = ?auto_1522057 ?auto_1522058 ) ) ( not ( = ?auto_1522057 ?auto_1522059 ) ) ( not ( = ?auto_1522057 ?auto_1522060 ) ) ( not ( = ?auto_1522057 ?auto_1522061 ) ) ( not ( = ?auto_1522057 ?auto_1522064 ) ) ( not ( = ?auto_1522058 ?auto_1522059 ) ) ( not ( = ?auto_1522058 ?auto_1522060 ) ) ( not ( = ?auto_1522058 ?auto_1522061 ) ) ( not ( = ?auto_1522058 ?auto_1522064 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1522059 ?auto_1522060 ?auto_1522061 )
      ( MAKE-8CRATE-VERIFY ?auto_1522053 ?auto_1522054 ?auto_1522055 ?auto_1522056 ?auto_1522057 ?auto_1522058 ?auto_1522059 ?auto_1522060 ?auto_1522061 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1522146 - SURFACE
      ?auto_1522147 - SURFACE
      ?auto_1522148 - SURFACE
      ?auto_1522149 - SURFACE
      ?auto_1522150 - SURFACE
      ?auto_1522151 - SURFACE
      ?auto_1522152 - SURFACE
      ?auto_1522153 - SURFACE
      ?auto_1522154 - SURFACE
    )
    :vars
    (
      ?auto_1522159 - HOIST
      ?auto_1522155 - PLACE
      ?auto_1522156 - PLACE
      ?auto_1522157 - HOIST
      ?auto_1522160 - SURFACE
      ?auto_1522158 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1522159 ?auto_1522155 ) ( IS-CRATE ?auto_1522154 ) ( not ( = ?auto_1522153 ?auto_1522154 ) ) ( not ( = ?auto_1522152 ?auto_1522153 ) ) ( not ( = ?auto_1522152 ?auto_1522154 ) ) ( not ( = ?auto_1522156 ?auto_1522155 ) ) ( HOIST-AT ?auto_1522157 ?auto_1522156 ) ( not ( = ?auto_1522159 ?auto_1522157 ) ) ( AVAILABLE ?auto_1522157 ) ( SURFACE-AT ?auto_1522154 ?auto_1522156 ) ( ON ?auto_1522154 ?auto_1522160 ) ( CLEAR ?auto_1522154 ) ( not ( = ?auto_1522153 ?auto_1522160 ) ) ( not ( = ?auto_1522154 ?auto_1522160 ) ) ( not ( = ?auto_1522152 ?auto_1522160 ) ) ( TRUCK-AT ?auto_1522158 ?auto_1522155 ) ( SURFACE-AT ?auto_1522152 ?auto_1522155 ) ( CLEAR ?auto_1522152 ) ( LIFTING ?auto_1522159 ?auto_1522153 ) ( IS-CRATE ?auto_1522153 ) ( ON ?auto_1522147 ?auto_1522146 ) ( ON ?auto_1522148 ?auto_1522147 ) ( ON ?auto_1522149 ?auto_1522148 ) ( ON ?auto_1522150 ?auto_1522149 ) ( ON ?auto_1522151 ?auto_1522150 ) ( ON ?auto_1522152 ?auto_1522151 ) ( not ( = ?auto_1522146 ?auto_1522147 ) ) ( not ( = ?auto_1522146 ?auto_1522148 ) ) ( not ( = ?auto_1522146 ?auto_1522149 ) ) ( not ( = ?auto_1522146 ?auto_1522150 ) ) ( not ( = ?auto_1522146 ?auto_1522151 ) ) ( not ( = ?auto_1522146 ?auto_1522152 ) ) ( not ( = ?auto_1522146 ?auto_1522153 ) ) ( not ( = ?auto_1522146 ?auto_1522154 ) ) ( not ( = ?auto_1522146 ?auto_1522160 ) ) ( not ( = ?auto_1522147 ?auto_1522148 ) ) ( not ( = ?auto_1522147 ?auto_1522149 ) ) ( not ( = ?auto_1522147 ?auto_1522150 ) ) ( not ( = ?auto_1522147 ?auto_1522151 ) ) ( not ( = ?auto_1522147 ?auto_1522152 ) ) ( not ( = ?auto_1522147 ?auto_1522153 ) ) ( not ( = ?auto_1522147 ?auto_1522154 ) ) ( not ( = ?auto_1522147 ?auto_1522160 ) ) ( not ( = ?auto_1522148 ?auto_1522149 ) ) ( not ( = ?auto_1522148 ?auto_1522150 ) ) ( not ( = ?auto_1522148 ?auto_1522151 ) ) ( not ( = ?auto_1522148 ?auto_1522152 ) ) ( not ( = ?auto_1522148 ?auto_1522153 ) ) ( not ( = ?auto_1522148 ?auto_1522154 ) ) ( not ( = ?auto_1522148 ?auto_1522160 ) ) ( not ( = ?auto_1522149 ?auto_1522150 ) ) ( not ( = ?auto_1522149 ?auto_1522151 ) ) ( not ( = ?auto_1522149 ?auto_1522152 ) ) ( not ( = ?auto_1522149 ?auto_1522153 ) ) ( not ( = ?auto_1522149 ?auto_1522154 ) ) ( not ( = ?auto_1522149 ?auto_1522160 ) ) ( not ( = ?auto_1522150 ?auto_1522151 ) ) ( not ( = ?auto_1522150 ?auto_1522152 ) ) ( not ( = ?auto_1522150 ?auto_1522153 ) ) ( not ( = ?auto_1522150 ?auto_1522154 ) ) ( not ( = ?auto_1522150 ?auto_1522160 ) ) ( not ( = ?auto_1522151 ?auto_1522152 ) ) ( not ( = ?auto_1522151 ?auto_1522153 ) ) ( not ( = ?auto_1522151 ?auto_1522154 ) ) ( not ( = ?auto_1522151 ?auto_1522160 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1522152 ?auto_1522153 ?auto_1522154 )
      ( MAKE-8CRATE-VERIFY ?auto_1522146 ?auto_1522147 ?auto_1522148 ?auto_1522149 ?auto_1522150 ?auto_1522151 ?auto_1522152 ?auto_1522153 ?auto_1522154 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1522239 - SURFACE
      ?auto_1522240 - SURFACE
      ?auto_1522241 - SURFACE
      ?auto_1522242 - SURFACE
      ?auto_1522243 - SURFACE
      ?auto_1522244 - SURFACE
      ?auto_1522245 - SURFACE
      ?auto_1522246 - SURFACE
      ?auto_1522247 - SURFACE
    )
    :vars
    (
      ?auto_1522249 - HOIST
      ?auto_1522248 - PLACE
      ?auto_1522252 - PLACE
      ?auto_1522253 - HOIST
      ?auto_1522250 - SURFACE
      ?auto_1522251 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1522249 ?auto_1522248 ) ( IS-CRATE ?auto_1522247 ) ( not ( = ?auto_1522246 ?auto_1522247 ) ) ( not ( = ?auto_1522245 ?auto_1522246 ) ) ( not ( = ?auto_1522245 ?auto_1522247 ) ) ( not ( = ?auto_1522252 ?auto_1522248 ) ) ( HOIST-AT ?auto_1522253 ?auto_1522252 ) ( not ( = ?auto_1522249 ?auto_1522253 ) ) ( AVAILABLE ?auto_1522253 ) ( SURFACE-AT ?auto_1522247 ?auto_1522252 ) ( ON ?auto_1522247 ?auto_1522250 ) ( CLEAR ?auto_1522247 ) ( not ( = ?auto_1522246 ?auto_1522250 ) ) ( not ( = ?auto_1522247 ?auto_1522250 ) ) ( not ( = ?auto_1522245 ?auto_1522250 ) ) ( TRUCK-AT ?auto_1522251 ?auto_1522248 ) ( SURFACE-AT ?auto_1522245 ?auto_1522248 ) ( CLEAR ?auto_1522245 ) ( IS-CRATE ?auto_1522246 ) ( AVAILABLE ?auto_1522249 ) ( IN ?auto_1522246 ?auto_1522251 ) ( ON ?auto_1522240 ?auto_1522239 ) ( ON ?auto_1522241 ?auto_1522240 ) ( ON ?auto_1522242 ?auto_1522241 ) ( ON ?auto_1522243 ?auto_1522242 ) ( ON ?auto_1522244 ?auto_1522243 ) ( ON ?auto_1522245 ?auto_1522244 ) ( not ( = ?auto_1522239 ?auto_1522240 ) ) ( not ( = ?auto_1522239 ?auto_1522241 ) ) ( not ( = ?auto_1522239 ?auto_1522242 ) ) ( not ( = ?auto_1522239 ?auto_1522243 ) ) ( not ( = ?auto_1522239 ?auto_1522244 ) ) ( not ( = ?auto_1522239 ?auto_1522245 ) ) ( not ( = ?auto_1522239 ?auto_1522246 ) ) ( not ( = ?auto_1522239 ?auto_1522247 ) ) ( not ( = ?auto_1522239 ?auto_1522250 ) ) ( not ( = ?auto_1522240 ?auto_1522241 ) ) ( not ( = ?auto_1522240 ?auto_1522242 ) ) ( not ( = ?auto_1522240 ?auto_1522243 ) ) ( not ( = ?auto_1522240 ?auto_1522244 ) ) ( not ( = ?auto_1522240 ?auto_1522245 ) ) ( not ( = ?auto_1522240 ?auto_1522246 ) ) ( not ( = ?auto_1522240 ?auto_1522247 ) ) ( not ( = ?auto_1522240 ?auto_1522250 ) ) ( not ( = ?auto_1522241 ?auto_1522242 ) ) ( not ( = ?auto_1522241 ?auto_1522243 ) ) ( not ( = ?auto_1522241 ?auto_1522244 ) ) ( not ( = ?auto_1522241 ?auto_1522245 ) ) ( not ( = ?auto_1522241 ?auto_1522246 ) ) ( not ( = ?auto_1522241 ?auto_1522247 ) ) ( not ( = ?auto_1522241 ?auto_1522250 ) ) ( not ( = ?auto_1522242 ?auto_1522243 ) ) ( not ( = ?auto_1522242 ?auto_1522244 ) ) ( not ( = ?auto_1522242 ?auto_1522245 ) ) ( not ( = ?auto_1522242 ?auto_1522246 ) ) ( not ( = ?auto_1522242 ?auto_1522247 ) ) ( not ( = ?auto_1522242 ?auto_1522250 ) ) ( not ( = ?auto_1522243 ?auto_1522244 ) ) ( not ( = ?auto_1522243 ?auto_1522245 ) ) ( not ( = ?auto_1522243 ?auto_1522246 ) ) ( not ( = ?auto_1522243 ?auto_1522247 ) ) ( not ( = ?auto_1522243 ?auto_1522250 ) ) ( not ( = ?auto_1522244 ?auto_1522245 ) ) ( not ( = ?auto_1522244 ?auto_1522246 ) ) ( not ( = ?auto_1522244 ?auto_1522247 ) ) ( not ( = ?auto_1522244 ?auto_1522250 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1522245 ?auto_1522246 ?auto_1522247 )
      ( MAKE-8CRATE-VERIFY ?auto_1522239 ?auto_1522240 ?auto_1522241 ?auto_1522242 ?auto_1522243 ?auto_1522244 ?auto_1522245 ?auto_1522246 ?auto_1522247 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1526344 - SURFACE
      ?auto_1526345 - SURFACE
      ?auto_1526346 - SURFACE
      ?auto_1526347 - SURFACE
      ?auto_1526348 - SURFACE
      ?auto_1526349 - SURFACE
      ?auto_1526350 - SURFACE
      ?auto_1526351 - SURFACE
      ?auto_1526352 - SURFACE
      ?auto_1526353 - SURFACE
    )
    :vars
    (
      ?auto_1526355 - HOIST
      ?auto_1526354 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1526355 ?auto_1526354 ) ( SURFACE-AT ?auto_1526352 ?auto_1526354 ) ( CLEAR ?auto_1526352 ) ( LIFTING ?auto_1526355 ?auto_1526353 ) ( IS-CRATE ?auto_1526353 ) ( not ( = ?auto_1526352 ?auto_1526353 ) ) ( ON ?auto_1526345 ?auto_1526344 ) ( ON ?auto_1526346 ?auto_1526345 ) ( ON ?auto_1526347 ?auto_1526346 ) ( ON ?auto_1526348 ?auto_1526347 ) ( ON ?auto_1526349 ?auto_1526348 ) ( ON ?auto_1526350 ?auto_1526349 ) ( ON ?auto_1526351 ?auto_1526350 ) ( ON ?auto_1526352 ?auto_1526351 ) ( not ( = ?auto_1526344 ?auto_1526345 ) ) ( not ( = ?auto_1526344 ?auto_1526346 ) ) ( not ( = ?auto_1526344 ?auto_1526347 ) ) ( not ( = ?auto_1526344 ?auto_1526348 ) ) ( not ( = ?auto_1526344 ?auto_1526349 ) ) ( not ( = ?auto_1526344 ?auto_1526350 ) ) ( not ( = ?auto_1526344 ?auto_1526351 ) ) ( not ( = ?auto_1526344 ?auto_1526352 ) ) ( not ( = ?auto_1526344 ?auto_1526353 ) ) ( not ( = ?auto_1526345 ?auto_1526346 ) ) ( not ( = ?auto_1526345 ?auto_1526347 ) ) ( not ( = ?auto_1526345 ?auto_1526348 ) ) ( not ( = ?auto_1526345 ?auto_1526349 ) ) ( not ( = ?auto_1526345 ?auto_1526350 ) ) ( not ( = ?auto_1526345 ?auto_1526351 ) ) ( not ( = ?auto_1526345 ?auto_1526352 ) ) ( not ( = ?auto_1526345 ?auto_1526353 ) ) ( not ( = ?auto_1526346 ?auto_1526347 ) ) ( not ( = ?auto_1526346 ?auto_1526348 ) ) ( not ( = ?auto_1526346 ?auto_1526349 ) ) ( not ( = ?auto_1526346 ?auto_1526350 ) ) ( not ( = ?auto_1526346 ?auto_1526351 ) ) ( not ( = ?auto_1526346 ?auto_1526352 ) ) ( not ( = ?auto_1526346 ?auto_1526353 ) ) ( not ( = ?auto_1526347 ?auto_1526348 ) ) ( not ( = ?auto_1526347 ?auto_1526349 ) ) ( not ( = ?auto_1526347 ?auto_1526350 ) ) ( not ( = ?auto_1526347 ?auto_1526351 ) ) ( not ( = ?auto_1526347 ?auto_1526352 ) ) ( not ( = ?auto_1526347 ?auto_1526353 ) ) ( not ( = ?auto_1526348 ?auto_1526349 ) ) ( not ( = ?auto_1526348 ?auto_1526350 ) ) ( not ( = ?auto_1526348 ?auto_1526351 ) ) ( not ( = ?auto_1526348 ?auto_1526352 ) ) ( not ( = ?auto_1526348 ?auto_1526353 ) ) ( not ( = ?auto_1526349 ?auto_1526350 ) ) ( not ( = ?auto_1526349 ?auto_1526351 ) ) ( not ( = ?auto_1526349 ?auto_1526352 ) ) ( not ( = ?auto_1526349 ?auto_1526353 ) ) ( not ( = ?auto_1526350 ?auto_1526351 ) ) ( not ( = ?auto_1526350 ?auto_1526352 ) ) ( not ( = ?auto_1526350 ?auto_1526353 ) ) ( not ( = ?auto_1526351 ?auto_1526352 ) ) ( not ( = ?auto_1526351 ?auto_1526353 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1526352 ?auto_1526353 )
      ( MAKE-9CRATE-VERIFY ?auto_1526344 ?auto_1526345 ?auto_1526346 ?auto_1526347 ?auto_1526348 ?auto_1526349 ?auto_1526350 ?auto_1526351 ?auto_1526352 ?auto_1526353 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1526424 - SURFACE
      ?auto_1526425 - SURFACE
      ?auto_1526426 - SURFACE
      ?auto_1526427 - SURFACE
      ?auto_1526428 - SURFACE
      ?auto_1526429 - SURFACE
      ?auto_1526430 - SURFACE
      ?auto_1526431 - SURFACE
      ?auto_1526432 - SURFACE
      ?auto_1526433 - SURFACE
    )
    :vars
    (
      ?auto_1526434 - HOIST
      ?auto_1526436 - PLACE
      ?auto_1526435 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1526434 ?auto_1526436 ) ( SURFACE-AT ?auto_1526432 ?auto_1526436 ) ( CLEAR ?auto_1526432 ) ( IS-CRATE ?auto_1526433 ) ( not ( = ?auto_1526432 ?auto_1526433 ) ) ( TRUCK-AT ?auto_1526435 ?auto_1526436 ) ( AVAILABLE ?auto_1526434 ) ( IN ?auto_1526433 ?auto_1526435 ) ( ON ?auto_1526432 ?auto_1526431 ) ( not ( = ?auto_1526431 ?auto_1526432 ) ) ( not ( = ?auto_1526431 ?auto_1526433 ) ) ( ON ?auto_1526425 ?auto_1526424 ) ( ON ?auto_1526426 ?auto_1526425 ) ( ON ?auto_1526427 ?auto_1526426 ) ( ON ?auto_1526428 ?auto_1526427 ) ( ON ?auto_1526429 ?auto_1526428 ) ( ON ?auto_1526430 ?auto_1526429 ) ( ON ?auto_1526431 ?auto_1526430 ) ( not ( = ?auto_1526424 ?auto_1526425 ) ) ( not ( = ?auto_1526424 ?auto_1526426 ) ) ( not ( = ?auto_1526424 ?auto_1526427 ) ) ( not ( = ?auto_1526424 ?auto_1526428 ) ) ( not ( = ?auto_1526424 ?auto_1526429 ) ) ( not ( = ?auto_1526424 ?auto_1526430 ) ) ( not ( = ?auto_1526424 ?auto_1526431 ) ) ( not ( = ?auto_1526424 ?auto_1526432 ) ) ( not ( = ?auto_1526424 ?auto_1526433 ) ) ( not ( = ?auto_1526425 ?auto_1526426 ) ) ( not ( = ?auto_1526425 ?auto_1526427 ) ) ( not ( = ?auto_1526425 ?auto_1526428 ) ) ( not ( = ?auto_1526425 ?auto_1526429 ) ) ( not ( = ?auto_1526425 ?auto_1526430 ) ) ( not ( = ?auto_1526425 ?auto_1526431 ) ) ( not ( = ?auto_1526425 ?auto_1526432 ) ) ( not ( = ?auto_1526425 ?auto_1526433 ) ) ( not ( = ?auto_1526426 ?auto_1526427 ) ) ( not ( = ?auto_1526426 ?auto_1526428 ) ) ( not ( = ?auto_1526426 ?auto_1526429 ) ) ( not ( = ?auto_1526426 ?auto_1526430 ) ) ( not ( = ?auto_1526426 ?auto_1526431 ) ) ( not ( = ?auto_1526426 ?auto_1526432 ) ) ( not ( = ?auto_1526426 ?auto_1526433 ) ) ( not ( = ?auto_1526427 ?auto_1526428 ) ) ( not ( = ?auto_1526427 ?auto_1526429 ) ) ( not ( = ?auto_1526427 ?auto_1526430 ) ) ( not ( = ?auto_1526427 ?auto_1526431 ) ) ( not ( = ?auto_1526427 ?auto_1526432 ) ) ( not ( = ?auto_1526427 ?auto_1526433 ) ) ( not ( = ?auto_1526428 ?auto_1526429 ) ) ( not ( = ?auto_1526428 ?auto_1526430 ) ) ( not ( = ?auto_1526428 ?auto_1526431 ) ) ( not ( = ?auto_1526428 ?auto_1526432 ) ) ( not ( = ?auto_1526428 ?auto_1526433 ) ) ( not ( = ?auto_1526429 ?auto_1526430 ) ) ( not ( = ?auto_1526429 ?auto_1526431 ) ) ( not ( = ?auto_1526429 ?auto_1526432 ) ) ( not ( = ?auto_1526429 ?auto_1526433 ) ) ( not ( = ?auto_1526430 ?auto_1526431 ) ) ( not ( = ?auto_1526430 ?auto_1526432 ) ) ( not ( = ?auto_1526430 ?auto_1526433 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1526431 ?auto_1526432 ?auto_1526433 )
      ( MAKE-9CRATE-VERIFY ?auto_1526424 ?auto_1526425 ?auto_1526426 ?auto_1526427 ?auto_1526428 ?auto_1526429 ?auto_1526430 ?auto_1526431 ?auto_1526432 ?auto_1526433 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1526514 - SURFACE
      ?auto_1526515 - SURFACE
      ?auto_1526516 - SURFACE
      ?auto_1526517 - SURFACE
      ?auto_1526518 - SURFACE
      ?auto_1526519 - SURFACE
      ?auto_1526520 - SURFACE
      ?auto_1526521 - SURFACE
      ?auto_1526522 - SURFACE
      ?auto_1526523 - SURFACE
    )
    :vars
    (
      ?auto_1526527 - HOIST
      ?auto_1526526 - PLACE
      ?auto_1526524 - TRUCK
      ?auto_1526525 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1526527 ?auto_1526526 ) ( SURFACE-AT ?auto_1526522 ?auto_1526526 ) ( CLEAR ?auto_1526522 ) ( IS-CRATE ?auto_1526523 ) ( not ( = ?auto_1526522 ?auto_1526523 ) ) ( AVAILABLE ?auto_1526527 ) ( IN ?auto_1526523 ?auto_1526524 ) ( ON ?auto_1526522 ?auto_1526521 ) ( not ( = ?auto_1526521 ?auto_1526522 ) ) ( not ( = ?auto_1526521 ?auto_1526523 ) ) ( TRUCK-AT ?auto_1526524 ?auto_1526525 ) ( not ( = ?auto_1526525 ?auto_1526526 ) ) ( ON ?auto_1526515 ?auto_1526514 ) ( ON ?auto_1526516 ?auto_1526515 ) ( ON ?auto_1526517 ?auto_1526516 ) ( ON ?auto_1526518 ?auto_1526517 ) ( ON ?auto_1526519 ?auto_1526518 ) ( ON ?auto_1526520 ?auto_1526519 ) ( ON ?auto_1526521 ?auto_1526520 ) ( not ( = ?auto_1526514 ?auto_1526515 ) ) ( not ( = ?auto_1526514 ?auto_1526516 ) ) ( not ( = ?auto_1526514 ?auto_1526517 ) ) ( not ( = ?auto_1526514 ?auto_1526518 ) ) ( not ( = ?auto_1526514 ?auto_1526519 ) ) ( not ( = ?auto_1526514 ?auto_1526520 ) ) ( not ( = ?auto_1526514 ?auto_1526521 ) ) ( not ( = ?auto_1526514 ?auto_1526522 ) ) ( not ( = ?auto_1526514 ?auto_1526523 ) ) ( not ( = ?auto_1526515 ?auto_1526516 ) ) ( not ( = ?auto_1526515 ?auto_1526517 ) ) ( not ( = ?auto_1526515 ?auto_1526518 ) ) ( not ( = ?auto_1526515 ?auto_1526519 ) ) ( not ( = ?auto_1526515 ?auto_1526520 ) ) ( not ( = ?auto_1526515 ?auto_1526521 ) ) ( not ( = ?auto_1526515 ?auto_1526522 ) ) ( not ( = ?auto_1526515 ?auto_1526523 ) ) ( not ( = ?auto_1526516 ?auto_1526517 ) ) ( not ( = ?auto_1526516 ?auto_1526518 ) ) ( not ( = ?auto_1526516 ?auto_1526519 ) ) ( not ( = ?auto_1526516 ?auto_1526520 ) ) ( not ( = ?auto_1526516 ?auto_1526521 ) ) ( not ( = ?auto_1526516 ?auto_1526522 ) ) ( not ( = ?auto_1526516 ?auto_1526523 ) ) ( not ( = ?auto_1526517 ?auto_1526518 ) ) ( not ( = ?auto_1526517 ?auto_1526519 ) ) ( not ( = ?auto_1526517 ?auto_1526520 ) ) ( not ( = ?auto_1526517 ?auto_1526521 ) ) ( not ( = ?auto_1526517 ?auto_1526522 ) ) ( not ( = ?auto_1526517 ?auto_1526523 ) ) ( not ( = ?auto_1526518 ?auto_1526519 ) ) ( not ( = ?auto_1526518 ?auto_1526520 ) ) ( not ( = ?auto_1526518 ?auto_1526521 ) ) ( not ( = ?auto_1526518 ?auto_1526522 ) ) ( not ( = ?auto_1526518 ?auto_1526523 ) ) ( not ( = ?auto_1526519 ?auto_1526520 ) ) ( not ( = ?auto_1526519 ?auto_1526521 ) ) ( not ( = ?auto_1526519 ?auto_1526522 ) ) ( not ( = ?auto_1526519 ?auto_1526523 ) ) ( not ( = ?auto_1526520 ?auto_1526521 ) ) ( not ( = ?auto_1526520 ?auto_1526522 ) ) ( not ( = ?auto_1526520 ?auto_1526523 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1526521 ?auto_1526522 ?auto_1526523 )
      ( MAKE-9CRATE-VERIFY ?auto_1526514 ?auto_1526515 ?auto_1526516 ?auto_1526517 ?auto_1526518 ?auto_1526519 ?auto_1526520 ?auto_1526521 ?auto_1526522 ?auto_1526523 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1526613 - SURFACE
      ?auto_1526614 - SURFACE
      ?auto_1526615 - SURFACE
      ?auto_1526616 - SURFACE
      ?auto_1526617 - SURFACE
      ?auto_1526618 - SURFACE
      ?auto_1526619 - SURFACE
      ?auto_1526620 - SURFACE
      ?auto_1526621 - SURFACE
      ?auto_1526622 - SURFACE
    )
    :vars
    (
      ?auto_1526626 - HOIST
      ?auto_1526627 - PLACE
      ?auto_1526624 - TRUCK
      ?auto_1526625 - PLACE
      ?auto_1526623 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1526626 ?auto_1526627 ) ( SURFACE-AT ?auto_1526621 ?auto_1526627 ) ( CLEAR ?auto_1526621 ) ( IS-CRATE ?auto_1526622 ) ( not ( = ?auto_1526621 ?auto_1526622 ) ) ( AVAILABLE ?auto_1526626 ) ( ON ?auto_1526621 ?auto_1526620 ) ( not ( = ?auto_1526620 ?auto_1526621 ) ) ( not ( = ?auto_1526620 ?auto_1526622 ) ) ( TRUCK-AT ?auto_1526624 ?auto_1526625 ) ( not ( = ?auto_1526625 ?auto_1526627 ) ) ( HOIST-AT ?auto_1526623 ?auto_1526625 ) ( LIFTING ?auto_1526623 ?auto_1526622 ) ( not ( = ?auto_1526626 ?auto_1526623 ) ) ( ON ?auto_1526614 ?auto_1526613 ) ( ON ?auto_1526615 ?auto_1526614 ) ( ON ?auto_1526616 ?auto_1526615 ) ( ON ?auto_1526617 ?auto_1526616 ) ( ON ?auto_1526618 ?auto_1526617 ) ( ON ?auto_1526619 ?auto_1526618 ) ( ON ?auto_1526620 ?auto_1526619 ) ( not ( = ?auto_1526613 ?auto_1526614 ) ) ( not ( = ?auto_1526613 ?auto_1526615 ) ) ( not ( = ?auto_1526613 ?auto_1526616 ) ) ( not ( = ?auto_1526613 ?auto_1526617 ) ) ( not ( = ?auto_1526613 ?auto_1526618 ) ) ( not ( = ?auto_1526613 ?auto_1526619 ) ) ( not ( = ?auto_1526613 ?auto_1526620 ) ) ( not ( = ?auto_1526613 ?auto_1526621 ) ) ( not ( = ?auto_1526613 ?auto_1526622 ) ) ( not ( = ?auto_1526614 ?auto_1526615 ) ) ( not ( = ?auto_1526614 ?auto_1526616 ) ) ( not ( = ?auto_1526614 ?auto_1526617 ) ) ( not ( = ?auto_1526614 ?auto_1526618 ) ) ( not ( = ?auto_1526614 ?auto_1526619 ) ) ( not ( = ?auto_1526614 ?auto_1526620 ) ) ( not ( = ?auto_1526614 ?auto_1526621 ) ) ( not ( = ?auto_1526614 ?auto_1526622 ) ) ( not ( = ?auto_1526615 ?auto_1526616 ) ) ( not ( = ?auto_1526615 ?auto_1526617 ) ) ( not ( = ?auto_1526615 ?auto_1526618 ) ) ( not ( = ?auto_1526615 ?auto_1526619 ) ) ( not ( = ?auto_1526615 ?auto_1526620 ) ) ( not ( = ?auto_1526615 ?auto_1526621 ) ) ( not ( = ?auto_1526615 ?auto_1526622 ) ) ( not ( = ?auto_1526616 ?auto_1526617 ) ) ( not ( = ?auto_1526616 ?auto_1526618 ) ) ( not ( = ?auto_1526616 ?auto_1526619 ) ) ( not ( = ?auto_1526616 ?auto_1526620 ) ) ( not ( = ?auto_1526616 ?auto_1526621 ) ) ( not ( = ?auto_1526616 ?auto_1526622 ) ) ( not ( = ?auto_1526617 ?auto_1526618 ) ) ( not ( = ?auto_1526617 ?auto_1526619 ) ) ( not ( = ?auto_1526617 ?auto_1526620 ) ) ( not ( = ?auto_1526617 ?auto_1526621 ) ) ( not ( = ?auto_1526617 ?auto_1526622 ) ) ( not ( = ?auto_1526618 ?auto_1526619 ) ) ( not ( = ?auto_1526618 ?auto_1526620 ) ) ( not ( = ?auto_1526618 ?auto_1526621 ) ) ( not ( = ?auto_1526618 ?auto_1526622 ) ) ( not ( = ?auto_1526619 ?auto_1526620 ) ) ( not ( = ?auto_1526619 ?auto_1526621 ) ) ( not ( = ?auto_1526619 ?auto_1526622 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1526620 ?auto_1526621 ?auto_1526622 )
      ( MAKE-9CRATE-VERIFY ?auto_1526613 ?auto_1526614 ?auto_1526615 ?auto_1526616 ?auto_1526617 ?auto_1526618 ?auto_1526619 ?auto_1526620 ?auto_1526621 ?auto_1526622 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1526721 - SURFACE
      ?auto_1526722 - SURFACE
      ?auto_1526723 - SURFACE
      ?auto_1526724 - SURFACE
      ?auto_1526725 - SURFACE
      ?auto_1526726 - SURFACE
      ?auto_1526727 - SURFACE
      ?auto_1526728 - SURFACE
      ?auto_1526729 - SURFACE
      ?auto_1526730 - SURFACE
    )
    :vars
    (
      ?auto_1526731 - HOIST
      ?auto_1526733 - PLACE
      ?auto_1526734 - TRUCK
      ?auto_1526732 - PLACE
      ?auto_1526735 - HOIST
      ?auto_1526736 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1526731 ?auto_1526733 ) ( SURFACE-AT ?auto_1526729 ?auto_1526733 ) ( CLEAR ?auto_1526729 ) ( IS-CRATE ?auto_1526730 ) ( not ( = ?auto_1526729 ?auto_1526730 ) ) ( AVAILABLE ?auto_1526731 ) ( ON ?auto_1526729 ?auto_1526728 ) ( not ( = ?auto_1526728 ?auto_1526729 ) ) ( not ( = ?auto_1526728 ?auto_1526730 ) ) ( TRUCK-AT ?auto_1526734 ?auto_1526732 ) ( not ( = ?auto_1526732 ?auto_1526733 ) ) ( HOIST-AT ?auto_1526735 ?auto_1526732 ) ( not ( = ?auto_1526731 ?auto_1526735 ) ) ( AVAILABLE ?auto_1526735 ) ( SURFACE-AT ?auto_1526730 ?auto_1526732 ) ( ON ?auto_1526730 ?auto_1526736 ) ( CLEAR ?auto_1526730 ) ( not ( = ?auto_1526729 ?auto_1526736 ) ) ( not ( = ?auto_1526730 ?auto_1526736 ) ) ( not ( = ?auto_1526728 ?auto_1526736 ) ) ( ON ?auto_1526722 ?auto_1526721 ) ( ON ?auto_1526723 ?auto_1526722 ) ( ON ?auto_1526724 ?auto_1526723 ) ( ON ?auto_1526725 ?auto_1526724 ) ( ON ?auto_1526726 ?auto_1526725 ) ( ON ?auto_1526727 ?auto_1526726 ) ( ON ?auto_1526728 ?auto_1526727 ) ( not ( = ?auto_1526721 ?auto_1526722 ) ) ( not ( = ?auto_1526721 ?auto_1526723 ) ) ( not ( = ?auto_1526721 ?auto_1526724 ) ) ( not ( = ?auto_1526721 ?auto_1526725 ) ) ( not ( = ?auto_1526721 ?auto_1526726 ) ) ( not ( = ?auto_1526721 ?auto_1526727 ) ) ( not ( = ?auto_1526721 ?auto_1526728 ) ) ( not ( = ?auto_1526721 ?auto_1526729 ) ) ( not ( = ?auto_1526721 ?auto_1526730 ) ) ( not ( = ?auto_1526721 ?auto_1526736 ) ) ( not ( = ?auto_1526722 ?auto_1526723 ) ) ( not ( = ?auto_1526722 ?auto_1526724 ) ) ( not ( = ?auto_1526722 ?auto_1526725 ) ) ( not ( = ?auto_1526722 ?auto_1526726 ) ) ( not ( = ?auto_1526722 ?auto_1526727 ) ) ( not ( = ?auto_1526722 ?auto_1526728 ) ) ( not ( = ?auto_1526722 ?auto_1526729 ) ) ( not ( = ?auto_1526722 ?auto_1526730 ) ) ( not ( = ?auto_1526722 ?auto_1526736 ) ) ( not ( = ?auto_1526723 ?auto_1526724 ) ) ( not ( = ?auto_1526723 ?auto_1526725 ) ) ( not ( = ?auto_1526723 ?auto_1526726 ) ) ( not ( = ?auto_1526723 ?auto_1526727 ) ) ( not ( = ?auto_1526723 ?auto_1526728 ) ) ( not ( = ?auto_1526723 ?auto_1526729 ) ) ( not ( = ?auto_1526723 ?auto_1526730 ) ) ( not ( = ?auto_1526723 ?auto_1526736 ) ) ( not ( = ?auto_1526724 ?auto_1526725 ) ) ( not ( = ?auto_1526724 ?auto_1526726 ) ) ( not ( = ?auto_1526724 ?auto_1526727 ) ) ( not ( = ?auto_1526724 ?auto_1526728 ) ) ( not ( = ?auto_1526724 ?auto_1526729 ) ) ( not ( = ?auto_1526724 ?auto_1526730 ) ) ( not ( = ?auto_1526724 ?auto_1526736 ) ) ( not ( = ?auto_1526725 ?auto_1526726 ) ) ( not ( = ?auto_1526725 ?auto_1526727 ) ) ( not ( = ?auto_1526725 ?auto_1526728 ) ) ( not ( = ?auto_1526725 ?auto_1526729 ) ) ( not ( = ?auto_1526725 ?auto_1526730 ) ) ( not ( = ?auto_1526725 ?auto_1526736 ) ) ( not ( = ?auto_1526726 ?auto_1526727 ) ) ( not ( = ?auto_1526726 ?auto_1526728 ) ) ( not ( = ?auto_1526726 ?auto_1526729 ) ) ( not ( = ?auto_1526726 ?auto_1526730 ) ) ( not ( = ?auto_1526726 ?auto_1526736 ) ) ( not ( = ?auto_1526727 ?auto_1526728 ) ) ( not ( = ?auto_1526727 ?auto_1526729 ) ) ( not ( = ?auto_1526727 ?auto_1526730 ) ) ( not ( = ?auto_1526727 ?auto_1526736 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1526728 ?auto_1526729 ?auto_1526730 )
      ( MAKE-9CRATE-VERIFY ?auto_1526721 ?auto_1526722 ?auto_1526723 ?auto_1526724 ?auto_1526725 ?auto_1526726 ?auto_1526727 ?auto_1526728 ?auto_1526729 ?auto_1526730 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1526830 - SURFACE
      ?auto_1526831 - SURFACE
      ?auto_1526832 - SURFACE
      ?auto_1526833 - SURFACE
      ?auto_1526834 - SURFACE
      ?auto_1526835 - SURFACE
      ?auto_1526836 - SURFACE
      ?auto_1526837 - SURFACE
      ?auto_1526838 - SURFACE
      ?auto_1526839 - SURFACE
    )
    :vars
    (
      ?auto_1526843 - HOIST
      ?auto_1526845 - PLACE
      ?auto_1526842 - PLACE
      ?auto_1526844 - HOIST
      ?auto_1526840 - SURFACE
      ?auto_1526841 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1526843 ?auto_1526845 ) ( SURFACE-AT ?auto_1526838 ?auto_1526845 ) ( CLEAR ?auto_1526838 ) ( IS-CRATE ?auto_1526839 ) ( not ( = ?auto_1526838 ?auto_1526839 ) ) ( AVAILABLE ?auto_1526843 ) ( ON ?auto_1526838 ?auto_1526837 ) ( not ( = ?auto_1526837 ?auto_1526838 ) ) ( not ( = ?auto_1526837 ?auto_1526839 ) ) ( not ( = ?auto_1526842 ?auto_1526845 ) ) ( HOIST-AT ?auto_1526844 ?auto_1526842 ) ( not ( = ?auto_1526843 ?auto_1526844 ) ) ( AVAILABLE ?auto_1526844 ) ( SURFACE-AT ?auto_1526839 ?auto_1526842 ) ( ON ?auto_1526839 ?auto_1526840 ) ( CLEAR ?auto_1526839 ) ( not ( = ?auto_1526838 ?auto_1526840 ) ) ( not ( = ?auto_1526839 ?auto_1526840 ) ) ( not ( = ?auto_1526837 ?auto_1526840 ) ) ( TRUCK-AT ?auto_1526841 ?auto_1526845 ) ( ON ?auto_1526831 ?auto_1526830 ) ( ON ?auto_1526832 ?auto_1526831 ) ( ON ?auto_1526833 ?auto_1526832 ) ( ON ?auto_1526834 ?auto_1526833 ) ( ON ?auto_1526835 ?auto_1526834 ) ( ON ?auto_1526836 ?auto_1526835 ) ( ON ?auto_1526837 ?auto_1526836 ) ( not ( = ?auto_1526830 ?auto_1526831 ) ) ( not ( = ?auto_1526830 ?auto_1526832 ) ) ( not ( = ?auto_1526830 ?auto_1526833 ) ) ( not ( = ?auto_1526830 ?auto_1526834 ) ) ( not ( = ?auto_1526830 ?auto_1526835 ) ) ( not ( = ?auto_1526830 ?auto_1526836 ) ) ( not ( = ?auto_1526830 ?auto_1526837 ) ) ( not ( = ?auto_1526830 ?auto_1526838 ) ) ( not ( = ?auto_1526830 ?auto_1526839 ) ) ( not ( = ?auto_1526830 ?auto_1526840 ) ) ( not ( = ?auto_1526831 ?auto_1526832 ) ) ( not ( = ?auto_1526831 ?auto_1526833 ) ) ( not ( = ?auto_1526831 ?auto_1526834 ) ) ( not ( = ?auto_1526831 ?auto_1526835 ) ) ( not ( = ?auto_1526831 ?auto_1526836 ) ) ( not ( = ?auto_1526831 ?auto_1526837 ) ) ( not ( = ?auto_1526831 ?auto_1526838 ) ) ( not ( = ?auto_1526831 ?auto_1526839 ) ) ( not ( = ?auto_1526831 ?auto_1526840 ) ) ( not ( = ?auto_1526832 ?auto_1526833 ) ) ( not ( = ?auto_1526832 ?auto_1526834 ) ) ( not ( = ?auto_1526832 ?auto_1526835 ) ) ( not ( = ?auto_1526832 ?auto_1526836 ) ) ( not ( = ?auto_1526832 ?auto_1526837 ) ) ( not ( = ?auto_1526832 ?auto_1526838 ) ) ( not ( = ?auto_1526832 ?auto_1526839 ) ) ( not ( = ?auto_1526832 ?auto_1526840 ) ) ( not ( = ?auto_1526833 ?auto_1526834 ) ) ( not ( = ?auto_1526833 ?auto_1526835 ) ) ( not ( = ?auto_1526833 ?auto_1526836 ) ) ( not ( = ?auto_1526833 ?auto_1526837 ) ) ( not ( = ?auto_1526833 ?auto_1526838 ) ) ( not ( = ?auto_1526833 ?auto_1526839 ) ) ( not ( = ?auto_1526833 ?auto_1526840 ) ) ( not ( = ?auto_1526834 ?auto_1526835 ) ) ( not ( = ?auto_1526834 ?auto_1526836 ) ) ( not ( = ?auto_1526834 ?auto_1526837 ) ) ( not ( = ?auto_1526834 ?auto_1526838 ) ) ( not ( = ?auto_1526834 ?auto_1526839 ) ) ( not ( = ?auto_1526834 ?auto_1526840 ) ) ( not ( = ?auto_1526835 ?auto_1526836 ) ) ( not ( = ?auto_1526835 ?auto_1526837 ) ) ( not ( = ?auto_1526835 ?auto_1526838 ) ) ( not ( = ?auto_1526835 ?auto_1526839 ) ) ( not ( = ?auto_1526835 ?auto_1526840 ) ) ( not ( = ?auto_1526836 ?auto_1526837 ) ) ( not ( = ?auto_1526836 ?auto_1526838 ) ) ( not ( = ?auto_1526836 ?auto_1526839 ) ) ( not ( = ?auto_1526836 ?auto_1526840 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1526837 ?auto_1526838 ?auto_1526839 )
      ( MAKE-9CRATE-VERIFY ?auto_1526830 ?auto_1526831 ?auto_1526832 ?auto_1526833 ?auto_1526834 ?auto_1526835 ?auto_1526836 ?auto_1526837 ?auto_1526838 ?auto_1526839 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1526939 - SURFACE
      ?auto_1526940 - SURFACE
      ?auto_1526941 - SURFACE
      ?auto_1526942 - SURFACE
      ?auto_1526943 - SURFACE
      ?auto_1526944 - SURFACE
      ?auto_1526945 - SURFACE
      ?auto_1526946 - SURFACE
      ?auto_1526947 - SURFACE
      ?auto_1526948 - SURFACE
    )
    :vars
    (
      ?auto_1526950 - HOIST
      ?auto_1526953 - PLACE
      ?auto_1526952 - PLACE
      ?auto_1526949 - HOIST
      ?auto_1526951 - SURFACE
      ?auto_1526954 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1526950 ?auto_1526953 ) ( IS-CRATE ?auto_1526948 ) ( not ( = ?auto_1526947 ?auto_1526948 ) ) ( not ( = ?auto_1526946 ?auto_1526947 ) ) ( not ( = ?auto_1526946 ?auto_1526948 ) ) ( not ( = ?auto_1526952 ?auto_1526953 ) ) ( HOIST-AT ?auto_1526949 ?auto_1526952 ) ( not ( = ?auto_1526950 ?auto_1526949 ) ) ( AVAILABLE ?auto_1526949 ) ( SURFACE-AT ?auto_1526948 ?auto_1526952 ) ( ON ?auto_1526948 ?auto_1526951 ) ( CLEAR ?auto_1526948 ) ( not ( = ?auto_1526947 ?auto_1526951 ) ) ( not ( = ?auto_1526948 ?auto_1526951 ) ) ( not ( = ?auto_1526946 ?auto_1526951 ) ) ( TRUCK-AT ?auto_1526954 ?auto_1526953 ) ( SURFACE-AT ?auto_1526946 ?auto_1526953 ) ( CLEAR ?auto_1526946 ) ( LIFTING ?auto_1526950 ?auto_1526947 ) ( IS-CRATE ?auto_1526947 ) ( ON ?auto_1526940 ?auto_1526939 ) ( ON ?auto_1526941 ?auto_1526940 ) ( ON ?auto_1526942 ?auto_1526941 ) ( ON ?auto_1526943 ?auto_1526942 ) ( ON ?auto_1526944 ?auto_1526943 ) ( ON ?auto_1526945 ?auto_1526944 ) ( ON ?auto_1526946 ?auto_1526945 ) ( not ( = ?auto_1526939 ?auto_1526940 ) ) ( not ( = ?auto_1526939 ?auto_1526941 ) ) ( not ( = ?auto_1526939 ?auto_1526942 ) ) ( not ( = ?auto_1526939 ?auto_1526943 ) ) ( not ( = ?auto_1526939 ?auto_1526944 ) ) ( not ( = ?auto_1526939 ?auto_1526945 ) ) ( not ( = ?auto_1526939 ?auto_1526946 ) ) ( not ( = ?auto_1526939 ?auto_1526947 ) ) ( not ( = ?auto_1526939 ?auto_1526948 ) ) ( not ( = ?auto_1526939 ?auto_1526951 ) ) ( not ( = ?auto_1526940 ?auto_1526941 ) ) ( not ( = ?auto_1526940 ?auto_1526942 ) ) ( not ( = ?auto_1526940 ?auto_1526943 ) ) ( not ( = ?auto_1526940 ?auto_1526944 ) ) ( not ( = ?auto_1526940 ?auto_1526945 ) ) ( not ( = ?auto_1526940 ?auto_1526946 ) ) ( not ( = ?auto_1526940 ?auto_1526947 ) ) ( not ( = ?auto_1526940 ?auto_1526948 ) ) ( not ( = ?auto_1526940 ?auto_1526951 ) ) ( not ( = ?auto_1526941 ?auto_1526942 ) ) ( not ( = ?auto_1526941 ?auto_1526943 ) ) ( not ( = ?auto_1526941 ?auto_1526944 ) ) ( not ( = ?auto_1526941 ?auto_1526945 ) ) ( not ( = ?auto_1526941 ?auto_1526946 ) ) ( not ( = ?auto_1526941 ?auto_1526947 ) ) ( not ( = ?auto_1526941 ?auto_1526948 ) ) ( not ( = ?auto_1526941 ?auto_1526951 ) ) ( not ( = ?auto_1526942 ?auto_1526943 ) ) ( not ( = ?auto_1526942 ?auto_1526944 ) ) ( not ( = ?auto_1526942 ?auto_1526945 ) ) ( not ( = ?auto_1526942 ?auto_1526946 ) ) ( not ( = ?auto_1526942 ?auto_1526947 ) ) ( not ( = ?auto_1526942 ?auto_1526948 ) ) ( not ( = ?auto_1526942 ?auto_1526951 ) ) ( not ( = ?auto_1526943 ?auto_1526944 ) ) ( not ( = ?auto_1526943 ?auto_1526945 ) ) ( not ( = ?auto_1526943 ?auto_1526946 ) ) ( not ( = ?auto_1526943 ?auto_1526947 ) ) ( not ( = ?auto_1526943 ?auto_1526948 ) ) ( not ( = ?auto_1526943 ?auto_1526951 ) ) ( not ( = ?auto_1526944 ?auto_1526945 ) ) ( not ( = ?auto_1526944 ?auto_1526946 ) ) ( not ( = ?auto_1526944 ?auto_1526947 ) ) ( not ( = ?auto_1526944 ?auto_1526948 ) ) ( not ( = ?auto_1526944 ?auto_1526951 ) ) ( not ( = ?auto_1526945 ?auto_1526946 ) ) ( not ( = ?auto_1526945 ?auto_1526947 ) ) ( not ( = ?auto_1526945 ?auto_1526948 ) ) ( not ( = ?auto_1526945 ?auto_1526951 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1526946 ?auto_1526947 ?auto_1526948 )
      ( MAKE-9CRATE-VERIFY ?auto_1526939 ?auto_1526940 ?auto_1526941 ?auto_1526942 ?auto_1526943 ?auto_1526944 ?auto_1526945 ?auto_1526946 ?auto_1526947 ?auto_1526948 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1527048 - SURFACE
      ?auto_1527049 - SURFACE
      ?auto_1527050 - SURFACE
      ?auto_1527051 - SURFACE
      ?auto_1527052 - SURFACE
      ?auto_1527053 - SURFACE
      ?auto_1527054 - SURFACE
      ?auto_1527055 - SURFACE
      ?auto_1527056 - SURFACE
      ?auto_1527057 - SURFACE
    )
    :vars
    (
      ?auto_1527063 - HOIST
      ?auto_1527058 - PLACE
      ?auto_1527060 - PLACE
      ?auto_1527061 - HOIST
      ?auto_1527059 - SURFACE
      ?auto_1527062 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1527063 ?auto_1527058 ) ( IS-CRATE ?auto_1527057 ) ( not ( = ?auto_1527056 ?auto_1527057 ) ) ( not ( = ?auto_1527055 ?auto_1527056 ) ) ( not ( = ?auto_1527055 ?auto_1527057 ) ) ( not ( = ?auto_1527060 ?auto_1527058 ) ) ( HOIST-AT ?auto_1527061 ?auto_1527060 ) ( not ( = ?auto_1527063 ?auto_1527061 ) ) ( AVAILABLE ?auto_1527061 ) ( SURFACE-AT ?auto_1527057 ?auto_1527060 ) ( ON ?auto_1527057 ?auto_1527059 ) ( CLEAR ?auto_1527057 ) ( not ( = ?auto_1527056 ?auto_1527059 ) ) ( not ( = ?auto_1527057 ?auto_1527059 ) ) ( not ( = ?auto_1527055 ?auto_1527059 ) ) ( TRUCK-AT ?auto_1527062 ?auto_1527058 ) ( SURFACE-AT ?auto_1527055 ?auto_1527058 ) ( CLEAR ?auto_1527055 ) ( IS-CRATE ?auto_1527056 ) ( AVAILABLE ?auto_1527063 ) ( IN ?auto_1527056 ?auto_1527062 ) ( ON ?auto_1527049 ?auto_1527048 ) ( ON ?auto_1527050 ?auto_1527049 ) ( ON ?auto_1527051 ?auto_1527050 ) ( ON ?auto_1527052 ?auto_1527051 ) ( ON ?auto_1527053 ?auto_1527052 ) ( ON ?auto_1527054 ?auto_1527053 ) ( ON ?auto_1527055 ?auto_1527054 ) ( not ( = ?auto_1527048 ?auto_1527049 ) ) ( not ( = ?auto_1527048 ?auto_1527050 ) ) ( not ( = ?auto_1527048 ?auto_1527051 ) ) ( not ( = ?auto_1527048 ?auto_1527052 ) ) ( not ( = ?auto_1527048 ?auto_1527053 ) ) ( not ( = ?auto_1527048 ?auto_1527054 ) ) ( not ( = ?auto_1527048 ?auto_1527055 ) ) ( not ( = ?auto_1527048 ?auto_1527056 ) ) ( not ( = ?auto_1527048 ?auto_1527057 ) ) ( not ( = ?auto_1527048 ?auto_1527059 ) ) ( not ( = ?auto_1527049 ?auto_1527050 ) ) ( not ( = ?auto_1527049 ?auto_1527051 ) ) ( not ( = ?auto_1527049 ?auto_1527052 ) ) ( not ( = ?auto_1527049 ?auto_1527053 ) ) ( not ( = ?auto_1527049 ?auto_1527054 ) ) ( not ( = ?auto_1527049 ?auto_1527055 ) ) ( not ( = ?auto_1527049 ?auto_1527056 ) ) ( not ( = ?auto_1527049 ?auto_1527057 ) ) ( not ( = ?auto_1527049 ?auto_1527059 ) ) ( not ( = ?auto_1527050 ?auto_1527051 ) ) ( not ( = ?auto_1527050 ?auto_1527052 ) ) ( not ( = ?auto_1527050 ?auto_1527053 ) ) ( not ( = ?auto_1527050 ?auto_1527054 ) ) ( not ( = ?auto_1527050 ?auto_1527055 ) ) ( not ( = ?auto_1527050 ?auto_1527056 ) ) ( not ( = ?auto_1527050 ?auto_1527057 ) ) ( not ( = ?auto_1527050 ?auto_1527059 ) ) ( not ( = ?auto_1527051 ?auto_1527052 ) ) ( not ( = ?auto_1527051 ?auto_1527053 ) ) ( not ( = ?auto_1527051 ?auto_1527054 ) ) ( not ( = ?auto_1527051 ?auto_1527055 ) ) ( not ( = ?auto_1527051 ?auto_1527056 ) ) ( not ( = ?auto_1527051 ?auto_1527057 ) ) ( not ( = ?auto_1527051 ?auto_1527059 ) ) ( not ( = ?auto_1527052 ?auto_1527053 ) ) ( not ( = ?auto_1527052 ?auto_1527054 ) ) ( not ( = ?auto_1527052 ?auto_1527055 ) ) ( not ( = ?auto_1527052 ?auto_1527056 ) ) ( not ( = ?auto_1527052 ?auto_1527057 ) ) ( not ( = ?auto_1527052 ?auto_1527059 ) ) ( not ( = ?auto_1527053 ?auto_1527054 ) ) ( not ( = ?auto_1527053 ?auto_1527055 ) ) ( not ( = ?auto_1527053 ?auto_1527056 ) ) ( not ( = ?auto_1527053 ?auto_1527057 ) ) ( not ( = ?auto_1527053 ?auto_1527059 ) ) ( not ( = ?auto_1527054 ?auto_1527055 ) ) ( not ( = ?auto_1527054 ?auto_1527056 ) ) ( not ( = ?auto_1527054 ?auto_1527057 ) ) ( not ( = ?auto_1527054 ?auto_1527059 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1527055 ?auto_1527056 ?auto_1527057 )
      ( MAKE-9CRATE-VERIFY ?auto_1527048 ?auto_1527049 ?auto_1527050 ?auto_1527051 ?auto_1527052 ?auto_1527053 ?auto_1527054 ?auto_1527055 ?auto_1527056 ?auto_1527057 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1532613 - SURFACE
      ?auto_1532614 - SURFACE
      ?auto_1532615 - SURFACE
      ?auto_1532616 - SURFACE
      ?auto_1532617 - SURFACE
      ?auto_1532618 - SURFACE
      ?auto_1532619 - SURFACE
      ?auto_1532620 - SURFACE
      ?auto_1532621 - SURFACE
      ?auto_1532622 - SURFACE
      ?auto_1532623 - SURFACE
    )
    :vars
    (
      ?auto_1532624 - HOIST
      ?auto_1532625 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1532624 ?auto_1532625 ) ( SURFACE-AT ?auto_1532622 ?auto_1532625 ) ( CLEAR ?auto_1532622 ) ( LIFTING ?auto_1532624 ?auto_1532623 ) ( IS-CRATE ?auto_1532623 ) ( not ( = ?auto_1532622 ?auto_1532623 ) ) ( ON ?auto_1532614 ?auto_1532613 ) ( ON ?auto_1532615 ?auto_1532614 ) ( ON ?auto_1532616 ?auto_1532615 ) ( ON ?auto_1532617 ?auto_1532616 ) ( ON ?auto_1532618 ?auto_1532617 ) ( ON ?auto_1532619 ?auto_1532618 ) ( ON ?auto_1532620 ?auto_1532619 ) ( ON ?auto_1532621 ?auto_1532620 ) ( ON ?auto_1532622 ?auto_1532621 ) ( not ( = ?auto_1532613 ?auto_1532614 ) ) ( not ( = ?auto_1532613 ?auto_1532615 ) ) ( not ( = ?auto_1532613 ?auto_1532616 ) ) ( not ( = ?auto_1532613 ?auto_1532617 ) ) ( not ( = ?auto_1532613 ?auto_1532618 ) ) ( not ( = ?auto_1532613 ?auto_1532619 ) ) ( not ( = ?auto_1532613 ?auto_1532620 ) ) ( not ( = ?auto_1532613 ?auto_1532621 ) ) ( not ( = ?auto_1532613 ?auto_1532622 ) ) ( not ( = ?auto_1532613 ?auto_1532623 ) ) ( not ( = ?auto_1532614 ?auto_1532615 ) ) ( not ( = ?auto_1532614 ?auto_1532616 ) ) ( not ( = ?auto_1532614 ?auto_1532617 ) ) ( not ( = ?auto_1532614 ?auto_1532618 ) ) ( not ( = ?auto_1532614 ?auto_1532619 ) ) ( not ( = ?auto_1532614 ?auto_1532620 ) ) ( not ( = ?auto_1532614 ?auto_1532621 ) ) ( not ( = ?auto_1532614 ?auto_1532622 ) ) ( not ( = ?auto_1532614 ?auto_1532623 ) ) ( not ( = ?auto_1532615 ?auto_1532616 ) ) ( not ( = ?auto_1532615 ?auto_1532617 ) ) ( not ( = ?auto_1532615 ?auto_1532618 ) ) ( not ( = ?auto_1532615 ?auto_1532619 ) ) ( not ( = ?auto_1532615 ?auto_1532620 ) ) ( not ( = ?auto_1532615 ?auto_1532621 ) ) ( not ( = ?auto_1532615 ?auto_1532622 ) ) ( not ( = ?auto_1532615 ?auto_1532623 ) ) ( not ( = ?auto_1532616 ?auto_1532617 ) ) ( not ( = ?auto_1532616 ?auto_1532618 ) ) ( not ( = ?auto_1532616 ?auto_1532619 ) ) ( not ( = ?auto_1532616 ?auto_1532620 ) ) ( not ( = ?auto_1532616 ?auto_1532621 ) ) ( not ( = ?auto_1532616 ?auto_1532622 ) ) ( not ( = ?auto_1532616 ?auto_1532623 ) ) ( not ( = ?auto_1532617 ?auto_1532618 ) ) ( not ( = ?auto_1532617 ?auto_1532619 ) ) ( not ( = ?auto_1532617 ?auto_1532620 ) ) ( not ( = ?auto_1532617 ?auto_1532621 ) ) ( not ( = ?auto_1532617 ?auto_1532622 ) ) ( not ( = ?auto_1532617 ?auto_1532623 ) ) ( not ( = ?auto_1532618 ?auto_1532619 ) ) ( not ( = ?auto_1532618 ?auto_1532620 ) ) ( not ( = ?auto_1532618 ?auto_1532621 ) ) ( not ( = ?auto_1532618 ?auto_1532622 ) ) ( not ( = ?auto_1532618 ?auto_1532623 ) ) ( not ( = ?auto_1532619 ?auto_1532620 ) ) ( not ( = ?auto_1532619 ?auto_1532621 ) ) ( not ( = ?auto_1532619 ?auto_1532622 ) ) ( not ( = ?auto_1532619 ?auto_1532623 ) ) ( not ( = ?auto_1532620 ?auto_1532621 ) ) ( not ( = ?auto_1532620 ?auto_1532622 ) ) ( not ( = ?auto_1532620 ?auto_1532623 ) ) ( not ( = ?auto_1532621 ?auto_1532622 ) ) ( not ( = ?auto_1532621 ?auto_1532623 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1532622 ?auto_1532623 )
      ( MAKE-10CRATE-VERIFY ?auto_1532613 ?auto_1532614 ?auto_1532615 ?auto_1532616 ?auto_1532617 ?auto_1532618 ?auto_1532619 ?auto_1532620 ?auto_1532621 ?auto_1532622 ?auto_1532623 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1532707 - SURFACE
      ?auto_1532708 - SURFACE
      ?auto_1532709 - SURFACE
      ?auto_1532710 - SURFACE
      ?auto_1532711 - SURFACE
      ?auto_1532712 - SURFACE
      ?auto_1532713 - SURFACE
      ?auto_1532714 - SURFACE
      ?auto_1532715 - SURFACE
      ?auto_1532716 - SURFACE
      ?auto_1532717 - SURFACE
    )
    :vars
    (
      ?auto_1532718 - HOIST
      ?auto_1532720 - PLACE
      ?auto_1532719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1532718 ?auto_1532720 ) ( SURFACE-AT ?auto_1532716 ?auto_1532720 ) ( CLEAR ?auto_1532716 ) ( IS-CRATE ?auto_1532717 ) ( not ( = ?auto_1532716 ?auto_1532717 ) ) ( TRUCK-AT ?auto_1532719 ?auto_1532720 ) ( AVAILABLE ?auto_1532718 ) ( IN ?auto_1532717 ?auto_1532719 ) ( ON ?auto_1532716 ?auto_1532715 ) ( not ( = ?auto_1532715 ?auto_1532716 ) ) ( not ( = ?auto_1532715 ?auto_1532717 ) ) ( ON ?auto_1532708 ?auto_1532707 ) ( ON ?auto_1532709 ?auto_1532708 ) ( ON ?auto_1532710 ?auto_1532709 ) ( ON ?auto_1532711 ?auto_1532710 ) ( ON ?auto_1532712 ?auto_1532711 ) ( ON ?auto_1532713 ?auto_1532712 ) ( ON ?auto_1532714 ?auto_1532713 ) ( ON ?auto_1532715 ?auto_1532714 ) ( not ( = ?auto_1532707 ?auto_1532708 ) ) ( not ( = ?auto_1532707 ?auto_1532709 ) ) ( not ( = ?auto_1532707 ?auto_1532710 ) ) ( not ( = ?auto_1532707 ?auto_1532711 ) ) ( not ( = ?auto_1532707 ?auto_1532712 ) ) ( not ( = ?auto_1532707 ?auto_1532713 ) ) ( not ( = ?auto_1532707 ?auto_1532714 ) ) ( not ( = ?auto_1532707 ?auto_1532715 ) ) ( not ( = ?auto_1532707 ?auto_1532716 ) ) ( not ( = ?auto_1532707 ?auto_1532717 ) ) ( not ( = ?auto_1532708 ?auto_1532709 ) ) ( not ( = ?auto_1532708 ?auto_1532710 ) ) ( not ( = ?auto_1532708 ?auto_1532711 ) ) ( not ( = ?auto_1532708 ?auto_1532712 ) ) ( not ( = ?auto_1532708 ?auto_1532713 ) ) ( not ( = ?auto_1532708 ?auto_1532714 ) ) ( not ( = ?auto_1532708 ?auto_1532715 ) ) ( not ( = ?auto_1532708 ?auto_1532716 ) ) ( not ( = ?auto_1532708 ?auto_1532717 ) ) ( not ( = ?auto_1532709 ?auto_1532710 ) ) ( not ( = ?auto_1532709 ?auto_1532711 ) ) ( not ( = ?auto_1532709 ?auto_1532712 ) ) ( not ( = ?auto_1532709 ?auto_1532713 ) ) ( not ( = ?auto_1532709 ?auto_1532714 ) ) ( not ( = ?auto_1532709 ?auto_1532715 ) ) ( not ( = ?auto_1532709 ?auto_1532716 ) ) ( not ( = ?auto_1532709 ?auto_1532717 ) ) ( not ( = ?auto_1532710 ?auto_1532711 ) ) ( not ( = ?auto_1532710 ?auto_1532712 ) ) ( not ( = ?auto_1532710 ?auto_1532713 ) ) ( not ( = ?auto_1532710 ?auto_1532714 ) ) ( not ( = ?auto_1532710 ?auto_1532715 ) ) ( not ( = ?auto_1532710 ?auto_1532716 ) ) ( not ( = ?auto_1532710 ?auto_1532717 ) ) ( not ( = ?auto_1532711 ?auto_1532712 ) ) ( not ( = ?auto_1532711 ?auto_1532713 ) ) ( not ( = ?auto_1532711 ?auto_1532714 ) ) ( not ( = ?auto_1532711 ?auto_1532715 ) ) ( not ( = ?auto_1532711 ?auto_1532716 ) ) ( not ( = ?auto_1532711 ?auto_1532717 ) ) ( not ( = ?auto_1532712 ?auto_1532713 ) ) ( not ( = ?auto_1532712 ?auto_1532714 ) ) ( not ( = ?auto_1532712 ?auto_1532715 ) ) ( not ( = ?auto_1532712 ?auto_1532716 ) ) ( not ( = ?auto_1532712 ?auto_1532717 ) ) ( not ( = ?auto_1532713 ?auto_1532714 ) ) ( not ( = ?auto_1532713 ?auto_1532715 ) ) ( not ( = ?auto_1532713 ?auto_1532716 ) ) ( not ( = ?auto_1532713 ?auto_1532717 ) ) ( not ( = ?auto_1532714 ?auto_1532715 ) ) ( not ( = ?auto_1532714 ?auto_1532716 ) ) ( not ( = ?auto_1532714 ?auto_1532717 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1532715 ?auto_1532716 ?auto_1532717 )
      ( MAKE-10CRATE-VERIFY ?auto_1532707 ?auto_1532708 ?auto_1532709 ?auto_1532710 ?auto_1532711 ?auto_1532712 ?auto_1532713 ?auto_1532714 ?auto_1532715 ?auto_1532716 ?auto_1532717 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1532812 - SURFACE
      ?auto_1532813 - SURFACE
      ?auto_1532814 - SURFACE
      ?auto_1532815 - SURFACE
      ?auto_1532816 - SURFACE
      ?auto_1532817 - SURFACE
      ?auto_1532818 - SURFACE
      ?auto_1532819 - SURFACE
      ?auto_1532820 - SURFACE
      ?auto_1532821 - SURFACE
      ?auto_1532822 - SURFACE
    )
    :vars
    (
      ?auto_1532826 - HOIST
      ?auto_1532825 - PLACE
      ?auto_1532823 - TRUCK
      ?auto_1532824 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1532826 ?auto_1532825 ) ( SURFACE-AT ?auto_1532821 ?auto_1532825 ) ( CLEAR ?auto_1532821 ) ( IS-CRATE ?auto_1532822 ) ( not ( = ?auto_1532821 ?auto_1532822 ) ) ( AVAILABLE ?auto_1532826 ) ( IN ?auto_1532822 ?auto_1532823 ) ( ON ?auto_1532821 ?auto_1532820 ) ( not ( = ?auto_1532820 ?auto_1532821 ) ) ( not ( = ?auto_1532820 ?auto_1532822 ) ) ( TRUCK-AT ?auto_1532823 ?auto_1532824 ) ( not ( = ?auto_1532824 ?auto_1532825 ) ) ( ON ?auto_1532813 ?auto_1532812 ) ( ON ?auto_1532814 ?auto_1532813 ) ( ON ?auto_1532815 ?auto_1532814 ) ( ON ?auto_1532816 ?auto_1532815 ) ( ON ?auto_1532817 ?auto_1532816 ) ( ON ?auto_1532818 ?auto_1532817 ) ( ON ?auto_1532819 ?auto_1532818 ) ( ON ?auto_1532820 ?auto_1532819 ) ( not ( = ?auto_1532812 ?auto_1532813 ) ) ( not ( = ?auto_1532812 ?auto_1532814 ) ) ( not ( = ?auto_1532812 ?auto_1532815 ) ) ( not ( = ?auto_1532812 ?auto_1532816 ) ) ( not ( = ?auto_1532812 ?auto_1532817 ) ) ( not ( = ?auto_1532812 ?auto_1532818 ) ) ( not ( = ?auto_1532812 ?auto_1532819 ) ) ( not ( = ?auto_1532812 ?auto_1532820 ) ) ( not ( = ?auto_1532812 ?auto_1532821 ) ) ( not ( = ?auto_1532812 ?auto_1532822 ) ) ( not ( = ?auto_1532813 ?auto_1532814 ) ) ( not ( = ?auto_1532813 ?auto_1532815 ) ) ( not ( = ?auto_1532813 ?auto_1532816 ) ) ( not ( = ?auto_1532813 ?auto_1532817 ) ) ( not ( = ?auto_1532813 ?auto_1532818 ) ) ( not ( = ?auto_1532813 ?auto_1532819 ) ) ( not ( = ?auto_1532813 ?auto_1532820 ) ) ( not ( = ?auto_1532813 ?auto_1532821 ) ) ( not ( = ?auto_1532813 ?auto_1532822 ) ) ( not ( = ?auto_1532814 ?auto_1532815 ) ) ( not ( = ?auto_1532814 ?auto_1532816 ) ) ( not ( = ?auto_1532814 ?auto_1532817 ) ) ( not ( = ?auto_1532814 ?auto_1532818 ) ) ( not ( = ?auto_1532814 ?auto_1532819 ) ) ( not ( = ?auto_1532814 ?auto_1532820 ) ) ( not ( = ?auto_1532814 ?auto_1532821 ) ) ( not ( = ?auto_1532814 ?auto_1532822 ) ) ( not ( = ?auto_1532815 ?auto_1532816 ) ) ( not ( = ?auto_1532815 ?auto_1532817 ) ) ( not ( = ?auto_1532815 ?auto_1532818 ) ) ( not ( = ?auto_1532815 ?auto_1532819 ) ) ( not ( = ?auto_1532815 ?auto_1532820 ) ) ( not ( = ?auto_1532815 ?auto_1532821 ) ) ( not ( = ?auto_1532815 ?auto_1532822 ) ) ( not ( = ?auto_1532816 ?auto_1532817 ) ) ( not ( = ?auto_1532816 ?auto_1532818 ) ) ( not ( = ?auto_1532816 ?auto_1532819 ) ) ( not ( = ?auto_1532816 ?auto_1532820 ) ) ( not ( = ?auto_1532816 ?auto_1532821 ) ) ( not ( = ?auto_1532816 ?auto_1532822 ) ) ( not ( = ?auto_1532817 ?auto_1532818 ) ) ( not ( = ?auto_1532817 ?auto_1532819 ) ) ( not ( = ?auto_1532817 ?auto_1532820 ) ) ( not ( = ?auto_1532817 ?auto_1532821 ) ) ( not ( = ?auto_1532817 ?auto_1532822 ) ) ( not ( = ?auto_1532818 ?auto_1532819 ) ) ( not ( = ?auto_1532818 ?auto_1532820 ) ) ( not ( = ?auto_1532818 ?auto_1532821 ) ) ( not ( = ?auto_1532818 ?auto_1532822 ) ) ( not ( = ?auto_1532819 ?auto_1532820 ) ) ( not ( = ?auto_1532819 ?auto_1532821 ) ) ( not ( = ?auto_1532819 ?auto_1532822 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1532820 ?auto_1532821 ?auto_1532822 )
      ( MAKE-10CRATE-VERIFY ?auto_1532812 ?auto_1532813 ?auto_1532814 ?auto_1532815 ?auto_1532816 ?auto_1532817 ?auto_1532818 ?auto_1532819 ?auto_1532820 ?auto_1532821 ?auto_1532822 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1532927 - SURFACE
      ?auto_1532928 - SURFACE
      ?auto_1532929 - SURFACE
      ?auto_1532930 - SURFACE
      ?auto_1532931 - SURFACE
      ?auto_1532932 - SURFACE
      ?auto_1532933 - SURFACE
      ?auto_1532934 - SURFACE
      ?auto_1532935 - SURFACE
      ?auto_1532936 - SURFACE
      ?auto_1532937 - SURFACE
    )
    :vars
    (
      ?auto_1532938 - HOIST
      ?auto_1532940 - PLACE
      ?auto_1532942 - TRUCK
      ?auto_1532941 - PLACE
      ?auto_1532939 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1532938 ?auto_1532940 ) ( SURFACE-AT ?auto_1532936 ?auto_1532940 ) ( CLEAR ?auto_1532936 ) ( IS-CRATE ?auto_1532937 ) ( not ( = ?auto_1532936 ?auto_1532937 ) ) ( AVAILABLE ?auto_1532938 ) ( ON ?auto_1532936 ?auto_1532935 ) ( not ( = ?auto_1532935 ?auto_1532936 ) ) ( not ( = ?auto_1532935 ?auto_1532937 ) ) ( TRUCK-AT ?auto_1532942 ?auto_1532941 ) ( not ( = ?auto_1532941 ?auto_1532940 ) ) ( HOIST-AT ?auto_1532939 ?auto_1532941 ) ( LIFTING ?auto_1532939 ?auto_1532937 ) ( not ( = ?auto_1532938 ?auto_1532939 ) ) ( ON ?auto_1532928 ?auto_1532927 ) ( ON ?auto_1532929 ?auto_1532928 ) ( ON ?auto_1532930 ?auto_1532929 ) ( ON ?auto_1532931 ?auto_1532930 ) ( ON ?auto_1532932 ?auto_1532931 ) ( ON ?auto_1532933 ?auto_1532932 ) ( ON ?auto_1532934 ?auto_1532933 ) ( ON ?auto_1532935 ?auto_1532934 ) ( not ( = ?auto_1532927 ?auto_1532928 ) ) ( not ( = ?auto_1532927 ?auto_1532929 ) ) ( not ( = ?auto_1532927 ?auto_1532930 ) ) ( not ( = ?auto_1532927 ?auto_1532931 ) ) ( not ( = ?auto_1532927 ?auto_1532932 ) ) ( not ( = ?auto_1532927 ?auto_1532933 ) ) ( not ( = ?auto_1532927 ?auto_1532934 ) ) ( not ( = ?auto_1532927 ?auto_1532935 ) ) ( not ( = ?auto_1532927 ?auto_1532936 ) ) ( not ( = ?auto_1532927 ?auto_1532937 ) ) ( not ( = ?auto_1532928 ?auto_1532929 ) ) ( not ( = ?auto_1532928 ?auto_1532930 ) ) ( not ( = ?auto_1532928 ?auto_1532931 ) ) ( not ( = ?auto_1532928 ?auto_1532932 ) ) ( not ( = ?auto_1532928 ?auto_1532933 ) ) ( not ( = ?auto_1532928 ?auto_1532934 ) ) ( not ( = ?auto_1532928 ?auto_1532935 ) ) ( not ( = ?auto_1532928 ?auto_1532936 ) ) ( not ( = ?auto_1532928 ?auto_1532937 ) ) ( not ( = ?auto_1532929 ?auto_1532930 ) ) ( not ( = ?auto_1532929 ?auto_1532931 ) ) ( not ( = ?auto_1532929 ?auto_1532932 ) ) ( not ( = ?auto_1532929 ?auto_1532933 ) ) ( not ( = ?auto_1532929 ?auto_1532934 ) ) ( not ( = ?auto_1532929 ?auto_1532935 ) ) ( not ( = ?auto_1532929 ?auto_1532936 ) ) ( not ( = ?auto_1532929 ?auto_1532937 ) ) ( not ( = ?auto_1532930 ?auto_1532931 ) ) ( not ( = ?auto_1532930 ?auto_1532932 ) ) ( not ( = ?auto_1532930 ?auto_1532933 ) ) ( not ( = ?auto_1532930 ?auto_1532934 ) ) ( not ( = ?auto_1532930 ?auto_1532935 ) ) ( not ( = ?auto_1532930 ?auto_1532936 ) ) ( not ( = ?auto_1532930 ?auto_1532937 ) ) ( not ( = ?auto_1532931 ?auto_1532932 ) ) ( not ( = ?auto_1532931 ?auto_1532933 ) ) ( not ( = ?auto_1532931 ?auto_1532934 ) ) ( not ( = ?auto_1532931 ?auto_1532935 ) ) ( not ( = ?auto_1532931 ?auto_1532936 ) ) ( not ( = ?auto_1532931 ?auto_1532937 ) ) ( not ( = ?auto_1532932 ?auto_1532933 ) ) ( not ( = ?auto_1532932 ?auto_1532934 ) ) ( not ( = ?auto_1532932 ?auto_1532935 ) ) ( not ( = ?auto_1532932 ?auto_1532936 ) ) ( not ( = ?auto_1532932 ?auto_1532937 ) ) ( not ( = ?auto_1532933 ?auto_1532934 ) ) ( not ( = ?auto_1532933 ?auto_1532935 ) ) ( not ( = ?auto_1532933 ?auto_1532936 ) ) ( not ( = ?auto_1532933 ?auto_1532937 ) ) ( not ( = ?auto_1532934 ?auto_1532935 ) ) ( not ( = ?auto_1532934 ?auto_1532936 ) ) ( not ( = ?auto_1532934 ?auto_1532937 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1532935 ?auto_1532936 ?auto_1532937 )
      ( MAKE-10CRATE-VERIFY ?auto_1532927 ?auto_1532928 ?auto_1532929 ?auto_1532930 ?auto_1532931 ?auto_1532932 ?auto_1532933 ?auto_1532934 ?auto_1532935 ?auto_1532936 ?auto_1532937 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1533052 - SURFACE
      ?auto_1533053 - SURFACE
      ?auto_1533054 - SURFACE
      ?auto_1533055 - SURFACE
      ?auto_1533056 - SURFACE
      ?auto_1533057 - SURFACE
      ?auto_1533058 - SURFACE
      ?auto_1533059 - SURFACE
      ?auto_1533060 - SURFACE
      ?auto_1533061 - SURFACE
      ?auto_1533062 - SURFACE
    )
    :vars
    (
      ?auto_1533068 - HOIST
      ?auto_1533063 - PLACE
      ?auto_1533067 - TRUCK
      ?auto_1533065 - PLACE
      ?auto_1533064 - HOIST
      ?auto_1533066 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1533068 ?auto_1533063 ) ( SURFACE-AT ?auto_1533061 ?auto_1533063 ) ( CLEAR ?auto_1533061 ) ( IS-CRATE ?auto_1533062 ) ( not ( = ?auto_1533061 ?auto_1533062 ) ) ( AVAILABLE ?auto_1533068 ) ( ON ?auto_1533061 ?auto_1533060 ) ( not ( = ?auto_1533060 ?auto_1533061 ) ) ( not ( = ?auto_1533060 ?auto_1533062 ) ) ( TRUCK-AT ?auto_1533067 ?auto_1533065 ) ( not ( = ?auto_1533065 ?auto_1533063 ) ) ( HOIST-AT ?auto_1533064 ?auto_1533065 ) ( not ( = ?auto_1533068 ?auto_1533064 ) ) ( AVAILABLE ?auto_1533064 ) ( SURFACE-AT ?auto_1533062 ?auto_1533065 ) ( ON ?auto_1533062 ?auto_1533066 ) ( CLEAR ?auto_1533062 ) ( not ( = ?auto_1533061 ?auto_1533066 ) ) ( not ( = ?auto_1533062 ?auto_1533066 ) ) ( not ( = ?auto_1533060 ?auto_1533066 ) ) ( ON ?auto_1533053 ?auto_1533052 ) ( ON ?auto_1533054 ?auto_1533053 ) ( ON ?auto_1533055 ?auto_1533054 ) ( ON ?auto_1533056 ?auto_1533055 ) ( ON ?auto_1533057 ?auto_1533056 ) ( ON ?auto_1533058 ?auto_1533057 ) ( ON ?auto_1533059 ?auto_1533058 ) ( ON ?auto_1533060 ?auto_1533059 ) ( not ( = ?auto_1533052 ?auto_1533053 ) ) ( not ( = ?auto_1533052 ?auto_1533054 ) ) ( not ( = ?auto_1533052 ?auto_1533055 ) ) ( not ( = ?auto_1533052 ?auto_1533056 ) ) ( not ( = ?auto_1533052 ?auto_1533057 ) ) ( not ( = ?auto_1533052 ?auto_1533058 ) ) ( not ( = ?auto_1533052 ?auto_1533059 ) ) ( not ( = ?auto_1533052 ?auto_1533060 ) ) ( not ( = ?auto_1533052 ?auto_1533061 ) ) ( not ( = ?auto_1533052 ?auto_1533062 ) ) ( not ( = ?auto_1533052 ?auto_1533066 ) ) ( not ( = ?auto_1533053 ?auto_1533054 ) ) ( not ( = ?auto_1533053 ?auto_1533055 ) ) ( not ( = ?auto_1533053 ?auto_1533056 ) ) ( not ( = ?auto_1533053 ?auto_1533057 ) ) ( not ( = ?auto_1533053 ?auto_1533058 ) ) ( not ( = ?auto_1533053 ?auto_1533059 ) ) ( not ( = ?auto_1533053 ?auto_1533060 ) ) ( not ( = ?auto_1533053 ?auto_1533061 ) ) ( not ( = ?auto_1533053 ?auto_1533062 ) ) ( not ( = ?auto_1533053 ?auto_1533066 ) ) ( not ( = ?auto_1533054 ?auto_1533055 ) ) ( not ( = ?auto_1533054 ?auto_1533056 ) ) ( not ( = ?auto_1533054 ?auto_1533057 ) ) ( not ( = ?auto_1533054 ?auto_1533058 ) ) ( not ( = ?auto_1533054 ?auto_1533059 ) ) ( not ( = ?auto_1533054 ?auto_1533060 ) ) ( not ( = ?auto_1533054 ?auto_1533061 ) ) ( not ( = ?auto_1533054 ?auto_1533062 ) ) ( not ( = ?auto_1533054 ?auto_1533066 ) ) ( not ( = ?auto_1533055 ?auto_1533056 ) ) ( not ( = ?auto_1533055 ?auto_1533057 ) ) ( not ( = ?auto_1533055 ?auto_1533058 ) ) ( not ( = ?auto_1533055 ?auto_1533059 ) ) ( not ( = ?auto_1533055 ?auto_1533060 ) ) ( not ( = ?auto_1533055 ?auto_1533061 ) ) ( not ( = ?auto_1533055 ?auto_1533062 ) ) ( not ( = ?auto_1533055 ?auto_1533066 ) ) ( not ( = ?auto_1533056 ?auto_1533057 ) ) ( not ( = ?auto_1533056 ?auto_1533058 ) ) ( not ( = ?auto_1533056 ?auto_1533059 ) ) ( not ( = ?auto_1533056 ?auto_1533060 ) ) ( not ( = ?auto_1533056 ?auto_1533061 ) ) ( not ( = ?auto_1533056 ?auto_1533062 ) ) ( not ( = ?auto_1533056 ?auto_1533066 ) ) ( not ( = ?auto_1533057 ?auto_1533058 ) ) ( not ( = ?auto_1533057 ?auto_1533059 ) ) ( not ( = ?auto_1533057 ?auto_1533060 ) ) ( not ( = ?auto_1533057 ?auto_1533061 ) ) ( not ( = ?auto_1533057 ?auto_1533062 ) ) ( not ( = ?auto_1533057 ?auto_1533066 ) ) ( not ( = ?auto_1533058 ?auto_1533059 ) ) ( not ( = ?auto_1533058 ?auto_1533060 ) ) ( not ( = ?auto_1533058 ?auto_1533061 ) ) ( not ( = ?auto_1533058 ?auto_1533062 ) ) ( not ( = ?auto_1533058 ?auto_1533066 ) ) ( not ( = ?auto_1533059 ?auto_1533060 ) ) ( not ( = ?auto_1533059 ?auto_1533061 ) ) ( not ( = ?auto_1533059 ?auto_1533062 ) ) ( not ( = ?auto_1533059 ?auto_1533066 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1533060 ?auto_1533061 ?auto_1533062 )
      ( MAKE-10CRATE-VERIFY ?auto_1533052 ?auto_1533053 ?auto_1533054 ?auto_1533055 ?auto_1533056 ?auto_1533057 ?auto_1533058 ?auto_1533059 ?auto_1533060 ?auto_1533061 ?auto_1533062 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1533178 - SURFACE
      ?auto_1533179 - SURFACE
      ?auto_1533180 - SURFACE
      ?auto_1533181 - SURFACE
      ?auto_1533182 - SURFACE
      ?auto_1533183 - SURFACE
      ?auto_1533184 - SURFACE
      ?auto_1533185 - SURFACE
      ?auto_1533186 - SURFACE
      ?auto_1533187 - SURFACE
      ?auto_1533188 - SURFACE
    )
    :vars
    (
      ?auto_1533189 - HOIST
      ?auto_1533194 - PLACE
      ?auto_1533192 - PLACE
      ?auto_1533193 - HOIST
      ?auto_1533190 - SURFACE
      ?auto_1533191 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1533189 ?auto_1533194 ) ( SURFACE-AT ?auto_1533187 ?auto_1533194 ) ( CLEAR ?auto_1533187 ) ( IS-CRATE ?auto_1533188 ) ( not ( = ?auto_1533187 ?auto_1533188 ) ) ( AVAILABLE ?auto_1533189 ) ( ON ?auto_1533187 ?auto_1533186 ) ( not ( = ?auto_1533186 ?auto_1533187 ) ) ( not ( = ?auto_1533186 ?auto_1533188 ) ) ( not ( = ?auto_1533192 ?auto_1533194 ) ) ( HOIST-AT ?auto_1533193 ?auto_1533192 ) ( not ( = ?auto_1533189 ?auto_1533193 ) ) ( AVAILABLE ?auto_1533193 ) ( SURFACE-AT ?auto_1533188 ?auto_1533192 ) ( ON ?auto_1533188 ?auto_1533190 ) ( CLEAR ?auto_1533188 ) ( not ( = ?auto_1533187 ?auto_1533190 ) ) ( not ( = ?auto_1533188 ?auto_1533190 ) ) ( not ( = ?auto_1533186 ?auto_1533190 ) ) ( TRUCK-AT ?auto_1533191 ?auto_1533194 ) ( ON ?auto_1533179 ?auto_1533178 ) ( ON ?auto_1533180 ?auto_1533179 ) ( ON ?auto_1533181 ?auto_1533180 ) ( ON ?auto_1533182 ?auto_1533181 ) ( ON ?auto_1533183 ?auto_1533182 ) ( ON ?auto_1533184 ?auto_1533183 ) ( ON ?auto_1533185 ?auto_1533184 ) ( ON ?auto_1533186 ?auto_1533185 ) ( not ( = ?auto_1533178 ?auto_1533179 ) ) ( not ( = ?auto_1533178 ?auto_1533180 ) ) ( not ( = ?auto_1533178 ?auto_1533181 ) ) ( not ( = ?auto_1533178 ?auto_1533182 ) ) ( not ( = ?auto_1533178 ?auto_1533183 ) ) ( not ( = ?auto_1533178 ?auto_1533184 ) ) ( not ( = ?auto_1533178 ?auto_1533185 ) ) ( not ( = ?auto_1533178 ?auto_1533186 ) ) ( not ( = ?auto_1533178 ?auto_1533187 ) ) ( not ( = ?auto_1533178 ?auto_1533188 ) ) ( not ( = ?auto_1533178 ?auto_1533190 ) ) ( not ( = ?auto_1533179 ?auto_1533180 ) ) ( not ( = ?auto_1533179 ?auto_1533181 ) ) ( not ( = ?auto_1533179 ?auto_1533182 ) ) ( not ( = ?auto_1533179 ?auto_1533183 ) ) ( not ( = ?auto_1533179 ?auto_1533184 ) ) ( not ( = ?auto_1533179 ?auto_1533185 ) ) ( not ( = ?auto_1533179 ?auto_1533186 ) ) ( not ( = ?auto_1533179 ?auto_1533187 ) ) ( not ( = ?auto_1533179 ?auto_1533188 ) ) ( not ( = ?auto_1533179 ?auto_1533190 ) ) ( not ( = ?auto_1533180 ?auto_1533181 ) ) ( not ( = ?auto_1533180 ?auto_1533182 ) ) ( not ( = ?auto_1533180 ?auto_1533183 ) ) ( not ( = ?auto_1533180 ?auto_1533184 ) ) ( not ( = ?auto_1533180 ?auto_1533185 ) ) ( not ( = ?auto_1533180 ?auto_1533186 ) ) ( not ( = ?auto_1533180 ?auto_1533187 ) ) ( not ( = ?auto_1533180 ?auto_1533188 ) ) ( not ( = ?auto_1533180 ?auto_1533190 ) ) ( not ( = ?auto_1533181 ?auto_1533182 ) ) ( not ( = ?auto_1533181 ?auto_1533183 ) ) ( not ( = ?auto_1533181 ?auto_1533184 ) ) ( not ( = ?auto_1533181 ?auto_1533185 ) ) ( not ( = ?auto_1533181 ?auto_1533186 ) ) ( not ( = ?auto_1533181 ?auto_1533187 ) ) ( not ( = ?auto_1533181 ?auto_1533188 ) ) ( not ( = ?auto_1533181 ?auto_1533190 ) ) ( not ( = ?auto_1533182 ?auto_1533183 ) ) ( not ( = ?auto_1533182 ?auto_1533184 ) ) ( not ( = ?auto_1533182 ?auto_1533185 ) ) ( not ( = ?auto_1533182 ?auto_1533186 ) ) ( not ( = ?auto_1533182 ?auto_1533187 ) ) ( not ( = ?auto_1533182 ?auto_1533188 ) ) ( not ( = ?auto_1533182 ?auto_1533190 ) ) ( not ( = ?auto_1533183 ?auto_1533184 ) ) ( not ( = ?auto_1533183 ?auto_1533185 ) ) ( not ( = ?auto_1533183 ?auto_1533186 ) ) ( not ( = ?auto_1533183 ?auto_1533187 ) ) ( not ( = ?auto_1533183 ?auto_1533188 ) ) ( not ( = ?auto_1533183 ?auto_1533190 ) ) ( not ( = ?auto_1533184 ?auto_1533185 ) ) ( not ( = ?auto_1533184 ?auto_1533186 ) ) ( not ( = ?auto_1533184 ?auto_1533187 ) ) ( not ( = ?auto_1533184 ?auto_1533188 ) ) ( not ( = ?auto_1533184 ?auto_1533190 ) ) ( not ( = ?auto_1533185 ?auto_1533186 ) ) ( not ( = ?auto_1533185 ?auto_1533187 ) ) ( not ( = ?auto_1533185 ?auto_1533188 ) ) ( not ( = ?auto_1533185 ?auto_1533190 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1533186 ?auto_1533187 ?auto_1533188 )
      ( MAKE-10CRATE-VERIFY ?auto_1533178 ?auto_1533179 ?auto_1533180 ?auto_1533181 ?auto_1533182 ?auto_1533183 ?auto_1533184 ?auto_1533185 ?auto_1533186 ?auto_1533187 ?auto_1533188 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1533304 - SURFACE
      ?auto_1533305 - SURFACE
      ?auto_1533306 - SURFACE
      ?auto_1533307 - SURFACE
      ?auto_1533308 - SURFACE
      ?auto_1533309 - SURFACE
      ?auto_1533310 - SURFACE
      ?auto_1533311 - SURFACE
      ?auto_1533312 - SURFACE
      ?auto_1533313 - SURFACE
      ?auto_1533314 - SURFACE
    )
    :vars
    (
      ?auto_1533317 - HOIST
      ?auto_1533315 - PLACE
      ?auto_1533319 - PLACE
      ?auto_1533320 - HOIST
      ?auto_1533318 - SURFACE
      ?auto_1533316 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1533317 ?auto_1533315 ) ( IS-CRATE ?auto_1533314 ) ( not ( = ?auto_1533313 ?auto_1533314 ) ) ( not ( = ?auto_1533312 ?auto_1533313 ) ) ( not ( = ?auto_1533312 ?auto_1533314 ) ) ( not ( = ?auto_1533319 ?auto_1533315 ) ) ( HOIST-AT ?auto_1533320 ?auto_1533319 ) ( not ( = ?auto_1533317 ?auto_1533320 ) ) ( AVAILABLE ?auto_1533320 ) ( SURFACE-AT ?auto_1533314 ?auto_1533319 ) ( ON ?auto_1533314 ?auto_1533318 ) ( CLEAR ?auto_1533314 ) ( not ( = ?auto_1533313 ?auto_1533318 ) ) ( not ( = ?auto_1533314 ?auto_1533318 ) ) ( not ( = ?auto_1533312 ?auto_1533318 ) ) ( TRUCK-AT ?auto_1533316 ?auto_1533315 ) ( SURFACE-AT ?auto_1533312 ?auto_1533315 ) ( CLEAR ?auto_1533312 ) ( LIFTING ?auto_1533317 ?auto_1533313 ) ( IS-CRATE ?auto_1533313 ) ( ON ?auto_1533305 ?auto_1533304 ) ( ON ?auto_1533306 ?auto_1533305 ) ( ON ?auto_1533307 ?auto_1533306 ) ( ON ?auto_1533308 ?auto_1533307 ) ( ON ?auto_1533309 ?auto_1533308 ) ( ON ?auto_1533310 ?auto_1533309 ) ( ON ?auto_1533311 ?auto_1533310 ) ( ON ?auto_1533312 ?auto_1533311 ) ( not ( = ?auto_1533304 ?auto_1533305 ) ) ( not ( = ?auto_1533304 ?auto_1533306 ) ) ( not ( = ?auto_1533304 ?auto_1533307 ) ) ( not ( = ?auto_1533304 ?auto_1533308 ) ) ( not ( = ?auto_1533304 ?auto_1533309 ) ) ( not ( = ?auto_1533304 ?auto_1533310 ) ) ( not ( = ?auto_1533304 ?auto_1533311 ) ) ( not ( = ?auto_1533304 ?auto_1533312 ) ) ( not ( = ?auto_1533304 ?auto_1533313 ) ) ( not ( = ?auto_1533304 ?auto_1533314 ) ) ( not ( = ?auto_1533304 ?auto_1533318 ) ) ( not ( = ?auto_1533305 ?auto_1533306 ) ) ( not ( = ?auto_1533305 ?auto_1533307 ) ) ( not ( = ?auto_1533305 ?auto_1533308 ) ) ( not ( = ?auto_1533305 ?auto_1533309 ) ) ( not ( = ?auto_1533305 ?auto_1533310 ) ) ( not ( = ?auto_1533305 ?auto_1533311 ) ) ( not ( = ?auto_1533305 ?auto_1533312 ) ) ( not ( = ?auto_1533305 ?auto_1533313 ) ) ( not ( = ?auto_1533305 ?auto_1533314 ) ) ( not ( = ?auto_1533305 ?auto_1533318 ) ) ( not ( = ?auto_1533306 ?auto_1533307 ) ) ( not ( = ?auto_1533306 ?auto_1533308 ) ) ( not ( = ?auto_1533306 ?auto_1533309 ) ) ( not ( = ?auto_1533306 ?auto_1533310 ) ) ( not ( = ?auto_1533306 ?auto_1533311 ) ) ( not ( = ?auto_1533306 ?auto_1533312 ) ) ( not ( = ?auto_1533306 ?auto_1533313 ) ) ( not ( = ?auto_1533306 ?auto_1533314 ) ) ( not ( = ?auto_1533306 ?auto_1533318 ) ) ( not ( = ?auto_1533307 ?auto_1533308 ) ) ( not ( = ?auto_1533307 ?auto_1533309 ) ) ( not ( = ?auto_1533307 ?auto_1533310 ) ) ( not ( = ?auto_1533307 ?auto_1533311 ) ) ( not ( = ?auto_1533307 ?auto_1533312 ) ) ( not ( = ?auto_1533307 ?auto_1533313 ) ) ( not ( = ?auto_1533307 ?auto_1533314 ) ) ( not ( = ?auto_1533307 ?auto_1533318 ) ) ( not ( = ?auto_1533308 ?auto_1533309 ) ) ( not ( = ?auto_1533308 ?auto_1533310 ) ) ( not ( = ?auto_1533308 ?auto_1533311 ) ) ( not ( = ?auto_1533308 ?auto_1533312 ) ) ( not ( = ?auto_1533308 ?auto_1533313 ) ) ( not ( = ?auto_1533308 ?auto_1533314 ) ) ( not ( = ?auto_1533308 ?auto_1533318 ) ) ( not ( = ?auto_1533309 ?auto_1533310 ) ) ( not ( = ?auto_1533309 ?auto_1533311 ) ) ( not ( = ?auto_1533309 ?auto_1533312 ) ) ( not ( = ?auto_1533309 ?auto_1533313 ) ) ( not ( = ?auto_1533309 ?auto_1533314 ) ) ( not ( = ?auto_1533309 ?auto_1533318 ) ) ( not ( = ?auto_1533310 ?auto_1533311 ) ) ( not ( = ?auto_1533310 ?auto_1533312 ) ) ( not ( = ?auto_1533310 ?auto_1533313 ) ) ( not ( = ?auto_1533310 ?auto_1533314 ) ) ( not ( = ?auto_1533310 ?auto_1533318 ) ) ( not ( = ?auto_1533311 ?auto_1533312 ) ) ( not ( = ?auto_1533311 ?auto_1533313 ) ) ( not ( = ?auto_1533311 ?auto_1533314 ) ) ( not ( = ?auto_1533311 ?auto_1533318 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1533312 ?auto_1533313 ?auto_1533314 )
      ( MAKE-10CRATE-VERIFY ?auto_1533304 ?auto_1533305 ?auto_1533306 ?auto_1533307 ?auto_1533308 ?auto_1533309 ?auto_1533310 ?auto_1533311 ?auto_1533312 ?auto_1533313 ?auto_1533314 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1533430 - SURFACE
      ?auto_1533431 - SURFACE
      ?auto_1533432 - SURFACE
      ?auto_1533433 - SURFACE
      ?auto_1533434 - SURFACE
      ?auto_1533435 - SURFACE
      ?auto_1533436 - SURFACE
      ?auto_1533437 - SURFACE
      ?auto_1533438 - SURFACE
      ?auto_1533439 - SURFACE
      ?auto_1533440 - SURFACE
    )
    :vars
    (
      ?auto_1533441 - HOIST
      ?auto_1533442 - PLACE
      ?auto_1533445 - PLACE
      ?auto_1533443 - HOIST
      ?auto_1533444 - SURFACE
      ?auto_1533446 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1533441 ?auto_1533442 ) ( IS-CRATE ?auto_1533440 ) ( not ( = ?auto_1533439 ?auto_1533440 ) ) ( not ( = ?auto_1533438 ?auto_1533439 ) ) ( not ( = ?auto_1533438 ?auto_1533440 ) ) ( not ( = ?auto_1533445 ?auto_1533442 ) ) ( HOIST-AT ?auto_1533443 ?auto_1533445 ) ( not ( = ?auto_1533441 ?auto_1533443 ) ) ( AVAILABLE ?auto_1533443 ) ( SURFACE-AT ?auto_1533440 ?auto_1533445 ) ( ON ?auto_1533440 ?auto_1533444 ) ( CLEAR ?auto_1533440 ) ( not ( = ?auto_1533439 ?auto_1533444 ) ) ( not ( = ?auto_1533440 ?auto_1533444 ) ) ( not ( = ?auto_1533438 ?auto_1533444 ) ) ( TRUCK-AT ?auto_1533446 ?auto_1533442 ) ( SURFACE-AT ?auto_1533438 ?auto_1533442 ) ( CLEAR ?auto_1533438 ) ( IS-CRATE ?auto_1533439 ) ( AVAILABLE ?auto_1533441 ) ( IN ?auto_1533439 ?auto_1533446 ) ( ON ?auto_1533431 ?auto_1533430 ) ( ON ?auto_1533432 ?auto_1533431 ) ( ON ?auto_1533433 ?auto_1533432 ) ( ON ?auto_1533434 ?auto_1533433 ) ( ON ?auto_1533435 ?auto_1533434 ) ( ON ?auto_1533436 ?auto_1533435 ) ( ON ?auto_1533437 ?auto_1533436 ) ( ON ?auto_1533438 ?auto_1533437 ) ( not ( = ?auto_1533430 ?auto_1533431 ) ) ( not ( = ?auto_1533430 ?auto_1533432 ) ) ( not ( = ?auto_1533430 ?auto_1533433 ) ) ( not ( = ?auto_1533430 ?auto_1533434 ) ) ( not ( = ?auto_1533430 ?auto_1533435 ) ) ( not ( = ?auto_1533430 ?auto_1533436 ) ) ( not ( = ?auto_1533430 ?auto_1533437 ) ) ( not ( = ?auto_1533430 ?auto_1533438 ) ) ( not ( = ?auto_1533430 ?auto_1533439 ) ) ( not ( = ?auto_1533430 ?auto_1533440 ) ) ( not ( = ?auto_1533430 ?auto_1533444 ) ) ( not ( = ?auto_1533431 ?auto_1533432 ) ) ( not ( = ?auto_1533431 ?auto_1533433 ) ) ( not ( = ?auto_1533431 ?auto_1533434 ) ) ( not ( = ?auto_1533431 ?auto_1533435 ) ) ( not ( = ?auto_1533431 ?auto_1533436 ) ) ( not ( = ?auto_1533431 ?auto_1533437 ) ) ( not ( = ?auto_1533431 ?auto_1533438 ) ) ( not ( = ?auto_1533431 ?auto_1533439 ) ) ( not ( = ?auto_1533431 ?auto_1533440 ) ) ( not ( = ?auto_1533431 ?auto_1533444 ) ) ( not ( = ?auto_1533432 ?auto_1533433 ) ) ( not ( = ?auto_1533432 ?auto_1533434 ) ) ( not ( = ?auto_1533432 ?auto_1533435 ) ) ( not ( = ?auto_1533432 ?auto_1533436 ) ) ( not ( = ?auto_1533432 ?auto_1533437 ) ) ( not ( = ?auto_1533432 ?auto_1533438 ) ) ( not ( = ?auto_1533432 ?auto_1533439 ) ) ( not ( = ?auto_1533432 ?auto_1533440 ) ) ( not ( = ?auto_1533432 ?auto_1533444 ) ) ( not ( = ?auto_1533433 ?auto_1533434 ) ) ( not ( = ?auto_1533433 ?auto_1533435 ) ) ( not ( = ?auto_1533433 ?auto_1533436 ) ) ( not ( = ?auto_1533433 ?auto_1533437 ) ) ( not ( = ?auto_1533433 ?auto_1533438 ) ) ( not ( = ?auto_1533433 ?auto_1533439 ) ) ( not ( = ?auto_1533433 ?auto_1533440 ) ) ( not ( = ?auto_1533433 ?auto_1533444 ) ) ( not ( = ?auto_1533434 ?auto_1533435 ) ) ( not ( = ?auto_1533434 ?auto_1533436 ) ) ( not ( = ?auto_1533434 ?auto_1533437 ) ) ( not ( = ?auto_1533434 ?auto_1533438 ) ) ( not ( = ?auto_1533434 ?auto_1533439 ) ) ( not ( = ?auto_1533434 ?auto_1533440 ) ) ( not ( = ?auto_1533434 ?auto_1533444 ) ) ( not ( = ?auto_1533435 ?auto_1533436 ) ) ( not ( = ?auto_1533435 ?auto_1533437 ) ) ( not ( = ?auto_1533435 ?auto_1533438 ) ) ( not ( = ?auto_1533435 ?auto_1533439 ) ) ( not ( = ?auto_1533435 ?auto_1533440 ) ) ( not ( = ?auto_1533435 ?auto_1533444 ) ) ( not ( = ?auto_1533436 ?auto_1533437 ) ) ( not ( = ?auto_1533436 ?auto_1533438 ) ) ( not ( = ?auto_1533436 ?auto_1533439 ) ) ( not ( = ?auto_1533436 ?auto_1533440 ) ) ( not ( = ?auto_1533436 ?auto_1533444 ) ) ( not ( = ?auto_1533437 ?auto_1533438 ) ) ( not ( = ?auto_1533437 ?auto_1533439 ) ) ( not ( = ?auto_1533437 ?auto_1533440 ) ) ( not ( = ?auto_1533437 ?auto_1533444 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1533438 ?auto_1533439 ?auto_1533440 )
      ( MAKE-10CRATE-VERIFY ?auto_1533430 ?auto_1533431 ?auto_1533432 ?auto_1533433 ?auto_1533434 ?auto_1533435 ?auto_1533436 ?auto_1533437 ?auto_1533438 ?auto_1533439 ?auto_1533440 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1540692 - SURFACE
      ?auto_1540693 - SURFACE
      ?auto_1540694 - SURFACE
      ?auto_1540695 - SURFACE
      ?auto_1540696 - SURFACE
      ?auto_1540697 - SURFACE
      ?auto_1540698 - SURFACE
      ?auto_1540699 - SURFACE
      ?auto_1540700 - SURFACE
      ?auto_1540701 - SURFACE
      ?auto_1540702 - SURFACE
      ?auto_1540703 - SURFACE
    )
    :vars
    (
      ?auto_1540705 - HOIST
      ?auto_1540704 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1540705 ?auto_1540704 ) ( SURFACE-AT ?auto_1540702 ?auto_1540704 ) ( CLEAR ?auto_1540702 ) ( LIFTING ?auto_1540705 ?auto_1540703 ) ( IS-CRATE ?auto_1540703 ) ( not ( = ?auto_1540702 ?auto_1540703 ) ) ( ON ?auto_1540693 ?auto_1540692 ) ( ON ?auto_1540694 ?auto_1540693 ) ( ON ?auto_1540695 ?auto_1540694 ) ( ON ?auto_1540696 ?auto_1540695 ) ( ON ?auto_1540697 ?auto_1540696 ) ( ON ?auto_1540698 ?auto_1540697 ) ( ON ?auto_1540699 ?auto_1540698 ) ( ON ?auto_1540700 ?auto_1540699 ) ( ON ?auto_1540701 ?auto_1540700 ) ( ON ?auto_1540702 ?auto_1540701 ) ( not ( = ?auto_1540692 ?auto_1540693 ) ) ( not ( = ?auto_1540692 ?auto_1540694 ) ) ( not ( = ?auto_1540692 ?auto_1540695 ) ) ( not ( = ?auto_1540692 ?auto_1540696 ) ) ( not ( = ?auto_1540692 ?auto_1540697 ) ) ( not ( = ?auto_1540692 ?auto_1540698 ) ) ( not ( = ?auto_1540692 ?auto_1540699 ) ) ( not ( = ?auto_1540692 ?auto_1540700 ) ) ( not ( = ?auto_1540692 ?auto_1540701 ) ) ( not ( = ?auto_1540692 ?auto_1540702 ) ) ( not ( = ?auto_1540692 ?auto_1540703 ) ) ( not ( = ?auto_1540693 ?auto_1540694 ) ) ( not ( = ?auto_1540693 ?auto_1540695 ) ) ( not ( = ?auto_1540693 ?auto_1540696 ) ) ( not ( = ?auto_1540693 ?auto_1540697 ) ) ( not ( = ?auto_1540693 ?auto_1540698 ) ) ( not ( = ?auto_1540693 ?auto_1540699 ) ) ( not ( = ?auto_1540693 ?auto_1540700 ) ) ( not ( = ?auto_1540693 ?auto_1540701 ) ) ( not ( = ?auto_1540693 ?auto_1540702 ) ) ( not ( = ?auto_1540693 ?auto_1540703 ) ) ( not ( = ?auto_1540694 ?auto_1540695 ) ) ( not ( = ?auto_1540694 ?auto_1540696 ) ) ( not ( = ?auto_1540694 ?auto_1540697 ) ) ( not ( = ?auto_1540694 ?auto_1540698 ) ) ( not ( = ?auto_1540694 ?auto_1540699 ) ) ( not ( = ?auto_1540694 ?auto_1540700 ) ) ( not ( = ?auto_1540694 ?auto_1540701 ) ) ( not ( = ?auto_1540694 ?auto_1540702 ) ) ( not ( = ?auto_1540694 ?auto_1540703 ) ) ( not ( = ?auto_1540695 ?auto_1540696 ) ) ( not ( = ?auto_1540695 ?auto_1540697 ) ) ( not ( = ?auto_1540695 ?auto_1540698 ) ) ( not ( = ?auto_1540695 ?auto_1540699 ) ) ( not ( = ?auto_1540695 ?auto_1540700 ) ) ( not ( = ?auto_1540695 ?auto_1540701 ) ) ( not ( = ?auto_1540695 ?auto_1540702 ) ) ( not ( = ?auto_1540695 ?auto_1540703 ) ) ( not ( = ?auto_1540696 ?auto_1540697 ) ) ( not ( = ?auto_1540696 ?auto_1540698 ) ) ( not ( = ?auto_1540696 ?auto_1540699 ) ) ( not ( = ?auto_1540696 ?auto_1540700 ) ) ( not ( = ?auto_1540696 ?auto_1540701 ) ) ( not ( = ?auto_1540696 ?auto_1540702 ) ) ( not ( = ?auto_1540696 ?auto_1540703 ) ) ( not ( = ?auto_1540697 ?auto_1540698 ) ) ( not ( = ?auto_1540697 ?auto_1540699 ) ) ( not ( = ?auto_1540697 ?auto_1540700 ) ) ( not ( = ?auto_1540697 ?auto_1540701 ) ) ( not ( = ?auto_1540697 ?auto_1540702 ) ) ( not ( = ?auto_1540697 ?auto_1540703 ) ) ( not ( = ?auto_1540698 ?auto_1540699 ) ) ( not ( = ?auto_1540698 ?auto_1540700 ) ) ( not ( = ?auto_1540698 ?auto_1540701 ) ) ( not ( = ?auto_1540698 ?auto_1540702 ) ) ( not ( = ?auto_1540698 ?auto_1540703 ) ) ( not ( = ?auto_1540699 ?auto_1540700 ) ) ( not ( = ?auto_1540699 ?auto_1540701 ) ) ( not ( = ?auto_1540699 ?auto_1540702 ) ) ( not ( = ?auto_1540699 ?auto_1540703 ) ) ( not ( = ?auto_1540700 ?auto_1540701 ) ) ( not ( = ?auto_1540700 ?auto_1540702 ) ) ( not ( = ?auto_1540700 ?auto_1540703 ) ) ( not ( = ?auto_1540701 ?auto_1540702 ) ) ( not ( = ?auto_1540701 ?auto_1540703 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1540702 ?auto_1540703 )
      ( MAKE-11CRATE-VERIFY ?auto_1540692 ?auto_1540693 ?auto_1540694 ?auto_1540695 ?auto_1540696 ?auto_1540697 ?auto_1540698 ?auto_1540699 ?auto_1540700 ?auto_1540701 ?auto_1540702 ?auto_1540703 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1540801 - SURFACE
      ?auto_1540802 - SURFACE
      ?auto_1540803 - SURFACE
      ?auto_1540804 - SURFACE
      ?auto_1540805 - SURFACE
      ?auto_1540806 - SURFACE
      ?auto_1540807 - SURFACE
      ?auto_1540808 - SURFACE
      ?auto_1540809 - SURFACE
      ?auto_1540810 - SURFACE
      ?auto_1540811 - SURFACE
      ?auto_1540812 - SURFACE
    )
    :vars
    (
      ?auto_1540813 - HOIST
      ?auto_1540814 - PLACE
      ?auto_1540815 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1540813 ?auto_1540814 ) ( SURFACE-AT ?auto_1540811 ?auto_1540814 ) ( CLEAR ?auto_1540811 ) ( IS-CRATE ?auto_1540812 ) ( not ( = ?auto_1540811 ?auto_1540812 ) ) ( TRUCK-AT ?auto_1540815 ?auto_1540814 ) ( AVAILABLE ?auto_1540813 ) ( IN ?auto_1540812 ?auto_1540815 ) ( ON ?auto_1540811 ?auto_1540810 ) ( not ( = ?auto_1540810 ?auto_1540811 ) ) ( not ( = ?auto_1540810 ?auto_1540812 ) ) ( ON ?auto_1540802 ?auto_1540801 ) ( ON ?auto_1540803 ?auto_1540802 ) ( ON ?auto_1540804 ?auto_1540803 ) ( ON ?auto_1540805 ?auto_1540804 ) ( ON ?auto_1540806 ?auto_1540805 ) ( ON ?auto_1540807 ?auto_1540806 ) ( ON ?auto_1540808 ?auto_1540807 ) ( ON ?auto_1540809 ?auto_1540808 ) ( ON ?auto_1540810 ?auto_1540809 ) ( not ( = ?auto_1540801 ?auto_1540802 ) ) ( not ( = ?auto_1540801 ?auto_1540803 ) ) ( not ( = ?auto_1540801 ?auto_1540804 ) ) ( not ( = ?auto_1540801 ?auto_1540805 ) ) ( not ( = ?auto_1540801 ?auto_1540806 ) ) ( not ( = ?auto_1540801 ?auto_1540807 ) ) ( not ( = ?auto_1540801 ?auto_1540808 ) ) ( not ( = ?auto_1540801 ?auto_1540809 ) ) ( not ( = ?auto_1540801 ?auto_1540810 ) ) ( not ( = ?auto_1540801 ?auto_1540811 ) ) ( not ( = ?auto_1540801 ?auto_1540812 ) ) ( not ( = ?auto_1540802 ?auto_1540803 ) ) ( not ( = ?auto_1540802 ?auto_1540804 ) ) ( not ( = ?auto_1540802 ?auto_1540805 ) ) ( not ( = ?auto_1540802 ?auto_1540806 ) ) ( not ( = ?auto_1540802 ?auto_1540807 ) ) ( not ( = ?auto_1540802 ?auto_1540808 ) ) ( not ( = ?auto_1540802 ?auto_1540809 ) ) ( not ( = ?auto_1540802 ?auto_1540810 ) ) ( not ( = ?auto_1540802 ?auto_1540811 ) ) ( not ( = ?auto_1540802 ?auto_1540812 ) ) ( not ( = ?auto_1540803 ?auto_1540804 ) ) ( not ( = ?auto_1540803 ?auto_1540805 ) ) ( not ( = ?auto_1540803 ?auto_1540806 ) ) ( not ( = ?auto_1540803 ?auto_1540807 ) ) ( not ( = ?auto_1540803 ?auto_1540808 ) ) ( not ( = ?auto_1540803 ?auto_1540809 ) ) ( not ( = ?auto_1540803 ?auto_1540810 ) ) ( not ( = ?auto_1540803 ?auto_1540811 ) ) ( not ( = ?auto_1540803 ?auto_1540812 ) ) ( not ( = ?auto_1540804 ?auto_1540805 ) ) ( not ( = ?auto_1540804 ?auto_1540806 ) ) ( not ( = ?auto_1540804 ?auto_1540807 ) ) ( not ( = ?auto_1540804 ?auto_1540808 ) ) ( not ( = ?auto_1540804 ?auto_1540809 ) ) ( not ( = ?auto_1540804 ?auto_1540810 ) ) ( not ( = ?auto_1540804 ?auto_1540811 ) ) ( not ( = ?auto_1540804 ?auto_1540812 ) ) ( not ( = ?auto_1540805 ?auto_1540806 ) ) ( not ( = ?auto_1540805 ?auto_1540807 ) ) ( not ( = ?auto_1540805 ?auto_1540808 ) ) ( not ( = ?auto_1540805 ?auto_1540809 ) ) ( not ( = ?auto_1540805 ?auto_1540810 ) ) ( not ( = ?auto_1540805 ?auto_1540811 ) ) ( not ( = ?auto_1540805 ?auto_1540812 ) ) ( not ( = ?auto_1540806 ?auto_1540807 ) ) ( not ( = ?auto_1540806 ?auto_1540808 ) ) ( not ( = ?auto_1540806 ?auto_1540809 ) ) ( not ( = ?auto_1540806 ?auto_1540810 ) ) ( not ( = ?auto_1540806 ?auto_1540811 ) ) ( not ( = ?auto_1540806 ?auto_1540812 ) ) ( not ( = ?auto_1540807 ?auto_1540808 ) ) ( not ( = ?auto_1540807 ?auto_1540809 ) ) ( not ( = ?auto_1540807 ?auto_1540810 ) ) ( not ( = ?auto_1540807 ?auto_1540811 ) ) ( not ( = ?auto_1540807 ?auto_1540812 ) ) ( not ( = ?auto_1540808 ?auto_1540809 ) ) ( not ( = ?auto_1540808 ?auto_1540810 ) ) ( not ( = ?auto_1540808 ?auto_1540811 ) ) ( not ( = ?auto_1540808 ?auto_1540812 ) ) ( not ( = ?auto_1540809 ?auto_1540810 ) ) ( not ( = ?auto_1540809 ?auto_1540811 ) ) ( not ( = ?auto_1540809 ?auto_1540812 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1540810 ?auto_1540811 ?auto_1540812 )
      ( MAKE-11CRATE-VERIFY ?auto_1540801 ?auto_1540802 ?auto_1540803 ?auto_1540804 ?auto_1540805 ?auto_1540806 ?auto_1540807 ?auto_1540808 ?auto_1540809 ?auto_1540810 ?auto_1540811 ?auto_1540812 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1540922 - SURFACE
      ?auto_1540923 - SURFACE
      ?auto_1540924 - SURFACE
      ?auto_1540925 - SURFACE
      ?auto_1540926 - SURFACE
      ?auto_1540927 - SURFACE
      ?auto_1540928 - SURFACE
      ?auto_1540929 - SURFACE
      ?auto_1540930 - SURFACE
      ?auto_1540931 - SURFACE
      ?auto_1540932 - SURFACE
      ?auto_1540933 - SURFACE
    )
    :vars
    (
      ?auto_1540935 - HOIST
      ?auto_1540936 - PLACE
      ?auto_1540937 - TRUCK
      ?auto_1540934 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1540935 ?auto_1540936 ) ( SURFACE-AT ?auto_1540932 ?auto_1540936 ) ( CLEAR ?auto_1540932 ) ( IS-CRATE ?auto_1540933 ) ( not ( = ?auto_1540932 ?auto_1540933 ) ) ( AVAILABLE ?auto_1540935 ) ( IN ?auto_1540933 ?auto_1540937 ) ( ON ?auto_1540932 ?auto_1540931 ) ( not ( = ?auto_1540931 ?auto_1540932 ) ) ( not ( = ?auto_1540931 ?auto_1540933 ) ) ( TRUCK-AT ?auto_1540937 ?auto_1540934 ) ( not ( = ?auto_1540934 ?auto_1540936 ) ) ( ON ?auto_1540923 ?auto_1540922 ) ( ON ?auto_1540924 ?auto_1540923 ) ( ON ?auto_1540925 ?auto_1540924 ) ( ON ?auto_1540926 ?auto_1540925 ) ( ON ?auto_1540927 ?auto_1540926 ) ( ON ?auto_1540928 ?auto_1540927 ) ( ON ?auto_1540929 ?auto_1540928 ) ( ON ?auto_1540930 ?auto_1540929 ) ( ON ?auto_1540931 ?auto_1540930 ) ( not ( = ?auto_1540922 ?auto_1540923 ) ) ( not ( = ?auto_1540922 ?auto_1540924 ) ) ( not ( = ?auto_1540922 ?auto_1540925 ) ) ( not ( = ?auto_1540922 ?auto_1540926 ) ) ( not ( = ?auto_1540922 ?auto_1540927 ) ) ( not ( = ?auto_1540922 ?auto_1540928 ) ) ( not ( = ?auto_1540922 ?auto_1540929 ) ) ( not ( = ?auto_1540922 ?auto_1540930 ) ) ( not ( = ?auto_1540922 ?auto_1540931 ) ) ( not ( = ?auto_1540922 ?auto_1540932 ) ) ( not ( = ?auto_1540922 ?auto_1540933 ) ) ( not ( = ?auto_1540923 ?auto_1540924 ) ) ( not ( = ?auto_1540923 ?auto_1540925 ) ) ( not ( = ?auto_1540923 ?auto_1540926 ) ) ( not ( = ?auto_1540923 ?auto_1540927 ) ) ( not ( = ?auto_1540923 ?auto_1540928 ) ) ( not ( = ?auto_1540923 ?auto_1540929 ) ) ( not ( = ?auto_1540923 ?auto_1540930 ) ) ( not ( = ?auto_1540923 ?auto_1540931 ) ) ( not ( = ?auto_1540923 ?auto_1540932 ) ) ( not ( = ?auto_1540923 ?auto_1540933 ) ) ( not ( = ?auto_1540924 ?auto_1540925 ) ) ( not ( = ?auto_1540924 ?auto_1540926 ) ) ( not ( = ?auto_1540924 ?auto_1540927 ) ) ( not ( = ?auto_1540924 ?auto_1540928 ) ) ( not ( = ?auto_1540924 ?auto_1540929 ) ) ( not ( = ?auto_1540924 ?auto_1540930 ) ) ( not ( = ?auto_1540924 ?auto_1540931 ) ) ( not ( = ?auto_1540924 ?auto_1540932 ) ) ( not ( = ?auto_1540924 ?auto_1540933 ) ) ( not ( = ?auto_1540925 ?auto_1540926 ) ) ( not ( = ?auto_1540925 ?auto_1540927 ) ) ( not ( = ?auto_1540925 ?auto_1540928 ) ) ( not ( = ?auto_1540925 ?auto_1540929 ) ) ( not ( = ?auto_1540925 ?auto_1540930 ) ) ( not ( = ?auto_1540925 ?auto_1540931 ) ) ( not ( = ?auto_1540925 ?auto_1540932 ) ) ( not ( = ?auto_1540925 ?auto_1540933 ) ) ( not ( = ?auto_1540926 ?auto_1540927 ) ) ( not ( = ?auto_1540926 ?auto_1540928 ) ) ( not ( = ?auto_1540926 ?auto_1540929 ) ) ( not ( = ?auto_1540926 ?auto_1540930 ) ) ( not ( = ?auto_1540926 ?auto_1540931 ) ) ( not ( = ?auto_1540926 ?auto_1540932 ) ) ( not ( = ?auto_1540926 ?auto_1540933 ) ) ( not ( = ?auto_1540927 ?auto_1540928 ) ) ( not ( = ?auto_1540927 ?auto_1540929 ) ) ( not ( = ?auto_1540927 ?auto_1540930 ) ) ( not ( = ?auto_1540927 ?auto_1540931 ) ) ( not ( = ?auto_1540927 ?auto_1540932 ) ) ( not ( = ?auto_1540927 ?auto_1540933 ) ) ( not ( = ?auto_1540928 ?auto_1540929 ) ) ( not ( = ?auto_1540928 ?auto_1540930 ) ) ( not ( = ?auto_1540928 ?auto_1540931 ) ) ( not ( = ?auto_1540928 ?auto_1540932 ) ) ( not ( = ?auto_1540928 ?auto_1540933 ) ) ( not ( = ?auto_1540929 ?auto_1540930 ) ) ( not ( = ?auto_1540929 ?auto_1540931 ) ) ( not ( = ?auto_1540929 ?auto_1540932 ) ) ( not ( = ?auto_1540929 ?auto_1540933 ) ) ( not ( = ?auto_1540930 ?auto_1540931 ) ) ( not ( = ?auto_1540930 ?auto_1540932 ) ) ( not ( = ?auto_1540930 ?auto_1540933 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1540931 ?auto_1540932 ?auto_1540933 )
      ( MAKE-11CRATE-VERIFY ?auto_1540922 ?auto_1540923 ?auto_1540924 ?auto_1540925 ?auto_1540926 ?auto_1540927 ?auto_1540928 ?auto_1540929 ?auto_1540930 ?auto_1540931 ?auto_1540932 ?auto_1540933 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1541054 - SURFACE
      ?auto_1541055 - SURFACE
      ?auto_1541056 - SURFACE
      ?auto_1541057 - SURFACE
      ?auto_1541058 - SURFACE
      ?auto_1541059 - SURFACE
      ?auto_1541060 - SURFACE
      ?auto_1541061 - SURFACE
      ?auto_1541062 - SURFACE
      ?auto_1541063 - SURFACE
      ?auto_1541064 - SURFACE
      ?auto_1541065 - SURFACE
    )
    :vars
    (
      ?auto_1541068 - HOIST
      ?auto_1541070 - PLACE
      ?auto_1541069 - TRUCK
      ?auto_1541066 - PLACE
      ?auto_1541067 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1541068 ?auto_1541070 ) ( SURFACE-AT ?auto_1541064 ?auto_1541070 ) ( CLEAR ?auto_1541064 ) ( IS-CRATE ?auto_1541065 ) ( not ( = ?auto_1541064 ?auto_1541065 ) ) ( AVAILABLE ?auto_1541068 ) ( ON ?auto_1541064 ?auto_1541063 ) ( not ( = ?auto_1541063 ?auto_1541064 ) ) ( not ( = ?auto_1541063 ?auto_1541065 ) ) ( TRUCK-AT ?auto_1541069 ?auto_1541066 ) ( not ( = ?auto_1541066 ?auto_1541070 ) ) ( HOIST-AT ?auto_1541067 ?auto_1541066 ) ( LIFTING ?auto_1541067 ?auto_1541065 ) ( not ( = ?auto_1541068 ?auto_1541067 ) ) ( ON ?auto_1541055 ?auto_1541054 ) ( ON ?auto_1541056 ?auto_1541055 ) ( ON ?auto_1541057 ?auto_1541056 ) ( ON ?auto_1541058 ?auto_1541057 ) ( ON ?auto_1541059 ?auto_1541058 ) ( ON ?auto_1541060 ?auto_1541059 ) ( ON ?auto_1541061 ?auto_1541060 ) ( ON ?auto_1541062 ?auto_1541061 ) ( ON ?auto_1541063 ?auto_1541062 ) ( not ( = ?auto_1541054 ?auto_1541055 ) ) ( not ( = ?auto_1541054 ?auto_1541056 ) ) ( not ( = ?auto_1541054 ?auto_1541057 ) ) ( not ( = ?auto_1541054 ?auto_1541058 ) ) ( not ( = ?auto_1541054 ?auto_1541059 ) ) ( not ( = ?auto_1541054 ?auto_1541060 ) ) ( not ( = ?auto_1541054 ?auto_1541061 ) ) ( not ( = ?auto_1541054 ?auto_1541062 ) ) ( not ( = ?auto_1541054 ?auto_1541063 ) ) ( not ( = ?auto_1541054 ?auto_1541064 ) ) ( not ( = ?auto_1541054 ?auto_1541065 ) ) ( not ( = ?auto_1541055 ?auto_1541056 ) ) ( not ( = ?auto_1541055 ?auto_1541057 ) ) ( not ( = ?auto_1541055 ?auto_1541058 ) ) ( not ( = ?auto_1541055 ?auto_1541059 ) ) ( not ( = ?auto_1541055 ?auto_1541060 ) ) ( not ( = ?auto_1541055 ?auto_1541061 ) ) ( not ( = ?auto_1541055 ?auto_1541062 ) ) ( not ( = ?auto_1541055 ?auto_1541063 ) ) ( not ( = ?auto_1541055 ?auto_1541064 ) ) ( not ( = ?auto_1541055 ?auto_1541065 ) ) ( not ( = ?auto_1541056 ?auto_1541057 ) ) ( not ( = ?auto_1541056 ?auto_1541058 ) ) ( not ( = ?auto_1541056 ?auto_1541059 ) ) ( not ( = ?auto_1541056 ?auto_1541060 ) ) ( not ( = ?auto_1541056 ?auto_1541061 ) ) ( not ( = ?auto_1541056 ?auto_1541062 ) ) ( not ( = ?auto_1541056 ?auto_1541063 ) ) ( not ( = ?auto_1541056 ?auto_1541064 ) ) ( not ( = ?auto_1541056 ?auto_1541065 ) ) ( not ( = ?auto_1541057 ?auto_1541058 ) ) ( not ( = ?auto_1541057 ?auto_1541059 ) ) ( not ( = ?auto_1541057 ?auto_1541060 ) ) ( not ( = ?auto_1541057 ?auto_1541061 ) ) ( not ( = ?auto_1541057 ?auto_1541062 ) ) ( not ( = ?auto_1541057 ?auto_1541063 ) ) ( not ( = ?auto_1541057 ?auto_1541064 ) ) ( not ( = ?auto_1541057 ?auto_1541065 ) ) ( not ( = ?auto_1541058 ?auto_1541059 ) ) ( not ( = ?auto_1541058 ?auto_1541060 ) ) ( not ( = ?auto_1541058 ?auto_1541061 ) ) ( not ( = ?auto_1541058 ?auto_1541062 ) ) ( not ( = ?auto_1541058 ?auto_1541063 ) ) ( not ( = ?auto_1541058 ?auto_1541064 ) ) ( not ( = ?auto_1541058 ?auto_1541065 ) ) ( not ( = ?auto_1541059 ?auto_1541060 ) ) ( not ( = ?auto_1541059 ?auto_1541061 ) ) ( not ( = ?auto_1541059 ?auto_1541062 ) ) ( not ( = ?auto_1541059 ?auto_1541063 ) ) ( not ( = ?auto_1541059 ?auto_1541064 ) ) ( not ( = ?auto_1541059 ?auto_1541065 ) ) ( not ( = ?auto_1541060 ?auto_1541061 ) ) ( not ( = ?auto_1541060 ?auto_1541062 ) ) ( not ( = ?auto_1541060 ?auto_1541063 ) ) ( not ( = ?auto_1541060 ?auto_1541064 ) ) ( not ( = ?auto_1541060 ?auto_1541065 ) ) ( not ( = ?auto_1541061 ?auto_1541062 ) ) ( not ( = ?auto_1541061 ?auto_1541063 ) ) ( not ( = ?auto_1541061 ?auto_1541064 ) ) ( not ( = ?auto_1541061 ?auto_1541065 ) ) ( not ( = ?auto_1541062 ?auto_1541063 ) ) ( not ( = ?auto_1541062 ?auto_1541064 ) ) ( not ( = ?auto_1541062 ?auto_1541065 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1541063 ?auto_1541064 ?auto_1541065 )
      ( MAKE-11CRATE-VERIFY ?auto_1541054 ?auto_1541055 ?auto_1541056 ?auto_1541057 ?auto_1541058 ?auto_1541059 ?auto_1541060 ?auto_1541061 ?auto_1541062 ?auto_1541063 ?auto_1541064 ?auto_1541065 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1541197 - SURFACE
      ?auto_1541198 - SURFACE
      ?auto_1541199 - SURFACE
      ?auto_1541200 - SURFACE
      ?auto_1541201 - SURFACE
      ?auto_1541202 - SURFACE
      ?auto_1541203 - SURFACE
      ?auto_1541204 - SURFACE
      ?auto_1541205 - SURFACE
      ?auto_1541206 - SURFACE
      ?auto_1541207 - SURFACE
      ?auto_1541208 - SURFACE
    )
    :vars
    (
      ?auto_1541209 - HOIST
      ?auto_1541211 - PLACE
      ?auto_1541210 - TRUCK
      ?auto_1541213 - PLACE
      ?auto_1541212 - HOIST
      ?auto_1541214 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1541209 ?auto_1541211 ) ( SURFACE-AT ?auto_1541207 ?auto_1541211 ) ( CLEAR ?auto_1541207 ) ( IS-CRATE ?auto_1541208 ) ( not ( = ?auto_1541207 ?auto_1541208 ) ) ( AVAILABLE ?auto_1541209 ) ( ON ?auto_1541207 ?auto_1541206 ) ( not ( = ?auto_1541206 ?auto_1541207 ) ) ( not ( = ?auto_1541206 ?auto_1541208 ) ) ( TRUCK-AT ?auto_1541210 ?auto_1541213 ) ( not ( = ?auto_1541213 ?auto_1541211 ) ) ( HOIST-AT ?auto_1541212 ?auto_1541213 ) ( not ( = ?auto_1541209 ?auto_1541212 ) ) ( AVAILABLE ?auto_1541212 ) ( SURFACE-AT ?auto_1541208 ?auto_1541213 ) ( ON ?auto_1541208 ?auto_1541214 ) ( CLEAR ?auto_1541208 ) ( not ( = ?auto_1541207 ?auto_1541214 ) ) ( not ( = ?auto_1541208 ?auto_1541214 ) ) ( not ( = ?auto_1541206 ?auto_1541214 ) ) ( ON ?auto_1541198 ?auto_1541197 ) ( ON ?auto_1541199 ?auto_1541198 ) ( ON ?auto_1541200 ?auto_1541199 ) ( ON ?auto_1541201 ?auto_1541200 ) ( ON ?auto_1541202 ?auto_1541201 ) ( ON ?auto_1541203 ?auto_1541202 ) ( ON ?auto_1541204 ?auto_1541203 ) ( ON ?auto_1541205 ?auto_1541204 ) ( ON ?auto_1541206 ?auto_1541205 ) ( not ( = ?auto_1541197 ?auto_1541198 ) ) ( not ( = ?auto_1541197 ?auto_1541199 ) ) ( not ( = ?auto_1541197 ?auto_1541200 ) ) ( not ( = ?auto_1541197 ?auto_1541201 ) ) ( not ( = ?auto_1541197 ?auto_1541202 ) ) ( not ( = ?auto_1541197 ?auto_1541203 ) ) ( not ( = ?auto_1541197 ?auto_1541204 ) ) ( not ( = ?auto_1541197 ?auto_1541205 ) ) ( not ( = ?auto_1541197 ?auto_1541206 ) ) ( not ( = ?auto_1541197 ?auto_1541207 ) ) ( not ( = ?auto_1541197 ?auto_1541208 ) ) ( not ( = ?auto_1541197 ?auto_1541214 ) ) ( not ( = ?auto_1541198 ?auto_1541199 ) ) ( not ( = ?auto_1541198 ?auto_1541200 ) ) ( not ( = ?auto_1541198 ?auto_1541201 ) ) ( not ( = ?auto_1541198 ?auto_1541202 ) ) ( not ( = ?auto_1541198 ?auto_1541203 ) ) ( not ( = ?auto_1541198 ?auto_1541204 ) ) ( not ( = ?auto_1541198 ?auto_1541205 ) ) ( not ( = ?auto_1541198 ?auto_1541206 ) ) ( not ( = ?auto_1541198 ?auto_1541207 ) ) ( not ( = ?auto_1541198 ?auto_1541208 ) ) ( not ( = ?auto_1541198 ?auto_1541214 ) ) ( not ( = ?auto_1541199 ?auto_1541200 ) ) ( not ( = ?auto_1541199 ?auto_1541201 ) ) ( not ( = ?auto_1541199 ?auto_1541202 ) ) ( not ( = ?auto_1541199 ?auto_1541203 ) ) ( not ( = ?auto_1541199 ?auto_1541204 ) ) ( not ( = ?auto_1541199 ?auto_1541205 ) ) ( not ( = ?auto_1541199 ?auto_1541206 ) ) ( not ( = ?auto_1541199 ?auto_1541207 ) ) ( not ( = ?auto_1541199 ?auto_1541208 ) ) ( not ( = ?auto_1541199 ?auto_1541214 ) ) ( not ( = ?auto_1541200 ?auto_1541201 ) ) ( not ( = ?auto_1541200 ?auto_1541202 ) ) ( not ( = ?auto_1541200 ?auto_1541203 ) ) ( not ( = ?auto_1541200 ?auto_1541204 ) ) ( not ( = ?auto_1541200 ?auto_1541205 ) ) ( not ( = ?auto_1541200 ?auto_1541206 ) ) ( not ( = ?auto_1541200 ?auto_1541207 ) ) ( not ( = ?auto_1541200 ?auto_1541208 ) ) ( not ( = ?auto_1541200 ?auto_1541214 ) ) ( not ( = ?auto_1541201 ?auto_1541202 ) ) ( not ( = ?auto_1541201 ?auto_1541203 ) ) ( not ( = ?auto_1541201 ?auto_1541204 ) ) ( not ( = ?auto_1541201 ?auto_1541205 ) ) ( not ( = ?auto_1541201 ?auto_1541206 ) ) ( not ( = ?auto_1541201 ?auto_1541207 ) ) ( not ( = ?auto_1541201 ?auto_1541208 ) ) ( not ( = ?auto_1541201 ?auto_1541214 ) ) ( not ( = ?auto_1541202 ?auto_1541203 ) ) ( not ( = ?auto_1541202 ?auto_1541204 ) ) ( not ( = ?auto_1541202 ?auto_1541205 ) ) ( not ( = ?auto_1541202 ?auto_1541206 ) ) ( not ( = ?auto_1541202 ?auto_1541207 ) ) ( not ( = ?auto_1541202 ?auto_1541208 ) ) ( not ( = ?auto_1541202 ?auto_1541214 ) ) ( not ( = ?auto_1541203 ?auto_1541204 ) ) ( not ( = ?auto_1541203 ?auto_1541205 ) ) ( not ( = ?auto_1541203 ?auto_1541206 ) ) ( not ( = ?auto_1541203 ?auto_1541207 ) ) ( not ( = ?auto_1541203 ?auto_1541208 ) ) ( not ( = ?auto_1541203 ?auto_1541214 ) ) ( not ( = ?auto_1541204 ?auto_1541205 ) ) ( not ( = ?auto_1541204 ?auto_1541206 ) ) ( not ( = ?auto_1541204 ?auto_1541207 ) ) ( not ( = ?auto_1541204 ?auto_1541208 ) ) ( not ( = ?auto_1541204 ?auto_1541214 ) ) ( not ( = ?auto_1541205 ?auto_1541206 ) ) ( not ( = ?auto_1541205 ?auto_1541207 ) ) ( not ( = ?auto_1541205 ?auto_1541208 ) ) ( not ( = ?auto_1541205 ?auto_1541214 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1541206 ?auto_1541207 ?auto_1541208 )
      ( MAKE-11CRATE-VERIFY ?auto_1541197 ?auto_1541198 ?auto_1541199 ?auto_1541200 ?auto_1541201 ?auto_1541202 ?auto_1541203 ?auto_1541204 ?auto_1541205 ?auto_1541206 ?auto_1541207 ?auto_1541208 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1541341 - SURFACE
      ?auto_1541342 - SURFACE
      ?auto_1541343 - SURFACE
      ?auto_1541344 - SURFACE
      ?auto_1541345 - SURFACE
      ?auto_1541346 - SURFACE
      ?auto_1541347 - SURFACE
      ?auto_1541348 - SURFACE
      ?auto_1541349 - SURFACE
      ?auto_1541350 - SURFACE
      ?auto_1541351 - SURFACE
      ?auto_1541352 - SURFACE
    )
    :vars
    (
      ?auto_1541353 - HOIST
      ?auto_1541358 - PLACE
      ?auto_1541355 - PLACE
      ?auto_1541354 - HOIST
      ?auto_1541357 - SURFACE
      ?auto_1541356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1541353 ?auto_1541358 ) ( SURFACE-AT ?auto_1541351 ?auto_1541358 ) ( CLEAR ?auto_1541351 ) ( IS-CRATE ?auto_1541352 ) ( not ( = ?auto_1541351 ?auto_1541352 ) ) ( AVAILABLE ?auto_1541353 ) ( ON ?auto_1541351 ?auto_1541350 ) ( not ( = ?auto_1541350 ?auto_1541351 ) ) ( not ( = ?auto_1541350 ?auto_1541352 ) ) ( not ( = ?auto_1541355 ?auto_1541358 ) ) ( HOIST-AT ?auto_1541354 ?auto_1541355 ) ( not ( = ?auto_1541353 ?auto_1541354 ) ) ( AVAILABLE ?auto_1541354 ) ( SURFACE-AT ?auto_1541352 ?auto_1541355 ) ( ON ?auto_1541352 ?auto_1541357 ) ( CLEAR ?auto_1541352 ) ( not ( = ?auto_1541351 ?auto_1541357 ) ) ( not ( = ?auto_1541352 ?auto_1541357 ) ) ( not ( = ?auto_1541350 ?auto_1541357 ) ) ( TRUCK-AT ?auto_1541356 ?auto_1541358 ) ( ON ?auto_1541342 ?auto_1541341 ) ( ON ?auto_1541343 ?auto_1541342 ) ( ON ?auto_1541344 ?auto_1541343 ) ( ON ?auto_1541345 ?auto_1541344 ) ( ON ?auto_1541346 ?auto_1541345 ) ( ON ?auto_1541347 ?auto_1541346 ) ( ON ?auto_1541348 ?auto_1541347 ) ( ON ?auto_1541349 ?auto_1541348 ) ( ON ?auto_1541350 ?auto_1541349 ) ( not ( = ?auto_1541341 ?auto_1541342 ) ) ( not ( = ?auto_1541341 ?auto_1541343 ) ) ( not ( = ?auto_1541341 ?auto_1541344 ) ) ( not ( = ?auto_1541341 ?auto_1541345 ) ) ( not ( = ?auto_1541341 ?auto_1541346 ) ) ( not ( = ?auto_1541341 ?auto_1541347 ) ) ( not ( = ?auto_1541341 ?auto_1541348 ) ) ( not ( = ?auto_1541341 ?auto_1541349 ) ) ( not ( = ?auto_1541341 ?auto_1541350 ) ) ( not ( = ?auto_1541341 ?auto_1541351 ) ) ( not ( = ?auto_1541341 ?auto_1541352 ) ) ( not ( = ?auto_1541341 ?auto_1541357 ) ) ( not ( = ?auto_1541342 ?auto_1541343 ) ) ( not ( = ?auto_1541342 ?auto_1541344 ) ) ( not ( = ?auto_1541342 ?auto_1541345 ) ) ( not ( = ?auto_1541342 ?auto_1541346 ) ) ( not ( = ?auto_1541342 ?auto_1541347 ) ) ( not ( = ?auto_1541342 ?auto_1541348 ) ) ( not ( = ?auto_1541342 ?auto_1541349 ) ) ( not ( = ?auto_1541342 ?auto_1541350 ) ) ( not ( = ?auto_1541342 ?auto_1541351 ) ) ( not ( = ?auto_1541342 ?auto_1541352 ) ) ( not ( = ?auto_1541342 ?auto_1541357 ) ) ( not ( = ?auto_1541343 ?auto_1541344 ) ) ( not ( = ?auto_1541343 ?auto_1541345 ) ) ( not ( = ?auto_1541343 ?auto_1541346 ) ) ( not ( = ?auto_1541343 ?auto_1541347 ) ) ( not ( = ?auto_1541343 ?auto_1541348 ) ) ( not ( = ?auto_1541343 ?auto_1541349 ) ) ( not ( = ?auto_1541343 ?auto_1541350 ) ) ( not ( = ?auto_1541343 ?auto_1541351 ) ) ( not ( = ?auto_1541343 ?auto_1541352 ) ) ( not ( = ?auto_1541343 ?auto_1541357 ) ) ( not ( = ?auto_1541344 ?auto_1541345 ) ) ( not ( = ?auto_1541344 ?auto_1541346 ) ) ( not ( = ?auto_1541344 ?auto_1541347 ) ) ( not ( = ?auto_1541344 ?auto_1541348 ) ) ( not ( = ?auto_1541344 ?auto_1541349 ) ) ( not ( = ?auto_1541344 ?auto_1541350 ) ) ( not ( = ?auto_1541344 ?auto_1541351 ) ) ( not ( = ?auto_1541344 ?auto_1541352 ) ) ( not ( = ?auto_1541344 ?auto_1541357 ) ) ( not ( = ?auto_1541345 ?auto_1541346 ) ) ( not ( = ?auto_1541345 ?auto_1541347 ) ) ( not ( = ?auto_1541345 ?auto_1541348 ) ) ( not ( = ?auto_1541345 ?auto_1541349 ) ) ( not ( = ?auto_1541345 ?auto_1541350 ) ) ( not ( = ?auto_1541345 ?auto_1541351 ) ) ( not ( = ?auto_1541345 ?auto_1541352 ) ) ( not ( = ?auto_1541345 ?auto_1541357 ) ) ( not ( = ?auto_1541346 ?auto_1541347 ) ) ( not ( = ?auto_1541346 ?auto_1541348 ) ) ( not ( = ?auto_1541346 ?auto_1541349 ) ) ( not ( = ?auto_1541346 ?auto_1541350 ) ) ( not ( = ?auto_1541346 ?auto_1541351 ) ) ( not ( = ?auto_1541346 ?auto_1541352 ) ) ( not ( = ?auto_1541346 ?auto_1541357 ) ) ( not ( = ?auto_1541347 ?auto_1541348 ) ) ( not ( = ?auto_1541347 ?auto_1541349 ) ) ( not ( = ?auto_1541347 ?auto_1541350 ) ) ( not ( = ?auto_1541347 ?auto_1541351 ) ) ( not ( = ?auto_1541347 ?auto_1541352 ) ) ( not ( = ?auto_1541347 ?auto_1541357 ) ) ( not ( = ?auto_1541348 ?auto_1541349 ) ) ( not ( = ?auto_1541348 ?auto_1541350 ) ) ( not ( = ?auto_1541348 ?auto_1541351 ) ) ( not ( = ?auto_1541348 ?auto_1541352 ) ) ( not ( = ?auto_1541348 ?auto_1541357 ) ) ( not ( = ?auto_1541349 ?auto_1541350 ) ) ( not ( = ?auto_1541349 ?auto_1541351 ) ) ( not ( = ?auto_1541349 ?auto_1541352 ) ) ( not ( = ?auto_1541349 ?auto_1541357 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1541350 ?auto_1541351 ?auto_1541352 )
      ( MAKE-11CRATE-VERIFY ?auto_1541341 ?auto_1541342 ?auto_1541343 ?auto_1541344 ?auto_1541345 ?auto_1541346 ?auto_1541347 ?auto_1541348 ?auto_1541349 ?auto_1541350 ?auto_1541351 ?auto_1541352 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1541485 - SURFACE
      ?auto_1541486 - SURFACE
      ?auto_1541487 - SURFACE
      ?auto_1541488 - SURFACE
      ?auto_1541489 - SURFACE
      ?auto_1541490 - SURFACE
      ?auto_1541491 - SURFACE
      ?auto_1541492 - SURFACE
      ?auto_1541493 - SURFACE
      ?auto_1541494 - SURFACE
      ?auto_1541495 - SURFACE
      ?auto_1541496 - SURFACE
    )
    :vars
    (
      ?auto_1541502 - HOIST
      ?auto_1541500 - PLACE
      ?auto_1541501 - PLACE
      ?auto_1541498 - HOIST
      ?auto_1541499 - SURFACE
      ?auto_1541497 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1541502 ?auto_1541500 ) ( IS-CRATE ?auto_1541496 ) ( not ( = ?auto_1541495 ?auto_1541496 ) ) ( not ( = ?auto_1541494 ?auto_1541495 ) ) ( not ( = ?auto_1541494 ?auto_1541496 ) ) ( not ( = ?auto_1541501 ?auto_1541500 ) ) ( HOIST-AT ?auto_1541498 ?auto_1541501 ) ( not ( = ?auto_1541502 ?auto_1541498 ) ) ( AVAILABLE ?auto_1541498 ) ( SURFACE-AT ?auto_1541496 ?auto_1541501 ) ( ON ?auto_1541496 ?auto_1541499 ) ( CLEAR ?auto_1541496 ) ( not ( = ?auto_1541495 ?auto_1541499 ) ) ( not ( = ?auto_1541496 ?auto_1541499 ) ) ( not ( = ?auto_1541494 ?auto_1541499 ) ) ( TRUCK-AT ?auto_1541497 ?auto_1541500 ) ( SURFACE-AT ?auto_1541494 ?auto_1541500 ) ( CLEAR ?auto_1541494 ) ( LIFTING ?auto_1541502 ?auto_1541495 ) ( IS-CRATE ?auto_1541495 ) ( ON ?auto_1541486 ?auto_1541485 ) ( ON ?auto_1541487 ?auto_1541486 ) ( ON ?auto_1541488 ?auto_1541487 ) ( ON ?auto_1541489 ?auto_1541488 ) ( ON ?auto_1541490 ?auto_1541489 ) ( ON ?auto_1541491 ?auto_1541490 ) ( ON ?auto_1541492 ?auto_1541491 ) ( ON ?auto_1541493 ?auto_1541492 ) ( ON ?auto_1541494 ?auto_1541493 ) ( not ( = ?auto_1541485 ?auto_1541486 ) ) ( not ( = ?auto_1541485 ?auto_1541487 ) ) ( not ( = ?auto_1541485 ?auto_1541488 ) ) ( not ( = ?auto_1541485 ?auto_1541489 ) ) ( not ( = ?auto_1541485 ?auto_1541490 ) ) ( not ( = ?auto_1541485 ?auto_1541491 ) ) ( not ( = ?auto_1541485 ?auto_1541492 ) ) ( not ( = ?auto_1541485 ?auto_1541493 ) ) ( not ( = ?auto_1541485 ?auto_1541494 ) ) ( not ( = ?auto_1541485 ?auto_1541495 ) ) ( not ( = ?auto_1541485 ?auto_1541496 ) ) ( not ( = ?auto_1541485 ?auto_1541499 ) ) ( not ( = ?auto_1541486 ?auto_1541487 ) ) ( not ( = ?auto_1541486 ?auto_1541488 ) ) ( not ( = ?auto_1541486 ?auto_1541489 ) ) ( not ( = ?auto_1541486 ?auto_1541490 ) ) ( not ( = ?auto_1541486 ?auto_1541491 ) ) ( not ( = ?auto_1541486 ?auto_1541492 ) ) ( not ( = ?auto_1541486 ?auto_1541493 ) ) ( not ( = ?auto_1541486 ?auto_1541494 ) ) ( not ( = ?auto_1541486 ?auto_1541495 ) ) ( not ( = ?auto_1541486 ?auto_1541496 ) ) ( not ( = ?auto_1541486 ?auto_1541499 ) ) ( not ( = ?auto_1541487 ?auto_1541488 ) ) ( not ( = ?auto_1541487 ?auto_1541489 ) ) ( not ( = ?auto_1541487 ?auto_1541490 ) ) ( not ( = ?auto_1541487 ?auto_1541491 ) ) ( not ( = ?auto_1541487 ?auto_1541492 ) ) ( not ( = ?auto_1541487 ?auto_1541493 ) ) ( not ( = ?auto_1541487 ?auto_1541494 ) ) ( not ( = ?auto_1541487 ?auto_1541495 ) ) ( not ( = ?auto_1541487 ?auto_1541496 ) ) ( not ( = ?auto_1541487 ?auto_1541499 ) ) ( not ( = ?auto_1541488 ?auto_1541489 ) ) ( not ( = ?auto_1541488 ?auto_1541490 ) ) ( not ( = ?auto_1541488 ?auto_1541491 ) ) ( not ( = ?auto_1541488 ?auto_1541492 ) ) ( not ( = ?auto_1541488 ?auto_1541493 ) ) ( not ( = ?auto_1541488 ?auto_1541494 ) ) ( not ( = ?auto_1541488 ?auto_1541495 ) ) ( not ( = ?auto_1541488 ?auto_1541496 ) ) ( not ( = ?auto_1541488 ?auto_1541499 ) ) ( not ( = ?auto_1541489 ?auto_1541490 ) ) ( not ( = ?auto_1541489 ?auto_1541491 ) ) ( not ( = ?auto_1541489 ?auto_1541492 ) ) ( not ( = ?auto_1541489 ?auto_1541493 ) ) ( not ( = ?auto_1541489 ?auto_1541494 ) ) ( not ( = ?auto_1541489 ?auto_1541495 ) ) ( not ( = ?auto_1541489 ?auto_1541496 ) ) ( not ( = ?auto_1541489 ?auto_1541499 ) ) ( not ( = ?auto_1541490 ?auto_1541491 ) ) ( not ( = ?auto_1541490 ?auto_1541492 ) ) ( not ( = ?auto_1541490 ?auto_1541493 ) ) ( not ( = ?auto_1541490 ?auto_1541494 ) ) ( not ( = ?auto_1541490 ?auto_1541495 ) ) ( not ( = ?auto_1541490 ?auto_1541496 ) ) ( not ( = ?auto_1541490 ?auto_1541499 ) ) ( not ( = ?auto_1541491 ?auto_1541492 ) ) ( not ( = ?auto_1541491 ?auto_1541493 ) ) ( not ( = ?auto_1541491 ?auto_1541494 ) ) ( not ( = ?auto_1541491 ?auto_1541495 ) ) ( not ( = ?auto_1541491 ?auto_1541496 ) ) ( not ( = ?auto_1541491 ?auto_1541499 ) ) ( not ( = ?auto_1541492 ?auto_1541493 ) ) ( not ( = ?auto_1541492 ?auto_1541494 ) ) ( not ( = ?auto_1541492 ?auto_1541495 ) ) ( not ( = ?auto_1541492 ?auto_1541496 ) ) ( not ( = ?auto_1541492 ?auto_1541499 ) ) ( not ( = ?auto_1541493 ?auto_1541494 ) ) ( not ( = ?auto_1541493 ?auto_1541495 ) ) ( not ( = ?auto_1541493 ?auto_1541496 ) ) ( not ( = ?auto_1541493 ?auto_1541499 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1541494 ?auto_1541495 ?auto_1541496 )
      ( MAKE-11CRATE-VERIFY ?auto_1541485 ?auto_1541486 ?auto_1541487 ?auto_1541488 ?auto_1541489 ?auto_1541490 ?auto_1541491 ?auto_1541492 ?auto_1541493 ?auto_1541494 ?auto_1541495 ?auto_1541496 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1541629 - SURFACE
      ?auto_1541630 - SURFACE
      ?auto_1541631 - SURFACE
      ?auto_1541632 - SURFACE
      ?auto_1541633 - SURFACE
      ?auto_1541634 - SURFACE
      ?auto_1541635 - SURFACE
      ?auto_1541636 - SURFACE
      ?auto_1541637 - SURFACE
      ?auto_1541638 - SURFACE
      ?auto_1541639 - SURFACE
      ?auto_1541640 - SURFACE
    )
    :vars
    (
      ?auto_1541642 - HOIST
      ?auto_1541644 - PLACE
      ?auto_1541646 - PLACE
      ?auto_1541643 - HOIST
      ?auto_1541645 - SURFACE
      ?auto_1541641 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1541642 ?auto_1541644 ) ( IS-CRATE ?auto_1541640 ) ( not ( = ?auto_1541639 ?auto_1541640 ) ) ( not ( = ?auto_1541638 ?auto_1541639 ) ) ( not ( = ?auto_1541638 ?auto_1541640 ) ) ( not ( = ?auto_1541646 ?auto_1541644 ) ) ( HOIST-AT ?auto_1541643 ?auto_1541646 ) ( not ( = ?auto_1541642 ?auto_1541643 ) ) ( AVAILABLE ?auto_1541643 ) ( SURFACE-AT ?auto_1541640 ?auto_1541646 ) ( ON ?auto_1541640 ?auto_1541645 ) ( CLEAR ?auto_1541640 ) ( not ( = ?auto_1541639 ?auto_1541645 ) ) ( not ( = ?auto_1541640 ?auto_1541645 ) ) ( not ( = ?auto_1541638 ?auto_1541645 ) ) ( TRUCK-AT ?auto_1541641 ?auto_1541644 ) ( SURFACE-AT ?auto_1541638 ?auto_1541644 ) ( CLEAR ?auto_1541638 ) ( IS-CRATE ?auto_1541639 ) ( AVAILABLE ?auto_1541642 ) ( IN ?auto_1541639 ?auto_1541641 ) ( ON ?auto_1541630 ?auto_1541629 ) ( ON ?auto_1541631 ?auto_1541630 ) ( ON ?auto_1541632 ?auto_1541631 ) ( ON ?auto_1541633 ?auto_1541632 ) ( ON ?auto_1541634 ?auto_1541633 ) ( ON ?auto_1541635 ?auto_1541634 ) ( ON ?auto_1541636 ?auto_1541635 ) ( ON ?auto_1541637 ?auto_1541636 ) ( ON ?auto_1541638 ?auto_1541637 ) ( not ( = ?auto_1541629 ?auto_1541630 ) ) ( not ( = ?auto_1541629 ?auto_1541631 ) ) ( not ( = ?auto_1541629 ?auto_1541632 ) ) ( not ( = ?auto_1541629 ?auto_1541633 ) ) ( not ( = ?auto_1541629 ?auto_1541634 ) ) ( not ( = ?auto_1541629 ?auto_1541635 ) ) ( not ( = ?auto_1541629 ?auto_1541636 ) ) ( not ( = ?auto_1541629 ?auto_1541637 ) ) ( not ( = ?auto_1541629 ?auto_1541638 ) ) ( not ( = ?auto_1541629 ?auto_1541639 ) ) ( not ( = ?auto_1541629 ?auto_1541640 ) ) ( not ( = ?auto_1541629 ?auto_1541645 ) ) ( not ( = ?auto_1541630 ?auto_1541631 ) ) ( not ( = ?auto_1541630 ?auto_1541632 ) ) ( not ( = ?auto_1541630 ?auto_1541633 ) ) ( not ( = ?auto_1541630 ?auto_1541634 ) ) ( not ( = ?auto_1541630 ?auto_1541635 ) ) ( not ( = ?auto_1541630 ?auto_1541636 ) ) ( not ( = ?auto_1541630 ?auto_1541637 ) ) ( not ( = ?auto_1541630 ?auto_1541638 ) ) ( not ( = ?auto_1541630 ?auto_1541639 ) ) ( not ( = ?auto_1541630 ?auto_1541640 ) ) ( not ( = ?auto_1541630 ?auto_1541645 ) ) ( not ( = ?auto_1541631 ?auto_1541632 ) ) ( not ( = ?auto_1541631 ?auto_1541633 ) ) ( not ( = ?auto_1541631 ?auto_1541634 ) ) ( not ( = ?auto_1541631 ?auto_1541635 ) ) ( not ( = ?auto_1541631 ?auto_1541636 ) ) ( not ( = ?auto_1541631 ?auto_1541637 ) ) ( not ( = ?auto_1541631 ?auto_1541638 ) ) ( not ( = ?auto_1541631 ?auto_1541639 ) ) ( not ( = ?auto_1541631 ?auto_1541640 ) ) ( not ( = ?auto_1541631 ?auto_1541645 ) ) ( not ( = ?auto_1541632 ?auto_1541633 ) ) ( not ( = ?auto_1541632 ?auto_1541634 ) ) ( not ( = ?auto_1541632 ?auto_1541635 ) ) ( not ( = ?auto_1541632 ?auto_1541636 ) ) ( not ( = ?auto_1541632 ?auto_1541637 ) ) ( not ( = ?auto_1541632 ?auto_1541638 ) ) ( not ( = ?auto_1541632 ?auto_1541639 ) ) ( not ( = ?auto_1541632 ?auto_1541640 ) ) ( not ( = ?auto_1541632 ?auto_1541645 ) ) ( not ( = ?auto_1541633 ?auto_1541634 ) ) ( not ( = ?auto_1541633 ?auto_1541635 ) ) ( not ( = ?auto_1541633 ?auto_1541636 ) ) ( not ( = ?auto_1541633 ?auto_1541637 ) ) ( not ( = ?auto_1541633 ?auto_1541638 ) ) ( not ( = ?auto_1541633 ?auto_1541639 ) ) ( not ( = ?auto_1541633 ?auto_1541640 ) ) ( not ( = ?auto_1541633 ?auto_1541645 ) ) ( not ( = ?auto_1541634 ?auto_1541635 ) ) ( not ( = ?auto_1541634 ?auto_1541636 ) ) ( not ( = ?auto_1541634 ?auto_1541637 ) ) ( not ( = ?auto_1541634 ?auto_1541638 ) ) ( not ( = ?auto_1541634 ?auto_1541639 ) ) ( not ( = ?auto_1541634 ?auto_1541640 ) ) ( not ( = ?auto_1541634 ?auto_1541645 ) ) ( not ( = ?auto_1541635 ?auto_1541636 ) ) ( not ( = ?auto_1541635 ?auto_1541637 ) ) ( not ( = ?auto_1541635 ?auto_1541638 ) ) ( not ( = ?auto_1541635 ?auto_1541639 ) ) ( not ( = ?auto_1541635 ?auto_1541640 ) ) ( not ( = ?auto_1541635 ?auto_1541645 ) ) ( not ( = ?auto_1541636 ?auto_1541637 ) ) ( not ( = ?auto_1541636 ?auto_1541638 ) ) ( not ( = ?auto_1541636 ?auto_1541639 ) ) ( not ( = ?auto_1541636 ?auto_1541640 ) ) ( not ( = ?auto_1541636 ?auto_1541645 ) ) ( not ( = ?auto_1541637 ?auto_1541638 ) ) ( not ( = ?auto_1541637 ?auto_1541639 ) ) ( not ( = ?auto_1541637 ?auto_1541640 ) ) ( not ( = ?auto_1541637 ?auto_1541645 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1541638 ?auto_1541639 ?auto_1541640 )
      ( MAKE-11CRATE-VERIFY ?auto_1541629 ?auto_1541630 ?auto_1541631 ?auto_1541632 ?auto_1541633 ?auto_1541634 ?auto_1541635 ?auto_1541636 ?auto_1541637 ?auto_1541638 ?auto_1541639 ?auto_1541640 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1550875 - SURFACE
      ?auto_1550876 - SURFACE
      ?auto_1550877 - SURFACE
      ?auto_1550878 - SURFACE
      ?auto_1550879 - SURFACE
      ?auto_1550880 - SURFACE
      ?auto_1550881 - SURFACE
      ?auto_1550882 - SURFACE
      ?auto_1550883 - SURFACE
      ?auto_1550884 - SURFACE
      ?auto_1550885 - SURFACE
      ?auto_1550886 - SURFACE
      ?auto_1550887 - SURFACE
    )
    :vars
    (
      ?auto_1550888 - HOIST
      ?auto_1550889 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1550888 ?auto_1550889 ) ( SURFACE-AT ?auto_1550886 ?auto_1550889 ) ( CLEAR ?auto_1550886 ) ( LIFTING ?auto_1550888 ?auto_1550887 ) ( IS-CRATE ?auto_1550887 ) ( not ( = ?auto_1550886 ?auto_1550887 ) ) ( ON ?auto_1550876 ?auto_1550875 ) ( ON ?auto_1550877 ?auto_1550876 ) ( ON ?auto_1550878 ?auto_1550877 ) ( ON ?auto_1550879 ?auto_1550878 ) ( ON ?auto_1550880 ?auto_1550879 ) ( ON ?auto_1550881 ?auto_1550880 ) ( ON ?auto_1550882 ?auto_1550881 ) ( ON ?auto_1550883 ?auto_1550882 ) ( ON ?auto_1550884 ?auto_1550883 ) ( ON ?auto_1550885 ?auto_1550884 ) ( ON ?auto_1550886 ?auto_1550885 ) ( not ( = ?auto_1550875 ?auto_1550876 ) ) ( not ( = ?auto_1550875 ?auto_1550877 ) ) ( not ( = ?auto_1550875 ?auto_1550878 ) ) ( not ( = ?auto_1550875 ?auto_1550879 ) ) ( not ( = ?auto_1550875 ?auto_1550880 ) ) ( not ( = ?auto_1550875 ?auto_1550881 ) ) ( not ( = ?auto_1550875 ?auto_1550882 ) ) ( not ( = ?auto_1550875 ?auto_1550883 ) ) ( not ( = ?auto_1550875 ?auto_1550884 ) ) ( not ( = ?auto_1550875 ?auto_1550885 ) ) ( not ( = ?auto_1550875 ?auto_1550886 ) ) ( not ( = ?auto_1550875 ?auto_1550887 ) ) ( not ( = ?auto_1550876 ?auto_1550877 ) ) ( not ( = ?auto_1550876 ?auto_1550878 ) ) ( not ( = ?auto_1550876 ?auto_1550879 ) ) ( not ( = ?auto_1550876 ?auto_1550880 ) ) ( not ( = ?auto_1550876 ?auto_1550881 ) ) ( not ( = ?auto_1550876 ?auto_1550882 ) ) ( not ( = ?auto_1550876 ?auto_1550883 ) ) ( not ( = ?auto_1550876 ?auto_1550884 ) ) ( not ( = ?auto_1550876 ?auto_1550885 ) ) ( not ( = ?auto_1550876 ?auto_1550886 ) ) ( not ( = ?auto_1550876 ?auto_1550887 ) ) ( not ( = ?auto_1550877 ?auto_1550878 ) ) ( not ( = ?auto_1550877 ?auto_1550879 ) ) ( not ( = ?auto_1550877 ?auto_1550880 ) ) ( not ( = ?auto_1550877 ?auto_1550881 ) ) ( not ( = ?auto_1550877 ?auto_1550882 ) ) ( not ( = ?auto_1550877 ?auto_1550883 ) ) ( not ( = ?auto_1550877 ?auto_1550884 ) ) ( not ( = ?auto_1550877 ?auto_1550885 ) ) ( not ( = ?auto_1550877 ?auto_1550886 ) ) ( not ( = ?auto_1550877 ?auto_1550887 ) ) ( not ( = ?auto_1550878 ?auto_1550879 ) ) ( not ( = ?auto_1550878 ?auto_1550880 ) ) ( not ( = ?auto_1550878 ?auto_1550881 ) ) ( not ( = ?auto_1550878 ?auto_1550882 ) ) ( not ( = ?auto_1550878 ?auto_1550883 ) ) ( not ( = ?auto_1550878 ?auto_1550884 ) ) ( not ( = ?auto_1550878 ?auto_1550885 ) ) ( not ( = ?auto_1550878 ?auto_1550886 ) ) ( not ( = ?auto_1550878 ?auto_1550887 ) ) ( not ( = ?auto_1550879 ?auto_1550880 ) ) ( not ( = ?auto_1550879 ?auto_1550881 ) ) ( not ( = ?auto_1550879 ?auto_1550882 ) ) ( not ( = ?auto_1550879 ?auto_1550883 ) ) ( not ( = ?auto_1550879 ?auto_1550884 ) ) ( not ( = ?auto_1550879 ?auto_1550885 ) ) ( not ( = ?auto_1550879 ?auto_1550886 ) ) ( not ( = ?auto_1550879 ?auto_1550887 ) ) ( not ( = ?auto_1550880 ?auto_1550881 ) ) ( not ( = ?auto_1550880 ?auto_1550882 ) ) ( not ( = ?auto_1550880 ?auto_1550883 ) ) ( not ( = ?auto_1550880 ?auto_1550884 ) ) ( not ( = ?auto_1550880 ?auto_1550885 ) ) ( not ( = ?auto_1550880 ?auto_1550886 ) ) ( not ( = ?auto_1550880 ?auto_1550887 ) ) ( not ( = ?auto_1550881 ?auto_1550882 ) ) ( not ( = ?auto_1550881 ?auto_1550883 ) ) ( not ( = ?auto_1550881 ?auto_1550884 ) ) ( not ( = ?auto_1550881 ?auto_1550885 ) ) ( not ( = ?auto_1550881 ?auto_1550886 ) ) ( not ( = ?auto_1550881 ?auto_1550887 ) ) ( not ( = ?auto_1550882 ?auto_1550883 ) ) ( not ( = ?auto_1550882 ?auto_1550884 ) ) ( not ( = ?auto_1550882 ?auto_1550885 ) ) ( not ( = ?auto_1550882 ?auto_1550886 ) ) ( not ( = ?auto_1550882 ?auto_1550887 ) ) ( not ( = ?auto_1550883 ?auto_1550884 ) ) ( not ( = ?auto_1550883 ?auto_1550885 ) ) ( not ( = ?auto_1550883 ?auto_1550886 ) ) ( not ( = ?auto_1550883 ?auto_1550887 ) ) ( not ( = ?auto_1550884 ?auto_1550885 ) ) ( not ( = ?auto_1550884 ?auto_1550886 ) ) ( not ( = ?auto_1550884 ?auto_1550887 ) ) ( not ( = ?auto_1550885 ?auto_1550886 ) ) ( not ( = ?auto_1550885 ?auto_1550887 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1550886 ?auto_1550887 )
      ( MAKE-12CRATE-VERIFY ?auto_1550875 ?auto_1550876 ?auto_1550877 ?auto_1550878 ?auto_1550879 ?auto_1550880 ?auto_1550881 ?auto_1550882 ?auto_1550883 ?auto_1550884 ?auto_1550885 ?auto_1550886 ?auto_1550887 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1551000 - SURFACE
      ?auto_1551001 - SURFACE
      ?auto_1551002 - SURFACE
      ?auto_1551003 - SURFACE
      ?auto_1551004 - SURFACE
      ?auto_1551005 - SURFACE
      ?auto_1551006 - SURFACE
      ?auto_1551007 - SURFACE
      ?auto_1551008 - SURFACE
      ?auto_1551009 - SURFACE
      ?auto_1551010 - SURFACE
      ?auto_1551011 - SURFACE
      ?auto_1551012 - SURFACE
    )
    :vars
    (
      ?auto_1551015 - HOIST
      ?auto_1551013 - PLACE
      ?auto_1551014 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1551015 ?auto_1551013 ) ( SURFACE-AT ?auto_1551011 ?auto_1551013 ) ( CLEAR ?auto_1551011 ) ( IS-CRATE ?auto_1551012 ) ( not ( = ?auto_1551011 ?auto_1551012 ) ) ( TRUCK-AT ?auto_1551014 ?auto_1551013 ) ( AVAILABLE ?auto_1551015 ) ( IN ?auto_1551012 ?auto_1551014 ) ( ON ?auto_1551011 ?auto_1551010 ) ( not ( = ?auto_1551010 ?auto_1551011 ) ) ( not ( = ?auto_1551010 ?auto_1551012 ) ) ( ON ?auto_1551001 ?auto_1551000 ) ( ON ?auto_1551002 ?auto_1551001 ) ( ON ?auto_1551003 ?auto_1551002 ) ( ON ?auto_1551004 ?auto_1551003 ) ( ON ?auto_1551005 ?auto_1551004 ) ( ON ?auto_1551006 ?auto_1551005 ) ( ON ?auto_1551007 ?auto_1551006 ) ( ON ?auto_1551008 ?auto_1551007 ) ( ON ?auto_1551009 ?auto_1551008 ) ( ON ?auto_1551010 ?auto_1551009 ) ( not ( = ?auto_1551000 ?auto_1551001 ) ) ( not ( = ?auto_1551000 ?auto_1551002 ) ) ( not ( = ?auto_1551000 ?auto_1551003 ) ) ( not ( = ?auto_1551000 ?auto_1551004 ) ) ( not ( = ?auto_1551000 ?auto_1551005 ) ) ( not ( = ?auto_1551000 ?auto_1551006 ) ) ( not ( = ?auto_1551000 ?auto_1551007 ) ) ( not ( = ?auto_1551000 ?auto_1551008 ) ) ( not ( = ?auto_1551000 ?auto_1551009 ) ) ( not ( = ?auto_1551000 ?auto_1551010 ) ) ( not ( = ?auto_1551000 ?auto_1551011 ) ) ( not ( = ?auto_1551000 ?auto_1551012 ) ) ( not ( = ?auto_1551001 ?auto_1551002 ) ) ( not ( = ?auto_1551001 ?auto_1551003 ) ) ( not ( = ?auto_1551001 ?auto_1551004 ) ) ( not ( = ?auto_1551001 ?auto_1551005 ) ) ( not ( = ?auto_1551001 ?auto_1551006 ) ) ( not ( = ?auto_1551001 ?auto_1551007 ) ) ( not ( = ?auto_1551001 ?auto_1551008 ) ) ( not ( = ?auto_1551001 ?auto_1551009 ) ) ( not ( = ?auto_1551001 ?auto_1551010 ) ) ( not ( = ?auto_1551001 ?auto_1551011 ) ) ( not ( = ?auto_1551001 ?auto_1551012 ) ) ( not ( = ?auto_1551002 ?auto_1551003 ) ) ( not ( = ?auto_1551002 ?auto_1551004 ) ) ( not ( = ?auto_1551002 ?auto_1551005 ) ) ( not ( = ?auto_1551002 ?auto_1551006 ) ) ( not ( = ?auto_1551002 ?auto_1551007 ) ) ( not ( = ?auto_1551002 ?auto_1551008 ) ) ( not ( = ?auto_1551002 ?auto_1551009 ) ) ( not ( = ?auto_1551002 ?auto_1551010 ) ) ( not ( = ?auto_1551002 ?auto_1551011 ) ) ( not ( = ?auto_1551002 ?auto_1551012 ) ) ( not ( = ?auto_1551003 ?auto_1551004 ) ) ( not ( = ?auto_1551003 ?auto_1551005 ) ) ( not ( = ?auto_1551003 ?auto_1551006 ) ) ( not ( = ?auto_1551003 ?auto_1551007 ) ) ( not ( = ?auto_1551003 ?auto_1551008 ) ) ( not ( = ?auto_1551003 ?auto_1551009 ) ) ( not ( = ?auto_1551003 ?auto_1551010 ) ) ( not ( = ?auto_1551003 ?auto_1551011 ) ) ( not ( = ?auto_1551003 ?auto_1551012 ) ) ( not ( = ?auto_1551004 ?auto_1551005 ) ) ( not ( = ?auto_1551004 ?auto_1551006 ) ) ( not ( = ?auto_1551004 ?auto_1551007 ) ) ( not ( = ?auto_1551004 ?auto_1551008 ) ) ( not ( = ?auto_1551004 ?auto_1551009 ) ) ( not ( = ?auto_1551004 ?auto_1551010 ) ) ( not ( = ?auto_1551004 ?auto_1551011 ) ) ( not ( = ?auto_1551004 ?auto_1551012 ) ) ( not ( = ?auto_1551005 ?auto_1551006 ) ) ( not ( = ?auto_1551005 ?auto_1551007 ) ) ( not ( = ?auto_1551005 ?auto_1551008 ) ) ( not ( = ?auto_1551005 ?auto_1551009 ) ) ( not ( = ?auto_1551005 ?auto_1551010 ) ) ( not ( = ?auto_1551005 ?auto_1551011 ) ) ( not ( = ?auto_1551005 ?auto_1551012 ) ) ( not ( = ?auto_1551006 ?auto_1551007 ) ) ( not ( = ?auto_1551006 ?auto_1551008 ) ) ( not ( = ?auto_1551006 ?auto_1551009 ) ) ( not ( = ?auto_1551006 ?auto_1551010 ) ) ( not ( = ?auto_1551006 ?auto_1551011 ) ) ( not ( = ?auto_1551006 ?auto_1551012 ) ) ( not ( = ?auto_1551007 ?auto_1551008 ) ) ( not ( = ?auto_1551007 ?auto_1551009 ) ) ( not ( = ?auto_1551007 ?auto_1551010 ) ) ( not ( = ?auto_1551007 ?auto_1551011 ) ) ( not ( = ?auto_1551007 ?auto_1551012 ) ) ( not ( = ?auto_1551008 ?auto_1551009 ) ) ( not ( = ?auto_1551008 ?auto_1551010 ) ) ( not ( = ?auto_1551008 ?auto_1551011 ) ) ( not ( = ?auto_1551008 ?auto_1551012 ) ) ( not ( = ?auto_1551009 ?auto_1551010 ) ) ( not ( = ?auto_1551009 ?auto_1551011 ) ) ( not ( = ?auto_1551009 ?auto_1551012 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1551010 ?auto_1551011 ?auto_1551012 )
      ( MAKE-12CRATE-VERIFY ?auto_1551000 ?auto_1551001 ?auto_1551002 ?auto_1551003 ?auto_1551004 ?auto_1551005 ?auto_1551006 ?auto_1551007 ?auto_1551008 ?auto_1551009 ?auto_1551010 ?auto_1551011 ?auto_1551012 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1551138 - SURFACE
      ?auto_1551139 - SURFACE
      ?auto_1551140 - SURFACE
      ?auto_1551141 - SURFACE
      ?auto_1551142 - SURFACE
      ?auto_1551143 - SURFACE
      ?auto_1551144 - SURFACE
      ?auto_1551145 - SURFACE
      ?auto_1551146 - SURFACE
      ?auto_1551147 - SURFACE
      ?auto_1551148 - SURFACE
      ?auto_1551149 - SURFACE
      ?auto_1551150 - SURFACE
    )
    :vars
    (
      ?auto_1551153 - HOIST
      ?auto_1551154 - PLACE
      ?auto_1551151 - TRUCK
      ?auto_1551152 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1551153 ?auto_1551154 ) ( SURFACE-AT ?auto_1551149 ?auto_1551154 ) ( CLEAR ?auto_1551149 ) ( IS-CRATE ?auto_1551150 ) ( not ( = ?auto_1551149 ?auto_1551150 ) ) ( AVAILABLE ?auto_1551153 ) ( IN ?auto_1551150 ?auto_1551151 ) ( ON ?auto_1551149 ?auto_1551148 ) ( not ( = ?auto_1551148 ?auto_1551149 ) ) ( not ( = ?auto_1551148 ?auto_1551150 ) ) ( TRUCK-AT ?auto_1551151 ?auto_1551152 ) ( not ( = ?auto_1551152 ?auto_1551154 ) ) ( ON ?auto_1551139 ?auto_1551138 ) ( ON ?auto_1551140 ?auto_1551139 ) ( ON ?auto_1551141 ?auto_1551140 ) ( ON ?auto_1551142 ?auto_1551141 ) ( ON ?auto_1551143 ?auto_1551142 ) ( ON ?auto_1551144 ?auto_1551143 ) ( ON ?auto_1551145 ?auto_1551144 ) ( ON ?auto_1551146 ?auto_1551145 ) ( ON ?auto_1551147 ?auto_1551146 ) ( ON ?auto_1551148 ?auto_1551147 ) ( not ( = ?auto_1551138 ?auto_1551139 ) ) ( not ( = ?auto_1551138 ?auto_1551140 ) ) ( not ( = ?auto_1551138 ?auto_1551141 ) ) ( not ( = ?auto_1551138 ?auto_1551142 ) ) ( not ( = ?auto_1551138 ?auto_1551143 ) ) ( not ( = ?auto_1551138 ?auto_1551144 ) ) ( not ( = ?auto_1551138 ?auto_1551145 ) ) ( not ( = ?auto_1551138 ?auto_1551146 ) ) ( not ( = ?auto_1551138 ?auto_1551147 ) ) ( not ( = ?auto_1551138 ?auto_1551148 ) ) ( not ( = ?auto_1551138 ?auto_1551149 ) ) ( not ( = ?auto_1551138 ?auto_1551150 ) ) ( not ( = ?auto_1551139 ?auto_1551140 ) ) ( not ( = ?auto_1551139 ?auto_1551141 ) ) ( not ( = ?auto_1551139 ?auto_1551142 ) ) ( not ( = ?auto_1551139 ?auto_1551143 ) ) ( not ( = ?auto_1551139 ?auto_1551144 ) ) ( not ( = ?auto_1551139 ?auto_1551145 ) ) ( not ( = ?auto_1551139 ?auto_1551146 ) ) ( not ( = ?auto_1551139 ?auto_1551147 ) ) ( not ( = ?auto_1551139 ?auto_1551148 ) ) ( not ( = ?auto_1551139 ?auto_1551149 ) ) ( not ( = ?auto_1551139 ?auto_1551150 ) ) ( not ( = ?auto_1551140 ?auto_1551141 ) ) ( not ( = ?auto_1551140 ?auto_1551142 ) ) ( not ( = ?auto_1551140 ?auto_1551143 ) ) ( not ( = ?auto_1551140 ?auto_1551144 ) ) ( not ( = ?auto_1551140 ?auto_1551145 ) ) ( not ( = ?auto_1551140 ?auto_1551146 ) ) ( not ( = ?auto_1551140 ?auto_1551147 ) ) ( not ( = ?auto_1551140 ?auto_1551148 ) ) ( not ( = ?auto_1551140 ?auto_1551149 ) ) ( not ( = ?auto_1551140 ?auto_1551150 ) ) ( not ( = ?auto_1551141 ?auto_1551142 ) ) ( not ( = ?auto_1551141 ?auto_1551143 ) ) ( not ( = ?auto_1551141 ?auto_1551144 ) ) ( not ( = ?auto_1551141 ?auto_1551145 ) ) ( not ( = ?auto_1551141 ?auto_1551146 ) ) ( not ( = ?auto_1551141 ?auto_1551147 ) ) ( not ( = ?auto_1551141 ?auto_1551148 ) ) ( not ( = ?auto_1551141 ?auto_1551149 ) ) ( not ( = ?auto_1551141 ?auto_1551150 ) ) ( not ( = ?auto_1551142 ?auto_1551143 ) ) ( not ( = ?auto_1551142 ?auto_1551144 ) ) ( not ( = ?auto_1551142 ?auto_1551145 ) ) ( not ( = ?auto_1551142 ?auto_1551146 ) ) ( not ( = ?auto_1551142 ?auto_1551147 ) ) ( not ( = ?auto_1551142 ?auto_1551148 ) ) ( not ( = ?auto_1551142 ?auto_1551149 ) ) ( not ( = ?auto_1551142 ?auto_1551150 ) ) ( not ( = ?auto_1551143 ?auto_1551144 ) ) ( not ( = ?auto_1551143 ?auto_1551145 ) ) ( not ( = ?auto_1551143 ?auto_1551146 ) ) ( not ( = ?auto_1551143 ?auto_1551147 ) ) ( not ( = ?auto_1551143 ?auto_1551148 ) ) ( not ( = ?auto_1551143 ?auto_1551149 ) ) ( not ( = ?auto_1551143 ?auto_1551150 ) ) ( not ( = ?auto_1551144 ?auto_1551145 ) ) ( not ( = ?auto_1551144 ?auto_1551146 ) ) ( not ( = ?auto_1551144 ?auto_1551147 ) ) ( not ( = ?auto_1551144 ?auto_1551148 ) ) ( not ( = ?auto_1551144 ?auto_1551149 ) ) ( not ( = ?auto_1551144 ?auto_1551150 ) ) ( not ( = ?auto_1551145 ?auto_1551146 ) ) ( not ( = ?auto_1551145 ?auto_1551147 ) ) ( not ( = ?auto_1551145 ?auto_1551148 ) ) ( not ( = ?auto_1551145 ?auto_1551149 ) ) ( not ( = ?auto_1551145 ?auto_1551150 ) ) ( not ( = ?auto_1551146 ?auto_1551147 ) ) ( not ( = ?auto_1551146 ?auto_1551148 ) ) ( not ( = ?auto_1551146 ?auto_1551149 ) ) ( not ( = ?auto_1551146 ?auto_1551150 ) ) ( not ( = ?auto_1551147 ?auto_1551148 ) ) ( not ( = ?auto_1551147 ?auto_1551149 ) ) ( not ( = ?auto_1551147 ?auto_1551150 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1551148 ?auto_1551149 ?auto_1551150 )
      ( MAKE-12CRATE-VERIFY ?auto_1551138 ?auto_1551139 ?auto_1551140 ?auto_1551141 ?auto_1551142 ?auto_1551143 ?auto_1551144 ?auto_1551145 ?auto_1551146 ?auto_1551147 ?auto_1551148 ?auto_1551149 ?auto_1551150 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1551288 - SURFACE
      ?auto_1551289 - SURFACE
      ?auto_1551290 - SURFACE
      ?auto_1551291 - SURFACE
      ?auto_1551292 - SURFACE
      ?auto_1551293 - SURFACE
      ?auto_1551294 - SURFACE
      ?auto_1551295 - SURFACE
      ?auto_1551296 - SURFACE
      ?auto_1551297 - SURFACE
      ?auto_1551298 - SURFACE
      ?auto_1551299 - SURFACE
      ?auto_1551300 - SURFACE
    )
    :vars
    (
      ?auto_1551302 - HOIST
      ?auto_1551305 - PLACE
      ?auto_1551304 - TRUCK
      ?auto_1551303 - PLACE
      ?auto_1551301 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1551302 ?auto_1551305 ) ( SURFACE-AT ?auto_1551299 ?auto_1551305 ) ( CLEAR ?auto_1551299 ) ( IS-CRATE ?auto_1551300 ) ( not ( = ?auto_1551299 ?auto_1551300 ) ) ( AVAILABLE ?auto_1551302 ) ( ON ?auto_1551299 ?auto_1551298 ) ( not ( = ?auto_1551298 ?auto_1551299 ) ) ( not ( = ?auto_1551298 ?auto_1551300 ) ) ( TRUCK-AT ?auto_1551304 ?auto_1551303 ) ( not ( = ?auto_1551303 ?auto_1551305 ) ) ( HOIST-AT ?auto_1551301 ?auto_1551303 ) ( LIFTING ?auto_1551301 ?auto_1551300 ) ( not ( = ?auto_1551302 ?auto_1551301 ) ) ( ON ?auto_1551289 ?auto_1551288 ) ( ON ?auto_1551290 ?auto_1551289 ) ( ON ?auto_1551291 ?auto_1551290 ) ( ON ?auto_1551292 ?auto_1551291 ) ( ON ?auto_1551293 ?auto_1551292 ) ( ON ?auto_1551294 ?auto_1551293 ) ( ON ?auto_1551295 ?auto_1551294 ) ( ON ?auto_1551296 ?auto_1551295 ) ( ON ?auto_1551297 ?auto_1551296 ) ( ON ?auto_1551298 ?auto_1551297 ) ( not ( = ?auto_1551288 ?auto_1551289 ) ) ( not ( = ?auto_1551288 ?auto_1551290 ) ) ( not ( = ?auto_1551288 ?auto_1551291 ) ) ( not ( = ?auto_1551288 ?auto_1551292 ) ) ( not ( = ?auto_1551288 ?auto_1551293 ) ) ( not ( = ?auto_1551288 ?auto_1551294 ) ) ( not ( = ?auto_1551288 ?auto_1551295 ) ) ( not ( = ?auto_1551288 ?auto_1551296 ) ) ( not ( = ?auto_1551288 ?auto_1551297 ) ) ( not ( = ?auto_1551288 ?auto_1551298 ) ) ( not ( = ?auto_1551288 ?auto_1551299 ) ) ( not ( = ?auto_1551288 ?auto_1551300 ) ) ( not ( = ?auto_1551289 ?auto_1551290 ) ) ( not ( = ?auto_1551289 ?auto_1551291 ) ) ( not ( = ?auto_1551289 ?auto_1551292 ) ) ( not ( = ?auto_1551289 ?auto_1551293 ) ) ( not ( = ?auto_1551289 ?auto_1551294 ) ) ( not ( = ?auto_1551289 ?auto_1551295 ) ) ( not ( = ?auto_1551289 ?auto_1551296 ) ) ( not ( = ?auto_1551289 ?auto_1551297 ) ) ( not ( = ?auto_1551289 ?auto_1551298 ) ) ( not ( = ?auto_1551289 ?auto_1551299 ) ) ( not ( = ?auto_1551289 ?auto_1551300 ) ) ( not ( = ?auto_1551290 ?auto_1551291 ) ) ( not ( = ?auto_1551290 ?auto_1551292 ) ) ( not ( = ?auto_1551290 ?auto_1551293 ) ) ( not ( = ?auto_1551290 ?auto_1551294 ) ) ( not ( = ?auto_1551290 ?auto_1551295 ) ) ( not ( = ?auto_1551290 ?auto_1551296 ) ) ( not ( = ?auto_1551290 ?auto_1551297 ) ) ( not ( = ?auto_1551290 ?auto_1551298 ) ) ( not ( = ?auto_1551290 ?auto_1551299 ) ) ( not ( = ?auto_1551290 ?auto_1551300 ) ) ( not ( = ?auto_1551291 ?auto_1551292 ) ) ( not ( = ?auto_1551291 ?auto_1551293 ) ) ( not ( = ?auto_1551291 ?auto_1551294 ) ) ( not ( = ?auto_1551291 ?auto_1551295 ) ) ( not ( = ?auto_1551291 ?auto_1551296 ) ) ( not ( = ?auto_1551291 ?auto_1551297 ) ) ( not ( = ?auto_1551291 ?auto_1551298 ) ) ( not ( = ?auto_1551291 ?auto_1551299 ) ) ( not ( = ?auto_1551291 ?auto_1551300 ) ) ( not ( = ?auto_1551292 ?auto_1551293 ) ) ( not ( = ?auto_1551292 ?auto_1551294 ) ) ( not ( = ?auto_1551292 ?auto_1551295 ) ) ( not ( = ?auto_1551292 ?auto_1551296 ) ) ( not ( = ?auto_1551292 ?auto_1551297 ) ) ( not ( = ?auto_1551292 ?auto_1551298 ) ) ( not ( = ?auto_1551292 ?auto_1551299 ) ) ( not ( = ?auto_1551292 ?auto_1551300 ) ) ( not ( = ?auto_1551293 ?auto_1551294 ) ) ( not ( = ?auto_1551293 ?auto_1551295 ) ) ( not ( = ?auto_1551293 ?auto_1551296 ) ) ( not ( = ?auto_1551293 ?auto_1551297 ) ) ( not ( = ?auto_1551293 ?auto_1551298 ) ) ( not ( = ?auto_1551293 ?auto_1551299 ) ) ( not ( = ?auto_1551293 ?auto_1551300 ) ) ( not ( = ?auto_1551294 ?auto_1551295 ) ) ( not ( = ?auto_1551294 ?auto_1551296 ) ) ( not ( = ?auto_1551294 ?auto_1551297 ) ) ( not ( = ?auto_1551294 ?auto_1551298 ) ) ( not ( = ?auto_1551294 ?auto_1551299 ) ) ( not ( = ?auto_1551294 ?auto_1551300 ) ) ( not ( = ?auto_1551295 ?auto_1551296 ) ) ( not ( = ?auto_1551295 ?auto_1551297 ) ) ( not ( = ?auto_1551295 ?auto_1551298 ) ) ( not ( = ?auto_1551295 ?auto_1551299 ) ) ( not ( = ?auto_1551295 ?auto_1551300 ) ) ( not ( = ?auto_1551296 ?auto_1551297 ) ) ( not ( = ?auto_1551296 ?auto_1551298 ) ) ( not ( = ?auto_1551296 ?auto_1551299 ) ) ( not ( = ?auto_1551296 ?auto_1551300 ) ) ( not ( = ?auto_1551297 ?auto_1551298 ) ) ( not ( = ?auto_1551297 ?auto_1551299 ) ) ( not ( = ?auto_1551297 ?auto_1551300 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1551298 ?auto_1551299 ?auto_1551300 )
      ( MAKE-12CRATE-VERIFY ?auto_1551288 ?auto_1551289 ?auto_1551290 ?auto_1551291 ?auto_1551292 ?auto_1551293 ?auto_1551294 ?auto_1551295 ?auto_1551296 ?auto_1551297 ?auto_1551298 ?auto_1551299 ?auto_1551300 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1551450 - SURFACE
      ?auto_1551451 - SURFACE
      ?auto_1551452 - SURFACE
      ?auto_1551453 - SURFACE
      ?auto_1551454 - SURFACE
      ?auto_1551455 - SURFACE
      ?auto_1551456 - SURFACE
      ?auto_1551457 - SURFACE
      ?auto_1551458 - SURFACE
      ?auto_1551459 - SURFACE
      ?auto_1551460 - SURFACE
      ?auto_1551461 - SURFACE
      ?auto_1551462 - SURFACE
    )
    :vars
    (
      ?auto_1551463 - HOIST
      ?auto_1551464 - PLACE
      ?auto_1551466 - TRUCK
      ?auto_1551467 - PLACE
      ?auto_1551465 - HOIST
      ?auto_1551468 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1551463 ?auto_1551464 ) ( SURFACE-AT ?auto_1551461 ?auto_1551464 ) ( CLEAR ?auto_1551461 ) ( IS-CRATE ?auto_1551462 ) ( not ( = ?auto_1551461 ?auto_1551462 ) ) ( AVAILABLE ?auto_1551463 ) ( ON ?auto_1551461 ?auto_1551460 ) ( not ( = ?auto_1551460 ?auto_1551461 ) ) ( not ( = ?auto_1551460 ?auto_1551462 ) ) ( TRUCK-AT ?auto_1551466 ?auto_1551467 ) ( not ( = ?auto_1551467 ?auto_1551464 ) ) ( HOIST-AT ?auto_1551465 ?auto_1551467 ) ( not ( = ?auto_1551463 ?auto_1551465 ) ) ( AVAILABLE ?auto_1551465 ) ( SURFACE-AT ?auto_1551462 ?auto_1551467 ) ( ON ?auto_1551462 ?auto_1551468 ) ( CLEAR ?auto_1551462 ) ( not ( = ?auto_1551461 ?auto_1551468 ) ) ( not ( = ?auto_1551462 ?auto_1551468 ) ) ( not ( = ?auto_1551460 ?auto_1551468 ) ) ( ON ?auto_1551451 ?auto_1551450 ) ( ON ?auto_1551452 ?auto_1551451 ) ( ON ?auto_1551453 ?auto_1551452 ) ( ON ?auto_1551454 ?auto_1551453 ) ( ON ?auto_1551455 ?auto_1551454 ) ( ON ?auto_1551456 ?auto_1551455 ) ( ON ?auto_1551457 ?auto_1551456 ) ( ON ?auto_1551458 ?auto_1551457 ) ( ON ?auto_1551459 ?auto_1551458 ) ( ON ?auto_1551460 ?auto_1551459 ) ( not ( = ?auto_1551450 ?auto_1551451 ) ) ( not ( = ?auto_1551450 ?auto_1551452 ) ) ( not ( = ?auto_1551450 ?auto_1551453 ) ) ( not ( = ?auto_1551450 ?auto_1551454 ) ) ( not ( = ?auto_1551450 ?auto_1551455 ) ) ( not ( = ?auto_1551450 ?auto_1551456 ) ) ( not ( = ?auto_1551450 ?auto_1551457 ) ) ( not ( = ?auto_1551450 ?auto_1551458 ) ) ( not ( = ?auto_1551450 ?auto_1551459 ) ) ( not ( = ?auto_1551450 ?auto_1551460 ) ) ( not ( = ?auto_1551450 ?auto_1551461 ) ) ( not ( = ?auto_1551450 ?auto_1551462 ) ) ( not ( = ?auto_1551450 ?auto_1551468 ) ) ( not ( = ?auto_1551451 ?auto_1551452 ) ) ( not ( = ?auto_1551451 ?auto_1551453 ) ) ( not ( = ?auto_1551451 ?auto_1551454 ) ) ( not ( = ?auto_1551451 ?auto_1551455 ) ) ( not ( = ?auto_1551451 ?auto_1551456 ) ) ( not ( = ?auto_1551451 ?auto_1551457 ) ) ( not ( = ?auto_1551451 ?auto_1551458 ) ) ( not ( = ?auto_1551451 ?auto_1551459 ) ) ( not ( = ?auto_1551451 ?auto_1551460 ) ) ( not ( = ?auto_1551451 ?auto_1551461 ) ) ( not ( = ?auto_1551451 ?auto_1551462 ) ) ( not ( = ?auto_1551451 ?auto_1551468 ) ) ( not ( = ?auto_1551452 ?auto_1551453 ) ) ( not ( = ?auto_1551452 ?auto_1551454 ) ) ( not ( = ?auto_1551452 ?auto_1551455 ) ) ( not ( = ?auto_1551452 ?auto_1551456 ) ) ( not ( = ?auto_1551452 ?auto_1551457 ) ) ( not ( = ?auto_1551452 ?auto_1551458 ) ) ( not ( = ?auto_1551452 ?auto_1551459 ) ) ( not ( = ?auto_1551452 ?auto_1551460 ) ) ( not ( = ?auto_1551452 ?auto_1551461 ) ) ( not ( = ?auto_1551452 ?auto_1551462 ) ) ( not ( = ?auto_1551452 ?auto_1551468 ) ) ( not ( = ?auto_1551453 ?auto_1551454 ) ) ( not ( = ?auto_1551453 ?auto_1551455 ) ) ( not ( = ?auto_1551453 ?auto_1551456 ) ) ( not ( = ?auto_1551453 ?auto_1551457 ) ) ( not ( = ?auto_1551453 ?auto_1551458 ) ) ( not ( = ?auto_1551453 ?auto_1551459 ) ) ( not ( = ?auto_1551453 ?auto_1551460 ) ) ( not ( = ?auto_1551453 ?auto_1551461 ) ) ( not ( = ?auto_1551453 ?auto_1551462 ) ) ( not ( = ?auto_1551453 ?auto_1551468 ) ) ( not ( = ?auto_1551454 ?auto_1551455 ) ) ( not ( = ?auto_1551454 ?auto_1551456 ) ) ( not ( = ?auto_1551454 ?auto_1551457 ) ) ( not ( = ?auto_1551454 ?auto_1551458 ) ) ( not ( = ?auto_1551454 ?auto_1551459 ) ) ( not ( = ?auto_1551454 ?auto_1551460 ) ) ( not ( = ?auto_1551454 ?auto_1551461 ) ) ( not ( = ?auto_1551454 ?auto_1551462 ) ) ( not ( = ?auto_1551454 ?auto_1551468 ) ) ( not ( = ?auto_1551455 ?auto_1551456 ) ) ( not ( = ?auto_1551455 ?auto_1551457 ) ) ( not ( = ?auto_1551455 ?auto_1551458 ) ) ( not ( = ?auto_1551455 ?auto_1551459 ) ) ( not ( = ?auto_1551455 ?auto_1551460 ) ) ( not ( = ?auto_1551455 ?auto_1551461 ) ) ( not ( = ?auto_1551455 ?auto_1551462 ) ) ( not ( = ?auto_1551455 ?auto_1551468 ) ) ( not ( = ?auto_1551456 ?auto_1551457 ) ) ( not ( = ?auto_1551456 ?auto_1551458 ) ) ( not ( = ?auto_1551456 ?auto_1551459 ) ) ( not ( = ?auto_1551456 ?auto_1551460 ) ) ( not ( = ?auto_1551456 ?auto_1551461 ) ) ( not ( = ?auto_1551456 ?auto_1551462 ) ) ( not ( = ?auto_1551456 ?auto_1551468 ) ) ( not ( = ?auto_1551457 ?auto_1551458 ) ) ( not ( = ?auto_1551457 ?auto_1551459 ) ) ( not ( = ?auto_1551457 ?auto_1551460 ) ) ( not ( = ?auto_1551457 ?auto_1551461 ) ) ( not ( = ?auto_1551457 ?auto_1551462 ) ) ( not ( = ?auto_1551457 ?auto_1551468 ) ) ( not ( = ?auto_1551458 ?auto_1551459 ) ) ( not ( = ?auto_1551458 ?auto_1551460 ) ) ( not ( = ?auto_1551458 ?auto_1551461 ) ) ( not ( = ?auto_1551458 ?auto_1551462 ) ) ( not ( = ?auto_1551458 ?auto_1551468 ) ) ( not ( = ?auto_1551459 ?auto_1551460 ) ) ( not ( = ?auto_1551459 ?auto_1551461 ) ) ( not ( = ?auto_1551459 ?auto_1551462 ) ) ( not ( = ?auto_1551459 ?auto_1551468 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1551460 ?auto_1551461 ?auto_1551462 )
      ( MAKE-12CRATE-VERIFY ?auto_1551450 ?auto_1551451 ?auto_1551452 ?auto_1551453 ?auto_1551454 ?auto_1551455 ?auto_1551456 ?auto_1551457 ?auto_1551458 ?auto_1551459 ?auto_1551460 ?auto_1551461 ?auto_1551462 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1551613 - SURFACE
      ?auto_1551614 - SURFACE
      ?auto_1551615 - SURFACE
      ?auto_1551616 - SURFACE
      ?auto_1551617 - SURFACE
      ?auto_1551618 - SURFACE
      ?auto_1551619 - SURFACE
      ?auto_1551620 - SURFACE
      ?auto_1551621 - SURFACE
      ?auto_1551622 - SURFACE
      ?auto_1551623 - SURFACE
      ?auto_1551624 - SURFACE
      ?auto_1551625 - SURFACE
    )
    :vars
    (
      ?auto_1551629 - HOIST
      ?auto_1551630 - PLACE
      ?auto_1551631 - PLACE
      ?auto_1551626 - HOIST
      ?auto_1551628 - SURFACE
      ?auto_1551627 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1551629 ?auto_1551630 ) ( SURFACE-AT ?auto_1551624 ?auto_1551630 ) ( CLEAR ?auto_1551624 ) ( IS-CRATE ?auto_1551625 ) ( not ( = ?auto_1551624 ?auto_1551625 ) ) ( AVAILABLE ?auto_1551629 ) ( ON ?auto_1551624 ?auto_1551623 ) ( not ( = ?auto_1551623 ?auto_1551624 ) ) ( not ( = ?auto_1551623 ?auto_1551625 ) ) ( not ( = ?auto_1551631 ?auto_1551630 ) ) ( HOIST-AT ?auto_1551626 ?auto_1551631 ) ( not ( = ?auto_1551629 ?auto_1551626 ) ) ( AVAILABLE ?auto_1551626 ) ( SURFACE-AT ?auto_1551625 ?auto_1551631 ) ( ON ?auto_1551625 ?auto_1551628 ) ( CLEAR ?auto_1551625 ) ( not ( = ?auto_1551624 ?auto_1551628 ) ) ( not ( = ?auto_1551625 ?auto_1551628 ) ) ( not ( = ?auto_1551623 ?auto_1551628 ) ) ( TRUCK-AT ?auto_1551627 ?auto_1551630 ) ( ON ?auto_1551614 ?auto_1551613 ) ( ON ?auto_1551615 ?auto_1551614 ) ( ON ?auto_1551616 ?auto_1551615 ) ( ON ?auto_1551617 ?auto_1551616 ) ( ON ?auto_1551618 ?auto_1551617 ) ( ON ?auto_1551619 ?auto_1551618 ) ( ON ?auto_1551620 ?auto_1551619 ) ( ON ?auto_1551621 ?auto_1551620 ) ( ON ?auto_1551622 ?auto_1551621 ) ( ON ?auto_1551623 ?auto_1551622 ) ( not ( = ?auto_1551613 ?auto_1551614 ) ) ( not ( = ?auto_1551613 ?auto_1551615 ) ) ( not ( = ?auto_1551613 ?auto_1551616 ) ) ( not ( = ?auto_1551613 ?auto_1551617 ) ) ( not ( = ?auto_1551613 ?auto_1551618 ) ) ( not ( = ?auto_1551613 ?auto_1551619 ) ) ( not ( = ?auto_1551613 ?auto_1551620 ) ) ( not ( = ?auto_1551613 ?auto_1551621 ) ) ( not ( = ?auto_1551613 ?auto_1551622 ) ) ( not ( = ?auto_1551613 ?auto_1551623 ) ) ( not ( = ?auto_1551613 ?auto_1551624 ) ) ( not ( = ?auto_1551613 ?auto_1551625 ) ) ( not ( = ?auto_1551613 ?auto_1551628 ) ) ( not ( = ?auto_1551614 ?auto_1551615 ) ) ( not ( = ?auto_1551614 ?auto_1551616 ) ) ( not ( = ?auto_1551614 ?auto_1551617 ) ) ( not ( = ?auto_1551614 ?auto_1551618 ) ) ( not ( = ?auto_1551614 ?auto_1551619 ) ) ( not ( = ?auto_1551614 ?auto_1551620 ) ) ( not ( = ?auto_1551614 ?auto_1551621 ) ) ( not ( = ?auto_1551614 ?auto_1551622 ) ) ( not ( = ?auto_1551614 ?auto_1551623 ) ) ( not ( = ?auto_1551614 ?auto_1551624 ) ) ( not ( = ?auto_1551614 ?auto_1551625 ) ) ( not ( = ?auto_1551614 ?auto_1551628 ) ) ( not ( = ?auto_1551615 ?auto_1551616 ) ) ( not ( = ?auto_1551615 ?auto_1551617 ) ) ( not ( = ?auto_1551615 ?auto_1551618 ) ) ( not ( = ?auto_1551615 ?auto_1551619 ) ) ( not ( = ?auto_1551615 ?auto_1551620 ) ) ( not ( = ?auto_1551615 ?auto_1551621 ) ) ( not ( = ?auto_1551615 ?auto_1551622 ) ) ( not ( = ?auto_1551615 ?auto_1551623 ) ) ( not ( = ?auto_1551615 ?auto_1551624 ) ) ( not ( = ?auto_1551615 ?auto_1551625 ) ) ( not ( = ?auto_1551615 ?auto_1551628 ) ) ( not ( = ?auto_1551616 ?auto_1551617 ) ) ( not ( = ?auto_1551616 ?auto_1551618 ) ) ( not ( = ?auto_1551616 ?auto_1551619 ) ) ( not ( = ?auto_1551616 ?auto_1551620 ) ) ( not ( = ?auto_1551616 ?auto_1551621 ) ) ( not ( = ?auto_1551616 ?auto_1551622 ) ) ( not ( = ?auto_1551616 ?auto_1551623 ) ) ( not ( = ?auto_1551616 ?auto_1551624 ) ) ( not ( = ?auto_1551616 ?auto_1551625 ) ) ( not ( = ?auto_1551616 ?auto_1551628 ) ) ( not ( = ?auto_1551617 ?auto_1551618 ) ) ( not ( = ?auto_1551617 ?auto_1551619 ) ) ( not ( = ?auto_1551617 ?auto_1551620 ) ) ( not ( = ?auto_1551617 ?auto_1551621 ) ) ( not ( = ?auto_1551617 ?auto_1551622 ) ) ( not ( = ?auto_1551617 ?auto_1551623 ) ) ( not ( = ?auto_1551617 ?auto_1551624 ) ) ( not ( = ?auto_1551617 ?auto_1551625 ) ) ( not ( = ?auto_1551617 ?auto_1551628 ) ) ( not ( = ?auto_1551618 ?auto_1551619 ) ) ( not ( = ?auto_1551618 ?auto_1551620 ) ) ( not ( = ?auto_1551618 ?auto_1551621 ) ) ( not ( = ?auto_1551618 ?auto_1551622 ) ) ( not ( = ?auto_1551618 ?auto_1551623 ) ) ( not ( = ?auto_1551618 ?auto_1551624 ) ) ( not ( = ?auto_1551618 ?auto_1551625 ) ) ( not ( = ?auto_1551618 ?auto_1551628 ) ) ( not ( = ?auto_1551619 ?auto_1551620 ) ) ( not ( = ?auto_1551619 ?auto_1551621 ) ) ( not ( = ?auto_1551619 ?auto_1551622 ) ) ( not ( = ?auto_1551619 ?auto_1551623 ) ) ( not ( = ?auto_1551619 ?auto_1551624 ) ) ( not ( = ?auto_1551619 ?auto_1551625 ) ) ( not ( = ?auto_1551619 ?auto_1551628 ) ) ( not ( = ?auto_1551620 ?auto_1551621 ) ) ( not ( = ?auto_1551620 ?auto_1551622 ) ) ( not ( = ?auto_1551620 ?auto_1551623 ) ) ( not ( = ?auto_1551620 ?auto_1551624 ) ) ( not ( = ?auto_1551620 ?auto_1551625 ) ) ( not ( = ?auto_1551620 ?auto_1551628 ) ) ( not ( = ?auto_1551621 ?auto_1551622 ) ) ( not ( = ?auto_1551621 ?auto_1551623 ) ) ( not ( = ?auto_1551621 ?auto_1551624 ) ) ( not ( = ?auto_1551621 ?auto_1551625 ) ) ( not ( = ?auto_1551621 ?auto_1551628 ) ) ( not ( = ?auto_1551622 ?auto_1551623 ) ) ( not ( = ?auto_1551622 ?auto_1551624 ) ) ( not ( = ?auto_1551622 ?auto_1551625 ) ) ( not ( = ?auto_1551622 ?auto_1551628 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1551623 ?auto_1551624 ?auto_1551625 )
      ( MAKE-12CRATE-VERIFY ?auto_1551613 ?auto_1551614 ?auto_1551615 ?auto_1551616 ?auto_1551617 ?auto_1551618 ?auto_1551619 ?auto_1551620 ?auto_1551621 ?auto_1551622 ?auto_1551623 ?auto_1551624 ?auto_1551625 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1551776 - SURFACE
      ?auto_1551777 - SURFACE
      ?auto_1551778 - SURFACE
      ?auto_1551779 - SURFACE
      ?auto_1551780 - SURFACE
      ?auto_1551781 - SURFACE
      ?auto_1551782 - SURFACE
      ?auto_1551783 - SURFACE
      ?auto_1551784 - SURFACE
      ?auto_1551785 - SURFACE
      ?auto_1551786 - SURFACE
      ?auto_1551787 - SURFACE
      ?auto_1551788 - SURFACE
    )
    :vars
    (
      ?auto_1551792 - HOIST
      ?auto_1551794 - PLACE
      ?auto_1551793 - PLACE
      ?auto_1551791 - HOIST
      ?auto_1551789 - SURFACE
      ?auto_1551790 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1551792 ?auto_1551794 ) ( IS-CRATE ?auto_1551788 ) ( not ( = ?auto_1551787 ?auto_1551788 ) ) ( not ( = ?auto_1551786 ?auto_1551787 ) ) ( not ( = ?auto_1551786 ?auto_1551788 ) ) ( not ( = ?auto_1551793 ?auto_1551794 ) ) ( HOIST-AT ?auto_1551791 ?auto_1551793 ) ( not ( = ?auto_1551792 ?auto_1551791 ) ) ( AVAILABLE ?auto_1551791 ) ( SURFACE-AT ?auto_1551788 ?auto_1551793 ) ( ON ?auto_1551788 ?auto_1551789 ) ( CLEAR ?auto_1551788 ) ( not ( = ?auto_1551787 ?auto_1551789 ) ) ( not ( = ?auto_1551788 ?auto_1551789 ) ) ( not ( = ?auto_1551786 ?auto_1551789 ) ) ( TRUCK-AT ?auto_1551790 ?auto_1551794 ) ( SURFACE-AT ?auto_1551786 ?auto_1551794 ) ( CLEAR ?auto_1551786 ) ( LIFTING ?auto_1551792 ?auto_1551787 ) ( IS-CRATE ?auto_1551787 ) ( ON ?auto_1551777 ?auto_1551776 ) ( ON ?auto_1551778 ?auto_1551777 ) ( ON ?auto_1551779 ?auto_1551778 ) ( ON ?auto_1551780 ?auto_1551779 ) ( ON ?auto_1551781 ?auto_1551780 ) ( ON ?auto_1551782 ?auto_1551781 ) ( ON ?auto_1551783 ?auto_1551782 ) ( ON ?auto_1551784 ?auto_1551783 ) ( ON ?auto_1551785 ?auto_1551784 ) ( ON ?auto_1551786 ?auto_1551785 ) ( not ( = ?auto_1551776 ?auto_1551777 ) ) ( not ( = ?auto_1551776 ?auto_1551778 ) ) ( not ( = ?auto_1551776 ?auto_1551779 ) ) ( not ( = ?auto_1551776 ?auto_1551780 ) ) ( not ( = ?auto_1551776 ?auto_1551781 ) ) ( not ( = ?auto_1551776 ?auto_1551782 ) ) ( not ( = ?auto_1551776 ?auto_1551783 ) ) ( not ( = ?auto_1551776 ?auto_1551784 ) ) ( not ( = ?auto_1551776 ?auto_1551785 ) ) ( not ( = ?auto_1551776 ?auto_1551786 ) ) ( not ( = ?auto_1551776 ?auto_1551787 ) ) ( not ( = ?auto_1551776 ?auto_1551788 ) ) ( not ( = ?auto_1551776 ?auto_1551789 ) ) ( not ( = ?auto_1551777 ?auto_1551778 ) ) ( not ( = ?auto_1551777 ?auto_1551779 ) ) ( not ( = ?auto_1551777 ?auto_1551780 ) ) ( not ( = ?auto_1551777 ?auto_1551781 ) ) ( not ( = ?auto_1551777 ?auto_1551782 ) ) ( not ( = ?auto_1551777 ?auto_1551783 ) ) ( not ( = ?auto_1551777 ?auto_1551784 ) ) ( not ( = ?auto_1551777 ?auto_1551785 ) ) ( not ( = ?auto_1551777 ?auto_1551786 ) ) ( not ( = ?auto_1551777 ?auto_1551787 ) ) ( not ( = ?auto_1551777 ?auto_1551788 ) ) ( not ( = ?auto_1551777 ?auto_1551789 ) ) ( not ( = ?auto_1551778 ?auto_1551779 ) ) ( not ( = ?auto_1551778 ?auto_1551780 ) ) ( not ( = ?auto_1551778 ?auto_1551781 ) ) ( not ( = ?auto_1551778 ?auto_1551782 ) ) ( not ( = ?auto_1551778 ?auto_1551783 ) ) ( not ( = ?auto_1551778 ?auto_1551784 ) ) ( not ( = ?auto_1551778 ?auto_1551785 ) ) ( not ( = ?auto_1551778 ?auto_1551786 ) ) ( not ( = ?auto_1551778 ?auto_1551787 ) ) ( not ( = ?auto_1551778 ?auto_1551788 ) ) ( not ( = ?auto_1551778 ?auto_1551789 ) ) ( not ( = ?auto_1551779 ?auto_1551780 ) ) ( not ( = ?auto_1551779 ?auto_1551781 ) ) ( not ( = ?auto_1551779 ?auto_1551782 ) ) ( not ( = ?auto_1551779 ?auto_1551783 ) ) ( not ( = ?auto_1551779 ?auto_1551784 ) ) ( not ( = ?auto_1551779 ?auto_1551785 ) ) ( not ( = ?auto_1551779 ?auto_1551786 ) ) ( not ( = ?auto_1551779 ?auto_1551787 ) ) ( not ( = ?auto_1551779 ?auto_1551788 ) ) ( not ( = ?auto_1551779 ?auto_1551789 ) ) ( not ( = ?auto_1551780 ?auto_1551781 ) ) ( not ( = ?auto_1551780 ?auto_1551782 ) ) ( not ( = ?auto_1551780 ?auto_1551783 ) ) ( not ( = ?auto_1551780 ?auto_1551784 ) ) ( not ( = ?auto_1551780 ?auto_1551785 ) ) ( not ( = ?auto_1551780 ?auto_1551786 ) ) ( not ( = ?auto_1551780 ?auto_1551787 ) ) ( not ( = ?auto_1551780 ?auto_1551788 ) ) ( not ( = ?auto_1551780 ?auto_1551789 ) ) ( not ( = ?auto_1551781 ?auto_1551782 ) ) ( not ( = ?auto_1551781 ?auto_1551783 ) ) ( not ( = ?auto_1551781 ?auto_1551784 ) ) ( not ( = ?auto_1551781 ?auto_1551785 ) ) ( not ( = ?auto_1551781 ?auto_1551786 ) ) ( not ( = ?auto_1551781 ?auto_1551787 ) ) ( not ( = ?auto_1551781 ?auto_1551788 ) ) ( not ( = ?auto_1551781 ?auto_1551789 ) ) ( not ( = ?auto_1551782 ?auto_1551783 ) ) ( not ( = ?auto_1551782 ?auto_1551784 ) ) ( not ( = ?auto_1551782 ?auto_1551785 ) ) ( not ( = ?auto_1551782 ?auto_1551786 ) ) ( not ( = ?auto_1551782 ?auto_1551787 ) ) ( not ( = ?auto_1551782 ?auto_1551788 ) ) ( not ( = ?auto_1551782 ?auto_1551789 ) ) ( not ( = ?auto_1551783 ?auto_1551784 ) ) ( not ( = ?auto_1551783 ?auto_1551785 ) ) ( not ( = ?auto_1551783 ?auto_1551786 ) ) ( not ( = ?auto_1551783 ?auto_1551787 ) ) ( not ( = ?auto_1551783 ?auto_1551788 ) ) ( not ( = ?auto_1551783 ?auto_1551789 ) ) ( not ( = ?auto_1551784 ?auto_1551785 ) ) ( not ( = ?auto_1551784 ?auto_1551786 ) ) ( not ( = ?auto_1551784 ?auto_1551787 ) ) ( not ( = ?auto_1551784 ?auto_1551788 ) ) ( not ( = ?auto_1551784 ?auto_1551789 ) ) ( not ( = ?auto_1551785 ?auto_1551786 ) ) ( not ( = ?auto_1551785 ?auto_1551787 ) ) ( not ( = ?auto_1551785 ?auto_1551788 ) ) ( not ( = ?auto_1551785 ?auto_1551789 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1551786 ?auto_1551787 ?auto_1551788 )
      ( MAKE-12CRATE-VERIFY ?auto_1551776 ?auto_1551777 ?auto_1551778 ?auto_1551779 ?auto_1551780 ?auto_1551781 ?auto_1551782 ?auto_1551783 ?auto_1551784 ?auto_1551785 ?auto_1551786 ?auto_1551787 ?auto_1551788 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1551939 - SURFACE
      ?auto_1551940 - SURFACE
      ?auto_1551941 - SURFACE
      ?auto_1551942 - SURFACE
      ?auto_1551943 - SURFACE
      ?auto_1551944 - SURFACE
      ?auto_1551945 - SURFACE
      ?auto_1551946 - SURFACE
      ?auto_1551947 - SURFACE
      ?auto_1551948 - SURFACE
      ?auto_1551949 - SURFACE
      ?auto_1551950 - SURFACE
      ?auto_1551951 - SURFACE
    )
    :vars
    (
      ?auto_1551956 - HOIST
      ?auto_1551957 - PLACE
      ?auto_1551955 - PLACE
      ?auto_1551953 - HOIST
      ?auto_1551954 - SURFACE
      ?auto_1551952 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1551956 ?auto_1551957 ) ( IS-CRATE ?auto_1551951 ) ( not ( = ?auto_1551950 ?auto_1551951 ) ) ( not ( = ?auto_1551949 ?auto_1551950 ) ) ( not ( = ?auto_1551949 ?auto_1551951 ) ) ( not ( = ?auto_1551955 ?auto_1551957 ) ) ( HOIST-AT ?auto_1551953 ?auto_1551955 ) ( not ( = ?auto_1551956 ?auto_1551953 ) ) ( AVAILABLE ?auto_1551953 ) ( SURFACE-AT ?auto_1551951 ?auto_1551955 ) ( ON ?auto_1551951 ?auto_1551954 ) ( CLEAR ?auto_1551951 ) ( not ( = ?auto_1551950 ?auto_1551954 ) ) ( not ( = ?auto_1551951 ?auto_1551954 ) ) ( not ( = ?auto_1551949 ?auto_1551954 ) ) ( TRUCK-AT ?auto_1551952 ?auto_1551957 ) ( SURFACE-AT ?auto_1551949 ?auto_1551957 ) ( CLEAR ?auto_1551949 ) ( IS-CRATE ?auto_1551950 ) ( AVAILABLE ?auto_1551956 ) ( IN ?auto_1551950 ?auto_1551952 ) ( ON ?auto_1551940 ?auto_1551939 ) ( ON ?auto_1551941 ?auto_1551940 ) ( ON ?auto_1551942 ?auto_1551941 ) ( ON ?auto_1551943 ?auto_1551942 ) ( ON ?auto_1551944 ?auto_1551943 ) ( ON ?auto_1551945 ?auto_1551944 ) ( ON ?auto_1551946 ?auto_1551945 ) ( ON ?auto_1551947 ?auto_1551946 ) ( ON ?auto_1551948 ?auto_1551947 ) ( ON ?auto_1551949 ?auto_1551948 ) ( not ( = ?auto_1551939 ?auto_1551940 ) ) ( not ( = ?auto_1551939 ?auto_1551941 ) ) ( not ( = ?auto_1551939 ?auto_1551942 ) ) ( not ( = ?auto_1551939 ?auto_1551943 ) ) ( not ( = ?auto_1551939 ?auto_1551944 ) ) ( not ( = ?auto_1551939 ?auto_1551945 ) ) ( not ( = ?auto_1551939 ?auto_1551946 ) ) ( not ( = ?auto_1551939 ?auto_1551947 ) ) ( not ( = ?auto_1551939 ?auto_1551948 ) ) ( not ( = ?auto_1551939 ?auto_1551949 ) ) ( not ( = ?auto_1551939 ?auto_1551950 ) ) ( not ( = ?auto_1551939 ?auto_1551951 ) ) ( not ( = ?auto_1551939 ?auto_1551954 ) ) ( not ( = ?auto_1551940 ?auto_1551941 ) ) ( not ( = ?auto_1551940 ?auto_1551942 ) ) ( not ( = ?auto_1551940 ?auto_1551943 ) ) ( not ( = ?auto_1551940 ?auto_1551944 ) ) ( not ( = ?auto_1551940 ?auto_1551945 ) ) ( not ( = ?auto_1551940 ?auto_1551946 ) ) ( not ( = ?auto_1551940 ?auto_1551947 ) ) ( not ( = ?auto_1551940 ?auto_1551948 ) ) ( not ( = ?auto_1551940 ?auto_1551949 ) ) ( not ( = ?auto_1551940 ?auto_1551950 ) ) ( not ( = ?auto_1551940 ?auto_1551951 ) ) ( not ( = ?auto_1551940 ?auto_1551954 ) ) ( not ( = ?auto_1551941 ?auto_1551942 ) ) ( not ( = ?auto_1551941 ?auto_1551943 ) ) ( not ( = ?auto_1551941 ?auto_1551944 ) ) ( not ( = ?auto_1551941 ?auto_1551945 ) ) ( not ( = ?auto_1551941 ?auto_1551946 ) ) ( not ( = ?auto_1551941 ?auto_1551947 ) ) ( not ( = ?auto_1551941 ?auto_1551948 ) ) ( not ( = ?auto_1551941 ?auto_1551949 ) ) ( not ( = ?auto_1551941 ?auto_1551950 ) ) ( not ( = ?auto_1551941 ?auto_1551951 ) ) ( not ( = ?auto_1551941 ?auto_1551954 ) ) ( not ( = ?auto_1551942 ?auto_1551943 ) ) ( not ( = ?auto_1551942 ?auto_1551944 ) ) ( not ( = ?auto_1551942 ?auto_1551945 ) ) ( not ( = ?auto_1551942 ?auto_1551946 ) ) ( not ( = ?auto_1551942 ?auto_1551947 ) ) ( not ( = ?auto_1551942 ?auto_1551948 ) ) ( not ( = ?auto_1551942 ?auto_1551949 ) ) ( not ( = ?auto_1551942 ?auto_1551950 ) ) ( not ( = ?auto_1551942 ?auto_1551951 ) ) ( not ( = ?auto_1551942 ?auto_1551954 ) ) ( not ( = ?auto_1551943 ?auto_1551944 ) ) ( not ( = ?auto_1551943 ?auto_1551945 ) ) ( not ( = ?auto_1551943 ?auto_1551946 ) ) ( not ( = ?auto_1551943 ?auto_1551947 ) ) ( not ( = ?auto_1551943 ?auto_1551948 ) ) ( not ( = ?auto_1551943 ?auto_1551949 ) ) ( not ( = ?auto_1551943 ?auto_1551950 ) ) ( not ( = ?auto_1551943 ?auto_1551951 ) ) ( not ( = ?auto_1551943 ?auto_1551954 ) ) ( not ( = ?auto_1551944 ?auto_1551945 ) ) ( not ( = ?auto_1551944 ?auto_1551946 ) ) ( not ( = ?auto_1551944 ?auto_1551947 ) ) ( not ( = ?auto_1551944 ?auto_1551948 ) ) ( not ( = ?auto_1551944 ?auto_1551949 ) ) ( not ( = ?auto_1551944 ?auto_1551950 ) ) ( not ( = ?auto_1551944 ?auto_1551951 ) ) ( not ( = ?auto_1551944 ?auto_1551954 ) ) ( not ( = ?auto_1551945 ?auto_1551946 ) ) ( not ( = ?auto_1551945 ?auto_1551947 ) ) ( not ( = ?auto_1551945 ?auto_1551948 ) ) ( not ( = ?auto_1551945 ?auto_1551949 ) ) ( not ( = ?auto_1551945 ?auto_1551950 ) ) ( not ( = ?auto_1551945 ?auto_1551951 ) ) ( not ( = ?auto_1551945 ?auto_1551954 ) ) ( not ( = ?auto_1551946 ?auto_1551947 ) ) ( not ( = ?auto_1551946 ?auto_1551948 ) ) ( not ( = ?auto_1551946 ?auto_1551949 ) ) ( not ( = ?auto_1551946 ?auto_1551950 ) ) ( not ( = ?auto_1551946 ?auto_1551951 ) ) ( not ( = ?auto_1551946 ?auto_1551954 ) ) ( not ( = ?auto_1551947 ?auto_1551948 ) ) ( not ( = ?auto_1551947 ?auto_1551949 ) ) ( not ( = ?auto_1551947 ?auto_1551950 ) ) ( not ( = ?auto_1551947 ?auto_1551951 ) ) ( not ( = ?auto_1551947 ?auto_1551954 ) ) ( not ( = ?auto_1551948 ?auto_1551949 ) ) ( not ( = ?auto_1551948 ?auto_1551950 ) ) ( not ( = ?auto_1551948 ?auto_1551951 ) ) ( not ( = ?auto_1551948 ?auto_1551954 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1551949 ?auto_1551950 ?auto_1551951 )
      ( MAKE-12CRATE-VERIFY ?auto_1551939 ?auto_1551940 ?auto_1551941 ?auto_1551942 ?auto_1551943 ?auto_1551944 ?auto_1551945 ?auto_1551946 ?auto_1551947 ?auto_1551948 ?auto_1551949 ?auto_1551950 ?auto_1551951 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1563463 - SURFACE
      ?auto_1563464 - SURFACE
      ?auto_1563465 - SURFACE
      ?auto_1563466 - SURFACE
      ?auto_1563467 - SURFACE
      ?auto_1563468 - SURFACE
      ?auto_1563469 - SURFACE
      ?auto_1563470 - SURFACE
      ?auto_1563471 - SURFACE
      ?auto_1563472 - SURFACE
      ?auto_1563473 - SURFACE
      ?auto_1563474 - SURFACE
      ?auto_1563475 - SURFACE
      ?auto_1563476 - SURFACE
    )
    :vars
    (
      ?auto_1563478 - HOIST
      ?auto_1563477 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1563478 ?auto_1563477 ) ( SURFACE-AT ?auto_1563475 ?auto_1563477 ) ( CLEAR ?auto_1563475 ) ( LIFTING ?auto_1563478 ?auto_1563476 ) ( IS-CRATE ?auto_1563476 ) ( not ( = ?auto_1563475 ?auto_1563476 ) ) ( ON ?auto_1563464 ?auto_1563463 ) ( ON ?auto_1563465 ?auto_1563464 ) ( ON ?auto_1563466 ?auto_1563465 ) ( ON ?auto_1563467 ?auto_1563466 ) ( ON ?auto_1563468 ?auto_1563467 ) ( ON ?auto_1563469 ?auto_1563468 ) ( ON ?auto_1563470 ?auto_1563469 ) ( ON ?auto_1563471 ?auto_1563470 ) ( ON ?auto_1563472 ?auto_1563471 ) ( ON ?auto_1563473 ?auto_1563472 ) ( ON ?auto_1563474 ?auto_1563473 ) ( ON ?auto_1563475 ?auto_1563474 ) ( not ( = ?auto_1563463 ?auto_1563464 ) ) ( not ( = ?auto_1563463 ?auto_1563465 ) ) ( not ( = ?auto_1563463 ?auto_1563466 ) ) ( not ( = ?auto_1563463 ?auto_1563467 ) ) ( not ( = ?auto_1563463 ?auto_1563468 ) ) ( not ( = ?auto_1563463 ?auto_1563469 ) ) ( not ( = ?auto_1563463 ?auto_1563470 ) ) ( not ( = ?auto_1563463 ?auto_1563471 ) ) ( not ( = ?auto_1563463 ?auto_1563472 ) ) ( not ( = ?auto_1563463 ?auto_1563473 ) ) ( not ( = ?auto_1563463 ?auto_1563474 ) ) ( not ( = ?auto_1563463 ?auto_1563475 ) ) ( not ( = ?auto_1563463 ?auto_1563476 ) ) ( not ( = ?auto_1563464 ?auto_1563465 ) ) ( not ( = ?auto_1563464 ?auto_1563466 ) ) ( not ( = ?auto_1563464 ?auto_1563467 ) ) ( not ( = ?auto_1563464 ?auto_1563468 ) ) ( not ( = ?auto_1563464 ?auto_1563469 ) ) ( not ( = ?auto_1563464 ?auto_1563470 ) ) ( not ( = ?auto_1563464 ?auto_1563471 ) ) ( not ( = ?auto_1563464 ?auto_1563472 ) ) ( not ( = ?auto_1563464 ?auto_1563473 ) ) ( not ( = ?auto_1563464 ?auto_1563474 ) ) ( not ( = ?auto_1563464 ?auto_1563475 ) ) ( not ( = ?auto_1563464 ?auto_1563476 ) ) ( not ( = ?auto_1563465 ?auto_1563466 ) ) ( not ( = ?auto_1563465 ?auto_1563467 ) ) ( not ( = ?auto_1563465 ?auto_1563468 ) ) ( not ( = ?auto_1563465 ?auto_1563469 ) ) ( not ( = ?auto_1563465 ?auto_1563470 ) ) ( not ( = ?auto_1563465 ?auto_1563471 ) ) ( not ( = ?auto_1563465 ?auto_1563472 ) ) ( not ( = ?auto_1563465 ?auto_1563473 ) ) ( not ( = ?auto_1563465 ?auto_1563474 ) ) ( not ( = ?auto_1563465 ?auto_1563475 ) ) ( not ( = ?auto_1563465 ?auto_1563476 ) ) ( not ( = ?auto_1563466 ?auto_1563467 ) ) ( not ( = ?auto_1563466 ?auto_1563468 ) ) ( not ( = ?auto_1563466 ?auto_1563469 ) ) ( not ( = ?auto_1563466 ?auto_1563470 ) ) ( not ( = ?auto_1563466 ?auto_1563471 ) ) ( not ( = ?auto_1563466 ?auto_1563472 ) ) ( not ( = ?auto_1563466 ?auto_1563473 ) ) ( not ( = ?auto_1563466 ?auto_1563474 ) ) ( not ( = ?auto_1563466 ?auto_1563475 ) ) ( not ( = ?auto_1563466 ?auto_1563476 ) ) ( not ( = ?auto_1563467 ?auto_1563468 ) ) ( not ( = ?auto_1563467 ?auto_1563469 ) ) ( not ( = ?auto_1563467 ?auto_1563470 ) ) ( not ( = ?auto_1563467 ?auto_1563471 ) ) ( not ( = ?auto_1563467 ?auto_1563472 ) ) ( not ( = ?auto_1563467 ?auto_1563473 ) ) ( not ( = ?auto_1563467 ?auto_1563474 ) ) ( not ( = ?auto_1563467 ?auto_1563475 ) ) ( not ( = ?auto_1563467 ?auto_1563476 ) ) ( not ( = ?auto_1563468 ?auto_1563469 ) ) ( not ( = ?auto_1563468 ?auto_1563470 ) ) ( not ( = ?auto_1563468 ?auto_1563471 ) ) ( not ( = ?auto_1563468 ?auto_1563472 ) ) ( not ( = ?auto_1563468 ?auto_1563473 ) ) ( not ( = ?auto_1563468 ?auto_1563474 ) ) ( not ( = ?auto_1563468 ?auto_1563475 ) ) ( not ( = ?auto_1563468 ?auto_1563476 ) ) ( not ( = ?auto_1563469 ?auto_1563470 ) ) ( not ( = ?auto_1563469 ?auto_1563471 ) ) ( not ( = ?auto_1563469 ?auto_1563472 ) ) ( not ( = ?auto_1563469 ?auto_1563473 ) ) ( not ( = ?auto_1563469 ?auto_1563474 ) ) ( not ( = ?auto_1563469 ?auto_1563475 ) ) ( not ( = ?auto_1563469 ?auto_1563476 ) ) ( not ( = ?auto_1563470 ?auto_1563471 ) ) ( not ( = ?auto_1563470 ?auto_1563472 ) ) ( not ( = ?auto_1563470 ?auto_1563473 ) ) ( not ( = ?auto_1563470 ?auto_1563474 ) ) ( not ( = ?auto_1563470 ?auto_1563475 ) ) ( not ( = ?auto_1563470 ?auto_1563476 ) ) ( not ( = ?auto_1563471 ?auto_1563472 ) ) ( not ( = ?auto_1563471 ?auto_1563473 ) ) ( not ( = ?auto_1563471 ?auto_1563474 ) ) ( not ( = ?auto_1563471 ?auto_1563475 ) ) ( not ( = ?auto_1563471 ?auto_1563476 ) ) ( not ( = ?auto_1563472 ?auto_1563473 ) ) ( not ( = ?auto_1563472 ?auto_1563474 ) ) ( not ( = ?auto_1563472 ?auto_1563475 ) ) ( not ( = ?auto_1563472 ?auto_1563476 ) ) ( not ( = ?auto_1563473 ?auto_1563474 ) ) ( not ( = ?auto_1563473 ?auto_1563475 ) ) ( not ( = ?auto_1563473 ?auto_1563476 ) ) ( not ( = ?auto_1563474 ?auto_1563475 ) ) ( not ( = ?auto_1563474 ?auto_1563476 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1563475 ?auto_1563476 )
      ( MAKE-13CRATE-VERIFY ?auto_1563463 ?auto_1563464 ?auto_1563465 ?auto_1563466 ?auto_1563467 ?auto_1563468 ?auto_1563469 ?auto_1563470 ?auto_1563471 ?auto_1563472 ?auto_1563473 ?auto_1563474 ?auto_1563475 ?auto_1563476 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1563605 - SURFACE
      ?auto_1563606 - SURFACE
      ?auto_1563607 - SURFACE
      ?auto_1563608 - SURFACE
      ?auto_1563609 - SURFACE
      ?auto_1563610 - SURFACE
      ?auto_1563611 - SURFACE
      ?auto_1563612 - SURFACE
      ?auto_1563613 - SURFACE
      ?auto_1563614 - SURFACE
      ?auto_1563615 - SURFACE
      ?auto_1563616 - SURFACE
      ?auto_1563617 - SURFACE
      ?auto_1563618 - SURFACE
    )
    :vars
    (
      ?auto_1563621 - HOIST
      ?auto_1563619 - PLACE
      ?auto_1563620 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1563621 ?auto_1563619 ) ( SURFACE-AT ?auto_1563617 ?auto_1563619 ) ( CLEAR ?auto_1563617 ) ( IS-CRATE ?auto_1563618 ) ( not ( = ?auto_1563617 ?auto_1563618 ) ) ( TRUCK-AT ?auto_1563620 ?auto_1563619 ) ( AVAILABLE ?auto_1563621 ) ( IN ?auto_1563618 ?auto_1563620 ) ( ON ?auto_1563617 ?auto_1563616 ) ( not ( = ?auto_1563616 ?auto_1563617 ) ) ( not ( = ?auto_1563616 ?auto_1563618 ) ) ( ON ?auto_1563606 ?auto_1563605 ) ( ON ?auto_1563607 ?auto_1563606 ) ( ON ?auto_1563608 ?auto_1563607 ) ( ON ?auto_1563609 ?auto_1563608 ) ( ON ?auto_1563610 ?auto_1563609 ) ( ON ?auto_1563611 ?auto_1563610 ) ( ON ?auto_1563612 ?auto_1563611 ) ( ON ?auto_1563613 ?auto_1563612 ) ( ON ?auto_1563614 ?auto_1563613 ) ( ON ?auto_1563615 ?auto_1563614 ) ( ON ?auto_1563616 ?auto_1563615 ) ( not ( = ?auto_1563605 ?auto_1563606 ) ) ( not ( = ?auto_1563605 ?auto_1563607 ) ) ( not ( = ?auto_1563605 ?auto_1563608 ) ) ( not ( = ?auto_1563605 ?auto_1563609 ) ) ( not ( = ?auto_1563605 ?auto_1563610 ) ) ( not ( = ?auto_1563605 ?auto_1563611 ) ) ( not ( = ?auto_1563605 ?auto_1563612 ) ) ( not ( = ?auto_1563605 ?auto_1563613 ) ) ( not ( = ?auto_1563605 ?auto_1563614 ) ) ( not ( = ?auto_1563605 ?auto_1563615 ) ) ( not ( = ?auto_1563605 ?auto_1563616 ) ) ( not ( = ?auto_1563605 ?auto_1563617 ) ) ( not ( = ?auto_1563605 ?auto_1563618 ) ) ( not ( = ?auto_1563606 ?auto_1563607 ) ) ( not ( = ?auto_1563606 ?auto_1563608 ) ) ( not ( = ?auto_1563606 ?auto_1563609 ) ) ( not ( = ?auto_1563606 ?auto_1563610 ) ) ( not ( = ?auto_1563606 ?auto_1563611 ) ) ( not ( = ?auto_1563606 ?auto_1563612 ) ) ( not ( = ?auto_1563606 ?auto_1563613 ) ) ( not ( = ?auto_1563606 ?auto_1563614 ) ) ( not ( = ?auto_1563606 ?auto_1563615 ) ) ( not ( = ?auto_1563606 ?auto_1563616 ) ) ( not ( = ?auto_1563606 ?auto_1563617 ) ) ( not ( = ?auto_1563606 ?auto_1563618 ) ) ( not ( = ?auto_1563607 ?auto_1563608 ) ) ( not ( = ?auto_1563607 ?auto_1563609 ) ) ( not ( = ?auto_1563607 ?auto_1563610 ) ) ( not ( = ?auto_1563607 ?auto_1563611 ) ) ( not ( = ?auto_1563607 ?auto_1563612 ) ) ( not ( = ?auto_1563607 ?auto_1563613 ) ) ( not ( = ?auto_1563607 ?auto_1563614 ) ) ( not ( = ?auto_1563607 ?auto_1563615 ) ) ( not ( = ?auto_1563607 ?auto_1563616 ) ) ( not ( = ?auto_1563607 ?auto_1563617 ) ) ( not ( = ?auto_1563607 ?auto_1563618 ) ) ( not ( = ?auto_1563608 ?auto_1563609 ) ) ( not ( = ?auto_1563608 ?auto_1563610 ) ) ( not ( = ?auto_1563608 ?auto_1563611 ) ) ( not ( = ?auto_1563608 ?auto_1563612 ) ) ( not ( = ?auto_1563608 ?auto_1563613 ) ) ( not ( = ?auto_1563608 ?auto_1563614 ) ) ( not ( = ?auto_1563608 ?auto_1563615 ) ) ( not ( = ?auto_1563608 ?auto_1563616 ) ) ( not ( = ?auto_1563608 ?auto_1563617 ) ) ( not ( = ?auto_1563608 ?auto_1563618 ) ) ( not ( = ?auto_1563609 ?auto_1563610 ) ) ( not ( = ?auto_1563609 ?auto_1563611 ) ) ( not ( = ?auto_1563609 ?auto_1563612 ) ) ( not ( = ?auto_1563609 ?auto_1563613 ) ) ( not ( = ?auto_1563609 ?auto_1563614 ) ) ( not ( = ?auto_1563609 ?auto_1563615 ) ) ( not ( = ?auto_1563609 ?auto_1563616 ) ) ( not ( = ?auto_1563609 ?auto_1563617 ) ) ( not ( = ?auto_1563609 ?auto_1563618 ) ) ( not ( = ?auto_1563610 ?auto_1563611 ) ) ( not ( = ?auto_1563610 ?auto_1563612 ) ) ( not ( = ?auto_1563610 ?auto_1563613 ) ) ( not ( = ?auto_1563610 ?auto_1563614 ) ) ( not ( = ?auto_1563610 ?auto_1563615 ) ) ( not ( = ?auto_1563610 ?auto_1563616 ) ) ( not ( = ?auto_1563610 ?auto_1563617 ) ) ( not ( = ?auto_1563610 ?auto_1563618 ) ) ( not ( = ?auto_1563611 ?auto_1563612 ) ) ( not ( = ?auto_1563611 ?auto_1563613 ) ) ( not ( = ?auto_1563611 ?auto_1563614 ) ) ( not ( = ?auto_1563611 ?auto_1563615 ) ) ( not ( = ?auto_1563611 ?auto_1563616 ) ) ( not ( = ?auto_1563611 ?auto_1563617 ) ) ( not ( = ?auto_1563611 ?auto_1563618 ) ) ( not ( = ?auto_1563612 ?auto_1563613 ) ) ( not ( = ?auto_1563612 ?auto_1563614 ) ) ( not ( = ?auto_1563612 ?auto_1563615 ) ) ( not ( = ?auto_1563612 ?auto_1563616 ) ) ( not ( = ?auto_1563612 ?auto_1563617 ) ) ( not ( = ?auto_1563612 ?auto_1563618 ) ) ( not ( = ?auto_1563613 ?auto_1563614 ) ) ( not ( = ?auto_1563613 ?auto_1563615 ) ) ( not ( = ?auto_1563613 ?auto_1563616 ) ) ( not ( = ?auto_1563613 ?auto_1563617 ) ) ( not ( = ?auto_1563613 ?auto_1563618 ) ) ( not ( = ?auto_1563614 ?auto_1563615 ) ) ( not ( = ?auto_1563614 ?auto_1563616 ) ) ( not ( = ?auto_1563614 ?auto_1563617 ) ) ( not ( = ?auto_1563614 ?auto_1563618 ) ) ( not ( = ?auto_1563615 ?auto_1563616 ) ) ( not ( = ?auto_1563615 ?auto_1563617 ) ) ( not ( = ?auto_1563615 ?auto_1563618 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1563616 ?auto_1563617 ?auto_1563618 )
      ( MAKE-13CRATE-VERIFY ?auto_1563605 ?auto_1563606 ?auto_1563607 ?auto_1563608 ?auto_1563609 ?auto_1563610 ?auto_1563611 ?auto_1563612 ?auto_1563613 ?auto_1563614 ?auto_1563615 ?auto_1563616 ?auto_1563617 ?auto_1563618 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1563761 - SURFACE
      ?auto_1563762 - SURFACE
      ?auto_1563763 - SURFACE
      ?auto_1563764 - SURFACE
      ?auto_1563765 - SURFACE
      ?auto_1563766 - SURFACE
      ?auto_1563767 - SURFACE
      ?auto_1563768 - SURFACE
      ?auto_1563769 - SURFACE
      ?auto_1563770 - SURFACE
      ?auto_1563771 - SURFACE
      ?auto_1563772 - SURFACE
      ?auto_1563773 - SURFACE
      ?auto_1563774 - SURFACE
    )
    :vars
    (
      ?auto_1563777 - HOIST
      ?auto_1563775 - PLACE
      ?auto_1563776 - TRUCK
      ?auto_1563778 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1563777 ?auto_1563775 ) ( SURFACE-AT ?auto_1563773 ?auto_1563775 ) ( CLEAR ?auto_1563773 ) ( IS-CRATE ?auto_1563774 ) ( not ( = ?auto_1563773 ?auto_1563774 ) ) ( AVAILABLE ?auto_1563777 ) ( IN ?auto_1563774 ?auto_1563776 ) ( ON ?auto_1563773 ?auto_1563772 ) ( not ( = ?auto_1563772 ?auto_1563773 ) ) ( not ( = ?auto_1563772 ?auto_1563774 ) ) ( TRUCK-AT ?auto_1563776 ?auto_1563778 ) ( not ( = ?auto_1563778 ?auto_1563775 ) ) ( ON ?auto_1563762 ?auto_1563761 ) ( ON ?auto_1563763 ?auto_1563762 ) ( ON ?auto_1563764 ?auto_1563763 ) ( ON ?auto_1563765 ?auto_1563764 ) ( ON ?auto_1563766 ?auto_1563765 ) ( ON ?auto_1563767 ?auto_1563766 ) ( ON ?auto_1563768 ?auto_1563767 ) ( ON ?auto_1563769 ?auto_1563768 ) ( ON ?auto_1563770 ?auto_1563769 ) ( ON ?auto_1563771 ?auto_1563770 ) ( ON ?auto_1563772 ?auto_1563771 ) ( not ( = ?auto_1563761 ?auto_1563762 ) ) ( not ( = ?auto_1563761 ?auto_1563763 ) ) ( not ( = ?auto_1563761 ?auto_1563764 ) ) ( not ( = ?auto_1563761 ?auto_1563765 ) ) ( not ( = ?auto_1563761 ?auto_1563766 ) ) ( not ( = ?auto_1563761 ?auto_1563767 ) ) ( not ( = ?auto_1563761 ?auto_1563768 ) ) ( not ( = ?auto_1563761 ?auto_1563769 ) ) ( not ( = ?auto_1563761 ?auto_1563770 ) ) ( not ( = ?auto_1563761 ?auto_1563771 ) ) ( not ( = ?auto_1563761 ?auto_1563772 ) ) ( not ( = ?auto_1563761 ?auto_1563773 ) ) ( not ( = ?auto_1563761 ?auto_1563774 ) ) ( not ( = ?auto_1563762 ?auto_1563763 ) ) ( not ( = ?auto_1563762 ?auto_1563764 ) ) ( not ( = ?auto_1563762 ?auto_1563765 ) ) ( not ( = ?auto_1563762 ?auto_1563766 ) ) ( not ( = ?auto_1563762 ?auto_1563767 ) ) ( not ( = ?auto_1563762 ?auto_1563768 ) ) ( not ( = ?auto_1563762 ?auto_1563769 ) ) ( not ( = ?auto_1563762 ?auto_1563770 ) ) ( not ( = ?auto_1563762 ?auto_1563771 ) ) ( not ( = ?auto_1563762 ?auto_1563772 ) ) ( not ( = ?auto_1563762 ?auto_1563773 ) ) ( not ( = ?auto_1563762 ?auto_1563774 ) ) ( not ( = ?auto_1563763 ?auto_1563764 ) ) ( not ( = ?auto_1563763 ?auto_1563765 ) ) ( not ( = ?auto_1563763 ?auto_1563766 ) ) ( not ( = ?auto_1563763 ?auto_1563767 ) ) ( not ( = ?auto_1563763 ?auto_1563768 ) ) ( not ( = ?auto_1563763 ?auto_1563769 ) ) ( not ( = ?auto_1563763 ?auto_1563770 ) ) ( not ( = ?auto_1563763 ?auto_1563771 ) ) ( not ( = ?auto_1563763 ?auto_1563772 ) ) ( not ( = ?auto_1563763 ?auto_1563773 ) ) ( not ( = ?auto_1563763 ?auto_1563774 ) ) ( not ( = ?auto_1563764 ?auto_1563765 ) ) ( not ( = ?auto_1563764 ?auto_1563766 ) ) ( not ( = ?auto_1563764 ?auto_1563767 ) ) ( not ( = ?auto_1563764 ?auto_1563768 ) ) ( not ( = ?auto_1563764 ?auto_1563769 ) ) ( not ( = ?auto_1563764 ?auto_1563770 ) ) ( not ( = ?auto_1563764 ?auto_1563771 ) ) ( not ( = ?auto_1563764 ?auto_1563772 ) ) ( not ( = ?auto_1563764 ?auto_1563773 ) ) ( not ( = ?auto_1563764 ?auto_1563774 ) ) ( not ( = ?auto_1563765 ?auto_1563766 ) ) ( not ( = ?auto_1563765 ?auto_1563767 ) ) ( not ( = ?auto_1563765 ?auto_1563768 ) ) ( not ( = ?auto_1563765 ?auto_1563769 ) ) ( not ( = ?auto_1563765 ?auto_1563770 ) ) ( not ( = ?auto_1563765 ?auto_1563771 ) ) ( not ( = ?auto_1563765 ?auto_1563772 ) ) ( not ( = ?auto_1563765 ?auto_1563773 ) ) ( not ( = ?auto_1563765 ?auto_1563774 ) ) ( not ( = ?auto_1563766 ?auto_1563767 ) ) ( not ( = ?auto_1563766 ?auto_1563768 ) ) ( not ( = ?auto_1563766 ?auto_1563769 ) ) ( not ( = ?auto_1563766 ?auto_1563770 ) ) ( not ( = ?auto_1563766 ?auto_1563771 ) ) ( not ( = ?auto_1563766 ?auto_1563772 ) ) ( not ( = ?auto_1563766 ?auto_1563773 ) ) ( not ( = ?auto_1563766 ?auto_1563774 ) ) ( not ( = ?auto_1563767 ?auto_1563768 ) ) ( not ( = ?auto_1563767 ?auto_1563769 ) ) ( not ( = ?auto_1563767 ?auto_1563770 ) ) ( not ( = ?auto_1563767 ?auto_1563771 ) ) ( not ( = ?auto_1563767 ?auto_1563772 ) ) ( not ( = ?auto_1563767 ?auto_1563773 ) ) ( not ( = ?auto_1563767 ?auto_1563774 ) ) ( not ( = ?auto_1563768 ?auto_1563769 ) ) ( not ( = ?auto_1563768 ?auto_1563770 ) ) ( not ( = ?auto_1563768 ?auto_1563771 ) ) ( not ( = ?auto_1563768 ?auto_1563772 ) ) ( not ( = ?auto_1563768 ?auto_1563773 ) ) ( not ( = ?auto_1563768 ?auto_1563774 ) ) ( not ( = ?auto_1563769 ?auto_1563770 ) ) ( not ( = ?auto_1563769 ?auto_1563771 ) ) ( not ( = ?auto_1563769 ?auto_1563772 ) ) ( not ( = ?auto_1563769 ?auto_1563773 ) ) ( not ( = ?auto_1563769 ?auto_1563774 ) ) ( not ( = ?auto_1563770 ?auto_1563771 ) ) ( not ( = ?auto_1563770 ?auto_1563772 ) ) ( not ( = ?auto_1563770 ?auto_1563773 ) ) ( not ( = ?auto_1563770 ?auto_1563774 ) ) ( not ( = ?auto_1563771 ?auto_1563772 ) ) ( not ( = ?auto_1563771 ?auto_1563773 ) ) ( not ( = ?auto_1563771 ?auto_1563774 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1563772 ?auto_1563773 ?auto_1563774 )
      ( MAKE-13CRATE-VERIFY ?auto_1563761 ?auto_1563762 ?auto_1563763 ?auto_1563764 ?auto_1563765 ?auto_1563766 ?auto_1563767 ?auto_1563768 ?auto_1563769 ?auto_1563770 ?auto_1563771 ?auto_1563772 ?auto_1563773 ?auto_1563774 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1563930 - SURFACE
      ?auto_1563931 - SURFACE
      ?auto_1563932 - SURFACE
      ?auto_1563933 - SURFACE
      ?auto_1563934 - SURFACE
      ?auto_1563935 - SURFACE
      ?auto_1563936 - SURFACE
      ?auto_1563937 - SURFACE
      ?auto_1563938 - SURFACE
      ?auto_1563939 - SURFACE
      ?auto_1563940 - SURFACE
      ?auto_1563941 - SURFACE
      ?auto_1563942 - SURFACE
      ?auto_1563943 - SURFACE
    )
    :vars
    (
      ?auto_1563947 - HOIST
      ?auto_1563945 - PLACE
      ?auto_1563946 - TRUCK
      ?auto_1563944 - PLACE
      ?auto_1563948 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1563947 ?auto_1563945 ) ( SURFACE-AT ?auto_1563942 ?auto_1563945 ) ( CLEAR ?auto_1563942 ) ( IS-CRATE ?auto_1563943 ) ( not ( = ?auto_1563942 ?auto_1563943 ) ) ( AVAILABLE ?auto_1563947 ) ( ON ?auto_1563942 ?auto_1563941 ) ( not ( = ?auto_1563941 ?auto_1563942 ) ) ( not ( = ?auto_1563941 ?auto_1563943 ) ) ( TRUCK-AT ?auto_1563946 ?auto_1563944 ) ( not ( = ?auto_1563944 ?auto_1563945 ) ) ( HOIST-AT ?auto_1563948 ?auto_1563944 ) ( LIFTING ?auto_1563948 ?auto_1563943 ) ( not ( = ?auto_1563947 ?auto_1563948 ) ) ( ON ?auto_1563931 ?auto_1563930 ) ( ON ?auto_1563932 ?auto_1563931 ) ( ON ?auto_1563933 ?auto_1563932 ) ( ON ?auto_1563934 ?auto_1563933 ) ( ON ?auto_1563935 ?auto_1563934 ) ( ON ?auto_1563936 ?auto_1563935 ) ( ON ?auto_1563937 ?auto_1563936 ) ( ON ?auto_1563938 ?auto_1563937 ) ( ON ?auto_1563939 ?auto_1563938 ) ( ON ?auto_1563940 ?auto_1563939 ) ( ON ?auto_1563941 ?auto_1563940 ) ( not ( = ?auto_1563930 ?auto_1563931 ) ) ( not ( = ?auto_1563930 ?auto_1563932 ) ) ( not ( = ?auto_1563930 ?auto_1563933 ) ) ( not ( = ?auto_1563930 ?auto_1563934 ) ) ( not ( = ?auto_1563930 ?auto_1563935 ) ) ( not ( = ?auto_1563930 ?auto_1563936 ) ) ( not ( = ?auto_1563930 ?auto_1563937 ) ) ( not ( = ?auto_1563930 ?auto_1563938 ) ) ( not ( = ?auto_1563930 ?auto_1563939 ) ) ( not ( = ?auto_1563930 ?auto_1563940 ) ) ( not ( = ?auto_1563930 ?auto_1563941 ) ) ( not ( = ?auto_1563930 ?auto_1563942 ) ) ( not ( = ?auto_1563930 ?auto_1563943 ) ) ( not ( = ?auto_1563931 ?auto_1563932 ) ) ( not ( = ?auto_1563931 ?auto_1563933 ) ) ( not ( = ?auto_1563931 ?auto_1563934 ) ) ( not ( = ?auto_1563931 ?auto_1563935 ) ) ( not ( = ?auto_1563931 ?auto_1563936 ) ) ( not ( = ?auto_1563931 ?auto_1563937 ) ) ( not ( = ?auto_1563931 ?auto_1563938 ) ) ( not ( = ?auto_1563931 ?auto_1563939 ) ) ( not ( = ?auto_1563931 ?auto_1563940 ) ) ( not ( = ?auto_1563931 ?auto_1563941 ) ) ( not ( = ?auto_1563931 ?auto_1563942 ) ) ( not ( = ?auto_1563931 ?auto_1563943 ) ) ( not ( = ?auto_1563932 ?auto_1563933 ) ) ( not ( = ?auto_1563932 ?auto_1563934 ) ) ( not ( = ?auto_1563932 ?auto_1563935 ) ) ( not ( = ?auto_1563932 ?auto_1563936 ) ) ( not ( = ?auto_1563932 ?auto_1563937 ) ) ( not ( = ?auto_1563932 ?auto_1563938 ) ) ( not ( = ?auto_1563932 ?auto_1563939 ) ) ( not ( = ?auto_1563932 ?auto_1563940 ) ) ( not ( = ?auto_1563932 ?auto_1563941 ) ) ( not ( = ?auto_1563932 ?auto_1563942 ) ) ( not ( = ?auto_1563932 ?auto_1563943 ) ) ( not ( = ?auto_1563933 ?auto_1563934 ) ) ( not ( = ?auto_1563933 ?auto_1563935 ) ) ( not ( = ?auto_1563933 ?auto_1563936 ) ) ( not ( = ?auto_1563933 ?auto_1563937 ) ) ( not ( = ?auto_1563933 ?auto_1563938 ) ) ( not ( = ?auto_1563933 ?auto_1563939 ) ) ( not ( = ?auto_1563933 ?auto_1563940 ) ) ( not ( = ?auto_1563933 ?auto_1563941 ) ) ( not ( = ?auto_1563933 ?auto_1563942 ) ) ( not ( = ?auto_1563933 ?auto_1563943 ) ) ( not ( = ?auto_1563934 ?auto_1563935 ) ) ( not ( = ?auto_1563934 ?auto_1563936 ) ) ( not ( = ?auto_1563934 ?auto_1563937 ) ) ( not ( = ?auto_1563934 ?auto_1563938 ) ) ( not ( = ?auto_1563934 ?auto_1563939 ) ) ( not ( = ?auto_1563934 ?auto_1563940 ) ) ( not ( = ?auto_1563934 ?auto_1563941 ) ) ( not ( = ?auto_1563934 ?auto_1563942 ) ) ( not ( = ?auto_1563934 ?auto_1563943 ) ) ( not ( = ?auto_1563935 ?auto_1563936 ) ) ( not ( = ?auto_1563935 ?auto_1563937 ) ) ( not ( = ?auto_1563935 ?auto_1563938 ) ) ( not ( = ?auto_1563935 ?auto_1563939 ) ) ( not ( = ?auto_1563935 ?auto_1563940 ) ) ( not ( = ?auto_1563935 ?auto_1563941 ) ) ( not ( = ?auto_1563935 ?auto_1563942 ) ) ( not ( = ?auto_1563935 ?auto_1563943 ) ) ( not ( = ?auto_1563936 ?auto_1563937 ) ) ( not ( = ?auto_1563936 ?auto_1563938 ) ) ( not ( = ?auto_1563936 ?auto_1563939 ) ) ( not ( = ?auto_1563936 ?auto_1563940 ) ) ( not ( = ?auto_1563936 ?auto_1563941 ) ) ( not ( = ?auto_1563936 ?auto_1563942 ) ) ( not ( = ?auto_1563936 ?auto_1563943 ) ) ( not ( = ?auto_1563937 ?auto_1563938 ) ) ( not ( = ?auto_1563937 ?auto_1563939 ) ) ( not ( = ?auto_1563937 ?auto_1563940 ) ) ( not ( = ?auto_1563937 ?auto_1563941 ) ) ( not ( = ?auto_1563937 ?auto_1563942 ) ) ( not ( = ?auto_1563937 ?auto_1563943 ) ) ( not ( = ?auto_1563938 ?auto_1563939 ) ) ( not ( = ?auto_1563938 ?auto_1563940 ) ) ( not ( = ?auto_1563938 ?auto_1563941 ) ) ( not ( = ?auto_1563938 ?auto_1563942 ) ) ( not ( = ?auto_1563938 ?auto_1563943 ) ) ( not ( = ?auto_1563939 ?auto_1563940 ) ) ( not ( = ?auto_1563939 ?auto_1563941 ) ) ( not ( = ?auto_1563939 ?auto_1563942 ) ) ( not ( = ?auto_1563939 ?auto_1563943 ) ) ( not ( = ?auto_1563940 ?auto_1563941 ) ) ( not ( = ?auto_1563940 ?auto_1563942 ) ) ( not ( = ?auto_1563940 ?auto_1563943 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1563941 ?auto_1563942 ?auto_1563943 )
      ( MAKE-13CRATE-VERIFY ?auto_1563930 ?auto_1563931 ?auto_1563932 ?auto_1563933 ?auto_1563934 ?auto_1563935 ?auto_1563936 ?auto_1563937 ?auto_1563938 ?auto_1563939 ?auto_1563940 ?auto_1563941 ?auto_1563942 ?auto_1563943 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1564112 - SURFACE
      ?auto_1564113 - SURFACE
      ?auto_1564114 - SURFACE
      ?auto_1564115 - SURFACE
      ?auto_1564116 - SURFACE
      ?auto_1564117 - SURFACE
      ?auto_1564118 - SURFACE
      ?auto_1564119 - SURFACE
      ?auto_1564120 - SURFACE
      ?auto_1564121 - SURFACE
      ?auto_1564122 - SURFACE
      ?auto_1564123 - SURFACE
      ?auto_1564124 - SURFACE
      ?auto_1564125 - SURFACE
    )
    :vars
    (
      ?auto_1564128 - HOIST
      ?auto_1564131 - PLACE
      ?auto_1564126 - TRUCK
      ?auto_1564130 - PLACE
      ?auto_1564129 - HOIST
      ?auto_1564127 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1564128 ?auto_1564131 ) ( SURFACE-AT ?auto_1564124 ?auto_1564131 ) ( CLEAR ?auto_1564124 ) ( IS-CRATE ?auto_1564125 ) ( not ( = ?auto_1564124 ?auto_1564125 ) ) ( AVAILABLE ?auto_1564128 ) ( ON ?auto_1564124 ?auto_1564123 ) ( not ( = ?auto_1564123 ?auto_1564124 ) ) ( not ( = ?auto_1564123 ?auto_1564125 ) ) ( TRUCK-AT ?auto_1564126 ?auto_1564130 ) ( not ( = ?auto_1564130 ?auto_1564131 ) ) ( HOIST-AT ?auto_1564129 ?auto_1564130 ) ( not ( = ?auto_1564128 ?auto_1564129 ) ) ( AVAILABLE ?auto_1564129 ) ( SURFACE-AT ?auto_1564125 ?auto_1564130 ) ( ON ?auto_1564125 ?auto_1564127 ) ( CLEAR ?auto_1564125 ) ( not ( = ?auto_1564124 ?auto_1564127 ) ) ( not ( = ?auto_1564125 ?auto_1564127 ) ) ( not ( = ?auto_1564123 ?auto_1564127 ) ) ( ON ?auto_1564113 ?auto_1564112 ) ( ON ?auto_1564114 ?auto_1564113 ) ( ON ?auto_1564115 ?auto_1564114 ) ( ON ?auto_1564116 ?auto_1564115 ) ( ON ?auto_1564117 ?auto_1564116 ) ( ON ?auto_1564118 ?auto_1564117 ) ( ON ?auto_1564119 ?auto_1564118 ) ( ON ?auto_1564120 ?auto_1564119 ) ( ON ?auto_1564121 ?auto_1564120 ) ( ON ?auto_1564122 ?auto_1564121 ) ( ON ?auto_1564123 ?auto_1564122 ) ( not ( = ?auto_1564112 ?auto_1564113 ) ) ( not ( = ?auto_1564112 ?auto_1564114 ) ) ( not ( = ?auto_1564112 ?auto_1564115 ) ) ( not ( = ?auto_1564112 ?auto_1564116 ) ) ( not ( = ?auto_1564112 ?auto_1564117 ) ) ( not ( = ?auto_1564112 ?auto_1564118 ) ) ( not ( = ?auto_1564112 ?auto_1564119 ) ) ( not ( = ?auto_1564112 ?auto_1564120 ) ) ( not ( = ?auto_1564112 ?auto_1564121 ) ) ( not ( = ?auto_1564112 ?auto_1564122 ) ) ( not ( = ?auto_1564112 ?auto_1564123 ) ) ( not ( = ?auto_1564112 ?auto_1564124 ) ) ( not ( = ?auto_1564112 ?auto_1564125 ) ) ( not ( = ?auto_1564112 ?auto_1564127 ) ) ( not ( = ?auto_1564113 ?auto_1564114 ) ) ( not ( = ?auto_1564113 ?auto_1564115 ) ) ( not ( = ?auto_1564113 ?auto_1564116 ) ) ( not ( = ?auto_1564113 ?auto_1564117 ) ) ( not ( = ?auto_1564113 ?auto_1564118 ) ) ( not ( = ?auto_1564113 ?auto_1564119 ) ) ( not ( = ?auto_1564113 ?auto_1564120 ) ) ( not ( = ?auto_1564113 ?auto_1564121 ) ) ( not ( = ?auto_1564113 ?auto_1564122 ) ) ( not ( = ?auto_1564113 ?auto_1564123 ) ) ( not ( = ?auto_1564113 ?auto_1564124 ) ) ( not ( = ?auto_1564113 ?auto_1564125 ) ) ( not ( = ?auto_1564113 ?auto_1564127 ) ) ( not ( = ?auto_1564114 ?auto_1564115 ) ) ( not ( = ?auto_1564114 ?auto_1564116 ) ) ( not ( = ?auto_1564114 ?auto_1564117 ) ) ( not ( = ?auto_1564114 ?auto_1564118 ) ) ( not ( = ?auto_1564114 ?auto_1564119 ) ) ( not ( = ?auto_1564114 ?auto_1564120 ) ) ( not ( = ?auto_1564114 ?auto_1564121 ) ) ( not ( = ?auto_1564114 ?auto_1564122 ) ) ( not ( = ?auto_1564114 ?auto_1564123 ) ) ( not ( = ?auto_1564114 ?auto_1564124 ) ) ( not ( = ?auto_1564114 ?auto_1564125 ) ) ( not ( = ?auto_1564114 ?auto_1564127 ) ) ( not ( = ?auto_1564115 ?auto_1564116 ) ) ( not ( = ?auto_1564115 ?auto_1564117 ) ) ( not ( = ?auto_1564115 ?auto_1564118 ) ) ( not ( = ?auto_1564115 ?auto_1564119 ) ) ( not ( = ?auto_1564115 ?auto_1564120 ) ) ( not ( = ?auto_1564115 ?auto_1564121 ) ) ( not ( = ?auto_1564115 ?auto_1564122 ) ) ( not ( = ?auto_1564115 ?auto_1564123 ) ) ( not ( = ?auto_1564115 ?auto_1564124 ) ) ( not ( = ?auto_1564115 ?auto_1564125 ) ) ( not ( = ?auto_1564115 ?auto_1564127 ) ) ( not ( = ?auto_1564116 ?auto_1564117 ) ) ( not ( = ?auto_1564116 ?auto_1564118 ) ) ( not ( = ?auto_1564116 ?auto_1564119 ) ) ( not ( = ?auto_1564116 ?auto_1564120 ) ) ( not ( = ?auto_1564116 ?auto_1564121 ) ) ( not ( = ?auto_1564116 ?auto_1564122 ) ) ( not ( = ?auto_1564116 ?auto_1564123 ) ) ( not ( = ?auto_1564116 ?auto_1564124 ) ) ( not ( = ?auto_1564116 ?auto_1564125 ) ) ( not ( = ?auto_1564116 ?auto_1564127 ) ) ( not ( = ?auto_1564117 ?auto_1564118 ) ) ( not ( = ?auto_1564117 ?auto_1564119 ) ) ( not ( = ?auto_1564117 ?auto_1564120 ) ) ( not ( = ?auto_1564117 ?auto_1564121 ) ) ( not ( = ?auto_1564117 ?auto_1564122 ) ) ( not ( = ?auto_1564117 ?auto_1564123 ) ) ( not ( = ?auto_1564117 ?auto_1564124 ) ) ( not ( = ?auto_1564117 ?auto_1564125 ) ) ( not ( = ?auto_1564117 ?auto_1564127 ) ) ( not ( = ?auto_1564118 ?auto_1564119 ) ) ( not ( = ?auto_1564118 ?auto_1564120 ) ) ( not ( = ?auto_1564118 ?auto_1564121 ) ) ( not ( = ?auto_1564118 ?auto_1564122 ) ) ( not ( = ?auto_1564118 ?auto_1564123 ) ) ( not ( = ?auto_1564118 ?auto_1564124 ) ) ( not ( = ?auto_1564118 ?auto_1564125 ) ) ( not ( = ?auto_1564118 ?auto_1564127 ) ) ( not ( = ?auto_1564119 ?auto_1564120 ) ) ( not ( = ?auto_1564119 ?auto_1564121 ) ) ( not ( = ?auto_1564119 ?auto_1564122 ) ) ( not ( = ?auto_1564119 ?auto_1564123 ) ) ( not ( = ?auto_1564119 ?auto_1564124 ) ) ( not ( = ?auto_1564119 ?auto_1564125 ) ) ( not ( = ?auto_1564119 ?auto_1564127 ) ) ( not ( = ?auto_1564120 ?auto_1564121 ) ) ( not ( = ?auto_1564120 ?auto_1564122 ) ) ( not ( = ?auto_1564120 ?auto_1564123 ) ) ( not ( = ?auto_1564120 ?auto_1564124 ) ) ( not ( = ?auto_1564120 ?auto_1564125 ) ) ( not ( = ?auto_1564120 ?auto_1564127 ) ) ( not ( = ?auto_1564121 ?auto_1564122 ) ) ( not ( = ?auto_1564121 ?auto_1564123 ) ) ( not ( = ?auto_1564121 ?auto_1564124 ) ) ( not ( = ?auto_1564121 ?auto_1564125 ) ) ( not ( = ?auto_1564121 ?auto_1564127 ) ) ( not ( = ?auto_1564122 ?auto_1564123 ) ) ( not ( = ?auto_1564122 ?auto_1564124 ) ) ( not ( = ?auto_1564122 ?auto_1564125 ) ) ( not ( = ?auto_1564122 ?auto_1564127 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1564123 ?auto_1564124 ?auto_1564125 )
      ( MAKE-13CRATE-VERIFY ?auto_1564112 ?auto_1564113 ?auto_1564114 ?auto_1564115 ?auto_1564116 ?auto_1564117 ?auto_1564118 ?auto_1564119 ?auto_1564120 ?auto_1564121 ?auto_1564122 ?auto_1564123 ?auto_1564124 ?auto_1564125 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1564295 - SURFACE
      ?auto_1564296 - SURFACE
      ?auto_1564297 - SURFACE
      ?auto_1564298 - SURFACE
      ?auto_1564299 - SURFACE
      ?auto_1564300 - SURFACE
      ?auto_1564301 - SURFACE
      ?auto_1564302 - SURFACE
      ?auto_1564303 - SURFACE
      ?auto_1564304 - SURFACE
      ?auto_1564305 - SURFACE
      ?auto_1564306 - SURFACE
      ?auto_1564307 - SURFACE
      ?auto_1564308 - SURFACE
    )
    :vars
    (
      ?auto_1564311 - HOIST
      ?auto_1564309 - PLACE
      ?auto_1564310 - PLACE
      ?auto_1564312 - HOIST
      ?auto_1564314 - SURFACE
      ?auto_1564313 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1564311 ?auto_1564309 ) ( SURFACE-AT ?auto_1564307 ?auto_1564309 ) ( CLEAR ?auto_1564307 ) ( IS-CRATE ?auto_1564308 ) ( not ( = ?auto_1564307 ?auto_1564308 ) ) ( AVAILABLE ?auto_1564311 ) ( ON ?auto_1564307 ?auto_1564306 ) ( not ( = ?auto_1564306 ?auto_1564307 ) ) ( not ( = ?auto_1564306 ?auto_1564308 ) ) ( not ( = ?auto_1564310 ?auto_1564309 ) ) ( HOIST-AT ?auto_1564312 ?auto_1564310 ) ( not ( = ?auto_1564311 ?auto_1564312 ) ) ( AVAILABLE ?auto_1564312 ) ( SURFACE-AT ?auto_1564308 ?auto_1564310 ) ( ON ?auto_1564308 ?auto_1564314 ) ( CLEAR ?auto_1564308 ) ( not ( = ?auto_1564307 ?auto_1564314 ) ) ( not ( = ?auto_1564308 ?auto_1564314 ) ) ( not ( = ?auto_1564306 ?auto_1564314 ) ) ( TRUCK-AT ?auto_1564313 ?auto_1564309 ) ( ON ?auto_1564296 ?auto_1564295 ) ( ON ?auto_1564297 ?auto_1564296 ) ( ON ?auto_1564298 ?auto_1564297 ) ( ON ?auto_1564299 ?auto_1564298 ) ( ON ?auto_1564300 ?auto_1564299 ) ( ON ?auto_1564301 ?auto_1564300 ) ( ON ?auto_1564302 ?auto_1564301 ) ( ON ?auto_1564303 ?auto_1564302 ) ( ON ?auto_1564304 ?auto_1564303 ) ( ON ?auto_1564305 ?auto_1564304 ) ( ON ?auto_1564306 ?auto_1564305 ) ( not ( = ?auto_1564295 ?auto_1564296 ) ) ( not ( = ?auto_1564295 ?auto_1564297 ) ) ( not ( = ?auto_1564295 ?auto_1564298 ) ) ( not ( = ?auto_1564295 ?auto_1564299 ) ) ( not ( = ?auto_1564295 ?auto_1564300 ) ) ( not ( = ?auto_1564295 ?auto_1564301 ) ) ( not ( = ?auto_1564295 ?auto_1564302 ) ) ( not ( = ?auto_1564295 ?auto_1564303 ) ) ( not ( = ?auto_1564295 ?auto_1564304 ) ) ( not ( = ?auto_1564295 ?auto_1564305 ) ) ( not ( = ?auto_1564295 ?auto_1564306 ) ) ( not ( = ?auto_1564295 ?auto_1564307 ) ) ( not ( = ?auto_1564295 ?auto_1564308 ) ) ( not ( = ?auto_1564295 ?auto_1564314 ) ) ( not ( = ?auto_1564296 ?auto_1564297 ) ) ( not ( = ?auto_1564296 ?auto_1564298 ) ) ( not ( = ?auto_1564296 ?auto_1564299 ) ) ( not ( = ?auto_1564296 ?auto_1564300 ) ) ( not ( = ?auto_1564296 ?auto_1564301 ) ) ( not ( = ?auto_1564296 ?auto_1564302 ) ) ( not ( = ?auto_1564296 ?auto_1564303 ) ) ( not ( = ?auto_1564296 ?auto_1564304 ) ) ( not ( = ?auto_1564296 ?auto_1564305 ) ) ( not ( = ?auto_1564296 ?auto_1564306 ) ) ( not ( = ?auto_1564296 ?auto_1564307 ) ) ( not ( = ?auto_1564296 ?auto_1564308 ) ) ( not ( = ?auto_1564296 ?auto_1564314 ) ) ( not ( = ?auto_1564297 ?auto_1564298 ) ) ( not ( = ?auto_1564297 ?auto_1564299 ) ) ( not ( = ?auto_1564297 ?auto_1564300 ) ) ( not ( = ?auto_1564297 ?auto_1564301 ) ) ( not ( = ?auto_1564297 ?auto_1564302 ) ) ( not ( = ?auto_1564297 ?auto_1564303 ) ) ( not ( = ?auto_1564297 ?auto_1564304 ) ) ( not ( = ?auto_1564297 ?auto_1564305 ) ) ( not ( = ?auto_1564297 ?auto_1564306 ) ) ( not ( = ?auto_1564297 ?auto_1564307 ) ) ( not ( = ?auto_1564297 ?auto_1564308 ) ) ( not ( = ?auto_1564297 ?auto_1564314 ) ) ( not ( = ?auto_1564298 ?auto_1564299 ) ) ( not ( = ?auto_1564298 ?auto_1564300 ) ) ( not ( = ?auto_1564298 ?auto_1564301 ) ) ( not ( = ?auto_1564298 ?auto_1564302 ) ) ( not ( = ?auto_1564298 ?auto_1564303 ) ) ( not ( = ?auto_1564298 ?auto_1564304 ) ) ( not ( = ?auto_1564298 ?auto_1564305 ) ) ( not ( = ?auto_1564298 ?auto_1564306 ) ) ( not ( = ?auto_1564298 ?auto_1564307 ) ) ( not ( = ?auto_1564298 ?auto_1564308 ) ) ( not ( = ?auto_1564298 ?auto_1564314 ) ) ( not ( = ?auto_1564299 ?auto_1564300 ) ) ( not ( = ?auto_1564299 ?auto_1564301 ) ) ( not ( = ?auto_1564299 ?auto_1564302 ) ) ( not ( = ?auto_1564299 ?auto_1564303 ) ) ( not ( = ?auto_1564299 ?auto_1564304 ) ) ( not ( = ?auto_1564299 ?auto_1564305 ) ) ( not ( = ?auto_1564299 ?auto_1564306 ) ) ( not ( = ?auto_1564299 ?auto_1564307 ) ) ( not ( = ?auto_1564299 ?auto_1564308 ) ) ( not ( = ?auto_1564299 ?auto_1564314 ) ) ( not ( = ?auto_1564300 ?auto_1564301 ) ) ( not ( = ?auto_1564300 ?auto_1564302 ) ) ( not ( = ?auto_1564300 ?auto_1564303 ) ) ( not ( = ?auto_1564300 ?auto_1564304 ) ) ( not ( = ?auto_1564300 ?auto_1564305 ) ) ( not ( = ?auto_1564300 ?auto_1564306 ) ) ( not ( = ?auto_1564300 ?auto_1564307 ) ) ( not ( = ?auto_1564300 ?auto_1564308 ) ) ( not ( = ?auto_1564300 ?auto_1564314 ) ) ( not ( = ?auto_1564301 ?auto_1564302 ) ) ( not ( = ?auto_1564301 ?auto_1564303 ) ) ( not ( = ?auto_1564301 ?auto_1564304 ) ) ( not ( = ?auto_1564301 ?auto_1564305 ) ) ( not ( = ?auto_1564301 ?auto_1564306 ) ) ( not ( = ?auto_1564301 ?auto_1564307 ) ) ( not ( = ?auto_1564301 ?auto_1564308 ) ) ( not ( = ?auto_1564301 ?auto_1564314 ) ) ( not ( = ?auto_1564302 ?auto_1564303 ) ) ( not ( = ?auto_1564302 ?auto_1564304 ) ) ( not ( = ?auto_1564302 ?auto_1564305 ) ) ( not ( = ?auto_1564302 ?auto_1564306 ) ) ( not ( = ?auto_1564302 ?auto_1564307 ) ) ( not ( = ?auto_1564302 ?auto_1564308 ) ) ( not ( = ?auto_1564302 ?auto_1564314 ) ) ( not ( = ?auto_1564303 ?auto_1564304 ) ) ( not ( = ?auto_1564303 ?auto_1564305 ) ) ( not ( = ?auto_1564303 ?auto_1564306 ) ) ( not ( = ?auto_1564303 ?auto_1564307 ) ) ( not ( = ?auto_1564303 ?auto_1564308 ) ) ( not ( = ?auto_1564303 ?auto_1564314 ) ) ( not ( = ?auto_1564304 ?auto_1564305 ) ) ( not ( = ?auto_1564304 ?auto_1564306 ) ) ( not ( = ?auto_1564304 ?auto_1564307 ) ) ( not ( = ?auto_1564304 ?auto_1564308 ) ) ( not ( = ?auto_1564304 ?auto_1564314 ) ) ( not ( = ?auto_1564305 ?auto_1564306 ) ) ( not ( = ?auto_1564305 ?auto_1564307 ) ) ( not ( = ?auto_1564305 ?auto_1564308 ) ) ( not ( = ?auto_1564305 ?auto_1564314 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1564306 ?auto_1564307 ?auto_1564308 )
      ( MAKE-13CRATE-VERIFY ?auto_1564295 ?auto_1564296 ?auto_1564297 ?auto_1564298 ?auto_1564299 ?auto_1564300 ?auto_1564301 ?auto_1564302 ?auto_1564303 ?auto_1564304 ?auto_1564305 ?auto_1564306 ?auto_1564307 ?auto_1564308 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1564478 - SURFACE
      ?auto_1564479 - SURFACE
      ?auto_1564480 - SURFACE
      ?auto_1564481 - SURFACE
      ?auto_1564482 - SURFACE
      ?auto_1564483 - SURFACE
      ?auto_1564484 - SURFACE
      ?auto_1564485 - SURFACE
      ?auto_1564486 - SURFACE
      ?auto_1564487 - SURFACE
      ?auto_1564488 - SURFACE
      ?auto_1564489 - SURFACE
      ?auto_1564490 - SURFACE
      ?auto_1564491 - SURFACE
    )
    :vars
    (
      ?auto_1564492 - HOIST
      ?auto_1564496 - PLACE
      ?auto_1564495 - PLACE
      ?auto_1564497 - HOIST
      ?auto_1564494 - SURFACE
      ?auto_1564493 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1564492 ?auto_1564496 ) ( IS-CRATE ?auto_1564491 ) ( not ( = ?auto_1564490 ?auto_1564491 ) ) ( not ( = ?auto_1564489 ?auto_1564490 ) ) ( not ( = ?auto_1564489 ?auto_1564491 ) ) ( not ( = ?auto_1564495 ?auto_1564496 ) ) ( HOIST-AT ?auto_1564497 ?auto_1564495 ) ( not ( = ?auto_1564492 ?auto_1564497 ) ) ( AVAILABLE ?auto_1564497 ) ( SURFACE-AT ?auto_1564491 ?auto_1564495 ) ( ON ?auto_1564491 ?auto_1564494 ) ( CLEAR ?auto_1564491 ) ( not ( = ?auto_1564490 ?auto_1564494 ) ) ( not ( = ?auto_1564491 ?auto_1564494 ) ) ( not ( = ?auto_1564489 ?auto_1564494 ) ) ( TRUCK-AT ?auto_1564493 ?auto_1564496 ) ( SURFACE-AT ?auto_1564489 ?auto_1564496 ) ( CLEAR ?auto_1564489 ) ( LIFTING ?auto_1564492 ?auto_1564490 ) ( IS-CRATE ?auto_1564490 ) ( ON ?auto_1564479 ?auto_1564478 ) ( ON ?auto_1564480 ?auto_1564479 ) ( ON ?auto_1564481 ?auto_1564480 ) ( ON ?auto_1564482 ?auto_1564481 ) ( ON ?auto_1564483 ?auto_1564482 ) ( ON ?auto_1564484 ?auto_1564483 ) ( ON ?auto_1564485 ?auto_1564484 ) ( ON ?auto_1564486 ?auto_1564485 ) ( ON ?auto_1564487 ?auto_1564486 ) ( ON ?auto_1564488 ?auto_1564487 ) ( ON ?auto_1564489 ?auto_1564488 ) ( not ( = ?auto_1564478 ?auto_1564479 ) ) ( not ( = ?auto_1564478 ?auto_1564480 ) ) ( not ( = ?auto_1564478 ?auto_1564481 ) ) ( not ( = ?auto_1564478 ?auto_1564482 ) ) ( not ( = ?auto_1564478 ?auto_1564483 ) ) ( not ( = ?auto_1564478 ?auto_1564484 ) ) ( not ( = ?auto_1564478 ?auto_1564485 ) ) ( not ( = ?auto_1564478 ?auto_1564486 ) ) ( not ( = ?auto_1564478 ?auto_1564487 ) ) ( not ( = ?auto_1564478 ?auto_1564488 ) ) ( not ( = ?auto_1564478 ?auto_1564489 ) ) ( not ( = ?auto_1564478 ?auto_1564490 ) ) ( not ( = ?auto_1564478 ?auto_1564491 ) ) ( not ( = ?auto_1564478 ?auto_1564494 ) ) ( not ( = ?auto_1564479 ?auto_1564480 ) ) ( not ( = ?auto_1564479 ?auto_1564481 ) ) ( not ( = ?auto_1564479 ?auto_1564482 ) ) ( not ( = ?auto_1564479 ?auto_1564483 ) ) ( not ( = ?auto_1564479 ?auto_1564484 ) ) ( not ( = ?auto_1564479 ?auto_1564485 ) ) ( not ( = ?auto_1564479 ?auto_1564486 ) ) ( not ( = ?auto_1564479 ?auto_1564487 ) ) ( not ( = ?auto_1564479 ?auto_1564488 ) ) ( not ( = ?auto_1564479 ?auto_1564489 ) ) ( not ( = ?auto_1564479 ?auto_1564490 ) ) ( not ( = ?auto_1564479 ?auto_1564491 ) ) ( not ( = ?auto_1564479 ?auto_1564494 ) ) ( not ( = ?auto_1564480 ?auto_1564481 ) ) ( not ( = ?auto_1564480 ?auto_1564482 ) ) ( not ( = ?auto_1564480 ?auto_1564483 ) ) ( not ( = ?auto_1564480 ?auto_1564484 ) ) ( not ( = ?auto_1564480 ?auto_1564485 ) ) ( not ( = ?auto_1564480 ?auto_1564486 ) ) ( not ( = ?auto_1564480 ?auto_1564487 ) ) ( not ( = ?auto_1564480 ?auto_1564488 ) ) ( not ( = ?auto_1564480 ?auto_1564489 ) ) ( not ( = ?auto_1564480 ?auto_1564490 ) ) ( not ( = ?auto_1564480 ?auto_1564491 ) ) ( not ( = ?auto_1564480 ?auto_1564494 ) ) ( not ( = ?auto_1564481 ?auto_1564482 ) ) ( not ( = ?auto_1564481 ?auto_1564483 ) ) ( not ( = ?auto_1564481 ?auto_1564484 ) ) ( not ( = ?auto_1564481 ?auto_1564485 ) ) ( not ( = ?auto_1564481 ?auto_1564486 ) ) ( not ( = ?auto_1564481 ?auto_1564487 ) ) ( not ( = ?auto_1564481 ?auto_1564488 ) ) ( not ( = ?auto_1564481 ?auto_1564489 ) ) ( not ( = ?auto_1564481 ?auto_1564490 ) ) ( not ( = ?auto_1564481 ?auto_1564491 ) ) ( not ( = ?auto_1564481 ?auto_1564494 ) ) ( not ( = ?auto_1564482 ?auto_1564483 ) ) ( not ( = ?auto_1564482 ?auto_1564484 ) ) ( not ( = ?auto_1564482 ?auto_1564485 ) ) ( not ( = ?auto_1564482 ?auto_1564486 ) ) ( not ( = ?auto_1564482 ?auto_1564487 ) ) ( not ( = ?auto_1564482 ?auto_1564488 ) ) ( not ( = ?auto_1564482 ?auto_1564489 ) ) ( not ( = ?auto_1564482 ?auto_1564490 ) ) ( not ( = ?auto_1564482 ?auto_1564491 ) ) ( not ( = ?auto_1564482 ?auto_1564494 ) ) ( not ( = ?auto_1564483 ?auto_1564484 ) ) ( not ( = ?auto_1564483 ?auto_1564485 ) ) ( not ( = ?auto_1564483 ?auto_1564486 ) ) ( not ( = ?auto_1564483 ?auto_1564487 ) ) ( not ( = ?auto_1564483 ?auto_1564488 ) ) ( not ( = ?auto_1564483 ?auto_1564489 ) ) ( not ( = ?auto_1564483 ?auto_1564490 ) ) ( not ( = ?auto_1564483 ?auto_1564491 ) ) ( not ( = ?auto_1564483 ?auto_1564494 ) ) ( not ( = ?auto_1564484 ?auto_1564485 ) ) ( not ( = ?auto_1564484 ?auto_1564486 ) ) ( not ( = ?auto_1564484 ?auto_1564487 ) ) ( not ( = ?auto_1564484 ?auto_1564488 ) ) ( not ( = ?auto_1564484 ?auto_1564489 ) ) ( not ( = ?auto_1564484 ?auto_1564490 ) ) ( not ( = ?auto_1564484 ?auto_1564491 ) ) ( not ( = ?auto_1564484 ?auto_1564494 ) ) ( not ( = ?auto_1564485 ?auto_1564486 ) ) ( not ( = ?auto_1564485 ?auto_1564487 ) ) ( not ( = ?auto_1564485 ?auto_1564488 ) ) ( not ( = ?auto_1564485 ?auto_1564489 ) ) ( not ( = ?auto_1564485 ?auto_1564490 ) ) ( not ( = ?auto_1564485 ?auto_1564491 ) ) ( not ( = ?auto_1564485 ?auto_1564494 ) ) ( not ( = ?auto_1564486 ?auto_1564487 ) ) ( not ( = ?auto_1564486 ?auto_1564488 ) ) ( not ( = ?auto_1564486 ?auto_1564489 ) ) ( not ( = ?auto_1564486 ?auto_1564490 ) ) ( not ( = ?auto_1564486 ?auto_1564491 ) ) ( not ( = ?auto_1564486 ?auto_1564494 ) ) ( not ( = ?auto_1564487 ?auto_1564488 ) ) ( not ( = ?auto_1564487 ?auto_1564489 ) ) ( not ( = ?auto_1564487 ?auto_1564490 ) ) ( not ( = ?auto_1564487 ?auto_1564491 ) ) ( not ( = ?auto_1564487 ?auto_1564494 ) ) ( not ( = ?auto_1564488 ?auto_1564489 ) ) ( not ( = ?auto_1564488 ?auto_1564490 ) ) ( not ( = ?auto_1564488 ?auto_1564491 ) ) ( not ( = ?auto_1564488 ?auto_1564494 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1564489 ?auto_1564490 ?auto_1564491 )
      ( MAKE-13CRATE-VERIFY ?auto_1564478 ?auto_1564479 ?auto_1564480 ?auto_1564481 ?auto_1564482 ?auto_1564483 ?auto_1564484 ?auto_1564485 ?auto_1564486 ?auto_1564487 ?auto_1564488 ?auto_1564489 ?auto_1564490 ?auto_1564491 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1564661 - SURFACE
      ?auto_1564662 - SURFACE
      ?auto_1564663 - SURFACE
      ?auto_1564664 - SURFACE
      ?auto_1564665 - SURFACE
      ?auto_1564666 - SURFACE
      ?auto_1564667 - SURFACE
      ?auto_1564668 - SURFACE
      ?auto_1564669 - SURFACE
      ?auto_1564670 - SURFACE
      ?auto_1564671 - SURFACE
      ?auto_1564672 - SURFACE
      ?auto_1564673 - SURFACE
      ?auto_1564674 - SURFACE
    )
    :vars
    (
      ?auto_1564679 - HOIST
      ?auto_1564678 - PLACE
      ?auto_1564677 - PLACE
      ?auto_1564675 - HOIST
      ?auto_1564676 - SURFACE
      ?auto_1564680 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1564679 ?auto_1564678 ) ( IS-CRATE ?auto_1564674 ) ( not ( = ?auto_1564673 ?auto_1564674 ) ) ( not ( = ?auto_1564672 ?auto_1564673 ) ) ( not ( = ?auto_1564672 ?auto_1564674 ) ) ( not ( = ?auto_1564677 ?auto_1564678 ) ) ( HOIST-AT ?auto_1564675 ?auto_1564677 ) ( not ( = ?auto_1564679 ?auto_1564675 ) ) ( AVAILABLE ?auto_1564675 ) ( SURFACE-AT ?auto_1564674 ?auto_1564677 ) ( ON ?auto_1564674 ?auto_1564676 ) ( CLEAR ?auto_1564674 ) ( not ( = ?auto_1564673 ?auto_1564676 ) ) ( not ( = ?auto_1564674 ?auto_1564676 ) ) ( not ( = ?auto_1564672 ?auto_1564676 ) ) ( TRUCK-AT ?auto_1564680 ?auto_1564678 ) ( SURFACE-AT ?auto_1564672 ?auto_1564678 ) ( CLEAR ?auto_1564672 ) ( IS-CRATE ?auto_1564673 ) ( AVAILABLE ?auto_1564679 ) ( IN ?auto_1564673 ?auto_1564680 ) ( ON ?auto_1564662 ?auto_1564661 ) ( ON ?auto_1564663 ?auto_1564662 ) ( ON ?auto_1564664 ?auto_1564663 ) ( ON ?auto_1564665 ?auto_1564664 ) ( ON ?auto_1564666 ?auto_1564665 ) ( ON ?auto_1564667 ?auto_1564666 ) ( ON ?auto_1564668 ?auto_1564667 ) ( ON ?auto_1564669 ?auto_1564668 ) ( ON ?auto_1564670 ?auto_1564669 ) ( ON ?auto_1564671 ?auto_1564670 ) ( ON ?auto_1564672 ?auto_1564671 ) ( not ( = ?auto_1564661 ?auto_1564662 ) ) ( not ( = ?auto_1564661 ?auto_1564663 ) ) ( not ( = ?auto_1564661 ?auto_1564664 ) ) ( not ( = ?auto_1564661 ?auto_1564665 ) ) ( not ( = ?auto_1564661 ?auto_1564666 ) ) ( not ( = ?auto_1564661 ?auto_1564667 ) ) ( not ( = ?auto_1564661 ?auto_1564668 ) ) ( not ( = ?auto_1564661 ?auto_1564669 ) ) ( not ( = ?auto_1564661 ?auto_1564670 ) ) ( not ( = ?auto_1564661 ?auto_1564671 ) ) ( not ( = ?auto_1564661 ?auto_1564672 ) ) ( not ( = ?auto_1564661 ?auto_1564673 ) ) ( not ( = ?auto_1564661 ?auto_1564674 ) ) ( not ( = ?auto_1564661 ?auto_1564676 ) ) ( not ( = ?auto_1564662 ?auto_1564663 ) ) ( not ( = ?auto_1564662 ?auto_1564664 ) ) ( not ( = ?auto_1564662 ?auto_1564665 ) ) ( not ( = ?auto_1564662 ?auto_1564666 ) ) ( not ( = ?auto_1564662 ?auto_1564667 ) ) ( not ( = ?auto_1564662 ?auto_1564668 ) ) ( not ( = ?auto_1564662 ?auto_1564669 ) ) ( not ( = ?auto_1564662 ?auto_1564670 ) ) ( not ( = ?auto_1564662 ?auto_1564671 ) ) ( not ( = ?auto_1564662 ?auto_1564672 ) ) ( not ( = ?auto_1564662 ?auto_1564673 ) ) ( not ( = ?auto_1564662 ?auto_1564674 ) ) ( not ( = ?auto_1564662 ?auto_1564676 ) ) ( not ( = ?auto_1564663 ?auto_1564664 ) ) ( not ( = ?auto_1564663 ?auto_1564665 ) ) ( not ( = ?auto_1564663 ?auto_1564666 ) ) ( not ( = ?auto_1564663 ?auto_1564667 ) ) ( not ( = ?auto_1564663 ?auto_1564668 ) ) ( not ( = ?auto_1564663 ?auto_1564669 ) ) ( not ( = ?auto_1564663 ?auto_1564670 ) ) ( not ( = ?auto_1564663 ?auto_1564671 ) ) ( not ( = ?auto_1564663 ?auto_1564672 ) ) ( not ( = ?auto_1564663 ?auto_1564673 ) ) ( not ( = ?auto_1564663 ?auto_1564674 ) ) ( not ( = ?auto_1564663 ?auto_1564676 ) ) ( not ( = ?auto_1564664 ?auto_1564665 ) ) ( not ( = ?auto_1564664 ?auto_1564666 ) ) ( not ( = ?auto_1564664 ?auto_1564667 ) ) ( not ( = ?auto_1564664 ?auto_1564668 ) ) ( not ( = ?auto_1564664 ?auto_1564669 ) ) ( not ( = ?auto_1564664 ?auto_1564670 ) ) ( not ( = ?auto_1564664 ?auto_1564671 ) ) ( not ( = ?auto_1564664 ?auto_1564672 ) ) ( not ( = ?auto_1564664 ?auto_1564673 ) ) ( not ( = ?auto_1564664 ?auto_1564674 ) ) ( not ( = ?auto_1564664 ?auto_1564676 ) ) ( not ( = ?auto_1564665 ?auto_1564666 ) ) ( not ( = ?auto_1564665 ?auto_1564667 ) ) ( not ( = ?auto_1564665 ?auto_1564668 ) ) ( not ( = ?auto_1564665 ?auto_1564669 ) ) ( not ( = ?auto_1564665 ?auto_1564670 ) ) ( not ( = ?auto_1564665 ?auto_1564671 ) ) ( not ( = ?auto_1564665 ?auto_1564672 ) ) ( not ( = ?auto_1564665 ?auto_1564673 ) ) ( not ( = ?auto_1564665 ?auto_1564674 ) ) ( not ( = ?auto_1564665 ?auto_1564676 ) ) ( not ( = ?auto_1564666 ?auto_1564667 ) ) ( not ( = ?auto_1564666 ?auto_1564668 ) ) ( not ( = ?auto_1564666 ?auto_1564669 ) ) ( not ( = ?auto_1564666 ?auto_1564670 ) ) ( not ( = ?auto_1564666 ?auto_1564671 ) ) ( not ( = ?auto_1564666 ?auto_1564672 ) ) ( not ( = ?auto_1564666 ?auto_1564673 ) ) ( not ( = ?auto_1564666 ?auto_1564674 ) ) ( not ( = ?auto_1564666 ?auto_1564676 ) ) ( not ( = ?auto_1564667 ?auto_1564668 ) ) ( not ( = ?auto_1564667 ?auto_1564669 ) ) ( not ( = ?auto_1564667 ?auto_1564670 ) ) ( not ( = ?auto_1564667 ?auto_1564671 ) ) ( not ( = ?auto_1564667 ?auto_1564672 ) ) ( not ( = ?auto_1564667 ?auto_1564673 ) ) ( not ( = ?auto_1564667 ?auto_1564674 ) ) ( not ( = ?auto_1564667 ?auto_1564676 ) ) ( not ( = ?auto_1564668 ?auto_1564669 ) ) ( not ( = ?auto_1564668 ?auto_1564670 ) ) ( not ( = ?auto_1564668 ?auto_1564671 ) ) ( not ( = ?auto_1564668 ?auto_1564672 ) ) ( not ( = ?auto_1564668 ?auto_1564673 ) ) ( not ( = ?auto_1564668 ?auto_1564674 ) ) ( not ( = ?auto_1564668 ?auto_1564676 ) ) ( not ( = ?auto_1564669 ?auto_1564670 ) ) ( not ( = ?auto_1564669 ?auto_1564671 ) ) ( not ( = ?auto_1564669 ?auto_1564672 ) ) ( not ( = ?auto_1564669 ?auto_1564673 ) ) ( not ( = ?auto_1564669 ?auto_1564674 ) ) ( not ( = ?auto_1564669 ?auto_1564676 ) ) ( not ( = ?auto_1564670 ?auto_1564671 ) ) ( not ( = ?auto_1564670 ?auto_1564672 ) ) ( not ( = ?auto_1564670 ?auto_1564673 ) ) ( not ( = ?auto_1564670 ?auto_1564674 ) ) ( not ( = ?auto_1564670 ?auto_1564676 ) ) ( not ( = ?auto_1564671 ?auto_1564672 ) ) ( not ( = ?auto_1564671 ?auto_1564673 ) ) ( not ( = ?auto_1564671 ?auto_1564674 ) ) ( not ( = ?auto_1564671 ?auto_1564676 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1564672 ?auto_1564673 ?auto_1564674 )
      ( MAKE-13CRATE-VERIFY ?auto_1564661 ?auto_1564662 ?auto_1564663 ?auto_1564664 ?auto_1564665 ?auto_1564666 ?auto_1564667 ?auto_1564668 ?auto_1564669 ?auto_1564670 ?auto_1564671 ?auto_1564672 ?auto_1564673 ?auto_1564674 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1564681 - SURFACE
      ?auto_1564682 - SURFACE
    )
    :vars
    (
      ?auto_1564687 - HOIST
      ?auto_1564686 - PLACE
      ?auto_1564689 - SURFACE
      ?auto_1564685 - PLACE
      ?auto_1564683 - HOIST
      ?auto_1564684 - SURFACE
      ?auto_1564688 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1564687 ?auto_1564686 ) ( IS-CRATE ?auto_1564682 ) ( not ( = ?auto_1564681 ?auto_1564682 ) ) ( not ( = ?auto_1564689 ?auto_1564681 ) ) ( not ( = ?auto_1564689 ?auto_1564682 ) ) ( not ( = ?auto_1564685 ?auto_1564686 ) ) ( HOIST-AT ?auto_1564683 ?auto_1564685 ) ( not ( = ?auto_1564687 ?auto_1564683 ) ) ( AVAILABLE ?auto_1564683 ) ( SURFACE-AT ?auto_1564682 ?auto_1564685 ) ( ON ?auto_1564682 ?auto_1564684 ) ( CLEAR ?auto_1564682 ) ( not ( = ?auto_1564681 ?auto_1564684 ) ) ( not ( = ?auto_1564682 ?auto_1564684 ) ) ( not ( = ?auto_1564689 ?auto_1564684 ) ) ( SURFACE-AT ?auto_1564689 ?auto_1564686 ) ( CLEAR ?auto_1564689 ) ( IS-CRATE ?auto_1564681 ) ( AVAILABLE ?auto_1564687 ) ( IN ?auto_1564681 ?auto_1564688 ) ( TRUCK-AT ?auto_1564688 ?auto_1564685 ) )
    :subtasks
    ( ( !DRIVE ?auto_1564688 ?auto_1564685 ?auto_1564686 )
      ( MAKE-2CRATE ?auto_1564689 ?auto_1564681 ?auto_1564682 )
      ( MAKE-1CRATE-VERIFY ?auto_1564681 ?auto_1564682 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1564690 - SURFACE
      ?auto_1564691 - SURFACE
      ?auto_1564692 - SURFACE
    )
    :vars
    (
      ?auto_1564696 - HOIST
      ?auto_1564695 - PLACE
      ?auto_1564698 - PLACE
      ?auto_1564693 - HOIST
      ?auto_1564694 - SURFACE
      ?auto_1564697 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1564696 ?auto_1564695 ) ( IS-CRATE ?auto_1564692 ) ( not ( = ?auto_1564691 ?auto_1564692 ) ) ( not ( = ?auto_1564690 ?auto_1564691 ) ) ( not ( = ?auto_1564690 ?auto_1564692 ) ) ( not ( = ?auto_1564698 ?auto_1564695 ) ) ( HOIST-AT ?auto_1564693 ?auto_1564698 ) ( not ( = ?auto_1564696 ?auto_1564693 ) ) ( AVAILABLE ?auto_1564693 ) ( SURFACE-AT ?auto_1564692 ?auto_1564698 ) ( ON ?auto_1564692 ?auto_1564694 ) ( CLEAR ?auto_1564692 ) ( not ( = ?auto_1564691 ?auto_1564694 ) ) ( not ( = ?auto_1564692 ?auto_1564694 ) ) ( not ( = ?auto_1564690 ?auto_1564694 ) ) ( SURFACE-AT ?auto_1564690 ?auto_1564695 ) ( CLEAR ?auto_1564690 ) ( IS-CRATE ?auto_1564691 ) ( AVAILABLE ?auto_1564696 ) ( IN ?auto_1564691 ?auto_1564697 ) ( TRUCK-AT ?auto_1564697 ?auto_1564698 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1564691 ?auto_1564692 )
      ( MAKE-2CRATE-VERIFY ?auto_1564690 ?auto_1564691 ?auto_1564692 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1564699 - SURFACE
      ?auto_1564700 - SURFACE
      ?auto_1564701 - SURFACE
      ?auto_1564702 - SURFACE
    )
    :vars
    (
      ?auto_1564703 - HOIST
      ?auto_1564704 - PLACE
      ?auto_1564705 - PLACE
      ?auto_1564706 - HOIST
      ?auto_1564708 - SURFACE
      ?auto_1564707 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1564703 ?auto_1564704 ) ( IS-CRATE ?auto_1564702 ) ( not ( = ?auto_1564701 ?auto_1564702 ) ) ( not ( = ?auto_1564700 ?auto_1564701 ) ) ( not ( = ?auto_1564700 ?auto_1564702 ) ) ( not ( = ?auto_1564705 ?auto_1564704 ) ) ( HOIST-AT ?auto_1564706 ?auto_1564705 ) ( not ( = ?auto_1564703 ?auto_1564706 ) ) ( AVAILABLE ?auto_1564706 ) ( SURFACE-AT ?auto_1564702 ?auto_1564705 ) ( ON ?auto_1564702 ?auto_1564708 ) ( CLEAR ?auto_1564702 ) ( not ( = ?auto_1564701 ?auto_1564708 ) ) ( not ( = ?auto_1564702 ?auto_1564708 ) ) ( not ( = ?auto_1564700 ?auto_1564708 ) ) ( SURFACE-AT ?auto_1564700 ?auto_1564704 ) ( CLEAR ?auto_1564700 ) ( IS-CRATE ?auto_1564701 ) ( AVAILABLE ?auto_1564703 ) ( IN ?auto_1564701 ?auto_1564707 ) ( TRUCK-AT ?auto_1564707 ?auto_1564705 ) ( ON ?auto_1564700 ?auto_1564699 ) ( not ( = ?auto_1564699 ?auto_1564700 ) ) ( not ( = ?auto_1564699 ?auto_1564701 ) ) ( not ( = ?auto_1564699 ?auto_1564702 ) ) ( not ( = ?auto_1564699 ?auto_1564708 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1564700 ?auto_1564701 ?auto_1564702 )
      ( MAKE-3CRATE-VERIFY ?auto_1564699 ?auto_1564700 ?auto_1564701 ?auto_1564702 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1564709 - SURFACE
      ?auto_1564710 - SURFACE
      ?auto_1564711 - SURFACE
      ?auto_1564712 - SURFACE
      ?auto_1564713 - SURFACE
    )
    :vars
    (
      ?auto_1564714 - HOIST
      ?auto_1564715 - PLACE
      ?auto_1564716 - PLACE
      ?auto_1564717 - HOIST
      ?auto_1564719 - SURFACE
      ?auto_1564718 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1564714 ?auto_1564715 ) ( IS-CRATE ?auto_1564713 ) ( not ( = ?auto_1564712 ?auto_1564713 ) ) ( not ( = ?auto_1564711 ?auto_1564712 ) ) ( not ( = ?auto_1564711 ?auto_1564713 ) ) ( not ( = ?auto_1564716 ?auto_1564715 ) ) ( HOIST-AT ?auto_1564717 ?auto_1564716 ) ( not ( = ?auto_1564714 ?auto_1564717 ) ) ( AVAILABLE ?auto_1564717 ) ( SURFACE-AT ?auto_1564713 ?auto_1564716 ) ( ON ?auto_1564713 ?auto_1564719 ) ( CLEAR ?auto_1564713 ) ( not ( = ?auto_1564712 ?auto_1564719 ) ) ( not ( = ?auto_1564713 ?auto_1564719 ) ) ( not ( = ?auto_1564711 ?auto_1564719 ) ) ( SURFACE-AT ?auto_1564711 ?auto_1564715 ) ( CLEAR ?auto_1564711 ) ( IS-CRATE ?auto_1564712 ) ( AVAILABLE ?auto_1564714 ) ( IN ?auto_1564712 ?auto_1564718 ) ( TRUCK-AT ?auto_1564718 ?auto_1564716 ) ( ON ?auto_1564710 ?auto_1564709 ) ( ON ?auto_1564711 ?auto_1564710 ) ( not ( = ?auto_1564709 ?auto_1564710 ) ) ( not ( = ?auto_1564709 ?auto_1564711 ) ) ( not ( = ?auto_1564709 ?auto_1564712 ) ) ( not ( = ?auto_1564709 ?auto_1564713 ) ) ( not ( = ?auto_1564709 ?auto_1564719 ) ) ( not ( = ?auto_1564710 ?auto_1564711 ) ) ( not ( = ?auto_1564710 ?auto_1564712 ) ) ( not ( = ?auto_1564710 ?auto_1564713 ) ) ( not ( = ?auto_1564710 ?auto_1564719 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1564711 ?auto_1564712 ?auto_1564713 )
      ( MAKE-4CRATE-VERIFY ?auto_1564709 ?auto_1564710 ?auto_1564711 ?auto_1564712 ?auto_1564713 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1564720 - SURFACE
      ?auto_1564721 - SURFACE
      ?auto_1564722 - SURFACE
      ?auto_1564723 - SURFACE
      ?auto_1564724 - SURFACE
      ?auto_1564725 - SURFACE
    )
    :vars
    (
      ?auto_1564726 - HOIST
      ?auto_1564727 - PLACE
      ?auto_1564728 - PLACE
      ?auto_1564729 - HOIST
      ?auto_1564731 - SURFACE
      ?auto_1564730 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1564726 ?auto_1564727 ) ( IS-CRATE ?auto_1564725 ) ( not ( = ?auto_1564724 ?auto_1564725 ) ) ( not ( = ?auto_1564723 ?auto_1564724 ) ) ( not ( = ?auto_1564723 ?auto_1564725 ) ) ( not ( = ?auto_1564728 ?auto_1564727 ) ) ( HOIST-AT ?auto_1564729 ?auto_1564728 ) ( not ( = ?auto_1564726 ?auto_1564729 ) ) ( AVAILABLE ?auto_1564729 ) ( SURFACE-AT ?auto_1564725 ?auto_1564728 ) ( ON ?auto_1564725 ?auto_1564731 ) ( CLEAR ?auto_1564725 ) ( not ( = ?auto_1564724 ?auto_1564731 ) ) ( not ( = ?auto_1564725 ?auto_1564731 ) ) ( not ( = ?auto_1564723 ?auto_1564731 ) ) ( SURFACE-AT ?auto_1564723 ?auto_1564727 ) ( CLEAR ?auto_1564723 ) ( IS-CRATE ?auto_1564724 ) ( AVAILABLE ?auto_1564726 ) ( IN ?auto_1564724 ?auto_1564730 ) ( TRUCK-AT ?auto_1564730 ?auto_1564728 ) ( ON ?auto_1564721 ?auto_1564720 ) ( ON ?auto_1564722 ?auto_1564721 ) ( ON ?auto_1564723 ?auto_1564722 ) ( not ( = ?auto_1564720 ?auto_1564721 ) ) ( not ( = ?auto_1564720 ?auto_1564722 ) ) ( not ( = ?auto_1564720 ?auto_1564723 ) ) ( not ( = ?auto_1564720 ?auto_1564724 ) ) ( not ( = ?auto_1564720 ?auto_1564725 ) ) ( not ( = ?auto_1564720 ?auto_1564731 ) ) ( not ( = ?auto_1564721 ?auto_1564722 ) ) ( not ( = ?auto_1564721 ?auto_1564723 ) ) ( not ( = ?auto_1564721 ?auto_1564724 ) ) ( not ( = ?auto_1564721 ?auto_1564725 ) ) ( not ( = ?auto_1564721 ?auto_1564731 ) ) ( not ( = ?auto_1564722 ?auto_1564723 ) ) ( not ( = ?auto_1564722 ?auto_1564724 ) ) ( not ( = ?auto_1564722 ?auto_1564725 ) ) ( not ( = ?auto_1564722 ?auto_1564731 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1564723 ?auto_1564724 ?auto_1564725 )
      ( MAKE-5CRATE-VERIFY ?auto_1564720 ?auto_1564721 ?auto_1564722 ?auto_1564723 ?auto_1564724 ?auto_1564725 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1564732 - SURFACE
      ?auto_1564733 - SURFACE
      ?auto_1564734 - SURFACE
      ?auto_1564735 - SURFACE
      ?auto_1564736 - SURFACE
      ?auto_1564737 - SURFACE
      ?auto_1564738 - SURFACE
    )
    :vars
    (
      ?auto_1564739 - HOIST
      ?auto_1564740 - PLACE
      ?auto_1564741 - PLACE
      ?auto_1564742 - HOIST
      ?auto_1564744 - SURFACE
      ?auto_1564743 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1564739 ?auto_1564740 ) ( IS-CRATE ?auto_1564738 ) ( not ( = ?auto_1564737 ?auto_1564738 ) ) ( not ( = ?auto_1564736 ?auto_1564737 ) ) ( not ( = ?auto_1564736 ?auto_1564738 ) ) ( not ( = ?auto_1564741 ?auto_1564740 ) ) ( HOIST-AT ?auto_1564742 ?auto_1564741 ) ( not ( = ?auto_1564739 ?auto_1564742 ) ) ( AVAILABLE ?auto_1564742 ) ( SURFACE-AT ?auto_1564738 ?auto_1564741 ) ( ON ?auto_1564738 ?auto_1564744 ) ( CLEAR ?auto_1564738 ) ( not ( = ?auto_1564737 ?auto_1564744 ) ) ( not ( = ?auto_1564738 ?auto_1564744 ) ) ( not ( = ?auto_1564736 ?auto_1564744 ) ) ( SURFACE-AT ?auto_1564736 ?auto_1564740 ) ( CLEAR ?auto_1564736 ) ( IS-CRATE ?auto_1564737 ) ( AVAILABLE ?auto_1564739 ) ( IN ?auto_1564737 ?auto_1564743 ) ( TRUCK-AT ?auto_1564743 ?auto_1564741 ) ( ON ?auto_1564733 ?auto_1564732 ) ( ON ?auto_1564734 ?auto_1564733 ) ( ON ?auto_1564735 ?auto_1564734 ) ( ON ?auto_1564736 ?auto_1564735 ) ( not ( = ?auto_1564732 ?auto_1564733 ) ) ( not ( = ?auto_1564732 ?auto_1564734 ) ) ( not ( = ?auto_1564732 ?auto_1564735 ) ) ( not ( = ?auto_1564732 ?auto_1564736 ) ) ( not ( = ?auto_1564732 ?auto_1564737 ) ) ( not ( = ?auto_1564732 ?auto_1564738 ) ) ( not ( = ?auto_1564732 ?auto_1564744 ) ) ( not ( = ?auto_1564733 ?auto_1564734 ) ) ( not ( = ?auto_1564733 ?auto_1564735 ) ) ( not ( = ?auto_1564733 ?auto_1564736 ) ) ( not ( = ?auto_1564733 ?auto_1564737 ) ) ( not ( = ?auto_1564733 ?auto_1564738 ) ) ( not ( = ?auto_1564733 ?auto_1564744 ) ) ( not ( = ?auto_1564734 ?auto_1564735 ) ) ( not ( = ?auto_1564734 ?auto_1564736 ) ) ( not ( = ?auto_1564734 ?auto_1564737 ) ) ( not ( = ?auto_1564734 ?auto_1564738 ) ) ( not ( = ?auto_1564734 ?auto_1564744 ) ) ( not ( = ?auto_1564735 ?auto_1564736 ) ) ( not ( = ?auto_1564735 ?auto_1564737 ) ) ( not ( = ?auto_1564735 ?auto_1564738 ) ) ( not ( = ?auto_1564735 ?auto_1564744 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1564736 ?auto_1564737 ?auto_1564738 )
      ( MAKE-6CRATE-VERIFY ?auto_1564732 ?auto_1564733 ?auto_1564734 ?auto_1564735 ?auto_1564736 ?auto_1564737 ?auto_1564738 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1564745 - SURFACE
      ?auto_1564746 - SURFACE
      ?auto_1564747 - SURFACE
      ?auto_1564748 - SURFACE
      ?auto_1564749 - SURFACE
      ?auto_1564750 - SURFACE
      ?auto_1564751 - SURFACE
      ?auto_1564752 - SURFACE
    )
    :vars
    (
      ?auto_1564753 - HOIST
      ?auto_1564754 - PLACE
      ?auto_1564755 - PLACE
      ?auto_1564756 - HOIST
      ?auto_1564758 - SURFACE
      ?auto_1564757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1564753 ?auto_1564754 ) ( IS-CRATE ?auto_1564752 ) ( not ( = ?auto_1564751 ?auto_1564752 ) ) ( not ( = ?auto_1564750 ?auto_1564751 ) ) ( not ( = ?auto_1564750 ?auto_1564752 ) ) ( not ( = ?auto_1564755 ?auto_1564754 ) ) ( HOIST-AT ?auto_1564756 ?auto_1564755 ) ( not ( = ?auto_1564753 ?auto_1564756 ) ) ( AVAILABLE ?auto_1564756 ) ( SURFACE-AT ?auto_1564752 ?auto_1564755 ) ( ON ?auto_1564752 ?auto_1564758 ) ( CLEAR ?auto_1564752 ) ( not ( = ?auto_1564751 ?auto_1564758 ) ) ( not ( = ?auto_1564752 ?auto_1564758 ) ) ( not ( = ?auto_1564750 ?auto_1564758 ) ) ( SURFACE-AT ?auto_1564750 ?auto_1564754 ) ( CLEAR ?auto_1564750 ) ( IS-CRATE ?auto_1564751 ) ( AVAILABLE ?auto_1564753 ) ( IN ?auto_1564751 ?auto_1564757 ) ( TRUCK-AT ?auto_1564757 ?auto_1564755 ) ( ON ?auto_1564746 ?auto_1564745 ) ( ON ?auto_1564747 ?auto_1564746 ) ( ON ?auto_1564748 ?auto_1564747 ) ( ON ?auto_1564749 ?auto_1564748 ) ( ON ?auto_1564750 ?auto_1564749 ) ( not ( = ?auto_1564745 ?auto_1564746 ) ) ( not ( = ?auto_1564745 ?auto_1564747 ) ) ( not ( = ?auto_1564745 ?auto_1564748 ) ) ( not ( = ?auto_1564745 ?auto_1564749 ) ) ( not ( = ?auto_1564745 ?auto_1564750 ) ) ( not ( = ?auto_1564745 ?auto_1564751 ) ) ( not ( = ?auto_1564745 ?auto_1564752 ) ) ( not ( = ?auto_1564745 ?auto_1564758 ) ) ( not ( = ?auto_1564746 ?auto_1564747 ) ) ( not ( = ?auto_1564746 ?auto_1564748 ) ) ( not ( = ?auto_1564746 ?auto_1564749 ) ) ( not ( = ?auto_1564746 ?auto_1564750 ) ) ( not ( = ?auto_1564746 ?auto_1564751 ) ) ( not ( = ?auto_1564746 ?auto_1564752 ) ) ( not ( = ?auto_1564746 ?auto_1564758 ) ) ( not ( = ?auto_1564747 ?auto_1564748 ) ) ( not ( = ?auto_1564747 ?auto_1564749 ) ) ( not ( = ?auto_1564747 ?auto_1564750 ) ) ( not ( = ?auto_1564747 ?auto_1564751 ) ) ( not ( = ?auto_1564747 ?auto_1564752 ) ) ( not ( = ?auto_1564747 ?auto_1564758 ) ) ( not ( = ?auto_1564748 ?auto_1564749 ) ) ( not ( = ?auto_1564748 ?auto_1564750 ) ) ( not ( = ?auto_1564748 ?auto_1564751 ) ) ( not ( = ?auto_1564748 ?auto_1564752 ) ) ( not ( = ?auto_1564748 ?auto_1564758 ) ) ( not ( = ?auto_1564749 ?auto_1564750 ) ) ( not ( = ?auto_1564749 ?auto_1564751 ) ) ( not ( = ?auto_1564749 ?auto_1564752 ) ) ( not ( = ?auto_1564749 ?auto_1564758 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1564750 ?auto_1564751 ?auto_1564752 )
      ( MAKE-7CRATE-VERIFY ?auto_1564745 ?auto_1564746 ?auto_1564747 ?auto_1564748 ?auto_1564749 ?auto_1564750 ?auto_1564751 ?auto_1564752 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1564759 - SURFACE
      ?auto_1564760 - SURFACE
      ?auto_1564761 - SURFACE
      ?auto_1564762 - SURFACE
      ?auto_1564763 - SURFACE
      ?auto_1564764 - SURFACE
      ?auto_1564765 - SURFACE
      ?auto_1564766 - SURFACE
      ?auto_1564767 - SURFACE
    )
    :vars
    (
      ?auto_1564768 - HOIST
      ?auto_1564769 - PLACE
      ?auto_1564770 - PLACE
      ?auto_1564771 - HOIST
      ?auto_1564773 - SURFACE
      ?auto_1564772 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1564768 ?auto_1564769 ) ( IS-CRATE ?auto_1564767 ) ( not ( = ?auto_1564766 ?auto_1564767 ) ) ( not ( = ?auto_1564765 ?auto_1564766 ) ) ( not ( = ?auto_1564765 ?auto_1564767 ) ) ( not ( = ?auto_1564770 ?auto_1564769 ) ) ( HOIST-AT ?auto_1564771 ?auto_1564770 ) ( not ( = ?auto_1564768 ?auto_1564771 ) ) ( AVAILABLE ?auto_1564771 ) ( SURFACE-AT ?auto_1564767 ?auto_1564770 ) ( ON ?auto_1564767 ?auto_1564773 ) ( CLEAR ?auto_1564767 ) ( not ( = ?auto_1564766 ?auto_1564773 ) ) ( not ( = ?auto_1564767 ?auto_1564773 ) ) ( not ( = ?auto_1564765 ?auto_1564773 ) ) ( SURFACE-AT ?auto_1564765 ?auto_1564769 ) ( CLEAR ?auto_1564765 ) ( IS-CRATE ?auto_1564766 ) ( AVAILABLE ?auto_1564768 ) ( IN ?auto_1564766 ?auto_1564772 ) ( TRUCK-AT ?auto_1564772 ?auto_1564770 ) ( ON ?auto_1564760 ?auto_1564759 ) ( ON ?auto_1564761 ?auto_1564760 ) ( ON ?auto_1564762 ?auto_1564761 ) ( ON ?auto_1564763 ?auto_1564762 ) ( ON ?auto_1564764 ?auto_1564763 ) ( ON ?auto_1564765 ?auto_1564764 ) ( not ( = ?auto_1564759 ?auto_1564760 ) ) ( not ( = ?auto_1564759 ?auto_1564761 ) ) ( not ( = ?auto_1564759 ?auto_1564762 ) ) ( not ( = ?auto_1564759 ?auto_1564763 ) ) ( not ( = ?auto_1564759 ?auto_1564764 ) ) ( not ( = ?auto_1564759 ?auto_1564765 ) ) ( not ( = ?auto_1564759 ?auto_1564766 ) ) ( not ( = ?auto_1564759 ?auto_1564767 ) ) ( not ( = ?auto_1564759 ?auto_1564773 ) ) ( not ( = ?auto_1564760 ?auto_1564761 ) ) ( not ( = ?auto_1564760 ?auto_1564762 ) ) ( not ( = ?auto_1564760 ?auto_1564763 ) ) ( not ( = ?auto_1564760 ?auto_1564764 ) ) ( not ( = ?auto_1564760 ?auto_1564765 ) ) ( not ( = ?auto_1564760 ?auto_1564766 ) ) ( not ( = ?auto_1564760 ?auto_1564767 ) ) ( not ( = ?auto_1564760 ?auto_1564773 ) ) ( not ( = ?auto_1564761 ?auto_1564762 ) ) ( not ( = ?auto_1564761 ?auto_1564763 ) ) ( not ( = ?auto_1564761 ?auto_1564764 ) ) ( not ( = ?auto_1564761 ?auto_1564765 ) ) ( not ( = ?auto_1564761 ?auto_1564766 ) ) ( not ( = ?auto_1564761 ?auto_1564767 ) ) ( not ( = ?auto_1564761 ?auto_1564773 ) ) ( not ( = ?auto_1564762 ?auto_1564763 ) ) ( not ( = ?auto_1564762 ?auto_1564764 ) ) ( not ( = ?auto_1564762 ?auto_1564765 ) ) ( not ( = ?auto_1564762 ?auto_1564766 ) ) ( not ( = ?auto_1564762 ?auto_1564767 ) ) ( not ( = ?auto_1564762 ?auto_1564773 ) ) ( not ( = ?auto_1564763 ?auto_1564764 ) ) ( not ( = ?auto_1564763 ?auto_1564765 ) ) ( not ( = ?auto_1564763 ?auto_1564766 ) ) ( not ( = ?auto_1564763 ?auto_1564767 ) ) ( not ( = ?auto_1564763 ?auto_1564773 ) ) ( not ( = ?auto_1564764 ?auto_1564765 ) ) ( not ( = ?auto_1564764 ?auto_1564766 ) ) ( not ( = ?auto_1564764 ?auto_1564767 ) ) ( not ( = ?auto_1564764 ?auto_1564773 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1564765 ?auto_1564766 ?auto_1564767 )
      ( MAKE-8CRATE-VERIFY ?auto_1564759 ?auto_1564760 ?auto_1564761 ?auto_1564762 ?auto_1564763 ?auto_1564764 ?auto_1564765 ?auto_1564766 ?auto_1564767 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1564774 - SURFACE
      ?auto_1564775 - SURFACE
      ?auto_1564776 - SURFACE
      ?auto_1564777 - SURFACE
      ?auto_1564778 - SURFACE
      ?auto_1564779 - SURFACE
      ?auto_1564780 - SURFACE
      ?auto_1564781 - SURFACE
      ?auto_1564782 - SURFACE
      ?auto_1564783 - SURFACE
    )
    :vars
    (
      ?auto_1564784 - HOIST
      ?auto_1564785 - PLACE
      ?auto_1564786 - PLACE
      ?auto_1564787 - HOIST
      ?auto_1564789 - SURFACE
      ?auto_1564788 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1564784 ?auto_1564785 ) ( IS-CRATE ?auto_1564783 ) ( not ( = ?auto_1564782 ?auto_1564783 ) ) ( not ( = ?auto_1564781 ?auto_1564782 ) ) ( not ( = ?auto_1564781 ?auto_1564783 ) ) ( not ( = ?auto_1564786 ?auto_1564785 ) ) ( HOIST-AT ?auto_1564787 ?auto_1564786 ) ( not ( = ?auto_1564784 ?auto_1564787 ) ) ( AVAILABLE ?auto_1564787 ) ( SURFACE-AT ?auto_1564783 ?auto_1564786 ) ( ON ?auto_1564783 ?auto_1564789 ) ( CLEAR ?auto_1564783 ) ( not ( = ?auto_1564782 ?auto_1564789 ) ) ( not ( = ?auto_1564783 ?auto_1564789 ) ) ( not ( = ?auto_1564781 ?auto_1564789 ) ) ( SURFACE-AT ?auto_1564781 ?auto_1564785 ) ( CLEAR ?auto_1564781 ) ( IS-CRATE ?auto_1564782 ) ( AVAILABLE ?auto_1564784 ) ( IN ?auto_1564782 ?auto_1564788 ) ( TRUCK-AT ?auto_1564788 ?auto_1564786 ) ( ON ?auto_1564775 ?auto_1564774 ) ( ON ?auto_1564776 ?auto_1564775 ) ( ON ?auto_1564777 ?auto_1564776 ) ( ON ?auto_1564778 ?auto_1564777 ) ( ON ?auto_1564779 ?auto_1564778 ) ( ON ?auto_1564780 ?auto_1564779 ) ( ON ?auto_1564781 ?auto_1564780 ) ( not ( = ?auto_1564774 ?auto_1564775 ) ) ( not ( = ?auto_1564774 ?auto_1564776 ) ) ( not ( = ?auto_1564774 ?auto_1564777 ) ) ( not ( = ?auto_1564774 ?auto_1564778 ) ) ( not ( = ?auto_1564774 ?auto_1564779 ) ) ( not ( = ?auto_1564774 ?auto_1564780 ) ) ( not ( = ?auto_1564774 ?auto_1564781 ) ) ( not ( = ?auto_1564774 ?auto_1564782 ) ) ( not ( = ?auto_1564774 ?auto_1564783 ) ) ( not ( = ?auto_1564774 ?auto_1564789 ) ) ( not ( = ?auto_1564775 ?auto_1564776 ) ) ( not ( = ?auto_1564775 ?auto_1564777 ) ) ( not ( = ?auto_1564775 ?auto_1564778 ) ) ( not ( = ?auto_1564775 ?auto_1564779 ) ) ( not ( = ?auto_1564775 ?auto_1564780 ) ) ( not ( = ?auto_1564775 ?auto_1564781 ) ) ( not ( = ?auto_1564775 ?auto_1564782 ) ) ( not ( = ?auto_1564775 ?auto_1564783 ) ) ( not ( = ?auto_1564775 ?auto_1564789 ) ) ( not ( = ?auto_1564776 ?auto_1564777 ) ) ( not ( = ?auto_1564776 ?auto_1564778 ) ) ( not ( = ?auto_1564776 ?auto_1564779 ) ) ( not ( = ?auto_1564776 ?auto_1564780 ) ) ( not ( = ?auto_1564776 ?auto_1564781 ) ) ( not ( = ?auto_1564776 ?auto_1564782 ) ) ( not ( = ?auto_1564776 ?auto_1564783 ) ) ( not ( = ?auto_1564776 ?auto_1564789 ) ) ( not ( = ?auto_1564777 ?auto_1564778 ) ) ( not ( = ?auto_1564777 ?auto_1564779 ) ) ( not ( = ?auto_1564777 ?auto_1564780 ) ) ( not ( = ?auto_1564777 ?auto_1564781 ) ) ( not ( = ?auto_1564777 ?auto_1564782 ) ) ( not ( = ?auto_1564777 ?auto_1564783 ) ) ( not ( = ?auto_1564777 ?auto_1564789 ) ) ( not ( = ?auto_1564778 ?auto_1564779 ) ) ( not ( = ?auto_1564778 ?auto_1564780 ) ) ( not ( = ?auto_1564778 ?auto_1564781 ) ) ( not ( = ?auto_1564778 ?auto_1564782 ) ) ( not ( = ?auto_1564778 ?auto_1564783 ) ) ( not ( = ?auto_1564778 ?auto_1564789 ) ) ( not ( = ?auto_1564779 ?auto_1564780 ) ) ( not ( = ?auto_1564779 ?auto_1564781 ) ) ( not ( = ?auto_1564779 ?auto_1564782 ) ) ( not ( = ?auto_1564779 ?auto_1564783 ) ) ( not ( = ?auto_1564779 ?auto_1564789 ) ) ( not ( = ?auto_1564780 ?auto_1564781 ) ) ( not ( = ?auto_1564780 ?auto_1564782 ) ) ( not ( = ?auto_1564780 ?auto_1564783 ) ) ( not ( = ?auto_1564780 ?auto_1564789 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1564781 ?auto_1564782 ?auto_1564783 )
      ( MAKE-9CRATE-VERIFY ?auto_1564774 ?auto_1564775 ?auto_1564776 ?auto_1564777 ?auto_1564778 ?auto_1564779 ?auto_1564780 ?auto_1564781 ?auto_1564782 ?auto_1564783 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1564790 - SURFACE
      ?auto_1564791 - SURFACE
      ?auto_1564792 - SURFACE
      ?auto_1564793 - SURFACE
      ?auto_1564794 - SURFACE
      ?auto_1564795 - SURFACE
      ?auto_1564796 - SURFACE
      ?auto_1564797 - SURFACE
      ?auto_1564798 - SURFACE
      ?auto_1564799 - SURFACE
      ?auto_1564800 - SURFACE
    )
    :vars
    (
      ?auto_1564801 - HOIST
      ?auto_1564802 - PLACE
      ?auto_1564803 - PLACE
      ?auto_1564804 - HOIST
      ?auto_1564806 - SURFACE
      ?auto_1564805 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1564801 ?auto_1564802 ) ( IS-CRATE ?auto_1564800 ) ( not ( = ?auto_1564799 ?auto_1564800 ) ) ( not ( = ?auto_1564798 ?auto_1564799 ) ) ( not ( = ?auto_1564798 ?auto_1564800 ) ) ( not ( = ?auto_1564803 ?auto_1564802 ) ) ( HOIST-AT ?auto_1564804 ?auto_1564803 ) ( not ( = ?auto_1564801 ?auto_1564804 ) ) ( AVAILABLE ?auto_1564804 ) ( SURFACE-AT ?auto_1564800 ?auto_1564803 ) ( ON ?auto_1564800 ?auto_1564806 ) ( CLEAR ?auto_1564800 ) ( not ( = ?auto_1564799 ?auto_1564806 ) ) ( not ( = ?auto_1564800 ?auto_1564806 ) ) ( not ( = ?auto_1564798 ?auto_1564806 ) ) ( SURFACE-AT ?auto_1564798 ?auto_1564802 ) ( CLEAR ?auto_1564798 ) ( IS-CRATE ?auto_1564799 ) ( AVAILABLE ?auto_1564801 ) ( IN ?auto_1564799 ?auto_1564805 ) ( TRUCK-AT ?auto_1564805 ?auto_1564803 ) ( ON ?auto_1564791 ?auto_1564790 ) ( ON ?auto_1564792 ?auto_1564791 ) ( ON ?auto_1564793 ?auto_1564792 ) ( ON ?auto_1564794 ?auto_1564793 ) ( ON ?auto_1564795 ?auto_1564794 ) ( ON ?auto_1564796 ?auto_1564795 ) ( ON ?auto_1564797 ?auto_1564796 ) ( ON ?auto_1564798 ?auto_1564797 ) ( not ( = ?auto_1564790 ?auto_1564791 ) ) ( not ( = ?auto_1564790 ?auto_1564792 ) ) ( not ( = ?auto_1564790 ?auto_1564793 ) ) ( not ( = ?auto_1564790 ?auto_1564794 ) ) ( not ( = ?auto_1564790 ?auto_1564795 ) ) ( not ( = ?auto_1564790 ?auto_1564796 ) ) ( not ( = ?auto_1564790 ?auto_1564797 ) ) ( not ( = ?auto_1564790 ?auto_1564798 ) ) ( not ( = ?auto_1564790 ?auto_1564799 ) ) ( not ( = ?auto_1564790 ?auto_1564800 ) ) ( not ( = ?auto_1564790 ?auto_1564806 ) ) ( not ( = ?auto_1564791 ?auto_1564792 ) ) ( not ( = ?auto_1564791 ?auto_1564793 ) ) ( not ( = ?auto_1564791 ?auto_1564794 ) ) ( not ( = ?auto_1564791 ?auto_1564795 ) ) ( not ( = ?auto_1564791 ?auto_1564796 ) ) ( not ( = ?auto_1564791 ?auto_1564797 ) ) ( not ( = ?auto_1564791 ?auto_1564798 ) ) ( not ( = ?auto_1564791 ?auto_1564799 ) ) ( not ( = ?auto_1564791 ?auto_1564800 ) ) ( not ( = ?auto_1564791 ?auto_1564806 ) ) ( not ( = ?auto_1564792 ?auto_1564793 ) ) ( not ( = ?auto_1564792 ?auto_1564794 ) ) ( not ( = ?auto_1564792 ?auto_1564795 ) ) ( not ( = ?auto_1564792 ?auto_1564796 ) ) ( not ( = ?auto_1564792 ?auto_1564797 ) ) ( not ( = ?auto_1564792 ?auto_1564798 ) ) ( not ( = ?auto_1564792 ?auto_1564799 ) ) ( not ( = ?auto_1564792 ?auto_1564800 ) ) ( not ( = ?auto_1564792 ?auto_1564806 ) ) ( not ( = ?auto_1564793 ?auto_1564794 ) ) ( not ( = ?auto_1564793 ?auto_1564795 ) ) ( not ( = ?auto_1564793 ?auto_1564796 ) ) ( not ( = ?auto_1564793 ?auto_1564797 ) ) ( not ( = ?auto_1564793 ?auto_1564798 ) ) ( not ( = ?auto_1564793 ?auto_1564799 ) ) ( not ( = ?auto_1564793 ?auto_1564800 ) ) ( not ( = ?auto_1564793 ?auto_1564806 ) ) ( not ( = ?auto_1564794 ?auto_1564795 ) ) ( not ( = ?auto_1564794 ?auto_1564796 ) ) ( not ( = ?auto_1564794 ?auto_1564797 ) ) ( not ( = ?auto_1564794 ?auto_1564798 ) ) ( not ( = ?auto_1564794 ?auto_1564799 ) ) ( not ( = ?auto_1564794 ?auto_1564800 ) ) ( not ( = ?auto_1564794 ?auto_1564806 ) ) ( not ( = ?auto_1564795 ?auto_1564796 ) ) ( not ( = ?auto_1564795 ?auto_1564797 ) ) ( not ( = ?auto_1564795 ?auto_1564798 ) ) ( not ( = ?auto_1564795 ?auto_1564799 ) ) ( not ( = ?auto_1564795 ?auto_1564800 ) ) ( not ( = ?auto_1564795 ?auto_1564806 ) ) ( not ( = ?auto_1564796 ?auto_1564797 ) ) ( not ( = ?auto_1564796 ?auto_1564798 ) ) ( not ( = ?auto_1564796 ?auto_1564799 ) ) ( not ( = ?auto_1564796 ?auto_1564800 ) ) ( not ( = ?auto_1564796 ?auto_1564806 ) ) ( not ( = ?auto_1564797 ?auto_1564798 ) ) ( not ( = ?auto_1564797 ?auto_1564799 ) ) ( not ( = ?auto_1564797 ?auto_1564800 ) ) ( not ( = ?auto_1564797 ?auto_1564806 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1564798 ?auto_1564799 ?auto_1564800 )
      ( MAKE-10CRATE-VERIFY ?auto_1564790 ?auto_1564791 ?auto_1564792 ?auto_1564793 ?auto_1564794 ?auto_1564795 ?auto_1564796 ?auto_1564797 ?auto_1564798 ?auto_1564799 ?auto_1564800 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1564807 - SURFACE
      ?auto_1564808 - SURFACE
      ?auto_1564809 - SURFACE
      ?auto_1564810 - SURFACE
      ?auto_1564811 - SURFACE
      ?auto_1564812 - SURFACE
      ?auto_1564813 - SURFACE
      ?auto_1564814 - SURFACE
      ?auto_1564815 - SURFACE
      ?auto_1564816 - SURFACE
      ?auto_1564817 - SURFACE
      ?auto_1564818 - SURFACE
    )
    :vars
    (
      ?auto_1564819 - HOIST
      ?auto_1564820 - PLACE
      ?auto_1564821 - PLACE
      ?auto_1564822 - HOIST
      ?auto_1564824 - SURFACE
      ?auto_1564823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1564819 ?auto_1564820 ) ( IS-CRATE ?auto_1564818 ) ( not ( = ?auto_1564817 ?auto_1564818 ) ) ( not ( = ?auto_1564816 ?auto_1564817 ) ) ( not ( = ?auto_1564816 ?auto_1564818 ) ) ( not ( = ?auto_1564821 ?auto_1564820 ) ) ( HOIST-AT ?auto_1564822 ?auto_1564821 ) ( not ( = ?auto_1564819 ?auto_1564822 ) ) ( AVAILABLE ?auto_1564822 ) ( SURFACE-AT ?auto_1564818 ?auto_1564821 ) ( ON ?auto_1564818 ?auto_1564824 ) ( CLEAR ?auto_1564818 ) ( not ( = ?auto_1564817 ?auto_1564824 ) ) ( not ( = ?auto_1564818 ?auto_1564824 ) ) ( not ( = ?auto_1564816 ?auto_1564824 ) ) ( SURFACE-AT ?auto_1564816 ?auto_1564820 ) ( CLEAR ?auto_1564816 ) ( IS-CRATE ?auto_1564817 ) ( AVAILABLE ?auto_1564819 ) ( IN ?auto_1564817 ?auto_1564823 ) ( TRUCK-AT ?auto_1564823 ?auto_1564821 ) ( ON ?auto_1564808 ?auto_1564807 ) ( ON ?auto_1564809 ?auto_1564808 ) ( ON ?auto_1564810 ?auto_1564809 ) ( ON ?auto_1564811 ?auto_1564810 ) ( ON ?auto_1564812 ?auto_1564811 ) ( ON ?auto_1564813 ?auto_1564812 ) ( ON ?auto_1564814 ?auto_1564813 ) ( ON ?auto_1564815 ?auto_1564814 ) ( ON ?auto_1564816 ?auto_1564815 ) ( not ( = ?auto_1564807 ?auto_1564808 ) ) ( not ( = ?auto_1564807 ?auto_1564809 ) ) ( not ( = ?auto_1564807 ?auto_1564810 ) ) ( not ( = ?auto_1564807 ?auto_1564811 ) ) ( not ( = ?auto_1564807 ?auto_1564812 ) ) ( not ( = ?auto_1564807 ?auto_1564813 ) ) ( not ( = ?auto_1564807 ?auto_1564814 ) ) ( not ( = ?auto_1564807 ?auto_1564815 ) ) ( not ( = ?auto_1564807 ?auto_1564816 ) ) ( not ( = ?auto_1564807 ?auto_1564817 ) ) ( not ( = ?auto_1564807 ?auto_1564818 ) ) ( not ( = ?auto_1564807 ?auto_1564824 ) ) ( not ( = ?auto_1564808 ?auto_1564809 ) ) ( not ( = ?auto_1564808 ?auto_1564810 ) ) ( not ( = ?auto_1564808 ?auto_1564811 ) ) ( not ( = ?auto_1564808 ?auto_1564812 ) ) ( not ( = ?auto_1564808 ?auto_1564813 ) ) ( not ( = ?auto_1564808 ?auto_1564814 ) ) ( not ( = ?auto_1564808 ?auto_1564815 ) ) ( not ( = ?auto_1564808 ?auto_1564816 ) ) ( not ( = ?auto_1564808 ?auto_1564817 ) ) ( not ( = ?auto_1564808 ?auto_1564818 ) ) ( not ( = ?auto_1564808 ?auto_1564824 ) ) ( not ( = ?auto_1564809 ?auto_1564810 ) ) ( not ( = ?auto_1564809 ?auto_1564811 ) ) ( not ( = ?auto_1564809 ?auto_1564812 ) ) ( not ( = ?auto_1564809 ?auto_1564813 ) ) ( not ( = ?auto_1564809 ?auto_1564814 ) ) ( not ( = ?auto_1564809 ?auto_1564815 ) ) ( not ( = ?auto_1564809 ?auto_1564816 ) ) ( not ( = ?auto_1564809 ?auto_1564817 ) ) ( not ( = ?auto_1564809 ?auto_1564818 ) ) ( not ( = ?auto_1564809 ?auto_1564824 ) ) ( not ( = ?auto_1564810 ?auto_1564811 ) ) ( not ( = ?auto_1564810 ?auto_1564812 ) ) ( not ( = ?auto_1564810 ?auto_1564813 ) ) ( not ( = ?auto_1564810 ?auto_1564814 ) ) ( not ( = ?auto_1564810 ?auto_1564815 ) ) ( not ( = ?auto_1564810 ?auto_1564816 ) ) ( not ( = ?auto_1564810 ?auto_1564817 ) ) ( not ( = ?auto_1564810 ?auto_1564818 ) ) ( not ( = ?auto_1564810 ?auto_1564824 ) ) ( not ( = ?auto_1564811 ?auto_1564812 ) ) ( not ( = ?auto_1564811 ?auto_1564813 ) ) ( not ( = ?auto_1564811 ?auto_1564814 ) ) ( not ( = ?auto_1564811 ?auto_1564815 ) ) ( not ( = ?auto_1564811 ?auto_1564816 ) ) ( not ( = ?auto_1564811 ?auto_1564817 ) ) ( not ( = ?auto_1564811 ?auto_1564818 ) ) ( not ( = ?auto_1564811 ?auto_1564824 ) ) ( not ( = ?auto_1564812 ?auto_1564813 ) ) ( not ( = ?auto_1564812 ?auto_1564814 ) ) ( not ( = ?auto_1564812 ?auto_1564815 ) ) ( not ( = ?auto_1564812 ?auto_1564816 ) ) ( not ( = ?auto_1564812 ?auto_1564817 ) ) ( not ( = ?auto_1564812 ?auto_1564818 ) ) ( not ( = ?auto_1564812 ?auto_1564824 ) ) ( not ( = ?auto_1564813 ?auto_1564814 ) ) ( not ( = ?auto_1564813 ?auto_1564815 ) ) ( not ( = ?auto_1564813 ?auto_1564816 ) ) ( not ( = ?auto_1564813 ?auto_1564817 ) ) ( not ( = ?auto_1564813 ?auto_1564818 ) ) ( not ( = ?auto_1564813 ?auto_1564824 ) ) ( not ( = ?auto_1564814 ?auto_1564815 ) ) ( not ( = ?auto_1564814 ?auto_1564816 ) ) ( not ( = ?auto_1564814 ?auto_1564817 ) ) ( not ( = ?auto_1564814 ?auto_1564818 ) ) ( not ( = ?auto_1564814 ?auto_1564824 ) ) ( not ( = ?auto_1564815 ?auto_1564816 ) ) ( not ( = ?auto_1564815 ?auto_1564817 ) ) ( not ( = ?auto_1564815 ?auto_1564818 ) ) ( not ( = ?auto_1564815 ?auto_1564824 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1564816 ?auto_1564817 ?auto_1564818 )
      ( MAKE-11CRATE-VERIFY ?auto_1564807 ?auto_1564808 ?auto_1564809 ?auto_1564810 ?auto_1564811 ?auto_1564812 ?auto_1564813 ?auto_1564814 ?auto_1564815 ?auto_1564816 ?auto_1564817 ?auto_1564818 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1564825 - SURFACE
      ?auto_1564826 - SURFACE
      ?auto_1564827 - SURFACE
      ?auto_1564828 - SURFACE
      ?auto_1564829 - SURFACE
      ?auto_1564830 - SURFACE
      ?auto_1564831 - SURFACE
      ?auto_1564832 - SURFACE
      ?auto_1564833 - SURFACE
      ?auto_1564834 - SURFACE
      ?auto_1564835 - SURFACE
      ?auto_1564836 - SURFACE
      ?auto_1564837 - SURFACE
    )
    :vars
    (
      ?auto_1564838 - HOIST
      ?auto_1564839 - PLACE
      ?auto_1564840 - PLACE
      ?auto_1564841 - HOIST
      ?auto_1564843 - SURFACE
      ?auto_1564842 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1564838 ?auto_1564839 ) ( IS-CRATE ?auto_1564837 ) ( not ( = ?auto_1564836 ?auto_1564837 ) ) ( not ( = ?auto_1564835 ?auto_1564836 ) ) ( not ( = ?auto_1564835 ?auto_1564837 ) ) ( not ( = ?auto_1564840 ?auto_1564839 ) ) ( HOIST-AT ?auto_1564841 ?auto_1564840 ) ( not ( = ?auto_1564838 ?auto_1564841 ) ) ( AVAILABLE ?auto_1564841 ) ( SURFACE-AT ?auto_1564837 ?auto_1564840 ) ( ON ?auto_1564837 ?auto_1564843 ) ( CLEAR ?auto_1564837 ) ( not ( = ?auto_1564836 ?auto_1564843 ) ) ( not ( = ?auto_1564837 ?auto_1564843 ) ) ( not ( = ?auto_1564835 ?auto_1564843 ) ) ( SURFACE-AT ?auto_1564835 ?auto_1564839 ) ( CLEAR ?auto_1564835 ) ( IS-CRATE ?auto_1564836 ) ( AVAILABLE ?auto_1564838 ) ( IN ?auto_1564836 ?auto_1564842 ) ( TRUCK-AT ?auto_1564842 ?auto_1564840 ) ( ON ?auto_1564826 ?auto_1564825 ) ( ON ?auto_1564827 ?auto_1564826 ) ( ON ?auto_1564828 ?auto_1564827 ) ( ON ?auto_1564829 ?auto_1564828 ) ( ON ?auto_1564830 ?auto_1564829 ) ( ON ?auto_1564831 ?auto_1564830 ) ( ON ?auto_1564832 ?auto_1564831 ) ( ON ?auto_1564833 ?auto_1564832 ) ( ON ?auto_1564834 ?auto_1564833 ) ( ON ?auto_1564835 ?auto_1564834 ) ( not ( = ?auto_1564825 ?auto_1564826 ) ) ( not ( = ?auto_1564825 ?auto_1564827 ) ) ( not ( = ?auto_1564825 ?auto_1564828 ) ) ( not ( = ?auto_1564825 ?auto_1564829 ) ) ( not ( = ?auto_1564825 ?auto_1564830 ) ) ( not ( = ?auto_1564825 ?auto_1564831 ) ) ( not ( = ?auto_1564825 ?auto_1564832 ) ) ( not ( = ?auto_1564825 ?auto_1564833 ) ) ( not ( = ?auto_1564825 ?auto_1564834 ) ) ( not ( = ?auto_1564825 ?auto_1564835 ) ) ( not ( = ?auto_1564825 ?auto_1564836 ) ) ( not ( = ?auto_1564825 ?auto_1564837 ) ) ( not ( = ?auto_1564825 ?auto_1564843 ) ) ( not ( = ?auto_1564826 ?auto_1564827 ) ) ( not ( = ?auto_1564826 ?auto_1564828 ) ) ( not ( = ?auto_1564826 ?auto_1564829 ) ) ( not ( = ?auto_1564826 ?auto_1564830 ) ) ( not ( = ?auto_1564826 ?auto_1564831 ) ) ( not ( = ?auto_1564826 ?auto_1564832 ) ) ( not ( = ?auto_1564826 ?auto_1564833 ) ) ( not ( = ?auto_1564826 ?auto_1564834 ) ) ( not ( = ?auto_1564826 ?auto_1564835 ) ) ( not ( = ?auto_1564826 ?auto_1564836 ) ) ( not ( = ?auto_1564826 ?auto_1564837 ) ) ( not ( = ?auto_1564826 ?auto_1564843 ) ) ( not ( = ?auto_1564827 ?auto_1564828 ) ) ( not ( = ?auto_1564827 ?auto_1564829 ) ) ( not ( = ?auto_1564827 ?auto_1564830 ) ) ( not ( = ?auto_1564827 ?auto_1564831 ) ) ( not ( = ?auto_1564827 ?auto_1564832 ) ) ( not ( = ?auto_1564827 ?auto_1564833 ) ) ( not ( = ?auto_1564827 ?auto_1564834 ) ) ( not ( = ?auto_1564827 ?auto_1564835 ) ) ( not ( = ?auto_1564827 ?auto_1564836 ) ) ( not ( = ?auto_1564827 ?auto_1564837 ) ) ( not ( = ?auto_1564827 ?auto_1564843 ) ) ( not ( = ?auto_1564828 ?auto_1564829 ) ) ( not ( = ?auto_1564828 ?auto_1564830 ) ) ( not ( = ?auto_1564828 ?auto_1564831 ) ) ( not ( = ?auto_1564828 ?auto_1564832 ) ) ( not ( = ?auto_1564828 ?auto_1564833 ) ) ( not ( = ?auto_1564828 ?auto_1564834 ) ) ( not ( = ?auto_1564828 ?auto_1564835 ) ) ( not ( = ?auto_1564828 ?auto_1564836 ) ) ( not ( = ?auto_1564828 ?auto_1564837 ) ) ( not ( = ?auto_1564828 ?auto_1564843 ) ) ( not ( = ?auto_1564829 ?auto_1564830 ) ) ( not ( = ?auto_1564829 ?auto_1564831 ) ) ( not ( = ?auto_1564829 ?auto_1564832 ) ) ( not ( = ?auto_1564829 ?auto_1564833 ) ) ( not ( = ?auto_1564829 ?auto_1564834 ) ) ( not ( = ?auto_1564829 ?auto_1564835 ) ) ( not ( = ?auto_1564829 ?auto_1564836 ) ) ( not ( = ?auto_1564829 ?auto_1564837 ) ) ( not ( = ?auto_1564829 ?auto_1564843 ) ) ( not ( = ?auto_1564830 ?auto_1564831 ) ) ( not ( = ?auto_1564830 ?auto_1564832 ) ) ( not ( = ?auto_1564830 ?auto_1564833 ) ) ( not ( = ?auto_1564830 ?auto_1564834 ) ) ( not ( = ?auto_1564830 ?auto_1564835 ) ) ( not ( = ?auto_1564830 ?auto_1564836 ) ) ( not ( = ?auto_1564830 ?auto_1564837 ) ) ( not ( = ?auto_1564830 ?auto_1564843 ) ) ( not ( = ?auto_1564831 ?auto_1564832 ) ) ( not ( = ?auto_1564831 ?auto_1564833 ) ) ( not ( = ?auto_1564831 ?auto_1564834 ) ) ( not ( = ?auto_1564831 ?auto_1564835 ) ) ( not ( = ?auto_1564831 ?auto_1564836 ) ) ( not ( = ?auto_1564831 ?auto_1564837 ) ) ( not ( = ?auto_1564831 ?auto_1564843 ) ) ( not ( = ?auto_1564832 ?auto_1564833 ) ) ( not ( = ?auto_1564832 ?auto_1564834 ) ) ( not ( = ?auto_1564832 ?auto_1564835 ) ) ( not ( = ?auto_1564832 ?auto_1564836 ) ) ( not ( = ?auto_1564832 ?auto_1564837 ) ) ( not ( = ?auto_1564832 ?auto_1564843 ) ) ( not ( = ?auto_1564833 ?auto_1564834 ) ) ( not ( = ?auto_1564833 ?auto_1564835 ) ) ( not ( = ?auto_1564833 ?auto_1564836 ) ) ( not ( = ?auto_1564833 ?auto_1564837 ) ) ( not ( = ?auto_1564833 ?auto_1564843 ) ) ( not ( = ?auto_1564834 ?auto_1564835 ) ) ( not ( = ?auto_1564834 ?auto_1564836 ) ) ( not ( = ?auto_1564834 ?auto_1564837 ) ) ( not ( = ?auto_1564834 ?auto_1564843 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1564835 ?auto_1564836 ?auto_1564837 )
      ( MAKE-12CRATE-VERIFY ?auto_1564825 ?auto_1564826 ?auto_1564827 ?auto_1564828 ?auto_1564829 ?auto_1564830 ?auto_1564831 ?auto_1564832 ?auto_1564833 ?auto_1564834 ?auto_1564835 ?auto_1564836 ?auto_1564837 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1564844 - SURFACE
      ?auto_1564845 - SURFACE
      ?auto_1564846 - SURFACE
      ?auto_1564847 - SURFACE
      ?auto_1564848 - SURFACE
      ?auto_1564849 - SURFACE
      ?auto_1564850 - SURFACE
      ?auto_1564851 - SURFACE
      ?auto_1564852 - SURFACE
      ?auto_1564853 - SURFACE
      ?auto_1564854 - SURFACE
      ?auto_1564855 - SURFACE
      ?auto_1564856 - SURFACE
      ?auto_1564857 - SURFACE
    )
    :vars
    (
      ?auto_1564858 - HOIST
      ?auto_1564859 - PLACE
      ?auto_1564860 - PLACE
      ?auto_1564861 - HOIST
      ?auto_1564863 - SURFACE
      ?auto_1564862 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1564858 ?auto_1564859 ) ( IS-CRATE ?auto_1564857 ) ( not ( = ?auto_1564856 ?auto_1564857 ) ) ( not ( = ?auto_1564855 ?auto_1564856 ) ) ( not ( = ?auto_1564855 ?auto_1564857 ) ) ( not ( = ?auto_1564860 ?auto_1564859 ) ) ( HOIST-AT ?auto_1564861 ?auto_1564860 ) ( not ( = ?auto_1564858 ?auto_1564861 ) ) ( AVAILABLE ?auto_1564861 ) ( SURFACE-AT ?auto_1564857 ?auto_1564860 ) ( ON ?auto_1564857 ?auto_1564863 ) ( CLEAR ?auto_1564857 ) ( not ( = ?auto_1564856 ?auto_1564863 ) ) ( not ( = ?auto_1564857 ?auto_1564863 ) ) ( not ( = ?auto_1564855 ?auto_1564863 ) ) ( SURFACE-AT ?auto_1564855 ?auto_1564859 ) ( CLEAR ?auto_1564855 ) ( IS-CRATE ?auto_1564856 ) ( AVAILABLE ?auto_1564858 ) ( IN ?auto_1564856 ?auto_1564862 ) ( TRUCK-AT ?auto_1564862 ?auto_1564860 ) ( ON ?auto_1564845 ?auto_1564844 ) ( ON ?auto_1564846 ?auto_1564845 ) ( ON ?auto_1564847 ?auto_1564846 ) ( ON ?auto_1564848 ?auto_1564847 ) ( ON ?auto_1564849 ?auto_1564848 ) ( ON ?auto_1564850 ?auto_1564849 ) ( ON ?auto_1564851 ?auto_1564850 ) ( ON ?auto_1564852 ?auto_1564851 ) ( ON ?auto_1564853 ?auto_1564852 ) ( ON ?auto_1564854 ?auto_1564853 ) ( ON ?auto_1564855 ?auto_1564854 ) ( not ( = ?auto_1564844 ?auto_1564845 ) ) ( not ( = ?auto_1564844 ?auto_1564846 ) ) ( not ( = ?auto_1564844 ?auto_1564847 ) ) ( not ( = ?auto_1564844 ?auto_1564848 ) ) ( not ( = ?auto_1564844 ?auto_1564849 ) ) ( not ( = ?auto_1564844 ?auto_1564850 ) ) ( not ( = ?auto_1564844 ?auto_1564851 ) ) ( not ( = ?auto_1564844 ?auto_1564852 ) ) ( not ( = ?auto_1564844 ?auto_1564853 ) ) ( not ( = ?auto_1564844 ?auto_1564854 ) ) ( not ( = ?auto_1564844 ?auto_1564855 ) ) ( not ( = ?auto_1564844 ?auto_1564856 ) ) ( not ( = ?auto_1564844 ?auto_1564857 ) ) ( not ( = ?auto_1564844 ?auto_1564863 ) ) ( not ( = ?auto_1564845 ?auto_1564846 ) ) ( not ( = ?auto_1564845 ?auto_1564847 ) ) ( not ( = ?auto_1564845 ?auto_1564848 ) ) ( not ( = ?auto_1564845 ?auto_1564849 ) ) ( not ( = ?auto_1564845 ?auto_1564850 ) ) ( not ( = ?auto_1564845 ?auto_1564851 ) ) ( not ( = ?auto_1564845 ?auto_1564852 ) ) ( not ( = ?auto_1564845 ?auto_1564853 ) ) ( not ( = ?auto_1564845 ?auto_1564854 ) ) ( not ( = ?auto_1564845 ?auto_1564855 ) ) ( not ( = ?auto_1564845 ?auto_1564856 ) ) ( not ( = ?auto_1564845 ?auto_1564857 ) ) ( not ( = ?auto_1564845 ?auto_1564863 ) ) ( not ( = ?auto_1564846 ?auto_1564847 ) ) ( not ( = ?auto_1564846 ?auto_1564848 ) ) ( not ( = ?auto_1564846 ?auto_1564849 ) ) ( not ( = ?auto_1564846 ?auto_1564850 ) ) ( not ( = ?auto_1564846 ?auto_1564851 ) ) ( not ( = ?auto_1564846 ?auto_1564852 ) ) ( not ( = ?auto_1564846 ?auto_1564853 ) ) ( not ( = ?auto_1564846 ?auto_1564854 ) ) ( not ( = ?auto_1564846 ?auto_1564855 ) ) ( not ( = ?auto_1564846 ?auto_1564856 ) ) ( not ( = ?auto_1564846 ?auto_1564857 ) ) ( not ( = ?auto_1564846 ?auto_1564863 ) ) ( not ( = ?auto_1564847 ?auto_1564848 ) ) ( not ( = ?auto_1564847 ?auto_1564849 ) ) ( not ( = ?auto_1564847 ?auto_1564850 ) ) ( not ( = ?auto_1564847 ?auto_1564851 ) ) ( not ( = ?auto_1564847 ?auto_1564852 ) ) ( not ( = ?auto_1564847 ?auto_1564853 ) ) ( not ( = ?auto_1564847 ?auto_1564854 ) ) ( not ( = ?auto_1564847 ?auto_1564855 ) ) ( not ( = ?auto_1564847 ?auto_1564856 ) ) ( not ( = ?auto_1564847 ?auto_1564857 ) ) ( not ( = ?auto_1564847 ?auto_1564863 ) ) ( not ( = ?auto_1564848 ?auto_1564849 ) ) ( not ( = ?auto_1564848 ?auto_1564850 ) ) ( not ( = ?auto_1564848 ?auto_1564851 ) ) ( not ( = ?auto_1564848 ?auto_1564852 ) ) ( not ( = ?auto_1564848 ?auto_1564853 ) ) ( not ( = ?auto_1564848 ?auto_1564854 ) ) ( not ( = ?auto_1564848 ?auto_1564855 ) ) ( not ( = ?auto_1564848 ?auto_1564856 ) ) ( not ( = ?auto_1564848 ?auto_1564857 ) ) ( not ( = ?auto_1564848 ?auto_1564863 ) ) ( not ( = ?auto_1564849 ?auto_1564850 ) ) ( not ( = ?auto_1564849 ?auto_1564851 ) ) ( not ( = ?auto_1564849 ?auto_1564852 ) ) ( not ( = ?auto_1564849 ?auto_1564853 ) ) ( not ( = ?auto_1564849 ?auto_1564854 ) ) ( not ( = ?auto_1564849 ?auto_1564855 ) ) ( not ( = ?auto_1564849 ?auto_1564856 ) ) ( not ( = ?auto_1564849 ?auto_1564857 ) ) ( not ( = ?auto_1564849 ?auto_1564863 ) ) ( not ( = ?auto_1564850 ?auto_1564851 ) ) ( not ( = ?auto_1564850 ?auto_1564852 ) ) ( not ( = ?auto_1564850 ?auto_1564853 ) ) ( not ( = ?auto_1564850 ?auto_1564854 ) ) ( not ( = ?auto_1564850 ?auto_1564855 ) ) ( not ( = ?auto_1564850 ?auto_1564856 ) ) ( not ( = ?auto_1564850 ?auto_1564857 ) ) ( not ( = ?auto_1564850 ?auto_1564863 ) ) ( not ( = ?auto_1564851 ?auto_1564852 ) ) ( not ( = ?auto_1564851 ?auto_1564853 ) ) ( not ( = ?auto_1564851 ?auto_1564854 ) ) ( not ( = ?auto_1564851 ?auto_1564855 ) ) ( not ( = ?auto_1564851 ?auto_1564856 ) ) ( not ( = ?auto_1564851 ?auto_1564857 ) ) ( not ( = ?auto_1564851 ?auto_1564863 ) ) ( not ( = ?auto_1564852 ?auto_1564853 ) ) ( not ( = ?auto_1564852 ?auto_1564854 ) ) ( not ( = ?auto_1564852 ?auto_1564855 ) ) ( not ( = ?auto_1564852 ?auto_1564856 ) ) ( not ( = ?auto_1564852 ?auto_1564857 ) ) ( not ( = ?auto_1564852 ?auto_1564863 ) ) ( not ( = ?auto_1564853 ?auto_1564854 ) ) ( not ( = ?auto_1564853 ?auto_1564855 ) ) ( not ( = ?auto_1564853 ?auto_1564856 ) ) ( not ( = ?auto_1564853 ?auto_1564857 ) ) ( not ( = ?auto_1564853 ?auto_1564863 ) ) ( not ( = ?auto_1564854 ?auto_1564855 ) ) ( not ( = ?auto_1564854 ?auto_1564856 ) ) ( not ( = ?auto_1564854 ?auto_1564857 ) ) ( not ( = ?auto_1564854 ?auto_1564863 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1564855 ?auto_1564856 ?auto_1564857 )
      ( MAKE-13CRATE-VERIFY ?auto_1564844 ?auto_1564845 ?auto_1564846 ?auto_1564847 ?auto_1564848 ?auto_1564849 ?auto_1564850 ?auto_1564851 ?auto_1564852 ?auto_1564853 ?auto_1564854 ?auto_1564855 ?auto_1564856 ?auto_1564857 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1564864 - SURFACE
      ?auto_1564865 - SURFACE
    )
    :vars
    (
      ?auto_1564867 - HOIST
      ?auto_1564868 - PLACE
      ?auto_1564866 - SURFACE
      ?auto_1564869 - PLACE
      ?auto_1564870 - HOIST
      ?auto_1564872 - SURFACE
      ?auto_1564871 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1564867 ?auto_1564868 ) ( IS-CRATE ?auto_1564865 ) ( not ( = ?auto_1564864 ?auto_1564865 ) ) ( not ( = ?auto_1564866 ?auto_1564864 ) ) ( not ( = ?auto_1564866 ?auto_1564865 ) ) ( not ( = ?auto_1564869 ?auto_1564868 ) ) ( HOIST-AT ?auto_1564870 ?auto_1564869 ) ( not ( = ?auto_1564867 ?auto_1564870 ) ) ( SURFACE-AT ?auto_1564865 ?auto_1564869 ) ( ON ?auto_1564865 ?auto_1564872 ) ( CLEAR ?auto_1564865 ) ( not ( = ?auto_1564864 ?auto_1564872 ) ) ( not ( = ?auto_1564865 ?auto_1564872 ) ) ( not ( = ?auto_1564866 ?auto_1564872 ) ) ( SURFACE-AT ?auto_1564866 ?auto_1564868 ) ( CLEAR ?auto_1564866 ) ( IS-CRATE ?auto_1564864 ) ( AVAILABLE ?auto_1564867 ) ( TRUCK-AT ?auto_1564871 ?auto_1564869 ) ( LIFTING ?auto_1564870 ?auto_1564864 ) )
    :subtasks
    ( ( !LOAD ?auto_1564870 ?auto_1564864 ?auto_1564871 ?auto_1564869 )
      ( MAKE-2CRATE ?auto_1564866 ?auto_1564864 ?auto_1564865 )
      ( MAKE-1CRATE-VERIFY ?auto_1564864 ?auto_1564865 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1564873 - SURFACE
      ?auto_1564874 - SURFACE
      ?auto_1564875 - SURFACE
    )
    :vars
    (
      ?auto_1564879 - HOIST
      ?auto_1564878 - PLACE
      ?auto_1564877 - PLACE
      ?auto_1564876 - HOIST
      ?auto_1564880 - SURFACE
      ?auto_1564881 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1564879 ?auto_1564878 ) ( IS-CRATE ?auto_1564875 ) ( not ( = ?auto_1564874 ?auto_1564875 ) ) ( not ( = ?auto_1564873 ?auto_1564874 ) ) ( not ( = ?auto_1564873 ?auto_1564875 ) ) ( not ( = ?auto_1564877 ?auto_1564878 ) ) ( HOIST-AT ?auto_1564876 ?auto_1564877 ) ( not ( = ?auto_1564879 ?auto_1564876 ) ) ( SURFACE-AT ?auto_1564875 ?auto_1564877 ) ( ON ?auto_1564875 ?auto_1564880 ) ( CLEAR ?auto_1564875 ) ( not ( = ?auto_1564874 ?auto_1564880 ) ) ( not ( = ?auto_1564875 ?auto_1564880 ) ) ( not ( = ?auto_1564873 ?auto_1564880 ) ) ( SURFACE-AT ?auto_1564873 ?auto_1564878 ) ( CLEAR ?auto_1564873 ) ( IS-CRATE ?auto_1564874 ) ( AVAILABLE ?auto_1564879 ) ( TRUCK-AT ?auto_1564881 ?auto_1564877 ) ( LIFTING ?auto_1564876 ?auto_1564874 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1564874 ?auto_1564875 )
      ( MAKE-2CRATE-VERIFY ?auto_1564873 ?auto_1564874 ?auto_1564875 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1564882 - SURFACE
      ?auto_1564883 - SURFACE
      ?auto_1564884 - SURFACE
      ?auto_1564885 - SURFACE
    )
    :vars
    (
      ?auto_1564891 - HOIST
      ?auto_1564887 - PLACE
      ?auto_1564889 - PLACE
      ?auto_1564890 - HOIST
      ?auto_1564888 - SURFACE
      ?auto_1564886 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1564891 ?auto_1564887 ) ( IS-CRATE ?auto_1564885 ) ( not ( = ?auto_1564884 ?auto_1564885 ) ) ( not ( = ?auto_1564883 ?auto_1564884 ) ) ( not ( = ?auto_1564883 ?auto_1564885 ) ) ( not ( = ?auto_1564889 ?auto_1564887 ) ) ( HOIST-AT ?auto_1564890 ?auto_1564889 ) ( not ( = ?auto_1564891 ?auto_1564890 ) ) ( SURFACE-AT ?auto_1564885 ?auto_1564889 ) ( ON ?auto_1564885 ?auto_1564888 ) ( CLEAR ?auto_1564885 ) ( not ( = ?auto_1564884 ?auto_1564888 ) ) ( not ( = ?auto_1564885 ?auto_1564888 ) ) ( not ( = ?auto_1564883 ?auto_1564888 ) ) ( SURFACE-AT ?auto_1564883 ?auto_1564887 ) ( CLEAR ?auto_1564883 ) ( IS-CRATE ?auto_1564884 ) ( AVAILABLE ?auto_1564891 ) ( TRUCK-AT ?auto_1564886 ?auto_1564889 ) ( LIFTING ?auto_1564890 ?auto_1564884 ) ( ON ?auto_1564883 ?auto_1564882 ) ( not ( = ?auto_1564882 ?auto_1564883 ) ) ( not ( = ?auto_1564882 ?auto_1564884 ) ) ( not ( = ?auto_1564882 ?auto_1564885 ) ) ( not ( = ?auto_1564882 ?auto_1564888 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1564883 ?auto_1564884 ?auto_1564885 )
      ( MAKE-3CRATE-VERIFY ?auto_1564882 ?auto_1564883 ?auto_1564884 ?auto_1564885 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1564892 - SURFACE
      ?auto_1564893 - SURFACE
      ?auto_1564894 - SURFACE
      ?auto_1564895 - SURFACE
      ?auto_1564896 - SURFACE
    )
    :vars
    (
      ?auto_1564902 - HOIST
      ?auto_1564898 - PLACE
      ?auto_1564900 - PLACE
      ?auto_1564901 - HOIST
      ?auto_1564899 - SURFACE
      ?auto_1564897 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1564902 ?auto_1564898 ) ( IS-CRATE ?auto_1564896 ) ( not ( = ?auto_1564895 ?auto_1564896 ) ) ( not ( = ?auto_1564894 ?auto_1564895 ) ) ( not ( = ?auto_1564894 ?auto_1564896 ) ) ( not ( = ?auto_1564900 ?auto_1564898 ) ) ( HOIST-AT ?auto_1564901 ?auto_1564900 ) ( not ( = ?auto_1564902 ?auto_1564901 ) ) ( SURFACE-AT ?auto_1564896 ?auto_1564900 ) ( ON ?auto_1564896 ?auto_1564899 ) ( CLEAR ?auto_1564896 ) ( not ( = ?auto_1564895 ?auto_1564899 ) ) ( not ( = ?auto_1564896 ?auto_1564899 ) ) ( not ( = ?auto_1564894 ?auto_1564899 ) ) ( SURFACE-AT ?auto_1564894 ?auto_1564898 ) ( CLEAR ?auto_1564894 ) ( IS-CRATE ?auto_1564895 ) ( AVAILABLE ?auto_1564902 ) ( TRUCK-AT ?auto_1564897 ?auto_1564900 ) ( LIFTING ?auto_1564901 ?auto_1564895 ) ( ON ?auto_1564893 ?auto_1564892 ) ( ON ?auto_1564894 ?auto_1564893 ) ( not ( = ?auto_1564892 ?auto_1564893 ) ) ( not ( = ?auto_1564892 ?auto_1564894 ) ) ( not ( = ?auto_1564892 ?auto_1564895 ) ) ( not ( = ?auto_1564892 ?auto_1564896 ) ) ( not ( = ?auto_1564892 ?auto_1564899 ) ) ( not ( = ?auto_1564893 ?auto_1564894 ) ) ( not ( = ?auto_1564893 ?auto_1564895 ) ) ( not ( = ?auto_1564893 ?auto_1564896 ) ) ( not ( = ?auto_1564893 ?auto_1564899 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1564894 ?auto_1564895 ?auto_1564896 )
      ( MAKE-4CRATE-VERIFY ?auto_1564892 ?auto_1564893 ?auto_1564894 ?auto_1564895 ?auto_1564896 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1564903 - SURFACE
      ?auto_1564904 - SURFACE
      ?auto_1564905 - SURFACE
      ?auto_1564906 - SURFACE
      ?auto_1564907 - SURFACE
      ?auto_1564908 - SURFACE
    )
    :vars
    (
      ?auto_1564914 - HOIST
      ?auto_1564910 - PLACE
      ?auto_1564912 - PLACE
      ?auto_1564913 - HOIST
      ?auto_1564911 - SURFACE
      ?auto_1564909 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1564914 ?auto_1564910 ) ( IS-CRATE ?auto_1564908 ) ( not ( = ?auto_1564907 ?auto_1564908 ) ) ( not ( = ?auto_1564906 ?auto_1564907 ) ) ( not ( = ?auto_1564906 ?auto_1564908 ) ) ( not ( = ?auto_1564912 ?auto_1564910 ) ) ( HOIST-AT ?auto_1564913 ?auto_1564912 ) ( not ( = ?auto_1564914 ?auto_1564913 ) ) ( SURFACE-AT ?auto_1564908 ?auto_1564912 ) ( ON ?auto_1564908 ?auto_1564911 ) ( CLEAR ?auto_1564908 ) ( not ( = ?auto_1564907 ?auto_1564911 ) ) ( not ( = ?auto_1564908 ?auto_1564911 ) ) ( not ( = ?auto_1564906 ?auto_1564911 ) ) ( SURFACE-AT ?auto_1564906 ?auto_1564910 ) ( CLEAR ?auto_1564906 ) ( IS-CRATE ?auto_1564907 ) ( AVAILABLE ?auto_1564914 ) ( TRUCK-AT ?auto_1564909 ?auto_1564912 ) ( LIFTING ?auto_1564913 ?auto_1564907 ) ( ON ?auto_1564904 ?auto_1564903 ) ( ON ?auto_1564905 ?auto_1564904 ) ( ON ?auto_1564906 ?auto_1564905 ) ( not ( = ?auto_1564903 ?auto_1564904 ) ) ( not ( = ?auto_1564903 ?auto_1564905 ) ) ( not ( = ?auto_1564903 ?auto_1564906 ) ) ( not ( = ?auto_1564903 ?auto_1564907 ) ) ( not ( = ?auto_1564903 ?auto_1564908 ) ) ( not ( = ?auto_1564903 ?auto_1564911 ) ) ( not ( = ?auto_1564904 ?auto_1564905 ) ) ( not ( = ?auto_1564904 ?auto_1564906 ) ) ( not ( = ?auto_1564904 ?auto_1564907 ) ) ( not ( = ?auto_1564904 ?auto_1564908 ) ) ( not ( = ?auto_1564904 ?auto_1564911 ) ) ( not ( = ?auto_1564905 ?auto_1564906 ) ) ( not ( = ?auto_1564905 ?auto_1564907 ) ) ( not ( = ?auto_1564905 ?auto_1564908 ) ) ( not ( = ?auto_1564905 ?auto_1564911 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1564906 ?auto_1564907 ?auto_1564908 )
      ( MAKE-5CRATE-VERIFY ?auto_1564903 ?auto_1564904 ?auto_1564905 ?auto_1564906 ?auto_1564907 ?auto_1564908 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1564915 - SURFACE
      ?auto_1564916 - SURFACE
      ?auto_1564917 - SURFACE
      ?auto_1564918 - SURFACE
      ?auto_1564919 - SURFACE
      ?auto_1564920 - SURFACE
      ?auto_1564921 - SURFACE
    )
    :vars
    (
      ?auto_1564927 - HOIST
      ?auto_1564923 - PLACE
      ?auto_1564925 - PLACE
      ?auto_1564926 - HOIST
      ?auto_1564924 - SURFACE
      ?auto_1564922 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1564927 ?auto_1564923 ) ( IS-CRATE ?auto_1564921 ) ( not ( = ?auto_1564920 ?auto_1564921 ) ) ( not ( = ?auto_1564919 ?auto_1564920 ) ) ( not ( = ?auto_1564919 ?auto_1564921 ) ) ( not ( = ?auto_1564925 ?auto_1564923 ) ) ( HOIST-AT ?auto_1564926 ?auto_1564925 ) ( not ( = ?auto_1564927 ?auto_1564926 ) ) ( SURFACE-AT ?auto_1564921 ?auto_1564925 ) ( ON ?auto_1564921 ?auto_1564924 ) ( CLEAR ?auto_1564921 ) ( not ( = ?auto_1564920 ?auto_1564924 ) ) ( not ( = ?auto_1564921 ?auto_1564924 ) ) ( not ( = ?auto_1564919 ?auto_1564924 ) ) ( SURFACE-AT ?auto_1564919 ?auto_1564923 ) ( CLEAR ?auto_1564919 ) ( IS-CRATE ?auto_1564920 ) ( AVAILABLE ?auto_1564927 ) ( TRUCK-AT ?auto_1564922 ?auto_1564925 ) ( LIFTING ?auto_1564926 ?auto_1564920 ) ( ON ?auto_1564916 ?auto_1564915 ) ( ON ?auto_1564917 ?auto_1564916 ) ( ON ?auto_1564918 ?auto_1564917 ) ( ON ?auto_1564919 ?auto_1564918 ) ( not ( = ?auto_1564915 ?auto_1564916 ) ) ( not ( = ?auto_1564915 ?auto_1564917 ) ) ( not ( = ?auto_1564915 ?auto_1564918 ) ) ( not ( = ?auto_1564915 ?auto_1564919 ) ) ( not ( = ?auto_1564915 ?auto_1564920 ) ) ( not ( = ?auto_1564915 ?auto_1564921 ) ) ( not ( = ?auto_1564915 ?auto_1564924 ) ) ( not ( = ?auto_1564916 ?auto_1564917 ) ) ( not ( = ?auto_1564916 ?auto_1564918 ) ) ( not ( = ?auto_1564916 ?auto_1564919 ) ) ( not ( = ?auto_1564916 ?auto_1564920 ) ) ( not ( = ?auto_1564916 ?auto_1564921 ) ) ( not ( = ?auto_1564916 ?auto_1564924 ) ) ( not ( = ?auto_1564917 ?auto_1564918 ) ) ( not ( = ?auto_1564917 ?auto_1564919 ) ) ( not ( = ?auto_1564917 ?auto_1564920 ) ) ( not ( = ?auto_1564917 ?auto_1564921 ) ) ( not ( = ?auto_1564917 ?auto_1564924 ) ) ( not ( = ?auto_1564918 ?auto_1564919 ) ) ( not ( = ?auto_1564918 ?auto_1564920 ) ) ( not ( = ?auto_1564918 ?auto_1564921 ) ) ( not ( = ?auto_1564918 ?auto_1564924 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1564919 ?auto_1564920 ?auto_1564921 )
      ( MAKE-6CRATE-VERIFY ?auto_1564915 ?auto_1564916 ?auto_1564917 ?auto_1564918 ?auto_1564919 ?auto_1564920 ?auto_1564921 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1564928 - SURFACE
      ?auto_1564929 - SURFACE
      ?auto_1564930 - SURFACE
      ?auto_1564931 - SURFACE
      ?auto_1564932 - SURFACE
      ?auto_1564933 - SURFACE
      ?auto_1564934 - SURFACE
      ?auto_1564935 - SURFACE
    )
    :vars
    (
      ?auto_1564941 - HOIST
      ?auto_1564937 - PLACE
      ?auto_1564939 - PLACE
      ?auto_1564940 - HOIST
      ?auto_1564938 - SURFACE
      ?auto_1564936 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1564941 ?auto_1564937 ) ( IS-CRATE ?auto_1564935 ) ( not ( = ?auto_1564934 ?auto_1564935 ) ) ( not ( = ?auto_1564933 ?auto_1564934 ) ) ( not ( = ?auto_1564933 ?auto_1564935 ) ) ( not ( = ?auto_1564939 ?auto_1564937 ) ) ( HOIST-AT ?auto_1564940 ?auto_1564939 ) ( not ( = ?auto_1564941 ?auto_1564940 ) ) ( SURFACE-AT ?auto_1564935 ?auto_1564939 ) ( ON ?auto_1564935 ?auto_1564938 ) ( CLEAR ?auto_1564935 ) ( not ( = ?auto_1564934 ?auto_1564938 ) ) ( not ( = ?auto_1564935 ?auto_1564938 ) ) ( not ( = ?auto_1564933 ?auto_1564938 ) ) ( SURFACE-AT ?auto_1564933 ?auto_1564937 ) ( CLEAR ?auto_1564933 ) ( IS-CRATE ?auto_1564934 ) ( AVAILABLE ?auto_1564941 ) ( TRUCK-AT ?auto_1564936 ?auto_1564939 ) ( LIFTING ?auto_1564940 ?auto_1564934 ) ( ON ?auto_1564929 ?auto_1564928 ) ( ON ?auto_1564930 ?auto_1564929 ) ( ON ?auto_1564931 ?auto_1564930 ) ( ON ?auto_1564932 ?auto_1564931 ) ( ON ?auto_1564933 ?auto_1564932 ) ( not ( = ?auto_1564928 ?auto_1564929 ) ) ( not ( = ?auto_1564928 ?auto_1564930 ) ) ( not ( = ?auto_1564928 ?auto_1564931 ) ) ( not ( = ?auto_1564928 ?auto_1564932 ) ) ( not ( = ?auto_1564928 ?auto_1564933 ) ) ( not ( = ?auto_1564928 ?auto_1564934 ) ) ( not ( = ?auto_1564928 ?auto_1564935 ) ) ( not ( = ?auto_1564928 ?auto_1564938 ) ) ( not ( = ?auto_1564929 ?auto_1564930 ) ) ( not ( = ?auto_1564929 ?auto_1564931 ) ) ( not ( = ?auto_1564929 ?auto_1564932 ) ) ( not ( = ?auto_1564929 ?auto_1564933 ) ) ( not ( = ?auto_1564929 ?auto_1564934 ) ) ( not ( = ?auto_1564929 ?auto_1564935 ) ) ( not ( = ?auto_1564929 ?auto_1564938 ) ) ( not ( = ?auto_1564930 ?auto_1564931 ) ) ( not ( = ?auto_1564930 ?auto_1564932 ) ) ( not ( = ?auto_1564930 ?auto_1564933 ) ) ( not ( = ?auto_1564930 ?auto_1564934 ) ) ( not ( = ?auto_1564930 ?auto_1564935 ) ) ( not ( = ?auto_1564930 ?auto_1564938 ) ) ( not ( = ?auto_1564931 ?auto_1564932 ) ) ( not ( = ?auto_1564931 ?auto_1564933 ) ) ( not ( = ?auto_1564931 ?auto_1564934 ) ) ( not ( = ?auto_1564931 ?auto_1564935 ) ) ( not ( = ?auto_1564931 ?auto_1564938 ) ) ( not ( = ?auto_1564932 ?auto_1564933 ) ) ( not ( = ?auto_1564932 ?auto_1564934 ) ) ( not ( = ?auto_1564932 ?auto_1564935 ) ) ( not ( = ?auto_1564932 ?auto_1564938 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1564933 ?auto_1564934 ?auto_1564935 )
      ( MAKE-7CRATE-VERIFY ?auto_1564928 ?auto_1564929 ?auto_1564930 ?auto_1564931 ?auto_1564932 ?auto_1564933 ?auto_1564934 ?auto_1564935 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1564942 - SURFACE
      ?auto_1564943 - SURFACE
      ?auto_1564944 - SURFACE
      ?auto_1564945 - SURFACE
      ?auto_1564946 - SURFACE
      ?auto_1564947 - SURFACE
      ?auto_1564948 - SURFACE
      ?auto_1564949 - SURFACE
      ?auto_1564950 - SURFACE
    )
    :vars
    (
      ?auto_1564956 - HOIST
      ?auto_1564952 - PLACE
      ?auto_1564954 - PLACE
      ?auto_1564955 - HOIST
      ?auto_1564953 - SURFACE
      ?auto_1564951 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1564956 ?auto_1564952 ) ( IS-CRATE ?auto_1564950 ) ( not ( = ?auto_1564949 ?auto_1564950 ) ) ( not ( = ?auto_1564948 ?auto_1564949 ) ) ( not ( = ?auto_1564948 ?auto_1564950 ) ) ( not ( = ?auto_1564954 ?auto_1564952 ) ) ( HOIST-AT ?auto_1564955 ?auto_1564954 ) ( not ( = ?auto_1564956 ?auto_1564955 ) ) ( SURFACE-AT ?auto_1564950 ?auto_1564954 ) ( ON ?auto_1564950 ?auto_1564953 ) ( CLEAR ?auto_1564950 ) ( not ( = ?auto_1564949 ?auto_1564953 ) ) ( not ( = ?auto_1564950 ?auto_1564953 ) ) ( not ( = ?auto_1564948 ?auto_1564953 ) ) ( SURFACE-AT ?auto_1564948 ?auto_1564952 ) ( CLEAR ?auto_1564948 ) ( IS-CRATE ?auto_1564949 ) ( AVAILABLE ?auto_1564956 ) ( TRUCK-AT ?auto_1564951 ?auto_1564954 ) ( LIFTING ?auto_1564955 ?auto_1564949 ) ( ON ?auto_1564943 ?auto_1564942 ) ( ON ?auto_1564944 ?auto_1564943 ) ( ON ?auto_1564945 ?auto_1564944 ) ( ON ?auto_1564946 ?auto_1564945 ) ( ON ?auto_1564947 ?auto_1564946 ) ( ON ?auto_1564948 ?auto_1564947 ) ( not ( = ?auto_1564942 ?auto_1564943 ) ) ( not ( = ?auto_1564942 ?auto_1564944 ) ) ( not ( = ?auto_1564942 ?auto_1564945 ) ) ( not ( = ?auto_1564942 ?auto_1564946 ) ) ( not ( = ?auto_1564942 ?auto_1564947 ) ) ( not ( = ?auto_1564942 ?auto_1564948 ) ) ( not ( = ?auto_1564942 ?auto_1564949 ) ) ( not ( = ?auto_1564942 ?auto_1564950 ) ) ( not ( = ?auto_1564942 ?auto_1564953 ) ) ( not ( = ?auto_1564943 ?auto_1564944 ) ) ( not ( = ?auto_1564943 ?auto_1564945 ) ) ( not ( = ?auto_1564943 ?auto_1564946 ) ) ( not ( = ?auto_1564943 ?auto_1564947 ) ) ( not ( = ?auto_1564943 ?auto_1564948 ) ) ( not ( = ?auto_1564943 ?auto_1564949 ) ) ( not ( = ?auto_1564943 ?auto_1564950 ) ) ( not ( = ?auto_1564943 ?auto_1564953 ) ) ( not ( = ?auto_1564944 ?auto_1564945 ) ) ( not ( = ?auto_1564944 ?auto_1564946 ) ) ( not ( = ?auto_1564944 ?auto_1564947 ) ) ( not ( = ?auto_1564944 ?auto_1564948 ) ) ( not ( = ?auto_1564944 ?auto_1564949 ) ) ( not ( = ?auto_1564944 ?auto_1564950 ) ) ( not ( = ?auto_1564944 ?auto_1564953 ) ) ( not ( = ?auto_1564945 ?auto_1564946 ) ) ( not ( = ?auto_1564945 ?auto_1564947 ) ) ( not ( = ?auto_1564945 ?auto_1564948 ) ) ( not ( = ?auto_1564945 ?auto_1564949 ) ) ( not ( = ?auto_1564945 ?auto_1564950 ) ) ( not ( = ?auto_1564945 ?auto_1564953 ) ) ( not ( = ?auto_1564946 ?auto_1564947 ) ) ( not ( = ?auto_1564946 ?auto_1564948 ) ) ( not ( = ?auto_1564946 ?auto_1564949 ) ) ( not ( = ?auto_1564946 ?auto_1564950 ) ) ( not ( = ?auto_1564946 ?auto_1564953 ) ) ( not ( = ?auto_1564947 ?auto_1564948 ) ) ( not ( = ?auto_1564947 ?auto_1564949 ) ) ( not ( = ?auto_1564947 ?auto_1564950 ) ) ( not ( = ?auto_1564947 ?auto_1564953 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1564948 ?auto_1564949 ?auto_1564950 )
      ( MAKE-8CRATE-VERIFY ?auto_1564942 ?auto_1564943 ?auto_1564944 ?auto_1564945 ?auto_1564946 ?auto_1564947 ?auto_1564948 ?auto_1564949 ?auto_1564950 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1564957 - SURFACE
      ?auto_1564958 - SURFACE
      ?auto_1564959 - SURFACE
      ?auto_1564960 - SURFACE
      ?auto_1564961 - SURFACE
      ?auto_1564962 - SURFACE
      ?auto_1564963 - SURFACE
      ?auto_1564964 - SURFACE
      ?auto_1564965 - SURFACE
      ?auto_1564966 - SURFACE
    )
    :vars
    (
      ?auto_1564972 - HOIST
      ?auto_1564968 - PLACE
      ?auto_1564970 - PLACE
      ?auto_1564971 - HOIST
      ?auto_1564969 - SURFACE
      ?auto_1564967 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1564972 ?auto_1564968 ) ( IS-CRATE ?auto_1564966 ) ( not ( = ?auto_1564965 ?auto_1564966 ) ) ( not ( = ?auto_1564964 ?auto_1564965 ) ) ( not ( = ?auto_1564964 ?auto_1564966 ) ) ( not ( = ?auto_1564970 ?auto_1564968 ) ) ( HOIST-AT ?auto_1564971 ?auto_1564970 ) ( not ( = ?auto_1564972 ?auto_1564971 ) ) ( SURFACE-AT ?auto_1564966 ?auto_1564970 ) ( ON ?auto_1564966 ?auto_1564969 ) ( CLEAR ?auto_1564966 ) ( not ( = ?auto_1564965 ?auto_1564969 ) ) ( not ( = ?auto_1564966 ?auto_1564969 ) ) ( not ( = ?auto_1564964 ?auto_1564969 ) ) ( SURFACE-AT ?auto_1564964 ?auto_1564968 ) ( CLEAR ?auto_1564964 ) ( IS-CRATE ?auto_1564965 ) ( AVAILABLE ?auto_1564972 ) ( TRUCK-AT ?auto_1564967 ?auto_1564970 ) ( LIFTING ?auto_1564971 ?auto_1564965 ) ( ON ?auto_1564958 ?auto_1564957 ) ( ON ?auto_1564959 ?auto_1564958 ) ( ON ?auto_1564960 ?auto_1564959 ) ( ON ?auto_1564961 ?auto_1564960 ) ( ON ?auto_1564962 ?auto_1564961 ) ( ON ?auto_1564963 ?auto_1564962 ) ( ON ?auto_1564964 ?auto_1564963 ) ( not ( = ?auto_1564957 ?auto_1564958 ) ) ( not ( = ?auto_1564957 ?auto_1564959 ) ) ( not ( = ?auto_1564957 ?auto_1564960 ) ) ( not ( = ?auto_1564957 ?auto_1564961 ) ) ( not ( = ?auto_1564957 ?auto_1564962 ) ) ( not ( = ?auto_1564957 ?auto_1564963 ) ) ( not ( = ?auto_1564957 ?auto_1564964 ) ) ( not ( = ?auto_1564957 ?auto_1564965 ) ) ( not ( = ?auto_1564957 ?auto_1564966 ) ) ( not ( = ?auto_1564957 ?auto_1564969 ) ) ( not ( = ?auto_1564958 ?auto_1564959 ) ) ( not ( = ?auto_1564958 ?auto_1564960 ) ) ( not ( = ?auto_1564958 ?auto_1564961 ) ) ( not ( = ?auto_1564958 ?auto_1564962 ) ) ( not ( = ?auto_1564958 ?auto_1564963 ) ) ( not ( = ?auto_1564958 ?auto_1564964 ) ) ( not ( = ?auto_1564958 ?auto_1564965 ) ) ( not ( = ?auto_1564958 ?auto_1564966 ) ) ( not ( = ?auto_1564958 ?auto_1564969 ) ) ( not ( = ?auto_1564959 ?auto_1564960 ) ) ( not ( = ?auto_1564959 ?auto_1564961 ) ) ( not ( = ?auto_1564959 ?auto_1564962 ) ) ( not ( = ?auto_1564959 ?auto_1564963 ) ) ( not ( = ?auto_1564959 ?auto_1564964 ) ) ( not ( = ?auto_1564959 ?auto_1564965 ) ) ( not ( = ?auto_1564959 ?auto_1564966 ) ) ( not ( = ?auto_1564959 ?auto_1564969 ) ) ( not ( = ?auto_1564960 ?auto_1564961 ) ) ( not ( = ?auto_1564960 ?auto_1564962 ) ) ( not ( = ?auto_1564960 ?auto_1564963 ) ) ( not ( = ?auto_1564960 ?auto_1564964 ) ) ( not ( = ?auto_1564960 ?auto_1564965 ) ) ( not ( = ?auto_1564960 ?auto_1564966 ) ) ( not ( = ?auto_1564960 ?auto_1564969 ) ) ( not ( = ?auto_1564961 ?auto_1564962 ) ) ( not ( = ?auto_1564961 ?auto_1564963 ) ) ( not ( = ?auto_1564961 ?auto_1564964 ) ) ( not ( = ?auto_1564961 ?auto_1564965 ) ) ( not ( = ?auto_1564961 ?auto_1564966 ) ) ( not ( = ?auto_1564961 ?auto_1564969 ) ) ( not ( = ?auto_1564962 ?auto_1564963 ) ) ( not ( = ?auto_1564962 ?auto_1564964 ) ) ( not ( = ?auto_1564962 ?auto_1564965 ) ) ( not ( = ?auto_1564962 ?auto_1564966 ) ) ( not ( = ?auto_1564962 ?auto_1564969 ) ) ( not ( = ?auto_1564963 ?auto_1564964 ) ) ( not ( = ?auto_1564963 ?auto_1564965 ) ) ( not ( = ?auto_1564963 ?auto_1564966 ) ) ( not ( = ?auto_1564963 ?auto_1564969 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1564964 ?auto_1564965 ?auto_1564966 )
      ( MAKE-9CRATE-VERIFY ?auto_1564957 ?auto_1564958 ?auto_1564959 ?auto_1564960 ?auto_1564961 ?auto_1564962 ?auto_1564963 ?auto_1564964 ?auto_1564965 ?auto_1564966 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1564973 - SURFACE
      ?auto_1564974 - SURFACE
      ?auto_1564975 - SURFACE
      ?auto_1564976 - SURFACE
      ?auto_1564977 - SURFACE
      ?auto_1564978 - SURFACE
      ?auto_1564979 - SURFACE
      ?auto_1564980 - SURFACE
      ?auto_1564981 - SURFACE
      ?auto_1564982 - SURFACE
      ?auto_1564983 - SURFACE
    )
    :vars
    (
      ?auto_1564989 - HOIST
      ?auto_1564985 - PLACE
      ?auto_1564987 - PLACE
      ?auto_1564988 - HOIST
      ?auto_1564986 - SURFACE
      ?auto_1564984 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1564989 ?auto_1564985 ) ( IS-CRATE ?auto_1564983 ) ( not ( = ?auto_1564982 ?auto_1564983 ) ) ( not ( = ?auto_1564981 ?auto_1564982 ) ) ( not ( = ?auto_1564981 ?auto_1564983 ) ) ( not ( = ?auto_1564987 ?auto_1564985 ) ) ( HOIST-AT ?auto_1564988 ?auto_1564987 ) ( not ( = ?auto_1564989 ?auto_1564988 ) ) ( SURFACE-AT ?auto_1564983 ?auto_1564987 ) ( ON ?auto_1564983 ?auto_1564986 ) ( CLEAR ?auto_1564983 ) ( not ( = ?auto_1564982 ?auto_1564986 ) ) ( not ( = ?auto_1564983 ?auto_1564986 ) ) ( not ( = ?auto_1564981 ?auto_1564986 ) ) ( SURFACE-AT ?auto_1564981 ?auto_1564985 ) ( CLEAR ?auto_1564981 ) ( IS-CRATE ?auto_1564982 ) ( AVAILABLE ?auto_1564989 ) ( TRUCK-AT ?auto_1564984 ?auto_1564987 ) ( LIFTING ?auto_1564988 ?auto_1564982 ) ( ON ?auto_1564974 ?auto_1564973 ) ( ON ?auto_1564975 ?auto_1564974 ) ( ON ?auto_1564976 ?auto_1564975 ) ( ON ?auto_1564977 ?auto_1564976 ) ( ON ?auto_1564978 ?auto_1564977 ) ( ON ?auto_1564979 ?auto_1564978 ) ( ON ?auto_1564980 ?auto_1564979 ) ( ON ?auto_1564981 ?auto_1564980 ) ( not ( = ?auto_1564973 ?auto_1564974 ) ) ( not ( = ?auto_1564973 ?auto_1564975 ) ) ( not ( = ?auto_1564973 ?auto_1564976 ) ) ( not ( = ?auto_1564973 ?auto_1564977 ) ) ( not ( = ?auto_1564973 ?auto_1564978 ) ) ( not ( = ?auto_1564973 ?auto_1564979 ) ) ( not ( = ?auto_1564973 ?auto_1564980 ) ) ( not ( = ?auto_1564973 ?auto_1564981 ) ) ( not ( = ?auto_1564973 ?auto_1564982 ) ) ( not ( = ?auto_1564973 ?auto_1564983 ) ) ( not ( = ?auto_1564973 ?auto_1564986 ) ) ( not ( = ?auto_1564974 ?auto_1564975 ) ) ( not ( = ?auto_1564974 ?auto_1564976 ) ) ( not ( = ?auto_1564974 ?auto_1564977 ) ) ( not ( = ?auto_1564974 ?auto_1564978 ) ) ( not ( = ?auto_1564974 ?auto_1564979 ) ) ( not ( = ?auto_1564974 ?auto_1564980 ) ) ( not ( = ?auto_1564974 ?auto_1564981 ) ) ( not ( = ?auto_1564974 ?auto_1564982 ) ) ( not ( = ?auto_1564974 ?auto_1564983 ) ) ( not ( = ?auto_1564974 ?auto_1564986 ) ) ( not ( = ?auto_1564975 ?auto_1564976 ) ) ( not ( = ?auto_1564975 ?auto_1564977 ) ) ( not ( = ?auto_1564975 ?auto_1564978 ) ) ( not ( = ?auto_1564975 ?auto_1564979 ) ) ( not ( = ?auto_1564975 ?auto_1564980 ) ) ( not ( = ?auto_1564975 ?auto_1564981 ) ) ( not ( = ?auto_1564975 ?auto_1564982 ) ) ( not ( = ?auto_1564975 ?auto_1564983 ) ) ( not ( = ?auto_1564975 ?auto_1564986 ) ) ( not ( = ?auto_1564976 ?auto_1564977 ) ) ( not ( = ?auto_1564976 ?auto_1564978 ) ) ( not ( = ?auto_1564976 ?auto_1564979 ) ) ( not ( = ?auto_1564976 ?auto_1564980 ) ) ( not ( = ?auto_1564976 ?auto_1564981 ) ) ( not ( = ?auto_1564976 ?auto_1564982 ) ) ( not ( = ?auto_1564976 ?auto_1564983 ) ) ( not ( = ?auto_1564976 ?auto_1564986 ) ) ( not ( = ?auto_1564977 ?auto_1564978 ) ) ( not ( = ?auto_1564977 ?auto_1564979 ) ) ( not ( = ?auto_1564977 ?auto_1564980 ) ) ( not ( = ?auto_1564977 ?auto_1564981 ) ) ( not ( = ?auto_1564977 ?auto_1564982 ) ) ( not ( = ?auto_1564977 ?auto_1564983 ) ) ( not ( = ?auto_1564977 ?auto_1564986 ) ) ( not ( = ?auto_1564978 ?auto_1564979 ) ) ( not ( = ?auto_1564978 ?auto_1564980 ) ) ( not ( = ?auto_1564978 ?auto_1564981 ) ) ( not ( = ?auto_1564978 ?auto_1564982 ) ) ( not ( = ?auto_1564978 ?auto_1564983 ) ) ( not ( = ?auto_1564978 ?auto_1564986 ) ) ( not ( = ?auto_1564979 ?auto_1564980 ) ) ( not ( = ?auto_1564979 ?auto_1564981 ) ) ( not ( = ?auto_1564979 ?auto_1564982 ) ) ( not ( = ?auto_1564979 ?auto_1564983 ) ) ( not ( = ?auto_1564979 ?auto_1564986 ) ) ( not ( = ?auto_1564980 ?auto_1564981 ) ) ( not ( = ?auto_1564980 ?auto_1564982 ) ) ( not ( = ?auto_1564980 ?auto_1564983 ) ) ( not ( = ?auto_1564980 ?auto_1564986 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1564981 ?auto_1564982 ?auto_1564983 )
      ( MAKE-10CRATE-VERIFY ?auto_1564973 ?auto_1564974 ?auto_1564975 ?auto_1564976 ?auto_1564977 ?auto_1564978 ?auto_1564979 ?auto_1564980 ?auto_1564981 ?auto_1564982 ?auto_1564983 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1564990 - SURFACE
      ?auto_1564991 - SURFACE
      ?auto_1564992 - SURFACE
      ?auto_1564993 - SURFACE
      ?auto_1564994 - SURFACE
      ?auto_1564995 - SURFACE
      ?auto_1564996 - SURFACE
      ?auto_1564997 - SURFACE
      ?auto_1564998 - SURFACE
      ?auto_1564999 - SURFACE
      ?auto_1565000 - SURFACE
      ?auto_1565001 - SURFACE
    )
    :vars
    (
      ?auto_1565007 - HOIST
      ?auto_1565003 - PLACE
      ?auto_1565005 - PLACE
      ?auto_1565006 - HOIST
      ?auto_1565004 - SURFACE
      ?auto_1565002 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565007 ?auto_1565003 ) ( IS-CRATE ?auto_1565001 ) ( not ( = ?auto_1565000 ?auto_1565001 ) ) ( not ( = ?auto_1564999 ?auto_1565000 ) ) ( not ( = ?auto_1564999 ?auto_1565001 ) ) ( not ( = ?auto_1565005 ?auto_1565003 ) ) ( HOIST-AT ?auto_1565006 ?auto_1565005 ) ( not ( = ?auto_1565007 ?auto_1565006 ) ) ( SURFACE-AT ?auto_1565001 ?auto_1565005 ) ( ON ?auto_1565001 ?auto_1565004 ) ( CLEAR ?auto_1565001 ) ( not ( = ?auto_1565000 ?auto_1565004 ) ) ( not ( = ?auto_1565001 ?auto_1565004 ) ) ( not ( = ?auto_1564999 ?auto_1565004 ) ) ( SURFACE-AT ?auto_1564999 ?auto_1565003 ) ( CLEAR ?auto_1564999 ) ( IS-CRATE ?auto_1565000 ) ( AVAILABLE ?auto_1565007 ) ( TRUCK-AT ?auto_1565002 ?auto_1565005 ) ( LIFTING ?auto_1565006 ?auto_1565000 ) ( ON ?auto_1564991 ?auto_1564990 ) ( ON ?auto_1564992 ?auto_1564991 ) ( ON ?auto_1564993 ?auto_1564992 ) ( ON ?auto_1564994 ?auto_1564993 ) ( ON ?auto_1564995 ?auto_1564994 ) ( ON ?auto_1564996 ?auto_1564995 ) ( ON ?auto_1564997 ?auto_1564996 ) ( ON ?auto_1564998 ?auto_1564997 ) ( ON ?auto_1564999 ?auto_1564998 ) ( not ( = ?auto_1564990 ?auto_1564991 ) ) ( not ( = ?auto_1564990 ?auto_1564992 ) ) ( not ( = ?auto_1564990 ?auto_1564993 ) ) ( not ( = ?auto_1564990 ?auto_1564994 ) ) ( not ( = ?auto_1564990 ?auto_1564995 ) ) ( not ( = ?auto_1564990 ?auto_1564996 ) ) ( not ( = ?auto_1564990 ?auto_1564997 ) ) ( not ( = ?auto_1564990 ?auto_1564998 ) ) ( not ( = ?auto_1564990 ?auto_1564999 ) ) ( not ( = ?auto_1564990 ?auto_1565000 ) ) ( not ( = ?auto_1564990 ?auto_1565001 ) ) ( not ( = ?auto_1564990 ?auto_1565004 ) ) ( not ( = ?auto_1564991 ?auto_1564992 ) ) ( not ( = ?auto_1564991 ?auto_1564993 ) ) ( not ( = ?auto_1564991 ?auto_1564994 ) ) ( not ( = ?auto_1564991 ?auto_1564995 ) ) ( not ( = ?auto_1564991 ?auto_1564996 ) ) ( not ( = ?auto_1564991 ?auto_1564997 ) ) ( not ( = ?auto_1564991 ?auto_1564998 ) ) ( not ( = ?auto_1564991 ?auto_1564999 ) ) ( not ( = ?auto_1564991 ?auto_1565000 ) ) ( not ( = ?auto_1564991 ?auto_1565001 ) ) ( not ( = ?auto_1564991 ?auto_1565004 ) ) ( not ( = ?auto_1564992 ?auto_1564993 ) ) ( not ( = ?auto_1564992 ?auto_1564994 ) ) ( not ( = ?auto_1564992 ?auto_1564995 ) ) ( not ( = ?auto_1564992 ?auto_1564996 ) ) ( not ( = ?auto_1564992 ?auto_1564997 ) ) ( not ( = ?auto_1564992 ?auto_1564998 ) ) ( not ( = ?auto_1564992 ?auto_1564999 ) ) ( not ( = ?auto_1564992 ?auto_1565000 ) ) ( not ( = ?auto_1564992 ?auto_1565001 ) ) ( not ( = ?auto_1564992 ?auto_1565004 ) ) ( not ( = ?auto_1564993 ?auto_1564994 ) ) ( not ( = ?auto_1564993 ?auto_1564995 ) ) ( not ( = ?auto_1564993 ?auto_1564996 ) ) ( not ( = ?auto_1564993 ?auto_1564997 ) ) ( not ( = ?auto_1564993 ?auto_1564998 ) ) ( not ( = ?auto_1564993 ?auto_1564999 ) ) ( not ( = ?auto_1564993 ?auto_1565000 ) ) ( not ( = ?auto_1564993 ?auto_1565001 ) ) ( not ( = ?auto_1564993 ?auto_1565004 ) ) ( not ( = ?auto_1564994 ?auto_1564995 ) ) ( not ( = ?auto_1564994 ?auto_1564996 ) ) ( not ( = ?auto_1564994 ?auto_1564997 ) ) ( not ( = ?auto_1564994 ?auto_1564998 ) ) ( not ( = ?auto_1564994 ?auto_1564999 ) ) ( not ( = ?auto_1564994 ?auto_1565000 ) ) ( not ( = ?auto_1564994 ?auto_1565001 ) ) ( not ( = ?auto_1564994 ?auto_1565004 ) ) ( not ( = ?auto_1564995 ?auto_1564996 ) ) ( not ( = ?auto_1564995 ?auto_1564997 ) ) ( not ( = ?auto_1564995 ?auto_1564998 ) ) ( not ( = ?auto_1564995 ?auto_1564999 ) ) ( not ( = ?auto_1564995 ?auto_1565000 ) ) ( not ( = ?auto_1564995 ?auto_1565001 ) ) ( not ( = ?auto_1564995 ?auto_1565004 ) ) ( not ( = ?auto_1564996 ?auto_1564997 ) ) ( not ( = ?auto_1564996 ?auto_1564998 ) ) ( not ( = ?auto_1564996 ?auto_1564999 ) ) ( not ( = ?auto_1564996 ?auto_1565000 ) ) ( not ( = ?auto_1564996 ?auto_1565001 ) ) ( not ( = ?auto_1564996 ?auto_1565004 ) ) ( not ( = ?auto_1564997 ?auto_1564998 ) ) ( not ( = ?auto_1564997 ?auto_1564999 ) ) ( not ( = ?auto_1564997 ?auto_1565000 ) ) ( not ( = ?auto_1564997 ?auto_1565001 ) ) ( not ( = ?auto_1564997 ?auto_1565004 ) ) ( not ( = ?auto_1564998 ?auto_1564999 ) ) ( not ( = ?auto_1564998 ?auto_1565000 ) ) ( not ( = ?auto_1564998 ?auto_1565001 ) ) ( not ( = ?auto_1564998 ?auto_1565004 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1564999 ?auto_1565000 ?auto_1565001 )
      ( MAKE-11CRATE-VERIFY ?auto_1564990 ?auto_1564991 ?auto_1564992 ?auto_1564993 ?auto_1564994 ?auto_1564995 ?auto_1564996 ?auto_1564997 ?auto_1564998 ?auto_1564999 ?auto_1565000 ?auto_1565001 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1565008 - SURFACE
      ?auto_1565009 - SURFACE
      ?auto_1565010 - SURFACE
      ?auto_1565011 - SURFACE
      ?auto_1565012 - SURFACE
      ?auto_1565013 - SURFACE
      ?auto_1565014 - SURFACE
      ?auto_1565015 - SURFACE
      ?auto_1565016 - SURFACE
      ?auto_1565017 - SURFACE
      ?auto_1565018 - SURFACE
      ?auto_1565019 - SURFACE
      ?auto_1565020 - SURFACE
    )
    :vars
    (
      ?auto_1565026 - HOIST
      ?auto_1565022 - PLACE
      ?auto_1565024 - PLACE
      ?auto_1565025 - HOIST
      ?auto_1565023 - SURFACE
      ?auto_1565021 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565026 ?auto_1565022 ) ( IS-CRATE ?auto_1565020 ) ( not ( = ?auto_1565019 ?auto_1565020 ) ) ( not ( = ?auto_1565018 ?auto_1565019 ) ) ( not ( = ?auto_1565018 ?auto_1565020 ) ) ( not ( = ?auto_1565024 ?auto_1565022 ) ) ( HOIST-AT ?auto_1565025 ?auto_1565024 ) ( not ( = ?auto_1565026 ?auto_1565025 ) ) ( SURFACE-AT ?auto_1565020 ?auto_1565024 ) ( ON ?auto_1565020 ?auto_1565023 ) ( CLEAR ?auto_1565020 ) ( not ( = ?auto_1565019 ?auto_1565023 ) ) ( not ( = ?auto_1565020 ?auto_1565023 ) ) ( not ( = ?auto_1565018 ?auto_1565023 ) ) ( SURFACE-AT ?auto_1565018 ?auto_1565022 ) ( CLEAR ?auto_1565018 ) ( IS-CRATE ?auto_1565019 ) ( AVAILABLE ?auto_1565026 ) ( TRUCK-AT ?auto_1565021 ?auto_1565024 ) ( LIFTING ?auto_1565025 ?auto_1565019 ) ( ON ?auto_1565009 ?auto_1565008 ) ( ON ?auto_1565010 ?auto_1565009 ) ( ON ?auto_1565011 ?auto_1565010 ) ( ON ?auto_1565012 ?auto_1565011 ) ( ON ?auto_1565013 ?auto_1565012 ) ( ON ?auto_1565014 ?auto_1565013 ) ( ON ?auto_1565015 ?auto_1565014 ) ( ON ?auto_1565016 ?auto_1565015 ) ( ON ?auto_1565017 ?auto_1565016 ) ( ON ?auto_1565018 ?auto_1565017 ) ( not ( = ?auto_1565008 ?auto_1565009 ) ) ( not ( = ?auto_1565008 ?auto_1565010 ) ) ( not ( = ?auto_1565008 ?auto_1565011 ) ) ( not ( = ?auto_1565008 ?auto_1565012 ) ) ( not ( = ?auto_1565008 ?auto_1565013 ) ) ( not ( = ?auto_1565008 ?auto_1565014 ) ) ( not ( = ?auto_1565008 ?auto_1565015 ) ) ( not ( = ?auto_1565008 ?auto_1565016 ) ) ( not ( = ?auto_1565008 ?auto_1565017 ) ) ( not ( = ?auto_1565008 ?auto_1565018 ) ) ( not ( = ?auto_1565008 ?auto_1565019 ) ) ( not ( = ?auto_1565008 ?auto_1565020 ) ) ( not ( = ?auto_1565008 ?auto_1565023 ) ) ( not ( = ?auto_1565009 ?auto_1565010 ) ) ( not ( = ?auto_1565009 ?auto_1565011 ) ) ( not ( = ?auto_1565009 ?auto_1565012 ) ) ( not ( = ?auto_1565009 ?auto_1565013 ) ) ( not ( = ?auto_1565009 ?auto_1565014 ) ) ( not ( = ?auto_1565009 ?auto_1565015 ) ) ( not ( = ?auto_1565009 ?auto_1565016 ) ) ( not ( = ?auto_1565009 ?auto_1565017 ) ) ( not ( = ?auto_1565009 ?auto_1565018 ) ) ( not ( = ?auto_1565009 ?auto_1565019 ) ) ( not ( = ?auto_1565009 ?auto_1565020 ) ) ( not ( = ?auto_1565009 ?auto_1565023 ) ) ( not ( = ?auto_1565010 ?auto_1565011 ) ) ( not ( = ?auto_1565010 ?auto_1565012 ) ) ( not ( = ?auto_1565010 ?auto_1565013 ) ) ( not ( = ?auto_1565010 ?auto_1565014 ) ) ( not ( = ?auto_1565010 ?auto_1565015 ) ) ( not ( = ?auto_1565010 ?auto_1565016 ) ) ( not ( = ?auto_1565010 ?auto_1565017 ) ) ( not ( = ?auto_1565010 ?auto_1565018 ) ) ( not ( = ?auto_1565010 ?auto_1565019 ) ) ( not ( = ?auto_1565010 ?auto_1565020 ) ) ( not ( = ?auto_1565010 ?auto_1565023 ) ) ( not ( = ?auto_1565011 ?auto_1565012 ) ) ( not ( = ?auto_1565011 ?auto_1565013 ) ) ( not ( = ?auto_1565011 ?auto_1565014 ) ) ( not ( = ?auto_1565011 ?auto_1565015 ) ) ( not ( = ?auto_1565011 ?auto_1565016 ) ) ( not ( = ?auto_1565011 ?auto_1565017 ) ) ( not ( = ?auto_1565011 ?auto_1565018 ) ) ( not ( = ?auto_1565011 ?auto_1565019 ) ) ( not ( = ?auto_1565011 ?auto_1565020 ) ) ( not ( = ?auto_1565011 ?auto_1565023 ) ) ( not ( = ?auto_1565012 ?auto_1565013 ) ) ( not ( = ?auto_1565012 ?auto_1565014 ) ) ( not ( = ?auto_1565012 ?auto_1565015 ) ) ( not ( = ?auto_1565012 ?auto_1565016 ) ) ( not ( = ?auto_1565012 ?auto_1565017 ) ) ( not ( = ?auto_1565012 ?auto_1565018 ) ) ( not ( = ?auto_1565012 ?auto_1565019 ) ) ( not ( = ?auto_1565012 ?auto_1565020 ) ) ( not ( = ?auto_1565012 ?auto_1565023 ) ) ( not ( = ?auto_1565013 ?auto_1565014 ) ) ( not ( = ?auto_1565013 ?auto_1565015 ) ) ( not ( = ?auto_1565013 ?auto_1565016 ) ) ( not ( = ?auto_1565013 ?auto_1565017 ) ) ( not ( = ?auto_1565013 ?auto_1565018 ) ) ( not ( = ?auto_1565013 ?auto_1565019 ) ) ( not ( = ?auto_1565013 ?auto_1565020 ) ) ( not ( = ?auto_1565013 ?auto_1565023 ) ) ( not ( = ?auto_1565014 ?auto_1565015 ) ) ( not ( = ?auto_1565014 ?auto_1565016 ) ) ( not ( = ?auto_1565014 ?auto_1565017 ) ) ( not ( = ?auto_1565014 ?auto_1565018 ) ) ( not ( = ?auto_1565014 ?auto_1565019 ) ) ( not ( = ?auto_1565014 ?auto_1565020 ) ) ( not ( = ?auto_1565014 ?auto_1565023 ) ) ( not ( = ?auto_1565015 ?auto_1565016 ) ) ( not ( = ?auto_1565015 ?auto_1565017 ) ) ( not ( = ?auto_1565015 ?auto_1565018 ) ) ( not ( = ?auto_1565015 ?auto_1565019 ) ) ( not ( = ?auto_1565015 ?auto_1565020 ) ) ( not ( = ?auto_1565015 ?auto_1565023 ) ) ( not ( = ?auto_1565016 ?auto_1565017 ) ) ( not ( = ?auto_1565016 ?auto_1565018 ) ) ( not ( = ?auto_1565016 ?auto_1565019 ) ) ( not ( = ?auto_1565016 ?auto_1565020 ) ) ( not ( = ?auto_1565016 ?auto_1565023 ) ) ( not ( = ?auto_1565017 ?auto_1565018 ) ) ( not ( = ?auto_1565017 ?auto_1565019 ) ) ( not ( = ?auto_1565017 ?auto_1565020 ) ) ( not ( = ?auto_1565017 ?auto_1565023 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565018 ?auto_1565019 ?auto_1565020 )
      ( MAKE-12CRATE-VERIFY ?auto_1565008 ?auto_1565009 ?auto_1565010 ?auto_1565011 ?auto_1565012 ?auto_1565013 ?auto_1565014 ?auto_1565015 ?auto_1565016 ?auto_1565017 ?auto_1565018 ?auto_1565019 ?auto_1565020 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1565027 - SURFACE
      ?auto_1565028 - SURFACE
      ?auto_1565029 - SURFACE
      ?auto_1565030 - SURFACE
      ?auto_1565031 - SURFACE
      ?auto_1565032 - SURFACE
      ?auto_1565033 - SURFACE
      ?auto_1565034 - SURFACE
      ?auto_1565035 - SURFACE
      ?auto_1565036 - SURFACE
      ?auto_1565037 - SURFACE
      ?auto_1565038 - SURFACE
      ?auto_1565039 - SURFACE
      ?auto_1565040 - SURFACE
    )
    :vars
    (
      ?auto_1565046 - HOIST
      ?auto_1565042 - PLACE
      ?auto_1565044 - PLACE
      ?auto_1565045 - HOIST
      ?auto_1565043 - SURFACE
      ?auto_1565041 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565046 ?auto_1565042 ) ( IS-CRATE ?auto_1565040 ) ( not ( = ?auto_1565039 ?auto_1565040 ) ) ( not ( = ?auto_1565038 ?auto_1565039 ) ) ( not ( = ?auto_1565038 ?auto_1565040 ) ) ( not ( = ?auto_1565044 ?auto_1565042 ) ) ( HOIST-AT ?auto_1565045 ?auto_1565044 ) ( not ( = ?auto_1565046 ?auto_1565045 ) ) ( SURFACE-AT ?auto_1565040 ?auto_1565044 ) ( ON ?auto_1565040 ?auto_1565043 ) ( CLEAR ?auto_1565040 ) ( not ( = ?auto_1565039 ?auto_1565043 ) ) ( not ( = ?auto_1565040 ?auto_1565043 ) ) ( not ( = ?auto_1565038 ?auto_1565043 ) ) ( SURFACE-AT ?auto_1565038 ?auto_1565042 ) ( CLEAR ?auto_1565038 ) ( IS-CRATE ?auto_1565039 ) ( AVAILABLE ?auto_1565046 ) ( TRUCK-AT ?auto_1565041 ?auto_1565044 ) ( LIFTING ?auto_1565045 ?auto_1565039 ) ( ON ?auto_1565028 ?auto_1565027 ) ( ON ?auto_1565029 ?auto_1565028 ) ( ON ?auto_1565030 ?auto_1565029 ) ( ON ?auto_1565031 ?auto_1565030 ) ( ON ?auto_1565032 ?auto_1565031 ) ( ON ?auto_1565033 ?auto_1565032 ) ( ON ?auto_1565034 ?auto_1565033 ) ( ON ?auto_1565035 ?auto_1565034 ) ( ON ?auto_1565036 ?auto_1565035 ) ( ON ?auto_1565037 ?auto_1565036 ) ( ON ?auto_1565038 ?auto_1565037 ) ( not ( = ?auto_1565027 ?auto_1565028 ) ) ( not ( = ?auto_1565027 ?auto_1565029 ) ) ( not ( = ?auto_1565027 ?auto_1565030 ) ) ( not ( = ?auto_1565027 ?auto_1565031 ) ) ( not ( = ?auto_1565027 ?auto_1565032 ) ) ( not ( = ?auto_1565027 ?auto_1565033 ) ) ( not ( = ?auto_1565027 ?auto_1565034 ) ) ( not ( = ?auto_1565027 ?auto_1565035 ) ) ( not ( = ?auto_1565027 ?auto_1565036 ) ) ( not ( = ?auto_1565027 ?auto_1565037 ) ) ( not ( = ?auto_1565027 ?auto_1565038 ) ) ( not ( = ?auto_1565027 ?auto_1565039 ) ) ( not ( = ?auto_1565027 ?auto_1565040 ) ) ( not ( = ?auto_1565027 ?auto_1565043 ) ) ( not ( = ?auto_1565028 ?auto_1565029 ) ) ( not ( = ?auto_1565028 ?auto_1565030 ) ) ( not ( = ?auto_1565028 ?auto_1565031 ) ) ( not ( = ?auto_1565028 ?auto_1565032 ) ) ( not ( = ?auto_1565028 ?auto_1565033 ) ) ( not ( = ?auto_1565028 ?auto_1565034 ) ) ( not ( = ?auto_1565028 ?auto_1565035 ) ) ( not ( = ?auto_1565028 ?auto_1565036 ) ) ( not ( = ?auto_1565028 ?auto_1565037 ) ) ( not ( = ?auto_1565028 ?auto_1565038 ) ) ( not ( = ?auto_1565028 ?auto_1565039 ) ) ( not ( = ?auto_1565028 ?auto_1565040 ) ) ( not ( = ?auto_1565028 ?auto_1565043 ) ) ( not ( = ?auto_1565029 ?auto_1565030 ) ) ( not ( = ?auto_1565029 ?auto_1565031 ) ) ( not ( = ?auto_1565029 ?auto_1565032 ) ) ( not ( = ?auto_1565029 ?auto_1565033 ) ) ( not ( = ?auto_1565029 ?auto_1565034 ) ) ( not ( = ?auto_1565029 ?auto_1565035 ) ) ( not ( = ?auto_1565029 ?auto_1565036 ) ) ( not ( = ?auto_1565029 ?auto_1565037 ) ) ( not ( = ?auto_1565029 ?auto_1565038 ) ) ( not ( = ?auto_1565029 ?auto_1565039 ) ) ( not ( = ?auto_1565029 ?auto_1565040 ) ) ( not ( = ?auto_1565029 ?auto_1565043 ) ) ( not ( = ?auto_1565030 ?auto_1565031 ) ) ( not ( = ?auto_1565030 ?auto_1565032 ) ) ( not ( = ?auto_1565030 ?auto_1565033 ) ) ( not ( = ?auto_1565030 ?auto_1565034 ) ) ( not ( = ?auto_1565030 ?auto_1565035 ) ) ( not ( = ?auto_1565030 ?auto_1565036 ) ) ( not ( = ?auto_1565030 ?auto_1565037 ) ) ( not ( = ?auto_1565030 ?auto_1565038 ) ) ( not ( = ?auto_1565030 ?auto_1565039 ) ) ( not ( = ?auto_1565030 ?auto_1565040 ) ) ( not ( = ?auto_1565030 ?auto_1565043 ) ) ( not ( = ?auto_1565031 ?auto_1565032 ) ) ( not ( = ?auto_1565031 ?auto_1565033 ) ) ( not ( = ?auto_1565031 ?auto_1565034 ) ) ( not ( = ?auto_1565031 ?auto_1565035 ) ) ( not ( = ?auto_1565031 ?auto_1565036 ) ) ( not ( = ?auto_1565031 ?auto_1565037 ) ) ( not ( = ?auto_1565031 ?auto_1565038 ) ) ( not ( = ?auto_1565031 ?auto_1565039 ) ) ( not ( = ?auto_1565031 ?auto_1565040 ) ) ( not ( = ?auto_1565031 ?auto_1565043 ) ) ( not ( = ?auto_1565032 ?auto_1565033 ) ) ( not ( = ?auto_1565032 ?auto_1565034 ) ) ( not ( = ?auto_1565032 ?auto_1565035 ) ) ( not ( = ?auto_1565032 ?auto_1565036 ) ) ( not ( = ?auto_1565032 ?auto_1565037 ) ) ( not ( = ?auto_1565032 ?auto_1565038 ) ) ( not ( = ?auto_1565032 ?auto_1565039 ) ) ( not ( = ?auto_1565032 ?auto_1565040 ) ) ( not ( = ?auto_1565032 ?auto_1565043 ) ) ( not ( = ?auto_1565033 ?auto_1565034 ) ) ( not ( = ?auto_1565033 ?auto_1565035 ) ) ( not ( = ?auto_1565033 ?auto_1565036 ) ) ( not ( = ?auto_1565033 ?auto_1565037 ) ) ( not ( = ?auto_1565033 ?auto_1565038 ) ) ( not ( = ?auto_1565033 ?auto_1565039 ) ) ( not ( = ?auto_1565033 ?auto_1565040 ) ) ( not ( = ?auto_1565033 ?auto_1565043 ) ) ( not ( = ?auto_1565034 ?auto_1565035 ) ) ( not ( = ?auto_1565034 ?auto_1565036 ) ) ( not ( = ?auto_1565034 ?auto_1565037 ) ) ( not ( = ?auto_1565034 ?auto_1565038 ) ) ( not ( = ?auto_1565034 ?auto_1565039 ) ) ( not ( = ?auto_1565034 ?auto_1565040 ) ) ( not ( = ?auto_1565034 ?auto_1565043 ) ) ( not ( = ?auto_1565035 ?auto_1565036 ) ) ( not ( = ?auto_1565035 ?auto_1565037 ) ) ( not ( = ?auto_1565035 ?auto_1565038 ) ) ( not ( = ?auto_1565035 ?auto_1565039 ) ) ( not ( = ?auto_1565035 ?auto_1565040 ) ) ( not ( = ?auto_1565035 ?auto_1565043 ) ) ( not ( = ?auto_1565036 ?auto_1565037 ) ) ( not ( = ?auto_1565036 ?auto_1565038 ) ) ( not ( = ?auto_1565036 ?auto_1565039 ) ) ( not ( = ?auto_1565036 ?auto_1565040 ) ) ( not ( = ?auto_1565036 ?auto_1565043 ) ) ( not ( = ?auto_1565037 ?auto_1565038 ) ) ( not ( = ?auto_1565037 ?auto_1565039 ) ) ( not ( = ?auto_1565037 ?auto_1565040 ) ) ( not ( = ?auto_1565037 ?auto_1565043 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565038 ?auto_1565039 ?auto_1565040 )
      ( MAKE-13CRATE-VERIFY ?auto_1565027 ?auto_1565028 ?auto_1565029 ?auto_1565030 ?auto_1565031 ?auto_1565032 ?auto_1565033 ?auto_1565034 ?auto_1565035 ?auto_1565036 ?auto_1565037 ?auto_1565038 ?auto_1565039 ?auto_1565040 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1565047 - SURFACE
      ?auto_1565048 - SURFACE
    )
    :vars
    (
      ?auto_1565054 - HOIST
      ?auto_1565050 - PLACE
      ?auto_1565055 - SURFACE
      ?auto_1565052 - PLACE
      ?auto_1565053 - HOIST
      ?auto_1565051 - SURFACE
      ?auto_1565049 - TRUCK
      ?auto_1565056 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565054 ?auto_1565050 ) ( IS-CRATE ?auto_1565048 ) ( not ( = ?auto_1565047 ?auto_1565048 ) ) ( not ( = ?auto_1565055 ?auto_1565047 ) ) ( not ( = ?auto_1565055 ?auto_1565048 ) ) ( not ( = ?auto_1565052 ?auto_1565050 ) ) ( HOIST-AT ?auto_1565053 ?auto_1565052 ) ( not ( = ?auto_1565054 ?auto_1565053 ) ) ( SURFACE-AT ?auto_1565048 ?auto_1565052 ) ( ON ?auto_1565048 ?auto_1565051 ) ( CLEAR ?auto_1565048 ) ( not ( = ?auto_1565047 ?auto_1565051 ) ) ( not ( = ?auto_1565048 ?auto_1565051 ) ) ( not ( = ?auto_1565055 ?auto_1565051 ) ) ( SURFACE-AT ?auto_1565055 ?auto_1565050 ) ( CLEAR ?auto_1565055 ) ( IS-CRATE ?auto_1565047 ) ( AVAILABLE ?auto_1565054 ) ( TRUCK-AT ?auto_1565049 ?auto_1565052 ) ( AVAILABLE ?auto_1565053 ) ( SURFACE-AT ?auto_1565047 ?auto_1565052 ) ( ON ?auto_1565047 ?auto_1565056 ) ( CLEAR ?auto_1565047 ) ( not ( = ?auto_1565047 ?auto_1565056 ) ) ( not ( = ?auto_1565048 ?auto_1565056 ) ) ( not ( = ?auto_1565055 ?auto_1565056 ) ) ( not ( = ?auto_1565051 ?auto_1565056 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1565053 ?auto_1565047 ?auto_1565056 ?auto_1565052 )
      ( MAKE-2CRATE ?auto_1565055 ?auto_1565047 ?auto_1565048 )
      ( MAKE-1CRATE-VERIFY ?auto_1565047 ?auto_1565048 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1565057 - SURFACE
      ?auto_1565058 - SURFACE
      ?auto_1565059 - SURFACE
    )
    :vars
    (
      ?auto_1565060 - HOIST
      ?auto_1565063 - PLACE
      ?auto_1565066 - PLACE
      ?auto_1565065 - HOIST
      ?auto_1565062 - SURFACE
      ?auto_1565061 - TRUCK
      ?auto_1565064 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565060 ?auto_1565063 ) ( IS-CRATE ?auto_1565059 ) ( not ( = ?auto_1565058 ?auto_1565059 ) ) ( not ( = ?auto_1565057 ?auto_1565058 ) ) ( not ( = ?auto_1565057 ?auto_1565059 ) ) ( not ( = ?auto_1565066 ?auto_1565063 ) ) ( HOIST-AT ?auto_1565065 ?auto_1565066 ) ( not ( = ?auto_1565060 ?auto_1565065 ) ) ( SURFACE-AT ?auto_1565059 ?auto_1565066 ) ( ON ?auto_1565059 ?auto_1565062 ) ( CLEAR ?auto_1565059 ) ( not ( = ?auto_1565058 ?auto_1565062 ) ) ( not ( = ?auto_1565059 ?auto_1565062 ) ) ( not ( = ?auto_1565057 ?auto_1565062 ) ) ( SURFACE-AT ?auto_1565057 ?auto_1565063 ) ( CLEAR ?auto_1565057 ) ( IS-CRATE ?auto_1565058 ) ( AVAILABLE ?auto_1565060 ) ( TRUCK-AT ?auto_1565061 ?auto_1565066 ) ( AVAILABLE ?auto_1565065 ) ( SURFACE-AT ?auto_1565058 ?auto_1565066 ) ( ON ?auto_1565058 ?auto_1565064 ) ( CLEAR ?auto_1565058 ) ( not ( = ?auto_1565058 ?auto_1565064 ) ) ( not ( = ?auto_1565059 ?auto_1565064 ) ) ( not ( = ?auto_1565057 ?auto_1565064 ) ) ( not ( = ?auto_1565062 ?auto_1565064 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1565058 ?auto_1565059 )
      ( MAKE-2CRATE-VERIFY ?auto_1565057 ?auto_1565058 ?auto_1565059 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1565067 - SURFACE
      ?auto_1565068 - SURFACE
      ?auto_1565069 - SURFACE
      ?auto_1565070 - SURFACE
    )
    :vars
    (
      ?auto_1565077 - HOIST
      ?auto_1565072 - PLACE
      ?auto_1565075 - PLACE
      ?auto_1565076 - HOIST
      ?auto_1565071 - SURFACE
      ?auto_1565073 - TRUCK
      ?auto_1565074 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565077 ?auto_1565072 ) ( IS-CRATE ?auto_1565070 ) ( not ( = ?auto_1565069 ?auto_1565070 ) ) ( not ( = ?auto_1565068 ?auto_1565069 ) ) ( not ( = ?auto_1565068 ?auto_1565070 ) ) ( not ( = ?auto_1565075 ?auto_1565072 ) ) ( HOIST-AT ?auto_1565076 ?auto_1565075 ) ( not ( = ?auto_1565077 ?auto_1565076 ) ) ( SURFACE-AT ?auto_1565070 ?auto_1565075 ) ( ON ?auto_1565070 ?auto_1565071 ) ( CLEAR ?auto_1565070 ) ( not ( = ?auto_1565069 ?auto_1565071 ) ) ( not ( = ?auto_1565070 ?auto_1565071 ) ) ( not ( = ?auto_1565068 ?auto_1565071 ) ) ( SURFACE-AT ?auto_1565068 ?auto_1565072 ) ( CLEAR ?auto_1565068 ) ( IS-CRATE ?auto_1565069 ) ( AVAILABLE ?auto_1565077 ) ( TRUCK-AT ?auto_1565073 ?auto_1565075 ) ( AVAILABLE ?auto_1565076 ) ( SURFACE-AT ?auto_1565069 ?auto_1565075 ) ( ON ?auto_1565069 ?auto_1565074 ) ( CLEAR ?auto_1565069 ) ( not ( = ?auto_1565069 ?auto_1565074 ) ) ( not ( = ?auto_1565070 ?auto_1565074 ) ) ( not ( = ?auto_1565068 ?auto_1565074 ) ) ( not ( = ?auto_1565071 ?auto_1565074 ) ) ( ON ?auto_1565068 ?auto_1565067 ) ( not ( = ?auto_1565067 ?auto_1565068 ) ) ( not ( = ?auto_1565067 ?auto_1565069 ) ) ( not ( = ?auto_1565067 ?auto_1565070 ) ) ( not ( = ?auto_1565067 ?auto_1565071 ) ) ( not ( = ?auto_1565067 ?auto_1565074 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565068 ?auto_1565069 ?auto_1565070 )
      ( MAKE-3CRATE-VERIFY ?auto_1565067 ?auto_1565068 ?auto_1565069 ?auto_1565070 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1565078 - SURFACE
      ?auto_1565079 - SURFACE
      ?auto_1565080 - SURFACE
      ?auto_1565081 - SURFACE
      ?auto_1565082 - SURFACE
    )
    :vars
    (
      ?auto_1565089 - HOIST
      ?auto_1565084 - PLACE
      ?auto_1565087 - PLACE
      ?auto_1565088 - HOIST
      ?auto_1565083 - SURFACE
      ?auto_1565085 - TRUCK
      ?auto_1565086 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565089 ?auto_1565084 ) ( IS-CRATE ?auto_1565082 ) ( not ( = ?auto_1565081 ?auto_1565082 ) ) ( not ( = ?auto_1565080 ?auto_1565081 ) ) ( not ( = ?auto_1565080 ?auto_1565082 ) ) ( not ( = ?auto_1565087 ?auto_1565084 ) ) ( HOIST-AT ?auto_1565088 ?auto_1565087 ) ( not ( = ?auto_1565089 ?auto_1565088 ) ) ( SURFACE-AT ?auto_1565082 ?auto_1565087 ) ( ON ?auto_1565082 ?auto_1565083 ) ( CLEAR ?auto_1565082 ) ( not ( = ?auto_1565081 ?auto_1565083 ) ) ( not ( = ?auto_1565082 ?auto_1565083 ) ) ( not ( = ?auto_1565080 ?auto_1565083 ) ) ( SURFACE-AT ?auto_1565080 ?auto_1565084 ) ( CLEAR ?auto_1565080 ) ( IS-CRATE ?auto_1565081 ) ( AVAILABLE ?auto_1565089 ) ( TRUCK-AT ?auto_1565085 ?auto_1565087 ) ( AVAILABLE ?auto_1565088 ) ( SURFACE-AT ?auto_1565081 ?auto_1565087 ) ( ON ?auto_1565081 ?auto_1565086 ) ( CLEAR ?auto_1565081 ) ( not ( = ?auto_1565081 ?auto_1565086 ) ) ( not ( = ?auto_1565082 ?auto_1565086 ) ) ( not ( = ?auto_1565080 ?auto_1565086 ) ) ( not ( = ?auto_1565083 ?auto_1565086 ) ) ( ON ?auto_1565079 ?auto_1565078 ) ( ON ?auto_1565080 ?auto_1565079 ) ( not ( = ?auto_1565078 ?auto_1565079 ) ) ( not ( = ?auto_1565078 ?auto_1565080 ) ) ( not ( = ?auto_1565078 ?auto_1565081 ) ) ( not ( = ?auto_1565078 ?auto_1565082 ) ) ( not ( = ?auto_1565078 ?auto_1565083 ) ) ( not ( = ?auto_1565078 ?auto_1565086 ) ) ( not ( = ?auto_1565079 ?auto_1565080 ) ) ( not ( = ?auto_1565079 ?auto_1565081 ) ) ( not ( = ?auto_1565079 ?auto_1565082 ) ) ( not ( = ?auto_1565079 ?auto_1565083 ) ) ( not ( = ?auto_1565079 ?auto_1565086 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565080 ?auto_1565081 ?auto_1565082 )
      ( MAKE-4CRATE-VERIFY ?auto_1565078 ?auto_1565079 ?auto_1565080 ?auto_1565081 ?auto_1565082 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1565090 - SURFACE
      ?auto_1565091 - SURFACE
      ?auto_1565092 - SURFACE
      ?auto_1565093 - SURFACE
      ?auto_1565094 - SURFACE
      ?auto_1565095 - SURFACE
    )
    :vars
    (
      ?auto_1565102 - HOIST
      ?auto_1565097 - PLACE
      ?auto_1565100 - PLACE
      ?auto_1565101 - HOIST
      ?auto_1565096 - SURFACE
      ?auto_1565098 - TRUCK
      ?auto_1565099 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565102 ?auto_1565097 ) ( IS-CRATE ?auto_1565095 ) ( not ( = ?auto_1565094 ?auto_1565095 ) ) ( not ( = ?auto_1565093 ?auto_1565094 ) ) ( not ( = ?auto_1565093 ?auto_1565095 ) ) ( not ( = ?auto_1565100 ?auto_1565097 ) ) ( HOIST-AT ?auto_1565101 ?auto_1565100 ) ( not ( = ?auto_1565102 ?auto_1565101 ) ) ( SURFACE-AT ?auto_1565095 ?auto_1565100 ) ( ON ?auto_1565095 ?auto_1565096 ) ( CLEAR ?auto_1565095 ) ( not ( = ?auto_1565094 ?auto_1565096 ) ) ( not ( = ?auto_1565095 ?auto_1565096 ) ) ( not ( = ?auto_1565093 ?auto_1565096 ) ) ( SURFACE-AT ?auto_1565093 ?auto_1565097 ) ( CLEAR ?auto_1565093 ) ( IS-CRATE ?auto_1565094 ) ( AVAILABLE ?auto_1565102 ) ( TRUCK-AT ?auto_1565098 ?auto_1565100 ) ( AVAILABLE ?auto_1565101 ) ( SURFACE-AT ?auto_1565094 ?auto_1565100 ) ( ON ?auto_1565094 ?auto_1565099 ) ( CLEAR ?auto_1565094 ) ( not ( = ?auto_1565094 ?auto_1565099 ) ) ( not ( = ?auto_1565095 ?auto_1565099 ) ) ( not ( = ?auto_1565093 ?auto_1565099 ) ) ( not ( = ?auto_1565096 ?auto_1565099 ) ) ( ON ?auto_1565091 ?auto_1565090 ) ( ON ?auto_1565092 ?auto_1565091 ) ( ON ?auto_1565093 ?auto_1565092 ) ( not ( = ?auto_1565090 ?auto_1565091 ) ) ( not ( = ?auto_1565090 ?auto_1565092 ) ) ( not ( = ?auto_1565090 ?auto_1565093 ) ) ( not ( = ?auto_1565090 ?auto_1565094 ) ) ( not ( = ?auto_1565090 ?auto_1565095 ) ) ( not ( = ?auto_1565090 ?auto_1565096 ) ) ( not ( = ?auto_1565090 ?auto_1565099 ) ) ( not ( = ?auto_1565091 ?auto_1565092 ) ) ( not ( = ?auto_1565091 ?auto_1565093 ) ) ( not ( = ?auto_1565091 ?auto_1565094 ) ) ( not ( = ?auto_1565091 ?auto_1565095 ) ) ( not ( = ?auto_1565091 ?auto_1565096 ) ) ( not ( = ?auto_1565091 ?auto_1565099 ) ) ( not ( = ?auto_1565092 ?auto_1565093 ) ) ( not ( = ?auto_1565092 ?auto_1565094 ) ) ( not ( = ?auto_1565092 ?auto_1565095 ) ) ( not ( = ?auto_1565092 ?auto_1565096 ) ) ( not ( = ?auto_1565092 ?auto_1565099 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565093 ?auto_1565094 ?auto_1565095 )
      ( MAKE-5CRATE-VERIFY ?auto_1565090 ?auto_1565091 ?auto_1565092 ?auto_1565093 ?auto_1565094 ?auto_1565095 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1565103 - SURFACE
      ?auto_1565104 - SURFACE
      ?auto_1565105 - SURFACE
      ?auto_1565106 - SURFACE
      ?auto_1565107 - SURFACE
      ?auto_1565108 - SURFACE
      ?auto_1565109 - SURFACE
    )
    :vars
    (
      ?auto_1565116 - HOIST
      ?auto_1565111 - PLACE
      ?auto_1565114 - PLACE
      ?auto_1565115 - HOIST
      ?auto_1565110 - SURFACE
      ?auto_1565112 - TRUCK
      ?auto_1565113 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565116 ?auto_1565111 ) ( IS-CRATE ?auto_1565109 ) ( not ( = ?auto_1565108 ?auto_1565109 ) ) ( not ( = ?auto_1565107 ?auto_1565108 ) ) ( not ( = ?auto_1565107 ?auto_1565109 ) ) ( not ( = ?auto_1565114 ?auto_1565111 ) ) ( HOIST-AT ?auto_1565115 ?auto_1565114 ) ( not ( = ?auto_1565116 ?auto_1565115 ) ) ( SURFACE-AT ?auto_1565109 ?auto_1565114 ) ( ON ?auto_1565109 ?auto_1565110 ) ( CLEAR ?auto_1565109 ) ( not ( = ?auto_1565108 ?auto_1565110 ) ) ( not ( = ?auto_1565109 ?auto_1565110 ) ) ( not ( = ?auto_1565107 ?auto_1565110 ) ) ( SURFACE-AT ?auto_1565107 ?auto_1565111 ) ( CLEAR ?auto_1565107 ) ( IS-CRATE ?auto_1565108 ) ( AVAILABLE ?auto_1565116 ) ( TRUCK-AT ?auto_1565112 ?auto_1565114 ) ( AVAILABLE ?auto_1565115 ) ( SURFACE-AT ?auto_1565108 ?auto_1565114 ) ( ON ?auto_1565108 ?auto_1565113 ) ( CLEAR ?auto_1565108 ) ( not ( = ?auto_1565108 ?auto_1565113 ) ) ( not ( = ?auto_1565109 ?auto_1565113 ) ) ( not ( = ?auto_1565107 ?auto_1565113 ) ) ( not ( = ?auto_1565110 ?auto_1565113 ) ) ( ON ?auto_1565104 ?auto_1565103 ) ( ON ?auto_1565105 ?auto_1565104 ) ( ON ?auto_1565106 ?auto_1565105 ) ( ON ?auto_1565107 ?auto_1565106 ) ( not ( = ?auto_1565103 ?auto_1565104 ) ) ( not ( = ?auto_1565103 ?auto_1565105 ) ) ( not ( = ?auto_1565103 ?auto_1565106 ) ) ( not ( = ?auto_1565103 ?auto_1565107 ) ) ( not ( = ?auto_1565103 ?auto_1565108 ) ) ( not ( = ?auto_1565103 ?auto_1565109 ) ) ( not ( = ?auto_1565103 ?auto_1565110 ) ) ( not ( = ?auto_1565103 ?auto_1565113 ) ) ( not ( = ?auto_1565104 ?auto_1565105 ) ) ( not ( = ?auto_1565104 ?auto_1565106 ) ) ( not ( = ?auto_1565104 ?auto_1565107 ) ) ( not ( = ?auto_1565104 ?auto_1565108 ) ) ( not ( = ?auto_1565104 ?auto_1565109 ) ) ( not ( = ?auto_1565104 ?auto_1565110 ) ) ( not ( = ?auto_1565104 ?auto_1565113 ) ) ( not ( = ?auto_1565105 ?auto_1565106 ) ) ( not ( = ?auto_1565105 ?auto_1565107 ) ) ( not ( = ?auto_1565105 ?auto_1565108 ) ) ( not ( = ?auto_1565105 ?auto_1565109 ) ) ( not ( = ?auto_1565105 ?auto_1565110 ) ) ( not ( = ?auto_1565105 ?auto_1565113 ) ) ( not ( = ?auto_1565106 ?auto_1565107 ) ) ( not ( = ?auto_1565106 ?auto_1565108 ) ) ( not ( = ?auto_1565106 ?auto_1565109 ) ) ( not ( = ?auto_1565106 ?auto_1565110 ) ) ( not ( = ?auto_1565106 ?auto_1565113 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565107 ?auto_1565108 ?auto_1565109 )
      ( MAKE-6CRATE-VERIFY ?auto_1565103 ?auto_1565104 ?auto_1565105 ?auto_1565106 ?auto_1565107 ?auto_1565108 ?auto_1565109 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1565117 - SURFACE
      ?auto_1565118 - SURFACE
      ?auto_1565119 - SURFACE
      ?auto_1565120 - SURFACE
      ?auto_1565121 - SURFACE
      ?auto_1565122 - SURFACE
      ?auto_1565123 - SURFACE
      ?auto_1565124 - SURFACE
    )
    :vars
    (
      ?auto_1565131 - HOIST
      ?auto_1565126 - PLACE
      ?auto_1565129 - PLACE
      ?auto_1565130 - HOIST
      ?auto_1565125 - SURFACE
      ?auto_1565127 - TRUCK
      ?auto_1565128 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565131 ?auto_1565126 ) ( IS-CRATE ?auto_1565124 ) ( not ( = ?auto_1565123 ?auto_1565124 ) ) ( not ( = ?auto_1565122 ?auto_1565123 ) ) ( not ( = ?auto_1565122 ?auto_1565124 ) ) ( not ( = ?auto_1565129 ?auto_1565126 ) ) ( HOIST-AT ?auto_1565130 ?auto_1565129 ) ( not ( = ?auto_1565131 ?auto_1565130 ) ) ( SURFACE-AT ?auto_1565124 ?auto_1565129 ) ( ON ?auto_1565124 ?auto_1565125 ) ( CLEAR ?auto_1565124 ) ( not ( = ?auto_1565123 ?auto_1565125 ) ) ( not ( = ?auto_1565124 ?auto_1565125 ) ) ( not ( = ?auto_1565122 ?auto_1565125 ) ) ( SURFACE-AT ?auto_1565122 ?auto_1565126 ) ( CLEAR ?auto_1565122 ) ( IS-CRATE ?auto_1565123 ) ( AVAILABLE ?auto_1565131 ) ( TRUCK-AT ?auto_1565127 ?auto_1565129 ) ( AVAILABLE ?auto_1565130 ) ( SURFACE-AT ?auto_1565123 ?auto_1565129 ) ( ON ?auto_1565123 ?auto_1565128 ) ( CLEAR ?auto_1565123 ) ( not ( = ?auto_1565123 ?auto_1565128 ) ) ( not ( = ?auto_1565124 ?auto_1565128 ) ) ( not ( = ?auto_1565122 ?auto_1565128 ) ) ( not ( = ?auto_1565125 ?auto_1565128 ) ) ( ON ?auto_1565118 ?auto_1565117 ) ( ON ?auto_1565119 ?auto_1565118 ) ( ON ?auto_1565120 ?auto_1565119 ) ( ON ?auto_1565121 ?auto_1565120 ) ( ON ?auto_1565122 ?auto_1565121 ) ( not ( = ?auto_1565117 ?auto_1565118 ) ) ( not ( = ?auto_1565117 ?auto_1565119 ) ) ( not ( = ?auto_1565117 ?auto_1565120 ) ) ( not ( = ?auto_1565117 ?auto_1565121 ) ) ( not ( = ?auto_1565117 ?auto_1565122 ) ) ( not ( = ?auto_1565117 ?auto_1565123 ) ) ( not ( = ?auto_1565117 ?auto_1565124 ) ) ( not ( = ?auto_1565117 ?auto_1565125 ) ) ( not ( = ?auto_1565117 ?auto_1565128 ) ) ( not ( = ?auto_1565118 ?auto_1565119 ) ) ( not ( = ?auto_1565118 ?auto_1565120 ) ) ( not ( = ?auto_1565118 ?auto_1565121 ) ) ( not ( = ?auto_1565118 ?auto_1565122 ) ) ( not ( = ?auto_1565118 ?auto_1565123 ) ) ( not ( = ?auto_1565118 ?auto_1565124 ) ) ( not ( = ?auto_1565118 ?auto_1565125 ) ) ( not ( = ?auto_1565118 ?auto_1565128 ) ) ( not ( = ?auto_1565119 ?auto_1565120 ) ) ( not ( = ?auto_1565119 ?auto_1565121 ) ) ( not ( = ?auto_1565119 ?auto_1565122 ) ) ( not ( = ?auto_1565119 ?auto_1565123 ) ) ( not ( = ?auto_1565119 ?auto_1565124 ) ) ( not ( = ?auto_1565119 ?auto_1565125 ) ) ( not ( = ?auto_1565119 ?auto_1565128 ) ) ( not ( = ?auto_1565120 ?auto_1565121 ) ) ( not ( = ?auto_1565120 ?auto_1565122 ) ) ( not ( = ?auto_1565120 ?auto_1565123 ) ) ( not ( = ?auto_1565120 ?auto_1565124 ) ) ( not ( = ?auto_1565120 ?auto_1565125 ) ) ( not ( = ?auto_1565120 ?auto_1565128 ) ) ( not ( = ?auto_1565121 ?auto_1565122 ) ) ( not ( = ?auto_1565121 ?auto_1565123 ) ) ( not ( = ?auto_1565121 ?auto_1565124 ) ) ( not ( = ?auto_1565121 ?auto_1565125 ) ) ( not ( = ?auto_1565121 ?auto_1565128 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565122 ?auto_1565123 ?auto_1565124 )
      ( MAKE-7CRATE-VERIFY ?auto_1565117 ?auto_1565118 ?auto_1565119 ?auto_1565120 ?auto_1565121 ?auto_1565122 ?auto_1565123 ?auto_1565124 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1565132 - SURFACE
      ?auto_1565133 - SURFACE
      ?auto_1565134 - SURFACE
      ?auto_1565135 - SURFACE
      ?auto_1565136 - SURFACE
      ?auto_1565137 - SURFACE
      ?auto_1565138 - SURFACE
      ?auto_1565139 - SURFACE
      ?auto_1565140 - SURFACE
    )
    :vars
    (
      ?auto_1565147 - HOIST
      ?auto_1565142 - PLACE
      ?auto_1565145 - PLACE
      ?auto_1565146 - HOIST
      ?auto_1565141 - SURFACE
      ?auto_1565143 - TRUCK
      ?auto_1565144 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565147 ?auto_1565142 ) ( IS-CRATE ?auto_1565140 ) ( not ( = ?auto_1565139 ?auto_1565140 ) ) ( not ( = ?auto_1565138 ?auto_1565139 ) ) ( not ( = ?auto_1565138 ?auto_1565140 ) ) ( not ( = ?auto_1565145 ?auto_1565142 ) ) ( HOIST-AT ?auto_1565146 ?auto_1565145 ) ( not ( = ?auto_1565147 ?auto_1565146 ) ) ( SURFACE-AT ?auto_1565140 ?auto_1565145 ) ( ON ?auto_1565140 ?auto_1565141 ) ( CLEAR ?auto_1565140 ) ( not ( = ?auto_1565139 ?auto_1565141 ) ) ( not ( = ?auto_1565140 ?auto_1565141 ) ) ( not ( = ?auto_1565138 ?auto_1565141 ) ) ( SURFACE-AT ?auto_1565138 ?auto_1565142 ) ( CLEAR ?auto_1565138 ) ( IS-CRATE ?auto_1565139 ) ( AVAILABLE ?auto_1565147 ) ( TRUCK-AT ?auto_1565143 ?auto_1565145 ) ( AVAILABLE ?auto_1565146 ) ( SURFACE-AT ?auto_1565139 ?auto_1565145 ) ( ON ?auto_1565139 ?auto_1565144 ) ( CLEAR ?auto_1565139 ) ( not ( = ?auto_1565139 ?auto_1565144 ) ) ( not ( = ?auto_1565140 ?auto_1565144 ) ) ( not ( = ?auto_1565138 ?auto_1565144 ) ) ( not ( = ?auto_1565141 ?auto_1565144 ) ) ( ON ?auto_1565133 ?auto_1565132 ) ( ON ?auto_1565134 ?auto_1565133 ) ( ON ?auto_1565135 ?auto_1565134 ) ( ON ?auto_1565136 ?auto_1565135 ) ( ON ?auto_1565137 ?auto_1565136 ) ( ON ?auto_1565138 ?auto_1565137 ) ( not ( = ?auto_1565132 ?auto_1565133 ) ) ( not ( = ?auto_1565132 ?auto_1565134 ) ) ( not ( = ?auto_1565132 ?auto_1565135 ) ) ( not ( = ?auto_1565132 ?auto_1565136 ) ) ( not ( = ?auto_1565132 ?auto_1565137 ) ) ( not ( = ?auto_1565132 ?auto_1565138 ) ) ( not ( = ?auto_1565132 ?auto_1565139 ) ) ( not ( = ?auto_1565132 ?auto_1565140 ) ) ( not ( = ?auto_1565132 ?auto_1565141 ) ) ( not ( = ?auto_1565132 ?auto_1565144 ) ) ( not ( = ?auto_1565133 ?auto_1565134 ) ) ( not ( = ?auto_1565133 ?auto_1565135 ) ) ( not ( = ?auto_1565133 ?auto_1565136 ) ) ( not ( = ?auto_1565133 ?auto_1565137 ) ) ( not ( = ?auto_1565133 ?auto_1565138 ) ) ( not ( = ?auto_1565133 ?auto_1565139 ) ) ( not ( = ?auto_1565133 ?auto_1565140 ) ) ( not ( = ?auto_1565133 ?auto_1565141 ) ) ( not ( = ?auto_1565133 ?auto_1565144 ) ) ( not ( = ?auto_1565134 ?auto_1565135 ) ) ( not ( = ?auto_1565134 ?auto_1565136 ) ) ( not ( = ?auto_1565134 ?auto_1565137 ) ) ( not ( = ?auto_1565134 ?auto_1565138 ) ) ( not ( = ?auto_1565134 ?auto_1565139 ) ) ( not ( = ?auto_1565134 ?auto_1565140 ) ) ( not ( = ?auto_1565134 ?auto_1565141 ) ) ( not ( = ?auto_1565134 ?auto_1565144 ) ) ( not ( = ?auto_1565135 ?auto_1565136 ) ) ( not ( = ?auto_1565135 ?auto_1565137 ) ) ( not ( = ?auto_1565135 ?auto_1565138 ) ) ( not ( = ?auto_1565135 ?auto_1565139 ) ) ( not ( = ?auto_1565135 ?auto_1565140 ) ) ( not ( = ?auto_1565135 ?auto_1565141 ) ) ( not ( = ?auto_1565135 ?auto_1565144 ) ) ( not ( = ?auto_1565136 ?auto_1565137 ) ) ( not ( = ?auto_1565136 ?auto_1565138 ) ) ( not ( = ?auto_1565136 ?auto_1565139 ) ) ( not ( = ?auto_1565136 ?auto_1565140 ) ) ( not ( = ?auto_1565136 ?auto_1565141 ) ) ( not ( = ?auto_1565136 ?auto_1565144 ) ) ( not ( = ?auto_1565137 ?auto_1565138 ) ) ( not ( = ?auto_1565137 ?auto_1565139 ) ) ( not ( = ?auto_1565137 ?auto_1565140 ) ) ( not ( = ?auto_1565137 ?auto_1565141 ) ) ( not ( = ?auto_1565137 ?auto_1565144 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565138 ?auto_1565139 ?auto_1565140 )
      ( MAKE-8CRATE-VERIFY ?auto_1565132 ?auto_1565133 ?auto_1565134 ?auto_1565135 ?auto_1565136 ?auto_1565137 ?auto_1565138 ?auto_1565139 ?auto_1565140 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1565148 - SURFACE
      ?auto_1565149 - SURFACE
      ?auto_1565150 - SURFACE
      ?auto_1565151 - SURFACE
      ?auto_1565152 - SURFACE
      ?auto_1565153 - SURFACE
      ?auto_1565154 - SURFACE
      ?auto_1565155 - SURFACE
      ?auto_1565156 - SURFACE
      ?auto_1565157 - SURFACE
    )
    :vars
    (
      ?auto_1565164 - HOIST
      ?auto_1565159 - PLACE
      ?auto_1565162 - PLACE
      ?auto_1565163 - HOIST
      ?auto_1565158 - SURFACE
      ?auto_1565160 - TRUCK
      ?auto_1565161 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565164 ?auto_1565159 ) ( IS-CRATE ?auto_1565157 ) ( not ( = ?auto_1565156 ?auto_1565157 ) ) ( not ( = ?auto_1565155 ?auto_1565156 ) ) ( not ( = ?auto_1565155 ?auto_1565157 ) ) ( not ( = ?auto_1565162 ?auto_1565159 ) ) ( HOIST-AT ?auto_1565163 ?auto_1565162 ) ( not ( = ?auto_1565164 ?auto_1565163 ) ) ( SURFACE-AT ?auto_1565157 ?auto_1565162 ) ( ON ?auto_1565157 ?auto_1565158 ) ( CLEAR ?auto_1565157 ) ( not ( = ?auto_1565156 ?auto_1565158 ) ) ( not ( = ?auto_1565157 ?auto_1565158 ) ) ( not ( = ?auto_1565155 ?auto_1565158 ) ) ( SURFACE-AT ?auto_1565155 ?auto_1565159 ) ( CLEAR ?auto_1565155 ) ( IS-CRATE ?auto_1565156 ) ( AVAILABLE ?auto_1565164 ) ( TRUCK-AT ?auto_1565160 ?auto_1565162 ) ( AVAILABLE ?auto_1565163 ) ( SURFACE-AT ?auto_1565156 ?auto_1565162 ) ( ON ?auto_1565156 ?auto_1565161 ) ( CLEAR ?auto_1565156 ) ( not ( = ?auto_1565156 ?auto_1565161 ) ) ( not ( = ?auto_1565157 ?auto_1565161 ) ) ( not ( = ?auto_1565155 ?auto_1565161 ) ) ( not ( = ?auto_1565158 ?auto_1565161 ) ) ( ON ?auto_1565149 ?auto_1565148 ) ( ON ?auto_1565150 ?auto_1565149 ) ( ON ?auto_1565151 ?auto_1565150 ) ( ON ?auto_1565152 ?auto_1565151 ) ( ON ?auto_1565153 ?auto_1565152 ) ( ON ?auto_1565154 ?auto_1565153 ) ( ON ?auto_1565155 ?auto_1565154 ) ( not ( = ?auto_1565148 ?auto_1565149 ) ) ( not ( = ?auto_1565148 ?auto_1565150 ) ) ( not ( = ?auto_1565148 ?auto_1565151 ) ) ( not ( = ?auto_1565148 ?auto_1565152 ) ) ( not ( = ?auto_1565148 ?auto_1565153 ) ) ( not ( = ?auto_1565148 ?auto_1565154 ) ) ( not ( = ?auto_1565148 ?auto_1565155 ) ) ( not ( = ?auto_1565148 ?auto_1565156 ) ) ( not ( = ?auto_1565148 ?auto_1565157 ) ) ( not ( = ?auto_1565148 ?auto_1565158 ) ) ( not ( = ?auto_1565148 ?auto_1565161 ) ) ( not ( = ?auto_1565149 ?auto_1565150 ) ) ( not ( = ?auto_1565149 ?auto_1565151 ) ) ( not ( = ?auto_1565149 ?auto_1565152 ) ) ( not ( = ?auto_1565149 ?auto_1565153 ) ) ( not ( = ?auto_1565149 ?auto_1565154 ) ) ( not ( = ?auto_1565149 ?auto_1565155 ) ) ( not ( = ?auto_1565149 ?auto_1565156 ) ) ( not ( = ?auto_1565149 ?auto_1565157 ) ) ( not ( = ?auto_1565149 ?auto_1565158 ) ) ( not ( = ?auto_1565149 ?auto_1565161 ) ) ( not ( = ?auto_1565150 ?auto_1565151 ) ) ( not ( = ?auto_1565150 ?auto_1565152 ) ) ( not ( = ?auto_1565150 ?auto_1565153 ) ) ( not ( = ?auto_1565150 ?auto_1565154 ) ) ( not ( = ?auto_1565150 ?auto_1565155 ) ) ( not ( = ?auto_1565150 ?auto_1565156 ) ) ( not ( = ?auto_1565150 ?auto_1565157 ) ) ( not ( = ?auto_1565150 ?auto_1565158 ) ) ( not ( = ?auto_1565150 ?auto_1565161 ) ) ( not ( = ?auto_1565151 ?auto_1565152 ) ) ( not ( = ?auto_1565151 ?auto_1565153 ) ) ( not ( = ?auto_1565151 ?auto_1565154 ) ) ( not ( = ?auto_1565151 ?auto_1565155 ) ) ( not ( = ?auto_1565151 ?auto_1565156 ) ) ( not ( = ?auto_1565151 ?auto_1565157 ) ) ( not ( = ?auto_1565151 ?auto_1565158 ) ) ( not ( = ?auto_1565151 ?auto_1565161 ) ) ( not ( = ?auto_1565152 ?auto_1565153 ) ) ( not ( = ?auto_1565152 ?auto_1565154 ) ) ( not ( = ?auto_1565152 ?auto_1565155 ) ) ( not ( = ?auto_1565152 ?auto_1565156 ) ) ( not ( = ?auto_1565152 ?auto_1565157 ) ) ( not ( = ?auto_1565152 ?auto_1565158 ) ) ( not ( = ?auto_1565152 ?auto_1565161 ) ) ( not ( = ?auto_1565153 ?auto_1565154 ) ) ( not ( = ?auto_1565153 ?auto_1565155 ) ) ( not ( = ?auto_1565153 ?auto_1565156 ) ) ( not ( = ?auto_1565153 ?auto_1565157 ) ) ( not ( = ?auto_1565153 ?auto_1565158 ) ) ( not ( = ?auto_1565153 ?auto_1565161 ) ) ( not ( = ?auto_1565154 ?auto_1565155 ) ) ( not ( = ?auto_1565154 ?auto_1565156 ) ) ( not ( = ?auto_1565154 ?auto_1565157 ) ) ( not ( = ?auto_1565154 ?auto_1565158 ) ) ( not ( = ?auto_1565154 ?auto_1565161 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565155 ?auto_1565156 ?auto_1565157 )
      ( MAKE-9CRATE-VERIFY ?auto_1565148 ?auto_1565149 ?auto_1565150 ?auto_1565151 ?auto_1565152 ?auto_1565153 ?auto_1565154 ?auto_1565155 ?auto_1565156 ?auto_1565157 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1565165 - SURFACE
      ?auto_1565166 - SURFACE
      ?auto_1565167 - SURFACE
      ?auto_1565168 - SURFACE
      ?auto_1565169 - SURFACE
      ?auto_1565170 - SURFACE
      ?auto_1565171 - SURFACE
      ?auto_1565172 - SURFACE
      ?auto_1565173 - SURFACE
      ?auto_1565174 - SURFACE
      ?auto_1565175 - SURFACE
    )
    :vars
    (
      ?auto_1565182 - HOIST
      ?auto_1565177 - PLACE
      ?auto_1565180 - PLACE
      ?auto_1565181 - HOIST
      ?auto_1565176 - SURFACE
      ?auto_1565178 - TRUCK
      ?auto_1565179 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565182 ?auto_1565177 ) ( IS-CRATE ?auto_1565175 ) ( not ( = ?auto_1565174 ?auto_1565175 ) ) ( not ( = ?auto_1565173 ?auto_1565174 ) ) ( not ( = ?auto_1565173 ?auto_1565175 ) ) ( not ( = ?auto_1565180 ?auto_1565177 ) ) ( HOIST-AT ?auto_1565181 ?auto_1565180 ) ( not ( = ?auto_1565182 ?auto_1565181 ) ) ( SURFACE-AT ?auto_1565175 ?auto_1565180 ) ( ON ?auto_1565175 ?auto_1565176 ) ( CLEAR ?auto_1565175 ) ( not ( = ?auto_1565174 ?auto_1565176 ) ) ( not ( = ?auto_1565175 ?auto_1565176 ) ) ( not ( = ?auto_1565173 ?auto_1565176 ) ) ( SURFACE-AT ?auto_1565173 ?auto_1565177 ) ( CLEAR ?auto_1565173 ) ( IS-CRATE ?auto_1565174 ) ( AVAILABLE ?auto_1565182 ) ( TRUCK-AT ?auto_1565178 ?auto_1565180 ) ( AVAILABLE ?auto_1565181 ) ( SURFACE-AT ?auto_1565174 ?auto_1565180 ) ( ON ?auto_1565174 ?auto_1565179 ) ( CLEAR ?auto_1565174 ) ( not ( = ?auto_1565174 ?auto_1565179 ) ) ( not ( = ?auto_1565175 ?auto_1565179 ) ) ( not ( = ?auto_1565173 ?auto_1565179 ) ) ( not ( = ?auto_1565176 ?auto_1565179 ) ) ( ON ?auto_1565166 ?auto_1565165 ) ( ON ?auto_1565167 ?auto_1565166 ) ( ON ?auto_1565168 ?auto_1565167 ) ( ON ?auto_1565169 ?auto_1565168 ) ( ON ?auto_1565170 ?auto_1565169 ) ( ON ?auto_1565171 ?auto_1565170 ) ( ON ?auto_1565172 ?auto_1565171 ) ( ON ?auto_1565173 ?auto_1565172 ) ( not ( = ?auto_1565165 ?auto_1565166 ) ) ( not ( = ?auto_1565165 ?auto_1565167 ) ) ( not ( = ?auto_1565165 ?auto_1565168 ) ) ( not ( = ?auto_1565165 ?auto_1565169 ) ) ( not ( = ?auto_1565165 ?auto_1565170 ) ) ( not ( = ?auto_1565165 ?auto_1565171 ) ) ( not ( = ?auto_1565165 ?auto_1565172 ) ) ( not ( = ?auto_1565165 ?auto_1565173 ) ) ( not ( = ?auto_1565165 ?auto_1565174 ) ) ( not ( = ?auto_1565165 ?auto_1565175 ) ) ( not ( = ?auto_1565165 ?auto_1565176 ) ) ( not ( = ?auto_1565165 ?auto_1565179 ) ) ( not ( = ?auto_1565166 ?auto_1565167 ) ) ( not ( = ?auto_1565166 ?auto_1565168 ) ) ( not ( = ?auto_1565166 ?auto_1565169 ) ) ( not ( = ?auto_1565166 ?auto_1565170 ) ) ( not ( = ?auto_1565166 ?auto_1565171 ) ) ( not ( = ?auto_1565166 ?auto_1565172 ) ) ( not ( = ?auto_1565166 ?auto_1565173 ) ) ( not ( = ?auto_1565166 ?auto_1565174 ) ) ( not ( = ?auto_1565166 ?auto_1565175 ) ) ( not ( = ?auto_1565166 ?auto_1565176 ) ) ( not ( = ?auto_1565166 ?auto_1565179 ) ) ( not ( = ?auto_1565167 ?auto_1565168 ) ) ( not ( = ?auto_1565167 ?auto_1565169 ) ) ( not ( = ?auto_1565167 ?auto_1565170 ) ) ( not ( = ?auto_1565167 ?auto_1565171 ) ) ( not ( = ?auto_1565167 ?auto_1565172 ) ) ( not ( = ?auto_1565167 ?auto_1565173 ) ) ( not ( = ?auto_1565167 ?auto_1565174 ) ) ( not ( = ?auto_1565167 ?auto_1565175 ) ) ( not ( = ?auto_1565167 ?auto_1565176 ) ) ( not ( = ?auto_1565167 ?auto_1565179 ) ) ( not ( = ?auto_1565168 ?auto_1565169 ) ) ( not ( = ?auto_1565168 ?auto_1565170 ) ) ( not ( = ?auto_1565168 ?auto_1565171 ) ) ( not ( = ?auto_1565168 ?auto_1565172 ) ) ( not ( = ?auto_1565168 ?auto_1565173 ) ) ( not ( = ?auto_1565168 ?auto_1565174 ) ) ( not ( = ?auto_1565168 ?auto_1565175 ) ) ( not ( = ?auto_1565168 ?auto_1565176 ) ) ( not ( = ?auto_1565168 ?auto_1565179 ) ) ( not ( = ?auto_1565169 ?auto_1565170 ) ) ( not ( = ?auto_1565169 ?auto_1565171 ) ) ( not ( = ?auto_1565169 ?auto_1565172 ) ) ( not ( = ?auto_1565169 ?auto_1565173 ) ) ( not ( = ?auto_1565169 ?auto_1565174 ) ) ( not ( = ?auto_1565169 ?auto_1565175 ) ) ( not ( = ?auto_1565169 ?auto_1565176 ) ) ( not ( = ?auto_1565169 ?auto_1565179 ) ) ( not ( = ?auto_1565170 ?auto_1565171 ) ) ( not ( = ?auto_1565170 ?auto_1565172 ) ) ( not ( = ?auto_1565170 ?auto_1565173 ) ) ( not ( = ?auto_1565170 ?auto_1565174 ) ) ( not ( = ?auto_1565170 ?auto_1565175 ) ) ( not ( = ?auto_1565170 ?auto_1565176 ) ) ( not ( = ?auto_1565170 ?auto_1565179 ) ) ( not ( = ?auto_1565171 ?auto_1565172 ) ) ( not ( = ?auto_1565171 ?auto_1565173 ) ) ( not ( = ?auto_1565171 ?auto_1565174 ) ) ( not ( = ?auto_1565171 ?auto_1565175 ) ) ( not ( = ?auto_1565171 ?auto_1565176 ) ) ( not ( = ?auto_1565171 ?auto_1565179 ) ) ( not ( = ?auto_1565172 ?auto_1565173 ) ) ( not ( = ?auto_1565172 ?auto_1565174 ) ) ( not ( = ?auto_1565172 ?auto_1565175 ) ) ( not ( = ?auto_1565172 ?auto_1565176 ) ) ( not ( = ?auto_1565172 ?auto_1565179 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565173 ?auto_1565174 ?auto_1565175 )
      ( MAKE-10CRATE-VERIFY ?auto_1565165 ?auto_1565166 ?auto_1565167 ?auto_1565168 ?auto_1565169 ?auto_1565170 ?auto_1565171 ?auto_1565172 ?auto_1565173 ?auto_1565174 ?auto_1565175 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1565183 - SURFACE
      ?auto_1565184 - SURFACE
      ?auto_1565185 - SURFACE
      ?auto_1565186 - SURFACE
      ?auto_1565187 - SURFACE
      ?auto_1565188 - SURFACE
      ?auto_1565189 - SURFACE
      ?auto_1565190 - SURFACE
      ?auto_1565191 - SURFACE
      ?auto_1565192 - SURFACE
      ?auto_1565193 - SURFACE
      ?auto_1565194 - SURFACE
    )
    :vars
    (
      ?auto_1565201 - HOIST
      ?auto_1565196 - PLACE
      ?auto_1565199 - PLACE
      ?auto_1565200 - HOIST
      ?auto_1565195 - SURFACE
      ?auto_1565197 - TRUCK
      ?auto_1565198 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565201 ?auto_1565196 ) ( IS-CRATE ?auto_1565194 ) ( not ( = ?auto_1565193 ?auto_1565194 ) ) ( not ( = ?auto_1565192 ?auto_1565193 ) ) ( not ( = ?auto_1565192 ?auto_1565194 ) ) ( not ( = ?auto_1565199 ?auto_1565196 ) ) ( HOIST-AT ?auto_1565200 ?auto_1565199 ) ( not ( = ?auto_1565201 ?auto_1565200 ) ) ( SURFACE-AT ?auto_1565194 ?auto_1565199 ) ( ON ?auto_1565194 ?auto_1565195 ) ( CLEAR ?auto_1565194 ) ( not ( = ?auto_1565193 ?auto_1565195 ) ) ( not ( = ?auto_1565194 ?auto_1565195 ) ) ( not ( = ?auto_1565192 ?auto_1565195 ) ) ( SURFACE-AT ?auto_1565192 ?auto_1565196 ) ( CLEAR ?auto_1565192 ) ( IS-CRATE ?auto_1565193 ) ( AVAILABLE ?auto_1565201 ) ( TRUCK-AT ?auto_1565197 ?auto_1565199 ) ( AVAILABLE ?auto_1565200 ) ( SURFACE-AT ?auto_1565193 ?auto_1565199 ) ( ON ?auto_1565193 ?auto_1565198 ) ( CLEAR ?auto_1565193 ) ( not ( = ?auto_1565193 ?auto_1565198 ) ) ( not ( = ?auto_1565194 ?auto_1565198 ) ) ( not ( = ?auto_1565192 ?auto_1565198 ) ) ( not ( = ?auto_1565195 ?auto_1565198 ) ) ( ON ?auto_1565184 ?auto_1565183 ) ( ON ?auto_1565185 ?auto_1565184 ) ( ON ?auto_1565186 ?auto_1565185 ) ( ON ?auto_1565187 ?auto_1565186 ) ( ON ?auto_1565188 ?auto_1565187 ) ( ON ?auto_1565189 ?auto_1565188 ) ( ON ?auto_1565190 ?auto_1565189 ) ( ON ?auto_1565191 ?auto_1565190 ) ( ON ?auto_1565192 ?auto_1565191 ) ( not ( = ?auto_1565183 ?auto_1565184 ) ) ( not ( = ?auto_1565183 ?auto_1565185 ) ) ( not ( = ?auto_1565183 ?auto_1565186 ) ) ( not ( = ?auto_1565183 ?auto_1565187 ) ) ( not ( = ?auto_1565183 ?auto_1565188 ) ) ( not ( = ?auto_1565183 ?auto_1565189 ) ) ( not ( = ?auto_1565183 ?auto_1565190 ) ) ( not ( = ?auto_1565183 ?auto_1565191 ) ) ( not ( = ?auto_1565183 ?auto_1565192 ) ) ( not ( = ?auto_1565183 ?auto_1565193 ) ) ( not ( = ?auto_1565183 ?auto_1565194 ) ) ( not ( = ?auto_1565183 ?auto_1565195 ) ) ( not ( = ?auto_1565183 ?auto_1565198 ) ) ( not ( = ?auto_1565184 ?auto_1565185 ) ) ( not ( = ?auto_1565184 ?auto_1565186 ) ) ( not ( = ?auto_1565184 ?auto_1565187 ) ) ( not ( = ?auto_1565184 ?auto_1565188 ) ) ( not ( = ?auto_1565184 ?auto_1565189 ) ) ( not ( = ?auto_1565184 ?auto_1565190 ) ) ( not ( = ?auto_1565184 ?auto_1565191 ) ) ( not ( = ?auto_1565184 ?auto_1565192 ) ) ( not ( = ?auto_1565184 ?auto_1565193 ) ) ( not ( = ?auto_1565184 ?auto_1565194 ) ) ( not ( = ?auto_1565184 ?auto_1565195 ) ) ( not ( = ?auto_1565184 ?auto_1565198 ) ) ( not ( = ?auto_1565185 ?auto_1565186 ) ) ( not ( = ?auto_1565185 ?auto_1565187 ) ) ( not ( = ?auto_1565185 ?auto_1565188 ) ) ( not ( = ?auto_1565185 ?auto_1565189 ) ) ( not ( = ?auto_1565185 ?auto_1565190 ) ) ( not ( = ?auto_1565185 ?auto_1565191 ) ) ( not ( = ?auto_1565185 ?auto_1565192 ) ) ( not ( = ?auto_1565185 ?auto_1565193 ) ) ( not ( = ?auto_1565185 ?auto_1565194 ) ) ( not ( = ?auto_1565185 ?auto_1565195 ) ) ( not ( = ?auto_1565185 ?auto_1565198 ) ) ( not ( = ?auto_1565186 ?auto_1565187 ) ) ( not ( = ?auto_1565186 ?auto_1565188 ) ) ( not ( = ?auto_1565186 ?auto_1565189 ) ) ( not ( = ?auto_1565186 ?auto_1565190 ) ) ( not ( = ?auto_1565186 ?auto_1565191 ) ) ( not ( = ?auto_1565186 ?auto_1565192 ) ) ( not ( = ?auto_1565186 ?auto_1565193 ) ) ( not ( = ?auto_1565186 ?auto_1565194 ) ) ( not ( = ?auto_1565186 ?auto_1565195 ) ) ( not ( = ?auto_1565186 ?auto_1565198 ) ) ( not ( = ?auto_1565187 ?auto_1565188 ) ) ( not ( = ?auto_1565187 ?auto_1565189 ) ) ( not ( = ?auto_1565187 ?auto_1565190 ) ) ( not ( = ?auto_1565187 ?auto_1565191 ) ) ( not ( = ?auto_1565187 ?auto_1565192 ) ) ( not ( = ?auto_1565187 ?auto_1565193 ) ) ( not ( = ?auto_1565187 ?auto_1565194 ) ) ( not ( = ?auto_1565187 ?auto_1565195 ) ) ( not ( = ?auto_1565187 ?auto_1565198 ) ) ( not ( = ?auto_1565188 ?auto_1565189 ) ) ( not ( = ?auto_1565188 ?auto_1565190 ) ) ( not ( = ?auto_1565188 ?auto_1565191 ) ) ( not ( = ?auto_1565188 ?auto_1565192 ) ) ( not ( = ?auto_1565188 ?auto_1565193 ) ) ( not ( = ?auto_1565188 ?auto_1565194 ) ) ( not ( = ?auto_1565188 ?auto_1565195 ) ) ( not ( = ?auto_1565188 ?auto_1565198 ) ) ( not ( = ?auto_1565189 ?auto_1565190 ) ) ( not ( = ?auto_1565189 ?auto_1565191 ) ) ( not ( = ?auto_1565189 ?auto_1565192 ) ) ( not ( = ?auto_1565189 ?auto_1565193 ) ) ( not ( = ?auto_1565189 ?auto_1565194 ) ) ( not ( = ?auto_1565189 ?auto_1565195 ) ) ( not ( = ?auto_1565189 ?auto_1565198 ) ) ( not ( = ?auto_1565190 ?auto_1565191 ) ) ( not ( = ?auto_1565190 ?auto_1565192 ) ) ( not ( = ?auto_1565190 ?auto_1565193 ) ) ( not ( = ?auto_1565190 ?auto_1565194 ) ) ( not ( = ?auto_1565190 ?auto_1565195 ) ) ( not ( = ?auto_1565190 ?auto_1565198 ) ) ( not ( = ?auto_1565191 ?auto_1565192 ) ) ( not ( = ?auto_1565191 ?auto_1565193 ) ) ( not ( = ?auto_1565191 ?auto_1565194 ) ) ( not ( = ?auto_1565191 ?auto_1565195 ) ) ( not ( = ?auto_1565191 ?auto_1565198 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565192 ?auto_1565193 ?auto_1565194 )
      ( MAKE-11CRATE-VERIFY ?auto_1565183 ?auto_1565184 ?auto_1565185 ?auto_1565186 ?auto_1565187 ?auto_1565188 ?auto_1565189 ?auto_1565190 ?auto_1565191 ?auto_1565192 ?auto_1565193 ?auto_1565194 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1565202 - SURFACE
      ?auto_1565203 - SURFACE
      ?auto_1565204 - SURFACE
      ?auto_1565205 - SURFACE
      ?auto_1565206 - SURFACE
      ?auto_1565207 - SURFACE
      ?auto_1565208 - SURFACE
      ?auto_1565209 - SURFACE
      ?auto_1565210 - SURFACE
      ?auto_1565211 - SURFACE
      ?auto_1565212 - SURFACE
      ?auto_1565213 - SURFACE
      ?auto_1565214 - SURFACE
    )
    :vars
    (
      ?auto_1565221 - HOIST
      ?auto_1565216 - PLACE
      ?auto_1565219 - PLACE
      ?auto_1565220 - HOIST
      ?auto_1565215 - SURFACE
      ?auto_1565217 - TRUCK
      ?auto_1565218 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565221 ?auto_1565216 ) ( IS-CRATE ?auto_1565214 ) ( not ( = ?auto_1565213 ?auto_1565214 ) ) ( not ( = ?auto_1565212 ?auto_1565213 ) ) ( not ( = ?auto_1565212 ?auto_1565214 ) ) ( not ( = ?auto_1565219 ?auto_1565216 ) ) ( HOIST-AT ?auto_1565220 ?auto_1565219 ) ( not ( = ?auto_1565221 ?auto_1565220 ) ) ( SURFACE-AT ?auto_1565214 ?auto_1565219 ) ( ON ?auto_1565214 ?auto_1565215 ) ( CLEAR ?auto_1565214 ) ( not ( = ?auto_1565213 ?auto_1565215 ) ) ( not ( = ?auto_1565214 ?auto_1565215 ) ) ( not ( = ?auto_1565212 ?auto_1565215 ) ) ( SURFACE-AT ?auto_1565212 ?auto_1565216 ) ( CLEAR ?auto_1565212 ) ( IS-CRATE ?auto_1565213 ) ( AVAILABLE ?auto_1565221 ) ( TRUCK-AT ?auto_1565217 ?auto_1565219 ) ( AVAILABLE ?auto_1565220 ) ( SURFACE-AT ?auto_1565213 ?auto_1565219 ) ( ON ?auto_1565213 ?auto_1565218 ) ( CLEAR ?auto_1565213 ) ( not ( = ?auto_1565213 ?auto_1565218 ) ) ( not ( = ?auto_1565214 ?auto_1565218 ) ) ( not ( = ?auto_1565212 ?auto_1565218 ) ) ( not ( = ?auto_1565215 ?auto_1565218 ) ) ( ON ?auto_1565203 ?auto_1565202 ) ( ON ?auto_1565204 ?auto_1565203 ) ( ON ?auto_1565205 ?auto_1565204 ) ( ON ?auto_1565206 ?auto_1565205 ) ( ON ?auto_1565207 ?auto_1565206 ) ( ON ?auto_1565208 ?auto_1565207 ) ( ON ?auto_1565209 ?auto_1565208 ) ( ON ?auto_1565210 ?auto_1565209 ) ( ON ?auto_1565211 ?auto_1565210 ) ( ON ?auto_1565212 ?auto_1565211 ) ( not ( = ?auto_1565202 ?auto_1565203 ) ) ( not ( = ?auto_1565202 ?auto_1565204 ) ) ( not ( = ?auto_1565202 ?auto_1565205 ) ) ( not ( = ?auto_1565202 ?auto_1565206 ) ) ( not ( = ?auto_1565202 ?auto_1565207 ) ) ( not ( = ?auto_1565202 ?auto_1565208 ) ) ( not ( = ?auto_1565202 ?auto_1565209 ) ) ( not ( = ?auto_1565202 ?auto_1565210 ) ) ( not ( = ?auto_1565202 ?auto_1565211 ) ) ( not ( = ?auto_1565202 ?auto_1565212 ) ) ( not ( = ?auto_1565202 ?auto_1565213 ) ) ( not ( = ?auto_1565202 ?auto_1565214 ) ) ( not ( = ?auto_1565202 ?auto_1565215 ) ) ( not ( = ?auto_1565202 ?auto_1565218 ) ) ( not ( = ?auto_1565203 ?auto_1565204 ) ) ( not ( = ?auto_1565203 ?auto_1565205 ) ) ( not ( = ?auto_1565203 ?auto_1565206 ) ) ( not ( = ?auto_1565203 ?auto_1565207 ) ) ( not ( = ?auto_1565203 ?auto_1565208 ) ) ( not ( = ?auto_1565203 ?auto_1565209 ) ) ( not ( = ?auto_1565203 ?auto_1565210 ) ) ( not ( = ?auto_1565203 ?auto_1565211 ) ) ( not ( = ?auto_1565203 ?auto_1565212 ) ) ( not ( = ?auto_1565203 ?auto_1565213 ) ) ( not ( = ?auto_1565203 ?auto_1565214 ) ) ( not ( = ?auto_1565203 ?auto_1565215 ) ) ( not ( = ?auto_1565203 ?auto_1565218 ) ) ( not ( = ?auto_1565204 ?auto_1565205 ) ) ( not ( = ?auto_1565204 ?auto_1565206 ) ) ( not ( = ?auto_1565204 ?auto_1565207 ) ) ( not ( = ?auto_1565204 ?auto_1565208 ) ) ( not ( = ?auto_1565204 ?auto_1565209 ) ) ( not ( = ?auto_1565204 ?auto_1565210 ) ) ( not ( = ?auto_1565204 ?auto_1565211 ) ) ( not ( = ?auto_1565204 ?auto_1565212 ) ) ( not ( = ?auto_1565204 ?auto_1565213 ) ) ( not ( = ?auto_1565204 ?auto_1565214 ) ) ( not ( = ?auto_1565204 ?auto_1565215 ) ) ( not ( = ?auto_1565204 ?auto_1565218 ) ) ( not ( = ?auto_1565205 ?auto_1565206 ) ) ( not ( = ?auto_1565205 ?auto_1565207 ) ) ( not ( = ?auto_1565205 ?auto_1565208 ) ) ( not ( = ?auto_1565205 ?auto_1565209 ) ) ( not ( = ?auto_1565205 ?auto_1565210 ) ) ( not ( = ?auto_1565205 ?auto_1565211 ) ) ( not ( = ?auto_1565205 ?auto_1565212 ) ) ( not ( = ?auto_1565205 ?auto_1565213 ) ) ( not ( = ?auto_1565205 ?auto_1565214 ) ) ( not ( = ?auto_1565205 ?auto_1565215 ) ) ( not ( = ?auto_1565205 ?auto_1565218 ) ) ( not ( = ?auto_1565206 ?auto_1565207 ) ) ( not ( = ?auto_1565206 ?auto_1565208 ) ) ( not ( = ?auto_1565206 ?auto_1565209 ) ) ( not ( = ?auto_1565206 ?auto_1565210 ) ) ( not ( = ?auto_1565206 ?auto_1565211 ) ) ( not ( = ?auto_1565206 ?auto_1565212 ) ) ( not ( = ?auto_1565206 ?auto_1565213 ) ) ( not ( = ?auto_1565206 ?auto_1565214 ) ) ( not ( = ?auto_1565206 ?auto_1565215 ) ) ( not ( = ?auto_1565206 ?auto_1565218 ) ) ( not ( = ?auto_1565207 ?auto_1565208 ) ) ( not ( = ?auto_1565207 ?auto_1565209 ) ) ( not ( = ?auto_1565207 ?auto_1565210 ) ) ( not ( = ?auto_1565207 ?auto_1565211 ) ) ( not ( = ?auto_1565207 ?auto_1565212 ) ) ( not ( = ?auto_1565207 ?auto_1565213 ) ) ( not ( = ?auto_1565207 ?auto_1565214 ) ) ( not ( = ?auto_1565207 ?auto_1565215 ) ) ( not ( = ?auto_1565207 ?auto_1565218 ) ) ( not ( = ?auto_1565208 ?auto_1565209 ) ) ( not ( = ?auto_1565208 ?auto_1565210 ) ) ( not ( = ?auto_1565208 ?auto_1565211 ) ) ( not ( = ?auto_1565208 ?auto_1565212 ) ) ( not ( = ?auto_1565208 ?auto_1565213 ) ) ( not ( = ?auto_1565208 ?auto_1565214 ) ) ( not ( = ?auto_1565208 ?auto_1565215 ) ) ( not ( = ?auto_1565208 ?auto_1565218 ) ) ( not ( = ?auto_1565209 ?auto_1565210 ) ) ( not ( = ?auto_1565209 ?auto_1565211 ) ) ( not ( = ?auto_1565209 ?auto_1565212 ) ) ( not ( = ?auto_1565209 ?auto_1565213 ) ) ( not ( = ?auto_1565209 ?auto_1565214 ) ) ( not ( = ?auto_1565209 ?auto_1565215 ) ) ( not ( = ?auto_1565209 ?auto_1565218 ) ) ( not ( = ?auto_1565210 ?auto_1565211 ) ) ( not ( = ?auto_1565210 ?auto_1565212 ) ) ( not ( = ?auto_1565210 ?auto_1565213 ) ) ( not ( = ?auto_1565210 ?auto_1565214 ) ) ( not ( = ?auto_1565210 ?auto_1565215 ) ) ( not ( = ?auto_1565210 ?auto_1565218 ) ) ( not ( = ?auto_1565211 ?auto_1565212 ) ) ( not ( = ?auto_1565211 ?auto_1565213 ) ) ( not ( = ?auto_1565211 ?auto_1565214 ) ) ( not ( = ?auto_1565211 ?auto_1565215 ) ) ( not ( = ?auto_1565211 ?auto_1565218 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565212 ?auto_1565213 ?auto_1565214 )
      ( MAKE-12CRATE-VERIFY ?auto_1565202 ?auto_1565203 ?auto_1565204 ?auto_1565205 ?auto_1565206 ?auto_1565207 ?auto_1565208 ?auto_1565209 ?auto_1565210 ?auto_1565211 ?auto_1565212 ?auto_1565213 ?auto_1565214 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1565222 - SURFACE
      ?auto_1565223 - SURFACE
      ?auto_1565224 - SURFACE
      ?auto_1565225 - SURFACE
      ?auto_1565226 - SURFACE
      ?auto_1565227 - SURFACE
      ?auto_1565228 - SURFACE
      ?auto_1565229 - SURFACE
      ?auto_1565230 - SURFACE
      ?auto_1565231 - SURFACE
      ?auto_1565232 - SURFACE
      ?auto_1565233 - SURFACE
      ?auto_1565234 - SURFACE
      ?auto_1565235 - SURFACE
    )
    :vars
    (
      ?auto_1565242 - HOIST
      ?auto_1565237 - PLACE
      ?auto_1565240 - PLACE
      ?auto_1565241 - HOIST
      ?auto_1565236 - SURFACE
      ?auto_1565238 - TRUCK
      ?auto_1565239 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565242 ?auto_1565237 ) ( IS-CRATE ?auto_1565235 ) ( not ( = ?auto_1565234 ?auto_1565235 ) ) ( not ( = ?auto_1565233 ?auto_1565234 ) ) ( not ( = ?auto_1565233 ?auto_1565235 ) ) ( not ( = ?auto_1565240 ?auto_1565237 ) ) ( HOIST-AT ?auto_1565241 ?auto_1565240 ) ( not ( = ?auto_1565242 ?auto_1565241 ) ) ( SURFACE-AT ?auto_1565235 ?auto_1565240 ) ( ON ?auto_1565235 ?auto_1565236 ) ( CLEAR ?auto_1565235 ) ( not ( = ?auto_1565234 ?auto_1565236 ) ) ( not ( = ?auto_1565235 ?auto_1565236 ) ) ( not ( = ?auto_1565233 ?auto_1565236 ) ) ( SURFACE-AT ?auto_1565233 ?auto_1565237 ) ( CLEAR ?auto_1565233 ) ( IS-CRATE ?auto_1565234 ) ( AVAILABLE ?auto_1565242 ) ( TRUCK-AT ?auto_1565238 ?auto_1565240 ) ( AVAILABLE ?auto_1565241 ) ( SURFACE-AT ?auto_1565234 ?auto_1565240 ) ( ON ?auto_1565234 ?auto_1565239 ) ( CLEAR ?auto_1565234 ) ( not ( = ?auto_1565234 ?auto_1565239 ) ) ( not ( = ?auto_1565235 ?auto_1565239 ) ) ( not ( = ?auto_1565233 ?auto_1565239 ) ) ( not ( = ?auto_1565236 ?auto_1565239 ) ) ( ON ?auto_1565223 ?auto_1565222 ) ( ON ?auto_1565224 ?auto_1565223 ) ( ON ?auto_1565225 ?auto_1565224 ) ( ON ?auto_1565226 ?auto_1565225 ) ( ON ?auto_1565227 ?auto_1565226 ) ( ON ?auto_1565228 ?auto_1565227 ) ( ON ?auto_1565229 ?auto_1565228 ) ( ON ?auto_1565230 ?auto_1565229 ) ( ON ?auto_1565231 ?auto_1565230 ) ( ON ?auto_1565232 ?auto_1565231 ) ( ON ?auto_1565233 ?auto_1565232 ) ( not ( = ?auto_1565222 ?auto_1565223 ) ) ( not ( = ?auto_1565222 ?auto_1565224 ) ) ( not ( = ?auto_1565222 ?auto_1565225 ) ) ( not ( = ?auto_1565222 ?auto_1565226 ) ) ( not ( = ?auto_1565222 ?auto_1565227 ) ) ( not ( = ?auto_1565222 ?auto_1565228 ) ) ( not ( = ?auto_1565222 ?auto_1565229 ) ) ( not ( = ?auto_1565222 ?auto_1565230 ) ) ( not ( = ?auto_1565222 ?auto_1565231 ) ) ( not ( = ?auto_1565222 ?auto_1565232 ) ) ( not ( = ?auto_1565222 ?auto_1565233 ) ) ( not ( = ?auto_1565222 ?auto_1565234 ) ) ( not ( = ?auto_1565222 ?auto_1565235 ) ) ( not ( = ?auto_1565222 ?auto_1565236 ) ) ( not ( = ?auto_1565222 ?auto_1565239 ) ) ( not ( = ?auto_1565223 ?auto_1565224 ) ) ( not ( = ?auto_1565223 ?auto_1565225 ) ) ( not ( = ?auto_1565223 ?auto_1565226 ) ) ( not ( = ?auto_1565223 ?auto_1565227 ) ) ( not ( = ?auto_1565223 ?auto_1565228 ) ) ( not ( = ?auto_1565223 ?auto_1565229 ) ) ( not ( = ?auto_1565223 ?auto_1565230 ) ) ( not ( = ?auto_1565223 ?auto_1565231 ) ) ( not ( = ?auto_1565223 ?auto_1565232 ) ) ( not ( = ?auto_1565223 ?auto_1565233 ) ) ( not ( = ?auto_1565223 ?auto_1565234 ) ) ( not ( = ?auto_1565223 ?auto_1565235 ) ) ( not ( = ?auto_1565223 ?auto_1565236 ) ) ( not ( = ?auto_1565223 ?auto_1565239 ) ) ( not ( = ?auto_1565224 ?auto_1565225 ) ) ( not ( = ?auto_1565224 ?auto_1565226 ) ) ( not ( = ?auto_1565224 ?auto_1565227 ) ) ( not ( = ?auto_1565224 ?auto_1565228 ) ) ( not ( = ?auto_1565224 ?auto_1565229 ) ) ( not ( = ?auto_1565224 ?auto_1565230 ) ) ( not ( = ?auto_1565224 ?auto_1565231 ) ) ( not ( = ?auto_1565224 ?auto_1565232 ) ) ( not ( = ?auto_1565224 ?auto_1565233 ) ) ( not ( = ?auto_1565224 ?auto_1565234 ) ) ( not ( = ?auto_1565224 ?auto_1565235 ) ) ( not ( = ?auto_1565224 ?auto_1565236 ) ) ( not ( = ?auto_1565224 ?auto_1565239 ) ) ( not ( = ?auto_1565225 ?auto_1565226 ) ) ( not ( = ?auto_1565225 ?auto_1565227 ) ) ( not ( = ?auto_1565225 ?auto_1565228 ) ) ( not ( = ?auto_1565225 ?auto_1565229 ) ) ( not ( = ?auto_1565225 ?auto_1565230 ) ) ( not ( = ?auto_1565225 ?auto_1565231 ) ) ( not ( = ?auto_1565225 ?auto_1565232 ) ) ( not ( = ?auto_1565225 ?auto_1565233 ) ) ( not ( = ?auto_1565225 ?auto_1565234 ) ) ( not ( = ?auto_1565225 ?auto_1565235 ) ) ( not ( = ?auto_1565225 ?auto_1565236 ) ) ( not ( = ?auto_1565225 ?auto_1565239 ) ) ( not ( = ?auto_1565226 ?auto_1565227 ) ) ( not ( = ?auto_1565226 ?auto_1565228 ) ) ( not ( = ?auto_1565226 ?auto_1565229 ) ) ( not ( = ?auto_1565226 ?auto_1565230 ) ) ( not ( = ?auto_1565226 ?auto_1565231 ) ) ( not ( = ?auto_1565226 ?auto_1565232 ) ) ( not ( = ?auto_1565226 ?auto_1565233 ) ) ( not ( = ?auto_1565226 ?auto_1565234 ) ) ( not ( = ?auto_1565226 ?auto_1565235 ) ) ( not ( = ?auto_1565226 ?auto_1565236 ) ) ( not ( = ?auto_1565226 ?auto_1565239 ) ) ( not ( = ?auto_1565227 ?auto_1565228 ) ) ( not ( = ?auto_1565227 ?auto_1565229 ) ) ( not ( = ?auto_1565227 ?auto_1565230 ) ) ( not ( = ?auto_1565227 ?auto_1565231 ) ) ( not ( = ?auto_1565227 ?auto_1565232 ) ) ( not ( = ?auto_1565227 ?auto_1565233 ) ) ( not ( = ?auto_1565227 ?auto_1565234 ) ) ( not ( = ?auto_1565227 ?auto_1565235 ) ) ( not ( = ?auto_1565227 ?auto_1565236 ) ) ( not ( = ?auto_1565227 ?auto_1565239 ) ) ( not ( = ?auto_1565228 ?auto_1565229 ) ) ( not ( = ?auto_1565228 ?auto_1565230 ) ) ( not ( = ?auto_1565228 ?auto_1565231 ) ) ( not ( = ?auto_1565228 ?auto_1565232 ) ) ( not ( = ?auto_1565228 ?auto_1565233 ) ) ( not ( = ?auto_1565228 ?auto_1565234 ) ) ( not ( = ?auto_1565228 ?auto_1565235 ) ) ( not ( = ?auto_1565228 ?auto_1565236 ) ) ( not ( = ?auto_1565228 ?auto_1565239 ) ) ( not ( = ?auto_1565229 ?auto_1565230 ) ) ( not ( = ?auto_1565229 ?auto_1565231 ) ) ( not ( = ?auto_1565229 ?auto_1565232 ) ) ( not ( = ?auto_1565229 ?auto_1565233 ) ) ( not ( = ?auto_1565229 ?auto_1565234 ) ) ( not ( = ?auto_1565229 ?auto_1565235 ) ) ( not ( = ?auto_1565229 ?auto_1565236 ) ) ( not ( = ?auto_1565229 ?auto_1565239 ) ) ( not ( = ?auto_1565230 ?auto_1565231 ) ) ( not ( = ?auto_1565230 ?auto_1565232 ) ) ( not ( = ?auto_1565230 ?auto_1565233 ) ) ( not ( = ?auto_1565230 ?auto_1565234 ) ) ( not ( = ?auto_1565230 ?auto_1565235 ) ) ( not ( = ?auto_1565230 ?auto_1565236 ) ) ( not ( = ?auto_1565230 ?auto_1565239 ) ) ( not ( = ?auto_1565231 ?auto_1565232 ) ) ( not ( = ?auto_1565231 ?auto_1565233 ) ) ( not ( = ?auto_1565231 ?auto_1565234 ) ) ( not ( = ?auto_1565231 ?auto_1565235 ) ) ( not ( = ?auto_1565231 ?auto_1565236 ) ) ( not ( = ?auto_1565231 ?auto_1565239 ) ) ( not ( = ?auto_1565232 ?auto_1565233 ) ) ( not ( = ?auto_1565232 ?auto_1565234 ) ) ( not ( = ?auto_1565232 ?auto_1565235 ) ) ( not ( = ?auto_1565232 ?auto_1565236 ) ) ( not ( = ?auto_1565232 ?auto_1565239 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565233 ?auto_1565234 ?auto_1565235 )
      ( MAKE-13CRATE-VERIFY ?auto_1565222 ?auto_1565223 ?auto_1565224 ?auto_1565225 ?auto_1565226 ?auto_1565227 ?auto_1565228 ?auto_1565229 ?auto_1565230 ?auto_1565231 ?auto_1565232 ?auto_1565233 ?auto_1565234 ?auto_1565235 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1565243 - SURFACE
      ?auto_1565244 - SURFACE
    )
    :vars
    (
      ?auto_1565252 - HOIST
      ?auto_1565246 - PLACE
      ?auto_1565251 - SURFACE
      ?auto_1565249 - PLACE
      ?auto_1565250 - HOIST
      ?auto_1565245 - SURFACE
      ?auto_1565248 - SURFACE
      ?auto_1565247 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565252 ?auto_1565246 ) ( IS-CRATE ?auto_1565244 ) ( not ( = ?auto_1565243 ?auto_1565244 ) ) ( not ( = ?auto_1565251 ?auto_1565243 ) ) ( not ( = ?auto_1565251 ?auto_1565244 ) ) ( not ( = ?auto_1565249 ?auto_1565246 ) ) ( HOIST-AT ?auto_1565250 ?auto_1565249 ) ( not ( = ?auto_1565252 ?auto_1565250 ) ) ( SURFACE-AT ?auto_1565244 ?auto_1565249 ) ( ON ?auto_1565244 ?auto_1565245 ) ( CLEAR ?auto_1565244 ) ( not ( = ?auto_1565243 ?auto_1565245 ) ) ( not ( = ?auto_1565244 ?auto_1565245 ) ) ( not ( = ?auto_1565251 ?auto_1565245 ) ) ( SURFACE-AT ?auto_1565251 ?auto_1565246 ) ( CLEAR ?auto_1565251 ) ( IS-CRATE ?auto_1565243 ) ( AVAILABLE ?auto_1565252 ) ( AVAILABLE ?auto_1565250 ) ( SURFACE-AT ?auto_1565243 ?auto_1565249 ) ( ON ?auto_1565243 ?auto_1565248 ) ( CLEAR ?auto_1565243 ) ( not ( = ?auto_1565243 ?auto_1565248 ) ) ( not ( = ?auto_1565244 ?auto_1565248 ) ) ( not ( = ?auto_1565251 ?auto_1565248 ) ) ( not ( = ?auto_1565245 ?auto_1565248 ) ) ( TRUCK-AT ?auto_1565247 ?auto_1565246 ) )
    :subtasks
    ( ( !DRIVE ?auto_1565247 ?auto_1565246 ?auto_1565249 )
      ( MAKE-2CRATE ?auto_1565251 ?auto_1565243 ?auto_1565244 )
      ( MAKE-1CRATE-VERIFY ?auto_1565243 ?auto_1565244 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1565253 - SURFACE
      ?auto_1565254 - SURFACE
      ?auto_1565255 - SURFACE
    )
    :vars
    (
      ?auto_1565262 - HOIST
      ?auto_1565256 - PLACE
      ?auto_1565257 - PLACE
      ?auto_1565260 - HOIST
      ?auto_1565258 - SURFACE
      ?auto_1565261 - SURFACE
      ?auto_1565259 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565262 ?auto_1565256 ) ( IS-CRATE ?auto_1565255 ) ( not ( = ?auto_1565254 ?auto_1565255 ) ) ( not ( = ?auto_1565253 ?auto_1565254 ) ) ( not ( = ?auto_1565253 ?auto_1565255 ) ) ( not ( = ?auto_1565257 ?auto_1565256 ) ) ( HOIST-AT ?auto_1565260 ?auto_1565257 ) ( not ( = ?auto_1565262 ?auto_1565260 ) ) ( SURFACE-AT ?auto_1565255 ?auto_1565257 ) ( ON ?auto_1565255 ?auto_1565258 ) ( CLEAR ?auto_1565255 ) ( not ( = ?auto_1565254 ?auto_1565258 ) ) ( not ( = ?auto_1565255 ?auto_1565258 ) ) ( not ( = ?auto_1565253 ?auto_1565258 ) ) ( SURFACE-AT ?auto_1565253 ?auto_1565256 ) ( CLEAR ?auto_1565253 ) ( IS-CRATE ?auto_1565254 ) ( AVAILABLE ?auto_1565262 ) ( AVAILABLE ?auto_1565260 ) ( SURFACE-AT ?auto_1565254 ?auto_1565257 ) ( ON ?auto_1565254 ?auto_1565261 ) ( CLEAR ?auto_1565254 ) ( not ( = ?auto_1565254 ?auto_1565261 ) ) ( not ( = ?auto_1565255 ?auto_1565261 ) ) ( not ( = ?auto_1565253 ?auto_1565261 ) ) ( not ( = ?auto_1565258 ?auto_1565261 ) ) ( TRUCK-AT ?auto_1565259 ?auto_1565256 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1565254 ?auto_1565255 )
      ( MAKE-2CRATE-VERIFY ?auto_1565253 ?auto_1565254 ?auto_1565255 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1565263 - SURFACE
      ?auto_1565264 - SURFACE
      ?auto_1565265 - SURFACE
      ?auto_1565266 - SURFACE
    )
    :vars
    (
      ?auto_1565267 - HOIST
      ?auto_1565268 - PLACE
      ?auto_1565271 - PLACE
      ?auto_1565273 - HOIST
      ?auto_1565269 - SURFACE
      ?auto_1565270 - SURFACE
      ?auto_1565272 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565267 ?auto_1565268 ) ( IS-CRATE ?auto_1565266 ) ( not ( = ?auto_1565265 ?auto_1565266 ) ) ( not ( = ?auto_1565264 ?auto_1565265 ) ) ( not ( = ?auto_1565264 ?auto_1565266 ) ) ( not ( = ?auto_1565271 ?auto_1565268 ) ) ( HOIST-AT ?auto_1565273 ?auto_1565271 ) ( not ( = ?auto_1565267 ?auto_1565273 ) ) ( SURFACE-AT ?auto_1565266 ?auto_1565271 ) ( ON ?auto_1565266 ?auto_1565269 ) ( CLEAR ?auto_1565266 ) ( not ( = ?auto_1565265 ?auto_1565269 ) ) ( not ( = ?auto_1565266 ?auto_1565269 ) ) ( not ( = ?auto_1565264 ?auto_1565269 ) ) ( SURFACE-AT ?auto_1565264 ?auto_1565268 ) ( CLEAR ?auto_1565264 ) ( IS-CRATE ?auto_1565265 ) ( AVAILABLE ?auto_1565267 ) ( AVAILABLE ?auto_1565273 ) ( SURFACE-AT ?auto_1565265 ?auto_1565271 ) ( ON ?auto_1565265 ?auto_1565270 ) ( CLEAR ?auto_1565265 ) ( not ( = ?auto_1565265 ?auto_1565270 ) ) ( not ( = ?auto_1565266 ?auto_1565270 ) ) ( not ( = ?auto_1565264 ?auto_1565270 ) ) ( not ( = ?auto_1565269 ?auto_1565270 ) ) ( TRUCK-AT ?auto_1565272 ?auto_1565268 ) ( ON ?auto_1565264 ?auto_1565263 ) ( not ( = ?auto_1565263 ?auto_1565264 ) ) ( not ( = ?auto_1565263 ?auto_1565265 ) ) ( not ( = ?auto_1565263 ?auto_1565266 ) ) ( not ( = ?auto_1565263 ?auto_1565269 ) ) ( not ( = ?auto_1565263 ?auto_1565270 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565264 ?auto_1565265 ?auto_1565266 )
      ( MAKE-3CRATE-VERIFY ?auto_1565263 ?auto_1565264 ?auto_1565265 ?auto_1565266 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1565274 - SURFACE
      ?auto_1565275 - SURFACE
      ?auto_1565276 - SURFACE
      ?auto_1565277 - SURFACE
      ?auto_1565278 - SURFACE
    )
    :vars
    (
      ?auto_1565279 - HOIST
      ?auto_1565280 - PLACE
      ?auto_1565283 - PLACE
      ?auto_1565285 - HOIST
      ?auto_1565281 - SURFACE
      ?auto_1565282 - SURFACE
      ?auto_1565284 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565279 ?auto_1565280 ) ( IS-CRATE ?auto_1565278 ) ( not ( = ?auto_1565277 ?auto_1565278 ) ) ( not ( = ?auto_1565276 ?auto_1565277 ) ) ( not ( = ?auto_1565276 ?auto_1565278 ) ) ( not ( = ?auto_1565283 ?auto_1565280 ) ) ( HOIST-AT ?auto_1565285 ?auto_1565283 ) ( not ( = ?auto_1565279 ?auto_1565285 ) ) ( SURFACE-AT ?auto_1565278 ?auto_1565283 ) ( ON ?auto_1565278 ?auto_1565281 ) ( CLEAR ?auto_1565278 ) ( not ( = ?auto_1565277 ?auto_1565281 ) ) ( not ( = ?auto_1565278 ?auto_1565281 ) ) ( not ( = ?auto_1565276 ?auto_1565281 ) ) ( SURFACE-AT ?auto_1565276 ?auto_1565280 ) ( CLEAR ?auto_1565276 ) ( IS-CRATE ?auto_1565277 ) ( AVAILABLE ?auto_1565279 ) ( AVAILABLE ?auto_1565285 ) ( SURFACE-AT ?auto_1565277 ?auto_1565283 ) ( ON ?auto_1565277 ?auto_1565282 ) ( CLEAR ?auto_1565277 ) ( not ( = ?auto_1565277 ?auto_1565282 ) ) ( not ( = ?auto_1565278 ?auto_1565282 ) ) ( not ( = ?auto_1565276 ?auto_1565282 ) ) ( not ( = ?auto_1565281 ?auto_1565282 ) ) ( TRUCK-AT ?auto_1565284 ?auto_1565280 ) ( ON ?auto_1565275 ?auto_1565274 ) ( ON ?auto_1565276 ?auto_1565275 ) ( not ( = ?auto_1565274 ?auto_1565275 ) ) ( not ( = ?auto_1565274 ?auto_1565276 ) ) ( not ( = ?auto_1565274 ?auto_1565277 ) ) ( not ( = ?auto_1565274 ?auto_1565278 ) ) ( not ( = ?auto_1565274 ?auto_1565281 ) ) ( not ( = ?auto_1565274 ?auto_1565282 ) ) ( not ( = ?auto_1565275 ?auto_1565276 ) ) ( not ( = ?auto_1565275 ?auto_1565277 ) ) ( not ( = ?auto_1565275 ?auto_1565278 ) ) ( not ( = ?auto_1565275 ?auto_1565281 ) ) ( not ( = ?auto_1565275 ?auto_1565282 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565276 ?auto_1565277 ?auto_1565278 )
      ( MAKE-4CRATE-VERIFY ?auto_1565274 ?auto_1565275 ?auto_1565276 ?auto_1565277 ?auto_1565278 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1565286 - SURFACE
      ?auto_1565287 - SURFACE
      ?auto_1565288 - SURFACE
      ?auto_1565289 - SURFACE
      ?auto_1565290 - SURFACE
      ?auto_1565291 - SURFACE
    )
    :vars
    (
      ?auto_1565292 - HOIST
      ?auto_1565293 - PLACE
      ?auto_1565296 - PLACE
      ?auto_1565298 - HOIST
      ?auto_1565294 - SURFACE
      ?auto_1565295 - SURFACE
      ?auto_1565297 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565292 ?auto_1565293 ) ( IS-CRATE ?auto_1565291 ) ( not ( = ?auto_1565290 ?auto_1565291 ) ) ( not ( = ?auto_1565289 ?auto_1565290 ) ) ( not ( = ?auto_1565289 ?auto_1565291 ) ) ( not ( = ?auto_1565296 ?auto_1565293 ) ) ( HOIST-AT ?auto_1565298 ?auto_1565296 ) ( not ( = ?auto_1565292 ?auto_1565298 ) ) ( SURFACE-AT ?auto_1565291 ?auto_1565296 ) ( ON ?auto_1565291 ?auto_1565294 ) ( CLEAR ?auto_1565291 ) ( not ( = ?auto_1565290 ?auto_1565294 ) ) ( not ( = ?auto_1565291 ?auto_1565294 ) ) ( not ( = ?auto_1565289 ?auto_1565294 ) ) ( SURFACE-AT ?auto_1565289 ?auto_1565293 ) ( CLEAR ?auto_1565289 ) ( IS-CRATE ?auto_1565290 ) ( AVAILABLE ?auto_1565292 ) ( AVAILABLE ?auto_1565298 ) ( SURFACE-AT ?auto_1565290 ?auto_1565296 ) ( ON ?auto_1565290 ?auto_1565295 ) ( CLEAR ?auto_1565290 ) ( not ( = ?auto_1565290 ?auto_1565295 ) ) ( not ( = ?auto_1565291 ?auto_1565295 ) ) ( not ( = ?auto_1565289 ?auto_1565295 ) ) ( not ( = ?auto_1565294 ?auto_1565295 ) ) ( TRUCK-AT ?auto_1565297 ?auto_1565293 ) ( ON ?auto_1565287 ?auto_1565286 ) ( ON ?auto_1565288 ?auto_1565287 ) ( ON ?auto_1565289 ?auto_1565288 ) ( not ( = ?auto_1565286 ?auto_1565287 ) ) ( not ( = ?auto_1565286 ?auto_1565288 ) ) ( not ( = ?auto_1565286 ?auto_1565289 ) ) ( not ( = ?auto_1565286 ?auto_1565290 ) ) ( not ( = ?auto_1565286 ?auto_1565291 ) ) ( not ( = ?auto_1565286 ?auto_1565294 ) ) ( not ( = ?auto_1565286 ?auto_1565295 ) ) ( not ( = ?auto_1565287 ?auto_1565288 ) ) ( not ( = ?auto_1565287 ?auto_1565289 ) ) ( not ( = ?auto_1565287 ?auto_1565290 ) ) ( not ( = ?auto_1565287 ?auto_1565291 ) ) ( not ( = ?auto_1565287 ?auto_1565294 ) ) ( not ( = ?auto_1565287 ?auto_1565295 ) ) ( not ( = ?auto_1565288 ?auto_1565289 ) ) ( not ( = ?auto_1565288 ?auto_1565290 ) ) ( not ( = ?auto_1565288 ?auto_1565291 ) ) ( not ( = ?auto_1565288 ?auto_1565294 ) ) ( not ( = ?auto_1565288 ?auto_1565295 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565289 ?auto_1565290 ?auto_1565291 )
      ( MAKE-5CRATE-VERIFY ?auto_1565286 ?auto_1565287 ?auto_1565288 ?auto_1565289 ?auto_1565290 ?auto_1565291 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1565299 - SURFACE
      ?auto_1565300 - SURFACE
      ?auto_1565301 - SURFACE
      ?auto_1565302 - SURFACE
      ?auto_1565303 - SURFACE
      ?auto_1565304 - SURFACE
      ?auto_1565305 - SURFACE
    )
    :vars
    (
      ?auto_1565306 - HOIST
      ?auto_1565307 - PLACE
      ?auto_1565310 - PLACE
      ?auto_1565312 - HOIST
      ?auto_1565308 - SURFACE
      ?auto_1565309 - SURFACE
      ?auto_1565311 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565306 ?auto_1565307 ) ( IS-CRATE ?auto_1565305 ) ( not ( = ?auto_1565304 ?auto_1565305 ) ) ( not ( = ?auto_1565303 ?auto_1565304 ) ) ( not ( = ?auto_1565303 ?auto_1565305 ) ) ( not ( = ?auto_1565310 ?auto_1565307 ) ) ( HOIST-AT ?auto_1565312 ?auto_1565310 ) ( not ( = ?auto_1565306 ?auto_1565312 ) ) ( SURFACE-AT ?auto_1565305 ?auto_1565310 ) ( ON ?auto_1565305 ?auto_1565308 ) ( CLEAR ?auto_1565305 ) ( not ( = ?auto_1565304 ?auto_1565308 ) ) ( not ( = ?auto_1565305 ?auto_1565308 ) ) ( not ( = ?auto_1565303 ?auto_1565308 ) ) ( SURFACE-AT ?auto_1565303 ?auto_1565307 ) ( CLEAR ?auto_1565303 ) ( IS-CRATE ?auto_1565304 ) ( AVAILABLE ?auto_1565306 ) ( AVAILABLE ?auto_1565312 ) ( SURFACE-AT ?auto_1565304 ?auto_1565310 ) ( ON ?auto_1565304 ?auto_1565309 ) ( CLEAR ?auto_1565304 ) ( not ( = ?auto_1565304 ?auto_1565309 ) ) ( not ( = ?auto_1565305 ?auto_1565309 ) ) ( not ( = ?auto_1565303 ?auto_1565309 ) ) ( not ( = ?auto_1565308 ?auto_1565309 ) ) ( TRUCK-AT ?auto_1565311 ?auto_1565307 ) ( ON ?auto_1565300 ?auto_1565299 ) ( ON ?auto_1565301 ?auto_1565300 ) ( ON ?auto_1565302 ?auto_1565301 ) ( ON ?auto_1565303 ?auto_1565302 ) ( not ( = ?auto_1565299 ?auto_1565300 ) ) ( not ( = ?auto_1565299 ?auto_1565301 ) ) ( not ( = ?auto_1565299 ?auto_1565302 ) ) ( not ( = ?auto_1565299 ?auto_1565303 ) ) ( not ( = ?auto_1565299 ?auto_1565304 ) ) ( not ( = ?auto_1565299 ?auto_1565305 ) ) ( not ( = ?auto_1565299 ?auto_1565308 ) ) ( not ( = ?auto_1565299 ?auto_1565309 ) ) ( not ( = ?auto_1565300 ?auto_1565301 ) ) ( not ( = ?auto_1565300 ?auto_1565302 ) ) ( not ( = ?auto_1565300 ?auto_1565303 ) ) ( not ( = ?auto_1565300 ?auto_1565304 ) ) ( not ( = ?auto_1565300 ?auto_1565305 ) ) ( not ( = ?auto_1565300 ?auto_1565308 ) ) ( not ( = ?auto_1565300 ?auto_1565309 ) ) ( not ( = ?auto_1565301 ?auto_1565302 ) ) ( not ( = ?auto_1565301 ?auto_1565303 ) ) ( not ( = ?auto_1565301 ?auto_1565304 ) ) ( not ( = ?auto_1565301 ?auto_1565305 ) ) ( not ( = ?auto_1565301 ?auto_1565308 ) ) ( not ( = ?auto_1565301 ?auto_1565309 ) ) ( not ( = ?auto_1565302 ?auto_1565303 ) ) ( not ( = ?auto_1565302 ?auto_1565304 ) ) ( not ( = ?auto_1565302 ?auto_1565305 ) ) ( not ( = ?auto_1565302 ?auto_1565308 ) ) ( not ( = ?auto_1565302 ?auto_1565309 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565303 ?auto_1565304 ?auto_1565305 )
      ( MAKE-6CRATE-VERIFY ?auto_1565299 ?auto_1565300 ?auto_1565301 ?auto_1565302 ?auto_1565303 ?auto_1565304 ?auto_1565305 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1565313 - SURFACE
      ?auto_1565314 - SURFACE
      ?auto_1565315 - SURFACE
      ?auto_1565316 - SURFACE
      ?auto_1565317 - SURFACE
      ?auto_1565318 - SURFACE
      ?auto_1565319 - SURFACE
      ?auto_1565320 - SURFACE
    )
    :vars
    (
      ?auto_1565321 - HOIST
      ?auto_1565322 - PLACE
      ?auto_1565325 - PLACE
      ?auto_1565327 - HOIST
      ?auto_1565323 - SURFACE
      ?auto_1565324 - SURFACE
      ?auto_1565326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565321 ?auto_1565322 ) ( IS-CRATE ?auto_1565320 ) ( not ( = ?auto_1565319 ?auto_1565320 ) ) ( not ( = ?auto_1565318 ?auto_1565319 ) ) ( not ( = ?auto_1565318 ?auto_1565320 ) ) ( not ( = ?auto_1565325 ?auto_1565322 ) ) ( HOIST-AT ?auto_1565327 ?auto_1565325 ) ( not ( = ?auto_1565321 ?auto_1565327 ) ) ( SURFACE-AT ?auto_1565320 ?auto_1565325 ) ( ON ?auto_1565320 ?auto_1565323 ) ( CLEAR ?auto_1565320 ) ( not ( = ?auto_1565319 ?auto_1565323 ) ) ( not ( = ?auto_1565320 ?auto_1565323 ) ) ( not ( = ?auto_1565318 ?auto_1565323 ) ) ( SURFACE-AT ?auto_1565318 ?auto_1565322 ) ( CLEAR ?auto_1565318 ) ( IS-CRATE ?auto_1565319 ) ( AVAILABLE ?auto_1565321 ) ( AVAILABLE ?auto_1565327 ) ( SURFACE-AT ?auto_1565319 ?auto_1565325 ) ( ON ?auto_1565319 ?auto_1565324 ) ( CLEAR ?auto_1565319 ) ( not ( = ?auto_1565319 ?auto_1565324 ) ) ( not ( = ?auto_1565320 ?auto_1565324 ) ) ( not ( = ?auto_1565318 ?auto_1565324 ) ) ( not ( = ?auto_1565323 ?auto_1565324 ) ) ( TRUCK-AT ?auto_1565326 ?auto_1565322 ) ( ON ?auto_1565314 ?auto_1565313 ) ( ON ?auto_1565315 ?auto_1565314 ) ( ON ?auto_1565316 ?auto_1565315 ) ( ON ?auto_1565317 ?auto_1565316 ) ( ON ?auto_1565318 ?auto_1565317 ) ( not ( = ?auto_1565313 ?auto_1565314 ) ) ( not ( = ?auto_1565313 ?auto_1565315 ) ) ( not ( = ?auto_1565313 ?auto_1565316 ) ) ( not ( = ?auto_1565313 ?auto_1565317 ) ) ( not ( = ?auto_1565313 ?auto_1565318 ) ) ( not ( = ?auto_1565313 ?auto_1565319 ) ) ( not ( = ?auto_1565313 ?auto_1565320 ) ) ( not ( = ?auto_1565313 ?auto_1565323 ) ) ( not ( = ?auto_1565313 ?auto_1565324 ) ) ( not ( = ?auto_1565314 ?auto_1565315 ) ) ( not ( = ?auto_1565314 ?auto_1565316 ) ) ( not ( = ?auto_1565314 ?auto_1565317 ) ) ( not ( = ?auto_1565314 ?auto_1565318 ) ) ( not ( = ?auto_1565314 ?auto_1565319 ) ) ( not ( = ?auto_1565314 ?auto_1565320 ) ) ( not ( = ?auto_1565314 ?auto_1565323 ) ) ( not ( = ?auto_1565314 ?auto_1565324 ) ) ( not ( = ?auto_1565315 ?auto_1565316 ) ) ( not ( = ?auto_1565315 ?auto_1565317 ) ) ( not ( = ?auto_1565315 ?auto_1565318 ) ) ( not ( = ?auto_1565315 ?auto_1565319 ) ) ( not ( = ?auto_1565315 ?auto_1565320 ) ) ( not ( = ?auto_1565315 ?auto_1565323 ) ) ( not ( = ?auto_1565315 ?auto_1565324 ) ) ( not ( = ?auto_1565316 ?auto_1565317 ) ) ( not ( = ?auto_1565316 ?auto_1565318 ) ) ( not ( = ?auto_1565316 ?auto_1565319 ) ) ( not ( = ?auto_1565316 ?auto_1565320 ) ) ( not ( = ?auto_1565316 ?auto_1565323 ) ) ( not ( = ?auto_1565316 ?auto_1565324 ) ) ( not ( = ?auto_1565317 ?auto_1565318 ) ) ( not ( = ?auto_1565317 ?auto_1565319 ) ) ( not ( = ?auto_1565317 ?auto_1565320 ) ) ( not ( = ?auto_1565317 ?auto_1565323 ) ) ( not ( = ?auto_1565317 ?auto_1565324 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565318 ?auto_1565319 ?auto_1565320 )
      ( MAKE-7CRATE-VERIFY ?auto_1565313 ?auto_1565314 ?auto_1565315 ?auto_1565316 ?auto_1565317 ?auto_1565318 ?auto_1565319 ?auto_1565320 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1565328 - SURFACE
      ?auto_1565329 - SURFACE
      ?auto_1565330 - SURFACE
      ?auto_1565331 - SURFACE
      ?auto_1565332 - SURFACE
      ?auto_1565333 - SURFACE
      ?auto_1565334 - SURFACE
      ?auto_1565335 - SURFACE
      ?auto_1565336 - SURFACE
    )
    :vars
    (
      ?auto_1565337 - HOIST
      ?auto_1565338 - PLACE
      ?auto_1565341 - PLACE
      ?auto_1565343 - HOIST
      ?auto_1565339 - SURFACE
      ?auto_1565340 - SURFACE
      ?auto_1565342 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565337 ?auto_1565338 ) ( IS-CRATE ?auto_1565336 ) ( not ( = ?auto_1565335 ?auto_1565336 ) ) ( not ( = ?auto_1565334 ?auto_1565335 ) ) ( not ( = ?auto_1565334 ?auto_1565336 ) ) ( not ( = ?auto_1565341 ?auto_1565338 ) ) ( HOIST-AT ?auto_1565343 ?auto_1565341 ) ( not ( = ?auto_1565337 ?auto_1565343 ) ) ( SURFACE-AT ?auto_1565336 ?auto_1565341 ) ( ON ?auto_1565336 ?auto_1565339 ) ( CLEAR ?auto_1565336 ) ( not ( = ?auto_1565335 ?auto_1565339 ) ) ( not ( = ?auto_1565336 ?auto_1565339 ) ) ( not ( = ?auto_1565334 ?auto_1565339 ) ) ( SURFACE-AT ?auto_1565334 ?auto_1565338 ) ( CLEAR ?auto_1565334 ) ( IS-CRATE ?auto_1565335 ) ( AVAILABLE ?auto_1565337 ) ( AVAILABLE ?auto_1565343 ) ( SURFACE-AT ?auto_1565335 ?auto_1565341 ) ( ON ?auto_1565335 ?auto_1565340 ) ( CLEAR ?auto_1565335 ) ( not ( = ?auto_1565335 ?auto_1565340 ) ) ( not ( = ?auto_1565336 ?auto_1565340 ) ) ( not ( = ?auto_1565334 ?auto_1565340 ) ) ( not ( = ?auto_1565339 ?auto_1565340 ) ) ( TRUCK-AT ?auto_1565342 ?auto_1565338 ) ( ON ?auto_1565329 ?auto_1565328 ) ( ON ?auto_1565330 ?auto_1565329 ) ( ON ?auto_1565331 ?auto_1565330 ) ( ON ?auto_1565332 ?auto_1565331 ) ( ON ?auto_1565333 ?auto_1565332 ) ( ON ?auto_1565334 ?auto_1565333 ) ( not ( = ?auto_1565328 ?auto_1565329 ) ) ( not ( = ?auto_1565328 ?auto_1565330 ) ) ( not ( = ?auto_1565328 ?auto_1565331 ) ) ( not ( = ?auto_1565328 ?auto_1565332 ) ) ( not ( = ?auto_1565328 ?auto_1565333 ) ) ( not ( = ?auto_1565328 ?auto_1565334 ) ) ( not ( = ?auto_1565328 ?auto_1565335 ) ) ( not ( = ?auto_1565328 ?auto_1565336 ) ) ( not ( = ?auto_1565328 ?auto_1565339 ) ) ( not ( = ?auto_1565328 ?auto_1565340 ) ) ( not ( = ?auto_1565329 ?auto_1565330 ) ) ( not ( = ?auto_1565329 ?auto_1565331 ) ) ( not ( = ?auto_1565329 ?auto_1565332 ) ) ( not ( = ?auto_1565329 ?auto_1565333 ) ) ( not ( = ?auto_1565329 ?auto_1565334 ) ) ( not ( = ?auto_1565329 ?auto_1565335 ) ) ( not ( = ?auto_1565329 ?auto_1565336 ) ) ( not ( = ?auto_1565329 ?auto_1565339 ) ) ( not ( = ?auto_1565329 ?auto_1565340 ) ) ( not ( = ?auto_1565330 ?auto_1565331 ) ) ( not ( = ?auto_1565330 ?auto_1565332 ) ) ( not ( = ?auto_1565330 ?auto_1565333 ) ) ( not ( = ?auto_1565330 ?auto_1565334 ) ) ( not ( = ?auto_1565330 ?auto_1565335 ) ) ( not ( = ?auto_1565330 ?auto_1565336 ) ) ( not ( = ?auto_1565330 ?auto_1565339 ) ) ( not ( = ?auto_1565330 ?auto_1565340 ) ) ( not ( = ?auto_1565331 ?auto_1565332 ) ) ( not ( = ?auto_1565331 ?auto_1565333 ) ) ( not ( = ?auto_1565331 ?auto_1565334 ) ) ( not ( = ?auto_1565331 ?auto_1565335 ) ) ( not ( = ?auto_1565331 ?auto_1565336 ) ) ( not ( = ?auto_1565331 ?auto_1565339 ) ) ( not ( = ?auto_1565331 ?auto_1565340 ) ) ( not ( = ?auto_1565332 ?auto_1565333 ) ) ( not ( = ?auto_1565332 ?auto_1565334 ) ) ( not ( = ?auto_1565332 ?auto_1565335 ) ) ( not ( = ?auto_1565332 ?auto_1565336 ) ) ( not ( = ?auto_1565332 ?auto_1565339 ) ) ( not ( = ?auto_1565332 ?auto_1565340 ) ) ( not ( = ?auto_1565333 ?auto_1565334 ) ) ( not ( = ?auto_1565333 ?auto_1565335 ) ) ( not ( = ?auto_1565333 ?auto_1565336 ) ) ( not ( = ?auto_1565333 ?auto_1565339 ) ) ( not ( = ?auto_1565333 ?auto_1565340 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565334 ?auto_1565335 ?auto_1565336 )
      ( MAKE-8CRATE-VERIFY ?auto_1565328 ?auto_1565329 ?auto_1565330 ?auto_1565331 ?auto_1565332 ?auto_1565333 ?auto_1565334 ?auto_1565335 ?auto_1565336 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1565344 - SURFACE
      ?auto_1565345 - SURFACE
      ?auto_1565346 - SURFACE
      ?auto_1565347 - SURFACE
      ?auto_1565348 - SURFACE
      ?auto_1565349 - SURFACE
      ?auto_1565350 - SURFACE
      ?auto_1565351 - SURFACE
      ?auto_1565352 - SURFACE
      ?auto_1565353 - SURFACE
    )
    :vars
    (
      ?auto_1565354 - HOIST
      ?auto_1565355 - PLACE
      ?auto_1565358 - PLACE
      ?auto_1565360 - HOIST
      ?auto_1565356 - SURFACE
      ?auto_1565357 - SURFACE
      ?auto_1565359 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565354 ?auto_1565355 ) ( IS-CRATE ?auto_1565353 ) ( not ( = ?auto_1565352 ?auto_1565353 ) ) ( not ( = ?auto_1565351 ?auto_1565352 ) ) ( not ( = ?auto_1565351 ?auto_1565353 ) ) ( not ( = ?auto_1565358 ?auto_1565355 ) ) ( HOIST-AT ?auto_1565360 ?auto_1565358 ) ( not ( = ?auto_1565354 ?auto_1565360 ) ) ( SURFACE-AT ?auto_1565353 ?auto_1565358 ) ( ON ?auto_1565353 ?auto_1565356 ) ( CLEAR ?auto_1565353 ) ( not ( = ?auto_1565352 ?auto_1565356 ) ) ( not ( = ?auto_1565353 ?auto_1565356 ) ) ( not ( = ?auto_1565351 ?auto_1565356 ) ) ( SURFACE-AT ?auto_1565351 ?auto_1565355 ) ( CLEAR ?auto_1565351 ) ( IS-CRATE ?auto_1565352 ) ( AVAILABLE ?auto_1565354 ) ( AVAILABLE ?auto_1565360 ) ( SURFACE-AT ?auto_1565352 ?auto_1565358 ) ( ON ?auto_1565352 ?auto_1565357 ) ( CLEAR ?auto_1565352 ) ( not ( = ?auto_1565352 ?auto_1565357 ) ) ( not ( = ?auto_1565353 ?auto_1565357 ) ) ( not ( = ?auto_1565351 ?auto_1565357 ) ) ( not ( = ?auto_1565356 ?auto_1565357 ) ) ( TRUCK-AT ?auto_1565359 ?auto_1565355 ) ( ON ?auto_1565345 ?auto_1565344 ) ( ON ?auto_1565346 ?auto_1565345 ) ( ON ?auto_1565347 ?auto_1565346 ) ( ON ?auto_1565348 ?auto_1565347 ) ( ON ?auto_1565349 ?auto_1565348 ) ( ON ?auto_1565350 ?auto_1565349 ) ( ON ?auto_1565351 ?auto_1565350 ) ( not ( = ?auto_1565344 ?auto_1565345 ) ) ( not ( = ?auto_1565344 ?auto_1565346 ) ) ( not ( = ?auto_1565344 ?auto_1565347 ) ) ( not ( = ?auto_1565344 ?auto_1565348 ) ) ( not ( = ?auto_1565344 ?auto_1565349 ) ) ( not ( = ?auto_1565344 ?auto_1565350 ) ) ( not ( = ?auto_1565344 ?auto_1565351 ) ) ( not ( = ?auto_1565344 ?auto_1565352 ) ) ( not ( = ?auto_1565344 ?auto_1565353 ) ) ( not ( = ?auto_1565344 ?auto_1565356 ) ) ( not ( = ?auto_1565344 ?auto_1565357 ) ) ( not ( = ?auto_1565345 ?auto_1565346 ) ) ( not ( = ?auto_1565345 ?auto_1565347 ) ) ( not ( = ?auto_1565345 ?auto_1565348 ) ) ( not ( = ?auto_1565345 ?auto_1565349 ) ) ( not ( = ?auto_1565345 ?auto_1565350 ) ) ( not ( = ?auto_1565345 ?auto_1565351 ) ) ( not ( = ?auto_1565345 ?auto_1565352 ) ) ( not ( = ?auto_1565345 ?auto_1565353 ) ) ( not ( = ?auto_1565345 ?auto_1565356 ) ) ( not ( = ?auto_1565345 ?auto_1565357 ) ) ( not ( = ?auto_1565346 ?auto_1565347 ) ) ( not ( = ?auto_1565346 ?auto_1565348 ) ) ( not ( = ?auto_1565346 ?auto_1565349 ) ) ( not ( = ?auto_1565346 ?auto_1565350 ) ) ( not ( = ?auto_1565346 ?auto_1565351 ) ) ( not ( = ?auto_1565346 ?auto_1565352 ) ) ( not ( = ?auto_1565346 ?auto_1565353 ) ) ( not ( = ?auto_1565346 ?auto_1565356 ) ) ( not ( = ?auto_1565346 ?auto_1565357 ) ) ( not ( = ?auto_1565347 ?auto_1565348 ) ) ( not ( = ?auto_1565347 ?auto_1565349 ) ) ( not ( = ?auto_1565347 ?auto_1565350 ) ) ( not ( = ?auto_1565347 ?auto_1565351 ) ) ( not ( = ?auto_1565347 ?auto_1565352 ) ) ( not ( = ?auto_1565347 ?auto_1565353 ) ) ( not ( = ?auto_1565347 ?auto_1565356 ) ) ( not ( = ?auto_1565347 ?auto_1565357 ) ) ( not ( = ?auto_1565348 ?auto_1565349 ) ) ( not ( = ?auto_1565348 ?auto_1565350 ) ) ( not ( = ?auto_1565348 ?auto_1565351 ) ) ( not ( = ?auto_1565348 ?auto_1565352 ) ) ( not ( = ?auto_1565348 ?auto_1565353 ) ) ( not ( = ?auto_1565348 ?auto_1565356 ) ) ( not ( = ?auto_1565348 ?auto_1565357 ) ) ( not ( = ?auto_1565349 ?auto_1565350 ) ) ( not ( = ?auto_1565349 ?auto_1565351 ) ) ( not ( = ?auto_1565349 ?auto_1565352 ) ) ( not ( = ?auto_1565349 ?auto_1565353 ) ) ( not ( = ?auto_1565349 ?auto_1565356 ) ) ( not ( = ?auto_1565349 ?auto_1565357 ) ) ( not ( = ?auto_1565350 ?auto_1565351 ) ) ( not ( = ?auto_1565350 ?auto_1565352 ) ) ( not ( = ?auto_1565350 ?auto_1565353 ) ) ( not ( = ?auto_1565350 ?auto_1565356 ) ) ( not ( = ?auto_1565350 ?auto_1565357 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565351 ?auto_1565352 ?auto_1565353 )
      ( MAKE-9CRATE-VERIFY ?auto_1565344 ?auto_1565345 ?auto_1565346 ?auto_1565347 ?auto_1565348 ?auto_1565349 ?auto_1565350 ?auto_1565351 ?auto_1565352 ?auto_1565353 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1565361 - SURFACE
      ?auto_1565362 - SURFACE
      ?auto_1565363 - SURFACE
      ?auto_1565364 - SURFACE
      ?auto_1565365 - SURFACE
      ?auto_1565366 - SURFACE
      ?auto_1565367 - SURFACE
      ?auto_1565368 - SURFACE
      ?auto_1565369 - SURFACE
      ?auto_1565370 - SURFACE
      ?auto_1565371 - SURFACE
    )
    :vars
    (
      ?auto_1565372 - HOIST
      ?auto_1565373 - PLACE
      ?auto_1565376 - PLACE
      ?auto_1565378 - HOIST
      ?auto_1565374 - SURFACE
      ?auto_1565375 - SURFACE
      ?auto_1565377 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565372 ?auto_1565373 ) ( IS-CRATE ?auto_1565371 ) ( not ( = ?auto_1565370 ?auto_1565371 ) ) ( not ( = ?auto_1565369 ?auto_1565370 ) ) ( not ( = ?auto_1565369 ?auto_1565371 ) ) ( not ( = ?auto_1565376 ?auto_1565373 ) ) ( HOIST-AT ?auto_1565378 ?auto_1565376 ) ( not ( = ?auto_1565372 ?auto_1565378 ) ) ( SURFACE-AT ?auto_1565371 ?auto_1565376 ) ( ON ?auto_1565371 ?auto_1565374 ) ( CLEAR ?auto_1565371 ) ( not ( = ?auto_1565370 ?auto_1565374 ) ) ( not ( = ?auto_1565371 ?auto_1565374 ) ) ( not ( = ?auto_1565369 ?auto_1565374 ) ) ( SURFACE-AT ?auto_1565369 ?auto_1565373 ) ( CLEAR ?auto_1565369 ) ( IS-CRATE ?auto_1565370 ) ( AVAILABLE ?auto_1565372 ) ( AVAILABLE ?auto_1565378 ) ( SURFACE-AT ?auto_1565370 ?auto_1565376 ) ( ON ?auto_1565370 ?auto_1565375 ) ( CLEAR ?auto_1565370 ) ( not ( = ?auto_1565370 ?auto_1565375 ) ) ( not ( = ?auto_1565371 ?auto_1565375 ) ) ( not ( = ?auto_1565369 ?auto_1565375 ) ) ( not ( = ?auto_1565374 ?auto_1565375 ) ) ( TRUCK-AT ?auto_1565377 ?auto_1565373 ) ( ON ?auto_1565362 ?auto_1565361 ) ( ON ?auto_1565363 ?auto_1565362 ) ( ON ?auto_1565364 ?auto_1565363 ) ( ON ?auto_1565365 ?auto_1565364 ) ( ON ?auto_1565366 ?auto_1565365 ) ( ON ?auto_1565367 ?auto_1565366 ) ( ON ?auto_1565368 ?auto_1565367 ) ( ON ?auto_1565369 ?auto_1565368 ) ( not ( = ?auto_1565361 ?auto_1565362 ) ) ( not ( = ?auto_1565361 ?auto_1565363 ) ) ( not ( = ?auto_1565361 ?auto_1565364 ) ) ( not ( = ?auto_1565361 ?auto_1565365 ) ) ( not ( = ?auto_1565361 ?auto_1565366 ) ) ( not ( = ?auto_1565361 ?auto_1565367 ) ) ( not ( = ?auto_1565361 ?auto_1565368 ) ) ( not ( = ?auto_1565361 ?auto_1565369 ) ) ( not ( = ?auto_1565361 ?auto_1565370 ) ) ( not ( = ?auto_1565361 ?auto_1565371 ) ) ( not ( = ?auto_1565361 ?auto_1565374 ) ) ( not ( = ?auto_1565361 ?auto_1565375 ) ) ( not ( = ?auto_1565362 ?auto_1565363 ) ) ( not ( = ?auto_1565362 ?auto_1565364 ) ) ( not ( = ?auto_1565362 ?auto_1565365 ) ) ( not ( = ?auto_1565362 ?auto_1565366 ) ) ( not ( = ?auto_1565362 ?auto_1565367 ) ) ( not ( = ?auto_1565362 ?auto_1565368 ) ) ( not ( = ?auto_1565362 ?auto_1565369 ) ) ( not ( = ?auto_1565362 ?auto_1565370 ) ) ( not ( = ?auto_1565362 ?auto_1565371 ) ) ( not ( = ?auto_1565362 ?auto_1565374 ) ) ( not ( = ?auto_1565362 ?auto_1565375 ) ) ( not ( = ?auto_1565363 ?auto_1565364 ) ) ( not ( = ?auto_1565363 ?auto_1565365 ) ) ( not ( = ?auto_1565363 ?auto_1565366 ) ) ( not ( = ?auto_1565363 ?auto_1565367 ) ) ( not ( = ?auto_1565363 ?auto_1565368 ) ) ( not ( = ?auto_1565363 ?auto_1565369 ) ) ( not ( = ?auto_1565363 ?auto_1565370 ) ) ( not ( = ?auto_1565363 ?auto_1565371 ) ) ( not ( = ?auto_1565363 ?auto_1565374 ) ) ( not ( = ?auto_1565363 ?auto_1565375 ) ) ( not ( = ?auto_1565364 ?auto_1565365 ) ) ( not ( = ?auto_1565364 ?auto_1565366 ) ) ( not ( = ?auto_1565364 ?auto_1565367 ) ) ( not ( = ?auto_1565364 ?auto_1565368 ) ) ( not ( = ?auto_1565364 ?auto_1565369 ) ) ( not ( = ?auto_1565364 ?auto_1565370 ) ) ( not ( = ?auto_1565364 ?auto_1565371 ) ) ( not ( = ?auto_1565364 ?auto_1565374 ) ) ( not ( = ?auto_1565364 ?auto_1565375 ) ) ( not ( = ?auto_1565365 ?auto_1565366 ) ) ( not ( = ?auto_1565365 ?auto_1565367 ) ) ( not ( = ?auto_1565365 ?auto_1565368 ) ) ( not ( = ?auto_1565365 ?auto_1565369 ) ) ( not ( = ?auto_1565365 ?auto_1565370 ) ) ( not ( = ?auto_1565365 ?auto_1565371 ) ) ( not ( = ?auto_1565365 ?auto_1565374 ) ) ( not ( = ?auto_1565365 ?auto_1565375 ) ) ( not ( = ?auto_1565366 ?auto_1565367 ) ) ( not ( = ?auto_1565366 ?auto_1565368 ) ) ( not ( = ?auto_1565366 ?auto_1565369 ) ) ( not ( = ?auto_1565366 ?auto_1565370 ) ) ( not ( = ?auto_1565366 ?auto_1565371 ) ) ( not ( = ?auto_1565366 ?auto_1565374 ) ) ( not ( = ?auto_1565366 ?auto_1565375 ) ) ( not ( = ?auto_1565367 ?auto_1565368 ) ) ( not ( = ?auto_1565367 ?auto_1565369 ) ) ( not ( = ?auto_1565367 ?auto_1565370 ) ) ( not ( = ?auto_1565367 ?auto_1565371 ) ) ( not ( = ?auto_1565367 ?auto_1565374 ) ) ( not ( = ?auto_1565367 ?auto_1565375 ) ) ( not ( = ?auto_1565368 ?auto_1565369 ) ) ( not ( = ?auto_1565368 ?auto_1565370 ) ) ( not ( = ?auto_1565368 ?auto_1565371 ) ) ( not ( = ?auto_1565368 ?auto_1565374 ) ) ( not ( = ?auto_1565368 ?auto_1565375 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565369 ?auto_1565370 ?auto_1565371 )
      ( MAKE-10CRATE-VERIFY ?auto_1565361 ?auto_1565362 ?auto_1565363 ?auto_1565364 ?auto_1565365 ?auto_1565366 ?auto_1565367 ?auto_1565368 ?auto_1565369 ?auto_1565370 ?auto_1565371 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1565379 - SURFACE
      ?auto_1565380 - SURFACE
      ?auto_1565381 - SURFACE
      ?auto_1565382 - SURFACE
      ?auto_1565383 - SURFACE
      ?auto_1565384 - SURFACE
      ?auto_1565385 - SURFACE
      ?auto_1565386 - SURFACE
      ?auto_1565387 - SURFACE
      ?auto_1565388 - SURFACE
      ?auto_1565389 - SURFACE
      ?auto_1565390 - SURFACE
    )
    :vars
    (
      ?auto_1565391 - HOIST
      ?auto_1565392 - PLACE
      ?auto_1565395 - PLACE
      ?auto_1565397 - HOIST
      ?auto_1565393 - SURFACE
      ?auto_1565394 - SURFACE
      ?auto_1565396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565391 ?auto_1565392 ) ( IS-CRATE ?auto_1565390 ) ( not ( = ?auto_1565389 ?auto_1565390 ) ) ( not ( = ?auto_1565388 ?auto_1565389 ) ) ( not ( = ?auto_1565388 ?auto_1565390 ) ) ( not ( = ?auto_1565395 ?auto_1565392 ) ) ( HOIST-AT ?auto_1565397 ?auto_1565395 ) ( not ( = ?auto_1565391 ?auto_1565397 ) ) ( SURFACE-AT ?auto_1565390 ?auto_1565395 ) ( ON ?auto_1565390 ?auto_1565393 ) ( CLEAR ?auto_1565390 ) ( not ( = ?auto_1565389 ?auto_1565393 ) ) ( not ( = ?auto_1565390 ?auto_1565393 ) ) ( not ( = ?auto_1565388 ?auto_1565393 ) ) ( SURFACE-AT ?auto_1565388 ?auto_1565392 ) ( CLEAR ?auto_1565388 ) ( IS-CRATE ?auto_1565389 ) ( AVAILABLE ?auto_1565391 ) ( AVAILABLE ?auto_1565397 ) ( SURFACE-AT ?auto_1565389 ?auto_1565395 ) ( ON ?auto_1565389 ?auto_1565394 ) ( CLEAR ?auto_1565389 ) ( not ( = ?auto_1565389 ?auto_1565394 ) ) ( not ( = ?auto_1565390 ?auto_1565394 ) ) ( not ( = ?auto_1565388 ?auto_1565394 ) ) ( not ( = ?auto_1565393 ?auto_1565394 ) ) ( TRUCK-AT ?auto_1565396 ?auto_1565392 ) ( ON ?auto_1565380 ?auto_1565379 ) ( ON ?auto_1565381 ?auto_1565380 ) ( ON ?auto_1565382 ?auto_1565381 ) ( ON ?auto_1565383 ?auto_1565382 ) ( ON ?auto_1565384 ?auto_1565383 ) ( ON ?auto_1565385 ?auto_1565384 ) ( ON ?auto_1565386 ?auto_1565385 ) ( ON ?auto_1565387 ?auto_1565386 ) ( ON ?auto_1565388 ?auto_1565387 ) ( not ( = ?auto_1565379 ?auto_1565380 ) ) ( not ( = ?auto_1565379 ?auto_1565381 ) ) ( not ( = ?auto_1565379 ?auto_1565382 ) ) ( not ( = ?auto_1565379 ?auto_1565383 ) ) ( not ( = ?auto_1565379 ?auto_1565384 ) ) ( not ( = ?auto_1565379 ?auto_1565385 ) ) ( not ( = ?auto_1565379 ?auto_1565386 ) ) ( not ( = ?auto_1565379 ?auto_1565387 ) ) ( not ( = ?auto_1565379 ?auto_1565388 ) ) ( not ( = ?auto_1565379 ?auto_1565389 ) ) ( not ( = ?auto_1565379 ?auto_1565390 ) ) ( not ( = ?auto_1565379 ?auto_1565393 ) ) ( not ( = ?auto_1565379 ?auto_1565394 ) ) ( not ( = ?auto_1565380 ?auto_1565381 ) ) ( not ( = ?auto_1565380 ?auto_1565382 ) ) ( not ( = ?auto_1565380 ?auto_1565383 ) ) ( not ( = ?auto_1565380 ?auto_1565384 ) ) ( not ( = ?auto_1565380 ?auto_1565385 ) ) ( not ( = ?auto_1565380 ?auto_1565386 ) ) ( not ( = ?auto_1565380 ?auto_1565387 ) ) ( not ( = ?auto_1565380 ?auto_1565388 ) ) ( not ( = ?auto_1565380 ?auto_1565389 ) ) ( not ( = ?auto_1565380 ?auto_1565390 ) ) ( not ( = ?auto_1565380 ?auto_1565393 ) ) ( not ( = ?auto_1565380 ?auto_1565394 ) ) ( not ( = ?auto_1565381 ?auto_1565382 ) ) ( not ( = ?auto_1565381 ?auto_1565383 ) ) ( not ( = ?auto_1565381 ?auto_1565384 ) ) ( not ( = ?auto_1565381 ?auto_1565385 ) ) ( not ( = ?auto_1565381 ?auto_1565386 ) ) ( not ( = ?auto_1565381 ?auto_1565387 ) ) ( not ( = ?auto_1565381 ?auto_1565388 ) ) ( not ( = ?auto_1565381 ?auto_1565389 ) ) ( not ( = ?auto_1565381 ?auto_1565390 ) ) ( not ( = ?auto_1565381 ?auto_1565393 ) ) ( not ( = ?auto_1565381 ?auto_1565394 ) ) ( not ( = ?auto_1565382 ?auto_1565383 ) ) ( not ( = ?auto_1565382 ?auto_1565384 ) ) ( not ( = ?auto_1565382 ?auto_1565385 ) ) ( not ( = ?auto_1565382 ?auto_1565386 ) ) ( not ( = ?auto_1565382 ?auto_1565387 ) ) ( not ( = ?auto_1565382 ?auto_1565388 ) ) ( not ( = ?auto_1565382 ?auto_1565389 ) ) ( not ( = ?auto_1565382 ?auto_1565390 ) ) ( not ( = ?auto_1565382 ?auto_1565393 ) ) ( not ( = ?auto_1565382 ?auto_1565394 ) ) ( not ( = ?auto_1565383 ?auto_1565384 ) ) ( not ( = ?auto_1565383 ?auto_1565385 ) ) ( not ( = ?auto_1565383 ?auto_1565386 ) ) ( not ( = ?auto_1565383 ?auto_1565387 ) ) ( not ( = ?auto_1565383 ?auto_1565388 ) ) ( not ( = ?auto_1565383 ?auto_1565389 ) ) ( not ( = ?auto_1565383 ?auto_1565390 ) ) ( not ( = ?auto_1565383 ?auto_1565393 ) ) ( not ( = ?auto_1565383 ?auto_1565394 ) ) ( not ( = ?auto_1565384 ?auto_1565385 ) ) ( not ( = ?auto_1565384 ?auto_1565386 ) ) ( not ( = ?auto_1565384 ?auto_1565387 ) ) ( not ( = ?auto_1565384 ?auto_1565388 ) ) ( not ( = ?auto_1565384 ?auto_1565389 ) ) ( not ( = ?auto_1565384 ?auto_1565390 ) ) ( not ( = ?auto_1565384 ?auto_1565393 ) ) ( not ( = ?auto_1565384 ?auto_1565394 ) ) ( not ( = ?auto_1565385 ?auto_1565386 ) ) ( not ( = ?auto_1565385 ?auto_1565387 ) ) ( not ( = ?auto_1565385 ?auto_1565388 ) ) ( not ( = ?auto_1565385 ?auto_1565389 ) ) ( not ( = ?auto_1565385 ?auto_1565390 ) ) ( not ( = ?auto_1565385 ?auto_1565393 ) ) ( not ( = ?auto_1565385 ?auto_1565394 ) ) ( not ( = ?auto_1565386 ?auto_1565387 ) ) ( not ( = ?auto_1565386 ?auto_1565388 ) ) ( not ( = ?auto_1565386 ?auto_1565389 ) ) ( not ( = ?auto_1565386 ?auto_1565390 ) ) ( not ( = ?auto_1565386 ?auto_1565393 ) ) ( not ( = ?auto_1565386 ?auto_1565394 ) ) ( not ( = ?auto_1565387 ?auto_1565388 ) ) ( not ( = ?auto_1565387 ?auto_1565389 ) ) ( not ( = ?auto_1565387 ?auto_1565390 ) ) ( not ( = ?auto_1565387 ?auto_1565393 ) ) ( not ( = ?auto_1565387 ?auto_1565394 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565388 ?auto_1565389 ?auto_1565390 )
      ( MAKE-11CRATE-VERIFY ?auto_1565379 ?auto_1565380 ?auto_1565381 ?auto_1565382 ?auto_1565383 ?auto_1565384 ?auto_1565385 ?auto_1565386 ?auto_1565387 ?auto_1565388 ?auto_1565389 ?auto_1565390 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1565398 - SURFACE
      ?auto_1565399 - SURFACE
      ?auto_1565400 - SURFACE
      ?auto_1565401 - SURFACE
      ?auto_1565402 - SURFACE
      ?auto_1565403 - SURFACE
      ?auto_1565404 - SURFACE
      ?auto_1565405 - SURFACE
      ?auto_1565406 - SURFACE
      ?auto_1565407 - SURFACE
      ?auto_1565408 - SURFACE
      ?auto_1565409 - SURFACE
      ?auto_1565410 - SURFACE
    )
    :vars
    (
      ?auto_1565411 - HOIST
      ?auto_1565412 - PLACE
      ?auto_1565415 - PLACE
      ?auto_1565417 - HOIST
      ?auto_1565413 - SURFACE
      ?auto_1565414 - SURFACE
      ?auto_1565416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565411 ?auto_1565412 ) ( IS-CRATE ?auto_1565410 ) ( not ( = ?auto_1565409 ?auto_1565410 ) ) ( not ( = ?auto_1565408 ?auto_1565409 ) ) ( not ( = ?auto_1565408 ?auto_1565410 ) ) ( not ( = ?auto_1565415 ?auto_1565412 ) ) ( HOIST-AT ?auto_1565417 ?auto_1565415 ) ( not ( = ?auto_1565411 ?auto_1565417 ) ) ( SURFACE-AT ?auto_1565410 ?auto_1565415 ) ( ON ?auto_1565410 ?auto_1565413 ) ( CLEAR ?auto_1565410 ) ( not ( = ?auto_1565409 ?auto_1565413 ) ) ( not ( = ?auto_1565410 ?auto_1565413 ) ) ( not ( = ?auto_1565408 ?auto_1565413 ) ) ( SURFACE-AT ?auto_1565408 ?auto_1565412 ) ( CLEAR ?auto_1565408 ) ( IS-CRATE ?auto_1565409 ) ( AVAILABLE ?auto_1565411 ) ( AVAILABLE ?auto_1565417 ) ( SURFACE-AT ?auto_1565409 ?auto_1565415 ) ( ON ?auto_1565409 ?auto_1565414 ) ( CLEAR ?auto_1565409 ) ( not ( = ?auto_1565409 ?auto_1565414 ) ) ( not ( = ?auto_1565410 ?auto_1565414 ) ) ( not ( = ?auto_1565408 ?auto_1565414 ) ) ( not ( = ?auto_1565413 ?auto_1565414 ) ) ( TRUCK-AT ?auto_1565416 ?auto_1565412 ) ( ON ?auto_1565399 ?auto_1565398 ) ( ON ?auto_1565400 ?auto_1565399 ) ( ON ?auto_1565401 ?auto_1565400 ) ( ON ?auto_1565402 ?auto_1565401 ) ( ON ?auto_1565403 ?auto_1565402 ) ( ON ?auto_1565404 ?auto_1565403 ) ( ON ?auto_1565405 ?auto_1565404 ) ( ON ?auto_1565406 ?auto_1565405 ) ( ON ?auto_1565407 ?auto_1565406 ) ( ON ?auto_1565408 ?auto_1565407 ) ( not ( = ?auto_1565398 ?auto_1565399 ) ) ( not ( = ?auto_1565398 ?auto_1565400 ) ) ( not ( = ?auto_1565398 ?auto_1565401 ) ) ( not ( = ?auto_1565398 ?auto_1565402 ) ) ( not ( = ?auto_1565398 ?auto_1565403 ) ) ( not ( = ?auto_1565398 ?auto_1565404 ) ) ( not ( = ?auto_1565398 ?auto_1565405 ) ) ( not ( = ?auto_1565398 ?auto_1565406 ) ) ( not ( = ?auto_1565398 ?auto_1565407 ) ) ( not ( = ?auto_1565398 ?auto_1565408 ) ) ( not ( = ?auto_1565398 ?auto_1565409 ) ) ( not ( = ?auto_1565398 ?auto_1565410 ) ) ( not ( = ?auto_1565398 ?auto_1565413 ) ) ( not ( = ?auto_1565398 ?auto_1565414 ) ) ( not ( = ?auto_1565399 ?auto_1565400 ) ) ( not ( = ?auto_1565399 ?auto_1565401 ) ) ( not ( = ?auto_1565399 ?auto_1565402 ) ) ( not ( = ?auto_1565399 ?auto_1565403 ) ) ( not ( = ?auto_1565399 ?auto_1565404 ) ) ( not ( = ?auto_1565399 ?auto_1565405 ) ) ( not ( = ?auto_1565399 ?auto_1565406 ) ) ( not ( = ?auto_1565399 ?auto_1565407 ) ) ( not ( = ?auto_1565399 ?auto_1565408 ) ) ( not ( = ?auto_1565399 ?auto_1565409 ) ) ( not ( = ?auto_1565399 ?auto_1565410 ) ) ( not ( = ?auto_1565399 ?auto_1565413 ) ) ( not ( = ?auto_1565399 ?auto_1565414 ) ) ( not ( = ?auto_1565400 ?auto_1565401 ) ) ( not ( = ?auto_1565400 ?auto_1565402 ) ) ( not ( = ?auto_1565400 ?auto_1565403 ) ) ( not ( = ?auto_1565400 ?auto_1565404 ) ) ( not ( = ?auto_1565400 ?auto_1565405 ) ) ( not ( = ?auto_1565400 ?auto_1565406 ) ) ( not ( = ?auto_1565400 ?auto_1565407 ) ) ( not ( = ?auto_1565400 ?auto_1565408 ) ) ( not ( = ?auto_1565400 ?auto_1565409 ) ) ( not ( = ?auto_1565400 ?auto_1565410 ) ) ( not ( = ?auto_1565400 ?auto_1565413 ) ) ( not ( = ?auto_1565400 ?auto_1565414 ) ) ( not ( = ?auto_1565401 ?auto_1565402 ) ) ( not ( = ?auto_1565401 ?auto_1565403 ) ) ( not ( = ?auto_1565401 ?auto_1565404 ) ) ( not ( = ?auto_1565401 ?auto_1565405 ) ) ( not ( = ?auto_1565401 ?auto_1565406 ) ) ( not ( = ?auto_1565401 ?auto_1565407 ) ) ( not ( = ?auto_1565401 ?auto_1565408 ) ) ( not ( = ?auto_1565401 ?auto_1565409 ) ) ( not ( = ?auto_1565401 ?auto_1565410 ) ) ( not ( = ?auto_1565401 ?auto_1565413 ) ) ( not ( = ?auto_1565401 ?auto_1565414 ) ) ( not ( = ?auto_1565402 ?auto_1565403 ) ) ( not ( = ?auto_1565402 ?auto_1565404 ) ) ( not ( = ?auto_1565402 ?auto_1565405 ) ) ( not ( = ?auto_1565402 ?auto_1565406 ) ) ( not ( = ?auto_1565402 ?auto_1565407 ) ) ( not ( = ?auto_1565402 ?auto_1565408 ) ) ( not ( = ?auto_1565402 ?auto_1565409 ) ) ( not ( = ?auto_1565402 ?auto_1565410 ) ) ( not ( = ?auto_1565402 ?auto_1565413 ) ) ( not ( = ?auto_1565402 ?auto_1565414 ) ) ( not ( = ?auto_1565403 ?auto_1565404 ) ) ( not ( = ?auto_1565403 ?auto_1565405 ) ) ( not ( = ?auto_1565403 ?auto_1565406 ) ) ( not ( = ?auto_1565403 ?auto_1565407 ) ) ( not ( = ?auto_1565403 ?auto_1565408 ) ) ( not ( = ?auto_1565403 ?auto_1565409 ) ) ( not ( = ?auto_1565403 ?auto_1565410 ) ) ( not ( = ?auto_1565403 ?auto_1565413 ) ) ( not ( = ?auto_1565403 ?auto_1565414 ) ) ( not ( = ?auto_1565404 ?auto_1565405 ) ) ( not ( = ?auto_1565404 ?auto_1565406 ) ) ( not ( = ?auto_1565404 ?auto_1565407 ) ) ( not ( = ?auto_1565404 ?auto_1565408 ) ) ( not ( = ?auto_1565404 ?auto_1565409 ) ) ( not ( = ?auto_1565404 ?auto_1565410 ) ) ( not ( = ?auto_1565404 ?auto_1565413 ) ) ( not ( = ?auto_1565404 ?auto_1565414 ) ) ( not ( = ?auto_1565405 ?auto_1565406 ) ) ( not ( = ?auto_1565405 ?auto_1565407 ) ) ( not ( = ?auto_1565405 ?auto_1565408 ) ) ( not ( = ?auto_1565405 ?auto_1565409 ) ) ( not ( = ?auto_1565405 ?auto_1565410 ) ) ( not ( = ?auto_1565405 ?auto_1565413 ) ) ( not ( = ?auto_1565405 ?auto_1565414 ) ) ( not ( = ?auto_1565406 ?auto_1565407 ) ) ( not ( = ?auto_1565406 ?auto_1565408 ) ) ( not ( = ?auto_1565406 ?auto_1565409 ) ) ( not ( = ?auto_1565406 ?auto_1565410 ) ) ( not ( = ?auto_1565406 ?auto_1565413 ) ) ( not ( = ?auto_1565406 ?auto_1565414 ) ) ( not ( = ?auto_1565407 ?auto_1565408 ) ) ( not ( = ?auto_1565407 ?auto_1565409 ) ) ( not ( = ?auto_1565407 ?auto_1565410 ) ) ( not ( = ?auto_1565407 ?auto_1565413 ) ) ( not ( = ?auto_1565407 ?auto_1565414 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565408 ?auto_1565409 ?auto_1565410 )
      ( MAKE-12CRATE-VERIFY ?auto_1565398 ?auto_1565399 ?auto_1565400 ?auto_1565401 ?auto_1565402 ?auto_1565403 ?auto_1565404 ?auto_1565405 ?auto_1565406 ?auto_1565407 ?auto_1565408 ?auto_1565409 ?auto_1565410 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1565418 - SURFACE
      ?auto_1565419 - SURFACE
      ?auto_1565420 - SURFACE
      ?auto_1565421 - SURFACE
      ?auto_1565422 - SURFACE
      ?auto_1565423 - SURFACE
      ?auto_1565424 - SURFACE
      ?auto_1565425 - SURFACE
      ?auto_1565426 - SURFACE
      ?auto_1565427 - SURFACE
      ?auto_1565428 - SURFACE
      ?auto_1565429 - SURFACE
      ?auto_1565430 - SURFACE
      ?auto_1565431 - SURFACE
    )
    :vars
    (
      ?auto_1565432 - HOIST
      ?auto_1565433 - PLACE
      ?auto_1565436 - PLACE
      ?auto_1565438 - HOIST
      ?auto_1565434 - SURFACE
      ?auto_1565435 - SURFACE
      ?auto_1565437 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565432 ?auto_1565433 ) ( IS-CRATE ?auto_1565431 ) ( not ( = ?auto_1565430 ?auto_1565431 ) ) ( not ( = ?auto_1565429 ?auto_1565430 ) ) ( not ( = ?auto_1565429 ?auto_1565431 ) ) ( not ( = ?auto_1565436 ?auto_1565433 ) ) ( HOIST-AT ?auto_1565438 ?auto_1565436 ) ( not ( = ?auto_1565432 ?auto_1565438 ) ) ( SURFACE-AT ?auto_1565431 ?auto_1565436 ) ( ON ?auto_1565431 ?auto_1565434 ) ( CLEAR ?auto_1565431 ) ( not ( = ?auto_1565430 ?auto_1565434 ) ) ( not ( = ?auto_1565431 ?auto_1565434 ) ) ( not ( = ?auto_1565429 ?auto_1565434 ) ) ( SURFACE-AT ?auto_1565429 ?auto_1565433 ) ( CLEAR ?auto_1565429 ) ( IS-CRATE ?auto_1565430 ) ( AVAILABLE ?auto_1565432 ) ( AVAILABLE ?auto_1565438 ) ( SURFACE-AT ?auto_1565430 ?auto_1565436 ) ( ON ?auto_1565430 ?auto_1565435 ) ( CLEAR ?auto_1565430 ) ( not ( = ?auto_1565430 ?auto_1565435 ) ) ( not ( = ?auto_1565431 ?auto_1565435 ) ) ( not ( = ?auto_1565429 ?auto_1565435 ) ) ( not ( = ?auto_1565434 ?auto_1565435 ) ) ( TRUCK-AT ?auto_1565437 ?auto_1565433 ) ( ON ?auto_1565419 ?auto_1565418 ) ( ON ?auto_1565420 ?auto_1565419 ) ( ON ?auto_1565421 ?auto_1565420 ) ( ON ?auto_1565422 ?auto_1565421 ) ( ON ?auto_1565423 ?auto_1565422 ) ( ON ?auto_1565424 ?auto_1565423 ) ( ON ?auto_1565425 ?auto_1565424 ) ( ON ?auto_1565426 ?auto_1565425 ) ( ON ?auto_1565427 ?auto_1565426 ) ( ON ?auto_1565428 ?auto_1565427 ) ( ON ?auto_1565429 ?auto_1565428 ) ( not ( = ?auto_1565418 ?auto_1565419 ) ) ( not ( = ?auto_1565418 ?auto_1565420 ) ) ( not ( = ?auto_1565418 ?auto_1565421 ) ) ( not ( = ?auto_1565418 ?auto_1565422 ) ) ( not ( = ?auto_1565418 ?auto_1565423 ) ) ( not ( = ?auto_1565418 ?auto_1565424 ) ) ( not ( = ?auto_1565418 ?auto_1565425 ) ) ( not ( = ?auto_1565418 ?auto_1565426 ) ) ( not ( = ?auto_1565418 ?auto_1565427 ) ) ( not ( = ?auto_1565418 ?auto_1565428 ) ) ( not ( = ?auto_1565418 ?auto_1565429 ) ) ( not ( = ?auto_1565418 ?auto_1565430 ) ) ( not ( = ?auto_1565418 ?auto_1565431 ) ) ( not ( = ?auto_1565418 ?auto_1565434 ) ) ( not ( = ?auto_1565418 ?auto_1565435 ) ) ( not ( = ?auto_1565419 ?auto_1565420 ) ) ( not ( = ?auto_1565419 ?auto_1565421 ) ) ( not ( = ?auto_1565419 ?auto_1565422 ) ) ( not ( = ?auto_1565419 ?auto_1565423 ) ) ( not ( = ?auto_1565419 ?auto_1565424 ) ) ( not ( = ?auto_1565419 ?auto_1565425 ) ) ( not ( = ?auto_1565419 ?auto_1565426 ) ) ( not ( = ?auto_1565419 ?auto_1565427 ) ) ( not ( = ?auto_1565419 ?auto_1565428 ) ) ( not ( = ?auto_1565419 ?auto_1565429 ) ) ( not ( = ?auto_1565419 ?auto_1565430 ) ) ( not ( = ?auto_1565419 ?auto_1565431 ) ) ( not ( = ?auto_1565419 ?auto_1565434 ) ) ( not ( = ?auto_1565419 ?auto_1565435 ) ) ( not ( = ?auto_1565420 ?auto_1565421 ) ) ( not ( = ?auto_1565420 ?auto_1565422 ) ) ( not ( = ?auto_1565420 ?auto_1565423 ) ) ( not ( = ?auto_1565420 ?auto_1565424 ) ) ( not ( = ?auto_1565420 ?auto_1565425 ) ) ( not ( = ?auto_1565420 ?auto_1565426 ) ) ( not ( = ?auto_1565420 ?auto_1565427 ) ) ( not ( = ?auto_1565420 ?auto_1565428 ) ) ( not ( = ?auto_1565420 ?auto_1565429 ) ) ( not ( = ?auto_1565420 ?auto_1565430 ) ) ( not ( = ?auto_1565420 ?auto_1565431 ) ) ( not ( = ?auto_1565420 ?auto_1565434 ) ) ( not ( = ?auto_1565420 ?auto_1565435 ) ) ( not ( = ?auto_1565421 ?auto_1565422 ) ) ( not ( = ?auto_1565421 ?auto_1565423 ) ) ( not ( = ?auto_1565421 ?auto_1565424 ) ) ( not ( = ?auto_1565421 ?auto_1565425 ) ) ( not ( = ?auto_1565421 ?auto_1565426 ) ) ( not ( = ?auto_1565421 ?auto_1565427 ) ) ( not ( = ?auto_1565421 ?auto_1565428 ) ) ( not ( = ?auto_1565421 ?auto_1565429 ) ) ( not ( = ?auto_1565421 ?auto_1565430 ) ) ( not ( = ?auto_1565421 ?auto_1565431 ) ) ( not ( = ?auto_1565421 ?auto_1565434 ) ) ( not ( = ?auto_1565421 ?auto_1565435 ) ) ( not ( = ?auto_1565422 ?auto_1565423 ) ) ( not ( = ?auto_1565422 ?auto_1565424 ) ) ( not ( = ?auto_1565422 ?auto_1565425 ) ) ( not ( = ?auto_1565422 ?auto_1565426 ) ) ( not ( = ?auto_1565422 ?auto_1565427 ) ) ( not ( = ?auto_1565422 ?auto_1565428 ) ) ( not ( = ?auto_1565422 ?auto_1565429 ) ) ( not ( = ?auto_1565422 ?auto_1565430 ) ) ( not ( = ?auto_1565422 ?auto_1565431 ) ) ( not ( = ?auto_1565422 ?auto_1565434 ) ) ( not ( = ?auto_1565422 ?auto_1565435 ) ) ( not ( = ?auto_1565423 ?auto_1565424 ) ) ( not ( = ?auto_1565423 ?auto_1565425 ) ) ( not ( = ?auto_1565423 ?auto_1565426 ) ) ( not ( = ?auto_1565423 ?auto_1565427 ) ) ( not ( = ?auto_1565423 ?auto_1565428 ) ) ( not ( = ?auto_1565423 ?auto_1565429 ) ) ( not ( = ?auto_1565423 ?auto_1565430 ) ) ( not ( = ?auto_1565423 ?auto_1565431 ) ) ( not ( = ?auto_1565423 ?auto_1565434 ) ) ( not ( = ?auto_1565423 ?auto_1565435 ) ) ( not ( = ?auto_1565424 ?auto_1565425 ) ) ( not ( = ?auto_1565424 ?auto_1565426 ) ) ( not ( = ?auto_1565424 ?auto_1565427 ) ) ( not ( = ?auto_1565424 ?auto_1565428 ) ) ( not ( = ?auto_1565424 ?auto_1565429 ) ) ( not ( = ?auto_1565424 ?auto_1565430 ) ) ( not ( = ?auto_1565424 ?auto_1565431 ) ) ( not ( = ?auto_1565424 ?auto_1565434 ) ) ( not ( = ?auto_1565424 ?auto_1565435 ) ) ( not ( = ?auto_1565425 ?auto_1565426 ) ) ( not ( = ?auto_1565425 ?auto_1565427 ) ) ( not ( = ?auto_1565425 ?auto_1565428 ) ) ( not ( = ?auto_1565425 ?auto_1565429 ) ) ( not ( = ?auto_1565425 ?auto_1565430 ) ) ( not ( = ?auto_1565425 ?auto_1565431 ) ) ( not ( = ?auto_1565425 ?auto_1565434 ) ) ( not ( = ?auto_1565425 ?auto_1565435 ) ) ( not ( = ?auto_1565426 ?auto_1565427 ) ) ( not ( = ?auto_1565426 ?auto_1565428 ) ) ( not ( = ?auto_1565426 ?auto_1565429 ) ) ( not ( = ?auto_1565426 ?auto_1565430 ) ) ( not ( = ?auto_1565426 ?auto_1565431 ) ) ( not ( = ?auto_1565426 ?auto_1565434 ) ) ( not ( = ?auto_1565426 ?auto_1565435 ) ) ( not ( = ?auto_1565427 ?auto_1565428 ) ) ( not ( = ?auto_1565427 ?auto_1565429 ) ) ( not ( = ?auto_1565427 ?auto_1565430 ) ) ( not ( = ?auto_1565427 ?auto_1565431 ) ) ( not ( = ?auto_1565427 ?auto_1565434 ) ) ( not ( = ?auto_1565427 ?auto_1565435 ) ) ( not ( = ?auto_1565428 ?auto_1565429 ) ) ( not ( = ?auto_1565428 ?auto_1565430 ) ) ( not ( = ?auto_1565428 ?auto_1565431 ) ) ( not ( = ?auto_1565428 ?auto_1565434 ) ) ( not ( = ?auto_1565428 ?auto_1565435 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565429 ?auto_1565430 ?auto_1565431 )
      ( MAKE-13CRATE-VERIFY ?auto_1565418 ?auto_1565419 ?auto_1565420 ?auto_1565421 ?auto_1565422 ?auto_1565423 ?auto_1565424 ?auto_1565425 ?auto_1565426 ?auto_1565427 ?auto_1565428 ?auto_1565429 ?auto_1565430 ?auto_1565431 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1565439 - SURFACE
      ?auto_1565440 - SURFACE
    )
    :vars
    (
      ?auto_1565441 - HOIST
      ?auto_1565442 - PLACE
      ?auto_1565448 - SURFACE
      ?auto_1565445 - PLACE
      ?auto_1565447 - HOIST
      ?auto_1565443 - SURFACE
      ?auto_1565444 - SURFACE
      ?auto_1565446 - TRUCK
      ?auto_1565449 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565441 ?auto_1565442 ) ( IS-CRATE ?auto_1565440 ) ( not ( = ?auto_1565439 ?auto_1565440 ) ) ( not ( = ?auto_1565448 ?auto_1565439 ) ) ( not ( = ?auto_1565448 ?auto_1565440 ) ) ( not ( = ?auto_1565445 ?auto_1565442 ) ) ( HOIST-AT ?auto_1565447 ?auto_1565445 ) ( not ( = ?auto_1565441 ?auto_1565447 ) ) ( SURFACE-AT ?auto_1565440 ?auto_1565445 ) ( ON ?auto_1565440 ?auto_1565443 ) ( CLEAR ?auto_1565440 ) ( not ( = ?auto_1565439 ?auto_1565443 ) ) ( not ( = ?auto_1565440 ?auto_1565443 ) ) ( not ( = ?auto_1565448 ?auto_1565443 ) ) ( IS-CRATE ?auto_1565439 ) ( AVAILABLE ?auto_1565447 ) ( SURFACE-AT ?auto_1565439 ?auto_1565445 ) ( ON ?auto_1565439 ?auto_1565444 ) ( CLEAR ?auto_1565439 ) ( not ( = ?auto_1565439 ?auto_1565444 ) ) ( not ( = ?auto_1565440 ?auto_1565444 ) ) ( not ( = ?auto_1565448 ?auto_1565444 ) ) ( not ( = ?auto_1565443 ?auto_1565444 ) ) ( TRUCK-AT ?auto_1565446 ?auto_1565442 ) ( SURFACE-AT ?auto_1565449 ?auto_1565442 ) ( CLEAR ?auto_1565449 ) ( LIFTING ?auto_1565441 ?auto_1565448 ) ( IS-CRATE ?auto_1565448 ) ( not ( = ?auto_1565449 ?auto_1565448 ) ) ( not ( = ?auto_1565439 ?auto_1565449 ) ) ( not ( = ?auto_1565440 ?auto_1565449 ) ) ( not ( = ?auto_1565443 ?auto_1565449 ) ) ( not ( = ?auto_1565444 ?auto_1565449 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1565449 ?auto_1565448 )
      ( MAKE-2CRATE ?auto_1565448 ?auto_1565439 ?auto_1565440 )
      ( MAKE-1CRATE-VERIFY ?auto_1565439 ?auto_1565440 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1565450 - SURFACE
      ?auto_1565451 - SURFACE
      ?auto_1565452 - SURFACE
    )
    :vars
    (
      ?auto_1565459 - HOIST
      ?auto_1565455 - PLACE
      ?auto_1565453 - PLACE
      ?auto_1565457 - HOIST
      ?auto_1565458 - SURFACE
      ?auto_1565456 - SURFACE
      ?auto_1565454 - TRUCK
      ?auto_1565460 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565459 ?auto_1565455 ) ( IS-CRATE ?auto_1565452 ) ( not ( = ?auto_1565451 ?auto_1565452 ) ) ( not ( = ?auto_1565450 ?auto_1565451 ) ) ( not ( = ?auto_1565450 ?auto_1565452 ) ) ( not ( = ?auto_1565453 ?auto_1565455 ) ) ( HOIST-AT ?auto_1565457 ?auto_1565453 ) ( not ( = ?auto_1565459 ?auto_1565457 ) ) ( SURFACE-AT ?auto_1565452 ?auto_1565453 ) ( ON ?auto_1565452 ?auto_1565458 ) ( CLEAR ?auto_1565452 ) ( not ( = ?auto_1565451 ?auto_1565458 ) ) ( not ( = ?auto_1565452 ?auto_1565458 ) ) ( not ( = ?auto_1565450 ?auto_1565458 ) ) ( IS-CRATE ?auto_1565451 ) ( AVAILABLE ?auto_1565457 ) ( SURFACE-AT ?auto_1565451 ?auto_1565453 ) ( ON ?auto_1565451 ?auto_1565456 ) ( CLEAR ?auto_1565451 ) ( not ( = ?auto_1565451 ?auto_1565456 ) ) ( not ( = ?auto_1565452 ?auto_1565456 ) ) ( not ( = ?auto_1565450 ?auto_1565456 ) ) ( not ( = ?auto_1565458 ?auto_1565456 ) ) ( TRUCK-AT ?auto_1565454 ?auto_1565455 ) ( SURFACE-AT ?auto_1565460 ?auto_1565455 ) ( CLEAR ?auto_1565460 ) ( LIFTING ?auto_1565459 ?auto_1565450 ) ( IS-CRATE ?auto_1565450 ) ( not ( = ?auto_1565460 ?auto_1565450 ) ) ( not ( = ?auto_1565451 ?auto_1565460 ) ) ( not ( = ?auto_1565452 ?auto_1565460 ) ) ( not ( = ?auto_1565458 ?auto_1565460 ) ) ( not ( = ?auto_1565456 ?auto_1565460 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1565451 ?auto_1565452 )
      ( MAKE-2CRATE-VERIFY ?auto_1565450 ?auto_1565451 ?auto_1565452 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1565461 - SURFACE
      ?auto_1565462 - SURFACE
      ?auto_1565463 - SURFACE
      ?auto_1565464 - SURFACE
    )
    :vars
    (
      ?auto_1565465 - HOIST
      ?auto_1565468 - PLACE
      ?auto_1565469 - PLACE
      ?auto_1565467 - HOIST
      ?auto_1565470 - SURFACE
      ?auto_1565466 - SURFACE
      ?auto_1565471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565465 ?auto_1565468 ) ( IS-CRATE ?auto_1565464 ) ( not ( = ?auto_1565463 ?auto_1565464 ) ) ( not ( = ?auto_1565462 ?auto_1565463 ) ) ( not ( = ?auto_1565462 ?auto_1565464 ) ) ( not ( = ?auto_1565469 ?auto_1565468 ) ) ( HOIST-AT ?auto_1565467 ?auto_1565469 ) ( not ( = ?auto_1565465 ?auto_1565467 ) ) ( SURFACE-AT ?auto_1565464 ?auto_1565469 ) ( ON ?auto_1565464 ?auto_1565470 ) ( CLEAR ?auto_1565464 ) ( not ( = ?auto_1565463 ?auto_1565470 ) ) ( not ( = ?auto_1565464 ?auto_1565470 ) ) ( not ( = ?auto_1565462 ?auto_1565470 ) ) ( IS-CRATE ?auto_1565463 ) ( AVAILABLE ?auto_1565467 ) ( SURFACE-AT ?auto_1565463 ?auto_1565469 ) ( ON ?auto_1565463 ?auto_1565466 ) ( CLEAR ?auto_1565463 ) ( not ( = ?auto_1565463 ?auto_1565466 ) ) ( not ( = ?auto_1565464 ?auto_1565466 ) ) ( not ( = ?auto_1565462 ?auto_1565466 ) ) ( not ( = ?auto_1565470 ?auto_1565466 ) ) ( TRUCK-AT ?auto_1565471 ?auto_1565468 ) ( SURFACE-AT ?auto_1565461 ?auto_1565468 ) ( CLEAR ?auto_1565461 ) ( LIFTING ?auto_1565465 ?auto_1565462 ) ( IS-CRATE ?auto_1565462 ) ( not ( = ?auto_1565461 ?auto_1565462 ) ) ( not ( = ?auto_1565463 ?auto_1565461 ) ) ( not ( = ?auto_1565464 ?auto_1565461 ) ) ( not ( = ?auto_1565470 ?auto_1565461 ) ) ( not ( = ?auto_1565466 ?auto_1565461 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565462 ?auto_1565463 ?auto_1565464 )
      ( MAKE-3CRATE-VERIFY ?auto_1565461 ?auto_1565462 ?auto_1565463 ?auto_1565464 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1565472 - SURFACE
      ?auto_1565473 - SURFACE
      ?auto_1565474 - SURFACE
      ?auto_1565475 - SURFACE
      ?auto_1565476 - SURFACE
    )
    :vars
    (
      ?auto_1565477 - HOIST
      ?auto_1565480 - PLACE
      ?auto_1565481 - PLACE
      ?auto_1565479 - HOIST
      ?auto_1565482 - SURFACE
      ?auto_1565478 - SURFACE
      ?auto_1565483 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565477 ?auto_1565480 ) ( IS-CRATE ?auto_1565476 ) ( not ( = ?auto_1565475 ?auto_1565476 ) ) ( not ( = ?auto_1565474 ?auto_1565475 ) ) ( not ( = ?auto_1565474 ?auto_1565476 ) ) ( not ( = ?auto_1565481 ?auto_1565480 ) ) ( HOIST-AT ?auto_1565479 ?auto_1565481 ) ( not ( = ?auto_1565477 ?auto_1565479 ) ) ( SURFACE-AT ?auto_1565476 ?auto_1565481 ) ( ON ?auto_1565476 ?auto_1565482 ) ( CLEAR ?auto_1565476 ) ( not ( = ?auto_1565475 ?auto_1565482 ) ) ( not ( = ?auto_1565476 ?auto_1565482 ) ) ( not ( = ?auto_1565474 ?auto_1565482 ) ) ( IS-CRATE ?auto_1565475 ) ( AVAILABLE ?auto_1565479 ) ( SURFACE-AT ?auto_1565475 ?auto_1565481 ) ( ON ?auto_1565475 ?auto_1565478 ) ( CLEAR ?auto_1565475 ) ( not ( = ?auto_1565475 ?auto_1565478 ) ) ( not ( = ?auto_1565476 ?auto_1565478 ) ) ( not ( = ?auto_1565474 ?auto_1565478 ) ) ( not ( = ?auto_1565482 ?auto_1565478 ) ) ( TRUCK-AT ?auto_1565483 ?auto_1565480 ) ( SURFACE-AT ?auto_1565473 ?auto_1565480 ) ( CLEAR ?auto_1565473 ) ( LIFTING ?auto_1565477 ?auto_1565474 ) ( IS-CRATE ?auto_1565474 ) ( not ( = ?auto_1565473 ?auto_1565474 ) ) ( not ( = ?auto_1565475 ?auto_1565473 ) ) ( not ( = ?auto_1565476 ?auto_1565473 ) ) ( not ( = ?auto_1565482 ?auto_1565473 ) ) ( not ( = ?auto_1565478 ?auto_1565473 ) ) ( ON ?auto_1565473 ?auto_1565472 ) ( not ( = ?auto_1565472 ?auto_1565473 ) ) ( not ( = ?auto_1565472 ?auto_1565474 ) ) ( not ( = ?auto_1565472 ?auto_1565475 ) ) ( not ( = ?auto_1565472 ?auto_1565476 ) ) ( not ( = ?auto_1565472 ?auto_1565482 ) ) ( not ( = ?auto_1565472 ?auto_1565478 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565474 ?auto_1565475 ?auto_1565476 )
      ( MAKE-4CRATE-VERIFY ?auto_1565472 ?auto_1565473 ?auto_1565474 ?auto_1565475 ?auto_1565476 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1565484 - SURFACE
      ?auto_1565485 - SURFACE
      ?auto_1565486 - SURFACE
      ?auto_1565487 - SURFACE
      ?auto_1565488 - SURFACE
      ?auto_1565489 - SURFACE
    )
    :vars
    (
      ?auto_1565490 - HOIST
      ?auto_1565493 - PLACE
      ?auto_1565494 - PLACE
      ?auto_1565492 - HOIST
      ?auto_1565495 - SURFACE
      ?auto_1565491 - SURFACE
      ?auto_1565496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565490 ?auto_1565493 ) ( IS-CRATE ?auto_1565489 ) ( not ( = ?auto_1565488 ?auto_1565489 ) ) ( not ( = ?auto_1565487 ?auto_1565488 ) ) ( not ( = ?auto_1565487 ?auto_1565489 ) ) ( not ( = ?auto_1565494 ?auto_1565493 ) ) ( HOIST-AT ?auto_1565492 ?auto_1565494 ) ( not ( = ?auto_1565490 ?auto_1565492 ) ) ( SURFACE-AT ?auto_1565489 ?auto_1565494 ) ( ON ?auto_1565489 ?auto_1565495 ) ( CLEAR ?auto_1565489 ) ( not ( = ?auto_1565488 ?auto_1565495 ) ) ( not ( = ?auto_1565489 ?auto_1565495 ) ) ( not ( = ?auto_1565487 ?auto_1565495 ) ) ( IS-CRATE ?auto_1565488 ) ( AVAILABLE ?auto_1565492 ) ( SURFACE-AT ?auto_1565488 ?auto_1565494 ) ( ON ?auto_1565488 ?auto_1565491 ) ( CLEAR ?auto_1565488 ) ( not ( = ?auto_1565488 ?auto_1565491 ) ) ( not ( = ?auto_1565489 ?auto_1565491 ) ) ( not ( = ?auto_1565487 ?auto_1565491 ) ) ( not ( = ?auto_1565495 ?auto_1565491 ) ) ( TRUCK-AT ?auto_1565496 ?auto_1565493 ) ( SURFACE-AT ?auto_1565486 ?auto_1565493 ) ( CLEAR ?auto_1565486 ) ( LIFTING ?auto_1565490 ?auto_1565487 ) ( IS-CRATE ?auto_1565487 ) ( not ( = ?auto_1565486 ?auto_1565487 ) ) ( not ( = ?auto_1565488 ?auto_1565486 ) ) ( not ( = ?auto_1565489 ?auto_1565486 ) ) ( not ( = ?auto_1565495 ?auto_1565486 ) ) ( not ( = ?auto_1565491 ?auto_1565486 ) ) ( ON ?auto_1565485 ?auto_1565484 ) ( ON ?auto_1565486 ?auto_1565485 ) ( not ( = ?auto_1565484 ?auto_1565485 ) ) ( not ( = ?auto_1565484 ?auto_1565486 ) ) ( not ( = ?auto_1565484 ?auto_1565487 ) ) ( not ( = ?auto_1565484 ?auto_1565488 ) ) ( not ( = ?auto_1565484 ?auto_1565489 ) ) ( not ( = ?auto_1565484 ?auto_1565495 ) ) ( not ( = ?auto_1565484 ?auto_1565491 ) ) ( not ( = ?auto_1565485 ?auto_1565486 ) ) ( not ( = ?auto_1565485 ?auto_1565487 ) ) ( not ( = ?auto_1565485 ?auto_1565488 ) ) ( not ( = ?auto_1565485 ?auto_1565489 ) ) ( not ( = ?auto_1565485 ?auto_1565495 ) ) ( not ( = ?auto_1565485 ?auto_1565491 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565487 ?auto_1565488 ?auto_1565489 )
      ( MAKE-5CRATE-VERIFY ?auto_1565484 ?auto_1565485 ?auto_1565486 ?auto_1565487 ?auto_1565488 ?auto_1565489 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1565497 - SURFACE
      ?auto_1565498 - SURFACE
      ?auto_1565499 - SURFACE
      ?auto_1565500 - SURFACE
      ?auto_1565501 - SURFACE
      ?auto_1565502 - SURFACE
      ?auto_1565503 - SURFACE
    )
    :vars
    (
      ?auto_1565504 - HOIST
      ?auto_1565507 - PLACE
      ?auto_1565508 - PLACE
      ?auto_1565506 - HOIST
      ?auto_1565509 - SURFACE
      ?auto_1565505 - SURFACE
      ?auto_1565510 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565504 ?auto_1565507 ) ( IS-CRATE ?auto_1565503 ) ( not ( = ?auto_1565502 ?auto_1565503 ) ) ( not ( = ?auto_1565501 ?auto_1565502 ) ) ( not ( = ?auto_1565501 ?auto_1565503 ) ) ( not ( = ?auto_1565508 ?auto_1565507 ) ) ( HOIST-AT ?auto_1565506 ?auto_1565508 ) ( not ( = ?auto_1565504 ?auto_1565506 ) ) ( SURFACE-AT ?auto_1565503 ?auto_1565508 ) ( ON ?auto_1565503 ?auto_1565509 ) ( CLEAR ?auto_1565503 ) ( not ( = ?auto_1565502 ?auto_1565509 ) ) ( not ( = ?auto_1565503 ?auto_1565509 ) ) ( not ( = ?auto_1565501 ?auto_1565509 ) ) ( IS-CRATE ?auto_1565502 ) ( AVAILABLE ?auto_1565506 ) ( SURFACE-AT ?auto_1565502 ?auto_1565508 ) ( ON ?auto_1565502 ?auto_1565505 ) ( CLEAR ?auto_1565502 ) ( not ( = ?auto_1565502 ?auto_1565505 ) ) ( not ( = ?auto_1565503 ?auto_1565505 ) ) ( not ( = ?auto_1565501 ?auto_1565505 ) ) ( not ( = ?auto_1565509 ?auto_1565505 ) ) ( TRUCK-AT ?auto_1565510 ?auto_1565507 ) ( SURFACE-AT ?auto_1565500 ?auto_1565507 ) ( CLEAR ?auto_1565500 ) ( LIFTING ?auto_1565504 ?auto_1565501 ) ( IS-CRATE ?auto_1565501 ) ( not ( = ?auto_1565500 ?auto_1565501 ) ) ( not ( = ?auto_1565502 ?auto_1565500 ) ) ( not ( = ?auto_1565503 ?auto_1565500 ) ) ( not ( = ?auto_1565509 ?auto_1565500 ) ) ( not ( = ?auto_1565505 ?auto_1565500 ) ) ( ON ?auto_1565498 ?auto_1565497 ) ( ON ?auto_1565499 ?auto_1565498 ) ( ON ?auto_1565500 ?auto_1565499 ) ( not ( = ?auto_1565497 ?auto_1565498 ) ) ( not ( = ?auto_1565497 ?auto_1565499 ) ) ( not ( = ?auto_1565497 ?auto_1565500 ) ) ( not ( = ?auto_1565497 ?auto_1565501 ) ) ( not ( = ?auto_1565497 ?auto_1565502 ) ) ( not ( = ?auto_1565497 ?auto_1565503 ) ) ( not ( = ?auto_1565497 ?auto_1565509 ) ) ( not ( = ?auto_1565497 ?auto_1565505 ) ) ( not ( = ?auto_1565498 ?auto_1565499 ) ) ( not ( = ?auto_1565498 ?auto_1565500 ) ) ( not ( = ?auto_1565498 ?auto_1565501 ) ) ( not ( = ?auto_1565498 ?auto_1565502 ) ) ( not ( = ?auto_1565498 ?auto_1565503 ) ) ( not ( = ?auto_1565498 ?auto_1565509 ) ) ( not ( = ?auto_1565498 ?auto_1565505 ) ) ( not ( = ?auto_1565499 ?auto_1565500 ) ) ( not ( = ?auto_1565499 ?auto_1565501 ) ) ( not ( = ?auto_1565499 ?auto_1565502 ) ) ( not ( = ?auto_1565499 ?auto_1565503 ) ) ( not ( = ?auto_1565499 ?auto_1565509 ) ) ( not ( = ?auto_1565499 ?auto_1565505 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565501 ?auto_1565502 ?auto_1565503 )
      ( MAKE-6CRATE-VERIFY ?auto_1565497 ?auto_1565498 ?auto_1565499 ?auto_1565500 ?auto_1565501 ?auto_1565502 ?auto_1565503 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1565511 - SURFACE
      ?auto_1565512 - SURFACE
      ?auto_1565513 - SURFACE
      ?auto_1565514 - SURFACE
      ?auto_1565515 - SURFACE
      ?auto_1565516 - SURFACE
      ?auto_1565517 - SURFACE
      ?auto_1565518 - SURFACE
    )
    :vars
    (
      ?auto_1565519 - HOIST
      ?auto_1565522 - PLACE
      ?auto_1565523 - PLACE
      ?auto_1565521 - HOIST
      ?auto_1565524 - SURFACE
      ?auto_1565520 - SURFACE
      ?auto_1565525 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565519 ?auto_1565522 ) ( IS-CRATE ?auto_1565518 ) ( not ( = ?auto_1565517 ?auto_1565518 ) ) ( not ( = ?auto_1565516 ?auto_1565517 ) ) ( not ( = ?auto_1565516 ?auto_1565518 ) ) ( not ( = ?auto_1565523 ?auto_1565522 ) ) ( HOIST-AT ?auto_1565521 ?auto_1565523 ) ( not ( = ?auto_1565519 ?auto_1565521 ) ) ( SURFACE-AT ?auto_1565518 ?auto_1565523 ) ( ON ?auto_1565518 ?auto_1565524 ) ( CLEAR ?auto_1565518 ) ( not ( = ?auto_1565517 ?auto_1565524 ) ) ( not ( = ?auto_1565518 ?auto_1565524 ) ) ( not ( = ?auto_1565516 ?auto_1565524 ) ) ( IS-CRATE ?auto_1565517 ) ( AVAILABLE ?auto_1565521 ) ( SURFACE-AT ?auto_1565517 ?auto_1565523 ) ( ON ?auto_1565517 ?auto_1565520 ) ( CLEAR ?auto_1565517 ) ( not ( = ?auto_1565517 ?auto_1565520 ) ) ( not ( = ?auto_1565518 ?auto_1565520 ) ) ( not ( = ?auto_1565516 ?auto_1565520 ) ) ( not ( = ?auto_1565524 ?auto_1565520 ) ) ( TRUCK-AT ?auto_1565525 ?auto_1565522 ) ( SURFACE-AT ?auto_1565515 ?auto_1565522 ) ( CLEAR ?auto_1565515 ) ( LIFTING ?auto_1565519 ?auto_1565516 ) ( IS-CRATE ?auto_1565516 ) ( not ( = ?auto_1565515 ?auto_1565516 ) ) ( not ( = ?auto_1565517 ?auto_1565515 ) ) ( not ( = ?auto_1565518 ?auto_1565515 ) ) ( not ( = ?auto_1565524 ?auto_1565515 ) ) ( not ( = ?auto_1565520 ?auto_1565515 ) ) ( ON ?auto_1565512 ?auto_1565511 ) ( ON ?auto_1565513 ?auto_1565512 ) ( ON ?auto_1565514 ?auto_1565513 ) ( ON ?auto_1565515 ?auto_1565514 ) ( not ( = ?auto_1565511 ?auto_1565512 ) ) ( not ( = ?auto_1565511 ?auto_1565513 ) ) ( not ( = ?auto_1565511 ?auto_1565514 ) ) ( not ( = ?auto_1565511 ?auto_1565515 ) ) ( not ( = ?auto_1565511 ?auto_1565516 ) ) ( not ( = ?auto_1565511 ?auto_1565517 ) ) ( not ( = ?auto_1565511 ?auto_1565518 ) ) ( not ( = ?auto_1565511 ?auto_1565524 ) ) ( not ( = ?auto_1565511 ?auto_1565520 ) ) ( not ( = ?auto_1565512 ?auto_1565513 ) ) ( not ( = ?auto_1565512 ?auto_1565514 ) ) ( not ( = ?auto_1565512 ?auto_1565515 ) ) ( not ( = ?auto_1565512 ?auto_1565516 ) ) ( not ( = ?auto_1565512 ?auto_1565517 ) ) ( not ( = ?auto_1565512 ?auto_1565518 ) ) ( not ( = ?auto_1565512 ?auto_1565524 ) ) ( not ( = ?auto_1565512 ?auto_1565520 ) ) ( not ( = ?auto_1565513 ?auto_1565514 ) ) ( not ( = ?auto_1565513 ?auto_1565515 ) ) ( not ( = ?auto_1565513 ?auto_1565516 ) ) ( not ( = ?auto_1565513 ?auto_1565517 ) ) ( not ( = ?auto_1565513 ?auto_1565518 ) ) ( not ( = ?auto_1565513 ?auto_1565524 ) ) ( not ( = ?auto_1565513 ?auto_1565520 ) ) ( not ( = ?auto_1565514 ?auto_1565515 ) ) ( not ( = ?auto_1565514 ?auto_1565516 ) ) ( not ( = ?auto_1565514 ?auto_1565517 ) ) ( not ( = ?auto_1565514 ?auto_1565518 ) ) ( not ( = ?auto_1565514 ?auto_1565524 ) ) ( not ( = ?auto_1565514 ?auto_1565520 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565516 ?auto_1565517 ?auto_1565518 )
      ( MAKE-7CRATE-VERIFY ?auto_1565511 ?auto_1565512 ?auto_1565513 ?auto_1565514 ?auto_1565515 ?auto_1565516 ?auto_1565517 ?auto_1565518 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1565526 - SURFACE
      ?auto_1565527 - SURFACE
      ?auto_1565528 - SURFACE
      ?auto_1565529 - SURFACE
      ?auto_1565530 - SURFACE
      ?auto_1565531 - SURFACE
      ?auto_1565532 - SURFACE
      ?auto_1565533 - SURFACE
      ?auto_1565534 - SURFACE
    )
    :vars
    (
      ?auto_1565535 - HOIST
      ?auto_1565538 - PLACE
      ?auto_1565539 - PLACE
      ?auto_1565537 - HOIST
      ?auto_1565540 - SURFACE
      ?auto_1565536 - SURFACE
      ?auto_1565541 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565535 ?auto_1565538 ) ( IS-CRATE ?auto_1565534 ) ( not ( = ?auto_1565533 ?auto_1565534 ) ) ( not ( = ?auto_1565532 ?auto_1565533 ) ) ( not ( = ?auto_1565532 ?auto_1565534 ) ) ( not ( = ?auto_1565539 ?auto_1565538 ) ) ( HOIST-AT ?auto_1565537 ?auto_1565539 ) ( not ( = ?auto_1565535 ?auto_1565537 ) ) ( SURFACE-AT ?auto_1565534 ?auto_1565539 ) ( ON ?auto_1565534 ?auto_1565540 ) ( CLEAR ?auto_1565534 ) ( not ( = ?auto_1565533 ?auto_1565540 ) ) ( not ( = ?auto_1565534 ?auto_1565540 ) ) ( not ( = ?auto_1565532 ?auto_1565540 ) ) ( IS-CRATE ?auto_1565533 ) ( AVAILABLE ?auto_1565537 ) ( SURFACE-AT ?auto_1565533 ?auto_1565539 ) ( ON ?auto_1565533 ?auto_1565536 ) ( CLEAR ?auto_1565533 ) ( not ( = ?auto_1565533 ?auto_1565536 ) ) ( not ( = ?auto_1565534 ?auto_1565536 ) ) ( not ( = ?auto_1565532 ?auto_1565536 ) ) ( not ( = ?auto_1565540 ?auto_1565536 ) ) ( TRUCK-AT ?auto_1565541 ?auto_1565538 ) ( SURFACE-AT ?auto_1565531 ?auto_1565538 ) ( CLEAR ?auto_1565531 ) ( LIFTING ?auto_1565535 ?auto_1565532 ) ( IS-CRATE ?auto_1565532 ) ( not ( = ?auto_1565531 ?auto_1565532 ) ) ( not ( = ?auto_1565533 ?auto_1565531 ) ) ( not ( = ?auto_1565534 ?auto_1565531 ) ) ( not ( = ?auto_1565540 ?auto_1565531 ) ) ( not ( = ?auto_1565536 ?auto_1565531 ) ) ( ON ?auto_1565527 ?auto_1565526 ) ( ON ?auto_1565528 ?auto_1565527 ) ( ON ?auto_1565529 ?auto_1565528 ) ( ON ?auto_1565530 ?auto_1565529 ) ( ON ?auto_1565531 ?auto_1565530 ) ( not ( = ?auto_1565526 ?auto_1565527 ) ) ( not ( = ?auto_1565526 ?auto_1565528 ) ) ( not ( = ?auto_1565526 ?auto_1565529 ) ) ( not ( = ?auto_1565526 ?auto_1565530 ) ) ( not ( = ?auto_1565526 ?auto_1565531 ) ) ( not ( = ?auto_1565526 ?auto_1565532 ) ) ( not ( = ?auto_1565526 ?auto_1565533 ) ) ( not ( = ?auto_1565526 ?auto_1565534 ) ) ( not ( = ?auto_1565526 ?auto_1565540 ) ) ( not ( = ?auto_1565526 ?auto_1565536 ) ) ( not ( = ?auto_1565527 ?auto_1565528 ) ) ( not ( = ?auto_1565527 ?auto_1565529 ) ) ( not ( = ?auto_1565527 ?auto_1565530 ) ) ( not ( = ?auto_1565527 ?auto_1565531 ) ) ( not ( = ?auto_1565527 ?auto_1565532 ) ) ( not ( = ?auto_1565527 ?auto_1565533 ) ) ( not ( = ?auto_1565527 ?auto_1565534 ) ) ( not ( = ?auto_1565527 ?auto_1565540 ) ) ( not ( = ?auto_1565527 ?auto_1565536 ) ) ( not ( = ?auto_1565528 ?auto_1565529 ) ) ( not ( = ?auto_1565528 ?auto_1565530 ) ) ( not ( = ?auto_1565528 ?auto_1565531 ) ) ( not ( = ?auto_1565528 ?auto_1565532 ) ) ( not ( = ?auto_1565528 ?auto_1565533 ) ) ( not ( = ?auto_1565528 ?auto_1565534 ) ) ( not ( = ?auto_1565528 ?auto_1565540 ) ) ( not ( = ?auto_1565528 ?auto_1565536 ) ) ( not ( = ?auto_1565529 ?auto_1565530 ) ) ( not ( = ?auto_1565529 ?auto_1565531 ) ) ( not ( = ?auto_1565529 ?auto_1565532 ) ) ( not ( = ?auto_1565529 ?auto_1565533 ) ) ( not ( = ?auto_1565529 ?auto_1565534 ) ) ( not ( = ?auto_1565529 ?auto_1565540 ) ) ( not ( = ?auto_1565529 ?auto_1565536 ) ) ( not ( = ?auto_1565530 ?auto_1565531 ) ) ( not ( = ?auto_1565530 ?auto_1565532 ) ) ( not ( = ?auto_1565530 ?auto_1565533 ) ) ( not ( = ?auto_1565530 ?auto_1565534 ) ) ( not ( = ?auto_1565530 ?auto_1565540 ) ) ( not ( = ?auto_1565530 ?auto_1565536 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565532 ?auto_1565533 ?auto_1565534 )
      ( MAKE-8CRATE-VERIFY ?auto_1565526 ?auto_1565527 ?auto_1565528 ?auto_1565529 ?auto_1565530 ?auto_1565531 ?auto_1565532 ?auto_1565533 ?auto_1565534 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1565542 - SURFACE
      ?auto_1565543 - SURFACE
      ?auto_1565544 - SURFACE
      ?auto_1565545 - SURFACE
      ?auto_1565546 - SURFACE
      ?auto_1565547 - SURFACE
      ?auto_1565548 - SURFACE
      ?auto_1565549 - SURFACE
      ?auto_1565550 - SURFACE
      ?auto_1565551 - SURFACE
    )
    :vars
    (
      ?auto_1565552 - HOIST
      ?auto_1565555 - PLACE
      ?auto_1565556 - PLACE
      ?auto_1565554 - HOIST
      ?auto_1565557 - SURFACE
      ?auto_1565553 - SURFACE
      ?auto_1565558 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565552 ?auto_1565555 ) ( IS-CRATE ?auto_1565551 ) ( not ( = ?auto_1565550 ?auto_1565551 ) ) ( not ( = ?auto_1565549 ?auto_1565550 ) ) ( not ( = ?auto_1565549 ?auto_1565551 ) ) ( not ( = ?auto_1565556 ?auto_1565555 ) ) ( HOIST-AT ?auto_1565554 ?auto_1565556 ) ( not ( = ?auto_1565552 ?auto_1565554 ) ) ( SURFACE-AT ?auto_1565551 ?auto_1565556 ) ( ON ?auto_1565551 ?auto_1565557 ) ( CLEAR ?auto_1565551 ) ( not ( = ?auto_1565550 ?auto_1565557 ) ) ( not ( = ?auto_1565551 ?auto_1565557 ) ) ( not ( = ?auto_1565549 ?auto_1565557 ) ) ( IS-CRATE ?auto_1565550 ) ( AVAILABLE ?auto_1565554 ) ( SURFACE-AT ?auto_1565550 ?auto_1565556 ) ( ON ?auto_1565550 ?auto_1565553 ) ( CLEAR ?auto_1565550 ) ( not ( = ?auto_1565550 ?auto_1565553 ) ) ( not ( = ?auto_1565551 ?auto_1565553 ) ) ( not ( = ?auto_1565549 ?auto_1565553 ) ) ( not ( = ?auto_1565557 ?auto_1565553 ) ) ( TRUCK-AT ?auto_1565558 ?auto_1565555 ) ( SURFACE-AT ?auto_1565548 ?auto_1565555 ) ( CLEAR ?auto_1565548 ) ( LIFTING ?auto_1565552 ?auto_1565549 ) ( IS-CRATE ?auto_1565549 ) ( not ( = ?auto_1565548 ?auto_1565549 ) ) ( not ( = ?auto_1565550 ?auto_1565548 ) ) ( not ( = ?auto_1565551 ?auto_1565548 ) ) ( not ( = ?auto_1565557 ?auto_1565548 ) ) ( not ( = ?auto_1565553 ?auto_1565548 ) ) ( ON ?auto_1565543 ?auto_1565542 ) ( ON ?auto_1565544 ?auto_1565543 ) ( ON ?auto_1565545 ?auto_1565544 ) ( ON ?auto_1565546 ?auto_1565545 ) ( ON ?auto_1565547 ?auto_1565546 ) ( ON ?auto_1565548 ?auto_1565547 ) ( not ( = ?auto_1565542 ?auto_1565543 ) ) ( not ( = ?auto_1565542 ?auto_1565544 ) ) ( not ( = ?auto_1565542 ?auto_1565545 ) ) ( not ( = ?auto_1565542 ?auto_1565546 ) ) ( not ( = ?auto_1565542 ?auto_1565547 ) ) ( not ( = ?auto_1565542 ?auto_1565548 ) ) ( not ( = ?auto_1565542 ?auto_1565549 ) ) ( not ( = ?auto_1565542 ?auto_1565550 ) ) ( not ( = ?auto_1565542 ?auto_1565551 ) ) ( not ( = ?auto_1565542 ?auto_1565557 ) ) ( not ( = ?auto_1565542 ?auto_1565553 ) ) ( not ( = ?auto_1565543 ?auto_1565544 ) ) ( not ( = ?auto_1565543 ?auto_1565545 ) ) ( not ( = ?auto_1565543 ?auto_1565546 ) ) ( not ( = ?auto_1565543 ?auto_1565547 ) ) ( not ( = ?auto_1565543 ?auto_1565548 ) ) ( not ( = ?auto_1565543 ?auto_1565549 ) ) ( not ( = ?auto_1565543 ?auto_1565550 ) ) ( not ( = ?auto_1565543 ?auto_1565551 ) ) ( not ( = ?auto_1565543 ?auto_1565557 ) ) ( not ( = ?auto_1565543 ?auto_1565553 ) ) ( not ( = ?auto_1565544 ?auto_1565545 ) ) ( not ( = ?auto_1565544 ?auto_1565546 ) ) ( not ( = ?auto_1565544 ?auto_1565547 ) ) ( not ( = ?auto_1565544 ?auto_1565548 ) ) ( not ( = ?auto_1565544 ?auto_1565549 ) ) ( not ( = ?auto_1565544 ?auto_1565550 ) ) ( not ( = ?auto_1565544 ?auto_1565551 ) ) ( not ( = ?auto_1565544 ?auto_1565557 ) ) ( not ( = ?auto_1565544 ?auto_1565553 ) ) ( not ( = ?auto_1565545 ?auto_1565546 ) ) ( not ( = ?auto_1565545 ?auto_1565547 ) ) ( not ( = ?auto_1565545 ?auto_1565548 ) ) ( not ( = ?auto_1565545 ?auto_1565549 ) ) ( not ( = ?auto_1565545 ?auto_1565550 ) ) ( not ( = ?auto_1565545 ?auto_1565551 ) ) ( not ( = ?auto_1565545 ?auto_1565557 ) ) ( not ( = ?auto_1565545 ?auto_1565553 ) ) ( not ( = ?auto_1565546 ?auto_1565547 ) ) ( not ( = ?auto_1565546 ?auto_1565548 ) ) ( not ( = ?auto_1565546 ?auto_1565549 ) ) ( not ( = ?auto_1565546 ?auto_1565550 ) ) ( not ( = ?auto_1565546 ?auto_1565551 ) ) ( not ( = ?auto_1565546 ?auto_1565557 ) ) ( not ( = ?auto_1565546 ?auto_1565553 ) ) ( not ( = ?auto_1565547 ?auto_1565548 ) ) ( not ( = ?auto_1565547 ?auto_1565549 ) ) ( not ( = ?auto_1565547 ?auto_1565550 ) ) ( not ( = ?auto_1565547 ?auto_1565551 ) ) ( not ( = ?auto_1565547 ?auto_1565557 ) ) ( not ( = ?auto_1565547 ?auto_1565553 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565549 ?auto_1565550 ?auto_1565551 )
      ( MAKE-9CRATE-VERIFY ?auto_1565542 ?auto_1565543 ?auto_1565544 ?auto_1565545 ?auto_1565546 ?auto_1565547 ?auto_1565548 ?auto_1565549 ?auto_1565550 ?auto_1565551 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1565559 - SURFACE
      ?auto_1565560 - SURFACE
      ?auto_1565561 - SURFACE
      ?auto_1565562 - SURFACE
      ?auto_1565563 - SURFACE
      ?auto_1565564 - SURFACE
      ?auto_1565565 - SURFACE
      ?auto_1565566 - SURFACE
      ?auto_1565567 - SURFACE
      ?auto_1565568 - SURFACE
      ?auto_1565569 - SURFACE
    )
    :vars
    (
      ?auto_1565570 - HOIST
      ?auto_1565573 - PLACE
      ?auto_1565574 - PLACE
      ?auto_1565572 - HOIST
      ?auto_1565575 - SURFACE
      ?auto_1565571 - SURFACE
      ?auto_1565576 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565570 ?auto_1565573 ) ( IS-CRATE ?auto_1565569 ) ( not ( = ?auto_1565568 ?auto_1565569 ) ) ( not ( = ?auto_1565567 ?auto_1565568 ) ) ( not ( = ?auto_1565567 ?auto_1565569 ) ) ( not ( = ?auto_1565574 ?auto_1565573 ) ) ( HOIST-AT ?auto_1565572 ?auto_1565574 ) ( not ( = ?auto_1565570 ?auto_1565572 ) ) ( SURFACE-AT ?auto_1565569 ?auto_1565574 ) ( ON ?auto_1565569 ?auto_1565575 ) ( CLEAR ?auto_1565569 ) ( not ( = ?auto_1565568 ?auto_1565575 ) ) ( not ( = ?auto_1565569 ?auto_1565575 ) ) ( not ( = ?auto_1565567 ?auto_1565575 ) ) ( IS-CRATE ?auto_1565568 ) ( AVAILABLE ?auto_1565572 ) ( SURFACE-AT ?auto_1565568 ?auto_1565574 ) ( ON ?auto_1565568 ?auto_1565571 ) ( CLEAR ?auto_1565568 ) ( not ( = ?auto_1565568 ?auto_1565571 ) ) ( not ( = ?auto_1565569 ?auto_1565571 ) ) ( not ( = ?auto_1565567 ?auto_1565571 ) ) ( not ( = ?auto_1565575 ?auto_1565571 ) ) ( TRUCK-AT ?auto_1565576 ?auto_1565573 ) ( SURFACE-AT ?auto_1565566 ?auto_1565573 ) ( CLEAR ?auto_1565566 ) ( LIFTING ?auto_1565570 ?auto_1565567 ) ( IS-CRATE ?auto_1565567 ) ( not ( = ?auto_1565566 ?auto_1565567 ) ) ( not ( = ?auto_1565568 ?auto_1565566 ) ) ( not ( = ?auto_1565569 ?auto_1565566 ) ) ( not ( = ?auto_1565575 ?auto_1565566 ) ) ( not ( = ?auto_1565571 ?auto_1565566 ) ) ( ON ?auto_1565560 ?auto_1565559 ) ( ON ?auto_1565561 ?auto_1565560 ) ( ON ?auto_1565562 ?auto_1565561 ) ( ON ?auto_1565563 ?auto_1565562 ) ( ON ?auto_1565564 ?auto_1565563 ) ( ON ?auto_1565565 ?auto_1565564 ) ( ON ?auto_1565566 ?auto_1565565 ) ( not ( = ?auto_1565559 ?auto_1565560 ) ) ( not ( = ?auto_1565559 ?auto_1565561 ) ) ( not ( = ?auto_1565559 ?auto_1565562 ) ) ( not ( = ?auto_1565559 ?auto_1565563 ) ) ( not ( = ?auto_1565559 ?auto_1565564 ) ) ( not ( = ?auto_1565559 ?auto_1565565 ) ) ( not ( = ?auto_1565559 ?auto_1565566 ) ) ( not ( = ?auto_1565559 ?auto_1565567 ) ) ( not ( = ?auto_1565559 ?auto_1565568 ) ) ( not ( = ?auto_1565559 ?auto_1565569 ) ) ( not ( = ?auto_1565559 ?auto_1565575 ) ) ( not ( = ?auto_1565559 ?auto_1565571 ) ) ( not ( = ?auto_1565560 ?auto_1565561 ) ) ( not ( = ?auto_1565560 ?auto_1565562 ) ) ( not ( = ?auto_1565560 ?auto_1565563 ) ) ( not ( = ?auto_1565560 ?auto_1565564 ) ) ( not ( = ?auto_1565560 ?auto_1565565 ) ) ( not ( = ?auto_1565560 ?auto_1565566 ) ) ( not ( = ?auto_1565560 ?auto_1565567 ) ) ( not ( = ?auto_1565560 ?auto_1565568 ) ) ( not ( = ?auto_1565560 ?auto_1565569 ) ) ( not ( = ?auto_1565560 ?auto_1565575 ) ) ( not ( = ?auto_1565560 ?auto_1565571 ) ) ( not ( = ?auto_1565561 ?auto_1565562 ) ) ( not ( = ?auto_1565561 ?auto_1565563 ) ) ( not ( = ?auto_1565561 ?auto_1565564 ) ) ( not ( = ?auto_1565561 ?auto_1565565 ) ) ( not ( = ?auto_1565561 ?auto_1565566 ) ) ( not ( = ?auto_1565561 ?auto_1565567 ) ) ( not ( = ?auto_1565561 ?auto_1565568 ) ) ( not ( = ?auto_1565561 ?auto_1565569 ) ) ( not ( = ?auto_1565561 ?auto_1565575 ) ) ( not ( = ?auto_1565561 ?auto_1565571 ) ) ( not ( = ?auto_1565562 ?auto_1565563 ) ) ( not ( = ?auto_1565562 ?auto_1565564 ) ) ( not ( = ?auto_1565562 ?auto_1565565 ) ) ( not ( = ?auto_1565562 ?auto_1565566 ) ) ( not ( = ?auto_1565562 ?auto_1565567 ) ) ( not ( = ?auto_1565562 ?auto_1565568 ) ) ( not ( = ?auto_1565562 ?auto_1565569 ) ) ( not ( = ?auto_1565562 ?auto_1565575 ) ) ( not ( = ?auto_1565562 ?auto_1565571 ) ) ( not ( = ?auto_1565563 ?auto_1565564 ) ) ( not ( = ?auto_1565563 ?auto_1565565 ) ) ( not ( = ?auto_1565563 ?auto_1565566 ) ) ( not ( = ?auto_1565563 ?auto_1565567 ) ) ( not ( = ?auto_1565563 ?auto_1565568 ) ) ( not ( = ?auto_1565563 ?auto_1565569 ) ) ( not ( = ?auto_1565563 ?auto_1565575 ) ) ( not ( = ?auto_1565563 ?auto_1565571 ) ) ( not ( = ?auto_1565564 ?auto_1565565 ) ) ( not ( = ?auto_1565564 ?auto_1565566 ) ) ( not ( = ?auto_1565564 ?auto_1565567 ) ) ( not ( = ?auto_1565564 ?auto_1565568 ) ) ( not ( = ?auto_1565564 ?auto_1565569 ) ) ( not ( = ?auto_1565564 ?auto_1565575 ) ) ( not ( = ?auto_1565564 ?auto_1565571 ) ) ( not ( = ?auto_1565565 ?auto_1565566 ) ) ( not ( = ?auto_1565565 ?auto_1565567 ) ) ( not ( = ?auto_1565565 ?auto_1565568 ) ) ( not ( = ?auto_1565565 ?auto_1565569 ) ) ( not ( = ?auto_1565565 ?auto_1565575 ) ) ( not ( = ?auto_1565565 ?auto_1565571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565567 ?auto_1565568 ?auto_1565569 )
      ( MAKE-10CRATE-VERIFY ?auto_1565559 ?auto_1565560 ?auto_1565561 ?auto_1565562 ?auto_1565563 ?auto_1565564 ?auto_1565565 ?auto_1565566 ?auto_1565567 ?auto_1565568 ?auto_1565569 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1565577 - SURFACE
      ?auto_1565578 - SURFACE
      ?auto_1565579 - SURFACE
      ?auto_1565580 - SURFACE
      ?auto_1565581 - SURFACE
      ?auto_1565582 - SURFACE
      ?auto_1565583 - SURFACE
      ?auto_1565584 - SURFACE
      ?auto_1565585 - SURFACE
      ?auto_1565586 - SURFACE
      ?auto_1565587 - SURFACE
      ?auto_1565588 - SURFACE
    )
    :vars
    (
      ?auto_1565589 - HOIST
      ?auto_1565592 - PLACE
      ?auto_1565593 - PLACE
      ?auto_1565591 - HOIST
      ?auto_1565594 - SURFACE
      ?auto_1565590 - SURFACE
      ?auto_1565595 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565589 ?auto_1565592 ) ( IS-CRATE ?auto_1565588 ) ( not ( = ?auto_1565587 ?auto_1565588 ) ) ( not ( = ?auto_1565586 ?auto_1565587 ) ) ( not ( = ?auto_1565586 ?auto_1565588 ) ) ( not ( = ?auto_1565593 ?auto_1565592 ) ) ( HOIST-AT ?auto_1565591 ?auto_1565593 ) ( not ( = ?auto_1565589 ?auto_1565591 ) ) ( SURFACE-AT ?auto_1565588 ?auto_1565593 ) ( ON ?auto_1565588 ?auto_1565594 ) ( CLEAR ?auto_1565588 ) ( not ( = ?auto_1565587 ?auto_1565594 ) ) ( not ( = ?auto_1565588 ?auto_1565594 ) ) ( not ( = ?auto_1565586 ?auto_1565594 ) ) ( IS-CRATE ?auto_1565587 ) ( AVAILABLE ?auto_1565591 ) ( SURFACE-AT ?auto_1565587 ?auto_1565593 ) ( ON ?auto_1565587 ?auto_1565590 ) ( CLEAR ?auto_1565587 ) ( not ( = ?auto_1565587 ?auto_1565590 ) ) ( not ( = ?auto_1565588 ?auto_1565590 ) ) ( not ( = ?auto_1565586 ?auto_1565590 ) ) ( not ( = ?auto_1565594 ?auto_1565590 ) ) ( TRUCK-AT ?auto_1565595 ?auto_1565592 ) ( SURFACE-AT ?auto_1565585 ?auto_1565592 ) ( CLEAR ?auto_1565585 ) ( LIFTING ?auto_1565589 ?auto_1565586 ) ( IS-CRATE ?auto_1565586 ) ( not ( = ?auto_1565585 ?auto_1565586 ) ) ( not ( = ?auto_1565587 ?auto_1565585 ) ) ( not ( = ?auto_1565588 ?auto_1565585 ) ) ( not ( = ?auto_1565594 ?auto_1565585 ) ) ( not ( = ?auto_1565590 ?auto_1565585 ) ) ( ON ?auto_1565578 ?auto_1565577 ) ( ON ?auto_1565579 ?auto_1565578 ) ( ON ?auto_1565580 ?auto_1565579 ) ( ON ?auto_1565581 ?auto_1565580 ) ( ON ?auto_1565582 ?auto_1565581 ) ( ON ?auto_1565583 ?auto_1565582 ) ( ON ?auto_1565584 ?auto_1565583 ) ( ON ?auto_1565585 ?auto_1565584 ) ( not ( = ?auto_1565577 ?auto_1565578 ) ) ( not ( = ?auto_1565577 ?auto_1565579 ) ) ( not ( = ?auto_1565577 ?auto_1565580 ) ) ( not ( = ?auto_1565577 ?auto_1565581 ) ) ( not ( = ?auto_1565577 ?auto_1565582 ) ) ( not ( = ?auto_1565577 ?auto_1565583 ) ) ( not ( = ?auto_1565577 ?auto_1565584 ) ) ( not ( = ?auto_1565577 ?auto_1565585 ) ) ( not ( = ?auto_1565577 ?auto_1565586 ) ) ( not ( = ?auto_1565577 ?auto_1565587 ) ) ( not ( = ?auto_1565577 ?auto_1565588 ) ) ( not ( = ?auto_1565577 ?auto_1565594 ) ) ( not ( = ?auto_1565577 ?auto_1565590 ) ) ( not ( = ?auto_1565578 ?auto_1565579 ) ) ( not ( = ?auto_1565578 ?auto_1565580 ) ) ( not ( = ?auto_1565578 ?auto_1565581 ) ) ( not ( = ?auto_1565578 ?auto_1565582 ) ) ( not ( = ?auto_1565578 ?auto_1565583 ) ) ( not ( = ?auto_1565578 ?auto_1565584 ) ) ( not ( = ?auto_1565578 ?auto_1565585 ) ) ( not ( = ?auto_1565578 ?auto_1565586 ) ) ( not ( = ?auto_1565578 ?auto_1565587 ) ) ( not ( = ?auto_1565578 ?auto_1565588 ) ) ( not ( = ?auto_1565578 ?auto_1565594 ) ) ( not ( = ?auto_1565578 ?auto_1565590 ) ) ( not ( = ?auto_1565579 ?auto_1565580 ) ) ( not ( = ?auto_1565579 ?auto_1565581 ) ) ( not ( = ?auto_1565579 ?auto_1565582 ) ) ( not ( = ?auto_1565579 ?auto_1565583 ) ) ( not ( = ?auto_1565579 ?auto_1565584 ) ) ( not ( = ?auto_1565579 ?auto_1565585 ) ) ( not ( = ?auto_1565579 ?auto_1565586 ) ) ( not ( = ?auto_1565579 ?auto_1565587 ) ) ( not ( = ?auto_1565579 ?auto_1565588 ) ) ( not ( = ?auto_1565579 ?auto_1565594 ) ) ( not ( = ?auto_1565579 ?auto_1565590 ) ) ( not ( = ?auto_1565580 ?auto_1565581 ) ) ( not ( = ?auto_1565580 ?auto_1565582 ) ) ( not ( = ?auto_1565580 ?auto_1565583 ) ) ( not ( = ?auto_1565580 ?auto_1565584 ) ) ( not ( = ?auto_1565580 ?auto_1565585 ) ) ( not ( = ?auto_1565580 ?auto_1565586 ) ) ( not ( = ?auto_1565580 ?auto_1565587 ) ) ( not ( = ?auto_1565580 ?auto_1565588 ) ) ( not ( = ?auto_1565580 ?auto_1565594 ) ) ( not ( = ?auto_1565580 ?auto_1565590 ) ) ( not ( = ?auto_1565581 ?auto_1565582 ) ) ( not ( = ?auto_1565581 ?auto_1565583 ) ) ( not ( = ?auto_1565581 ?auto_1565584 ) ) ( not ( = ?auto_1565581 ?auto_1565585 ) ) ( not ( = ?auto_1565581 ?auto_1565586 ) ) ( not ( = ?auto_1565581 ?auto_1565587 ) ) ( not ( = ?auto_1565581 ?auto_1565588 ) ) ( not ( = ?auto_1565581 ?auto_1565594 ) ) ( not ( = ?auto_1565581 ?auto_1565590 ) ) ( not ( = ?auto_1565582 ?auto_1565583 ) ) ( not ( = ?auto_1565582 ?auto_1565584 ) ) ( not ( = ?auto_1565582 ?auto_1565585 ) ) ( not ( = ?auto_1565582 ?auto_1565586 ) ) ( not ( = ?auto_1565582 ?auto_1565587 ) ) ( not ( = ?auto_1565582 ?auto_1565588 ) ) ( not ( = ?auto_1565582 ?auto_1565594 ) ) ( not ( = ?auto_1565582 ?auto_1565590 ) ) ( not ( = ?auto_1565583 ?auto_1565584 ) ) ( not ( = ?auto_1565583 ?auto_1565585 ) ) ( not ( = ?auto_1565583 ?auto_1565586 ) ) ( not ( = ?auto_1565583 ?auto_1565587 ) ) ( not ( = ?auto_1565583 ?auto_1565588 ) ) ( not ( = ?auto_1565583 ?auto_1565594 ) ) ( not ( = ?auto_1565583 ?auto_1565590 ) ) ( not ( = ?auto_1565584 ?auto_1565585 ) ) ( not ( = ?auto_1565584 ?auto_1565586 ) ) ( not ( = ?auto_1565584 ?auto_1565587 ) ) ( not ( = ?auto_1565584 ?auto_1565588 ) ) ( not ( = ?auto_1565584 ?auto_1565594 ) ) ( not ( = ?auto_1565584 ?auto_1565590 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565586 ?auto_1565587 ?auto_1565588 )
      ( MAKE-11CRATE-VERIFY ?auto_1565577 ?auto_1565578 ?auto_1565579 ?auto_1565580 ?auto_1565581 ?auto_1565582 ?auto_1565583 ?auto_1565584 ?auto_1565585 ?auto_1565586 ?auto_1565587 ?auto_1565588 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1565596 - SURFACE
      ?auto_1565597 - SURFACE
      ?auto_1565598 - SURFACE
      ?auto_1565599 - SURFACE
      ?auto_1565600 - SURFACE
      ?auto_1565601 - SURFACE
      ?auto_1565602 - SURFACE
      ?auto_1565603 - SURFACE
      ?auto_1565604 - SURFACE
      ?auto_1565605 - SURFACE
      ?auto_1565606 - SURFACE
      ?auto_1565607 - SURFACE
      ?auto_1565608 - SURFACE
    )
    :vars
    (
      ?auto_1565609 - HOIST
      ?auto_1565612 - PLACE
      ?auto_1565613 - PLACE
      ?auto_1565611 - HOIST
      ?auto_1565614 - SURFACE
      ?auto_1565610 - SURFACE
      ?auto_1565615 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565609 ?auto_1565612 ) ( IS-CRATE ?auto_1565608 ) ( not ( = ?auto_1565607 ?auto_1565608 ) ) ( not ( = ?auto_1565606 ?auto_1565607 ) ) ( not ( = ?auto_1565606 ?auto_1565608 ) ) ( not ( = ?auto_1565613 ?auto_1565612 ) ) ( HOIST-AT ?auto_1565611 ?auto_1565613 ) ( not ( = ?auto_1565609 ?auto_1565611 ) ) ( SURFACE-AT ?auto_1565608 ?auto_1565613 ) ( ON ?auto_1565608 ?auto_1565614 ) ( CLEAR ?auto_1565608 ) ( not ( = ?auto_1565607 ?auto_1565614 ) ) ( not ( = ?auto_1565608 ?auto_1565614 ) ) ( not ( = ?auto_1565606 ?auto_1565614 ) ) ( IS-CRATE ?auto_1565607 ) ( AVAILABLE ?auto_1565611 ) ( SURFACE-AT ?auto_1565607 ?auto_1565613 ) ( ON ?auto_1565607 ?auto_1565610 ) ( CLEAR ?auto_1565607 ) ( not ( = ?auto_1565607 ?auto_1565610 ) ) ( not ( = ?auto_1565608 ?auto_1565610 ) ) ( not ( = ?auto_1565606 ?auto_1565610 ) ) ( not ( = ?auto_1565614 ?auto_1565610 ) ) ( TRUCK-AT ?auto_1565615 ?auto_1565612 ) ( SURFACE-AT ?auto_1565605 ?auto_1565612 ) ( CLEAR ?auto_1565605 ) ( LIFTING ?auto_1565609 ?auto_1565606 ) ( IS-CRATE ?auto_1565606 ) ( not ( = ?auto_1565605 ?auto_1565606 ) ) ( not ( = ?auto_1565607 ?auto_1565605 ) ) ( not ( = ?auto_1565608 ?auto_1565605 ) ) ( not ( = ?auto_1565614 ?auto_1565605 ) ) ( not ( = ?auto_1565610 ?auto_1565605 ) ) ( ON ?auto_1565597 ?auto_1565596 ) ( ON ?auto_1565598 ?auto_1565597 ) ( ON ?auto_1565599 ?auto_1565598 ) ( ON ?auto_1565600 ?auto_1565599 ) ( ON ?auto_1565601 ?auto_1565600 ) ( ON ?auto_1565602 ?auto_1565601 ) ( ON ?auto_1565603 ?auto_1565602 ) ( ON ?auto_1565604 ?auto_1565603 ) ( ON ?auto_1565605 ?auto_1565604 ) ( not ( = ?auto_1565596 ?auto_1565597 ) ) ( not ( = ?auto_1565596 ?auto_1565598 ) ) ( not ( = ?auto_1565596 ?auto_1565599 ) ) ( not ( = ?auto_1565596 ?auto_1565600 ) ) ( not ( = ?auto_1565596 ?auto_1565601 ) ) ( not ( = ?auto_1565596 ?auto_1565602 ) ) ( not ( = ?auto_1565596 ?auto_1565603 ) ) ( not ( = ?auto_1565596 ?auto_1565604 ) ) ( not ( = ?auto_1565596 ?auto_1565605 ) ) ( not ( = ?auto_1565596 ?auto_1565606 ) ) ( not ( = ?auto_1565596 ?auto_1565607 ) ) ( not ( = ?auto_1565596 ?auto_1565608 ) ) ( not ( = ?auto_1565596 ?auto_1565614 ) ) ( not ( = ?auto_1565596 ?auto_1565610 ) ) ( not ( = ?auto_1565597 ?auto_1565598 ) ) ( not ( = ?auto_1565597 ?auto_1565599 ) ) ( not ( = ?auto_1565597 ?auto_1565600 ) ) ( not ( = ?auto_1565597 ?auto_1565601 ) ) ( not ( = ?auto_1565597 ?auto_1565602 ) ) ( not ( = ?auto_1565597 ?auto_1565603 ) ) ( not ( = ?auto_1565597 ?auto_1565604 ) ) ( not ( = ?auto_1565597 ?auto_1565605 ) ) ( not ( = ?auto_1565597 ?auto_1565606 ) ) ( not ( = ?auto_1565597 ?auto_1565607 ) ) ( not ( = ?auto_1565597 ?auto_1565608 ) ) ( not ( = ?auto_1565597 ?auto_1565614 ) ) ( not ( = ?auto_1565597 ?auto_1565610 ) ) ( not ( = ?auto_1565598 ?auto_1565599 ) ) ( not ( = ?auto_1565598 ?auto_1565600 ) ) ( not ( = ?auto_1565598 ?auto_1565601 ) ) ( not ( = ?auto_1565598 ?auto_1565602 ) ) ( not ( = ?auto_1565598 ?auto_1565603 ) ) ( not ( = ?auto_1565598 ?auto_1565604 ) ) ( not ( = ?auto_1565598 ?auto_1565605 ) ) ( not ( = ?auto_1565598 ?auto_1565606 ) ) ( not ( = ?auto_1565598 ?auto_1565607 ) ) ( not ( = ?auto_1565598 ?auto_1565608 ) ) ( not ( = ?auto_1565598 ?auto_1565614 ) ) ( not ( = ?auto_1565598 ?auto_1565610 ) ) ( not ( = ?auto_1565599 ?auto_1565600 ) ) ( not ( = ?auto_1565599 ?auto_1565601 ) ) ( not ( = ?auto_1565599 ?auto_1565602 ) ) ( not ( = ?auto_1565599 ?auto_1565603 ) ) ( not ( = ?auto_1565599 ?auto_1565604 ) ) ( not ( = ?auto_1565599 ?auto_1565605 ) ) ( not ( = ?auto_1565599 ?auto_1565606 ) ) ( not ( = ?auto_1565599 ?auto_1565607 ) ) ( not ( = ?auto_1565599 ?auto_1565608 ) ) ( not ( = ?auto_1565599 ?auto_1565614 ) ) ( not ( = ?auto_1565599 ?auto_1565610 ) ) ( not ( = ?auto_1565600 ?auto_1565601 ) ) ( not ( = ?auto_1565600 ?auto_1565602 ) ) ( not ( = ?auto_1565600 ?auto_1565603 ) ) ( not ( = ?auto_1565600 ?auto_1565604 ) ) ( not ( = ?auto_1565600 ?auto_1565605 ) ) ( not ( = ?auto_1565600 ?auto_1565606 ) ) ( not ( = ?auto_1565600 ?auto_1565607 ) ) ( not ( = ?auto_1565600 ?auto_1565608 ) ) ( not ( = ?auto_1565600 ?auto_1565614 ) ) ( not ( = ?auto_1565600 ?auto_1565610 ) ) ( not ( = ?auto_1565601 ?auto_1565602 ) ) ( not ( = ?auto_1565601 ?auto_1565603 ) ) ( not ( = ?auto_1565601 ?auto_1565604 ) ) ( not ( = ?auto_1565601 ?auto_1565605 ) ) ( not ( = ?auto_1565601 ?auto_1565606 ) ) ( not ( = ?auto_1565601 ?auto_1565607 ) ) ( not ( = ?auto_1565601 ?auto_1565608 ) ) ( not ( = ?auto_1565601 ?auto_1565614 ) ) ( not ( = ?auto_1565601 ?auto_1565610 ) ) ( not ( = ?auto_1565602 ?auto_1565603 ) ) ( not ( = ?auto_1565602 ?auto_1565604 ) ) ( not ( = ?auto_1565602 ?auto_1565605 ) ) ( not ( = ?auto_1565602 ?auto_1565606 ) ) ( not ( = ?auto_1565602 ?auto_1565607 ) ) ( not ( = ?auto_1565602 ?auto_1565608 ) ) ( not ( = ?auto_1565602 ?auto_1565614 ) ) ( not ( = ?auto_1565602 ?auto_1565610 ) ) ( not ( = ?auto_1565603 ?auto_1565604 ) ) ( not ( = ?auto_1565603 ?auto_1565605 ) ) ( not ( = ?auto_1565603 ?auto_1565606 ) ) ( not ( = ?auto_1565603 ?auto_1565607 ) ) ( not ( = ?auto_1565603 ?auto_1565608 ) ) ( not ( = ?auto_1565603 ?auto_1565614 ) ) ( not ( = ?auto_1565603 ?auto_1565610 ) ) ( not ( = ?auto_1565604 ?auto_1565605 ) ) ( not ( = ?auto_1565604 ?auto_1565606 ) ) ( not ( = ?auto_1565604 ?auto_1565607 ) ) ( not ( = ?auto_1565604 ?auto_1565608 ) ) ( not ( = ?auto_1565604 ?auto_1565614 ) ) ( not ( = ?auto_1565604 ?auto_1565610 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565606 ?auto_1565607 ?auto_1565608 )
      ( MAKE-12CRATE-VERIFY ?auto_1565596 ?auto_1565597 ?auto_1565598 ?auto_1565599 ?auto_1565600 ?auto_1565601 ?auto_1565602 ?auto_1565603 ?auto_1565604 ?auto_1565605 ?auto_1565606 ?auto_1565607 ?auto_1565608 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1565616 - SURFACE
      ?auto_1565617 - SURFACE
      ?auto_1565618 - SURFACE
      ?auto_1565619 - SURFACE
      ?auto_1565620 - SURFACE
      ?auto_1565621 - SURFACE
      ?auto_1565622 - SURFACE
      ?auto_1565623 - SURFACE
      ?auto_1565624 - SURFACE
      ?auto_1565625 - SURFACE
      ?auto_1565626 - SURFACE
      ?auto_1565627 - SURFACE
      ?auto_1565628 - SURFACE
      ?auto_1565629 - SURFACE
    )
    :vars
    (
      ?auto_1565630 - HOIST
      ?auto_1565633 - PLACE
      ?auto_1565634 - PLACE
      ?auto_1565632 - HOIST
      ?auto_1565635 - SURFACE
      ?auto_1565631 - SURFACE
      ?auto_1565636 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565630 ?auto_1565633 ) ( IS-CRATE ?auto_1565629 ) ( not ( = ?auto_1565628 ?auto_1565629 ) ) ( not ( = ?auto_1565627 ?auto_1565628 ) ) ( not ( = ?auto_1565627 ?auto_1565629 ) ) ( not ( = ?auto_1565634 ?auto_1565633 ) ) ( HOIST-AT ?auto_1565632 ?auto_1565634 ) ( not ( = ?auto_1565630 ?auto_1565632 ) ) ( SURFACE-AT ?auto_1565629 ?auto_1565634 ) ( ON ?auto_1565629 ?auto_1565635 ) ( CLEAR ?auto_1565629 ) ( not ( = ?auto_1565628 ?auto_1565635 ) ) ( not ( = ?auto_1565629 ?auto_1565635 ) ) ( not ( = ?auto_1565627 ?auto_1565635 ) ) ( IS-CRATE ?auto_1565628 ) ( AVAILABLE ?auto_1565632 ) ( SURFACE-AT ?auto_1565628 ?auto_1565634 ) ( ON ?auto_1565628 ?auto_1565631 ) ( CLEAR ?auto_1565628 ) ( not ( = ?auto_1565628 ?auto_1565631 ) ) ( not ( = ?auto_1565629 ?auto_1565631 ) ) ( not ( = ?auto_1565627 ?auto_1565631 ) ) ( not ( = ?auto_1565635 ?auto_1565631 ) ) ( TRUCK-AT ?auto_1565636 ?auto_1565633 ) ( SURFACE-AT ?auto_1565626 ?auto_1565633 ) ( CLEAR ?auto_1565626 ) ( LIFTING ?auto_1565630 ?auto_1565627 ) ( IS-CRATE ?auto_1565627 ) ( not ( = ?auto_1565626 ?auto_1565627 ) ) ( not ( = ?auto_1565628 ?auto_1565626 ) ) ( not ( = ?auto_1565629 ?auto_1565626 ) ) ( not ( = ?auto_1565635 ?auto_1565626 ) ) ( not ( = ?auto_1565631 ?auto_1565626 ) ) ( ON ?auto_1565617 ?auto_1565616 ) ( ON ?auto_1565618 ?auto_1565617 ) ( ON ?auto_1565619 ?auto_1565618 ) ( ON ?auto_1565620 ?auto_1565619 ) ( ON ?auto_1565621 ?auto_1565620 ) ( ON ?auto_1565622 ?auto_1565621 ) ( ON ?auto_1565623 ?auto_1565622 ) ( ON ?auto_1565624 ?auto_1565623 ) ( ON ?auto_1565625 ?auto_1565624 ) ( ON ?auto_1565626 ?auto_1565625 ) ( not ( = ?auto_1565616 ?auto_1565617 ) ) ( not ( = ?auto_1565616 ?auto_1565618 ) ) ( not ( = ?auto_1565616 ?auto_1565619 ) ) ( not ( = ?auto_1565616 ?auto_1565620 ) ) ( not ( = ?auto_1565616 ?auto_1565621 ) ) ( not ( = ?auto_1565616 ?auto_1565622 ) ) ( not ( = ?auto_1565616 ?auto_1565623 ) ) ( not ( = ?auto_1565616 ?auto_1565624 ) ) ( not ( = ?auto_1565616 ?auto_1565625 ) ) ( not ( = ?auto_1565616 ?auto_1565626 ) ) ( not ( = ?auto_1565616 ?auto_1565627 ) ) ( not ( = ?auto_1565616 ?auto_1565628 ) ) ( not ( = ?auto_1565616 ?auto_1565629 ) ) ( not ( = ?auto_1565616 ?auto_1565635 ) ) ( not ( = ?auto_1565616 ?auto_1565631 ) ) ( not ( = ?auto_1565617 ?auto_1565618 ) ) ( not ( = ?auto_1565617 ?auto_1565619 ) ) ( not ( = ?auto_1565617 ?auto_1565620 ) ) ( not ( = ?auto_1565617 ?auto_1565621 ) ) ( not ( = ?auto_1565617 ?auto_1565622 ) ) ( not ( = ?auto_1565617 ?auto_1565623 ) ) ( not ( = ?auto_1565617 ?auto_1565624 ) ) ( not ( = ?auto_1565617 ?auto_1565625 ) ) ( not ( = ?auto_1565617 ?auto_1565626 ) ) ( not ( = ?auto_1565617 ?auto_1565627 ) ) ( not ( = ?auto_1565617 ?auto_1565628 ) ) ( not ( = ?auto_1565617 ?auto_1565629 ) ) ( not ( = ?auto_1565617 ?auto_1565635 ) ) ( not ( = ?auto_1565617 ?auto_1565631 ) ) ( not ( = ?auto_1565618 ?auto_1565619 ) ) ( not ( = ?auto_1565618 ?auto_1565620 ) ) ( not ( = ?auto_1565618 ?auto_1565621 ) ) ( not ( = ?auto_1565618 ?auto_1565622 ) ) ( not ( = ?auto_1565618 ?auto_1565623 ) ) ( not ( = ?auto_1565618 ?auto_1565624 ) ) ( not ( = ?auto_1565618 ?auto_1565625 ) ) ( not ( = ?auto_1565618 ?auto_1565626 ) ) ( not ( = ?auto_1565618 ?auto_1565627 ) ) ( not ( = ?auto_1565618 ?auto_1565628 ) ) ( not ( = ?auto_1565618 ?auto_1565629 ) ) ( not ( = ?auto_1565618 ?auto_1565635 ) ) ( not ( = ?auto_1565618 ?auto_1565631 ) ) ( not ( = ?auto_1565619 ?auto_1565620 ) ) ( not ( = ?auto_1565619 ?auto_1565621 ) ) ( not ( = ?auto_1565619 ?auto_1565622 ) ) ( not ( = ?auto_1565619 ?auto_1565623 ) ) ( not ( = ?auto_1565619 ?auto_1565624 ) ) ( not ( = ?auto_1565619 ?auto_1565625 ) ) ( not ( = ?auto_1565619 ?auto_1565626 ) ) ( not ( = ?auto_1565619 ?auto_1565627 ) ) ( not ( = ?auto_1565619 ?auto_1565628 ) ) ( not ( = ?auto_1565619 ?auto_1565629 ) ) ( not ( = ?auto_1565619 ?auto_1565635 ) ) ( not ( = ?auto_1565619 ?auto_1565631 ) ) ( not ( = ?auto_1565620 ?auto_1565621 ) ) ( not ( = ?auto_1565620 ?auto_1565622 ) ) ( not ( = ?auto_1565620 ?auto_1565623 ) ) ( not ( = ?auto_1565620 ?auto_1565624 ) ) ( not ( = ?auto_1565620 ?auto_1565625 ) ) ( not ( = ?auto_1565620 ?auto_1565626 ) ) ( not ( = ?auto_1565620 ?auto_1565627 ) ) ( not ( = ?auto_1565620 ?auto_1565628 ) ) ( not ( = ?auto_1565620 ?auto_1565629 ) ) ( not ( = ?auto_1565620 ?auto_1565635 ) ) ( not ( = ?auto_1565620 ?auto_1565631 ) ) ( not ( = ?auto_1565621 ?auto_1565622 ) ) ( not ( = ?auto_1565621 ?auto_1565623 ) ) ( not ( = ?auto_1565621 ?auto_1565624 ) ) ( not ( = ?auto_1565621 ?auto_1565625 ) ) ( not ( = ?auto_1565621 ?auto_1565626 ) ) ( not ( = ?auto_1565621 ?auto_1565627 ) ) ( not ( = ?auto_1565621 ?auto_1565628 ) ) ( not ( = ?auto_1565621 ?auto_1565629 ) ) ( not ( = ?auto_1565621 ?auto_1565635 ) ) ( not ( = ?auto_1565621 ?auto_1565631 ) ) ( not ( = ?auto_1565622 ?auto_1565623 ) ) ( not ( = ?auto_1565622 ?auto_1565624 ) ) ( not ( = ?auto_1565622 ?auto_1565625 ) ) ( not ( = ?auto_1565622 ?auto_1565626 ) ) ( not ( = ?auto_1565622 ?auto_1565627 ) ) ( not ( = ?auto_1565622 ?auto_1565628 ) ) ( not ( = ?auto_1565622 ?auto_1565629 ) ) ( not ( = ?auto_1565622 ?auto_1565635 ) ) ( not ( = ?auto_1565622 ?auto_1565631 ) ) ( not ( = ?auto_1565623 ?auto_1565624 ) ) ( not ( = ?auto_1565623 ?auto_1565625 ) ) ( not ( = ?auto_1565623 ?auto_1565626 ) ) ( not ( = ?auto_1565623 ?auto_1565627 ) ) ( not ( = ?auto_1565623 ?auto_1565628 ) ) ( not ( = ?auto_1565623 ?auto_1565629 ) ) ( not ( = ?auto_1565623 ?auto_1565635 ) ) ( not ( = ?auto_1565623 ?auto_1565631 ) ) ( not ( = ?auto_1565624 ?auto_1565625 ) ) ( not ( = ?auto_1565624 ?auto_1565626 ) ) ( not ( = ?auto_1565624 ?auto_1565627 ) ) ( not ( = ?auto_1565624 ?auto_1565628 ) ) ( not ( = ?auto_1565624 ?auto_1565629 ) ) ( not ( = ?auto_1565624 ?auto_1565635 ) ) ( not ( = ?auto_1565624 ?auto_1565631 ) ) ( not ( = ?auto_1565625 ?auto_1565626 ) ) ( not ( = ?auto_1565625 ?auto_1565627 ) ) ( not ( = ?auto_1565625 ?auto_1565628 ) ) ( not ( = ?auto_1565625 ?auto_1565629 ) ) ( not ( = ?auto_1565625 ?auto_1565635 ) ) ( not ( = ?auto_1565625 ?auto_1565631 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1565627 ?auto_1565628 ?auto_1565629 )
      ( MAKE-13CRATE-VERIFY ?auto_1565616 ?auto_1565617 ?auto_1565618 ?auto_1565619 ?auto_1565620 ?auto_1565621 ?auto_1565622 ?auto_1565623 ?auto_1565624 ?auto_1565625 ?auto_1565626 ?auto_1565627 ?auto_1565628 ?auto_1565629 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1570642 - SURFACE
      ?auto_1570643 - SURFACE
    )
    :vars
    (
      ?auto_1570644 - HOIST
      ?auto_1570646 - PLACE
      ?auto_1570649 - SURFACE
      ?auto_1570650 - PLACE
      ?auto_1570651 - HOIST
      ?auto_1570648 - SURFACE
      ?auto_1570647 - TRUCK
      ?auto_1570645 - SURFACE
      ?auto_1570652 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1570644 ?auto_1570646 ) ( IS-CRATE ?auto_1570643 ) ( not ( = ?auto_1570642 ?auto_1570643 ) ) ( not ( = ?auto_1570649 ?auto_1570642 ) ) ( not ( = ?auto_1570649 ?auto_1570643 ) ) ( not ( = ?auto_1570650 ?auto_1570646 ) ) ( HOIST-AT ?auto_1570651 ?auto_1570650 ) ( not ( = ?auto_1570644 ?auto_1570651 ) ) ( SURFACE-AT ?auto_1570643 ?auto_1570650 ) ( ON ?auto_1570643 ?auto_1570648 ) ( CLEAR ?auto_1570643 ) ( not ( = ?auto_1570642 ?auto_1570648 ) ) ( not ( = ?auto_1570643 ?auto_1570648 ) ) ( not ( = ?auto_1570649 ?auto_1570648 ) ) ( SURFACE-AT ?auto_1570649 ?auto_1570646 ) ( CLEAR ?auto_1570649 ) ( IS-CRATE ?auto_1570642 ) ( AVAILABLE ?auto_1570644 ) ( TRUCK-AT ?auto_1570647 ?auto_1570650 ) ( SURFACE-AT ?auto_1570642 ?auto_1570650 ) ( ON ?auto_1570642 ?auto_1570645 ) ( CLEAR ?auto_1570642 ) ( not ( = ?auto_1570642 ?auto_1570645 ) ) ( not ( = ?auto_1570643 ?auto_1570645 ) ) ( not ( = ?auto_1570649 ?auto_1570645 ) ) ( not ( = ?auto_1570648 ?auto_1570645 ) ) ( LIFTING ?auto_1570651 ?auto_1570652 ) ( IS-CRATE ?auto_1570652 ) ( not ( = ?auto_1570642 ?auto_1570652 ) ) ( not ( = ?auto_1570643 ?auto_1570652 ) ) ( not ( = ?auto_1570649 ?auto_1570652 ) ) ( not ( = ?auto_1570648 ?auto_1570652 ) ) ( not ( = ?auto_1570645 ?auto_1570652 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1570651 ?auto_1570652 ?auto_1570647 ?auto_1570650 )
      ( MAKE-2CRATE ?auto_1570649 ?auto_1570642 ?auto_1570643 )
      ( MAKE-1CRATE-VERIFY ?auto_1570642 ?auto_1570643 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1570653 - SURFACE
      ?auto_1570654 - SURFACE
      ?auto_1570655 - SURFACE
    )
    :vars
    (
      ?auto_1570660 - HOIST
      ?auto_1570661 - PLACE
      ?auto_1570657 - PLACE
      ?auto_1570662 - HOIST
      ?auto_1570658 - SURFACE
      ?auto_1570656 - TRUCK
      ?auto_1570663 - SURFACE
      ?auto_1570659 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1570660 ?auto_1570661 ) ( IS-CRATE ?auto_1570655 ) ( not ( = ?auto_1570654 ?auto_1570655 ) ) ( not ( = ?auto_1570653 ?auto_1570654 ) ) ( not ( = ?auto_1570653 ?auto_1570655 ) ) ( not ( = ?auto_1570657 ?auto_1570661 ) ) ( HOIST-AT ?auto_1570662 ?auto_1570657 ) ( not ( = ?auto_1570660 ?auto_1570662 ) ) ( SURFACE-AT ?auto_1570655 ?auto_1570657 ) ( ON ?auto_1570655 ?auto_1570658 ) ( CLEAR ?auto_1570655 ) ( not ( = ?auto_1570654 ?auto_1570658 ) ) ( not ( = ?auto_1570655 ?auto_1570658 ) ) ( not ( = ?auto_1570653 ?auto_1570658 ) ) ( SURFACE-AT ?auto_1570653 ?auto_1570661 ) ( CLEAR ?auto_1570653 ) ( IS-CRATE ?auto_1570654 ) ( AVAILABLE ?auto_1570660 ) ( TRUCK-AT ?auto_1570656 ?auto_1570657 ) ( SURFACE-AT ?auto_1570654 ?auto_1570657 ) ( ON ?auto_1570654 ?auto_1570663 ) ( CLEAR ?auto_1570654 ) ( not ( = ?auto_1570654 ?auto_1570663 ) ) ( not ( = ?auto_1570655 ?auto_1570663 ) ) ( not ( = ?auto_1570653 ?auto_1570663 ) ) ( not ( = ?auto_1570658 ?auto_1570663 ) ) ( LIFTING ?auto_1570662 ?auto_1570659 ) ( IS-CRATE ?auto_1570659 ) ( not ( = ?auto_1570654 ?auto_1570659 ) ) ( not ( = ?auto_1570655 ?auto_1570659 ) ) ( not ( = ?auto_1570653 ?auto_1570659 ) ) ( not ( = ?auto_1570658 ?auto_1570659 ) ) ( not ( = ?auto_1570663 ?auto_1570659 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1570654 ?auto_1570655 )
      ( MAKE-2CRATE-VERIFY ?auto_1570653 ?auto_1570654 ?auto_1570655 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1578626 - SURFACE
      ?auto_1578627 - SURFACE
      ?auto_1578628 - SURFACE
      ?auto_1578629 - SURFACE
      ?auto_1578630 - SURFACE
      ?auto_1578631 - SURFACE
      ?auto_1578632 - SURFACE
      ?auto_1578633 - SURFACE
      ?auto_1578634 - SURFACE
      ?auto_1578635 - SURFACE
      ?auto_1578636 - SURFACE
      ?auto_1578637 - SURFACE
      ?auto_1578638 - SURFACE
      ?auto_1578639 - SURFACE
      ?auto_1578640 - SURFACE
    )
    :vars
    (
      ?auto_1578642 - HOIST
      ?auto_1578641 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1578642 ?auto_1578641 ) ( SURFACE-AT ?auto_1578639 ?auto_1578641 ) ( CLEAR ?auto_1578639 ) ( LIFTING ?auto_1578642 ?auto_1578640 ) ( IS-CRATE ?auto_1578640 ) ( not ( = ?auto_1578639 ?auto_1578640 ) ) ( ON ?auto_1578627 ?auto_1578626 ) ( ON ?auto_1578628 ?auto_1578627 ) ( ON ?auto_1578629 ?auto_1578628 ) ( ON ?auto_1578630 ?auto_1578629 ) ( ON ?auto_1578631 ?auto_1578630 ) ( ON ?auto_1578632 ?auto_1578631 ) ( ON ?auto_1578633 ?auto_1578632 ) ( ON ?auto_1578634 ?auto_1578633 ) ( ON ?auto_1578635 ?auto_1578634 ) ( ON ?auto_1578636 ?auto_1578635 ) ( ON ?auto_1578637 ?auto_1578636 ) ( ON ?auto_1578638 ?auto_1578637 ) ( ON ?auto_1578639 ?auto_1578638 ) ( not ( = ?auto_1578626 ?auto_1578627 ) ) ( not ( = ?auto_1578626 ?auto_1578628 ) ) ( not ( = ?auto_1578626 ?auto_1578629 ) ) ( not ( = ?auto_1578626 ?auto_1578630 ) ) ( not ( = ?auto_1578626 ?auto_1578631 ) ) ( not ( = ?auto_1578626 ?auto_1578632 ) ) ( not ( = ?auto_1578626 ?auto_1578633 ) ) ( not ( = ?auto_1578626 ?auto_1578634 ) ) ( not ( = ?auto_1578626 ?auto_1578635 ) ) ( not ( = ?auto_1578626 ?auto_1578636 ) ) ( not ( = ?auto_1578626 ?auto_1578637 ) ) ( not ( = ?auto_1578626 ?auto_1578638 ) ) ( not ( = ?auto_1578626 ?auto_1578639 ) ) ( not ( = ?auto_1578626 ?auto_1578640 ) ) ( not ( = ?auto_1578627 ?auto_1578628 ) ) ( not ( = ?auto_1578627 ?auto_1578629 ) ) ( not ( = ?auto_1578627 ?auto_1578630 ) ) ( not ( = ?auto_1578627 ?auto_1578631 ) ) ( not ( = ?auto_1578627 ?auto_1578632 ) ) ( not ( = ?auto_1578627 ?auto_1578633 ) ) ( not ( = ?auto_1578627 ?auto_1578634 ) ) ( not ( = ?auto_1578627 ?auto_1578635 ) ) ( not ( = ?auto_1578627 ?auto_1578636 ) ) ( not ( = ?auto_1578627 ?auto_1578637 ) ) ( not ( = ?auto_1578627 ?auto_1578638 ) ) ( not ( = ?auto_1578627 ?auto_1578639 ) ) ( not ( = ?auto_1578627 ?auto_1578640 ) ) ( not ( = ?auto_1578628 ?auto_1578629 ) ) ( not ( = ?auto_1578628 ?auto_1578630 ) ) ( not ( = ?auto_1578628 ?auto_1578631 ) ) ( not ( = ?auto_1578628 ?auto_1578632 ) ) ( not ( = ?auto_1578628 ?auto_1578633 ) ) ( not ( = ?auto_1578628 ?auto_1578634 ) ) ( not ( = ?auto_1578628 ?auto_1578635 ) ) ( not ( = ?auto_1578628 ?auto_1578636 ) ) ( not ( = ?auto_1578628 ?auto_1578637 ) ) ( not ( = ?auto_1578628 ?auto_1578638 ) ) ( not ( = ?auto_1578628 ?auto_1578639 ) ) ( not ( = ?auto_1578628 ?auto_1578640 ) ) ( not ( = ?auto_1578629 ?auto_1578630 ) ) ( not ( = ?auto_1578629 ?auto_1578631 ) ) ( not ( = ?auto_1578629 ?auto_1578632 ) ) ( not ( = ?auto_1578629 ?auto_1578633 ) ) ( not ( = ?auto_1578629 ?auto_1578634 ) ) ( not ( = ?auto_1578629 ?auto_1578635 ) ) ( not ( = ?auto_1578629 ?auto_1578636 ) ) ( not ( = ?auto_1578629 ?auto_1578637 ) ) ( not ( = ?auto_1578629 ?auto_1578638 ) ) ( not ( = ?auto_1578629 ?auto_1578639 ) ) ( not ( = ?auto_1578629 ?auto_1578640 ) ) ( not ( = ?auto_1578630 ?auto_1578631 ) ) ( not ( = ?auto_1578630 ?auto_1578632 ) ) ( not ( = ?auto_1578630 ?auto_1578633 ) ) ( not ( = ?auto_1578630 ?auto_1578634 ) ) ( not ( = ?auto_1578630 ?auto_1578635 ) ) ( not ( = ?auto_1578630 ?auto_1578636 ) ) ( not ( = ?auto_1578630 ?auto_1578637 ) ) ( not ( = ?auto_1578630 ?auto_1578638 ) ) ( not ( = ?auto_1578630 ?auto_1578639 ) ) ( not ( = ?auto_1578630 ?auto_1578640 ) ) ( not ( = ?auto_1578631 ?auto_1578632 ) ) ( not ( = ?auto_1578631 ?auto_1578633 ) ) ( not ( = ?auto_1578631 ?auto_1578634 ) ) ( not ( = ?auto_1578631 ?auto_1578635 ) ) ( not ( = ?auto_1578631 ?auto_1578636 ) ) ( not ( = ?auto_1578631 ?auto_1578637 ) ) ( not ( = ?auto_1578631 ?auto_1578638 ) ) ( not ( = ?auto_1578631 ?auto_1578639 ) ) ( not ( = ?auto_1578631 ?auto_1578640 ) ) ( not ( = ?auto_1578632 ?auto_1578633 ) ) ( not ( = ?auto_1578632 ?auto_1578634 ) ) ( not ( = ?auto_1578632 ?auto_1578635 ) ) ( not ( = ?auto_1578632 ?auto_1578636 ) ) ( not ( = ?auto_1578632 ?auto_1578637 ) ) ( not ( = ?auto_1578632 ?auto_1578638 ) ) ( not ( = ?auto_1578632 ?auto_1578639 ) ) ( not ( = ?auto_1578632 ?auto_1578640 ) ) ( not ( = ?auto_1578633 ?auto_1578634 ) ) ( not ( = ?auto_1578633 ?auto_1578635 ) ) ( not ( = ?auto_1578633 ?auto_1578636 ) ) ( not ( = ?auto_1578633 ?auto_1578637 ) ) ( not ( = ?auto_1578633 ?auto_1578638 ) ) ( not ( = ?auto_1578633 ?auto_1578639 ) ) ( not ( = ?auto_1578633 ?auto_1578640 ) ) ( not ( = ?auto_1578634 ?auto_1578635 ) ) ( not ( = ?auto_1578634 ?auto_1578636 ) ) ( not ( = ?auto_1578634 ?auto_1578637 ) ) ( not ( = ?auto_1578634 ?auto_1578638 ) ) ( not ( = ?auto_1578634 ?auto_1578639 ) ) ( not ( = ?auto_1578634 ?auto_1578640 ) ) ( not ( = ?auto_1578635 ?auto_1578636 ) ) ( not ( = ?auto_1578635 ?auto_1578637 ) ) ( not ( = ?auto_1578635 ?auto_1578638 ) ) ( not ( = ?auto_1578635 ?auto_1578639 ) ) ( not ( = ?auto_1578635 ?auto_1578640 ) ) ( not ( = ?auto_1578636 ?auto_1578637 ) ) ( not ( = ?auto_1578636 ?auto_1578638 ) ) ( not ( = ?auto_1578636 ?auto_1578639 ) ) ( not ( = ?auto_1578636 ?auto_1578640 ) ) ( not ( = ?auto_1578637 ?auto_1578638 ) ) ( not ( = ?auto_1578637 ?auto_1578639 ) ) ( not ( = ?auto_1578637 ?auto_1578640 ) ) ( not ( = ?auto_1578638 ?auto_1578639 ) ) ( not ( = ?auto_1578638 ?auto_1578640 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1578639 ?auto_1578640 )
      ( MAKE-14CRATE-VERIFY ?auto_1578626 ?auto_1578627 ?auto_1578628 ?auto_1578629 ?auto_1578630 ?auto_1578631 ?auto_1578632 ?auto_1578633 ?auto_1578634 ?auto_1578635 ?auto_1578636 ?auto_1578637 ?auto_1578638 ?auto_1578639 ?auto_1578640 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1578786 - SURFACE
      ?auto_1578787 - SURFACE
      ?auto_1578788 - SURFACE
      ?auto_1578789 - SURFACE
      ?auto_1578790 - SURFACE
      ?auto_1578791 - SURFACE
      ?auto_1578792 - SURFACE
      ?auto_1578793 - SURFACE
      ?auto_1578794 - SURFACE
      ?auto_1578795 - SURFACE
      ?auto_1578796 - SURFACE
      ?auto_1578797 - SURFACE
      ?auto_1578798 - SURFACE
      ?auto_1578799 - SURFACE
      ?auto_1578800 - SURFACE
    )
    :vars
    (
      ?auto_1578803 - HOIST
      ?auto_1578801 - PLACE
      ?auto_1578802 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1578803 ?auto_1578801 ) ( SURFACE-AT ?auto_1578799 ?auto_1578801 ) ( CLEAR ?auto_1578799 ) ( IS-CRATE ?auto_1578800 ) ( not ( = ?auto_1578799 ?auto_1578800 ) ) ( TRUCK-AT ?auto_1578802 ?auto_1578801 ) ( AVAILABLE ?auto_1578803 ) ( IN ?auto_1578800 ?auto_1578802 ) ( ON ?auto_1578799 ?auto_1578798 ) ( not ( = ?auto_1578798 ?auto_1578799 ) ) ( not ( = ?auto_1578798 ?auto_1578800 ) ) ( ON ?auto_1578787 ?auto_1578786 ) ( ON ?auto_1578788 ?auto_1578787 ) ( ON ?auto_1578789 ?auto_1578788 ) ( ON ?auto_1578790 ?auto_1578789 ) ( ON ?auto_1578791 ?auto_1578790 ) ( ON ?auto_1578792 ?auto_1578791 ) ( ON ?auto_1578793 ?auto_1578792 ) ( ON ?auto_1578794 ?auto_1578793 ) ( ON ?auto_1578795 ?auto_1578794 ) ( ON ?auto_1578796 ?auto_1578795 ) ( ON ?auto_1578797 ?auto_1578796 ) ( ON ?auto_1578798 ?auto_1578797 ) ( not ( = ?auto_1578786 ?auto_1578787 ) ) ( not ( = ?auto_1578786 ?auto_1578788 ) ) ( not ( = ?auto_1578786 ?auto_1578789 ) ) ( not ( = ?auto_1578786 ?auto_1578790 ) ) ( not ( = ?auto_1578786 ?auto_1578791 ) ) ( not ( = ?auto_1578786 ?auto_1578792 ) ) ( not ( = ?auto_1578786 ?auto_1578793 ) ) ( not ( = ?auto_1578786 ?auto_1578794 ) ) ( not ( = ?auto_1578786 ?auto_1578795 ) ) ( not ( = ?auto_1578786 ?auto_1578796 ) ) ( not ( = ?auto_1578786 ?auto_1578797 ) ) ( not ( = ?auto_1578786 ?auto_1578798 ) ) ( not ( = ?auto_1578786 ?auto_1578799 ) ) ( not ( = ?auto_1578786 ?auto_1578800 ) ) ( not ( = ?auto_1578787 ?auto_1578788 ) ) ( not ( = ?auto_1578787 ?auto_1578789 ) ) ( not ( = ?auto_1578787 ?auto_1578790 ) ) ( not ( = ?auto_1578787 ?auto_1578791 ) ) ( not ( = ?auto_1578787 ?auto_1578792 ) ) ( not ( = ?auto_1578787 ?auto_1578793 ) ) ( not ( = ?auto_1578787 ?auto_1578794 ) ) ( not ( = ?auto_1578787 ?auto_1578795 ) ) ( not ( = ?auto_1578787 ?auto_1578796 ) ) ( not ( = ?auto_1578787 ?auto_1578797 ) ) ( not ( = ?auto_1578787 ?auto_1578798 ) ) ( not ( = ?auto_1578787 ?auto_1578799 ) ) ( not ( = ?auto_1578787 ?auto_1578800 ) ) ( not ( = ?auto_1578788 ?auto_1578789 ) ) ( not ( = ?auto_1578788 ?auto_1578790 ) ) ( not ( = ?auto_1578788 ?auto_1578791 ) ) ( not ( = ?auto_1578788 ?auto_1578792 ) ) ( not ( = ?auto_1578788 ?auto_1578793 ) ) ( not ( = ?auto_1578788 ?auto_1578794 ) ) ( not ( = ?auto_1578788 ?auto_1578795 ) ) ( not ( = ?auto_1578788 ?auto_1578796 ) ) ( not ( = ?auto_1578788 ?auto_1578797 ) ) ( not ( = ?auto_1578788 ?auto_1578798 ) ) ( not ( = ?auto_1578788 ?auto_1578799 ) ) ( not ( = ?auto_1578788 ?auto_1578800 ) ) ( not ( = ?auto_1578789 ?auto_1578790 ) ) ( not ( = ?auto_1578789 ?auto_1578791 ) ) ( not ( = ?auto_1578789 ?auto_1578792 ) ) ( not ( = ?auto_1578789 ?auto_1578793 ) ) ( not ( = ?auto_1578789 ?auto_1578794 ) ) ( not ( = ?auto_1578789 ?auto_1578795 ) ) ( not ( = ?auto_1578789 ?auto_1578796 ) ) ( not ( = ?auto_1578789 ?auto_1578797 ) ) ( not ( = ?auto_1578789 ?auto_1578798 ) ) ( not ( = ?auto_1578789 ?auto_1578799 ) ) ( not ( = ?auto_1578789 ?auto_1578800 ) ) ( not ( = ?auto_1578790 ?auto_1578791 ) ) ( not ( = ?auto_1578790 ?auto_1578792 ) ) ( not ( = ?auto_1578790 ?auto_1578793 ) ) ( not ( = ?auto_1578790 ?auto_1578794 ) ) ( not ( = ?auto_1578790 ?auto_1578795 ) ) ( not ( = ?auto_1578790 ?auto_1578796 ) ) ( not ( = ?auto_1578790 ?auto_1578797 ) ) ( not ( = ?auto_1578790 ?auto_1578798 ) ) ( not ( = ?auto_1578790 ?auto_1578799 ) ) ( not ( = ?auto_1578790 ?auto_1578800 ) ) ( not ( = ?auto_1578791 ?auto_1578792 ) ) ( not ( = ?auto_1578791 ?auto_1578793 ) ) ( not ( = ?auto_1578791 ?auto_1578794 ) ) ( not ( = ?auto_1578791 ?auto_1578795 ) ) ( not ( = ?auto_1578791 ?auto_1578796 ) ) ( not ( = ?auto_1578791 ?auto_1578797 ) ) ( not ( = ?auto_1578791 ?auto_1578798 ) ) ( not ( = ?auto_1578791 ?auto_1578799 ) ) ( not ( = ?auto_1578791 ?auto_1578800 ) ) ( not ( = ?auto_1578792 ?auto_1578793 ) ) ( not ( = ?auto_1578792 ?auto_1578794 ) ) ( not ( = ?auto_1578792 ?auto_1578795 ) ) ( not ( = ?auto_1578792 ?auto_1578796 ) ) ( not ( = ?auto_1578792 ?auto_1578797 ) ) ( not ( = ?auto_1578792 ?auto_1578798 ) ) ( not ( = ?auto_1578792 ?auto_1578799 ) ) ( not ( = ?auto_1578792 ?auto_1578800 ) ) ( not ( = ?auto_1578793 ?auto_1578794 ) ) ( not ( = ?auto_1578793 ?auto_1578795 ) ) ( not ( = ?auto_1578793 ?auto_1578796 ) ) ( not ( = ?auto_1578793 ?auto_1578797 ) ) ( not ( = ?auto_1578793 ?auto_1578798 ) ) ( not ( = ?auto_1578793 ?auto_1578799 ) ) ( not ( = ?auto_1578793 ?auto_1578800 ) ) ( not ( = ?auto_1578794 ?auto_1578795 ) ) ( not ( = ?auto_1578794 ?auto_1578796 ) ) ( not ( = ?auto_1578794 ?auto_1578797 ) ) ( not ( = ?auto_1578794 ?auto_1578798 ) ) ( not ( = ?auto_1578794 ?auto_1578799 ) ) ( not ( = ?auto_1578794 ?auto_1578800 ) ) ( not ( = ?auto_1578795 ?auto_1578796 ) ) ( not ( = ?auto_1578795 ?auto_1578797 ) ) ( not ( = ?auto_1578795 ?auto_1578798 ) ) ( not ( = ?auto_1578795 ?auto_1578799 ) ) ( not ( = ?auto_1578795 ?auto_1578800 ) ) ( not ( = ?auto_1578796 ?auto_1578797 ) ) ( not ( = ?auto_1578796 ?auto_1578798 ) ) ( not ( = ?auto_1578796 ?auto_1578799 ) ) ( not ( = ?auto_1578796 ?auto_1578800 ) ) ( not ( = ?auto_1578797 ?auto_1578798 ) ) ( not ( = ?auto_1578797 ?auto_1578799 ) ) ( not ( = ?auto_1578797 ?auto_1578800 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1578798 ?auto_1578799 ?auto_1578800 )
      ( MAKE-14CRATE-VERIFY ?auto_1578786 ?auto_1578787 ?auto_1578788 ?auto_1578789 ?auto_1578790 ?auto_1578791 ?auto_1578792 ?auto_1578793 ?auto_1578794 ?auto_1578795 ?auto_1578796 ?auto_1578797 ?auto_1578798 ?auto_1578799 ?auto_1578800 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1578961 - SURFACE
      ?auto_1578962 - SURFACE
      ?auto_1578963 - SURFACE
      ?auto_1578964 - SURFACE
      ?auto_1578965 - SURFACE
      ?auto_1578966 - SURFACE
      ?auto_1578967 - SURFACE
      ?auto_1578968 - SURFACE
      ?auto_1578969 - SURFACE
      ?auto_1578970 - SURFACE
      ?auto_1578971 - SURFACE
      ?auto_1578972 - SURFACE
      ?auto_1578973 - SURFACE
      ?auto_1578974 - SURFACE
      ?auto_1578975 - SURFACE
    )
    :vars
    (
      ?auto_1578976 - HOIST
      ?auto_1578977 - PLACE
      ?auto_1578979 - TRUCK
      ?auto_1578978 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1578976 ?auto_1578977 ) ( SURFACE-AT ?auto_1578974 ?auto_1578977 ) ( CLEAR ?auto_1578974 ) ( IS-CRATE ?auto_1578975 ) ( not ( = ?auto_1578974 ?auto_1578975 ) ) ( AVAILABLE ?auto_1578976 ) ( IN ?auto_1578975 ?auto_1578979 ) ( ON ?auto_1578974 ?auto_1578973 ) ( not ( = ?auto_1578973 ?auto_1578974 ) ) ( not ( = ?auto_1578973 ?auto_1578975 ) ) ( TRUCK-AT ?auto_1578979 ?auto_1578978 ) ( not ( = ?auto_1578978 ?auto_1578977 ) ) ( ON ?auto_1578962 ?auto_1578961 ) ( ON ?auto_1578963 ?auto_1578962 ) ( ON ?auto_1578964 ?auto_1578963 ) ( ON ?auto_1578965 ?auto_1578964 ) ( ON ?auto_1578966 ?auto_1578965 ) ( ON ?auto_1578967 ?auto_1578966 ) ( ON ?auto_1578968 ?auto_1578967 ) ( ON ?auto_1578969 ?auto_1578968 ) ( ON ?auto_1578970 ?auto_1578969 ) ( ON ?auto_1578971 ?auto_1578970 ) ( ON ?auto_1578972 ?auto_1578971 ) ( ON ?auto_1578973 ?auto_1578972 ) ( not ( = ?auto_1578961 ?auto_1578962 ) ) ( not ( = ?auto_1578961 ?auto_1578963 ) ) ( not ( = ?auto_1578961 ?auto_1578964 ) ) ( not ( = ?auto_1578961 ?auto_1578965 ) ) ( not ( = ?auto_1578961 ?auto_1578966 ) ) ( not ( = ?auto_1578961 ?auto_1578967 ) ) ( not ( = ?auto_1578961 ?auto_1578968 ) ) ( not ( = ?auto_1578961 ?auto_1578969 ) ) ( not ( = ?auto_1578961 ?auto_1578970 ) ) ( not ( = ?auto_1578961 ?auto_1578971 ) ) ( not ( = ?auto_1578961 ?auto_1578972 ) ) ( not ( = ?auto_1578961 ?auto_1578973 ) ) ( not ( = ?auto_1578961 ?auto_1578974 ) ) ( not ( = ?auto_1578961 ?auto_1578975 ) ) ( not ( = ?auto_1578962 ?auto_1578963 ) ) ( not ( = ?auto_1578962 ?auto_1578964 ) ) ( not ( = ?auto_1578962 ?auto_1578965 ) ) ( not ( = ?auto_1578962 ?auto_1578966 ) ) ( not ( = ?auto_1578962 ?auto_1578967 ) ) ( not ( = ?auto_1578962 ?auto_1578968 ) ) ( not ( = ?auto_1578962 ?auto_1578969 ) ) ( not ( = ?auto_1578962 ?auto_1578970 ) ) ( not ( = ?auto_1578962 ?auto_1578971 ) ) ( not ( = ?auto_1578962 ?auto_1578972 ) ) ( not ( = ?auto_1578962 ?auto_1578973 ) ) ( not ( = ?auto_1578962 ?auto_1578974 ) ) ( not ( = ?auto_1578962 ?auto_1578975 ) ) ( not ( = ?auto_1578963 ?auto_1578964 ) ) ( not ( = ?auto_1578963 ?auto_1578965 ) ) ( not ( = ?auto_1578963 ?auto_1578966 ) ) ( not ( = ?auto_1578963 ?auto_1578967 ) ) ( not ( = ?auto_1578963 ?auto_1578968 ) ) ( not ( = ?auto_1578963 ?auto_1578969 ) ) ( not ( = ?auto_1578963 ?auto_1578970 ) ) ( not ( = ?auto_1578963 ?auto_1578971 ) ) ( not ( = ?auto_1578963 ?auto_1578972 ) ) ( not ( = ?auto_1578963 ?auto_1578973 ) ) ( not ( = ?auto_1578963 ?auto_1578974 ) ) ( not ( = ?auto_1578963 ?auto_1578975 ) ) ( not ( = ?auto_1578964 ?auto_1578965 ) ) ( not ( = ?auto_1578964 ?auto_1578966 ) ) ( not ( = ?auto_1578964 ?auto_1578967 ) ) ( not ( = ?auto_1578964 ?auto_1578968 ) ) ( not ( = ?auto_1578964 ?auto_1578969 ) ) ( not ( = ?auto_1578964 ?auto_1578970 ) ) ( not ( = ?auto_1578964 ?auto_1578971 ) ) ( not ( = ?auto_1578964 ?auto_1578972 ) ) ( not ( = ?auto_1578964 ?auto_1578973 ) ) ( not ( = ?auto_1578964 ?auto_1578974 ) ) ( not ( = ?auto_1578964 ?auto_1578975 ) ) ( not ( = ?auto_1578965 ?auto_1578966 ) ) ( not ( = ?auto_1578965 ?auto_1578967 ) ) ( not ( = ?auto_1578965 ?auto_1578968 ) ) ( not ( = ?auto_1578965 ?auto_1578969 ) ) ( not ( = ?auto_1578965 ?auto_1578970 ) ) ( not ( = ?auto_1578965 ?auto_1578971 ) ) ( not ( = ?auto_1578965 ?auto_1578972 ) ) ( not ( = ?auto_1578965 ?auto_1578973 ) ) ( not ( = ?auto_1578965 ?auto_1578974 ) ) ( not ( = ?auto_1578965 ?auto_1578975 ) ) ( not ( = ?auto_1578966 ?auto_1578967 ) ) ( not ( = ?auto_1578966 ?auto_1578968 ) ) ( not ( = ?auto_1578966 ?auto_1578969 ) ) ( not ( = ?auto_1578966 ?auto_1578970 ) ) ( not ( = ?auto_1578966 ?auto_1578971 ) ) ( not ( = ?auto_1578966 ?auto_1578972 ) ) ( not ( = ?auto_1578966 ?auto_1578973 ) ) ( not ( = ?auto_1578966 ?auto_1578974 ) ) ( not ( = ?auto_1578966 ?auto_1578975 ) ) ( not ( = ?auto_1578967 ?auto_1578968 ) ) ( not ( = ?auto_1578967 ?auto_1578969 ) ) ( not ( = ?auto_1578967 ?auto_1578970 ) ) ( not ( = ?auto_1578967 ?auto_1578971 ) ) ( not ( = ?auto_1578967 ?auto_1578972 ) ) ( not ( = ?auto_1578967 ?auto_1578973 ) ) ( not ( = ?auto_1578967 ?auto_1578974 ) ) ( not ( = ?auto_1578967 ?auto_1578975 ) ) ( not ( = ?auto_1578968 ?auto_1578969 ) ) ( not ( = ?auto_1578968 ?auto_1578970 ) ) ( not ( = ?auto_1578968 ?auto_1578971 ) ) ( not ( = ?auto_1578968 ?auto_1578972 ) ) ( not ( = ?auto_1578968 ?auto_1578973 ) ) ( not ( = ?auto_1578968 ?auto_1578974 ) ) ( not ( = ?auto_1578968 ?auto_1578975 ) ) ( not ( = ?auto_1578969 ?auto_1578970 ) ) ( not ( = ?auto_1578969 ?auto_1578971 ) ) ( not ( = ?auto_1578969 ?auto_1578972 ) ) ( not ( = ?auto_1578969 ?auto_1578973 ) ) ( not ( = ?auto_1578969 ?auto_1578974 ) ) ( not ( = ?auto_1578969 ?auto_1578975 ) ) ( not ( = ?auto_1578970 ?auto_1578971 ) ) ( not ( = ?auto_1578970 ?auto_1578972 ) ) ( not ( = ?auto_1578970 ?auto_1578973 ) ) ( not ( = ?auto_1578970 ?auto_1578974 ) ) ( not ( = ?auto_1578970 ?auto_1578975 ) ) ( not ( = ?auto_1578971 ?auto_1578972 ) ) ( not ( = ?auto_1578971 ?auto_1578973 ) ) ( not ( = ?auto_1578971 ?auto_1578974 ) ) ( not ( = ?auto_1578971 ?auto_1578975 ) ) ( not ( = ?auto_1578972 ?auto_1578973 ) ) ( not ( = ?auto_1578972 ?auto_1578974 ) ) ( not ( = ?auto_1578972 ?auto_1578975 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1578973 ?auto_1578974 ?auto_1578975 )
      ( MAKE-14CRATE-VERIFY ?auto_1578961 ?auto_1578962 ?auto_1578963 ?auto_1578964 ?auto_1578965 ?auto_1578966 ?auto_1578967 ?auto_1578968 ?auto_1578969 ?auto_1578970 ?auto_1578971 ?auto_1578972 ?auto_1578973 ?auto_1578974 ?auto_1578975 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1579150 - SURFACE
      ?auto_1579151 - SURFACE
      ?auto_1579152 - SURFACE
      ?auto_1579153 - SURFACE
      ?auto_1579154 - SURFACE
      ?auto_1579155 - SURFACE
      ?auto_1579156 - SURFACE
      ?auto_1579157 - SURFACE
      ?auto_1579158 - SURFACE
      ?auto_1579159 - SURFACE
      ?auto_1579160 - SURFACE
      ?auto_1579161 - SURFACE
      ?auto_1579162 - SURFACE
      ?auto_1579163 - SURFACE
      ?auto_1579164 - SURFACE
    )
    :vars
    (
      ?auto_1579165 - HOIST
      ?auto_1579169 - PLACE
      ?auto_1579166 - TRUCK
      ?auto_1579168 - PLACE
      ?auto_1579167 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1579165 ?auto_1579169 ) ( SURFACE-AT ?auto_1579163 ?auto_1579169 ) ( CLEAR ?auto_1579163 ) ( IS-CRATE ?auto_1579164 ) ( not ( = ?auto_1579163 ?auto_1579164 ) ) ( AVAILABLE ?auto_1579165 ) ( ON ?auto_1579163 ?auto_1579162 ) ( not ( = ?auto_1579162 ?auto_1579163 ) ) ( not ( = ?auto_1579162 ?auto_1579164 ) ) ( TRUCK-AT ?auto_1579166 ?auto_1579168 ) ( not ( = ?auto_1579168 ?auto_1579169 ) ) ( HOIST-AT ?auto_1579167 ?auto_1579168 ) ( LIFTING ?auto_1579167 ?auto_1579164 ) ( not ( = ?auto_1579165 ?auto_1579167 ) ) ( ON ?auto_1579151 ?auto_1579150 ) ( ON ?auto_1579152 ?auto_1579151 ) ( ON ?auto_1579153 ?auto_1579152 ) ( ON ?auto_1579154 ?auto_1579153 ) ( ON ?auto_1579155 ?auto_1579154 ) ( ON ?auto_1579156 ?auto_1579155 ) ( ON ?auto_1579157 ?auto_1579156 ) ( ON ?auto_1579158 ?auto_1579157 ) ( ON ?auto_1579159 ?auto_1579158 ) ( ON ?auto_1579160 ?auto_1579159 ) ( ON ?auto_1579161 ?auto_1579160 ) ( ON ?auto_1579162 ?auto_1579161 ) ( not ( = ?auto_1579150 ?auto_1579151 ) ) ( not ( = ?auto_1579150 ?auto_1579152 ) ) ( not ( = ?auto_1579150 ?auto_1579153 ) ) ( not ( = ?auto_1579150 ?auto_1579154 ) ) ( not ( = ?auto_1579150 ?auto_1579155 ) ) ( not ( = ?auto_1579150 ?auto_1579156 ) ) ( not ( = ?auto_1579150 ?auto_1579157 ) ) ( not ( = ?auto_1579150 ?auto_1579158 ) ) ( not ( = ?auto_1579150 ?auto_1579159 ) ) ( not ( = ?auto_1579150 ?auto_1579160 ) ) ( not ( = ?auto_1579150 ?auto_1579161 ) ) ( not ( = ?auto_1579150 ?auto_1579162 ) ) ( not ( = ?auto_1579150 ?auto_1579163 ) ) ( not ( = ?auto_1579150 ?auto_1579164 ) ) ( not ( = ?auto_1579151 ?auto_1579152 ) ) ( not ( = ?auto_1579151 ?auto_1579153 ) ) ( not ( = ?auto_1579151 ?auto_1579154 ) ) ( not ( = ?auto_1579151 ?auto_1579155 ) ) ( not ( = ?auto_1579151 ?auto_1579156 ) ) ( not ( = ?auto_1579151 ?auto_1579157 ) ) ( not ( = ?auto_1579151 ?auto_1579158 ) ) ( not ( = ?auto_1579151 ?auto_1579159 ) ) ( not ( = ?auto_1579151 ?auto_1579160 ) ) ( not ( = ?auto_1579151 ?auto_1579161 ) ) ( not ( = ?auto_1579151 ?auto_1579162 ) ) ( not ( = ?auto_1579151 ?auto_1579163 ) ) ( not ( = ?auto_1579151 ?auto_1579164 ) ) ( not ( = ?auto_1579152 ?auto_1579153 ) ) ( not ( = ?auto_1579152 ?auto_1579154 ) ) ( not ( = ?auto_1579152 ?auto_1579155 ) ) ( not ( = ?auto_1579152 ?auto_1579156 ) ) ( not ( = ?auto_1579152 ?auto_1579157 ) ) ( not ( = ?auto_1579152 ?auto_1579158 ) ) ( not ( = ?auto_1579152 ?auto_1579159 ) ) ( not ( = ?auto_1579152 ?auto_1579160 ) ) ( not ( = ?auto_1579152 ?auto_1579161 ) ) ( not ( = ?auto_1579152 ?auto_1579162 ) ) ( not ( = ?auto_1579152 ?auto_1579163 ) ) ( not ( = ?auto_1579152 ?auto_1579164 ) ) ( not ( = ?auto_1579153 ?auto_1579154 ) ) ( not ( = ?auto_1579153 ?auto_1579155 ) ) ( not ( = ?auto_1579153 ?auto_1579156 ) ) ( not ( = ?auto_1579153 ?auto_1579157 ) ) ( not ( = ?auto_1579153 ?auto_1579158 ) ) ( not ( = ?auto_1579153 ?auto_1579159 ) ) ( not ( = ?auto_1579153 ?auto_1579160 ) ) ( not ( = ?auto_1579153 ?auto_1579161 ) ) ( not ( = ?auto_1579153 ?auto_1579162 ) ) ( not ( = ?auto_1579153 ?auto_1579163 ) ) ( not ( = ?auto_1579153 ?auto_1579164 ) ) ( not ( = ?auto_1579154 ?auto_1579155 ) ) ( not ( = ?auto_1579154 ?auto_1579156 ) ) ( not ( = ?auto_1579154 ?auto_1579157 ) ) ( not ( = ?auto_1579154 ?auto_1579158 ) ) ( not ( = ?auto_1579154 ?auto_1579159 ) ) ( not ( = ?auto_1579154 ?auto_1579160 ) ) ( not ( = ?auto_1579154 ?auto_1579161 ) ) ( not ( = ?auto_1579154 ?auto_1579162 ) ) ( not ( = ?auto_1579154 ?auto_1579163 ) ) ( not ( = ?auto_1579154 ?auto_1579164 ) ) ( not ( = ?auto_1579155 ?auto_1579156 ) ) ( not ( = ?auto_1579155 ?auto_1579157 ) ) ( not ( = ?auto_1579155 ?auto_1579158 ) ) ( not ( = ?auto_1579155 ?auto_1579159 ) ) ( not ( = ?auto_1579155 ?auto_1579160 ) ) ( not ( = ?auto_1579155 ?auto_1579161 ) ) ( not ( = ?auto_1579155 ?auto_1579162 ) ) ( not ( = ?auto_1579155 ?auto_1579163 ) ) ( not ( = ?auto_1579155 ?auto_1579164 ) ) ( not ( = ?auto_1579156 ?auto_1579157 ) ) ( not ( = ?auto_1579156 ?auto_1579158 ) ) ( not ( = ?auto_1579156 ?auto_1579159 ) ) ( not ( = ?auto_1579156 ?auto_1579160 ) ) ( not ( = ?auto_1579156 ?auto_1579161 ) ) ( not ( = ?auto_1579156 ?auto_1579162 ) ) ( not ( = ?auto_1579156 ?auto_1579163 ) ) ( not ( = ?auto_1579156 ?auto_1579164 ) ) ( not ( = ?auto_1579157 ?auto_1579158 ) ) ( not ( = ?auto_1579157 ?auto_1579159 ) ) ( not ( = ?auto_1579157 ?auto_1579160 ) ) ( not ( = ?auto_1579157 ?auto_1579161 ) ) ( not ( = ?auto_1579157 ?auto_1579162 ) ) ( not ( = ?auto_1579157 ?auto_1579163 ) ) ( not ( = ?auto_1579157 ?auto_1579164 ) ) ( not ( = ?auto_1579158 ?auto_1579159 ) ) ( not ( = ?auto_1579158 ?auto_1579160 ) ) ( not ( = ?auto_1579158 ?auto_1579161 ) ) ( not ( = ?auto_1579158 ?auto_1579162 ) ) ( not ( = ?auto_1579158 ?auto_1579163 ) ) ( not ( = ?auto_1579158 ?auto_1579164 ) ) ( not ( = ?auto_1579159 ?auto_1579160 ) ) ( not ( = ?auto_1579159 ?auto_1579161 ) ) ( not ( = ?auto_1579159 ?auto_1579162 ) ) ( not ( = ?auto_1579159 ?auto_1579163 ) ) ( not ( = ?auto_1579159 ?auto_1579164 ) ) ( not ( = ?auto_1579160 ?auto_1579161 ) ) ( not ( = ?auto_1579160 ?auto_1579162 ) ) ( not ( = ?auto_1579160 ?auto_1579163 ) ) ( not ( = ?auto_1579160 ?auto_1579164 ) ) ( not ( = ?auto_1579161 ?auto_1579162 ) ) ( not ( = ?auto_1579161 ?auto_1579163 ) ) ( not ( = ?auto_1579161 ?auto_1579164 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1579162 ?auto_1579163 ?auto_1579164 )
      ( MAKE-14CRATE-VERIFY ?auto_1579150 ?auto_1579151 ?auto_1579152 ?auto_1579153 ?auto_1579154 ?auto_1579155 ?auto_1579156 ?auto_1579157 ?auto_1579158 ?auto_1579159 ?auto_1579160 ?auto_1579161 ?auto_1579162 ?auto_1579163 ?auto_1579164 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1579353 - SURFACE
      ?auto_1579354 - SURFACE
      ?auto_1579355 - SURFACE
      ?auto_1579356 - SURFACE
      ?auto_1579357 - SURFACE
      ?auto_1579358 - SURFACE
      ?auto_1579359 - SURFACE
      ?auto_1579360 - SURFACE
      ?auto_1579361 - SURFACE
      ?auto_1579362 - SURFACE
      ?auto_1579363 - SURFACE
      ?auto_1579364 - SURFACE
      ?auto_1579365 - SURFACE
      ?auto_1579366 - SURFACE
      ?auto_1579367 - SURFACE
    )
    :vars
    (
      ?auto_1579368 - HOIST
      ?auto_1579371 - PLACE
      ?auto_1579372 - TRUCK
      ?auto_1579369 - PLACE
      ?auto_1579373 - HOIST
      ?auto_1579370 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1579368 ?auto_1579371 ) ( SURFACE-AT ?auto_1579366 ?auto_1579371 ) ( CLEAR ?auto_1579366 ) ( IS-CRATE ?auto_1579367 ) ( not ( = ?auto_1579366 ?auto_1579367 ) ) ( AVAILABLE ?auto_1579368 ) ( ON ?auto_1579366 ?auto_1579365 ) ( not ( = ?auto_1579365 ?auto_1579366 ) ) ( not ( = ?auto_1579365 ?auto_1579367 ) ) ( TRUCK-AT ?auto_1579372 ?auto_1579369 ) ( not ( = ?auto_1579369 ?auto_1579371 ) ) ( HOIST-AT ?auto_1579373 ?auto_1579369 ) ( not ( = ?auto_1579368 ?auto_1579373 ) ) ( AVAILABLE ?auto_1579373 ) ( SURFACE-AT ?auto_1579367 ?auto_1579369 ) ( ON ?auto_1579367 ?auto_1579370 ) ( CLEAR ?auto_1579367 ) ( not ( = ?auto_1579366 ?auto_1579370 ) ) ( not ( = ?auto_1579367 ?auto_1579370 ) ) ( not ( = ?auto_1579365 ?auto_1579370 ) ) ( ON ?auto_1579354 ?auto_1579353 ) ( ON ?auto_1579355 ?auto_1579354 ) ( ON ?auto_1579356 ?auto_1579355 ) ( ON ?auto_1579357 ?auto_1579356 ) ( ON ?auto_1579358 ?auto_1579357 ) ( ON ?auto_1579359 ?auto_1579358 ) ( ON ?auto_1579360 ?auto_1579359 ) ( ON ?auto_1579361 ?auto_1579360 ) ( ON ?auto_1579362 ?auto_1579361 ) ( ON ?auto_1579363 ?auto_1579362 ) ( ON ?auto_1579364 ?auto_1579363 ) ( ON ?auto_1579365 ?auto_1579364 ) ( not ( = ?auto_1579353 ?auto_1579354 ) ) ( not ( = ?auto_1579353 ?auto_1579355 ) ) ( not ( = ?auto_1579353 ?auto_1579356 ) ) ( not ( = ?auto_1579353 ?auto_1579357 ) ) ( not ( = ?auto_1579353 ?auto_1579358 ) ) ( not ( = ?auto_1579353 ?auto_1579359 ) ) ( not ( = ?auto_1579353 ?auto_1579360 ) ) ( not ( = ?auto_1579353 ?auto_1579361 ) ) ( not ( = ?auto_1579353 ?auto_1579362 ) ) ( not ( = ?auto_1579353 ?auto_1579363 ) ) ( not ( = ?auto_1579353 ?auto_1579364 ) ) ( not ( = ?auto_1579353 ?auto_1579365 ) ) ( not ( = ?auto_1579353 ?auto_1579366 ) ) ( not ( = ?auto_1579353 ?auto_1579367 ) ) ( not ( = ?auto_1579353 ?auto_1579370 ) ) ( not ( = ?auto_1579354 ?auto_1579355 ) ) ( not ( = ?auto_1579354 ?auto_1579356 ) ) ( not ( = ?auto_1579354 ?auto_1579357 ) ) ( not ( = ?auto_1579354 ?auto_1579358 ) ) ( not ( = ?auto_1579354 ?auto_1579359 ) ) ( not ( = ?auto_1579354 ?auto_1579360 ) ) ( not ( = ?auto_1579354 ?auto_1579361 ) ) ( not ( = ?auto_1579354 ?auto_1579362 ) ) ( not ( = ?auto_1579354 ?auto_1579363 ) ) ( not ( = ?auto_1579354 ?auto_1579364 ) ) ( not ( = ?auto_1579354 ?auto_1579365 ) ) ( not ( = ?auto_1579354 ?auto_1579366 ) ) ( not ( = ?auto_1579354 ?auto_1579367 ) ) ( not ( = ?auto_1579354 ?auto_1579370 ) ) ( not ( = ?auto_1579355 ?auto_1579356 ) ) ( not ( = ?auto_1579355 ?auto_1579357 ) ) ( not ( = ?auto_1579355 ?auto_1579358 ) ) ( not ( = ?auto_1579355 ?auto_1579359 ) ) ( not ( = ?auto_1579355 ?auto_1579360 ) ) ( not ( = ?auto_1579355 ?auto_1579361 ) ) ( not ( = ?auto_1579355 ?auto_1579362 ) ) ( not ( = ?auto_1579355 ?auto_1579363 ) ) ( not ( = ?auto_1579355 ?auto_1579364 ) ) ( not ( = ?auto_1579355 ?auto_1579365 ) ) ( not ( = ?auto_1579355 ?auto_1579366 ) ) ( not ( = ?auto_1579355 ?auto_1579367 ) ) ( not ( = ?auto_1579355 ?auto_1579370 ) ) ( not ( = ?auto_1579356 ?auto_1579357 ) ) ( not ( = ?auto_1579356 ?auto_1579358 ) ) ( not ( = ?auto_1579356 ?auto_1579359 ) ) ( not ( = ?auto_1579356 ?auto_1579360 ) ) ( not ( = ?auto_1579356 ?auto_1579361 ) ) ( not ( = ?auto_1579356 ?auto_1579362 ) ) ( not ( = ?auto_1579356 ?auto_1579363 ) ) ( not ( = ?auto_1579356 ?auto_1579364 ) ) ( not ( = ?auto_1579356 ?auto_1579365 ) ) ( not ( = ?auto_1579356 ?auto_1579366 ) ) ( not ( = ?auto_1579356 ?auto_1579367 ) ) ( not ( = ?auto_1579356 ?auto_1579370 ) ) ( not ( = ?auto_1579357 ?auto_1579358 ) ) ( not ( = ?auto_1579357 ?auto_1579359 ) ) ( not ( = ?auto_1579357 ?auto_1579360 ) ) ( not ( = ?auto_1579357 ?auto_1579361 ) ) ( not ( = ?auto_1579357 ?auto_1579362 ) ) ( not ( = ?auto_1579357 ?auto_1579363 ) ) ( not ( = ?auto_1579357 ?auto_1579364 ) ) ( not ( = ?auto_1579357 ?auto_1579365 ) ) ( not ( = ?auto_1579357 ?auto_1579366 ) ) ( not ( = ?auto_1579357 ?auto_1579367 ) ) ( not ( = ?auto_1579357 ?auto_1579370 ) ) ( not ( = ?auto_1579358 ?auto_1579359 ) ) ( not ( = ?auto_1579358 ?auto_1579360 ) ) ( not ( = ?auto_1579358 ?auto_1579361 ) ) ( not ( = ?auto_1579358 ?auto_1579362 ) ) ( not ( = ?auto_1579358 ?auto_1579363 ) ) ( not ( = ?auto_1579358 ?auto_1579364 ) ) ( not ( = ?auto_1579358 ?auto_1579365 ) ) ( not ( = ?auto_1579358 ?auto_1579366 ) ) ( not ( = ?auto_1579358 ?auto_1579367 ) ) ( not ( = ?auto_1579358 ?auto_1579370 ) ) ( not ( = ?auto_1579359 ?auto_1579360 ) ) ( not ( = ?auto_1579359 ?auto_1579361 ) ) ( not ( = ?auto_1579359 ?auto_1579362 ) ) ( not ( = ?auto_1579359 ?auto_1579363 ) ) ( not ( = ?auto_1579359 ?auto_1579364 ) ) ( not ( = ?auto_1579359 ?auto_1579365 ) ) ( not ( = ?auto_1579359 ?auto_1579366 ) ) ( not ( = ?auto_1579359 ?auto_1579367 ) ) ( not ( = ?auto_1579359 ?auto_1579370 ) ) ( not ( = ?auto_1579360 ?auto_1579361 ) ) ( not ( = ?auto_1579360 ?auto_1579362 ) ) ( not ( = ?auto_1579360 ?auto_1579363 ) ) ( not ( = ?auto_1579360 ?auto_1579364 ) ) ( not ( = ?auto_1579360 ?auto_1579365 ) ) ( not ( = ?auto_1579360 ?auto_1579366 ) ) ( not ( = ?auto_1579360 ?auto_1579367 ) ) ( not ( = ?auto_1579360 ?auto_1579370 ) ) ( not ( = ?auto_1579361 ?auto_1579362 ) ) ( not ( = ?auto_1579361 ?auto_1579363 ) ) ( not ( = ?auto_1579361 ?auto_1579364 ) ) ( not ( = ?auto_1579361 ?auto_1579365 ) ) ( not ( = ?auto_1579361 ?auto_1579366 ) ) ( not ( = ?auto_1579361 ?auto_1579367 ) ) ( not ( = ?auto_1579361 ?auto_1579370 ) ) ( not ( = ?auto_1579362 ?auto_1579363 ) ) ( not ( = ?auto_1579362 ?auto_1579364 ) ) ( not ( = ?auto_1579362 ?auto_1579365 ) ) ( not ( = ?auto_1579362 ?auto_1579366 ) ) ( not ( = ?auto_1579362 ?auto_1579367 ) ) ( not ( = ?auto_1579362 ?auto_1579370 ) ) ( not ( = ?auto_1579363 ?auto_1579364 ) ) ( not ( = ?auto_1579363 ?auto_1579365 ) ) ( not ( = ?auto_1579363 ?auto_1579366 ) ) ( not ( = ?auto_1579363 ?auto_1579367 ) ) ( not ( = ?auto_1579363 ?auto_1579370 ) ) ( not ( = ?auto_1579364 ?auto_1579365 ) ) ( not ( = ?auto_1579364 ?auto_1579366 ) ) ( not ( = ?auto_1579364 ?auto_1579367 ) ) ( not ( = ?auto_1579364 ?auto_1579370 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1579365 ?auto_1579366 ?auto_1579367 )
      ( MAKE-14CRATE-VERIFY ?auto_1579353 ?auto_1579354 ?auto_1579355 ?auto_1579356 ?auto_1579357 ?auto_1579358 ?auto_1579359 ?auto_1579360 ?auto_1579361 ?auto_1579362 ?auto_1579363 ?auto_1579364 ?auto_1579365 ?auto_1579366 ?auto_1579367 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1579557 - SURFACE
      ?auto_1579558 - SURFACE
      ?auto_1579559 - SURFACE
      ?auto_1579560 - SURFACE
      ?auto_1579561 - SURFACE
      ?auto_1579562 - SURFACE
      ?auto_1579563 - SURFACE
      ?auto_1579564 - SURFACE
      ?auto_1579565 - SURFACE
      ?auto_1579566 - SURFACE
      ?auto_1579567 - SURFACE
      ?auto_1579568 - SURFACE
      ?auto_1579569 - SURFACE
      ?auto_1579570 - SURFACE
      ?auto_1579571 - SURFACE
    )
    :vars
    (
      ?auto_1579575 - HOIST
      ?auto_1579577 - PLACE
      ?auto_1579576 - PLACE
      ?auto_1579573 - HOIST
      ?auto_1579572 - SURFACE
      ?auto_1579574 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1579575 ?auto_1579577 ) ( SURFACE-AT ?auto_1579570 ?auto_1579577 ) ( CLEAR ?auto_1579570 ) ( IS-CRATE ?auto_1579571 ) ( not ( = ?auto_1579570 ?auto_1579571 ) ) ( AVAILABLE ?auto_1579575 ) ( ON ?auto_1579570 ?auto_1579569 ) ( not ( = ?auto_1579569 ?auto_1579570 ) ) ( not ( = ?auto_1579569 ?auto_1579571 ) ) ( not ( = ?auto_1579576 ?auto_1579577 ) ) ( HOIST-AT ?auto_1579573 ?auto_1579576 ) ( not ( = ?auto_1579575 ?auto_1579573 ) ) ( AVAILABLE ?auto_1579573 ) ( SURFACE-AT ?auto_1579571 ?auto_1579576 ) ( ON ?auto_1579571 ?auto_1579572 ) ( CLEAR ?auto_1579571 ) ( not ( = ?auto_1579570 ?auto_1579572 ) ) ( not ( = ?auto_1579571 ?auto_1579572 ) ) ( not ( = ?auto_1579569 ?auto_1579572 ) ) ( TRUCK-AT ?auto_1579574 ?auto_1579577 ) ( ON ?auto_1579558 ?auto_1579557 ) ( ON ?auto_1579559 ?auto_1579558 ) ( ON ?auto_1579560 ?auto_1579559 ) ( ON ?auto_1579561 ?auto_1579560 ) ( ON ?auto_1579562 ?auto_1579561 ) ( ON ?auto_1579563 ?auto_1579562 ) ( ON ?auto_1579564 ?auto_1579563 ) ( ON ?auto_1579565 ?auto_1579564 ) ( ON ?auto_1579566 ?auto_1579565 ) ( ON ?auto_1579567 ?auto_1579566 ) ( ON ?auto_1579568 ?auto_1579567 ) ( ON ?auto_1579569 ?auto_1579568 ) ( not ( = ?auto_1579557 ?auto_1579558 ) ) ( not ( = ?auto_1579557 ?auto_1579559 ) ) ( not ( = ?auto_1579557 ?auto_1579560 ) ) ( not ( = ?auto_1579557 ?auto_1579561 ) ) ( not ( = ?auto_1579557 ?auto_1579562 ) ) ( not ( = ?auto_1579557 ?auto_1579563 ) ) ( not ( = ?auto_1579557 ?auto_1579564 ) ) ( not ( = ?auto_1579557 ?auto_1579565 ) ) ( not ( = ?auto_1579557 ?auto_1579566 ) ) ( not ( = ?auto_1579557 ?auto_1579567 ) ) ( not ( = ?auto_1579557 ?auto_1579568 ) ) ( not ( = ?auto_1579557 ?auto_1579569 ) ) ( not ( = ?auto_1579557 ?auto_1579570 ) ) ( not ( = ?auto_1579557 ?auto_1579571 ) ) ( not ( = ?auto_1579557 ?auto_1579572 ) ) ( not ( = ?auto_1579558 ?auto_1579559 ) ) ( not ( = ?auto_1579558 ?auto_1579560 ) ) ( not ( = ?auto_1579558 ?auto_1579561 ) ) ( not ( = ?auto_1579558 ?auto_1579562 ) ) ( not ( = ?auto_1579558 ?auto_1579563 ) ) ( not ( = ?auto_1579558 ?auto_1579564 ) ) ( not ( = ?auto_1579558 ?auto_1579565 ) ) ( not ( = ?auto_1579558 ?auto_1579566 ) ) ( not ( = ?auto_1579558 ?auto_1579567 ) ) ( not ( = ?auto_1579558 ?auto_1579568 ) ) ( not ( = ?auto_1579558 ?auto_1579569 ) ) ( not ( = ?auto_1579558 ?auto_1579570 ) ) ( not ( = ?auto_1579558 ?auto_1579571 ) ) ( not ( = ?auto_1579558 ?auto_1579572 ) ) ( not ( = ?auto_1579559 ?auto_1579560 ) ) ( not ( = ?auto_1579559 ?auto_1579561 ) ) ( not ( = ?auto_1579559 ?auto_1579562 ) ) ( not ( = ?auto_1579559 ?auto_1579563 ) ) ( not ( = ?auto_1579559 ?auto_1579564 ) ) ( not ( = ?auto_1579559 ?auto_1579565 ) ) ( not ( = ?auto_1579559 ?auto_1579566 ) ) ( not ( = ?auto_1579559 ?auto_1579567 ) ) ( not ( = ?auto_1579559 ?auto_1579568 ) ) ( not ( = ?auto_1579559 ?auto_1579569 ) ) ( not ( = ?auto_1579559 ?auto_1579570 ) ) ( not ( = ?auto_1579559 ?auto_1579571 ) ) ( not ( = ?auto_1579559 ?auto_1579572 ) ) ( not ( = ?auto_1579560 ?auto_1579561 ) ) ( not ( = ?auto_1579560 ?auto_1579562 ) ) ( not ( = ?auto_1579560 ?auto_1579563 ) ) ( not ( = ?auto_1579560 ?auto_1579564 ) ) ( not ( = ?auto_1579560 ?auto_1579565 ) ) ( not ( = ?auto_1579560 ?auto_1579566 ) ) ( not ( = ?auto_1579560 ?auto_1579567 ) ) ( not ( = ?auto_1579560 ?auto_1579568 ) ) ( not ( = ?auto_1579560 ?auto_1579569 ) ) ( not ( = ?auto_1579560 ?auto_1579570 ) ) ( not ( = ?auto_1579560 ?auto_1579571 ) ) ( not ( = ?auto_1579560 ?auto_1579572 ) ) ( not ( = ?auto_1579561 ?auto_1579562 ) ) ( not ( = ?auto_1579561 ?auto_1579563 ) ) ( not ( = ?auto_1579561 ?auto_1579564 ) ) ( not ( = ?auto_1579561 ?auto_1579565 ) ) ( not ( = ?auto_1579561 ?auto_1579566 ) ) ( not ( = ?auto_1579561 ?auto_1579567 ) ) ( not ( = ?auto_1579561 ?auto_1579568 ) ) ( not ( = ?auto_1579561 ?auto_1579569 ) ) ( not ( = ?auto_1579561 ?auto_1579570 ) ) ( not ( = ?auto_1579561 ?auto_1579571 ) ) ( not ( = ?auto_1579561 ?auto_1579572 ) ) ( not ( = ?auto_1579562 ?auto_1579563 ) ) ( not ( = ?auto_1579562 ?auto_1579564 ) ) ( not ( = ?auto_1579562 ?auto_1579565 ) ) ( not ( = ?auto_1579562 ?auto_1579566 ) ) ( not ( = ?auto_1579562 ?auto_1579567 ) ) ( not ( = ?auto_1579562 ?auto_1579568 ) ) ( not ( = ?auto_1579562 ?auto_1579569 ) ) ( not ( = ?auto_1579562 ?auto_1579570 ) ) ( not ( = ?auto_1579562 ?auto_1579571 ) ) ( not ( = ?auto_1579562 ?auto_1579572 ) ) ( not ( = ?auto_1579563 ?auto_1579564 ) ) ( not ( = ?auto_1579563 ?auto_1579565 ) ) ( not ( = ?auto_1579563 ?auto_1579566 ) ) ( not ( = ?auto_1579563 ?auto_1579567 ) ) ( not ( = ?auto_1579563 ?auto_1579568 ) ) ( not ( = ?auto_1579563 ?auto_1579569 ) ) ( not ( = ?auto_1579563 ?auto_1579570 ) ) ( not ( = ?auto_1579563 ?auto_1579571 ) ) ( not ( = ?auto_1579563 ?auto_1579572 ) ) ( not ( = ?auto_1579564 ?auto_1579565 ) ) ( not ( = ?auto_1579564 ?auto_1579566 ) ) ( not ( = ?auto_1579564 ?auto_1579567 ) ) ( not ( = ?auto_1579564 ?auto_1579568 ) ) ( not ( = ?auto_1579564 ?auto_1579569 ) ) ( not ( = ?auto_1579564 ?auto_1579570 ) ) ( not ( = ?auto_1579564 ?auto_1579571 ) ) ( not ( = ?auto_1579564 ?auto_1579572 ) ) ( not ( = ?auto_1579565 ?auto_1579566 ) ) ( not ( = ?auto_1579565 ?auto_1579567 ) ) ( not ( = ?auto_1579565 ?auto_1579568 ) ) ( not ( = ?auto_1579565 ?auto_1579569 ) ) ( not ( = ?auto_1579565 ?auto_1579570 ) ) ( not ( = ?auto_1579565 ?auto_1579571 ) ) ( not ( = ?auto_1579565 ?auto_1579572 ) ) ( not ( = ?auto_1579566 ?auto_1579567 ) ) ( not ( = ?auto_1579566 ?auto_1579568 ) ) ( not ( = ?auto_1579566 ?auto_1579569 ) ) ( not ( = ?auto_1579566 ?auto_1579570 ) ) ( not ( = ?auto_1579566 ?auto_1579571 ) ) ( not ( = ?auto_1579566 ?auto_1579572 ) ) ( not ( = ?auto_1579567 ?auto_1579568 ) ) ( not ( = ?auto_1579567 ?auto_1579569 ) ) ( not ( = ?auto_1579567 ?auto_1579570 ) ) ( not ( = ?auto_1579567 ?auto_1579571 ) ) ( not ( = ?auto_1579567 ?auto_1579572 ) ) ( not ( = ?auto_1579568 ?auto_1579569 ) ) ( not ( = ?auto_1579568 ?auto_1579570 ) ) ( not ( = ?auto_1579568 ?auto_1579571 ) ) ( not ( = ?auto_1579568 ?auto_1579572 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1579569 ?auto_1579570 ?auto_1579571 )
      ( MAKE-14CRATE-VERIFY ?auto_1579557 ?auto_1579558 ?auto_1579559 ?auto_1579560 ?auto_1579561 ?auto_1579562 ?auto_1579563 ?auto_1579564 ?auto_1579565 ?auto_1579566 ?auto_1579567 ?auto_1579568 ?auto_1579569 ?auto_1579570 ?auto_1579571 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1579761 - SURFACE
      ?auto_1579762 - SURFACE
      ?auto_1579763 - SURFACE
      ?auto_1579764 - SURFACE
      ?auto_1579765 - SURFACE
      ?auto_1579766 - SURFACE
      ?auto_1579767 - SURFACE
      ?auto_1579768 - SURFACE
      ?auto_1579769 - SURFACE
      ?auto_1579770 - SURFACE
      ?auto_1579771 - SURFACE
      ?auto_1579772 - SURFACE
      ?auto_1579773 - SURFACE
      ?auto_1579774 - SURFACE
      ?auto_1579775 - SURFACE
    )
    :vars
    (
      ?auto_1579777 - HOIST
      ?auto_1579779 - PLACE
      ?auto_1579780 - PLACE
      ?auto_1579781 - HOIST
      ?auto_1579778 - SURFACE
      ?auto_1579776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1579777 ?auto_1579779 ) ( IS-CRATE ?auto_1579775 ) ( not ( = ?auto_1579774 ?auto_1579775 ) ) ( not ( = ?auto_1579773 ?auto_1579774 ) ) ( not ( = ?auto_1579773 ?auto_1579775 ) ) ( not ( = ?auto_1579780 ?auto_1579779 ) ) ( HOIST-AT ?auto_1579781 ?auto_1579780 ) ( not ( = ?auto_1579777 ?auto_1579781 ) ) ( AVAILABLE ?auto_1579781 ) ( SURFACE-AT ?auto_1579775 ?auto_1579780 ) ( ON ?auto_1579775 ?auto_1579778 ) ( CLEAR ?auto_1579775 ) ( not ( = ?auto_1579774 ?auto_1579778 ) ) ( not ( = ?auto_1579775 ?auto_1579778 ) ) ( not ( = ?auto_1579773 ?auto_1579778 ) ) ( TRUCK-AT ?auto_1579776 ?auto_1579779 ) ( SURFACE-AT ?auto_1579773 ?auto_1579779 ) ( CLEAR ?auto_1579773 ) ( LIFTING ?auto_1579777 ?auto_1579774 ) ( IS-CRATE ?auto_1579774 ) ( ON ?auto_1579762 ?auto_1579761 ) ( ON ?auto_1579763 ?auto_1579762 ) ( ON ?auto_1579764 ?auto_1579763 ) ( ON ?auto_1579765 ?auto_1579764 ) ( ON ?auto_1579766 ?auto_1579765 ) ( ON ?auto_1579767 ?auto_1579766 ) ( ON ?auto_1579768 ?auto_1579767 ) ( ON ?auto_1579769 ?auto_1579768 ) ( ON ?auto_1579770 ?auto_1579769 ) ( ON ?auto_1579771 ?auto_1579770 ) ( ON ?auto_1579772 ?auto_1579771 ) ( ON ?auto_1579773 ?auto_1579772 ) ( not ( = ?auto_1579761 ?auto_1579762 ) ) ( not ( = ?auto_1579761 ?auto_1579763 ) ) ( not ( = ?auto_1579761 ?auto_1579764 ) ) ( not ( = ?auto_1579761 ?auto_1579765 ) ) ( not ( = ?auto_1579761 ?auto_1579766 ) ) ( not ( = ?auto_1579761 ?auto_1579767 ) ) ( not ( = ?auto_1579761 ?auto_1579768 ) ) ( not ( = ?auto_1579761 ?auto_1579769 ) ) ( not ( = ?auto_1579761 ?auto_1579770 ) ) ( not ( = ?auto_1579761 ?auto_1579771 ) ) ( not ( = ?auto_1579761 ?auto_1579772 ) ) ( not ( = ?auto_1579761 ?auto_1579773 ) ) ( not ( = ?auto_1579761 ?auto_1579774 ) ) ( not ( = ?auto_1579761 ?auto_1579775 ) ) ( not ( = ?auto_1579761 ?auto_1579778 ) ) ( not ( = ?auto_1579762 ?auto_1579763 ) ) ( not ( = ?auto_1579762 ?auto_1579764 ) ) ( not ( = ?auto_1579762 ?auto_1579765 ) ) ( not ( = ?auto_1579762 ?auto_1579766 ) ) ( not ( = ?auto_1579762 ?auto_1579767 ) ) ( not ( = ?auto_1579762 ?auto_1579768 ) ) ( not ( = ?auto_1579762 ?auto_1579769 ) ) ( not ( = ?auto_1579762 ?auto_1579770 ) ) ( not ( = ?auto_1579762 ?auto_1579771 ) ) ( not ( = ?auto_1579762 ?auto_1579772 ) ) ( not ( = ?auto_1579762 ?auto_1579773 ) ) ( not ( = ?auto_1579762 ?auto_1579774 ) ) ( not ( = ?auto_1579762 ?auto_1579775 ) ) ( not ( = ?auto_1579762 ?auto_1579778 ) ) ( not ( = ?auto_1579763 ?auto_1579764 ) ) ( not ( = ?auto_1579763 ?auto_1579765 ) ) ( not ( = ?auto_1579763 ?auto_1579766 ) ) ( not ( = ?auto_1579763 ?auto_1579767 ) ) ( not ( = ?auto_1579763 ?auto_1579768 ) ) ( not ( = ?auto_1579763 ?auto_1579769 ) ) ( not ( = ?auto_1579763 ?auto_1579770 ) ) ( not ( = ?auto_1579763 ?auto_1579771 ) ) ( not ( = ?auto_1579763 ?auto_1579772 ) ) ( not ( = ?auto_1579763 ?auto_1579773 ) ) ( not ( = ?auto_1579763 ?auto_1579774 ) ) ( not ( = ?auto_1579763 ?auto_1579775 ) ) ( not ( = ?auto_1579763 ?auto_1579778 ) ) ( not ( = ?auto_1579764 ?auto_1579765 ) ) ( not ( = ?auto_1579764 ?auto_1579766 ) ) ( not ( = ?auto_1579764 ?auto_1579767 ) ) ( not ( = ?auto_1579764 ?auto_1579768 ) ) ( not ( = ?auto_1579764 ?auto_1579769 ) ) ( not ( = ?auto_1579764 ?auto_1579770 ) ) ( not ( = ?auto_1579764 ?auto_1579771 ) ) ( not ( = ?auto_1579764 ?auto_1579772 ) ) ( not ( = ?auto_1579764 ?auto_1579773 ) ) ( not ( = ?auto_1579764 ?auto_1579774 ) ) ( not ( = ?auto_1579764 ?auto_1579775 ) ) ( not ( = ?auto_1579764 ?auto_1579778 ) ) ( not ( = ?auto_1579765 ?auto_1579766 ) ) ( not ( = ?auto_1579765 ?auto_1579767 ) ) ( not ( = ?auto_1579765 ?auto_1579768 ) ) ( not ( = ?auto_1579765 ?auto_1579769 ) ) ( not ( = ?auto_1579765 ?auto_1579770 ) ) ( not ( = ?auto_1579765 ?auto_1579771 ) ) ( not ( = ?auto_1579765 ?auto_1579772 ) ) ( not ( = ?auto_1579765 ?auto_1579773 ) ) ( not ( = ?auto_1579765 ?auto_1579774 ) ) ( not ( = ?auto_1579765 ?auto_1579775 ) ) ( not ( = ?auto_1579765 ?auto_1579778 ) ) ( not ( = ?auto_1579766 ?auto_1579767 ) ) ( not ( = ?auto_1579766 ?auto_1579768 ) ) ( not ( = ?auto_1579766 ?auto_1579769 ) ) ( not ( = ?auto_1579766 ?auto_1579770 ) ) ( not ( = ?auto_1579766 ?auto_1579771 ) ) ( not ( = ?auto_1579766 ?auto_1579772 ) ) ( not ( = ?auto_1579766 ?auto_1579773 ) ) ( not ( = ?auto_1579766 ?auto_1579774 ) ) ( not ( = ?auto_1579766 ?auto_1579775 ) ) ( not ( = ?auto_1579766 ?auto_1579778 ) ) ( not ( = ?auto_1579767 ?auto_1579768 ) ) ( not ( = ?auto_1579767 ?auto_1579769 ) ) ( not ( = ?auto_1579767 ?auto_1579770 ) ) ( not ( = ?auto_1579767 ?auto_1579771 ) ) ( not ( = ?auto_1579767 ?auto_1579772 ) ) ( not ( = ?auto_1579767 ?auto_1579773 ) ) ( not ( = ?auto_1579767 ?auto_1579774 ) ) ( not ( = ?auto_1579767 ?auto_1579775 ) ) ( not ( = ?auto_1579767 ?auto_1579778 ) ) ( not ( = ?auto_1579768 ?auto_1579769 ) ) ( not ( = ?auto_1579768 ?auto_1579770 ) ) ( not ( = ?auto_1579768 ?auto_1579771 ) ) ( not ( = ?auto_1579768 ?auto_1579772 ) ) ( not ( = ?auto_1579768 ?auto_1579773 ) ) ( not ( = ?auto_1579768 ?auto_1579774 ) ) ( not ( = ?auto_1579768 ?auto_1579775 ) ) ( not ( = ?auto_1579768 ?auto_1579778 ) ) ( not ( = ?auto_1579769 ?auto_1579770 ) ) ( not ( = ?auto_1579769 ?auto_1579771 ) ) ( not ( = ?auto_1579769 ?auto_1579772 ) ) ( not ( = ?auto_1579769 ?auto_1579773 ) ) ( not ( = ?auto_1579769 ?auto_1579774 ) ) ( not ( = ?auto_1579769 ?auto_1579775 ) ) ( not ( = ?auto_1579769 ?auto_1579778 ) ) ( not ( = ?auto_1579770 ?auto_1579771 ) ) ( not ( = ?auto_1579770 ?auto_1579772 ) ) ( not ( = ?auto_1579770 ?auto_1579773 ) ) ( not ( = ?auto_1579770 ?auto_1579774 ) ) ( not ( = ?auto_1579770 ?auto_1579775 ) ) ( not ( = ?auto_1579770 ?auto_1579778 ) ) ( not ( = ?auto_1579771 ?auto_1579772 ) ) ( not ( = ?auto_1579771 ?auto_1579773 ) ) ( not ( = ?auto_1579771 ?auto_1579774 ) ) ( not ( = ?auto_1579771 ?auto_1579775 ) ) ( not ( = ?auto_1579771 ?auto_1579778 ) ) ( not ( = ?auto_1579772 ?auto_1579773 ) ) ( not ( = ?auto_1579772 ?auto_1579774 ) ) ( not ( = ?auto_1579772 ?auto_1579775 ) ) ( not ( = ?auto_1579772 ?auto_1579778 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1579773 ?auto_1579774 ?auto_1579775 )
      ( MAKE-14CRATE-VERIFY ?auto_1579761 ?auto_1579762 ?auto_1579763 ?auto_1579764 ?auto_1579765 ?auto_1579766 ?auto_1579767 ?auto_1579768 ?auto_1579769 ?auto_1579770 ?auto_1579771 ?auto_1579772 ?auto_1579773 ?auto_1579774 ?auto_1579775 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1579965 - SURFACE
      ?auto_1579966 - SURFACE
      ?auto_1579967 - SURFACE
      ?auto_1579968 - SURFACE
      ?auto_1579969 - SURFACE
      ?auto_1579970 - SURFACE
      ?auto_1579971 - SURFACE
      ?auto_1579972 - SURFACE
      ?auto_1579973 - SURFACE
      ?auto_1579974 - SURFACE
      ?auto_1579975 - SURFACE
      ?auto_1579976 - SURFACE
      ?auto_1579977 - SURFACE
      ?auto_1579978 - SURFACE
      ?auto_1579979 - SURFACE
    )
    :vars
    (
      ?auto_1579984 - HOIST
      ?auto_1579985 - PLACE
      ?auto_1579981 - PLACE
      ?auto_1579983 - HOIST
      ?auto_1579980 - SURFACE
      ?auto_1579982 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1579984 ?auto_1579985 ) ( IS-CRATE ?auto_1579979 ) ( not ( = ?auto_1579978 ?auto_1579979 ) ) ( not ( = ?auto_1579977 ?auto_1579978 ) ) ( not ( = ?auto_1579977 ?auto_1579979 ) ) ( not ( = ?auto_1579981 ?auto_1579985 ) ) ( HOIST-AT ?auto_1579983 ?auto_1579981 ) ( not ( = ?auto_1579984 ?auto_1579983 ) ) ( AVAILABLE ?auto_1579983 ) ( SURFACE-AT ?auto_1579979 ?auto_1579981 ) ( ON ?auto_1579979 ?auto_1579980 ) ( CLEAR ?auto_1579979 ) ( not ( = ?auto_1579978 ?auto_1579980 ) ) ( not ( = ?auto_1579979 ?auto_1579980 ) ) ( not ( = ?auto_1579977 ?auto_1579980 ) ) ( TRUCK-AT ?auto_1579982 ?auto_1579985 ) ( SURFACE-AT ?auto_1579977 ?auto_1579985 ) ( CLEAR ?auto_1579977 ) ( IS-CRATE ?auto_1579978 ) ( AVAILABLE ?auto_1579984 ) ( IN ?auto_1579978 ?auto_1579982 ) ( ON ?auto_1579966 ?auto_1579965 ) ( ON ?auto_1579967 ?auto_1579966 ) ( ON ?auto_1579968 ?auto_1579967 ) ( ON ?auto_1579969 ?auto_1579968 ) ( ON ?auto_1579970 ?auto_1579969 ) ( ON ?auto_1579971 ?auto_1579970 ) ( ON ?auto_1579972 ?auto_1579971 ) ( ON ?auto_1579973 ?auto_1579972 ) ( ON ?auto_1579974 ?auto_1579973 ) ( ON ?auto_1579975 ?auto_1579974 ) ( ON ?auto_1579976 ?auto_1579975 ) ( ON ?auto_1579977 ?auto_1579976 ) ( not ( = ?auto_1579965 ?auto_1579966 ) ) ( not ( = ?auto_1579965 ?auto_1579967 ) ) ( not ( = ?auto_1579965 ?auto_1579968 ) ) ( not ( = ?auto_1579965 ?auto_1579969 ) ) ( not ( = ?auto_1579965 ?auto_1579970 ) ) ( not ( = ?auto_1579965 ?auto_1579971 ) ) ( not ( = ?auto_1579965 ?auto_1579972 ) ) ( not ( = ?auto_1579965 ?auto_1579973 ) ) ( not ( = ?auto_1579965 ?auto_1579974 ) ) ( not ( = ?auto_1579965 ?auto_1579975 ) ) ( not ( = ?auto_1579965 ?auto_1579976 ) ) ( not ( = ?auto_1579965 ?auto_1579977 ) ) ( not ( = ?auto_1579965 ?auto_1579978 ) ) ( not ( = ?auto_1579965 ?auto_1579979 ) ) ( not ( = ?auto_1579965 ?auto_1579980 ) ) ( not ( = ?auto_1579966 ?auto_1579967 ) ) ( not ( = ?auto_1579966 ?auto_1579968 ) ) ( not ( = ?auto_1579966 ?auto_1579969 ) ) ( not ( = ?auto_1579966 ?auto_1579970 ) ) ( not ( = ?auto_1579966 ?auto_1579971 ) ) ( not ( = ?auto_1579966 ?auto_1579972 ) ) ( not ( = ?auto_1579966 ?auto_1579973 ) ) ( not ( = ?auto_1579966 ?auto_1579974 ) ) ( not ( = ?auto_1579966 ?auto_1579975 ) ) ( not ( = ?auto_1579966 ?auto_1579976 ) ) ( not ( = ?auto_1579966 ?auto_1579977 ) ) ( not ( = ?auto_1579966 ?auto_1579978 ) ) ( not ( = ?auto_1579966 ?auto_1579979 ) ) ( not ( = ?auto_1579966 ?auto_1579980 ) ) ( not ( = ?auto_1579967 ?auto_1579968 ) ) ( not ( = ?auto_1579967 ?auto_1579969 ) ) ( not ( = ?auto_1579967 ?auto_1579970 ) ) ( not ( = ?auto_1579967 ?auto_1579971 ) ) ( not ( = ?auto_1579967 ?auto_1579972 ) ) ( not ( = ?auto_1579967 ?auto_1579973 ) ) ( not ( = ?auto_1579967 ?auto_1579974 ) ) ( not ( = ?auto_1579967 ?auto_1579975 ) ) ( not ( = ?auto_1579967 ?auto_1579976 ) ) ( not ( = ?auto_1579967 ?auto_1579977 ) ) ( not ( = ?auto_1579967 ?auto_1579978 ) ) ( not ( = ?auto_1579967 ?auto_1579979 ) ) ( not ( = ?auto_1579967 ?auto_1579980 ) ) ( not ( = ?auto_1579968 ?auto_1579969 ) ) ( not ( = ?auto_1579968 ?auto_1579970 ) ) ( not ( = ?auto_1579968 ?auto_1579971 ) ) ( not ( = ?auto_1579968 ?auto_1579972 ) ) ( not ( = ?auto_1579968 ?auto_1579973 ) ) ( not ( = ?auto_1579968 ?auto_1579974 ) ) ( not ( = ?auto_1579968 ?auto_1579975 ) ) ( not ( = ?auto_1579968 ?auto_1579976 ) ) ( not ( = ?auto_1579968 ?auto_1579977 ) ) ( not ( = ?auto_1579968 ?auto_1579978 ) ) ( not ( = ?auto_1579968 ?auto_1579979 ) ) ( not ( = ?auto_1579968 ?auto_1579980 ) ) ( not ( = ?auto_1579969 ?auto_1579970 ) ) ( not ( = ?auto_1579969 ?auto_1579971 ) ) ( not ( = ?auto_1579969 ?auto_1579972 ) ) ( not ( = ?auto_1579969 ?auto_1579973 ) ) ( not ( = ?auto_1579969 ?auto_1579974 ) ) ( not ( = ?auto_1579969 ?auto_1579975 ) ) ( not ( = ?auto_1579969 ?auto_1579976 ) ) ( not ( = ?auto_1579969 ?auto_1579977 ) ) ( not ( = ?auto_1579969 ?auto_1579978 ) ) ( not ( = ?auto_1579969 ?auto_1579979 ) ) ( not ( = ?auto_1579969 ?auto_1579980 ) ) ( not ( = ?auto_1579970 ?auto_1579971 ) ) ( not ( = ?auto_1579970 ?auto_1579972 ) ) ( not ( = ?auto_1579970 ?auto_1579973 ) ) ( not ( = ?auto_1579970 ?auto_1579974 ) ) ( not ( = ?auto_1579970 ?auto_1579975 ) ) ( not ( = ?auto_1579970 ?auto_1579976 ) ) ( not ( = ?auto_1579970 ?auto_1579977 ) ) ( not ( = ?auto_1579970 ?auto_1579978 ) ) ( not ( = ?auto_1579970 ?auto_1579979 ) ) ( not ( = ?auto_1579970 ?auto_1579980 ) ) ( not ( = ?auto_1579971 ?auto_1579972 ) ) ( not ( = ?auto_1579971 ?auto_1579973 ) ) ( not ( = ?auto_1579971 ?auto_1579974 ) ) ( not ( = ?auto_1579971 ?auto_1579975 ) ) ( not ( = ?auto_1579971 ?auto_1579976 ) ) ( not ( = ?auto_1579971 ?auto_1579977 ) ) ( not ( = ?auto_1579971 ?auto_1579978 ) ) ( not ( = ?auto_1579971 ?auto_1579979 ) ) ( not ( = ?auto_1579971 ?auto_1579980 ) ) ( not ( = ?auto_1579972 ?auto_1579973 ) ) ( not ( = ?auto_1579972 ?auto_1579974 ) ) ( not ( = ?auto_1579972 ?auto_1579975 ) ) ( not ( = ?auto_1579972 ?auto_1579976 ) ) ( not ( = ?auto_1579972 ?auto_1579977 ) ) ( not ( = ?auto_1579972 ?auto_1579978 ) ) ( not ( = ?auto_1579972 ?auto_1579979 ) ) ( not ( = ?auto_1579972 ?auto_1579980 ) ) ( not ( = ?auto_1579973 ?auto_1579974 ) ) ( not ( = ?auto_1579973 ?auto_1579975 ) ) ( not ( = ?auto_1579973 ?auto_1579976 ) ) ( not ( = ?auto_1579973 ?auto_1579977 ) ) ( not ( = ?auto_1579973 ?auto_1579978 ) ) ( not ( = ?auto_1579973 ?auto_1579979 ) ) ( not ( = ?auto_1579973 ?auto_1579980 ) ) ( not ( = ?auto_1579974 ?auto_1579975 ) ) ( not ( = ?auto_1579974 ?auto_1579976 ) ) ( not ( = ?auto_1579974 ?auto_1579977 ) ) ( not ( = ?auto_1579974 ?auto_1579978 ) ) ( not ( = ?auto_1579974 ?auto_1579979 ) ) ( not ( = ?auto_1579974 ?auto_1579980 ) ) ( not ( = ?auto_1579975 ?auto_1579976 ) ) ( not ( = ?auto_1579975 ?auto_1579977 ) ) ( not ( = ?auto_1579975 ?auto_1579978 ) ) ( not ( = ?auto_1579975 ?auto_1579979 ) ) ( not ( = ?auto_1579975 ?auto_1579980 ) ) ( not ( = ?auto_1579976 ?auto_1579977 ) ) ( not ( = ?auto_1579976 ?auto_1579978 ) ) ( not ( = ?auto_1579976 ?auto_1579979 ) ) ( not ( = ?auto_1579976 ?auto_1579980 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1579977 ?auto_1579978 ?auto_1579979 )
      ( MAKE-14CRATE-VERIFY ?auto_1579965 ?auto_1579966 ?auto_1579967 ?auto_1579968 ?auto_1579969 ?auto_1579970 ?auto_1579971 ?auto_1579972 ?auto_1579973 ?auto_1579974 ?auto_1579975 ?auto_1579976 ?auto_1579977 ?auto_1579978 ?auto_1579979 ) )
  )

)

