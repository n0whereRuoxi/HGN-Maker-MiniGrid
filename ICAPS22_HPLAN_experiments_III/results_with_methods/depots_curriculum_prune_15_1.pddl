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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20668 - SURFACE
      ?auto_20669 - SURFACE
    )
    :vars
    (
      ?auto_20670 - HOIST
      ?auto_20671 - PLACE
      ?auto_20673 - PLACE
      ?auto_20674 - HOIST
      ?auto_20675 - SURFACE
      ?auto_20672 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20670 ?auto_20671 ) ( SURFACE-AT ?auto_20668 ?auto_20671 ) ( CLEAR ?auto_20668 ) ( IS-CRATE ?auto_20669 ) ( AVAILABLE ?auto_20670 ) ( not ( = ?auto_20673 ?auto_20671 ) ) ( HOIST-AT ?auto_20674 ?auto_20673 ) ( AVAILABLE ?auto_20674 ) ( SURFACE-AT ?auto_20669 ?auto_20673 ) ( ON ?auto_20669 ?auto_20675 ) ( CLEAR ?auto_20669 ) ( TRUCK-AT ?auto_20672 ?auto_20671 ) ( not ( = ?auto_20668 ?auto_20669 ) ) ( not ( = ?auto_20668 ?auto_20675 ) ) ( not ( = ?auto_20669 ?auto_20675 ) ) ( not ( = ?auto_20670 ?auto_20674 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20672 ?auto_20671 ?auto_20673 )
      ( !LIFT ?auto_20674 ?auto_20669 ?auto_20675 ?auto_20673 )
      ( !LOAD ?auto_20674 ?auto_20669 ?auto_20672 ?auto_20673 )
      ( !DRIVE ?auto_20672 ?auto_20673 ?auto_20671 )
      ( !UNLOAD ?auto_20670 ?auto_20669 ?auto_20672 ?auto_20671 )
      ( !DROP ?auto_20670 ?auto_20669 ?auto_20668 ?auto_20671 )
      ( MAKE-1CRATE-VERIFY ?auto_20668 ?auto_20669 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20689 - SURFACE
      ?auto_20690 - SURFACE
      ?auto_20691 - SURFACE
    )
    :vars
    (
      ?auto_20696 - HOIST
      ?auto_20695 - PLACE
      ?auto_20694 - PLACE
      ?auto_20693 - HOIST
      ?auto_20692 - SURFACE
      ?auto_20699 - PLACE
      ?auto_20698 - HOIST
      ?auto_20700 - SURFACE
      ?auto_20697 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20696 ?auto_20695 ) ( IS-CRATE ?auto_20691 ) ( not ( = ?auto_20694 ?auto_20695 ) ) ( HOIST-AT ?auto_20693 ?auto_20694 ) ( AVAILABLE ?auto_20693 ) ( SURFACE-AT ?auto_20691 ?auto_20694 ) ( ON ?auto_20691 ?auto_20692 ) ( CLEAR ?auto_20691 ) ( not ( = ?auto_20690 ?auto_20691 ) ) ( not ( = ?auto_20690 ?auto_20692 ) ) ( not ( = ?auto_20691 ?auto_20692 ) ) ( not ( = ?auto_20696 ?auto_20693 ) ) ( SURFACE-AT ?auto_20689 ?auto_20695 ) ( CLEAR ?auto_20689 ) ( IS-CRATE ?auto_20690 ) ( AVAILABLE ?auto_20696 ) ( not ( = ?auto_20699 ?auto_20695 ) ) ( HOIST-AT ?auto_20698 ?auto_20699 ) ( AVAILABLE ?auto_20698 ) ( SURFACE-AT ?auto_20690 ?auto_20699 ) ( ON ?auto_20690 ?auto_20700 ) ( CLEAR ?auto_20690 ) ( TRUCK-AT ?auto_20697 ?auto_20695 ) ( not ( = ?auto_20689 ?auto_20690 ) ) ( not ( = ?auto_20689 ?auto_20700 ) ) ( not ( = ?auto_20690 ?auto_20700 ) ) ( not ( = ?auto_20696 ?auto_20698 ) ) ( not ( = ?auto_20689 ?auto_20691 ) ) ( not ( = ?auto_20689 ?auto_20692 ) ) ( not ( = ?auto_20691 ?auto_20700 ) ) ( not ( = ?auto_20694 ?auto_20699 ) ) ( not ( = ?auto_20693 ?auto_20698 ) ) ( not ( = ?auto_20692 ?auto_20700 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20689 ?auto_20690 )
      ( MAKE-1CRATE ?auto_20690 ?auto_20691 )
      ( MAKE-2CRATE-VERIFY ?auto_20689 ?auto_20690 ?auto_20691 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20715 - SURFACE
      ?auto_20716 - SURFACE
      ?auto_20717 - SURFACE
      ?auto_20718 - SURFACE
    )
    :vars
    (
      ?auto_20722 - HOIST
      ?auto_20721 - PLACE
      ?auto_20720 - PLACE
      ?auto_20724 - HOIST
      ?auto_20723 - SURFACE
      ?auto_20728 - PLACE
      ?auto_20727 - HOIST
      ?auto_20729 - SURFACE
      ?auto_20726 - PLACE
      ?auto_20730 - HOIST
      ?auto_20725 - SURFACE
      ?auto_20719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20722 ?auto_20721 ) ( IS-CRATE ?auto_20718 ) ( not ( = ?auto_20720 ?auto_20721 ) ) ( HOIST-AT ?auto_20724 ?auto_20720 ) ( AVAILABLE ?auto_20724 ) ( SURFACE-AT ?auto_20718 ?auto_20720 ) ( ON ?auto_20718 ?auto_20723 ) ( CLEAR ?auto_20718 ) ( not ( = ?auto_20717 ?auto_20718 ) ) ( not ( = ?auto_20717 ?auto_20723 ) ) ( not ( = ?auto_20718 ?auto_20723 ) ) ( not ( = ?auto_20722 ?auto_20724 ) ) ( IS-CRATE ?auto_20717 ) ( not ( = ?auto_20728 ?auto_20721 ) ) ( HOIST-AT ?auto_20727 ?auto_20728 ) ( AVAILABLE ?auto_20727 ) ( SURFACE-AT ?auto_20717 ?auto_20728 ) ( ON ?auto_20717 ?auto_20729 ) ( CLEAR ?auto_20717 ) ( not ( = ?auto_20716 ?auto_20717 ) ) ( not ( = ?auto_20716 ?auto_20729 ) ) ( not ( = ?auto_20717 ?auto_20729 ) ) ( not ( = ?auto_20722 ?auto_20727 ) ) ( SURFACE-AT ?auto_20715 ?auto_20721 ) ( CLEAR ?auto_20715 ) ( IS-CRATE ?auto_20716 ) ( AVAILABLE ?auto_20722 ) ( not ( = ?auto_20726 ?auto_20721 ) ) ( HOIST-AT ?auto_20730 ?auto_20726 ) ( AVAILABLE ?auto_20730 ) ( SURFACE-AT ?auto_20716 ?auto_20726 ) ( ON ?auto_20716 ?auto_20725 ) ( CLEAR ?auto_20716 ) ( TRUCK-AT ?auto_20719 ?auto_20721 ) ( not ( = ?auto_20715 ?auto_20716 ) ) ( not ( = ?auto_20715 ?auto_20725 ) ) ( not ( = ?auto_20716 ?auto_20725 ) ) ( not ( = ?auto_20722 ?auto_20730 ) ) ( not ( = ?auto_20715 ?auto_20717 ) ) ( not ( = ?auto_20715 ?auto_20729 ) ) ( not ( = ?auto_20717 ?auto_20725 ) ) ( not ( = ?auto_20728 ?auto_20726 ) ) ( not ( = ?auto_20727 ?auto_20730 ) ) ( not ( = ?auto_20729 ?auto_20725 ) ) ( not ( = ?auto_20715 ?auto_20718 ) ) ( not ( = ?auto_20715 ?auto_20723 ) ) ( not ( = ?auto_20716 ?auto_20718 ) ) ( not ( = ?auto_20716 ?auto_20723 ) ) ( not ( = ?auto_20718 ?auto_20729 ) ) ( not ( = ?auto_20718 ?auto_20725 ) ) ( not ( = ?auto_20720 ?auto_20728 ) ) ( not ( = ?auto_20720 ?auto_20726 ) ) ( not ( = ?auto_20724 ?auto_20727 ) ) ( not ( = ?auto_20724 ?auto_20730 ) ) ( not ( = ?auto_20723 ?auto_20729 ) ) ( not ( = ?auto_20723 ?auto_20725 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20715 ?auto_20716 ?auto_20717 )
      ( MAKE-1CRATE ?auto_20717 ?auto_20718 )
      ( MAKE-3CRATE-VERIFY ?auto_20715 ?auto_20716 ?auto_20717 ?auto_20718 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_20746 - SURFACE
      ?auto_20747 - SURFACE
      ?auto_20748 - SURFACE
      ?auto_20749 - SURFACE
      ?auto_20750 - SURFACE
    )
    :vars
    (
      ?auto_20753 - HOIST
      ?auto_20756 - PLACE
      ?auto_20754 - PLACE
      ?auto_20752 - HOIST
      ?auto_20751 - SURFACE
      ?auto_20758 - PLACE
      ?auto_20760 - HOIST
      ?auto_20759 - SURFACE
      ?auto_20761 - PLACE
      ?auto_20762 - HOIST
      ?auto_20763 - SURFACE
      ?auto_20765 - PLACE
      ?auto_20757 - HOIST
      ?auto_20764 - SURFACE
      ?auto_20755 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20753 ?auto_20756 ) ( IS-CRATE ?auto_20750 ) ( not ( = ?auto_20754 ?auto_20756 ) ) ( HOIST-AT ?auto_20752 ?auto_20754 ) ( AVAILABLE ?auto_20752 ) ( SURFACE-AT ?auto_20750 ?auto_20754 ) ( ON ?auto_20750 ?auto_20751 ) ( CLEAR ?auto_20750 ) ( not ( = ?auto_20749 ?auto_20750 ) ) ( not ( = ?auto_20749 ?auto_20751 ) ) ( not ( = ?auto_20750 ?auto_20751 ) ) ( not ( = ?auto_20753 ?auto_20752 ) ) ( IS-CRATE ?auto_20749 ) ( not ( = ?auto_20758 ?auto_20756 ) ) ( HOIST-AT ?auto_20760 ?auto_20758 ) ( AVAILABLE ?auto_20760 ) ( SURFACE-AT ?auto_20749 ?auto_20758 ) ( ON ?auto_20749 ?auto_20759 ) ( CLEAR ?auto_20749 ) ( not ( = ?auto_20748 ?auto_20749 ) ) ( not ( = ?auto_20748 ?auto_20759 ) ) ( not ( = ?auto_20749 ?auto_20759 ) ) ( not ( = ?auto_20753 ?auto_20760 ) ) ( IS-CRATE ?auto_20748 ) ( not ( = ?auto_20761 ?auto_20756 ) ) ( HOIST-AT ?auto_20762 ?auto_20761 ) ( AVAILABLE ?auto_20762 ) ( SURFACE-AT ?auto_20748 ?auto_20761 ) ( ON ?auto_20748 ?auto_20763 ) ( CLEAR ?auto_20748 ) ( not ( = ?auto_20747 ?auto_20748 ) ) ( not ( = ?auto_20747 ?auto_20763 ) ) ( not ( = ?auto_20748 ?auto_20763 ) ) ( not ( = ?auto_20753 ?auto_20762 ) ) ( SURFACE-AT ?auto_20746 ?auto_20756 ) ( CLEAR ?auto_20746 ) ( IS-CRATE ?auto_20747 ) ( AVAILABLE ?auto_20753 ) ( not ( = ?auto_20765 ?auto_20756 ) ) ( HOIST-AT ?auto_20757 ?auto_20765 ) ( AVAILABLE ?auto_20757 ) ( SURFACE-AT ?auto_20747 ?auto_20765 ) ( ON ?auto_20747 ?auto_20764 ) ( CLEAR ?auto_20747 ) ( TRUCK-AT ?auto_20755 ?auto_20756 ) ( not ( = ?auto_20746 ?auto_20747 ) ) ( not ( = ?auto_20746 ?auto_20764 ) ) ( not ( = ?auto_20747 ?auto_20764 ) ) ( not ( = ?auto_20753 ?auto_20757 ) ) ( not ( = ?auto_20746 ?auto_20748 ) ) ( not ( = ?auto_20746 ?auto_20763 ) ) ( not ( = ?auto_20748 ?auto_20764 ) ) ( not ( = ?auto_20761 ?auto_20765 ) ) ( not ( = ?auto_20762 ?auto_20757 ) ) ( not ( = ?auto_20763 ?auto_20764 ) ) ( not ( = ?auto_20746 ?auto_20749 ) ) ( not ( = ?auto_20746 ?auto_20759 ) ) ( not ( = ?auto_20747 ?auto_20749 ) ) ( not ( = ?auto_20747 ?auto_20759 ) ) ( not ( = ?auto_20749 ?auto_20763 ) ) ( not ( = ?auto_20749 ?auto_20764 ) ) ( not ( = ?auto_20758 ?auto_20761 ) ) ( not ( = ?auto_20758 ?auto_20765 ) ) ( not ( = ?auto_20760 ?auto_20762 ) ) ( not ( = ?auto_20760 ?auto_20757 ) ) ( not ( = ?auto_20759 ?auto_20763 ) ) ( not ( = ?auto_20759 ?auto_20764 ) ) ( not ( = ?auto_20746 ?auto_20750 ) ) ( not ( = ?auto_20746 ?auto_20751 ) ) ( not ( = ?auto_20747 ?auto_20750 ) ) ( not ( = ?auto_20747 ?auto_20751 ) ) ( not ( = ?auto_20748 ?auto_20750 ) ) ( not ( = ?auto_20748 ?auto_20751 ) ) ( not ( = ?auto_20750 ?auto_20759 ) ) ( not ( = ?auto_20750 ?auto_20763 ) ) ( not ( = ?auto_20750 ?auto_20764 ) ) ( not ( = ?auto_20754 ?auto_20758 ) ) ( not ( = ?auto_20754 ?auto_20761 ) ) ( not ( = ?auto_20754 ?auto_20765 ) ) ( not ( = ?auto_20752 ?auto_20760 ) ) ( not ( = ?auto_20752 ?auto_20762 ) ) ( not ( = ?auto_20752 ?auto_20757 ) ) ( not ( = ?auto_20751 ?auto_20759 ) ) ( not ( = ?auto_20751 ?auto_20763 ) ) ( not ( = ?auto_20751 ?auto_20764 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_20746 ?auto_20747 ?auto_20748 ?auto_20749 )
      ( MAKE-1CRATE ?auto_20749 ?auto_20750 )
      ( MAKE-4CRATE-VERIFY ?auto_20746 ?auto_20747 ?auto_20748 ?auto_20749 ?auto_20750 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_20782 - SURFACE
      ?auto_20783 - SURFACE
      ?auto_20784 - SURFACE
      ?auto_20785 - SURFACE
      ?auto_20786 - SURFACE
      ?auto_20787 - SURFACE
    )
    :vars
    (
      ?auto_20789 - HOIST
      ?auto_20793 - PLACE
      ?auto_20792 - PLACE
      ?auto_20790 - HOIST
      ?auto_20791 - SURFACE
      ?auto_20794 - PLACE
      ?auto_20802 - HOIST
      ?auto_20800 - SURFACE
      ?auto_20795 - PLACE
      ?auto_20801 - HOIST
      ?auto_20797 - SURFACE
      ?auto_20805 - PLACE
      ?auto_20803 - HOIST
      ?auto_20798 - SURFACE
      ?auto_20796 - PLACE
      ?auto_20804 - HOIST
      ?auto_20799 - SURFACE
      ?auto_20788 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20789 ?auto_20793 ) ( IS-CRATE ?auto_20787 ) ( not ( = ?auto_20792 ?auto_20793 ) ) ( HOIST-AT ?auto_20790 ?auto_20792 ) ( AVAILABLE ?auto_20790 ) ( SURFACE-AT ?auto_20787 ?auto_20792 ) ( ON ?auto_20787 ?auto_20791 ) ( CLEAR ?auto_20787 ) ( not ( = ?auto_20786 ?auto_20787 ) ) ( not ( = ?auto_20786 ?auto_20791 ) ) ( not ( = ?auto_20787 ?auto_20791 ) ) ( not ( = ?auto_20789 ?auto_20790 ) ) ( IS-CRATE ?auto_20786 ) ( not ( = ?auto_20794 ?auto_20793 ) ) ( HOIST-AT ?auto_20802 ?auto_20794 ) ( AVAILABLE ?auto_20802 ) ( SURFACE-AT ?auto_20786 ?auto_20794 ) ( ON ?auto_20786 ?auto_20800 ) ( CLEAR ?auto_20786 ) ( not ( = ?auto_20785 ?auto_20786 ) ) ( not ( = ?auto_20785 ?auto_20800 ) ) ( not ( = ?auto_20786 ?auto_20800 ) ) ( not ( = ?auto_20789 ?auto_20802 ) ) ( IS-CRATE ?auto_20785 ) ( not ( = ?auto_20795 ?auto_20793 ) ) ( HOIST-AT ?auto_20801 ?auto_20795 ) ( AVAILABLE ?auto_20801 ) ( SURFACE-AT ?auto_20785 ?auto_20795 ) ( ON ?auto_20785 ?auto_20797 ) ( CLEAR ?auto_20785 ) ( not ( = ?auto_20784 ?auto_20785 ) ) ( not ( = ?auto_20784 ?auto_20797 ) ) ( not ( = ?auto_20785 ?auto_20797 ) ) ( not ( = ?auto_20789 ?auto_20801 ) ) ( IS-CRATE ?auto_20784 ) ( not ( = ?auto_20805 ?auto_20793 ) ) ( HOIST-AT ?auto_20803 ?auto_20805 ) ( AVAILABLE ?auto_20803 ) ( SURFACE-AT ?auto_20784 ?auto_20805 ) ( ON ?auto_20784 ?auto_20798 ) ( CLEAR ?auto_20784 ) ( not ( = ?auto_20783 ?auto_20784 ) ) ( not ( = ?auto_20783 ?auto_20798 ) ) ( not ( = ?auto_20784 ?auto_20798 ) ) ( not ( = ?auto_20789 ?auto_20803 ) ) ( SURFACE-AT ?auto_20782 ?auto_20793 ) ( CLEAR ?auto_20782 ) ( IS-CRATE ?auto_20783 ) ( AVAILABLE ?auto_20789 ) ( not ( = ?auto_20796 ?auto_20793 ) ) ( HOIST-AT ?auto_20804 ?auto_20796 ) ( AVAILABLE ?auto_20804 ) ( SURFACE-AT ?auto_20783 ?auto_20796 ) ( ON ?auto_20783 ?auto_20799 ) ( CLEAR ?auto_20783 ) ( TRUCK-AT ?auto_20788 ?auto_20793 ) ( not ( = ?auto_20782 ?auto_20783 ) ) ( not ( = ?auto_20782 ?auto_20799 ) ) ( not ( = ?auto_20783 ?auto_20799 ) ) ( not ( = ?auto_20789 ?auto_20804 ) ) ( not ( = ?auto_20782 ?auto_20784 ) ) ( not ( = ?auto_20782 ?auto_20798 ) ) ( not ( = ?auto_20784 ?auto_20799 ) ) ( not ( = ?auto_20805 ?auto_20796 ) ) ( not ( = ?auto_20803 ?auto_20804 ) ) ( not ( = ?auto_20798 ?auto_20799 ) ) ( not ( = ?auto_20782 ?auto_20785 ) ) ( not ( = ?auto_20782 ?auto_20797 ) ) ( not ( = ?auto_20783 ?auto_20785 ) ) ( not ( = ?auto_20783 ?auto_20797 ) ) ( not ( = ?auto_20785 ?auto_20798 ) ) ( not ( = ?auto_20785 ?auto_20799 ) ) ( not ( = ?auto_20795 ?auto_20805 ) ) ( not ( = ?auto_20795 ?auto_20796 ) ) ( not ( = ?auto_20801 ?auto_20803 ) ) ( not ( = ?auto_20801 ?auto_20804 ) ) ( not ( = ?auto_20797 ?auto_20798 ) ) ( not ( = ?auto_20797 ?auto_20799 ) ) ( not ( = ?auto_20782 ?auto_20786 ) ) ( not ( = ?auto_20782 ?auto_20800 ) ) ( not ( = ?auto_20783 ?auto_20786 ) ) ( not ( = ?auto_20783 ?auto_20800 ) ) ( not ( = ?auto_20784 ?auto_20786 ) ) ( not ( = ?auto_20784 ?auto_20800 ) ) ( not ( = ?auto_20786 ?auto_20797 ) ) ( not ( = ?auto_20786 ?auto_20798 ) ) ( not ( = ?auto_20786 ?auto_20799 ) ) ( not ( = ?auto_20794 ?auto_20795 ) ) ( not ( = ?auto_20794 ?auto_20805 ) ) ( not ( = ?auto_20794 ?auto_20796 ) ) ( not ( = ?auto_20802 ?auto_20801 ) ) ( not ( = ?auto_20802 ?auto_20803 ) ) ( not ( = ?auto_20802 ?auto_20804 ) ) ( not ( = ?auto_20800 ?auto_20797 ) ) ( not ( = ?auto_20800 ?auto_20798 ) ) ( not ( = ?auto_20800 ?auto_20799 ) ) ( not ( = ?auto_20782 ?auto_20787 ) ) ( not ( = ?auto_20782 ?auto_20791 ) ) ( not ( = ?auto_20783 ?auto_20787 ) ) ( not ( = ?auto_20783 ?auto_20791 ) ) ( not ( = ?auto_20784 ?auto_20787 ) ) ( not ( = ?auto_20784 ?auto_20791 ) ) ( not ( = ?auto_20785 ?auto_20787 ) ) ( not ( = ?auto_20785 ?auto_20791 ) ) ( not ( = ?auto_20787 ?auto_20800 ) ) ( not ( = ?auto_20787 ?auto_20797 ) ) ( not ( = ?auto_20787 ?auto_20798 ) ) ( not ( = ?auto_20787 ?auto_20799 ) ) ( not ( = ?auto_20792 ?auto_20794 ) ) ( not ( = ?auto_20792 ?auto_20795 ) ) ( not ( = ?auto_20792 ?auto_20805 ) ) ( not ( = ?auto_20792 ?auto_20796 ) ) ( not ( = ?auto_20790 ?auto_20802 ) ) ( not ( = ?auto_20790 ?auto_20801 ) ) ( not ( = ?auto_20790 ?auto_20803 ) ) ( not ( = ?auto_20790 ?auto_20804 ) ) ( not ( = ?auto_20791 ?auto_20800 ) ) ( not ( = ?auto_20791 ?auto_20797 ) ) ( not ( = ?auto_20791 ?auto_20798 ) ) ( not ( = ?auto_20791 ?auto_20799 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_20782 ?auto_20783 ?auto_20784 ?auto_20785 ?auto_20786 )
      ( MAKE-1CRATE ?auto_20786 ?auto_20787 )
      ( MAKE-5CRATE-VERIFY ?auto_20782 ?auto_20783 ?auto_20784 ?auto_20785 ?auto_20786 ?auto_20787 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_20823 - SURFACE
      ?auto_20824 - SURFACE
      ?auto_20825 - SURFACE
      ?auto_20826 - SURFACE
      ?auto_20827 - SURFACE
      ?auto_20828 - SURFACE
      ?auto_20829 - SURFACE
    )
    :vars
    (
      ?auto_20830 - HOIST
      ?auto_20831 - PLACE
      ?auto_20835 - PLACE
      ?auto_20834 - HOIST
      ?auto_20832 - SURFACE
      ?auto_20846 - PLACE
      ?auto_20837 - HOIST
      ?auto_20836 - SURFACE
      ?auto_20839 - PLACE
      ?auto_20838 - HOIST
      ?auto_20842 - SURFACE
      ?auto_20845 - PLACE
      ?auto_20844 - HOIST
      ?auto_20840 - SURFACE
      ?auto_20847 - PLACE
      ?auto_20848 - HOIST
      ?auto_20841 - SURFACE
      ?auto_20843 - SURFACE
      ?auto_20833 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20830 ?auto_20831 ) ( IS-CRATE ?auto_20829 ) ( not ( = ?auto_20835 ?auto_20831 ) ) ( HOIST-AT ?auto_20834 ?auto_20835 ) ( SURFACE-AT ?auto_20829 ?auto_20835 ) ( ON ?auto_20829 ?auto_20832 ) ( CLEAR ?auto_20829 ) ( not ( = ?auto_20828 ?auto_20829 ) ) ( not ( = ?auto_20828 ?auto_20832 ) ) ( not ( = ?auto_20829 ?auto_20832 ) ) ( not ( = ?auto_20830 ?auto_20834 ) ) ( IS-CRATE ?auto_20828 ) ( not ( = ?auto_20846 ?auto_20831 ) ) ( HOIST-AT ?auto_20837 ?auto_20846 ) ( AVAILABLE ?auto_20837 ) ( SURFACE-AT ?auto_20828 ?auto_20846 ) ( ON ?auto_20828 ?auto_20836 ) ( CLEAR ?auto_20828 ) ( not ( = ?auto_20827 ?auto_20828 ) ) ( not ( = ?auto_20827 ?auto_20836 ) ) ( not ( = ?auto_20828 ?auto_20836 ) ) ( not ( = ?auto_20830 ?auto_20837 ) ) ( IS-CRATE ?auto_20827 ) ( not ( = ?auto_20839 ?auto_20831 ) ) ( HOIST-AT ?auto_20838 ?auto_20839 ) ( AVAILABLE ?auto_20838 ) ( SURFACE-AT ?auto_20827 ?auto_20839 ) ( ON ?auto_20827 ?auto_20842 ) ( CLEAR ?auto_20827 ) ( not ( = ?auto_20826 ?auto_20827 ) ) ( not ( = ?auto_20826 ?auto_20842 ) ) ( not ( = ?auto_20827 ?auto_20842 ) ) ( not ( = ?auto_20830 ?auto_20838 ) ) ( IS-CRATE ?auto_20826 ) ( not ( = ?auto_20845 ?auto_20831 ) ) ( HOIST-AT ?auto_20844 ?auto_20845 ) ( AVAILABLE ?auto_20844 ) ( SURFACE-AT ?auto_20826 ?auto_20845 ) ( ON ?auto_20826 ?auto_20840 ) ( CLEAR ?auto_20826 ) ( not ( = ?auto_20825 ?auto_20826 ) ) ( not ( = ?auto_20825 ?auto_20840 ) ) ( not ( = ?auto_20826 ?auto_20840 ) ) ( not ( = ?auto_20830 ?auto_20844 ) ) ( IS-CRATE ?auto_20825 ) ( not ( = ?auto_20847 ?auto_20831 ) ) ( HOIST-AT ?auto_20848 ?auto_20847 ) ( AVAILABLE ?auto_20848 ) ( SURFACE-AT ?auto_20825 ?auto_20847 ) ( ON ?auto_20825 ?auto_20841 ) ( CLEAR ?auto_20825 ) ( not ( = ?auto_20824 ?auto_20825 ) ) ( not ( = ?auto_20824 ?auto_20841 ) ) ( not ( = ?auto_20825 ?auto_20841 ) ) ( not ( = ?auto_20830 ?auto_20848 ) ) ( SURFACE-AT ?auto_20823 ?auto_20831 ) ( CLEAR ?auto_20823 ) ( IS-CRATE ?auto_20824 ) ( AVAILABLE ?auto_20830 ) ( AVAILABLE ?auto_20834 ) ( SURFACE-AT ?auto_20824 ?auto_20835 ) ( ON ?auto_20824 ?auto_20843 ) ( CLEAR ?auto_20824 ) ( TRUCK-AT ?auto_20833 ?auto_20831 ) ( not ( = ?auto_20823 ?auto_20824 ) ) ( not ( = ?auto_20823 ?auto_20843 ) ) ( not ( = ?auto_20824 ?auto_20843 ) ) ( not ( = ?auto_20823 ?auto_20825 ) ) ( not ( = ?auto_20823 ?auto_20841 ) ) ( not ( = ?auto_20825 ?auto_20843 ) ) ( not ( = ?auto_20847 ?auto_20835 ) ) ( not ( = ?auto_20848 ?auto_20834 ) ) ( not ( = ?auto_20841 ?auto_20843 ) ) ( not ( = ?auto_20823 ?auto_20826 ) ) ( not ( = ?auto_20823 ?auto_20840 ) ) ( not ( = ?auto_20824 ?auto_20826 ) ) ( not ( = ?auto_20824 ?auto_20840 ) ) ( not ( = ?auto_20826 ?auto_20841 ) ) ( not ( = ?auto_20826 ?auto_20843 ) ) ( not ( = ?auto_20845 ?auto_20847 ) ) ( not ( = ?auto_20845 ?auto_20835 ) ) ( not ( = ?auto_20844 ?auto_20848 ) ) ( not ( = ?auto_20844 ?auto_20834 ) ) ( not ( = ?auto_20840 ?auto_20841 ) ) ( not ( = ?auto_20840 ?auto_20843 ) ) ( not ( = ?auto_20823 ?auto_20827 ) ) ( not ( = ?auto_20823 ?auto_20842 ) ) ( not ( = ?auto_20824 ?auto_20827 ) ) ( not ( = ?auto_20824 ?auto_20842 ) ) ( not ( = ?auto_20825 ?auto_20827 ) ) ( not ( = ?auto_20825 ?auto_20842 ) ) ( not ( = ?auto_20827 ?auto_20840 ) ) ( not ( = ?auto_20827 ?auto_20841 ) ) ( not ( = ?auto_20827 ?auto_20843 ) ) ( not ( = ?auto_20839 ?auto_20845 ) ) ( not ( = ?auto_20839 ?auto_20847 ) ) ( not ( = ?auto_20839 ?auto_20835 ) ) ( not ( = ?auto_20838 ?auto_20844 ) ) ( not ( = ?auto_20838 ?auto_20848 ) ) ( not ( = ?auto_20838 ?auto_20834 ) ) ( not ( = ?auto_20842 ?auto_20840 ) ) ( not ( = ?auto_20842 ?auto_20841 ) ) ( not ( = ?auto_20842 ?auto_20843 ) ) ( not ( = ?auto_20823 ?auto_20828 ) ) ( not ( = ?auto_20823 ?auto_20836 ) ) ( not ( = ?auto_20824 ?auto_20828 ) ) ( not ( = ?auto_20824 ?auto_20836 ) ) ( not ( = ?auto_20825 ?auto_20828 ) ) ( not ( = ?auto_20825 ?auto_20836 ) ) ( not ( = ?auto_20826 ?auto_20828 ) ) ( not ( = ?auto_20826 ?auto_20836 ) ) ( not ( = ?auto_20828 ?auto_20842 ) ) ( not ( = ?auto_20828 ?auto_20840 ) ) ( not ( = ?auto_20828 ?auto_20841 ) ) ( not ( = ?auto_20828 ?auto_20843 ) ) ( not ( = ?auto_20846 ?auto_20839 ) ) ( not ( = ?auto_20846 ?auto_20845 ) ) ( not ( = ?auto_20846 ?auto_20847 ) ) ( not ( = ?auto_20846 ?auto_20835 ) ) ( not ( = ?auto_20837 ?auto_20838 ) ) ( not ( = ?auto_20837 ?auto_20844 ) ) ( not ( = ?auto_20837 ?auto_20848 ) ) ( not ( = ?auto_20837 ?auto_20834 ) ) ( not ( = ?auto_20836 ?auto_20842 ) ) ( not ( = ?auto_20836 ?auto_20840 ) ) ( not ( = ?auto_20836 ?auto_20841 ) ) ( not ( = ?auto_20836 ?auto_20843 ) ) ( not ( = ?auto_20823 ?auto_20829 ) ) ( not ( = ?auto_20823 ?auto_20832 ) ) ( not ( = ?auto_20824 ?auto_20829 ) ) ( not ( = ?auto_20824 ?auto_20832 ) ) ( not ( = ?auto_20825 ?auto_20829 ) ) ( not ( = ?auto_20825 ?auto_20832 ) ) ( not ( = ?auto_20826 ?auto_20829 ) ) ( not ( = ?auto_20826 ?auto_20832 ) ) ( not ( = ?auto_20827 ?auto_20829 ) ) ( not ( = ?auto_20827 ?auto_20832 ) ) ( not ( = ?auto_20829 ?auto_20836 ) ) ( not ( = ?auto_20829 ?auto_20842 ) ) ( not ( = ?auto_20829 ?auto_20840 ) ) ( not ( = ?auto_20829 ?auto_20841 ) ) ( not ( = ?auto_20829 ?auto_20843 ) ) ( not ( = ?auto_20832 ?auto_20836 ) ) ( not ( = ?auto_20832 ?auto_20842 ) ) ( not ( = ?auto_20832 ?auto_20840 ) ) ( not ( = ?auto_20832 ?auto_20841 ) ) ( not ( = ?auto_20832 ?auto_20843 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_20823 ?auto_20824 ?auto_20825 ?auto_20826 ?auto_20827 ?auto_20828 )
      ( MAKE-1CRATE ?auto_20828 ?auto_20829 )
      ( MAKE-6CRATE-VERIFY ?auto_20823 ?auto_20824 ?auto_20825 ?auto_20826 ?auto_20827 ?auto_20828 ?auto_20829 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_20867 - SURFACE
      ?auto_20868 - SURFACE
      ?auto_20869 - SURFACE
      ?auto_20870 - SURFACE
      ?auto_20871 - SURFACE
      ?auto_20872 - SURFACE
      ?auto_20873 - SURFACE
      ?auto_20874 - SURFACE
    )
    :vars
    (
      ?auto_20878 - HOIST
      ?auto_20880 - PLACE
      ?auto_20879 - PLACE
      ?auto_20876 - HOIST
      ?auto_20877 - SURFACE
      ?auto_20891 - PLACE
      ?auto_20884 - HOIST
      ?auto_20896 - SURFACE
      ?auto_20881 - PLACE
      ?auto_20885 - HOIST
      ?auto_20887 - SURFACE
      ?auto_20893 - PLACE
      ?auto_20895 - HOIST
      ?auto_20894 - SURFACE
      ?auto_20886 - PLACE
      ?auto_20883 - HOIST
      ?auto_20888 - SURFACE
      ?auto_20882 - PLACE
      ?auto_20890 - HOIST
      ?auto_20892 - SURFACE
      ?auto_20889 - SURFACE
      ?auto_20875 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20878 ?auto_20880 ) ( IS-CRATE ?auto_20874 ) ( not ( = ?auto_20879 ?auto_20880 ) ) ( HOIST-AT ?auto_20876 ?auto_20879 ) ( AVAILABLE ?auto_20876 ) ( SURFACE-AT ?auto_20874 ?auto_20879 ) ( ON ?auto_20874 ?auto_20877 ) ( CLEAR ?auto_20874 ) ( not ( = ?auto_20873 ?auto_20874 ) ) ( not ( = ?auto_20873 ?auto_20877 ) ) ( not ( = ?auto_20874 ?auto_20877 ) ) ( not ( = ?auto_20878 ?auto_20876 ) ) ( IS-CRATE ?auto_20873 ) ( not ( = ?auto_20891 ?auto_20880 ) ) ( HOIST-AT ?auto_20884 ?auto_20891 ) ( SURFACE-AT ?auto_20873 ?auto_20891 ) ( ON ?auto_20873 ?auto_20896 ) ( CLEAR ?auto_20873 ) ( not ( = ?auto_20872 ?auto_20873 ) ) ( not ( = ?auto_20872 ?auto_20896 ) ) ( not ( = ?auto_20873 ?auto_20896 ) ) ( not ( = ?auto_20878 ?auto_20884 ) ) ( IS-CRATE ?auto_20872 ) ( not ( = ?auto_20881 ?auto_20880 ) ) ( HOIST-AT ?auto_20885 ?auto_20881 ) ( AVAILABLE ?auto_20885 ) ( SURFACE-AT ?auto_20872 ?auto_20881 ) ( ON ?auto_20872 ?auto_20887 ) ( CLEAR ?auto_20872 ) ( not ( = ?auto_20871 ?auto_20872 ) ) ( not ( = ?auto_20871 ?auto_20887 ) ) ( not ( = ?auto_20872 ?auto_20887 ) ) ( not ( = ?auto_20878 ?auto_20885 ) ) ( IS-CRATE ?auto_20871 ) ( not ( = ?auto_20893 ?auto_20880 ) ) ( HOIST-AT ?auto_20895 ?auto_20893 ) ( AVAILABLE ?auto_20895 ) ( SURFACE-AT ?auto_20871 ?auto_20893 ) ( ON ?auto_20871 ?auto_20894 ) ( CLEAR ?auto_20871 ) ( not ( = ?auto_20870 ?auto_20871 ) ) ( not ( = ?auto_20870 ?auto_20894 ) ) ( not ( = ?auto_20871 ?auto_20894 ) ) ( not ( = ?auto_20878 ?auto_20895 ) ) ( IS-CRATE ?auto_20870 ) ( not ( = ?auto_20886 ?auto_20880 ) ) ( HOIST-AT ?auto_20883 ?auto_20886 ) ( AVAILABLE ?auto_20883 ) ( SURFACE-AT ?auto_20870 ?auto_20886 ) ( ON ?auto_20870 ?auto_20888 ) ( CLEAR ?auto_20870 ) ( not ( = ?auto_20869 ?auto_20870 ) ) ( not ( = ?auto_20869 ?auto_20888 ) ) ( not ( = ?auto_20870 ?auto_20888 ) ) ( not ( = ?auto_20878 ?auto_20883 ) ) ( IS-CRATE ?auto_20869 ) ( not ( = ?auto_20882 ?auto_20880 ) ) ( HOIST-AT ?auto_20890 ?auto_20882 ) ( AVAILABLE ?auto_20890 ) ( SURFACE-AT ?auto_20869 ?auto_20882 ) ( ON ?auto_20869 ?auto_20892 ) ( CLEAR ?auto_20869 ) ( not ( = ?auto_20868 ?auto_20869 ) ) ( not ( = ?auto_20868 ?auto_20892 ) ) ( not ( = ?auto_20869 ?auto_20892 ) ) ( not ( = ?auto_20878 ?auto_20890 ) ) ( SURFACE-AT ?auto_20867 ?auto_20880 ) ( CLEAR ?auto_20867 ) ( IS-CRATE ?auto_20868 ) ( AVAILABLE ?auto_20878 ) ( AVAILABLE ?auto_20884 ) ( SURFACE-AT ?auto_20868 ?auto_20891 ) ( ON ?auto_20868 ?auto_20889 ) ( CLEAR ?auto_20868 ) ( TRUCK-AT ?auto_20875 ?auto_20880 ) ( not ( = ?auto_20867 ?auto_20868 ) ) ( not ( = ?auto_20867 ?auto_20889 ) ) ( not ( = ?auto_20868 ?auto_20889 ) ) ( not ( = ?auto_20867 ?auto_20869 ) ) ( not ( = ?auto_20867 ?auto_20892 ) ) ( not ( = ?auto_20869 ?auto_20889 ) ) ( not ( = ?auto_20882 ?auto_20891 ) ) ( not ( = ?auto_20890 ?auto_20884 ) ) ( not ( = ?auto_20892 ?auto_20889 ) ) ( not ( = ?auto_20867 ?auto_20870 ) ) ( not ( = ?auto_20867 ?auto_20888 ) ) ( not ( = ?auto_20868 ?auto_20870 ) ) ( not ( = ?auto_20868 ?auto_20888 ) ) ( not ( = ?auto_20870 ?auto_20892 ) ) ( not ( = ?auto_20870 ?auto_20889 ) ) ( not ( = ?auto_20886 ?auto_20882 ) ) ( not ( = ?auto_20886 ?auto_20891 ) ) ( not ( = ?auto_20883 ?auto_20890 ) ) ( not ( = ?auto_20883 ?auto_20884 ) ) ( not ( = ?auto_20888 ?auto_20892 ) ) ( not ( = ?auto_20888 ?auto_20889 ) ) ( not ( = ?auto_20867 ?auto_20871 ) ) ( not ( = ?auto_20867 ?auto_20894 ) ) ( not ( = ?auto_20868 ?auto_20871 ) ) ( not ( = ?auto_20868 ?auto_20894 ) ) ( not ( = ?auto_20869 ?auto_20871 ) ) ( not ( = ?auto_20869 ?auto_20894 ) ) ( not ( = ?auto_20871 ?auto_20888 ) ) ( not ( = ?auto_20871 ?auto_20892 ) ) ( not ( = ?auto_20871 ?auto_20889 ) ) ( not ( = ?auto_20893 ?auto_20886 ) ) ( not ( = ?auto_20893 ?auto_20882 ) ) ( not ( = ?auto_20893 ?auto_20891 ) ) ( not ( = ?auto_20895 ?auto_20883 ) ) ( not ( = ?auto_20895 ?auto_20890 ) ) ( not ( = ?auto_20895 ?auto_20884 ) ) ( not ( = ?auto_20894 ?auto_20888 ) ) ( not ( = ?auto_20894 ?auto_20892 ) ) ( not ( = ?auto_20894 ?auto_20889 ) ) ( not ( = ?auto_20867 ?auto_20872 ) ) ( not ( = ?auto_20867 ?auto_20887 ) ) ( not ( = ?auto_20868 ?auto_20872 ) ) ( not ( = ?auto_20868 ?auto_20887 ) ) ( not ( = ?auto_20869 ?auto_20872 ) ) ( not ( = ?auto_20869 ?auto_20887 ) ) ( not ( = ?auto_20870 ?auto_20872 ) ) ( not ( = ?auto_20870 ?auto_20887 ) ) ( not ( = ?auto_20872 ?auto_20894 ) ) ( not ( = ?auto_20872 ?auto_20888 ) ) ( not ( = ?auto_20872 ?auto_20892 ) ) ( not ( = ?auto_20872 ?auto_20889 ) ) ( not ( = ?auto_20881 ?auto_20893 ) ) ( not ( = ?auto_20881 ?auto_20886 ) ) ( not ( = ?auto_20881 ?auto_20882 ) ) ( not ( = ?auto_20881 ?auto_20891 ) ) ( not ( = ?auto_20885 ?auto_20895 ) ) ( not ( = ?auto_20885 ?auto_20883 ) ) ( not ( = ?auto_20885 ?auto_20890 ) ) ( not ( = ?auto_20885 ?auto_20884 ) ) ( not ( = ?auto_20887 ?auto_20894 ) ) ( not ( = ?auto_20887 ?auto_20888 ) ) ( not ( = ?auto_20887 ?auto_20892 ) ) ( not ( = ?auto_20887 ?auto_20889 ) ) ( not ( = ?auto_20867 ?auto_20873 ) ) ( not ( = ?auto_20867 ?auto_20896 ) ) ( not ( = ?auto_20868 ?auto_20873 ) ) ( not ( = ?auto_20868 ?auto_20896 ) ) ( not ( = ?auto_20869 ?auto_20873 ) ) ( not ( = ?auto_20869 ?auto_20896 ) ) ( not ( = ?auto_20870 ?auto_20873 ) ) ( not ( = ?auto_20870 ?auto_20896 ) ) ( not ( = ?auto_20871 ?auto_20873 ) ) ( not ( = ?auto_20871 ?auto_20896 ) ) ( not ( = ?auto_20873 ?auto_20887 ) ) ( not ( = ?auto_20873 ?auto_20894 ) ) ( not ( = ?auto_20873 ?auto_20888 ) ) ( not ( = ?auto_20873 ?auto_20892 ) ) ( not ( = ?auto_20873 ?auto_20889 ) ) ( not ( = ?auto_20896 ?auto_20887 ) ) ( not ( = ?auto_20896 ?auto_20894 ) ) ( not ( = ?auto_20896 ?auto_20888 ) ) ( not ( = ?auto_20896 ?auto_20892 ) ) ( not ( = ?auto_20896 ?auto_20889 ) ) ( not ( = ?auto_20867 ?auto_20874 ) ) ( not ( = ?auto_20867 ?auto_20877 ) ) ( not ( = ?auto_20868 ?auto_20874 ) ) ( not ( = ?auto_20868 ?auto_20877 ) ) ( not ( = ?auto_20869 ?auto_20874 ) ) ( not ( = ?auto_20869 ?auto_20877 ) ) ( not ( = ?auto_20870 ?auto_20874 ) ) ( not ( = ?auto_20870 ?auto_20877 ) ) ( not ( = ?auto_20871 ?auto_20874 ) ) ( not ( = ?auto_20871 ?auto_20877 ) ) ( not ( = ?auto_20872 ?auto_20874 ) ) ( not ( = ?auto_20872 ?auto_20877 ) ) ( not ( = ?auto_20874 ?auto_20896 ) ) ( not ( = ?auto_20874 ?auto_20887 ) ) ( not ( = ?auto_20874 ?auto_20894 ) ) ( not ( = ?auto_20874 ?auto_20888 ) ) ( not ( = ?auto_20874 ?auto_20892 ) ) ( not ( = ?auto_20874 ?auto_20889 ) ) ( not ( = ?auto_20879 ?auto_20891 ) ) ( not ( = ?auto_20879 ?auto_20881 ) ) ( not ( = ?auto_20879 ?auto_20893 ) ) ( not ( = ?auto_20879 ?auto_20886 ) ) ( not ( = ?auto_20879 ?auto_20882 ) ) ( not ( = ?auto_20876 ?auto_20884 ) ) ( not ( = ?auto_20876 ?auto_20885 ) ) ( not ( = ?auto_20876 ?auto_20895 ) ) ( not ( = ?auto_20876 ?auto_20883 ) ) ( not ( = ?auto_20876 ?auto_20890 ) ) ( not ( = ?auto_20877 ?auto_20896 ) ) ( not ( = ?auto_20877 ?auto_20887 ) ) ( not ( = ?auto_20877 ?auto_20894 ) ) ( not ( = ?auto_20877 ?auto_20888 ) ) ( not ( = ?auto_20877 ?auto_20892 ) ) ( not ( = ?auto_20877 ?auto_20889 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_20867 ?auto_20868 ?auto_20869 ?auto_20870 ?auto_20871 ?auto_20872 ?auto_20873 )
      ( MAKE-1CRATE ?auto_20873 ?auto_20874 )
      ( MAKE-7CRATE-VERIFY ?auto_20867 ?auto_20868 ?auto_20869 ?auto_20870 ?auto_20871 ?auto_20872 ?auto_20873 ?auto_20874 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_20916 - SURFACE
      ?auto_20917 - SURFACE
      ?auto_20918 - SURFACE
      ?auto_20919 - SURFACE
      ?auto_20920 - SURFACE
      ?auto_20921 - SURFACE
      ?auto_20922 - SURFACE
      ?auto_20923 - SURFACE
      ?auto_20924 - SURFACE
    )
    :vars
    (
      ?auto_20929 - HOIST
      ?auto_20928 - PLACE
      ?auto_20930 - PLACE
      ?auto_20926 - HOIST
      ?auto_20925 - SURFACE
      ?auto_20936 - PLACE
      ?auto_20941 - HOIST
      ?auto_20944 - SURFACE
      ?auto_20940 - SURFACE
      ?auto_20946 - PLACE
      ?auto_20943 - HOIST
      ?auto_20934 - SURFACE
      ?auto_20931 - PLACE
      ?auto_20935 - HOIST
      ?auto_20939 - SURFACE
      ?auto_20942 - PLACE
      ?auto_20945 - HOIST
      ?auto_20933 - SURFACE
      ?auto_20947 - PLACE
      ?auto_20937 - HOIST
      ?auto_20932 - SURFACE
      ?auto_20938 - SURFACE
      ?auto_20927 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20929 ?auto_20928 ) ( IS-CRATE ?auto_20924 ) ( not ( = ?auto_20930 ?auto_20928 ) ) ( HOIST-AT ?auto_20926 ?auto_20930 ) ( SURFACE-AT ?auto_20924 ?auto_20930 ) ( ON ?auto_20924 ?auto_20925 ) ( CLEAR ?auto_20924 ) ( not ( = ?auto_20923 ?auto_20924 ) ) ( not ( = ?auto_20923 ?auto_20925 ) ) ( not ( = ?auto_20924 ?auto_20925 ) ) ( not ( = ?auto_20929 ?auto_20926 ) ) ( IS-CRATE ?auto_20923 ) ( not ( = ?auto_20936 ?auto_20928 ) ) ( HOIST-AT ?auto_20941 ?auto_20936 ) ( AVAILABLE ?auto_20941 ) ( SURFACE-AT ?auto_20923 ?auto_20936 ) ( ON ?auto_20923 ?auto_20944 ) ( CLEAR ?auto_20923 ) ( not ( = ?auto_20922 ?auto_20923 ) ) ( not ( = ?auto_20922 ?auto_20944 ) ) ( not ( = ?auto_20923 ?auto_20944 ) ) ( not ( = ?auto_20929 ?auto_20941 ) ) ( IS-CRATE ?auto_20922 ) ( SURFACE-AT ?auto_20922 ?auto_20930 ) ( ON ?auto_20922 ?auto_20940 ) ( CLEAR ?auto_20922 ) ( not ( = ?auto_20921 ?auto_20922 ) ) ( not ( = ?auto_20921 ?auto_20940 ) ) ( not ( = ?auto_20922 ?auto_20940 ) ) ( IS-CRATE ?auto_20921 ) ( not ( = ?auto_20946 ?auto_20928 ) ) ( HOIST-AT ?auto_20943 ?auto_20946 ) ( AVAILABLE ?auto_20943 ) ( SURFACE-AT ?auto_20921 ?auto_20946 ) ( ON ?auto_20921 ?auto_20934 ) ( CLEAR ?auto_20921 ) ( not ( = ?auto_20920 ?auto_20921 ) ) ( not ( = ?auto_20920 ?auto_20934 ) ) ( not ( = ?auto_20921 ?auto_20934 ) ) ( not ( = ?auto_20929 ?auto_20943 ) ) ( IS-CRATE ?auto_20920 ) ( not ( = ?auto_20931 ?auto_20928 ) ) ( HOIST-AT ?auto_20935 ?auto_20931 ) ( AVAILABLE ?auto_20935 ) ( SURFACE-AT ?auto_20920 ?auto_20931 ) ( ON ?auto_20920 ?auto_20939 ) ( CLEAR ?auto_20920 ) ( not ( = ?auto_20919 ?auto_20920 ) ) ( not ( = ?auto_20919 ?auto_20939 ) ) ( not ( = ?auto_20920 ?auto_20939 ) ) ( not ( = ?auto_20929 ?auto_20935 ) ) ( IS-CRATE ?auto_20919 ) ( not ( = ?auto_20942 ?auto_20928 ) ) ( HOIST-AT ?auto_20945 ?auto_20942 ) ( AVAILABLE ?auto_20945 ) ( SURFACE-AT ?auto_20919 ?auto_20942 ) ( ON ?auto_20919 ?auto_20933 ) ( CLEAR ?auto_20919 ) ( not ( = ?auto_20918 ?auto_20919 ) ) ( not ( = ?auto_20918 ?auto_20933 ) ) ( not ( = ?auto_20919 ?auto_20933 ) ) ( not ( = ?auto_20929 ?auto_20945 ) ) ( IS-CRATE ?auto_20918 ) ( not ( = ?auto_20947 ?auto_20928 ) ) ( HOIST-AT ?auto_20937 ?auto_20947 ) ( AVAILABLE ?auto_20937 ) ( SURFACE-AT ?auto_20918 ?auto_20947 ) ( ON ?auto_20918 ?auto_20932 ) ( CLEAR ?auto_20918 ) ( not ( = ?auto_20917 ?auto_20918 ) ) ( not ( = ?auto_20917 ?auto_20932 ) ) ( not ( = ?auto_20918 ?auto_20932 ) ) ( not ( = ?auto_20929 ?auto_20937 ) ) ( SURFACE-AT ?auto_20916 ?auto_20928 ) ( CLEAR ?auto_20916 ) ( IS-CRATE ?auto_20917 ) ( AVAILABLE ?auto_20929 ) ( AVAILABLE ?auto_20926 ) ( SURFACE-AT ?auto_20917 ?auto_20930 ) ( ON ?auto_20917 ?auto_20938 ) ( CLEAR ?auto_20917 ) ( TRUCK-AT ?auto_20927 ?auto_20928 ) ( not ( = ?auto_20916 ?auto_20917 ) ) ( not ( = ?auto_20916 ?auto_20938 ) ) ( not ( = ?auto_20917 ?auto_20938 ) ) ( not ( = ?auto_20916 ?auto_20918 ) ) ( not ( = ?auto_20916 ?auto_20932 ) ) ( not ( = ?auto_20918 ?auto_20938 ) ) ( not ( = ?auto_20947 ?auto_20930 ) ) ( not ( = ?auto_20937 ?auto_20926 ) ) ( not ( = ?auto_20932 ?auto_20938 ) ) ( not ( = ?auto_20916 ?auto_20919 ) ) ( not ( = ?auto_20916 ?auto_20933 ) ) ( not ( = ?auto_20917 ?auto_20919 ) ) ( not ( = ?auto_20917 ?auto_20933 ) ) ( not ( = ?auto_20919 ?auto_20932 ) ) ( not ( = ?auto_20919 ?auto_20938 ) ) ( not ( = ?auto_20942 ?auto_20947 ) ) ( not ( = ?auto_20942 ?auto_20930 ) ) ( not ( = ?auto_20945 ?auto_20937 ) ) ( not ( = ?auto_20945 ?auto_20926 ) ) ( not ( = ?auto_20933 ?auto_20932 ) ) ( not ( = ?auto_20933 ?auto_20938 ) ) ( not ( = ?auto_20916 ?auto_20920 ) ) ( not ( = ?auto_20916 ?auto_20939 ) ) ( not ( = ?auto_20917 ?auto_20920 ) ) ( not ( = ?auto_20917 ?auto_20939 ) ) ( not ( = ?auto_20918 ?auto_20920 ) ) ( not ( = ?auto_20918 ?auto_20939 ) ) ( not ( = ?auto_20920 ?auto_20933 ) ) ( not ( = ?auto_20920 ?auto_20932 ) ) ( not ( = ?auto_20920 ?auto_20938 ) ) ( not ( = ?auto_20931 ?auto_20942 ) ) ( not ( = ?auto_20931 ?auto_20947 ) ) ( not ( = ?auto_20931 ?auto_20930 ) ) ( not ( = ?auto_20935 ?auto_20945 ) ) ( not ( = ?auto_20935 ?auto_20937 ) ) ( not ( = ?auto_20935 ?auto_20926 ) ) ( not ( = ?auto_20939 ?auto_20933 ) ) ( not ( = ?auto_20939 ?auto_20932 ) ) ( not ( = ?auto_20939 ?auto_20938 ) ) ( not ( = ?auto_20916 ?auto_20921 ) ) ( not ( = ?auto_20916 ?auto_20934 ) ) ( not ( = ?auto_20917 ?auto_20921 ) ) ( not ( = ?auto_20917 ?auto_20934 ) ) ( not ( = ?auto_20918 ?auto_20921 ) ) ( not ( = ?auto_20918 ?auto_20934 ) ) ( not ( = ?auto_20919 ?auto_20921 ) ) ( not ( = ?auto_20919 ?auto_20934 ) ) ( not ( = ?auto_20921 ?auto_20939 ) ) ( not ( = ?auto_20921 ?auto_20933 ) ) ( not ( = ?auto_20921 ?auto_20932 ) ) ( not ( = ?auto_20921 ?auto_20938 ) ) ( not ( = ?auto_20946 ?auto_20931 ) ) ( not ( = ?auto_20946 ?auto_20942 ) ) ( not ( = ?auto_20946 ?auto_20947 ) ) ( not ( = ?auto_20946 ?auto_20930 ) ) ( not ( = ?auto_20943 ?auto_20935 ) ) ( not ( = ?auto_20943 ?auto_20945 ) ) ( not ( = ?auto_20943 ?auto_20937 ) ) ( not ( = ?auto_20943 ?auto_20926 ) ) ( not ( = ?auto_20934 ?auto_20939 ) ) ( not ( = ?auto_20934 ?auto_20933 ) ) ( not ( = ?auto_20934 ?auto_20932 ) ) ( not ( = ?auto_20934 ?auto_20938 ) ) ( not ( = ?auto_20916 ?auto_20922 ) ) ( not ( = ?auto_20916 ?auto_20940 ) ) ( not ( = ?auto_20917 ?auto_20922 ) ) ( not ( = ?auto_20917 ?auto_20940 ) ) ( not ( = ?auto_20918 ?auto_20922 ) ) ( not ( = ?auto_20918 ?auto_20940 ) ) ( not ( = ?auto_20919 ?auto_20922 ) ) ( not ( = ?auto_20919 ?auto_20940 ) ) ( not ( = ?auto_20920 ?auto_20922 ) ) ( not ( = ?auto_20920 ?auto_20940 ) ) ( not ( = ?auto_20922 ?auto_20934 ) ) ( not ( = ?auto_20922 ?auto_20939 ) ) ( not ( = ?auto_20922 ?auto_20933 ) ) ( not ( = ?auto_20922 ?auto_20932 ) ) ( not ( = ?auto_20922 ?auto_20938 ) ) ( not ( = ?auto_20940 ?auto_20934 ) ) ( not ( = ?auto_20940 ?auto_20939 ) ) ( not ( = ?auto_20940 ?auto_20933 ) ) ( not ( = ?auto_20940 ?auto_20932 ) ) ( not ( = ?auto_20940 ?auto_20938 ) ) ( not ( = ?auto_20916 ?auto_20923 ) ) ( not ( = ?auto_20916 ?auto_20944 ) ) ( not ( = ?auto_20917 ?auto_20923 ) ) ( not ( = ?auto_20917 ?auto_20944 ) ) ( not ( = ?auto_20918 ?auto_20923 ) ) ( not ( = ?auto_20918 ?auto_20944 ) ) ( not ( = ?auto_20919 ?auto_20923 ) ) ( not ( = ?auto_20919 ?auto_20944 ) ) ( not ( = ?auto_20920 ?auto_20923 ) ) ( not ( = ?auto_20920 ?auto_20944 ) ) ( not ( = ?auto_20921 ?auto_20923 ) ) ( not ( = ?auto_20921 ?auto_20944 ) ) ( not ( = ?auto_20923 ?auto_20940 ) ) ( not ( = ?auto_20923 ?auto_20934 ) ) ( not ( = ?auto_20923 ?auto_20939 ) ) ( not ( = ?auto_20923 ?auto_20933 ) ) ( not ( = ?auto_20923 ?auto_20932 ) ) ( not ( = ?auto_20923 ?auto_20938 ) ) ( not ( = ?auto_20936 ?auto_20930 ) ) ( not ( = ?auto_20936 ?auto_20946 ) ) ( not ( = ?auto_20936 ?auto_20931 ) ) ( not ( = ?auto_20936 ?auto_20942 ) ) ( not ( = ?auto_20936 ?auto_20947 ) ) ( not ( = ?auto_20941 ?auto_20926 ) ) ( not ( = ?auto_20941 ?auto_20943 ) ) ( not ( = ?auto_20941 ?auto_20935 ) ) ( not ( = ?auto_20941 ?auto_20945 ) ) ( not ( = ?auto_20941 ?auto_20937 ) ) ( not ( = ?auto_20944 ?auto_20940 ) ) ( not ( = ?auto_20944 ?auto_20934 ) ) ( not ( = ?auto_20944 ?auto_20939 ) ) ( not ( = ?auto_20944 ?auto_20933 ) ) ( not ( = ?auto_20944 ?auto_20932 ) ) ( not ( = ?auto_20944 ?auto_20938 ) ) ( not ( = ?auto_20916 ?auto_20924 ) ) ( not ( = ?auto_20916 ?auto_20925 ) ) ( not ( = ?auto_20917 ?auto_20924 ) ) ( not ( = ?auto_20917 ?auto_20925 ) ) ( not ( = ?auto_20918 ?auto_20924 ) ) ( not ( = ?auto_20918 ?auto_20925 ) ) ( not ( = ?auto_20919 ?auto_20924 ) ) ( not ( = ?auto_20919 ?auto_20925 ) ) ( not ( = ?auto_20920 ?auto_20924 ) ) ( not ( = ?auto_20920 ?auto_20925 ) ) ( not ( = ?auto_20921 ?auto_20924 ) ) ( not ( = ?auto_20921 ?auto_20925 ) ) ( not ( = ?auto_20922 ?auto_20924 ) ) ( not ( = ?auto_20922 ?auto_20925 ) ) ( not ( = ?auto_20924 ?auto_20944 ) ) ( not ( = ?auto_20924 ?auto_20940 ) ) ( not ( = ?auto_20924 ?auto_20934 ) ) ( not ( = ?auto_20924 ?auto_20939 ) ) ( not ( = ?auto_20924 ?auto_20933 ) ) ( not ( = ?auto_20924 ?auto_20932 ) ) ( not ( = ?auto_20924 ?auto_20938 ) ) ( not ( = ?auto_20925 ?auto_20944 ) ) ( not ( = ?auto_20925 ?auto_20940 ) ) ( not ( = ?auto_20925 ?auto_20934 ) ) ( not ( = ?auto_20925 ?auto_20939 ) ) ( not ( = ?auto_20925 ?auto_20933 ) ) ( not ( = ?auto_20925 ?auto_20932 ) ) ( not ( = ?auto_20925 ?auto_20938 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_20916 ?auto_20917 ?auto_20918 ?auto_20919 ?auto_20920 ?auto_20921 ?auto_20922 ?auto_20923 )
      ( MAKE-1CRATE ?auto_20923 ?auto_20924 )
      ( MAKE-8CRATE-VERIFY ?auto_20916 ?auto_20917 ?auto_20918 ?auto_20919 ?auto_20920 ?auto_20921 ?auto_20922 ?auto_20923 ?auto_20924 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_20968 - SURFACE
      ?auto_20969 - SURFACE
      ?auto_20970 - SURFACE
      ?auto_20971 - SURFACE
      ?auto_20972 - SURFACE
      ?auto_20973 - SURFACE
      ?auto_20974 - SURFACE
      ?auto_20975 - SURFACE
      ?auto_20976 - SURFACE
      ?auto_20977 - SURFACE
    )
    :vars
    (
      ?auto_20979 - HOIST
      ?auto_20980 - PLACE
      ?auto_20981 - PLACE
      ?auto_20978 - HOIST
      ?auto_20982 - SURFACE
      ?auto_20993 - PLACE
      ?auto_20995 - HOIST
      ?auto_20992 - SURFACE
      ?auto_20998 - SURFACE
      ?auto_20997 - SURFACE
      ?auto_21001 - PLACE
      ?auto_20999 - HOIST
      ?auto_20985 - SURFACE
      ?auto_20990 - PLACE
      ?auto_20986 - HOIST
      ?auto_20989 - SURFACE
      ?auto_20984 - PLACE
      ?auto_20994 - HOIST
      ?auto_20988 - SURFACE
      ?auto_20996 - PLACE
      ?auto_20987 - HOIST
      ?auto_20991 - SURFACE
      ?auto_21000 - SURFACE
      ?auto_20983 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20979 ?auto_20980 ) ( IS-CRATE ?auto_20977 ) ( not ( = ?auto_20981 ?auto_20980 ) ) ( HOIST-AT ?auto_20978 ?auto_20981 ) ( SURFACE-AT ?auto_20977 ?auto_20981 ) ( ON ?auto_20977 ?auto_20982 ) ( CLEAR ?auto_20977 ) ( not ( = ?auto_20976 ?auto_20977 ) ) ( not ( = ?auto_20976 ?auto_20982 ) ) ( not ( = ?auto_20977 ?auto_20982 ) ) ( not ( = ?auto_20979 ?auto_20978 ) ) ( IS-CRATE ?auto_20976 ) ( not ( = ?auto_20993 ?auto_20980 ) ) ( HOIST-AT ?auto_20995 ?auto_20993 ) ( SURFACE-AT ?auto_20976 ?auto_20993 ) ( ON ?auto_20976 ?auto_20992 ) ( CLEAR ?auto_20976 ) ( not ( = ?auto_20975 ?auto_20976 ) ) ( not ( = ?auto_20975 ?auto_20992 ) ) ( not ( = ?auto_20976 ?auto_20992 ) ) ( not ( = ?auto_20979 ?auto_20995 ) ) ( IS-CRATE ?auto_20975 ) ( AVAILABLE ?auto_20978 ) ( SURFACE-AT ?auto_20975 ?auto_20981 ) ( ON ?auto_20975 ?auto_20998 ) ( CLEAR ?auto_20975 ) ( not ( = ?auto_20974 ?auto_20975 ) ) ( not ( = ?auto_20974 ?auto_20998 ) ) ( not ( = ?auto_20975 ?auto_20998 ) ) ( IS-CRATE ?auto_20974 ) ( SURFACE-AT ?auto_20974 ?auto_20993 ) ( ON ?auto_20974 ?auto_20997 ) ( CLEAR ?auto_20974 ) ( not ( = ?auto_20973 ?auto_20974 ) ) ( not ( = ?auto_20973 ?auto_20997 ) ) ( not ( = ?auto_20974 ?auto_20997 ) ) ( IS-CRATE ?auto_20973 ) ( not ( = ?auto_21001 ?auto_20980 ) ) ( HOIST-AT ?auto_20999 ?auto_21001 ) ( AVAILABLE ?auto_20999 ) ( SURFACE-AT ?auto_20973 ?auto_21001 ) ( ON ?auto_20973 ?auto_20985 ) ( CLEAR ?auto_20973 ) ( not ( = ?auto_20972 ?auto_20973 ) ) ( not ( = ?auto_20972 ?auto_20985 ) ) ( not ( = ?auto_20973 ?auto_20985 ) ) ( not ( = ?auto_20979 ?auto_20999 ) ) ( IS-CRATE ?auto_20972 ) ( not ( = ?auto_20990 ?auto_20980 ) ) ( HOIST-AT ?auto_20986 ?auto_20990 ) ( AVAILABLE ?auto_20986 ) ( SURFACE-AT ?auto_20972 ?auto_20990 ) ( ON ?auto_20972 ?auto_20989 ) ( CLEAR ?auto_20972 ) ( not ( = ?auto_20971 ?auto_20972 ) ) ( not ( = ?auto_20971 ?auto_20989 ) ) ( not ( = ?auto_20972 ?auto_20989 ) ) ( not ( = ?auto_20979 ?auto_20986 ) ) ( IS-CRATE ?auto_20971 ) ( not ( = ?auto_20984 ?auto_20980 ) ) ( HOIST-AT ?auto_20994 ?auto_20984 ) ( AVAILABLE ?auto_20994 ) ( SURFACE-AT ?auto_20971 ?auto_20984 ) ( ON ?auto_20971 ?auto_20988 ) ( CLEAR ?auto_20971 ) ( not ( = ?auto_20970 ?auto_20971 ) ) ( not ( = ?auto_20970 ?auto_20988 ) ) ( not ( = ?auto_20971 ?auto_20988 ) ) ( not ( = ?auto_20979 ?auto_20994 ) ) ( IS-CRATE ?auto_20970 ) ( not ( = ?auto_20996 ?auto_20980 ) ) ( HOIST-AT ?auto_20987 ?auto_20996 ) ( AVAILABLE ?auto_20987 ) ( SURFACE-AT ?auto_20970 ?auto_20996 ) ( ON ?auto_20970 ?auto_20991 ) ( CLEAR ?auto_20970 ) ( not ( = ?auto_20969 ?auto_20970 ) ) ( not ( = ?auto_20969 ?auto_20991 ) ) ( not ( = ?auto_20970 ?auto_20991 ) ) ( not ( = ?auto_20979 ?auto_20987 ) ) ( SURFACE-AT ?auto_20968 ?auto_20980 ) ( CLEAR ?auto_20968 ) ( IS-CRATE ?auto_20969 ) ( AVAILABLE ?auto_20979 ) ( AVAILABLE ?auto_20995 ) ( SURFACE-AT ?auto_20969 ?auto_20993 ) ( ON ?auto_20969 ?auto_21000 ) ( CLEAR ?auto_20969 ) ( TRUCK-AT ?auto_20983 ?auto_20980 ) ( not ( = ?auto_20968 ?auto_20969 ) ) ( not ( = ?auto_20968 ?auto_21000 ) ) ( not ( = ?auto_20969 ?auto_21000 ) ) ( not ( = ?auto_20968 ?auto_20970 ) ) ( not ( = ?auto_20968 ?auto_20991 ) ) ( not ( = ?auto_20970 ?auto_21000 ) ) ( not ( = ?auto_20996 ?auto_20993 ) ) ( not ( = ?auto_20987 ?auto_20995 ) ) ( not ( = ?auto_20991 ?auto_21000 ) ) ( not ( = ?auto_20968 ?auto_20971 ) ) ( not ( = ?auto_20968 ?auto_20988 ) ) ( not ( = ?auto_20969 ?auto_20971 ) ) ( not ( = ?auto_20969 ?auto_20988 ) ) ( not ( = ?auto_20971 ?auto_20991 ) ) ( not ( = ?auto_20971 ?auto_21000 ) ) ( not ( = ?auto_20984 ?auto_20996 ) ) ( not ( = ?auto_20984 ?auto_20993 ) ) ( not ( = ?auto_20994 ?auto_20987 ) ) ( not ( = ?auto_20994 ?auto_20995 ) ) ( not ( = ?auto_20988 ?auto_20991 ) ) ( not ( = ?auto_20988 ?auto_21000 ) ) ( not ( = ?auto_20968 ?auto_20972 ) ) ( not ( = ?auto_20968 ?auto_20989 ) ) ( not ( = ?auto_20969 ?auto_20972 ) ) ( not ( = ?auto_20969 ?auto_20989 ) ) ( not ( = ?auto_20970 ?auto_20972 ) ) ( not ( = ?auto_20970 ?auto_20989 ) ) ( not ( = ?auto_20972 ?auto_20988 ) ) ( not ( = ?auto_20972 ?auto_20991 ) ) ( not ( = ?auto_20972 ?auto_21000 ) ) ( not ( = ?auto_20990 ?auto_20984 ) ) ( not ( = ?auto_20990 ?auto_20996 ) ) ( not ( = ?auto_20990 ?auto_20993 ) ) ( not ( = ?auto_20986 ?auto_20994 ) ) ( not ( = ?auto_20986 ?auto_20987 ) ) ( not ( = ?auto_20986 ?auto_20995 ) ) ( not ( = ?auto_20989 ?auto_20988 ) ) ( not ( = ?auto_20989 ?auto_20991 ) ) ( not ( = ?auto_20989 ?auto_21000 ) ) ( not ( = ?auto_20968 ?auto_20973 ) ) ( not ( = ?auto_20968 ?auto_20985 ) ) ( not ( = ?auto_20969 ?auto_20973 ) ) ( not ( = ?auto_20969 ?auto_20985 ) ) ( not ( = ?auto_20970 ?auto_20973 ) ) ( not ( = ?auto_20970 ?auto_20985 ) ) ( not ( = ?auto_20971 ?auto_20973 ) ) ( not ( = ?auto_20971 ?auto_20985 ) ) ( not ( = ?auto_20973 ?auto_20989 ) ) ( not ( = ?auto_20973 ?auto_20988 ) ) ( not ( = ?auto_20973 ?auto_20991 ) ) ( not ( = ?auto_20973 ?auto_21000 ) ) ( not ( = ?auto_21001 ?auto_20990 ) ) ( not ( = ?auto_21001 ?auto_20984 ) ) ( not ( = ?auto_21001 ?auto_20996 ) ) ( not ( = ?auto_21001 ?auto_20993 ) ) ( not ( = ?auto_20999 ?auto_20986 ) ) ( not ( = ?auto_20999 ?auto_20994 ) ) ( not ( = ?auto_20999 ?auto_20987 ) ) ( not ( = ?auto_20999 ?auto_20995 ) ) ( not ( = ?auto_20985 ?auto_20989 ) ) ( not ( = ?auto_20985 ?auto_20988 ) ) ( not ( = ?auto_20985 ?auto_20991 ) ) ( not ( = ?auto_20985 ?auto_21000 ) ) ( not ( = ?auto_20968 ?auto_20974 ) ) ( not ( = ?auto_20968 ?auto_20997 ) ) ( not ( = ?auto_20969 ?auto_20974 ) ) ( not ( = ?auto_20969 ?auto_20997 ) ) ( not ( = ?auto_20970 ?auto_20974 ) ) ( not ( = ?auto_20970 ?auto_20997 ) ) ( not ( = ?auto_20971 ?auto_20974 ) ) ( not ( = ?auto_20971 ?auto_20997 ) ) ( not ( = ?auto_20972 ?auto_20974 ) ) ( not ( = ?auto_20972 ?auto_20997 ) ) ( not ( = ?auto_20974 ?auto_20985 ) ) ( not ( = ?auto_20974 ?auto_20989 ) ) ( not ( = ?auto_20974 ?auto_20988 ) ) ( not ( = ?auto_20974 ?auto_20991 ) ) ( not ( = ?auto_20974 ?auto_21000 ) ) ( not ( = ?auto_20997 ?auto_20985 ) ) ( not ( = ?auto_20997 ?auto_20989 ) ) ( not ( = ?auto_20997 ?auto_20988 ) ) ( not ( = ?auto_20997 ?auto_20991 ) ) ( not ( = ?auto_20997 ?auto_21000 ) ) ( not ( = ?auto_20968 ?auto_20975 ) ) ( not ( = ?auto_20968 ?auto_20998 ) ) ( not ( = ?auto_20969 ?auto_20975 ) ) ( not ( = ?auto_20969 ?auto_20998 ) ) ( not ( = ?auto_20970 ?auto_20975 ) ) ( not ( = ?auto_20970 ?auto_20998 ) ) ( not ( = ?auto_20971 ?auto_20975 ) ) ( not ( = ?auto_20971 ?auto_20998 ) ) ( not ( = ?auto_20972 ?auto_20975 ) ) ( not ( = ?auto_20972 ?auto_20998 ) ) ( not ( = ?auto_20973 ?auto_20975 ) ) ( not ( = ?auto_20973 ?auto_20998 ) ) ( not ( = ?auto_20975 ?auto_20997 ) ) ( not ( = ?auto_20975 ?auto_20985 ) ) ( not ( = ?auto_20975 ?auto_20989 ) ) ( not ( = ?auto_20975 ?auto_20988 ) ) ( not ( = ?auto_20975 ?auto_20991 ) ) ( not ( = ?auto_20975 ?auto_21000 ) ) ( not ( = ?auto_20981 ?auto_20993 ) ) ( not ( = ?auto_20981 ?auto_21001 ) ) ( not ( = ?auto_20981 ?auto_20990 ) ) ( not ( = ?auto_20981 ?auto_20984 ) ) ( not ( = ?auto_20981 ?auto_20996 ) ) ( not ( = ?auto_20978 ?auto_20995 ) ) ( not ( = ?auto_20978 ?auto_20999 ) ) ( not ( = ?auto_20978 ?auto_20986 ) ) ( not ( = ?auto_20978 ?auto_20994 ) ) ( not ( = ?auto_20978 ?auto_20987 ) ) ( not ( = ?auto_20998 ?auto_20997 ) ) ( not ( = ?auto_20998 ?auto_20985 ) ) ( not ( = ?auto_20998 ?auto_20989 ) ) ( not ( = ?auto_20998 ?auto_20988 ) ) ( not ( = ?auto_20998 ?auto_20991 ) ) ( not ( = ?auto_20998 ?auto_21000 ) ) ( not ( = ?auto_20968 ?auto_20976 ) ) ( not ( = ?auto_20968 ?auto_20992 ) ) ( not ( = ?auto_20969 ?auto_20976 ) ) ( not ( = ?auto_20969 ?auto_20992 ) ) ( not ( = ?auto_20970 ?auto_20976 ) ) ( not ( = ?auto_20970 ?auto_20992 ) ) ( not ( = ?auto_20971 ?auto_20976 ) ) ( not ( = ?auto_20971 ?auto_20992 ) ) ( not ( = ?auto_20972 ?auto_20976 ) ) ( not ( = ?auto_20972 ?auto_20992 ) ) ( not ( = ?auto_20973 ?auto_20976 ) ) ( not ( = ?auto_20973 ?auto_20992 ) ) ( not ( = ?auto_20974 ?auto_20976 ) ) ( not ( = ?auto_20974 ?auto_20992 ) ) ( not ( = ?auto_20976 ?auto_20998 ) ) ( not ( = ?auto_20976 ?auto_20997 ) ) ( not ( = ?auto_20976 ?auto_20985 ) ) ( not ( = ?auto_20976 ?auto_20989 ) ) ( not ( = ?auto_20976 ?auto_20988 ) ) ( not ( = ?auto_20976 ?auto_20991 ) ) ( not ( = ?auto_20976 ?auto_21000 ) ) ( not ( = ?auto_20992 ?auto_20998 ) ) ( not ( = ?auto_20992 ?auto_20997 ) ) ( not ( = ?auto_20992 ?auto_20985 ) ) ( not ( = ?auto_20992 ?auto_20989 ) ) ( not ( = ?auto_20992 ?auto_20988 ) ) ( not ( = ?auto_20992 ?auto_20991 ) ) ( not ( = ?auto_20992 ?auto_21000 ) ) ( not ( = ?auto_20968 ?auto_20977 ) ) ( not ( = ?auto_20968 ?auto_20982 ) ) ( not ( = ?auto_20969 ?auto_20977 ) ) ( not ( = ?auto_20969 ?auto_20982 ) ) ( not ( = ?auto_20970 ?auto_20977 ) ) ( not ( = ?auto_20970 ?auto_20982 ) ) ( not ( = ?auto_20971 ?auto_20977 ) ) ( not ( = ?auto_20971 ?auto_20982 ) ) ( not ( = ?auto_20972 ?auto_20977 ) ) ( not ( = ?auto_20972 ?auto_20982 ) ) ( not ( = ?auto_20973 ?auto_20977 ) ) ( not ( = ?auto_20973 ?auto_20982 ) ) ( not ( = ?auto_20974 ?auto_20977 ) ) ( not ( = ?auto_20974 ?auto_20982 ) ) ( not ( = ?auto_20975 ?auto_20977 ) ) ( not ( = ?auto_20975 ?auto_20982 ) ) ( not ( = ?auto_20977 ?auto_20992 ) ) ( not ( = ?auto_20977 ?auto_20998 ) ) ( not ( = ?auto_20977 ?auto_20997 ) ) ( not ( = ?auto_20977 ?auto_20985 ) ) ( not ( = ?auto_20977 ?auto_20989 ) ) ( not ( = ?auto_20977 ?auto_20988 ) ) ( not ( = ?auto_20977 ?auto_20991 ) ) ( not ( = ?auto_20977 ?auto_21000 ) ) ( not ( = ?auto_20982 ?auto_20992 ) ) ( not ( = ?auto_20982 ?auto_20998 ) ) ( not ( = ?auto_20982 ?auto_20997 ) ) ( not ( = ?auto_20982 ?auto_20985 ) ) ( not ( = ?auto_20982 ?auto_20989 ) ) ( not ( = ?auto_20982 ?auto_20988 ) ) ( not ( = ?auto_20982 ?auto_20991 ) ) ( not ( = ?auto_20982 ?auto_21000 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_20968 ?auto_20969 ?auto_20970 ?auto_20971 ?auto_20972 ?auto_20973 ?auto_20974 ?auto_20975 ?auto_20976 )
      ( MAKE-1CRATE ?auto_20976 ?auto_20977 )
      ( MAKE-9CRATE-VERIFY ?auto_20968 ?auto_20969 ?auto_20970 ?auto_20971 ?auto_20972 ?auto_20973 ?auto_20974 ?auto_20975 ?auto_20976 ?auto_20977 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_21023 - SURFACE
      ?auto_21024 - SURFACE
      ?auto_21025 - SURFACE
      ?auto_21026 - SURFACE
      ?auto_21027 - SURFACE
      ?auto_21028 - SURFACE
      ?auto_21029 - SURFACE
      ?auto_21030 - SURFACE
      ?auto_21031 - SURFACE
      ?auto_21032 - SURFACE
      ?auto_21033 - SURFACE
    )
    :vars
    (
      ?auto_21038 - HOIST
      ?auto_21035 - PLACE
      ?auto_21039 - PLACE
      ?auto_21037 - HOIST
      ?auto_21036 - SURFACE
      ?auto_21046 - PLACE
      ?auto_21052 - HOIST
      ?auto_21050 - SURFACE
      ?auto_21056 - PLACE
      ?auto_21048 - HOIST
      ?auto_21051 - SURFACE
      ?auto_21049 - SURFACE
      ?auto_21055 - SURFACE
      ?auto_21040 - PLACE
      ?auto_21042 - HOIST
      ?auto_21045 - SURFACE
      ?auto_21053 - PLACE
      ?auto_21043 - HOIST
      ?auto_21057 - SURFACE
      ?auto_21054 - SURFACE
      ?auto_21058 - PLACE
      ?auto_21041 - HOIST
      ?auto_21044 - SURFACE
      ?auto_21047 - SURFACE
      ?auto_21034 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21038 ?auto_21035 ) ( IS-CRATE ?auto_21033 ) ( not ( = ?auto_21039 ?auto_21035 ) ) ( HOIST-AT ?auto_21037 ?auto_21039 ) ( SURFACE-AT ?auto_21033 ?auto_21039 ) ( ON ?auto_21033 ?auto_21036 ) ( CLEAR ?auto_21033 ) ( not ( = ?auto_21032 ?auto_21033 ) ) ( not ( = ?auto_21032 ?auto_21036 ) ) ( not ( = ?auto_21033 ?auto_21036 ) ) ( not ( = ?auto_21038 ?auto_21037 ) ) ( IS-CRATE ?auto_21032 ) ( not ( = ?auto_21046 ?auto_21035 ) ) ( HOIST-AT ?auto_21052 ?auto_21046 ) ( SURFACE-AT ?auto_21032 ?auto_21046 ) ( ON ?auto_21032 ?auto_21050 ) ( CLEAR ?auto_21032 ) ( not ( = ?auto_21031 ?auto_21032 ) ) ( not ( = ?auto_21031 ?auto_21050 ) ) ( not ( = ?auto_21032 ?auto_21050 ) ) ( not ( = ?auto_21038 ?auto_21052 ) ) ( IS-CRATE ?auto_21031 ) ( not ( = ?auto_21056 ?auto_21035 ) ) ( HOIST-AT ?auto_21048 ?auto_21056 ) ( SURFACE-AT ?auto_21031 ?auto_21056 ) ( ON ?auto_21031 ?auto_21051 ) ( CLEAR ?auto_21031 ) ( not ( = ?auto_21030 ?auto_21031 ) ) ( not ( = ?auto_21030 ?auto_21051 ) ) ( not ( = ?auto_21031 ?auto_21051 ) ) ( not ( = ?auto_21038 ?auto_21048 ) ) ( IS-CRATE ?auto_21030 ) ( AVAILABLE ?auto_21052 ) ( SURFACE-AT ?auto_21030 ?auto_21046 ) ( ON ?auto_21030 ?auto_21049 ) ( CLEAR ?auto_21030 ) ( not ( = ?auto_21029 ?auto_21030 ) ) ( not ( = ?auto_21029 ?auto_21049 ) ) ( not ( = ?auto_21030 ?auto_21049 ) ) ( IS-CRATE ?auto_21029 ) ( SURFACE-AT ?auto_21029 ?auto_21056 ) ( ON ?auto_21029 ?auto_21055 ) ( CLEAR ?auto_21029 ) ( not ( = ?auto_21028 ?auto_21029 ) ) ( not ( = ?auto_21028 ?auto_21055 ) ) ( not ( = ?auto_21029 ?auto_21055 ) ) ( IS-CRATE ?auto_21028 ) ( not ( = ?auto_21040 ?auto_21035 ) ) ( HOIST-AT ?auto_21042 ?auto_21040 ) ( AVAILABLE ?auto_21042 ) ( SURFACE-AT ?auto_21028 ?auto_21040 ) ( ON ?auto_21028 ?auto_21045 ) ( CLEAR ?auto_21028 ) ( not ( = ?auto_21027 ?auto_21028 ) ) ( not ( = ?auto_21027 ?auto_21045 ) ) ( not ( = ?auto_21028 ?auto_21045 ) ) ( not ( = ?auto_21038 ?auto_21042 ) ) ( IS-CRATE ?auto_21027 ) ( not ( = ?auto_21053 ?auto_21035 ) ) ( HOIST-AT ?auto_21043 ?auto_21053 ) ( AVAILABLE ?auto_21043 ) ( SURFACE-AT ?auto_21027 ?auto_21053 ) ( ON ?auto_21027 ?auto_21057 ) ( CLEAR ?auto_21027 ) ( not ( = ?auto_21026 ?auto_21027 ) ) ( not ( = ?auto_21026 ?auto_21057 ) ) ( not ( = ?auto_21027 ?auto_21057 ) ) ( not ( = ?auto_21038 ?auto_21043 ) ) ( IS-CRATE ?auto_21026 ) ( AVAILABLE ?auto_21037 ) ( SURFACE-AT ?auto_21026 ?auto_21039 ) ( ON ?auto_21026 ?auto_21054 ) ( CLEAR ?auto_21026 ) ( not ( = ?auto_21025 ?auto_21026 ) ) ( not ( = ?auto_21025 ?auto_21054 ) ) ( not ( = ?auto_21026 ?auto_21054 ) ) ( IS-CRATE ?auto_21025 ) ( not ( = ?auto_21058 ?auto_21035 ) ) ( HOIST-AT ?auto_21041 ?auto_21058 ) ( AVAILABLE ?auto_21041 ) ( SURFACE-AT ?auto_21025 ?auto_21058 ) ( ON ?auto_21025 ?auto_21044 ) ( CLEAR ?auto_21025 ) ( not ( = ?auto_21024 ?auto_21025 ) ) ( not ( = ?auto_21024 ?auto_21044 ) ) ( not ( = ?auto_21025 ?auto_21044 ) ) ( not ( = ?auto_21038 ?auto_21041 ) ) ( SURFACE-AT ?auto_21023 ?auto_21035 ) ( CLEAR ?auto_21023 ) ( IS-CRATE ?auto_21024 ) ( AVAILABLE ?auto_21038 ) ( AVAILABLE ?auto_21048 ) ( SURFACE-AT ?auto_21024 ?auto_21056 ) ( ON ?auto_21024 ?auto_21047 ) ( CLEAR ?auto_21024 ) ( TRUCK-AT ?auto_21034 ?auto_21035 ) ( not ( = ?auto_21023 ?auto_21024 ) ) ( not ( = ?auto_21023 ?auto_21047 ) ) ( not ( = ?auto_21024 ?auto_21047 ) ) ( not ( = ?auto_21023 ?auto_21025 ) ) ( not ( = ?auto_21023 ?auto_21044 ) ) ( not ( = ?auto_21025 ?auto_21047 ) ) ( not ( = ?auto_21058 ?auto_21056 ) ) ( not ( = ?auto_21041 ?auto_21048 ) ) ( not ( = ?auto_21044 ?auto_21047 ) ) ( not ( = ?auto_21023 ?auto_21026 ) ) ( not ( = ?auto_21023 ?auto_21054 ) ) ( not ( = ?auto_21024 ?auto_21026 ) ) ( not ( = ?auto_21024 ?auto_21054 ) ) ( not ( = ?auto_21026 ?auto_21044 ) ) ( not ( = ?auto_21026 ?auto_21047 ) ) ( not ( = ?auto_21039 ?auto_21058 ) ) ( not ( = ?auto_21039 ?auto_21056 ) ) ( not ( = ?auto_21037 ?auto_21041 ) ) ( not ( = ?auto_21037 ?auto_21048 ) ) ( not ( = ?auto_21054 ?auto_21044 ) ) ( not ( = ?auto_21054 ?auto_21047 ) ) ( not ( = ?auto_21023 ?auto_21027 ) ) ( not ( = ?auto_21023 ?auto_21057 ) ) ( not ( = ?auto_21024 ?auto_21027 ) ) ( not ( = ?auto_21024 ?auto_21057 ) ) ( not ( = ?auto_21025 ?auto_21027 ) ) ( not ( = ?auto_21025 ?auto_21057 ) ) ( not ( = ?auto_21027 ?auto_21054 ) ) ( not ( = ?auto_21027 ?auto_21044 ) ) ( not ( = ?auto_21027 ?auto_21047 ) ) ( not ( = ?auto_21053 ?auto_21039 ) ) ( not ( = ?auto_21053 ?auto_21058 ) ) ( not ( = ?auto_21053 ?auto_21056 ) ) ( not ( = ?auto_21043 ?auto_21037 ) ) ( not ( = ?auto_21043 ?auto_21041 ) ) ( not ( = ?auto_21043 ?auto_21048 ) ) ( not ( = ?auto_21057 ?auto_21054 ) ) ( not ( = ?auto_21057 ?auto_21044 ) ) ( not ( = ?auto_21057 ?auto_21047 ) ) ( not ( = ?auto_21023 ?auto_21028 ) ) ( not ( = ?auto_21023 ?auto_21045 ) ) ( not ( = ?auto_21024 ?auto_21028 ) ) ( not ( = ?auto_21024 ?auto_21045 ) ) ( not ( = ?auto_21025 ?auto_21028 ) ) ( not ( = ?auto_21025 ?auto_21045 ) ) ( not ( = ?auto_21026 ?auto_21028 ) ) ( not ( = ?auto_21026 ?auto_21045 ) ) ( not ( = ?auto_21028 ?auto_21057 ) ) ( not ( = ?auto_21028 ?auto_21054 ) ) ( not ( = ?auto_21028 ?auto_21044 ) ) ( not ( = ?auto_21028 ?auto_21047 ) ) ( not ( = ?auto_21040 ?auto_21053 ) ) ( not ( = ?auto_21040 ?auto_21039 ) ) ( not ( = ?auto_21040 ?auto_21058 ) ) ( not ( = ?auto_21040 ?auto_21056 ) ) ( not ( = ?auto_21042 ?auto_21043 ) ) ( not ( = ?auto_21042 ?auto_21037 ) ) ( not ( = ?auto_21042 ?auto_21041 ) ) ( not ( = ?auto_21042 ?auto_21048 ) ) ( not ( = ?auto_21045 ?auto_21057 ) ) ( not ( = ?auto_21045 ?auto_21054 ) ) ( not ( = ?auto_21045 ?auto_21044 ) ) ( not ( = ?auto_21045 ?auto_21047 ) ) ( not ( = ?auto_21023 ?auto_21029 ) ) ( not ( = ?auto_21023 ?auto_21055 ) ) ( not ( = ?auto_21024 ?auto_21029 ) ) ( not ( = ?auto_21024 ?auto_21055 ) ) ( not ( = ?auto_21025 ?auto_21029 ) ) ( not ( = ?auto_21025 ?auto_21055 ) ) ( not ( = ?auto_21026 ?auto_21029 ) ) ( not ( = ?auto_21026 ?auto_21055 ) ) ( not ( = ?auto_21027 ?auto_21029 ) ) ( not ( = ?auto_21027 ?auto_21055 ) ) ( not ( = ?auto_21029 ?auto_21045 ) ) ( not ( = ?auto_21029 ?auto_21057 ) ) ( not ( = ?auto_21029 ?auto_21054 ) ) ( not ( = ?auto_21029 ?auto_21044 ) ) ( not ( = ?auto_21029 ?auto_21047 ) ) ( not ( = ?auto_21055 ?auto_21045 ) ) ( not ( = ?auto_21055 ?auto_21057 ) ) ( not ( = ?auto_21055 ?auto_21054 ) ) ( not ( = ?auto_21055 ?auto_21044 ) ) ( not ( = ?auto_21055 ?auto_21047 ) ) ( not ( = ?auto_21023 ?auto_21030 ) ) ( not ( = ?auto_21023 ?auto_21049 ) ) ( not ( = ?auto_21024 ?auto_21030 ) ) ( not ( = ?auto_21024 ?auto_21049 ) ) ( not ( = ?auto_21025 ?auto_21030 ) ) ( not ( = ?auto_21025 ?auto_21049 ) ) ( not ( = ?auto_21026 ?auto_21030 ) ) ( not ( = ?auto_21026 ?auto_21049 ) ) ( not ( = ?auto_21027 ?auto_21030 ) ) ( not ( = ?auto_21027 ?auto_21049 ) ) ( not ( = ?auto_21028 ?auto_21030 ) ) ( not ( = ?auto_21028 ?auto_21049 ) ) ( not ( = ?auto_21030 ?auto_21055 ) ) ( not ( = ?auto_21030 ?auto_21045 ) ) ( not ( = ?auto_21030 ?auto_21057 ) ) ( not ( = ?auto_21030 ?auto_21054 ) ) ( not ( = ?auto_21030 ?auto_21044 ) ) ( not ( = ?auto_21030 ?auto_21047 ) ) ( not ( = ?auto_21046 ?auto_21056 ) ) ( not ( = ?auto_21046 ?auto_21040 ) ) ( not ( = ?auto_21046 ?auto_21053 ) ) ( not ( = ?auto_21046 ?auto_21039 ) ) ( not ( = ?auto_21046 ?auto_21058 ) ) ( not ( = ?auto_21052 ?auto_21048 ) ) ( not ( = ?auto_21052 ?auto_21042 ) ) ( not ( = ?auto_21052 ?auto_21043 ) ) ( not ( = ?auto_21052 ?auto_21037 ) ) ( not ( = ?auto_21052 ?auto_21041 ) ) ( not ( = ?auto_21049 ?auto_21055 ) ) ( not ( = ?auto_21049 ?auto_21045 ) ) ( not ( = ?auto_21049 ?auto_21057 ) ) ( not ( = ?auto_21049 ?auto_21054 ) ) ( not ( = ?auto_21049 ?auto_21044 ) ) ( not ( = ?auto_21049 ?auto_21047 ) ) ( not ( = ?auto_21023 ?auto_21031 ) ) ( not ( = ?auto_21023 ?auto_21051 ) ) ( not ( = ?auto_21024 ?auto_21031 ) ) ( not ( = ?auto_21024 ?auto_21051 ) ) ( not ( = ?auto_21025 ?auto_21031 ) ) ( not ( = ?auto_21025 ?auto_21051 ) ) ( not ( = ?auto_21026 ?auto_21031 ) ) ( not ( = ?auto_21026 ?auto_21051 ) ) ( not ( = ?auto_21027 ?auto_21031 ) ) ( not ( = ?auto_21027 ?auto_21051 ) ) ( not ( = ?auto_21028 ?auto_21031 ) ) ( not ( = ?auto_21028 ?auto_21051 ) ) ( not ( = ?auto_21029 ?auto_21031 ) ) ( not ( = ?auto_21029 ?auto_21051 ) ) ( not ( = ?auto_21031 ?auto_21049 ) ) ( not ( = ?auto_21031 ?auto_21055 ) ) ( not ( = ?auto_21031 ?auto_21045 ) ) ( not ( = ?auto_21031 ?auto_21057 ) ) ( not ( = ?auto_21031 ?auto_21054 ) ) ( not ( = ?auto_21031 ?auto_21044 ) ) ( not ( = ?auto_21031 ?auto_21047 ) ) ( not ( = ?auto_21051 ?auto_21049 ) ) ( not ( = ?auto_21051 ?auto_21055 ) ) ( not ( = ?auto_21051 ?auto_21045 ) ) ( not ( = ?auto_21051 ?auto_21057 ) ) ( not ( = ?auto_21051 ?auto_21054 ) ) ( not ( = ?auto_21051 ?auto_21044 ) ) ( not ( = ?auto_21051 ?auto_21047 ) ) ( not ( = ?auto_21023 ?auto_21032 ) ) ( not ( = ?auto_21023 ?auto_21050 ) ) ( not ( = ?auto_21024 ?auto_21032 ) ) ( not ( = ?auto_21024 ?auto_21050 ) ) ( not ( = ?auto_21025 ?auto_21032 ) ) ( not ( = ?auto_21025 ?auto_21050 ) ) ( not ( = ?auto_21026 ?auto_21032 ) ) ( not ( = ?auto_21026 ?auto_21050 ) ) ( not ( = ?auto_21027 ?auto_21032 ) ) ( not ( = ?auto_21027 ?auto_21050 ) ) ( not ( = ?auto_21028 ?auto_21032 ) ) ( not ( = ?auto_21028 ?auto_21050 ) ) ( not ( = ?auto_21029 ?auto_21032 ) ) ( not ( = ?auto_21029 ?auto_21050 ) ) ( not ( = ?auto_21030 ?auto_21032 ) ) ( not ( = ?auto_21030 ?auto_21050 ) ) ( not ( = ?auto_21032 ?auto_21051 ) ) ( not ( = ?auto_21032 ?auto_21049 ) ) ( not ( = ?auto_21032 ?auto_21055 ) ) ( not ( = ?auto_21032 ?auto_21045 ) ) ( not ( = ?auto_21032 ?auto_21057 ) ) ( not ( = ?auto_21032 ?auto_21054 ) ) ( not ( = ?auto_21032 ?auto_21044 ) ) ( not ( = ?auto_21032 ?auto_21047 ) ) ( not ( = ?auto_21050 ?auto_21051 ) ) ( not ( = ?auto_21050 ?auto_21049 ) ) ( not ( = ?auto_21050 ?auto_21055 ) ) ( not ( = ?auto_21050 ?auto_21045 ) ) ( not ( = ?auto_21050 ?auto_21057 ) ) ( not ( = ?auto_21050 ?auto_21054 ) ) ( not ( = ?auto_21050 ?auto_21044 ) ) ( not ( = ?auto_21050 ?auto_21047 ) ) ( not ( = ?auto_21023 ?auto_21033 ) ) ( not ( = ?auto_21023 ?auto_21036 ) ) ( not ( = ?auto_21024 ?auto_21033 ) ) ( not ( = ?auto_21024 ?auto_21036 ) ) ( not ( = ?auto_21025 ?auto_21033 ) ) ( not ( = ?auto_21025 ?auto_21036 ) ) ( not ( = ?auto_21026 ?auto_21033 ) ) ( not ( = ?auto_21026 ?auto_21036 ) ) ( not ( = ?auto_21027 ?auto_21033 ) ) ( not ( = ?auto_21027 ?auto_21036 ) ) ( not ( = ?auto_21028 ?auto_21033 ) ) ( not ( = ?auto_21028 ?auto_21036 ) ) ( not ( = ?auto_21029 ?auto_21033 ) ) ( not ( = ?auto_21029 ?auto_21036 ) ) ( not ( = ?auto_21030 ?auto_21033 ) ) ( not ( = ?auto_21030 ?auto_21036 ) ) ( not ( = ?auto_21031 ?auto_21033 ) ) ( not ( = ?auto_21031 ?auto_21036 ) ) ( not ( = ?auto_21033 ?auto_21050 ) ) ( not ( = ?auto_21033 ?auto_21051 ) ) ( not ( = ?auto_21033 ?auto_21049 ) ) ( not ( = ?auto_21033 ?auto_21055 ) ) ( not ( = ?auto_21033 ?auto_21045 ) ) ( not ( = ?auto_21033 ?auto_21057 ) ) ( not ( = ?auto_21033 ?auto_21054 ) ) ( not ( = ?auto_21033 ?auto_21044 ) ) ( not ( = ?auto_21033 ?auto_21047 ) ) ( not ( = ?auto_21036 ?auto_21050 ) ) ( not ( = ?auto_21036 ?auto_21051 ) ) ( not ( = ?auto_21036 ?auto_21049 ) ) ( not ( = ?auto_21036 ?auto_21055 ) ) ( not ( = ?auto_21036 ?auto_21045 ) ) ( not ( = ?auto_21036 ?auto_21057 ) ) ( not ( = ?auto_21036 ?auto_21054 ) ) ( not ( = ?auto_21036 ?auto_21044 ) ) ( not ( = ?auto_21036 ?auto_21047 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_21023 ?auto_21024 ?auto_21025 ?auto_21026 ?auto_21027 ?auto_21028 ?auto_21029 ?auto_21030 ?auto_21031 ?auto_21032 )
      ( MAKE-1CRATE ?auto_21032 ?auto_21033 )
      ( MAKE-10CRATE-VERIFY ?auto_21023 ?auto_21024 ?auto_21025 ?auto_21026 ?auto_21027 ?auto_21028 ?auto_21029 ?auto_21030 ?auto_21031 ?auto_21032 ?auto_21033 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_21081 - SURFACE
      ?auto_21082 - SURFACE
      ?auto_21083 - SURFACE
      ?auto_21084 - SURFACE
      ?auto_21085 - SURFACE
      ?auto_21086 - SURFACE
      ?auto_21087 - SURFACE
      ?auto_21088 - SURFACE
      ?auto_21089 - SURFACE
      ?auto_21090 - SURFACE
      ?auto_21091 - SURFACE
      ?auto_21092 - SURFACE
    )
    :vars
    (
      ?auto_21095 - HOIST
      ?auto_21097 - PLACE
      ?auto_21093 - PLACE
      ?auto_21094 - HOIST
      ?auto_21096 - SURFACE
      ?auto_21102 - PLACE
      ?auto_21105 - HOIST
      ?auto_21118 - SURFACE
      ?auto_21107 - SURFACE
      ?auto_21113 - PLACE
      ?auto_21103 - HOIST
      ?auto_21112 - SURFACE
      ?auto_21108 - SURFACE
      ?auto_21109 - SURFACE
      ?auto_21101 - PLACE
      ?auto_21115 - HOIST
      ?auto_21110 - SURFACE
      ?auto_21099 - PLACE
      ?auto_21104 - HOIST
      ?auto_21117 - SURFACE
      ?auto_21114 - SURFACE
      ?auto_21111 - PLACE
      ?auto_21106 - HOIST
      ?auto_21100 - SURFACE
      ?auto_21116 - SURFACE
      ?auto_21098 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21095 ?auto_21097 ) ( IS-CRATE ?auto_21092 ) ( not ( = ?auto_21093 ?auto_21097 ) ) ( HOIST-AT ?auto_21094 ?auto_21093 ) ( SURFACE-AT ?auto_21092 ?auto_21093 ) ( ON ?auto_21092 ?auto_21096 ) ( CLEAR ?auto_21092 ) ( not ( = ?auto_21091 ?auto_21092 ) ) ( not ( = ?auto_21091 ?auto_21096 ) ) ( not ( = ?auto_21092 ?auto_21096 ) ) ( not ( = ?auto_21095 ?auto_21094 ) ) ( IS-CRATE ?auto_21091 ) ( not ( = ?auto_21102 ?auto_21097 ) ) ( HOIST-AT ?auto_21105 ?auto_21102 ) ( SURFACE-AT ?auto_21091 ?auto_21102 ) ( ON ?auto_21091 ?auto_21118 ) ( CLEAR ?auto_21091 ) ( not ( = ?auto_21090 ?auto_21091 ) ) ( not ( = ?auto_21090 ?auto_21118 ) ) ( not ( = ?auto_21091 ?auto_21118 ) ) ( not ( = ?auto_21095 ?auto_21105 ) ) ( IS-CRATE ?auto_21090 ) ( SURFACE-AT ?auto_21090 ?auto_21093 ) ( ON ?auto_21090 ?auto_21107 ) ( CLEAR ?auto_21090 ) ( not ( = ?auto_21089 ?auto_21090 ) ) ( not ( = ?auto_21089 ?auto_21107 ) ) ( not ( = ?auto_21090 ?auto_21107 ) ) ( IS-CRATE ?auto_21089 ) ( not ( = ?auto_21113 ?auto_21097 ) ) ( HOIST-AT ?auto_21103 ?auto_21113 ) ( SURFACE-AT ?auto_21089 ?auto_21113 ) ( ON ?auto_21089 ?auto_21112 ) ( CLEAR ?auto_21089 ) ( not ( = ?auto_21088 ?auto_21089 ) ) ( not ( = ?auto_21088 ?auto_21112 ) ) ( not ( = ?auto_21089 ?auto_21112 ) ) ( not ( = ?auto_21095 ?auto_21103 ) ) ( IS-CRATE ?auto_21088 ) ( AVAILABLE ?auto_21094 ) ( SURFACE-AT ?auto_21088 ?auto_21093 ) ( ON ?auto_21088 ?auto_21108 ) ( CLEAR ?auto_21088 ) ( not ( = ?auto_21087 ?auto_21088 ) ) ( not ( = ?auto_21087 ?auto_21108 ) ) ( not ( = ?auto_21088 ?auto_21108 ) ) ( IS-CRATE ?auto_21087 ) ( SURFACE-AT ?auto_21087 ?auto_21113 ) ( ON ?auto_21087 ?auto_21109 ) ( CLEAR ?auto_21087 ) ( not ( = ?auto_21086 ?auto_21087 ) ) ( not ( = ?auto_21086 ?auto_21109 ) ) ( not ( = ?auto_21087 ?auto_21109 ) ) ( IS-CRATE ?auto_21086 ) ( not ( = ?auto_21101 ?auto_21097 ) ) ( HOIST-AT ?auto_21115 ?auto_21101 ) ( AVAILABLE ?auto_21115 ) ( SURFACE-AT ?auto_21086 ?auto_21101 ) ( ON ?auto_21086 ?auto_21110 ) ( CLEAR ?auto_21086 ) ( not ( = ?auto_21085 ?auto_21086 ) ) ( not ( = ?auto_21085 ?auto_21110 ) ) ( not ( = ?auto_21086 ?auto_21110 ) ) ( not ( = ?auto_21095 ?auto_21115 ) ) ( IS-CRATE ?auto_21085 ) ( not ( = ?auto_21099 ?auto_21097 ) ) ( HOIST-AT ?auto_21104 ?auto_21099 ) ( AVAILABLE ?auto_21104 ) ( SURFACE-AT ?auto_21085 ?auto_21099 ) ( ON ?auto_21085 ?auto_21117 ) ( CLEAR ?auto_21085 ) ( not ( = ?auto_21084 ?auto_21085 ) ) ( not ( = ?auto_21084 ?auto_21117 ) ) ( not ( = ?auto_21085 ?auto_21117 ) ) ( not ( = ?auto_21095 ?auto_21104 ) ) ( IS-CRATE ?auto_21084 ) ( AVAILABLE ?auto_21105 ) ( SURFACE-AT ?auto_21084 ?auto_21102 ) ( ON ?auto_21084 ?auto_21114 ) ( CLEAR ?auto_21084 ) ( not ( = ?auto_21083 ?auto_21084 ) ) ( not ( = ?auto_21083 ?auto_21114 ) ) ( not ( = ?auto_21084 ?auto_21114 ) ) ( IS-CRATE ?auto_21083 ) ( not ( = ?auto_21111 ?auto_21097 ) ) ( HOIST-AT ?auto_21106 ?auto_21111 ) ( AVAILABLE ?auto_21106 ) ( SURFACE-AT ?auto_21083 ?auto_21111 ) ( ON ?auto_21083 ?auto_21100 ) ( CLEAR ?auto_21083 ) ( not ( = ?auto_21082 ?auto_21083 ) ) ( not ( = ?auto_21082 ?auto_21100 ) ) ( not ( = ?auto_21083 ?auto_21100 ) ) ( not ( = ?auto_21095 ?auto_21106 ) ) ( SURFACE-AT ?auto_21081 ?auto_21097 ) ( CLEAR ?auto_21081 ) ( IS-CRATE ?auto_21082 ) ( AVAILABLE ?auto_21095 ) ( AVAILABLE ?auto_21103 ) ( SURFACE-AT ?auto_21082 ?auto_21113 ) ( ON ?auto_21082 ?auto_21116 ) ( CLEAR ?auto_21082 ) ( TRUCK-AT ?auto_21098 ?auto_21097 ) ( not ( = ?auto_21081 ?auto_21082 ) ) ( not ( = ?auto_21081 ?auto_21116 ) ) ( not ( = ?auto_21082 ?auto_21116 ) ) ( not ( = ?auto_21081 ?auto_21083 ) ) ( not ( = ?auto_21081 ?auto_21100 ) ) ( not ( = ?auto_21083 ?auto_21116 ) ) ( not ( = ?auto_21111 ?auto_21113 ) ) ( not ( = ?auto_21106 ?auto_21103 ) ) ( not ( = ?auto_21100 ?auto_21116 ) ) ( not ( = ?auto_21081 ?auto_21084 ) ) ( not ( = ?auto_21081 ?auto_21114 ) ) ( not ( = ?auto_21082 ?auto_21084 ) ) ( not ( = ?auto_21082 ?auto_21114 ) ) ( not ( = ?auto_21084 ?auto_21100 ) ) ( not ( = ?auto_21084 ?auto_21116 ) ) ( not ( = ?auto_21102 ?auto_21111 ) ) ( not ( = ?auto_21102 ?auto_21113 ) ) ( not ( = ?auto_21105 ?auto_21106 ) ) ( not ( = ?auto_21105 ?auto_21103 ) ) ( not ( = ?auto_21114 ?auto_21100 ) ) ( not ( = ?auto_21114 ?auto_21116 ) ) ( not ( = ?auto_21081 ?auto_21085 ) ) ( not ( = ?auto_21081 ?auto_21117 ) ) ( not ( = ?auto_21082 ?auto_21085 ) ) ( not ( = ?auto_21082 ?auto_21117 ) ) ( not ( = ?auto_21083 ?auto_21085 ) ) ( not ( = ?auto_21083 ?auto_21117 ) ) ( not ( = ?auto_21085 ?auto_21114 ) ) ( not ( = ?auto_21085 ?auto_21100 ) ) ( not ( = ?auto_21085 ?auto_21116 ) ) ( not ( = ?auto_21099 ?auto_21102 ) ) ( not ( = ?auto_21099 ?auto_21111 ) ) ( not ( = ?auto_21099 ?auto_21113 ) ) ( not ( = ?auto_21104 ?auto_21105 ) ) ( not ( = ?auto_21104 ?auto_21106 ) ) ( not ( = ?auto_21104 ?auto_21103 ) ) ( not ( = ?auto_21117 ?auto_21114 ) ) ( not ( = ?auto_21117 ?auto_21100 ) ) ( not ( = ?auto_21117 ?auto_21116 ) ) ( not ( = ?auto_21081 ?auto_21086 ) ) ( not ( = ?auto_21081 ?auto_21110 ) ) ( not ( = ?auto_21082 ?auto_21086 ) ) ( not ( = ?auto_21082 ?auto_21110 ) ) ( not ( = ?auto_21083 ?auto_21086 ) ) ( not ( = ?auto_21083 ?auto_21110 ) ) ( not ( = ?auto_21084 ?auto_21086 ) ) ( not ( = ?auto_21084 ?auto_21110 ) ) ( not ( = ?auto_21086 ?auto_21117 ) ) ( not ( = ?auto_21086 ?auto_21114 ) ) ( not ( = ?auto_21086 ?auto_21100 ) ) ( not ( = ?auto_21086 ?auto_21116 ) ) ( not ( = ?auto_21101 ?auto_21099 ) ) ( not ( = ?auto_21101 ?auto_21102 ) ) ( not ( = ?auto_21101 ?auto_21111 ) ) ( not ( = ?auto_21101 ?auto_21113 ) ) ( not ( = ?auto_21115 ?auto_21104 ) ) ( not ( = ?auto_21115 ?auto_21105 ) ) ( not ( = ?auto_21115 ?auto_21106 ) ) ( not ( = ?auto_21115 ?auto_21103 ) ) ( not ( = ?auto_21110 ?auto_21117 ) ) ( not ( = ?auto_21110 ?auto_21114 ) ) ( not ( = ?auto_21110 ?auto_21100 ) ) ( not ( = ?auto_21110 ?auto_21116 ) ) ( not ( = ?auto_21081 ?auto_21087 ) ) ( not ( = ?auto_21081 ?auto_21109 ) ) ( not ( = ?auto_21082 ?auto_21087 ) ) ( not ( = ?auto_21082 ?auto_21109 ) ) ( not ( = ?auto_21083 ?auto_21087 ) ) ( not ( = ?auto_21083 ?auto_21109 ) ) ( not ( = ?auto_21084 ?auto_21087 ) ) ( not ( = ?auto_21084 ?auto_21109 ) ) ( not ( = ?auto_21085 ?auto_21087 ) ) ( not ( = ?auto_21085 ?auto_21109 ) ) ( not ( = ?auto_21087 ?auto_21110 ) ) ( not ( = ?auto_21087 ?auto_21117 ) ) ( not ( = ?auto_21087 ?auto_21114 ) ) ( not ( = ?auto_21087 ?auto_21100 ) ) ( not ( = ?auto_21087 ?auto_21116 ) ) ( not ( = ?auto_21109 ?auto_21110 ) ) ( not ( = ?auto_21109 ?auto_21117 ) ) ( not ( = ?auto_21109 ?auto_21114 ) ) ( not ( = ?auto_21109 ?auto_21100 ) ) ( not ( = ?auto_21109 ?auto_21116 ) ) ( not ( = ?auto_21081 ?auto_21088 ) ) ( not ( = ?auto_21081 ?auto_21108 ) ) ( not ( = ?auto_21082 ?auto_21088 ) ) ( not ( = ?auto_21082 ?auto_21108 ) ) ( not ( = ?auto_21083 ?auto_21088 ) ) ( not ( = ?auto_21083 ?auto_21108 ) ) ( not ( = ?auto_21084 ?auto_21088 ) ) ( not ( = ?auto_21084 ?auto_21108 ) ) ( not ( = ?auto_21085 ?auto_21088 ) ) ( not ( = ?auto_21085 ?auto_21108 ) ) ( not ( = ?auto_21086 ?auto_21088 ) ) ( not ( = ?auto_21086 ?auto_21108 ) ) ( not ( = ?auto_21088 ?auto_21109 ) ) ( not ( = ?auto_21088 ?auto_21110 ) ) ( not ( = ?auto_21088 ?auto_21117 ) ) ( not ( = ?auto_21088 ?auto_21114 ) ) ( not ( = ?auto_21088 ?auto_21100 ) ) ( not ( = ?auto_21088 ?auto_21116 ) ) ( not ( = ?auto_21093 ?auto_21113 ) ) ( not ( = ?auto_21093 ?auto_21101 ) ) ( not ( = ?auto_21093 ?auto_21099 ) ) ( not ( = ?auto_21093 ?auto_21102 ) ) ( not ( = ?auto_21093 ?auto_21111 ) ) ( not ( = ?auto_21094 ?auto_21103 ) ) ( not ( = ?auto_21094 ?auto_21115 ) ) ( not ( = ?auto_21094 ?auto_21104 ) ) ( not ( = ?auto_21094 ?auto_21105 ) ) ( not ( = ?auto_21094 ?auto_21106 ) ) ( not ( = ?auto_21108 ?auto_21109 ) ) ( not ( = ?auto_21108 ?auto_21110 ) ) ( not ( = ?auto_21108 ?auto_21117 ) ) ( not ( = ?auto_21108 ?auto_21114 ) ) ( not ( = ?auto_21108 ?auto_21100 ) ) ( not ( = ?auto_21108 ?auto_21116 ) ) ( not ( = ?auto_21081 ?auto_21089 ) ) ( not ( = ?auto_21081 ?auto_21112 ) ) ( not ( = ?auto_21082 ?auto_21089 ) ) ( not ( = ?auto_21082 ?auto_21112 ) ) ( not ( = ?auto_21083 ?auto_21089 ) ) ( not ( = ?auto_21083 ?auto_21112 ) ) ( not ( = ?auto_21084 ?auto_21089 ) ) ( not ( = ?auto_21084 ?auto_21112 ) ) ( not ( = ?auto_21085 ?auto_21089 ) ) ( not ( = ?auto_21085 ?auto_21112 ) ) ( not ( = ?auto_21086 ?auto_21089 ) ) ( not ( = ?auto_21086 ?auto_21112 ) ) ( not ( = ?auto_21087 ?auto_21089 ) ) ( not ( = ?auto_21087 ?auto_21112 ) ) ( not ( = ?auto_21089 ?auto_21108 ) ) ( not ( = ?auto_21089 ?auto_21109 ) ) ( not ( = ?auto_21089 ?auto_21110 ) ) ( not ( = ?auto_21089 ?auto_21117 ) ) ( not ( = ?auto_21089 ?auto_21114 ) ) ( not ( = ?auto_21089 ?auto_21100 ) ) ( not ( = ?auto_21089 ?auto_21116 ) ) ( not ( = ?auto_21112 ?auto_21108 ) ) ( not ( = ?auto_21112 ?auto_21109 ) ) ( not ( = ?auto_21112 ?auto_21110 ) ) ( not ( = ?auto_21112 ?auto_21117 ) ) ( not ( = ?auto_21112 ?auto_21114 ) ) ( not ( = ?auto_21112 ?auto_21100 ) ) ( not ( = ?auto_21112 ?auto_21116 ) ) ( not ( = ?auto_21081 ?auto_21090 ) ) ( not ( = ?auto_21081 ?auto_21107 ) ) ( not ( = ?auto_21082 ?auto_21090 ) ) ( not ( = ?auto_21082 ?auto_21107 ) ) ( not ( = ?auto_21083 ?auto_21090 ) ) ( not ( = ?auto_21083 ?auto_21107 ) ) ( not ( = ?auto_21084 ?auto_21090 ) ) ( not ( = ?auto_21084 ?auto_21107 ) ) ( not ( = ?auto_21085 ?auto_21090 ) ) ( not ( = ?auto_21085 ?auto_21107 ) ) ( not ( = ?auto_21086 ?auto_21090 ) ) ( not ( = ?auto_21086 ?auto_21107 ) ) ( not ( = ?auto_21087 ?auto_21090 ) ) ( not ( = ?auto_21087 ?auto_21107 ) ) ( not ( = ?auto_21088 ?auto_21090 ) ) ( not ( = ?auto_21088 ?auto_21107 ) ) ( not ( = ?auto_21090 ?auto_21112 ) ) ( not ( = ?auto_21090 ?auto_21108 ) ) ( not ( = ?auto_21090 ?auto_21109 ) ) ( not ( = ?auto_21090 ?auto_21110 ) ) ( not ( = ?auto_21090 ?auto_21117 ) ) ( not ( = ?auto_21090 ?auto_21114 ) ) ( not ( = ?auto_21090 ?auto_21100 ) ) ( not ( = ?auto_21090 ?auto_21116 ) ) ( not ( = ?auto_21107 ?auto_21112 ) ) ( not ( = ?auto_21107 ?auto_21108 ) ) ( not ( = ?auto_21107 ?auto_21109 ) ) ( not ( = ?auto_21107 ?auto_21110 ) ) ( not ( = ?auto_21107 ?auto_21117 ) ) ( not ( = ?auto_21107 ?auto_21114 ) ) ( not ( = ?auto_21107 ?auto_21100 ) ) ( not ( = ?auto_21107 ?auto_21116 ) ) ( not ( = ?auto_21081 ?auto_21091 ) ) ( not ( = ?auto_21081 ?auto_21118 ) ) ( not ( = ?auto_21082 ?auto_21091 ) ) ( not ( = ?auto_21082 ?auto_21118 ) ) ( not ( = ?auto_21083 ?auto_21091 ) ) ( not ( = ?auto_21083 ?auto_21118 ) ) ( not ( = ?auto_21084 ?auto_21091 ) ) ( not ( = ?auto_21084 ?auto_21118 ) ) ( not ( = ?auto_21085 ?auto_21091 ) ) ( not ( = ?auto_21085 ?auto_21118 ) ) ( not ( = ?auto_21086 ?auto_21091 ) ) ( not ( = ?auto_21086 ?auto_21118 ) ) ( not ( = ?auto_21087 ?auto_21091 ) ) ( not ( = ?auto_21087 ?auto_21118 ) ) ( not ( = ?auto_21088 ?auto_21091 ) ) ( not ( = ?auto_21088 ?auto_21118 ) ) ( not ( = ?auto_21089 ?auto_21091 ) ) ( not ( = ?auto_21089 ?auto_21118 ) ) ( not ( = ?auto_21091 ?auto_21107 ) ) ( not ( = ?auto_21091 ?auto_21112 ) ) ( not ( = ?auto_21091 ?auto_21108 ) ) ( not ( = ?auto_21091 ?auto_21109 ) ) ( not ( = ?auto_21091 ?auto_21110 ) ) ( not ( = ?auto_21091 ?auto_21117 ) ) ( not ( = ?auto_21091 ?auto_21114 ) ) ( not ( = ?auto_21091 ?auto_21100 ) ) ( not ( = ?auto_21091 ?auto_21116 ) ) ( not ( = ?auto_21118 ?auto_21107 ) ) ( not ( = ?auto_21118 ?auto_21112 ) ) ( not ( = ?auto_21118 ?auto_21108 ) ) ( not ( = ?auto_21118 ?auto_21109 ) ) ( not ( = ?auto_21118 ?auto_21110 ) ) ( not ( = ?auto_21118 ?auto_21117 ) ) ( not ( = ?auto_21118 ?auto_21114 ) ) ( not ( = ?auto_21118 ?auto_21100 ) ) ( not ( = ?auto_21118 ?auto_21116 ) ) ( not ( = ?auto_21081 ?auto_21092 ) ) ( not ( = ?auto_21081 ?auto_21096 ) ) ( not ( = ?auto_21082 ?auto_21092 ) ) ( not ( = ?auto_21082 ?auto_21096 ) ) ( not ( = ?auto_21083 ?auto_21092 ) ) ( not ( = ?auto_21083 ?auto_21096 ) ) ( not ( = ?auto_21084 ?auto_21092 ) ) ( not ( = ?auto_21084 ?auto_21096 ) ) ( not ( = ?auto_21085 ?auto_21092 ) ) ( not ( = ?auto_21085 ?auto_21096 ) ) ( not ( = ?auto_21086 ?auto_21092 ) ) ( not ( = ?auto_21086 ?auto_21096 ) ) ( not ( = ?auto_21087 ?auto_21092 ) ) ( not ( = ?auto_21087 ?auto_21096 ) ) ( not ( = ?auto_21088 ?auto_21092 ) ) ( not ( = ?auto_21088 ?auto_21096 ) ) ( not ( = ?auto_21089 ?auto_21092 ) ) ( not ( = ?auto_21089 ?auto_21096 ) ) ( not ( = ?auto_21090 ?auto_21092 ) ) ( not ( = ?auto_21090 ?auto_21096 ) ) ( not ( = ?auto_21092 ?auto_21118 ) ) ( not ( = ?auto_21092 ?auto_21107 ) ) ( not ( = ?auto_21092 ?auto_21112 ) ) ( not ( = ?auto_21092 ?auto_21108 ) ) ( not ( = ?auto_21092 ?auto_21109 ) ) ( not ( = ?auto_21092 ?auto_21110 ) ) ( not ( = ?auto_21092 ?auto_21117 ) ) ( not ( = ?auto_21092 ?auto_21114 ) ) ( not ( = ?auto_21092 ?auto_21100 ) ) ( not ( = ?auto_21092 ?auto_21116 ) ) ( not ( = ?auto_21096 ?auto_21118 ) ) ( not ( = ?auto_21096 ?auto_21107 ) ) ( not ( = ?auto_21096 ?auto_21112 ) ) ( not ( = ?auto_21096 ?auto_21108 ) ) ( not ( = ?auto_21096 ?auto_21109 ) ) ( not ( = ?auto_21096 ?auto_21110 ) ) ( not ( = ?auto_21096 ?auto_21117 ) ) ( not ( = ?auto_21096 ?auto_21114 ) ) ( not ( = ?auto_21096 ?auto_21100 ) ) ( not ( = ?auto_21096 ?auto_21116 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_21081 ?auto_21082 ?auto_21083 ?auto_21084 ?auto_21085 ?auto_21086 ?auto_21087 ?auto_21088 ?auto_21089 ?auto_21090 ?auto_21091 )
      ( MAKE-1CRATE ?auto_21091 ?auto_21092 )
      ( MAKE-11CRATE-VERIFY ?auto_21081 ?auto_21082 ?auto_21083 ?auto_21084 ?auto_21085 ?auto_21086 ?auto_21087 ?auto_21088 ?auto_21089 ?auto_21090 ?auto_21091 ?auto_21092 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_21142 - SURFACE
      ?auto_21143 - SURFACE
      ?auto_21144 - SURFACE
      ?auto_21145 - SURFACE
      ?auto_21146 - SURFACE
      ?auto_21147 - SURFACE
      ?auto_21148 - SURFACE
      ?auto_21149 - SURFACE
      ?auto_21150 - SURFACE
      ?auto_21151 - SURFACE
      ?auto_21152 - SURFACE
      ?auto_21153 - SURFACE
      ?auto_21154 - SURFACE
    )
    :vars
    (
      ?auto_21157 - HOIST
      ?auto_21160 - PLACE
      ?auto_21159 - PLACE
      ?auto_21156 - HOIST
      ?auto_21155 - SURFACE
      ?auto_21164 - SURFACE
      ?auto_21181 - PLACE
      ?auto_21180 - HOIST
      ?auto_21171 - SURFACE
      ?auto_21166 - SURFACE
      ?auto_21174 - PLACE
      ?auto_21176 - HOIST
      ?auto_21165 - SURFACE
      ?auto_21163 - SURFACE
      ?auto_21161 - SURFACE
      ?auto_21168 - PLACE
      ?auto_21173 - HOIST
      ?auto_21177 - SURFACE
      ?auto_21175 - PLACE
      ?auto_21167 - HOIST
      ?auto_21178 - SURFACE
      ?auto_21179 - SURFACE
      ?auto_21172 - PLACE
      ?auto_21169 - HOIST
      ?auto_21162 - SURFACE
      ?auto_21170 - SURFACE
      ?auto_21158 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21157 ?auto_21160 ) ( IS-CRATE ?auto_21154 ) ( not ( = ?auto_21159 ?auto_21160 ) ) ( HOIST-AT ?auto_21156 ?auto_21159 ) ( SURFACE-AT ?auto_21154 ?auto_21159 ) ( ON ?auto_21154 ?auto_21155 ) ( CLEAR ?auto_21154 ) ( not ( = ?auto_21153 ?auto_21154 ) ) ( not ( = ?auto_21153 ?auto_21155 ) ) ( not ( = ?auto_21154 ?auto_21155 ) ) ( not ( = ?auto_21157 ?auto_21156 ) ) ( IS-CRATE ?auto_21153 ) ( SURFACE-AT ?auto_21153 ?auto_21159 ) ( ON ?auto_21153 ?auto_21164 ) ( CLEAR ?auto_21153 ) ( not ( = ?auto_21152 ?auto_21153 ) ) ( not ( = ?auto_21152 ?auto_21164 ) ) ( not ( = ?auto_21153 ?auto_21164 ) ) ( IS-CRATE ?auto_21152 ) ( not ( = ?auto_21181 ?auto_21160 ) ) ( HOIST-AT ?auto_21180 ?auto_21181 ) ( SURFACE-AT ?auto_21152 ?auto_21181 ) ( ON ?auto_21152 ?auto_21171 ) ( CLEAR ?auto_21152 ) ( not ( = ?auto_21151 ?auto_21152 ) ) ( not ( = ?auto_21151 ?auto_21171 ) ) ( not ( = ?auto_21152 ?auto_21171 ) ) ( not ( = ?auto_21157 ?auto_21180 ) ) ( IS-CRATE ?auto_21151 ) ( SURFACE-AT ?auto_21151 ?auto_21159 ) ( ON ?auto_21151 ?auto_21166 ) ( CLEAR ?auto_21151 ) ( not ( = ?auto_21150 ?auto_21151 ) ) ( not ( = ?auto_21150 ?auto_21166 ) ) ( not ( = ?auto_21151 ?auto_21166 ) ) ( IS-CRATE ?auto_21150 ) ( not ( = ?auto_21174 ?auto_21160 ) ) ( HOIST-AT ?auto_21176 ?auto_21174 ) ( SURFACE-AT ?auto_21150 ?auto_21174 ) ( ON ?auto_21150 ?auto_21165 ) ( CLEAR ?auto_21150 ) ( not ( = ?auto_21149 ?auto_21150 ) ) ( not ( = ?auto_21149 ?auto_21165 ) ) ( not ( = ?auto_21150 ?auto_21165 ) ) ( not ( = ?auto_21157 ?auto_21176 ) ) ( IS-CRATE ?auto_21149 ) ( AVAILABLE ?auto_21156 ) ( SURFACE-AT ?auto_21149 ?auto_21159 ) ( ON ?auto_21149 ?auto_21163 ) ( CLEAR ?auto_21149 ) ( not ( = ?auto_21148 ?auto_21149 ) ) ( not ( = ?auto_21148 ?auto_21163 ) ) ( not ( = ?auto_21149 ?auto_21163 ) ) ( IS-CRATE ?auto_21148 ) ( SURFACE-AT ?auto_21148 ?auto_21174 ) ( ON ?auto_21148 ?auto_21161 ) ( CLEAR ?auto_21148 ) ( not ( = ?auto_21147 ?auto_21148 ) ) ( not ( = ?auto_21147 ?auto_21161 ) ) ( not ( = ?auto_21148 ?auto_21161 ) ) ( IS-CRATE ?auto_21147 ) ( not ( = ?auto_21168 ?auto_21160 ) ) ( HOIST-AT ?auto_21173 ?auto_21168 ) ( AVAILABLE ?auto_21173 ) ( SURFACE-AT ?auto_21147 ?auto_21168 ) ( ON ?auto_21147 ?auto_21177 ) ( CLEAR ?auto_21147 ) ( not ( = ?auto_21146 ?auto_21147 ) ) ( not ( = ?auto_21146 ?auto_21177 ) ) ( not ( = ?auto_21147 ?auto_21177 ) ) ( not ( = ?auto_21157 ?auto_21173 ) ) ( IS-CRATE ?auto_21146 ) ( not ( = ?auto_21175 ?auto_21160 ) ) ( HOIST-AT ?auto_21167 ?auto_21175 ) ( AVAILABLE ?auto_21167 ) ( SURFACE-AT ?auto_21146 ?auto_21175 ) ( ON ?auto_21146 ?auto_21178 ) ( CLEAR ?auto_21146 ) ( not ( = ?auto_21145 ?auto_21146 ) ) ( not ( = ?auto_21145 ?auto_21178 ) ) ( not ( = ?auto_21146 ?auto_21178 ) ) ( not ( = ?auto_21157 ?auto_21167 ) ) ( IS-CRATE ?auto_21145 ) ( AVAILABLE ?auto_21180 ) ( SURFACE-AT ?auto_21145 ?auto_21181 ) ( ON ?auto_21145 ?auto_21179 ) ( CLEAR ?auto_21145 ) ( not ( = ?auto_21144 ?auto_21145 ) ) ( not ( = ?auto_21144 ?auto_21179 ) ) ( not ( = ?auto_21145 ?auto_21179 ) ) ( IS-CRATE ?auto_21144 ) ( not ( = ?auto_21172 ?auto_21160 ) ) ( HOIST-AT ?auto_21169 ?auto_21172 ) ( AVAILABLE ?auto_21169 ) ( SURFACE-AT ?auto_21144 ?auto_21172 ) ( ON ?auto_21144 ?auto_21162 ) ( CLEAR ?auto_21144 ) ( not ( = ?auto_21143 ?auto_21144 ) ) ( not ( = ?auto_21143 ?auto_21162 ) ) ( not ( = ?auto_21144 ?auto_21162 ) ) ( not ( = ?auto_21157 ?auto_21169 ) ) ( SURFACE-AT ?auto_21142 ?auto_21160 ) ( CLEAR ?auto_21142 ) ( IS-CRATE ?auto_21143 ) ( AVAILABLE ?auto_21157 ) ( AVAILABLE ?auto_21176 ) ( SURFACE-AT ?auto_21143 ?auto_21174 ) ( ON ?auto_21143 ?auto_21170 ) ( CLEAR ?auto_21143 ) ( TRUCK-AT ?auto_21158 ?auto_21160 ) ( not ( = ?auto_21142 ?auto_21143 ) ) ( not ( = ?auto_21142 ?auto_21170 ) ) ( not ( = ?auto_21143 ?auto_21170 ) ) ( not ( = ?auto_21142 ?auto_21144 ) ) ( not ( = ?auto_21142 ?auto_21162 ) ) ( not ( = ?auto_21144 ?auto_21170 ) ) ( not ( = ?auto_21172 ?auto_21174 ) ) ( not ( = ?auto_21169 ?auto_21176 ) ) ( not ( = ?auto_21162 ?auto_21170 ) ) ( not ( = ?auto_21142 ?auto_21145 ) ) ( not ( = ?auto_21142 ?auto_21179 ) ) ( not ( = ?auto_21143 ?auto_21145 ) ) ( not ( = ?auto_21143 ?auto_21179 ) ) ( not ( = ?auto_21145 ?auto_21162 ) ) ( not ( = ?auto_21145 ?auto_21170 ) ) ( not ( = ?auto_21181 ?auto_21172 ) ) ( not ( = ?auto_21181 ?auto_21174 ) ) ( not ( = ?auto_21180 ?auto_21169 ) ) ( not ( = ?auto_21180 ?auto_21176 ) ) ( not ( = ?auto_21179 ?auto_21162 ) ) ( not ( = ?auto_21179 ?auto_21170 ) ) ( not ( = ?auto_21142 ?auto_21146 ) ) ( not ( = ?auto_21142 ?auto_21178 ) ) ( not ( = ?auto_21143 ?auto_21146 ) ) ( not ( = ?auto_21143 ?auto_21178 ) ) ( not ( = ?auto_21144 ?auto_21146 ) ) ( not ( = ?auto_21144 ?auto_21178 ) ) ( not ( = ?auto_21146 ?auto_21179 ) ) ( not ( = ?auto_21146 ?auto_21162 ) ) ( not ( = ?auto_21146 ?auto_21170 ) ) ( not ( = ?auto_21175 ?auto_21181 ) ) ( not ( = ?auto_21175 ?auto_21172 ) ) ( not ( = ?auto_21175 ?auto_21174 ) ) ( not ( = ?auto_21167 ?auto_21180 ) ) ( not ( = ?auto_21167 ?auto_21169 ) ) ( not ( = ?auto_21167 ?auto_21176 ) ) ( not ( = ?auto_21178 ?auto_21179 ) ) ( not ( = ?auto_21178 ?auto_21162 ) ) ( not ( = ?auto_21178 ?auto_21170 ) ) ( not ( = ?auto_21142 ?auto_21147 ) ) ( not ( = ?auto_21142 ?auto_21177 ) ) ( not ( = ?auto_21143 ?auto_21147 ) ) ( not ( = ?auto_21143 ?auto_21177 ) ) ( not ( = ?auto_21144 ?auto_21147 ) ) ( not ( = ?auto_21144 ?auto_21177 ) ) ( not ( = ?auto_21145 ?auto_21147 ) ) ( not ( = ?auto_21145 ?auto_21177 ) ) ( not ( = ?auto_21147 ?auto_21178 ) ) ( not ( = ?auto_21147 ?auto_21179 ) ) ( not ( = ?auto_21147 ?auto_21162 ) ) ( not ( = ?auto_21147 ?auto_21170 ) ) ( not ( = ?auto_21168 ?auto_21175 ) ) ( not ( = ?auto_21168 ?auto_21181 ) ) ( not ( = ?auto_21168 ?auto_21172 ) ) ( not ( = ?auto_21168 ?auto_21174 ) ) ( not ( = ?auto_21173 ?auto_21167 ) ) ( not ( = ?auto_21173 ?auto_21180 ) ) ( not ( = ?auto_21173 ?auto_21169 ) ) ( not ( = ?auto_21173 ?auto_21176 ) ) ( not ( = ?auto_21177 ?auto_21178 ) ) ( not ( = ?auto_21177 ?auto_21179 ) ) ( not ( = ?auto_21177 ?auto_21162 ) ) ( not ( = ?auto_21177 ?auto_21170 ) ) ( not ( = ?auto_21142 ?auto_21148 ) ) ( not ( = ?auto_21142 ?auto_21161 ) ) ( not ( = ?auto_21143 ?auto_21148 ) ) ( not ( = ?auto_21143 ?auto_21161 ) ) ( not ( = ?auto_21144 ?auto_21148 ) ) ( not ( = ?auto_21144 ?auto_21161 ) ) ( not ( = ?auto_21145 ?auto_21148 ) ) ( not ( = ?auto_21145 ?auto_21161 ) ) ( not ( = ?auto_21146 ?auto_21148 ) ) ( not ( = ?auto_21146 ?auto_21161 ) ) ( not ( = ?auto_21148 ?auto_21177 ) ) ( not ( = ?auto_21148 ?auto_21178 ) ) ( not ( = ?auto_21148 ?auto_21179 ) ) ( not ( = ?auto_21148 ?auto_21162 ) ) ( not ( = ?auto_21148 ?auto_21170 ) ) ( not ( = ?auto_21161 ?auto_21177 ) ) ( not ( = ?auto_21161 ?auto_21178 ) ) ( not ( = ?auto_21161 ?auto_21179 ) ) ( not ( = ?auto_21161 ?auto_21162 ) ) ( not ( = ?auto_21161 ?auto_21170 ) ) ( not ( = ?auto_21142 ?auto_21149 ) ) ( not ( = ?auto_21142 ?auto_21163 ) ) ( not ( = ?auto_21143 ?auto_21149 ) ) ( not ( = ?auto_21143 ?auto_21163 ) ) ( not ( = ?auto_21144 ?auto_21149 ) ) ( not ( = ?auto_21144 ?auto_21163 ) ) ( not ( = ?auto_21145 ?auto_21149 ) ) ( not ( = ?auto_21145 ?auto_21163 ) ) ( not ( = ?auto_21146 ?auto_21149 ) ) ( not ( = ?auto_21146 ?auto_21163 ) ) ( not ( = ?auto_21147 ?auto_21149 ) ) ( not ( = ?auto_21147 ?auto_21163 ) ) ( not ( = ?auto_21149 ?auto_21161 ) ) ( not ( = ?auto_21149 ?auto_21177 ) ) ( not ( = ?auto_21149 ?auto_21178 ) ) ( not ( = ?auto_21149 ?auto_21179 ) ) ( not ( = ?auto_21149 ?auto_21162 ) ) ( not ( = ?auto_21149 ?auto_21170 ) ) ( not ( = ?auto_21159 ?auto_21174 ) ) ( not ( = ?auto_21159 ?auto_21168 ) ) ( not ( = ?auto_21159 ?auto_21175 ) ) ( not ( = ?auto_21159 ?auto_21181 ) ) ( not ( = ?auto_21159 ?auto_21172 ) ) ( not ( = ?auto_21156 ?auto_21176 ) ) ( not ( = ?auto_21156 ?auto_21173 ) ) ( not ( = ?auto_21156 ?auto_21167 ) ) ( not ( = ?auto_21156 ?auto_21180 ) ) ( not ( = ?auto_21156 ?auto_21169 ) ) ( not ( = ?auto_21163 ?auto_21161 ) ) ( not ( = ?auto_21163 ?auto_21177 ) ) ( not ( = ?auto_21163 ?auto_21178 ) ) ( not ( = ?auto_21163 ?auto_21179 ) ) ( not ( = ?auto_21163 ?auto_21162 ) ) ( not ( = ?auto_21163 ?auto_21170 ) ) ( not ( = ?auto_21142 ?auto_21150 ) ) ( not ( = ?auto_21142 ?auto_21165 ) ) ( not ( = ?auto_21143 ?auto_21150 ) ) ( not ( = ?auto_21143 ?auto_21165 ) ) ( not ( = ?auto_21144 ?auto_21150 ) ) ( not ( = ?auto_21144 ?auto_21165 ) ) ( not ( = ?auto_21145 ?auto_21150 ) ) ( not ( = ?auto_21145 ?auto_21165 ) ) ( not ( = ?auto_21146 ?auto_21150 ) ) ( not ( = ?auto_21146 ?auto_21165 ) ) ( not ( = ?auto_21147 ?auto_21150 ) ) ( not ( = ?auto_21147 ?auto_21165 ) ) ( not ( = ?auto_21148 ?auto_21150 ) ) ( not ( = ?auto_21148 ?auto_21165 ) ) ( not ( = ?auto_21150 ?auto_21163 ) ) ( not ( = ?auto_21150 ?auto_21161 ) ) ( not ( = ?auto_21150 ?auto_21177 ) ) ( not ( = ?auto_21150 ?auto_21178 ) ) ( not ( = ?auto_21150 ?auto_21179 ) ) ( not ( = ?auto_21150 ?auto_21162 ) ) ( not ( = ?auto_21150 ?auto_21170 ) ) ( not ( = ?auto_21165 ?auto_21163 ) ) ( not ( = ?auto_21165 ?auto_21161 ) ) ( not ( = ?auto_21165 ?auto_21177 ) ) ( not ( = ?auto_21165 ?auto_21178 ) ) ( not ( = ?auto_21165 ?auto_21179 ) ) ( not ( = ?auto_21165 ?auto_21162 ) ) ( not ( = ?auto_21165 ?auto_21170 ) ) ( not ( = ?auto_21142 ?auto_21151 ) ) ( not ( = ?auto_21142 ?auto_21166 ) ) ( not ( = ?auto_21143 ?auto_21151 ) ) ( not ( = ?auto_21143 ?auto_21166 ) ) ( not ( = ?auto_21144 ?auto_21151 ) ) ( not ( = ?auto_21144 ?auto_21166 ) ) ( not ( = ?auto_21145 ?auto_21151 ) ) ( not ( = ?auto_21145 ?auto_21166 ) ) ( not ( = ?auto_21146 ?auto_21151 ) ) ( not ( = ?auto_21146 ?auto_21166 ) ) ( not ( = ?auto_21147 ?auto_21151 ) ) ( not ( = ?auto_21147 ?auto_21166 ) ) ( not ( = ?auto_21148 ?auto_21151 ) ) ( not ( = ?auto_21148 ?auto_21166 ) ) ( not ( = ?auto_21149 ?auto_21151 ) ) ( not ( = ?auto_21149 ?auto_21166 ) ) ( not ( = ?auto_21151 ?auto_21165 ) ) ( not ( = ?auto_21151 ?auto_21163 ) ) ( not ( = ?auto_21151 ?auto_21161 ) ) ( not ( = ?auto_21151 ?auto_21177 ) ) ( not ( = ?auto_21151 ?auto_21178 ) ) ( not ( = ?auto_21151 ?auto_21179 ) ) ( not ( = ?auto_21151 ?auto_21162 ) ) ( not ( = ?auto_21151 ?auto_21170 ) ) ( not ( = ?auto_21166 ?auto_21165 ) ) ( not ( = ?auto_21166 ?auto_21163 ) ) ( not ( = ?auto_21166 ?auto_21161 ) ) ( not ( = ?auto_21166 ?auto_21177 ) ) ( not ( = ?auto_21166 ?auto_21178 ) ) ( not ( = ?auto_21166 ?auto_21179 ) ) ( not ( = ?auto_21166 ?auto_21162 ) ) ( not ( = ?auto_21166 ?auto_21170 ) ) ( not ( = ?auto_21142 ?auto_21152 ) ) ( not ( = ?auto_21142 ?auto_21171 ) ) ( not ( = ?auto_21143 ?auto_21152 ) ) ( not ( = ?auto_21143 ?auto_21171 ) ) ( not ( = ?auto_21144 ?auto_21152 ) ) ( not ( = ?auto_21144 ?auto_21171 ) ) ( not ( = ?auto_21145 ?auto_21152 ) ) ( not ( = ?auto_21145 ?auto_21171 ) ) ( not ( = ?auto_21146 ?auto_21152 ) ) ( not ( = ?auto_21146 ?auto_21171 ) ) ( not ( = ?auto_21147 ?auto_21152 ) ) ( not ( = ?auto_21147 ?auto_21171 ) ) ( not ( = ?auto_21148 ?auto_21152 ) ) ( not ( = ?auto_21148 ?auto_21171 ) ) ( not ( = ?auto_21149 ?auto_21152 ) ) ( not ( = ?auto_21149 ?auto_21171 ) ) ( not ( = ?auto_21150 ?auto_21152 ) ) ( not ( = ?auto_21150 ?auto_21171 ) ) ( not ( = ?auto_21152 ?auto_21166 ) ) ( not ( = ?auto_21152 ?auto_21165 ) ) ( not ( = ?auto_21152 ?auto_21163 ) ) ( not ( = ?auto_21152 ?auto_21161 ) ) ( not ( = ?auto_21152 ?auto_21177 ) ) ( not ( = ?auto_21152 ?auto_21178 ) ) ( not ( = ?auto_21152 ?auto_21179 ) ) ( not ( = ?auto_21152 ?auto_21162 ) ) ( not ( = ?auto_21152 ?auto_21170 ) ) ( not ( = ?auto_21171 ?auto_21166 ) ) ( not ( = ?auto_21171 ?auto_21165 ) ) ( not ( = ?auto_21171 ?auto_21163 ) ) ( not ( = ?auto_21171 ?auto_21161 ) ) ( not ( = ?auto_21171 ?auto_21177 ) ) ( not ( = ?auto_21171 ?auto_21178 ) ) ( not ( = ?auto_21171 ?auto_21179 ) ) ( not ( = ?auto_21171 ?auto_21162 ) ) ( not ( = ?auto_21171 ?auto_21170 ) ) ( not ( = ?auto_21142 ?auto_21153 ) ) ( not ( = ?auto_21142 ?auto_21164 ) ) ( not ( = ?auto_21143 ?auto_21153 ) ) ( not ( = ?auto_21143 ?auto_21164 ) ) ( not ( = ?auto_21144 ?auto_21153 ) ) ( not ( = ?auto_21144 ?auto_21164 ) ) ( not ( = ?auto_21145 ?auto_21153 ) ) ( not ( = ?auto_21145 ?auto_21164 ) ) ( not ( = ?auto_21146 ?auto_21153 ) ) ( not ( = ?auto_21146 ?auto_21164 ) ) ( not ( = ?auto_21147 ?auto_21153 ) ) ( not ( = ?auto_21147 ?auto_21164 ) ) ( not ( = ?auto_21148 ?auto_21153 ) ) ( not ( = ?auto_21148 ?auto_21164 ) ) ( not ( = ?auto_21149 ?auto_21153 ) ) ( not ( = ?auto_21149 ?auto_21164 ) ) ( not ( = ?auto_21150 ?auto_21153 ) ) ( not ( = ?auto_21150 ?auto_21164 ) ) ( not ( = ?auto_21151 ?auto_21153 ) ) ( not ( = ?auto_21151 ?auto_21164 ) ) ( not ( = ?auto_21153 ?auto_21171 ) ) ( not ( = ?auto_21153 ?auto_21166 ) ) ( not ( = ?auto_21153 ?auto_21165 ) ) ( not ( = ?auto_21153 ?auto_21163 ) ) ( not ( = ?auto_21153 ?auto_21161 ) ) ( not ( = ?auto_21153 ?auto_21177 ) ) ( not ( = ?auto_21153 ?auto_21178 ) ) ( not ( = ?auto_21153 ?auto_21179 ) ) ( not ( = ?auto_21153 ?auto_21162 ) ) ( not ( = ?auto_21153 ?auto_21170 ) ) ( not ( = ?auto_21164 ?auto_21171 ) ) ( not ( = ?auto_21164 ?auto_21166 ) ) ( not ( = ?auto_21164 ?auto_21165 ) ) ( not ( = ?auto_21164 ?auto_21163 ) ) ( not ( = ?auto_21164 ?auto_21161 ) ) ( not ( = ?auto_21164 ?auto_21177 ) ) ( not ( = ?auto_21164 ?auto_21178 ) ) ( not ( = ?auto_21164 ?auto_21179 ) ) ( not ( = ?auto_21164 ?auto_21162 ) ) ( not ( = ?auto_21164 ?auto_21170 ) ) ( not ( = ?auto_21142 ?auto_21154 ) ) ( not ( = ?auto_21142 ?auto_21155 ) ) ( not ( = ?auto_21143 ?auto_21154 ) ) ( not ( = ?auto_21143 ?auto_21155 ) ) ( not ( = ?auto_21144 ?auto_21154 ) ) ( not ( = ?auto_21144 ?auto_21155 ) ) ( not ( = ?auto_21145 ?auto_21154 ) ) ( not ( = ?auto_21145 ?auto_21155 ) ) ( not ( = ?auto_21146 ?auto_21154 ) ) ( not ( = ?auto_21146 ?auto_21155 ) ) ( not ( = ?auto_21147 ?auto_21154 ) ) ( not ( = ?auto_21147 ?auto_21155 ) ) ( not ( = ?auto_21148 ?auto_21154 ) ) ( not ( = ?auto_21148 ?auto_21155 ) ) ( not ( = ?auto_21149 ?auto_21154 ) ) ( not ( = ?auto_21149 ?auto_21155 ) ) ( not ( = ?auto_21150 ?auto_21154 ) ) ( not ( = ?auto_21150 ?auto_21155 ) ) ( not ( = ?auto_21151 ?auto_21154 ) ) ( not ( = ?auto_21151 ?auto_21155 ) ) ( not ( = ?auto_21152 ?auto_21154 ) ) ( not ( = ?auto_21152 ?auto_21155 ) ) ( not ( = ?auto_21154 ?auto_21164 ) ) ( not ( = ?auto_21154 ?auto_21171 ) ) ( not ( = ?auto_21154 ?auto_21166 ) ) ( not ( = ?auto_21154 ?auto_21165 ) ) ( not ( = ?auto_21154 ?auto_21163 ) ) ( not ( = ?auto_21154 ?auto_21161 ) ) ( not ( = ?auto_21154 ?auto_21177 ) ) ( not ( = ?auto_21154 ?auto_21178 ) ) ( not ( = ?auto_21154 ?auto_21179 ) ) ( not ( = ?auto_21154 ?auto_21162 ) ) ( not ( = ?auto_21154 ?auto_21170 ) ) ( not ( = ?auto_21155 ?auto_21164 ) ) ( not ( = ?auto_21155 ?auto_21171 ) ) ( not ( = ?auto_21155 ?auto_21166 ) ) ( not ( = ?auto_21155 ?auto_21165 ) ) ( not ( = ?auto_21155 ?auto_21163 ) ) ( not ( = ?auto_21155 ?auto_21161 ) ) ( not ( = ?auto_21155 ?auto_21177 ) ) ( not ( = ?auto_21155 ?auto_21178 ) ) ( not ( = ?auto_21155 ?auto_21179 ) ) ( not ( = ?auto_21155 ?auto_21162 ) ) ( not ( = ?auto_21155 ?auto_21170 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_21142 ?auto_21143 ?auto_21144 ?auto_21145 ?auto_21146 ?auto_21147 ?auto_21148 ?auto_21149 ?auto_21150 ?auto_21151 ?auto_21152 ?auto_21153 )
      ( MAKE-1CRATE ?auto_21153 ?auto_21154 )
      ( MAKE-12CRATE-VERIFY ?auto_21142 ?auto_21143 ?auto_21144 ?auto_21145 ?auto_21146 ?auto_21147 ?auto_21148 ?auto_21149 ?auto_21150 ?auto_21151 ?auto_21152 ?auto_21153 ?auto_21154 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_21206 - SURFACE
      ?auto_21207 - SURFACE
      ?auto_21208 - SURFACE
      ?auto_21209 - SURFACE
      ?auto_21210 - SURFACE
      ?auto_21211 - SURFACE
      ?auto_21212 - SURFACE
      ?auto_21213 - SURFACE
      ?auto_21214 - SURFACE
      ?auto_21215 - SURFACE
      ?auto_21216 - SURFACE
      ?auto_21217 - SURFACE
      ?auto_21218 - SURFACE
      ?auto_21219 - SURFACE
    )
    :vars
    (
      ?auto_21221 - HOIST
      ?auto_21225 - PLACE
      ?auto_21224 - PLACE
      ?auto_21220 - HOIST
      ?auto_21223 - SURFACE
      ?auto_21249 - PLACE
      ?auto_21246 - HOIST
      ?auto_21243 - SURFACE
      ?auto_21242 - SURFACE
      ?auto_21230 - PLACE
      ?auto_21247 - HOIST
      ?auto_21232 - SURFACE
      ?auto_21239 - SURFACE
      ?auto_21245 - PLACE
      ?auto_21236 - HOIST
      ?auto_21238 - SURFACE
      ?auto_21240 - SURFACE
      ?auto_21229 - SURFACE
      ?auto_21244 - PLACE
      ?auto_21227 - HOIST
      ?auto_21226 - SURFACE
      ?auto_21248 - PLACE
      ?auto_21234 - HOIST
      ?auto_21231 - SURFACE
      ?auto_21233 - SURFACE
      ?auto_21228 - PLACE
      ?auto_21235 - HOIST
      ?auto_21237 - SURFACE
      ?auto_21241 - SURFACE
      ?auto_21222 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21221 ?auto_21225 ) ( IS-CRATE ?auto_21219 ) ( not ( = ?auto_21224 ?auto_21225 ) ) ( HOIST-AT ?auto_21220 ?auto_21224 ) ( AVAILABLE ?auto_21220 ) ( SURFACE-AT ?auto_21219 ?auto_21224 ) ( ON ?auto_21219 ?auto_21223 ) ( CLEAR ?auto_21219 ) ( not ( = ?auto_21218 ?auto_21219 ) ) ( not ( = ?auto_21218 ?auto_21223 ) ) ( not ( = ?auto_21219 ?auto_21223 ) ) ( not ( = ?auto_21221 ?auto_21220 ) ) ( IS-CRATE ?auto_21218 ) ( not ( = ?auto_21249 ?auto_21225 ) ) ( HOIST-AT ?auto_21246 ?auto_21249 ) ( SURFACE-AT ?auto_21218 ?auto_21249 ) ( ON ?auto_21218 ?auto_21243 ) ( CLEAR ?auto_21218 ) ( not ( = ?auto_21217 ?auto_21218 ) ) ( not ( = ?auto_21217 ?auto_21243 ) ) ( not ( = ?auto_21218 ?auto_21243 ) ) ( not ( = ?auto_21221 ?auto_21246 ) ) ( IS-CRATE ?auto_21217 ) ( SURFACE-AT ?auto_21217 ?auto_21249 ) ( ON ?auto_21217 ?auto_21242 ) ( CLEAR ?auto_21217 ) ( not ( = ?auto_21216 ?auto_21217 ) ) ( not ( = ?auto_21216 ?auto_21242 ) ) ( not ( = ?auto_21217 ?auto_21242 ) ) ( IS-CRATE ?auto_21216 ) ( not ( = ?auto_21230 ?auto_21225 ) ) ( HOIST-AT ?auto_21247 ?auto_21230 ) ( SURFACE-AT ?auto_21216 ?auto_21230 ) ( ON ?auto_21216 ?auto_21232 ) ( CLEAR ?auto_21216 ) ( not ( = ?auto_21215 ?auto_21216 ) ) ( not ( = ?auto_21215 ?auto_21232 ) ) ( not ( = ?auto_21216 ?auto_21232 ) ) ( not ( = ?auto_21221 ?auto_21247 ) ) ( IS-CRATE ?auto_21215 ) ( SURFACE-AT ?auto_21215 ?auto_21249 ) ( ON ?auto_21215 ?auto_21239 ) ( CLEAR ?auto_21215 ) ( not ( = ?auto_21214 ?auto_21215 ) ) ( not ( = ?auto_21214 ?auto_21239 ) ) ( not ( = ?auto_21215 ?auto_21239 ) ) ( IS-CRATE ?auto_21214 ) ( not ( = ?auto_21245 ?auto_21225 ) ) ( HOIST-AT ?auto_21236 ?auto_21245 ) ( SURFACE-AT ?auto_21214 ?auto_21245 ) ( ON ?auto_21214 ?auto_21238 ) ( CLEAR ?auto_21214 ) ( not ( = ?auto_21213 ?auto_21214 ) ) ( not ( = ?auto_21213 ?auto_21238 ) ) ( not ( = ?auto_21214 ?auto_21238 ) ) ( not ( = ?auto_21221 ?auto_21236 ) ) ( IS-CRATE ?auto_21213 ) ( AVAILABLE ?auto_21246 ) ( SURFACE-AT ?auto_21213 ?auto_21249 ) ( ON ?auto_21213 ?auto_21240 ) ( CLEAR ?auto_21213 ) ( not ( = ?auto_21212 ?auto_21213 ) ) ( not ( = ?auto_21212 ?auto_21240 ) ) ( not ( = ?auto_21213 ?auto_21240 ) ) ( IS-CRATE ?auto_21212 ) ( SURFACE-AT ?auto_21212 ?auto_21245 ) ( ON ?auto_21212 ?auto_21229 ) ( CLEAR ?auto_21212 ) ( not ( = ?auto_21211 ?auto_21212 ) ) ( not ( = ?auto_21211 ?auto_21229 ) ) ( not ( = ?auto_21212 ?auto_21229 ) ) ( IS-CRATE ?auto_21211 ) ( not ( = ?auto_21244 ?auto_21225 ) ) ( HOIST-AT ?auto_21227 ?auto_21244 ) ( AVAILABLE ?auto_21227 ) ( SURFACE-AT ?auto_21211 ?auto_21244 ) ( ON ?auto_21211 ?auto_21226 ) ( CLEAR ?auto_21211 ) ( not ( = ?auto_21210 ?auto_21211 ) ) ( not ( = ?auto_21210 ?auto_21226 ) ) ( not ( = ?auto_21211 ?auto_21226 ) ) ( not ( = ?auto_21221 ?auto_21227 ) ) ( IS-CRATE ?auto_21210 ) ( not ( = ?auto_21248 ?auto_21225 ) ) ( HOIST-AT ?auto_21234 ?auto_21248 ) ( AVAILABLE ?auto_21234 ) ( SURFACE-AT ?auto_21210 ?auto_21248 ) ( ON ?auto_21210 ?auto_21231 ) ( CLEAR ?auto_21210 ) ( not ( = ?auto_21209 ?auto_21210 ) ) ( not ( = ?auto_21209 ?auto_21231 ) ) ( not ( = ?auto_21210 ?auto_21231 ) ) ( not ( = ?auto_21221 ?auto_21234 ) ) ( IS-CRATE ?auto_21209 ) ( AVAILABLE ?auto_21247 ) ( SURFACE-AT ?auto_21209 ?auto_21230 ) ( ON ?auto_21209 ?auto_21233 ) ( CLEAR ?auto_21209 ) ( not ( = ?auto_21208 ?auto_21209 ) ) ( not ( = ?auto_21208 ?auto_21233 ) ) ( not ( = ?auto_21209 ?auto_21233 ) ) ( IS-CRATE ?auto_21208 ) ( not ( = ?auto_21228 ?auto_21225 ) ) ( HOIST-AT ?auto_21235 ?auto_21228 ) ( AVAILABLE ?auto_21235 ) ( SURFACE-AT ?auto_21208 ?auto_21228 ) ( ON ?auto_21208 ?auto_21237 ) ( CLEAR ?auto_21208 ) ( not ( = ?auto_21207 ?auto_21208 ) ) ( not ( = ?auto_21207 ?auto_21237 ) ) ( not ( = ?auto_21208 ?auto_21237 ) ) ( not ( = ?auto_21221 ?auto_21235 ) ) ( SURFACE-AT ?auto_21206 ?auto_21225 ) ( CLEAR ?auto_21206 ) ( IS-CRATE ?auto_21207 ) ( AVAILABLE ?auto_21221 ) ( AVAILABLE ?auto_21236 ) ( SURFACE-AT ?auto_21207 ?auto_21245 ) ( ON ?auto_21207 ?auto_21241 ) ( CLEAR ?auto_21207 ) ( TRUCK-AT ?auto_21222 ?auto_21225 ) ( not ( = ?auto_21206 ?auto_21207 ) ) ( not ( = ?auto_21206 ?auto_21241 ) ) ( not ( = ?auto_21207 ?auto_21241 ) ) ( not ( = ?auto_21206 ?auto_21208 ) ) ( not ( = ?auto_21206 ?auto_21237 ) ) ( not ( = ?auto_21208 ?auto_21241 ) ) ( not ( = ?auto_21228 ?auto_21245 ) ) ( not ( = ?auto_21235 ?auto_21236 ) ) ( not ( = ?auto_21237 ?auto_21241 ) ) ( not ( = ?auto_21206 ?auto_21209 ) ) ( not ( = ?auto_21206 ?auto_21233 ) ) ( not ( = ?auto_21207 ?auto_21209 ) ) ( not ( = ?auto_21207 ?auto_21233 ) ) ( not ( = ?auto_21209 ?auto_21237 ) ) ( not ( = ?auto_21209 ?auto_21241 ) ) ( not ( = ?auto_21230 ?auto_21228 ) ) ( not ( = ?auto_21230 ?auto_21245 ) ) ( not ( = ?auto_21247 ?auto_21235 ) ) ( not ( = ?auto_21247 ?auto_21236 ) ) ( not ( = ?auto_21233 ?auto_21237 ) ) ( not ( = ?auto_21233 ?auto_21241 ) ) ( not ( = ?auto_21206 ?auto_21210 ) ) ( not ( = ?auto_21206 ?auto_21231 ) ) ( not ( = ?auto_21207 ?auto_21210 ) ) ( not ( = ?auto_21207 ?auto_21231 ) ) ( not ( = ?auto_21208 ?auto_21210 ) ) ( not ( = ?auto_21208 ?auto_21231 ) ) ( not ( = ?auto_21210 ?auto_21233 ) ) ( not ( = ?auto_21210 ?auto_21237 ) ) ( not ( = ?auto_21210 ?auto_21241 ) ) ( not ( = ?auto_21248 ?auto_21230 ) ) ( not ( = ?auto_21248 ?auto_21228 ) ) ( not ( = ?auto_21248 ?auto_21245 ) ) ( not ( = ?auto_21234 ?auto_21247 ) ) ( not ( = ?auto_21234 ?auto_21235 ) ) ( not ( = ?auto_21234 ?auto_21236 ) ) ( not ( = ?auto_21231 ?auto_21233 ) ) ( not ( = ?auto_21231 ?auto_21237 ) ) ( not ( = ?auto_21231 ?auto_21241 ) ) ( not ( = ?auto_21206 ?auto_21211 ) ) ( not ( = ?auto_21206 ?auto_21226 ) ) ( not ( = ?auto_21207 ?auto_21211 ) ) ( not ( = ?auto_21207 ?auto_21226 ) ) ( not ( = ?auto_21208 ?auto_21211 ) ) ( not ( = ?auto_21208 ?auto_21226 ) ) ( not ( = ?auto_21209 ?auto_21211 ) ) ( not ( = ?auto_21209 ?auto_21226 ) ) ( not ( = ?auto_21211 ?auto_21231 ) ) ( not ( = ?auto_21211 ?auto_21233 ) ) ( not ( = ?auto_21211 ?auto_21237 ) ) ( not ( = ?auto_21211 ?auto_21241 ) ) ( not ( = ?auto_21244 ?auto_21248 ) ) ( not ( = ?auto_21244 ?auto_21230 ) ) ( not ( = ?auto_21244 ?auto_21228 ) ) ( not ( = ?auto_21244 ?auto_21245 ) ) ( not ( = ?auto_21227 ?auto_21234 ) ) ( not ( = ?auto_21227 ?auto_21247 ) ) ( not ( = ?auto_21227 ?auto_21235 ) ) ( not ( = ?auto_21227 ?auto_21236 ) ) ( not ( = ?auto_21226 ?auto_21231 ) ) ( not ( = ?auto_21226 ?auto_21233 ) ) ( not ( = ?auto_21226 ?auto_21237 ) ) ( not ( = ?auto_21226 ?auto_21241 ) ) ( not ( = ?auto_21206 ?auto_21212 ) ) ( not ( = ?auto_21206 ?auto_21229 ) ) ( not ( = ?auto_21207 ?auto_21212 ) ) ( not ( = ?auto_21207 ?auto_21229 ) ) ( not ( = ?auto_21208 ?auto_21212 ) ) ( not ( = ?auto_21208 ?auto_21229 ) ) ( not ( = ?auto_21209 ?auto_21212 ) ) ( not ( = ?auto_21209 ?auto_21229 ) ) ( not ( = ?auto_21210 ?auto_21212 ) ) ( not ( = ?auto_21210 ?auto_21229 ) ) ( not ( = ?auto_21212 ?auto_21226 ) ) ( not ( = ?auto_21212 ?auto_21231 ) ) ( not ( = ?auto_21212 ?auto_21233 ) ) ( not ( = ?auto_21212 ?auto_21237 ) ) ( not ( = ?auto_21212 ?auto_21241 ) ) ( not ( = ?auto_21229 ?auto_21226 ) ) ( not ( = ?auto_21229 ?auto_21231 ) ) ( not ( = ?auto_21229 ?auto_21233 ) ) ( not ( = ?auto_21229 ?auto_21237 ) ) ( not ( = ?auto_21229 ?auto_21241 ) ) ( not ( = ?auto_21206 ?auto_21213 ) ) ( not ( = ?auto_21206 ?auto_21240 ) ) ( not ( = ?auto_21207 ?auto_21213 ) ) ( not ( = ?auto_21207 ?auto_21240 ) ) ( not ( = ?auto_21208 ?auto_21213 ) ) ( not ( = ?auto_21208 ?auto_21240 ) ) ( not ( = ?auto_21209 ?auto_21213 ) ) ( not ( = ?auto_21209 ?auto_21240 ) ) ( not ( = ?auto_21210 ?auto_21213 ) ) ( not ( = ?auto_21210 ?auto_21240 ) ) ( not ( = ?auto_21211 ?auto_21213 ) ) ( not ( = ?auto_21211 ?auto_21240 ) ) ( not ( = ?auto_21213 ?auto_21229 ) ) ( not ( = ?auto_21213 ?auto_21226 ) ) ( not ( = ?auto_21213 ?auto_21231 ) ) ( not ( = ?auto_21213 ?auto_21233 ) ) ( not ( = ?auto_21213 ?auto_21237 ) ) ( not ( = ?auto_21213 ?auto_21241 ) ) ( not ( = ?auto_21249 ?auto_21245 ) ) ( not ( = ?auto_21249 ?auto_21244 ) ) ( not ( = ?auto_21249 ?auto_21248 ) ) ( not ( = ?auto_21249 ?auto_21230 ) ) ( not ( = ?auto_21249 ?auto_21228 ) ) ( not ( = ?auto_21246 ?auto_21236 ) ) ( not ( = ?auto_21246 ?auto_21227 ) ) ( not ( = ?auto_21246 ?auto_21234 ) ) ( not ( = ?auto_21246 ?auto_21247 ) ) ( not ( = ?auto_21246 ?auto_21235 ) ) ( not ( = ?auto_21240 ?auto_21229 ) ) ( not ( = ?auto_21240 ?auto_21226 ) ) ( not ( = ?auto_21240 ?auto_21231 ) ) ( not ( = ?auto_21240 ?auto_21233 ) ) ( not ( = ?auto_21240 ?auto_21237 ) ) ( not ( = ?auto_21240 ?auto_21241 ) ) ( not ( = ?auto_21206 ?auto_21214 ) ) ( not ( = ?auto_21206 ?auto_21238 ) ) ( not ( = ?auto_21207 ?auto_21214 ) ) ( not ( = ?auto_21207 ?auto_21238 ) ) ( not ( = ?auto_21208 ?auto_21214 ) ) ( not ( = ?auto_21208 ?auto_21238 ) ) ( not ( = ?auto_21209 ?auto_21214 ) ) ( not ( = ?auto_21209 ?auto_21238 ) ) ( not ( = ?auto_21210 ?auto_21214 ) ) ( not ( = ?auto_21210 ?auto_21238 ) ) ( not ( = ?auto_21211 ?auto_21214 ) ) ( not ( = ?auto_21211 ?auto_21238 ) ) ( not ( = ?auto_21212 ?auto_21214 ) ) ( not ( = ?auto_21212 ?auto_21238 ) ) ( not ( = ?auto_21214 ?auto_21240 ) ) ( not ( = ?auto_21214 ?auto_21229 ) ) ( not ( = ?auto_21214 ?auto_21226 ) ) ( not ( = ?auto_21214 ?auto_21231 ) ) ( not ( = ?auto_21214 ?auto_21233 ) ) ( not ( = ?auto_21214 ?auto_21237 ) ) ( not ( = ?auto_21214 ?auto_21241 ) ) ( not ( = ?auto_21238 ?auto_21240 ) ) ( not ( = ?auto_21238 ?auto_21229 ) ) ( not ( = ?auto_21238 ?auto_21226 ) ) ( not ( = ?auto_21238 ?auto_21231 ) ) ( not ( = ?auto_21238 ?auto_21233 ) ) ( not ( = ?auto_21238 ?auto_21237 ) ) ( not ( = ?auto_21238 ?auto_21241 ) ) ( not ( = ?auto_21206 ?auto_21215 ) ) ( not ( = ?auto_21206 ?auto_21239 ) ) ( not ( = ?auto_21207 ?auto_21215 ) ) ( not ( = ?auto_21207 ?auto_21239 ) ) ( not ( = ?auto_21208 ?auto_21215 ) ) ( not ( = ?auto_21208 ?auto_21239 ) ) ( not ( = ?auto_21209 ?auto_21215 ) ) ( not ( = ?auto_21209 ?auto_21239 ) ) ( not ( = ?auto_21210 ?auto_21215 ) ) ( not ( = ?auto_21210 ?auto_21239 ) ) ( not ( = ?auto_21211 ?auto_21215 ) ) ( not ( = ?auto_21211 ?auto_21239 ) ) ( not ( = ?auto_21212 ?auto_21215 ) ) ( not ( = ?auto_21212 ?auto_21239 ) ) ( not ( = ?auto_21213 ?auto_21215 ) ) ( not ( = ?auto_21213 ?auto_21239 ) ) ( not ( = ?auto_21215 ?auto_21238 ) ) ( not ( = ?auto_21215 ?auto_21240 ) ) ( not ( = ?auto_21215 ?auto_21229 ) ) ( not ( = ?auto_21215 ?auto_21226 ) ) ( not ( = ?auto_21215 ?auto_21231 ) ) ( not ( = ?auto_21215 ?auto_21233 ) ) ( not ( = ?auto_21215 ?auto_21237 ) ) ( not ( = ?auto_21215 ?auto_21241 ) ) ( not ( = ?auto_21239 ?auto_21238 ) ) ( not ( = ?auto_21239 ?auto_21240 ) ) ( not ( = ?auto_21239 ?auto_21229 ) ) ( not ( = ?auto_21239 ?auto_21226 ) ) ( not ( = ?auto_21239 ?auto_21231 ) ) ( not ( = ?auto_21239 ?auto_21233 ) ) ( not ( = ?auto_21239 ?auto_21237 ) ) ( not ( = ?auto_21239 ?auto_21241 ) ) ( not ( = ?auto_21206 ?auto_21216 ) ) ( not ( = ?auto_21206 ?auto_21232 ) ) ( not ( = ?auto_21207 ?auto_21216 ) ) ( not ( = ?auto_21207 ?auto_21232 ) ) ( not ( = ?auto_21208 ?auto_21216 ) ) ( not ( = ?auto_21208 ?auto_21232 ) ) ( not ( = ?auto_21209 ?auto_21216 ) ) ( not ( = ?auto_21209 ?auto_21232 ) ) ( not ( = ?auto_21210 ?auto_21216 ) ) ( not ( = ?auto_21210 ?auto_21232 ) ) ( not ( = ?auto_21211 ?auto_21216 ) ) ( not ( = ?auto_21211 ?auto_21232 ) ) ( not ( = ?auto_21212 ?auto_21216 ) ) ( not ( = ?auto_21212 ?auto_21232 ) ) ( not ( = ?auto_21213 ?auto_21216 ) ) ( not ( = ?auto_21213 ?auto_21232 ) ) ( not ( = ?auto_21214 ?auto_21216 ) ) ( not ( = ?auto_21214 ?auto_21232 ) ) ( not ( = ?auto_21216 ?auto_21239 ) ) ( not ( = ?auto_21216 ?auto_21238 ) ) ( not ( = ?auto_21216 ?auto_21240 ) ) ( not ( = ?auto_21216 ?auto_21229 ) ) ( not ( = ?auto_21216 ?auto_21226 ) ) ( not ( = ?auto_21216 ?auto_21231 ) ) ( not ( = ?auto_21216 ?auto_21233 ) ) ( not ( = ?auto_21216 ?auto_21237 ) ) ( not ( = ?auto_21216 ?auto_21241 ) ) ( not ( = ?auto_21232 ?auto_21239 ) ) ( not ( = ?auto_21232 ?auto_21238 ) ) ( not ( = ?auto_21232 ?auto_21240 ) ) ( not ( = ?auto_21232 ?auto_21229 ) ) ( not ( = ?auto_21232 ?auto_21226 ) ) ( not ( = ?auto_21232 ?auto_21231 ) ) ( not ( = ?auto_21232 ?auto_21233 ) ) ( not ( = ?auto_21232 ?auto_21237 ) ) ( not ( = ?auto_21232 ?auto_21241 ) ) ( not ( = ?auto_21206 ?auto_21217 ) ) ( not ( = ?auto_21206 ?auto_21242 ) ) ( not ( = ?auto_21207 ?auto_21217 ) ) ( not ( = ?auto_21207 ?auto_21242 ) ) ( not ( = ?auto_21208 ?auto_21217 ) ) ( not ( = ?auto_21208 ?auto_21242 ) ) ( not ( = ?auto_21209 ?auto_21217 ) ) ( not ( = ?auto_21209 ?auto_21242 ) ) ( not ( = ?auto_21210 ?auto_21217 ) ) ( not ( = ?auto_21210 ?auto_21242 ) ) ( not ( = ?auto_21211 ?auto_21217 ) ) ( not ( = ?auto_21211 ?auto_21242 ) ) ( not ( = ?auto_21212 ?auto_21217 ) ) ( not ( = ?auto_21212 ?auto_21242 ) ) ( not ( = ?auto_21213 ?auto_21217 ) ) ( not ( = ?auto_21213 ?auto_21242 ) ) ( not ( = ?auto_21214 ?auto_21217 ) ) ( not ( = ?auto_21214 ?auto_21242 ) ) ( not ( = ?auto_21215 ?auto_21217 ) ) ( not ( = ?auto_21215 ?auto_21242 ) ) ( not ( = ?auto_21217 ?auto_21232 ) ) ( not ( = ?auto_21217 ?auto_21239 ) ) ( not ( = ?auto_21217 ?auto_21238 ) ) ( not ( = ?auto_21217 ?auto_21240 ) ) ( not ( = ?auto_21217 ?auto_21229 ) ) ( not ( = ?auto_21217 ?auto_21226 ) ) ( not ( = ?auto_21217 ?auto_21231 ) ) ( not ( = ?auto_21217 ?auto_21233 ) ) ( not ( = ?auto_21217 ?auto_21237 ) ) ( not ( = ?auto_21217 ?auto_21241 ) ) ( not ( = ?auto_21242 ?auto_21232 ) ) ( not ( = ?auto_21242 ?auto_21239 ) ) ( not ( = ?auto_21242 ?auto_21238 ) ) ( not ( = ?auto_21242 ?auto_21240 ) ) ( not ( = ?auto_21242 ?auto_21229 ) ) ( not ( = ?auto_21242 ?auto_21226 ) ) ( not ( = ?auto_21242 ?auto_21231 ) ) ( not ( = ?auto_21242 ?auto_21233 ) ) ( not ( = ?auto_21242 ?auto_21237 ) ) ( not ( = ?auto_21242 ?auto_21241 ) ) ( not ( = ?auto_21206 ?auto_21218 ) ) ( not ( = ?auto_21206 ?auto_21243 ) ) ( not ( = ?auto_21207 ?auto_21218 ) ) ( not ( = ?auto_21207 ?auto_21243 ) ) ( not ( = ?auto_21208 ?auto_21218 ) ) ( not ( = ?auto_21208 ?auto_21243 ) ) ( not ( = ?auto_21209 ?auto_21218 ) ) ( not ( = ?auto_21209 ?auto_21243 ) ) ( not ( = ?auto_21210 ?auto_21218 ) ) ( not ( = ?auto_21210 ?auto_21243 ) ) ( not ( = ?auto_21211 ?auto_21218 ) ) ( not ( = ?auto_21211 ?auto_21243 ) ) ( not ( = ?auto_21212 ?auto_21218 ) ) ( not ( = ?auto_21212 ?auto_21243 ) ) ( not ( = ?auto_21213 ?auto_21218 ) ) ( not ( = ?auto_21213 ?auto_21243 ) ) ( not ( = ?auto_21214 ?auto_21218 ) ) ( not ( = ?auto_21214 ?auto_21243 ) ) ( not ( = ?auto_21215 ?auto_21218 ) ) ( not ( = ?auto_21215 ?auto_21243 ) ) ( not ( = ?auto_21216 ?auto_21218 ) ) ( not ( = ?auto_21216 ?auto_21243 ) ) ( not ( = ?auto_21218 ?auto_21242 ) ) ( not ( = ?auto_21218 ?auto_21232 ) ) ( not ( = ?auto_21218 ?auto_21239 ) ) ( not ( = ?auto_21218 ?auto_21238 ) ) ( not ( = ?auto_21218 ?auto_21240 ) ) ( not ( = ?auto_21218 ?auto_21229 ) ) ( not ( = ?auto_21218 ?auto_21226 ) ) ( not ( = ?auto_21218 ?auto_21231 ) ) ( not ( = ?auto_21218 ?auto_21233 ) ) ( not ( = ?auto_21218 ?auto_21237 ) ) ( not ( = ?auto_21218 ?auto_21241 ) ) ( not ( = ?auto_21243 ?auto_21242 ) ) ( not ( = ?auto_21243 ?auto_21232 ) ) ( not ( = ?auto_21243 ?auto_21239 ) ) ( not ( = ?auto_21243 ?auto_21238 ) ) ( not ( = ?auto_21243 ?auto_21240 ) ) ( not ( = ?auto_21243 ?auto_21229 ) ) ( not ( = ?auto_21243 ?auto_21226 ) ) ( not ( = ?auto_21243 ?auto_21231 ) ) ( not ( = ?auto_21243 ?auto_21233 ) ) ( not ( = ?auto_21243 ?auto_21237 ) ) ( not ( = ?auto_21243 ?auto_21241 ) ) ( not ( = ?auto_21206 ?auto_21219 ) ) ( not ( = ?auto_21206 ?auto_21223 ) ) ( not ( = ?auto_21207 ?auto_21219 ) ) ( not ( = ?auto_21207 ?auto_21223 ) ) ( not ( = ?auto_21208 ?auto_21219 ) ) ( not ( = ?auto_21208 ?auto_21223 ) ) ( not ( = ?auto_21209 ?auto_21219 ) ) ( not ( = ?auto_21209 ?auto_21223 ) ) ( not ( = ?auto_21210 ?auto_21219 ) ) ( not ( = ?auto_21210 ?auto_21223 ) ) ( not ( = ?auto_21211 ?auto_21219 ) ) ( not ( = ?auto_21211 ?auto_21223 ) ) ( not ( = ?auto_21212 ?auto_21219 ) ) ( not ( = ?auto_21212 ?auto_21223 ) ) ( not ( = ?auto_21213 ?auto_21219 ) ) ( not ( = ?auto_21213 ?auto_21223 ) ) ( not ( = ?auto_21214 ?auto_21219 ) ) ( not ( = ?auto_21214 ?auto_21223 ) ) ( not ( = ?auto_21215 ?auto_21219 ) ) ( not ( = ?auto_21215 ?auto_21223 ) ) ( not ( = ?auto_21216 ?auto_21219 ) ) ( not ( = ?auto_21216 ?auto_21223 ) ) ( not ( = ?auto_21217 ?auto_21219 ) ) ( not ( = ?auto_21217 ?auto_21223 ) ) ( not ( = ?auto_21219 ?auto_21243 ) ) ( not ( = ?auto_21219 ?auto_21242 ) ) ( not ( = ?auto_21219 ?auto_21232 ) ) ( not ( = ?auto_21219 ?auto_21239 ) ) ( not ( = ?auto_21219 ?auto_21238 ) ) ( not ( = ?auto_21219 ?auto_21240 ) ) ( not ( = ?auto_21219 ?auto_21229 ) ) ( not ( = ?auto_21219 ?auto_21226 ) ) ( not ( = ?auto_21219 ?auto_21231 ) ) ( not ( = ?auto_21219 ?auto_21233 ) ) ( not ( = ?auto_21219 ?auto_21237 ) ) ( not ( = ?auto_21219 ?auto_21241 ) ) ( not ( = ?auto_21224 ?auto_21249 ) ) ( not ( = ?auto_21224 ?auto_21230 ) ) ( not ( = ?auto_21224 ?auto_21245 ) ) ( not ( = ?auto_21224 ?auto_21244 ) ) ( not ( = ?auto_21224 ?auto_21248 ) ) ( not ( = ?auto_21224 ?auto_21228 ) ) ( not ( = ?auto_21220 ?auto_21246 ) ) ( not ( = ?auto_21220 ?auto_21247 ) ) ( not ( = ?auto_21220 ?auto_21236 ) ) ( not ( = ?auto_21220 ?auto_21227 ) ) ( not ( = ?auto_21220 ?auto_21234 ) ) ( not ( = ?auto_21220 ?auto_21235 ) ) ( not ( = ?auto_21223 ?auto_21243 ) ) ( not ( = ?auto_21223 ?auto_21242 ) ) ( not ( = ?auto_21223 ?auto_21232 ) ) ( not ( = ?auto_21223 ?auto_21239 ) ) ( not ( = ?auto_21223 ?auto_21238 ) ) ( not ( = ?auto_21223 ?auto_21240 ) ) ( not ( = ?auto_21223 ?auto_21229 ) ) ( not ( = ?auto_21223 ?auto_21226 ) ) ( not ( = ?auto_21223 ?auto_21231 ) ) ( not ( = ?auto_21223 ?auto_21233 ) ) ( not ( = ?auto_21223 ?auto_21237 ) ) ( not ( = ?auto_21223 ?auto_21241 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_21206 ?auto_21207 ?auto_21208 ?auto_21209 ?auto_21210 ?auto_21211 ?auto_21212 ?auto_21213 ?auto_21214 ?auto_21215 ?auto_21216 ?auto_21217 ?auto_21218 )
      ( MAKE-1CRATE ?auto_21218 ?auto_21219 )
      ( MAKE-13CRATE-VERIFY ?auto_21206 ?auto_21207 ?auto_21208 ?auto_21209 ?auto_21210 ?auto_21211 ?auto_21212 ?auto_21213 ?auto_21214 ?auto_21215 ?auto_21216 ?auto_21217 ?auto_21218 ?auto_21219 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_21275 - SURFACE
      ?auto_21276 - SURFACE
      ?auto_21277 - SURFACE
      ?auto_21278 - SURFACE
      ?auto_21279 - SURFACE
      ?auto_21280 - SURFACE
      ?auto_21281 - SURFACE
      ?auto_21282 - SURFACE
      ?auto_21283 - SURFACE
      ?auto_21284 - SURFACE
      ?auto_21285 - SURFACE
      ?auto_21286 - SURFACE
      ?auto_21287 - SURFACE
      ?auto_21289 - SURFACE
      ?auto_21288 - SURFACE
    )
    :vars
    (
      ?auto_21295 - HOIST
      ?auto_21292 - PLACE
      ?auto_21290 - PLACE
      ?auto_21294 - HOIST
      ?auto_21291 - SURFACE
      ?auto_21298 - PLACE
      ?auto_21311 - HOIST
      ?auto_21315 - SURFACE
      ?auto_21302 - PLACE
      ?auto_21299 - HOIST
      ?auto_21300 - SURFACE
      ?auto_21307 - SURFACE
      ?auto_21320 - SURFACE
      ?auto_21304 - SURFACE
      ?auto_21301 - PLACE
      ?auto_21318 - HOIST
      ?auto_21306 - SURFACE
      ?auto_21312 - SURFACE
      ?auto_21313 - SURFACE
      ?auto_21319 - PLACE
      ?auto_21309 - HOIST
      ?auto_21305 - SURFACE
      ?auto_21314 - PLACE
      ?auto_21317 - HOIST
      ?auto_21310 - SURFACE
      ?auto_21308 - SURFACE
      ?auto_21297 - PLACE
      ?auto_21303 - HOIST
      ?auto_21316 - SURFACE
      ?auto_21296 - SURFACE
      ?auto_21293 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21295 ?auto_21292 ) ( IS-CRATE ?auto_21288 ) ( not ( = ?auto_21290 ?auto_21292 ) ) ( HOIST-AT ?auto_21294 ?auto_21290 ) ( SURFACE-AT ?auto_21288 ?auto_21290 ) ( ON ?auto_21288 ?auto_21291 ) ( CLEAR ?auto_21288 ) ( not ( = ?auto_21289 ?auto_21288 ) ) ( not ( = ?auto_21289 ?auto_21291 ) ) ( not ( = ?auto_21288 ?auto_21291 ) ) ( not ( = ?auto_21295 ?auto_21294 ) ) ( IS-CRATE ?auto_21289 ) ( not ( = ?auto_21298 ?auto_21292 ) ) ( HOIST-AT ?auto_21311 ?auto_21298 ) ( AVAILABLE ?auto_21311 ) ( SURFACE-AT ?auto_21289 ?auto_21298 ) ( ON ?auto_21289 ?auto_21315 ) ( CLEAR ?auto_21289 ) ( not ( = ?auto_21287 ?auto_21289 ) ) ( not ( = ?auto_21287 ?auto_21315 ) ) ( not ( = ?auto_21289 ?auto_21315 ) ) ( not ( = ?auto_21295 ?auto_21311 ) ) ( IS-CRATE ?auto_21287 ) ( not ( = ?auto_21302 ?auto_21292 ) ) ( HOIST-AT ?auto_21299 ?auto_21302 ) ( SURFACE-AT ?auto_21287 ?auto_21302 ) ( ON ?auto_21287 ?auto_21300 ) ( CLEAR ?auto_21287 ) ( not ( = ?auto_21286 ?auto_21287 ) ) ( not ( = ?auto_21286 ?auto_21300 ) ) ( not ( = ?auto_21287 ?auto_21300 ) ) ( not ( = ?auto_21295 ?auto_21299 ) ) ( IS-CRATE ?auto_21286 ) ( SURFACE-AT ?auto_21286 ?auto_21302 ) ( ON ?auto_21286 ?auto_21307 ) ( CLEAR ?auto_21286 ) ( not ( = ?auto_21285 ?auto_21286 ) ) ( not ( = ?auto_21285 ?auto_21307 ) ) ( not ( = ?auto_21286 ?auto_21307 ) ) ( IS-CRATE ?auto_21285 ) ( SURFACE-AT ?auto_21285 ?auto_21290 ) ( ON ?auto_21285 ?auto_21320 ) ( CLEAR ?auto_21285 ) ( not ( = ?auto_21284 ?auto_21285 ) ) ( not ( = ?auto_21284 ?auto_21320 ) ) ( not ( = ?auto_21285 ?auto_21320 ) ) ( IS-CRATE ?auto_21284 ) ( SURFACE-AT ?auto_21284 ?auto_21302 ) ( ON ?auto_21284 ?auto_21304 ) ( CLEAR ?auto_21284 ) ( not ( = ?auto_21283 ?auto_21284 ) ) ( not ( = ?auto_21283 ?auto_21304 ) ) ( not ( = ?auto_21284 ?auto_21304 ) ) ( IS-CRATE ?auto_21283 ) ( not ( = ?auto_21301 ?auto_21292 ) ) ( HOIST-AT ?auto_21318 ?auto_21301 ) ( SURFACE-AT ?auto_21283 ?auto_21301 ) ( ON ?auto_21283 ?auto_21306 ) ( CLEAR ?auto_21283 ) ( not ( = ?auto_21282 ?auto_21283 ) ) ( not ( = ?auto_21282 ?auto_21306 ) ) ( not ( = ?auto_21283 ?auto_21306 ) ) ( not ( = ?auto_21295 ?auto_21318 ) ) ( IS-CRATE ?auto_21282 ) ( AVAILABLE ?auto_21299 ) ( SURFACE-AT ?auto_21282 ?auto_21302 ) ( ON ?auto_21282 ?auto_21312 ) ( CLEAR ?auto_21282 ) ( not ( = ?auto_21281 ?auto_21282 ) ) ( not ( = ?auto_21281 ?auto_21312 ) ) ( not ( = ?auto_21282 ?auto_21312 ) ) ( IS-CRATE ?auto_21281 ) ( SURFACE-AT ?auto_21281 ?auto_21301 ) ( ON ?auto_21281 ?auto_21313 ) ( CLEAR ?auto_21281 ) ( not ( = ?auto_21280 ?auto_21281 ) ) ( not ( = ?auto_21280 ?auto_21313 ) ) ( not ( = ?auto_21281 ?auto_21313 ) ) ( IS-CRATE ?auto_21280 ) ( not ( = ?auto_21319 ?auto_21292 ) ) ( HOIST-AT ?auto_21309 ?auto_21319 ) ( AVAILABLE ?auto_21309 ) ( SURFACE-AT ?auto_21280 ?auto_21319 ) ( ON ?auto_21280 ?auto_21305 ) ( CLEAR ?auto_21280 ) ( not ( = ?auto_21279 ?auto_21280 ) ) ( not ( = ?auto_21279 ?auto_21305 ) ) ( not ( = ?auto_21280 ?auto_21305 ) ) ( not ( = ?auto_21295 ?auto_21309 ) ) ( IS-CRATE ?auto_21279 ) ( not ( = ?auto_21314 ?auto_21292 ) ) ( HOIST-AT ?auto_21317 ?auto_21314 ) ( AVAILABLE ?auto_21317 ) ( SURFACE-AT ?auto_21279 ?auto_21314 ) ( ON ?auto_21279 ?auto_21310 ) ( CLEAR ?auto_21279 ) ( not ( = ?auto_21278 ?auto_21279 ) ) ( not ( = ?auto_21278 ?auto_21310 ) ) ( not ( = ?auto_21279 ?auto_21310 ) ) ( not ( = ?auto_21295 ?auto_21317 ) ) ( IS-CRATE ?auto_21278 ) ( AVAILABLE ?auto_21294 ) ( SURFACE-AT ?auto_21278 ?auto_21290 ) ( ON ?auto_21278 ?auto_21308 ) ( CLEAR ?auto_21278 ) ( not ( = ?auto_21277 ?auto_21278 ) ) ( not ( = ?auto_21277 ?auto_21308 ) ) ( not ( = ?auto_21278 ?auto_21308 ) ) ( IS-CRATE ?auto_21277 ) ( not ( = ?auto_21297 ?auto_21292 ) ) ( HOIST-AT ?auto_21303 ?auto_21297 ) ( AVAILABLE ?auto_21303 ) ( SURFACE-AT ?auto_21277 ?auto_21297 ) ( ON ?auto_21277 ?auto_21316 ) ( CLEAR ?auto_21277 ) ( not ( = ?auto_21276 ?auto_21277 ) ) ( not ( = ?auto_21276 ?auto_21316 ) ) ( not ( = ?auto_21277 ?auto_21316 ) ) ( not ( = ?auto_21295 ?auto_21303 ) ) ( SURFACE-AT ?auto_21275 ?auto_21292 ) ( CLEAR ?auto_21275 ) ( IS-CRATE ?auto_21276 ) ( AVAILABLE ?auto_21295 ) ( AVAILABLE ?auto_21318 ) ( SURFACE-AT ?auto_21276 ?auto_21301 ) ( ON ?auto_21276 ?auto_21296 ) ( CLEAR ?auto_21276 ) ( TRUCK-AT ?auto_21293 ?auto_21292 ) ( not ( = ?auto_21275 ?auto_21276 ) ) ( not ( = ?auto_21275 ?auto_21296 ) ) ( not ( = ?auto_21276 ?auto_21296 ) ) ( not ( = ?auto_21275 ?auto_21277 ) ) ( not ( = ?auto_21275 ?auto_21316 ) ) ( not ( = ?auto_21277 ?auto_21296 ) ) ( not ( = ?auto_21297 ?auto_21301 ) ) ( not ( = ?auto_21303 ?auto_21318 ) ) ( not ( = ?auto_21316 ?auto_21296 ) ) ( not ( = ?auto_21275 ?auto_21278 ) ) ( not ( = ?auto_21275 ?auto_21308 ) ) ( not ( = ?auto_21276 ?auto_21278 ) ) ( not ( = ?auto_21276 ?auto_21308 ) ) ( not ( = ?auto_21278 ?auto_21316 ) ) ( not ( = ?auto_21278 ?auto_21296 ) ) ( not ( = ?auto_21290 ?auto_21297 ) ) ( not ( = ?auto_21290 ?auto_21301 ) ) ( not ( = ?auto_21294 ?auto_21303 ) ) ( not ( = ?auto_21294 ?auto_21318 ) ) ( not ( = ?auto_21308 ?auto_21316 ) ) ( not ( = ?auto_21308 ?auto_21296 ) ) ( not ( = ?auto_21275 ?auto_21279 ) ) ( not ( = ?auto_21275 ?auto_21310 ) ) ( not ( = ?auto_21276 ?auto_21279 ) ) ( not ( = ?auto_21276 ?auto_21310 ) ) ( not ( = ?auto_21277 ?auto_21279 ) ) ( not ( = ?auto_21277 ?auto_21310 ) ) ( not ( = ?auto_21279 ?auto_21308 ) ) ( not ( = ?auto_21279 ?auto_21316 ) ) ( not ( = ?auto_21279 ?auto_21296 ) ) ( not ( = ?auto_21314 ?auto_21290 ) ) ( not ( = ?auto_21314 ?auto_21297 ) ) ( not ( = ?auto_21314 ?auto_21301 ) ) ( not ( = ?auto_21317 ?auto_21294 ) ) ( not ( = ?auto_21317 ?auto_21303 ) ) ( not ( = ?auto_21317 ?auto_21318 ) ) ( not ( = ?auto_21310 ?auto_21308 ) ) ( not ( = ?auto_21310 ?auto_21316 ) ) ( not ( = ?auto_21310 ?auto_21296 ) ) ( not ( = ?auto_21275 ?auto_21280 ) ) ( not ( = ?auto_21275 ?auto_21305 ) ) ( not ( = ?auto_21276 ?auto_21280 ) ) ( not ( = ?auto_21276 ?auto_21305 ) ) ( not ( = ?auto_21277 ?auto_21280 ) ) ( not ( = ?auto_21277 ?auto_21305 ) ) ( not ( = ?auto_21278 ?auto_21280 ) ) ( not ( = ?auto_21278 ?auto_21305 ) ) ( not ( = ?auto_21280 ?auto_21310 ) ) ( not ( = ?auto_21280 ?auto_21308 ) ) ( not ( = ?auto_21280 ?auto_21316 ) ) ( not ( = ?auto_21280 ?auto_21296 ) ) ( not ( = ?auto_21319 ?auto_21314 ) ) ( not ( = ?auto_21319 ?auto_21290 ) ) ( not ( = ?auto_21319 ?auto_21297 ) ) ( not ( = ?auto_21319 ?auto_21301 ) ) ( not ( = ?auto_21309 ?auto_21317 ) ) ( not ( = ?auto_21309 ?auto_21294 ) ) ( not ( = ?auto_21309 ?auto_21303 ) ) ( not ( = ?auto_21309 ?auto_21318 ) ) ( not ( = ?auto_21305 ?auto_21310 ) ) ( not ( = ?auto_21305 ?auto_21308 ) ) ( not ( = ?auto_21305 ?auto_21316 ) ) ( not ( = ?auto_21305 ?auto_21296 ) ) ( not ( = ?auto_21275 ?auto_21281 ) ) ( not ( = ?auto_21275 ?auto_21313 ) ) ( not ( = ?auto_21276 ?auto_21281 ) ) ( not ( = ?auto_21276 ?auto_21313 ) ) ( not ( = ?auto_21277 ?auto_21281 ) ) ( not ( = ?auto_21277 ?auto_21313 ) ) ( not ( = ?auto_21278 ?auto_21281 ) ) ( not ( = ?auto_21278 ?auto_21313 ) ) ( not ( = ?auto_21279 ?auto_21281 ) ) ( not ( = ?auto_21279 ?auto_21313 ) ) ( not ( = ?auto_21281 ?auto_21305 ) ) ( not ( = ?auto_21281 ?auto_21310 ) ) ( not ( = ?auto_21281 ?auto_21308 ) ) ( not ( = ?auto_21281 ?auto_21316 ) ) ( not ( = ?auto_21281 ?auto_21296 ) ) ( not ( = ?auto_21313 ?auto_21305 ) ) ( not ( = ?auto_21313 ?auto_21310 ) ) ( not ( = ?auto_21313 ?auto_21308 ) ) ( not ( = ?auto_21313 ?auto_21316 ) ) ( not ( = ?auto_21313 ?auto_21296 ) ) ( not ( = ?auto_21275 ?auto_21282 ) ) ( not ( = ?auto_21275 ?auto_21312 ) ) ( not ( = ?auto_21276 ?auto_21282 ) ) ( not ( = ?auto_21276 ?auto_21312 ) ) ( not ( = ?auto_21277 ?auto_21282 ) ) ( not ( = ?auto_21277 ?auto_21312 ) ) ( not ( = ?auto_21278 ?auto_21282 ) ) ( not ( = ?auto_21278 ?auto_21312 ) ) ( not ( = ?auto_21279 ?auto_21282 ) ) ( not ( = ?auto_21279 ?auto_21312 ) ) ( not ( = ?auto_21280 ?auto_21282 ) ) ( not ( = ?auto_21280 ?auto_21312 ) ) ( not ( = ?auto_21282 ?auto_21313 ) ) ( not ( = ?auto_21282 ?auto_21305 ) ) ( not ( = ?auto_21282 ?auto_21310 ) ) ( not ( = ?auto_21282 ?auto_21308 ) ) ( not ( = ?auto_21282 ?auto_21316 ) ) ( not ( = ?auto_21282 ?auto_21296 ) ) ( not ( = ?auto_21302 ?auto_21301 ) ) ( not ( = ?auto_21302 ?auto_21319 ) ) ( not ( = ?auto_21302 ?auto_21314 ) ) ( not ( = ?auto_21302 ?auto_21290 ) ) ( not ( = ?auto_21302 ?auto_21297 ) ) ( not ( = ?auto_21299 ?auto_21318 ) ) ( not ( = ?auto_21299 ?auto_21309 ) ) ( not ( = ?auto_21299 ?auto_21317 ) ) ( not ( = ?auto_21299 ?auto_21294 ) ) ( not ( = ?auto_21299 ?auto_21303 ) ) ( not ( = ?auto_21312 ?auto_21313 ) ) ( not ( = ?auto_21312 ?auto_21305 ) ) ( not ( = ?auto_21312 ?auto_21310 ) ) ( not ( = ?auto_21312 ?auto_21308 ) ) ( not ( = ?auto_21312 ?auto_21316 ) ) ( not ( = ?auto_21312 ?auto_21296 ) ) ( not ( = ?auto_21275 ?auto_21283 ) ) ( not ( = ?auto_21275 ?auto_21306 ) ) ( not ( = ?auto_21276 ?auto_21283 ) ) ( not ( = ?auto_21276 ?auto_21306 ) ) ( not ( = ?auto_21277 ?auto_21283 ) ) ( not ( = ?auto_21277 ?auto_21306 ) ) ( not ( = ?auto_21278 ?auto_21283 ) ) ( not ( = ?auto_21278 ?auto_21306 ) ) ( not ( = ?auto_21279 ?auto_21283 ) ) ( not ( = ?auto_21279 ?auto_21306 ) ) ( not ( = ?auto_21280 ?auto_21283 ) ) ( not ( = ?auto_21280 ?auto_21306 ) ) ( not ( = ?auto_21281 ?auto_21283 ) ) ( not ( = ?auto_21281 ?auto_21306 ) ) ( not ( = ?auto_21283 ?auto_21312 ) ) ( not ( = ?auto_21283 ?auto_21313 ) ) ( not ( = ?auto_21283 ?auto_21305 ) ) ( not ( = ?auto_21283 ?auto_21310 ) ) ( not ( = ?auto_21283 ?auto_21308 ) ) ( not ( = ?auto_21283 ?auto_21316 ) ) ( not ( = ?auto_21283 ?auto_21296 ) ) ( not ( = ?auto_21306 ?auto_21312 ) ) ( not ( = ?auto_21306 ?auto_21313 ) ) ( not ( = ?auto_21306 ?auto_21305 ) ) ( not ( = ?auto_21306 ?auto_21310 ) ) ( not ( = ?auto_21306 ?auto_21308 ) ) ( not ( = ?auto_21306 ?auto_21316 ) ) ( not ( = ?auto_21306 ?auto_21296 ) ) ( not ( = ?auto_21275 ?auto_21284 ) ) ( not ( = ?auto_21275 ?auto_21304 ) ) ( not ( = ?auto_21276 ?auto_21284 ) ) ( not ( = ?auto_21276 ?auto_21304 ) ) ( not ( = ?auto_21277 ?auto_21284 ) ) ( not ( = ?auto_21277 ?auto_21304 ) ) ( not ( = ?auto_21278 ?auto_21284 ) ) ( not ( = ?auto_21278 ?auto_21304 ) ) ( not ( = ?auto_21279 ?auto_21284 ) ) ( not ( = ?auto_21279 ?auto_21304 ) ) ( not ( = ?auto_21280 ?auto_21284 ) ) ( not ( = ?auto_21280 ?auto_21304 ) ) ( not ( = ?auto_21281 ?auto_21284 ) ) ( not ( = ?auto_21281 ?auto_21304 ) ) ( not ( = ?auto_21282 ?auto_21284 ) ) ( not ( = ?auto_21282 ?auto_21304 ) ) ( not ( = ?auto_21284 ?auto_21306 ) ) ( not ( = ?auto_21284 ?auto_21312 ) ) ( not ( = ?auto_21284 ?auto_21313 ) ) ( not ( = ?auto_21284 ?auto_21305 ) ) ( not ( = ?auto_21284 ?auto_21310 ) ) ( not ( = ?auto_21284 ?auto_21308 ) ) ( not ( = ?auto_21284 ?auto_21316 ) ) ( not ( = ?auto_21284 ?auto_21296 ) ) ( not ( = ?auto_21304 ?auto_21306 ) ) ( not ( = ?auto_21304 ?auto_21312 ) ) ( not ( = ?auto_21304 ?auto_21313 ) ) ( not ( = ?auto_21304 ?auto_21305 ) ) ( not ( = ?auto_21304 ?auto_21310 ) ) ( not ( = ?auto_21304 ?auto_21308 ) ) ( not ( = ?auto_21304 ?auto_21316 ) ) ( not ( = ?auto_21304 ?auto_21296 ) ) ( not ( = ?auto_21275 ?auto_21285 ) ) ( not ( = ?auto_21275 ?auto_21320 ) ) ( not ( = ?auto_21276 ?auto_21285 ) ) ( not ( = ?auto_21276 ?auto_21320 ) ) ( not ( = ?auto_21277 ?auto_21285 ) ) ( not ( = ?auto_21277 ?auto_21320 ) ) ( not ( = ?auto_21278 ?auto_21285 ) ) ( not ( = ?auto_21278 ?auto_21320 ) ) ( not ( = ?auto_21279 ?auto_21285 ) ) ( not ( = ?auto_21279 ?auto_21320 ) ) ( not ( = ?auto_21280 ?auto_21285 ) ) ( not ( = ?auto_21280 ?auto_21320 ) ) ( not ( = ?auto_21281 ?auto_21285 ) ) ( not ( = ?auto_21281 ?auto_21320 ) ) ( not ( = ?auto_21282 ?auto_21285 ) ) ( not ( = ?auto_21282 ?auto_21320 ) ) ( not ( = ?auto_21283 ?auto_21285 ) ) ( not ( = ?auto_21283 ?auto_21320 ) ) ( not ( = ?auto_21285 ?auto_21304 ) ) ( not ( = ?auto_21285 ?auto_21306 ) ) ( not ( = ?auto_21285 ?auto_21312 ) ) ( not ( = ?auto_21285 ?auto_21313 ) ) ( not ( = ?auto_21285 ?auto_21305 ) ) ( not ( = ?auto_21285 ?auto_21310 ) ) ( not ( = ?auto_21285 ?auto_21308 ) ) ( not ( = ?auto_21285 ?auto_21316 ) ) ( not ( = ?auto_21285 ?auto_21296 ) ) ( not ( = ?auto_21320 ?auto_21304 ) ) ( not ( = ?auto_21320 ?auto_21306 ) ) ( not ( = ?auto_21320 ?auto_21312 ) ) ( not ( = ?auto_21320 ?auto_21313 ) ) ( not ( = ?auto_21320 ?auto_21305 ) ) ( not ( = ?auto_21320 ?auto_21310 ) ) ( not ( = ?auto_21320 ?auto_21308 ) ) ( not ( = ?auto_21320 ?auto_21316 ) ) ( not ( = ?auto_21320 ?auto_21296 ) ) ( not ( = ?auto_21275 ?auto_21286 ) ) ( not ( = ?auto_21275 ?auto_21307 ) ) ( not ( = ?auto_21276 ?auto_21286 ) ) ( not ( = ?auto_21276 ?auto_21307 ) ) ( not ( = ?auto_21277 ?auto_21286 ) ) ( not ( = ?auto_21277 ?auto_21307 ) ) ( not ( = ?auto_21278 ?auto_21286 ) ) ( not ( = ?auto_21278 ?auto_21307 ) ) ( not ( = ?auto_21279 ?auto_21286 ) ) ( not ( = ?auto_21279 ?auto_21307 ) ) ( not ( = ?auto_21280 ?auto_21286 ) ) ( not ( = ?auto_21280 ?auto_21307 ) ) ( not ( = ?auto_21281 ?auto_21286 ) ) ( not ( = ?auto_21281 ?auto_21307 ) ) ( not ( = ?auto_21282 ?auto_21286 ) ) ( not ( = ?auto_21282 ?auto_21307 ) ) ( not ( = ?auto_21283 ?auto_21286 ) ) ( not ( = ?auto_21283 ?auto_21307 ) ) ( not ( = ?auto_21284 ?auto_21286 ) ) ( not ( = ?auto_21284 ?auto_21307 ) ) ( not ( = ?auto_21286 ?auto_21320 ) ) ( not ( = ?auto_21286 ?auto_21304 ) ) ( not ( = ?auto_21286 ?auto_21306 ) ) ( not ( = ?auto_21286 ?auto_21312 ) ) ( not ( = ?auto_21286 ?auto_21313 ) ) ( not ( = ?auto_21286 ?auto_21305 ) ) ( not ( = ?auto_21286 ?auto_21310 ) ) ( not ( = ?auto_21286 ?auto_21308 ) ) ( not ( = ?auto_21286 ?auto_21316 ) ) ( not ( = ?auto_21286 ?auto_21296 ) ) ( not ( = ?auto_21307 ?auto_21320 ) ) ( not ( = ?auto_21307 ?auto_21304 ) ) ( not ( = ?auto_21307 ?auto_21306 ) ) ( not ( = ?auto_21307 ?auto_21312 ) ) ( not ( = ?auto_21307 ?auto_21313 ) ) ( not ( = ?auto_21307 ?auto_21305 ) ) ( not ( = ?auto_21307 ?auto_21310 ) ) ( not ( = ?auto_21307 ?auto_21308 ) ) ( not ( = ?auto_21307 ?auto_21316 ) ) ( not ( = ?auto_21307 ?auto_21296 ) ) ( not ( = ?auto_21275 ?auto_21287 ) ) ( not ( = ?auto_21275 ?auto_21300 ) ) ( not ( = ?auto_21276 ?auto_21287 ) ) ( not ( = ?auto_21276 ?auto_21300 ) ) ( not ( = ?auto_21277 ?auto_21287 ) ) ( not ( = ?auto_21277 ?auto_21300 ) ) ( not ( = ?auto_21278 ?auto_21287 ) ) ( not ( = ?auto_21278 ?auto_21300 ) ) ( not ( = ?auto_21279 ?auto_21287 ) ) ( not ( = ?auto_21279 ?auto_21300 ) ) ( not ( = ?auto_21280 ?auto_21287 ) ) ( not ( = ?auto_21280 ?auto_21300 ) ) ( not ( = ?auto_21281 ?auto_21287 ) ) ( not ( = ?auto_21281 ?auto_21300 ) ) ( not ( = ?auto_21282 ?auto_21287 ) ) ( not ( = ?auto_21282 ?auto_21300 ) ) ( not ( = ?auto_21283 ?auto_21287 ) ) ( not ( = ?auto_21283 ?auto_21300 ) ) ( not ( = ?auto_21284 ?auto_21287 ) ) ( not ( = ?auto_21284 ?auto_21300 ) ) ( not ( = ?auto_21285 ?auto_21287 ) ) ( not ( = ?auto_21285 ?auto_21300 ) ) ( not ( = ?auto_21287 ?auto_21307 ) ) ( not ( = ?auto_21287 ?auto_21320 ) ) ( not ( = ?auto_21287 ?auto_21304 ) ) ( not ( = ?auto_21287 ?auto_21306 ) ) ( not ( = ?auto_21287 ?auto_21312 ) ) ( not ( = ?auto_21287 ?auto_21313 ) ) ( not ( = ?auto_21287 ?auto_21305 ) ) ( not ( = ?auto_21287 ?auto_21310 ) ) ( not ( = ?auto_21287 ?auto_21308 ) ) ( not ( = ?auto_21287 ?auto_21316 ) ) ( not ( = ?auto_21287 ?auto_21296 ) ) ( not ( = ?auto_21300 ?auto_21307 ) ) ( not ( = ?auto_21300 ?auto_21320 ) ) ( not ( = ?auto_21300 ?auto_21304 ) ) ( not ( = ?auto_21300 ?auto_21306 ) ) ( not ( = ?auto_21300 ?auto_21312 ) ) ( not ( = ?auto_21300 ?auto_21313 ) ) ( not ( = ?auto_21300 ?auto_21305 ) ) ( not ( = ?auto_21300 ?auto_21310 ) ) ( not ( = ?auto_21300 ?auto_21308 ) ) ( not ( = ?auto_21300 ?auto_21316 ) ) ( not ( = ?auto_21300 ?auto_21296 ) ) ( not ( = ?auto_21275 ?auto_21289 ) ) ( not ( = ?auto_21275 ?auto_21315 ) ) ( not ( = ?auto_21276 ?auto_21289 ) ) ( not ( = ?auto_21276 ?auto_21315 ) ) ( not ( = ?auto_21277 ?auto_21289 ) ) ( not ( = ?auto_21277 ?auto_21315 ) ) ( not ( = ?auto_21278 ?auto_21289 ) ) ( not ( = ?auto_21278 ?auto_21315 ) ) ( not ( = ?auto_21279 ?auto_21289 ) ) ( not ( = ?auto_21279 ?auto_21315 ) ) ( not ( = ?auto_21280 ?auto_21289 ) ) ( not ( = ?auto_21280 ?auto_21315 ) ) ( not ( = ?auto_21281 ?auto_21289 ) ) ( not ( = ?auto_21281 ?auto_21315 ) ) ( not ( = ?auto_21282 ?auto_21289 ) ) ( not ( = ?auto_21282 ?auto_21315 ) ) ( not ( = ?auto_21283 ?auto_21289 ) ) ( not ( = ?auto_21283 ?auto_21315 ) ) ( not ( = ?auto_21284 ?auto_21289 ) ) ( not ( = ?auto_21284 ?auto_21315 ) ) ( not ( = ?auto_21285 ?auto_21289 ) ) ( not ( = ?auto_21285 ?auto_21315 ) ) ( not ( = ?auto_21286 ?auto_21289 ) ) ( not ( = ?auto_21286 ?auto_21315 ) ) ( not ( = ?auto_21289 ?auto_21300 ) ) ( not ( = ?auto_21289 ?auto_21307 ) ) ( not ( = ?auto_21289 ?auto_21320 ) ) ( not ( = ?auto_21289 ?auto_21304 ) ) ( not ( = ?auto_21289 ?auto_21306 ) ) ( not ( = ?auto_21289 ?auto_21312 ) ) ( not ( = ?auto_21289 ?auto_21313 ) ) ( not ( = ?auto_21289 ?auto_21305 ) ) ( not ( = ?auto_21289 ?auto_21310 ) ) ( not ( = ?auto_21289 ?auto_21308 ) ) ( not ( = ?auto_21289 ?auto_21316 ) ) ( not ( = ?auto_21289 ?auto_21296 ) ) ( not ( = ?auto_21298 ?auto_21302 ) ) ( not ( = ?auto_21298 ?auto_21290 ) ) ( not ( = ?auto_21298 ?auto_21301 ) ) ( not ( = ?auto_21298 ?auto_21319 ) ) ( not ( = ?auto_21298 ?auto_21314 ) ) ( not ( = ?auto_21298 ?auto_21297 ) ) ( not ( = ?auto_21311 ?auto_21299 ) ) ( not ( = ?auto_21311 ?auto_21294 ) ) ( not ( = ?auto_21311 ?auto_21318 ) ) ( not ( = ?auto_21311 ?auto_21309 ) ) ( not ( = ?auto_21311 ?auto_21317 ) ) ( not ( = ?auto_21311 ?auto_21303 ) ) ( not ( = ?auto_21315 ?auto_21300 ) ) ( not ( = ?auto_21315 ?auto_21307 ) ) ( not ( = ?auto_21315 ?auto_21320 ) ) ( not ( = ?auto_21315 ?auto_21304 ) ) ( not ( = ?auto_21315 ?auto_21306 ) ) ( not ( = ?auto_21315 ?auto_21312 ) ) ( not ( = ?auto_21315 ?auto_21313 ) ) ( not ( = ?auto_21315 ?auto_21305 ) ) ( not ( = ?auto_21315 ?auto_21310 ) ) ( not ( = ?auto_21315 ?auto_21308 ) ) ( not ( = ?auto_21315 ?auto_21316 ) ) ( not ( = ?auto_21315 ?auto_21296 ) ) ( not ( = ?auto_21275 ?auto_21288 ) ) ( not ( = ?auto_21275 ?auto_21291 ) ) ( not ( = ?auto_21276 ?auto_21288 ) ) ( not ( = ?auto_21276 ?auto_21291 ) ) ( not ( = ?auto_21277 ?auto_21288 ) ) ( not ( = ?auto_21277 ?auto_21291 ) ) ( not ( = ?auto_21278 ?auto_21288 ) ) ( not ( = ?auto_21278 ?auto_21291 ) ) ( not ( = ?auto_21279 ?auto_21288 ) ) ( not ( = ?auto_21279 ?auto_21291 ) ) ( not ( = ?auto_21280 ?auto_21288 ) ) ( not ( = ?auto_21280 ?auto_21291 ) ) ( not ( = ?auto_21281 ?auto_21288 ) ) ( not ( = ?auto_21281 ?auto_21291 ) ) ( not ( = ?auto_21282 ?auto_21288 ) ) ( not ( = ?auto_21282 ?auto_21291 ) ) ( not ( = ?auto_21283 ?auto_21288 ) ) ( not ( = ?auto_21283 ?auto_21291 ) ) ( not ( = ?auto_21284 ?auto_21288 ) ) ( not ( = ?auto_21284 ?auto_21291 ) ) ( not ( = ?auto_21285 ?auto_21288 ) ) ( not ( = ?auto_21285 ?auto_21291 ) ) ( not ( = ?auto_21286 ?auto_21288 ) ) ( not ( = ?auto_21286 ?auto_21291 ) ) ( not ( = ?auto_21287 ?auto_21288 ) ) ( not ( = ?auto_21287 ?auto_21291 ) ) ( not ( = ?auto_21288 ?auto_21315 ) ) ( not ( = ?auto_21288 ?auto_21300 ) ) ( not ( = ?auto_21288 ?auto_21307 ) ) ( not ( = ?auto_21288 ?auto_21320 ) ) ( not ( = ?auto_21288 ?auto_21304 ) ) ( not ( = ?auto_21288 ?auto_21306 ) ) ( not ( = ?auto_21288 ?auto_21312 ) ) ( not ( = ?auto_21288 ?auto_21313 ) ) ( not ( = ?auto_21288 ?auto_21305 ) ) ( not ( = ?auto_21288 ?auto_21310 ) ) ( not ( = ?auto_21288 ?auto_21308 ) ) ( not ( = ?auto_21288 ?auto_21316 ) ) ( not ( = ?auto_21288 ?auto_21296 ) ) ( not ( = ?auto_21291 ?auto_21315 ) ) ( not ( = ?auto_21291 ?auto_21300 ) ) ( not ( = ?auto_21291 ?auto_21307 ) ) ( not ( = ?auto_21291 ?auto_21320 ) ) ( not ( = ?auto_21291 ?auto_21304 ) ) ( not ( = ?auto_21291 ?auto_21306 ) ) ( not ( = ?auto_21291 ?auto_21312 ) ) ( not ( = ?auto_21291 ?auto_21313 ) ) ( not ( = ?auto_21291 ?auto_21305 ) ) ( not ( = ?auto_21291 ?auto_21310 ) ) ( not ( = ?auto_21291 ?auto_21308 ) ) ( not ( = ?auto_21291 ?auto_21316 ) ) ( not ( = ?auto_21291 ?auto_21296 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_21275 ?auto_21276 ?auto_21277 ?auto_21278 ?auto_21279 ?auto_21280 ?auto_21281 ?auto_21282 ?auto_21283 ?auto_21284 ?auto_21285 ?auto_21286 ?auto_21287 ?auto_21289 )
      ( MAKE-1CRATE ?auto_21289 ?auto_21288 )
      ( MAKE-14CRATE-VERIFY ?auto_21275 ?auto_21276 ?auto_21277 ?auto_21278 ?auto_21279 ?auto_21280 ?auto_21281 ?auto_21282 ?auto_21283 ?auto_21284 ?auto_21285 ?auto_21286 ?auto_21287 ?auto_21289 ?auto_21288 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_21347 - SURFACE
      ?auto_21348 - SURFACE
      ?auto_21349 - SURFACE
      ?auto_21350 - SURFACE
      ?auto_21351 - SURFACE
      ?auto_21352 - SURFACE
      ?auto_21353 - SURFACE
      ?auto_21354 - SURFACE
      ?auto_21355 - SURFACE
      ?auto_21356 - SURFACE
      ?auto_21357 - SURFACE
      ?auto_21358 - SURFACE
      ?auto_21359 - SURFACE
      ?auto_21361 - SURFACE
      ?auto_21360 - SURFACE
      ?auto_21362 - SURFACE
    )
    :vars
    (
      ?auto_21365 - HOIST
      ?auto_21368 - PLACE
      ?auto_21363 - PLACE
      ?auto_21364 - HOIST
      ?auto_21366 - SURFACE
      ?auto_21369 - PLACE
      ?auto_21383 - HOIST
      ?auto_21387 - SURFACE
      ?auto_21391 - PLACE
      ?auto_21378 - HOIST
      ?auto_21390 - SURFACE
      ?auto_21393 - PLACE
      ?auto_21372 - HOIST
      ?auto_21377 - SURFACE
      ?auto_21376 - SURFACE
      ?auto_21379 - SURFACE
      ?auto_21382 - SURFACE
      ?auto_21373 - PLACE
      ?auto_21374 - HOIST
      ?auto_21384 - SURFACE
      ?auto_21386 - SURFACE
      ?auto_21388 - SURFACE
      ?auto_21370 - PLACE
      ?auto_21389 - HOIST
      ?auto_21392 - SURFACE
      ?auto_21385 - PLACE
      ?auto_21371 - HOIST
      ?auto_21375 - SURFACE
      ?auto_21380 - SURFACE
      ?auto_21381 - SURFACE
      ?auto_21394 - SURFACE
      ?auto_21367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21365 ?auto_21368 ) ( IS-CRATE ?auto_21362 ) ( not ( = ?auto_21363 ?auto_21368 ) ) ( HOIST-AT ?auto_21364 ?auto_21363 ) ( SURFACE-AT ?auto_21362 ?auto_21363 ) ( ON ?auto_21362 ?auto_21366 ) ( CLEAR ?auto_21362 ) ( not ( = ?auto_21360 ?auto_21362 ) ) ( not ( = ?auto_21360 ?auto_21366 ) ) ( not ( = ?auto_21362 ?auto_21366 ) ) ( not ( = ?auto_21365 ?auto_21364 ) ) ( IS-CRATE ?auto_21360 ) ( not ( = ?auto_21369 ?auto_21368 ) ) ( HOIST-AT ?auto_21383 ?auto_21369 ) ( SURFACE-AT ?auto_21360 ?auto_21369 ) ( ON ?auto_21360 ?auto_21387 ) ( CLEAR ?auto_21360 ) ( not ( = ?auto_21361 ?auto_21360 ) ) ( not ( = ?auto_21361 ?auto_21387 ) ) ( not ( = ?auto_21360 ?auto_21387 ) ) ( not ( = ?auto_21365 ?auto_21383 ) ) ( IS-CRATE ?auto_21361 ) ( not ( = ?auto_21391 ?auto_21368 ) ) ( HOIST-AT ?auto_21378 ?auto_21391 ) ( AVAILABLE ?auto_21378 ) ( SURFACE-AT ?auto_21361 ?auto_21391 ) ( ON ?auto_21361 ?auto_21390 ) ( CLEAR ?auto_21361 ) ( not ( = ?auto_21359 ?auto_21361 ) ) ( not ( = ?auto_21359 ?auto_21390 ) ) ( not ( = ?auto_21361 ?auto_21390 ) ) ( not ( = ?auto_21365 ?auto_21378 ) ) ( IS-CRATE ?auto_21359 ) ( not ( = ?auto_21393 ?auto_21368 ) ) ( HOIST-AT ?auto_21372 ?auto_21393 ) ( SURFACE-AT ?auto_21359 ?auto_21393 ) ( ON ?auto_21359 ?auto_21377 ) ( CLEAR ?auto_21359 ) ( not ( = ?auto_21358 ?auto_21359 ) ) ( not ( = ?auto_21358 ?auto_21377 ) ) ( not ( = ?auto_21359 ?auto_21377 ) ) ( not ( = ?auto_21365 ?auto_21372 ) ) ( IS-CRATE ?auto_21358 ) ( SURFACE-AT ?auto_21358 ?auto_21393 ) ( ON ?auto_21358 ?auto_21376 ) ( CLEAR ?auto_21358 ) ( not ( = ?auto_21357 ?auto_21358 ) ) ( not ( = ?auto_21357 ?auto_21376 ) ) ( not ( = ?auto_21358 ?auto_21376 ) ) ( IS-CRATE ?auto_21357 ) ( SURFACE-AT ?auto_21357 ?auto_21369 ) ( ON ?auto_21357 ?auto_21379 ) ( CLEAR ?auto_21357 ) ( not ( = ?auto_21356 ?auto_21357 ) ) ( not ( = ?auto_21356 ?auto_21379 ) ) ( not ( = ?auto_21357 ?auto_21379 ) ) ( IS-CRATE ?auto_21356 ) ( SURFACE-AT ?auto_21356 ?auto_21393 ) ( ON ?auto_21356 ?auto_21382 ) ( CLEAR ?auto_21356 ) ( not ( = ?auto_21355 ?auto_21356 ) ) ( not ( = ?auto_21355 ?auto_21382 ) ) ( not ( = ?auto_21356 ?auto_21382 ) ) ( IS-CRATE ?auto_21355 ) ( not ( = ?auto_21373 ?auto_21368 ) ) ( HOIST-AT ?auto_21374 ?auto_21373 ) ( SURFACE-AT ?auto_21355 ?auto_21373 ) ( ON ?auto_21355 ?auto_21384 ) ( CLEAR ?auto_21355 ) ( not ( = ?auto_21354 ?auto_21355 ) ) ( not ( = ?auto_21354 ?auto_21384 ) ) ( not ( = ?auto_21355 ?auto_21384 ) ) ( not ( = ?auto_21365 ?auto_21374 ) ) ( IS-CRATE ?auto_21354 ) ( AVAILABLE ?auto_21372 ) ( SURFACE-AT ?auto_21354 ?auto_21393 ) ( ON ?auto_21354 ?auto_21386 ) ( CLEAR ?auto_21354 ) ( not ( = ?auto_21353 ?auto_21354 ) ) ( not ( = ?auto_21353 ?auto_21386 ) ) ( not ( = ?auto_21354 ?auto_21386 ) ) ( IS-CRATE ?auto_21353 ) ( SURFACE-AT ?auto_21353 ?auto_21373 ) ( ON ?auto_21353 ?auto_21388 ) ( CLEAR ?auto_21353 ) ( not ( = ?auto_21352 ?auto_21353 ) ) ( not ( = ?auto_21352 ?auto_21388 ) ) ( not ( = ?auto_21353 ?auto_21388 ) ) ( IS-CRATE ?auto_21352 ) ( not ( = ?auto_21370 ?auto_21368 ) ) ( HOIST-AT ?auto_21389 ?auto_21370 ) ( AVAILABLE ?auto_21389 ) ( SURFACE-AT ?auto_21352 ?auto_21370 ) ( ON ?auto_21352 ?auto_21392 ) ( CLEAR ?auto_21352 ) ( not ( = ?auto_21351 ?auto_21352 ) ) ( not ( = ?auto_21351 ?auto_21392 ) ) ( not ( = ?auto_21352 ?auto_21392 ) ) ( not ( = ?auto_21365 ?auto_21389 ) ) ( IS-CRATE ?auto_21351 ) ( not ( = ?auto_21385 ?auto_21368 ) ) ( HOIST-AT ?auto_21371 ?auto_21385 ) ( AVAILABLE ?auto_21371 ) ( SURFACE-AT ?auto_21351 ?auto_21385 ) ( ON ?auto_21351 ?auto_21375 ) ( CLEAR ?auto_21351 ) ( not ( = ?auto_21350 ?auto_21351 ) ) ( not ( = ?auto_21350 ?auto_21375 ) ) ( not ( = ?auto_21351 ?auto_21375 ) ) ( not ( = ?auto_21365 ?auto_21371 ) ) ( IS-CRATE ?auto_21350 ) ( AVAILABLE ?auto_21383 ) ( SURFACE-AT ?auto_21350 ?auto_21369 ) ( ON ?auto_21350 ?auto_21380 ) ( CLEAR ?auto_21350 ) ( not ( = ?auto_21349 ?auto_21350 ) ) ( not ( = ?auto_21349 ?auto_21380 ) ) ( not ( = ?auto_21350 ?auto_21380 ) ) ( IS-CRATE ?auto_21349 ) ( AVAILABLE ?auto_21364 ) ( SURFACE-AT ?auto_21349 ?auto_21363 ) ( ON ?auto_21349 ?auto_21381 ) ( CLEAR ?auto_21349 ) ( not ( = ?auto_21348 ?auto_21349 ) ) ( not ( = ?auto_21348 ?auto_21381 ) ) ( not ( = ?auto_21349 ?auto_21381 ) ) ( SURFACE-AT ?auto_21347 ?auto_21368 ) ( CLEAR ?auto_21347 ) ( IS-CRATE ?auto_21348 ) ( AVAILABLE ?auto_21365 ) ( AVAILABLE ?auto_21374 ) ( SURFACE-AT ?auto_21348 ?auto_21373 ) ( ON ?auto_21348 ?auto_21394 ) ( CLEAR ?auto_21348 ) ( TRUCK-AT ?auto_21367 ?auto_21368 ) ( not ( = ?auto_21347 ?auto_21348 ) ) ( not ( = ?auto_21347 ?auto_21394 ) ) ( not ( = ?auto_21348 ?auto_21394 ) ) ( not ( = ?auto_21347 ?auto_21349 ) ) ( not ( = ?auto_21347 ?auto_21381 ) ) ( not ( = ?auto_21349 ?auto_21394 ) ) ( not ( = ?auto_21363 ?auto_21373 ) ) ( not ( = ?auto_21364 ?auto_21374 ) ) ( not ( = ?auto_21381 ?auto_21394 ) ) ( not ( = ?auto_21347 ?auto_21350 ) ) ( not ( = ?auto_21347 ?auto_21380 ) ) ( not ( = ?auto_21348 ?auto_21350 ) ) ( not ( = ?auto_21348 ?auto_21380 ) ) ( not ( = ?auto_21350 ?auto_21381 ) ) ( not ( = ?auto_21350 ?auto_21394 ) ) ( not ( = ?auto_21369 ?auto_21363 ) ) ( not ( = ?auto_21369 ?auto_21373 ) ) ( not ( = ?auto_21383 ?auto_21364 ) ) ( not ( = ?auto_21383 ?auto_21374 ) ) ( not ( = ?auto_21380 ?auto_21381 ) ) ( not ( = ?auto_21380 ?auto_21394 ) ) ( not ( = ?auto_21347 ?auto_21351 ) ) ( not ( = ?auto_21347 ?auto_21375 ) ) ( not ( = ?auto_21348 ?auto_21351 ) ) ( not ( = ?auto_21348 ?auto_21375 ) ) ( not ( = ?auto_21349 ?auto_21351 ) ) ( not ( = ?auto_21349 ?auto_21375 ) ) ( not ( = ?auto_21351 ?auto_21380 ) ) ( not ( = ?auto_21351 ?auto_21381 ) ) ( not ( = ?auto_21351 ?auto_21394 ) ) ( not ( = ?auto_21385 ?auto_21369 ) ) ( not ( = ?auto_21385 ?auto_21363 ) ) ( not ( = ?auto_21385 ?auto_21373 ) ) ( not ( = ?auto_21371 ?auto_21383 ) ) ( not ( = ?auto_21371 ?auto_21364 ) ) ( not ( = ?auto_21371 ?auto_21374 ) ) ( not ( = ?auto_21375 ?auto_21380 ) ) ( not ( = ?auto_21375 ?auto_21381 ) ) ( not ( = ?auto_21375 ?auto_21394 ) ) ( not ( = ?auto_21347 ?auto_21352 ) ) ( not ( = ?auto_21347 ?auto_21392 ) ) ( not ( = ?auto_21348 ?auto_21352 ) ) ( not ( = ?auto_21348 ?auto_21392 ) ) ( not ( = ?auto_21349 ?auto_21352 ) ) ( not ( = ?auto_21349 ?auto_21392 ) ) ( not ( = ?auto_21350 ?auto_21352 ) ) ( not ( = ?auto_21350 ?auto_21392 ) ) ( not ( = ?auto_21352 ?auto_21375 ) ) ( not ( = ?auto_21352 ?auto_21380 ) ) ( not ( = ?auto_21352 ?auto_21381 ) ) ( not ( = ?auto_21352 ?auto_21394 ) ) ( not ( = ?auto_21370 ?auto_21385 ) ) ( not ( = ?auto_21370 ?auto_21369 ) ) ( not ( = ?auto_21370 ?auto_21363 ) ) ( not ( = ?auto_21370 ?auto_21373 ) ) ( not ( = ?auto_21389 ?auto_21371 ) ) ( not ( = ?auto_21389 ?auto_21383 ) ) ( not ( = ?auto_21389 ?auto_21364 ) ) ( not ( = ?auto_21389 ?auto_21374 ) ) ( not ( = ?auto_21392 ?auto_21375 ) ) ( not ( = ?auto_21392 ?auto_21380 ) ) ( not ( = ?auto_21392 ?auto_21381 ) ) ( not ( = ?auto_21392 ?auto_21394 ) ) ( not ( = ?auto_21347 ?auto_21353 ) ) ( not ( = ?auto_21347 ?auto_21388 ) ) ( not ( = ?auto_21348 ?auto_21353 ) ) ( not ( = ?auto_21348 ?auto_21388 ) ) ( not ( = ?auto_21349 ?auto_21353 ) ) ( not ( = ?auto_21349 ?auto_21388 ) ) ( not ( = ?auto_21350 ?auto_21353 ) ) ( not ( = ?auto_21350 ?auto_21388 ) ) ( not ( = ?auto_21351 ?auto_21353 ) ) ( not ( = ?auto_21351 ?auto_21388 ) ) ( not ( = ?auto_21353 ?auto_21392 ) ) ( not ( = ?auto_21353 ?auto_21375 ) ) ( not ( = ?auto_21353 ?auto_21380 ) ) ( not ( = ?auto_21353 ?auto_21381 ) ) ( not ( = ?auto_21353 ?auto_21394 ) ) ( not ( = ?auto_21388 ?auto_21392 ) ) ( not ( = ?auto_21388 ?auto_21375 ) ) ( not ( = ?auto_21388 ?auto_21380 ) ) ( not ( = ?auto_21388 ?auto_21381 ) ) ( not ( = ?auto_21388 ?auto_21394 ) ) ( not ( = ?auto_21347 ?auto_21354 ) ) ( not ( = ?auto_21347 ?auto_21386 ) ) ( not ( = ?auto_21348 ?auto_21354 ) ) ( not ( = ?auto_21348 ?auto_21386 ) ) ( not ( = ?auto_21349 ?auto_21354 ) ) ( not ( = ?auto_21349 ?auto_21386 ) ) ( not ( = ?auto_21350 ?auto_21354 ) ) ( not ( = ?auto_21350 ?auto_21386 ) ) ( not ( = ?auto_21351 ?auto_21354 ) ) ( not ( = ?auto_21351 ?auto_21386 ) ) ( not ( = ?auto_21352 ?auto_21354 ) ) ( not ( = ?auto_21352 ?auto_21386 ) ) ( not ( = ?auto_21354 ?auto_21388 ) ) ( not ( = ?auto_21354 ?auto_21392 ) ) ( not ( = ?auto_21354 ?auto_21375 ) ) ( not ( = ?auto_21354 ?auto_21380 ) ) ( not ( = ?auto_21354 ?auto_21381 ) ) ( not ( = ?auto_21354 ?auto_21394 ) ) ( not ( = ?auto_21393 ?auto_21373 ) ) ( not ( = ?auto_21393 ?auto_21370 ) ) ( not ( = ?auto_21393 ?auto_21385 ) ) ( not ( = ?auto_21393 ?auto_21369 ) ) ( not ( = ?auto_21393 ?auto_21363 ) ) ( not ( = ?auto_21372 ?auto_21374 ) ) ( not ( = ?auto_21372 ?auto_21389 ) ) ( not ( = ?auto_21372 ?auto_21371 ) ) ( not ( = ?auto_21372 ?auto_21383 ) ) ( not ( = ?auto_21372 ?auto_21364 ) ) ( not ( = ?auto_21386 ?auto_21388 ) ) ( not ( = ?auto_21386 ?auto_21392 ) ) ( not ( = ?auto_21386 ?auto_21375 ) ) ( not ( = ?auto_21386 ?auto_21380 ) ) ( not ( = ?auto_21386 ?auto_21381 ) ) ( not ( = ?auto_21386 ?auto_21394 ) ) ( not ( = ?auto_21347 ?auto_21355 ) ) ( not ( = ?auto_21347 ?auto_21384 ) ) ( not ( = ?auto_21348 ?auto_21355 ) ) ( not ( = ?auto_21348 ?auto_21384 ) ) ( not ( = ?auto_21349 ?auto_21355 ) ) ( not ( = ?auto_21349 ?auto_21384 ) ) ( not ( = ?auto_21350 ?auto_21355 ) ) ( not ( = ?auto_21350 ?auto_21384 ) ) ( not ( = ?auto_21351 ?auto_21355 ) ) ( not ( = ?auto_21351 ?auto_21384 ) ) ( not ( = ?auto_21352 ?auto_21355 ) ) ( not ( = ?auto_21352 ?auto_21384 ) ) ( not ( = ?auto_21353 ?auto_21355 ) ) ( not ( = ?auto_21353 ?auto_21384 ) ) ( not ( = ?auto_21355 ?auto_21386 ) ) ( not ( = ?auto_21355 ?auto_21388 ) ) ( not ( = ?auto_21355 ?auto_21392 ) ) ( not ( = ?auto_21355 ?auto_21375 ) ) ( not ( = ?auto_21355 ?auto_21380 ) ) ( not ( = ?auto_21355 ?auto_21381 ) ) ( not ( = ?auto_21355 ?auto_21394 ) ) ( not ( = ?auto_21384 ?auto_21386 ) ) ( not ( = ?auto_21384 ?auto_21388 ) ) ( not ( = ?auto_21384 ?auto_21392 ) ) ( not ( = ?auto_21384 ?auto_21375 ) ) ( not ( = ?auto_21384 ?auto_21380 ) ) ( not ( = ?auto_21384 ?auto_21381 ) ) ( not ( = ?auto_21384 ?auto_21394 ) ) ( not ( = ?auto_21347 ?auto_21356 ) ) ( not ( = ?auto_21347 ?auto_21382 ) ) ( not ( = ?auto_21348 ?auto_21356 ) ) ( not ( = ?auto_21348 ?auto_21382 ) ) ( not ( = ?auto_21349 ?auto_21356 ) ) ( not ( = ?auto_21349 ?auto_21382 ) ) ( not ( = ?auto_21350 ?auto_21356 ) ) ( not ( = ?auto_21350 ?auto_21382 ) ) ( not ( = ?auto_21351 ?auto_21356 ) ) ( not ( = ?auto_21351 ?auto_21382 ) ) ( not ( = ?auto_21352 ?auto_21356 ) ) ( not ( = ?auto_21352 ?auto_21382 ) ) ( not ( = ?auto_21353 ?auto_21356 ) ) ( not ( = ?auto_21353 ?auto_21382 ) ) ( not ( = ?auto_21354 ?auto_21356 ) ) ( not ( = ?auto_21354 ?auto_21382 ) ) ( not ( = ?auto_21356 ?auto_21384 ) ) ( not ( = ?auto_21356 ?auto_21386 ) ) ( not ( = ?auto_21356 ?auto_21388 ) ) ( not ( = ?auto_21356 ?auto_21392 ) ) ( not ( = ?auto_21356 ?auto_21375 ) ) ( not ( = ?auto_21356 ?auto_21380 ) ) ( not ( = ?auto_21356 ?auto_21381 ) ) ( not ( = ?auto_21356 ?auto_21394 ) ) ( not ( = ?auto_21382 ?auto_21384 ) ) ( not ( = ?auto_21382 ?auto_21386 ) ) ( not ( = ?auto_21382 ?auto_21388 ) ) ( not ( = ?auto_21382 ?auto_21392 ) ) ( not ( = ?auto_21382 ?auto_21375 ) ) ( not ( = ?auto_21382 ?auto_21380 ) ) ( not ( = ?auto_21382 ?auto_21381 ) ) ( not ( = ?auto_21382 ?auto_21394 ) ) ( not ( = ?auto_21347 ?auto_21357 ) ) ( not ( = ?auto_21347 ?auto_21379 ) ) ( not ( = ?auto_21348 ?auto_21357 ) ) ( not ( = ?auto_21348 ?auto_21379 ) ) ( not ( = ?auto_21349 ?auto_21357 ) ) ( not ( = ?auto_21349 ?auto_21379 ) ) ( not ( = ?auto_21350 ?auto_21357 ) ) ( not ( = ?auto_21350 ?auto_21379 ) ) ( not ( = ?auto_21351 ?auto_21357 ) ) ( not ( = ?auto_21351 ?auto_21379 ) ) ( not ( = ?auto_21352 ?auto_21357 ) ) ( not ( = ?auto_21352 ?auto_21379 ) ) ( not ( = ?auto_21353 ?auto_21357 ) ) ( not ( = ?auto_21353 ?auto_21379 ) ) ( not ( = ?auto_21354 ?auto_21357 ) ) ( not ( = ?auto_21354 ?auto_21379 ) ) ( not ( = ?auto_21355 ?auto_21357 ) ) ( not ( = ?auto_21355 ?auto_21379 ) ) ( not ( = ?auto_21357 ?auto_21382 ) ) ( not ( = ?auto_21357 ?auto_21384 ) ) ( not ( = ?auto_21357 ?auto_21386 ) ) ( not ( = ?auto_21357 ?auto_21388 ) ) ( not ( = ?auto_21357 ?auto_21392 ) ) ( not ( = ?auto_21357 ?auto_21375 ) ) ( not ( = ?auto_21357 ?auto_21380 ) ) ( not ( = ?auto_21357 ?auto_21381 ) ) ( not ( = ?auto_21357 ?auto_21394 ) ) ( not ( = ?auto_21379 ?auto_21382 ) ) ( not ( = ?auto_21379 ?auto_21384 ) ) ( not ( = ?auto_21379 ?auto_21386 ) ) ( not ( = ?auto_21379 ?auto_21388 ) ) ( not ( = ?auto_21379 ?auto_21392 ) ) ( not ( = ?auto_21379 ?auto_21375 ) ) ( not ( = ?auto_21379 ?auto_21380 ) ) ( not ( = ?auto_21379 ?auto_21381 ) ) ( not ( = ?auto_21379 ?auto_21394 ) ) ( not ( = ?auto_21347 ?auto_21358 ) ) ( not ( = ?auto_21347 ?auto_21376 ) ) ( not ( = ?auto_21348 ?auto_21358 ) ) ( not ( = ?auto_21348 ?auto_21376 ) ) ( not ( = ?auto_21349 ?auto_21358 ) ) ( not ( = ?auto_21349 ?auto_21376 ) ) ( not ( = ?auto_21350 ?auto_21358 ) ) ( not ( = ?auto_21350 ?auto_21376 ) ) ( not ( = ?auto_21351 ?auto_21358 ) ) ( not ( = ?auto_21351 ?auto_21376 ) ) ( not ( = ?auto_21352 ?auto_21358 ) ) ( not ( = ?auto_21352 ?auto_21376 ) ) ( not ( = ?auto_21353 ?auto_21358 ) ) ( not ( = ?auto_21353 ?auto_21376 ) ) ( not ( = ?auto_21354 ?auto_21358 ) ) ( not ( = ?auto_21354 ?auto_21376 ) ) ( not ( = ?auto_21355 ?auto_21358 ) ) ( not ( = ?auto_21355 ?auto_21376 ) ) ( not ( = ?auto_21356 ?auto_21358 ) ) ( not ( = ?auto_21356 ?auto_21376 ) ) ( not ( = ?auto_21358 ?auto_21379 ) ) ( not ( = ?auto_21358 ?auto_21382 ) ) ( not ( = ?auto_21358 ?auto_21384 ) ) ( not ( = ?auto_21358 ?auto_21386 ) ) ( not ( = ?auto_21358 ?auto_21388 ) ) ( not ( = ?auto_21358 ?auto_21392 ) ) ( not ( = ?auto_21358 ?auto_21375 ) ) ( not ( = ?auto_21358 ?auto_21380 ) ) ( not ( = ?auto_21358 ?auto_21381 ) ) ( not ( = ?auto_21358 ?auto_21394 ) ) ( not ( = ?auto_21376 ?auto_21379 ) ) ( not ( = ?auto_21376 ?auto_21382 ) ) ( not ( = ?auto_21376 ?auto_21384 ) ) ( not ( = ?auto_21376 ?auto_21386 ) ) ( not ( = ?auto_21376 ?auto_21388 ) ) ( not ( = ?auto_21376 ?auto_21392 ) ) ( not ( = ?auto_21376 ?auto_21375 ) ) ( not ( = ?auto_21376 ?auto_21380 ) ) ( not ( = ?auto_21376 ?auto_21381 ) ) ( not ( = ?auto_21376 ?auto_21394 ) ) ( not ( = ?auto_21347 ?auto_21359 ) ) ( not ( = ?auto_21347 ?auto_21377 ) ) ( not ( = ?auto_21348 ?auto_21359 ) ) ( not ( = ?auto_21348 ?auto_21377 ) ) ( not ( = ?auto_21349 ?auto_21359 ) ) ( not ( = ?auto_21349 ?auto_21377 ) ) ( not ( = ?auto_21350 ?auto_21359 ) ) ( not ( = ?auto_21350 ?auto_21377 ) ) ( not ( = ?auto_21351 ?auto_21359 ) ) ( not ( = ?auto_21351 ?auto_21377 ) ) ( not ( = ?auto_21352 ?auto_21359 ) ) ( not ( = ?auto_21352 ?auto_21377 ) ) ( not ( = ?auto_21353 ?auto_21359 ) ) ( not ( = ?auto_21353 ?auto_21377 ) ) ( not ( = ?auto_21354 ?auto_21359 ) ) ( not ( = ?auto_21354 ?auto_21377 ) ) ( not ( = ?auto_21355 ?auto_21359 ) ) ( not ( = ?auto_21355 ?auto_21377 ) ) ( not ( = ?auto_21356 ?auto_21359 ) ) ( not ( = ?auto_21356 ?auto_21377 ) ) ( not ( = ?auto_21357 ?auto_21359 ) ) ( not ( = ?auto_21357 ?auto_21377 ) ) ( not ( = ?auto_21359 ?auto_21376 ) ) ( not ( = ?auto_21359 ?auto_21379 ) ) ( not ( = ?auto_21359 ?auto_21382 ) ) ( not ( = ?auto_21359 ?auto_21384 ) ) ( not ( = ?auto_21359 ?auto_21386 ) ) ( not ( = ?auto_21359 ?auto_21388 ) ) ( not ( = ?auto_21359 ?auto_21392 ) ) ( not ( = ?auto_21359 ?auto_21375 ) ) ( not ( = ?auto_21359 ?auto_21380 ) ) ( not ( = ?auto_21359 ?auto_21381 ) ) ( not ( = ?auto_21359 ?auto_21394 ) ) ( not ( = ?auto_21377 ?auto_21376 ) ) ( not ( = ?auto_21377 ?auto_21379 ) ) ( not ( = ?auto_21377 ?auto_21382 ) ) ( not ( = ?auto_21377 ?auto_21384 ) ) ( not ( = ?auto_21377 ?auto_21386 ) ) ( not ( = ?auto_21377 ?auto_21388 ) ) ( not ( = ?auto_21377 ?auto_21392 ) ) ( not ( = ?auto_21377 ?auto_21375 ) ) ( not ( = ?auto_21377 ?auto_21380 ) ) ( not ( = ?auto_21377 ?auto_21381 ) ) ( not ( = ?auto_21377 ?auto_21394 ) ) ( not ( = ?auto_21347 ?auto_21361 ) ) ( not ( = ?auto_21347 ?auto_21390 ) ) ( not ( = ?auto_21348 ?auto_21361 ) ) ( not ( = ?auto_21348 ?auto_21390 ) ) ( not ( = ?auto_21349 ?auto_21361 ) ) ( not ( = ?auto_21349 ?auto_21390 ) ) ( not ( = ?auto_21350 ?auto_21361 ) ) ( not ( = ?auto_21350 ?auto_21390 ) ) ( not ( = ?auto_21351 ?auto_21361 ) ) ( not ( = ?auto_21351 ?auto_21390 ) ) ( not ( = ?auto_21352 ?auto_21361 ) ) ( not ( = ?auto_21352 ?auto_21390 ) ) ( not ( = ?auto_21353 ?auto_21361 ) ) ( not ( = ?auto_21353 ?auto_21390 ) ) ( not ( = ?auto_21354 ?auto_21361 ) ) ( not ( = ?auto_21354 ?auto_21390 ) ) ( not ( = ?auto_21355 ?auto_21361 ) ) ( not ( = ?auto_21355 ?auto_21390 ) ) ( not ( = ?auto_21356 ?auto_21361 ) ) ( not ( = ?auto_21356 ?auto_21390 ) ) ( not ( = ?auto_21357 ?auto_21361 ) ) ( not ( = ?auto_21357 ?auto_21390 ) ) ( not ( = ?auto_21358 ?auto_21361 ) ) ( not ( = ?auto_21358 ?auto_21390 ) ) ( not ( = ?auto_21361 ?auto_21377 ) ) ( not ( = ?auto_21361 ?auto_21376 ) ) ( not ( = ?auto_21361 ?auto_21379 ) ) ( not ( = ?auto_21361 ?auto_21382 ) ) ( not ( = ?auto_21361 ?auto_21384 ) ) ( not ( = ?auto_21361 ?auto_21386 ) ) ( not ( = ?auto_21361 ?auto_21388 ) ) ( not ( = ?auto_21361 ?auto_21392 ) ) ( not ( = ?auto_21361 ?auto_21375 ) ) ( not ( = ?auto_21361 ?auto_21380 ) ) ( not ( = ?auto_21361 ?auto_21381 ) ) ( not ( = ?auto_21361 ?auto_21394 ) ) ( not ( = ?auto_21391 ?auto_21393 ) ) ( not ( = ?auto_21391 ?auto_21369 ) ) ( not ( = ?auto_21391 ?auto_21373 ) ) ( not ( = ?auto_21391 ?auto_21370 ) ) ( not ( = ?auto_21391 ?auto_21385 ) ) ( not ( = ?auto_21391 ?auto_21363 ) ) ( not ( = ?auto_21378 ?auto_21372 ) ) ( not ( = ?auto_21378 ?auto_21383 ) ) ( not ( = ?auto_21378 ?auto_21374 ) ) ( not ( = ?auto_21378 ?auto_21389 ) ) ( not ( = ?auto_21378 ?auto_21371 ) ) ( not ( = ?auto_21378 ?auto_21364 ) ) ( not ( = ?auto_21390 ?auto_21377 ) ) ( not ( = ?auto_21390 ?auto_21376 ) ) ( not ( = ?auto_21390 ?auto_21379 ) ) ( not ( = ?auto_21390 ?auto_21382 ) ) ( not ( = ?auto_21390 ?auto_21384 ) ) ( not ( = ?auto_21390 ?auto_21386 ) ) ( not ( = ?auto_21390 ?auto_21388 ) ) ( not ( = ?auto_21390 ?auto_21392 ) ) ( not ( = ?auto_21390 ?auto_21375 ) ) ( not ( = ?auto_21390 ?auto_21380 ) ) ( not ( = ?auto_21390 ?auto_21381 ) ) ( not ( = ?auto_21390 ?auto_21394 ) ) ( not ( = ?auto_21347 ?auto_21360 ) ) ( not ( = ?auto_21347 ?auto_21387 ) ) ( not ( = ?auto_21348 ?auto_21360 ) ) ( not ( = ?auto_21348 ?auto_21387 ) ) ( not ( = ?auto_21349 ?auto_21360 ) ) ( not ( = ?auto_21349 ?auto_21387 ) ) ( not ( = ?auto_21350 ?auto_21360 ) ) ( not ( = ?auto_21350 ?auto_21387 ) ) ( not ( = ?auto_21351 ?auto_21360 ) ) ( not ( = ?auto_21351 ?auto_21387 ) ) ( not ( = ?auto_21352 ?auto_21360 ) ) ( not ( = ?auto_21352 ?auto_21387 ) ) ( not ( = ?auto_21353 ?auto_21360 ) ) ( not ( = ?auto_21353 ?auto_21387 ) ) ( not ( = ?auto_21354 ?auto_21360 ) ) ( not ( = ?auto_21354 ?auto_21387 ) ) ( not ( = ?auto_21355 ?auto_21360 ) ) ( not ( = ?auto_21355 ?auto_21387 ) ) ( not ( = ?auto_21356 ?auto_21360 ) ) ( not ( = ?auto_21356 ?auto_21387 ) ) ( not ( = ?auto_21357 ?auto_21360 ) ) ( not ( = ?auto_21357 ?auto_21387 ) ) ( not ( = ?auto_21358 ?auto_21360 ) ) ( not ( = ?auto_21358 ?auto_21387 ) ) ( not ( = ?auto_21359 ?auto_21360 ) ) ( not ( = ?auto_21359 ?auto_21387 ) ) ( not ( = ?auto_21360 ?auto_21390 ) ) ( not ( = ?auto_21360 ?auto_21377 ) ) ( not ( = ?auto_21360 ?auto_21376 ) ) ( not ( = ?auto_21360 ?auto_21379 ) ) ( not ( = ?auto_21360 ?auto_21382 ) ) ( not ( = ?auto_21360 ?auto_21384 ) ) ( not ( = ?auto_21360 ?auto_21386 ) ) ( not ( = ?auto_21360 ?auto_21388 ) ) ( not ( = ?auto_21360 ?auto_21392 ) ) ( not ( = ?auto_21360 ?auto_21375 ) ) ( not ( = ?auto_21360 ?auto_21380 ) ) ( not ( = ?auto_21360 ?auto_21381 ) ) ( not ( = ?auto_21360 ?auto_21394 ) ) ( not ( = ?auto_21387 ?auto_21390 ) ) ( not ( = ?auto_21387 ?auto_21377 ) ) ( not ( = ?auto_21387 ?auto_21376 ) ) ( not ( = ?auto_21387 ?auto_21379 ) ) ( not ( = ?auto_21387 ?auto_21382 ) ) ( not ( = ?auto_21387 ?auto_21384 ) ) ( not ( = ?auto_21387 ?auto_21386 ) ) ( not ( = ?auto_21387 ?auto_21388 ) ) ( not ( = ?auto_21387 ?auto_21392 ) ) ( not ( = ?auto_21387 ?auto_21375 ) ) ( not ( = ?auto_21387 ?auto_21380 ) ) ( not ( = ?auto_21387 ?auto_21381 ) ) ( not ( = ?auto_21387 ?auto_21394 ) ) ( not ( = ?auto_21347 ?auto_21362 ) ) ( not ( = ?auto_21347 ?auto_21366 ) ) ( not ( = ?auto_21348 ?auto_21362 ) ) ( not ( = ?auto_21348 ?auto_21366 ) ) ( not ( = ?auto_21349 ?auto_21362 ) ) ( not ( = ?auto_21349 ?auto_21366 ) ) ( not ( = ?auto_21350 ?auto_21362 ) ) ( not ( = ?auto_21350 ?auto_21366 ) ) ( not ( = ?auto_21351 ?auto_21362 ) ) ( not ( = ?auto_21351 ?auto_21366 ) ) ( not ( = ?auto_21352 ?auto_21362 ) ) ( not ( = ?auto_21352 ?auto_21366 ) ) ( not ( = ?auto_21353 ?auto_21362 ) ) ( not ( = ?auto_21353 ?auto_21366 ) ) ( not ( = ?auto_21354 ?auto_21362 ) ) ( not ( = ?auto_21354 ?auto_21366 ) ) ( not ( = ?auto_21355 ?auto_21362 ) ) ( not ( = ?auto_21355 ?auto_21366 ) ) ( not ( = ?auto_21356 ?auto_21362 ) ) ( not ( = ?auto_21356 ?auto_21366 ) ) ( not ( = ?auto_21357 ?auto_21362 ) ) ( not ( = ?auto_21357 ?auto_21366 ) ) ( not ( = ?auto_21358 ?auto_21362 ) ) ( not ( = ?auto_21358 ?auto_21366 ) ) ( not ( = ?auto_21359 ?auto_21362 ) ) ( not ( = ?auto_21359 ?auto_21366 ) ) ( not ( = ?auto_21361 ?auto_21362 ) ) ( not ( = ?auto_21361 ?auto_21366 ) ) ( not ( = ?auto_21362 ?auto_21387 ) ) ( not ( = ?auto_21362 ?auto_21390 ) ) ( not ( = ?auto_21362 ?auto_21377 ) ) ( not ( = ?auto_21362 ?auto_21376 ) ) ( not ( = ?auto_21362 ?auto_21379 ) ) ( not ( = ?auto_21362 ?auto_21382 ) ) ( not ( = ?auto_21362 ?auto_21384 ) ) ( not ( = ?auto_21362 ?auto_21386 ) ) ( not ( = ?auto_21362 ?auto_21388 ) ) ( not ( = ?auto_21362 ?auto_21392 ) ) ( not ( = ?auto_21362 ?auto_21375 ) ) ( not ( = ?auto_21362 ?auto_21380 ) ) ( not ( = ?auto_21362 ?auto_21381 ) ) ( not ( = ?auto_21362 ?auto_21394 ) ) ( not ( = ?auto_21366 ?auto_21387 ) ) ( not ( = ?auto_21366 ?auto_21390 ) ) ( not ( = ?auto_21366 ?auto_21377 ) ) ( not ( = ?auto_21366 ?auto_21376 ) ) ( not ( = ?auto_21366 ?auto_21379 ) ) ( not ( = ?auto_21366 ?auto_21382 ) ) ( not ( = ?auto_21366 ?auto_21384 ) ) ( not ( = ?auto_21366 ?auto_21386 ) ) ( not ( = ?auto_21366 ?auto_21388 ) ) ( not ( = ?auto_21366 ?auto_21392 ) ) ( not ( = ?auto_21366 ?auto_21375 ) ) ( not ( = ?auto_21366 ?auto_21380 ) ) ( not ( = ?auto_21366 ?auto_21381 ) ) ( not ( = ?auto_21366 ?auto_21394 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_21347 ?auto_21348 ?auto_21349 ?auto_21350 ?auto_21351 ?auto_21352 ?auto_21353 ?auto_21354 ?auto_21355 ?auto_21356 ?auto_21357 ?auto_21358 ?auto_21359 ?auto_21361 ?auto_21360 )
      ( MAKE-1CRATE ?auto_21360 ?auto_21362 )
      ( MAKE-15CRATE-VERIFY ?auto_21347 ?auto_21348 ?auto_21349 ?auto_21350 ?auto_21351 ?auto_21352 ?auto_21353 ?auto_21354 ?auto_21355 ?auto_21356 ?auto_21357 ?auto_21358 ?auto_21359 ?auto_21361 ?auto_21360 ?auto_21362 ) )
  )

)

