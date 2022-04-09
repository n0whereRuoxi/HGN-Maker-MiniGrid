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

  ( :method MAKE-15CRATE-VERIFY
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
      ?c15 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( CLEAR ?c15 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-16CRATE-VERIFY
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
      ?c15 - SURFACE
      ?c16 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( ON ?c16 ?c15 ) ( CLEAR ?c16 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2656747 - SURFACE
      ?auto_2656748 - SURFACE
    )
    :vars
    (
      ?auto_2656749 - HOIST
      ?auto_2656750 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656749 ?auto_2656750 ) ( SURFACE-AT ?auto_2656747 ?auto_2656750 ) ( CLEAR ?auto_2656747 ) ( LIFTING ?auto_2656749 ?auto_2656748 ) ( IS-CRATE ?auto_2656748 ) ( not ( = ?auto_2656747 ?auto_2656748 ) ) )
    :subtasks
    ( ( !DROP ?auto_2656749 ?auto_2656748 ?auto_2656747 ?auto_2656750 )
      ( MAKE-1CRATE-VERIFY ?auto_2656747 ?auto_2656748 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2656751 - SURFACE
      ?auto_2656752 - SURFACE
    )
    :vars
    (
      ?auto_2656753 - HOIST
      ?auto_2656754 - PLACE
      ?auto_2656755 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656753 ?auto_2656754 ) ( SURFACE-AT ?auto_2656751 ?auto_2656754 ) ( CLEAR ?auto_2656751 ) ( IS-CRATE ?auto_2656752 ) ( not ( = ?auto_2656751 ?auto_2656752 ) ) ( TRUCK-AT ?auto_2656755 ?auto_2656754 ) ( AVAILABLE ?auto_2656753 ) ( IN ?auto_2656752 ?auto_2656755 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2656753 ?auto_2656752 ?auto_2656755 ?auto_2656754 )
      ( MAKE-1CRATE ?auto_2656751 ?auto_2656752 )
      ( MAKE-1CRATE-VERIFY ?auto_2656751 ?auto_2656752 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2656756 - SURFACE
      ?auto_2656757 - SURFACE
    )
    :vars
    (
      ?auto_2656760 - HOIST
      ?auto_2656759 - PLACE
      ?auto_2656758 - TRUCK
      ?auto_2656761 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656760 ?auto_2656759 ) ( SURFACE-AT ?auto_2656756 ?auto_2656759 ) ( CLEAR ?auto_2656756 ) ( IS-CRATE ?auto_2656757 ) ( not ( = ?auto_2656756 ?auto_2656757 ) ) ( AVAILABLE ?auto_2656760 ) ( IN ?auto_2656757 ?auto_2656758 ) ( TRUCK-AT ?auto_2656758 ?auto_2656761 ) ( not ( = ?auto_2656761 ?auto_2656759 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2656758 ?auto_2656761 ?auto_2656759 )
      ( MAKE-1CRATE ?auto_2656756 ?auto_2656757 )
      ( MAKE-1CRATE-VERIFY ?auto_2656756 ?auto_2656757 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2656762 - SURFACE
      ?auto_2656763 - SURFACE
    )
    :vars
    (
      ?auto_2656766 - HOIST
      ?auto_2656765 - PLACE
      ?auto_2656764 - TRUCK
      ?auto_2656767 - PLACE
      ?auto_2656768 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656766 ?auto_2656765 ) ( SURFACE-AT ?auto_2656762 ?auto_2656765 ) ( CLEAR ?auto_2656762 ) ( IS-CRATE ?auto_2656763 ) ( not ( = ?auto_2656762 ?auto_2656763 ) ) ( AVAILABLE ?auto_2656766 ) ( TRUCK-AT ?auto_2656764 ?auto_2656767 ) ( not ( = ?auto_2656767 ?auto_2656765 ) ) ( HOIST-AT ?auto_2656768 ?auto_2656767 ) ( LIFTING ?auto_2656768 ?auto_2656763 ) ( not ( = ?auto_2656766 ?auto_2656768 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2656768 ?auto_2656763 ?auto_2656764 ?auto_2656767 )
      ( MAKE-1CRATE ?auto_2656762 ?auto_2656763 )
      ( MAKE-1CRATE-VERIFY ?auto_2656762 ?auto_2656763 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2656769 - SURFACE
      ?auto_2656770 - SURFACE
    )
    :vars
    (
      ?auto_2656772 - HOIST
      ?auto_2656775 - PLACE
      ?auto_2656771 - TRUCK
      ?auto_2656774 - PLACE
      ?auto_2656773 - HOIST
      ?auto_2656776 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656772 ?auto_2656775 ) ( SURFACE-AT ?auto_2656769 ?auto_2656775 ) ( CLEAR ?auto_2656769 ) ( IS-CRATE ?auto_2656770 ) ( not ( = ?auto_2656769 ?auto_2656770 ) ) ( AVAILABLE ?auto_2656772 ) ( TRUCK-AT ?auto_2656771 ?auto_2656774 ) ( not ( = ?auto_2656774 ?auto_2656775 ) ) ( HOIST-AT ?auto_2656773 ?auto_2656774 ) ( not ( = ?auto_2656772 ?auto_2656773 ) ) ( AVAILABLE ?auto_2656773 ) ( SURFACE-AT ?auto_2656770 ?auto_2656774 ) ( ON ?auto_2656770 ?auto_2656776 ) ( CLEAR ?auto_2656770 ) ( not ( = ?auto_2656769 ?auto_2656776 ) ) ( not ( = ?auto_2656770 ?auto_2656776 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2656773 ?auto_2656770 ?auto_2656776 ?auto_2656774 )
      ( MAKE-1CRATE ?auto_2656769 ?auto_2656770 )
      ( MAKE-1CRATE-VERIFY ?auto_2656769 ?auto_2656770 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2656777 - SURFACE
      ?auto_2656778 - SURFACE
    )
    :vars
    (
      ?auto_2656782 - HOIST
      ?auto_2656779 - PLACE
      ?auto_2656781 - PLACE
      ?auto_2656783 - HOIST
      ?auto_2656780 - SURFACE
      ?auto_2656784 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656782 ?auto_2656779 ) ( SURFACE-AT ?auto_2656777 ?auto_2656779 ) ( CLEAR ?auto_2656777 ) ( IS-CRATE ?auto_2656778 ) ( not ( = ?auto_2656777 ?auto_2656778 ) ) ( AVAILABLE ?auto_2656782 ) ( not ( = ?auto_2656781 ?auto_2656779 ) ) ( HOIST-AT ?auto_2656783 ?auto_2656781 ) ( not ( = ?auto_2656782 ?auto_2656783 ) ) ( AVAILABLE ?auto_2656783 ) ( SURFACE-AT ?auto_2656778 ?auto_2656781 ) ( ON ?auto_2656778 ?auto_2656780 ) ( CLEAR ?auto_2656778 ) ( not ( = ?auto_2656777 ?auto_2656780 ) ) ( not ( = ?auto_2656778 ?auto_2656780 ) ) ( TRUCK-AT ?auto_2656784 ?auto_2656779 ) )
    :subtasks
    ( ( !DRIVE ?auto_2656784 ?auto_2656779 ?auto_2656781 )
      ( MAKE-1CRATE ?auto_2656777 ?auto_2656778 )
      ( MAKE-1CRATE-VERIFY ?auto_2656777 ?auto_2656778 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2656794 - SURFACE
      ?auto_2656795 - SURFACE
      ?auto_2656796 - SURFACE
    )
    :vars
    (
      ?auto_2656798 - HOIST
      ?auto_2656797 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656798 ?auto_2656797 ) ( SURFACE-AT ?auto_2656795 ?auto_2656797 ) ( CLEAR ?auto_2656795 ) ( LIFTING ?auto_2656798 ?auto_2656796 ) ( IS-CRATE ?auto_2656796 ) ( not ( = ?auto_2656795 ?auto_2656796 ) ) ( ON ?auto_2656795 ?auto_2656794 ) ( not ( = ?auto_2656794 ?auto_2656795 ) ) ( not ( = ?auto_2656794 ?auto_2656796 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2656795 ?auto_2656796 )
      ( MAKE-2CRATE-VERIFY ?auto_2656794 ?auto_2656795 ?auto_2656796 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2656804 - SURFACE
      ?auto_2656805 - SURFACE
      ?auto_2656806 - SURFACE
    )
    :vars
    (
      ?auto_2656809 - HOIST
      ?auto_2656808 - PLACE
      ?auto_2656807 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656809 ?auto_2656808 ) ( SURFACE-AT ?auto_2656805 ?auto_2656808 ) ( CLEAR ?auto_2656805 ) ( IS-CRATE ?auto_2656806 ) ( not ( = ?auto_2656805 ?auto_2656806 ) ) ( TRUCK-AT ?auto_2656807 ?auto_2656808 ) ( AVAILABLE ?auto_2656809 ) ( IN ?auto_2656806 ?auto_2656807 ) ( ON ?auto_2656805 ?auto_2656804 ) ( not ( = ?auto_2656804 ?auto_2656805 ) ) ( not ( = ?auto_2656804 ?auto_2656806 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2656805 ?auto_2656806 )
      ( MAKE-2CRATE-VERIFY ?auto_2656804 ?auto_2656805 ?auto_2656806 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2656810 - SURFACE
      ?auto_2656811 - SURFACE
    )
    :vars
    (
      ?auto_2656814 - HOIST
      ?auto_2656813 - PLACE
      ?auto_2656812 - TRUCK
      ?auto_2656815 - SURFACE
      ?auto_2656816 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656814 ?auto_2656813 ) ( SURFACE-AT ?auto_2656810 ?auto_2656813 ) ( CLEAR ?auto_2656810 ) ( IS-CRATE ?auto_2656811 ) ( not ( = ?auto_2656810 ?auto_2656811 ) ) ( AVAILABLE ?auto_2656814 ) ( IN ?auto_2656811 ?auto_2656812 ) ( ON ?auto_2656810 ?auto_2656815 ) ( not ( = ?auto_2656815 ?auto_2656810 ) ) ( not ( = ?auto_2656815 ?auto_2656811 ) ) ( TRUCK-AT ?auto_2656812 ?auto_2656816 ) ( not ( = ?auto_2656816 ?auto_2656813 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2656812 ?auto_2656816 ?auto_2656813 )
      ( MAKE-2CRATE ?auto_2656815 ?auto_2656810 ?auto_2656811 )
      ( MAKE-1CRATE-VERIFY ?auto_2656810 ?auto_2656811 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2656817 - SURFACE
      ?auto_2656818 - SURFACE
      ?auto_2656819 - SURFACE
    )
    :vars
    (
      ?auto_2656821 - HOIST
      ?auto_2656823 - PLACE
      ?auto_2656822 - TRUCK
      ?auto_2656820 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656821 ?auto_2656823 ) ( SURFACE-AT ?auto_2656818 ?auto_2656823 ) ( CLEAR ?auto_2656818 ) ( IS-CRATE ?auto_2656819 ) ( not ( = ?auto_2656818 ?auto_2656819 ) ) ( AVAILABLE ?auto_2656821 ) ( IN ?auto_2656819 ?auto_2656822 ) ( ON ?auto_2656818 ?auto_2656817 ) ( not ( = ?auto_2656817 ?auto_2656818 ) ) ( not ( = ?auto_2656817 ?auto_2656819 ) ) ( TRUCK-AT ?auto_2656822 ?auto_2656820 ) ( not ( = ?auto_2656820 ?auto_2656823 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2656818 ?auto_2656819 )
      ( MAKE-2CRATE-VERIFY ?auto_2656817 ?auto_2656818 ?auto_2656819 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2656824 - SURFACE
      ?auto_2656825 - SURFACE
    )
    :vars
    (
      ?auto_2656826 - HOIST
      ?auto_2656828 - PLACE
      ?auto_2656827 - SURFACE
      ?auto_2656830 - TRUCK
      ?auto_2656829 - PLACE
      ?auto_2656831 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656826 ?auto_2656828 ) ( SURFACE-AT ?auto_2656824 ?auto_2656828 ) ( CLEAR ?auto_2656824 ) ( IS-CRATE ?auto_2656825 ) ( not ( = ?auto_2656824 ?auto_2656825 ) ) ( AVAILABLE ?auto_2656826 ) ( ON ?auto_2656824 ?auto_2656827 ) ( not ( = ?auto_2656827 ?auto_2656824 ) ) ( not ( = ?auto_2656827 ?auto_2656825 ) ) ( TRUCK-AT ?auto_2656830 ?auto_2656829 ) ( not ( = ?auto_2656829 ?auto_2656828 ) ) ( HOIST-AT ?auto_2656831 ?auto_2656829 ) ( LIFTING ?auto_2656831 ?auto_2656825 ) ( not ( = ?auto_2656826 ?auto_2656831 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2656831 ?auto_2656825 ?auto_2656830 ?auto_2656829 )
      ( MAKE-2CRATE ?auto_2656827 ?auto_2656824 ?auto_2656825 )
      ( MAKE-1CRATE-VERIFY ?auto_2656824 ?auto_2656825 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2656832 - SURFACE
      ?auto_2656833 - SURFACE
      ?auto_2656834 - SURFACE
    )
    :vars
    (
      ?auto_2656835 - HOIST
      ?auto_2656838 - PLACE
      ?auto_2656836 - TRUCK
      ?auto_2656837 - PLACE
      ?auto_2656839 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656835 ?auto_2656838 ) ( SURFACE-AT ?auto_2656833 ?auto_2656838 ) ( CLEAR ?auto_2656833 ) ( IS-CRATE ?auto_2656834 ) ( not ( = ?auto_2656833 ?auto_2656834 ) ) ( AVAILABLE ?auto_2656835 ) ( ON ?auto_2656833 ?auto_2656832 ) ( not ( = ?auto_2656832 ?auto_2656833 ) ) ( not ( = ?auto_2656832 ?auto_2656834 ) ) ( TRUCK-AT ?auto_2656836 ?auto_2656837 ) ( not ( = ?auto_2656837 ?auto_2656838 ) ) ( HOIST-AT ?auto_2656839 ?auto_2656837 ) ( LIFTING ?auto_2656839 ?auto_2656834 ) ( not ( = ?auto_2656835 ?auto_2656839 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2656833 ?auto_2656834 )
      ( MAKE-2CRATE-VERIFY ?auto_2656832 ?auto_2656833 ?auto_2656834 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2656840 - SURFACE
      ?auto_2656841 - SURFACE
    )
    :vars
    (
      ?auto_2656844 - HOIST
      ?auto_2656846 - PLACE
      ?auto_2656847 - SURFACE
      ?auto_2656845 - TRUCK
      ?auto_2656843 - PLACE
      ?auto_2656842 - HOIST
      ?auto_2656848 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656844 ?auto_2656846 ) ( SURFACE-AT ?auto_2656840 ?auto_2656846 ) ( CLEAR ?auto_2656840 ) ( IS-CRATE ?auto_2656841 ) ( not ( = ?auto_2656840 ?auto_2656841 ) ) ( AVAILABLE ?auto_2656844 ) ( ON ?auto_2656840 ?auto_2656847 ) ( not ( = ?auto_2656847 ?auto_2656840 ) ) ( not ( = ?auto_2656847 ?auto_2656841 ) ) ( TRUCK-AT ?auto_2656845 ?auto_2656843 ) ( not ( = ?auto_2656843 ?auto_2656846 ) ) ( HOIST-AT ?auto_2656842 ?auto_2656843 ) ( not ( = ?auto_2656844 ?auto_2656842 ) ) ( AVAILABLE ?auto_2656842 ) ( SURFACE-AT ?auto_2656841 ?auto_2656843 ) ( ON ?auto_2656841 ?auto_2656848 ) ( CLEAR ?auto_2656841 ) ( not ( = ?auto_2656840 ?auto_2656848 ) ) ( not ( = ?auto_2656841 ?auto_2656848 ) ) ( not ( = ?auto_2656847 ?auto_2656848 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2656842 ?auto_2656841 ?auto_2656848 ?auto_2656843 )
      ( MAKE-2CRATE ?auto_2656847 ?auto_2656840 ?auto_2656841 )
      ( MAKE-1CRATE-VERIFY ?auto_2656840 ?auto_2656841 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2656849 - SURFACE
      ?auto_2656850 - SURFACE
      ?auto_2656851 - SURFACE
    )
    :vars
    (
      ?auto_2656856 - HOIST
      ?auto_2656854 - PLACE
      ?auto_2656853 - TRUCK
      ?auto_2656857 - PLACE
      ?auto_2656852 - HOIST
      ?auto_2656855 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656856 ?auto_2656854 ) ( SURFACE-AT ?auto_2656850 ?auto_2656854 ) ( CLEAR ?auto_2656850 ) ( IS-CRATE ?auto_2656851 ) ( not ( = ?auto_2656850 ?auto_2656851 ) ) ( AVAILABLE ?auto_2656856 ) ( ON ?auto_2656850 ?auto_2656849 ) ( not ( = ?auto_2656849 ?auto_2656850 ) ) ( not ( = ?auto_2656849 ?auto_2656851 ) ) ( TRUCK-AT ?auto_2656853 ?auto_2656857 ) ( not ( = ?auto_2656857 ?auto_2656854 ) ) ( HOIST-AT ?auto_2656852 ?auto_2656857 ) ( not ( = ?auto_2656856 ?auto_2656852 ) ) ( AVAILABLE ?auto_2656852 ) ( SURFACE-AT ?auto_2656851 ?auto_2656857 ) ( ON ?auto_2656851 ?auto_2656855 ) ( CLEAR ?auto_2656851 ) ( not ( = ?auto_2656850 ?auto_2656855 ) ) ( not ( = ?auto_2656851 ?auto_2656855 ) ) ( not ( = ?auto_2656849 ?auto_2656855 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2656850 ?auto_2656851 )
      ( MAKE-2CRATE-VERIFY ?auto_2656849 ?auto_2656850 ?auto_2656851 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2656858 - SURFACE
      ?auto_2656859 - SURFACE
    )
    :vars
    (
      ?auto_2656864 - HOIST
      ?auto_2656861 - PLACE
      ?auto_2656866 - SURFACE
      ?auto_2656863 - PLACE
      ?auto_2656865 - HOIST
      ?auto_2656860 - SURFACE
      ?auto_2656862 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656864 ?auto_2656861 ) ( SURFACE-AT ?auto_2656858 ?auto_2656861 ) ( CLEAR ?auto_2656858 ) ( IS-CRATE ?auto_2656859 ) ( not ( = ?auto_2656858 ?auto_2656859 ) ) ( AVAILABLE ?auto_2656864 ) ( ON ?auto_2656858 ?auto_2656866 ) ( not ( = ?auto_2656866 ?auto_2656858 ) ) ( not ( = ?auto_2656866 ?auto_2656859 ) ) ( not ( = ?auto_2656863 ?auto_2656861 ) ) ( HOIST-AT ?auto_2656865 ?auto_2656863 ) ( not ( = ?auto_2656864 ?auto_2656865 ) ) ( AVAILABLE ?auto_2656865 ) ( SURFACE-AT ?auto_2656859 ?auto_2656863 ) ( ON ?auto_2656859 ?auto_2656860 ) ( CLEAR ?auto_2656859 ) ( not ( = ?auto_2656858 ?auto_2656860 ) ) ( not ( = ?auto_2656859 ?auto_2656860 ) ) ( not ( = ?auto_2656866 ?auto_2656860 ) ) ( TRUCK-AT ?auto_2656862 ?auto_2656861 ) )
    :subtasks
    ( ( !DRIVE ?auto_2656862 ?auto_2656861 ?auto_2656863 )
      ( MAKE-2CRATE ?auto_2656866 ?auto_2656858 ?auto_2656859 )
      ( MAKE-1CRATE-VERIFY ?auto_2656858 ?auto_2656859 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2656867 - SURFACE
      ?auto_2656868 - SURFACE
      ?auto_2656869 - SURFACE
    )
    :vars
    (
      ?auto_2656874 - HOIST
      ?auto_2656871 - PLACE
      ?auto_2656870 - PLACE
      ?auto_2656872 - HOIST
      ?auto_2656873 - SURFACE
      ?auto_2656875 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656874 ?auto_2656871 ) ( SURFACE-AT ?auto_2656868 ?auto_2656871 ) ( CLEAR ?auto_2656868 ) ( IS-CRATE ?auto_2656869 ) ( not ( = ?auto_2656868 ?auto_2656869 ) ) ( AVAILABLE ?auto_2656874 ) ( ON ?auto_2656868 ?auto_2656867 ) ( not ( = ?auto_2656867 ?auto_2656868 ) ) ( not ( = ?auto_2656867 ?auto_2656869 ) ) ( not ( = ?auto_2656870 ?auto_2656871 ) ) ( HOIST-AT ?auto_2656872 ?auto_2656870 ) ( not ( = ?auto_2656874 ?auto_2656872 ) ) ( AVAILABLE ?auto_2656872 ) ( SURFACE-AT ?auto_2656869 ?auto_2656870 ) ( ON ?auto_2656869 ?auto_2656873 ) ( CLEAR ?auto_2656869 ) ( not ( = ?auto_2656868 ?auto_2656873 ) ) ( not ( = ?auto_2656869 ?auto_2656873 ) ) ( not ( = ?auto_2656867 ?auto_2656873 ) ) ( TRUCK-AT ?auto_2656875 ?auto_2656871 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2656868 ?auto_2656869 )
      ( MAKE-2CRATE-VERIFY ?auto_2656867 ?auto_2656868 ?auto_2656869 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2656876 - SURFACE
      ?auto_2656877 - SURFACE
    )
    :vars
    (
      ?auto_2656880 - HOIST
      ?auto_2656879 - PLACE
      ?auto_2656882 - SURFACE
      ?auto_2656881 - PLACE
      ?auto_2656884 - HOIST
      ?auto_2656878 - SURFACE
      ?auto_2656883 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656880 ?auto_2656879 ) ( IS-CRATE ?auto_2656877 ) ( not ( = ?auto_2656876 ?auto_2656877 ) ) ( not ( = ?auto_2656882 ?auto_2656876 ) ) ( not ( = ?auto_2656882 ?auto_2656877 ) ) ( not ( = ?auto_2656881 ?auto_2656879 ) ) ( HOIST-AT ?auto_2656884 ?auto_2656881 ) ( not ( = ?auto_2656880 ?auto_2656884 ) ) ( AVAILABLE ?auto_2656884 ) ( SURFACE-AT ?auto_2656877 ?auto_2656881 ) ( ON ?auto_2656877 ?auto_2656878 ) ( CLEAR ?auto_2656877 ) ( not ( = ?auto_2656876 ?auto_2656878 ) ) ( not ( = ?auto_2656877 ?auto_2656878 ) ) ( not ( = ?auto_2656882 ?auto_2656878 ) ) ( TRUCK-AT ?auto_2656883 ?auto_2656879 ) ( SURFACE-AT ?auto_2656882 ?auto_2656879 ) ( CLEAR ?auto_2656882 ) ( LIFTING ?auto_2656880 ?auto_2656876 ) ( IS-CRATE ?auto_2656876 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2656882 ?auto_2656876 )
      ( MAKE-2CRATE ?auto_2656882 ?auto_2656876 ?auto_2656877 )
      ( MAKE-1CRATE-VERIFY ?auto_2656876 ?auto_2656877 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2656885 - SURFACE
      ?auto_2656886 - SURFACE
      ?auto_2656887 - SURFACE
    )
    :vars
    (
      ?auto_2656888 - HOIST
      ?auto_2656891 - PLACE
      ?auto_2656889 - PLACE
      ?auto_2656893 - HOIST
      ?auto_2656890 - SURFACE
      ?auto_2656892 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656888 ?auto_2656891 ) ( IS-CRATE ?auto_2656887 ) ( not ( = ?auto_2656886 ?auto_2656887 ) ) ( not ( = ?auto_2656885 ?auto_2656886 ) ) ( not ( = ?auto_2656885 ?auto_2656887 ) ) ( not ( = ?auto_2656889 ?auto_2656891 ) ) ( HOIST-AT ?auto_2656893 ?auto_2656889 ) ( not ( = ?auto_2656888 ?auto_2656893 ) ) ( AVAILABLE ?auto_2656893 ) ( SURFACE-AT ?auto_2656887 ?auto_2656889 ) ( ON ?auto_2656887 ?auto_2656890 ) ( CLEAR ?auto_2656887 ) ( not ( = ?auto_2656886 ?auto_2656890 ) ) ( not ( = ?auto_2656887 ?auto_2656890 ) ) ( not ( = ?auto_2656885 ?auto_2656890 ) ) ( TRUCK-AT ?auto_2656892 ?auto_2656891 ) ( SURFACE-AT ?auto_2656885 ?auto_2656891 ) ( CLEAR ?auto_2656885 ) ( LIFTING ?auto_2656888 ?auto_2656886 ) ( IS-CRATE ?auto_2656886 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2656886 ?auto_2656887 )
      ( MAKE-2CRATE-VERIFY ?auto_2656885 ?auto_2656886 ?auto_2656887 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2656894 - SURFACE
      ?auto_2656895 - SURFACE
    )
    :vars
    (
      ?auto_2656897 - HOIST
      ?auto_2656899 - PLACE
      ?auto_2656898 - SURFACE
      ?auto_2656902 - PLACE
      ?auto_2656896 - HOIST
      ?auto_2656901 - SURFACE
      ?auto_2656900 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656897 ?auto_2656899 ) ( IS-CRATE ?auto_2656895 ) ( not ( = ?auto_2656894 ?auto_2656895 ) ) ( not ( = ?auto_2656898 ?auto_2656894 ) ) ( not ( = ?auto_2656898 ?auto_2656895 ) ) ( not ( = ?auto_2656902 ?auto_2656899 ) ) ( HOIST-AT ?auto_2656896 ?auto_2656902 ) ( not ( = ?auto_2656897 ?auto_2656896 ) ) ( AVAILABLE ?auto_2656896 ) ( SURFACE-AT ?auto_2656895 ?auto_2656902 ) ( ON ?auto_2656895 ?auto_2656901 ) ( CLEAR ?auto_2656895 ) ( not ( = ?auto_2656894 ?auto_2656901 ) ) ( not ( = ?auto_2656895 ?auto_2656901 ) ) ( not ( = ?auto_2656898 ?auto_2656901 ) ) ( TRUCK-AT ?auto_2656900 ?auto_2656899 ) ( SURFACE-AT ?auto_2656898 ?auto_2656899 ) ( CLEAR ?auto_2656898 ) ( IS-CRATE ?auto_2656894 ) ( AVAILABLE ?auto_2656897 ) ( IN ?auto_2656894 ?auto_2656900 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2656897 ?auto_2656894 ?auto_2656900 ?auto_2656899 )
      ( MAKE-2CRATE ?auto_2656898 ?auto_2656894 ?auto_2656895 )
      ( MAKE-1CRATE-VERIFY ?auto_2656894 ?auto_2656895 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2656903 - SURFACE
      ?auto_2656904 - SURFACE
      ?auto_2656905 - SURFACE
    )
    :vars
    (
      ?auto_2656906 - HOIST
      ?auto_2656911 - PLACE
      ?auto_2656907 - PLACE
      ?auto_2656908 - HOIST
      ?auto_2656910 - SURFACE
      ?auto_2656909 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656906 ?auto_2656911 ) ( IS-CRATE ?auto_2656905 ) ( not ( = ?auto_2656904 ?auto_2656905 ) ) ( not ( = ?auto_2656903 ?auto_2656904 ) ) ( not ( = ?auto_2656903 ?auto_2656905 ) ) ( not ( = ?auto_2656907 ?auto_2656911 ) ) ( HOIST-AT ?auto_2656908 ?auto_2656907 ) ( not ( = ?auto_2656906 ?auto_2656908 ) ) ( AVAILABLE ?auto_2656908 ) ( SURFACE-AT ?auto_2656905 ?auto_2656907 ) ( ON ?auto_2656905 ?auto_2656910 ) ( CLEAR ?auto_2656905 ) ( not ( = ?auto_2656904 ?auto_2656910 ) ) ( not ( = ?auto_2656905 ?auto_2656910 ) ) ( not ( = ?auto_2656903 ?auto_2656910 ) ) ( TRUCK-AT ?auto_2656909 ?auto_2656911 ) ( SURFACE-AT ?auto_2656903 ?auto_2656911 ) ( CLEAR ?auto_2656903 ) ( IS-CRATE ?auto_2656904 ) ( AVAILABLE ?auto_2656906 ) ( IN ?auto_2656904 ?auto_2656909 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2656904 ?auto_2656905 )
      ( MAKE-2CRATE-VERIFY ?auto_2656903 ?auto_2656904 ?auto_2656905 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2656948 - SURFACE
      ?auto_2656949 - SURFACE
    )
    :vars
    (
      ?auto_2656954 - HOIST
      ?auto_2656953 - PLACE
      ?auto_2656955 - SURFACE
      ?auto_2656951 - PLACE
      ?auto_2656952 - HOIST
      ?auto_2656950 - SURFACE
      ?auto_2656956 - TRUCK
      ?auto_2656957 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656954 ?auto_2656953 ) ( SURFACE-AT ?auto_2656948 ?auto_2656953 ) ( CLEAR ?auto_2656948 ) ( IS-CRATE ?auto_2656949 ) ( not ( = ?auto_2656948 ?auto_2656949 ) ) ( AVAILABLE ?auto_2656954 ) ( ON ?auto_2656948 ?auto_2656955 ) ( not ( = ?auto_2656955 ?auto_2656948 ) ) ( not ( = ?auto_2656955 ?auto_2656949 ) ) ( not ( = ?auto_2656951 ?auto_2656953 ) ) ( HOIST-AT ?auto_2656952 ?auto_2656951 ) ( not ( = ?auto_2656954 ?auto_2656952 ) ) ( AVAILABLE ?auto_2656952 ) ( SURFACE-AT ?auto_2656949 ?auto_2656951 ) ( ON ?auto_2656949 ?auto_2656950 ) ( CLEAR ?auto_2656949 ) ( not ( = ?auto_2656948 ?auto_2656950 ) ) ( not ( = ?auto_2656949 ?auto_2656950 ) ) ( not ( = ?auto_2656955 ?auto_2656950 ) ) ( TRUCK-AT ?auto_2656956 ?auto_2656957 ) ( not ( = ?auto_2656957 ?auto_2656953 ) ) ( not ( = ?auto_2656951 ?auto_2656957 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2656956 ?auto_2656957 ?auto_2656953 )
      ( MAKE-1CRATE ?auto_2656948 ?auto_2656949 )
      ( MAKE-1CRATE-VERIFY ?auto_2656948 ?auto_2656949 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2656987 - SURFACE
      ?auto_2656988 - SURFACE
      ?auto_2656989 - SURFACE
      ?auto_2656990 - SURFACE
    )
    :vars
    (
      ?auto_2656992 - HOIST
      ?auto_2656991 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656992 ?auto_2656991 ) ( SURFACE-AT ?auto_2656989 ?auto_2656991 ) ( CLEAR ?auto_2656989 ) ( LIFTING ?auto_2656992 ?auto_2656990 ) ( IS-CRATE ?auto_2656990 ) ( not ( = ?auto_2656989 ?auto_2656990 ) ) ( ON ?auto_2656988 ?auto_2656987 ) ( ON ?auto_2656989 ?auto_2656988 ) ( not ( = ?auto_2656987 ?auto_2656988 ) ) ( not ( = ?auto_2656987 ?auto_2656989 ) ) ( not ( = ?auto_2656987 ?auto_2656990 ) ) ( not ( = ?auto_2656988 ?auto_2656989 ) ) ( not ( = ?auto_2656988 ?auto_2656990 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2656989 ?auto_2656990 )
      ( MAKE-3CRATE-VERIFY ?auto_2656987 ?auto_2656988 ?auto_2656989 ?auto_2656990 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2657004 - SURFACE
      ?auto_2657005 - SURFACE
      ?auto_2657006 - SURFACE
      ?auto_2657007 - SURFACE
    )
    :vars
    (
      ?auto_2657009 - HOIST
      ?auto_2657010 - PLACE
      ?auto_2657008 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657009 ?auto_2657010 ) ( SURFACE-AT ?auto_2657006 ?auto_2657010 ) ( CLEAR ?auto_2657006 ) ( IS-CRATE ?auto_2657007 ) ( not ( = ?auto_2657006 ?auto_2657007 ) ) ( TRUCK-AT ?auto_2657008 ?auto_2657010 ) ( AVAILABLE ?auto_2657009 ) ( IN ?auto_2657007 ?auto_2657008 ) ( ON ?auto_2657006 ?auto_2657005 ) ( not ( = ?auto_2657005 ?auto_2657006 ) ) ( not ( = ?auto_2657005 ?auto_2657007 ) ) ( ON ?auto_2657005 ?auto_2657004 ) ( not ( = ?auto_2657004 ?auto_2657005 ) ) ( not ( = ?auto_2657004 ?auto_2657006 ) ) ( not ( = ?auto_2657004 ?auto_2657007 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657005 ?auto_2657006 ?auto_2657007 )
      ( MAKE-3CRATE-VERIFY ?auto_2657004 ?auto_2657005 ?auto_2657006 ?auto_2657007 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2657025 - SURFACE
      ?auto_2657026 - SURFACE
      ?auto_2657027 - SURFACE
      ?auto_2657028 - SURFACE
    )
    :vars
    (
      ?auto_2657032 - HOIST
      ?auto_2657030 - PLACE
      ?auto_2657031 - TRUCK
      ?auto_2657029 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657032 ?auto_2657030 ) ( SURFACE-AT ?auto_2657027 ?auto_2657030 ) ( CLEAR ?auto_2657027 ) ( IS-CRATE ?auto_2657028 ) ( not ( = ?auto_2657027 ?auto_2657028 ) ) ( AVAILABLE ?auto_2657032 ) ( IN ?auto_2657028 ?auto_2657031 ) ( ON ?auto_2657027 ?auto_2657026 ) ( not ( = ?auto_2657026 ?auto_2657027 ) ) ( not ( = ?auto_2657026 ?auto_2657028 ) ) ( TRUCK-AT ?auto_2657031 ?auto_2657029 ) ( not ( = ?auto_2657029 ?auto_2657030 ) ) ( ON ?auto_2657026 ?auto_2657025 ) ( not ( = ?auto_2657025 ?auto_2657026 ) ) ( not ( = ?auto_2657025 ?auto_2657027 ) ) ( not ( = ?auto_2657025 ?auto_2657028 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657026 ?auto_2657027 ?auto_2657028 )
      ( MAKE-3CRATE-VERIFY ?auto_2657025 ?auto_2657026 ?auto_2657027 ?auto_2657028 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2657049 - SURFACE
      ?auto_2657050 - SURFACE
      ?auto_2657051 - SURFACE
      ?auto_2657052 - SURFACE
    )
    :vars
    (
      ?auto_2657055 - HOIST
      ?auto_2657053 - PLACE
      ?auto_2657056 - TRUCK
      ?auto_2657054 - PLACE
      ?auto_2657057 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657055 ?auto_2657053 ) ( SURFACE-AT ?auto_2657051 ?auto_2657053 ) ( CLEAR ?auto_2657051 ) ( IS-CRATE ?auto_2657052 ) ( not ( = ?auto_2657051 ?auto_2657052 ) ) ( AVAILABLE ?auto_2657055 ) ( ON ?auto_2657051 ?auto_2657050 ) ( not ( = ?auto_2657050 ?auto_2657051 ) ) ( not ( = ?auto_2657050 ?auto_2657052 ) ) ( TRUCK-AT ?auto_2657056 ?auto_2657054 ) ( not ( = ?auto_2657054 ?auto_2657053 ) ) ( HOIST-AT ?auto_2657057 ?auto_2657054 ) ( LIFTING ?auto_2657057 ?auto_2657052 ) ( not ( = ?auto_2657055 ?auto_2657057 ) ) ( ON ?auto_2657050 ?auto_2657049 ) ( not ( = ?auto_2657049 ?auto_2657050 ) ) ( not ( = ?auto_2657049 ?auto_2657051 ) ) ( not ( = ?auto_2657049 ?auto_2657052 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657050 ?auto_2657051 ?auto_2657052 )
      ( MAKE-3CRATE-VERIFY ?auto_2657049 ?auto_2657050 ?auto_2657051 ?auto_2657052 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2657076 - SURFACE
      ?auto_2657077 - SURFACE
      ?auto_2657078 - SURFACE
      ?auto_2657079 - SURFACE
    )
    :vars
    (
      ?auto_2657083 - HOIST
      ?auto_2657084 - PLACE
      ?auto_2657080 - TRUCK
      ?auto_2657081 - PLACE
      ?auto_2657085 - HOIST
      ?auto_2657082 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657083 ?auto_2657084 ) ( SURFACE-AT ?auto_2657078 ?auto_2657084 ) ( CLEAR ?auto_2657078 ) ( IS-CRATE ?auto_2657079 ) ( not ( = ?auto_2657078 ?auto_2657079 ) ) ( AVAILABLE ?auto_2657083 ) ( ON ?auto_2657078 ?auto_2657077 ) ( not ( = ?auto_2657077 ?auto_2657078 ) ) ( not ( = ?auto_2657077 ?auto_2657079 ) ) ( TRUCK-AT ?auto_2657080 ?auto_2657081 ) ( not ( = ?auto_2657081 ?auto_2657084 ) ) ( HOIST-AT ?auto_2657085 ?auto_2657081 ) ( not ( = ?auto_2657083 ?auto_2657085 ) ) ( AVAILABLE ?auto_2657085 ) ( SURFACE-AT ?auto_2657079 ?auto_2657081 ) ( ON ?auto_2657079 ?auto_2657082 ) ( CLEAR ?auto_2657079 ) ( not ( = ?auto_2657078 ?auto_2657082 ) ) ( not ( = ?auto_2657079 ?auto_2657082 ) ) ( not ( = ?auto_2657077 ?auto_2657082 ) ) ( ON ?auto_2657077 ?auto_2657076 ) ( not ( = ?auto_2657076 ?auto_2657077 ) ) ( not ( = ?auto_2657076 ?auto_2657078 ) ) ( not ( = ?auto_2657076 ?auto_2657079 ) ) ( not ( = ?auto_2657076 ?auto_2657082 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657077 ?auto_2657078 ?auto_2657079 )
      ( MAKE-3CRATE-VERIFY ?auto_2657076 ?auto_2657077 ?auto_2657078 ?auto_2657079 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2657104 - SURFACE
      ?auto_2657105 - SURFACE
      ?auto_2657106 - SURFACE
      ?auto_2657107 - SURFACE
    )
    :vars
    (
      ?auto_2657110 - HOIST
      ?auto_2657112 - PLACE
      ?auto_2657109 - PLACE
      ?auto_2657108 - HOIST
      ?auto_2657111 - SURFACE
      ?auto_2657113 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657110 ?auto_2657112 ) ( SURFACE-AT ?auto_2657106 ?auto_2657112 ) ( CLEAR ?auto_2657106 ) ( IS-CRATE ?auto_2657107 ) ( not ( = ?auto_2657106 ?auto_2657107 ) ) ( AVAILABLE ?auto_2657110 ) ( ON ?auto_2657106 ?auto_2657105 ) ( not ( = ?auto_2657105 ?auto_2657106 ) ) ( not ( = ?auto_2657105 ?auto_2657107 ) ) ( not ( = ?auto_2657109 ?auto_2657112 ) ) ( HOIST-AT ?auto_2657108 ?auto_2657109 ) ( not ( = ?auto_2657110 ?auto_2657108 ) ) ( AVAILABLE ?auto_2657108 ) ( SURFACE-AT ?auto_2657107 ?auto_2657109 ) ( ON ?auto_2657107 ?auto_2657111 ) ( CLEAR ?auto_2657107 ) ( not ( = ?auto_2657106 ?auto_2657111 ) ) ( not ( = ?auto_2657107 ?auto_2657111 ) ) ( not ( = ?auto_2657105 ?auto_2657111 ) ) ( TRUCK-AT ?auto_2657113 ?auto_2657112 ) ( ON ?auto_2657105 ?auto_2657104 ) ( not ( = ?auto_2657104 ?auto_2657105 ) ) ( not ( = ?auto_2657104 ?auto_2657106 ) ) ( not ( = ?auto_2657104 ?auto_2657107 ) ) ( not ( = ?auto_2657104 ?auto_2657111 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657105 ?auto_2657106 ?auto_2657107 )
      ( MAKE-3CRATE-VERIFY ?auto_2657104 ?auto_2657105 ?auto_2657106 ?auto_2657107 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2657132 - SURFACE
      ?auto_2657133 - SURFACE
      ?auto_2657134 - SURFACE
      ?auto_2657135 - SURFACE
    )
    :vars
    (
      ?auto_2657140 - HOIST
      ?auto_2657136 - PLACE
      ?auto_2657139 - PLACE
      ?auto_2657138 - HOIST
      ?auto_2657137 - SURFACE
      ?auto_2657141 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657140 ?auto_2657136 ) ( IS-CRATE ?auto_2657135 ) ( not ( = ?auto_2657134 ?auto_2657135 ) ) ( not ( = ?auto_2657133 ?auto_2657134 ) ) ( not ( = ?auto_2657133 ?auto_2657135 ) ) ( not ( = ?auto_2657139 ?auto_2657136 ) ) ( HOIST-AT ?auto_2657138 ?auto_2657139 ) ( not ( = ?auto_2657140 ?auto_2657138 ) ) ( AVAILABLE ?auto_2657138 ) ( SURFACE-AT ?auto_2657135 ?auto_2657139 ) ( ON ?auto_2657135 ?auto_2657137 ) ( CLEAR ?auto_2657135 ) ( not ( = ?auto_2657134 ?auto_2657137 ) ) ( not ( = ?auto_2657135 ?auto_2657137 ) ) ( not ( = ?auto_2657133 ?auto_2657137 ) ) ( TRUCK-AT ?auto_2657141 ?auto_2657136 ) ( SURFACE-AT ?auto_2657133 ?auto_2657136 ) ( CLEAR ?auto_2657133 ) ( LIFTING ?auto_2657140 ?auto_2657134 ) ( IS-CRATE ?auto_2657134 ) ( ON ?auto_2657133 ?auto_2657132 ) ( not ( = ?auto_2657132 ?auto_2657133 ) ) ( not ( = ?auto_2657132 ?auto_2657134 ) ) ( not ( = ?auto_2657132 ?auto_2657135 ) ) ( not ( = ?auto_2657132 ?auto_2657137 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657133 ?auto_2657134 ?auto_2657135 )
      ( MAKE-3CRATE-VERIFY ?auto_2657132 ?auto_2657133 ?auto_2657134 ?auto_2657135 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2657160 - SURFACE
      ?auto_2657161 - SURFACE
      ?auto_2657162 - SURFACE
      ?auto_2657163 - SURFACE
    )
    :vars
    (
      ?auto_2657168 - HOIST
      ?auto_2657166 - PLACE
      ?auto_2657164 - PLACE
      ?auto_2657169 - HOIST
      ?auto_2657167 - SURFACE
      ?auto_2657165 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657168 ?auto_2657166 ) ( IS-CRATE ?auto_2657163 ) ( not ( = ?auto_2657162 ?auto_2657163 ) ) ( not ( = ?auto_2657161 ?auto_2657162 ) ) ( not ( = ?auto_2657161 ?auto_2657163 ) ) ( not ( = ?auto_2657164 ?auto_2657166 ) ) ( HOIST-AT ?auto_2657169 ?auto_2657164 ) ( not ( = ?auto_2657168 ?auto_2657169 ) ) ( AVAILABLE ?auto_2657169 ) ( SURFACE-AT ?auto_2657163 ?auto_2657164 ) ( ON ?auto_2657163 ?auto_2657167 ) ( CLEAR ?auto_2657163 ) ( not ( = ?auto_2657162 ?auto_2657167 ) ) ( not ( = ?auto_2657163 ?auto_2657167 ) ) ( not ( = ?auto_2657161 ?auto_2657167 ) ) ( TRUCK-AT ?auto_2657165 ?auto_2657166 ) ( SURFACE-AT ?auto_2657161 ?auto_2657166 ) ( CLEAR ?auto_2657161 ) ( IS-CRATE ?auto_2657162 ) ( AVAILABLE ?auto_2657168 ) ( IN ?auto_2657162 ?auto_2657165 ) ( ON ?auto_2657161 ?auto_2657160 ) ( not ( = ?auto_2657160 ?auto_2657161 ) ) ( not ( = ?auto_2657160 ?auto_2657162 ) ) ( not ( = ?auto_2657160 ?auto_2657163 ) ) ( not ( = ?auto_2657160 ?auto_2657167 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657161 ?auto_2657162 ?auto_2657163 )
      ( MAKE-3CRATE-VERIFY ?auto_2657160 ?auto_2657161 ?auto_2657162 ?auto_2657163 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2657451 - SURFACE
      ?auto_2657452 - SURFACE
      ?auto_2657453 - SURFACE
      ?auto_2657454 - SURFACE
      ?auto_2657455 - SURFACE
    )
    :vars
    (
      ?auto_2657457 - HOIST
      ?auto_2657456 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657457 ?auto_2657456 ) ( SURFACE-AT ?auto_2657454 ?auto_2657456 ) ( CLEAR ?auto_2657454 ) ( LIFTING ?auto_2657457 ?auto_2657455 ) ( IS-CRATE ?auto_2657455 ) ( not ( = ?auto_2657454 ?auto_2657455 ) ) ( ON ?auto_2657452 ?auto_2657451 ) ( ON ?auto_2657453 ?auto_2657452 ) ( ON ?auto_2657454 ?auto_2657453 ) ( not ( = ?auto_2657451 ?auto_2657452 ) ) ( not ( = ?auto_2657451 ?auto_2657453 ) ) ( not ( = ?auto_2657451 ?auto_2657454 ) ) ( not ( = ?auto_2657451 ?auto_2657455 ) ) ( not ( = ?auto_2657452 ?auto_2657453 ) ) ( not ( = ?auto_2657452 ?auto_2657454 ) ) ( not ( = ?auto_2657452 ?auto_2657455 ) ) ( not ( = ?auto_2657453 ?auto_2657454 ) ) ( not ( = ?auto_2657453 ?auto_2657455 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2657454 ?auto_2657455 )
      ( MAKE-4CRATE-VERIFY ?auto_2657451 ?auto_2657452 ?auto_2657453 ?auto_2657454 ?auto_2657455 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2657476 - SURFACE
      ?auto_2657477 - SURFACE
      ?auto_2657478 - SURFACE
      ?auto_2657479 - SURFACE
      ?auto_2657480 - SURFACE
    )
    :vars
    (
      ?auto_2657483 - HOIST
      ?auto_2657482 - PLACE
      ?auto_2657481 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657483 ?auto_2657482 ) ( SURFACE-AT ?auto_2657479 ?auto_2657482 ) ( CLEAR ?auto_2657479 ) ( IS-CRATE ?auto_2657480 ) ( not ( = ?auto_2657479 ?auto_2657480 ) ) ( TRUCK-AT ?auto_2657481 ?auto_2657482 ) ( AVAILABLE ?auto_2657483 ) ( IN ?auto_2657480 ?auto_2657481 ) ( ON ?auto_2657479 ?auto_2657478 ) ( not ( = ?auto_2657478 ?auto_2657479 ) ) ( not ( = ?auto_2657478 ?auto_2657480 ) ) ( ON ?auto_2657477 ?auto_2657476 ) ( ON ?auto_2657478 ?auto_2657477 ) ( not ( = ?auto_2657476 ?auto_2657477 ) ) ( not ( = ?auto_2657476 ?auto_2657478 ) ) ( not ( = ?auto_2657476 ?auto_2657479 ) ) ( not ( = ?auto_2657476 ?auto_2657480 ) ) ( not ( = ?auto_2657477 ?auto_2657478 ) ) ( not ( = ?auto_2657477 ?auto_2657479 ) ) ( not ( = ?auto_2657477 ?auto_2657480 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657478 ?auto_2657479 ?auto_2657480 )
      ( MAKE-4CRATE-VERIFY ?auto_2657476 ?auto_2657477 ?auto_2657478 ?auto_2657479 ?auto_2657480 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2657506 - SURFACE
      ?auto_2657507 - SURFACE
      ?auto_2657508 - SURFACE
      ?auto_2657509 - SURFACE
      ?auto_2657510 - SURFACE
    )
    :vars
    (
      ?auto_2657514 - HOIST
      ?auto_2657511 - PLACE
      ?auto_2657512 - TRUCK
      ?auto_2657513 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657514 ?auto_2657511 ) ( SURFACE-AT ?auto_2657509 ?auto_2657511 ) ( CLEAR ?auto_2657509 ) ( IS-CRATE ?auto_2657510 ) ( not ( = ?auto_2657509 ?auto_2657510 ) ) ( AVAILABLE ?auto_2657514 ) ( IN ?auto_2657510 ?auto_2657512 ) ( ON ?auto_2657509 ?auto_2657508 ) ( not ( = ?auto_2657508 ?auto_2657509 ) ) ( not ( = ?auto_2657508 ?auto_2657510 ) ) ( TRUCK-AT ?auto_2657512 ?auto_2657513 ) ( not ( = ?auto_2657513 ?auto_2657511 ) ) ( ON ?auto_2657507 ?auto_2657506 ) ( ON ?auto_2657508 ?auto_2657507 ) ( not ( = ?auto_2657506 ?auto_2657507 ) ) ( not ( = ?auto_2657506 ?auto_2657508 ) ) ( not ( = ?auto_2657506 ?auto_2657509 ) ) ( not ( = ?auto_2657506 ?auto_2657510 ) ) ( not ( = ?auto_2657507 ?auto_2657508 ) ) ( not ( = ?auto_2657507 ?auto_2657509 ) ) ( not ( = ?auto_2657507 ?auto_2657510 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657508 ?auto_2657509 ?auto_2657510 )
      ( MAKE-4CRATE-VERIFY ?auto_2657506 ?auto_2657507 ?auto_2657508 ?auto_2657509 ?auto_2657510 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2657540 - SURFACE
      ?auto_2657541 - SURFACE
      ?auto_2657542 - SURFACE
      ?auto_2657543 - SURFACE
      ?auto_2657544 - SURFACE
    )
    :vars
    (
      ?auto_2657545 - HOIST
      ?auto_2657547 - PLACE
      ?auto_2657548 - TRUCK
      ?auto_2657549 - PLACE
      ?auto_2657546 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657545 ?auto_2657547 ) ( SURFACE-AT ?auto_2657543 ?auto_2657547 ) ( CLEAR ?auto_2657543 ) ( IS-CRATE ?auto_2657544 ) ( not ( = ?auto_2657543 ?auto_2657544 ) ) ( AVAILABLE ?auto_2657545 ) ( ON ?auto_2657543 ?auto_2657542 ) ( not ( = ?auto_2657542 ?auto_2657543 ) ) ( not ( = ?auto_2657542 ?auto_2657544 ) ) ( TRUCK-AT ?auto_2657548 ?auto_2657549 ) ( not ( = ?auto_2657549 ?auto_2657547 ) ) ( HOIST-AT ?auto_2657546 ?auto_2657549 ) ( LIFTING ?auto_2657546 ?auto_2657544 ) ( not ( = ?auto_2657545 ?auto_2657546 ) ) ( ON ?auto_2657541 ?auto_2657540 ) ( ON ?auto_2657542 ?auto_2657541 ) ( not ( = ?auto_2657540 ?auto_2657541 ) ) ( not ( = ?auto_2657540 ?auto_2657542 ) ) ( not ( = ?auto_2657540 ?auto_2657543 ) ) ( not ( = ?auto_2657540 ?auto_2657544 ) ) ( not ( = ?auto_2657541 ?auto_2657542 ) ) ( not ( = ?auto_2657541 ?auto_2657543 ) ) ( not ( = ?auto_2657541 ?auto_2657544 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657542 ?auto_2657543 ?auto_2657544 )
      ( MAKE-4CRATE-VERIFY ?auto_2657540 ?auto_2657541 ?auto_2657542 ?auto_2657543 ?auto_2657544 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2657578 - SURFACE
      ?auto_2657579 - SURFACE
      ?auto_2657580 - SURFACE
      ?auto_2657581 - SURFACE
      ?auto_2657582 - SURFACE
    )
    :vars
    (
      ?auto_2657586 - HOIST
      ?auto_2657588 - PLACE
      ?auto_2657585 - TRUCK
      ?auto_2657587 - PLACE
      ?auto_2657584 - HOIST
      ?auto_2657583 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657586 ?auto_2657588 ) ( SURFACE-AT ?auto_2657581 ?auto_2657588 ) ( CLEAR ?auto_2657581 ) ( IS-CRATE ?auto_2657582 ) ( not ( = ?auto_2657581 ?auto_2657582 ) ) ( AVAILABLE ?auto_2657586 ) ( ON ?auto_2657581 ?auto_2657580 ) ( not ( = ?auto_2657580 ?auto_2657581 ) ) ( not ( = ?auto_2657580 ?auto_2657582 ) ) ( TRUCK-AT ?auto_2657585 ?auto_2657587 ) ( not ( = ?auto_2657587 ?auto_2657588 ) ) ( HOIST-AT ?auto_2657584 ?auto_2657587 ) ( not ( = ?auto_2657586 ?auto_2657584 ) ) ( AVAILABLE ?auto_2657584 ) ( SURFACE-AT ?auto_2657582 ?auto_2657587 ) ( ON ?auto_2657582 ?auto_2657583 ) ( CLEAR ?auto_2657582 ) ( not ( = ?auto_2657581 ?auto_2657583 ) ) ( not ( = ?auto_2657582 ?auto_2657583 ) ) ( not ( = ?auto_2657580 ?auto_2657583 ) ) ( ON ?auto_2657579 ?auto_2657578 ) ( ON ?auto_2657580 ?auto_2657579 ) ( not ( = ?auto_2657578 ?auto_2657579 ) ) ( not ( = ?auto_2657578 ?auto_2657580 ) ) ( not ( = ?auto_2657578 ?auto_2657581 ) ) ( not ( = ?auto_2657578 ?auto_2657582 ) ) ( not ( = ?auto_2657578 ?auto_2657583 ) ) ( not ( = ?auto_2657579 ?auto_2657580 ) ) ( not ( = ?auto_2657579 ?auto_2657581 ) ) ( not ( = ?auto_2657579 ?auto_2657582 ) ) ( not ( = ?auto_2657579 ?auto_2657583 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657580 ?auto_2657581 ?auto_2657582 )
      ( MAKE-4CRATE-VERIFY ?auto_2657578 ?auto_2657579 ?auto_2657580 ?auto_2657581 ?auto_2657582 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2657617 - SURFACE
      ?auto_2657618 - SURFACE
      ?auto_2657619 - SURFACE
      ?auto_2657620 - SURFACE
      ?auto_2657621 - SURFACE
    )
    :vars
    (
      ?auto_2657622 - HOIST
      ?auto_2657625 - PLACE
      ?auto_2657626 - PLACE
      ?auto_2657623 - HOIST
      ?auto_2657627 - SURFACE
      ?auto_2657624 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657622 ?auto_2657625 ) ( SURFACE-AT ?auto_2657620 ?auto_2657625 ) ( CLEAR ?auto_2657620 ) ( IS-CRATE ?auto_2657621 ) ( not ( = ?auto_2657620 ?auto_2657621 ) ) ( AVAILABLE ?auto_2657622 ) ( ON ?auto_2657620 ?auto_2657619 ) ( not ( = ?auto_2657619 ?auto_2657620 ) ) ( not ( = ?auto_2657619 ?auto_2657621 ) ) ( not ( = ?auto_2657626 ?auto_2657625 ) ) ( HOIST-AT ?auto_2657623 ?auto_2657626 ) ( not ( = ?auto_2657622 ?auto_2657623 ) ) ( AVAILABLE ?auto_2657623 ) ( SURFACE-AT ?auto_2657621 ?auto_2657626 ) ( ON ?auto_2657621 ?auto_2657627 ) ( CLEAR ?auto_2657621 ) ( not ( = ?auto_2657620 ?auto_2657627 ) ) ( not ( = ?auto_2657621 ?auto_2657627 ) ) ( not ( = ?auto_2657619 ?auto_2657627 ) ) ( TRUCK-AT ?auto_2657624 ?auto_2657625 ) ( ON ?auto_2657618 ?auto_2657617 ) ( ON ?auto_2657619 ?auto_2657618 ) ( not ( = ?auto_2657617 ?auto_2657618 ) ) ( not ( = ?auto_2657617 ?auto_2657619 ) ) ( not ( = ?auto_2657617 ?auto_2657620 ) ) ( not ( = ?auto_2657617 ?auto_2657621 ) ) ( not ( = ?auto_2657617 ?auto_2657627 ) ) ( not ( = ?auto_2657618 ?auto_2657619 ) ) ( not ( = ?auto_2657618 ?auto_2657620 ) ) ( not ( = ?auto_2657618 ?auto_2657621 ) ) ( not ( = ?auto_2657618 ?auto_2657627 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657619 ?auto_2657620 ?auto_2657621 )
      ( MAKE-4CRATE-VERIFY ?auto_2657617 ?auto_2657618 ?auto_2657619 ?auto_2657620 ?auto_2657621 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2657656 - SURFACE
      ?auto_2657657 - SURFACE
      ?auto_2657658 - SURFACE
      ?auto_2657659 - SURFACE
      ?auto_2657660 - SURFACE
    )
    :vars
    (
      ?auto_2657662 - HOIST
      ?auto_2657664 - PLACE
      ?auto_2657665 - PLACE
      ?auto_2657661 - HOIST
      ?auto_2657666 - SURFACE
      ?auto_2657663 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657662 ?auto_2657664 ) ( IS-CRATE ?auto_2657660 ) ( not ( = ?auto_2657659 ?auto_2657660 ) ) ( not ( = ?auto_2657658 ?auto_2657659 ) ) ( not ( = ?auto_2657658 ?auto_2657660 ) ) ( not ( = ?auto_2657665 ?auto_2657664 ) ) ( HOIST-AT ?auto_2657661 ?auto_2657665 ) ( not ( = ?auto_2657662 ?auto_2657661 ) ) ( AVAILABLE ?auto_2657661 ) ( SURFACE-AT ?auto_2657660 ?auto_2657665 ) ( ON ?auto_2657660 ?auto_2657666 ) ( CLEAR ?auto_2657660 ) ( not ( = ?auto_2657659 ?auto_2657666 ) ) ( not ( = ?auto_2657660 ?auto_2657666 ) ) ( not ( = ?auto_2657658 ?auto_2657666 ) ) ( TRUCK-AT ?auto_2657663 ?auto_2657664 ) ( SURFACE-AT ?auto_2657658 ?auto_2657664 ) ( CLEAR ?auto_2657658 ) ( LIFTING ?auto_2657662 ?auto_2657659 ) ( IS-CRATE ?auto_2657659 ) ( ON ?auto_2657657 ?auto_2657656 ) ( ON ?auto_2657658 ?auto_2657657 ) ( not ( = ?auto_2657656 ?auto_2657657 ) ) ( not ( = ?auto_2657656 ?auto_2657658 ) ) ( not ( = ?auto_2657656 ?auto_2657659 ) ) ( not ( = ?auto_2657656 ?auto_2657660 ) ) ( not ( = ?auto_2657656 ?auto_2657666 ) ) ( not ( = ?auto_2657657 ?auto_2657658 ) ) ( not ( = ?auto_2657657 ?auto_2657659 ) ) ( not ( = ?auto_2657657 ?auto_2657660 ) ) ( not ( = ?auto_2657657 ?auto_2657666 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657658 ?auto_2657659 ?auto_2657660 )
      ( MAKE-4CRATE-VERIFY ?auto_2657656 ?auto_2657657 ?auto_2657658 ?auto_2657659 ?auto_2657660 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2657695 - SURFACE
      ?auto_2657696 - SURFACE
      ?auto_2657697 - SURFACE
      ?auto_2657698 - SURFACE
      ?auto_2657699 - SURFACE
    )
    :vars
    (
      ?auto_2657701 - HOIST
      ?auto_2657700 - PLACE
      ?auto_2657702 - PLACE
      ?auto_2657704 - HOIST
      ?auto_2657703 - SURFACE
      ?auto_2657705 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657701 ?auto_2657700 ) ( IS-CRATE ?auto_2657699 ) ( not ( = ?auto_2657698 ?auto_2657699 ) ) ( not ( = ?auto_2657697 ?auto_2657698 ) ) ( not ( = ?auto_2657697 ?auto_2657699 ) ) ( not ( = ?auto_2657702 ?auto_2657700 ) ) ( HOIST-AT ?auto_2657704 ?auto_2657702 ) ( not ( = ?auto_2657701 ?auto_2657704 ) ) ( AVAILABLE ?auto_2657704 ) ( SURFACE-AT ?auto_2657699 ?auto_2657702 ) ( ON ?auto_2657699 ?auto_2657703 ) ( CLEAR ?auto_2657699 ) ( not ( = ?auto_2657698 ?auto_2657703 ) ) ( not ( = ?auto_2657699 ?auto_2657703 ) ) ( not ( = ?auto_2657697 ?auto_2657703 ) ) ( TRUCK-AT ?auto_2657705 ?auto_2657700 ) ( SURFACE-AT ?auto_2657697 ?auto_2657700 ) ( CLEAR ?auto_2657697 ) ( IS-CRATE ?auto_2657698 ) ( AVAILABLE ?auto_2657701 ) ( IN ?auto_2657698 ?auto_2657705 ) ( ON ?auto_2657696 ?auto_2657695 ) ( ON ?auto_2657697 ?auto_2657696 ) ( not ( = ?auto_2657695 ?auto_2657696 ) ) ( not ( = ?auto_2657695 ?auto_2657697 ) ) ( not ( = ?auto_2657695 ?auto_2657698 ) ) ( not ( = ?auto_2657695 ?auto_2657699 ) ) ( not ( = ?auto_2657695 ?auto_2657703 ) ) ( not ( = ?auto_2657696 ?auto_2657697 ) ) ( not ( = ?auto_2657696 ?auto_2657698 ) ) ( not ( = ?auto_2657696 ?auto_2657699 ) ) ( not ( = ?auto_2657696 ?auto_2657703 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657697 ?auto_2657698 ?auto_2657699 )
      ( MAKE-4CRATE-VERIFY ?auto_2657695 ?auto_2657696 ?auto_2657697 ?auto_2657698 ?auto_2657699 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2658355 - SURFACE
      ?auto_2658356 - SURFACE
      ?auto_2658357 - SURFACE
      ?auto_2658358 - SURFACE
      ?auto_2658359 - SURFACE
      ?auto_2658360 - SURFACE
    )
    :vars
    (
      ?auto_2658362 - HOIST
      ?auto_2658361 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658362 ?auto_2658361 ) ( SURFACE-AT ?auto_2658359 ?auto_2658361 ) ( CLEAR ?auto_2658359 ) ( LIFTING ?auto_2658362 ?auto_2658360 ) ( IS-CRATE ?auto_2658360 ) ( not ( = ?auto_2658359 ?auto_2658360 ) ) ( ON ?auto_2658356 ?auto_2658355 ) ( ON ?auto_2658357 ?auto_2658356 ) ( ON ?auto_2658358 ?auto_2658357 ) ( ON ?auto_2658359 ?auto_2658358 ) ( not ( = ?auto_2658355 ?auto_2658356 ) ) ( not ( = ?auto_2658355 ?auto_2658357 ) ) ( not ( = ?auto_2658355 ?auto_2658358 ) ) ( not ( = ?auto_2658355 ?auto_2658359 ) ) ( not ( = ?auto_2658355 ?auto_2658360 ) ) ( not ( = ?auto_2658356 ?auto_2658357 ) ) ( not ( = ?auto_2658356 ?auto_2658358 ) ) ( not ( = ?auto_2658356 ?auto_2658359 ) ) ( not ( = ?auto_2658356 ?auto_2658360 ) ) ( not ( = ?auto_2658357 ?auto_2658358 ) ) ( not ( = ?auto_2658357 ?auto_2658359 ) ) ( not ( = ?auto_2658357 ?auto_2658360 ) ) ( not ( = ?auto_2658358 ?auto_2658359 ) ) ( not ( = ?auto_2658358 ?auto_2658360 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2658359 ?auto_2658360 )
      ( MAKE-5CRATE-VERIFY ?auto_2658355 ?auto_2658356 ?auto_2658357 ?auto_2658358 ?auto_2658359 ?auto_2658360 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2658389 - SURFACE
      ?auto_2658390 - SURFACE
      ?auto_2658391 - SURFACE
      ?auto_2658392 - SURFACE
      ?auto_2658393 - SURFACE
      ?auto_2658394 - SURFACE
    )
    :vars
    (
      ?auto_2658395 - HOIST
      ?auto_2658396 - PLACE
      ?auto_2658397 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658395 ?auto_2658396 ) ( SURFACE-AT ?auto_2658393 ?auto_2658396 ) ( CLEAR ?auto_2658393 ) ( IS-CRATE ?auto_2658394 ) ( not ( = ?auto_2658393 ?auto_2658394 ) ) ( TRUCK-AT ?auto_2658397 ?auto_2658396 ) ( AVAILABLE ?auto_2658395 ) ( IN ?auto_2658394 ?auto_2658397 ) ( ON ?auto_2658393 ?auto_2658392 ) ( not ( = ?auto_2658392 ?auto_2658393 ) ) ( not ( = ?auto_2658392 ?auto_2658394 ) ) ( ON ?auto_2658390 ?auto_2658389 ) ( ON ?auto_2658391 ?auto_2658390 ) ( ON ?auto_2658392 ?auto_2658391 ) ( not ( = ?auto_2658389 ?auto_2658390 ) ) ( not ( = ?auto_2658389 ?auto_2658391 ) ) ( not ( = ?auto_2658389 ?auto_2658392 ) ) ( not ( = ?auto_2658389 ?auto_2658393 ) ) ( not ( = ?auto_2658389 ?auto_2658394 ) ) ( not ( = ?auto_2658390 ?auto_2658391 ) ) ( not ( = ?auto_2658390 ?auto_2658392 ) ) ( not ( = ?auto_2658390 ?auto_2658393 ) ) ( not ( = ?auto_2658390 ?auto_2658394 ) ) ( not ( = ?auto_2658391 ?auto_2658392 ) ) ( not ( = ?auto_2658391 ?auto_2658393 ) ) ( not ( = ?auto_2658391 ?auto_2658394 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658392 ?auto_2658393 ?auto_2658394 )
      ( MAKE-5CRATE-VERIFY ?auto_2658389 ?auto_2658390 ?auto_2658391 ?auto_2658392 ?auto_2658393 ?auto_2658394 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2658429 - SURFACE
      ?auto_2658430 - SURFACE
      ?auto_2658431 - SURFACE
      ?auto_2658432 - SURFACE
      ?auto_2658433 - SURFACE
      ?auto_2658434 - SURFACE
    )
    :vars
    (
      ?auto_2658435 - HOIST
      ?auto_2658438 - PLACE
      ?auto_2658436 - TRUCK
      ?auto_2658437 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658435 ?auto_2658438 ) ( SURFACE-AT ?auto_2658433 ?auto_2658438 ) ( CLEAR ?auto_2658433 ) ( IS-CRATE ?auto_2658434 ) ( not ( = ?auto_2658433 ?auto_2658434 ) ) ( AVAILABLE ?auto_2658435 ) ( IN ?auto_2658434 ?auto_2658436 ) ( ON ?auto_2658433 ?auto_2658432 ) ( not ( = ?auto_2658432 ?auto_2658433 ) ) ( not ( = ?auto_2658432 ?auto_2658434 ) ) ( TRUCK-AT ?auto_2658436 ?auto_2658437 ) ( not ( = ?auto_2658437 ?auto_2658438 ) ) ( ON ?auto_2658430 ?auto_2658429 ) ( ON ?auto_2658431 ?auto_2658430 ) ( ON ?auto_2658432 ?auto_2658431 ) ( not ( = ?auto_2658429 ?auto_2658430 ) ) ( not ( = ?auto_2658429 ?auto_2658431 ) ) ( not ( = ?auto_2658429 ?auto_2658432 ) ) ( not ( = ?auto_2658429 ?auto_2658433 ) ) ( not ( = ?auto_2658429 ?auto_2658434 ) ) ( not ( = ?auto_2658430 ?auto_2658431 ) ) ( not ( = ?auto_2658430 ?auto_2658432 ) ) ( not ( = ?auto_2658430 ?auto_2658433 ) ) ( not ( = ?auto_2658430 ?auto_2658434 ) ) ( not ( = ?auto_2658431 ?auto_2658432 ) ) ( not ( = ?auto_2658431 ?auto_2658433 ) ) ( not ( = ?auto_2658431 ?auto_2658434 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658432 ?auto_2658433 ?auto_2658434 )
      ( MAKE-5CRATE-VERIFY ?auto_2658429 ?auto_2658430 ?auto_2658431 ?auto_2658432 ?auto_2658433 ?auto_2658434 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2658474 - SURFACE
      ?auto_2658475 - SURFACE
      ?auto_2658476 - SURFACE
      ?auto_2658477 - SURFACE
      ?auto_2658478 - SURFACE
      ?auto_2658479 - SURFACE
    )
    :vars
    (
      ?auto_2658480 - HOIST
      ?auto_2658482 - PLACE
      ?auto_2658483 - TRUCK
      ?auto_2658481 - PLACE
      ?auto_2658484 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658480 ?auto_2658482 ) ( SURFACE-AT ?auto_2658478 ?auto_2658482 ) ( CLEAR ?auto_2658478 ) ( IS-CRATE ?auto_2658479 ) ( not ( = ?auto_2658478 ?auto_2658479 ) ) ( AVAILABLE ?auto_2658480 ) ( ON ?auto_2658478 ?auto_2658477 ) ( not ( = ?auto_2658477 ?auto_2658478 ) ) ( not ( = ?auto_2658477 ?auto_2658479 ) ) ( TRUCK-AT ?auto_2658483 ?auto_2658481 ) ( not ( = ?auto_2658481 ?auto_2658482 ) ) ( HOIST-AT ?auto_2658484 ?auto_2658481 ) ( LIFTING ?auto_2658484 ?auto_2658479 ) ( not ( = ?auto_2658480 ?auto_2658484 ) ) ( ON ?auto_2658475 ?auto_2658474 ) ( ON ?auto_2658476 ?auto_2658475 ) ( ON ?auto_2658477 ?auto_2658476 ) ( not ( = ?auto_2658474 ?auto_2658475 ) ) ( not ( = ?auto_2658474 ?auto_2658476 ) ) ( not ( = ?auto_2658474 ?auto_2658477 ) ) ( not ( = ?auto_2658474 ?auto_2658478 ) ) ( not ( = ?auto_2658474 ?auto_2658479 ) ) ( not ( = ?auto_2658475 ?auto_2658476 ) ) ( not ( = ?auto_2658475 ?auto_2658477 ) ) ( not ( = ?auto_2658475 ?auto_2658478 ) ) ( not ( = ?auto_2658475 ?auto_2658479 ) ) ( not ( = ?auto_2658476 ?auto_2658477 ) ) ( not ( = ?auto_2658476 ?auto_2658478 ) ) ( not ( = ?auto_2658476 ?auto_2658479 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658477 ?auto_2658478 ?auto_2658479 )
      ( MAKE-5CRATE-VERIFY ?auto_2658474 ?auto_2658475 ?auto_2658476 ?auto_2658477 ?auto_2658478 ?auto_2658479 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2658524 - SURFACE
      ?auto_2658525 - SURFACE
      ?auto_2658526 - SURFACE
      ?auto_2658527 - SURFACE
      ?auto_2658528 - SURFACE
      ?auto_2658529 - SURFACE
    )
    :vars
    (
      ?auto_2658532 - HOIST
      ?auto_2658534 - PLACE
      ?auto_2658530 - TRUCK
      ?auto_2658535 - PLACE
      ?auto_2658533 - HOIST
      ?auto_2658531 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658532 ?auto_2658534 ) ( SURFACE-AT ?auto_2658528 ?auto_2658534 ) ( CLEAR ?auto_2658528 ) ( IS-CRATE ?auto_2658529 ) ( not ( = ?auto_2658528 ?auto_2658529 ) ) ( AVAILABLE ?auto_2658532 ) ( ON ?auto_2658528 ?auto_2658527 ) ( not ( = ?auto_2658527 ?auto_2658528 ) ) ( not ( = ?auto_2658527 ?auto_2658529 ) ) ( TRUCK-AT ?auto_2658530 ?auto_2658535 ) ( not ( = ?auto_2658535 ?auto_2658534 ) ) ( HOIST-AT ?auto_2658533 ?auto_2658535 ) ( not ( = ?auto_2658532 ?auto_2658533 ) ) ( AVAILABLE ?auto_2658533 ) ( SURFACE-AT ?auto_2658529 ?auto_2658535 ) ( ON ?auto_2658529 ?auto_2658531 ) ( CLEAR ?auto_2658529 ) ( not ( = ?auto_2658528 ?auto_2658531 ) ) ( not ( = ?auto_2658529 ?auto_2658531 ) ) ( not ( = ?auto_2658527 ?auto_2658531 ) ) ( ON ?auto_2658525 ?auto_2658524 ) ( ON ?auto_2658526 ?auto_2658525 ) ( ON ?auto_2658527 ?auto_2658526 ) ( not ( = ?auto_2658524 ?auto_2658525 ) ) ( not ( = ?auto_2658524 ?auto_2658526 ) ) ( not ( = ?auto_2658524 ?auto_2658527 ) ) ( not ( = ?auto_2658524 ?auto_2658528 ) ) ( not ( = ?auto_2658524 ?auto_2658529 ) ) ( not ( = ?auto_2658524 ?auto_2658531 ) ) ( not ( = ?auto_2658525 ?auto_2658526 ) ) ( not ( = ?auto_2658525 ?auto_2658527 ) ) ( not ( = ?auto_2658525 ?auto_2658528 ) ) ( not ( = ?auto_2658525 ?auto_2658529 ) ) ( not ( = ?auto_2658525 ?auto_2658531 ) ) ( not ( = ?auto_2658526 ?auto_2658527 ) ) ( not ( = ?auto_2658526 ?auto_2658528 ) ) ( not ( = ?auto_2658526 ?auto_2658529 ) ) ( not ( = ?auto_2658526 ?auto_2658531 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658527 ?auto_2658528 ?auto_2658529 )
      ( MAKE-5CRATE-VERIFY ?auto_2658524 ?auto_2658525 ?auto_2658526 ?auto_2658527 ?auto_2658528 ?auto_2658529 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2658575 - SURFACE
      ?auto_2658576 - SURFACE
      ?auto_2658577 - SURFACE
      ?auto_2658578 - SURFACE
      ?auto_2658579 - SURFACE
      ?auto_2658580 - SURFACE
    )
    :vars
    (
      ?auto_2658585 - HOIST
      ?auto_2658583 - PLACE
      ?auto_2658581 - PLACE
      ?auto_2658584 - HOIST
      ?auto_2658582 - SURFACE
      ?auto_2658586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658585 ?auto_2658583 ) ( SURFACE-AT ?auto_2658579 ?auto_2658583 ) ( CLEAR ?auto_2658579 ) ( IS-CRATE ?auto_2658580 ) ( not ( = ?auto_2658579 ?auto_2658580 ) ) ( AVAILABLE ?auto_2658585 ) ( ON ?auto_2658579 ?auto_2658578 ) ( not ( = ?auto_2658578 ?auto_2658579 ) ) ( not ( = ?auto_2658578 ?auto_2658580 ) ) ( not ( = ?auto_2658581 ?auto_2658583 ) ) ( HOIST-AT ?auto_2658584 ?auto_2658581 ) ( not ( = ?auto_2658585 ?auto_2658584 ) ) ( AVAILABLE ?auto_2658584 ) ( SURFACE-AT ?auto_2658580 ?auto_2658581 ) ( ON ?auto_2658580 ?auto_2658582 ) ( CLEAR ?auto_2658580 ) ( not ( = ?auto_2658579 ?auto_2658582 ) ) ( not ( = ?auto_2658580 ?auto_2658582 ) ) ( not ( = ?auto_2658578 ?auto_2658582 ) ) ( TRUCK-AT ?auto_2658586 ?auto_2658583 ) ( ON ?auto_2658576 ?auto_2658575 ) ( ON ?auto_2658577 ?auto_2658576 ) ( ON ?auto_2658578 ?auto_2658577 ) ( not ( = ?auto_2658575 ?auto_2658576 ) ) ( not ( = ?auto_2658575 ?auto_2658577 ) ) ( not ( = ?auto_2658575 ?auto_2658578 ) ) ( not ( = ?auto_2658575 ?auto_2658579 ) ) ( not ( = ?auto_2658575 ?auto_2658580 ) ) ( not ( = ?auto_2658575 ?auto_2658582 ) ) ( not ( = ?auto_2658576 ?auto_2658577 ) ) ( not ( = ?auto_2658576 ?auto_2658578 ) ) ( not ( = ?auto_2658576 ?auto_2658579 ) ) ( not ( = ?auto_2658576 ?auto_2658580 ) ) ( not ( = ?auto_2658576 ?auto_2658582 ) ) ( not ( = ?auto_2658577 ?auto_2658578 ) ) ( not ( = ?auto_2658577 ?auto_2658579 ) ) ( not ( = ?auto_2658577 ?auto_2658580 ) ) ( not ( = ?auto_2658577 ?auto_2658582 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658578 ?auto_2658579 ?auto_2658580 )
      ( MAKE-5CRATE-VERIFY ?auto_2658575 ?auto_2658576 ?auto_2658577 ?auto_2658578 ?auto_2658579 ?auto_2658580 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2658626 - SURFACE
      ?auto_2658627 - SURFACE
      ?auto_2658628 - SURFACE
      ?auto_2658629 - SURFACE
      ?auto_2658630 - SURFACE
      ?auto_2658631 - SURFACE
    )
    :vars
    (
      ?auto_2658633 - HOIST
      ?auto_2658636 - PLACE
      ?auto_2658634 - PLACE
      ?auto_2658632 - HOIST
      ?auto_2658635 - SURFACE
      ?auto_2658637 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658633 ?auto_2658636 ) ( IS-CRATE ?auto_2658631 ) ( not ( = ?auto_2658630 ?auto_2658631 ) ) ( not ( = ?auto_2658629 ?auto_2658630 ) ) ( not ( = ?auto_2658629 ?auto_2658631 ) ) ( not ( = ?auto_2658634 ?auto_2658636 ) ) ( HOIST-AT ?auto_2658632 ?auto_2658634 ) ( not ( = ?auto_2658633 ?auto_2658632 ) ) ( AVAILABLE ?auto_2658632 ) ( SURFACE-AT ?auto_2658631 ?auto_2658634 ) ( ON ?auto_2658631 ?auto_2658635 ) ( CLEAR ?auto_2658631 ) ( not ( = ?auto_2658630 ?auto_2658635 ) ) ( not ( = ?auto_2658631 ?auto_2658635 ) ) ( not ( = ?auto_2658629 ?auto_2658635 ) ) ( TRUCK-AT ?auto_2658637 ?auto_2658636 ) ( SURFACE-AT ?auto_2658629 ?auto_2658636 ) ( CLEAR ?auto_2658629 ) ( LIFTING ?auto_2658633 ?auto_2658630 ) ( IS-CRATE ?auto_2658630 ) ( ON ?auto_2658627 ?auto_2658626 ) ( ON ?auto_2658628 ?auto_2658627 ) ( ON ?auto_2658629 ?auto_2658628 ) ( not ( = ?auto_2658626 ?auto_2658627 ) ) ( not ( = ?auto_2658626 ?auto_2658628 ) ) ( not ( = ?auto_2658626 ?auto_2658629 ) ) ( not ( = ?auto_2658626 ?auto_2658630 ) ) ( not ( = ?auto_2658626 ?auto_2658631 ) ) ( not ( = ?auto_2658626 ?auto_2658635 ) ) ( not ( = ?auto_2658627 ?auto_2658628 ) ) ( not ( = ?auto_2658627 ?auto_2658629 ) ) ( not ( = ?auto_2658627 ?auto_2658630 ) ) ( not ( = ?auto_2658627 ?auto_2658631 ) ) ( not ( = ?auto_2658627 ?auto_2658635 ) ) ( not ( = ?auto_2658628 ?auto_2658629 ) ) ( not ( = ?auto_2658628 ?auto_2658630 ) ) ( not ( = ?auto_2658628 ?auto_2658631 ) ) ( not ( = ?auto_2658628 ?auto_2658635 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658629 ?auto_2658630 ?auto_2658631 )
      ( MAKE-5CRATE-VERIFY ?auto_2658626 ?auto_2658627 ?auto_2658628 ?auto_2658629 ?auto_2658630 ?auto_2658631 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2658677 - SURFACE
      ?auto_2658678 - SURFACE
      ?auto_2658679 - SURFACE
      ?auto_2658680 - SURFACE
      ?auto_2658681 - SURFACE
      ?auto_2658682 - SURFACE
    )
    :vars
    (
      ?auto_2658685 - HOIST
      ?auto_2658688 - PLACE
      ?auto_2658684 - PLACE
      ?auto_2658683 - HOIST
      ?auto_2658686 - SURFACE
      ?auto_2658687 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658685 ?auto_2658688 ) ( IS-CRATE ?auto_2658682 ) ( not ( = ?auto_2658681 ?auto_2658682 ) ) ( not ( = ?auto_2658680 ?auto_2658681 ) ) ( not ( = ?auto_2658680 ?auto_2658682 ) ) ( not ( = ?auto_2658684 ?auto_2658688 ) ) ( HOIST-AT ?auto_2658683 ?auto_2658684 ) ( not ( = ?auto_2658685 ?auto_2658683 ) ) ( AVAILABLE ?auto_2658683 ) ( SURFACE-AT ?auto_2658682 ?auto_2658684 ) ( ON ?auto_2658682 ?auto_2658686 ) ( CLEAR ?auto_2658682 ) ( not ( = ?auto_2658681 ?auto_2658686 ) ) ( not ( = ?auto_2658682 ?auto_2658686 ) ) ( not ( = ?auto_2658680 ?auto_2658686 ) ) ( TRUCK-AT ?auto_2658687 ?auto_2658688 ) ( SURFACE-AT ?auto_2658680 ?auto_2658688 ) ( CLEAR ?auto_2658680 ) ( IS-CRATE ?auto_2658681 ) ( AVAILABLE ?auto_2658685 ) ( IN ?auto_2658681 ?auto_2658687 ) ( ON ?auto_2658678 ?auto_2658677 ) ( ON ?auto_2658679 ?auto_2658678 ) ( ON ?auto_2658680 ?auto_2658679 ) ( not ( = ?auto_2658677 ?auto_2658678 ) ) ( not ( = ?auto_2658677 ?auto_2658679 ) ) ( not ( = ?auto_2658677 ?auto_2658680 ) ) ( not ( = ?auto_2658677 ?auto_2658681 ) ) ( not ( = ?auto_2658677 ?auto_2658682 ) ) ( not ( = ?auto_2658677 ?auto_2658686 ) ) ( not ( = ?auto_2658678 ?auto_2658679 ) ) ( not ( = ?auto_2658678 ?auto_2658680 ) ) ( not ( = ?auto_2658678 ?auto_2658681 ) ) ( not ( = ?auto_2658678 ?auto_2658682 ) ) ( not ( = ?auto_2658678 ?auto_2658686 ) ) ( not ( = ?auto_2658679 ?auto_2658680 ) ) ( not ( = ?auto_2658679 ?auto_2658681 ) ) ( not ( = ?auto_2658679 ?auto_2658682 ) ) ( not ( = ?auto_2658679 ?auto_2658686 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658680 ?auto_2658681 ?auto_2658682 )
      ( MAKE-5CRATE-VERIFY ?auto_2658677 ?auto_2658678 ?auto_2658679 ?auto_2658680 ?auto_2658681 ?auto_2658682 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2658689 - SURFACE
      ?auto_2658690 - SURFACE
    )
    :vars
    (
      ?auto_2658694 - HOIST
      ?auto_2658697 - PLACE
      ?auto_2658692 - SURFACE
      ?auto_2658693 - PLACE
      ?auto_2658691 - HOIST
      ?auto_2658695 - SURFACE
      ?auto_2658696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658694 ?auto_2658697 ) ( IS-CRATE ?auto_2658690 ) ( not ( = ?auto_2658689 ?auto_2658690 ) ) ( not ( = ?auto_2658692 ?auto_2658689 ) ) ( not ( = ?auto_2658692 ?auto_2658690 ) ) ( not ( = ?auto_2658693 ?auto_2658697 ) ) ( HOIST-AT ?auto_2658691 ?auto_2658693 ) ( not ( = ?auto_2658694 ?auto_2658691 ) ) ( AVAILABLE ?auto_2658691 ) ( SURFACE-AT ?auto_2658690 ?auto_2658693 ) ( ON ?auto_2658690 ?auto_2658695 ) ( CLEAR ?auto_2658690 ) ( not ( = ?auto_2658689 ?auto_2658695 ) ) ( not ( = ?auto_2658690 ?auto_2658695 ) ) ( not ( = ?auto_2658692 ?auto_2658695 ) ) ( SURFACE-AT ?auto_2658692 ?auto_2658697 ) ( CLEAR ?auto_2658692 ) ( IS-CRATE ?auto_2658689 ) ( AVAILABLE ?auto_2658694 ) ( IN ?auto_2658689 ?auto_2658696 ) ( TRUCK-AT ?auto_2658696 ?auto_2658693 ) )
    :subtasks
    ( ( !DRIVE ?auto_2658696 ?auto_2658693 ?auto_2658697 )
      ( MAKE-2CRATE ?auto_2658692 ?auto_2658689 ?auto_2658690 )
      ( MAKE-1CRATE-VERIFY ?auto_2658689 ?auto_2658690 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2658698 - SURFACE
      ?auto_2658699 - SURFACE
      ?auto_2658700 - SURFACE
    )
    :vars
    (
      ?auto_2658706 - HOIST
      ?auto_2658703 - PLACE
      ?auto_2658704 - PLACE
      ?auto_2658701 - HOIST
      ?auto_2658702 - SURFACE
      ?auto_2658705 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658706 ?auto_2658703 ) ( IS-CRATE ?auto_2658700 ) ( not ( = ?auto_2658699 ?auto_2658700 ) ) ( not ( = ?auto_2658698 ?auto_2658699 ) ) ( not ( = ?auto_2658698 ?auto_2658700 ) ) ( not ( = ?auto_2658704 ?auto_2658703 ) ) ( HOIST-AT ?auto_2658701 ?auto_2658704 ) ( not ( = ?auto_2658706 ?auto_2658701 ) ) ( AVAILABLE ?auto_2658701 ) ( SURFACE-AT ?auto_2658700 ?auto_2658704 ) ( ON ?auto_2658700 ?auto_2658702 ) ( CLEAR ?auto_2658700 ) ( not ( = ?auto_2658699 ?auto_2658702 ) ) ( not ( = ?auto_2658700 ?auto_2658702 ) ) ( not ( = ?auto_2658698 ?auto_2658702 ) ) ( SURFACE-AT ?auto_2658698 ?auto_2658703 ) ( CLEAR ?auto_2658698 ) ( IS-CRATE ?auto_2658699 ) ( AVAILABLE ?auto_2658706 ) ( IN ?auto_2658699 ?auto_2658705 ) ( TRUCK-AT ?auto_2658705 ?auto_2658704 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2658699 ?auto_2658700 )
      ( MAKE-2CRATE-VERIFY ?auto_2658698 ?auto_2658699 ?auto_2658700 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2658707 - SURFACE
      ?auto_2658708 - SURFACE
      ?auto_2658709 - SURFACE
      ?auto_2658710 - SURFACE
    )
    :vars
    (
      ?auto_2658715 - HOIST
      ?auto_2658716 - PLACE
      ?auto_2658713 - PLACE
      ?auto_2658714 - HOIST
      ?auto_2658711 - SURFACE
      ?auto_2658712 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658715 ?auto_2658716 ) ( IS-CRATE ?auto_2658710 ) ( not ( = ?auto_2658709 ?auto_2658710 ) ) ( not ( = ?auto_2658708 ?auto_2658709 ) ) ( not ( = ?auto_2658708 ?auto_2658710 ) ) ( not ( = ?auto_2658713 ?auto_2658716 ) ) ( HOIST-AT ?auto_2658714 ?auto_2658713 ) ( not ( = ?auto_2658715 ?auto_2658714 ) ) ( AVAILABLE ?auto_2658714 ) ( SURFACE-AT ?auto_2658710 ?auto_2658713 ) ( ON ?auto_2658710 ?auto_2658711 ) ( CLEAR ?auto_2658710 ) ( not ( = ?auto_2658709 ?auto_2658711 ) ) ( not ( = ?auto_2658710 ?auto_2658711 ) ) ( not ( = ?auto_2658708 ?auto_2658711 ) ) ( SURFACE-AT ?auto_2658708 ?auto_2658716 ) ( CLEAR ?auto_2658708 ) ( IS-CRATE ?auto_2658709 ) ( AVAILABLE ?auto_2658715 ) ( IN ?auto_2658709 ?auto_2658712 ) ( TRUCK-AT ?auto_2658712 ?auto_2658713 ) ( ON ?auto_2658708 ?auto_2658707 ) ( not ( = ?auto_2658707 ?auto_2658708 ) ) ( not ( = ?auto_2658707 ?auto_2658709 ) ) ( not ( = ?auto_2658707 ?auto_2658710 ) ) ( not ( = ?auto_2658707 ?auto_2658711 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658708 ?auto_2658709 ?auto_2658710 )
      ( MAKE-3CRATE-VERIFY ?auto_2658707 ?auto_2658708 ?auto_2658709 ?auto_2658710 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2658717 - SURFACE
      ?auto_2658718 - SURFACE
      ?auto_2658719 - SURFACE
      ?auto_2658720 - SURFACE
      ?auto_2658721 - SURFACE
    )
    :vars
    (
      ?auto_2658726 - HOIST
      ?auto_2658727 - PLACE
      ?auto_2658724 - PLACE
      ?auto_2658725 - HOIST
      ?auto_2658722 - SURFACE
      ?auto_2658723 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658726 ?auto_2658727 ) ( IS-CRATE ?auto_2658721 ) ( not ( = ?auto_2658720 ?auto_2658721 ) ) ( not ( = ?auto_2658719 ?auto_2658720 ) ) ( not ( = ?auto_2658719 ?auto_2658721 ) ) ( not ( = ?auto_2658724 ?auto_2658727 ) ) ( HOIST-AT ?auto_2658725 ?auto_2658724 ) ( not ( = ?auto_2658726 ?auto_2658725 ) ) ( AVAILABLE ?auto_2658725 ) ( SURFACE-AT ?auto_2658721 ?auto_2658724 ) ( ON ?auto_2658721 ?auto_2658722 ) ( CLEAR ?auto_2658721 ) ( not ( = ?auto_2658720 ?auto_2658722 ) ) ( not ( = ?auto_2658721 ?auto_2658722 ) ) ( not ( = ?auto_2658719 ?auto_2658722 ) ) ( SURFACE-AT ?auto_2658719 ?auto_2658727 ) ( CLEAR ?auto_2658719 ) ( IS-CRATE ?auto_2658720 ) ( AVAILABLE ?auto_2658726 ) ( IN ?auto_2658720 ?auto_2658723 ) ( TRUCK-AT ?auto_2658723 ?auto_2658724 ) ( ON ?auto_2658718 ?auto_2658717 ) ( ON ?auto_2658719 ?auto_2658718 ) ( not ( = ?auto_2658717 ?auto_2658718 ) ) ( not ( = ?auto_2658717 ?auto_2658719 ) ) ( not ( = ?auto_2658717 ?auto_2658720 ) ) ( not ( = ?auto_2658717 ?auto_2658721 ) ) ( not ( = ?auto_2658717 ?auto_2658722 ) ) ( not ( = ?auto_2658718 ?auto_2658719 ) ) ( not ( = ?auto_2658718 ?auto_2658720 ) ) ( not ( = ?auto_2658718 ?auto_2658721 ) ) ( not ( = ?auto_2658718 ?auto_2658722 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658719 ?auto_2658720 ?auto_2658721 )
      ( MAKE-4CRATE-VERIFY ?auto_2658717 ?auto_2658718 ?auto_2658719 ?auto_2658720 ?auto_2658721 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2658728 - SURFACE
      ?auto_2658729 - SURFACE
      ?auto_2658730 - SURFACE
      ?auto_2658731 - SURFACE
      ?auto_2658732 - SURFACE
      ?auto_2658733 - SURFACE
    )
    :vars
    (
      ?auto_2658738 - HOIST
      ?auto_2658739 - PLACE
      ?auto_2658736 - PLACE
      ?auto_2658737 - HOIST
      ?auto_2658734 - SURFACE
      ?auto_2658735 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658738 ?auto_2658739 ) ( IS-CRATE ?auto_2658733 ) ( not ( = ?auto_2658732 ?auto_2658733 ) ) ( not ( = ?auto_2658731 ?auto_2658732 ) ) ( not ( = ?auto_2658731 ?auto_2658733 ) ) ( not ( = ?auto_2658736 ?auto_2658739 ) ) ( HOIST-AT ?auto_2658737 ?auto_2658736 ) ( not ( = ?auto_2658738 ?auto_2658737 ) ) ( AVAILABLE ?auto_2658737 ) ( SURFACE-AT ?auto_2658733 ?auto_2658736 ) ( ON ?auto_2658733 ?auto_2658734 ) ( CLEAR ?auto_2658733 ) ( not ( = ?auto_2658732 ?auto_2658734 ) ) ( not ( = ?auto_2658733 ?auto_2658734 ) ) ( not ( = ?auto_2658731 ?auto_2658734 ) ) ( SURFACE-AT ?auto_2658731 ?auto_2658739 ) ( CLEAR ?auto_2658731 ) ( IS-CRATE ?auto_2658732 ) ( AVAILABLE ?auto_2658738 ) ( IN ?auto_2658732 ?auto_2658735 ) ( TRUCK-AT ?auto_2658735 ?auto_2658736 ) ( ON ?auto_2658729 ?auto_2658728 ) ( ON ?auto_2658730 ?auto_2658729 ) ( ON ?auto_2658731 ?auto_2658730 ) ( not ( = ?auto_2658728 ?auto_2658729 ) ) ( not ( = ?auto_2658728 ?auto_2658730 ) ) ( not ( = ?auto_2658728 ?auto_2658731 ) ) ( not ( = ?auto_2658728 ?auto_2658732 ) ) ( not ( = ?auto_2658728 ?auto_2658733 ) ) ( not ( = ?auto_2658728 ?auto_2658734 ) ) ( not ( = ?auto_2658729 ?auto_2658730 ) ) ( not ( = ?auto_2658729 ?auto_2658731 ) ) ( not ( = ?auto_2658729 ?auto_2658732 ) ) ( not ( = ?auto_2658729 ?auto_2658733 ) ) ( not ( = ?auto_2658729 ?auto_2658734 ) ) ( not ( = ?auto_2658730 ?auto_2658731 ) ) ( not ( = ?auto_2658730 ?auto_2658732 ) ) ( not ( = ?auto_2658730 ?auto_2658733 ) ) ( not ( = ?auto_2658730 ?auto_2658734 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658731 ?auto_2658732 ?auto_2658733 )
      ( MAKE-5CRATE-VERIFY ?auto_2658728 ?auto_2658729 ?auto_2658730 ?auto_2658731 ?auto_2658732 ?auto_2658733 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2658740 - SURFACE
      ?auto_2658741 - SURFACE
    )
    :vars
    (
      ?auto_2658747 - HOIST
      ?auto_2658748 - PLACE
      ?auto_2658742 - SURFACE
      ?auto_2658745 - PLACE
      ?auto_2658746 - HOIST
      ?auto_2658743 - SURFACE
      ?auto_2658744 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658747 ?auto_2658748 ) ( IS-CRATE ?auto_2658741 ) ( not ( = ?auto_2658740 ?auto_2658741 ) ) ( not ( = ?auto_2658742 ?auto_2658740 ) ) ( not ( = ?auto_2658742 ?auto_2658741 ) ) ( not ( = ?auto_2658745 ?auto_2658748 ) ) ( HOIST-AT ?auto_2658746 ?auto_2658745 ) ( not ( = ?auto_2658747 ?auto_2658746 ) ) ( SURFACE-AT ?auto_2658741 ?auto_2658745 ) ( ON ?auto_2658741 ?auto_2658743 ) ( CLEAR ?auto_2658741 ) ( not ( = ?auto_2658740 ?auto_2658743 ) ) ( not ( = ?auto_2658741 ?auto_2658743 ) ) ( not ( = ?auto_2658742 ?auto_2658743 ) ) ( SURFACE-AT ?auto_2658742 ?auto_2658748 ) ( CLEAR ?auto_2658742 ) ( IS-CRATE ?auto_2658740 ) ( AVAILABLE ?auto_2658747 ) ( TRUCK-AT ?auto_2658744 ?auto_2658745 ) ( LIFTING ?auto_2658746 ?auto_2658740 ) )
    :subtasks
    ( ( !LOAD ?auto_2658746 ?auto_2658740 ?auto_2658744 ?auto_2658745 )
      ( MAKE-2CRATE ?auto_2658742 ?auto_2658740 ?auto_2658741 )
      ( MAKE-1CRATE-VERIFY ?auto_2658740 ?auto_2658741 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2658749 - SURFACE
      ?auto_2658750 - SURFACE
      ?auto_2658751 - SURFACE
    )
    :vars
    (
      ?auto_2658753 - HOIST
      ?auto_2658757 - PLACE
      ?auto_2658756 - PLACE
      ?auto_2658754 - HOIST
      ?auto_2658755 - SURFACE
      ?auto_2658752 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658753 ?auto_2658757 ) ( IS-CRATE ?auto_2658751 ) ( not ( = ?auto_2658750 ?auto_2658751 ) ) ( not ( = ?auto_2658749 ?auto_2658750 ) ) ( not ( = ?auto_2658749 ?auto_2658751 ) ) ( not ( = ?auto_2658756 ?auto_2658757 ) ) ( HOIST-AT ?auto_2658754 ?auto_2658756 ) ( not ( = ?auto_2658753 ?auto_2658754 ) ) ( SURFACE-AT ?auto_2658751 ?auto_2658756 ) ( ON ?auto_2658751 ?auto_2658755 ) ( CLEAR ?auto_2658751 ) ( not ( = ?auto_2658750 ?auto_2658755 ) ) ( not ( = ?auto_2658751 ?auto_2658755 ) ) ( not ( = ?auto_2658749 ?auto_2658755 ) ) ( SURFACE-AT ?auto_2658749 ?auto_2658757 ) ( CLEAR ?auto_2658749 ) ( IS-CRATE ?auto_2658750 ) ( AVAILABLE ?auto_2658753 ) ( TRUCK-AT ?auto_2658752 ?auto_2658756 ) ( LIFTING ?auto_2658754 ?auto_2658750 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2658750 ?auto_2658751 )
      ( MAKE-2CRATE-VERIFY ?auto_2658749 ?auto_2658750 ?auto_2658751 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2658758 - SURFACE
      ?auto_2658759 - SURFACE
      ?auto_2658760 - SURFACE
      ?auto_2658761 - SURFACE
    )
    :vars
    (
      ?auto_2658766 - HOIST
      ?auto_2658765 - PLACE
      ?auto_2658764 - PLACE
      ?auto_2658767 - HOIST
      ?auto_2658762 - SURFACE
      ?auto_2658763 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658766 ?auto_2658765 ) ( IS-CRATE ?auto_2658761 ) ( not ( = ?auto_2658760 ?auto_2658761 ) ) ( not ( = ?auto_2658759 ?auto_2658760 ) ) ( not ( = ?auto_2658759 ?auto_2658761 ) ) ( not ( = ?auto_2658764 ?auto_2658765 ) ) ( HOIST-AT ?auto_2658767 ?auto_2658764 ) ( not ( = ?auto_2658766 ?auto_2658767 ) ) ( SURFACE-AT ?auto_2658761 ?auto_2658764 ) ( ON ?auto_2658761 ?auto_2658762 ) ( CLEAR ?auto_2658761 ) ( not ( = ?auto_2658760 ?auto_2658762 ) ) ( not ( = ?auto_2658761 ?auto_2658762 ) ) ( not ( = ?auto_2658759 ?auto_2658762 ) ) ( SURFACE-AT ?auto_2658759 ?auto_2658765 ) ( CLEAR ?auto_2658759 ) ( IS-CRATE ?auto_2658760 ) ( AVAILABLE ?auto_2658766 ) ( TRUCK-AT ?auto_2658763 ?auto_2658764 ) ( LIFTING ?auto_2658767 ?auto_2658760 ) ( ON ?auto_2658759 ?auto_2658758 ) ( not ( = ?auto_2658758 ?auto_2658759 ) ) ( not ( = ?auto_2658758 ?auto_2658760 ) ) ( not ( = ?auto_2658758 ?auto_2658761 ) ) ( not ( = ?auto_2658758 ?auto_2658762 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658759 ?auto_2658760 ?auto_2658761 )
      ( MAKE-3CRATE-VERIFY ?auto_2658758 ?auto_2658759 ?auto_2658760 ?auto_2658761 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2658768 - SURFACE
      ?auto_2658769 - SURFACE
      ?auto_2658770 - SURFACE
      ?auto_2658771 - SURFACE
      ?auto_2658772 - SURFACE
    )
    :vars
    (
      ?auto_2658777 - HOIST
      ?auto_2658776 - PLACE
      ?auto_2658775 - PLACE
      ?auto_2658778 - HOIST
      ?auto_2658773 - SURFACE
      ?auto_2658774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658777 ?auto_2658776 ) ( IS-CRATE ?auto_2658772 ) ( not ( = ?auto_2658771 ?auto_2658772 ) ) ( not ( = ?auto_2658770 ?auto_2658771 ) ) ( not ( = ?auto_2658770 ?auto_2658772 ) ) ( not ( = ?auto_2658775 ?auto_2658776 ) ) ( HOIST-AT ?auto_2658778 ?auto_2658775 ) ( not ( = ?auto_2658777 ?auto_2658778 ) ) ( SURFACE-AT ?auto_2658772 ?auto_2658775 ) ( ON ?auto_2658772 ?auto_2658773 ) ( CLEAR ?auto_2658772 ) ( not ( = ?auto_2658771 ?auto_2658773 ) ) ( not ( = ?auto_2658772 ?auto_2658773 ) ) ( not ( = ?auto_2658770 ?auto_2658773 ) ) ( SURFACE-AT ?auto_2658770 ?auto_2658776 ) ( CLEAR ?auto_2658770 ) ( IS-CRATE ?auto_2658771 ) ( AVAILABLE ?auto_2658777 ) ( TRUCK-AT ?auto_2658774 ?auto_2658775 ) ( LIFTING ?auto_2658778 ?auto_2658771 ) ( ON ?auto_2658769 ?auto_2658768 ) ( ON ?auto_2658770 ?auto_2658769 ) ( not ( = ?auto_2658768 ?auto_2658769 ) ) ( not ( = ?auto_2658768 ?auto_2658770 ) ) ( not ( = ?auto_2658768 ?auto_2658771 ) ) ( not ( = ?auto_2658768 ?auto_2658772 ) ) ( not ( = ?auto_2658768 ?auto_2658773 ) ) ( not ( = ?auto_2658769 ?auto_2658770 ) ) ( not ( = ?auto_2658769 ?auto_2658771 ) ) ( not ( = ?auto_2658769 ?auto_2658772 ) ) ( not ( = ?auto_2658769 ?auto_2658773 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658770 ?auto_2658771 ?auto_2658772 )
      ( MAKE-4CRATE-VERIFY ?auto_2658768 ?auto_2658769 ?auto_2658770 ?auto_2658771 ?auto_2658772 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2658779 - SURFACE
      ?auto_2658780 - SURFACE
      ?auto_2658781 - SURFACE
      ?auto_2658782 - SURFACE
      ?auto_2658783 - SURFACE
      ?auto_2658784 - SURFACE
    )
    :vars
    (
      ?auto_2658789 - HOIST
      ?auto_2658788 - PLACE
      ?auto_2658787 - PLACE
      ?auto_2658790 - HOIST
      ?auto_2658785 - SURFACE
      ?auto_2658786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658789 ?auto_2658788 ) ( IS-CRATE ?auto_2658784 ) ( not ( = ?auto_2658783 ?auto_2658784 ) ) ( not ( = ?auto_2658782 ?auto_2658783 ) ) ( not ( = ?auto_2658782 ?auto_2658784 ) ) ( not ( = ?auto_2658787 ?auto_2658788 ) ) ( HOIST-AT ?auto_2658790 ?auto_2658787 ) ( not ( = ?auto_2658789 ?auto_2658790 ) ) ( SURFACE-AT ?auto_2658784 ?auto_2658787 ) ( ON ?auto_2658784 ?auto_2658785 ) ( CLEAR ?auto_2658784 ) ( not ( = ?auto_2658783 ?auto_2658785 ) ) ( not ( = ?auto_2658784 ?auto_2658785 ) ) ( not ( = ?auto_2658782 ?auto_2658785 ) ) ( SURFACE-AT ?auto_2658782 ?auto_2658788 ) ( CLEAR ?auto_2658782 ) ( IS-CRATE ?auto_2658783 ) ( AVAILABLE ?auto_2658789 ) ( TRUCK-AT ?auto_2658786 ?auto_2658787 ) ( LIFTING ?auto_2658790 ?auto_2658783 ) ( ON ?auto_2658780 ?auto_2658779 ) ( ON ?auto_2658781 ?auto_2658780 ) ( ON ?auto_2658782 ?auto_2658781 ) ( not ( = ?auto_2658779 ?auto_2658780 ) ) ( not ( = ?auto_2658779 ?auto_2658781 ) ) ( not ( = ?auto_2658779 ?auto_2658782 ) ) ( not ( = ?auto_2658779 ?auto_2658783 ) ) ( not ( = ?auto_2658779 ?auto_2658784 ) ) ( not ( = ?auto_2658779 ?auto_2658785 ) ) ( not ( = ?auto_2658780 ?auto_2658781 ) ) ( not ( = ?auto_2658780 ?auto_2658782 ) ) ( not ( = ?auto_2658780 ?auto_2658783 ) ) ( not ( = ?auto_2658780 ?auto_2658784 ) ) ( not ( = ?auto_2658780 ?auto_2658785 ) ) ( not ( = ?auto_2658781 ?auto_2658782 ) ) ( not ( = ?auto_2658781 ?auto_2658783 ) ) ( not ( = ?auto_2658781 ?auto_2658784 ) ) ( not ( = ?auto_2658781 ?auto_2658785 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658782 ?auto_2658783 ?auto_2658784 )
      ( MAKE-5CRATE-VERIFY ?auto_2658779 ?auto_2658780 ?auto_2658781 ?auto_2658782 ?auto_2658783 ?auto_2658784 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2658791 - SURFACE
      ?auto_2658792 - SURFACE
    )
    :vars
    (
      ?auto_2658797 - HOIST
      ?auto_2658796 - PLACE
      ?auto_2658798 - SURFACE
      ?auto_2658795 - PLACE
      ?auto_2658799 - HOIST
      ?auto_2658793 - SURFACE
      ?auto_2658794 - TRUCK
      ?auto_2658800 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658797 ?auto_2658796 ) ( IS-CRATE ?auto_2658792 ) ( not ( = ?auto_2658791 ?auto_2658792 ) ) ( not ( = ?auto_2658798 ?auto_2658791 ) ) ( not ( = ?auto_2658798 ?auto_2658792 ) ) ( not ( = ?auto_2658795 ?auto_2658796 ) ) ( HOIST-AT ?auto_2658799 ?auto_2658795 ) ( not ( = ?auto_2658797 ?auto_2658799 ) ) ( SURFACE-AT ?auto_2658792 ?auto_2658795 ) ( ON ?auto_2658792 ?auto_2658793 ) ( CLEAR ?auto_2658792 ) ( not ( = ?auto_2658791 ?auto_2658793 ) ) ( not ( = ?auto_2658792 ?auto_2658793 ) ) ( not ( = ?auto_2658798 ?auto_2658793 ) ) ( SURFACE-AT ?auto_2658798 ?auto_2658796 ) ( CLEAR ?auto_2658798 ) ( IS-CRATE ?auto_2658791 ) ( AVAILABLE ?auto_2658797 ) ( TRUCK-AT ?auto_2658794 ?auto_2658795 ) ( AVAILABLE ?auto_2658799 ) ( SURFACE-AT ?auto_2658791 ?auto_2658795 ) ( ON ?auto_2658791 ?auto_2658800 ) ( CLEAR ?auto_2658791 ) ( not ( = ?auto_2658791 ?auto_2658800 ) ) ( not ( = ?auto_2658792 ?auto_2658800 ) ) ( not ( = ?auto_2658798 ?auto_2658800 ) ) ( not ( = ?auto_2658793 ?auto_2658800 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2658799 ?auto_2658791 ?auto_2658800 ?auto_2658795 )
      ( MAKE-2CRATE ?auto_2658798 ?auto_2658791 ?auto_2658792 )
      ( MAKE-1CRATE-VERIFY ?auto_2658791 ?auto_2658792 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2658801 - SURFACE
      ?auto_2658802 - SURFACE
      ?auto_2658803 - SURFACE
    )
    :vars
    (
      ?auto_2658809 - HOIST
      ?auto_2658806 - PLACE
      ?auto_2658808 - PLACE
      ?auto_2658807 - HOIST
      ?auto_2658804 - SURFACE
      ?auto_2658810 - TRUCK
      ?auto_2658805 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658809 ?auto_2658806 ) ( IS-CRATE ?auto_2658803 ) ( not ( = ?auto_2658802 ?auto_2658803 ) ) ( not ( = ?auto_2658801 ?auto_2658802 ) ) ( not ( = ?auto_2658801 ?auto_2658803 ) ) ( not ( = ?auto_2658808 ?auto_2658806 ) ) ( HOIST-AT ?auto_2658807 ?auto_2658808 ) ( not ( = ?auto_2658809 ?auto_2658807 ) ) ( SURFACE-AT ?auto_2658803 ?auto_2658808 ) ( ON ?auto_2658803 ?auto_2658804 ) ( CLEAR ?auto_2658803 ) ( not ( = ?auto_2658802 ?auto_2658804 ) ) ( not ( = ?auto_2658803 ?auto_2658804 ) ) ( not ( = ?auto_2658801 ?auto_2658804 ) ) ( SURFACE-AT ?auto_2658801 ?auto_2658806 ) ( CLEAR ?auto_2658801 ) ( IS-CRATE ?auto_2658802 ) ( AVAILABLE ?auto_2658809 ) ( TRUCK-AT ?auto_2658810 ?auto_2658808 ) ( AVAILABLE ?auto_2658807 ) ( SURFACE-AT ?auto_2658802 ?auto_2658808 ) ( ON ?auto_2658802 ?auto_2658805 ) ( CLEAR ?auto_2658802 ) ( not ( = ?auto_2658802 ?auto_2658805 ) ) ( not ( = ?auto_2658803 ?auto_2658805 ) ) ( not ( = ?auto_2658801 ?auto_2658805 ) ) ( not ( = ?auto_2658804 ?auto_2658805 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2658802 ?auto_2658803 )
      ( MAKE-2CRATE-VERIFY ?auto_2658801 ?auto_2658802 ?auto_2658803 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2658811 - SURFACE
      ?auto_2658812 - SURFACE
      ?auto_2658813 - SURFACE
      ?auto_2658814 - SURFACE
    )
    :vars
    (
      ?auto_2658816 - HOIST
      ?auto_2658818 - PLACE
      ?auto_2658817 - PLACE
      ?auto_2658819 - HOIST
      ?auto_2658820 - SURFACE
      ?auto_2658815 - TRUCK
      ?auto_2658821 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658816 ?auto_2658818 ) ( IS-CRATE ?auto_2658814 ) ( not ( = ?auto_2658813 ?auto_2658814 ) ) ( not ( = ?auto_2658812 ?auto_2658813 ) ) ( not ( = ?auto_2658812 ?auto_2658814 ) ) ( not ( = ?auto_2658817 ?auto_2658818 ) ) ( HOIST-AT ?auto_2658819 ?auto_2658817 ) ( not ( = ?auto_2658816 ?auto_2658819 ) ) ( SURFACE-AT ?auto_2658814 ?auto_2658817 ) ( ON ?auto_2658814 ?auto_2658820 ) ( CLEAR ?auto_2658814 ) ( not ( = ?auto_2658813 ?auto_2658820 ) ) ( not ( = ?auto_2658814 ?auto_2658820 ) ) ( not ( = ?auto_2658812 ?auto_2658820 ) ) ( SURFACE-AT ?auto_2658812 ?auto_2658818 ) ( CLEAR ?auto_2658812 ) ( IS-CRATE ?auto_2658813 ) ( AVAILABLE ?auto_2658816 ) ( TRUCK-AT ?auto_2658815 ?auto_2658817 ) ( AVAILABLE ?auto_2658819 ) ( SURFACE-AT ?auto_2658813 ?auto_2658817 ) ( ON ?auto_2658813 ?auto_2658821 ) ( CLEAR ?auto_2658813 ) ( not ( = ?auto_2658813 ?auto_2658821 ) ) ( not ( = ?auto_2658814 ?auto_2658821 ) ) ( not ( = ?auto_2658812 ?auto_2658821 ) ) ( not ( = ?auto_2658820 ?auto_2658821 ) ) ( ON ?auto_2658812 ?auto_2658811 ) ( not ( = ?auto_2658811 ?auto_2658812 ) ) ( not ( = ?auto_2658811 ?auto_2658813 ) ) ( not ( = ?auto_2658811 ?auto_2658814 ) ) ( not ( = ?auto_2658811 ?auto_2658820 ) ) ( not ( = ?auto_2658811 ?auto_2658821 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658812 ?auto_2658813 ?auto_2658814 )
      ( MAKE-3CRATE-VERIFY ?auto_2658811 ?auto_2658812 ?auto_2658813 ?auto_2658814 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2658822 - SURFACE
      ?auto_2658823 - SURFACE
      ?auto_2658824 - SURFACE
      ?auto_2658825 - SURFACE
      ?auto_2658826 - SURFACE
    )
    :vars
    (
      ?auto_2658828 - HOIST
      ?auto_2658830 - PLACE
      ?auto_2658829 - PLACE
      ?auto_2658831 - HOIST
      ?auto_2658832 - SURFACE
      ?auto_2658827 - TRUCK
      ?auto_2658833 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658828 ?auto_2658830 ) ( IS-CRATE ?auto_2658826 ) ( not ( = ?auto_2658825 ?auto_2658826 ) ) ( not ( = ?auto_2658824 ?auto_2658825 ) ) ( not ( = ?auto_2658824 ?auto_2658826 ) ) ( not ( = ?auto_2658829 ?auto_2658830 ) ) ( HOIST-AT ?auto_2658831 ?auto_2658829 ) ( not ( = ?auto_2658828 ?auto_2658831 ) ) ( SURFACE-AT ?auto_2658826 ?auto_2658829 ) ( ON ?auto_2658826 ?auto_2658832 ) ( CLEAR ?auto_2658826 ) ( not ( = ?auto_2658825 ?auto_2658832 ) ) ( not ( = ?auto_2658826 ?auto_2658832 ) ) ( not ( = ?auto_2658824 ?auto_2658832 ) ) ( SURFACE-AT ?auto_2658824 ?auto_2658830 ) ( CLEAR ?auto_2658824 ) ( IS-CRATE ?auto_2658825 ) ( AVAILABLE ?auto_2658828 ) ( TRUCK-AT ?auto_2658827 ?auto_2658829 ) ( AVAILABLE ?auto_2658831 ) ( SURFACE-AT ?auto_2658825 ?auto_2658829 ) ( ON ?auto_2658825 ?auto_2658833 ) ( CLEAR ?auto_2658825 ) ( not ( = ?auto_2658825 ?auto_2658833 ) ) ( not ( = ?auto_2658826 ?auto_2658833 ) ) ( not ( = ?auto_2658824 ?auto_2658833 ) ) ( not ( = ?auto_2658832 ?auto_2658833 ) ) ( ON ?auto_2658823 ?auto_2658822 ) ( ON ?auto_2658824 ?auto_2658823 ) ( not ( = ?auto_2658822 ?auto_2658823 ) ) ( not ( = ?auto_2658822 ?auto_2658824 ) ) ( not ( = ?auto_2658822 ?auto_2658825 ) ) ( not ( = ?auto_2658822 ?auto_2658826 ) ) ( not ( = ?auto_2658822 ?auto_2658832 ) ) ( not ( = ?auto_2658822 ?auto_2658833 ) ) ( not ( = ?auto_2658823 ?auto_2658824 ) ) ( not ( = ?auto_2658823 ?auto_2658825 ) ) ( not ( = ?auto_2658823 ?auto_2658826 ) ) ( not ( = ?auto_2658823 ?auto_2658832 ) ) ( not ( = ?auto_2658823 ?auto_2658833 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658824 ?auto_2658825 ?auto_2658826 )
      ( MAKE-4CRATE-VERIFY ?auto_2658822 ?auto_2658823 ?auto_2658824 ?auto_2658825 ?auto_2658826 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2658834 - SURFACE
      ?auto_2658835 - SURFACE
      ?auto_2658836 - SURFACE
      ?auto_2658837 - SURFACE
      ?auto_2658838 - SURFACE
      ?auto_2658839 - SURFACE
    )
    :vars
    (
      ?auto_2658841 - HOIST
      ?auto_2658843 - PLACE
      ?auto_2658842 - PLACE
      ?auto_2658844 - HOIST
      ?auto_2658845 - SURFACE
      ?auto_2658840 - TRUCK
      ?auto_2658846 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658841 ?auto_2658843 ) ( IS-CRATE ?auto_2658839 ) ( not ( = ?auto_2658838 ?auto_2658839 ) ) ( not ( = ?auto_2658837 ?auto_2658838 ) ) ( not ( = ?auto_2658837 ?auto_2658839 ) ) ( not ( = ?auto_2658842 ?auto_2658843 ) ) ( HOIST-AT ?auto_2658844 ?auto_2658842 ) ( not ( = ?auto_2658841 ?auto_2658844 ) ) ( SURFACE-AT ?auto_2658839 ?auto_2658842 ) ( ON ?auto_2658839 ?auto_2658845 ) ( CLEAR ?auto_2658839 ) ( not ( = ?auto_2658838 ?auto_2658845 ) ) ( not ( = ?auto_2658839 ?auto_2658845 ) ) ( not ( = ?auto_2658837 ?auto_2658845 ) ) ( SURFACE-AT ?auto_2658837 ?auto_2658843 ) ( CLEAR ?auto_2658837 ) ( IS-CRATE ?auto_2658838 ) ( AVAILABLE ?auto_2658841 ) ( TRUCK-AT ?auto_2658840 ?auto_2658842 ) ( AVAILABLE ?auto_2658844 ) ( SURFACE-AT ?auto_2658838 ?auto_2658842 ) ( ON ?auto_2658838 ?auto_2658846 ) ( CLEAR ?auto_2658838 ) ( not ( = ?auto_2658838 ?auto_2658846 ) ) ( not ( = ?auto_2658839 ?auto_2658846 ) ) ( not ( = ?auto_2658837 ?auto_2658846 ) ) ( not ( = ?auto_2658845 ?auto_2658846 ) ) ( ON ?auto_2658835 ?auto_2658834 ) ( ON ?auto_2658836 ?auto_2658835 ) ( ON ?auto_2658837 ?auto_2658836 ) ( not ( = ?auto_2658834 ?auto_2658835 ) ) ( not ( = ?auto_2658834 ?auto_2658836 ) ) ( not ( = ?auto_2658834 ?auto_2658837 ) ) ( not ( = ?auto_2658834 ?auto_2658838 ) ) ( not ( = ?auto_2658834 ?auto_2658839 ) ) ( not ( = ?auto_2658834 ?auto_2658845 ) ) ( not ( = ?auto_2658834 ?auto_2658846 ) ) ( not ( = ?auto_2658835 ?auto_2658836 ) ) ( not ( = ?auto_2658835 ?auto_2658837 ) ) ( not ( = ?auto_2658835 ?auto_2658838 ) ) ( not ( = ?auto_2658835 ?auto_2658839 ) ) ( not ( = ?auto_2658835 ?auto_2658845 ) ) ( not ( = ?auto_2658835 ?auto_2658846 ) ) ( not ( = ?auto_2658836 ?auto_2658837 ) ) ( not ( = ?auto_2658836 ?auto_2658838 ) ) ( not ( = ?auto_2658836 ?auto_2658839 ) ) ( not ( = ?auto_2658836 ?auto_2658845 ) ) ( not ( = ?auto_2658836 ?auto_2658846 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658837 ?auto_2658838 ?auto_2658839 )
      ( MAKE-5CRATE-VERIFY ?auto_2658834 ?auto_2658835 ?auto_2658836 ?auto_2658837 ?auto_2658838 ?auto_2658839 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2658847 - SURFACE
      ?auto_2658848 - SURFACE
    )
    :vars
    (
      ?auto_2658851 - HOIST
      ?auto_2658853 - PLACE
      ?auto_2658849 - SURFACE
      ?auto_2658852 - PLACE
      ?auto_2658854 - HOIST
      ?auto_2658855 - SURFACE
      ?auto_2658856 - SURFACE
      ?auto_2658850 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658851 ?auto_2658853 ) ( IS-CRATE ?auto_2658848 ) ( not ( = ?auto_2658847 ?auto_2658848 ) ) ( not ( = ?auto_2658849 ?auto_2658847 ) ) ( not ( = ?auto_2658849 ?auto_2658848 ) ) ( not ( = ?auto_2658852 ?auto_2658853 ) ) ( HOIST-AT ?auto_2658854 ?auto_2658852 ) ( not ( = ?auto_2658851 ?auto_2658854 ) ) ( SURFACE-AT ?auto_2658848 ?auto_2658852 ) ( ON ?auto_2658848 ?auto_2658855 ) ( CLEAR ?auto_2658848 ) ( not ( = ?auto_2658847 ?auto_2658855 ) ) ( not ( = ?auto_2658848 ?auto_2658855 ) ) ( not ( = ?auto_2658849 ?auto_2658855 ) ) ( SURFACE-AT ?auto_2658849 ?auto_2658853 ) ( CLEAR ?auto_2658849 ) ( IS-CRATE ?auto_2658847 ) ( AVAILABLE ?auto_2658851 ) ( AVAILABLE ?auto_2658854 ) ( SURFACE-AT ?auto_2658847 ?auto_2658852 ) ( ON ?auto_2658847 ?auto_2658856 ) ( CLEAR ?auto_2658847 ) ( not ( = ?auto_2658847 ?auto_2658856 ) ) ( not ( = ?auto_2658848 ?auto_2658856 ) ) ( not ( = ?auto_2658849 ?auto_2658856 ) ) ( not ( = ?auto_2658855 ?auto_2658856 ) ) ( TRUCK-AT ?auto_2658850 ?auto_2658853 ) )
    :subtasks
    ( ( !DRIVE ?auto_2658850 ?auto_2658853 ?auto_2658852 )
      ( MAKE-2CRATE ?auto_2658849 ?auto_2658847 ?auto_2658848 )
      ( MAKE-1CRATE-VERIFY ?auto_2658847 ?auto_2658848 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2658857 - SURFACE
      ?auto_2658858 - SURFACE
      ?auto_2658859 - SURFACE
    )
    :vars
    (
      ?auto_2658860 - HOIST
      ?auto_2658862 - PLACE
      ?auto_2658865 - PLACE
      ?auto_2658864 - HOIST
      ?auto_2658866 - SURFACE
      ?auto_2658863 - SURFACE
      ?auto_2658861 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658860 ?auto_2658862 ) ( IS-CRATE ?auto_2658859 ) ( not ( = ?auto_2658858 ?auto_2658859 ) ) ( not ( = ?auto_2658857 ?auto_2658858 ) ) ( not ( = ?auto_2658857 ?auto_2658859 ) ) ( not ( = ?auto_2658865 ?auto_2658862 ) ) ( HOIST-AT ?auto_2658864 ?auto_2658865 ) ( not ( = ?auto_2658860 ?auto_2658864 ) ) ( SURFACE-AT ?auto_2658859 ?auto_2658865 ) ( ON ?auto_2658859 ?auto_2658866 ) ( CLEAR ?auto_2658859 ) ( not ( = ?auto_2658858 ?auto_2658866 ) ) ( not ( = ?auto_2658859 ?auto_2658866 ) ) ( not ( = ?auto_2658857 ?auto_2658866 ) ) ( SURFACE-AT ?auto_2658857 ?auto_2658862 ) ( CLEAR ?auto_2658857 ) ( IS-CRATE ?auto_2658858 ) ( AVAILABLE ?auto_2658860 ) ( AVAILABLE ?auto_2658864 ) ( SURFACE-AT ?auto_2658858 ?auto_2658865 ) ( ON ?auto_2658858 ?auto_2658863 ) ( CLEAR ?auto_2658858 ) ( not ( = ?auto_2658858 ?auto_2658863 ) ) ( not ( = ?auto_2658859 ?auto_2658863 ) ) ( not ( = ?auto_2658857 ?auto_2658863 ) ) ( not ( = ?auto_2658866 ?auto_2658863 ) ) ( TRUCK-AT ?auto_2658861 ?auto_2658862 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2658858 ?auto_2658859 )
      ( MAKE-2CRATE-VERIFY ?auto_2658857 ?auto_2658858 ?auto_2658859 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2658867 - SURFACE
      ?auto_2658868 - SURFACE
      ?auto_2658869 - SURFACE
      ?auto_2658870 - SURFACE
    )
    :vars
    (
      ?auto_2658874 - HOIST
      ?auto_2658871 - PLACE
      ?auto_2658875 - PLACE
      ?auto_2658873 - HOIST
      ?auto_2658876 - SURFACE
      ?auto_2658877 - SURFACE
      ?auto_2658872 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658874 ?auto_2658871 ) ( IS-CRATE ?auto_2658870 ) ( not ( = ?auto_2658869 ?auto_2658870 ) ) ( not ( = ?auto_2658868 ?auto_2658869 ) ) ( not ( = ?auto_2658868 ?auto_2658870 ) ) ( not ( = ?auto_2658875 ?auto_2658871 ) ) ( HOIST-AT ?auto_2658873 ?auto_2658875 ) ( not ( = ?auto_2658874 ?auto_2658873 ) ) ( SURFACE-AT ?auto_2658870 ?auto_2658875 ) ( ON ?auto_2658870 ?auto_2658876 ) ( CLEAR ?auto_2658870 ) ( not ( = ?auto_2658869 ?auto_2658876 ) ) ( not ( = ?auto_2658870 ?auto_2658876 ) ) ( not ( = ?auto_2658868 ?auto_2658876 ) ) ( SURFACE-AT ?auto_2658868 ?auto_2658871 ) ( CLEAR ?auto_2658868 ) ( IS-CRATE ?auto_2658869 ) ( AVAILABLE ?auto_2658874 ) ( AVAILABLE ?auto_2658873 ) ( SURFACE-AT ?auto_2658869 ?auto_2658875 ) ( ON ?auto_2658869 ?auto_2658877 ) ( CLEAR ?auto_2658869 ) ( not ( = ?auto_2658869 ?auto_2658877 ) ) ( not ( = ?auto_2658870 ?auto_2658877 ) ) ( not ( = ?auto_2658868 ?auto_2658877 ) ) ( not ( = ?auto_2658876 ?auto_2658877 ) ) ( TRUCK-AT ?auto_2658872 ?auto_2658871 ) ( ON ?auto_2658868 ?auto_2658867 ) ( not ( = ?auto_2658867 ?auto_2658868 ) ) ( not ( = ?auto_2658867 ?auto_2658869 ) ) ( not ( = ?auto_2658867 ?auto_2658870 ) ) ( not ( = ?auto_2658867 ?auto_2658876 ) ) ( not ( = ?auto_2658867 ?auto_2658877 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658868 ?auto_2658869 ?auto_2658870 )
      ( MAKE-3CRATE-VERIFY ?auto_2658867 ?auto_2658868 ?auto_2658869 ?auto_2658870 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2658878 - SURFACE
      ?auto_2658879 - SURFACE
      ?auto_2658880 - SURFACE
      ?auto_2658881 - SURFACE
      ?auto_2658882 - SURFACE
    )
    :vars
    (
      ?auto_2658886 - HOIST
      ?auto_2658883 - PLACE
      ?auto_2658887 - PLACE
      ?auto_2658885 - HOIST
      ?auto_2658888 - SURFACE
      ?auto_2658889 - SURFACE
      ?auto_2658884 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658886 ?auto_2658883 ) ( IS-CRATE ?auto_2658882 ) ( not ( = ?auto_2658881 ?auto_2658882 ) ) ( not ( = ?auto_2658880 ?auto_2658881 ) ) ( not ( = ?auto_2658880 ?auto_2658882 ) ) ( not ( = ?auto_2658887 ?auto_2658883 ) ) ( HOIST-AT ?auto_2658885 ?auto_2658887 ) ( not ( = ?auto_2658886 ?auto_2658885 ) ) ( SURFACE-AT ?auto_2658882 ?auto_2658887 ) ( ON ?auto_2658882 ?auto_2658888 ) ( CLEAR ?auto_2658882 ) ( not ( = ?auto_2658881 ?auto_2658888 ) ) ( not ( = ?auto_2658882 ?auto_2658888 ) ) ( not ( = ?auto_2658880 ?auto_2658888 ) ) ( SURFACE-AT ?auto_2658880 ?auto_2658883 ) ( CLEAR ?auto_2658880 ) ( IS-CRATE ?auto_2658881 ) ( AVAILABLE ?auto_2658886 ) ( AVAILABLE ?auto_2658885 ) ( SURFACE-AT ?auto_2658881 ?auto_2658887 ) ( ON ?auto_2658881 ?auto_2658889 ) ( CLEAR ?auto_2658881 ) ( not ( = ?auto_2658881 ?auto_2658889 ) ) ( not ( = ?auto_2658882 ?auto_2658889 ) ) ( not ( = ?auto_2658880 ?auto_2658889 ) ) ( not ( = ?auto_2658888 ?auto_2658889 ) ) ( TRUCK-AT ?auto_2658884 ?auto_2658883 ) ( ON ?auto_2658879 ?auto_2658878 ) ( ON ?auto_2658880 ?auto_2658879 ) ( not ( = ?auto_2658878 ?auto_2658879 ) ) ( not ( = ?auto_2658878 ?auto_2658880 ) ) ( not ( = ?auto_2658878 ?auto_2658881 ) ) ( not ( = ?auto_2658878 ?auto_2658882 ) ) ( not ( = ?auto_2658878 ?auto_2658888 ) ) ( not ( = ?auto_2658878 ?auto_2658889 ) ) ( not ( = ?auto_2658879 ?auto_2658880 ) ) ( not ( = ?auto_2658879 ?auto_2658881 ) ) ( not ( = ?auto_2658879 ?auto_2658882 ) ) ( not ( = ?auto_2658879 ?auto_2658888 ) ) ( not ( = ?auto_2658879 ?auto_2658889 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658880 ?auto_2658881 ?auto_2658882 )
      ( MAKE-4CRATE-VERIFY ?auto_2658878 ?auto_2658879 ?auto_2658880 ?auto_2658881 ?auto_2658882 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2658890 - SURFACE
      ?auto_2658891 - SURFACE
      ?auto_2658892 - SURFACE
      ?auto_2658893 - SURFACE
      ?auto_2658894 - SURFACE
      ?auto_2658895 - SURFACE
    )
    :vars
    (
      ?auto_2658899 - HOIST
      ?auto_2658896 - PLACE
      ?auto_2658900 - PLACE
      ?auto_2658898 - HOIST
      ?auto_2658901 - SURFACE
      ?auto_2658902 - SURFACE
      ?auto_2658897 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658899 ?auto_2658896 ) ( IS-CRATE ?auto_2658895 ) ( not ( = ?auto_2658894 ?auto_2658895 ) ) ( not ( = ?auto_2658893 ?auto_2658894 ) ) ( not ( = ?auto_2658893 ?auto_2658895 ) ) ( not ( = ?auto_2658900 ?auto_2658896 ) ) ( HOIST-AT ?auto_2658898 ?auto_2658900 ) ( not ( = ?auto_2658899 ?auto_2658898 ) ) ( SURFACE-AT ?auto_2658895 ?auto_2658900 ) ( ON ?auto_2658895 ?auto_2658901 ) ( CLEAR ?auto_2658895 ) ( not ( = ?auto_2658894 ?auto_2658901 ) ) ( not ( = ?auto_2658895 ?auto_2658901 ) ) ( not ( = ?auto_2658893 ?auto_2658901 ) ) ( SURFACE-AT ?auto_2658893 ?auto_2658896 ) ( CLEAR ?auto_2658893 ) ( IS-CRATE ?auto_2658894 ) ( AVAILABLE ?auto_2658899 ) ( AVAILABLE ?auto_2658898 ) ( SURFACE-AT ?auto_2658894 ?auto_2658900 ) ( ON ?auto_2658894 ?auto_2658902 ) ( CLEAR ?auto_2658894 ) ( not ( = ?auto_2658894 ?auto_2658902 ) ) ( not ( = ?auto_2658895 ?auto_2658902 ) ) ( not ( = ?auto_2658893 ?auto_2658902 ) ) ( not ( = ?auto_2658901 ?auto_2658902 ) ) ( TRUCK-AT ?auto_2658897 ?auto_2658896 ) ( ON ?auto_2658891 ?auto_2658890 ) ( ON ?auto_2658892 ?auto_2658891 ) ( ON ?auto_2658893 ?auto_2658892 ) ( not ( = ?auto_2658890 ?auto_2658891 ) ) ( not ( = ?auto_2658890 ?auto_2658892 ) ) ( not ( = ?auto_2658890 ?auto_2658893 ) ) ( not ( = ?auto_2658890 ?auto_2658894 ) ) ( not ( = ?auto_2658890 ?auto_2658895 ) ) ( not ( = ?auto_2658890 ?auto_2658901 ) ) ( not ( = ?auto_2658890 ?auto_2658902 ) ) ( not ( = ?auto_2658891 ?auto_2658892 ) ) ( not ( = ?auto_2658891 ?auto_2658893 ) ) ( not ( = ?auto_2658891 ?auto_2658894 ) ) ( not ( = ?auto_2658891 ?auto_2658895 ) ) ( not ( = ?auto_2658891 ?auto_2658901 ) ) ( not ( = ?auto_2658891 ?auto_2658902 ) ) ( not ( = ?auto_2658892 ?auto_2658893 ) ) ( not ( = ?auto_2658892 ?auto_2658894 ) ) ( not ( = ?auto_2658892 ?auto_2658895 ) ) ( not ( = ?auto_2658892 ?auto_2658901 ) ) ( not ( = ?auto_2658892 ?auto_2658902 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658893 ?auto_2658894 ?auto_2658895 )
      ( MAKE-5CRATE-VERIFY ?auto_2658890 ?auto_2658891 ?auto_2658892 ?auto_2658893 ?auto_2658894 ?auto_2658895 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2658903 - SURFACE
      ?auto_2658904 - SURFACE
    )
    :vars
    (
      ?auto_2658908 - HOIST
      ?auto_2658905 - PLACE
      ?auto_2658911 - SURFACE
      ?auto_2658909 - PLACE
      ?auto_2658907 - HOIST
      ?auto_2658910 - SURFACE
      ?auto_2658912 - SURFACE
      ?auto_2658906 - TRUCK
      ?auto_2658913 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658908 ?auto_2658905 ) ( IS-CRATE ?auto_2658904 ) ( not ( = ?auto_2658903 ?auto_2658904 ) ) ( not ( = ?auto_2658911 ?auto_2658903 ) ) ( not ( = ?auto_2658911 ?auto_2658904 ) ) ( not ( = ?auto_2658909 ?auto_2658905 ) ) ( HOIST-AT ?auto_2658907 ?auto_2658909 ) ( not ( = ?auto_2658908 ?auto_2658907 ) ) ( SURFACE-AT ?auto_2658904 ?auto_2658909 ) ( ON ?auto_2658904 ?auto_2658910 ) ( CLEAR ?auto_2658904 ) ( not ( = ?auto_2658903 ?auto_2658910 ) ) ( not ( = ?auto_2658904 ?auto_2658910 ) ) ( not ( = ?auto_2658911 ?auto_2658910 ) ) ( IS-CRATE ?auto_2658903 ) ( AVAILABLE ?auto_2658907 ) ( SURFACE-AT ?auto_2658903 ?auto_2658909 ) ( ON ?auto_2658903 ?auto_2658912 ) ( CLEAR ?auto_2658903 ) ( not ( = ?auto_2658903 ?auto_2658912 ) ) ( not ( = ?auto_2658904 ?auto_2658912 ) ) ( not ( = ?auto_2658911 ?auto_2658912 ) ) ( not ( = ?auto_2658910 ?auto_2658912 ) ) ( TRUCK-AT ?auto_2658906 ?auto_2658905 ) ( SURFACE-AT ?auto_2658913 ?auto_2658905 ) ( CLEAR ?auto_2658913 ) ( LIFTING ?auto_2658908 ?auto_2658911 ) ( IS-CRATE ?auto_2658911 ) ( not ( = ?auto_2658913 ?auto_2658911 ) ) ( not ( = ?auto_2658903 ?auto_2658913 ) ) ( not ( = ?auto_2658904 ?auto_2658913 ) ) ( not ( = ?auto_2658910 ?auto_2658913 ) ) ( not ( = ?auto_2658912 ?auto_2658913 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2658913 ?auto_2658911 )
      ( MAKE-2CRATE ?auto_2658911 ?auto_2658903 ?auto_2658904 )
      ( MAKE-1CRATE-VERIFY ?auto_2658903 ?auto_2658904 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2658914 - SURFACE
      ?auto_2658915 - SURFACE
      ?auto_2658916 - SURFACE
    )
    :vars
    (
      ?auto_2658920 - HOIST
      ?auto_2658919 - PLACE
      ?auto_2658921 - PLACE
      ?auto_2658922 - HOIST
      ?auto_2658923 - SURFACE
      ?auto_2658918 - SURFACE
      ?auto_2658917 - TRUCK
      ?auto_2658924 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658920 ?auto_2658919 ) ( IS-CRATE ?auto_2658916 ) ( not ( = ?auto_2658915 ?auto_2658916 ) ) ( not ( = ?auto_2658914 ?auto_2658915 ) ) ( not ( = ?auto_2658914 ?auto_2658916 ) ) ( not ( = ?auto_2658921 ?auto_2658919 ) ) ( HOIST-AT ?auto_2658922 ?auto_2658921 ) ( not ( = ?auto_2658920 ?auto_2658922 ) ) ( SURFACE-AT ?auto_2658916 ?auto_2658921 ) ( ON ?auto_2658916 ?auto_2658923 ) ( CLEAR ?auto_2658916 ) ( not ( = ?auto_2658915 ?auto_2658923 ) ) ( not ( = ?auto_2658916 ?auto_2658923 ) ) ( not ( = ?auto_2658914 ?auto_2658923 ) ) ( IS-CRATE ?auto_2658915 ) ( AVAILABLE ?auto_2658922 ) ( SURFACE-AT ?auto_2658915 ?auto_2658921 ) ( ON ?auto_2658915 ?auto_2658918 ) ( CLEAR ?auto_2658915 ) ( not ( = ?auto_2658915 ?auto_2658918 ) ) ( not ( = ?auto_2658916 ?auto_2658918 ) ) ( not ( = ?auto_2658914 ?auto_2658918 ) ) ( not ( = ?auto_2658923 ?auto_2658918 ) ) ( TRUCK-AT ?auto_2658917 ?auto_2658919 ) ( SURFACE-AT ?auto_2658924 ?auto_2658919 ) ( CLEAR ?auto_2658924 ) ( LIFTING ?auto_2658920 ?auto_2658914 ) ( IS-CRATE ?auto_2658914 ) ( not ( = ?auto_2658924 ?auto_2658914 ) ) ( not ( = ?auto_2658915 ?auto_2658924 ) ) ( not ( = ?auto_2658916 ?auto_2658924 ) ) ( not ( = ?auto_2658923 ?auto_2658924 ) ) ( not ( = ?auto_2658918 ?auto_2658924 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2658915 ?auto_2658916 )
      ( MAKE-2CRATE-VERIFY ?auto_2658914 ?auto_2658915 ?auto_2658916 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2658925 - SURFACE
      ?auto_2658926 - SURFACE
      ?auto_2658927 - SURFACE
      ?auto_2658928 - SURFACE
    )
    :vars
    (
      ?auto_2658931 - HOIST
      ?auto_2658933 - PLACE
      ?auto_2658934 - PLACE
      ?auto_2658930 - HOIST
      ?auto_2658932 - SURFACE
      ?auto_2658935 - SURFACE
      ?auto_2658929 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658931 ?auto_2658933 ) ( IS-CRATE ?auto_2658928 ) ( not ( = ?auto_2658927 ?auto_2658928 ) ) ( not ( = ?auto_2658926 ?auto_2658927 ) ) ( not ( = ?auto_2658926 ?auto_2658928 ) ) ( not ( = ?auto_2658934 ?auto_2658933 ) ) ( HOIST-AT ?auto_2658930 ?auto_2658934 ) ( not ( = ?auto_2658931 ?auto_2658930 ) ) ( SURFACE-AT ?auto_2658928 ?auto_2658934 ) ( ON ?auto_2658928 ?auto_2658932 ) ( CLEAR ?auto_2658928 ) ( not ( = ?auto_2658927 ?auto_2658932 ) ) ( not ( = ?auto_2658928 ?auto_2658932 ) ) ( not ( = ?auto_2658926 ?auto_2658932 ) ) ( IS-CRATE ?auto_2658927 ) ( AVAILABLE ?auto_2658930 ) ( SURFACE-AT ?auto_2658927 ?auto_2658934 ) ( ON ?auto_2658927 ?auto_2658935 ) ( CLEAR ?auto_2658927 ) ( not ( = ?auto_2658927 ?auto_2658935 ) ) ( not ( = ?auto_2658928 ?auto_2658935 ) ) ( not ( = ?auto_2658926 ?auto_2658935 ) ) ( not ( = ?auto_2658932 ?auto_2658935 ) ) ( TRUCK-AT ?auto_2658929 ?auto_2658933 ) ( SURFACE-AT ?auto_2658925 ?auto_2658933 ) ( CLEAR ?auto_2658925 ) ( LIFTING ?auto_2658931 ?auto_2658926 ) ( IS-CRATE ?auto_2658926 ) ( not ( = ?auto_2658925 ?auto_2658926 ) ) ( not ( = ?auto_2658927 ?auto_2658925 ) ) ( not ( = ?auto_2658928 ?auto_2658925 ) ) ( not ( = ?auto_2658932 ?auto_2658925 ) ) ( not ( = ?auto_2658935 ?auto_2658925 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658926 ?auto_2658927 ?auto_2658928 )
      ( MAKE-3CRATE-VERIFY ?auto_2658925 ?auto_2658926 ?auto_2658927 ?auto_2658928 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2658936 - SURFACE
      ?auto_2658937 - SURFACE
      ?auto_2658938 - SURFACE
      ?auto_2658939 - SURFACE
      ?auto_2658940 - SURFACE
    )
    :vars
    (
      ?auto_2658943 - HOIST
      ?auto_2658945 - PLACE
      ?auto_2658946 - PLACE
      ?auto_2658942 - HOIST
      ?auto_2658944 - SURFACE
      ?auto_2658947 - SURFACE
      ?auto_2658941 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658943 ?auto_2658945 ) ( IS-CRATE ?auto_2658940 ) ( not ( = ?auto_2658939 ?auto_2658940 ) ) ( not ( = ?auto_2658938 ?auto_2658939 ) ) ( not ( = ?auto_2658938 ?auto_2658940 ) ) ( not ( = ?auto_2658946 ?auto_2658945 ) ) ( HOIST-AT ?auto_2658942 ?auto_2658946 ) ( not ( = ?auto_2658943 ?auto_2658942 ) ) ( SURFACE-AT ?auto_2658940 ?auto_2658946 ) ( ON ?auto_2658940 ?auto_2658944 ) ( CLEAR ?auto_2658940 ) ( not ( = ?auto_2658939 ?auto_2658944 ) ) ( not ( = ?auto_2658940 ?auto_2658944 ) ) ( not ( = ?auto_2658938 ?auto_2658944 ) ) ( IS-CRATE ?auto_2658939 ) ( AVAILABLE ?auto_2658942 ) ( SURFACE-AT ?auto_2658939 ?auto_2658946 ) ( ON ?auto_2658939 ?auto_2658947 ) ( CLEAR ?auto_2658939 ) ( not ( = ?auto_2658939 ?auto_2658947 ) ) ( not ( = ?auto_2658940 ?auto_2658947 ) ) ( not ( = ?auto_2658938 ?auto_2658947 ) ) ( not ( = ?auto_2658944 ?auto_2658947 ) ) ( TRUCK-AT ?auto_2658941 ?auto_2658945 ) ( SURFACE-AT ?auto_2658937 ?auto_2658945 ) ( CLEAR ?auto_2658937 ) ( LIFTING ?auto_2658943 ?auto_2658938 ) ( IS-CRATE ?auto_2658938 ) ( not ( = ?auto_2658937 ?auto_2658938 ) ) ( not ( = ?auto_2658939 ?auto_2658937 ) ) ( not ( = ?auto_2658940 ?auto_2658937 ) ) ( not ( = ?auto_2658944 ?auto_2658937 ) ) ( not ( = ?auto_2658947 ?auto_2658937 ) ) ( ON ?auto_2658937 ?auto_2658936 ) ( not ( = ?auto_2658936 ?auto_2658937 ) ) ( not ( = ?auto_2658936 ?auto_2658938 ) ) ( not ( = ?auto_2658936 ?auto_2658939 ) ) ( not ( = ?auto_2658936 ?auto_2658940 ) ) ( not ( = ?auto_2658936 ?auto_2658944 ) ) ( not ( = ?auto_2658936 ?auto_2658947 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658938 ?auto_2658939 ?auto_2658940 )
      ( MAKE-4CRATE-VERIFY ?auto_2658936 ?auto_2658937 ?auto_2658938 ?auto_2658939 ?auto_2658940 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2658948 - SURFACE
      ?auto_2658949 - SURFACE
      ?auto_2658950 - SURFACE
      ?auto_2658951 - SURFACE
      ?auto_2658952 - SURFACE
      ?auto_2658953 - SURFACE
    )
    :vars
    (
      ?auto_2658956 - HOIST
      ?auto_2658958 - PLACE
      ?auto_2658959 - PLACE
      ?auto_2658955 - HOIST
      ?auto_2658957 - SURFACE
      ?auto_2658960 - SURFACE
      ?auto_2658954 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658956 ?auto_2658958 ) ( IS-CRATE ?auto_2658953 ) ( not ( = ?auto_2658952 ?auto_2658953 ) ) ( not ( = ?auto_2658951 ?auto_2658952 ) ) ( not ( = ?auto_2658951 ?auto_2658953 ) ) ( not ( = ?auto_2658959 ?auto_2658958 ) ) ( HOIST-AT ?auto_2658955 ?auto_2658959 ) ( not ( = ?auto_2658956 ?auto_2658955 ) ) ( SURFACE-AT ?auto_2658953 ?auto_2658959 ) ( ON ?auto_2658953 ?auto_2658957 ) ( CLEAR ?auto_2658953 ) ( not ( = ?auto_2658952 ?auto_2658957 ) ) ( not ( = ?auto_2658953 ?auto_2658957 ) ) ( not ( = ?auto_2658951 ?auto_2658957 ) ) ( IS-CRATE ?auto_2658952 ) ( AVAILABLE ?auto_2658955 ) ( SURFACE-AT ?auto_2658952 ?auto_2658959 ) ( ON ?auto_2658952 ?auto_2658960 ) ( CLEAR ?auto_2658952 ) ( not ( = ?auto_2658952 ?auto_2658960 ) ) ( not ( = ?auto_2658953 ?auto_2658960 ) ) ( not ( = ?auto_2658951 ?auto_2658960 ) ) ( not ( = ?auto_2658957 ?auto_2658960 ) ) ( TRUCK-AT ?auto_2658954 ?auto_2658958 ) ( SURFACE-AT ?auto_2658950 ?auto_2658958 ) ( CLEAR ?auto_2658950 ) ( LIFTING ?auto_2658956 ?auto_2658951 ) ( IS-CRATE ?auto_2658951 ) ( not ( = ?auto_2658950 ?auto_2658951 ) ) ( not ( = ?auto_2658952 ?auto_2658950 ) ) ( not ( = ?auto_2658953 ?auto_2658950 ) ) ( not ( = ?auto_2658957 ?auto_2658950 ) ) ( not ( = ?auto_2658960 ?auto_2658950 ) ) ( ON ?auto_2658949 ?auto_2658948 ) ( ON ?auto_2658950 ?auto_2658949 ) ( not ( = ?auto_2658948 ?auto_2658949 ) ) ( not ( = ?auto_2658948 ?auto_2658950 ) ) ( not ( = ?auto_2658948 ?auto_2658951 ) ) ( not ( = ?auto_2658948 ?auto_2658952 ) ) ( not ( = ?auto_2658948 ?auto_2658953 ) ) ( not ( = ?auto_2658948 ?auto_2658957 ) ) ( not ( = ?auto_2658948 ?auto_2658960 ) ) ( not ( = ?auto_2658949 ?auto_2658950 ) ) ( not ( = ?auto_2658949 ?auto_2658951 ) ) ( not ( = ?auto_2658949 ?auto_2658952 ) ) ( not ( = ?auto_2658949 ?auto_2658953 ) ) ( not ( = ?auto_2658949 ?auto_2658957 ) ) ( not ( = ?auto_2658949 ?auto_2658960 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658951 ?auto_2658952 ?auto_2658953 )
      ( MAKE-5CRATE-VERIFY ?auto_2658948 ?auto_2658949 ?auto_2658950 ?auto_2658951 ?auto_2658952 ?auto_2658953 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2659869 - SURFACE
      ?auto_2659870 - SURFACE
      ?auto_2659871 - SURFACE
      ?auto_2659872 - SURFACE
      ?auto_2659873 - SURFACE
      ?auto_2659874 - SURFACE
      ?auto_2659875 - SURFACE
    )
    :vars
    (
      ?auto_2659877 - HOIST
      ?auto_2659876 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2659877 ?auto_2659876 ) ( SURFACE-AT ?auto_2659874 ?auto_2659876 ) ( CLEAR ?auto_2659874 ) ( LIFTING ?auto_2659877 ?auto_2659875 ) ( IS-CRATE ?auto_2659875 ) ( not ( = ?auto_2659874 ?auto_2659875 ) ) ( ON ?auto_2659870 ?auto_2659869 ) ( ON ?auto_2659871 ?auto_2659870 ) ( ON ?auto_2659872 ?auto_2659871 ) ( ON ?auto_2659873 ?auto_2659872 ) ( ON ?auto_2659874 ?auto_2659873 ) ( not ( = ?auto_2659869 ?auto_2659870 ) ) ( not ( = ?auto_2659869 ?auto_2659871 ) ) ( not ( = ?auto_2659869 ?auto_2659872 ) ) ( not ( = ?auto_2659869 ?auto_2659873 ) ) ( not ( = ?auto_2659869 ?auto_2659874 ) ) ( not ( = ?auto_2659869 ?auto_2659875 ) ) ( not ( = ?auto_2659870 ?auto_2659871 ) ) ( not ( = ?auto_2659870 ?auto_2659872 ) ) ( not ( = ?auto_2659870 ?auto_2659873 ) ) ( not ( = ?auto_2659870 ?auto_2659874 ) ) ( not ( = ?auto_2659870 ?auto_2659875 ) ) ( not ( = ?auto_2659871 ?auto_2659872 ) ) ( not ( = ?auto_2659871 ?auto_2659873 ) ) ( not ( = ?auto_2659871 ?auto_2659874 ) ) ( not ( = ?auto_2659871 ?auto_2659875 ) ) ( not ( = ?auto_2659872 ?auto_2659873 ) ) ( not ( = ?auto_2659872 ?auto_2659874 ) ) ( not ( = ?auto_2659872 ?auto_2659875 ) ) ( not ( = ?auto_2659873 ?auto_2659874 ) ) ( not ( = ?auto_2659873 ?auto_2659875 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2659874 ?auto_2659875 )
      ( MAKE-6CRATE-VERIFY ?auto_2659869 ?auto_2659870 ?auto_2659871 ?auto_2659872 ?auto_2659873 ?auto_2659874 ?auto_2659875 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2659913 - SURFACE
      ?auto_2659914 - SURFACE
      ?auto_2659915 - SURFACE
      ?auto_2659916 - SURFACE
      ?auto_2659917 - SURFACE
      ?auto_2659918 - SURFACE
      ?auto_2659919 - SURFACE
    )
    :vars
    (
      ?auto_2659921 - HOIST
      ?auto_2659920 - PLACE
      ?auto_2659922 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2659921 ?auto_2659920 ) ( SURFACE-AT ?auto_2659918 ?auto_2659920 ) ( CLEAR ?auto_2659918 ) ( IS-CRATE ?auto_2659919 ) ( not ( = ?auto_2659918 ?auto_2659919 ) ) ( TRUCK-AT ?auto_2659922 ?auto_2659920 ) ( AVAILABLE ?auto_2659921 ) ( IN ?auto_2659919 ?auto_2659922 ) ( ON ?auto_2659918 ?auto_2659917 ) ( not ( = ?auto_2659917 ?auto_2659918 ) ) ( not ( = ?auto_2659917 ?auto_2659919 ) ) ( ON ?auto_2659914 ?auto_2659913 ) ( ON ?auto_2659915 ?auto_2659914 ) ( ON ?auto_2659916 ?auto_2659915 ) ( ON ?auto_2659917 ?auto_2659916 ) ( not ( = ?auto_2659913 ?auto_2659914 ) ) ( not ( = ?auto_2659913 ?auto_2659915 ) ) ( not ( = ?auto_2659913 ?auto_2659916 ) ) ( not ( = ?auto_2659913 ?auto_2659917 ) ) ( not ( = ?auto_2659913 ?auto_2659918 ) ) ( not ( = ?auto_2659913 ?auto_2659919 ) ) ( not ( = ?auto_2659914 ?auto_2659915 ) ) ( not ( = ?auto_2659914 ?auto_2659916 ) ) ( not ( = ?auto_2659914 ?auto_2659917 ) ) ( not ( = ?auto_2659914 ?auto_2659918 ) ) ( not ( = ?auto_2659914 ?auto_2659919 ) ) ( not ( = ?auto_2659915 ?auto_2659916 ) ) ( not ( = ?auto_2659915 ?auto_2659917 ) ) ( not ( = ?auto_2659915 ?auto_2659918 ) ) ( not ( = ?auto_2659915 ?auto_2659919 ) ) ( not ( = ?auto_2659916 ?auto_2659917 ) ) ( not ( = ?auto_2659916 ?auto_2659918 ) ) ( not ( = ?auto_2659916 ?auto_2659919 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2659917 ?auto_2659918 ?auto_2659919 )
      ( MAKE-6CRATE-VERIFY ?auto_2659913 ?auto_2659914 ?auto_2659915 ?auto_2659916 ?auto_2659917 ?auto_2659918 ?auto_2659919 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2659964 - SURFACE
      ?auto_2659965 - SURFACE
      ?auto_2659966 - SURFACE
      ?auto_2659967 - SURFACE
      ?auto_2659968 - SURFACE
      ?auto_2659969 - SURFACE
      ?auto_2659970 - SURFACE
    )
    :vars
    (
      ?auto_2659973 - HOIST
      ?auto_2659971 - PLACE
      ?auto_2659974 - TRUCK
      ?auto_2659972 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2659973 ?auto_2659971 ) ( SURFACE-AT ?auto_2659969 ?auto_2659971 ) ( CLEAR ?auto_2659969 ) ( IS-CRATE ?auto_2659970 ) ( not ( = ?auto_2659969 ?auto_2659970 ) ) ( AVAILABLE ?auto_2659973 ) ( IN ?auto_2659970 ?auto_2659974 ) ( ON ?auto_2659969 ?auto_2659968 ) ( not ( = ?auto_2659968 ?auto_2659969 ) ) ( not ( = ?auto_2659968 ?auto_2659970 ) ) ( TRUCK-AT ?auto_2659974 ?auto_2659972 ) ( not ( = ?auto_2659972 ?auto_2659971 ) ) ( ON ?auto_2659965 ?auto_2659964 ) ( ON ?auto_2659966 ?auto_2659965 ) ( ON ?auto_2659967 ?auto_2659966 ) ( ON ?auto_2659968 ?auto_2659967 ) ( not ( = ?auto_2659964 ?auto_2659965 ) ) ( not ( = ?auto_2659964 ?auto_2659966 ) ) ( not ( = ?auto_2659964 ?auto_2659967 ) ) ( not ( = ?auto_2659964 ?auto_2659968 ) ) ( not ( = ?auto_2659964 ?auto_2659969 ) ) ( not ( = ?auto_2659964 ?auto_2659970 ) ) ( not ( = ?auto_2659965 ?auto_2659966 ) ) ( not ( = ?auto_2659965 ?auto_2659967 ) ) ( not ( = ?auto_2659965 ?auto_2659968 ) ) ( not ( = ?auto_2659965 ?auto_2659969 ) ) ( not ( = ?auto_2659965 ?auto_2659970 ) ) ( not ( = ?auto_2659966 ?auto_2659967 ) ) ( not ( = ?auto_2659966 ?auto_2659968 ) ) ( not ( = ?auto_2659966 ?auto_2659969 ) ) ( not ( = ?auto_2659966 ?auto_2659970 ) ) ( not ( = ?auto_2659967 ?auto_2659968 ) ) ( not ( = ?auto_2659967 ?auto_2659969 ) ) ( not ( = ?auto_2659967 ?auto_2659970 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2659968 ?auto_2659969 ?auto_2659970 )
      ( MAKE-6CRATE-VERIFY ?auto_2659964 ?auto_2659965 ?auto_2659966 ?auto_2659967 ?auto_2659968 ?auto_2659969 ?auto_2659970 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2660021 - SURFACE
      ?auto_2660022 - SURFACE
      ?auto_2660023 - SURFACE
      ?auto_2660024 - SURFACE
      ?auto_2660025 - SURFACE
      ?auto_2660026 - SURFACE
      ?auto_2660027 - SURFACE
    )
    :vars
    (
      ?auto_2660032 - HOIST
      ?auto_2660030 - PLACE
      ?auto_2660031 - TRUCK
      ?auto_2660028 - PLACE
      ?auto_2660029 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2660032 ?auto_2660030 ) ( SURFACE-AT ?auto_2660026 ?auto_2660030 ) ( CLEAR ?auto_2660026 ) ( IS-CRATE ?auto_2660027 ) ( not ( = ?auto_2660026 ?auto_2660027 ) ) ( AVAILABLE ?auto_2660032 ) ( ON ?auto_2660026 ?auto_2660025 ) ( not ( = ?auto_2660025 ?auto_2660026 ) ) ( not ( = ?auto_2660025 ?auto_2660027 ) ) ( TRUCK-AT ?auto_2660031 ?auto_2660028 ) ( not ( = ?auto_2660028 ?auto_2660030 ) ) ( HOIST-AT ?auto_2660029 ?auto_2660028 ) ( LIFTING ?auto_2660029 ?auto_2660027 ) ( not ( = ?auto_2660032 ?auto_2660029 ) ) ( ON ?auto_2660022 ?auto_2660021 ) ( ON ?auto_2660023 ?auto_2660022 ) ( ON ?auto_2660024 ?auto_2660023 ) ( ON ?auto_2660025 ?auto_2660024 ) ( not ( = ?auto_2660021 ?auto_2660022 ) ) ( not ( = ?auto_2660021 ?auto_2660023 ) ) ( not ( = ?auto_2660021 ?auto_2660024 ) ) ( not ( = ?auto_2660021 ?auto_2660025 ) ) ( not ( = ?auto_2660021 ?auto_2660026 ) ) ( not ( = ?auto_2660021 ?auto_2660027 ) ) ( not ( = ?auto_2660022 ?auto_2660023 ) ) ( not ( = ?auto_2660022 ?auto_2660024 ) ) ( not ( = ?auto_2660022 ?auto_2660025 ) ) ( not ( = ?auto_2660022 ?auto_2660026 ) ) ( not ( = ?auto_2660022 ?auto_2660027 ) ) ( not ( = ?auto_2660023 ?auto_2660024 ) ) ( not ( = ?auto_2660023 ?auto_2660025 ) ) ( not ( = ?auto_2660023 ?auto_2660026 ) ) ( not ( = ?auto_2660023 ?auto_2660027 ) ) ( not ( = ?auto_2660024 ?auto_2660025 ) ) ( not ( = ?auto_2660024 ?auto_2660026 ) ) ( not ( = ?auto_2660024 ?auto_2660027 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2660025 ?auto_2660026 ?auto_2660027 )
      ( MAKE-6CRATE-VERIFY ?auto_2660021 ?auto_2660022 ?auto_2660023 ?auto_2660024 ?auto_2660025 ?auto_2660026 ?auto_2660027 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2660084 - SURFACE
      ?auto_2660085 - SURFACE
      ?auto_2660086 - SURFACE
      ?auto_2660087 - SURFACE
      ?auto_2660088 - SURFACE
      ?auto_2660089 - SURFACE
      ?auto_2660090 - SURFACE
    )
    :vars
    (
      ?auto_2660096 - HOIST
      ?auto_2660091 - PLACE
      ?auto_2660092 - TRUCK
      ?auto_2660093 - PLACE
      ?auto_2660095 - HOIST
      ?auto_2660094 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2660096 ?auto_2660091 ) ( SURFACE-AT ?auto_2660089 ?auto_2660091 ) ( CLEAR ?auto_2660089 ) ( IS-CRATE ?auto_2660090 ) ( not ( = ?auto_2660089 ?auto_2660090 ) ) ( AVAILABLE ?auto_2660096 ) ( ON ?auto_2660089 ?auto_2660088 ) ( not ( = ?auto_2660088 ?auto_2660089 ) ) ( not ( = ?auto_2660088 ?auto_2660090 ) ) ( TRUCK-AT ?auto_2660092 ?auto_2660093 ) ( not ( = ?auto_2660093 ?auto_2660091 ) ) ( HOIST-AT ?auto_2660095 ?auto_2660093 ) ( not ( = ?auto_2660096 ?auto_2660095 ) ) ( AVAILABLE ?auto_2660095 ) ( SURFACE-AT ?auto_2660090 ?auto_2660093 ) ( ON ?auto_2660090 ?auto_2660094 ) ( CLEAR ?auto_2660090 ) ( not ( = ?auto_2660089 ?auto_2660094 ) ) ( not ( = ?auto_2660090 ?auto_2660094 ) ) ( not ( = ?auto_2660088 ?auto_2660094 ) ) ( ON ?auto_2660085 ?auto_2660084 ) ( ON ?auto_2660086 ?auto_2660085 ) ( ON ?auto_2660087 ?auto_2660086 ) ( ON ?auto_2660088 ?auto_2660087 ) ( not ( = ?auto_2660084 ?auto_2660085 ) ) ( not ( = ?auto_2660084 ?auto_2660086 ) ) ( not ( = ?auto_2660084 ?auto_2660087 ) ) ( not ( = ?auto_2660084 ?auto_2660088 ) ) ( not ( = ?auto_2660084 ?auto_2660089 ) ) ( not ( = ?auto_2660084 ?auto_2660090 ) ) ( not ( = ?auto_2660084 ?auto_2660094 ) ) ( not ( = ?auto_2660085 ?auto_2660086 ) ) ( not ( = ?auto_2660085 ?auto_2660087 ) ) ( not ( = ?auto_2660085 ?auto_2660088 ) ) ( not ( = ?auto_2660085 ?auto_2660089 ) ) ( not ( = ?auto_2660085 ?auto_2660090 ) ) ( not ( = ?auto_2660085 ?auto_2660094 ) ) ( not ( = ?auto_2660086 ?auto_2660087 ) ) ( not ( = ?auto_2660086 ?auto_2660088 ) ) ( not ( = ?auto_2660086 ?auto_2660089 ) ) ( not ( = ?auto_2660086 ?auto_2660090 ) ) ( not ( = ?auto_2660086 ?auto_2660094 ) ) ( not ( = ?auto_2660087 ?auto_2660088 ) ) ( not ( = ?auto_2660087 ?auto_2660089 ) ) ( not ( = ?auto_2660087 ?auto_2660090 ) ) ( not ( = ?auto_2660087 ?auto_2660094 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2660088 ?auto_2660089 ?auto_2660090 )
      ( MAKE-6CRATE-VERIFY ?auto_2660084 ?auto_2660085 ?auto_2660086 ?auto_2660087 ?auto_2660088 ?auto_2660089 ?auto_2660090 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2660148 - SURFACE
      ?auto_2660149 - SURFACE
      ?auto_2660150 - SURFACE
      ?auto_2660151 - SURFACE
      ?auto_2660152 - SURFACE
      ?auto_2660153 - SURFACE
      ?auto_2660154 - SURFACE
    )
    :vars
    (
      ?auto_2660155 - HOIST
      ?auto_2660157 - PLACE
      ?auto_2660156 - PLACE
      ?auto_2660160 - HOIST
      ?auto_2660159 - SURFACE
      ?auto_2660158 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2660155 ?auto_2660157 ) ( SURFACE-AT ?auto_2660153 ?auto_2660157 ) ( CLEAR ?auto_2660153 ) ( IS-CRATE ?auto_2660154 ) ( not ( = ?auto_2660153 ?auto_2660154 ) ) ( AVAILABLE ?auto_2660155 ) ( ON ?auto_2660153 ?auto_2660152 ) ( not ( = ?auto_2660152 ?auto_2660153 ) ) ( not ( = ?auto_2660152 ?auto_2660154 ) ) ( not ( = ?auto_2660156 ?auto_2660157 ) ) ( HOIST-AT ?auto_2660160 ?auto_2660156 ) ( not ( = ?auto_2660155 ?auto_2660160 ) ) ( AVAILABLE ?auto_2660160 ) ( SURFACE-AT ?auto_2660154 ?auto_2660156 ) ( ON ?auto_2660154 ?auto_2660159 ) ( CLEAR ?auto_2660154 ) ( not ( = ?auto_2660153 ?auto_2660159 ) ) ( not ( = ?auto_2660154 ?auto_2660159 ) ) ( not ( = ?auto_2660152 ?auto_2660159 ) ) ( TRUCK-AT ?auto_2660158 ?auto_2660157 ) ( ON ?auto_2660149 ?auto_2660148 ) ( ON ?auto_2660150 ?auto_2660149 ) ( ON ?auto_2660151 ?auto_2660150 ) ( ON ?auto_2660152 ?auto_2660151 ) ( not ( = ?auto_2660148 ?auto_2660149 ) ) ( not ( = ?auto_2660148 ?auto_2660150 ) ) ( not ( = ?auto_2660148 ?auto_2660151 ) ) ( not ( = ?auto_2660148 ?auto_2660152 ) ) ( not ( = ?auto_2660148 ?auto_2660153 ) ) ( not ( = ?auto_2660148 ?auto_2660154 ) ) ( not ( = ?auto_2660148 ?auto_2660159 ) ) ( not ( = ?auto_2660149 ?auto_2660150 ) ) ( not ( = ?auto_2660149 ?auto_2660151 ) ) ( not ( = ?auto_2660149 ?auto_2660152 ) ) ( not ( = ?auto_2660149 ?auto_2660153 ) ) ( not ( = ?auto_2660149 ?auto_2660154 ) ) ( not ( = ?auto_2660149 ?auto_2660159 ) ) ( not ( = ?auto_2660150 ?auto_2660151 ) ) ( not ( = ?auto_2660150 ?auto_2660152 ) ) ( not ( = ?auto_2660150 ?auto_2660153 ) ) ( not ( = ?auto_2660150 ?auto_2660154 ) ) ( not ( = ?auto_2660150 ?auto_2660159 ) ) ( not ( = ?auto_2660151 ?auto_2660152 ) ) ( not ( = ?auto_2660151 ?auto_2660153 ) ) ( not ( = ?auto_2660151 ?auto_2660154 ) ) ( not ( = ?auto_2660151 ?auto_2660159 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2660152 ?auto_2660153 ?auto_2660154 )
      ( MAKE-6CRATE-VERIFY ?auto_2660148 ?auto_2660149 ?auto_2660150 ?auto_2660151 ?auto_2660152 ?auto_2660153 ?auto_2660154 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2660212 - SURFACE
      ?auto_2660213 - SURFACE
      ?auto_2660214 - SURFACE
      ?auto_2660215 - SURFACE
      ?auto_2660216 - SURFACE
      ?auto_2660217 - SURFACE
      ?auto_2660218 - SURFACE
    )
    :vars
    (
      ?auto_2660224 - HOIST
      ?auto_2660219 - PLACE
      ?auto_2660221 - PLACE
      ?auto_2660223 - HOIST
      ?auto_2660222 - SURFACE
      ?auto_2660220 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2660224 ?auto_2660219 ) ( IS-CRATE ?auto_2660218 ) ( not ( = ?auto_2660217 ?auto_2660218 ) ) ( not ( = ?auto_2660216 ?auto_2660217 ) ) ( not ( = ?auto_2660216 ?auto_2660218 ) ) ( not ( = ?auto_2660221 ?auto_2660219 ) ) ( HOIST-AT ?auto_2660223 ?auto_2660221 ) ( not ( = ?auto_2660224 ?auto_2660223 ) ) ( AVAILABLE ?auto_2660223 ) ( SURFACE-AT ?auto_2660218 ?auto_2660221 ) ( ON ?auto_2660218 ?auto_2660222 ) ( CLEAR ?auto_2660218 ) ( not ( = ?auto_2660217 ?auto_2660222 ) ) ( not ( = ?auto_2660218 ?auto_2660222 ) ) ( not ( = ?auto_2660216 ?auto_2660222 ) ) ( TRUCK-AT ?auto_2660220 ?auto_2660219 ) ( SURFACE-AT ?auto_2660216 ?auto_2660219 ) ( CLEAR ?auto_2660216 ) ( LIFTING ?auto_2660224 ?auto_2660217 ) ( IS-CRATE ?auto_2660217 ) ( ON ?auto_2660213 ?auto_2660212 ) ( ON ?auto_2660214 ?auto_2660213 ) ( ON ?auto_2660215 ?auto_2660214 ) ( ON ?auto_2660216 ?auto_2660215 ) ( not ( = ?auto_2660212 ?auto_2660213 ) ) ( not ( = ?auto_2660212 ?auto_2660214 ) ) ( not ( = ?auto_2660212 ?auto_2660215 ) ) ( not ( = ?auto_2660212 ?auto_2660216 ) ) ( not ( = ?auto_2660212 ?auto_2660217 ) ) ( not ( = ?auto_2660212 ?auto_2660218 ) ) ( not ( = ?auto_2660212 ?auto_2660222 ) ) ( not ( = ?auto_2660213 ?auto_2660214 ) ) ( not ( = ?auto_2660213 ?auto_2660215 ) ) ( not ( = ?auto_2660213 ?auto_2660216 ) ) ( not ( = ?auto_2660213 ?auto_2660217 ) ) ( not ( = ?auto_2660213 ?auto_2660218 ) ) ( not ( = ?auto_2660213 ?auto_2660222 ) ) ( not ( = ?auto_2660214 ?auto_2660215 ) ) ( not ( = ?auto_2660214 ?auto_2660216 ) ) ( not ( = ?auto_2660214 ?auto_2660217 ) ) ( not ( = ?auto_2660214 ?auto_2660218 ) ) ( not ( = ?auto_2660214 ?auto_2660222 ) ) ( not ( = ?auto_2660215 ?auto_2660216 ) ) ( not ( = ?auto_2660215 ?auto_2660217 ) ) ( not ( = ?auto_2660215 ?auto_2660218 ) ) ( not ( = ?auto_2660215 ?auto_2660222 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2660216 ?auto_2660217 ?auto_2660218 )
      ( MAKE-6CRATE-VERIFY ?auto_2660212 ?auto_2660213 ?auto_2660214 ?auto_2660215 ?auto_2660216 ?auto_2660217 ?auto_2660218 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2660276 - SURFACE
      ?auto_2660277 - SURFACE
      ?auto_2660278 - SURFACE
      ?auto_2660279 - SURFACE
      ?auto_2660280 - SURFACE
      ?auto_2660281 - SURFACE
      ?auto_2660282 - SURFACE
    )
    :vars
    (
      ?auto_2660285 - HOIST
      ?auto_2660288 - PLACE
      ?auto_2660286 - PLACE
      ?auto_2660287 - HOIST
      ?auto_2660284 - SURFACE
      ?auto_2660283 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2660285 ?auto_2660288 ) ( IS-CRATE ?auto_2660282 ) ( not ( = ?auto_2660281 ?auto_2660282 ) ) ( not ( = ?auto_2660280 ?auto_2660281 ) ) ( not ( = ?auto_2660280 ?auto_2660282 ) ) ( not ( = ?auto_2660286 ?auto_2660288 ) ) ( HOIST-AT ?auto_2660287 ?auto_2660286 ) ( not ( = ?auto_2660285 ?auto_2660287 ) ) ( AVAILABLE ?auto_2660287 ) ( SURFACE-AT ?auto_2660282 ?auto_2660286 ) ( ON ?auto_2660282 ?auto_2660284 ) ( CLEAR ?auto_2660282 ) ( not ( = ?auto_2660281 ?auto_2660284 ) ) ( not ( = ?auto_2660282 ?auto_2660284 ) ) ( not ( = ?auto_2660280 ?auto_2660284 ) ) ( TRUCK-AT ?auto_2660283 ?auto_2660288 ) ( SURFACE-AT ?auto_2660280 ?auto_2660288 ) ( CLEAR ?auto_2660280 ) ( IS-CRATE ?auto_2660281 ) ( AVAILABLE ?auto_2660285 ) ( IN ?auto_2660281 ?auto_2660283 ) ( ON ?auto_2660277 ?auto_2660276 ) ( ON ?auto_2660278 ?auto_2660277 ) ( ON ?auto_2660279 ?auto_2660278 ) ( ON ?auto_2660280 ?auto_2660279 ) ( not ( = ?auto_2660276 ?auto_2660277 ) ) ( not ( = ?auto_2660276 ?auto_2660278 ) ) ( not ( = ?auto_2660276 ?auto_2660279 ) ) ( not ( = ?auto_2660276 ?auto_2660280 ) ) ( not ( = ?auto_2660276 ?auto_2660281 ) ) ( not ( = ?auto_2660276 ?auto_2660282 ) ) ( not ( = ?auto_2660276 ?auto_2660284 ) ) ( not ( = ?auto_2660277 ?auto_2660278 ) ) ( not ( = ?auto_2660277 ?auto_2660279 ) ) ( not ( = ?auto_2660277 ?auto_2660280 ) ) ( not ( = ?auto_2660277 ?auto_2660281 ) ) ( not ( = ?auto_2660277 ?auto_2660282 ) ) ( not ( = ?auto_2660277 ?auto_2660284 ) ) ( not ( = ?auto_2660278 ?auto_2660279 ) ) ( not ( = ?auto_2660278 ?auto_2660280 ) ) ( not ( = ?auto_2660278 ?auto_2660281 ) ) ( not ( = ?auto_2660278 ?auto_2660282 ) ) ( not ( = ?auto_2660278 ?auto_2660284 ) ) ( not ( = ?auto_2660279 ?auto_2660280 ) ) ( not ( = ?auto_2660279 ?auto_2660281 ) ) ( not ( = ?auto_2660279 ?auto_2660282 ) ) ( not ( = ?auto_2660279 ?auto_2660284 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2660280 ?auto_2660281 ?auto_2660282 )
      ( MAKE-6CRATE-VERIFY ?auto_2660276 ?auto_2660277 ?auto_2660278 ?auto_2660279 ?auto_2660280 ?auto_2660281 ?auto_2660282 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2660746 - SURFACE
      ?auto_2660747 - SURFACE
    )
    :vars
    (
      ?auto_2660749 - HOIST
      ?auto_2660753 - PLACE
      ?auto_2660748 - SURFACE
      ?auto_2660751 - PLACE
      ?auto_2660754 - HOIST
      ?auto_2660750 - SURFACE
      ?auto_2660752 - TRUCK
      ?auto_2660755 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2660749 ?auto_2660753 ) ( SURFACE-AT ?auto_2660746 ?auto_2660753 ) ( CLEAR ?auto_2660746 ) ( IS-CRATE ?auto_2660747 ) ( not ( = ?auto_2660746 ?auto_2660747 ) ) ( ON ?auto_2660746 ?auto_2660748 ) ( not ( = ?auto_2660748 ?auto_2660746 ) ) ( not ( = ?auto_2660748 ?auto_2660747 ) ) ( not ( = ?auto_2660751 ?auto_2660753 ) ) ( HOIST-AT ?auto_2660754 ?auto_2660751 ) ( not ( = ?auto_2660749 ?auto_2660754 ) ) ( AVAILABLE ?auto_2660754 ) ( SURFACE-AT ?auto_2660747 ?auto_2660751 ) ( ON ?auto_2660747 ?auto_2660750 ) ( CLEAR ?auto_2660747 ) ( not ( = ?auto_2660746 ?auto_2660750 ) ) ( not ( = ?auto_2660747 ?auto_2660750 ) ) ( not ( = ?auto_2660748 ?auto_2660750 ) ) ( TRUCK-AT ?auto_2660752 ?auto_2660753 ) ( LIFTING ?auto_2660749 ?auto_2660755 ) ( IS-CRATE ?auto_2660755 ) ( not ( = ?auto_2660746 ?auto_2660755 ) ) ( not ( = ?auto_2660747 ?auto_2660755 ) ) ( not ( = ?auto_2660748 ?auto_2660755 ) ) ( not ( = ?auto_2660750 ?auto_2660755 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2660749 ?auto_2660755 ?auto_2660752 ?auto_2660753 )
      ( MAKE-1CRATE ?auto_2660746 ?auto_2660747 )
      ( MAKE-1CRATE-VERIFY ?auto_2660746 ?auto_2660747 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2662225 - SURFACE
      ?auto_2662226 - SURFACE
      ?auto_2662227 - SURFACE
      ?auto_2662228 - SURFACE
      ?auto_2662229 - SURFACE
      ?auto_2662230 - SURFACE
      ?auto_2662231 - SURFACE
      ?auto_2662232 - SURFACE
    )
    :vars
    (
      ?auto_2662233 - HOIST
      ?auto_2662234 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2662233 ?auto_2662234 ) ( SURFACE-AT ?auto_2662231 ?auto_2662234 ) ( CLEAR ?auto_2662231 ) ( LIFTING ?auto_2662233 ?auto_2662232 ) ( IS-CRATE ?auto_2662232 ) ( not ( = ?auto_2662231 ?auto_2662232 ) ) ( ON ?auto_2662226 ?auto_2662225 ) ( ON ?auto_2662227 ?auto_2662226 ) ( ON ?auto_2662228 ?auto_2662227 ) ( ON ?auto_2662229 ?auto_2662228 ) ( ON ?auto_2662230 ?auto_2662229 ) ( ON ?auto_2662231 ?auto_2662230 ) ( not ( = ?auto_2662225 ?auto_2662226 ) ) ( not ( = ?auto_2662225 ?auto_2662227 ) ) ( not ( = ?auto_2662225 ?auto_2662228 ) ) ( not ( = ?auto_2662225 ?auto_2662229 ) ) ( not ( = ?auto_2662225 ?auto_2662230 ) ) ( not ( = ?auto_2662225 ?auto_2662231 ) ) ( not ( = ?auto_2662225 ?auto_2662232 ) ) ( not ( = ?auto_2662226 ?auto_2662227 ) ) ( not ( = ?auto_2662226 ?auto_2662228 ) ) ( not ( = ?auto_2662226 ?auto_2662229 ) ) ( not ( = ?auto_2662226 ?auto_2662230 ) ) ( not ( = ?auto_2662226 ?auto_2662231 ) ) ( not ( = ?auto_2662226 ?auto_2662232 ) ) ( not ( = ?auto_2662227 ?auto_2662228 ) ) ( not ( = ?auto_2662227 ?auto_2662229 ) ) ( not ( = ?auto_2662227 ?auto_2662230 ) ) ( not ( = ?auto_2662227 ?auto_2662231 ) ) ( not ( = ?auto_2662227 ?auto_2662232 ) ) ( not ( = ?auto_2662228 ?auto_2662229 ) ) ( not ( = ?auto_2662228 ?auto_2662230 ) ) ( not ( = ?auto_2662228 ?auto_2662231 ) ) ( not ( = ?auto_2662228 ?auto_2662232 ) ) ( not ( = ?auto_2662229 ?auto_2662230 ) ) ( not ( = ?auto_2662229 ?auto_2662231 ) ) ( not ( = ?auto_2662229 ?auto_2662232 ) ) ( not ( = ?auto_2662230 ?auto_2662231 ) ) ( not ( = ?auto_2662230 ?auto_2662232 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2662231 ?auto_2662232 )
      ( MAKE-7CRATE-VERIFY ?auto_2662225 ?auto_2662226 ?auto_2662227 ?auto_2662228 ?auto_2662229 ?auto_2662230 ?auto_2662231 ?auto_2662232 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2662280 - SURFACE
      ?auto_2662281 - SURFACE
      ?auto_2662282 - SURFACE
      ?auto_2662283 - SURFACE
      ?auto_2662284 - SURFACE
      ?auto_2662285 - SURFACE
      ?auto_2662286 - SURFACE
      ?auto_2662287 - SURFACE
    )
    :vars
    (
      ?auto_2662288 - HOIST
      ?auto_2662290 - PLACE
      ?auto_2662289 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2662288 ?auto_2662290 ) ( SURFACE-AT ?auto_2662286 ?auto_2662290 ) ( CLEAR ?auto_2662286 ) ( IS-CRATE ?auto_2662287 ) ( not ( = ?auto_2662286 ?auto_2662287 ) ) ( TRUCK-AT ?auto_2662289 ?auto_2662290 ) ( AVAILABLE ?auto_2662288 ) ( IN ?auto_2662287 ?auto_2662289 ) ( ON ?auto_2662286 ?auto_2662285 ) ( not ( = ?auto_2662285 ?auto_2662286 ) ) ( not ( = ?auto_2662285 ?auto_2662287 ) ) ( ON ?auto_2662281 ?auto_2662280 ) ( ON ?auto_2662282 ?auto_2662281 ) ( ON ?auto_2662283 ?auto_2662282 ) ( ON ?auto_2662284 ?auto_2662283 ) ( ON ?auto_2662285 ?auto_2662284 ) ( not ( = ?auto_2662280 ?auto_2662281 ) ) ( not ( = ?auto_2662280 ?auto_2662282 ) ) ( not ( = ?auto_2662280 ?auto_2662283 ) ) ( not ( = ?auto_2662280 ?auto_2662284 ) ) ( not ( = ?auto_2662280 ?auto_2662285 ) ) ( not ( = ?auto_2662280 ?auto_2662286 ) ) ( not ( = ?auto_2662280 ?auto_2662287 ) ) ( not ( = ?auto_2662281 ?auto_2662282 ) ) ( not ( = ?auto_2662281 ?auto_2662283 ) ) ( not ( = ?auto_2662281 ?auto_2662284 ) ) ( not ( = ?auto_2662281 ?auto_2662285 ) ) ( not ( = ?auto_2662281 ?auto_2662286 ) ) ( not ( = ?auto_2662281 ?auto_2662287 ) ) ( not ( = ?auto_2662282 ?auto_2662283 ) ) ( not ( = ?auto_2662282 ?auto_2662284 ) ) ( not ( = ?auto_2662282 ?auto_2662285 ) ) ( not ( = ?auto_2662282 ?auto_2662286 ) ) ( not ( = ?auto_2662282 ?auto_2662287 ) ) ( not ( = ?auto_2662283 ?auto_2662284 ) ) ( not ( = ?auto_2662283 ?auto_2662285 ) ) ( not ( = ?auto_2662283 ?auto_2662286 ) ) ( not ( = ?auto_2662283 ?auto_2662287 ) ) ( not ( = ?auto_2662284 ?auto_2662285 ) ) ( not ( = ?auto_2662284 ?auto_2662286 ) ) ( not ( = ?auto_2662284 ?auto_2662287 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2662285 ?auto_2662286 ?auto_2662287 )
      ( MAKE-7CRATE-VERIFY ?auto_2662280 ?auto_2662281 ?auto_2662282 ?auto_2662283 ?auto_2662284 ?auto_2662285 ?auto_2662286 ?auto_2662287 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2662343 - SURFACE
      ?auto_2662344 - SURFACE
      ?auto_2662345 - SURFACE
      ?auto_2662346 - SURFACE
      ?auto_2662347 - SURFACE
      ?auto_2662348 - SURFACE
      ?auto_2662349 - SURFACE
      ?auto_2662350 - SURFACE
    )
    :vars
    (
      ?auto_2662352 - HOIST
      ?auto_2662351 - PLACE
      ?auto_2662353 - TRUCK
      ?auto_2662354 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2662352 ?auto_2662351 ) ( SURFACE-AT ?auto_2662349 ?auto_2662351 ) ( CLEAR ?auto_2662349 ) ( IS-CRATE ?auto_2662350 ) ( not ( = ?auto_2662349 ?auto_2662350 ) ) ( AVAILABLE ?auto_2662352 ) ( IN ?auto_2662350 ?auto_2662353 ) ( ON ?auto_2662349 ?auto_2662348 ) ( not ( = ?auto_2662348 ?auto_2662349 ) ) ( not ( = ?auto_2662348 ?auto_2662350 ) ) ( TRUCK-AT ?auto_2662353 ?auto_2662354 ) ( not ( = ?auto_2662354 ?auto_2662351 ) ) ( ON ?auto_2662344 ?auto_2662343 ) ( ON ?auto_2662345 ?auto_2662344 ) ( ON ?auto_2662346 ?auto_2662345 ) ( ON ?auto_2662347 ?auto_2662346 ) ( ON ?auto_2662348 ?auto_2662347 ) ( not ( = ?auto_2662343 ?auto_2662344 ) ) ( not ( = ?auto_2662343 ?auto_2662345 ) ) ( not ( = ?auto_2662343 ?auto_2662346 ) ) ( not ( = ?auto_2662343 ?auto_2662347 ) ) ( not ( = ?auto_2662343 ?auto_2662348 ) ) ( not ( = ?auto_2662343 ?auto_2662349 ) ) ( not ( = ?auto_2662343 ?auto_2662350 ) ) ( not ( = ?auto_2662344 ?auto_2662345 ) ) ( not ( = ?auto_2662344 ?auto_2662346 ) ) ( not ( = ?auto_2662344 ?auto_2662347 ) ) ( not ( = ?auto_2662344 ?auto_2662348 ) ) ( not ( = ?auto_2662344 ?auto_2662349 ) ) ( not ( = ?auto_2662344 ?auto_2662350 ) ) ( not ( = ?auto_2662345 ?auto_2662346 ) ) ( not ( = ?auto_2662345 ?auto_2662347 ) ) ( not ( = ?auto_2662345 ?auto_2662348 ) ) ( not ( = ?auto_2662345 ?auto_2662349 ) ) ( not ( = ?auto_2662345 ?auto_2662350 ) ) ( not ( = ?auto_2662346 ?auto_2662347 ) ) ( not ( = ?auto_2662346 ?auto_2662348 ) ) ( not ( = ?auto_2662346 ?auto_2662349 ) ) ( not ( = ?auto_2662346 ?auto_2662350 ) ) ( not ( = ?auto_2662347 ?auto_2662348 ) ) ( not ( = ?auto_2662347 ?auto_2662349 ) ) ( not ( = ?auto_2662347 ?auto_2662350 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2662348 ?auto_2662349 ?auto_2662350 )
      ( MAKE-7CRATE-VERIFY ?auto_2662343 ?auto_2662344 ?auto_2662345 ?auto_2662346 ?auto_2662347 ?auto_2662348 ?auto_2662349 ?auto_2662350 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2662413 - SURFACE
      ?auto_2662414 - SURFACE
      ?auto_2662415 - SURFACE
      ?auto_2662416 - SURFACE
      ?auto_2662417 - SURFACE
      ?auto_2662418 - SURFACE
      ?auto_2662419 - SURFACE
      ?auto_2662420 - SURFACE
    )
    :vars
    (
      ?auto_2662422 - HOIST
      ?auto_2662424 - PLACE
      ?auto_2662425 - TRUCK
      ?auto_2662421 - PLACE
      ?auto_2662423 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2662422 ?auto_2662424 ) ( SURFACE-AT ?auto_2662419 ?auto_2662424 ) ( CLEAR ?auto_2662419 ) ( IS-CRATE ?auto_2662420 ) ( not ( = ?auto_2662419 ?auto_2662420 ) ) ( AVAILABLE ?auto_2662422 ) ( ON ?auto_2662419 ?auto_2662418 ) ( not ( = ?auto_2662418 ?auto_2662419 ) ) ( not ( = ?auto_2662418 ?auto_2662420 ) ) ( TRUCK-AT ?auto_2662425 ?auto_2662421 ) ( not ( = ?auto_2662421 ?auto_2662424 ) ) ( HOIST-AT ?auto_2662423 ?auto_2662421 ) ( LIFTING ?auto_2662423 ?auto_2662420 ) ( not ( = ?auto_2662422 ?auto_2662423 ) ) ( ON ?auto_2662414 ?auto_2662413 ) ( ON ?auto_2662415 ?auto_2662414 ) ( ON ?auto_2662416 ?auto_2662415 ) ( ON ?auto_2662417 ?auto_2662416 ) ( ON ?auto_2662418 ?auto_2662417 ) ( not ( = ?auto_2662413 ?auto_2662414 ) ) ( not ( = ?auto_2662413 ?auto_2662415 ) ) ( not ( = ?auto_2662413 ?auto_2662416 ) ) ( not ( = ?auto_2662413 ?auto_2662417 ) ) ( not ( = ?auto_2662413 ?auto_2662418 ) ) ( not ( = ?auto_2662413 ?auto_2662419 ) ) ( not ( = ?auto_2662413 ?auto_2662420 ) ) ( not ( = ?auto_2662414 ?auto_2662415 ) ) ( not ( = ?auto_2662414 ?auto_2662416 ) ) ( not ( = ?auto_2662414 ?auto_2662417 ) ) ( not ( = ?auto_2662414 ?auto_2662418 ) ) ( not ( = ?auto_2662414 ?auto_2662419 ) ) ( not ( = ?auto_2662414 ?auto_2662420 ) ) ( not ( = ?auto_2662415 ?auto_2662416 ) ) ( not ( = ?auto_2662415 ?auto_2662417 ) ) ( not ( = ?auto_2662415 ?auto_2662418 ) ) ( not ( = ?auto_2662415 ?auto_2662419 ) ) ( not ( = ?auto_2662415 ?auto_2662420 ) ) ( not ( = ?auto_2662416 ?auto_2662417 ) ) ( not ( = ?auto_2662416 ?auto_2662418 ) ) ( not ( = ?auto_2662416 ?auto_2662419 ) ) ( not ( = ?auto_2662416 ?auto_2662420 ) ) ( not ( = ?auto_2662417 ?auto_2662418 ) ) ( not ( = ?auto_2662417 ?auto_2662419 ) ) ( not ( = ?auto_2662417 ?auto_2662420 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2662418 ?auto_2662419 ?auto_2662420 )
      ( MAKE-7CRATE-VERIFY ?auto_2662413 ?auto_2662414 ?auto_2662415 ?auto_2662416 ?auto_2662417 ?auto_2662418 ?auto_2662419 ?auto_2662420 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2662490 - SURFACE
      ?auto_2662491 - SURFACE
      ?auto_2662492 - SURFACE
      ?auto_2662493 - SURFACE
      ?auto_2662494 - SURFACE
      ?auto_2662495 - SURFACE
      ?auto_2662496 - SURFACE
      ?auto_2662497 - SURFACE
    )
    :vars
    (
      ?auto_2662502 - HOIST
      ?auto_2662499 - PLACE
      ?auto_2662503 - TRUCK
      ?auto_2662498 - PLACE
      ?auto_2662501 - HOIST
      ?auto_2662500 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2662502 ?auto_2662499 ) ( SURFACE-AT ?auto_2662496 ?auto_2662499 ) ( CLEAR ?auto_2662496 ) ( IS-CRATE ?auto_2662497 ) ( not ( = ?auto_2662496 ?auto_2662497 ) ) ( AVAILABLE ?auto_2662502 ) ( ON ?auto_2662496 ?auto_2662495 ) ( not ( = ?auto_2662495 ?auto_2662496 ) ) ( not ( = ?auto_2662495 ?auto_2662497 ) ) ( TRUCK-AT ?auto_2662503 ?auto_2662498 ) ( not ( = ?auto_2662498 ?auto_2662499 ) ) ( HOIST-AT ?auto_2662501 ?auto_2662498 ) ( not ( = ?auto_2662502 ?auto_2662501 ) ) ( AVAILABLE ?auto_2662501 ) ( SURFACE-AT ?auto_2662497 ?auto_2662498 ) ( ON ?auto_2662497 ?auto_2662500 ) ( CLEAR ?auto_2662497 ) ( not ( = ?auto_2662496 ?auto_2662500 ) ) ( not ( = ?auto_2662497 ?auto_2662500 ) ) ( not ( = ?auto_2662495 ?auto_2662500 ) ) ( ON ?auto_2662491 ?auto_2662490 ) ( ON ?auto_2662492 ?auto_2662491 ) ( ON ?auto_2662493 ?auto_2662492 ) ( ON ?auto_2662494 ?auto_2662493 ) ( ON ?auto_2662495 ?auto_2662494 ) ( not ( = ?auto_2662490 ?auto_2662491 ) ) ( not ( = ?auto_2662490 ?auto_2662492 ) ) ( not ( = ?auto_2662490 ?auto_2662493 ) ) ( not ( = ?auto_2662490 ?auto_2662494 ) ) ( not ( = ?auto_2662490 ?auto_2662495 ) ) ( not ( = ?auto_2662490 ?auto_2662496 ) ) ( not ( = ?auto_2662490 ?auto_2662497 ) ) ( not ( = ?auto_2662490 ?auto_2662500 ) ) ( not ( = ?auto_2662491 ?auto_2662492 ) ) ( not ( = ?auto_2662491 ?auto_2662493 ) ) ( not ( = ?auto_2662491 ?auto_2662494 ) ) ( not ( = ?auto_2662491 ?auto_2662495 ) ) ( not ( = ?auto_2662491 ?auto_2662496 ) ) ( not ( = ?auto_2662491 ?auto_2662497 ) ) ( not ( = ?auto_2662491 ?auto_2662500 ) ) ( not ( = ?auto_2662492 ?auto_2662493 ) ) ( not ( = ?auto_2662492 ?auto_2662494 ) ) ( not ( = ?auto_2662492 ?auto_2662495 ) ) ( not ( = ?auto_2662492 ?auto_2662496 ) ) ( not ( = ?auto_2662492 ?auto_2662497 ) ) ( not ( = ?auto_2662492 ?auto_2662500 ) ) ( not ( = ?auto_2662493 ?auto_2662494 ) ) ( not ( = ?auto_2662493 ?auto_2662495 ) ) ( not ( = ?auto_2662493 ?auto_2662496 ) ) ( not ( = ?auto_2662493 ?auto_2662497 ) ) ( not ( = ?auto_2662493 ?auto_2662500 ) ) ( not ( = ?auto_2662494 ?auto_2662495 ) ) ( not ( = ?auto_2662494 ?auto_2662496 ) ) ( not ( = ?auto_2662494 ?auto_2662497 ) ) ( not ( = ?auto_2662494 ?auto_2662500 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2662495 ?auto_2662496 ?auto_2662497 )
      ( MAKE-7CRATE-VERIFY ?auto_2662490 ?auto_2662491 ?auto_2662492 ?auto_2662493 ?auto_2662494 ?auto_2662495 ?auto_2662496 ?auto_2662497 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2662568 - SURFACE
      ?auto_2662569 - SURFACE
      ?auto_2662570 - SURFACE
      ?auto_2662571 - SURFACE
      ?auto_2662572 - SURFACE
      ?auto_2662573 - SURFACE
      ?auto_2662574 - SURFACE
      ?auto_2662575 - SURFACE
    )
    :vars
    (
      ?auto_2662580 - HOIST
      ?auto_2662578 - PLACE
      ?auto_2662581 - PLACE
      ?auto_2662576 - HOIST
      ?auto_2662579 - SURFACE
      ?auto_2662577 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2662580 ?auto_2662578 ) ( SURFACE-AT ?auto_2662574 ?auto_2662578 ) ( CLEAR ?auto_2662574 ) ( IS-CRATE ?auto_2662575 ) ( not ( = ?auto_2662574 ?auto_2662575 ) ) ( AVAILABLE ?auto_2662580 ) ( ON ?auto_2662574 ?auto_2662573 ) ( not ( = ?auto_2662573 ?auto_2662574 ) ) ( not ( = ?auto_2662573 ?auto_2662575 ) ) ( not ( = ?auto_2662581 ?auto_2662578 ) ) ( HOIST-AT ?auto_2662576 ?auto_2662581 ) ( not ( = ?auto_2662580 ?auto_2662576 ) ) ( AVAILABLE ?auto_2662576 ) ( SURFACE-AT ?auto_2662575 ?auto_2662581 ) ( ON ?auto_2662575 ?auto_2662579 ) ( CLEAR ?auto_2662575 ) ( not ( = ?auto_2662574 ?auto_2662579 ) ) ( not ( = ?auto_2662575 ?auto_2662579 ) ) ( not ( = ?auto_2662573 ?auto_2662579 ) ) ( TRUCK-AT ?auto_2662577 ?auto_2662578 ) ( ON ?auto_2662569 ?auto_2662568 ) ( ON ?auto_2662570 ?auto_2662569 ) ( ON ?auto_2662571 ?auto_2662570 ) ( ON ?auto_2662572 ?auto_2662571 ) ( ON ?auto_2662573 ?auto_2662572 ) ( not ( = ?auto_2662568 ?auto_2662569 ) ) ( not ( = ?auto_2662568 ?auto_2662570 ) ) ( not ( = ?auto_2662568 ?auto_2662571 ) ) ( not ( = ?auto_2662568 ?auto_2662572 ) ) ( not ( = ?auto_2662568 ?auto_2662573 ) ) ( not ( = ?auto_2662568 ?auto_2662574 ) ) ( not ( = ?auto_2662568 ?auto_2662575 ) ) ( not ( = ?auto_2662568 ?auto_2662579 ) ) ( not ( = ?auto_2662569 ?auto_2662570 ) ) ( not ( = ?auto_2662569 ?auto_2662571 ) ) ( not ( = ?auto_2662569 ?auto_2662572 ) ) ( not ( = ?auto_2662569 ?auto_2662573 ) ) ( not ( = ?auto_2662569 ?auto_2662574 ) ) ( not ( = ?auto_2662569 ?auto_2662575 ) ) ( not ( = ?auto_2662569 ?auto_2662579 ) ) ( not ( = ?auto_2662570 ?auto_2662571 ) ) ( not ( = ?auto_2662570 ?auto_2662572 ) ) ( not ( = ?auto_2662570 ?auto_2662573 ) ) ( not ( = ?auto_2662570 ?auto_2662574 ) ) ( not ( = ?auto_2662570 ?auto_2662575 ) ) ( not ( = ?auto_2662570 ?auto_2662579 ) ) ( not ( = ?auto_2662571 ?auto_2662572 ) ) ( not ( = ?auto_2662571 ?auto_2662573 ) ) ( not ( = ?auto_2662571 ?auto_2662574 ) ) ( not ( = ?auto_2662571 ?auto_2662575 ) ) ( not ( = ?auto_2662571 ?auto_2662579 ) ) ( not ( = ?auto_2662572 ?auto_2662573 ) ) ( not ( = ?auto_2662572 ?auto_2662574 ) ) ( not ( = ?auto_2662572 ?auto_2662575 ) ) ( not ( = ?auto_2662572 ?auto_2662579 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2662573 ?auto_2662574 ?auto_2662575 )
      ( MAKE-7CRATE-VERIFY ?auto_2662568 ?auto_2662569 ?auto_2662570 ?auto_2662571 ?auto_2662572 ?auto_2662573 ?auto_2662574 ?auto_2662575 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2662646 - SURFACE
      ?auto_2662647 - SURFACE
      ?auto_2662648 - SURFACE
      ?auto_2662649 - SURFACE
      ?auto_2662650 - SURFACE
      ?auto_2662651 - SURFACE
      ?auto_2662652 - SURFACE
      ?auto_2662653 - SURFACE
    )
    :vars
    (
      ?auto_2662658 - HOIST
      ?auto_2662659 - PLACE
      ?auto_2662654 - PLACE
      ?auto_2662657 - HOIST
      ?auto_2662656 - SURFACE
      ?auto_2662655 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2662658 ?auto_2662659 ) ( IS-CRATE ?auto_2662653 ) ( not ( = ?auto_2662652 ?auto_2662653 ) ) ( not ( = ?auto_2662651 ?auto_2662652 ) ) ( not ( = ?auto_2662651 ?auto_2662653 ) ) ( not ( = ?auto_2662654 ?auto_2662659 ) ) ( HOIST-AT ?auto_2662657 ?auto_2662654 ) ( not ( = ?auto_2662658 ?auto_2662657 ) ) ( AVAILABLE ?auto_2662657 ) ( SURFACE-AT ?auto_2662653 ?auto_2662654 ) ( ON ?auto_2662653 ?auto_2662656 ) ( CLEAR ?auto_2662653 ) ( not ( = ?auto_2662652 ?auto_2662656 ) ) ( not ( = ?auto_2662653 ?auto_2662656 ) ) ( not ( = ?auto_2662651 ?auto_2662656 ) ) ( TRUCK-AT ?auto_2662655 ?auto_2662659 ) ( SURFACE-AT ?auto_2662651 ?auto_2662659 ) ( CLEAR ?auto_2662651 ) ( LIFTING ?auto_2662658 ?auto_2662652 ) ( IS-CRATE ?auto_2662652 ) ( ON ?auto_2662647 ?auto_2662646 ) ( ON ?auto_2662648 ?auto_2662647 ) ( ON ?auto_2662649 ?auto_2662648 ) ( ON ?auto_2662650 ?auto_2662649 ) ( ON ?auto_2662651 ?auto_2662650 ) ( not ( = ?auto_2662646 ?auto_2662647 ) ) ( not ( = ?auto_2662646 ?auto_2662648 ) ) ( not ( = ?auto_2662646 ?auto_2662649 ) ) ( not ( = ?auto_2662646 ?auto_2662650 ) ) ( not ( = ?auto_2662646 ?auto_2662651 ) ) ( not ( = ?auto_2662646 ?auto_2662652 ) ) ( not ( = ?auto_2662646 ?auto_2662653 ) ) ( not ( = ?auto_2662646 ?auto_2662656 ) ) ( not ( = ?auto_2662647 ?auto_2662648 ) ) ( not ( = ?auto_2662647 ?auto_2662649 ) ) ( not ( = ?auto_2662647 ?auto_2662650 ) ) ( not ( = ?auto_2662647 ?auto_2662651 ) ) ( not ( = ?auto_2662647 ?auto_2662652 ) ) ( not ( = ?auto_2662647 ?auto_2662653 ) ) ( not ( = ?auto_2662647 ?auto_2662656 ) ) ( not ( = ?auto_2662648 ?auto_2662649 ) ) ( not ( = ?auto_2662648 ?auto_2662650 ) ) ( not ( = ?auto_2662648 ?auto_2662651 ) ) ( not ( = ?auto_2662648 ?auto_2662652 ) ) ( not ( = ?auto_2662648 ?auto_2662653 ) ) ( not ( = ?auto_2662648 ?auto_2662656 ) ) ( not ( = ?auto_2662649 ?auto_2662650 ) ) ( not ( = ?auto_2662649 ?auto_2662651 ) ) ( not ( = ?auto_2662649 ?auto_2662652 ) ) ( not ( = ?auto_2662649 ?auto_2662653 ) ) ( not ( = ?auto_2662649 ?auto_2662656 ) ) ( not ( = ?auto_2662650 ?auto_2662651 ) ) ( not ( = ?auto_2662650 ?auto_2662652 ) ) ( not ( = ?auto_2662650 ?auto_2662653 ) ) ( not ( = ?auto_2662650 ?auto_2662656 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2662651 ?auto_2662652 ?auto_2662653 )
      ( MAKE-7CRATE-VERIFY ?auto_2662646 ?auto_2662647 ?auto_2662648 ?auto_2662649 ?auto_2662650 ?auto_2662651 ?auto_2662652 ?auto_2662653 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2662724 - SURFACE
      ?auto_2662725 - SURFACE
      ?auto_2662726 - SURFACE
      ?auto_2662727 - SURFACE
      ?auto_2662728 - SURFACE
      ?auto_2662729 - SURFACE
      ?auto_2662730 - SURFACE
      ?auto_2662731 - SURFACE
    )
    :vars
    (
      ?auto_2662733 - HOIST
      ?auto_2662737 - PLACE
      ?auto_2662734 - PLACE
      ?auto_2662735 - HOIST
      ?auto_2662736 - SURFACE
      ?auto_2662732 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2662733 ?auto_2662737 ) ( IS-CRATE ?auto_2662731 ) ( not ( = ?auto_2662730 ?auto_2662731 ) ) ( not ( = ?auto_2662729 ?auto_2662730 ) ) ( not ( = ?auto_2662729 ?auto_2662731 ) ) ( not ( = ?auto_2662734 ?auto_2662737 ) ) ( HOIST-AT ?auto_2662735 ?auto_2662734 ) ( not ( = ?auto_2662733 ?auto_2662735 ) ) ( AVAILABLE ?auto_2662735 ) ( SURFACE-AT ?auto_2662731 ?auto_2662734 ) ( ON ?auto_2662731 ?auto_2662736 ) ( CLEAR ?auto_2662731 ) ( not ( = ?auto_2662730 ?auto_2662736 ) ) ( not ( = ?auto_2662731 ?auto_2662736 ) ) ( not ( = ?auto_2662729 ?auto_2662736 ) ) ( TRUCK-AT ?auto_2662732 ?auto_2662737 ) ( SURFACE-AT ?auto_2662729 ?auto_2662737 ) ( CLEAR ?auto_2662729 ) ( IS-CRATE ?auto_2662730 ) ( AVAILABLE ?auto_2662733 ) ( IN ?auto_2662730 ?auto_2662732 ) ( ON ?auto_2662725 ?auto_2662724 ) ( ON ?auto_2662726 ?auto_2662725 ) ( ON ?auto_2662727 ?auto_2662726 ) ( ON ?auto_2662728 ?auto_2662727 ) ( ON ?auto_2662729 ?auto_2662728 ) ( not ( = ?auto_2662724 ?auto_2662725 ) ) ( not ( = ?auto_2662724 ?auto_2662726 ) ) ( not ( = ?auto_2662724 ?auto_2662727 ) ) ( not ( = ?auto_2662724 ?auto_2662728 ) ) ( not ( = ?auto_2662724 ?auto_2662729 ) ) ( not ( = ?auto_2662724 ?auto_2662730 ) ) ( not ( = ?auto_2662724 ?auto_2662731 ) ) ( not ( = ?auto_2662724 ?auto_2662736 ) ) ( not ( = ?auto_2662725 ?auto_2662726 ) ) ( not ( = ?auto_2662725 ?auto_2662727 ) ) ( not ( = ?auto_2662725 ?auto_2662728 ) ) ( not ( = ?auto_2662725 ?auto_2662729 ) ) ( not ( = ?auto_2662725 ?auto_2662730 ) ) ( not ( = ?auto_2662725 ?auto_2662731 ) ) ( not ( = ?auto_2662725 ?auto_2662736 ) ) ( not ( = ?auto_2662726 ?auto_2662727 ) ) ( not ( = ?auto_2662726 ?auto_2662728 ) ) ( not ( = ?auto_2662726 ?auto_2662729 ) ) ( not ( = ?auto_2662726 ?auto_2662730 ) ) ( not ( = ?auto_2662726 ?auto_2662731 ) ) ( not ( = ?auto_2662726 ?auto_2662736 ) ) ( not ( = ?auto_2662727 ?auto_2662728 ) ) ( not ( = ?auto_2662727 ?auto_2662729 ) ) ( not ( = ?auto_2662727 ?auto_2662730 ) ) ( not ( = ?auto_2662727 ?auto_2662731 ) ) ( not ( = ?auto_2662727 ?auto_2662736 ) ) ( not ( = ?auto_2662728 ?auto_2662729 ) ) ( not ( = ?auto_2662728 ?auto_2662730 ) ) ( not ( = ?auto_2662728 ?auto_2662731 ) ) ( not ( = ?auto_2662728 ?auto_2662736 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2662729 ?auto_2662730 ?auto_2662731 )
      ( MAKE-7CRATE-VERIFY ?auto_2662724 ?auto_2662725 ?auto_2662726 ?auto_2662727 ?auto_2662728 ?auto_2662729 ?auto_2662730 ?auto_2662731 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2665643 - SURFACE
      ?auto_2665644 - SURFACE
      ?auto_2665645 - SURFACE
      ?auto_2665646 - SURFACE
      ?auto_2665647 - SURFACE
      ?auto_2665648 - SURFACE
      ?auto_2665649 - SURFACE
      ?auto_2665650 - SURFACE
      ?auto_2665651 - SURFACE
    )
    :vars
    (
      ?auto_2665653 - HOIST
      ?auto_2665652 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2665653 ?auto_2665652 ) ( SURFACE-AT ?auto_2665650 ?auto_2665652 ) ( CLEAR ?auto_2665650 ) ( LIFTING ?auto_2665653 ?auto_2665651 ) ( IS-CRATE ?auto_2665651 ) ( not ( = ?auto_2665650 ?auto_2665651 ) ) ( ON ?auto_2665644 ?auto_2665643 ) ( ON ?auto_2665645 ?auto_2665644 ) ( ON ?auto_2665646 ?auto_2665645 ) ( ON ?auto_2665647 ?auto_2665646 ) ( ON ?auto_2665648 ?auto_2665647 ) ( ON ?auto_2665649 ?auto_2665648 ) ( ON ?auto_2665650 ?auto_2665649 ) ( not ( = ?auto_2665643 ?auto_2665644 ) ) ( not ( = ?auto_2665643 ?auto_2665645 ) ) ( not ( = ?auto_2665643 ?auto_2665646 ) ) ( not ( = ?auto_2665643 ?auto_2665647 ) ) ( not ( = ?auto_2665643 ?auto_2665648 ) ) ( not ( = ?auto_2665643 ?auto_2665649 ) ) ( not ( = ?auto_2665643 ?auto_2665650 ) ) ( not ( = ?auto_2665643 ?auto_2665651 ) ) ( not ( = ?auto_2665644 ?auto_2665645 ) ) ( not ( = ?auto_2665644 ?auto_2665646 ) ) ( not ( = ?auto_2665644 ?auto_2665647 ) ) ( not ( = ?auto_2665644 ?auto_2665648 ) ) ( not ( = ?auto_2665644 ?auto_2665649 ) ) ( not ( = ?auto_2665644 ?auto_2665650 ) ) ( not ( = ?auto_2665644 ?auto_2665651 ) ) ( not ( = ?auto_2665645 ?auto_2665646 ) ) ( not ( = ?auto_2665645 ?auto_2665647 ) ) ( not ( = ?auto_2665645 ?auto_2665648 ) ) ( not ( = ?auto_2665645 ?auto_2665649 ) ) ( not ( = ?auto_2665645 ?auto_2665650 ) ) ( not ( = ?auto_2665645 ?auto_2665651 ) ) ( not ( = ?auto_2665646 ?auto_2665647 ) ) ( not ( = ?auto_2665646 ?auto_2665648 ) ) ( not ( = ?auto_2665646 ?auto_2665649 ) ) ( not ( = ?auto_2665646 ?auto_2665650 ) ) ( not ( = ?auto_2665646 ?auto_2665651 ) ) ( not ( = ?auto_2665647 ?auto_2665648 ) ) ( not ( = ?auto_2665647 ?auto_2665649 ) ) ( not ( = ?auto_2665647 ?auto_2665650 ) ) ( not ( = ?auto_2665647 ?auto_2665651 ) ) ( not ( = ?auto_2665648 ?auto_2665649 ) ) ( not ( = ?auto_2665648 ?auto_2665650 ) ) ( not ( = ?auto_2665648 ?auto_2665651 ) ) ( not ( = ?auto_2665649 ?auto_2665650 ) ) ( not ( = ?auto_2665649 ?auto_2665651 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2665650 ?auto_2665651 )
      ( MAKE-8CRATE-VERIFY ?auto_2665643 ?auto_2665644 ?auto_2665645 ?auto_2665646 ?auto_2665647 ?auto_2665648 ?auto_2665649 ?auto_2665650 ?auto_2665651 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2665710 - SURFACE
      ?auto_2665711 - SURFACE
      ?auto_2665712 - SURFACE
      ?auto_2665713 - SURFACE
      ?auto_2665714 - SURFACE
      ?auto_2665715 - SURFACE
      ?auto_2665716 - SURFACE
      ?auto_2665717 - SURFACE
      ?auto_2665718 - SURFACE
    )
    :vars
    (
      ?auto_2665721 - HOIST
      ?auto_2665720 - PLACE
      ?auto_2665719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2665721 ?auto_2665720 ) ( SURFACE-AT ?auto_2665717 ?auto_2665720 ) ( CLEAR ?auto_2665717 ) ( IS-CRATE ?auto_2665718 ) ( not ( = ?auto_2665717 ?auto_2665718 ) ) ( TRUCK-AT ?auto_2665719 ?auto_2665720 ) ( AVAILABLE ?auto_2665721 ) ( IN ?auto_2665718 ?auto_2665719 ) ( ON ?auto_2665717 ?auto_2665716 ) ( not ( = ?auto_2665716 ?auto_2665717 ) ) ( not ( = ?auto_2665716 ?auto_2665718 ) ) ( ON ?auto_2665711 ?auto_2665710 ) ( ON ?auto_2665712 ?auto_2665711 ) ( ON ?auto_2665713 ?auto_2665712 ) ( ON ?auto_2665714 ?auto_2665713 ) ( ON ?auto_2665715 ?auto_2665714 ) ( ON ?auto_2665716 ?auto_2665715 ) ( not ( = ?auto_2665710 ?auto_2665711 ) ) ( not ( = ?auto_2665710 ?auto_2665712 ) ) ( not ( = ?auto_2665710 ?auto_2665713 ) ) ( not ( = ?auto_2665710 ?auto_2665714 ) ) ( not ( = ?auto_2665710 ?auto_2665715 ) ) ( not ( = ?auto_2665710 ?auto_2665716 ) ) ( not ( = ?auto_2665710 ?auto_2665717 ) ) ( not ( = ?auto_2665710 ?auto_2665718 ) ) ( not ( = ?auto_2665711 ?auto_2665712 ) ) ( not ( = ?auto_2665711 ?auto_2665713 ) ) ( not ( = ?auto_2665711 ?auto_2665714 ) ) ( not ( = ?auto_2665711 ?auto_2665715 ) ) ( not ( = ?auto_2665711 ?auto_2665716 ) ) ( not ( = ?auto_2665711 ?auto_2665717 ) ) ( not ( = ?auto_2665711 ?auto_2665718 ) ) ( not ( = ?auto_2665712 ?auto_2665713 ) ) ( not ( = ?auto_2665712 ?auto_2665714 ) ) ( not ( = ?auto_2665712 ?auto_2665715 ) ) ( not ( = ?auto_2665712 ?auto_2665716 ) ) ( not ( = ?auto_2665712 ?auto_2665717 ) ) ( not ( = ?auto_2665712 ?auto_2665718 ) ) ( not ( = ?auto_2665713 ?auto_2665714 ) ) ( not ( = ?auto_2665713 ?auto_2665715 ) ) ( not ( = ?auto_2665713 ?auto_2665716 ) ) ( not ( = ?auto_2665713 ?auto_2665717 ) ) ( not ( = ?auto_2665713 ?auto_2665718 ) ) ( not ( = ?auto_2665714 ?auto_2665715 ) ) ( not ( = ?auto_2665714 ?auto_2665716 ) ) ( not ( = ?auto_2665714 ?auto_2665717 ) ) ( not ( = ?auto_2665714 ?auto_2665718 ) ) ( not ( = ?auto_2665715 ?auto_2665716 ) ) ( not ( = ?auto_2665715 ?auto_2665717 ) ) ( not ( = ?auto_2665715 ?auto_2665718 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2665716 ?auto_2665717 ?auto_2665718 )
      ( MAKE-8CRATE-VERIFY ?auto_2665710 ?auto_2665711 ?auto_2665712 ?auto_2665713 ?auto_2665714 ?auto_2665715 ?auto_2665716 ?auto_2665717 ?auto_2665718 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2665786 - SURFACE
      ?auto_2665787 - SURFACE
      ?auto_2665788 - SURFACE
      ?auto_2665789 - SURFACE
      ?auto_2665790 - SURFACE
      ?auto_2665791 - SURFACE
      ?auto_2665792 - SURFACE
      ?auto_2665793 - SURFACE
      ?auto_2665794 - SURFACE
    )
    :vars
    (
      ?auto_2665796 - HOIST
      ?auto_2665797 - PLACE
      ?auto_2665795 - TRUCK
      ?auto_2665798 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2665796 ?auto_2665797 ) ( SURFACE-AT ?auto_2665793 ?auto_2665797 ) ( CLEAR ?auto_2665793 ) ( IS-CRATE ?auto_2665794 ) ( not ( = ?auto_2665793 ?auto_2665794 ) ) ( AVAILABLE ?auto_2665796 ) ( IN ?auto_2665794 ?auto_2665795 ) ( ON ?auto_2665793 ?auto_2665792 ) ( not ( = ?auto_2665792 ?auto_2665793 ) ) ( not ( = ?auto_2665792 ?auto_2665794 ) ) ( TRUCK-AT ?auto_2665795 ?auto_2665798 ) ( not ( = ?auto_2665798 ?auto_2665797 ) ) ( ON ?auto_2665787 ?auto_2665786 ) ( ON ?auto_2665788 ?auto_2665787 ) ( ON ?auto_2665789 ?auto_2665788 ) ( ON ?auto_2665790 ?auto_2665789 ) ( ON ?auto_2665791 ?auto_2665790 ) ( ON ?auto_2665792 ?auto_2665791 ) ( not ( = ?auto_2665786 ?auto_2665787 ) ) ( not ( = ?auto_2665786 ?auto_2665788 ) ) ( not ( = ?auto_2665786 ?auto_2665789 ) ) ( not ( = ?auto_2665786 ?auto_2665790 ) ) ( not ( = ?auto_2665786 ?auto_2665791 ) ) ( not ( = ?auto_2665786 ?auto_2665792 ) ) ( not ( = ?auto_2665786 ?auto_2665793 ) ) ( not ( = ?auto_2665786 ?auto_2665794 ) ) ( not ( = ?auto_2665787 ?auto_2665788 ) ) ( not ( = ?auto_2665787 ?auto_2665789 ) ) ( not ( = ?auto_2665787 ?auto_2665790 ) ) ( not ( = ?auto_2665787 ?auto_2665791 ) ) ( not ( = ?auto_2665787 ?auto_2665792 ) ) ( not ( = ?auto_2665787 ?auto_2665793 ) ) ( not ( = ?auto_2665787 ?auto_2665794 ) ) ( not ( = ?auto_2665788 ?auto_2665789 ) ) ( not ( = ?auto_2665788 ?auto_2665790 ) ) ( not ( = ?auto_2665788 ?auto_2665791 ) ) ( not ( = ?auto_2665788 ?auto_2665792 ) ) ( not ( = ?auto_2665788 ?auto_2665793 ) ) ( not ( = ?auto_2665788 ?auto_2665794 ) ) ( not ( = ?auto_2665789 ?auto_2665790 ) ) ( not ( = ?auto_2665789 ?auto_2665791 ) ) ( not ( = ?auto_2665789 ?auto_2665792 ) ) ( not ( = ?auto_2665789 ?auto_2665793 ) ) ( not ( = ?auto_2665789 ?auto_2665794 ) ) ( not ( = ?auto_2665790 ?auto_2665791 ) ) ( not ( = ?auto_2665790 ?auto_2665792 ) ) ( not ( = ?auto_2665790 ?auto_2665793 ) ) ( not ( = ?auto_2665790 ?auto_2665794 ) ) ( not ( = ?auto_2665791 ?auto_2665792 ) ) ( not ( = ?auto_2665791 ?auto_2665793 ) ) ( not ( = ?auto_2665791 ?auto_2665794 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2665792 ?auto_2665793 ?auto_2665794 )
      ( MAKE-8CRATE-VERIFY ?auto_2665786 ?auto_2665787 ?auto_2665788 ?auto_2665789 ?auto_2665790 ?auto_2665791 ?auto_2665792 ?auto_2665793 ?auto_2665794 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2665870 - SURFACE
      ?auto_2665871 - SURFACE
      ?auto_2665872 - SURFACE
      ?auto_2665873 - SURFACE
      ?auto_2665874 - SURFACE
      ?auto_2665875 - SURFACE
      ?auto_2665876 - SURFACE
      ?auto_2665877 - SURFACE
      ?auto_2665878 - SURFACE
    )
    :vars
    (
      ?auto_2665879 - HOIST
      ?auto_2665880 - PLACE
      ?auto_2665881 - TRUCK
      ?auto_2665883 - PLACE
      ?auto_2665882 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2665879 ?auto_2665880 ) ( SURFACE-AT ?auto_2665877 ?auto_2665880 ) ( CLEAR ?auto_2665877 ) ( IS-CRATE ?auto_2665878 ) ( not ( = ?auto_2665877 ?auto_2665878 ) ) ( AVAILABLE ?auto_2665879 ) ( ON ?auto_2665877 ?auto_2665876 ) ( not ( = ?auto_2665876 ?auto_2665877 ) ) ( not ( = ?auto_2665876 ?auto_2665878 ) ) ( TRUCK-AT ?auto_2665881 ?auto_2665883 ) ( not ( = ?auto_2665883 ?auto_2665880 ) ) ( HOIST-AT ?auto_2665882 ?auto_2665883 ) ( LIFTING ?auto_2665882 ?auto_2665878 ) ( not ( = ?auto_2665879 ?auto_2665882 ) ) ( ON ?auto_2665871 ?auto_2665870 ) ( ON ?auto_2665872 ?auto_2665871 ) ( ON ?auto_2665873 ?auto_2665872 ) ( ON ?auto_2665874 ?auto_2665873 ) ( ON ?auto_2665875 ?auto_2665874 ) ( ON ?auto_2665876 ?auto_2665875 ) ( not ( = ?auto_2665870 ?auto_2665871 ) ) ( not ( = ?auto_2665870 ?auto_2665872 ) ) ( not ( = ?auto_2665870 ?auto_2665873 ) ) ( not ( = ?auto_2665870 ?auto_2665874 ) ) ( not ( = ?auto_2665870 ?auto_2665875 ) ) ( not ( = ?auto_2665870 ?auto_2665876 ) ) ( not ( = ?auto_2665870 ?auto_2665877 ) ) ( not ( = ?auto_2665870 ?auto_2665878 ) ) ( not ( = ?auto_2665871 ?auto_2665872 ) ) ( not ( = ?auto_2665871 ?auto_2665873 ) ) ( not ( = ?auto_2665871 ?auto_2665874 ) ) ( not ( = ?auto_2665871 ?auto_2665875 ) ) ( not ( = ?auto_2665871 ?auto_2665876 ) ) ( not ( = ?auto_2665871 ?auto_2665877 ) ) ( not ( = ?auto_2665871 ?auto_2665878 ) ) ( not ( = ?auto_2665872 ?auto_2665873 ) ) ( not ( = ?auto_2665872 ?auto_2665874 ) ) ( not ( = ?auto_2665872 ?auto_2665875 ) ) ( not ( = ?auto_2665872 ?auto_2665876 ) ) ( not ( = ?auto_2665872 ?auto_2665877 ) ) ( not ( = ?auto_2665872 ?auto_2665878 ) ) ( not ( = ?auto_2665873 ?auto_2665874 ) ) ( not ( = ?auto_2665873 ?auto_2665875 ) ) ( not ( = ?auto_2665873 ?auto_2665876 ) ) ( not ( = ?auto_2665873 ?auto_2665877 ) ) ( not ( = ?auto_2665873 ?auto_2665878 ) ) ( not ( = ?auto_2665874 ?auto_2665875 ) ) ( not ( = ?auto_2665874 ?auto_2665876 ) ) ( not ( = ?auto_2665874 ?auto_2665877 ) ) ( not ( = ?auto_2665874 ?auto_2665878 ) ) ( not ( = ?auto_2665875 ?auto_2665876 ) ) ( not ( = ?auto_2665875 ?auto_2665877 ) ) ( not ( = ?auto_2665875 ?auto_2665878 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2665876 ?auto_2665877 ?auto_2665878 )
      ( MAKE-8CRATE-VERIFY ?auto_2665870 ?auto_2665871 ?auto_2665872 ?auto_2665873 ?auto_2665874 ?auto_2665875 ?auto_2665876 ?auto_2665877 ?auto_2665878 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2665962 - SURFACE
      ?auto_2665963 - SURFACE
      ?auto_2665964 - SURFACE
      ?auto_2665965 - SURFACE
      ?auto_2665966 - SURFACE
      ?auto_2665967 - SURFACE
      ?auto_2665968 - SURFACE
      ?auto_2665969 - SURFACE
      ?auto_2665970 - SURFACE
    )
    :vars
    (
      ?auto_2665974 - HOIST
      ?auto_2665972 - PLACE
      ?auto_2665975 - TRUCK
      ?auto_2665971 - PLACE
      ?auto_2665976 - HOIST
      ?auto_2665973 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2665974 ?auto_2665972 ) ( SURFACE-AT ?auto_2665969 ?auto_2665972 ) ( CLEAR ?auto_2665969 ) ( IS-CRATE ?auto_2665970 ) ( not ( = ?auto_2665969 ?auto_2665970 ) ) ( AVAILABLE ?auto_2665974 ) ( ON ?auto_2665969 ?auto_2665968 ) ( not ( = ?auto_2665968 ?auto_2665969 ) ) ( not ( = ?auto_2665968 ?auto_2665970 ) ) ( TRUCK-AT ?auto_2665975 ?auto_2665971 ) ( not ( = ?auto_2665971 ?auto_2665972 ) ) ( HOIST-AT ?auto_2665976 ?auto_2665971 ) ( not ( = ?auto_2665974 ?auto_2665976 ) ) ( AVAILABLE ?auto_2665976 ) ( SURFACE-AT ?auto_2665970 ?auto_2665971 ) ( ON ?auto_2665970 ?auto_2665973 ) ( CLEAR ?auto_2665970 ) ( not ( = ?auto_2665969 ?auto_2665973 ) ) ( not ( = ?auto_2665970 ?auto_2665973 ) ) ( not ( = ?auto_2665968 ?auto_2665973 ) ) ( ON ?auto_2665963 ?auto_2665962 ) ( ON ?auto_2665964 ?auto_2665963 ) ( ON ?auto_2665965 ?auto_2665964 ) ( ON ?auto_2665966 ?auto_2665965 ) ( ON ?auto_2665967 ?auto_2665966 ) ( ON ?auto_2665968 ?auto_2665967 ) ( not ( = ?auto_2665962 ?auto_2665963 ) ) ( not ( = ?auto_2665962 ?auto_2665964 ) ) ( not ( = ?auto_2665962 ?auto_2665965 ) ) ( not ( = ?auto_2665962 ?auto_2665966 ) ) ( not ( = ?auto_2665962 ?auto_2665967 ) ) ( not ( = ?auto_2665962 ?auto_2665968 ) ) ( not ( = ?auto_2665962 ?auto_2665969 ) ) ( not ( = ?auto_2665962 ?auto_2665970 ) ) ( not ( = ?auto_2665962 ?auto_2665973 ) ) ( not ( = ?auto_2665963 ?auto_2665964 ) ) ( not ( = ?auto_2665963 ?auto_2665965 ) ) ( not ( = ?auto_2665963 ?auto_2665966 ) ) ( not ( = ?auto_2665963 ?auto_2665967 ) ) ( not ( = ?auto_2665963 ?auto_2665968 ) ) ( not ( = ?auto_2665963 ?auto_2665969 ) ) ( not ( = ?auto_2665963 ?auto_2665970 ) ) ( not ( = ?auto_2665963 ?auto_2665973 ) ) ( not ( = ?auto_2665964 ?auto_2665965 ) ) ( not ( = ?auto_2665964 ?auto_2665966 ) ) ( not ( = ?auto_2665964 ?auto_2665967 ) ) ( not ( = ?auto_2665964 ?auto_2665968 ) ) ( not ( = ?auto_2665964 ?auto_2665969 ) ) ( not ( = ?auto_2665964 ?auto_2665970 ) ) ( not ( = ?auto_2665964 ?auto_2665973 ) ) ( not ( = ?auto_2665965 ?auto_2665966 ) ) ( not ( = ?auto_2665965 ?auto_2665967 ) ) ( not ( = ?auto_2665965 ?auto_2665968 ) ) ( not ( = ?auto_2665965 ?auto_2665969 ) ) ( not ( = ?auto_2665965 ?auto_2665970 ) ) ( not ( = ?auto_2665965 ?auto_2665973 ) ) ( not ( = ?auto_2665966 ?auto_2665967 ) ) ( not ( = ?auto_2665966 ?auto_2665968 ) ) ( not ( = ?auto_2665966 ?auto_2665969 ) ) ( not ( = ?auto_2665966 ?auto_2665970 ) ) ( not ( = ?auto_2665966 ?auto_2665973 ) ) ( not ( = ?auto_2665967 ?auto_2665968 ) ) ( not ( = ?auto_2665967 ?auto_2665969 ) ) ( not ( = ?auto_2665967 ?auto_2665970 ) ) ( not ( = ?auto_2665967 ?auto_2665973 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2665968 ?auto_2665969 ?auto_2665970 )
      ( MAKE-8CRATE-VERIFY ?auto_2665962 ?auto_2665963 ?auto_2665964 ?auto_2665965 ?auto_2665966 ?auto_2665967 ?auto_2665968 ?auto_2665969 ?auto_2665970 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2666055 - SURFACE
      ?auto_2666056 - SURFACE
      ?auto_2666057 - SURFACE
      ?auto_2666058 - SURFACE
      ?auto_2666059 - SURFACE
      ?auto_2666060 - SURFACE
      ?auto_2666061 - SURFACE
      ?auto_2666062 - SURFACE
      ?auto_2666063 - SURFACE
    )
    :vars
    (
      ?auto_2666065 - HOIST
      ?auto_2666064 - PLACE
      ?auto_2666069 - PLACE
      ?auto_2666066 - HOIST
      ?auto_2666068 - SURFACE
      ?auto_2666067 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2666065 ?auto_2666064 ) ( SURFACE-AT ?auto_2666062 ?auto_2666064 ) ( CLEAR ?auto_2666062 ) ( IS-CRATE ?auto_2666063 ) ( not ( = ?auto_2666062 ?auto_2666063 ) ) ( AVAILABLE ?auto_2666065 ) ( ON ?auto_2666062 ?auto_2666061 ) ( not ( = ?auto_2666061 ?auto_2666062 ) ) ( not ( = ?auto_2666061 ?auto_2666063 ) ) ( not ( = ?auto_2666069 ?auto_2666064 ) ) ( HOIST-AT ?auto_2666066 ?auto_2666069 ) ( not ( = ?auto_2666065 ?auto_2666066 ) ) ( AVAILABLE ?auto_2666066 ) ( SURFACE-AT ?auto_2666063 ?auto_2666069 ) ( ON ?auto_2666063 ?auto_2666068 ) ( CLEAR ?auto_2666063 ) ( not ( = ?auto_2666062 ?auto_2666068 ) ) ( not ( = ?auto_2666063 ?auto_2666068 ) ) ( not ( = ?auto_2666061 ?auto_2666068 ) ) ( TRUCK-AT ?auto_2666067 ?auto_2666064 ) ( ON ?auto_2666056 ?auto_2666055 ) ( ON ?auto_2666057 ?auto_2666056 ) ( ON ?auto_2666058 ?auto_2666057 ) ( ON ?auto_2666059 ?auto_2666058 ) ( ON ?auto_2666060 ?auto_2666059 ) ( ON ?auto_2666061 ?auto_2666060 ) ( not ( = ?auto_2666055 ?auto_2666056 ) ) ( not ( = ?auto_2666055 ?auto_2666057 ) ) ( not ( = ?auto_2666055 ?auto_2666058 ) ) ( not ( = ?auto_2666055 ?auto_2666059 ) ) ( not ( = ?auto_2666055 ?auto_2666060 ) ) ( not ( = ?auto_2666055 ?auto_2666061 ) ) ( not ( = ?auto_2666055 ?auto_2666062 ) ) ( not ( = ?auto_2666055 ?auto_2666063 ) ) ( not ( = ?auto_2666055 ?auto_2666068 ) ) ( not ( = ?auto_2666056 ?auto_2666057 ) ) ( not ( = ?auto_2666056 ?auto_2666058 ) ) ( not ( = ?auto_2666056 ?auto_2666059 ) ) ( not ( = ?auto_2666056 ?auto_2666060 ) ) ( not ( = ?auto_2666056 ?auto_2666061 ) ) ( not ( = ?auto_2666056 ?auto_2666062 ) ) ( not ( = ?auto_2666056 ?auto_2666063 ) ) ( not ( = ?auto_2666056 ?auto_2666068 ) ) ( not ( = ?auto_2666057 ?auto_2666058 ) ) ( not ( = ?auto_2666057 ?auto_2666059 ) ) ( not ( = ?auto_2666057 ?auto_2666060 ) ) ( not ( = ?auto_2666057 ?auto_2666061 ) ) ( not ( = ?auto_2666057 ?auto_2666062 ) ) ( not ( = ?auto_2666057 ?auto_2666063 ) ) ( not ( = ?auto_2666057 ?auto_2666068 ) ) ( not ( = ?auto_2666058 ?auto_2666059 ) ) ( not ( = ?auto_2666058 ?auto_2666060 ) ) ( not ( = ?auto_2666058 ?auto_2666061 ) ) ( not ( = ?auto_2666058 ?auto_2666062 ) ) ( not ( = ?auto_2666058 ?auto_2666063 ) ) ( not ( = ?auto_2666058 ?auto_2666068 ) ) ( not ( = ?auto_2666059 ?auto_2666060 ) ) ( not ( = ?auto_2666059 ?auto_2666061 ) ) ( not ( = ?auto_2666059 ?auto_2666062 ) ) ( not ( = ?auto_2666059 ?auto_2666063 ) ) ( not ( = ?auto_2666059 ?auto_2666068 ) ) ( not ( = ?auto_2666060 ?auto_2666061 ) ) ( not ( = ?auto_2666060 ?auto_2666062 ) ) ( not ( = ?auto_2666060 ?auto_2666063 ) ) ( not ( = ?auto_2666060 ?auto_2666068 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2666061 ?auto_2666062 ?auto_2666063 )
      ( MAKE-8CRATE-VERIFY ?auto_2666055 ?auto_2666056 ?auto_2666057 ?auto_2666058 ?auto_2666059 ?auto_2666060 ?auto_2666061 ?auto_2666062 ?auto_2666063 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2666148 - SURFACE
      ?auto_2666149 - SURFACE
      ?auto_2666150 - SURFACE
      ?auto_2666151 - SURFACE
      ?auto_2666152 - SURFACE
      ?auto_2666153 - SURFACE
      ?auto_2666154 - SURFACE
      ?auto_2666155 - SURFACE
      ?auto_2666156 - SURFACE
    )
    :vars
    (
      ?auto_2666157 - HOIST
      ?auto_2666161 - PLACE
      ?auto_2666159 - PLACE
      ?auto_2666162 - HOIST
      ?auto_2666158 - SURFACE
      ?auto_2666160 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2666157 ?auto_2666161 ) ( IS-CRATE ?auto_2666156 ) ( not ( = ?auto_2666155 ?auto_2666156 ) ) ( not ( = ?auto_2666154 ?auto_2666155 ) ) ( not ( = ?auto_2666154 ?auto_2666156 ) ) ( not ( = ?auto_2666159 ?auto_2666161 ) ) ( HOIST-AT ?auto_2666162 ?auto_2666159 ) ( not ( = ?auto_2666157 ?auto_2666162 ) ) ( AVAILABLE ?auto_2666162 ) ( SURFACE-AT ?auto_2666156 ?auto_2666159 ) ( ON ?auto_2666156 ?auto_2666158 ) ( CLEAR ?auto_2666156 ) ( not ( = ?auto_2666155 ?auto_2666158 ) ) ( not ( = ?auto_2666156 ?auto_2666158 ) ) ( not ( = ?auto_2666154 ?auto_2666158 ) ) ( TRUCK-AT ?auto_2666160 ?auto_2666161 ) ( SURFACE-AT ?auto_2666154 ?auto_2666161 ) ( CLEAR ?auto_2666154 ) ( LIFTING ?auto_2666157 ?auto_2666155 ) ( IS-CRATE ?auto_2666155 ) ( ON ?auto_2666149 ?auto_2666148 ) ( ON ?auto_2666150 ?auto_2666149 ) ( ON ?auto_2666151 ?auto_2666150 ) ( ON ?auto_2666152 ?auto_2666151 ) ( ON ?auto_2666153 ?auto_2666152 ) ( ON ?auto_2666154 ?auto_2666153 ) ( not ( = ?auto_2666148 ?auto_2666149 ) ) ( not ( = ?auto_2666148 ?auto_2666150 ) ) ( not ( = ?auto_2666148 ?auto_2666151 ) ) ( not ( = ?auto_2666148 ?auto_2666152 ) ) ( not ( = ?auto_2666148 ?auto_2666153 ) ) ( not ( = ?auto_2666148 ?auto_2666154 ) ) ( not ( = ?auto_2666148 ?auto_2666155 ) ) ( not ( = ?auto_2666148 ?auto_2666156 ) ) ( not ( = ?auto_2666148 ?auto_2666158 ) ) ( not ( = ?auto_2666149 ?auto_2666150 ) ) ( not ( = ?auto_2666149 ?auto_2666151 ) ) ( not ( = ?auto_2666149 ?auto_2666152 ) ) ( not ( = ?auto_2666149 ?auto_2666153 ) ) ( not ( = ?auto_2666149 ?auto_2666154 ) ) ( not ( = ?auto_2666149 ?auto_2666155 ) ) ( not ( = ?auto_2666149 ?auto_2666156 ) ) ( not ( = ?auto_2666149 ?auto_2666158 ) ) ( not ( = ?auto_2666150 ?auto_2666151 ) ) ( not ( = ?auto_2666150 ?auto_2666152 ) ) ( not ( = ?auto_2666150 ?auto_2666153 ) ) ( not ( = ?auto_2666150 ?auto_2666154 ) ) ( not ( = ?auto_2666150 ?auto_2666155 ) ) ( not ( = ?auto_2666150 ?auto_2666156 ) ) ( not ( = ?auto_2666150 ?auto_2666158 ) ) ( not ( = ?auto_2666151 ?auto_2666152 ) ) ( not ( = ?auto_2666151 ?auto_2666153 ) ) ( not ( = ?auto_2666151 ?auto_2666154 ) ) ( not ( = ?auto_2666151 ?auto_2666155 ) ) ( not ( = ?auto_2666151 ?auto_2666156 ) ) ( not ( = ?auto_2666151 ?auto_2666158 ) ) ( not ( = ?auto_2666152 ?auto_2666153 ) ) ( not ( = ?auto_2666152 ?auto_2666154 ) ) ( not ( = ?auto_2666152 ?auto_2666155 ) ) ( not ( = ?auto_2666152 ?auto_2666156 ) ) ( not ( = ?auto_2666152 ?auto_2666158 ) ) ( not ( = ?auto_2666153 ?auto_2666154 ) ) ( not ( = ?auto_2666153 ?auto_2666155 ) ) ( not ( = ?auto_2666153 ?auto_2666156 ) ) ( not ( = ?auto_2666153 ?auto_2666158 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2666154 ?auto_2666155 ?auto_2666156 )
      ( MAKE-8CRATE-VERIFY ?auto_2666148 ?auto_2666149 ?auto_2666150 ?auto_2666151 ?auto_2666152 ?auto_2666153 ?auto_2666154 ?auto_2666155 ?auto_2666156 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2666241 - SURFACE
      ?auto_2666242 - SURFACE
      ?auto_2666243 - SURFACE
      ?auto_2666244 - SURFACE
      ?auto_2666245 - SURFACE
      ?auto_2666246 - SURFACE
      ?auto_2666247 - SURFACE
      ?auto_2666248 - SURFACE
      ?auto_2666249 - SURFACE
    )
    :vars
    (
      ?auto_2666255 - HOIST
      ?auto_2666254 - PLACE
      ?auto_2666250 - PLACE
      ?auto_2666253 - HOIST
      ?auto_2666252 - SURFACE
      ?auto_2666251 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2666255 ?auto_2666254 ) ( IS-CRATE ?auto_2666249 ) ( not ( = ?auto_2666248 ?auto_2666249 ) ) ( not ( = ?auto_2666247 ?auto_2666248 ) ) ( not ( = ?auto_2666247 ?auto_2666249 ) ) ( not ( = ?auto_2666250 ?auto_2666254 ) ) ( HOIST-AT ?auto_2666253 ?auto_2666250 ) ( not ( = ?auto_2666255 ?auto_2666253 ) ) ( AVAILABLE ?auto_2666253 ) ( SURFACE-AT ?auto_2666249 ?auto_2666250 ) ( ON ?auto_2666249 ?auto_2666252 ) ( CLEAR ?auto_2666249 ) ( not ( = ?auto_2666248 ?auto_2666252 ) ) ( not ( = ?auto_2666249 ?auto_2666252 ) ) ( not ( = ?auto_2666247 ?auto_2666252 ) ) ( TRUCK-AT ?auto_2666251 ?auto_2666254 ) ( SURFACE-AT ?auto_2666247 ?auto_2666254 ) ( CLEAR ?auto_2666247 ) ( IS-CRATE ?auto_2666248 ) ( AVAILABLE ?auto_2666255 ) ( IN ?auto_2666248 ?auto_2666251 ) ( ON ?auto_2666242 ?auto_2666241 ) ( ON ?auto_2666243 ?auto_2666242 ) ( ON ?auto_2666244 ?auto_2666243 ) ( ON ?auto_2666245 ?auto_2666244 ) ( ON ?auto_2666246 ?auto_2666245 ) ( ON ?auto_2666247 ?auto_2666246 ) ( not ( = ?auto_2666241 ?auto_2666242 ) ) ( not ( = ?auto_2666241 ?auto_2666243 ) ) ( not ( = ?auto_2666241 ?auto_2666244 ) ) ( not ( = ?auto_2666241 ?auto_2666245 ) ) ( not ( = ?auto_2666241 ?auto_2666246 ) ) ( not ( = ?auto_2666241 ?auto_2666247 ) ) ( not ( = ?auto_2666241 ?auto_2666248 ) ) ( not ( = ?auto_2666241 ?auto_2666249 ) ) ( not ( = ?auto_2666241 ?auto_2666252 ) ) ( not ( = ?auto_2666242 ?auto_2666243 ) ) ( not ( = ?auto_2666242 ?auto_2666244 ) ) ( not ( = ?auto_2666242 ?auto_2666245 ) ) ( not ( = ?auto_2666242 ?auto_2666246 ) ) ( not ( = ?auto_2666242 ?auto_2666247 ) ) ( not ( = ?auto_2666242 ?auto_2666248 ) ) ( not ( = ?auto_2666242 ?auto_2666249 ) ) ( not ( = ?auto_2666242 ?auto_2666252 ) ) ( not ( = ?auto_2666243 ?auto_2666244 ) ) ( not ( = ?auto_2666243 ?auto_2666245 ) ) ( not ( = ?auto_2666243 ?auto_2666246 ) ) ( not ( = ?auto_2666243 ?auto_2666247 ) ) ( not ( = ?auto_2666243 ?auto_2666248 ) ) ( not ( = ?auto_2666243 ?auto_2666249 ) ) ( not ( = ?auto_2666243 ?auto_2666252 ) ) ( not ( = ?auto_2666244 ?auto_2666245 ) ) ( not ( = ?auto_2666244 ?auto_2666246 ) ) ( not ( = ?auto_2666244 ?auto_2666247 ) ) ( not ( = ?auto_2666244 ?auto_2666248 ) ) ( not ( = ?auto_2666244 ?auto_2666249 ) ) ( not ( = ?auto_2666244 ?auto_2666252 ) ) ( not ( = ?auto_2666245 ?auto_2666246 ) ) ( not ( = ?auto_2666245 ?auto_2666247 ) ) ( not ( = ?auto_2666245 ?auto_2666248 ) ) ( not ( = ?auto_2666245 ?auto_2666249 ) ) ( not ( = ?auto_2666245 ?auto_2666252 ) ) ( not ( = ?auto_2666246 ?auto_2666247 ) ) ( not ( = ?auto_2666246 ?auto_2666248 ) ) ( not ( = ?auto_2666246 ?auto_2666249 ) ) ( not ( = ?auto_2666246 ?auto_2666252 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2666247 ?auto_2666248 ?auto_2666249 )
      ( MAKE-8CRATE-VERIFY ?auto_2666241 ?auto_2666242 ?auto_2666243 ?auto_2666244 ?auto_2666245 ?auto_2666246 ?auto_2666247 ?auto_2666248 ?auto_2666249 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2669336 - SURFACE
      ?auto_2669337 - SURFACE
    )
    :vars
    (
      ?auto_2669342 - HOIST
      ?auto_2669338 - PLACE
      ?auto_2669340 - SURFACE
      ?auto_2669341 - TRUCK
      ?auto_2669343 - PLACE
      ?auto_2669339 - HOIST
      ?auto_2669344 - SURFACE
      ?auto_2669345 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2669342 ?auto_2669338 ) ( SURFACE-AT ?auto_2669336 ?auto_2669338 ) ( CLEAR ?auto_2669336 ) ( IS-CRATE ?auto_2669337 ) ( not ( = ?auto_2669336 ?auto_2669337 ) ) ( AVAILABLE ?auto_2669342 ) ( ON ?auto_2669336 ?auto_2669340 ) ( not ( = ?auto_2669340 ?auto_2669336 ) ) ( not ( = ?auto_2669340 ?auto_2669337 ) ) ( TRUCK-AT ?auto_2669341 ?auto_2669343 ) ( not ( = ?auto_2669343 ?auto_2669338 ) ) ( HOIST-AT ?auto_2669339 ?auto_2669343 ) ( not ( = ?auto_2669342 ?auto_2669339 ) ) ( SURFACE-AT ?auto_2669337 ?auto_2669343 ) ( ON ?auto_2669337 ?auto_2669344 ) ( CLEAR ?auto_2669337 ) ( not ( = ?auto_2669336 ?auto_2669344 ) ) ( not ( = ?auto_2669337 ?auto_2669344 ) ) ( not ( = ?auto_2669340 ?auto_2669344 ) ) ( LIFTING ?auto_2669339 ?auto_2669345 ) ( IS-CRATE ?auto_2669345 ) ( not ( = ?auto_2669336 ?auto_2669345 ) ) ( not ( = ?auto_2669337 ?auto_2669345 ) ) ( not ( = ?auto_2669340 ?auto_2669345 ) ) ( not ( = ?auto_2669344 ?auto_2669345 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2669339 ?auto_2669345 ?auto_2669341 ?auto_2669343 )
      ( MAKE-1CRATE ?auto_2669336 ?auto_2669337 )
      ( MAKE-1CRATE-VERIFY ?auto_2669336 ?auto_2669337 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2670348 - SURFACE
      ?auto_2670349 - SURFACE
      ?auto_2670350 - SURFACE
      ?auto_2670351 - SURFACE
      ?auto_2670352 - SURFACE
      ?auto_2670353 - SURFACE
      ?auto_2670354 - SURFACE
      ?auto_2670355 - SURFACE
      ?auto_2670356 - SURFACE
      ?auto_2670357 - SURFACE
    )
    :vars
    (
      ?auto_2670359 - HOIST
      ?auto_2670358 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2670359 ?auto_2670358 ) ( SURFACE-AT ?auto_2670356 ?auto_2670358 ) ( CLEAR ?auto_2670356 ) ( LIFTING ?auto_2670359 ?auto_2670357 ) ( IS-CRATE ?auto_2670357 ) ( not ( = ?auto_2670356 ?auto_2670357 ) ) ( ON ?auto_2670349 ?auto_2670348 ) ( ON ?auto_2670350 ?auto_2670349 ) ( ON ?auto_2670351 ?auto_2670350 ) ( ON ?auto_2670352 ?auto_2670351 ) ( ON ?auto_2670353 ?auto_2670352 ) ( ON ?auto_2670354 ?auto_2670353 ) ( ON ?auto_2670355 ?auto_2670354 ) ( ON ?auto_2670356 ?auto_2670355 ) ( not ( = ?auto_2670348 ?auto_2670349 ) ) ( not ( = ?auto_2670348 ?auto_2670350 ) ) ( not ( = ?auto_2670348 ?auto_2670351 ) ) ( not ( = ?auto_2670348 ?auto_2670352 ) ) ( not ( = ?auto_2670348 ?auto_2670353 ) ) ( not ( = ?auto_2670348 ?auto_2670354 ) ) ( not ( = ?auto_2670348 ?auto_2670355 ) ) ( not ( = ?auto_2670348 ?auto_2670356 ) ) ( not ( = ?auto_2670348 ?auto_2670357 ) ) ( not ( = ?auto_2670349 ?auto_2670350 ) ) ( not ( = ?auto_2670349 ?auto_2670351 ) ) ( not ( = ?auto_2670349 ?auto_2670352 ) ) ( not ( = ?auto_2670349 ?auto_2670353 ) ) ( not ( = ?auto_2670349 ?auto_2670354 ) ) ( not ( = ?auto_2670349 ?auto_2670355 ) ) ( not ( = ?auto_2670349 ?auto_2670356 ) ) ( not ( = ?auto_2670349 ?auto_2670357 ) ) ( not ( = ?auto_2670350 ?auto_2670351 ) ) ( not ( = ?auto_2670350 ?auto_2670352 ) ) ( not ( = ?auto_2670350 ?auto_2670353 ) ) ( not ( = ?auto_2670350 ?auto_2670354 ) ) ( not ( = ?auto_2670350 ?auto_2670355 ) ) ( not ( = ?auto_2670350 ?auto_2670356 ) ) ( not ( = ?auto_2670350 ?auto_2670357 ) ) ( not ( = ?auto_2670351 ?auto_2670352 ) ) ( not ( = ?auto_2670351 ?auto_2670353 ) ) ( not ( = ?auto_2670351 ?auto_2670354 ) ) ( not ( = ?auto_2670351 ?auto_2670355 ) ) ( not ( = ?auto_2670351 ?auto_2670356 ) ) ( not ( = ?auto_2670351 ?auto_2670357 ) ) ( not ( = ?auto_2670352 ?auto_2670353 ) ) ( not ( = ?auto_2670352 ?auto_2670354 ) ) ( not ( = ?auto_2670352 ?auto_2670355 ) ) ( not ( = ?auto_2670352 ?auto_2670356 ) ) ( not ( = ?auto_2670352 ?auto_2670357 ) ) ( not ( = ?auto_2670353 ?auto_2670354 ) ) ( not ( = ?auto_2670353 ?auto_2670355 ) ) ( not ( = ?auto_2670353 ?auto_2670356 ) ) ( not ( = ?auto_2670353 ?auto_2670357 ) ) ( not ( = ?auto_2670354 ?auto_2670355 ) ) ( not ( = ?auto_2670354 ?auto_2670356 ) ) ( not ( = ?auto_2670354 ?auto_2670357 ) ) ( not ( = ?auto_2670355 ?auto_2670356 ) ) ( not ( = ?auto_2670355 ?auto_2670357 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2670356 ?auto_2670357 )
      ( MAKE-9CRATE-VERIFY ?auto_2670348 ?auto_2670349 ?auto_2670350 ?auto_2670351 ?auto_2670352 ?auto_2670353 ?auto_2670354 ?auto_2670355 ?auto_2670356 ?auto_2670357 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2670428 - SURFACE
      ?auto_2670429 - SURFACE
      ?auto_2670430 - SURFACE
      ?auto_2670431 - SURFACE
      ?auto_2670432 - SURFACE
      ?auto_2670433 - SURFACE
      ?auto_2670434 - SURFACE
      ?auto_2670435 - SURFACE
      ?auto_2670436 - SURFACE
      ?auto_2670437 - SURFACE
    )
    :vars
    (
      ?auto_2670439 - HOIST
      ?auto_2670438 - PLACE
      ?auto_2670440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2670439 ?auto_2670438 ) ( SURFACE-AT ?auto_2670436 ?auto_2670438 ) ( CLEAR ?auto_2670436 ) ( IS-CRATE ?auto_2670437 ) ( not ( = ?auto_2670436 ?auto_2670437 ) ) ( TRUCK-AT ?auto_2670440 ?auto_2670438 ) ( AVAILABLE ?auto_2670439 ) ( IN ?auto_2670437 ?auto_2670440 ) ( ON ?auto_2670436 ?auto_2670435 ) ( not ( = ?auto_2670435 ?auto_2670436 ) ) ( not ( = ?auto_2670435 ?auto_2670437 ) ) ( ON ?auto_2670429 ?auto_2670428 ) ( ON ?auto_2670430 ?auto_2670429 ) ( ON ?auto_2670431 ?auto_2670430 ) ( ON ?auto_2670432 ?auto_2670431 ) ( ON ?auto_2670433 ?auto_2670432 ) ( ON ?auto_2670434 ?auto_2670433 ) ( ON ?auto_2670435 ?auto_2670434 ) ( not ( = ?auto_2670428 ?auto_2670429 ) ) ( not ( = ?auto_2670428 ?auto_2670430 ) ) ( not ( = ?auto_2670428 ?auto_2670431 ) ) ( not ( = ?auto_2670428 ?auto_2670432 ) ) ( not ( = ?auto_2670428 ?auto_2670433 ) ) ( not ( = ?auto_2670428 ?auto_2670434 ) ) ( not ( = ?auto_2670428 ?auto_2670435 ) ) ( not ( = ?auto_2670428 ?auto_2670436 ) ) ( not ( = ?auto_2670428 ?auto_2670437 ) ) ( not ( = ?auto_2670429 ?auto_2670430 ) ) ( not ( = ?auto_2670429 ?auto_2670431 ) ) ( not ( = ?auto_2670429 ?auto_2670432 ) ) ( not ( = ?auto_2670429 ?auto_2670433 ) ) ( not ( = ?auto_2670429 ?auto_2670434 ) ) ( not ( = ?auto_2670429 ?auto_2670435 ) ) ( not ( = ?auto_2670429 ?auto_2670436 ) ) ( not ( = ?auto_2670429 ?auto_2670437 ) ) ( not ( = ?auto_2670430 ?auto_2670431 ) ) ( not ( = ?auto_2670430 ?auto_2670432 ) ) ( not ( = ?auto_2670430 ?auto_2670433 ) ) ( not ( = ?auto_2670430 ?auto_2670434 ) ) ( not ( = ?auto_2670430 ?auto_2670435 ) ) ( not ( = ?auto_2670430 ?auto_2670436 ) ) ( not ( = ?auto_2670430 ?auto_2670437 ) ) ( not ( = ?auto_2670431 ?auto_2670432 ) ) ( not ( = ?auto_2670431 ?auto_2670433 ) ) ( not ( = ?auto_2670431 ?auto_2670434 ) ) ( not ( = ?auto_2670431 ?auto_2670435 ) ) ( not ( = ?auto_2670431 ?auto_2670436 ) ) ( not ( = ?auto_2670431 ?auto_2670437 ) ) ( not ( = ?auto_2670432 ?auto_2670433 ) ) ( not ( = ?auto_2670432 ?auto_2670434 ) ) ( not ( = ?auto_2670432 ?auto_2670435 ) ) ( not ( = ?auto_2670432 ?auto_2670436 ) ) ( not ( = ?auto_2670432 ?auto_2670437 ) ) ( not ( = ?auto_2670433 ?auto_2670434 ) ) ( not ( = ?auto_2670433 ?auto_2670435 ) ) ( not ( = ?auto_2670433 ?auto_2670436 ) ) ( not ( = ?auto_2670433 ?auto_2670437 ) ) ( not ( = ?auto_2670434 ?auto_2670435 ) ) ( not ( = ?auto_2670434 ?auto_2670436 ) ) ( not ( = ?auto_2670434 ?auto_2670437 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2670435 ?auto_2670436 ?auto_2670437 )
      ( MAKE-9CRATE-VERIFY ?auto_2670428 ?auto_2670429 ?auto_2670430 ?auto_2670431 ?auto_2670432 ?auto_2670433 ?auto_2670434 ?auto_2670435 ?auto_2670436 ?auto_2670437 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2670518 - SURFACE
      ?auto_2670519 - SURFACE
      ?auto_2670520 - SURFACE
      ?auto_2670521 - SURFACE
      ?auto_2670522 - SURFACE
      ?auto_2670523 - SURFACE
      ?auto_2670524 - SURFACE
      ?auto_2670525 - SURFACE
      ?auto_2670526 - SURFACE
      ?auto_2670527 - SURFACE
    )
    :vars
    (
      ?auto_2670530 - HOIST
      ?auto_2670531 - PLACE
      ?auto_2670528 - TRUCK
      ?auto_2670529 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2670530 ?auto_2670531 ) ( SURFACE-AT ?auto_2670526 ?auto_2670531 ) ( CLEAR ?auto_2670526 ) ( IS-CRATE ?auto_2670527 ) ( not ( = ?auto_2670526 ?auto_2670527 ) ) ( AVAILABLE ?auto_2670530 ) ( IN ?auto_2670527 ?auto_2670528 ) ( ON ?auto_2670526 ?auto_2670525 ) ( not ( = ?auto_2670525 ?auto_2670526 ) ) ( not ( = ?auto_2670525 ?auto_2670527 ) ) ( TRUCK-AT ?auto_2670528 ?auto_2670529 ) ( not ( = ?auto_2670529 ?auto_2670531 ) ) ( ON ?auto_2670519 ?auto_2670518 ) ( ON ?auto_2670520 ?auto_2670519 ) ( ON ?auto_2670521 ?auto_2670520 ) ( ON ?auto_2670522 ?auto_2670521 ) ( ON ?auto_2670523 ?auto_2670522 ) ( ON ?auto_2670524 ?auto_2670523 ) ( ON ?auto_2670525 ?auto_2670524 ) ( not ( = ?auto_2670518 ?auto_2670519 ) ) ( not ( = ?auto_2670518 ?auto_2670520 ) ) ( not ( = ?auto_2670518 ?auto_2670521 ) ) ( not ( = ?auto_2670518 ?auto_2670522 ) ) ( not ( = ?auto_2670518 ?auto_2670523 ) ) ( not ( = ?auto_2670518 ?auto_2670524 ) ) ( not ( = ?auto_2670518 ?auto_2670525 ) ) ( not ( = ?auto_2670518 ?auto_2670526 ) ) ( not ( = ?auto_2670518 ?auto_2670527 ) ) ( not ( = ?auto_2670519 ?auto_2670520 ) ) ( not ( = ?auto_2670519 ?auto_2670521 ) ) ( not ( = ?auto_2670519 ?auto_2670522 ) ) ( not ( = ?auto_2670519 ?auto_2670523 ) ) ( not ( = ?auto_2670519 ?auto_2670524 ) ) ( not ( = ?auto_2670519 ?auto_2670525 ) ) ( not ( = ?auto_2670519 ?auto_2670526 ) ) ( not ( = ?auto_2670519 ?auto_2670527 ) ) ( not ( = ?auto_2670520 ?auto_2670521 ) ) ( not ( = ?auto_2670520 ?auto_2670522 ) ) ( not ( = ?auto_2670520 ?auto_2670523 ) ) ( not ( = ?auto_2670520 ?auto_2670524 ) ) ( not ( = ?auto_2670520 ?auto_2670525 ) ) ( not ( = ?auto_2670520 ?auto_2670526 ) ) ( not ( = ?auto_2670520 ?auto_2670527 ) ) ( not ( = ?auto_2670521 ?auto_2670522 ) ) ( not ( = ?auto_2670521 ?auto_2670523 ) ) ( not ( = ?auto_2670521 ?auto_2670524 ) ) ( not ( = ?auto_2670521 ?auto_2670525 ) ) ( not ( = ?auto_2670521 ?auto_2670526 ) ) ( not ( = ?auto_2670521 ?auto_2670527 ) ) ( not ( = ?auto_2670522 ?auto_2670523 ) ) ( not ( = ?auto_2670522 ?auto_2670524 ) ) ( not ( = ?auto_2670522 ?auto_2670525 ) ) ( not ( = ?auto_2670522 ?auto_2670526 ) ) ( not ( = ?auto_2670522 ?auto_2670527 ) ) ( not ( = ?auto_2670523 ?auto_2670524 ) ) ( not ( = ?auto_2670523 ?auto_2670525 ) ) ( not ( = ?auto_2670523 ?auto_2670526 ) ) ( not ( = ?auto_2670523 ?auto_2670527 ) ) ( not ( = ?auto_2670524 ?auto_2670525 ) ) ( not ( = ?auto_2670524 ?auto_2670526 ) ) ( not ( = ?auto_2670524 ?auto_2670527 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2670525 ?auto_2670526 ?auto_2670527 )
      ( MAKE-9CRATE-VERIFY ?auto_2670518 ?auto_2670519 ?auto_2670520 ?auto_2670521 ?auto_2670522 ?auto_2670523 ?auto_2670524 ?auto_2670525 ?auto_2670526 ?auto_2670527 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2670617 - SURFACE
      ?auto_2670618 - SURFACE
      ?auto_2670619 - SURFACE
      ?auto_2670620 - SURFACE
      ?auto_2670621 - SURFACE
      ?auto_2670622 - SURFACE
      ?auto_2670623 - SURFACE
      ?auto_2670624 - SURFACE
      ?auto_2670625 - SURFACE
      ?auto_2670626 - SURFACE
    )
    :vars
    (
      ?auto_2670629 - HOIST
      ?auto_2670628 - PLACE
      ?auto_2670630 - TRUCK
      ?auto_2670631 - PLACE
      ?auto_2670627 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2670629 ?auto_2670628 ) ( SURFACE-AT ?auto_2670625 ?auto_2670628 ) ( CLEAR ?auto_2670625 ) ( IS-CRATE ?auto_2670626 ) ( not ( = ?auto_2670625 ?auto_2670626 ) ) ( AVAILABLE ?auto_2670629 ) ( ON ?auto_2670625 ?auto_2670624 ) ( not ( = ?auto_2670624 ?auto_2670625 ) ) ( not ( = ?auto_2670624 ?auto_2670626 ) ) ( TRUCK-AT ?auto_2670630 ?auto_2670631 ) ( not ( = ?auto_2670631 ?auto_2670628 ) ) ( HOIST-AT ?auto_2670627 ?auto_2670631 ) ( LIFTING ?auto_2670627 ?auto_2670626 ) ( not ( = ?auto_2670629 ?auto_2670627 ) ) ( ON ?auto_2670618 ?auto_2670617 ) ( ON ?auto_2670619 ?auto_2670618 ) ( ON ?auto_2670620 ?auto_2670619 ) ( ON ?auto_2670621 ?auto_2670620 ) ( ON ?auto_2670622 ?auto_2670621 ) ( ON ?auto_2670623 ?auto_2670622 ) ( ON ?auto_2670624 ?auto_2670623 ) ( not ( = ?auto_2670617 ?auto_2670618 ) ) ( not ( = ?auto_2670617 ?auto_2670619 ) ) ( not ( = ?auto_2670617 ?auto_2670620 ) ) ( not ( = ?auto_2670617 ?auto_2670621 ) ) ( not ( = ?auto_2670617 ?auto_2670622 ) ) ( not ( = ?auto_2670617 ?auto_2670623 ) ) ( not ( = ?auto_2670617 ?auto_2670624 ) ) ( not ( = ?auto_2670617 ?auto_2670625 ) ) ( not ( = ?auto_2670617 ?auto_2670626 ) ) ( not ( = ?auto_2670618 ?auto_2670619 ) ) ( not ( = ?auto_2670618 ?auto_2670620 ) ) ( not ( = ?auto_2670618 ?auto_2670621 ) ) ( not ( = ?auto_2670618 ?auto_2670622 ) ) ( not ( = ?auto_2670618 ?auto_2670623 ) ) ( not ( = ?auto_2670618 ?auto_2670624 ) ) ( not ( = ?auto_2670618 ?auto_2670625 ) ) ( not ( = ?auto_2670618 ?auto_2670626 ) ) ( not ( = ?auto_2670619 ?auto_2670620 ) ) ( not ( = ?auto_2670619 ?auto_2670621 ) ) ( not ( = ?auto_2670619 ?auto_2670622 ) ) ( not ( = ?auto_2670619 ?auto_2670623 ) ) ( not ( = ?auto_2670619 ?auto_2670624 ) ) ( not ( = ?auto_2670619 ?auto_2670625 ) ) ( not ( = ?auto_2670619 ?auto_2670626 ) ) ( not ( = ?auto_2670620 ?auto_2670621 ) ) ( not ( = ?auto_2670620 ?auto_2670622 ) ) ( not ( = ?auto_2670620 ?auto_2670623 ) ) ( not ( = ?auto_2670620 ?auto_2670624 ) ) ( not ( = ?auto_2670620 ?auto_2670625 ) ) ( not ( = ?auto_2670620 ?auto_2670626 ) ) ( not ( = ?auto_2670621 ?auto_2670622 ) ) ( not ( = ?auto_2670621 ?auto_2670623 ) ) ( not ( = ?auto_2670621 ?auto_2670624 ) ) ( not ( = ?auto_2670621 ?auto_2670625 ) ) ( not ( = ?auto_2670621 ?auto_2670626 ) ) ( not ( = ?auto_2670622 ?auto_2670623 ) ) ( not ( = ?auto_2670622 ?auto_2670624 ) ) ( not ( = ?auto_2670622 ?auto_2670625 ) ) ( not ( = ?auto_2670622 ?auto_2670626 ) ) ( not ( = ?auto_2670623 ?auto_2670624 ) ) ( not ( = ?auto_2670623 ?auto_2670625 ) ) ( not ( = ?auto_2670623 ?auto_2670626 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2670624 ?auto_2670625 ?auto_2670626 )
      ( MAKE-9CRATE-VERIFY ?auto_2670617 ?auto_2670618 ?auto_2670619 ?auto_2670620 ?auto_2670621 ?auto_2670622 ?auto_2670623 ?auto_2670624 ?auto_2670625 ?auto_2670626 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2670725 - SURFACE
      ?auto_2670726 - SURFACE
      ?auto_2670727 - SURFACE
      ?auto_2670728 - SURFACE
      ?auto_2670729 - SURFACE
      ?auto_2670730 - SURFACE
      ?auto_2670731 - SURFACE
      ?auto_2670732 - SURFACE
      ?auto_2670733 - SURFACE
      ?auto_2670734 - SURFACE
    )
    :vars
    (
      ?auto_2670740 - HOIST
      ?auto_2670736 - PLACE
      ?auto_2670739 - TRUCK
      ?auto_2670737 - PLACE
      ?auto_2670738 - HOIST
      ?auto_2670735 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2670740 ?auto_2670736 ) ( SURFACE-AT ?auto_2670733 ?auto_2670736 ) ( CLEAR ?auto_2670733 ) ( IS-CRATE ?auto_2670734 ) ( not ( = ?auto_2670733 ?auto_2670734 ) ) ( AVAILABLE ?auto_2670740 ) ( ON ?auto_2670733 ?auto_2670732 ) ( not ( = ?auto_2670732 ?auto_2670733 ) ) ( not ( = ?auto_2670732 ?auto_2670734 ) ) ( TRUCK-AT ?auto_2670739 ?auto_2670737 ) ( not ( = ?auto_2670737 ?auto_2670736 ) ) ( HOIST-AT ?auto_2670738 ?auto_2670737 ) ( not ( = ?auto_2670740 ?auto_2670738 ) ) ( AVAILABLE ?auto_2670738 ) ( SURFACE-AT ?auto_2670734 ?auto_2670737 ) ( ON ?auto_2670734 ?auto_2670735 ) ( CLEAR ?auto_2670734 ) ( not ( = ?auto_2670733 ?auto_2670735 ) ) ( not ( = ?auto_2670734 ?auto_2670735 ) ) ( not ( = ?auto_2670732 ?auto_2670735 ) ) ( ON ?auto_2670726 ?auto_2670725 ) ( ON ?auto_2670727 ?auto_2670726 ) ( ON ?auto_2670728 ?auto_2670727 ) ( ON ?auto_2670729 ?auto_2670728 ) ( ON ?auto_2670730 ?auto_2670729 ) ( ON ?auto_2670731 ?auto_2670730 ) ( ON ?auto_2670732 ?auto_2670731 ) ( not ( = ?auto_2670725 ?auto_2670726 ) ) ( not ( = ?auto_2670725 ?auto_2670727 ) ) ( not ( = ?auto_2670725 ?auto_2670728 ) ) ( not ( = ?auto_2670725 ?auto_2670729 ) ) ( not ( = ?auto_2670725 ?auto_2670730 ) ) ( not ( = ?auto_2670725 ?auto_2670731 ) ) ( not ( = ?auto_2670725 ?auto_2670732 ) ) ( not ( = ?auto_2670725 ?auto_2670733 ) ) ( not ( = ?auto_2670725 ?auto_2670734 ) ) ( not ( = ?auto_2670725 ?auto_2670735 ) ) ( not ( = ?auto_2670726 ?auto_2670727 ) ) ( not ( = ?auto_2670726 ?auto_2670728 ) ) ( not ( = ?auto_2670726 ?auto_2670729 ) ) ( not ( = ?auto_2670726 ?auto_2670730 ) ) ( not ( = ?auto_2670726 ?auto_2670731 ) ) ( not ( = ?auto_2670726 ?auto_2670732 ) ) ( not ( = ?auto_2670726 ?auto_2670733 ) ) ( not ( = ?auto_2670726 ?auto_2670734 ) ) ( not ( = ?auto_2670726 ?auto_2670735 ) ) ( not ( = ?auto_2670727 ?auto_2670728 ) ) ( not ( = ?auto_2670727 ?auto_2670729 ) ) ( not ( = ?auto_2670727 ?auto_2670730 ) ) ( not ( = ?auto_2670727 ?auto_2670731 ) ) ( not ( = ?auto_2670727 ?auto_2670732 ) ) ( not ( = ?auto_2670727 ?auto_2670733 ) ) ( not ( = ?auto_2670727 ?auto_2670734 ) ) ( not ( = ?auto_2670727 ?auto_2670735 ) ) ( not ( = ?auto_2670728 ?auto_2670729 ) ) ( not ( = ?auto_2670728 ?auto_2670730 ) ) ( not ( = ?auto_2670728 ?auto_2670731 ) ) ( not ( = ?auto_2670728 ?auto_2670732 ) ) ( not ( = ?auto_2670728 ?auto_2670733 ) ) ( not ( = ?auto_2670728 ?auto_2670734 ) ) ( not ( = ?auto_2670728 ?auto_2670735 ) ) ( not ( = ?auto_2670729 ?auto_2670730 ) ) ( not ( = ?auto_2670729 ?auto_2670731 ) ) ( not ( = ?auto_2670729 ?auto_2670732 ) ) ( not ( = ?auto_2670729 ?auto_2670733 ) ) ( not ( = ?auto_2670729 ?auto_2670734 ) ) ( not ( = ?auto_2670729 ?auto_2670735 ) ) ( not ( = ?auto_2670730 ?auto_2670731 ) ) ( not ( = ?auto_2670730 ?auto_2670732 ) ) ( not ( = ?auto_2670730 ?auto_2670733 ) ) ( not ( = ?auto_2670730 ?auto_2670734 ) ) ( not ( = ?auto_2670730 ?auto_2670735 ) ) ( not ( = ?auto_2670731 ?auto_2670732 ) ) ( not ( = ?auto_2670731 ?auto_2670733 ) ) ( not ( = ?auto_2670731 ?auto_2670734 ) ) ( not ( = ?auto_2670731 ?auto_2670735 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2670732 ?auto_2670733 ?auto_2670734 )
      ( MAKE-9CRATE-VERIFY ?auto_2670725 ?auto_2670726 ?auto_2670727 ?auto_2670728 ?auto_2670729 ?auto_2670730 ?auto_2670731 ?auto_2670732 ?auto_2670733 ?auto_2670734 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2670834 - SURFACE
      ?auto_2670835 - SURFACE
      ?auto_2670836 - SURFACE
      ?auto_2670837 - SURFACE
      ?auto_2670838 - SURFACE
      ?auto_2670839 - SURFACE
      ?auto_2670840 - SURFACE
      ?auto_2670841 - SURFACE
      ?auto_2670842 - SURFACE
      ?auto_2670843 - SURFACE
    )
    :vars
    (
      ?auto_2670844 - HOIST
      ?auto_2670846 - PLACE
      ?auto_2670845 - PLACE
      ?auto_2670849 - HOIST
      ?auto_2670847 - SURFACE
      ?auto_2670848 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2670844 ?auto_2670846 ) ( SURFACE-AT ?auto_2670842 ?auto_2670846 ) ( CLEAR ?auto_2670842 ) ( IS-CRATE ?auto_2670843 ) ( not ( = ?auto_2670842 ?auto_2670843 ) ) ( AVAILABLE ?auto_2670844 ) ( ON ?auto_2670842 ?auto_2670841 ) ( not ( = ?auto_2670841 ?auto_2670842 ) ) ( not ( = ?auto_2670841 ?auto_2670843 ) ) ( not ( = ?auto_2670845 ?auto_2670846 ) ) ( HOIST-AT ?auto_2670849 ?auto_2670845 ) ( not ( = ?auto_2670844 ?auto_2670849 ) ) ( AVAILABLE ?auto_2670849 ) ( SURFACE-AT ?auto_2670843 ?auto_2670845 ) ( ON ?auto_2670843 ?auto_2670847 ) ( CLEAR ?auto_2670843 ) ( not ( = ?auto_2670842 ?auto_2670847 ) ) ( not ( = ?auto_2670843 ?auto_2670847 ) ) ( not ( = ?auto_2670841 ?auto_2670847 ) ) ( TRUCK-AT ?auto_2670848 ?auto_2670846 ) ( ON ?auto_2670835 ?auto_2670834 ) ( ON ?auto_2670836 ?auto_2670835 ) ( ON ?auto_2670837 ?auto_2670836 ) ( ON ?auto_2670838 ?auto_2670837 ) ( ON ?auto_2670839 ?auto_2670838 ) ( ON ?auto_2670840 ?auto_2670839 ) ( ON ?auto_2670841 ?auto_2670840 ) ( not ( = ?auto_2670834 ?auto_2670835 ) ) ( not ( = ?auto_2670834 ?auto_2670836 ) ) ( not ( = ?auto_2670834 ?auto_2670837 ) ) ( not ( = ?auto_2670834 ?auto_2670838 ) ) ( not ( = ?auto_2670834 ?auto_2670839 ) ) ( not ( = ?auto_2670834 ?auto_2670840 ) ) ( not ( = ?auto_2670834 ?auto_2670841 ) ) ( not ( = ?auto_2670834 ?auto_2670842 ) ) ( not ( = ?auto_2670834 ?auto_2670843 ) ) ( not ( = ?auto_2670834 ?auto_2670847 ) ) ( not ( = ?auto_2670835 ?auto_2670836 ) ) ( not ( = ?auto_2670835 ?auto_2670837 ) ) ( not ( = ?auto_2670835 ?auto_2670838 ) ) ( not ( = ?auto_2670835 ?auto_2670839 ) ) ( not ( = ?auto_2670835 ?auto_2670840 ) ) ( not ( = ?auto_2670835 ?auto_2670841 ) ) ( not ( = ?auto_2670835 ?auto_2670842 ) ) ( not ( = ?auto_2670835 ?auto_2670843 ) ) ( not ( = ?auto_2670835 ?auto_2670847 ) ) ( not ( = ?auto_2670836 ?auto_2670837 ) ) ( not ( = ?auto_2670836 ?auto_2670838 ) ) ( not ( = ?auto_2670836 ?auto_2670839 ) ) ( not ( = ?auto_2670836 ?auto_2670840 ) ) ( not ( = ?auto_2670836 ?auto_2670841 ) ) ( not ( = ?auto_2670836 ?auto_2670842 ) ) ( not ( = ?auto_2670836 ?auto_2670843 ) ) ( not ( = ?auto_2670836 ?auto_2670847 ) ) ( not ( = ?auto_2670837 ?auto_2670838 ) ) ( not ( = ?auto_2670837 ?auto_2670839 ) ) ( not ( = ?auto_2670837 ?auto_2670840 ) ) ( not ( = ?auto_2670837 ?auto_2670841 ) ) ( not ( = ?auto_2670837 ?auto_2670842 ) ) ( not ( = ?auto_2670837 ?auto_2670843 ) ) ( not ( = ?auto_2670837 ?auto_2670847 ) ) ( not ( = ?auto_2670838 ?auto_2670839 ) ) ( not ( = ?auto_2670838 ?auto_2670840 ) ) ( not ( = ?auto_2670838 ?auto_2670841 ) ) ( not ( = ?auto_2670838 ?auto_2670842 ) ) ( not ( = ?auto_2670838 ?auto_2670843 ) ) ( not ( = ?auto_2670838 ?auto_2670847 ) ) ( not ( = ?auto_2670839 ?auto_2670840 ) ) ( not ( = ?auto_2670839 ?auto_2670841 ) ) ( not ( = ?auto_2670839 ?auto_2670842 ) ) ( not ( = ?auto_2670839 ?auto_2670843 ) ) ( not ( = ?auto_2670839 ?auto_2670847 ) ) ( not ( = ?auto_2670840 ?auto_2670841 ) ) ( not ( = ?auto_2670840 ?auto_2670842 ) ) ( not ( = ?auto_2670840 ?auto_2670843 ) ) ( not ( = ?auto_2670840 ?auto_2670847 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2670841 ?auto_2670842 ?auto_2670843 )
      ( MAKE-9CRATE-VERIFY ?auto_2670834 ?auto_2670835 ?auto_2670836 ?auto_2670837 ?auto_2670838 ?auto_2670839 ?auto_2670840 ?auto_2670841 ?auto_2670842 ?auto_2670843 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2670943 - SURFACE
      ?auto_2670944 - SURFACE
      ?auto_2670945 - SURFACE
      ?auto_2670946 - SURFACE
      ?auto_2670947 - SURFACE
      ?auto_2670948 - SURFACE
      ?auto_2670949 - SURFACE
      ?auto_2670950 - SURFACE
      ?auto_2670951 - SURFACE
      ?auto_2670952 - SURFACE
    )
    :vars
    (
      ?auto_2670958 - HOIST
      ?auto_2670955 - PLACE
      ?auto_2670954 - PLACE
      ?auto_2670956 - HOIST
      ?auto_2670957 - SURFACE
      ?auto_2670953 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2670958 ?auto_2670955 ) ( IS-CRATE ?auto_2670952 ) ( not ( = ?auto_2670951 ?auto_2670952 ) ) ( not ( = ?auto_2670950 ?auto_2670951 ) ) ( not ( = ?auto_2670950 ?auto_2670952 ) ) ( not ( = ?auto_2670954 ?auto_2670955 ) ) ( HOIST-AT ?auto_2670956 ?auto_2670954 ) ( not ( = ?auto_2670958 ?auto_2670956 ) ) ( AVAILABLE ?auto_2670956 ) ( SURFACE-AT ?auto_2670952 ?auto_2670954 ) ( ON ?auto_2670952 ?auto_2670957 ) ( CLEAR ?auto_2670952 ) ( not ( = ?auto_2670951 ?auto_2670957 ) ) ( not ( = ?auto_2670952 ?auto_2670957 ) ) ( not ( = ?auto_2670950 ?auto_2670957 ) ) ( TRUCK-AT ?auto_2670953 ?auto_2670955 ) ( SURFACE-AT ?auto_2670950 ?auto_2670955 ) ( CLEAR ?auto_2670950 ) ( LIFTING ?auto_2670958 ?auto_2670951 ) ( IS-CRATE ?auto_2670951 ) ( ON ?auto_2670944 ?auto_2670943 ) ( ON ?auto_2670945 ?auto_2670944 ) ( ON ?auto_2670946 ?auto_2670945 ) ( ON ?auto_2670947 ?auto_2670946 ) ( ON ?auto_2670948 ?auto_2670947 ) ( ON ?auto_2670949 ?auto_2670948 ) ( ON ?auto_2670950 ?auto_2670949 ) ( not ( = ?auto_2670943 ?auto_2670944 ) ) ( not ( = ?auto_2670943 ?auto_2670945 ) ) ( not ( = ?auto_2670943 ?auto_2670946 ) ) ( not ( = ?auto_2670943 ?auto_2670947 ) ) ( not ( = ?auto_2670943 ?auto_2670948 ) ) ( not ( = ?auto_2670943 ?auto_2670949 ) ) ( not ( = ?auto_2670943 ?auto_2670950 ) ) ( not ( = ?auto_2670943 ?auto_2670951 ) ) ( not ( = ?auto_2670943 ?auto_2670952 ) ) ( not ( = ?auto_2670943 ?auto_2670957 ) ) ( not ( = ?auto_2670944 ?auto_2670945 ) ) ( not ( = ?auto_2670944 ?auto_2670946 ) ) ( not ( = ?auto_2670944 ?auto_2670947 ) ) ( not ( = ?auto_2670944 ?auto_2670948 ) ) ( not ( = ?auto_2670944 ?auto_2670949 ) ) ( not ( = ?auto_2670944 ?auto_2670950 ) ) ( not ( = ?auto_2670944 ?auto_2670951 ) ) ( not ( = ?auto_2670944 ?auto_2670952 ) ) ( not ( = ?auto_2670944 ?auto_2670957 ) ) ( not ( = ?auto_2670945 ?auto_2670946 ) ) ( not ( = ?auto_2670945 ?auto_2670947 ) ) ( not ( = ?auto_2670945 ?auto_2670948 ) ) ( not ( = ?auto_2670945 ?auto_2670949 ) ) ( not ( = ?auto_2670945 ?auto_2670950 ) ) ( not ( = ?auto_2670945 ?auto_2670951 ) ) ( not ( = ?auto_2670945 ?auto_2670952 ) ) ( not ( = ?auto_2670945 ?auto_2670957 ) ) ( not ( = ?auto_2670946 ?auto_2670947 ) ) ( not ( = ?auto_2670946 ?auto_2670948 ) ) ( not ( = ?auto_2670946 ?auto_2670949 ) ) ( not ( = ?auto_2670946 ?auto_2670950 ) ) ( not ( = ?auto_2670946 ?auto_2670951 ) ) ( not ( = ?auto_2670946 ?auto_2670952 ) ) ( not ( = ?auto_2670946 ?auto_2670957 ) ) ( not ( = ?auto_2670947 ?auto_2670948 ) ) ( not ( = ?auto_2670947 ?auto_2670949 ) ) ( not ( = ?auto_2670947 ?auto_2670950 ) ) ( not ( = ?auto_2670947 ?auto_2670951 ) ) ( not ( = ?auto_2670947 ?auto_2670952 ) ) ( not ( = ?auto_2670947 ?auto_2670957 ) ) ( not ( = ?auto_2670948 ?auto_2670949 ) ) ( not ( = ?auto_2670948 ?auto_2670950 ) ) ( not ( = ?auto_2670948 ?auto_2670951 ) ) ( not ( = ?auto_2670948 ?auto_2670952 ) ) ( not ( = ?auto_2670948 ?auto_2670957 ) ) ( not ( = ?auto_2670949 ?auto_2670950 ) ) ( not ( = ?auto_2670949 ?auto_2670951 ) ) ( not ( = ?auto_2670949 ?auto_2670952 ) ) ( not ( = ?auto_2670949 ?auto_2670957 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2670950 ?auto_2670951 ?auto_2670952 )
      ( MAKE-9CRATE-VERIFY ?auto_2670943 ?auto_2670944 ?auto_2670945 ?auto_2670946 ?auto_2670947 ?auto_2670948 ?auto_2670949 ?auto_2670950 ?auto_2670951 ?auto_2670952 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2671052 - SURFACE
      ?auto_2671053 - SURFACE
      ?auto_2671054 - SURFACE
      ?auto_2671055 - SURFACE
      ?auto_2671056 - SURFACE
      ?auto_2671057 - SURFACE
      ?auto_2671058 - SURFACE
      ?auto_2671059 - SURFACE
      ?auto_2671060 - SURFACE
      ?auto_2671061 - SURFACE
    )
    :vars
    (
      ?auto_2671062 - HOIST
      ?auto_2671066 - PLACE
      ?auto_2671064 - PLACE
      ?auto_2671065 - HOIST
      ?auto_2671067 - SURFACE
      ?auto_2671063 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2671062 ?auto_2671066 ) ( IS-CRATE ?auto_2671061 ) ( not ( = ?auto_2671060 ?auto_2671061 ) ) ( not ( = ?auto_2671059 ?auto_2671060 ) ) ( not ( = ?auto_2671059 ?auto_2671061 ) ) ( not ( = ?auto_2671064 ?auto_2671066 ) ) ( HOIST-AT ?auto_2671065 ?auto_2671064 ) ( not ( = ?auto_2671062 ?auto_2671065 ) ) ( AVAILABLE ?auto_2671065 ) ( SURFACE-AT ?auto_2671061 ?auto_2671064 ) ( ON ?auto_2671061 ?auto_2671067 ) ( CLEAR ?auto_2671061 ) ( not ( = ?auto_2671060 ?auto_2671067 ) ) ( not ( = ?auto_2671061 ?auto_2671067 ) ) ( not ( = ?auto_2671059 ?auto_2671067 ) ) ( TRUCK-AT ?auto_2671063 ?auto_2671066 ) ( SURFACE-AT ?auto_2671059 ?auto_2671066 ) ( CLEAR ?auto_2671059 ) ( IS-CRATE ?auto_2671060 ) ( AVAILABLE ?auto_2671062 ) ( IN ?auto_2671060 ?auto_2671063 ) ( ON ?auto_2671053 ?auto_2671052 ) ( ON ?auto_2671054 ?auto_2671053 ) ( ON ?auto_2671055 ?auto_2671054 ) ( ON ?auto_2671056 ?auto_2671055 ) ( ON ?auto_2671057 ?auto_2671056 ) ( ON ?auto_2671058 ?auto_2671057 ) ( ON ?auto_2671059 ?auto_2671058 ) ( not ( = ?auto_2671052 ?auto_2671053 ) ) ( not ( = ?auto_2671052 ?auto_2671054 ) ) ( not ( = ?auto_2671052 ?auto_2671055 ) ) ( not ( = ?auto_2671052 ?auto_2671056 ) ) ( not ( = ?auto_2671052 ?auto_2671057 ) ) ( not ( = ?auto_2671052 ?auto_2671058 ) ) ( not ( = ?auto_2671052 ?auto_2671059 ) ) ( not ( = ?auto_2671052 ?auto_2671060 ) ) ( not ( = ?auto_2671052 ?auto_2671061 ) ) ( not ( = ?auto_2671052 ?auto_2671067 ) ) ( not ( = ?auto_2671053 ?auto_2671054 ) ) ( not ( = ?auto_2671053 ?auto_2671055 ) ) ( not ( = ?auto_2671053 ?auto_2671056 ) ) ( not ( = ?auto_2671053 ?auto_2671057 ) ) ( not ( = ?auto_2671053 ?auto_2671058 ) ) ( not ( = ?auto_2671053 ?auto_2671059 ) ) ( not ( = ?auto_2671053 ?auto_2671060 ) ) ( not ( = ?auto_2671053 ?auto_2671061 ) ) ( not ( = ?auto_2671053 ?auto_2671067 ) ) ( not ( = ?auto_2671054 ?auto_2671055 ) ) ( not ( = ?auto_2671054 ?auto_2671056 ) ) ( not ( = ?auto_2671054 ?auto_2671057 ) ) ( not ( = ?auto_2671054 ?auto_2671058 ) ) ( not ( = ?auto_2671054 ?auto_2671059 ) ) ( not ( = ?auto_2671054 ?auto_2671060 ) ) ( not ( = ?auto_2671054 ?auto_2671061 ) ) ( not ( = ?auto_2671054 ?auto_2671067 ) ) ( not ( = ?auto_2671055 ?auto_2671056 ) ) ( not ( = ?auto_2671055 ?auto_2671057 ) ) ( not ( = ?auto_2671055 ?auto_2671058 ) ) ( not ( = ?auto_2671055 ?auto_2671059 ) ) ( not ( = ?auto_2671055 ?auto_2671060 ) ) ( not ( = ?auto_2671055 ?auto_2671061 ) ) ( not ( = ?auto_2671055 ?auto_2671067 ) ) ( not ( = ?auto_2671056 ?auto_2671057 ) ) ( not ( = ?auto_2671056 ?auto_2671058 ) ) ( not ( = ?auto_2671056 ?auto_2671059 ) ) ( not ( = ?auto_2671056 ?auto_2671060 ) ) ( not ( = ?auto_2671056 ?auto_2671061 ) ) ( not ( = ?auto_2671056 ?auto_2671067 ) ) ( not ( = ?auto_2671057 ?auto_2671058 ) ) ( not ( = ?auto_2671057 ?auto_2671059 ) ) ( not ( = ?auto_2671057 ?auto_2671060 ) ) ( not ( = ?auto_2671057 ?auto_2671061 ) ) ( not ( = ?auto_2671057 ?auto_2671067 ) ) ( not ( = ?auto_2671058 ?auto_2671059 ) ) ( not ( = ?auto_2671058 ?auto_2671060 ) ) ( not ( = ?auto_2671058 ?auto_2671061 ) ) ( not ( = ?auto_2671058 ?auto_2671067 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2671059 ?auto_2671060 ?auto_2671061 )
      ( MAKE-9CRATE-VERIFY ?auto_2671052 ?auto_2671053 ?auto_2671054 ?auto_2671055 ?auto_2671056 ?auto_2671057 ?auto_2671058 ?auto_2671059 ?auto_2671060 ?auto_2671061 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2676586 - SURFACE
      ?auto_2676587 - SURFACE
      ?auto_2676588 - SURFACE
      ?auto_2676589 - SURFACE
      ?auto_2676590 - SURFACE
      ?auto_2676591 - SURFACE
      ?auto_2676592 - SURFACE
      ?auto_2676593 - SURFACE
      ?auto_2676594 - SURFACE
      ?auto_2676595 - SURFACE
      ?auto_2676596 - SURFACE
    )
    :vars
    (
      ?auto_2676598 - HOIST
      ?auto_2676597 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2676598 ?auto_2676597 ) ( SURFACE-AT ?auto_2676595 ?auto_2676597 ) ( CLEAR ?auto_2676595 ) ( LIFTING ?auto_2676598 ?auto_2676596 ) ( IS-CRATE ?auto_2676596 ) ( not ( = ?auto_2676595 ?auto_2676596 ) ) ( ON ?auto_2676587 ?auto_2676586 ) ( ON ?auto_2676588 ?auto_2676587 ) ( ON ?auto_2676589 ?auto_2676588 ) ( ON ?auto_2676590 ?auto_2676589 ) ( ON ?auto_2676591 ?auto_2676590 ) ( ON ?auto_2676592 ?auto_2676591 ) ( ON ?auto_2676593 ?auto_2676592 ) ( ON ?auto_2676594 ?auto_2676593 ) ( ON ?auto_2676595 ?auto_2676594 ) ( not ( = ?auto_2676586 ?auto_2676587 ) ) ( not ( = ?auto_2676586 ?auto_2676588 ) ) ( not ( = ?auto_2676586 ?auto_2676589 ) ) ( not ( = ?auto_2676586 ?auto_2676590 ) ) ( not ( = ?auto_2676586 ?auto_2676591 ) ) ( not ( = ?auto_2676586 ?auto_2676592 ) ) ( not ( = ?auto_2676586 ?auto_2676593 ) ) ( not ( = ?auto_2676586 ?auto_2676594 ) ) ( not ( = ?auto_2676586 ?auto_2676595 ) ) ( not ( = ?auto_2676586 ?auto_2676596 ) ) ( not ( = ?auto_2676587 ?auto_2676588 ) ) ( not ( = ?auto_2676587 ?auto_2676589 ) ) ( not ( = ?auto_2676587 ?auto_2676590 ) ) ( not ( = ?auto_2676587 ?auto_2676591 ) ) ( not ( = ?auto_2676587 ?auto_2676592 ) ) ( not ( = ?auto_2676587 ?auto_2676593 ) ) ( not ( = ?auto_2676587 ?auto_2676594 ) ) ( not ( = ?auto_2676587 ?auto_2676595 ) ) ( not ( = ?auto_2676587 ?auto_2676596 ) ) ( not ( = ?auto_2676588 ?auto_2676589 ) ) ( not ( = ?auto_2676588 ?auto_2676590 ) ) ( not ( = ?auto_2676588 ?auto_2676591 ) ) ( not ( = ?auto_2676588 ?auto_2676592 ) ) ( not ( = ?auto_2676588 ?auto_2676593 ) ) ( not ( = ?auto_2676588 ?auto_2676594 ) ) ( not ( = ?auto_2676588 ?auto_2676595 ) ) ( not ( = ?auto_2676588 ?auto_2676596 ) ) ( not ( = ?auto_2676589 ?auto_2676590 ) ) ( not ( = ?auto_2676589 ?auto_2676591 ) ) ( not ( = ?auto_2676589 ?auto_2676592 ) ) ( not ( = ?auto_2676589 ?auto_2676593 ) ) ( not ( = ?auto_2676589 ?auto_2676594 ) ) ( not ( = ?auto_2676589 ?auto_2676595 ) ) ( not ( = ?auto_2676589 ?auto_2676596 ) ) ( not ( = ?auto_2676590 ?auto_2676591 ) ) ( not ( = ?auto_2676590 ?auto_2676592 ) ) ( not ( = ?auto_2676590 ?auto_2676593 ) ) ( not ( = ?auto_2676590 ?auto_2676594 ) ) ( not ( = ?auto_2676590 ?auto_2676595 ) ) ( not ( = ?auto_2676590 ?auto_2676596 ) ) ( not ( = ?auto_2676591 ?auto_2676592 ) ) ( not ( = ?auto_2676591 ?auto_2676593 ) ) ( not ( = ?auto_2676591 ?auto_2676594 ) ) ( not ( = ?auto_2676591 ?auto_2676595 ) ) ( not ( = ?auto_2676591 ?auto_2676596 ) ) ( not ( = ?auto_2676592 ?auto_2676593 ) ) ( not ( = ?auto_2676592 ?auto_2676594 ) ) ( not ( = ?auto_2676592 ?auto_2676595 ) ) ( not ( = ?auto_2676592 ?auto_2676596 ) ) ( not ( = ?auto_2676593 ?auto_2676594 ) ) ( not ( = ?auto_2676593 ?auto_2676595 ) ) ( not ( = ?auto_2676593 ?auto_2676596 ) ) ( not ( = ?auto_2676594 ?auto_2676595 ) ) ( not ( = ?auto_2676594 ?auto_2676596 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2676595 ?auto_2676596 )
      ( MAKE-10CRATE-VERIFY ?auto_2676586 ?auto_2676587 ?auto_2676588 ?auto_2676589 ?auto_2676590 ?auto_2676591 ?auto_2676592 ?auto_2676593 ?auto_2676594 ?auto_2676595 ?auto_2676596 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2676680 - SURFACE
      ?auto_2676681 - SURFACE
      ?auto_2676682 - SURFACE
      ?auto_2676683 - SURFACE
      ?auto_2676684 - SURFACE
      ?auto_2676685 - SURFACE
      ?auto_2676686 - SURFACE
      ?auto_2676687 - SURFACE
      ?auto_2676688 - SURFACE
      ?auto_2676689 - SURFACE
      ?auto_2676690 - SURFACE
    )
    :vars
    (
      ?auto_2676692 - HOIST
      ?auto_2676691 - PLACE
      ?auto_2676693 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2676692 ?auto_2676691 ) ( SURFACE-AT ?auto_2676689 ?auto_2676691 ) ( CLEAR ?auto_2676689 ) ( IS-CRATE ?auto_2676690 ) ( not ( = ?auto_2676689 ?auto_2676690 ) ) ( TRUCK-AT ?auto_2676693 ?auto_2676691 ) ( AVAILABLE ?auto_2676692 ) ( IN ?auto_2676690 ?auto_2676693 ) ( ON ?auto_2676689 ?auto_2676688 ) ( not ( = ?auto_2676688 ?auto_2676689 ) ) ( not ( = ?auto_2676688 ?auto_2676690 ) ) ( ON ?auto_2676681 ?auto_2676680 ) ( ON ?auto_2676682 ?auto_2676681 ) ( ON ?auto_2676683 ?auto_2676682 ) ( ON ?auto_2676684 ?auto_2676683 ) ( ON ?auto_2676685 ?auto_2676684 ) ( ON ?auto_2676686 ?auto_2676685 ) ( ON ?auto_2676687 ?auto_2676686 ) ( ON ?auto_2676688 ?auto_2676687 ) ( not ( = ?auto_2676680 ?auto_2676681 ) ) ( not ( = ?auto_2676680 ?auto_2676682 ) ) ( not ( = ?auto_2676680 ?auto_2676683 ) ) ( not ( = ?auto_2676680 ?auto_2676684 ) ) ( not ( = ?auto_2676680 ?auto_2676685 ) ) ( not ( = ?auto_2676680 ?auto_2676686 ) ) ( not ( = ?auto_2676680 ?auto_2676687 ) ) ( not ( = ?auto_2676680 ?auto_2676688 ) ) ( not ( = ?auto_2676680 ?auto_2676689 ) ) ( not ( = ?auto_2676680 ?auto_2676690 ) ) ( not ( = ?auto_2676681 ?auto_2676682 ) ) ( not ( = ?auto_2676681 ?auto_2676683 ) ) ( not ( = ?auto_2676681 ?auto_2676684 ) ) ( not ( = ?auto_2676681 ?auto_2676685 ) ) ( not ( = ?auto_2676681 ?auto_2676686 ) ) ( not ( = ?auto_2676681 ?auto_2676687 ) ) ( not ( = ?auto_2676681 ?auto_2676688 ) ) ( not ( = ?auto_2676681 ?auto_2676689 ) ) ( not ( = ?auto_2676681 ?auto_2676690 ) ) ( not ( = ?auto_2676682 ?auto_2676683 ) ) ( not ( = ?auto_2676682 ?auto_2676684 ) ) ( not ( = ?auto_2676682 ?auto_2676685 ) ) ( not ( = ?auto_2676682 ?auto_2676686 ) ) ( not ( = ?auto_2676682 ?auto_2676687 ) ) ( not ( = ?auto_2676682 ?auto_2676688 ) ) ( not ( = ?auto_2676682 ?auto_2676689 ) ) ( not ( = ?auto_2676682 ?auto_2676690 ) ) ( not ( = ?auto_2676683 ?auto_2676684 ) ) ( not ( = ?auto_2676683 ?auto_2676685 ) ) ( not ( = ?auto_2676683 ?auto_2676686 ) ) ( not ( = ?auto_2676683 ?auto_2676687 ) ) ( not ( = ?auto_2676683 ?auto_2676688 ) ) ( not ( = ?auto_2676683 ?auto_2676689 ) ) ( not ( = ?auto_2676683 ?auto_2676690 ) ) ( not ( = ?auto_2676684 ?auto_2676685 ) ) ( not ( = ?auto_2676684 ?auto_2676686 ) ) ( not ( = ?auto_2676684 ?auto_2676687 ) ) ( not ( = ?auto_2676684 ?auto_2676688 ) ) ( not ( = ?auto_2676684 ?auto_2676689 ) ) ( not ( = ?auto_2676684 ?auto_2676690 ) ) ( not ( = ?auto_2676685 ?auto_2676686 ) ) ( not ( = ?auto_2676685 ?auto_2676687 ) ) ( not ( = ?auto_2676685 ?auto_2676688 ) ) ( not ( = ?auto_2676685 ?auto_2676689 ) ) ( not ( = ?auto_2676685 ?auto_2676690 ) ) ( not ( = ?auto_2676686 ?auto_2676687 ) ) ( not ( = ?auto_2676686 ?auto_2676688 ) ) ( not ( = ?auto_2676686 ?auto_2676689 ) ) ( not ( = ?auto_2676686 ?auto_2676690 ) ) ( not ( = ?auto_2676687 ?auto_2676688 ) ) ( not ( = ?auto_2676687 ?auto_2676689 ) ) ( not ( = ?auto_2676687 ?auto_2676690 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2676688 ?auto_2676689 ?auto_2676690 )
      ( MAKE-10CRATE-VERIFY ?auto_2676680 ?auto_2676681 ?auto_2676682 ?auto_2676683 ?auto_2676684 ?auto_2676685 ?auto_2676686 ?auto_2676687 ?auto_2676688 ?auto_2676689 ?auto_2676690 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2676785 - SURFACE
      ?auto_2676786 - SURFACE
      ?auto_2676787 - SURFACE
      ?auto_2676788 - SURFACE
      ?auto_2676789 - SURFACE
      ?auto_2676790 - SURFACE
      ?auto_2676791 - SURFACE
      ?auto_2676792 - SURFACE
      ?auto_2676793 - SURFACE
      ?auto_2676794 - SURFACE
      ?auto_2676795 - SURFACE
    )
    :vars
    (
      ?auto_2676798 - HOIST
      ?auto_2676799 - PLACE
      ?auto_2676797 - TRUCK
      ?auto_2676796 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2676798 ?auto_2676799 ) ( SURFACE-AT ?auto_2676794 ?auto_2676799 ) ( CLEAR ?auto_2676794 ) ( IS-CRATE ?auto_2676795 ) ( not ( = ?auto_2676794 ?auto_2676795 ) ) ( AVAILABLE ?auto_2676798 ) ( IN ?auto_2676795 ?auto_2676797 ) ( ON ?auto_2676794 ?auto_2676793 ) ( not ( = ?auto_2676793 ?auto_2676794 ) ) ( not ( = ?auto_2676793 ?auto_2676795 ) ) ( TRUCK-AT ?auto_2676797 ?auto_2676796 ) ( not ( = ?auto_2676796 ?auto_2676799 ) ) ( ON ?auto_2676786 ?auto_2676785 ) ( ON ?auto_2676787 ?auto_2676786 ) ( ON ?auto_2676788 ?auto_2676787 ) ( ON ?auto_2676789 ?auto_2676788 ) ( ON ?auto_2676790 ?auto_2676789 ) ( ON ?auto_2676791 ?auto_2676790 ) ( ON ?auto_2676792 ?auto_2676791 ) ( ON ?auto_2676793 ?auto_2676792 ) ( not ( = ?auto_2676785 ?auto_2676786 ) ) ( not ( = ?auto_2676785 ?auto_2676787 ) ) ( not ( = ?auto_2676785 ?auto_2676788 ) ) ( not ( = ?auto_2676785 ?auto_2676789 ) ) ( not ( = ?auto_2676785 ?auto_2676790 ) ) ( not ( = ?auto_2676785 ?auto_2676791 ) ) ( not ( = ?auto_2676785 ?auto_2676792 ) ) ( not ( = ?auto_2676785 ?auto_2676793 ) ) ( not ( = ?auto_2676785 ?auto_2676794 ) ) ( not ( = ?auto_2676785 ?auto_2676795 ) ) ( not ( = ?auto_2676786 ?auto_2676787 ) ) ( not ( = ?auto_2676786 ?auto_2676788 ) ) ( not ( = ?auto_2676786 ?auto_2676789 ) ) ( not ( = ?auto_2676786 ?auto_2676790 ) ) ( not ( = ?auto_2676786 ?auto_2676791 ) ) ( not ( = ?auto_2676786 ?auto_2676792 ) ) ( not ( = ?auto_2676786 ?auto_2676793 ) ) ( not ( = ?auto_2676786 ?auto_2676794 ) ) ( not ( = ?auto_2676786 ?auto_2676795 ) ) ( not ( = ?auto_2676787 ?auto_2676788 ) ) ( not ( = ?auto_2676787 ?auto_2676789 ) ) ( not ( = ?auto_2676787 ?auto_2676790 ) ) ( not ( = ?auto_2676787 ?auto_2676791 ) ) ( not ( = ?auto_2676787 ?auto_2676792 ) ) ( not ( = ?auto_2676787 ?auto_2676793 ) ) ( not ( = ?auto_2676787 ?auto_2676794 ) ) ( not ( = ?auto_2676787 ?auto_2676795 ) ) ( not ( = ?auto_2676788 ?auto_2676789 ) ) ( not ( = ?auto_2676788 ?auto_2676790 ) ) ( not ( = ?auto_2676788 ?auto_2676791 ) ) ( not ( = ?auto_2676788 ?auto_2676792 ) ) ( not ( = ?auto_2676788 ?auto_2676793 ) ) ( not ( = ?auto_2676788 ?auto_2676794 ) ) ( not ( = ?auto_2676788 ?auto_2676795 ) ) ( not ( = ?auto_2676789 ?auto_2676790 ) ) ( not ( = ?auto_2676789 ?auto_2676791 ) ) ( not ( = ?auto_2676789 ?auto_2676792 ) ) ( not ( = ?auto_2676789 ?auto_2676793 ) ) ( not ( = ?auto_2676789 ?auto_2676794 ) ) ( not ( = ?auto_2676789 ?auto_2676795 ) ) ( not ( = ?auto_2676790 ?auto_2676791 ) ) ( not ( = ?auto_2676790 ?auto_2676792 ) ) ( not ( = ?auto_2676790 ?auto_2676793 ) ) ( not ( = ?auto_2676790 ?auto_2676794 ) ) ( not ( = ?auto_2676790 ?auto_2676795 ) ) ( not ( = ?auto_2676791 ?auto_2676792 ) ) ( not ( = ?auto_2676791 ?auto_2676793 ) ) ( not ( = ?auto_2676791 ?auto_2676794 ) ) ( not ( = ?auto_2676791 ?auto_2676795 ) ) ( not ( = ?auto_2676792 ?auto_2676793 ) ) ( not ( = ?auto_2676792 ?auto_2676794 ) ) ( not ( = ?auto_2676792 ?auto_2676795 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2676793 ?auto_2676794 ?auto_2676795 )
      ( MAKE-10CRATE-VERIFY ?auto_2676785 ?auto_2676786 ?auto_2676787 ?auto_2676788 ?auto_2676789 ?auto_2676790 ?auto_2676791 ?auto_2676792 ?auto_2676793 ?auto_2676794 ?auto_2676795 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2676900 - SURFACE
      ?auto_2676901 - SURFACE
      ?auto_2676902 - SURFACE
      ?auto_2676903 - SURFACE
      ?auto_2676904 - SURFACE
      ?auto_2676905 - SURFACE
      ?auto_2676906 - SURFACE
      ?auto_2676907 - SURFACE
      ?auto_2676908 - SURFACE
      ?auto_2676909 - SURFACE
      ?auto_2676910 - SURFACE
    )
    :vars
    (
      ?auto_2676915 - HOIST
      ?auto_2676914 - PLACE
      ?auto_2676913 - TRUCK
      ?auto_2676912 - PLACE
      ?auto_2676911 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2676915 ?auto_2676914 ) ( SURFACE-AT ?auto_2676909 ?auto_2676914 ) ( CLEAR ?auto_2676909 ) ( IS-CRATE ?auto_2676910 ) ( not ( = ?auto_2676909 ?auto_2676910 ) ) ( AVAILABLE ?auto_2676915 ) ( ON ?auto_2676909 ?auto_2676908 ) ( not ( = ?auto_2676908 ?auto_2676909 ) ) ( not ( = ?auto_2676908 ?auto_2676910 ) ) ( TRUCK-AT ?auto_2676913 ?auto_2676912 ) ( not ( = ?auto_2676912 ?auto_2676914 ) ) ( HOIST-AT ?auto_2676911 ?auto_2676912 ) ( LIFTING ?auto_2676911 ?auto_2676910 ) ( not ( = ?auto_2676915 ?auto_2676911 ) ) ( ON ?auto_2676901 ?auto_2676900 ) ( ON ?auto_2676902 ?auto_2676901 ) ( ON ?auto_2676903 ?auto_2676902 ) ( ON ?auto_2676904 ?auto_2676903 ) ( ON ?auto_2676905 ?auto_2676904 ) ( ON ?auto_2676906 ?auto_2676905 ) ( ON ?auto_2676907 ?auto_2676906 ) ( ON ?auto_2676908 ?auto_2676907 ) ( not ( = ?auto_2676900 ?auto_2676901 ) ) ( not ( = ?auto_2676900 ?auto_2676902 ) ) ( not ( = ?auto_2676900 ?auto_2676903 ) ) ( not ( = ?auto_2676900 ?auto_2676904 ) ) ( not ( = ?auto_2676900 ?auto_2676905 ) ) ( not ( = ?auto_2676900 ?auto_2676906 ) ) ( not ( = ?auto_2676900 ?auto_2676907 ) ) ( not ( = ?auto_2676900 ?auto_2676908 ) ) ( not ( = ?auto_2676900 ?auto_2676909 ) ) ( not ( = ?auto_2676900 ?auto_2676910 ) ) ( not ( = ?auto_2676901 ?auto_2676902 ) ) ( not ( = ?auto_2676901 ?auto_2676903 ) ) ( not ( = ?auto_2676901 ?auto_2676904 ) ) ( not ( = ?auto_2676901 ?auto_2676905 ) ) ( not ( = ?auto_2676901 ?auto_2676906 ) ) ( not ( = ?auto_2676901 ?auto_2676907 ) ) ( not ( = ?auto_2676901 ?auto_2676908 ) ) ( not ( = ?auto_2676901 ?auto_2676909 ) ) ( not ( = ?auto_2676901 ?auto_2676910 ) ) ( not ( = ?auto_2676902 ?auto_2676903 ) ) ( not ( = ?auto_2676902 ?auto_2676904 ) ) ( not ( = ?auto_2676902 ?auto_2676905 ) ) ( not ( = ?auto_2676902 ?auto_2676906 ) ) ( not ( = ?auto_2676902 ?auto_2676907 ) ) ( not ( = ?auto_2676902 ?auto_2676908 ) ) ( not ( = ?auto_2676902 ?auto_2676909 ) ) ( not ( = ?auto_2676902 ?auto_2676910 ) ) ( not ( = ?auto_2676903 ?auto_2676904 ) ) ( not ( = ?auto_2676903 ?auto_2676905 ) ) ( not ( = ?auto_2676903 ?auto_2676906 ) ) ( not ( = ?auto_2676903 ?auto_2676907 ) ) ( not ( = ?auto_2676903 ?auto_2676908 ) ) ( not ( = ?auto_2676903 ?auto_2676909 ) ) ( not ( = ?auto_2676903 ?auto_2676910 ) ) ( not ( = ?auto_2676904 ?auto_2676905 ) ) ( not ( = ?auto_2676904 ?auto_2676906 ) ) ( not ( = ?auto_2676904 ?auto_2676907 ) ) ( not ( = ?auto_2676904 ?auto_2676908 ) ) ( not ( = ?auto_2676904 ?auto_2676909 ) ) ( not ( = ?auto_2676904 ?auto_2676910 ) ) ( not ( = ?auto_2676905 ?auto_2676906 ) ) ( not ( = ?auto_2676905 ?auto_2676907 ) ) ( not ( = ?auto_2676905 ?auto_2676908 ) ) ( not ( = ?auto_2676905 ?auto_2676909 ) ) ( not ( = ?auto_2676905 ?auto_2676910 ) ) ( not ( = ?auto_2676906 ?auto_2676907 ) ) ( not ( = ?auto_2676906 ?auto_2676908 ) ) ( not ( = ?auto_2676906 ?auto_2676909 ) ) ( not ( = ?auto_2676906 ?auto_2676910 ) ) ( not ( = ?auto_2676907 ?auto_2676908 ) ) ( not ( = ?auto_2676907 ?auto_2676909 ) ) ( not ( = ?auto_2676907 ?auto_2676910 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2676908 ?auto_2676909 ?auto_2676910 )
      ( MAKE-10CRATE-VERIFY ?auto_2676900 ?auto_2676901 ?auto_2676902 ?auto_2676903 ?auto_2676904 ?auto_2676905 ?auto_2676906 ?auto_2676907 ?auto_2676908 ?auto_2676909 ?auto_2676910 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2677025 - SURFACE
      ?auto_2677026 - SURFACE
      ?auto_2677027 - SURFACE
      ?auto_2677028 - SURFACE
      ?auto_2677029 - SURFACE
      ?auto_2677030 - SURFACE
      ?auto_2677031 - SURFACE
      ?auto_2677032 - SURFACE
      ?auto_2677033 - SURFACE
      ?auto_2677034 - SURFACE
      ?auto_2677035 - SURFACE
    )
    :vars
    (
      ?auto_2677038 - HOIST
      ?auto_2677041 - PLACE
      ?auto_2677040 - TRUCK
      ?auto_2677037 - PLACE
      ?auto_2677036 - HOIST
      ?auto_2677039 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2677038 ?auto_2677041 ) ( SURFACE-AT ?auto_2677034 ?auto_2677041 ) ( CLEAR ?auto_2677034 ) ( IS-CRATE ?auto_2677035 ) ( not ( = ?auto_2677034 ?auto_2677035 ) ) ( AVAILABLE ?auto_2677038 ) ( ON ?auto_2677034 ?auto_2677033 ) ( not ( = ?auto_2677033 ?auto_2677034 ) ) ( not ( = ?auto_2677033 ?auto_2677035 ) ) ( TRUCK-AT ?auto_2677040 ?auto_2677037 ) ( not ( = ?auto_2677037 ?auto_2677041 ) ) ( HOIST-AT ?auto_2677036 ?auto_2677037 ) ( not ( = ?auto_2677038 ?auto_2677036 ) ) ( AVAILABLE ?auto_2677036 ) ( SURFACE-AT ?auto_2677035 ?auto_2677037 ) ( ON ?auto_2677035 ?auto_2677039 ) ( CLEAR ?auto_2677035 ) ( not ( = ?auto_2677034 ?auto_2677039 ) ) ( not ( = ?auto_2677035 ?auto_2677039 ) ) ( not ( = ?auto_2677033 ?auto_2677039 ) ) ( ON ?auto_2677026 ?auto_2677025 ) ( ON ?auto_2677027 ?auto_2677026 ) ( ON ?auto_2677028 ?auto_2677027 ) ( ON ?auto_2677029 ?auto_2677028 ) ( ON ?auto_2677030 ?auto_2677029 ) ( ON ?auto_2677031 ?auto_2677030 ) ( ON ?auto_2677032 ?auto_2677031 ) ( ON ?auto_2677033 ?auto_2677032 ) ( not ( = ?auto_2677025 ?auto_2677026 ) ) ( not ( = ?auto_2677025 ?auto_2677027 ) ) ( not ( = ?auto_2677025 ?auto_2677028 ) ) ( not ( = ?auto_2677025 ?auto_2677029 ) ) ( not ( = ?auto_2677025 ?auto_2677030 ) ) ( not ( = ?auto_2677025 ?auto_2677031 ) ) ( not ( = ?auto_2677025 ?auto_2677032 ) ) ( not ( = ?auto_2677025 ?auto_2677033 ) ) ( not ( = ?auto_2677025 ?auto_2677034 ) ) ( not ( = ?auto_2677025 ?auto_2677035 ) ) ( not ( = ?auto_2677025 ?auto_2677039 ) ) ( not ( = ?auto_2677026 ?auto_2677027 ) ) ( not ( = ?auto_2677026 ?auto_2677028 ) ) ( not ( = ?auto_2677026 ?auto_2677029 ) ) ( not ( = ?auto_2677026 ?auto_2677030 ) ) ( not ( = ?auto_2677026 ?auto_2677031 ) ) ( not ( = ?auto_2677026 ?auto_2677032 ) ) ( not ( = ?auto_2677026 ?auto_2677033 ) ) ( not ( = ?auto_2677026 ?auto_2677034 ) ) ( not ( = ?auto_2677026 ?auto_2677035 ) ) ( not ( = ?auto_2677026 ?auto_2677039 ) ) ( not ( = ?auto_2677027 ?auto_2677028 ) ) ( not ( = ?auto_2677027 ?auto_2677029 ) ) ( not ( = ?auto_2677027 ?auto_2677030 ) ) ( not ( = ?auto_2677027 ?auto_2677031 ) ) ( not ( = ?auto_2677027 ?auto_2677032 ) ) ( not ( = ?auto_2677027 ?auto_2677033 ) ) ( not ( = ?auto_2677027 ?auto_2677034 ) ) ( not ( = ?auto_2677027 ?auto_2677035 ) ) ( not ( = ?auto_2677027 ?auto_2677039 ) ) ( not ( = ?auto_2677028 ?auto_2677029 ) ) ( not ( = ?auto_2677028 ?auto_2677030 ) ) ( not ( = ?auto_2677028 ?auto_2677031 ) ) ( not ( = ?auto_2677028 ?auto_2677032 ) ) ( not ( = ?auto_2677028 ?auto_2677033 ) ) ( not ( = ?auto_2677028 ?auto_2677034 ) ) ( not ( = ?auto_2677028 ?auto_2677035 ) ) ( not ( = ?auto_2677028 ?auto_2677039 ) ) ( not ( = ?auto_2677029 ?auto_2677030 ) ) ( not ( = ?auto_2677029 ?auto_2677031 ) ) ( not ( = ?auto_2677029 ?auto_2677032 ) ) ( not ( = ?auto_2677029 ?auto_2677033 ) ) ( not ( = ?auto_2677029 ?auto_2677034 ) ) ( not ( = ?auto_2677029 ?auto_2677035 ) ) ( not ( = ?auto_2677029 ?auto_2677039 ) ) ( not ( = ?auto_2677030 ?auto_2677031 ) ) ( not ( = ?auto_2677030 ?auto_2677032 ) ) ( not ( = ?auto_2677030 ?auto_2677033 ) ) ( not ( = ?auto_2677030 ?auto_2677034 ) ) ( not ( = ?auto_2677030 ?auto_2677035 ) ) ( not ( = ?auto_2677030 ?auto_2677039 ) ) ( not ( = ?auto_2677031 ?auto_2677032 ) ) ( not ( = ?auto_2677031 ?auto_2677033 ) ) ( not ( = ?auto_2677031 ?auto_2677034 ) ) ( not ( = ?auto_2677031 ?auto_2677035 ) ) ( not ( = ?auto_2677031 ?auto_2677039 ) ) ( not ( = ?auto_2677032 ?auto_2677033 ) ) ( not ( = ?auto_2677032 ?auto_2677034 ) ) ( not ( = ?auto_2677032 ?auto_2677035 ) ) ( not ( = ?auto_2677032 ?auto_2677039 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2677033 ?auto_2677034 ?auto_2677035 )
      ( MAKE-10CRATE-VERIFY ?auto_2677025 ?auto_2677026 ?auto_2677027 ?auto_2677028 ?auto_2677029 ?auto_2677030 ?auto_2677031 ?auto_2677032 ?auto_2677033 ?auto_2677034 ?auto_2677035 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2677151 - SURFACE
      ?auto_2677152 - SURFACE
      ?auto_2677153 - SURFACE
      ?auto_2677154 - SURFACE
      ?auto_2677155 - SURFACE
      ?auto_2677156 - SURFACE
      ?auto_2677157 - SURFACE
      ?auto_2677158 - SURFACE
      ?auto_2677159 - SURFACE
      ?auto_2677160 - SURFACE
      ?auto_2677161 - SURFACE
    )
    :vars
    (
      ?auto_2677162 - HOIST
      ?auto_2677164 - PLACE
      ?auto_2677163 - PLACE
      ?auto_2677167 - HOIST
      ?auto_2677166 - SURFACE
      ?auto_2677165 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2677162 ?auto_2677164 ) ( SURFACE-AT ?auto_2677160 ?auto_2677164 ) ( CLEAR ?auto_2677160 ) ( IS-CRATE ?auto_2677161 ) ( not ( = ?auto_2677160 ?auto_2677161 ) ) ( AVAILABLE ?auto_2677162 ) ( ON ?auto_2677160 ?auto_2677159 ) ( not ( = ?auto_2677159 ?auto_2677160 ) ) ( not ( = ?auto_2677159 ?auto_2677161 ) ) ( not ( = ?auto_2677163 ?auto_2677164 ) ) ( HOIST-AT ?auto_2677167 ?auto_2677163 ) ( not ( = ?auto_2677162 ?auto_2677167 ) ) ( AVAILABLE ?auto_2677167 ) ( SURFACE-AT ?auto_2677161 ?auto_2677163 ) ( ON ?auto_2677161 ?auto_2677166 ) ( CLEAR ?auto_2677161 ) ( not ( = ?auto_2677160 ?auto_2677166 ) ) ( not ( = ?auto_2677161 ?auto_2677166 ) ) ( not ( = ?auto_2677159 ?auto_2677166 ) ) ( TRUCK-AT ?auto_2677165 ?auto_2677164 ) ( ON ?auto_2677152 ?auto_2677151 ) ( ON ?auto_2677153 ?auto_2677152 ) ( ON ?auto_2677154 ?auto_2677153 ) ( ON ?auto_2677155 ?auto_2677154 ) ( ON ?auto_2677156 ?auto_2677155 ) ( ON ?auto_2677157 ?auto_2677156 ) ( ON ?auto_2677158 ?auto_2677157 ) ( ON ?auto_2677159 ?auto_2677158 ) ( not ( = ?auto_2677151 ?auto_2677152 ) ) ( not ( = ?auto_2677151 ?auto_2677153 ) ) ( not ( = ?auto_2677151 ?auto_2677154 ) ) ( not ( = ?auto_2677151 ?auto_2677155 ) ) ( not ( = ?auto_2677151 ?auto_2677156 ) ) ( not ( = ?auto_2677151 ?auto_2677157 ) ) ( not ( = ?auto_2677151 ?auto_2677158 ) ) ( not ( = ?auto_2677151 ?auto_2677159 ) ) ( not ( = ?auto_2677151 ?auto_2677160 ) ) ( not ( = ?auto_2677151 ?auto_2677161 ) ) ( not ( = ?auto_2677151 ?auto_2677166 ) ) ( not ( = ?auto_2677152 ?auto_2677153 ) ) ( not ( = ?auto_2677152 ?auto_2677154 ) ) ( not ( = ?auto_2677152 ?auto_2677155 ) ) ( not ( = ?auto_2677152 ?auto_2677156 ) ) ( not ( = ?auto_2677152 ?auto_2677157 ) ) ( not ( = ?auto_2677152 ?auto_2677158 ) ) ( not ( = ?auto_2677152 ?auto_2677159 ) ) ( not ( = ?auto_2677152 ?auto_2677160 ) ) ( not ( = ?auto_2677152 ?auto_2677161 ) ) ( not ( = ?auto_2677152 ?auto_2677166 ) ) ( not ( = ?auto_2677153 ?auto_2677154 ) ) ( not ( = ?auto_2677153 ?auto_2677155 ) ) ( not ( = ?auto_2677153 ?auto_2677156 ) ) ( not ( = ?auto_2677153 ?auto_2677157 ) ) ( not ( = ?auto_2677153 ?auto_2677158 ) ) ( not ( = ?auto_2677153 ?auto_2677159 ) ) ( not ( = ?auto_2677153 ?auto_2677160 ) ) ( not ( = ?auto_2677153 ?auto_2677161 ) ) ( not ( = ?auto_2677153 ?auto_2677166 ) ) ( not ( = ?auto_2677154 ?auto_2677155 ) ) ( not ( = ?auto_2677154 ?auto_2677156 ) ) ( not ( = ?auto_2677154 ?auto_2677157 ) ) ( not ( = ?auto_2677154 ?auto_2677158 ) ) ( not ( = ?auto_2677154 ?auto_2677159 ) ) ( not ( = ?auto_2677154 ?auto_2677160 ) ) ( not ( = ?auto_2677154 ?auto_2677161 ) ) ( not ( = ?auto_2677154 ?auto_2677166 ) ) ( not ( = ?auto_2677155 ?auto_2677156 ) ) ( not ( = ?auto_2677155 ?auto_2677157 ) ) ( not ( = ?auto_2677155 ?auto_2677158 ) ) ( not ( = ?auto_2677155 ?auto_2677159 ) ) ( not ( = ?auto_2677155 ?auto_2677160 ) ) ( not ( = ?auto_2677155 ?auto_2677161 ) ) ( not ( = ?auto_2677155 ?auto_2677166 ) ) ( not ( = ?auto_2677156 ?auto_2677157 ) ) ( not ( = ?auto_2677156 ?auto_2677158 ) ) ( not ( = ?auto_2677156 ?auto_2677159 ) ) ( not ( = ?auto_2677156 ?auto_2677160 ) ) ( not ( = ?auto_2677156 ?auto_2677161 ) ) ( not ( = ?auto_2677156 ?auto_2677166 ) ) ( not ( = ?auto_2677157 ?auto_2677158 ) ) ( not ( = ?auto_2677157 ?auto_2677159 ) ) ( not ( = ?auto_2677157 ?auto_2677160 ) ) ( not ( = ?auto_2677157 ?auto_2677161 ) ) ( not ( = ?auto_2677157 ?auto_2677166 ) ) ( not ( = ?auto_2677158 ?auto_2677159 ) ) ( not ( = ?auto_2677158 ?auto_2677160 ) ) ( not ( = ?auto_2677158 ?auto_2677161 ) ) ( not ( = ?auto_2677158 ?auto_2677166 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2677159 ?auto_2677160 ?auto_2677161 )
      ( MAKE-10CRATE-VERIFY ?auto_2677151 ?auto_2677152 ?auto_2677153 ?auto_2677154 ?auto_2677155 ?auto_2677156 ?auto_2677157 ?auto_2677158 ?auto_2677159 ?auto_2677160 ?auto_2677161 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2677277 - SURFACE
      ?auto_2677278 - SURFACE
      ?auto_2677279 - SURFACE
      ?auto_2677280 - SURFACE
      ?auto_2677281 - SURFACE
      ?auto_2677282 - SURFACE
      ?auto_2677283 - SURFACE
      ?auto_2677284 - SURFACE
      ?auto_2677285 - SURFACE
      ?auto_2677286 - SURFACE
      ?auto_2677287 - SURFACE
    )
    :vars
    (
      ?auto_2677293 - HOIST
      ?auto_2677289 - PLACE
      ?auto_2677290 - PLACE
      ?auto_2677291 - HOIST
      ?auto_2677292 - SURFACE
      ?auto_2677288 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2677293 ?auto_2677289 ) ( IS-CRATE ?auto_2677287 ) ( not ( = ?auto_2677286 ?auto_2677287 ) ) ( not ( = ?auto_2677285 ?auto_2677286 ) ) ( not ( = ?auto_2677285 ?auto_2677287 ) ) ( not ( = ?auto_2677290 ?auto_2677289 ) ) ( HOIST-AT ?auto_2677291 ?auto_2677290 ) ( not ( = ?auto_2677293 ?auto_2677291 ) ) ( AVAILABLE ?auto_2677291 ) ( SURFACE-AT ?auto_2677287 ?auto_2677290 ) ( ON ?auto_2677287 ?auto_2677292 ) ( CLEAR ?auto_2677287 ) ( not ( = ?auto_2677286 ?auto_2677292 ) ) ( not ( = ?auto_2677287 ?auto_2677292 ) ) ( not ( = ?auto_2677285 ?auto_2677292 ) ) ( TRUCK-AT ?auto_2677288 ?auto_2677289 ) ( SURFACE-AT ?auto_2677285 ?auto_2677289 ) ( CLEAR ?auto_2677285 ) ( LIFTING ?auto_2677293 ?auto_2677286 ) ( IS-CRATE ?auto_2677286 ) ( ON ?auto_2677278 ?auto_2677277 ) ( ON ?auto_2677279 ?auto_2677278 ) ( ON ?auto_2677280 ?auto_2677279 ) ( ON ?auto_2677281 ?auto_2677280 ) ( ON ?auto_2677282 ?auto_2677281 ) ( ON ?auto_2677283 ?auto_2677282 ) ( ON ?auto_2677284 ?auto_2677283 ) ( ON ?auto_2677285 ?auto_2677284 ) ( not ( = ?auto_2677277 ?auto_2677278 ) ) ( not ( = ?auto_2677277 ?auto_2677279 ) ) ( not ( = ?auto_2677277 ?auto_2677280 ) ) ( not ( = ?auto_2677277 ?auto_2677281 ) ) ( not ( = ?auto_2677277 ?auto_2677282 ) ) ( not ( = ?auto_2677277 ?auto_2677283 ) ) ( not ( = ?auto_2677277 ?auto_2677284 ) ) ( not ( = ?auto_2677277 ?auto_2677285 ) ) ( not ( = ?auto_2677277 ?auto_2677286 ) ) ( not ( = ?auto_2677277 ?auto_2677287 ) ) ( not ( = ?auto_2677277 ?auto_2677292 ) ) ( not ( = ?auto_2677278 ?auto_2677279 ) ) ( not ( = ?auto_2677278 ?auto_2677280 ) ) ( not ( = ?auto_2677278 ?auto_2677281 ) ) ( not ( = ?auto_2677278 ?auto_2677282 ) ) ( not ( = ?auto_2677278 ?auto_2677283 ) ) ( not ( = ?auto_2677278 ?auto_2677284 ) ) ( not ( = ?auto_2677278 ?auto_2677285 ) ) ( not ( = ?auto_2677278 ?auto_2677286 ) ) ( not ( = ?auto_2677278 ?auto_2677287 ) ) ( not ( = ?auto_2677278 ?auto_2677292 ) ) ( not ( = ?auto_2677279 ?auto_2677280 ) ) ( not ( = ?auto_2677279 ?auto_2677281 ) ) ( not ( = ?auto_2677279 ?auto_2677282 ) ) ( not ( = ?auto_2677279 ?auto_2677283 ) ) ( not ( = ?auto_2677279 ?auto_2677284 ) ) ( not ( = ?auto_2677279 ?auto_2677285 ) ) ( not ( = ?auto_2677279 ?auto_2677286 ) ) ( not ( = ?auto_2677279 ?auto_2677287 ) ) ( not ( = ?auto_2677279 ?auto_2677292 ) ) ( not ( = ?auto_2677280 ?auto_2677281 ) ) ( not ( = ?auto_2677280 ?auto_2677282 ) ) ( not ( = ?auto_2677280 ?auto_2677283 ) ) ( not ( = ?auto_2677280 ?auto_2677284 ) ) ( not ( = ?auto_2677280 ?auto_2677285 ) ) ( not ( = ?auto_2677280 ?auto_2677286 ) ) ( not ( = ?auto_2677280 ?auto_2677287 ) ) ( not ( = ?auto_2677280 ?auto_2677292 ) ) ( not ( = ?auto_2677281 ?auto_2677282 ) ) ( not ( = ?auto_2677281 ?auto_2677283 ) ) ( not ( = ?auto_2677281 ?auto_2677284 ) ) ( not ( = ?auto_2677281 ?auto_2677285 ) ) ( not ( = ?auto_2677281 ?auto_2677286 ) ) ( not ( = ?auto_2677281 ?auto_2677287 ) ) ( not ( = ?auto_2677281 ?auto_2677292 ) ) ( not ( = ?auto_2677282 ?auto_2677283 ) ) ( not ( = ?auto_2677282 ?auto_2677284 ) ) ( not ( = ?auto_2677282 ?auto_2677285 ) ) ( not ( = ?auto_2677282 ?auto_2677286 ) ) ( not ( = ?auto_2677282 ?auto_2677287 ) ) ( not ( = ?auto_2677282 ?auto_2677292 ) ) ( not ( = ?auto_2677283 ?auto_2677284 ) ) ( not ( = ?auto_2677283 ?auto_2677285 ) ) ( not ( = ?auto_2677283 ?auto_2677286 ) ) ( not ( = ?auto_2677283 ?auto_2677287 ) ) ( not ( = ?auto_2677283 ?auto_2677292 ) ) ( not ( = ?auto_2677284 ?auto_2677285 ) ) ( not ( = ?auto_2677284 ?auto_2677286 ) ) ( not ( = ?auto_2677284 ?auto_2677287 ) ) ( not ( = ?auto_2677284 ?auto_2677292 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2677285 ?auto_2677286 ?auto_2677287 )
      ( MAKE-10CRATE-VERIFY ?auto_2677277 ?auto_2677278 ?auto_2677279 ?auto_2677280 ?auto_2677281 ?auto_2677282 ?auto_2677283 ?auto_2677284 ?auto_2677285 ?auto_2677286 ?auto_2677287 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2677403 - SURFACE
      ?auto_2677404 - SURFACE
      ?auto_2677405 - SURFACE
      ?auto_2677406 - SURFACE
      ?auto_2677407 - SURFACE
      ?auto_2677408 - SURFACE
      ?auto_2677409 - SURFACE
      ?auto_2677410 - SURFACE
      ?auto_2677411 - SURFACE
      ?auto_2677412 - SURFACE
      ?auto_2677413 - SURFACE
    )
    :vars
    (
      ?auto_2677419 - HOIST
      ?auto_2677418 - PLACE
      ?auto_2677416 - PLACE
      ?auto_2677417 - HOIST
      ?auto_2677414 - SURFACE
      ?auto_2677415 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2677419 ?auto_2677418 ) ( IS-CRATE ?auto_2677413 ) ( not ( = ?auto_2677412 ?auto_2677413 ) ) ( not ( = ?auto_2677411 ?auto_2677412 ) ) ( not ( = ?auto_2677411 ?auto_2677413 ) ) ( not ( = ?auto_2677416 ?auto_2677418 ) ) ( HOIST-AT ?auto_2677417 ?auto_2677416 ) ( not ( = ?auto_2677419 ?auto_2677417 ) ) ( AVAILABLE ?auto_2677417 ) ( SURFACE-AT ?auto_2677413 ?auto_2677416 ) ( ON ?auto_2677413 ?auto_2677414 ) ( CLEAR ?auto_2677413 ) ( not ( = ?auto_2677412 ?auto_2677414 ) ) ( not ( = ?auto_2677413 ?auto_2677414 ) ) ( not ( = ?auto_2677411 ?auto_2677414 ) ) ( TRUCK-AT ?auto_2677415 ?auto_2677418 ) ( SURFACE-AT ?auto_2677411 ?auto_2677418 ) ( CLEAR ?auto_2677411 ) ( IS-CRATE ?auto_2677412 ) ( AVAILABLE ?auto_2677419 ) ( IN ?auto_2677412 ?auto_2677415 ) ( ON ?auto_2677404 ?auto_2677403 ) ( ON ?auto_2677405 ?auto_2677404 ) ( ON ?auto_2677406 ?auto_2677405 ) ( ON ?auto_2677407 ?auto_2677406 ) ( ON ?auto_2677408 ?auto_2677407 ) ( ON ?auto_2677409 ?auto_2677408 ) ( ON ?auto_2677410 ?auto_2677409 ) ( ON ?auto_2677411 ?auto_2677410 ) ( not ( = ?auto_2677403 ?auto_2677404 ) ) ( not ( = ?auto_2677403 ?auto_2677405 ) ) ( not ( = ?auto_2677403 ?auto_2677406 ) ) ( not ( = ?auto_2677403 ?auto_2677407 ) ) ( not ( = ?auto_2677403 ?auto_2677408 ) ) ( not ( = ?auto_2677403 ?auto_2677409 ) ) ( not ( = ?auto_2677403 ?auto_2677410 ) ) ( not ( = ?auto_2677403 ?auto_2677411 ) ) ( not ( = ?auto_2677403 ?auto_2677412 ) ) ( not ( = ?auto_2677403 ?auto_2677413 ) ) ( not ( = ?auto_2677403 ?auto_2677414 ) ) ( not ( = ?auto_2677404 ?auto_2677405 ) ) ( not ( = ?auto_2677404 ?auto_2677406 ) ) ( not ( = ?auto_2677404 ?auto_2677407 ) ) ( not ( = ?auto_2677404 ?auto_2677408 ) ) ( not ( = ?auto_2677404 ?auto_2677409 ) ) ( not ( = ?auto_2677404 ?auto_2677410 ) ) ( not ( = ?auto_2677404 ?auto_2677411 ) ) ( not ( = ?auto_2677404 ?auto_2677412 ) ) ( not ( = ?auto_2677404 ?auto_2677413 ) ) ( not ( = ?auto_2677404 ?auto_2677414 ) ) ( not ( = ?auto_2677405 ?auto_2677406 ) ) ( not ( = ?auto_2677405 ?auto_2677407 ) ) ( not ( = ?auto_2677405 ?auto_2677408 ) ) ( not ( = ?auto_2677405 ?auto_2677409 ) ) ( not ( = ?auto_2677405 ?auto_2677410 ) ) ( not ( = ?auto_2677405 ?auto_2677411 ) ) ( not ( = ?auto_2677405 ?auto_2677412 ) ) ( not ( = ?auto_2677405 ?auto_2677413 ) ) ( not ( = ?auto_2677405 ?auto_2677414 ) ) ( not ( = ?auto_2677406 ?auto_2677407 ) ) ( not ( = ?auto_2677406 ?auto_2677408 ) ) ( not ( = ?auto_2677406 ?auto_2677409 ) ) ( not ( = ?auto_2677406 ?auto_2677410 ) ) ( not ( = ?auto_2677406 ?auto_2677411 ) ) ( not ( = ?auto_2677406 ?auto_2677412 ) ) ( not ( = ?auto_2677406 ?auto_2677413 ) ) ( not ( = ?auto_2677406 ?auto_2677414 ) ) ( not ( = ?auto_2677407 ?auto_2677408 ) ) ( not ( = ?auto_2677407 ?auto_2677409 ) ) ( not ( = ?auto_2677407 ?auto_2677410 ) ) ( not ( = ?auto_2677407 ?auto_2677411 ) ) ( not ( = ?auto_2677407 ?auto_2677412 ) ) ( not ( = ?auto_2677407 ?auto_2677413 ) ) ( not ( = ?auto_2677407 ?auto_2677414 ) ) ( not ( = ?auto_2677408 ?auto_2677409 ) ) ( not ( = ?auto_2677408 ?auto_2677410 ) ) ( not ( = ?auto_2677408 ?auto_2677411 ) ) ( not ( = ?auto_2677408 ?auto_2677412 ) ) ( not ( = ?auto_2677408 ?auto_2677413 ) ) ( not ( = ?auto_2677408 ?auto_2677414 ) ) ( not ( = ?auto_2677409 ?auto_2677410 ) ) ( not ( = ?auto_2677409 ?auto_2677411 ) ) ( not ( = ?auto_2677409 ?auto_2677412 ) ) ( not ( = ?auto_2677409 ?auto_2677413 ) ) ( not ( = ?auto_2677409 ?auto_2677414 ) ) ( not ( = ?auto_2677410 ?auto_2677411 ) ) ( not ( = ?auto_2677410 ?auto_2677412 ) ) ( not ( = ?auto_2677410 ?auto_2677413 ) ) ( not ( = ?auto_2677410 ?auto_2677414 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2677411 ?auto_2677412 ?auto_2677413 )
      ( MAKE-10CRATE-VERIFY ?auto_2677403 ?auto_2677404 ?auto_2677405 ?auto_2677406 ?auto_2677407 ?auto_2677408 ?auto_2677409 ?auto_2677410 ?auto_2677411 ?auto_2677412 ?auto_2677413 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2684665 - SURFACE
      ?auto_2684666 - SURFACE
      ?auto_2684667 - SURFACE
      ?auto_2684668 - SURFACE
      ?auto_2684669 - SURFACE
      ?auto_2684670 - SURFACE
      ?auto_2684671 - SURFACE
      ?auto_2684672 - SURFACE
      ?auto_2684673 - SURFACE
      ?auto_2684674 - SURFACE
      ?auto_2684675 - SURFACE
      ?auto_2684676 - SURFACE
    )
    :vars
    (
      ?auto_2684677 - HOIST
      ?auto_2684678 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2684677 ?auto_2684678 ) ( SURFACE-AT ?auto_2684675 ?auto_2684678 ) ( CLEAR ?auto_2684675 ) ( LIFTING ?auto_2684677 ?auto_2684676 ) ( IS-CRATE ?auto_2684676 ) ( not ( = ?auto_2684675 ?auto_2684676 ) ) ( ON ?auto_2684666 ?auto_2684665 ) ( ON ?auto_2684667 ?auto_2684666 ) ( ON ?auto_2684668 ?auto_2684667 ) ( ON ?auto_2684669 ?auto_2684668 ) ( ON ?auto_2684670 ?auto_2684669 ) ( ON ?auto_2684671 ?auto_2684670 ) ( ON ?auto_2684672 ?auto_2684671 ) ( ON ?auto_2684673 ?auto_2684672 ) ( ON ?auto_2684674 ?auto_2684673 ) ( ON ?auto_2684675 ?auto_2684674 ) ( not ( = ?auto_2684665 ?auto_2684666 ) ) ( not ( = ?auto_2684665 ?auto_2684667 ) ) ( not ( = ?auto_2684665 ?auto_2684668 ) ) ( not ( = ?auto_2684665 ?auto_2684669 ) ) ( not ( = ?auto_2684665 ?auto_2684670 ) ) ( not ( = ?auto_2684665 ?auto_2684671 ) ) ( not ( = ?auto_2684665 ?auto_2684672 ) ) ( not ( = ?auto_2684665 ?auto_2684673 ) ) ( not ( = ?auto_2684665 ?auto_2684674 ) ) ( not ( = ?auto_2684665 ?auto_2684675 ) ) ( not ( = ?auto_2684665 ?auto_2684676 ) ) ( not ( = ?auto_2684666 ?auto_2684667 ) ) ( not ( = ?auto_2684666 ?auto_2684668 ) ) ( not ( = ?auto_2684666 ?auto_2684669 ) ) ( not ( = ?auto_2684666 ?auto_2684670 ) ) ( not ( = ?auto_2684666 ?auto_2684671 ) ) ( not ( = ?auto_2684666 ?auto_2684672 ) ) ( not ( = ?auto_2684666 ?auto_2684673 ) ) ( not ( = ?auto_2684666 ?auto_2684674 ) ) ( not ( = ?auto_2684666 ?auto_2684675 ) ) ( not ( = ?auto_2684666 ?auto_2684676 ) ) ( not ( = ?auto_2684667 ?auto_2684668 ) ) ( not ( = ?auto_2684667 ?auto_2684669 ) ) ( not ( = ?auto_2684667 ?auto_2684670 ) ) ( not ( = ?auto_2684667 ?auto_2684671 ) ) ( not ( = ?auto_2684667 ?auto_2684672 ) ) ( not ( = ?auto_2684667 ?auto_2684673 ) ) ( not ( = ?auto_2684667 ?auto_2684674 ) ) ( not ( = ?auto_2684667 ?auto_2684675 ) ) ( not ( = ?auto_2684667 ?auto_2684676 ) ) ( not ( = ?auto_2684668 ?auto_2684669 ) ) ( not ( = ?auto_2684668 ?auto_2684670 ) ) ( not ( = ?auto_2684668 ?auto_2684671 ) ) ( not ( = ?auto_2684668 ?auto_2684672 ) ) ( not ( = ?auto_2684668 ?auto_2684673 ) ) ( not ( = ?auto_2684668 ?auto_2684674 ) ) ( not ( = ?auto_2684668 ?auto_2684675 ) ) ( not ( = ?auto_2684668 ?auto_2684676 ) ) ( not ( = ?auto_2684669 ?auto_2684670 ) ) ( not ( = ?auto_2684669 ?auto_2684671 ) ) ( not ( = ?auto_2684669 ?auto_2684672 ) ) ( not ( = ?auto_2684669 ?auto_2684673 ) ) ( not ( = ?auto_2684669 ?auto_2684674 ) ) ( not ( = ?auto_2684669 ?auto_2684675 ) ) ( not ( = ?auto_2684669 ?auto_2684676 ) ) ( not ( = ?auto_2684670 ?auto_2684671 ) ) ( not ( = ?auto_2684670 ?auto_2684672 ) ) ( not ( = ?auto_2684670 ?auto_2684673 ) ) ( not ( = ?auto_2684670 ?auto_2684674 ) ) ( not ( = ?auto_2684670 ?auto_2684675 ) ) ( not ( = ?auto_2684670 ?auto_2684676 ) ) ( not ( = ?auto_2684671 ?auto_2684672 ) ) ( not ( = ?auto_2684671 ?auto_2684673 ) ) ( not ( = ?auto_2684671 ?auto_2684674 ) ) ( not ( = ?auto_2684671 ?auto_2684675 ) ) ( not ( = ?auto_2684671 ?auto_2684676 ) ) ( not ( = ?auto_2684672 ?auto_2684673 ) ) ( not ( = ?auto_2684672 ?auto_2684674 ) ) ( not ( = ?auto_2684672 ?auto_2684675 ) ) ( not ( = ?auto_2684672 ?auto_2684676 ) ) ( not ( = ?auto_2684673 ?auto_2684674 ) ) ( not ( = ?auto_2684673 ?auto_2684675 ) ) ( not ( = ?auto_2684673 ?auto_2684676 ) ) ( not ( = ?auto_2684674 ?auto_2684675 ) ) ( not ( = ?auto_2684674 ?auto_2684676 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2684675 ?auto_2684676 )
      ( MAKE-11CRATE-VERIFY ?auto_2684665 ?auto_2684666 ?auto_2684667 ?auto_2684668 ?auto_2684669 ?auto_2684670 ?auto_2684671 ?auto_2684672 ?auto_2684673 ?auto_2684674 ?auto_2684675 ?auto_2684676 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2684774 - SURFACE
      ?auto_2684775 - SURFACE
      ?auto_2684776 - SURFACE
      ?auto_2684777 - SURFACE
      ?auto_2684778 - SURFACE
      ?auto_2684779 - SURFACE
      ?auto_2684780 - SURFACE
      ?auto_2684781 - SURFACE
      ?auto_2684782 - SURFACE
      ?auto_2684783 - SURFACE
      ?auto_2684784 - SURFACE
      ?auto_2684785 - SURFACE
    )
    :vars
    (
      ?auto_2684787 - HOIST
      ?auto_2684788 - PLACE
      ?auto_2684786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2684787 ?auto_2684788 ) ( SURFACE-AT ?auto_2684784 ?auto_2684788 ) ( CLEAR ?auto_2684784 ) ( IS-CRATE ?auto_2684785 ) ( not ( = ?auto_2684784 ?auto_2684785 ) ) ( TRUCK-AT ?auto_2684786 ?auto_2684788 ) ( AVAILABLE ?auto_2684787 ) ( IN ?auto_2684785 ?auto_2684786 ) ( ON ?auto_2684784 ?auto_2684783 ) ( not ( = ?auto_2684783 ?auto_2684784 ) ) ( not ( = ?auto_2684783 ?auto_2684785 ) ) ( ON ?auto_2684775 ?auto_2684774 ) ( ON ?auto_2684776 ?auto_2684775 ) ( ON ?auto_2684777 ?auto_2684776 ) ( ON ?auto_2684778 ?auto_2684777 ) ( ON ?auto_2684779 ?auto_2684778 ) ( ON ?auto_2684780 ?auto_2684779 ) ( ON ?auto_2684781 ?auto_2684780 ) ( ON ?auto_2684782 ?auto_2684781 ) ( ON ?auto_2684783 ?auto_2684782 ) ( not ( = ?auto_2684774 ?auto_2684775 ) ) ( not ( = ?auto_2684774 ?auto_2684776 ) ) ( not ( = ?auto_2684774 ?auto_2684777 ) ) ( not ( = ?auto_2684774 ?auto_2684778 ) ) ( not ( = ?auto_2684774 ?auto_2684779 ) ) ( not ( = ?auto_2684774 ?auto_2684780 ) ) ( not ( = ?auto_2684774 ?auto_2684781 ) ) ( not ( = ?auto_2684774 ?auto_2684782 ) ) ( not ( = ?auto_2684774 ?auto_2684783 ) ) ( not ( = ?auto_2684774 ?auto_2684784 ) ) ( not ( = ?auto_2684774 ?auto_2684785 ) ) ( not ( = ?auto_2684775 ?auto_2684776 ) ) ( not ( = ?auto_2684775 ?auto_2684777 ) ) ( not ( = ?auto_2684775 ?auto_2684778 ) ) ( not ( = ?auto_2684775 ?auto_2684779 ) ) ( not ( = ?auto_2684775 ?auto_2684780 ) ) ( not ( = ?auto_2684775 ?auto_2684781 ) ) ( not ( = ?auto_2684775 ?auto_2684782 ) ) ( not ( = ?auto_2684775 ?auto_2684783 ) ) ( not ( = ?auto_2684775 ?auto_2684784 ) ) ( not ( = ?auto_2684775 ?auto_2684785 ) ) ( not ( = ?auto_2684776 ?auto_2684777 ) ) ( not ( = ?auto_2684776 ?auto_2684778 ) ) ( not ( = ?auto_2684776 ?auto_2684779 ) ) ( not ( = ?auto_2684776 ?auto_2684780 ) ) ( not ( = ?auto_2684776 ?auto_2684781 ) ) ( not ( = ?auto_2684776 ?auto_2684782 ) ) ( not ( = ?auto_2684776 ?auto_2684783 ) ) ( not ( = ?auto_2684776 ?auto_2684784 ) ) ( not ( = ?auto_2684776 ?auto_2684785 ) ) ( not ( = ?auto_2684777 ?auto_2684778 ) ) ( not ( = ?auto_2684777 ?auto_2684779 ) ) ( not ( = ?auto_2684777 ?auto_2684780 ) ) ( not ( = ?auto_2684777 ?auto_2684781 ) ) ( not ( = ?auto_2684777 ?auto_2684782 ) ) ( not ( = ?auto_2684777 ?auto_2684783 ) ) ( not ( = ?auto_2684777 ?auto_2684784 ) ) ( not ( = ?auto_2684777 ?auto_2684785 ) ) ( not ( = ?auto_2684778 ?auto_2684779 ) ) ( not ( = ?auto_2684778 ?auto_2684780 ) ) ( not ( = ?auto_2684778 ?auto_2684781 ) ) ( not ( = ?auto_2684778 ?auto_2684782 ) ) ( not ( = ?auto_2684778 ?auto_2684783 ) ) ( not ( = ?auto_2684778 ?auto_2684784 ) ) ( not ( = ?auto_2684778 ?auto_2684785 ) ) ( not ( = ?auto_2684779 ?auto_2684780 ) ) ( not ( = ?auto_2684779 ?auto_2684781 ) ) ( not ( = ?auto_2684779 ?auto_2684782 ) ) ( not ( = ?auto_2684779 ?auto_2684783 ) ) ( not ( = ?auto_2684779 ?auto_2684784 ) ) ( not ( = ?auto_2684779 ?auto_2684785 ) ) ( not ( = ?auto_2684780 ?auto_2684781 ) ) ( not ( = ?auto_2684780 ?auto_2684782 ) ) ( not ( = ?auto_2684780 ?auto_2684783 ) ) ( not ( = ?auto_2684780 ?auto_2684784 ) ) ( not ( = ?auto_2684780 ?auto_2684785 ) ) ( not ( = ?auto_2684781 ?auto_2684782 ) ) ( not ( = ?auto_2684781 ?auto_2684783 ) ) ( not ( = ?auto_2684781 ?auto_2684784 ) ) ( not ( = ?auto_2684781 ?auto_2684785 ) ) ( not ( = ?auto_2684782 ?auto_2684783 ) ) ( not ( = ?auto_2684782 ?auto_2684784 ) ) ( not ( = ?auto_2684782 ?auto_2684785 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2684783 ?auto_2684784 ?auto_2684785 )
      ( MAKE-11CRATE-VERIFY ?auto_2684774 ?auto_2684775 ?auto_2684776 ?auto_2684777 ?auto_2684778 ?auto_2684779 ?auto_2684780 ?auto_2684781 ?auto_2684782 ?auto_2684783 ?auto_2684784 ?auto_2684785 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2684895 - SURFACE
      ?auto_2684896 - SURFACE
      ?auto_2684897 - SURFACE
      ?auto_2684898 - SURFACE
      ?auto_2684899 - SURFACE
      ?auto_2684900 - SURFACE
      ?auto_2684901 - SURFACE
      ?auto_2684902 - SURFACE
      ?auto_2684903 - SURFACE
      ?auto_2684904 - SURFACE
      ?auto_2684905 - SURFACE
      ?auto_2684906 - SURFACE
    )
    :vars
    (
      ?auto_2684907 - HOIST
      ?auto_2684909 - PLACE
      ?auto_2684910 - TRUCK
      ?auto_2684908 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2684907 ?auto_2684909 ) ( SURFACE-AT ?auto_2684905 ?auto_2684909 ) ( CLEAR ?auto_2684905 ) ( IS-CRATE ?auto_2684906 ) ( not ( = ?auto_2684905 ?auto_2684906 ) ) ( AVAILABLE ?auto_2684907 ) ( IN ?auto_2684906 ?auto_2684910 ) ( ON ?auto_2684905 ?auto_2684904 ) ( not ( = ?auto_2684904 ?auto_2684905 ) ) ( not ( = ?auto_2684904 ?auto_2684906 ) ) ( TRUCK-AT ?auto_2684910 ?auto_2684908 ) ( not ( = ?auto_2684908 ?auto_2684909 ) ) ( ON ?auto_2684896 ?auto_2684895 ) ( ON ?auto_2684897 ?auto_2684896 ) ( ON ?auto_2684898 ?auto_2684897 ) ( ON ?auto_2684899 ?auto_2684898 ) ( ON ?auto_2684900 ?auto_2684899 ) ( ON ?auto_2684901 ?auto_2684900 ) ( ON ?auto_2684902 ?auto_2684901 ) ( ON ?auto_2684903 ?auto_2684902 ) ( ON ?auto_2684904 ?auto_2684903 ) ( not ( = ?auto_2684895 ?auto_2684896 ) ) ( not ( = ?auto_2684895 ?auto_2684897 ) ) ( not ( = ?auto_2684895 ?auto_2684898 ) ) ( not ( = ?auto_2684895 ?auto_2684899 ) ) ( not ( = ?auto_2684895 ?auto_2684900 ) ) ( not ( = ?auto_2684895 ?auto_2684901 ) ) ( not ( = ?auto_2684895 ?auto_2684902 ) ) ( not ( = ?auto_2684895 ?auto_2684903 ) ) ( not ( = ?auto_2684895 ?auto_2684904 ) ) ( not ( = ?auto_2684895 ?auto_2684905 ) ) ( not ( = ?auto_2684895 ?auto_2684906 ) ) ( not ( = ?auto_2684896 ?auto_2684897 ) ) ( not ( = ?auto_2684896 ?auto_2684898 ) ) ( not ( = ?auto_2684896 ?auto_2684899 ) ) ( not ( = ?auto_2684896 ?auto_2684900 ) ) ( not ( = ?auto_2684896 ?auto_2684901 ) ) ( not ( = ?auto_2684896 ?auto_2684902 ) ) ( not ( = ?auto_2684896 ?auto_2684903 ) ) ( not ( = ?auto_2684896 ?auto_2684904 ) ) ( not ( = ?auto_2684896 ?auto_2684905 ) ) ( not ( = ?auto_2684896 ?auto_2684906 ) ) ( not ( = ?auto_2684897 ?auto_2684898 ) ) ( not ( = ?auto_2684897 ?auto_2684899 ) ) ( not ( = ?auto_2684897 ?auto_2684900 ) ) ( not ( = ?auto_2684897 ?auto_2684901 ) ) ( not ( = ?auto_2684897 ?auto_2684902 ) ) ( not ( = ?auto_2684897 ?auto_2684903 ) ) ( not ( = ?auto_2684897 ?auto_2684904 ) ) ( not ( = ?auto_2684897 ?auto_2684905 ) ) ( not ( = ?auto_2684897 ?auto_2684906 ) ) ( not ( = ?auto_2684898 ?auto_2684899 ) ) ( not ( = ?auto_2684898 ?auto_2684900 ) ) ( not ( = ?auto_2684898 ?auto_2684901 ) ) ( not ( = ?auto_2684898 ?auto_2684902 ) ) ( not ( = ?auto_2684898 ?auto_2684903 ) ) ( not ( = ?auto_2684898 ?auto_2684904 ) ) ( not ( = ?auto_2684898 ?auto_2684905 ) ) ( not ( = ?auto_2684898 ?auto_2684906 ) ) ( not ( = ?auto_2684899 ?auto_2684900 ) ) ( not ( = ?auto_2684899 ?auto_2684901 ) ) ( not ( = ?auto_2684899 ?auto_2684902 ) ) ( not ( = ?auto_2684899 ?auto_2684903 ) ) ( not ( = ?auto_2684899 ?auto_2684904 ) ) ( not ( = ?auto_2684899 ?auto_2684905 ) ) ( not ( = ?auto_2684899 ?auto_2684906 ) ) ( not ( = ?auto_2684900 ?auto_2684901 ) ) ( not ( = ?auto_2684900 ?auto_2684902 ) ) ( not ( = ?auto_2684900 ?auto_2684903 ) ) ( not ( = ?auto_2684900 ?auto_2684904 ) ) ( not ( = ?auto_2684900 ?auto_2684905 ) ) ( not ( = ?auto_2684900 ?auto_2684906 ) ) ( not ( = ?auto_2684901 ?auto_2684902 ) ) ( not ( = ?auto_2684901 ?auto_2684903 ) ) ( not ( = ?auto_2684901 ?auto_2684904 ) ) ( not ( = ?auto_2684901 ?auto_2684905 ) ) ( not ( = ?auto_2684901 ?auto_2684906 ) ) ( not ( = ?auto_2684902 ?auto_2684903 ) ) ( not ( = ?auto_2684902 ?auto_2684904 ) ) ( not ( = ?auto_2684902 ?auto_2684905 ) ) ( not ( = ?auto_2684902 ?auto_2684906 ) ) ( not ( = ?auto_2684903 ?auto_2684904 ) ) ( not ( = ?auto_2684903 ?auto_2684905 ) ) ( not ( = ?auto_2684903 ?auto_2684906 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2684904 ?auto_2684905 ?auto_2684906 )
      ( MAKE-11CRATE-VERIFY ?auto_2684895 ?auto_2684896 ?auto_2684897 ?auto_2684898 ?auto_2684899 ?auto_2684900 ?auto_2684901 ?auto_2684902 ?auto_2684903 ?auto_2684904 ?auto_2684905 ?auto_2684906 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2685027 - SURFACE
      ?auto_2685028 - SURFACE
      ?auto_2685029 - SURFACE
      ?auto_2685030 - SURFACE
      ?auto_2685031 - SURFACE
      ?auto_2685032 - SURFACE
      ?auto_2685033 - SURFACE
      ?auto_2685034 - SURFACE
      ?auto_2685035 - SURFACE
      ?auto_2685036 - SURFACE
      ?auto_2685037 - SURFACE
      ?auto_2685038 - SURFACE
    )
    :vars
    (
      ?auto_2685040 - HOIST
      ?auto_2685041 - PLACE
      ?auto_2685042 - TRUCK
      ?auto_2685043 - PLACE
      ?auto_2685039 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2685040 ?auto_2685041 ) ( SURFACE-AT ?auto_2685037 ?auto_2685041 ) ( CLEAR ?auto_2685037 ) ( IS-CRATE ?auto_2685038 ) ( not ( = ?auto_2685037 ?auto_2685038 ) ) ( AVAILABLE ?auto_2685040 ) ( ON ?auto_2685037 ?auto_2685036 ) ( not ( = ?auto_2685036 ?auto_2685037 ) ) ( not ( = ?auto_2685036 ?auto_2685038 ) ) ( TRUCK-AT ?auto_2685042 ?auto_2685043 ) ( not ( = ?auto_2685043 ?auto_2685041 ) ) ( HOIST-AT ?auto_2685039 ?auto_2685043 ) ( LIFTING ?auto_2685039 ?auto_2685038 ) ( not ( = ?auto_2685040 ?auto_2685039 ) ) ( ON ?auto_2685028 ?auto_2685027 ) ( ON ?auto_2685029 ?auto_2685028 ) ( ON ?auto_2685030 ?auto_2685029 ) ( ON ?auto_2685031 ?auto_2685030 ) ( ON ?auto_2685032 ?auto_2685031 ) ( ON ?auto_2685033 ?auto_2685032 ) ( ON ?auto_2685034 ?auto_2685033 ) ( ON ?auto_2685035 ?auto_2685034 ) ( ON ?auto_2685036 ?auto_2685035 ) ( not ( = ?auto_2685027 ?auto_2685028 ) ) ( not ( = ?auto_2685027 ?auto_2685029 ) ) ( not ( = ?auto_2685027 ?auto_2685030 ) ) ( not ( = ?auto_2685027 ?auto_2685031 ) ) ( not ( = ?auto_2685027 ?auto_2685032 ) ) ( not ( = ?auto_2685027 ?auto_2685033 ) ) ( not ( = ?auto_2685027 ?auto_2685034 ) ) ( not ( = ?auto_2685027 ?auto_2685035 ) ) ( not ( = ?auto_2685027 ?auto_2685036 ) ) ( not ( = ?auto_2685027 ?auto_2685037 ) ) ( not ( = ?auto_2685027 ?auto_2685038 ) ) ( not ( = ?auto_2685028 ?auto_2685029 ) ) ( not ( = ?auto_2685028 ?auto_2685030 ) ) ( not ( = ?auto_2685028 ?auto_2685031 ) ) ( not ( = ?auto_2685028 ?auto_2685032 ) ) ( not ( = ?auto_2685028 ?auto_2685033 ) ) ( not ( = ?auto_2685028 ?auto_2685034 ) ) ( not ( = ?auto_2685028 ?auto_2685035 ) ) ( not ( = ?auto_2685028 ?auto_2685036 ) ) ( not ( = ?auto_2685028 ?auto_2685037 ) ) ( not ( = ?auto_2685028 ?auto_2685038 ) ) ( not ( = ?auto_2685029 ?auto_2685030 ) ) ( not ( = ?auto_2685029 ?auto_2685031 ) ) ( not ( = ?auto_2685029 ?auto_2685032 ) ) ( not ( = ?auto_2685029 ?auto_2685033 ) ) ( not ( = ?auto_2685029 ?auto_2685034 ) ) ( not ( = ?auto_2685029 ?auto_2685035 ) ) ( not ( = ?auto_2685029 ?auto_2685036 ) ) ( not ( = ?auto_2685029 ?auto_2685037 ) ) ( not ( = ?auto_2685029 ?auto_2685038 ) ) ( not ( = ?auto_2685030 ?auto_2685031 ) ) ( not ( = ?auto_2685030 ?auto_2685032 ) ) ( not ( = ?auto_2685030 ?auto_2685033 ) ) ( not ( = ?auto_2685030 ?auto_2685034 ) ) ( not ( = ?auto_2685030 ?auto_2685035 ) ) ( not ( = ?auto_2685030 ?auto_2685036 ) ) ( not ( = ?auto_2685030 ?auto_2685037 ) ) ( not ( = ?auto_2685030 ?auto_2685038 ) ) ( not ( = ?auto_2685031 ?auto_2685032 ) ) ( not ( = ?auto_2685031 ?auto_2685033 ) ) ( not ( = ?auto_2685031 ?auto_2685034 ) ) ( not ( = ?auto_2685031 ?auto_2685035 ) ) ( not ( = ?auto_2685031 ?auto_2685036 ) ) ( not ( = ?auto_2685031 ?auto_2685037 ) ) ( not ( = ?auto_2685031 ?auto_2685038 ) ) ( not ( = ?auto_2685032 ?auto_2685033 ) ) ( not ( = ?auto_2685032 ?auto_2685034 ) ) ( not ( = ?auto_2685032 ?auto_2685035 ) ) ( not ( = ?auto_2685032 ?auto_2685036 ) ) ( not ( = ?auto_2685032 ?auto_2685037 ) ) ( not ( = ?auto_2685032 ?auto_2685038 ) ) ( not ( = ?auto_2685033 ?auto_2685034 ) ) ( not ( = ?auto_2685033 ?auto_2685035 ) ) ( not ( = ?auto_2685033 ?auto_2685036 ) ) ( not ( = ?auto_2685033 ?auto_2685037 ) ) ( not ( = ?auto_2685033 ?auto_2685038 ) ) ( not ( = ?auto_2685034 ?auto_2685035 ) ) ( not ( = ?auto_2685034 ?auto_2685036 ) ) ( not ( = ?auto_2685034 ?auto_2685037 ) ) ( not ( = ?auto_2685034 ?auto_2685038 ) ) ( not ( = ?auto_2685035 ?auto_2685036 ) ) ( not ( = ?auto_2685035 ?auto_2685037 ) ) ( not ( = ?auto_2685035 ?auto_2685038 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2685036 ?auto_2685037 ?auto_2685038 )
      ( MAKE-11CRATE-VERIFY ?auto_2685027 ?auto_2685028 ?auto_2685029 ?auto_2685030 ?auto_2685031 ?auto_2685032 ?auto_2685033 ?auto_2685034 ?auto_2685035 ?auto_2685036 ?auto_2685037 ?auto_2685038 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2685170 - SURFACE
      ?auto_2685171 - SURFACE
      ?auto_2685172 - SURFACE
      ?auto_2685173 - SURFACE
      ?auto_2685174 - SURFACE
      ?auto_2685175 - SURFACE
      ?auto_2685176 - SURFACE
      ?auto_2685177 - SURFACE
      ?auto_2685178 - SURFACE
      ?auto_2685179 - SURFACE
      ?auto_2685180 - SURFACE
      ?auto_2685181 - SURFACE
    )
    :vars
    (
      ?auto_2685187 - HOIST
      ?auto_2685185 - PLACE
      ?auto_2685184 - TRUCK
      ?auto_2685182 - PLACE
      ?auto_2685183 - HOIST
      ?auto_2685186 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2685187 ?auto_2685185 ) ( SURFACE-AT ?auto_2685180 ?auto_2685185 ) ( CLEAR ?auto_2685180 ) ( IS-CRATE ?auto_2685181 ) ( not ( = ?auto_2685180 ?auto_2685181 ) ) ( AVAILABLE ?auto_2685187 ) ( ON ?auto_2685180 ?auto_2685179 ) ( not ( = ?auto_2685179 ?auto_2685180 ) ) ( not ( = ?auto_2685179 ?auto_2685181 ) ) ( TRUCK-AT ?auto_2685184 ?auto_2685182 ) ( not ( = ?auto_2685182 ?auto_2685185 ) ) ( HOIST-AT ?auto_2685183 ?auto_2685182 ) ( not ( = ?auto_2685187 ?auto_2685183 ) ) ( AVAILABLE ?auto_2685183 ) ( SURFACE-AT ?auto_2685181 ?auto_2685182 ) ( ON ?auto_2685181 ?auto_2685186 ) ( CLEAR ?auto_2685181 ) ( not ( = ?auto_2685180 ?auto_2685186 ) ) ( not ( = ?auto_2685181 ?auto_2685186 ) ) ( not ( = ?auto_2685179 ?auto_2685186 ) ) ( ON ?auto_2685171 ?auto_2685170 ) ( ON ?auto_2685172 ?auto_2685171 ) ( ON ?auto_2685173 ?auto_2685172 ) ( ON ?auto_2685174 ?auto_2685173 ) ( ON ?auto_2685175 ?auto_2685174 ) ( ON ?auto_2685176 ?auto_2685175 ) ( ON ?auto_2685177 ?auto_2685176 ) ( ON ?auto_2685178 ?auto_2685177 ) ( ON ?auto_2685179 ?auto_2685178 ) ( not ( = ?auto_2685170 ?auto_2685171 ) ) ( not ( = ?auto_2685170 ?auto_2685172 ) ) ( not ( = ?auto_2685170 ?auto_2685173 ) ) ( not ( = ?auto_2685170 ?auto_2685174 ) ) ( not ( = ?auto_2685170 ?auto_2685175 ) ) ( not ( = ?auto_2685170 ?auto_2685176 ) ) ( not ( = ?auto_2685170 ?auto_2685177 ) ) ( not ( = ?auto_2685170 ?auto_2685178 ) ) ( not ( = ?auto_2685170 ?auto_2685179 ) ) ( not ( = ?auto_2685170 ?auto_2685180 ) ) ( not ( = ?auto_2685170 ?auto_2685181 ) ) ( not ( = ?auto_2685170 ?auto_2685186 ) ) ( not ( = ?auto_2685171 ?auto_2685172 ) ) ( not ( = ?auto_2685171 ?auto_2685173 ) ) ( not ( = ?auto_2685171 ?auto_2685174 ) ) ( not ( = ?auto_2685171 ?auto_2685175 ) ) ( not ( = ?auto_2685171 ?auto_2685176 ) ) ( not ( = ?auto_2685171 ?auto_2685177 ) ) ( not ( = ?auto_2685171 ?auto_2685178 ) ) ( not ( = ?auto_2685171 ?auto_2685179 ) ) ( not ( = ?auto_2685171 ?auto_2685180 ) ) ( not ( = ?auto_2685171 ?auto_2685181 ) ) ( not ( = ?auto_2685171 ?auto_2685186 ) ) ( not ( = ?auto_2685172 ?auto_2685173 ) ) ( not ( = ?auto_2685172 ?auto_2685174 ) ) ( not ( = ?auto_2685172 ?auto_2685175 ) ) ( not ( = ?auto_2685172 ?auto_2685176 ) ) ( not ( = ?auto_2685172 ?auto_2685177 ) ) ( not ( = ?auto_2685172 ?auto_2685178 ) ) ( not ( = ?auto_2685172 ?auto_2685179 ) ) ( not ( = ?auto_2685172 ?auto_2685180 ) ) ( not ( = ?auto_2685172 ?auto_2685181 ) ) ( not ( = ?auto_2685172 ?auto_2685186 ) ) ( not ( = ?auto_2685173 ?auto_2685174 ) ) ( not ( = ?auto_2685173 ?auto_2685175 ) ) ( not ( = ?auto_2685173 ?auto_2685176 ) ) ( not ( = ?auto_2685173 ?auto_2685177 ) ) ( not ( = ?auto_2685173 ?auto_2685178 ) ) ( not ( = ?auto_2685173 ?auto_2685179 ) ) ( not ( = ?auto_2685173 ?auto_2685180 ) ) ( not ( = ?auto_2685173 ?auto_2685181 ) ) ( not ( = ?auto_2685173 ?auto_2685186 ) ) ( not ( = ?auto_2685174 ?auto_2685175 ) ) ( not ( = ?auto_2685174 ?auto_2685176 ) ) ( not ( = ?auto_2685174 ?auto_2685177 ) ) ( not ( = ?auto_2685174 ?auto_2685178 ) ) ( not ( = ?auto_2685174 ?auto_2685179 ) ) ( not ( = ?auto_2685174 ?auto_2685180 ) ) ( not ( = ?auto_2685174 ?auto_2685181 ) ) ( not ( = ?auto_2685174 ?auto_2685186 ) ) ( not ( = ?auto_2685175 ?auto_2685176 ) ) ( not ( = ?auto_2685175 ?auto_2685177 ) ) ( not ( = ?auto_2685175 ?auto_2685178 ) ) ( not ( = ?auto_2685175 ?auto_2685179 ) ) ( not ( = ?auto_2685175 ?auto_2685180 ) ) ( not ( = ?auto_2685175 ?auto_2685181 ) ) ( not ( = ?auto_2685175 ?auto_2685186 ) ) ( not ( = ?auto_2685176 ?auto_2685177 ) ) ( not ( = ?auto_2685176 ?auto_2685178 ) ) ( not ( = ?auto_2685176 ?auto_2685179 ) ) ( not ( = ?auto_2685176 ?auto_2685180 ) ) ( not ( = ?auto_2685176 ?auto_2685181 ) ) ( not ( = ?auto_2685176 ?auto_2685186 ) ) ( not ( = ?auto_2685177 ?auto_2685178 ) ) ( not ( = ?auto_2685177 ?auto_2685179 ) ) ( not ( = ?auto_2685177 ?auto_2685180 ) ) ( not ( = ?auto_2685177 ?auto_2685181 ) ) ( not ( = ?auto_2685177 ?auto_2685186 ) ) ( not ( = ?auto_2685178 ?auto_2685179 ) ) ( not ( = ?auto_2685178 ?auto_2685180 ) ) ( not ( = ?auto_2685178 ?auto_2685181 ) ) ( not ( = ?auto_2685178 ?auto_2685186 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2685179 ?auto_2685180 ?auto_2685181 )
      ( MAKE-11CRATE-VERIFY ?auto_2685170 ?auto_2685171 ?auto_2685172 ?auto_2685173 ?auto_2685174 ?auto_2685175 ?auto_2685176 ?auto_2685177 ?auto_2685178 ?auto_2685179 ?auto_2685180 ?auto_2685181 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2685314 - SURFACE
      ?auto_2685315 - SURFACE
      ?auto_2685316 - SURFACE
      ?auto_2685317 - SURFACE
      ?auto_2685318 - SURFACE
      ?auto_2685319 - SURFACE
      ?auto_2685320 - SURFACE
      ?auto_2685321 - SURFACE
      ?auto_2685322 - SURFACE
      ?auto_2685323 - SURFACE
      ?auto_2685324 - SURFACE
      ?auto_2685325 - SURFACE
    )
    :vars
    (
      ?auto_2685328 - HOIST
      ?auto_2685330 - PLACE
      ?auto_2685329 - PLACE
      ?auto_2685326 - HOIST
      ?auto_2685327 - SURFACE
      ?auto_2685331 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2685328 ?auto_2685330 ) ( SURFACE-AT ?auto_2685324 ?auto_2685330 ) ( CLEAR ?auto_2685324 ) ( IS-CRATE ?auto_2685325 ) ( not ( = ?auto_2685324 ?auto_2685325 ) ) ( AVAILABLE ?auto_2685328 ) ( ON ?auto_2685324 ?auto_2685323 ) ( not ( = ?auto_2685323 ?auto_2685324 ) ) ( not ( = ?auto_2685323 ?auto_2685325 ) ) ( not ( = ?auto_2685329 ?auto_2685330 ) ) ( HOIST-AT ?auto_2685326 ?auto_2685329 ) ( not ( = ?auto_2685328 ?auto_2685326 ) ) ( AVAILABLE ?auto_2685326 ) ( SURFACE-AT ?auto_2685325 ?auto_2685329 ) ( ON ?auto_2685325 ?auto_2685327 ) ( CLEAR ?auto_2685325 ) ( not ( = ?auto_2685324 ?auto_2685327 ) ) ( not ( = ?auto_2685325 ?auto_2685327 ) ) ( not ( = ?auto_2685323 ?auto_2685327 ) ) ( TRUCK-AT ?auto_2685331 ?auto_2685330 ) ( ON ?auto_2685315 ?auto_2685314 ) ( ON ?auto_2685316 ?auto_2685315 ) ( ON ?auto_2685317 ?auto_2685316 ) ( ON ?auto_2685318 ?auto_2685317 ) ( ON ?auto_2685319 ?auto_2685318 ) ( ON ?auto_2685320 ?auto_2685319 ) ( ON ?auto_2685321 ?auto_2685320 ) ( ON ?auto_2685322 ?auto_2685321 ) ( ON ?auto_2685323 ?auto_2685322 ) ( not ( = ?auto_2685314 ?auto_2685315 ) ) ( not ( = ?auto_2685314 ?auto_2685316 ) ) ( not ( = ?auto_2685314 ?auto_2685317 ) ) ( not ( = ?auto_2685314 ?auto_2685318 ) ) ( not ( = ?auto_2685314 ?auto_2685319 ) ) ( not ( = ?auto_2685314 ?auto_2685320 ) ) ( not ( = ?auto_2685314 ?auto_2685321 ) ) ( not ( = ?auto_2685314 ?auto_2685322 ) ) ( not ( = ?auto_2685314 ?auto_2685323 ) ) ( not ( = ?auto_2685314 ?auto_2685324 ) ) ( not ( = ?auto_2685314 ?auto_2685325 ) ) ( not ( = ?auto_2685314 ?auto_2685327 ) ) ( not ( = ?auto_2685315 ?auto_2685316 ) ) ( not ( = ?auto_2685315 ?auto_2685317 ) ) ( not ( = ?auto_2685315 ?auto_2685318 ) ) ( not ( = ?auto_2685315 ?auto_2685319 ) ) ( not ( = ?auto_2685315 ?auto_2685320 ) ) ( not ( = ?auto_2685315 ?auto_2685321 ) ) ( not ( = ?auto_2685315 ?auto_2685322 ) ) ( not ( = ?auto_2685315 ?auto_2685323 ) ) ( not ( = ?auto_2685315 ?auto_2685324 ) ) ( not ( = ?auto_2685315 ?auto_2685325 ) ) ( not ( = ?auto_2685315 ?auto_2685327 ) ) ( not ( = ?auto_2685316 ?auto_2685317 ) ) ( not ( = ?auto_2685316 ?auto_2685318 ) ) ( not ( = ?auto_2685316 ?auto_2685319 ) ) ( not ( = ?auto_2685316 ?auto_2685320 ) ) ( not ( = ?auto_2685316 ?auto_2685321 ) ) ( not ( = ?auto_2685316 ?auto_2685322 ) ) ( not ( = ?auto_2685316 ?auto_2685323 ) ) ( not ( = ?auto_2685316 ?auto_2685324 ) ) ( not ( = ?auto_2685316 ?auto_2685325 ) ) ( not ( = ?auto_2685316 ?auto_2685327 ) ) ( not ( = ?auto_2685317 ?auto_2685318 ) ) ( not ( = ?auto_2685317 ?auto_2685319 ) ) ( not ( = ?auto_2685317 ?auto_2685320 ) ) ( not ( = ?auto_2685317 ?auto_2685321 ) ) ( not ( = ?auto_2685317 ?auto_2685322 ) ) ( not ( = ?auto_2685317 ?auto_2685323 ) ) ( not ( = ?auto_2685317 ?auto_2685324 ) ) ( not ( = ?auto_2685317 ?auto_2685325 ) ) ( not ( = ?auto_2685317 ?auto_2685327 ) ) ( not ( = ?auto_2685318 ?auto_2685319 ) ) ( not ( = ?auto_2685318 ?auto_2685320 ) ) ( not ( = ?auto_2685318 ?auto_2685321 ) ) ( not ( = ?auto_2685318 ?auto_2685322 ) ) ( not ( = ?auto_2685318 ?auto_2685323 ) ) ( not ( = ?auto_2685318 ?auto_2685324 ) ) ( not ( = ?auto_2685318 ?auto_2685325 ) ) ( not ( = ?auto_2685318 ?auto_2685327 ) ) ( not ( = ?auto_2685319 ?auto_2685320 ) ) ( not ( = ?auto_2685319 ?auto_2685321 ) ) ( not ( = ?auto_2685319 ?auto_2685322 ) ) ( not ( = ?auto_2685319 ?auto_2685323 ) ) ( not ( = ?auto_2685319 ?auto_2685324 ) ) ( not ( = ?auto_2685319 ?auto_2685325 ) ) ( not ( = ?auto_2685319 ?auto_2685327 ) ) ( not ( = ?auto_2685320 ?auto_2685321 ) ) ( not ( = ?auto_2685320 ?auto_2685322 ) ) ( not ( = ?auto_2685320 ?auto_2685323 ) ) ( not ( = ?auto_2685320 ?auto_2685324 ) ) ( not ( = ?auto_2685320 ?auto_2685325 ) ) ( not ( = ?auto_2685320 ?auto_2685327 ) ) ( not ( = ?auto_2685321 ?auto_2685322 ) ) ( not ( = ?auto_2685321 ?auto_2685323 ) ) ( not ( = ?auto_2685321 ?auto_2685324 ) ) ( not ( = ?auto_2685321 ?auto_2685325 ) ) ( not ( = ?auto_2685321 ?auto_2685327 ) ) ( not ( = ?auto_2685322 ?auto_2685323 ) ) ( not ( = ?auto_2685322 ?auto_2685324 ) ) ( not ( = ?auto_2685322 ?auto_2685325 ) ) ( not ( = ?auto_2685322 ?auto_2685327 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2685323 ?auto_2685324 ?auto_2685325 )
      ( MAKE-11CRATE-VERIFY ?auto_2685314 ?auto_2685315 ?auto_2685316 ?auto_2685317 ?auto_2685318 ?auto_2685319 ?auto_2685320 ?auto_2685321 ?auto_2685322 ?auto_2685323 ?auto_2685324 ?auto_2685325 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2685458 - SURFACE
      ?auto_2685459 - SURFACE
      ?auto_2685460 - SURFACE
      ?auto_2685461 - SURFACE
      ?auto_2685462 - SURFACE
      ?auto_2685463 - SURFACE
      ?auto_2685464 - SURFACE
      ?auto_2685465 - SURFACE
      ?auto_2685466 - SURFACE
      ?auto_2685467 - SURFACE
      ?auto_2685468 - SURFACE
      ?auto_2685469 - SURFACE
    )
    :vars
    (
      ?auto_2685470 - HOIST
      ?auto_2685474 - PLACE
      ?auto_2685473 - PLACE
      ?auto_2685475 - HOIST
      ?auto_2685472 - SURFACE
      ?auto_2685471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2685470 ?auto_2685474 ) ( IS-CRATE ?auto_2685469 ) ( not ( = ?auto_2685468 ?auto_2685469 ) ) ( not ( = ?auto_2685467 ?auto_2685468 ) ) ( not ( = ?auto_2685467 ?auto_2685469 ) ) ( not ( = ?auto_2685473 ?auto_2685474 ) ) ( HOIST-AT ?auto_2685475 ?auto_2685473 ) ( not ( = ?auto_2685470 ?auto_2685475 ) ) ( AVAILABLE ?auto_2685475 ) ( SURFACE-AT ?auto_2685469 ?auto_2685473 ) ( ON ?auto_2685469 ?auto_2685472 ) ( CLEAR ?auto_2685469 ) ( not ( = ?auto_2685468 ?auto_2685472 ) ) ( not ( = ?auto_2685469 ?auto_2685472 ) ) ( not ( = ?auto_2685467 ?auto_2685472 ) ) ( TRUCK-AT ?auto_2685471 ?auto_2685474 ) ( SURFACE-AT ?auto_2685467 ?auto_2685474 ) ( CLEAR ?auto_2685467 ) ( LIFTING ?auto_2685470 ?auto_2685468 ) ( IS-CRATE ?auto_2685468 ) ( ON ?auto_2685459 ?auto_2685458 ) ( ON ?auto_2685460 ?auto_2685459 ) ( ON ?auto_2685461 ?auto_2685460 ) ( ON ?auto_2685462 ?auto_2685461 ) ( ON ?auto_2685463 ?auto_2685462 ) ( ON ?auto_2685464 ?auto_2685463 ) ( ON ?auto_2685465 ?auto_2685464 ) ( ON ?auto_2685466 ?auto_2685465 ) ( ON ?auto_2685467 ?auto_2685466 ) ( not ( = ?auto_2685458 ?auto_2685459 ) ) ( not ( = ?auto_2685458 ?auto_2685460 ) ) ( not ( = ?auto_2685458 ?auto_2685461 ) ) ( not ( = ?auto_2685458 ?auto_2685462 ) ) ( not ( = ?auto_2685458 ?auto_2685463 ) ) ( not ( = ?auto_2685458 ?auto_2685464 ) ) ( not ( = ?auto_2685458 ?auto_2685465 ) ) ( not ( = ?auto_2685458 ?auto_2685466 ) ) ( not ( = ?auto_2685458 ?auto_2685467 ) ) ( not ( = ?auto_2685458 ?auto_2685468 ) ) ( not ( = ?auto_2685458 ?auto_2685469 ) ) ( not ( = ?auto_2685458 ?auto_2685472 ) ) ( not ( = ?auto_2685459 ?auto_2685460 ) ) ( not ( = ?auto_2685459 ?auto_2685461 ) ) ( not ( = ?auto_2685459 ?auto_2685462 ) ) ( not ( = ?auto_2685459 ?auto_2685463 ) ) ( not ( = ?auto_2685459 ?auto_2685464 ) ) ( not ( = ?auto_2685459 ?auto_2685465 ) ) ( not ( = ?auto_2685459 ?auto_2685466 ) ) ( not ( = ?auto_2685459 ?auto_2685467 ) ) ( not ( = ?auto_2685459 ?auto_2685468 ) ) ( not ( = ?auto_2685459 ?auto_2685469 ) ) ( not ( = ?auto_2685459 ?auto_2685472 ) ) ( not ( = ?auto_2685460 ?auto_2685461 ) ) ( not ( = ?auto_2685460 ?auto_2685462 ) ) ( not ( = ?auto_2685460 ?auto_2685463 ) ) ( not ( = ?auto_2685460 ?auto_2685464 ) ) ( not ( = ?auto_2685460 ?auto_2685465 ) ) ( not ( = ?auto_2685460 ?auto_2685466 ) ) ( not ( = ?auto_2685460 ?auto_2685467 ) ) ( not ( = ?auto_2685460 ?auto_2685468 ) ) ( not ( = ?auto_2685460 ?auto_2685469 ) ) ( not ( = ?auto_2685460 ?auto_2685472 ) ) ( not ( = ?auto_2685461 ?auto_2685462 ) ) ( not ( = ?auto_2685461 ?auto_2685463 ) ) ( not ( = ?auto_2685461 ?auto_2685464 ) ) ( not ( = ?auto_2685461 ?auto_2685465 ) ) ( not ( = ?auto_2685461 ?auto_2685466 ) ) ( not ( = ?auto_2685461 ?auto_2685467 ) ) ( not ( = ?auto_2685461 ?auto_2685468 ) ) ( not ( = ?auto_2685461 ?auto_2685469 ) ) ( not ( = ?auto_2685461 ?auto_2685472 ) ) ( not ( = ?auto_2685462 ?auto_2685463 ) ) ( not ( = ?auto_2685462 ?auto_2685464 ) ) ( not ( = ?auto_2685462 ?auto_2685465 ) ) ( not ( = ?auto_2685462 ?auto_2685466 ) ) ( not ( = ?auto_2685462 ?auto_2685467 ) ) ( not ( = ?auto_2685462 ?auto_2685468 ) ) ( not ( = ?auto_2685462 ?auto_2685469 ) ) ( not ( = ?auto_2685462 ?auto_2685472 ) ) ( not ( = ?auto_2685463 ?auto_2685464 ) ) ( not ( = ?auto_2685463 ?auto_2685465 ) ) ( not ( = ?auto_2685463 ?auto_2685466 ) ) ( not ( = ?auto_2685463 ?auto_2685467 ) ) ( not ( = ?auto_2685463 ?auto_2685468 ) ) ( not ( = ?auto_2685463 ?auto_2685469 ) ) ( not ( = ?auto_2685463 ?auto_2685472 ) ) ( not ( = ?auto_2685464 ?auto_2685465 ) ) ( not ( = ?auto_2685464 ?auto_2685466 ) ) ( not ( = ?auto_2685464 ?auto_2685467 ) ) ( not ( = ?auto_2685464 ?auto_2685468 ) ) ( not ( = ?auto_2685464 ?auto_2685469 ) ) ( not ( = ?auto_2685464 ?auto_2685472 ) ) ( not ( = ?auto_2685465 ?auto_2685466 ) ) ( not ( = ?auto_2685465 ?auto_2685467 ) ) ( not ( = ?auto_2685465 ?auto_2685468 ) ) ( not ( = ?auto_2685465 ?auto_2685469 ) ) ( not ( = ?auto_2685465 ?auto_2685472 ) ) ( not ( = ?auto_2685466 ?auto_2685467 ) ) ( not ( = ?auto_2685466 ?auto_2685468 ) ) ( not ( = ?auto_2685466 ?auto_2685469 ) ) ( not ( = ?auto_2685466 ?auto_2685472 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2685467 ?auto_2685468 ?auto_2685469 )
      ( MAKE-11CRATE-VERIFY ?auto_2685458 ?auto_2685459 ?auto_2685460 ?auto_2685461 ?auto_2685462 ?auto_2685463 ?auto_2685464 ?auto_2685465 ?auto_2685466 ?auto_2685467 ?auto_2685468 ?auto_2685469 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2685602 - SURFACE
      ?auto_2685603 - SURFACE
      ?auto_2685604 - SURFACE
      ?auto_2685605 - SURFACE
      ?auto_2685606 - SURFACE
      ?auto_2685607 - SURFACE
      ?auto_2685608 - SURFACE
      ?auto_2685609 - SURFACE
      ?auto_2685610 - SURFACE
      ?auto_2685611 - SURFACE
      ?auto_2685612 - SURFACE
      ?auto_2685613 - SURFACE
    )
    :vars
    (
      ?auto_2685615 - HOIST
      ?auto_2685618 - PLACE
      ?auto_2685617 - PLACE
      ?auto_2685616 - HOIST
      ?auto_2685614 - SURFACE
      ?auto_2685619 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2685615 ?auto_2685618 ) ( IS-CRATE ?auto_2685613 ) ( not ( = ?auto_2685612 ?auto_2685613 ) ) ( not ( = ?auto_2685611 ?auto_2685612 ) ) ( not ( = ?auto_2685611 ?auto_2685613 ) ) ( not ( = ?auto_2685617 ?auto_2685618 ) ) ( HOIST-AT ?auto_2685616 ?auto_2685617 ) ( not ( = ?auto_2685615 ?auto_2685616 ) ) ( AVAILABLE ?auto_2685616 ) ( SURFACE-AT ?auto_2685613 ?auto_2685617 ) ( ON ?auto_2685613 ?auto_2685614 ) ( CLEAR ?auto_2685613 ) ( not ( = ?auto_2685612 ?auto_2685614 ) ) ( not ( = ?auto_2685613 ?auto_2685614 ) ) ( not ( = ?auto_2685611 ?auto_2685614 ) ) ( TRUCK-AT ?auto_2685619 ?auto_2685618 ) ( SURFACE-AT ?auto_2685611 ?auto_2685618 ) ( CLEAR ?auto_2685611 ) ( IS-CRATE ?auto_2685612 ) ( AVAILABLE ?auto_2685615 ) ( IN ?auto_2685612 ?auto_2685619 ) ( ON ?auto_2685603 ?auto_2685602 ) ( ON ?auto_2685604 ?auto_2685603 ) ( ON ?auto_2685605 ?auto_2685604 ) ( ON ?auto_2685606 ?auto_2685605 ) ( ON ?auto_2685607 ?auto_2685606 ) ( ON ?auto_2685608 ?auto_2685607 ) ( ON ?auto_2685609 ?auto_2685608 ) ( ON ?auto_2685610 ?auto_2685609 ) ( ON ?auto_2685611 ?auto_2685610 ) ( not ( = ?auto_2685602 ?auto_2685603 ) ) ( not ( = ?auto_2685602 ?auto_2685604 ) ) ( not ( = ?auto_2685602 ?auto_2685605 ) ) ( not ( = ?auto_2685602 ?auto_2685606 ) ) ( not ( = ?auto_2685602 ?auto_2685607 ) ) ( not ( = ?auto_2685602 ?auto_2685608 ) ) ( not ( = ?auto_2685602 ?auto_2685609 ) ) ( not ( = ?auto_2685602 ?auto_2685610 ) ) ( not ( = ?auto_2685602 ?auto_2685611 ) ) ( not ( = ?auto_2685602 ?auto_2685612 ) ) ( not ( = ?auto_2685602 ?auto_2685613 ) ) ( not ( = ?auto_2685602 ?auto_2685614 ) ) ( not ( = ?auto_2685603 ?auto_2685604 ) ) ( not ( = ?auto_2685603 ?auto_2685605 ) ) ( not ( = ?auto_2685603 ?auto_2685606 ) ) ( not ( = ?auto_2685603 ?auto_2685607 ) ) ( not ( = ?auto_2685603 ?auto_2685608 ) ) ( not ( = ?auto_2685603 ?auto_2685609 ) ) ( not ( = ?auto_2685603 ?auto_2685610 ) ) ( not ( = ?auto_2685603 ?auto_2685611 ) ) ( not ( = ?auto_2685603 ?auto_2685612 ) ) ( not ( = ?auto_2685603 ?auto_2685613 ) ) ( not ( = ?auto_2685603 ?auto_2685614 ) ) ( not ( = ?auto_2685604 ?auto_2685605 ) ) ( not ( = ?auto_2685604 ?auto_2685606 ) ) ( not ( = ?auto_2685604 ?auto_2685607 ) ) ( not ( = ?auto_2685604 ?auto_2685608 ) ) ( not ( = ?auto_2685604 ?auto_2685609 ) ) ( not ( = ?auto_2685604 ?auto_2685610 ) ) ( not ( = ?auto_2685604 ?auto_2685611 ) ) ( not ( = ?auto_2685604 ?auto_2685612 ) ) ( not ( = ?auto_2685604 ?auto_2685613 ) ) ( not ( = ?auto_2685604 ?auto_2685614 ) ) ( not ( = ?auto_2685605 ?auto_2685606 ) ) ( not ( = ?auto_2685605 ?auto_2685607 ) ) ( not ( = ?auto_2685605 ?auto_2685608 ) ) ( not ( = ?auto_2685605 ?auto_2685609 ) ) ( not ( = ?auto_2685605 ?auto_2685610 ) ) ( not ( = ?auto_2685605 ?auto_2685611 ) ) ( not ( = ?auto_2685605 ?auto_2685612 ) ) ( not ( = ?auto_2685605 ?auto_2685613 ) ) ( not ( = ?auto_2685605 ?auto_2685614 ) ) ( not ( = ?auto_2685606 ?auto_2685607 ) ) ( not ( = ?auto_2685606 ?auto_2685608 ) ) ( not ( = ?auto_2685606 ?auto_2685609 ) ) ( not ( = ?auto_2685606 ?auto_2685610 ) ) ( not ( = ?auto_2685606 ?auto_2685611 ) ) ( not ( = ?auto_2685606 ?auto_2685612 ) ) ( not ( = ?auto_2685606 ?auto_2685613 ) ) ( not ( = ?auto_2685606 ?auto_2685614 ) ) ( not ( = ?auto_2685607 ?auto_2685608 ) ) ( not ( = ?auto_2685607 ?auto_2685609 ) ) ( not ( = ?auto_2685607 ?auto_2685610 ) ) ( not ( = ?auto_2685607 ?auto_2685611 ) ) ( not ( = ?auto_2685607 ?auto_2685612 ) ) ( not ( = ?auto_2685607 ?auto_2685613 ) ) ( not ( = ?auto_2685607 ?auto_2685614 ) ) ( not ( = ?auto_2685608 ?auto_2685609 ) ) ( not ( = ?auto_2685608 ?auto_2685610 ) ) ( not ( = ?auto_2685608 ?auto_2685611 ) ) ( not ( = ?auto_2685608 ?auto_2685612 ) ) ( not ( = ?auto_2685608 ?auto_2685613 ) ) ( not ( = ?auto_2685608 ?auto_2685614 ) ) ( not ( = ?auto_2685609 ?auto_2685610 ) ) ( not ( = ?auto_2685609 ?auto_2685611 ) ) ( not ( = ?auto_2685609 ?auto_2685612 ) ) ( not ( = ?auto_2685609 ?auto_2685613 ) ) ( not ( = ?auto_2685609 ?auto_2685614 ) ) ( not ( = ?auto_2685610 ?auto_2685611 ) ) ( not ( = ?auto_2685610 ?auto_2685612 ) ) ( not ( = ?auto_2685610 ?auto_2685613 ) ) ( not ( = ?auto_2685610 ?auto_2685614 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2685611 ?auto_2685612 ?auto_2685613 )
      ( MAKE-11CRATE-VERIFY ?auto_2685602 ?auto_2685603 ?auto_2685604 ?auto_2685605 ?auto_2685606 ?auto_2685607 ?auto_2685608 ?auto_2685609 ?auto_2685610 ?auto_2685611 ?auto_2685612 ?auto_2685613 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2694871 - SURFACE
      ?auto_2694872 - SURFACE
      ?auto_2694873 - SURFACE
      ?auto_2694874 - SURFACE
      ?auto_2694875 - SURFACE
      ?auto_2694876 - SURFACE
      ?auto_2694877 - SURFACE
      ?auto_2694878 - SURFACE
      ?auto_2694879 - SURFACE
      ?auto_2694880 - SURFACE
      ?auto_2694881 - SURFACE
      ?auto_2694882 - SURFACE
      ?auto_2694883 - SURFACE
    )
    :vars
    (
      ?auto_2694885 - HOIST
      ?auto_2694884 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2694885 ?auto_2694884 ) ( SURFACE-AT ?auto_2694882 ?auto_2694884 ) ( CLEAR ?auto_2694882 ) ( LIFTING ?auto_2694885 ?auto_2694883 ) ( IS-CRATE ?auto_2694883 ) ( not ( = ?auto_2694882 ?auto_2694883 ) ) ( ON ?auto_2694872 ?auto_2694871 ) ( ON ?auto_2694873 ?auto_2694872 ) ( ON ?auto_2694874 ?auto_2694873 ) ( ON ?auto_2694875 ?auto_2694874 ) ( ON ?auto_2694876 ?auto_2694875 ) ( ON ?auto_2694877 ?auto_2694876 ) ( ON ?auto_2694878 ?auto_2694877 ) ( ON ?auto_2694879 ?auto_2694878 ) ( ON ?auto_2694880 ?auto_2694879 ) ( ON ?auto_2694881 ?auto_2694880 ) ( ON ?auto_2694882 ?auto_2694881 ) ( not ( = ?auto_2694871 ?auto_2694872 ) ) ( not ( = ?auto_2694871 ?auto_2694873 ) ) ( not ( = ?auto_2694871 ?auto_2694874 ) ) ( not ( = ?auto_2694871 ?auto_2694875 ) ) ( not ( = ?auto_2694871 ?auto_2694876 ) ) ( not ( = ?auto_2694871 ?auto_2694877 ) ) ( not ( = ?auto_2694871 ?auto_2694878 ) ) ( not ( = ?auto_2694871 ?auto_2694879 ) ) ( not ( = ?auto_2694871 ?auto_2694880 ) ) ( not ( = ?auto_2694871 ?auto_2694881 ) ) ( not ( = ?auto_2694871 ?auto_2694882 ) ) ( not ( = ?auto_2694871 ?auto_2694883 ) ) ( not ( = ?auto_2694872 ?auto_2694873 ) ) ( not ( = ?auto_2694872 ?auto_2694874 ) ) ( not ( = ?auto_2694872 ?auto_2694875 ) ) ( not ( = ?auto_2694872 ?auto_2694876 ) ) ( not ( = ?auto_2694872 ?auto_2694877 ) ) ( not ( = ?auto_2694872 ?auto_2694878 ) ) ( not ( = ?auto_2694872 ?auto_2694879 ) ) ( not ( = ?auto_2694872 ?auto_2694880 ) ) ( not ( = ?auto_2694872 ?auto_2694881 ) ) ( not ( = ?auto_2694872 ?auto_2694882 ) ) ( not ( = ?auto_2694872 ?auto_2694883 ) ) ( not ( = ?auto_2694873 ?auto_2694874 ) ) ( not ( = ?auto_2694873 ?auto_2694875 ) ) ( not ( = ?auto_2694873 ?auto_2694876 ) ) ( not ( = ?auto_2694873 ?auto_2694877 ) ) ( not ( = ?auto_2694873 ?auto_2694878 ) ) ( not ( = ?auto_2694873 ?auto_2694879 ) ) ( not ( = ?auto_2694873 ?auto_2694880 ) ) ( not ( = ?auto_2694873 ?auto_2694881 ) ) ( not ( = ?auto_2694873 ?auto_2694882 ) ) ( not ( = ?auto_2694873 ?auto_2694883 ) ) ( not ( = ?auto_2694874 ?auto_2694875 ) ) ( not ( = ?auto_2694874 ?auto_2694876 ) ) ( not ( = ?auto_2694874 ?auto_2694877 ) ) ( not ( = ?auto_2694874 ?auto_2694878 ) ) ( not ( = ?auto_2694874 ?auto_2694879 ) ) ( not ( = ?auto_2694874 ?auto_2694880 ) ) ( not ( = ?auto_2694874 ?auto_2694881 ) ) ( not ( = ?auto_2694874 ?auto_2694882 ) ) ( not ( = ?auto_2694874 ?auto_2694883 ) ) ( not ( = ?auto_2694875 ?auto_2694876 ) ) ( not ( = ?auto_2694875 ?auto_2694877 ) ) ( not ( = ?auto_2694875 ?auto_2694878 ) ) ( not ( = ?auto_2694875 ?auto_2694879 ) ) ( not ( = ?auto_2694875 ?auto_2694880 ) ) ( not ( = ?auto_2694875 ?auto_2694881 ) ) ( not ( = ?auto_2694875 ?auto_2694882 ) ) ( not ( = ?auto_2694875 ?auto_2694883 ) ) ( not ( = ?auto_2694876 ?auto_2694877 ) ) ( not ( = ?auto_2694876 ?auto_2694878 ) ) ( not ( = ?auto_2694876 ?auto_2694879 ) ) ( not ( = ?auto_2694876 ?auto_2694880 ) ) ( not ( = ?auto_2694876 ?auto_2694881 ) ) ( not ( = ?auto_2694876 ?auto_2694882 ) ) ( not ( = ?auto_2694876 ?auto_2694883 ) ) ( not ( = ?auto_2694877 ?auto_2694878 ) ) ( not ( = ?auto_2694877 ?auto_2694879 ) ) ( not ( = ?auto_2694877 ?auto_2694880 ) ) ( not ( = ?auto_2694877 ?auto_2694881 ) ) ( not ( = ?auto_2694877 ?auto_2694882 ) ) ( not ( = ?auto_2694877 ?auto_2694883 ) ) ( not ( = ?auto_2694878 ?auto_2694879 ) ) ( not ( = ?auto_2694878 ?auto_2694880 ) ) ( not ( = ?auto_2694878 ?auto_2694881 ) ) ( not ( = ?auto_2694878 ?auto_2694882 ) ) ( not ( = ?auto_2694878 ?auto_2694883 ) ) ( not ( = ?auto_2694879 ?auto_2694880 ) ) ( not ( = ?auto_2694879 ?auto_2694881 ) ) ( not ( = ?auto_2694879 ?auto_2694882 ) ) ( not ( = ?auto_2694879 ?auto_2694883 ) ) ( not ( = ?auto_2694880 ?auto_2694881 ) ) ( not ( = ?auto_2694880 ?auto_2694882 ) ) ( not ( = ?auto_2694880 ?auto_2694883 ) ) ( not ( = ?auto_2694881 ?auto_2694882 ) ) ( not ( = ?auto_2694881 ?auto_2694883 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2694882 ?auto_2694883 )
      ( MAKE-12CRATE-VERIFY ?auto_2694871 ?auto_2694872 ?auto_2694873 ?auto_2694874 ?auto_2694875 ?auto_2694876 ?auto_2694877 ?auto_2694878 ?auto_2694879 ?auto_2694880 ?auto_2694881 ?auto_2694882 ?auto_2694883 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2694996 - SURFACE
      ?auto_2694997 - SURFACE
      ?auto_2694998 - SURFACE
      ?auto_2694999 - SURFACE
      ?auto_2695000 - SURFACE
      ?auto_2695001 - SURFACE
      ?auto_2695002 - SURFACE
      ?auto_2695003 - SURFACE
      ?auto_2695004 - SURFACE
      ?auto_2695005 - SURFACE
      ?auto_2695006 - SURFACE
      ?auto_2695007 - SURFACE
      ?auto_2695008 - SURFACE
    )
    :vars
    (
      ?auto_2695011 - HOIST
      ?auto_2695010 - PLACE
      ?auto_2695009 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2695011 ?auto_2695010 ) ( SURFACE-AT ?auto_2695007 ?auto_2695010 ) ( CLEAR ?auto_2695007 ) ( IS-CRATE ?auto_2695008 ) ( not ( = ?auto_2695007 ?auto_2695008 ) ) ( TRUCK-AT ?auto_2695009 ?auto_2695010 ) ( AVAILABLE ?auto_2695011 ) ( IN ?auto_2695008 ?auto_2695009 ) ( ON ?auto_2695007 ?auto_2695006 ) ( not ( = ?auto_2695006 ?auto_2695007 ) ) ( not ( = ?auto_2695006 ?auto_2695008 ) ) ( ON ?auto_2694997 ?auto_2694996 ) ( ON ?auto_2694998 ?auto_2694997 ) ( ON ?auto_2694999 ?auto_2694998 ) ( ON ?auto_2695000 ?auto_2694999 ) ( ON ?auto_2695001 ?auto_2695000 ) ( ON ?auto_2695002 ?auto_2695001 ) ( ON ?auto_2695003 ?auto_2695002 ) ( ON ?auto_2695004 ?auto_2695003 ) ( ON ?auto_2695005 ?auto_2695004 ) ( ON ?auto_2695006 ?auto_2695005 ) ( not ( = ?auto_2694996 ?auto_2694997 ) ) ( not ( = ?auto_2694996 ?auto_2694998 ) ) ( not ( = ?auto_2694996 ?auto_2694999 ) ) ( not ( = ?auto_2694996 ?auto_2695000 ) ) ( not ( = ?auto_2694996 ?auto_2695001 ) ) ( not ( = ?auto_2694996 ?auto_2695002 ) ) ( not ( = ?auto_2694996 ?auto_2695003 ) ) ( not ( = ?auto_2694996 ?auto_2695004 ) ) ( not ( = ?auto_2694996 ?auto_2695005 ) ) ( not ( = ?auto_2694996 ?auto_2695006 ) ) ( not ( = ?auto_2694996 ?auto_2695007 ) ) ( not ( = ?auto_2694996 ?auto_2695008 ) ) ( not ( = ?auto_2694997 ?auto_2694998 ) ) ( not ( = ?auto_2694997 ?auto_2694999 ) ) ( not ( = ?auto_2694997 ?auto_2695000 ) ) ( not ( = ?auto_2694997 ?auto_2695001 ) ) ( not ( = ?auto_2694997 ?auto_2695002 ) ) ( not ( = ?auto_2694997 ?auto_2695003 ) ) ( not ( = ?auto_2694997 ?auto_2695004 ) ) ( not ( = ?auto_2694997 ?auto_2695005 ) ) ( not ( = ?auto_2694997 ?auto_2695006 ) ) ( not ( = ?auto_2694997 ?auto_2695007 ) ) ( not ( = ?auto_2694997 ?auto_2695008 ) ) ( not ( = ?auto_2694998 ?auto_2694999 ) ) ( not ( = ?auto_2694998 ?auto_2695000 ) ) ( not ( = ?auto_2694998 ?auto_2695001 ) ) ( not ( = ?auto_2694998 ?auto_2695002 ) ) ( not ( = ?auto_2694998 ?auto_2695003 ) ) ( not ( = ?auto_2694998 ?auto_2695004 ) ) ( not ( = ?auto_2694998 ?auto_2695005 ) ) ( not ( = ?auto_2694998 ?auto_2695006 ) ) ( not ( = ?auto_2694998 ?auto_2695007 ) ) ( not ( = ?auto_2694998 ?auto_2695008 ) ) ( not ( = ?auto_2694999 ?auto_2695000 ) ) ( not ( = ?auto_2694999 ?auto_2695001 ) ) ( not ( = ?auto_2694999 ?auto_2695002 ) ) ( not ( = ?auto_2694999 ?auto_2695003 ) ) ( not ( = ?auto_2694999 ?auto_2695004 ) ) ( not ( = ?auto_2694999 ?auto_2695005 ) ) ( not ( = ?auto_2694999 ?auto_2695006 ) ) ( not ( = ?auto_2694999 ?auto_2695007 ) ) ( not ( = ?auto_2694999 ?auto_2695008 ) ) ( not ( = ?auto_2695000 ?auto_2695001 ) ) ( not ( = ?auto_2695000 ?auto_2695002 ) ) ( not ( = ?auto_2695000 ?auto_2695003 ) ) ( not ( = ?auto_2695000 ?auto_2695004 ) ) ( not ( = ?auto_2695000 ?auto_2695005 ) ) ( not ( = ?auto_2695000 ?auto_2695006 ) ) ( not ( = ?auto_2695000 ?auto_2695007 ) ) ( not ( = ?auto_2695000 ?auto_2695008 ) ) ( not ( = ?auto_2695001 ?auto_2695002 ) ) ( not ( = ?auto_2695001 ?auto_2695003 ) ) ( not ( = ?auto_2695001 ?auto_2695004 ) ) ( not ( = ?auto_2695001 ?auto_2695005 ) ) ( not ( = ?auto_2695001 ?auto_2695006 ) ) ( not ( = ?auto_2695001 ?auto_2695007 ) ) ( not ( = ?auto_2695001 ?auto_2695008 ) ) ( not ( = ?auto_2695002 ?auto_2695003 ) ) ( not ( = ?auto_2695002 ?auto_2695004 ) ) ( not ( = ?auto_2695002 ?auto_2695005 ) ) ( not ( = ?auto_2695002 ?auto_2695006 ) ) ( not ( = ?auto_2695002 ?auto_2695007 ) ) ( not ( = ?auto_2695002 ?auto_2695008 ) ) ( not ( = ?auto_2695003 ?auto_2695004 ) ) ( not ( = ?auto_2695003 ?auto_2695005 ) ) ( not ( = ?auto_2695003 ?auto_2695006 ) ) ( not ( = ?auto_2695003 ?auto_2695007 ) ) ( not ( = ?auto_2695003 ?auto_2695008 ) ) ( not ( = ?auto_2695004 ?auto_2695005 ) ) ( not ( = ?auto_2695004 ?auto_2695006 ) ) ( not ( = ?auto_2695004 ?auto_2695007 ) ) ( not ( = ?auto_2695004 ?auto_2695008 ) ) ( not ( = ?auto_2695005 ?auto_2695006 ) ) ( not ( = ?auto_2695005 ?auto_2695007 ) ) ( not ( = ?auto_2695005 ?auto_2695008 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2695006 ?auto_2695007 ?auto_2695008 )
      ( MAKE-12CRATE-VERIFY ?auto_2694996 ?auto_2694997 ?auto_2694998 ?auto_2694999 ?auto_2695000 ?auto_2695001 ?auto_2695002 ?auto_2695003 ?auto_2695004 ?auto_2695005 ?auto_2695006 ?auto_2695007 ?auto_2695008 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2695134 - SURFACE
      ?auto_2695135 - SURFACE
      ?auto_2695136 - SURFACE
      ?auto_2695137 - SURFACE
      ?auto_2695138 - SURFACE
      ?auto_2695139 - SURFACE
      ?auto_2695140 - SURFACE
      ?auto_2695141 - SURFACE
      ?auto_2695142 - SURFACE
      ?auto_2695143 - SURFACE
      ?auto_2695144 - SURFACE
      ?auto_2695145 - SURFACE
      ?auto_2695146 - SURFACE
    )
    :vars
    (
      ?auto_2695149 - HOIST
      ?auto_2695148 - PLACE
      ?auto_2695147 - TRUCK
      ?auto_2695150 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2695149 ?auto_2695148 ) ( SURFACE-AT ?auto_2695145 ?auto_2695148 ) ( CLEAR ?auto_2695145 ) ( IS-CRATE ?auto_2695146 ) ( not ( = ?auto_2695145 ?auto_2695146 ) ) ( AVAILABLE ?auto_2695149 ) ( IN ?auto_2695146 ?auto_2695147 ) ( ON ?auto_2695145 ?auto_2695144 ) ( not ( = ?auto_2695144 ?auto_2695145 ) ) ( not ( = ?auto_2695144 ?auto_2695146 ) ) ( TRUCK-AT ?auto_2695147 ?auto_2695150 ) ( not ( = ?auto_2695150 ?auto_2695148 ) ) ( ON ?auto_2695135 ?auto_2695134 ) ( ON ?auto_2695136 ?auto_2695135 ) ( ON ?auto_2695137 ?auto_2695136 ) ( ON ?auto_2695138 ?auto_2695137 ) ( ON ?auto_2695139 ?auto_2695138 ) ( ON ?auto_2695140 ?auto_2695139 ) ( ON ?auto_2695141 ?auto_2695140 ) ( ON ?auto_2695142 ?auto_2695141 ) ( ON ?auto_2695143 ?auto_2695142 ) ( ON ?auto_2695144 ?auto_2695143 ) ( not ( = ?auto_2695134 ?auto_2695135 ) ) ( not ( = ?auto_2695134 ?auto_2695136 ) ) ( not ( = ?auto_2695134 ?auto_2695137 ) ) ( not ( = ?auto_2695134 ?auto_2695138 ) ) ( not ( = ?auto_2695134 ?auto_2695139 ) ) ( not ( = ?auto_2695134 ?auto_2695140 ) ) ( not ( = ?auto_2695134 ?auto_2695141 ) ) ( not ( = ?auto_2695134 ?auto_2695142 ) ) ( not ( = ?auto_2695134 ?auto_2695143 ) ) ( not ( = ?auto_2695134 ?auto_2695144 ) ) ( not ( = ?auto_2695134 ?auto_2695145 ) ) ( not ( = ?auto_2695134 ?auto_2695146 ) ) ( not ( = ?auto_2695135 ?auto_2695136 ) ) ( not ( = ?auto_2695135 ?auto_2695137 ) ) ( not ( = ?auto_2695135 ?auto_2695138 ) ) ( not ( = ?auto_2695135 ?auto_2695139 ) ) ( not ( = ?auto_2695135 ?auto_2695140 ) ) ( not ( = ?auto_2695135 ?auto_2695141 ) ) ( not ( = ?auto_2695135 ?auto_2695142 ) ) ( not ( = ?auto_2695135 ?auto_2695143 ) ) ( not ( = ?auto_2695135 ?auto_2695144 ) ) ( not ( = ?auto_2695135 ?auto_2695145 ) ) ( not ( = ?auto_2695135 ?auto_2695146 ) ) ( not ( = ?auto_2695136 ?auto_2695137 ) ) ( not ( = ?auto_2695136 ?auto_2695138 ) ) ( not ( = ?auto_2695136 ?auto_2695139 ) ) ( not ( = ?auto_2695136 ?auto_2695140 ) ) ( not ( = ?auto_2695136 ?auto_2695141 ) ) ( not ( = ?auto_2695136 ?auto_2695142 ) ) ( not ( = ?auto_2695136 ?auto_2695143 ) ) ( not ( = ?auto_2695136 ?auto_2695144 ) ) ( not ( = ?auto_2695136 ?auto_2695145 ) ) ( not ( = ?auto_2695136 ?auto_2695146 ) ) ( not ( = ?auto_2695137 ?auto_2695138 ) ) ( not ( = ?auto_2695137 ?auto_2695139 ) ) ( not ( = ?auto_2695137 ?auto_2695140 ) ) ( not ( = ?auto_2695137 ?auto_2695141 ) ) ( not ( = ?auto_2695137 ?auto_2695142 ) ) ( not ( = ?auto_2695137 ?auto_2695143 ) ) ( not ( = ?auto_2695137 ?auto_2695144 ) ) ( not ( = ?auto_2695137 ?auto_2695145 ) ) ( not ( = ?auto_2695137 ?auto_2695146 ) ) ( not ( = ?auto_2695138 ?auto_2695139 ) ) ( not ( = ?auto_2695138 ?auto_2695140 ) ) ( not ( = ?auto_2695138 ?auto_2695141 ) ) ( not ( = ?auto_2695138 ?auto_2695142 ) ) ( not ( = ?auto_2695138 ?auto_2695143 ) ) ( not ( = ?auto_2695138 ?auto_2695144 ) ) ( not ( = ?auto_2695138 ?auto_2695145 ) ) ( not ( = ?auto_2695138 ?auto_2695146 ) ) ( not ( = ?auto_2695139 ?auto_2695140 ) ) ( not ( = ?auto_2695139 ?auto_2695141 ) ) ( not ( = ?auto_2695139 ?auto_2695142 ) ) ( not ( = ?auto_2695139 ?auto_2695143 ) ) ( not ( = ?auto_2695139 ?auto_2695144 ) ) ( not ( = ?auto_2695139 ?auto_2695145 ) ) ( not ( = ?auto_2695139 ?auto_2695146 ) ) ( not ( = ?auto_2695140 ?auto_2695141 ) ) ( not ( = ?auto_2695140 ?auto_2695142 ) ) ( not ( = ?auto_2695140 ?auto_2695143 ) ) ( not ( = ?auto_2695140 ?auto_2695144 ) ) ( not ( = ?auto_2695140 ?auto_2695145 ) ) ( not ( = ?auto_2695140 ?auto_2695146 ) ) ( not ( = ?auto_2695141 ?auto_2695142 ) ) ( not ( = ?auto_2695141 ?auto_2695143 ) ) ( not ( = ?auto_2695141 ?auto_2695144 ) ) ( not ( = ?auto_2695141 ?auto_2695145 ) ) ( not ( = ?auto_2695141 ?auto_2695146 ) ) ( not ( = ?auto_2695142 ?auto_2695143 ) ) ( not ( = ?auto_2695142 ?auto_2695144 ) ) ( not ( = ?auto_2695142 ?auto_2695145 ) ) ( not ( = ?auto_2695142 ?auto_2695146 ) ) ( not ( = ?auto_2695143 ?auto_2695144 ) ) ( not ( = ?auto_2695143 ?auto_2695145 ) ) ( not ( = ?auto_2695143 ?auto_2695146 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2695144 ?auto_2695145 ?auto_2695146 )
      ( MAKE-12CRATE-VERIFY ?auto_2695134 ?auto_2695135 ?auto_2695136 ?auto_2695137 ?auto_2695138 ?auto_2695139 ?auto_2695140 ?auto_2695141 ?auto_2695142 ?auto_2695143 ?auto_2695144 ?auto_2695145 ?auto_2695146 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2695284 - SURFACE
      ?auto_2695285 - SURFACE
      ?auto_2695286 - SURFACE
      ?auto_2695287 - SURFACE
      ?auto_2695288 - SURFACE
      ?auto_2695289 - SURFACE
      ?auto_2695290 - SURFACE
      ?auto_2695291 - SURFACE
      ?auto_2695292 - SURFACE
      ?auto_2695293 - SURFACE
      ?auto_2695294 - SURFACE
      ?auto_2695295 - SURFACE
      ?auto_2695296 - SURFACE
    )
    :vars
    (
      ?auto_2695297 - HOIST
      ?auto_2695299 - PLACE
      ?auto_2695300 - TRUCK
      ?auto_2695301 - PLACE
      ?auto_2695298 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2695297 ?auto_2695299 ) ( SURFACE-AT ?auto_2695295 ?auto_2695299 ) ( CLEAR ?auto_2695295 ) ( IS-CRATE ?auto_2695296 ) ( not ( = ?auto_2695295 ?auto_2695296 ) ) ( AVAILABLE ?auto_2695297 ) ( ON ?auto_2695295 ?auto_2695294 ) ( not ( = ?auto_2695294 ?auto_2695295 ) ) ( not ( = ?auto_2695294 ?auto_2695296 ) ) ( TRUCK-AT ?auto_2695300 ?auto_2695301 ) ( not ( = ?auto_2695301 ?auto_2695299 ) ) ( HOIST-AT ?auto_2695298 ?auto_2695301 ) ( LIFTING ?auto_2695298 ?auto_2695296 ) ( not ( = ?auto_2695297 ?auto_2695298 ) ) ( ON ?auto_2695285 ?auto_2695284 ) ( ON ?auto_2695286 ?auto_2695285 ) ( ON ?auto_2695287 ?auto_2695286 ) ( ON ?auto_2695288 ?auto_2695287 ) ( ON ?auto_2695289 ?auto_2695288 ) ( ON ?auto_2695290 ?auto_2695289 ) ( ON ?auto_2695291 ?auto_2695290 ) ( ON ?auto_2695292 ?auto_2695291 ) ( ON ?auto_2695293 ?auto_2695292 ) ( ON ?auto_2695294 ?auto_2695293 ) ( not ( = ?auto_2695284 ?auto_2695285 ) ) ( not ( = ?auto_2695284 ?auto_2695286 ) ) ( not ( = ?auto_2695284 ?auto_2695287 ) ) ( not ( = ?auto_2695284 ?auto_2695288 ) ) ( not ( = ?auto_2695284 ?auto_2695289 ) ) ( not ( = ?auto_2695284 ?auto_2695290 ) ) ( not ( = ?auto_2695284 ?auto_2695291 ) ) ( not ( = ?auto_2695284 ?auto_2695292 ) ) ( not ( = ?auto_2695284 ?auto_2695293 ) ) ( not ( = ?auto_2695284 ?auto_2695294 ) ) ( not ( = ?auto_2695284 ?auto_2695295 ) ) ( not ( = ?auto_2695284 ?auto_2695296 ) ) ( not ( = ?auto_2695285 ?auto_2695286 ) ) ( not ( = ?auto_2695285 ?auto_2695287 ) ) ( not ( = ?auto_2695285 ?auto_2695288 ) ) ( not ( = ?auto_2695285 ?auto_2695289 ) ) ( not ( = ?auto_2695285 ?auto_2695290 ) ) ( not ( = ?auto_2695285 ?auto_2695291 ) ) ( not ( = ?auto_2695285 ?auto_2695292 ) ) ( not ( = ?auto_2695285 ?auto_2695293 ) ) ( not ( = ?auto_2695285 ?auto_2695294 ) ) ( not ( = ?auto_2695285 ?auto_2695295 ) ) ( not ( = ?auto_2695285 ?auto_2695296 ) ) ( not ( = ?auto_2695286 ?auto_2695287 ) ) ( not ( = ?auto_2695286 ?auto_2695288 ) ) ( not ( = ?auto_2695286 ?auto_2695289 ) ) ( not ( = ?auto_2695286 ?auto_2695290 ) ) ( not ( = ?auto_2695286 ?auto_2695291 ) ) ( not ( = ?auto_2695286 ?auto_2695292 ) ) ( not ( = ?auto_2695286 ?auto_2695293 ) ) ( not ( = ?auto_2695286 ?auto_2695294 ) ) ( not ( = ?auto_2695286 ?auto_2695295 ) ) ( not ( = ?auto_2695286 ?auto_2695296 ) ) ( not ( = ?auto_2695287 ?auto_2695288 ) ) ( not ( = ?auto_2695287 ?auto_2695289 ) ) ( not ( = ?auto_2695287 ?auto_2695290 ) ) ( not ( = ?auto_2695287 ?auto_2695291 ) ) ( not ( = ?auto_2695287 ?auto_2695292 ) ) ( not ( = ?auto_2695287 ?auto_2695293 ) ) ( not ( = ?auto_2695287 ?auto_2695294 ) ) ( not ( = ?auto_2695287 ?auto_2695295 ) ) ( not ( = ?auto_2695287 ?auto_2695296 ) ) ( not ( = ?auto_2695288 ?auto_2695289 ) ) ( not ( = ?auto_2695288 ?auto_2695290 ) ) ( not ( = ?auto_2695288 ?auto_2695291 ) ) ( not ( = ?auto_2695288 ?auto_2695292 ) ) ( not ( = ?auto_2695288 ?auto_2695293 ) ) ( not ( = ?auto_2695288 ?auto_2695294 ) ) ( not ( = ?auto_2695288 ?auto_2695295 ) ) ( not ( = ?auto_2695288 ?auto_2695296 ) ) ( not ( = ?auto_2695289 ?auto_2695290 ) ) ( not ( = ?auto_2695289 ?auto_2695291 ) ) ( not ( = ?auto_2695289 ?auto_2695292 ) ) ( not ( = ?auto_2695289 ?auto_2695293 ) ) ( not ( = ?auto_2695289 ?auto_2695294 ) ) ( not ( = ?auto_2695289 ?auto_2695295 ) ) ( not ( = ?auto_2695289 ?auto_2695296 ) ) ( not ( = ?auto_2695290 ?auto_2695291 ) ) ( not ( = ?auto_2695290 ?auto_2695292 ) ) ( not ( = ?auto_2695290 ?auto_2695293 ) ) ( not ( = ?auto_2695290 ?auto_2695294 ) ) ( not ( = ?auto_2695290 ?auto_2695295 ) ) ( not ( = ?auto_2695290 ?auto_2695296 ) ) ( not ( = ?auto_2695291 ?auto_2695292 ) ) ( not ( = ?auto_2695291 ?auto_2695293 ) ) ( not ( = ?auto_2695291 ?auto_2695294 ) ) ( not ( = ?auto_2695291 ?auto_2695295 ) ) ( not ( = ?auto_2695291 ?auto_2695296 ) ) ( not ( = ?auto_2695292 ?auto_2695293 ) ) ( not ( = ?auto_2695292 ?auto_2695294 ) ) ( not ( = ?auto_2695292 ?auto_2695295 ) ) ( not ( = ?auto_2695292 ?auto_2695296 ) ) ( not ( = ?auto_2695293 ?auto_2695294 ) ) ( not ( = ?auto_2695293 ?auto_2695295 ) ) ( not ( = ?auto_2695293 ?auto_2695296 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2695294 ?auto_2695295 ?auto_2695296 )
      ( MAKE-12CRATE-VERIFY ?auto_2695284 ?auto_2695285 ?auto_2695286 ?auto_2695287 ?auto_2695288 ?auto_2695289 ?auto_2695290 ?auto_2695291 ?auto_2695292 ?auto_2695293 ?auto_2695294 ?auto_2695295 ?auto_2695296 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2695446 - SURFACE
      ?auto_2695447 - SURFACE
      ?auto_2695448 - SURFACE
      ?auto_2695449 - SURFACE
      ?auto_2695450 - SURFACE
      ?auto_2695451 - SURFACE
      ?auto_2695452 - SURFACE
      ?auto_2695453 - SURFACE
      ?auto_2695454 - SURFACE
      ?auto_2695455 - SURFACE
      ?auto_2695456 - SURFACE
      ?auto_2695457 - SURFACE
      ?auto_2695458 - SURFACE
    )
    :vars
    (
      ?auto_2695464 - HOIST
      ?auto_2695459 - PLACE
      ?auto_2695461 - TRUCK
      ?auto_2695462 - PLACE
      ?auto_2695463 - HOIST
      ?auto_2695460 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2695464 ?auto_2695459 ) ( SURFACE-AT ?auto_2695457 ?auto_2695459 ) ( CLEAR ?auto_2695457 ) ( IS-CRATE ?auto_2695458 ) ( not ( = ?auto_2695457 ?auto_2695458 ) ) ( AVAILABLE ?auto_2695464 ) ( ON ?auto_2695457 ?auto_2695456 ) ( not ( = ?auto_2695456 ?auto_2695457 ) ) ( not ( = ?auto_2695456 ?auto_2695458 ) ) ( TRUCK-AT ?auto_2695461 ?auto_2695462 ) ( not ( = ?auto_2695462 ?auto_2695459 ) ) ( HOIST-AT ?auto_2695463 ?auto_2695462 ) ( not ( = ?auto_2695464 ?auto_2695463 ) ) ( AVAILABLE ?auto_2695463 ) ( SURFACE-AT ?auto_2695458 ?auto_2695462 ) ( ON ?auto_2695458 ?auto_2695460 ) ( CLEAR ?auto_2695458 ) ( not ( = ?auto_2695457 ?auto_2695460 ) ) ( not ( = ?auto_2695458 ?auto_2695460 ) ) ( not ( = ?auto_2695456 ?auto_2695460 ) ) ( ON ?auto_2695447 ?auto_2695446 ) ( ON ?auto_2695448 ?auto_2695447 ) ( ON ?auto_2695449 ?auto_2695448 ) ( ON ?auto_2695450 ?auto_2695449 ) ( ON ?auto_2695451 ?auto_2695450 ) ( ON ?auto_2695452 ?auto_2695451 ) ( ON ?auto_2695453 ?auto_2695452 ) ( ON ?auto_2695454 ?auto_2695453 ) ( ON ?auto_2695455 ?auto_2695454 ) ( ON ?auto_2695456 ?auto_2695455 ) ( not ( = ?auto_2695446 ?auto_2695447 ) ) ( not ( = ?auto_2695446 ?auto_2695448 ) ) ( not ( = ?auto_2695446 ?auto_2695449 ) ) ( not ( = ?auto_2695446 ?auto_2695450 ) ) ( not ( = ?auto_2695446 ?auto_2695451 ) ) ( not ( = ?auto_2695446 ?auto_2695452 ) ) ( not ( = ?auto_2695446 ?auto_2695453 ) ) ( not ( = ?auto_2695446 ?auto_2695454 ) ) ( not ( = ?auto_2695446 ?auto_2695455 ) ) ( not ( = ?auto_2695446 ?auto_2695456 ) ) ( not ( = ?auto_2695446 ?auto_2695457 ) ) ( not ( = ?auto_2695446 ?auto_2695458 ) ) ( not ( = ?auto_2695446 ?auto_2695460 ) ) ( not ( = ?auto_2695447 ?auto_2695448 ) ) ( not ( = ?auto_2695447 ?auto_2695449 ) ) ( not ( = ?auto_2695447 ?auto_2695450 ) ) ( not ( = ?auto_2695447 ?auto_2695451 ) ) ( not ( = ?auto_2695447 ?auto_2695452 ) ) ( not ( = ?auto_2695447 ?auto_2695453 ) ) ( not ( = ?auto_2695447 ?auto_2695454 ) ) ( not ( = ?auto_2695447 ?auto_2695455 ) ) ( not ( = ?auto_2695447 ?auto_2695456 ) ) ( not ( = ?auto_2695447 ?auto_2695457 ) ) ( not ( = ?auto_2695447 ?auto_2695458 ) ) ( not ( = ?auto_2695447 ?auto_2695460 ) ) ( not ( = ?auto_2695448 ?auto_2695449 ) ) ( not ( = ?auto_2695448 ?auto_2695450 ) ) ( not ( = ?auto_2695448 ?auto_2695451 ) ) ( not ( = ?auto_2695448 ?auto_2695452 ) ) ( not ( = ?auto_2695448 ?auto_2695453 ) ) ( not ( = ?auto_2695448 ?auto_2695454 ) ) ( not ( = ?auto_2695448 ?auto_2695455 ) ) ( not ( = ?auto_2695448 ?auto_2695456 ) ) ( not ( = ?auto_2695448 ?auto_2695457 ) ) ( not ( = ?auto_2695448 ?auto_2695458 ) ) ( not ( = ?auto_2695448 ?auto_2695460 ) ) ( not ( = ?auto_2695449 ?auto_2695450 ) ) ( not ( = ?auto_2695449 ?auto_2695451 ) ) ( not ( = ?auto_2695449 ?auto_2695452 ) ) ( not ( = ?auto_2695449 ?auto_2695453 ) ) ( not ( = ?auto_2695449 ?auto_2695454 ) ) ( not ( = ?auto_2695449 ?auto_2695455 ) ) ( not ( = ?auto_2695449 ?auto_2695456 ) ) ( not ( = ?auto_2695449 ?auto_2695457 ) ) ( not ( = ?auto_2695449 ?auto_2695458 ) ) ( not ( = ?auto_2695449 ?auto_2695460 ) ) ( not ( = ?auto_2695450 ?auto_2695451 ) ) ( not ( = ?auto_2695450 ?auto_2695452 ) ) ( not ( = ?auto_2695450 ?auto_2695453 ) ) ( not ( = ?auto_2695450 ?auto_2695454 ) ) ( not ( = ?auto_2695450 ?auto_2695455 ) ) ( not ( = ?auto_2695450 ?auto_2695456 ) ) ( not ( = ?auto_2695450 ?auto_2695457 ) ) ( not ( = ?auto_2695450 ?auto_2695458 ) ) ( not ( = ?auto_2695450 ?auto_2695460 ) ) ( not ( = ?auto_2695451 ?auto_2695452 ) ) ( not ( = ?auto_2695451 ?auto_2695453 ) ) ( not ( = ?auto_2695451 ?auto_2695454 ) ) ( not ( = ?auto_2695451 ?auto_2695455 ) ) ( not ( = ?auto_2695451 ?auto_2695456 ) ) ( not ( = ?auto_2695451 ?auto_2695457 ) ) ( not ( = ?auto_2695451 ?auto_2695458 ) ) ( not ( = ?auto_2695451 ?auto_2695460 ) ) ( not ( = ?auto_2695452 ?auto_2695453 ) ) ( not ( = ?auto_2695452 ?auto_2695454 ) ) ( not ( = ?auto_2695452 ?auto_2695455 ) ) ( not ( = ?auto_2695452 ?auto_2695456 ) ) ( not ( = ?auto_2695452 ?auto_2695457 ) ) ( not ( = ?auto_2695452 ?auto_2695458 ) ) ( not ( = ?auto_2695452 ?auto_2695460 ) ) ( not ( = ?auto_2695453 ?auto_2695454 ) ) ( not ( = ?auto_2695453 ?auto_2695455 ) ) ( not ( = ?auto_2695453 ?auto_2695456 ) ) ( not ( = ?auto_2695453 ?auto_2695457 ) ) ( not ( = ?auto_2695453 ?auto_2695458 ) ) ( not ( = ?auto_2695453 ?auto_2695460 ) ) ( not ( = ?auto_2695454 ?auto_2695455 ) ) ( not ( = ?auto_2695454 ?auto_2695456 ) ) ( not ( = ?auto_2695454 ?auto_2695457 ) ) ( not ( = ?auto_2695454 ?auto_2695458 ) ) ( not ( = ?auto_2695454 ?auto_2695460 ) ) ( not ( = ?auto_2695455 ?auto_2695456 ) ) ( not ( = ?auto_2695455 ?auto_2695457 ) ) ( not ( = ?auto_2695455 ?auto_2695458 ) ) ( not ( = ?auto_2695455 ?auto_2695460 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2695456 ?auto_2695457 ?auto_2695458 )
      ( MAKE-12CRATE-VERIFY ?auto_2695446 ?auto_2695447 ?auto_2695448 ?auto_2695449 ?auto_2695450 ?auto_2695451 ?auto_2695452 ?auto_2695453 ?auto_2695454 ?auto_2695455 ?auto_2695456 ?auto_2695457 ?auto_2695458 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2695609 - SURFACE
      ?auto_2695610 - SURFACE
      ?auto_2695611 - SURFACE
      ?auto_2695612 - SURFACE
      ?auto_2695613 - SURFACE
      ?auto_2695614 - SURFACE
      ?auto_2695615 - SURFACE
      ?auto_2695616 - SURFACE
      ?auto_2695617 - SURFACE
      ?auto_2695618 - SURFACE
      ?auto_2695619 - SURFACE
      ?auto_2695620 - SURFACE
      ?auto_2695621 - SURFACE
    )
    :vars
    (
      ?auto_2695627 - HOIST
      ?auto_2695623 - PLACE
      ?auto_2695626 - PLACE
      ?auto_2695624 - HOIST
      ?auto_2695622 - SURFACE
      ?auto_2695625 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2695627 ?auto_2695623 ) ( SURFACE-AT ?auto_2695620 ?auto_2695623 ) ( CLEAR ?auto_2695620 ) ( IS-CRATE ?auto_2695621 ) ( not ( = ?auto_2695620 ?auto_2695621 ) ) ( AVAILABLE ?auto_2695627 ) ( ON ?auto_2695620 ?auto_2695619 ) ( not ( = ?auto_2695619 ?auto_2695620 ) ) ( not ( = ?auto_2695619 ?auto_2695621 ) ) ( not ( = ?auto_2695626 ?auto_2695623 ) ) ( HOIST-AT ?auto_2695624 ?auto_2695626 ) ( not ( = ?auto_2695627 ?auto_2695624 ) ) ( AVAILABLE ?auto_2695624 ) ( SURFACE-AT ?auto_2695621 ?auto_2695626 ) ( ON ?auto_2695621 ?auto_2695622 ) ( CLEAR ?auto_2695621 ) ( not ( = ?auto_2695620 ?auto_2695622 ) ) ( not ( = ?auto_2695621 ?auto_2695622 ) ) ( not ( = ?auto_2695619 ?auto_2695622 ) ) ( TRUCK-AT ?auto_2695625 ?auto_2695623 ) ( ON ?auto_2695610 ?auto_2695609 ) ( ON ?auto_2695611 ?auto_2695610 ) ( ON ?auto_2695612 ?auto_2695611 ) ( ON ?auto_2695613 ?auto_2695612 ) ( ON ?auto_2695614 ?auto_2695613 ) ( ON ?auto_2695615 ?auto_2695614 ) ( ON ?auto_2695616 ?auto_2695615 ) ( ON ?auto_2695617 ?auto_2695616 ) ( ON ?auto_2695618 ?auto_2695617 ) ( ON ?auto_2695619 ?auto_2695618 ) ( not ( = ?auto_2695609 ?auto_2695610 ) ) ( not ( = ?auto_2695609 ?auto_2695611 ) ) ( not ( = ?auto_2695609 ?auto_2695612 ) ) ( not ( = ?auto_2695609 ?auto_2695613 ) ) ( not ( = ?auto_2695609 ?auto_2695614 ) ) ( not ( = ?auto_2695609 ?auto_2695615 ) ) ( not ( = ?auto_2695609 ?auto_2695616 ) ) ( not ( = ?auto_2695609 ?auto_2695617 ) ) ( not ( = ?auto_2695609 ?auto_2695618 ) ) ( not ( = ?auto_2695609 ?auto_2695619 ) ) ( not ( = ?auto_2695609 ?auto_2695620 ) ) ( not ( = ?auto_2695609 ?auto_2695621 ) ) ( not ( = ?auto_2695609 ?auto_2695622 ) ) ( not ( = ?auto_2695610 ?auto_2695611 ) ) ( not ( = ?auto_2695610 ?auto_2695612 ) ) ( not ( = ?auto_2695610 ?auto_2695613 ) ) ( not ( = ?auto_2695610 ?auto_2695614 ) ) ( not ( = ?auto_2695610 ?auto_2695615 ) ) ( not ( = ?auto_2695610 ?auto_2695616 ) ) ( not ( = ?auto_2695610 ?auto_2695617 ) ) ( not ( = ?auto_2695610 ?auto_2695618 ) ) ( not ( = ?auto_2695610 ?auto_2695619 ) ) ( not ( = ?auto_2695610 ?auto_2695620 ) ) ( not ( = ?auto_2695610 ?auto_2695621 ) ) ( not ( = ?auto_2695610 ?auto_2695622 ) ) ( not ( = ?auto_2695611 ?auto_2695612 ) ) ( not ( = ?auto_2695611 ?auto_2695613 ) ) ( not ( = ?auto_2695611 ?auto_2695614 ) ) ( not ( = ?auto_2695611 ?auto_2695615 ) ) ( not ( = ?auto_2695611 ?auto_2695616 ) ) ( not ( = ?auto_2695611 ?auto_2695617 ) ) ( not ( = ?auto_2695611 ?auto_2695618 ) ) ( not ( = ?auto_2695611 ?auto_2695619 ) ) ( not ( = ?auto_2695611 ?auto_2695620 ) ) ( not ( = ?auto_2695611 ?auto_2695621 ) ) ( not ( = ?auto_2695611 ?auto_2695622 ) ) ( not ( = ?auto_2695612 ?auto_2695613 ) ) ( not ( = ?auto_2695612 ?auto_2695614 ) ) ( not ( = ?auto_2695612 ?auto_2695615 ) ) ( not ( = ?auto_2695612 ?auto_2695616 ) ) ( not ( = ?auto_2695612 ?auto_2695617 ) ) ( not ( = ?auto_2695612 ?auto_2695618 ) ) ( not ( = ?auto_2695612 ?auto_2695619 ) ) ( not ( = ?auto_2695612 ?auto_2695620 ) ) ( not ( = ?auto_2695612 ?auto_2695621 ) ) ( not ( = ?auto_2695612 ?auto_2695622 ) ) ( not ( = ?auto_2695613 ?auto_2695614 ) ) ( not ( = ?auto_2695613 ?auto_2695615 ) ) ( not ( = ?auto_2695613 ?auto_2695616 ) ) ( not ( = ?auto_2695613 ?auto_2695617 ) ) ( not ( = ?auto_2695613 ?auto_2695618 ) ) ( not ( = ?auto_2695613 ?auto_2695619 ) ) ( not ( = ?auto_2695613 ?auto_2695620 ) ) ( not ( = ?auto_2695613 ?auto_2695621 ) ) ( not ( = ?auto_2695613 ?auto_2695622 ) ) ( not ( = ?auto_2695614 ?auto_2695615 ) ) ( not ( = ?auto_2695614 ?auto_2695616 ) ) ( not ( = ?auto_2695614 ?auto_2695617 ) ) ( not ( = ?auto_2695614 ?auto_2695618 ) ) ( not ( = ?auto_2695614 ?auto_2695619 ) ) ( not ( = ?auto_2695614 ?auto_2695620 ) ) ( not ( = ?auto_2695614 ?auto_2695621 ) ) ( not ( = ?auto_2695614 ?auto_2695622 ) ) ( not ( = ?auto_2695615 ?auto_2695616 ) ) ( not ( = ?auto_2695615 ?auto_2695617 ) ) ( not ( = ?auto_2695615 ?auto_2695618 ) ) ( not ( = ?auto_2695615 ?auto_2695619 ) ) ( not ( = ?auto_2695615 ?auto_2695620 ) ) ( not ( = ?auto_2695615 ?auto_2695621 ) ) ( not ( = ?auto_2695615 ?auto_2695622 ) ) ( not ( = ?auto_2695616 ?auto_2695617 ) ) ( not ( = ?auto_2695616 ?auto_2695618 ) ) ( not ( = ?auto_2695616 ?auto_2695619 ) ) ( not ( = ?auto_2695616 ?auto_2695620 ) ) ( not ( = ?auto_2695616 ?auto_2695621 ) ) ( not ( = ?auto_2695616 ?auto_2695622 ) ) ( not ( = ?auto_2695617 ?auto_2695618 ) ) ( not ( = ?auto_2695617 ?auto_2695619 ) ) ( not ( = ?auto_2695617 ?auto_2695620 ) ) ( not ( = ?auto_2695617 ?auto_2695621 ) ) ( not ( = ?auto_2695617 ?auto_2695622 ) ) ( not ( = ?auto_2695618 ?auto_2695619 ) ) ( not ( = ?auto_2695618 ?auto_2695620 ) ) ( not ( = ?auto_2695618 ?auto_2695621 ) ) ( not ( = ?auto_2695618 ?auto_2695622 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2695619 ?auto_2695620 ?auto_2695621 )
      ( MAKE-12CRATE-VERIFY ?auto_2695609 ?auto_2695610 ?auto_2695611 ?auto_2695612 ?auto_2695613 ?auto_2695614 ?auto_2695615 ?auto_2695616 ?auto_2695617 ?auto_2695618 ?auto_2695619 ?auto_2695620 ?auto_2695621 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2695772 - SURFACE
      ?auto_2695773 - SURFACE
      ?auto_2695774 - SURFACE
      ?auto_2695775 - SURFACE
      ?auto_2695776 - SURFACE
      ?auto_2695777 - SURFACE
      ?auto_2695778 - SURFACE
      ?auto_2695779 - SURFACE
      ?auto_2695780 - SURFACE
      ?auto_2695781 - SURFACE
      ?auto_2695782 - SURFACE
      ?auto_2695783 - SURFACE
      ?auto_2695784 - SURFACE
    )
    :vars
    (
      ?auto_2695786 - HOIST
      ?auto_2695790 - PLACE
      ?auto_2695789 - PLACE
      ?auto_2695785 - HOIST
      ?auto_2695787 - SURFACE
      ?auto_2695788 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2695786 ?auto_2695790 ) ( IS-CRATE ?auto_2695784 ) ( not ( = ?auto_2695783 ?auto_2695784 ) ) ( not ( = ?auto_2695782 ?auto_2695783 ) ) ( not ( = ?auto_2695782 ?auto_2695784 ) ) ( not ( = ?auto_2695789 ?auto_2695790 ) ) ( HOIST-AT ?auto_2695785 ?auto_2695789 ) ( not ( = ?auto_2695786 ?auto_2695785 ) ) ( AVAILABLE ?auto_2695785 ) ( SURFACE-AT ?auto_2695784 ?auto_2695789 ) ( ON ?auto_2695784 ?auto_2695787 ) ( CLEAR ?auto_2695784 ) ( not ( = ?auto_2695783 ?auto_2695787 ) ) ( not ( = ?auto_2695784 ?auto_2695787 ) ) ( not ( = ?auto_2695782 ?auto_2695787 ) ) ( TRUCK-AT ?auto_2695788 ?auto_2695790 ) ( SURFACE-AT ?auto_2695782 ?auto_2695790 ) ( CLEAR ?auto_2695782 ) ( LIFTING ?auto_2695786 ?auto_2695783 ) ( IS-CRATE ?auto_2695783 ) ( ON ?auto_2695773 ?auto_2695772 ) ( ON ?auto_2695774 ?auto_2695773 ) ( ON ?auto_2695775 ?auto_2695774 ) ( ON ?auto_2695776 ?auto_2695775 ) ( ON ?auto_2695777 ?auto_2695776 ) ( ON ?auto_2695778 ?auto_2695777 ) ( ON ?auto_2695779 ?auto_2695778 ) ( ON ?auto_2695780 ?auto_2695779 ) ( ON ?auto_2695781 ?auto_2695780 ) ( ON ?auto_2695782 ?auto_2695781 ) ( not ( = ?auto_2695772 ?auto_2695773 ) ) ( not ( = ?auto_2695772 ?auto_2695774 ) ) ( not ( = ?auto_2695772 ?auto_2695775 ) ) ( not ( = ?auto_2695772 ?auto_2695776 ) ) ( not ( = ?auto_2695772 ?auto_2695777 ) ) ( not ( = ?auto_2695772 ?auto_2695778 ) ) ( not ( = ?auto_2695772 ?auto_2695779 ) ) ( not ( = ?auto_2695772 ?auto_2695780 ) ) ( not ( = ?auto_2695772 ?auto_2695781 ) ) ( not ( = ?auto_2695772 ?auto_2695782 ) ) ( not ( = ?auto_2695772 ?auto_2695783 ) ) ( not ( = ?auto_2695772 ?auto_2695784 ) ) ( not ( = ?auto_2695772 ?auto_2695787 ) ) ( not ( = ?auto_2695773 ?auto_2695774 ) ) ( not ( = ?auto_2695773 ?auto_2695775 ) ) ( not ( = ?auto_2695773 ?auto_2695776 ) ) ( not ( = ?auto_2695773 ?auto_2695777 ) ) ( not ( = ?auto_2695773 ?auto_2695778 ) ) ( not ( = ?auto_2695773 ?auto_2695779 ) ) ( not ( = ?auto_2695773 ?auto_2695780 ) ) ( not ( = ?auto_2695773 ?auto_2695781 ) ) ( not ( = ?auto_2695773 ?auto_2695782 ) ) ( not ( = ?auto_2695773 ?auto_2695783 ) ) ( not ( = ?auto_2695773 ?auto_2695784 ) ) ( not ( = ?auto_2695773 ?auto_2695787 ) ) ( not ( = ?auto_2695774 ?auto_2695775 ) ) ( not ( = ?auto_2695774 ?auto_2695776 ) ) ( not ( = ?auto_2695774 ?auto_2695777 ) ) ( not ( = ?auto_2695774 ?auto_2695778 ) ) ( not ( = ?auto_2695774 ?auto_2695779 ) ) ( not ( = ?auto_2695774 ?auto_2695780 ) ) ( not ( = ?auto_2695774 ?auto_2695781 ) ) ( not ( = ?auto_2695774 ?auto_2695782 ) ) ( not ( = ?auto_2695774 ?auto_2695783 ) ) ( not ( = ?auto_2695774 ?auto_2695784 ) ) ( not ( = ?auto_2695774 ?auto_2695787 ) ) ( not ( = ?auto_2695775 ?auto_2695776 ) ) ( not ( = ?auto_2695775 ?auto_2695777 ) ) ( not ( = ?auto_2695775 ?auto_2695778 ) ) ( not ( = ?auto_2695775 ?auto_2695779 ) ) ( not ( = ?auto_2695775 ?auto_2695780 ) ) ( not ( = ?auto_2695775 ?auto_2695781 ) ) ( not ( = ?auto_2695775 ?auto_2695782 ) ) ( not ( = ?auto_2695775 ?auto_2695783 ) ) ( not ( = ?auto_2695775 ?auto_2695784 ) ) ( not ( = ?auto_2695775 ?auto_2695787 ) ) ( not ( = ?auto_2695776 ?auto_2695777 ) ) ( not ( = ?auto_2695776 ?auto_2695778 ) ) ( not ( = ?auto_2695776 ?auto_2695779 ) ) ( not ( = ?auto_2695776 ?auto_2695780 ) ) ( not ( = ?auto_2695776 ?auto_2695781 ) ) ( not ( = ?auto_2695776 ?auto_2695782 ) ) ( not ( = ?auto_2695776 ?auto_2695783 ) ) ( not ( = ?auto_2695776 ?auto_2695784 ) ) ( not ( = ?auto_2695776 ?auto_2695787 ) ) ( not ( = ?auto_2695777 ?auto_2695778 ) ) ( not ( = ?auto_2695777 ?auto_2695779 ) ) ( not ( = ?auto_2695777 ?auto_2695780 ) ) ( not ( = ?auto_2695777 ?auto_2695781 ) ) ( not ( = ?auto_2695777 ?auto_2695782 ) ) ( not ( = ?auto_2695777 ?auto_2695783 ) ) ( not ( = ?auto_2695777 ?auto_2695784 ) ) ( not ( = ?auto_2695777 ?auto_2695787 ) ) ( not ( = ?auto_2695778 ?auto_2695779 ) ) ( not ( = ?auto_2695778 ?auto_2695780 ) ) ( not ( = ?auto_2695778 ?auto_2695781 ) ) ( not ( = ?auto_2695778 ?auto_2695782 ) ) ( not ( = ?auto_2695778 ?auto_2695783 ) ) ( not ( = ?auto_2695778 ?auto_2695784 ) ) ( not ( = ?auto_2695778 ?auto_2695787 ) ) ( not ( = ?auto_2695779 ?auto_2695780 ) ) ( not ( = ?auto_2695779 ?auto_2695781 ) ) ( not ( = ?auto_2695779 ?auto_2695782 ) ) ( not ( = ?auto_2695779 ?auto_2695783 ) ) ( not ( = ?auto_2695779 ?auto_2695784 ) ) ( not ( = ?auto_2695779 ?auto_2695787 ) ) ( not ( = ?auto_2695780 ?auto_2695781 ) ) ( not ( = ?auto_2695780 ?auto_2695782 ) ) ( not ( = ?auto_2695780 ?auto_2695783 ) ) ( not ( = ?auto_2695780 ?auto_2695784 ) ) ( not ( = ?auto_2695780 ?auto_2695787 ) ) ( not ( = ?auto_2695781 ?auto_2695782 ) ) ( not ( = ?auto_2695781 ?auto_2695783 ) ) ( not ( = ?auto_2695781 ?auto_2695784 ) ) ( not ( = ?auto_2695781 ?auto_2695787 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2695782 ?auto_2695783 ?auto_2695784 )
      ( MAKE-12CRATE-VERIFY ?auto_2695772 ?auto_2695773 ?auto_2695774 ?auto_2695775 ?auto_2695776 ?auto_2695777 ?auto_2695778 ?auto_2695779 ?auto_2695780 ?auto_2695781 ?auto_2695782 ?auto_2695783 ?auto_2695784 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2695935 - SURFACE
      ?auto_2695936 - SURFACE
      ?auto_2695937 - SURFACE
      ?auto_2695938 - SURFACE
      ?auto_2695939 - SURFACE
      ?auto_2695940 - SURFACE
      ?auto_2695941 - SURFACE
      ?auto_2695942 - SURFACE
      ?auto_2695943 - SURFACE
      ?auto_2695944 - SURFACE
      ?auto_2695945 - SURFACE
      ?auto_2695946 - SURFACE
      ?auto_2695947 - SURFACE
    )
    :vars
    (
      ?auto_2695948 - HOIST
      ?auto_2695952 - PLACE
      ?auto_2695950 - PLACE
      ?auto_2695949 - HOIST
      ?auto_2695951 - SURFACE
      ?auto_2695953 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2695948 ?auto_2695952 ) ( IS-CRATE ?auto_2695947 ) ( not ( = ?auto_2695946 ?auto_2695947 ) ) ( not ( = ?auto_2695945 ?auto_2695946 ) ) ( not ( = ?auto_2695945 ?auto_2695947 ) ) ( not ( = ?auto_2695950 ?auto_2695952 ) ) ( HOIST-AT ?auto_2695949 ?auto_2695950 ) ( not ( = ?auto_2695948 ?auto_2695949 ) ) ( AVAILABLE ?auto_2695949 ) ( SURFACE-AT ?auto_2695947 ?auto_2695950 ) ( ON ?auto_2695947 ?auto_2695951 ) ( CLEAR ?auto_2695947 ) ( not ( = ?auto_2695946 ?auto_2695951 ) ) ( not ( = ?auto_2695947 ?auto_2695951 ) ) ( not ( = ?auto_2695945 ?auto_2695951 ) ) ( TRUCK-AT ?auto_2695953 ?auto_2695952 ) ( SURFACE-AT ?auto_2695945 ?auto_2695952 ) ( CLEAR ?auto_2695945 ) ( IS-CRATE ?auto_2695946 ) ( AVAILABLE ?auto_2695948 ) ( IN ?auto_2695946 ?auto_2695953 ) ( ON ?auto_2695936 ?auto_2695935 ) ( ON ?auto_2695937 ?auto_2695936 ) ( ON ?auto_2695938 ?auto_2695937 ) ( ON ?auto_2695939 ?auto_2695938 ) ( ON ?auto_2695940 ?auto_2695939 ) ( ON ?auto_2695941 ?auto_2695940 ) ( ON ?auto_2695942 ?auto_2695941 ) ( ON ?auto_2695943 ?auto_2695942 ) ( ON ?auto_2695944 ?auto_2695943 ) ( ON ?auto_2695945 ?auto_2695944 ) ( not ( = ?auto_2695935 ?auto_2695936 ) ) ( not ( = ?auto_2695935 ?auto_2695937 ) ) ( not ( = ?auto_2695935 ?auto_2695938 ) ) ( not ( = ?auto_2695935 ?auto_2695939 ) ) ( not ( = ?auto_2695935 ?auto_2695940 ) ) ( not ( = ?auto_2695935 ?auto_2695941 ) ) ( not ( = ?auto_2695935 ?auto_2695942 ) ) ( not ( = ?auto_2695935 ?auto_2695943 ) ) ( not ( = ?auto_2695935 ?auto_2695944 ) ) ( not ( = ?auto_2695935 ?auto_2695945 ) ) ( not ( = ?auto_2695935 ?auto_2695946 ) ) ( not ( = ?auto_2695935 ?auto_2695947 ) ) ( not ( = ?auto_2695935 ?auto_2695951 ) ) ( not ( = ?auto_2695936 ?auto_2695937 ) ) ( not ( = ?auto_2695936 ?auto_2695938 ) ) ( not ( = ?auto_2695936 ?auto_2695939 ) ) ( not ( = ?auto_2695936 ?auto_2695940 ) ) ( not ( = ?auto_2695936 ?auto_2695941 ) ) ( not ( = ?auto_2695936 ?auto_2695942 ) ) ( not ( = ?auto_2695936 ?auto_2695943 ) ) ( not ( = ?auto_2695936 ?auto_2695944 ) ) ( not ( = ?auto_2695936 ?auto_2695945 ) ) ( not ( = ?auto_2695936 ?auto_2695946 ) ) ( not ( = ?auto_2695936 ?auto_2695947 ) ) ( not ( = ?auto_2695936 ?auto_2695951 ) ) ( not ( = ?auto_2695937 ?auto_2695938 ) ) ( not ( = ?auto_2695937 ?auto_2695939 ) ) ( not ( = ?auto_2695937 ?auto_2695940 ) ) ( not ( = ?auto_2695937 ?auto_2695941 ) ) ( not ( = ?auto_2695937 ?auto_2695942 ) ) ( not ( = ?auto_2695937 ?auto_2695943 ) ) ( not ( = ?auto_2695937 ?auto_2695944 ) ) ( not ( = ?auto_2695937 ?auto_2695945 ) ) ( not ( = ?auto_2695937 ?auto_2695946 ) ) ( not ( = ?auto_2695937 ?auto_2695947 ) ) ( not ( = ?auto_2695937 ?auto_2695951 ) ) ( not ( = ?auto_2695938 ?auto_2695939 ) ) ( not ( = ?auto_2695938 ?auto_2695940 ) ) ( not ( = ?auto_2695938 ?auto_2695941 ) ) ( not ( = ?auto_2695938 ?auto_2695942 ) ) ( not ( = ?auto_2695938 ?auto_2695943 ) ) ( not ( = ?auto_2695938 ?auto_2695944 ) ) ( not ( = ?auto_2695938 ?auto_2695945 ) ) ( not ( = ?auto_2695938 ?auto_2695946 ) ) ( not ( = ?auto_2695938 ?auto_2695947 ) ) ( not ( = ?auto_2695938 ?auto_2695951 ) ) ( not ( = ?auto_2695939 ?auto_2695940 ) ) ( not ( = ?auto_2695939 ?auto_2695941 ) ) ( not ( = ?auto_2695939 ?auto_2695942 ) ) ( not ( = ?auto_2695939 ?auto_2695943 ) ) ( not ( = ?auto_2695939 ?auto_2695944 ) ) ( not ( = ?auto_2695939 ?auto_2695945 ) ) ( not ( = ?auto_2695939 ?auto_2695946 ) ) ( not ( = ?auto_2695939 ?auto_2695947 ) ) ( not ( = ?auto_2695939 ?auto_2695951 ) ) ( not ( = ?auto_2695940 ?auto_2695941 ) ) ( not ( = ?auto_2695940 ?auto_2695942 ) ) ( not ( = ?auto_2695940 ?auto_2695943 ) ) ( not ( = ?auto_2695940 ?auto_2695944 ) ) ( not ( = ?auto_2695940 ?auto_2695945 ) ) ( not ( = ?auto_2695940 ?auto_2695946 ) ) ( not ( = ?auto_2695940 ?auto_2695947 ) ) ( not ( = ?auto_2695940 ?auto_2695951 ) ) ( not ( = ?auto_2695941 ?auto_2695942 ) ) ( not ( = ?auto_2695941 ?auto_2695943 ) ) ( not ( = ?auto_2695941 ?auto_2695944 ) ) ( not ( = ?auto_2695941 ?auto_2695945 ) ) ( not ( = ?auto_2695941 ?auto_2695946 ) ) ( not ( = ?auto_2695941 ?auto_2695947 ) ) ( not ( = ?auto_2695941 ?auto_2695951 ) ) ( not ( = ?auto_2695942 ?auto_2695943 ) ) ( not ( = ?auto_2695942 ?auto_2695944 ) ) ( not ( = ?auto_2695942 ?auto_2695945 ) ) ( not ( = ?auto_2695942 ?auto_2695946 ) ) ( not ( = ?auto_2695942 ?auto_2695947 ) ) ( not ( = ?auto_2695942 ?auto_2695951 ) ) ( not ( = ?auto_2695943 ?auto_2695944 ) ) ( not ( = ?auto_2695943 ?auto_2695945 ) ) ( not ( = ?auto_2695943 ?auto_2695946 ) ) ( not ( = ?auto_2695943 ?auto_2695947 ) ) ( not ( = ?auto_2695943 ?auto_2695951 ) ) ( not ( = ?auto_2695944 ?auto_2695945 ) ) ( not ( = ?auto_2695944 ?auto_2695946 ) ) ( not ( = ?auto_2695944 ?auto_2695947 ) ) ( not ( = ?auto_2695944 ?auto_2695951 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2695945 ?auto_2695946 ?auto_2695947 )
      ( MAKE-12CRATE-VERIFY ?auto_2695935 ?auto_2695936 ?auto_2695937 ?auto_2695938 ?auto_2695939 ?auto_2695940 ?auto_2695941 ?auto_2695942 ?auto_2695943 ?auto_2695944 ?auto_2695945 ?auto_2695946 ?auto_2695947 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2707467 - SURFACE
      ?auto_2707468 - SURFACE
      ?auto_2707469 - SURFACE
      ?auto_2707470 - SURFACE
      ?auto_2707471 - SURFACE
      ?auto_2707472 - SURFACE
      ?auto_2707473 - SURFACE
      ?auto_2707474 - SURFACE
      ?auto_2707475 - SURFACE
      ?auto_2707476 - SURFACE
      ?auto_2707477 - SURFACE
      ?auto_2707478 - SURFACE
      ?auto_2707479 - SURFACE
      ?auto_2707480 - SURFACE
    )
    :vars
    (
      ?auto_2707481 - HOIST
      ?auto_2707482 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2707481 ?auto_2707482 ) ( SURFACE-AT ?auto_2707479 ?auto_2707482 ) ( CLEAR ?auto_2707479 ) ( LIFTING ?auto_2707481 ?auto_2707480 ) ( IS-CRATE ?auto_2707480 ) ( not ( = ?auto_2707479 ?auto_2707480 ) ) ( ON ?auto_2707468 ?auto_2707467 ) ( ON ?auto_2707469 ?auto_2707468 ) ( ON ?auto_2707470 ?auto_2707469 ) ( ON ?auto_2707471 ?auto_2707470 ) ( ON ?auto_2707472 ?auto_2707471 ) ( ON ?auto_2707473 ?auto_2707472 ) ( ON ?auto_2707474 ?auto_2707473 ) ( ON ?auto_2707475 ?auto_2707474 ) ( ON ?auto_2707476 ?auto_2707475 ) ( ON ?auto_2707477 ?auto_2707476 ) ( ON ?auto_2707478 ?auto_2707477 ) ( ON ?auto_2707479 ?auto_2707478 ) ( not ( = ?auto_2707467 ?auto_2707468 ) ) ( not ( = ?auto_2707467 ?auto_2707469 ) ) ( not ( = ?auto_2707467 ?auto_2707470 ) ) ( not ( = ?auto_2707467 ?auto_2707471 ) ) ( not ( = ?auto_2707467 ?auto_2707472 ) ) ( not ( = ?auto_2707467 ?auto_2707473 ) ) ( not ( = ?auto_2707467 ?auto_2707474 ) ) ( not ( = ?auto_2707467 ?auto_2707475 ) ) ( not ( = ?auto_2707467 ?auto_2707476 ) ) ( not ( = ?auto_2707467 ?auto_2707477 ) ) ( not ( = ?auto_2707467 ?auto_2707478 ) ) ( not ( = ?auto_2707467 ?auto_2707479 ) ) ( not ( = ?auto_2707467 ?auto_2707480 ) ) ( not ( = ?auto_2707468 ?auto_2707469 ) ) ( not ( = ?auto_2707468 ?auto_2707470 ) ) ( not ( = ?auto_2707468 ?auto_2707471 ) ) ( not ( = ?auto_2707468 ?auto_2707472 ) ) ( not ( = ?auto_2707468 ?auto_2707473 ) ) ( not ( = ?auto_2707468 ?auto_2707474 ) ) ( not ( = ?auto_2707468 ?auto_2707475 ) ) ( not ( = ?auto_2707468 ?auto_2707476 ) ) ( not ( = ?auto_2707468 ?auto_2707477 ) ) ( not ( = ?auto_2707468 ?auto_2707478 ) ) ( not ( = ?auto_2707468 ?auto_2707479 ) ) ( not ( = ?auto_2707468 ?auto_2707480 ) ) ( not ( = ?auto_2707469 ?auto_2707470 ) ) ( not ( = ?auto_2707469 ?auto_2707471 ) ) ( not ( = ?auto_2707469 ?auto_2707472 ) ) ( not ( = ?auto_2707469 ?auto_2707473 ) ) ( not ( = ?auto_2707469 ?auto_2707474 ) ) ( not ( = ?auto_2707469 ?auto_2707475 ) ) ( not ( = ?auto_2707469 ?auto_2707476 ) ) ( not ( = ?auto_2707469 ?auto_2707477 ) ) ( not ( = ?auto_2707469 ?auto_2707478 ) ) ( not ( = ?auto_2707469 ?auto_2707479 ) ) ( not ( = ?auto_2707469 ?auto_2707480 ) ) ( not ( = ?auto_2707470 ?auto_2707471 ) ) ( not ( = ?auto_2707470 ?auto_2707472 ) ) ( not ( = ?auto_2707470 ?auto_2707473 ) ) ( not ( = ?auto_2707470 ?auto_2707474 ) ) ( not ( = ?auto_2707470 ?auto_2707475 ) ) ( not ( = ?auto_2707470 ?auto_2707476 ) ) ( not ( = ?auto_2707470 ?auto_2707477 ) ) ( not ( = ?auto_2707470 ?auto_2707478 ) ) ( not ( = ?auto_2707470 ?auto_2707479 ) ) ( not ( = ?auto_2707470 ?auto_2707480 ) ) ( not ( = ?auto_2707471 ?auto_2707472 ) ) ( not ( = ?auto_2707471 ?auto_2707473 ) ) ( not ( = ?auto_2707471 ?auto_2707474 ) ) ( not ( = ?auto_2707471 ?auto_2707475 ) ) ( not ( = ?auto_2707471 ?auto_2707476 ) ) ( not ( = ?auto_2707471 ?auto_2707477 ) ) ( not ( = ?auto_2707471 ?auto_2707478 ) ) ( not ( = ?auto_2707471 ?auto_2707479 ) ) ( not ( = ?auto_2707471 ?auto_2707480 ) ) ( not ( = ?auto_2707472 ?auto_2707473 ) ) ( not ( = ?auto_2707472 ?auto_2707474 ) ) ( not ( = ?auto_2707472 ?auto_2707475 ) ) ( not ( = ?auto_2707472 ?auto_2707476 ) ) ( not ( = ?auto_2707472 ?auto_2707477 ) ) ( not ( = ?auto_2707472 ?auto_2707478 ) ) ( not ( = ?auto_2707472 ?auto_2707479 ) ) ( not ( = ?auto_2707472 ?auto_2707480 ) ) ( not ( = ?auto_2707473 ?auto_2707474 ) ) ( not ( = ?auto_2707473 ?auto_2707475 ) ) ( not ( = ?auto_2707473 ?auto_2707476 ) ) ( not ( = ?auto_2707473 ?auto_2707477 ) ) ( not ( = ?auto_2707473 ?auto_2707478 ) ) ( not ( = ?auto_2707473 ?auto_2707479 ) ) ( not ( = ?auto_2707473 ?auto_2707480 ) ) ( not ( = ?auto_2707474 ?auto_2707475 ) ) ( not ( = ?auto_2707474 ?auto_2707476 ) ) ( not ( = ?auto_2707474 ?auto_2707477 ) ) ( not ( = ?auto_2707474 ?auto_2707478 ) ) ( not ( = ?auto_2707474 ?auto_2707479 ) ) ( not ( = ?auto_2707474 ?auto_2707480 ) ) ( not ( = ?auto_2707475 ?auto_2707476 ) ) ( not ( = ?auto_2707475 ?auto_2707477 ) ) ( not ( = ?auto_2707475 ?auto_2707478 ) ) ( not ( = ?auto_2707475 ?auto_2707479 ) ) ( not ( = ?auto_2707475 ?auto_2707480 ) ) ( not ( = ?auto_2707476 ?auto_2707477 ) ) ( not ( = ?auto_2707476 ?auto_2707478 ) ) ( not ( = ?auto_2707476 ?auto_2707479 ) ) ( not ( = ?auto_2707476 ?auto_2707480 ) ) ( not ( = ?auto_2707477 ?auto_2707478 ) ) ( not ( = ?auto_2707477 ?auto_2707479 ) ) ( not ( = ?auto_2707477 ?auto_2707480 ) ) ( not ( = ?auto_2707478 ?auto_2707479 ) ) ( not ( = ?auto_2707478 ?auto_2707480 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2707479 ?auto_2707480 )
      ( MAKE-13CRATE-VERIFY ?auto_2707467 ?auto_2707468 ?auto_2707469 ?auto_2707470 ?auto_2707471 ?auto_2707472 ?auto_2707473 ?auto_2707474 ?auto_2707475 ?auto_2707476 ?auto_2707477 ?auto_2707478 ?auto_2707479 ?auto_2707480 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2707609 - SURFACE
      ?auto_2707610 - SURFACE
      ?auto_2707611 - SURFACE
      ?auto_2707612 - SURFACE
      ?auto_2707613 - SURFACE
      ?auto_2707614 - SURFACE
      ?auto_2707615 - SURFACE
      ?auto_2707616 - SURFACE
      ?auto_2707617 - SURFACE
      ?auto_2707618 - SURFACE
      ?auto_2707619 - SURFACE
      ?auto_2707620 - SURFACE
      ?auto_2707621 - SURFACE
      ?auto_2707622 - SURFACE
    )
    :vars
    (
      ?auto_2707624 - HOIST
      ?auto_2707623 - PLACE
      ?auto_2707625 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2707624 ?auto_2707623 ) ( SURFACE-AT ?auto_2707621 ?auto_2707623 ) ( CLEAR ?auto_2707621 ) ( IS-CRATE ?auto_2707622 ) ( not ( = ?auto_2707621 ?auto_2707622 ) ) ( TRUCK-AT ?auto_2707625 ?auto_2707623 ) ( AVAILABLE ?auto_2707624 ) ( IN ?auto_2707622 ?auto_2707625 ) ( ON ?auto_2707621 ?auto_2707620 ) ( not ( = ?auto_2707620 ?auto_2707621 ) ) ( not ( = ?auto_2707620 ?auto_2707622 ) ) ( ON ?auto_2707610 ?auto_2707609 ) ( ON ?auto_2707611 ?auto_2707610 ) ( ON ?auto_2707612 ?auto_2707611 ) ( ON ?auto_2707613 ?auto_2707612 ) ( ON ?auto_2707614 ?auto_2707613 ) ( ON ?auto_2707615 ?auto_2707614 ) ( ON ?auto_2707616 ?auto_2707615 ) ( ON ?auto_2707617 ?auto_2707616 ) ( ON ?auto_2707618 ?auto_2707617 ) ( ON ?auto_2707619 ?auto_2707618 ) ( ON ?auto_2707620 ?auto_2707619 ) ( not ( = ?auto_2707609 ?auto_2707610 ) ) ( not ( = ?auto_2707609 ?auto_2707611 ) ) ( not ( = ?auto_2707609 ?auto_2707612 ) ) ( not ( = ?auto_2707609 ?auto_2707613 ) ) ( not ( = ?auto_2707609 ?auto_2707614 ) ) ( not ( = ?auto_2707609 ?auto_2707615 ) ) ( not ( = ?auto_2707609 ?auto_2707616 ) ) ( not ( = ?auto_2707609 ?auto_2707617 ) ) ( not ( = ?auto_2707609 ?auto_2707618 ) ) ( not ( = ?auto_2707609 ?auto_2707619 ) ) ( not ( = ?auto_2707609 ?auto_2707620 ) ) ( not ( = ?auto_2707609 ?auto_2707621 ) ) ( not ( = ?auto_2707609 ?auto_2707622 ) ) ( not ( = ?auto_2707610 ?auto_2707611 ) ) ( not ( = ?auto_2707610 ?auto_2707612 ) ) ( not ( = ?auto_2707610 ?auto_2707613 ) ) ( not ( = ?auto_2707610 ?auto_2707614 ) ) ( not ( = ?auto_2707610 ?auto_2707615 ) ) ( not ( = ?auto_2707610 ?auto_2707616 ) ) ( not ( = ?auto_2707610 ?auto_2707617 ) ) ( not ( = ?auto_2707610 ?auto_2707618 ) ) ( not ( = ?auto_2707610 ?auto_2707619 ) ) ( not ( = ?auto_2707610 ?auto_2707620 ) ) ( not ( = ?auto_2707610 ?auto_2707621 ) ) ( not ( = ?auto_2707610 ?auto_2707622 ) ) ( not ( = ?auto_2707611 ?auto_2707612 ) ) ( not ( = ?auto_2707611 ?auto_2707613 ) ) ( not ( = ?auto_2707611 ?auto_2707614 ) ) ( not ( = ?auto_2707611 ?auto_2707615 ) ) ( not ( = ?auto_2707611 ?auto_2707616 ) ) ( not ( = ?auto_2707611 ?auto_2707617 ) ) ( not ( = ?auto_2707611 ?auto_2707618 ) ) ( not ( = ?auto_2707611 ?auto_2707619 ) ) ( not ( = ?auto_2707611 ?auto_2707620 ) ) ( not ( = ?auto_2707611 ?auto_2707621 ) ) ( not ( = ?auto_2707611 ?auto_2707622 ) ) ( not ( = ?auto_2707612 ?auto_2707613 ) ) ( not ( = ?auto_2707612 ?auto_2707614 ) ) ( not ( = ?auto_2707612 ?auto_2707615 ) ) ( not ( = ?auto_2707612 ?auto_2707616 ) ) ( not ( = ?auto_2707612 ?auto_2707617 ) ) ( not ( = ?auto_2707612 ?auto_2707618 ) ) ( not ( = ?auto_2707612 ?auto_2707619 ) ) ( not ( = ?auto_2707612 ?auto_2707620 ) ) ( not ( = ?auto_2707612 ?auto_2707621 ) ) ( not ( = ?auto_2707612 ?auto_2707622 ) ) ( not ( = ?auto_2707613 ?auto_2707614 ) ) ( not ( = ?auto_2707613 ?auto_2707615 ) ) ( not ( = ?auto_2707613 ?auto_2707616 ) ) ( not ( = ?auto_2707613 ?auto_2707617 ) ) ( not ( = ?auto_2707613 ?auto_2707618 ) ) ( not ( = ?auto_2707613 ?auto_2707619 ) ) ( not ( = ?auto_2707613 ?auto_2707620 ) ) ( not ( = ?auto_2707613 ?auto_2707621 ) ) ( not ( = ?auto_2707613 ?auto_2707622 ) ) ( not ( = ?auto_2707614 ?auto_2707615 ) ) ( not ( = ?auto_2707614 ?auto_2707616 ) ) ( not ( = ?auto_2707614 ?auto_2707617 ) ) ( not ( = ?auto_2707614 ?auto_2707618 ) ) ( not ( = ?auto_2707614 ?auto_2707619 ) ) ( not ( = ?auto_2707614 ?auto_2707620 ) ) ( not ( = ?auto_2707614 ?auto_2707621 ) ) ( not ( = ?auto_2707614 ?auto_2707622 ) ) ( not ( = ?auto_2707615 ?auto_2707616 ) ) ( not ( = ?auto_2707615 ?auto_2707617 ) ) ( not ( = ?auto_2707615 ?auto_2707618 ) ) ( not ( = ?auto_2707615 ?auto_2707619 ) ) ( not ( = ?auto_2707615 ?auto_2707620 ) ) ( not ( = ?auto_2707615 ?auto_2707621 ) ) ( not ( = ?auto_2707615 ?auto_2707622 ) ) ( not ( = ?auto_2707616 ?auto_2707617 ) ) ( not ( = ?auto_2707616 ?auto_2707618 ) ) ( not ( = ?auto_2707616 ?auto_2707619 ) ) ( not ( = ?auto_2707616 ?auto_2707620 ) ) ( not ( = ?auto_2707616 ?auto_2707621 ) ) ( not ( = ?auto_2707616 ?auto_2707622 ) ) ( not ( = ?auto_2707617 ?auto_2707618 ) ) ( not ( = ?auto_2707617 ?auto_2707619 ) ) ( not ( = ?auto_2707617 ?auto_2707620 ) ) ( not ( = ?auto_2707617 ?auto_2707621 ) ) ( not ( = ?auto_2707617 ?auto_2707622 ) ) ( not ( = ?auto_2707618 ?auto_2707619 ) ) ( not ( = ?auto_2707618 ?auto_2707620 ) ) ( not ( = ?auto_2707618 ?auto_2707621 ) ) ( not ( = ?auto_2707618 ?auto_2707622 ) ) ( not ( = ?auto_2707619 ?auto_2707620 ) ) ( not ( = ?auto_2707619 ?auto_2707621 ) ) ( not ( = ?auto_2707619 ?auto_2707622 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2707620 ?auto_2707621 ?auto_2707622 )
      ( MAKE-13CRATE-VERIFY ?auto_2707609 ?auto_2707610 ?auto_2707611 ?auto_2707612 ?auto_2707613 ?auto_2707614 ?auto_2707615 ?auto_2707616 ?auto_2707617 ?auto_2707618 ?auto_2707619 ?auto_2707620 ?auto_2707621 ?auto_2707622 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2707765 - SURFACE
      ?auto_2707766 - SURFACE
      ?auto_2707767 - SURFACE
      ?auto_2707768 - SURFACE
      ?auto_2707769 - SURFACE
      ?auto_2707770 - SURFACE
      ?auto_2707771 - SURFACE
      ?auto_2707772 - SURFACE
      ?auto_2707773 - SURFACE
      ?auto_2707774 - SURFACE
      ?auto_2707775 - SURFACE
      ?auto_2707776 - SURFACE
      ?auto_2707777 - SURFACE
      ?auto_2707778 - SURFACE
    )
    :vars
    (
      ?auto_2707779 - HOIST
      ?auto_2707782 - PLACE
      ?auto_2707781 - TRUCK
      ?auto_2707780 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2707779 ?auto_2707782 ) ( SURFACE-AT ?auto_2707777 ?auto_2707782 ) ( CLEAR ?auto_2707777 ) ( IS-CRATE ?auto_2707778 ) ( not ( = ?auto_2707777 ?auto_2707778 ) ) ( AVAILABLE ?auto_2707779 ) ( IN ?auto_2707778 ?auto_2707781 ) ( ON ?auto_2707777 ?auto_2707776 ) ( not ( = ?auto_2707776 ?auto_2707777 ) ) ( not ( = ?auto_2707776 ?auto_2707778 ) ) ( TRUCK-AT ?auto_2707781 ?auto_2707780 ) ( not ( = ?auto_2707780 ?auto_2707782 ) ) ( ON ?auto_2707766 ?auto_2707765 ) ( ON ?auto_2707767 ?auto_2707766 ) ( ON ?auto_2707768 ?auto_2707767 ) ( ON ?auto_2707769 ?auto_2707768 ) ( ON ?auto_2707770 ?auto_2707769 ) ( ON ?auto_2707771 ?auto_2707770 ) ( ON ?auto_2707772 ?auto_2707771 ) ( ON ?auto_2707773 ?auto_2707772 ) ( ON ?auto_2707774 ?auto_2707773 ) ( ON ?auto_2707775 ?auto_2707774 ) ( ON ?auto_2707776 ?auto_2707775 ) ( not ( = ?auto_2707765 ?auto_2707766 ) ) ( not ( = ?auto_2707765 ?auto_2707767 ) ) ( not ( = ?auto_2707765 ?auto_2707768 ) ) ( not ( = ?auto_2707765 ?auto_2707769 ) ) ( not ( = ?auto_2707765 ?auto_2707770 ) ) ( not ( = ?auto_2707765 ?auto_2707771 ) ) ( not ( = ?auto_2707765 ?auto_2707772 ) ) ( not ( = ?auto_2707765 ?auto_2707773 ) ) ( not ( = ?auto_2707765 ?auto_2707774 ) ) ( not ( = ?auto_2707765 ?auto_2707775 ) ) ( not ( = ?auto_2707765 ?auto_2707776 ) ) ( not ( = ?auto_2707765 ?auto_2707777 ) ) ( not ( = ?auto_2707765 ?auto_2707778 ) ) ( not ( = ?auto_2707766 ?auto_2707767 ) ) ( not ( = ?auto_2707766 ?auto_2707768 ) ) ( not ( = ?auto_2707766 ?auto_2707769 ) ) ( not ( = ?auto_2707766 ?auto_2707770 ) ) ( not ( = ?auto_2707766 ?auto_2707771 ) ) ( not ( = ?auto_2707766 ?auto_2707772 ) ) ( not ( = ?auto_2707766 ?auto_2707773 ) ) ( not ( = ?auto_2707766 ?auto_2707774 ) ) ( not ( = ?auto_2707766 ?auto_2707775 ) ) ( not ( = ?auto_2707766 ?auto_2707776 ) ) ( not ( = ?auto_2707766 ?auto_2707777 ) ) ( not ( = ?auto_2707766 ?auto_2707778 ) ) ( not ( = ?auto_2707767 ?auto_2707768 ) ) ( not ( = ?auto_2707767 ?auto_2707769 ) ) ( not ( = ?auto_2707767 ?auto_2707770 ) ) ( not ( = ?auto_2707767 ?auto_2707771 ) ) ( not ( = ?auto_2707767 ?auto_2707772 ) ) ( not ( = ?auto_2707767 ?auto_2707773 ) ) ( not ( = ?auto_2707767 ?auto_2707774 ) ) ( not ( = ?auto_2707767 ?auto_2707775 ) ) ( not ( = ?auto_2707767 ?auto_2707776 ) ) ( not ( = ?auto_2707767 ?auto_2707777 ) ) ( not ( = ?auto_2707767 ?auto_2707778 ) ) ( not ( = ?auto_2707768 ?auto_2707769 ) ) ( not ( = ?auto_2707768 ?auto_2707770 ) ) ( not ( = ?auto_2707768 ?auto_2707771 ) ) ( not ( = ?auto_2707768 ?auto_2707772 ) ) ( not ( = ?auto_2707768 ?auto_2707773 ) ) ( not ( = ?auto_2707768 ?auto_2707774 ) ) ( not ( = ?auto_2707768 ?auto_2707775 ) ) ( not ( = ?auto_2707768 ?auto_2707776 ) ) ( not ( = ?auto_2707768 ?auto_2707777 ) ) ( not ( = ?auto_2707768 ?auto_2707778 ) ) ( not ( = ?auto_2707769 ?auto_2707770 ) ) ( not ( = ?auto_2707769 ?auto_2707771 ) ) ( not ( = ?auto_2707769 ?auto_2707772 ) ) ( not ( = ?auto_2707769 ?auto_2707773 ) ) ( not ( = ?auto_2707769 ?auto_2707774 ) ) ( not ( = ?auto_2707769 ?auto_2707775 ) ) ( not ( = ?auto_2707769 ?auto_2707776 ) ) ( not ( = ?auto_2707769 ?auto_2707777 ) ) ( not ( = ?auto_2707769 ?auto_2707778 ) ) ( not ( = ?auto_2707770 ?auto_2707771 ) ) ( not ( = ?auto_2707770 ?auto_2707772 ) ) ( not ( = ?auto_2707770 ?auto_2707773 ) ) ( not ( = ?auto_2707770 ?auto_2707774 ) ) ( not ( = ?auto_2707770 ?auto_2707775 ) ) ( not ( = ?auto_2707770 ?auto_2707776 ) ) ( not ( = ?auto_2707770 ?auto_2707777 ) ) ( not ( = ?auto_2707770 ?auto_2707778 ) ) ( not ( = ?auto_2707771 ?auto_2707772 ) ) ( not ( = ?auto_2707771 ?auto_2707773 ) ) ( not ( = ?auto_2707771 ?auto_2707774 ) ) ( not ( = ?auto_2707771 ?auto_2707775 ) ) ( not ( = ?auto_2707771 ?auto_2707776 ) ) ( not ( = ?auto_2707771 ?auto_2707777 ) ) ( not ( = ?auto_2707771 ?auto_2707778 ) ) ( not ( = ?auto_2707772 ?auto_2707773 ) ) ( not ( = ?auto_2707772 ?auto_2707774 ) ) ( not ( = ?auto_2707772 ?auto_2707775 ) ) ( not ( = ?auto_2707772 ?auto_2707776 ) ) ( not ( = ?auto_2707772 ?auto_2707777 ) ) ( not ( = ?auto_2707772 ?auto_2707778 ) ) ( not ( = ?auto_2707773 ?auto_2707774 ) ) ( not ( = ?auto_2707773 ?auto_2707775 ) ) ( not ( = ?auto_2707773 ?auto_2707776 ) ) ( not ( = ?auto_2707773 ?auto_2707777 ) ) ( not ( = ?auto_2707773 ?auto_2707778 ) ) ( not ( = ?auto_2707774 ?auto_2707775 ) ) ( not ( = ?auto_2707774 ?auto_2707776 ) ) ( not ( = ?auto_2707774 ?auto_2707777 ) ) ( not ( = ?auto_2707774 ?auto_2707778 ) ) ( not ( = ?auto_2707775 ?auto_2707776 ) ) ( not ( = ?auto_2707775 ?auto_2707777 ) ) ( not ( = ?auto_2707775 ?auto_2707778 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2707776 ?auto_2707777 ?auto_2707778 )
      ( MAKE-13CRATE-VERIFY ?auto_2707765 ?auto_2707766 ?auto_2707767 ?auto_2707768 ?auto_2707769 ?auto_2707770 ?auto_2707771 ?auto_2707772 ?auto_2707773 ?auto_2707774 ?auto_2707775 ?auto_2707776 ?auto_2707777 ?auto_2707778 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2707934 - SURFACE
      ?auto_2707935 - SURFACE
      ?auto_2707936 - SURFACE
      ?auto_2707937 - SURFACE
      ?auto_2707938 - SURFACE
      ?auto_2707939 - SURFACE
      ?auto_2707940 - SURFACE
      ?auto_2707941 - SURFACE
      ?auto_2707942 - SURFACE
      ?auto_2707943 - SURFACE
      ?auto_2707944 - SURFACE
      ?auto_2707945 - SURFACE
      ?auto_2707946 - SURFACE
      ?auto_2707947 - SURFACE
    )
    :vars
    (
      ?auto_2707949 - HOIST
      ?auto_2707952 - PLACE
      ?auto_2707951 - TRUCK
      ?auto_2707950 - PLACE
      ?auto_2707948 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2707949 ?auto_2707952 ) ( SURFACE-AT ?auto_2707946 ?auto_2707952 ) ( CLEAR ?auto_2707946 ) ( IS-CRATE ?auto_2707947 ) ( not ( = ?auto_2707946 ?auto_2707947 ) ) ( AVAILABLE ?auto_2707949 ) ( ON ?auto_2707946 ?auto_2707945 ) ( not ( = ?auto_2707945 ?auto_2707946 ) ) ( not ( = ?auto_2707945 ?auto_2707947 ) ) ( TRUCK-AT ?auto_2707951 ?auto_2707950 ) ( not ( = ?auto_2707950 ?auto_2707952 ) ) ( HOIST-AT ?auto_2707948 ?auto_2707950 ) ( LIFTING ?auto_2707948 ?auto_2707947 ) ( not ( = ?auto_2707949 ?auto_2707948 ) ) ( ON ?auto_2707935 ?auto_2707934 ) ( ON ?auto_2707936 ?auto_2707935 ) ( ON ?auto_2707937 ?auto_2707936 ) ( ON ?auto_2707938 ?auto_2707937 ) ( ON ?auto_2707939 ?auto_2707938 ) ( ON ?auto_2707940 ?auto_2707939 ) ( ON ?auto_2707941 ?auto_2707940 ) ( ON ?auto_2707942 ?auto_2707941 ) ( ON ?auto_2707943 ?auto_2707942 ) ( ON ?auto_2707944 ?auto_2707943 ) ( ON ?auto_2707945 ?auto_2707944 ) ( not ( = ?auto_2707934 ?auto_2707935 ) ) ( not ( = ?auto_2707934 ?auto_2707936 ) ) ( not ( = ?auto_2707934 ?auto_2707937 ) ) ( not ( = ?auto_2707934 ?auto_2707938 ) ) ( not ( = ?auto_2707934 ?auto_2707939 ) ) ( not ( = ?auto_2707934 ?auto_2707940 ) ) ( not ( = ?auto_2707934 ?auto_2707941 ) ) ( not ( = ?auto_2707934 ?auto_2707942 ) ) ( not ( = ?auto_2707934 ?auto_2707943 ) ) ( not ( = ?auto_2707934 ?auto_2707944 ) ) ( not ( = ?auto_2707934 ?auto_2707945 ) ) ( not ( = ?auto_2707934 ?auto_2707946 ) ) ( not ( = ?auto_2707934 ?auto_2707947 ) ) ( not ( = ?auto_2707935 ?auto_2707936 ) ) ( not ( = ?auto_2707935 ?auto_2707937 ) ) ( not ( = ?auto_2707935 ?auto_2707938 ) ) ( not ( = ?auto_2707935 ?auto_2707939 ) ) ( not ( = ?auto_2707935 ?auto_2707940 ) ) ( not ( = ?auto_2707935 ?auto_2707941 ) ) ( not ( = ?auto_2707935 ?auto_2707942 ) ) ( not ( = ?auto_2707935 ?auto_2707943 ) ) ( not ( = ?auto_2707935 ?auto_2707944 ) ) ( not ( = ?auto_2707935 ?auto_2707945 ) ) ( not ( = ?auto_2707935 ?auto_2707946 ) ) ( not ( = ?auto_2707935 ?auto_2707947 ) ) ( not ( = ?auto_2707936 ?auto_2707937 ) ) ( not ( = ?auto_2707936 ?auto_2707938 ) ) ( not ( = ?auto_2707936 ?auto_2707939 ) ) ( not ( = ?auto_2707936 ?auto_2707940 ) ) ( not ( = ?auto_2707936 ?auto_2707941 ) ) ( not ( = ?auto_2707936 ?auto_2707942 ) ) ( not ( = ?auto_2707936 ?auto_2707943 ) ) ( not ( = ?auto_2707936 ?auto_2707944 ) ) ( not ( = ?auto_2707936 ?auto_2707945 ) ) ( not ( = ?auto_2707936 ?auto_2707946 ) ) ( not ( = ?auto_2707936 ?auto_2707947 ) ) ( not ( = ?auto_2707937 ?auto_2707938 ) ) ( not ( = ?auto_2707937 ?auto_2707939 ) ) ( not ( = ?auto_2707937 ?auto_2707940 ) ) ( not ( = ?auto_2707937 ?auto_2707941 ) ) ( not ( = ?auto_2707937 ?auto_2707942 ) ) ( not ( = ?auto_2707937 ?auto_2707943 ) ) ( not ( = ?auto_2707937 ?auto_2707944 ) ) ( not ( = ?auto_2707937 ?auto_2707945 ) ) ( not ( = ?auto_2707937 ?auto_2707946 ) ) ( not ( = ?auto_2707937 ?auto_2707947 ) ) ( not ( = ?auto_2707938 ?auto_2707939 ) ) ( not ( = ?auto_2707938 ?auto_2707940 ) ) ( not ( = ?auto_2707938 ?auto_2707941 ) ) ( not ( = ?auto_2707938 ?auto_2707942 ) ) ( not ( = ?auto_2707938 ?auto_2707943 ) ) ( not ( = ?auto_2707938 ?auto_2707944 ) ) ( not ( = ?auto_2707938 ?auto_2707945 ) ) ( not ( = ?auto_2707938 ?auto_2707946 ) ) ( not ( = ?auto_2707938 ?auto_2707947 ) ) ( not ( = ?auto_2707939 ?auto_2707940 ) ) ( not ( = ?auto_2707939 ?auto_2707941 ) ) ( not ( = ?auto_2707939 ?auto_2707942 ) ) ( not ( = ?auto_2707939 ?auto_2707943 ) ) ( not ( = ?auto_2707939 ?auto_2707944 ) ) ( not ( = ?auto_2707939 ?auto_2707945 ) ) ( not ( = ?auto_2707939 ?auto_2707946 ) ) ( not ( = ?auto_2707939 ?auto_2707947 ) ) ( not ( = ?auto_2707940 ?auto_2707941 ) ) ( not ( = ?auto_2707940 ?auto_2707942 ) ) ( not ( = ?auto_2707940 ?auto_2707943 ) ) ( not ( = ?auto_2707940 ?auto_2707944 ) ) ( not ( = ?auto_2707940 ?auto_2707945 ) ) ( not ( = ?auto_2707940 ?auto_2707946 ) ) ( not ( = ?auto_2707940 ?auto_2707947 ) ) ( not ( = ?auto_2707941 ?auto_2707942 ) ) ( not ( = ?auto_2707941 ?auto_2707943 ) ) ( not ( = ?auto_2707941 ?auto_2707944 ) ) ( not ( = ?auto_2707941 ?auto_2707945 ) ) ( not ( = ?auto_2707941 ?auto_2707946 ) ) ( not ( = ?auto_2707941 ?auto_2707947 ) ) ( not ( = ?auto_2707942 ?auto_2707943 ) ) ( not ( = ?auto_2707942 ?auto_2707944 ) ) ( not ( = ?auto_2707942 ?auto_2707945 ) ) ( not ( = ?auto_2707942 ?auto_2707946 ) ) ( not ( = ?auto_2707942 ?auto_2707947 ) ) ( not ( = ?auto_2707943 ?auto_2707944 ) ) ( not ( = ?auto_2707943 ?auto_2707945 ) ) ( not ( = ?auto_2707943 ?auto_2707946 ) ) ( not ( = ?auto_2707943 ?auto_2707947 ) ) ( not ( = ?auto_2707944 ?auto_2707945 ) ) ( not ( = ?auto_2707944 ?auto_2707946 ) ) ( not ( = ?auto_2707944 ?auto_2707947 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2707945 ?auto_2707946 ?auto_2707947 )
      ( MAKE-13CRATE-VERIFY ?auto_2707934 ?auto_2707935 ?auto_2707936 ?auto_2707937 ?auto_2707938 ?auto_2707939 ?auto_2707940 ?auto_2707941 ?auto_2707942 ?auto_2707943 ?auto_2707944 ?auto_2707945 ?auto_2707946 ?auto_2707947 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2708116 - SURFACE
      ?auto_2708117 - SURFACE
      ?auto_2708118 - SURFACE
      ?auto_2708119 - SURFACE
      ?auto_2708120 - SURFACE
      ?auto_2708121 - SURFACE
      ?auto_2708122 - SURFACE
      ?auto_2708123 - SURFACE
      ?auto_2708124 - SURFACE
      ?auto_2708125 - SURFACE
      ?auto_2708126 - SURFACE
      ?auto_2708127 - SURFACE
      ?auto_2708128 - SURFACE
      ?auto_2708129 - SURFACE
    )
    :vars
    (
      ?auto_2708131 - HOIST
      ?auto_2708134 - PLACE
      ?auto_2708135 - TRUCK
      ?auto_2708130 - PLACE
      ?auto_2708132 - HOIST
      ?auto_2708133 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2708131 ?auto_2708134 ) ( SURFACE-AT ?auto_2708128 ?auto_2708134 ) ( CLEAR ?auto_2708128 ) ( IS-CRATE ?auto_2708129 ) ( not ( = ?auto_2708128 ?auto_2708129 ) ) ( AVAILABLE ?auto_2708131 ) ( ON ?auto_2708128 ?auto_2708127 ) ( not ( = ?auto_2708127 ?auto_2708128 ) ) ( not ( = ?auto_2708127 ?auto_2708129 ) ) ( TRUCK-AT ?auto_2708135 ?auto_2708130 ) ( not ( = ?auto_2708130 ?auto_2708134 ) ) ( HOIST-AT ?auto_2708132 ?auto_2708130 ) ( not ( = ?auto_2708131 ?auto_2708132 ) ) ( AVAILABLE ?auto_2708132 ) ( SURFACE-AT ?auto_2708129 ?auto_2708130 ) ( ON ?auto_2708129 ?auto_2708133 ) ( CLEAR ?auto_2708129 ) ( not ( = ?auto_2708128 ?auto_2708133 ) ) ( not ( = ?auto_2708129 ?auto_2708133 ) ) ( not ( = ?auto_2708127 ?auto_2708133 ) ) ( ON ?auto_2708117 ?auto_2708116 ) ( ON ?auto_2708118 ?auto_2708117 ) ( ON ?auto_2708119 ?auto_2708118 ) ( ON ?auto_2708120 ?auto_2708119 ) ( ON ?auto_2708121 ?auto_2708120 ) ( ON ?auto_2708122 ?auto_2708121 ) ( ON ?auto_2708123 ?auto_2708122 ) ( ON ?auto_2708124 ?auto_2708123 ) ( ON ?auto_2708125 ?auto_2708124 ) ( ON ?auto_2708126 ?auto_2708125 ) ( ON ?auto_2708127 ?auto_2708126 ) ( not ( = ?auto_2708116 ?auto_2708117 ) ) ( not ( = ?auto_2708116 ?auto_2708118 ) ) ( not ( = ?auto_2708116 ?auto_2708119 ) ) ( not ( = ?auto_2708116 ?auto_2708120 ) ) ( not ( = ?auto_2708116 ?auto_2708121 ) ) ( not ( = ?auto_2708116 ?auto_2708122 ) ) ( not ( = ?auto_2708116 ?auto_2708123 ) ) ( not ( = ?auto_2708116 ?auto_2708124 ) ) ( not ( = ?auto_2708116 ?auto_2708125 ) ) ( not ( = ?auto_2708116 ?auto_2708126 ) ) ( not ( = ?auto_2708116 ?auto_2708127 ) ) ( not ( = ?auto_2708116 ?auto_2708128 ) ) ( not ( = ?auto_2708116 ?auto_2708129 ) ) ( not ( = ?auto_2708116 ?auto_2708133 ) ) ( not ( = ?auto_2708117 ?auto_2708118 ) ) ( not ( = ?auto_2708117 ?auto_2708119 ) ) ( not ( = ?auto_2708117 ?auto_2708120 ) ) ( not ( = ?auto_2708117 ?auto_2708121 ) ) ( not ( = ?auto_2708117 ?auto_2708122 ) ) ( not ( = ?auto_2708117 ?auto_2708123 ) ) ( not ( = ?auto_2708117 ?auto_2708124 ) ) ( not ( = ?auto_2708117 ?auto_2708125 ) ) ( not ( = ?auto_2708117 ?auto_2708126 ) ) ( not ( = ?auto_2708117 ?auto_2708127 ) ) ( not ( = ?auto_2708117 ?auto_2708128 ) ) ( not ( = ?auto_2708117 ?auto_2708129 ) ) ( not ( = ?auto_2708117 ?auto_2708133 ) ) ( not ( = ?auto_2708118 ?auto_2708119 ) ) ( not ( = ?auto_2708118 ?auto_2708120 ) ) ( not ( = ?auto_2708118 ?auto_2708121 ) ) ( not ( = ?auto_2708118 ?auto_2708122 ) ) ( not ( = ?auto_2708118 ?auto_2708123 ) ) ( not ( = ?auto_2708118 ?auto_2708124 ) ) ( not ( = ?auto_2708118 ?auto_2708125 ) ) ( not ( = ?auto_2708118 ?auto_2708126 ) ) ( not ( = ?auto_2708118 ?auto_2708127 ) ) ( not ( = ?auto_2708118 ?auto_2708128 ) ) ( not ( = ?auto_2708118 ?auto_2708129 ) ) ( not ( = ?auto_2708118 ?auto_2708133 ) ) ( not ( = ?auto_2708119 ?auto_2708120 ) ) ( not ( = ?auto_2708119 ?auto_2708121 ) ) ( not ( = ?auto_2708119 ?auto_2708122 ) ) ( not ( = ?auto_2708119 ?auto_2708123 ) ) ( not ( = ?auto_2708119 ?auto_2708124 ) ) ( not ( = ?auto_2708119 ?auto_2708125 ) ) ( not ( = ?auto_2708119 ?auto_2708126 ) ) ( not ( = ?auto_2708119 ?auto_2708127 ) ) ( not ( = ?auto_2708119 ?auto_2708128 ) ) ( not ( = ?auto_2708119 ?auto_2708129 ) ) ( not ( = ?auto_2708119 ?auto_2708133 ) ) ( not ( = ?auto_2708120 ?auto_2708121 ) ) ( not ( = ?auto_2708120 ?auto_2708122 ) ) ( not ( = ?auto_2708120 ?auto_2708123 ) ) ( not ( = ?auto_2708120 ?auto_2708124 ) ) ( not ( = ?auto_2708120 ?auto_2708125 ) ) ( not ( = ?auto_2708120 ?auto_2708126 ) ) ( not ( = ?auto_2708120 ?auto_2708127 ) ) ( not ( = ?auto_2708120 ?auto_2708128 ) ) ( not ( = ?auto_2708120 ?auto_2708129 ) ) ( not ( = ?auto_2708120 ?auto_2708133 ) ) ( not ( = ?auto_2708121 ?auto_2708122 ) ) ( not ( = ?auto_2708121 ?auto_2708123 ) ) ( not ( = ?auto_2708121 ?auto_2708124 ) ) ( not ( = ?auto_2708121 ?auto_2708125 ) ) ( not ( = ?auto_2708121 ?auto_2708126 ) ) ( not ( = ?auto_2708121 ?auto_2708127 ) ) ( not ( = ?auto_2708121 ?auto_2708128 ) ) ( not ( = ?auto_2708121 ?auto_2708129 ) ) ( not ( = ?auto_2708121 ?auto_2708133 ) ) ( not ( = ?auto_2708122 ?auto_2708123 ) ) ( not ( = ?auto_2708122 ?auto_2708124 ) ) ( not ( = ?auto_2708122 ?auto_2708125 ) ) ( not ( = ?auto_2708122 ?auto_2708126 ) ) ( not ( = ?auto_2708122 ?auto_2708127 ) ) ( not ( = ?auto_2708122 ?auto_2708128 ) ) ( not ( = ?auto_2708122 ?auto_2708129 ) ) ( not ( = ?auto_2708122 ?auto_2708133 ) ) ( not ( = ?auto_2708123 ?auto_2708124 ) ) ( not ( = ?auto_2708123 ?auto_2708125 ) ) ( not ( = ?auto_2708123 ?auto_2708126 ) ) ( not ( = ?auto_2708123 ?auto_2708127 ) ) ( not ( = ?auto_2708123 ?auto_2708128 ) ) ( not ( = ?auto_2708123 ?auto_2708129 ) ) ( not ( = ?auto_2708123 ?auto_2708133 ) ) ( not ( = ?auto_2708124 ?auto_2708125 ) ) ( not ( = ?auto_2708124 ?auto_2708126 ) ) ( not ( = ?auto_2708124 ?auto_2708127 ) ) ( not ( = ?auto_2708124 ?auto_2708128 ) ) ( not ( = ?auto_2708124 ?auto_2708129 ) ) ( not ( = ?auto_2708124 ?auto_2708133 ) ) ( not ( = ?auto_2708125 ?auto_2708126 ) ) ( not ( = ?auto_2708125 ?auto_2708127 ) ) ( not ( = ?auto_2708125 ?auto_2708128 ) ) ( not ( = ?auto_2708125 ?auto_2708129 ) ) ( not ( = ?auto_2708125 ?auto_2708133 ) ) ( not ( = ?auto_2708126 ?auto_2708127 ) ) ( not ( = ?auto_2708126 ?auto_2708128 ) ) ( not ( = ?auto_2708126 ?auto_2708129 ) ) ( not ( = ?auto_2708126 ?auto_2708133 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2708127 ?auto_2708128 ?auto_2708129 )
      ( MAKE-13CRATE-VERIFY ?auto_2708116 ?auto_2708117 ?auto_2708118 ?auto_2708119 ?auto_2708120 ?auto_2708121 ?auto_2708122 ?auto_2708123 ?auto_2708124 ?auto_2708125 ?auto_2708126 ?auto_2708127 ?auto_2708128 ?auto_2708129 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2708299 - SURFACE
      ?auto_2708300 - SURFACE
      ?auto_2708301 - SURFACE
      ?auto_2708302 - SURFACE
      ?auto_2708303 - SURFACE
      ?auto_2708304 - SURFACE
      ?auto_2708305 - SURFACE
      ?auto_2708306 - SURFACE
      ?auto_2708307 - SURFACE
      ?auto_2708308 - SURFACE
      ?auto_2708309 - SURFACE
      ?auto_2708310 - SURFACE
      ?auto_2708311 - SURFACE
      ?auto_2708312 - SURFACE
    )
    :vars
    (
      ?auto_2708315 - HOIST
      ?auto_2708317 - PLACE
      ?auto_2708318 - PLACE
      ?auto_2708316 - HOIST
      ?auto_2708313 - SURFACE
      ?auto_2708314 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2708315 ?auto_2708317 ) ( SURFACE-AT ?auto_2708311 ?auto_2708317 ) ( CLEAR ?auto_2708311 ) ( IS-CRATE ?auto_2708312 ) ( not ( = ?auto_2708311 ?auto_2708312 ) ) ( AVAILABLE ?auto_2708315 ) ( ON ?auto_2708311 ?auto_2708310 ) ( not ( = ?auto_2708310 ?auto_2708311 ) ) ( not ( = ?auto_2708310 ?auto_2708312 ) ) ( not ( = ?auto_2708318 ?auto_2708317 ) ) ( HOIST-AT ?auto_2708316 ?auto_2708318 ) ( not ( = ?auto_2708315 ?auto_2708316 ) ) ( AVAILABLE ?auto_2708316 ) ( SURFACE-AT ?auto_2708312 ?auto_2708318 ) ( ON ?auto_2708312 ?auto_2708313 ) ( CLEAR ?auto_2708312 ) ( not ( = ?auto_2708311 ?auto_2708313 ) ) ( not ( = ?auto_2708312 ?auto_2708313 ) ) ( not ( = ?auto_2708310 ?auto_2708313 ) ) ( TRUCK-AT ?auto_2708314 ?auto_2708317 ) ( ON ?auto_2708300 ?auto_2708299 ) ( ON ?auto_2708301 ?auto_2708300 ) ( ON ?auto_2708302 ?auto_2708301 ) ( ON ?auto_2708303 ?auto_2708302 ) ( ON ?auto_2708304 ?auto_2708303 ) ( ON ?auto_2708305 ?auto_2708304 ) ( ON ?auto_2708306 ?auto_2708305 ) ( ON ?auto_2708307 ?auto_2708306 ) ( ON ?auto_2708308 ?auto_2708307 ) ( ON ?auto_2708309 ?auto_2708308 ) ( ON ?auto_2708310 ?auto_2708309 ) ( not ( = ?auto_2708299 ?auto_2708300 ) ) ( not ( = ?auto_2708299 ?auto_2708301 ) ) ( not ( = ?auto_2708299 ?auto_2708302 ) ) ( not ( = ?auto_2708299 ?auto_2708303 ) ) ( not ( = ?auto_2708299 ?auto_2708304 ) ) ( not ( = ?auto_2708299 ?auto_2708305 ) ) ( not ( = ?auto_2708299 ?auto_2708306 ) ) ( not ( = ?auto_2708299 ?auto_2708307 ) ) ( not ( = ?auto_2708299 ?auto_2708308 ) ) ( not ( = ?auto_2708299 ?auto_2708309 ) ) ( not ( = ?auto_2708299 ?auto_2708310 ) ) ( not ( = ?auto_2708299 ?auto_2708311 ) ) ( not ( = ?auto_2708299 ?auto_2708312 ) ) ( not ( = ?auto_2708299 ?auto_2708313 ) ) ( not ( = ?auto_2708300 ?auto_2708301 ) ) ( not ( = ?auto_2708300 ?auto_2708302 ) ) ( not ( = ?auto_2708300 ?auto_2708303 ) ) ( not ( = ?auto_2708300 ?auto_2708304 ) ) ( not ( = ?auto_2708300 ?auto_2708305 ) ) ( not ( = ?auto_2708300 ?auto_2708306 ) ) ( not ( = ?auto_2708300 ?auto_2708307 ) ) ( not ( = ?auto_2708300 ?auto_2708308 ) ) ( not ( = ?auto_2708300 ?auto_2708309 ) ) ( not ( = ?auto_2708300 ?auto_2708310 ) ) ( not ( = ?auto_2708300 ?auto_2708311 ) ) ( not ( = ?auto_2708300 ?auto_2708312 ) ) ( not ( = ?auto_2708300 ?auto_2708313 ) ) ( not ( = ?auto_2708301 ?auto_2708302 ) ) ( not ( = ?auto_2708301 ?auto_2708303 ) ) ( not ( = ?auto_2708301 ?auto_2708304 ) ) ( not ( = ?auto_2708301 ?auto_2708305 ) ) ( not ( = ?auto_2708301 ?auto_2708306 ) ) ( not ( = ?auto_2708301 ?auto_2708307 ) ) ( not ( = ?auto_2708301 ?auto_2708308 ) ) ( not ( = ?auto_2708301 ?auto_2708309 ) ) ( not ( = ?auto_2708301 ?auto_2708310 ) ) ( not ( = ?auto_2708301 ?auto_2708311 ) ) ( not ( = ?auto_2708301 ?auto_2708312 ) ) ( not ( = ?auto_2708301 ?auto_2708313 ) ) ( not ( = ?auto_2708302 ?auto_2708303 ) ) ( not ( = ?auto_2708302 ?auto_2708304 ) ) ( not ( = ?auto_2708302 ?auto_2708305 ) ) ( not ( = ?auto_2708302 ?auto_2708306 ) ) ( not ( = ?auto_2708302 ?auto_2708307 ) ) ( not ( = ?auto_2708302 ?auto_2708308 ) ) ( not ( = ?auto_2708302 ?auto_2708309 ) ) ( not ( = ?auto_2708302 ?auto_2708310 ) ) ( not ( = ?auto_2708302 ?auto_2708311 ) ) ( not ( = ?auto_2708302 ?auto_2708312 ) ) ( not ( = ?auto_2708302 ?auto_2708313 ) ) ( not ( = ?auto_2708303 ?auto_2708304 ) ) ( not ( = ?auto_2708303 ?auto_2708305 ) ) ( not ( = ?auto_2708303 ?auto_2708306 ) ) ( not ( = ?auto_2708303 ?auto_2708307 ) ) ( not ( = ?auto_2708303 ?auto_2708308 ) ) ( not ( = ?auto_2708303 ?auto_2708309 ) ) ( not ( = ?auto_2708303 ?auto_2708310 ) ) ( not ( = ?auto_2708303 ?auto_2708311 ) ) ( not ( = ?auto_2708303 ?auto_2708312 ) ) ( not ( = ?auto_2708303 ?auto_2708313 ) ) ( not ( = ?auto_2708304 ?auto_2708305 ) ) ( not ( = ?auto_2708304 ?auto_2708306 ) ) ( not ( = ?auto_2708304 ?auto_2708307 ) ) ( not ( = ?auto_2708304 ?auto_2708308 ) ) ( not ( = ?auto_2708304 ?auto_2708309 ) ) ( not ( = ?auto_2708304 ?auto_2708310 ) ) ( not ( = ?auto_2708304 ?auto_2708311 ) ) ( not ( = ?auto_2708304 ?auto_2708312 ) ) ( not ( = ?auto_2708304 ?auto_2708313 ) ) ( not ( = ?auto_2708305 ?auto_2708306 ) ) ( not ( = ?auto_2708305 ?auto_2708307 ) ) ( not ( = ?auto_2708305 ?auto_2708308 ) ) ( not ( = ?auto_2708305 ?auto_2708309 ) ) ( not ( = ?auto_2708305 ?auto_2708310 ) ) ( not ( = ?auto_2708305 ?auto_2708311 ) ) ( not ( = ?auto_2708305 ?auto_2708312 ) ) ( not ( = ?auto_2708305 ?auto_2708313 ) ) ( not ( = ?auto_2708306 ?auto_2708307 ) ) ( not ( = ?auto_2708306 ?auto_2708308 ) ) ( not ( = ?auto_2708306 ?auto_2708309 ) ) ( not ( = ?auto_2708306 ?auto_2708310 ) ) ( not ( = ?auto_2708306 ?auto_2708311 ) ) ( not ( = ?auto_2708306 ?auto_2708312 ) ) ( not ( = ?auto_2708306 ?auto_2708313 ) ) ( not ( = ?auto_2708307 ?auto_2708308 ) ) ( not ( = ?auto_2708307 ?auto_2708309 ) ) ( not ( = ?auto_2708307 ?auto_2708310 ) ) ( not ( = ?auto_2708307 ?auto_2708311 ) ) ( not ( = ?auto_2708307 ?auto_2708312 ) ) ( not ( = ?auto_2708307 ?auto_2708313 ) ) ( not ( = ?auto_2708308 ?auto_2708309 ) ) ( not ( = ?auto_2708308 ?auto_2708310 ) ) ( not ( = ?auto_2708308 ?auto_2708311 ) ) ( not ( = ?auto_2708308 ?auto_2708312 ) ) ( not ( = ?auto_2708308 ?auto_2708313 ) ) ( not ( = ?auto_2708309 ?auto_2708310 ) ) ( not ( = ?auto_2708309 ?auto_2708311 ) ) ( not ( = ?auto_2708309 ?auto_2708312 ) ) ( not ( = ?auto_2708309 ?auto_2708313 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2708310 ?auto_2708311 ?auto_2708312 )
      ( MAKE-13CRATE-VERIFY ?auto_2708299 ?auto_2708300 ?auto_2708301 ?auto_2708302 ?auto_2708303 ?auto_2708304 ?auto_2708305 ?auto_2708306 ?auto_2708307 ?auto_2708308 ?auto_2708309 ?auto_2708310 ?auto_2708311 ?auto_2708312 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2708482 - SURFACE
      ?auto_2708483 - SURFACE
      ?auto_2708484 - SURFACE
      ?auto_2708485 - SURFACE
      ?auto_2708486 - SURFACE
      ?auto_2708487 - SURFACE
      ?auto_2708488 - SURFACE
      ?auto_2708489 - SURFACE
      ?auto_2708490 - SURFACE
      ?auto_2708491 - SURFACE
      ?auto_2708492 - SURFACE
      ?auto_2708493 - SURFACE
      ?auto_2708494 - SURFACE
      ?auto_2708495 - SURFACE
    )
    :vars
    (
      ?auto_2708497 - HOIST
      ?auto_2708496 - PLACE
      ?auto_2708500 - PLACE
      ?auto_2708501 - HOIST
      ?auto_2708498 - SURFACE
      ?auto_2708499 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2708497 ?auto_2708496 ) ( IS-CRATE ?auto_2708495 ) ( not ( = ?auto_2708494 ?auto_2708495 ) ) ( not ( = ?auto_2708493 ?auto_2708494 ) ) ( not ( = ?auto_2708493 ?auto_2708495 ) ) ( not ( = ?auto_2708500 ?auto_2708496 ) ) ( HOIST-AT ?auto_2708501 ?auto_2708500 ) ( not ( = ?auto_2708497 ?auto_2708501 ) ) ( AVAILABLE ?auto_2708501 ) ( SURFACE-AT ?auto_2708495 ?auto_2708500 ) ( ON ?auto_2708495 ?auto_2708498 ) ( CLEAR ?auto_2708495 ) ( not ( = ?auto_2708494 ?auto_2708498 ) ) ( not ( = ?auto_2708495 ?auto_2708498 ) ) ( not ( = ?auto_2708493 ?auto_2708498 ) ) ( TRUCK-AT ?auto_2708499 ?auto_2708496 ) ( SURFACE-AT ?auto_2708493 ?auto_2708496 ) ( CLEAR ?auto_2708493 ) ( LIFTING ?auto_2708497 ?auto_2708494 ) ( IS-CRATE ?auto_2708494 ) ( ON ?auto_2708483 ?auto_2708482 ) ( ON ?auto_2708484 ?auto_2708483 ) ( ON ?auto_2708485 ?auto_2708484 ) ( ON ?auto_2708486 ?auto_2708485 ) ( ON ?auto_2708487 ?auto_2708486 ) ( ON ?auto_2708488 ?auto_2708487 ) ( ON ?auto_2708489 ?auto_2708488 ) ( ON ?auto_2708490 ?auto_2708489 ) ( ON ?auto_2708491 ?auto_2708490 ) ( ON ?auto_2708492 ?auto_2708491 ) ( ON ?auto_2708493 ?auto_2708492 ) ( not ( = ?auto_2708482 ?auto_2708483 ) ) ( not ( = ?auto_2708482 ?auto_2708484 ) ) ( not ( = ?auto_2708482 ?auto_2708485 ) ) ( not ( = ?auto_2708482 ?auto_2708486 ) ) ( not ( = ?auto_2708482 ?auto_2708487 ) ) ( not ( = ?auto_2708482 ?auto_2708488 ) ) ( not ( = ?auto_2708482 ?auto_2708489 ) ) ( not ( = ?auto_2708482 ?auto_2708490 ) ) ( not ( = ?auto_2708482 ?auto_2708491 ) ) ( not ( = ?auto_2708482 ?auto_2708492 ) ) ( not ( = ?auto_2708482 ?auto_2708493 ) ) ( not ( = ?auto_2708482 ?auto_2708494 ) ) ( not ( = ?auto_2708482 ?auto_2708495 ) ) ( not ( = ?auto_2708482 ?auto_2708498 ) ) ( not ( = ?auto_2708483 ?auto_2708484 ) ) ( not ( = ?auto_2708483 ?auto_2708485 ) ) ( not ( = ?auto_2708483 ?auto_2708486 ) ) ( not ( = ?auto_2708483 ?auto_2708487 ) ) ( not ( = ?auto_2708483 ?auto_2708488 ) ) ( not ( = ?auto_2708483 ?auto_2708489 ) ) ( not ( = ?auto_2708483 ?auto_2708490 ) ) ( not ( = ?auto_2708483 ?auto_2708491 ) ) ( not ( = ?auto_2708483 ?auto_2708492 ) ) ( not ( = ?auto_2708483 ?auto_2708493 ) ) ( not ( = ?auto_2708483 ?auto_2708494 ) ) ( not ( = ?auto_2708483 ?auto_2708495 ) ) ( not ( = ?auto_2708483 ?auto_2708498 ) ) ( not ( = ?auto_2708484 ?auto_2708485 ) ) ( not ( = ?auto_2708484 ?auto_2708486 ) ) ( not ( = ?auto_2708484 ?auto_2708487 ) ) ( not ( = ?auto_2708484 ?auto_2708488 ) ) ( not ( = ?auto_2708484 ?auto_2708489 ) ) ( not ( = ?auto_2708484 ?auto_2708490 ) ) ( not ( = ?auto_2708484 ?auto_2708491 ) ) ( not ( = ?auto_2708484 ?auto_2708492 ) ) ( not ( = ?auto_2708484 ?auto_2708493 ) ) ( not ( = ?auto_2708484 ?auto_2708494 ) ) ( not ( = ?auto_2708484 ?auto_2708495 ) ) ( not ( = ?auto_2708484 ?auto_2708498 ) ) ( not ( = ?auto_2708485 ?auto_2708486 ) ) ( not ( = ?auto_2708485 ?auto_2708487 ) ) ( not ( = ?auto_2708485 ?auto_2708488 ) ) ( not ( = ?auto_2708485 ?auto_2708489 ) ) ( not ( = ?auto_2708485 ?auto_2708490 ) ) ( not ( = ?auto_2708485 ?auto_2708491 ) ) ( not ( = ?auto_2708485 ?auto_2708492 ) ) ( not ( = ?auto_2708485 ?auto_2708493 ) ) ( not ( = ?auto_2708485 ?auto_2708494 ) ) ( not ( = ?auto_2708485 ?auto_2708495 ) ) ( not ( = ?auto_2708485 ?auto_2708498 ) ) ( not ( = ?auto_2708486 ?auto_2708487 ) ) ( not ( = ?auto_2708486 ?auto_2708488 ) ) ( not ( = ?auto_2708486 ?auto_2708489 ) ) ( not ( = ?auto_2708486 ?auto_2708490 ) ) ( not ( = ?auto_2708486 ?auto_2708491 ) ) ( not ( = ?auto_2708486 ?auto_2708492 ) ) ( not ( = ?auto_2708486 ?auto_2708493 ) ) ( not ( = ?auto_2708486 ?auto_2708494 ) ) ( not ( = ?auto_2708486 ?auto_2708495 ) ) ( not ( = ?auto_2708486 ?auto_2708498 ) ) ( not ( = ?auto_2708487 ?auto_2708488 ) ) ( not ( = ?auto_2708487 ?auto_2708489 ) ) ( not ( = ?auto_2708487 ?auto_2708490 ) ) ( not ( = ?auto_2708487 ?auto_2708491 ) ) ( not ( = ?auto_2708487 ?auto_2708492 ) ) ( not ( = ?auto_2708487 ?auto_2708493 ) ) ( not ( = ?auto_2708487 ?auto_2708494 ) ) ( not ( = ?auto_2708487 ?auto_2708495 ) ) ( not ( = ?auto_2708487 ?auto_2708498 ) ) ( not ( = ?auto_2708488 ?auto_2708489 ) ) ( not ( = ?auto_2708488 ?auto_2708490 ) ) ( not ( = ?auto_2708488 ?auto_2708491 ) ) ( not ( = ?auto_2708488 ?auto_2708492 ) ) ( not ( = ?auto_2708488 ?auto_2708493 ) ) ( not ( = ?auto_2708488 ?auto_2708494 ) ) ( not ( = ?auto_2708488 ?auto_2708495 ) ) ( not ( = ?auto_2708488 ?auto_2708498 ) ) ( not ( = ?auto_2708489 ?auto_2708490 ) ) ( not ( = ?auto_2708489 ?auto_2708491 ) ) ( not ( = ?auto_2708489 ?auto_2708492 ) ) ( not ( = ?auto_2708489 ?auto_2708493 ) ) ( not ( = ?auto_2708489 ?auto_2708494 ) ) ( not ( = ?auto_2708489 ?auto_2708495 ) ) ( not ( = ?auto_2708489 ?auto_2708498 ) ) ( not ( = ?auto_2708490 ?auto_2708491 ) ) ( not ( = ?auto_2708490 ?auto_2708492 ) ) ( not ( = ?auto_2708490 ?auto_2708493 ) ) ( not ( = ?auto_2708490 ?auto_2708494 ) ) ( not ( = ?auto_2708490 ?auto_2708495 ) ) ( not ( = ?auto_2708490 ?auto_2708498 ) ) ( not ( = ?auto_2708491 ?auto_2708492 ) ) ( not ( = ?auto_2708491 ?auto_2708493 ) ) ( not ( = ?auto_2708491 ?auto_2708494 ) ) ( not ( = ?auto_2708491 ?auto_2708495 ) ) ( not ( = ?auto_2708491 ?auto_2708498 ) ) ( not ( = ?auto_2708492 ?auto_2708493 ) ) ( not ( = ?auto_2708492 ?auto_2708494 ) ) ( not ( = ?auto_2708492 ?auto_2708495 ) ) ( not ( = ?auto_2708492 ?auto_2708498 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2708493 ?auto_2708494 ?auto_2708495 )
      ( MAKE-13CRATE-VERIFY ?auto_2708482 ?auto_2708483 ?auto_2708484 ?auto_2708485 ?auto_2708486 ?auto_2708487 ?auto_2708488 ?auto_2708489 ?auto_2708490 ?auto_2708491 ?auto_2708492 ?auto_2708493 ?auto_2708494 ?auto_2708495 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2708665 - SURFACE
      ?auto_2708666 - SURFACE
      ?auto_2708667 - SURFACE
      ?auto_2708668 - SURFACE
      ?auto_2708669 - SURFACE
      ?auto_2708670 - SURFACE
      ?auto_2708671 - SURFACE
      ?auto_2708672 - SURFACE
      ?auto_2708673 - SURFACE
      ?auto_2708674 - SURFACE
      ?auto_2708675 - SURFACE
      ?auto_2708676 - SURFACE
      ?auto_2708677 - SURFACE
      ?auto_2708678 - SURFACE
    )
    :vars
    (
      ?auto_2708679 - HOIST
      ?auto_2708682 - PLACE
      ?auto_2708683 - PLACE
      ?auto_2708684 - HOIST
      ?auto_2708680 - SURFACE
      ?auto_2708681 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2708679 ?auto_2708682 ) ( IS-CRATE ?auto_2708678 ) ( not ( = ?auto_2708677 ?auto_2708678 ) ) ( not ( = ?auto_2708676 ?auto_2708677 ) ) ( not ( = ?auto_2708676 ?auto_2708678 ) ) ( not ( = ?auto_2708683 ?auto_2708682 ) ) ( HOIST-AT ?auto_2708684 ?auto_2708683 ) ( not ( = ?auto_2708679 ?auto_2708684 ) ) ( AVAILABLE ?auto_2708684 ) ( SURFACE-AT ?auto_2708678 ?auto_2708683 ) ( ON ?auto_2708678 ?auto_2708680 ) ( CLEAR ?auto_2708678 ) ( not ( = ?auto_2708677 ?auto_2708680 ) ) ( not ( = ?auto_2708678 ?auto_2708680 ) ) ( not ( = ?auto_2708676 ?auto_2708680 ) ) ( TRUCK-AT ?auto_2708681 ?auto_2708682 ) ( SURFACE-AT ?auto_2708676 ?auto_2708682 ) ( CLEAR ?auto_2708676 ) ( IS-CRATE ?auto_2708677 ) ( AVAILABLE ?auto_2708679 ) ( IN ?auto_2708677 ?auto_2708681 ) ( ON ?auto_2708666 ?auto_2708665 ) ( ON ?auto_2708667 ?auto_2708666 ) ( ON ?auto_2708668 ?auto_2708667 ) ( ON ?auto_2708669 ?auto_2708668 ) ( ON ?auto_2708670 ?auto_2708669 ) ( ON ?auto_2708671 ?auto_2708670 ) ( ON ?auto_2708672 ?auto_2708671 ) ( ON ?auto_2708673 ?auto_2708672 ) ( ON ?auto_2708674 ?auto_2708673 ) ( ON ?auto_2708675 ?auto_2708674 ) ( ON ?auto_2708676 ?auto_2708675 ) ( not ( = ?auto_2708665 ?auto_2708666 ) ) ( not ( = ?auto_2708665 ?auto_2708667 ) ) ( not ( = ?auto_2708665 ?auto_2708668 ) ) ( not ( = ?auto_2708665 ?auto_2708669 ) ) ( not ( = ?auto_2708665 ?auto_2708670 ) ) ( not ( = ?auto_2708665 ?auto_2708671 ) ) ( not ( = ?auto_2708665 ?auto_2708672 ) ) ( not ( = ?auto_2708665 ?auto_2708673 ) ) ( not ( = ?auto_2708665 ?auto_2708674 ) ) ( not ( = ?auto_2708665 ?auto_2708675 ) ) ( not ( = ?auto_2708665 ?auto_2708676 ) ) ( not ( = ?auto_2708665 ?auto_2708677 ) ) ( not ( = ?auto_2708665 ?auto_2708678 ) ) ( not ( = ?auto_2708665 ?auto_2708680 ) ) ( not ( = ?auto_2708666 ?auto_2708667 ) ) ( not ( = ?auto_2708666 ?auto_2708668 ) ) ( not ( = ?auto_2708666 ?auto_2708669 ) ) ( not ( = ?auto_2708666 ?auto_2708670 ) ) ( not ( = ?auto_2708666 ?auto_2708671 ) ) ( not ( = ?auto_2708666 ?auto_2708672 ) ) ( not ( = ?auto_2708666 ?auto_2708673 ) ) ( not ( = ?auto_2708666 ?auto_2708674 ) ) ( not ( = ?auto_2708666 ?auto_2708675 ) ) ( not ( = ?auto_2708666 ?auto_2708676 ) ) ( not ( = ?auto_2708666 ?auto_2708677 ) ) ( not ( = ?auto_2708666 ?auto_2708678 ) ) ( not ( = ?auto_2708666 ?auto_2708680 ) ) ( not ( = ?auto_2708667 ?auto_2708668 ) ) ( not ( = ?auto_2708667 ?auto_2708669 ) ) ( not ( = ?auto_2708667 ?auto_2708670 ) ) ( not ( = ?auto_2708667 ?auto_2708671 ) ) ( not ( = ?auto_2708667 ?auto_2708672 ) ) ( not ( = ?auto_2708667 ?auto_2708673 ) ) ( not ( = ?auto_2708667 ?auto_2708674 ) ) ( not ( = ?auto_2708667 ?auto_2708675 ) ) ( not ( = ?auto_2708667 ?auto_2708676 ) ) ( not ( = ?auto_2708667 ?auto_2708677 ) ) ( not ( = ?auto_2708667 ?auto_2708678 ) ) ( not ( = ?auto_2708667 ?auto_2708680 ) ) ( not ( = ?auto_2708668 ?auto_2708669 ) ) ( not ( = ?auto_2708668 ?auto_2708670 ) ) ( not ( = ?auto_2708668 ?auto_2708671 ) ) ( not ( = ?auto_2708668 ?auto_2708672 ) ) ( not ( = ?auto_2708668 ?auto_2708673 ) ) ( not ( = ?auto_2708668 ?auto_2708674 ) ) ( not ( = ?auto_2708668 ?auto_2708675 ) ) ( not ( = ?auto_2708668 ?auto_2708676 ) ) ( not ( = ?auto_2708668 ?auto_2708677 ) ) ( not ( = ?auto_2708668 ?auto_2708678 ) ) ( not ( = ?auto_2708668 ?auto_2708680 ) ) ( not ( = ?auto_2708669 ?auto_2708670 ) ) ( not ( = ?auto_2708669 ?auto_2708671 ) ) ( not ( = ?auto_2708669 ?auto_2708672 ) ) ( not ( = ?auto_2708669 ?auto_2708673 ) ) ( not ( = ?auto_2708669 ?auto_2708674 ) ) ( not ( = ?auto_2708669 ?auto_2708675 ) ) ( not ( = ?auto_2708669 ?auto_2708676 ) ) ( not ( = ?auto_2708669 ?auto_2708677 ) ) ( not ( = ?auto_2708669 ?auto_2708678 ) ) ( not ( = ?auto_2708669 ?auto_2708680 ) ) ( not ( = ?auto_2708670 ?auto_2708671 ) ) ( not ( = ?auto_2708670 ?auto_2708672 ) ) ( not ( = ?auto_2708670 ?auto_2708673 ) ) ( not ( = ?auto_2708670 ?auto_2708674 ) ) ( not ( = ?auto_2708670 ?auto_2708675 ) ) ( not ( = ?auto_2708670 ?auto_2708676 ) ) ( not ( = ?auto_2708670 ?auto_2708677 ) ) ( not ( = ?auto_2708670 ?auto_2708678 ) ) ( not ( = ?auto_2708670 ?auto_2708680 ) ) ( not ( = ?auto_2708671 ?auto_2708672 ) ) ( not ( = ?auto_2708671 ?auto_2708673 ) ) ( not ( = ?auto_2708671 ?auto_2708674 ) ) ( not ( = ?auto_2708671 ?auto_2708675 ) ) ( not ( = ?auto_2708671 ?auto_2708676 ) ) ( not ( = ?auto_2708671 ?auto_2708677 ) ) ( not ( = ?auto_2708671 ?auto_2708678 ) ) ( not ( = ?auto_2708671 ?auto_2708680 ) ) ( not ( = ?auto_2708672 ?auto_2708673 ) ) ( not ( = ?auto_2708672 ?auto_2708674 ) ) ( not ( = ?auto_2708672 ?auto_2708675 ) ) ( not ( = ?auto_2708672 ?auto_2708676 ) ) ( not ( = ?auto_2708672 ?auto_2708677 ) ) ( not ( = ?auto_2708672 ?auto_2708678 ) ) ( not ( = ?auto_2708672 ?auto_2708680 ) ) ( not ( = ?auto_2708673 ?auto_2708674 ) ) ( not ( = ?auto_2708673 ?auto_2708675 ) ) ( not ( = ?auto_2708673 ?auto_2708676 ) ) ( not ( = ?auto_2708673 ?auto_2708677 ) ) ( not ( = ?auto_2708673 ?auto_2708678 ) ) ( not ( = ?auto_2708673 ?auto_2708680 ) ) ( not ( = ?auto_2708674 ?auto_2708675 ) ) ( not ( = ?auto_2708674 ?auto_2708676 ) ) ( not ( = ?auto_2708674 ?auto_2708677 ) ) ( not ( = ?auto_2708674 ?auto_2708678 ) ) ( not ( = ?auto_2708674 ?auto_2708680 ) ) ( not ( = ?auto_2708675 ?auto_2708676 ) ) ( not ( = ?auto_2708675 ?auto_2708677 ) ) ( not ( = ?auto_2708675 ?auto_2708678 ) ) ( not ( = ?auto_2708675 ?auto_2708680 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2708676 ?auto_2708677 ?auto_2708678 )
      ( MAKE-13CRATE-VERIFY ?auto_2708665 ?auto_2708666 ?auto_2708667 ?auto_2708668 ?auto_2708669 ?auto_2708670 ?auto_2708671 ?auto_2708672 ?auto_2708673 ?auto_2708674 ?auto_2708675 ?auto_2708676 ?auto_2708677 ?auto_2708678 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2708736 - SURFACE
      ?auto_2708737 - SURFACE
      ?auto_2708738 - SURFACE
      ?auto_2708739 - SURFACE
      ?auto_2708740 - SURFACE
      ?auto_2708741 - SURFACE
      ?auto_2708742 - SURFACE
    )
    :vars
    (
      ?auto_2708746 - HOIST
      ?auto_2708747 - PLACE
      ?auto_2708748 - PLACE
      ?auto_2708743 - HOIST
      ?auto_2708744 - SURFACE
      ?auto_2708745 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2708746 ?auto_2708747 ) ( IS-CRATE ?auto_2708742 ) ( not ( = ?auto_2708741 ?auto_2708742 ) ) ( not ( = ?auto_2708740 ?auto_2708741 ) ) ( not ( = ?auto_2708740 ?auto_2708742 ) ) ( not ( = ?auto_2708748 ?auto_2708747 ) ) ( HOIST-AT ?auto_2708743 ?auto_2708748 ) ( not ( = ?auto_2708746 ?auto_2708743 ) ) ( AVAILABLE ?auto_2708743 ) ( SURFACE-AT ?auto_2708742 ?auto_2708748 ) ( ON ?auto_2708742 ?auto_2708744 ) ( CLEAR ?auto_2708742 ) ( not ( = ?auto_2708741 ?auto_2708744 ) ) ( not ( = ?auto_2708742 ?auto_2708744 ) ) ( not ( = ?auto_2708740 ?auto_2708744 ) ) ( SURFACE-AT ?auto_2708740 ?auto_2708747 ) ( CLEAR ?auto_2708740 ) ( IS-CRATE ?auto_2708741 ) ( AVAILABLE ?auto_2708746 ) ( IN ?auto_2708741 ?auto_2708745 ) ( TRUCK-AT ?auto_2708745 ?auto_2708748 ) ( ON ?auto_2708737 ?auto_2708736 ) ( ON ?auto_2708738 ?auto_2708737 ) ( ON ?auto_2708739 ?auto_2708738 ) ( ON ?auto_2708740 ?auto_2708739 ) ( not ( = ?auto_2708736 ?auto_2708737 ) ) ( not ( = ?auto_2708736 ?auto_2708738 ) ) ( not ( = ?auto_2708736 ?auto_2708739 ) ) ( not ( = ?auto_2708736 ?auto_2708740 ) ) ( not ( = ?auto_2708736 ?auto_2708741 ) ) ( not ( = ?auto_2708736 ?auto_2708742 ) ) ( not ( = ?auto_2708736 ?auto_2708744 ) ) ( not ( = ?auto_2708737 ?auto_2708738 ) ) ( not ( = ?auto_2708737 ?auto_2708739 ) ) ( not ( = ?auto_2708737 ?auto_2708740 ) ) ( not ( = ?auto_2708737 ?auto_2708741 ) ) ( not ( = ?auto_2708737 ?auto_2708742 ) ) ( not ( = ?auto_2708737 ?auto_2708744 ) ) ( not ( = ?auto_2708738 ?auto_2708739 ) ) ( not ( = ?auto_2708738 ?auto_2708740 ) ) ( not ( = ?auto_2708738 ?auto_2708741 ) ) ( not ( = ?auto_2708738 ?auto_2708742 ) ) ( not ( = ?auto_2708738 ?auto_2708744 ) ) ( not ( = ?auto_2708739 ?auto_2708740 ) ) ( not ( = ?auto_2708739 ?auto_2708741 ) ) ( not ( = ?auto_2708739 ?auto_2708742 ) ) ( not ( = ?auto_2708739 ?auto_2708744 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2708740 ?auto_2708741 ?auto_2708742 )
      ( MAKE-6CRATE-VERIFY ?auto_2708736 ?auto_2708737 ?auto_2708738 ?auto_2708739 ?auto_2708740 ?auto_2708741 ?auto_2708742 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2708749 - SURFACE
      ?auto_2708750 - SURFACE
      ?auto_2708751 - SURFACE
      ?auto_2708752 - SURFACE
      ?auto_2708753 - SURFACE
      ?auto_2708754 - SURFACE
      ?auto_2708755 - SURFACE
      ?auto_2708756 - SURFACE
    )
    :vars
    (
      ?auto_2708760 - HOIST
      ?auto_2708761 - PLACE
      ?auto_2708762 - PLACE
      ?auto_2708757 - HOIST
      ?auto_2708758 - SURFACE
      ?auto_2708759 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2708760 ?auto_2708761 ) ( IS-CRATE ?auto_2708756 ) ( not ( = ?auto_2708755 ?auto_2708756 ) ) ( not ( = ?auto_2708754 ?auto_2708755 ) ) ( not ( = ?auto_2708754 ?auto_2708756 ) ) ( not ( = ?auto_2708762 ?auto_2708761 ) ) ( HOIST-AT ?auto_2708757 ?auto_2708762 ) ( not ( = ?auto_2708760 ?auto_2708757 ) ) ( AVAILABLE ?auto_2708757 ) ( SURFACE-AT ?auto_2708756 ?auto_2708762 ) ( ON ?auto_2708756 ?auto_2708758 ) ( CLEAR ?auto_2708756 ) ( not ( = ?auto_2708755 ?auto_2708758 ) ) ( not ( = ?auto_2708756 ?auto_2708758 ) ) ( not ( = ?auto_2708754 ?auto_2708758 ) ) ( SURFACE-AT ?auto_2708754 ?auto_2708761 ) ( CLEAR ?auto_2708754 ) ( IS-CRATE ?auto_2708755 ) ( AVAILABLE ?auto_2708760 ) ( IN ?auto_2708755 ?auto_2708759 ) ( TRUCK-AT ?auto_2708759 ?auto_2708762 ) ( ON ?auto_2708750 ?auto_2708749 ) ( ON ?auto_2708751 ?auto_2708750 ) ( ON ?auto_2708752 ?auto_2708751 ) ( ON ?auto_2708753 ?auto_2708752 ) ( ON ?auto_2708754 ?auto_2708753 ) ( not ( = ?auto_2708749 ?auto_2708750 ) ) ( not ( = ?auto_2708749 ?auto_2708751 ) ) ( not ( = ?auto_2708749 ?auto_2708752 ) ) ( not ( = ?auto_2708749 ?auto_2708753 ) ) ( not ( = ?auto_2708749 ?auto_2708754 ) ) ( not ( = ?auto_2708749 ?auto_2708755 ) ) ( not ( = ?auto_2708749 ?auto_2708756 ) ) ( not ( = ?auto_2708749 ?auto_2708758 ) ) ( not ( = ?auto_2708750 ?auto_2708751 ) ) ( not ( = ?auto_2708750 ?auto_2708752 ) ) ( not ( = ?auto_2708750 ?auto_2708753 ) ) ( not ( = ?auto_2708750 ?auto_2708754 ) ) ( not ( = ?auto_2708750 ?auto_2708755 ) ) ( not ( = ?auto_2708750 ?auto_2708756 ) ) ( not ( = ?auto_2708750 ?auto_2708758 ) ) ( not ( = ?auto_2708751 ?auto_2708752 ) ) ( not ( = ?auto_2708751 ?auto_2708753 ) ) ( not ( = ?auto_2708751 ?auto_2708754 ) ) ( not ( = ?auto_2708751 ?auto_2708755 ) ) ( not ( = ?auto_2708751 ?auto_2708756 ) ) ( not ( = ?auto_2708751 ?auto_2708758 ) ) ( not ( = ?auto_2708752 ?auto_2708753 ) ) ( not ( = ?auto_2708752 ?auto_2708754 ) ) ( not ( = ?auto_2708752 ?auto_2708755 ) ) ( not ( = ?auto_2708752 ?auto_2708756 ) ) ( not ( = ?auto_2708752 ?auto_2708758 ) ) ( not ( = ?auto_2708753 ?auto_2708754 ) ) ( not ( = ?auto_2708753 ?auto_2708755 ) ) ( not ( = ?auto_2708753 ?auto_2708756 ) ) ( not ( = ?auto_2708753 ?auto_2708758 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2708754 ?auto_2708755 ?auto_2708756 )
      ( MAKE-7CRATE-VERIFY ?auto_2708749 ?auto_2708750 ?auto_2708751 ?auto_2708752 ?auto_2708753 ?auto_2708754 ?auto_2708755 ?auto_2708756 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2708763 - SURFACE
      ?auto_2708764 - SURFACE
      ?auto_2708765 - SURFACE
      ?auto_2708766 - SURFACE
      ?auto_2708767 - SURFACE
      ?auto_2708768 - SURFACE
      ?auto_2708769 - SURFACE
      ?auto_2708770 - SURFACE
      ?auto_2708771 - SURFACE
    )
    :vars
    (
      ?auto_2708775 - HOIST
      ?auto_2708776 - PLACE
      ?auto_2708777 - PLACE
      ?auto_2708772 - HOIST
      ?auto_2708773 - SURFACE
      ?auto_2708774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2708775 ?auto_2708776 ) ( IS-CRATE ?auto_2708771 ) ( not ( = ?auto_2708770 ?auto_2708771 ) ) ( not ( = ?auto_2708769 ?auto_2708770 ) ) ( not ( = ?auto_2708769 ?auto_2708771 ) ) ( not ( = ?auto_2708777 ?auto_2708776 ) ) ( HOIST-AT ?auto_2708772 ?auto_2708777 ) ( not ( = ?auto_2708775 ?auto_2708772 ) ) ( AVAILABLE ?auto_2708772 ) ( SURFACE-AT ?auto_2708771 ?auto_2708777 ) ( ON ?auto_2708771 ?auto_2708773 ) ( CLEAR ?auto_2708771 ) ( not ( = ?auto_2708770 ?auto_2708773 ) ) ( not ( = ?auto_2708771 ?auto_2708773 ) ) ( not ( = ?auto_2708769 ?auto_2708773 ) ) ( SURFACE-AT ?auto_2708769 ?auto_2708776 ) ( CLEAR ?auto_2708769 ) ( IS-CRATE ?auto_2708770 ) ( AVAILABLE ?auto_2708775 ) ( IN ?auto_2708770 ?auto_2708774 ) ( TRUCK-AT ?auto_2708774 ?auto_2708777 ) ( ON ?auto_2708764 ?auto_2708763 ) ( ON ?auto_2708765 ?auto_2708764 ) ( ON ?auto_2708766 ?auto_2708765 ) ( ON ?auto_2708767 ?auto_2708766 ) ( ON ?auto_2708768 ?auto_2708767 ) ( ON ?auto_2708769 ?auto_2708768 ) ( not ( = ?auto_2708763 ?auto_2708764 ) ) ( not ( = ?auto_2708763 ?auto_2708765 ) ) ( not ( = ?auto_2708763 ?auto_2708766 ) ) ( not ( = ?auto_2708763 ?auto_2708767 ) ) ( not ( = ?auto_2708763 ?auto_2708768 ) ) ( not ( = ?auto_2708763 ?auto_2708769 ) ) ( not ( = ?auto_2708763 ?auto_2708770 ) ) ( not ( = ?auto_2708763 ?auto_2708771 ) ) ( not ( = ?auto_2708763 ?auto_2708773 ) ) ( not ( = ?auto_2708764 ?auto_2708765 ) ) ( not ( = ?auto_2708764 ?auto_2708766 ) ) ( not ( = ?auto_2708764 ?auto_2708767 ) ) ( not ( = ?auto_2708764 ?auto_2708768 ) ) ( not ( = ?auto_2708764 ?auto_2708769 ) ) ( not ( = ?auto_2708764 ?auto_2708770 ) ) ( not ( = ?auto_2708764 ?auto_2708771 ) ) ( not ( = ?auto_2708764 ?auto_2708773 ) ) ( not ( = ?auto_2708765 ?auto_2708766 ) ) ( not ( = ?auto_2708765 ?auto_2708767 ) ) ( not ( = ?auto_2708765 ?auto_2708768 ) ) ( not ( = ?auto_2708765 ?auto_2708769 ) ) ( not ( = ?auto_2708765 ?auto_2708770 ) ) ( not ( = ?auto_2708765 ?auto_2708771 ) ) ( not ( = ?auto_2708765 ?auto_2708773 ) ) ( not ( = ?auto_2708766 ?auto_2708767 ) ) ( not ( = ?auto_2708766 ?auto_2708768 ) ) ( not ( = ?auto_2708766 ?auto_2708769 ) ) ( not ( = ?auto_2708766 ?auto_2708770 ) ) ( not ( = ?auto_2708766 ?auto_2708771 ) ) ( not ( = ?auto_2708766 ?auto_2708773 ) ) ( not ( = ?auto_2708767 ?auto_2708768 ) ) ( not ( = ?auto_2708767 ?auto_2708769 ) ) ( not ( = ?auto_2708767 ?auto_2708770 ) ) ( not ( = ?auto_2708767 ?auto_2708771 ) ) ( not ( = ?auto_2708767 ?auto_2708773 ) ) ( not ( = ?auto_2708768 ?auto_2708769 ) ) ( not ( = ?auto_2708768 ?auto_2708770 ) ) ( not ( = ?auto_2708768 ?auto_2708771 ) ) ( not ( = ?auto_2708768 ?auto_2708773 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2708769 ?auto_2708770 ?auto_2708771 )
      ( MAKE-8CRATE-VERIFY ?auto_2708763 ?auto_2708764 ?auto_2708765 ?auto_2708766 ?auto_2708767 ?auto_2708768 ?auto_2708769 ?auto_2708770 ?auto_2708771 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2708778 - SURFACE
      ?auto_2708779 - SURFACE
      ?auto_2708780 - SURFACE
      ?auto_2708781 - SURFACE
      ?auto_2708782 - SURFACE
      ?auto_2708783 - SURFACE
      ?auto_2708784 - SURFACE
      ?auto_2708785 - SURFACE
      ?auto_2708786 - SURFACE
      ?auto_2708787 - SURFACE
    )
    :vars
    (
      ?auto_2708791 - HOIST
      ?auto_2708792 - PLACE
      ?auto_2708793 - PLACE
      ?auto_2708788 - HOIST
      ?auto_2708789 - SURFACE
      ?auto_2708790 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2708791 ?auto_2708792 ) ( IS-CRATE ?auto_2708787 ) ( not ( = ?auto_2708786 ?auto_2708787 ) ) ( not ( = ?auto_2708785 ?auto_2708786 ) ) ( not ( = ?auto_2708785 ?auto_2708787 ) ) ( not ( = ?auto_2708793 ?auto_2708792 ) ) ( HOIST-AT ?auto_2708788 ?auto_2708793 ) ( not ( = ?auto_2708791 ?auto_2708788 ) ) ( AVAILABLE ?auto_2708788 ) ( SURFACE-AT ?auto_2708787 ?auto_2708793 ) ( ON ?auto_2708787 ?auto_2708789 ) ( CLEAR ?auto_2708787 ) ( not ( = ?auto_2708786 ?auto_2708789 ) ) ( not ( = ?auto_2708787 ?auto_2708789 ) ) ( not ( = ?auto_2708785 ?auto_2708789 ) ) ( SURFACE-AT ?auto_2708785 ?auto_2708792 ) ( CLEAR ?auto_2708785 ) ( IS-CRATE ?auto_2708786 ) ( AVAILABLE ?auto_2708791 ) ( IN ?auto_2708786 ?auto_2708790 ) ( TRUCK-AT ?auto_2708790 ?auto_2708793 ) ( ON ?auto_2708779 ?auto_2708778 ) ( ON ?auto_2708780 ?auto_2708779 ) ( ON ?auto_2708781 ?auto_2708780 ) ( ON ?auto_2708782 ?auto_2708781 ) ( ON ?auto_2708783 ?auto_2708782 ) ( ON ?auto_2708784 ?auto_2708783 ) ( ON ?auto_2708785 ?auto_2708784 ) ( not ( = ?auto_2708778 ?auto_2708779 ) ) ( not ( = ?auto_2708778 ?auto_2708780 ) ) ( not ( = ?auto_2708778 ?auto_2708781 ) ) ( not ( = ?auto_2708778 ?auto_2708782 ) ) ( not ( = ?auto_2708778 ?auto_2708783 ) ) ( not ( = ?auto_2708778 ?auto_2708784 ) ) ( not ( = ?auto_2708778 ?auto_2708785 ) ) ( not ( = ?auto_2708778 ?auto_2708786 ) ) ( not ( = ?auto_2708778 ?auto_2708787 ) ) ( not ( = ?auto_2708778 ?auto_2708789 ) ) ( not ( = ?auto_2708779 ?auto_2708780 ) ) ( not ( = ?auto_2708779 ?auto_2708781 ) ) ( not ( = ?auto_2708779 ?auto_2708782 ) ) ( not ( = ?auto_2708779 ?auto_2708783 ) ) ( not ( = ?auto_2708779 ?auto_2708784 ) ) ( not ( = ?auto_2708779 ?auto_2708785 ) ) ( not ( = ?auto_2708779 ?auto_2708786 ) ) ( not ( = ?auto_2708779 ?auto_2708787 ) ) ( not ( = ?auto_2708779 ?auto_2708789 ) ) ( not ( = ?auto_2708780 ?auto_2708781 ) ) ( not ( = ?auto_2708780 ?auto_2708782 ) ) ( not ( = ?auto_2708780 ?auto_2708783 ) ) ( not ( = ?auto_2708780 ?auto_2708784 ) ) ( not ( = ?auto_2708780 ?auto_2708785 ) ) ( not ( = ?auto_2708780 ?auto_2708786 ) ) ( not ( = ?auto_2708780 ?auto_2708787 ) ) ( not ( = ?auto_2708780 ?auto_2708789 ) ) ( not ( = ?auto_2708781 ?auto_2708782 ) ) ( not ( = ?auto_2708781 ?auto_2708783 ) ) ( not ( = ?auto_2708781 ?auto_2708784 ) ) ( not ( = ?auto_2708781 ?auto_2708785 ) ) ( not ( = ?auto_2708781 ?auto_2708786 ) ) ( not ( = ?auto_2708781 ?auto_2708787 ) ) ( not ( = ?auto_2708781 ?auto_2708789 ) ) ( not ( = ?auto_2708782 ?auto_2708783 ) ) ( not ( = ?auto_2708782 ?auto_2708784 ) ) ( not ( = ?auto_2708782 ?auto_2708785 ) ) ( not ( = ?auto_2708782 ?auto_2708786 ) ) ( not ( = ?auto_2708782 ?auto_2708787 ) ) ( not ( = ?auto_2708782 ?auto_2708789 ) ) ( not ( = ?auto_2708783 ?auto_2708784 ) ) ( not ( = ?auto_2708783 ?auto_2708785 ) ) ( not ( = ?auto_2708783 ?auto_2708786 ) ) ( not ( = ?auto_2708783 ?auto_2708787 ) ) ( not ( = ?auto_2708783 ?auto_2708789 ) ) ( not ( = ?auto_2708784 ?auto_2708785 ) ) ( not ( = ?auto_2708784 ?auto_2708786 ) ) ( not ( = ?auto_2708784 ?auto_2708787 ) ) ( not ( = ?auto_2708784 ?auto_2708789 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2708785 ?auto_2708786 ?auto_2708787 )
      ( MAKE-9CRATE-VERIFY ?auto_2708778 ?auto_2708779 ?auto_2708780 ?auto_2708781 ?auto_2708782 ?auto_2708783 ?auto_2708784 ?auto_2708785 ?auto_2708786 ?auto_2708787 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2708794 - SURFACE
      ?auto_2708795 - SURFACE
      ?auto_2708796 - SURFACE
      ?auto_2708797 - SURFACE
      ?auto_2708798 - SURFACE
      ?auto_2708799 - SURFACE
      ?auto_2708800 - SURFACE
      ?auto_2708801 - SURFACE
      ?auto_2708802 - SURFACE
      ?auto_2708803 - SURFACE
      ?auto_2708804 - SURFACE
    )
    :vars
    (
      ?auto_2708808 - HOIST
      ?auto_2708809 - PLACE
      ?auto_2708810 - PLACE
      ?auto_2708805 - HOIST
      ?auto_2708806 - SURFACE
      ?auto_2708807 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2708808 ?auto_2708809 ) ( IS-CRATE ?auto_2708804 ) ( not ( = ?auto_2708803 ?auto_2708804 ) ) ( not ( = ?auto_2708802 ?auto_2708803 ) ) ( not ( = ?auto_2708802 ?auto_2708804 ) ) ( not ( = ?auto_2708810 ?auto_2708809 ) ) ( HOIST-AT ?auto_2708805 ?auto_2708810 ) ( not ( = ?auto_2708808 ?auto_2708805 ) ) ( AVAILABLE ?auto_2708805 ) ( SURFACE-AT ?auto_2708804 ?auto_2708810 ) ( ON ?auto_2708804 ?auto_2708806 ) ( CLEAR ?auto_2708804 ) ( not ( = ?auto_2708803 ?auto_2708806 ) ) ( not ( = ?auto_2708804 ?auto_2708806 ) ) ( not ( = ?auto_2708802 ?auto_2708806 ) ) ( SURFACE-AT ?auto_2708802 ?auto_2708809 ) ( CLEAR ?auto_2708802 ) ( IS-CRATE ?auto_2708803 ) ( AVAILABLE ?auto_2708808 ) ( IN ?auto_2708803 ?auto_2708807 ) ( TRUCK-AT ?auto_2708807 ?auto_2708810 ) ( ON ?auto_2708795 ?auto_2708794 ) ( ON ?auto_2708796 ?auto_2708795 ) ( ON ?auto_2708797 ?auto_2708796 ) ( ON ?auto_2708798 ?auto_2708797 ) ( ON ?auto_2708799 ?auto_2708798 ) ( ON ?auto_2708800 ?auto_2708799 ) ( ON ?auto_2708801 ?auto_2708800 ) ( ON ?auto_2708802 ?auto_2708801 ) ( not ( = ?auto_2708794 ?auto_2708795 ) ) ( not ( = ?auto_2708794 ?auto_2708796 ) ) ( not ( = ?auto_2708794 ?auto_2708797 ) ) ( not ( = ?auto_2708794 ?auto_2708798 ) ) ( not ( = ?auto_2708794 ?auto_2708799 ) ) ( not ( = ?auto_2708794 ?auto_2708800 ) ) ( not ( = ?auto_2708794 ?auto_2708801 ) ) ( not ( = ?auto_2708794 ?auto_2708802 ) ) ( not ( = ?auto_2708794 ?auto_2708803 ) ) ( not ( = ?auto_2708794 ?auto_2708804 ) ) ( not ( = ?auto_2708794 ?auto_2708806 ) ) ( not ( = ?auto_2708795 ?auto_2708796 ) ) ( not ( = ?auto_2708795 ?auto_2708797 ) ) ( not ( = ?auto_2708795 ?auto_2708798 ) ) ( not ( = ?auto_2708795 ?auto_2708799 ) ) ( not ( = ?auto_2708795 ?auto_2708800 ) ) ( not ( = ?auto_2708795 ?auto_2708801 ) ) ( not ( = ?auto_2708795 ?auto_2708802 ) ) ( not ( = ?auto_2708795 ?auto_2708803 ) ) ( not ( = ?auto_2708795 ?auto_2708804 ) ) ( not ( = ?auto_2708795 ?auto_2708806 ) ) ( not ( = ?auto_2708796 ?auto_2708797 ) ) ( not ( = ?auto_2708796 ?auto_2708798 ) ) ( not ( = ?auto_2708796 ?auto_2708799 ) ) ( not ( = ?auto_2708796 ?auto_2708800 ) ) ( not ( = ?auto_2708796 ?auto_2708801 ) ) ( not ( = ?auto_2708796 ?auto_2708802 ) ) ( not ( = ?auto_2708796 ?auto_2708803 ) ) ( not ( = ?auto_2708796 ?auto_2708804 ) ) ( not ( = ?auto_2708796 ?auto_2708806 ) ) ( not ( = ?auto_2708797 ?auto_2708798 ) ) ( not ( = ?auto_2708797 ?auto_2708799 ) ) ( not ( = ?auto_2708797 ?auto_2708800 ) ) ( not ( = ?auto_2708797 ?auto_2708801 ) ) ( not ( = ?auto_2708797 ?auto_2708802 ) ) ( not ( = ?auto_2708797 ?auto_2708803 ) ) ( not ( = ?auto_2708797 ?auto_2708804 ) ) ( not ( = ?auto_2708797 ?auto_2708806 ) ) ( not ( = ?auto_2708798 ?auto_2708799 ) ) ( not ( = ?auto_2708798 ?auto_2708800 ) ) ( not ( = ?auto_2708798 ?auto_2708801 ) ) ( not ( = ?auto_2708798 ?auto_2708802 ) ) ( not ( = ?auto_2708798 ?auto_2708803 ) ) ( not ( = ?auto_2708798 ?auto_2708804 ) ) ( not ( = ?auto_2708798 ?auto_2708806 ) ) ( not ( = ?auto_2708799 ?auto_2708800 ) ) ( not ( = ?auto_2708799 ?auto_2708801 ) ) ( not ( = ?auto_2708799 ?auto_2708802 ) ) ( not ( = ?auto_2708799 ?auto_2708803 ) ) ( not ( = ?auto_2708799 ?auto_2708804 ) ) ( not ( = ?auto_2708799 ?auto_2708806 ) ) ( not ( = ?auto_2708800 ?auto_2708801 ) ) ( not ( = ?auto_2708800 ?auto_2708802 ) ) ( not ( = ?auto_2708800 ?auto_2708803 ) ) ( not ( = ?auto_2708800 ?auto_2708804 ) ) ( not ( = ?auto_2708800 ?auto_2708806 ) ) ( not ( = ?auto_2708801 ?auto_2708802 ) ) ( not ( = ?auto_2708801 ?auto_2708803 ) ) ( not ( = ?auto_2708801 ?auto_2708804 ) ) ( not ( = ?auto_2708801 ?auto_2708806 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2708802 ?auto_2708803 ?auto_2708804 )
      ( MAKE-10CRATE-VERIFY ?auto_2708794 ?auto_2708795 ?auto_2708796 ?auto_2708797 ?auto_2708798 ?auto_2708799 ?auto_2708800 ?auto_2708801 ?auto_2708802 ?auto_2708803 ?auto_2708804 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2708811 - SURFACE
      ?auto_2708812 - SURFACE
      ?auto_2708813 - SURFACE
      ?auto_2708814 - SURFACE
      ?auto_2708815 - SURFACE
      ?auto_2708816 - SURFACE
      ?auto_2708817 - SURFACE
      ?auto_2708818 - SURFACE
      ?auto_2708819 - SURFACE
      ?auto_2708820 - SURFACE
      ?auto_2708821 - SURFACE
      ?auto_2708822 - SURFACE
    )
    :vars
    (
      ?auto_2708826 - HOIST
      ?auto_2708827 - PLACE
      ?auto_2708828 - PLACE
      ?auto_2708823 - HOIST
      ?auto_2708824 - SURFACE
      ?auto_2708825 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2708826 ?auto_2708827 ) ( IS-CRATE ?auto_2708822 ) ( not ( = ?auto_2708821 ?auto_2708822 ) ) ( not ( = ?auto_2708820 ?auto_2708821 ) ) ( not ( = ?auto_2708820 ?auto_2708822 ) ) ( not ( = ?auto_2708828 ?auto_2708827 ) ) ( HOIST-AT ?auto_2708823 ?auto_2708828 ) ( not ( = ?auto_2708826 ?auto_2708823 ) ) ( AVAILABLE ?auto_2708823 ) ( SURFACE-AT ?auto_2708822 ?auto_2708828 ) ( ON ?auto_2708822 ?auto_2708824 ) ( CLEAR ?auto_2708822 ) ( not ( = ?auto_2708821 ?auto_2708824 ) ) ( not ( = ?auto_2708822 ?auto_2708824 ) ) ( not ( = ?auto_2708820 ?auto_2708824 ) ) ( SURFACE-AT ?auto_2708820 ?auto_2708827 ) ( CLEAR ?auto_2708820 ) ( IS-CRATE ?auto_2708821 ) ( AVAILABLE ?auto_2708826 ) ( IN ?auto_2708821 ?auto_2708825 ) ( TRUCK-AT ?auto_2708825 ?auto_2708828 ) ( ON ?auto_2708812 ?auto_2708811 ) ( ON ?auto_2708813 ?auto_2708812 ) ( ON ?auto_2708814 ?auto_2708813 ) ( ON ?auto_2708815 ?auto_2708814 ) ( ON ?auto_2708816 ?auto_2708815 ) ( ON ?auto_2708817 ?auto_2708816 ) ( ON ?auto_2708818 ?auto_2708817 ) ( ON ?auto_2708819 ?auto_2708818 ) ( ON ?auto_2708820 ?auto_2708819 ) ( not ( = ?auto_2708811 ?auto_2708812 ) ) ( not ( = ?auto_2708811 ?auto_2708813 ) ) ( not ( = ?auto_2708811 ?auto_2708814 ) ) ( not ( = ?auto_2708811 ?auto_2708815 ) ) ( not ( = ?auto_2708811 ?auto_2708816 ) ) ( not ( = ?auto_2708811 ?auto_2708817 ) ) ( not ( = ?auto_2708811 ?auto_2708818 ) ) ( not ( = ?auto_2708811 ?auto_2708819 ) ) ( not ( = ?auto_2708811 ?auto_2708820 ) ) ( not ( = ?auto_2708811 ?auto_2708821 ) ) ( not ( = ?auto_2708811 ?auto_2708822 ) ) ( not ( = ?auto_2708811 ?auto_2708824 ) ) ( not ( = ?auto_2708812 ?auto_2708813 ) ) ( not ( = ?auto_2708812 ?auto_2708814 ) ) ( not ( = ?auto_2708812 ?auto_2708815 ) ) ( not ( = ?auto_2708812 ?auto_2708816 ) ) ( not ( = ?auto_2708812 ?auto_2708817 ) ) ( not ( = ?auto_2708812 ?auto_2708818 ) ) ( not ( = ?auto_2708812 ?auto_2708819 ) ) ( not ( = ?auto_2708812 ?auto_2708820 ) ) ( not ( = ?auto_2708812 ?auto_2708821 ) ) ( not ( = ?auto_2708812 ?auto_2708822 ) ) ( not ( = ?auto_2708812 ?auto_2708824 ) ) ( not ( = ?auto_2708813 ?auto_2708814 ) ) ( not ( = ?auto_2708813 ?auto_2708815 ) ) ( not ( = ?auto_2708813 ?auto_2708816 ) ) ( not ( = ?auto_2708813 ?auto_2708817 ) ) ( not ( = ?auto_2708813 ?auto_2708818 ) ) ( not ( = ?auto_2708813 ?auto_2708819 ) ) ( not ( = ?auto_2708813 ?auto_2708820 ) ) ( not ( = ?auto_2708813 ?auto_2708821 ) ) ( not ( = ?auto_2708813 ?auto_2708822 ) ) ( not ( = ?auto_2708813 ?auto_2708824 ) ) ( not ( = ?auto_2708814 ?auto_2708815 ) ) ( not ( = ?auto_2708814 ?auto_2708816 ) ) ( not ( = ?auto_2708814 ?auto_2708817 ) ) ( not ( = ?auto_2708814 ?auto_2708818 ) ) ( not ( = ?auto_2708814 ?auto_2708819 ) ) ( not ( = ?auto_2708814 ?auto_2708820 ) ) ( not ( = ?auto_2708814 ?auto_2708821 ) ) ( not ( = ?auto_2708814 ?auto_2708822 ) ) ( not ( = ?auto_2708814 ?auto_2708824 ) ) ( not ( = ?auto_2708815 ?auto_2708816 ) ) ( not ( = ?auto_2708815 ?auto_2708817 ) ) ( not ( = ?auto_2708815 ?auto_2708818 ) ) ( not ( = ?auto_2708815 ?auto_2708819 ) ) ( not ( = ?auto_2708815 ?auto_2708820 ) ) ( not ( = ?auto_2708815 ?auto_2708821 ) ) ( not ( = ?auto_2708815 ?auto_2708822 ) ) ( not ( = ?auto_2708815 ?auto_2708824 ) ) ( not ( = ?auto_2708816 ?auto_2708817 ) ) ( not ( = ?auto_2708816 ?auto_2708818 ) ) ( not ( = ?auto_2708816 ?auto_2708819 ) ) ( not ( = ?auto_2708816 ?auto_2708820 ) ) ( not ( = ?auto_2708816 ?auto_2708821 ) ) ( not ( = ?auto_2708816 ?auto_2708822 ) ) ( not ( = ?auto_2708816 ?auto_2708824 ) ) ( not ( = ?auto_2708817 ?auto_2708818 ) ) ( not ( = ?auto_2708817 ?auto_2708819 ) ) ( not ( = ?auto_2708817 ?auto_2708820 ) ) ( not ( = ?auto_2708817 ?auto_2708821 ) ) ( not ( = ?auto_2708817 ?auto_2708822 ) ) ( not ( = ?auto_2708817 ?auto_2708824 ) ) ( not ( = ?auto_2708818 ?auto_2708819 ) ) ( not ( = ?auto_2708818 ?auto_2708820 ) ) ( not ( = ?auto_2708818 ?auto_2708821 ) ) ( not ( = ?auto_2708818 ?auto_2708822 ) ) ( not ( = ?auto_2708818 ?auto_2708824 ) ) ( not ( = ?auto_2708819 ?auto_2708820 ) ) ( not ( = ?auto_2708819 ?auto_2708821 ) ) ( not ( = ?auto_2708819 ?auto_2708822 ) ) ( not ( = ?auto_2708819 ?auto_2708824 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2708820 ?auto_2708821 ?auto_2708822 )
      ( MAKE-11CRATE-VERIFY ?auto_2708811 ?auto_2708812 ?auto_2708813 ?auto_2708814 ?auto_2708815 ?auto_2708816 ?auto_2708817 ?auto_2708818 ?auto_2708819 ?auto_2708820 ?auto_2708821 ?auto_2708822 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2708829 - SURFACE
      ?auto_2708830 - SURFACE
      ?auto_2708831 - SURFACE
      ?auto_2708832 - SURFACE
      ?auto_2708833 - SURFACE
      ?auto_2708834 - SURFACE
      ?auto_2708835 - SURFACE
      ?auto_2708836 - SURFACE
      ?auto_2708837 - SURFACE
      ?auto_2708838 - SURFACE
      ?auto_2708839 - SURFACE
      ?auto_2708840 - SURFACE
      ?auto_2708841 - SURFACE
    )
    :vars
    (
      ?auto_2708845 - HOIST
      ?auto_2708846 - PLACE
      ?auto_2708847 - PLACE
      ?auto_2708842 - HOIST
      ?auto_2708843 - SURFACE
      ?auto_2708844 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2708845 ?auto_2708846 ) ( IS-CRATE ?auto_2708841 ) ( not ( = ?auto_2708840 ?auto_2708841 ) ) ( not ( = ?auto_2708839 ?auto_2708840 ) ) ( not ( = ?auto_2708839 ?auto_2708841 ) ) ( not ( = ?auto_2708847 ?auto_2708846 ) ) ( HOIST-AT ?auto_2708842 ?auto_2708847 ) ( not ( = ?auto_2708845 ?auto_2708842 ) ) ( AVAILABLE ?auto_2708842 ) ( SURFACE-AT ?auto_2708841 ?auto_2708847 ) ( ON ?auto_2708841 ?auto_2708843 ) ( CLEAR ?auto_2708841 ) ( not ( = ?auto_2708840 ?auto_2708843 ) ) ( not ( = ?auto_2708841 ?auto_2708843 ) ) ( not ( = ?auto_2708839 ?auto_2708843 ) ) ( SURFACE-AT ?auto_2708839 ?auto_2708846 ) ( CLEAR ?auto_2708839 ) ( IS-CRATE ?auto_2708840 ) ( AVAILABLE ?auto_2708845 ) ( IN ?auto_2708840 ?auto_2708844 ) ( TRUCK-AT ?auto_2708844 ?auto_2708847 ) ( ON ?auto_2708830 ?auto_2708829 ) ( ON ?auto_2708831 ?auto_2708830 ) ( ON ?auto_2708832 ?auto_2708831 ) ( ON ?auto_2708833 ?auto_2708832 ) ( ON ?auto_2708834 ?auto_2708833 ) ( ON ?auto_2708835 ?auto_2708834 ) ( ON ?auto_2708836 ?auto_2708835 ) ( ON ?auto_2708837 ?auto_2708836 ) ( ON ?auto_2708838 ?auto_2708837 ) ( ON ?auto_2708839 ?auto_2708838 ) ( not ( = ?auto_2708829 ?auto_2708830 ) ) ( not ( = ?auto_2708829 ?auto_2708831 ) ) ( not ( = ?auto_2708829 ?auto_2708832 ) ) ( not ( = ?auto_2708829 ?auto_2708833 ) ) ( not ( = ?auto_2708829 ?auto_2708834 ) ) ( not ( = ?auto_2708829 ?auto_2708835 ) ) ( not ( = ?auto_2708829 ?auto_2708836 ) ) ( not ( = ?auto_2708829 ?auto_2708837 ) ) ( not ( = ?auto_2708829 ?auto_2708838 ) ) ( not ( = ?auto_2708829 ?auto_2708839 ) ) ( not ( = ?auto_2708829 ?auto_2708840 ) ) ( not ( = ?auto_2708829 ?auto_2708841 ) ) ( not ( = ?auto_2708829 ?auto_2708843 ) ) ( not ( = ?auto_2708830 ?auto_2708831 ) ) ( not ( = ?auto_2708830 ?auto_2708832 ) ) ( not ( = ?auto_2708830 ?auto_2708833 ) ) ( not ( = ?auto_2708830 ?auto_2708834 ) ) ( not ( = ?auto_2708830 ?auto_2708835 ) ) ( not ( = ?auto_2708830 ?auto_2708836 ) ) ( not ( = ?auto_2708830 ?auto_2708837 ) ) ( not ( = ?auto_2708830 ?auto_2708838 ) ) ( not ( = ?auto_2708830 ?auto_2708839 ) ) ( not ( = ?auto_2708830 ?auto_2708840 ) ) ( not ( = ?auto_2708830 ?auto_2708841 ) ) ( not ( = ?auto_2708830 ?auto_2708843 ) ) ( not ( = ?auto_2708831 ?auto_2708832 ) ) ( not ( = ?auto_2708831 ?auto_2708833 ) ) ( not ( = ?auto_2708831 ?auto_2708834 ) ) ( not ( = ?auto_2708831 ?auto_2708835 ) ) ( not ( = ?auto_2708831 ?auto_2708836 ) ) ( not ( = ?auto_2708831 ?auto_2708837 ) ) ( not ( = ?auto_2708831 ?auto_2708838 ) ) ( not ( = ?auto_2708831 ?auto_2708839 ) ) ( not ( = ?auto_2708831 ?auto_2708840 ) ) ( not ( = ?auto_2708831 ?auto_2708841 ) ) ( not ( = ?auto_2708831 ?auto_2708843 ) ) ( not ( = ?auto_2708832 ?auto_2708833 ) ) ( not ( = ?auto_2708832 ?auto_2708834 ) ) ( not ( = ?auto_2708832 ?auto_2708835 ) ) ( not ( = ?auto_2708832 ?auto_2708836 ) ) ( not ( = ?auto_2708832 ?auto_2708837 ) ) ( not ( = ?auto_2708832 ?auto_2708838 ) ) ( not ( = ?auto_2708832 ?auto_2708839 ) ) ( not ( = ?auto_2708832 ?auto_2708840 ) ) ( not ( = ?auto_2708832 ?auto_2708841 ) ) ( not ( = ?auto_2708832 ?auto_2708843 ) ) ( not ( = ?auto_2708833 ?auto_2708834 ) ) ( not ( = ?auto_2708833 ?auto_2708835 ) ) ( not ( = ?auto_2708833 ?auto_2708836 ) ) ( not ( = ?auto_2708833 ?auto_2708837 ) ) ( not ( = ?auto_2708833 ?auto_2708838 ) ) ( not ( = ?auto_2708833 ?auto_2708839 ) ) ( not ( = ?auto_2708833 ?auto_2708840 ) ) ( not ( = ?auto_2708833 ?auto_2708841 ) ) ( not ( = ?auto_2708833 ?auto_2708843 ) ) ( not ( = ?auto_2708834 ?auto_2708835 ) ) ( not ( = ?auto_2708834 ?auto_2708836 ) ) ( not ( = ?auto_2708834 ?auto_2708837 ) ) ( not ( = ?auto_2708834 ?auto_2708838 ) ) ( not ( = ?auto_2708834 ?auto_2708839 ) ) ( not ( = ?auto_2708834 ?auto_2708840 ) ) ( not ( = ?auto_2708834 ?auto_2708841 ) ) ( not ( = ?auto_2708834 ?auto_2708843 ) ) ( not ( = ?auto_2708835 ?auto_2708836 ) ) ( not ( = ?auto_2708835 ?auto_2708837 ) ) ( not ( = ?auto_2708835 ?auto_2708838 ) ) ( not ( = ?auto_2708835 ?auto_2708839 ) ) ( not ( = ?auto_2708835 ?auto_2708840 ) ) ( not ( = ?auto_2708835 ?auto_2708841 ) ) ( not ( = ?auto_2708835 ?auto_2708843 ) ) ( not ( = ?auto_2708836 ?auto_2708837 ) ) ( not ( = ?auto_2708836 ?auto_2708838 ) ) ( not ( = ?auto_2708836 ?auto_2708839 ) ) ( not ( = ?auto_2708836 ?auto_2708840 ) ) ( not ( = ?auto_2708836 ?auto_2708841 ) ) ( not ( = ?auto_2708836 ?auto_2708843 ) ) ( not ( = ?auto_2708837 ?auto_2708838 ) ) ( not ( = ?auto_2708837 ?auto_2708839 ) ) ( not ( = ?auto_2708837 ?auto_2708840 ) ) ( not ( = ?auto_2708837 ?auto_2708841 ) ) ( not ( = ?auto_2708837 ?auto_2708843 ) ) ( not ( = ?auto_2708838 ?auto_2708839 ) ) ( not ( = ?auto_2708838 ?auto_2708840 ) ) ( not ( = ?auto_2708838 ?auto_2708841 ) ) ( not ( = ?auto_2708838 ?auto_2708843 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2708839 ?auto_2708840 ?auto_2708841 )
      ( MAKE-12CRATE-VERIFY ?auto_2708829 ?auto_2708830 ?auto_2708831 ?auto_2708832 ?auto_2708833 ?auto_2708834 ?auto_2708835 ?auto_2708836 ?auto_2708837 ?auto_2708838 ?auto_2708839 ?auto_2708840 ?auto_2708841 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2708848 - SURFACE
      ?auto_2708849 - SURFACE
      ?auto_2708850 - SURFACE
      ?auto_2708851 - SURFACE
      ?auto_2708852 - SURFACE
      ?auto_2708853 - SURFACE
      ?auto_2708854 - SURFACE
      ?auto_2708855 - SURFACE
      ?auto_2708856 - SURFACE
      ?auto_2708857 - SURFACE
      ?auto_2708858 - SURFACE
      ?auto_2708859 - SURFACE
      ?auto_2708860 - SURFACE
      ?auto_2708861 - SURFACE
    )
    :vars
    (
      ?auto_2708865 - HOIST
      ?auto_2708866 - PLACE
      ?auto_2708867 - PLACE
      ?auto_2708862 - HOIST
      ?auto_2708863 - SURFACE
      ?auto_2708864 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2708865 ?auto_2708866 ) ( IS-CRATE ?auto_2708861 ) ( not ( = ?auto_2708860 ?auto_2708861 ) ) ( not ( = ?auto_2708859 ?auto_2708860 ) ) ( not ( = ?auto_2708859 ?auto_2708861 ) ) ( not ( = ?auto_2708867 ?auto_2708866 ) ) ( HOIST-AT ?auto_2708862 ?auto_2708867 ) ( not ( = ?auto_2708865 ?auto_2708862 ) ) ( AVAILABLE ?auto_2708862 ) ( SURFACE-AT ?auto_2708861 ?auto_2708867 ) ( ON ?auto_2708861 ?auto_2708863 ) ( CLEAR ?auto_2708861 ) ( not ( = ?auto_2708860 ?auto_2708863 ) ) ( not ( = ?auto_2708861 ?auto_2708863 ) ) ( not ( = ?auto_2708859 ?auto_2708863 ) ) ( SURFACE-AT ?auto_2708859 ?auto_2708866 ) ( CLEAR ?auto_2708859 ) ( IS-CRATE ?auto_2708860 ) ( AVAILABLE ?auto_2708865 ) ( IN ?auto_2708860 ?auto_2708864 ) ( TRUCK-AT ?auto_2708864 ?auto_2708867 ) ( ON ?auto_2708849 ?auto_2708848 ) ( ON ?auto_2708850 ?auto_2708849 ) ( ON ?auto_2708851 ?auto_2708850 ) ( ON ?auto_2708852 ?auto_2708851 ) ( ON ?auto_2708853 ?auto_2708852 ) ( ON ?auto_2708854 ?auto_2708853 ) ( ON ?auto_2708855 ?auto_2708854 ) ( ON ?auto_2708856 ?auto_2708855 ) ( ON ?auto_2708857 ?auto_2708856 ) ( ON ?auto_2708858 ?auto_2708857 ) ( ON ?auto_2708859 ?auto_2708858 ) ( not ( = ?auto_2708848 ?auto_2708849 ) ) ( not ( = ?auto_2708848 ?auto_2708850 ) ) ( not ( = ?auto_2708848 ?auto_2708851 ) ) ( not ( = ?auto_2708848 ?auto_2708852 ) ) ( not ( = ?auto_2708848 ?auto_2708853 ) ) ( not ( = ?auto_2708848 ?auto_2708854 ) ) ( not ( = ?auto_2708848 ?auto_2708855 ) ) ( not ( = ?auto_2708848 ?auto_2708856 ) ) ( not ( = ?auto_2708848 ?auto_2708857 ) ) ( not ( = ?auto_2708848 ?auto_2708858 ) ) ( not ( = ?auto_2708848 ?auto_2708859 ) ) ( not ( = ?auto_2708848 ?auto_2708860 ) ) ( not ( = ?auto_2708848 ?auto_2708861 ) ) ( not ( = ?auto_2708848 ?auto_2708863 ) ) ( not ( = ?auto_2708849 ?auto_2708850 ) ) ( not ( = ?auto_2708849 ?auto_2708851 ) ) ( not ( = ?auto_2708849 ?auto_2708852 ) ) ( not ( = ?auto_2708849 ?auto_2708853 ) ) ( not ( = ?auto_2708849 ?auto_2708854 ) ) ( not ( = ?auto_2708849 ?auto_2708855 ) ) ( not ( = ?auto_2708849 ?auto_2708856 ) ) ( not ( = ?auto_2708849 ?auto_2708857 ) ) ( not ( = ?auto_2708849 ?auto_2708858 ) ) ( not ( = ?auto_2708849 ?auto_2708859 ) ) ( not ( = ?auto_2708849 ?auto_2708860 ) ) ( not ( = ?auto_2708849 ?auto_2708861 ) ) ( not ( = ?auto_2708849 ?auto_2708863 ) ) ( not ( = ?auto_2708850 ?auto_2708851 ) ) ( not ( = ?auto_2708850 ?auto_2708852 ) ) ( not ( = ?auto_2708850 ?auto_2708853 ) ) ( not ( = ?auto_2708850 ?auto_2708854 ) ) ( not ( = ?auto_2708850 ?auto_2708855 ) ) ( not ( = ?auto_2708850 ?auto_2708856 ) ) ( not ( = ?auto_2708850 ?auto_2708857 ) ) ( not ( = ?auto_2708850 ?auto_2708858 ) ) ( not ( = ?auto_2708850 ?auto_2708859 ) ) ( not ( = ?auto_2708850 ?auto_2708860 ) ) ( not ( = ?auto_2708850 ?auto_2708861 ) ) ( not ( = ?auto_2708850 ?auto_2708863 ) ) ( not ( = ?auto_2708851 ?auto_2708852 ) ) ( not ( = ?auto_2708851 ?auto_2708853 ) ) ( not ( = ?auto_2708851 ?auto_2708854 ) ) ( not ( = ?auto_2708851 ?auto_2708855 ) ) ( not ( = ?auto_2708851 ?auto_2708856 ) ) ( not ( = ?auto_2708851 ?auto_2708857 ) ) ( not ( = ?auto_2708851 ?auto_2708858 ) ) ( not ( = ?auto_2708851 ?auto_2708859 ) ) ( not ( = ?auto_2708851 ?auto_2708860 ) ) ( not ( = ?auto_2708851 ?auto_2708861 ) ) ( not ( = ?auto_2708851 ?auto_2708863 ) ) ( not ( = ?auto_2708852 ?auto_2708853 ) ) ( not ( = ?auto_2708852 ?auto_2708854 ) ) ( not ( = ?auto_2708852 ?auto_2708855 ) ) ( not ( = ?auto_2708852 ?auto_2708856 ) ) ( not ( = ?auto_2708852 ?auto_2708857 ) ) ( not ( = ?auto_2708852 ?auto_2708858 ) ) ( not ( = ?auto_2708852 ?auto_2708859 ) ) ( not ( = ?auto_2708852 ?auto_2708860 ) ) ( not ( = ?auto_2708852 ?auto_2708861 ) ) ( not ( = ?auto_2708852 ?auto_2708863 ) ) ( not ( = ?auto_2708853 ?auto_2708854 ) ) ( not ( = ?auto_2708853 ?auto_2708855 ) ) ( not ( = ?auto_2708853 ?auto_2708856 ) ) ( not ( = ?auto_2708853 ?auto_2708857 ) ) ( not ( = ?auto_2708853 ?auto_2708858 ) ) ( not ( = ?auto_2708853 ?auto_2708859 ) ) ( not ( = ?auto_2708853 ?auto_2708860 ) ) ( not ( = ?auto_2708853 ?auto_2708861 ) ) ( not ( = ?auto_2708853 ?auto_2708863 ) ) ( not ( = ?auto_2708854 ?auto_2708855 ) ) ( not ( = ?auto_2708854 ?auto_2708856 ) ) ( not ( = ?auto_2708854 ?auto_2708857 ) ) ( not ( = ?auto_2708854 ?auto_2708858 ) ) ( not ( = ?auto_2708854 ?auto_2708859 ) ) ( not ( = ?auto_2708854 ?auto_2708860 ) ) ( not ( = ?auto_2708854 ?auto_2708861 ) ) ( not ( = ?auto_2708854 ?auto_2708863 ) ) ( not ( = ?auto_2708855 ?auto_2708856 ) ) ( not ( = ?auto_2708855 ?auto_2708857 ) ) ( not ( = ?auto_2708855 ?auto_2708858 ) ) ( not ( = ?auto_2708855 ?auto_2708859 ) ) ( not ( = ?auto_2708855 ?auto_2708860 ) ) ( not ( = ?auto_2708855 ?auto_2708861 ) ) ( not ( = ?auto_2708855 ?auto_2708863 ) ) ( not ( = ?auto_2708856 ?auto_2708857 ) ) ( not ( = ?auto_2708856 ?auto_2708858 ) ) ( not ( = ?auto_2708856 ?auto_2708859 ) ) ( not ( = ?auto_2708856 ?auto_2708860 ) ) ( not ( = ?auto_2708856 ?auto_2708861 ) ) ( not ( = ?auto_2708856 ?auto_2708863 ) ) ( not ( = ?auto_2708857 ?auto_2708858 ) ) ( not ( = ?auto_2708857 ?auto_2708859 ) ) ( not ( = ?auto_2708857 ?auto_2708860 ) ) ( not ( = ?auto_2708857 ?auto_2708861 ) ) ( not ( = ?auto_2708857 ?auto_2708863 ) ) ( not ( = ?auto_2708858 ?auto_2708859 ) ) ( not ( = ?auto_2708858 ?auto_2708860 ) ) ( not ( = ?auto_2708858 ?auto_2708861 ) ) ( not ( = ?auto_2708858 ?auto_2708863 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2708859 ?auto_2708860 ?auto_2708861 )
      ( MAKE-13CRATE-VERIFY ?auto_2708848 ?auto_2708849 ?auto_2708850 ?auto_2708851 ?auto_2708852 ?auto_2708853 ?auto_2708854 ?auto_2708855 ?auto_2708856 ?auto_2708857 ?auto_2708858 ?auto_2708859 ?auto_2708860 ?auto_2708861 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2708919 - SURFACE
      ?auto_2708920 - SURFACE
      ?auto_2708921 - SURFACE
      ?auto_2708922 - SURFACE
      ?auto_2708923 - SURFACE
      ?auto_2708924 - SURFACE
      ?auto_2708925 - SURFACE
    )
    :vars
    (
      ?auto_2708926 - HOIST
      ?auto_2708928 - PLACE
      ?auto_2708930 - PLACE
      ?auto_2708929 - HOIST
      ?auto_2708927 - SURFACE
      ?auto_2708931 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2708926 ?auto_2708928 ) ( IS-CRATE ?auto_2708925 ) ( not ( = ?auto_2708924 ?auto_2708925 ) ) ( not ( = ?auto_2708923 ?auto_2708924 ) ) ( not ( = ?auto_2708923 ?auto_2708925 ) ) ( not ( = ?auto_2708930 ?auto_2708928 ) ) ( HOIST-AT ?auto_2708929 ?auto_2708930 ) ( not ( = ?auto_2708926 ?auto_2708929 ) ) ( SURFACE-AT ?auto_2708925 ?auto_2708930 ) ( ON ?auto_2708925 ?auto_2708927 ) ( CLEAR ?auto_2708925 ) ( not ( = ?auto_2708924 ?auto_2708927 ) ) ( not ( = ?auto_2708925 ?auto_2708927 ) ) ( not ( = ?auto_2708923 ?auto_2708927 ) ) ( SURFACE-AT ?auto_2708923 ?auto_2708928 ) ( CLEAR ?auto_2708923 ) ( IS-CRATE ?auto_2708924 ) ( AVAILABLE ?auto_2708926 ) ( TRUCK-AT ?auto_2708931 ?auto_2708930 ) ( LIFTING ?auto_2708929 ?auto_2708924 ) ( ON ?auto_2708920 ?auto_2708919 ) ( ON ?auto_2708921 ?auto_2708920 ) ( ON ?auto_2708922 ?auto_2708921 ) ( ON ?auto_2708923 ?auto_2708922 ) ( not ( = ?auto_2708919 ?auto_2708920 ) ) ( not ( = ?auto_2708919 ?auto_2708921 ) ) ( not ( = ?auto_2708919 ?auto_2708922 ) ) ( not ( = ?auto_2708919 ?auto_2708923 ) ) ( not ( = ?auto_2708919 ?auto_2708924 ) ) ( not ( = ?auto_2708919 ?auto_2708925 ) ) ( not ( = ?auto_2708919 ?auto_2708927 ) ) ( not ( = ?auto_2708920 ?auto_2708921 ) ) ( not ( = ?auto_2708920 ?auto_2708922 ) ) ( not ( = ?auto_2708920 ?auto_2708923 ) ) ( not ( = ?auto_2708920 ?auto_2708924 ) ) ( not ( = ?auto_2708920 ?auto_2708925 ) ) ( not ( = ?auto_2708920 ?auto_2708927 ) ) ( not ( = ?auto_2708921 ?auto_2708922 ) ) ( not ( = ?auto_2708921 ?auto_2708923 ) ) ( not ( = ?auto_2708921 ?auto_2708924 ) ) ( not ( = ?auto_2708921 ?auto_2708925 ) ) ( not ( = ?auto_2708921 ?auto_2708927 ) ) ( not ( = ?auto_2708922 ?auto_2708923 ) ) ( not ( = ?auto_2708922 ?auto_2708924 ) ) ( not ( = ?auto_2708922 ?auto_2708925 ) ) ( not ( = ?auto_2708922 ?auto_2708927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2708923 ?auto_2708924 ?auto_2708925 )
      ( MAKE-6CRATE-VERIFY ?auto_2708919 ?auto_2708920 ?auto_2708921 ?auto_2708922 ?auto_2708923 ?auto_2708924 ?auto_2708925 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2708932 - SURFACE
      ?auto_2708933 - SURFACE
      ?auto_2708934 - SURFACE
      ?auto_2708935 - SURFACE
      ?auto_2708936 - SURFACE
      ?auto_2708937 - SURFACE
      ?auto_2708938 - SURFACE
      ?auto_2708939 - SURFACE
    )
    :vars
    (
      ?auto_2708940 - HOIST
      ?auto_2708942 - PLACE
      ?auto_2708944 - PLACE
      ?auto_2708943 - HOIST
      ?auto_2708941 - SURFACE
      ?auto_2708945 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2708940 ?auto_2708942 ) ( IS-CRATE ?auto_2708939 ) ( not ( = ?auto_2708938 ?auto_2708939 ) ) ( not ( = ?auto_2708937 ?auto_2708938 ) ) ( not ( = ?auto_2708937 ?auto_2708939 ) ) ( not ( = ?auto_2708944 ?auto_2708942 ) ) ( HOIST-AT ?auto_2708943 ?auto_2708944 ) ( not ( = ?auto_2708940 ?auto_2708943 ) ) ( SURFACE-AT ?auto_2708939 ?auto_2708944 ) ( ON ?auto_2708939 ?auto_2708941 ) ( CLEAR ?auto_2708939 ) ( not ( = ?auto_2708938 ?auto_2708941 ) ) ( not ( = ?auto_2708939 ?auto_2708941 ) ) ( not ( = ?auto_2708937 ?auto_2708941 ) ) ( SURFACE-AT ?auto_2708937 ?auto_2708942 ) ( CLEAR ?auto_2708937 ) ( IS-CRATE ?auto_2708938 ) ( AVAILABLE ?auto_2708940 ) ( TRUCK-AT ?auto_2708945 ?auto_2708944 ) ( LIFTING ?auto_2708943 ?auto_2708938 ) ( ON ?auto_2708933 ?auto_2708932 ) ( ON ?auto_2708934 ?auto_2708933 ) ( ON ?auto_2708935 ?auto_2708934 ) ( ON ?auto_2708936 ?auto_2708935 ) ( ON ?auto_2708937 ?auto_2708936 ) ( not ( = ?auto_2708932 ?auto_2708933 ) ) ( not ( = ?auto_2708932 ?auto_2708934 ) ) ( not ( = ?auto_2708932 ?auto_2708935 ) ) ( not ( = ?auto_2708932 ?auto_2708936 ) ) ( not ( = ?auto_2708932 ?auto_2708937 ) ) ( not ( = ?auto_2708932 ?auto_2708938 ) ) ( not ( = ?auto_2708932 ?auto_2708939 ) ) ( not ( = ?auto_2708932 ?auto_2708941 ) ) ( not ( = ?auto_2708933 ?auto_2708934 ) ) ( not ( = ?auto_2708933 ?auto_2708935 ) ) ( not ( = ?auto_2708933 ?auto_2708936 ) ) ( not ( = ?auto_2708933 ?auto_2708937 ) ) ( not ( = ?auto_2708933 ?auto_2708938 ) ) ( not ( = ?auto_2708933 ?auto_2708939 ) ) ( not ( = ?auto_2708933 ?auto_2708941 ) ) ( not ( = ?auto_2708934 ?auto_2708935 ) ) ( not ( = ?auto_2708934 ?auto_2708936 ) ) ( not ( = ?auto_2708934 ?auto_2708937 ) ) ( not ( = ?auto_2708934 ?auto_2708938 ) ) ( not ( = ?auto_2708934 ?auto_2708939 ) ) ( not ( = ?auto_2708934 ?auto_2708941 ) ) ( not ( = ?auto_2708935 ?auto_2708936 ) ) ( not ( = ?auto_2708935 ?auto_2708937 ) ) ( not ( = ?auto_2708935 ?auto_2708938 ) ) ( not ( = ?auto_2708935 ?auto_2708939 ) ) ( not ( = ?auto_2708935 ?auto_2708941 ) ) ( not ( = ?auto_2708936 ?auto_2708937 ) ) ( not ( = ?auto_2708936 ?auto_2708938 ) ) ( not ( = ?auto_2708936 ?auto_2708939 ) ) ( not ( = ?auto_2708936 ?auto_2708941 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2708937 ?auto_2708938 ?auto_2708939 )
      ( MAKE-7CRATE-VERIFY ?auto_2708932 ?auto_2708933 ?auto_2708934 ?auto_2708935 ?auto_2708936 ?auto_2708937 ?auto_2708938 ?auto_2708939 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2708946 - SURFACE
      ?auto_2708947 - SURFACE
      ?auto_2708948 - SURFACE
      ?auto_2708949 - SURFACE
      ?auto_2708950 - SURFACE
      ?auto_2708951 - SURFACE
      ?auto_2708952 - SURFACE
      ?auto_2708953 - SURFACE
      ?auto_2708954 - SURFACE
    )
    :vars
    (
      ?auto_2708955 - HOIST
      ?auto_2708957 - PLACE
      ?auto_2708959 - PLACE
      ?auto_2708958 - HOIST
      ?auto_2708956 - SURFACE
      ?auto_2708960 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2708955 ?auto_2708957 ) ( IS-CRATE ?auto_2708954 ) ( not ( = ?auto_2708953 ?auto_2708954 ) ) ( not ( = ?auto_2708952 ?auto_2708953 ) ) ( not ( = ?auto_2708952 ?auto_2708954 ) ) ( not ( = ?auto_2708959 ?auto_2708957 ) ) ( HOIST-AT ?auto_2708958 ?auto_2708959 ) ( not ( = ?auto_2708955 ?auto_2708958 ) ) ( SURFACE-AT ?auto_2708954 ?auto_2708959 ) ( ON ?auto_2708954 ?auto_2708956 ) ( CLEAR ?auto_2708954 ) ( not ( = ?auto_2708953 ?auto_2708956 ) ) ( not ( = ?auto_2708954 ?auto_2708956 ) ) ( not ( = ?auto_2708952 ?auto_2708956 ) ) ( SURFACE-AT ?auto_2708952 ?auto_2708957 ) ( CLEAR ?auto_2708952 ) ( IS-CRATE ?auto_2708953 ) ( AVAILABLE ?auto_2708955 ) ( TRUCK-AT ?auto_2708960 ?auto_2708959 ) ( LIFTING ?auto_2708958 ?auto_2708953 ) ( ON ?auto_2708947 ?auto_2708946 ) ( ON ?auto_2708948 ?auto_2708947 ) ( ON ?auto_2708949 ?auto_2708948 ) ( ON ?auto_2708950 ?auto_2708949 ) ( ON ?auto_2708951 ?auto_2708950 ) ( ON ?auto_2708952 ?auto_2708951 ) ( not ( = ?auto_2708946 ?auto_2708947 ) ) ( not ( = ?auto_2708946 ?auto_2708948 ) ) ( not ( = ?auto_2708946 ?auto_2708949 ) ) ( not ( = ?auto_2708946 ?auto_2708950 ) ) ( not ( = ?auto_2708946 ?auto_2708951 ) ) ( not ( = ?auto_2708946 ?auto_2708952 ) ) ( not ( = ?auto_2708946 ?auto_2708953 ) ) ( not ( = ?auto_2708946 ?auto_2708954 ) ) ( not ( = ?auto_2708946 ?auto_2708956 ) ) ( not ( = ?auto_2708947 ?auto_2708948 ) ) ( not ( = ?auto_2708947 ?auto_2708949 ) ) ( not ( = ?auto_2708947 ?auto_2708950 ) ) ( not ( = ?auto_2708947 ?auto_2708951 ) ) ( not ( = ?auto_2708947 ?auto_2708952 ) ) ( not ( = ?auto_2708947 ?auto_2708953 ) ) ( not ( = ?auto_2708947 ?auto_2708954 ) ) ( not ( = ?auto_2708947 ?auto_2708956 ) ) ( not ( = ?auto_2708948 ?auto_2708949 ) ) ( not ( = ?auto_2708948 ?auto_2708950 ) ) ( not ( = ?auto_2708948 ?auto_2708951 ) ) ( not ( = ?auto_2708948 ?auto_2708952 ) ) ( not ( = ?auto_2708948 ?auto_2708953 ) ) ( not ( = ?auto_2708948 ?auto_2708954 ) ) ( not ( = ?auto_2708948 ?auto_2708956 ) ) ( not ( = ?auto_2708949 ?auto_2708950 ) ) ( not ( = ?auto_2708949 ?auto_2708951 ) ) ( not ( = ?auto_2708949 ?auto_2708952 ) ) ( not ( = ?auto_2708949 ?auto_2708953 ) ) ( not ( = ?auto_2708949 ?auto_2708954 ) ) ( not ( = ?auto_2708949 ?auto_2708956 ) ) ( not ( = ?auto_2708950 ?auto_2708951 ) ) ( not ( = ?auto_2708950 ?auto_2708952 ) ) ( not ( = ?auto_2708950 ?auto_2708953 ) ) ( not ( = ?auto_2708950 ?auto_2708954 ) ) ( not ( = ?auto_2708950 ?auto_2708956 ) ) ( not ( = ?auto_2708951 ?auto_2708952 ) ) ( not ( = ?auto_2708951 ?auto_2708953 ) ) ( not ( = ?auto_2708951 ?auto_2708954 ) ) ( not ( = ?auto_2708951 ?auto_2708956 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2708952 ?auto_2708953 ?auto_2708954 )
      ( MAKE-8CRATE-VERIFY ?auto_2708946 ?auto_2708947 ?auto_2708948 ?auto_2708949 ?auto_2708950 ?auto_2708951 ?auto_2708952 ?auto_2708953 ?auto_2708954 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2708961 - SURFACE
      ?auto_2708962 - SURFACE
      ?auto_2708963 - SURFACE
      ?auto_2708964 - SURFACE
      ?auto_2708965 - SURFACE
      ?auto_2708966 - SURFACE
      ?auto_2708967 - SURFACE
      ?auto_2708968 - SURFACE
      ?auto_2708969 - SURFACE
      ?auto_2708970 - SURFACE
    )
    :vars
    (
      ?auto_2708971 - HOIST
      ?auto_2708973 - PLACE
      ?auto_2708975 - PLACE
      ?auto_2708974 - HOIST
      ?auto_2708972 - SURFACE
      ?auto_2708976 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2708971 ?auto_2708973 ) ( IS-CRATE ?auto_2708970 ) ( not ( = ?auto_2708969 ?auto_2708970 ) ) ( not ( = ?auto_2708968 ?auto_2708969 ) ) ( not ( = ?auto_2708968 ?auto_2708970 ) ) ( not ( = ?auto_2708975 ?auto_2708973 ) ) ( HOIST-AT ?auto_2708974 ?auto_2708975 ) ( not ( = ?auto_2708971 ?auto_2708974 ) ) ( SURFACE-AT ?auto_2708970 ?auto_2708975 ) ( ON ?auto_2708970 ?auto_2708972 ) ( CLEAR ?auto_2708970 ) ( not ( = ?auto_2708969 ?auto_2708972 ) ) ( not ( = ?auto_2708970 ?auto_2708972 ) ) ( not ( = ?auto_2708968 ?auto_2708972 ) ) ( SURFACE-AT ?auto_2708968 ?auto_2708973 ) ( CLEAR ?auto_2708968 ) ( IS-CRATE ?auto_2708969 ) ( AVAILABLE ?auto_2708971 ) ( TRUCK-AT ?auto_2708976 ?auto_2708975 ) ( LIFTING ?auto_2708974 ?auto_2708969 ) ( ON ?auto_2708962 ?auto_2708961 ) ( ON ?auto_2708963 ?auto_2708962 ) ( ON ?auto_2708964 ?auto_2708963 ) ( ON ?auto_2708965 ?auto_2708964 ) ( ON ?auto_2708966 ?auto_2708965 ) ( ON ?auto_2708967 ?auto_2708966 ) ( ON ?auto_2708968 ?auto_2708967 ) ( not ( = ?auto_2708961 ?auto_2708962 ) ) ( not ( = ?auto_2708961 ?auto_2708963 ) ) ( not ( = ?auto_2708961 ?auto_2708964 ) ) ( not ( = ?auto_2708961 ?auto_2708965 ) ) ( not ( = ?auto_2708961 ?auto_2708966 ) ) ( not ( = ?auto_2708961 ?auto_2708967 ) ) ( not ( = ?auto_2708961 ?auto_2708968 ) ) ( not ( = ?auto_2708961 ?auto_2708969 ) ) ( not ( = ?auto_2708961 ?auto_2708970 ) ) ( not ( = ?auto_2708961 ?auto_2708972 ) ) ( not ( = ?auto_2708962 ?auto_2708963 ) ) ( not ( = ?auto_2708962 ?auto_2708964 ) ) ( not ( = ?auto_2708962 ?auto_2708965 ) ) ( not ( = ?auto_2708962 ?auto_2708966 ) ) ( not ( = ?auto_2708962 ?auto_2708967 ) ) ( not ( = ?auto_2708962 ?auto_2708968 ) ) ( not ( = ?auto_2708962 ?auto_2708969 ) ) ( not ( = ?auto_2708962 ?auto_2708970 ) ) ( not ( = ?auto_2708962 ?auto_2708972 ) ) ( not ( = ?auto_2708963 ?auto_2708964 ) ) ( not ( = ?auto_2708963 ?auto_2708965 ) ) ( not ( = ?auto_2708963 ?auto_2708966 ) ) ( not ( = ?auto_2708963 ?auto_2708967 ) ) ( not ( = ?auto_2708963 ?auto_2708968 ) ) ( not ( = ?auto_2708963 ?auto_2708969 ) ) ( not ( = ?auto_2708963 ?auto_2708970 ) ) ( not ( = ?auto_2708963 ?auto_2708972 ) ) ( not ( = ?auto_2708964 ?auto_2708965 ) ) ( not ( = ?auto_2708964 ?auto_2708966 ) ) ( not ( = ?auto_2708964 ?auto_2708967 ) ) ( not ( = ?auto_2708964 ?auto_2708968 ) ) ( not ( = ?auto_2708964 ?auto_2708969 ) ) ( not ( = ?auto_2708964 ?auto_2708970 ) ) ( not ( = ?auto_2708964 ?auto_2708972 ) ) ( not ( = ?auto_2708965 ?auto_2708966 ) ) ( not ( = ?auto_2708965 ?auto_2708967 ) ) ( not ( = ?auto_2708965 ?auto_2708968 ) ) ( not ( = ?auto_2708965 ?auto_2708969 ) ) ( not ( = ?auto_2708965 ?auto_2708970 ) ) ( not ( = ?auto_2708965 ?auto_2708972 ) ) ( not ( = ?auto_2708966 ?auto_2708967 ) ) ( not ( = ?auto_2708966 ?auto_2708968 ) ) ( not ( = ?auto_2708966 ?auto_2708969 ) ) ( not ( = ?auto_2708966 ?auto_2708970 ) ) ( not ( = ?auto_2708966 ?auto_2708972 ) ) ( not ( = ?auto_2708967 ?auto_2708968 ) ) ( not ( = ?auto_2708967 ?auto_2708969 ) ) ( not ( = ?auto_2708967 ?auto_2708970 ) ) ( not ( = ?auto_2708967 ?auto_2708972 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2708968 ?auto_2708969 ?auto_2708970 )
      ( MAKE-9CRATE-VERIFY ?auto_2708961 ?auto_2708962 ?auto_2708963 ?auto_2708964 ?auto_2708965 ?auto_2708966 ?auto_2708967 ?auto_2708968 ?auto_2708969 ?auto_2708970 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2708977 - SURFACE
      ?auto_2708978 - SURFACE
      ?auto_2708979 - SURFACE
      ?auto_2708980 - SURFACE
      ?auto_2708981 - SURFACE
      ?auto_2708982 - SURFACE
      ?auto_2708983 - SURFACE
      ?auto_2708984 - SURFACE
      ?auto_2708985 - SURFACE
      ?auto_2708986 - SURFACE
      ?auto_2708987 - SURFACE
    )
    :vars
    (
      ?auto_2708988 - HOIST
      ?auto_2708990 - PLACE
      ?auto_2708992 - PLACE
      ?auto_2708991 - HOIST
      ?auto_2708989 - SURFACE
      ?auto_2708993 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2708988 ?auto_2708990 ) ( IS-CRATE ?auto_2708987 ) ( not ( = ?auto_2708986 ?auto_2708987 ) ) ( not ( = ?auto_2708985 ?auto_2708986 ) ) ( not ( = ?auto_2708985 ?auto_2708987 ) ) ( not ( = ?auto_2708992 ?auto_2708990 ) ) ( HOIST-AT ?auto_2708991 ?auto_2708992 ) ( not ( = ?auto_2708988 ?auto_2708991 ) ) ( SURFACE-AT ?auto_2708987 ?auto_2708992 ) ( ON ?auto_2708987 ?auto_2708989 ) ( CLEAR ?auto_2708987 ) ( not ( = ?auto_2708986 ?auto_2708989 ) ) ( not ( = ?auto_2708987 ?auto_2708989 ) ) ( not ( = ?auto_2708985 ?auto_2708989 ) ) ( SURFACE-AT ?auto_2708985 ?auto_2708990 ) ( CLEAR ?auto_2708985 ) ( IS-CRATE ?auto_2708986 ) ( AVAILABLE ?auto_2708988 ) ( TRUCK-AT ?auto_2708993 ?auto_2708992 ) ( LIFTING ?auto_2708991 ?auto_2708986 ) ( ON ?auto_2708978 ?auto_2708977 ) ( ON ?auto_2708979 ?auto_2708978 ) ( ON ?auto_2708980 ?auto_2708979 ) ( ON ?auto_2708981 ?auto_2708980 ) ( ON ?auto_2708982 ?auto_2708981 ) ( ON ?auto_2708983 ?auto_2708982 ) ( ON ?auto_2708984 ?auto_2708983 ) ( ON ?auto_2708985 ?auto_2708984 ) ( not ( = ?auto_2708977 ?auto_2708978 ) ) ( not ( = ?auto_2708977 ?auto_2708979 ) ) ( not ( = ?auto_2708977 ?auto_2708980 ) ) ( not ( = ?auto_2708977 ?auto_2708981 ) ) ( not ( = ?auto_2708977 ?auto_2708982 ) ) ( not ( = ?auto_2708977 ?auto_2708983 ) ) ( not ( = ?auto_2708977 ?auto_2708984 ) ) ( not ( = ?auto_2708977 ?auto_2708985 ) ) ( not ( = ?auto_2708977 ?auto_2708986 ) ) ( not ( = ?auto_2708977 ?auto_2708987 ) ) ( not ( = ?auto_2708977 ?auto_2708989 ) ) ( not ( = ?auto_2708978 ?auto_2708979 ) ) ( not ( = ?auto_2708978 ?auto_2708980 ) ) ( not ( = ?auto_2708978 ?auto_2708981 ) ) ( not ( = ?auto_2708978 ?auto_2708982 ) ) ( not ( = ?auto_2708978 ?auto_2708983 ) ) ( not ( = ?auto_2708978 ?auto_2708984 ) ) ( not ( = ?auto_2708978 ?auto_2708985 ) ) ( not ( = ?auto_2708978 ?auto_2708986 ) ) ( not ( = ?auto_2708978 ?auto_2708987 ) ) ( not ( = ?auto_2708978 ?auto_2708989 ) ) ( not ( = ?auto_2708979 ?auto_2708980 ) ) ( not ( = ?auto_2708979 ?auto_2708981 ) ) ( not ( = ?auto_2708979 ?auto_2708982 ) ) ( not ( = ?auto_2708979 ?auto_2708983 ) ) ( not ( = ?auto_2708979 ?auto_2708984 ) ) ( not ( = ?auto_2708979 ?auto_2708985 ) ) ( not ( = ?auto_2708979 ?auto_2708986 ) ) ( not ( = ?auto_2708979 ?auto_2708987 ) ) ( not ( = ?auto_2708979 ?auto_2708989 ) ) ( not ( = ?auto_2708980 ?auto_2708981 ) ) ( not ( = ?auto_2708980 ?auto_2708982 ) ) ( not ( = ?auto_2708980 ?auto_2708983 ) ) ( not ( = ?auto_2708980 ?auto_2708984 ) ) ( not ( = ?auto_2708980 ?auto_2708985 ) ) ( not ( = ?auto_2708980 ?auto_2708986 ) ) ( not ( = ?auto_2708980 ?auto_2708987 ) ) ( not ( = ?auto_2708980 ?auto_2708989 ) ) ( not ( = ?auto_2708981 ?auto_2708982 ) ) ( not ( = ?auto_2708981 ?auto_2708983 ) ) ( not ( = ?auto_2708981 ?auto_2708984 ) ) ( not ( = ?auto_2708981 ?auto_2708985 ) ) ( not ( = ?auto_2708981 ?auto_2708986 ) ) ( not ( = ?auto_2708981 ?auto_2708987 ) ) ( not ( = ?auto_2708981 ?auto_2708989 ) ) ( not ( = ?auto_2708982 ?auto_2708983 ) ) ( not ( = ?auto_2708982 ?auto_2708984 ) ) ( not ( = ?auto_2708982 ?auto_2708985 ) ) ( not ( = ?auto_2708982 ?auto_2708986 ) ) ( not ( = ?auto_2708982 ?auto_2708987 ) ) ( not ( = ?auto_2708982 ?auto_2708989 ) ) ( not ( = ?auto_2708983 ?auto_2708984 ) ) ( not ( = ?auto_2708983 ?auto_2708985 ) ) ( not ( = ?auto_2708983 ?auto_2708986 ) ) ( not ( = ?auto_2708983 ?auto_2708987 ) ) ( not ( = ?auto_2708983 ?auto_2708989 ) ) ( not ( = ?auto_2708984 ?auto_2708985 ) ) ( not ( = ?auto_2708984 ?auto_2708986 ) ) ( not ( = ?auto_2708984 ?auto_2708987 ) ) ( not ( = ?auto_2708984 ?auto_2708989 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2708985 ?auto_2708986 ?auto_2708987 )
      ( MAKE-10CRATE-VERIFY ?auto_2708977 ?auto_2708978 ?auto_2708979 ?auto_2708980 ?auto_2708981 ?auto_2708982 ?auto_2708983 ?auto_2708984 ?auto_2708985 ?auto_2708986 ?auto_2708987 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2708994 - SURFACE
      ?auto_2708995 - SURFACE
      ?auto_2708996 - SURFACE
      ?auto_2708997 - SURFACE
      ?auto_2708998 - SURFACE
      ?auto_2708999 - SURFACE
      ?auto_2709000 - SURFACE
      ?auto_2709001 - SURFACE
      ?auto_2709002 - SURFACE
      ?auto_2709003 - SURFACE
      ?auto_2709004 - SURFACE
      ?auto_2709005 - SURFACE
    )
    :vars
    (
      ?auto_2709006 - HOIST
      ?auto_2709008 - PLACE
      ?auto_2709010 - PLACE
      ?auto_2709009 - HOIST
      ?auto_2709007 - SURFACE
      ?auto_2709011 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709006 ?auto_2709008 ) ( IS-CRATE ?auto_2709005 ) ( not ( = ?auto_2709004 ?auto_2709005 ) ) ( not ( = ?auto_2709003 ?auto_2709004 ) ) ( not ( = ?auto_2709003 ?auto_2709005 ) ) ( not ( = ?auto_2709010 ?auto_2709008 ) ) ( HOIST-AT ?auto_2709009 ?auto_2709010 ) ( not ( = ?auto_2709006 ?auto_2709009 ) ) ( SURFACE-AT ?auto_2709005 ?auto_2709010 ) ( ON ?auto_2709005 ?auto_2709007 ) ( CLEAR ?auto_2709005 ) ( not ( = ?auto_2709004 ?auto_2709007 ) ) ( not ( = ?auto_2709005 ?auto_2709007 ) ) ( not ( = ?auto_2709003 ?auto_2709007 ) ) ( SURFACE-AT ?auto_2709003 ?auto_2709008 ) ( CLEAR ?auto_2709003 ) ( IS-CRATE ?auto_2709004 ) ( AVAILABLE ?auto_2709006 ) ( TRUCK-AT ?auto_2709011 ?auto_2709010 ) ( LIFTING ?auto_2709009 ?auto_2709004 ) ( ON ?auto_2708995 ?auto_2708994 ) ( ON ?auto_2708996 ?auto_2708995 ) ( ON ?auto_2708997 ?auto_2708996 ) ( ON ?auto_2708998 ?auto_2708997 ) ( ON ?auto_2708999 ?auto_2708998 ) ( ON ?auto_2709000 ?auto_2708999 ) ( ON ?auto_2709001 ?auto_2709000 ) ( ON ?auto_2709002 ?auto_2709001 ) ( ON ?auto_2709003 ?auto_2709002 ) ( not ( = ?auto_2708994 ?auto_2708995 ) ) ( not ( = ?auto_2708994 ?auto_2708996 ) ) ( not ( = ?auto_2708994 ?auto_2708997 ) ) ( not ( = ?auto_2708994 ?auto_2708998 ) ) ( not ( = ?auto_2708994 ?auto_2708999 ) ) ( not ( = ?auto_2708994 ?auto_2709000 ) ) ( not ( = ?auto_2708994 ?auto_2709001 ) ) ( not ( = ?auto_2708994 ?auto_2709002 ) ) ( not ( = ?auto_2708994 ?auto_2709003 ) ) ( not ( = ?auto_2708994 ?auto_2709004 ) ) ( not ( = ?auto_2708994 ?auto_2709005 ) ) ( not ( = ?auto_2708994 ?auto_2709007 ) ) ( not ( = ?auto_2708995 ?auto_2708996 ) ) ( not ( = ?auto_2708995 ?auto_2708997 ) ) ( not ( = ?auto_2708995 ?auto_2708998 ) ) ( not ( = ?auto_2708995 ?auto_2708999 ) ) ( not ( = ?auto_2708995 ?auto_2709000 ) ) ( not ( = ?auto_2708995 ?auto_2709001 ) ) ( not ( = ?auto_2708995 ?auto_2709002 ) ) ( not ( = ?auto_2708995 ?auto_2709003 ) ) ( not ( = ?auto_2708995 ?auto_2709004 ) ) ( not ( = ?auto_2708995 ?auto_2709005 ) ) ( not ( = ?auto_2708995 ?auto_2709007 ) ) ( not ( = ?auto_2708996 ?auto_2708997 ) ) ( not ( = ?auto_2708996 ?auto_2708998 ) ) ( not ( = ?auto_2708996 ?auto_2708999 ) ) ( not ( = ?auto_2708996 ?auto_2709000 ) ) ( not ( = ?auto_2708996 ?auto_2709001 ) ) ( not ( = ?auto_2708996 ?auto_2709002 ) ) ( not ( = ?auto_2708996 ?auto_2709003 ) ) ( not ( = ?auto_2708996 ?auto_2709004 ) ) ( not ( = ?auto_2708996 ?auto_2709005 ) ) ( not ( = ?auto_2708996 ?auto_2709007 ) ) ( not ( = ?auto_2708997 ?auto_2708998 ) ) ( not ( = ?auto_2708997 ?auto_2708999 ) ) ( not ( = ?auto_2708997 ?auto_2709000 ) ) ( not ( = ?auto_2708997 ?auto_2709001 ) ) ( not ( = ?auto_2708997 ?auto_2709002 ) ) ( not ( = ?auto_2708997 ?auto_2709003 ) ) ( not ( = ?auto_2708997 ?auto_2709004 ) ) ( not ( = ?auto_2708997 ?auto_2709005 ) ) ( not ( = ?auto_2708997 ?auto_2709007 ) ) ( not ( = ?auto_2708998 ?auto_2708999 ) ) ( not ( = ?auto_2708998 ?auto_2709000 ) ) ( not ( = ?auto_2708998 ?auto_2709001 ) ) ( not ( = ?auto_2708998 ?auto_2709002 ) ) ( not ( = ?auto_2708998 ?auto_2709003 ) ) ( not ( = ?auto_2708998 ?auto_2709004 ) ) ( not ( = ?auto_2708998 ?auto_2709005 ) ) ( not ( = ?auto_2708998 ?auto_2709007 ) ) ( not ( = ?auto_2708999 ?auto_2709000 ) ) ( not ( = ?auto_2708999 ?auto_2709001 ) ) ( not ( = ?auto_2708999 ?auto_2709002 ) ) ( not ( = ?auto_2708999 ?auto_2709003 ) ) ( not ( = ?auto_2708999 ?auto_2709004 ) ) ( not ( = ?auto_2708999 ?auto_2709005 ) ) ( not ( = ?auto_2708999 ?auto_2709007 ) ) ( not ( = ?auto_2709000 ?auto_2709001 ) ) ( not ( = ?auto_2709000 ?auto_2709002 ) ) ( not ( = ?auto_2709000 ?auto_2709003 ) ) ( not ( = ?auto_2709000 ?auto_2709004 ) ) ( not ( = ?auto_2709000 ?auto_2709005 ) ) ( not ( = ?auto_2709000 ?auto_2709007 ) ) ( not ( = ?auto_2709001 ?auto_2709002 ) ) ( not ( = ?auto_2709001 ?auto_2709003 ) ) ( not ( = ?auto_2709001 ?auto_2709004 ) ) ( not ( = ?auto_2709001 ?auto_2709005 ) ) ( not ( = ?auto_2709001 ?auto_2709007 ) ) ( not ( = ?auto_2709002 ?auto_2709003 ) ) ( not ( = ?auto_2709002 ?auto_2709004 ) ) ( not ( = ?auto_2709002 ?auto_2709005 ) ) ( not ( = ?auto_2709002 ?auto_2709007 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2709003 ?auto_2709004 ?auto_2709005 )
      ( MAKE-11CRATE-VERIFY ?auto_2708994 ?auto_2708995 ?auto_2708996 ?auto_2708997 ?auto_2708998 ?auto_2708999 ?auto_2709000 ?auto_2709001 ?auto_2709002 ?auto_2709003 ?auto_2709004 ?auto_2709005 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2709012 - SURFACE
      ?auto_2709013 - SURFACE
      ?auto_2709014 - SURFACE
      ?auto_2709015 - SURFACE
      ?auto_2709016 - SURFACE
      ?auto_2709017 - SURFACE
      ?auto_2709018 - SURFACE
      ?auto_2709019 - SURFACE
      ?auto_2709020 - SURFACE
      ?auto_2709021 - SURFACE
      ?auto_2709022 - SURFACE
      ?auto_2709023 - SURFACE
      ?auto_2709024 - SURFACE
    )
    :vars
    (
      ?auto_2709025 - HOIST
      ?auto_2709027 - PLACE
      ?auto_2709029 - PLACE
      ?auto_2709028 - HOIST
      ?auto_2709026 - SURFACE
      ?auto_2709030 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709025 ?auto_2709027 ) ( IS-CRATE ?auto_2709024 ) ( not ( = ?auto_2709023 ?auto_2709024 ) ) ( not ( = ?auto_2709022 ?auto_2709023 ) ) ( not ( = ?auto_2709022 ?auto_2709024 ) ) ( not ( = ?auto_2709029 ?auto_2709027 ) ) ( HOIST-AT ?auto_2709028 ?auto_2709029 ) ( not ( = ?auto_2709025 ?auto_2709028 ) ) ( SURFACE-AT ?auto_2709024 ?auto_2709029 ) ( ON ?auto_2709024 ?auto_2709026 ) ( CLEAR ?auto_2709024 ) ( not ( = ?auto_2709023 ?auto_2709026 ) ) ( not ( = ?auto_2709024 ?auto_2709026 ) ) ( not ( = ?auto_2709022 ?auto_2709026 ) ) ( SURFACE-AT ?auto_2709022 ?auto_2709027 ) ( CLEAR ?auto_2709022 ) ( IS-CRATE ?auto_2709023 ) ( AVAILABLE ?auto_2709025 ) ( TRUCK-AT ?auto_2709030 ?auto_2709029 ) ( LIFTING ?auto_2709028 ?auto_2709023 ) ( ON ?auto_2709013 ?auto_2709012 ) ( ON ?auto_2709014 ?auto_2709013 ) ( ON ?auto_2709015 ?auto_2709014 ) ( ON ?auto_2709016 ?auto_2709015 ) ( ON ?auto_2709017 ?auto_2709016 ) ( ON ?auto_2709018 ?auto_2709017 ) ( ON ?auto_2709019 ?auto_2709018 ) ( ON ?auto_2709020 ?auto_2709019 ) ( ON ?auto_2709021 ?auto_2709020 ) ( ON ?auto_2709022 ?auto_2709021 ) ( not ( = ?auto_2709012 ?auto_2709013 ) ) ( not ( = ?auto_2709012 ?auto_2709014 ) ) ( not ( = ?auto_2709012 ?auto_2709015 ) ) ( not ( = ?auto_2709012 ?auto_2709016 ) ) ( not ( = ?auto_2709012 ?auto_2709017 ) ) ( not ( = ?auto_2709012 ?auto_2709018 ) ) ( not ( = ?auto_2709012 ?auto_2709019 ) ) ( not ( = ?auto_2709012 ?auto_2709020 ) ) ( not ( = ?auto_2709012 ?auto_2709021 ) ) ( not ( = ?auto_2709012 ?auto_2709022 ) ) ( not ( = ?auto_2709012 ?auto_2709023 ) ) ( not ( = ?auto_2709012 ?auto_2709024 ) ) ( not ( = ?auto_2709012 ?auto_2709026 ) ) ( not ( = ?auto_2709013 ?auto_2709014 ) ) ( not ( = ?auto_2709013 ?auto_2709015 ) ) ( not ( = ?auto_2709013 ?auto_2709016 ) ) ( not ( = ?auto_2709013 ?auto_2709017 ) ) ( not ( = ?auto_2709013 ?auto_2709018 ) ) ( not ( = ?auto_2709013 ?auto_2709019 ) ) ( not ( = ?auto_2709013 ?auto_2709020 ) ) ( not ( = ?auto_2709013 ?auto_2709021 ) ) ( not ( = ?auto_2709013 ?auto_2709022 ) ) ( not ( = ?auto_2709013 ?auto_2709023 ) ) ( not ( = ?auto_2709013 ?auto_2709024 ) ) ( not ( = ?auto_2709013 ?auto_2709026 ) ) ( not ( = ?auto_2709014 ?auto_2709015 ) ) ( not ( = ?auto_2709014 ?auto_2709016 ) ) ( not ( = ?auto_2709014 ?auto_2709017 ) ) ( not ( = ?auto_2709014 ?auto_2709018 ) ) ( not ( = ?auto_2709014 ?auto_2709019 ) ) ( not ( = ?auto_2709014 ?auto_2709020 ) ) ( not ( = ?auto_2709014 ?auto_2709021 ) ) ( not ( = ?auto_2709014 ?auto_2709022 ) ) ( not ( = ?auto_2709014 ?auto_2709023 ) ) ( not ( = ?auto_2709014 ?auto_2709024 ) ) ( not ( = ?auto_2709014 ?auto_2709026 ) ) ( not ( = ?auto_2709015 ?auto_2709016 ) ) ( not ( = ?auto_2709015 ?auto_2709017 ) ) ( not ( = ?auto_2709015 ?auto_2709018 ) ) ( not ( = ?auto_2709015 ?auto_2709019 ) ) ( not ( = ?auto_2709015 ?auto_2709020 ) ) ( not ( = ?auto_2709015 ?auto_2709021 ) ) ( not ( = ?auto_2709015 ?auto_2709022 ) ) ( not ( = ?auto_2709015 ?auto_2709023 ) ) ( not ( = ?auto_2709015 ?auto_2709024 ) ) ( not ( = ?auto_2709015 ?auto_2709026 ) ) ( not ( = ?auto_2709016 ?auto_2709017 ) ) ( not ( = ?auto_2709016 ?auto_2709018 ) ) ( not ( = ?auto_2709016 ?auto_2709019 ) ) ( not ( = ?auto_2709016 ?auto_2709020 ) ) ( not ( = ?auto_2709016 ?auto_2709021 ) ) ( not ( = ?auto_2709016 ?auto_2709022 ) ) ( not ( = ?auto_2709016 ?auto_2709023 ) ) ( not ( = ?auto_2709016 ?auto_2709024 ) ) ( not ( = ?auto_2709016 ?auto_2709026 ) ) ( not ( = ?auto_2709017 ?auto_2709018 ) ) ( not ( = ?auto_2709017 ?auto_2709019 ) ) ( not ( = ?auto_2709017 ?auto_2709020 ) ) ( not ( = ?auto_2709017 ?auto_2709021 ) ) ( not ( = ?auto_2709017 ?auto_2709022 ) ) ( not ( = ?auto_2709017 ?auto_2709023 ) ) ( not ( = ?auto_2709017 ?auto_2709024 ) ) ( not ( = ?auto_2709017 ?auto_2709026 ) ) ( not ( = ?auto_2709018 ?auto_2709019 ) ) ( not ( = ?auto_2709018 ?auto_2709020 ) ) ( not ( = ?auto_2709018 ?auto_2709021 ) ) ( not ( = ?auto_2709018 ?auto_2709022 ) ) ( not ( = ?auto_2709018 ?auto_2709023 ) ) ( not ( = ?auto_2709018 ?auto_2709024 ) ) ( not ( = ?auto_2709018 ?auto_2709026 ) ) ( not ( = ?auto_2709019 ?auto_2709020 ) ) ( not ( = ?auto_2709019 ?auto_2709021 ) ) ( not ( = ?auto_2709019 ?auto_2709022 ) ) ( not ( = ?auto_2709019 ?auto_2709023 ) ) ( not ( = ?auto_2709019 ?auto_2709024 ) ) ( not ( = ?auto_2709019 ?auto_2709026 ) ) ( not ( = ?auto_2709020 ?auto_2709021 ) ) ( not ( = ?auto_2709020 ?auto_2709022 ) ) ( not ( = ?auto_2709020 ?auto_2709023 ) ) ( not ( = ?auto_2709020 ?auto_2709024 ) ) ( not ( = ?auto_2709020 ?auto_2709026 ) ) ( not ( = ?auto_2709021 ?auto_2709022 ) ) ( not ( = ?auto_2709021 ?auto_2709023 ) ) ( not ( = ?auto_2709021 ?auto_2709024 ) ) ( not ( = ?auto_2709021 ?auto_2709026 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2709022 ?auto_2709023 ?auto_2709024 )
      ( MAKE-12CRATE-VERIFY ?auto_2709012 ?auto_2709013 ?auto_2709014 ?auto_2709015 ?auto_2709016 ?auto_2709017 ?auto_2709018 ?auto_2709019 ?auto_2709020 ?auto_2709021 ?auto_2709022 ?auto_2709023 ?auto_2709024 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2709031 - SURFACE
      ?auto_2709032 - SURFACE
      ?auto_2709033 - SURFACE
      ?auto_2709034 - SURFACE
      ?auto_2709035 - SURFACE
      ?auto_2709036 - SURFACE
      ?auto_2709037 - SURFACE
      ?auto_2709038 - SURFACE
      ?auto_2709039 - SURFACE
      ?auto_2709040 - SURFACE
      ?auto_2709041 - SURFACE
      ?auto_2709042 - SURFACE
      ?auto_2709043 - SURFACE
      ?auto_2709044 - SURFACE
    )
    :vars
    (
      ?auto_2709045 - HOIST
      ?auto_2709047 - PLACE
      ?auto_2709049 - PLACE
      ?auto_2709048 - HOIST
      ?auto_2709046 - SURFACE
      ?auto_2709050 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709045 ?auto_2709047 ) ( IS-CRATE ?auto_2709044 ) ( not ( = ?auto_2709043 ?auto_2709044 ) ) ( not ( = ?auto_2709042 ?auto_2709043 ) ) ( not ( = ?auto_2709042 ?auto_2709044 ) ) ( not ( = ?auto_2709049 ?auto_2709047 ) ) ( HOIST-AT ?auto_2709048 ?auto_2709049 ) ( not ( = ?auto_2709045 ?auto_2709048 ) ) ( SURFACE-AT ?auto_2709044 ?auto_2709049 ) ( ON ?auto_2709044 ?auto_2709046 ) ( CLEAR ?auto_2709044 ) ( not ( = ?auto_2709043 ?auto_2709046 ) ) ( not ( = ?auto_2709044 ?auto_2709046 ) ) ( not ( = ?auto_2709042 ?auto_2709046 ) ) ( SURFACE-AT ?auto_2709042 ?auto_2709047 ) ( CLEAR ?auto_2709042 ) ( IS-CRATE ?auto_2709043 ) ( AVAILABLE ?auto_2709045 ) ( TRUCK-AT ?auto_2709050 ?auto_2709049 ) ( LIFTING ?auto_2709048 ?auto_2709043 ) ( ON ?auto_2709032 ?auto_2709031 ) ( ON ?auto_2709033 ?auto_2709032 ) ( ON ?auto_2709034 ?auto_2709033 ) ( ON ?auto_2709035 ?auto_2709034 ) ( ON ?auto_2709036 ?auto_2709035 ) ( ON ?auto_2709037 ?auto_2709036 ) ( ON ?auto_2709038 ?auto_2709037 ) ( ON ?auto_2709039 ?auto_2709038 ) ( ON ?auto_2709040 ?auto_2709039 ) ( ON ?auto_2709041 ?auto_2709040 ) ( ON ?auto_2709042 ?auto_2709041 ) ( not ( = ?auto_2709031 ?auto_2709032 ) ) ( not ( = ?auto_2709031 ?auto_2709033 ) ) ( not ( = ?auto_2709031 ?auto_2709034 ) ) ( not ( = ?auto_2709031 ?auto_2709035 ) ) ( not ( = ?auto_2709031 ?auto_2709036 ) ) ( not ( = ?auto_2709031 ?auto_2709037 ) ) ( not ( = ?auto_2709031 ?auto_2709038 ) ) ( not ( = ?auto_2709031 ?auto_2709039 ) ) ( not ( = ?auto_2709031 ?auto_2709040 ) ) ( not ( = ?auto_2709031 ?auto_2709041 ) ) ( not ( = ?auto_2709031 ?auto_2709042 ) ) ( not ( = ?auto_2709031 ?auto_2709043 ) ) ( not ( = ?auto_2709031 ?auto_2709044 ) ) ( not ( = ?auto_2709031 ?auto_2709046 ) ) ( not ( = ?auto_2709032 ?auto_2709033 ) ) ( not ( = ?auto_2709032 ?auto_2709034 ) ) ( not ( = ?auto_2709032 ?auto_2709035 ) ) ( not ( = ?auto_2709032 ?auto_2709036 ) ) ( not ( = ?auto_2709032 ?auto_2709037 ) ) ( not ( = ?auto_2709032 ?auto_2709038 ) ) ( not ( = ?auto_2709032 ?auto_2709039 ) ) ( not ( = ?auto_2709032 ?auto_2709040 ) ) ( not ( = ?auto_2709032 ?auto_2709041 ) ) ( not ( = ?auto_2709032 ?auto_2709042 ) ) ( not ( = ?auto_2709032 ?auto_2709043 ) ) ( not ( = ?auto_2709032 ?auto_2709044 ) ) ( not ( = ?auto_2709032 ?auto_2709046 ) ) ( not ( = ?auto_2709033 ?auto_2709034 ) ) ( not ( = ?auto_2709033 ?auto_2709035 ) ) ( not ( = ?auto_2709033 ?auto_2709036 ) ) ( not ( = ?auto_2709033 ?auto_2709037 ) ) ( not ( = ?auto_2709033 ?auto_2709038 ) ) ( not ( = ?auto_2709033 ?auto_2709039 ) ) ( not ( = ?auto_2709033 ?auto_2709040 ) ) ( not ( = ?auto_2709033 ?auto_2709041 ) ) ( not ( = ?auto_2709033 ?auto_2709042 ) ) ( not ( = ?auto_2709033 ?auto_2709043 ) ) ( not ( = ?auto_2709033 ?auto_2709044 ) ) ( not ( = ?auto_2709033 ?auto_2709046 ) ) ( not ( = ?auto_2709034 ?auto_2709035 ) ) ( not ( = ?auto_2709034 ?auto_2709036 ) ) ( not ( = ?auto_2709034 ?auto_2709037 ) ) ( not ( = ?auto_2709034 ?auto_2709038 ) ) ( not ( = ?auto_2709034 ?auto_2709039 ) ) ( not ( = ?auto_2709034 ?auto_2709040 ) ) ( not ( = ?auto_2709034 ?auto_2709041 ) ) ( not ( = ?auto_2709034 ?auto_2709042 ) ) ( not ( = ?auto_2709034 ?auto_2709043 ) ) ( not ( = ?auto_2709034 ?auto_2709044 ) ) ( not ( = ?auto_2709034 ?auto_2709046 ) ) ( not ( = ?auto_2709035 ?auto_2709036 ) ) ( not ( = ?auto_2709035 ?auto_2709037 ) ) ( not ( = ?auto_2709035 ?auto_2709038 ) ) ( not ( = ?auto_2709035 ?auto_2709039 ) ) ( not ( = ?auto_2709035 ?auto_2709040 ) ) ( not ( = ?auto_2709035 ?auto_2709041 ) ) ( not ( = ?auto_2709035 ?auto_2709042 ) ) ( not ( = ?auto_2709035 ?auto_2709043 ) ) ( not ( = ?auto_2709035 ?auto_2709044 ) ) ( not ( = ?auto_2709035 ?auto_2709046 ) ) ( not ( = ?auto_2709036 ?auto_2709037 ) ) ( not ( = ?auto_2709036 ?auto_2709038 ) ) ( not ( = ?auto_2709036 ?auto_2709039 ) ) ( not ( = ?auto_2709036 ?auto_2709040 ) ) ( not ( = ?auto_2709036 ?auto_2709041 ) ) ( not ( = ?auto_2709036 ?auto_2709042 ) ) ( not ( = ?auto_2709036 ?auto_2709043 ) ) ( not ( = ?auto_2709036 ?auto_2709044 ) ) ( not ( = ?auto_2709036 ?auto_2709046 ) ) ( not ( = ?auto_2709037 ?auto_2709038 ) ) ( not ( = ?auto_2709037 ?auto_2709039 ) ) ( not ( = ?auto_2709037 ?auto_2709040 ) ) ( not ( = ?auto_2709037 ?auto_2709041 ) ) ( not ( = ?auto_2709037 ?auto_2709042 ) ) ( not ( = ?auto_2709037 ?auto_2709043 ) ) ( not ( = ?auto_2709037 ?auto_2709044 ) ) ( not ( = ?auto_2709037 ?auto_2709046 ) ) ( not ( = ?auto_2709038 ?auto_2709039 ) ) ( not ( = ?auto_2709038 ?auto_2709040 ) ) ( not ( = ?auto_2709038 ?auto_2709041 ) ) ( not ( = ?auto_2709038 ?auto_2709042 ) ) ( not ( = ?auto_2709038 ?auto_2709043 ) ) ( not ( = ?auto_2709038 ?auto_2709044 ) ) ( not ( = ?auto_2709038 ?auto_2709046 ) ) ( not ( = ?auto_2709039 ?auto_2709040 ) ) ( not ( = ?auto_2709039 ?auto_2709041 ) ) ( not ( = ?auto_2709039 ?auto_2709042 ) ) ( not ( = ?auto_2709039 ?auto_2709043 ) ) ( not ( = ?auto_2709039 ?auto_2709044 ) ) ( not ( = ?auto_2709039 ?auto_2709046 ) ) ( not ( = ?auto_2709040 ?auto_2709041 ) ) ( not ( = ?auto_2709040 ?auto_2709042 ) ) ( not ( = ?auto_2709040 ?auto_2709043 ) ) ( not ( = ?auto_2709040 ?auto_2709044 ) ) ( not ( = ?auto_2709040 ?auto_2709046 ) ) ( not ( = ?auto_2709041 ?auto_2709042 ) ) ( not ( = ?auto_2709041 ?auto_2709043 ) ) ( not ( = ?auto_2709041 ?auto_2709044 ) ) ( not ( = ?auto_2709041 ?auto_2709046 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2709042 ?auto_2709043 ?auto_2709044 )
      ( MAKE-13CRATE-VERIFY ?auto_2709031 ?auto_2709032 ?auto_2709033 ?auto_2709034 ?auto_2709035 ?auto_2709036 ?auto_2709037 ?auto_2709038 ?auto_2709039 ?auto_2709040 ?auto_2709041 ?auto_2709042 ?auto_2709043 ?auto_2709044 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2709107 - SURFACE
      ?auto_2709108 - SURFACE
      ?auto_2709109 - SURFACE
      ?auto_2709110 - SURFACE
      ?auto_2709111 - SURFACE
      ?auto_2709112 - SURFACE
      ?auto_2709113 - SURFACE
    )
    :vars
    (
      ?auto_2709119 - HOIST
      ?auto_2709114 - PLACE
      ?auto_2709117 - PLACE
      ?auto_2709116 - HOIST
      ?auto_2709118 - SURFACE
      ?auto_2709115 - TRUCK
      ?auto_2709120 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709119 ?auto_2709114 ) ( IS-CRATE ?auto_2709113 ) ( not ( = ?auto_2709112 ?auto_2709113 ) ) ( not ( = ?auto_2709111 ?auto_2709112 ) ) ( not ( = ?auto_2709111 ?auto_2709113 ) ) ( not ( = ?auto_2709117 ?auto_2709114 ) ) ( HOIST-AT ?auto_2709116 ?auto_2709117 ) ( not ( = ?auto_2709119 ?auto_2709116 ) ) ( SURFACE-AT ?auto_2709113 ?auto_2709117 ) ( ON ?auto_2709113 ?auto_2709118 ) ( CLEAR ?auto_2709113 ) ( not ( = ?auto_2709112 ?auto_2709118 ) ) ( not ( = ?auto_2709113 ?auto_2709118 ) ) ( not ( = ?auto_2709111 ?auto_2709118 ) ) ( SURFACE-AT ?auto_2709111 ?auto_2709114 ) ( CLEAR ?auto_2709111 ) ( IS-CRATE ?auto_2709112 ) ( AVAILABLE ?auto_2709119 ) ( TRUCK-AT ?auto_2709115 ?auto_2709117 ) ( AVAILABLE ?auto_2709116 ) ( SURFACE-AT ?auto_2709112 ?auto_2709117 ) ( ON ?auto_2709112 ?auto_2709120 ) ( CLEAR ?auto_2709112 ) ( not ( = ?auto_2709112 ?auto_2709120 ) ) ( not ( = ?auto_2709113 ?auto_2709120 ) ) ( not ( = ?auto_2709111 ?auto_2709120 ) ) ( not ( = ?auto_2709118 ?auto_2709120 ) ) ( ON ?auto_2709108 ?auto_2709107 ) ( ON ?auto_2709109 ?auto_2709108 ) ( ON ?auto_2709110 ?auto_2709109 ) ( ON ?auto_2709111 ?auto_2709110 ) ( not ( = ?auto_2709107 ?auto_2709108 ) ) ( not ( = ?auto_2709107 ?auto_2709109 ) ) ( not ( = ?auto_2709107 ?auto_2709110 ) ) ( not ( = ?auto_2709107 ?auto_2709111 ) ) ( not ( = ?auto_2709107 ?auto_2709112 ) ) ( not ( = ?auto_2709107 ?auto_2709113 ) ) ( not ( = ?auto_2709107 ?auto_2709118 ) ) ( not ( = ?auto_2709107 ?auto_2709120 ) ) ( not ( = ?auto_2709108 ?auto_2709109 ) ) ( not ( = ?auto_2709108 ?auto_2709110 ) ) ( not ( = ?auto_2709108 ?auto_2709111 ) ) ( not ( = ?auto_2709108 ?auto_2709112 ) ) ( not ( = ?auto_2709108 ?auto_2709113 ) ) ( not ( = ?auto_2709108 ?auto_2709118 ) ) ( not ( = ?auto_2709108 ?auto_2709120 ) ) ( not ( = ?auto_2709109 ?auto_2709110 ) ) ( not ( = ?auto_2709109 ?auto_2709111 ) ) ( not ( = ?auto_2709109 ?auto_2709112 ) ) ( not ( = ?auto_2709109 ?auto_2709113 ) ) ( not ( = ?auto_2709109 ?auto_2709118 ) ) ( not ( = ?auto_2709109 ?auto_2709120 ) ) ( not ( = ?auto_2709110 ?auto_2709111 ) ) ( not ( = ?auto_2709110 ?auto_2709112 ) ) ( not ( = ?auto_2709110 ?auto_2709113 ) ) ( not ( = ?auto_2709110 ?auto_2709118 ) ) ( not ( = ?auto_2709110 ?auto_2709120 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2709111 ?auto_2709112 ?auto_2709113 )
      ( MAKE-6CRATE-VERIFY ?auto_2709107 ?auto_2709108 ?auto_2709109 ?auto_2709110 ?auto_2709111 ?auto_2709112 ?auto_2709113 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2709121 - SURFACE
      ?auto_2709122 - SURFACE
      ?auto_2709123 - SURFACE
      ?auto_2709124 - SURFACE
      ?auto_2709125 - SURFACE
      ?auto_2709126 - SURFACE
      ?auto_2709127 - SURFACE
      ?auto_2709128 - SURFACE
    )
    :vars
    (
      ?auto_2709134 - HOIST
      ?auto_2709129 - PLACE
      ?auto_2709132 - PLACE
      ?auto_2709131 - HOIST
      ?auto_2709133 - SURFACE
      ?auto_2709130 - TRUCK
      ?auto_2709135 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709134 ?auto_2709129 ) ( IS-CRATE ?auto_2709128 ) ( not ( = ?auto_2709127 ?auto_2709128 ) ) ( not ( = ?auto_2709126 ?auto_2709127 ) ) ( not ( = ?auto_2709126 ?auto_2709128 ) ) ( not ( = ?auto_2709132 ?auto_2709129 ) ) ( HOIST-AT ?auto_2709131 ?auto_2709132 ) ( not ( = ?auto_2709134 ?auto_2709131 ) ) ( SURFACE-AT ?auto_2709128 ?auto_2709132 ) ( ON ?auto_2709128 ?auto_2709133 ) ( CLEAR ?auto_2709128 ) ( not ( = ?auto_2709127 ?auto_2709133 ) ) ( not ( = ?auto_2709128 ?auto_2709133 ) ) ( not ( = ?auto_2709126 ?auto_2709133 ) ) ( SURFACE-AT ?auto_2709126 ?auto_2709129 ) ( CLEAR ?auto_2709126 ) ( IS-CRATE ?auto_2709127 ) ( AVAILABLE ?auto_2709134 ) ( TRUCK-AT ?auto_2709130 ?auto_2709132 ) ( AVAILABLE ?auto_2709131 ) ( SURFACE-AT ?auto_2709127 ?auto_2709132 ) ( ON ?auto_2709127 ?auto_2709135 ) ( CLEAR ?auto_2709127 ) ( not ( = ?auto_2709127 ?auto_2709135 ) ) ( not ( = ?auto_2709128 ?auto_2709135 ) ) ( not ( = ?auto_2709126 ?auto_2709135 ) ) ( not ( = ?auto_2709133 ?auto_2709135 ) ) ( ON ?auto_2709122 ?auto_2709121 ) ( ON ?auto_2709123 ?auto_2709122 ) ( ON ?auto_2709124 ?auto_2709123 ) ( ON ?auto_2709125 ?auto_2709124 ) ( ON ?auto_2709126 ?auto_2709125 ) ( not ( = ?auto_2709121 ?auto_2709122 ) ) ( not ( = ?auto_2709121 ?auto_2709123 ) ) ( not ( = ?auto_2709121 ?auto_2709124 ) ) ( not ( = ?auto_2709121 ?auto_2709125 ) ) ( not ( = ?auto_2709121 ?auto_2709126 ) ) ( not ( = ?auto_2709121 ?auto_2709127 ) ) ( not ( = ?auto_2709121 ?auto_2709128 ) ) ( not ( = ?auto_2709121 ?auto_2709133 ) ) ( not ( = ?auto_2709121 ?auto_2709135 ) ) ( not ( = ?auto_2709122 ?auto_2709123 ) ) ( not ( = ?auto_2709122 ?auto_2709124 ) ) ( not ( = ?auto_2709122 ?auto_2709125 ) ) ( not ( = ?auto_2709122 ?auto_2709126 ) ) ( not ( = ?auto_2709122 ?auto_2709127 ) ) ( not ( = ?auto_2709122 ?auto_2709128 ) ) ( not ( = ?auto_2709122 ?auto_2709133 ) ) ( not ( = ?auto_2709122 ?auto_2709135 ) ) ( not ( = ?auto_2709123 ?auto_2709124 ) ) ( not ( = ?auto_2709123 ?auto_2709125 ) ) ( not ( = ?auto_2709123 ?auto_2709126 ) ) ( not ( = ?auto_2709123 ?auto_2709127 ) ) ( not ( = ?auto_2709123 ?auto_2709128 ) ) ( not ( = ?auto_2709123 ?auto_2709133 ) ) ( not ( = ?auto_2709123 ?auto_2709135 ) ) ( not ( = ?auto_2709124 ?auto_2709125 ) ) ( not ( = ?auto_2709124 ?auto_2709126 ) ) ( not ( = ?auto_2709124 ?auto_2709127 ) ) ( not ( = ?auto_2709124 ?auto_2709128 ) ) ( not ( = ?auto_2709124 ?auto_2709133 ) ) ( not ( = ?auto_2709124 ?auto_2709135 ) ) ( not ( = ?auto_2709125 ?auto_2709126 ) ) ( not ( = ?auto_2709125 ?auto_2709127 ) ) ( not ( = ?auto_2709125 ?auto_2709128 ) ) ( not ( = ?auto_2709125 ?auto_2709133 ) ) ( not ( = ?auto_2709125 ?auto_2709135 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2709126 ?auto_2709127 ?auto_2709128 )
      ( MAKE-7CRATE-VERIFY ?auto_2709121 ?auto_2709122 ?auto_2709123 ?auto_2709124 ?auto_2709125 ?auto_2709126 ?auto_2709127 ?auto_2709128 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2709136 - SURFACE
      ?auto_2709137 - SURFACE
      ?auto_2709138 - SURFACE
      ?auto_2709139 - SURFACE
      ?auto_2709140 - SURFACE
      ?auto_2709141 - SURFACE
      ?auto_2709142 - SURFACE
      ?auto_2709143 - SURFACE
      ?auto_2709144 - SURFACE
    )
    :vars
    (
      ?auto_2709150 - HOIST
      ?auto_2709145 - PLACE
      ?auto_2709148 - PLACE
      ?auto_2709147 - HOIST
      ?auto_2709149 - SURFACE
      ?auto_2709146 - TRUCK
      ?auto_2709151 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709150 ?auto_2709145 ) ( IS-CRATE ?auto_2709144 ) ( not ( = ?auto_2709143 ?auto_2709144 ) ) ( not ( = ?auto_2709142 ?auto_2709143 ) ) ( not ( = ?auto_2709142 ?auto_2709144 ) ) ( not ( = ?auto_2709148 ?auto_2709145 ) ) ( HOIST-AT ?auto_2709147 ?auto_2709148 ) ( not ( = ?auto_2709150 ?auto_2709147 ) ) ( SURFACE-AT ?auto_2709144 ?auto_2709148 ) ( ON ?auto_2709144 ?auto_2709149 ) ( CLEAR ?auto_2709144 ) ( not ( = ?auto_2709143 ?auto_2709149 ) ) ( not ( = ?auto_2709144 ?auto_2709149 ) ) ( not ( = ?auto_2709142 ?auto_2709149 ) ) ( SURFACE-AT ?auto_2709142 ?auto_2709145 ) ( CLEAR ?auto_2709142 ) ( IS-CRATE ?auto_2709143 ) ( AVAILABLE ?auto_2709150 ) ( TRUCK-AT ?auto_2709146 ?auto_2709148 ) ( AVAILABLE ?auto_2709147 ) ( SURFACE-AT ?auto_2709143 ?auto_2709148 ) ( ON ?auto_2709143 ?auto_2709151 ) ( CLEAR ?auto_2709143 ) ( not ( = ?auto_2709143 ?auto_2709151 ) ) ( not ( = ?auto_2709144 ?auto_2709151 ) ) ( not ( = ?auto_2709142 ?auto_2709151 ) ) ( not ( = ?auto_2709149 ?auto_2709151 ) ) ( ON ?auto_2709137 ?auto_2709136 ) ( ON ?auto_2709138 ?auto_2709137 ) ( ON ?auto_2709139 ?auto_2709138 ) ( ON ?auto_2709140 ?auto_2709139 ) ( ON ?auto_2709141 ?auto_2709140 ) ( ON ?auto_2709142 ?auto_2709141 ) ( not ( = ?auto_2709136 ?auto_2709137 ) ) ( not ( = ?auto_2709136 ?auto_2709138 ) ) ( not ( = ?auto_2709136 ?auto_2709139 ) ) ( not ( = ?auto_2709136 ?auto_2709140 ) ) ( not ( = ?auto_2709136 ?auto_2709141 ) ) ( not ( = ?auto_2709136 ?auto_2709142 ) ) ( not ( = ?auto_2709136 ?auto_2709143 ) ) ( not ( = ?auto_2709136 ?auto_2709144 ) ) ( not ( = ?auto_2709136 ?auto_2709149 ) ) ( not ( = ?auto_2709136 ?auto_2709151 ) ) ( not ( = ?auto_2709137 ?auto_2709138 ) ) ( not ( = ?auto_2709137 ?auto_2709139 ) ) ( not ( = ?auto_2709137 ?auto_2709140 ) ) ( not ( = ?auto_2709137 ?auto_2709141 ) ) ( not ( = ?auto_2709137 ?auto_2709142 ) ) ( not ( = ?auto_2709137 ?auto_2709143 ) ) ( not ( = ?auto_2709137 ?auto_2709144 ) ) ( not ( = ?auto_2709137 ?auto_2709149 ) ) ( not ( = ?auto_2709137 ?auto_2709151 ) ) ( not ( = ?auto_2709138 ?auto_2709139 ) ) ( not ( = ?auto_2709138 ?auto_2709140 ) ) ( not ( = ?auto_2709138 ?auto_2709141 ) ) ( not ( = ?auto_2709138 ?auto_2709142 ) ) ( not ( = ?auto_2709138 ?auto_2709143 ) ) ( not ( = ?auto_2709138 ?auto_2709144 ) ) ( not ( = ?auto_2709138 ?auto_2709149 ) ) ( not ( = ?auto_2709138 ?auto_2709151 ) ) ( not ( = ?auto_2709139 ?auto_2709140 ) ) ( not ( = ?auto_2709139 ?auto_2709141 ) ) ( not ( = ?auto_2709139 ?auto_2709142 ) ) ( not ( = ?auto_2709139 ?auto_2709143 ) ) ( not ( = ?auto_2709139 ?auto_2709144 ) ) ( not ( = ?auto_2709139 ?auto_2709149 ) ) ( not ( = ?auto_2709139 ?auto_2709151 ) ) ( not ( = ?auto_2709140 ?auto_2709141 ) ) ( not ( = ?auto_2709140 ?auto_2709142 ) ) ( not ( = ?auto_2709140 ?auto_2709143 ) ) ( not ( = ?auto_2709140 ?auto_2709144 ) ) ( not ( = ?auto_2709140 ?auto_2709149 ) ) ( not ( = ?auto_2709140 ?auto_2709151 ) ) ( not ( = ?auto_2709141 ?auto_2709142 ) ) ( not ( = ?auto_2709141 ?auto_2709143 ) ) ( not ( = ?auto_2709141 ?auto_2709144 ) ) ( not ( = ?auto_2709141 ?auto_2709149 ) ) ( not ( = ?auto_2709141 ?auto_2709151 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2709142 ?auto_2709143 ?auto_2709144 )
      ( MAKE-8CRATE-VERIFY ?auto_2709136 ?auto_2709137 ?auto_2709138 ?auto_2709139 ?auto_2709140 ?auto_2709141 ?auto_2709142 ?auto_2709143 ?auto_2709144 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2709152 - SURFACE
      ?auto_2709153 - SURFACE
      ?auto_2709154 - SURFACE
      ?auto_2709155 - SURFACE
      ?auto_2709156 - SURFACE
      ?auto_2709157 - SURFACE
      ?auto_2709158 - SURFACE
      ?auto_2709159 - SURFACE
      ?auto_2709160 - SURFACE
      ?auto_2709161 - SURFACE
    )
    :vars
    (
      ?auto_2709167 - HOIST
      ?auto_2709162 - PLACE
      ?auto_2709165 - PLACE
      ?auto_2709164 - HOIST
      ?auto_2709166 - SURFACE
      ?auto_2709163 - TRUCK
      ?auto_2709168 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709167 ?auto_2709162 ) ( IS-CRATE ?auto_2709161 ) ( not ( = ?auto_2709160 ?auto_2709161 ) ) ( not ( = ?auto_2709159 ?auto_2709160 ) ) ( not ( = ?auto_2709159 ?auto_2709161 ) ) ( not ( = ?auto_2709165 ?auto_2709162 ) ) ( HOIST-AT ?auto_2709164 ?auto_2709165 ) ( not ( = ?auto_2709167 ?auto_2709164 ) ) ( SURFACE-AT ?auto_2709161 ?auto_2709165 ) ( ON ?auto_2709161 ?auto_2709166 ) ( CLEAR ?auto_2709161 ) ( not ( = ?auto_2709160 ?auto_2709166 ) ) ( not ( = ?auto_2709161 ?auto_2709166 ) ) ( not ( = ?auto_2709159 ?auto_2709166 ) ) ( SURFACE-AT ?auto_2709159 ?auto_2709162 ) ( CLEAR ?auto_2709159 ) ( IS-CRATE ?auto_2709160 ) ( AVAILABLE ?auto_2709167 ) ( TRUCK-AT ?auto_2709163 ?auto_2709165 ) ( AVAILABLE ?auto_2709164 ) ( SURFACE-AT ?auto_2709160 ?auto_2709165 ) ( ON ?auto_2709160 ?auto_2709168 ) ( CLEAR ?auto_2709160 ) ( not ( = ?auto_2709160 ?auto_2709168 ) ) ( not ( = ?auto_2709161 ?auto_2709168 ) ) ( not ( = ?auto_2709159 ?auto_2709168 ) ) ( not ( = ?auto_2709166 ?auto_2709168 ) ) ( ON ?auto_2709153 ?auto_2709152 ) ( ON ?auto_2709154 ?auto_2709153 ) ( ON ?auto_2709155 ?auto_2709154 ) ( ON ?auto_2709156 ?auto_2709155 ) ( ON ?auto_2709157 ?auto_2709156 ) ( ON ?auto_2709158 ?auto_2709157 ) ( ON ?auto_2709159 ?auto_2709158 ) ( not ( = ?auto_2709152 ?auto_2709153 ) ) ( not ( = ?auto_2709152 ?auto_2709154 ) ) ( not ( = ?auto_2709152 ?auto_2709155 ) ) ( not ( = ?auto_2709152 ?auto_2709156 ) ) ( not ( = ?auto_2709152 ?auto_2709157 ) ) ( not ( = ?auto_2709152 ?auto_2709158 ) ) ( not ( = ?auto_2709152 ?auto_2709159 ) ) ( not ( = ?auto_2709152 ?auto_2709160 ) ) ( not ( = ?auto_2709152 ?auto_2709161 ) ) ( not ( = ?auto_2709152 ?auto_2709166 ) ) ( not ( = ?auto_2709152 ?auto_2709168 ) ) ( not ( = ?auto_2709153 ?auto_2709154 ) ) ( not ( = ?auto_2709153 ?auto_2709155 ) ) ( not ( = ?auto_2709153 ?auto_2709156 ) ) ( not ( = ?auto_2709153 ?auto_2709157 ) ) ( not ( = ?auto_2709153 ?auto_2709158 ) ) ( not ( = ?auto_2709153 ?auto_2709159 ) ) ( not ( = ?auto_2709153 ?auto_2709160 ) ) ( not ( = ?auto_2709153 ?auto_2709161 ) ) ( not ( = ?auto_2709153 ?auto_2709166 ) ) ( not ( = ?auto_2709153 ?auto_2709168 ) ) ( not ( = ?auto_2709154 ?auto_2709155 ) ) ( not ( = ?auto_2709154 ?auto_2709156 ) ) ( not ( = ?auto_2709154 ?auto_2709157 ) ) ( not ( = ?auto_2709154 ?auto_2709158 ) ) ( not ( = ?auto_2709154 ?auto_2709159 ) ) ( not ( = ?auto_2709154 ?auto_2709160 ) ) ( not ( = ?auto_2709154 ?auto_2709161 ) ) ( not ( = ?auto_2709154 ?auto_2709166 ) ) ( not ( = ?auto_2709154 ?auto_2709168 ) ) ( not ( = ?auto_2709155 ?auto_2709156 ) ) ( not ( = ?auto_2709155 ?auto_2709157 ) ) ( not ( = ?auto_2709155 ?auto_2709158 ) ) ( not ( = ?auto_2709155 ?auto_2709159 ) ) ( not ( = ?auto_2709155 ?auto_2709160 ) ) ( not ( = ?auto_2709155 ?auto_2709161 ) ) ( not ( = ?auto_2709155 ?auto_2709166 ) ) ( not ( = ?auto_2709155 ?auto_2709168 ) ) ( not ( = ?auto_2709156 ?auto_2709157 ) ) ( not ( = ?auto_2709156 ?auto_2709158 ) ) ( not ( = ?auto_2709156 ?auto_2709159 ) ) ( not ( = ?auto_2709156 ?auto_2709160 ) ) ( not ( = ?auto_2709156 ?auto_2709161 ) ) ( not ( = ?auto_2709156 ?auto_2709166 ) ) ( not ( = ?auto_2709156 ?auto_2709168 ) ) ( not ( = ?auto_2709157 ?auto_2709158 ) ) ( not ( = ?auto_2709157 ?auto_2709159 ) ) ( not ( = ?auto_2709157 ?auto_2709160 ) ) ( not ( = ?auto_2709157 ?auto_2709161 ) ) ( not ( = ?auto_2709157 ?auto_2709166 ) ) ( not ( = ?auto_2709157 ?auto_2709168 ) ) ( not ( = ?auto_2709158 ?auto_2709159 ) ) ( not ( = ?auto_2709158 ?auto_2709160 ) ) ( not ( = ?auto_2709158 ?auto_2709161 ) ) ( not ( = ?auto_2709158 ?auto_2709166 ) ) ( not ( = ?auto_2709158 ?auto_2709168 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2709159 ?auto_2709160 ?auto_2709161 )
      ( MAKE-9CRATE-VERIFY ?auto_2709152 ?auto_2709153 ?auto_2709154 ?auto_2709155 ?auto_2709156 ?auto_2709157 ?auto_2709158 ?auto_2709159 ?auto_2709160 ?auto_2709161 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2709169 - SURFACE
      ?auto_2709170 - SURFACE
      ?auto_2709171 - SURFACE
      ?auto_2709172 - SURFACE
      ?auto_2709173 - SURFACE
      ?auto_2709174 - SURFACE
      ?auto_2709175 - SURFACE
      ?auto_2709176 - SURFACE
      ?auto_2709177 - SURFACE
      ?auto_2709178 - SURFACE
      ?auto_2709179 - SURFACE
    )
    :vars
    (
      ?auto_2709185 - HOIST
      ?auto_2709180 - PLACE
      ?auto_2709183 - PLACE
      ?auto_2709182 - HOIST
      ?auto_2709184 - SURFACE
      ?auto_2709181 - TRUCK
      ?auto_2709186 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709185 ?auto_2709180 ) ( IS-CRATE ?auto_2709179 ) ( not ( = ?auto_2709178 ?auto_2709179 ) ) ( not ( = ?auto_2709177 ?auto_2709178 ) ) ( not ( = ?auto_2709177 ?auto_2709179 ) ) ( not ( = ?auto_2709183 ?auto_2709180 ) ) ( HOIST-AT ?auto_2709182 ?auto_2709183 ) ( not ( = ?auto_2709185 ?auto_2709182 ) ) ( SURFACE-AT ?auto_2709179 ?auto_2709183 ) ( ON ?auto_2709179 ?auto_2709184 ) ( CLEAR ?auto_2709179 ) ( not ( = ?auto_2709178 ?auto_2709184 ) ) ( not ( = ?auto_2709179 ?auto_2709184 ) ) ( not ( = ?auto_2709177 ?auto_2709184 ) ) ( SURFACE-AT ?auto_2709177 ?auto_2709180 ) ( CLEAR ?auto_2709177 ) ( IS-CRATE ?auto_2709178 ) ( AVAILABLE ?auto_2709185 ) ( TRUCK-AT ?auto_2709181 ?auto_2709183 ) ( AVAILABLE ?auto_2709182 ) ( SURFACE-AT ?auto_2709178 ?auto_2709183 ) ( ON ?auto_2709178 ?auto_2709186 ) ( CLEAR ?auto_2709178 ) ( not ( = ?auto_2709178 ?auto_2709186 ) ) ( not ( = ?auto_2709179 ?auto_2709186 ) ) ( not ( = ?auto_2709177 ?auto_2709186 ) ) ( not ( = ?auto_2709184 ?auto_2709186 ) ) ( ON ?auto_2709170 ?auto_2709169 ) ( ON ?auto_2709171 ?auto_2709170 ) ( ON ?auto_2709172 ?auto_2709171 ) ( ON ?auto_2709173 ?auto_2709172 ) ( ON ?auto_2709174 ?auto_2709173 ) ( ON ?auto_2709175 ?auto_2709174 ) ( ON ?auto_2709176 ?auto_2709175 ) ( ON ?auto_2709177 ?auto_2709176 ) ( not ( = ?auto_2709169 ?auto_2709170 ) ) ( not ( = ?auto_2709169 ?auto_2709171 ) ) ( not ( = ?auto_2709169 ?auto_2709172 ) ) ( not ( = ?auto_2709169 ?auto_2709173 ) ) ( not ( = ?auto_2709169 ?auto_2709174 ) ) ( not ( = ?auto_2709169 ?auto_2709175 ) ) ( not ( = ?auto_2709169 ?auto_2709176 ) ) ( not ( = ?auto_2709169 ?auto_2709177 ) ) ( not ( = ?auto_2709169 ?auto_2709178 ) ) ( not ( = ?auto_2709169 ?auto_2709179 ) ) ( not ( = ?auto_2709169 ?auto_2709184 ) ) ( not ( = ?auto_2709169 ?auto_2709186 ) ) ( not ( = ?auto_2709170 ?auto_2709171 ) ) ( not ( = ?auto_2709170 ?auto_2709172 ) ) ( not ( = ?auto_2709170 ?auto_2709173 ) ) ( not ( = ?auto_2709170 ?auto_2709174 ) ) ( not ( = ?auto_2709170 ?auto_2709175 ) ) ( not ( = ?auto_2709170 ?auto_2709176 ) ) ( not ( = ?auto_2709170 ?auto_2709177 ) ) ( not ( = ?auto_2709170 ?auto_2709178 ) ) ( not ( = ?auto_2709170 ?auto_2709179 ) ) ( not ( = ?auto_2709170 ?auto_2709184 ) ) ( not ( = ?auto_2709170 ?auto_2709186 ) ) ( not ( = ?auto_2709171 ?auto_2709172 ) ) ( not ( = ?auto_2709171 ?auto_2709173 ) ) ( not ( = ?auto_2709171 ?auto_2709174 ) ) ( not ( = ?auto_2709171 ?auto_2709175 ) ) ( not ( = ?auto_2709171 ?auto_2709176 ) ) ( not ( = ?auto_2709171 ?auto_2709177 ) ) ( not ( = ?auto_2709171 ?auto_2709178 ) ) ( not ( = ?auto_2709171 ?auto_2709179 ) ) ( not ( = ?auto_2709171 ?auto_2709184 ) ) ( not ( = ?auto_2709171 ?auto_2709186 ) ) ( not ( = ?auto_2709172 ?auto_2709173 ) ) ( not ( = ?auto_2709172 ?auto_2709174 ) ) ( not ( = ?auto_2709172 ?auto_2709175 ) ) ( not ( = ?auto_2709172 ?auto_2709176 ) ) ( not ( = ?auto_2709172 ?auto_2709177 ) ) ( not ( = ?auto_2709172 ?auto_2709178 ) ) ( not ( = ?auto_2709172 ?auto_2709179 ) ) ( not ( = ?auto_2709172 ?auto_2709184 ) ) ( not ( = ?auto_2709172 ?auto_2709186 ) ) ( not ( = ?auto_2709173 ?auto_2709174 ) ) ( not ( = ?auto_2709173 ?auto_2709175 ) ) ( not ( = ?auto_2709173 ?auto_2709176 ) ) ( not ( = ?auto_2709173 ?auto_2709177 ) ) ( not ( = ?auto_2709173 ?auto_2709178 ) ) ( not ( = ?auto_2709173 ?auto_2709179 ) ) ( not ( = ?auto_2709173 ?auto_2709184 ) ) ( not ( = ?auto_2709173 ?auto_2709186 ) ) ( not ( = ?auto_2709174 ?auto_2709175 ) ) ( not ( = ?auto_2709174 ?auto_2709176 ) ) ( not ( = ?auto_2709174 ?auto_2709177 ) ) ( not ( = ?auto_2709174 ?auto_2709178 ) ) ( not ( = ?auto_2709174 ?auto_2709179 ) ) ( not ( = ?auto_2709174 ?auto_2709184 ) ) ( not ( = ?auto_2709174 ?auto_2709186 ) ) ( not ( = ?auto_2709175 ?auto_2709176 ) ) ( not ( = ?auto_2709175 ?auto_2709177 ) ) ( not ( = ?auto_2709175 ?auto_2709178 ) ) ( not ( = ?auto_2709175 ?auto_2709179 ) ) ( not ( = ?auto_2709175 ?auto_2709184 ) ) ( not ( = ?auto_2709175 ?auto_2709186 ) ) ( not ( = ?auto_2709176 ?auto_2709177 ) ) ( not ( = ?auto_2709176 ?auto_2709178 ) ) ( not ( = ?auto_2709176 ?auto_2709179 ) ) ( not ( = ?auto_2709176 ?auto_2709184 ) ) ( not ( = ?auto_2709176 ?auto_2709186 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2709177 ?auto_2709178 ?auto_2709179 )
      ( MAKE-10CRATE-VERIFY ?auto_2709169 ?auto_2709170 ?auto_2709171 ?auto_2709172 ?auto_2709173 ?auto_2709174 ?auto_2709175 ?auto_2709176 ?auto_2709177 ?auto_2709178 ?auto_2709179 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2709187 - SURFACE
      ?auto_2709188 - SURFACE
      ?auto_2709189 - SURFACE
      ?auto_2709190 - SURFACE
      ?auto_2709191 - SURFACE
      ?auto_2709192 - SURFACE
      ?auto_2709193 - SURFACE
      ?auto_2709194 - SURFACE
      ?auto_2709195 - SURFACE
      ?auto_2709196 - SURFACE
      ?auto_2709197 - SURFACE
      ?auto_2709198 - SURFACE
    )
    :vars
    (
      ?auto_2709204 - HOIST
      ?auto_2709199 - PLACE
      ?auto_2709202 - PLACE
      ?auto_2709201 - HOIST
      ?auto_2709203 - SURFACE
      ?auto_2709200 - TRUCK
      ?auto_2709205 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709204 ?auto_2709199 ) ( IS-CRATE ?auto_2709198 ) ( not ( = ?auto_2709197 ?auto_2709198 ) ) ( not ( = ?auto_2709196 ?auto_2709197 ) ) ( not ( = ?auto_2709196 ?auto_2709198 ) ) ( not ( = ?auto_2709202 ?auto_2709199 ) ) ( HOIST-AT ?auto_2709201 ?auto_2709202 ) ( not ( = ?auto_2709204 ?auto_2709201 ) ) ( SURFACE-AT ?auto_2709198 ?auto_2709202 ) ( ON ?auto_2709198 ?auto_2709203 ) ( CLEAR ?auto_2709198 ) ( not ( = ?auto_2709197 ?auto_2709203 ) ) ( not ( = ?auto_2709198 ?auto_2709203 ) ) ( not ( = ?auto_2709196 ?auto_2709203 ) ) ( SURFACE-AT ?auto_2709196 ?auto_2709199 ) ( CLEAR ?auto_2709196 ) ( IS-CRATE ?auto_2709197 ) ( AVAILABLE ?auto_2709204 ) ( TRUCK-AT ?auto_2709200 ?auto_2709202 ) ( AVAILABLE ?auto_2709201 ) ( SURFACE-AT ?auto_2709197 ?auto_2709202 ) ( ON ?auto_2709197 ?auto_2709205 ) ( CLEAR ?auto_2709197 ) ( not ( = ?auto_2709197 ?auto_2709205 ) ) ( not ( = ?auto_2709198 ?auto_2709205 ) ) ( not ( = ?auto_2709196 ?auto_2709205 ) ) ( not ( = ?auto_2709203 ?auto_2709205 ) ) ( ON ?auto_2709188 ?auto_2709187 ) ( ON ?auto_2709189 ?auto_2709188 ) ( ON ?auto_2709190 ?auto_2709189 ) ( ON ?auto_2709191 ?auto_2709190 ) ( ON ?auto_2709192 ?auto_2709191 ) ( ON ?auto_2709193 ?auto_2709192 ) ( ON ?auto_2709194 ?auto_2709193 ) ( ON ?auto_2709195 ?auto_2709194 ) ( ON ?auto_2709196 ?auto_2709195 ) ( not ( = ?auto_2709187 ?auto_2709188 ) ) ( not ( = ?auto_2709187 ?auto_2709189 ) ) ( not ( = ?auto_2709187 ?auto_2709190 ) ) ( not ( = ?auto_2709187 ?auto_2709191 ) ) ( not ( = ?auto_2709187 ?auto_2709192 ) ) ( not ( = ?auto_2709187 ?auto_2709193 ) ) ( not ( = ?auto_2709187 ?auto_2709194 ) ) ( not ( = ?auto_2709187 ?auto_2709195 ) ) ( not ( = ?auto_2709187 ?auto_2709196 ) ) ( not ( = ?auto_2709187 ?auto_2709197 ) ) ( not ( = ?auto_2709187 ?auto_2709198 ) ) ( not ( = ?auto_2709187 ?auto_2709203 ) ) ( not ( = ?auto_2709187 ?auto_2709205 ) ) ( not ( = ?auto_2709188 ?auto_2709189 ) ) ( not ( = ?auto_2709188 ?auto_2709190 ) ) ( not ( = ?auto_2709188 ?auto_2709191 ) ) ( not ( = ?auto_2709188 ?auto_2709192 ) ) ( not ( = ?auto_2709188 ?auto_2709193 ) ) ( not ( = ?auto_2709188 ?auto_2709194 ) ) ( not ( = ?auto_2709188 ?auto_2709195 ) ) ( not ( = ?auto_2709188 ?auto_2709196 ) ) ( not ( = ?auto_2709188 ?auto_2709197 ) ) ( not ( = ?auto_2709188 ?auto_2709198 ) ) ( not ( = ?auto_2709188 ?auto_2709203 ) ) ( not ( = ?auto_2709188 ?auto_2709205 ) ) ( not ( = ?auto_2709189 ?auto_2709190 ) ) ( not ( = ?auto_2709189 ?auto_2709191 ) ) ( not ( = ?auto_2709189 ?auto_2709192 ) ) ( not ( = ?auto_2709189 ?auto_2709193 ) ) ( not ( = ?auto_2709189 ?auto_2709194 ) ) ( not ( = ?auto_2709189 ?auto_2709195 ) ) ( not ( = ?auto_2709189 ?auto_2709196 ) ) ( not ( = ?auto_2709189 ?auto_2709197 ) ) ( not ( = ?auto_2709189 ?auto_2709198 ) ) ( not ( = ?auto_2709189 ?auto_2709203 ) ) ( not ( = ?auto_2709189 ?auto_2709205 ) ) ( not ( = ?auto_2709190 ?auto_2709191 ) ) ( not ( = ?auto_2709190 ?auto_2709192 ) ) ( not ( = ?auto_2709190 ?auto_2709193 ) ) ( not ( = ?auto_2709190 ?auto_2709194 ) ) ( not ( = ?auto_2709190 ?auto_2709195 ) ) ( not ( = ?auto_2709190 ?auto_2709196 ) ) ( not ( = ?auto_2709190 ?auto_2709197 ) ) ( not ( = ?auto_2709190 ?auto_2709198 ) ) ( not ( = ?auto_2709190 ?auto_2709203 ) ) ( not ( = ?auto_2709190 ?auto_2709205 ) ) ( not ( = ?auto_2709191 ?auto_2709192 ) ) ( not ( = ?auto_2709191 ?auto_2709193 ) ) ( not ( = ?auto_2709191 ?auto_2709194 ) ) ( not ( = ?auto_2709191 ?auto_2709195 ) ) ( not ( = ?auto_2709191 ?auto_2709196 ) ) ( not ( = ?auto_2709191 ?auto_2709197 ) ) ( not ( = ?auto_2709191 ?auto_2709198 ) ) ( not ( = ?auto_2709191 ?auto_2709203 ) ) ( not ( = ?auto_2709191 ?auto_2709205 ) ) ( not ( = ?auto_2709192 ?auto_2709193 ) ) ( not ( = ?auto_2709192 ?auto_2709194 ) ) ( not ( = ?auto_2709192 ?auto_2709195 ) ) ( not ( = ?auto_2709192 ?auto_2709196 ) ) ( not ( = ?auto_2709192 ?auto_2709197 ) ) ( not ( = ?auto_2709192 ?auto_2709198 ) ) ( not ( = ?auto_2709192 ?auto_2709203 ) ) ( not ( = ?auto_2709192 ?auto_2709205 ) ) ( not ( = ?auto_2709193 ?auto_2709194 ) ) ( not ( = ?auto_2709193 ?auto_2709195 ) ) ( not ( = ?auto_2709193 ?auto_2709196 ) ) ( not ( = ?auto_2709193 ?auto_2709197 ) ) ( not ( = ?auto_2709193 ?auto_2709198 ) ) ( not ( = ?auto_2709193 ?auto_2709203 ) ) ( not ( = ?auto_2709193 ?auto_2709205 ) ) ( not ( = ?auto_2709194 ?auto_2709195 ) ) ( not ( = ?auto_2709194 ?auto_2709196 ) ) ( not ( = ?auto_2709194 ?auto_2709197 ) ) ( not ( = ?auto_2709194 ?auto_2709198 ) ) ( not ( = ?auto_2709194 ?auto_2709203 ) ) ( not ( = ?auto_2709194 ?auto_2709205 ) ) ( not ( = ?auto_2709195 ?auto_2709196 ) ) ( not ( = ?auto_2709195 ?auto_2709197 ) ) ( not ( = ?auto_2709195 ?auto_2709198 ) ) ( not ( = ?auto_2709195 ?auto_2709203 ) ) ( not ( = ?auto_2709195 ?auto_2709205 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2709196 ?auto_2709197 ?auto_2709198 )
      ( MAKE-11CRATE-VERIFY ?auto_2709187 ?auto_2709188 ?auto_2709189 ?auto_2709190 ?auto_2709191 ?auto_2709192 ?auto_2709193 ?auto_2709194 ?auto_2709195 ?auto_2709196 ?auto_2709197 ?auto_2709198 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2709206 - SURFACE
      ?auto_2709207 - SURFACE
      ?auto_2709208 - SURFACE
      ?auto_2709209 - SURFACE
      ?auto_2709210 - SURFACE
      ?auto_2709211 - SURFACE
      ?auto_2709212 - SURFACE
      ?auto_2709213 - SURFACE
      ?auto_2709214 - SURFACE
      ?auto_2709215 - SURFACE
      ?auto_2709216 - SURFACE
      ?auto_2709217 - SURFACE
      ?auto_2709218 - SURFACE
    )
    :vars
    (
      ?auto_2709224 - HOIST
      ?auto_2709219 - PLACE
      ?auto_2709222 - PLACE
      ?auto_2709221 - HOIST
      ?auto_2709223 - SURFACE
      ?auto_2709220 - TRUCK
      ?auto_2709225 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709224 ?auto_2709219 ) ( IS-CRATE ?auto_2709218 ) ( not ( = ?auto_2709217 ?auto_2709218 ) ) ( not ( = ?auto_2709216 ?auto_2709217 ) ) ( not ( = ?auto_2709216 ?auto_2709218 ) ) ( not ( = ?auto_2709222 ?auto_2709219 ) ) ( HOIST-AT ?auto_2709221 ?auto_2709222 ) ( not ( = ?auto_2709224 ?auto_2709221 ) ) ( SURFACE-AT ?auto_2709218 ?auto_2709222 ) ( ON ?auto_2709218 ?auto_2709223 ) ( CLEAR ?auto_2709218 ) ( not ( = ?auto_2709217 ?auto_2709223 ) ) ( not ( = ?auto_2709218 ?auto_2709223 ) ) ( not ( = ?auto_2709216 ?auto_2709223 ) ) ( SURFACE-AT ?auto_2709216 ?auto_2709219 ) ( CLEAR ?auto_2709216 ) ( IS-CRATE ?auto_2709217 ) ( AVAILABLE ?auto_2709224 ) ( TRUCK-AT ?auto_2709220 ?auto_2709222 ) ( AVAILABLE ?auto_2709221 ) ( SURFACE-AT ?auto_2709217 ?auto_2709222 ) ( ON ?auto_2709217 ?auto_2709225 ) ( CLEAR ?auto_2709217 ) ( not ( = ?auto_2709217 ?auto_2709225 ) ) ( not ( = ?auto_2709218 ?auto_2709225 ) ) ( not ( = ?auto_2709216 ?auto_2709225 ) ) ( not ( = ?auto_2709223 ?auto_2709225 ) ) ( ON ?auto_2709207 ?auto_2709206 ) ( ON ?auto_2709208 ?auto_2709207 ) ( ON ?auto_2709209 ?auto_2709208 ) ( ON ?auto_2709210 ?auto_2709209 ) ( ON ?auto_2709211 ?auto_2709210 ) ( ON ?auto_2709212 ?auto_2709211 ) ( ON ?auto_2709213 ?auto_2709212 ) ( ON ?auto_2709214 ?auto_2709213 ) ( ON ?auto_2709215 ?auto_2709214 ) ( ON ?auto_2709216 ?auto_2709215 ) ( not ( = ?auto_2709206 ?auto_2709207 ) ) ( not ( = ?auto_2709206 ?auto_2709208 ) ) ( not ( = ?auto_2709206 ?auto_2709209 ) ) ( not ( = ?auto_2709206 ?auto_2709210 ) ) ( not ( = ?auto_2709206 ?auto_2709211 ) ) ( not ( = ?auto_2709206 ?auto_2709212 ) ) ( not ( = ?auto_2709206 ?auto_2709213 ) ) ( not ( = ?auto_2709206 ?auto_2709214 ) ) ( not ( = ?auto_2709206 ?auto_2709215 ) ) ( not ( = ?auto_2709206 ?auto_2709216 ) ) ( not ( = ?auto_2709206 ?auto_2709217 ) ) ( not ( = ?auto_2709206 ?auto_2709218 ) ) ( not ( = ?auto_2709206 ?auto_2709223 ) ) ( not ( = ?auto_2709206 ?auto_2709225 ) ) ( not ( = ?auto_2709207 ?auto_2709208 ) ) ( not ( = ?auto_2709207 ?auto_2709209 ) ) ( not ( = ?auto_2709207 ?auto_2709210 ) ) ( not ( = ?auto_2709207 ?auto_2709211 ) ) ( not ( = ?auto_2709207 ?auto_2709212 ) ) ( not ( = ?auto_2709207 ?auto_2709213 ) ) ( not ( = ?auto_2709207 ?auto_2709214 ) ) ( not ( = ?auto_2709207 ?auto_2709215 ) ) ( not ( = ?auto_2709207 ?auto_2709216 ) ) ( not ( = ?auto_2709207 ?auto_2709217 ) ) ( not ( = ?auto_2709207 ?auto_2709218 ) ) ( not ( = ?auto_2709207 ?auto_2709223 ) ) ( not ( = ?auto_2709207 ?auto_2709225 ) ) ( not ( = ?auto_2709208 ?auto_2709209 ) ) ( not ( = ?auto_2709208 ?auto_2709210 ) ) ( not ( = ?auto_2709208 ?auto_2709211 ) ) ( not ( = ?auto_2709208 ?auto_2709212 ) ) ( not ( = ?auto_2709208 ?auto_2709213 ) ) ( not ( = ?auto_2709208 ?auto_2709214 ) ) ( not ( = ?auto_2709208 ?auto_2709215 ) ) ( not ( = ?auto_2709208 ?auto_2709216 ) ) ( not ( = ?auto_2709208 ?auto_2709217 ) ) ( not ( = ?auto_2709208 ?auto_2709218 ) ) ( not ( = ?auto_2709208 ?auto_2709223 ) ) ( not ( = ?auto_2709208 ?auto_2709225 ) ) ( not ( = ?auto_2709209 ?auto_2709210 ) ) ( not ( = ?auto_2709209 ?auto_2709211 ) ) ( not ( = ?auto_2709209 ?auto_2709212 ) ) ( not ( = ?auto_2709209 ?auto_2709213 ) ) ( not ( = ?auto_2709209 ?auto_2709214 ) ) ( not ( = ?auto_2709209 ?auto_2709215 ) ) ( not ( = ?auto_2709209 ?auto_2709216 ) ) ( not ( = ?auto_2709209 ?auto_2709217 ) ) ( not ( = ?auto_2709209 ?auto_2709218 ) ) ( not ( = ?auto_2709209 ?auto_2709223 ) ) ( not ( = ?auto_2709209 ?auto_2709225 ) ) ( not ( = ?auto_2709210 ?auto_2709211 ) ) ( not ( = ?auto_2709210 ?auto_2709212 ) ) ( not ( = ?auto_2709210 ?auto_2709213 ) ) ( not ( = ?auto_2709210 ?auto_2709214 ) ) ( not ( = ?auto_2709210 ?auto_2709215 ) ) ( not ( = ?auto_2709210 ?auto_2709216 ) ) ( not ( = ?auto_2709210 ?auto_2709217 ) ) ( not ( = ?auto_2709210 ?auto_2709218 ) ) ( not ( = ?auto_2709210 ?auto_2709223 ) ) ( not ( = ?auto_2709210 ?auto_2709225 ) ) ( not ( = ?auto_2709211 ?auto_2709212 ) ) ( not ( = ?auto_2709211 ?auto_2709213 ) ) ( not ( = ?auto_2709211 ?auto_2709214 ) ) ( not ( = ?auto_2709211 ?auto_2709215 ) ) ( not ( = ?auto_2709211 ?auto_2709216 ) ) ( not ( = ?auto_2709211 ?auto_2709217 ) ) ( not ( = ?auto_2709211 ?auto_2709218 ) ) ( not ( = ?auto_2709211 ?auto_2709223 ) ) ( not ( = ?auto_2709211 ?auto_2709225 ) ) ( not ( = ?auto_2709212 ?auto_2709213 ) ) ( not ( = ?auto_2709212 ?auto_2709214 ) ) ( not ( = ?auto_2709212 ?auto_2709215 ) ) ( not ( = ?auto_2709212 ?auto_2709216 ) ) ( not ( = ?auto_2709212 ?auto_2709217 ) ) ( not ( = ?auto_2709212 ?auto_2709218 ) ) ( not ( = ?auto_2709212 ?auto_2709223 ) ) ( not ( = ?auto_2709212 ?auto_2709225 ) ) ( not ( = ?auto_2709213 ?auto_2709214 ) ) ( not ( = ?auto_2709213 ?auto_2709215 ) ) ( not ( = ?auto_2709213 ?auto_2709216 ) ) ( not ( = ?auto_2709213 ?auto_2709217 ) ) ( not ( = ?auto_2709213 ?auto_2709218 ) ) ( not ( = ?auto_2709213 ?auto_2709223 ) ) ( not ( = ?auto_2709213 ?auto_2709225 ) ) ( not ( = ?auto_2709214 ?auto_2709215 ) ) ( not ( = ?auto_2709214 ?auto_2709216 ) ) ( not ( = ?auto_2709214 ?auto_2709217 ) ) ( not ( = ?auto_2709214 ?auto_2709218 ) ) ( not ( = ?auto_2709214 ?auto_2709223 ) ) ( not ( = ?auto_2709214 ?auto_2709225 ) ) ( not ( = ?auto_2709215 ?auto_2709216 ) ) ( not ( = ?auto_2709215 ?auto_2709217 ) ) ( not ( = ?auto_2709215 ?auto_2709218 ) ) ( not ( = ?auto_2709215 ?auto_2709223 ) ) ( not ( = ?auto_2709215 ?auto_2709225 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2709216 ?auto_2709217 ?auto_2709218 )
      ( MAKE-12CRATE-VERIFY ?auto_2709206 ?auto_2709207 ?auto_2709208 ?auto_2709209 ?auto_2709210 ?auto_2709211 ?auto_2709212 ?auto_2709213 ?auto_2709214 ?auto_2709215 ?auto_2709216 ?auto_2709217 ?auto_2709218 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2709226 - SURFACE
      ?auto_2709227 - SURFACE
      ?auto_2709228 - SURFACE
      ?auto_2709229 - SURFACE
      ?auto_2709230 - SURFACE
      ?auto_2709231 - SURFACE
      ?auto_2709232 - SURFACE
      ?auto_2709233 - SURFACE
      ?auto_2709234 - SURFACE
      ?auto_2709235 - SURFACE
      ?auto_2709236 - SURFACE
      ?auto_2709237 - SURFACE
      ?auto_2709238 - SURFACE
      ?auto_2709239 - SURFACE
    )
    :vars
    (
      ?auto_2709245 - HOIST
      ?auto_2709240 - PLACE
      ?auto_2709243 - PLACE
      ?auto_2709242 - HOIST
      ?auto_2709244 - SURFACE
      ?auto_2709241 - TRUCK
      ?auto_2709246 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709245 ?auto_2709240 ) ( IS-CRATE ?auto_2709239 ) ( not ( = ?auto_2709238 ?auto_2709239 ) ) ( not ( = ?auto_2709237 ?auto_2709238 ) ) ( not ( = ?auto_2709237 ?auto_2709239 ) ) ( not ( = ?auto_2709243 ?auto_2709240 ) ) ( HOIST-AT ?auto_2709242 ?auto_2709243 ) ( not ( = ?auto_2709245 ?auto_2709242 ) ) ( SURFACE-AT ?auto_2709239 ?auto_2709243 ) ( ON ?auto_2709239 ?auto_2709244 ) ( CLEAR ?auto_2709239 ) ( not ( = ?auto_2709238 ?auto_2709244 ) ) ( not ( = ?auto_2709239 ?auto_2709244 ) ) ( not ( = ?auto_2709237 ?auto_2709244 ) ) ( SURFACE-AT ?auto_2709237 ?auto_2709240 ) ( CLEAR ?auto_2709237 ) ( IS-CRATE ?auto_2709238 ) ( AVAILABLE ?auto_2709245 ) ( TRUCK-AT ?auto_2709241 ?auto_2709243 ) ( AVAILABLE ?auto_2709242 ) ( SURFACE-AT ?auto_2709238 ?auto_2709243 ) ( ON ?auto_2709238 ?auto_2709246 ) ( CLEAR ?auto_2709238 ) ( not ( = ?auto_2709238 ?auto_2709246 ) ) ( not ( = ?auto_2709239 ?auto_2709246 ) ) ( not ( = ?auto_2709237 ?auto_2709246 ) ) ( not ( = ?auto_2709244 ?auto_2709246 ) ) ( ON ?auto_2709227 ?auto_2709226 ) ( ON ?auto_2709228 ?auto_2709227 ) ( ON ?auto_2709229 ?auto_2709228 ) ( ON ?auto_2709230 ?auto_2709229 ) ( ON ?auto_2709231 ?auto_2709230 ) ( ON ?auto_2709232 ?auto_2709231 ) ( ON ?auto_2709233 ?auto_2709232 ) ( ON ?auto_2709234 ?auto_2709233 ) ( ON ?auto_2709235 ?auto_2709234 ) ( ON ?auto_2709236 ?auto_2709235 ) ( ON ?auto_2709237 ?auto_2709236 ) ( not ( = ?auto_2709226 ?auto_2709227 ) ) ( not ( = ?auto_2709226 ?auto_2709228 ) ) ( not ( = ?auto_2709226 ?auto_2709229 ) ) ( not ( = ?auto_2709226 ?auto_2709230 ) ) ( not ( = ?auto_2709226 ?auto_2709231 ) ) ( not ( = ?auto_2709226 ?auto_2709232 ) ) ( not ( = ?auto_2709226 ?auto_2709233 ) ) ( not ( = ?auto_2709226 ?auto_2709234 ) ) ( not ( = ?auto_2709226 ?auto_2709235 ) ) ( not ( = ?auto_2709226 ?auto_2709236 ) ) ( not ( = ?auto_2709226 ?auto_2709237 ) ) ( not ( = ?auto_2709226 ?auto_2709238 ) ) ( not ( = ?auto_2709226 ?auto_2709239 ) ) ( not ( = ?auto_2709226 ?auto_2709244 ) ) ( not ( = ?auto_2709226 ?auto_2709246 ) ) ( not ( = ?auto_2709227 ?auto_2709228 ) ) ( not ( = ?auto_2709227 ?auto_2709229 ) ) ( not ( = ?auto_2709227 ?auto_2709230 ) ) ( not ( = ?auto_2709227 ?auto_2709231 ) ) ( not ( = ?auto_2709227 ?auto_2709232 ) ) ( not ( = ?auto_2709227 ?auto_2709233 ) ) ( not ( = ?auto_2709227 ?auto_2709234 ) ) ( not ( = ?auto_2709227 ?auto_2709235 ) ) ( not ( = ?auto_2709227 ?auto_2709236 ) ) ( not ( = ?auto_2709227 ?auto_2709237 ) ) ( not ( = ?auto_2709227 ?auto_2709238 ) ) ( not ( = ?auto_2709227 ?auto_2709239 ) ) ( not ( = ?auto_2709227 ?auto_2709244 ) ) ( not ( = ?auto_2709227 ?auto_2709246 ) ) ( not ( = ?auto_2709228 ?auto_2709229 ) ) ( not ( = ?auto_2709228 ?auto_2709230 ) ) ( not ( = ?auto_2709228 ?auto_2709231 ) ) ( not ( = ?auto_2709228 ?auto_2709232 ) ) ( not ( = ?auto_2709228 ?auto_2709233 ) ) ( not ( = ?auto_2709228 ?auto_2709234 ) ) ( not ( = ?auto_2709228 ?auto_2709235 ) ) ( not ( = ?auto_2709228 ?auto_2709236 ) ) ( not ( = ?auto_2709228 ?auto_2709237 ) ) ( not ( = ?auto_2709228 ?auto_2709238 ) ) ( not ( = ?auto_2709228 ?auto_2709239 ) ) ( not ( = ?auto_2709228 ?auto_2709244 ) ) ( not ( = ?auto_2709228 ?auto_2709246 ) ) ( not ( = ?auto_2709229 ?auto_2709230 ) ) ( not ( = ?auto_2709229 ?auto_2709231 ) ) ( not ( = ?auto_2709229 ?auto_2709232 ) ) ( not ( = ?auto_2709229 ?auto_2709233 ) ) ( not ( = ?auto_2709229 ?auto_2709234 ) ) ( not ( = ?auto_2709229 ?auto_2709235 ) ) ( not ( = ?auto_2709229 ?auto_2709236 ) ) ( not ( = ?auto_2709229 ?auto_2709237 ) ) ( not ( = ?auto_2709229 ?auto_2709238 ) ) ( not ( = ?auto_2709229 ?auto_2709239 ) ) ( not ( = ?auto_2709229 ?auto_2709244 ) ) ( not ( = ?auto_2709229 ?auto_2709246 ) ) ( not ( = ?auto_2709230 ?auto_2709231 ) ) ( not ( = ?auto_2709230 ?auto_2709232 ) ) ( not ( = ?auto_2709230 ?auto_2709233 ) ) ( not ( = ?auto_2709230 ?auto_2709234 ) ) ( not ( = ?auto_2709230 ?auto_2709235 ) ) ( not ( = ?auto_2709230 ?auto_2709236 ) ) ( not ( = ?auto_2709230 ?auto_2709237 ) ) ( not ( = ?auto_2709230 ?auto_2709238 ) ) ( not ( = ?auto_2709230 ?auto_2709239 ) ) ( not ( = ?auto_2709230 ?auto_2709244 ) ) ( not ( = ?auto_2709230 ?auto_2709246 ) ) ( not ( = ?auto_2709231 ?auto_2709232 ) ) ( not ( = ?auto_2709231 ?auto_2709233 ) ) ( not ( = ?auto_2709231 ?auto_2709234 ) ) ( not ( = ?auto_2709231 ?auto_2709235 ) ) ( not ( = ?auto_2709231 ?auto_2709236 ) ) ( not ( = ?auto_2709231 ?auto_2709237 ) ) ( not ( = ?auto_2709231 ?auto_2709238 ) ) ( not ( = ?auto_2709231 ?auto_2709239 ) ) ( not ( = ?auto_2709231 ?auto_2709244 ) ) ( not ( = ?auto_2709231 ?auto_2709246 ) ) ( not ( = ?auto_2709232 ?auto_2709233 ) ) ( not ( = ?auto_2709232 ?auto_2709234 ) ) ( not ( = ?auto_2709232 ?auto_2709235 ) ) ( not ( = ?auto_2709232 ?auto_2709236 ) ) ( not ( = ?auto_2709232 ?auto_2709237 ) ) ( not ( = ?auto_2709232 ?auto_2709238 ) ) ( not ( = ?auto_2709232 ?auto_2709239 ) ) ( not ( = ?auto_2709232 ?auto_2709244 ) ) ( not ( = ?auto_2709232 ?auto_2709246 ) ) ( not ( = ?auto_2709233 ?auto_2709234 ) ) ( not ( = ?auto_2709233 ?auto_2709235 ) ) ( not ( = ?auto_2709233 ?auto_2709236 ) ) ( not ( = ?auto_2709233 ?auto_2709237 ) ) ( not ( = ?auto_2709233 ?auto_2709238 ) ) ( not ( = ?auto_2709233 ?auto_2709239 ) ) ( not ( = ?auto_2709233 ?auto_2709244 ) ) ( not ( = ?auto_2709233 ?auto_2709246 ) ) ( not ( = ?auto_2709234 ?auto_2709235 ) ) ( not ( = ?auto_2709234 ?auto_2709236 ) ) ( not ( = ?auto_2709234 ?auto_2709237 ) ) ( not ( = ?auto_2709234 ?auto_2709238 ) ) ( not ( = ?auto_2709234 ?auto_2709239 ) ) ( not ( = ?auto_2709234 ?auto_2709244 ) ) ( not ( = ?auto_2709234 ?auto_2709246 ) ) ( not ( = ?auto_2709235 ?auto_2709236 ) ) ( not ( = ?auto_2709235 ?auto_2709237 ) ) ( not ( = ?auto_2709235 ?auto_2709238 ) ) ( not ( = ?auto_2709235 ?auto_2709239 ) ) ( not ( = ?auto_2709235 ?auto_2709244 ) ) ( not ( = ?auto_2709235 ?auto_2709246 ) ) ( not ( = ?auto_2709236 ?auto_2709237 ) ) ( not ( = ?auto_2709236 ?auto_2709238 ) ) ( not ( = ?auto_2709236 ?auto_2709239 ) ) ( not ( = ?auto_2709236 ?auto_2709244 ) ) ( not ( = ?auto_2709236 ?auto_2709246 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2709237 ?auto_2709238 ?auto_2709239 )
      ( MAKE-13CRATE-VERIFY ?auto_2709226 ?auto_2709227 ?auto_2709228 ?auto_2709229 ?auto_2709230 ?auto_2709231 ?auto_2709232 ?auto_2709233 ?auto_2709234 ?auto_2709235 ?auto_2709236 ?auto_2709237 ?auto_2709238 ?auto_2709239 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2709303 - SURFACE
      ?auto_2709304 - SURFACE
      ?auto_2709305 - SURFACE
      ?auto_2709306 - SURFACE
      ?auto_2709307 - SURFACE
      ?auto_2709308 - SURFACE
      ?auto_2709309 - SURFACE
    )
    :vars
    (
      ?auto_2709315 - HOIST
      ?auto_2709316 - PLACE
      ?auto_2709311 - PLACE
      ?auto_2709312 - HOIST
      ?auto_2709310 - SURFACE
      ?auto_2709313 - SURFACE
      ?auto_2709314 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709315 ?auto_2709316 ) ( IS-CRATE ?auto_2709309 ) ( not ( = ?auto_2709308 ?auto_2709309 ) ) ( not ( = ?auto_2709307 ?auto_2709308 ) ) ( not ( = ?auto_2709307 ?auto_2709309 ) ) ( not ( = ?auto_2709311 ?auto_2709316 ) ) ( HOIST-AT ?auto_2709312 ?auto_2709311 ) ( not ( = ?auto_2709315 ?auto_2709312 ) ) ( SURFACE-AT ?auto_2709309 ?auto_2709311 ) ( ON ?auto_2709309 ?auto_2709310 ) ( CLEAR ?auto_2709309 ) ( not ( = ?auto_2709308 ?auto_2709310 ) ) ( not ( = ?auto_2709309 ?auto_2709310 ) ) ( not ( = ?auto_2709307 ?auto_2709310 ) ) ( SURFACE-AT ?auto_2709307 ?auto_2709316 ) ( CLEAR ?auto_2709307 ) ( IS-CRATE ?auto_2709308 ) ( AVAILABLE ?auto_2709315 ) ( AVAILABLE ?auto_2709312 ) ( SURFACE-AT ?auto_2709308 ?auto_2709311 ) ( ON ?auto_2709308 ?auto_2709313 ) ( CLEAR ?auto_2709308 ) ( not ( = ?auto_2709308 ?auto_2709313 ) ) ( not ( = ?auto_2709309 ?auto_2709313 ) ) ( not ( = ?auto_2709307 ?auto_2709313 ) ) ( not ( = ?auto_2709310 ?auto_2709313 ) ) ( TRUCK-AT ?auto_2709314 ?auto_2709316 ) ( ON ?auto_2709304 ?auto_2709303 ) ( ON ?auto_2709305 ?auto_2709304 ) ( ON ?auto_2709306 ?auto_2709305 ) ( ON ?auto_2709307 ?auto_2709306 ) ( not ( = ?auto_2709303 ?auto_2709304 ) ) ( not ( = ?auto_2709303 ?auto_2709305 ) ) ( not ( = ?auto_2709303 ?auto_2709306 ) ) ( not ( = ?auto_2709303 ?auto_2709307 ) ) ( not ( = ?auto_2709303 ?auto_2709308 ) ) ( not ( = ?auto_2709303 ?auto_2709309 ) ) ( not ( = ?auto_2709303 ?auto_2709310 ) ) ( not ( = ?auto_2709303 ?auto_2709313 ) ) ( not ( = ?auto_2709304 ?auto_2709305 ) ) ( not ( = ?auto_2709304 ?auto_2709306 ) ) ( not ( = ?auto_2709304 ?auto_2709307 ) ) ( not ( = ?auto_2709304 ?auto_2709308 ) ) ( not ( = ?auto_2709304 ?auto_2709309 ) ) ( not ( = ?auto_2709304 ?auto_2709310 ) ) ( not ( = ?auto_2709304 ?auto_2709313 ) ) ( not ( = ?auto_2709305 ?auto_2709306 ) ) ( not ( = ?auto_2709305 ?auto_2709307 ) ) ( not ( = ?auto_2709305 ?auto_2709308 ) ) ( not ( = ?auto_2709305 ?auto_2709309 ) ) ( not ( = ?auto_2709305 ?auto_2709310 ) ) ( not ( = ?auto_2709305 ?auto_2709313 ) ) ( not ( = ?auto_2709306 ?auto_2709307 ) ) ( not ( = ?auto_2709306 ?auto_2709308 ) ) ( not ( = ?auto_2709306 ?auto_2709309 ) ) ( not ( = ?auto_2709306 ?auto_2709310 ) ) ( not ( = ?auto_2709306 ?auto_2709313 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2709307 ?auto_2709308 ?auto_2709309 )
      ( MAKE-6CRATE-VERIFY ?auto_2709303 ?auto_2709304 ?auto_2709305 ?auto_2709306 ?auto_2709307 ?auto_2709308 ?auto_2709309 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2709317 - SURFACE
      ?auto_2709318 - SURFACE
      ?auto_2709319 - SURFACE
      ?auto_2709320 - SURFACE
      ?auto_2709321 - SURFACE
      ?auto_2709322 - SURFACE
      ?auto_2709323 - SURFACE
      ?auto_2709324 - SURFACE
    )
    :vars
    (
      ?auto_2709330 - HOIST
      ?auto_2709331 - PLACE
      ?auto_2709326 - PLACE
      ?auto_2709327 - HOIST
      ?auto_2709325 - SURFACE
      ?auto_2709328 - SURFACE
      ?auto_2709329 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709330 ?auto_2709331 ) ( IS-CRATE ?auto_2709324 ) ( not ( = ?auto_2709323 ?auto_2709324 ) ) ( not ( = ?auto_2709322 ?auto_2709323 ) ) ( not ( = ?auto_2709322 ?auto_2709324 ) ) ( not ( = ?auto_2709326 ?auto_2709331 ) ) ( HOIST-AT ?auto_2709327 ?auto_2709326 ) ( not ( = ?auto_2709330 ?auto_2709327 ) ) ( SURFACE-AT ?auto_2709324 ?auto_2709326 ) ( ON ?auto_2709324 ?auto_2709325 ) ( CLEAR ?auto_2709324 ) ( not ( = ?auto_2709323 ?auto_2709325 ) ) ( not ( = ?auto_2709324 ?auto_2709325 ) ) ( not ( = ?auto_2709322 ?auto_2709325 ) ) ( SURFACE-AT ?auto_2709322 ?auto_2709331 ) ( CLEAR ?auto_2709322 ) ( IS-CRATE ?auto_2709323 ) ( AVAILABLE ?auto_2709330 ) ( AVAILABLE ?auto_2709327 ) ( SURFACE-AT ?auto_2709323 ?auto_2709326 ) ( ON ?auto_2709323 ?auto_2709328 ) ( CLEAR ?auto_2709323 ) ( not ( = ?auto_2709323 ?auto_2709328 ) ) ( not ( = ?auto_2709324 ?auto_2709328 ) ) ( not ( = ?auto_2709322 ?auto_2709328 ) ) ( not ( = ?auto_2709325 ?auto_2709328 ) ) ( TRUCK-AT ?auto_2709329 ?auto_2709331 ) ( ON ?auto_2709318 ?auto_2709317 ) ( ON ?auto_2709319 ?auto_2709318 ) ( ON ?auto_2709320 ?auto_2709319 ) ( ON ?auto_2709321 ?auto_2709320 ) ( ON ?auto_2709322 ?auto_2709321 ) ( not ( = ?auto_2709317 ?auto_2709318 ) ) ( not ( = ?auto_2709317 ?auto_2709319 ) ) ( not ( = ?auto_2709317 ?auto_2709320 ) ) ( not ( = ?auto_2709317 ?auto_2709321 ) ) ( not ( = ?auto_2709317 ?auto_2709322 ) ) ( not ( = ?auto_2709317 ?auto_2709323 ) ) ( not ( = ?auto_2709317 ?auto_2709324 ) ) ( not ( = ?auto_2709317 ?auto_2709325 ) ) ( not ( = ?auto_2709317 ?auto_2709328 ) ) ( not ( = ?auto_2709318 ?auto_2709319 ) ) ( not ( = ?auto_2709318 ?auto_2709320 ) ) ( not ( = ?auto_2709318 ?auto_2709321 ) ) ( not ( = ?auto_2709318 ?auto_2709322 ) ) ( not ( = ?auto_2709318 ?auto_2709323 ) ) ( not ( = ?auto_2709318 ?auto_2709324 ) ) ( not ( = ?auto_2709318 ?auto_2709325 ) ) ( not ( = ?auto_2709318 ?auto_2709328 ) ) ( not ( = ?auto_2709319 ?auto_2709320 ) ) ( not ( = ?auto_2709319 ?auto_2709321 ) ) ( not ( = ?auto_2709319 ?auto_2709322 ) ) ( not ( = ?auto_2709319 ?auto_2709323 ) ) ( not ( = ?auto_2709319 ?auto_2709324 ) ) ( not ( = ?auto_2709319 ?auto_2709325 ) ) ( not ( = ?auto_2709319 ?auto_2709328 ) ) ( not ( = ?auto_2709320 ?auto_2709321 ) ) ( not ( = ?auto_2709320 ?auto_2709322 ) ) ( not ( = ?auto_2709320 ?auto_2709323 ) ) ( not ( = ?auto_2709320 ?auto_2709324 ) ) ( not ( = ?auto_2709320 ?auto_2709325 ) ) ( not ( = ?auto_2709320 ?auto_2709328 ) ) ( not ( = ?auto_2709321 ?auto_2709322 ) ) ( not ( = ?auto_2709321 ?auto_2709323 ) ) ( not ( = ?auto_2709321 ?auto_2709324 ) ) ( not ( = ?auto_2709321 ?auto_2709325 ) ) ( not ( = ?auto_2709321 ?auto_2709328 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2709322 ?auto_2709323 ?auto_2709324 )
      ( MAKE-7CRATE-VERIFY ?auto_2709317 ?auto_2709318 ?auto_2709319 ?auto_2709320 ?auto_2709321 ?auto_2709322 ?auto_2709323 ?auto_2709324 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2709332 - SURFACE
      ?auto_2709333 - SURFACE
      ?auto_2709334 - SURFACE
      ?auto_2709335 - SURFACE
      ?auto_2709336 - SURFACE
      ?auto_2709337 - SURFACE
      ?auto_2709338 - SURFACE
      ?auto_2709339 - SURFACE
      ?auto_2709340 - SURFACE
    )
    :vars
    (
      ?auto_2709346 - HOIST
      ?auto_2709347 - PLACE
      ?auto_2709342 - PLACE
      ?auto_2709343 - HOIST
      ?auto_2709341 - SURFACE
      ?auto_2709344 - SURFACE
      ?auto_2709345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709346 ?auto_2709347 ) ( IS-CRATE ?auto_2709340 ) ( not ( = ?auto_2709339 ?auto_2709340 ) ) ( not ( = ?auto_2709338 ?auto_2709339 ) ) ( not ( = ?auto_2709338 ?auto_2709340 ) ) ( not ( = ?auto_2709342 ?auto_2709347 ) ) ( HOIST-AT ?auto_2709343 ?auto_2709342 ) ( not ( = ?auto_2709346 ?auto_2709343 ) ) ( SURFACE-AT ?auto_2709340 ?auto_2709342 ) ( ON ?auto_2709340 ?auto_2709341 ) ( CLEAR ?auto_2709340 ) ( not ( = ?auto_2709339 ?auto_2709341 ) ) ( not ( = ?auto_2709340 ?auto_2709341 ) ) ( not ( = ?auto_2709338 ?auto_2709341 ) ) ( SURFACE-AT ?auto_2709338 ?auto_2709347 ) ( CLEAR ?auto_2709338 ) ( IS-CRATE ?auto_2709339 ) ( AVAILABLE ?auto_2709346 ) ( AVAILABLE ?auto_2709343 ) ( SURFACE-AT ?auto_2709339 ?auto_2709342 ) ( ON ?auto_2709339 ?auto_2709344 ) ( CLEAR ?auto_2709339 ) ( not ( = ?auto_2709339 ?auto_2709344 ) ) ( not ( = ?auto_2709340 ?auto_2709344 ) ) ( not ( = ?auto_2709338 ?auto_2709344 ) ) ( not ( = ?auto_2709341 ?auto_2709344 ) ) ( TRUCK-AT ?auto_2709345 ?auto_2709347 ) ( ON ?auto_2709333 ?auto_2709332 ) ( ON ?auto_2709334 ?auto_2709333 ) ( ON ?auto_2709335 ?auto_2709334 ) ( ON ?auto_2709336 ?auto_2709335 ) ( ON ?auto_2709337 ?auto_2709336 ) ( ON ?auto_2709338 ?auto_2709337 ) ( not ( = ?auto_2709332 ?auto_2709333 ) ) ( not ( = ?auto_2709332 ?auto_2709334 ) ) ( not ( = ?auto_2709332 ?auto_2709335 ) ) ( not ( = ?auto_2709332 ?auto_2709336 ) ) ( not ( = ?auto_2709332 ?auto_2709337 ) ) ( not ( = ?auto_2709332 ?auto_2709338 ) ) ( not ( = ?auto_2709332 ?auto_2709339 ) ) ( not ( = ?auto_2709332 ?auto_2709340 ) ) ( not ( = ?auto_2709332 ?auto_2709341 ) ) ( not ( = ?auto_2709332 ?auto_2709344 ) ) ( not ( = ?auto_2709333 ?auto_2709334 ) ) ( not ( = ?auto_2709333 ?auto_2709335 ) ) ( not ( = ?auto_2709333 ?auto_2709336 ) ) ( not ( = ?auto_2709333 ?auto_2709337 ) ) ( not ( = ?auto_2709333 ?auto_2709338 ) ) ( not ( = ?auto_2709333 ?auto_2709339 ) ) ( not ( = ?auto_2709333 ?auto_2709340 ) ) ( not ( = ?auto_2709333 ?auto_2709341 ) ) ( not ( = ?auto_2709333 ?auto_2709344 ) ) ( not ( = ?auto_2709334 ?auto_2709335 ) ) ( not ( = ?auto_2709334 ?auto_2709336 ) ) ( not ( = ?auto_2709334 ?auto_2709337 ) ) ( not ( = ?auto_2709334 ?auto_2709338 ) ) ( not ( = ?auto_2709334 ?auto_2709339 ) ) ( not ( = ?auto_2709334 ?auto_2709340 ) ) ( not ( = ?auto_2709334 ?auto_2709341 ) ) ( not ( = ?auto_2709334 ?auto_2709344 ) ) ( not ( = ?auto_2709335 ?auto_2709336 ) ) ( not ( = ?auto_2709335 ?auto_2709337 ) ) ( not ( = ?auto_2709335 ?auto_2709338 ) ) ( not ( = ?auto_2709335 ?auto_2709339 ) ) ( not ( = ?auto_2709335 ?auto_2709340 ) ) ( not ( = ?auto_2709335 ?auto_2709341 ) ) ( not ( = ?auto_2709335 ?auto_2709344 ) ) ( not ( = ?auto_2709336 ?auto_2709337 ) ) ( not ( = ?auto_2709336 ?auto_2709338 ) ) ( not ( = ?auto_2709336 ?auto_2709339 ) ) ( not ( = ?auto_2709336 ?auto_2709340 ) ) ( not ( = ?auto_2709336 ?auto_2709341 ) ) ( not ( = ?auto_2709336 ?auto_2709344 ) ) ( not ( = ?auto_2709337 ?auto_2709338 ) ) ( not ( = ?auto_2709337 ?auto_2709339 ) ) ( not ( = ?auto_2709337 ?auto_2709340 ) ) ( not ( = ?auto_2709337 ?auto_2709341 ) ) ( not ( = ?auto_2709337 ?auto_2709344 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2709338 ?auto_2709339 ?auto_2709340 )
      ( MAKE-8CRATE-VERIFY ?auto_2709332 ?auto_2709333 ?auto_2709334 ?auto_2709335 ?auto_2709336 ?auto_2709337 ?auto_2709338 ?auto_2709339 ?auto_2709340 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2709348 - SURFACE
      ?auto_2709349 - SURFACE
      ?auto_2709350 - SURFACE
      ?auto_2709351 - SURFACE
      ?auto_2709352 - SURFACE
      ?auto_2709353 - SURFACE
      ?auto_2709354 - SURFACE
      ?auto_2709355 - SURFACE
      ?auto_2709356 - SURFACE
      ?auto_2709357 - SURFACE
    )
    :vars
    (
      ?auto_2709363 - HOIST
      ?auto_2709364 - PLACE
      ?auto_2709359 - PLACE
      ?auto_2709360 - HOIST
      ?auto_2709358 - SURFACE
      ?auto_2709361 - SURFACE
      ?auto_2709362 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709363 ?auto_2709364 ) ( IS-CRATE ?auto_2709357 ) ( not ( = ?auto_2709356 ?auto_2709357 ) ) ( not ( = ?auto_2709355 ?auto_2709356 ) ) ( not ( = ?auto_2709355 ?auto_2709357 ) ) ( not ( = ?auto_2709359 ?auto_2709364 ) ) ( HOIST-AT ?auto_2709360 ?auto_2709359 ) ( not ( = ?auto_2709363 ?auto_2709360 ) ) ( SURFACE-AT ?auto_2709357 ?auto_2709359 ) ( ON ?auto_2709357 ?auto_2709358 ) ( CLEAR ?auto_2709357 ) ( not ( = ?auto_2709356 ?auto_2709358 ) ) ( not ( = ?auto_2709357 ?auto_2709358 ) ) ( not ( = ?auto_2709355 ?auto_2709358 ) ) ( SURFACE-AT ?auto_2709355 ?auto_2709364 ) ( CLEAR ?auto_2709355 ) ( IS-CRATE ?auto_2709356 ) ( AVAILABLE ?auto_2709363 ) ( AVAILABLE ?auto_2709360 ) ( SURFACE-AT ?auto_2709356 ?auto_2709359 ) ( ON ?auto_2709356 ?auto_2709361 ) ( CLEAR ?auto_2709356 ) ( not ( = ?auto_2709356 ?auto_2709361 ) ) ( not ( = ?auto_2709357 ?auto_2709361 ) ) ( not ( = ?auto_2709355 ?auto_2709361 ) ) ( not ( = ?auto_2709358 ?auto_2709361 ) ) ( TRUCK-AT ?auto_2709362 ?auto_2709364 ) ( ON ?auto_2709349 ?auto_2709348 ) ( ON ?auto_2709350 ?auto_2709349 ) ( ON ?auto_2709351 ?auto_2709350 ) ( ON ?auto_2709352 ?auto_2709351 ) ( ON ?auto_2709353 ?auto_2709352 ) ( ON ?auto_2709354 ?auto_2709353 ) ( ON ?auto_2709355 ?auto_2709354 ) ( not ( = ?auto_2709348 ?auto_2709349 ) ) ( not ( = ?auto_2709348 ?auto_2709350 ) ) ( not ( = ?auto_2709348 ?auto_2709351 ) ) ( not ( = ?auto_2709348 ?auto_2709352 ) ) ( not ( = ?auto_2709348 ?auto_2709353 ) ) ( not ( = ?auto_2709348 ?auto_2709354 ) ) ( not ( = ?auto_2709348 ?auto_2709355 ) ) ( not ( = ?auto_2709348 ?auto_2709356 ) ) ( not ( = ?auto_2709348 ?auto_2709357 ) ) ( not ( = ?auto_2709348 ?auto_2709358 ) ) ( not ( = ?auto_2709348 ?auto_2709361 ) ) ( not ( = ?auto_2709349 ?auto_2709350 ) ) ( not ( = ?auto_2709349 ?auto_2709351 ) ) ( not ( = ?auto_2709349 ?auto_2709352 ) ) ( not ( = ?auto_2709349 ?auto_2709353 ) ) ( not ( = ?auto_2709349 ?auto_2709354 ) ) ( not ( = ?auto_2709349 ?auto_2709355 ) ) ( not ( = ?auto_2709349 ?auto_2709356 ) ) ( not ( = ?auto_2709349 ?auto_2709357 ) ) ( not ( = ?auto_2709349 ?auto_2709358 ) ) ( not ( = ?auto_2709349 ?auto_2709361 ) ) ( not ( = ?auto_2709350 ?auto_2709351 ) ) ( not ( = ?auto_2709350 ?auto_2709352 ) ) ( not ( = ?auto_2709350 ?auto_2709353 ) ) ( not ( = ?auto_2709350 ?auto_2709354 ) ) ( not ( = ?auto_2709350 ?auto_2709355 ) ) ( not ( = ?auto_2709350 ?auto_2709356 ) ) ( not ( = ?auto_2709350 ?auto_2709357 ) ) ( not ( = ?auto_2709350 ?auto_2709358 ) ) ( not ( = ?auto_2709350 ?auto_2709361 ) ) ( not ( = ?auto_2709351 ?auto_2709352 ) ) ( not ( = ?auto_2709351 ?auto_2709353 ) ) ( not ( = ?auto_2709351 ?auto_2709354 ) ) ( not ( = ?auto_2709351 ?auto_2709355 ) ) ( not ( = ?auto_2709351 ?auto_2709356 ) ) ( not ( = ?auto_2709351 ?auto_2709357 ) ) ( not ( = ?auto_2709351 ?auto_2709358 ) ) ( not ( = ?auto_2709351 ?auto_2709361 ) ) ( not ( = ?auto_2709352 ?auto_2709353 ) ) ( not ( = ?auto_2709352 ?auto_2709354 ) ) ( not ( = ?auto_2709352 ?auto_2709355 ) ) ( not ( = ?auto_2709352 ?auto_2709356 ) ) ( not ( = ?auto_2709352 ?auto_2709357 ) ) ( not ( = ?auto_2709352 ?auto_2709358 ) ) ( not ( = ?auto_2709352 ?auto_2709361 ) ) ( not ( = ?auto_2709353 ?auto_2709354 ) ) ( not ( = ?auto_2709353 ?auto_2709355 ) ) ( not ( = ?auto_2709353 ?auto_2709356 ) ) ( not ( = ?auto_2709353 ?auto_2709357 ) ) ( not ( = ?auto_2709353 ?auto_2709358 ) ) ( not ( = ?auto_2709353 ?auto_2709361 ) ) ( not ( = ?auto_2709354 ?auto_2709355 ) ) ( not ( = ?auto_2709354 ?auto_2709356 ) ) ( not ( = ?auto_2709354 ?auto_2709357 ) ) ( not ( = ?auto_2709354 ?auto_2709358 ) ) ( not ( = ?auto_2709354 ?auto_2709361 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2709355 ?auto_2709356 ?auto_2709357 )
      ( MAKE-9CRATE-VERIFY ?auto_2709348 ?auto_2709349 ?auto_2709350 ?auto_2709351 ?auto_2709352 ?auto_2709353 ?auto_2709354 ?auto_2709355 ?auto_2709356 ?auto_2709357 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2709365 - SURFACE
      ?auto_2709366 - SURFACE
      ?auto_2709367 - SURFACE
      ?auto_2709368 - SURFACE
      ?auto_2709369 - SURFACE
      ?auto_2709370 - SURFACE
      ?auto_2709371 - SURFACE
      ?auto_2709372 - SURFACE
      ?auto_2709373 - SURFACE
      ?auto_2709374 - SURFACE
      ?auto_2709375 - SURFACE
    )
    :vars
    (
      ?auto_2709381 - HOIST
      ?auto_2709382 - PLACE
      ?auto_2709377 - PLACE
      ?auto_2709378 - HOIST
      ?auto_2709376 - SURFACE
      ?auto_2709379 - SURFACE
      ?auto_2709380 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709381 ?auto_2709382 ) ( IS-CRATE ?auto_2709375 ) ( not ( = ?auto_2709374 ?auto_2709375 ) ) ( not ( = ?auto_2709373 ?auto_2709374 ) ) ( not ( = ?auto_2709373 ?auto_2709375 ) ) ( not ( = ?auto_2709377 ?auto_2709382 ) ) ( HOIST-AT ?auto_2709378 ?auto_2709377 ) ( not ( = ?auto_2709381 ?auto_2709378 ) ) ( SURFACE-AT ?auto_2709375 ?auto_2709377 ) ( ON ?auto_2709375 ?auto_2709376 ) ( CLEAR ?auto_2709375 ) ( not ( = ?auto_2709374 ?auto_2709376 ) ) ( not ( = ?auto_2709375 ?auto_2709376 ) ) ( not ( = ?auto_2709373 ?auto_2709376 ) ) ( SURFACE-AT ?auto_2709373 ?auto_2709382 ) ( CLEAR ?auto_2709373 ) ( IS-CRATE ?auto_2709374 ) ( AVAILABLE ?auto_2709381 ) ( AVAILABLE ?auto_2709378 ) ( SURFACE-AT ?auto_2709374 ?auto_2709377 ) ( ON ?auto_2709374 ?auto_2709379 ) ( CLEAR ?auto_2709374 ) ( not ( = ?auto_2709374 ?auto_2709379 ) ) ( not ( = ?auto_2709375 ?auto_2709379 ) ) ( not ( = ?auto_2709373 ?auto_2709379 ) ) ( not ( = ?auto_2709376 ?auto_2709379 ) ) ( TRUCK-AT ?auto_2709380 ?auto_2709382 ) ( ON ?auto_2709366 ?auto_2709365 ) ( ON ?auto_2709367 ?auto_2709366 ) ( ON ?auto_2709368 ?auto_2709367 ) ( ON ?auto_2709369 ?auto_2709368 ) ( ON ?auto_2709370 ?auto_2709369 ) ( ON ?auto_2709371 ?auto_2709370 ) ( ON ?auto_2709372 ?auto_2709371 ) ( ON ?auto_2709373 ?auto_2709372 ) ( not ( = ?auto_2709365 ?auto_2709366 ) ) ( not ( = ?auto_2709365 ?auto_2709367 ) ) ( not ( = ?auto_2709365 ?auto_2709368 ) ) ( not ( = ?auto_2709365 ?auto_2709369 ) ) ( not ( = ?auto_2709365 ?auto_2709370 ) ) ( not ( = ?auto_2709365 ?auto_2709371 ) ) ( not ( = ?auto_2709365 ?auto_2709372 ) ) ( not ( = ?auto_2709365 ?auto_2709373 ) ) ( not ( = ?auto_2709365 ?auto_2709374 ) ) ( not ( = ?auto_2709365 ?auto_2709375 ) ) ( not ( = ?auto_2709365 ?auto_2709376 ) ) ( not ( = ?auto_2709365 ?auto_2709379 ) ) ( not ( = ?auto_2709366 ?auto_2709367 ) ) ( not ( = ?auto_2709366 ?auto_2709368 ) ) ( not ( = ?auto_2709366 ?auto_2709369 ) ) ( not ( = ?auto_2709366 ?auto_2709370 ) ) ( not ( = ?auto_2709366 ?auto_2709371 ) ) ( not ( = ?auto_2709366 ?auto_2709372 ) ) ( not ( = ?auto_2709366 ?auto_2709373 ) ) ( not ( = ?auto_2709366 ?auto_2709374 ) ) ( not ( = ?auto_2709366 ?auto_2709375 ) ) ( not ( = ?auto_2709366 ?auto_2709376 ) ) ( not ( = ?auto_2709366 ?auto_2709379 ) ) ( not ( = ?auto_2709367 ?auto_2709368 ) ) ( not ( = ?auto_2709367 ?auto_2709369 ) ) ( not ( = ?auto_2709367 ?auto_2709370 ) ) ( not ( = ?auto_2709367 ?auto_2709371 ) ) ( not ( = ?auto_2709367 ?auto_2709372 ) ) ( not ( = ?auto_2709367 ?auto_2709373 ) ) ( not ( = ?auto_2709367 ?auto_2709374 ) ) ( not ( = ?auto_2709367 ?auto_2709375 ) ) ( not ( = ?auto_2709367 ?auto_2709376 ) ) ( not ( = ?auto_2709367 ?auto_2709379 ) ) ( not ( = ?auto_2709368 ?auto_2709369 ) ) ( not ( = ?auto_2709368 ?auto_2709370 ) ) ( not ( = ?auto_2709368 ?auto_2709371 ) ) ( not ( = ?auto_2709368 ?auto_2709372 ) ) ( not ( = ?auto_2709368 ?auto_2709373 ) ) ( not ( = ?auto_2709368 ?auto_2709374 ) ) ( not ( = ?auto_2709368 ?auto_2709375 ) ) ( not ( = ?auto_2709368 ?auto_2709376 ) ) ( not ( = ?auto_2709368 ?auto_2709379 ) ) ( not ( = ?auto_2709369 ?auto_2709370 ) ) ( not ( = ?auto_2709369 ?auto_2709371 ) ) ( not ( = ?auto_2709369 ?auto_2709372 ) ) ( not ( = ?auto_2709369 ?auto_2709373 ) ) ( not ( = ?auto_2709369 ?auto_2709374 ) ) ( not ( = ?auto_2709369 ?auto_2709375 ) ) ( not ( = ?auto_2709369 ?auto_2709376 ) ) ( not ( = ?auto_2709369 ?auto_2709379 ) ) ( not ( = ?auto_2709370 ?auto_2709371 ) ) ( not ( = ?auto_2709370 ?auto_2709372 ) ) ( not ( = ?auto_2709370 ?auto_2709373 ) ) ( not ( = ?auto_2709370 ?auto_2709374 ) ) ( not ( = ?auto_2709370 ?auto_2709375 ) ) ( not ( = ?auto_2709370 ?auto_2709376 ) ) ( not ( = ?auto_2709370 ?auto_2709379 ) ) ( not ( = ?auto_2709371 ?auto_2709372 ) ) ( not ( = ?auto_2709371 ?auto_2709373 ) ) ( not ( = ?auto_2709371 ?auto_2709374 ) ) ( not ( = ?auto_2709371 ?auto_2709375 ) ) ( not ( = ?auto_2709371 ?auto_2709376 ) ) ( not ( = ?auto_2709371 ?auto_2709379 ) ) ( not ( = ?auto_2709372 ?auto_2709373 ) ) ( not ( = ?auto_2709372 ?auto_2709374 ) ) ( not ( = ?auto_2709372 ?auto_2709375 ) ) ( not ( = ?auto_2709372 ?auto_2709376 ) ) ( not ( = ?auto_2709372 ?auto_2709379 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2709373 ?auto_2709374 ?auto_2709375 )
      ( MAKE-10CRATE-VERIFY ?auto_2709365 ?auto_2709366 ?auto_2709367 ?auto_2709368 ?auto_2709369 ?auto_2709370 ?auto_2709371 ?auto_2709372 ?auto_2709373 ?auto_2709374 ?auto_2709375 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2709383 - SURFACE
      ?auto_2709384 - SURFACE
      ?auto_2709385 - SURFACE
      ?auto_2709386 - SURFACE
      ?auto_2709387 - SURFACE
      ?auto_2709388 - SURFACE
      ?auto_2709389 - SURFACE
      ?auto_2709390 - SURFACE
      ?auto_2709391 - SURFACE
      ?auto_2709392 - SURFACE
      ?auto_2709393 - SURFACE
      ?auto_2709394 - SURFACE
    )
    :vars
    (
      ?auto_2709400 - HOIST
      ?auto_2709401 - PLACE
      ?auto_2709396 - PLACE
      ?auto_2709397 - HOIST
      ?auto_2709395 - SURFACE
      ?auto_2709398 - SURFACE
      ?auto_2709399 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709400 ?auto_2709401 ) ( IS-CRATE ?auto_2709394 ) ( not ( = ?auto_2709393 ?auto_2709394 ) ) ( not ( = ?auto_2709392 ?auto_2709393 ) ) ( not ( = ?auto_2709392 ?auto_2709394 ) ) ( not ( = ?auto_2709396 ?auto_2709401 ) ) ( HOIST-AT ?auto_2709397 ?auto_2709396 ) ( not ( = ?auto_2709400 ?auto_2709397 ) ) ( SURFACE-AT ?auto_2709394 ?auto_2709396 ) ( ON ?auto_2709394 ?auto_2709395 ) ( CLEAR ?auto_2709394 ) ( not ( = ?auto_2709393 ?auto_2709395 ) ) ( not ( = ?auto_2709394 ?auto_2709395 ) ) ( not ( = ?auto_2709392 ?auto_2709395 ) ) ( SURFACE-AT ?auto_2709392 ?auto_2709401 ) ( CLEAR ?auto_2709392 ) ( IS-CRATE ?auto_2709393 ) ( AVAILABLE ?auto_2709400 ) ( AVAILABLE ?auto_2709397 ) ( SURFACE-AT ?auto_2709393 ?auto_2709396 ) ( ON ?auto_2709393 ?auto_2709398 ) ( CLEAR ?auto_2709393 ) ( not ( = ?auto_2709393 ?auto_2709398 ) ) ( not ( = ?auto_2709394 ?auto_2709398 ) ) ( not ( = ?auto_2709392 ?auto_2709398 ) ) ( not ( = ?auto_2709395 ?auto_2709398 ) ) ( TRUCK-AT ?auto_2709399 ?auto_2709401 ) ( ON ?auto_2709384 ?auto_2709383 ) ( ON ?auto_2709385 ?auto_2709384 ) ( ON ?auto_2709386 ?auto_2709385 ) ( ON ?auto_2709387 ?auto_2709386 ) ( ON ?auto_2709388 ?auto_2709387 ) ( ON ?auto_2709389 ?auto_2709388 ) ( ON ?auto_2709390 ?auto_2709389 ) ( ON ?auto_2709391 ?auto_2709390 ) ( ON ?auto_2709392 ?auto_2709391 ) ( not ( = ?auto_2709383 ?auto_2709384 ) ) ( not ( = ?auto_2709383 ?auto_2709385 ) ) ( not ( = ?auto_2709383 ?auto_2709386 ) ) ( not ( = ?auto_2709383 ?auto_2709387 ) ) ( not ( = ?auto_2709383 ?auto_2709388 ) ) ( not ( = ?auto_2709383 ?auto_2709389 ) ) ( not ( = ?auto_2709383 ?auto_2709390 ) ) ( not ( = ?auto_2709383 ?auto_2709391 ) ) ( not ( = ?auto_2709383 ?auto_2709392 ) ) ( not ( = ?auto_2709383 ?auto_2709393 ) ) ( not ( = ?auto_2709383 ?auto_2709394 ) ) ( not ( = ?auto_2709383 ?auto_2709395 ) ) ( not ( = ?auto_2709383 ?auto_2709398 ) ) ( not ( = ?auto_2709384 ?auto_2709385 ) ) ( not ( = ?auto_2709384 ?auto_2709386 ) ) ( not ( = ?auto_2709384 ?auto_2709387 ) ) ( not ( = ?auto_2709384 ?auto_2709388 ) ) ( not ( = ?auto_2709384 ?auto_2709389 ) ) ( not ( = ?auto_2709384 ?auto_2709390 ) ) ( not ( = ?auto_2709384 ?auto_2709391 ) ) ( not ( = ?auto_2709384 ?auto_2709392 ) ) ( not ( = ?auto_2709384 ?auto_2709393 ) ) ( not ( = ?auto_2709384 ?auto_2709394 ) ) ( not ( = ?auto_2709384 ?auto_2709395 ) ) ( not ( = ?auto_2709384 ?auto_2709398 ) ) ( not ( = ?auto_2709385 ?auto_2709386 ) ) ( not ( = ?auto_2709385 ?auto_2709387 ) ) ( not ( = ?auto_2709385 ?auto_2709388 ) ) ( not ( = ?auto_2709385 ?auto_2709389 ) ) ( not ( = ?auto_2709385 ?auto_2709390 ) ) ( not ( = ?auto_2709385 ?auto_2709391 ) ) ( not ( = ?auto_2709385 ?auto_2709392 ) ) ( not ( = ?auto_2709385 ?auto_2709393 ) ) ( not ( = ?auto_2709385 ?auto_2709394 ) ) ( not ( = ?auto_2709385 ?auto_2709395 ) ) ( not ( = ?auto_2709385 ?auto_2709398 ) ) ( not ( = ?auto_2709386 ?auto_2709387 ) ) ( not ( = ?auto_2709386 ?auto_2709388 ) ) ( not ( = ?auto_2709386 ?auto_2709389 ) ) ( not ( = ?auto_2709386 ?auto_2709390 ) ) ( not ( = ?auto_2709386 ?auto_2709391 ) ) ( not ( = ?auto_2709386 ?auto_2709392 ) ) ( not ( = ?auto_2709386 ?auto_2709393 ) ) ( not ( = ?auto_2709386 ?auto_2709394 ) ) ( not ( = ?auto_2709386 ?auto_2709395 ) ) ( not ( = ?auto_2709386 ?auto_2709398 ) ) ( not ( = ?auto_2709387 ?auto_2709388 ) ) ( not ( = ?auto_2709387 ?auto_2709389 ) ) ( not ( = ?auto_2709387 ?auto_2709390 ) ) ( not ( = ?auto_2709387 ?auto_2709391 ) ) ( not ( = ?auto_2709387 ?auto_2709392 ) ) ( not ( = ?auto_2709387 ?auto_2709393 ) ) ( not ( = ?auto_2709387 ?auto_2709394 ) ) ( not ( = ?auto_2709387 ?auto_2709395 ) ) ( not ( = ?auto_2709387 ?auto_2709398 ) ) ( not ( = ?auto_2709388 ?auto_2709389 ) ) ( not ( = ?auto_2709388 ?auto_2709390 ) ) ( not ( = ?auto_2709388 ?auto_2709391 ) ) ( not ( = ?auto_2709388 ?auto_2709392 ) ) ( not ( = ?auto_2709388 ?auto_2709393 ) ) ( not ( = ?auto_2709388 ?auto_2709394 ) ) ( not ( = ?auto_2709388 ?auto_2709395 ) ) ( not ( = ?auto_2709388 ?auto_2709398 ) ) ( not ( = ?auto_2709389 ?auto_2709390 ) ) ( not ( = ?auto_2709389 ?auto_2709391 ) ) ( not ( = ?auto_2709389 ?auto_2709392 ) ) ( not ( = ?auto_2709389 ?auto_2709393 ) ) ( not ( = ?auto_2709389 ?auto_2709394 ) ) ( not ( = ?auto_2709389 ?auto_2709395 ) ) ( not ( = ?auto_2709389 ?auto_2709398 ) ) ( not ( = ?auto_2709390 ?auto_2709391 ) ) ( not ( = ?auto_2709390 ?auto_2709392 ) ) ( not ( = ?auto_2709390 ?auto_2709393 ) ) ( not ( = ?auto_2709390 ?auto_2709394 ) ) ( not ( = ?auto_2709390 ?auto_2709395 ) ) ( not ( = ?auto_2709390 ?auto_2709398 ) ) ( not ( = ?auto_2709391 ?auto_2709392 ) ) ( not ( = ?auto_2709391 ?auto_2709393 ) ) ( not ( = ?auto_2709391 ?auto_2709394 ) ) ( not ( = ?auto_2709391 ?auto_2709395 ) ) ( not ( = ?auto_2709391 ?auto_2709398 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2709392 ?auto_2709393 ?auto_2709394 )
      ( MAKE-11CRATE-VERIFY ?auto_2709383 ?auto_2709384 ?auto_2709385 ?auto_2709386 ?auto_2709387 ?auto_2709388 ?auto_2709389 ?auto_2709390 ?auto_2709391 ?auto_2709392 ?auto_2709393 ?auto_2709394 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2709402 - SURFACE
      ?auto_2709403 - SURFACE
      ?auto_2709404 - SURFACE
      ?auto_2709405 - SURFACE
      ?auto_2709406 - SURFACE
      ?auto_2709407 - SURFACE
      ?auto_2709408 - SURFACE
      ?auto_2709409 - SURFACE
      ?auto_2709410 - SURFACE
      ?auto_2709411 - SURFACE
      ?auto_2709412 - SURFACE
      ?auto_2709413 - SURFACE
      ?auto_2709414 - SURFACE
    )
    :vars
    (
      ?auto_2709420 - HOIST
      ?auto_2709421 - PLACE
      ?auto_2709416 - PLACE
      ?auto_2709417 - HOIST
      ?auto_2709415 - SURFACE
      ?auto_2709418 - SURFACE
      ?auto_2709419 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709420 ?auto_2709421 ) ( IS-CRATE ?auto_2709414 ) ( not ( = ?auto_2709413 ?auto_2709414 ) ) ( not ( = ?auto_2709412 ?auto_2709413 ) ) ( not ( = ?auto_2709412 ?auto_2709414 ) ) ( not ( = ?auto_2709416 ?auto_2709421 ) ) ( HOIST-AT ?auto_2709417 ?auto_2709416 ) ( not ( = ?auto_2709420 ?auto_2709417 ) ) ( SURFACE-AT ?auto_2709414 ?auto_2709416 ) ( ON ?auto_2709414 ?auto_2709415 ) ( CLEAR ?auto_2709414 ) ( not ( = ?auto_2709413 ?auto_2709415 ) ) ( not ( = ?auto_2709414 ?auto_2709415 ) ) ( not ( = ?auto_2709412 ?auto_2709415 ) ) ( SURFACE-AT ?auto_2709412 ?auto_2709421 ) ( CLEAR ?auto_2709412 ) ( IS-CRATE ?auto_2709413 ) ( AVAILABLE ?auto_2709420 ) ( AVAILABLE ?auto_2709417 ) ( SURFACE-AT ?auto_2709413 ?auto_2709416 ) ( ON ?auto_2709413 ?auto_2709418 ) ( CLEAR ?auto_2709413 ) ( not ( = ?auto_2709413 ?auto_2709418 ) ) ( not ( = ?auto_2709414 ?auto_2709418 ) ) ( not ( = ?auto_2709412 ?auto_2709418 ) ) ( not ( = ?auto_2709415 ?auto_2709418 ) ) ( TRUCK-AT ?auto_2709419 ?auto_2709421 ) ( ON ?auto_2709403 ?auto_2709402 ) ( ON ?auto_2709404 ?auto_2709403 ) ( ON ?auto_2709405 ?auto_2709404 ) ( ON ?auto_2709406 ?auto_2709405 ) ( ON ?auto_2709407 ?auto_2709406 ) ( ON ?auto_2709408 ?auto_2709407 ) ( ON ?auto_2709409 ?auto_2709408 ) ( ON ?auto_2709410 ?auto_2709409 ) ( ON ?auto_2709411 ?auto_2709410 ) ( ON ?auto_2709412 ?auto_2709411 ) ( not ( = ?auto_2709402 ?auto_2709403 ) ) ( not ( = ?auto_2709402 ?auto_2709404 ) ) ( not ( = ?auto_2709402 ?auto_2709405 ) ) ( not ( = ?auto_2709402 ?auto_2709406 ) ) ( not ( = ?auto_2709402 ?auto_2709407 ) ) ( not ( = ?auto_2709402 ?auto_2709408 ) ) ( not ( = ?auto_2709402 ?auto_2709409 ) ) ( not ( = ?auto_2709402 ?auto_2709410 ) ) ( not ( = ?auto_2709402 ?auto_2709411 ) ) ( not ( = ?auto_2709402 ?auto_2709412 ) ) ( not ( = ?auto_2709402 ?auto_2709413 ) ) ( not ( = ?auto_2709402 ?auto_2709414 ) ) ( not ( = ?auto_2709402 ?auto_2709415 ) ) ( not ( = ?auto_2709402 ?auto_2709418 ) ) ( not ( = ?auto_2709403 ?auto_2709404 ) ) ( not ( = ?auto_2709403 ?auto_2709405 ) ) ( not ( = ?auto_2709403 ?auto_2709406 ) ) ( not ( = ?auto_2709403 ?auto_2709407 ) ) ( not ( = ?auto_2709403 ?auto_2709408 ) ) ( not ( = ?auto_2709403 ?auto_2709409 ) ) ( not ( = ?auto_2709403 ?auto_2709410 ) ) ( not ( = ?auto_2709403 ?auto_2709411 ) ) ( not ( = ?auto_2709403 ?auto_2709412 ) ) ( not ( = ?auto_2709403 ?auto_2709413 ) ) ( not ( = ?auto_2709403 ?auto_2709414 ) ) ( not ( = ?auto_2709403 ?auto_2709415 ) ) ( not ( = ?auto_2709403 ?auto_2709418 ) ) ( not ( = ?auto_2709404 ?auto_2709405 ) ) ( not ( = ?auto_2709404 ?auto_2709406 ) ) ( not ( = ?auto_2709404 ?auto_2709407 ) ) ( not ( = ?auto_2709404 ?auto_2709408 ) ) ( not ( = ?auto_2709404 ?auto_2709409 ) ) ( not ( = ?auto_2709404 ?auto_2709410 ) ) ( not ( = ?auto_2709404 ?auto_2709411 ) ) ( not ( = ?auto_2709404 ?auto_2709412 ) ) ( not ( = ?auto_2709404 ?auto_2709413 ) ) ( not ( = ?auto_2709404 ?auto_2709414 ) ) ( not ( = ?auto_2709404 ?auto_2709415 ) ) ( not ( = ?auto_2709404 ?auto_2709418 ) ) ( not ( = ?auto_2709405 ?auto_2709406 ) ) ( not ( = ?auto_2709405 ?auto_2709407 ) ) ( not ( = ?auto_2709405 ?auto_2709408 ) ) ( not ( = ?auto_2709405 ?auto_2709409 ) ) ( not ( = ?auto_2709405 ?auto_2709410 ) ) ( not ( = ?auto_2709405 ?auto_2709411 ) ) ( not ( = ?auto_2709405 ?auto_2709412 ) ) ( not ( = ?auto_2709405 ?auto_2709413 ) ) ( not ( = ?auto_2709405 ?auto_2709414 ) ) ( not ( = ?auto_2709405 ?auto_2709415 ) ) ( not ( = ?auto_2709405 ?auto_2709418 ) ) ( not ( = ?auto_2709406 ?auto_2709407 ) ) ( not ( = ?auto_2709406 ?auto_2709408 ) ) ( not ( = ?auto_2709406 ?auto_2709409 ) ) ( not ( = ?auto_2709406 ?auto_2709410 ) ) ( not ( = ?auto_2709406 ?auto_2709411 ) ) ( not ( = ?auto_2709406 ?auto_2709412 ) ) ( not ( = ?auto_2709406 ?auto_2709413 ) ) ( not ( = ?auto_2709406 ?auto_2709414 ) ) ( not ( = ?auto_2709406 ?auto_2709415 ) ) ( not ( = ?auto_2709406 ?auto_2709418 ) ) ( not ( = ?auto_2709407 ?auto_2709408 ) ) ( not ( = ?auto_2709407 ?auto_2709409 ) ) ( not ( = ?auto_2709407 ?auto_2709410 ) ) ( not ( = ?auto_2709407 ?auto_2709411 ) ) ( not ( = ?auto_2709407 ?auto_2709412 ) ) ( not ( = ?auto_2709407 ?auto_2709413 ) ) ( not ( = ?auto_2709407 ?auto_2709414 ) ) ( not ( = ?auto_2709407 ?auto_2709415 ) ) ( not ( = ?auto_2709407 ?auto_2709418 ) ) ( not ( = ?auto_2709408 ?auto_2709409 ) ) ( not ( = ?auto_2709408 ?auto_2709410 ) ) ( not ( = ?auto_2709408 ?auto_2709411 ) ) ( not ( = ?auto_2709408 ?auto_2709412 ) ) ( not ( = ?auto_2709408 ?auto_2709413 ) ) ( not ( = ?auto_2709408 ?auto_2709414 ) ) ( not ( = ?auto_2709408 ?auto_2709415 ) ) ( not ( = ?auto_2709408 ?auto_2709418 ) ) ( not ( = ?auto_2709409 ?auto_2709410 ) ) ( not ( = ?auto_2709409 ?auto_2709411 ) ) ( not ( = ?auto_2709409 ?auto_2709412 ) ) ( not ( = ?auto_2709409 ?auto_2709413 ) ) ( not ( = ?auto_2709409 ?auto_2709414 ) ) ( not ( = ?auto_2709409 ?auto_2709415 ) ) ( not ( = ?auto_2709409 ?auto_2709418 ) ) ( not ( = ?auto_2709410 ?auto_2709411 ) ) ( not ( = ?auto_2709410 ?auto_2709412 ) ) ( not ( = ?auto_2709410 ?auto_2709413 ) ) ( not ( = ?auto_2709410 ?auto_2709414 ) ) ( not ( = ?auto_2709410 ?auto_2709415 ) ) ( not ( = ?auto_2709410 ?auto_2709418 ) ) ( not ( = ?auto_2709411 ?auto_2709412 ) ) ( not ( = ?auto_2709411 ?auto_2709413 ) ) ( not ( = ?auto_2709411 ?auto_2709414 ) ) ( not ( = ?auto_2709411 ?auto_2709415 ) ) ( not ( = ?auto_2709411 ?auto_2709418 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2709412 ?auto_2709413 ?auto_2709414 )
      ( MAKE-12CRATE-VERIFY ?auto_2709402 ?auto_2709403 ?auto_2709404 ?auto_2709405 ?auto_2709406 ?auto_2709407 ?auto_2709408 ?auto_2709409 ?auto_2709410 ?auto_2709411 ?auto_2709412 ?auto_2709413 ?auto_2709414 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2709422 - SURFACE
      ?auto_2709423 - SURFACE
      ?auto_2709424 - SURFACE
      ?auto_2709425 - SURFACE
      ?auto_2709426 - SURFACE
      ?auto_2709427 - SURFACE
      ?auto_2709428 - SURFACE
      ?auto_2709429 - SURFACE
      ?auto_2709430 - SURFACE
      ?auto_2709431 - SURFACE
      ?auto_2709432 - SURFACE
      ?auto_2709433 - SURFACE
      ?auto_2709434 - SURFACE
      ?auto_2709435 - SURFACE
    )
    :vars
    (
      ?auto_2709441 - HOIST
      ?auto_2709442 - PLACE
      ?auto_2709437 - PLACE
      ?auto_2709438 - HOIST
      ?auto_2709436 - SURFACE
      ?auto_2709439 - SURFACE
      ?auto_2709440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709441 ?auto_2709442 ) ( IS-CRATE ?auto_2709435 ) ( not ( = ?auto_2709434 ?auto_2709435 ) ) ( not ( = ?auto_2709433 ?auto_2709434 ) ) ( not ( = ?auto_2709433 ?auto_2709435 ) ) ( not ( = ?auto_2709437 ?auto_2709442 ) ) ( HOIST-AT ?auto_2709438 ?auto_2709437 ) ( not ( = ?auto_2709441 ?auto_2709438 ) ) ( SURFACE-AT ?auto_2709435 ?auto_2709437 ) ( ON ?auto_2709435 ?auto_2709436 ) ( CLEAR ?auto_2709435 ) ( not ( = ?auto_2709434 ?auto_2709436 ) ) ( not ( = ?auto_2709435 ?auto_2709436 ) ) ( not ( = ?auto_2709433 ?auto_2709436 ) ) ( SURFACE-AT ?auto_2709433 ?auto_2709442 ) ( CLEAR ?auto_2709433 ) ( IS-CRATE ?auto_2709434 ) ( AVAILABLE ?auto_2709441 ) ( AVAILABLE ?auto_2709438 ) ( SURFACE-AT ?auto_2709434 ?auto_2709437 ) ( ON ?auto_2709434 ?auto_2709439 ) ( CLEAR ?auto_2709434 ) ( not ( = ?auto_2709434 ?auto_2709439 ) ) ( not ( = ?auto_2709435 ?auto_2709439 ) ) ( not ( = ?auto_2709433 ?auto_2709439 ) ) ( not ( = ?auto_2709436 ?auto_2709439 ) ) ( TRUCK-AT ?auto_2709440 ?auto_2709442 ) ( ON ?auto_2709423 ?auto_2709422 ) ( ON ?auto_2709424 ?auto_2709423 ) ( ON ?auto_2709425 ?auto_2709424 ) ( ON ?auto_2709426 ?auto_2709425 ) ( ON ?auto_2709427 ?auto_2709426 ) ( ON ?auto_2709428 ?auto_2709427 ) ( ON ?auto_2709429 ?auto_2709428 ) ( ON ?auto_2709430 ?auto_2709429 ) ( ON ?auto_2709431 ?auto_2709430 ) ( ON ?auto_2709432 ?auto_2709431 ) ( ON ?auto_2709433 ?auto_2709432 ) ( not ( = ?auto_2709422 ?auto_2709423 ) ) ( not ( = ?auto_2709422 ?auto_2709424 ) ) ( not ( = ?auto_2709422 ?auto_2709425 ) ) ( not ( = ?auto_2709422 ?auto_2709426 ) ) ( not ( = ?auto_2709422 ?auto_2709427 ) ) ( not ( = ?auto_2709422 ?auto_2709428 ) ) ( not ( = ?auto_2709422 ?auto_2709429 ) ) ( not ( = ?auto_2709422 ?auto_2709430 ) ) ( not ( = ?auto_2709422 ?auto_2709431 ) ) ( not ( = ?auto_2709422 ?auto_2709432 ) ) ( not ( = ?auto_2709422 ?auto_2709433 ) ) ( not ( = ?auto_2709422 ?auto_2709434 ) ) ( not ( = ?auto_2709422 ?auto_2709435 ) ) ( not ( = ?auto_2709422 ?auto_2709436 ) ) ( not ( = ?auto_2709422 ?auto_2709439 ) ) ( not ( = ?auto_2709423 ?auto_2709424 ) ) ( not ( = ?auto_2709423 ?auto_2709425 ) ) ( not ( = ?auto_2709423 ?auto_2709426 ) ) ( not ( = ?auto_2709423 ?auto_2709427 ) ) ( not ( = ?auto_2709423 ?auto_2709428 ) ) ( not ( = ?auto_2709423 ?auto_2709429 ) ) ( not ( = ?auto_2709423 ?auto_2709430 ) ) ( not ( = ?auto_2709423 ?auto_2709431 ) ) ( not ( = ?auto_2709423 ?auto_2709432 ) ) ( not ( = ?auto_2709423 ?auto_2709433 ) ) ( not ( = ?auto_2709423 ?auto_2709434 ) ) ( not ( = ?auto_2709423 ?auto_2709435 ) ) ( not ( = ?auto_2709423 ?auto_2709436 ) ) ( not ( = ?auto_2709423 ?auto_2709439 ) ) ( not ( = ?auto_2709424 ?auto_2709425 ) ) ( not ( = ?auto_2709424 ?auto_2709426 ) ) ( not ( = ?auto_2709424 ?auto_2709427 ) ) ( not ( = ?auto_2709424 ?auto_2709428 ) ) ( not ( = ?auto_2709424 ?auto_2709429 ) ) ( not ( = ?auto_2709424 ?auto_2709430 ) ) ( not ( = ?auto_2709424 ?auto_2709431 ) ) ( not ( = ?auto_2709424 ?auto_2709432 ) ) ( not ( = ?auto_2709424 ?auto_2709433 ) ) ( not ( = ?auto_2709424 ?auto_2709434 ) ) ( not ( = ?auto_2709424 ?auto_2709435 ) ) ( not ( = ?auto_2709424 ?auto_2709436 ) ) ( not ( = ?auto_2709424 ?auto_2709439 ) ) ( not ( = ?auto_2709425 ?auto_2709426 ) ) ( not ( = ?auto_2709425 ?auto_2709427 ) ) ( not ( = ?auto_2709425 ?auto_2709428 ) ) ( not ( = ?auto_2709425 ?auto_2709429 ) ) ( not ( = ?auto_2709425 ?auto_2709430 ) ) ( not ( = ?auto_2709425 ?auto_2709431 ) ) ( not ( = ?auto_2709425 ?auto_2709432 ) ) ( not ( = ?auto_2709425 ?auto_2709433 ) ) ( not ( = ?auto_2709425 ?auto_2709434 ) ) ( not ( = ?auto_2709425 ?auto_2709435 ) ) ( not ( = ?auto_2709425 ?auto_2709436 ) ) ( not ( = ?auto_2709425 ?auto_2709439 ) ) ( not ( = ?auto_2709426 ?auto_2709427 ) ) ( not ( = ?auto_2709426 ?auto_2709428 ) ) ( not ( = ?auto_2709426 ?auto_2709429 ) ) ( not ( = ?auto_2709426 ?auto_2709430 ) ) ( not ( = ?auto_2709426 ?auto_2709431 ) ) ( not ( = ?auto_2709426 ?auto_2709432 ) ) ( not ( = ?auto_2709426 ?auto_2709433 ) ) ( not ( = ?auto_2709426 ?auto_2709434 ) ) ( not ( = ?auto_2709426 ?auto_2709435 ) ) ( not ( = ?auto_2709426 ?auto_2709436 ) ) ( not ( = ?auto_2709426 ?auto_2709439 ) ) ( not ( = ?auto_2709427 ?auto_2709428 ) ) ( not ( = ?auto_2709427 ?auto_2709429 ) ) ( not ( = ?auto_2709427 ?auto_2709430 ) ) ( not ( = ?auto_2709427 ?auto_2709431 ) ) ( not ( = ?auto_2709427 ?auto_2709432 ) ) ( not ( = ?auto_2709427 ?auto_2709433 ) ) ( not ( = ?auto_2709427 ?auto_2709434 ) ) ( not ( = ?auto_2709427 ?auto_2709435 ) ) ( not ( = ?auto_2709427 ?auto_2709436 ) ) ( not ( = ?auto_2709427 ?auto_2709439 ) ) ( not ( = ?auto_2709428 ?auto_2709429 ) ) ( not ( = ?auto_2709428 ?auto_2709430 ) ) ( not ( = ?auto_2709428 ?auto_2709431 ) ) ( not ( = ?auto_2709428 ?auto_2709432 ) ) ( not ( = ?auto_2709428 ?auto_2709433 ) ) ( not ( = ?auto_2709428 ?auto_2709434 ) ) ( not ( = ?auto_2709428 ?auto_2709435 ) ) ( not ( = ?auto_2709428 ?auto_2709436 ) ) ( not ( = ?auto_2709428 ?auto_2709439 ) ) ( not ( = ?auto_2709429 ?auto_2709430 ) ) ( not ( = ?auto_2709429 ?auto_2709431 ) ) ( not ( = ?auto_2709429 ?auto_2709432 ) ) ( not ( = ?auto_2709429 ?auto_2709433 ) ) ( not ( = ?auto_2709429 ?auto_2709434 ) ) ( not ( = ?auto_2709429 ?auto_2709435 ) ) ( not ( = ?auto_2709429 ?auto_2709436 ) ) ( not ( = ?auto_2709429 ?auto_2709439 ) ) ( not ( = ?auto_2709430 ?auto_2709431 ) ) ( not ( = ?auto_2709430 ?auto_2709432 ) ) ( not ( = ?auto_2709430 ?auto_2709433 ) ) ( not ( = ?auto_2709430 ?auto_2709434 ) ) ( not ( = ?auto_2709430 ?auto_2709435 ) ) ( not ( = ?auto_2709430 ?auto_2709436 ) ) ( not ( = ?auto_2709430 ?auto_2709439 ) ) ( not ( = ?auto_2709431 ?auto_2709432 ) ) ( not ( = ?auto_2709431 ?auto_2709433 ) ) ( not ( = ?auto_2709431 ?auto_2709434 ) ) ( not ( = ?auto_2709431 ?auto_2709435 ) ) ( not ( = ?auto_2709431 ?auto_2709436 ) ) ( not ( = ?auto_2709431 ?auto_2709439 ) ) ( not ( = ?auto_2709432 ?auto_2709433 ) ) ( not ( = ?auto_2709432 ?auto_2709434 ) ) ( not ( = ?auto_2709432 ?auto_2709435 ) ) ( not ( = ?auto_2709432 ?auto_2709436 ) ) ( not ( = ?auto_2709432 ?auto_2709439 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2709433 ?auto_2709434 ?auto_2709435 )
      ( MAKE-13CRATE-VERIFY ?auto_2709422 ?auto_2709423 ?auto_2709424 ?auto_2709425 ?auto_2709426 ?auto_2709427 ?auto_2709428 ?auto_2709429 ?auto_2709430 ?auto_2709431 ?auto_2709432 ?auto_2709433 ?auto_2709434 ?auto_2709435 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2709501 - SURFACE
      ?auto_2709502 - SURFACE
      ?auto_2709503 - SURFACE
      ?auto_2709504 - SURFACE
      ?auto_2709505 - SURFACE
      ?auto_2709506 - SURFACE
      ?auto_2709507 - SURFACE
    )
    :vars
    (
      ?auto_2709513 - HOIST
      ?auto_2709508 - PLACE
      ?auto_2709511 - PLACE
      ?auto_2709509 - HOIST
      ?auto_2709510 - SURFACE
      ?auto_2709514 - SURFACE
      ?auto_2709512 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709513 ?auto_2709508 ) ( IS-CRATE ?auto_2709507 ) ( not ( = ?auto_2709506 ?auto_2709507 ) ) ( not ( = ?auto_2709505 ?auto_2709506 ) ) ( not ( = ?auto_2709505 ?auto_2709507 ) ) ( not ( = ?auto_2709511 ?auto_2709508 ) ) ( HOIST-AT ?auto_2709509 ?auto_2709511 ) ( not ( = ?auto_2709513 ?auto_2709509 ) ) ( SURFACE-AT ?auto_2709507 ?auto_2709511 ) ( ON ?auto_2709507 ?auto_2709510 ) ( CLEAR ?auto_2709507 ) ( not ( = ?auto_2709506 ?auto_2709510 ) ) ( not ( = ?auto_2709507 ?auto_2709510 ) ) ( not ( = ?auto_2709505 ?auto_2709510 ) ) ( IS-CRATE ?auto_2709506 ) ( AVAILABLE ?auto_2709509 ) ( SURFACE-AT ?auto_2709506 ?auto_2709511 ) ( ON ?auto_2709506 ?auto_2709514 ) ( CLEAR ?auto_2709506 ) ( not ( = ?auto_2709506 ?auto_2709514 ) ) ( not ( = ?auto_2709507 ?auto_2709514 ) ) ( not ( = ?auto_2709505 ?auto_2709514 ) ) ( not ( = ?auto_2709510 ?auto_2709514 ) ) ( TRUCK-AT ?auto_2709512 ?auto_2709508 ) ( SURFACE-AT ?auto_2709504 ?auto_2709508 ) ( CLEAR ?auto_2709504 ) ( LIFTING ?auto_2709513 ?auto_2709505 ) ( IS-CRATE ?auto_2709505 ) ( not ( = ?auto_2709504 ?auto_2709505 ) ) ( not ( = ?auto_2709506 ?auto_2709504 ) ) ( not ( = ?auto_2709507 ?auto_2709504 ) ) ( not ( = ?auto_2709510 ?auto_2709504 ) ) ( not ( = ?auto_2709514 ?auto_2709504 ) ) ( ON ?auto_2709502 ?auto_2709501 ) ( ON ?auto_2709503 ?auto_2709502 ) ( ON ?auto_2709504 ?auto_2709503 ) ( not ( = ?auto_2709501 ?auto_2709502 ) ) ( not ( = ?auto_2709501 ?auto_2709503 ) ) ( not ( = ?auto_2709501 ?auto_2709504 ) ) ( not ( = ?auto_2709501 ?auto_2709505 ) ) ( not ( = ?auto_2709501 ?auto_2709506 ) ) ( not ( = ?auto_2709501 ?auto_2709507 ) ) ( not ( = ?auto_2709501 ?auto_2709510 ) ) ( not ( = ?auto_2709501 ?auto_2709514 ) ) ( not ( = ?auto_2709502 ?auto_2709503 ) ) ( not ( = ?auto_2709502 ?auto_2709504 ) ) ( not ( = ?auto_2709502 ?auto_2709505 ) ) ( not ( = ?auto_2709502 ?auto_2709506 ) ) ( not ( = ?auto_2709502 ?auto_2709507 ) ) ( not ( = ?auto_2709502 ?auto_2709510 ) ) ( not ( = ?auto_2709502 ?auto_2709514 ) ) ( not ( = ?auto_2709503 ?auto_2709504 ) ) ( not ( = ?auto_2709503 ?auto_2709505 ) ) ( not ( = ?auto_2709503 ?auto_2709506 ) ) ( not ( = ?auto_2709503 ?auto_2709507 ) ) ( not ( = ?auto_2709503 ?auto_2709510 ) ) ( not ( = ?auto_2709503 ?auto_2709514 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2709505 ?auto_2709506 ?auto_2709507 )
      ( MAKE-6CRATE-VERIFY ?auto_2709501 ?auto_2709502 ?auto_2709503 ?auto_2709504 ?auto_2709505 ?auto_2709506 ?auto_2709507 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2709515 - SURFACE
      ?auto_2709516 - SURFACE
      ?auto_2709517 - SURFACE
      ?auto_2709518 - SURFACE
      ?auto_2709519 - SURFACE
      ?auto_2709520 - SURFACE
      ?auto_2709521 - SURFACE
      ?auto_2709522 - SURFACE
    )
    :vars
    (
      ?auto_2709528 - HOIST
      ?auto_2709523 - PLACE
      ?auto_2709526 - PLACE
      ?auto_2709524 - HOIST
      ?auto_2709525 - SURFACE
      ?auto_2709529 - SURFACE
      ?auto_2709527 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709528 ?auto_2709523 ) ( IS-CRATE ?auto_2709522 ) ( not ( = ?auto_2709521 ?auto_2709522 ) ) ( not ( = ?auto_2709520 ?auto_2709521 ) ) ( not ( = ?auto_2709520 ?auto_2709522 ) ) ( not ( = ?auto_2709526 ?auto_2709523 ) ) ( HOIST-AT ?auto_2709524 ?auto_2709526 ) ( not ( = ?auto_2709528 ?auto_2709524 ) ) ( SURFACE-AT ?auto_2709522 ?auto_2709526 ) ( ON ?auto_2709522 ?auto_2709525 ) ( CLEAR ?auto_2709522 ) ( not ( = ?auto_2709521 ?auto_2709525 ) ) ( not ( = ?auto_2709522 ?auto_2709525 ) ) ( not ( = ?auto_2709520 ?auto_2709525 ) ) ( IS-CRATE ?auto_2709521 ) ( AVAILABLE ?auto_2709524 ) ( SURFACE-AT ?auto_2709521 ?auto_2709526 ) ( ON ?auto_2709521 ?auto_2709529 ) ( CLEAR ?auto_2709521 ) ( not ( = ?auto_2709521 ?auto_2709529 ) ) ( not ( = ?auto_2709522 ?auto_2709529 ) ) ( not ( = ?auto_2709520 ?auto_2709529 ) ) ( not ( = ?auto_2709525 ?auto_2709529 ) ) ( TRUCK-AT ?auto_2709527 ?auto_2709523 ) ( SURFACE-AT ?auto_2709519 ?auto_2709523 ) ( CLEAR ?auto_2709519 ) ( LIFTING ?auto_2709528 ?auto_2709520 ) ( IS-CRATE ?auto_2709520 ) ( not ( = ?auto_2709519 ?auto_2709520 ) ) ( not ( = ?auto_2709521 ?auto_2709519 ) ) ( not ( = ?auto_2709522 ?auto_2709519 ) ) ( not ( = ?auto_2709525 ?auto_2709519 ) ) ( not ( = ?auto_2709529 ?auto_2709519 ) ) ( ON ?auto_2709516 ?auto_2709515 ) ( ON ?auto_2709517 ?auto_2709516 ) ( ON ?auto_2709518 ?auto_2709517 ) ( ON ?auto_2709519 ?auto_2709518 ) ( not ( = ?auto_2709515 ?auto_2709516 ) ) ( not ( = ?auto_2709515 ?auto_2709517 ) ) ( not ( = ?auto_2709515 ?auto_2709518 ) ) ( not ( = ?auto_2709515 ?auto_2709519 ) ) ( not ( = ?auto_2709515 ?auto_2709520 ) ) ( not ( = ?auto_2709515 ?auto_2709521 ) ) ( not ( = ?auto_2709515 ?auto_2709522 ) ) ( not ( = ?auto_2709515 ?auto_2709525 ) ) ( not ( = ?auto_2709515 ?auto_2709529 ) ) ( not ( = ?auto_2709516 ?auto_2709517 ) ) ( not ( = ?auto_2709516 ?auto_2709518 ) ) ( not ( = ?auto_2709516 ?auto_2709519 ) ) ( not ( = ?auto_2709516 ?auto_2709520 ) ) ( not ( = ?auto_2709516 ?auto_2709521 ) ) ( not ( = ?auto_2709516 ?auto_2709522 ) ) ( not ( = ?auto_2709516 ?auto_2709525 ) ) ( not ( = ?auto_2709516 ?auto_2709529 ) ) ( not ( = ?auto_2709517 ?auto_2709518 ) ) ( not ( = ?auto_2709517 ?auto_2709519 ) ) ( not ( = ?auto_2709517 ?auto_2709520 ) ) ( not ( = ?auto_2709517 ?auto_2709521 ) ) ( not ( = ?auto_2709517 ?auto_2709522 ) ) ( not ( = ?auto_2709517 ?auto_2709525 ) ) ( not ( = ?auto_2709517 ?auto_2709529 ) ) ( not ( = ?auto_2709518 ?auto_2709519 ) ) ( not ( = ?auto_2709518 ?auto_2709520 ) ) ( not ( = ?auto_2709518 ?auto_2709521 ) ) ( not ( = ?auto_2709518 ?auto_2709522 ) ) ( not ( = ?auto_2709518 ?auto_2709525 ) ) ( not ( = ?auto_2709518 ?auto_2709529 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2709520 ?auto_2709521 ?auto_2709522 )
      ( MAKE-7CRATE-VERIFY ?auto_2709515 ?auto_2709516 ?auto_2709517 ?auto_2709518 ?auto_2709519 ?auto_2709520 ?auto_2709521 ?auto_2709522 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2709530 - SURFACE
      ?auto_2709531 - SURFACE
      ?auto_2709532 - SURFACE
      ?auto_2709533 - SURFACE
      ?auto_2709534 - SURFACE
      ?auto_2709535 - SURFACE
      ?auto_2709536 - SURFACE
      ?auto_2709537 - SURFACE
      ?auto_2709538 - SURFACE
    )
    :vars
    (
      ?auto_2709544 - HOIST
      ?auto_2709539 - PLACE
      ?auto_2709542 - PLACE
      ?auto_2709540 - HOIST
      ?auto_2709541 - SURFACE
      ?auto_2709545 - SURFACE
      ?auto_2709543 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709544 ?auto_2709539 ) ( IS-CRATE ?auto_2709538 ) ( not ( = ?auto_2709537 ?auto_2709538 ) ) ( not ( = ?auto_2709536 ?auto_2709537 ) ) ( not ( = ?auto_2709536 ?auto_2709538 ) ) ( not ( = ?auto_2709542 ?auto_2709539 ) ) ( HOIST-AT ?auto_2709540 ?auto_2709542 ) ( not ( = ?auto_2709544 ?auto_2709540 ) ) ( SURFACE-AT ?auto_2709538 ?auto_2709542 ) ( ON ?auto_2709538 ?auto_2709541 ) ( CLEAR ?auto_2709538 ) ( not ( = ?auto_2709537 ?auto_2709541 ) ) ( not ( = ?auto_2709538 ?auto_2709541 ) ) ( not ( = ?auto_2709536 ?auto_2709541 ) ) ( IS-CRATE ?auto_2709537 ) ( AVAILABLE ?auto_2709540 ) ( SURFACE-AT ?auto_2709537 ?auto_2709542 ) ( ON ?auto_2709537 ?auto_2709545 ) ( CLEAR ?auto_2709537 ) ( not ( = ?auto_2709537 ?auto_2709545 ) ) ( not ( = ?auto_2709538 ?auto_2709545 ) ) ( not ( = ?auto_2709536 ?auto_2709545 ) ) ( not ( = ?auto_2709541 ?auto_2709545 ) ) ( TRUCK-AT ?auto_2709543 ?auto_2709539 ) ( SURFACE-AT ?auto_2709535 ?auto_2709539 ) ( CLEAR ?auto_2709535 ) ( LIFTING ?auto_2709544 ?auto_2709536 ) ( IS-CRATE ?auto_2709536 ) ( not ( = ?auto_2709535 ?auto_2709536 ) ) ( not ( = ?auto_2709537 ?auto_2709535 ) ) ( not ( = ?auto_2709538 ?auto_2709535 ) ) ( not ( = ?auto_2709541 ?auto_2709535 ) ) ( not ( = ?auto_2709545 ?auto_2709535 ) ) ( ON ?auto_2709531 ?auto_2709530 ) ( ON ?auto_2709532 ?auto_2709531 ) ( ON ?auto_2709533 ?auto_2709532 ) ( ON ?auto_2709534 ?auto_2709533 ) ( ON ?auto_2709535 ?auto_2709534 ) ( not ( = ?auto_2709530 ?auto_2709531 ) ) ( not ( = ?auto_2709530 ?auto_2709532 ) ) ( not ( = ?auto_2709530 ?auto_2709533 ) ) ( not ( = ?auto_2709530 ?auto_2709534 ) ) ( not ( = ?auto_2709530 ?auto_2709535 ) ) ( not ( = ?auto_2709530 ?auto_2709536 ) ) ( not ( = ?auto_2709530 ?auto_2709537 ) ) ( not ( = ?auto_2709530 ?auto_2709538 ) ) ( not ( = ?auto_2709530 ?auto_2709541 ) ) ( not ( = ?auto_2709530 ?auto_2709545 ) ) ( not ( = ?auto_2709531 ?auto_2709532 ) ) ( not ( = ?auto_2709531 ?auto_2709533 ) ) ( not ( = ?auto_2709531 ?auto_2709534 ) ) ( not ( = ?auto_2709531 ?auto_2709535 ) ) ( not ( = ?auto_2709531 ?auto_2709536 ) ) ( not ( = ?auto_2709531 ?auto_2709537 ) ) ( not ( = ?auto_2709531 ?auto_2709538 ) ) ( not ( = ?auto_2709531 ?auto_2709541 ) ) ( not ( = ?auto_2709531 ?auto_2709545 ) ) ( not ( = ?auto_2709532 ?auto_2709533 ) ) ( not ( = ?auto_2709532 ?auto_2709534 ) ) ( not ( = ?auto_2709532 ?auto_2709535 ) ) ( not ( = ?auto_2709532 ?auto_2709536 ) ) ( not ( = ?auto_2709532 ?auto_2709537 ) ) ( not ( = ?auto_2709532 ?auto_2709538 ) ) ( not ( = ?auto_2709532 ?auto_2709541 ) ) ( not ( = ?auto_2709532 ?auto_2709545 ) ) ( not ( = ?auto_2709533 ?auto_2709534 ) ) ( not ( = ?auto_2709533 ?auto_2709535 ) ) ( not ( = ?auto_2709533 ?auto_2709536 ) ) ( not ( = ?auto_2709533 ?auto_2709537 ) ) ( not ( = ?auto_2709533 ?auto_2709538 ) ) ( not ( = ?auto_2709533 ?auto_2709541 ) ) ( not ( = ?auto_2709533 ?auto_2709545 ) ) ( not ( = ?auto_2709534 ?auto_2709535 ) ) ( not ( = ?auto_2709534 ?auto_2709536 ) ) ( not ( = ?auto_2709534 ?auto_2709537 ) ) ( not ( = ?auto_2709534 ?auto_2709538 ) ) ( not ( = ?auto_2709534 ?auto_2709541 ) ) ( not ( = ?auto_2709534 ?auto_2709545 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2709536 ?auto_2709537 ?auto_2709538 )
      ( MAKE-8CRATE-VERIFY ?auto_2709530 ?auto_2709531 ?auto_2709532 ?auto_2709533 ?auto_2709534 ?auto_2709535 ?auto_2709536 ?auto_2709537 ?auto_2709538 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2709546 - SURFACE
      ?auto_2709547 - SURFACE
      ?auto_2709548 - SURFACE
      ?auto_2709549 - SURFACE
      ?auto_2709550 - SURFACE
      ?auto_2709551 - SURFACE
      ?auto_2709552 - SURFACE
      ?auto_2709553 - SURFACE
      ?auto_2709554 - SURFACE
      ?auto_2709555 - SURFACE
    )
    :vars
    (
      ?auto_2709561 - HOIST
      ?auto_2709556 - PLACE
      ?auto_2709559 - PLACE
      ?auto_2709557 - HOIST
      ?auto_2709558 - SURFACE
      ?auto_2709562 - SURFACE
      ?auto_2709560 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709561 ?auto_2709556 ) ( IS-CRATE ?auto_2709555 ) ( not ( = ?auto_2709554 ?auto_2709555 ) ) ( not ( = ?auto_2709553 ?auto_2709554 ) ) ( not ( = ?auto_2709553 ?auto_2709555 ) ) ( not ( = ?auto_2709559 ?auto_2709556 ) ) ( HOIST-AT ?auto_2709557 ?auto_2709559 ) ( not ( = ?auto_2709561 ?auto_2709557 ) ) ( SURFACE-AT ?auto_2709555 ?auto_2709559 ) ( ON ?auto_2709555 ?auto_2709558 ) ( CLEAR ?auto_2709555 ) ( not ( = ?auto_2709554 ?auto_2709558 ) ) ( not ( = ?auto_2709555 ?auto_2709558 ) ) ( not ( = ?auto_2709553 ?auto_2709558 ) ) ( IS-CRATE ?auto_2709554 ) ( AVAILABLE ?auto_2709557 ) ( SURFACE-AT ?auto_2709554 ?auto_2709559 ) ( ON ?auto_2709554 ?auto_2709562 ) ( CLEAR ?auto_2709554 ) ( not ( = ?auto_2709554 ?auto_2709562 ) ) ( not ( = ?auto_2709555 ?auto_2709562 ) ) ( not ( = ?auto_2709553 ?auto_2709562 ) ) ( not ( = ?auto_2709558 ?auto_2709562 ) ) ( TRUCK-AT ?auto_2709560 ?auto_2709556 ) ( SURFACE-AT ?auto_2709552 ?auto_2709556 ) ( CLEAR ?auto_2709552 ) ( LIFTING ?auto_2709561 ?auto_2709553 ) ( IS-CRATE ?auto_2709553 ) ( not ( = ?auto_2709552 ?auto_2709553 ) ) ( not ( = ?auto_2709554 ?auto_2709552 ) ) ( not ( = ?auto_2709555 ?auto_2709552 ) ) ( not ( = ?auto_2709558 ?auto_2709552 ) ) ( not ( = ?auto_2709562 ?auto_2709552 ) ) ( ON ?auto_2709547 ?auto_2709546 ) ( ON ?auto_2709548 ?auto_2709547 ) ( ON ?auto_2709549 ?auto_2709548 ) ( ON ?auto_2709550 ?auto_2709549 ) ( ON ?auto_2709551 ?auto_2709550 ) ( ON ?auto_2709552 ?auto_2709551 ) ( not ( = ?auto_2709546 ?auto_2709547 ) ) ( not ( = ?auto_2709546 ?auto_2709548 ) ) ( not ( = ?auto_2709546 ?auto_2709549 ) ) ( not ( = ?auto_2709546 ?auto_2709550 ) ) ( not ( = ?auto_2709546 ?auto_2709551 ) ) ( not ( = ?auto_2709546 ?auto_2709552 ) ) ( not ( = ?auto_2709546 ?auto_2709553 ) ) ( not ( = ?auto_2709546 ?auto_2709554 ) ) ( not ( = ?auto_2709546 ?auto_2709555 ) ) ( not ( = ?auto_2709546 ?auto_2709558 ) ) ( not ( = ?auto_2709546 ?auto_2709562 ) ) ( not ( = ?auto_2709547 ?auto_2709548 ) ) ( not ( = ?auto_2709547 ?auto_2709549 ) ) ( not ( = ?auto_2709547 ?auto_2709550 ) ) ( not ( = ?auto_2709547 ?auto_2709551 ) ) ( not ( = ?auto_2709547 ?auto_2709552 ) ) ( not ( = ?auto_2709547 ?auto_2709553 ) ) ( not ( = ?auto_2709547 ?auto_2709554 ) ) ( not ( = ?auto_2709547 ?auto_2709555 ) ) ( not ( = ?auto_2709547 ?auto_2709558 ) ) ( not ( = ?auto_2709547 ?auto_2709562 ) ) ( not ( = ?auto_2709548 ?auto_2709549 ) ) ( not ( = ?auto_2709548 ?auto_2709550 ) ) ( not ( = ?auto_2709548 ?auto_2709551 ) ) ( not ( = ?auto_2709548 ?auto_2709552 ) ) ( not ( = ?auto_2709548 ?auto_2709553 ) ) ( not ( = ?auto_2709548 ?auto_2709554 ) ) ( not ( = ?auto_2709548 ?auto_2709555 ) ) ( not ( = ?auto_2709548 ?auto_2709558 ) ) ( not ( = ?auto_2709548 ?auto_2709562 ) ) ( not ( = ?auto_2709549 ?auto_2709550 ) ) ( not ( = ?auto_2709549 ?auto_2709551 ) ) ( not ( = ?auto_2709549 ?auto_2709552 ) ) ( not ( = ?auto_2709549 ?auto_2709553 ) ) ( not ( = ?auto_2709549 ?auto_2709554 ) ) ( not ( = ?auto_2709549 ?auto_2709555 ) ) ( not ( = ?auto_2709549 ?auto_2709558 ) ) ( not ( = ?auto_2709549 ?auto_2709562 ) ) ( not ( = ?auto_2709550 ?auto_2709551 ) ) ( not ( = ?auto_2709550 ?auto_2709552 ) ) ( not ( = ?auto_2709550 ?auto_2709553 ) ) ( not ( = ?auto_2709550 ?auto_2709554 ) ) ( not ( = ?auto_2709550 ?auto_2709555 ) ) ( not ( = ?auto_2709550 ?auto_2709558 ) ) ( not ( = ?auto_2709550 ?auto_2709562 ) ) ( not ( = ?auto_2709551 ?auto_2709552 ) ) ( not ( = ?auto_2709551 ?auto_2709553 ) ) ( not ( = ?auto_2709551 ?auto_2709554 ) ) ( not ( = ?auto_2709551 ?auto_2709555 ) ) ( not ( = ?auto_2709551 ?auto_2709558 ) ) ( not ( = ?auto_2709551 ?auto_2709562 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2709553 ?auto_2709554 ?auto_2709555 )
      ( MAKE-9CRATE-VERIFY ?auto_2709546 ?auto_2709547 ?auto_2709548 ?auto_2709549 ?auto_2709550 ?auto_2709551 ?auto_2709552 ?auto_2709553 ?auto_2709554 ?auto_2709555 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2709563 - SURFACE
      ?auto_2709564 - SURFACE
      ?auto_2709565 - SURFACE
      ?auto_2709566 - SURFACE
      ?auto_2709567 - SURFACE
      ?auto_2709568 - SURFACE
      ?auto_2709569 - SURFACE
      ?auto_2709570 - SURFACE
      ?auto_2709571 - SURFACE
      ?auto_2709572 - SURFACE
      ?auto_2709573 - SURFACE
    )
    :vars
    (
      ?auto_2709579 - HOIST
      ?auto_2709574 - PLACE
      ?auto_2709577 - PLACE
      ?auto_2709575 - HOIST
      ?auto_2709576 - SURFACE
      ?auto_2709580 - SURFACE
      ?auto_2709578 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709579 ?auto_2709574 ) ( IS-CRATE ?auto_2709573 ) ( not ( = ?auto_2709572 ?auto_2709573 ) ) ( not ( = ?auto_2709571 ?auto_2709572 ) ) ( not ( = ?auto_2709571 ?auto_2709573 ) ) ( not ( = ?auto_2709577 ?auto_2709574 ) ) ( HOIST-AT ?auto_2709575 ?auto_2709577 ) ( not ( = ?auto_2709579 ?auto_2709575 ) ) ( SURFACE-AT ?auto_2709573 ?auto_2709577 ) ( ON ?auto_2709573 ?auto_2709576 ) ( CLEAR ?auto_2709573 ) ( not ( = ?auto_2709572 ?auto_2709576 ) ) ( not ( = ?auto_2709573 ?auto_2709576 ) ) ( not ( = ?auto_2709571 ?auto_2709576 ) ) ( IS-CRATE ?auto_2709572 ) ( AVAILABLE ?auto_2709575 ) ( SURFACE-AT ?auto_2709572 ?auto_2709577 ) ( ON ?auto_2709572 ?auto_2709580 ) ( CLEAR ?auto_2709572 ) ( not ( = ?auto_2709572 ?auto_2709580 ) ) ( not ( = ?auto_2709573 ?auto_2709580 ) ) ( not ( = ?auto_2709571 ?auto_2709580 ) ) ( not ( = ?auto_2709576 ?auto_2709580 ) ) ( TRUCK-AT ?auto_2709578 ?auto_2709574 ) ( SURFACE-AT ?auto_2709570 ?auto_2709574 ) ( CLEAR ?auto_2709570 ) ( LIFTING ?auto_2709579 ?auto_2709571 ) ( IS-CRATE ?auto_2709571 ) ( not ( = ?auto_2709570 ?auto_2709571 ) ) ( not ( = ?auto_2709572 ?auto_2709570 ) ) ( not ( = ?auto_2709573 ?auto_2709570 ) ) ( not ( = ?auto_2709576 ?auto_2709570 ) ) ( not ( = ?auto_2709580 ?auto_2709570 ) ) ( ON ?auto_2709564 ?auto_2709563 ) ( ON ?auto_2709565 ?auto_2709564 ) ( ON ?auto_2709566 ?auto_2709565 ) ( ON ?auto_2709567 ?auto_2709566 ) ( ON ?auto_2709568 ?auto_2709567 ) ( ON ?auto_2709569 ?auto_2709568 ) ( ON ?auto_2709570 ?auto_2709569 ) ( not ( = ?auto_2709563 ?auto_2709564 ) ) ( not ( = ?auto_2709563 ?auto_2709565 ) ) ( not ( = ?auto_2709563 ?auto_2709566 ) ) ( not ( = ?auto_2709563 ?auto_2709567 ) ) ( not ( = ?auto_2709563 ?auto_2709568 ) ) ( not ( = ?auto_2709563 ?auto_2709569 ) ) ( not ( = ?auto_2709563 ?auto_2709570 ) ) ( not ( = ?auto_2709563 ?auto_2709571 ) ) ( not ( = ?auto_2709563 ?auto_2709572 ) ) ( not ( = ?auto_2709563 ?auto_2709573 ) ) ( not ( = ?auto_2709563 ?auto_2709576 ) ) ( not ( = ?auto_2709563 ?auto_2709580 ) ) ( not ( = ?auto_2709564 ?auto_2709565 ) ) ( not ( = ?auto_2709564 ?auto_2709566 ) ) ( not ( = ?auto_2709564 ?auto_2709567 ) ) ( not ( = ?auto_2709564 ?auto_2709568 ) ) ( not ( = ?auto_2709564 ?auto_2709569 ) ) ( not ( = ?auto_2709564 ?auto_2709570 ) ) ( not ( = ?auto_2709564 ?auto_2709571 ) ) ( not ( = ?auto_2709564 ?auto_2709572 ) ) ( not ( = ?auto_2709564 ?auto_2709573 ) ) ( not ( = ?auto_2709564 ?auto_2709576 ) ) ( not ( = ?auto_2709564 ?auto_2709580 ) ) ( not ( = ?auto_2709565 ?auto_2709566 ) ) ( not ( = ?auto_2709565 ?auto_2709567 ) ) ( not ( = ?auto_2709565 ?auto_2709568 ) ) ( not ( = ?auto_2709565 ?auto_2709569 ) ) ( not ( = ?auto_2709565 ?auto_2709570 ) ) ( not ( = ?auto_2709565 ?auto_2709571 ) ) ( not ( = ?auto_2709565 ?auto_2709572 ) ) ( not ( = ?auto_2709565 ?auto_2709573 ) ) ( not ( = ?auto_2709565 ?auto_2709576 ) ) ( not ( = ?auto_2709565 ?auto_2709580 ) ) ( not ( = ?auto_2709566 ?auto_2709567 ) ) ( not ( = ?auto_2709566 ?auto_2709568 ) ) ( not ( = ?auto_2709566 ?auto_2709569 ) ) ( not ( = ?auto_2709566 ?auto_2709570 ) ) ( not ( = ?auto_2709566 ?auto_2709571 ) ) ( not ( = ?auto_2709566 ?auto_2709572 ) ) ( not ( = ?auto_2709566 ?auto_2709573 ) ) ( not ( = ?auto_2709566 ?auto_2709576 ) ) ( not ( = ?auto_2709566 ?auto_2709580 ) ) ( not ( = ?auto_2709567 ?auto_2709568 ) ) ( not ( = ?auto_2709567 ?auto_2709569 ) ) ( not ( = ?auto_2709567 ?auto_2709570 ) ) ( not ( = ?auto_2709567 ?auto_2709571 ) ) ( not ( = ?auto_2709567 ?auto_2709572 ) ) ( not ( = ?auto_2709567 ?auto_2709573 ) ) ( not ( = ?auto_2709567 ?auto_2709576 ) ) ( not ( = ?auto_2709567 ?auto_2709580 ) ) ( not ( = ?auto_2709568 ?auto_2709569 ) ) ( not ( = ?auto_2709568 ?auto_2709570 ) ) ( not ( = ?auto_2709568 ?auto_2709571 ) ) ( not ( = ?auto_2709568 ?auto_2709572 ) ) ( not ( = ?auto_2709568 ?auto_2709573 ) ) ( not ( = ?auto_2709568 ?auto_2709576 ) ) ( not ( = ?auto_2709568 ?auto_2709580 ) ) ( not ( = ?auto_2709569 ?auto_2709570 ) ) ( not ( = ?auto_2709569 ?auto_2709571 ) ) ( not ( = ?auto_2709569 ?auto_2709572 ) ) ( not ( = ?auto_2709569 ?auto_2709573 ) ) ( not ( = ?auto_2709569 ?auto_2709576 ) ) ( not ( = ?auto_2709569 ?auto_2709580 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2709571 ?auto_2709572 ?auto_2709573 )
      ( MAKE-10CRATE-VERIFY ?auto_2709563 ?auto_2709564 ?auto_2709565 ?auto_2709566 ?auto_2709567 ?auto_2709568 ?auto_2709569 ?auto_2709570 ?auto_2709571 ?auto_2709572 ?auto_2709573 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2709581 - SURFACE
      ?auto_2709582 - SURFACE
      ?auto_2709583 - SURFACE
      ?auto_2709584 - SURFACE
      ?auto_2709585 - SURFACE
      ?auto_2709586 - SURFACE
      ?auto_2709587 - SURFACE
      ?auto_2709588 - SURFACE
      ?auto_2709589 - SURFACE
      ?auto_2709590 - SURFACE
      ?auto_2709591 - SURFACE
      ?auto_2709592 - SURFACE
    )
    :vars
    (
      ?auto_2709598 - HOIST
      ?auto_2709593 - PLACE
      ?auto_2709596 - PLACE
      ?auto_2709594 - HOIST
      ?auto_2709595 - SURFACE
      ?auto_2709599 - SURFACE
      ?auto_2709597 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709598 ?auto_2709593 ) ( IS-CRATE ?auto_2709592 ) ( not ( = ?auto_2709591 ?auto_2709592 ) ) ( not ( = ?auto_2709590 ?auto_2709591 ) ) ( not ( = ?auto_2709590 ?auto_2709592 ) ) ( not ( = ?auto_2709596 ?auto_2709593 ) ) ( HOIST-AT ?auto_2709594 ?auto_2709596 ) ( not ( = ?auto_2709598 ?auto_2709594 ) ) ( SURFACE-AT ?auto_2709592 ?auto_2709596 ) ( ON ?auto_2709592 ?auto_2709595 ) ( CLEAR ?auto_2709592 ) ( not ( = ?auto_2709591 ?auto_2709595 ) ) ( not ( = ?auto_2709592 ?auto_2709595 ) ) ( not ( = ?auto_2709590 ?auto_2709595 ) ) ( IS-CRATE ?auto_2709591 ) ( AVAILABLE ?auto_2709594 ) ( SURFACE-AT ?auto_2709591 ?auto_2709596 ) ( ON ?auto_2709591 ?auto_2709599 ) ( CLEAR ?auto_2709591 ) ( not ( = ?auto_2709591 ?auto_2709599 ) ) ( not ( = ?auto_2709592 ?auto_2709599 ) ) ( not ( = ?auto_2709590 ?auto_2709599 ) ) ( not ( = ?auto_2709595 ?auto_2709599 ) ) ( TRUCK-AT ?auto_2709597 ?auto_2709593 ) ( SURFACE-AT ?auto_2709589 ?auto_2709593 ) ( CLEAR ?auto_2709589 ) ( LIFTING ?auto_2709598 ?auto_2709590 ) ( IS-CRATE ?auto_2709590 ) ( not ( = ?auto_2709589 ?auto_2709590 ) ) ( not ( = ?auto_2709591 ?auto_2709589 ) ) ( not ( = ?auto_2709592 ?auto_2709589 ) ) ( not ( = ?auto_2709595 ?auto_2709589 ) ) ( not ( = ?auto_2709599 ?auto_2709589 ) ) ( ON ?auto_2709582 ?auto_2709581 ) ( ON ?auto_2709583 ?auto_2709582 ) ( ON ?auto_2709584 ?auto_2709583 ) ( ON ?auto_2709585 ?auto_2709584 ) ( ON ?auto_2709586 ?auto_2709585 ) ( ON ?auto_2709587 ?auto_2709586 ) ( ON ?auto_2709588 ?auto_2709587 ) ( ON ?auto_2709589 ?auto_2709588 ) ( not ( = ?auto_2709581 ?auto_2709582 ) ) ( not ( = ?auto_2709581 ?auto_2709583 ) ) ( not ( = ?auto_2709581 ?auto_2709584 ) ) ( not ( = ?auto_2709581 ?auto_2709585 ) ) ( not ( = ?auto_2709581 ?auto_2709586 ) ) ( not ( = ?auto_2709581 ?auto_2709587 ) ) ( not ( = ?auto_2709581 ?auto_2709588 ) ) ( not ( = ?auto_2709581 ?auto_2709589 ) ) ( not ( = ?auto_2709581 ?auto_2709590 ) ) ( not ( = ?auto_2709581 ?auto_2709591 ) ) ( not ( = ?auto_2709581 ?auto_2709592 ) ) ( not ( = ?auto_2709581 ?auto_2709595 ) ) ( not ( = ?auto_2709581 ?auto_2709599 ) ) ( not ( = ?auto_2709582 ?auto_2709583 ) ) ( not ( = ?auto_2709582 ?auto_2709584 ) ) ( not ( = ?auto_2709582 ?auto_2709585 ) ) ( not ( = ?auto_2709582 ?auto_2709586 ) ) ( not ( = ?auto_2709582 ?auto_2709587 ) ) ( not ( = ?auto_2709582 ?auto_2709588 ) ) ( not ( = ?auto_2709582 ?auto_2709589 ) ) ( not ( = ?auto_2709582 ?auto_2709590 ) ) ( not ( = ?auto_2709582 ?auto_2709591 ) ) ( not ( = ?auto_2709582 ?auto_2709592 ) ) ( not ( = ?auto_2709582 ?auto_2709595 ) ) ( not ( = ?auto_2709582 ?auto_2709599 ) ) ( not ( = ?auto_2709583 ?auto_2709584 ) ) ( not ( = ?auto_2709583 ?auto_2709585 ) ) ( not ( = ?auto_2709583 ?auto_2709586 ) ) ( not ( = ?auto_2709583 ?auto_2709587 ) ) ( not ( = ?auto_2709583 ?auto_2709588 ) ) ( not ( = ?auto_2709583 ?auto_2709589 ) ) ( not ( = ?auto_2709583 ?auto_2709590 ) ) ( not ( = ?auto_2709583 ?auto_2709591 ) ) ( not ( = ?auto_2709583 ?auto_2709592 ) ) ( not ( = ?auto_2709583 ?auto_2709595 ) ) ( not ( = ?auto_2709583 ?auto_2709599 ) ) ( not ( = ?auto_2709584 ?auto_2709585 ) ) ( not ( = ?auto_2709584 ?auto_2709586 ) ) ( not ( = ?auto_2709584 ?auto_2709587 ) ) ( not ( = ?auto_2709584 ?auto_2709588 ) ) ( not ( = ?auto_2709584 ?auto_2709589 ) ) ( not ( = ?auto_2709584 ?auto_2709590 ) ) ( not ( = ?auto_2709584 ?auto_2709591 ) ) ( not ( = ?auto_2709584 ?auto_2709592 ) ) ( not ( = ?auto_2709584 ?auto_2709595 ) ) ( not ( = ?auto_2709584 ?auto_2709599 ) ) ( not ( = ?auto_2709585 ?auto_2709586 ) ) ( not ( = ?auto_2709585 ?auto_2709587 ) ) ( not ( = ?auto_2709585 ?auto_2709588 ) ) ( not ( = ?auto_2709585 ?auto_2709589 ) ) ( not ( = ?auto_2709585 ?auto_2709590 ) ) ( not ( = ?auto_2709585 ?auto_2709591 ) ) ( not ( = ?auto_2709585 ?auto_2709592 ) ) ( not ( = ?auto_2709585 ?auto_2709595 ) ) ( not ( = ?auto_2709585 ?auto_2709599 ) ) ( not ( = ?auto_2709586 ?auto_2709587 ) ) ( not ( = ?auto_2709586 ?auto_2709588 ) ) ( not ( = ?auto_2709586 ?auto_2709589 ) ) ( not ( = ?auto_2709586 ?auto_2709590 ) ) ( not ( = ?auto_2709586 ?auto_2709591 ) ) ( not ( = ?auto_2709586 ?auto_2709592 ) ) ( not ( = ?auto_2709586 ?auto_2709595 ) ) ( not ( = ?auto_2709586 ?auto_2709599 ) ) ( not ( = ?auto_2709587 ?auto_2709588 ) ) ( not ( = ?auto_2709587 ?auto_2709589 ) ) ( not ( = ?auto_2709587 ?auto_2709590 ) ) ( not ( = ?auto_2709587 ?auto_2709591 ) ) ( not ( = ?auto_2709587 ?auto_2709592 ) ) ( not ( = ?auto_2709587 ?auto_2709595 ) ) ( not ( = ?auto_2709587 ?auto_2709599 ) ) ( not ( = ?auto_2709588 ?auto_2709589 ) ) ( not ( = ?auto_2709588 ?auto_2709590 ) ) ( not ( = ?auto_2709588 ?auto_2709591 ) ) ( not ( = ?auto_2709588 ?auto_2709592 ) ) ( not ( = ?auto_2709588 ?auto_2709595 ) ) ( not ( = ?auto_2709588 ?auto_2709599 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2709590 ?auto_2709591 ?auto_2709592 )
      ( MAKE-11CRATE-VERIFY ?auto_2709581 ?auto_2709582 ?auto_2709583 ?auto_2709584 ?auto_2709585 ?auto_2709586 ?auto_2709587 ?auto_2709588 ?auto_2709589 ?auto_2709590 ?auto_2709591 ?auto_2709592 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2709600 - SURFACE
      ?auto_2709601 - SURFACE
      ?auto_2709602 - SURFACE
      ?auto_2709603 - SURFACE
      ?auto_2709604 - SURFACE
      ?auto_2709605 - SURFACE
      ?auto_2709606 - SURFACE
      ?auto_2709607 - SURFACE
      ?auto_2709608 - SURFACE
      ?auto_2709609 - SURFACE
      ?auto_2709610 - SURFACE
      ?auto_2709611 - SURFACE
      ?auto_2709612 - SURFACE
    )
    :vars
    (
      ?auto_2709618 - HOIST
      ?auto_2709613 - PLACE
      ?auto_2709616 - PLACE
      ?auto_2709614 - HOIST
      ?auto_2709615 - SURFACE
      ?auto_2709619 - SURFACE
      ?auto_2709617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709618 ?auto_2709613 ) ( IS-CRATE ?auto_2709612 ) ( not ( = ?auto_2709611 ?auto_2709612 ) ) ( not ( = ?auto_2709610 ?auto_2709611 ) ) ( not ( = ?auto_2709610 ?auto_2709612 ) ) ( not ( = ?auto_2709616 ?auto_2709613 ) ) ( HOIST-AT ?auto_2709614 ?auto_2709616 ) ( not ( = ?auto_2709618 ?auto_2709614 ) ) ( SURFACE-AT ?auto_2709612 ?auto_2709616 ) ( ON ?auto_2709612 ?auto_2709615 ) ( CLEAR ?auto_2709612 ) ( not ( = ?auto_2709611 ?auto_2709615 ) ) ( not ( = ?auto_2709612 ?auto_2709615 ) ) ( not ( = ?auto_2709610 ?auto_2709615 ) ) ( IS-CRATE ?auto_2709611 ) ( AVAILABLE ?auto_2709614 ) ( SURFACE-AT ?auto_2709611 ?auto_2709616 ) ( ON ?auto_2709611 ?auto_2709619 ) ( CLEAR ?auto_2709611 ) ( not ( = ?auto_2709611 ?auto_2709619 ) ) ( not ( = ?auto_2709612 ?auto_2709619 ) ) ( not ( = ?auto_2709610 ?auto_2709619 ) ) ( not ( = ?auto_2709615 ?auto_2709619 ) ) ( TRUCK-AT ?auto_2709617 ?auto_2709613 ) ( SURFACE-AT ?auto_2709609 ?auto_2709613 ) ( CLEAR ?auto_2709609 ) ( LIFTING ?auto_2709618 ?auto_2709610 ) ( IS-CRATE ?auto_2709610 ) ( not ( = ?auto_2709609 ?auto_2709610 ) ) ( not ( = ?auto_2709611 ?auto_2709609 ) ) ( not ( = ?auto_2709612 ?auto_2709609 ) ) ( not ( = ?auto_2709615 ?auto_2709609 ) ) ( not ( = ?auto_2709619 ?auto_2709609 ) ) ( ON ?auto_2709601 ?auto_2709600 ) ( ON ?auto_2709602 ?auto_2709601 ) ( ON ?auto_2709603 ?auto_2709602 ) ( ON ?auto_2709604 ?auto_2709603 ) ( ON ?auto_2709605 ?auto_2709604 ) ( ON ?auto_2709606 ?auto_2709605 ) ( ON ?auto_2709607 ?auto_2709606 ) ( ON ?auto_2709608 ?auto_2709607 ) ( ON ?auto_2709609 ?auto_2709608 ) ( not ( = ?auto_2709600 ?auto_2709601 ) ) ( not ( = ?auto_2709600 ?auto_2709602 ) ) ( not ( = ?auto_2709600 ?auto_2709603 ) ) ( not ( = ?auto_2709600 ?auto_2709604 ) ) ( not ( = ?auto_2709600 ?auto_2709605 ) ) ( not ( = ?auto_2709600 ?auto_2709606 ) ) ( not ( = ?auto_2709600 ?auto_2709607 ) ) ( not ( = ?auto_2709600 ?auto_2709608 ) ) ( not ( = ?auto_2709600 ?auto_2709609 ) ) ( not ( = ?auto_2709600 ?auto_2709610 ) ) ( not ( = ?auto_2709600 ?auto_2709611 ) ) ( not ( = ?auto_2709600 ?auto_2709612 ) ) ( not ( = ?auto_2709600 ?auto_2709615 ) ) ( not ( = ?auto_2709600 ?auto_2709619 ) ) ( not ( = ?auto_2709601 ?auto_2709602 ) ) ( not ( = ?auto_2709601 ?auto_2709603 ) ) ( not ( = ?auto_2709601 ?auto_2709604 ) ) ( not ( = ?auto_2709601 ?auto_2709605 ) ) ( not ( = ?auto_2709601 ?auto_2709606 ) ) ( not ( = ?auto_2709601 ?auto_2709607 ) ) ( not ( = ?auto_2709601 ?auto_2709608 ) ) ( not ( = ?auto_2709601 ?auto_2709609 ) ) ( not ( = ?auto_2709601 ?auto_2709610 ) ) ( not ( = ?auto_2709601 ?auto_2709611 ) ) ( not ( = ?auto_2709601 ?auto_2709612 ) ) ( not ( = ?auto_2709601 ?auto_2709615 ) ) ( not ( = ?auto_2709601 ?auto_2709619 ) ) ( not ( = ?auto_2709602 ?auto_2709603 ) ) ( not ( = ?auto_2709602 ?auto_2709604 ) ) ( not ( = ?auto_2709602 ?auto_2709605 ) ) ( not ( = ?auto_2709602 ?auto_2709606 ) ) ( not ( = ?auto_2709602 ?auto_2709607 ) ) ( not ( = ?auto_2709602 ?auto_2709608 ) ) ( not ( = ?auto_2709602 ?auto_2709609 ) ) ( not ( = ?auto_2709602 ?auto_2709610 ) ) ( not ( = ?auto_2709602 ?auto_2709611 ) ) ( not ( = ?auto_2709602 ?auto_2709612 ) ) ( not ( = ?auto_2709602 ?auto_2709615 ) ) ( not ( = ?auto_2709602 ?auto_2709619 ) ) ( not ( = ?auto_2709603 ?auto_2709604 ) ) ( not ( = ?auto_2709603 ?auto_2709605 ) ) ( not ( = ?auto_2709603 ?auto_2709606 ) ) ( not ( = ?auto_2709603 ?auto_2709607 ) ) ( not ( = ?auto_2709603 ?auto_2709608 ) ) ( not ( = ?auto_2709603 ?auto_2709609 ) ) ( not ( = ?auto_2709603 ?auto_2709610 ) ) ( not ( = ?auto_2709603 ?auto_2709611 ) ) ( not ( = ?auto_2709603 ?auto_2709612 ) ) ( not ( = ?auto_2709603 ?auto_2709615 ) ) ( not ( = ?auto_2709603 ?auto_2709619 ) ) ( not ( = ?auto_2709604 ?auto_2709605 ) ) ( not ( = ?auto_2709604 ?auto_2709606 ) ) ( not ( = ?auto_2709604 ?auto_2709607 ) ) ( not ( = ?auto_2709604 ?auto_2709608 ) ) ( not ( = ?auto_2709604 ?auto_2709609 ) ) ( not ( = ?auto_2709604 ?auto_2709610 ) ) ( not ( = ?auto_2709604 ?auto_2709611 ) ) ( not ( = ?auto_2709604 ?auto_2709612 ) ) ( not ( = ?auto_2709604 ?auto_2709615 ) ) ( not ( = ?auto_2709604 ?auto_2709619 ) ) ( not ( = ?auto_2709605 ?auto_2709606 ) ) ( not ( = ?auto_2709605 ?auto_2709607 ) ) ( not ( = ?auto_2709605 ?auto_2709608 ) ) ( not ( = ?auto_2709605 ?auto_2709609 ) ) ( not ( = ?auto_2709605 ?auto_2709610 ) ) ( not ( = ?auto_2709605 ?auto_2709611 ) ) ( not ( = ?auto_2709605 ?auto_2709612 ) ) ( not ( = ?auto_2709605 ?auto_2709615 ) ) ( not ( = ?auto_2709605 ?auto_2709619 ) ) ( not ( = ?auto_2709606 ?auto_2709607 ) ) ( not ( = ?auto_2709606 ?auto_2709608 ) ) ( not ( = ?auto_2709606 ?auto_2709609 ) ) ( not ( = ?auto_2709606 ?auto_2709610 ) ) ( not ( = ?auto_2709606 ?auto_2709611 ) ) ( not ( = ?auto_2709606 ?auto_2709612 ) ) ( not ( = ?auto_2709606 ?auto_2709615 ) ) ( not ( = ?auto_2709606 ?auto_2709619 ) ) ( not ( = ?auto_2709607 ?auto_2709608 ) ) ( not ( = ?auto_2709607 ?auto_2709609 ) ) ( not ( = ?auto_2709607 ?auto_2709610 ) ) ( not ( = ?auto_2709607 ?auto_2709611 ) ) ( not ( = ?auto_2709607 ?auto_2709612 ) ) ( not ( = ?auto_2709607 ?auto_2709615 ) ) ( not ( = ?auto_2709607 ?auto_2709619 ) ) ( not ( = ?auto_2709608 ?auto_2709609 ) ) ( not ( = ?auto_2709608 ?auto_2709610 ) ) ( not ( = ?auto_2709608 ?auto_2709611 ) ) ( not ( = ?auto_2709608 ?auto_2709612 ) ) ( not ( = ?auto_2709608 ?auto_2709615 ) ) ( not ( = ?auto_2709608 ?auto_2709619 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2709610 ?auto_2709611 ?auto_2709612 )
      ( MAKE-12CRATE-VERIFY ?auto_2709600 ?auto_2709601 ?auto_2709602 ?auto_2709603 ?auto_2709604 ?auto_2709605 ?auto_2709606 ?auto_2709607 ?auto_2709608 ?auto_2709609 ?auto_2709610 ?auto_2709611 ?auto_2709612 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2709620 - SURFACE
      ?auto_2709621 - SURFACE
      ?auto_2709622 - SURFACE
      ?auto_2709623 - SURFACE
      ?auto_2709624 - SURFACE
      ?auto_2709625 - SURFACE
      ?auto_2709626 - SURFACE
      ?auto_2709627 - SURFACE
      ?auto_2709628 - SURFACE
      ?auto_2709629 - SURFACE
      ?auto_2709630 - SURFACE
      ?auto_2709631 - SURFACE
      ?auto_2709632 - SURFACE
      ?auto_2709633 - SURFACE
    )
    :vars
    (
      ?auto_2709639 - HOIST
      ?auto_2709634 - PLACE
      ?auto_2709637 - PLACE
      ?auto_2709635 - HOIST
      ?auto_2709636 - SURFACE
      ?auto_2709640 - SURFACE
      ?auto_2709638 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709639 ?auto_2709634 ) ( IS-CRATE ?auto_2709633 ) ( not ( = ?auto_2709632 ?auto_2709633 ) ) ( not ( = ?auto_2709631 ?auto_2709632 ) ) ( not ( = ?auto_2709631 ?auto_2709633 ) ) ( not ( = ?auto_2709637 ?auto_2709634 ) ) ( HOIST-AT ?auto_2709635 ?auto_2709637 ) ( not ( = ?auto_2709639 ?auto_2709635 ) ) ( SURFACE-AT ?auto_2709633 ?auto_2709637 ) ( ON ?auto_2709633 ?auto_2709636 ) ( CLEAR ?auto_2709633 ) ( not ( = ?auto_2709632 ?auto_2709636 ) ) ( not ( = ?auto_2709633 ?auto_2709636 ) ) ( not ( = ?auto_2709631 ?auto_2709636 ) ) ( IS-CRATE ?auto_2709632 ) ( AVAILABLE ?auto_2709635 ) ( SURFACE-AT ?auto_2709632 ?auto_2709637 ) ( ON ?auto_2709632 ?auto_2709640 ) ( CLEAR ?auto_2709632 ) ( not ( = ?auto_2709632 ?auto_2709640 ) ) ( not ( = ?auto_2709633 ?auto_2709640 ) ) ( not ( = ?auto_2709631 ?auto_2709640 ) ) ( not ( = ?auto_2709636 ?auto_2709640 ) ) ( TRUCK-AT ?auto_2709638 ?auto_2709634 ) ( SURFACE-AT ?auto_2709630 ?auto_2709634 ) ( CLEAR ?auto_2709630 ) ( LIFTING ?auto_2709639 ?auto_2709631 ) ( IS-CRATE ?auto_2709631 ) ( not ( = ?auto_2709630 ?auto_2709631 ) ) ( not ( = ?auto_2709632 ?auto_2709630 ) ) ( not ( = ?auto_2709633 ?auto_2709630 ) ) ( not ( = ?auto_2709636 ?auto_2709630 ) ) ( not ( = ?auto_2709640 ?auto_2709630 ) ) ( ON ?auto_2709621 ?auto_2709620 ) ( ON ?auto_2709622 ?auto_2709621 ) ( ON ?auto_2709623 ?auto_2709622 ) ( ON ?auto_2709624 ?auto_2709623 ) ( ON ?auto_2709625 ?auto_2709624 ) ( ON ?auto_2709626 ?auto_2709625 ) ( ON ?auto_2709627 ?auto_2709626 ) ( ON ?auto_2709628 ?auto_2709627 ) ( ON ?auto_2709629 ?auto_2709628 ) ( ON ?auto_2709630 ?auto_2709629 ) ( not ( = ?auto_2709620 ?auto_2709621 ) ) ( not ( = ?auto_2709620 ?auto_2709622 ) ) ( not ( = ?auto_2709620 ?auto_2709623 ) ) ( not ( = ?auto_2709620 ?auto_2709624 ) ) ( not ( = ?auto_2709620 ?auto_2709625 ) ) ( not ( = ?auto_2709620 ?auto_2709626 ) ) ( not ( = ?auto_2709620 ?auto_2709627 ) ) ( not ( = ?auto_2709620 ?auto_2709628 ) ) ( not ( = ?auto_2709620 ?auto_2709629 ) ) ( not ( = ?auto_2709620 ?auto_2709630 ) ) ( not ( = ?auto_2709620 ?auto_2709631 ) ) ( not ( = ?auto_2709620 ?auto_2709632 ) ) ( not ( = ?auto_2709620 ?auto_2709633 ) ) ( not ( = ?auto_2709620 ?auto_2709636 ) ) ( not ( = ?auto_2709620 ?auto_2709640 ) ) ( not ( = ?auto_2709621 ?auto_2709622 ) ) ( not ( = ?auto_2709621 ?auto_2709623 ) ) ( not ( = ?auto_2709621 ?auto_2709624 ) ) ( not ( = ?auto_2709621 ?auto_2709625 ) ) ( not ( = ?auto_2709621 ?auto_2709626 ) ) ( not ( = ?auto_2709621 ?auto_2709627 ) ) ( not ( = ?auto_2709621 ?auto_2709628 ) ) ( not ( = ?auto_2709621 ?auto_2709629 ) ) ( not ( = ?auto_2709621 ?auto_2709630 ) ) ( not ( = ?auto_2709621 ?auto_2709631 ) ) ( not ( = ?auto_2709621 ?auto_2709632 ) ) ( not ( = ?auto_2709621 ?auto_2709633 ) ) ( not ( = ?auto_2709621 ?auto_2709636 ) ) ( not ( = ?auto_2709621 ?auto_2709640 ) ) ( not ( = ?auto_2709622 ?auto_2709623 ) ) ( not ( = ?auto_2709622 ?auto_2709624 ) ) ( not ( = ?auto_2709622 ?auto_2709625 ) ) ( not ( = ?auto_2709622 ?auto_2709626 ) ) ( not ( = ?auto_2709622 ?auto_2709627 ) ) ( not ( = ?auto_2709622 ?auto_2709628 ) ) ( not ( = ?auto_2709622 ?auto_2709629 ) ) ( not ( = ?auto_2709622 ?auto_2709630 ) ) ( not ( = ?auto_2709622 ?auto_2709631 ) ) ( not ( = ?auto_2709622 ?auto_2709632 ) ) ( not ( = ?auto_2709622 ?auto_2709633 ) ) ( not ( = ?auto_2709622 ?auto_2709636 ) ) ( not ( = ?auto_2709622 ?auto_2709640 ) ) ( not ( = ?auto_2709623 ?auto_2709624 ) ) ( not ( = ?auto_2709623 ?auto_2709625 ) ) ( not ( = ?auto_2709623 ?auto_2709626 ) ) ( not ( = ?auto_2709623 ?auto_2709627 ) ) ( not ( = ?auto_2709623 ?auto_2709628 ) ) ( not ( = ?auto_2709623 ?auto_2709629 ) ) ( not ( = ?auto_2709623 ?auto_2709630 ) ) ( not ( = ?auto_2709623 ?auto_2709631 ) ) ( not ( = ?auto_2709623 ?auto_2709632 ) ) ( not ( = ?auto_2709623 ?auto_2709633 ) ) ( not ( = ?auto_2709623 ?auto_2709636 ) ) ( not ( = ?auto_2709623 ?auto_2709640 ) ) ( not ( = ?auto_2709624 ?auto_2709625 ) ) ( not ( = ?auto_2709624 ?auto_2709626 ) ) ( not ( = ?auto_2709624 ?auto_2709627 ) ) ( not ( = ?auto_2709624 ?auto_2709628 ) ) ( not ( = ?auto_2709624 ?auto_2709629 ) ) ( not ( = ?auto_2709624 ?auto_2709630 ) ) ( not ( = ?auto_2709624 ?auto_2709631 ) ) ( not ( = ?auto_2709624 ?auto_2709632 ) ) ( not ( = ?auto_2709624 ?auto_2709633 ) ) ( not ( = ?auto_2709624 ?auto_2709636 ) ) ( not ( = ?auto_2709624 ?auto_2709640 ) ) ( not ( = ?auto_2709625 ?auto_2709626 ) ) ( not ( = ?auto_2709625 ?auto_2709627 ) ) ( not ( = ?auto_2709625 ?auto_2709628 ) ) ( not ( = ?auto_2709625 ?auto_2709629 ) ) ( not ( = ?auto_2709625 ?auto_2709630 ) ) ( not ( = ?auto_2709625 ?auto_2709631 ) ) ( not ( = ?auto_2709625 ?auto_2709632 ) ) ( not ( = ?auto_2709625 ?auto_2709633 ) ) ( not ( = ?auto_2709625 ?auto_2709636 ) ) ( not ( = ?auto_2709625 ?auto_2709640 ) ) ( not ( = ?auto_2709626 ?auto_2709627 ) ) ( not ( = ?auto_2709626 ?auto_2709628 ) ) ( not ( = ?auto_2709626 ?auto_2709629 ) ) ( not ( = ?auto_2709626 ?auto_2709630 ) ) ( not ( = ?auto_2709626 ?auto_2709631 ) ) ( not ( = ?auto_2709626 ?auto_2709632 ) ) ( not ( = ?auto_2709626 ?auto_2709633 ) ) ( not ( = ?auto_2709626 ?auto_2709636 ) ) ( not ( = ?auto_2709626 ?auto_2709640 ) ) ( not ( = ?auto_2709627 ?auto_2709628 ) ) ( not ( = ?auto_2709627 ?auto_2709629 ) ) ( not ( = ?auto_2709627 ?auto_2709630 ) ) ( not ( = ?auto_2709627 ?auto_2709631 ) ) ( not ( = ?auto_2709627 ?auto_2709632 ) ) ( not ( = ?auto_2709627 ?auto_2709633 ) ) ( not ( = ?auto_2709627 ?auto_2709636 ) ) ( not ( = ?auto_2709627 ?auto_2709640 ) ) ( not ( = ?auto_2709628 ?auto_2709629 ) ) ( not ( = ?auto_2709628 ?auto_2709630 ) ) ( not ( = ?auto_2709628 ?auto_2709631 ) ) ( not ( = ?auto_2709628 ?auto_2709632 ) ) ( not ( = ?auto_2709628 ?auto_2709633 ) ) ( not ( = ?auto_2709628 ?auto_2709636 ) ) ( not ( = ?auto_2709628 ?auto_2709640 ) ) ( not ( = ?auto_2709629 ?auto_2709630 ) ) ( not ( = ?auto_2709629 ?auto_2709631 ) ) ( not ( = ?auto_2709629 ?auto_2709632 ) ) ( not ( = ?auto_2709629 ?auto_2709633 ) ) ( not ( = ?auto_2709629 ?auto_2709636 ) ) ( not ( = ?auto_2709629 ?auto_2709640 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2709631 ?auto_2709632 ?auto_2709633 )
      ( MAKE-13CRATE-VERIFY ?auto_2709620 ?auto_2709621 ?auto_2709622 ?auto_2709623 ?auto_2709624 ?auto_2709625 ?auto_2709626 ?auto_2709627 ?auto_2709628 ?auto_2709629 ?auto_2709630 ?auto_2709631 ?auto_2709632 ?auto_2709633 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2713498 - SURFACE
      ?auto_2713499 - SURFACE
    )
    :vars
    (
      ?auto_2713507 - HOIST
      ?auto_2713504 - PLACE
      ?auto_2713500 - SURFACE
      ?auto_2713501 - PLACE
      ?auto_2713503 - HOIST
      ?auto_2713506 - SURFACE
      ?auto_2713502 - TRUCK
      ?auto_2713505 - SURFACE
      ?auto_2713508 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2713507 ?auto_2713504 ) ( IS-CRATE ?auto_2713499 ) ( not ( = ?auto_2713498 ?auto_2713499 ) ) ( not ( = ?auto_2713500 ?auto_2713498 ) ) ( not ( = ?auto_2713500 ?auto_2713499 ) ) ( not ( = ?auto_2713501 ?auto_2713504 ) ) ( HOIST-AT ?auto_2713503 ?auto_2713501 ) ( not ( = ?auto_2713507 ?auto_2713503 ) ) ( SURFACE-AT ?auto_2713499 ?auto_2713501 ) ( ON ?auto_2713499 ?auto_2713506 ) ( CLEAR ?auto_2713499 ) ( not ( = ?auto_2713498 ?auto_2713506 ) ) ( not ( = ?auto_2713499 ?auto_2713506 ) ) ( not ( = ?auto_2713500 ?auto_2713506 ) ) ( SURFACE-AT ?auto_2713500 ?auto_2713504 ) ( CLEAR ?auto_2713500 ) ( IS-CRATE ?auto_2713498 ) ( AVAILABLE ?auto_2713507 ) ( TRUCK-AT ?auto_2713502 ?auto_2713501 ) ( SURFACE-AT ?auto_2713498 ?auto_2713501 ) ( ON ?auto_2713498 ?auto_2713505 ) ( CLEAR ?auto_2713498 ) ( not ( = ?auto_2713498 ?auto_2713505 ) ) ( not ( = ?auto_2713499 ?auto_2713505 ) ) ( not ( = ?auto_2713500 ?auto_2713505 ) ) ( not ( = ?auto_2713506 ?auto_2713505 ) ) ( LIFTING ?auto_2713503 ?auto_2713508 ) ( IS-CRATE ?auto_2713508 ) ( not ( = ?auto_2713498 ?auto_2713508 ) ) ( not ( = ?auto_2713499 ?auto_2713508 ) ) ( not ( = ?auto_2713500 ?auto_2713508 ) ) ( not ( = ?auto_2713506 ?auto_2713508 ) ) ( not ( = ?auto_2713505 ?auto_2713508 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2713503 ?auto_2713508 ?auto_2713502 ?auto_2713501 )
      ( MAKE-2CRATE ?auto_2713500 ?auto_2713498 ?auto_2713499 )
      ( MAKE-1CRATE-VERIFY ?auto_2713498 ?auto_2713499 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2713509 - SURFACE
      ?auto_2713510 - SURFACE
      ?auto_2713511 - SURFACE
    )
    :vars
    (
      ?auto_2713519 - HOIST
      ?auto_2713514 - PLACE
      ?auto_2713513 - PLACE
      ?auto_2713517 - HOIST
      ?auto_2713516 - SURFACE
      ?auto_2713515 - TRUCK
      ?auto_2713512 - SURFACE
      ?auto_2713518 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2713519 ?auto_2713514 ) ( IS-CRATE ?auto_2713511 ) ( not ( = ?auto_2713510 ?auto_2713511 ) ) ( not ( = ?auto_2713509 ?auto_2713510 ) ) ( not ( = ?auto_2713509 ?auto_2713511 ) ) ( not ( = ?auto_2713513 ?auto_2713514 ) ) ( HOIST-AT ?auto_2713517 ?auto_2713513 ) ( not ( = ?auto_2713519 ?auto_2713517 ) ) ( SURFACE-AT ?auto_2713511 ?auto_2713513 ) ( ON ?auto_2713511 ?auto_2713516 ) ( CLEAR ?auto_2713511 ) ( not ( = ?auto_2713510 ?auto_2713516 ) ) ( not ( = ?auto_2713511 ?auto_2713516 ) ) ( not ( = ?auto_2713509 ?auto_2713516 ) ) ( SURFACE-AT ?auto_2713509 ?auto_2713514 ) ( CLEAR ?auto_2713509 ) ( IS-CRATE ?auto_2713510 ) ( AVAILABLE ?auto_2713519 ) ( TRUCK-AT ?auto_2713515 ?auto_2713513 ) ( SURFACE-AT ?auto_2713510 ?auto_2713513 ) ( ON ?auto_2713510 ?auto_2713512 ) ( CLEAR ?auto_2713510 ) ( not ( = ?auto_2713510 ?auto_2713512 ) ) ( not ( = ?auto_2713511 ?auto_2713512 ) ) ( not ( = ?auto_2713509 ?auto_2713512 ) ) ( not ( = ?auto_2713516 ?auto_2713512 ) ) ( LIFTING ?auto_2713517 ?auto_2713518 ) ( IS-CRATE ?auto_2713518 ) ( not ( = ?auto_2713510 ?auto_2713518 ) ) ( not ( = ?auto_2713511 ?auto_2713518 ) ) ( not ( = ?auto_2713509 ?auto_2713518 ) ) ( not ( = ?auto_2713516 ?auto_2713518 ) ) ( not ( = ?auto_2713512 ?auto_2713518 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2713510 ?auto_2713511 )
      ( MAKE-2CRATE-VERIFY ?auto_2713509 ?auto_2713510 ?auto_2713511 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2722614 - SURFACE
      ?auto_2722615 - SURFACE
      ?auto_2722616 - SURFACE
      ?auto_2722617 - SURFACE
      ?auto_2722618 - SURFACE
      ?auto_2722619 - SURFACE
      ?auto_2722620 - SURFACE
      ?auto_2722621 - SURFACE
      ?auto_2722622 - SURFACE
      ?auto_2722623 - SURFACE
      ?auto_2722624 - SURFACE
      ?auto_2722625 - SURFACE
      ?auto_2722626 - SURFACE
      ?auto_2722627 - SURFACE
      ?auto_2722628 - SURFACE
    )
    :vars
    (
      ?auto_2722630 - HOIST
      ?auto_2722629 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2722630 ?auto_2722629 ) ( SURFACE-AT ?auto_2722627 ?auto_2722629 ) ( CLEAR ?auto_2722627 ) ( LIFTING ?auto_2722630 ?auto_2722628 ) ( IS-CRATE ?auto_2722628 ) ( not ( = ?auto_2722627 ?auto_2722628 ) ) ( ON ?auto_2722615 ?auto_2722614 ) ( ON ?auto_2722616 ?auto_2722615 ) ( ON ?auto_2722617 ?auto_2722616 ) ( ON ?auto_2722618 ?auto_2722617 ) ( ON ?auto_2722619 ?auto_2722618 ) ( ON ?auto_2722620 ?auto_2722619 ) ( ON ?auto_2722621 ?auto_2722620 ) ( ON ?auto_2722622 ?auto_2722621 ) ( ON ?auto_2722623 ?auto_2722622 ) ( ON ?auto_2722624 ?auto_2722623 ) ( ON ?auto_2722625 ?auto_2722624 ) ( ON ?auto_2722626 ?auto_2722625 ) ( ON ?auto_2722627 ?auto_2722626 ) ( not ( = ?auto_2722614 ?auto_2722615 ) ) ( not ( = ?auto_2722614 ?auto_2722616 ) ) ( not ( = ?auto_2722614 ?auto_2722617 ) ) ( not ( = ?auto_2722614 ?auto_2722618 ) ) ( not ( = ?auto_2722614 ?auto_2722619 ) ) ( not ( = ?auto_2722614 ?auto_2722620 ) ) ( not ( = ?auto_2722614 ?auto_2722621 ) ) ( not ( = ?auto_2722614 ?auto_2722622 ) ) ( not ( = ?auto_2722614 ?auto_2722623 ) ) ( not ( = ?auto_2722614 ?auto_2722624 ) ) ( not ( = ?auto_2722614 ?auto_2722625 ) ) ( not ( = ?auto_2722614 ?auto_2722626 ) ) ( not ( = ?auto_2722614 ?auto_2722627 ) ) ( not ( = ?auto_2722614 ?auto_2722628 ) ) ( not ( = ?auto_2722615 ?auto_2722616 ) ) ( not ( = ?auto_2722615 ?auto_2722617 ) ) ( not ( = ?auto_2722615 ?auto_2722618 ) ) ( not ( = ?auto_2722615 ?auto_2722619 ) ) ( not ( = ?auto_2722615 ?auto_2722620 ) ) ( not ( = ?auto_2722615 ?auto_2722621 ) ) ( not ( = ?auto_2722615 ?auto_2722622 ) ) ( not ( = ?auto_2722615 ?auto_2722623 ) ) ( not ( = ?auto_2722615 ?auto_2722624 ) ) ( not ( = ?auto_2722615 ?auto_2722625 ) ) ( not ( = ?auto_2722615 ?auto_2722626 ) ) ( not ( = ?auto_2722615 ?auto_2722627 ) ) ( not ( = ?auto_2722615 ?auto_2722628 ) ) ( not ( = ?auto_2722616 ?auto_2722617 ) ) ( not ( = ?auto_2722616 ?auto_2722618 ) ) ( not ( = ?auto_2722616 ?auto_2722619 ) ) ( not ( = ?auto_2722616 ?auto_2722620 ) ) ( not ( = ?auto_2722616 ?auto_2722621 ) ) ( not ( = ?auto_2722616 ?auto_2722622 ) ) ( not ( = ?auto_2722616 ?auto_2722623 ) ) ( not ( = ?auto_2722616 ?auto_2722624 ) ) ( not ( = ?auto_2722616 ?auto_2722625 ) ) ( not ( = ?auto_2722616 ?auto_2722626 ) ) ( not ( = ?auto_2722616 ?auto_2722627 ) ) ( not ( = ?auto_2722616 ?auto_2722628 ) ) ( not ( = ?auto_2722617 ?auto_2722618 ) ) ( not ( = ?auto_2722617 ?auto_2722619 ) ) ( not ( = ?auto_2722617 ?auto_2722620 ) ) ( not ( = ?auto_2722617 ?auto_2722621 ) ) ( not ( = ?auto_2722617 ?auto_2722622 ) ) ( not ( = ?auto_2722617 ?auto_2722623 ) ) ( not ( = ?auto_2722617 ?auto_2722624 ) ) ( not ( = ?auto_2722617 ?auto_2722625 ) ) ( not ( = ?auto_2722617 ?auto_2722626 ) ) ( not ( = ?auto_2722617 ?auto_2722627 ) ) ( not ( = ?auto_2722617 ?auto_2722628 ) ) ( not ( = ?auto_2722618 ?auto_2722619 ) ) ( not ( = ?auto_2722618 ?auto_2722620 ) ) ( not ( = ?auto_2722618 ?auto_2722621 ) ) ( not ( = ?auto_2722618 ?auto_2722622 ) ) ( not ( = ?auto_2722618 ?auto_2722623 ) ) ( not ( = ?auto_2722618 ?auto_2722624 ) ) ( not ( = ?auto_2722618 ?auto_2722625 ) ) ( not ( = ?auto_2722618 ?auto_2722626 ) ) ( not ( = ?auto_2722618 ?auto_2722627 ) ) ( not ( = ?auto_2722618 ?auto_2722628 ) ) ( not ( = ?auto_2722619 ?auto_2722620 ) ) ( not ( = ?auto_2722619 ?auto_2722621 ) ) ( not ( = ?auto_2722619 ?auto_2722622 ) ) ( not ( = ?auto_2722619 ?auto_2722623 ) ) ( not ( = ?auto_2722619 ?auto_2722624 ) ) ( not ( = ?auto_2722619 ?auto_2722625 ) ) ( not ( = ?auto_2722619 ?auto_2722626 ) ) ( not ( = ?auto_2722619 ?auto_2722627 ) ) ( not ( = ?auto_2722619 ?auto_2722628 ) ) ( not ( = ?auto_2722620 ?auto_2722621 ) ) ( not ( = ?auto_2722620 ?auto_2722622 ) ) ( not ( = ?auto_2722620 ?auto_2722623 ) ) ( not ( = ?auto_2722620 ?auto_2722624 ) ) ( not ( = ?auto_2722620 ?auto_2722625 ) ) ( not ( = ?auto_2722620 ?auto_2722626 ) ) ( not ( = ?auto_2722620 ?auto_2722627 ) ) ( not ( = ?auto_2722620 ?auto_2722628 ) ) ( not ( = ?auto_2722621 ?auto_2722622 ) ) ( not ( = ?auto_2722621 ?auto_2722623 ) ) ( not ( = ?auto_2722621 ?auto_2722624 ) ) ( not ( = ?auto_2722621 ?auto_2722625 ) ) ( not ( = ?auto_2722621 ?auto_2722626 ) ) ( not ( = ?auto_2722621 ?auto_2722627 ) ) ( not ( = ?auto_2722621 ?auto_2722628 ) ) ( not ( = ?auto_2722622 ?auto_2722623 ) ) ( not ( = ?auto_2722622 ?auto_2722624 ) ) ( not ( = ?auto_2722622 ?auto_2722625 ) ) ( not ( = ?auto_2722622 ?auto_2722626 ) ) ( not ( = ?auto_2722622 ?auto_2722627 ) ) ( not ( = ?auto_2722622 ?auto_2722628 ) ) ( not ( = ?auto_2722623 ?auto_2722624 ) ) ( not ( = ?auto_2722623 ?auto_2722625 ) ) ( not ( = ?auto_2722623 ?auto_2722626 ) ) ( not ( = ?auto_2722623 ?auto_2722627 ) ) ( not ( = ?auto_2722623 ?auto_2722628 ) ) ( not ( = ?auto_2722624 ?auto_2722625 ) ) ( not ( = ?auto_2722624 ?auto_2722626 ) ) ( not ( = ?auto_2722624 ?auto_2722627 ) ) ( not ( = ?auto_2722624 ?auto_2722628 ) ) ( not ( = ?auto_2722625 ?auto_2722626 ) ) ( not ( = ?auto_2722625 ?auto_2722627 ) ) ( not ( = ?auto_2722625 ?auto_2722628 ) ) ( not ( = ?auto_2722626 ?auto_2722627 ) ) ( not ( = ?auto_2722626 ?auto_2722628 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2722627 ?auto_2722628 )
      ( MAKE-14CRATE-VERIFY ?auto_2722614 ?auto_2722615 ?auto_2722616 ?auto_2722617 ?auto_2722618 ?auto_2722619 ?auto_2722620 ?auto_2722621 ?auto_2722622 ?auto_2722623 ?auto_2722624 ?auto_2722625 ?auto_2722626 ?auto_2722627 ?auto_2722628 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2722774 - SURFACE
      ?auto_2722775 - SURFACE
      ?auto_2722776 - SURFACE
      ?auto_2722777 - SURFACE
      ?auto_2722778 - SURFACE
      ?auto_2722779 - SURFACE
      ?auto_2722780 - SURFACE
      ?auto_2722781 - SURFACE
      ?auto_2722782 - SURFACE
      ?auto_2722783 - SURFACE
      ?auto_2722784 - SURFACE
      ?auto_2722785 - SURFACE
      ?auto_2722786 - SURFACE
      ?auto_2722787 - SURFACE
      ?auto_2722788 - SURFACE
    )
    :vars
    (
      ?auto_2722791 - HOIST
      ?auto_2722789 - PLACE
      ?auto_2722790 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2722791 ?auto_2722789 ) ( SURFACE-AT ?auto_2722787 ?auto_2722789 ) ( CLEAR ?auto_2722787 ) ( IS-CRATE ?auto_2722788 ) ( not ( = ?auto_2722787 ?auto_2722788 ) ) ( TRUCK-AT ?auto_2722790 ?auto_2722789 ) ( AVAILABLE ?auto_2722791 ) ( IN ?auto_2722788 ?auto_2722790 ) ( ON ?auto_2722787 ?auto_2722786 ) ( not ( = ?auto_2722786 ?auto_2722787 ) ) ( not ( = ?auto_2722786 ?auto_2722788 ) ) ( ON ?auto_2722775 ?auto_2722774 ) ( ON ?auto_2722776 ?auto_2722775 ) ( ON ?auto_2722777 ?auto_2722776 ) ( ON ?auto_2722778 ?auto_2722777 ) ( ON ?auto_2722779 ?auto_2722778 ) ( ON ?auto_2722780 ?auto_2722779 ) ( ON ?auto_2722781 ?auto_2722780 ) ( ON ?auto_2722782 ?auto_2722781 ) ( ON ?auto_2722783 ?auto_2722782 ) ( ON ?auto_2722784 ?auto_2722783 ) ( ON ?auto_2722785 ?auto_2722784 ) ( ON ?auto_2722786 ?auto_2722785 ) ( not ( = ?auto_2722774 ?auto_2722775 ) ) ( not ( = ?auto_2722774 ?auto_2722776 ) ) ( not ( = ?auto_2722774 ?auto_2722777 ) ) ( not ( = ?auto_2722774 ?auto_2722778 ) ) ( not ( = ?auto_2722774 ?auto_2722779 ) ) ( not ( = ?auto_2722774 ?auto_2722780 ) ) ( not ( = ?auto_2722774 ?auto_2722781 ) ) ( not ( = ?auto_2722774 ?auto_2722782 ) ) ( not ( = ?auto_2722774 ?auto_2722783 ) ) ( not ( = ?auto_2722774 ?auto_2722784 ) ) ( not ( = ?auto_2722774 ?auto_2722785 ) ) ( not ( = ?auto_2722774 ?auto_2722786 ) ) ( not ( = ?auto_2722774 ?auto_2722787 ) ) ( not ( = ?auto_2722774 ?auto_2722788 ) ) ( not ( = ?auto_2722775 ?auto_2722776 ) ) ( not ( = ?auto_2722775 ?auto_2722777 ) ) ( not ( = ?auto_2722775 ?auto_2722778 ) ) ( not ( = ?auto_2722775 ?auto_2722779 ) ) ( not ( = ?auto_2722775 ?auto_2722780 ) ) ( not ( = ?auto_2722775 ?auto_2722781 ) ) ( not ( = ?auto_2722775 ?auto_2722782 ) ) ( not ( = ?auto_2722775 ?auto_2722783 ) ) ( not ( = ?auto_2722775 ?auto_2722784 ) ) ( not ( = ?auto_2722775 ?auto_2722785 ) ) ( not ( = ?auto_2722775 ?auto_2722786 ) ) ( not ( = ?auto_2722775 ?auto_2722787 ) ) ( not ( = ?auto_2722775 ?auto_2722788 ) ) ( not ( = ?auto_2722776 ?auto_2722777 ) ) ( not ( = ?auto_2722776 ?auto_2722778 ) ) ( not ( = ?auto_2722776 ?auto_2722779 ) ) ( not ( = ?auto_2722776 ?auto_2722780 ) ) ( not ( = ?auto_2722776 ?auto_2722781 ) ) ( not ( = ?auto_2722776 ?auto_2722782 ) ) ( not ( = ?auto_2722776 ?auto_2722783 ) ) ( not ( = ?auto_2722776 ?auto_2722784 ) ) ( not ( = ?auto_2722776 ?auto_2722785 ) ) ( not ( = ?auto_2722776 ?auto_2722786 ) ) ( not ( = ?auto_2722776 ?auto_2722787 ) ) ( not ( = ?auto_2722776 ?auto_2722788 ) ) ( not ( = ?auto_2722777 ?auto_2722778 ) ) ( not ( = ?auto_2722777 ?auto_2722779 ) ) ( not ( = ?auto_2722777 ?auto_2722780 ) ) ( not ( = ?auto_2722777 ?auto_2722781 ) ) ( not ( = ?auto_2722777 ?auto_2722782 ) ) ( not ( = ?auto_2722777 ?auto_2722783 ) ) ( not ( = ?auto_2722777 ?auto_2722784 ) ) ( not ( = ?auto_2722777 ?auto_2722785 ) ) ( not ( = ?auto_2722777 ?auto_2722786 ) ) ( not ( = ?auto_2722777 ?auto_2722787 ) ) ( not ( = ?auto_2722777 ?auto_2722788 ) ) ( not ( = ?auto_2722778 ?auto_2722779 ) ) ( not ( = ?auto_2722778 ?auto_2722780 ) ) ( not ( = ?auto_2722778 ?auto_2722781 ) ) ( not ( = ?auto_2722778 ?auto_2722782 ) ) ( not ( = ?auto_2722778 ?auto_2722783 ) ) ( not ( = ?auto_2722778 ?auto_2722784 ) ) ( not ( = ?auto_2722778 ?auto_2722785 ) ) ( not ( = ?auto_2722778 ?auto_2722786 ) ) ( not ( = ?auto_2722778 ?auto_2722787 ) ) ( not ( = ?auto_2722778 ?auto_2722788 ) ) ( not ( = ?auto_2722779 ?auto_2722780 ) ) ( not ( = ?auto_2722779 ?auto_2722781 ) ) ( not ( = ?auto_2722779 ?auto_2722782 ) ) ( not ( = ?auto_2722779 ?auto_2722783 ) ) ( not ( = ?auto_2722779 ?auto_2722784 ) ) ( not ( = ?auto_2722779 ?auto_2722785 ) ) ( not ( = ?auto_2722779 ?auto_2722786 ) ) ( not ( = ?auto_2722779 ?auto_2722787 ) ) ( not ( = ?auto_2722779 ?auto_2722788 ) ) ( not ( = ?auto_2722780 ?auto_2722781 ) ) ( not ( = ?auto_2722780 ?auto_2722782 ) ) ( not ( = ?auto_2722780 ?auto_2722783 ) ) ( not ( = ?auto_2722780 ?auto_2722784 ) ) ( not ( = ?auto_2722780 ?auto_2722785 ) ) ( not ( = ?auto_2722780 ?auto_2722786 ) ) ( not ( = ?auto_2722780 ?auto_2722787 ) ) ( not ( = ?auto_2722780 ?auto_2722788 ) ) ( not ( = ?auto_2722781 ?auto_2722782 ) ) ( not ( = ?auto_2722781 ?auto_2722783 ) ) ( not ( = ?auto_2722781 ?auto_2722784 ) ) ( not ( = ?auto_2722781 ?auto_2722785 ) ) ( not ( = ?auto_2722781 ?auto_2722786 ) ) ( not ( = ?auto_2722781 ?auto_2722787 ) ) ( not ( = ?auto_2722781 ?auto_2722788 ) ) ( not ( = ?auto_2722782 ?auto_2722783 ) ) ( not ( = ?auto_2722782 ?auto_2722784 ) ) ( not ( = ?auto_2722782 ?auto_2722785 ) ) ( not ( = ?auto_2722782 ?auto_2722786 ) ) ( not ( = ?auto_2722782 ?auto_2722787 ) ) ( not ( = ?auto_2722782 ?auto_2722788 ) ) ( not ( = ?auto_2722783 ?auto_2722784 ) ) ( not ( = ?auto_2722783 ?auto_2722785 ) ) ( not ( = ?auto_2722783 ?auto_2722786 ) ) ( not ( = ?auto_2722783 ?auto_2722787 ) ) ( not ( = ?auto_2722783 ?auto_2722788 ) ) ( not ( = ?auto_2722784 ?auto_2722785 ) ) ( not ( = ?auto_2722784 ?auto_2722786 ) ) ( not ( = ?auto_2722784 ?auto_2722787 ) ) ( not ( = ?auto_2722784 ?auto_2722788 ) ) ( not ( = ?auto_2722785 ?auto_2722786 ) ) ( not ( = ?auto_2722785 ?auto_2722787 ) ) ( not ( = ?auto_2722785 ?auto_2722788 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2722786 ?auto_2722787 ?auto_2722788 )
      ( MAKE-14CRATE-VERIFY ?auto_2722774 ?auto_2722775 ?auto_2722776 ?auto_2722777 ?auto_2722778 ?auto_2722779 ?auto_2722780 ?auto_2722781 ?auto_2722782 ?auto_2722783 ?auto_2722784 ?auto_2722785 ?auto_2722786 ?auto_2722787 ?auto_2722788 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2722949 - SURFACE
      ?auto_2722950 - SURFACE
      ?auto_2722951 - SURFACE
      ?auto_2722952 - SURFACE
      ?auto_2722953 - SURFACE
      ?auto_2722954 - SURFACE
      ?auto_2722955 - SURFACE
      ?auto_2722956 - SURFACE
      ?auto_2722957 - SURFACE
      ?auto_2722958 - SURFACE
      ?auto_2722959 - SURFACE
      ?auto_2722960 - SURFACE
      ?auto_2722961 - SURFACE
      ?auto_2722962 - SURFACE
      ?auto_2722963 - SURFACE
    )
    :vars
    (
      ?auto_2722964 - HOIST
      ?auto_2722967 - PLACE
      ?auto_2722965 - TRUCK
      ?auto_2722966 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2722964 ?auto_2722967 ) ( SURFACE-AT ?auto_2722962 ?auto_2722967 ) ( CLEAR ?auto_2722962 ) ( IS-CRATE ?auto_2722963 ) ( not ( = ?auto_2722962 ?auto_2722963 ) ) ( AVAILABLE ?auto_2722964 ) ( IN ?auto_2722963 ?auto_2722965 ) ( ON ?auto_2722962 ?auto_2722961 ) ( not ( = ?auto_2722961 ?auto_2722962 ) ) ( not ( = ?auto_2722961 ?auto_2722963 ) ) ( TRUCK-AT ?auto_2722965 ?auto_2722966 ) ( not ( = ?auto_2722966 ?auto_2722967 ) ) ( ON ?auto_2722950 ?auto_2722949 ) ( ON ?auto_2722951 ?auto_2722950 ) ( ON ?auto_2722952 ?auto_2722951 ) ( ON ?auto_2722953 ?auto_2722952 ) ( ON ?auto_2722954 ?auto_2722953 ) ( ON ?auto_2722955 ?auto_2722954 ) ( ON ?auto_2722956 ?auto_2722955 ) ( ON ?auto_2722957 ?auto_2722956 ) ( ON ?auto_2722958 ?auto_2722957 ) ( ON ?auto_2722959 ?auto_2722958 ) ( ON ?auto_2722960 ?auto_2722959 ) ( ON ?auto_2722961 ?auto_2722960 ) ( not ( = ?auto_2722949 ?auto_2722950 ) ) ( not ( = ?auto_2722949 ?auto_2722951 ) ) ( not ( = ?auto_2722949 ?auto_2722952 ) ) ( not ( = ?auto_2722949 ?auto_2722953 ) ) ( not ( = ?auto_2722949 ?auto_2722954 ) ) ( not ( = ?auto_2722949 ?auto_2722955 ) ) ( not ( = ?auto_2722949 ?auto_2722956 ) ) ( not ( = ?auto_2722949 ?auto_2722957 ) ) ( not ( = ?auto_2722949 ?auto_2722958 ) ) ( not ( = ?auto_2722949 ?auto_2722959 ) ) ( not ( = ?auto_2722949 ?auto_2722960 ) ) ( not ( = ?auto_2722949 ?auto_2722961 ) ) ( not ( = ?auto_2722949 ?auto_2722962 ) ) ( not ( = ?auto_2722949 ?auto_2722963 ) ) ( not ( = ?auto_2722950 ?auto_2722951 ) ) ( not ( = ?auto_2722950 ?auto_2722952 ) ) ( not ( = ?auto_2722950 ?auto_2722953 ) ) ( not ( = ?auto_2722950 ?auto_2722954 ) ) ( not ( = ?auto_2722950 ?auto_2722955 ) ) ( not ( = ?auto_2722950 ?auto_2722956 ) ) ( not ( = ?auto_2722950 ?auto_2722957 ) ) ( not ( = ?auto_2722950 ?auto_2722958 ) ) ( not ( = ?auto_2722950 ?auto_2722959 ) ) ( not ( = ?auto_2722950 ?auto_2722960 ) ) ( not ( = ?auto_2722950 ?auto_2722961 ) ) ( not ( = ?auto_2722950 ?auto_2722962 ) ) ( not ( = ?auto_2722950 ?auto_2722963 ) ) ( not ( = ?auto_2722951 ?auto_2722952 ) ) ( not ( = ?auto_2722951 ?auto_2722953 ) ) ( not ( = ?auto_2722951 ?auto_2722954 ) ) ( not ( = ?auto_2722951 ?auto_2722955 ) ) ( not ( = ?auto_2722951 ?auto_2722956 ) ) ( not ( = ?auto_2722951 ?auto_2722957 ) ) ( not ( = ?auto_2722951 ?auto_2722958 ) ) ( not ( = ?auto_2722951 ?auto_2722959 ) ) ( not ( = ?auto_2722951 ?auto_2722960 ) ) ( not ( = ?auto_2722951 ?auto_2722961 ) ) ( not ( = ?auto_2722951 ?auto_2722962 ) ) ( not ( = ?auto_2722951 ?auto_2722963 ) ) ( not ( = ?auto_2722952 ?auto_2722953 ) ) ( not ( = ?auto_2722952 ?auto_2722954 ) ) ( not ( = ?auto_2722952 ?auto_2722955 ) ) ( not ( = ?auto_2722952 ?auto_2722956 ) ) ( not ( = ?auto_2722952 ?auto_2722957 ) ) ( not ( = ?auto_2722952 ?auto_2722958 ) ) ( not ( = ?auto_2722952 ?auto_2722959 ) ) ( not ( = ?auto_2722952 ?auto_2722960 ) ) ( not ( = ?auto_2722952 ?auto_2722961 ) ) ( not ( = ?auto_2722952 ?auto_2722962 ) ) ( not ( = ?auto_2722952 ?auto_2722963 ) ) ( not ( = ?auto_2722953 ?auto_2722954 ) ) ( not ( = ?auto_2722953 ?auto_2722955 ) ) ( not ( = ?auto_2722953 ?auto_2722956 ) ) ( not ( = ?auto_2722953 ?auto_2722957 ) ) ( not ( = ?auto_2722953 ?auto_2722958 ) ) ( not ( = ?auto_2722953 ?auto_2722959 ) ) ( not ( = ?auto_2722953 ?auto_2722960 ) ) ( not ( = ?auto_2722953 ?auto_2722961 ) ) ( not ( = ?auto_2722953 ?auto_2722962 ) ) ( not ( = ?auto_2722953 ?auto_2722963 ) ) ( not ( = ?auto_2722954 ?auto_2722955 ) ) ( not ( = ?auto_2722954 ?auto_2722956 ) ) ( not ( = ?auto_2722954 ?auto_2722957 ) ) ( not ( = ?auto_2722954 ?auto_2722958 ) ) ( not ( = ?auto_2722954 ?auto_2722959 ) ) ( not ( = ?auto_2722954 ?auto_2722960 ) ) ( not ( = ?auto_2722954 ?auto_2722961 ) ) ( not ( = ?auto_2722954 ?auto_2722962 ) ) ( not ( = ?auto_2722954 ?auto_2722963 ) ) ( not ( = ?auto_2722955 ?auto_2722956 ) ) ( not ( = ?auto_2722955 ?auto_2722957 ) ) ( not ( = ?auto_2722955 ?auto_2722958 ) ) ( not ( = ?auto_2722955 ?auto_2722959 ) ) ( not ( = ?auto_2722955 ?auto_2722960 ) ) ( not ( = ?auto_2722955 ?auto_2722961 ) ) ( not ( = ?auto_2722955 ?auto_2722962 ) ) ( not ( = ?auto_2722955 ?auto_2722963 ) ) ( not ( = ?auto_2722956 ?auto_2722957 ) ) ( not ( = ?auto_2722956 ?auto_2722958 ) ) ( not ( = ?auto_2722956 ?auto_2722959 ) ) ( not ( = ?auto_2722956 ?auto_2722960 ) ) ( not ( = ?auto_2722956 ?auto_2722961 ) ) ( not ( = ?auto_2722956 ?auto_2722962 ) ) ( not ( = ?auto_2722956 ?auto_2722963 ) ) ( not ( = ?auto_2722957 ?auto_2722958 ) ) ( not ( = ?auto_2722957 ?auto_2722959 ) ) ( not ( = ?auto_2722957 ?auto_2722960 ) ) ( not ( = ?auto_2722957 ?auto_2722961 ) ) ( not ( = ?auto_2722957 ?auto_2722962 ) ) ( not ( = ?auto_2722957 ?auto_2722963 ) ) ( not ( = ?auto_2722958 ?auto_2722959 ) ) ( not ( = ?auto_2722958 ?auto_2722960 ) ) ( not ( = ?auto_2722958 ?auto_2722961 ) ) ( not ( = ?auto_2722958 ?auto_2722962 ) ) ( not ( = ?auto_2722958 ?auto_2722963 ) ) ( not ( = ?auto_2722959 ?auto_2722960 ) ) ( not ( = ?auto_2722959 ?auto_2722961 ) ) ( not ( = ?auto_2722959 ?auto_2722962 ) ) ( not ( = ?auto_2722959 ?auto_2722963 ) ) ( not ( = ?auto_2722960 ?auto_2722961 ) ) ( not ( = ?auto_2722960 ?auto_2722962 ) ) ( not ( = ?auto_2722960 ?auto_2722963 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2722961 ?auto_2722962 ?auto_2722963 )
      ( MAKE-14CRATE-VERIFY ?auto_2722949 ?auto_2722950 ?auto_2722951 ?auto_2722952 ?auto_2722953 ?auto_2722954 ?auto_2722955 ?auto_2722956 ?auto_2722957 ?auto_2722958 ?auto_2722959 ?auto_2722960 ?auto_2722961 ?auto_2722962 ?auto_2722963 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2723138 - SURFACE
      ?auto_2723139 - SURFACE
      ?auto_2723140 - SURFACE
      ?auto_2723141 - SURFACE
      ?auto_2723142 - SURFACE
      ?auto_2723143 - SURFACE
      ?auto_2723144 - SURFACE
      ?auto_2723145 - SURFACE
      ?auto_2723146 - SURFACE
      ?auto_2723147 - SURFACE
      ?auto_2723148 - SURFACE
      ?auto_2723149 - SURFACE
      ?auto_2723150 - SURFACE
      ?auto_2723151 - SURFACE
      ?auto_2723152 - SURFACE
    )
    :vars
    (
      ?auto_2723155 - HOIST
      ?auto_2723154 - PLACE
      ?auto_2723157 - TRUCK
      ?auto_2723153 - PLACE
      ?auto_2723156 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2723155 ?auto_2723154 ) ( SURFACE-AT ?auto_2723151 ?auto_2723154 ) ( CLEAR ?auto_2723151 ) ( IS-CRATE ?auto_2723152 ) ( not ( = ?auto_2723151 ?auto_2723152 ) ) ( AVAILABLE ?auto_2723155 ) ( ON ?auto_2723151 ?auto_2723150 ) ( not ( = ?auto_2723150 ?auto_2723151 ) ) ( not ( = ?auto_2723150 ?auto_2723152 ) ) ( TRUCK-AT ?auto_2723157 ?auto_2723153 ) ( not ( = ?auto_2723153 ?auto_2723154 ) ) ( HOIST-AT ?auto_2723156 ?auto_2723153 ) ( LIFTING ?auto_2723156 ?auto_2723152 ) ( not ( = ?auto_2723155 ?auto_2723156 ) ) ( ON ?auto_2723139 ?auto_2723138 ) ( ON ?auto_2723140 ?auto_2723139 ) ( ON ?auto_2723141 ?auto_2723140 ) ( ON ?auto_2723142 ?auto_2723141 ) ( ON ?auto_2723143 ?auto_2723142 ) ( ON ?auto_2723144 ?auto_2723143 ) ( ON ?auto_2723145 ?auto_2723144 ) ( ON ?auto_2723146 ?auto_2723145 ) ( ON ?auto_2723147 ?auto_2723146 ) ( ON ?auto_2723148 ?auto_2723147 ) ( ON ?auto_2723149 ?auto_2723148 ) ( ON ?auto_2723150 ?auto_2723149 ) ( not ( = ?auto_2723138 ?auto_2723139 ) ) ( not ( = ?auto_2723138 ?auto_2723140 ) ) ( not ( = ?auto_2723138 ?auto_2723141 ) ) ( not ( = ?auto_2723138 ?auto_2723142 ) ) ( not ( = ?auto_2723138 ?auto_2723143 ) ) ( not ( = ?auto_2723138 ?auto_2723144 ) ) ( not ( = ?auto_2723138 ?auto_2723145 ) ) ( not ( = ?auto_2723138 ?auto_2723146 ) ) ( not ( = ?auto_2723138 ?auto_2723147 ) ) ( not ( = ?auto_2723138 ?auto_2723148 ) ) ( not ( = ?auto_2723138 ?auto_2723149 ) ) ( not ( = ?auto_2723138 ?auto_2723150 ) ) ( not ( = ?auto_2723138 ?auto_2723151 ) ) ( not ( = ?auto_2723138 ?auto_2723152 ) ) ( not ( = ?auto_2723139 ?auto_2723140 ) ) ( not ( = ?auto_2723139 ?auto_2723141 ) ) ( not ( = ?auto_2723139 ?auto_2723142 ) ) ( not ( = ?auto_2723139 ?auto_2723143 ) ) ( not ( = ?auto_2723139 ?auto_2723144 ) ) ( not ( = ?auto_2723139 ?auto_2723145 ) ) ( not ( = ?auto_2723139 ?auto_2723146 ) ) ( not ( = ?auto_2723139 ?auto_2723147 ) ) ( not ( = ?auto_2723139 ?auto_2723148 ) ) ( not ( = ?auto_2723139 ?auto_2723149 ) ) ( not ( = ?auto_2723139 ?auto_2723150 ) ) ( not ( = ?auto_2723139 ?auto_2723151 ) ) ( not ( = ?auto_2723139 ?auto_2723152 ) ) ( not ( = ?auto_2723140 ?auto_2723141 ) ) ( not ( = ?auto_2723140 ?auto_2723142 ) ) ( not ( = ?auto_2723140 ?auto_2723143 ) ) ( not ( = ?auto_2723140 ?auto_2723144 ) ) ( not ( = ?auto_2723140 ?auto_2723145 ) ) ( not ( = ?auto_2723140 ?auto_2723146 ) ) ( not ( = ?auto_2723140 ?auto_2723147 ) ) ( not ( = ?auto_2723140 ?auto_2723148 ) ) ( not ( = ?auto_2723140 ?auto_2723149 ) ) ( not ( = ?auto_2723140 ?auto_2723150 ) ) ( not ( = ?auto_2723140 ?auto_2723151 ) ) ( not ( = ?auto_2723140 ?auto_2723152 ) ) ( not ( = ?auto_2723141 ?auto_2723142 ) ) ( not ( = ?auto_2723141 ?auto_2723143 ) ) ( not ( = ?auto_2723141 ?auto_2723144 ) ) ( not ( = ?auto_2723141 ?auto_2723145 ) ) ( not ( = ?auto_2723141 ?auto_2723146 ) ) ( not ( = ?auto_2723141 ?auto_2723147 ) ) ( not ( = ?auto_2723141 ?auto_2723148 ) ) ( not ( = ?auto_2723141 ?auto_2723149 ) ) ( not ( = ?auto_2723141 ?auto_2723150 ) ) ( not ( = ?auto_2723141 ?auto_2723151 ) ) ( not ( = ?auto_2723141 ?auto_2723152 ) ) ( not ( = ?auto_2723142 ?auto_2723143 ) ) ( not ( = ?auto_2723142 ?auto_2723144 ) ) ( not ( = ?auto_2723142 ?auto_2723145 ) ) ( not ( = ?auto_2723142 ?auto_2723146 ) ) ( not ( = ?auto_2723142 ?auto_2723147 ) ) ( not ( = ?auto_2723142 ?auto_2723148 ) ) ( not ( = ?auto_2723142 ?auto_2723149 ) ) ( not ( = ?auto_2723142 ?auto_2723150 ) ) ( not ( = ?auto_2723142 ?auto_2723151 ) ) ( not ( = ?auto_2723142 ?auto_2723152 ) ) ( not ( = ?auto_2723143 ?auto_2723144 ) ) ( not ( = ?auto_2723143 ?auto_2723145 ) ) ( not ( = ?auto_2723143 ?auto_2723146 ) ) ( not ( = ?auto_2723143 ?auto_2723147 ) ) ( not ( = ?auto_2723143 ?auto_2723148 ) ) ( not ( = ?auto_2723143 ?auto_2723149 ) ) ( not ( = ?auto_2723143 ?auto_2723150 ) ) ( not ( = ?auto_2723143 ?auto_2723151 ) ) ( not ( = ?auto_2723143 ?auto_2723152 ) ) ( not ( = ?auto_2723144 ?auto_2723145 ) ) ( not ( = ?auto_2723144 ?auto_2723146 ) ) ( not ( = ?auto_2723144 ?auto_2723147 ) ) ( not ( = ?auto_2723144 ?auto_2723148 ) ) ( not ( = ?auto_2723144 ?auto_2723149 ) ) ( not ( = ?auto_2723144 ?auto_2723150 ) ) ( not ( = ?auto_2723144 ?auto_2723151 ) ) ( not ( = ?auto_2723144 ?auto_2723152 ) ) ( not ( = ?auto_2723145 ?auto_2723146 ) ) ( not ( = ?auto_2723145 ?auto_2723147 ) ) ( not ( = ?auto_2723145 ?auto_2723148 ) ) ( not ( = ?auto_2723145 ?auto_2723149 ) ) ( not ( = ?auto_2723145 ?auto_2723150 ) ) ( not ( = ?auto_2723145 ?auto_2723151 ) ) ( not ( = ?auto_2723145 ?auto_2723152 ) ) ( not ( = ?auto_2723146 ?auto_2723147 ) ) ( not ( = ?auto_2723146 ?auto_2723148 ) ) ( not ( = ?auto_2723146 ?auto_2723149 ) ) ( not ( = ?auto_2723146 ?auto_2723150 ) ) ( not ( = ?auto_2723146 ?auto_2723151 ) ) ( not ( = ?auto_2723146 ?auto_2723152 ) ) ( not ( = ?auto_2723147 ?auto_2723148 ) ) ( not ( = ?auto_2723147 ?auto_2723149 ) ) ( not ( = ?auto_2723147 ?auto_2723150 ) ) ( not ( = ?auto_2723147 ?auto_2723151 ) ) ( not ( = ?auto_2723147 ?auto_2723152 ) ) ( not ( = ?auto_2723148 ?auto_2723149 ) ) ( not ( = ?auto_2723148 ?auto_2723150 ) ) ( not ( = ?auto_2723148 ?auto_2723151 ) ) ( not ( = ?auto_2723148 ?auto_2723152 ) ) ( not ( = ?auto_2723149 ?auto_2723150 ) ) ( not ( = ?auto_2723149 ?auto_2723151 ) ) ( not ( = ?auto_2723149 ?auto_2723152 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2723150 ?auto_2723151 ?auto_2723152 )
      ( MAKE-14CRATE-VERIFY ?auto_2723138 ?auto_2723139 ?auto_2723140 ?auto_2723141 ?auto_2723142 ?auto_2723143 ?auto_2723144 ?auto_2723145 ?auto_2723146 ?auto_2723147 ?auto_2723148 ?auto_2723149 ?auto_2723150 ?auto_2723151 ?auto_2723152 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2723341 - SURFACE
      ?auto_2723342 - SURFACE
      ?auto_2723343 - SURFACE
      ?auto_2723344 - SURFACE
      ?auto_2723345 - SURFACE
      ?auto_2723346 - SURFACE
      ?auto_2723347 - SURFACE
      ?auto_2723348 - SURFACE
      ?auto_2723349 - SURFACE
      ?auto_2723350 - SURFACE
      ?auto_2723351 - SURFACE
      ?auto_2723352 - SURFACE
      ?auto_2723353 - SURFACE
      ?auto_2723354 - SURFACE
      ?auto_2723355 - SURFACE
    )
    :vars
    (
      ?auto_2723359 - HOIST
      ?auto_2723358 - PLACE
      ?auto_2723357 - TRUCK
      ?auto_2723360 - PLACE
      ?auto_2723361 - HOIST
      ?auto_2723356 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2723359 ?auto_2723358 ) ( SURFACE-AT ?auto_2723354 ?auto_2723358 ) ( CLEAR ?auto_2723354 ) ( IS-CRATE ?auto_2723355 ) ( not ( = ?auto_2723354 ?auto_2723355 ) ) ( AVAILABLE ?auto_2723359 ) ( ON ?auto_2723354 ?auto_2723353 ) ( not ( = ?auto_2723353 ?auto_2723354 ) ) ( not ( = ?auto_2723353 ?auto_2723355 ) ) ( TRUCK-AT ?auto_2723357 ?auto_2723360 ) ( not ( = ?auto_2723360 ?auto_2723358 ) ) ( HOIST-AT ?auto_2723361 ?auto_2723360 ) ( not ( = ?auto_2723359 ?auto_2723361 ) ) ( AVAILABLE ?auto_2723361 ) ( SURFACE-AT ?auto_2723355 ?auto_2723360 ) ( ON ?auto_2723355 ?auto_2723356 ) ( CLEAR ?auto_2723355 ) ( not ( = ?auto_2723354 ?auto_2723356 ) ) ( not ( = ?auto_2723355 ?auto_2723356 ) ) ( not ( = ?auto_2723353 ?auto_2723356 ) ) ( ON ?auto_2723342 ?auto_2723341 ) ( ON ?auto_2723343 ?auto_2723342 ) ( ON ?auto_2723344 ?auto_2723343 ) ( ON ?auto_2723345 ?auto_2723344 ) ( ON ?auto_2723346 ?auto_2723345 ) ( ON ?auto_2723347 ?auto_2723346 ) ( ON ?auto_2723348 ?auto_2723347 ) ( ON ?auto_2723349 ?auto_2723348 ) ( ON ?auto_2723350 ?auto_2723349 ) ( ON ?auto_2723351 ?auto_2723350 ) ( ON ?auto_2723352 ?auto_2723351 ) ( ON ?auto_2723353 ?auto_2723352 ) ( not ( = ?auto_2723341 ?auto_2723342 ) ) ( not ( = ?auto_2723341 ?auto_2723343 ) ) ( not ( = ?auto_2723341 ?auto_2723344 ) ) ( not ( = ?auto_2723341 ?auto_2723345 ) ) ( not ( = ?auto_2723341 ?auto_2723346 ) ) ( not ( = ?auto_2723341 ?auto_2723347 ) ) ( not ( = ?auto_2723341 ?auto_2723348 ) ) ( not ( = ?auto_2723341 ?auto_2723349 ) ) ( not ( = ?auto_2723341 ?auto_2723350 ) ) ( not ( = ?auto_2723341 ?auto_2723351 ) ) ( not ( = ?auto_2723341 ?auto_2723352 ) ) ( not ( = ?auto_2723341 ?auto_2723353 ) ) ( not ( = ?auto_2723341 ?auto_2723354 ) ) ( not ( = ?auto_2723341 ?auto_2723355 ) ) ( not ( = ?auto_2723341 ?auto_2723356 ) ) ( not ( = ?auto_2723342 ?auto_2723343 ) ) ( not ( = ?auto_2723342 ?auto_2723344 ) ) ( not ( = ?auto_2723342 ?auto_2723345 ) ) ( not ( = ?auto_2723342 ?auto_2723346 ) ) ( not ( = ?auto_2723342 ?auto_2723347 ) ) ( not ( = ?auto_2723342 ?auto_2723348 ) ) ( not ( = ?auto_2723342 ?auto_2723349 ) ) ( not ( = ?auto_2723342 ?auto_2723350 ) ) ( not ( = ?auto_2723342 ?auto_2723351 ) ) ( not ( = ?auto_2723342 ?auto_2723352 ) ) ( not ( = ?auto_2723342 ?auto_2723353 ) ) ( not ( = ?auto_2723342 ?auto_2723354 ) ) ( not ( = ?auto_2723342 ?auto_2723355 ) ) ( not ( = ?auto_2723342 ?auto_2723356 ) ) ( not ( = ?auto_2723343 ?auto_2723344 ) ) ( not ( = ?auto_2723343 ?auto_2723345 ) ) ( not ( = ?auto_2723343 ?auto_2723346 ) ) ( not ( = ?auto_2723343 ?auto_2723347 ) ) ( not ( = ?auto_2723343 ?auto_2723348 ) ) ( not ( = ?auto_2723343 ?auto_2723349 ) ) ( not ( = ?auto_2723343 ?auto_2723350 ) ) ( not ( = ?auto_2723343 ?auto_2723351 ) ) ( not ( = ?auto_2723343 ?auto_2723352 ) ) ( not ( = ?auto_2723343 ?auto_2723353 ) ) ( not ( = ?auto_2723343 ?auto_2723354 ) ) ( not ( = ?auto_2723343 ?auto_2723355 ) ) ( not ( = ?auto_2723343 ?auto_2723356 ) ) ( not ( = ?auto_2723344 ?auto_2723345 ) ) ( not ( = ?auto_2723344 ?auto_2723346 ) ) ( not ( = ?auto_2723344 ?auto_2723347 ) ) ( not ( = ?auto_2723344 ?auto_2723348 ) ) ( not ( = ?auto_2723344 ?auto_2723349 ) ) ( not ( = ?auto_2723344 ?auto_2723350 ) ) ( not ( = ?auto_2723344 ?auto_2723351 ) ) ( not ( = ?auto_2723344 ?auto_2723352 ) ) ( not ( = ?auto_2723344 ?auto_2723353 ) ) ( not ( = ?auto_2723344 ?auto_2723354 ) ) ( not ( = ?auto_2723344 ?auto_2723355 ) ) ( not ( = ?auto_2723344 ?auto_2723356 ) ) ( not ( = ?auto_2723345 ?auto_2723346 ) ) ( not ( = ?auto_2723345 ?auto_2723347 ) ) ( not ( = ?auto_2723345 ?auto_2723348 ) ) ( not ( = ?auto_2723345 ?auto_2723349 ) ) ( not ( = ?auto_2723345 ?auto_2723350 ) ) ( not ( = ?auto_2723345 ?auto_2723351 ) ) ( not ( = ?auto_2723345 ?auto_2723352 ) ) ( not ( = ?auto_2723345 ?auto_2723353 ) ) ( not ( = ?auto_2723345 ?auto_2723354 ) ) ( not ( = ?auto_2723345 ?auto_2723355 ) ) ( not ( = ?auto_2723345 ?auto_2723356 ) ) ( not ( = ?auto_2723346 ?auto_2723347 ) ) ( not ( = ?auto_2723346 ?auto_2723348 ) ) ( not ( = ?auto_2723346 ?auto_2723349 ) ) ( not ( = ?auto_2723346 ?auto_2723350 ) ) ( not ( = ?auto_2723346 ?auto_2723351 ) ) ( not ( = ?auto_2723346 ?auto_2723352 ) ) ( not ( = ?auto_2723346 ?auto_2723353 ) ) ( not ( = ?auto_2723346 ?auto_2723354 ) ) ( not ( = ?auto_2723346 ?auto_2723355 ) ) ( not ( = ?auto_2723346 ?auto_2723356 ) ) ( not ( = ?auto_2723347 ?auto_2723348 ) ) ( not ( = ?auto_2723347 ?auto_2723349 ) ) ( not ( = ?auto_2723347 ?auto_2723350 ) ) ( not ( = ?auto_2723347 ?auto_2723351 ) ) ( not ( = ?auto_2723347 ?auto_2723352 ) ) ( not ( = ?auto_2723347 ?auto_2723353 ) ) ( not ( = ?auto_2723347 ?auto_2723354 ) ) ( not ( = ?auto_2723347 ?auto_2723355 ) ) ( not ( = ?auto_2723347 ?auto_2723356 ) ) ( not ( = ?auto_2723348 ?auto_2723349 ) ) ( not ( = ?auto_2723348 ?auto_2723350 ) ) ( not ( = ?auto_2723348 ?auto_2723351 ) ) ( not ( = ?auto_2723348 ?auto_2723352 ) ) ( not ( = ?auto_2723348 ?auto_2723353 ) ) ( not ( = ?auto_2723348 ?auto_2723354 ) ) ( not ( = ?auto_2723348 ?auto_2723355 ) ) ( not ( = ?auto_2723348 ?auto_2723356 ) ) ( not ( = ?auto_2723349 ?auto_2723350 ) ) ( not ( = ?auto_2723349 ?auto_2723351 ) ) ( not ( = ?auto_2723349 ?auto_2723352 ) ) ( not ( = ?auto_2723349 ?auto_2723353 ) ) ( not ( = ?auto_2723349 ?auto_2723354 ) ) ( not ( = ?auto_2723349 ?auto_2723355 ) ) ( not ( = ?auto_2723349 ?auto_2723356 ) ) ( not ( = ?auto_2723350 ?auto_2723351 ) ) ( not ( = ?auto_2723350 ?auto_2723352 ) ) ( not ( = ?auto_2723350 ?auto_2723353 ) ) ( not ( = ?auto_2723350 ?auto_2723354 ) ) ( not ( = ?auto_2723350 ?auto_2723355 ) ) ( not ( = ?auto_2723350 ?auto_2723356 ) ) ( not ( = ?auto_2723351 ?auto_2723352 ) ) ( not ( = ?auto_2723351 ?auto_2723353 ) ) ( not ( = ?auto_2723351 ?auto_2723354 ) ) ( not ( = ?auto_2723351 ?auto_2723355 ) ) ( not ( = ?auto_2723351 ?auto_2723356 ) ) ( not ( = ?auto_2723352 ?auto_2723353 ) ) ( not ( = ?auto_2723352 ?auto_2723354 ) ) ( not ( = ?auto_2723352 ?auto_2723355 ) ) ( not ( = ?auto_2723352 ?auto_2723356 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2723353 ?auto_2723354 ?auto_2723355 )
      ( MAKE-14CRATE-VERIFY ?auto_2723341 ?auto_2723342 ?auto_2723343 ?auto_2723344 ?auto_2723345 ?auto_2723346 ?auto_2723347 ?auto_2723348 ?auto_2723349 ?auto_2723350 ?auto_2723351 ?auto_2723352 ?auto_2723353 ?auto_2723354 ?auto_2723355 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2723545 - SURFACE
      ?auto_2723546 - SURFACE
      ?auto_2723547 - SURFACE
      ?auto_2723548 - SURFACE
      ?auto_2723549 - SURFACE
      ?auto_2723550 - SURFACE
      ?auto_2723551 - SURFACE
      ?auto_2723552 - SURFACE
      ?auto_2723553 - SURFACE
      ?auto_2723554 - SURFACE
      ?auto_2723555 - SURFACE
      ?auto_2723556 - SURFACE
      ?auto_2723557 - SURFACE
      ?auto_2723558 - SURFACE
      ?auto_2723559 - SURFACE
    )
    :vars
    (
      ?auto_2723563 - HOIST
      ?auto_2723561 - PLACE
      ?auto_2723562 - PLACE
      ?auto_2723564 - HOIST
      ?auto_2723560 - SURFACE
      ?auto_2723565 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2723563 ?auto_2723561 ) ( SURFACE-AT ?auto_2723558 ?auto_2723561 ) ( CLEAR ?auto_2723558 ) ( IS-CRATE ?auto_2723559 ) ( not ( = ?auto_2723558 ?auto_2723559 ) ) ( AVAILABLE ?auto_2723563 ) ( ON ?auto_2723558 ?auto_2723557 ) ( not ( = ?auto_2723557 ?auto_2723558 ) ) ( not ( = ?auto_2723557 ?auto_2723559 ) ) ( not ( = ?auto_2723562 ?auto_2723561 ) ) ( HOIST-AT ?auto_2723564 ?auto_2723562 ) ( not ( = ?auto_2723563 ?auto_2723564 ) ) ( AVAILABLE ?auto_2723564 ) ( SURFACE-AT ?auto_2723559 ?auto_2723562 ) ( ON ?auto_2723559 ?auto_2723560 ) ( CLEAR ?auto_2723559 ) ( not ( = ?auto_2723558 ?auto_2723560 ) ) ( not ( = ?auto_2723559 ?auto_2723560 ) ) ( not ( = ?auto_2723557 ?auto_2723560 ) ) ( TRUCK-AT ?auto_2723565 ?auto_2723561 ) ( ON ?auto_2723546 ?auto_2723545 ) ( ON ?auto_2723547 ?auto_2723546 ) ( ON ?auto_2723548 ?auto_2723547 ) ( ON ?auto_2723549 ?auto_2723548 ) ( ON ?auto_2723550 ?auto_2723549 ) ( ON ?auto_2723551 ?auto_2723550 ) ( ON ?auto_2723552 ?auto_2723551 ) ( ON ?auto_2723553 ?auto_2723552 ) ( ON ?auto_2723554 ?auto_2723553 ) ( ON ?auto_2723555 ?auto_2723554 ) ( ON ?auto_2723556 ?auto_2723555 ) ( ON ?auto_2723557 ?auto_2723556 ) ( not ( = ?auto_2723545 ?auto_2723546 ) ) ( not ( = ?auto_2723545 ?auto_2723547 ) ) ( not ( = ?auto_2723545 ?auto_2723548 ) ) ( not ( = ?auto_2723545 ?auto_2723549 ) ) ( not ( = ?auto_2723545 ?auto_2723550 ) ) ( not ( = ?auto_2723545 ?auto_2723551 ) ) ( not ( = ?auto_2723545 ?auto_2723552 ) ) ( not ( = ?auto_2723545 ?auto_2723553 ) ) ( not ( = ?auto_2723545 ?auto_2723554 ) ) ( not ( = ?auto_2723545 ?auto_2723555 ) ) ( not ( = ?auto_2723545 ?auto_2723556 ) ) ( not ( = ?auto_2723545 ?auto_2723557 ) ) ( not ( = ?auto_2723545 ?auto_2723558 ) ) ( not ( = ?auto_2723545 ?auto_2723559 ) ) ( not ( = ?auto_2723545 ?auto_2723560 ) ) ( not ( = ?auto_2723546 ?auto_2723547 ) ) ( not ( = ?auto_2723546 ?auto_2723548 ) ) ( not ( = ?auto_2723546 ?auto_2723549 ) ) ( not ( = ?auto_2723546 ?auto_2723550 ) ) ( not ( = ?auto_2723546 ?auto_2723551 ) ) ( not ( = ?auto_2723546 ?auto_2723552 ) ) ( not ( = ?auto_2723546 ?auto_2723553 ) ) ( not ( = ?auto_2723546 ?auto_2723554 ) ) ( not ( = ?auto_2723546 ?auto_2723555 ) ) ( not ( = ?auto_2723546 ?auto_2723556 ) ) ( not ( = ?auto_2723546 ?auto_2723557 ) ) ( not ( = ?auto_2723546 ?auto_2723558 ) ) ( not ( = ?auto_2723546 ?auto_2723559 ) ) ( not ( = ?auto_2723546 ?auto_2723560 ) ) ( not ( = ?auto_2723547 ?auto_2723548 ) ) ( not ( = ?auto_2723547 ?auto_2723549 ) ) ( not ( = ?auto_2723547 ?auto_2723550 ) ) ( not ( = ?auto_2723547 ?auto_2723551 ) ) ( not ( = ?auto_2723547 ?auto_2723552 ) ) ( not ( = ?auto_2723547 ?auto_2723553 ) ) ( not ( = ?auto_2723547 ?auto_2723554 ) ) ( not ( = ?auto_2723547 ?auto_2723555 ) ) ( not ( = ?auto_2723547 ?auto_2723556 ) ) ( not ( = ?auto_2723547 ?auto_2723557 ) ) ( not ( = ?auto_2723547 ?auto_2723558 ) ) ( not ( = ?auto_2723547 ?auto_2723559 ) ) ( not ( = ?auto_2723547 ?auto_2723560 ) ) ( not ( = ?auto_2723548 ?auto_2723549 ) ) ( not ( = ?auto_2723548 ?auto_2723550 ) ) ( not ( = ?auto_2723548 ?auto_2723551 ) ) ( not ( = ?auto_2723548 ?auto_2723552 ) ) ( not ( = ?auto_2723548 ?auto_2723553 ) ) ( not ( = ?auto_2723548 ?auto_2723554 ) ) ( not ( = ?auto_2723548 ?auto_2723555 ) ) ( not ( = ?auto_2723548 ?auto_2723556 ) ) ( not ( = ?auto_2723548 ?auto_2723557 ) ) ( not ( = ?auto_2723548 ?auto_2723558 ) ) ( not ( = ?auto_2723548 ?auto_2723559 ) ) ( not ( = ?auto_2723548 ?auto_2723560 ) ) ( not ( = ?auto_2723549 ?auto_2723550 ) ) ( not ( = ?auto_2723549 ?auto_2723551 ) ) ( not ( = ?auto_2723549 ?auto_2723552 ) ) ( not ( = ?auto_2723549 ?auto_2723553 ) ) ( not ( = ?auto_2723549 ?auto_2723554 ) ) ( not ( = ?auto_2723549 ?auto_2723555 ) ) ( not ( = ?auto_2723549 ?auto_2723556 ) ) ( not ( = ?auto_2723549 ?auto_2723557 ) ) ( not ( = ?auto_2723549 ?auto_2723558 ) ) ( not ( = ?auto_2723549 ?auto_2723559 ) ) ( not ( = ?auto_2723549 ?auto_2723560 ) ) ( not ( = ?auto_2723550 ?auto_2723551 ) ) ( not ( = ?auto_2723550 ?auto_2723552 ) ) ( not ( = ?auto_2723550 ?auto_2723553 ) ) ( not ( = ?auto_2723550 ?auto_2723554 ) ) ( not ( = ?auto_2723550 ?auto_2723555 ) ) ( not ( = ?auto_2723550 ?auto_2723556 ) ) ( not ( = ?auto_2723550 ?auto_2723557 ) ) ( not ( = ?auto_2723550 ?auto_2723558 ) ) ( not ( = ?auto_2723550 ?auto_2723559 ) ) ( not ( = ?auto_2723550 ?auto_2723560 ) ) ( not ( = ?auto_2723551 ?auto_2723552 ) ) ( not ( = ?auto_2723551 ?auto_2723553 ) ) ( not ( = ?auto_2723551 ?auto_2723554 ) ) ( not ( = ?auto_2723551 ?auto_2723555 ) ) ( not ( = ?auto_2723551 ?auto_2723556 ) ) ( not ( = ?auto_2723551 ?auto_2723557 ) ) ( not ( = ?auto_2723551 ?auto_2723558 ) ) ( not ( = ?auto_2723551 ?auto_2723559 ) ) ( not ( = ?auto_2723551 ?auto_2723560 ) ) ( not ( = ?auto_2723552 ?auto_2723553 ) ) ( not ( = ?auto_2723552 ?auto_2723554 ) ) ( not ( = ?auto_2723552 ?auto_2723555 ) ) ( not ( = ?auto_2723552 ?auto_2723556 ) ) ( not ( = ?auto_2723552 ?auto_2723557 ) ) ( not ( = ?auto_2723552 ?auto_2723558 ) ) ( not ( = ?auto_2723552 ?auto_2723559 ) ) ( not ( = ?auto_2723552 ?auto_2723560 ) ) ( not ( = ?auto_2723553 ?auto_2723554 ) ) ( not ( = ?auto_2723553 ?auto_2723555 ) ) ( not ( = ?auto_2723553 ?auto_2723556 ) ) ( not ( = ?auto_2723553 ?auto_2723557 ) ) ( not ( = ?auto_2723553 ?auto_2723558 ) ) ( not ( = ?auto_2723553 ?auto_2723559 ) ) ( not ( = ?auto_2723553 ?auto_2723560 ) ) ( not ( = ?auto_2723554 ?auto_2723555 ) ) ( not ( = ?auto_2723554 ?auto_2723556 ) ) ( not ( = ?auto_2723554 ?auto_2723557 ) ) ( not ( = ?auto_2723554 ?auto_2723558 ) ) ( not ( = ?auto_2723554 ?auto_2723559 ) ) ( not ( = ?auto_2723554 ?auto_2723560 ) ) ( not ( = ?auto_2723555 ?auto_2723556 ) ) ( not ( = ?auto_2723555 ?auto_2723557 ) ) ( not ( = ?auto_2723555 ?auto_2723558 ) ) ( not ( = ?auto_2723555 ?auto_2723559 ) ) ( not ( = ?auto_2723555 ?auto_2723560 ) ) ( not ( = ?auto_2723556 ?auto_2723557 ) ) ( not ( = ?auto_2723556 ?auto_2723558 ) ) ( not ( = ?auto_2723556 ?auto_2723559 ) ) ( not ( = ?auto_2723556 ?auto_2723560 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2723557 ?auto_2723558 ?auto_2723559 )
      ( MAKE-14CRATE-VERIFY ?auto_2723545 ?auto_2723546 ?auto_2723547 ?auto_2723548 ?auto_2723549 ?auto_2723550 ?auto_2723551 ?auto_2723552 ?auto_2723553 ?auto_2723554 ?auto_2723555 ?auto_2723556 ?auto_2723557 ?auto_2723558 ?auto_2723559 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2723749 - SURFACE
      ?auto_2723750 - SURFACE
      ?auto_2723751 - SURFACE
      ?auto_2723752 - SURFACE
      ?auto_2723753 - SURFACE
      ?auto_2723754 - SURFACE
      ?auto_2723755 - SURFACE
      ?auto_2723756 - SURFACE
      ?auto_2723757 - SURFACE
      ?auto_2723758 - SURFACE
      ?auto_2723759 - SURFACE
      ?auto_2723760 - SURFACE
      ?auto_2723761 - SURFACE
      ?auto_2723762 - SURFACE
      ?auto_2723763 - SURFACE
    )
    :vars
    (
      ?auto_2723765 - HOIST
      ?auto_2723768 - PLACE
      ?auto_2723764 - PLACE
      ?auto_2723766 - HOIST
      ?auto_2723767 - SURFACE
      ?auto_2723769 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2723765 ?auto_2723768 ) ( IS-CRATE ?auto_2723763 ) ( not ( = ?auto_2723762 ?auto_2723763 ) ) ( not ( = ?auto_2723761 ?auto_2723762 ) ) ( not ( = ?auto_2723761 ?auto_2723763 ) ) ( not ( = ?auto_2723764 ?auto_2723768 ) ) ( HOIST-AT ?auto_2723766 ?auto_2723764 ) ( not ( = ?auto_2723765 ?auto_2723766 ) ) ( AVAILABLE ?auto_2723766 ) ( SURFACE-AT ?auto_2723763 ?auto_2723764 ) ( ON ?auto_2723763 ?auto_2723767 ) ( CLEAR ?auto_2723763 ) ( not ( = ?auto_2723762 ?auto_2723767 ) ) ( not ( = ?auto_2723763 ?auto_2723767 ) ) ( not ( = ?auto_2723761 ?auto_2723767 ) ) ( TRUCK-AT ?auto_2723769 ?auto_2723768 ) ( SURFACE-AT ?auto_2723761 ?auto_2723768 ) ( CLEAR ?auto_2723761 ) ( LIFTING ?auto_2723765 ?auto_2723762 ) ( IS-CRATE ?auto_2723762 ) ( ON ?auto_2723750 ?auto_2723749 ) ( ON ?auto_2723751 ?auto_2723750 ) ( ON ?auto_2723752 ?auto_2723751 ) ( ON ?auto_2723753 ?auto_2723752 ) ( ON ?auto_2723754 ?auto_2723753 ) ( ON ?auto_2723755 ?auto_2723754 ) ( ON ?auto_2723756 ?auto_2723755 ) ( ON ?auto_2723757 ?auto_2723756 ) ( ON ?auto_2723758 ?auto_2723757 ) ( ON ?auto_2723759 ?auto_2723758 ) ( ON ?auto_2723760 ?auto_2723759 ) ( ON ?auto_2723761 ?auto_2723760 ) ( not ( = ?auto_2723749 ?auto_2723750 ) ) ( not ( = ?auto_2723749 ?auto_2723751 ) ) ( not ( = ?auto_2723749 ?auto_2723752 ) ) ( not ( = ?auto_2723749 ?auto_2723753 ) ) ( not ( = ?auto_2723749 ?auto_2723754 ) ) ( not ( = ?auto_2723749 ?auto_2723755 ) ) ( not ( = ?auto_2723749 ?auto_2723756 ) ) ( not ( = ?auto_2723749 ?auto_2723757 ) ) ( not ( = ?auto_2723749 ?auto_2723758 ) ) ( not ( = ?auto_2723749 ?auto_2723759 ) ) ( not ( = ?auto_2723749 ?auto_2723760 ) ) ( not ( = ?auto_2723749 ?auto_2723761 ) ) ( not ( = ?auto_2723749 ?auto_2723762 ) ) ( not ( = ?auto_2723749 ?auto_2723763 ) ) ( not ( = ?auto_2723749 ?auto_2723767 ) ) ( not ( = ?auto_2723750 ?auto_2723751 ) ) ( not ( = ?auto_2723750 ?auto_2723752 ) ) ( not ( = ?auto_2723750 ?auto_2723753 ) ) ( not ( = ?auto_2723750 ?auto_2723754 ) ) ( not ( = ?auto_2723750 ?auto_2723755 ) ) ( not ( = ?auto_2723750 ?auto_2723756 ) ) ( not ( = ?auto_2723750 ?auto_2723757 ) ) ( not ( = ?auto_2723750 ?auto_2723758 ) ) ( not ( = ?auto_2723750 ?auto_2723759 ) ) ( not ( = ?auto_2723750 ?auto_2723760 ) ) ( not ( = ?auto_2723750 ?auto_2723761 ) ) ( not ( = ?auto_2723750 ?auto_2723762 ) ) ( not ( = ?auto_2723750 ?auto_2723763 ) ) ( not ( = ?auto_2723750 ?auto_2723767 ) ) ( not ( = ?auto_2723751 ?auto_2723752 ) ) ( not ( = ?auto_2723751 ?auto_2723753 ) ) ( not ( = ?auto_2723751 ?auto_2723754 ) ) ( not ( = ?auto_2723751 ?auto_2723755 ) ) ( not ( = ?auto_2723751 ?auto_2723756 ) ) ( not ( = ?auto_2723751 ?auto_2723757 ) ) ( not ( = ?auto_2723751 ?auto_2723758 ) ) ( not ( = ?auto_2723751 ?auto_2723759 ) ) ( not ( = ?auto_2723751 ?auto_2723760 ) ) ( not ( = ?auto_2723751 ?auto_2723761 ) ) ( not ( = ?auto_2723751 ?auto_2723762 ) ) ( not ( = ?auto_2723751 ?auto_2723763 ) ) ( not ( = ?auto_2723751 ?auto_2723767 ) ) ( not ( = ?auto_2723752 ?auto_2723753 ) ) ( not ( = ?auto_2723752 ?auto_2723754 ) ) ( not ( = ?auto_2723752 ?auto_2723755 ) ) ( not ( = ?auto_2723752 ?auto_2723756 ) ) ( not ( = ?auto_2723752 ?auto_2723757 ) ) ( not ( = ?auto_2723752 ?auto_2723758 ) ) ( not ( = ?auto_2723752 ?auto_2723759 ) ) ( not ( = ?auto_2723752 ?auto_2723760 ) ) ( not ( = ?auto_2723752 ?auto_2723761 ) ) ( not ( = ?auto_2723752 ?auto_2723762 ) ) ( not ( = ?auto_2723752 ?auto_2723763 ) ) ( not ( = ?auto_2723752 ?auto_2723767 ) ) ( not ( = ?auto_2723753 ?auto_2723754 ) ) ( not ( = ?auto_2723753 ?auto_2723755 ) ) ( not ( = ?auto_2723753 ?auto_2723756 ) ) ( not ( = ?auto_2723753 ?auto_2723757 ) ) ( not ( = ?auto_2723753 ?auto_2723758 ) ) ( not ( = ?auto_2723753 ?auto_2723759 ) ) ( not ( = ?auto_2723753 ?auto_2723760 ) ) ( not ( = ?auto_2723753 ?auto_2723761 ) ) ( not ( = ?auto_2723753 ?auto_2723762 ) ) ( not ( = ?auto_2723753 ?auto_2723763 ) ) ( not ( = ?auto_2723753 ?auto_2723767 ) ) ( not ( = ?auto_2723754 ?auto_2723755 ) ) ( not ( = ?auto_2723754 ?auto_2723756 ) ) ( not ( = ?auto_2723754 ?auto_2723757 ) ) ( not ( = ?auto_2723754 ?auto_2723758 ) ) ( not ( = ?auto_2723754 ?auto_2723759 ) ) ( not ( = ?auto_2723754 ?auto_2723760 ) ) ( not ( = ?auto_2723754 ?auto_2723761 ) ) ( not ( = ?auto_2723754 ?auto_2723762 ) ) ( not ( = ?auto_2723754 ?auto_2723763 ) ) ( not ( = ?auto_2723754 ?auto_2723767 ) ) ( not ( = ?auto_2723755 ?auto_2723756 ) ) ( not ( = ?auto_2723755 ?auto_2723757 ) ) ( not ( = ?auto_2723755 ?auto_2723758 ) ) ( not ( = ?auto_2723755 ?auto_2723759 ) ) ( not ( = ?auto_2723755 ?auto_2723760 ) ) ( not ( = ?auto_2723755 ?auto_2723761 ) ) ( not ( = ?auto_2723755 ?auto_2723762 ) ) ( not ( = ?auto_2723755 ?auto_2723763 ) ) ( not ( = ?auto_2723755 ?auto_2723767 ) ) ( not ( = ?auto_2723756 ?auto_2723757 ) ) ( not ( = ?auto_2723756 ?auto_2723758 ) ) ( not ( = ?auto_2723756 ?auto_2723759 ) ) ( not ( = ?auto_2723756 ?auto_2723760 ) ) ( not ( = ?auto_2723756 ?auto_2723761 ) ) ( not ( = ?auto_2723756 ?auto_2723762 ) ) ( not ( = ?auto_2723756 ?auto_2723763 ) ) ( not ( = ?auto_2723756 ?auto_2723767 ) ) ( not ( = ?auto_2723757 ?auto_2723758 ) ) ( not ( = ?auto_2723757 ?auto_2723759 ) ) ( not ( = ?auto_2723757 ?auto_2723760 ) ) ( not ( = ?auto_2723757 ?auto_2723761 ) ) ( not ( = ?auto_2723757 ?auto_2723762 ) ) ( not ( = ?auto_2723757 ?auto_2723763 ) ) ( not ( = ?auto_2723757 ?auto_2723767 ) ) ( not ( = ?auto_2723758 ?auto_2723759 ) ) ( not ( = ?auto_2723758 ?auto_2723760 ) ) ( not ( = ?auto_2723758 ?auto_2723761 ) ) ( not ( = ?auto_2723758 ?auto_2723762 ) ) ( not ( = ?auto_2723758 ?auto_2723763 ) ) ( not ( = ?auto_2723758 ?auto_2723767 ) ) ( not ( = ?auto_2723759 ?auto_2723760 ) ) ( not ( = ?auto_2723759 ?auto_2723761 ) ) ( not ( = ?auto_2723759 ?auto_2723762 ) ) ( not ( = ?auto_2723759 ?auto_2723763 ) ) ( not ( = ?auto_2723759 ?auto_2723767 ) ) ( not ( = ?auto_2723760 ?auto_2723761 ) ) ( not ( = ?auto_2723760 ?auto_2723762 ) ) ( not ( = ?auto_2723760 ?auto_2723763 ) ) ( not ( = ?auto_2723760 ?auto_2723767 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2723761 ?auto_2723762 ?auto_2723763 )
      ( MAKE-14CRATE-VERIFY ?auto_2723749 ?auto_2723750 ?auto_2723751 ?auto_2723752 ?auto_2723753 ?auto_2723754 ?auto_2723755 ?auto_2723756 ?auto_2723757 ?auto_2723758 ?auto_2723759 ?auto_2723760 ?auto_2723761 ?auto_2723762 ?auto_2723763 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2723953 - SURFACE
      ?auto_2723954 - SURFACE
      ?auto_2723955 - SURFACE
      ?auto_2723956 - SURFACE
      ?auto_2723957 - SURFACE
      ?auto_2723958 - SURFACE
      ?auto_2723959 - SURFACE
      ?auto_2723960 - SURFACE
      ?auto_2723961 - SURFACE
      ?auto_2723962 - SURFACE
      ?auto_2723963 - SURFACE
      ?auto_2723964 - SURFACE
      ?auto_2723965 - SURFACE
      ?auto_2723966 - SURFACE
      ?auto_2723967 - SURFACE
    )
    :vars
    (
      ?auto_2723969 - HOIST
      ?auto_2723971 - PLACE
      ?auto_2723972 - PLACE
      ?auto_2723968 - HOIST
      ?auto_2723970 - SURFACE
      ?auto_2723973 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2723969 ?auto_2723971 ) ( IS-CRATE ?auto_2723967 ) ( not ( = ?auto_2723966 ?auto_2723967 ) ) ( not ( = ?auto_2723965 ?auto_2723966 ) ) ( not ( = ?auto_2723965 ?auto_2723967 ) ) ( not ( = ?auto_2723972 ?auto_2723971 ) ) ( HOIST-AT ?auto_2723968 ?auto_2723972 ) ( not ( = ?auto_2723969 ?auto_2723968 ) ) ( AVAILABLE ?auto_2723968 ) ( SURFACE-AT ?auto_2723967 ?auto_2723972 ) ( ON ?auto_2723967 ?auto_2723970 ) ( CLEAR ?auto_2723967 ) ( not ( = ?auto_2723966 ?auto_2723970 ) ) ( not ( = ?auto_2723967 ?auto_2723970 ) ) ( not ( = ?auto_2723965 ?auto_2723970 ) ) ( TRUCK-AT ?auto_2723973 ?auto_2723971 ) ( SURFACE-AT ?auto_2723965 ?auto_2723971 ) ( CLEAR ?auto_2723965 ) ( IS-CRATE ?auto_2723966 ) ( AVAILABLE ?auto_2723969 ) ( IN ?auto_2723966 ?auto_2723973 ) ( ON ?auto_2723954 ?auto_2723953 ) ( ON ?auto_2723955 ?auto_2723954 ) ( ON ?auto_2723956 ?auto_2723955 ) ( ON ?auto_2723957 ?auto_2723956 ) ( ON ?auto_2723958 ?auto_2723957 ) ( ON ?auto_2723959 ?auto_2723958 ) ( ON ?auto_2723960 ?auto_2723959 ) ( ON ?auto_2723961 ?auto_2723960 ) ( ON ?auto_2723962 ?auto_2723961 ) ( ON ?auto_2723963 ?auto_2723962 ) ( ON ?auto_2723964 ?auto_2723963 ) ( ON ?auto_2723965 ?auto_2723964 ) ( not ( = ?auto_2723953 ?auto_2723954 ) ) ( not ( = ?auto_2723953 ?auto_2723955 ) ) ( not ( = ?auto_2723953 ?auto_2723956 ) ) ( not ( = ?auto_2723953 ?auto_2723957 ) ) ( not ( = ?auto_2723953 ?auto_2723958 ) ) ( not ( = ?auto_2723953 ?auto_2723959 ) ) ( not ( = ?auto_2723953 ?auto_2723960 ) ) ( not ( = ?auto_2723953 ?auto_2723961 ) ) ( not ( = ?auto_2723953 ?auto_2723962 ) ) ( not ( = ?auto_2723953 ?auto_2723963 ) ) ( not ( = ?auto_2723953 ?auto_2723964 ) ) ( not ( = ?auto_2723953 ?auto_2723965 ) ) ( not ( = ?auto_2723953 ?auto_2723966 ) ) ( not ( = ?auto_2723953 ?auto_2723967 ) ) ( not ( = ?auto_2723953 ?auto_2723970 ) ) ( not ( = ?auto_2723954 ?auto_2723955 ) ) ( not ( = ?auto_2723954 ?auto_2723956 ) ) ( not ( = ?auto_2723954 ?auto_2723957 ) ) ( not ( = ?auto_2723954 ?auto_2723958 ) ) ( not ( = ?auto_2723954 ?auto_2723959 ) ) ( not ( = ?auto_2723954 ?auto_2723960 ) ) ( not ( = ?auto_2723954 ?auto_2723961 ) ) ( not ( = ?auto_2723954 ?auto_2723962 ) ) ( not ( = ?auto_2723954 ?auto_2723963 ) ) ( not ( = ?auto_2723954 ?auto_2723964 ) ) ( not ( = ?auto_2723954 ?auto_2723965 ) ) ( not ( = ?auto_2723954 ?auto_2723966 ) ) ( not ( = ?auto_2723954 ?auto_2723967 ) ) ( not ( = ?auto_2723954 ?auto_2723970 ) ) ( not ( = ?auto_2723955 ?auto_2723956 ) ) ( not ( = ?auto_2723955 ?auto_2723957 ) ) ( not ( = ?auto_2723955 ?auto_2723958 ) ) ( not ( = ?auto_2723955 ?auto_2723959 ) ) ( not ( = ?auto_2723955 ?auto_2723960 ) ) ( not ( = ?auto_2723955 ?auto_2723961 ) ) ( not ( = ?auto_2723955 ?auto_2723962 ) ) ( not ( = ?auto_2723955 ?auto_2723963 ) ) ( not ( = ?auto_2723955 ?auto_2723964 ) ) ( not ( = ?auto_2723955 ?auto_2723965 ) ) ( not ( = ?auto_2723955 ?auto_2723966 ) ) ( not ( = ?auto_2723955 ?auto_2723967 ) ) ( not ( = ?auto_2723955 ?auto_2723970 ) ) ( not ( = ?auto_2723956 ?auto_2723957 ) ) ( not ( = ?auto_2723956 ?auto_2723958 ) ) ( not ( = ?auto_2723956 ?auto_2723959 ) ) ( not ( = ?auto_2723956 ?auto_2723960 ) ) ( not ( = ?auto_2723956 ?auto_2723961 ) ) ( not ( = ?auto_2723956 ?auto_2723962 ) ) ( not ( = ?auto_2723956 ?auto_2723963 ) ) ( not ( = ?auto_2723956 ?auto_2723964 ) ) ( not ( = ?auto_2723956 ?auto_2723965 ) ) ( not ( = ?auto_2723956 ?auto_2723966 ) ) ( not ( = ?auto_2723956 ?auto_2723967 ) ) ( not ( = ?auto_2723956 ?auto_2723970 ) ) ( not ( = ?auto_2723957 ?auto_2723958 ) ) ( not ( = ?auto_2723957 ?auto_2723959 ) ) ( not ( = ?auto_2723957 ?auto_2723960 ) ) ( not ( = ?auto_2723957 ?auto_2723961 ) ) ( not ( = ?auto_2723957 ?auto_2723962 ) ) ( not ( = ?auto_2723957 ?auto_2723963 ) ) ( not ( = ?auto_2723957 ?auto_2723964 ) ) ( not ( = ?auto_2723957 ?auto_2723965 ) ) ( not ( = ?auto_2723957 ?auto_2723966 ) ) ( not ( = ?auto_2723957 ?auto_2723967 ) ) ( not ( = ?auto_2723957 ?auto_2723970 ) ) ( not ( = ?auto_2723958 ?auto_2723959 ) ) ( not ( = ?auto_2723958 ?auto_2723960 ) ) ( not ( = ?auto_2723958 ?auto_2723961 ) ) ( not ( = ?auto_2723958 ?auto_2723962 ) ) ( not ( = ?auto_2723958 ?auto_2723963 ) ) ( not ( = ?auto_2723958 ?auto_2723964 ) ) ( not ( = ?auto_2723958 ?auto_2723965 ) ) ( not ( = ?auto_2723958 ?auto_2723966 ) ) ( not ( = ?auto_2723958 ?auto_2723967 ) ) ( not ( = ?auto_2723958 ?auto_2723970 ) ) ( not ( = ?auto_2723959 ?auto_2723960 ) ) ( not ( = ?auto_2723959 ?auto_2723961 ) ) ( not ( = ?auto_2723959 ?auto_2723962 ) ) ( not ( = ?auto_2723959 ?auto_2723963 ) ) ( not ( = ?auto_2723959 ?auto_2723964 ) ) ( not ( = ?auto_2723959 ?auto_2723965 ) ) ( not ( = ?auto_2723959 ?auto_2723966 ) ) ( not ( = ?auto_2723959 ?auto_2723967 ) ) ( not ( = ?auto_2723959 ?auto_2723970 ) ) ( not ( = ?auto_2723960 ?auto_2723961 ) ) ( not ( = ?auto_2723960 ?auto_2723962 ) ) ( not ( = ?auto_2723960 ?auto_2723963 ) ) ( not ( = ?auto_2723960 ?auto_2723964 ) ) ( not ( = ?auto_2723960 ?auto_2723965 ) ) ( not ( = ?auto_2723960 ?auto_2723966 ) ) ( not ( = ?auto_2723960 ?auto_2723967 ) ) ( not ( = ?auto_2723960 ?auto_2723970 ) ) ( not ( = ?auto_2723961 ?auto_2723962 ) ) ( not ( = ?auto_2723961 ?auto_2723963 ) ) ( not ( = ?auto_2723961 ?auto_2723964 ) ) ( not ( = ?auto_2723961 ?auto_2723965 ) ) ( not ( = ?auto_2723961 ?auto_2723966 ) ) ( not ( = ?auto_2723961 ?auto_2723967 ) ) ( not ( = ?auto_2723961 ?auto_2723970 ) ) ( not ( = ?auto_2723962 ?auto_2723963 ) ) ( not ( = ?auto_2723962 ?auto_2723964 ) ) ( not ( = ?auto_2723962 ?auto_2723965 ) ) ( not ( = ?auto_2723962 ?auto_2723966 ) ) ( not ( = ?auto_2723962 ?auto_2723967 ) ) ( not ( = ?auto_2723962 ?auto_2723970 ) ) ( not ( = ?auto_2723963 ?auto_2723964 ) ) ( not ( = ?auto_2723963 ?auto_2723965 ) ) ( not ( = ?auto_2723963 ?auto_2723966 ) ) ( not ( = ?auto_2723963 ?auto_2723967 ) ) ( not ( = ?auto_2723963 ?auto_2723970 ) ) ( not ( = ?auto_2723964 ?auto_2723965 ) ) ( not ( = ?auto_2723964 ?auto_2723966 ) ) ( not ( = ?auto_2723964 ?auto_2723967 ) ) ( not ( = ?auto_2723964 ?auto_2723970 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2723965 ?auto_2723966 ?auto_2723967 )
      ( MAKE-14CRATE-VERIFY ?auto_2723953 ?auto_2723954 ?auto_2723955 ?auto_2723956 ?auto_2723957 ?auto_2723958 ?auto_2723959 ?auto_2723960 ?auto_2723961 ?auto_2723962 ?auto_2723963 ?auto_2723964 ?auto_2723965 ?auto_2723966 ?auto_2723967 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2741044 - SURFACE
      ?auto_2741045 - SURFACE
      ?auto_2741046 - SURFACE
      ?auto_2741047 - SURFACE
      ?auto_2741048 - SURFACE
      ?auto_2741049 - SURFACE
      ?auto_2741050 - SURFACE
      ?auto_2741051 - SURFACE
      ?auto_2741052 - SURFACE
      ?auto_2741053 - SURFACE
      ?auto_2741054 - SURFACE
      ?auto_2741055 - SURFACE
      ?auto_2741056 - SURFACE
      ?auto_2741057 - SURFACE
      ?auto_2741058 - SURFACE
      ?auto_2741059 - SURFACE
    )
    :vars
    (
      ?auto_2741060 - HOIST
      ?auto_2741061 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2741060 ?auto_2741061 ) ( SURFACE-AT ?auto_2741058 ?auto_2741061 ) ( CLEAR ?auto_2741058 ) ( LIFTING ?auto_2741060 ?auto_2741059 ) ( IS-CRATE ?auto_2741059 ) ( not ( = ?auto_2741058 ?auto_2741059 ) ) ( ON ?auto_2741045 ?auto_2741044 ) ( ON ?auto_2741046 ?auto_2741045 ) ( ON ?auto_2741047 ?auto_2741046 ) ( ON ?auto_2741048 ?auto_2741047 ) ( ON ?auto_2741049 ?auto_2741048 ) ( ON ?auto_2741050 ?auto_2741049 ) ( ON ?auto_2741051 ?auto_2741050 ) ( ON ?auto_2741052 ?auto_2741051 ) ( ON ?auto_2741053 ?auto_2741052 ) ( ON ?auto_2741054 ?auto_2741053 ) ( ON ?auto_2741055 ?auto_2741054 ) ( ON ?auto_2741056 ?auto_2741055 ) ( ON ?auto_2741057 ?auto_2741056 ) ( ON ?auto_2741058 ?auto_2741057 ) ( not ( = ?auto_2741044 ?auto_2741045 ) ) ( not ( = ?auto_2741044 ?auto_2741046 ) ) ( not ( = ?auto_2741044 ?auto_2741047 ) ) ( not ( = ?auto_2741044 ?auto_2741048 ) ) ( not ( = ?auto_2741044 ?auto_2741049 ) ) ( not ( = ?auto_2741044 ?auto_2741050 ) ) ( not ( = ?auto_2741044 ?auto_2741051 ) ) ( not ( = ?auto_2741044 ?auto_2741052 ) ) ( not ( = ?auto_2741044 ?auto_2741053 ) ) ( not ( = ?auto_2741044 ?auto_2741054 ) ) ( not ( = ?auto_2741044 ?auto_2741055 ) ) ( not ( = ?auto_2741044 ?auto_2741056 ) ) ( not ( = ?auto_2741044 ?auto_2741057 ) ) ( not ( = ?auto_2741044 ?auto_2741058 ) ) ( not ( = ?auto_2741044 ?auto_2741059 ) ) ( not ( = ?auto_2741045 ?auto_2741046 ) ) ( not ( = ?auto_2741045 ?auto_2741047 ) ) ( not ( = ?auto_2741045 ?auto_2741048 ) ) ( not ( = ?auto_2741045 ?auto_2741049 ) ) ( not ( = ?auto_2741045 ?auto_2741050 ) ) ( not ( = ?auto_2741045 ?auto_2741051 ) ) ( not ( = ?auto_2741045 ?auto_2741052 ) ) ( not ( = ?auto_2741045 ?auto_2741053 ) ) ( not ( = ?auto_2741045 ?auto_2741054 ) ) ( not ( = ?auto_2741045 ?auto_2741055 ) ) ( not ( = ?auto_2741045 ?auto_2741056 ) ) ( not ( = ?auto_2741045 ?auto_2741057 ) ) ( not ( = ?auto_2741045 ?auto_2741058 ) ) ( not ( = ?auto_2741045 ?auto_2741059 ) ) ( not ( = ?auto_2741046 ?auto_2741047 ) ) ( not ( = ?auto_2741046 ?auto_2741048 ) ) ( not ( = ?auto_2741046 ?auto_2741049 ) ) ( not ( = ?auto_2741046 ?auto_2741050 ) ) ( not ( = ?auto_2741046 ?auto_2741051 ) ) ( not ( = ?auto_2741046 ?auto_2741052 ) ) ( not ( = ?auto_2741046 ?auto_2741053 ) ) ( not ( = ?auto_2741046 ?auto_2741054 ) ) ( not ( = ?auto_2741046 ?auto_2741055 ) ) ( not ( = ?auto_2741046 ?auto_2741056 ) ) ( not ( = ?auto_2741046 ?auto_2741057 ) ) ( not ( = ?auto_2741046 ?auto_2741058 ) ) ( not ( = ?auto_2741046 ?auto_2741059 ) ) ( not ( = ?auto_2741047 ?auto_2741048 ) ) ( not ( = ?auto_2741047 ?auto_2741049 ) ) ( not ( = ?auto_2741047 ?auto_2741050 ) ) ( not ( = ?auto_2741047 ?auto_2741051 ) ) ( not ( = ?auto_2741047 ?auto_2741052 ) ) ( not ( = ?auto_2741047 ?auto_2741053 ) ) ( not ( = ?auto_2741047 ?auto_2741054 ) ) ( not ( = ?auto_2741047 ?auto_2741055 ) ) ( not ( = ?auto_2741047 ?auto_2741056 ) ) ( not ( = ?auto_2741047 ?auto_2741057 ) ) ( not ( = ?auto_2741047 ?auto_2741058 ) ) ( not ( = ?auto_2741047 ?auto_2741059 ) ) ( not ( = ?auto_2741048 ?auto_2741049 ) ) ( not ( = ?auto_2741048 ?auto_2741050 ) ) ( not ( = ?auto_2741048 ?auto_2741051 ) ) ( not ( = ?auto_2741048 ?auto_2741052 ) ) ( not ( = ?auto_2741048 ?auto_2741053 ) ) ( not ( = ?auto_2741048 ?auto_2741054 ) ) ( not ( = ?auto_2741048 ?auto_2741055 ) ) ( not ( = ?auto_2741048 ?auto_2741056 ) ) ( not ( = ?auto_2741048 ?auto_2741057 ) ) ( not ( = ?auto_2741048 ?auto_2741058 ) ) ( not ( = ?auto_2741048 ?auto_2741059 ) ) ( not ( = ?auto_2741049 ?auto_2741050 ) ) ( not ( = ?auto_2741049 ?auto_2741051 ) ) ( not ( = ?auto_2741049 ?auto_2741052 ) ) ( not ( = ?auto_2741049 ?auto_2741053 ) ) ( not ( = ?auto_2741049 ?auto_2741054 ) ) ( not ( = ?auto_2741049 ?auto_2741055 ) ) ( not ( = ?auto_2741049 ?auto_2741056 ) ) ( not ( = ?auto_2741049 ?auto_2741057 ) ) ( not ( = ?auto_2741049 ?auto_2741058 ) ) ( not ( = ?auto_2741049 ?auto_2741059 ) ) ( not ( = ?auto_2741050 ?auto_2741051 ) ) ( not ( = ?auto_2741050 ?auto_2741052 ) ) ( not ( = ?auto_2741050 ?auto_2741053 ) ) ( not ( = ?auto_2741050 ?auto_2741054 ) ) ( not ( = ?auto_2741050 ?auto_2741055 ) ) ( not ( = ?auto_2741050 ?auto_2741056 ) ) ( not ( = ?auto_2741050 ?auto_2741057 ) ) ( not ( = ?auto_2741050 ?auto_2741058 ) ) ( not ( = ?auto_2741050 ?auto_2741059 ) ) ( not ( = ?auto_2741051 ?auto_2741052 ) ) ( not ( = ?auto_2741051 ?auto_2741053 ) ) ( not ( = ?auto_2741051 ?auto_2741054 ) ) ( not ( = ?auto_2741051 ?auto_2741055 ) ) ( not ( = ?auto_2741051 ?auto_2741056 ) ) ( not ( = ?auto_2741051 ?auto_2741057 ) ) ( not ( = ?auto_2741051 ?auto_2741058 ) ) ( not ( = ?auto_2741051 ?auto_2741059 ) ) ( not ( = ?auto_2741052 ?auto_2741053 ) ) ( not ( = ?auto_2741052 ?auto_2741054 ) ) ( not ( = ?auto_2741052 ?auto_2741055 ) ) ( not ( = ?auto_2741052 ?auto_2741056 ) ) ( not ( = ?auto_2741052 ?auto_2741057 ) ) ( not ( = ?auto_2741052 ?auto_2741058 ) ) ( not ( = ?auto_2741052 ?auto_2741059 ) ) ( not ( = ?auto_2741053 ?auto_2741054 ) ) ( not ( = ?auto_2741053 ?auto_2741055 ) ) ( not ( = ?auto_2741053 ?auto_2741056 ) ) ( not ( = ?auto_2741053 ?auto_2741057 ) ) ( not ( = ?auto_2741053 ?auto_2741058 ) ) ( not ( = ?auto_2741053 ?auto_2741059 ) ) ( not ( = ?auto_2741054 ?auto_2741055 ) ) ( not ( = ?auto_2741054 ?auto_2741056 ) ) ( not ( = ?auto_2741054 ?auto_2741057 ) ) ( not ( = ?auto_2741054 ?auto_2741058 ) ) ( not ( = ?auto_2741054 ?auto_2741059 ) ) ( not ( = ?auto_2741055 ?auto_2741056 ) ) ( not ( = ?auto_2741055 ?auto_2741057 ) ) ( not ( = ?auto_2741055 ?auto_2741058 ) ) ( not ( = ?auto_2741055 ?auto_2741059 ) ) ( not ( = ?auto_2741056 ?auto_2741057 ) ) ( not ( = ?auto_2741056 ?auto_2741058 ) ) ( not ( = ?auto_2741056 ?auto_2741059 ) ) ( not ( = ?auto_2741057 ?auto_2741058 ) ) ( not ( = ?auto_2741057 ?auto_2741059 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2741058 ?auto_2741059 )
      ( MAKE-15CRATE-VERIFY ?auto_2741044 ?auto_2741045 ?auto_2741046 ?auto_2741047 ?auto_2741048 ?auto_2741049 ?auto_2741050 ?auto_2741051 ?auto_2741052 ?auto_2741053 ?auto_2741054 ?auto_2741055 ?auto_2741056 ?auto_2741057 ?auto_2741058 ?auto_2741059 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2741223 - SURFACE
      ?auto_2741224 - SURFACE
      ?auto_2741225 - SURFACE
      ?auto_2741226 - SURFACE
      ?auto_2741227 - SURFACE
      ?auto_2741228 - SURFACE
      ?auto_2741229 - SURFACE
      ?auto_2741230 - SURFACE
      ?auto_2741231 - SURFACE
      ?auto_2741232 - SURFACE
      ?auto_2741233 - SURFACE
      ?auto_2741234 - SURFACE
      ?auto_2741235 - SURFACE
      ?auto_2741236 - SURFACE
      ?auto_2741237 - SURFACE
      ?auto_2741238 - SURFACE
    )
    :vars
    (
      ?auto_2741241 - HOIST
      ?auto_2741240 - PLACE
      ?auto_2741239 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2741241 ?auto_2741240 ) ( SURFACE-AT ?auto_2741237 ?auto_2741240 ) ( CLEAR ?auto_2741237 ) ( IS-CRATE ?auto_2741238 ) ( not ( = ?auto_2741237 ?auto_2741238 ) ) ( TRUCK-AT ?auto_2741239 ?auto_2741240 ) ( AVAILABLE ?auto_2741241 ) ( IN ?auto_2741238 ?auto_2741239 ) ( ON ?auto_2741237 ?auto_2741236 ) ( not ( = ?auto_2741236 ?auto_2741237 ) ) ( not ( = ?auto_2741236 ?auto_2741238 ) ) ( ON ?auto_2741224 ?auto_2741223 ) ( ON ?auto_2741225 ?auto_2741224 ) ( ON ?auto_2741226 ?auto_2741225 ) ( ON ?auto_2741227 ?auto_2741226 ) ( ON ?auto_2741228 ?auto_2741227 ) ( ON ?auto_2741229 ?auto_2741228 ) ( ON ?auto_2741230 ?auto_2741229 ) ( ON ?auto_2741231 ?auto_2741230 ) ( ON ?auto_2741232 ?auto_2741231 ) ( ON ?auto_2741233 ?auto_2741232 ) ( ON ?auto_2741234 ?auto_2741233 ) ( ON ?auto_2741235 ?auto_2741234 ) ( ON ?auto_2741236 ?auto_2741235 ) ( not ( = ?auto_2741223 ?auto_2741224 ) ) ( not ( = ?auto_2741223 ?auto_2741225 ) ) ( not ( = ?auto_2741223 ?auto_2741226 ) ) ( not ( = ?auto_2741223 ?auto_2741227 ) ) ( not ( = ?auto_2741223 ?auto_2741228 ) ) ( not ( = ?auto_2741223 ?auto_2741229 ) ) ( not ( = ?auto_2741223 ?auto_2741230 ) ) ( not ( = ?auto_2741223 ?auto_2741231 ) ) ( not ( = ?auto_2741223 ?auto_2741232 ) ) ( not ( = ?auto_2741223 ?auto_2741233 ) ) ( not ( = ?auto_2741223 ?auto_2741234 ) ) ( not ( = ?auto_2741223 ?auto_2741235 ) ) ( not ( = ?auto_2741223 ?auto_2741236 ) ) ( not ( = ?auto_2741223 ?auto_2741237 ) ) ( not ( = ?auto_2741223 ?auto_2741238 ) ) ( not ( = ?auto_2741224 ?auto_2741225 ) ) ( not ( = ?auto_2741224 ?auto_2741226 ) ) ( not ( = ?auto_2741224 ?auto_2741227 ) ) ( not ( = ?auto_2741224 ?auto_2741228 ) ) ( not ( = ?auto_2741224 ?auto_2741229 ) ) ( not ( = ?auto_2741224 ?auto_2741230 ) ) ( not ( = ?auto_2741224 ?auto_2741231 ) ) ( not ( = ?auto_2741224 ?auto_2741232 ) ) ( not ( = ?auto_2741224 ?auto_2741233 ) ) ( not ( = ?auto_2741224 ?auto_2741234 ) ) ( not ( = ?auto_2741224 ?auto_2741235 ) ) ( not ( = ?auto_2741224 ?auto_2741236 ) ) ( not ( = ?auto_2741224 ?auto_2741237 ) ) ( not ( = ?auto_2741224 ?auto_2741238 ) ) ( not ( = ?auto_2741225 ?auto_2741226 ) ) ( not ( = ?auto_2741225 ?auto_2741227 ) ) ( not ( = ?auto_2741225 ?auto_2741228 ) ) ( not ( = ?auto_2741225 ?auto_2741229 ) ) ( not ( = ?auto_2741225 ?auto_2741230 ) ) ( not ( = ?auto_2741225 ?auto_2741231 ) ) ( not ( = ?auto_2741225 ?auto_2741232 ) ) ( not ( = ?auto_2741225 ?auto_2741233 ) ) ( not ( = ?auto_2741225 ?auto_2741234 ) ) ( not ( = ?auto_2741225 ?auto_2741235 ) ) ( not ( = ?auto_2741225 ?auto_2741236 ) ) ( not ( = ?auto_2741225 ?auto_2741237 ) ) ( not ( = ?auto_2741225 ?auto_2741238 ) ) ( not ( = ?auto_2741226 ?auto_2741227 ) ) ( not ( = ?auto_2741226 ?auto_2741228 ) ) ( not ( = ?auto_2741226 ?auto_2741229 ) ) ( not ( = ?auto_2741226 ?auto_2741230 ) ) ( not ( = ?auto_2741226 ?auto_2741231 ) ) ( not ( = ?auto_2741226 ?auto_2741232 ) ) ( not ( = ?auto_2741226 ?auto_2741233 ) ) ( not ( = ?auto_2741226 ?auto_2741234 ) ) ( not ( = ?auto_2741226 ?auto_2741235 ) ) ( not ( = ?auto_2741226 ?auto_2741236 ) ) ( not ( = ?auto_2741226 ?auto_2741237 ) ) ( not ( = ?auto_2741226 ?auto_2741238 ) ) ( not ( = ?auto_2741227 ?auto_2741228 ) ) ( not ( = ?auto_2741227 ?auto_2741229 ) ) ( not ( = ?auto_2741227 ?auto_2741230 ) ) ( not ( = ?auto_2741227 ?auto_2741231 ) ) ( not ( = ?auto_2741227 ?auto_2741232 ) ) ( not ( = ?auto_2741227 ?auto_2741233 ) ) ( not ( = ?auto_2741227 ?auto_2741234 ) ) ( not ( = ?auto_2741227 ?auto_2741235 ) ) ( not ( = ?auto_2741227 ?auto_2741236 ) ) ( not ( = ?auto_2741227 ?auto_2741237 ) ) ( not ( = ?auto_2741227 ?auto_2741238 ) ) ( not ( = ?auto_2741228 ?auto_2741229 ) ) ( not ( = ?auto_2741228 ?auto_2741230 ) ) ( not ( = ?auto_2741228 ?auto_2741231 ) ) ( not ( = ?auto_2741228 ?auto_2741232 ) ) ( not ( = ?auto_2741228 ?auto_2741233 ) ) ( not ( = ?auto_2741228 ?auto_2741234 ) ) ( not ( = ?auto_2741228 ?auto_2741235 ) ) ( not ( = ?auto_2741228 ?auto_2741236 ) ) ( not ( = ?auto_2741228 ?auto_2741237 ) ) ( not ( = ?auto_2741228 ?auto_2741238 ) ) ( not ( = ?auto_2741229 ?auto_2741230 ) ) ( not ( = ?auto_2741229 ?auto_2741231 ) ) ( not ( = ?auto_2741229 ?auto_2741232 ) ) ( not ( = ?auto_2741229 ?auto_2741233 ) ) ( not ( = ?auto_2741229 ?auto_2741234 ) ) ( not ( = ?auto_2741229 ?auto_2741235 ) ) ( not ( = ?auto_2741229 ?auto_2741236 ) ) ( not ( = ?auto_2741229 ?auto_2741237 ) ) ( not ( = ?auto_2741229 ?auto_2741238 ) ) ( not ( = ?auto_2741230 ?auto_2741231 ) ) ( not ( = ?auto_2741230 ?auto_2741232 ) ) ( not ( = ?auto_2741230 ?auto_2741233 ) ) ( not ( = ?auto_2741230 ?auto_2741234 ) ) ( not ( = ?auto_2741230 ?auto_2741235 ) ) ( not ( = ?auto_2741230 ?auto_2741236 ) ) ( not ( = ?auto_2741230 ?auto_2741237 ) ) ( not ( = ?auto_2741230 ?auto_2741238 ) ) ( not ( = ?auto_2741231 ?auto_2741232 ) ) ( not ( = ?auto_2741231 ?auto_2741233 ) ) ( not ( = ?auto_2741231 ?auto_2741234 ) ) ( not ( = ?auto_2741231 ?auto_2741235 ) ) ( not ( = ?auto_2741231 ?auto_2741236 ) ) ( not ( = ?auto_2741231 ?auto_2741237 ) ) ( not ( = ?auto_2741231 ?auto_2741238 ) ) ( not ( = ?auto_2741232 ?auto_2741233 ) ) ( not ( = ?auto_2741232 ?auto_2741234 ) ) ( not ( = ?auto_2741232 ?auto_2741235 ) ) ( not ( = ?auto_2741232 ?auto_2741236 ) ) ( not ( = ?auto_2741232 ?auto_2741237 ) ) ( not ( = ?auto_2741232 ?auto_2741238 ) ) ( not ( = ?auto_2741233 ?auto_2741234 ) ) ( not ( = ?auto_2741233 ?auto_2741235 ) ) ( not ( = ?auto_2741233 ?auto_2741236 ) ) ( not ( = ?auto_2741233 ?auto_2741237 ) ) ( not ( = ?auto_2741233 ?auto_2741238 ) ) ( not ( = ?auto_2741234 ?auto_2741235 ) ) ( not ( = ?auto_2741234 ?auto_2741236 ) ) ( not ( = ?auto_2741234 ?auto_2741237 ) ) ( not ( = ?auto_2741234 ?auto_2741238 ) ) ( not ( = ?auto_2741235 ?auto_2741236 ) ) ( not ( = ?auto_2741235 ?auto_2741237 ) ) ( not ( = ?auto_2741235 ?auto_2741238 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2741236 ?auto_2741237 ?auto_2741238 )
      ( MAKE-15CRATE-VERIFY ?auto_2741223 ?auto_2741224 ?auto_2741225 ?auto_2741226 ?auto_2741227 ?auto_2741228 ?auto_2741229 ?auto_2741230 ?auto_2741231 ?auto_2741232 ?auto_2741233 ?auto_2741234 ?auto_2741235 ?auto_2741236 ?auto_2741237 ?auto_2741238 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2741418 - SURFACE
      ?auto_2741419 - SURFACE
      ?auto_2741420 - SURFACE
      ?auto_2741421 - SURFACE
      ?auto_2741422 - SURFACE
      ?auto_2741423 - SURFACE
      ?auto_2741424 - SURFACE
      ?auto_2741425 - SURFACE
      ?auto_2741426 - SURFACE
      ?auto_2741427 - SURFACE
      ?auto_2741428 - SURFACE
      ?auto_2741429 - SURFACE
      ?auto_2741430 - SURFACE
      ?auto_2741431 - SURFACE
      ?auto_2741432 - SURFACE
      ?auto_2741433 - SURFACE
    )
    :vars
    (
      ?auto_2741435 - HOIST
      ?auto_2741436 - PLACE
      ?auto_2741437 - TRUCK
      ?auto_2741434 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2741435 ?auto_2741436 ) ( SURFACE-AT ?auto_2741432 ?auto_2741436 ) ( CLEAR ?auto_2741432 ) ( IS-CRATE ?auto_2741433 ) ( not ( = ?auto_2741432 ?auto_2741433 ) ) ( AVAILABLE ?auto_2741435 ) ( IN ?auto_2741433 ?auto_2741437 ) ( ON ?auto_2741432 ?auto_2741431 ) ( not ( = ?auto_2741431 ?auto_2741432 ) ) ( not ( = ?auto_2741431 ?auto_2741433 ) ) ( TRUCK-AT ?auto_2741437 ?auto_2741434 ) ( not ( = ?auto_2741434 ?auto_2741436 ) ) ( ON ?auto_2741419 ?auto_2741418 ) ( ON ?auto_2741420 ?auto_2741419 ) ( ON ?auto_2741421 ?auto_2741420 ) ( ON ?auto_2741422 ?auto_2741421 ) ( ON ?auto_2741423 ?auto_2741422 ) ( ON ?auto_2741424 ?auto_2741423 ) ( ON ?auto_2741425 ?auto_2741424 ) ( ON ?auto_2741426 ?auto_2741425 ) ( ON ?auto_2741427 ?auto_2741426 ) ( ON ?auto_2741428 ?auto_2741427 ) ( ON ?auto_2741429 ?auto_2741428 ) ( ON ?auto_2741430 ?auto_2741429 ) ( ON ?auto_2741431 ?auto_2741430 ) ( not ( = ?auto_2741418 ?auto_2741419 ) ) ( not ( = ?auto_2741418 ?auto_2741420 ) ) ( not ( = ?auto_2741418 ?auto_2741421 ) ) ( not ( = ?auto_2741418 ?auto_2741422 ) ) ( not ( = ?auto_2741418 ?auto_2741423 ) ) ( not ( = ?auto_2741418 ?auto_2741424 ) ) ( not ( = ?auto_2741418 ?auto_2741425 ) ) ( not ( = ?auto_2741418 ?auto_2741426 ) ) ( not ( = ?auto_2741418 ?auto_2741427 ) ) ( not ( = ?auto_2741418 ?auto_2741428 ) ) ( not ( = ?auto_2741418 ?auto_2741429 ) ) ( not ( = ?auto_2741418 ?auto_2741430 ) ) ( not ( = ?auto_2741418 ?auto_2741431 ) ) ( not ( = ?auto_2741418 ?auto_2741432 ) ) ( not ( = ?auto_2741418 ?auto_2741433 ) ) ( not ( = ?auto_2741419 ?auto_2741420 ) ) ( not ( = ?auto_2741419 ?auto_2741421 ) ) ( not ( = ?auto_2741419 ?auto_2741422 ) ) ( not ( = ?auto_2741419 ?auto_2741423 ) ) ( not ( = ?auto_2741419 ?auto_2741424 ) ) ( not ( = ?auto_2741419 ?auto_2741425 ) ) ( not ( = ?auto_2741419 ?auto_2741426 ) ) ( not ( = ?auto_2741419 ?auto_2741427 ) ) ( not ( = ?auto_2741419 ?auto_2741428 ) ) ( not ( = ?auto_2741419 ?auto_2741429 ) ) ( not ( = ?auto_2741419 ?auto_2741430 ) ) ( not ( = ?auto_2741419 ?auto_2741431 ) ) ( not ( = ?auto_2741419 ?auto_2741432 ) ) ( not ( = ?auto_2741419 ?auto_2741433 ) ) ( not ( = ?auto_2741420 ?auto_2741421 ) ) ( not ( = ?auto_2741420 ?auto_2741422 ) ) ( not ( = ?auto_2741420 ?auto_2741423 ) ) ( not ( = ?auto_2741420 ?auto_2741424 ) ) ( not ( = ?auto_2741420 ?auto_2741425 ) ) ( not ( = ?auto_2741420 ?auto_2741426 ) ) ( not ( = ?auto_2741420 ?auto_2741427 ) ) ( not ( = ?auto_2741420 ?auto_2741428 ) ) ( not ( = ?auto_2741420 ?auto_2741429 ) ) ( not ( = ?auto_2741420 ?auto_2741430 ) ) ( not ( = ?auto_2741420 ?auto_2741431 ) ) ( not ( = ?auto_2741420 ?auto_2741432 ) ) ( not ( = ?auto_2741420 ?auto_2741433 ) ) ( not ( = ?auto_2741421 ?auto_2741422 ) ) ( not ( = ?auto_2741421 ?auto_2741423 ) ) ( not ( = ?auto_2741421 ?auto_2741424 ) ) ( not ( = ?auto_2741421 ?auto_2741425 ) ) ( not ( = ?auto_2741421 ?auto_2741426 ) ) ( not ( = ?auto_2741421 ?auto_2741427 ) ) ( not ( = ?auto_2741421 ?auto_2741428 ) ) ( not ( = ?auto_2741421 ?auto_2741429 ) ) ( not ( = ?auto_2741421 ?auto_2741430 ) ) ( not ( = ?auto_2741421 ?auto_2741431 ) ) ( not ( = ?auto_2741421 ?auto_2741432 ) ) ( not ( = ?auto_2741421 ?auto_2741433 ) ) ( not ( = ?auto_2741422 ?auto_2741423 ) ) ( not ( = ?auto_2741422 ?auto_2741424 ) ) ( not ( = ?auto_2741422 ?auto_2741425 ) ) ( not ( = ?auto_2741422 ?auto_2741426 ) ) ( not ( = ?auto_2741422 ?auto_2741427 ) ) ( not ( = ?auto_2741422 ?auto_2741428 ) ) ( not ( = ?auto_2741422 ?auto_2741429 ) ) ( not ( = ?auto_2741422 ?auto_2741430 ) ) ( not ( = ?auto_2741422 ?auto_2741431 ) ) ( not ( = ?auto_2741422 ?auto_2741432 ) ) ( not ( = ?auto_2741422 ?auto_2741433 ) ) ( not ( = ?auto_2741423 ?auto_2741424 ) ) ( not ( = ?auto_2741423 ?auto_2741425 ) ) ( not ( = ?auto_2741423 ?auto_2741426 ) ) ( not ( = ?auto_2741423 ?auto_2741427 ) ) ( not ( = ?auto_2741423 ?auto_2741428 ) ) ( not ( = ?auto_2741423 ?auto_2741429 ) ) ( not ( = ?auto_2741423 ?auto_2741430 ) ) ( not ( = ?auto_2741423 ?auto_2741431 ) ) ( not ( = ?auto_2741423 ?auto_2741432 ) ) ( not ( = ?auto_2741423 ?auto_2741433 ) ) ( not ( = ?auto_2741424 ?auto_2741425 ) ) ( not ( = ?auto_2741424 ?auto_2741426 ) ) ( not ( = ?auto_2741424 ?auto_2741427 ) ) ( not ( = ?auto_2741424 ?auto_2741428 ) ) ( not ( = ?auto_2741424 ?auto_2741429 ) ) ( not ( = ?auto_2741424 ?auto_2741430 ) ) ( not ( = ?auto_2741424 ?auto_2741431 ) ) ( not ( = ?auto_2741424 ?auto_2741432 ) ) ( not ( = ?auto_2741424 ?auto_2741433 ) ) ( not ( = ?auto_2741425 ?auto_2741426 ) ) ( not ( = ?auto_2741425 ?auto_2741427 ) ) ( not ( = ?auto_2741425 ?auto_2741428 ) ) ( not ( = ?auto_2741425 ?auto_2741429 ) ) ( not ( = ?auto_2741425 ?auto_2741430 ) ) ( not ( = ?auto_2741425 ?auto_2741431 ) ) ( not ( = ?auto_2741425 ?auto_2741432 ) ) ( not ( = ?auto_2741425 ?auto_2741433 ) ) ( not ( = ?auto_2741426 ?auto_2741427 ) ) ( not ( = ?auto_2741426 ?auto_2741428 ) ) ( not ( = ?auto_2741426 ?auto_2741429 ) ) ( not ( = ?auto_2741426 ?auto_2741430 ) ) ( not ( = ?auto_2741426 ?auto_2741431 ) ) ( not ( = ?auto_2741426 ?auto_2741432 ) ) ( not ( = ?auto_2741426 ?auto_2741433 ) ) ( not ( = ?auto_2741427 ?auto_2741428 ) ) ( not ( = ?auto_2741427 ?auto_2741429 ) ) ( not ( = ?auto_2741427 ?auto_2741430 ) ) ( not ( = ?auto_2741427 ?auto_2741431 ) ) ( not ( = ?auto_2741427 ?auto_2741432 ) ) ( not ( = ?auto_2741427 ?auto_2741433 ) ) ( not ( = ?auto_2741428 ?auto_2741429 ) ) ( not ( = ?auto_2741428 ?auto_2741430 ) ) ( not ( = ?auto_2741428 ?auto_2741431 ) ) ( not ( = ?auto_2741428 ?auto_2741432 ) ) ( not ( = ?auto_2741428 ?auto_2741433 ) ) ( not ( = ?auto_2741429 ?auto_2741430 ) ) ( not ( = ?auto_2741429 ?auto_2741431 ) ) ( not ( = ?auto_2741429 ?auto_2741432 ) ) ( not ( = ?auto_2741429 ?auto_2741433 ) ) ( not ( = ?auto_2741430 ?auto_2741431 ) ) ( not ( = ?auto_2741430 ?auto_2741432 ) ) ( not ( = ?auto_2741430 ?auto_2741433 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2741431 ?auto_2741432 ?auto_2741433 )
      ( MAKE-15CRATE-VERIFY ?auto_2741418 ?auto_2741419 ?auto_2741420 ?auto_2741421 ?auto_2741422 ?auto_2741423 ?auto_2741424 ?auto_2741425 ?auto_2741426 ?auto_2741427 ?auto_2741428 ?auto_2741429 ?auto_2741430 ?auto_2741431 ?auto_2741432 ?auto_2741433 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2741628 - SURFACE
      ?auto_2741629 - SURFACE
      ?auto_2741630 - SURFACE
      ?auto_2741631 - SURFACE
      ?auto_2741632 - SURFACE
      ?auto_2741633 - SURFACE
      ?auto_2741634 - SURFACE
      ?auto_2741635 - SURFACE
      ?auto_2741636 - SURFACE
      ?auto_2741637 - SURFACE
      ?auto_2741638 - SURFACE
      ?auto_2741639 - SURFACE
      ?auto_2741640 - SURFACE
      ?auto_2741641 - SURFACE
      ?auto_2741642 - SURFACE
      ?auto_2741643 - SURFACE
    )
    :vars
    (
      ?auto_2741648 - HOIST
      ?auto_2741644 - PLACE
      ?auto_2741647 - TRUCK
      ?auto_2741645 - PLACE
      ?auto_2741646 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2741648 ?auto_2741644 ) ( SURFACE-AT ?auto_2741642 ?auto_2741644 ) ( CLEAR ?auto_2741642 ) ( IS-CRATE ?auto_2741643 ) ( not ( = ?auto_2741642 ?auto_2741643 ) ) ( AVAILABLE ?auto_2741648 ) ( ON ?auto_2741642 ?auto_2741641 ) ( not ( = ?auto_2741641 ?auto_2741642 ) ) ( not ( = ?auto_2741641 ?auto_2741643 ) ) ( TRUCK-AT ?auto_2741647 ?auto_2741645 ) ( not ( = ?auto_2741645 ?auto_2741644 ) ) ( HOIST-AT ?auto_2741646 ?auto_2741645 ) ( LIFTING ?auto_2741646 ?auto_2741643 ) ( not ( = ?auto_2741648 ?auto_2741646 ) ) ( ON ?auto_2741629 ?auto_2741628 ) ( ON ?auto_2741630 ?auto_2741629 ) ( ON ?auto_2741631 ?auto_2741630 ) ( ON ?auto_2741632 ?auto_2741631 ) ( ON ?auto_2741633 ?auto_2741632 ) ( ON ?auto_2741634 ?auto_2741633 ) ( ON ?auto_2741635 ?auto_2741634 ) ( ON ?auto_2741636 ?auto_2741635 ) ( ON ?auto_2741637 ?auto_2741636 ) ( ON ?auto_2741638 ?auto_2741637 ) ( ON ?auto_2741639 ?auto_2741638 ) ( ON ?auto_2741640 ?auto_2741639 ) ( ON ?auto_2741641 ?auto_2741640 ) ( not ( = ?auto_2741628 ?auto_2741629 ) ) ( not ( = ?auto_2741628 ?auto_2741630 ) ) ( not ( = ?auto_2741628 ?auto_2741631 ) ) ( not ( = ?auto_2741628 ?auto_2741632 ) ) ( not ( = ?auto_2741628 ?auto_2741633 ) ) ( not ( = ?auto_2741628 ?auto_2741634 ) ) ( not ( = ?auto_2741628 ?auto_2741635 ) ) ( not ( = ?auto_2741628 ?auto_2741636 ) ) ( not ( = ?auto_2741628 ?auto_2741637 ) ) ( not ( = ?auto_2741628 ?auto_2741638 ) ) ( not ( = ?auto_2741628 ?auto_2741639 ) ) ( not ( = ?auto_2741628 ?auto_2741640 ) ) ( not ( = ?auto_2741628 ?auto_2741641 ) ) ( not ( = ?auto_2741628 ?auto_2741642 ) ) ( not ( = ?auto_2741628 ?auto_2741643 ) ) ( not ( = ?auto_2741629 ?auto_2741630 ) ) ( not ( = ?auto_2741629 ?auto_2741631 ) ) ( not ( = ?auto_2741629 ?auto_2741632 ) ) ( not ( = ?auto_2741629 ?auto_2741633 ) ) ( not ( = ?auto_2741629 ?auto_2741634 ) ) ( not ( = ?auto_2741629 ?auto_2741635 ) ) ( not ( = ?auto_2741629 ?auto_2741636 ) ) ( not ( = ?auto_2741629 ?auto_2741637 ) ) ( not ( = ?auto_2741629 ?auto_2741638 ) ) ( not ( = ?auto_2741629 ?auto_2741639 ) ) ( not ( = ?auto_2741629 ?auto_2741640 ) ) ( not ( = ?auto_2741629 ?auto_2741641 ) ) ( not ( = ?auto_2741629 ?auto_2741642 ) ) ( not ( = ?auto_2741629 ?auto_2741643 ) ) ( not ( = ?auto_2741630 ?auto_2741631 ) ) ( not ( = ?auto_2741630 ?auto_2741632 ) ) ( not ( = ?auto_2741630 ?auto_2741633 ) ) ( not ( = ?auto_2741630 ?auto_2741634 ) ) ( not ( = ?auto_2741630 ?auto_2741635 ) ) ( not ( = ?auto_2741630 ?auto_2741636 ) ) ( not ( = ?auto_2741630 ?auto_2741637 ) ) ( not ( = ?auto_2741630 ?auto_2741638 ) ) ( not ( = ?auto_2741630 ?auto_2741639 ) ) ( not ( = ?auto_2741630 ?auto_2741640 ) ) ( not ( = ?auto_2741630 ?auto_2741641 ) ) ( not ( = ?auto_2741630 ?auto_2741642 ) ) ( not ( = ?auto_2741630 ?auto_2741643 ) ) ( not ( = ?auto_2741631 ?auto_2741632 ) ) ( not ( = ?auto_2741631 ?auto_2741633 ) ) ( not ( = ?auto_2741631 ?auto_2741634 ) ) ( not ( = ?auto_2741631 ?auto_2741635 ) ) ( not ( = ?auto_2741631 ?auto_2741636 ) ) ( not ( = ?auto_2741631 ?auto_2741637 ) ) ( not ( = ?auto_2741631 ?auto_2741638 ) ) ( not ( = ?auto_2741631 ?auto_2741639 ) ) ( not ( = ?auto_2741631 ?auto_2741640 ) ) ( not ( = ?auto_2741631 ?auto_2741641 ) ) ( not ( = ?auto_2741631 ?auto_2741642 ) ) ( not ( = ?auto_2741631 ?auto_2741643 ) ) ( not ( = ?auto_2741632 ?auto_2741633 ) ) ( not ( = ?auto_2741632 ?auto_2741634 ) ) ( not ( = ?auto_2741632 ?auto_2741635 ) ) ( not ( = ?auto_2741632 ?auto_2741636 ) ) ( not ( = ?auto_2741632 ?auto_2741637 ) ) ( not ( = ?auto_2741632 ?auto_2741638 ) ) ( not ( = ?auto_2741632 ?auto_2741639 ) ) ( not ( = ?auto_2741632 ?auto_2741640 ) ) ( not ( = ?auto_2741632 ?auto_2741641 ) ) ( not ( = ?auto_2741632 ?auto_2741642 ) ) ( not ( = ?auto_2741632 ?auto_2741643 ) ) ( not ( = ?auto_2741633 ?auto_2741634 ) ) ( not ( = ?auto_2741633 ?auto_2741635 ) ) ( not ( = ?auto_2741633 ?auto_2741636 ) ) ( not ( = ?auto_2741633 ?auto_2741637 ) ) ( not ( = ?auto_2741633 ?auto_2741638 ) ) ( not ( = ?auto_2741633 ?auto_2741639 ) ) ( not ( = ?auto_2741633 ?auto_2741640 ) ) ( not ( = ?auto_2741633 ?auto_2741641 ) ) ( not ( = ?auto_2741633 ?auto_2741642 ) ) ( not ( = ?auto_2741633 ?auto_2741643 ) ) ( not ( = ?auto_2741634 ?auto_2741635 ) ) ( not ( = ?auto_2741634 ?auto_2741636 ) ) ( not ( = ?auto_2741634 ?auto_2741637 ) ) ( not ( = ?auto_2741634 ?auto_2741638 ) ) ( not ( = ?auto_2741634 ?auto_2741639 ) ) ( not ( = ?auto_2741634 ?auto_2741640 ) ) ( not ( = ?auto_2741634 ?auto_2741641 ) ) ( not ( = ?auto_2741634 ?auto_2741642 ) ) ( not ( = ?auto_2741634 ?auto_2741643 ) ) ( not ( = ?auto_2741635 ?auto_2741636 ) ) ( not ( = ?auto_2741635 ?auto_2741637 ) ) ( not ( = ?auto_2741635 ?auto_2741638 ) ) ( not ( = ?auto_2741635 ?auto_2741639 ) ) ( not ( = ?auto_2741635 ?auto_2741640 ) ) ( not ( = ?auto_2741635 ?auto_2741641 ) ) ( not ( = ?auto_2741635 ?auto_2741642 ) ) ( not ( = ?auto_2741635 ?auto_2741643 ) ) ( not ( = ?auto_2741636 ?auto_2741637 ) ) ( not ( = ?auto_2741636 ?auto_2741638 ) ) ( not ( = ?auto_2741636 ?auto_2741639 ) ) ( not ( = ?auto_2741636 ?auto_2741640 ) ) ( not ( = ?auto_2741636 ?auto_2741641 ) ) ( not ( = ?auto_2741636 ?auto_2741642 ) ) ( not ( = ?auto_2741636 ?auto_2741643 ) ) ( not ( = ?auto_2741637 ?auto_2741638 ) ) ( not ( = ?auto_2741637 ?auto_2741639 ) ) ( not ( = ?auto_2741637 ?auto_2741640 ) ) ( not ( = ?auto_2741637 ?auto_2741641 ) ) ( not ( = ?auto_2741637 ?auto_2741642 ) ) ( not ( = ?auto_2741637 ?auto_2741643 ) ) ( not ( = ?auto_2741638 ?auto_2741639 ) ) ( not ( = ?auto_2741638 ?auto_2741640 ) ) ( not ( = ?auto_2741638 ?auto_2741641 ) ) ( not ( = ?auto_2741638 ?auto_2741642 ) ) ( not ( = ?auto_2741638 ?auto_2741643 ) ) ( not ( = ?auto_2741639 ?auto_2741640 ) ) ( not ( = ?auto_2741639 ?auto_2741641 ) ) ( not ( = ?auto_2741639 ?auto_2741642 ) ) ( not ( = ?auto_2741639 ?auto_2741643 ) ) ( not ( = ?auto_2741640 ?auto_2741641 ) ) ( not ( = ?auto_2741640 ?auto_2741642 ) ) ( not ( = ?auto_2741640 ?auto_2741643 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2741641 ?auto_2741642 ?auto_2741643 )
      ( MAKE-15CRATE-VERIFY ?auto_2741628 ?auto_2741629 ?auto_2741630 ?auto_2741631 ?auto_2741632 ?auto_2741633 ?auto_2741634 ?auto_2741635 ?auto_2741636 ?auto_2741637 ?auto_2741638 ?auto_2741639 ?auto_2741640 ?auto_2741641 ?auto_2741642 ?auto_2741643 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2741853 - SURFACE
      ?auto_2741854 - SURFACE
      ?auto_2741855 - SURFACE
      ?auto_2741856 - SURFACE
      ?auto_2741857 - SURFACE
      ?auto_2741858 - SURFACE
      ?auto_2741859 - SURFACE
      ?auto_2741860 - SURFACE
      ?auto_2741861 - SURFACE
      ?auto_2741862 - SURFACE
      ?auto_2741863 - SURFACE
      ?auto_2741864 - SURFACE
      ?auto_2741865 - SURFACE
      ?auto_2741866 - SURFACE
      ?auto_2741867 - SURFACE
      ?auto_2741868 - SURFACE
    )
    :vars
    (
      ?auto_2741871 - HOIST
      ?auto_2741870 - PLACE
      ?auto_2741869 - TRUCK
      ?auto_2741874 - PLACE
      ?auto_2741873 - HOIST
      ?auto_2741872 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2741871 ?auto_2741870 ) ( SURFACE-AT ?auto_2741867 ?auto_2741870 ) ( CLEAR ?auto_2741867 ) ( IS-CRATE ?auto_2741868 ) ( not ( = ?auto_2741867 ?auto_2741868 ) ) ( AVAILABLE ?auto_2741871 ) ( ON ?auto_2741867 ?auto_2741866 ) ( not ( = ?auto_2741866 ?auto_2741867 ) ) ( not ( = ?auto_2741866 ?auto_2741868 ) ) ( TRUCK-AT ?auto_2741869 ?auto_2741874 ) ( not ( = ?auto_2741874 ?auto_2741870 ) ) ( HOIST-AT ?auto_2741873 ?auto_2741874 ) ( not ( = ?auto_2741871 ?auto_2741873 ) ) ( AVAILABLE ?auto_2741873 ) ( SURFACE-AT ?auto_2741868 ?auto_2741874 ) ( ON ?auto_2741868 ?auto_2741872 ) ( CLEAR ?auto_2741868 ) ( not ( = ?auto_2741867 ?auto_2741872 ) ) ( not ( = ?auto_2741868 ?auto_2741872 ) ) ( not ( = ?auto_2741866 ?auto_2741872 ) ) ( ON ?auto_2741854 ?auto_2741853 ) ( ON ?auto_2741855 ?auto_2741854 ) ( ON ?auto_2741856 ?auto_2741855 ) ( ON ?auto_2741857 ?auto_2741856 ) ( ON ?auto_2741858 ?auto_2741857 ) ( ON ?auto_2741859 ?auto_2741858 ) ( ON ?auto_2741860 ?auto_2741859 ) ( ON ?auto_2741861 ?auto_2741860 ) ( ON ?auto_2741862 ?auto_2741861 ) ( ON ?auto_2741863 ?auto_2741862 ) ( ON ?auto_2741864 ?auto_2741863 ) ( ON ?auto_2741865 ?auto_2741864 ) ( ON ?auto_2741866 ?auto_2741865 ) ( not ( = ?auto_2741853 ?auto_2741854 ) ) ( not ( = ?auto_2741853 ?auto_2741855 ) ) ( not ( = ?auto_2741853 ?auto_2741856 ) ) ( not ( = ?auto_2741853 ?auto_2741857 ) ) ( not ( = ?auto_2741853 ?auto_2741858 ) ) ( not ( = ?auto_2741853 ?auto_2741859 ) ) ( not ( = ?auto_2741853 ?auto_2741860 ) ) ( not ( = ?auto_2741853 ?auto_2741861 ) ) ( not ( = ?auto_2741853 ?auto_2741862 ) ) ( not ( = ?auto_2741853 ?auto_2741863 ) ) ( not ( = ?auto_2741853 ?auto_2741864 ) ) ( not ( = ?auto_2741853 ?auto_2741865 ) ) ( not ( = ?auto_2741853 ?auto_2741866 ) ) ( not ( = ?auto_2741853 ?auto_2741867 ) ) ( not ( = ?auto_2741853 ?auto_2741868 ) ) ( not ( = ?auto_2741853 ?auto_2741872 ) ) ( not ( = ?auto_2741854 ?auto_2741855 ) ) ( not ( = ?auto_2741854 ?auto_2741856 ) ) ( not ( = ?auto_2741854 ?auto_2741857 ) ) ( not ( = ?auto_2741854 ?auto_2741858 ) ) ( not ( = ?auto_2741854 ?auto_2741859 ) ) ( not ( = ?auto_2741854 ?auto_2741860 ) ) ( not ( = ?auto_2741854 ?auto_2741861 ) ) ( not ( = ?auto_2741854 ?auto_2741862 ) ) ( not ( = ?auto_2741854 ?auto_2741863 ) ) ( not ( = ?auto_2741854 ?auto_2741864 ) ) ( not ( = ?auto_2741854 ?auto_2741865 ) ) ( not ( = ?auto_2741854 ?auto_2741866 ) ) ( not ( = ?auto_2741854 ?auto_2741867 ) ) ( not ( = ?auto_2741854 ?auto_2741868 ) ) ( not ( = ?auto_2741854 ?auto_2741872 ) ) ( not ( = ?auto_2741855 ?auto_2741856 ) ) ( not ( = ?auto_2741855 ?auto_2741857 ) ) ( not ( = ?auto_2741855 ?auto_2741858 ) ) ( not ( = ?auto_2741855 ?auto_2741859 ) ) ( not ( = ?auto_2741855 ?auto_2741860 ) ) ( not ( = ?auto_2741855 ?auto_2741861 ) ) ( not ( = ?auto_2741855 ?auto_2741862 ) ) ( not ( = ?auto_2741855 ?auto_2741863 ) ) ( not ( = ?auto_2741855 ?auto_2741864 ) ) ( not ( = ?auto_2741855 ?auto_2741865 ) ) ( not ( = ?auto_2741855 ?auto_2741866 ) ) ( not ( = ?auto_2741855 ?auto_2741867 ) ) ( not ( = ?auto_2741855 ?auto_2741868 ) ) ( not ( = ?auto_2741855 ?auto_2741872 ) ) ( not ( = ?auto_2741856 ?auto_2741857 ) ) ( not ( = ?auto_2741856 ?auto_2741858 ) ) ( not ( = ?auto_2741856 ?auto_2741859 ) ) ( not ( = ?auto_2741856 ?auto_2741860 ) ) ( not ( = ?auto_2741856 ?auto_2741861 ) ) ( not ( = ?auto_2741856 ?auto_2741862 ) ) ( not ( = ?auto_2741856 ?auto_2741863 ) ) ( not ( = ?auto_2741856 ?auto_2741864 ) ) ( not ( = ?auto_2741856 ?auto_2741865 ) ) ( not ( = ?auto_2741856 ?auto_2741866 ) ) ( not ( = ?auto_2741856 ?auto_2741867 ) ) ( not ( = ?auto_2741856 ?auto_2741868 ) ) ( not ( = ?auto_2741856 ?auto_2741872 ) ) ( not ( = ?auto_2741857 ?auto_2741858 ) ) ( not ( = ?auto_2741857 ?auto_2741859 ) ) ( not ( = ?auto_2741857 ?auto_2741860 ) ) ( not ( = ?auto_2741857 ?auto_2741861 ) ) ( not ( = ?auto_2741857 ?auto_2741862 ) ) ( not ( = ?auto_2741857 ?auto_2741863 ) ) ( not ( = ?auto_2741857 ?auto_2741864 ) ) ( not ( = ?auto_2741857 ?auto_2741865 ) ) ( not ( = ?auto_2741857 ?auto_2741866 ) ) ( not ( = ?auto_2741857 ?auto_2741867 ) ) ( not ( = ?auto_2741857 ?auto_2741868 ) ) ( not ( = ?auto_2741857 ?auto_2741872 ) ) ( not ( = ?auto_2741858 ?auto_2741859 ) ) ( not ( = ?auto_2741858 ?auto_2741860 ) ) ( not ( = ?auto_2741858 ?auto_2741861 ) ) ( not ( = ?auto_2741858 ?auto_2741862 ) ) ( not ( = ?auto_2741858 ?auto_2741863 ) ) ( not ( = ?auto_2741858 ?auto_2741864 ) ) ( not ( = ?auto_2741858 ?auto_2741865 ) ) ( not ( = ?auto_2741858 ?auto_2741866 ) ) ( not ( = ?auto_2741858 ?auto_2741867 ) ) ( not ( = ?auto_2741858 ?auto_2741868 ) ) ( not ( = ?auto_2741858 ?auto_2741872 ) ) ( not ( = ?auto_2741859 ?auto_2741860 ) ) ( not ( = ?auto_2741859 ?auto_2741861 ) ) ( not ( = ?auto_2741859 ?auto_2741862 ) ) ( not ( = ?auto_2741859 ?auto_2741863 ) ) ( not ( = ?auto_2741859 ?auto_2741864 ) ) ( not ( = ?auto_2741859 ?auto_2741865 ) ) ( not ( = ?auto_2741859 ?auto_2741866 ) ) ( not ( = ?auto_2741859 ?auto_2741867 ) ) ( not ( = ?auto_2741859 ?auto_2741868 ) ) ( not ( = ?auto_2741859 ?auto_2741872 ) ) ( not ( = ?auto_2741860 ?auto_2741861 ) ) ( not ( = ?auto_2741860 ?auto_2741862 ) ) ( not ( = ?auto_2741860 ?auto_2741863 ) ) ( not ( = ?auto_2741860 ?auto_2741864 ) ) ( not ( = ?auto_2741860 ?auto_2741865 ) ) ( not ( = ?auto_2741860 ?auto_2741866 ) ) ( not ( = ?auto_2741860 ?auto_2741867 ) ) ( not ( = ?auto_2741860 ?auto_2741868 ) ) ( not ( = ?auto_2741860 ?auto_2741872 ) ) ( not ( = ?auto_2741861 ?auto_2741862 ) ) ( not ( = ?auto_2741861 ?auto_2741863 ) ) ( not ( = ?auto_2741861 ?auto_2741864 ) ) ( not ( = ?auto_2741861 ?auto_2741865 ) ) ( not ( = ?auto_2741861 ?auto_2741866 ) ) ( not ( = ?auto_2741861 ?auto_2741867 ) ) ( not ( = ?auto_2741861 ?auto_2741868 ) ) ( not ( = ?auto_2741861 ?auto_2741872 ) ) ( not ( = ?auto_2741862 ?auto_2741863 ) ) ( not ( = ?auto_2741862 ?auto_2741864 ) ) ( not ( = ?auto_2741862 ?auto_2741865 ) ) ( not ( = ?auto_2741862 ?auto_2741866 ) ) ( not ( = ?auto_2741862 ?auto_2741867 ) ) ( not ( = ?auto_2741862 ?auto_2741868 ) ) ( not ( = ?auto_2741862 ?auto_2741872 ) ) ( not ( = ?auto_2741863 ?auto_2741864 ) ) ( not ( = ?auto_2741863 ?auto_2741865 ) ) ( not ( = ?auto_2741863 ?auto_2741866 ) ) ( not ( = ?auto_2741863 ?auto_2741867 ) ) ( not ( = ?auto_2741863 ?auto_2741868 ) ) ( not ( = ?auto_2741863 ?auto_2741872 ) ) ( not ( = ?auto_2741864 ?auto_2741865 ) ) ( not ( = ?auto_2741864 ?auto_2741866 ) ) ( not ( = ?auto_2741864 ?auto_2741867 ) ) ( not ( = ?auto_2741864 ?auto_2741868 ) ) ( not ( = ?auto_2741864 ?auto_2741872 ) ) ( not ( = ?auto_2741865 ?auto_2741866 ) ) ( not ( = ?auto_2741865 ?auto_2741867 ) ) ( not ( = ?auto_2741865 ?auto_2741868 ) ) ( not ( = ?auto_2741865 ?auto_2741872 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2741866 ?auto_2741867 ?auto_2741868 )
      ( MAKE-15CRATE-VERIFY ?auto_2741853 ?auto_2741854 ?auto_2741855 ?auto_2741856 ?auto_2741857 ?auto_2741858 ?auto_2741859 ?auto_2741860 ?auto_2741861 ?auto_2741862 ?auto_2741863 ?auto_2741864 ?auto_2741865 ?auto_2741866 ?auto_2741867 ?auto_2741868 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2742079 - SURFACE
      ?auto_2742080 - SURFACE
      ?auto_2742081 - SURFACE
      ?auto_2742082 - SURFACE
      ?auto_2742083 - SURFACE
      ?auto_2742084 - SURFACE
      ?auto_2742085 - SURFACE
      ?auto_2742086 - SURFACE
      ?auto_2742087 - SURFACE
      ?auto_2742088 - SURFACE
      ?auto_2742089 - SURFACE
      ?auto_2742090 - SURFACE
      ?auto_2742091 - SURFACE
      ?auto_2742092 - SURFACE
      ?auto_2742093 - SURFACE
      ?auto_2742094 - SURFACE
    )
    :vars
    (
      ?auto_2742099 - HOIST
      ?auto_2742097 - PLACE
      ?auto_2742098 - PLACE
      ?auto_2742100 - HOIST
      ?auto_2742096 - SURFACE
      ?auto_2742095 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2742099 ?auto_2742097 ) ( SURFACE-AT ?auto_2742093 ?auto_2742097 ) ( CLEAR ?auto_2742093 ) ( IS-CRATE ?auto_2742094 ) ( not ( = ?auto_2742093 ?auto_2742094 ) ) ( AVAILABLE ?auto_2742099 ) ( ON ?auto_2742093 ?auto_2742092 ) ( not ( = ?auto_2742092 ?auto_2742093 ) ) ( not ( = ?auto_2742092 ?auto_2742094 ) ) ( not ( = ?auto_2742098 ?auto_2742097 ) ) ( HOIST-AT ?auto_2742100 ?auto_2742098 ) ( not ( = ?auto_2742099 ?auto_2742100 ) ) ( AVAILABLE ?auto_2742100 ) ( SURFACE-AT ?auto_2742094 ?auto_2742098 ) ( ON ?auto_2742094 ?auto_2742096 ) ( CLEAR ?auto_2742094 ) ( not ( = ?auto_2742093 ?auto_2742096 ) ) ( not ( = ?auto_2742094 ?auto_2742096 ) ) ( not ( = ?auto_2742092 ?auto_2742096 ) ) ( TRUCK-AT ?auto_2742095 ?auto_2742097 ) ( ON ?auto_2742080 ?auto_2742079 ) ( ON ?auto_2742081 ?auto_2742080 ) ( ON ?auto_2742082 ?auto_2742081 ) ( ON ?auto_2742083 ?auto_2742082 ) ( ON ?auto_2742084 ?auto_2742083 ) ( ON ?auto_2742085 ?auto_2742084 ) ( ON ?auto_2742086 ?auto_2742085 ) ( ON ?auto_2742087 ?auto_2742086 ) ( ON ?auto_2742088 ?auto_2742087 ) ( ON ?auto_2742089 ?auto_2742088 ) ( ON ?auto_2742090 ?auto_2742089 ) ( ON ?auto_2742091 ?auto_2742090 ) ( ON ?auto_2742092 ?auto_2742091 ) ( not ( = ?auto_2742079 ?auto_2742080 ) ) ( not ( = ?auto_2742079 ?auto_2742081 ) ) ( not ( = ?auto_2742079 ?auto_2742082 ) ) ( not ( = ?auto_2742079 ?auto_2742083 ) ) ( not ( = ?auto_2742079 ?auto_2742084 ) ) ( not ( = ?auto_2742079 ?auto_2742085 ) ) ( not ( = ?auto_2742079 ?auto_2742086 ) ) ( not ( = ?auto_2742079 ?auto_2742087 ) ) ( not ( = ?auto_2742079 ?auto_2742088 ) ) ( not ( = ?auto_2742079 ?auto_2742089 ) ) ( not ( = ?auto_2742079 ?auto_2742090 ) ) ( not ( = ?auto_2742079 ?auto_2742091 ) ) ( not ( = ?auto_2742079 ?auto_2742092 ) ) ( not ( = ?auto_2742079 ?auto_2742093 ) ) ( not ( = ?auto_2742079 ?auto_2742094 ) ) ( not ( = ?auto_2742079 ?auto_2742096 ) ) ( not ( = ?auto_2742080 ?auto_2742081 ) ) ( not ( = ?auto_2742080 ?auto_2742082 ) ) ( not ( = ?auto_2742080 ?auto_2742083 ) ) ( not ( = ?auto_2742080 ?auto_2742084 ) ) ( not ( = ?auto_2742080 ?auto_2742085 ) ) ( not ( = ?auto_2742080 ?auto_2742086 ) ) ( not ( = ?auto_2742080 ?auto_2742087 ) ) ( not ( = ?auto_2742080 ?auto_2742088 ) ) ( not ( = ?auto_2742080 ?auto_2742089 ) ) ( not ( = ?auto_2742080 ?auto_2742090 ) ) ( not ( = ?auto_2742080 ?auto_2742091 ) ) ( not ( = ?auto_2742080 ?auto_2742092 ) ) ( not ( = ?auto_2742080 ?auto_2742093 ) ) ( not ( = ?auto_2742080 ?auto_2742094 ) ) ( not ( = ?auto_2742080 ?auto_2742096 ) ) ( not ( = ?auto_2742081 ?auto_2742082 ) ) ( not ( = ?auto_2742081 ?auto_2742083 ) ) ( not ( = ?auto_2742081 ?auto_2742084 ) ) ( not ( = ?auto_2742081 ?auto_2742085 ) ) ( not ( = ?auto_2742081 ?auto_2742086 ) ) ( not ( = ?auto_2742081 ?auto_2742087 ) ) ( not ( = ?auto_2742081 ?auto_2742088 ) ) ( not ( = ?auto_2742081 ?auto_2742089 ) ) ( not ( = ?auto_2742081 ?auto_2742090 ) ) ( not ( = ?auto_2742081 ?auto_2742091 ) ) ( not ( = ?auto_2742081 ?auto_2742092 ) ) ( not ( = ?auto_2742081 ?auto_2742093 ) ) ( not ( = ?auto_2742081 ?auto_2742094 ) ) ( not ( = ?auto_2742081 ?auto_2742096 ) ) ( not ( = ?auto_2742082 ?auto_2742083 ) ) ( not ( = ?auto_2742082 ?auto_2742084 ) ) ( not ( = ?auto_2742082 ?auto_2742085 ) ) ( not ( = ?auto_2742082 ?auto_2742086 ) ) ( not ( = ?auto_2742082 ?auto_2742087 ) ) ( not ( = ?auto_2742082 ?auto_2742088 ) ) ( not ( = ?auto_2742082 ?auto_2742089 ) ) ( not ( = ?auto_2742082 ?auto_2742090 ) ) ( not ( = ?auto_2742082 ?auto_2742091 ) ) ( not ( = ?auto_2742082 ?auto_2742092 ) ) ( not ( = ?auto_2742082 ?auto_2742093 ) ) ( not ( = ?auto_2742082 ?auto_2742094 ) ) ( not ( = ?auto_2742082 ?auto_2742096 ) ) ( not ( = ?auto_2742083 ?auto_2742084 ) ) ( not ( = ?auto_2742083 ?auto_2742085 ) ) ( not ( = ?auto_2742083 ?auto_2742086 ) ) ( not ( = ?auto_2742083 ?auto_2742087 ) ) ( not ( = ?auto_2742083 ?auto_2742088 ) ) ( not ( = ?auto_2742083 ?auto_2742089 ) ) ( not ( = ?auto_2742083 ?auto_2742090 ) ) ( not ( = ?auto_2742083 ?auto_2742091 ) ) ( not ( = ?auto_2742083 ?auto_2742092 ) ) ( not ( = ?auto_2742083 ?auto_2742093 ) ) ( not ( = ?auto_2742083 ?auto_2742094 ) ) ( not ( = ?auto_2742083 ?auto_2742096 ) ) ( not ( = ?auto_2742084 ?auto_2742085 ) ) ( not ( = ?auto_2742084 ?auto_2742086 ) ) ( not ( = ?auto_2742084 ?auto_2742087 ) ) ( not ( = ?auto_2742084 ?auto_2742088 ) ) ( not ( = ?auto_2742084 ?auto_2742089 ) ) ( not ( = ?auto_2742084 ?auto_2742090 ) ) ( not ( = ?auto_2742084 ?auto_2742091 ) ) ( not ( = ?auto_2742084 ?auto_2742092 ) ) ( not ( = ?auto_2742084 ?auto_2742093 ) ) ( not ( = ?auto_2742084 ?auto_2742094 ) ) ( not ( = ?auto_2742084 ?auto_2742096 ) ) ( not ( = ?auto_2742085 ?auto_2742086 ) ) ( not ( = ?auto_2742085 ?auto_2742087 ) ) ( not ( = ?auto_2742085 ?auto_2742088 ) ) ( not ( = ?auto_2742085 ?auto_2742089 ) ) ( not ( = ?auto_2742085 ?auto_2742090 ) ) ( not ( = ?auto_2742085 ?auto_2742091 ) ) ( not ( = ?auto_2742085 ?auto_2742092 ) ) ( not ( = ?auto_2742085 ?auto_2742093 ) ) ( not ( = ?auto_2742085 ?auto_2742094 ) ) ( not ( = ?auto_2742085 ?auto_2742096 ) ) ( not ( = ?auto_2742086 ?auto_2742087 ) ) ( not ( = ?auto_2742086 ?auto_2742088 ) ) ( not ( = ?auto_2742086 ?auto_2742089 ) ) ( not ( = ?auto_2742086 ?auto_2742090 ) ) ( not ( = ?auto_2742086 ?auto_2742091 ) ) ( not ( = ?auto_2742086 ?auto_2742092 ) ) ( not ( = ?auto_2742086 ?auto_2742093 ) ) ( not ( = ?auto_2742086 ?auto_2742094 ) ) ( not ( = ?auto_2742086 ?auto_2742096 ) ) ( not ( = ?auto_2742087 ?auto_2742088 ) ) ( not ( = ?auto_2742087 ?auto_2742089 ) ) ( not ( = ?auto_2742087 ?auto_2742090 ) ) ( not ( = ?auto_2742087 ?auto_2742091 ) ) ( not ( = ?auto_2742087 ?auto_2742092 ) ) ( not ( = ?auto_2742087 ?auto_2742093 ) ) ( not ( = ?auto_2742087 ?auto_2742094 ) ) ( not ( = ?auto_2742087 ?auto_2742096 ) ) ( not ( = ?auto_2742088 ?auto_2742089 ) ) ( not ( = ?auto_2742088 ?auto_2742090 ) ) ( not ( = ?auto_2742088 ?auto_2742091 ) ) ( not ( = ?auto_2742088 ?auto_2742092 ) ) ( not ( = ?auto_2742088 ?auto_2742093 ) ) ( not ( = ?auto_2742088 ?auto_2742094 ) ) ( not ( = ?auto_2742088 ?auto_2742096 ) ) ( not ( = ?auto_2742089 ?auto_2742090 ) ) ( not ( = ?auto_2742089 ?auto_2742091 ) ) ( not ( = ?auto_2742089 ?auto_2742092 ) ) ( not ( = ?auto_2742089 ?auto_2742093 ) ) ( not ( = ?auto_2742089 ?auto_2742094 ) ) ( not ( = ?auto_2742089 ?auto_2742096 ) ) ( not ( = ?auto_2742090 ?auto_2742091 ) ) ( not ( = ?auto_2742090 ?auto_2742092 ) ) ( not ( = ?auto_2742090 ?auto_2742093 ) ) ( not ( = ?auto_2742090 ?auto_2742094 ) ) ( not ( = ?auto_2742090 ?auto_2742096 ) ) ( not ( = ?auto_2742091 ?auto_2742092 ) ) ( not ( = ?auto_2742091 ?auto_2742093 ) ) ( not ( = ?auto_2742091 ?auto_2742094 ) ) ( not ( = ?auto_2742091 ?auto_2742096 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2742092 ?auto_2742093 ?auto_2742094 )
      ( MAKE-15CRATE-VERIFY ?auto_2742079 ?auto_2742080 ?auto_2742081 ?auto_2742082 ?auto_2742083 ?auto_2742084 ?auto_2742085 ?auto_2742086 ?auto_2742087 ?auto_2742088 ?auto_2742089 ?auto_2742090 ?auto_2742091 ?auto_2742092 ?auto_2742093 ?auto_2742094 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2742305 - SURFACE
      ?auto_2742306 - SURFACE
      ?auto_2742307 - SURFACE
      ?auto_2742308 - SURFACE
      ?auto_2742309 - SURFACE
      ?auto_2742310 - SURFACE
      ?auto_2742311 - SURFACE
      ?auto_2742312 - SURFACE
      ?auto_2742313 - SURFACE
      ?auto_2742314 - SURFACE
      ?auto_2742315 - SURFACE
      ?auto_2742316 - SURFACE
      ?auto_2742317 - SURFACE
      ?auto_2742318 - SURFACE
      ?auto_2742319 - SURFACE
      ?auto_2742320 - SURFACE
    )
    :vars
    (
      ?auto_2742322 - HOIST
      ?auto_2742325 - PLACE
      ?auto_2742324 - PLACE
      ?auto_2742321 - HOIST
      ?auto_2742323 - SURFACE
      ?auto_2742326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2742322 ?auto_2742325 ) ( IS-CRATE ?auto_2742320 ) ( not ( = ?auto_2742319 ?auto_2742320 ) ) ( not ( = ?auto_2742318 ?auto_2742319 ) ) ( not ( = ?auto_2742318 ?auto_2742320 ) ) ( not ( = ?auto_2742324 ?auto_2742325 ) ) ( HOIST-AT ?auto_2742321 ?auto_2742324 ) ( not ( = ?auto_2742322 ?auto_2742321 ) ) ( AVAILABLE ?auto_2742321 ) ( SURFACE-AT ?auto_2742320 ?auto_2742324 ) ( ON ?auto_2742320 ?auto_2742323 ) ( CLEAR ?auto_2742320 ) ( not ( = ?auto_2742319 ?auto_2742323 ) ) ( not ( = ?auto_2742320 ?auto_2742323 ) ) ( not ( = ?auto_2742318 ?auto_2742323 ) ) ( TRUCK-AT ?auto_2742326 ?auto_2742325 ) ( SURFACE-AT ?auto_2742318 ?auto_2742325 ) ( CLEAR ?auto_2742318 ) ( LIFTING ?auto_2742322 ?auto_2742319 ) ( IS-CRATE ?auto_2742319 ) ( ON ?auto_2742306 ?auto_2742305 ) ( ON ?auto_2742307 ?auto_2742306 ) ( ON ?auto_2742308 ?auto_2742307 ) ( ON ?auto_2742309 ?auto_2742308 ) ( ON ?auto_2742310 ?auto_2742309 ) ( ON ?auto_2742311 ?auto_2742310 ) ( ON ?auto_2742312 ?auto_2742311 ) ( ON ?auto_2742313 ?auto_2742312 ) ( ON ?auto_2742314 ?auto_2742313 ) ( ON ?auto_2742315 ?auto_2742314 ) ( ON ?auto_2742316 ?auto_2742315 ) ( ON ?auto_2742317 ?auto_2742316 ) ( ON ?auto_2742318 ?auto_2742317 ) ( not ( = ?auto_2742305 ?auto_2742306 ) ) ( not ( = ?auto_2742305 ?auto_2742307 ) ) ( not ( = ?auto_2742305 ?auto_2742308 ) ) ( not ( = ?auto_2742305 ?auto_2742309 ) ) ( not ( = ?auto_2742305 ?auto_2742310 ) ) ( not ( = ?auto_2742305 ?auto_2742311 ) ) ( not ( = ?auto_2742305 ?auto_2742312 ) ) ( not ( = ?auto_2742305 ?auto_2742313 ) ) ( not ( = ?auto_2742305 ?auto_2742314 ) ) ( not ( = ?auto_2742305 ?auto_2742315 ) ) ( not ( = ?auto_2742305 ?auto_2742316 ) ) ( not ( = ?auto_2742305 ?auto_2742317 ) ) ( not ( = ?auto_2742305 ?auto_2742318 ) ) ( not ( = ?auto_2742305 ?auto_2742319 ) ) ( not ( = ?auto_2742305 ?auto_2742320 ) ) ( not ( = ?auto_2742305 ?auto_2742323 ) ) ( not ( = ?auto_2742306 ?auto_2742307 ) ) ( not ( = ?auto_2742306 ?auto_2742308 ) ) ( not ( = ?auto_2742306 ?auto_2742309 ) ) ( not ( = ?auto_2742306 ?auto_2742310 ) ) ( not ( = ?auto_2742306 ?auto_2742311 ) ) ( not ( = ?auto_2742306 ?auto_2742312 ) ) ( not ( = ?auto_2742306 ?auto_2742313 ) ) ( not ( = ?auto_2742306 ?auto_2742314 ) ) ( not ( = ?auto_2742306 ?auto_2742315 ) ) ( not ( = ?auto_2742306 ?auto_2742316 ) ) ( not ( = ?auto_2742306 ?auto_2742317 ) ) ( not ( = ?auto_2742306 ?auto_2742318 ) ) ( not ( = ?auto_2742306 ?auto_2742319 ) ) ( not ( = ?auto_2742306 ?auto_2742320 ) ) ( not ( = ?auto_2742306 ?auto_2742323 ) ) ( not ( = ?auto_2742307 ?auto_2742308 ) ) ( not ( = ?auto_2742307 ?auto_2742309 ) ) ( not ( = ?auto_2742307 ?auto_2742310 ) ) ( not ( = ?auto_2742307 ?auto_2742311 ) ) ( not ( = ?auto_2742307 ?auto_2742312 ) ) ( not ( = ?auto_2742307 ?auto_2742313 ) ) ( not ( = ?auto_2742307 ?auto_2742314 ) ) ( not ( = ?auto_2742307 ?auto_2742315 ) ) ( not ( = ?auto_2742307 ?auto_2742316 ) ) ( not ( = ?auto_2742307 ?auto_2742317 ) ) ( not ( = ?auto_2742307 ?auto_2742318 ) ) ( not ( = ?auto_2742307 ?auto_2742319 ) ) ( not ( = ?auto_2742307 ?auto_2742320 ) ) ( not ( = ?auto_2742307 ?auto_2742323 ) ) ( not ( = ?auto_2742308 ?auto_2742309 ) ) ( not ( = ?auto_2742308 ?auto_2742310 ) ) ( not ( = ?auto_2742308 ?auto_2742311 ) ) ( not ( = ?auto_2742308 ?auto_2742312 ) ) ( not ( = ?auto_2742308 ?auto_2742313 ) ) ( not ( = ?auto_2742308 ?auto_2742314 ) ) ( not ( = ?auto_2742308 ?auto_2742315 ) ) ( not ( = ?auto_2742308 ?auto_2742316 ) ) ( not ( = ?auto_2742308 ?auto_2742317 ) ) ( not ( = ?auto_2742308 ?auto_2742318 ) ) ( not ( = ?auto_2742308 ?auto_2742319 ) ) ( not ( = ?auto_2742308 ?auto_2742320 ) ) ( not ( = ?auto_2742308 ?auto_2742323 ) ) ( not ( = ?auto_2742309 ?auto_2742310 ) ) ( not ( = ?auto_2742309 ?auto_2742311 ) ) ( not ( = ?auto_2742309 ?auto_2742312 ) ) ( not ( = ?auto_2742309 ?auto_2742313 ) ) ( not ( = ?auto_2742309 ?auto_2742314 ) ) ( not ( = ?auto_2742309 ?auto_2742315 ) ) ( not ( = ?auto_2742309 ?auto_2742316 ) ) ( not ( = ?auto_2742309 ?auto_2742317 ) ) ( not ( = ?auto_2742309 ?auto_2742318 ) ) ( not ( = ?auto_2742309 ?auto_2742319 ) ) ( not ( = ?auto_2742309 ?auto_2742320 ) ) ( not ( = ?auto_2742309 ?auto_2742323 ) ) ( not ( = ?auto_2742310 ?auto_2742311 ) ) ( not ( = ?auto_2742310 ?auto_2742312 ) ) ( not ( = ?auto_2742310 ?auto_2742313 ) ) ( not ( = ?auto_2742310 ?auto_2742314 ) ) ( not ( = ?auto_2742310 ?auto_2742315 ) ) ( not ( = ?auto_2742310 ?auto_2742316 ) ) ( not ( = ?auto_2742310 ?auto_2742317 ) ) ( not ( = ?auto_2742310 ?auto_2742318 ) ) ( not ( = ?auto_2742310 ?auto_2742319 ) ) ( not ( = ?auto_2742310 ?auto_2742320 ) ) ( not ( = ?auto_2742310 ?auto_2742323 ) ) ( not ( = ?auto_2742311 ?auto_2742312 ) ) ( not ( = ?auto_2742311 ?auto_2742313 ) ) ( not ( = ?auto_2742311 ?auto_2742314 ) ) ( not ( = ?auto_2742311 ?auto_2742315 ) ) ( not ( = ?auto_2742311 ?auto_2742316 ) ) ( not ( = ?auto_2742311 ?auto_2742317 ) ) ( not ( = ?auto_2742311 ?auto_2742318 ) ) ( not ( = ?auto_2742311 ?auto_2742319 ) ) ( not ( = ?auto_2742311 ?auto_2742320 ) ) ( not ( = ?auto_2742311 ?auto_2742323 ) ) ( not ( = ?auto_2742312 ?auto_2742313 ) ) ( not ( = ?auto_2742312 ?auto_2742314 ) ) ( not ( = ?auto_2742312 ?auto_2742315 ) ) ( not ( = ?auto_2742312 ?auto_2742316 ) ) ( not ( = ?auto_2742312 ?auto_2742317 ) ) ( not ( = ?auto_2742312 ?auto_2742318 ) ) ( not ( = ?auto_2742312 ?auto_2742319 ) ) ( not ( = ?auto_2742312 ?auto_2742320 ) ) ( not ( = ?auto_2742312 ?auto_2742323 ) ) ( not ( = ?auto_2742313 ?auto_2742314 ) ) ( not ( = ?auto_2742313 ?auto_2742315 ) ) ( not ( = ?auto_2742313 ?auto_2742316 ) ) ( not ( = ?auto_2742313 ?auto_2742317 ) ) ( not ( = ?auto_2742313 ?auto_2742318 ) ) ( not ( = ?auto_2742313 ?auto_2742319 ) ) ( not ( = ?auto_2742313 ?auto_2742320 ) ) ( not ( = ?auto_2742313 ?auto_2742323 ) ) ( not ( = ?auto_2742314 ?auto_2742315 ) ) ( not ( = ?auto_2742314 ?auto_2742316 ) ) ( not ( = ?auto_2742314 ?auto_2742317 ) ) ( not ( = ?auto_2742314 ?auto_2742318 ) ) ( not ( = ?auto_2742314 ?auto_2742319 ) ) ( not ( = ?auto_2742314 ?auto_2742320 ) ) ( not ( = ?auto_2742314 ?auto_2742323 ) ) ( not ( = ?auto_2742315 ?auto_2742316 ) ) ( not ( = ?auto_2742315 ?auto_2742317 ) ) ( not ( = ?auto_2742315 ?auto_2742318 ) ) ( not ( = ?auto_2742315 ?auto_2742319 ) ) ( not ( = ?auto_2742315 ?auto_2742320 ) ) ( not ( = ?auto_2742315 ?auto_2742323 ) ) ( not ( = ?auto_2742316 ?auto_2742317 ) ) ( not ( = ?auto_2742316 ?auto_2742318 ) ) ( not ( = ?auto_2742316 ?auto_2742319 ) ) ( not ( = ?auto_2742316 ?auto_2742320 ) ) ( not ( = ?auto_2742316 ?auto_2742323 ) ) ( not ( = ?auto_2742317 ?auto_2742318 ) ) ( not ( = ?auto_2742317 ?auto_2742319 ) ) ( not ( = ?auto_2742317 ?auto_2742320 ) ) ( not ( = ?auto_2742317 ?auto_2742323 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2742318 ?auto_2742319 ?auto_2742320 )
      ( MAKE-15CRATE-VERIFY ?auto_2742305 ?auto_2742306 ?auto_2742307 ?auto_2742308 ?auto_2742309 ?auto_2742310 ?auto_2742311 ?auto_2742312 ?auto_2742313 ?auto_2742314 ?auto_2742315 ?auto_2742316 ?auto_2742317 ?auto_2742318 ?auto_2742319 ?auto_2742320 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2742531 - SURFACE
      ?auto_2742532 - SURFACE
      ?auto_2742533 - SURFACE
      ?auto_2742534 - SURFACE
      ?auto_2742535 - SURFACE
      ?auto_2742536 - SURFACE
      ?auto_2742537 - SURFACE
      ?auto_2742538 - SURFACE
      ?auto_2742539 - SURFACE
      ?auto_2742540 - SURFACE
      ?auto_2742541 - SURFACE
      ?auto_2742542 - SURFACE
      ?auto_2742543 - SURFACE
      ?auto_2742544 - SURFACE
      ?auto_2742545 - SURFACE
      ?auto_2742546 - SURFACE
    )
    :vars
    (
      ?auto_2742552 - HOIST
      ?auto_2742551 - PLACE
      ?auto_2742549 - PLACE
      ?auto_2742547 - HOIST
      ?auto_2742548 - SURFACE
      ?auto_2742550 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2742552 ?auto_2742551 ) ( IS-CRATE ?auto_2742546 ) ( not ( = ?auto_2742545 ?auto_2742546 ) ) ( not ( = ?auto_2742544 ?auto_2742545 ) ) ( not ( = ?auto_2742544 ?auto_2742546 ) ) ( not ( = ?auto_2742549 ?auto_2742551 ) ) ( HOIST-AT ?auto_2742547 ?auto_2742549 ) ( not ( = ?auto_2742552 ?auto_2742547 ) ) ( AVAILABLE ?auto_2742547 ) ( SURFACE-AT ?auto_2742546 ?auto_2742549 ) ( ON ?auto_2742546 ?auto_2742548 ) ( CLEAR ?auto_2742546 ) ( not ( = ?auto_2742545 ?auto_2742548 ) ) ( not ( = ?auto_2742546 ?auto_2742548 ) ) ( not ( = ?auto_2742544 ?auto_2742548 ) ) ( TRUCK-AT ?auto_2742550 ?auto_2742551 ) ( SURFACE-AT ?auto_2742544 ?auto_2742551 ) ( CLEAR ?auto_2742544 ) ( IS-CRATE ?auto_2742545 ) ( AVAILABLE ?auto_2742552 ) ( IN ?auto_2742545 ?auto_2742550 ) ( ON ?auto_2742532 ?auto_2742531 ) ( ON ?auto_2742533 ?auto_2742532 ) ( ON ?auto_2742534 ?auto_2742533 ) ( ON ?auto_2742535 ?auto_2742534 ) ( ON ?auto_2742536 ?auto_2742535 ) ( ON ?auto_2742537 ?auto_2742536 ) ( ON ?auto_2742538 ?auto_2742537 ) ( ON ?auto_2742539 ?auto_2742538 ) ( ON ?auto_2742540 ?auto_2742539 ) ( ON ?auto_2742541 ?auto_2742540 ) ( ON ?auto_2742542 ?auto_2742541 ) ( ON ?auto_2742543 ?auto_2742542 ) ( ON ?auto_2742544 ?auto_2742543 ) ( not ( = ?auto_2742531 ?auto_2742532 ) ) ( not ( = ?auto_2742531 ?auto_2742533 ) ) ( not ( = ?auto_2742531 ?auto_2742534 ) ) ( not ( = ?auto_2742531 ?auto_2742535 ) ) ( not ( = ?auto_2742531 ?auto_2742536 ) ) ( not ( = ?auto_2742531 ?auto_2742537 ) ) ( not ( = ?auto_2742531 ?auto_2742538 ) ) ( not ( = ?auto_2742531 ?auto_2742539 ) ) ( not ( = ?auto_2742531 ?auto_2742540 ) ) ( not ( = ?auto_2742531 ?auto_2742541 ) ) ( not ( = ?auto_2742531 ?auto_2742542 ) ) ( not ( = ?auto_2742531 ?auto_2742543 ) ) ( not ( = ?auto_2742531 ?auto_2742544 ) ) ( not ( = ?auto_2742531 ?auto_2742545 ) ) ( not ( = ?auto_2742531 ?auto_2742546 ) ) ( not ( = ?auto_2742531 ?auto_2742548 ) ) ( not ( = ?auto_2742532 ?auto_2742533 ) ) ( not ( = ?auto_2742532 ?auto_2742534 ) ) ( not ( = ?auto_2742532 ?auto_2742535 ) ) ( not ( = ?auto_2742532 ?auto_2742536 ) ) ( not ( = ?auto_2742532 ?auto_2742537 ) ) ( not ( = ?auto_2742532 ?auto_2742538 ) ) ( not ( = ?auto_2742532 ?auto_2742539 ) ) ( not ( = ?auto_2742532 ?auto_2742540 ) ) ( not ( = ?auto_2742532 ?auto_2742541 ) ) ( not ( = ?auto_2742532 ?auto_2742542 ) ) ( not ( = ?auto_2742532 ?auto_2742543 ) ) ( not ( = ?auto_2742532 ?auto_2742544 ) ) ( not ( = ?auto_2742532 ?auto_2742545 ) ) ( not ( = ?auto_2742532 ?auto_2742546 ) ) ( not ( = ?auto_2742532 ?auto_2742548 ) ) ( not ( = ?auto_2742533 ?auto_2742534 ) ) ( not ( = ?auto_2742533 ?auto_2742535 ) ) ( not ( = ?auto_2742533 ?auto_2742536 ) ) ( not ( = ?auto_2742533 ?auto_2742537 ) ) ( not ( = ?auto_2742533 ?auto_2742538 ) ) ( not ( = ?auto_2742533 ?auto_2742539 ) ) ( not ( = ?auto_2742533 ?auto_2742540 ) ) ( not ( = ?auto_2742533 ?auto_2742541 ) ) ( not ( = ?auto_2742533 ?auto_2742542 ) ) ( not ( = ?auto_2742533 ?auto_2742543 ) ) ( not ( = ?auto_2742533 ?auto_2742544 ) ) ( not ( = ?auto_2742533 ?auto_2742545 ) ) ( not ( = ?auto_2742533 ?auto_2742546 ) ) ( not ( = ?auto_2742533 ?auto_2742548 ) ) ( not ( = ?auto_2742534 ?auto_2742535 ) ) ( not ( = ?auto_2742534 ?auto_2742536 ) ) ( not ( = ?auto_2742534 ?auto_2742537 ) ) ( not ( = ?auto_2742534 ?auto_2742538 ) ) ( not ( = ?auto_2742534 ?auto_2742539 ) ) ( not ( = ?auto_2742534 ?auto_2742540 ) ) ( not ( = ?auto_2742534 ?auto_2742541 ) ) ( not ( = ?auto_2742534 ?auto_2742542 ) ) ( not ( = ?auto_2742534 ?auto_2742543 ) ) ( not ( = ?auto_2742534 ?auto_2742544 ) ) ( not ( = ?auto_2742534 ?auto_2742545 ) ) ( not ( = ?auto_2742534 ?auto_2742546 ) ) ( not ( = ?auto_2742534 ?auto_2742548 ) ) ( not ( = ?auto_2742535 ?auto_2742536 ) ) ( not ( = ?auto_2742535 ?auto_2742537 ) ) ( not ( = ?auto_2742535 ?auto_2742538 ) ) ( not ( = ?auto_2742535 ?auto_2742539 ) ) ( not ( = ?auto_2742535 ?auto_2742540 ) ) ( not ( = ?auto_2742535 ?auto_2742541 ) ) ( not ( = ?auto_2742535 ?auto_2742542 ) ) ( not ( = ?auto_2742535 ?auto_2742543 ) ) ( not ( = ?auto_2742535 ?auto_2742544 ) ) ( not ( = ?auto_2742535 ?auto_2742545 ) ) ( not ( = ?auto_2742535 ?auto_2742546 ) ) ( not ( = ?auto_2742535 ?auto_2742548 ) ) ( not ( = ?auto_2742536 ?auto_2742537 ) ) ( not ( = ?auto_2742536 ?auto_2742538 ) ) ( not ( = ?auto_2742536 ?auto_2742539 ) ) ( not ( = ?auto_2742536 ?auto_2742540 ) ) ( not ( = ?auto_2742536 ?auto_2742541 ) ) ( not ( = ?auto_2742536 ?auto_2742542 ) ) ( not ( = ?auto_2742536 ?auto_2742543 ) ) ( not ( = ?auto_2742536 ?auto_2742544 ) ) ( not ( = ?auto_2742536 ?auto_2742545 ) ) ( not ( = ?auto_2742536 ?auto_2742546 ) ) ( not ( = ?auto_2742536 ?auto_2742548 ) ) ( not ( = ?auto_2742537 ?auto_2742538 ) ) ( not ( = ?auto_2742537 ?auto_2742539 ) ) ( not ( = ?auto_2742537 ?auto_2742540 ) ) ( not ( = ?auto_2742537 ?auto_2742541 ) ) ( not ( = ?auto_2742537 ?auto_2742542 ) ) ( not ( = ?auto_2742537 ?auto_2742543 ) ) ( not ( = ?auto_2742537 ?auto_2742544 ) ) ( not ( = ?auto_2742537 ?auto_2742545 ) ) ( not ( = ?auto_2742537 ?auto_2742546 ) ) ( not ( = ?auto_2742537 ?auto_2742548 ) ) ( not ( = ?auto_2742538 ?auto_2742539 ) ) ( not ( = ?auto_2742538 ?auto_2742540 ) ) ( not ( = ?auto_2742538 ?auto_2742541 ) ) ( not ( = ?auto_2742538 ?auto_2742542 ) ) ( not ( = ?auto_2742538 ?auto_2742543 ) ) ( not ( = ?auto_2742538 ?auto_2742544 ) ) ( not ( = ?auto_2742538 ?auto_2742545 ) ) ( not ( = ?auto_2742538 ?auto_2742546 ) ) ( not ( = ?auto_2742538 ?auto_2742548 ) ) ( not ( = ?auto_2742539 ?auto_2742540 ) ) ( not ( = ?auto_2742539 ?auto_2742541 ) ) ( not ( = ?auto_2742539 ?auto_2742542 ) ) ( not ( = ?auto_2742539 ?auto_2742543 ) ) ( not ( = ?auto_2742539 ?auto_2742544 ) ) ( not ( = ?auto_2742539 ?auto_2742545 ) ) ( not ( = ?auto_2742539 ?auto_2742546 ) ) ( not ( = ?auto_2742539 ?auto_2742548 ) ) ( not ( = ?auto_2742540 ?auto_2742541 ) ) ( not ( = ?auto_2742540 ?auto_2742542 ) ) ( not ( = ?auto_2742540 ?auto_2742543 ) ) ( not ( = ?auto_2742540 ?auto_2742544 ) ) ( not ( = ?auto_2742540 ?auto_2742545 ) ) ( not ( = ?auto_2742540 ?auto_2742546 ) ) ( not ( = ?auto_2742540 ?auto_2742548 ) ) ( not ( = ?auto_2742541 ?auto_2742542 ) ) ( not ( = ?auto_2742541 ?auto_2742543 ) ) ( not ( = ?auto_2742541 ?auto_2742544 ) ) ( not ( = ?auto_2742541 ?auto_2742545 ) ) ( not ( = ?auto_2742541 ?auto_2742546 ) ) ( not ( = ?auto_2742541 ?auto_2742548 ) ) ( not ( = ?auto_2742542 ?auto_2742543 ) ) ( not ( = ?auto_2742542 ?auto_2742544 ) ) ( not ( = ?auto_2742542 ?auto_2742545 ) ) ( not ( = ?auto_2742542 ?auto_2742546 ) ) ( not ( = ?auto_2742542 ?auto_2742548 ) ) ( not ( = ?auto_2742543 ?auto_2742544 ) ) ( not ( = ?auto_2742543 ?auto_2742545 ) ) ( not ( = ?auto_2742543 ?auto_2742546 ) ) ( not ( = ?auto_2742543 ?auto_2742548 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2742544 ?auto_2742545 ?auto_2742546 )
      ( MAKE-15CRATE-VERIFY ?auto_2742531 ?auto_2742532 ?auto_2742533 ?auto_2742534 ?auto_2742535 ?auto_2742536 ?auto_2742537 ?auto_2742538 ?auto_2742539 ?auto_2742540 ?auto_2742541 ?auto_2742542 ?auto_2742543 ?auto_2742544 ?auto_2742545 ?auto_2742546 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2762992 - SURFACE
      ?auto_2762993 - SURFACE
      ?auto_2762994 - SURFACE
      ?auto_2762995 - SURFACE
      ?auto_2762996 - SURFACE
      ?auto_2762997 - SURFACE
      ?auto_2762998 - SURFACE
      ?auto_2762999 - SURFACE
      ?auto_2763000 - SURFACE
      ?auto_2763001 - SURFACE
      ?auto_2763002 - SURFACE
      ?auto_2763003 - SURFACE
      ?auto_2763004 - SURFACE
      ?auto_2763005 - SURFACE
      ?auto_2763006 - SURFACE
      ?auto_2763007 - SURFACE
      ?auto_2763008 - SURFACE
    )
    :vars
    (
      ?auto_2763009 - HOIST
      ?auto_2763010 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2763009 ?auto_2763010 ) ( SURFACE-AT ?auto_2763007 ?auto_2763010 ) ( CLEAR ?auto_2763007 ) ( LIFTING ?auto_2763009 ?auto_2763008 ) ( IS-CRATE ?auto_2763008 ) ( not ( = ?auto_2763007 ?auto_2763008 ) ) ( ON ?auto_2762993 ?auto_2762992 ) ( ON ?auto_2762994 ?auto_2762993 ) ( ON ?auto_2762995 ?auto_2762994 ) ( ON ?auto_2762996 ?auto_2762995 ) ( ON ?auto_2762997 ?auto_2762996 ) ( ON ?auto_2762998 ?auto_2762997 ) ( ON ?auto_2762999 ?auto_2762998 ) ( ON ?auto_2763000 ?auto_2762999 ) ( ON ?auto_2763001 ?auto_2763000 ) ( ON ?auto_2763002 ?auto_2763001 ) ( ON ?auto_2763003 ?auto_2763002 ) ( ON ?auto_2763004 ?auto_2763003 ) ( ON ?auto_2763005 ?auto_2763004 ) ( ON ?auto_2763006 ?auto_2763005 ) ( ON ?auto_2763007 ?auto_2763006 ) ( not ( = ?auto_2762992 ?auto_2762993 ) ) ( not ( = ?auto_2762992 ?auto_2762994 ) ) ( not ( = ?auto_2762992 ?auto_2762995 ) ) ( not ( = ?auto_2762992 ?auto_2762996 ) ) ( not ( = ?auto_2762992 ?auto_2762997 ) ) ( not ( = ?auto_2762992 ?auto_2762998 ) ) ( not ( = ?auto_2762992 ?auto_2762999 ) ) ( not ( = ?auto_2762992 ?auto_2763000 ) ) ( not ( = ?auto_2762992 ?auto_2763001 ) ) ( not ( = ?auto_2762992 ?auto_2763002 ) ) ( not ( = ?auto_2762992 ?auto_2763003 ) ) ( not ( = ?auto_2762992 ?auto_2763004 ) ) ( not ( = ?auto_2762992 ?auto_2763005 ) ) ( not ( = ?auto_2762992 ?auto_2763006 ) ) ( not ( = ?auto_2762992 ?auto_2763007 ) ) ( not ( = ?auto_2762992 ?auto_2763008 ) ) ( not ( = ?auto_2762993 ?auto_2762994 ) ) ( not ( = ?auto_2762993 ?auto_2762995 ) ) ( not ( = ?auto_2762993 ?auto_2762996 ) ) ( not ( = ?auto_2762993 ?auto_2762997 ) ) ( not ( = ?auto_2762993 ?auto_2762998 ) ) ( not ( = ?auto_2762993 ?auto_2762999 ) ) ( not ( = ?auto_2762993 ?auto_2763000 ) ) ( not ( = ?auto_2762993 ?auto_2763001 ) ) ( not ( = ?auto_2762993 ?auto_2763002 ) ) ( not ( = ?auto_2762993 ?auto_2763003 ) ) ( not ( = ?auto_2762993 ?auto_2763004 ) ) ( not ( = ?auto_2762993 ?auto_2763005 ) ) ( not ( = ?auto_2762993 ?auto_2763006 ) ) ( not ( = ?auto_2762993 ?auto_2763007 ) ) ( not ( = ?auto_2762993 ?auto_2763008 ) ) ( not ( = ?auto_2762994 ?auto_2762995 ) ) ( not ( = ?auto_2762994 ?auto_2762996 ) ) ( not ( = ?auto_2762994 ?auto_2762997 ) ) ( not ( = ?auto_2762994 ?auto_2762998 ) ) ( not ( = ?auto_2762994 ?auto_2762999 ) ) ( not ( = ?auto_2762994 ?auto_2763000 ) ) ( not ( = ?auto_2762994 ?auto_2763001 ) ) ( not ( = ?auto_2762994 ?auto_2763002 ) ) ( not ( = ?auto_2762994 ?auto_2763003 ) ) ( not ( = ?auto_2762994 ?auto_2763004 ) ) ( not ( = ?auto_2762994 ?auto_2763005 ) ) ( not ( = ?auto_2762994 ?auto_2763006 ) ) ( not ( = ?auto_2762994 ?auto_2763007 ) ) ( not ( = ?auto_2762994 ?auto_2763008 ) ) ( not ( = ?auto_2762995 ?auto_2762996 ) ) ( not ( = ?auto_2762995 ?auto_2762997 ) ) ( not ( = ?auto_2762995 ?auto_2762998 ) ) ( not ( = ?auto_2762995 ?auto_2762999 ) ) ( not ( = ?auto_2762995 ?auto_2763000 ) ) ( not ( = ?auto_2762995 ?auto_2763001 ) ) ( not ( = ?auto_2762995 ?auto_2763002 ) ) ( not ( = ?auto_2762995 ?auto_2763003 ) ) ( not ( = ?auto_2762995 ?auto_2763004 ) ) ( not ( = ?auto_2762995 ?auto_2763005 ) ) ( not ( = ?auto_2762995 ?auto_2763006 ) ) ( not ( = ?auto_2762995 ?auto_2763007 ) ) ( not ( = ?auto_2762995 ?auto_2763008 ) ) ( not ( = ?auto_2762996 ?auto_2762997 ) ) ( not ( = ?auto_2762996 ?auto_2762998 ) ) ( not ( = ?auto_2762996 ?auto_2762999 ) ) ( not ( = ?auto_2762996 ?auto_2763000 ) ) ( not ( = ?auto_2762996 ?auto_2763001 ) ) ( not ( = ?auto_2762996 ?auto_2763002 ) ) ( not ( = ?auto_2762996 ?auto_2763003 ) ) ( not ( = ?auto_2762996 ?auto_2763004 ) ) ( not ( = ?auto_2762996 ?auto_2763005 ) ) ( not ( = ?auto_2762996 ?auto_2763006 ) ) ( not ( = ?auto_2762996 ?auto_2763007 ) ) ( not ( = ?auto_2762996 ?auto_2763008 ) ) ( not ( = ?auto_2762997 ?auto_2762998 ) ) ( not ( = ?auto_2762997 ?auto_2762999 ) ) ( not ( = ?auto_2762997 ?auto_2763000 ) ) ( not ( = ?auto_2762997 ?auto_2763001 ) ) ( not ( = ?auto_2762997 ?auto_2763002 ) ) ( not ( = ?auto_2762997 ?auto_2763003 ) ) ( not ( = ?auto_2762997 ?auto_2763004 ) ) ( not ( = ?auto_2762997 ?auto_2763005 ) ) ( not ( = ?auto_2762997 ?auto_2763006 ) ) ( not ( = ?auto_2762997 ?auto_2763007 ) ) ( not ( = ?auto_2762997 ?auto_2763008 ) ) ( not ( = ?auto_2762998 ?auto_2762999 ) ) ( not ( = ?auto_2762998 ?auto_2763000 ) ) ( not ( = ?auto_2762998 ?auto_2763001 ) ) ( not ( = ?auto_2762998 ?auto_2763002 ) ) ( not ( = ?auto_2762998 ?auto_2763003 ) ) ( not ( = ?auto_2762998 ?auto_2763004 ) ) ( not ( = ?auto_2762998 ?auto_2763005 ) ) ( not ( = ?auto_2762998 ?auto_2763006 ) ) ( not ( = ?auto_2762998 ?auto_2763007 ) ) ( not ( = ?auto_2762998 ?auto_2763008 ) ) ( not ( = ?auto_2762999 ?auto_2763000 ) ) ( not ( = ?auto_2762999 ?auto_2763001 ) ) ( not ( = ?auto_2762999 ?auto_2763002 ) ) ( not ( = ?auto_2762999 ?auto_2763003 ) ) ( not ( = ?auto_2762999 ?auto_2763004 ) ) ( not ( = ?auto_2762999 ?auto_2763005 ) ) ( not ( = ?auto_2762999 ?auto_2763006 ) ) ( not ( = ?auto_2762999 ?auto_2763007 ) ) ( not ( = ?auto_2762999 ?auto_2763008 ) ) ( not ( = ?auto_2763000 ?auto_2763001 ) ) ( not ( = ?auto_2763000 ?auto_2763002 ) ) ( not ( = ?auto_2763000 ?auto_2763003 ) ) ( not ( = ?auto_2763000 ?auto_2763004 ) ) ( not ( = ?auto_2763000 ?auto_2763005 ) ) ( not ( = ?auto_2763000 ?auto_2763006 ) ) ( not ( = ?auto_2763000 ?auto_2763007 ) ) ( not ( = ?auto_2763000 ?auto_2763008 ) ) ( not ( = ?auto_2763001 ?auto_2763002 ) ) ( not ( = ?auto_2763001 ?auto_2763003 ) ) ( not ( = ?auto_2763001 ?auto_2763004 ) ) ( not ( = ?auto_2763001 ?auto_2763005 ) ) ( not ( = ?auto_2763001 ?auto_2763006 ) ) ( not ( = ?auto_2763001 ?auto_2763007 ) ) ( not ( = ?auto_2763001 ?auto_2763008 ) ) ( not ( = ?auto_2763002 ?auto_2763003 ) ) ( not ( = ?auto_2763002 ?auto_2763004 ) ) ( not ( = ?auto_2763002 ?auto_2763005 ) ) ( not ( = ?auto_2763002 ?auto_2763006 ) ) ( not ( = ?auto_2763002 ?auto_2763007 ) ) ( not ( = ?auto_2763002 ?auto_2763008 ) ) ( not ( = ?auto_2763003 ?auto_2763004 ) ) ( not ( = ?auto_2763003 ?auto_2763005 ) ) ( not ( = ?auto_2763003 ?auto_2763006 ) ) ( not ( = ?auto_2763003 ?auto_2763007 ) ) ( not ( = ?auto_2763003 ?auto_2763008 ) ) ( not ( = ?auto_2763004 ?auto_2763005 ) ) ( not ( = ?auto_2763004 ?auto_2763006 ) ) ( not ( = ?auto_2763004 ?auto_2763007 ) ) ( not ( = ?auto_2763004 ?auto_2763008 ) ) ( not ( = ?auto_2763005 ?auto_2763006 ) ) ( not ( = ?auto_2763005 ?auto_2763007 ) ) ( not ( = ?auto_2763005 ?auto_2763008 ) ) ( not ( = ?auto_2763006 ?auto_2763007 ) ) ( not ( = ?auto_2763006 ?auto_2763008 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2763007 ?auto_2763008 )
      ( MAKE-16CRATE-VERIFY ?auto_2762992 ?auto_2762993 ?auto_2762994 ?auto_2762995 ?auto_2762996 ?auto_2762997 ?auto_2762998 ?auto_2762999 ?auto_2763000 ?auto_2763001 ?auto_2763002 ?auto_2763003 ?auto_2763004 ?auto_2763005 ?auto_2763006 ?auto_2763007 ?auto_2763008 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2763191 - SURFACE
      ?auto_2763192 - SURFACE
      ?auto_2763193 - SURFACE
      ?auto_2763194 - SURFACE
      ?auto_2763195 - SURFACE
      ?auto_2763196 - SURFACE
      ?auto_2763197 - SURFACE
      ?auto_2763198 - SURFACE
      ?auto_2763199 - SURFACE
      ?auto_2763200 - SURFACE
      ?auto_2763201 - SURFACE
      ?auto_2763202 - SURFACE
      ?auto_2763203 - SURFACE
      ?auto_2763204 - SURFACE
      ?auto_2763205 - SURFACE
      ?auto_2763206 - SURFACE
      ?auto_2763207 - SURFACE
    )
    :vars
    (
      ?auto_2763209 - HOIST
      ?auto_2763210 - PLACE
      ?auto_2763208 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2763209 ?auto_2763210 ) ( SURFACE-AT ?auto_2763206 ?auto_2763210 ) ( CLEAR ?auto_2763206 ) ( IS-CRATE ?auto_2763207 ) ( not ( = ?auto_2763206 ?auto_2763207 ) ) ( TRUCK-AT ?auto_2763208 ?auto_2763210 ) ( AVAILABLE ?auto_2763209 ) ( IN ?auto_2763207 ?auto_2763208 ) ( ON ?auto_2763206 ?auto_2763205 ) ( not ( = ?auto_2763205 ?auto_2763206 ) ) ( not ( = ?auto_2763205 ?auto_2763207 ) ) ( ON ?auto_2763192 ?auto_2763191 ) ( ON ?auto_2763193 ?auto_2763192 ) ( ON ?auto_2763194 ?auto_2763193 ) ( ON ?auto_2763195 ?auto_2763194 ) ( ON ?auto_2763196 ?auto_2763195 ) ( ON ?auto_2763197 ?auto_2763196 ) ( ON ?auto_2763198 ?auto_2763197 ) ( ON ?auto_2763199 ?auto_2763198 ) ( ON ?auto_2763200 ?auto_2763199 ) ( ON ?auto_2763201 ?auto_2763200 ) ( ON ?auto_2763202 ?auto_2763201 ) ( ON ?auto_2763203 ?auto_2763202 ) ( ON ?auto_2763204 ?auto_2763203 ) ( ON ?auto_2763205 ?auto_2763204 ) ( not ( = ?auto_2763191 ?auto_2763192 ) ) ( not ( = ?auto_2763191 ?auto_2763193 ) ) ( not ( = ?auto_2763191 ?auto_2763194 ) ) ( not ( = ?auto_2763191 ?auto_2763195 ) ) ( not ( = ?auto_2763191 ?auto_2763196 ) ) ( not ( = ?auto_2763191 ?auto_2763197 ) ) ( not ( = ?auto_2763191 ?auto_2763198 ) ) ( not ( = ?auto_2763191 ?auto_2763199 ) ) ( not ( = ?auto_2763191 ?auto_2763200 ) ) ( not ( = ?auto_2763191 ?auto_2763201 ) ) ( not ( = ?auto_2763191 ?auto_2763202 ) ) ( not ( = ?auto_2763191 ?auto_2763203 ) ) ( not ( = ?auto_2763191 ?auto_2763204 ) ) ( not ( = ?auto_2763191 ?auto_2763205 ) ) ( not ( = ?auto_2763191 ?auto_2763206 ) ) ( not ( = ?auto_2763191 ?auto_2763207 ) ) ( not ( = ?auto_2763192 ?auto_2763193 ) ) ( not ( = ?auto_2763192 ?auto_2763194 ) ) ( not ( = ?auto_2763192 ?auto_2763195 ) ) ( not ( = ?auto_2763192 ?auto_2763196 ) ) ( not ( = ?auto_2763192 ?auto_2763197 ) ) ( not ( = ?auto_2763192 ?auto_2763198 ) ) ( not ( = ?auto_2763192 ?auto_2763199 ) ) ( not ( = ?auto_2763192 ?auto_2763200 ) ) ( not ( = ?auto_2763192 ?auto_2763201 ) ) ( not ( = ?auto_2763192 ?auto_2763202 ) ) ( not ( = ?auto_2763192 ?auto_2763203 ) ) ( not ( = ?auto_2763192 ?auto_2763204 ) ) ( not ( = ?auto_2763192 ?auto_2763205 ) ) ( not ( = ?auto_2763192 ?auto_2763206 ) ) ( not ( = ?auto_2763192 ?auto_2763207 ) ) ( not ( = ?auto_2763193 ?auto_2763194 ) ) ( not ( = ?auto_2763193 ?auto_2763195 ) ) ( not ( = ?auto_2763193 ?auto_2763196 ) ) ( not ( = ?auto_2763193 ?auto_2763197 ) ) ( not ( = ?auto_2763193 ?auto_2763198 ) ) ( not ( = ?auto_2763193 ?auto_2763199 ) ) ( not ( = ?auto_2763193 ?auto_2763200 ) ) ( not ( = ?auto_2763193 ?auto_2763201 ) ) ( not ( = ?auto_2763193 ?auto_2763202 ) ) ( not ( = ?auto_2763193 ?auto_2763203 ) ) ( not ( = ?auto_2763193 ?auto_2763204 ) ) ( not ( = ?auto_2763193 ?auto_2763205 ) ) ( not ( = ?auto_2763193 ?auto_2763206 ) ) ( not ( = ?auto_2763193 ?auto_2763207 ) ) ( not ( = ?auto_2763194 ?auto_2763195 ) ) ( not ( = ?auto_2763194 ?auto_2763196 ) ) ( not ( = ?auto_2763194 ?auto_2763197 ) ) ( not ( = ?auto_2763194 ?auto_2763198 ) ) ( not ( = ?auto_2763194 ?auto_2763199 ) ) ( not ( = ?auto_2763194 ?auto_2763200 ) ) ( not ( = ?auto_2763194 ?auto_2763201 ) ) ( not ( = ?auto_2763194 ?auto_2763202 ) ) ( not ( = ?auto_2763194 ?auto_2763203 ) ) ( not ( = ?auto_2763194 ?auto_2763204 ) ) ( not ( = ?auto_2763194 ?auto_2763205 ) ) ( not ( = ?auto_2763194 ?auto_2763206 ) ) ( not ( = ?auto_2763194 ?auto_2763207 ) ) ( not ( = ?auto_2763195 ?auto_2763196 ) ) ( not ( = ?auto_2763195 ?auto_2763197 ) ) ( not ( = ?auto_2763195 ?auto_2763198 ) ) ( not ( = ?auto_2763195 ?auto_2763199 ) ) ( not ( = ?auto_2763195 ?auto_2763200 ) ) ( not ( = ?auto_2763195 ?auto_2763201 ) ) ( not ( = ?auto_2763195 ?auto_2763202 ) ) ( not ( = ?auto_2763195 ?auto_2763203 ) ) ( not ( = ?auto_2763195 ?auto_2763204 ) ) ( not ( = ?auto_2763195 ?auto_2763205 ) ) ( not ( = ?auto_2763195 ?auto_2763206 ) ) ( not ( = ?auto_2763195 ?auto_2763207 ) ) ( not ( = ?auto_2763196 ?auto_2763197 ) ) ( not ( = ?auto_2763196 ?auto_2763198 ) ) ( not ( = ?auto_2763196 ?auto_2763199 ) ) ( not ( = ?auto_2763196 ?auto_2763200 ) ) ( not ( = ?auto_2763196 ?auto_2763201 ) ) ( not ( = ?auto_2763196 ?auto_2763202 ) ) ( not ( = ?auto_2763196 ?auto_2763203 ) ) ( not ( = ?auto_2763196 ?auto_2763204 ) ) ( not ( = ?auto_2763196 ?auto_2763205 ) ) ( not ( = ?auto_2763196 ?auto_2763206 ) ) ( not ( = ?auto_2763196 ?auto_2763207 ) ) ( not ( = ?auto_2763197 ?auto_2763198 ) ) ( not ( = ?auto_2763197 ?auto_2763199 ) ) ( not ( = ?auto_2763197 ?auto_2763200 ) ) ( not ( = ?auto_2763197 ?auto_2763201 ) ) ( not ( = ?auto_2763197 ?auto_2763202 ) ) ( not ( = ?auto_2763197 ?auto_2763203 ) ) ( not ( = ?auto_2763197 ?auto_2763204 ) ) ( not ( = ?auto_2763197 ?auto_2763205 ) ) ( not ( = ?auto_2763197 ?auto_2763206 ) ) ( not ( = ?auto_2763197 ?auto_2763207 ) ) ( not ( = ?auto_2763198 ?auto_2763199 ) ) ( not ( = ?auto_2763198 ?auto_2763200 ) ) ( not ( = ?auto_2763198 ?auto_2763201 ) ) ( not ( = ?auto_2763198 ?auto_2763202 ) ) ( not ( = ?auto_2763198 ?auto_2763203 ) ) ( not ( = ?auto_2763198 ?auto_2763204 ) ) ( not ( = ?auto_2763198 ?auto_2763205 ) ) ( not ( = ?auto_2763198 ?auto_2763206 ) ) ( not ( = ?auto_2763198 ?auto_2763207 ) ) ( not ( = ?auto_2763199 ?auto_2763200 ) ) ( not ( = ?auto_2763199 ?auto_2763201 ) ) ( not ( = ?auto_2763199 ?auto_2763202 ) ) ( not ( = ?auto_2763199 ?auto_2763203 ) ) ( not ( = ?auto_2763199 ?auto_2763204 ) ) ( not ( = ?auto_2763199 ?auto_2763205 ) ) ( not ( = ?auto_2763199 ?auto_2763206 ) ) ( not ( = ?auto_2763199 ?auto_2763207 ) ) ( not ( = ?auto_2763200 ?auto_2763201 ) ) ( not ( = ?auto_2763200 ?auto_2763202 ) ) ( not ( = ?auto_2763200 ?auto_2763203 ) ) ( not ( = ?auto_2763200 ?auto_2763204 ) ) ( not ( = ?auto_2763200 ?auto_2763205 ) ) ( not ( = ?auto_2763200 ?auto_2763206 ) ) ( not ( = ?auto_2763200 ?auto_2763207 ) ) ( not ( = ?auto_2763201 ?auto_2763202 ) ) ( not ( = ?auto_2763201 ?auto_2763203 ) ) ( not ( = ?auto_2763201 ?auto_2763204 ) ) ( not ( = ?auto_2763201 ?auto_2763205 ) ) ( not ( = ?auto_2763201 ?auto_2763206 ) ) ( not ( = ?auto_2763201 ?auto_2763207 ) ) ( not ( = ?auto_2763202 ?auto_2763203 ) ) ( not ( = ?auto_2763202 ?auto_2763204 ) ) ( not ( = ?auto_2763202 ?auto_2763205 ) ) ( not ( = ?auto_2763202 ?auto_2763206 ) ) ( not ( = ?auto_2763202 ?auto_2763207 ) ) ( not ( = ?auto_2763203 ?auto_2763204 ) ) ( not ( = ?auto_2763203 ?auto_2763205 ) ) ( not ( = ?auto_2763203 ?auto_2763206 ) ) ( not ( = ?auto_2763203 ?auto_2763207 ) ) ( not ( = ?auto_2763204 ?auto_2763205 ) ) ( not ( = ?auto_2763204 ?auto_2763206 ) ) ( not ( = ?auto_2763204 ?auto_2763207 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2763205 ?auto_2763206 ?auto_2763207 )
      ( MAKE-16CRATE-VERIFY ?auto_2763191 ?auto_2763192 ?auto_2763193 ?auto_2763194 ?auto_2763195 ?auto_2763196 ?auto_2763197 ?auto_2763198 ?auto_2763199 ?auto_2763200 ?auto_2763201 ?auto_2763202 ?auto_2763203 ?auto_2763204 ?auto_2763205 ?auto_2763206 ?auto_2763207 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2763407 - SURFACE
      ?auto_2763408 - SURFACE
      ?auto_2763409 - SURFACE
      ?auto_2763410 - SURFACE
      ?auto_2763411 - SURFACE
      ?auto_2763412 - SURFACE
      ?auto_2763413 - SURFACE
      ?auto_2763414 - SURFACE
      ?auto_2763415 - SURFACE
      ?auto_2763416 - SURFACE
      ?auto_2763417 - SURFACE
      ?auto_2763418 - SURFACE
      ?auto_2763419 - SURFACE
      ?auto_2763420 - SURFACE
      ?auto_2763421 - SURFACE
      ?auto_2763422 - SURFACE
      ?auto_2763423 - SURFACE
    )
    :vars
    (
      ?auto_2763426 - HOIST
      ?auto_2763427 - PLACE
      ?auto_2763425 - TRUCK
      ?auto_2763424 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2763426 ?auto_2763427 ) ( SURFACE-AT ?auto_2763422 ?auto_2763427 ) ( CLEAR ?auto_2763422 ) ( IS-CRATE ?auto_2763423 ) ( not ( = ?auto_2763422 ?auto_2763423 ) ) ( AVAILABLE ?auto_2763426 ) ( IN ?auto_2763423 ?auto_2763425 ) ( ON ?auto_2763422 ?auto_2763421 ) ( not ( = ?auto_2763421 ?auto_2763422 ) ) ( not ( = ?auto_2763421 ?auto_2763423 ) ) ( TRUCK-AT ?auto_2763425 ?auto_2763424 ) ( not ( = ?auto_2763424 ?auto_2763427 ) ) ( ON ?auto_2763408 ?auto_2763407 ) ( ON ?auto_2763409 ?auto_2763408 ) ( ON ?auto_2763410 ?auto_2763409 ) ( ON ?auto_2763411 ?auto_2763410 ) ( ON ?auto_2763412 ?auto_2763411 ) ( ON ?auto_2763413 ?auto_2763412 ) ( ON ?auto_2763414 ?auto_2763413 ) ( ON ?auto_2763415 ?auto_2763414 ) ( ON ?auto_2763416 ?auto_2763415 ) ( ON ?auto_2763417 ?auto_2763416 ) ( ON ?auto_2763418 ?auto_2763417 ) ( ON ?auto_2763419 ?auto_2763418 ) ( ON ?auto_2763420 ?auto_2763419 ) ( ON ?auto_2763421 ?auto_2763420 ) ( not ( = ?auto_2763407 ?auto_2763408 ) ) ( not ( = ?auto_2763407 ?auto_2763409 ) ) ( not ( = ?auto_2763407 ?auto_2763410 ) ) ( not ( = ?auto_2763407 ?auto_2763411 ) ) ( not ( = ?auto_2763407 ?auto_2763412 ) ) ( not ( = ?auto_2763407 ?auto_2763413 ) ) ( not ( = ?auto_2763407 ?auto_2763414 ) ) ( not ( = ?auto_2763407 ?auto_2763415 ) ) ( not ( = ?auto_2763407 ?auto_2763416 ) ) ( not ( = ?auto_2763407 ?auto_2763417 ) ) ( not ( = ?auto_2763407 ?auto_2763418 ) ) ( not ( = ?auto_2763407 ?auto_2763419 ) ) ( not ( = ?auto_2763407 ?auto_2763420 ) ) ( not ( = ?auto_2763407 ?auto_2763421 ) ) ( not ( = ?auto_2763407 ?auto_2763422 ) ) ( not ( = ?auto_2763407 ?auto_2763423 ) ) ( not ( = ?auto_2763408 ?auto_2763409 ) ) ( not ( = ?auto_2763408 ?auto_2763410 ) ) ( not ( = ?auto_2763408 ?auto_2763411 ) ) ( not ( = ?auto_2763408 ?auto_2763412 ) ) ( not ( = ?auto_2763408 ?auto_2763413 ) ) ( not ( = ?auto_2763408 ?auto_2763414 ) ) ( not ( = ?auto_2763408 ?auto_2763415 ) ) ( not ( = ?auto_2763408 ?auto_2763416 ) ) ( not ( = ?auto_2763408 ?auto_2763417 ) ) ( not ( = ?auto_2763408 ?auto_2763418 ) ) ( not ( = ?auto_2763408 ?auto_2763419 ) ) ( not ( = ?auto_2763408 ?auto_2763420 ) ) ( not ( = ?auto_2763408 ?auto_2763421 ) ) ( not ( = ?auto_2763408 ?auto_2763422 ) ) ( not ( = ?auto_2763408 ?auto_2763423 ) ) ( not ( = ?auto_2763409 ?auto_2763410 ) ) ( not ( = ?auto_2763409 ?auto_2763411 ) ) ( not ( = ?auto_2763409 ?auto_2763412 ) ) ( not ( = ?auto_2763409 ?auto_2763413 ) ) ( not ( = ?auto_2763409 ?auto_2763414 ) ) ( not ( = ?auto_2763409 ?auto_2763415 ) ) ( not ( = ?auto_2763409 ?auto_2763416 ) ) ( not ( = ?auto_2763409 ?auto_2763417 ) ) ( not ( = ?auto_2763409 ?auto_2763418 ) ) ( not ( = ?auto_2763409 ?auto_2763419 ) ) ( not ( = ?auto_2763409 ?auto_2763420 ) ) ( not ( = ?auto_2763409 ?auto_2763421 ) ) ( not ( = ?auto_2763409 ?auto_2763422 ) ) ( not ( = ?auto_2763409 ?auto_2763423 ) ) ( not ( = ?auto_2763410 ?auto_2763411 ) ) ( not ( = ?auto_2763410 ?auto_2763412 ) ) ( not ( = ?auto_2763410 ?auto_2763413 ) ) ( not ( = ?auto_2763410 ?auto_2763414 ) ) ( not ( = ?auto_2763410 ?auto_2763415 ) ) ( not ( = ?auto_2763410 ?auto_2763416 ) ) ( not ( = ?auto_2763410 ?auto_2763417 ) ) ( not ( = ?auto_2763410 ?auto_2763418 ) ) ( not ( = ?auto_2763410 ?auto_2763419 ) ) ( not ( = ?auto_2763410 ?auto_2763420 ) ) ( not ( = ?auto_2763410 ?auto_2763421 ) ) ( not ( = ?auto_2763410 ?auto_2763422 ) ) ( not ( = ?auto_2763410 ?auto_2763423 ) ) ( not ( = ?auto_2763411 ?auto_2763412 ) ) ( not ( = ?auto_2763411 ?auto_2763413 ) ) ( not ( = ?auto_2763411 ?auto_2763414 ) ) ( not ( = ?auto_2763411 ?auto_2763415 ) ) ( not ( = ?auto_2763411 ?auto_2763416 ) ) ( not ( = ?auto_2763411 ?auto_2763417 ) ) ( not ( = ?auto_2763411 ?auto_2763418 ) ) ( not ( = ?auto_2763411 ?auto_2763419 ) ) ( not ( = ?auto_2763411 ?auto_2763420 ) ) ( not ( = ?auto_2763411 ?auto_2763421 ) ) ( not ( = ?auto_2763411 ?auto_2763422 ) ) ( not ( = ?auto_2763411 ?auto_2763423 ) ) ( not ( = ?auto_2763412 ?auto_2763413 ) ) ( not ( = ?auto_2763412 ?auto_2763414 ) ) ( not ( = ?auto_2763412 ?auto_2763415 ) ) ( not ( = ?auto_2763412 ?auto_2763416 ) ) ( not ( = ?auto_2763412 ?auto_2763417 ) ) ( not ( = ?auto_2763412 ?auto_2763418 ) ) ( not ( = ?auto_2763412 ?auto_2763419 ) ) ( not ( = ?auto_2763412 ?auto_2763420 ) ) ( not ( = ?auto_2763412 ?auto_2763421 ) ) ( not ( = ?auto_2763412 ?auto_2763422 ) ) ( not ( = ?auto_2763412 ?auto_2763423 ) ) ( not ( = ?auto_2763413 ?auto_2763414 ) ) ( not ( = ?auto_2763413 ?auto_2763415 ) ) ( not ( = ?auto_2763413 ?auto_2763416 ) ) ( not ( = ?auto_2763413 ?auto_2763417 ) ) ( not ( = ?auto_2763413 ?auto_2763418 ) ) ( not ( = ?auto_2763413 ?auto_2763419 ) ) ( not ( = ?auto_2763413 ?auto_2763420 ) ) ( not ( = ?auto_2763413 ?auto_2763421 ) ) ( not ( = ?auto_2763413 ?auto_2763422 ) ) ( not ( = ?auto_2763413 ?auto_2763423 ) ) ( not ( = ?auto_2763414 ?auto_2763415 ) ) ( not ( = ?auto_2763414 ?auto_2763416 ) ) ( not ( = ?auto_2763414 ?auto_2763417 ) ) ( not ( = ?auto_2763414 ?auto_2763418 ) ) ( not ( = ?auto_2763414 ?auto_2763419 ) ) ( not ( = ?auto_2763414 ?auto_2763420 ) ) ( not ( = ?auto_2763414 ?auto_2763421 ) ) ( not ( = ?auto_2763414 ?auto_2763422 ) ) ( not ( = ?auto_2763414 ?auto_2763423 ) ) ( not ( = ?auto_2763415 ?auto_2763416 ) ) ( not ( = ?auto_2763415 ?auto_2763417 ) ) ( not ( = ?auto_2763415 ?auto_2763418 ) ) ( not ( = ?auto_2763415 ?auto_2763419 ) ) ( not ( = ?auto_2763415 ?auto_2763420 ) ) ( not ( = ?auto_2763415 ?auto_2763421 ) ) ( not ( = ?auto_2763415 ?auto_2763422 ) ) ( not ( = ?auto_2763415 ?auto_2763423 ) ) ( not ( = ?auto_2763416 ?auto_2763417 ) ) ( not ( = ?auto_2763416 ?auto_2763418 ) ) ( not ( = ?auto_2763416 ?auto_2763419 ) ) ( not ( = ?auto_2763416 ?auto_2763420 ) ) ( not ( = ?auto_2763416 ?auto_2763421 ) ) ( not ( = ?auto_2763416 ?auto_2763422 ) ) ( not ( = ?auto_2763416 ?auto_2763423 ) ) ( not ( = ?auto_2763417 ?auto_2763418 ) ) ( not ( = ?auto_2763417 ?auto_2763419 ) ) ( not ( = ?auto_2763417 ?auto_2763420 ) ) ( not ( = ?auto_2763417 ?auto_2763421 ) ) ( not ( = ?auto_2763417 ?auto_2763422 ) ) ( not ( = ?auto_2763417 ?auto_2763423 ) ) ( not ( = ?auto_2763418 ?auto_2763419 ) ) ( not ( = ?auto_2763418 ?auto_2763420 ) ) ( not ( = ?auto_2763418 ?auto_2763421 ) ) ( not ( = ?auto_2763418 ?auto_2763422 ) ) ( not ( = ?auto_2763418 ?auto_2763423 ) ) ( not ( = ?auto_2763419 ?auto_2763420 ) ) ( not ( = ?auto_2763419 ?auto_2763421 ) ) ( not ( = ?auto_2763419 ?auto_2763422 ) ) ( not ( = ?auto_2763419 ?auto_2763423 ) ) ( not ( = ?auto_2763420 ?auto_2763421 ) ) ( not ( = ?auto_2763420 ?auto_2763422 ) ) ( not ( = ?auto_2763420 ?auto_2763423 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2763421 ?auto_2763422 ?auto_2763423 )
      ( MAKE-16CRATE-VERIFY ?auto_2763407 ?auto_2763408 ?auto_2763409 ?auto_2763410 ?auto_2763411 ?auto_2763412 ?auto_2763413 ?auto_2763414 ?auto_2763415 ?auto_2763416 ?auto_2763417 ?auto_2763418 ?auto_2763419 ?auto_2763420 ?auto_2763421 ?auto_2763422 ?auto_2763423 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2763639 - SURFACE
      ?auto_2763640 - SURFACE
      ?auto_2763641 - SURFACE
      ?auto_2763642 - SURFACE
      ?auto_2763643 - SURFACE
      ?auto_2763644 - SURFACE
      ?auto_2763645 - SURFACE
      ?auto_2763646 - SURFACE
      ?auto_2763647 - SURFACE
      ?auto_2763648 - SURFACE
      ?auto_2763649 - SURFACE
      ?auto_2763650 - SURFACE
      ?auto_2763651 - SURFACE
      ?auto_2763652 - SURFACE
      ?auto_2763653 - SURFACE
      ?auto_2763654 - SURFACE
      ?auto_2763655 - SURFACE
    )
    :vars
    (
      ?auto_2763658 - HOIST
      ?auto_2763657 - PLACE
      ?auto_2763656 - TRUCK
      ?auto_2763660 - PLACE
      ?auto_2763659 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2763658 ?auto_2763657 ) ( SURFACE-AT ?auto_2763654 ?auto_2763657 ) ( CLEAR ?auto_2763654 ) ( IS-CRATE ?auto_2763655 ) ( not ( = ?auto_2763654 ?auto_2763655 ) ) ( AVAILABLE ?auto_2763658 ) ( ON ?auto_2763654 ?auto_2763653 ) ( not ( = ?auto_2763653 ?auto_2763654 ) ) ( not ( = ?auto_2763653 ?auto_2763655 ) ) ( TRUCK-AT ?auto_2763656 ?auto_2763660 ) ( not ( = ?auto_2763660 ?auto_2763657 ) ) ( HOIST-AT ?auto_2763659 ?auto_2763660 ) ( LIFTING ?auto_2763659 ?auto_2763655 ) ( not ( = ?auto_2763658 ?auto_2763659 ) ) ( ON ?auto_2763640 ?auto_2763639 ) ( ON ?auto_2763641 ?auto_2763640 ) ( ON ?auto_2763642 ?auto_2763641 ) ( ON ?auto_2763643 ?auto_2763642 ) ( ON ?auto_2763644 ?auto_2763643 ) ( ON ?auto_2763645 ?auto_2763644 ) ( ON ?auto_2763646 ?auto_2763645 ) ( ON ?auto_2763647 ?auto_2763646 ) ( ON ?auto_2763648 ?auto_2763647 ) ( ON ?auto_2763649 ?auto_2763648 ) ( ON ?auto_2763650 ?auto_2763649 ) ( ON ?auto_2763651 ?auto_2763650 ) ( ON ?auto_2763652 ?auto_2763651 ) ( ON ?auto_2763653 ?auto_2763652 ) ( not ( = ?auto_2763639 ?auto_2763640 ) ) ( not ( = ?auto_2763639 ?auto_2763641 ) ) ( not ( = ?auto_2763639 ?auto_2763642 ) ) ( not ( = ?auto_2763639 ?auto_2763643 ) ) ( not ( = ?auto_2763639 ?auto_2763644 ) ) ( not ( = ?auto_2763639 ?auto_2763645 ) ) ( not ( = ?auto_2763639 ?auto_2763646 ) ) ( not ( = ?auto_2763639 ?auto_2763647 ) ) ( not ( = ?auto_2763639 ?auto_2763648 ) ) ( not ( = ?auto_2763639 ?auto_2763649 ) ) ( not ( = ?auto_2763639 ?auto_2763650 ) ) ( not ( = ?auto_2763639 ?auto_2763651 ) ) ( not ( = ?auto_2763639 ?auto_2763652 ) ) ( not ( = ?auto_2763639 ?auto_2763653 ) ) ( not ( = ?auto_2763639 ?auto_2763654 ) ) ( not ( = ?auto_2763639 ?auto_2763655 ) ) ( not ( = ?auto_2763640 ?auto_2763641 ) ) ( not ( = ?auto_2763640 ?auto_2763642 ) ) ( not ( = ?auto_2763640 ?auto_2763643 ) ) ( not ( = ?auto_2763640 ?auto_2763644 ) ) ( not ( = ?auto_2763640 ?auto_2763645 ) ) ( not ( = ?auto_2763640 ?auto_2763646 ) ) ( not ( = ?auto_2763640 ?auto_2763647 ) ) ( not ( = ?auto_2763640 ?auto_2763648 ) ) ( not ( = ?auto_2763640 ?auto_2763649 ) ) ( not ( = ?auto_2763640 ?auto_2763650 ) ) ( not ( = ?auto_2763640 ?auto_2763651 ) ) ( not ( = ?auto_2763640 ?auto_2763652 ) ) ( not ( = ?auto_2763640 ?auto_2763653 ) ) ( not ( = ?auto_2763640 ?auto_2763654 ) ) ( not ( = ?auto_2763640 ?auto_2763655 ) ) ( not ( = ?auto_2763641 ?auto_2763642 ) ) ( not ( = ?auto_2763641 ?auto_2763643 ) ) ( not ( = ?auto_2763641 ?auto_2763644 ) ) ( not ( = ?auto_2763641 ?auto_2763645 ) ) ( not ( = ?auto_2763641 ?auto_2763646 ) ) ( not ( = ?auto_2763641 ?auto_2763647 ) ) ( not ( = ?auto_2763641 ?auto_2763648 ) ) ( not ( = ?auto_2763641 ?auto_2763649 ) ) ( not ( = ?auto_2763641 ?auto_2763650 ) ) ( not ( = ?auto_2763641 ?auto_2763651 ) ) ( not ( = ?auto_2763641 ?auto_2763652 ) ) ( not ( = ?auto_2763641 ?auto_2763653 ) ) ( not ( = ?auto_2763641 ?auto_2763654 ) ) ( not ( = ?auto_2763641 ?auto_2763655 ) ) ( not ( = ?auto_2763642 ?auto_2763643 ) ) ( not ( = ?auto_2763642 ?auto_2763644 ) ) ( not ( = ?auto_2763642 ?auto_2763645 ) ) ( not ( = ?auto_2763642 ?auto_2763646 ) ) ( not ( = ?auto_2763642 ?auto_2763647 ) ) ( not ( = ?auto_2763642 ?auto_2763648 ) ) ( not ( = ?auto_2763642 ?auto_2763649 ) ) ( not ( = ?auto_2763642 ?auto_2763650 ) ) ( not ( = ?auto_2763642 ?auto_2763651 ) ) ( not ( = ?auto_2763642 ?auto_2763652 ) ) ( not ( = ?auto_2763642 ?auto_2763653 ) ) ( not ( = ?auto_2763642 ?auto_2763654 ) ) ( not ( = ?auto_2763642 ?auto_2763655 ) ) ( not ( = ?auto_2763643 ?auto_2763644 ) ) ( not ( = ?auto_2763643 ?auto_2763645 ) ) ( not ( = ?auto_2763643 ?auto_2763646 ) ) ( not ( = ?auto_2763643 ?auto_2763647 ) ) ( not ( = ?auto_2763643 ?auto_2763648 ) ) ( not ( = ?auto_2763643 ?auto_2763649 ) ) ( not ( = ?auto_2763643 ?auto_2763650 ) ) ( not ( = ?auto_2763643 ?auto_2763651 ) ) ( not ( = ?auto_2763643 ?auto_2763652 ) ) ( not ( = ?auto_2763643 ?auto_2763653 ) ) ( not ( = ?auto_2763643 ?auto_2763654 ) ) ( not ( = ?auto_2763643 ?auto_2763655 ) ) ( not ( = ?auto_2763644 ?auto_2763645 ) ) ( not ( = ?auto_2763644 ?auto_2763646 ) ) ( not ( = ?auto_2763644 ?auto_2763647 ) ) ( not ( = ?auto_2763644 ?auto_2763648 ) ) ( not ( = ?auto_2763644 ?auto_2763649 ) ) ( not ( = ?auto_2763644 ?auto_2763650 ) ) ( not ( = ?auto_2763644 ?auto_2763651 ) ) ( not ( = ?auto_2763644 ?auto_2763652 ) ) ( not ( = ?auto_2763644 ?auto_2763653 ) ) ( not ( = ?auto_2763644 ?auto_2763654 ) ) ( not ( = ?auto_2763644 ?auto_2763655 ) ) ( not ( = ?auto_2763645 ?auto_2763646 ) ) ( not ( = ?auto_2763645 ?auto_2763647 ) ) ( not ( = ?auto_2763645 ?auto_2763648 ) ) ( not ( = ?auto_2763645 ?auto_2763649 ) ) ( not ( = ?auto_2763645 ?auto_2763650 ) ) ( not ( = ?auto_2763645 ?auto_2763651 ) ) ( not ( = ?auto_2763645 ?auto_2763652 ) ) ( not ( = ?auto_2763645 ?auto_2763653 ) ) ( not ( = ?auto_2763645 ?auto_2763654 ) ) ( not ( = ?auto_2763645 ?auto_2763655 ) ) ( not ( = ?auto_2763646 ?auto_2763647 ) ) ( not ( = ?auto_2763646 ?auto_2763648 ) ) ( not ( = ?auto_2763646 ?auto_2763649 ) ) ( not ( = ?auto_2763646 ?auto_2763650 ) ) ( not ( = ?auto_2763646 ?auto_2763651 ) ) ( not ( = ?auto_2763646 ?auto_2763652 ) ) ( not ( = ?auto_2763646 ?auto_2763653 ) ) ( not ( = ?auto_2763646 ?auto_2763654 ) ) ( not ( = ?auto_2763646 ?auto_2763655 ) ) ( not ( = ?auto_2763647 ?auto_2763648 ) ) ( not ( = ?auto_2763647 ?auto_2763649 ) ) ( not ( = ?auto_2763647 ?auto_2763650 ) ) ( not ( = ?auto_2763647 ?auto_2763651 ) ) ( not ( = ?auto_2763647 ?auto_2763652 ) ) ( not ( = ?auto_2763647 ?auto_2763653 ) ) ( not ( = ?auto_2763647 ?auto_2763654 ) ) ( not ( = ?auto_2763647 ?auto_2763655 ) ) ( not ( = ?auto_2763648 ?auto_2763649 ) ) ( not ( = ?auto_2763648 ?auto_2763650 ) ) ( not ( = ?auto_2763648 ?auto_2763651 ) ) ( not ( = ?auto_2763648 ?auto_2763652 ) ) ( not ( = ?auto_2763648 ?auto_2763653 ) ) ( not ( = ?auto_2763648 ?auto_2763654 ) ) ( not ( = ?auto_2763648 ?auto_2763655 ) ) ( not ( = ?auto_2763649 ?auto_2763650 ) ) ( not ( = ?auto_2763649 ?auto_2763651 ) ) ( not ( = ?auto_2763649 ?auto_2763652 ) ) ( not ( = ?auto_2763649 ?auto_2763653 ) ) ( not ( = ?auto_2763649 ?auto_2763654 ) ) ( not ( = ?auto_2763649 ?auto_2763655 ) ) ( not ( = ?auto_2763650 ?auto_2763651 ) ) ( not ( = ?auto_2763650 ?auto_2763652 ) ) ( not ( = ?auto_2763650 ?auto_2763653 ) ) ( not ( = ?auto_2763650 ?auto_2763654 ) ) ( not ( = ?auto_2763650 ?auto_2763655 ) ) ( not ( = ?auto_2763651 ?auto_2763652 ) ) ( not ( = ?auto_2763651 ?auto_2763653 ) ) ( not ( = ?auto_2763651 ?auto_2763654 ) ) ( not ( = ?auto_2763651 ?auto_2763655 ) ) ( not ( = ?auto_2763652 ?auto_2763653 ) ) ( not ( = ?auto_2763652 ?auto_2763654 ) ) ( not ( = ?auto_2763652 ?auto_2763655 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2763653 ?auto_2763654 ?auto_2763655 )
      ( MAKE-16CRATE-VERIFY ?auto_2763639 ?auto_2763640 ?auto_2763641 ?auto_2763642 ?auto_2763643 ?auto_2763644 ?auto_2763645 ?auto_2763646 ?auto_2763647 ?auto_2763648 ?auto_2763649 ?auto_2763650 ?auto_2763651 ?auto_2763652 ?auto_2763653 ?auto_2763654 ?auto_2763655 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2763887 - SURFACE
      ?auto_2763888 - SURFACE
      ?auto_2763889 - SURFACE
      ?auto_2763890 - SURFACE
      ?auto_2763891 - SURFACE
      ?auto_2763892 - SURFACE
      ?auto_2763893 - SURFACE
      ?auto_2763894 - SURFACE
      ?auto_2763895 - SURFACE
      ?auto_2763896 - SURFACE
      ?auto_2763897 - SURFACE
      ?auto_2763898 - SURFACE
      ?auto_2763899 - SURFACE
      ?auto_2763900 - SURFACE
      ?auto_2763901 - SURFACE
      ?auto_2763902 - SURFACE
      ?auto_2763903 - SURFACE
    )
    :vars
    (
      ?auto_2763906 - HOIST
      ?auto_2763904 - PLACE
      ?auto_2763905 - TRUCK
      ?auto_2763907 - PLACE
      ?auto_2763908 - HOIST
      ?auto_2763909 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2763906 ?auto_2763904 ) ( SURFACE-AT ?auto_2763902 ?auto_2763904 ) ( CLEAR ?auto_2763902 ) ( IS-CRATE ?auto_2763903 ) ( not ( = ?auto_2763902 ?auto_2763903 ) ) ( AVAILABLE ?auto_2763906 ) ( ON ?auto_2763902 ?auto_2763901 ) ( not ( = ?auto_2763901 ?auto_2763902 ) ) ( not ( = ?auto_2763901 ?auto_2763903 ) ) ( TRUCK-AT ?auto_2763905 ?auto_2763907 ) ( not ( = ?auto_2763907 ?auto_2763904 ) ) ( HOIST-AT ?auto_2763908 ?auto_2763907 ) ( not ( = ?auto_2763906 ?auto_2763908 ) ) ( AVAILABLE ?auto_2763908 ) ( SURFACE-AT ?auto_2763903 ?auto_2763907 ) ( ON ?auto_2763903 ?auto_2763909 ) ( CLEAR ?auto_2763903 ) ( not ( = ?auto_2763902 ?auto_2763909 ) ) ( not ( = ?auto_2763903 ?auto_2763909 ) ) ( not ( = ?auto_2763901 ?auto_2763909 ) ) ( ON ?auto_2763888 ?auto_2763887 ) ( ON ?auto_2763889 ?auto_2763888 ) ( ON ?auto_2763890 ?auto_2763889 ) ( ON ?auto_2763891 ?auto_2763890 ) ( ON ?auto_2763892 ?auto_2763891 ) ( ON ?auto_2763893 ?auto_2763892 ) ( ON ?auto_2763894 ?auto_2763893 ) ( ON ?auto_2763895 ?auto_2763894 ) ( ON ?auto_2763896 ?auto_2763895 ) ( ON ?auto_2763897 ?auto_2763896 ) ( ON ?auto_2763898 ?auto_2763897 ) ( ON ?auto_2763899 ?auto_2763898 ) ( ON ?auto_2763900 ?auto_2763899 ) ( ON ?auto_2763901 ?auto_2763900 ) ( not ( = ?auto_2763887 ?auto_2763888 ) ) ( not ( = ?auto_2763887 ?auto_2763889 ) ) ( not ( = ?auto_2763887 ?auto_2763890 ) ) ( not ( = ?auto_2763887 ?auto_2763891 ) ) ( not ( = ?auto_2763887 ?auto_2763892 ) ) ( not ( = ?auto_2763887 ?auto_2763893 ) ) ( not ( = ?auto_2763887 ?auto_2763894 ) ) ( not ( = ?auto_2763887 ?auto_2763895 ) ) ( not ( = ?auto_2763887 ?auto_2763896 ) ) ( not ( = ?auto_2763887 ?auto_2763897 ) ) ( not ( = ?auto_2763887 ?auto_2763898 ) ) ( not ( = ?auto_2763887 ?auto_2763899 ) ) ( not ( = ?auto_2763887 ?auto_2763900 ) ) ( not ( = ?auto_2763887 ?auto_2763901 ) ) ( not ( = ?auto_2763887 ?auto_2763902 ) ) ( not ( = ?auto_2763887 ?auto_2763903 ) ) ( not ( = ?auto_2763887 ?auto_2763909 ) ) ( not ( = ?auto_2763888 ?auto_2763889 ) ) ( not ( = ?auto_2763888 ?auto_2763890 ) ) ( not ( = ?auto_2763888 ?auto_2763891 ) ) ( not ( = ?auto_2763888 ?auto_2763892 ) ) ( not ( = ?auto_2763888 ?auto_2763893 ) ) ( not ( = ?auto_2763888 ?auto_2763894 ) ) ( not ( = ?auto_2763888 ?auto_2763895 ) ) ( not ( = ?auto_2763888 ?auto_2763896 ) ) ( not ( = ?auto_2763888 ?auto_2763897 ) ) ( not ( = ?auto_2763888 ?auto_2763898 ) ) ( not ( = ?auto_2763888 ?auto_2763899 ) ) ( not ( = ?auto_2763888 ?auto_2763900 ) ) ( not ( = ?auto_2763888 ?auto_2763901 ) ) ( not ( = ?auto_2763888 ?auto_2763902 ) ) ( not ( = ?auto_2763888 ?auto_2763903 ) ) ( not ( = ?auto_2763888 ?auto_2763909 ) ) ( not ( = ?auto_2763889 ?auto_2763890 ) ) ( not ( = ?auto_2763889 ?auto_2763891 ) ) ( not ( = ?auto_2763889 ?auto_2763892 ) ) ( not ( = ?auto_2763889 ?auto_2763893 ) ) ( not ( = ?auto_2763889 ?auto_2763894 ) ) ( not ( = ?auto_2763889 ?auto_2763895 ) ) ( not ( = ?auto_2763889 ?auto_2763896 ) ) ( not ( = ?auto_2763889 ?auto_2763897 ) ) ( not ( = ?auto_2763889 ?auto_2763898 ) ) ( not ( = ?auto_2763889 ?auto_2763899 ) ) ( not ( = ?auto_2763889 ?auto_2763900 ) ) ( not ( = ?auto_2763889 ?auto_2763901 ) ) ( not ( = ?auto_2763889 ?auto_2763902 ) ) ( not ( = ?auto_2763889 ?auto_2763903 ) ) ( not ( = ?auto_2763889 ?auto_2763909 ) ) ( not ( = ?auto_2763890 ?auto_2763891 ) ) ( not ( = ?auto_2763890 ?auto_2763892 ) ) ( not ( = ?auto_2763890 ?auto_2763893 ) ) ( not ( = ?auto_2763890 ?auto_2763894 ) ) ( not ( = ?auto_2763890 ?auto_2763895 ) ) ( not ( = ?auto_2763890 ?auto_2763896 ) ) ( not ( = ?auto_2763890 ?auto_2763897 ) ) ( not ( = ?auto_2763890 ?auto_2763898 ) ) ( not ( = ?auto_2763890 ?auto_2763899 ) ) ( not ( = ?auto_2763890 ?auto_2763900 ) ) ( not ( = ?auto_2763890 ?auto_2763901 ) ) ( not ( = ?auto_2763890 ?auto_2763902 ) ) ( not ( = ?auto_2763890 ?auto_2763903 ) ) ( not ( = ?auto_2763890 ?auto_2763909 ) ) ( not ( = ?auto_2763891 ?auto_2763892 ) ) ( not ( = ?auto_2763891 ?auto_2763893 ) ) ( not ( = ?auto_2763891 ?auto_2763894 ) ) ( not ( = ?auto_2763891 ?auto_2763895 ) ) ( not ( = ?auto_2763891 ?auto_2763896 ) ) ( not ( = ?auto_2763891 ?auto_2763897 ) ) ( not ( = ?auto_2763891 ?auto_2763898 ) ) ( not ( = ?auto_2763891 ?auto_2763899 ) ) ( not ( = ?auto_2763891 ?auto_2763900 ) ) ( not ( = ?auto_2763891 ?auto_2763901 ) ) ( not ( = ?auto_2763891 ?auto_2763902 ) ) ( not ( = ?auto_2763891 ?auto_2763903 ) ) ( not ( = ?auto_2763891 ?auto_2763909 ) ) ( not ( = ?auto_2763892 ?auto_2763893 ) ) ( not ( = ?auto_2763892 ?auto_2763894 ) ) ( not ( = ?auto_2763892 ?auto_2763895 ) ) ( not ( = ?auto_2763892 ?auto_2763896 ) ) ( not ( = ?auto_2763892 ?auto_2763897 ) ) ( not ( = ?auto_2763892 ?auto_2763898 ) ) ( not ( = ?auto_2763892 ?auto_2763899 ) ) ( not ( = ?auto_2763892 ?auto_2763900 ) ) ( not ( = ?auto_2763892 ?auto_2763901 ) ) ( not ( = ?auto_2763892 ?auto_2763902 ) ) ( not ( = ?auto_2763892 ?auto_2763903 ) ) ( not ( = ?auto_2763892 ?auto_2763909 ) ) ( not ( = ?auto_2763893 ?auto_2763894 ) ) ( not ( = ?auto_2763893 ?auto_2763895 ) ) ( not ( = ?auto_2763893 ?auto_2763896 ) ) ( not ( = ?auto_2763893 ?auto_2763897 ) ) ( not ( = ?auto_2763893 ?auto_2763898 ) ) ( not ( = ?auto_2763893 ?auto_2763899 ) ) ( not ( = ?auto_2763893 ?auto_2763900 ) ) ( not ( = ?auto_2763893 ?auto_2763901 ) ) ( not ( = ?auto_2763893 ?auto_2763902 ) ) ( not ( = ?auto_2763893 ?auto_2763903 ) ) ( not ( = ?auto_2763893 ?auto_2763909 ) ) ( not ( = ?auto_2763894 ?auto_2763895 ) ) ( not ( = ?auto_2763894 ?auto_2763896 ) ) ( not ( = ?auto_2763894 ?auto_2763897 ) ) ( not ( = ?auto_2763894 ?auto_2763898 ) ) ( not ( = ?auto_2763894 ?auto_2763899 ) ) ( not ( = ?auto_2763894 ?auto_2763900 ) ) ( not ( = ?auto_2763894 ?auto_2763901 ) ) ( not ( = ?auto_2763894 ?auto_2763902 ) ) ( not ( = ?auto_2763894 ?auto_2763903 ) ) ( not ( = ?auto_2763894 ?auto_2763909 ) ) ( not ( = ?auto_2763895 ?auto_2763896 ) ) ( not ( = ?auto_2763895 ?auto_2763897 ) ) ( not ( = ?auto_2763895 ?auto_2763898 ) ) ( not ( = ?auto_2763895 ?auto_2763899 ) ) ( not ( = ?auto_2763895 ?auto_2763900 ) ) ( not ( = ?auto_2763895 ?auto_2763901 ) ) ( not ( = ?auto_2763895 ?auto_2763902 ) ) ( not ( = ?auto_2763895 ?auto_2763903 ) ) ( not ( = ?auto_2763895 ?auto_2763909 ) ) ( not ( = ?auto_2763896 ?auto_2763897 ) ) ( not ( = ?auto_2763896 ?auto_2763898 ) ) ( not ( = ?auto_2763896 ?auto_2763899 ) ) ( not ( = ?auto_2763896 ?auto_2763900 ) ) ( not ( = ?auto_2763896 ?auto_2763901 ) ) ( not ( = ?auto_2763896 ?auto_2763902 ) ) ( not ( = ?auto_2763896 ?auto_2763903 ) ) ( not ( = ?auto_2763896 ?auto_2763909 ) ) ( not ( = ?auto_2763897 ?auto_2763898 ) ) ( not ( = ?auto_2763897 ?auto_2763899 ) ) ( not ( = ?auto_2763897 ?auto_2763900 ) ) ( not ( = ?auto_2763897 ?auto_2763901 ) ) ( not ( = ?auto_2763897 ?auto_2763902 ) ) ( not ( = ?auto_2763897 ?auto_2763903 ) ) ( not ( = ?auto_2763897 ?auto_2763909 ) ) ( not ( = ?auto_2763898 ?auto_2763899 ) ) ( not ( = ?auto_2763898 ?auto_2763900 ) ) ( not ( = ?auto_2763898 ?auto_2763901 ) ) ( not ( = ?auto_2763898 ?auto_2763902 ) ) ( not ( = ?auto_2763898 ?auto_2763903 ) ) ( not ( = ?auto_2763898 ?auto_2763909 ) ) ( not ( = ?auto_2763899 ?auto_2763900 ) ) ( not ( = ?auto_2763899 ?auto_2763901 ) ) ( not ( = ?auto_2763899 ?auto_2763902 ) ) ( not ( = ?auto_2763899 ?auto_2763903 ) ) ( not ( = ?auto_2763899 ?auto_2763909 ) ) ( not ( = ?auto_2763900 ?auto_2763901 ) ) ( not ( = ?auto_2763900 ?auto_2763902 ) ) ( not ( = ?auto_2763900 ?auto_2763903 ) ) ( not ( = ?auto_2763900 ?auto_2763909 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2763901 ?auto_2763902 ?auto_2763903 )
      ( MAKE-16CRATE-VERIFY ?auto_2763887 ?auto_2763888 ?auto_2763889 ?auto_2763890 ?auto_2763891 ?auto_2763892 ?auto_2763893 ?auto_2763894 ?auto_2763895 ?auto_2763896 ?auto_2763897 ?auto_2763898 ?auto_2763899 ?auto_2763900 ?auto_2763901 ?auto_2763902 ?auto_2763903 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2764136 - SURFACE
      ?auto_2764137 - SURFACE
      ?auto_2764138 - SURFACE
      ?auto_2764139 - SURFACE
      ?auto_2764140 - SURFACE
      ?auto_2764141 - SURFACE
      ?auto_2764142 - SURFACE
      ?auto_2764143 - SURFACE
      ?auto_2764144 - SURFACE
      ?auto_2764145 - SURFACE
      ?auto_2764146 - SURFACE
      ?auto_2764147 - SURFACE
      ?auto_2764148 - SURFACE
      ?auto_2764149 - SURFACE
      ?auto_2764150 - SURFACE
      ?auto_2764151 - SURFACE
      ?auto_2764152 - SURFACE
    )
    :vars
    (
      ?auto_2764158 - HOIST
      ?auto_2764153 - PLACE
      ?auto_2764156 - PLACE
      ?auto_2764155 - HOIST
      ?auto_2764157 - SURFACE
      ?auto_2764154 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2764158 ?auto_2764153 ) ( SURFACE-AT ?auto_2764151 ?auto_2764153 ) ( CLEAR ?auto_2764151 ) ( IS-CRATE ?auto_2764152 ) ( not ( = ?auto_2764151 ?auto_2764152 ) ) ( AVAILABLE ?auto_2764158 ) ( ON ?auto_2764151 ?auto_2764150 ) ( not ( = ?auto_2764150 ?auto_2764151 ) ) ( not ( = ?auto_2764150 ?auto_2764152 ) ) ( not ( = ?auto_2764156 ?auto_2764153 ) ) ( HOIST-AT ?auto_2764155 ?auto_2764156 ) ( not ( = ?auto_2764158 ?auto_2764155 ) ) ( AVAILABLE ?auto_2764155 ) ( SURFACE-AT ?auto_2764152 ?auto_2764156 ) ( ON ?auto_2764152 ?auto_2764157 ) ( CLEAR ?auto_2764152 ) ( not ( = ?auto_2764151 ?auto_2764157 ) ) ( not ( = ?auto_2764152 ?auto_2764157 ) ) ( not ( = ?auto_2764150 ?auto_2764157 ) ) ( TRUCK-AT ?auto_2764154 ?auto_2764153 ) ( ON ?auto_2764137 ?auto_2764136 ) ( ON ?auto_2764138 ?auto_2764137 ) ( ON ?auto_2764139 ?auto_2764138 ) ( ON ?auto_2764140 ?auto_2764139 ) ( ON ?auto_2764141 ?auto_2764140 ) ( ON ?auto_2764142 ?auto_2764141 ) ( ON ?auto_2764143 ?auto_2764142 ) ( ON ?auto_2764144 ?auto_2764143 ) ( ON ?auto_2764145 ?auto_2764144 ) ( ON ?auto_2764146 ?auto_2764145 ) ( ON ?auto_2764147 ?auto_2764146 ) ( ON ?auto_2764148 ?auto_2764147 ) ( ON ?auto_2764149 ?auto_2764148 ) ( ON ?auto_2764150 ?auto_2764149 ) ( not ( = ?auto_2764136 ?auto_2764137 ) ) ( not ( = ?auto_2764136 ?auto_2764138 ) ) ( not ( = ?auto_2764136 ?auto_2764139 ) ) ( not ( = ?auto_2764136 ?auto_2764140 ) ) ( not ( = ?auto_2764136 ?auto_2764141 ) ) ( not ( = ?auto_2764136 ?auto_2764142 ) ) ( not ( = ?auto_2764136 ?auto_2764143 ) ) ( not ( = ?auto_2764136 ?auto_2764144 ) ) ( not ( = ?auto_2764136 ?auto_2764145 ) ) ( not ( = ?auto_2764136 ?auto_2764146 ) ) ( not ( = ?auto_2764136 ?auto_2764147 ) ) ( not ( = ?auto_2764136 ?auto_2764148 ) ) ( not ( = ?auto_2764136 ?auto_2764149 ) ) ( not ( = ?auto_2764136 ?auto_2764150 ) ) ( not ( = ?auto_2764136 ?auto_2764151 ) ) ( not ( = ?auto_2764136 ?auto_2764152 ) ) ( not ( = ?auto_2764136 ?auto_2764157 ) ) ( not ( = ?auto_2764137 ?auto_2764138 ) ) ( not ( = ?auto_2764137 ?auto_2764139 ) ) ( not ( = ?auto_2764137 ?auto_2764140 ) ) ( not ( = ?auto_2764137 ?auto_2764141 ) ) ( not ( = ?auto_2764137 ?auto_2764142 ) ) ( not ( = ?auto_2764137 ?auto_2764143 ) ) ( not ( = ?auto_2764137 ?auto_2764144 ) ) ( not ( = ?auto_2764137 ?auto_2764145 ) ) ( not ( = ?auto_2764137 ?auto_2764146 ) ) ( not ( = ?auto_2764137 ?auto_2764147 ) ) ( not ( = ?auto_2764137 ?auto_2764148 ) ) ( not ( = ?auto_2764137 ?auto_2764149 ) ) ( not ( = ?auto_2764137 ?auto_2764150 ) ) ( not ( = ?auto_2764137 ?auto_2764151 ) ) ( not ( = ?auto_2764137 ?auto_2764152 ) ) ( not ( = ?auto_2764137 ?auto_2764157 ) ) ( not ( = ?auto_2764138 ?auto_2764139 ) ) ( not ( = ?auto_2764138 ?auto_2764140 ) ) ( not ( = ?auto_2764138 ?auto_2764141 ) ) ( not ( = ?auto_2764138 ?auto_2764142 ) ) ( not ( = ?auto_2764138 ?auto_2764143 ) ) ( not ( = ?auto_2764138 ?auto_2764144 ) ) ( not ( = ?auto_2764138 ?auto_2764145 ) ) ( not ( = ?auto_2764138 ?auto_2764146 ) ) ( not ( = ?auto_2764138 ?auto_2764147 ) ) ( not ( = ?auto_2764138 ?auto_2764148 ) ) ( not ( = ?auto_2764138 ?auto_2764149 ) ) ( not ( = ?auto_2764138 ?auto_2764150 ) ) ( not ( = ?auto_2764138 ?auto_2764151 ) ) ( not ( = ?auto_2764138 ?auto_2764152 ) ) ( not ( = ?auto_2764138 ?auto_2764157 ) ) ( not ( = ?auto_2764139 ?auto_2764140 ) ) ( not ( = ?auto_2764139 ?auto_2764141 ) ) ( not ( = ?auto_2764139 ?auto_2764142 ) ) ( not ( = ?auto_2764139 ?auto_2764143 ) ) ( not ( = ?auto_2764139 ?auto_2764144 ) ) ( not ( = ?auto_2764139 ?auto_2764145 ) ) ( not ( = ?auto_2764139 ?auto_2764146 ) ) ( not ( = ?auto_2764139 ?auto_2764147 ) ) ( not ( = ?auto_2764139 ?auto_2764148 ) ) ( not ( = ?auto_2764139 ?auto_2764149 ) ) ( not ( = ?auto_2764139 ?auto_2764150 ) ) ( not ( = ?auto_2764139 ?auto_2764151 ) ) ( not ( = ?auto_2764139 ?auto_2764152 ) ) ( not ( = ?auto_2764139 ?auto_2764157 ) ) ( not ( = ?auto_2764140 ?auto_2764141 ) ) ( not ( = ?auto_2764140 ?auto_2764142 ) ) ( not ( = ?auto_2764140 ?auto_2764143 ) ) ( not ( = ?auto_2764140 ?auto_2764144 ) ) ( not ( = ?auto_2764140 ?auto_2764145 ) ) ( not ( = ?auto_2764140 ?auto_2764146 ) ) ( not ( = ?auto_2764140 ?auto_2764147 ) ) ( not ( = ?auto_2764140 ?auto_2764148 ) ) ( not ( = ?auto_2764140 ?auto_2764149 ) ) ( not ( = ?auto_2764140 ?auto_2764150 ) ) ( not ( = ?auto_2764140 ?auto_2764151 ) ) ( not ( = ?auto_2764140 ?auto_2764152 ) ) ( not ( = ?auto_2764140 ?auto_2764157 ) ) ( not ( = ?auto_2764141 ?auto_2764142 ) ) ( not ( = ?auto_2764141 ?auto_2764143 ) ) ( not ( = ?auto_2764141 ?auto_2764144 ) ) ( not ( = ?auto_2764141 ?auto_2764145 ) ) ( not ( = ?auto_2764141 ?auto_2764146 ) ) ( not ( = ?auto_2764141 ?auto_2764147 ) ) ( not ( = ?auto_2764141 ?auto_2764148 ) ) ( not ( = ?auto_2764141 ?auto_2764149 ) ) ( not ( = ?auto_2764141 ?auto_2764150 ) ) ( not ( = ?auto_2764141 ?auto_2764151 ) ) ( not ( = ?auto_2764141 ?auto_2764152 ) ) ( not ( = ?auto_2764141 ?auto_2764157 ) ) ( not ( = ?auto_2764142 ?auto_2764143 ) ) ( not ( = ?auto_2764142 ?auto_2764144 ) ) ( not ( = ?auto_2764142 ?auto_2764145 ) ) ( not ( = ?auto_2764142 ?auto_2764146 ) ) ( not ( = ?auto_2764142 ?auto_2764147 ) ) ( not ( = ?auto_2764142 ?auto_2764148 ) ) ( not ( = ?auto_2764142 ?auto_2764149 ) ) ( not ( = ?auto_2764142 ?auto_2764150 ) ) ( not ( = ?auto_2764142 ?auto_2764151 ) ) ( not ( = ?auto_2764142 ?auto_2764152 ) ) ( not ( = ?auto_2764142 ?auto_2764157 ) ) ( not ( = ?auto_2764143 ?auto_2764144 ) ) ( not ( = ?auto_2764143 ?auto_2764145 ) ) ( not ( = ?auto_2764143 ?auto_2764146 ) ) ( not ( = ?auto_2764143 ?auto_2764147 ) ) ( not ( = ?auto_2764143 ?auto_2764148 ) ) ( not ( = ?auto_2764143 ?auto_2764149 ) ) ( not ( = ?auto_2764143 ?auto_2764150 ) ) ( not ( = ?auto_2764143 ?auto_2764151 ) ) ( not ( = ?auto_2764143 ?auto_2764152 ) ) ( not ( = ?auto_2764143 ?auto_2764157 ) ) ( not ( = ?auto_2764144 ?auto_2764145 ) ) ( not ( = ?auto_2764144 ?auto_2764146 ) ) ( not ( = ?auto_2764144 ?auto_2764147 ) ) ( not ( = ?auto_2764144 ?auto_2764148 ) ) ( not ( = ?auto_2764144 ?auto_2764149 ) ) ( not ( = ?auto_2764144 ?auto_2764150 ) ) ( not ( = ?auto_2764144 ?auto_2764151 ) ) ( not ( = ?auto_2764144 ?auto_2764152 ) ) ( not ( = ?auto_2764144 ?auto_2764157 ) ) ( not ( = ?auto_2764145 ?auto_2764146 ) ) ( not ( = ?auto_2764145 ?auto_2764147 ) ) ( not ( = ?auto_2764145 ?auto_2764148 ) ) ( not ( = ?auto_2764145 ?auto_2764149 ) ) ( not ( = ?auto_2764145 ?auto_2764150 ) ) ( not ( = ?auto_2764145 ?auto_2764151 ) ) ( not ( = ?auto_2764145 ?auto_2764152 ) ) ( not ( = ?auto_2764145 ?auto_2764157 ) ) ( not ( = ?auto_2764146 ?auto_2764147 ) ) ( not ( = ?auto_2764146 ?auto_2764148 ) ) ( not ( = ?auto_2764146 ?auto_2764149 ) ) ( not ( = ?auto_2764146 ?auto_2764150 ) ) ( not ( = ?auto_2764146 ?auto_2764151 ) ) ( not ( = ?auto_2764146 ?auto_2764152 ) ) ( not ( = ?auto_2764146 ?auto_2764157 ) ) ( not ( = ?auto_2764147 ?auto_2764148 ) ) ( not ( = ?auto_2764147 ?auto_2764149 ) ) ( not ( = ?auto_2764147 ?auto_2764150 ) ) ( not ( = ?auto_2764147 ?auto_2764151 ) ) ( not ( = ?auto_2764147 ?auto_2764152 ) ) ( not ( = ?auto_2764147 ?auto_2764157 ) ) ( not ( = ?auto_2764148 ?auto_2764149 ) ) ( not ( = ?auto_2764148 ?auto_2764150 ) ) ( not ( = ?auto_2764148 ?auto_2764151 ) ) ( not ( = ?auto_2764148 ?auto_2764152 ) ) ( not ( = ?auto_2764148 ?auto_2764157 ) ) ( not ( = ?auto_2764149 ?auto_2764150 ) ) ( not ( = ?auto_2764149 ?auto_2764151 ) ) ( not ( = ?auto_2764149 ?auto_2764152 ) ) ( not ( = ?auto_2764149 ?auto_2764157 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2764150 ?auto_2764151 ?auto_2764152 )
      ( MAKE-16CRATE-VERIFY ?auto_2764136 ?auto_2764137 ?auto_2764138 ?auto_2764139 ?auto_2764140 ?auto_2764141 ?auto_2764142 ?auto_2764143 ?auto_2764144 ?auto_2764145 ?auto_2764146 ?auto_2764147 ?auto_2764148 ?auto_2764149 ?auto_2764150 ?auto_2764151 ?auto_2764152 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2764385 - SURFACE
      ?auto_2764386 - SURFACE
      ?auto_2764387 - SURFACE
      ?auto_2764388 - SURFACE
      ?auto_2764389 - SURFACE
      ?auto_2764390 - SURFACE
      ?auto_2764391 - SURFACE
      ?auto_2764392 - SURFACE
      ?auto_2764393 - SURFACE
      ?auto_2764394 - SURFACE
      ?auto_2764395 - SURFACE
      ?auto_2764396 - SURFACE
      ?auto_2764397 - SURFACE
      ?auto_2764398 - SURFACE
      ?auto_2764399 - SURFACE
      ?auto_2764400 - SURFACE
      ?auto_2764401 - SURFACE
    )
    :vars
    (
      ?auto_2764407 - HOIST
      ?auto_2764402 - PLACE
      ?auto_2764406 - PLACE
      ?auto_2764404 - HOIST
      ?auto_2764403 - SURFACE
      ?auto_2764405 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2764407 ?auto_2764402 ) ( IS-CRATE ?auto_2764401 ) ( not ( = ?auto_2764400 ?auto_2764401 ) ) ( not ( = ?auto_2764399 ?auto_2764400 ) ) ( not ( = ?auto_2764399 ?auto_2764401 ) ) ( not ( = ?auto_2764406 ?auto_2764402 ) ) ( HOIST-AT ?auto_2764404 ?auto_2764406 ) ( not ( = ?auto_2764407 ?auto_2764404 ) ) ( AVAILABLE ?auto_2764404 ) ( SURFACE-AT ?auto_2764401 ?auto_2764406 ) ( ON ?auto_2764401 ?auto_2764403 ) ( CLEAR ?auto_2764401 ) ( not ( = ?auto_2764400 ?auto_2764403 ) ) ( not ( = ?auto_2764401 ?auto_2764403 ) ) ( not ( = ?auto_2764399 ?auto_2764403 ) ) ( TRUCK-AT ?auto_2764405 ?auto_2764402 ) ( SURFACE-AT ?auto_2764399 ?auto_2764402 ) ( CLEAR ?auto_2764399 ) ( LIFTING ?auto_2764407 ?auto_2764400 ) ( IS-CRATE ?auto_2764400 ) ( ON ?auto_2764386 ?auto_2764385 ) ( ON ?auto_2764387 ?auto_2764386 ) ( ON ?auto_2764388 ?auto_2764387 ) ( ON ?auto_2764389 ?auto_2764388 ) ( ON ?auto_2764390 ?auto_2764389 ) ( ON ?auto_2764391 ?auto_2764390 ) ( ON ?auto_2764392 ?auto_2764391 ) ( ON ?auto_2764393 ?auto_2764392 ) ( ON ?auto_2764394 ?auto_2764393 ) ( ON ?auto_2764395 ?auto_2764394 ) ( ON ?auto_2764396 ?auto_2764395 ) ( ON ?auto_2764397 ?auto_2764396 ) ( ON ?auto_2764398 ?auto_2764397 ) ( ON ?auto_2764399 ?auto_2764398 ) ( not ( = ?auto_2764385 ?auto_2764386 ) ) ( not ( = ?auto_2764385 ?auto_2764387 ) ) ( not ( = ?auto_2764385 ?auto_2764388 ) ) ( not ( = ?auto_2764385 ?auto_2764389 ) ) ( not ( = ?auto_2764385 ?auto_2764390 ) ) ( not ( = ?auto_2764385 ?auto_2764391 ) ) ( not ( = ?auto_2764385 ?auto_2764392 ) ) ( not ( = ?auto_2764385 ?auto_2764393 ) ) ( not ( = ?auto_2764385 ?auto_2764394 ) ) ( not ( = ?auto_2764385 ?auto_2764395 ) ) ( not ( = ?auto_2764385 ?auto_2764396 ) ) ( not ( = ?auto_2764385 ?auto_2764397 ) ) ( not ( = ?auto_2764385 ?auto_2764398 ) ) ( not ( = ?auto_2764385 ?auto_2764399 ) ) ( not ( = ?auto_2764385 ?auto_2764400 ) ) ( not ( = ?auto_2764385 ?auto_2764401 ) ) ( not ( = ?auto_2764385 ?auto_2764403 ) ) ( not ( = ?auto_2764386 ?auto_2764387 ) ) ( not ( = ?auto_2764386 ?auto_2764388 ) ) ( not ( = ?auto_2764386 ?auto_2764389 ) ) ( not ( = ?auto_2764386 ?auto_2764390 ) ) ( not ( = ?auto_2764386 ?auto_2764391 ) ) ( not ( = ?auto_2764386 ?auto_2764392 ) ) ( not ( = ?auto_2764386 ?auto_2764393 ) ) ( not ( = ?auto_2764386 ?auto_2764394 ) ) ( not ( = ?auto_2764386 ?auto_2764395 ) ) ( not ( = ?auto_2764386 ?auto_2764396 ) ) ( not ( = ?auto_2764386 ?auto_2764397 ) ) ( not ( = ?auto_2764386 ?auto_2764398 ) ) ( not ( = ?auto_2764386 ?auto_2764399 ) ) ( not ( = ?auto_2764386 ?auto_2764400 ) ) ( not ( = ?auto_2764386 ?auto_2764401 ) ) ( not ( = ?auto_2764386 ?auto_2764403 ) ) ( not ( = ?auto_2764387 ?auto_2764388 ) ) ( not ( = ?auto_2764387 ?auto_2764389 ) ) ( not ( = ?auto_2764387 ?auto_2764390 ) ) ( not ( = ?auto_2764387 ?auto_2764391 ) ) ( not ( = ?auto_2764387 ?auto_2764392 ) ) ( not ( = ?auto_2764387 ?auto_2764393 ) ) ( not ( = ?auto_2764387 ?auto_2764394 ) ) ( not ( = ?auto_2764387 ?auto_2764395 ) ) ( not ( = ?auto_2764387 ?auto_2764396 ) ) ( not ( = ?auto_2764387 ?auto_2764397 ) ) ( not ( = ?auto_2764387 ?auto_2764398 ) ) ( not ( = ?auto_2764387 ?auto_2764399 ) ) ( not ( = ?auto_2764387 ?auto_2764400 ) ) ( not ( = ?auto_2764387 ?auto_2764401 ) ) ( not ( = ?auto_2764387 ?auto_2764403 ) ) ( not ( = ?auto_2764388 ?auto_2764389 ) ) ( not ( = ?auto_2764388 ?auto_2764390 ) ) ( not ( = ?auto_2764388 ?auto_2764391 ) ) ( not ( = ?auto_2764388 ?auto_2764392 ) ) ( not ( = ?auto_2764388 ?auto_2764393 ) ) ( not ( = ?auto_2764388 ?auto_2764394 ) ) ( not ( = ?auto_2764388 ?auto_2764395 ) ) ( not ( = ?auto_2764388 ?auto_2764396 ) ) ( not ( = ?auto_2764388 ?auto_2764397 ) ) ( not ( = ?auto_2764388 ?auto_2764398 ) ) ( not ( = ?auto_2764388 ?auto_2764399 ) ) ( not ( = ?auto_2764388 ?auto_2764400 ) ) ( not ( = ?auto_2764388 ?auto_2764401 ) ) ( not ( = ?auto_2764388 ?auto_2764403 ) ) ( not ( = ?auto_2764389 ?auto_2764390 ) ) ( not ( = ?auto_2764389 ?auto_2764391 ) ) ( not ( = ?auto_2764389 ?auto_2764392 ) ) ( not ( = ?auto_2764389 ?auto_2764393 ) ) ( not ( = ?auto_2764389 ?auto_2764394 ) ) ( not ( = ?auto_2764389 ?auto_2764395 ) ) ( not ( = ?auto_2764389 ?auto_2764396 ) ) ( not ( = ?auto_2764389 ?auto_2764397 ) ) ( not ( = ?auto_2764389 ?auto_2764398 ) ) ( not ( = ?auto_2764389 ?auto_2764399 ) ) ( not ( = ?auto_2764389 ?auto_2764400 ) ) ( not ( = ?auto_2764389 ?auto_2764401 ) ) ( not ( = ?auto_2764389 ?auto_2764403 ) ) ( not ( = ?auto_2764390 ?auto_2764391 ) ) ( not ( = ?auto_2764390 ?auto_2764392 ) ) ( not ( = ?auto_2764390 ?auto_2764393 ) ) ( not ( = ?auto_2764390 ?auto_2764394 ) ) ( not ( = ?auto_2764390 ?auto_2764395 ) ) ( not ( = ?auto_2764390 ?auto_2764396 ) ) ( not ( = ?auto_2764390 ?auto_2764397 ) ) ( not ( = ?auto_2764390 ?auto_2764398 ) ) ( not ( = ?auto_2764390 ?auto_2764399 ) ) ( not ( = ?auto_2764390 ?auto_2764400 ) ) ( not ( = ?auto_2764390 ?auto_2764401 ) ) ( not ( = ?auto_2764390 ?auto_2764403 ) ) ( not ( = ?auto_2764391 ?auto_2764392 ) ) ( not ( = ?auto_2764391 ?auto_2764393 ) ) ( not ( = ?auto_2764391 ?auto_2764394 ) ) ( not ( = ?auto_2764391 ?auto_2764395 ) ) ( not ( = ?auto_2764391 ?auto_2764396 ) ) ( not ( = ?auto_2764391 ?auto_2764397 ) ) ( not ( = ?auto_2764391 ?auto_2764398 ) ) ( not ( = ?auto_2764391 ?auto_2764399 ) ) ( not ( = ?auto_2764391 ?auto_2764400 ) ) ( not ( = ?auto_2764391 ?auto_2764401 ) ) ( not ( = ?auto_2764391 ?auto_2764403 ) ) ( not ( = ?auto_2764392 ?auto_2764393 ) ) ( not ( = ?auto_2764392 ?auto_2764394 ) ) ( not ( = ?auto_2764392 ?auto_2764395 ) ) ( not ( = ?auto_2764392 ?auto_2764396 ) ) ( not ( = ?auto_2764392 ?auto_2764397 ) ) ( not ( = ?auto_2764392 ?auto_2764398 ) ) ( not ( = ?auto_2764392 ?auto_2764399 ) ) ( not ( = ?auto_2764392 ?auto_2764400 ) ) ( not ( = ?auto_2764392 ?auto_2764401 ) ) ( not ( = ?auto_2764392 ?auto_2764403 ) ) ( not ( = ?auto_2764393 ?auto_2764394 ) ) ( not ( = ?auto_2764393 ?auto_2764395 ) ) ( not ( = ?auto_2764393 ?auto_2764396 ) ) ( not ( = ?auto_2764393 ?auto_2764397 ) ) ( not ( = ?auto_2764393 ?auto_2764398 ) ) ( not ( = ?auto_2764393 ?auto_2764399 ) ) ( not ( = ?auto_2764393 ?auto_2764400 ) ) ( not ( = ?auto_2764393 ?auto_2764401 ) ) ( not ( = ?auto_2764393 ?auto_2764403 ) ) ( not ( = ?auto_2764394 ?auto_2764395 ) ) ( not ( = ?auto_2764394 ?auto_2764396 ) ) ( not ( = ?auto_2764394 ?auto_2764397 ) ) ( not ( = ?auto_2764394 ?auto_2764398 ) ) ( not ( = ?auto_2764394 ?auto_2764399 ) ) ( not ( = ?auto_2764394 ?auto_2764400 ) ) ( not ( = ?auto_2764394 ?auto_2764401 ) ) ( not ( = ?auto_2764394 ?auto_2764403 ) ) ( not ( = ?auto_2764395 ?auto_2764396 ) ) ( not ( = ?auto_2764395 ?auto_2764397 ) ) ( not ( = ?auto_2764395 ?auto_2764398 ) ) ( not ( = ?auto_2764395 ?auto_2764399 ) ) ( not ( = ?auto_2764395 ?auto_2764400 ) ) ( not ( = ?auto_2764395 ?auto_2764401 ) ) ( not ( = ?auto_2764395 ?auto_2764403 ) ) ( not ( = ?auto_2764396 ?auto_2764397 ) ) ( not ( = ?auto_2764396 ?auto_2764398 ) ) ( not ( = ?auto_2764396 ?auto_2764399 ) ) ( not ( = ?auto_2764396 ?auto_2764400 ) ) ( not ( = ?auto_2764396 ?auto_2764401 ) ) ( not ( = ?auto_2764396 ?auto_2764403 ) ) ( not ( = ?auto_2764397 ?auto_2764398 ) ) ( not ( = ?auto_2764397 ?auto_2764399 ) ) ( not ( = ?auto_2764397 ?auto_2764400 ) ) ( not ( = ?auto_2764397 ?auto_2764401 ) ) ( not ( = ?auto_2764397 ?auto_2764403 ) ) ( not ( = ?auto_2764398 ?auto_2764399 ) ) ( not ( = ?auto_2764398 ?auto_2764400 ) ) ( not ( = ?auto_2764398 ?auto_2764401 ) ) ( not ( = ?auto_2764398 ?auto_2764403 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2764399 ?auto_2764400 ?auto_2764401 )
      ( MAKE-16CRATE-VERIFY ?auto_2764385 ?auto_2764386 ?auto_2764387 ?auto_2764388 ?auto_2764389 ?auto_2764390 ?auto_2764391 ?auto_2764392 ?auto_2764393 ?auto_2764394 ?auto_2764395 ?auto_2764396 ?auto_2764397 ?auto_2764398 ?auto_2764399 ?auto_2764400 ?auto_2764401 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2764634 - SURFACE
      ?auto_2764635 - SURFACE
      ?auto_2764636 - SURFACE
      ?auto_2764637 - SURFACE
      ?auto_2764638 - SURFACE
      ?auto_2764639 - SURFACE
      ?auto_2764640 - SURFACE
      ?auto_2764641 - SURFACE
      ?auto_2764642 - SURFACE
      ?auto_2764643 - SURFACE
      ?auto_2764644 - SURFACE
      ?auto_2764645 - SURFACE
      ?auto_2764646 - SURFACE
      ?auto_2764647 - SURFACE
      ?auto_2764648 - SURFACE
      ?auto_2764649 - SURFACE
      ?auto_2764650 - SURFACE
    )
    :vars
    (
      ?auto_2764655 - HOIST
      ?auto_2764651 - PLACE
      ?auto_2764654 - PLACE
      ?auto_2764656 - HOIST
      ?auto_2764652 - SURFACE
      ?auto_2764653 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2764655 ?auto_2764651 ) ( IS-CRATE ?auto_2764650 ) ( not ( = ?auto_2764649 ?auto_2764650 ) ) ( not ( = ?auto_2764648 ?auto_2764649 ) ) ( not ( = ?auto_2764648 ?auto_2764650 ) ) ( not ( = ?auto_2764654 ?auto_2764651 ) ) ( HOIST-AT ?auto_2764656 ?auto_2764654 ) ( not ( = ?auto_2764655 ?auto_2764656 ) ) ( AVAILABLE ?auto_2764656 ) ( SURFACE-AT ?auto_2764650 ?auto_2764654 ) ( ON ?auto_2764650 ?auto_2764652 ) ( CLEAR ?auto_2764650 ) ( not ( = ?auto_2764649 ?auto_2764652 ) ) ( not ( = ?auto_2764650 ?auto_2764652 ) ) ( not ( = ?auto_2764648 ?auto_2764652 ) ) ( TRUCK-AT ?auto_2764653 ?auto_2764651 ) ( SURFACE-AT ?auto_2764648 ?auto_2764651 ) ( CLEAR ?auto_2764648 ) ( IS-CRATE ?auto_2764649 ) ( AVAILABLE ?auto_2764655 ) ( IN ?auto_2764649 ?auto_2764653 ) ( ON ?auto_2764635 ?auto_2764634 ) ( ON ?auto_2764636 ?auto_2764635 ) ( ON ?auto_2764637 ?auto_2764636 ) ( ON ?auto_2764638 ?auto_2764637 ) ( ON ?auto_2764639 ?auto_2764638 ) ( ON ?auto_2764640 ?auto_2764639 ) ( ON ?auto_2764641 ?auto_2764640 ) ( ON ?auto_2764642 ?auto_2764641 ) ( ON ?auto_2764643 ?auto_2764642 ) ( ON ?auto_2764644 ?auto_2764643 ) ( ON ?auto_2764645 ?auto_2764644 ) ( ON ?auto_2764646 ?auto_2764645 ) ( ON ?auto_2764647 ?auto_2764646 ) ( ON ?auto_2764648 ?auto_2764647 ) ( not ( = ?auto_2764634 ?auto_2764635 ) ) ( not ( = ?auto_2764634 ?auto_2764636 ) ) ( not ( = ?auto_2764634 ?auto_2764637 ) ) ( not ( = ?auto_2764634 ?auto_2764638 ) ) ( not ( = ?auto_2764634 ?auto_2764639 ) ) ( not ( = ?auto_2764634 ?auto_2764640 ) ) ( not ( = ?auto_2764634 ?auto_2764641 ) ) ( not ( = ?auto_2764634 ?auto_2764642 ) ) ( not ( = ?auto_2764634 ?auto_2764643 ) ) ( not ( = ?auto_2764634 ?auto_2764644 ) ) ( not ( = ?auto_2764634 ?auto_2764645 ) ) ( not ( = ?auto_2764634 ?auto_2764646 ) ) ( not ( = ?auto_2764634 ?auto_2764647 ) ) ( not ( = ?auto_2764634 ?auto_2764648 ) ) ( not ( = ?auto_2764634 ?auto_2764649 ) ) ( not ( = ?auto_2764634 ?auto_2764650 ) ) ( not ( = ?auto_2764634 ?auto_2764652 ) ) ( not ( = ?auto_2764635 ?auto_2764636 ) ) ( not ( = ?auto_2764635 ?auto_2764637 ) ) ( not ( = ?auto_2764635 ?auto_2764638 ) ) ( not ( = ?auto_2764635 ?auto_2764639 ) ) ( not ( = ?auto_2764635 ?auto_2764640 ) ) ( not ( = ?auto_2764635 ?auto_2764641 ) ) ( not ( = ?auto_2764635 ?auto_2764642 ) ) ( not ( = ?auto_2764635 ?auto_2764643 ) ) ( not ( = ?auto_2764635 ?auto_2764644 ) ) ( not ( = ?auto_2764635 ?auto_2764645 ) ) ( not ( = ?auto_2764635 ?auto_2764646 ) ) ( not ( = ?auto_2764635 ?auto_2764647 ) ) ( not ( = ?auto_2764635 ?auto_2764648 ) ) ( not ( = ?auto_2764635 ?auto_2764649 ) ) ( not ( = ?auto_2764635 ?auto_2764650 ) ) ( not ( = ?auto_2764635 ?auto_2764652 ) ) ( not ( = ?auto_2764636 ?auto_2764637 ) ) ( not ( = ?auto_2764636 ?auto_2764638 ) ) ( not ( = ?auto_2764636 ?auto_2764639 ) ) ( not ( = ?auto_2764636 ?auto_2764640 ) ) ( not ( = ?auto_2764636 ?auto_2764641 ) ) ( not ( = ?auto_2764636 ?auto_2764642 ) ) ( not ( = ?auto_2764636 ?auto_2764643 ) ) ( not ( = ?auto_2764636 ?auto_2764644 ) ) ( not ( = ?auto_2764636 ?auto_2764645 ) ) ( not ( = ?auto_2764636 ?auto_2764646 ) ) ( not ( = ?auto_2764636 ?auto_2764647 ) ) ( not ( = ?auto_2764636 ?auto_2764648 ) ) ( not ( = ?auto_2764636 ?auto_2764649 ) ) ( not ( = ?auto_2764636 ?auto_2764650 ) ) ( not ( = ?auto_2764636 ?auto_2764652 ) ) ( not ( = ?auto_2764637 ?auto_2764638 ) ) ( not ( = ?auto_2764637 ?auto_2764639 ) ) ( not ( = ?auto_2764637 ?auto_2764640 ) ) ( not ( = ?auto_2764637 ?auto_2764641 ) ) ( not ( = ?auto_2764637 ?auto_2764642 ) ) ( not ( = ?auto_2764637 ?auto_2764643 ) ) ( not ( = ?auto_2764637 ?auto_2764644 ) ) ( not ( = ?auto_2764637 ?auto_2764645 ) ) ( not ( = ?auto_2764637 ?auto_2764646 ) ) ( not ( = ?auto_2764637 ?auto_2764647 ) ) ( not ( = ?auto_2764637 ?auto_2764648 ) ) ( not ( = ?auto_2764637 ?auto_2764649 ) ) ( not ( = ?auto_2764637 ?auto_2764650 ) ) ( not ( = ?auto_2764637 ?auto_2764652 ) ) ( not ( = ?auto_2764638 ?auto_2764639 ) ) ( not ( = ?auto_2764638 ?auto_2764640 ) ) ( not ( = ?auto_2764638 ?auto_2764641 ) ) ( not ( = ?auto_2764638 ?auto_2764642 ) ) ( not ( = ?auto_2764638 ?auto_2764643 ) ) ( not ( = ?auto_2764638 ?auto_2764644 ) ) ( not ( = ?auto_2764638 ?auto_2764645 ) ) ( not ( = ?auto_2764638 ?auto_2764646 ) ) ( not ( = ?auto_2764638 ?auto_2764647 ) ) ( not ( = ?auto_2764638 ?auto_2764648 ) ) ( not ( = ?auto_2764638 ?auto_2764649 ) ) ( not ( = ?auto_2764638 ?auto_2764650 ) ) ( not ( = ?auto_2764638 ?auto_2764652 ) ) ( not ( = ?auto_2764639 ?auto_2764640 ) ) ( not ( = ?auto_2764639 ?auto_2764641 ) ) ( not ( = ?auto_2764639 ?auto_2764642 ) ) ( not ( = ?auto_2764639 ?auto_2764643 ) ) ( not ( = ?auto_2764639 ?auto_2764644 ) ) ( not ( = ?auto_2764639 ?auto_2764645 ) ) ( not ( = ?auto_2764639 ?auto_2764646 ) ) ( not ( = ?auto_2764639 ?auto_2764647 ) ) ( not ( = ?auto_2764639 ?auto_2764648 ) ) ( not ( = ?auto_2764639 ?auto_2764649 ) ) ( not ( = ?auto_2764639 ?auto_2764650 ) ) ( not ( = ?auto_2764639 ?auto_2764652 ) ) ( not ( = ?auto_2764640 ?auto_2764641 ) ) ( not ( = ?auto_2764640 ?auto_2764642 ) ) ( not ( = ?auto_2764640 ?auto_2764643 ) ) ( not ( = ?auto_2764640 ?auto_2764644 ) ) ( not ( = ?auto_2764640 ?auto_2764645 ) ) ( not ( = ?auto_2764640 ?auto_2764646 ) ) ( not ( = ?auto_2764640 ?auto_2764647 ) ) ( not ( = ?auto_2764640 ?auto_2764648 ) ) ( not ( = ?auto_2764640 ?auto_2764649 ) ) ( not ( = ?auto_2764640 ?auto_2764650 ) ) ( not ( = ?auto_2764640 ?auto_2764652 ) ) ( not ( = ?auto_2764641 ?auto_2764642 ) ) ( not ( = ?auto_2764641 ?auto_2764643 ) ) ( not ( = ?auto_2764641 ?auto_2764644 ) ) ( not ( = ?auto_2764641 ?auto_2764645 ) ) ( not ( = ?auto_2764641 ?auto_2764646 ) ) ( not ( = ?auto_2764641 ?auto_2764647 ) ) ( not ( = ?auto_2764641 ?auto_2764648 ) ) ( not ( = ?auto_2764641 ?auto_2764649 ) ) ( not ( = ?auto_2764641 ?auto_2764650 ) ) ( not ( = ?auto_2764641 ?auto_2764652 ) ) ( not ( = ?auto_2764642 ?auto_2764643 ) ) ( not ( = ?auto_2764642 ?auto_2764644 ) ) ( not ( = ?auto_2764642 ?auto_2764645 ) ) ( not ( = ?auto_2764642 ?auto_2764646 ) ) ( not ( = ?auto_2764642 ?auto_2764647 ) ) ( not ( = ?auto_2764642 ?auto_2764648 ) ) ( not ( = ?auto_2764642 ?auto_2764649 ) ) ( not ( = ?auto_2764642 ?auto_2764650 ) ) ( not ( = ?auto_2764642 ?auto_2764652 ) ) ( not ( = ?auto_2764643 ?auto_2764644 ) ) ( not ( = ?auto_2764643 ?auto_2764645 ) ) ( not ( = ?auto_2764643 ?auto_2764646 ) ) ( not ( = ?auto_2764643 ?auto_2764647 ) ) ( not ( = ?auto_2764643 ?auto_2764648 ) ) ( not ( = ?auto_2764643 ?auto_2764649 ) ) ( not ( = ?auto_2764643 ?auto_2764650 ) ) ( not ( = ?auto_2764643 ?auto_2764652 ) ) ( not ( = ?auto_2764644 ?auto_2764645 ) ) ( not ( = ?auto_2764644 ?auto_2764646 ) ) ( not ( = ?auto_2764644 ?auto_2764647 ) ) ( not ( = ?auto_2764644 ?auto_2764648 ) ) ( not ( = ?auto_2764644 ?auto_2764649 ) ) ( not ( = ?auto_2764644 ?auto_2764650 ) ) ( not ( = ?auto_2764644 ?auto_2764652 ) ) ( not ( = ?auto_2764645 ?auto_2764646 ) ) ( not ( = ?auto_2764645 ?auto_2764647 ) ) ( not ( = ?auto_2764645 ?auto_2764648 ) ) ( not ( = ?auto_2764645 ?auto_2764649 ) ) ( not ( = ?auto_2764645 ?auto_2764650 ) ) ( not ( = ?auto_2764645 ?auto_2764652 ) ) ( not ( = ?auto_2764646 ?auto_2764647 ) ) ( not ( = ?auto_2764646 ?auto_2764648 ) ) ( not ( = ?auto_2764646 ?auto_2764649 ) ) ( not ( = ?auto_2764646 ?auto_2764650 ) ) ( not ( = ?auto_2764646 ?auto_2764652 ) ) ( not ( = ?auto_2764647 ?auto_2764648 ) ) ( not ( = ?auto_2764647 ?auto_2764649 ) ) ( not ( = ?auto_2764647 ?auto_2764650 ) ) ( not ( = ?auto_2764647 ?auto_2764652 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2764648 ?auto_2764649 ?auto_2764650 )
      ( MAKE-16CRATE-VERIFY ?auto_2764634 ?auto_2764635 ?auto_2764636 ?auto_2764637 ?auto_2764638 ?auto_2764639 ?auto_2764640 ?auto_2764641 ?auto_2764642 ?auto_2764643 ?auto_2764644 ?auto_2764645 ?auto_2764646 ?auto_2764647 ?auto_2764648 ?auto_2764649 ?auto_2764650 ) )
  )

)

