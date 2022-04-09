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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20678 - SURFACE
      ?auto_20679 - SURFACE
    )
    :vars
    (
      ?auto_20680 - HOIST
      ?auto_20681 - PLACE
      ?auto_20683 - PLACE
      ?auto_20684 - HOIST
      ?auto_20685 - SURFACE
      ?auto_20682 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20680 ?auto_20681 ) ( SURFACE-AT ?auto_20678 ?auto_20681 ) ( CLEAR ?auto_20678 ) ( IS-CRATE ?auto_20679 ) ( AVAILABLE ?auto_20680 ) ( not ( = ?auto_20683 ?auto_20681 ) ) ( HOIST-AT ?auto_20684 ?auto_20683 ) ( AVAILABLE ?auto_20684 ) ( SURFACE-AT ?auto_20679 ?auto_20683 ) ( ON ?auto_20679 ?auto_20685 ) ( CLEAR ?auto_20679 ) ( TRUCK-AT ?auto_20682 ?auto_20681 ) ( not ( = ?auto_20678 ?auto_20679 ) ) ( not ( = ?auto_20678 ?auto_20685 ) ) ( not ( = ?auto_20679 ?auto_20685 ) ) ( not ( = ?auto_20680 ?auto_20684 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20682 ?auto_20681 ?auto_20683 )
      ( !LIFT ?auto_20684 ?auto_20679 ?auto_20685 ?auto_20683 )
      ( !LOAD ?auto_20684 ?auto_20679 ?auto_20682 ?auto_20683 )
      ( !DRIVE ?auto_20682 ?auto_20683 ?auto_20681 )
      ( !UNLOAD ?auto_20680 ?auto_20679 ?auto_20682 ?auto_20681 )
      ( !DROP ?auto_20680 ?auto_20679 ?auto_20678 ?auto_20681 )
      ( MAKE-1CRATE-VERIFY ?auto_20678 ?auto_20679 ) )
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
      ?auto_20693 - HOIST
      ?auto_20697 - PLACE
      ?auto_20694 - PLACE
      ?auto_20696 - HOIST
      ?auto_20695 - SURFACE
      ?auto_20700 - PLACE
      ?auto_20699 - HOIST
      ?auto_20698 - SURFACE
      ?auto_20692 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20693 ?auto_20697 ) ( IS-CRATE ?auto_20691 ) ( not ( = ?auto_20694 ?auto_20697 ) ) ( HOIST-AT ?auto_20696 ?auto_20694 ) ( AVAILABLE ?auto_20696 ) ( SURFACE-AT ?auto_20691 ?auto_20694 ) ( ON ?auto_20691 ?auto_20695 ) ( CLEAR ?auto_20691 ) ( not ( = ?auto_20690 ?auto_20691 ) ) ( not ( = ?auto_20690 ?auto_20695 ) ) ( not ( = ?auto_20691 ?auto_20695 ) ) ( not ( = ?auto_20693 ?auto_20696 ) ) ( SURFACE-AT ?auto_20689 ?auto_20697 ) ( CLEAR ?auto_20689 ) ( IS-CRATE ?auto_20690 ) ( AVAILABLE ?auto_20693 ) ( not ( = ?auto_20700 ?auto_20697 ) ) ( HOIST-AT ?auto_20699 ?auto_20700 ) ( AVAILABLE ?auto_20699 ) ( SURFACE-AT ?auto_20690 ?auto_20700 ) ( ON ?auto_20690 ?auto_20698 ) ( CLEAR ?auto_20690 ) ( TRUCK-AT ?auto_20692 ?auto_20697 ) ( not ( = ?auto_20689 ?auto_20690 ) ) ( not ( = ?auto_20689 ?auto_20698 ) ) ( not ( = ?auto_20690 ?auto_20698 ) ) ( not ( = ?auto_20693 ?auto_20699 ) ) ( not ( = ?auto_20689 ?auto_20691 ) ) ( not ( = ?auto_20689 ?auto_20695 ) ) ( not ( = ?auto_20691 ?auto_20698 ) ) ( not ( = ?auto_20694 ?auto_20700 ) ) ( not ( = ?auto_20696 ?auto_20699 ) ) ( not ( = ?auto_20695 ?auto_20698 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20689 ?auto_20690 )
      ( MAKE-1CRATE ?auto_20690 ?auto_20691 )
      ( MAKE-2CRATE-VERIFY ?auto_20689 ?auto_20690 ?auto_20691 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20703 - SURFACE
      ?auto_20704 - SURFACE
    )
    :vars
    (
      ?auto_20705 - HOIST
      ?auto_20706 - PLACE
      ?auto_20708 - PLACE
      ?auto_20709 - HOIST
      ?auto_20710 - SURFACE
      ?auto_20707 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20705 ?auto_20706 ) ( SURFACE-AT ?auto_20703 ?auto_20706 ) ( CLEAR ?auto_20703 ) ( IS-CRATE ?auto_20704 ) ( AVAILABLE ?auto_20705 ) ( not ( = ?auto_20708 ?auto_20706 ) ) ( HOIST-AT ?auto_20709 ?auto_20708 ) ( AVAILABLE ?auto_20709 ) ( SURFACE-AT ?auto_20704 ?auto_20708 ) ( ON ?auto_20704 ?auto_20710 ) ( CLEAR ?auto_20704 ) ( TRUCK-AT ?auto_20707 ?auto_20706 ) ( not ( = ?auto_20703 ?auto_20704 ) ) ( not ( = ?auto_20703 ?auto_20710 ) ) ( not ( = ?auto_20704 ?auto_20710 ) ) ( not ( = ?auto_20705 ?auto_20709 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20707 ?auto_20706 ?auto_20708 )
      ( !LIFT ?auto_20709 ?auto_20704 ?auto_20710 ?auto_20708 )
      ( !LOAD ?auto_20709 ?auto_20704 ?auto_20707 ?auto_20708 )
      ( !DRIVE ?auto_20707 ?auto_20708 ?auto_20706 )
      ( !UNLOAD ?auto_20705 ?auto_20704 ?auto_20707 ?auto_20706 )
      ( !DROP ?auto_20705 ?auto_20704 ?auto_20703 ?auto_20706 )
      ( MAKE-1CRATE-VERIFY ?auto_20703 ?auto_20704 ) )
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
      ?auto_20724 - HOIST
      ?auto_20722 - PLACE
      ?auto_20720 - PLACE
      ?auto_20721 - HOIST
      ?auto_20723 - SURFACE
      ?auto_20727 - PLACE
      ?auto_20726 - HOIST
      ?auto_20725 - SURFACE
      ?auto_20729 - PLACE
      ?auto_20730 - HOIST
      ?auto_20728 - SURFACE
      ?auto_20719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20724 ?auto_20722 ) ( IS-CRATE ?auto_20718 ) ( not ( = ?auto_20720 ?auto_20722 ) ) ( HOIST-AT ?auto_20721 ?auto_20720 ) ( AVAILABLE ?auto_20721 ) ( SURFACE-AT ?auto_20718 ?auto_20720 ) ( ON ?auto_20718 ?auto_20723 ) ( CLEAR ?auto_20718 ) ( not ( = ?auto_20717 ?auto_20718 ) ) ( not ( = ?auto_20717 ?auto_20723 ) ) ( not ( = ?auto_20718 ?auto_20723 ) ) ( not ( = ?auto_20724 ?auto_20721 ) ) ( IS-CRATE ?auto_20717 ) ( not ( = ?auto_20727 ?auto_20722 ) ) ( HOIST-AT ?auto_20726 ?auto_20727 ) ( AVAILABLE ?auto_20726 ) ( SURFACE-AT ?auto_20717 ?auto_20727 ) ( ON ?auto_20717 ?auto_20725 ) ( CLEAR ?auto_20717 ) ( not ( = ?auto_20716 ?auto_20717 ) ) ( not ( = ?auto_20716 ?auto_20725 ) ) ( not ( = ?auto_20717 ?auto_20725 ) ) ( not ( = ?auto_20724 ?auto_20726 ) ) ( SURFACE-AT ?auto_20715 ?auto_20722 ) ( CLEAR ?auto_20715 ) ( IS-CRATE ?auto_20716 ) ( AVAILABLE ?auto_20724 ) ( not ( = ?auto_20729 ?auto_20722 ) ) ( HOIST-AT ?auto_20730 ?auto_20729 ) ( AVAILABLE ?auto_20730 ) ( SURFACE-AT ?auto_20716 ?auto_20729 ) ( ON ?auto_20716 ?auto_20728 ) ( CLEAR ?auto_20716 ) ( TRUCK-AT ?auto_20719 ?auto_20722 ) ( not ( = ?auto_20715 ?auto_20716 ) ) ( not ( = ?auto_20715 ?auto_20728 ) ) ( not ( = ?auto_20716 ?auto_20728 ) ) ( not ( = ?auto_20724 ?auto_20730 ) ) ( not ( = ?auto_20715 ?auto_20717 ) ) ( not ( = ?auto_20715 ?auto_20725 ) ) ( not ( = ?auto_20717 ?auto_20728 ) ) ( not ( = ?auto_20727 ?auto_20729 ) ) ( not ( = ?auto_20726 ?auto_20730 ) ) ( not ( = ?auto_20725 ?auto_20728 ) ) ( not ( = ?auto_20715 ?auto_20718 ) ) ( not ( = ?auto_20715 ?auto_20723 ) ) ( not ( = ?auto_20716 ?auto_20718 ) ) ( not ( = ?auto_20716 ?auto_20723 ) ) ( not ( = ?auto_20718 ?auto_20725 ) ) ( not ( = ?auto_20718 ?auto_20728 ) ) ( not ( = ?auto_20720 ?auto_20727 ) ) ( not ( = ?auto_20720 ?auto_20729 ) ) ( not ( = ?auto_20721 ?auto_20726 ) ) ( not ( = ?auto_20721 ?auto_20730 ) ) ( not ( = ?auto_20723 ?auto_20725 ) ) ( not ( = ?auto_20723 ?auto_20728 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20715 ?auto_20716 ?auto_20717 )
      ( MAKE-1CRATE ?auto_20717 ?auto_20718 )
      ( MAKE-3CRATE-VERIFY ?auto_20715 ?auto_20716 ?auto_20717 ?auto_20718 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20733 - SURFACE
      ?auto_20734 - SURFACE
    )
    :vars
    (
      ?auto_20735 - HOIST
      ?auto_20736 - PLACE
      ?auto_20738 - PLACE
      ?auto_20739 - HOIST
      ?auto_20740 - SURFACE
      ?auto_20737 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20735 ?auto_20736 ) ( SURFACE-AT ?auto_20733 ?auto_20736 ) ( CLEAR ?auto_20733 ) ( IS-CRATE ?auto_20734 ) ( AVAILABLE ?auto_20735 ) ( not ( = ?auto_20738 ?auto_20736 ) ) ( HOIST-AT ?auto_20739 ?auto_20738 ) ( AVAILABLE ?auto_20739 ) ( SURFACE-AT ?auto_20734 ?auto_20738 ) ( ON ?auto_20734 ?auto_20740 ) ( CLEAR ?auto_20734 ) ( TRUCK-AT ?auto_20737 ?auto_20736 ) ( not ( = ?auto_20733 ?auto_20734 ) ) ( not ( = ?auto_20733 ?auto_20740 ) ) ( not ( = ?auto_20734 ?auto_20740 ) ) ( not ( = ?auto_20735 ?auto_20739 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20737 ?auto_20736 ?auto_20738 )
      ( !LIFT ?auto_20739 ?auto_20734 ?auto_20740 ?auto_20738 )
      ( !LOAD ?auto_20739 ?auto_20734 ?auto_20737 ?auto_20738 )
      ( !DRIVE ?auto_20737 ?auto_20738 ?auto_20736 )
      ( !UNLOAD ?auto_20735 ?auto_20734 ?auto_20737 ?auto_20736 )
      ( !DROP ?auto_20735 ?auto_20734 ?auto_20733 ?auto_20736 )
      ( MAKE-1CRATE-VERIFY ?auto_20733 ?auto_20734 ) )
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
      ?auto_20756 - HOIST
      ?auto_20751 - PLACE
      ?auto_20755 - PLACE
      ?auto_20753 - HOIST
      ?auto_20752 - SURFACE
      ?auto_20765 - PLACE
      ?auto_20757 - HOIST
      ?auto_20759 - SURFACE
      ?auto_20764 - PLACE
      ?auto_20761 - HOIST
      ?auto_20758 - SURFACE
      ?auto_20763 - PLACE
      ?auto_20760 - HOIST
      ?auto_20762 - SURFACE
      ?auto_20754 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20756 ?auto_20751 ) ( IS-CRATE ?auto_20750 ) ( not ( = ?auto_20755 ?auto_20751 ) ) ( HOIST-AT ?auto_20753 ?auto_20755 ) ( AVAILABLE ?auto_20753 ) ( SURFACE-AT ?auto_20750 ?auto_20755 ) ( ON ?auto_20750 ?auto_20752 ) ( CLEAR ?auto_20750 ) ( not ( = ?auto_20749 ?auto_20750 ) ) ( not ( = ?auto_20749 ?auto_20752 ) ) ( not ( = ?auto_20750 ?auto_20752 ) ) ( not ( = ?auto_20756 ?auto_20753 ) ) ( IS-CRATE ?auto_20749 ) ( not ( = ?auto_20765 ?auto_20751 ) ) ( HOIST-AT ?auto_20757 ?auto_20765 ) ( AVAILABLE ?auto_20757 ) ( SURFACE-AT ?auto_20749 ?auto_20765 ) ( ON ?auto_20749 ?auto_20759 ) ( CLEAR ?auto_20749 ) ( not ( = ?auto_20748 ?auto_20749 ) ) ( not ( = ?auto_20748 ?auto_20759 ) ) ( not ( = ?auto_20749 ?auto_20759 ) ) ( not ( = ?auto_20756 ?auto_20757 ) ) ( IS-CRATE ?auto_20748 ) ( not ( = ?auto_20764 ?auto_20751 ) ) ( HOIST-AT ?auto_20761 ?auto_20764 ) ( AVAILABLE ?auto_20761 ) ( SURFACE-AT ?auto_20748 ?auto_20764 ) ( ON ?auto_20748 ?auto_20758 ) ( CLEAR ?auto_20748 ) ( not ( = ?auto_20747 ?auto_20748 ) ) ( not ( = ?auto_20747 ?auto_20758 ) ) ( not ( = ?auto_20748 ?auto_20758 ) ) ( not ( = ?auto_20756 ?auto_20761 ) ) ( SURFACE-AT ?auto_20746 ?auto_20751 ) ( CLEAR ?auto_20746 ) ( IS-CRATE ?auto_20747 ) ( AVAILABLE ?auto_20756 ) ( not ( = ?auto_20763 ?auto_20751 ) ) ( HOIST-AT ?auto_20760 ?auto_20763 ) ( AVAILABLE ?auto_20760 ) ( SURFACE-AT ?auto_20747 ?auto_20763 ) ( ON ?auto_20747 ?auto_20762 ) ( CLEAR ?auto_20747 ) ( TRUCK-AT ?auto_20754 ?auto_20751 ) ( not ( = ?auto_20746 ?auto_20747 ) ) ( not ( = ?auto_20746 ?auto_20762 ) ) ( not ( = ?auto_20747 ?auto_20762 ) ) ( not ( = ?auto_20756 ?auto_20760 ) ) ( not ( = ?auto_20746 ?auto_20748 ) ) ( not ( = ?auto_20746 ?auto_20758 ) ) ( not ( = ?auto_20748 ?auto_20762 ) ) ( not ( = ?auto_20764 ?auto_20763 ) ) ( not ( = ?auto_20761 ?auto_20760 ) ) ( not ( = ?auto_20758 ?auto_20762 ) ) ( not ( = ?auto_20746 ?auto_20749 ) ) ( not ( = ?auto_20746 ?auto_20759 ) ) ( not ( = ?auto_20747 ?auto_20749 ) ) ( not ( = ?auto_20747 ?auto_20759 ) ) ( not ( = ?auto_20749 ?auto_20758 ) ) ( not ( = ?auto_20749 ?auto_20762 ) ) ( not ( = ?auto_20765 ?auto_20764 ) ) ( not ( = ?auto_20765 ?auto_20763 ) ) ( not ( = ?auto_20757 ?auto_20761 ) ) ( not ( = ?auto_20757 ?auto_20760 ) ) ( not ( = ?auto_20759 ?auto_20758 ) ) ( not ( = ?auto_20759 ?auto_20762 ) ) ( not ( = ?auto_20746 ?auto_20750 ) ) ( not ( = ?auto_20746 ?auto_20752 ) ) ( not ( = ?auto_20747 ?auto_20750 ) ) ( not ( = ?auto_20747 ?auto_20752 ) ) ( not ( = ?auto_20748 ?auto_20750 ) ) ( not ( = ?auto_20748 ?auto_20752 ) ) ( not ( = ?auto_20750 ?auto_20759 ) ) ( not ( = ?auto_20750 ?auto_20758 ) ) ( not ( = ?auto_20750 ?auto_20762 ) ) ( not ( = ?auto_20755 ?auto_20765 ) ) ( not ( = ?auto_20755 ?auto_20764 ) ) ( not ( = ?auto_20755 ?auto_20763 ) ) ( not ( = ?auto_20753 ?auto_20757 ) ) ( not ( = ?auto_20753 ?auto_20761 ) ) ( not ( = ?auto_20753 ?auto_20760 ) ) ( not ( = ?auto_20752 ?auto_20759 ) ) ( not ( = ?auto_20752 ?auto_20758 ) ) ( not ( = ?auto_20752 ?auto_20762 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_20746 ?auto_20747 ?auto_20748 ?auto_20749 )
      ( MAKE-1CRATE ?auto_20749 ?auto_20750 )
      ( MAKE-4CRATE-VERIFY ?auto_20746 ?auto_20747 ?auto_20748 ?auto_20749 ?auto_20750 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20768 - SURFACE
      ?auto_20769 - SURFACE
    )
    :vars
    (
      ?auto_20770 - HOIST
      ?auto_20771 - PLACE
      ?auto_20773 - PLACE
      ?auto_20774 - HOIST
      ?auto_20775 - SURFACE
      ?auto_20772 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20770 ?auto_20771 ) ( SURFACE-AT ?auto_20768 ?auto_20771 ) ( CLEAR ?auto_20768 ) ( IS-CRATE ?auto_20769 ) ( AVAILABLE ?auto_20770 ) ( not ( = ?auto_20773 ?auto_20771 ) ) ( HOIST-AT ?auto_20774 ?auto_20773 ) ( AVAILABLE ?auto_20774 ) ( SURFACE-AT ?auto_20769 ?auto_20773 ) ( ON ?auto_20769 ?auto_20775 ) ( CLEAR ?auto_20769 ) ( TRUCK-AT ?auto_20772 ?auto_20771 ) ( not ( = ?auto_20768 ?auto_20769 ) ) ( not ( = ?auto_20768 ?auto_20775 ) ) ( not ( = ?auto_20769 ?auto_20775 ) ) ( not ( = ?auto_20770 ?auto_20774 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20772 ?auto_20771 ?auto_20773 )
      ( !LIFT ?auto_20774 ?auto_20769 ?auto_20775 ?auto_20773 )
      ( !LOAD ?auto_20774 ?auto_20769 ?auto_20772 ?auto_20773 )
      ( !DRIVE ?auto_20772 ?auto_20773 ?auto_20771 )
      ( !UNLOAD ?auto_20770 ?auto_20769 ?auto_20772 ?auto_20771 )
      ( !DROP ?auto_20770 ?auto_20769 ?auto_20768 ?auto_20771 )
      ( MAKE-1CRATE-VERIFY ?auto_20768 ?auto_20769 ) )
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
      ?auto_20792 - HOIST
      ?auto_20793 - PLACE
      ?auto_20789 - PLACE
      ?auto_20791 - HOIST
      ?auto_20790 - SURFACE
      ?auto_20800 - PLACE
      ?auto_20794 - HOIST
      ?auto_20796 - SURFACE
      ?auto_20798 - PLACE
      ?auto_20797 - HOIST
      ?auto_20795 - SURFACE
      ?auto_20803 - PLACE
      ?auto_20802 - HOIST
      ?auto_20804 - SURFACE
      ?auto_20801 - PLACE
      ?auto_20805 - HOIST
      ?auto_20799 - SURFACE
      ?auto_20788 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20792 ?auto_20793 ) ( IS-CRATE ?auto_20787 ) ( not ( = ?auto_20789 ?auto_20793 ) ) ( HOIST-AT ?auto_20791 ?auto_20789 ) ( AVAILABLE ?auto_20791 ) ( SURFACE-AT ?auto_20787 ?auto_20789 ) ( ON ?auto_20787 ?auto_20790 ) ( CLEAR ?auto_20787 ) ( not ( = ?auto_20786 ?auto_20787 ) ) ( not ( = ?auto_20786 ?auto_20790 ) ) ( not ( = ?auto_20787 ?auto_20790 ) ) ( not ( = ?auto_20792 ?auto_20791 ) ) ( IS-CRATE ?auto_20786 ) ( not ( = ?auto_20800 ?auto_20793 ) ) ( HOIST-AT ?auto_20794 ?auto_20800 ) ( AVAILABLE ?auto_20794 ) ( SURFACE-AT ?auto_20786 ?auto_20800 ) ( ON ?auto_20786 ?auto_20796 ) ( CLEAR ?auto_20786 ) ( not ( = ?auto_20785 ?auto_20786 ) ) ( not ( = ?auto_20785 ?auto_20796 ) ) ( not ( = ?auto_20786 ?auto_20796 ) ) ( not ( = ?auto_20792 ?auto_20794 ) ) ( IS-CRATE ?auto_20785 ) ( not ( = ?auto_20798 ?auto_20793 ) ) ( HOIST-AT ?auto_20797 ?auto_20798 ) ( AVAILABLE ?auto_20797 ) ( SURFACE-AT ?auto_20785 ?auto_20798 ) ( ON ?auto_20785 ?auto_20795 ) ( CLEAR ?auto_20785 ) ( not ( = ?auto_20784 ?auto_20785 ) ) ( not ( = ?auto_20784 ?auto_20795 ) ) ( not ( = ?auto_20785 ?auto_20795 ) ) ( not ( = ?auto_20792 ?auto_20797 ) ) ( IS-CRATE ?auto_20784 ) ( not ( = ?auto_20803 ?auto_20793 ) ) ( HOIST-AT ?auto_20802 ?auto_20803 ) ( AVAILABLE ?auto_20802 ) ( SURFACE-AT ?auto_20784 ?auto_20803 ) ( ON ?auto_20784 ?auto_20804 ) ( CLEAR ?auto_20784 ) ( not ( = ?auto_20783 ?auto_20784 ) ) ( not ( = ?auto_20783 ?auto_20804 ) ) ( not ( = ?auto_20784 ?auto_20804 ) ) ( not ( = ?auto_20792 ?auto_20802 ) ) ( SURFACE-AT ?auto_20782 ?auto_20793 ) ( CLEAR ?auto_20782 ) ( IS-CRATE ?auto_20783 ) ( AVAILABLE ?auto_20792 ) ( not ( = ?auto_20801 ?auto_20793 ) ) ( HOIST-AT ?auto_20805 ?auto_20801 ) ( AVAILABLE ?auto_20805 ) ( SURFACE-AT ?auto_20783 ?auto_20801 ) ( ON ?auto_20783 ?auto_20799 ) ( CLEAR ?auto_20783 ) ( TRUCK-AT ?auto_20788 ?auto_20793 ) ( not ( = ?auto_20782 ?auto_20783 ) ) ( not ( = ?auto_20782 ?auto_20799 ) ) ( not ( = ?auto_20783 ?auto_20799 ) ) ( not ( = ?auto_20792 ?auto_20805 ) ) ( not ( = ?auto_20782 ?auto_20784 ) ) ( not ( = ?auto_20782 ?auto_20804 ) ) ( not ( = ?auto_20784 ?auto_20799 ) ) ( not ( = ?auto_20803 ?auto_20801 ) ) ( not ( = ?auto_20802 ?auto_20805 ) ) ( not ( = ?auto_20804 ?auto_20799 ) ) ( not ( = ?auto_20782 ?auto_20785 ) ) ( not ( = ?auto_20782 ?auto_20795 ) ) ( not ( = ?auto_20783 ?auto_20785 ) ) ( not ( = ?auto_20783 ?auto_20795 ) ) ( not ( = ?auto_20785 ?auto_20804 ) ) ( not ( = ?auto_20785 ?auto_20799 ) ) ( not ( = ?auto_20798 ?auto_20803 ) ) ( not ( = ?auto_20798 ?auto_20801 ) ) ( not ( = ?auto_20797 ?auto_20802 ) ) ( not ( = ?auto_20797 ?auto_20805 ) ) ( not ( = ?auto_20795 ?auto_20804 ) ) ( not ( = ?auto_20795 ?auto_20799 ) ) ( not ( = ?auto_20782 ?auto_20786 ) ) ( not ( = ?auto_20782 ?auto_20796 ) ) ( not ( = ?auto_20783 ?auto_20786 ) ) ( not ( = ?auto_20783 ?auto_20796 ) ) ( not ( = ?auto_20784 ?auto_20786 ) ) ( not ( = ?auto_20784 ?auto_20796 ) ) ( not ( = ?auto_20786 ?auto_20795 ) ) ( not ( = ?auto_20786 ?auto_20804 ) ) ( not ( = ?auto_20786 ?auto_20799 ) ) ( not ( = ?auto_20800 ?auto_20798 ) ) ( not ( = ?auto_20800 ?auto_20803 ) ) ( not ( = ?auto_20800 ?auto_20801 ) ) ( not ( = ?auto_20794 ?auto_20797 ) ) ( not ( = ?auto_20794 ?auto_20802 ) ) ( not ( = ?auto_20794 ?auto_20805 ) ) ( not ( = ?auto_20796 ?auto_20795 ) ) ( not ( = ?auto_20796 ?auto_20804 ) ) ( not ( = ?auto_20796 ?auto_20799 ) ) ( not ( = ?auto_20782 ?auto_20787 ) ) ( not ( = ?auto_20782 ?auto_20790 ) ) ( not ( = ?auto_20783 ?auto_20787 ) ) ( not ( = ?auto_20783 ?auto_20790 ) ) ( not ( = ?auto_20784 ?auto_20787 ) ) ( not ( = ?auto_20784 ?auto_20790 ) ) ( not ( = ?auto_20785 ?auto_20787 ) ) ( not ( = ?auto_20785 ?auto_20790 ) ) ( not ( = ?auto_20787 ?auto_20796 ) ) ( not ( = ?auto_20787 ?auto_20795 ) ) ( not ( = ?auto_20787 ?auto_20804 ) ) ( not ( = ?auto_20787 ?auto_20799 ) ) ( not ( = ?auto_20789 ?auto_20800 ) ) ( not ( = ?auto_20789 ?auto_20798 ) ) ( not ( = ?auto_20789 ?auto_20803 ) ) ( not ( = ?auto_20789 ?auto_20801 ) ) ( not ( = ?auto_20791 ?auto_20794 ) ) ( not ( = ?auto_20791 ?auto_20797 ) ) ( not ( = ?auto_20791 ?auto_20802 ) ) ( not ( = ?auto_20791 ?auto_20805 ) ) ( not ( = ?auto_20790 ?auto_20796 ) ) ( not ( = ?auto_20790 ?auto_20795 ) ) ( not ( = ?auto_20790 ?auto_20804 ) ) ( not ( = ?auto_20790 ?auto_20799 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_20782 ?auto_20783 ?auto_20784 ?auto_20785 ?auto_20786 )
      ( MAKE-1CRATE ?auto_20786 ?auto_20787 )
      ( MAKE-5CRATE-VERIFY ?auto_20782 ?auto_20783 ?auto_20784 ?auto_20785 ?auto_20786 ?auto_20787 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20808 - SURFACE
      ?auto_20809 - SURFACE
    )
    :vars
    (
      ?auto_20810 - HOIST
      ?auto_20811 - PLACE
      ?auto_20813 - PLACE
      ?auto_20814 - HOIST
      ?auto_20815 - SURFACE
      ?auto_20812 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20810 ?auto_20811 ) ( SURFACE-AT ?auto_20808 ?auto_20811 ) ( CLEAR ?auto_20808 ) ( IS-CRATE ?auto_20809 ) ( AVAILABLE ?auto_20810 ) ( not ( = ?auto_20813 ?auto_20811 ) ) ( HOIST-AT ?auto_20814 ?auto_20813 ) ( AVAILABLE ?auto_20814 ) ( SURFACE-AT ?auto_20809 ?auto_20813 ) ( ON ?auto_20809 ?auto_20815 ) ( CLEAR ?auto_20809 ) ( TRUCK-AT ?auto_20812 ?auto_20811 ) ( not ( = ?auto_20808 ?auto_20809 ) ) ( not ( = ?auto_20808 ?auto_20815 ) ) ( not ( = ?auto_20809 ?auto_20815 ) ) ( not ( = ?auto_20810 ?auto_20814 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20812 ?auto_20811 ?auto_20813 )
      ( !LIFT ?auto_20814 ?auto_20809 ?auto_20815 ?auto_20813 )
      ( !LOAD ?auto_20814 ?auto_20809 ?auto_20812 ?auto_20813 )
      ( !DRIVE ?auto_20812 ?auto_20813 ?auto_20811 )
      ( !UNLOAD ?auto_20810 ?auto_20809 ?auto_20812 ?auto_20811 )
      ( !DROP ?auto_20810 ?auto_20809 ?auto_20808 ?auto_20811 )
      ( MAKE-1CRATE-VERIFY ?auto_20808 ?auto_20809 ) )
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
      ?auto_20835 - HOIST
      ?auto_20832 - PLACE
      ?auto_20834 - PLACE
      ?auto_20833 - HOIST
      ?auto_20831 - SURFACE
      ?auto_20845 - PLACE
      ?auto_20837 - HOIST
      ?auto_20836 - SURFACE
      ?auto_20838 - PLACE
      ?auto_20842 - HOIST
      ?auto_20848 - SURFACE
      ?auto_20846 - PLACE
      ?auto_20840 - HOIST
      ?auto_20843 - SURFACE
      ?auto_20844 - PLACE
      ?auto_20841 - HOIST
      ?auto_20847 - SURFACE
      ?auto_20839 - SURFACE
      ?auto_20830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20835 ?auto_20832 ) ( IS-CRATE ?auto_20829 ) ( not ( = ?auto_20834 ?auto_20832 ) ) ( HOIST-AT ?auto_20833 ?auto_20834 ) ( SURFACE-AT ?auto_20829 ?auto_20834 ) ( ON ?auto_20829 ?auto_20831 ) ( CLEAR ?auto_20829 ) ( not ( = ?auto_20828 ?auto_20829 ) ) ( not ( = ?auto_20828 ?auto_20831 ) ) ( not ( = ?auto_20829 ?auto_20831 ) ) ( not ( = ?auto_20835 ?auto_20833 ) ) ( IS-CRATE ?auto_20828 ) ( not ( = ?auto_20845 ?auto_20832 ) ) ( HOIST-AT ?auto_20837 ?auto_20845 ) ( AVAILABLE ?auto_20837 ) ( SURFACE-AT ?auto_20828 ?auto_20845 ) ( ON ?auto_20828 ?auto_20836 ) ( CLEAR ?auto_20828 ) ( not ( = ?auto_20827 ?auto_20828 ) ) ( not ( = ?auto_20827 ?auto_20836 ) ) ( not ( = ?auto_20828 ?auto_20836 ) ) ( not ( = ?auto_20835 ?auto_20837 ) ) ( IS-CRATE ?auto_20827 ) ( not ( = ?auto_20838 ?auto_20832 ) ) ( HOIST-AT ?auto_20842 ?auto_20838 ) ( AVAILABLE ?auto_20842 ) ( SURFACE-AT ?auto_20827 ?auto_20838 ) ( ON ?auto_20827 ?auto_20848 ) ( CLEAR ?auto_20827 ) ( not ( = ?auto_20826 ?auto_20827 ) ) ( not ( = ?auto_20826 ?auto_20848 ) ) ( not ( = ?auto_20827 ?auto_20848 ) ) ( not ( = ?auto_20835 ?auto_20842 ) ) ( IS-CRATE ?auto_20826 ) ( not ( = ?auto_20846 ?auto_20832 ) ) ( HOIST-AT ?auto_20840 ?auto_20846 ) ( AVAILABLE ?auto_20840 ) ( SURFACE-AT ?auto_20826 ?auto_20846 ) ( ON ?auto_20826 ?auto_20843 ) ( CLEAR ?auto_20826 ) ( not ( = ?auto_20825 ?auto_20826 ) ) ( not ( = ?auto_20825 ?auto_20843 ) ) ( not ( = ?auto_20826 ?auto_20843 ) ) ( not ( = ?auto_20835 ?auto_20840 ) ) ( IS-CRATE ?auto_20825 ) ( not ( = ?auto_20844 ?auto_20832 ) ) ( HOIST-AT ?auto_20841 ?auto_20844 ) ( AVAILABLE ?auto_20841 ) ( SURFACE-AT ?auto_20825 ?auto_20844 ) ( ON ?auto_20825 ?auto_20847 ) ( CLEAR ?auto_20825 ) ( not ( = ?auto_20824 ?auto_20825 ) ) ( not ( = ?auto_20824 ?auto_20847 ) ) ( not ( = ?auto_20825 ?auto_20847 ) ) ( not ( = ?auto_20835 ?auto_20841 ) ) ( SURFACE-AT ?auto_20823 ?auto_20832 ) ( CLEAR ?auto_20823 ) ( IS-CRATE ?auto_20824 ) ( AVAILABLE ?auto_20835 ) ( AVAILABLE ?auto_20833 ) ( SURFACE-AT ?auto_20824 ?auto_20834 ) ( ON ?auto_20824 ?auto_20839 ) ( CLEAR ?auto_20824 ) ( TRUCK-AT ?auto_20830 ?auto_20832 ) ( not ( = ?auto_20823 ?auto_20824 ) ) ( not ( = ?auto_20823 ?auto_20839 ) ) ( not ( = ?auto_20824 ?auto_20839 ) ) ( not ( = ?auto_20823 ?auto_20825 ) ) ( not ( = ?auto_20823 ?auto_20847 ) ) ( not ( = ?auto_20825 ?auto_20839 ) ) ( not ( = ?auto_20844 ?auto_20834 ) ) ( not ( = ?auto_20841 ?auto_20833 ) ) ( not ( = ?auto_20847 ?auto_20839 ) ) ( not ( = ?auto_20823 ?auto_20826 ) ) ( not ( = ?auto_20823 ?auto_20843 ) ) ( not ( = ?auto_20824 ?auto_20826 ) ) ( not ( = ?auto_20824 ?auto_20843 ) ) ( not ( = ?auto_20826 ?auto_20847 ) ) ( not ( = ?auto_20826 ?auto_20839 ) ) ( not ( = ?auto_20846 ?auto_20844 ) ) ( not ( = ?auto_20846 ?auto_20834 ) ) ( not ( = ?auto_20840 ?auto_20841 ) ) ( not ( = ?auto_20840 ?auto_20833 ) ) ( not ( = ?auto_20843 ?auto_20847 ) ) ( not ( = ?auto_20843 ?auto_20839 ) ) ( not ( = ?auto_20823 ?auto_20827 ) ) ( not ( = ?auto_20823 ?auto_20848 ) ) ( not ( = ?auto_20824 ?auto_20827 ) ) ( not ( = ?auto_20824 ?auto_20848 ) ) ( not ( = ?auto_20825 ?auto_20827 ) ) ( not ( = ?auto_20825 ?auto_20848 ) ) ( not ( = ?auto_20827 ?auto_20843 ) ) ( not ( = ?auto_20827 ?auto_20847 ) ) ( not ( = ?auto_20827 ?auto_20839 ) ) ( not ( = ?auto_20838 ?auto_20846 ) ) ( not ( = ?auto_20838 ?auto_20844 ) ) ( not ( = ?auto_20838 ?auto_20834 ) ) ( not ( = ?auto_20842 ?auto_20840 ) ) ( not ( = ?auto_20842 ?auto_20841 ) ) ( not ( = ?auto_20842 ?auto_20833 ) ) ( not ( = ?auto_20848 ?auto_20843 ) ) ( not ( = ?auto_20848 ?auto_20847 ) ) ( not ( = ?auto_20848 ?auto_20839 ) ) ( not ( = ?auto_20823 ?auto_20828 ) ) ( not ( = ?auto_20823 ?auto_20836 ) ) ( not ( = ?auto_20824 ?auto_20828 ) ) ( not ( = ?auto_20824 ?auto_20836 ) ) ( not ( = ?auto_20825 ?auto_20828 ) ) ( not ( = ?auto_20825 ?auto_20836 ) ) ( not ( = ?auto_20826 ?auto_20828 ) ) ( not ( = ?auto_20826 ?auto_20836 ) ) ( not ( = ?auto_20828 ?auto_20848 ) ) ( not ( = ?auto_20828 ?auto_20843 ) ) ( not ( = ?auto_20828 ?auto_20847 ) ) ( not ( = ?auto_20828 ?auto_20839 ) ) ( not ( = ?auto_20845 ?auto_20838 ) ) ( not ( = ?auto_20845 ?auto_20846 ) ) ( not ( = ?auto_20845 ?auto_20844 ) ) ( not ( = ?auto_20845 ?auto_20834 ) ) ( not ( = ?auto_20837 ?auto_20842 ) ) ( not ( = ?auto_20837 ?auto_20840 ) ) ( not ( = ?auto_20837 ?auto_20841 ) ) ( not ( = ?auto_20837 ?auto_20833 ) ) ( not ( = ?auto_20836 ?auto_20848 ) ) ( not ( = ?auto_20836 ?auto_20843 ) ) ( not ( = ?auto_20836 ?auto_20847 ) ) ( not ( = ?auto_20836 ?auto_20839 ) ) ( not ( = ?auto_20823 ?auto_20829 ) ) ( not ( = ?auto_20823 ?auto_20831 ) ) ( not ( = ?auto_20824 ?auto_20829 ) ) ( not ( = ?auto_20824 ?auto_20831 ) ) ( not ( = ?auto_20825 ?auto_20829 ) ) ( not ( = ?auto_20825 ?auto_20831 ) ) ( not ( = ?auto_20826 ?auto_20829 ) ) ( not ( = ?auto_20826 ?auto_20831 ) ) ( not ( = ?auto_20827 ?auto_20829 ) ) ( not ( = ?auto_20827 ?auto_20831 ) ) ( not ( = ?auto_20829 ?auto_20836 ) ) ( not ( = ?auto_20829 ?auto_20848 ) ) ( not ( = ?auto_20829 ?auto_20843 ) ) ( not ( = ?auto_20829 ?auto_20847 ) ) ( not ( = ?auto_20829 ?auto_20839 ) ) ( not ( = ?auto_20831 ?auto_20836 ) ) ( not ( = ?auto_20831 ?auto_20848 ) ) ( not ( = ?auto_20831 ?auto_20843 ) ) ( not ( = ?auto_20831 ?auto_20847 ) ) ( not ( = ?auto_20831 ?auto_20839 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_20823 ?auto_20824 ?auto_20825 ?auto_20826 ?auto_20827 ?auto_20828 )
      ( MAKE-1CRATE ?auto_20828 ?auto_20829 )
      ( MAKE-6CRATE-VERIFY ?auto_20823 ?auto_20824 ?auto_20825 ?auto_20826 ?auto_20827 ?auto_20828 ?auto_20829 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20851 - SURFACE
      ?auto_20852 - SURFACE
    )
    :vars
    (
      ?auto_20853 - HOIST
      ?auto_20854 - PLACE
      ?auto_20856 - PLACE
      ?auto_20857 - HOIST
      ?auto_20858 - SURFACE
      ?auto_20855 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20853 ?auto_20854 ) ( SURFACE-AT ?auto_20851 ?auto_20854 ) ( CLEAR ?auto_20851 ) ( IS-CRATE ?auto_20852 ) ( AVAILABLE ?auto_20853 ) ( not ( = ?auto_20856 ?auto_20854 ) ) ( HOIST-AT ?auto_20857 ?auto_20856 ) ( AVAILABLE ?auto_20857 ) ( SURFACE-AT ?auto_20852 ?auto_20856 ) ( ON ?auto_20852 ?auto_20858 ) ( CLEAR ?auto_20852 ) ( TRUCK-AT ?auto_20855 ?auto_20854 ) ( not ( = ?auto_20851 ?auto_20852 ) ) ( not ( = ?auto_20851 ?auto_20858 ) ) ( not ( = ?auto_20852 ?auto_20858 ) ) ( not ( = ?auto_20853 ?auto_20857 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20855 ?auto_20854 ?auto_20856 )
      ( !LIFT ?auto_20857 ?auto_20852 ?auto_20858 ?auto_20856 )
      ( !LOAD ?auto_20857 ?auto_20852 ?auto_20855 ?auto_20856 )
      ( !DRIVE ?auto_20855 ?auto_20856 ?auto_20854 )
      ( !UNLOAD ?auto_20853 ?auto_20852 ?auto_20855 ?auto_20854 )
      ( !DROP ?auto_20853 ?auto_20852 ?auto_20851 ?auto_20854 )
      ( MAKE-1CRATE-VERIFY ?auto_20851 ?auto_20852 ) )
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
      ?auto_20876 - HOIST
      ?auto_20875 - PLACE
      ?auto_20878 - PLACE
      ?auto_20880 - HOIST
      ?auto_20877 - SURFACE
      ?auto_20894 - PLACE
      ?auto_20896 - HOIST
      ?auto_20881 - SURFACE
      ?auto_20882 - PLACE
      ?auto_20885 - HOIST
      ?auto_20895 - SURFACE
      ?auto_20886 - PLACE
      ?auto_20889 - HOIST
      ?auto_20884 - SURFACE
      ?auto_20893 - PLACE
      ?auto_20891 - HOIST
      ?auto_20888 - SURFACE
      ?auto_20892 - PLACE
      ?auto_20890 - HOIST
      ?auto_20883 - SURFACE
      ?auto_20887 - SURFACE
      ?auto_20879 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20876 ?auto_20875 ) ( IS-CRATE ?auto_20874 ) ( not ( = ?auto_20878 ?auto_20875 ) ) ( HOIST-AT ?auto_20880 ?auto_20878 ) ( AVAILABLE ?auto_20880 ) ( SURFACE-AT ?auto_20874 ?auto_20878 ) ( ON ?auto_20874 ?auto_20877 ) ( CLEAR ?auto_20874 ) ( not ( = ?auto_20873 ?auto_20874 ) ) ( not ( = ?auto_20873 ?auto_20877 ) ) ( not ( = ?auto_20874 ?auto_20877 ) ) ( not ( = ?auto_20876 ?auto_20880 ) ) ( IS-CRATE ?auto_20873 ) ( not ( = ?auto_20894 ?auto_20875 ) ) ( HOIST-AT ?auto_20896 ?auto_20894 ) ( SURFACE-AT ?auto_20873 ?auto_20894 ) ( ON ?auto_20873 ?auto_20881 ) ( CLEAR ?auto_20873 ) ( not ( = ?auto_20872 ?auto_20873 ) ) ( not ( = ?auto_20872 ?auto_20881 ) ) ( not ( = ?auto_20873 ?auto_20881 ) ) ( not ( = ?auto_20876 ?auto_20896 ) ) ( IS-CRATE ?auto_20872 ) ( not ( = ?auto_20882 ?auto_20875 ) ) ( HOIST-AT ?auto_20885 ?auto_20882 ) ( AVAILABLE ?auto_20885 ) ( SURFACE-AT ?auto_20872 ?auto_20882 ) ( ON ?auto_20872 ?auto_20895 ) ( CLEAR ?auto_20872 ) ( not ( = ?auto_20871 ?auto_20872 ) ) ( not ( = ?auto_20871 ?auto_20895 ) ) ( not ( = ?auto_20872 ?auto_20895 ) ) ( not ( = ?auto_20876 ?auto_20885 ) ) ( IS-CRATE ?auto_20871 ) ( not ( = ?auto_20886 ?auto_20875 ) ) ( HOIST-AT ?auto_20889 ?auto_20886 ) ( AVAILABLE ?auto_20889 ) ( SURFACE-AT ?auto_20871 ?auto_20886 ) ( ON ?auto_20871 ?auto_20884 ) ( CLEAR ?auto_20871 ) ( not ( = ?auto_20870 ?auto_20871 ) ) ( not ( = ?auto_20870 ?auto_20884 ) ) ( not ( = ?auto_20871 ?auto_20884 ) ) ( not ( = ?auto_20876 ?auto_20889 ) ) ( IS-CRATE ?auto_20870 ) ( not ( = ?auto_20893 ?auto_20875 ) ) ( HOIST-AT ?auto_20891 ?auto_20893 ) ( AVAILABLE ?auto_20891 ) ( SURFACE-AT ?auto_20870 ?auto_20893 ) ( ON ?auto_20870 ?auto_20888 ) ( CLEAR ?auto_20870 ) ( not ( = ?auto_20869 ?auto_20870 ) ) ( not ( = ?auto_20869 ?auto_20888 ) ) ( not ( = ?auto_20870 ?auto_20888 ) ) ( not ( = ?auto_20876 ?auto_20891 ) ) ( IS-CRATE ?auto_20869 ) ( not ( = ?auto_20892 ?auto_20875 ) ) ( HOIST-AT ?auto_20890 ?auto_20892 ) ( AVAILABLE ?auto_20890 ) ( SURFACE-AT ?auto_20869 ?auto_20892 ) ( ON ?auto_20869 ?auto_20883 ) ( CLEAR ?auto_20869 ) ( not ( = ?auto_20868 ?auto_20869 ) ) ( not ( = ?auto_20868 ?auto_20883 ) ) ( not ( = ?auto_20869 ?auto_20883 ) ) ( not ( = ?auto_20876 ?auto_20890 ) ) ( SURFACE-AT ?auto_20867 ?auto_20875 ) ( CLEAR ?auto_20867 ) ( IS-CRATE ?auto_20868 ) ( AVAILABLE ?auto_20876 ) ( AVAILABLE ?auto_20896 ) ( SURFACE-AT ?auto_20868 ?auto_20894 ) ( ON ?auto_20868 ?auto_20887 ) ( CLEAR ?auto_20868 ) ( TRUCK-AT ?auto_20879 ?auto_20875 ) ( not ( = ?auto_20867 ?auto_20868 ) ) ( not ( = ?auto_20867 ?auto_20887 ) ) ( not ( = ?auto_20868 ?auto_20887 ) ) ( not ( = ?auto_20867 ?auto_20869 ) ) ( not ( = ?auto_20867 ?auto_20883 ) ) ( not ( = ?auto_20869 ?auto_20887 ) ) ( not ( = ?auto_20892 ?auto_20894 ) ) ( not ( = ?auto_20890 ?auto_20896 ) ) ( not ( = ?auto_20883 ?auto_20887 ) ) ( not ( = ?auto_20867 ?auto_20870 ) ) ( not ( = ?auto_20867 ?auto_20888 ) ) ( not ( = ?auto_20868 ?auto_20870 ) ) ( not ( = ?auto_20868 ?auto_20888 ) ) ( not ( = ?auto_20870 ?auto_20883 ) ) ( not ( = ?auto_20870 ?auto_20887 ) ) ( not ( = ?auto_20893 ?auto_20892 ) ) ( not ( = ?auto_20893 ?auto_20894 ) ) ( not ( = ?auto_20891 ?auto_20890 ) ) ( not ( = ?auto_20891 ?auto_20896 ) ) ( not ( = ?auto_20888 ?auto_20883 ) ) ( not ( = ?auto_20888 ?auto_20887 ) ) ( not ( = ?auto_20867 ?auto_20871 ) ) ( not ( = ?auto_20867 ?auto_20884 ) ) ( not ( = ?auto_20868 ?auto_20871 ) ) ( not ( = ?auto_20868 ?auto_20884 ) ) ( not ( = ?auto_20869 ?auto_20871 ) ) ( not ( = ?auto_20869 ?auto_20884 ) ) ( not ( = ?auto_20871 ?auto_20888 ) ) ( not ( = ?auto_20871 ?auto_20883 ) ) ( not ( = ?auto_20871 ?auto_20887 ) ) ( not ( = ?auto_20886 ?auto_20893 ) ) ( not ( = ?auto_20886 ?auto_20892 ) ) ( not ( = ?auto_20886 ?auto_20894 ) ) ( not ( = ?auto_20889 ?auto_20891 ) ) ( not ( = ?auto_20889 ?auto_20890 ) ) ( not ( = ?auto_20889 ?auto_20896 ) ) ( not ( = ?auto_20884 ?auto_20888 ) ) ( not ( = ?auto_20884 ?auto_20883 ) ) ( not ( = ?auto_20884 ?auto_20887 ) ) ( not ( = ?auto_20867 ?auto_20872 ) ) ( not ( = ?auto_20867 ?auto_20895 ) ) ( not ( = ?auto_20868 ?auto_20872 ) ) ( not ( = ?auto_20868 ?auto_20895 ) ) ( not ( = ?auto_20869 ?auto_20872 ) ) ( not ( = ?auto_20869 ?auto_20895 ) ) ( not ( = ?auto_20870 ?auto_20872 ) ) ( not ( = ?auto_20870 ?auto_20895 ) ) ( not ( = ?auto_20872 ?auto_20884 ) ) ( not ( = ?auto_20872 ?auto_20888 ) ) ( not ( = ?auto_20872 ?auto_20883 ) ) ( not ( = ?auto_20872 ?auto_20887 ) ) ( not ( = ?auto_20882 ?auto_20886 ) ) ( not ( = ?auto_20882 ?auto_20893 ) ) ( not ( = ?auto_20882 ?auto_20892 ) ) ( not ( = ?auto_20882 ?auto_20894 ) ) ( not ( = ?auto_20885 ?auto_20889 ) ) ( not ( = ?auto_20885 ?auto_20891 ) ) ( not ( = ?auto_20885 ?auto_20890 ) ) ( not ( = ?auto_20885 ?auto_20896 ) ) ( not ( = ?auto_20895 ?auto_20884 ) ) ( not ( = ?auto_20895 ?auto_20888 ) ) ( not ( = ?auto_20895 ?auto_20883 ) ) ( not ( = ?auto_20895 ?auto_20887 ) ) ( not ( = ?auto_20867 ?auto_20873 ) ) ( not ( = ?auto_20867 ?auto_20881 ) ) ( not ( = ?auto_20868 ?auto_20873 ) ) ( not ( = ?auto_20868 ?auto_20881 ) ) ( not ( = ?auto_20869 ?auto_20873 ) ) ( not ( = ?auto_20869 ?auto_20881 ) ) ( not ( = ?auto_20870 ?auto_20873 ) ) ( not ( = ?auto_20870 ?auto_20881 ) ) ( not ( = ?auto_20871 ?auto_20873 ) ) ( not ( = ?auto_20871 ?auto_20881 ) ) ( not ( = ?auto_20873 ?auto_20895 ) ) ( not ( = ?auto_20873 ?auto_20884 ) ) ( not ( = ?auto_20873 ?auto_20888 ) ) ( not ( = ?auto_20873 ?auto_20883 ) ) ( not ( = ?auto_20873 ?auto_20887 ) ) ( not ( = ?auto_20881 ?auto_20895 ) ) ( not ( = ?auto_20881 ?auto_20884 ) ) ( not ( = ?auto_20881 ?auto_20888 ) ) ( not ( = ?auto_20881 ?auto_20883 ) ) ( not ( = ?auto_20881 ?auto_20887 ) ) ( not ( = ?auto_20867 ?auto_20874 ) ) ( not ( = ?auto_20867 ?auto_20877 ) ) ( not ( = ?auto_20868 ?auto_20874 ) ) ( not ( = ?auto_20868 ?auto_20877 ) ) ( not ( = ?auto_20869 ?auto_20874 ) ) ( not ( = ?auto_20869 ?auto_20877 ) ) ( not ( = ?auto_20870 ?auto_20874 ) ) ( not ( = ?auto_20870 ?auto_20877 ) ) ( not ( = ?auto_20871 ?auto_20874 ) ) ( not ( = ?auto_20871 ?auto_20877 ) ) ( not ( = ?auto_20872 ?auto_20874 ) ) ( not ( = ?auto_20872 ?auto_20877 ) ) ( not ( = ?auto_20874 ?auto_20881 ) ) ( not ( = ?auto_20874 ?auto_20895 ) ) ( not ( = ?auto_20874 ?auto_20884 ) ) ( not ( = ?auto_20874 ?auto_20888 ) ) ( not ( = ?auto_20874 ?auto_20883 ) ) ( not ( = ?auto_20874 ?auto_20887 ) ) ( not ( = ?auto_20878 ?auto_20894 ) ) ( not ( = ?auto_20878 ?auto_20882 ) ) ( not ( = ?auto_20878 ?auto_20886 ) ) ( not ( = ?auto_20878 ?auto_20893 ) ) ( not ( = ?auto_20878 ?auto_20892 ) ) ( not ( = ?auto_20880 ?auto_20896 ) ) ( not ( = ?auto_20880 ?auto_20885 ) ) ( not ( = ?auto_20880 ?auto_20889 ) ) ( not ( = ?auto_20880 ?auto_20891 ) ) ( not ( = ?auto_20880 ?auto_20890 ) ) ( not ( = ?auto_20877 ?auto_20881 ) ) ( not ( = ?auto_20877 ?auto_20895 ) ) ( not ( = ?auto_20877 ?auto_20884 ) ) ( not ( = ?auto_20877 ?auto_20888 ) ) ( not ( = ?auto_20877 ?auto_20883 ) ) ( not ( = ?auto_20877 ?auto_20887 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_20867 ?auto_20868 ?auto_20869 ?auto_20870 ?auto_20871 ?auto_20872 ?auto_20873 )
      ( MAKE-1CRATE ?auto_20873 ?auto_20874 )
      ( MAKE-7CRATE-VERIFY ?auto_20867 ?auto_20868 ?auto_20869 ?auto_20870 ?auto_20871 ?auto_20872 ?auto_20873 ?auto_20874 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20899 - SURFACE
      ?auto_20900 - SURFACE
    )
    :vars
    (
      ?auto_20901 - HOIST
      ?auto_20902 - PLACE
      ?auto_20904 - PLACE
      ?auto_20905 - HOIST
      ?auto_20906 - SURFACE
      ?auto_20903 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20901 ?auto_20902 ) ( SURFACE-AT ?auto_20899 ?auto_20902 ) ( CLEAR ?auto_20899 ) ( IS-CRATE ?auto_20900 ) ( AVAILABLE ?auto_20901 ) ( not ( = ?auto_20904 ?auto_20902 ) ) ( HOIST-AT ?auto_20905 ?auto_20904 ) ( AVAILABLE ?auto_20905 ) ( SURFACE-AT ?auto_20900 ?auto_20904 ) ( ON ?auto_20900 ?auto_20906 ) ( CLEAR ?auto_20900 ) ( TRUCK-AT ?auto_20903 ?auto_20902 ) ( not ( = ?auto_20899 ?auto_20900 ) ) ( not ( = ?auto_20899 ?auto_20906 ) ) ( not ( = ?auto_20900 ?auto_20906 ) ) ( not ( = ?auto_20901 ?auto_20905 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20903 ?auto_20902 ?auto_20904 )
      ( !LIFT ?auto_20905 ?auto_20900 ?auto_20906 ?auto_20904 )
      ( !LOAD ?auto_20905 ?auto_20900 ?auto_20903 ?auto_20904 )
      ( !DRIVE ?auto_20903 ?auto_20904 ?auto_20902 )
      ( !UNLOAD ?auto_20901 ?auto_20900 ?auto_20903 ?auto_20902 )
      ( !DROP ?auto_20901 ?auto_20900 ?auto_20899 ?auto_20902 )
      ( MAKE-1CRATE-VERIFY ?auto_20899 ?auto_20900 ) )
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
      ?auto_20924 - SURFACE
      ?auto_20923 - SURFACE
    )
    :vars
    (
      ?auto_20929 - HOIST
      ?auto_20928 - PLACE
      ?auto_20925 - PLACE
      ?auto_20927 - HOIST
      ?auto_20930 - SURFACE
      ?auto_20938 - PLACE
      ?auto_20939 - HOIST
      ?auto_20941 - SURFACE
      ?auto_20937 - SURFACE
      ?auto_20946 - PLACE
      ?auto_20945 - HOIST
      ?auto_20947 - SURFACE
      ?auto_20944 - PLACE
      ?auto_20932 - HOIST
      ?auto_20931 - SURFACE
      ?auto_20936 - PLACE
      ?auto_20933 - HOIST
      ?auto_20942 - SURFACE
      ?auto_20935 - PLACE
      ?auto_20934 - HOIST
      ?auto_20940 - SURFACE
      ?auto_20943 - SURFACE
      ?auto_20926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20929 ?auto_20928 ) ( IS-CRATE ?auto_20923 ) ( not ( = ?auto_20925 ?auto_20928 ) ) ( HOIST-AT ?auto_20927 ?auto_20925 ) ( SURFACE-AT ?auto_20923 ?auto_20925 ) ( ON ?auto_20923 ?auto_20930 ) ( CLEAR ?auto_20923 ) ( not ( = ?auto_20924 ?auto_20923 ) ) ( not ( = ?auto_20924 ?auto_20930 ) ) ( not ( = ?auto_20923 ?auto_20930 ) ) ( not ( = ?auto_20929 ?auto_20927 ) ) ( IS-CRATE ?auto_20924 ) ( not ( = ?auto_20938 ?auto_20928 ) ) ( HOIST-AT ?auto_20939 ?auto_20938 ) ( AVAILABLE ?auto_20939 ) ( SURFACE-AT ?auto_20924 ?auto_20938 ) ( ON ?auto_20924 ?auto_20941 ) ( CLEAR ?auto_20924 ) ( not ( = ?auto_20922 ?auto_20924 ) ) ( not ( = ?auto_20922 ?auto_20941 ) ) ( not ( = ?auto_20924 ?auto_20941 ) ) ( not ( = ?auto_20929 ?auto_20939 ) ) ( IS-CRATE ?auto_20922 ) ( SURFACE-AT ?auto_20922 ?auto_20925 ) ( ON ?auto_20922 ?auto_20937 ) ( CLEAR ?auto_20922 ) ( not ( = ?auto_20921 ?auto_20922 ) ) ( not ( = ?auto_20921 ?auto_20937 ) ) ( not ( = ?auto_20922 ?auto_20937 ) ) ( IS-CRATE ?auto_20921 ) ( not ( = ?auto_20946 ?auto_20928 ) ) ( HOIST-AT ?auto_20945 ?auto_20946 ) ( AVAILABLE ?auto_20945 ) ( SURFACE-AT ?auto_20921 ?auto_20946 ) ( ON ?auto_20921 ?auto_20947 ) ( CLEAR ?auto_20921 ) ( not ( = ?auto_20920 ?auto_20921 ) ) ( not ( = ?auto_20920 ?auto_20947 ) ) ( not ( = ?auto_20921 ?auto_20947 ) ) ( not ( = ?auto_20929 ?auto_20945 ) ) ( IS-CRATE ?auto_20920 ) ( not ( = ?auto_20944 ?auto_20928 ) ) ( HOIST-AT ?auto_20932 ?auto_20944 ) ( AVAILABLE ?auto_20932 ) ( SURFACE-AT ?auto_20920 ?auto_20944 ) ( ON ?auto_20920 ?auto_20931 ) ( CLEAR ?auto_20920 ) ( not ( = ?auto_20919 ?auto_20920 ) ) ( not ( = ?auto_20919 ?auto_20931 ) ) ( not ( = ?auto_20920 ?auto_20931 ) ) ( not ( = ?auto_20929 ?auto_20932 ) ) ( IS-CRATE ?auto_20919 ) ( not ( = ?auto_20936 ?auto_20928 ) ) ( HOIST-AT ?auto_20933 ?auto_20936 ) ( AVAILABLE ?auto_20933 ) ( SURFACE-AT ?auto_20919 ?auto_20936 ) ( ON ?auto_20919 ?auto_20942 ) ( CLEAR ?auto_20919 ) ( not ( = ?auto_20918 ?auto_20919 ) ) ( not ( = ?auto_20918 ?auto_20942 ) ) ( not ( = ?auto_20919 ?auto_20942 ) ) ( not ( = ?auto_20929 ?auto_20933 ) ) ( IS-CRATE ?auto_20918 ) ( not ( = ?auto_20935 ?auto_20928 ) ) ( HOIST-AT ?auto_20934 ?auto_20935 ) ( AVAILABLE ?auto_20934 ) ( SURFACE-AT ?auto_20918 ?auto_20935 ) ( ON ?auto_20918 ?auto_20940 ) ( CLEAR ?auto_20918 ) ( not ( = ?auto_20917 ?auto_20918 ) ) ( not ( = ?auto_20917 ?auto_20940 ) ) ( not ( = ?auto_20918 ?auto_20940 ) ) ( not ( = ?auto_20929 ?auto_20934 ) ) ( SURFACE-AT ?auto_20916 ?auto_20928 ) ( CLEAR ?auto_20916 ) ( IS-CRATE ?auto_20917 ) ( AVAILABLE ?auto_20929 ) ( AVAILABLE ?auto_20927 ) ( SURFACE-AT ?auto_20917 ?auto_20925 ) ( ON ?auto_20917 ?auto_20943 ) ( CLEAR ?auto_20917 ) ( TRUCK-AT ?auto_20926 ?auto_20928 ) ( not ( = ?auto_20916 ?auto_20917 ) ) ( not ( = ?auto_20916 ?auto_20943 ) ) ( not ( = ?auto_20917 ?auto_20943 ) ) ( not ( = ?auto_20916 ?auto_20918 ) ) ( not ( = ?auto_20916 ?auto_20940 ) ) ( not ( = ?auto_20918 ?auto_20943 ) ) ( not ( = ?auto_20935 ?auto_20925 ) ) ( not ( = ?auto_20934 ?auto_20927 ) ) ( not ( = ?auto_20940 ?auto_20943 ) ) ( not ( = ?auto_20916 ?auto_20919 ) ) ( not ( = ?auto_20916 ?auto_20942 ) ) ( not ( = ?auto_20917 ?auto_20919 ) ) ( not ( = ?auto_20917 ?auto_20942 ) ) ( not ( = ?auto_20919 ?auto_20940 ) ) ( not ( = ?auto_20919 ?auto_20943 ) ) ( not ( = ?auto_20936 ?auto_20935 ) ) ( not ( = ?auto_20936 ?auto_20925 ) ) ( not ( = ?auto_20933 ?auto_20934 ) ) ( not ( = ?auto_20933 ?auto_20927 ) ) ( not ( = ?auto_20942 ?auto_20940 ) ) ( not ( = ?auto_20942 ?auto_20943 ) ) ( not ( = ?auto_20916 ?auto_20920 ) ) ( not ( = ?auto_20916 ?auto_20931 ) ) ( not ( = ?auto_20917 ?auto_20920 ) ) ( not ( = ?auto_20917 ?auto_20931 ) ) ( not ( = ?auto_20918 ?auto_20920 ) ) ( not ( = ?auto_20918 ?auto_20931 ) ) ( not ( = ?auto_20920 ?auto_20942 ) ) ( not ( = ?auto_20920 ?auto_20940 ) ) ( not ( = ?auto_20920 ?auto_20943 ) ) ( not ( = ?auto_20944 ?auto_20936 ) ) ( not ( = ?auto_20944 ?auto_20935 ) ) ( not ( = ?auto_20944 ?auto_20925 ) ) ( not ( = ?auto_20932 ?auto_20933 ) ) ( not ( = ?auto_20932 ?auto_20934 ) ) ( not ( = ?auto_20932 ?auto_20927 ) ) ( not ( = ?auto_20931 ?auto_20942 ) ) ( not ( = ?auto_20931 ?auto_20940 ) ) ( not ( = ?auto_20931 ?auto_20943 ) ) ( not ( = ?auto_20916 ?auto_20921 ) ) ( not ( = ?auto_20916 ?auto_20947 ) ) ( not ( = ?auto_20917 ?auto_20921 ) ) ( not ( = ?auto_20917 ?auto_20947 ) ) ( not ( = ?auto_20918 ?auto_20921 ) ) ( not ( = ?auto_20918 ?auto_20947 ) ) ( not ( = ?auto_20919 ?auto_20921 ) ) ( not ( = ?auto_20919 ?auto_20947 ) ) ( not ( = ?auto_20921 ?auto_20931 ) ) ( not ( = ?auto_20921 ?auto_20942 ) ) ( not ( = ?auto_20921 ?auto_20940 ) ) ( not ( = ?auto_20921 ?auto_20943 ) ) ( not ( = ?auto_20946 ?auto_20944 ) ) ( not ( = ?auto_20946 ?auto_20936 ) ) ( not ( = ?auto_20946 ?auto_20935 ) ) ( not ( = ?auto_20946 ?auto_20925 ) ) ( not ( = ?auto_20945 ?auto_20932 ) ) ( not ( = ?auto_20945 ?auto_20933 ) ) ( not ( = ?auto_20945 ?auto_20934 ) ) ( not ( = ?auto_20945 ?auto_20927 ) ) ( not ( = ?auto_20947 ?auto_20931 ) ) ( not ( = ?auto_20947 ?auto_20942 ) ) ( not ( = ?auto_20947 ?auto_20940 ) ) ( not ( = ?auto_20947 ?auto_20943 ) ) ( not ( = ?auto_20916 ?auto_20922 ) ) ( not ( = ?auto_20916 ?auto_20937 ) ) ( not ( = ?auto_20917 ?auto_20922 ) ) ( not ( = ?auto_20917 ?auto_20937 ) ) ( not ( = ?auto_20918 ?auto_20922 ) ) ( not ( = ?auto_20918 ?auto_20937 ) ) ( not ( = ?auto_20919 ?auto_20922 ) ) ( not ( = ?auto_20919 ?auto_20937 ) ) ( not ( = ?auto_20920 ?auto_20922 ) ) ( not ( = ?auto_20920 ?auto_20937 ) ) ( not ( = ?auto_20922 ?auto_20947 ) ) ( not ( = ?auto_20922 ?auto_20931 ) ) ( not ( = ?auto_20922 ?auto_20942 ) ) ( not ( = ?auto_20922 ?auto_20940 ) ) ( not ( = ?auto_20922 ?auto_20943 ) ) ( not ( = ?auto_20937 ?auto_20947 ) ) ( not ( = ?auto_20937 ?auto_20931 ) ) ( not ( = ?auto_20937 ?auto_20942 ) ) ( not ( = ?auto_20937 ?auto_20940 ) ) ( not ( = ?auto_20937 ?auto_20943 ) ) ( not ( = ?auto_20916 ?auto_20924 ) ) ( not ( = ?auto_20916 ?auto_20941 ) ) ( not ( = ?auto_20917 ?auto_20924 ) ) ( not ( = ?auto_20917 ?auto_20941 ) ) ( not ( = ?auto_20918 ?auto_20924 ) ) ( not ( = ?auto_20918 ?auto_20941 ) ) ( not ( = ?auto_20919 ?auto_20924 ) ) ( not ( = ?auto_20919 ?auto_20941 ) ) ( not ( = ?auto_20920 ?auto_20924 ) ) ( not ( = ?auto_20920 ?auto_20941 ) ) ( not ( = ?auto_20921 ?auto_20924 ) ) ( not ( = ?auto_20921 ?auto_20941 ) ) ( not ( = ?auto_20924 ?auto_20937 ) ) ( not ( = ?auto_20924 ?auto_20947 ) ) ( not ( = ?auto_20924 ?auto_20931 ) ) ( not ( = ?auto_20924 ?auto_20942 ) ) ( not ( = ?auto_20924 ?auto_20940 ) ) ( not ( = ?auto_20924 ?auto_20943 ) ) ( not ( = ?auto_20938 ?auto_20925 ) ) ( not ( = ?auto_20938 ?auto_20946 ) ) ( not ( = ?auto_20938 ?auto_20944 ) ) ( not ( = ?auto_20938 ?auto_20936 ) ) ( not ( = ?auto_20938 ?auto_20935 ) ) ( not ( = ?auto_20939 ?auto_20927 ) ) ( not ( = ?auto_20939 ?auto_20945 ) ) ( not ( = ?auto_20939 ?auto_20932 ) ) ( not ( = ?auto_20939 ?auto_20933 ) ) ( not ( = ?auto_20939 ?auto_20934 ) ) ( not ( = ?auto_20941 ?auto_20937 ) ) ( not ( = ?auto_20941 ?auto_20947 ) ) ( not ( = ?auto_20941 ?auto_20931 ) ) ( not ( = ?auto_20941 ?auto_20942 ) ) ( not ( = ?auto_20941 ?auto_20940 ) ) ( not ( = ?auto_20941 ?auto_20943 ) ) ( not ( = ?auto_20916 ?auto_20923 ) ) ( not ( = ?auto_20916 ?auto_20930 ) ) ( not ( = ?auto_20917 ?auto_20923 ) ) ( not ( = ?auto_20917 ?auto_20930 ) ) ( not ( = ?auto_20918 ?auto_20923 ) ) ( not ( = ?auto_20918 ?auto_20930 ) ) ( not ( = ?auto_20919 ?auto_20923 ) ) ( not ( = ?auto_20919 ?auto_20930 ) ) ( not ( = ?auto_20920 ?auto_20923 ) ) ( not ( = ?auto_20920 ?auto_20930 ) ) ( not ( = ?auto_20921 ?auto_20923 ) ) ( not ( = ?auto_20921 ?auto_20930 ) ) ( not ( = ?auto_20922 ?auto_20923 ) ) ( not ( = ?auto_20922 ?auto_20930 ) ) ( not ( = ?auto_20923 ?auto_20941 ) ) ( not ( = ?auto_20923 ?auto_20937 ) ) ( not ( = ?auto_20923 ?auto_20947 ) ) ( not ( = ?auto_20923 ?auto_20931 ) ) ( not ( = ?auto_20923 ?auto_20942 ) ) ( not ( = ?auto_20923 ?auto_20940 ) ) ( not ( = ?auto_20923 ?auto_20943 ) ) ( not ( = ?auto_20930 ?auto_20941 ) ) ( not ( = ?auto_20930 ?auto_20937 ) ) ( not ( = ?auto_20930 ?auto_20947 ) ) ( not ( = ?auto_20930 ?auto_20931 ) ) ( not ( = ?auto_20930 ?auto_20942 ) ) ( not ( = ?auto_20930 ?auto_20940 ) ) ( not ( = ?auto_20930 ?auto_20943 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_20916 ?auto_20917 ?auto_20918 ?auto_20919 ?auto_20920 ?auto_20921 ?auto_20922 ?auto_20924 )
      ( MAKE-1CRATE ?auto_20924 ?auto_20923 )
      ( MAKE-8CRATE-VERIFY ?auto_20916 ?auto_20917 ?auto_20918 ?auto_20919 ?auto_20920 ?auto_20921 ?auto_20922 ?auto_20924 ?auto_20923 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20950 - SURFACE
      ?auto_20951 - SURFACE
    )
    :vars
    (
      ?auto_20952 - HOIST
      ?auto_20953 - PLACE
      ?auto_20955 - PLACE
      ?auto_20956 - HOIST
      ?auto_20957 - SURFACE
      ?auto_20954 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20952 ?auto_20953 ) ( SURFACE-AT ?auto_20950 ?auto_20953 ) ( CLEAR ?auto_20950 ) ( IS-CRATE ?auto_20951 ) ( AVAILABLE ?auto_20952 ) ( not ( = ?auto_20955 ?auto_20953 ) ) ( HOIST-AT ?auto_20956 ?auto_20955 ) ( AVAILABLE ?auto_20956 ) ( SURFACE-AT ?auto_20951 ?auto_20955 ) ( ON ?auto_20951 ?auto_20957 ) ( CLEAR ?auto_20951 ) ( TRUCK-AT ?auto_20954 ?auto_20953 ) ( not ( = ?auto_20950 ?auto_20951 ) ) ( not ( = ?auto_20950 ?auto_20957 ) ) ( not ( = ?auto_20951 ?auto_20957 ) ) ( not ( = ?auto_20952 ?auto_20956 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20954 ?auto_20953 ?auto_20955 )
      ( !LIFT ?auto_20956 ?auto_20951 ?auto_20957 ?auto_20955 )
      ( !LOAD ?auto_20956 ?auto_20951 ?auto_20954 ?auto_20955 )
      ( !DRIVE ?auto_20954 ?auto_20955 ?auto_20953 )
      ( !UNLOAD ?auto_20952 ?auto_20951 ?auto_20954 ?auto_20953 )
      ( !DROP ?auto_20952 ?auto_20951 ?auto_20950 ?auto_20953 )
      ( MAKE-1CRATE-VERIFY ?auto_20950 ?auto_20951 ) )
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
      ?auto_20977 - SURFACE
      ?auto_20976 - SURFACE
      ?auto_20975 - SURFACE
    )
    :vars
    (
      ?auto_20980 - HOIST
      ?auto_20979 - PLACE
      ?auto_20978 - PLACE
      ?auto_20982 - HOIST
      ?auto_20981 - SURFACE
      ?auto_20987 - PLACE
      ?auto_20999 - HOIST
      ?auto_21000 - SURFACE
      ?auto_20991 - SURFACE
      ?auto_20996 - SURFACE
      ?auto_20990 - PLACE
      ?auto_20986 - HOIST
      ?auto_20985 - SURFACE
      ?auto_20995 - PLACE
      ?auto_20988 - HOIST
      ?auto_20984 - SURFACE
      ?auto_20997 - PLACE
      ?auto_20989 - HOIST
      ?auto_20993 - SURFACE
      ?auto_20998 - PLACE
      ?auto_21001 - HOIST
      ?auto_20992 - SURFACE
      ?auto_20994 - SURFACE
      ?auto_20983 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20980 ?auto_20979 ) ( IS-CRATE ?auto_20975 ) ( not ( = ?auto_20978 ?auto_20979 ) ) ( HOIST-AT ?auto_20982 ?auto_20978 ) ( SURFACE-AT ?auto_20975 ?auto_20978 ) ( ON ?auto_20975 ?auto_20981 ) ( CLEAR ?auto_20975 ) ( not ( = ?auto_20976 ?auto_20975 ) ) ( not ( = ?auto_20976 ?auto_20981 ) ) ( not ( = ?auto_20975 ?auto_20981 ) ) ( not ( = ?auto_20980 ?auto_20982 ) ) ( IS-CRATE ?auto_20976 ) ( not ( = ?auto_20987 ?auto_20979 ) ) ( HOIST-AT ?auto_20999 ?auto_20987 ) ( SURFACE-AT ?auto_20976 ?auto_20987 ) ( ON ?auto_20976 ?auto_21000 ) ( CLEAR ?auto_20976 ) ( not ( = ?auto_20977 ?auto_20976 ) ) ( not ( = ?auto_20977 ?auto_21000 ) ) ( not ( = ?auto_20976 ?auto_21000 ) ) ( not ( = ?auto_20980 ?auto_20999 ) ) ( IS-CRATE ?auto_20977 ) ( AVAILABLE ?auto_20982 ) ( SURFACE-AT ?auto_20977 ?auto_20978 ) ( ON ?auto_20977 ?auto_20991 ) ( CLEAR ?auto_20977 ) ( not ( = ?auto_20974 ?auto_20977 ) ) ( not ( = ?auto_20974 ?auto_20991 ) ) ( not ( = ?auto_20977 ?auto_20991 ) ) ( IS-CRATE ?auto_20974 ) ( SURFACE-AT ?auto_20974 ?auto_20987 ) ( ON ?auto_20974 ?auto_20996 ) ( CLEAR ?auto_20974 ) ( not ( = ?auto_20973 ?auto_20974 ) ) ( not ( = ?auto_20973 ?auto_20996 ) ) ( not ( = ?auto_20974 ?auto_20996 ) ) ( IS-CRATE ?auto_20973 ) ( not ( = ?auto_20990 ?auto_20979 ) ) ( HOIST-AT ?auto_20986 ?auto_20990 ) ( AVAILABLE ?auto_20986 ) ( SURFACE-AT ?auto_20973 ?auto_20990 ) ( ON ?auto_20973 ?auto_20985 ) ( CLEAR ?auto_20973 ) ( not ( = ?auto_20972 ?auto_20973 ) ) ( not ( = ?auto_20972 ?auto_20985 ) ) ( not ( = ?auto_20973 ?auto_20985 ) ) ( not ( = ?auto_20980 ?auto_20986 ) ) ( IS-CRATE ?auto_20972 ) ( not ( = ?auto_20995 ?auto_20979 ) ) ( HOIST-AT ?auto_20988 ?auto_20995 ) ( AVAILABLE ?auto_20988 ) ( SURFACE-AT ?auto_20972 ?auto_20995 ) ( ON ?auto_20972 ?auto_20984 ) ( CLEAR ?auto_20972 ) ( not ( = ?auto_20971 ?auto_20972 ) ) ( not ( = ?auto_20971 ?auto_20984 ) ) ( not ( = ?auto_20972 ?auto_20984 ) ) ( not ( = ?auto_20980 ?auto_20988 ) ) ( IS-CRATE ?auto_20971 ) ( not ( = ?auto_20997 ?auto_20979 ) ) ( HOIST-AT ?auto_20989 ?auto_20997 ) ( AVAILABLE ?auto_20989 ) ( SURFACE-AT ?auto_20971 ?auto_20997 ) ( ON ?auto_20971 ?auto_20993 ) ( CLEAR ?auto_20971 ) ( not ( = ?auto_20970 ?auto_20971 ) ) ( not ( = ?auto_20970 ?auto_20993 ) ) ( not ( = ?auto_20971 ?auto_20993 ) ) ( not ( = ?auto_20980 ?auto_20989 ) ) ( IS-CRATE ?auto_20970 ) ( not ( = ?auto_20998 ?auto_20979 ) ) ( HOIST-AT ?auto_21001 ?auto_20998 ) ( AVAILABLE ?auto_21001 ) ( SURFACE-AT ?auto_20970 ?auto_20998 ) ( ON ?auto_20970 ?auto_20992 ) ( CLEAR ?auto_20970 ) ( not ( = ?auto_20969 ?auto_20970 ) ) ( not ( = ?auto_20969 ?auto_20992 ) ) ( not ( = ?auto_20970 ?auto_20992 ) ) ( not ( = ?auto_20980 ?auto_21001 ) ) ( SURFACE-AT ?auto_20968 ?auto_20979 ) ( CLEAR ?auto_20968 ) ( IS-CRATE ?auto_20969 ) ( AVAILABLE ?auto_20980 ) ( AVAILABLE ?auto_20999 ) ( SURFACE-AT ?auto_20969 ?auto_20987 ) ( ON ?auto_20969 ?auto_20994 ) ( CLEAR ?auto_20969 ) ( TRUCK-AT ?auto_20983 ?auto_20979 ) ( not ( = ?auto_20968 ?auto_20969 ) ) ( not ( = ?auto_20968 ?auto_20994 ) ) ( not ( = ?auto_20969 ?auto_20994 ) ) ( not ( = ?auto_20968 ?auto_20970 ) ) ( not ( = ?auto_20968 ?auto_20992 ) ) ( not ( = ?auto_20970 ?auto_20994 ) ) ( not ( = ?auto_20998 ?auto_20987 ) ) ( not ( = ?auto_21001 ?auto_20999 ) ) ( not ( = ?auto_20992 ?auto_20994 ) ) ( not ( = ?auto_20968 ?auto_20971 ) ) ( not ( = ?auto_20968 ?auto_20993 ) ) ( not ( = ?auto_20969 ?auto_20971 ) ) ( not ( = ?auto_20969 ?auto_20993 ) ) ( not ( = ?auto_20971 ?auto_20992 ) ) ( not ( = ?auto_20971 ?auto_20994 ) ) ( not ( = ?auto_20997 ?auto_20998 ) ) ( not ( = ?auto_20997 ?auto_20987 ) ) ( not ( = ?auto_20989 ?auto_21001 ) ) ( not ( = ?auto_20989 ?auto_20999 ) ) ( not ( = ?auto_20993 ?auto_20992 ) ) ( not ( = ?auto_20993 ?auto_20994 ) ) ( not ( = ?auto_20968 ?auto_20972 ) ) ( not ( = ?auto_20968 ?auto_20984 ) ) ( not ( = ?auto_20969 ?auto_20972 ) ) ( not ( = ?auto_20969 ?auto_20984 ) ) ( not ( = ?auto_20970 ?auto_20972 ) ) ( not ( = ?auto_20970 ?auto_20984 ) ) ( not ( = ?auto_20972 ?auto_20993 ) ) ( not ( = ?auto_20972 ?auto_20992 ) ) ( not ( = ?auto_20972 ?auto_20994 ) ) ( not ( = ?auto_20995 ?auto_20997 ) ) ( not ( = ?auto_20995 ?auto_20998 ) ) ( not ( = ?auto_20995 ?auto_20987 ) ) ( not ( = ?auto_20988 ?auto_20989 ) ) ( not ( = ?auto_20988 ?auto_21001 ) ) ( not ( = ?auto_20988 ?auto_20999 ) ) ( not ( = ?auto_20984 ?auto_20993 ) ) ( not ( = ?auto_20984 ?auto_20992 ) ) ( not ( = ?auto_20984 ?auto_20994 ) ) ( not ( = ?auto_20968 ?auto_20973 ) ) ( not ( = ?auto_20968 ?auto_20985 ) ) ( not ( = ?auto_20969 ?auto_20973 ) ) ( not ( = ?auto_20969 ?auto_20985 ) ) ( not ( = ?auto_20970 ?auto_20973 ) ) ( not ( = ?auto_20970 ?auto_20985 ) ) ( not ( = ?auto_20971 ?auto_20973 ) ) ( not ( = ?auto_20971 ?auto_20985 ) ) ( not ( = ?auto_20973 ?auto_20984 ) ) ( not ( = ?auto_20973 ?auto_20993 ) ) ( not ( = ?auto_20973 ?auto_20992 ) ) ( not ( = ?auto_20973 ?auto_20994 ) ) ( not ( = ?auto_20990 ?auto_20995 ) ) ( not ( = ?auto_20990 ?auto_20997 ) ) ( not ( = ?auto_20990 ?auto_20998 ) ) ( not ( = ?auto_20990 ?auto_20987 ) ) ( not ( = ?auto_20986 ?auto_20988 ) ) ( not ( = ?auto_20986 ?auto_20989 ) ) ( not ( = ?auto_20986 ?auto_21001 ) ) ( not ( = ?auto_20986 ?auto_20999 ) ) ( not ( = ?auto_20985 ?auto_20984 ) ) ( not ( = ?auto_20985 ?auto_20993 ) ) ( not ( = ?auto_20985 ?auto_20992 ) ) ( not ( = ?auto_20985 ?auto_20994 ) ) ( not ( = ?auto_20968 ?auto_20974 ) ) ( not ( = ?auto_20968 ?auto_20996 ) ) ( not ( = ?auto_20969 ?auto_20974 ) ) ( not ( = ?auto_20969 ?auto_20996 ) ) ( not ( = ?auto_20970 ?auto_20974 ) ) ( not ( = ?auto_20970 ?auto_20996 ) ) ( not ( = ?auto_20971 ?auto_20974 ) ) ( not ( = ?auto_20971 ?auto_20996 ) ) ( not ( = ?auto_20972 ?auto_20974 ) ) ( not ( = ?auto_20972 ?auto_20996 ) ) ( not ( = ?auto_20974 ?auto_20985 ) ) ( not ( = ?auto_20974 ?auto_20984 ) ) ( not ( = ?auto_20974 ?auto_20993 ) ) ( not ( = ?auto_20974 ?auto_20992 ) ) ( not ( = ?auto_20974 ?auto_20994 ) ) ( not ( = ?auto_20996 ?auto_20985 ) ) ( not ( = ?auto_20996 ?auto_20984 ) ) ( not ( = ?auto_20996 ?auto_20993 ) ) ( not ( = ?auto_20996 ?auto_20992 ) ) ( not ( = ?auto_20996 ?auto_20994 ) ) ( not ( = ?auto_20968 ?auto_20977 ) ) ( not ( = ?auto_20968 ?auto_20991 ) ) ( not ( = ?auto_20969 ?auto_20977 ) ) ( not ( = ?auto_20969 ?auto_20991 ) ) ( not ( = ?auto_20970 ?auto_20977 ) ) ( not ( = ?auto_20970 ?auto_20991 ) ) ( not ( = ?auto_20971 ?auto_20977 ) ) ( not ( = ?auto_20971 ?auto_20991 ) ) ( not ( = ?auto_20972 ?auto_20977 ) ) ( not ( = ?auto_20972 ?auto_20991 ) ) ( not ( = ?auto_20973 ?auto_20977 ) ) ( not ( = ?auto_20973 ?auto_20991 ) ) ( not ( = ?auto_20977 ?auto_20996 ) ) ( not ( = ?auto_20977 ?auto_20985 ) ) ( not ( = ?auto_20977 ?auto_20984 ) ) ( not ( = ?auto_20977 ?auto_20993 ) ) ( not ( = ?auto_20977 ?auto_20992 ) ) ( not ( = ?auto_20977 ?auto_20994 ) ) ( not ( = ?auto_20978 ?auto_20987 ) ) ( not ( = ?auto_20978 ?auto_20990 ) ) ( not ( = ?auto_20978 ?auto_20995 ) ) ( not ( = ?auto_20978 ?auto_20997 ) ) ( not ( = ?auto_20978 ?auto_20998 ) ) ( not ( = ?auto_20982 ?auto_20999 ) ) ( not ( = ?auto_20982 ?auto_20986 ) ) ( not ( = ?auto_20982 ?auto_20988 ) ) ( not ( = ?auto_20982 ?auto_20989 ) ) ( not ( = ?auto_20982 ?auto_21001 ) ) ( not ( = ?auto_20991 ?auto_20996 ) ) ( not ( = ?auto_20991 ?auto_20985 ) ) ( not ( = ?auto_20991 ?auto_20984 ) ) ( not ( = ?auto_20991 ?auto_20993 ) ) ( not ( = ?auto_20991 ?auto_20992 ) ) ( not ( = ?auto_20991 ?auto_20994 ) ) ( not ( = ?auto_20968 ?auto_20976 ) ) ( not ( = ?auto_20968 ?auto_21000 ) ) ( not ( = ?auto_20969 ?auto_20976 ) ) ( not ( = ?auto_20969 ?auto_21000 ) ) ( not ( = ?auto_20970 ?auto_20976 ) ) ( not ( = ?auto_20970 ?auto_21000 ) ) ( not ( = ?auto_20971 ?auto_20976 ) ) ( not ( = ?auto_20971 ?auto_21000 ) ) ( not ( = ?auto_20972 ?auto_20976 ) ) ( not ( = ?auto_20972 ?auto_21000 ) ) ( not ( = ?auto_20973 ?auto_20976 ) ) ( not ( = ?auto_20973 ?auto_21000 ) ) ( not ( = ?auto_20974 ?auto_20976 ) ) ( not ( = ?auto_20974 ?auto_21000 ) ) ( not ( = ?auto_20976 ?auto_20991 ) ) ( not ( = ?auto_20976 ?auto_20996 ) ) ( not ( = ?auto_20976 ?auto_20985 ) ) ( not ( = ?auto_20976 ?auto_20984 ) ) ( not ( = ?auto_20976 ?auto_20993 ) ) ( not ( = ?auto_20976 ?auto_20992 ) ) ( not ( = ?auto_20976 ?auto_20994 ) ) ( not ( = ?auto_21000 ?auto_20991 ) ) ( not ( = ?auto_21000 ?auto_20996 ) ) ( not ( = ?auto_21000 ?auto_20985 ) ) ( not ( = ?auto_21000 ?auto_20984 ) ) ( not ( = ?auto_21000 ?auto_20993 ) ) ( not ( = ?auto_21000 ?auto_20992 ) ) ( not ( = ?auto_21000 ?auto_20994 ) ) ( not ( = ?auto_20968 ?auto_20975 ) ) ( not ( = ?auto_20968 ?auto_20981 ) ) ( not ( = ?auto_20969 ?auto_20975 ) ) ( not ( = ?auto_20969 ?auto_20981 ) ) ( not ( = ?auto_20970 ?auto_20975 ) ) ( not ( = ?auto_20970 ?auto_20981 ) ) ( not ( = ?auto_20971 ?auto_20975 ) ) ( not ( = ?auto_20971 ?auto_20981 ) ) ( not ( = ?auto_20972 ?auto_20975 ) ) ( not ( = ?auto_20972 ?auto_20981 ) ) ( not ( = ?auto_20973 ?auto_20975 ) ) ( not ( = ?auto_20973 ?auto_20981 ) ) ( not ( = ?auto_20974 ?auto_20975 ) ) ( not ( = ?auto_20974 ?auto_20981 ) ) ( not ( = ?auto_20977 ?auto_20975 ) ) ( not ( = ?auto_20977 ?auto_20981 ) ) ( not ( = ?auto_20975 ?auto_21000 ) ) ( not ( = ?auto_20975 ?auto_20991 ) ) ( not ( = ?auto_20975 ?auto_20996 ) ) ( not ( = ?auto_20975 ?auto_20985 ) ) ( not ( = ?auto_20975 ?auto_20984 ) ) ( not ( = ?auto_20975 ?auto_20993 ) ) ( not ( = ?auto_20975 ?auto_20992 ) ) ( not ( = ?auto_20975 ?auto_20994 ) ) ( not ( = ?auto_20981 ?auto_21000 ) ) ( not ( = ?auto_20981 ?auto_20991 ) ) ( not ( = ?auto_20981 ?auto_20996 ) ) ( not ( = ?auto_20981 ?auto_20985 ) ) ( not ( = ?auto_20981 ?auto_20984 ) ) ( not ( = ?auto_20981 ?auto_20993 ) ) ( not ( = ?auto_20981 ?auto_20992 ) ) ( not ( = ?auto_20981 ?auto_20994 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_20968 ?auto_20969 ?auto_20970 ?auto_20971 ?auto_20972 ?auto_20973 ?auto_20974 ?auto_20977 ?auto_20976 )
      ( MAKE-1CRATE ?auto_20976 ?auto_20975 )
      ( MAKE-9CRATE-VERIFY ?auto_20968 ?auto_20969 ?auto_20970 ?auto_20971 ?auto_20972 ?auto_20973 ?auto_20974 ?auto_20977 ?auto_20976 ?auto_20975 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21004 - SURFACE
      ?auto_21005 - SURFACE
    )
    :vars
    (
      ?auto_21006 - HOIST
      ?auto_21007 - PLACE
      ?auto_21009 - PLACE
      ?auto_21010 - HOIST
      ?auto_21011 - SURFACE
      ?auto_21008 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21006 ?auto_21007 ) ( SURFACE-AT ?auto_21004 ?auto_21007 ) ( CLEAR ?auto_21004 ) ( IS-CRATE ?auto_21005 ) ( AVAILABLE ?auto_21006 ) ( not ( = ?auto_21009 ?auto_21007 ) ) ( HOIST-AT ?auto_21010 ?auto_21009 ) ( AVAILABLE ?auto_21010 ) ( SURFACE-AT ?auto_21005 ?auto_21009 ) ( ON ?auto_21005 ?auto_21011 ) ( CLEAR ?auto_21005 ) ( TRUCK-AT ?auto_21008 ?auto_21007 ) ( not ( = ?auto_21004 ?auto_21005 ) ) ( not ( = ?auto_21004 ?auto_21011 ) ) ( not ( = ?auto_21005 ?auto_21011 ) ) ( not ( = ?auto_21006 ?auto_21010 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21008 ?auto_21007 ?auto_21009 )
      ( !LIFT ?auto_21010 ?auto_21005 ?auto_21011 ?auto_21009 )
      ( !LOAD ?auto_21010 ?auto_21005 ?auto_21008 ?auto_21009 )
      ( !DRIVE ?auto_21008 ?auto_21009 ?auto_21007 )
      ( !UNLOAD ?auto_21006 ?auto_21005 ?auto_21008 ?auto_21007 )
      ( !DROP ?auto_21006 ?auto_21005 ?auto_21004 ?auto_21007 )
      ( MAKE-1CRATE-VERIFY ?auto_21004 ?auto_21005 ) )
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
      ?auto_21032 - SURFACE
      ?auto_21031 - SURFACE
      ?auto_21030 - SURFACE
      ?auto_21033 - SURFACE
    )
    :vars
    (
      ?auto_21039 - HOIST
      ?auto_21035 - PLACE
      ?auto_21038 - PLACE
      ?auto_21034 - HOIST
      ?auto_21037 - SURFACE
      ?auto_21041 - PLACE
      ?auto_21052 - HOIST
      ?auto_21050 - SURFACE
      ?auto_21058 - PLACE
      ?auto_21046 - HOIST
      ?auto_21053 - SURFACE
      ?auto_21044 - SURFACE
      ?auto_21047 - SURFACE
      ?auto_21056 - PLACE
      ?auto_21054 - HOIST
      ?auto_21049 - SURFACE
      ?auto_21045 - PLACE
      ?auto_21040 - HOIST
      ?auto_21048 - SURFACE
      ?auto_21043 - SURFACE
      ?auto_21051 - PLACE
      ?auto_21057 - HOIST
      ?auto_21042 - SURFACE
      ?auto_21055 - SURFACE
      ?auto_21036 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21039 ?auto_21035 ) ( IS-CRATE ?auto_21033 ) ( not ( = ?auto_21038 ?auto_21035 ) ) ( HOIST-AT ?auto_21034 ?auto_21038 ) ( SURFACE-AT ?auto_21033 ?auto_21038 ) ( ON ?auto_21033 ?auto_21037 ) ( CLEAR ?auto_21033 ) ( not ( = ?auto_21030 ?auto_21033 ) ) ( not ( = ?auto_21030 ?auto_21037 ) ) ( not ( = ?auto_21033 ?auto_21037 ) ) ( not ( = ?auto_21039 ?auto_21034 ) ) ( IS-CRATE ?auto_21030 ) ( not ( = ?auto_21041 ?auto_21035 ) ) ( HOIST-AT ?auto_21052 ?auto_21041 ) ( SURFACE-AT ?auto_21030 ?auto_21041 ) ( ON ?auto_21030 ?auto_21050 ) ( CLEAR ?auto_21030 ) ( not ( = ?auto_21031 ?auto_21030 ) ) ( not ( = ?auto_21031 ?auto_21050 ) ) ( not ( = ?auto_21030 ?auto_21050 ) ) ( not ( = ?auto_21039 ?auto_21052 ) ) ( IS-CRATE ?auto_21031 ) ( not ( = ?auto_21058 ?auto_21035 ) ) ( HOIST-AT ?auto_21046 ?auto_21058 ) ( SURFACE-AT ?auto_21031 ?auto_21058 ) ( ON ?auto_21031 ?auto_21053 ) ( CLEAR ?auto_21031 ) ( not ( = ?auto_21032 ?auto_21031 ) ) ( not ( = ?auto_21032 ?auto_21053 ) ) ( not ( = ?auto_21031 ?auto_21053 ) ) ( not ( = ?auto_21039 ?auto_21046 ) ) ( IS-CRATE ?auto_21032 ) ( AVAILABLE ?auto_21052 ) ( SURFACE-AT ?auto_21032 ?auto_21041 ) ( ON ?auto_21032 ?auto_21044 ) ( CLEAR ?auto_21032 ) ( not ( = ?auto_21029 ?auto_21032 ) ) ( not ( = ?auto_21029 ?auto_21044 ) ) ( not ( = ?auto_21032 ?auto_21044 ) ) ( IS-CRATE ?auto_21029 ) ( SURFACE-AT ?auto_21029 ?auto_21058 ) ( ON ?auto_21029 ?auto_21047 ) ( CLEAR ?auto_21029 ) ( not ( = ?auto_21028 ?auto_21029 ) ) ( not ( = ?auto_21028 ?auto_21047 ) ) ( not ( = ?auto_21029 ?auto_21047 ) ) ( IS-CRATE ?auto_21028 ) ( not ( = ?auto_21056 ?auto_21035 ) ) ( HOIST-AT ?auto_21054 ?auto_21056 ) ( AVAILABLE ?auto_21054 ) ( SURFACE-AT ?auto_21028 ?auto_21056 ) ( ON ?auto_21028 ?auto_21049 ) ( CLEAR ?auto_21028 ) ( not ( = ?auto_21027 ?auto_21028 ) ) ( not ( = ?auto_21027 ?auto_21049 ) ) ( not ( = ?auto_21028 ?auto_21049 ) ) ( not ( = ?auto_21039 ?auto_21054 ) ) ( IS-CRATE ?auto_21027 ) ( not ( = ?auto_21045 ?auto_21035 ) ) ( HOIST-AT ?auto_21040 ?auto_21045 ) ( AVAILABLE ?auto_21040 ) ( SURFACE-AT ?auto_21027 ?auto_21045 ) ( ON ?auto_21027 ?auto_21048 ) ( CLEAR ?auto_21027 ) ( not ( = ?auto_21026 ?auto_21027 ) ) ( not ( = ?auto_21026 ?auto_21048 ) ) ( not ( = ?auto_21027 ?auto_21048 ) ) ( not ( = ?auto_21039 ?auto_21040 ) ) ( IS-CRATE ?auto_21026 ) ( AVAILABLE ?auto_21034 ) ( SURFACE-AT ?auto_21026 ?auto_21038 ) ( ON ?auto_21026 ?auto_21043 ) ( CLEAR ?auto_21026 ) ( not ( = ?auto_21025 ?auto_21026 ) ) ( not ( = ?auto_21025 ?auto_21043 ) ) ( not ( = ?auto_21026 ?auto_21043 ) ) ( IS-CRATE ?auto_21025 ) ( not ( = ?auto_21051 ?auto_21035 ) ) ( HOIST-AT ?auto_21057 ?auto_21051 ) ( AVAILABLE ?auto_21057 ) ( SURFACE-AT ?auto_21025 ?auto_21051 ) ( ON ?auto_21025 ?auto_21042 ) ( CLEAR ?auto_21025 ) ( not ( = ?auto_21024 ?auto_21025 ) ) ( not ( = ?auto_21024 ?auto_21042 ) ) ( not ( = ?auto_21025 ?auto_21042 ) ) ( not ( = ?auto_21039 ?auto_21057 ) ) ( SURFACE-AT ?auto_21023 ?auto_21035 ) ( CLEAR ?auto_21023 ) ( IS-CRATE ?auto_21024 ) ( AVAILABLE ?auto_21039 ) ( AVAILABLE ?auto_21046 ) ( SURFACE-AT ?auto_21024 ?auto_21058 ) ( ON ?auto_21024 ?auto_21055 ) ( CLEAR ?auto_21024 ) ( TRUCK-AT ?auto_21036 ?auto_21035 ) ( not ( = ?auto_21023 ?auto_21024 ) ) ( not ( = ?auto_21023 ?auto_21055 ) ) ( not ( = ?auto_21024 ?auto_21055 ) ) ( not ( = ?auto_21023 ?auto_21025 ) ) ( not ( = ?auto_21023 ?auto_21042 ) ) ( not ( = ?auto_21025 ?auto_21055 ) ) ( not ( = ?auto_21051 ?auto_21058 ) ) ( not ( = ?auto_21057 ?auto_21046 ) ) ( not ( = ?auto_21042 ?auto_21055 ) ) ( not ( = ?auto_21023 ?auto_21026 ) ) ( not ( = ?auto_21023 ?auto_21043 ) ) ( not ( = ?auto_21024 ?auto_21026 ) ) ( not ( = ?auto_21024 ?auto_21043 ) ) ( not ( = ?auto_21026 ?auto_21042 ) ) ( not ( = ?auto_21026 ?auto_21055 ) ) ( not ( = ?auto_21038 ?auto_21051 ) ) ( not ( = ?auto_21038 ?auto_21058 ) ) ( not ( = ?auto_21034 ?auto_21057 ) ) ( not ( = ?auto_21034 ?auto_21046 ) ) ( not ( = ?auto_21043 ?auto_21042 ) ) ( not ( = ?auto_21043 ?auto_21055 ) ) ( not ( = ?auto_21023 ?auto_21027 ) ) ( not ( = ?auto_21023 ?auto_21048 ) ) ( not ( = ?auto_21024 ?auto_21027 ) ) ( not ( = ?auto_21024 ?auto_21048 ) ) ( not ( = ?auto_21025 ?auto_21027 ) ) ( not ( = ?auto_21025 ?auto_21048 ) ) ( not ( = ?auto_21027 ?auto_21043 ) ) ( not ( = ?auto_21027 ?auto_21042 ) ) ( not ( = ?auto_21027 ?auto_21055 ) ) ( not ( = ?auto_21045 ?auto_21038 ) ) ( not ( = ?auto_21045 ?auto_21051 ) ) ( not ( = ?auto_21045 ?auto_21058 ) ) ( not ( = ?auto_21040 ?auto_21034 ) ) ( not ( = ?auto_21040 ?auto_21057 ) ) ( not ( = ?auto_21040 ?auto_21046 ) ) ( not ( = ?auto_21048 ?auto_21043 ) ) ( not ( = ?auto_21048 ?auto_21042 ) ) ( not ( = ?auto_21048 ?auto_21055 ) ) ( not ( = ?auto_21023 ?auto_21028 ) ) ( not ( = ?auto_21023 ?auto_21049 ) ) ( not ( = ?auto_21024 ?auto_21028 ) ) ( not ( = ?auto_21024 ?auto_21049 ) ) ( not ( = ?auto_21025 ?auto_21028 ) ) ( not ( = ?auto_21025 ?auto_21049 ) ) ( not ( = ?auto_21026 ?auto_21028 ) ) ( not ( = ?auto_21026 ?auto_21049 ) ) ( not ( = ?auto_21028 ?auto_21048 ) ) ( not ( = ?auto_21028 ?auto_21043 ) ) ( not ( = ?auto_21028 ?auto_21042 ) ) ( not ( = ?auto_21028 ?auto_21055 ) ) ( not ( = ?auto_21056 ?auto_21045 ) ) ( not ( = ?auto_21056 ?auto_21038 ) ) ( not ( = ?auto_21056 ?auto_21051 ) ) ( not ( = ?auto_21056 ?auto_21058 ) ) ( not ( = ?auto_21054 ?auto_21040 ) ) ( not ( = ?auto_21054 ?auto_21034 ) ) ( not ( = ?auto_21054 ?auto_21057 ) ) ( not ( = ?auto_21054 ?auto_21046 ) ) ( not ( = ?auto_21049 ?auto_21048 ) ) ( not ( = ?auto_21049 ?auto_21043 ) ) ( not ( = ?auto_21049 ?auto_21042 ) ) ( not ( = ?auto_21049 ?auto_21055 ) ) ( not ( = ?auto_21023 ?auto_21029 ) ) ( not ( = ?auto_21023 ?auto_21047 ) ) ( not ( = ?auto_21024 ?auto_21029 ) ) ( not ( = ?auto_21024 ?auto_21047 ) ) ( not ( = ?auto_21025 ?auto_21029 ) ) ( not ( = ?auto_21025 ?auto_21047 ) ) ( not ( = ?auto_21026 ?auto_21029 ) ) ( not ( = ?auto_21026 ?auto_21047 ) ) ( not ( = ?auto_21027 ?auto_21029 ) ) ( not ( = ?auto_21027 ?auto_21047 ) ) ( not ( = ?auto_21029 ?auto_21049 ) ) ( not ( = ?auto_21029 ?auto_21048 ) ) ( not ( = ?auto_21029 ?auto_21043 ) ) ( not ( = ?auto_21029 ?auto_21042 ) ) ( not ( = ?auto_21029 ?auto_21055 ) ) ( not ( = ?auto_21047 ?auto_21049 ) ) ( not ( = ?auto_21047 ?auto_21048 ) ) ( not ( = ?auto_21047 ?auto_21043 ) ) ( not ( = ?auto_21047 ?auto_21042 ) ) ( not ( = ?auto_21047 ?auto_21055 ) ) ( not ( = ?auto_21023 ?auto_21032 ) ) ( not ( = ?auto_21023 ?auto_21044 ) ) ( not ( = ?auto_21024 ?auto_21032 ) ) ( not ( = ?auto_21024 ?auto_21044 ) ) ( not ( = ?auto_21025 ?auto_21032 ) ) ( not ( = ?auto_21025 ?auto_21044 ) ) ( not ( = ?auto_21026 ?auto_21032 ) ) ( not ( = ?auto_21026 ?auto_21044 ) ) ( not ( = ?auto_21027 ?auto_21032 ) ) ( not ( = ?auto_21027 ?auto_21044 ) ) ( not ( = ?auto_21028 ?auto_21032 ) ) ( not ( = ?auto_21028 ?auto_21044 ) ) ( not ( = ?auto_21032 ?auto_21047 ) ) ( not ( = ?auto_21032 ?auto_21049 ) ) ( not ( = ?auto_21032 ?auto_21048 ) ) ( not ( = ?auto_21032 ?auto_21043 ) ) ( not ( = ?auto_21032 ?auto_21042 ) ) ( not ( = ?auto_21032 ?auto_21055 ) ) ( not ( = ?auto_21041 ?auto_21058 ) ) ( not ( = ?auto_21041 ?auto_21056 ) ) ( not ( = ?auto_21041 ?auto_21045 ) ) ( not ( = ?auto_21041 ?auto_21038 ) ) ( not ( = ?auto_21041 ?auto_21051 ) ) ( not ( = ?auto_21052 ?auto_21046 ) ) ( not ( = ?auto_21052 ?auto_21054 ) ) ( not ( = ?auto_21052 ?auto_21040 ) ) ( not ( = ?auto_21052 ?auto_21034 ) ) ( not ( = ?auto_21052 ?auto_21057 ) ) ( not ( = ?auto_21044 ?auto_21047 ) ) ( not ( = ?auto_21044 ?auto_21049 ) ) ( not ( = ?auto_21044 ?auto_21048 ) ) ( not ( = ?auto_21044 ?auto_21043 ) ) ( not ( = ?auto_21044 ?auto_21042 ) ) ( not ( = ?auto_21044 ?auto_21055 ) ) ( not ( = ?auto_21023 ?auto_21031 ) ) ( not ( = ?auto_21023 ?auto_21053 ) ) ( not ( = ?auto_21024 ?auto_21031 ) ) ( not ( = ?auto_21024 ?auto_21053 ) ) ( not ( = ?auto_21025 ?auto_21031 ) ) ( not ( = ?auto_21025 ?auto_21053 ) ) ( not ( = ?auto_21026 ?auto_21031 ) ) ( not ( = ?auto_21026 ?auto_21053 ) ) ( not ( = ?auto_21027 ?auto_21031 ) ) ( not ( = ?auto_21027 ?auto_21053 ) ) ( not ( = ?auto_21028 ?auto_21031 ) ) ( not ( = ?auto_21028 ?auto_21053 ) ) ( not ( = ?auto_21029 ?auto_21031 ) ) ( not ( = ?auto_21029 ?auto_21053 ) ) ( not ( = ?auto_21031 ?auto_21044 ) ) ( not ( = ?auto_21031 ?auto_21047 ) ) ( not ( = ?auto_21031 ?auto_21049 ) ) ( not ( = ?auto_21031 ?auto_21048 ) ) ( not ( = ?auto_21031 ?auto_21043 ) ) ( not ( = ?auto_21031 ?auto_21042 ) ) ( not ( = ?auto_21031 ?auto_21055 ) ) ( not ( = ?auto_21053 ?auto_21044 ) ) ( not ( = ?auto_21053 ?auto_21047 ) ) ( not ( = ?auto_21053 ?auto_21049 ) ) ( not ( = ?auto_21053 ?auto_21048 ) ) ( not ( = ?auto_21053 ?auto_21043 ) ) ( not ( = ?auto_21053 ?auto_21042 ) ) ( not ( = ?auto_21053 ?auto_21055 ) ) ( not ( = ?auto_21023 ?auto_21030 ) ) ( not ( = ?auto_21023 ?auto_21050 ) ) ( not ( = ?auto_21024 ?auto_21030 ) ) ( not ( = ?auto_21024 ?auto_21050 ) ) ( not ( = ?auto_21025 ?auto_21030 ) ) ( not ( = ?auto_21025 ?auto_21050 ) ) ( not ( = ?auto_21026 ?auto_21030 ) ) ( not ( = ?auto_21026 ?auto_21050 ) ) ( not ( = ?auto_21027 ?auto_21030 ) ) ( not ( = ?auto_21027 ?auto_21050 ) ) ( not ( = ?auto_21028 ?auto_21030 ) ) ( not ( = ?auto_21028 ?auto_21050 ) ) ( not ( = ?auto_21029 ?auto_21030 ) ) ( not ( = ?auto_21029 ?auto_21050 ) ) ( not ( = ?auto_21032 ?auto_21030 ) ) ( not ( = ?auto_21032 ?auto_21050 ) ) ( not ( = ?auto_21030 ?auto_21053 ) ) ( not ( = ?auto_21030 ?auto_21044 ) ) ( not ( = ?auto_21030 ?auto_21047 ) ) ( not ( = ?auto_21030 ?auto_21049 ) ) ( not ( = ?auto_21030 ?auto_21048 ) ) ( not ( = ?auto_21030 ?auto_21043 ) ) ( not ( = ?auto_21030 ?auto_21042 ) ) ( not ( = ?auto_21030 ?auto_21055 ) ) ( not ( = ?auto_21050 ?auto_21053 ) ) ( not ( = ?auto_21050 ?auto_21044 ) ) ( not ( = ?auto_21050 ?auto_21047 ) ) ( not ( = ?auto_21050 ?auto_21049 ) ) ( not ( = ?auto_21050 ?auto_21048 ) ) ( not ( = ?auto_21050 ?auto_21043 ) ) ( not ( = ?auto_21050 ?auto_21042 ) ) ( not ( = ?auto_21050 ?auto_21055 ) ) ( not ( = ?auto_21023 ?auto_21033 ) ) ( not ( = ?auto_21023 ?auto_21037 ) ) ( not ( = ?auto_21024 ?auto_21033 ) ) ( not ( = ?auto_21024 ?auto_21037 ) ) ( not ( = ?auto_21025 ?auto_21033 ) ) ( not ( = ?auto_21025 ?auto_21037 ) ) ( not ( = ?auto_21026 ?auto_21033 ) ) ( not ( = ?auto_21026 ?auto_21037 ) ) ( not ( = ?auto_21027 ?auto_21033 ) ) ( not ( = ?auto_21027 ?auto_21037 ) ) ( not ( = ?auto_21028 ?auto_21033 ) ) ( not ( = ?auto_21028 ?auto_21037 ) ) ( not ( = ?auto_21029 ?auto_21033 ) ) ( not ( = ?auto_21029 ?auto_21037 ) ) ( not ( = ?auto_21032 ?auto_21033 ) ) ( not ( = ?auto_21032 ?auto_21037 ) ) ( not ( = ?auto_21031 ?auto_21033 ) ) ( not ( = ?auto_21031 ?auto_21037 ) ) ( not ( = ?auto_21033 ?auto_21050 ) ) ( not ( = ?auto_21033 ?auto_21053 ) ) ( not ( = ?auto_21033 ?auto_21044 ) ) ( not ( = ?auto_21033 ?auto_21047 ) ) ( not ( = ?auto_21033 ?auto_21049 ) ) ( not ( = ?auto_21033 ?auto_21048 ) ) ( not ( = ?auto_21033 ?auto_21043 ) ) ( not ( = ?auto_21033 ?auto_21042 ) ) ( not ( = ?auto_21033 ?auto_21055 ) ) ( not ( = ?auto_21037 ?auto_21050 ) ) ( not ( = ?auto_21037 ?auto_21053 ) ) ( not ( = ?auto_21037 ?auto_21044 ) ) ( not ( = ?auto_21037 ?auto_21047 ) ) ( not ( = ?auto_21037 ?auto_21049 ) ) ( not ( = ?auto_21037 ?auto_21048 ) ) ( not ( = ?auto_21037 ?auto_21043 ) ) ( not ( = ?auto_21037 ?auto_21042 ) ) ( not ( = ?auto_21037 ?auto_21055 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_21023 ?auto_21024 ?auto_21025 ?auto_21026 ?auto_21027 ?auto_21028 ?auto_21029 ?auto_21032 ?auto_21031 ?auto_21030 )
      ( MAKE-1CRATE ?auto_21030 ?auto_21033 )
      ( MAKE-10CRATE-VERIFY ?auto_21023 ?auto_21024 ?auto_21025 ?auto_21026 ?auto_21027 ?auto_21028 ?auto_21029 ?auto_21032 ?auto_21031 ?auto_21030 ?auto_21033 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21061 - SURFACE
      ?auto_21062 - SURFACE
    )
    :vars
    (
      ?auto_21063 - HOIST
      ?auto_21064 - PLACE
      ?auto_21066 - PLACE
      ?auto_21067 - HOIST
      ?auto_21068 - SURFACE
      ?auto_21065 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21063 ?auto_21064 ) ( SURFACE-AT ?auto_21061 ?auto_21064 ) ( CLEAR ?auto_21061 ) ( IS-CRATE ?auto_21062 ) ( AVAILABLE ?auto_21063 ) ( not ( = ?auto_21066 ?auto_21064 ) ) ( HOIST-AT ?auto_21067 ?auto_21066 ) ( AVAILABLE ?auto_21067 ) ( SURFACE-AT ?auto_21062 ?auto_21066 ) ( ON ?auto_21062 ?auto_21068 ) ( CLEAR ?auto_21062 ) ( TRUCK-AT ?auto_21065 ?auto_21064 ) ( not ( = ?auto_21061 ?auto_21062 ) ) ( not ( = ?auto_21061 ?auto_21068 ) ) ( not ( = ?auto_21062 ?auto_21068 ) ) ( not ( = ?auto_21063 ?auto_21067 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21065 ?auto_21064 ?auto_21066 )
      ( !LIFT ?auto_21067 ?auto_21062 ?auto_21068 ?auto_21066 )
      ( !LOAD ?auto_21067 ?auto_21062 ?auto_21065 ?auto_21066 )
      ( !DRIVE ?auto_21065 ?auto_21066 ?auto_21064 )
      ( !UNLOAD ?auto_21063 ?auto_21062 ?auto_21065 ?auto_21064 )
      ( !DROP ?auto_21063 ?auto_21062 ?auto_21061 ?auto_21064 )
      ( MAKE-1CRATE-VERIFY ?auto_21061 ?auto_21062 ) )
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
      ?auto_21090 - SURFACE
      ?auto_21089 - SURFACE
      ?auto_21088 - SURFACE
      ?auto_21091 - SURFACE
      ?auto_21092 - SURFACE
    )
    :vars
    (
      ?auto_21093 - HOIST
      ?auto_21096 - PLACE
      ?auto_21097 - PLACE
      ?auto_21098 - HOIST
      ?auto_21094 - SURFACE
      ?auto_21104 - PLACE
      ?auto_21102 - HOIST
      ?auto_21116 - SURFACE
      ?auto_21099 - SURFACE
      ?auto_21108 - PLACE
      ?auto_21100 - HOIST
      ?auto_21101 - SURFACE
      ?auto_21114 - SURFACE
      ?auto_21115 - SURFACE
      ?auto_21110 - PLACE
      ?auto_21118 - HOIST
      ?auto_21105 - SURFACE
      ?auto_21106 - PLACE
      ?auto_21107 - HOIST
      ?auto_21117 - SURFACE
      ?auto_21109 - SURFACE
      ?auto_21112 - PLACE
      ?auto_21113 - HOIST
      ?auto_21111 - SURFACE
      ?auto_21103 - SURFACE
      ?auto_21095 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21093 ?auto_21096 ) ( IS-CRATE ?auto_21092 ) ( not ( = ?auto_21097 ?auto_21096 ) ) ( HOIST-AT ?auto_21098 ?auto_21097 ) ( SURFACE-AT ?auto_21092 ?auto_21097 ) ( ON ?auto_21092 ?auto_21094 ) ( CLEAR ?auto_21092 ) ( not ( = ?auto_21091 ?auto_21092 ) ) ( not ( = ?auto_21091 ?auto_21094 ) ) ( not ( = ?auto_21092 ?auto_21094 ) ) ( not ( = ?auto_21093 ?auto_21098 ) ) ( IS-CRATE ?auto_21091 ) ( not ( = ?auto_21104 ?auto_21096 ) ) ( HOIST-AT ?auto_21102 ?auto_21104 ) ( SURFACE-AT ?auto_21091 ?auto_21104 ) ( ON ?auto_21091 ?auto_21116 ) ( CLEAR ?auto_21091 ) ( not ( = ?auto_21088 ?auto_21091 ) ) ( not ( = ?auto_21088 ?auto_21116 ) ) ( not ( = ?auto_21091 ?auto_21116 ) ) ( not ( = ?auto_21093 ?auto_21102 ) ) ( IS-CRATE ?auto_21088 ) ( SURFACE-AT ?auto_21088 ?auto_21097 ) ( ON ?auto_21088 ?auto_21099 ) ( CLEAR ?auto_21088 ) ( not ( = ?auto_21089 ?auto_21088 ) ) ( not ( = ?auto_21089 ?auto_21099 ) ) ( not ( = ?auto_21088 ?auto_21099 ) ) ( IS-CRATE ?auto_21089 ) ( not ( = ?auto_21108 ?auto_21096 ) ) ( HOIST-AT ?auto_21100 ?auto_21108 ) ( SURFACE-AT ?auto_21089 ?auto_21108 ) ( ON ?auto_21089 ?auto_21101 ) ( CLEAR ?auto_21089 ) ( not ( = ?auto_21090 ?auto_21089 ) ) ( not ( = ?auto_21090 ?auto_21101 ) ) ( not ( = ?auto_21089 ?auto_21101 ) ) ( not ( = ?auto_21093 ?auto_21100 ) ) ( IS-CRATE ?auto_21090 ) ( AVAILABLE ?auto_21098 ) ( SURFACE-AT ?auto_21090 ?auto_21097 ) ( ON ?auto_21090 ?auto_21114 ) ( CLEAR ?auto_21090 ) ( not ( = ?auto_21087 ?auto_21090 ) ) ( not ( = ?auto_21087 ?auto_21114 ) ) ( not ( = ?auto_21090 ?auto_21114 ) ) ( IS-CRATE ?auto_21087 ) ( SURFACE-AT ?auto_21087 ?auto_21108 ) ( ON ?auto_21087 ?auto_21115 ) ( CLEAR ?auto_21087 ) ( not ( = ?auto_21086 ?auto_21087 ) ) ( not ( = ?auto_21086 ?auto_21115 ) ) ( not ( = ?auto_21087 ?auto_21115 ) ) ( IS-CRATE ?auto_21086 ) ( not ( = ?auto_21110 ?auto_21096 ) ) ( HOIST-AT ?auto_21118 ?auto_21110 ) ( AVAILABLE ?auto_21118 ) ( SURFACE-AT ?auto_21086 ?auto_21110 ) ( ON ?auto_21086 ?auto_21105 ) ( CLEAR ?auto_21086 ) ( not ( = ?auto_21085 ?auto_21086 ) ) ( not ( = ?auto_21085 ?auto_21105 ) ) ( not ( = ?auto_21086 ?auto_21105 ) ) ( not ( = ?auto_21093 ?auto_21118 ) ) ( IS-CRATE ?auto_21085 ) ( not ( = ?auto_21106 ?auto_21096 ) ) ( HOIST-AT ?auto_21107 ?auto_21106 ) ( AVAILABLE ?auto_21107 ) ( SURFACE-AT ?auto_21085 ?auto_21106 ) ( ON ?auto_21085 ?auto_21117 ) ( CLEAR ?auto_21085 ) ( not ( = ?auto_21084 ?auto_21085 ) ) ( not ( = ?auto_21084 ?auto_21117 ) ) ( not ( = ?auto_21085 ?auto_21117 ) ) ( not ( = ?auto_21093 ?auto_21107 ) ) ( IS-CRATE ?auto_21084 ) ( AVAILABLE ?auto_21102 ) ( SURFACE-AT ?auto_21084 ?auto_21104 ) ( ON ?auto_21084 ?auto_21109 ) ( CLEAR ?auto_21084 ) ( not ( = ?auto_21083 ?auto_21084 ) ) ( not ( = ?auto_21083 ?auto_21109 ) ) ( not ( = ?auto_21084 ?auto_21109 ) ) ( IS-CRATE ?auto_21083 ) ( not ( = ?auto_21112 ?auto_21096 ) ) ( HOIST-AT ?auto_21113 ?auto_21112 ) ( AVAILABLE ?auto_21113 ) ( SURFACE-AT ?auto_21083 ?auto_21112 ) ( ON ?auto_21083 ?auto_21111 ) ( CLEAR ?auto_21083 ) ( not ( = ?auto_21082 ?auto_21083 ) ) ( not ( = ?auto_21082 ?auto_21111 ) ) ( not ( = ?auto_21083 ?auto_21111 ) ) ( not ( = ?auto_21093 ?auto_21113 ) ) ( SURFACE-AT ?auto_21081 ?auto_21096 ) ( CLEAR ?auto_21081 ) ( IS-CRATE ?auto_21082 ) ( AVAILABLE ?auto_21093 ) ( AVAILABLE ?auto_21100 ) ( SURFACE-AT ?auto_21082 ?auto_21108 ) ( ON ?auto_21082 ?auto_21103 ) ( CLEAR ?auto_21082 ) ( TRUCK-AT ?auto_21095 ?auto_21096 ) ( not ( = ?auto_21081 ?auto_21082 ) ) ( not ( = ?auto_21081 ?auto_21103 ) ) ( not ( = ?auto_21082 ?auto_21103 ) ) ( not ( = ?auto_21081 ?auto_21083 ) ) ( not ( = ?auto_21081 ?auto_21111 ) ) ( not ( = ?auto_21083 ?auto_21103 ) ) ( not ( = ?auto_21112 ?auto_21108 ) ) ( not ( = ?auto_21113 ?auto_21100 ) ) ( not ( = ?auto_21111 ?auto_21103 ) ) ( not ( = ?auto_21081 ?auto_21084 ) ) ( not ( = ?auto_21081 ?auto_21109 ) ) ( not ( = ?auto_21082 ?auto_21084 ) ) ( not ( = ?auto_21082 ?auto_21109 ) ) ( not ( = ?auto_21084 ?auto_21111 ) ) ( not ( = ?auto_21084 ?auto_21103 ) ) ( not ( = ?auto_21104 ?auto_21112 ) ) ( not ( = ?auto_21104 ?auto_21108 ) ) ( not ( = ?auto_21102 ?auto_21113 ) ) ( not ( = ?auto_21102 ?auto_21100 ) ) ( not ( = ?auto_21109 ?auto_21111 ) ) ( not ( = ?auto_21109 ?auto_21103 ) ) ( not ( = ?auto_21081 ?auto_21085 ) ) ( not ( = ?auto_21081 ?auto_21117 ) ) ( not ( = ?auto_21082 ?auto_21085 ) ) ( not ( = ?auto_21082 ?auto_21117 ) ) ( not ( = ?auto_21083 ?auto_21085 ) ) ( not ( = ?auto_21083 ?auto_21117 ) ) ( not ( = ?auto_21085 ?auto_21109 ) ) ( not ( = ?auto_21085 ?auto_21111 ) ) ( not ( = ?auto_21085 ?auto_21103 ) ) ( not ( = ?auto_21106 ?auto_21104 ) ) ( not ( = ?auto_21106 ?auto_21112 ) ) ( not ( = ?auto_21106 ?auto_21108 ) ) ( not ( = ?auto_21107 ?auto_21102 ) ) ( not ( = ?auto_21107 ?auto_21113 ) ) ( not ( = ?auto_21107 ?auto_21100 ) ) ( not ( = ?auto_21117 ?auto_21109 ) ) ( not ( = ?auto_21117 ?auto_21111 ) ) ( not ( = ?auto_21117 ?auto_21103 ) ) ( not ( = ?auto_21081 ?auto_21086 ) ) ( not ( = ?auto_21081 ?auto_21105 ) ) ( not ( = ?auto_21082 ?auto_21086 ) ) ( not ( = ?auto_21082 ?auto_21105 ) ) ( not ( = ?auto_21083 ?auto_21086 ) ) ( not ( = ?auto_21083 ?auto_21105 ) ) ( not ( = ?auto_21084 ?auto_21086 ) ) ( not ( = ?auto_21084 ?auto_21105 ) ) ( not ( = ?auto_21086 ?auto_21117 ) ) ( not ( = ?auto_21086 ?auto_21109 ) ) ( not ( = ?auto_21086 ?auto_21111 ) ) ( not ( = ?auto_21086 ?auto_21103 ) ) ( not ( = ?auto_21110 ?auto_21106 ) ) ( not ( = ?auto_21110 ?auto_21104 ) ) ( not ( = ?auto_21110 ?auto_21112 ) ) ( not ( = ?auto_21110 ?auto_21108 ) ) ( not ( = ?auto_21118 ?auto_21107 ) ) ( not ( = ?auto_21118 ?auto_21102 ) ) ( not ( = ?auto_21118 ?auto_21113 ) ) ( not ( = ?auto_21118 ?auto_21100 ) ) ( not ( = ?auto_21105 ?auto_21117 ) ) ( not ( = ?auto_21105 ?auto_21109 ) ) ( not ( = ?auto_21105 ?auto_21111 ) ) ( not ( = ?auto_21105 ?auto_21103 ) ) ( not ( = ?auto_21081 ?auto_21087 ) ) ( not ( = ?auto_21081 ?auto_21115 ) ) ( not ( = ?auto_21082 ?auto_21087 ) ) ( not ( = ?auto_21082 ?auto_21115 ) ) ( not ( = ?auto_21083 ?auto_21087 ) ) ( not ( = ?auto_21083 ?auto_21115 ) ) ( not ( = ?auto_21084 ?auto_21087 ) ) ( not ( = ?auto_21084 ?auto_21115 ) ) ( not ( = ?auto_21085 ?auto_21087 ) ) ( not ( = ?auto_21085 ?auto_21115 ) ) ( not ( = ?auto_21087 ?auto_21105 ) ) ( not ( = ?auto_21087 ?auto_21117 ) ) ( not ( = ?auto_21087 ?auto_21109 ) ) ( not ( = ?auto_21087 ?auto_21111 ) ) ( not ( = ?auto_21087 ?auto_21103 ) ) ( not ( = ?auto_21115 ?auto_21105 ) ) ( not ( = ?auto_21115 ?auto_21117 ) ) ( not ( = ?auto_21115 ?auto_21109 ) ) ( not ( = ?auto_21115 ?auto_21111 ) ) ( not ( = ?auto_21115 ?auto_21103 ) ) ( not ( = ?auto_21081 ?auto_21090 ) ) ( not ( = ?auto_21081 ?auto_21114 ) ) ( not ( = ?auto_21082 ?auto_21090 ) ) ( not ( = ?auto_21082 ?auto_21114 ) ) ( not ( = ?auto_21083 ?auto_21090 ) ) ( not ( = ?auto_21083 ?auto_21114 ) ) ( not ( = ?auto_21084 ?auto_21090 ) ) ( not ( = ?auto_21084 ?auto_21114 ) ) ( not ( = ?auto_21085 ?auto_21090 ) ) ( not ( = ?auto_21085 ?auto_21114 ) ) ( not ( = ?auto_21086 ?auto_21090 ) ) ( not ( = ?auto_21086 ?auto_21114 ) ) ( not ( = ?auto_21090 ?auto_21115 ) ) ( not ( = ?auto_21090 ?auto_21105 ) ) ( not ( = ?auto_21090 ?auto_21117 ) ) ( not ( = ?auto_21090 ?auto_21109 ) ) ( not ( = ?auto_21090 ?auto_21111 ) ) ( not ( = ?auto_21090 ?auto_21103 ) ) ( not ( = ?auto_21097 ?auto_21108 ) ) ( not ( = ?auto_21097 ?auto_21110 ) ) ( not ( = ?auto_21097 ?auto_21106 ) ) ( not ( = ?auto_21097 ?auto_21104 ) ) ( not ( = ?auto_21097 ?auto_21112 ) ) ( not ( = ?auto_21098 ?auto_21100 ) ) ( not ( = ?auto_21098 ?auto_21118 ) ) ( not ( = ?auto_21098 ?auto_21107 ) ) ( not ( = ?auto_21098 ?auto_21102 ) ) ( not ( = ?auto_21098 ?auto_21113 ) ) ( not ( = ?auto_21114 ?auto_21115 ) ) ( not ( = ?auto_21114 ?auto_21105 ) ) ( not ( = ?auto_21114 ?auto_21117 ) ) ( not ( = ?auto_21114 ?auto_21109 ) ) ( not ( = ?auto_21114 ?auto_21111 ) ) ( not ( = ?auto_21114 ?auto_21103 ) ) ( not ( = ?auto_21081 ?auto_21089 ) ) ( not ( = ?auto_21081 ?auto_21101 ) ) ( not ( = ?auto_21082 ?auto_21089 ) ) ( not ( = ?auto_21082 ?auto_21101 ) ) ( not ( = ?auto_21083 ?auto_21089 ) ) ( not ( = ?auto_21083 ?auto_21101 ) ) ( not ( = ?auto_21084 ?auto_21089 ) ) ( not ( = ?auto_21084 ?auto_21101 ) ) ( not ( = ?auto_21085 ?auto_21089 ) ) ( not ( = ?auto_21085 ?auto_21101 ) ) ( not ( = ?auto_21086 ?auto_21089 ) ) ( not ( = ?auto_21086 ?auto_21101 ) ) ( not ( = ?auto_21087 ?auto_21089 ) ) ( not ( = ?auto_21087 ?auto_21101 ) ) ( not ( = ?auto_21089 ?auto_21114 ) ) ( not ( = ?auto_21089 ?auto_21115 ) ) ( not ( = ?auto_21089 ?auto_21105 ) ) ( not ( = ?auto_21089 ?auto_21117 ) ) ( not ( = ?auto_21089 ?auto_21109 ) ) ( not ( = ?auto_21089 ?auto_21111 ) ) ( not ( = ?auto_21089 ?auto_21103 ) ) ( not ( = ?auto_21101 ?auto_21114 ) ) ( not ( = ?auto_21101 ?auto_21115 ) ) ( not ( = ?auto_21101 ?auto_21105 ) ) ( not ( = ?auto_21101 ?auto_21117 ) ) ( not ( = ?auto_21101 ?auto_21109 ) ) ( not ( = ?auto_21101 ?auto_21111 ) ) ( not ( = ?auto_21101 ?auto_21103 ) ) ( not ( = ?auto_21081 ?auto_21088 ) ) ( not ( = ?auto_21081 ?auto_21099 ) ) ( not ( = ?auto_21082 ?auto_21088 ) ) ( not ( = ?auto_21082 ?auto_21099 ) ) ( not ( = ?auto_21083 ?auto_21088 ) ) ( not ( = ?auto_21083 ?auto_21099 ) ) ( not ( = ?auto_21084 ?auto_21088 ) ) ( not ( = ?auto_21084 ?auto_21099 ) ) ( not ( = ?auto_21085 ?auto_21088 ) ) ( not ( = ?auto_21085 ?auto_21099 ) ) ( not ( = ?auto_21086 ?auto_21088 ) ) ( not ( = ?auto_21086 ?auto_21099 ) ) ( not ( = ?auto_21087 ?auto_21088 ) ) ( not ( = ?auto_21087 ?auto_21099 ) ) ( not ( = ?auto_21090 ?auto_21088 ) ) ( not ( = ?auto_21090 ?auto_21099 ) ) ( not ( = ?auto_21088 ?auto_21101 ) ) ( not ( = ?auto_21088 ?auto_21114 ) ) ( not ( = ?auto_21088 ?auto_21115 ) ) ( not ( = ?auto_21088 ?auto_21105 ) ) ( not ( = ?auto_21088 ?auto_21117 ) ) ( not ( = ?auto_21088 ?auto_21109 ) ) ( not ( = ?auto_21088 ?auto_21111 ) ) ( not ( = ?auto_21088 ?auto_21103 ) ) ( not ( = ?auto_21099 ?auto_21101 ) ) ( not ( = ?auto_21099 ?auto_21114 ) ) ( not ( = ?auto_21099 ?auto_21115 ) ) ( not ( = ?auto_21099 ?auto_21105 ) ) ( not ( = ?auto_21099 ?auto_21117 ) ) ( not ( = ?auto_21099 ?auto_21109 ) ) ( not ( = ?auto_21099 ?auto_21111 ) ) ( not ( = ?auto_21099 ?auto_21103 ) ) ( not ( = ?auto_21081 ?auto_21091 ) ) ( not ( = ?auto_21081 ?auto_21116 ) ) ( not ( = ?auto_21082 ?auto_21091 ) ) ( not ( = ?auto_21082 ?auto_21116 ) ) ( not ( = ?auto_21083 ?auto_21091 ) ) ( not ( = ?auto_21083 ?auto_21116 ) ) ( not ( = ?auto_21084 ?auto_21091 ) ) ( not ( = ?auto_21084 ?auto_21116 ) ) ( not ( = ?auto_21085 ?auto_21091 ) ) ( not ( = ?auto_21085 ?auto_21116 ) ) ( not ( = ?auto_21086 ?auto_21091 ) ) ( not ( = ?auto_21086 ?auto_21116 ) ) ( not ( = ?auto_21087 ?auto_21091 ) ) ( not ( = ?auto_21087 ?auto_21116 ) ) ( not ( = ?auto_21090 ?auto_21091 ) ) ( not ( = ?auto_21090 ?auto_21116 ) ) ( not ( = ?auto_21089 ?auto_21091 ) ) ( not ( = ?auto_21089 ?auto_21116 ) ) ( not ( = ?auto_21091 ?auto_21099 ) ) ( not ( = ?auto_21091 ?auto_21101 ) ) ( not ( = ?auto_21091 ?auto_21114 ) ) ( not ( = ?auto_21091 ?auto_21115 ) ) ( not ( = ?auto_21091 ?auto_21105 ) ) ( not ( = ?auto_21091 ?auto_21117 ) ) ( not ( = ?auto_21091 ?auto_21109 ) ) ( not ( = ?auto_21091 ?auto_21111 ) ) ( not ( = ?auto_21091 ?auto_21103 ) ) ( not ( = ?auto_21116 ?auto_21099 ) ) ( not ( = ?auto_21116 ?auto_21101 ) ) ( not ( = ?auto_21116 ?auto_21114 ) ) ( not ( = ?auto_21116 ?auto_21115 ) ) ( not ( = ?auto_21116 ?auto_21105 ) ) ( not ( = ?auto_21116 ?auto_21117 ) ) ( not ( = ?auto_21116 ?auto_21109 ) ) ( not ( = ?auto_21116 ?auto_21111 ) ) ( not ( = ?auto_21116 ?auto_21103 ) ) ( not ( = ?auto_21081 ?auto_21092 ) ) ( not ( = ?auto_21081 ?auto_21094 ) ) ( not ( = ?auto_21082 ?auto_21092 ) ) ( not ( = ?auto_21082 ?auto_21094 ) ) ( not ( = ?auto_21083 ?auto_21092 ) ) ( not ( = ?auto_21083 ?auto_21094 ) ) ( not ( = ?auto_21084 ?auto_21092 ) ) ( not ( = ?auto_21084 ?auto_21094 ) ) ( not ( = ?auto_21085 ?auto_21092 ) ) ( not ( = ?auto_21085 ?auto_21094 ) ) ( not ( = ?auto_21086 ?auto_21092 ) ) ( not ( = ?auto_21086 ?auto_21094 ) ) ( not ( = ?auto_21087 ?auto_21092 ) ) ( not ( = ?auto_21087 ?auto_21094 ) ) ( not ( = ?auto_21090 ?auto_21092 ) ) ( not ( = ?auto_21090 ?auto_21094 ) ) ( not ( = ?auto_21089 ?auto_21092 ) ) ( not ( = ?auto_21089 ?auto_21094 ) ) ( not ( = ?auto_21088 ?auto_21092 ) ) ( not ( = ?auto_21088 ?auto_21094 ) ) ( not ( = ?auto_21092 ?auto_21116 ) ) ( not ( = ?auto_21092 ?auto_21099 ) ) ( not ( = ?auto_21092 ?auto_21101 ) ) ( not ( = ?auto_21092 ?auto_21114 ) ) ( not ( = ?auto_21092 ?auto_21115 ) ) ( not ( = ?auto_21092 ?auto_21105 ) ) ( not ( = ?auto_21092 ?auto_21117 ) ) ( not ( = ?auto_21092 ?auto_21109 ) ) ( not ( = ?auto_21092 ?auto_21111 ) ) ( not ( = ?auto_21092 ?auto_21103 ) ) ( not ( = ?auto_21094 ?auto_21116 ) ) ( not ( = ?auto_21094 ?auto_21099 ) ) ( not ( = ?auto_21094 ?auto_21101 ) ) ( not ( = ?auto_21094 ?auto_21114 ) ) ( not ( = ?auto_21094 ?auto_21115 ) ) ( not ( = ?auto_21094 ?auto_21105 ) ) ( not ( = ?auto_21094 ?auto_21117 ) ) ( not ( = ?auto_21094 ?auto_21109 ) ) ( not ( = ?auto_21094 ?auto_21111 ) ) ( not ( = ?auto_21094 ?auto_21103 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_21081 ?auto_21082 ?auto_21083 ?auto_21084 ?auto_21085 ?auto_21086 ?auto_21087 ?auto_21090 ?auto_21089 ?auto_21088 ?auto_21091 )
      ( MAKE-1CRATE ?auto_21091 ?auto_21092 )
      ( MAKE-11CRATE-VERIFY ?auto_21081 ?auto_21082 ?auto_21083 ?auto_21084 ?auto_21085 ?auto_21086 ?auto_21087 ?auto_21090 ?auto_21089 ?auto_21088 ?auto_21091 ?auto_21092 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21121 - SURFACE
      ?auto_21122 - SURFACE
    )
    :vars
    (
      ?auto_21123 - HOIST
      ?auto_21124 - PLACE
      ?auto_21126 - PLACE
      ?auto_21127 - HOIST
      ?auto_21128 - SURFACE
      ?auto_21125 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21123 ?auto_21124 ) ( SURFACE-AT ?auto_21121 ?auto_21124 ) ( CLEAR ?auto_21121 ) ( IS-CRATE ?auto_21122 ) ( AVAILABLE ?auto_21123 ) ( not ( = ?auto_21126 ?auto_21124 ) ) ( HOIST-AT ?auto_21127 ?auto_21126 ) ( AVAILABLE ?auto_21127 ) ( SURFACE-AT ?auto_21122 ?auto_21126 ) ( ON ?auto_21122 ?auto_21128 ) ( CLEAR ?auto_21122 ) ( TRUCK-AT ?auto_21125 ?auto_21124 ) ( not ( = ?auto_21121 ?auto_21122 ) ) ( not ( = ?auto_21121 ?auto_21128 ) ) ( not ( = ?auto_21122 ?auto_21128 ) ) ( not ( = ?auto_21123 ?auto_21127 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21125 ?auto_21124 ?auto_21126 )
      ( !LIFT ?auto_21127 ?auto_21122 ?auto_21128 ?auto_21126 )
      ( !LOAD ?auto_21127 ?auto_21122 ?auto_21125 ?auto_21126 )
      ( !DRIVE ?auto_21125 ?auto_21126 ?auto_21124 )
      ( !UNLOAD ?auto_21123 ?auto_21122 ?auto_21125 ?auto_21124 )
      ( !DROP ?auto_21123 ?auto_21122 ?auto_21121 ?auto_21124 )
      ( MAKE-1CRATE-VERIFY ?auto_21121 ?auto_21122 ) )
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
      ?auto_21151 - SURFACE
      ?auto_21150 - SURFACE
      ?auto_21149 - SURFACE
      ?auto_21152 - SURFACE
      ?auto_21153 - SURFACE
      ?auto_21154 - SURFACE
    )
    :vars
    (
      ?auto_21159 - HOIST
      ?auto_21158 - PLACE
      ?auto_21157 - PLACE
      ?auto_21155 - HOIST
      ?auto_21160 - SURFACE
      ?auto_21175 - SURFACE
      ?auto_21162 - PLACE
      ?auto_21167 - HOIST
      ?auto_21179 - SURFACE
      ?auto_21168 - SURFACE
      ?auto_21174 - PLACE
      ?auto_21171 - HOIST
      ?auto_21169 - SURFACE
      ?auto_21163 - SURFACE
      ?auto_21170 - SURFACE
      ?auto_21173 - PLACE
      ?auto_21164 - HOIST
      ?auto_21180 - SURFACE
      ?auto_21181 - PLACE
      ?auto_21176 - HOIST
      ?auto_21165 - SURFACE
      ?auto_21177 - SURFACE
      ?auto_21172 - PLACE
      ?auto_21178 - HOIST
      ?auto_21161 - SURFACE
      ?auto_21166 - SURFACE
      ?auto_21156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21159 ?auto_21158 ) ( IS-CRATE ?auto_21154 ) ( not ( = ?auto_21157 ?auto_21158 ) ) ( HOIST-AT ?auto_21155 ?auto_21157 ) ( SURFACE-AT ?auto_21154 ?auto_21157 ) ( ON ?auto_21154 ?auto_21160 ) ( CLEAR ?auto_21154 ) ( not ( = ?auto_21153 ?auto_21154 ) ) ( not ( = ?auto_21153 ?auto_21160 ) ) ( not ( = ?auto_21154 ?auto_21160 ) ) ( not ( = ?auto_21159 ?auto_21155 ) ) ( IS-CRATE ?auto_21153 ) ( SURFACE-AT ?auto_21153 ?auto_21157 ) ( ON ?auto_21153 ?auto_21175 ) ( CLEAR ?auto_21153 ) ( not ( = ?auto_21152 ?auto_21153 ) ) ( not ( = ?auto_21152 ?auto_21175 ) ) ( not ( = ?auto_21153 ?auto_21175 ) ) ( IS-CRATE ?auto_21152 ) ( not ( = ?auto_21162 ?auto_21158 ) ) ( HOIST-AT ?auto_21167 ?auto_21162 ) ( SURFACE-AT ?auto_21152 ?auto_21162 ) ( ON ?auto_21152 ?auto_21179 ) ( CLEAR ?auto_21152 ) ( not ( = ?auto_21149 ?auto_21152 ) ) ( not ( = ?auto_21149 ?auto_21179 ) ) ( not ( = ?auto_21152 ?auto_21179 ) ) ( not ( = ?auto_21159 ?auto_21167 ) ) ( IS-CRATE ?auto_21149 ) ( SURFACE-AT ?auto_21149 ?auto_21157 ) ( ON ?auto_21149 ?auto_21168 ) ( CLEAR ?auto_21149 ) ( not ( = ?auto_21150 ?auto_21149 ) ) ( not ( = ?auto_21150 ?auto_21168 ) ) ( not ( = ?auto_21149 ?auto_21168 ) ) ( IS-CRATE ?auto_21150 ) ( not ( = ?auto_21174 ?auto_21158 ) ) ( HOIST-AT ?auto_21171 ?auto_21174 ) ( SURFACE-AT ?auto_21150 ?auto_21174 ) ( ON ?auto_21150 ?auto_21169 ) ( CLEAR ?auto_21150 ) ( not ( = ?auto_21151 ?auto_21150 ) ) ( not ( = ?auto_21151 ?auto_21169 ) ) ( not ( = ?auto_21150 ?auto_21169 ) ) ( not ( = ?auto_21159 ?auto_21171 ) ) ( IS-CRATE ?auto_21151 ) ( AVAILABLE ?auto_21155 ) ( SURFACE-AT ?auto_21151 ?auto_21157 ) ( ON ?auto_21151 ?auto_21163 ) ( CLEAR ?auto_21151 ) ( not ( = ?auto_21148 ?auto_21151 ) ) ( not ( = ?auto_21148 ?auto_21163 ) ) ( not ( = ?auto_21151 ?auto_21163 ) ) ( IS-CRATE ?auto_21148 ) ( SURFACE-AT ?auto_21148 ?auto_21174 ) ( ON ?auto_21148 ?auto_21170 ) ( CLEAR ?auto_21148 ) ( not ( = ?auto_21147 ?auto_21148 ) ) ( not ( = ?auto_21147 ?auto_21170 ) ) ( not ( = ?auto_21148 ?auto_21170 ) ) ( IS-CRATE ?auto_21147 ) ( not ( = ?auto_21173 ?auto_21158 ) ) ( HOIST-AT ?auto_21164 ?auto_21173 ) ( AVAILABLE ?auto_21164 ) ( SURFACE-AT ?auto_21147 ?auto_21173 ) ( ON ?auto_21147 ?auto_21180 ) ( CLEAR ?auto_21147 ) ( not ( = ?auto_21146 ?auto_21147 ) ) ( not ( = ?auto_21146 ?auto_21180 ) ) ( not ( = ?auto_21147 ?auto_21180 ) ) ( not ( = ?auto_21159 ?auto_21164 ) ) ( IS-CRATE ?auto_21146 ) ( not ( = ?auto_21181 ?auto_21158 ) ) ( HOIST-AT ?auto_21176 ?auto_21181 ) ( AVAILABLE ?auto_21176 ) ( SURFACE-AT ?auto_21146 ?auto_21181 ) ( ON ?auto_21146 ?auto_21165 ) ( CLEAR ?auto_21146 ) ( not ( = ?auto_21145 ?auto_21146 ) ) ( not ( = ?auto_21145 ?auto_21165 ) ) ( not ( = ?auto_21146 ?auto_21165 ) ) ( not ( = ?auto_21159 ?auto_21176 ) ) ( IS-CRATE ?auto_21145 ) ( AVAILABLE ?auto_21167 ) ( SURFACE-AT ?auto_21145 ?auto_21162 ) ( ON ?auto_21145 ?auto_21177 ) ( CLEAR ?auto_21145 ) ( not ( = ?auto_21144 ?auto_21145 ) ) ( not ( = ?auto_21144 ?auto_21177 ) ) ( not ( = ?auto_21145 ?auto_21177 ) ) ( IS-CRATE ?auto_21144 ) ( not ( = ?auto_21172 ?auto_21158 ) ) ( HOIST-AT ?auto_21178 ?auto_21172 ) ( AVAILABLE ?auto_21178 ) ( SURFACE-AT ?auto_21144 ?auto_21172 ) ( ON ?auto_21144 ?auto_21161 ) ( CLEAR ?auto_21144 ) ( not ( = ?auto_21143 ?auto_21144 ) ) ( not ( = ?auto_21143 ?auto_21161 ) ) ( not ( = ?auto_21144 ?auto_21161 ) ) ( not ( = ?auto_21159 ?auto_21178 ) ) ( SURFACE-AT ?auto_21142 ?auto_21158 ) ( CLEAR ?auto_21142 ) ( IS-CRATE ?auto_21143 ) ( AVAILABLE ?auto_21159 ) ( AVAILABLE ?auto_21171 ) ( SURFACE-AT ?auto_21143 ?auto_21174 ) ( ON ?auto_21143 ?auto_21166 ) ( CLEAR ?auto_21143 ) ( TRUCK-AT ?auto_21156 ?auto_21158 ) ( not ( = ?auto_21142 ?auto_21143 ) ) ( not ( = ?auto_21142 ?auto_21166 ) ) ( not ( = ?auto_21143 ?auto_21166 ) ) ( not ( = ?auto_21142 ?auto_21144 ) ) ( not ( = ?auto_21142 ?auto_21161 ) ) ( not ( = ?auto_21144 ?auto_21166 ) ) ( not ( = ?auto_21172 ?auto_21174 ) ) ( not ( = ?auto_21178 ?auto_21171 ) ) ( not ( = ?auto_21161 ?auto_21166 ) ) ( not ( = ?auto_21142 ?auto_21145 ) ) ( not ( = ?auto_21142 ?auto_21177 ) ) ( not ( = ?auto_21143 ?auto_21145 ) ) ( not ( = ?auto_21143 ?auto_21177 ) ) ( not ( = ?auto_21145 ?auto_21161 ) ) ( not ( = ?auto_21145 ?auto_21166 ) ) ( not ( = ?auto_21162 ?auto_21172 ) ) ( not ( = ?auto_21162 ?auto_21174 ) ) ( not ( = ?auto_21167 ?auto_21178 ) ) ( not ( = ?auto_21167 ?auto_21171 ) ) ( not ( = ?auto_21177 ?auto_21161 ) ) ( not ( = ?auto_21177 ?auto_21166 ) ) ( not ( = ?auto_21142 ?auto_21146 ) ) ( not ( = ?auto_21142 ?auto_21165 ) ) ( not ( = ?auto_21143 ?auto_21146 ) ) ( not ( = ?auto_21143 ?auto_21165 ) ) ( not ( = ?auto_21144 ?auto_21146 ) ) ( not ( = ?auto_21144 ?auto_21165 ) ) ( not ( = ?auto_21146 ?auto_21177 ) ) ( not ( = ?auto_21146 ?auto_21161 ) ) ( not ( = ?auto_21146 ?auto_21166 ) ) ( not ( = ?auto_21181 ?auto_21162 ) ) ( not ( = ?auto_21181 ?auto_21172 ) ) ( not ( = ?auto_21181 ?auto_21174 ) ) ( not ( = ?auto_21176 ?auto_21167 ) ) ( not ( = ?auto_21176 ?auto_21178 ) ) ( not ( = ?auto_21176 ?auto_21171 ) ) ( not ( = ?auto_21165 ?auto_21177 ) ) ( not ( = ?auto_21165 ?auto_21161 ) ) ( not ( = ?auto_21165 ?auto_21166 ) ) ( not ( = ?auto_21142 ?auto_21147 ) ) ( not ( = ?auto_21142 ?auto_21180 ) ) ( not ( = ?auto_21143 ?auto_21147 ) ) ( not ( = ?auto_21143 ?auto_21180 ) ) ( not ( = ?auto_21144 ?auto_21147 ) ) ( not ( = ?auto_21144 ?auto_21180 ) ) ( not ( = ?auto_21145 ?auto_21147 ) ) ( not ( = ?auto_21145 ?auto_21180 ) ) ( not ( = ?auto_21147 ?auto_21165 ) ) ( not ( = ?auto_21147 ?auto_21177 ) ) ( not ( = ?auto_21147 ?auto_21161 ) ) ( not ( = ?auto_21147 ?auto_21166 ) ) ( not ( = ?auto_21173 ?auto_21181 ) ) ( not ( = ?auto_21173 ?auto_21162 ) ) ( not ( = ?auto_21173 ?auto_21172 ) ) ( not ( = ?auto_21173 ?auto_21174 ) ) ( not ( = ?auto_21164 ?auto_21176 ) ) ( not ( = ?auto_21164 ?auto_21167 ) ) ( not ( = ?auto_21164 ?auto_21178 ) ) ( not ( = ?auto_21164 ?auto_21171 ) ) ( not ( = ?auto_21180 ?auto_21165 ) ) ( not ( = ?auto_21180 ?auto_21177 ) ) ( not ( = ?auto_21180 ?auto_21161 ) ) ( not ( = ?auto_21180 ?auto_21166 ) ) ( not ( = ?auto_21142 ?auto_21148 ) ) ( not ( = ?auto_21142 ?auto_21170 ) ) ( not ( = ?auto_21143 ?auto_21148 ) ) ( not ( = ?auto_21143 ?auto_21170 ) ) ( not ( = ?auto_21144 ?auto_21148 ) ) ( not ( = ?auto_21144 ?auto_21170 ) ) ( not ( = ?auto_21145 ?auto_21148 ) ) ( not ( = ?auto_21145 ?auto_21170 ) ) ( not ( = ?auto_21146 ?auto_21148 ) ) ( not ( = ?auto_21146 ?auto_21170 ) ) ( not ( = ?auto_21148 ?auto_21180 ) ) ( not ( = ?auto_21148 ?auto_21165 ) ) ( not ( = ?auto_21148 ?auto_21177 ) ) ( not ( = ?auto_21148 ?auto_21161 ) ) ( not ( = ?auto_21148 ?auto_21166 ) ) ( not ( = ?auto_21170 ?auto_21180 ) ) ( not ( = ?auto_21170 ?auto_21165 ) ) ( not ( = ?auto_21170 ?auto_21177 ) ) ( not ( = ?auto_21170 ?auto_21161 ) ) ( not ( = ?auto_21170 ?auto_21166 ) ) ( not ( = ?auto_21142 ?auto_21151 ) ) ( not ( = ?auto_21142 ?auto_21163 ) ) ( not ( = ?auto_21143 ?auto_21151 ) ) ( not ( = ?auto_21143 ?auto_21163 ) ) ( not ( = ?auto_21144 ?auto_21151 ) ) ( not ( = ?auto_21144 ?auto_21163 ) ) ( not ( = ?auto_21145 ?auto_21151 ) ) ( not ( = ?auto_21145 ?auto_21163 ) ) ( not ( = ?auto_21146 ?auto_21151 ) ) ( not ( = ?auto_21146 ?auto_21163 ) ) ( not ( = ?auto_21147 ?auto_21151 ) ) ( not ( = ?auto_21147 ?auto_21163 ) ) ( not ( = ?auto_21151 ?auto_21170 ) ) ( not ( = ?auto_21151 ?auto_21180 ) ) ( not ( = ?auto_21151 ?auto_21165 ) ) ( not ( = ?auto_21151 ?auto_21177 ) ) ( not ( = ?auto_21151 ?auto_21161 ) ) ( not ( = ?auto_21151 ?auto_21166 ) ) ( not ( = ?auto_21157 ?auto_21174 ) ) ( not ( = ?auto_21157 ?auto_21173 ) ) ( not ( = ?auto_21157 ?auto_21181 ) ) ( not ( = ?auto_21157 ?auto_21162 ) ) ( not ( = ?auto_21157 ?auto_21172 ) ) ( not ( = ?auto_21155 ?auto_21171 ) ) ( not ( = ?auto_21155 ?auto_21164 ) ) ( not ( = ?auto_21155 ?auto_21176 ) ) ( not ( = ?auto_21155 ?auto_21167 ) ) ( not ( = ?auto_21155 ?auto_21178 ) ) ( not ( = ?auto_21163 ?auto_21170 ) ) ( not ( = ?auto_21163 ?auto_21180 ) ) ( not ( = ?auto_21163 ?auto_21165 ) ) ( not ( = ?auto_21163 ?auto_21177 ) ) ( not ( = ?auto_21163 ?auto_21161 ) ) ( not ( = ?auto_21163 ?auto_21166 ) ) ( not ( = ?auto_21142 ?auto_21150 ) ) ( not ( = ?auto_21142 ?auto_21169 ) ) ( not ( = ?auto_21143 ?auto_21150 ) ) ( not ( = ?auto_21143 ?auto_21169 ) ) ( not ( = ?auto_21144 ?auto_21150 ) ) ( not ( = ?auto_21144 ?auto_21169 ) ) ( not ( = ?auto_21145 ?auto_21150 ) ) ( not ( = ?auto_21145 ?auto_21169 ) ) ( not ( = ?auto_21146 ?auto_21150 ) ) ( not ( = ?auto_21146 ?auto_21169 ) ) ( not ( = ?auto_21147 ?auto_21150 ) ) ( not ( = ?auto_21147 ?auto_21169 ) ) ( not ( = ?auto_21148 ?auto_21150 ) ) ( not ( = ?auto_21148 ?auto_21169 ) ) ( not ( = ?auto_21150 ?auto_21163 ) ) ( not ( = ?auto_21150 ?auto_21170 ) ) ( not ( = ?auto_21150 ?auto_21180 ) ) ( not ( = ?auto_21150 ?auto_21165 ) ) ( not ( = ?auto_21150 ?auto_21177 ) ) ( not ( = ?auto_21150 ?auto_21161 ) ) ( not ( = ?auto_21150 ?auto_21166 ) ) ( not ( = ?auto_21169 ?auto_21163 ) ) ( not ( = ?auto_21169 ?auto_21170 ) ) ( not ( = ?auto_21169 ?auto_21180 ) ) ( not ( = ?auto_21169 ?auto_21165 ) ) ( not ( = ?auto_21169 ?auto_21177 ) ) ( not ( = ?auto_21169 ?auto_21161 ) ) ( not ( = ?auto_21169 ?auto_21166 ) ) ( not ( = ?auto_21142 ?auto_21149 ) ) ( not ( = ?auto_21142 ?auto_21168 ) ) ( not ( = ?auto_21143 ?auto_21149 ) ) ( not ( = ?auto_21143 ?auto_21168 ) ) ( not ( = ?auto_21144 ?auto_21149 ) ) ( not ( = ?auto_21144 ?auto_21168 ) ) ( not ( = ?auto_21145 ?auto_21149 ) ) ( not ( = ?auto_21145 ?auto_21168 ) ) ( not ( = ?auto_21146 ?auto_21149 ) ) ( not ( = ?auto_21146 ?auto_21168 ) ) ( not ( = ?auto_21147 ?auto_21149 ) ) ( not ( = ?auto_21147 ?auto_21168 ) ) ( not ( = ?auto_21148 ?auto_21149 ) ) ( not ( = ?auto_21148 ?auto_21168 ) ) ( not ( = ?auto_21151 ?auto_21149 ) ) ( not ( = ?auto_21151 ?auto_21168 ) ) ( not ( = ?auto_21149 ?auto_21169 ) ) ( not ( = ?auto_21149 ?auto_21163 ) ) ( not ( = ?auto_21149 ?auto_21170 ) ) ( not ( = ?auto_21149 ?auto_21180 ) ) ( not ( = ?auto_21149 ?auto_21165 ) ) ( not ( = ?auto_21149 ?auto_21177 ) ) ( not ( = ?auto_21149 ?auto_21161 ) ) ( not ( = ?auto_21149 ?auto_21166 ) ) ( not ( = ?auto_21168 ?auto_21169 ) ) ( not ( = ?auto_21168 ?auto_21163 ) ) ( not ( = ?auto_21168 ?auto_21170 ) ) ( not ( = ?auto_21168 ?auto_21180 ) ) ( not ( = ?auto_21168 ?auto_21165 ) ) ( not ( = ?auto_21168 ?auto_21177 ) ) ( not ( = ?auto_21168 ?auto_21161 ) ) ( not ( = ?auto_21168 ?auto_21166 ) ) ( not ( = ?auto_21142 ?auto_21152 ) ) ( not ( = ?auto_21142 ?auto_21179 ) ) ( not ( = ?auto_21143 ?auto_21152 ) ) ( not ( = ?auto_21143 ?auto_21179 ) ) ( not ( = ?auto_21144 ?auto_21152 ) ) ( not ( = ?auto_21144 ?auto_21179 ) ) ( not ( = ?auto_21145 ?auto_21152 ) ) ( not ( = ?auto_21145 ?auto_21179 ) ) ( not ( = ?auto_21146 ?auto_21152 ) ) ( not ( = ?auto_21146 ?auto_21179 ) ) ( not ( = ?auto_21147 ?auto_21152 ) ) ( not ( = ?auto_21147 ?auto_21179 ) ) ( not ( = ?auto_21148 ?auto_21152 ) ) ( not ( = ?auto_21148 ?auto_21179 ) ) ( not ( = ?auto_21151 ?auto_21152 ) ) ( not ( = ?auto_21151 ?auto_21179 ) ) ( not ( = ?auto_21150 ?auto_21152 ) ) ( not ( = ?auto_21150 ?auto_21179 ) ) ( not ( = ?auto_21152 ?auto_21168 ) ) ( not ( = ?auto_21152 ?auto_21169 ) ) ( not ( = ?auto_21152 ?auto_21163 ) ) ( not ( = ?auto_21152 ?auto_21170 ) ) ( not ( = ?auto_21152 ?auto_21180 ) ) ( not ( = ?auto_21152 ?auto_21165 ) ) ( not ( = ?auto_21152 ?auto_21177 ) ) ( not ( = ?auto_21152 ?auto_21161 ) ) ( not ( = ?auto_21152 ?auto_21166 ) ) ( not ( = ?auto_21179 ?auto_21168 ) ) ( not ( = ?auto_21179 ?auto_21169 ) ) ( not ( = ?auto_21179 ?auto_21163 ) ) ( not ( = ?auto_21179 ?auto_21170 ) ) ( not ( = ?auto_21179 ?auto_21180 ) ) ( not ( = ?auto_21179 ?auto_21165 ) ) ( not ( = ?auto_21179 ?auto_21177 ) ) ( not ( = ?auto_21179 ?auto_21161 ) ) ( not ( = ?auto_21179 ?auto_21166 ) ) ( not ( = ?auto_21142 ?auto_21153 ) ) ( not ( = ?auto_21142 ?auto_21175 ) ) ( not ( = ?auto_21143 ?auto_21153 ) ) ( not ( = ?auto_21143 ?auto_21175 ) ) ( not ( = ?auto_21144 ?auto_21153 ) ) ( not ( = ?auto_21144 ?auto_21175 ) ) ( not ( = ?auto_21145 ?auto_21153 ) ) ( not ( = ?auto_21145 ?auto_21175 ) ) ( not ( = ?auto_21146 ?auto_21153 ) ) ( not ( = ?auto_21146 ?auto_21175 ) ) ( not ( = ?auto_21147 ?auto_21153 ) ) ( not ( = ?auto_21147 ?auto_21175 ) ) ( not ( = ?auto_21148 ?auto_21153 ) ) ( not ( = ?auto_21148 ?auto_21175 ) ) ( not ( = ?auto_21151 ?auto_21153 ) ) ( not ( = ?auto_21151 ?auto_21175 ) ) ( not ( = ?auto_21150 ?auto_21153 ) ) ( not ( = ?auto_21150 ?auto_21175 ) ) ( not ( = ?auto_21149 ?auto_21153 ) ) ( not ( = ?auto_21149 ?auto_21175 ) ) ( not ( = ?auto_21153 ?auto_21179 ) ) ( not ( = ?auto_21153 ?auto_21168 ) ) ( not ( = ?auto_21153 ?auto_21169 ) ) ( not ( = ?auto_21153 ?auto_21163 ) ) ( not ( = ?auto_21153 ?auto_21170 ) ) ( not ( = ?auto_21153 ?auto_21180 ) ) ( not ( = ?auto_21153 ?auto_21165 ) ) ( not ( = ?auto_21153 ?auto_21177 ) ) ( not ( = ?auto_21153 ?auto_21161 ) ) ( not ( = ?auto_21153 ?auto_21166 ) ) ( not ( = ?auto_21175 ?auto_21179 ) ) ( not ( = ?auto_21175 ?auto_21168 ) ) ( not ( = ?auto_21175 ?auto_21169 ) ) ( not ( = ?auto_21175 ?auto_21163 ) ) ( not ( = ?auto_21175 ?auto_21170 ) ) ( not ( = ?auto_21175 ?auto_21180 ) ) ( not ( = ?auto_21175 ?auto_21165 ) ) ( not ( = ?auto_21175 ?auto_21177 ) ) ( not ( = ?auto_21175 ?auto_21161 ) ) ( not ( = ?auto_21175 ?auto_21166 ) ) ( not ( = ?auto_21142 ?auto_21154 ) ) ( not ( = ?auto_21142 ?auto_21160 ) ) ( not ( = ?auto_21143 ?auto_21154 ) ) ( not ( = ?auto_21143 ?auto_21160 ) ) ( not ( = ?auto_21144 ?auto_21154 ) ) ( not ( = ?auto_21144 ?auto_21160 ) ) ( not ( = ?auto_21145 ?auto_21154 ) ) ( not ( = ?auto_21145 ?auto_21160 ) ) ( not ( = ?auto_21146 ?auto_21154 ) ) ( not ( = ?auto_21146 ?auto_21160 ) ) ( not ( = ?auto_21147 ?auto_21154 ) ) ( not ( = ?auto_21147 ?auto_21160 ) ) ( not ( = ?auto_21148 ?auto_21154 ) ) ( not ( = ?auto_21148 ?auto_21160 ) ) ( not ( = ?auto_21151 ?auto_21154 ) ) ( not ( = ?auto_21151 ?auto_21160 ) ) ( not ( = ?auto_21150 ?auto_21154 ) ) ( not ( = ?auto_21150 ?auto_21160 ) ) ( not ( = ?auto_21149 ?auto_21154 ) ) ( not ( = ?auto_21149 ?auto_21160 ) ) ( not ( = ?auto_21152 ?auto_21154 ) ) ( not ( = ?auto_21152 ?auto_21160 ) ) ( not ( = ?auto_21154 ?auto_21175 ) ) ( not ( = ?auto_21154 ?auto_21179 ) ) ( not ( = ?auto_21154 ?auto_21168 ) ) ( not ( = ?auto_21154 ?auto_21169 ) ) ( not ( = ?auto_21154 ?auto_21163 ) ) ( not ( = ?auto_21154 ?auto_21170 ) ) ( not ( = ?auto_21154 ?auto_21180 ) ) ( not ( = ?auto_21154 ?auto_21165 ) ) ( not ( = ?auto_21154 ?auto_21177 ) ) ( not ( = ?auto_21154 ?auto_21161 ) ) ( not ( = ?auto_21154 ?auto_21166 ) ) ( not ( = ?auto_21160 ?auto_21175 ) ) ( not ( = ?auto_21160 ?auto_21179 ) ) ( not ( = ?auto_21160 ?auto_21168 ) ) ( not ( = ?auto_21160 ?auto_21169 ) ) ( not ( = ?auto_21160 ?auto_21163 ) ) ( not ( = ?auto_21160 ?auto_21170 ) ) ( not ( = ?auto_21160 ?auto_21180 ) ) ( not ( = ?auto_21160 ?auto_21165 ) ) ( not ( = ?auto_21160 ?auto_21177 ) ) ( not ( = ?auto_21160 ?auto_21161 ) ) ( not ( = ?auto_21160 ?auto_21166 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_21142 ?auto_21143 ?auto_21144 ?auto_21145 ?auto_21146 ?auto_21147 ?auto_21148 ?auto_21151 ?auto_21150 ?auto_21149 ?auto_21152 ?auto_21153 )
      ( MAKE-1CRATE ?auto_21153 ?auto_21154 )
      ( MAKE-12CRATE-VERIFY ?auto_21142 ?auto_21143 ?auto_21144 ?auto_21145 ?auto_21146 ?auto_21147 ?auto_21148 ?auto_21151 ?auto_21150 ?auto_21149 ?auto_21152 ?auto_21153 ?auto_21154 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21184 - SURFACE
      ?auto_21185 - SURFACE
    )
    :vars
    (
      ?auto_21186 - HOIST
      ?auto_21187 - PLACE
      ?auto_21189 - PLACE
      ?auto_21190 - HOIST
      ?auto_21191 - SURFACE
      ?auto_21188 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21186 ?auto_21187 ) ( SURFACE-AT ?auto_21184 ?auto_21187 ) ( CLEAR ?auto_21184 ) ( IS-CRATE ?auto_21185 ) ( AVAILABLE ?auto_21186 ) ( not ( = ?auto_21189 ?auto_21187 ) ) ( HOIST-AT ?auto_21190 ?auto_21189 ) ( AVAILABLE ?auto_21190 ) ( SURFACE-AT ?auto_21185 ?auto_21189 ) ( ON ?auto_21185 ?auto_21191 ) ( CLEAR ?auto_21185 ) ( TRUCK-AT ?auto_21188 ?auto_21187 ) ( not ( = ?auto_21184 ?auto_21185 ) ) ( not ( = ?auto_21184 ?auto_21191 ) ) ( not ( = ?auto_21185 ?auto_21191 ) ) ( not ( = ?auto_21186 ?auto_21190 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21188 ?auto_21187 ?auto_21189 )
      ( !LIFT ?auto_21190 ?auto_21185 ?auto_21191 ?auto_21189 )
      ( !LOAD ?auto_21190 ?auto_21185 ?auto_21188 ?auto_21189 )
      ( !DRIVE ?auto_21188 ?auto_21189 ?auto_21187 )
      ( !UNLOAD ?auto_21186 ?auto_21185 ?auto_21188 ?auto_21187 )
      ( !DROP ?auto_21186 ?auto_21185 ?auto_21184 ?auto_21187 )
      ( MAKE-1CRATE-VERIFY ?auto_21184 ?auto_21185 ) )
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
      ?auto_21215 - SURFACE
      ?auto_21214 - SURFACE
      ?auto_21213 - SURFACE
      ?auto_21216 - SURFACE
      ?auto_21217 - SURFACE
      ?auto_21218 - SURFACE
      ?auto_21219 - SURFACE
    )
    :vars
    (
      ?auto_21223 - HOIST
      ?auto_21221 - PLACE
      ?auto_21222 - PLACE
      ?auto_21220 - HOIST
      ?auto_21224 - SURFACE
      ?auto_21238 - PLACE
      ?auto_21237 - HOIST
      ?auto_21228 - SURFACE
      ?auto_21235 - SURFACE
      ?auto_21243 - PLACE
      ?auto_21244 - HOIST
      ?auto_21249 - SURFACE
      ?auto_21231 - SURFACE
      ?auto_21236 - PLACE
      ?auto_21227 - HOIST
      ?auto_21242 - SURFACE
      ?auto_21247 - SURFACE
      ?auto_21248 - SURFACE
      ?auto_21229 - PLACE
      ?auto_21245 - HOIST
      ?auto_21232 - SURFACE
      ?auto_21241 - PLACE
      ?auto_21240 - HOIST
      ?auto_21233 - SURFACE
      ?auto_21226 - SURFACE
      ?auto_21239 - PLACE
      ?auto_21234 - HOIST
      ?auto_21230 - SURFACE
      ?auto_21246 - SURFACE
      ?auto_21225 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21223 ?auto_21221 ) ( IS-CRATE ?auto_21219 ) ( not ( = ?auto_21222 ?auto_21221 ) ) ( HOIST-AT ?auto_21220 ?auto_21222 ) ( AVAILABLE ?auto_21220 ) ( SURFACE-AT ?auto_21219 ?auto_21222 ) ( ON ?auto_21219 ?auto_21224 ) ( CLEAR ?auto_21219 ) ( not ( = ?auto_21218 ?auto_21219 ) ) ( not ( = ?auto_21218 ?auto_21224 ) ) ( not ( = ?auto_21219 ?auto_21224 ) ) ( not ( = ?auto_21223 ?auto_21220 ) ) ( IS-CRATE ?auto_21218 ) ( not ( = ?auto_21238 ?auto_21221 ) ) ( HOIST-AT ?auto_21237 ?auto_21238 ) ( SURFACE-AT ?auto_21218 ?auto_21238 ) ( ON ?auto_21218 ?auto_21228 ) ( CLEAR ?auto_21218 ) ( not ( = ?auto_21217 ?auto_21218 ) ) ( not ( = ?auto_21217 ?auto_21228 ) ) ( not ( = ?auto_21218 ?auto_21228 ) ) ( not ( = ?auto_21223 ?auto_21237 ) ) ( IS-CRATE ?auto_21217 ) ( SURFACE-AT ?auto_21217 ?auto_21238 ) ( ON ?auto_21217 ?auto_21235 ) ( CLEAR ?auto_21217 ) ( not ( = ?auto_21216 ?auto_21217 ) ) ( not ( = ?auto_21216 ?auto_21235 ) ) ( not ( = ?auto_21217 ?auto_21235 ) ) ( IS-CRATE ?auto_21216 ) ( not ( = ?auto_21243 ?auto_21221 ) ) ( HOIST-AT ?auto_21244 ?auto_21243 ) ( SURFACE-AT ?auto_21216 ?auto_21243 ) ( ON ?auto_21216 ?auto_21249 ) ( CLEAR ?auto_21216 ) ( not ( = ?auto_21213 ?auto_21216 ) ) ( not ( = ?auto_21213 ?auto_21249 ) ) ( not ( = ?auto_21216 ?auto_21249 ) ) ( not ( = ?auto_21223 ?auto_21244 ) ) ( IS-CRATE ?auto_21213 ) ( SURFACE-AT ?auto_21213 ?auto_21238 ) ( ON ?auto_21213 ?auto_21231 ) ( CLEAR ?auto_21213 ) ( not ( = ?auto_21214 ?auto_21213 ) ) ( not ( = ?auto_21214 ?auto_21231 ) ) ( not ( = ?auto_21213 ?auto_21231 ) ) ( IS-CRATE ?auto_21214 ) ( not ( = ?auto_21236 ?auto_21221 ) ) ( HOIST-AT ?auto_21227 ?auto_21236 ) ( SURFACE-AT ?auto_21214 ?auto_21236 ) ( ON ?auto_21214 ?auto_21242 ) ( CLEAR ?auto_21214 ) ( not ( = ?auto_21215 ?auto_21214 ) ) ( not ( = ?auto_21215 ?auto_21242 ) ) ( not ( = ?auto_21214 ?auto_21242 ) ) ( not ( = ?auto_21223 ?auto_21227 ) ) ( IS-CRATE ?auto_21215 ) ( AVAILABLE ?auto_21237 ) ( SURFACE-AT ?auto_21215 ?auto_21238 ) ( ON ?auto_21215 ?auto_21247 ) ( CLEAR ?auto_21215 ) ( not ( = ?auto_21212 ?auto_21215 ) ) ( not ( = ?auto_21212 ?auto_21247 ) ) ( not ( = ?auto_21215 ?auto_21247 ) ) ( IS-CRATE ?auto_21212 ) ( SURFACE-AT ?auto_21212 ?auto_21236 ) ( ON ?auto_21212 ?auto_21248 ) ( CLEAR ?auto_21212 ) ( not ( = ?auto_21211 ?auto_21212 ) ) ( not ( = ?auto_21211 ?auto_21248 ) ) ( not ( = ?auto_21212 ?auto_21248 ) ) ( IS-CRATE ?auto_21211 ) ( not ( = ?auto_21229 ?auto_21221 ) ) ( HOIST-AT ?auto_21245 ?auto_21229 ) ( AVAILABLE ?auto_21245 ) ( SURFACE-AT ?auto_21211 ?auto_21229 ) ( ON ?auto_21211 ?auto_21232 ) ( CLEAR ?auto_21211 ) ( not ( = ?auto_21210 ?auto_21211 ) ) ( not ( = ?auto_21210 ?auto_21232 ) ) ( not ( = ?auto_21211 ?auto_21232 ) ) ( not ( = ?auto_21223 ?auto_21245 ) ) ( IS-CRATE ?auto_21210 ) ( not ( = ?auto_21241 ?auto_21221 ) ) ( HOIST-AT ?auto_21240 ?auto_21241 ) ( AVAILABLE ?auto_21240 ) ( SURFACE-AT ?auto_21210 ?auto_21241 ) ( ON ?auto_21210 ?auto_21233 ) ( CLEAR ?auto_21210 ) ( not ( = ?auto_21209 ?auto_21210 ) ) ( not ( = ?auto_21209 ?auto_21233 ) ) ( not ( = ?auto_21210 ?auto_21233 ) ) ( not ( = ?auto_21223 ?auto_21240 ) ) ( IS-CRATE ?auto_21209 ) ( AVAILABLE ?auto_21244 ) ( SURFACE-AT ?auto_21209 ?auto_21243 ) ( ON ?auto_21209 ?auto_21226 ) ( CLEAR ?auto_21209 ) ( not ( = ?auto_21208 ?auto_21209 ) ) ( not ( = ?auto_21208 ?auto_21226 ) ) ( not ( = ?auto_21209 ?auto_21226 ) ) ( IS-CRATE ?auto_21208 ) ( not ( = ?auto_21239 ?auto_21221 ) ) ( HOIST-AT ?auto_21234 ?auto_21239 ) ( AVAILABLE ?auto_21234 ) ( SURFACE-AT ?auto_21208 ?auto_21239 ) ( ON ?auto_21208 ?auto_21230 ) ( CLEAR ?auto_21208 ) ( not ( = ?auto_21207 ?auto_21208 ) ) ( not ( = ?auto_21207 ?auto_21230 ) ) ( not ( = ?auto_21208 ?auto_21230 ) ) ( not ( = ?auto_21223 ?auto_21234 ) ) ( SURFACE-AT ?auto_21206 ?auto_21221 ) ( CLEAR ?auto_21206 ) ( IS-CRATE ?auto_21207 ) ( AVAILABLE ?auto_21223 ) ( AVAILABLE ?auto_21227 ) ( SURFACE-AT ?auto_21207 ?auto_21236 ) ( ON ?auto_21207 ?auto_21246 ) ( CLEAR ?auto_21207 ) ( TRUCK-AT ?auto_21225 ?auto_21221 ) ( not ( = ?auto_21206 ?auto_21207 ) ) ( not ( = ?auto_21206 ?auto_21246 ) ) ( not ( = ?auto_21207 ?auto_21246 ) ) ( not ( = ?auto_21206 ?auto_21208 ) ) ( not ( = ?auto_21206 ?auto_21230 ) ) ( not ( = ?auto_21208 ?auto_21246 ) ) ( not ( = ?auto_21239 ?auto_21236 ) ) ( not ( = ?auto_21234 ?auto_21227 ) ) ( not ( = ?auto_21230 ?auto_21246 ) ) ( not ( = ?auto_21206 ?auto_21209 ) ) ( not ( = ?auto_21206 ?auto_21226 ) ) ( not ( = ?auto_21207 ?auto_21209 ) ) ( not ( = ?auto_21207 ?auto_21226 ) ) ( not ( = ?auto_21209 ?auto_21230 ) ) ( not ( = ?auto_21209 ?auto_21246 ) ) ( not ( = ?auto_21243 ?auto_21239 ) ) ( not ( = ?auto_21243 ?auto_21236 ) ) ( not ( = ?auto_21244 ?auto_21234 ) ) ( not ( = ?auto_21244 ?auto_21227 ) ) ( not ( = ?auto_21226 ?auto_21230 ) ) ( not ( = ?auto_21226 ?auto_21246 ) ) ( not ( = ?auto_21206 ?auto_21210 ) ) ( not ( = ?auto_21206 ?auto_21233 ) ) ( not ( = ?auto_21207 ?auto_21210 ) ) ( not ( = ?auto_21207 ?auto_21233 ) ) ( not ( = ?auto_21208 ?auto_21210 ) ) ( not ( = ?auto_21208 ?auto_21233 ) ) ( not ( = ?auto_21210 ?auto_21226 ) ) ( not ( = ?auto_21210 ?auto_21230 ) ) ( not ( = ?auto_21210 ?auto_21246 ) ) ( not ( = ?auto_21241 ?auto_21243 ) ) ( not ( = ?auto_21241 ?auto_21239 ) ) ( not ( = ?auto_21241 ?auto_21236 ) ) ( not ( = ?auto_21240 ?auto_21244 ) ) ( not ( = ?auto_21240 ?auto_21234 ) ) ( not ( = ?auto_21240 ?auto_21227 ) ) ( not ( = ?auto_21233 ?auto_21226 ) ) ( not ( = ?auto_21233 ?auto_21230 ) ) ( not ( = ?auto_21233 ?auto_21246 ) ) ( not ( = ?auto_21206 ?auto_21211 ) ) ( not ( = ?auto_21206 ?auto_21232 ) ) ( not ( = ?auto_21207 ?auto_21211 ) ) ( not ( = ?auto_21207 ?auto_21232 ) ) ( not ( = ?auto_21208 ?auto_21211 ) ) ( not ( = ?auto_21208 ?auto_21232 ) ) ( not ( = ?auto_21209 ?auto_21211 ) ) ( not ( = ?auto_21209 ?auto_21232 ) ) ( not ( = ?auto_21211 ?auto_21233 ) ) ( not ( = ?auto_21211 ?auto_21226 ) ) ( not ( = ?auto_21211 ?auto_21230 ) ) ( not ( = ?auto_21211 ?auto_21246 ) ) ( not ( = ?auto_21229 ?auto_21241 ) ) ( not ( = ?auto_21229 ?auto_21243 ) ) ( not ( = ?auto_21229 ?auto_21239 ) ) ( not ( = ?auto_21229 ?auto_21236 ) ) ( not ( = ?auto_21245 ?auto_21240 ) ) ( not ( = ?auto_21245 ?auto_21244 ) ) ( not ( = ?auto_21245 ?auto_21234 ) ) ( not ( = ?auto_21245 ?auto_21227 ) ) ( not ( = ?auto_21232 ?auto_21233 ) ) ( not ( = ?auto_21232 ?auto_21226 ) ) ( not ( = ?auto_21232 ?auto_21230 ) ) ( not ( = ?auto_21232 ?auto_21246 ) ) ( not ( = ?auto_21206 ?auto_21212 ) ) ( not ( = ?auto_21206 ?auto_21248 ) ) ( not ( = ?auto_21207 ?auto_21212 ) ) ( not ( = ?auto_21207 ?auto_21248 ) ) ( not ( = ?auto_21208 ?auto_21212 ) ) ( not ( = ?auto_21208 ?auto_21248 ) ) ( not ( = ?auto_21209 ?auto_21212 ) ) ( not ( = ?auto_21209 ?auto_21248 ) ) ( not ( = ?auto_21210 ?auto_21212 ) ) ( not ( = ?auto_21210 ?auto_21248 ) ) ( not ( = ?auto_21212 ?auto_21232 ) ) ( not ( = ?auto_21212 ?auto_21233 ) ) ( not ( = ?auto_21212 ?auto_21226 ) ) ( not ( = ?auto_21212 ?auto_21230 ) ) ( not ( = ?auto_21212 ?auto_21246 ) ) ( not ( = ?auto_21248 ?auto_21232 ) ) ( not ( = ?auto_21248 ?auto_21233 ) ) ( not ( = ?auto_21248 ?auto_21226 ) ) ( not ( = ?auto_21248 ?auto_21230 ) ) ( not ( = ?auto_21248 ?auto_21246 ) ) ( not ( = ?auto_21206 ?auto_21215 ) ) ( not ( = ?auto_21206 ?auto_21247 ) ) ( not ( = ?auto_21207 ?auto_21215 ) ) ( not ( = ?auto_21207 ?auto_21247 ) ) ( not ( = ?auto_21208 ?auto_21215 ) ) ( not ( = ?auto_21208 ?auto_21247 ) ) ( not ( = ?auto_21209 ?auto_21215 ) ) ( not ( = ?auto_21209 ?auto_21247 ) ) ( not ( = ?auto_21210 ?auto_21215 ) ) ( not ( = ?auto_21210 ?auto_21247 ) ) ( not ( = ?auto_21211 ?auto_21215 ) ) ( not ( = ?auto_21211 ?auto_21247 ) ) ( not ( = ?auto_21215 ?auto_21248 ) ) ( not ( = ?auto_21215 ?auto_21232 ) ) ( not ( = ?auto_21215 ?auto_21233 ) ) ( not ( = ?auto_21215 ?auto_21226 ) ) ( not ( = ?auto_21215 ?auto_21230 ) ) ( not ( = ?auto_21215 ?auto_21246 ) ) ( not ( = ?auto_21238 ?auto_21236 ) ) ( not ( = ?auto_21238 ?auto_21229 ) ) ( not ( = ?auto_21238 ?auto_21241 ) ) ( not ( = ?auto_21238 ?auto_21243 ) ) ( not ( = ?auto_21238 ?auto_21239 ) ) ( not ( = ?auto_21237 ?auto_21227 ) ) ( not ( = ?auto_21237 ?auto_21245 ) ) ( not ( = ?auto_21237 ?auto_21240 ) ) ( not ( = ?auto_21237 ?auto_21244 ) ) ( not ( = ?auto_21237 ?auto_21234 ) ) ( not ( = ?auto_21247 ?auto_21248 ) ) ( not ( = ?auto_21247 ?auto_21232 ) ) ( not ( = ?auto_21247 ?auto_21233 ) ) ( not ( = ?auto_21247 ?auto_21226 ) ) ( not ( = ?auto_21247 ?auto_21230 ) ) ( not ( = ?auto_21247 ?auto_21246 ) ) ( not ( = ?auto_21206 ?auto_21214 ) ) ( not ( = ?auto_21206 ?auto_21242 ) ) ( not ( = ?auto_21207 ?auto_21214 ) ) ( not ( = ?auto_21207 ?auto_21242 ) ) ( not ( = ?auto_21208 ?auto_21214 ) ) ( not ( = ?auto_21208 ?auto_21242 ) ) ( not ( = ?auto_21209 ?auto_21214 ) ) ( not ( = ?auto_21209 ?auto_21242 ) ) ( not ( = ?auto_21210 ?auto_21214 ) ) ( not ( = ?auto_21210 ?auto_21242 ) ) ( not ( = ?auto_21211 ?auto_21214 ) ) ( not ( = ?auto_21211 ?auto_21242 ) ) ( not ( = ?auto_21212 ?auto_21214 ) ) ( not ( = ?auto_21212 ?auto_21242 ) ) ( not ( = ?auto_21214 ?auto_21247 ) ) ( not ( = ?auto_21214 ?auto_21248 ) ) ( not ( = ?auto_21214 ?auto_21232 ) ) ( not ( = ?auto_21214 ?auto_21233 ) ) ( not ( = ?auto_21214 ?auto_21226 ) ) ( not ( = ?auto_21214 ?auto_21230 ) ) ( not ( = ?auto_21214 ?auto_21246 ) ) ( not ( = ?auto_21242 ?auto_21247 ) ) ( not ( = ?auto_21242 ?auto_21248 ) ) ( not ( = ?auto_21242 ?auto_21232 ) ) ( not ( = ?auto_21242 ?auto_21233 ) ) ( not ( = ?auto_21242 ?auto_21226 ) ) ( not ( = ?auto_21242 ?auto_21230 ) ) ( not ( = ?auto_21242 ?auto_21246 ) ) ( not ( = ?auto_21206 ?auto_21213 ) ) ( not ( = ?auto_21206 ?auto_21231 ) ) ( not ( = ?auto_21207 ?auto_21213 ) ) ( not ( = ?auto_21207 ?auto_21231 ) ) ( not ( = ?auto_21208 ?auto_21213 ) ) ( not ( = ?auto_21208 ?auto_21231 ) ) ( not ( = ?auto_21209 ?auto_21213 ) ) ( not ( = ?auto_21209 ?auto_21231 ) ) ( not ( = ?auto_21210 ?auto_21213 ) ) ( not ( = ?auto_21210 ?auto_21231 ) ) ( not ( = ?auto_21211 ?auto_21213 ) ) ( not ( = ?auto_21211 ?auto_21231 ) ) ( not ( = ?auto_21212 ?auto_21213 ) ) ( not ( = ?auto_21212 ?auto_21231 ) ) ( not ( = ?auto_21215 ?auto_21213 ) ) ( not ( = ?auto_21215 ?auto_21231 ) ) ( not ( = ?auto_21213 ?auto_21242 ) ) ( not ( = ?auto_21213 ?auto_21247 ) ) ( not ( = ?auto_21213 ?auto_21248 ) ) ( not ( = ?auto_21213 ?auto_21232 ) ) ( not ( = ?auto_21213 ?auto_21233 ) ) ( not ( = ?auto_21213 ?auto_21226 ) ) ( not ( = ?auto_21213 ?auto_21230 ) ) ( not ( = ?auto_21213 ?auto_21246 ) ) ( not ( = ?auto_21231 ?auto_21242 ) ) ( not ( = ?auto_21231 ?auto_21247 ) ) ( not ( = ?auto_21231 ?auto_21248 ) ) ( not ( = ?auto_21231 ?auto_21232 ) ) ( not ( = ?auto_21231 ?auto_21233 ) ) ( not ( = ?auto_21231 ?auto_21226 ) ) ( not ( = ?auto_21231 ?auto_21230 ) ) ( not ( = ?auto_21231 ?auto_21246 ) ) ( not ( = ?auto_21206 ?auto_21216 ) ) ( not ( = ?auto_21206 ?auto_21249 ) ) ( not ( = ?auto_21207 ?auto_21216 ) ) ( not ( = ?auto_21207 ?auto_21249 ) ) ( not ( = ?auto_21208 ?auto_21216 ) ) ( not ( = ?auto_21208 ?auto_21249 ) ) ( not ( = ?auto_21209 ?auto_21216 ) ) ( not ( = ?auto_21209 ?auto_21249 ) ) ( not ( = ?auto_21210 ?auto_21216 ) ) ( not ( = ?auto_21210 ?auto_21249 ) ) ( not ( = ?auto_21211 ?auto_21216 ) ) ( not ( = ?auto_21211 ?auto_21249 ) ) ( not ( = ?auto_21212 ?auto_21216 ) ) ( not ( = ?auto_21212 ?auto_21249 ) ) ( not ( = ?auto_21215 ?auto_21216 ) ) ( not ( = ?auto_21215 ?auto_21249 ) ) ( not ( = ?auto_21214 ?auto_21216 ) ) ( not ( = ?auto_21214 ?auto_21249 ) ) ( not ( = ?auto_21216 ?auto_21231 ) ) ( not ( = ?auto_21216 ?auto_21242 ) ) ( not ( = ?auto_21216 ?auto_21247 ) ) ( not ( = ?auto_21216 ?auto_21248 ) ) ( not ( = ?auto_21216 ?auto_21232 ) ) ( not ( = ?auto_21216 ?auto_21233 ) ) ( not ( = ?auto_21216 ?auto_21226 ) ) ( not ( = ?auto_21216 ?auto_21230 ) ) ( not ( = ?auto_21216 ?auto_21246 ) ) ( not ( = ?auto_21249 ?auto_21231 ) ) ( not ( = ?auto_21249 ?auto_21242 ) ) ( not ( = ?auto_21249 ?auto_21247 ) ) ( not ( = ?auto_21249 ?auto_21248 ) ) ( not ( = ?auto_21249 ?auto_21232 ) ) ( not ( = ?auto_21249 ?auto_21233 ) ) ( not ( = ?auto_21249 ?auto_21226 ) ) ( not ( = ?auto_21249 ?auto_21230 ) ) ( not ( = ?auto_21249 ?auto_21246 ) ) ( not ( = ?auto_21206 ?auto_21217 ) ) ( not ( = ?auto_21206 ?auto_21235 ) ) ( not ( = ?auto_21207 ?auto_21217 ) ) ( not ( = ?auto_21207 ?auto_21235 ) ) ( not ( = ?auto_21208 ?auto_21217 ) ) ( not ( = ?auto_21208 ?auto_21235 ) ) ( not ( = ?auto_21209 ?auto_21217 ) ) ( not ( = ?auto_21209 ?auto_21235 ) ) ( not ( = ?auto_21210 ?auto_21217 ) ) ( not ( = ?auto_21210 ?auto_21235 ) ) ( not ( = ?auto_21211 ?auto_21217 ) ) ( not ( = ?auto_21211 ?auto_21235 ) ) ( not ( = ?auto_21212 ?auto_21217 ) ) ( not ( = ?auto_21212 ?auto_21235 ) ) ( not ( = ?auto_21215 ?auto_21217 ) ) ( not ( = ?auto_21215 ?auto_21235 ) ) ( not ( = ?auto_21214 ?auto_21217 ) ) ( not ( = ?auto_21214 ?auto_21235 ) ) ( not ( = ?auto_21213 ?auto_21217 ) ) ( not ( = ?auto_21213 ?auto_21235 ) ) ( not ( = ?auto_21217 ?auto_21249 ) ) ( not ( = ?auto_21217 ?auto_21231 ) ) ( not ( = ?auto_21217 ?auto_21242 ) ) ( not ( = ?auto_21217 ?auto_21247 ) ) ( not ( = ?auto_21217 ?auto_21248 ) ) ( not ( = ?auto_21217 ?auto_21232 ) ) ( not ( = ?auto_21217 ?auto_21233 ) ) ( not ( = ?auto_21217 ?auto_21226 ) ) ( not ( = ?auto_21217 ?auto_21230 ) ) ( not ( = ?auto_21217 ?auto_21246 ) ) ( not ( = ?auto_21235 ?auto_21249 ) ) ( not ( = ?auto_21235 ?auto_21231 ) ) ( not ( = ?auto_21235 ?auto_21242 ) ) ( not ( = ?auto_21235 ?auto_21247 ) ) ( not ( = ?auto_21235 ?auto_21248 ) ) ( not ( = ?auto_21235 ?auto_21232 ) ) ( not ( = ?auto_21235 ?auto_21233 ) ) ( not ( = ?auto_21235 ?auto_21226 ) ) ( not ( = ?auto_21235 ?auto_21230 ) ) ( not ( = ?auto_21235 ?auto_21246 ) ) ( not ( = ?auto_21206 ?auto_21218 ) ) ( not ( = ?auto_21206 ?auto_21228 ) ) ( not ( = ?auto_21207 ?auto_21218 ) ) ( not ( = ?auto_21207 ?auto_21228 ) ) ( not ( = ?auto_21208 ?auto_21218 ) ) ( not ( = ?auto_21208 ?auto_21228 ) ) ( not ( = ?auto_21209 ?auto_21218 ) ) ( not ( = ?auto_21209 ?auto_21228 ) ) ( not ( = ?auto_21210 ?auto_21218 ) ) ( not ( = ?auto_21210 ?auto_21228 ) ) ( not ( = ?auto_21211 ?auto_21218 ) ) ( not ( = ?auto_21211 ?auto_21228 ) ) ( not ( = ?auto_21212 ?auto_21218 ) ) ( not ( = ?auto_21212 ?auto_21228 ) ) ( not ( = ?auto_21215 ?auto_21218 ) ) ( not ( = ?auto_21215 ?auto_21228 ) ) ( not ( = ?auto_21214 ?auto_21218 ) ) ( not ( = ?auto_21214 ?auto_21228 ) ) ( not ( = ?auto_21213 ?auto_21218 ) ) ( not ( = ?auto_21213 ?auto_21228 ) ) ( not ( = ?auto_21216 ?auto_21218 ) ) ( not ( = ?auto_21216 ?auto_21228 ) ) ( not ( = ?auto_21218 ?auto_21235 ) ) ( not ( = ?auto_21218 ?auto_21249 ) ) ( not ( = ?auto_21218 ?auto_21231 ) ) ( not ( = ?auto_21218 ?auto_21242 ) ) ( not ( = ?auto_21218 ?auto_21247 ) ) ( not ( = ?auto_21218 ?auto_21248 ) ) ( not ( = ?auto_21218 ?auto_21232 ) ) ( not ( = ?auto_21218 ?auto_21233 ) ) ( not ( = ?auto_21218 ?auto_21226 ) ) ( not ( = ?auto_21218 ?auto_21230 ) ) ( not ( = ?auto_21218 ?auto_21246 ) ) ( not ( = ?auto_21228 ?auto_21235 ) ) ( not ( = ?auto_21228 ?auto_21249 ) ) ( not ( = ?auto_21228 ?auto_21231 ) ) ( not ( = ?auto_21228 ?auto_21242 ) ) ( not ( = ?auto_21228 ?auto_21247 ) ) ( not ( = ?auto_21228 ?auto_21248 ) ) ( not ( = ?auto_21228 ?auto_21232 ) ) ( not ( = ?auto_21228 ?auto_21233 ) ) ( not ( = ?auto_21228 ?auto_21226 ) ) ( not ( = ?auto_21228 ?auto_21230 ) ) ( not ( = ?auto_21228 ?auto_21246 ) ) ( not ( = ?auto_21206 ?auto_21219 ) ) ( not ( = ?auto_21206 ?auto_21224 ) ) ( not ( = ?auto_21207 ?auto_21219 ) ) ( not ( = ?auto_21207 ?auto_21224 ) ) ( not ( = ?auto_21208 ?auto_21219 ) ) ( not ( = ?auto_21208 ?auto_21224 ) ) ( not ( = ?auto_21209 ?auto_21219 ) ) ( not ( = ?auto_21209 ?auto_21224 ) ) ( not ( = ?auto_21210 ?auto_21219 ) ) ( not ( = ?auto_21210 ?auto_21224 ) ) ( not ( = ?auto_21211 ?auto_21219 ) ) ( not ( = ?auto_21211 ?auto_21224 ) ) ( not ( = ?auto_21212 ?auto_21219 ) ) ( not ( = ?auto_21212 ?auto_21224 ) ) ( not ( = ?auto_21215 ?auto_21219 ) ) ( not ( = ?auto_21215 ?auto_21224 ) ) ( not ( = ?auto_21214 ?auto_21219 ) ) ( not ( = ?auto_21214 ?auto_21224 ) ) ( not ( = ?auto_21213 ?auto_21219 ) ) ( not ( = ?auto_21213 ?auto_21224 ) ) ( not ( = ?auto_21216 ?auto_21219 ) ) ( not ( = ?auto_21216 ?auto_21224 ) ) ( not ( = ?auto_21217 ?auto_21219 ) ) ( not ( = ?auto_21217 ?auto_21224 ) ) ( not ( = ?auto_21219 ?auto_21228 ) ) ( not ( = ?auto_21219 ?auto_21235 ) ) ( not ( = ?auto_21219 ?auto_21249 ) ) ( not ( = ?auto_21219 ?auto_21231 ) ) ( not ( = ?auto_21219 ?auto_21242 ) ) ( not ( = ?auto_21219 ?auto_21247 ) ) ( not ( = ?auto_21219 ?auto_21248 ) ) ( not ( = ?auto_21219 ?auto_21232 ) ) ( not ( = ?auto_21219 ?auto_21233 ) ) ( not ( = ?auto_21219 ?auto_21226 ) ) ( not ( = ?auto_21219 ?auto_21230 ) ) ( not ( = ?auto_21219 ?auto_21246 ) ) ( not ( = ?auto_21222 ?auto_21238 ) ) ( not ( = ?auto_21222 ?auto_21243 ) ) ( not ( = ?auto_21222 ?auto_21236 ) ) ( not ( = ?auto_21222 ?auto_21229 ) ) ( not ( = ?auto_21222 ?auto_21241 ) ) ( not ( = ?auto_21222 ?auto_21239 ) ) ( not ( = ?auto_21220 ?auto_21237 ) ) ( not ( = ?auto_21220 ?auto_21244 ) ) ( not ( = ?auto_21220 ?auto_21227 ) ) ( not ( = ?auto_21220 ?auto_21245 ) ) ( not ( = ?auto_21220 ?auto_21240 ) ) ( not ( = ?auto_21220 ?auto_21234 ) ) ( not ( = ?auto_21224 ?auto_21228 ) ) ( not ( = ?auto_21224 ?auto_21235 ) ) ( not ( = ?auto_21224 ?auto_21249 ) ) ( not ( = ?auto_21224 ?auto_21231 ) ) ( not ( = ?auto_21224 ?auto_21242 ) ) ( not ( = ?auto_21224 ?auto_21247 ) ) ( not ( = ?auto_21224 ?auto_21248 ) ) ( not ( = ?auto_21224 ?auto_21232 ) ) ( not ( = ?auto_21224 ?auto_21233 ) ) ( not ( = ?auto_21224 ?auto_21226 ) ) ( not ( = ?auto_21224 ?auto_21230 ) ) ( not ( = ?auto_21224 ?auto_21246 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_21206 ?auto_21207 ?auto_21208 ?auto_21209 ?auto_21210 ?auto_21211 ?auto_21212 ?auto_21215 ?auto_21214 ?auto_21213 ?auto_21216 ?auto_21217 ?auto_21218 )
      ( MAKE-1CRATE ?auto_21218 ?auto_21219 )
      ( MAKE-13CRATE-VERIFY ?auto_21206 ?auto_21207 ?auto_21208 ?auto_21209 ?auto_21210 ?auto_21211 ?auto_21212 ?auto_21215 ?auto_21214 ?auto_21213 ?auto_21216 ?auto_21217 ?auto_21218 ?auto_21219 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21252 - SURFACE
      ?auto_21253 - SURFACE
    )
    :vars
    (
      ?auto_21254 - HOIST
      ?auto_21255 - PLACE
      ?auto_21257 - PLACE
      ?auto_21258 - HOIST
      ?auto_21259 - SURFACE
      ?auto_21256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21254 ?auto_21255 ) ( SURFACE-AT ?auto_21252 ?auto_21255 ) ( CLEAR ?auto_21252 ) ( IS-CRATE ?auto_21253 ) ( AVAILABLE ?auto_21254 ) ( not ( = ?auto_21257 ?auto_21255 ) ) ( HOIST-AT ?auto_21258 ?auto_21257 ) ( AVAILABLE ?auto_21258 ) ( SURFACE-AT ?auto_21253 ?auto_21257 ) ( ON ?auto_21253 ?auto_21259 ) ( CLEAR ?auto_21253 ) ( TRUCK-AT ?auto_21256 ?auto_21255 ) ( not ( = ?auto_21252 ?auto_21253 ) ) ( not ( = ?auto_21252 ?auto_21259 ) ) ( not ( = ?auto_21253 ?auto_21259 ) ) ( not ( = ?auto_21254 ?auto_21258 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21256 ?auto_21255 ?auto_21257 )
      ( !LIFT ?auto_21258 ?auto_21253 ?auto_21259 ?auto_21257 )
      ( !LOAD ?auto_21258 ?auto_21253 ?auto_21256 ?auto_21257 )
      ( !DRIVE ?auto_21256 ?auto_21257 ?auto_21255 )
      ( !UNLOAD ?auto_21254 ?auto_21253 ?auto_21256 ?auto_21255 )
      ( !DROP ?auto_21254 ?auto_21253 ?auto_21252 ?auto_21255 )
      ( MAKE-1CRATE-VERIFY ?auto_21252 ?auto_21253 ) )
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
      ?auto_21284 - SURFACE
      ?auto_21283 - SURFACE
      ?auto_21282 - SURFACE
      ?auto_21285 - SURFACE
      ?auto_21286 - SURFACE
      ?auto_21287 - SURFACE
      ?auto_21288 - SURFACE
      ?auto_21289 - SURFACE
    )
    :vars
    (
      ?auto_21292 - HOIST
      ?auto_21290 - PLACE
      ?auto_21294 - PLACE
      ?auto_21295 - HOIST
      ?auto_21291 - SURFACE
      ?auto_21320 - PLACE
      ?auto_21296 - HOIST
      ?auto_21319 - SURFACE
      ?auto_21315 - PLACE
      ?auto_21304 - HOIST
      ?auto_21308 - SURFACE
      ?auto_21298 - SURFACE
      ?auto_21299 - SURFACE
      ?auto_21317 - SURFACE
      ?auto_21316 - PLACE
      ?auto_21310 - HOIST
      ?auto_21313 - SURFACE
      ?auto_21312 - SURFACE
      ?auto_21318 - SURFACE
      ?auto_21306 - PLACE
      ?auto_21300 - HOIST
      ?auto_21311 - SURFACE
      ?auto_21314 - PLACE
      ?auto_21301 - HOIST
      ?auto_21305 - SURFACE
      ?auto_21297 - SURFACE
      ?auto_21303 - PLACE
      ?auto_21302 - HOIST
      ?auto_21307 - SURFACE
      ?auto_21309 - SURFACE
      ?auto_21293 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21292 ?auto_21290 ) ( IS-CRATE ?auto_21289 ) ( not ( = ?auto_21294 ?auto_21290 ) ) ( HOIST-AT ?auto_21295 ?auto_21294 ) ( SURFACE-AT ?auto_21289 ?auto_21294 ) ( ON ?auto_21289 ?auto_21291 ) ( CLEAR ?auto_21289 ) ( not ( = ?auto_21288 ?auto_21289 ) ) ( not ( = ?auto_21288 ?auto_21291 ) ) ( not ( = ?auto_21289 ?auto_21291 ) ) ( not ( = ?auto_21292 ?auto_21295 ) ) ( IS-CRATE ?auto_21288 ) ( not ( = ?auto_21320 ?auto_21290 ) ) ( HOIST-AT ?auto_21296 ?auto_21320 ) ( AVAILABLE ?auto_21296 ) ( SURFACE-AT ?auto_21288 ?auto_21320 ) ( ON ?auto_21288 ?auto_21319 ) ( CLEAR ?auto_21288 ) ( not ( = ?auto_21287 ?auto_21288 ) ) ( not ( = ?auto_21287 ?auto_21319 ) ) ( not ( = ?auto_21288 ?auto_21319 ) ) ( not ( = ?auto_21292 ?auto_21296 ) ) ( IS-CRATE ?auto_21287 ) ( not ( = ?auto_21315 ?auto_21290 ) ) ( HOIST-AT ?auto_21304 ?auto_21315 ) ( SURFACE-AT ?auto_21287 ?auto_21315 ) ( ON ?auto_21287 ?auto_21308 ) ( CLEAR ?auto_21287 ) ( not ( = ?auto_21286 ?auto_21287 ) ) ( not ( = ?auto_21286 ?auto_21308 ) ) ( not ( = ?auto_21287 ?auto_21308 ) ) ( not ( = ?auto_21292 ?auto_21304 ) ) ( IS-CRATE ?auto_21286 ) ( SURFACE-AT ?auto_21286 ?auto_21315 ) ( ON ?auto_21286 ?auto_21298 ) ( CLEAR ?auto_21286 ) ( not ( = ?auto_21285 ?auto_21286 ) ) ( not ( = ?auto_21285 ?auto_21298 ) ) ( not ( = ?auto_21286 ?auto_21298 ) ) ( IS-CRATE ?auto_21285 ) ( SURFACE-AT ?auto_21285 ?auto_21294 ) ( ON ?auto_21285 ?auto_21299 ) ( CLEAR ?auto_21285 ) ( not ( = ?auto_21282 ?auto_21285 ) ) ( not ( = ?auto_21282 ?auto_21299 ) ) ( not ( = ?auto_21285 ?auto_21299 ) ) ( IS-CRATE ?auto_21282 ) ( SURFACE-AT ?auto_21282 ?auto_21315 ) ( ON ?auto_21282 ?auto_21317 ) ( CLEAR ?auto_21282 ) ( not ( = ?auto_21283 ?auto_21282 ) ) ( not ( = ?auto_21283 ?auto_21317 ) ) ( not ( = ?auto_21282 ?auto_21317 ) ) ( IS-CRATE ?auto_21283 ) ( not ( = ?auto_21316 ?auto_21290 ) ) ( HOIST-AT ?auto_21310 ?auto_21316 ) ( SURFACE-AT ?auto_21283 ?auto_21316 ) ( ON ?auto_21283 ?auto_21313 ) ( CLEAR ?auto_21283 ) ( not ( = ?auto_21284 ?auto_21283 ) ) ( not ( = ?auto_21284 ?auto_21313 ) ) ( not ( = ?auto_21283 ?auto_21313 ) ) ( not ( = ?auto_21292 ?auto_21310 ) ) ( IS-CRATE ?auto_21284 ) ( AVAILABLE ?auto_21304 ) ( SURFACE-AT ?auto_21284 ?auto_21315 ) ( ON ?auto_21284 ?auto_21312 ) ( CLEAR ?auto_21284 ) ( not ( = ?auto_21281 ?auto_21284 ) ) ( not ( = ?auto_21281 ?auto_21312 ) ) ( not ( = ?auto_21284 ?auto_21312 ) ) ( IS-CRATE ?auto_21281 ) ( SURFACE-AT ?auto_21281 ?auto_21316 ) ( ON ?auto_21281 ?auto_21318 ) ( CLEAR ?auto_21281 ) ( not ( = ?auto_21280 ?auto_21281 ) ) ( not ( = ?auto_21280 ?auto_21318 ) ) ( not ( = ?auto_21281 ?auto_21318 ) ) ( IS-CRATE ?auto_21280 ) ( not ( = ?auto_21306 ?auto_21290 ) ) ( HOIST-AT ?auto_21300 ?auto_21306 ) ( AVAILABLE ?auto_21300 ) ( SURFACE-AT ?auto_21280 ?auto_21306 ) ( ON ?auto_21280 ?auto_21311 ) ( CLEAR ?auto_21280 ) ( not ( = ?auto_21279 ?auto_21280 ) ) ( not ( = ?auto_21279 ?auto_21311 ) ) ( not ( = ?auto_21280 ?auto_21311 ) ) ( not ( = ?auto_21292 ?auto_21300 ) ) ( IS-CRATE ?auto_21279 ) ( not ( = ?auto_21314 ?auto_21290 ) ) ( HOIST-AT ?auto_21301 ?auto_21314 ) ( AVAILABLE ?auto_21301 ) ( SURFACE-AT ?auto_21279 ?auto_21314 ) ( ON ?auto_21279 ?auto_21305 ) ( CLEAR ?auto_21279 ) ( not ( = ?auto_21278 ?auto_21279 ) ) ( not ( = ?auto_21278 ?auto_21305 ) ) ( not ( = ?auto_21279 ?auto_21305 ) ) ( not ( = ?auto_21292 ?auto_21301 ) ) ( IS-CRATE ?auto_21278 ) ( AVAILABLE ?auto_21295 ) ( SURFACE-AT ?auto_21278 ?auto_21294 ) ( ON ?auto_21278 ?auto_21297 ) ( CLEAR ?auto_21278 ) ( not ( = ?auto_21277 ?auto_21278 ) ) ( not ( = ?auto_21277 ?auto_21297 ) ) ( not ( = ?auto_21278 ?auto_21297 ) ) ( IS-CRATE ?auto_21277 ) ( not ( = ?auto_21303 ?auto_21290 ) ) ( HOIST-AT ?auto_21302 ?auto_21303 ) ( AVAILABLE ?auto_21302 ) ( SURFACE-AT ?auto_21277 ?auto_21303 ) ( ON ?auto_21277 ?auto_21307 ) ( CLEAR ?auto_21277 ) ( not ( = ?auto_21276 ?auto_21277 ) ) ( not ( = ?auto_21276 ?auto_21307 ) ) ( not ( = ?auto_21277 ?auto_21307 ) ) ( not ( = ?auto_21292 ?auto_21302 ) ) ( SURFACE-AT ?auto_21275 ?auto_21290 ) ( CLEAR ?auto_21275 ) ( IS-CRATE ?auto_21276 ) ( AVAILABLE ?auto_21292 ) ( AVAILABLE ?auto_21310 ) ( SURFACE-AT ?auto_21276 ?auto_21316 ) ( ON ?auto_21276 ?auto_21309 ) ( CLEAR ?auto_21276 ) ( TRUCK-AT ?auto_21293 ?auto_21290 ) ( not ( = ?auto_21275 ?auto_21276 ) ) ( not ( = ?auto_21275 ?auto_21309 ) ) ( not ( = ?auto_21276 ?auto_21309 ) ) ( not ( = ?auto_21275 ?auto_21277 ) ) ( not ( = ?auto_21275 ?auto_21307 ) ) ( not ( = ?auto_21277 ?auto_21309 ) ) ( not ( = ?auto_21303 ?auto_21316 ) ) ( not ( = ?auto_21302 ?auto_21310 ) ) ( not ( = ?auto_21307 ?auto_21309 ) ) ( not ( = ?auto_21275 ?auto_21278 ) ) ( not ( = ?auto_21275 ?auto_21297 ) ) ( not ( = ?auto_21276 ?auto_21278 ) ) ( not ( = ?auto_21276 ?auto_21297 ) ) ( not ( = ?auto_21278 ?auto_21307 ) ) ( not ( = ?auto_21278 ?auto_21309 ) ) ( not ( = ?auto_21294 ?auto_21303 ) ) ( not ( = ?auto_21294 ?auto_21316 ) ) ( not ( = ?auto_21295 ?auto_21302 ) ) ( not ( = ?auto_21295 ?auto_21310 ) ) ( not ( = ?auto_21297 ?auto_21307 ) ) ( not ( = ?auto_21297 ?auto_21309 ) ) ( not ( = ?auto_21275 ?auto_21279 ) ) ( not ( = ?auto_21275 ?auto_21305 ) ) ( not ( = ?auto_21276 ?auto_21279 ) ) ( not ( = ?auto_21276 ?auto_21305 ) ) ( not ( = ?auto_21277 ?auto_21279 ) ) ( not ( = ?auto_21277 ?auto_21305 ) ) ( not ( = ?auto_21279 ?auto_21297 ) ) ( not ( = ?auto_21279 ?auto_21307 ) ) ( not ( = ?auto_21279 ?auto_21309 ) ) ( not ( = ?auto_21314 ?auto_21294 ) ) ( not ( = ?auto_21314 ?auto_21303 ) ) ( not ( = ?auto_21314 ?auto_21316 ) ) ( not ( = ?auto_21301 ?auto_21295 ) ) ( not ( = ?auto_21301 ?auto_21302 ) ) ( not ( = ?auto_21301 ?auto_21310 ) ) ( not ( = ?auto_21305 ?auto_21297 ) ) ( not ( = ?auto_21305 ?auto_21307 ) ) ( not ( = ?auto_21305 ?auto_21309 ) ) ( not ( = ?auto_21275 ?auto_21280 ) ) ( not ( = ?auto_21275 ?auto_21311 ) ) ( not ( = ?auto_21276 ?auto_21280 ) ) ( not ( = ?auto_21276 ?auto_21311 ) ) ( not ( = ?auto_21277 ?auto_21280 ) ) ( not ( = ?auto_21277 ?auto_21311 ) ) ( not ( = ?auto_21278 ?auto_21280 ) ) ( not ( = ?auto_21278 ?auto_21311 ) ) ( not ( = ?auto_21280 ?auto_21305 ) ) ( not ( = ?auto_21280 ?auto_21297 ) ) ( not ( = ?auto_21280 ?auto_21307 ) ) ( not ( = ?auto_21280 ?auto_21309 ) ) ( not ( = ?auto_21306 ?auto_21314 ) ) ( not ( = ?auto_21306 ?auto_21294 ) ) ( not ( = ?auto_21306 ?auto_21303 ) ) ( not ( = ?auto_21306 ?auto_21316 ) ) ( not ( = ?auto_21300 ?auto_21301 ) ) ( not ( = ?auto_21300 ?auto_21295 ) ) ( not ( = ?auto_21300 ?auto_21302 ) ) ( not ( = ?auto_21300 ?auto_21310 ) ) ( not ( = ?auto_21311 ?auto_21305 ) ) ( not ( = ?auto_21311 ?auto_21297 ) ) ( not ( = ?auto_21311 ?auto_21307 ) ) ( not ( = ?auto_21311 ?auto_21309 ) ) ( not ( = ?auto_21275 ?auto_21281 ) ) ( not ( = ?auto_21275 ?auto_21318 ) ) ( not ( = ?auto_21276 ?auto_21281 ) ) ( not ( = ?auto_21276 ?auto_21318 ) ) ( not ( = ?auto_21277 ?auto_21281 ) ) ( not ( = ?auto_21277 ?auto_21318 ) ) ( not ( = ?auto_21278 ?auto_21281 ) ) ( not ( = ?auto_21278 ?auto_21318 ) ) ( not ( = ?auto_21279 ?auto_21281 ) ) ( not ( = ?auto_21279 ?auto_21318 ) ) ( not ( = ?auto_21281 ?auto_21311 ) ) ( not ( = ?auto_21281 ?auto_21305 ) ) ( not ( = ?auto_21281 ?auto_21297 ) ) ( not ( = ?auto_21281 ?auto_21307 ) ) ( not ( = ?auto_21281 ?auto_21309 ) ) ( not ( = ?auto_21318 ?auto_21311 ) ) ( not ( = ?auto_21318 ?auto_21305 ) ) ( not ( = ?auto_21318 ?auto_21297 ) ) ( not ( = ?auto_21318 ?auto_21307 ) ) ( not ( = ?auto_21318 ?auto_21309 ) ) ( not ( = ?auto_21275 ?auto_21284 ) ) ( not ( = ?auto_21275 ?auto_21312 ) ) ( not ( = ?auto_21276 ?auto_21284 ) ) ( not ( = ?auto_21276 ?auto_21312 ) ) ( not ( = ?auto_21277 ?auto_21284 ) ) ( not ( = ?auto_21277 ?auto_21312 ) ) ( not ( = ?auto_21278 ?auto_21284 ) ) ( not ( = ?auto_21278 ?auto_21312 ) ) ( not ( = ?auto_21279 ?auto_21284 ) ) ( not ( = ?auto_21279 ?auto_21312 ) ) ( not ( = ?auto_21280 ?auto_21284 ) ) ( not ( = ?auto_21280 ?auto_21312 ) ) ( not ( = ?auto_21284 ?auto_21318 ) ) ( not ( = ?auto_21284 ?auto_21311 ) ) ( not ( = ?auto_21284 ?auto_21305 ) ) ( not ( = ?auto_21284 ?auto_21297 ) ) ( not ( = ?auto_21284 ?auto_21307 ) ) ( not ( = ?auto_21284 ?auto_21309 ) ) ( not ( = ?auto_21315 ?auto_21316 ) ) ( not ( = ?auto_21315 ?auto_21306 ) ) ( not ( = ?auto_21315 ?auto_21314 ) ) ( not ( = ?auto_21315 ?auto_21294 ) ) ( not ( = ?auto_21315 ?auto_21303 ) ) ( not ( = ?auto_21304 ?auto_21310 ) ) ( not ( = ?auto_21304 ?auto_21300 ) ) ( not ( = ?auto_21304 ?auto_21301 ) ) ( not ( = ?auto_21304 ?auto_21295 ) ) ( not ( = ?auto_21304 ?auto_21302 ) ) ( not ( = ?auto_21312 ?auto_21318 ) ) ( not ( = ?auto_21312 ?auto_21311 ) ) ( not ( = ?auto_21312 ?auto_21305 ) ) ( not ( = ?auto_21312 ?auto_21297 ) ) ( not ( = ?auto_21312 ?auto_21307 ) ) ( not ( = ?auto_21312 ?auto_21309 ) ) ( not ( = ?auto_21275 ?auto_21283 ) ) ( not ( = ?auto_21275 ?auto_21313 ) ) ( not ( = ?auto_21276 ?auto_21283 ) ) ( not ( = ?auto_21276 ?auto_21313 ) ) ( not ( = ?auto_21277 ?auto_21283 ) ) ( not ( = ?auto_21277 ?auto_21313 ) ) ( not ( = ?auto_21278 ?auto_21283 ) ) ( not ( = ?auto_21278 ?auto_21313 ) ) ( not ( = ?auto_21279 ?auto_21283 ) ) ( not ( = ?auto_21279 ?auto_21313 ) ) ( not ( = ?auto_21280 ?auto_21283 ) ) ( not ( = ?auto_21280 ?auto_21313 ) ) ( not ( = ?auto_21281 ?auto_21283 ) ) ( not ( = ?auto_21281 ?auto_21313 ) ) ( not ( = ?auto_21283 ?auto_21312 ) ) ( not ( = ?auto_21283 ?auto_21318 ) ) ( not ( = ?auto_21283 ?auto_21311 ) ) ( not ( = ?auto_21283 ?auto_21305 ) ) ( not ( = ?auto_21283 ?auto_21297 ) ) ( not ( = ?auto_21283 ?auto_21307 ) ) ( not ( = ?auto_21283 ?auto_21309 ) ) ( not ( = ?auto_21313 ?auto_21312 ) ) ( not ( = ?auto_21313 ?auto_21318 ) ) ( not ( = ?auto_21313 ?auto_21311 ) ) ( not ( = ?auto_21313 ?auto_21305 ) ) ( not ( = ?auto_21313 ?auto_21297 ) ) ( not ( = ?auto_21313 ?auto_21307 ) ) ( not ( = ?auto_21313 ?auto_21309 ) ) ( not ( = ?auto_21275 ?auto_21282 ) ) ( not ( = ?auto_21275 ?auto_21317 ) ) ( not ( = ?auto_21276 ?auto_21282 ) ) ( not ( = ?auto_21276 ?auto_21317 ) ) ( not ( = ?auto_21277 ?auto_21282 ) ) ( not ( = ?auto_21277 ?auto_21317 ) ) ( not ( = ?auto_21278 ?auto_21282 ) ) ( not ( = ?auto_21278 ?auto_21317 ) ) ( not ( = ?auto_21279 ?auto_21282 ) ) ( not ( = ?auto_21279 ?auto_21317 ) ) ( not ( = ?auto_21280 ?auto_21282 ) ) ( not ( = ?auto_21280 ?auto_21317 ) ) ( not ( = ?auto_21281 ?auto_21282 ) ) ( not ( = ?auto_21281 ?auto_21317 ) ) ( not ( = ?auto_21284 ?auto_21282 ) ) ( not ( = ?auto_21284 ?auto_21317 ) ) ( not ( = ?auto_21282 ?auto_21313 ) ) ( not ( = ?auto_21282 ?auto_21312 ) ) ( not ( = ?auto_21282 ?auto_21318 ) ) ( not ( = ?auto_21282 ?auto_21311 ) ) ( not ( = ?auto_21282 ?auto_21305 ) ) ( not ( = ?auto_21282 ?auto_21297 ) ) ( not ( = ?auto_21282 ?auto_21307 ) ) ( not ( = ?auto_21282 ?auto_21309 ) ) ( not ( = ?auto_21317 ?auto_21313 ) ) ( not ( = ?auto_21317 ?auto_21312 ) ) ( not ( = ?auto_21317 ?auto_21318 ) ) ( not ( = ?auto_21317 ?auto_21311 ) ) ( not ( = ?auto_21317 ?auto_21305 ) ) ( not ( = ?auto_21317 ?auto_21297 ) ) ( not ( = ?auto_21317 ?auto_21307 ) ) ( not ( = ?auto_21317 ?auto_21309 ) ) ( not ( = ?auto_21275 ?auto_21285 ) ) ( not ( = ?auto_21275 ?auto_21299 ) ) ( not ( = ?auto_21276 ?auto_21285 ) ) ( not ( = ?auto_21276 ?auto_21299 ) ) ( not ( = ?auto_21277 ?auto_21285 ) ) ( not ( = ?auto_21277 ?auto_21299 ) ) ( not ( = ?auto_21278 ?auto_21285 ) ) ( not ( = ?auto_21278 ?auto_21299 ) ) ( not ( = ?auto_21279 ?auto_21285 ) ) ( not ( = ?auto_21279 ?auto_21299 ) ) ( not ( = ?auto_21280 ?auto_21285 ) ) ( not ( = ?auto_21280 ?auto_21299 ) ) ( not ( = ?auto_21281 ?auto_21285 ) ) ( not ( = ?auto_21281 ?auto_21299 ) ) ( not ( = ?auto_21284 ?auto_21285 ) ) ( not ( = ?auto_21284 ?auto_21299 ) ) ( not ( = ?auto_21283 ?auto_21285 ) ) ( not ( = ?auto_21283 ?auto_21299 ) ) ( not ( = ?auto_21285 ?auto_21317 ) ) ( not ( = ?auto_21285 ?auto_21313 ) ) ( not ( = ?auto_21285 ?auto_21312 ) ) ( not ( = ?auto_21285 ?auto_21318 ) ) ( not ( = ?auto_21285 ?auto_21311 ) ) ( not ( = ?auto_21285 ?auto_21305 ) ) ( not ( = ?auto_21285 ?auto_21297 ) ) ( not ( = ?auto_21285 ?auto_21307 ) ) ( not ( = ?auto_21285 ?auto_21309 ) ) ( not ( = ?auto_21299 ?auto_21317 ) ) ( not ( = ?auto_21299 ?auto_21313 ) ) ( not ( = ?auto_21299 ?auto_21312 ) ) ( not ( = ?auto_21299 ?auto_21318 ) ) ( not ( = ?auto_21299 ?auto_21311 ) ) ( not ( = ?auto_21299 ?auto_21305 ) ) ( not ( = ?auto_21299 ?auto_21297 ) ) ( not ( = ?auto_21299 ?auto_21307 ) ) ( not ( = ?auto_21299 ?auto_21309 ) ) ( not ( = ?auto_21275 ?auto_21286 ) ) ( not ( = ?auto_21275 ?auto_21298 ) ) ( not ( = ?auto_21276 ?auto_21286 ) ) ( not ( = ?auto_21276 ?auto_21298 ) ) ( not ( = ?auto_21277 ?auto_21286 ) ) ( not ( = ?auto_21277 ?auto_21298 ) ) ( not ( = ?auto_21278 ?auto_21286 ) ) ( not ( = ?auto_21278 ?auto_21298 ) ) ( not ( = ?auto_21279 ?auto_21286 ) ) ( not ( = ?auto_21279 ?auto_21298 ) ) ( not ( = ?auto_21280 ?auto_21286 ) ) ( not ( = ?auto_21280 ?auto_21298 ) ) ( not ( = ?auto_21281 ?auto_21286 ) ) ( not ( = ?auto_21281 ?auto_21298 ) ) ( not ( = ?auto_21284 ?auto_21286 ) ) ( not ( = ?auto_21284 ?auto_21298 ) ) ( not ( = ?auto_21283 ?auto_21286 ) ) ( not ( = ?auto_21283 ?auto_21298 ) ) ( not ( = ?auto_21282 ?auto_21286 ) ) ( not ( = ?auto_21282 ?auto_21298 ) ) ( not ( = ?auto_21286 ?auto_21299 ) ) ( not ( = ?auto_21286 ?auto_21317 ) ) ( not ( = ?auto_21286 ?auto_21313 ) ) ( not ( = ?auto_21286 ?auto_21312 ) ) ( not ( = ?auto_21286 ?auto_21318 ) ) ( not ( = ?auto_21286 ?auto_21311 ) ) ( not ( = ?auto_21286 ?auto_21305 ) ) ( not ( = ?auto_21286 ?auto_21297 ) ) ( not ( = ?auto_21286 ?auto_21307 ) ) ( not ( = ?auto_21286 ?auto_21309 ) ) ( not ( = ?auto_21298 ?auto_21299 ) ) ( not ( = ?auto_21298 ?auto_21317 ) ) ( not ( = ?auto_21298 ?auto_21313 ) ) ( not ( = ?auto_21298 ?auto_21312 ) ) ( not ( = ?auto_21298 ?auto_21318 ) ) ( not ( = ?auto_21298 ?auto_21311 ) ) ( not ( = ?auto_21298 ?auto_21305 ) ) ( not ( = ?auto_21298 ?auto_21297 ) ) ( not ( = ?auto_21298 ?auto_21307 ) ) ( not ( = ?auto_21298 ?auto_21309 ) ) ( not ( = ?auto_21275 ?auto_21287 ) ) ( not ( = ?auto_21275 ?auto_21308 ) ) ( not ( = ?auto_21276 ?auto_21287 ) ) ( not ( = ?auto_21276 ?auto_21308 ) ) ( not ( = ?auto_21277 ?auto_21287 ) ) ( not ( = ?auto_21277 ?auto_21308 ) ) ( not ( = ?auto_21278 ?auto_21287 ) ) ( not ( = ?auto_21278 ?auto_21308 ) ) ( not ( = ?auto_21279 ?auto_21287 ) ) ( not ( = ?auto_21279 ?auto_21308 ) ) ( not ( = ?auto_21280 ?auto_21287 ) ) ( not ( = ?auto_21280 ?auto_21308 ) ) ( not ( = ?auto_21281 ?auto_21287 ) ) ( not ( = ?auto_21281 ?auto_21308 ) ) ( not ( = ?auto_21284 ?auto_21287 ) ) ( not ( = ?auto_21284 ?auto_21308 ) ) ( not ( = ?auto_21283 ?auto_21287 ) ) ( not ( = ?auto_21283 ?auto_21308 ) ) ( not ( = ?auto_21282 ?auto_21287 ) ) ( not ( = ?auto_21282 ?auto_21308 ) ) ( not ( = ?auto_21285 ?auto_21287 ) ) ( not ( = ?auto_21285 ?auto_21308 ) ) ( not ( = ?auto_21287 ?auto_21298 ) ) ( not ( = ?auto_21287 ?auto_21299 ) ) ( not ( = ?auto_21287 ?auto_21317 ) ) ( not ( = ?auto_21287 ?auto_21313 ) ) ( not ( = ?auto_21287 ?auto_21312 ) ) ( not ( = ?auto_21287 ?auto_21318 ) ) ( not ( = ?auto_21287 ?auto_21311 ) ) ( not ( = ?auto_21287 ?auto_21305 ) ) ( not ( = ?auto_21287 ?auto_21297 ) ) ( not ( = ?auto_21287 ?auto_21307 ) ) ( not ( = ?auto_21287 ?auto_21309 ) ) ( not ( = ?auto_21308 ?auto_21298 ) ) ( not ( = ?auto_21308 ?auto_21299 ) ) ( not ( = ?auto_21308 ?auto_21317 ) ) ( not ( = ?auto_21308 ?auto_21313 ) ) ( not ( = ?auto_21308 ?auto_21312 ) ) ( not ( = ?auto_21308 ?auto_21318 ) ) ( not ( = ?auto_21308 ?auto_21311 ) ) ( not ( = ?auto_21308 ?auto_21305 ) ) ( not ( = ?auto_21308 ?auto_21297 ) ) ( not ( = ?auto_21308 ?auto_21307 ) ) ( not ( = ?auto_21308 ?auto_21309 ) ) ( not ( = ?auto_21275 ?auto_21288 ) ) ( not ( = ?auto_21275 ?auto_21319 ) ) ( not ( = ?auto_21276 ?auto_21288 ) ) ( not ( = ?auto_21276 ?auto_21319 ) ) ( not ( = ?auto_21277 ?auto_21288 ) ) ( not ( = ?auto_21277 ?auto_21319 ) ) ( not ( = ?auto_21278 ?auto_21288 ) ) ( not ( = ?auto_21278 ?auto_21319 ) ) ( not ( = ?auto_21279 ?auto_21288 ) ) ( not ( = ?auto_21279 ?auto_21319 ) ) ( not ( = ?auto_21280 ?auto_21288 ) ) ( not ( = ?auto_21280 ?auto_21319 ) ) ( not ( = ?auto_21281 ?auto_21288 ) ) ( not ( = ?auto_21281 ?auto_21319 ) ) ( not ( = ?auto_21284 ?auto_21288 ) ) ( not ( = ?auto_21284 ?auto_21319 ) ) ( not ( = ?auto_21283 ?auto_21288 ) ) ( not ( = ?auto_21283 ?auto_21319 ) ) ( not ( = ?auto_21282 ?auto_21288 ) ) ( not ( = ?auto_21282 ?auto_21319 ) ) ( not ( = ?auto_21285 ?auto_21288 ) ) ( not ( = ?auto_21285 ?auto_21319 ) ) ( not ( = ?auto_21286 ?auto_21288 ) ) ( not ( = ?auto_21286 ?auto_21319 ) ) ( not ( = ?auto_21288 ?auto_21308 ) ) ( not ( = ?auto_21288 ?auto_21298 ) ) ( not ( = ?auto_21288 ?auto_21299 ) ) ( not ( = ?auto_21288 ?auto_21317 ) ) ( not ( = ?auto_21288 ?auto_21313 ) ) ( not ( = ?auto_21288 ?auto_21312 ) ) ( not ( = ?auto_21288 ?auto_21318 ) ) ( not ( = ?auto_21288 ?auto_21311 ) ) ( not ( = ?auto_21288 ?auto_21305 ) ) ( not ( = ?auto_21288 ?auto_21297 ) ) ( not ( = ?auto_21288 ?auto_21307 ) ) ( not ( = ?auto_21288 ?auto_21309 ) ) ( not ( = ?auto_21320 ?auto_21315 ) ) ( not ( = ?auto_21320 ?auto_21294 ) ) ( not ( = ?auto_21320 ?auto_21316 ) ) ( not ( = ?auto_21320 ?auto_21306 ) ) ( not ( = ?auto_21320 ?auto_21314 ) ) ( not ( = ?auto_21320 ?auto_21303 ) ) ( not ( = ?auto_21296 ?auto_21304 ) ) ( not ( = ?auto_21296 ?auto_21295 ) ) ( not ( = ?auto_21296 ?auto_21310 ) ) ( not ( = ?auto_21296 ?auto_21300 ) ) ( not ( = ?auto_21296 ?auto_21301 ) ) ( not ( = ?auto_21296 ?auto_21302 ) ) ( not ( = ?auto_21319 ?auto_21308 ) ) ( not ( = ?auto_21319 ?auto_21298 ) ) ( not ( = ?auto_21319 ?auto_21299 ) ) ( not ( = ?auto_21319 ?auto_21317 ) ) ( not ( = ?auto_21319 ?auto_21313 ) ) ( not ( = ?auto_21319 ?auto_21312 ) ) ( not ( = ?auto_21319 ?auto_21318 ) ) ( not ( = ?auto_21319 ?auto_21311 ) ) ( not ( = ?auto_21319 ?auto_21305 ) ) ( not ( = ?auto_21319 ?auto_21297 ) ) ( not ( = ?auto_21319 ?auto_21307 ) ) ( not ( = ?auto_21319 ?auto_21309 ) ) ( not ( = ?auto_21275 ?auto_21289 ) ) ( not ( = ?auto_21275 ?auto_21291 ) ) ( not ( = ?auto_21276 ?auto_21289 ) ) ( not ( = ?auto_21276 ?auto_21291 ) ) ( not ( = ?auto_21277 ?auto_21289 ) ) ( not ( = ?auto_21277 ?auto_21291 ) ) ( not ( = ?auto_21278 ?auto_21289 ) ) ( not ( = ?auto_21278 ?auto_21291 ) ) ( not ( = ?auto_21279 ?auto_21289 ) ) ( not ( = ?auto_21279 ?auto_21291 ) ) ( not ( = ?auto_21280 ?auto_21289 ) ) ( not ( = ?auto_21280 ?auto_21291 ) ) ( not ( = ?auto_21281 ?auto_21289 ) ) ( not ( = ?auto_21281 ?auto_21291 ) ) ( not ( = ?auto_21284 ?auto_21289 ) ) ( not ( = ?auto_21284 ?auto_21291 ) ) ( not ( = ?auto_21283 ?auto_21289 ) ) ( not ( = ?auto_21283 ?auto_21291 ) ) ( not ( = ?auto_21282 ?auto_21289 ) ) ( not ( = ?auto_21282 ?auto_21291 ) ) ( not ( = ?auto_21285 ?auto_21289 ) ) ( not ( = ?auto_21285 ?auto_21291 ) ) ( not ( = ?auto_21286 ?auto_21289 ) ) ( not ( = ?auto_21286 ?auto_21291 ) ) ( not ( = ?auto_21287 ?auto_21289 ) ) ( not ( = ?auto_21287 ?auto_21291 ) ) ( not ( = ?auto_21289 ?auto_21319 ) ) ( not ( = ?auto_21289 ?auto_21308 ) ) ( not ( = ?auto_21289 ?auto_21298 ) ) ( not ( = ?auto_21289 ?auto_21299 ) ) ( not ( = ?auto_21289 ?auto_21317 ) ) ( not ( = ?auto_21289 ?auto_21313 ) ) ( not ( = ?auto_21289 ?auto_21312 ) ) ( not ( = ?auto_21289 ?auto_21318 ) ) ( not ( = ?auto_21289 ?auto_21311 ) ) ( not ( = ?auto_21289 ?auto_21305 ) ) ( not ( = ?auto_21289 ?auto_21297 ) ) ( not ( = ?auto_21289 ?auto_21307 ) ) ( not ( = ?auto_21289 ?auto_21309 ) ) ( not ( = ?auto_21291 ?auto_21319 ) ) ( not ( = ?auto_21291 ?auto_21308 ) ) ( not ( = ?auto_21291 ?auto_21298 ) ) ( not ( = ?auto_21291 ?auto_21299 ) ) ( not ( = ?auto_21291 ?auto_21317 ) ) ( not ( = ?auto_21291 ?auto_21313 ) ) ( not ( = ?auto_21291 ?auto_21312 ) ) ( not ( = ?auto_21291 ?auto_21318 ) ) ( not ( = ?auto_21291 ?auto_21311 ) ) ( not ( = ?auto_21291 ?auto_21305 ) ) ( not ( = ?auto_21291 ?auto_21297 ) ) ( not ( = ?auto_21291 ?auto_21307 ) ) ( not ( = ?auto_21291 ?auto_21309 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_21275 ?auto_21276 ?auto_21277 ?auto_21278 ?auto_21279 ?auto_21280 ?auto_21281 ?auto_21284 ?auto_21283 ?auto_21282 ?auto_21285 ?auto_21286 ?auto_21287 ?auto_21288 )
      ( MAKE-1CRATE ?auto_21288 ?auto_21289 )
      ( MAKE-14CRATE-VERIFY ?auto_21275 ?auto_21276 ?auto_21277 ?auto_21278 ?auto_21279 ?auto_21280 ?auto_21281 ?auto_21284 ?auto_21283 ?auto_21282 ?auto_21285 ?auto_21286 ?auto_21287 ?auto_21288 ?auto_21289 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21323 - SURFACE
      ?auto_21324 - SURFACE
    )
    :vars
    (
      ?auto_21325 - HOIST
      ?auto_21326 - PLACE
      ?auto_21328 - PLACE
      ?auto_21329 - HOIST
      ?auto_21330 - SURFACE
      ?auto_21327 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21325 ?auto_21326 ) ( SURFACE-AT ?auto_21323 ?auto_21326 ) ( CLEAR ?auto_21323 ) ( IS-CRATE ?auto_21324 ) ( AVAILABLE ?auto_21325 ) ( not ( = ?auto_21328 ?auto_21326 ) ) ( HOIST-AT ?auto_21329 ?auto_21328 ) ( AVAILABLE ?auto_21329 ) ( SURFACE-AT ?auto_21324 ?auto_21328 ) ( ON ?auto_21324 ?auto_21330 ) ( CLEAR ?auto_21324 ) ( TRUCK-AT ?auto_21327 ?auto_21326 ) ( not ( = ?auto_21323 ?auto_21324 ) ) ( not ( = ?auto_21323 ?auto_21330 ) ) ( not ( = ?auto_21324 ?auto_21330 ) ) ( not ( = ?auto_21325 ?auto_21329 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21327 ?auto_21326 ?auto_21328 )
      ( !LIFT ?auto_21329 ?auto_21324 ?auto_21330 ?auto_21328 )
      ( !LOAD ?auto_21329 ?auto_21324 ?auto_21327 ?auto_21328 )
      ( !DRIVE ?auto_21327 ?auto_21328 ?auto_21326 )
      ( !UNLOAD ?auto_21325 ?auto_21324 ?auto_21327 ?auto_21326 )
      ( !DROP ?auto_21325 ?auto_21324 ?auto_21323 ?auto_21326 )
      ( MAKE-1CRATE-VERIFY ?auto_21323 ?auto_21324 ) )
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
      ?auto_21356 - SURFACE
      ?auto_21355 - SURFACE
      ?auto_21354 - SURFACE
      ?auto_21357 - SURFACE
      ?auto_21358 - SURFACE
      ?auto_21359 - SURFACE
      ?auto_21360 - SURFACE
      ?auto_21362 - SURFACE
      ?auto_21361 - SURFACE
    )
    :vars
    (
      ?auto_21368 - HOIST
      ?auto_21366 - PLACE
      ?auto_21364 - PLACE
      ?auto_21367 - HOIST
      ?auto_21363 - SURFACE
      ?auto_21377 - PLACE
      ?auto_21376 - HOIST
      ?auto_21369 - SURFACE
      ?auto_21375 - PLACE
      ?auto_21390 - HOIST
      ?auto_21393 - SURFACE
      ?auto_21389 - PLACE
      ?auto_21387 - HOIST
      ?auto_21385 - SURFACE
      ?auto_21386 - SURFACE
      ?auto_21379 - SURFACE
      ?auto_21381 - SURFACE
      ?auto_21384 - PLACE
      ?auto_21380 - HOIST
      ?auto_21370 - SURFACE
      ?auto_21372 - SURFACE
      ?auto_21392 - SURFACE
      ?auto_21391 - PLACE
      ?auto_21382 - HOIST
      ?auto_21378 - SURFACE
      ?auto_21373 - PLACE
      ?auto_21383 - HOIST
      ?auto_21388 - SURFACE
      ?auto_21374 - SURFACE
      ?auto_21394 - SURFACE
      ?auto_21371 - SURFACE
      ?auto_21365 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21368 ?auto_21366 ) ( IS-CRATE ?auto_21361 ) ( not ( = ?auto_21364 ?auto_21366 ) ) ( HOIST-AT ?auto_21367 ?auto_21364 ) ( SURFACE-AT ?auto_21361 ?auto_21364 ) ( ON ?auto_21361 ?auto_21363 ) ( CLEAR ?auto_21361 ) ( not ( = ?auto_21362 ?auto_21361 ) ) ( not ( = ?auto_21362 ?auto_21363 ) ) ( not ( = ?auto_21361 ?auto_21363 ) ) ( not ( = ?auto_21368 ?auto_21367 ) ) ( IS-CRATE ?auto_21362 ) ( not ( = ?auto_21377 ?auto_21366 ) ) ( HOIST-AT ?auto_21376 ?auto_21377 ) ( SURFACE-AT ?auto_21362 ?auto_21377 ) ( ON ?auto_21362 ?auto_21369 ) ( CLEAR ?auto_21362 ) ( not ( = ?auto_21360 ?auto_21362 ) ) ( not ( = ?auto_21360 ?auto_21369 ) ) ( not ( = ?auto_21362 ?auto_21369 ) ) ( not ( = ?auto_21368 ?auto_21376 ) ) ( IS-CRATE ?auto_21360 ) ( not ( = ?auto_21375 ?auto_21366 ) ) ( HOIST-AT ?auto_21390 ?auto_21375 ) ( AVAILABLE ?auto_21390 ) ( SURFACE-AT ?auto_21360 ?auto_21375 ) ( ON ?auto_21360 ?auto_21393 ) ( CLEAR ?auto_21360 ) ( not ( = ?auto_21359 ?auto_21360 ) ) ( not ( = ?auto_21359 ?auto_21393 ) ) ( not ( = ?auto_21360 ?auto_21393 ) ) ( not ( = ?auto_21368 ?auto_21390 ) ) ( IS-CRATE ?auto_21359 ) ( not ( = ?auto_21389 ?auto_21366 ) ) ( HOIST-AT ?auto_21387 ?auto_21389 ) ( SURFACE-AT ?auto_21359 ?auto_21389 ) ( ON ?auto_21359 ?auto_21385 ) ( CLEAR ?auto_21359 ) ( not ( = ?auto_21358 ?auto_21359 ) ) ( not ( = ?auto_21358 ?auto_21385 ) ) ( not ( = ?auto_21359 ?auto_21385 ) ) ( not ( = ?auto_21368 ?auto_21387 ) ) ( IS-CRATE ?auto_21358 ) ( SURFACE-AT ?auto_21358 ?auto_21389 ) ( ON ?auto_21358 ?auto_21386 ) ( CLEAR ?auto_21358 ) ( not ( = ?auto_21357 ?auto_21358 ) ) ( not ( = ?auto_21357 ?auto_21386 ) ) ( not ( = ?auto_21358 ?auto_21386 ) ) ( IS-CRATE ?auto_21357 ) ( SURFACE-AT ?auto_21357 ?auto_21377 ) ( ON ?auto_21357 ?auto_21379 ) ( CLEAR ?auto_21357 ) ( not ( = ?auto_21354 ?auto_21357 ) ) ( not ( = ?auto_21354 ?auto_21379 ) ) ( not ( = ?auto_21357 ?auto_21379 ) ) ( IS-CRATE ?auto_21354 ) ( SURFACE-AT ?auto_21354 ?auto_21389 ) ( ON ?auto_21354 ?auto_21381 ) ( CLEAR ?auto_21354 ) ( not ( = ?auto_21355 ?auto_21354 ) ) ( not ( = ?auto_21355 ?auto_21381 ) ) ( not ( = ?auto_21354 ?auto_21381 ) ) ( IS-CRATE ?auto_21355 ) ( not ( = ?auto_21384 ?auto_21366 ) ) ( HOIST-AT ?auto_21380 ?auto_21384 ) ( SURFACE-AT ?auto_21355 ?auto_21384 ) ( ON ?auto_21355 ?auto_21370 ) ( CLEAR ?auto_21355 ) ( not ( = ?auto_21356 ?auto_21355 ) ) ( not ( = ?auto_21356 ?auto_21370 ) ) ( not ( = ?auto_21355 ?auto_21370 ) ) ( not ( = ?auto_21368 ?auto_21380 ) ) ( IS-CRATE ?auto_21356 ) ( AVAILABLE ?auto_21387 ) ( SURFACE-AT ?auto_21356 ?auto_21389 ) ( ON ?auto_21356 ?auto_21372 ) ( CLEAR ?auto_21356 ) ( not ( = ?auto_21353 ?auto_21356 ) ) ( not ( = ?auto_21353 ?auto_21372 ) ) ( not ( = ?auto_21356 ?auto_21372 ) ) ( IS-CRATE ?auto_21353 ) ( SURFACE-AT ?auto_21353 ?auto_21384 ) ( ON ?auto_21353 ?auto_21392 ) ( CLEAR ?auto_21353 ) ( not ( = ?auto_21352 ?auto_21353 ) ) ( not ( = ?auto_21352 ?auto_21392 ) ) ( not ( = ?auto_21353 ?auto_21392 ) ) ( IS-CRATE ?auto_21352 ) ( not ( = ?auto_21391 ?auto_21366 ) ) ( HOIST-AT ?auto_21382 ?auto_21391 ) ( AVAILABLE ?auto_21382 ) ( SURFACE-AT ?auto_21352 ?auto_21391 ) ( ON ?auto_21352 ?auto_21378 ) ( CLEAR ?auto_21352 ) ( not ( = ?auto_21351 ?auto_21352 ) ) ( not ( = ?auto_21351 ?auto_21378 ) ) ( not ( = ?auto_21352 ?auto_21378 ) ) ( not ( = ?auto_21368 ?auto_21382 ) ) ( IS-CRATE ?auto_21351 ) ( not ( = ?auto_21373 ?auto_21366 ) ) ( HOIST-AT ?auto_21383 ?auto_21373 ) ( AVAILABLE ?auto_21383 ) ( SURFACE-AT ?auto_21351 ?auto_21373 ) ( ON ?auto_21351 ?auto_21388 ) ( CLEAR ?auto_21351 ) ( not ( = ?auto_21350 ?auto_21351 ) ) ( not ( = ?auto_21350 ?auto_21388 ) ) ( not ( = ?auto_21351 ?auto_21388 ) ) ( not ( = ?auto_21368 ?auto_21383 ) ) ( IS-CRATE ?auto_21350 ) ( AVAILABLE ?auto_21376 ) ( SURFACE-AT ?auto_21350 ?auto_21377 ) ( ON ?auto_21350 ?auto_21374 ) ( CLEAR ?auto_21350 ) ( not ( = ?auto_21349 ?auto_21350 ) ) ( not ( = ?auto_21349 ?auto_21374 ) ) ( not ( = ?auto_21350 ?auto_21374 ) ) ( IS-CRATE ?auto_21349 ) ( AVAILABLE ?auto_21367 ) ( SURFACE-AT ?auto_21349 ?auto_21364 ) ( ON ?auto_21349 ?auto_21394 ) ( CLEAR ?auto_21349 ) ( not ( = ?auto_21348 ?auto_21349 ) ) ( not ( = ?auto_21348 ?auto_21394 ) ) ( not ( = ?auto_21349 ?auto_21394 ) ) ( SURFACE-AT ?auto_21347 ?auto_21366 ) ( CLEAR ?auto_21347 ) ( IS-CRATE ?auto_21348 ) ( AVAILABLE ?auto_21368 ) ( AVAILABLE ?auto_21380 ) ( SURFACE-AT ?auto_21348 ?auto_21384 ) ( ON ?auto_21348 ?auto_21371 ) ( CLEAR ?auto_21348 ) ( TRUCK-AT ?auto_21365 ?auto_21366 ) ( not ( = ?auto_21347 ?auto_21348 ) ) ( not ( = ?auto_21347 ?auto_21371 ) ) ( not ( = ?auto_21348 ?auto_21371 ) ) ( not ( = ?auto_21347 ?auto_21349 ) ) ( not ( = ?auto_21347 ?auto_21394 ) ) ( not ( = ?auto_21349 ?auto_21371 ) ) ( not ( = ?auto_21364 ?auto_21384 ) ) ( not ( = ?auto_21367 ?auto_21380 ) ) ( not ( = ?auto_21394 ?auto_21371 ) ) ( not ( = ?auto_21347 ?auto_21350 ) ) ( not ( = ?auto_21347 ?auto_21374 ) ) ( not ( = ?auto_21348 ?auto_21350 ) ) ( not ( = ?auto_21348 ?auto_21374 ) ) ( not ( = ?auto_21350 ?auto_21394 ) ) ( not ( = ?auto_21350 ?auto_21371 ) ) ( not ( = ?auto_21377 ?auto_21364 ) ) ( not ( = ?auto_21377 ?auto_21384 ) ) ( not ( = ?auto_21376 ?auto_21367 ) ) ( not ( = ?auto_21376 ?auto_21380 ) ) ( not ( = ?auto_21374 ?auto_21394 ) ) ( not ( = ?auto_21374 ?auto_21371 ) ) ( not ( = ?auto_21347 ?auto_21351 ) ) ( not ( = ?auto_21347 ?auto_21388 ) ) ( not ( = ?auto_21348 ?auto_21351 ) ) ( not ( = ?auto_21348 ?auto_21388 ) ) ( not ( = ?auto_21349 ?auto_21351 ) ) ( not ( = ?auto_21349 ?auto_21388 ) ) ( not ( = ?auto_21351 ?auto_21374 ) ) ( not ( = ?auto_21351 ?auto_21394 ) ) ( not ( = ?auto_21351 ?auto_21371 ) ) ( not ( = ?auto_21373 ?auto_21377 ) ) ( not ( = ?auto_21373 ?auto_21364 ) ) ( not ( = ?auto_21373 ?auto_21384 ) ) ( not ( = ?auto_21383 ?auto_21376 ) ) ( not ( = ?auto_21383 ?auto_21367 ) ) ( not ( = ?auto_21383 ?auto_21380 ) ) ( not ( = ?auto_21388 ?auto_21374 ) ) ( not ( = ?auto_21388 ?auto_21394 ) ) ( not ( = ?auto_21388 ?auto_21371 ) ) ( not ( = ?auto_21347 ?auto_21352 ) ) ( not ( = ?auto_21347 ?auto_21378 ) ) ( not ( = ?auto_21348 ?auto_21352 ) ) ( not ( = ?auto_21348 ?auto_21378 ) ) ( not ( = ?auto_21349 ?auto_21352 ) ) ( not ( = ?auto_21349 ?auto_21378 ) ) ( not ( = ?auto_21350 ?auto_21352 ) ) ( not ( = ?auto_21350 ?auto_21378 ) ) ( not ( = ?auto_21352 ?auto_21388 ) ) ( not ( = ?auto_21352 ?auto_21374 ) ) ( not ( = ?auto_21352 ?auto_21394 ) ) ( not ( = ?auto_21352 ?auto_21371 ) ) ( not ( = ?auto_21391 ?auto_21373 ) ) ( not ( = ?auto_21391 ?auto_21377 ) ) ( not ( = ?auto_21391 ?auto_21364 ) ) ( not ( = ?auto_21391 ?auto_21384 ) ) ( not ( = ?auto_21382 ?auto_21383 ) ) ( not ( = ?auto_21382 ?auto_21376 ) ) ( not ( = ?auto_21382 ?auto_21367 ) ) ( not ( = ?auto_21382 ?auto_21380 ) ) ( not ( = ?auto_21378 ?auto_21388 ) ) ( not ( = ?auto_21378 ?auto_21374 ) ) ( not ( = ?auto_21378 ?auto_21394 ) ) ( not ( = ?auto_21378 ?auto_21371 ) ) ( not ( = ?auto_21347 ?auto_21353 ) ) ( not ( = ?auto_21347 ?auto_21392 ) ) ( not ( = ?auto_21348 ?auto_21353 ) ) ( not ( = ?auto_21348 ?auto_21392 ) ) ( not ( = ?auto_21349 ?auto_21353 ) ) ( not ( = ?auto_21349 ?auto_21392 ) ) ( not ( = ?auto_21350 ?auto_21353 ) ) ( not ( = ?auto_21350 ?auto_21392 ) ) ( not ( = ?auto_21351 ?auto_21353 ) ) ( not ( = ?auto_21351 ?auto_21392 ) ) ( not ( = ?auto_21353 ?auto_21378 ) ) ( not ( = ?auto_21353 ?auto_21388 ) ) ( not ( = ?auto_21353 ?auto_21374 ) ) ( not ( = ?auto_21353 ?auto_21394 ) ) ( not ( = ?auto_21353 ?auto_21371 ) ) ( not ( = ?auto_21392 ?auto_21378 ) ) ( not ( = ?auto_21392 ?auto_21388 ) ) ( not ( = ?auto_21392 ?auto_21374 ) ) ( not ( = ?auto_21392 ?auto_21394 ) ) ( not ( = ?auto_21392 ?auto_21371 ) ) ( not ( = ?auto_21347 ?auto_21356 ) ) ( not ( = ?auto_21347 ?auto_21372 ) ) ( not ( = ?auto_21348 ?auto_21356 ) ) ( not ( = ?auto_21348 ?auto_21372 ) ) ( not ( = ?auto_21349 ?auto_21356 ) ) ( not ( = ?auto_21349 ?auto_21372 ) ) ( not ( = ?auto_21350 ?auto_21356 ) ) ( not ( = ?auto_21350 ?auto_21372 ) ) ( not ( = ?auto_21351 ?auto_21356 ) ) ( not ( = ?auto_21351 ?auto_21372 ) ) ( not ( = ?auto_21352 ?auto_21356 ) ) ( not ( = ?auto_21352 ?auto_21372 ) ) ( not ( = ?auto_21356 ?auto_21392 ) ) ( not ( = ?auto_21356 ?auto_21378 ) ) ( not ( = ?auto_21356 ?auto_21388 ) ) ( not ( = ?auto_21356 ?auto_21374 ) ) ( not ( = ?auto_21356 ?auto_21394 ) ) ( not ( = ?auto_21356 ?auto_21371 ) ) ( not ( = ?auto_21389 ?auto_21384 ) ) ( not ( = ?auto_21389 ?auto_21391 ) ) ( not ( = ?auto_21389 ?auto_21373 ) ) ( not ( = ?auto_21389 ?auto_21377 ) ) ( not ( = ?auto_21389 ?auto_21364 ) ) ( not ( = ?auto_21387 ?auto_21380 ) ) ( not ( = ?auto_21387 ?auto_21382 ) ) ( not ( = ?auto_21387 ?auto_21383 ) ) ( not ( = ?auto_21387 ?auto_21376 ) ) ( not ( = ?auto_21387 ?auto_21367 ) ) ( not ( = ?auto_21372 ?auto_21392 ) ) ( not ( = ?auto_21372 ?auto_21378 ) ) ( not ( = ?auto_21372 ?auto_21388 ) ) ( not ( = ?auto_21372 ?auto_21374 ) ) ( not ( = ?auto_21372 ?auto_21394 ) ) ( not ( = ?auto_21372 ?auto_21371 ) ) ( not ( = ?auto_21347 ?auto_21355 ) ) ( not ( = ?auto_21347 ?auto_21370 ) ) ( not ( = ?auto_21348 ?auto_21355 ) ) ( not ( = ?auto_21348 ?auto_21370 ) ) ( not ( = ?auto_21349 ?auto_21355 ) ) ( not ( = ?auto_21349 ?auto_21370 ) ) ( not ( = ?auto_21350 ?auto_21355 ) ) ( not ( = ?auto_21350 ?auto_21370 ) ) ( not ( = ?auto_21351 ?auto_21355 ) ) ( not ( = ?auto_21351 ?auto_21370 ) ) ( not ( = ?auto_21352 ?auto_21355 ) ) ( not ( = ?auto_21352 ?auto_21370 ) ) ( not ( = ?auto_21353 ?auto_21355 ) ) ( not ( = ?auto_21353 ?auto_21370 ) ) ( not ( = ?auto_21355 ?auto_21372 ) ) ( not ( = ?auto_21355 ?auto_21392 ) ) ( not ( = ?auto_21355 ?auto_21378 ) ) ( not ( = ?auto_21355 ?auto_21388 ) ) ( not ( = ?auto_21355 ?auto_21374 ) ) ( not ( = ?auto_21355 ?auto_21394 ) ) ( not ( = ?auto_21355 ?auto_21371 ) ) ( not ( = ?auto_21370 ?auto_21372 ) ) ( not ( = ?auto_21370 ?auto_21392 ) ) ( not ( = ?auto_21370 ?auto_21378 ) ) ( not ( = ?auto_21370 ?auto_21388 ) ) ( not ( = ?auto_21370 ?auto_21374 ) ) ( not ( = ?auto_21370 ?auto_21394 ) ) ( not ( = ?auto_21370 ?auto_21371 ) ) ( not ( = ?auto_21347 ?auto_21354 ) ) ( not ( = ?auto_21347 ?auto_21381 ) ) ( not ( = ?auto_21348 ?auto_21354 ) ) ( not ( = ?auto_21348 ?auto_21381 ) ) ( not ( = ?auto_21349 ?auto_21354 ) ) ( not ( = ?auto_21349 ?auto_21381 ) ) ( not ( = ?auto_21350 ?auto_21354 ) ) ( not ( = ?auto_21350 ?auto_21381 ) ) ( not ( = ?auto_21351 ?auto_21354 ) ) ( not ( = ?auto_21351 ?auto_21381 ) ) ( not ( = ?auto_21352 ?auto_21354 ) ) ( not ( = ?auto_21352 ?auto_21381 ) ) ( not ( = ?auto_21353 ?auto_21354 ) ) ( not ( = ?auto_21353 ?auto_21381 ) ) ( not ( = ?auto_21356 ?auto_21354 ) ) ( not ( = ?auto_21356 ?auto_21381 ) ) ( not ( = ?auto_21354 ?auto_21370 ) ) ( not ( = ?auto_21354 ?auto_21372 ) ) ( not ( = ?auto_21354 ?auto_21392 ) ) ( not ( = ?auto_21354 ?auto_21378 ) ) ( not ( = ?auto_21354 ?auto_21388 ) ) ( not ( = ?auto_21354 ?auto_21374 ) ) ( not ( = ?auto_21354 ?auto_21394 ) ) ( not ( = ?auto_21354 ?auto_21371 ) ) ( not ( = ?auto_21381 ?auto_21370 ) ) ( not ( = ?auto_21381 ?auto_21372 ) ) ( not ( = ?auto_21381 ?auto_21392 ) ) ( not ( = ?auto_21381 ?auto_21378 ) ) ( not ( = ?auto_21381 ?auto_21388 ) ) ( not ( = ?auto_21381 ?auto_21374 ) ) ( not ( = ?auto_21381 ?auto_21394 ) ) ( not ( = ?auto_21381 ?auto_21371 ) ) ( not ( = ?auto_21347 ?auto_21357 ) ) ( not ( = ?auto_21347 ?auto_21379 ) ) ( not ( = ?auto_21348 ?auto_21357 ) ) ( not ( = ?auto_21348 ?auto_21379 ) ) ( not ( = ?auto_21349 ?auto_21357 ) ) ( not ( = ?auto_21349 ?auto_21379 ) ) ( not ( = ?auto_21350 ?auto_21357 ) ) ( not ( = ?auto_21350 ?auto_21379 ) ) ( not ( = ?auto_21351 ?auto_21357 ) ) ( not ( = ?auto_21351 ?auto_21379 ) ) ( not ( = ?auto_21352 ?auto_21357 ) ) ( not ( = ?auto_21352 ?auto_21379 ) ) ( not ( = ?auto_21353 ?auto_21357 ) ) ( not ( = ?auto_21353 ?auto_21379 ) ) ( not ( = ?auto_21356 ?auto_21357 ) ) ( not ( = ?auto_21356 ?auto_21379 ) ) ( not ( = ?auto_21355 ?auto_21357 ) ) ( not ( = ?auto_21355 ?auto_21379 ) ) ( not ( = ?auto_21357 ?auto_21381 ) ) ( not ( = ?auto_21357 ?auto_21370 ) ) ( not ( = ?auto_21357 ?auto_21372 ) ) ( not ( = ?auto_21357 ?auto_21392 ) ) ( not ( = ?auto_21357 ?auto_21378 ) ) ( not ( = ?auto_21357 ?auto_21388 ) ) ( not ( = ?auto_21357 ?auto_21374 ) ) ( not ( = ?auto_21357 ?auto_21394 ) ) ( not ( = ?auto_21357 ?auto_21371 ) ) ( not ( = ?auto_21379 ?auto_21381 ) ) ( not ( = ?auto_21379 ?auto_21370 ) ) ( not ( = ?auto_21379 ?auto_21372 ) ) ( not ( = ?auto_21379 ?auto_21392 ) ) ( not ( = ?auto_21379 ?auto_21378 ) ) ( not ( = ?auto_21379 ?auto_21388 ) ) ( not ( = ?auto_21379 ?auto_21374 ) ) ( not ( = ?auto_21379 ?auto_21394 ) ) ( not ( = ?auto_21379 ?auto_21371 ) ) ( not ( = ?auto_21347 ?auto_21358 ) ) ( not ( = ?auto_21347 ?auto_21386 ) ) ( not ( = ?auto_21348 ?auto_21358 ) ) ( not ( = ?auto_21348 ?auto_21386 ) ) ( not ( = ?auto_21349 ?auto_21358 ) ) ( not ( = ?auto_21349 ?auto_21386 ) ) ( not ( = ?auto_21350 ?auto_21358 ) ) ( not ( = ?auto_21350 ?auto_21386 ) ) ( not ( = ?auto_21351 ?auto_21358 ) ) ( not ( = ?auto_21351 ?auto_21386 ) ) ( not ( = ?auto_21352 ?auto_21358 ) ) ( not ( = ?auto_21352 ?auto_21386 ) ) ( not ( = ?auto_21353 ?auto_21358 ) ) ( not ( = ?auto_21353 ?auto_21386 ) ) ( not ( = ?auto_21356 ?auto_21358 ) ) ( not ( = ?auto_21356 ?auto_21386 ) ) ( not ( = ?auto_21355 ?auto_21358 ) ) ( not ( = ?auto_21355 ?auto_21386 ) ) ( not ( = ?auto_21354 ?auto_21358 ) ) ( not ( = ?auto_21354 ?auto_21386 ) ) ( not ( = ?auto_21358 ?auto_21379 ) ) ( not ( = ?auto_21358 ?auto_21381 ) ) ( not ( = ?auto_21358 ?auto_21370 ) ) ( not ( = ?auto_21358 ?auto_21372 ) ) ( not ( = ?auto_21358 ?auto_21392 ) ) ( not ( = ?auto_21358 ?auto_21378 ) ) ( not ( = ?auto_21358 ?auto_21388 ) ) ( not ( = ?auto_21358 ?auto_21374 ) ) ( not ( = ?auto_21358 ?auto_21394 ) ) ( not ( = ?auto_21358 ?auto_21371 ) ) ( not ( = ?auto_21386 ?auto_21379 ) ) ( not ( = ?auto_21386 ?auto_21381 ) ) ( not ( = ?auto_21386 ?auto_21370 ) ) ( not ( = ?auto_21386 ?auto_21372 ) ) ( not ( = ?auto_21386 ?auto_21392 ) ) ( not ( = ?auto_21386 ?auto_21378 ) ) ( not ( = ?auto_21386 ?auto_21388 ) ) ( not ( = ?auto_21386 ?auto_21374 ) ) ( not ( = ?auto_21386 ?auto_21394 ) ) ( not ( = ?auto_21386 ?auto_21371 ) ) ( not ( = ?auto_21347 ?auto_21359 ) ) ( not ( = ?auto_21347 ?auto_21385 ) ) ( not ( = ?auto_21348 ?auto_21359 ) ) ( not ( = ?auto_21348 ?auto_21385 ) ) ( not ( = ?auto_21349 ?auto_21359 ) ) ( not ( = ?auto_21349 ?auto_21385 ) ) ( not ( = ?auto_21350 ?auto_21359 ) ) ( not ( = ?auto_21350 ?auto_21385 ) ) ( not ( = ?auto_21351 ?auto_21359 ) ) ( not ( = ?auto_21351 ?auto_21385 ) ) ( not ( = ?auto_21352 ?auto_21359 ) ) ( not ( = ?auto_21352 ?auto_21385 ) ) ( not ( = ?auto_21353 ?auto_21359 ) ) ( not ( = ?auto_21353 ?auto_21385 ) ) ( not ( = ?auto_21356 ?auto_21359 ) ) ( not ( = ?auto_21356 ?auto_21385 ) ) ( not ( = ?auto_21355 ?auto_21359 ) ) ( not ( = ?auto_21355 ?auto_21385 ) ) ( not ( = ?auto_21354 ?auto_21359 ) ) ( not ( = ?auto_21354 ?auto_21385 ) ) ( not ( = ?auto_21357 ?auto_21359 ) ) ( not ( = ?auto_21357 ?auto_21385 ) ) ( not ( = ?auto_21359 ?auto_21386 ) ) ( not ( = ?auto_21359 ?auto_21379 ) ) ( not ( = ?auto_21359 ?auto_21381 ) ) ( not ( = ?auto_21359 ?auto_21370 ) ) ( not ( = ?auto_21359 ?auto_21372 ) ) ( not ( = ?auto_21359 ?auto_21392 ) ) ( not ( = ?auto_21359 ?auto_21378 ) ) ( not ( = ?auto_21359 ?auto_21388 ) ) ( not ( = ?auto_21359 ?auto_21374 ) ) ( not ( = ?auto_21359 ?auto_21394 ) ) ( not ( = ?auto_21359 ?auto_21371 ) ) ( not ( = ?auto_21385 ?auto_21386 ) ) ( not ( = ?auto_21385 ?auto_21379 ) ) ( not ( = ?auto_21385 ?auto_21381 ) ) ( not ( = ?auto_21385 ?auto_21370 ) ) ( not ( = ?auto_21385 ?auto_21372 ) ) ( not ( = ?auto_21385 ?auto_21392 ) ) ( not ( = ?auto_21385 ?auto_21378 ) ) ( not ( = ?auto_21385 ?auto_21388 ) ) ( not ( = ?auto_21385 ?auto_21374 ) ) ( not ( = ?auto_21385 ?auto_21394 ) ) ( not ( = ?auto_21385 ?auto_21371 ) ) ( not ( = ?auto_21347 ?auto_21360 ) ) ( not ( = ?auto_21347 ?auto_21393 ) ) ( not ( = ?auto_21348 ?auto_21360 ) ) ( not ( = ?auto_21348 ?auto_21393 ) ) ( not ( = ?auto_21349 ?auto_21360 ) ) ( not ( = ?auto_21349 ?auto_21393 ) ) ( not ( = ?auto_21350 ?auto_21360 ) ) ( not ( = ?auto_21350 ?auto_21393 ) ) ( not ( = ?auto_21351 ?auto_21360 ) ) ( not ( = ?auto_21351 ?auto_21393 ) ) ( not ( = ?auto_21352 ?auto_21360 ) ) ( not ( = ?auto_21352 ?auto_21393 ) ) ( not ( = ?auto_21353 ?auto_21360 ) ) ( not ( = ?auto_21353 ?auto_21393 ) ) ( not ( = ?auto_21356 ?auto_21360 ) ) ( not ( = ?auto_21356 ?auto_21393 ) ) ( not ( = ?auto_21355 ?auto_21360 ) ) ( not ( = ?auto_21355 ?auto_21393 ) ) ( not ( = ?auto_21354 ?auto_21360 ) ) ( not ( = ?auto_21354 ?auto_21393 ) ) ( not ( = ?auto_21357 ?auto_21360 ) ) ( not ( = ?auto_21357 ?auto_21393 ) ) ( not ( = ?auto_21358 ?auto_21360 ) ) ( not ( = ?auto_21358 ?auto_21393 ) ) ( not ( = ?auto_21360 ?auto_21385 ) ) ( not ( = ?auto_21360 ?auto_21386 ) ) ( not ( = ?auto_21360 ?auto_21379 ) ) ( not ( = ?auto_21360 ?auto_21381 ) ) ( not ( = ?auto_21360 ?auto_21370 ) ) ( not ( = ?auto_21360 ?auto_21372 ) ) ( not ( = ?auto_21360 ?auto_21392 ) ) ( not ( = ?auto_21360 ?auto_21378 ) ) ( not ( = ?auto_21360 ?auto_21388 ) ) ( not ( = ?auto_21360 ?auto_21374 ) ) ( not ( = ?auto_21360 ?auto_21394 ) ) ( not ( = ?auto_21360 ?auto_21371 ) ) ( not ( = ?auto_21375 ?auto_21389 ) ) ( not ( = ?auto_21375 ?auto_21377 ) ) ( not ( = ?auto_21375 ?auto_21384 ) ) ( not ( = ?auto_21375 ?auto_21391 ) ) ( not ( = ?auto_21375 ?auto_21373 ) ) ( not ( = ?auto_21375 ?auto_21364 ) ) ( not ( = ?auto_21390 ?auto_21387 ) ) ( not ( = ?auto_21390 ?auto_21376 ) ) ( not ( = ?auto_21390 ?auto_21380 ) ) ( not ( = ?auto_21390 ?auto_21382 ) ) ( not ( = ?auto_21390 ?auto_21383 ) ) ( not ( = ?auto_21390 ?auto_21367 ) ) ( not ( = ?auto_21393 ?auto_21385 ) ) ( not ( = ?auto_21393 ?auto_21386 ) ) ( not ( = ?auto_21393 ?auto_21379 ) ) ( not ( = ?auto_21393 ?auto_21381 ) ) ( not ( = ?auto_21393 ?auto_21370 ) ) ( not ( = ?auto_21393 ?auto_21372 ) ) ( not ( = ?auto_21393 ?auto_21392 ) ) ( not ( = ?auto_21393 ?auto_21378 ) ) ( not ( = ?auto_21393 ?auto_21388 ) ) ( not ( = ?auto_21393 ?auto_21374 ) ) ( not ( = ?auto_21393 ?auto_21394 ) ) ( not ( = ?auto_21393 ?auto_21371 ) ) ( not ( = ?auto_21347 ?auto_21362 ) ) ( not ( = ?auto_21347 ?auto_21369 ) ) ( not ( = ?auto_21348 ?auto_21362 ) ) ( not ( = ?auto_21348 ?auto_21369 ) ) ( not ( = ?auto_21349 ?auto_21362 ) ) ( not ( = ?auto_21349 ?auto_21369 ) ) ( not ( = ?auto_21350 ?auto_21362 ) ) ( not ( = ?auto_21350 ?auto_21369 ) ) ( not ( = ?auto_21351 ?auto_21362 ) ) ( not ( = ?auto_21351 ?auto_21369 ) ) ( not ( = ?auto_21352 ?auto_21362 ) ) ( not ( = ?auto_21352 ?auto_21369 ) ) ( not ( = ?auto_21353 ?auto_21362 ) ) ( not ( = ?auto_21353 ?auto_21369 ) ) ( not ( = ?auto_21356 ?auto_21362 ) ) ( not ( = ?auto_21356 ?auto_21369 ) ) ( not ( = ?auto_21355 ?auto_21362 ) ) ( not ( = ?auto_21355 ?auto_21369 ) ) ( not ( = ?auto_21354 ?auto_21362 ) ) ( not ( = ?auto_21354 ?auto_21369 ) ) ( not ( = ?auto_21357 ?auto_21362 ) ) ( not ( = ?auto_21357 ?auto_21369 ) ) ( not ( = ?auto_21358 ?auto_21362 ) ) ( not ( = ?auto_21358 ?auto_21369 ) ) ( not ( = ?auto_21359 ?auto_21362 ) ) ( not ( = ?auto_21359 ?auto_21369 ) ) ( not ( = ?auto_21362 ?auto_21393 ) ) ( not ( = ?auto_21362 ?auto_21385 ) ) ( not ( = ?auto_21362 ?auto_21386 ) ) ( not ( = ?auto_21362 ?auto_21379 ) ) ( not ( = ?auto_21362 ?auto_21381 ) ) ( not ( = ?auto_21362 ?auto_21370 ) ) ( not ( = ?auto_21362 ?auto_21372 ) ) ( not ( = ?auto_21362 ?auto_21392 ) ) ( not ( = ?auto_21362 ?auto_21378 ) ) ( not ( = ?auto_21362 ?auto_21388 ) ) ( not ( = ?auto_21362 ?auto_21374 ) ) ( not ( = ?auto_21362 ?auto_21394 ) ) ( not ( = ?auto_21362 ?auto_21371 ) ) ( not ( = ?auto_21369 ?auto_21393 ) ) ( not ( = ?auto_21369 ?auto_21385 ) ) ( not ( = ?auto_21369 ?auto_21386 ) ) ( not ( = ?auto_21369 ?auto_21379 ) ) ( not ( = ?auto_21369 ?auto_21381 ) ) ( not ( = ?auto_21369 ?auto_21370 ) ) ( not ( = ?auto_21369 ?auto_21372 ) ) ( not ( = ?auto_21369 ?auto_21392 ) ) ( not ( = ?auto_21369 ?auto_21378 ) ) ( not ( = ?auto_21369 ?auto_21388 ) ) ( not ( = ?auto_21369 ?auto_21374 ) ) ( not ( = ?auto_21369 ?auto_21394 ) ) ( not ( = ?auto_21369 ?auto_21371 ) ) ( not ( = ?auto_21347 ?auto_21361 ) ) ( not ( = ?auto_21347 ?auto_21363 ) ) ( not ( = ?auto_21348 ?auto_21361 ) ) ( not ( = ?auto_21348 ?auto_21363 ) ) ( not ( = ?auto_21349 ?auto_21361 ) ) ( not ( = ?auto_21349 ?auto_21363 ) ) ( not ( = ?auto_21350 ?auto_21361 ) ) ( not ( = ?auto_21350 ?auto_21363 ) ) ( not ( = ?auto_21351 ?auto_21361 ) ) ( not ( = ?auto_21351 ?auto_21363 ) ) ( not ( = ?auto_21352 ?auto_21361 ) ) ( not ( = ?auto_21352 ?auto_21363 ) ) ( not ( = ?auto_21353 ?auto_21361 ) ) ( not ( = ?auto_21353 ?auto_21363 ) ) ( not ( = ?auto_21356 ?auto_21361 ) ) ( not ( = ?auto_21356 ?auto_21363 ) ) ( not ( = ?auto_21355 ?auto_21361 ) ) ( not ( = ?auto_21355 ?auto_21363 ) ) ( not ( = ?auto_21354 ?auto_21361 ) ) ( not ( = ?auto_21354 ?auto_21363 ) ) ( not ( = ?auto_21357 ?auto_21361 ) ) ( not ( = ?auto_21357 ?auto_21363 ) ) ( not ( = ?auto_21358 ?auto_21361 ) ) ( not ( = ?auto_21358 ?auto_21363 ) ) ( not ( = ?auto_21359 ?auto_21361 ) ) ( not ( = ?auto_21359 ?auto_21363 ) ) ( not ( = ?auto_21360 ?auto_21361 ) ) ( not ( = ?auto_21360 ?auto_21363 ) ) ( not ( = ?auto_21361 ?auto_21369 ) ) ( not ( = ?auto_21361 ?auto_21393 ) ) ( not ( = ?auto_21361 ?auto_21385 ) ) ( not ( = ?auto_21361 ?auto_21386 ) ) ( not ( = ?auto_21361 ?auto_21379 ) ) ( not ( = ?auto_21361 ?auto_21381 ) ) ( not ( = ?auto_21361 ?auto_21370 ) ) ( not ( = ?auto_21361 ?auto_21372 ) ) ( not ( = ?auto_21361 ?auto_21392 ) ) ( not ( = ?auto_21361 ?auto_21378 ) ) ( not ( = ?auto_21361 ?auto_21388 ) ) ( not ( = ?auto_21361 ?auto_21374 ) ) ( not ( = ?auto_21361 ?auto_21394 ) ) ( not ( = ?auto_21361 ?auto_21371 ) ) ( not ( = ?auto_21363 ?auto_21369 ) ) ( not ( = ?auto_21363 ?auto_21393 ) ) ( not ( = ?auto_21363 ?auto_21385 ) ) ( not ( = ?auto_21363 ?auto_21386 ) ) ( not ( = ?auto_21363 ?auto_21379 ) ) ( not ( = ?auto_21363 ?auto_21381 ) ) ( not ( = ?auto_21363 ?auto_21370 ) ) ( not ( = ?auto_21363 ?auto_21372 ) ) ( not ( = ?auto_21363 ?auto_21392 ) ) ( not ( = ?auto_21363 ?auto_21378 ) ) ( not ( = ?auto_21363 ?auto_21388 ) ) ( not ( = ?auto_21363 ?auto_21374 ) ) ( not ( = ?auto_21363 ?auto_21394 ) ) ( not ( = ?auto_21363 ?auto_21371 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_21347 ?auto_21348 ?auto_21349 ?auto_21350 ?auto_21351 ?auto_21352 ?auto_21353 ?auto_21356 ?auto_21355 ?auto_21354 ?auto_21357 ?auto_21358 ?auto_21359 ?auto_21360 ?auto_21362 )
      ( MAKE-1CRATE ?auto_21362 ?auto_21361 )
      ( MAKE-15CRATE-VERIFY ?auto_21347 ?auto_21348 ?auto_21349 ?auto_21350 ?auto_21351 ?auto_21352 ?auto_21353 ?auto_21356 ?auto_21355 ?auto_21354 ?auto_21357 ?auto_21358 ?auto_21359 ?auto_21360 ?auto_21362 ?auto_21361 ) )
  )

)

