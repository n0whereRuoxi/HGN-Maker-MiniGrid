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
      ?auto_23666 - SURFACE
      ?auto_23667 - SURFACE
    )
    :vars
    (
      ?auto_23668 - HOIST
      ?auto_23669 - PLACE
      ?auto_23671 - PLACE
      ?auto_23672 - HOIST
      ?auto_23673 - SURFACE
      ?auto_23670 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23668 ?auto_23669 ) ( SURFACE-AT ?auto_23666 ?auto_23669 ) ( CLEAR ?auto_23666 ) ( IS-CRATE ?auto_23667 ) ( AVAILABLE ?auto_23668 ) ( not ( = ?auto_23671 ?auto_23669 ) ) ( HOIST-AT ?auto_23672 ?auto_23671 ) ( AVAILABLE ?auto_23672 ) ( SURFACE-AT ?auto_23667 ?auto_23671 ) ( ON ?auto_23667 ?auto_23673 ) ( CLEAR ?auto_23667 ) ( TRUCK-AT ?auto_23670 ?auto_23669 ) ( not ( = ?auto_23666 ?auto_23667 ) ) ( not ( = ?auto_23666 ?auto_23673 ) ) ( not ( = ?auto_23667 ?auto_23673 ) ) ( not ( = ?auto_23668 ?auto_23672 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23670 ?auto_23669 ?auto_23671 )
      ( !LIFT ?auto_23672 ?auto_23667 ?auto_23673 ?auto_23671 )
      ( !LOAD ?auto_23672 ?auto_23667 ?auto_23670 ?auto_23671 )
      ( !DRIVE ?auto_23670 ?auto_23671 ?auto_23669 )
      ( !UNLOAD ?auto_23668 ?auto_23667 ?auto_23670 ?auto_23669 )
      ( !DROP ?auto_23668 ?auto_23667 ?auto_23666 ?auto_23669 )
      ( MAKE-1CRATE-VERIFY ?auto_23666 ?auto_23667 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23676 - SURFACE
      ?auto_23677 - SURFACE
    )
    :vars
    (
      ?auto_23678 - HOIST
      ?auto_23679 - PLACE
      ?auto_23681 - PLACE
      ?auto_23682 - HOIST
      ?auto_23683 - SURFACE
      ?auto_23680 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23678 ?auto_23679 ) ( SURFACE-AT ?auto_23676 ?auto_23679 ) ( CLEAR ?auto_23676 ) ( IS-CRATE ?auto_23677 ) ( AVAILABLE ?auto_23678 ) ( not ( = ?auto_23681 ?auto_23679 ) ) ( HOIST-AT ?auto_23682 ?auto_23681 ) ( AVAILABLE ?auto_23682 ) ( SURFACE-AT ?auto_23677 ?auto_23681 ) ( ON ?auto_23677 ?auto_23683 ) ( CLEAR ?auto_23677 ) ( TRUCK-AT ?auto_23680 ?auto_23679 ) ( not ( = ?auto_23676 ?auto_23677 ) ) ( not ( = ?auto_23676 ?auto_23683 ) ) ( not ( = ?auto_23677 ?auto_23683 ) ) ( not ( = ?auto_23678 ?auto_23682 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23680 ?auto_23679 ?auto_23681 )
      ( !LIFT ?auto_23682 ?auto_23677 ?auto_23683 ?auto_23681 )
      ( !LOAD ?auto_23682 ?auto_23677 ?auto_23680 ?auto_23681 )
      ( !DRIVE ?auto_23680 ?auto_23681 ?auto_23679 )
      ( !UNLOAD ?auto_23678 ?auto_23677 ?auto_23680 ?auto_23679 )
      ( !DROP ?auto_23678 ?auto_23677 ?auto_23676 ?auto_23679 )
      ( MAKE-1CRATE-VERIFY ?auto_23676 ?auto_23677 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23687 - SURFACE
      ?auto_23688 - SURFACE
      ?auto_23689 - SURFACE
    )
    :vars
    (
      ?auto_23692 - HOIST
      ?auto_23694 - PLACE
      ?auto_23690 - PLACE
      ?auto_23693 - HOIST
      ?auto_23691 - SURFACE
      ?auto_23696 - PLACE
      ?auto_23698 - HOIST
      ?auto_23697 - SURFACE
      ?auto_23695 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23692 ?auto_23694 ) ( IS-CRATE ?auto_23689 ) ( not ( = ?auto_23690 ?auto_23694 ) ) ( HOIST-AT ?auto_23693 ?auto_23690 ) ( AVAILABLE ?auto_23693 ) ( SURFACE-AT ?auto_23689 ?auto_23690 ) ( ON ?auto_23689 ?auto_23691 ) ( CLEAR ?auto_23689 ) ( not ( = ?auto_23688 ?auto_23689 ) ) ( not ( = ?auto_23688 ?auto_23691 ) ) ( not ( = ?auto_23689 ?auto_23691 ) ) ( not ( = ?auto_23692 ?auto_23693 ) ) ( SURFACE-AT ?auto_23687 ?auto_23694 ) ( CLEAR ?auto_23687 ) ( IS-CRATE ?auto_23688 ) ( AVAILABLE ?auto_23692 ) ( not ( = ?auto_23696 ?auto_23694 ) ) ( HOIST-AT ?auto_23698 ?auto_23696 ) ( AVAILABLE ?auto_23698 ) ( SURFACE-AT ?auto_23688 ?auto_23696 ) ( ON ?auto_23688 ?auto_23697 ) ( CLEAR ?auto_23688 ) ( TRUCK-AT ?auto_23695 ?auto_23694 ) ( not ( = ?auto_23687 ?auto_23688 ) ) ( not ( = ?auto_23687 ?auto_23697 ) ) ( not ( = ?auto_23688 ?auto_23697 ) ) ( not ( = ?auto_23692 ?auto_23698 ) ) ( not ( = ?auto_23687 ?auto_23689 ) ) ( not ( = ?auto_23687 ?auto_23691 ) ) ( not ( = ?auto_23689 ?auto_23697 ) ) ( not ( = ?auto_23690 ?auto_23696 ) ) ( not ( = ?auto_23693 ?auto_23698 ) ) ( not ( = ?auto_23691 ?auto_23697 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23687 ?auto_23688 )
      ( MAKE-1CRATE ?auto_23688 ?auto_23689 )
      ( MAKE-2CRATE-VERIFY ?auto_23687 ?auto_23688 ?auto_23689 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23701 - SURFACE
      ?auto_23702 - SURFACE
    )
    :vars
    (
      ?auto_23703 - HOIST
      ?auto_23704 - PLACE
      ?auto_23706 - PLACE
      ?auto_23707 - HOIST
      ?auto_23708 - SURFACE
      ?auto_23705 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23703 ?auto_23704 ) ( SURFACE-AT ?auto_23701 ?auto_23704 ) ( CLEAR ?auto_23701 ) ( IS-CRATE ?auto_23702 ) ( AVAILABLE ?auto_23703 ) ( not ( = ?auto_23706 ?auto_23704 ) ) ( HOIST-AT ?auto_23707 ?auto_23706 ) ( AVAILABLE ?auto_23707 ) ( SURFACE-AT ?auto_23702 ?auto_23706 ) ( ON ?auto_23702 ?auto_23708 ) ( CLEAR ?auto_23702 ) ( TRUCK-AT ?auto_23705 ?auto_23704 ) ( not ( = ?auto_23701 ?auto_23702 ) ) ( not ( = ?auto_23701 ?auto_23708 ) ) ( not ( = ?auto_23702 ?auto_23708 ) ) ( not ( = ?auto_23703 ?auto_23707 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23705 ?auto_23704 ?auto_23706 )
      ( !LIFT ?auto_23707 ?auto_23702 ?auto_23708 ?auto_23706 )
      ( !LOAD ?auto_23707 ?auto_23702 ?auto_23705 ?auto_23706 )
      ( !DRIVE ?auto_23705 ?auto_23706 ?auto_23704 )
      ( !UNLOAD ?auto_23703 ?auto_23702 ?auto_23705 ?auto_23704 )
      ( !DROP ?auto_23703 ?auto_23702 ?auto_23701 ?auto_23704 )
      ( MAKE-1CRATE-VERIFY ?auto_23701 ?auto_23702 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23713 - SURFACE
      ?auto_23714 - SURFACE
      ?auto_23715 - SURFACE
      ?auto_23716 - SURFACE
    )
    :vars
    (
      ?auto_23719 - HOIST
      ?auto_23721 - PLACE
      ?auto_23722 - PLACE
      ?auto_23717 - HOIST
      ?auto_23720 - SURFACE
      ?auto_23727 - PLACE
      ?auto_23726 - HOIST
      ?auto_23725 - SURFACE
      ?auto_23723 - PLACE
      ?auto_23728 - HOIST
      ?auto_23724 - SURFACE
      ?auto_23718 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23719 ?auto_23721 ) ( IS-CRATE ?auto_23716 ) ( not ( = ?auto_23722 ?auto_23721 ) ) ( HOIST-AT ?auto_23717 ?auto_23722 ) ( AVAILABLE ?auto_23717 ) ( SURFACE-AT ?auto_23716 ?auto_23722 ) ( ON ?auto_23716 ?auto_23720 ) ( CLEAR ?auto_23716 ) ( not ( = ?auto_23715 ?auto_23716 ) ) ( not ( = ?auto_23715 ?auto_23720 ) ) ( not ( = ?auto_23716 ?auto_23720 ) ) ( not ( = ?auto_23719 ?auto_23717 ) ) ( IS-CRATE ?auto_23715 ) ( not ( = ?auto_23727 ?auto_23721 ) ) ( HOIST-AT ?auto_23726 ?auto_23727 ) ( AVAILABLE ?auto_23726 ) ( SURFACE-AT ?auto_23715 ?auto_23727 ) ( ON ?auto_23715 ?auto_23725 ) ( CLEAR ?auto_23715 ) ( not ( = ?auto_23714 ?auto_23715 ) ) ( not ( = ?auto_23714 ?auto_23725 ) ) ( not ( = ?auto_23715 ?auto_23725 ) ) ( not ( = ?auto_23719 ?auto_23726 ) ) ( SURFACE-AT ?auto_23713 ?auto_23721 ) ( CLEAR ?auto_23713 ) ( IS-CRATE ?auto_23714 ) ( AVAILABLE ?auto_23719 ) ( not ( = ?auto_23723 ?auto_23721 ) ) ( HOIST-AT ?auto_23728 ?auto_23723 ) ( AVAILABLE ?auto_23728 ) ( SURFACE-AT ?auto_23714 ?auto_23723 ) ( ON ?auto_23714 ?auto_23724 ) ( CLEAR ?auto_23714 ) ( TRUCK-AT ?auto_23718 ?auto_23721 ) ( not ( = ?auto_23713 ?auto_23714 ) ) ( not ( = ?auto_23713 ?auto_23724 ) ) ( not ( = ?auto_23714 ?auto_23724 ) ) ( not ( = ?auto_23719 ?auto_23728 ) ) ( not ( = ?auto_23713 ?auto_23715 ) ) ( not ( = ?auto_23713 ?auto_23725 ) ) ( not ( = ?auto_23715 ?auto_23724 ) ) ( not ( = ?auto_23727 ?auto_23723 ) ) ( not ( = ?auto_23726 ?auto_23728 ) ) ( not ( = ?auto_23725 ?auto_23724 ) ) ( not ( = ?auto_23713 ?auto_23716 ) ) ( not ( = ?auto_23713 ?auto_23720 ) ) ( not ( = ?auto_23714 ?auto_23716 ) ) ( not ( = ?auto_23714 ?auto_23720 ) ) ( not ( = ?auto_23716 ?auto_23725 ) ) ( not ( = ?auto_23716 ?auto_23724 ) ) ( not ( = ?auto_23722 ?auto_23727 ) ) ( not ( = ?auto_23722 ?auto_23723 ) ) ( not ( = ?auto_23717 ?auto_23726 ) ) ( not ( = ?auto_23717 ?auto_23728 ) ) ( not ( = ?auto_23720 ?auto_23725 ) ) ( not ( = ?auto_23720 ?auto_23724 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23713 ?auto_23714 ?auto_23715 )
      ( MAKE-1CRATE ?auto_23715 ?auto_23716 )
      ( MAKE-3CRATE-VERIFY ?auto_23713 ?auto_23714 ?auto_23715 ?auto_23716 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23731 - SURFACE
      ?auto_23732 - SURFACE
    )
    :vars
    (
      ?auto_23733 - HOIST
      ?auto_23734 - PLACE
      ?auto_23736 - PLACE
      ?auto_23737 - HOIST
      ?auto_23738 - SURFACE
      ?auto_23735 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23733 ?auto_23734 ) ( SURFACE-AT ?auto_23731 ?auto_23734 ) ( CLEAR ?auto_23731 ) ( IS-CRATE ?auto_23732 ) ( AVAILABLE ?auto_23733 ) ( not ( = ?auto_23736 ?auto_23734 ) ) ( HOIST-AT ?auto_23737 ?auto_23736 ) ( AVAILABLE ?auto_23737 ) ( SURFACE-AT ?auto_23732 ?auto_23736 ) ( ON ?auto_23732 ?auto_23738 ) ( CLEAR ?auto_23732 ) ( TRUCK-AT ?auto_23735 ?auto_23734 ) ( not ( = ?auto_23731 ?auto_23732 ) ) ( not ( = ?auto_23731 ?auto_23738 ) ) ( not ( = ?auto_23732 ?auto_23738 ) ) ( not ( = ?auto_23733 ?auto_23737 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23735 ?auto_23734 ?auto_23736 )
      ( !LIFT ?auto_23737 ?auto_23732 ?auto_23738 ?auto_23736 )
      ( !LOAD ?auto_23737 ?auto_23732 ?auto_23735 ?auto_23736 )
      ( !DRIVE ?auto_23735 ?auto_23736 ?auto_23734 )
      ( !UNLOAD ?auto_23733 ?auto_23732 ?auto_23735 ?auto_23734 )
      ( !DROP ?auto_23733 ?auto_23732 ?auto_23731 ?auto_23734 )
      ( MAKE-1CRATE-VERIFY ?auto_23731 ?auto_23732 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23744 - SURFACE
      ?auto_23745 - SURFACE
      ?auto_23746 - SURFACE
      ?auto_23747 - SURFACE
      ?auto_23748 - SURFACE
    )
    :vars
    (
      ?auto_23753 - HOIST
      ?auto_23754 - PLACE
      ?auto_23749 - PLACE
      ?auto_23751 - HOIST
      ?auto_23750 - SURFACE
      ?auto_23763 - PLACE
      ?auto_23757 - HOIST
      ?auto_23756 - SURFACE
      ?auto_23762 - PLACE
      ?auto_23755 - HOIST
      ?auto_23760 - SURFACE
      ?auto_23761 - PLACE
      ?auto_23759 - HOIST
      ?auto_23758 - SURFACE
      ?auto_23752 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23753 ?auto_23754 ) ( IS-CRATE ?auto_23748 ) ( not ( = ?auto_23749 ?auto_23754 ) ) ( HOIST-AT ?auto_23751 ?auto_23749 ) ( AVAILABLE ?auto_23751 ) ( SURFACE-AT ?auto_23748 ?auto_23749 ) ( ON ?auto_23748 ?auto_23750 ) ( CLEAR ?auto_23748 ) ( not ( = ?auto_23747 ?auto_23748 ) ) ( not ( = ?auto_23747 ?auto_23750 ) ) ( not ( = ?auto_23748 ?auto_23750 ) ) ( not ( = ?auto_23753 ?auto_23751 ) ) ( IS-CRATE ?auto_23747 ) ( not ( = ?auto_23763 ?auto_23754 ) ) ( HOIST-AT ?auto_23757 ?auto_23763 ) ( AVAILABLE ?auto_23757 ) ( SURFACE-AT ?auto_23747 ?auto_23763 ) ( ON ?auto_23747 ?auto_23756 ) ( CLEAR ?auto_23747 ) ( not ( = ?auto_23746 ?auto_23747 ) ) ( not ( = ?auto_23746 ?auto_23756 ) ) ( not ( = ?auto_23747 ?auto_23756 ) ) ( not ( = ?auto_23753 ?auto_23757 ) ) ( IS-CRATE ?auto_23746 ) ( not ( = ?auto_23762 ?auto_23754 ) ) ( HOIST-AT ?auto_23755 ?auto_23762 ) ( AVAILABLE ?auto_23755 ) ( SURFACE-AT ?auto_23746 ?auto_23762 ) ( ON ?auto_23746 ?auto_23760 ) ( CLEAR ?auto_23746 ) ( not ( = ?auto_23745 ?auto_23746 ) ) ( not ( = ?auto_23745 ?auto_23760 ) ) ( not ( = ?auto_23746 ?auto_23760 ) ) ( not ( = ?auto_23753 ?auto_23755 ) ) ( SURFACE-AT ?auto_23744 ?auto_23754 ) ( CLEAR ?auto_23744 ) ( IS-CRATE ?auto_23745 ) ( AVAILABLE ?auto_23753 ) ( not ( = ?auto_23761 ?auto_23754 ) ) ( HOIST-AT ?auto_23759 ?auto_23761 ) ( AVAILABLE ?auto_23759 ) ( SURFACE-AT ?auto_23745 ?auto_23761 ) ( ON ?auto_23745 ?auto_23758 ) ( CLEAR ?auto_23745 ) ( TRUCK-AT ?auto_23752 ?auto_23754 ) ( not ( = ?auto_23744 ?auto_23745 ) ) ( not ( = ?auto_23744 ?auto_23758 ) ) ( not ( = ?auto_23745 ?auto_23758 ) ) ( not ( = ?auto_23753 ?auto_23759 ) ) ( not ( = ?auto_23744 ?auto_23746 ) ) ( not ( = ?auto_23744 ?auto_23760 ) ) ( not ( = ?auto_23746 ?auto_23758 ) ) ( not ( = ?auto_23762 ?auto_23761 ) ) ( not ( = ?auto_23755 ?auto_23759 ) ) ( not ( = ?auto_23760 ?auto_23758 ) ) ( not ( = ?auto_23744 ?auto_23747 ) ) ( not ( = ?auto_23744 ?auto_23756 ) ) ( not ( = ?auto_23745 ?auto_23747 ) ) ( not ( = ?auto_23745 ?auto_23756 ) ) ( not ( = ?auto_23747 ?auto_23760 ) ) ( not ( = ?auto_23747 ?auto_23758 ) ) ( not ( = ?auto_23763 ?auto_23762 ) ) ( not ( = ?auto_23763 ?auto_23761 ) ) ( not ( = ?auto_23757 ?auto_23755 ) ) ( not ( = ?auto_23757 ?auto_23759 ) ) ( not ( = ?auto_23756 ?auto_23760 ) ) ( not ( = ?auto_23756 ?auto_23758 ) ) ( not ( = ?auto_23744 ?auto_23748 ) ) ( not ( = ?auto_23744 ?auto_23750 ) ) ( not ( = ?auto_23745 ?auto_23748 ) ) ( not ( = ?auto_23745 ?auto_23750 ) ) ( not ( = ?auto_23746 ?auto_23748 ) ) ( not ( = ?auto_23746 ?auto_23750 ) ) ( not ( = ?auto_23748 ?auto_23756 ) ) ( not ( = ?auto_23748 ?auto_23760 ) ) ( not ( = ?auto_23748 ?auto_23758 ) ) ( not ( = ?auto_23749 ?auto_23763 ) ) ( not ( = ?auto_23749 ?auto_23762 ) ) ( not ( = ?auto_23749 ?auto_23761 ) ) ( not ( = ?auto_23751 ?auto_23757 ) ) ( not ( = ?auto_23751 ?auto_23755 ) ) ( not ( = ?auto_23751 ?auto_23759 ) ) ( not ( = ?auto_23750 ?auto_23756 ) ) ( not ( = ?auto_23750 ?auto_23760 ) ) ( not ( = ?auto_23750 ?auto_23758 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_23744 ?auto_23745 ?auto_23746 ?auto_23747 )
      ( MAKE-1CRATE ?auto_23747 ?auto_23748 )
      ( MAKE-4CRATE-VERIFY ?auto_23744 ?auto_23745 ?auto_23746 ?auto_23747 ?auto_23748 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23766 - SURFACE
      ?auto_23767 - SURFACE
    )
    :vars
    (
      ?auto_23768 - HOIST
      ?auto_23769 - PLACE
      ?auto_23771 - PLACE
      ?auto_23772 - HOIST
      ?auto_23773 - SURFACE
      ?auto_23770 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23768 ?auto_23769 ) ( SURFACE-AT ?auto_23766 ?auto_23769 ) ( CLEAR ?auto_23766 ) ( IS-CRATE ?auto_23767 ) ( AVAILABLE ?auto_23768 ) ( not ( = ?auto_23771 ?auto_23769 ) ) ( HOIST-AT ?auto_23772 ?auto_23771 ) ( AVAILABLE ?auto_23772 ) ( SURFACE-AT ?auto_23767 ?auto_23771 ) ( ON ?auto_23767 ?auto_23773 ) ( CLEAR ?auto_23767 ) ( TRUCK-AT ?auto_23770 ?auto_23769 ) ( not ( = ?auto_23766 ?auto_23767 ) ) ( not ( = ?auto_23766 ?auto_23773 ) ) ( not ( = ?auto_23767 ?auto_23773 ) ) ( not ( = ?auto_23768 ?auto_23772 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23770 ?auto_23769 ?auto_23771 )
      ( !LIFT ?auto_23772 ?auto_23767 ?auto_23773 ?auto_23771 )
      ( !LOAD ?auto_23772 ?auto_23767 ?auto_23770 ?auto_23771 )
      ( !DRIVE ?auto_23770 ?auto_23771 ?auto_23769 )
      ( !UNLOAD ?auto_23768 ?auto_23767 ?auto_23770 ?auto_23769 )
      ( !DROP ?auto_23768 ?auto_23767 ?auto_23766 ?auto_23769 )
      ( MAKE-1CRATE-VERIFY ?auto_23766 ?auto_23767 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23780 - SURFACE
      ?auto_23781 - SURFACE
      ?auto_23782 - SURFACE
      ?auto_23783 - SURFACE
      ?auto_23784 - SURFACE
      ?auto_23785 - SURFACE
    )
    :vars
    (
      ?auto_23791 - HOIST
      ?auto_23787 - PLACE
      ?auto_23789 - PLACE
      ?auto_23790 - HOIST
      ?auto_23788 - SURFACE
      ?auto_23802 - PLACE
      ?auto_23794 - HOIST
      ?auto_23801 - SURFACE
      ?auto_23800 - PLACE
      ?auto_23792 - HOIST
      ?auto_23797 - SURFACE
      ?auto_23795 - PLACE
      ?auto_23793 - HOIST
      ?auto_23796 - SURFACE
      ?auto_23799 - PLACE
      ?auto_23803 - HOIST
      ?auto_23798 - SURFACE
      ?auto_23786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23791 ?auto_23787 ) ( IS-CRATE ?auto_23785 ) ( not ( = ?auto_23789 ?auto_23787 ) ) ( HOIST-AT ?auto_23790 ?auto_23789 ) ( AVAILABLE ?auto_23790 ) ( SURFACE-AT ?auto_23785 ?auto_23789 ) ( ON ?auto_23785 ?auto_23788 ) ( CLEAR ?auto_23785 ) ( not ( = ?auto_23784 ?auto_23785 ) ) ( not ( = ?auto_23784 ?auto_23788 ) ) ( not ( = ?auto_23785 ?auto_23788 ) ) ( not ( = ?auto_23791 ?auto_23790 ) ) ( IS-CRATE ?auto_23784 ) ( not ( = ?auto_23802 ?auto_23787 ) ) ( HOIST-AT ?auto_23794 ?auto_23802 ) ( AVAILABLE ?auto_23794 ) ( SURFACE-AT ?auto_23784 ?auto_23802 ) ( ON ?auto_23784 ?auto_23801 ) ( CLEAR ?auto_23784 ) ( not ( = ?auto_23783 ?auto_23784 ) ) ( not ( = ?auto_23783 ?auto_23801 ) ) ( not ( = ?auto_23784 ?auto_23801 ) ) ( not ( = ?auto_23791 ?auto_23794 ) ) ( IS-CRATE ?auto_23783 ) ( not ( = ?auto_23800 ?auto_23787 ) ) ( HOIST-AT ?auto_23792 ?auto_23800 ) ( AVAILABLE ?auto_23792 ) ( SURFACE-AT ?auto_23783 ?auto_23800 ) ( ON ?auto_23783 ?auto_23797 ) ( CLEAR ?auto_23783 ) ( not ( = ?auto_23782 ?auto_23783 ) ) ( not ( = ?auto_23782 ?auto_23797 ) ) ( not ( = ?auto_23783 ?auto_23797 ) ) ( not ( = ?auto_23791 ?auto_23792 ) ) ( IS-CRATE ?auto_23782 ) ( not ( = ?auto_23795 ?auto_23787 ) ) ( HOIST-AT ?auto_23793 ?auto_23795 ) ( AVAILABLE ?auto_23793 ) ( SURFACE-AT ?auto_23782 ?auto_23795 ) ( ON ?auto_23782 ?auto_23796 ) ( CLEAR ?auto_23782 ) ( not ( = ?auto_23781 ?auto_23782 ) ) ( not ( = ?auto_23781 ?auto_23796 ) ) ( not ( = ?auto_23782 ?auto_23796 ) ) ( not ( = ?auto_23791 ?auto_23793 ) ) ( SURFACE-AT ?auto_23780 ?auto_23787 ) ( CLEAR ?auto_23780 ) ( IS-CRATE ?auto_23781 ) ( AVAILABLE ?auto_23791 ) ( not ( = ?auto_23799 ?auto_23787 ) ) ( HOIST-AT ?auto_23803 ?auto_23799 ) ( AVAILABLE ?auto_23803 ) ( SURFACE-AT ?auto_23781 ?auto_23799 ) ( ON ?auto_23781 ?auto_23798 ) ( CLEAR ?auto_23781 ) ( TRUCK-AT ?auto_23786 ?auto_23787 ) ( not ( = ?auto_23780 ?auto_23781 ) ) ( not ( = ?auto_23780 ?auto_23798 ) ) ( not ( = ?auto_23781 ?auto_23798 ) ) ( not ( = ?auto_23791 ?auto_23803 ) ) ( not ( = ?auto_23780 ?auto_23782 ) ) ( not ( = ?auto_23780 ?auto_23796 ) ) ( not ( = ?auto_23782 ?auto_23798 ) ) ( not ( = ?auto_23795 ?auto_23799 ) ) ( not ( = ?auto_23793 ?auto_23803 ) ) ( not ( = ?auto_23796 ?auto_23798 ) ) ( not ( = ?auto_23780 ?auto_23783 ) ) ( not ( = ?auto_23780 ?auto_23797 ) ) ( not ( = ?auto_23781 ?auto_23783 ) ) ( not ( = ?auto_23781 ?auto_23797 ) ) ( not ( = ?auto_23783 ?auto_23796 ) ) ( not ( = ?auto_23783 ?auto_23798 ) ) ( not ( = ?auto_23800 ?auto_23795 ) ) ( not ( = ?auto_23800 ?auto_23799 ) ) ( not ( = ?auto_23792 ?auto_23793 ) ) ( not ( = ?auto_23792 ?auto_23803 ) ) ( not ( = ?auto_23797 ?auto_23796 ) ) ( not ( = ?auto_23797 ?auto_23798 ) ) ( not ( = ?auto_23780 ?auto_23784 ) ) ( not ( = ?auto_23780 ?auto_23801 ) ) ( not ( = ?auto_23781 ?auto_23784 ) ) ( not ( = ?auto_23781 ?auto_23801 ) ) ( not ( = ?auto_23782 ?auto_23784 ) ) ( not ( = ?auto_23782 ?auto_23801 ) ) ( not ( = ?auto_23784 ?auto_23797 ) ) ( not ( = ?auto_23784 ?auto_23796 ) ) ( not ( = ?auto_23784 ?auto_23798 ) ) ( not ( = ?auto_23802 ?auto_23800 ) ) ( not ( = ?auto_23802 ?auto_23795 ) ) ( not ( = ?auto_23802 ?auto_23799 ) ) ( not ( = ?auto_23794 ?auto_23792 ) ) ( not ( = ?auto_23794 ?auto_23793 ) ) ( not ( = ?auto_23794 ?auto_23803 ) ) ( not ( = ?auto_23801 ?auto_23797 ) ) ( not ( = ?auto_23801 ?auto_23796 ) ) ( not ( = ?auto_23801 ?auto_23798 ) ) ( not ( = ?auto_23780 ?auto_23785 ) ) ( not ( = ?auto_23780 ?auto_23788 ) ) ( not ( = ?auto_23781 ?auto_23785 ) ) ( not ( = ?auto_23781 ?auto_23788 ) ) ( not ( = ?auto_23782 ?auto_23785 ) ) ( not ( = ?auto_23782 ?auto_23788 ) ) ( not ( = ?auto_23783 ?auto_23785 ) ) ( not ( = ?auto_23783 ?auto_23788 ) ) ( not ( = ?auto_23785 ?auto_23801 ) ) ( not ( = ?auto_23785 ?auto_23797 ) ) ( not ( = ?auto_23785 ?auto_23796 ) ) ( not ( = ?auto_23785 ?auto_23798 ) ) ( not ( = ?auto_23789 ?auto_23802 ) ) ( not ( = ?auto_23789 ?auto_23800 ) ) ( not ( = ?auto_23789 ?auto_23795 ) ) ( not ( = ?auto_23789 ?auto_23799 ) ) ( not ( = ?auto_23790 ?auto_23794 ) ) ( not ( = ?auto_23790 ?auto_23792 ) ) ( not ( = ?auto_23790 ?auto_23793 ) ) ( not ( = ?auto_23790 ?auto_23803 ) ) ( not ( = ?auto_23788 ?auto_23801 ) ) ( not ( = ?auto_23788 ?auto_23797 ) ) ( not ( = ?auto_23788 ?auto_23796 ) ) ( not ( = ?auto_23788 ?auto_23798 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_23780 ?auto_23781 ?auto_23782 ?auto_23783 ?auto_23784 )
      ( MAKE-1CRATE ?auto_23784 ?auto_23785 )
      ( MAKE-5CRATE-VERIFY ?auto_23780 ?auto_23781 ?auto_23782 ?auto_23783 ?auto_23784 ?auto_23785 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23806 - SURFACE
      ?auto_23807 - SURFACE
    )
    :vars
    (
      ?auto_23808 - HOIST
      ?auto_23809 - PLACE
      ?auto_23811 - PLACE
      ?auto_23812 - HOIST
      ?auto_23813 - SURFACE
      ?auto_23810 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23808 ?auto_23809 ) ( SURFACE-AT ?auto_23806 ?auto_23809 ) ( CLEAR ?auto_23806 ) ( IS-CRATE ?auto_23807 ) ( AVAILABLE ?auto_23808 ) ( not ( = ?auto_23811 ?auto_23809 ) ) ( HOIST-AT ?auto_23812 ?auto_23811 ) ( AVAILABLE ?auto_23812 ) ( SURFACE-AT ?auto_23807 ?auto_23811 ) ( ON ?auto_23807 ?auto_23813 ) ( CLEAR ?auto_23807 ) ( TRUCK-AT ?auto_23810 ?auto_23809 ) ( not ( = ?auto_23806 ?auto_23807 ) ) ( not ( = ?auto_23806 ?auto_23813 ) ) ( not ( = ?auto_23807 ?auto_23813 ) ) ( not ( = ?auto_23808 ?auto_23812 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23810 ?auto_23809 ?auto_23811 )
      ( !LIFT ?auto_23812 ?auto_23807 ?auto_23813 ?auto_23811 )
      ( !LOAD ?auto_23812 ?auto_23807 ?auto_23810 ?auto_23811 )
      ( !DRIVE ?auto_23810 ?auto_23811 ?auto_23809 )
      ( !UNLOAD ?auto_23808 ?auto_23807 ?auto_23810 ?auto_23809 )
      ( !DROP ?auto_23808 ?auto_23807 ?auto_23806 ?auto_23809 )
      ( MAKE-1CRATE-VERIFY ?auto_23806 ?auto_23807 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_23821 - SURFACE
      ?auto_23822 - SURFACE
      ?auto_23823 - SURFACE
      ?auto_23824 - SURFACE
      ?auto_23825 - SURFACE
      ?auto_23826 - SURFACE
      ?auto_23827 - SURFACE
    )
    :vars
    (
      ?auto_23829 - HOIST
      ?auto_23830 - PLACE
      ?auto_23828 - PLACE
      ?auto_23833 - HOIST
      ?auto_23832 - SURFACE
      ?auto_23836 - PLACE
      ?auto_23845 - HOIST
      ?auto_23841 - SURFACE
      ?auto_23837 - PLACE
      ?auto_23846 - HOIST
      ?auto_23843 - SURFACE
      ?auto_23835 - PLACE
      ?auto_23834 - HOIST
      ?auto_23840 - SURFACE
      ?auto_23838 - SURFACE
      ?auto_23844 - PLACE
      ?auto_23842 - HOIST
      ?auto_23839 - SURFACE
      ?auto_23831 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23829 ?auto_23830 ) ( IS-CRATE ?auto_23827 ) ( not ( = ?auto_23828 ?auto_23830 ) ) ( HOIST-AT ?auto_23833 ?auto_23828 ) ( SURFACE-AT ?auto_23827 ?auto_23828 ) ( ON ?auto_23827 ?auto_23832 ) ( CLEAR ?auto_23827 ) ( not ( = ?auto_23826 ?auto_23827 ) ) ( not ( = ?auto_23826 ?auto_23832 ) ) ( not ( = ?auto_23827 ?auto_23832 ) ) ( not ( = ?auto_23829 ?auto_23833 ) ) ( IS-CRATE ?auto_23826 ) ( not ( = ?auto_23836 ?auto_23830 ) ) ( HOIST-AT ?auto_23845 ?auto_23836 ) ( AVAILABLE ?auto_23845 ) ( SURFACE-AT ?auto_23826 ?auto_23836 ) ( ON ?auto_23826 ?auto_23841 ) ( CLEAR ?auto_23826 ) ( not ( = ?auto_23825 ?auto_23826 ) ) ( not ( = ?auto_23825 ?auto_23841 ) ) ( not ( = ?auto_23826 ?auto_23841 ) ) ( not ( = ?auto_23829 ?auto_23845 ) ) ( IS-CRATE ?auto_23825 ) ( not ( = ?auto_23837 ?auto_23830 ) ) ( HOIST-AT ?auto_23846 ?auto_23837 ) ( AVAILABLE ?auto_23846 ) ( SURFACE-AT ?auto_23825 ?auto_23837 ) ( ON ?auto_23825 ?auto_23843 ) ( CLEAR ?auto_23825 ) ( not ( = ?auto_23824 ?auto_23825 ) ) ( not ( = ?auto_23824 ?auto_23843 ) ) ( not ( = ?auto_23825 ?auto_23843 ) ) ( not ( = ?auto_23829 ?auto_23846 ) ) ( IS-CRATE ?auto_23824 ) ( not ( = ?auto_23835 ?auto_23830 ) ) ( HOIST-AT ?auto_23834 ?auto_23835 ) ( AVAILABLE ?auto_23834 ) ( SURFACE-AT ?auto_23824 ?auto_23835 ) ( ON ?auto_23824 ?auto_23840 ) ( CLEAR ?auto_23824 ) ( not ( = ?auto_23823 ?auto_23824 ) ) ( not ( = ?auto_23823 ?auto_23840 ) ) ( not ( = ?auto_23824 ?auto_23840 ) ) ( not ( = ?auto_23829 ?auto_23834 ) ) ( IS-CRATE ?auto_23823 ) ( AVAILABLE ?auto_23833 ) ( SURFACE-AT ?auto_23823 ?auto_23828 ) ( ON ?auto_23823 ?auto_23838 ) ( CLEAR ?auto_23823 ) ( not ( = ?auto_23822 ?auto_23823 ) ) ( not ( = ?auto_23822 ?auto_23838 ) ) ( not ( = ?auto_23823 ?auto_23838 ) ) ( SURFACE-AT ?auto_23821 ?auto_23830 ) ( CLEAR ?auto_23821 ) ( IS-CRATE ?auto_23822 ) ( AVAILABLE ?auto_23829 ) ( not ( = ?auto_23844 ?auto_23830 ) ) ( HOIST-AT ?auto_23842 ?auto_23844 ) ( AVAILABLE ?auto_23842 ) ( SURFACE-AT ?auto_23822 ?auto_23844 ) ( ON ?auto_23822 ?auto_23839 ) ( CLEAR ?auto_23822 ) ( TRUCK-AT ?auto_23831 ?auto_23830 ) ( not ( = ?auto_23821 ?auto_23822 ) ) ( not ( = ?auto_23821 ?auto_23839 ) ) ( not ( = ?auto_23822 ?auto_23839 ) ) ( not ( = ?auto_23829 ?auto_23842 ) ) ( not ( = ?auto_23821 ?auto_23823 ) ) ( not ( = ?auto_23821 ?auto_23838 ) ) ( not ( = ?auto_23823 ?auto_23839 ) ) ( not ( = ?auto_23828 ?auto_23844 ) ) ( not ( = ?auto_23833 ?auto_23842 ) ) ( not ( = ?auto_23838 ?auto_23839 ) ) ( not ( = ?auto_23821 ?auto_23824 ) ) ( not ( = ?auto_23821 ?auto_23840 ) ) ( not ( = ?auto_23822 ?auto_23824 ) ) ( not ( = ?auto_23822 ?auto_23840 ) ) ( not ( = ?auto_23824 ?auto_23838 ) ) ( not ( = ?auto_23824 ?auto_23839 ) ) ( not ( = ?auto_23835 ?auto_23828 ) ) ( not ( = ?auto_23835 ?auto_23844 ) ) ( not ( = ?auto_23834 ?auto_23833 ) ) ( not ( = ?auto_23834 ?auto_23842 ) ) ( not ( = ?auto_23840 ?auto_23838 ) ) ( not ( = ?auto_23840 ?auto_23839 ) ) ( not ( = ?auto_23821 ?auto_23825 ) ) ( not ( = ?auto_23821 ?auto_23843 ) ) ( not ( = ?auto_23822 ?auto_23825 ) ) ( not ( = ?auto_23822 ?auto_23843 ) ) ( not ( = ?auto_23823 ?auto_23825 ) ) ( not ( = ?auto_23823 ?auto_23843 ) ) ( not ( = ?auto_23825 ?auto_23840 ) ) ( not ( = ?auto_23825 ?auto_23838 ) ) ( not ( = ?auto_23825 ?auto_23839 ) ) ( not ( = ?auto_23837 ?auto_23835 ) ) ( not ( = ?auto_23837 ?auto_23828 ) ) ( not ( = ?auto_23837 ?auto_23844 ) ) ( not ( = ?auto_23846 ?auto_23834 ) ) ( not ( = ?auto_23846 ?auto_23833 ) ) ( not ( = ?auto_23846 ?auto_23842 ) ) ( not ( = ?auto_23843 ?auto_23840 ) ) ( not ( = ?auto_23843 ?auto_23838 ) ) ( not ( = ?auto_23843 ?auto_23839 ) ) ( not ( = ?auto_23821 ?auto_23826 ) ) ( not ( = ?auto_23821 ?auto_23841 ) ) ( not ( = ?auto_23822 ?auto_23826 ) ) ( not ( = ?auto_23822 ?auto_23841 ) ) ( not ( = ?auto_23823 ?auto_23826 ) ) ( not ( = ?auto_23823 ?auto_23841 ) ) ( not ( = ?auto_23824 ?auto_23826 ) ) ( not ( = ?auto_23824 ?auto_23841 ) ) ( not ( = ?auto_23826 ?auto_23843 ) ) ( not ( = ?auto_23826 ?auto_23840 ) ) ( not ( = ?auto_23826 ?auto_23838 ) ) ( not ( = ?auto_23826 ?auto_23839 ) ) ( not ( = ?auto_23836 ?auto_23837 ) ) ( not ( = ?auto_23836 ?auto_23835 ) ) ( not ( = ?auto_23836 ?auto_23828 ) ) ( not ( = ?auto_23836 ?auto_23844 ) ) ( not ( = ?auto_23845 ?auto_23846 ) ) ( not ( = ?auto_23845 ?auto_23834 ) ) ( not ( = ?auto_23845 ?auto_23833 ) ) ( not ( = ?auto_23845 ?auto_23842 ) ) ( not ( = ?auto_23841 ?auto_23843 ) ) ( not ( = ?auto_23841 ?auto_23840 ) ) ( not ( = ?auto_23841 ?auto_23838 ) ) ( not ( = ?auto_23841 ?auto_23839 ) ) ( not ( = ?auto_23821 ?auto_23827 ) ) ( not ( = ?auto_23821 ?auto_23832 ) ) ( not ( = ?auto_23822 ?auto_23827 ) ) ( not ( = ?auto_23822 ?auto_23832 ) ) ( not ( = ?auto_23823 ?auto_23827 ) ) ( not ( = ?auto_23823 ?auto_23832 ) ) ( not ( = ?auto_23824 ?auto_23827 ) ) ( not ( = ?auto_23824 ?auto_23832 ) ) ( not ( = ?auto_23825 ?auto_23827 ) ) ( not ( = ?auto_23825 ?auto_23832 ) ) ( not ( = ?auto_23827 ?auto_23841 ) ) ( not ( = ?auto_23827 ?auto_23843 ) ) ( not ( = ?auto_23827 ?auto_23840 ) ) ( not ( = ?auto_23827 ?auto_23838 ) ) ( not ( = ?auto_23827 ?auto_23839 ) ) ( not ( = ?auto_23832 ?auto_23841 ) ) ( not ( = ?auto_23832 ?auto_23843 ) ) ( not ( = ?auto_23832 ?auto_23840 ) ) ( not ( = ?auto_23832 ?auto_23838 ) ) ( not ( = ?auto_23832 ?auto_23839 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_23821 ?auto_23822 ?auto_23823 ?auto_23824 ?auto_23825 ?auto_23826 )
      ( MAKE-1CRATE ?auto_23826 ?auto_23827 )
      ( MAKE-6CRATE-VERIFY ?auto_23821 ?auto_23822 ?auto_23823 ?auto_23824 ?auto_23825 ?auto_23826 ?auto_23827 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23849 - SURFACE
      ?auto_23850 - SURFACE
    )
    :vars
    (
      ?auto_23851 - HOIST
      ?auto_23852 - PLACE
      ?auto_23854 - PLACE
      ?auto_23855 - HOIST
      ?auto_23856 - SURFACE
      ?auto_23853 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23851 ?auto_23852 ) ( SURFACE-AT ?auto_23849 ?auto_23852 ) ( CLEAR ?auto_23849 ) ( IS-CRATE ?auto_23850 ) ( AVAILABLE ?auto_23851 ) ( not ( = ?auto_23854 ?auto_23852 ) ) ( HOIST-AT ?auto_23855 ?auto_23854 ) ( AVAILABLE ?auto_23855 ) ( SURFACE-AT ?auto_23850 ?auto_23854 ) ( ON ?auto_23850 ?auto_23856 ) ( CLEAR ?auto_23850 ) ( TRUCK-AT ?auto_23853 ?auto_23852 ) ( not ( = ?auto_23849 ?auto_23850 ) ) ( not ( = ?auto_23849 ?auto_23856 ) ) ( not ( = ?auto_23850 ?auto_23856 ) ) ( not ( = ?auto_23851 ?auto_23855 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23853 ?auto_23852 ?auto_23854 )
      ( !LIFT ?auto_23855 ?auto_23850 ?auto_23856 ?auto_23854 )
      ( !LOAD ?auto_23855 ?auto_23850 ?auto_23853 ?auto_23854 )
      ( !DRIVE ?auto_23853 ?auto_23854 ?auto_23852 )
      ( !UNLOAD ?auto_23851 ?auto_23850 ?auto_23853 ?auto_23852 )
      ( !DROP ?auto_23851 ?auto_23850 ?auto_23849 ?auto_23852 )
      ( MAKE-1CRATE-VERIFY ?auto_23849 ?auto_23850 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_23865 - SURFACE
      ?auto_23866 - SURFACE
      ?auto_23867 - SURFACE
      ?auto_23868 - SURFACE
      ?auto_23869 - SURFACE
      ?auto_23870 - SURFACE
      ?auto_23871 - SURFACE
      ?auto_23872 - SURFACE
    )
    :vars
    (
      ?auto_23877 - HOIST
      ?auto_23875 - PLACE
      ?auto_23878 - PLACE
      ?auto_23873 - HOIST
      ?auto_23876 - SURFACE
      ?auto_23888 - PLACE
      ?auto_23891 - HOIST
      ?auto_23883 - SURFACE
      ?auto_23885 - PLACE
      ?auto_23894 - HOIST
      ?auto_23890 - SURFACE
      ?auto_23882 - PLACE
      ?auto_23881 - HOIST
      ?auto_23893 - SURFACE
      ?auto_23884 - PLACE
      ?auto_23892 - HOIST
      ?auto_23889 - SURFACE
      ?auto_23879 - SURFACE
      ?auto_23880 - PLACE
      ?auto_23886 - HOIST
      ?auto_23887 - SURFACE
      ?auto_23874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23877 ?auto_23875 ) ( IS-CRATE ?auto_23872 ) ( not ( = ?auto_23878 ?auto_23875 ) ) ( HOIST-AT ?auto_23873 ?auto_23878 ) ( AVAILABLE ?auto_23873 ) ( SURFACE-AT ?auto_23872 ?auto_23878 ) ( ON ?auto_23872 ?auto_23876 ) ( CLEAR ?auto_23872 ) ( not ( = ?auto_23871 ?auto_23872 ) ) ( not ( = ?auto_23871 ?auto_23876 ) ) ( not ( = ?auto_23872 ?auto_23876 ) ) ( not ( = ?auto_23877 ?auto_23873 ) ) ( IS-CRATE ?auto_23871 ) ( not ( = ?auto_23888 ?auto_23875 ) ) ( HOIST-AT ?auto_23891 ?auto_23888 ) ( SURFACE-AT ?auto_23871 ?auto_23888 ) ( ON ?auto_23871 ?auto_23883 ) ( CLEAR ?auto_23871 ) ( not ( = ?auto_23870 ?auto_23871 ) ) ( not ( = ?auto_23870 ?auto_23883 ) ) ( not ( = ?auto_23871 ?auto_23883 ) ) ( not ( = ?auto_23877 ?auto_23891 ) ) ( IS-CRATE ?auto_23870 ) ( not ( = ?auto_23885 ?auto_23875 ) ) ( HOIST-AT ?auto_23894 ?auto_23885 ) ( AVAILABLE ?auto_23894 ) ( SURFACE-AT ?auto_23870 ?auto_23885 ) ( ON ?auto_23870 ?auto_23890 ) ( CLEAR ?auto_23870 ) ( not ( = ?auto_23869 ?auto_23870 ) ) ( not ( = ?auto_23869 ?auto_23890 ) ) ( not ( = ?auto_23870 ?auto_23890 ) ) ( not ( = ?auto_23877 ?auto_23894 ) ) ( IS-CRATE ?auto_23869 ) ( not ( = ?auto_23882 ?auto_23875 ) ) ( HOIST-AT ?auto_23881 ?auto_23882 ) ( AVAILABLE ?auto_23881 ) ( SURFACE-AT ?auto_23869 ?auto_23882 ) ( ON ?auto_23869 ?auto_23893 ) ( CLEAR ?auto_23869 ) ( not ( = ?auto_23868 ?auto_23869 ) ) ( not ( = ?auto_23868 ?auto_23893 ) ) ( not ( = ?auto_23869 ?auto_23893 ) ) ( not ( = ?auto_23877 ?auto_23881 ) ) ( IS-CRATE ?auto_23868 ) ( not ( = ?auto_23884 ?auto_23875 ) ) ( HOIST-AT ?auto_23892 ?auto_23884 ) ( AVAILABLE ?auto_23892 ) ( SURFACE-AT ?auto_23868 ?auto_23884 ) ( ON ?auto_23868 ?auto_23889 ) ( CLEAR ?auto_23868 ) ( not ( = ?auto_23867 ?auto_23868 ) ) ( not ( = ?auto_23867 ?auto_23889 ) ) ( not ( = ?auto_23868 ?auto_23889 ) ) ( not ( = ?auto_23877 ?auto_23892 ) ) ( IS-CRATE ?auto_23867 ) ( AVAILABLE ?auto_23891 ) ( SURFACE-AT ?auto_23867 ?auto_23888 ) ( ON ?auto_23867 ?auto_23879 ) ( CLEAR ?auto_23867 ) ( not ( = ?auto_23866 ?auto_23867 ) ) ( not ( = ?auto_23866 ?auto_23879 ) ) ( not ( = ?auto_23867 ?auto_23879 ) ) ( SURFACE-AT ?auto_23865 ?auto_23875 ) ( CLEAR ?auto_23865 ) ( IS-CRATE ?auto_23866 ) ( AVAILABLE ?auto_23877 ) ( not ( = ?auto_23880 ?auto_23875 ) ) ( HOIST-AT ?auto_23886 ?auto_23880 ) ( AVAILABLE ?auto_23886 ) ( SURFACE-AT ?auto_23866 ?auto_23880 ) ( ON ?auto_23866 ?auto_23887 ) ( CLEAR ?auto_23866 ) ( TRUCK-AT ?auto_23874 ?auto_23875 ) ( not ( = ?auto_23865 ?auto_23866 ) ) ( not ( = ?auto_23865 ?auto_23887 ) ) ( not ( = ?auto_23866 ?auto_23887 ) ) ( not ( = ?auto_23877 ?auto_23886 ) ) ( not ( = ?auto_23865 ?auto_23867 ) ) ( not ( = ?auto_23865 ?auto_23879 ) ) ( not ( = ?auto_23867 ?auto_23887 ) ) ( not ( = ?auto_23888 ?auto_23880 ) ) ( not ( = ?auto_23891 ?auto_23886 ) ) ( not ( = ?auto_23879 ?auto_23887 ) ) ( not ( = ?auto_23865 ?auto_23868 ) ) ( not ( = ?auto_23865 ?auto_23889 ) ) ( not ( = ?auto_23866 ?auto_23868 ) ) ( not ( = ?auto_23866 ?auto_23889 ) ) ( not ( = ?auto_23868 ?auto_23879 ) ) ( not ( = ?auto_23868 ?auto_23887 ) ) ( not ( = ?auto_23884 ?auto_23888 ) ) ( not ( = ?auto_23884 ?auto_23880 ) ) ( not ( = ?auto_23892 ?auto_23891 ) ) ( not ( = ?auto_23892 ?auto_23886 ) ) ( not ( = ?auto_23889 ?auto_23879 ) ) ( not ( = ?auto_23889 ?auto_23887 ) ) ( not ( = ?auto_23865 ?auto_23869 ) ) ( not ( = ?auto_23865 ?auto_23893 ) ) ( not ( = ?auto_23866 ?auto_23869 ) ) ( not ( = ?auto_23866 ?auto_23893 ) ) ( not ( = ?auto_23867 ?auto_23869 ) ) ( not ( = ?auto_23867 ?auto_23893 ) ) ( not ( = ?auto_23869 ?auto_23889 ) ) ( not ( = ?auto_23869 ?auto_23879 ) ) ( not ( = ?auto_23869 ?auto_23887 ) ) ( not ( = ?auto_23882 ?auto_23884 ) ) ( not ( = ?auto_23882 ?auto_23888 ) ) ( not ( = ?auto_23882 ?auto_23880 ) ) ( not ( = ?auto_23881 ?auto_23892 ) ) ( not ( = ?auto_23881 ?auto_23891 ) ) ( not ( = ?auto_23881 ?auto_23886 ) ) ( not ( = ?auto_23893 ?auto_23889 ) ) ( not ( = ?auto_23893 ?auto_23879 ) ) ( not ( = ?auto_23893 ?auto_23887 ) ) ( not ( = ?auto_23865 ?auto_23870 ) ) ( not ( = ?auto_23865 ?auto_23890 ) ) ( not ( = ?auto_23866 ?auto_23870 ) ) ( not ( = ?auto_23866 ?auto_23890 ) ) ( not ( = ?auto_23867 ?auto_23870 ) ) ( not ( = ?auto_23867 ?auto_23890 ) ) ( not ( = ?auto_23868 ?auto_23870 ) ) ( not ( = ?auto_23868 ?auto_23890 ) ) ( not ( = ?auto_23870 ?auto_23893 ) ) ( not ( = ?auto_23870 ?auto_23889 ) ) ( not ( = ?auto_23870 ?auto_23879 ) ) ( not ( = ?auto_23870 ?auto_23887 ) ) ( not ( = ?auto_23885 ?auto_23882 ) ) ( not ( = ?auto_23885 ?auto_23884 ) ) ( not ( = ?auto_23885 ?auto_23888 ) ) ( not ( = ?auto_23885 ?auto_23880 ) ) ( not ( = ?auto_23894 ?auto_23881 ) ) ( not ( = ?auto_23894 ?auto_23892 ) ) ( not ( = ?auto_23894 ?auto_23891 ) ) ( not ( = ?auto_23894 ?auto_23886 ) ) ( not ( = ?auto_23890 ?auto_23893 ) ) ( not ( = ?auto_23890 ?auto_23889 ) ) ( not ( = ?auto_23890 ?auto_23879 ) ) ( not ( = ?auto_23890 ?auto_23887 ) ) ( not ( = ?auto_23865 ?auto_23871 ) ) ( not ( = ?auto_23865 ?auto_23883 ) ) ( not ( = ?auto_23866 ?auto_23871 ) ) ( not ( = ?auto_23866 ?auto_23883 ) ) ( not ( = ?auto_23867 ?auto_23871 ) ) ( not ( = ?auto_23867 ?auto_23883 ) ) ( not ( = ?auto_23868 ?auto_23871 ) ) ( not ( = ?auto_23868 ?auto_23883 ) ) ( not ( = ?auto_23869 ?auto_23871 ) ) ( not ( = ?auto_23869 ?auto_23883 ) ) ( not ( = ?auto_23871 ?auto_23890 ) ) ( not ( = ?auto_23871 ?auto_23893 ) ) ( not ( = ?auto_23871 ?auto_23889 ) ) ( not ( = ?auto_23871 ?auto_23879 ) ) ( not ( = ?auto_23871 ?auto_23887 ) ) ( not ( = ?auto_23883 ?auto_23890 ) ) ( not ( = ?auto_23883 ?auto_23893 ) ) ( not ( = ?auto_23883 ?auto_23889 ) ) ( not ( = ?auto_23883 ?auto_23879 ) ) ( not ( = ?auto_23883 ?auto_23887 ) ) ( not ( = ?auto_23865 ?auto_23872 ) ) ( not ( = ?auto_23865 ?auto_23876 ) ) ( not ( = ?auto_23866 ?auto_23872 ) ) ( not ( = ?auto_23866 ?auto_23876 ) ) ( not ( = ?auto_23867 ?auto_23872 ) ) ( not ( = ?auto_23867 ?auto_23876 ) ) ( not ( = ?auto_23868 ?auto_23872 ) ) ( not ( = ?auto_23868 ?auto_23876 ) ) ( not ( = ?auto_23869 ?auto_23872 ) ) ( not ( = ?auto_23869 ?auto_23876 ) ) ( not ( = ?auto_23870 ?auto_23872 ) ) ( not ( = ?auto_23870 ?auto_23876 ) ) ( not ( = ?auto_23872 ?auto_23883 ) ) ( not ( = ?auto_23872 ?auto_23890 ) ) ( not ( = ?auto_23872 ?auto_23893 ) ) ( not ( = ?auto_23872 ?auto_23889 ) ) ( not ( = ?auto_23872 ?auto_23879 ) ) ( not ( = ?auto_23872 ?auto_23887 ) ) ( not ( = ?auto_23878 ?auto_23888 ) ) ( not ( = ?auto_23878 ?auto_23885 ) ) ( not ( = ?auto_23878 ?auto_23882 ) ) ( not ( = ?auto_23878 ?auto_23884 ) ) ( not ( = ?auto_23878 ?auto_23880 ) ) ( not ( = ?auto_23873 ?auto_23891 ) ) ( not ( = ?auto_23873 ?auto_23894 ) ) ( not ( = ?auto_23873 ?auto_23881 ) ) ( not ( = ?auto_23873 ?auto_23892 ) ) ( not ( = ?auto_23873 ?auto_23886 ) ) ( not ( = ?auto_23876 ?auto_23883 ) ) ( not ( = ?auto_23876 ?auto_23890 ) ) ( not ( = ?auto_23876 ?auto_23893 ) ) ( not ( = ?auto_23876 ?auto_23889 ) ) ( not ( = ?auto_23876 ?auto_23879 ) ) ( not ( = ?auto_23876 ?auto_23887 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_23865 ?auto_23866 ?auto_23867 ?auto_23868 ?auto_23869 ?auto_23870 ?auto_23871 )
      ( MAKE-1CRATE ?auto_23871 ?auto_23872 )
      ( MAKE-7CRATE-VERIFY ?auto_23865 ?auto_23866 ?auto_23867 ?auto_23868 ?auto_23869 ?auto_23870 ?auto_23871 ?auto_23872 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23897 - SURFACE
      ?auto_23898 - SURFACE
    )
    :vars
    (
      ?auto_23899 - HOIST
      ?auto_23900 - PLACE
      ?auto_23902 - PLACE
      ?auto_23903 - HOIST
      ?auto_23904 - SURFACE
      ?auto_23901 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23899 ?auto_23900 ) ( SURFACE-AT ?auto_23897 ?auto_23900 ) ( CLEAR ?auto_23897 ) ( IS-CRATE ?auto_23898 ) ( AVAILABLE ?auto_23899 ) ( not ( = ?auto_23902 ?auto_23900 ) ) ( HOIST-AT ?auto_23903 ?auto_23902 ) ( AVAILABLE ?auto_23903 ) ( SURFACE-AT ?auto_23898 ?auto_23902 ) ( ON ?auto_23898 ?auto_23904 ) ( CLEAR ?auto_23898 ) ( TRUCK-AT ?auto_23901 ?auto_23900 ) ( not ( = ?auto_23897 ?auto_23898 ) ) ( not ( = ?auto_23897 ?auto_23904 ) ) ( not ( = ?auto_23898 ?auto_23904 ) ) ( not ( = ?auto_23899 ?auto_23903 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23901 ?auto_23900 ?auto_23902 )
      ( !LIFT ?auto_23903 ?auto_23898 ?auto_23904 ?auto_23902 )
      ( !LOAD ?auto_23903 ?auto_23898 ?auto_23901 ?auto_23902 )
      ( !DRIVE ?auto_23901 ?auto_23902 ?auto_23900 )
      ( !UNLOAD ?auto_23899 ?auto_23898 ?auto_23901 ?auto_23900 )
      ( !DROP ?auto_23899 ?auto_23898 ?auto_23897 ?auto_23900 )
      ( MAKE-1CRATE-VERIFY ?auto_23897 ?auto_23898 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_23914 - SURFACE
      ?auto_23915 - SURFACE
      ?auto_23916 - SURFACE
      ?auto_23917 - SURFACE
      ?auto_23918 - SURFACE
      ?auto_23919 - SURFACE
      ?auto_23920 - SURFACE
      ?auto_23922 - SURFACE
      ?auto_23921 - SURFACE
    )
    :vars
    (
      ?auto_23923 - HOIST
      ?auto_23925 - PLACE
      ?auto_23924 - PLACE
      ?auto_23926 - HOIST
      ?auto_23928 - SURFACE
      ?auto_23930 - PLACE
      ?auto_23931 - HOIST
      ?auto_23947 - SURFACE
      ?auto_23939 - PLACE
      ?auto_23941 - HOIST
      ?auto_23946 - SURFACE
      ?auto_23944 - PLACE
      ?auto_23936 - HOIST
      ?auto_23940 - SURFACE
      ?auto_23932 - PLACE
      ?auto_23933 - HOIST
      ?auto_23934 - SURFACE
      ?auto_23945 - PLACE
      ?auto_23942 - HOIST
      ?auto_23938 - SURFACE
      ?auto_23935 - SURFACE
      ?auto_23929 - PLACE
      ?auto_23943 - HOIST
      ?auto_23937 - SURFACE
      ?auto_23927 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23923 ?auto_23925 ) ( IS-CRATE ?auto_23921 ) ( not ( = ?auto_23924 ?auto_23925 ) ) ( HOIST-AT ?auto_23926 ?auto_23924 ) ( AVAILABLE ?auto_23926 ) ( SURFACE-AT ?auto_23921 ?auto_23924 ) ( ON ?auto_23921 ?auto_23928 ) ( CLEAR ?auto_23921 ) ( not ( = ?auto_23922 ?auto_23921 ) ) ( not ( = ?auto_23922 ?auto_23928 ) ) ( not ( = ?auto_23921 ?auto_23928 ) ) ( not ( = ?auto_23923 ?auto_23926 ) ) ( IS-CRATE ?auto_23922 ) ( not ( = ?auto_23930 ?auto_23925 ) ) ( HOIST-AT ?auto_23931 ?auto_23930 ) ( AVAILABLE ?auto_23931 ) ( SURFACE-AT ?auto_23922 ?auto_23930 ) ( ON ?auto_23922 ?auto_23947 ) ( CLEAR ?auto_23922 ) ( not ( = ?auto_23920 ?auto_23922 ) ) ( not ( = ?auto_23920 ?auto_23947 ) ) ( not ( = ?auto_23922 ?auto_23947 ) ) ( not ( = ?auto_23923 ?auto_23931 ) ) ( IS-CRATE ?auto_23920 ) ( not ( = ?auto_23939 ?auto_23925 ) ) ( HOIST-AT ?auto_23941 ?auto_23939 ) ( SURFACE-AT ?auto_23920 ?auto_23939 ) ( ON ?auto_23920 ?auto_23946 ) ( CLEAR ?auto_23920 ) ( not ( = ?auto_23919 ?auto_23920 ) ) ( not ( = ?auto_23919 ?auto_23946 ) ) ( not ( = ?auto_23920 ?auto_23946 ) ) ( not ( = ?auto_23923 ?auto_23941 ) ) ( IS-CRATE ?auto_23919 ) ( not ( = ?auto_23944 ?auto_23925 ) ) ( HOIST-AT ?auto_23936 ?auto_23944 ) ( AVAILABLE ?auto_23936 ) ( SURFACE-AT ?auto_23919 ?auto_23944 ) ( ON ?auto_23919 ?auto_23940 ) ( CLEAR ?auto_23919 ) ( not ( = ?auto_23918 ?auto_23919 ) ) ( not ( = ?auto_23918 ?auto_23940 ) ) ( not ( = ?auto_23919 ?auto_23940 ) ) ( not ( = ?auto_23923 ?auto_23936 ) ) ( IS-CRATE ?auto_23918 ) ( not ( = ?auto_23932 ?auto_23925 ) ) ( HOIST-AT ?auto_23933 ?auto_23932 ) ( AVAILABLE ?auto_23933 ) ( SURFACE-AT ?auto_23918 ?auto_23932 ) ( ON ?auto_23918 ?auto_23934 ) ( CLEAR ?auto_23918 ) ( not ( = ?auto_23917 ?auto_23918 ) ) ( not ( = ?auto_23917 ?auto_23934 ) ) ( not ( = ?auto_23918 ?auto_23934 ) ) ( not ( = ?auto_23923 ?auto_23933 ) ) ( IS-CRATE ?auto_23917 ) ( not ( = ?auto_23945 ?auto_23925 ) ) ( HOIST-AT ?auto_23942 ?auto_23945 ) ( AVAILABLE ?auto_23942 ) ( SURFACE-AT ?auto_23917 ?auto_23945 ) ( ON ?auto_23917 ?auto_23938 ) ( CLEAR ?auto_23917 ) ( not ( = ?auto_23916 ?auto_23917 ) ) ( not ( = ?auto_23916 ?auto_23938 ) ) ( not ( = ?auto_23917 ?auto_23938 ) ) ( not ( = ?auto_23923 ?auto_23942 ) ) ( IS-CRATE ?auto_23916 ) ( AVAILABLE ?auto_23941 ) ( SURFACE-AT ?auto_23916 ?auto_23939 ) ( ON ?auto_23916 ?auto_23935 ) ( CLEAR ?auto_23916 ) ( not ( = ?auto_23915 ?auto_23916 ) ) ( not ( = ?auto_23915 ?auto_23935 ) ) ( not ( = ?auto_23916 ?auto_23935 ) ) ( SURFACE-AT ?auto_23914 ?auto_23925 ) ( CLEAR ?auto_23914 ) ( IS-CRATE ?auto_23915 ) ( AVAILABLE ?auto_23923 ) ( not ( = ?auto_23929 ?auto_23925 ) ) ( HOIST-AT ?auto_23943 ?auto_23929 ) ( AVAILABLE ?auto_23943 ) ( SURFACE-AT ?auto_23915 ?auto_23929 ) ( ON ?auto_23915 ?auto_23937 ) ( CLEAR ?auto_23915 ) ( TRUCK-AT ?auto_23927 ?auto_23925 ) ( not ( = ?auto_23914 ?auto_23915 ) ) ( not ( = ?auto_23914 ?auto_23937 ) ) ( not ( = ?auto_23915 ?auto_23937 ) ) ( not ( = ?auto_23923 ?auto_23943 ) ) ( not ( = ?auto_23914 ?auto_23916 ) ) ( not ( = ?auto_23914 ?auto_23935 ) ) ( not ( = ?auto_23916 ?auto_23937 ) ) ( not ( = ?auto_23939 ?auto_23929 ) ) ( not ( = ?auto_23941 ?auto_23943 ) ) ( not ( = ?auto_23935 ?auto_23937 ) ) ( not ( = ?auto_23914 ?auto_23917 ) ) ( not ( = ?auto_23914 ?auto_23938 ) ) ( not ( = ?auto_23915 ?auto_23917 ) ) ( not ( = ?auto_23915 ?auto_23938 ) ) ( not ( = ?auto_23917 ?auto_23935 ) ) ( not ( = ?auto_23917 ?auto_23937 ) ) ( not ( = ?auto_23945 ?auto_23939 ) ) ( not ( = ?auto_23945 ?auto_23929 ) ) ( not ( = ?auto_23942 ?auto_23941 ) ) ( not ( = ?auto_23942 ?auto_23943 ) ) ( not ( = ?auto_23938 ?auto_23935 ) ) ( not ( = ?auto_23938 ?auto_23937 ) ) ( not ( = ?auto_23914 ?auto_23918 ) ) ( not ( = ?auto_23914 ?auto_23934 ) ) ( not ( = ?auto_23915 ?auto_23918 ) ) ( not ( = ?auto_23915 ?auto_23934 ) ) ( not ( = ?auto_23916 ?auto_23918 ) ) ( not ( = ?auto_23916 ?auto_23934 ) ) ( not ( = ?auto_23918 ?auto_23938 ) ) ( not ( = ?auto_23918 ?auto_23935 ) ) ( not ( = ?auto_23918 ?auto_23937 ) ) ( not ( = ?auto_23932 ?auto_23945 ) ) ( not ( = ?auto_23932 ?auto_23939 ) ) ( not ( = ?auto_23932 ?auto_23929 ) ) ( not ( = ?auto_23933 ?auto_23942 ) ) ( not ( = ?auto_23933 ?auto_23941 ) ) ( not ( = ?auto_23933 ?auto_23943 ) ) ( not ( = ?auto_23934 ?auto_23938 ) ) ( not ( = ?auto_23934 ?auto_23935 ) ) ( not ( = ?auto_23934 ?auto_23937 ) ) ( not ( = ?auto_23914 ?auto_23919 ) ) ( not ( = ?auto_23914 ?auto_23940 ) ) ( not ( = ?auto_23915 ?auto_23919 ) ) ( not ( = ?auto_23915 ?auto_23940 ) ) ( not ( = ?auto_23916 ?auto_23919 ) ) ( not ( = ?auto_23916 ?auto_23940 ) ) ( not ( = ?auto_23917 ?auto_23919 ) ) ( not ( = ?auto_23917 ?auto_23940 ) ) ( not ( = ?auto_23919 ?auto_23934 ) ) ( not ( = ?auto_23919 ?auto_23938 ) ) ( not ( = ?auto_23919 ?auto_23935 ) ) ( not ( = ?auto_23919 ?auto_23937 ) ) ( not ( = ?auto_23944 ?auto_23932 ) ) ( not ( = ?auto_23944 ?auto_23945 ) ) ( not ( = ?auto_23944 ?auto_23939 ) ) ( not ( = ?auto_23944 ?auto_23929 ) ) ( not ( = ?auto_23936 ?auto_23933 ) ) ( not ( = ?auto_23936 ?auto_23942 ) ) ( not ( = ?auto_23936 ?auto_23941 ) ) ( not ( = ?auto_23936 ?auto_23943 ) ) ( not ( = ?auto_23940 ?auto_23934 ) ) ( not ( = ?auto_23940 ?auto_23938 ) ) ( not ( = ?auto_23940 ?auto_23935 ) ) ( not ( = ?auto_23940 ?auto_23937 ) ) ( not ( = ?auto_23914 ?auto_23920 ) ) ( not ( = ?auto_23914 ?auto_23946 ) ) ( not ( = ?auto_23915 ?auto_23920 ) ) ( not ( = ?auto_23915 ?auto_23946 ) ) ( not ( = ?auto_23916 ?auto_23920 ) ) ( not ( = ?auto_23916 ?auto_23946 ) ) ( not ( = ?auto_23917 ?auto_23920 ) ) ( not ( = ?auto_23917 ?auto_23946 ) ) ( not ( = ?auto_23918 ?auto_23920 ) ) ( not ( = ?auto_23918 ?auto_23946 ) ) ( not ( = ?auto_23920 ?auto_23940 ) ) ( not ( = ?auto_23920 ?auto_23934 ) ) ( not ( = ?auto_23920 ?auto_23938 ) ) ( not ( = ?auto_23920 ?auto_23935 ) ) ( not ( = ?auto_23920 ?auto_23937 ) ) ( not ( = ?auto_23946 ?auto_23940 ) ) ( not ( = ?auto_23946 ?auto_23934 ) ) ( not ( = ?auto_23946 ?auto_23938 ) ) ( not ( = ?auto_23946 ?auto_23935 ) ) ( not ( = ?auto_23946 ?auto_23937 ) ) ( not ( = ?auto_23914 ?auto_23922 ) ) ( not ( = ?auto_23914 ?auto_23947 ) ) ( not ( = ?auto_23915 ?auto_23922 ) ) ( not ( = ?auto_23915 ?auto_23947 ) ) ( not ( = ?auto_23916 ?auto_23922 ) ) ( not ( = ?auto_23916 ?auto_23947 ) ) ( not ( = ?auto_23917 ?auto_23922 ) ) ( not ( = ?auto_23917 ?auto_23947 ) ) ( not ( = ?auto_23918 ?auto_23922 ) ) ( not ( = ?auto_23918 ?auto_23947 ) ) ( not ( = ?auto_23919 ?auto_23922 ) ) ( not ( = ?auto_23919 ?auto_23947 ) ) ( not ( = ?auto_23922 ?auto_23946 ) ) ( not ( = ?auto_23922 ?auto_23940 ) ) ( not ( = ?auto_23922 ?auto_23934 ) ) ( not ( = ?auto_23922 ?auto_23938 ) ) ( not ( = ?auto_23922 ?auto_23935 ) ) ( not ( = ?auto_23922 ?auto_23937 ) ) ( not ( = ?auto_23930 ?auto_23939 ) ) ( not ( = ?auto_23930 ?auto_23944 ) ) ( not ( = ?auto_23930 ?auto_23932 ) ) ( not ( = ?auto_23930 ?auto_23945 ) ) ( not ( = ?auto_23930 ?auto_23929 ) ) ( not ( = ?auto_23931 ?auto_23941 ) ) ( not ( = ?auto_23931 ?auto_23936 ) ) ( not ( = ?auto_23931 ?auto_23933 ) ) ( not ( = ?auto_23931 ?auto_23942 ) ) ( not ( = ?auto_23931 ?auto_23943 ) ) ( not ( = ?auto_23947 ?auto_23946 ) ) ( not ( = ?auto_23947 ?auto_23940 ) ) ( not ( = ?auto_23947 ?auto_23934 ) ) ( not ( = ?auto_23947 ?auto_23938 ) ) ( not ( = ?auto_23947 ?auto_23935 ) ) ( not ( = ?auto_23947 ?auto_23937 ) ) ( not ( = ?auto_23914 ?auto_23921 ) ) ( not ( = ?auto_23914 ?auto_23928 ) ) ( not ( = ?auto_23915 ?auto_23921 ) ) ( not ( = ?auto_23915 ?auto_23928 ) ) ( not ( = ?auto_23916 ?auto_23921 ) ) ( not ( = ?auto_23916 ?auto_23928 ) ) ( not ( = ?auto_23917 ?auto_23921 ) ) ( not ( = ?auto_23917 ?auto_23928 ) ) ( not ( = ?auto_23918 ?auto_23921 ) ) ( not ( = ?auto_23918 ?auto_23928 ) ) ( not ( = ?auto_23919 ?auto_23921 ) ) ( not ( = ?auto_23919 ?auto_23928 ) ) ( not ( = ?auto_23920 ?auto_23921 ) ) ( not ( = ?auto_23920 ?auto_23928 ) ) ( not ( = ?auto_23921 ?auto_23947 ) ) ( not ( = ?auto_23921 ?auto_23946 ) ) ( not ( = ?auto_23921 ?auto_23940 ) ) ( not ( = ?auto_23921 ?auto_23934 ) ) ( not ( = ?auto_23921 ?auto_23938 ) ) ( not ( = ?auto_23921 ?auto_23935 ) ) ( not ( = ?auto_23921 ?auto_23937 ) ) ( not ( = ?auto_23924 ?auto_23930 ) ) ( not ( = ?auto_23924 ?auto_23939 ) ) ( not ( = ?auto_23924 ?auto_23944 ) ) ( not ( = ?auto_23924 ?auto_23932 ) ) ( not ( = ?auto_23924 ?auto_23945 ) ) ( not ( = ?auto_23924 ?auto_23929 ) ) ( not ( = ?auto_23926 ?auto_23931 ) ) ( not ( = ?auto_23926 ?auto_23941 ) ) ( not ( = ?auto_23926 ?auto_23936 ) ) ( not ( = ?auto_23926 ?auto_23933 ) ) ( not ( = ?auto_23926 ?auto_23942 ) ) ( not ( = ?auto_23926 ?auto_23943 ) ) ( not ( = ?auto_23928 ?auto_23947 ) ) ( not ( = ?auto_23928 ?auto_23946 ) ) ( not ( = ?auto_23928 ?auto_23940 ) ) ( not ( = ?auto_23928 ?auto_23934 ) ) ( not ( = ?auto_23928 ?auto_23938 ) ) ( not ( = ?auto_23928 ?auto_23935 ) ) ( not ( = ?auto_23928 ?auto_23937 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_23914 ?auto_23915 ?auto_23916 ?auto_23917 ?auto_23918 ?auto_23919 ?auto_23920 ?auto_23922 )
      ( MAKE-1CRATE ?auto_23922 ?auto_23921 )
      ( MAKE-8CRATE-VERIFY ?auto_23914 ?auto_23915 ?auto_23916 ?auto_23917 ?auto_23918 ?auto_23919 ?auto_23920 ?auto_23922 ?auto_23921 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23950 - SURFACE
      ?auto_23951 - SURFACE
    )
    :vars
    (
      ?auto_23952 - HOIST
      ?auto_23953 - PLACE
      ?auto_23955 - PLACE
      ?auto_23956 - HOIST
      ?auto_23957 - SURFACE
      ?auto_23954 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23952 ?auto_23953 ) ( SURFACE-AT ?auto_23950 ?auto_23953 ) ( CLEAR ?auto_23950 ) ( IS-CRATE ?auto_23951 ) ( AVAILABLE ?auto_23952 ) ( not ( = ?auto_23955 ?auto_23953 ) ) ( HOIST-AT ?auto_23956 ?auto_23955 ) ( AVAILABLE ?auto_23956 ) ( SURFACE-AT ?auto_23951 ?auto_23955 ) ( ON ?auto_23951 ?auto_23957 ) ( CLEAR ?auto_23951 ) ( TRUCK-AT ?auto_23954 ?auto_23953 ) ( not ( = ?auto_23950 ?auto_23951 ) ) ( not ( = ?auto_23950 ?auto_23957 ) ) ( not ( = ?auto_23951 ?auto_23957 ) ) ( not ( = ?auto_23952 ?auto_23956 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23954 ?auto_23953 ?auto_23955 )
      ( !LIFT ?auto_23956 ?auto_23951 ?auto_23957 ?auto_23955 )
      ( !LOAD ?auto_23956 ?auto_23951 ?auto_23954 ?auto_23955 )
      ( !DRIVE ?auto_23954 ?auto_23955 ?auto_23953 )
      ( !UNLOAD ?auto_23952 ?auto_23951 ?auto_23954 ?auto_23953 )
      ( !DROP ?auto_23952 ?auto_23951 ?auto_23950 ?auto_23953 )
      ( MAKE-1CRATE-VERIFY ?auto_23950 ?auto_23951 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_23968 - SURFACE
      ?auto_23969 - SURFACE
      ?auto_23970 - SURFACE
      ?auto_23971 - SURFACE
      ?auto_23972 - SURFACE
      ?auto_23973 - SURFACE
      ?auto_23974 - SURFACE
      ?auto_23977 - SURFACE
      ?auto_23976 - SURFACE
      ?auto_23975 - SURFACE
    )
    :vars
    (
      ?auto_23979 - HOIST
      ?auto_23978 - PLACE
      ?auto_23982 - PLACE
      ?auto_23983 - HOIST
      ?auto_23980 - SURFACE
      ?auto_24005 - PLACE
      ?auto_24001 - HOIST
      ?auto_23988 - SURFACE
      ?auto_23989 - PLACE
      ?auto_24000 - HOIST
      ?auto_23984 - SURFACE
      ?auto_23990 - PLACE
      ?auto_23992 - HOIST
      ?auto_23999 - SURFACE
      ?auto_23985 - PLACE
      ?auto_23994 - HOIST
      ?auto_23991 - SURFACE
      ?auto_23998 - PLACE
      ?auto_23997 - HOIST
      ?auto_23996 - SURFACE
      ?auto_24003 - PLACE
      ?auto_23993 - HOIST
      ?auto_23986 - SURFACE
      ?auto_23995 - SURFACE
      ?auto_24004 - PLACE
      ?auto_24002 - HOIST
      ?auto_23987 - SURFACE
      ?auto_23981 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23979 ?auto_23978 ) ( IS-CRATE ?auto_23975 ) ( not ( = ?auto_23982 ?auto_23978 ) ) ( HOIST-AT ?auto_23983 ?auto_23982 ) ( AVAILABLE ?auto_23983 ) ( SURFACE-AT ?auto_23975 ?auto_23982 ) ( ON ?auto_23975 ?auto_23980 ) ( CLEAR ?auto_23975 ) ( not ( = ?auto_23976 ?auto_23975 ) ) ( not ( = ?auto_23976 ?auto_23980 ) ) ( not ( = ?auto_23975 ?auto_23980 ) ) ( not ( = ?auto_23979 ?auto_23983 ) ) ( IS-CRATE ?auto_23976 ) ( not ( = ?auto_24005 ?auto_23978 ) ) ( HOIST-AT ?auto_24001 ?auto_24005 ) ( AVAILABLE ?auto_24001 ) ( SURFACE-AT ?auto_23976 ?auto_24005 ) ( ON ?auto_23976 ?auto_23988 ) ( CLEAR ?auto_23976 ) ( not ( = ?auto_23977 ?auto_23976 ) ) ( not ( = ?auto_23977 ?auto_23988 ) ) ( not ( = ?auto_23976 ?auto_23988 ) ) ( not ( = ?auto_23979 ?auto_24001 ) ) ( IS-CRATE ?auto_23977 ) ( not ( = ?auto_23989 ?auto_23978 ) ) ( HOIST-AT ?auto_24000 ?auto_23989 ) ( AVAILABLE ?auto_24000 ) ( SURFACE-AT ?auto_23977 ?auto_23989 ) ( ON ?auto_23977 ?auto_23984 ) ( CLEAR ?auto_23977 ) ( not ( = ?auto_23974 ?auto_23977 ) ) ( not ( = ?auto_23974 ?auto_23984 ) ) ( not ( = ?auto_23977 ?auto_23984 ) ) ( not ( = ?auto_23979 ?auto_24000 ) ) ( IS-CRATE ?auto_23974 ) ( not ( = ?auto_23990 ?auto_23978 ) ) ( HOIST-AT ?auto_23992 ?auto_23990 ) ( SURFACE-AT ?auto_23974 ?auto_23990 ) ( ON ?auto_23974 ?auto_23999 ) ( CLEAR ?auto_23974 ) ( not ( = ?auto_23973 ?auto_23974 ) ) ( not ( = ?auto_23973 ?auto_23999 ) ) ( not ( = ?auto_23974 ?auto_23999 ) ) ( not ( = ?auto_23979 ?auto_23992 ) ) ( IS-CRATE ?auto_23973 ) ( not ( = ?auto_23985 ?auto_23978 ) ) ( HOIST-AT ?auto_23994 ?auto_23985 ) ( AVAILABLE ?auto_23994 ) ( SURFACE-AT ?auto_23973 ?auto_23985 ) ( ON ?auto_23973 ?auto_23991 ) ( CLEAR ?auto_23973 ) ( not ( = ?auto_23972 ?auto_23973 ) ) ( not ( = ?auto_23972 ?auto_23991 ) ) ( not ( = ?auto_23973 ?auto_23991 ) ) ( not ( = ?auto_23979 ?auto_23994 ) ) ( IS-CRATE ?auto_23972 ) ( not ( = ?auto_23998 ?auto_23978 ) ) ( HOIST-AT ?auto_23997 ?auto_23998 ) ( AVAILABLE ?auto_23997 ) ( SURFACE-AT ?auto_23972 ?auto_23998 ) ( ON ?auto_23972 ?auto_23996 ) ( CLEAR ?auto_23972 ) ( not ( = ?auto_23971 ?auto_23972 ) ) ( not ( = ?auto_23971 ?auto_23996 ) ) ( not ( = ?auto_23972 ?auto_23996 ) ) ( not ( = ?auto_23979 ?auto_23997 ) ) ( IS-CRATE ?auto_23971 ) ( not ( = ?auto_24003 ?auto_23978 ) ) ( HOIST-AT ?auto_23993 ?auto_24003 ) ( AVAILABLE ?auto_23993 ) ( SURFACE-AT ?auto_23971 ?auto_24003 ) ( ON ?auto_23971 ?auto_23986 ) ( CLEAR ?auto_23971 ) ( not ( = ?auto_23970 ?auto_23971 ) ) ( not ( = ?auto_23970 ?auto_23986 ) ) ( not ( = ?auto_23971 ?auto_23986 ) ) ( not ( = ?auto_23979 ?auto_23993 ) ) ( IS-CRATE ?auto_23970 ) ( AVAILABLE ?auto_23992 ) ( SURFACE-AT ?auto_23970 ?auto_23990 ) ( ON ?auto_23970 ?auto_23995 ) ( CLEAR ?auto_23970 ) ( not ( = ?auto_23969 ?auto_23970 ) ) ( not ( = ?auto_23969 ?auto_23995 ) ) ( not ( = ?auto_23970 ?auto_23995 ) ) ( SURFACE-AT ?auto_23968 ?auto_23978 ) ( CLEAR ?auto_23968 ) ( IS-CRATE ?auto_23969 ) ( AVAILABLE ?auto_23979 ) ( not ( = ?auto_24004 ?auto_23978 ) ) ( HOIST-AT ?auto_24002 ?auto_24004 ) ( AVAILABLE ?auto_24002 ) ( SURFACE-AT ?auto_23969 ?auto_24004 ) ( ON ?auto_23969 ?auto_23987 ) ( CLEAR ?auto_23969 ) ( TRUCK-AT ?auto_23981 ?auto_23978 ) ( not ( = ?auto_23968 ?auto_23969 ) ) ( not ( = ?auto_23968 ?auto_23987 ) ) ( not ( = ?auto_23969 ?auto_23987 ) ) ( not ( = ?auto_23979 ?auto_24002 ) ) ( not ( = ?auto_23968 ?auto_23970 ) ) ( not ( = ?auto_23968 ?auto_23995 ) ) ( not ( = ?auto_23970 ?auto_23987 ) ) ( not ( = ?auto_23990 ?auto_24004 ) ) ( not ( = ?auto_23992 ?auto_24002 ) ) ( not ( = ?auto_23995 ?auto_23987 ) ) ( not ( = ?auto_23968 ?auto_23971 ) ) ( not ( = ?auto_23968 ?auto_23986 ) ) ( not ( = ?auto_23969 ?auto_23971 ) ) ( not ( = ?auto_23969 ?auto_23986 ) ) ( not ( = ?auto_23971 ?auto_23995 ) ) ( not ( = ?auto_23971 ?auto_23987 ) ) ( not ( = ?auto_24003 ?auto_23990 ) ) ( not ( = ?auto_24003 ?auto_24004 ) ) ( not ( = ?auto_23993 ?auto_23992 ) ) ( not ( = ?auto_23993 ?auto_24002 ) ) ( not ( = ?auto_23986 ?auto_23995 ) ) ( not ( = ?auto_23986 ?auto_23987 ) ) ( not ( = ?auto_23968 ?auto_23972 ) ) ( not ( = ?auto_23968 ?auto_23996 ) ) ( not ( = ?auto_23969 ?auto_23972 ) ) ( not ( = ?auto_23969 ?auto_23996 ) ) ( not ( = ?auto_23970 ?auto_23972 ) ) ( not ( = ?auto_23970 ?auto_23996 ) ) ( not ( = ?auto_23972 ?auto_23986 ) ) ( not ( = ?auto_23972 ?auto_23995 ) ) ( not ( = ?auto_23972 ?auto_23987 ) ) ( not ( = ?auto_23998 ?auto_24003 ) ) ( not ( = ?auto_23998 ?auto_23990 ) ) ( not ( = ?auto_23998 ?auto_24004 ) ) ( not ( = ?auto_23997 ?auto_23993 ) ) ( not ( = ?auto_23997 ?auto_23992 ) ) ( not ( = ?auto_23997 ?auto_24002 ) ) ( not ( = ?auto_23996 ?auto_23986 ) ) ( not ( = ?auto_23996 ?auto_23995 ) ) ( not ( = ?auto_23996 ?auto_23987 ) ) ( not ( = ?auto_23968 ?auto_23973 ) ) ( not ( = ?auto_23968 ?auto_23991 ) ) ( not ( = ?auto_23969 ?auto_23973 ) ) ( not ( = ?auto_23969 ?auto_23991 ) ) ( not ( = ?auto_23970 ?auto_23973 ) ) ( not ( = ?auto_23970 ?auto_23991 ) ) ( not ( = ?auto_23971 ?auto_23973 ) ) ( not ( = ?auto_23971 ?auto_23991 ) ) ( not ( = ?auto_23973 ?auto_23996 ) ) ( not ( = ?auto_23973 ?auto_23986 ) ) ( not ( = ?auto_23973 ?auto_23995 ) ) ( not ( = ?auto_23973 ?auto_23987 ) ) ( not ( = ?auto_23985 ?auto_23998 ) ) ( not ( = ?auto_23985 ?auto_24003 ) ) ( not ( = ?auto_23985 ?auto_23990 ) ) ( not ( = ?auto_23985 ?auto_24004 ) ) ( not ( = ?auto_23994 ?auto_23997 ) ) ( not ( = ?auto_23994 ?auto_23993 ) ) ( not ( = ?auto_23994 ?auto_23992 ) ) ( not ( = ?auto_23994 ?auto_24002 ) ) ( not ( = ?auto_23991 ?auto_23996 ) ) ( not ( = ?auto_23991 ?auto_23986 ) ) ( not ( = ?auto_23991 ?auto_23995 ) ) ( not ( = ?auto_23991 ?auto_23987 ) ) ( not ( = ?auto_23968 ?auto_23974 ) ) ( not ( = ?auto_23968 ?auto_23999 ) ) ( not ( = ?auto_23969 ?auto_23974 ) ) ( not ( = ?auto_23969 ?auto_23999 ) ) ( not ( = ?auto_23970 ?auto_23974 ) ) ( not ( = ?auto_23970 ?auto_23999 ) ) ( not ( = ?auto_23971 ?auto_23974 ) ) ( not ( = ?auto_23971 ?auto_23999 ) ) ( not ( = ?auto_23972 ?auto_23974 ) ) ( not ( = ?auto_23972 ?auto_23999 ) ) ( not ( = ?auto_23974 ?auto_23991 ) ) ( not ( = ?auto_23974 ?auto_23996 ) ) ( not ( = ?auto_23974 ?auto_23986 ) ) ( not ( = ?auto_23974 ?auto_23995 ) ) ( not ( = ?auto_23974 ?auto_23987 ) ) ( not ( = ?auto_23999 ?auto_23991 ) ) ( not ( = ?auto_23999 ?auto_23996 ) ) ( not ( = ?auto_23999 ?auto_23986 ) ) ( not ( = ?auto_23999 ?auto_23995 ) ) ( not ( = ?auto_23999 ?auto_23987 ) ) ( not ( = ?auto_23968 ?auto_23977 ) ) ( not ( = ?auto_23968 ?auto_23984 ) ) ( not ( = ?auto_23969 ?auto_23977 ) ) ( not ( = ?auto_23969 ?auto_23984 ) ) ( not ( = ?auto_23970 ?auto_23977 ) ) ( not ( = ?auto_23970 ?auto_23984 ) ) ( not ( = ?auto_23971 ?auto_23977 ) ) ( not ( = ?auto_23971 ?auto_23984 ) ) ( not ( = ?auto_23972 ?auto_23977 ) ) ( not ( = ?auto_23972 ?auto_23984 ) ) ( not ( = ?auto_23973 ?auto_23977 ) ) ( not ( = ?auto_23973 ?auto_23984 ) ) ( not ( = ?auto_23977 ?auto_23999 ) ) ( not ( = ?auto_23977 ?auto_23991 ) ) ( not ( = ?auto_23977 ?auto_23996 ) ) ( not ( = ?auto_23977 ?auto_23986 ) ) ( not ( = ?auto_23977 ?auto_23995 ) ) ( not ( = ?auto_23977 ?auto_23987 ) ) ( not ( = ?auto_23989 ?auto_23990 ) ) ( not ( = ?auto_23989 ?auto_23985 ) ) ( not ( = ?auto_23989 ?auto_23998 ) ) ( not ( = ?auto_23989 ?auto_24003 ) ) ( not ( = ?auto_23989 ?auto_24004 ) ) ( not ( = ?auto_24000 ?auto_23992 ) ) ( not ( = ?auto_24000 ?auto_23994 ) ) ( not ( = ?auto_24000 ?auto_23997 ) ) ( not ( = ?auto_24000 ?auto_23993 ) ) ( not ( = ?auto_24000 ?auto_24002 ) ) ( not ( = ?auto_23984 ?auto_23999 ) ) ( not ( = ?auto_23984 ?auto_23991 ) ) ( not ( = ?auto_23984 ?auto_23996 ) ) ( not ( = ?auto_23984 ?auto_23986 ) ) ( not ( = ?auto_23984 ?auto_23995 ) ) ( not ( = ?auto_23984 ?auto_23987 ) ) ( not ( = ?auto_23968 ?auto_23976 ) ) ( not ( = ?auto_23968 ?auto_23988 ) ) ( not ( = ?auto_23969 ?auto_23976 ) ) ( not ( = ?auto_23969 ?auto_23988 ) ) ( not ( = ?auto_23970 ?auto_23976 ) ) ( not ( = ?auto_23970 ?auto_23988 ) ) ( not ( = ?auto_23971 ?auto_23976 ) ) ( not ( = ?auto_23971 ?auto_23988 ) ) ( not ( = ?auto_23972 ?auto_23976 ) ) ( not ( = ?auto_23972 ?auto_23988 ) ) ( not ( = ?auto_23973 ?auto_23976 ) ) ( not ( = ?auto_23973 ?auto_23988 ) ) ( not ( = ?auto_23974 ?auto_23976 ) ) ( not ( = ?auto_23974 ?auto_23988 ) ) ( not ( = ?auto_23976 ?auto_23984 ) ) ( not ( = ?auto_23976 ?auto_23999 ) ) ( not ( = ?auto_23976 ?auto_23991 ) ) ( not ( = ?auto_23976 ?auto_23996 ) ) ( not ( = ?auto_23976 ?auto_23986 ) ) ( not ( = ?auto_23976 ?auto_23995 ) ) ( not ( = ?auto_23976 ?auto_23987 ) ) ( not ( = ?auto_24005 ?auto_23989 ) ) ( not ( = ?auto_24005 ?auto_23990 ) ) ( not ( = ?auto_24005 ?auto_23985 ) ) ( not ( = ?auto_24005 ?auto_23998 ) ) ( not ( = ?auto_24005 ?auto_24003 ) ) ( not ( = ?auto_24005 ?auto_24004 ) ) ( not ( = ?auto_24001 ?auto_24000 ) ) ( not ( = ?auto_24001 ?auto_23992 ) ) ( not ( = ?auto_24001 ?auto_23994 ) ) ( not ( = ?auto_24001 ?auto_23997 ) ) ( not ( = ?auto_24001 ?auto_23993 ) ) ( not ( = ?auto_24001 ?auto_24002 ) ) ( not ( = ?auto_23988 ?auto_23984 ) ) ( not ( = ?auto_23988 ?auto_23999 ) ) ( not ( = ?auto_23988 ?auto_23991 ) ) ( not ( = ?auto_23988 ?auto_23996 ) ) ( not ( = ?auto_23988 ?auto_23986 ) ) ( not ( = ?auto_23988 ?auto_23995 ) ) ( not ( = ?auto_23988 ?auto_23987 ) ) ( not ( = ?auto_23968 ?auto_23975 ) ) ( not ( = ?auto_23968 ?auto_23980 ) ) ( not ( = ?auto_23969 ?auto_23975 ) ) ( not ( = ?auto_23969 ?auto_23980 ) ) ( not ( = ?auto_23970 ?auto_23975 ) ) ( not ( = ?auto_23970 ?auto_23980 ) ) ( not ( = ?auto_23971 ?auto_23975 ) ) ( not ( = ?auto_23971 ?auto_23980 ) ) ( not ( = ?auto_23972 ?auto_23975 ) ) ( not ( = ?auto_23972 ?auto_23980 ) ) ( not ( = ?auto_23973 ?auto_23975 ) ) ( not ( = ?auto_23973 ?auto_23980 ) ) ( not ( = ?auto_23974 ?auto_23975 ) ) ( not ( = ?auto_23974 ?auto_23980 ) ) ( not ( = ?auto_23977 ?auto_23975 ) ) ( not ( = ?auto_23977 ?auto_23980 ) ) ( not ( = ?auto_23975 ?auto_23988 ) ) ( not ( = ?auto_23975 ?auto_23984 ) ) ( not ( = ?auto_23975 ?auto_23999 ) ) ( not ( = ?auto_23975 ?auto_23991 ) ) ( not ( = ?auto_23975 ?auto_23996 ) ) ( not ( = ?auto_23975 ?auto_23986 ) ) ( not ( = ?auto_23975 ?auto_23995 ) ) ( not ( = ?auto_23975 ?auto_23987 ) ) ( not ( = ?auto_23982 ?auto_24005 ) ) ( not ( = ?auto_23982 ?auto_23989 ) ) ( not ( = ?auto_23982 ?auto_23990 ) ) ( not ( = ?auto_23982 ?auto_23985 ) ) ( not ( = ?auto_23982 ?auto_23998 ) ) ( not ( = ?auto_23982 ?auto_24003 ) ) ( not ( = ?auto_23982 ?auto_24004 ) ) ( not ( = ?auto_23983 ?auto_24001 ) ) ( not ( = ?auto_23983 ?auto_24000 ) ) ( not ( = ?auto_23983 ?auto_23992 ) ) ( not ( = ?auto_23983 ?auto_23994 ) ) ( not ( = ?auto_23983 ?auto_23997 ) ) ( not ( = ?auto_23983 ?auto_23993 ) ) ( not ( = ?auto_23983 ?auto_24002 ) ) ( not ( = ?auto_23980 ?auto_23988 ) ) ( not ( = ?auto_23980 ?auto_23984 ) ) ( not ( = ?auto_23980 ?auto_23999 ) ) ( not ( = ?auto_23980 ?auto_23991 ) ) ( not ( = ?auto_23980 ?auto_23996 ) ) ( not ( = ?auto_23980 ?auto_23986 ) ) ( not ( = ?auto_23980 ?auto_23995 ) ) ( not ( = ?auto_23980 ?auto_23987 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_23968 ?auto_23969 ?auto_23970 ?auto_23971 ?auto_23972 ?auto_23973 ?auto_23974 ?auto_23977 ?auto_23976 )
      ( MAKE-1CRATE ?auto_23976 ?auto_23975 )
      ( MAKE-9CRATE-VERIFY ?auto_23968 ?auto_23969 ?auto_23970 ?auto_23971 ?auto_23972 ?auto_23973 ?auto_23974 ?auto_23977 ?auto_23976 ?auto_23975 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24008 - SURFACE
      ?auto_24009 - SURFACE
    )
    :vars
    (
      ?auto_24010 - HOIST
      ?auto_24011 - PLACE
      ?auto_24013 - PLACE
      ?auto_24014 - HOIST
      ?auto_24015 - SURFACE
      ?auto_24012 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24010 ?auto_24011 ) ( SURFACE-AT ?auto_24008 ?auto_24011 ) ( CLEAR ?auto_24008 ) ( IS-CRATE ?auto_24009 ) ( AVAILABLE ?auto_24010 ) ( not ( = ?auto_24013 ?auto_24011 ) ) ( HOIST-AT ?auto_24014 ?auto_24013 ) ( AVAILABLE ?auto_24014 ) ( SURFACE-AT ?auto_24009 ?auto_24013 ) ( ON ?auto_24009 ?auto_24015 ) ( CLEAR ?auto_24009 ) ( TRUCK-AT ?auto_24012 ?auto_24011 ) ( not ( = ?auto_24008 ?auto_24009 ) ) ( not ( = ?auto_24008 ?auto_24015 ) ) ( not ( = ?auto_24009 ?auto_24015 ) ) ( not ( = ?auto_24010 ?auto_24014 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24012 ?auto_24011 ?auto_24013 )
      ( !LIFT ?auto_24014 ?auto_24009 ?auto_24015 ?auto_24013 )
      ( !LOAD ?auto_24014 ?auto_24009 ?auto_24012 ?auto_24013 )
      ( !DRIVE ?auto_24012 ?auto_24013 ?auto_24011 )
      ( !UNLOAD ?auto_24010 ?auto_24009 ?auto_24012 ?auto_24011 )
      ( !DROP ?auto_24010 ?auto_24009 ?auto_24008 ?auto_24011 )
      ( MAKE-1CRATE-VERIFY ?auto_24008 ?auto_24009 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_24027 - SURFACE
      ?auto_24028 - SURFACE
      ?auto_24029 - SURFACE
      ?auto_24030 - SURFACE
      ?auto_24031 - SURFACE
      ?auto_24032 - SURFACE
      ?auto_24033 - SURFACE
      ?auto_24036 - SURFACE
      ?auto_24035 - SURFACE
      ?auto_24034 - SURFACE
      ?auto_24037 - SURFACE
    )
    :vars
    (
      ?auto_24042 - HOIST
      ?auto_24039 - PLACE
      ?auto_24040 - PLACE
      ?auto_24038 - HOIST
      ?auto_24043 - SURFACE
      ?auto_24046 - PLACE
      ?auto_24047 - HOIST
      ?auto_24045 - SURFACE
      ?auto_24044 - PLACE
      ?auto_24062 - HOIST
      ?auto_24067 - SURFACE
      ?auto_24066 - PLACE
      ?auto_24064 - HOIST
      ?auto_24060 - SURFACE
      ?auto_24056 - PLACE
      ?auto_24053 - HOIST
      ?auto_24057 - SURFACE
      ?auto_24058 - PLACE
      ?auto_24055 - HOIST
      ?auto_24050 - SURFACE
      ?auto_24068 - PLACE
      ?auto_24049 - HOIST
      ?auto_24065 - SURFACE
      ?auto_24063 - PLACE
      ?auto_24048 - HOIST
      ?auto_24054 - SURFACE
      ?auto_24051 - SURFACE
      ?auto_24052 - PLACE
      ?auto_24059 - HOIST
      ?auto_24061 - SURFACE
      ?auto_24041 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24042 ?auto_24039 ) ( IS-CRATE ?auto_24037 ) ( not ( = ?auto_24040 ?auto_24039 ) ) ( HOIST-AT ?auto_24038 ?auto_24040 ) ( AVAILABLE ?auto_24038 ) ( SURFACE-AT ?auto_24037 ?auto_24040 ) ( ON ?auto_24037 ?auto_24043 ) ( CLEAR ?auto_24037 ) ( not ( = ?auto_24034 ?auto_24037 ) ) ( not ( = ?auto_24034 ?auto_24043 ) ) ( not ( = ?auto_24037 ?auto_24043 ) ) ( not ( = ?auto_24042 ?auto_24038 ) ) ( IS-CRATE ?auto_24034 ) ( not ( = ?auto_24046 ?auto_24039 ) ) ( HOIST-AT ?auto_24047 ?auto_24046 ) ( AVAILABLE ?auto_24047 ) ( SURFACE-AT ?auto_24034 ?auto_24046 ) ( ON ?auto_24034 ?auto_24045 ) ( CLEAR ?auto_24034 ) ( not ( = ?auto_24035 ?auto_24034 ) ) ( not ( = ?auto_24035 ?auto_24045 ) ) ( not ( = ?auto_24034 ?auto_24045 ) ) ( not ( = ?auto_24042 ?auto_24047 ) ) ( IS-CRATE ?auto_24035 ) ( not ( = ?auto_24044 ?auto_24039 ) ) ( HOIST-AT ?auto_24062 ?auto_24044 ) ( AVAILABLE ?auto_24062 ) ( SURFACE-AT ?auto_24035 ?auto_24044 ) ( ON ?auto_24035 ?auto_24067 ) ( CLEAR ?auto_24035 ) ( not ( = ?auto_24036 ?auto_24035 ) ) ( not ( = ?auto_24036 ?auto_24067 ) ) ( not ( = ?auto_24035 ?auto_24067 ) ) ( not ( = ?auto_24042 ?auto_24062 ) ) ( IS-CRATE ?auto_24036 ) ( not ( = ?auto_24066 ?auto_24039 ) ) ( HOIST-AT ?auto_24064 ?auto_24066 ) ( AVAILABLE ?auto_24064 ) ( SURFACE-AT ?auto_24036 ?auto_24066 ) ( ON ?auto_24036 ?auto_24060 ) ( CLEAR ?auto_24036 ) ( not ( = ?auto_24033 ?auto_24036 ) ) ( not ( = ?auto_24033 ?auto_24060 ) ) ( not ( = ?auto_24036 ?auto_24060 ) ) ( not ( = ?auto_24042 ?auto_24064 ) ) ( IS-CRATE ?auto_24033 ) ( not ( = ?auto_24056 ?auto_24039 ) ) ( HOIST-AT ?auto_24053 ?auto_24056 ) ( SURFACE-AT ?auto_24033 ?auto_24056 ) ( ON ?auto_24033 ?auto_24057 ) ( CLEAR ?auto_24033 ) ( not ( = ?auto_24032 ?auto_24033 ) ) ( not ( = ?auto_24032 ?auto_24057 ) ) ( not ( = ?auto_24033 ?auto_24057 ) ) ( not ( = ?auto_24042 ?auto_24053 ) ) ( IS-CRATE ?auto_24032 ) ( not ( = ?auto_24058 ?auto_24039 ) ) ( HOIST-AT ?auto_24055 ?auto_24058 ) ( AVAILABLE ?auto_24055 ) ( SURFACE-AT ?auto_24032 ?auto_24058 ) ( ON ?auto_24032 ?auto_24050 ) ( CLEAR ?auto_24032 ) ( not ( = ?auto_24031 ?auto_24032 ) ) ( not ( = ?auto_24031 ?auto_24050 ) ) ( not ( = ?auto_24032 ?auto_24050 ) ) ( not ( = ?auto_24042 ?auto_24055 ) ) ( IS-CRATE ?auto_24031 ) ( not ( = ?auto_24068 ?auto_24039 ) ) ( HOIST-AT ?auto_24049 ?auto_24068 ) ( AVAILABLE ?auto_24049 ) ( SURFACE-AT ?auto_24031 ?auto_24068 ) ( ON ?auto_24031 ?auto_24065 ) ( CLEAR ?auto_24031 ) ( not ( = ?auto_24030 ?auto_24031 ) ) ( not ( = ?auto_24030 ?auto_24065 ) ) ( not ( = ?auto_24031 ?auto_24065 ) ) ( not ( = ?auto_24042 ?auto_24049 ) ) ( IS-CRATE ?auto_24030 ) ( not ( = ?auto_24063 ?auto_24039 ) ) ( HOIST-AT ?auto_24048 ?auto_24063 ) ( AVAILABLE ?auto_24048 ) ( SURFACE-AT ?auto_24030 ?auto_24063 ) ( ON ?auto_24030 ?auto_24054 ) ( CLEAR ?auto_24030 ) ( not ( = ?auto_24029 ?auto_24030 ) ) ( not ( = ?auto_24029 ?auto_24054 ) ) ( not ( = ?auto_24030 ?auto_24054 ) ) ( not ( = ?auto_24042 ?auto_24048 ) ) ( IS-CRATE ?auto_24029 ) ( AVAILABLE ?auto_24053 ) ( SURFACE-AT ?auto_24029 ?auto_24056 ) ( ON ?auto_24029 ?auto_24051 ) ( CLEAR ?auto_24029 ) ( not ( = ?auto_24028 ?auto_24029 ) ) ( not ( = ?auto_24028 ?auto_24051 ) ) ( not ( = ?auto_24029 ?auto_24051 ) ) ( SURFACE-AT ?auto_24027 ?auto_24039 ) ( CLEAR ?auto_24027 ) ( IS-CRATE ?auto_24028 ) ( AVAILABLE ?auto_24042 ) ( not ( = ?auto_24052 ?auto_24039 ) ) ( HOIST-AT ?auto_24059 ?auto_24052 ) ( AVAILABLE ?auto_24059 ) ( SURFACE-AT ?auto_24028 ?auto_24052 ) ( ON ?auto_24028 ?auto_24061 ) ( CLEAR ?auto_24028 ) ( TRUCK-AT ?auto_24041 ?auto_24039 ) ( not ( = ?auto_24027 ?auto_24028 ) ) ( not ( = ?auto_24027 ?auto_24061 ) ) ( not ( = ?auto_24028 ?auto_24061 ) ) ( not ( = ?auto_24042 ?auto_24059 ) ) ( not ( = ?auto_24027 ?auto_24029 ) ) ( not ( = ?auto_24027 ?auto_24051 ) ) ( not ( = ?auto_24029 ?auto_24061 ) ) ( not ( = ?auto_24056 ?auto_24052 ) ) ( not ( = ?auto_24053 ?auto_24059 ) ) ( not ( = ?auto_24051 ?auto_24061 ) ) ( not ( = ?auto_24027 ?auto_24030 ) ) ( not ( = ?auto_24027 ?auto_24054 ) ) ( not ( = ?auto_24028 ?auto_24030 ) ) ( not ( = ?auto_24028 ?auto_24054 ) ) ( not ( = ?auto_24030 ?auto_24051 ) ) ( not ( = ?auto_24030 ?auto_24061 ) ) ( not ( = ?auto_24063 ?auto_24056 ) ) ( not ( = ?auto_24063 ?auto_24052 ) ) ( not ( = ?auto_24048 ?auto_24053 ) ) ( not ( = ?auto_24048 ?auto_24059 ) ) ( not ( = ?auto_24054 ?auto_24051 ) ) ( not ( = ?auto_24054 ?auto_24061 ) ) ( not ( = ?auto_24027 ?auto_24031 ) ) ( not ( = ?auto_24027 ?auto_24065 ) ) ( not ( = ?auto_24028 ?auto_24031 ) ) ( not ( = ?auto_24028 ?auto_24065 ) ) ( not ( = ?auto_24029 ?auto_24031 ) ) ( not ( = ?auto_24029 ?auto_24065 ) ) ( not ( = ?auto_24031 ?auto_24054 ) ) ( not ( = ?auto_24031 ?auto_24051 ) ) ( not ( = ?auto_24031 ?auto_24061 ) ) ( not ( = ?auto_24068 ?auto_24063 ) ) ( not ( = ?auto_24068 ?auto_24056 ) ) ( not ( = ?auto_24068 ?auto_24052 ) ) ( not ( = ?auto_24049 ?auto_24048 ) ) ( not ( = ?auto_24049 ?auto_24053 ) ) ( not ( = ?auto_24049 ?auto_24059 ) ) ( not ( = ?auto_24065 ?auto_24054 ) ) ( not ( = ?auto_24065 ?auto_24051 ) ) ( not ( = ?auto_24065 ?auto_24061 ) ) ( not ( = ?auto_24027 ?auto_24032 ) ) ( not ( = ?auto_24027 ?auto_24050 ) ) ( not ( = ?auto_24028 ?auto_24032 ) ) ( not ( = ?auto_24028 ?auto_24050 ) ) ( not ( = ?auto_24029 ?auto_24032 ) ) ( not ( = ?auto_24029 ?auto_24050 ) ) ( not ( = ?auto_24030 ?auto_24032 ) ) ( not ( = ?auto_24030 ?auto_24050 ) ) ( not ( = ?auto_24032 ?auto_24065 ) ) ( not ( = ?auto_24032 ?auto_24054 ) ) ( not ( = ?auto_24032 ?auto_24051 ) ) ( not ( = ?auto_24032 ?auto_24061 ) ) ( not ( = ?auto_24058 ?auto_24068 ) ) ( not ( = ?auto_24058 ?auto_24063 ) ) ( not ( = ?auto_24058 ?auto_24056 ) ) ( not ( = ?auto_24058 ?auto_24052 ) ) ( not ( = ?auto_24055 ?auto_24049 ) ) ( not ( = ?auto_24055 ?auto_24048 ) ) ( not ( = ?auto_24055 ?auto_24053 ) ) ( not ( = ?auto_24055 ?auto_24059 ) ) ( not ( = ?auto_24050 ?auto_24065 ) ) ( not ( = ?auto_24050 ?auto_24054 ) ) ( not ( = ?auto_24050 ?auto_24051 ) ) ( not ( = ?auto_24050 ?auto_24061 ) ) ( not ( = ?auto_24027 ?auto_24033 ) ) ( not ( = ?auto_24027 ?auto_24057 ) ) ( not ( = ?auto_24028 ?auto_24033 ) ) ( not ( = ?auto_24028 ?auto_24057 ) ) ( not ( = ?auto_24029 ?auto_24033 ) ) ( not ( = ?auto_24029 ?auto_24057 ) ) ( not ( = ?auto_24030 ?auto_24033 ) ) ( not ( = ?auto_24030 ?auto_24057 ) ) ( not ( = ?auto_24031 ?auto_24033 ) ) ( not ( = ?auto_24031 ?auto_24057 ) ) ( not ( = ?auto_24033 ?auto_24050 ) ) ( not ( = ?auto_24033 ?auto_24065 ) ) ( not ( = ?auto_24033 ?auto_24054 ) ) ( not ( = ?auto_24033 ?auto_24051 ) ) ( not ( = ?auto_24033 ?auto_24061 ) ) ( not ( = ?auto_24057 ?auto_24050 ) ) ( not ( = ?auto_24057 ?auto_24065 ) ) ( not ( = ?auto_24057 ?auto_24054 ) ) ( not ( = ?auto_24057 ?auto_24051 ) ) ( not ( = ?auto_24057 ?auto_24061 ) ) ( not ( = ?auto_24027 ?auto_24036 ) ) ( not ( = ?auto_24027 ?auto_24060 ) ) ( not ( = ?auto_24028 ?auto_24036 ) ) ( not ( = ?auto_24028 ?auto_24060 ) ) ( not ( = ?auto_24029 ?auto_24036 ) ) ( not ( = ?auto_24029 ?auto_24060 ) ) ( not ( = ?auto_24030 ?auto_24036 ) ) ( not ( = ?auto_24030 ?auto_24060 ) ) ( not ( = ?auto_24031 ?auto_24036 ) ) ( not ( = ?auto_24031 ?auto_24060 ) ) ( not ( = ?auto_24032 ?auto_24036 ) ) ( not ( = ?auto_24032 ?auto_24060 ) ) ( not ( = ?auto_24036 ?auto_24057 ) ) ( not ( = ?auto_24036 ?auto_24050 ) ) ( not ( = ?auto_24036 ?auto_24065 ) ) ( not ( = ?auto_24036 ?auto_24054 ) ) ( not ( = ?auto_24036 ?auto_24051 ) ) ( not ( = ?auto_24036 ?auto_24061 ) ) ( not ( = ?auto_24066 ?auto_24056 ) ) ( not ( = ?auto_24066 ?auto_24058 ) ) ( not ( = ?auto_24066 ?auto_24068 ) ) ( not ( = ?auto_24066 ?auto_24063 ) ) ( not ( = ?auto_24066 ?auto_24052 ) ) ( not ( = ?auto_24064 ?auto_24053 ) ) ( not ( = ?auto_24064 ?auto_24055 ) ) ( not ( = ?auto_24064 ?auto_24049 ) ) ( not ( = ?auto_24064 ?auto_24048 ) ) ( not ( = ?auto_24064 ?auto_24059 ) ) ( not ( = ?auto_24060 ?auto_24057 ) ) ( not ( = ?auto_24060 ?auto_24050 ) ) ( not ( = ?auto_24060 ?auto_24065 ) ) ( not ( = ?auto_24060 ?auto_24054 ) ) ( not ( = ?auto_24060 ?auto_24051 ) ) ( not ( = ?auto_24060 ?auto_24061 ) ) ( not ( = ?auto_24027 ?auto_24035 ) ) ( not ( = ?auto_24027 ?auto_24067 ) ) ( not ( = ?auto_24028 ?auto_24035 ) ) ( not ( = ?auto_24028 ?auto_24067 ) ) ( not ( = ?auto_24029 ?auto_24035 ) ) ( not ( = ?auto_24029 ?auto_24067 ) ) ( not ( = ?auto_24030 ?auto_24035 ) ) ( not ( = ?auto_24030 ?auto_24067 ) ) ( not ( = ?auto_24031 ?auto_24035 ) ) ( not ( = ?auto_24031 ?auto_24067 ) ) ( not ( = ?auto_24032 ?auto_24035 ) ) ( not ( = ?auto_24032 ?auto_24067 ) ) ( not ( = ?auto_24033 ?auto_24035 ) ) ( not ( = ?auto_24033 ?auto_24067 ) ) ( not ( = ?auto_24035 ?auto_24060 ) ) ( not ( = ?auto_24035 ?auto_24057 ) ) ( not ( = ?auto_24035 ?auto_24050 ) ) ( not ( = ?auto_24035 ?auto_24065 ) ) ( not ( = ?auto_24035 ?auto_24054 ) ) ( not ( = ?auto_24035 ?auto_24051 ) ) ( not ( = ?auto_24035 ?auto_24061 ) ) ( not ( = ?auto_24044 ?auto_24066 ) ) ( not ( = ?auto_24044 ?auto_24056 ) ) ( not ( = ?auto_24044 ?auto_24058 ) ) ( not ( = ?auto_24044 ?auto_24068 ) ) ( not ( = ?auto_24044 ?auto_24063 ) ) ( not ( = ?auto_24044 ?auto_24052 ) ) ( not ( = ?auto_24062 ?auto_24064 ) ) ( not ( = ?auto_24062 ?auto_24053 ) ) ( not ( = ?auto_24062 ?auto_24055 ) ) ( not ( = ?auto_24062 ?auto_24049 ) ) ( not ( = ?auto_24062 ?auto_24048 ) ) ( not ( = ?auto_24062 ?auto_24059 ) ) ( not ( = ?auto_24067 ?auto_24060 ) ) ( not ( = ?auto_24067 ?auto_24057 ) ) ( not ( = ?auto_24067 ?auto_24050 ) ) ( not ( = ?auto_24067 ?auto_24065 ) ) ( not ( = ?auto_24067 ?auto_24054 ) ) ( not ( = ?auto_24067 ?auto_24051 ) ) ( not ( = ?auto_24067 ?auto_24061 ) ) ( not ( = ?auto_24027 ?auto_24034 ) ) ( not ( = ?auto_24027 ?auto_24045 ) ) ( not ( = ?auto_24028 ?auto_24034 ) ) ( not ( = ?auto_24028 ?auto_24045 ) ) ( not ( = ?auto_24029 ?auto_24034 ) ) ( not ( = ?auto_24029 ?auto_24045 ) ) ( not ( = ?auto_24030 ?auto_24034 ) ) ( not ( = ?auto_24030 ?auto_24045 ) ) ( not ( = ?auto_24031 ?auto_24034 ) ) ( not ( = ?auto_24031 ?auto_24045 ) ) ( not ( = ?auto_24032 ?auto_24034 ) ) ( not ( = ?auto_24032 ?auto_24045 ) ) ( not ( = ?auto_24033 ?auto_24034 ) ) ( not ( = ?auto_24033 ?auto_24045 ) ) ( not ( = ?auto_24036 ?auto_24034 ) ) ( not ( = ?auto_24036 ?auto_24045 ) ) ( not ( = ?auto_24034 ?auto_24067 ) ) ( not ( = ?auto_24034 ?auto_24060 ) ) ( not ( = ?auto_24034 ?auto_24057 ) ) ( not ( = ?auto_24034 ?auto_24050 ) ) ( not ( = ?auto_24034 ?auto_24065 ) ) ( not ( = ?auto_24034 ?auto_24054 ) ) ( not ( = ?auto_24034 ?auto_24051 ) ) ( not ( = ?auto_24034 ?auto_24061 ) ) ( not ( = ?auto_24046 ?auto_24044 ) ) ( not ( = ?auto_24046 ?auto_24066 ) ) ( not ( = ?auto_24046 ?auto_24056 ) ) ( not ( = ?auto_24046 ?auto_24058 ) ) ( not ( = ?auto_24046 ?auto_24068 ) ) ( not ( = ?auto_24046 ?auto_24063 ) ) ( not ( = ?auto_24046 ?auto_24052 ) ) ( not ( = ?auto_24047 ?auto_24062 ) ) ( not ( = ?auto_24047 ?auto_24064 ) ) ( not ( = ?auto_24047 ?auto_24053 ) ) ( not ( = ?auto_24047 ?auto_24055 ) ) ( not ( = ?auto_24047 ?auto_24049 ) ) ( not ( = ?auto_24047 ?auto_24048 ) ) ( not ( = ?auto_24047 ?auto_24059 ) ) ( not ( = ?auto_24045 ?auto_24067 ) ) ( not ( = ?auto_24045 ?auto_24060 ) ) ( not ( = ?auto_24045 ?auto_24057 ) ) ( not ( = ?auto_24045 ?auto_24050 ) ) ( not ( = ?auto_24045 ?auto_24065 ) ) ( not ( = ?auto_24045 ?auto_24054 ) ) ( not ( = ?auto_24045 ?auto_24051 ) ) ( not ( = ?auto_24045 ?auto_24061 ) ) ( not ( = ?auto_24027 ?auto_24037 ) ) ( not ( = ?auto_24027 ?auto_24043 ) ) ( not ( = ?auto_24028 ?auto_24037 ) ) ( not ( = ?auto_24028 ?auto_24043 ) ) ( not ( = ?auto_24029 ?auto_24037 ) ) ( not ( = ?auto_24029 ?auto_24043 ) ) ( not ( = ?auto_24030 ?auto_24037 ) ) ( not ( = ?auto_24030 ?auto_24043 ) ) ( not ( = ?auto_24031 ?auto_24037 ) ) ( not ( = ?auto_24031 ?auto_24043 ) ) ( not ( = ?auto_24032 ?auto_24037 ) ) ( not ( = ?auto_24032 ?auto_24043 ) ) ( not ( = ?auto_24033 ?auto_24037 ) ) ( not ( = ?auto_24033 ?auto_24043 ) ) ( not ( = ?auto_24036 ?auto_24037 ) ) ( not ( = ?auto_24036 ?auto_24043 ) ) ( not ( = ?auto_24035 ?auto_24037 ) ) ( not ( = ?auto_24035 ?auto_24043 ) ) ( not ( = ?auto_24037 ?auto_24045 ) ) ( not ( = ?auto_24037 ?auto_24067 ) ) ( not ( = ?auto_24037 ?auto_24060 ) ) ( not ( = ?auto_24037 ?auto_24057 ) ) ( not ( = ?auto_24037 ?auto_24050 ) ) ( not ( = ?auto_24037 ?auto_24065 ) ) ( not ( = ?auto_24037 ?auto_24054 ) ) ( not ( = ?auto_24037 ?auto_24051 ) ) ( not ( = ?auto_24037 ?auto_24061 ) ) ( not ( = ?auto_24040 ?auto_24046 ) ) ( not ( = ?auto_24040 ?auto_24044 ) ) ( not ( = ?auto_24040 ?auto_24066 ) ) ( not ( = ?auto_24040 ?auto_24056 ) ) ( not ( = ?auto_24040 ?auto_24058 ) ) ( not ( = ?auto_24040 ?auto_24068 ) ) ( not ( = ?auto_24040 ?auto_24063 ) ) ( not ( = ?auto_24040 ?auto_24052 ) ) ( not ( = ?auto_24038 ?auto_24047 ) ) ( not ( = ?auto_24038 ?auto_24062 ) ) ( not ( = ?auto_24038 ?auto_24064 ) ) ( not ( = ?auto_24038 ?auto_24053 ) ) ( not ( = ?auto_24038 ?auto_24055 ) ) ( not ( = ?auto_24038 ?auto_24049 ) ) ( not ( = ?auto_24038 ?auto_24048 ) ) ( not ( = ?auto_24038 ?auto_24059 ) ) ( not ( = ?auto_24043 ?auto_24045 ) ) ( not ( = ?auto_24043 ?auto_24067 ) ) ( not ( = ?auto_24043 ?auto_24060 ) ) ( not ( = ?auto_24043 ?auto_24057 ) ) ( not ( = ?auto_24043 ?auto_24050 ) ) ( not ( = ?auto_24043 ?auto_24065 ) ) ( not ( = ?auto_24043 ?auto_24054 ) ) ( not ( = ?auto_24043 ?auto_24051 ) ) ( not ( = ?auto_24043 ?auto_24061 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_24027 ?auto_24028 ?auto_24029 ?auto_24030 ?auto_24031 ?auto_24032 ?auto_24033 ?auto_24036 ?auto_24035 ?auto_24034 )
      ( MAKE-1CRATE ?auto_24034 ?auto_24037 )
      ( MAKE-10CRATE-VERIFY ?auto_24027 ?auto_24028 ?auto_24029 ?auto_24030 ?auto_24031 ?auto_24032 ?auto_24033 ?auto_24036 ?auto_24035 ?auto_24034 ?auto_24037 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24071 - SURFACE
      ?auto_24072 - SURFACE
    )
    :vars
    (
      ?auto_24073 - HOIST
      ?auto_24074 - PLACE
      ?auto_24076 - PLACE
      ?auto_24077 - HOIST
      ?auto_24078 - SURFACE
      ?auto_24075 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24073 ?auto_24074 ) ( SURFACE-AT ?auto_24071 ?auto_24074 ) ( CLEAR ?auto_24071 ) ( IS-CRATE ?auto_24072 ) ( AVAILABLE ?auto_24073 ) ( not ( = ?auto_24076 ?auto_24074 ) ) ( HOIST-AT ?auto_24077 ?auto_24076 ) ( AVAILABLE ?auto_24077 ) ( SURFACE-AT ?auto_24072 ?auto_24076 ) ( ON ?auto_24072 ?auto_24078 ) ( CLEAR ?auto_24072 ) ( TRUCK-AT ?auto_24075 ?auto_24074 ) ( not ( = ?auto_24071 ?auto_24072 ) ) ( not ( = ?auto_24071 ?auto_24078 ) ) ( not ( = ?auto_24072 ?auto_24078 ) ) ( not ( = ?auto_24073 ?auto_24077 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24075 ?auto_24074 ?auto_24076 )
      ( !LIFT ?auto_24077 ?auto_24072 ?auto_24078 ?auto_24076 )
      ( !LOAD ?auto_24077 ?auto_24072 ?auto_24075 ?auto_24076 )
      ( !DRIVE ?auto_24075 ?auto_24076 ?auto_24074 )
      ( !UNLOAD ?auto_24073 ?auto_24072 ?auto_24075 ?auto_24074 )
      ( !DROP ?auto_24073 ?auto_24072 ?auto_24071 ?auto_24074 )
      ( MAKE-1CRATE-VERIFY ?auto_24071 ?auto_24072 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_24091 - SURFACE
      ?auto_24092 - SURFACE
      ?auto_24093 - SURFACE
      ?auto_24094 - SURFACE
      ?auto_24095 - SURFACE
      ?auto_24096 - SURFACE
      ?auto_24097 - SURFACE
      ?auto_24100 - SURFACE
      ?auto_24099 - SURFACE
      ?auto_24098 - SURFACE
      ?auto_24101 - SURFACE
      ?auto_24102 - SURFACE
    )
    :vars
    (
      ?auto_24103 - HOIST
      ?auto_24108 - PLACE
      ?auto_24105 - PLACE
      ?auto_24104 - HOIST
      ?auto_24106 - SURFACE
      ?auto_24123 - PLACE
      ?auto_24128 - HOIST
      ?auto_24111 - SURFACE
      ?auto_24115 - PLACE
      ?auto_24113 - HOIST
      ?auto_24119 - SURFACE
      ?auto_24114 - PLACE
      ?auto_24117 - HOIST
      ?auto_24129 - SURFACE
      ?auto_24133 - PLACE
      ?auto_24131 - HOIST
      ?auto_24116 - SURFACE
      ?auto_24126 - PLACE
      ?auto_24125 - HOIST
      ?auto_24127 - SURFACE
      ?auto_24120 - SURFACE
      ?auto_24130 - PLACE
      ?auto_24112 - HOIST
      ?auto_24109 - SURFACE
      ?auto_24132 - PLACE
      ?auto_24122 - HOIST
      ?auto_24124 - SURFACE
      ?auto_24134 - SURFACE
      ?auto_24110 - PLACE
      ?auto_24121 - HOIST
      ?auto_24118 - SURFACE
      ?auto_24107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24103 ?auto_24108 ) ( IS-CRATE ?auto_24102 ) ( not ( = ?auto_24105 ?auto_24108 ) ) ( HOIST-AT ?auto_24104 ?auto_24105 ) ( SURFACE-AT ?auto_24102 ?auto_24105 ) ( ON ?auto_24102 ?auto_24106 ) ( CLEAR ?auto_24102 ) ( not ( = ?auto_24101 ?auto_24102 ) ) ( not ( = ?auto_24101 ?auto_24106 ) ) ( not ( = ?auto_24102 ?auto_24106 ) ) ( not ( = ?auto_24103 ?auto_24104 ) ) ( IS-CRATE ?auto_24101 ) ( not ( = ?auto_24123 ?auto_24108 ) ) ( HOIST-AT ?auto_24128 ?auto_24123 ) ( AVAILABLE ?auto_24128 ) ( SURFACE-AT ?auto_24101 ?auto_24123 ) ( ON ?auto_24101 ?auto_24111 ) ( CLEAR ?auto_24101 ) ( not ( = ?auto_24098 ?auto_24101 ) ) ( not ( = ?auto_24098 ?auto_24111 ) ) ( not ( = ?auto_24101 ?auto_24111 ) ) ( not ( = ?auto_24103 ?auto_24128 ) ) ( IS-CRATE ?auto_24098 ) ( not ( = ?auto_24115 ?auto_24108 ) ) ( HOIST-AT ?auto_24113 ?auto_24115 ) ( AVAILABLE ?auto_24113 ) ( SURFACE-AT ?auto_24098 ?auto_24115 ) ( ON ?auto_24098 ?auto_24119 ) ( CLEAR ?auto_24098 ) ( not ( = ?auto_24099 ?auto_24098 ) ) ( not ( = ?auto_24099 ?auto_24119 ) ) ( not ( = ?auto_24098 ?auto_24119 ) ) ( not ( = ?auto_24103 ?auto_24113 ) ) ( IS-CRATE ?auto_24099 ) ( not ( = ?auto_24114 ?auto_24108 ) ) ( HOIST-AT ?auto_24117 ?auto_24114 ) ( AVAILABLE ?auto_24117 ) ( SURFACE-AT ?auto_24099 ?auto_24114 ) ( ON ?auto_24099 ?auto_24129 ) ( CLEAR ?auto_24099 ) ( not ( = ?auto_24100 ?auto_24099 ) ) ( not ( = ?auto_24100 ?auto_24129 ) ) ( not ( = ?auto_24099 ?auto_24129 ) ) ( not ( = ?auto_24103 ?auto_24117 ) ) ( IS-CRATE ?auto_24100 ) ( not ( = ?auto_24133 ?auto_24108 ) ) ( HOIST-AT ?auto_24131 ?auto_24133 ) ( AVAILABLE ?auto_24131 ) ( SURFACE-AT ?auto_24100 ?auto_24133 ) ( ON ?auto_24100 ?auto_24116 ) ( CLEAR ?auto_24100 ) ( not ( = ?auto_24097 ?auto_24100 ) ) ( not ( = ?auto_24097 ?auto_24116 ) ) ( not ( = ?auto_24100 ?auto_24116 ) ) ( not ( = ?auto_24103 ?auto_24131 ) ) ( IS-CRATE ?auto_24097 ) ( not ( = ?auto_24126 ?auto_24108 ) ) ( HOIST-AT ?auto_24125 ?auto_24126 ) ( SURFACE-AT ?auto_24097 ?auto_24126 ) ( ON ?auto_24097 ?auto_24127 ) ( CLEAR ?auto_24097 ) ( not ( = ?auto_24096 ?auto_24097 ) ) ( not ( = ?auto_24096 ?auto_24127 ) ) ( not ( = ?auto_24097 ?auto_24127 ) ) ( not ( = ?auto_24103 ?auto_24125 ) ) ( IS-CRATE ?auto_24096 ) ( AVAILABLE ?auto_24104 ) ( SURFACE-AT ?auto_24096 ?auto_24105 ) ( ON ?auto_24096 ?auto_24120 ) ( CLEAR ?auto_24096 ) ( not ( = ?auto_24095 ?auto_24096 ) ) ( not ( = ?auto_24095 ?auto_24120 ) ) ( not ( = ?auto_24096 ?auto_24120 ) ) ( IS-CRATE ?auto_24095 ) ( not ( = ?auto_24130 ?auto_24108 ) ) ( HOIST-AT ?auto_24112 ?auto_24130 ) ( AVAILABLE ?auto_24112 ) ( SURFACE-AT ?auto_24095 ?auto_24130 ) ( ON ?auto_24095 ?auto_24109 ) ( CLEAR ?auto_24095 ) ( not ( = ?auto_24094 ?auto_24095 ) ) ( not ( = ?auto_24094 ?auto_24109 ) ) ( not ( = ?auto_24095 ?auto_24109 ) ) ( not ( = ?auto_24103 ?auto_24112 ) ) ( IS-CRATE ?auto_24094 ) ( not ( = ?auto_24132 ?auto_24108 ) ) ( HOIST-AT ?auto_24122 ?auto_24132 ) ( AVAILABLE ?auto_24122 ) ( SURFACE-AT ?auto_24094 ?auto_24132 ) ( ON ?auto_24094 ?auto_24124 ) ( CLEAR ?auto_24094 ) ( not ( = ?auto_24093 ?auto_24094 ) ) ( not ( = ?auto_24093 ?auto_24124 ) ) ( not ( = ?auto_24094 ?auto_24124 ) ) ( not ( = ?auto_24103 ?auto_24122 ) ) ( IS-CRATE ?auto_24093 ) ( AVAILABLE ?auto_24125 ) ( SURFACE-AT ?auto_24093 ?auto_24126 ) ( ON ?auto_24093 ?auto_24134 ) ( CLEAR ?auto_24093 ) ( not ( = ?auto_24092 ?auto_24093 ) ) ( not ( = ?auto_24092 ?auto_24134 ) ) ( not ( = ?auto_24093 ?auto_24134 ) ) ( SURFACE-AT ?auto_24091 ?auto_24108 ) ( CLEAR ?auto_24091 ) ( IS-CRATE ?auto_24092 ) ( AVAILABLE ?auto_24103 ) ( not ( = ?auto_24110 ?auto_24108 ) ) ( HOIST-AT ?auto_24121 ?auto_24110 ) ( AVAILABLE ?auto_24121 ) ( SURFACE-AT ?auto_24092 ?auto_24110 ) ( ON ?auto_24092 ?auto_24118 ) ( CLEAR ?auto_24092 ) ( TRUCK-AT ?auto_24107 ?auto_24108 ) ( not ( = ?auto_24091 ?auto_24092 ) ) ( not ( = ?auto_24091 ?auto_24118 ) ) ( not ( = ?auto_24092 ?auto_24118 ) ) ( not ( = ?auto_24103 ?auto_24121 ) ) ( not ( = ?auto_24091 ?auto_24093 ) ) ( not ( = ?auto_24091 ?auto_24134 ) ) ( not ( = ?auto_24093 ?auto_24118 ) ) ( not ( = ?auto_24126 ?auto_24110 ) ) ( not ( = ?auto_24125 ?auto_24121 ) ) ( not ( = ?auto_24134 ?auto_24118 ) ) ( not ( = ?auto_24091 ?auto_24094 ) ) ( not ( = ?auto_24091 ?auto_24124 ) ) ( not ( = ?auto_24092 ?auto_24094 ) ) ( not ( = ?auto_24092 ?auto_24124 ) ) ( not ( = ?auto_24094 ?auto_24134 ) ) ( not ( = ?auto_24094 ?auto_24118 ) ) ( not ( = ?auto_24132 ?auto_24126 ) ) ( not ( = ?auto_24132 ?auto_24110 ) ) ( not ( = ?auto_24122 ?auto_24125 ) ) ( not ( = ?auto_24122 ?auto_24121 ) ) ( not ( = ?auto_24124 ?auto_24134 ) ) ( not ( = ?auto_24124 ?auto_24118 ) ) ( not ( = ?auto_24091 ?auto_24095 ) ) ( not ( = ?auto_24091 ?auto_24109 ) ) ( not ( = ?auto_24092 ?auto_24095 ) ) ( not ( = ?auto_24092 ?auto_24109 ) ) ( not ( = ?auto_24093 ?auto_24095 ) ) ( not ( = ?auto_24093 ?auto_24109 ) ) ( not ( = ?auto_24095 ?auto_24124 ) ) ( not ( = ?auto_24095 ?auto_24134 ) ) ( not ( = ?auto_24095 ?auto_24118 ) ) ( not ( = ?auto_24130 ?auto_24132 ) ) ( not ( = ?auto_24130 ?auto_24126 ) ) ( not ( = ?auto_24130 ?auto_24110 ) ) ( not ( = ?auto_24112 ?auto_24122 ) ) ( not ( = ?auto_24112 ?auto_24125 ) ) ( not ( = ?auto_24112 ?auto_24121 ) ) ( not ( = ?auto_24109 ?auto_24124 ) ) ( not ( = ?auto_24109 ?auto_24134 ) ) ( not ( = ?auto_24109 ?auto_24118 ) ) ( not ( = ?auto_24091 ?auto_24096 ) ) ( not ( = ?auto_24091 ?auto_24120 ) ) ( not ( = ?auto_24092 ?auto_24096 ) ) ( not ( = ?auto_24092 ?auto_24120 ) ) ( not ( = ?auto_24093 ?auto_24096 ) ) ( not ( = ?auto_24093 ?auto_24120 ) ) ( not ( = ?auto_24094 ?auto_24096 ) ) ( not ( = ?auto_24094 ?auto_24120 ) ) ( not ( = ?auto_24096 ?auto_24109 ) ) ( not ( = ?auto_24096 ?auto_24124 ) ) ( not ( = ?auto_24096 ?auto_24134 ) ) ( not ( = ?auto_24096 ?auto_24118 ) ) ( not ( = ?auto_24105 ?auto_24130 ) ) ( not ( = ?auto_24105 ?auto_24132 ) ) ( not ( = ?auto_24105 ?auto_24126 ) ) ( not ( = ?auto_24105 ?auto_24110 ) ) ( not ( = ?auto_24104 ?auto_24112 ) ) ( not ( = ?auto_24104 ?auto_24122 ) ) ( not ( = ?auto_24104 ?auto_24125 ) ) ( not ( = ?auto_24104 ?auto_24121 ) ) ( not ( = ?auto_24120 ?auto_24109 ) ) ( not ( = ?auto_24120 ?auto_24124 ) ) ( not ( = ?auto_24120 ?auto_24134 ) ) ( not ( = ?auto_24120 ?auto_24118 ) ) ( not ( = ?auto_24091 ?auto_24097 ) ) ( not ( = ?auto_24091 ?auto_24127 ) ) ( not ( = ?auto_24092 ?auto_24097 ) ) ( not ( = ?auto_24092 ?auto_24127 ) ) ( not ( = ?auto_24093 ?auto_24097 ) ) ( not ( = ?auto_24093 ?auto_24127 ) ) ( not ( = ?auto_24094 ?auto_24097 ) ) ( not ( = ?auto_24094 ?auto_24127 ) ) ( not ( = ?auto_24095 ?auto_24097 ) ) ( not ( = ?auto_24095 ?auto_24127 ) ) ( not ( = ?auto_24097 ?auto_24120 ) ) ( not ( = ?auto_24097 ?auto_24109 ) ) ( not ( = ?auto_24097 ?auto_24124 ) ) ( not ( = ?auto_24097 ?auto_24134 ) ) ( not ( = ?auto_24097 ?auto_24118 ) ) ( not ( = ?auto_24127 ?auto_24120 ) ) ( not ( = ?auto_24127 ?auto_24109 ) ) ( not ( = ?auto_24127 ?auto_24124 ) ) ( not ( = ?auto_24127 ?auto_24134 ) ) ( not ( = ?auto_24127 ?auto_24118 ) ) ( not ( = ?auto_24091 ?auto_24100 ) ) ( not ( = ?auto_24091 ?auto_24116 ) ) ( not ( = ?auto_24092 ?auto_24100 ) ) ( not ( = ?auto_24092 ?auto_24116 ) ) ( not ( = ?auto_24093 ?auto_24100 ) ) ( not ( = ?auto_24093 ?auto_24116 ) ) ( not ( = ?auto_24094 ?auto_24100 ) ) ( not ( = ?auto_24094 ?auto_24116 ) ) ( not ( = ?auto_24095 ?auto_24100 ) ) ( not ( = ?auto_24095 ?auto_24116 ) ) ( not ( = ?auto_24096 ?auto_24100 ) ) ( not ( = ?auto_24096 ?auto_24116 ) ) ( not ( = ?auto_24100 ?auto_24127 ) ) ( not ( = ?auto_24100 ?auto_24120 ) ) ( not ( = ?auto_24100 ?auto_24109 ) ) ( not ( = ?auto_24100 ?auto_24124 ) ) ( not ( = ?auto_24100 ?auto_24134 ) ) ( not ( = ?auto_24100 ?auto_24118 ) ) ( not ( = ?auto_24133 ?auto_24126 ) ) ( not ( = ?auto_24133 ?auto_24105 ) ) ( not ( = ?auto_24133 ?auto_24130 ) ) ( not ( = ?auto_24133 ?auto_24132 ) ) ( not ( = ?auto_24133 ?auto_24110 ) ) ( not ( = ?auto_24131 ?auto_24125 ) ) ( not ( = ?auto_24131 ?auto_24104 ) ) ( not ( = ?auto_24131 ?auto_24112 ) ) ( not ( = ?auto_24131 ?auto_24122 ) ) ( not ( = ?auto_24131 ?auto_24121 ) ) ( not ( = ?auto_24116 ?auto_24127 ) ) ( not ( = ?auto_24116 ?auto_24120 ) ) ( not ( = ?auto_24116 ?auto_24109 ) ) ( not ( = ?auto_24116 ?auto_24124 ) ) ( not ( = ?auto_24116 ?auto_24134 ) ) ( not ( = ?auto_24116 ?auto_24118 ) ) ( not ( = ?auto_24091 ?auto_24099 ) ) ( not ( = ?auto_24091 ?auto_24129 ) ) ( not ( = ?auto_24092 ?auto_24099 ) ) ( not ( = ?auto_24092 ?auto_24129 ) ) ( not ( = ?auto_24093 ?auto_24099 ) ) ( not ( = ?auto_24093 ?auto_24129 ) ) ( not ( = ?auto_24094 ?auto_24099 ) ) ( not ( = ?auto_24094 ?auto_24129 ) ) ( not ( = ?auto_24095 ?auto_24099 ) ) ( not ( = ?auto_24095 ?auto_24129 ) ) ( not ( = ?auto_24096 ?auto_24099 ) ) ( not ( = ?auto_24096 ?auto_24129 ) ) ( not ( = ?auto_24097 ?auto_24099 ) ) ( not ( = ?auto_24097 ?auto_24129 ) ) ( not ( = ?auto_24099 ?auto_24116 ) ) ( not ( = ?auto_24099 ?auto_24127 ) ) ( not ( = ?auto_24099 ?auto_24120 ) ) ( not ( = ?auto_24099 ?auto_24109 ) ) ( not ( = ?auto_24099 ?auto_24124 ) ) ( not ( = ?auto_24099 ?auto_24134 ) ) ( not ( = ?auto_24099 ?auto_24118 ) ) ( not ( = ?auto_24114 ?auto_24133 ) ) ( not ( = ?auto_24114 ?auto_24126 ) ) ( not ( = ?auto_24114 ?auto_24105 ) ) ( not ( = ?auto_24114 ?auto_24130 ) ) ( not ( = ?auto_24114 ?auto_24132 ) ) ( not ( = ?auto_24114 ?auto_24110 ) ) ( not ( = ?auto_24117 ?auto_24131 ) ) ( not ( = ?auto_24117 ?auto_24125 ) ) ( not ( = ?auto_24117 ?auto_24104 ) ) ( not ( = ?auto_24117 ?auto_24112 ) ) ( not ( = ?auto_24117 ?auto_24122 ) ) ( not ( = ?auto_24117 ?auto_24121 ) ) ( not ( = ?auto_24129 ?auto_24116 ) ) ( not ( = ?auto_24129 ?auto_24127 ) ) ( not ( = ?auto_24129 ?auto_24120 ) ) ( not ( = ?auto_24129 ?auto_24109 ) ) ( not ( = ?auto_24129 ?auto_24124 ) ) ( not ( = ?auto_24129 ?auto_24134 ) ) ( not ( = ?auto_24129 ?auto_24118 ) ) ( not ( = ?auto_24091 ?auto_24098 ) ) ( not ( = ?auto_24091 ?auto_24119 ) ) ( not ( = ?auto_24092 ?auto_24098 ) ) ( not ( = ?auto_24092 ?auto_24119 ) ) ( not ( = ?auto_24093 ?auto_24098 ) ) ( not ( = ?auto_24093 ?auto_24119 ) ) ( not ( = ?auto_24094 ?auto_24098 ) ) ( not ( = ?auto_24094 ?auto_24119 ) ) ( not ( = ?auto_24095 ?auto_24098 ) ) ( not ( = ?auto_24095 ?auto_24119 ) ) ( not ( = ?auto_24096 ?auto_24098 ) ) ( not ( = ?auto_24096 ?auto_24119 ) ) ( not ( = ?auto_24097 ?auto_24098 ) ) ( not ( = ?auto_24097 ?auto_24119 ) ) ( not ( = ?auto_24100 ?auto_24098 ) ) ( not ( = ?auto_24100 ?auto_24119 ) ) ( not ( = ?auto_24098 ?auto_24129 ) ) ( not ( = ?auto_24098 ?auto_24116 ) ) ( not ( = ?auto_24098 ?auto_24127 ) ) ( not ( = ?auto_24098 ?auto_24120 ) ) ( not ( = ?auto_24098 ?auto_24109 ) ) ( not ( = ?auto_24098 ?auto_24124 ) ) ( not ( = ?auto_24098 ?auto_24134 ) ) ( not ( = ?auto_24098 ?auto_24118 ) ) ( not ( = ?auto_24115 ?auto_24114 ) ) ( not ( = ?auto_24115 ?auto_24133 ) ) ( not ( = ?auto_24115 ?auto_24126 ) ) ( not ( = ?auto_24115 ?auto_24105 ) ) ( not ( = ?auto_24115 ?auto_24130 ) ) ( not ( = ?auto_24115 ?auto_24132 ) ) ( not ( = ?auto_24115 ?auto_24110 ) ) ( not ( = ?auto_24113 ?auto_24117 ) ) ( not ( = ?auto_24113 ?auto_24131 ) ) ( not ( = ?auto_24113 ?auto_24125 ) ) ( not ( = ?auto_24113 ?auto_24104 ) ) ( not ( = ?auto_24113 ?auto_24112 ) ) ( not ( = ?auto_24113 ?auto_24122 ) ) ( not ( = ?auto_24113 ?auto_24121 ) ) ( not ( = ?auto_24119 ?auto_24129 ) ) ( not ( = ?auto_24119 ?auto_24116 ) ) ( not ( = ?auto_24119 ?auto_24127 ) ) ( not ( = ?auto_24119 ?auto_24120 ) ) ( not ( = ?auto_24119 ?auto_24109 ) ) ( not ( = ?auto_24119 ?auto_24124 ) ) ( not ( = ?auto_24119 ?auto_24134 ) ) ( not ( = ?auto_24119 ?auto_24118 ) ) ( not ( = ?auto_24091 ?auto_24101 ) ) ( not ( = ?auto_24091 ?auto_24111 ) ) ( not ( = ?auto_24092 ?auto_24101 ) ) ( not ( = ?auto_24092 ?auto_24111 ) ) ( not ( = ?auto_24093 ?auto_24101 ) ) ( not ( = ?auto_24093 ?auto_24111 ) ) ( not ( = ?auto_24094 ?auto_24101 ) ) ( not ( = ?auto_24094 ?auto_24111 ) ) ( not ( = ?auto_24095 ?auto_24101 ) ) ( not ( = ?auto_24095 ?auto_24111 ) ) ( not ( = ?auto_24096 ?auto_24101 ) ) ( not ( = ?auto_24096 ?auto_24111 ) ) ( not ( = ?auto_24097 ?auto_24101 ) ) ( not ( = ?auto_24097 ?auto_24111 ) ) ( not ( = ?auto_24100 ?auto_24101 ) ) ( not ( = ?auto_24100 ?auto_24111 ) ) ( not ( = ?auto_24099 ?auto_24101 ) ) ( not ( = ?auto_24099 ?auto_24111 ) ) ( not ( = ?auto_24101 ?auto_24119 ) ) ( not ( = ?auto_24101 ?auto_24129 ) ) ( not ( = ?auto_24101 ?auto_24116 ) ) ( not ( = ?auto_24101 ?auto_24127 ) ) ( not ( = ?auto_24101 ?auto_24120 ) ) ( not ( = ?auto_24101 ?auto_24109 ) ) ( not ( = ?auto_24101 ?auto_24124 ) ) ( not ( = ?auto_24101 ?auto_24134 ) ) ( not ( = ?auto_24101 ?auto_24118 ) ) ( not ( = ?auto_24123 ?auto_24115 ) ) ( not ( = ?auto_24123 ?auto_24114 ) ) ( not ( = ?auto_24123 ?auto_24133 ) ) ( not ( = ?auto_24123 ?auto_24126 ) ) ( not ( = ?auto_24123 ?auto_24105 ) ) ( not ( = ?auto_24123 ?auto_24130 ) ) ( not ( = ?auto_24123 ?auto_24132 ) ) ( not ( = ?auto_24123 ?auto_24110 ) ) ( not ( = ?auto_24128 ?auto_24113 ) ) ( not ( = ?auto_24128 ?auto_24117 ) ) ( not ( = ?auto_24128 ?auto_24131 ) ) ( not ( = ?auto_24128 ?auto_24125 ) ) ( not ( = ?auto_24128 ?auto_24104 ) ) ( not ( = ?auto_24128 ?auto_24112 ) ) ( not ( = ?auto_24128 ?auto_24122 ) ) ( not ( = ?auto_24128 ?auto_24121 ) ) ( not ( = ?auto_24111 ?auto_24119 ) ) ( not ( = ?auto_24111 ?auto_24129 ) ) ( not ( = ?auto_24111 ?auto_24116 ) ) ( not ( = ?auto_24111 ?auto_24127 ) ) ( not ( = ?auto_24111 ?auto_24120 ) ) ( not ( = ?auto_24111 ?auto_24109 ) ) ( not ( = ?auto_24111 ?auto_24124 ) ) ( not ( = ?auto_24111 ?auto_24134 ) ) ( not ( = ?auto_24111 ?auto_24118 ) ) ( not ( = ?auto_24091 ?auto_24102 ) ) ( not ( = ?auto_24091 ?auto_24106 ) ) ( not ( = ?auto_24092 ?auto_24102 ) ) ( not ( = ?auto_24092 ?auto_24106 ) ) ( not ( = ?auto_24093 ?auto_24102 ) ) ( not ( = ?auto_24093 ?auto_24106 ) ) ( not ( = ?auto_24094 ?auto_24102 ) ) ( not ( = ?auto_24094 ?auto_24106 ) ) ( not ( = ?auto_24095 ?auto_24102 ) ) ( not ( = ?auto_24095 ?auto_24106 ) ) ( not ( = ?auto_24096 ?auto_24102 ) ) ( not ( = ?auto_24096 ?auto_24106 ) ) ( not ( = ?auto_24097 ?auto_24102 ) ) ( not ( = ?auto_24097 ?auto_24106 ) ) ( not ( = ?auto_24100 ?auto_24102 ) ) ( not ( = ?auto_24100 ?auto_24106 ) ) ( not ( = ?auto_24099 ?auto_24102 ) ) ( not ( = ?auto_24099 ?auto_24106 ) ) ( not ( = ?auto_24098 ?auto_24102 ) ) ( not ( = ?auto_24098 ?auto_24106 ) ) ( not ( = ?auto_24102 ?auto_24111 ) ) ( not ( = ?auto_24102 ?auto_24119 ) ) ( not ( = ?auto_24102 ?auto_24129 ) ) ( not ( = ?auto_24102 ?auto_24116 ) ) ( not ( = ?auto_24102 ?auto_24127 ) ) ( not ( = ?auto_24102 ?auto_24120 ) ) ( not ( = ?auto_24102 ?auto_24109 ) ) ( not ( = ?auto_24102 ?auto_24124 ) ) ( not ( = ?auto_24102 ?auto_24134 ) ) ( not ( = ?auto_24102 ?auto_24118 ) ) ( not ( = ?auto_24106 ?auto_24111 ) ) ( not ( = ?auto_24106 ?auto_24119 ) ) ( not ( = ?auto_24106 ?auto_24129 ) ) ( not ( = ?auto_24106 ?auto_24116 ) ) ( not ( = ?auto_24106 ?auto_24127 ) ) ( not ( = ?auto_24106 ?auto_24120 ) ) ( not ( = ?auto_24106 ?auto_24109 ) ) ( not ( = ?auto_24106 ?auto_24124 ) ) ( not ( = ?auto_24106 ?auto_24134 ) ) ( not ( = ?auto_24106 ?auto_24118 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_24091 ?auto_24092 ?auto_24093 ?auto_24094 ?auto_24095 ?auto_24096 ?auto_24097 ?auto_24100 ?auto_24099 ?auto_24098 ?auto_24101 )
      ( MAKE-1CRATE ?auto_24101 ?auto_24102 )
      ( MAKE-11CRATE-VERIFY ?auto_24091 ?auto_24092 ?auto_24093 ?auto_24094 ?auto_24095 ?auto_24096 ?auto_24097 ?auto_24100 ?auto_24099 ?auto_24098 ?auto_24101 ?auto_24102 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24137 - SURFACE
      ?auto_24138 - SURFACE
    )
    :vars
    (
      ?auto_24139 - HOIST
      ?auto_24140 - PLACE
      ?auto_24142 - PLACE
      ?auto_24143 - HOIST
      ?auto_24144 - SURFACE
      ?auto_24141 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24139 ?auto_24140 ) ( SURFACE-AT ?auto_24137 ?auto_24140 ) ( CLEAR ?auto_24137 ) ( IS-CRATE ?auto_24138 ) ( AVAILABLE ?auto_24139 ) ( not ( = ?auto_24142 ?auto_24140 ) ) ( HOIST-AT ?auto_24143 ?auto_24142 ) ( AVAILABLE ?auto_24143 ) ( SURFACE-AT ?auto_24138 ?auto_24142 ) ( ON ?auto_24138 ?auto_24144 ) ( CLEAR ?auto_24138 ) ( TRUCK-AT ?auto_24141 ?auto_24140 ) ( not ( = ?auto_24137 ?auto_24138 ) ) ( not ( = ?auto_24137 ?auto_24144 ) ) ( not ( = ?auto_24138 ?auto_24144 ) ) ( not ( = ?auto_24139 ?auto_24143 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24141 ?auto_24140 ?auto_24142 )
      ( !LIFT ?auto_24143 ?auto_24138 ?auto_24144 ?auto_24142 )
      ( !LOAD ?auto_24143 ?auto_24138 ?auto_24141 ?auto_24142 )
      ( !DRIVE ?auto_24141 ?auto_24142 ?auto_24140 )
      ( !UNLOAD ?auto_24139 ?auto_24138 ?auto_24141 ?auto_24140 )
      ( !DROP ?auto_24139 ?auto_24138 ?auto_24137 ?auto_24140 )
      ( MAKE-1CRATE-VERIFY ?auto_24137 ?auto_24138 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_24158 - SURFACE
      ?auto_24159 - SURFACE
      ?auto_24160 - SURFACE
      ?auto_24161 - SURFACE
      ?auto_24162 - SURFACE
      ?auto_24163 - SURFACE
      ?auto_24164 - SURFACE
      ?auto_24167 - SURFACE
      ?auto_24166 - SURFACE
      ?auto_24165 - SURFACE
      ?auto_24168 - SURFACE
      ?auto_24169 - SURFACE
      ?auto_24170 - SURFACE
    )
    :vars
    (
      ?auto_24174 - HOIST
      ?auto_24172 - PLACE
      ?auto_24175 - PLACE
      ?auto_24173 - HOIST
      ?auto_24171 - SURFACE
      ?auto_24201 - SURFACE
      ?auto_24192 - PLACE
      ?auto_24177 - HOIST
      ?auto_24197 - SURFACE
      ?auto_24182 - PLACE
      ?auto_24185 - HOIST
      ?auto_24202 - SURFACE
      ?auto_24187 - PLACE
      ?auto_24189 - HOIST
      ?auto_24200 - SURFACE
      ?auto_24196 - PLACE
      ?auto_24186 - HOIST
      ?auto_24181 - SURFACE
      ?auto_24183 - PLACE
      ?auto_24199 - HOIST
      ?auto_24198 - SURFACE
      ?auto_24188 - SURFACE
      ?auto_24178 - PLACE
      ?auto_24190 - HOIST
      ?auto_24191 - SURFACE
      ?auto_24195 - PLACE
      ?auto_24179 - HOIST
      ?auto_24194 - SURFACE
      ?auto_24180 - SURFACE
      ?auto_24193 - PLACE
      ?auto_24184 - HOIST
      ?auto_24203 - SURFACE
      ?auto_24176 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24174 ?auto_24172 ) ( IS-CRATE ?auto_24170 ) ( not ( = ?auto_24175 ?auto_24172 ) ) ( HOIST-AT ?auto_24173 ?auto_24175 ) ( SURFACE-AT ?auto_24170 ?auto_24175 ) ( ON ?auto_24170 ?auto_24171 ) ( CLEAR ?auto_24170 ) ( not ( = ?auto_24169 ?auto_24170 ) ) ( not ( = ?auto_24169 ?auto_24171 ) ) ( not ( = ?auto_24170 ?auto_24171 ) ) ( not ( = ?auto_24174 ?auto_24173 ) ) ( IS-CRATE ?auto_24169 ) ( SURFACE-AT ?auto_24169 ?auto_24175 ) ( ON ?auto_24169 ?auto_24201 ) ( CLEAR ?auto_24169 ) ( not ( = ?auto_24168 ?auto_24169 ) ) ( not ( = ?auto_24168 ?auto_24201 ) ) ( not ( = ?auto_24169 ?auto_24201 ) ) ( IS-CRATE ?auto_24168 ) ( not ( = ?auto_24192 ?auto_24172 ) ) ( HOIST-AT ?auto_24177 ?auto_24192 ) ( AVAILABLE ?auto_24177 ) ( SURFACE-AT ?auto_24168 ?auto_24192 ) ( ON ?auto_24168 ?auto_24197 ) ( CLEAR ?auto_24168 ) ( not ( = ?auto_24165 ?auto_24168 ) ) ( not ( = ?auto_24165 ?auto_24197 ) ) ( not ( = ?auto_24168 ?auto_24197 ) ) ( not ( = ?auto_24174 ?auto_24177 ) ) ( IS-CRATE ?auto_24165 ) ( not ( = ?auto_24182 ?auto_24172 ) ) ( HOIST-AT ?auto_24185 ?auto_24182 ) ( AVAILABLE ?auto_24185 ) ( SURFACE-AT ?auto_24165 ?auto_24182 ) ( ON ?auto_24165 ?auto_24202 ) ( CLEAR ?auto_24165 ) ( not ( = ?auto_24166 ?auto_24165 ) ) ( not ( = ?auto_24166 ?auto_24202 ) ) ( not ( = ?auto_24165 ?auto_24202 ) ) ( not ( = ?auto_24174 ?auto_24185 ) ) ( IS-CRATE ?auto_24166 ) ( not ( = ?auto_24187 ?auto_24172 ) ) ( HOIST-AT ?auto_24189 ?auto_24187 ) ( AVAILABLE ?auto_24189 ) ( SURFACE-AT ?auto_24166 ?auto_24187 ) ( ON ?auto_24166 ?auto_24200 ) ( CLEAR ?auto_24166 ) ( not ( = ?auto_24167 ?auto_24166 ) ) ( not ( = ?auto_24167 ?auto_24200 ) ) ( not ( = ?auto_24166 ?auto_24200 ) ) ( not ( = ?auto_24174 ?auto_24189 ) ) ( IS-CRATE ?auto_24167 ) ( not ( = ?auto_24196 ?auto_24172 ) ) ( HOIST-AT ?auto_24186 ?auto_24196 ) ( AVAILABLE ?auto_24186 ) ( SURFACE-AT ?auto_24167 ?auto_24196 ) ( ON ?auto_24167 ?auto_24181 ) ( CLEAR ?auto_24167 ) ( not ( = ?auto_24164 ?auto_24167 ) ) ( not ( = ?auto_24164 ?auto_24181 ) ) ( not ( = ?auto_24167 ?auto_24181 ) ) ( not ( = ?auto_24174 ?auto_24186 ) ) ( IS-CRATE ?auto_24164 ) ( not ( = ?auto_24183 ?auto_24172 ) ) ( HOIST-AT ?auto_24199 ?auto_24183 ) ( SURFACE-AT ?auto_24164 ?auto_24183 ) ( ON ?auto_24164 ?auto_24198 ) ( CLEAR ?auto_24164 ) ( not ( = ?auto_24163 ?auto_24164 ) ) ( not ( = ?auto_24163 ?auto_24198 ) ) ( not ( = ?auto_24164 ?auto_24198 ) ) ( not ( = ?auto_24174 ?auto_24199 ) ) ( IS-CRATE ?auto_24163 ) ( AVAILABLE ?auto_24173 ) ( SURFACE-AT ?auto_24163 ?auto_24175 ) ( ON ?auto_24163 ?auto_24188 ) ( CLEAR ?auto_24163 ) ( not ( = ?auto_24162 ?auto_24163 ) ) ( not ( = ?auto_24162 ?auto_24188 ) ) ( not ( = ?auto_24163 ?auto_24188 ) ) ( IS-CRATE ?auto_24162 ) ( not ( = ?auto_24178 ?auto_24172 ) ) ( HOIST-AT ?auto_24190 ?auto_24178 ) ( AVAILABLE ?auto_24190 ) ( SURFACE-AT ?auto_24162 ?auto_24178 ) ( ON ?auto_24162 ?auto_24191 ) ( CLEAR ?auto_24162 ) ( not ( = ?auto_24161 ?auto_24162 ) ) ( not ( = ?auto_24161 ?auto_24191 ) ) ( not ( = ?auto_24162 ?auto_24191 ) ) ( not ( = ?auto_24174 ?auto_24190 ) ) ( IS-CRATE ?auto_24161 ) ( not ( = ?auto_24195 ?auto_24172 ) ) ( HOIST-AT ?auto_24179 ?auto_24195 ) ( AVAILABLE ?auto_24179 ) ( SURFACE-AT ?auto_24161 ?auto_24195 ) ( ON ?auto_24161 ?auto_24194 ) ( CLEAR ?auto_24161 ) ( not ( = ?auto_24160 ?auto_24161 ) ) ( not ( = ?auto_24160 ?auto_24194 ) ) ( not ( = ?auto_24161 ?auto_24194 ) ) ( not ( = ?auto_24174 ?auto_24179 ) ) ( IS-CRATE ?auto_24160 ) ( AVAILABLE ?auto_24199 ) ( SURFACE-AT ?auto_24160 ?auto_24183 ) ( ON ?auto_24160 ?auto_24180 ) ( CLEAR ?auto_24160 ) ( not ( = ?auto_24159 ?auto_24160 ) ) ( not ( = ?auto_24159 ?auto_24180 ) ) ( not ( = ?auto_24160 ?auto_24180 ) ) ( SURFACE-AT ?auto_24158 ?auto_24172 ) ( CLEAR ?auto_24158 ) ( IS-CRATE ?auto_24159 ) ( AVAILABLE ?auto_24174 ) ( not ( = ?auto_24193 ?auto_24172 ) ) ( HOIST-AT ?auto_24184 ?auto_24193 ) ( AVAILABLE ?auto_24184 ) ( SURFACE-AT ?auto_24159 ?auto_24193 ) ( ON ?auto_24159 ?auto_24203 ) ( CLEAR ?auto_24159 ) ( TRUCK-AT ?auto_24176 ?auto_24172 ) ( not ( = ?auto_24158 ?auto_24159 ) ) ( not ( = ?auto_24158 ?auto_24203 ) ) ( not ( = ?auto_24159 ?auto_24203 ) ) ( not ( = ?auto_24174 ?auto_24184 ) ) ( not ( = ?auto_24158 ?auto_24160 ) ) ( not ( = ?auto_24158 ?auto_24180 ) ) ( not ( = ?auto_24160 ?auto_24203 ) ) ( not ( = ?auto_24183 ?auto_24193 ) ) ( not ( = ?auto_24199 ?auto_24184 ) ) ( not ( = ?auto_24180 ?auto_24203 ) ) ( not ( = ?auto_24158 ?auto_24161 ) ) ( not ( = ?auto_24158 ?auto_24194 ) ) ( not ( = ?auto_24159 ?auto_24161 ) ) ( not ( = ?auto_24159 ?auto_24194 ) ) ( not ( = ?auto_24161 ?auto_24180 ) ) ( not ( = ?auto_24161 ?auto_24203 ) ) ( not ( = ?auto_24195 ?auto_24183 ) ) ( not ( = ?auto_24195 ?auto_24193 ) ) ( not ( = ?auto_24179 ?auto_24199 ) ) ( not ( = ?auto_24179 ?auto_24184 ) ) ( not ( = ?auto_24194 ?auto_24180 ) ) ( not ( = ?auto_24194 ?auto_24203 ) ) ( not ( = ?auto_24158 ?auto_24162 ) ) ( not ( = ?auto_24158 ?auto_24191 ) ) ( not ( = ?auto_24159 ?auto_24162 ) ) ( not ( = ?auto_24159 ?auto_24191 ) ) ( not ( = ?auto_24160 ?auto_24162 ) ) ( not ( = ?auto_24160 ?auto_24191 ) ) ( not ( = ?auto_24162 ?auto_24194 ) ) ( not ( = ?auto_24162 ?auto_24180 ) ) ( not ( = ?auto_24162 ?auto_24203 ) ) ( not ( = ?auto_24178 ?auto_24195 ) ) ( not ( = ?auto_24178 ?auto_24183 ) ) ( not ( = ?auto_24178 ?auto_24193 ) ) ( not ( = ?auto_24190 ?auto_24179 ) ) ( not ( = ?auto_24190 ?auto_24199 ) ) ( not ( = ?auto_24190 ?auto_24184 ) ) ( not ( = ?auto_24191 ?auto_24194 ) ) ( not ( = ?auto_24191 ?auto_24180 ) ) ( not ( = ?auto_24191 ?auto_24203 ) ) ( not ( = ?auto_24158 ?auto_24163 ) ) ( not ( = ?auto_24158 ?auto_24188 ) ) ( not ( = ?auto_24159 ?auto_24163 ) ) ( not ( = ?auto_24159 ?auto_24188 ) ) ( not ( = ?auto_24160 ?auto_24163 ) ) ( not ( = ?auto_24160 ?auto_24188 ) ) ( not ( = ?auto_24161 ?auto_24163 ) ) ( not ( = ?auto_24161 ?auto_24188 ) ) ( not ( = ?auto_24163 ?auto_24191 ) ) ( not ( = ?auto_24163 ?auto_24194 ) ) ( not ( = ?auto_24163 ?auto_24180 ) ) ( not ( = ?auto_24163 ?auto_24203 ) ) ( not ( = ?auto_24175 ?auto_24178 ) ) ( not ( = ?auto_24175 ?auto_24195 ) ) ( not ( = ?auto_24175 ?auto_24183 ) ) ( not ( = ?auto_24175 ?auto_24193 ) ) ( not ( = ?auto_24173 ?auto_24190 ) ) ( not ( = ?auto_24173 ?auto_24179 ) ) ( not ( = ?auto_24173 ?auto_24199 ) ) ( not ( = ?auto_24173 ?auto_24184 ) ) ( not ( = ?auto_24188 ?auto_24191 ) ) ( not ( = ?auto_24188 ?auto_24194 ) ) ( not ( = ?auto_24188 ?auto_24180 ) ) ( not ( = ?auto_24188 ?auto_24203 ) ) ( not ( = ?auto_24158 ?auto_24164 ) ) ( not ( = ?auto_24158 ?auto_24198 ) ) ( not ( = ?auto_24159 ?auto_24164 ) ) ( not ( = ?auto_24159 ?auto_24198 ) ) ( not ( = ?auto_24160 ?auto_24164 ) ) ( not ( = ?auto_24160 ?auto_24198 ) ) ( not ( = ?auto_24161 ?auto_24164 ) ) ( not ( = ?auto_24161 ?auto_24198 ) ) ( not ( = ?auto_24162 ?auto_24164 ) ) ( not ( = ?auto_24162 ?auto_24198 ) ) ( not ( = ?auto_24164 ?auto_24188 ) ) ( not ( = ?auto_24164 ?auto_24191 ) ) ( not ( = ?auto_24164 ?auto_24194 ) ) ( not ( = ?auto_24164 ?auto_24180 ) ) ( not ( = ?auto_24164 ?auto_24203 ) ) ( not ( = ?auto_24198 ?auto_24188 ) ) ( not ( = ?auto_24198 ?auto_24191 ) ) ( not ( = ?auto_24198 ?auto_24194 ) ) ( not ( = ?auto_24198 ?auto_24180 ) ) ( not ( = ?auto_24198 ?auto_24203 ) ) ( not ( = ?auto_24158 ?auto_24167 ) ) ( not ( = ?auto_24158 ?auto_24181 ) ) ( not ( = ?auto_24159 ?auto_24167 ) ) ( not ( = ?auto_24159 ?auto_24181 ) ) ( not ( = ?auto_24160 ?auto_24167 ) ) ( not ( = ?auto_24160 ?auto_24181 ) ) ( not ( = ?auto_24161 ?auto_24167 ) ) ( not ( = ?auto_24161 ?auto_24181 ) ) ( not ( = ?auto_24162 ?auto_24167 ) ) ( not ( = ?auto_24162 ?auto_24181 ) ) ( not ( = ?auto_24163 ?auto_24167 ) ) ( not ( = ?auto_24163 ?auto_24181 ) ) ( not ( = ?auto_24167 ?auto_24198 ) ) ( not ( = ?auto_24167 ?auto_24188 ) ) ( not ( = ?auto_24167 ?auto_24191 ) ) ( not ( = ?auto_24167 ?auto_24194 ) ) ( not ( = ?auto_24167 ?auto_24180 ) ) ( not ( = ?auto_24167 ?auto_24203 ) ) ( not ( = ?auto_24196 ?auto_24183 ) ) ( not ( = ?auto_24196 ?auto_24175 ) ) ( not ( = ?auto_24196 ?auto_24178 ) ) ( not ( = ?auto_24196 ?auto_24195 ) ) ( not ( = ?auto_24196 ?auto_24193 ) ) ( not ( = ?auto_24186 ?auto_24199 ) ) ( not ( = ?auto_24186 ?auto_24173 ) ) ( not ( = ?auto_24186 ?auto_24190 ) ) ( not ( = ?auto_24186 ?auto_24179 ) ) ( not ( = ?auto_24186 ?auto_24184 ) ) ( not ( = ?auto_24181 ?auto_24198 ) ) ( not ( = ?auto_24181 ?auto_24188 ) ) ( not ( = ?auto_24181 ?auto_24191 ) ) ( not ( = ?auto_24181 ?auto_24194 ) ) ( not ( = ?auto_24181 ?auto_24180 ) ) ( not ( = ?auto_24181 ?auto_24203 ) ) ( not ( = ?auto_24158 ?auto_24166 ) ) ( not ( = ?auto_24158 ?auto_24200 ) ) ( not ( = ?auto_24159 ?auto_24166 ) ) ( not ( = ?auto_24159 ?auto_24200 ) ) ( not ( = ?auto_24160 ?auto_24166 ) ) ( not ( = ?auto_24160 ?auto_24200 ) ) ( not ( = ?auto_24161 ?auto_24166 ) ) ( not ( = ?auto_24161 ?auto_24200 ) ) ( not ( = ?auto_24162 ?auto_24166 ) ) ( not ( = ?auto_24162 ?auto_24200 ) ) ( not ( = ?auto_24163 ?auto_24166 ) ) ( not ( = ?auto_24163 ?auto_24200 ) ) ( not ( = ?auto_24164 ?auto_24166 ) ) ( not ( = ?auto_24164 ?auto_24200 ) ) ( not ( = ?auto_24166 ?auto_24181 ) ) ( not ( = ?auto_24166 ?auto_24198 ) ) ( not ( = ?auto_24166 ?auto_24188 ) ) ( not ( = ?auto_24166 ?auto_24191 ) ) ( not ( = ?auto_24166 ?auto_24194 ) ) ( not ( = ?auto_24166 ?auto_24180 ) ) ( not ( = ?auto_24166 ?auto_24203 ) ) ( not ( = ?auto_24187 ?auto_24196 ) ) ( not ( = ?auto_24187 ?auto_24183 ) ) ( not ( = ?auto_24187 ?auto_24175 ) ) ( not ( = ?auto_24187 ?auto_24178 ) ) ( not ( = ?auto_24187 ?auto_24195 ) ) ( not ( = ?auto_24187 ?auto_24193 ) ) ( not ( = ?auto_24189 ?auto_24186 ) ) ( not ( = ?auto_24189 ?auto_24199 ) ) ( not ( = ?auto_24189 ?auto_24173 ) ) ( not ( = ?auto_24189 ?auto_24190 ) ) ( not ( = ?auto_24189 ?auto_24179 ) ) ( not ( = ?auto_24189 ?auto_24184 ) ) ( not ( = ?auto_24200 ?auto_24181 ) ) ( not ( = ?auto_24200 ?auto_24198 ) ) ( not ( = ?auto_24200 ?auto_24188 ) ) ( not ( = ?auto_24200 ?auto_24191 ) ) ( not ( = ?auto_24200 ?auto_24194 ) ) ( not ( = ?auto_24200 ?auto_24180 ) ) ( not ( = ?auto_24200 ?auto_24203 ) ) ( not ( = ?auto_24158 ?auto_24165 ) ) ( not ( = ?auto_24158 ?auto_24202 ) ) ( not ( = ?auto_24159 ?auto_24165 ) ) ( not ( = ?auto_24159 ?auto_24202 ) ) ( not ( = ?auto_24160 ?auto_24165 ) ) ( not ( = ?auto_24160 ?auto_24202 ) ) ( not ( = ?auto_24161 ?auto_24165 ) ) ( not ( = ?auto_24161 ?auto_24202 ) ) ( not ( = ?auto_24162 ?auto_24165 ) ) ( not ( = ?auto_24162 ?auto_24202 ) ) ( not ( = ?auto_24163 ?auto_24165 ) ) ( not ( = ?auto_24163 ?auto_24202 ) ) ( not ( = ?auto_24164 ?auto_24165 ) ) ( not ( = ?auto_24164 ?auto_24202 ) ) ( not ( = ?auto_24167 ?auto_24165 ) ) ( not ( = ?auto_24167 ?auto_24202 ) ) ( not ( = ?auto_24165 ?auto_24200 ) ) ( not ( = ?auto_24165 ?auto_24181 ) ) ( not ( = ?auto_24165 ?auto_24198 ) ) ( not ( = ?auto_24165 ?auto_24188 ) ) ( not ( = ?auto_24165 ?auto_24191 ) ) ( not ( = ?auto_24165 ?auto_24194 ) ) ( not ( = ?auto_24165 ?auto_24180 ) ) ( not ( = ?auto_24165 ?auto_24203 ) ) ( not ( = ?auto_24182 ?auto_24187 ) ) ( not ( = ?auto_24182 ?auto_24196 ) ) ( not ( = ?auto_24182 ?auto_24183 ) ) ( not ( = ?auto_24182 ?auto_24175 ) ) ( not ( = ?auto_24182 ?auto_24178 ) ) ( not ( = ?auto_24182 ?auto_24195 ) ) ( not ( = ?auto_24182 ?auto_24193 ) ) ( not ( = ?auto_24185 ?auto_24189 ) ) ( not ( = ?auto_24185 ?auto_24186 ) ) ( not ( = ?auto_24185 ?auto_24199 ) ) ( not ( = ?auto_24185 ?auto_24173 ) ) ( not ( = ?auto_24185 ?auto_24190 ) ) ( not ( = ?auto_24185 ?auto_24179 ) ) ( not ( = ?auto_24185 ?auto_24184 ) ) ( not ( = ?auto_24202 ?auto_24200 ) ) ( not ( = ?auto_24202 ?auto_24181 ) ) ( not ( = ?auto_24202 ?auto_24198 ) ) ( not ( = ?auto_24202 ?auto_24188 ) ) ( not ( = ?auto_24202 ?auto_24191 ) ) ( not ( = ?auto_24202 ?auto_24194 ) ) ( not ( = ?auto_24202 ?auto_24180 ) ) ( not ( = ?auto_24202 ?auto_24203 ) ) ( not ( = ?auto_24158 ?auto_24168 ) ) ( not ( = ?auto_24158 ?auto_24197 ) ) ( not ( = ?auto_24159 ?auto_24168 ) ) ( not ( = ?auto_24159 ?auto_24197 ) ) ( not ( = ?auto_24160 ?auto_24168 ) ) ( not ( = ?auto_24160 ?auto_24197 ) ) ( not ( = ?auto_24161 ?auto_24168 ) ) ( not ( = ?auto_24161 ?auto_24197 ) ) ( not ( = ?auto_24162 ?auto_24168 ) ) ( not ( = ?auto_24162 ?auto_24197 ) ) ( not ( = ?auto_24163 ?auto_24168 ) ) ( not ( = ?auto_24163 ?auto_24197 ) ) ( not ( = ?auto_24164 ?auto_24168 ) ) ( not ( = ?auto_24164 ?auto_24197 ) ) ( not ( = ?auto_24167 ?auto_24168 ) ) ( not ( = ?auto_24167 ?auto_24197 ) ) ( not ( = ?auto_24166 ?auto_24168 ) ) ( not ( = ?auto_24166 ?auto_24197 ) ) ( not ( = ?auto_24168 ?auto_24202 ) ) ( not ( = ?auto_24168 ?auto_24200 ) ) ( not ( = ?auto_24168 ?auto_24181 ) ) ( not ( = ?auto_24168 ?auto_24198 ) ) ( not ( = ?auto_24168 ?auto_24188 ) ) ( not ( = ?auto_24168 ?auto_24191 ) ) ( not ( = ?auto_24168 ?auto_24194 ) ) ( not ( = ?auto_24168 ?auto_24180 ) ) ( not ( = ?auto_24168 ?auto_24203 ) ) ( not ( = ?auto_24192 ?auto_24182 ) ) ( not ( = ?auto_24192 ?auto_24187 ) ) ( not ( = ?auto_24192 ?auto_24196 ) ) ( not ( = ?auto_24192 ?auto_24183 ) ) ( not ( = ?auto_24192 ?auto_24175 ) ) ( not ( = ?auto_24192 ?auto_24178 ) ) ( not ( = ?auto_24192 ?auto_24195 ) ) ( not ( = ?auto_24192 ?auto_24193 ) ) ( not ( = ?auto_24177 ?auto_24185 ) ) ( not ( = ?auto_24177 ?auto_24189 ) ) ( not ( = ?auto_24177 ?auto_24186 ) ) ( not ( = ?auto_24177 ?auto_24199 ) ) ( not ( = ?auto_24177 ?auto_24173 ) ) ( not ( = ?auto_24177 ?auto_24190 ) ) ( not ( = ?auto_24177 ?auto_24179 ) ) ( not ( = ?auto_24177 ?auto_24184 ) ) ( not ( = ?auto_24197 ?auto_24202 ) ) ( not ( = ?auto_24197 ?auto_24200 ) ) ( not ( = ?auto_24197 ?auto_24181 ) ) ( not ( = ?auto_24197 ?auto_24198 ) ) ( not ( = ?auto_24197 ?auto_24188 ) ) ( not ( = ?auto_24197 ?auto_24191 ) ) ( not ( = ?auto_24197 ?auto_24194 ) ) ( not ( = ?auto_24197 ?auto_24180 ) ) ( not ( = ?auto_24197 ?auto_24203 ) ) ( not ( = ?auto_24158 ?auto_24169 ) ) ( not ( = ?auto_24158 ?auto_24201 ) ) ( not ( = ?auto_24159 ?auto_24169 ) ) ( not ( = ?auto_24159 ?auto_24201 ) ) ( not ( = ?auto_24160 ?auto_24169 ) ) ( not ( = ?auto_24160 ?auto_24201 ) ) ( not ( = ?auto_24161 ?auto_24169 ) ) ( not ( = ?auto_24161 ?auto_24201 ) ) ( not ( = ?auto_24162 ?auto_24169 ) ) ( not ( = ?auto_24162 ?auto_24201 ) ) ( not ( = ?auto_24163 ?auto_24169 ) ) ( not ( = ?auto_24163 ?auto_24201 ) ) ( not ( = ?auto_24164 ?auto_24169 ) ) ( not ( = ?auto_24164 ?auto_24201 ) ) ( not ( = ?auto_24167 ?auto_24169 ) ) ( not ( = ?auto_24167 ?auto_24201 ) ) ( not ( = ?auto_24166 ?auto_24169 ) ) ( not ( = ?auto_24166 ?auto_24201 ) ) ( not ( = ?auto_24165 ?auto_24169 ) ) ( not ( = ?auto_24165 ?auto_24201 ) ) ( not ( = ?auto_24169 ?auto_24197 ) ) ( not ( = ?auto_24169 ?auto_24202 ) ) ( not ( = ?auto_24169 ?auto_24200 ) ) ( not ( = ?auto_24169 ?auto_24181 ) ) ( not ( = ?auto_24169 ?auto_24198 ) ) ( not ( = ?auto_24169 ?auto_24188 ) ) ( not ( = ?auto_24169 ?auto_24191 ) ) ( not ( = ?auto_24169 ?auto_24194 ) ) ( not ( = ?auto_24169 ?auto_24180 ) ) ( not ( = ?auto_24169 ?auto_24203 ) ) ( not ( = ?auto_24201 ?auto_24197 ) ) ( not ( = ?auto_24201 ?auto_24202 ) ) ( not ( = ?auto_24201 ?auto_24200 ) ) ( not ( = ?auto_24201 ?auto_24181 ) ) ( not ( = ?auto_24201 ?auto_24198 ) ) ( not ( = ?auto_24201 ?auto_24188 ) ) ( not ( = ?auto_24201 ?auto_24191 ) ) ( not ( = ?auto_24201 ?auto_24194 ) ) ( not ( = ?auto_24201 ?auto_24180 ) ) ( not ( = ?auto_24201 ?auto_24203 ) ) ( not ( = ?auto_24158 ?auto_24170 ) ) ( not ( = ?auto_24158 ?auto_24171 ) ) ( not ( = ?auto_24159 ?auto_24170 ) ) ( not ( = ?auto_24159 ?auto_24171 ) ) ( not ( = ?auto_24160 ?auto_24170 ) ) ( not ( = ?auto_24160 ?auto_24171 ) ) ( not ( = ?auto_24161 ?auto_24170 ) ) ( not ( = ?auto_24161 ?auto_24171 ) ) ( not ( = ?auto_24162 ?auto_24170 ) ) ( not ( = ?auto_24162 ?auto_24171 ) ) ( not ( = ?auto_24163 ?auto_24170 ) ) ( not ( = ?auto_24163 ?auto_24171 ) ) ( not ( = ?auto_24164 ?auto_24170 ) ) ( not ( = ?auto_24164 ?auto_24171 ) ) ( not ( = ?auto_24167 ?auto_24170 ) ) ( not ( = ?auto_24167 ?auto_24171 ) ) ( not ( = ?auto_24166 ?auto_24170 ) ) ( not ( = ?auto_24166 ?auto_24171 ) ) ( not ( = ?auto_24165 ?auto_24170 ) ) ( not ( = ?auto_24165 ?auto_24171 ) ) ( not ( = ?auto_24168 ?auto_24170 ) ) ( not ( = ?auto_24168 ?auto_24171 ) ) ( not ( = ?auto_24170 ?auto_24201 ) ) ( not ( = ?auto_24170 ?auto_24197 ) ) ( not ( = ?auto_24170 ?auto_24202 ) ) ( not ( = ?auto_24170 ?auto_24200 ) ) ( not ( = ?auto_24170 ?auto_24181 ) ) ( not ( = ?auto_24170 ?auto_24198 ) ) ( not ( = ?auto_24170 ?auto_24188 ) ) ( not ( = ?auto_24170 ?auto_24191 ) ) ( not ( = ?auto_24170 ?auto_24194 ) ) ( not ( = ?auto_24170 ?auto_24180 ) ) ( not ( = ?auto_24170 ?auto_24203 ) ) ( not ( = ?auto_24171 ?auto_24201 ) ) ( not ( = ?auto_24171 ?auto_24197 ) ) ( not ( = ?auto_24171 ?auto_24202 ) ) ( not ( = ?auto_24171 ?auto_24200 ) ) ( not ( = ?auto_24171 ?auto_24181 ) ) ( not ( = ?auto_24171 ?auto_24198 ) ) ( not ( = ?auto_24171 ?auto_24188 ) ) ( not ( = ?auto_24171 ?auto_24191 ) ) ( not ( = ?auto_24171 ?auto_24194 ) ) ( not ( = ?auto_24171 ?auto_24180 ) ) ( not ( = ?auto_24171 ?auto_24203 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_24158 ?auto_24159 ?auto_24160 ?auto_24161 ?auto_24162 ?auto_24163 ?auto_24164 ?auto_24167 ?auto_24166 ?auto_24165 ?auto_24168 ?auto_24169 )
      ( MAKE-1CRATE ?auto_24169 ?auto_24170 )
      ( MAKE-12CRATE-VERIFY ?auto_24158 ?auto_24159 ?auto_24160 ?auto_24161 ?auto_24162 ?auto_24163 ?auto_24164 ?auto_24167 ?auto_24166 ?auto_24165 ?auto_24168 ?auto_24169 ?auto_24170 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24206 - SURFACE
      ?auto_24207 - SURFACE
    )
    :vars
    (
      ?auto_24208 - HOIST
      ?auto_24209 - PLACE
      ?auto_24211 - PLACE
      ?auto_24212 - HOIST
      ?auto_24213 - SURFACE
      ?auto_24210 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24208 ?auto_24209 ) ( SURFACE-AT ?auto_24206 ?auto_24209 ) ( CLEAR ?auto_24206 ) ( IS-CRATE ?auto_24207 ) ( AVAILABLE ?auto_24208 ) ( not ( = ?auto_24211 ?auto_24209 ) ) ( HOIST-AT ?auto_24212 ?auto_24211 ) ( AVAILABLE ?auto_24212 ) ( SURFACE-AT ?auto_24207 ?auto_24211 ) ( ON ?auto_24207 ?auto_24213 ) ( CLEAR ?auto_24207 ) ( TRUCK-AT ?auto_24210 ?auto_24209 ) ( not ( = ?auto_24206 ?auto_24207 ) ) ( not ( = ?auto_24206 ?auto_24213 ) ) ( not ( = ?auto_24207 ?auto_24213 ) ) ( not ( = ?auto_24208 ?auto_24212 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24210 ?auto_24209 ?auto_24211 )
      ( !LIFT ?auto_24212 ?auto_24207 ?auto_24213 ?auto_24211 )
      ( !LOAD ?auto_24212 ?auto_24207 ?auto_24210 ?auto_24211 )
      ( !DRIVE ?auto_24210 ?auto_24211 ?auto_24209 )
      ( !UNLOAD ?auto_24208 ?auto_24207 ?auto_24210 ?auto_24209 )
      ( !DROP ?auto_24208 ?auto_24207 ?auto_24206 ?auto_24209 )
      ( MAKE-1CRATE-VERIFY ?auto_24206 ?auto_24207 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_24228 - SURFACE
      ?auto_24229 - SURFACE
      ?auto_24230 - SURFACE
      ?auto_24231 - SURFACE
      ?auto_24232 - SURFACE
      ?auto_24233 - SURFACE
      ?auto_24234 - SURFACE
      ?auto_24237 - SURFACE
      ?auto_24236 - SURFACE
      ?auto_24235 - SURFACE
      ?auto_24238 - SURFACE
      ?auto_24239 - SURFACE
      ?auto_24240 - SURFACE
      ?auto_24241 - SURFACE
    )
    :vars
    (
      ?auto_24243 - HOIST
      ?auto_24242 - PLACE
      ?auto_24246 - PLACE
      ?auto_24245 - HOIST
      ?auto_24244 - SURFACE
      ?auto_24262 - PLACE
      ?auto_24265 - HOIST
      ?auto_24254 - SURFACE
      ?auto_24271 - SURFACE
      ?auto_24257 - PLACE
      ?auto_24272 - HOIST
      ?auto_24255 - SURFACE
      ?auto_24267 - PLACE
      ?auto_24259 - HOIST
      ?auto_24252 - SURFACE
      ?auto_24263 - PLACE
      ?auto_24253 - HOIST
      ?auto_24248 - SURFACE
      ?auto_24277 - PLACE
      ?auto_24269 - HOIST
      ?auto_24260 - SURFACE
      ?auto_24274 - PLACE
      ?auto_24276 - HOIST
      ?auto_24261 - SURFACE
      ?auto_24256 - SURFACE
      ?auto_24258 - PLACE
      ?auto_24270 - HOIST
      ?auto_24250 - SURFACE
      ?auto_24264 - PLACE
      ?auto_24268 - HOIST
      ?auto_24275 - SURFACE
      ?auto_24266 - SURFACE
      ?auto_24251 - PLACE
      ?auto_24249 - HOIST
      ?auto_24273 - SURFACE
      ?auto_24247 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24243 ?auto_24242 ) ( IS-CRATE ?auto_24241 ) ( not ( = ?auto_24246 ?auto_24242 ) ) ( HOIST-AT ?auto_24245 ?auto_24246 ) ( AVAILABLE ?auto_24245 ) ( SURFACE-AT ?auto_24241 ?auto_24246 ) ( ON ?auto_24241 ?auto_24244 ) ( CLEAR ?auto_24241 ) ( not ( = ?auto_24240 ?auto_24241 ) ) ( not ( = ?auto_24240 ?auto_24244 ) ) ( not ( = ?auto_24241 ?auto_24244 ) ) ( not ( = ?auto_24243 ?auto_24245 ) ) ( IS-CRATE ?auto_24240 ) ( not ( = ?auto_24262 ?auto_24242 ) ) ( HOIST-AT ?auto_24265 ?auto_24262 ) ( SURFACE-AT ?auto_24240 ?auto_24262 ) ( ON ?auto_24240 ?auto_24254 ) ( CLEAR ?auto_24240 ) ( not ( = ?auto_24239 ?auto_24240 ) ) ( not ( = ?auto_24239 ?auto_24254 ) ) ( not ( = ?auto_24240 ?auto_24254 ) ) ( not ( = ?auto_24243 ?auto_24265 ) ) ( IS-CRATE ?auto_24239 ) ( SURFACE-AT ?auto_24239 ?auto_24262 ) ( ON ?auto_24239 ?auto_24271 ) ( CLEAR ?auto_24239 ) ( not ( = ?auto_24238 ?auto_24239 ) ) ( not ( = ?auto_24238 ?auto_24271 ) ) ( not ( = ?auto_24239 ?auto_24271 ) ) ( IS-CRATE ?auto_24238 ) ( not ( = ?auto_24257 ?auto_24242 ) ) ( HOIST-AT ?auto_24272 ?auto_24257 ) ( AVAILABLE ?auto_24272 ) ( SURFACE-AT ?auto_24238 ?auto_24257 ) ( ON ?auto_24238 ?auto_24255 ) ( CLEAR ?auto_24238 ) ( not ( = ?auto_24235 ?auto_24238 ) ) ( not ( = ?auto_24235 ?auto_24255 ) ) ( not ( = ?auto_24238 ?auto_24255 ) ) ( not ( = ?auto_24243 ?auto_24272 ) ) ( IS-CRATE ?auto_24235 ) ( not ( = ?auto_24267 ?auto_24242 ) ) ( HOIST-AT ?auto_24259 ?auto_24267 ) ( AVAILABLE ?auto_24259 ) ( SURFACE-AT ?auto_24235 ?auto_24267 ) ( ON ?auto_24235 ?auto_24252 ) ( CLEAR ?auto_24235 ) ( not ( = ?auto_24236 ?auto_24235 ) ) ( not ( = ?auto_24236 ?auto_24252 ) ) ( not ( = ?auto_24235 ?auto_24252 ) ) ( not ( = ?auto_24243 ?auto_24259 ) ) ( IS-CRATE ?auto_24236 ) ( not ( = ?auto_24263 ?auto_24242 ) ) ( HOIST-AT ?auto_24253 ?auto_24263 ) ( AVAILABLE ?auto_24253 ) ( SURFACE-AT ?auto_24236 ?auto_24263 ) ( ON ?auto_24236 ?auto_24248 ) ( CLEAR ?auto_24236 ) ( not ( = ?auto_24237 ?auto_24236 ) ) ( not ( = ?auto_24237 ?auto_24248 ) ) ( not ( = ?auto_24236 ?auto_24248 ) ) ( not ( = ?auto_24243 ?auto_24253 ) ) ( IS-CRATE ?auto_24237 ) ( not ( = ?auto_24277 ?auto_24242 ) ) ( HOIST-AT ?auto_24269 ?auto_24277 ) ( AVAILABLE ?auto_24269 ) ( SURFACE-AT ?auto_24237 ?auto_24277 ) ( ON ?auto_24237 ?auto_24260 ) ( CLEAR ?auto_24237 ) ( not ( = ?auto_24234 ?auto_24237 ) ) ( not ( = ?auto_24234 ?auto_24260 ) ) ( not ( = ?auto_24237 ?auto_24260 ) ) ( not ( = ?auto_24243 ?auto_24269 ) ) ( IS-CRATE ?auto_24234 ) ( not ( = ?auto_24274 ?auto_24242 ) ) ( HOIST-AT ?auto_24276 ?auto_24274 ) ( SURFACE-AT ?auto_24234 ?auto_24274 ) ( ON ?auto_24234 ?auto_24261 ) ( CLEAR ?auto_24234 ) ( not ( = ?auto_24233 ?auto_24234 ) ) ( not ( = ?auto_24233 ?auto_24261 ) ) ( not ( = ?auto_24234 ?auto_24261 ) ) ( not ( = ?auto_24243 ?auto_24276 ) ) ( IS-CRATE ?auto_24233 ) ( AVAILABLE ?auto_24265 ) ( SURFACE-AT ?auto_24233 ?auto_24262 ) ( ON ?auto_24233 ?auto_24256 ) ( CLEAR ?auto_24233 ) ( not ( = ?auto_24232 ?auto_24233 ) ) ( not ( = ?auto_24232 ?auto_24256 ) ) ( not ( = ?auto_24233 ?auto_24256 ) ) ( IS-CRATE ?auto_24232 ) ( not ( = ?auto_24258 ?auto_24242 ) ) ( HOIST-AT ?auto_24270 ?auto_24258 ) ( AVAILABLE ?auto_24270 ) ( SURFACE-AT ?auto_24232 ?auto_24258 ) ( ON ?auto_24232 ?auto_24250 ) ( CLEAR ?auto_24232 ) ( not ( = ?auto_24231 ?auto_24232 ) ) ( not ( = ?auto_24231 ?auto_24250 ) ) ( not ( = ?auto_24232 ?auto_24250 ) ) ( not ( = ?auto_24243 ?auto_24270 ) ) ( IS-CRATE ?auto_24231 ) ( not ( = ?auto_24264 ?auto_24242 ) ) ( HOIST-AT ?auto_24268 ?auto_24264 ) ( AVAILABLE ?auto_24268 ) ( SURFACE-AT ?auto_24231 ?auto_24264 ) ( ON ?auto_24231 ?auto_24275 ) ( CLEAR ?auto_24231 ) ( not ( = ?auto_24230 ?auto_24231 ) ) ( not ( = ?auto_24230 ?auto_24275 ) ) ( not ( = ?auto_24231 ?auto_24275 ) ) ( not ( = ?auto_24243 ?auto_24268 ) ) ( IS-CRATE ?auto_24230 ) ( AVAILABLE ?auto_24276 ) ( SURFACE-AT ?auto_24230 ?auto_24274 ) ( ON ?auto_24230 ?auto_24266 ) ( CLEAR ?auto_24230 ) ( not ( = ?auto_24229 ?auto_24230 ) ) ( not ( = ?auto_24229 ?auto_24266 ) ) ( not ( = ?auto_24230 ?auto_24266 ) ) ( SURFACE-AT ?auto_24228 ?auto_24242 ) ( CLEAR ?auto_24228 ) ( IS-CRATE ?auto_24229 ) ( AVAILABLE ?auto_24243 ) ( not ( = ?auto_24251 ?auto_24242 ) ) ( HOIST-AT ?auto_24249 ?auto_24251 ) ( AVAILABLE ?auto_24249 ) ( SURFACE-AT ?auto_24229 ?auto_24251 ) ( ON ?auto_24229 ?auto_24273 ) ( CLEAR ?auto_24229 ) ( TRUCK-AT ?auto_24247 ?auto_24242 ) ( not ( = ?auto_24228 ?auto_24229 ) ) ( not ( = ?auto_24228 ?auto_24273 ) ) ( not ( = ?auto_24229 ?auto_24273 ) ) ( not ( = ?auto_24243 ?auto_24249 ) ) ( not ( = ?auto_24228 ?auto_24230 ) ) ( not ( = ?auto_24228 ?auto_24266 ) ) ( not ( = ?auto_24230 ?auto_24273 ) ) ( not ( = ?auto_24274 ?auto_24251 ) ) ( not ( = ?auto_24276 ?auto_24249 ) ) ( not ( = ?auto_24266 ?auto_24273 ) ) ( not ( = ?auto_24228 ?auto_24231 ) ) ( not ( = ?auto_24228 ?auto_24275 ) ) ( not ( = ?auto_24229 ?auto_24231 ) ) ( not ( = ?auto_24229 ?auto_24275 ) ) ( not ( = ?auto_24231 ?auto_24266 ) ) ( not ( = ?auto_24231 ?auto_24273 ) ) ( not ( = ?auto_24264 ?auto_24274 ) ) ( not ( = ?auto_24264 ?auto_24251 ) ) ( not ( = ?auto_24268 ?auto_24276 ) ) ( not ( = ?auto_24268 ?auto_24249 ) ) ( not ( = ?auto_24275 ?auto_24266 ) ) ( not ( = ?auto_24275 ?auto_24273 ) ) ( not ( = ?auto_24228 ?auto_24232 ) ) ( not ( = ?auto_24228 ?auto_24250 ) ) ( not ( = ?auto_24229 ?auto_24232 ) ) ( not ( = ?auto_24229 ?auto_24250 ) ) ( not ( = ?auto_24230 ?auto_24232 ) ) ( not ( = ?auto_24230 ?auto_24250 ) ) ( not ( = ?auto_24232 ?auto_24275 ) ) ( not ( = ?auto_24232 ?auto_24266 ) ) ( not ( = ?auto_24232 ?auto_24273 ) ) ( not ( = ?auto_24258 ?auto_24264 ) ) ( not ( = ?auto_24258 ?auto_24274 ) ) ( not ( = ?auto_24258 ?auto_24251 ) ) ( not ( = ?auto_24270 ?auto_24268 ) ) ( not ( = ?auto_24270 ?auto_24276 ) ) ( not ( = ?auto_24270 ?auto_24249 ) ) ( not ( = ?auto_24250 ?auto_24275 ) ) ( not ( = ?auto_24250 ?auto_24266 ) ) ( not ( = ?auto_24250 ?auto_24273 ) ) ( not ( = ?auto_24228 ?auto_24233 ) ) ( not ( = ?auto_24228 ?auto_24256 ) ) ( not ( = ?auto_24229 ?auto_24233 ) ) ( not ( = ?auto_24229 ?auto_24256 ) ) ( not ( = ?auto_24230 ?auto_24233 ) ) ( not ( = ?auto_24230 ?auto_24256 ) ) ( not ( = ?auto_24231 ?auto_24233 ) ) ( not ( = ?auto_24231 ?auto_24256 ) ) ( not ( = ?auto_24233 ?auto_24250 ) ) ( not ( = ?auto_24233 ?auto_24275 ) ) ( not ( = ?auto_24233 ?auto_24266 ) ) ( not ( = ?auto_24233 ?auto_24273 ) ) ( not ( = ?auto_24262 ?auto_24258 ) ) ( not ( = ?auto_24262 ?auto_24264 ) ) ( not ( = ?auto_24262 ?auto_24274 ) ) ( not ( = ?auto_24262 ?auto_24251 ) ) ( not ( = ?auto_24265 ?auto_24270 ) ) ( not ( = ?auto_24265 ?auto_24268 ) ) ( not ( = ?auto_24265 ?auto_24276 ) ) ( not ( = ?auto_24265 ?auto_24249 ) ) ( not ( = ?auto_24256 ?auto_24250 ) ) ( not ( = ?auto_24256 ?auto_24275 ) ) ( not ( = ?auto_24256 ?auto_24266 ) ) ( not ( = ?auto_24256 ?auto_24273 ) ) ( not ( = ?auto_24228 ?auto_24234 ) ) ( not ( = ?auto_24228 ?auto_24261 ) ) ( not ( = ?auto_24229 ?auto_24234 ) ) ( not ( = ?auto_24229 ?auto_24261 ) ) ( not ( = ?auto_24230 ?auto_24234 ) ) ( not ( = ?auto_24230 ?auto_24261 ) ) ( not ( = ?auto_24231 ?auto_24234 ) ) ( not ( = ?auto_24231 ?auto_24261 ) ) ( not ( = ?auto_24232 ?auto_24234 ) ) ( not ( = ?auto_24232 ?auto_24261 ) ) ( not ( = ?auto_24234 ?auto_24256 ) ) ( not ( = ?auto_24234 ?auto_24250 ) ) ( not ( = ?auto_24234 ?auto_24275 ) ) ( not ( = ?auto_24234 ?auto_24266 ) ) ( not ( = ?auto_24234 ?auto_24273 ) ) ( not ( = ?auto_24261 ?auto_24256 ) ) ( not ( = ?auto_24261 ?auto_24250 ) ) ( not ( = ?auto_24261 ?auto_24275 ) ) ( not ( = ?auto_24261 ?auto_24266 ) ) ( not ( = ?auto_24261 ?auto_24273 ) ) ( not ( = ?auto_24228 ?auto_24237 ) ) ( not ( = ?auto_24228 ?auto_24260 ) ) ( not ( = ?auto_24229 ?auto_24237 ) ) ( not ( = ?auto_24229 ?auto_24260 ) ) ( not ( = ?auto_24230 ?auto_24237 ) ) ( not ( = ?auto_24230 ?auto_24260 ) ) ( not ( = ?auto_24231 ?auto_24237 ) ) ( not ( = ?auto_24231 ?auto_24260 ) ) ( not ( = ?auto_24232 ?auto_24237 ) ) ( not ( = ?auto_24232 ?auto_24260 ) ) ( not ( = ?auto_24233 ?auto_24237 ) ) ( not ( = ?auto_24233 ?auto_24260 ) ) ( not ( = ?auto_24237 ?auto_24261 ) ) ( not ( = ?auto_24237 ?auto_24256 ) ) ( not ( = ?auto_24237 ?auto_24250 ) ) ( not ( = ?auto_24237 ?auto_24275 ) ) ( not ( = ?auto_24237 ?auto_24266 ) ) ( not ( = ?auto_24237 ?auto_24273 ) ) ( not ( = ?auto_24277 ?auto_24274 ) ) ( not ( = ?auto_24277 ?auto_24262 ) ) ( not ( = ?auto_24277 ?auto_24258 ) ) ( not ( = ?auto_24277 ?auto_24264 ) ) ( not ( = ?auto_24277 ?auto_24251 ) ) ( not ( = ?auto_24269 ?auto_24276 ) ) ( not ( = ?auto_24269 ?auto_24265 ) ) ( not ( = ?auto_24269 ?auto_24270 ) ) ( not ( = ?auto_24269 ?auto_24268 ) ) ( not ( = ?auto_24269 ?auto_24249 ) ) ( not ( = ?auto_24260 ?auto_24261 ) ) ( not ( = ?auto_24260 ?auto_24256 ) ) ( not ( = ?auto_24260 ?auto_24250 ) ) ( not ( = ?auto_24260 ?auto_24275 ) ) ( not ( = ?auto_24260 ?auto_24266 ) ) ( not ( = ?auto_24260 ?auto_24273 ) ) ( not ( = ?auto_24228 ?auto_24236 ) ) ( not ( = ?auto_24228 ?auto_24248 ) ) ( not ( = ?auto_24229 ?auto_24236 ) ) ( not ( = ?auto_24229 ?auto_24248 ) ) ( not ( = ?auto_24230 ?auto_24236 ) ) ( not ( = ?auto_24230 ?auto_24248 ) ) ( not ( = ?auto_24231 ?auto_24236 ) ) ( not ( = ?auto_24231 ?auto_24248 ) ) ( not ( = ?auto_24232 ?auto_24236 ) ) ( not ( = ?auto_24232 ?auto_24248 ) ) ( not ( = ?auto_24233 ?auto_24236 ) ) ( not ( = ?auto_24233 ?auto_24248 ) ) ( not ( = ?auto_24234 ?auto_24236 ) ) ( not ( = ?auto_24234 ?auto_24248 ) ) ( not ( = ?auto_24236 ?auto_24260 ) ) ( not ( = ?auto_24236 ?auto_24261 ) ) ( not ( = ?auto_24236 ?auto_24256 ) ) ( not ( = ?auto_24236 ?auto_24250 ) ) ( not ( = ?auto_24236 ?auto_24275 ) ) ( not ( = ?auto_24236 ?auto_24266 ) ) ( not ( = ?auto_24236 ?auto_24273 ) ) ( not ( = ?auto_24263 ?auto_24277 ) ) ( not ( = ?auto_24263 ?auto_24274 ) ) ( not ( = ?auto_24263 ?auto_24262 ) ) ( not ( = ?auto_24263 ?auto_24258 ) ) ( not ( = ?auto_24263 ?auto_24264 ) ) ( not ( = ?auto_24263 ?auto_24251 ) ) ( not ( = ?auto_24253 ?auto_24269 ) ) ( not ( = ?auto_24253 ?auto_24276 ) ) ( not ( = ?auto_24253 ?auto_24265 ) ) ( not ( = ?auto_24253 ?auto_24270 ) ) ( not ( = ?auto_24253 ?auto_24268 ) ) ( not ( = ?auto_24253 ?auto_24249 ) ) ( not ( = ?auto_24248 ?auto_24260 ) ) ( not ( = ?auto_24248 ?auto_24261 ) ) ( not ( = ?auto_24248 ?auto_24256 ) ) ( not ( = ?auto_24248 ?auto_24250 ) ) ( not ( = ?auto_24248 ?auto_24275 ) ) ( not ( = ?auto_24248 ?auto_24266 ) ) ( not ( = ?auto_24248 ?auto_24273 ) ) ( not ( = ?auto_24228 ?auto_24235 ) ) ( not ( = ?auto_24228 ?auto_24252 ) ) ( not ( = ?auto_24229 ?auto_24235 ) ) ( not ( = ?auto_24229 ?auto_24252 ) ) ( not ( = ?auto_24230 ?auto_24235 ) ) ( not ( = ?auto_24230 ?auto_24252 ) ) ( not ( = ?auto_24231 ?auto_24235 ) ) ( not ( = ?auto_24231 ?auto_24252 ) ) ( not ( = ?auto_24232 ?auto_24235 ) ) ( not ( = ?auto_24232 ?auto_24252 ) ) ( not ( = ?auto_24233 ?auto_24235 ) ) ( not ( = ?auto_24233 ?auto_24252 ) ) ( not ( = ?auto_24234 ?auto_24235 ) ) ( not ( = ?auto_24234 ?auto_24252 ) ) ( not ( = ?auto_24237 ?auto_24235 ) ) ( not ( = ?auto_24237 ?auto_24252 ) ) ( not ( = ?auto_24235 ?auto_24248 ) ) ( not ( = ?auto_24235 ?auto_24260 ) ) ( not ( = ?auto_24235 ?auto_24261 ) ) ( not ( = ?auto_24235 ?auto_24256 ) ) ( not ( = ?auto_24235 ?auto_24250 ) ) ( not ( = ?auto_24235 ?auto_24275 ) ) ( not ( = ?auto_24235 ?auto_24266 ) ) ( not ( = ?auto_24235 ?auto_24273 ) ) ( not ( = ?auto_24267 ?auto_24263 ) ) ( not ( = ?auto_24267 ?auto_24277 ) ) ( not ( = ?auto_24267 ?auto_24274 ) ) ( not ( = ?auto_24267 ?auto_24262 ) ) ( not ( = ?auto_24267 ?auto_24258 ) ) ( not ( = ?auto_24267 ?auto_24264 ) ) ( not ( = ?auto_24267 ?auto_24251 ) ) ( not ( = ?auto_24259 ?auto_24253 ) ) ( not ( = ?auto_24259 ?auto_24269 ) ) ( not ( = ?auto_24259 ?auto_24276 ) ) ( not ( = ?auto_24259 ?auto_24265 ) ) ( not ( = ?auto_24259 ?auto_24270 ) ) ( not ( = ?auto_24259 ?auto_24268 ) ) ( not ( = ?auto_24259 ?auto_24249 ) ) ( not ( = ?auto_24252 ?auto_24248 ) ) ( not ( = ?auto_24252 ?auto_24260 ) ) ( not ( = ?auto_24252 ?auto_24261 ) ) ( not ( = ?auto_24252 ?auto_24256 ) ) ( not ( = ?auto_24252 ?auto_24250 ) ) ( not ( = ?auto_24252 ?auto_24275 ) ) ( not ( = ?auto_24252 ?auto_24266 ) ) ( not ( = ?auto_24252 ?auto_24273 ) ) ( not ( = ?auto_24228 ?auto_24238 ) ) ( not ( = ?auto_24228 ?auto_24255 ) ) ( not ( = ?auto_24229 ?auto_24238 ) ) ( not ( = ?auto_24229 ?auto_24255 ) ) ( not ( = ?auto_24230 ?auto_24238 ) ) ( not ( = ?auto_24230 ?auto_24255 ) ) ( not ( = ?auto_24231 ?auto_24238 ) ) ( not ( = ?auto_24231 ?auto_24255 ) ) ( not ( = ?auto_24232 ?auto_24238 ) ) ( not ( = ?auto_24232 ?auto_24255 ) ) ( not ( = ?auto_24233 ?auto_24238 ) ) ( not ( = ?auto_24233 ?auto_24255 ) ) ( not ( = ?auto_24234 ?auto_24238 ) ) ( not ( = ?auto_24234 ?auto_24255 ) ) ( not ( = ?auto_24237 ?auto_24238 ) ) ( not ( = ?auto_24237 ?auto_24255 ) ) ( not ( = ?auto_24236 ?auto_24238 ) ) ( not ( = ?auto_24236 ?auto_24255 ) ) ( not ( = ?auto_24238 ?auto_24252 ) ) ( not ( = ?auto_24238 ?auto_24248 ) ) ( not ( = ?auto_24238 ?auto_24260 ) ) ( not ( = ?auto_24238 ?auto_24261 ) ) ( not ( = ?auto_24238 ?auto_24256 ) ) ( not ( = ?auto_24238 ?auto_24250 ) ) ( not ( = ?auto_24238 ?auto_24275 ) ) ( not ( = ?auto_24238 ?auto_24266 ) ) ( not ( = ?auto_24238 ?auto_24273 ) ) ( not ( = ?auto_24257 ?auto_24267 ) ) ( not ( = ?auto_24257 ?auto_24263 ) ) ( not ( = ?auto_24257 ?auto_24277 ) ) ( not ( = ?auto_24257 ?auto_24274 ) ) ( not ( = ?auto_24257 ?auto_24262 ) ) ( not ( = ?auto_24257 ?auto_24258 ) ) ( not ( = ?auto_24257 ?auto_24264 ) ) ( not ( = ?auto_24257 ?auto_24251 ) ) ( not ( = ?auto_24272 ?auto_24259 ) ) ( not ( = ?auto_24272 ?auto_24253 ) ) ( not ( = ?auto_24272 ?auto_24269 ) ) ( not ( = ?auto_24272 ?auto_24276 ) ) ( not ( = ?auto_24272 ?auto_24265 ) ) ( not ( = ?auto_24272 ?auto_24270 ) ) ( not ( = ?auto_24272 ?auto_24268 ) ) ( not ( = ?auto_24272 ?auto_24249 ) ) ( not ( = ?auto_24255 ?auto_24252 ) ) ( not ( = ?auto_24255 ?auto_24248 ) ) ( not ( = ?auto_24255 ?auto_24260 ) ) ( not ( = ?auto_24255 ?auto_24261 ) ) ( not ( = ?auto_24255 ?auto_24256 ) ) ( not ( = ?auto_24255 ?auto_24250 ) ) ( not ( = ?auto_24255 ?auto_24275 ) ) ( not ( = ?auto_24255 ?auto_24266 ) ) ( not ( = ?auto_24255 ?auto_24273 ) ) ( not ( = ?auto_24228 ?auto_24239 ) ) ( not ( = ?auto_24228 ?auto_24271 ) ) ( not ( = ?auto_24229 ?auto_24239 ) ) ( not ( = ?auto_24229 ?auto_24271 ) ) ( not ( = ?auto_24230 ?auto_24239 ) ) ( not ( = ?auto_24230 ?auto_24271 ) ) ( not ( = ?auto_24231 ?auto_24239 ) ) ( not ( = ?auto_24231 ?auto_24271 ) ) ( not ( = ?auto_24232 ?auto_24239 ) ) ( not ( = ?auto_24232 ?auto_24271 ) ) ( not ( = ?auto_24233 ?auto_24239 ) ) ( not ( = ?auto_24233 ?auto_24271 ) ) ( not ( = ?auto_24234 ?auto_24239 ) ) ( not ( = ?auto_24234 ?auto_24271 ) ) ( not ( = ?auto_24237 ?auto_24239 ) ) ( not ( = ?auto_24237 ?auto_24271 ) ) ( not ( = ?auto_24236 ?auto_24239 ) ) ( not ( = ?auto_24236 ?auto_24271 ) ) ( not ( = ?auto_24235 ?auto_24239 ) ) ( not ( = ?auto_24235 ?auto_24271 ) ) ( not ( = ?auto_24239 ?auto_24255 ) ) ( not ( = ?auto_24239 ?auto_24252 ) ) ( not ( = ?auto_24239 ?auto_24248 ) ) ( not ( = ?auto_24239 ?auto_24260 ) ) ( not ( = ?auto_24239 ?auto_24261 ) ) ( not ( = ?auto_24239 ?auto_24256 ) ) ( not ( = ?auto_24239 ?auto_24250 ) ) ( not ( = ?auto_24239 ?auto_24275 ) ) ( not ( = ?auto_24239 ?auto_24266 ) ) ( not ( = ?auto_24239 ?auto_24273 ) ) ( not ( = ?auto_24271 ?auto_24255 ) ) ( not ( = ?auto_24271 ?auto_24252 ) ) ( not ( = ?auto_24271 ?auto_24248 ) ) ( not ( = ?auto_24271 ?auto_24260 ) ) ( not ( = ?auto_24271 ?auto_24261 ) ) ( not ( = ?auto_24271 ?auto_24256 ) ) ( not ( = ?auto_24271 ?auto_24250 ) ) ( not ( = ?auto_24271 ?auto_24275 ) ) ( not ( = ?auto_24271 ?auto_24266 ) ) ( not ( = ?auto_24271 ?auto_24273 ) ) ( not ( = ?auto_24228 ?auto_24240 ) ) ( not ( = ?auto_24228 ?auto_24254 ) ) ( not ( = ?auto_24229 ?auto_24240 ) ) ( not ( = ?auto_24229 ?auto_24254 ) ) ( not ( = ?auto_24230 ?auto_24240 ) ) ( not ( = ?auto_24230 ?auto_24254 ) ) ( not ( = ?auto_24231 ?auto_24240 ) ) ( not ( = ?auto_24231 ?auto_24254 ) ) ( not ( = ?auto_24232 ?auto_24240 ) ) ( not ( = ?auto_24232 ?auto_24254 ) ) ( not ( = ?auto_24233 ?auto_24240 ) ) ( not ( = ?auto_24233 ?auto_24254 ) ) ( not ( = ?auto_24234 ?auto_24240 ) ) ( not ( = ?auto_24234 ?auto_24254 ) ) ( not ( = ?auto_24237 ?auto_24240 ) ) ( not ( = ?auto_24237 ?auto_24254 ) ) ( not ( = ?auto_24236 ?auto_24240 ) ) ( not ( = ?auto_24236 ?auto_24254 ) ) ( not ( = ?auto_24235 ?auto_24240 ) ) ( not ( = ?auto_24235 ?auto_24254 ) ) ( not ( = ?auto_24238 ?auto_24240 ) ) ( not ( = ?auto_24238 ?auto_24254 ) ) ( not ( = ?auto_24240 ?auto_24271 ) ) ( not ( = ?auto_24240 ?auto_24255 ) ) ( not ( = ?auto_24240 ?auto_24252 ) ) ( not ( = ?auto_24240 ?auto_24248 ) ) ( not ( = ?auto_24240 ?auto_24260 ) ) ( not ( = ?auto_24240 ?auto_24261 ) ) ( not ( = ?auto_24240 ?auto_24256 ) ) ( not ( = ?auto_24240 ?auto_24250 ) ) ( not ( = ?auto_24240 ?auto_24275 ) ) ( not ( = ?auto_24240 ?auto_24266 ) ) ( not ( = ?auto_24240 ?auto_24273 ) ) ( not ( = ?auto_24254 ?auto_24271 ) ) ( not ( = ?auto_24254 ?auto_24255 ) ) ( not ( = ?auto_24254 ?auto_24252 ) ) ( not ( = ?auto_24254 ?auto_24248 ) ) ( not ( = ?auto_24254 ?auto_24260 ) ) ( not ( = ?auto_24254 ?auto_24261 ) ) ( not ( = ?auto_24254 ?auto_24256 ) ) ( not ( = ?auto_24254 ?auto_24250 ) ) ( not ( = ?auto_24254 ?auto_24275 ) ) ( not ( = ?auto_24254 ?auto_24266 ) ) ( not ( = ?auto_24254 ?auto_24273 ) ) ( not ( = ?auto_24228 ?auto_24241 ) ) ( not ( = ?auto_24228 ?auto_24244 ) ) ( not ( = ?auto_24229 ?auto_24241 ) ) ( not ( = ?auto_24229 ?auto_24244 ) ) ( not ( = ?auto_24230 ?auto_24241 ) ) ( not ( = ?auto_24230 ?auto_24244 ) ) ( not ( = ?auto_24231 ?auto_24241 ) ) ( not ( = ?auto_24231 ?auto_24244 ) ) ( not ( = ?auto_24232 ?auto_24241 ) ) ( not ( = ?auto_24232 ?auto_24244 ) ) ( not ( = ?auto_24233 ?auto_24241 ) ) ( not ( = ?auto_24233 ?auto_24244 ) ) ( not ( = ?auto_24234 ?auto_24241 ) ) ( not ( = ?auto_24234 ?auto_24244 ) ) ( not ( = ?auto_24237 ?auto_24241 ) ) ( not ( = ?auto_24237 ?auto_24244 ) ) ( not ( = ?auto_24236 ?auto_24241 ) ) ( not ( = ?auto_24236 ?auto_24244 ) ) ( not ( = ?auto_24235 ?auto_24241 ) ) ( not ( = ?auto_24235 ?auto_24244 ) ) ( not ( = ?auto_24238 ?auto_24241 ) ) ( not ( = ?auto_24238 ?auto_24244 ) ) ( not ( = ?auto_24239 ?auto_24241 ) ) ( not ( = ?auto_24239 ?auto_24244 ) ) ( not ( = ?auto_24241 ?auto_24254 ) ) ( not ( = ?auto_24241 ?auto_24271 ) ) ( not ( = ?auto_24241 ?auto_24255 ) ) ( not ( = ?auto_24241 ?auto_24252 ) ) ( not ( = ?auto_24241 ?auto_24248 ) ) ( not ( = ?auto_24241 ?auto_24260 ) ) ( not ( = ?auto_24241 ?auto_24261 ) ) ( not ( = ?auto_24241 ?auto_24256 ) ) ( not ( = ?auto_24241 ?auto_24250 ) ) ( not ( = ?auto_24241 ?auto_24275 ) ) ( not ( = ?auto_24241 ?auto_24266 ) ) ( not ( = ?auto_24241 ?auto_24273 ) ) ( not ( = ?auto_24246 ?auto_24262 ) ) ( not ( = ?auto_24246 ?auto_24257 ) ) ( not ( = ?auto_24246 ?auto_24267 ) ) ( not ( = ?auto_24246 ?auto_24263 ) ) ( not ( = ?auto_24246 ?auto_24277 ) ) ( not ( = ?auto_24246 ?auto_24274 ) ) ( not ( = ?auto_24246 ?auto_24258 ) ) ( not ( = ?auto_24246 ?auto_24264 ) ) ( not ( = ?auto_24246 ?auto_24251 ) ) ( not ( = ?auto_24245 ?auto_24265 ) ) ( not ( = ?auto_24245 ?auto_24272 ) ) ( not ( = ?auto_24245 ?auto_24259 ) ) ( not ( = ?auto_24245 ?auto_24253 ) ) ( not ( = ?auto_24245 ?auto_24269 ) ) ( not ( = ?auto_24245 ?auto_24276 ) ) ( not ( = ?auto_24245 ?auto_24270 ) ) ( not ( = ?auto_24245 ?auto_24268 ) ) ( not ( = ?auto_24245 ?auto_24249 ) ) ( not ( = ?auto_24244 ?auto_24254 ) ) ( not ( = ?auto_24244 ?auto_24271 ) ) ( not ( = ?auto_24244 ?auto_24255 ) ) ( not ( = ?auto_24244 ?auto_24252 ) ) ( not ( = ?auto_24244 ?auto_24248 ) ) ( not ( = ?auto_24244 ?auto_24260 ) ) ( not ( = ?auto_24244 ?auto_24261 ) ) ( not ( = ?auto_24244 ?auto_24256 ) ) ( not ( = ?auto_24244 ?auto_24250 ) ) ( not ( = ?auto_24244 ?auto_24275 ) ) ( not ( = ?auto_24244 ?auto_24266 ) ) ( not ( = ?auto_24244 ?auto_24273 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_24228 ?auto_24229 ?auto_24230 ?auto_24231 ?auto_24232 ?auto_24233 ?auto_24234 ?auto_24237 ?auto_24236 ?auto_24235 ?auto_24238 ?auto_24239 ?auto_24240 )
      ( MAKE-1CRATE ?auto_24240 ?auto_24241 )
      ( MAKE-13CRATE-VERIFY ?auto_24228 ?auto_24229 ?auto_24230 ?auto_24231 ?auto_24232 ?auto_24233 ?auto_24234 ?auto_24237 ?auto_24236 ?auto_24235 ?auto_24238 ?auto_24239 ?auto_24240 ?auto_24241 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24280 - SURFACE
      ?auto_24281 - SURFACE
    )
    :vars
    (
      ?auto_24282 - HOIST
      ?auto_24283 - PLACE
      ?auto_24285 - PLACE
      ?auto_24286 - HOIST
      ?auto_24287 - SURFACE
      ?auto_24284 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24282 ?auto_24283 ) ( SURFACE-AT ?auto_24280 ?auto_24283 ) ( CLEAR ?auto_24280 ) ( IS-CRATE ?auto_24281 ) ( AVAILABLE ?auto_24282 ) ( not ( = ?auto_24285 ?auto_24283 ) ) ( HOIST-AT ?auto_24286 ?auto_24285 ) ( AVAILABLE ?auto_24286 ) ( SURFACE-AT ?auto_24281 ?auto_24285 ) ( ON ?auto_24281 ?auto_24287 ) ( CLEAR ?auto_24281 ) ( TRUCK-AT ?auto_24284 ?auto_24283 ) ( not ( = ?auto_24280 ?auto_24281 ) ) ( not ( = ?auto_24280 ?auto_24287 ) ) ( not ( = ?auto_24281 ?auto_24287 ) ) ( not ( = ?auto_24282 ?auto_24286 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24284 ?auto_24283 ?auto_24285 )
      ( !LIFT ?auto_24286 ?auto_24281 ?auto_24287 ?auto_24285 )
      ( !LOAD ?auto_24286 ?auto_24281 ?auto_24284 ?auto_24285 )
      ( !DRIVE ?auto_24284 ?auto_24285 ?auto_24283 )
      ( !UNLOAD ?auto_24282 ?auto_24281 ?auto_24284 ?auto_24283 )
      ( !DROP ?auto_24282 ?auto_24281 ?auto_24280 ?auto_24283 )
      ( MAKE-1CRATE-VERIFY ?auto_24280 ?auto_24281 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_24303 - SURFACE
      ?auto_24304 - SURFACE
      ?auto_24305 - SURFACE
      ?auto_24306 - SURFACE
      ?auto_24307 - SURFACE
      ?auto_24308 - SURFACE
      ?auto_24309 - SURFACE
      ?auto_24312 - SURFACE
      ?auto_24311 - SURFACE
      ?auto_24310 - SURFACE
      ?auto_24313 - SURFACE
      ?auto_24314 - SURFACE
      ?auto_24315 - SURFACE
      ?auto_24316 - SURFACE
      ?auto_24317 - SURFACE
    )
    :vars
    (
      ?auto_24320 - HOIST
      ?auto_24321 - PLACE
      ?auto_24323 - PLACE
      ?auto_24319 - HOIST
      ?auto_24322 - SURFACE
      ?auto_24348 - PLACE
      ?auto_24336 - HOIST
      ?auto_24346 - SURFACE
      ?auto_24351 - PLACE
      ?auto_24343 - HOIST
      ?auto_24334 - SURFACE
      ?auto_24344 - SURFACE
      ?auto_24349 - PLACE
      ?auto_24331 - HOIST
      ?auto_24340 - SURFACE
      ?auto_24339 - PLACE
      ?auto_24335 - HOIST
      ?auto_24341 - SURFACE
      ?auto_24325 - PLACE
      ?auto_24328 - HOIST
      ?auto_24338 - SURFACE
      ?auto_24345 - PLACE
      ?auto_24353 - HOIST
      ?auto_24324 - SURFACE
      ?auto_24332 - SURFACE
      ?auto_24327 - SURFACE
      ?auto_24326 - PLACE
      ?auto_24347 - HOIST
      ?auto_24350 - SURFACE
      ?auto_24354 - PLACE
      ?auto_24330 - HOIST
      ?auto_24352 - SURFACE
      ?auto_24337 - SURFACE
      ?auto_24342 - PLACE
      ?auto_24329 - HOIST
      ?auto_24333 - SURFACE
      ?auto_24318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24320 ?auto_24321 ) ( IS-CRATE ?auto_24317 ) ( not ( = ?auto_24323 ?auto_24321 ) ) ( HOIST-AT ?auto_24319 ?auto_24323 ) ( SURFACE-AT ?auto_24317 ?auto_24323 ) ( ON ?auto_24317 ?auto_24322 ) ( CLEAR ?auto_24317 ) ( not ( = ?auto_24316 ?auto_24317 ) ) ( not ( = ?auto_24316 ?auto_24322 ) ) ( not ( = ?auto_24317 ?auto_24322 ) ) ( not ( = ?auto_24320 ?auto_24319 ) ) ( IS-CRATE ?auto_24316 ) ( not ( = ?auto_24348 ?auto_24321 ) ) ( HOIST-AT ?auto_24336 ?auto_24348 ) ( AVAILABLE ?auto_24336 ) ( SURFACE-AT ?auto_24316 ?auto_24348 ) ( ON ?auto_24316 ?auto_24346 ) ( CLEAR ?auto_24316 ) ( not ( = ?auto_24315 ?auto_24316 ) ) ( not ( = ?auto_24315 ?auto_24346 ) ) ( not ( = ?auto_24316 ?auto_24346 ) ) ( not ( = ?auto_24320 ?auto_24336 ) ) ( IS-CRATE ?auto_24315 ) ( not ( = ?auto_24351 ?auto_24321 ) ) ( HOIST-AT ?auto_24343 ?auto_24351 ) ( SURFACE-AT ?auto_24315 ?auto_24351 ) ( ON ?auto_24315 ?auto_24334 ) ( CLEAR ?auto_24315 ) ( not ( = ?auto_24314 ?auto_24315 ) ) ( not ( = ?auto_24314 ?auto_24334 ) ) ( not ( = ?auto_24315 ?auto_24334 ) ) ( not ( = ?auto_24320 ?auto_24343 ) ) ( IS-CRATE ?auto_24314 ) ( SURFACE-AT ?auto_24314 ?auto_24351 ) ( ON ?auto_24314 ?auto_24344 ) ( CLEAR ?auto_24314 ) ( not ( = ?auto_24313 ?auto_24314 ) ) ( not ( = ?auto_24313 ?auto_24344 ) ) ( not ( = ?auto_24314 ?auto_24344 ) ) ( IS-CRATE ?auto_24313 ) ( not ( = ?auto_24349 ?auto_24321 ) ) ( HOIST-AT ?auto_24331 ?auto_24349 ) ( AVAILABLE ?auto_24331 ) ( SURFACE-AT ?auto_24313 ?auto_24349 ) ( ON ?auto_24313 ?auto_24340 ) ( CLEAR ?auto_24313 ) ( not ( = ?auto_24310 ?auto_24313 ) ) ( not ( = ?auto_24310 ?auto_24340 ) ) ( not ( = ?auto_24313 ?auto_24340 ) ) ( not ( = ?auto_24320 ?auto_24331 ) ) ( IS-CRATE ?auto_24310 ) ( not ( = ?auto_24339 ?auto_24321 ) ) ( HOIST-AT ?auto_24335 ?auto_24339 ) ( AVAILABLE ?auto_24335 ) ( SURFACE-AT ?auto_24310 ?auto_24339 ) ( ON ?auto_24310 ?auto_24341 ) ( CLEAR ?auto_24310 ) ( not ( = ?auto_24311 ?auto_24310 ) ) ( not ( = ?auto_24311 ?auto_24341 ) ) ( not ( = ?auto_24310 ?auto_24341 ) ) ( not ( = ?auto_24320 ?auto_24335 ) ) ( IS-CRATE ?auto_24311 ) ( not ( = ?auto_24325 ?auto_24321 ) ) ( HOIST-AT ?auto_24328 ?auto_24325 ) ( AVAILABLE ?auto_24328 ) ( SURFACE-AT ?auto_24311 ?auto_24325 ) ( ON ?auto_24311 ?auto_24338 ) ( CLEAR ?auto_24311 ) ( not ( = ?auto_24312 ?auto_24311 ) ) ( not ( = ?auto_24312 ?auto_24338 ) ) ( not ( = ?auto_24311 ?auto_24338 ) ) ( not ( = ?auto_24320 ?auto_24328 ) ) ( IS-CRATE ?auto_24312 ) ( not ( = ?auto_24345 ?auto_24321 ) ) ( HOIST-AT ?auto_24353 ?auto_24345 ) ( AVAILABLE ?auto_24353 ) ( SURFACE-AT ?auto_24312 ?auto_24345 ) ( ON ?auto_24312 ?auto_24324 ) ( CLEAR ?auto_24312 ) ( not ( = ?auto_24309 ?auto_24312 ) ) ( not ( = ?auto_24309 ?auto_24324 ) ) ( not ( = ?auto_24312 ?auto_24324 ) ) ( not ( = ?auto_24320 ?auto_24353 ) ) ( IS-CRATE ?auto_24309 ) ( SURFACE-AT ?auto_24309 ?auto_24323 ) ( ON ?auto_24309 ?auto_24332 ) ( CLEAR ?auto_24309 ) ( not ( = ?auto_24308 ?auto_24309 ) ) ( not ( = ?auto_24308 ?auto_24332 ) ) ( not ( = ?auto_24309 ?auto_24332 ) ) ( IS-CRATE ?auto_24308 ) ( AVAILABLE ?auto_24343 ) ( SURFACE-AT ?auto_24308 ?auto_24351 ) ( ON ?auto_24308 ?auto_24327 ) ( CLEAR ?auto_24308 ) ( not ( = ?auto_24307 ?auto_24308 ) ) ( not ( = ?auto_24307 ?auto_24327 ) ) ( not ( = ?auto_24308 ?auto_24327 ) ) ( IS-CRATE ?auto_24307 ) ( not ( = ?auto_24326 ?auto_24321 ) ) ( HOIST-AT ?auto_24347 ?auto_24326 ) ( AVAILABLE ?auto_24347 ) ( SURFACE-AT ?auto_24307 ?auto_24326 ) ( ON ?auto_24307 ?auto_24350 ) ( CLEAR ?auto_24307 ) ( not ( = ?auto_24306 ?auto_24307 ) ) ( not ( = ?auto_24306 ?auto_24350 ) ) ( not ( = ?auto_24307 ?auto_24350 ) ) ( not ( = ?auto_24320 ?auto_24347 ) ) ( IS-CRATE ?auto_24306 ) ( not ( = ?auto_24354 ?auto_24321 ) ) ( HOIST-AT ?auto_24330 ?auto_24354 ) ( AVAILABLE ?auto_24330 ) ( SURFACE-AT ?auto_24306 ?auto_24354 ) ( ON ?auto_24306 ?auto_24352 ) ( CLEAR ?auto_24306 ) ( not ( = ?auto_24305 ?auto_24306 ) ) ( not ( = ?auto_24305 ?auto_24352 ) ) ( not ( = ?auto_24306 ?auto_24352 ) ) ( not ( = ?auto_24320 ?auto_24330 ) ) ( IS-CRATE ?auto_24305 ) ( AVAILABLE ?auto_24319 ) ( SURFACE-AT ?auto_24305 ?auto_24323 ) ( ON ?auto_24305 ?auto_24337 ) ( CLEAR ?auto_24305 ) ( not ( = ?auto_24304 ?auto_24305 ) ) ( not ( = ?auto_24304 ?auto_24337 ) ) ( not ( = ?auto_24305 ?auto_24337 ) ) ( SURFACE-AT ?auto_24303 ?auto_24321 ) ( CLEAR ?auto_24303 ) ( IS-CRATE ?auto_24304 ) ( AVAILABLE ?auto_24320 ) ( not ( = ?auto_24342 ?auto_24321 ) ) ( HOIST-AT ?auto_24329 ?auto_24342 ) ( AVAILABLE ?auto_24329 ) ( SURFACE-AT ?auto_24304 ?auto_24342 ) ( ON ?auto_24304 ?auto_24333 ) ( CLEAR ?auto_24304 ) ( TRUCK-AT ?auto_24318 ?auto_24321 ) ( not ( = ?auto_24303 ?auto_24304 ) ) ( not ( = ?auto_24303 ?auto_24333 ) ) ( not ( = ?auto_24304 ?auto_24333 ) ) ( not ( = ?auto_24320 ?auto_24329 ) ) ( not ( = ?auto_24303 ?auto_24305 ) ) ( not ( = ?auto_24303 ?auto_24337 ) ) ( not ( = ?auto_24305 ?auto_24333 ) ) ( not ( = ?auto_24323 ?auto_24342 ) ) ( not ( = ?auto_24319 ?auto_24329 ) ) ( not ( = ?auto_24337 ?auto_24333 ) ) ( not ( = ?auto_24303 ?auto_24306 ) ) ( not ( = ?auto_24303 ?auto_24352 ) ) ( not ( = ?auto_24304 ?auto_24306 ) ) ( not ( = ?auto_24304 ?auto_24352 ) ) ( not ( = ?auto_24306 ?auto_24337 ) ) ( not ( = ?auto_24306 ?auto_24333 ) ) ( not ( = ?auto_24354 ?auto_24323 ) ) ( not ( = ?auto_24354 ?auto_24342 ) ) ( not ( = ?auto_24330 ?auto_24319 ) ) ( not ( = ?auto_24330 ?auto_24329 ) ) ( not ( = ?auto_24352 ?auto_24337 ) ) ( not ( = ?auto_24352 ?auto_24333 ) ) ( not ( = ?auto_24303 ?auto_24307 ) ) ( not ( = ?auto_24303 ?auto_24350 ) ) ( not ( = ?auto_24304 ?auto_24307 ) ) ( not ( = ?auto_24304 ?auto_24350 ) ) ( not ( = ?auto_24305 ?auto_24307 ) ) ( not ( = ?auto_24305 ?auto_24350 ) ) ( not ( = ?auto_24307 ?auto_24352 ) ) ( not ( = ?auto_24307 ?auto_24337 ) ) ( not ( = ?auto_24307 ?auto_24333 ) ) ( not ( = ?auto_24326 ?auto_24354 ) ) ( not ( = ?auto_24326 ?auto_24323 ) ) ( not ( = ?auto_24326 ?auto_24342 ) ) ( not ( = ?auto_24347 ?auto_24330 ) ) ( not ( = ?auto_24347 ?auto_24319 ) ) ( not ( = ?auto_24347 ?auto_24329 ) ) ( not ( = ?auto_24350 ?auto_24352 ) ) ( not ( = ?auto_24350 ?auto_24337 ) ) ( not ( = ?auto_24350 ?auto_24333 ) ) ( not ( = ?auto_24303 ?auto_24308 ) ) ( not ( = ?auto_24303 ?auto_24327 ) ) ( not ( = ?auto_24304 ?auto_24308 ) ) ( not ( = ?auto_24304 ?auto_24327 ) ) ( not ( = ?auto_24305 ?auto_24308 ) ) ( not ( = ?auto_24305 ?auto_24327 ) ) ( not ( = ?auto_24306 ?auto_24308 ) ) ( not ( = ?auto_24306 ?auto_24327 ) ) ( not ( = ?auto_24308 ?auto_24350 ) ) ( not ( = ?auto_24308 ?auto_24352 ) ) ( not ( = ?auto_24308 ?auto_24337 ) ) ( not ( = ?auto_24308 ?auto_24333 ) ) ( not ( = ?auto_24351 ?auto_24326 ) ) ( not ( = ?auto_24351 ?auto_24354 ) ) ( not ( = ?auto_24351 ?auto_24323 ) ) ( not ( = ?auto_24351 ?auto_24342 ) ) ( not ( = ?auto_24343 ?auto_24347 ) ) ( not ( = ?auto_24343 ?auto_24330 ) ) ( not ( = ?auto_24343 ?auto_24319 ) ) ( not ( = ?auto_24343 ?auto_24329 ) ) ( not ( = ?auto_24327 ?auto_24350 ) ) ( not ( = ?auto_24327 ?auto_24352 ) ) ( not ( = ?auto_24327 ?auto_24337 ) ) ( not ( = ?auto_24327 ?auto_24333 ) ) ( not ( = ?auto_24303 ?auto_24309 ) ) ( not ( = ?auto_24303 ?auto_24332 ) ) ( not ( = ?auto_24304 ?auto_24309 ) ) ( not ( = ?auto_24304 ?auto_24332 ) ) ( not ( = ?auto_24305 ?auto_24309 ) ) ( not ( = ?auto_24305 ?auto_24332 ) ) ( not ( = ?auto_24306 ?auto_24309 ) ) ( not ( = ?auto_24306 ?auto_24332 ) ) ( not ( = ?auto_24307 ?auto_24309 ) ) ( not ( = ?auto_24307 ?auto_24332 ) ) ( not ( = ?auto_24309 ?auto_24327 ) ) ( not ( = ?auto_24309 ?auto_24350 ) ) ( not ( = ?auto_24309 ?auto_24352 ) ) ( not ( = ?auto_24309 ?auto_24337 ) ) ( not ( = ?auto_24309 ?auto_24333 ) ) ( not ( = ?auto_24332 ?auto_24327 ) ) ( not ( = ?auto_24332 ?auto_24350 ) ) ( not ( = ?auto_24332 ?auto_24352 ) ) ( not ( = ?auto_24332 ?auto_24337 ) ) ( not ( = ?auto_24332 ?auto_24333 ) ) ( not ( = ?auto_24303 ?auto_24312 ) ) ( not ( = ?auto_24303 ?auto_24324 ) ) ( not ( = ?auto_24304 ?auto_24312 ) ) ( not ( = ?auto_24304 ?auto_24324 ) ) ( not ( = ?auto_24305 ?auto_24312 ) ) ( not ( = ?auto_24305 ?auto_24324 ) ) ( not ( = ?auto_24306 ?auto_24312 ) ) ( not ( = ?auto_24306 ?auto_24324 ) ) ( not ( = ?auto_24307 ?auto_24312 ) ) ( not ( = ?auto_24307 ?auto_24324 ) ) ( not ( = ?auto_24308 ?auto_24312 ) ) ( not ( = ?auto_24308 ?auto_24324 ) ) ( not ( = ?auto_24312 ?auto_24332 ) ) ( not ( = ?auto_24312 ?auto_24327 ) ) ( not ( = ?auto_24312 ?auto_24350 ) ) ( not ( = ?auto_24312 ?auto_24352 ) ) ( not ( = ?auto_24312 ?auto_24337 ) ) ( not ( = ?auto_24312 ?auto_24333 ) ) ( not ( = ?auto_24345 ?auto_24323 ) ) ( not ( = ?auto_24345 ?auto_24351 ) ) ( not ( = ?auto_24345 ?auto_24326 ) ) ( not ( = ?auto_24345 ?auto_24354 ) ) ( not ( = ?auto_24345 ?auto_24342 ) ) ( not ( = ?auto_24353 ?auto_24319 ) ) ( not ( = ?auto_24353 ?auto_24343 ) ) ( not ( = ?auto_24353 ?auto_24347 ) ) ( not ( = ?auto_24353 ?auto_24330 ) ) ( not ( = ?auto_24353 ?auto_24329 ) ) ( not ( = ?auto_24324 ?auto_24332 ) ) ( not ( = ?auto_24324 ?auto_24327 ) ) ( not ( = ?auto_24324 ?auto_24350 ) ) ( not ( = ?auto_24324 ?auto_24352 ) ) ( not ( = ?auto_24324 ?auto_24337 ) ) ( not ( = ?auto_24324 ?auto_24333 ) ) ( not ( = ?auto_24303 ?auto_24311 ) ) ( not ( = ?auto_24303 ?auto_24338 ) ) ( not ( = ?auto_24304 ?auto_24311 ) ) ( not ( = ?auto_24304 ?auto_24338 ) ) ( not ( = ?auto_24305 ?auto_24311 ) ) ( not ( = ?auto_24305 ?auto_24338 ) ) ( not ( = ?auto_24306 ?auto_24311 ) ) ( not ( = ?auto_24306 ?auto_24338 ) ) ( not ( = ?auto_24307 ?auto_24311 ) ) ( not ( = ?auto_24307 ?auto_24338 ) ) ( not ( = ?auto_24308 ?auto_24311 ) ) ( not ( = ?auto_24308 ?auto_24338 ) ) ( not ( = ?auto_24309 ?auto_24311 ) ) ( not ( = ?auto_24309 ?auto_24338 ) ) ( not ( = ?auto_24311 ?auto_24324 ) ) ( not ( = ?auto_24311 ?auto_24332 ) ) ( not ( = ?auto_24311 ?auto_24327 ) ) ( not ( = ?auto_24311 ?auto_24350 ) ) ( not ( = ?auto_24311 ?auto_24352 ) ) ( not ( = ?auto_24311 ?auto_24337 ) ) ( not ( = ?auto_24311 ?auto_24333 ) ) ( not ( = ?auto_24325 ?auto_24345 ) ) ( not ( = ?auto_24325 ?auto_24323 ) ) ( not ( = ?auto_24325 ?auto_24351 ) ) ( not ( = ?auto_24325 ?auto_24326 ) ) ( not ( = ?auto_24325 ?auto_24354 ) ) ( not ( = ?auto_24325 ?auto_24342 ) ) ( not ( = ?auto_24328 ?auto_24353 ) ) ( not ( = ?auto_24328 ?auto_24319 ) ) ( not ( = ?auto_24328 ?auto_24343 ) ) ( not ( = ?auto_24328 ?auto_24347 ) ) ( not ( = ?auto_24328 ?auto_24330 ) ) ( not ( = ?auto_24328 ?auto_24329 ) ) ( not ( = ?auto_24338 ?auto_24324 ) ) ( not ( = ?auto_24338 ?auto_24332 ) ) ( not ( = ?auto_24338 ?auto_24327 ) ) ( not ( = ?auto_24338 ?auto_24350 ) ) ( not ( = ?auto_24338 ?auto_24352 ) ) ( not ( = ?auto_24338 ?auto_24337 ) ) ( not ( = ?auto_24338 ?auto_24333 ) ) ( not ( = ?auto_24303 ?auto_24310 ) ) ( not ( = ?auto_24303 ?auto_24341 ) ) ( not ( = ?auto_24304 ?auto_24310 ) ) ( not ( = ?auto_24304 ?auto_24341 ) ) ( not ( = ?auto_24305 ?auto_24310 ) ) ( not ( = ?auto_24305 ?auto_24341 ) ) ( not ( = ?auto_24306 ?auto_24310 ) ) ( not ( = ?auto_24306 ?auto_24341 ) ) ( not ( = ?auto_24307 ?auto_24310 ) ) ( not ( = ?auto_24307 ?auto_24341 ) ) ( not ( = ?auto_24308 ?auto_24310 ) ) ( not ( = ?auto_24308 ?auto_24341 ) ) ( not ( = ?auto_24309 ?auto_24310 ) ) ( not ( = ?auto_24309 ?auto_24341 ) ) ( not ( = ?auto_24312 ?auto_24310 ) ) ( not ( = ?auto_24312 ?auto_24341 ) ) ( not ( = ?auto_24310 ?auto_24338 ) ) ( not ( = ?auto_24310 ?auto_24324 ) ) ( not ( = ?auto_24310 ?auto_24332 ) ) ( not ( = ?auto_24310 ?auto_24327 ) ) ( not ( = ?auto_24310 ?auto_24350 ) ) ( not ( = ?auto_24310 ?auto_24352 ) ) ( not ( = ?auto_24310 ?auto_24337 ) ) ( not ( = ?auto_24310 ?auto_24333 ) ) ( not ( = ?auto_24339 ?auto_24325 ) ) ( not ( = ?auto_24339 ?auto_24345 ) ) ( not ( = ?auto_24339 ?auto_24323 ) ) ( not ( = ?auto_24339 ?auto_24351 ) ) ( not ( = ?auto_24339 ?auto_24326 ) ) ( not ( = ?auto_24339 ?auto_24354 ) ) ( not ( = ?auto_24339 ?auto_24342 ) ) ( not ( = ?auto_24335 ?auto_24328 ) ) ( not ( = ?auto_24335 ?auto_24353 ) ) ( not ( = ?auto_24335 ?auto_24319 ) ) ( not ( = ?auto_24335 ?auto_24343 ) ) ( not ( = ?auto_24335 ?auto_24347 ) ) ( not ( = ?auto_24335 ?auto_24330 ) ) ( not ( = ?auto_24335 ?auto_24329 ) ) ( not ( = ?auto_24341 ?auto_24338 ) ) ( not ( = ?auto_24341 ?auto_24324 ) ) ( not ( = ?auto_24341 ?auto_24332 ) ) ( not ( = ?auto_24341 ?auto_24327 ) ) ( not ( = ?auto_24341 ?auto_24350 ) ) ( not ( = ?auto_24341 ?auto_24352 ) ) ( not ( = ?auto_24341 ?auto_24337 ) ) ( not ( = ?auto_24341 ?auto_24333 ) ) ( not ( = ?auto_24303 ?auto_24313 ) ) ( not ( = ?auto_24303 ?auto_24340 ) ) ( not ( = ?auto_24304 ?auto_24313 ) ) ( not ( = ?auto_24304 ?auto_24340 ) ) ( not ( = ?auto_24305 ?auto_24313 ) ) ( not ( = ?auto_24305 ?auto_24340 ) ) ( not ( = ?auto_24306 ?auto_24313 ) ) ( not ( = ?auto_24306 ?auto_24340 ) ) ( not ( = ?auto_24307 ?auto_24313 ) ) ( not ( = ?auto_24307 ?auto_24340 ) ) ( not ( = ?auto_24308 ?auto_24313 ) ) ( not ( = ?auto_24308 ?auto_24340 ) ) ( not ( = ?auto_24309 ?auto_24313 ) ) ( not ( = ?auto_24309 ?auto_24340 ) ) ( not ( = ?auto_24312 ?auto_24313 ) ) ( not ( = ?auto_24312 ?auto_24340 ) ) ( not ( = ?auto_24311 ?auto_24313 ) ) ( not ( = ?auto_24311 ?auto_24340 ) ) ( not ( = ?auto_24313 ?auto_24341 ) ) ( not ( = ?auto_24313 ?auto_24338 ) ) ( not ( = ?auto_24313 ?auto_24324 ) ) ( not ( = ?auto_24313 ?auto_24332 ) ) ( not ( = ?auto_24313 ?auto_24327 ) ) ( not ( = ?auto_24313 ?auto_24350 ) ) ( not ( = ?auto_24313 ?auto_24352 ) ) ( not ( = ?auto_24313 ?auto_24337 ) ) ( not ( = ?auto_24313 ?auto_24333 ) ) ( not ( = ?auto_24349 ?auto_24339 ) ) ( not ( = ?auto_24349 ?auto_24325 ) ) ( not ( = ?auto_24349 ?auto_24345 ) ) ( not ( = ?auto_24349 ?auto_24323 ) ) ( not ( = ?auto_24349 ?auto_24351 ) ) ( not ( = ?auto_24349 ?auto_24326 ) ) ( not ( = ?auto_24349 ?auto_24354 ) ) ( not ( = ?auto_24349 ?auto_24342 ) ) ( not ( = ?auto_24331 ?auto_24335 ) ) ( not ( = ?auto_24331 ?auto_24328 ) ) ( not ( = ?auto_24331 ?auto_24353 ) ) ( not ( = ?auto_24331 ?auto_24319 ) ) ( not ( = ?auto_24331 ?auto_24343 ) ) ( not ( = ?auto_24331 ?auto_24347 ) ) ( not ( = ?auto_24331 ?auto_24330 ) ) ( not ( = ?auto_24331 ?auto_24329 ) ) ( not ( = ?auto_24340 ?auto_24341 ) ) ( not ( = ?auto_24340 ?auto_24338 ) ) ( not ( = ?auto_24340 ?auto_24324 ) ) ( not ( = ?auto_24340 ?auto_24332 ) ) ( not ( = ?auto_24340 ?auto_24327 ) ) ( not ( = ?auto_24340 ?auto_24350 ) ) ( not ( = ?auto_24340 ?auto_24352 ) ) ( not ( = ?auto_24340 ?auto_24337 ) ) ( not ( = ?auto_24340 ?auto_24333 ) ) ( not ( = ?auto_24303 ?auto_24314 ) ) ( not ( = ?auto_24303 ?auto_24344 ) ) ( not ( = ?auto_24304 ?auto_24314 ) ) ( not ( = ?auto_24304 ?auto_24344 ) ) ( not ( = ?auto_24305 ?auto_24314 ) ) ( not ( = ?auto_24305 ?auto_24344 ) ) ( not ( = ?auto_24306 ?auto_24314 ) ) ( not ( = ?auto_24306 ?auto_24344 ) ) ( not ( = ?auto_24307 ?auto_24314 ) ) ( not ( = ?auto_24307 ?auto_24344 ) ) ( not ( = ?auto_24308 ?auto_24314 ) ) ( not ( = ?auto_24308 ?auto_24344 ) ) ( not ( = ?auto_24309 ?auto_24314 ) ) ( not ( = ?auto_24309 ?auto_24344 ) ) ( not ( = ?auto_24312 ?auto_24314 ) ) ( not ( = ?auto_24312 ?auto_24344 ) ) ( not ( = ?auto_24311 ?auto_24314 ) ) ( not ( = ?auto_24311 ?auto_24344 ) ) ( not ( = ?auto_24310 ?auto_24314 ) ) ( not ( = ?auto_24310 ?auto_24344 ) ) ( not ( = ?auto_24314 ?auto_24340 ) ) ( not ( = ?auto_24314 ?auto_24341 ) ) ( not ( = ?auto_24314 ?auto_24338 ) ) ( not ( = ?auto_24314 ?auto_24324 ) ) ( not ( = ?auto_24314 ?auto_24332 ) ) ( not ( = ?auto_24314 ?auto_24327 ) ) ( not ( = ?auto_24314 ?auto_24350 ) ) ( not ( = ?auto_24314 ?auto_24352 ) ) ( not ( = ?auto_24314 ?auto_24337 ) ) ( not ( = ?auto_24314 ?auto_24333 ) ) ( not ( = ?auto_24344 ?auto_24340 ) ) ( not ( = ?auto_24344 ?auto_24341 ) ) ( not ( = ?auto_24344 ?auto_24338 ) ) ( not ( = ?auto_24344 ?auto_24324 ) ) ( not ( = ?auto_24344 ?auto_24332 ) ) ( not ( = ?auto_24344 ?auto_24327 ) ) ( not ( = ?auto_24344 ?auto_24350 ) ) ( not ( = ?auto_24344 ?auto_24352 ) ) ( not ( = ?auto_24344 ?auto_24337 ) ) ( not ( = ?auto_24344 ?auto_24333 ) ) ( not ( = ?auto_24303 ?auto_24315 ) ) ( not ( = ?auto_24303 ?auto_24334 ) ) ( not ( = ?auto_24304 ?auto_24315 ) ) ( not ( = ?auto_24304 ?auto_24334 ) ) ( not ( = ?auto_24305 ?auto_24315 ) ) ( not ( = ?auto_24305 ?auto_24334 ) ) ( not ( = ?auto_24306 ?auto_24315 ) ) ( not ( = ?auto_24306 ?auto_24334 ) ) ( not ( = ?auto_24307 ?auto_24315 ) ) ( not ( = ?auto_24307 ?auto_24334 ) ) ( not ( = ?auto_24308 ?auto_24315 ) ) ( not ( = ?auto_24308 ?auto_24334 ) ) ( not ( = ?auto_24309 ?auto_24315 ) ) ( not ( = ?auto_24309 ?auto_24334 ) ) ( not ( = ?auto_24312 ?auto_24315 ) ) ( not ( = ?auto_24312 ?auto_24334 ) ) ( not ( = ?auto_24311 ?auto_24315 ) ) ( not ( = ?auto_24311 ?auto_24334 ) ) ( not ( = ?auto_24310 ?auto_24315 ) ) ( not ( = ?auto_24310 ?auto_24334 ) ) ( not ( = ?auto_24313 ?auto_24315 ) ) ( not ( = ?auto_24313 ?auto_24334 ) ) ( not ( = ?auto_24315 ?auto_24344 ) ) ( not ( = ?auto_24315 ?auto_24340 ) ) ( not ( = ?auto_24315 ?auto_24341 ) ) ( not ( = ?auto_24315 ?auto_24338 ) ) ( not ( = ?auto_24315 ?auto_24324 ) ) ( not ( = ?auto_24315 ?auto_24332 ) ) ( not ( = ?auto_24315 ?auto_24327 ) ) ( not ( = ?auto_24315 ?auto_24350 ) ) ( not ( = ?auto_24315 ?auto_24352 ) ) ( not ( = ?auto_24315 ?auto_24337 ) ) ( not ( = ?auto_24315 ?auto_24333 ) ) ( not ( = ?auto_24334 ?auto_24344 ) ) ( not ( = ?auto_24334 ?auto_24340 ) ) ( not ( = ?auto_24334 ?auto_24341 ) ) ( not ( = ?auto_24334 ?auto_24338 ) ) ( not ( = ?auto_24334 ?auto_24324 ) ) ( not ( = ?auto_24334 ?auto_24332 ) ) ( not ( = ?auto_24334 ?auto_24327 ) ) ( not ( = ?auto_24334 ?auto_24350 ) ) ( not ( = ?auto_24334 ?auto_24352 ) ) ( not ( = ?auto_24334 ?auto_24337 ) ) ( not ( = ?auto_24334 ?auto_24333 ) ) ( not ( = ?auto_24303 ?auto_24316 ) ) ( not ( = ?auto_24303 ?auto_24346 ) ) ( not ( = ?auto_24304 ?auto_24316 ) ) ( not ( = ?auto_24304 ?auto_24346 ) ) ( not ( = ?auto_24305 ?auto_24316 ) ) ( not ( = ?auto_24305 ?auto_24346 ) ) ( not ( = ?auto_24306 ?auto_24316 ) ) ( not ( = ?auto_24306 ?auto_24346 ) ) ( not ( = ?auto_24307 ?auto_24316 ) ) ( not ( = ?auto_24307 ?auto_24346 ) ) ( not ( = ?auto_24308 ?auto_24316 ) ) ( not ( = ?auto_24308 ?auto_24346 ) ) ( not ( = ?auto_24309 ?auto_24316 ) ) ( not ( = ?auto_24309 ?auto_24346 ) ) ( not ( = ?auto_24312 ?auto_24316 ) ) ( not ( = ?auto_24312 ?auto_24346 ) ) ( not ( = ?auto_24311 ?auto_24316 ) ) ( not ( = ?auto_24311 ?auto_24346 ) ) ( not ( = ?auto_24310 ?auto_24316 ) ) ( not ( = ?auto_24310 ?auto_24346 ) ) ( not ( = ?auto_24313 ?auto_24316 ) ) ( not ( = ?auto_24313 ?auto_24346 ) ) ( not ( = ?auto_24314 ?auto_24316 ) ) ( not ( = ?auto_24314 ?auto_24346 ) ) ( not ( = ?auto_24316 ?auto_24334 ) ) ( not ( = ?auto_24316 ?auto_24344 ) ) ( not ( = ?auto_24316 ?auto_24340 ) ) ( not ( = ?auto_24316 ?auto_24341 ) ) ( not ( = ?auto_24316 ?auto_24338 ) ) ( not ( = ?auto_24316 ?auto_24324 ) ) ( not ( = ?auto_24316 ?auto_24332 ) ) ( not ( = ?auto_24316 ?auto_24327 ) ) ( not ( = ?auto_24316 ?auto_24350 ) ) ( not ( = ?auto_24316 ?auto_24352 ) ) ( not ( = ?auto_24316 ?auto_24337 ) ) ( not ( = ?auto_24316 ?auto_24333 ) ) ( not ( = ?auto_24348 ?auto_24351 ) ) ( not ( = ?auto_24348 ?auto_24349 ) ) ( not ( = ?auto_24348 ?auto_24339 ) ) ( not ( = ?auto_24348 ?auto_24325 ) ) ( not ( = ?auto_24348 ?auto_24345 ) ) ( not ( = ?auto_24348 ?auto_24323 ) ) ( not ( = ?auto_24348 ?auto_24326 ) ) ( not ( = ?auto_24348 ?auto_24354 ) ) ( not ( = ?auto_24348 ?auto_24342 ) ) ( not ( = ?auto_24336 ?auto_24343 ) ) ( not ( = ?auto_24336 ?auto_24331 ) ) ( not ( = ?auto_24336 ?auto_24335 ) ) ( not ( = ?auto_24336 ?auto_24328 ) ) ( not ( = ?auto_24336 ?auto_24353 ) ) ( not ( = ?auto_24336 ?auto_24319 ) ) ( not ( = ?auto_24336 ?auto_24347 ) ) ( not ( = ?auto_24336 ?auto_24330 ) ) ( not ( = ?auto_24336 ?auto_24329 ) ) ( not ( = ?auto_24346 ?auto_24334 ) ) ( not ( = ?auto_24346 ?auto_24344 ) ) ( not ( = ?auto_24346 ?auto_24340 ) ) ( not ( = ?auto_24346 ?auto_24341 ) ) ( not ( = ?auto_24346 ?auto_24338 ) ) ( not ( = ?auto_24346 ?auto_24324 ) ) ( not ( = ?auto_24346 ?auto_24332 ) ) ( not ( = ?auto_24346 ?auto_24327 ) ) ( not ( = ?auto_24346 ?auto_24350 ) ) ( not ( = ?auto_24346 ?auto_24352 ) ) ( not ( = ?auto_24346 ?auto_24337 ) ) ( not ( = ?auto_24346 ?auto_24333 ) ) ( not ( = ?auto_24303 ?auto_24317 ) ) ( not ( = ?auto_24303 ?auto_24322 ) ) ( not ( = ?auto_24304 ?auto_24317 ) ) ( not ( = ?auto_24304 ?auto_24322 ) ) ( not ( = ?auto_24305 ?auto_24317 ) ) ( not ( = ?auto_24305 ?auto_24322 ) ) ( not ( = ?auto_24306 ?auto_24317 ) ) ( not ( = ?auto_24306 ?auto_24322 ) ) ( not ( = ?auto_24307 ?auto_24317 ) ) ( not ( = ?auto_24307 ?auto_24322 ) ) ( not ( = ?auto_24308 ?auto_24317 ) ) ( not ( = ?auto_24308 ?auto_24322 ) ) ( not ( = ?auto_24309 ?auto_24317 ) ) ( not ( = ?auto_24309 ?auto_24322 ) ) ( not ( = ?auto_24312 ?auto_24317 ) ) ( not ( = ?auto_24312 ?auto_24322 ) ) ( not ( = ?auto_24311 ?auto_24317 ) ) ( not ( = ?auto_24311 ?auto_24322 ) ) ( not ( = ?auto_24310 ?auto_24317 ) ) ( not ( = ?auto_24310 ?auto_24322 ) ) ( not ( = ?auto_24313 ?auto_24317 ) ) ( not ( = ?auto_24313 ?auto_24322 ) ) ( not ( = ?auto_24314 ?auto_24317 ) ) ( not ( = ?auto_24314 ?auto_24322 ) ) ( not ( = ?auto_24315 ?auto_24317 ) ) ( not ( = ?auto_24315 ?auto_24322 ) ) ( not ( = ?auto_24317 ?auto_24346 ) ) ( not ( = ?auto_24317 ?auto_24334 ) ) ( not ( = ?auto_24317 ?auto_24344 ) ) ( not ( = ?auto_24317 ?auto_24340 ) ) ( not ( = ?auto_24317 ?auto_24341 ) ) ( not ( = ?auto_24317 ?auto_24338 ) ) ( not ( = ?auto_24317 ?auto_24324 ) ) ( not ( = ?auto_24317 ?auto_24332 ) ) ( not ( = ?auto_24317 ?auto_24327 ) ) ( not ( = ?auto_24317 ?auto_24350 ) ) ( not ( = ?auto_24317 ?auto_24352 ) ) ( not ( = ?auto_24317 ?auto_24337 ) ) ( not ( = ?auto_24317 ?auto_24333 ) ) ( not ( = ?auto_24322 ?auto_24346 ) ) ( not ( = ?auto_24322 ?auto_24334 ) ) ( not ( = ?auto_24322 ?auto_24344 ) ) ( not ( = ?auto_24322 ?auto_24340 ) ) ( not ( = ?auto_24322 ?auto_24341 ) ) ( not ( = ?auto_24322 ?auto_24338 ) ) ( not ( = ?auto_24322 ?auto_24324 ) ) ( not ( = ?auto_24322 ?auto_24332 ) ) ( not ( = ?auto_24322 ?auto_24327 ) ) ( not ( = ?auto_24322 ?auto_24350 ) ) ( not ( = ?auto_24322 ?auto_24352 ) ) ( not ( = ?auto_24322 ?auto_24337 ) ) ( not ( = ?auto_24322 ?auto_24333 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_24303 ?auto_24304 ?auto_24305 ?auto_24306 ?auto_24307 ?auto_24308 ?auto_24309 ?auto_24312 ?auto_24311 ?auto_24310 ?auto_24313 ?auto_24314 ?auto_24315 ?auto_24316 )
      ( MAKE-1CRATE ?auto_24316 ?auto_24317 )
      ( MAKE-14CRATE-VERIFY ?auto_24303 ?auto_24304 ?auto_24305 ?auto_24306 ?auto_24307 ?auto_24308 ?auto_24309 ?auto_24312 ?auto_24311 ?auto_24310 ?auto_24313 ?auto_24314 ?auto_24315 ?auto_24316 ?auto_24317 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24357 - SURFACE
      ?auto_24358 - SURFACE
    )
    :vars
    (
      ?auto_24359 - HOIST
      ?auto_24360 - PLACE
      ?auto_24362 - PLACE
      ?auto_24363 - HOIST
      ?auto_24364 - SURFACE
      ?auto_24361 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24359 ?auto_24360 ) ( SURFACE-AT ?auto_24357 ?auto_24360 ) ( CLEAR ?auto_24357 ) ( IS-CRATE ?auto_24358 ) ( AVAILABLE ?auto_24359 ) ( not ( = ?auto_24362 ?auto_24360 ) ) ( HOIST-AT ?auto_24363 ?auto_24362 ) ( AVAILABLE ?auto_24363 ) ( SURFACE-AT ?auto_24358 ?auto_24362 ) ( ON ?auto_24358 ?auto_24364 ) ( CLEAR ?auto_24358 ) ( TRUCK-AT ?auto_24361 ?auto_24360 ) ( not ( = ?auto_24357 ?auto_24358 ) ) ( not ( = ?auto_24357 ?auto_24364 ) ) ( not ( = ?auto_24358 ?auto_24364 ) ) ( not ( = ?auto_24359 ?auto_24363 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24361 ?auto_24360 ?auto_24362 )
      ( !LIFT ?auto_24363 ?auto_24358 ?auto_24364 ?auto_24362 )
      ( !LOAD ?auto_24363 ?auto_24358 ?auto_24361 ?auto_24362 )
      ( !DRIVE ?auto_24361 ?auto_24362 ?auto_24360 )
      ( !UNLOAD ?auto_24359 ?auto_24358 ?auto_24361 ?auto_24360 )
      ( !DROP ?auto_24359 ?auto_24358 ?auto_24357 ?auto_24360 )
      ( MAKE-1CRATE-VERIFY ?auto_24357 ?auto_24358 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_24381 - SURFACE
      ?auto_24382 - SURFACE
      ?auto_24383 - SURFACE
      ?auto_24384 - SURFACE
      ?auto_24385 - SURFACE
      ?auto_24386 - SURFACE
      ?auto_24387 - SURFACE
      ?auto_24390 - SURFACE
      ?auto_24389 - SURFACE
      ?auto_24388 - SURFACE
      ?auto_24391 - SURFACE
      ?auto_24392 - SURFACE
      ?auto_24393 - SURFACE
      ?auto_24394 - SURFACE
      ?auto_24396 - SURFACE
      ?auto_24395 - SURFACE
    )
    :vars
    (
      ?auto_24399 - HOIST
      ?auto_24400 - PLACE
      ?auto_24397 - PLACE
      ?auto_24401 - HOIST
      ?auto_24402 - SURFACE
      ?auto_24415 - PLACE
      ?auto_24421 - HOIST
      ?auto_24428 - SURFACE
      ?auto_24417 - PLACE
      ?auto_24411 - HOIST
      ?auto_24431 - SURFACE
      ?auto_24422 - PLACE
      ?auto_24436 - HOIST
      ?auto_24429 - SURFACE
      ?auto_24420 - SURFACE
      ?auto_24416 - PLACE
      ?auto_24435 - HOIST
      ?auto_24423 - SURFACE
      ?auto_24418 - PLACE
      ?auto_24413 - HOIST
      ?auto_24425 - SURFACE
      ?auto_24414 - PLACE
      ?auto_24426 - HOIST
      ?auto_24408 - SURFACE
      ?auto_24409 - PLACE
      ?auto_24404 - HOIST
      ?auto_24432 - SURFACE
      ?auto_24427 - SURFACE
      ?auto_24407 - SURFACE
      ?auto_24405 - PLACE
      ?auto_24406 - HOIST
      ?auto_24419 - SURFACE
      ?auto_24403 - PLACE
      ?auto_24433 - HOIST
      ?auto_24412 - SURFACE
      ?auto_24424 - SURFACE
      ?auto_24430 - PLACE
      ?auto_24410 - HOIST
      ?auto_24434 - SURFACE
      ?auto_24398 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24399 ?auto_24400 ) ( IS-CRATE ?auto_24395 ) ( not ( = ?auto_24397 ?auto_24400 ) ) ( HOIST-AT ?auto_24401 ?auto_24397 ) ( AVAILABLE ?auto_24401 ) ( SURFACE-AT ?auto_24395 ?auto_24397 ) ( ON ?auto_24395 ?auto_24402 ) ( CLEAR ?auto_24395 ) ( not ( = ?auto_24396 ?auto_24395 ) ) ( not ( = ?auto_24396 ?auto_24402 ) ) ( not ( = ?auto_24395 ?auto_24402 ) ) ( not ( = ?auto_24399 ?auto_24401 ) ) ( IS-CRATE ?auto_24396 ) ( not ( = ?auto_24415 ?auto_24400 ) ) ( HOIST-AT ?auto_24421 ?auto_24415 ) ( SURFACE-AT ?auto_24396 ?auto_24415 ) ( ON ?auto_24396 ?auto_24428 ) ( CLEAR ?auto_24396 ) ( not ( = ?auto_24394 ?auto_24396 ) ) ( not ( = ?auto_24394 ?auto_24428 ) ) ( not ( = ?auto_24396 ?auto_24428 ) ) ( not ( = ?auto_24399 ?auto_24421 ) ) ( IS-CRATE ?auto_24394 ) ( not ( = ?auto_24417 ?auto_24400 ) ) ( HOIST-AT ?auto_24411 ?auto_24417 ) ( AVAILABLE ?auto_24411 ) ( SURFACE-AT ?auto_24394 ?auto_24417 ) ( ON ?auto_24394 ?auto_24431 ) ( CLEAR ?auto_24394 ) ( not ( = ?auto_24393 ?auto_24394 ) ) ( not ( = ?auto_24393 ?auto_24431 ) ) ( not ( = ?auto_24394 ?auto_24431 ) ) ( not ( = ?auto_24399 ?auto_24411 ) ) ( IS-CRATE ?auto_24393 ) ( not ( = ?auto_24422 ?auto_24400 ) ) ( HOIST-AT ?auto_24436 ?auto_24422 ) ( SURFACE-AT ?auto_24393 ?auto_24422 ) ( ON ?auto_24393 ?auto_24429 ) ( CLEAR ?auto_24393 ) ( not ( = ?auto_24392 ?auto_24393 ) ) ( not ( = ?auto_24392 ?auto_24429 ) ) ( not ( = ?auto_24393 ?auto_24429 ) ) ( not ( = ?auto_24399 ?auto_24436 ) ) ( IS-CRATE ?auto_24392 ) ( SURFACE-AT ?auto_24392 ?auto_24422 ) ( ON ?auto_24392 ?auto_24420 ) ( CLEAR ?auto_24392 ) ( not ( = ?auto_24391 ?auto_24392 ) ) ( not ( = ?auto_24391 ?auto_24420 ) ) ( not ( = ?auto_24392 ?auto_24420 ) ) ( IS-CRATE ?auto_24391 ) ( not ( = ?auto_24416 ?auto_24400 ) ) ( HOIST-AT ?auto_24435 ?auto_24416 ) ( AVAILABLE ?auto_24435 ) ( SURFACE-AT ?auto_24391 ?auto_24416 ) ( ON ?auto_24391 ?auto_24423 ) ( CLEAR ?auto_24391 ) ( not ( = ?auto_24388 ?auto_24391 ) ) ( not ( = ?auto_24388 ?auto_24423 ) ) ( not ( = ?auto_24391 ?auto_24423 ) ) ( not ( = ?auto_24399 ?auto_24435 ) ) ( IS-CRATE ?auto_24388 ) ( not ( = ?auto_24418 ?auto_24400 ) ) ( HOIST-AT ?auto_24413 ?auto_24418 ) ( AVAILABLE ?auto_24413 ) ( SURFACE-AT ?auto_24388 ?auto_24418 ) ( ON ?auto_24388 ?auto_24425 ) ( CLEAR ?auto_24388 ) ( not ( = ?auto_24389 ?auto_24388 ) ) ( not ( = ?auto_24389 ?auto_24425 ) ) ( not ( = ?auto_24388 ?auto_24425 ) ) ( not ( = ?auto_24399 ?auto_24413 ) ) ( IS-CRATE ?auto_24389 ) ( not ( = ?auto_24414 ?auto_24400 ) ) ( HOIST-AT ?auto_24426 ?auto_24414 ) ( AVAILABLE ?auto_24426 ) ( SURFACE-AT ?auto_24389 ?auto_24414 ) ( ON ?auto_24389 ?auto_24408 ) ( CLEAR ?auto_24389 ) ( not ( = ?auto_24390 ?auto_24389 ) ) ( not ( = ?auto_24390 ?auto_24408 ) ) ( not ( = ?auto_24389 ?auto_24408 ) ) ( not ( = ?auto_24399 ?auto_24426 ) ) ( IS-CRATE ?auto_24390 ) ( not ( = ?auto_24409 ?auto_24400 ) ) ( HOIST-AT ?auto_24404 ?auto_24409 ) ( AVAILABLE ?auto_24404 ) ( SURFACE-AT ?auto_24390 ?auto_24409 ) ( ON ?auto_24390 ?auto_24432 ) ( CLEAR ?auto_24390 ) ( not ( = ?auto_24387 ?auto_24390 ) ) ( not ( = ?auto_24387 ?auto_24432 ) ) ( not ( = ?auto_24390 ?auto_24432 ) ) ( not ( = ?auto_24399 ?auto_24404 ) ) ( IS-CRATE ?auto_24387 ) ( SURFACE-AT ?auto_24387 ?auto_24415 ) ( ON ?auto_24387 ?auto_24427 ) ( CLEAR ?auto_24387 ) ( not ( = ?auto_24386 ?auto_24387 ) ) ( not ( = ?auto_24386 ?auto_24427 ) ) ( not ( = ?auto_24387 ?auto_24427 ) ) ( IS-CRATE ?auto_24386 ) ( AVAILABLE ?auto_24436 ) ( SURFACE-AT ?auto_24386 ?auto_24422 ) ( ON ?auto_24386 ?auto_24407 ) ( CLEAR ?auto_24386 ) ( not ( = ?auto_24385 ?auto_24386 ) ) ( not ( = ?auto_24385 ?auto_24407 ) ) ( not ( = ?auto_24386 ?auto_24407 ) ) ( IS-CRATE ?auto_24385 ) ( not ( = ?auto_24405 ?auto_24400 ) ) ( HOIST-AT ?auto_24406 ?auto_24405 ) ( AVAILABLE ?auto_24406 ) ( SURFACE-AT ?auto_24385 ?auto_24405 ) ( ON ?auto_24385 ?auto_24419 ) ( CLEAR ?auto_24385 ) ( not ( = ?auto_24384 ?auto_24385 ) ) ( not ( = ?auto_24384 ?auto_24419 ) ) ( not ( = ?auto_24385 ?auto_24419 ) ) ( not ( = ?auto_24399 ?auto_24406 ) ) ( IS-CRATE ?auto_24384 ) ( not ( = ?auto_24403 ?auto_24400 ) ) ( HOIST-AT ?auto_24433 ?auto_24403 ) ( AVAILABLE ?auto_24433 ) ( SURFACE-AT ?auto_24384 ?auto_24403 ) ( ON ?auto_24384 ?auto_24412 ) ( CLEAR ?auto_24384 ) ( not ( = ?auto_24383 ?auto_24384 ) ) ( not ( = ?auto_24383 ?auto_24412 ) ) ( not ( = ?auto_24384 ?auto_24412 ) ) ( not ( = ?auto_24399 ?auto_24433 ) ) ( IS-CRATE ?auto_24383 ) ( AVAILABLE ?auto_24421 ) ( SURFACE-AT ?auto_24383 ?auto_24415 ) ( ON ?auto_24383 ?auto_24424 ) ( CLEAR ?auto_24383 ) ( not ( = ?auto_24382 ?auto_24383 ) ) ( not ( = ?auto_24382 ?auto_24424 ) ) ( not ( = ?auto_24383 ?auto_24424 ) ) ( SURFACE-AT ?auto_24381 ?auto_24400 ) ( CLEAR ?auto_24381 ) ( IS-CRATE ?auto_24382 ) ( AVAILABLE ?auto_24399 ) ( not ( = ?auto_24430 ?auto_24400 ) ) ( HOIST-AT ?auto_24410 ?auto_24430 ) ( AVAILABLE ?auto_24410 ) ( SURFACE-AT ?auto_24382 ?auto_24430 ) ( ON ?auto_24382 ?auto_24434 ) ( CLEAR ?auto_24382 ) ( TRUCK-AT ?auto_24398 ?auto_24400 ) ( not ( = ?auto_24381 ?auto_24382 ) ) ( not ( = ?auto_24381 ?auto_24434 ) ) ( not ( = ?auto_24382 ?auto_24434 ) ) ( not ( = ?auto_24399 ?auto_24410 ) ) ( not ( = ?auto_24381 ?auto_24383 ) ) ( not ( = ?auto_24381 ?auto_24424 ) ) ( not ( = ?auto_24383 ?auto_24434 ) ) ( not ( = ?auto_24415 ?auto_24430 ) ) ( not ( = ?auto_24421 ?auto_24410 ) ) ( not ( = ?auto_24424 ?auto_24434 ) ) ( not ( = ?auto_24381 ?auto_24384 ) ) ( not ( = ?auto_24381 ?auto_24412 ) ) ( not ( = ?auto_24382 ?auto_24384 ) ) ( not ( = ?auto_24382 ?auto_24412 ) ) ( not ( = ?auto_24384 ?auto_24424 ) ) ( not ( = ?auto_24384 ?auto_24434 ) ) ( not ( = ?auto_24403 ?auto_24415 ) ) ( not ( = ?auto_24403 ?auto_24430 ) ) ( not ( = ?auto_24433 ?auto_24421 ) ) ( not ( = ?auto_24433 ?auto_24410 ) ) ( not ( = ?auto_24412 ?auto_24424 ) ) ( not ( = ?auto_24412 ?auto_24434 ) ) ( not ( = ?auto_24381 ?auto_24385 ) ) ( not ( = ?auto_24381 ?auto_24419 ) ) ( not ( = ?auto_24382 ?auto_24385 ) ) ( not ( = ?auto_24382 ?auto_24419 ) ) ( not ( = ?auto_24383 ?auto_24385 ) ) ( not ( = ?auto_24383 ?auto_24419 ) ) ( not ( = ?auto_24385 ?auto_24412 ) ) ( not ( = ?auto_24385 ?auto_24424 ) ) ( not ( = ?auto_24385 ?auto_24434 ) ) ( not ( = ?auto_24405 ?auto_24403 ) ) ( not ( = ?auto_24405 ?auto_24415 ) ) ( not ( = ?auto_24405 ?auto_24430 ) ) ( not ( = ?auto_24406 ?auto_24433 ) ) ( not ( = ?auto_24406 ?auto_24421 ) ) ( not ( = ?auto_24406 ?auto_24410 ) ) ( not ( = ?auto_24419 ?auto_24412 ) ) ( not ( = ?auto_24419 ?auto_24424 ) ) ( not ( = ?auto_24419 ?auto_24434 ) ) ( not ( = ?auto_24381 ?auto_24386 ) ) ( not ( = ?auto_24381 ?auto_24407 ) ) ( not ( = ?auto_24382 ?auto_24386 ) ) ( not ( = ?auto_24382 ?auto_24407 ) ) ( not ( = ?auto_24383 ?auto_24386 ) ) ( not ( = ?auto_24383 ?auto_24407 ) ) ( not ( = ?auto_24384 ?auto_24386 ) ) ( not ( = ?auto_24384 ?auto_24407 ) ) ( not ( = ?auto_24386 ?auto_24419 ) ) ( not ( = ?auto_24386 ?auto_24412 ) ) ( not ( = ?auto_24386 ?auto_24424 ) ) ( not ( = ?auto_24386 ?auto_24434 ) ) ( not ( = ?auto_24422 ?auto_24405 ) ) ( not ( = ?auto_24422 ?auto_24403 ) ) ( not ( = ?auto_24422 ?auto_24415 ) ) ( not ( = ?auto_24422 ?auto_24430 ) ) ( not ( = ?auto_24436 ?auto_24406 ) ) ( not ( = ?auto_24436 ?auto_24433 ) ) ( not ( = ?auto_24436 ?auto_24421 ) ) ( not ( = ?auto_24436 ?auto_24410 ) ) ( not ( = ?auto_24407 ?auto_24419 ) ) ( not ( = ?auto_24407 ?auto_24412 ) ) ( not ( = ?auto_24407 ?auto_24424 ) ) ( not ( = ?auto_24407 ?auto_24434 ) ) ( not ( = ?auto_24381 ?auto_24387 ) ) ( not ( = ?auto_24381 ?auto_24427 ) ) ( not ( = ?auto_24382 ?auto_24387 ) ) ( not ( = ?auto_24382 ?auto_24427 ) ) ( not ( = ?auto_24383 ?auto_24387 ) ) ( not ( = ?auto_24383 ?auto_24427 ) ) ( not ( = ?auto_24384 ?auto_24387 ) ) ( not ( = ?auto_24384 ?auto_24427 ) ) ( not ( = ?auto_24385 ?auto_24387 ) ) ( not ( = ?auto_24385 ?auto_24427 ) ) ( not ( = ?auto_24387 ?auto_24407 ) ) ( not ( = ?auto_24387 ?auto_24419 ) ) ( not ( = ?auto_24387 ?auto_24412 ) ) ( not ( = ?auto_24387 ?auto_24424 ) ) ( not ( = ?auto_24387 ?auto_24434 ) ) ( not ( = ?auto_24427 ?auto_24407 ) ) ( not ( = ?auto_24427 ?auto_24419 ) ) ( not ( = ?auto_24427 ?auto_24412 ) ) ( not ( = ?auto_24427 ?auto_24424 ) ) ( not ( = ?auto_24427 ?auto_24434 ) ) ( not ( = ?auto_24381 ?auto_24390 ) ) ( not ( = ?auto_24381 ?auto_24432 ) ) ( not ( = ?auto_24382 ?auto_24390 ) ) ( not ( = ?auto_24382 ?auto_24432 ) ) ( not ( = ?auto_24383 ?auto_24390 ) ) ( not ( = ?auto_24383 ?auto_24432 ) ) ( not ( = ?auto_24384 ?auto_24390 ) ) ( not ( = ?auto_24384 ?auto_24432 ) ) ( not ( = ?auto_24385 ?auto_24390 ) ) ( not ( = ?auto_24385 ?auto_24432 ) ) ( not ( = ?auto_24386 ?auto_24390 ) ) ( not ( = ?auto_24386 ?auto_24432 ) ) ( not ( = ?auto_24390 ?auto_24427 ) ) ( not ( = ?auto_24390 ?auto_24407 ) ) ( not ( = ?auto_24390 ?auto_24419 ) ) ( not ( = ?auto_24390 ?auto_24412 ) ) ( not ( = ?auto_24390 ?auto_24424 ) ) ( not ( = ?auto_24390 ?auto_24434 ) ) ( not ( = ?auto_24409 ?auto_24415 ) ) ( not ( = ?auto_24409 ?auto_24422 ) ) ( not ( = ?auto_24409 ?auto_24405 ) ) ( not ( = ?auto_24409 ?auto_24403 ) ) ( not ( = ?auto_24409 ?auto_24430 ) ) ( not ( = ?auto_24404 ?auto_24421 ) ) ( not ( = ?auto_24404 ?auto_24436 ) ) ( not ( = ?auto_24404 ?auto_24406 ) ) ( not ( = ?auto_24404 ?auto_24433 ) ) ( not ( = ?auto_24404 ?auto_24410 ) ) ( not ( = ?auto_24432 ?auto_24427 ) ) ( not ( = ?auto_24432 ?auto_24407 ) ) ( not ( = ?auto_24432 ?auto_24419 ) ) ( not ( = ?auto_24432 ?auto_24412 ) ) ( not ( = ?auto_24432 ?auto_24424 ) ) ( not ( = ?auto_24432 ?auto_24434 ) ) ( not ( = ?auto_24381 ?auto_24389 ) ) ( not ( = ?auto_24381 ?auto_24408 ) ) ( not ( = ?auto_24382 ?auto_24389 ) ) ( not ( = ?auto_24382 ?auto_24408 ) ) ( not ( = ?auto_24383 ?auto_24389 ) ) ( not ( = ?auto_24383 ?auto_24408 ) ) ( not ( = ?auto_24384 ?auto_24389 ) ) ( not ( = ?auto_24384 ?auto_24408 ) ) ( not ( = ?auto_24385 ?auto_24389 ) ) ( not ( = ?auto_24385 ?auto_24408 ) ) ( not ( = ?auto_24386 ?auto_24389 ) ) ( not ( = ?auto_24386 ?auto_24408 ) ) ( not ( = ?auto_24387 ?auto_24389 ) ) ( not ( = ?auto_24387 ?auto_24408 ) ) ( not ( = ?auto_24389 ?auto_24432 ) ) ( not ( = ?auto_24389 ?auto_24427 ) ) ( not ( = ?auto_24389 ?auto_24407 ) ) ( not ( = ?auto_24389 ?auto_24419 ) ) ( not ( = ?auto_24389 ?auto_24412 ) ) ( not ( = ?auto_24389 ?auto_24424 ) ) ( not ( = ?auto_24389 ?auto_24434 ) ) ( not ( = ?auto_24414 ?auto_24409 ) ) ( not ( = ?auto_24414 ?auto_24415 ) ) ( not ( = ?auto_24414 ?auto_24422 ) ) ( not ( = ?auto_24414 ?auto_24405 ) ) ( not ( = ?auto_24414 ?auto_24403 ) ) ( not ( = ?auto_24414 ?auto_24430 ) ) ( not ( = ?auto_24426 ?auto_24404 ) ) ( not ( = ?auto_24426 ?auto_24421 ) ) ( not ( = ?auto_24426 ?auto_24436 ) ) ( not ( = ?auto_24426 ?auto_24406 ) ) ( not ( = ?auto_24426 ?auto_24433 ) ) ( not ( = ?auto_24426 ?auto_24410 ) ) ( not ( = ?auto_24408 ?auto_24432 ) ) ( not ( = ?auto_24408 ?auto_24427 ) ) ( not ( = ?auto_24408 ?auto_24407 ) ) ( not ( = ?auto_24408 ?auto_24419 ) ) ( not ( = ?auto_24408 ?auto_24412 ) ) ( not ( = ?auto_24408 ?auto_24424 ) ) ( not ( = ?auto_24408 ?auto_24434 ) ) ( not ( = ?auto_24381 ?auto_24388 ) ) ( not ( = ?auto_24381 ?auto_24425 ) ) ( not ( = ?auto_24382 ?auto_24388 ) ) ( not ( = ?auto_24382 ?auto_24425 ) ) ( not ( = ?auto_24383 ?auto_24388 ) ) ( not ( = ?auto_24383 ?auto_24425 ) ) ( not ( = ?auto_24384 ?auto_24388 ) ) ( not ( = ?auto_24384 ?auto_24425 ) ) ( not ( = ?auto_24385 ?auto_24388 ) ) ( not ( = ?auto_24385 ?auto_24425 ) ) ( not ( = ?auto_24386 ?auto_24388 ) ) ( not ( = ?auto_24386 ?auto_24425 ) ) ( not ( = ?auto_24387 ?auto_24388 ) ) ( not ( = ?auto_24387 ?auto_24425 ) ) ( not ( = ?auto_24390 ?auto_24388 ) ) ( not ( = ?auto_24390 ?auto_24425 ) ) ( not ( = ?auto_24388 ?auto_24408 ) ) ( not ( = ?auto_24388 ?auto_24432 ) ) ( not ( = ?auto_24388 ?auto_24427 ) ) ( not ( = ?auto_24388 ?auto_24407 ) ) ( not ( = ?auto_24388 ?auto_24419 ) ) ( not ( = ?auto_24388 ?auto_24412 ) ) ( not ( = ?auto_24388 ?auto_24424 ) ) ( not ( = ?auto_24388 ?auto_24434 ) ) ( not ( = ?auto_24418 ?auto_24414 ) ) ( not ( = ?auto_24418 ?auto_24409 ) ) ( not ( = ?auto_24418 ?auto_24415 ) ) ( not ( = ?auto_24418 ?auto_24422 ) ) ( not ( = ?auto_24418 ?auto_24405 ) ) ( not ( = ?auto_24418 ?auto_24403 ) ) ( not ( = ?auto_24418 ?auto_24430 ) ) ( not ( = ?auto_24413 ?auto_24426 ) ) ( not ( = ?auto_24413 ?auto_24404 ) ) ( not ( = ?auto_24413 ?auto_24421 ) ) ( not ( = ?auto_24413 ?auto_24436 ) ) ( not ( = ?auto_24413 ?auto_24406 ) ) ( not ( = ?auto_24413 ?auto_24433 ) ) ( not ( = ?auto_24413 ?auto_24410 ) ) ( not ( = ?auto_24425 ?auto_24408 ) ) ( not ( = ?auto_24425 ?auto_24432 ) ) ( not ( = ?auto_24425 ?auto_24427 ) ) ( not ( = ?auto_24425 ?auto_24407 ) ) ( not ( = ?auto_24425 ?auto_24419 ) ) ( not ( = ?auto_24425 ?auto_24412 ) ) ( not ( = ?auto_24425 ?auto_24424 ) ) ( not ( = ?auto_24425 ?auto_24434 ) ) ( not ( = ?auto_24381 ?auto_24391 ) ) ( not ( = ?auto_24381 ?auto_24423 ) ) ( not ( = ?auto_24382 ?auto_24391 ) ) ( not ( = ?auto_24382 ?auto_24423 ) ) ( not ( = ?auto_24383 ?auto_24391 ) ) ( not ( = ?auto_24383 ?auto_24423 ) ) ( not ( = ?auto_24384 ?auto_24391 ) ) ( not ( = ?auto_24384 ?auto_24423 ) ) ( not ( = ?auto_24385 ?auto_24391 ) ) ( not ( = ?auto_24385 ?auto_24423 ) ) ( not ( = ?auto_24386 ?auto_24391 ) ) ( not ( = ?auto_24386 ?auto_24423 ) ) ( not ( = ?auto_24387 ?auto_24391 ) ) ( not ( = ?auto_24387 ?auto_24423 ) ) ( not ( = ?auto_24390 ?auto_24391 ) ) ( not ( = ?auto_24390 ?auto_24423 ) ) ( not ( = ?auto_24389 ?auto_24391 ) ) ( not ( = ?auto_24389 ?auto_24423 ) ) ( not ( = ?auto_24391 ?auto_24425 ) ) ( not ( = ?auto_24391 ?auto_24408 ) ) ( not ( = ?auto_24391 ?auto_24432 ) ) ( not ( = ?auto_24391 ?auto_24427 ) ) ( not ( = ?auto_24391 ?auto_24407 ) ) ( not ( = ?auto_24391 ?auto_24419 ) ) ( not ( = ?auto_24391 ?auto_24412 ) ) ( not ( = ?auto_24391 ?auto_24424 ) ) ( not ( = ?auto_24391 ?auto_24434 ) ) ( not ( = ?auto_24416 ?auto_24418 ) ) ( not ( = ?auto_24416 ?auto_24414 ) ) ( not ( = ?auto_24416 ?auto_24409 ) ) ( not ( = ?auto_24416 ?auto_24415 ) ) ( not ( = ?auto_24416 ?auto_24422 ) ) ( not ( = ?auto_24416 ?auto_24405 ) ) ( not ( = ?auto_24416 ?auto_24403 ) ) ( not ( = ?auto_24416 ?auto_24430 ) ) ( not ( = ?auto_24435 ?auto_24413 ) ) ( not ( = ?auto_24435 ?auto_24426 ) ) ( not ( = ?auto_24435 ?auto_24404 ) ) ( not ( = ?auto_24435 ?auto_24421 ) ) ( not ( = ?auto_24435 ?auto_24436 ) ) ( not ( = ?auto_24435 ?auto_24406 ) ) ( not ( = ?auto_24435 ?auto_24433 ) ) ( not ( = ?auto_24435 ?auto_24410 ) ) ( not ( = ?auto_24423 ?auto_24425 ) ) ( not ( = ?auto_24423 ?auto_24408 ) ) ( not ( = ?auto_24423 ?auto_24432 ) ) ( not ( = ?auto_24423 ?auto_24427 ) ) ( not ( = ?auto_24423 ?auto_24407 ) ) ( not ( = ?auto_24423 ?auto_24419 ) ) ( not ( = ?auto_24423 ?auto_24412 ) ) ( not ( = ?auto_24423 ?auto_24424 ) ) ( not ( = ?auto_24423 ?auto_24434 ) ) ( not ( = ?auto_24381 ?auto_24392 ) ) ( not ( = ?auto_24381 ?auto_24420 ) ) ( not ( = ?auto_24382 ?auto_24392 ) ) ( not ( = ?auto_24382 ?auto_24420 ) ) ( not ( = ?auto_24383 ?auto_24392 ) ) ( not ( = ?auto_24383 ?auto_24420 ) ) ( not ( = ?auto_24384 ?auto_24392 ) ) ( not ( = ?auto_24384 ?auto_24420 ) ) ( not ( = ?auto_24385 ?auto_24392 ) ) ( not ( = ?auto_24385 ?auto_24420 ) ) ( not ( = ?auto_24386 ?auto_24392 ) ) ( not ( = ?auto_24386 ?auto_24420 ) ) ( not ( = ?auto_24387 ?auto_24392 ) ) ( not ( = ?auto_24387 ?auto_24420 ) ) ( not ( = ?auto_24390 ?auto_24392 ) ) ( not ( = ?auto_24390 ?auto_24420 ) ) ( not ( = ?auto_24389 ?auto_24392 ) ) ( not ( = ?auto_24389 ?auto_24420 ) ) ( not ( = ?auto_24388 ?auto_24392 ) ) ( not ( = ?auto_24388 ?auto_24420 ) ) ( not ( = ?auto_24392 ?auto_24423 ) ) ( not ( = ?auto_24392 ?auto_24425 ) ) ( not ( = ?auto_24392 ?auto_24408 ) ) ( not ( = ?auto_24392 ?auto_24432 ) ) ( not ( = ?auto_24392 ?auto_24427 ) ) ( not ( = ?auto_24392 ?auto_24407 ) ) ( not ( = ?auto_24392 ?auto_24419 ) ) ( not ( = ?auto_24392 ?auto_24412 ) ) ( not ( = ?auto_24392 ?auto_24424 ) ) ( not ( = ?auto_24392 ?auto_24434 ) ) ( not ( = ?auto_24420 ?auto_24423 ) ) ( not ( = ?auto_24420 ?auto_24425 ) ) ( not ( = ?auto_24420 ?auto_24408 ) ) ( not ( = ?auto_24420 ?auto_24432 ) ) ( not ( = ?auto_24420 ?auto_24427 ) ) ( not ( = ?auto_24420 ?auto_24407 ) ) ( not ( = ?auto_24420 ?auto_24419 ) ) ( not ( = ?auto_24420 ?auto_24412 ) ) ( not ( = ?auto_24420 ?auto_24424 ) ) ( not ( = ?auto_24420 ?auto_24434 ) ) ( not ( = ?auto_24381 ?auto_24393 ) ) ( not ( = ?auto_24381 ?auto_24429 ) ) ( not ( = ?auto_24382 ?auto_24393 ) ) ( not ( = ?auto_24382 ?auto_24429 ) ) ( not ( = ?auto_24383 ?auto_24393 ) ) ( not ( = ?auto_24383 ?auto_24429 ) ) ( not ( = ?auto_24384 ?auto_24393 ) ) ( not ( = ?auto_24384 ?auto_24429 ) ) ( not ( = ?auto_24385 ?auto_24393 ) ) ( not ( = ?auto_24385 ?auto_24429 ) ) ( not ( = ?auto_24386 ?auto_24393 ) ) ( not ( = ?auto_24386 ?auto_24429 ) ) ( not ( = ?auto_24387 ?auto_24393 ) ) ( not ( = ?auto_24387 ?auto_24429 ) ) ( not ( = ?auto_24390 ?auto_24393 ) ) ( not ( = ?auto_24390 ?auto_24429 ) ) ( not ( = ?auto_24389 ?auto_24393 ) ) ( not ( = ?auto_24389 ?auto_24429 ) ) ( not ( = ?auto_24388 ?auto_24393 ) ) ( not ( = ?auto_24388 ?auto_24429 ) ) ( not ( = ?auto_24391 ?auto_24393 ) ) ( not ( = ?auto_24391 ?auto_24429 ) ) ( not ( = ?auto_24393 ?auto_24420 ) ) ( not ( = ?auto_24393 ?auto_24423 ) ) ( not ( = ?auto_24393 ?auto_24425 ) ) ( not ( = ?auto_24393 ?auto_24408 ) ) ( not ( = ?auto_24393 ?auto_24432 ) ) ( not ( = ?auto_24393 ?auto_24427 ) ) ( not ( = ?auto_24393 ?auto_24407 ) ) ( not ( = ?auto_24393 ?auto_24419 ) ) ( not ( = ?auto_24393 ?auto_24412 ) ) ( not ( = ?auto_24393 ?auto_24424 ) ) ( not ( = ?auto_24393 ?auto_24434 ) ) ( not ( = ?auto_24429 ?auto_24420 ) ) ( not ( = ?auto_24429 ?auto_24423 ) ) ( not ( = ?auto_24429 ?auto_24425 ) ) ( not ( = ?auto_24429 ?auto_24408 ) ) ( not ( = ?auto_24429 ?auto_24432 ) ) ( not ( = ?auto_24429 ?auto_24427 ) ) ( not ( = ?auto_24429 ?auto_24407 ) ) ( not ( = ?auto_24429 ?auto_24419 ) ) ( not ( = ?auto_24429 ?auto_24412 ) ) ( not ( = ?auto_24429 ?auto_24424 ) ) ( not ( = ?auto_24429 ?auto_24434 ) ) ( not ( = ?auto_24381 ?auto_24394 ) ) ( not ( = ?auto_24381 ?auto_24431 ) ) ( not ( = ?auto_24382 ?auto_24394 ) ) ( not ( = ?auto_24382 ?auto_24431 ) ) ( not ( = ?auto_24383 ?auto_24394 ) ) ( not ( = ?auto_24383 ?auto_24431 ) ) ( not ( = ?auto_24384 ?auto_24394 ) ) ( not ( = ?auto_24384 ?auto_24431 ) ) ( not ( = ?auto_24385 ?auto_24394 ) ) ( not ( = ?auto_24385 ?auto_24431 ) ) ( not ( = ?auto_24386 ?auto_24394 ) ) ( not ( = ?auto_24386 ?auto_24431 ) ) ( not ( = ?auto_24387 ?auto_24394 ) ) ( not ( = ?auto_24387 ?auto_24431 ) ) ( not ( = ?auto_24390 ?auto_24394 ) ) ( not ( = ?auto_24390 ?auto_24431 ) ) ( not ( = ?auto_24389 ?auto_24394 ) ) ( not ( = ?auto_24389 ?auto_24431 ) ) ( not ( = ?auto_24388 ?auto_24394 ) ) ( not ( = ?auto_24388 ?auto_24431 ) ) ( not ( = ?auto_24391 ?auto_24394 ) ) ( not ( = ?auto_24391 ?auto_24431 ) ) ( not ( = ?auto_24392 ?auto_24394 ) ) ( not ( = ?auto_24392 ?auto_24431 ) ) ( not ( = ?auto_24394 ?auto_24429 ) ) ( not ( = ?auto_24394 ?auto_24420 ) ) ( not ( = ?auto_24394 ?auto_24423 ) ) ( not ( = ?auto_24394 ?auto_24425 ) ) ( not ( = ?auto_24394 ?auto_24408 ) ) ( not ( = ?auto_24394 ?auto_24432 ) ) ( not ( = ?auto_24394 ?auto_24427 ) ) ( not ( = ?auto_24394 ?auto_24407 ) ) ( not ( = ?auto_24394 ?auto_24419 ) ) ( not ( = ?auto_24394 ?auto_24412 ) ) ( not ( = ?auto_24394 ?auto_24424 ) ) ( not ( = ?auto_24394 ?auto_24434 ) ) ( not ( = ?auto_24417 ?auto_24422 ) ) ( not ( = ?auto_24417 ?auto_24416 ) ) ( not ( = ?auto_24417 ?auto_24418 ) ) ( not ( = ?auto_24417 ?auto_24414 ) ) ( not ( = ?auto_24417 ?auto_24409 ) ) ( not ( = ?auto_24417 ?auto_24415 ) ) ( not ( = ?auto_24417 ?auto_24405 ) ) ( not ( = ?auto_24417 ?auto_24403 ) ) ( not ( = ?auto_24417 ?auto_24430 ) ) ( not ( = ?auto_24411 ?auto_24436 ) ) ( not ( = ?auto_24411 ?auto_24435 ) ) ( not ( = ?auto_24411 ?auto_24413 ) ) ( not ( = ?auto_24411 ?auto_24426 ) ) ( not ( = ?auto_24411 ?auto_24404 ) ) ( not ( = ?auto_24411 ?auto_24421 ) ) ( not ( = ?auto_24411 ?auto_24406 ) ) ( not ( = ?auto_24411 ?auto_24433 ) ) ( not ( = ?auto_24411 ?auto_24410 ) ) ( not ( = ?auto_24431 ?auto_24429 ) ) ( not ( = ?auto_24431 ?auto_24420 ) ) ( not ( = ?auto_24431 ?auto_24423 ) ) ( not ( = ?auto_24431 ?auto_24425 ) ) ( not ( = ?auto_24431 ?auto_24408 ) ) ( not ( = ?auto_24431 ?auto_24432 ) ) ( not ( = ?auto_24431 ?auto_24427 ) ) ( not ( = ?auto_24431 ?auto_24407 ) ) ( not ( = ?auto_24431 ?auto_24419 ) ) ( not ( = ?auto_24431 ?auto_24412 ) ) ( not ( = ?auto_24431 ?auto_24424 ) ) ( not ( = ?auto_24431 ?auto_24434 ) ) ( not ( = ?auto_24381 ?auto_24396 ) ) ( not ( = ?auto_24381 ?auto_24428 ) ) ( not ( = ?auto_24382 ?auto_24396 ) ) ( not ( = ?auto_24382 ?auto_24428 ) ) ( not ( = ?auto_24383 ?auto_24396 ) ) ( not ( = ?auto_24383 ?auto_24428 ) ) ( not ( = ?auto_24384 ?auto_24396 ) ) ( not ( = ?auto_24384 ?auto_24428 ) ) ( not ( = ?auto_24385 ?auto_24396 ) ) ( not ( = ?auto_24385 ?auto_24428 ) ) ( not ( = ?auto_24386 ?auto_24396 ) ) ( not ( = ?auto_24386 ?auto_24428 ) ) ( not ( = ?auto_24387 ?auto_24396 ) ) ( not ( = ?auto_24387 ?auto_24428 ) ) ( not ( = ?auto_24390 ?auto_24396 ) ) ( not ( = ?auto_24390 ?auto_24428 ) ) ( not ( = ?auto_24389 ?auto_24396 ) ) ( not ( = ?auto_24389 ?auto_24428 ) ) ( not ( = ?auto_24388 ?auto_24396 ) ) ( not ( = ?auto_24388 ?auto_24428 ) ) ( not ( = ?auto_24391 ?auto_24396 ) ) ( not ( = ?auto_24391 ?auto_24428 ) ) ( not ( = ?auto_24392 ?auto_24396 ) ) ( not ( = ?auto_24392 ?auto_24428 ) ) ( not ( = ?auto_24393 ?auto_24396 ) ) ( not ( = ?auto_24393 ?auto_24428 ) ) ( not ( = ?auto_24396 ?auto_24431 ) ) ( not ( = ?auto_24396 ?auto_24429 ) ) ( not ( = ?auto_24396 ?auto_24420 ) ) ( not ( = ?auto_24396 ?auto_24423 ) ) ( not ( = ?auto_24396 ?auto_24425 ) ) ( not ( = ?auto_24396 ?auto_24408 ) ) ( not ( = ?auto_24396 ?auto_24432 ) ) ( not ( = ?auto_24396 ?auto_24427 ) ) ( not ( = ?auto_24396 ?auto_24407 ) ) ( not ( = ?auto_24396 ?auto_24419 ) ) ( not ( = ?auto_24396 ?auto_24412 ) ) ( not ( = ?auto_24396 ?auto_24424 ) ) ( not ( = ?auto_24396 ?auto_24434 ) ) ( not ( = ?auto_24428 ?auto_24431 ) ) ( not ( = ?auto_24428 ?auto_24429 ) ) ( not ( = ?auto_24428 ?auto_24420 ) ) ( not ( = ?auto_24428 ?auto_24423 ) ) ( not ( = ?auto_24428 ?auto_24425 ) ) ( not ( = ?auto_24428 ?auto_24408 ) ) ( not ( = ?auto_24428 ?auto_24432 ) ) ( not ( = ?auto_24428 ?auto_24427 ) ) ( not ( = ?auto_24428 ?auto_24407 ) ) ( not ( = ?auto_24428 ?auto_24419 ) ) ( not ( = ?auto_24428 ?auto_24412 ) ) ( not ( = ?auto_24428 ?auto_24424 ) ) ( not ( = ?auto_24428 ?auto_24434 ) ) ( not ( = ?auto_24381 ?auto_24395 ) ) ( not ( = ?auto_24381 ?auto_24402 ) ) ( not ( = ?auto_24382 ?auto_24395 ) ) ( not ( = ?auto_24382 ?auto_24402 ) ) ( not ( = ?auto_24383 ?auto_24395 ) ) ( not ( = ?auto_24383 ?auto_24402 ) ) ( not ( = ?auto_24384 ?auto_24395 ) ) ( not ( = ?auto_24384 ?auto_24402 ) ) ( not ( = ?auto_24385 ?auto_24395 ) ) ( not ( = ?auto_24385 ?auto_24402 ) ) ( not ( = ?auto_24386 ?auto_24395 ) ) ( not ( = ?auto_24386 ?auto_24402 ) ) ( not ( = ?auto_24387 ?auto_24395 ) ) ( not ( = ?auto_24387 ?auto_24402 ) ) ( not ( = ?auto_24390 ?auto_24395 ) ) ( not ( = ?auto_24390 ?auto_24402 ) ) ( not ( = ?auto_24389 ?auto_24395 ) ) ( not ( = ?auto_24389 ?auto_24402 ) ) ( not ( = ?auto_24388 ?auto_24395 ) ) ( not ( = ?auto_24388 ?auto_24402 ) ) ( not ( = ?auto_24391 ?auto_24395 ) ) ( not ( = ?auto_24391 ?auto_24402 ) ) ( not ( = ?auto_24392 ?auto_24395 ) ) ( not ( = ?auto_24392 ?auto_24402 ) ) ( not ( = ?auto_24393 ?auto_24395 ) ) ( not ( = ?auto_24393 ?auto_24402 ) ) ( not ( = ?auto_24394 ?auto_24395 ) ) ( not ( = ?auto_24394 ?auto_24402 ) ) ( not ( = ?auto_24395 ?auto_24428 ) ) ( not ( = ?auto_24395 ?auto_24431 ) ) ( not ( = ?auto_24395 ?auto_24429 ) ) ( not ( = ?auto_24395 ?auto_24420 ) ) ( not ( = ?auto_24395 ?auto_24423 ) ) ( not ( = ?auto_24395 ?auto_24425 ) ) ( not ( = ?auto_24395 ?auto_24408 ) ) ( not ( = ?auto_24395 ?auto_24432 ) ) ( not ( = ?auto_24395 ?auto_24427 ) ) ( not ( = ?auto_24395 ?auto_24407 ) ) ( not ( = ?auto_24395 ?auto_24419 ) ) ( not ( = ?auto_24395 ?auto_24412 ) ) ( not ( = ?auto_24395 ?auto_24424 ) ) ( not ( = ?auto_24395 ?auto_24434 ) ) ( not ( = ?auto_24397 ?auto_24415 ) ) ( not ( = ?auto_24397 ?auto_24417 ) ) ( not ( = ?auto_24397 ?auto_24422 ) ) ( not ( = ?auto_24397 ?auto_24416 ) ) ( not ( = ?auto_24397 ?auto_24418 ) ) ( not ( = ?auto_24397 ?auto_24414 ) ) ( not ( = ?auto_24397 ?auto_24409 ) ) ( not ( = ?auto_24397 ?auto_24405 ) ) ( not ( = ?auto_24397 ?auto_24403 ) ) ( not ( = ?auto_24397 ?auto_24430 ) ) ( not ( = ?auto_24401 ?auto_24421 ) ) ( not ( = ?auto_24401 ?auto_24411 ) ) ( not ( = ?auto_24401 ?auto_24436 ) ) ( not ( = ?auto_24401 ?auto_24435 ) ) ( not ( = ?auto_24401 ?auto_24413 ) ) ( not ( = ?auto_24401 ?auto_24426 ) ) ( not ( = ?auto_24401 ?auto_24404 ) ) ( not ( = ?auto_24401 ?auto_24406 ) ) ( not ( = ?auto_24401 ?auto_24433 ) ) ( not ( = ?auto_24401 ?auto_24410 ) ) ( not ( = ?auto_24402 ?auto_24428 ) ) ( not ( = ?auto_24402 ?auto_24431 ) ) ( not ( = ?auto_24402 ?auto_24429 ) ) ( not ( = ?auto_24402 ?auto_24420 ) ) ( not ( = ?auto_24402 ?auto_24423 ) ) ( not ( = ?auto_24402 ?auto_24425 ) ) ( not ( = ?auto_24402 ?auto_24408 ) ) ( not ( = ?auto_24402 ?auto_24432 ) ) ( not ( = ?auto_24402 ?auto_24427 ) ) ( not ( = ?auto_24402 ?auto_24407 ) ) ( not ( = ?auto_24402 ?auto_24419 ) ) ( not ( = ?auto_24402 ?auto_24412 ) ) ( not ( = ?auto_24402 ?auto_24424 ) ) ( not ( = ?auto_24402 ?auto_24434 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_24381 ?auto_24382 ?auto_24383 ?auto_24384 ?auto_24385 ?auto_24386 ?auto_24387 ?auto_24390 ?auto_24389 ?auto_24388 ?auto_24391 ?auto_24392 ?auto_24393 ?auto_24394 ?auto_24396 )
      ( MAKE-1CRATE ?auto_24396 ?auto_24395 )
      ( MAKE-15CRATE-VERIFY ?auto_24381 ?auto_24382 ?auto_24383 ?auto_24384 ?auto_24385 ?auto_24386 ?auto_24387 ?auto_24390 ?auto_24389 ?auto_24388 ?auto_24391 ?auto_24392 ?auto_24393 ?auto_24394 ?auto_24396 ?auto_24395 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24439 - SURFACE
      ?auto_24440 - SURFACE
    )
    :vars
    (
      ?auto_24441 - HOIST
      ?auto_24442 - PLACE
      ?auto_24444 - PLACE
      ?auto_24445 - HOIST
      ?auto_24446 - SURFACE
      ?auto_24443 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24441 ?auto_24442 ) ( SURFACE-AT ?auto_24439 ?auto_24442 ) ( CLEAR ?auto_24439 ) ( IS-CRATE ?auto_24440 ) ( AVAILABLE ?auto_24441 ) ( not ( = ?auto_24444 ?auto_24442 ) ) ( HOIST-AT ?auto_24445 ?auto_24444 ) ( AVAILABLE ?auto_24445 ) ( SURFACE-AT ?auto_24440 ?auto_24444 ) ( ON ?auto_24440 ?auto_24446 ) ( CLEAR ?auto_24440 ) ( TRUCK-AT ?auto_24443 ?auto_24442 ) ( not ( = ?auto_24439 ?auto_24440 ) ) ( not ( = ?auto_24439 ?auto_24446 ) ) ( not ( = ?auto_24440 ?auto_24446 ) ) ( not ( = ?auto_24441 ?auto_24445 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24443 ?auto_24442 ?auto_24444 )
      ( !LIFT ?auto_24445 ?auto_24440 ?auto_24446 ?auto_24444 )
      ( !LOAD ?auto_24445 ?auto_24440 ?auto_24443 ?auto_24444 )
      ( !DRIVE ?auto_24443 ?auto_24444 ?auto_24442 )
      ( !UNLOAD ?auto_24441 ?auto_24440 ?auto_24443 ?auto_24442 )
      ( !DROP ?auto_24441 ?auto_24440 ?auto_24439 ?auto_24442 )
      ( MAKE-1CRATE-VERIFY ?auto_24439 ?auto_24440 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_24464 - SURFACE
      ?auto_24465 - SURFACE
      ?auto_24466 - SURFACE
      ?auto_24467 - SURFACE
      ?auto_24468 - SURFACE
      ?auto_24469 - SURFACE
      ?auto_24470 - SURFACE
      ?auto_24473 - SURFACE
      ?auto_24472 - SURFACE
      ?auto_24471 - SURFACE
      ?auto_24474 - SURFACE
      ?auto_24475 - SURFACE
      ?auto_24476 - SURFACE
      ?auto_24477 - SURFACE
      ?auto_24479 - SURFACE
      ?auto_24478 - SURFACE
      ?auto_24480 - SURFACE
    )
    :vars
    (
      ?auto_24483 - HOIST
      ?auto_24486 - PLACE
      ?auto_24481 - PLACE
      ?auto_24484 - HOIST
      ?auto_24482 - SURFACE
      ?auto_24489 - PLACE
      ?auto_24509 - HOIST
      ?auto_24503 - SURFACE
      ?auto_24506 - PLACE
      ?auto_24487 - HOIST
      ?auto_24491 - SURFACE
      ?auto_24490 - PLACE
      ?auto_24488 - HOIST
      ?auto_24510 - SURFACE
      ?auto_24492 - PLACE
      ?auto_24495 - HOIST
      ?auto_24497 - SURFACE
      ?auto_24502 - SURFACE
      ?auto_24514 - PLACE
      ?auto_24516 - HOIST
      ?auto_24504 - SURFACE
      ?auto_24515 - PLACE
      ?auto_24494 - HOIST
      ?auto_24511 - SURFACE
      ?auto_24519 - PLACE
      ?auto_24518 - HOIST
      ?auto_24493 - SURFACE
      ?auto_24520 - PLACE
      ?auto_24522 - HOIST
      ?auto_24505 - SURFACE
      ?auto_24507 - SURFACE
      ?auto_24496 - SURFACE
      ?auto_24508 - PLACE
      ?auto_24517 - HOIST
      ?auto_24521 - SURFACE
      ?auto_24498 - PLACE
      ?auto_24500 - HOIST
      ?auto_24501 - SURFACE
      ?auto_24499 - SURFACE
      ?auto_24512 - PLACE
      ?auto_24523 - HOIST
      ?auto_24513 - SURFACE
      ?auto_24485 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24483 ?auto_24486 ) ( IS-CRATE ?auto_24480 ) ( not ( = ?auto_24481 ?auto_24486 ) ) ( HOIST-AT ?auto_24484 ?auto_24481 ) ( AVAILABLE ?auto_24484 ) ( SURFACE-AT ?auto_24480 ?auto_24481 ) ( ON ?auto_24480 ?auto_24482 ) ( CLEAR ?auto_24480 ) ( not ( = ?auto_24478 ?auto_24480 ) ) ( not ( = ?auto_24478 ?auto_24482 ) ) ( not ( = ?auto_24480 ?auto_24482 ) ) ( not ( = ?auto_24483 ?auto_24484 ) ) ( IS-CRATE ?auto_24478 ) ( not ( = ?auto_24489 ?auto_24486 ) ) ( HOIST-AT ?auto_24509 ?auto_24489 ) ( AVAILABLE ?auto_24509 ) ( SURFACE-AT ?auto_24478 ?auto_24489 ) ( ON ?auto_24478 ?auto_24503 ) ( CLEAR ?auto_24478 ) ( not ( = ?auto_24479 ?auto_24478 ) ) ( not ( = ?auto_24479 ?auto_24503 ) ) ( not ( = ?auto_24478 ?auto_24503 ) ) ( not ( = ?auto_24483 ?auto_24509 ) ) ( IS-CRATE ?auto_24479 ) ( not ( = ?auto_24506 ?auto_24486 ) ) ( HOIST-AT ?auto_24487 ?auto_24506 ) ( SURFACE-AT ?auto_24479 ?auto_24506 ) ( ON ?auto_24479 ?auto_24491 ) ( CLEAR ?auto_24479 ) ( not ( = ?auto_24477 ?auto_24479 ) ) ( not ( = ?auto_24477 ?auto_24491 ) ) ( not ( = ?auto_24479 ?auto_24491 ) ) ( not ( = ?auto_24483 ?auto_24487 ) ) ( IS-CRATE ?auto_24477 ) ( not ( = ?auto_24490 ?auto_24486 ) ) ( HOIST-AT ?auto_24488 ?auto_24490 ) ( AVAILABLE ?auto_24488 ) ( SURFACE-AT ?auto_24477 ?auto_24490 ) ( ON ?auto_24477 ?auto_24510 ) ( CLEAR ?auto_24477 ) ( not ( = ?auto_24476 ?auto_24477 ) ) ( not ( = ?auto_24476 ?auto_24510 ) ) ( not ( = ?auto_24477 ?auto_24510 ) ) ( not ( = ?auto_24483 ?auto_24488 ) ) ( IS-CRATE ?auto_24476 ) ( not ( = ?auto_24492 ?auto_24486 ) ) ( HOIST-AT ?auto_24495 ?auto_24492 ) ( SURFACE-AT ?auto_24476 ?auto_24492 ) ( ON ?auto_24476 ?auto_24497 ) ( CLEAR ?auto_24476 ) ( not ( = ?auto_24475 ?auto_24476 ) ) ( not ( = ?auto_24475 ?auto_24497 ) ) ( not ( = ?auto_24476 ?auto_24497 ) ) ( not ( = ?auto_24483 ?auto_24495 ) ) ( IS-CRATE ?auto_24475 ) ( SURFACE-AT ?auto_24475 ?auto_24492 ) ( ON ?auto_24475 ?auto_24502 ) ( CLEAR ?auto_24475 ) ( not ( = ?auto_24474 ?auto_24475 ) ) ( not ( = ?auto_24474 ?auto_24502 ) ) ( not ( = ?auto_24475 ?auto_24502 ) ) ( IS-CRATE ?auto_24474 ) ( not ( = ?auto_24514 ?auto_24486 ) ) ( HOIST-AT ?auto_24516 ?auto_24514 ) ( AVAILABLE ?auto_24516 ) ( SURFACE-AT ?auto_24474 ?auto_24514 ) ( ON ?auto_24474 ?auto_24504 ) ( CLEAR ?auto_24474 ) ( not ( = ?auto_24471 ?auto_24474 ) ) ( not ( = ?auto_24471 ?auto_24504 ) ) ( not ( = ?auto_24474 ?auto_24504 ) ) ( not ( = ?auto_24483 ?auto_24516 ) ) ( IS-CRATE ?auto_24471 ) ( not ( = ?auto_24515 ?auto_24486 ) ) ( HOIST-AT ?auto_24494 ?auto_24515 ) ( AVAILABLE ?auto_24494 ) ( SURFACE-AT ?auto_24471 ?auto_24515 ) ( ON ?auto_24471 ?auto_24511 ) ( CLEAR ?auto_24471 ) ( not ( = ?auto_24472 ?auto_24471 ) ) ( not ( = ?auto_24472 ?auto_24511 ) ) ( not ( = ?auto_24471 ?auto_24511 ) ) ( not ( = ?auto_24483 ?auto_24494 ) ) ( IS-CRATE ?auto_24472 ) ( not ( = ?auto_24519 ?auto_24486 ) ) ( HOIST-AT ?auto_24518 ?auto_24519 ) ( AVAILABLE ?auto_24518 ) ( SURFACE-AT ?auto_24472 ?auto_24519 ) ( ON ?auto_24472 ?auto_24493 ) ( CLEAR ?auto_24472 ) ( not ( = ?auto_24473 ?auto_24472 ) ) ( not ( = ?auto_24473 ?auto_24493 ) ) ( not ( = ?auto_24472 ?auto_24493 ) ) ( not ( = ?auto_24483 ?auto_24518 ) ) ( IS-CRATE ?auto_24473 ) ( not ( = ?auto_24520 ?auto_24486 ) ) ( HOIST-AT ?auto_24522 ?auto_24520 ) ( AVAILABLE ?auto_24522 ) ( SURFACE-AT ?auto_24473 ?auto_24520 ) ( ON ?auto_24473 ?auto_24505 ) ( CLEAR ?auto_24473 ) ( not ( = ?auto_24470 ?auto_24473 ) ) ( not ( = ?auto_24470 ?auto_24505 ) ) ( not ( = ?auto_24473 ?auto_24505 ) ) ( not ( = ?auto_24483 ?auto_24522 ) ) ( IS-CRATE ?auto_24470 ) ( SURFACE-AT ?auto_24470 ?auto_24506 ) ( ON ?auto_24470 ?auto_24507 ) ( CLEAR ?auto_24470 ) ( not ( = ?auto_24469 ?auto_24470 ) ) ( not ( = ?auto_24469 ?auto_24507 ) ) ( not ( = ?auto_24470 ?auto_24507 ) ) ( IS-CRATE ?auto_24469 ) ( AVAILABLE ?auto_24495 ) ( SURFACE-AT ?auto_24469 ?auto_24492 ) ( ON ?auto_24469 ?auto_24496 ) ( CLEAR ?auto_24469 ) ( not ( = ?auto_24468 ?auto_24469 ) ) ( not ( = ?auto_24468 ?auto_24496 ) ) ( not ( = ?auto_24469 ?auto_24496 ) ) ( IS-CRATE ?auto_24468 ) ( not ( = ?auto_24508 ?auto_24486 ) ) ( HOIST-AT ?auto_24517 ?auto_24508 ) ( AVAILABLE ?auto_24517 ) ( SURFACE-AT ?auto_24468 ?auto_24508 ) ( ON ?auto_24468 ?auto_24521 ) ( CLEAR ?auto_24468 ) ( not ( = ?auto_24467 ?auto_24468 ) ) ( not ( = ?auto_24467 ?auto_24521 ) ) ( not ( = ?auto_24468 ?auto_24521 ) ) ( not ( = ?auto_24483 ?auto_24517 ) ) ( IS-CRATE ?auto_24467 ) ( not ( = ?auto_24498 ?auto_24486 ) ) ( HOIST-AT ?auto_24500 ?auto_24498 ) ( AVAILABLE ?auto_24500 ) ( SURFACE-AT ?auto_24467 ?auto_24498 ) ( ON ?auto_24467 ?auto_24501 ) ( CLEAR ?auto_24467 ) ( not ( = ?auto_24466 ?auto_24467 ) ) ( not ( = ?auto_24466 ?auto_24501 ) ) ( not ( = ?auto_24467 ?auto_24501 ) ) ( not ( = ?auto_24483 ?auto_24500 ) ) ( IS-CRATE ?auto_24466 ) ( AVAILABLE ?auto_24487 ) ( SURFACE-AT ?auto_24466 ?auto_24506 ) ( ON ?auto_24466 ?auto_24499 ) ( CLEAR ?auto_24466 ) ( not ( = ?auto_24465 ?auto_24466 ) ) ( not ( = ?auto_24465 ?auto_24499 ) ) ( not ( = ?auto_24466 ?auto_24499 ) ) ( SURFACE-AT ?auto_24464 ?auto_24486 ) ( CLEAR ?auto_24464 ) ( IS-CRATE ?auto_24465 ) ( AVAILABLE ?auto_24483 ) ( not ( = ?auto_24512 ?auto_24486 ) ) ( HOIST-AT ?auto_24523 ?auto_24512 ) ( AVAILABLE ?auto_24523 ) ( SURFACE-AT ?auto_24465 ?auto_24512 ) ( ON ?auto_24465 ?auto_24513 ) ( CLEAR ?auto_24465 ) ( TRUCK-AT ?auto_24485 ?auto_24486 ) ( not ( = ?auto_24464 ?auto_24465 ) ) ( not ( = ?auto_24464 ?auto_24513 ) ) ( not ( = ?auto_24465 ?auto_24513 ) ) ( not ( = ?auto_24483 ?auto_24523 ) ) ( not ( = ?auto_24464 ?auto_24466 ) ) ( not ( = ?auto_24464 ?auto_24499 ) ) ( not ( = ?auto_24466 ?auto_24513 ) ) ( not ( = ?auto_24506 ?auto_24512 ) ) ( not ( = ?auto_24487 ?auto_24523 ) ) ( not ( = ?auto_24499 ?auto_24513 ) ) ( not ( = ?auto_24464 ?auto_24467 ) ) ( not ( = ?auto_24464 ?auto_24501 ) ) ( not ( = ?auto_24465 ?auto_24467 ) ) ( not ( = ?auto_24465 ?auto_24501 ) ) ( not ( = ?auto_24467 ?auto_24499 ) ) ( not ( = ?auto_24467 ?auto_24513 ) ) ( not ( = ?auto_24498 ?auto_24506 ) ) ( not ( = ?auto_24498 ?auto_24512 ) ) ( not ( = ?auto_24500 ?auto_24487 ) ) ( not ( = ?auto_24500 ?auto_24523 ) ) ( not ( = ?auto_24501 ?auto_24499 ) ) ( not ( = ?auto_24501 ?auto_24513 ) ) ( not ( = ?auto_24464 ?auto_24468 ) ) ( not ( = ?auto_24464 ?auto_24521 ) ) ( not ( = ?auto_24465 ?auto_24468 ) ) ( not ( = ?auto_24465 ?auto_24521 ) ) ( not ( = ?auto_24466 ?auto_24468 ) ) ( not ( = ?auto_24466 ?auto_24521 ) ) ( not ( = ?auto_24468 ?auto_24501 ) ) ( not ( = ?auto_24468 ?auto_24499 ) ) ( not ( = ?auto_24468 ?auto_24513 ) ) ( not ( = ?auto_24508 ?auto_24498 ) ) ( not ( = ?auto_24508 ?auto_24506 ) ) ( not ( = ?auto_24508 ?auto_24512 ) ) ( not ( = ?auto_24517 ?auto_24500 ) ) ( not ( = ?auto_24517 ?auto_24487 ) ) ( not ( = ?auto_24517 ?auto_24523 ) ) ( not ( = ?auto_24521 ?auto_24501 ) ) ( not ( = ?auto_24521 ?auto_24499 ) ) ( not ( = ?auto_24521 ?auto_24513 ) ) ( not ( = ?auto_24464 ?auto_24469 ) ) ( not ( = ?auto_24464 ?auto_24496 ) ) ( not ( = ?auto_24465 ?auto_24469 ) ) ( not ( = ?auto_24465 ?auto_24496 ) ) ( not ( = ?auto_24466 ?auto_24469 ) ) ( not ( = ?auto_24466 ?auto_24496 ) ) ( not ( = ?auto_24467 ?auto_24469 ) ) ( not ( = ?auto_24467 ?auto_24496 ) ) ( not ( = ?auto_24469 ?auto_24521 ) ) ( not ( = ?auto_24469 ?auto_24501 ) ) ( not ( = ?auto_24469 ?auto_24499 ) ) ( not ( = ?auto_24469 ?auto_24513 ) ) ( not ( = ?auto_24492 ?auto_24508 ) ) ( not ( = ?auto_24492 ?auto_24498 ) ) ( not ( = ?auto_24492 ?auto_24506 ) ) ( not ( = ?auto_24492 ?auto_24512 ) ) ( not ( = ?auto_24495 ?auto_24517 ) ) ( not ( = ?auto_24495 ?auto_24500 ) ) ( not ( = ?auto_24495 ?auto_24487 ) ) ( not ( = ?auto_24495 ?auto_24523 ) ) ( not ( = ?auto_24496 ?auto_24521 ) ) ( not ( = ?auto_24496 ?auto_24501 ) ) ( not ( = ?auto_24496 ?auto_24499 ) ) ( not ( = ?auto_24496 ?auto_24513 ) ) ( not ( = ?auto_24464 ?auto_24470 ) ) ( not ( = ?auto_24464 ?auto_24507 ) ) ( not ( = ?auto_24465 ?auto_24470 ) ) ( not ( = ?auto_24465 ?auto_24507 ) ) ( not ( = ?auto_24466 ?auto_24470 ) ) ( not ( = ?auto_24466 ?auto_24507 ) ) ( not ( = ?auto_24467 ?auto_24470 ) ) ( not ( = ?auto_24467 ?auto_24507 ) ) ( not ( = ?auto_24468 ?auto_24470 ) ) ( not ( = ?auto_24468 ?auto_24507 ) ) ( not ( = ?auto_24470 ?auto_24496 ) ) ( not ( = ?auto_24470 ?auto_24521 ) ) ( not ( = ?auto_24470 ?auto_24501 ) ) ( not ( = ?auto_24470 ?auto_24499 ) ) ( not ( = ?auto_24470 ?auto_24513 ) ) ( not ( = ?auto_24507 ?auto_24496 ) ) ( not ( = ?auto_24507 ?auto_24521 ) ) ( not ( = ?auto_24507 ?auto_24501 ) ) ( not ( = ?auto_24507 ?auto_24499 ) ) ( not ( = ?auto_24507 ?auto_24513 ) ) ( not ( = ?auto_24464 ?auto_24473 ) ) ( not ( = ?auto_24464 ?auto_24505 ) ) ( not ( = ?auto_24465 ?auto_24473 ) ) ( not ( = ?auto_24465 ?auto_24505 ) ) ( not ( = ?auto_24466 ?auto_24473 ) ) ( not ( = ?auto_24466 ?auto_24505 ) ) ( not ( = ?auto_24467 ?auto_24473 ) ) ( not ( = ?auto_24467 ?auto_24505 ) ) ( not ( = ?auto_24468 ?auto_24473 ) ) ( not ( = ?auto_24468 ?auto_24505 ) ) ( not ( = ?auto_24469 ?auto_24473 ) ) ( not ( = ?auto_24469 ?auto_24505 ) ) ( not ( = ?auto_24473 ?auto_24507 ) ) ( not ( = ?auto_24473 ?auto_24496 ) ) ( not ( = ?auto_24473 ?auto_24521 ) ) ( not ( = ?auto_24473 ?auto_24501 ) ) ( not ( = ?auto_24473 ?auto_24499 ) ) ( not ( = ?auto_24473 ?auto_24513 ) ) ( not ( = ?auto_24520 ?auto_24506 ) ) ( not ( = ?auto_24520 ?auto_24492 ) ) ( not ( = ?auto_24520 ?auto_24508 ) ) ( not ( = ?auto_24520 ?auto_24498 ) ) ( not ( = ?auto_24520 ?auto_24512 ) ) ( not ( = ?auto_24522 ?auto_24487 ) ) ( not ( = ?auto_24522 ?auto_24495 ) ) ( not ( = ?auto_24522 ?auto_24517 ) ) ( not ( = ?auto_24522 ?auto_24500 ) ) ( not ( = ?auto_24522 ?auto_24523 ) ) ( not ( = ?auto_24505 ?auto_24507 ) ) ( not ( = ?auto_24505 ?auto_24496 ) ) ( not ( = ?auto_24505 ?auto_24521 ) ) ( not ( = ?auto_24505 ?auto_24501 ) ) ( not ( = ?auto_24505 ?auto_24499 ) ) ( not ( = ?auto_24505 ?auto_24513 ) ) ( not ( = ?auto_24464 ?auto_24472 ) ) ( not ( = ?auto_24464 ?auto_24493 ) ) ( not ( = ?auto_24465 ?auto_24472 ) ) ( not ( = ?auto_24465 ?auto_24493 ) ) ( not ( = ?auto_24466 ?auto_24472 ) ) ( not ( = ?auto_24466 ?auto_24493 ) ) ( not ( = ?auto_24467 ?auto_24472 ) ) ( not ( = ?auto_24467 ?auto_24493 ) ) ( not ( = ?auto_24468 ?auto_24472 ) ) ( not ( = ?auto_24468 ?auto_24493 ) ) ( not ( = ?auto_24469 ?auto_24472 ) ) ( not ( = ?auto_24469 ?auto_24493 ) ) ( not ( = ?auto_24470 ?auto_24472 ) ) ( not ( = ?auto_24470 ?auto_24493 ) ) ( not ( = ?auto_24472 ?auto_24505 ) ) ( not ( = ?auto_24472 ?auto_24507 ) ) ( not ( = ?auto_24472 ?auto_24496 ) ) ( not ( = ?auto_24472 ?auto_24521 ) ) ( not ( = ?auto_24472 ?auto_24501 ) ) ( not ( = ?auto_24472 ?auto_24499 ) ) ( not ( = ?auto_24472 ?auto_24513 ) ) ( not ( = ?auto_24519 ?auto_24520 ) ) ( not ( = ?auto_24519 ?auto_24506 ) ) ( not ( = ?auto_24519 ?auto_24492 ) ) ( not ( = ?auto_24519 ?auto_24508 ) ) ( not ( = ?auto_24519 ?auto_24498 ) ) ( not ( = ?auto_24519 ?auto_24512 ) ) ( not ( = ?auto_24518 ?auto_24522 ) ) ( not ( = ?auto_24518 ?auto_24487 ) ) ( not ( = ?auto_24518 ?auto_24495 ) ) ( not ( = ?auto_24518 ?auto_24517 ) ) ( not ( = ?auto_24518 ?auto_24500 ) ) ( not ( = ?auto_24518 ?auto_24523 ) ) ( not ( = ?auto_24493 ?auto_24505 ) ) ( not ( = ?auto_24493 ?auto_24507 ) ) ( not ( = ?auto_24493 ?auto_24496 ) ) ( not ( = ?auto_24493 ?auto_24521 ) ) ( not ( = ?auto_24493 ?auto_24501 ) ) ( not ( = ?auto_24493 ?auto_24499 ) ) ( not ( = ?auto_24493 ?auto_24513 ) ) ( not ( = ?auto_24464 ?auto_24471 ) ) ( not ( = ?auto_24464 ?auto_24511 ) ) ( not ( = ?auto_24465 ?auto_24471 ) ) ( not ( = ?auto_24465 ?auto_24511 ) ) ( not ( = ?auto_24466 ?auto_24471 ) ) ( not ( = ?auto_24466 ?auto_24511 ) ) ( not ( = ?auto_24467 ?auto_24471 ) ) ( not ( = ?auto_24467 ?auto_24511 ) ) ( not ( = ?auto_24468 ?auto_24471 ) ) ( not ( = ?auto_24468 ?auto_24511 ) ) ( not ( = ?auto_24469 ?auto_24471 ) ) ( not ( = ?auto_24469 ?auto_24511 ) ) ( not ( = ?auto_24470 ?auto_24471 ) ) ( not ( = ?auto_24470 ?auto_24511 ) ) ( not ( = ?auto_24473 ?auto_24471 ) ) ( not ( = ?auto_24473 ?auto_24511 ) ) ( not ( = ?auto_24471 ?auto_24493 ) ) ( not ( = ?auto_24471 ?auto_24505 ) ) ( not ( = ?auto_24471 ?auto_24507 ) ) ( not ( = ?auto_24471 ?auto_24496 ) ) ( not ( = ?auto_24471 ?auto_24521 ) ) ( not ( = ?auto_24471 ?auto_24501 ) ) ( not ( = ?auto_24471 ?auto_24499 ) ) ( not ( = ?auto_24471 ?auto_24513 ) ) ( not ( = ?auto_24515 ?auto_24519 ) ) ( not ( = ?auto_24515 ?auto_24520 ) ) ( not ( = ?auto_24515 ?auto_24506 ) ) ( not ( = ?auto_24515 ?auto_24492 ) ) ( not ( = ?auto_24515 ?auto_24508 ) ) ( not ( = ?auto_24515 ?auto_24498 ) ) ( not ( = ?auto_24515 ?auto_24512 ) ) ( not ( = ?auto_24494 ?auto_24518 ) ) ( not ( = ?auto_24494 ?auto_24522 ) ) ( not ( = ?auto_24494 ?auto_24487 ) ) ( not ( = ?auto_24494 ?auto_24495 ) ) ( not ( = ?auto_24494 ?auto_24517 ) ) ( not ( = ?auto_24494 ?auto_24500 ) ) ( not ( = ?auto_24494 ?auto_24523 ) ) ( not ( = ?auto_24511 ?auto_24493 ) ) ( not ( = ?auto_24511 ?auto_24505 ) ) ( not ( = ?auto_24511 ?auto_24507 ) ) ( not ( = ?auto_24511 ?auto_24496 ) ) ( not ( = ?auto_24511 ?auto_24521 ) ) ( not ( = ?auto_24511 ?auto_24501 ) ) ( not ( = ?auto_24511 ?auto_24499 ) ) ( not ( = ?auto_24511 ?auto_24513 ) ) ( not ( = ?auto_24464 ?auto_24474 ) ) ( not ( = ?auto_24464 ?auto_24504 ) ) ( not ( = ?auto_24465 ?auto_24474 ) ) ( not ( = ?auto_24465 ?auto_24504 ) ) ( not ( = ?auto_24466 ?auto_24474 ) ) ( not ( = ?auto_24466 ?auto_24504 ) ) ( not ( = ?auto_24467 ?auto_24474 ) ) ( not ( = ?auto_24467 ?auto_24504 ) ) ( not ( = ?auto_24468 ?auto_24474 ) ) ( not ( = ?auto_24468 ?auto_24504 ) ) ( not ( = ?auto_24469 ?auto_24474 ) ) ( not ( = ?auto_24469 ?auto_24504 ) ) ( not ( = ?auto_24470 ?auto_24474 ) ) ( not ( = ?auto_24470 ?auto_24504 ) ) ( not ( = ?auto_24473 ?auto_24474 ) ) ( not ( = ?auto_24473 ?auto_24504 ) ) ( not ( = ?auto_24472 ?auto_24474 ) ) ( not ( = ?auto_24472 ?auto_24504 ) ) ( not ( = ?auto_24474 ?auto_24511 ) ) ( not ( = ?auto_24474 ?auto_24493 ) ) ( not ( = ?auto_24474 ?auto_24505 ) ) ( not ( = ?auto_24474 ?auto_24507 ) ) ( not ( = ?auto_24474 ?auto_24496 ) ) ( not ( = ?auto_24474 ?auto_24521 ) ) ( not ( = ?auto_24474 ?auto_24501 ) ) ( not ( = ?auto_24474 ?auto_24499 ) ) ( not ( = ?auto_24474 ?auto_24513 ) ) ( not ( = ?auto_24514 ?auto_24515 ) ) ( not ( = ?auto_24514 ?auto_24519 ) ) ( not ( = ?auto_24514 ?auto_24520 ) ) ( not ( = ?auto_24514 ?auto_24506 ) ) ( not ( = ?auto_24514 ?auto_24492 ) ) ( not ( = ?auto_24514 ?auto_24508 ) ) ( not ( = ?auto_24514 ?auto_24498 ) ) ( not ( = ?auto_24514 ?auto_24512 ) ) ( not ( = ?auto_24516 ?auto_24494 ) ) ( not ( = ?auto_24516 ?auto_24518 ) ) ( not ( = ?auto_24516 ?auto_24522 ) ) ( not ( = ?auto_24516 ?auto_24487 ) ) ( not ( = ?auto_24516 ?auto_24495 ) ) ( not ( = ?auto_24516 ?auto_24517 ) ) ( not ( = ?auto_24516 ?auto_24500 ) ) ( not ( = ?auto_24516 ?auto_24523 ) ) ( not ( = ?auto_24504 ?auto_24511 ) ) ( not ( = ?auto_24504 ?auto_24493 ) ) ( not ( = ?auto_24504 ?auto_24505 ) ) ( not ( = ?auto_24504 ?auto_24507 ) ) ( not ( = ?auto_24504 ?auto_24496 ) ) ( not ( = ?auto_24504 ?auto_24521 ) ) ( not ( = ?auto_24504 ?auto_24501 ) ) ( not ( = ?auto_24504 ?auto_24499 ) ) ( not ( = ?auto_24504 ?auto_24513 ) ) ( not ( = ?auto_24464 ?auto_24475 ) ) ( not ( = ?auto_24464 ?auto_24502 ) ) ( not ( = ?auto_24465 ?auto_24475 ) ) ( not ( = ?auto_24465 ?auto_24502 ) ) ( not ( = ?auto_24466 ?auto_24475 ) ) ( not ( = ?auto_24466 ?auto_24502 ) ) ( not ( = ?auto_24467 ?auto_24475 ) ) ( not ( = ?auto_24467 ?auto_24502 ) ) ( not ( = ?auto_24468 ?auto_24475 ) ) ( not ( = ?auto_24468 ?auto_24502 ) ) ( not ( = ?auto_24469 ?auto_24475 ) ) ( not ( = ?auto_24469 ?auto_24502 ) ) ( not ( = ?auto_24470 ?auto_24475 ) ) ( not ( = ?auto_24470 ?auto_24502 ) ) ( not ( = ?auto_24473 ?auto_24475 ) ) ( not ( = ?auto_24473 ?auto_24502 ) ) ( not ( = ?auto_24472 ?auto_24475 ) ) ( not ( = ?auto_24472 ?auto_24502 ) ) ( not ( = ?auto_24471 ?auto_24475 ) ) ( not ( = ?auto_24471 ?auto_24502 ) ) ( not ( = ?auto_24475 ?auto_24504 ) ) ( not ( = ?auto_24475 ?auto_24511 ) ) ( not ( = ?auto_24475 ?auto_24493 ) ) ( not ( = ?auto_24475 ?auto_24505 ) ) ( not ( = ?auto_24475 ?auto_24507 ) ) ( not ( = ?auto_24475 ?auto_24496 ) ) ( not ( = ?auto_24475 ?auto_24521 ) ) ( not ( = ?auto_24475 ?auto_24501 ) ) ( not ( = ?auto_24475 ?auto_24499 ) ) ( not ( = ?auto_24475 ?auto_24513 ) ) ( not ( = ?auto_24502 ?auto_24504 ) ) ( not ( = ?auto_24502 ?auto_24511 ) ) ( not ( = ?auto_24502 ?auto_24493 ) ) ( not ( = ?auto_24502 ?auto_24505 ) ) ( not ( = ?auto_24502 ?auto_24507 ) ) ( not ( = ?auto_24502 ?auto_24496 ) ) ( not ( = ?auto_24502 ?auto_24521 ) ) ( not ( = ?auto_24502 ?auto_24501 ) ) ( not ( = ?auto_24502 ?auto_24499 ) ) ( not ( = ?auto_24502 ?auto_24513 ) ) ( not ( = ?auto_24464 ?auto_24476 ) ) ( not ( = ?auto_24464 ?auto_24497 ) ) ( not ( = ?auto_24465 ?auto_24476 ) ) ( not ( = ?auto_24465 ?auto_24497 ) ) ( not ( = ?auto_24466 ?auto_24476 ) ) ( not ( = ?auto_24466 ?auto_24497 ) ) ( not ( = ?auto_24467 ?auto_24476 ) ) ( not ( = ?auto_24467 ?auto_24497 ) ) ( not ( = ?auto_24468 ?auto_24476 ) ) ( not ( = ?auto_24468 ?auto_24497 ) ) ( not ( = ?auto_24469 ?auto_24476 ) ) ( not ( = ?auto_24469 ?auto_24497 ) ) ( not ( = ?auto_24470 ?auto_24476 ) ) ( not ( = ?auto_24470 ?auto_24497 ) ) ( not ( = ?auto_24473 ?auto_24476 ) ) ( not ( = ?auto_24473 ?auto_24497 ) ) ( not ( = ?auto_24472 ?auto_24476 ) ) ( not ( = ?auto_24472 ?auto_24497 ) ) ( not ( = ?auto_24471 ?auto_24476 ) ) ( not ( = ?auto_24471 ?auto_24497 ) ) ( not ( = ?auto_24474 ?auto_24476 ) ) ( not ( = ?auto_24474 ?auto_24497 ) ) ( not ( = ?auto_24476 ?auto_24502 ) ) ( not ( = ?auto_24476 ?auto_24504 ) ) ( not ( = ?auto_24476 ?auto_24511 ) ) ( not ( = ?auto_24476 ?auto_24493 ) ) ( not ( = ?auto_24476 ?auto_24505 ) ) ( not ( = ?auto_24476 ?auto_24507 ) ) ( not ( = ?auto_24476 ?auto_24496 ) ) ( not ( = ?auto_24476 ?auto_24521 ) ) ( not ( = ?auto_24476 ?auto_24501 ) ) ( not ( = ?auto_24476 ?auto_24499 ) ) ( not ( = ?auto_24476 ?auto_24513 ) ) ( not ( = ?auto_24497 ?auto_24502 ) ) ( not ( = ?auto_24497 ?auto_24504 ) ) ( not ( = ?auto_24497 ?auto_24511 ) ) ( not ( = ?auto_24497 ?auto_24493 ) ) ( not ( = ?auto_24497 ?auto_24505 ) ) ( not ( = ?auto_24497 ?auto_24507 ) ) ( not ( = ?auto_24497 ?auto_24496 ) ) ( not ( = ?auto_24497 ?auto_24521 ) ) ( not ( = ?auto_24497 ?auto_24501 ) ) ( not ( = ?auto_24497 ?auto_24499 ) ) ( not ( = ?auto_24497 ?auto_24513 ) ) ( not ( = ?auto_24464 ?auto_24477 ) ) ( not ( = ?auto_24464 ?auto_24510 ) ) ( not ( = ?auto_24465 ?auto_24477 ) ) ( not ( = ?auto_24465 ?auto_24510 ) ) ( not ( = ?auto_24466 ?auto_24477 ) ) ( not ( = ?auto_24466 ?auto_24510 ) ) ( not ( = ?auto_24467 ?auto_24477 ) ) ( not ( = ?auto_24467 ?auto_24510 ) ) ( not ( = ?auto_24468 ?auto_24477 ) ) ( not ( = ?auto_24468 ?auto_24510 ) ) ( not ( = ?auto_24469 ?auto_24477 ) ) ( not ( = ?auto_24469 ?auto_24510 ) ) ( not ( = ?auto_24470 ?auto_24477 ) ) ( not ( = ?auto_24470 ?auto_24510 ) ) ( not ( = ?auto_24473 ?auto_24477 ) ) ( not ( = ?auto_24473 ?auto_24510 ) ) ( not ( = ?auto_24472 ?auto_24477 ) ) ( not ( = ?auto_24472 ?auto_24510 ) ) ( not ( = ?auto_24471 ?auto_24477 ) ) ( not ( = ?auto_24471 ?auto_24510 ) ) ( not ( = ?auto_24474 ?auto_24477 ) ) ( not ( = ?auto_24474 ?auto_24510 ) ) ( not ( = ?auto_24475 ?auto_24477 ) ) ( not ( = ?auto_24475 ?auto_24510 ) ) ( not ( = ?auto_24477 ?auto_24497 ) ) ( not ( = ?auto_24477 ?auto_24502 ) ) ( not ( = ?auto_24477 ?auto_24504 ) ) ( not ( = ?auto_24477 ?auto_24511 ) ) ( not ( = ?auto_24477 ?auto_24493 ) ) ( not ( = ?auto_24477 ?auto_24505 ) ) ( not ( = ?auto_24477 ?auto_24507 ) ) ( not ( = ?auto_24477 ?auto_24496 ) ) ( not ( = ?auto_24477 ?auto_24521 ) ) ( not ( = ?auto_24477 ?auto_24501 ) ) ( not ( = ?auto_24477 ?auto_24499 ) ) ( not ( = ?auto_24477 ?auto_24513 ) ) ( not ( = ?auto_24490 ?auto_24492 ) ) ( not ( = ?auto_24490 ?auto_24514 ) ) ( not ( = ?auto_24490 ?auto_24515 ) ) ( not ( = ?auto_24490 ?auto_24519 ) ) ( not ( = ?auto_24490 ?auto_24520 ) ) ( not ( = ?auto_24490 ?auto_24506 ) ) ( not ( = ?auto_24490 ?auto_24508 ) ) ( not ( = ?auto_24490 ?auto_24498 ) ) ( not ( = ?auto_24490 ?auto_24512 ) ) ( not ( = ?auto_24488 ?auto_24495 ) ) ( not ( = ?auto_24488 ?auto_24516 ) ) ( not ( = ?auto_24488 ?auto_24494 ) ) ( not ( = ?auto_24488 ?auto_24518 ) ) ( not ( = ?auto_24488 ?auto_24522 ) ) ( not ( = ?auto_24488 ?auto_24487 ) ) ( not ( = ?auto_24488 ?auto_24517 ) ) ( not ( = ?auto_24488 ?auto_24500 ) ) ( not ( = ?auto_24488 ?auto_24523 ) ) ( not ( = ?auto_24510 ?auto_24497 ) ) ( not ( = ?auto_24510 ?auto_24502 ) ) ( not ( = ?auto_24510 ?auto_24504 ) ) ( not ( = ?auto_24510 ?auto_24511 ) ) ( not ( = ?auto_24510 ?auto_24493 ) ) ( not ( = ?auto_24510 ?auto_24505 ) ) ( not ( = ?auto_24510 ?auto_24507 ) ) ( not ( = ?auto_24510 ?auto_24496 ) ) ( not ( = ?auto_24510 ?auto_24521 ) ) ( not ( = ?auto_24510 ?auto_24501 ) ) ( not ( = ?auto_24510 ?auto_24499 ) ) ( not ( = ?auto_24510 ?auto_24513 ) ) ( not ( = ?auto_24464 ?auto_24479 ) ) ( not ( = ?auto_24464 ?auto_24491 ) ) ( not ( = ?auto_24465 ?auto_24479 ) ) ( not ( = ?auto_24465 ?auto_24491 ) ) ( not ( = ?auto_24466 ?auto_24479 ) ) ( not ( = ?auto_24466 ?auto_24491 ) ) ( not ( = ?auto_24467 ?auto_24479 ) ) ( not ( = ?auto_24467 ?auto_24491 ) ) ( not ( = ?auto_24468 ?auto_24479 ) ) ( not ( = ?auto_24468 ?auto_24491 ) ) ( not ( = ?auto_24469 ?auto_24479 ) ) ( not ( = ?auto_24469 ?auto_24491 ) ) ( not ( = ?auto_24470 ?auto_24479 ) ) ( not ( = ?auto_24470 ?auto_24491 ) ) ( not ( = ?auto_24473 ?auto_24479 ) ) ( not ( = ?auto_24473 ?auto_24491 ) ) ( not ( = ?auto_24472 ?auto_24479 ) ) ( not ( = ?auto_24472 ?auto_24491 ) ) ( not ( = ?auto_24471 ?auto_24479 ) ) ( not ( = ?auto_24471 ?auto_24491 ) ) ( not ( = ?auto_24474 ?auto_24479 ) ) ( not ( = ?auto_24474 ?auto_24491 ) ) ( not ( = ?auto_24475 ?auto_24479 ) ) ( not ( = ?auto_24475 ?auto_24491 ) ) ( not ( = ?auto_24476 ?auto_24479 ) ) ( not ( = ?auto_24476 ?auto_24491 ) ) ( not ( = ?auto_24479 ?auto_24510 ) ) ( not ( = ?auto_24479 ?auto_24497 ) ) ( not ( = ?auto_24479 ?auto_24502 ) ) ( not ( = ?auto_24479 ?auto_24504 ) ) ( not ( = ?auto_24479 ?auto_24511 ) ) ( not ( = ?auto_24479 ?auto_24493 ) ) ( not ( = ?auto_24479 ?auto_24505 ) ) ( not ( = ?auto_24479 ?auto_24507 ) ) ( not ( = ?auto_24479 ?auto_24496 ) ) ( not ( = ?auto_24479 ?auto_24521 ) ) ( not ( = ?auto_24479 ?auto_24501 ) ) ( not ( = ?auto_24479 ?auto_24499 ) ) ( not ( = ?auto_24479 ?auto_24513 ) ) ( not ( = ?auto_24491 ?auto_24510 ) ) ( not ( = ?auto_24491 ?auto_24497 ) ) ( not ( = ?auto_24491 ?auto_24502 ) ) ( not ( = ?auto_24491 ?auto_24504 ) ) ( not ( = ?auto_24491 ?auto_24511 ) ) ( not ( = ?auto_24491 ?auto_24493 ) ) ( not ( = ?auto_24491 ?auto_24505 ) ) ( not ( = ?auto_24491 ?auto_24507 ) ) ( not ( = ?auto_24491 ?auto_24496 ) ) ( not ( = ?auto_24491 ?auto_24521 ) ) ( not ( = ?auto_24491 ?auto_24501 ) ) ( not ( = ?auto_24491 ?auto_24499 ) ) ( not ( = ?auto_24491 ?auto_24513 ) ) ( not ( = ?auto_24464 ?auto_24478 ) ) ( not ( = ?auto_24464 ?auto_24503 ) ) ( not ( = ?auto_24465 ?auto_24478 ) ) ( not ( = ?auto_24465 ?auto_24503 ) ) ( not ( = ?auto_24466 ?auto_24478 ) ) ( not ( = ?auto_24466 ?auto_24503 ) ) ( not ( = ?auto_24467 ?auto_24478 ) ) ( not ( = ?auto_24467 ?auto_24503 ) ) ( not ( = ?auto_24468 ?auto_24478 ) ) ( not ( = ?auto_24468 ?auto_24503 ) ) ( not ( = ?auto_24469 ?auto_24478 ) ) ( not ( = ?auto_24469 ?auto_24503 ) ) ( not ( = ?auto_24470 ?auto_24478 ) ) ( not ( = ?auto_24470 ?auto_24503 ) ) ( not ( = ?auto_24473 ?auto_24478 ) ) ( not ( = ?auto_24473 ?auto_24503 ) ) ( not ( = ?auto_24472 ?auto_24478 ) ) ( not ( = ?auto_24472 ?auto_24503 ) ) ( not ( = ?auto_24471 ?auto_24478 ) ) ( not ( = ?auto_24471 ?auto_24503 ) ) ( not ( = ?auto_24474 ?auto_24478 ) ) ( not ( = ?auto_24474 ?auto_24503 ) ) ( not ( = ?auto_24475 ?auto_24478 ) ) ( not ( = ?auto_24475 ?auto_24503 ) ) ( not ( = ?auto_24476 ?auto_24478 ) ) ( not ( = ?auto_24476 ?auto_24503 ) ) ( not ( = ?auto_24477 ?auto_24478 ) ) ( not ( = ?auto_24477 ?auto_24503 ) ) ( not ( = ?auto_24478 ?auto_24491 ) ) ( not ( = ?auto_24478 ?auto_24510 ) ) ( not ( = ?auto_24478 ?auto_24497 ) ) ( not ( = ?auto_24478 ?auto_24502 ) ) ( not ( = ?auto_24478 ?auto_24504 ) ) ( not ( = ?auto_24478 ?auto_24511 ) ) ( not ( = ?auto_24478 ?auto_24493 ) ) ( not ( = ?auto_24478 ?auto_24505 ) ) ( not ( = ?auto_24478 ?auto_24507 ) ) ( not ( = ?auto_24478 ?auto_24496 ) ) ( not ( = ?auto_24478 ?auto_24521 ) ) ( not ( = ?auto_24478 ?auto_24501 ) ) ( not ( = ?auto_24478 ?auto_24499 ) ) ( not ( = ?auto_24478 ?auto_24513 ) ) ( not ( = ?auto_24489 ?auto_24506 ) ) ( not ( = ?auto_24489 ?auto_24490 ) ) ( not ( = ?auto_24489 ?auto_24492 ) ) ( not ( = ?auto_24489 ?auto_24514 ) ) ( not ( = ?auto_24489 ?auto_24515 ) ) ( not ( = ?auto_24489 ?auto_24519 ) ) ( not ( = ?auto_24489 ?auto_24520 ) ) ( not ( = ?auto_24489 ?auto_24508 ) ) ( not ( = ?auto_24489 ?auto_24498 ) ) ( not ( = ?auto_24489 ?auto_24512 ) ) ( not ( = ?auto_24509 ?auto_24487 ) ) ( not ( = ?auto_24509 ?auto_24488 ) ) ( not ( = ?auto_24509 ?auto_24495 ) ) ( not ( = ?auto_24509 ?auto_24516 ) ) ( not ( = ?auto_24509 ?auto_24494 ) ) ( not ( = ?auto_24509 ?auto_24518 ) ) ( not ( = ?auto_24509 ?auto_24522 ) ) ( not ( = ?auto_24509 ?auto_24517 ) ) ( not ( = ?auto_24509 ?auto_24500 ) ) ( not ( = ?auto_24509 ?auto_24523 ) ) ( not ( = ?auto_24503 ?auto_24491 ) ) ( not ( = ?auto_24503 ?auto_24510 ) ) ( not ( = ?auto_24503 ?auto_24497 ) ) ( not ( = ?auto_24503 ?auto_24502 ) ) ( not ( = ?auto_24503 ?auto_24504 ) ) ( not ( = ?auto_24503 ?auto_24511 ) ) ( not ( = ?auto_24503 ?auto_24493 ) ) ( not ( = ?auto_24503 ?auto_24505 ) ) ( not ( = ?auto_24503 ?auto_24507 ) ) ( not ( = ?auto_24503 ?auto_24496 ) ) ( not ( = ?auto_24503 ?auto_24521 ) ) ( not ( = ?auto_24503 ?auto_24501 ) ) ( not ( = ?auto_24503 ?auto_24499 ) ) ( not ( = ?auto_24503 ?auto_24513 ) ) ( not ( = ?auto_24464 ?auto_24480 ) ) ( not ( = ?auto_24464 ?auto_24482 ) ) ( not ( = ?auto_24465 ?auto_24480 ) ) ( not ( = ?auto_24465 ?auto_24482 ) ) ( not ( = ?auto_24466 ?auto_24480 ) ) ( not ( = ?auto_24466 ?auto_24482 ) ) ( not ( = ?auto_24467 ?auto_24480 ) ) ( not ( = ?auto_24467 ?auto_24482 ) ) ( not ( = ?auto_24468 ?auto_24480 ) ) ( not ( = ?auto_24468 ?auto_24482 ) ) ( not ( = ?auto_24469 ?auto_24480 ) ) ( not ( = ?auto_24469 ?auto_24482 ) ) ( not ( = ?auto_24470 ?auto_24480 ) ) ( not ( = ?auto_24470 ?auto_24482 ) ) ( not ( = ?auto_24473 ?auto_24480 ) ) ( not ( = ?auto_24473 ?auto_24482 ) ) ( not ( = ?auto_24472 ?auto_24480 ) ) ( not ( = ?auto_24472 ?auto_24482 ) ) ( not ( = ?auto_24471 ?auto_24480 ) ) ( not ( = ?auto_24471 ?auto_24482 ) ) ( not ( = ?auto_24474 ?auto_24480 ) ) ( not ( = ?auto_24474 ?auto_24482 ) ) ( not ( = ?auto_24475 ?auto_24480 ) ) ( not ( = ?auto_24475 ?auto_24482 ) ) ( not ( = ?auto_24476 ?auto_24480 ) ) ( not ( = ?auto_24476 ?auto_24482 ) ) ( not ( = ?auto_24477 ?auto_24480 ) ) ( not ( = ?auto_24477 ?auto_24482 ) ) ( not ( = ?auto_24479 ?auto_24480 ) ) ( not ( = ?auto_24479 ?auto_24482 ) ) ( not ( = ?auto_24480 ?auto_24503 ) ) ( not ( = ?auto_24480 ?auto_24491 ) ) ( not ( = ?auto_24480 ?auto_24510 ) ) ( not ( = ?auto_24480 ?auto_24497 ) ) ( not ( = ?auto_24480 ?auto_24502 ) ) ( not ( = ?auto_24480 ?auto_24504 ) ) ( not ( = ?auto_24480 ?auto_24511 ) ) ( not ( = ?auto_24480 ?auto_24493 ) ) ( not ( = ?auto_24480 ?auto_24505 ) ) ( not ( = ?auto_24480 ?auto_24507 ) ) ( not ( = ?auto_24480 ?auto_24496 ) ) ( not ( = ?auto_24480 ?auto_24521 ) ) ( not ( = ?auto_24480 ?auto_24501 ) ) ( not ( = ?auto_24480 ?auto_24499 ) ) ( not ( = ?auto_24480 ?auto_24513 ) ) ( not ( = ?auto_24481 ?auto_24489 ) ) ( not ( = ?auto_24481 ?auto_24506 ) ) ( not ( = ?auto_24481 ?auto_24490 ) ) ( not ( = ?auto_24481 ?auto_24492 ) ) ( not ( = ?auto_24481 ?auto_24514 ) ) ( not ( = ?auto_24481 ?auto_24515 ) ) ( not ( = ?auto_24481 ?auto_24519 ) ) ( not ( = ?auto_24481 ?auto_24520 ) ) ( not ( = ?auto_24481 ?auto_24508 ) ) ( not ( = ?auto_24481 ?auto_24498 ) ) ( not ( = ?auto_24481 ?auto_24512 ) ) ( not ( = ?auto_24484 ?auto_24509 ) ) ( not ( = ?auto_24484 ?auto_24487 ) ) ( not ( = ?auto_24484 ?auto_24488 ) ) ( not ( = ?auto_24484 ?auto_24495 ) ) ( not ( = ?auto_24484 ?auto_24516 ) ) ( not ( = ?auto_24484 ?auto_24494 ) ) ( not ( = ?auto_24484 ?auto_24518 ) ) ( not ( = ?auto_24484 ?auto_24522 ) ) ( not ( = ?auto_24484 ?auto_24517 ) ) ( not ( = ?auto_24484 ?auto_24500 ) ) ( not ( = ?auto_24484 ?auto_24523 ) ) ( not ( = ?auto_24482 ?auto_24503 ) ) ( not ( = ?auto_24482 ?auto_24491 ) ) ( not ( = ?auto_24482 ?auto_24510 ) ) ( not ( = ?auto_24482 ?auto_24497 ) ) ( not ( = ?auto_24482 ?auto_24502 ) ) ( not ( = ?auto_24482 ?auto_24504 ) ) ( not ( = ?auto_24482 ?auto_24511 ) ) ( not ( = ?auto_24482 ?auto_24493 ) ) ( not ( = ?auto_24482 ?auto_24505 ) ) ( not ( = ?auto_24482 ?auto_24507 ) ) ( not ( = ?auto_24482 ?auto_24496 ) ) ( not ( = ?auto_24482 ?auto_24521 ) ) ( not ( = ?auto_24482 ?auto_24501 ) ) ( not ( = ?auto_24482 ?auto_24499 ) ) ( not ( = ?auto_24482 ?auto_24513 ) ) )
    :subtasks
    ( ( MAKE-15CRATE ?auto_24464 ?auto_24465 ?auto_24466 ?auto_24467 ?auto_24468 ?auto_24469 ?auto_24470 ?auto_24473 ?auto_24472 ?auto_24471 ?auto_24474 ?auto_24475 ?auto_24476 ?auto_24477 ?auto_24479 ?auto_24478 )
      ( MAKE-1CRATE ?auto_24478 ?auto_24480 )
      ( MAKE-16CRATE-VERIFY ?auto_24464 ?auto_24465 ?auto_24466 ?auto_24467 ?auto_24468 ?auto_24469 ?auto_24470 ?auto_24473 ?auto_24472 ?auto_24471 ?auto_24474 ?auto_24475 ?auto_24476 ?auto_24477 ?auto_24479 ?auto_24478 ?auto_24480 ) )
  )

)

