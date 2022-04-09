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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23687 - SURFACE
      ?auto_23688 - SURFACE
      ?auto_23689 - SURFACE
    )
    :vars
    (
      ?auto_23694 - HOIST
      ?auto_23695 - PLACE
      ?auto_23691 - PLACE
      ?auto_23693 - HOIST
      ?auto_23692 - SURFACE
      ?auto_23696 - PLACE
      ?auto_23697 - HOIST
      ?auto_23698 - SURFACE
      ?auto_23690 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23694 ?auto_23695 ) ( IS-CRATE ?auto_23689 ) ( not ( = ?auto_23691 ?auto_23695 ) ) ( HOIST-AT ?auto_23693 ?auto_23691 ) ( AVAILABLE ?auto_23693 ) ( SURFACE-AT ?auto_23689 ?auto_23691 ) ( ON ?auto_23689 ?auto_23692 ) ( CLEAR ?auto_23689 ) ( not ( = ?auto_23688 ?auto_23689 ) ) ( not ( = ?auto_23688 ?auto_23692 ) ) ( not ( = ?auto_23689 ?auto_23692 ) ) ( not ( = ?auto_23694 ?auto_23693 ) ) ( SURFACE-AT ?auto_23687 ?auto_23695 ) ( CLEAR ?auto_23687 ) ( IS-CRATE ?auto_23688 ) ( AVAILABLE ?auto_23694 ) ( not ( = ?auto_23696 ?auto_23695 ) ) ( HOIST-AT ?auto_23697 ?auto_23696 ) ( AVAILABLE ?auto_23697 ) ( SURFACE-AT ?auto_23688 ?auto_23696 ) ( ON ?auto_23688 ?auto_23698 ) ( CLEAR ?auto_23688 ) ( TRUCK-AT ?auto_23690 ?auto_23695 ) ( not ( = ?auto_23687 ?auto_23688 ) ) ( not ( = ?auto_23687 ?auto_23698 ) ) ( not ( = ?auto_23688 ?auto_23698 ) ) ( not ( = ?auto_23694 ?auto_23697 ) ) ( not ( = ?auto_23687 ?auto_23689 ) ) ( not ( = ?auto_23687 ?auto_23692 ) ) ( not ( = ?auto_23689 ?auto_23698 ) ) ( not ( = ?auto_23691 ?auto_23696 ) ) ( not ( = ?auto_23693 ?auto_23697 ) ) ( not ( = ?auto_23692 ?auto_23698 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23687 ?auto_23688 )
      ( MAKE-1CRATE ?auto_23688 ?auto_23689 )
      ( MAKE-2CRATE-VERIFY ?auto_23687 ?auto_23688 ?auto_23689 ) )
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
      ?auto_23717 - PLACE
      ?auto_23722 - PLACE
      ?auto_23718 - HOIST
      ?auto_23720 - SURFACE
      ?auto_23724 - PLACE
      ?auto_23723 - HOIST
      ?auto_23725 - SURFACE
      ?auto_23728 - PLACE
      ?auto_23726 - HOIST
      ?auto_23727 - SURFACE
      ?auto_23721 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23719 ?auto_23717 ) ( IS-CRATE ?auto_23716 ) ( not ( = ?auto_23722 ?auto_23717 ) ) ( HOIST-AT ?auto_23718 ?auto_23722 ) ( AVAILABLE ?auto_23718 ) ( SURFACE-AT ?auto_23716 ?auto_23722 ) ( ON ?auto_23716 ?auto_23720 ) ( CLEAR ?auto_23716 ) ( not ( = ?auto_23715 ?auto_23716 ) ) ( not ( = ?auto_23715 ?auto_23720 ) ) ( not ( = ?auto_23716 ?auto_23720 ) ) ( not ( = ?auto_23719 ?auto_23718 ) ) ( IS-CRATE ?auto_23715 ) ( not ( = ?auto_23724 ?auto_23717 ) ) ( HOIST-AT ?auto_23723 ?auto_23724 ) ( AVAILABLE ?auto_23723 ) ( SURFACE-AT ?auto_23715 ?auto_23724 ) ( ON ?auto_23715 ?auto_23725 ) ( CLEAR ?auto_23715 ) ( not ( = ?auto_23714 ?auto_23715 ) ) ( not ( = ?auto_23714 ?auto_23725 ) ) ( not ( = ?auto_23715 ?auto_23725 ) ) ( not ( = ?auto_23719 ?auto_23723 ) ) ( SURFACE-AT ?auto_23713 ?auto_23717 ) ( CLEAR ?auto_23713 ) ( IS-CRATE ?auto_23714 ) ( AVAILABLE ?auto_23719 ) ( not ( = ?auto_23728 ?auto_23717 ) ) ( HOIST-AT ?auto_23726 ?auto_23728 ) ( AVAILABLE ?auto_23726 ) ( SURFACE-AT ?auto_23714 ?auto_23728 ) ( ON ?auto_23714 ?auto_23727 ) ( CLEAR ?auto_23714 ) ( TRUCK-AT ?auto_23721 ?auto_23717 ) ( not ( = ?auto_23713 ?auto_23714 ) ) ( not ( = ?auto_23713 ?auto_23727 ) ) ( not ( = ?auto_23714 ?auto_23727 ) ) ( not ( = ?auto_23719 ?auto_23726 ) ) ( not ( = ?auto_23713 ?auto_23715 ) ) ( not ( = ?auto_23713 ?auto_23725 ) ) ( not ( = ?auto_23715 ?auto_23727 ) ) ( not ( = ?auto_23724 ?auto_23728 ) ) ( not ( = ?auto_23723 ?auto_23726 ) ) ( not ( = ?auto_23725 ?auto_23727 ) ) ( not ( = ?auto_23713 ?auto_23716 ) ) ( not ( = ?auto_23713 ?auto_23720 ) ) ( not ( = ?auto_23714 ?auto_23716 ) ) ( not ( = ?auto_23714 ?auto_23720 ) ) ( not ( = ?auto_23716 ?auto_23725 ) ) ( not ( = ?auto_23716 ?auto_23727 ) ) ( not ( = ?auto_23722 ?auto_23724 ) ) ( not ( = ?auto_23722 ?auto_23728 ) ) ( not ( = ?auto_23718 ?auto_23723 ) ) ( not ( = ?auto_23718 ?auto_23726 ) ) ( not ( = ?auto_23720 ?auto_23725 ) ) ( not ( = ?auto_23720 ?auto_23727 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23713 ?auto_23714 ?auto_23715 )
      ( MAKE-1CRATE ?auto_23715 ?auto_23716 )
      ( MAKE-3CRATE-VERIFY ?auto_23713 ?auto_23714 ?auto_23715 ?auto_23716 ) )
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
      ?auto_23749 - HOIST
      ?auto_23754 - PLACE
      ?auto_23753 - PLACE
      ?auto_23750 - HOIST
      ?auto_23751 - SURFACE
      ?auto_23761 - PLACE
      ?auto_23757 - HOIST
      ?auto_23762 - SURFACE
      ?auto_23758 - PLACE
      ?auto_23755 - HOIST
      ?auto_23763 - SURFACE
      ?auto_23759 - PLACE
      ?auto_23760 - HOIST
      ?auto_23756 - SURFACE
      ?auto_23752 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23749 ?auto_23754 ) ( IS-CRATE ?auto_23748 ) ( not ( = ?auto_23753 ?auto_23754 ) ) ( HOIST-AT ?auto_23750 ?auto_23753 ) ( AVAILABLE ?auto_23750 ) ( SURFACE-AT ?auto_23748 ?auto_23753 ) ( ON ?auto_23748 ?auto_23751 ) ( CLEAR ?auto_23748 ) ( not ( = ?auto_23747 ?auto_23748 ) ) ( not ( = ?auto_23747 ?auto_23751 ) ) ( not ( = ?auto_23748 ?auto_23751 ) ) ( not ( = ?auto_23749 ?auto_23750 ) ) ( IS-CRATE ?auto_23747 ) ( not ( = ?auto_23761 ?auto_23754 ) ) ( HOIST-AT ?auto_23757 ?auto_23761 ) ( AVAILABLE ?auto_23757 ) ( SURFACE-AT ?auto_23747 ?auto_23761 ) ( ON ?auto_23747 ?auto_23762 ) ( CLEAR ?auto_23747 ) ( not ( = ?auto_23746 ?auto_23747 ) ) ( not ( = ?auto_23746 ?auto_23762 ) ) ( not ( = ?auto_23747 ?auto_23762 ) ) ( not ( = ?auto_23749 ?auto_23757 ) ) ( IS-CRATE ?auto_23746 ) ( not ( = ?auto_23758 ?auto_23754 ) ) ( HOIST-AT ?auto_23755 ?auto_23758 ) ( AVAILABLE ?auto_23755 ) ( SURFACE-AT ?auto_23746 ?auto_23758 ) ( ON ?auto_23746 ?auto_23763 ) ( CLEAR ?auto_23746 ) ( not ( = ?auto_23745 ?auto_23746 ) ) ( not ( = ?auto_23745 ?auto_23763 ) ) ( not ( = ?auto_23746 ?auto_23763 ) ) ( not ( = ?auto_23749 ?auto_23755 ) ) ( SURFACE-AT ?auto_23744 ?auto_23754 ) ( CLEAR ?auto_23744 ) ( IS-CRATE ?auto_23745 ) ( AVAILABLE ?auto_23749 ) ( not ( = ?auto_23759 ?auto_23754 ) ) ( HOIST-AT ?auto_23760 ?auto_23759 ) ( AVAILABLE ?auto_23760 ) ( SURFACE-AT ?auto_23745 ?auto_23759 ) ( ON ?auto_23745 ?auto_23756 ) ( CLEAR ?auto_23745 ) ( TRUCK-AT ?auto_23752 ?auto_23754 ) ( not ( = ?auto_23744 ?auto_23745 ) ) ( not ( = ?auto_23744 ?auto_23756 ) ) ( not ( = ?auto_23745 ?auto_23756 ) ) ( not ( = ?auto_23749 ?auto_23760 ) ) ( not ( = ?auto_23744 ?auto_23746 ) ) ( not ( = ?auto_23744 ?auto_23763 ) ) ( not ( = ?auto_23746 ?auto_23756 ) ) ( not ( = ?auto_23758 ?auto_23759 ) ) ( not ( = ?auto_23755 ?auto_23760 ) ) ( not ( = ?auto_23763 ?auto_23756 ) ) ( not ( = ?auto_23744 ?auto_23747 ) ) ( not ( = ?auto_23744 ?auto_23762 ) ) ( not ( = ?auto_23745 ?auto_23747 ) ) ( not ( = ?auto_23745 ?auto_23762 ) ) ( not ( = ?auto_23747 ?auto_23763 ) ) ( not ( = ?auto_23747 ?auto_23756 ) ) ( not ( = ?auto_23761 ?auto_23758 ) ) ( not ( = ?auto_23761 ?auto_23759 ) ) ( not ( = ?auto_23757 ?auto_23755 ) ) ( not ( = ?auto_23757 ?auto_23760 ) ) ( not ( = ?auto_23762 ?auto_23763 ) ) ( not ( = ?auto_23762 ?auto_23756 ) ) ( not ( = ?auto_23744 ?auto_23748 ) ) ( not ( = ?auto_23744 ?auto_23751 ) ) ( not ( = ?auto_23745 ?auto_23748 ) ) ( not ( = ?auto_23745 ?auto_23751 ) ) ( not ( = ?auto_23746 ?auto_23748 ) ) ( not ( = ?auto_23746 ?auto_23751 ) ) ( not ( = ?auto_23748 ?auto_23762 ) ) ( not ( = ?auto_23748 ?auto_23763 ) ) ( not ( = ?auto_23748 ?auto_23756 ) ) ( not ( = ?auto_23753 ?auto_23761 ) ) ( not ( = ?auto_23753 ?auto_23758 ) ) ( not ( = ?auto_23753 ?auto_23759 ) ) ( not ( = ?auto_23750 ?auto_23757 ) ) ( not ( = ?auto_23750 ?auto_23755 ) ) ( not ( = ?auto_23750 ?auto_23760 ) ) ( not ( = ?auto_23751 ?auto_23762 ) ) ( not ( = ?auto_23751 ?auto_23763 ) ) ( not ( = ?auto_23751 ?auto_23756 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_23744 ?auto_23745 ?auto_23746 ?auto_23747 )
      ( MAKE-1CRATE ?auto_23747 ?auto_23748 )
      ( MAKE-4CRATE-VERIFY ?auto_23744 ?auto_23745 ?auto_23746 ?auto_23747 ?auto_23748 ) )
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
      ?auto_23790 - HOIST
      ?auto_23791 - PLACE
      ?auto_23789 - PLACE
      ?auto_23787 - HOIST
      ?auto_23786 - SURFACE
      ?auto_23800 - PLACE
      ?auto_23793 - HOIST
      ?auto_23797 - SURFACE
      ?auto_23803 - PLACE
      ?auto_23799 - HOIST
      ?auto_23801 - SURFACE
      ?auto_23794 - PLACE
      ?auto_23796 - HOIST
      ?auto_23795 - SURFACE
      ?auto_23802 - PLACE
      ?auto_23792 - HOIST
      ?auto_23798 - SURFACE
      ?auto_23788 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23790 ?auto_23791 ) ( IS-CRATE ?auto_23785 ) ( not ( = ?auto_23789 ?auto_23791 ) ) ( HOIST-AT ?auto_23787 ?auto_23789 ) ( AVAILABLE ?auto_23787 ) ( SURFACE-AT ?auto_23785 ?auto_23789 ) ( ON ?auto_23785 ?auto_23786 ) ( CLEAR ?auto_23785 ) ( not ( = ?auto_23784 ?auto_23785 ) ) ( not ( = ?auto_23784 ?auto_23786 ) ) ( not ( = ?auto_23785 ?auto_23786 ) ) ( not ( = ?auto_23790 ?auto_23787 ) ) ( IS-CRATE ?auto_23784 ) ( not ( = ?auto_23800 ?auto_23791 ) ) ( HOIST-AT ?auto_23793 ?auto_23800 ) ( AVAILABLE ?auto_23793 ) ( SURFACE-AT ?auto_23784 ?auto_23800 ) ( ON ?auto_23784 ?auto_23797 ) ( CLEAR ?auto_23784 ) ( not ( = ?auto_23783 ?auto_23784 ) ) ( not ( = ?auto_23783 ?auto_23797 ) ) ( not ( = ?auto_23784 ?auto_23797 ) ) ( not ( = ?auto_23790 ?auto_23793 ) ) ( IS-CRATE ?auto_23783 ) ( not ( = ?auto_23803 ?auto_23791 ) ) ( HOIST-AT ?auto_23799 ?auto_23803 ) ( AVAILABLE ?auto_23799 ) ( SURFACE-AT ?auto_23783 ?auto_23803 ) ( ON ?auto_23783 ?auto_23801 ) ( CLEAR ?auto_23783 ) ( not ( = ?auto_23782 ?auto_23783 ) ) ( not ( = ?auto_23782 ?auto_23801 ) ) ( not ( = ?auto_23783 ?auto_23801 ) ) ( not ( = ?auto_23790 ?auto_23799 ) ) ( IS-CRATE ?auto_23782 ) ( not ( = ?auto_23794 ?auto_23791 ) ) ( HOIST-AT ?auto_23796 ?auto_23794 ) ( AVAILABLE ?auto_23796 ) ( SURFACE-AT ?auto_23782 ?auto_23794 ) ( ON ?auto_23782 ?auto_23795 ) ( CLEAR ?auto_23782 ) ( not ( = ?auto_23781 ?auto_23782 ) ) ( not ( = ?auto_23781 ?auto_23795 ) ) ( not ( = ?auto_23782 ?auto_23795 ) ) ( not ( = ?auto_23790 ?auto_23796 ) ) ( SURFACE-AT ?auto_23780 ?auto_23791 ) ( CLEAR ?auto_23780 ) ( IS-CRATE ?auto_23781 ) ( AVAILABLE ?auto_23790 ) ( not ( = ?auto_23802 ?auto_23791 ) ) ( HOIST-AT ?auto_23792 ?auto_23802 ) ( AVAILABLE ?auto_23792 ) ( SURFACE-AT ?auto_23781 ?auto_23802 ) ( ON ?auto_23781 ?auto_23798 ) ( CLEAR ?auto_23781 ) ( TRUCK-AT ?auto_23788 ?auto_23791 ) ( not ( = ?auto_23780 ?auto_23781 ) ) ( not ( = ?auto_23780 ?auto_23798 ) ) ( not ( = ?auto_23781 ?auto_23798 ) ) ( not ( = ?auto_23790 ?auto_23792 ) ) ( not ( = ?auto_23780 ?auto_23782 ) ) ( not ( = ?auto_23780 ?auto_23795 ) ) ( not ( = ?auto_23782 ?auto_23798 ) ) ( not ( = ?auto_23794 ?auto_23802 ) ) ( not ( = ?auto_23796 ?auto_23792 ) ) ( not ( = ?auto_23795 ?auto_23798 ) ) ( not ( = ?auto_23780 ?auto_23783 ) ) ( not ( = ?auto_23780 ?auto_23801 ) ) ( not ( = ?auto_23781 ?auto_23783 ) ) ( not ( = ?auto_23781 ?auto_23801 ) ) ( not ( = ?auto_23783 ?auto_23795 ) ) ( not ( = ?auto_23783 ?auto_23798 ) ) ( not ( = ?auto_23803 ?auto_23794 ) ) ( not ( = ?auto_23803 ?auto_23802 ) ) ( not ( = ?auto_23799 ?auto_23796 ) ) ( not ( = ?auto_23799 ?auto_23792 ) ) ( not ( = ?auto_23801 ?auto_23795 ) ) ( not ( = ?auto_23801 ?auto_23798 ) ) ( not ( = ?auto_23780 ?auto_23784 ) ) ( not ( = ?auto_23780 ?auto_23797 ) ) ( not ( = ?auto_23781 ?auto_23784 ) ) ( not ( = ?auto_23781 ?auto_23797 ) ) ( not ( = ?auto_23782 ?auto_23784 ) ) ( not ( = ?auto_23782 ?auto_23797 ) ) ( not ( = ?auto_23784 ?auto_23801 ) ) ( not ( = ?auto_23784 ?auto_23795 ) ) ( not ( = ?auto_23784 ?auto_23798 ) ) ( not ( = ?auto_23800 ?auto_23803 ) ) ( not ( = ?auto_23800 ?auto_23794 ) ) ( not ( = ?auto_23800 ?auto_23802 ) ) ( not ( = ?auto_23793 ?auto_23799 ) ) ( not ( = ?auto_23793 ?auto_23796 ) ) ( not ( = ?auto_23793 ?auto_23792 ) ) ( not ( = ?auto_23797 ?auto_23801 ) ) ( not ( = ?auto_23797 ?auto_23795 ) ) ( not ( = ?auto_23797 ?auto_23798 ) ) ( not ( = ?auto_23780 ?auto_23785 ) ) ( not ( = ?auto_23780 ?auto_23786 ) ) ( not ( = ?auto_23781 ?auto_23785 ) ) ( not ( = ?auto_23781 ?auto_23786 ) ) ( not ( = ?auto_23782 ?auto_23785 ) ) ( not ( = ?auto_23782 ?auto_23786 ) ) ( not ( = ?auto_23783 ?auto_23785 ) ) ( not ( = ?auto_23783 ?auto_23786 ) ) ( not ( = ?auto_23785 ?auto_23797 ) ) ( not ( = ?auto_23785 ?auto_23801 ) ) ( not ( = ?auto_23785 ?auto_23795 ) ) ( not ( = ?auto_23785 ?auto_23798 ) ) ( not ( = ?auto_23789 ?auto_23800 ) ) ( not ( = ?auto_23789 ?auto_23803 ) ) ( not ( = ?auto_23789 ?auto_23794 ) ) ( not ( = ?auto_23789 ?auto_23802 ) ) ( not ( = ?auto_23787 ?auto_23793 ) ) ( not ( = ?auto_23787 ?auto_23799 ) ) ( not ( = ?auto_23787 ?auto_23796 ) ) ( not ( = ?auto_23787 ?auto_23792 ) ) ( not ( = ?auto_23786 ?auto_23797 ) ) ( not ( = ?auto_23786 ?auto_23801 ) ) ( not ( = ?auto_23786 ?auto_23795 ) ) ( not ( = ?auto_23786 ?auto_23798 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_23780 ?auto_23781 ?auto_23782 ?auto_23783 ?auto_23784 )
      ( MAKE-1CRATE ?auto_23784 ?auto_23785 )
      ( MAKE-5CRATE-VERIFY ?auto_23780 ?auto_23781 ?auto_23782 ?auto_23783 ?auto_23784 ?auto_23785 ) )
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
      ?auto_23833 - HOIST
      ?auto_23830 - PLACE
      ?auto_23831 - PLACE
      ?auto_23828 - HOIST
      ?auto_23832 - SURFACE
      ?auto_23836 - PLACE
      ?auto_23835 - HOIST
      ?auto_23841 - SURFACE
      ?auto_23842 - PLACE
      ?auto_23834 - HOIST
      ?auto_23838 - SURFACE
      ?auto_23843 - PLACE
      ?auto_23840 - HOIST
      ?auto_23845 - SURFACE
      ?auto_23837 - SURFACE
      ?auto_23846 - PLACE
      ?auto_23844 - HOIST
      ?auto_23839 - SURFACE
      ?auto_23829 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23833 ?auto_23830 ) ( IS-CRATE ?auto_23827 ) ( not ( = ?auto_23831 ?auto_23830 ) ) ( HOIST-AT ?auto_23828 ?auto_23831 ) ( SURFACE-AT ?auto_23827 ?auto_23831 ) ( ON ?auto_23827 ?auto_23832 ) ( CLEAR ?auto_23827 ) ( not ( = ?auto_23826 ?auto_23827 ) ) ( not ( = ?auto_23826 ?auto_23832 ) ) ( not ( = ?auto_23827 ?auto_23832 ) ) ( not ( = ?auto_23833 ?auto_23828 ) ) ( IS-CRATE ?auto_23826 ) ( not ( = ?auto_23836 ?auto_23830 ) ) ( HOIST-AT ?auto_23835 ?auto_23836 ) ( AVAILABLE ?auto_23835 ) ( SURFACE-AT ?auto_23826 ?auto_23836 ) ( ON ?auto_23826 ?auto_23841 ) ( CLEAR ?auto_23826 ) ( not ( = ?auto_23825 ?auto_23826 ) ) ( not ( = ?auto_23825 ?auto_23841 ) ) ( not ( = ?auto_23826 ?auto_23841 ) ) ( not ( = ?auto_23833 ?auto_23835 ) ) ( IS-CRATE ?auto_23825 ) ( not ( = ?auto_23842 ?auto_23830 ) ) ( HOIST-AT ?auto_23834 ?auto_23842 ) ( AVAILABLE ?auto_23834 ) ( SURFACE-AT ?auto_23825 ?auto_23842 ) ( ON ?auto_23825 ?auto_23838 ) ( CLEAR ?auto_23825 ) ( not ( = ?auto_23824 ?auto_23825 ) ) ( not ( = ?auto_23824 ?auto_23838 ) ) ( not ( = ?auto_23825 ?auto_23838 ) ) ( not ( = ?auto_23833 ?auto_23834 ) ) ( IS-CRATE ?auto_23824 ) ( not ( = ?auto_23843 ?auto_23830 ) ) ( HOIST-AT ?auto_23840 ?auto_23843 ) ( AVAILABLE ?auto_23840 ) ( SURFACE-AT ?auto_23824 ?auto_23843 ) ( ON ?auto_23824 ?auto_23845 ) ( CLEAR ?auto_23824 ) ( not ( = ?auto_23823 ?auto_23824 ) ) ( not ( = ?auto_23823 ?auto_23845 ) ) ( not ( = ?auto_23824 ?auto_23845 ) ) ( not ( = ?auto_23833 ?auto_23840 ) ) ( IS-CRATE ?auto_23823 ) ( AVAILABLE ?auto_23828 ) ( SURFACE-AT ?auto_23823 ?auto_23831 ) ( ON ?auto_23823 ?auto_23837 ) ( CLEAR ?auto_23823 ) ( not ( = ?auto_23822 ?auto_23823 ) ) ( not ( = ?auto_23822 ?auto_23837 ) ) ( not ( = ?auto_23823 ?auto_23837 ) ) ( SURFACE-AT ?auto_23821 ?auto_23830 ) ( CLEAR ?auto_23821 ) ( IS-CRATE ?auto_23822 ) ( AVAILABLE ?auto_23833 ) ( not ( = ?auto_23846 ?auto_23830 ) ) ( HOIST-AT ?auto_23844 ?auto_23846 ) ( AVAILABLE ?auto_23844 ) ( SURFACE-AT ?auto_23822 ?auto_23846 ) ( ON ?auto_23822 ?auto_23839 ) ( CLEAR ?auto_23822 ) ( TRUCK-AT ?auto_23829 ?auto_23830 ) ( not ( = ?auto_23821 ?auto_23822 ) ) ( not ( = ?auto_23821 ?auto_23839 ) ) ( not ( = ?auto_23822 ?auto_23839 ) ) ( not ( = ?auto_23833 ?auto_23844 ) ) ( not ( = ?auto_23821 ?auto_23823 ) ) ( not ( = ?auto_23821 ?auto_23837 ) ) ( not ( = ?auto_23823 ?auto_23839 ) ) ( not ( = ?auto_23831 ?auto_23846 ) ) ( not ( = ?auto_23828 ?auto_23844 ) ) ( not ( = ?auto_23837 ?auto_23839 ) ) ( not ( = ?auto_23821 ?auto_23824 ) ) ( not ( = ?auto_23821 ?auto_23845 ) ) ( not ( = ?auto_23822 ?auto_23824 ) ) ( not ( = ?auto_23822 ?auto_23845 ) ) ( not ( = ?auto_23824 ?auto_23837 ) ) ( not ( = ?auto_23824 ?auto_23839 ) ) ( not ( = ?auto_23843 ?auto_23831 ) ) ( not ( = ?auto_23843 ?auto_23846 ) ) ( not ( = ?auto_23840 ?auto_23828 ) ) ( not ( = ?auto_23840 ?auto_23844 ) ) ( not ( = ?auto_23845 ?auto_23837 ) ) ( not ( = ?auto_23845 ?auto_23839 ) ) ( not ( = ?auto_23821 ?auto_23825 ) ) ( not ( = ?auto_23821 ?auto_23838 ) ) ( not ( = ?auto_23822 ?auto_23825 ) ) ( not ( = ?auto_23822 ?auto_23838 ) ) ( not ( = ?auto_23823 ?auto_23825 ) ) ( not ( = ?auto_23823 ?auto_23838 ) ) ( not ( = ?auto_23825 ?auto_23845 ) ) ( not ( = ?auto_23825 ?auto_23837 ) ) ( not ( = ?auto_23825 ?auto_23839 ) ) ( not ( = ?auto_23842 ?auto_23843 ) ) ( not ( = ?auto_23842 ?auto_23831 ) ) ( not ( = ?auto_23842 ?auto_23846 ) ) ( not ( = ?auto_23834 ?auto_23840 ) ) ( not ( = ?auto_23834 ?auto_23828 ) ) ( not ( = ?auto_23834 ?auto_23844 ) ) ( not ( = ?auto_23838 ?auto_23845 ) ) ( not ( = ?auto_23838 ?auto_23837 ) ) ( not ( = ?auto_23838 ?auto_23839 ) ) ( not ( = ?auto_23821 ?auto_23826 ) ) ( not ( = ?auto_23821 ?auto_23841 ) ) ( not ( = ?auto_23822 ?auto_23826 ) ) ( not ( = ?auto_23822 ?auto_23841 ) ) ( not ( = ?auto_23823 ?auto_23826 ) ) ( not ( = ?auto_23823 ?auto_23841 ) ) ( not ( = ?auto_23824 ?auto_23826 ) ) ( not ( = ?auto_23824 ?auto_23841 ) ) ( not ( = ?auto_23826 ?auto_23838 ) ) ( not ( = ?auto_23826 ?auto_23845 ) ) ( not ( = ?auto_23826 ?auto_23837 ) ) ( not ( = ?auto_23826 ?auto_23839 ) ) ( not ( = ?auto_23836 ?auto_23842 ) ) ( not ( = ?auto_23836 ?auto_23843 ) ) ( not ( = ?auto_23836 ?auto_23831 ) ) ( not ( = ?auto_23836 ?auto_23846 ) ) ( not ( = ?auto_23835 ?auto_23834 ) ) ( not ( = ?auto_23835 ?auto_23840 ) ) ( not ( = ?auto_23835 ?auto_23828 ) ) ( not ( = ?auto_23835 ?auto_23844 ) ) ( not ( = ?auto_23841 ?auto_23838 ) ) ( not ( = ?auto_23841 ?auto_23845 ) ) ( not ( = ?auto_23841 ?auto_23837 ) ) ( not ( = ?auto_23841 ?auto_23839 ) ) ( not ( = ?auto_23821 ?auto_23827 ) ) ( not ( = ?auto_23821 ?auto_23832 ) ) ( not ( = ?auto_23822 ?auto_23827 ) ) ( not ( = ?auto_23822 ?auto_23832 ) ) ( not ( = ?auto_23823 ?auto_23827 ) ) ( not ( = ?auto_23823 ?auto_23832 ) ) ( not ( = ?auto_23824 ?auto_23827 ) ) ( not ( = ?auto_23824 ?auto_23832 ) ) ( not ( = ?auto_23825 ?auto_23827 ) ) ( not ( = ?auto_23825 ?auto_23832 ) ) ( not ( = ?auto_23827 ?auto_23841 ) ) ( not ( = ?auto_23827 ?auto_23838 ) ) ( not ( = ?auto_23827 ?auto_23845 ) ) ( not ( = ?auto_23827 ?auto_23837 ) ) ( not ( = ?auto_23827 ?auto_23839 ) ) ( not ( = ?auto_23832 ?auto_23841 ) ) ( not ( = ?auto_23832 ?auto_23838 ) ) ( not ( = ?auto_23832 ?auto_23845 ) ) ( not ( = ?auto_23832 ?auto_23837 ) ) ( not ( = ?auto_23832 ?auto_23839 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_23821 ?auto_23822 ?auto_23823 ?auto_23824 ?auto_23825 ?auto_23826 )
      ( MAKE-1CRATE ?auto_23826 ?auto_23827 )
      ( MAKE-6CRATE-VERIFY ?auto_23821 ?auto_23822 ?auto_23823 ?auto_23824 ?auto_23825 ?auto_23826 ?auto_23827 ) )
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
      ?auto_23875 - HOIST
      ?auto_23874 - PLACE
      ?auto_23876 - PLACE
      ?auto_23873 - HOIST
      ?auto_23878 - SURFACE
      ?auto_23892 - PLACE
      ?auto_23893 - HOIST
      ?auto_23886 - SURFACE
      ?auto_23891 - PLACE
      ?auto_23881 - HOIST
      ?auto_23882 - SURFACE
      ?auto_23883 - PLACE
      ?auto_23884 - HOIST
      ?auto_23880 - SURFACE
      ?auto_23885 - PLACE
      ?auto_23894 - HOIST
      ?auto_23887 - SURFACE
      ?auto_23890 - SURFACE
      ?auto_23889 - PLACE
      ?auto_23888 - HOIST
      ?auto_23879 - SURFACE
      ?auto_23877 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23875 ?auto_23874 ) ( IS-CRATE ?auto_23872 ) ( not ( = ?auto_23876 ?auto_23874 ) ) ( HOIST-AT ?auto_23873 ?auto_23876 ) ( AVAILABLE ?auto_23873 ) ( SURFACE-AT ?auto_23872 ?auto_23876 ) ( ON ?auto_23872 ?auto_23878 ) ( CLEAR ?auto_23872 ) ( not ( = ?auto_23871 ?auto_23872 ) ) ( not ( = ?auto_23871 ?auto_23878 ) ) ( not ( = ?auto_23872 ?auto_23878 ) ) ( not ( = ?auto_23875 ?auto_23873 ) ) ( IS-CRATE ?auto_23871 ) ( not ( = ?auto_23892 ?auto_23874 ) ) ( HOIST-AT ?auto_23893 ?auto_23892 ) ( SURFACE-AT ?auto_23871 ?auto_23892 ) ( ON ?auto_23871 ?auto_23886 ) ( CLEAR ?auto_23871 ) ( not ( = ?auto_23870 ?auto_23871 ) ) ( not ( = ?auto_23870 ?auto_23886 ) ) ( not ( = ?auto_23871 ?auto_23886 ) ) ( not ( = ?auto_23875 ?auto_23893 ) ) ( IS-CRATE ?auto_23870 ) ( not ( = ?auto_23891 ?auto_23874 ) ) ( HOIST-AT ?auto_23881 ?auto_23891 ) ( AVAILABLE ?auto_23881 ) ( SURFACE-AT ?auto_23870 ?auto_23891 ) ( ON ?auto_23870 ?auto_23882 ) ( CLEAR ?auto_23870 ) ( not ( = ?auto_23869 ?auto_23870 ) ) ( not ( = ?auto_23869 ?auto_23882 ) ) ( not ( = ?auto_23870 ?auto_23882 ) ) ( not ( = ?auto_23875 ?auto_23881 ) ) ( IS-CRATE ?auto_23869 ) ( not ( = ?auto_23883 ?auto_23874 ) ) ( HOIST-AT ?auto_23884 ?auto_23883 ) ( AVAILABLE ?auto_23884 ) ( SURFACE-AT ?auto_23869 ?auto_23883 ) ( ON ?auto_23869 ?auto_23880 ) ( CLEAR ?auto_23869 ) ( not ( = ?auto_23868 ?auto_23869 ) ) ( not ( = ?auto_23868 ?auto_23880 ) ) ( not ( = ?auto_23869 ?auto_23880 ) ) ( not ( = ?auto_23875 ?auto_23884 ) ) ( IS-CRATE ?auto_23868 ) ( not ( = ?auto_23885 ?auto_23874 ) ) ( HOIST-AT ?auto_23894 ?auto_23885 ) ( AVAILABLE ?auto_23894 ) ( SURFACE-AT ?auto_23868 ?auto_23885 ) ( ON ?auto_23868 ?auto_23887 ) ( CLEAR ?auto_23868 ) ( not ( = ?auto_23867 ?auto_23868 ) ) ( not ( = ?auto_23867 ?auto_23887 ) ) ( not ( = ?auto_23868 ?auto_23887 ) ) ( not ( = ?auto_23875 ?auto_23894 ) ) ( IS-CRATE ?auto_23867 ) ( AVAILABLE ?auto_23893 ) ( SURFACE-AT ?auto_23867 ?auto_23892 ) ( ON ?auto_23867 ?auto_23890 ) ( CLEAR ?auto_23867 ) ( not ( = ?auto_23866 ?auto_23867 ) ) ( not ( = ?auto_23866 ?auto_23890 ) ) ( not ( = ?auto_23867 ?auto_23890 ) ) ( SURFACE-AT ?auto_23865 ?auto_23874 ) ( CLEAR ?auto_23865 ) ( IS-CRATE ?auto_23866 ) ( AVAILABLE ?auto_23875 ) ( not ( = ?auto_23889 ?auto_23874 ) ) ( HOIST-AT ?auto_23888 ?auto_23889 ) ( AVAILABLE ?auto_23888 ) ( SURFACE-AT ?auto_23866 ?auto_23889 ) ( ON ?auto_23866 ?auto_23879 ) ( CLEAR ?auto_23866 ) ( TRUCK-AT ?auto_23877 ?auto_23874 ) ( not ( = ?auto_23865 ?auto_23866 ) ) ( not ( = ?auto_23865 ?auto_23879 ) ) ( not ( = ?auto_23866 ?auto_23879 ) ) ( not ( = ?auto_23875 ?auto_23888 ) ) ( not ( = ?auto_23865 ?auto_23867 ) ) ( not ( = ?auto_23865 ?auto_23890 ) ) ( not ( = ?auto_23867 ?auto_23879 ) ) ( not ( = ?auto_23892 ?auto_23889 ) ) ( not ( = ?auto_23893 ?auto_23888 ) ) ( not ( = ?auto_23890 ?auto_23879 ) ) ( not ( = ?auto_23865 ?auto_23868 ) ) ( not ( = ?auto_23865 ?auto_23887 ) ) ( not ( = ?auto_23866 ?auto_23868 ) ) ( not ( = ?auto_23866 ?auto_23887 ) ) ( not ( = ?auto_23868 ?auto_23890 ) ) ( not ( = ?auto_23868 ?auto_23879 ) ) ( not ( = ?auto_23885 ?auto_23892 ) ) ( not ( = ?auto_23885 ?auto_23889 ) ) ( not ( = ?auto_23894 ?auto_23893 ) ) ( not ( = ?auto_23894 ?auto_23888 ) ) ( not ( = ?auto_23887 ?auto_23890 ) ) ( not ( = ?auto_23887 ?auto_23879 ) ) ( not ( = ?auto_23865 ?auto_23869 ) ) ( not ( = ?auto_23865 ?auto_23880 ) ) ( not ( = ?auto_23866 ?auto_23869 ) ) ( not ( = ?auto_23866 ?auto_23880 ) ) ( not ( = ?auto_23867 ?auto_23869 ) ) ( not ( = ?auto_23867 ?auto_23880 ) ) ( not ( = ?auto_23869 ?auto_23887 ) ) ( not ( = ?auto_23869 ?auto_23890 ) ) ( not ( = ?auto_23869 ?auto_23879 ) ) ( not ( = ?auto_23883 ?auto_23885 ) ) ( not ( = ?auto_23883 ?auto_23892 ) ) ( not ( = ?auto_23883 ?auto_23889 ) ) ( not ( = ?auto_23884 ?auto_23894 ) ) ( not ( = ?auto_23884 ?auto_23893 ) ) ( not ( = ?auto_23884 ?auto_23888 ) ) ( not ( = ?auto_23880 ?auto_23887 ) ) ( not ( = ?auto_23880 ?auto_23890 ) ) ( not ( = ?auto_23880 ?auto_23879 ) ) ( not ( = ?auto_23865 ?auto_23870 ) ) ( not ( = ?auto_23865 ?auto_23882 ) ) ( not ( = ?auto_23866 ?auto_23870 ) ) ( not ( = ?auto_23866 ?auto_23882 ) ) ( not ( = ?auto_23867 ?auto_23870 ) ) ( not ( = ?auto_23867 ?auto_23882 ) ) ( not ( = ?auto_23868 ?auto_23870 ) ) ( not ( = ?auto_23868 ?auto_23882 ) ) ( not ( = ?auto_23870 ?auto_23880 ) ) ( not ( = ?auto_23870 ?auto_23887 ) ) ( not ( = ?auto_23870 ?auto_23890 ) ) ( not ( = ?auto_23870 ?auto_23879 ) ) ( not ( = ?auto_23891 ?auto_23883 ) ) ( not ( = ?auto_23891 ?auto_23885 ) ) ( not ( = ?auto_23891 ?auto_23892 ) ) ( not ( = ?auto_23891 ?auto_23889 ) ) ( not ( = ?auto_23881 ?auto_23884 ) ) ( not ( = ?auto_23881 ?auto_23894 ) ) ( not ( = ?auto_23881 ?auto_23893 ) ) ( not ( = ?auto_23881 ?auto_23888 ) ) ( not ( = ?auto_23882 ?auto_23880 ) ) ( not ( = ?auto_23882 ?auto_23887 ) ) ( not ( = ?auto_23882 ?auto_23890 ) ) ( not ( = ?auto_23882 ?auto_23879 ) ) ( not ( = ?auto_23865 ?auto_23871 ) ) ( not ( = ?auto_23865 ?auto_23886 ) ) ( not ( = ?auto_23866 ?auto_23871 ) ) ( not ( = ?auto_23866 ?auto_23886 ) ) ( not ( = ?auto_23867 ?auto_23871 ) ) ( not ( = ?auto_23867 ?auto_23886 ) ) ( not ( = ?auto_23868 ?auto_23871 ) ) ( not ( = ?auto_23868 ?auto_23886 ) ) ( not ( = ?auto_23869 ?auto_23871 ) ) ( not ( = ?auto_23869 ?auto_23886 ) ) ( not ( = ?auto_23871 ?auto_23882 ) ) ( not ( = ?auto_23871 ?auto_23880 ) ) ( not ( = ?auto_23871 ?auto_23887 ) ) ( not ( = ?auto_23871 ?auto_23890 ) ) ( not ( = ?auto_23871 ?auto_23879 ) ) ( not ( = ?auto_23886 ?auto_23882 ) ) ( not ( = ?auto_23886 ?auto_23880 ) ) ( not ( = ?auto_23886 ?auto_23887 ) ) ( not ( = ?auto_23886 ?auto_23890 ) ) ( not ( = ?auto_23886 ?auto_23879 ) ) ( not ( = ?auto_23865 ?auto_23872 ) ) ( not ( = ?auto_23865 ?auto_23878 ) ) ( not ( = ?auto_23866 ?auto_23872 ) ) ( not ( = ?auto_23866 ?auto_23878 ) ) ( not ( = ?auto_23867 ?auto_23872 ) ) ( not ( = ?auto_23867 ?auto_23878 ) ) ( not ( = ?auto_23868 ?auto_23872 ) ) ( not ( = ?auto_23868 ?auto_23878 ) ) ( not ( = ?auto_23869 ?auto_23872 ) ) ( not ( = ?auto_23869 ?auto_23878 ) ) ( not ( = ?auto_23870 ?auto_23872 ) ) ( not ( = ?auto_23870 ?auto_23878 ) ) ( not ( = ?auto_23872 ?auto_23886 ) ) ( not ( = ?auto_23872 ?auto_23882 ) ) ( not ( = ?auto_23872 ?auto_23880 ) ) ( not ( = ?auto_23872 ?auto_23887 ) ) ( not ( = ?auto_23872 ?auto_23890 ) ) ( not ( = ?auto_23872 ?auto_23879 ) ) ( not ( = ?auto_23876 ?auto_23892 ) ) ( not ( = ?auto_23876 ?auto_23891 ) ) ( not ( = ?auto_23876 ?auto_23883 ) ) ( not ( = ?auto_23876 ?auto_23885 ) ) ( not ( = ?auto_23876 ?auto_23889 ) ) ( not ( = ?auto_23873 ?auto_23893 ) ) ( not ( = ?auto_23873 ?auto_23881 ) ) ( not ( = ?auto_23873 ?auto_23884 ) ) ( not ( = ?auto_23873 ?auto_23894 ) ) ( not ( = ?auto_23873 ?auto_23888 ) ) ( not ( = ?auto_23878 ?auto_23886 ) ) ( not ( = ?auto_23878 ?auto_23882 ) ) ( not ( = ?auto_23878 ?auto_23880 ) ) ( not ( = ?auto_23878 ?auto_23887 ) ) ( not ( = ?auto_23878 ?auto_23890 ) ) ( not ( = ?auto_23878 ?auto_23879 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_23865 ?auto_23866 ?auto_23867 ?auto_23868 ?auto_23869 ?auto_23870 ?auto_23871 )
      ( MAKE-1CRATE ?auto_23871 ?auto_23872 )
      ( MAKE-7CRATE-VERIFY ?auto_23865 ?auto_23866 ?auto_23867 ?auto_23868 ?auto_23869 ?auto_23870 ?auto_23871 ?auto_23872 ) )
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
      ?auto_23921 - SURFACE
      ?auto_23922 - SURFACE
    )
    :vars
    (
      ?auto_23924 - HOIST
      ?auto_23926 - PLACE
      ?auto_23927 - PLACE
      ?auto_23928 - HOIST
      ?auto_23923 - SURFACE
      ?auto_23947 - PLACE
      ?auto_23936 - HOIST
      ?auto_23944 - SURFACE
      ?auto_23932 - PLACE
      ?auto_23937 - HOIST
      ?auto_23933 - SURFACE
      ?auto_23931 - PLACE
      ?auto_23946 - HOIST
      ?auto_23945 - SURFACE
      ?auto_23943 - PLACE
      ?auto_23935 - HOIST
      ?auto_23942 - SURFACE
      ?auto_23934 - PLACE
      ?auto_23930 - HOIST
      ?auto_23929 - SURFACE
      ?auto_23939 - SURFACE
      ?auto_23940 - PLACE
      ?auto_23938 - HOIST
      ?auto_23941 - SURFACE
      ?auto_23925 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23924 ?auto_23926 ) ( IS-CRATE ?auto_23922 ) ( not ( = ?auto_23927 ?auto_23926 ) ) ( HOIST-AT ?auto_23928 ?auto_23927 ) ( AVAILABLE ?auto_23928 ) ( SURFACE-AT ?auto_23922 ?auto_23927 ) ( ON ?auto_23922 ?auto_23923 ) ( CLEAR ?auto_23922 ) ( not ( = ?auto_23921 ?auto_23922 ) ) ( not ( = ?auto_23921 ?auto_23923 ) ) ( not ( = ?auto_23922 ?auto_23923 ) ) ( not ( = ?auto_23924 ?auto_23928 ) ) ( IS-CRATE ?auto_23921 ) ( not ( = ?auto_23947 ?auto_23926 ) ) ( HOIST-AT ?auto_23936 ?auto_23947 ) ( AVAILABLE ?auto_23936 ) ( SURFACE-AT ?auto_23921 ?auto_23947 ) ( ON ?auto_23921 ?auto_23944 ) ( CLEAR ?auto_23921 ) ( not ( = ?auto_23920 ?auto_23921 ) ) ( not ( = ?auto_23920 ?auto_23944 ) ) ( not ( = ?auto_23921 ?auto_23944 ) ) ( not ( = ?auto_23924 ?auto_23936 ) ) ( IS-CRATE ?auto_23920 ) ( not ( = ?auto_23932 ?auto_23926 ) ) ( HOIST-AT ?auto_23937 ?auto_23932 ) ( SURFACE-AT ?auto_23920 ?auto_23932 ) ( ON ?auto_23920 ?auto_23933 ) ( CLEAR ?auto_23920 ) ( not ( = ?auto_23919 ?auto_23920 ) ) ( not ( = ?auto_23919 ?auto_23933 ) ) ( not ( = ?auto_23920 ?auto_23933 ) ) ( not ( = ?auto_23924 ?auto_23937 ) ) ( IS-CRATE ?auto_23919 ) ( not ( = ?auto_23931 ?auto_23926 ) ) ( HOIST-AT ?auto_23946 ?auto_23931 ) ( AVAILABLE ?auto_23946 ) ( SURFACE-AT ?auto_23919 ?auto_23931 ) ( ON ?auto_23919 ?auto_23945 ) ( CLEAR ?auto_23919 ) ( not ( = ?auto_23918 ?auto_23919 ) ) ( not ( = ?auto_23918 ?auto_23945 ) ) ( not ( = ?auto_23919 ?auto_23945 ) ) ( not ( = ?auto_23924 ?auto_23946 ) ) ( IS-CRATE ?auto_23918 ) ( not ( = ?auto_23943 ?auto_23926 ) ) ( HOIST-AT ?auto_23935 ?auto_23943 ) ( AVAILABLE ?auto_23935 ) ( SURFACE-AT ?auto_23918 ?auto_23943 ) ( ON ?auto_23918 ?auto_23942 ) ( CLEAR ?auto_23918 ) ( not ( = ?auto_23917 ?auto_23918 ) ) ( not ( = ?auto_23917 ?auto_23942 ) ) ( not ( = ?auto_23918 ?auto_23942 ) ) ( not ( = ?auto_23924 ?auto_23935 ) ) ( IS-CRATE ?auto_23917 ) ( not ( = ?auto_23934 ?auto_23926 ) ) ( HOIST-AT ?auto_23930 ?auto_23934 ) ( AVAILABLE ?auto_23930 ) ( SURFACE-AT ?auto_23917 ?auto_23934 ) ( ON ?auto_23917 ?auto_23929 ) ( CLEAR ?auto_23917 ) ( not ( = ?auto_23916 ?auto_23917 ) ) ( not ( = ?auto_23916 ?auto_23929 ) ) ( not ( = ?auto_23917 ?auto_23929 ) ) ( not ( = ?auto_23924 ?auto_23930 ) ) ( IS-CRATE ?auto_23916 ) ( AVAILABLE ?auto_23937 ) ( SURFACE-AT ?auto_23916 ?auto_23932 ) ( ON ?auto_23916 ?auto_23939 ) ( CLEAR ?auto_23916 ) ( not ( = ?auto_23915 ?auto_23916 ) ) ( not ( = ?auto_23915 ?auto_23939 ) ) ( not ( = ?auto_23916 ?auto_23939 ) ) ( SURFACE-AT ?auto_23914 ?auto_23926 ) ( CLEAR ?auto_23914 ) ( IS-CRATE ?auto_23915 ) ( AVAILABLE ?auto_23924 ) ( not ( = ?auto_23940 ?auto_23926 ) ) ( HOIST-AT ?auto_23938 ?auto_23940 ) ( AVAILABLE ?auto_23938 ) ( SURFACE-AT ?auto_23915 ?auto_23940 ) ( ON ?auto_23915 ?auto_23941 ) ( CLEAR ?auto_23915 ) ( TRUCK-AT ?auto_23925 ?auto_23926 ) ( not ( = ?auto_23914 ?auto_23915 ) ) ( not ( = ?auto_23914 ?auto_23941 ) ) ( not ( = ?auto_23915 ?auto_23941 ) ) ( not ( = ?auto_23924 ?auto_23938 ) ) ( not ( = ?auto_23914 ?auto_23916 ) ) ( not ( = ?auto_23914 ?auto_23939 ) ) ( not ( = ?auto_23916 ?auto_23941 ) ) ( not ( = ?auto_23932 ?auto_23940 ) ) ( not ( = ?auto_23937 ?auto_23938 ) ) ( not ( = ?auto_23939 ?auto_23941 ) ) ( not ( = ?auto_23914 ?auto_23917 ) ) ( not ( = ?auto_23914 ?auto_23929 ) ) ( not ( = ?auto_23915 ?auto_23917 ) ) ( not ( = ?auto_23915 ?auto_23929 ) ) ( not ( = ?auto_23917 ?auto_23939 ) ) ( not ( = ?auto_23917 ?auto_23941 ) ) ( not ( = ?auto_23934 ?auto_23932 ) ) ( not ( = ?auto_23934 ?auto_23940 ) ) ( not ( = ?auto_23930 ?auto_23937 ) ) ( not ( = ?auto_23930 ?auto_23938 ) ) ( not ( = ?auto_23929 ?auto_23939 ) ) ( not ( = ?auto_23929 ?auto_23941 ) ) ( not ( = ?auto_23914 ?auto_23918 ) ) ( not ( = ?auto_23914 ?auto_23942 ) ) ( not ( = ?auto_23915 ?auto_23918 ) ) ( not ( = ?auto_23915 ?auto_23942 ) ) ( not ( = ?auto_23916 ?auto_23918 ) ) ( not ( = ?auto_23916 ?auto_23942 ) ) ( not ( = ?auto_23918 ?auto_23929 ) ) ( not ( = ?auto_23918 ?auto_23939 ) ) ( not ( = ?auto_23918 ?auto_23941 ) ) ( not ( = ?auto_23943 ?auto_23934 ) ) ( not ( = ?auto_23943 ?auto_23932 ) ) ( not ( = ?auto_23943 ?auto_23940 ) ) ( not ( = ?auto_23935 ?auto_23930 ) ) ( not ( = ?auto_23935 ?auto_23937 ) ) ( not ( = ?auto_23935 ?auto_23938 ) ) ( not ( = ?auto_23942 ?auto_23929 ) ) ( not ( = ?auto_23942 ?auto_23939 ) ) ( not ( = ?auto_23942 ?auto_23941 ) ) ( not ( = ?auto_23914 ?auto_23919 ) ) ( not ( = ?auto_23914 ?auto_23945 ) ) ( not ( = ?auto_23915 ?auto_23919 ) ) ( not ( = ?auto_23915 ?auto_23945 ) ) ( not ( = ?auto_23916 ?auto_23919 ) ) ( not ( = ?auto_23916 ?auto_23945 ) ) ( not ( = ?auto_23917 ?auto_23919 ) ) ( not ( = ?auto_23917 ?auto_23945 ) ) ( not ( = ?auto_23919 ?auto_23942 ) ) ( not ( = ?auto_23919 ?auto_23929 ) ) ( not ( = ?auto_23919 ?auto_23939 ) ) ( not ( = ?auto_23919 ?auto_23941 ) ) ( not ( = ?auto_23931 ?auto_23943 ) ) ( not ( = ?auto_23931 ?auto_23934 ) ) ( not ( = ?auto_23931 ?auto_23932 ) ) ( not ( = ?auto_23931 ?auto_23940 ) ) ( not ( = ?auto_23946 ?auto_23935 ) ) ( not ( = ?auto_23946 ?auto_23930 ) ) ( not ( = ?auto_23946 ?auto_23937 ) ) ( not ( = ?auto_23946 ?auto_23938 ) ) ( not ( = ?auto_23945 ?auto_23942 ) ) ( not ( = ?auto_23945 ?auto_23929 ) ) ( not ( = ?auto_23945 ?auto_23939 ) ) ( not ( = ?auto_23945 ?auto_23941 ) ) ( not ( = ?auto_23914 ?auto_23920 ) ) ( not ( = ?auto_23914 ?auto_23933 ) ) ( not ( = ?auto_23915 ?auto_23920 ) ) ( not ( = ?auto_23915 ?auto_23933 ) ) ( not ( = ?auto_23916 ?auto_23920 ) ) ( not ( = ?auto_23916 ?auto_23933 ) ) ( not ( = ?auto_23917 ?auto_23920 ) ) ( not ( = ?auto_23917 ?auto_23933 ) ) ( not ( = ?auto_23918 ?auto_23920 ) ) ( not ( = ?auto_23918 ?auto_23933 ) ) ( not ( = ?auto_23920 ?auto_23945 ) ) ( not ( = ?auto_23920 ?auto_23942 ) ) ( not ( = ?auto_23920 ?auto_23929 ) ) ( not ( = ?auto_23920 ?auto_23939 ) ) ( not ( = ?auto_23920 ?auto_23941 ) ) ( not ( = ?auto_23933 ?auto_23945 ) ) ( not ( = ?auto_23933 ?auto_23942 ) ) ( not ( = ?auto_23933 ?auto_23929 ) ) ( not ( = ?auto_23933 ?auto_23939 ) ) ( not ( = ?auto_23933 ?auto_23941 ) ) ( not ( = ?auto_23914 ?auto_23921 ) ) ( not ( = ?auto_23914 ?auto_23944 ) ) ( not ( = ?auto_23915 ?auto_23921 ) ) ( not ( = ?auto_23915 ?auto_23944 ) ) ( not ( = ?auto_23916 ?auto_23921 ) ) ( not ( = ?auto_23916 ?auto_23944 ) ) ( not ( = ?auto_23917 ?auto_23921 ) ) ( not ( = ?auto_23917 ?auto_23944 ) ) ( not ( = ?auto_23918 ?auto_23921 ) ) ( not ( = ?auto_23918 ?auto_23944 ) ) ( not ( = ?auto_23919 ?auto_23921 ) ) ( not ( = ?auto_23919 ?auto_23944 ) ) ( not ( = ?auto_23921 ?auto_23933 ) ) ( not ( = ?auto_23921 ?auto_23945 ) ) ( not ( = ?auto_23921 ?auto_23942 ) ) ( not ( = ?auto_23921 ?auto_23929 ) ) ( not ( = ?auto_23921 ?auto_23939 ) ) ( not ( = ?auto_23921 ?auto_23941 ) ) ( not ( = ?auto_23947 ?auto_23932 ) ) ( not ( = ?auto_23947 ?auto_23931 ) ) ( not ( = ?auto_23947 ?auto_23943 ) ) ( not ( = ?auto_23947 ?auto_23934 ) ) ( not ( = ?auto_23947 ?auto_23940 ) ) ( not ( = ?auto_23936 ?auto_23937 ) ) ( not ( = ?auto_23936 ?auto_23946 ) ) ( not ( = ?auto_23936 ?auto_23935 ) ) ( not ( = ?auto_23936 ?auto_23930 ) ) ( not ( = ?auto_23936 ?auto_23938 ) ) ( not ( = ?auto_23944 ?auto_23933 ) ) ( not ( = ?auto_23944 ?auto_23945 ) ) ( not ( = ?auto_23944 ?auto_23942 ) ) ( not ( = ?auto_23944 ?auto_23929 ) ) ( not ( = ?auto_23944 ?auto_23939 ) ) ( not ( = ?auto_23944 ?auto_23941 ) ) ( not ( = ?auto_23914 ?auto_23922 ) ) ( not ( = ?auto_23914 ?auto_23923 ) ) ( not ( = ?auto_23915 ?auto_23922 ) ) ( not ( = ?auto_23915 ?auto_23923 ) ) ( not ( = ?auto_23916 ?auto_23922 ) ) ( not ( = ?auto_23916 ?auto_23923 ) ) ( not ( = ?auto_23917 ?auto_23922 ) ) ( not ( = ?auto_23917 ?auto_23923 ) ) ( not ( = ?auto_23918 ?auto_23922 ) ) ( not ( = ?auto_23918 ?auto_23923 ) ) ( not ( = ?auto_23919 ?auto_23922 ) ) ( not ( = ?auto_23919 ?auto_23923 ) ) ( not ( = ?auto_23920 ?auto_23922 ) ) ( not ( = ?auto_23920 ?auto_23923 ) ) ( not ( = ?auto_23922 ?auto_23944 ) ) ( not ( = ?auto_23922 ?auto_23933 ) ) ( not ( = ?auto_23922 ?auto_23945 ) ) ( not ( = ?auto_23922 ?auto_23942 ) ) ( not ( = ?auto_23922 ?auto_23929 ) ) ( not ( = ?auto_23922 ?auto_23939 ) ) ( not ( = ?auto_23922 ?auto_23941 ) ) ( not ( = ?auto_23927 ?auto_23947 ) ) ( not ( = ?auto_23927 ?auto_23932 ) ) ( not ( = ?auto_23927 ?auto_23931 ) ) ( not ( = ?auto_23927 ?auto_23943 ) ) ( not ( = ?auto_23927 ?auto_23934 ) ) ( not ( = ?auto_23927 ?auto_23940 ) ) ( not ( = ?auto_23928 ?auto_23936 ) ) ( not ( = ?auto_23928 ?auto_23937 ) ) ( not ( = ?auto_23928 ?auto_23946 ) ) ( not ( = ?auto_23928 ?auto_23935 ) ) ( not ( = ?auto_23928 ?auto_23930 ) ) ( not ( = ?auto_23928 ?auto_23938 ) ) ( not ( = ?auto_23923 ?auto_23944 ) ) ( not ( = ?auto_23923 ?auto_23933 ) ) ( not ( = ?auto_23923 ?auto_23945 ) ) ( not ( = ?auto_23923 ?auto_23942 ) ) ( not ( = ?auto_23923 ?auto_23929 ) ) ( not ( = ?auto_23923 ?auto_23939 ) ) ( not ( = ?auto_23923 ?auto_23941 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_23914 ?auto_23915 ?auto_23916 ?auto_23917 ?auto_23918 ?auto_23919 ?auto_23920 ?auto_23921 )
      ( MAKE-1CRATE ?auto_23921 ?auto_23922 )
      ( MAKE-8CRATE-VERIFY ?auto_23914 ?auto_23915 ?auto_23916 ?auto_23917 ?auto_23918 ?auto_23919 ?auto_23920 ?auto_23921 ?auto_23922 ) )
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
      ?auto_23975 - SURFACE
      ?auto_23976 - SURFACE
      ?auto_23977 - SURFACE
    )
    :vars
    (
      ?auto_23983 - HOIST
      ?auto_23978 - PLACE
      ?auto_23981 - PLACE
      ?auto_23980 - HOIST
      ?auto_23979 - SURFACE
      ?auto_24005 - PLACE
      ?auto_23992 - HOIST
      ?auto_23988 - SURFACE
      ?auto_23986 - PLACE
      ?auto_24001 - HOIST
      ?auto_23994 - SURFACE
      ?auto_23991 - PLACE
      ?auto_23995 - HOIST
      ?auto_23993 - SURFACE
      ?auto_23989 - PLACE
      ?auto_23984 - HOIST
      ?auto_23985 - SURFACE
      ?auto_23990 - PLACE
      ?auto_24002 - HOIST
      ?auto_24000 - SURFACE
      ?auto_24003 - PLACE
      ?auto_23987 - HOIST
      ?auto_24004 - SURFACE
      ?auto_23996 - SURFACE
      ?auto_23998 - PLACE
      ?auto_23997 - HOIST
      ?auto_23999 - SURFACE
      ?auto_23982 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23983 ?auto_23978 ) ( IS-CRATE ?auto_23977 ) ( not ( = ?auto_23981 ?auto_23978 ) ) ( HOIST-AT ?auto_23980 ?auto_23981 ) ( AVAILABLE ?auto_23980 ) ( SURFACE-AT ?auto_23977 ?auto_23981 ) ( ON ?auto_23977 ?auto_23979 ) ( CLEAR ?auto_23977 ) ( not ( = ?auto_23976 ?auto_23977 ) ) ( not ( = ?auto_23976 ?auto_23979 ) ) ( not ( = ?auto_23977 ?auto_23979 ) ) ( not ( = ?auto_23983 ?auto_23980 ) ) ( IS-CRATE ?auto_23976 ) ( not ( = ?auto_24005 ?auto_23978 ) ) ( HOIST-AT ?auto_23992 ?auto_24005 ) ( AVAILABLE ?auto_23992 ) ( SURFACE-AT ?auto_23976 ?auto_24005 ) ( ON ?auto_23976 ?auto_23988 ) ( CLEAR ?auto_23976 ) ( not ( = ?auto_23975 ?auto_23976 ) ) ( not ( = ?auto_23975 ?auto_23988 ) ) ( not ( = ?auto_23976 ?auto_23988 ) ) ( not ( = ?auto_23983 ?auto_23992 ) ) ( IS-CRATE ?auto_23975 ) ( not ( = ?auto_23986 ?auto_23978 ) ) ( HOIST-AT ?auto_24001 ?auto_23986 ) ( AVAILABLE ?auto_24001 ) ( SURFACE-AT ?auto_23975 ?auto_23986 ) ( ON ?auto_23975 ?auto_23994 ) ( CLEAR ?auto_23975 ) ( not ( = ?auto_23974 ?auto_23975 ) ) ( not ( = ?auto_23974 ?auto_23994 ) ) ( not ( = ?auto_23975 ?auto_23994 ) ) ( not ( = ?auto_23983 ?auto_24001 ) ) ( IS-CRATE ?auto_23974 ) ( not ( = ?auto_23991 ?auto_23978 ) ) ( HOIST-AT ?auto_23995 ?auto_23991 ) ( SURFACE-AT ?auto_23974 ?auto_23991 ) ( ON ?auto_23974 ?auto_23993 ) ( CLEAR ?auto_23974 ) ( not ( = ?auto_23973 ?auto_23974 ) ) ( not ( = ?auto_23973 ?auto_23993 ) ) ( not ( = ?auto_23974 ?auto_23993 ) ) ( not ( = ?auto_23983 ?auto_23995 ) ) ( IS-CRATE ?auto_23973 ) ( not ( = ?auto_23989 ?auto_23978 ) ) ( HOIST-AT ?auto_23984 ?auto_23989 ) ( AVAILABLE ?auto_23984 ) ( SURFACE-AT ?auto_23973 ?auto_23989 ) ( ON ?auto_23973 ?auto_23985 ) ( CLEAR ?auto_23973 ) ( not ( = ?auto_23972 ?auto_23973 ) ) ( not ( = ?auto_23972 ?auto_23985 ) ) ( not ( = ?auto_23973 ?auto_23985 ) ) ( not ( = ?auto_23983 ?auto_23984 ) ) ( IS-CRATE ?auto_23972 ) ( not ( = ?auto_23990 ?auto_23978 ) ) ( HOIST-AT ?auto_24002 ?auto_23990 ) ( AVAILABLE ?auto_24002 ) ( SURFACE-AT ?auto_23972 ?auto_23990 ) ( ON ?auto_23972 ?auto_24000 ) ( CLEAR ?auto_23972 ) ( not ( = ?auto_23971 ?auto_23972 ) ) ( not ( = ?auto_23971 ?auto_24000 ) ) ( not ( = ?auto_23972 ?auto_24000 ) ) ( not ( = ?auto_23983 ?auto_24002 ) ) ( IS-CRATE ?auto_23971 ) ( not ( = ?auto_24003 ?auto_23978 ) ) ( HOIST-AT ?auto_23987 ?auto_24003 ) ( AVAILABLE ?auto_23987 ) ( SURFACE-AT ?auto_23971 ?auto_24003 ) ( ON ?auto_23971 ?auto_24004 ) ( CLEAR ?auto_23971 ) ( not ( = ?auto_23970 ?auto_23971 ) ) ( not ( = ?auto_23970 ?auto_24004 ) ) ( not ( = ?auto_23971 ?auto_24004 ) ) ( not ( = ?auto_23983 ?auto_23987 ) ) ( IS-CRATE ?auto_23970 ) ( AVAILABLE ?auto_23995 ) ( SURFACE-AT ?auto_23970 ?auto_23991 ) ( ON ?auto_23970 ?auto_23996 ) ( CLEAR ?auto_23970 ) ( not ( = ?auto_23969 ?auto_23970 ) ) ( not ( = ?auto_23969 ?auto_23996 ) ) ( not ( = ?auto_23970 ?auto_23996 ) ) ( SURFACE-AT ?auto_23968 ?auto_23978 ) ( CLEAR ?auto_23968 ) ( IS-CRATE ?auto_23969 ) ( AVAILABLE ?auto_23983 ) ( not ( = ?auto_23998 ?auto_23978 ) ) ( HOIST-AT ?auto_23997 ?auto_23998 ) ( AVAILABLE ?auto_23997 ) ( SURFACE-AT ?auto_23969 ?auto_23998 ) ( ON ?auto_23969 ?auto_23999 ) ( CLEAR ?auto_23969 ) ( TRUCK-AT ?auto_23982 ?auto_23978 ) ( not ( = ?auto_23968 ?auto_23969 ) ) ( not ( = ?auto_23968 ?auto_23999 ) ) ( not ( = ?auto_23969 ?auto_23999 ) ) ( not ( = ?auto_23983 ?auto_23997 ) ) ( not ( = ?auto_23968 ?auto_23970 ) ) ( not ( = ?auto_23968 ?auto_23996 ) ) ( not ( = ?auto_23970 ?auto_23999 ) ) ( not ( = ?auto_23991 ?auto_23998 ) ) ( not ( = ?auto_23995 ?auto_23997 ) ) ( not ( = ?auto_23996 ?auto_23999 ) ) ( not ( = ?auto_23968 ?auto_23971 ) ) ( not ( = ?auto_23968 ?auto_24004 ) ) ( not ( = ?auto_23969 ?auto_23971 ) ) ( not ( = ?auto_23969 ?auto_24004 ) ) ( not ( = ?auto_23971 ?auto_23996 ) ) ( not ( = ?auto_23971 ?auto_23999 ) ) ( not ( = ?auto_24003 ?auto_23991 ) ) ( not ( = ?auto_24003 ?auto_23998 ) ) ( not ( = ?auto_23987 ?auto_23995 ) ) ( not ( = ?auto_23987 ?auto_23997 ) ) ( not ( = ?auto_24004 ?auto_23996 ) ) ( not ( = ?auto_24004 ?auto_23999 ) ) ( not ( = ?auto_23968 ?auto_23972 ) ) ( not ( = ?auto_23968 ?auto_24000 ) ) ( not ( = ?auto_23969 ?auto_23972 ) ) ( not ( = ?auto_23969 ?auto_24000 ) ) ( not ( = ?auto_23970 ?auto_23972 ) ) ( not ( = ?auto_23970 ?auto_24000 ) ) ( not ( = ?auto_23972 ?auto_24004 ) ) ( not ( = ?auto_23972 ?auto_23996 ) ) ( not ( = ?auto_23972 ?auto_23999 ) ) ( not ( = ?auto_23990 ?auto_24003 ) ) ( not ( = ?auto_23990 ?auto_23991 ) ) ( not ( = ?auto_23990 ?auto_23998 ) ) ( not ( = ?auto_24002 ?auto_23987 ) ) ( not ( = ?auto_24002 ?auto_23995 ) ) ( not ( = ?auto_24002 ?auto_23997 ) ) ( not ( = ?auto_24000 ?auto_24004 ) ) ( not ( = ?auto_24000 ?auto_23996 ) ) ( not ( = ?auto_24000 ?auto_23999 ) ) ( not ( = ?auto_23968 ?auto_23973 ) ) ( not ( = ?auto_23968 ?auto_23985 ) ) ( not ( = ?auto_23969 ?auto_23973 ) ) ( not ( = ?auto_23969 ?auto_23985 ) ) ( not ( = ?auto_23970 ?auto_23973 ) ) ( not ( = ?auto_23970 ?auto_23985 ) ) ( not ( = ?auto_23971 ?auto_23973 ) ) ( not ( = ?auto_23971 ?auto_23985 ) ) ( not ( = ?auto_23973 ?auto_24000 ) ) ( not ( = ?auto_23973 ?auto_24004 ) ) ( not ( = ?auto_23973 ?auto_23996 ) ) ( not ( = ?auto_23973 ?auto_23999 ) ) ( not ( = ?auto_23989 ?auto_23990 ) ) ( not ( = ?auto_23989 ?auto_24003 ) ) ( not ( = ?auto_23989 ?auto_23991 ) ) ( not ( = ?auto_23989 ?auto_23998 ) ) ( not ( = ?auto_23984 ?auto_24002 ) ) ( not ( = ?auto_23984 ?auto_23987 ) ) ( not ( = ?auto_23984 ?auto_23995 ) ) ( not ( = ?auto_23984 ?auto_23997 ) ) ( not ( = ?auto_23985 ?auto_24000 ) ) ( not ( = ?auto_23985 ?auto_24004 ) ) ( not ( = ?auto_23985 ?auto_23996 ) ) ( not ( = ?auto_23985 ?auto_23999 ) ) ( not ( = ?auto_23968 ?auto_23974 ) ) ( not ( = ?auto_23968 ?auto_23993 ) ) ( not ( = ?auto_23969 ?auto_23974 ) ) ( not ( = ?auto_23969 ?auto_23993 ) ) ( not ( = ?auto_23970 ?auto_23974 ) ) ( not ( = ?auto_23970 ?auto_23993 ) ) ( not ( = ?auto_23971 ?auto_23974 ) ) ( not ( = ?auto_23971 ?auto_23993 ) ) ( not ( = ?auto_23972 ?auto_23974 ) ) ( not ( = ?auto_23972 ?auto_23993 ) ) ( not ( = ?auto_23974 ?auto_23985 ) ) ( not ( = ?auto_23974 ?auto_24000 ) ) ( not ( = ?auto_23974 ?auto_24004 ) ) ( not ( = ?auto_23974 ?auto_23996 ) ) ( not ( = ?auto_23974 ?auto_23999 ) ) ( not ( = ?auto_23993 ?auto_23985 ) ) ( not ( = ?auto_23993 ?auto_24000 ) ) ( not ( = ?auto_23993 ?auto_24004 ) ) ( not ( = ?auto_23993 ?auto_23996 ) ) ( not ( = ?auto_23993 ?auto_23999 ) ) ( not ( = ?auto_23968 ?auto_23975 ) ) ( not ( = ?auto_23968 ?auto_23994 ) ) ( not ( = ?auto_23969 ?auto_23975 ) ) ( not ( = ?auto_23969 ?auto_23994 ) ) ( not ( = ?auto_23970 ?auto_23975 ) ) ( not ( = ?auto_23970 ?auto_23994 ) ) ( not ( = ?auto_23971 ?auto_23975 ) ) ( not ( = ?auto_23971 ?auto_23994 ) ) ( not ( = ?auto_23972 ?auto_23975 ) ) ( not ( = ?auto_23972 ?auto_23994 ) ) ( not ( = ?auto_23973 ?auto_23975 ) ) ( not ( = ?auto_23973 ?auto_23994 ) ) ( not ( = ?auto_23975 ?auto_23993 ) ) ( not ( = ?auto_23975 ?auto_23985 ) ) ( not ( = ?auto_23975 ?auto_24000 ) ) ( not ( = ?auto_23975 ?auto_24004 ) ) ( not ( = ?auto_23975 ?auto_23996 ) ) ( not ( = ?auto_23975 ?auto_23999 ) ) ( not ( = ?auto_23986 ?auto_23991 ) ) ( not ( = ?auto_23986 ?auto_23989 ) ) ( not ( = ?auto_23986 ?auto_23990 ) ) ( not ( = ?auto_23986 ?auto_24003 ) ) ( not ( = ?auto_23986 ?auto_23998 ) ) ( not ( = ?auto_24001 ?auto_23995 ) ) ( not ( = ?auto_24001 ?auto_23984 ) ) ( not ( = ?auto_24001 ?auto_24002 ) ) ( not ( = ?auto_24001 ?auto_23987 ) ) ( not ( = ?auto_24001 ?auto_23997 ) ) ( not ( = ?auto_23994 ?auto_23993 ) ) ( not ( = ?auto_23994 ?auto_23985 ) ) ( not ( = ?auto_23994 ?auto_24000 ) ) ( not ( = ?auto_23994 ?auto_24004 ) ) ( not ( = ?auto_23994 ?auto_23996 ) ) ( not ( = ?auto_23994 ?auto_23999 ) ) ( not ( = ?auto_23968 ?auto_23976 ) ) ( not ( = ?auto_23968 ?auto_23988 ) ) ( not ( = ?auto_23969 ?auto_23976 ) ) ( not ( = ?auto_23969 ?auto_23988 ) ) ( not ( = ?auto_23970 ?auto_23976 ) ) ( not ( = ?auto_23970 ?auto_23988 ) ) ( not ( = ?auto_23971 ?auto_23976 ) ) ( not ( = ?auto_23971 ?auto_23988 ) ) ( not ( = ?auto_23972 ?auto_23976 ) ) ( not ( = ?auto_23972 ?auto_23988 ) ) ( not ( = ?auto_23973 ?auto_23976 ) ) ( not ( = ?auto_23973 ?auto_23988 ) ) ( not ( = ?auto_23974 ?auto_23976 ) ) ( not ( = ?auto_23974 ?auto_23988 ) ) ( not ( = ?auto_23976 ?auto_23994 ) ) ( not ( = ?auto_23976 ?auto_23993 ) ) ( not ( = ?auto_23976 ?auto_23985 ) ) ( not ( = ?auto_23976 ?auto_24000 ) ) ( not ( = ?auto_23976 ?auto_24004 ) ) ( not ( = ?auto_23976 ?auto_23996 ) ) ( not ( = ?auto_23976 ?auto_23999 ) ) ( not ( = ?auto_24005 ?auto_23986 ) ) ( not ( = ?auto_24005 ?auto_23991 ) ) ( not ( = ?auto_24005 ?auto_23989 ) ) ( not ( = ?auto_24005 ?auto_23990 ) ) ( not ( = ?auto_24005 ?auto_24003 ) ) ( not ( = ?auto_24005 ?auto_23998 ) ) ( not ( = ?auto_23992 ?auto_24001 ) ) ( not ( = ?auto_23992 ?auto_23995 ) ) ( not ( = ?auto_23992 ?auto_23984 ) ) ( not ( = ?auto_23992 ?auto_24002 ) ) ( not ( = ?auto_23992 ?auto_23987 ) ) ( not ( = ?auto_23992 ?auto_23997 ) ) ( not ( = ?auto_23988 ?auto_23994 ) ) ( not ( = ?auto_23988 ?auto_23993 ) ) ( not ( = ?auto_23988 ?auto_23985 ) ) ( not ( = ?auto_23988 ?auto_24000 ) ) ( not ( = ?auto_23988 ?auto_24004 ) ) ( not ( = ?auto_23988 ?auto_23996 ) ) ( not ( = ?auto_23988 ?auto_23999 ) ) ( not ( = ?auto_23968 ?auto_23977 ) ) ( not ( = ?auto_23968 ?auto_23979 ) ) ( not ( = ?auto_23969 ?auto_23977 ) ) ( not ( = ?auto_23969 ?auto_23979 ) ) ( not ( = ?auto_23970 ?auto_23977 ) ) ( not ( = ?auto_23970 ?auto_23979 ) ) ( not ( = ?auto_23971 ?auto_23977 ) ) ( not ( = ?auto_23971 ?auto_23979 ) ) ( not ( = ?auto_23972 ?auto_23977 ) ) ( not ( = ?auto_23972 ?auto_23979 ) ) ( not ( = ?auto_23973 ?auto_23977 ) ) ( not ( = ?auto_23973 ?auto_23979 ) ) ( not ( = ?auto_23974 ?auto_23977 ) ) ( not ( = ?auto_23974 ?auto_23979 ) ) ( not ( = ?auto_23975 ?auto_23977 ) ) ( not ( = ?auto_23975 ?auto_23979 ) ) ( not ( = ?auto_23977 ?auto_23988 ) ) ( not ( = ?auto_23977 ?auto_23994 ) ) ( not ( = ?auto_23977 ?auto_23993 ) ) ( not ( = ?auto_23977 ?auto_23985 ) ) ( not ( = ?auto_23977 ?auto_24000 ) ) ( not ( = ?auto_23977 ?auto_24004 ) ) ( not ( = ?auto_23977 ?auto_23996 ) ) ( not ( = ?auto_23977 ?auto_23999 ) ) ( not ( = ?auto_23981 ?auto_24005 ) ) ( not ( = ?auto_23981 ?auto_23986 ) ) ( not ( = ?auto_23981 ?auto_23991 ) ) ( not ( = ?auto_23981 ?auto_23989 ) ) ( not ( = ?auto_23981 ?auto_23990 ) ) ( not ( = ?auto_23981 ?auto_24003 ) ) ( not ( = ?auto_23981 ?auto_23998 ) ) ( not ( = ?auto_23980 ?auto_23992 ) ) ( not ( = ?auto_23980 ?auto_24001 ) ) ( not ( = ?auto_23980 ?auto_23995 ) ) ( not ( = ?auto_23980 ?auto_23984 ) ) ( not ( = ?auto_23980 ?auto_24002 ) ) ( not ( = ?auto_23980 ?auto_23987 ) ) ( not ( = ?auto_23980 ?auto_23997 ) ) ( not ( = ?auto_23979 ?auto_23988 ) ) ( not ( = ?auto_23979 ?auto_23994 ) ) ( not ( = ?auto_23979 ?auto_23993 ) ) ( not ( = ?auto_23979 ?auto_23985 ) ) ( not ( = ?auto_23979 ?auto_24000 ) ) ( not ( = ?auto_23979 ?auto_24004 ) ) ( not ( = ?auto_23979 ?auto_23996 ) ) ( not ( = ?auto_23979 ?auto_23999 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_23968 ?auto_23969 ?auto_23970 ?auto_23971 ?auto_23972 ?auto_23973 ?auto_23974 ?auto_23975 ?auto_23976 )
      ( MAKE-1CRATE ?auto_23976 ?auto_23977 )
      ( MAKE-9CRATE-VERIFY ?auto_23968 ?auto_23969 ?auto_23970 ?auto_23971 ?auto_23972 ?auto_23973 ?auto_23974 ?auto_23975 ?auto_23976 ?auto_23977 ) )
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
      ?auto_24034 - SURFACE
      ?auto_24035 - SURFACE
      ?auto_24036 - SURFACE
      ?auto_24037 - SURFACE
    )
    :vars
    (
      ?auto_24039 - HOIST
      ?auto_24041 - PLACE
      ?auto_24040 - PLACE
      ?auto_24043 - HOIST
      ?auto_24042 - SURFACE
      ?auto_24056 - PLACE
      ?auto_24055 - HOIST
      ?auto_24058 - SURFACE
      ?auto_24063 - PLACE
      ?auto_24053 - HOIST
      ?auto_24067 - SURFACE
      ?auto_24051 - PLACE
      ?auto_24047 - HOIST
      ?auto_24052 - SURFACE
      ?auto_24064 - PLACE
      ?auto_24060 - HOIST
      ?auto_24059 - SURFACE
      ?auto_24066 - PLACE
      ?auto_24057 - HOIST
      ?auto_24049 - SURFACE
      ?auto_24065 - PLACE
      ?auto_24050 - HOIST
      ?auto_24044 - SURFACE
      ?auto_24062 - PLACE
      ?auto_24048 - HOIST
      ?auto_24061 - SURFACE
      ?auto_24068 - SURFACE
      ?auto_24045 - PLACE
      ?auto_24046 - HOIST
      ?auto_24054 - SURFACE
      ?auto_24038 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24039 ?auto_24041 ) ( IS-CRATE ?auto_24037 ) ( not ( = ?auto_24040 ?auto_24041 ) ) ( HOIST-AT ?auto_24043 ?auto_24040 ) ( AVAILABLE ?auto_24043 ) ( SURFACE-AT ?auto_24037 ?auto_24040 ) ( ON ?auto_24037 ?auto_24042 ) ( CLEAR ?auto_24037 ) ( not ( = ?auto_24036 ?auto_24037 ) ) ( not ( = ?auto_24036 ?auto_24042 ) ) ( not ( = ?auto_24037 ?auto_24042 ) ) ( not ( = ?auto_24039 ?auto_24043 ) ) ( IS-CRATE ?auto_24036 ) ( not ( = ?auto_24056 ?auto_24041 ) ) ( HOIST-AT ?auto_24055 ?auto_24056 ) ( AVAILABLE ?auto_24055 ) ( SURFACE-AT ?auto_24036 ?auto_24056 ) ( ON ?auto_24036 ?auto_24058 ) ( CLEAR ?auto_24036 ) ( not ( = ?auto_24035 ?auto_24036 ) ) ( not ( = ?auto_24035 ?auto_24058 ) ) ( not ( = ?auto_24036 ?auto_24058 ) ) ( not ( = ?auto_24039 ?auto_24055 ) ) ( IS-CRATE ?auto_24035 ) ( not ( = ?auto_24063 ?auto_24041 ) ) ( HOIST-AT ?auto_24053 ?auto_24063 ) ( AVAILABLE ?auto_24053 ) ( SURFACE-AT ?auto_24035 ?auto_24063 ) ( ON ?auto_24035 ?auto_24067 ) ( CLEAR ?auto_24035 ) ( not ( = ?auto_24034 ?auto_24035 ) ) ( not ( = ?auto_24034 ?auto_24067 ) ) ( not ( = ?auto_24035 ?auto_24067 ) ) ( not ( = ?auto_24039 ?auto_24053 ) ) ( IS-CRATE ?auto_24034 ) ( not ( = ?auto_24051 ?auto_24041 ) ) ( HOIST-AT ?auto_24047 ?auto_24051 ) ( AVAILABLE ?auto_24047 ) ( SURFACE-AT ?auto_24034 ?auto_24051 ) ( ON ?auto_24034 ?auto_24052 ) ( CLEAR ?auto_24034 ) ( not ( = ?auto_24033 ?auto_24034 ) ) ( not ( = ?auto_24033 ?auto_24052 ) ) ( not ( = ?auto_24034 ?auto_24052 ) ) ( not ( = ?auto_24039 ?auto_24047 ) ) ( IS-CRATE ?auto_24033 ) ( not ( = ?auto_24064 ?auto_24041 ) ) ( HOIST-AT ?auto_24060 ?auto_24064 ) ( SURFACE-AT ?auto_24033 ?auto_24064 ) ( ON ?auto_24033 ?auto_24059 ) ( CLEAR ?auto_24033 ) ( not ( = ?auto_24032 ?auto_24033 ) ) ( not ( = ?auto_24032 ?auto_24059 ) ) ( not ( = ?auto_24033 ?auto_24059 ) ) ( not ( = ?auto_24039 ?auto_24060 ) ) ( IS-CRATE ?auto_24032 ) ( not ( = ?auto_24066 ?auto_24041 ) ) ( HOIST-AT ?auto_24057 ?auto_24066 ) ( AVAILABLE ?auto_24057 ) ( SURFACE-AT ?auto_24032 ?auto_24066 ) ( ON ?auto_24032 ?auto_24049 ) ( CLEAR ?auto_24032 ) ( not ( = ?auto_24031 ?auto_24032 ) ) ( not ( = ?auto_24031 ?auto_24049 ) ) ( not ( = ?auto_24032 ?auto_24049 ) ) ( not ( = ?auto_24039 ?auto_24057 ) ) ( IS-CRATE ?auto_24031 ) ( not ( = ?auto_24065 ?auto_24041 ) ) ( HOIST-AT ?auto_24050 ?auto_24065 ) ( AVAILABLE ?auto_24050 ) ( SURFACE-AT ?auto_24031 ?auto_24065 ) ( ON ?auto_24031 ?auto_24044 ) ( CLEAR ?auto_24031 ) ( not ( = ?auto_24030 ?auto_24031 ) ) ( not ( = ?auto_24030 ?auto_24044 ) ) ( not ( = ?auto_24031 ?auto_24044 ) ) ( not ( = ?auto_24039 ?auto_24050 ) ) ( IS-CRATE ?auto_24030 ) ( not ( = ?auto_24062 ?auto_24041 ) ) ( HOIST-AT ?auto_24048 ?auto_24062 ) ( AVAILABLE ?auto_24048 ) ( SURFACE-AT ?auto_24030 ?auto_24062 ) ( ON ?auto_24030 ?auto_24061 ) ( CLEAR ?auto_24030 ) ( not ( = ?auto_24029 ?auto_24030 ) ) ( not ( = ?auto_24029 ?auto_24061 ) ) ( not ( = ?auto_24030 ?auto_24061 ) ) ( not ( = ?auto_24039 ?auto_24048 ) ) ( IS-CRATE ?auto_24029 ) ( AVAILABLE ?auto_24060 ) ( SURFACE-AT ?auto_24029 ?auto_24064 ) ( ON ?auto_24029 ?auto_24068 ) ( CLEAR ?auto_24029 ) ( not ( = ?auto_24028 ?auto_24029 ) ) ( not ( = ?auto_24028 ?auto_24068 ) ) ( not ( = ?auto_24029 ?auto_24068 ) ) ( SURFACE-AT ?auto_24027 ?auto_24041 ) ( CLEAR ?auto_24027 ) ( IS-CRATE ?auto_24028 ) ( AVAILABLE ?auto_24039 ) ( not ( = ?auto_24045 ?auto_24041 ) ) ( HOIST-AT ?auto_24046 ?auto_24045 ) ( AVAILABLE ?auto_24046 ) ( SURFACE-AT ?auto_24028 ?auto_24045 ) ( ON ?auto_24028 ?auto_24054 ) ( CLEAR ?auto_24028 ) ( TRUCK-AT ?auto_24038 ?auto_24041 ) ( not ( = ?auto_24027 ?auto_24028 ) ) ( not ( = ?auto_24027 ?auto_24054 ) ) ( not ( = ?auto_24028 ?auto_24054 ) ) ( not ( = ?auto_24039 ?auto_24046 ) ) ( not ( = ?auto_24027 ?auto_24029 ) ) ( not ( = ?auto_24027 ?auto_24068 ) ) ( not ( = ?auto_24029 ?auto_24054 ) ) ( not ( = ?auto_24064 ?auto_24045 ) ) ( not ( = ?auto_24060 ?auto_24046 ) ) ( not ( = ?auto_24068 ?auto_24054 ) ) ( not ( = ?auto_24027 ?auto_24030 ) ) ( not ( = ?auto_24027 ?auto_24061 ) ) ( not ( = ?auto_24028 ?auto_24030 ) ) ( not ( = ?auto_24028 ?auto_24061 ) ) ( not ( = ?auto_24030 ?auto_24068 ) ) ( not ( = ?auto_24030 ?auto_24054 ) ) ( not ( = ?auto_24062 ?auto_24064 ) ) ( not ( = ?auto_24062 ?auto_24045 ) ) ( not ( = ?auto_24048 ?auto_24060 ) ) ( not ( = ?auto_24048 ?auto_24046 ) ) ( not ( = ?auto_24061 ?auto_24068 ) ) ( not ( = ?auto_24061 ?auto_24054 ) ) ( not ( = ?auto_24027 ?auto_24031 ) ) ( not ( = ?auto_24027 ?auto_24044 ) ) ( not ( = ?auto_24028 ?auto_24031 ) ) ( not ( = ?auto_24028 ?auto_24044 ) ) ( not ( = ?auto_24029 ?auto_24031 ) ) ( not ( = ?auto_24029 ?auto_24044 ) ) ( not ( = ?auto_24031 ?auto_24061 ) ) ( not ( = ?auto_24031 ?auto_24068 ) ) ( not ( = ?auto_24031 ?auto_24054 ) ) ( not ( = ?auto_24065 ?auto_24062 ) ) ( not ( = ?auto_24065 ?auto_24064 ) ) ( not ( = ?auto_24065 ?auto_24045 ) ) ( not ( = ?auto_24050 ?auto_24048 ) ) ( not ( = ?auto_24050 ?auto_24060 ) ) ( not ( = ?auto_24050 ?auto_24046 ) ) ( not ( = ?auto_24044 ?auto_24061 ) ) ( not ( = ?auto_24044 ?auto_24068 ) ) ( not ( = ?auto_24044 ?auto_24054 ) ) ( not ( = ?auto_24027 ?auto_24032 ) ) ( not ( = ?auto_24027 ?auto_24049 ) ) ( not ( = ?auto_24028 ?auto_24032 ) ) ( not ( = ?auto_24028 ?auto_24049 ) ) ( not ( = ?auto_24029 ?auto_24032 ) ) ( not ( = ?auto_24029 ?auto_24049 ) ) ( not ( = ?auto_24030 ?auto_24032 ) ) ( not ( = ?auto_24030 ?auto_24049 ) ) ( not ( = ?auto_24032 ?auto_24044 ) ) ( not ( = ?auto_24032 ?auto_24061 ) ) ( not ( = ?auto_24032 ?auto_24068 ) ) ( not ( = ?auto_24032 ?auto_24054 ) ) ( not ( = ?auto_24066 ?auto_24065 ) ) ( not ( = ?auto_24066 ?auto_24062 ) ) ( not ( = ?auto_24066 ?auto_24064 ) ) ( not ( = ?auto_24066 ?auto_24045 ) ) ( not ( = ?auto_24057 ?auto_24050 ) ) ( not ( = ?auto_24057 ?auto_24048 ) ) ( not ( = ?auto_24057 ?auto_24060 ) ) ( not ( = ?auto_24057 ?auto_24046 ) ) ( not ( = ?auto_24049 ?auto_24044 ) ) ( not ( = ?auto_24049 ?auto_24061 ) ) ( not ( = ?auto_24049 ?auto_24068 ) ) ( not ( = ?auto_24049 ?auto_24054 ) ) ( not ( = ?auto_24027 ?auto_24033 ) ) ( not ( = ?auto_24027 ?auto_24059 ) ) ( not ( = ?auto_24028 ?auto_24033 ) ) ( not ( = ?auto_24028 ?auto_24059 ) ) ( not ( = ?auto_24029 ?auto_24033 ) ) ( not ( = ?auto_24029 ?auto_24059 ) ) ( not ( = ?auto_24030 ?auto_24033 ) ) ( not ( = ?auto_24030 ?auto_24059 ) ) ( not ( = ?auto_24031 ?auto_24033 ) ) ( not ( = ?auto_24031 ?auto_24059 ) ) ( not ( = ?auto_24033 ?auto_24049 ) ) ( not ( = ?auto_24033 ?auto_24044 ) ) ( not ( = ?auto_24033 ?auto_24061 ) ) ( not ( = ?auto_24033 ?auto_24068 ) ) ( not ( = ?auto_24033 ?auto_24054 ) ) ( not ( = ?auto_24059 ?auto_24049 ) ) ( not ( = ?auto_24059 ?auto_24044 ) ) ( not ( = ?auto_24059 ?auto_24061 ) ) ( not ( = ?auto_24059 ?auto_24068 ) ) ( not ( = ?auto_24059 ?auto_24054 ) ) ( not ( = ?auto_24027 ?auto_24034 ) ) ( not ( = ?auto_24027 ?auto_24052 ) ) ( not ( = ?auto_24028 ?auto_24034 ) ) ( not ( = ?auto_24028 ?auto_24052 ) ) ( not ( = ?auto_24029 ?auto_24034 ) ) ( not ( = ?auto_24029 ?auto_24052 ) ) ( not ( = ?auto_24030 ?auto_24034 ) ) ( not ( = ?auto_24030 ?auto_24052 ) ) ( not ( = ?auto_24031 ?auto_24034 ) ) ( not ( = ?auto_24031 ?auto_24052 ) ) ( not ( = ?auto_24032 ?auto_24034 ) ) ( not ( = ?auto_24032 ?auto_24052 ) ) ( not ( = ?auto_24034 ?auto_24059 ) ) ( not ( = ?auto_24034 ?auto_24049 ) ) ( not ( = ?auto_24034 ?auto_24044 ) ) ( not ( = ?auto_24034 ?auto_24061 ) ) ( not ( = ?auto_24034 ?auto_24068 ) ) ( not ( = ?auto_24034 ?auto_24054 ) ) ( not ( = ?auto_24051 ?auto_24064 ) ) ( not ( = ?auto_24051 ?auto_24066 ) ) ( not ( = ?auto_24051 ?auto_24065 ) ) ( not ( = ?auto_24051 ?auto_24062 ) ) ( not ( = ?auto_24051 ?auto_24045 ) ) ( not ( = ?auto_24047 ?auto_24060 ) ) ( not ( = ?auto_24047 ?auto_24057 ) ) ( not ( = ?auto_24047 ?auto_24050 ) ) ( not ( = ?auto_24047 ?auto_24048 ) ) ( not ( = ?auto_24047 ?auto_24046 ) ) ( not ( = ?auto_24052 ?auto_24059 ) ) ( not ( = ?auto_24052 ?auto_24049 ) ) ( not ( = ?auto_24052 ?auto_24044 ) ) ( not ( = ?auto_24052 ?auto_24061 ) ) ( not ( = ?auto_24052 ?auto_24068 ) ) ( not ( = ?auto_24052 ?auto_24054 ) ) ( not ( = ?auto_24027 ?auto_24035 ) ) ( not ( = ?auto_24027 ?auto_24067 ) ) ( not ( = ?auto_24028 ?auto_24035 ) ) ( not ( = ?auto_24028 ?auto_24067 ) ) ( not ( = ?auto_24029 ?auto_24035 ) ) ( not ( = ?auto_24029 ?auto_24067 ) ) ( not ( = ?auto_24030 ?auto_24035 ) ) ( not ( = ?auto_24030 ?auto_24067 ) ) ( not ( = ?auto_24031 ?auto_24035 ) ) ( not ( = ?auto_24031 ?auto_24067 ) ) ( not ( = ?auto_24032 ?auto_24035 ) ) ( not ( = ?auto_24032 ?auto_24067 ) ) ( not ( = ?auto_24033 ?auto_24035 ) ) ( not ( = ?auto_24033 ?auto_24067 ) ) ( not ( = ?auto_24035 ?auto_24052 ) ) ( not ( = ?auto_24035 ?auto_24059 ) ) ( not ( = ?auto_24035 ?auto_24049 ) ) ( not ( = ?auto_24035 ?auto_24044 ) ) ( not ( = ?auto_24035 ?auto_24061 ) ) ( not ( = ?auto_24035 ?auto_24068 ) ) ( not ( = ?auto_24035 ?auto_24054 ) ) ( not ( = ?auto_24063 ?auto_24051 ) ) ( not ( = ?auto_24063 ?auto_24064 ) ) ( not ( = ?auto_24063 ?auto_24066 ) ) ( not ( = ?auto_24063 ?auto_24065 ) ) ( not ( = ?auto_24063 ?auto_24062 ) ) ( not ( = ?auto_24063 ?auto_24045 ) ) ( not ( = ?auto_24053 ?auto_24047 ) ) ( not ( = ?auto_24053 ?auto_24060 ) ) ( not ( = ?auto_24053 ?auto_24057 ) ) ( not ( = ?auto_24053 ?auto_24050 ) ) ( not ( = ?auto_24053 ?auto_24048 ) ) ( not ( = ?auto_24053 ?auto_24046 ) ) ( not ( = ?auto_24067 ?auto_24052 ) ) ( not ( = ?auto_24067 ?auto_24059 ) ) ( not ( = ?auto_24067 ?auto_24049 ) ) ( not ( = ?auto_24067 ?auto_24044 ) ) ( not ( = ?auto_24067 ?auto_24061 ) ) ( not ( = ?auto_24067 ?auto_24068 ) ) ( not ( = ?auto_24067 ?auto_24054 ) ) ( not ( = ?auto_24027 ?auto_24036 ) ) ( not ( = ?auto_24027 ?auto_24058 ) ) ( not ( = ?auto_24028 ?auto_24036 ) ) ( not ( = ?auto_24028 ?auto_24058 ) ) ( not ( = ?auto_24029 ?auto_24036 ) ) ( not ( = ?auto_24029 ?auto_24058 ) ) ( not ( = ?auto_24030 ?auto_24036 ) ) ( not ( = ?auto_24030 ?auto_24058 ) ) ( not ( = ?auto_24031 ?auto_24036 ) ) ( not ( = ?auto_24031 ?auto_24058 ) ) ( not ( = ?auto_24032 ?auto_24036 ) ) ( not ( = ?auto_24032 ?auto_24058 ) ) ( not ( = ?auto_24033 ?auto_24036 ) ) ( not ( = ?auto_24033 ?auto_24058 ) ) ( not ( = ?auto_24034 ?auto_24036 ) ) ( not ( = ?auto_24034 ?auto_24058 ) ) ( not ( = ?auto_24036 ?auto_24067 ) ) ( not ( = ?auto_24036 ?auto_24052 ) ) ( not ( = ?auto_24036 ?auto_24059 ) ) ( not ( = ?auto_24036 ?auto_24049 ) ) ( not ( = ?auto_24036 ?auto_24044 ) ) ( not ( = ?auto_24036 ?auto_24061 ) ) ( not ( = ?auto_24036 ?auto_24068 ) ) ( not ( = ?auto_24036 ?auto_24054 ) ) ( not ( = ?auto_24056 ?auto_24063 ) ) ( not ( = ?auto_24056 ?auto_24051 ) ) ( not ( = ?auto_24056 ?auto_24064 ) ) ( not ( = ?auto_24056 ?auto_24066 ) ) ( not ( = ?auto_24056 ?auto_24065 ) ) ( not ( = ?auto_24056 ?auto_24062 ) ) ( not ( = ?auto_24056 ?auto_24045 ) ) ( not ( = ?auto_24055 ?auto_24053 ) ) ( not ( = ?auto_24055 ?auto_24047 ) ) ( not ( = ?auto_24055 ?auto_24060 ) ) ( not ( = ?auto_24055 ?auto_24057 ) ) ( not ( = ?auto_24055 ?auto_24050 ) ) ( not ( = ?auto_24055 ?auto_24048 ) ) ( not ( = ?auto_24055 ?auto_24046 ) ) ( not ( = ?auto_24058 ?auto_24067 ) ) ( not ( = ?auto_24058 ?auto_24052 ) ) ( not ( = ?auto_24058 ?auto_24059 ) ) ( not ( = ?auto_24058 ?auto_24049 ) ) ( not ( = ?auto_24058 ?auto_24044 ) ) ( not ( = ?auto_24058 ?auto_24061 ) ) ( not ( = ?auto_24058 ?auto_24068 ) ) ( not ( = ?auto_24058 ?auto_24054 ) ) ( not ( = ?auto_24027 ?auto_24037 ) ) ( not ( = ?auto_24027 ?auto_24042 ) ) ( not ( = ?auto_24028 ?auto_24037 ) ) ( not ( = ?auto_24028 ?auto_24042 ) ) ( not ( = ?auto_24029 ?auto_24037 ) ) ( not ( = ?auto_24029 ?auto_24042 ) ) ( not ( = ?auto_24030 ?auto_24037 ) ) ( not ( = ?auto_24030 ?auto_24042 ) ) ( not ( = ?auto_24031 ?auto_24037 ) ) ( not ( = ?auto_24031 ?auto_24042 ) ) ( not ( = ?auto_24032 ?auto_24037 ) ) ( not ( = ?auto_24032 ?auto_24042 ) ) ( not ( = ?auto_24033 ?auto_24037 ) ) ( not ( = ?auto_24033 ?auto_24042 ) ) ( not ( = ?auto_24034 ?auto_24037 ) ) ( not ( = ?auto_24034 ?auto_24042 ) ) ( not ( = ?auto_24035 ?auto_24037 ) ) ( not ( = ?auto_24035 ?auto_24042 ) ) ( not ( = ?auto_24037 ?auto_24058 ) ) ( not ( = ?auto_24037 ?auto_24067 ) ) ( not ( = ?auto_24037 ?auto_24052 ) ) ( not ( = ?auto_24037 ?auto_24059 ) ) ( not ( = ?auto_24037 ?auto_24049 ) ) ( not ( = ?auto_24037 ?auto_24044 ) ) ( not ( = ?auto_24037 ?auto_24061 ) ) ( not ( = ?auto_24037 ?auto_24068 ) ) ( not ( = ?auto_24037 ?auto_24054 ) ) ( not ( = ?auto_24040 ?auto_24056 ) ) ( not ( = ?auto_24040 ?auto_24063 ) ) ( not ( = ?auto_24040 ?auto_24051 ) ) ( not ( = ?auto_24040 ?auto_24064 ) ) ( not ( = ?auto_24040 ?auto_24066 ) ) ( not ( = ?auto_24040 ?auto_24065 ) ) ( not ( = ?auto_24040 ?auto_24062 ) ) ( not ( = ?auto_24040 ?auto_24045 ) ) ( not ( = ?auto_24043 ?auto_24055 ) ) ( not ( = ?auto_24043 ?auto_24053 ) ) ( not ( = ?auto_24043 ?auto_24047 ) ) ( not ( = ?auto_24043 ?auto_24060 ) ) ( not ( = ?auto_24043 ?auto_24057 ) ) ( not ( = ?auto_24043 ?auto_24050 ) ) ( not ( = ?auto_24043 ?auto_24048 ) ) ( not ( = ?auto_24043 ?auto_24046 ) ) ( not ( = ?auto_24042 ?auto_24058 ) ) ( not ( = ?auto_24042 ?auto_24067 ) ) ( not ( = ?auto_24042 ?auto_24052 ) ) ( not ( = ?auto_24042 ?auto_24059 ) ) ( not ( = ?auto_24042 ?auto_24049 ) ) ( not ( = ?auto_24042 ?auto_24044 ) ) ( not ( = ?auto_24042 ?auto_24061 ) ) ( not ( = ?auto_24042 ?auto_24068 ) ) ( not ( = ?auto_24042 ?auto_24054 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_24027 ?auto_24028 ?auto_24029 ?auto_24030 ?auto_24031 ?auto_24032 ?auto_24033 ?auto_24034 ?auto_24035 ?auto_24036 )
      ( MAKE-1CRATE ?auto_24036 ?auto_24037 )
      ( MAKE-10CRATE-VERIFY ?auto_24027 ?auto_24028 ?auto_24029 ?auto_24030 ?auto_24031 ?auto_24032 ?auto_24033 ?auto_24034 ?auto_24035 ?auto_24036 ?auto_24037 ) )
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
      ?auto_24098 - SURFACE
      ?auto_24099 - SURFACE
      ?auto_24100 - SURFACE
      ?auto_24101 - SURFACE
      ?auto_24102 - SURFACE
    )
    :vars
    (
      ?auto_24108 - HOIST
      ?auto_24105 - PLACE
      ?auto_24103 - PLACE
      ?auto_24104 - HOIST
      ?auto_24106 - SURFACE
      ?auto_24109 - PLACE
      ?auto_24118 - HOIST
      ?auto_24112 - SURFACE
      ?auto_24119 - PLACE
      ?auto_24129 - HOIST
      ?auto_24122 - SURFACE
      ?auto_24132 - PLACE
      ?auto_24120 - HOIST
      ?auto_24121 - SURFACE
      ?auto_24133 - PLACE
      ?auto_24114 - HOIST
      ?auto_24111 - SURFACE
      ?auto_24134 - PLACE
      ?auto_24127 - HOIST
      ?auto_24116 - SURFACE
      ?auto_24113 - SURFACE
      ?auto_24110 - PLACE
      ?auto_24123 - HOIST
      ?auto_24125 - SURFACE
      ?auto_24128 - PLACE
      ?auto_24124 - HOIST
      ?auto_24130 - SURFACE
      ?auto_24117 - SURFACE
      ?auto_24115 - PLACE
      ?auto_24126 - HOIST
      ?auto_24131 - SURFACE
      ?auto_24107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24108 ?auto_24105 ) ( IS-CRATE ?auto_24102 ) ( not ( = ?auto_24103 ?auto_24105 ) ) ( HOIST-AT ?auto_24104 ?auto_24103 ) ( SURFACE-AT ?auto_24102 ?auto_24103 ) ( ON ?auto_24102 ?auto_24106 ) ( CLEAR ?auto_24102 ) ( not ( = ?auto_24101 ?auto_24102 ) ) ( not ( = ?auto_24101 ?auto_24106 ) ) ( not ( = ?auto_24102 ?auto_24106 ) ) ( not ( = ?auto_24108 ?auto_24104 ) ) ( IS-CRATE ?auto_24101 ) ( not ( = ?auto_24109 ?auto_24105 ) ) ( HOIST-AT ?auto_24118 ?auto_24109 ) ( AVAILABLE ?auto_24118 ) ( SURFACE-AT ?auto_24101 ?auto_24109 ) ( ON ?auto_24101 ?auto_24112 ) ( CLEAR ?auto_24101 ) ( not ( = ?auto_24100 ?auto_24101 ) ) ( not ( = ?auto_24100 ?auto_24112 ) ) ( not ( = ?auto_24101 ?auto_24112 ) ) ( not ( = ?auto_24108 ?auto_24118 ) ) ( IS-CRATE ?auto_24100 ) ( not ( = ?auto_24119 ?auto_24105 ) ) ( HOIST-AT ?auto_24129 ?auto_24119 ) ( AVAILABLE ?auto_24129 ) ( SURFACE-AT ?auto_24100 ?auto_24119 ) ( ON ?auto_24100 ?auto_24122 ) ( CLEAR ?auto_24100 ) ( not ( = ?auto_24099 ?auto_24100 ) ) ( not ( = ?auto_24099 ?auto_24122 ) ) ( not ( = ?auto_24100 ?auto_24122 ) ) ( not ( = ?auto_24108 ?auto_24129 ) ) ( IS-CRATE ?auto_24099 ) ( not ( = ?auto_24132 ?auto_24105 ) ) ( HOIST-AT ?auto_24120 ?auto_24132 ) ( AVAILABLE ?auto_24120 ) ( SURFACE-AT ?auto_24099 ?auto_24132 ) ( ON ?auto_24099 ?auto_24121 ) ( CLEAR ?auto_24099 ) ( not ( = ?auto_24098 ?auto_24099 ) ) ( not ( = ?auto_24098 ?auto_24121 ) ) ( not ( = ?auto_24099 ?auto_24121 ) ) ( not ( = ?auto_24108 ?auto_24120 ) ) ( IS-CRATE ?auto_24098 ) ( not ( = ?auto_24133 ?auto_24105 ) ) ( HOIST-AT ?auto_24114 ?auto_24133 ) ( AVAILABLE ?auto_24114 ) ( SURFACE-AT ?auto_24098 ?auto_24133 ) ( ON ?auto_24098 ?auto_24111 ) ( CLEAR ?auto_24098 ) ( not ( = ?auto_24097 ?auto_24098 ) ) ( not ( = ?auto_24097 ?auto_24111 ) ) ( not ( = ?auto_24098 ?auto_24111 ) ) ( not ( = ?auto_24108 ?auto_24114 ) ) ( IS-CRATE ?auto_24097 ) ( not ( = ?auto_24134 ?auto_24105 ) ) ( HOIST-AT ?auto_24127 ?auto_24134 ) ( SURFACE-AT ?auto_24097 ?auto_24134 ) ( ON ?auto_24097 ?auto_24116 ) ( CLEAR ?auto_24097 ) ( not ( = ?auto_24096 ?auto_24097 ) ) ( not ( = ?auto_24096 ?auto_24116 ) ) ( not ( = ?auto_24097 ?auto_24116 ) ) ( not ( = ?auto_24108 ?auto_24127 ) ) ( IS-CRATE ?auto_24096 ) ( AVAILABLE ?auto_24104 ) ( SURFACE-AT ?auto_24096 ?auto_24103 ) ( ON ?auto_24096 ?auto_24113 ) ( CLEAR ?auto_24096 ) ( not ( = ?auto_24095 ?auto_24096 ) ) ( not ( = ?auto_24095 ?auto_24113 ) ) ( not ( = ?auto_24096 ?auto_24113 ) ) ( IS-CRATE ?auto_24095 ) ( not ( = ?auto_24110 ?auto_24105 ) ) ( HOIST-AT ?auto_24123 ?auto_24110 ) ( AVAILABLE ?auto_24123 ) ( SURFACE-AT ?auto_24095 ?auto_24110 ) ( ON ?auto_24095 ?auto_24125 ) ( CLEAR ?auto_24095 ) ( not ( = ?auto_24094 ?auto_24095 ) ) ( not ( = ?auto_24094 ?auto_24125 ) ) ( not ( = ?auto_24095 ?auto_24125 ) ) ( not ( = ?auto_24108 ?auto_24123 ) ) ( IS-CRATE ?auto_24094 ) ( not ( = ?auto_24128 ?auto_24105 ) ) ( HOIST-AT ?auto_24124 ?auto_24128 ) ( AVAILABLE ?auto_24124 ) ( SURFACE-AT ?auto_24094 ?auto_24128 ) ( ON ?auto_24094 ?auto_24130 ) ( CLEAR ?auto_24094 ) ( not ( = ?auto_24093 ?auto_24094 ) ) ( not ( = ?auto_24093 ?auto_24130 ) ) ( not ( = ?auto_24094 ?auto_24130 ) ) ( not ( = ?auto_24108 ?auto_24124 ) ) ( IS-CRATE ?auto_24093 ) ( AVAILABLE ?auto_24127 ) ( SURFACE-AT ?auto_24093 ?auto_24134 ) ( ON ?auto_24093 ?auto_24117 ) ( CLEAR ?auto_24093 ) ( not ( = ?auto_24092 ?auto_24093 ) ) ( not ( = ?auto_24092 ?auto_24117 ) ) ( not ( = ?auto_24093 ?auto_24117 ) ) ( SURFACE-AT ?auto_24091 ?auto_24105 ) ( CLEAR ?auto_24091 ) ( IS-CRATE ?auto_24092 ) ( AVAILABLE ?auto_24108 ) ( not ( = ?auto_24115 ?auto_24105 ) ) ( HOIST-AT ?auto_24126 ?auto_24115 ) ( AVAILABLE ?auto_24126 ) ( SURFACE-AT ?auto_24092 ?auto_24115 ) ( ON ?auto_24092 ?auto_24131 ) ( CLEAR ?auto_24092 ) ( TRUCK-AT ?auto_24107 ?auto_24105 ) ( not ( = ?auto_24091 ?auto_24092 ) ) ( not ( = ?auto_24091 ?auto_24131 ) ) ( not ( = ?auto_24092 ?auto_24131 ) ) ( not ( = ?auto_24108 ?auto_24126 ) ) ( not ( = ?auto_24091 ?auto_24093 ) ) ( not ( = ?auto_24091 ?auto_24117 ) ) ( not ( = ?auto_24093 ?auto_24131 ) ) ( not ( = ?auto_24134 ?auto_24115 ) ) ( not ( = ?auto_24127 ?auto_24126 ) ) ( not ( = ?auto_24117 ?auto_24131 ) ) ( not ( = ?auto_24091 ?auto_24094 ) ) ( not ( = ?auto_24091 ?auto_24130 ) ) ( not ( = ?auto_24092 ?auto_24094 ) ) ( not ( = ?auto_24092 ?auto_24130 ) ) ( not ( = ?auto_24094 ?auto_24117 ) ) ( not ( = ?auto_24094 ?auto_24131 ) ) ( not ( = ?auto_24128 ?auto_24134 ) ) ( not ( = ?auto_24128 ?auto_24115 ) ) ( not ( = ?auto_24124 ?auto_24127 ) ) ( not ( = ?auto_24124 ?auto_24126 ) ) ( not ( = ?auto_24130 ?auto_24117 ) ) ( not ( = ?auto_24130 ?auto_24131 ) ) ( not ( = ?auto_24091 ?auto_24095 ) ) ( not ( = ?auto_24091 ?auto_24125 ) ) ( not ( = ?auto_24092 ?auto_24095 ) ) ( not ( = ?auto_24092 ?auto_24125 ) ) ( not ( = ?auto_24093 ?auto_24095 ) ) ( not ( = ?auto_24093 ?auto_24125 ) ) ( not ( = ?auto_24095 ?auto_24130 ) ) ( not ( = ?auto_24095 ?auto_24117 ) ) ( not ( = ?auto_24095 ?auto_24131 ) ) ( not ( = ?auto_24110 ?auto_24128 ) ) ( not ( = ?auto_24110 ?auto_24134 ) ) ( not ( = ?auto_24110 ?auto_24115 ) ) ( not ( = ?auto_24123 ?auto_24124 ) ) ( not ( = ?auto_24123 ?auto_24127 ) ) ( not ( = ?auto_24123 ?auto_24126 ) ) ( not ( = ?auto_24125 ?auto_24130 ) ) ( not ( = ?auto_24125 ?auto_24117 ) ) ( not ( = ?auto_24125 ?auto_24131 ) ) ( not ( = ?auto_24091 ?auto_24096 ) ) ( not ( = ?auto_24091 ?auto_24113 ) ) ( not ( = ?auto_24092 ?auto_24096 ) ) ( not ( = ?auto_24092 ?auto_24113 ) ) ( not ( = ?auto_24093 ?auto_24096 ) ) ( not ( = ?auto_24093 ?auto_24113 ) ) ( not ( = ?auto_24094 ?auto_24096 ) ) ( not ( = ?auto_24094 ?auto_24113 ) ) ( not ( = ?auto_24096 ?auto_24125 ) ) ( not ( = ?auto_24096 ?auto_24130 ) ) ( not ( = ?auto_24096 ?auto_24117 ) ) ( not ( = ?auto_24096 ?auto_24131 ) ) ( not ( = ?auto_24103 ?auto_24110 ) ) ( not ( = ?auto_24103 ?auto_24128 ) ) ( not ( = ?auto_24103 ?auto_24134 ) ) ( not ( = ?auto_24103 ?auto_24115 ) ) ( not ( = ?auto_24104 ?auto_24123 ) ) ( not ( = ?auto_24104 ?auto_24124 ) ) ( not ( = ?auto_24104 ?auto_24127 ) ) ( not ( = ?auto_24104 ?auto_24126 ) ) ( not ( = ?auto_24113 ?auto_24125 ) ) ( not ( = ?auto_24113 ?auto_24130 ) ) ( not ( = ?auto_24113 ?auto_24117 ) ) ( not ( = ?auto_24113 ?auto_24131 ) ) ( not ( = ?auto_24091 ?auto_24097 ) ) ( not ( = ?auto_24091 ?auto_24116 ) ) ( not ( = ?auto_24092 ?auto_24097 ) ) ( not ( = ?auto_24092 ?auto_24116 ) ) ( not ( = ?auto_24093 ?auto_24097 ) ) ( not ( = ?auto_24093 ?auto_24116 ) ) ( not ( = ?auto_24094 ?auto_24097 ) ) ( not ( = ?auto_24094 ?auto_24116 ) ) ( not ( = ?auto_24095 ?auto_24097 ) ) ( not ( = ?auto_24095 ?auto_24116 ) ) ( not ( = ?auto_24097 ?auto_24113 ) ) ( not ( = ?auto_24097 ?auto_24125 ) ) ( not ( = ?auto_24097 ?auto_24130 ) ) ( not ( = ?auto_24097 ?auto_24117 ) ) ( not ( = ?auto_24097 ?auto_24131 ) ) ( not ( = ?auto_24116 ?auto_24113 ) ) ( not ( = ?auto_24116 ?auto_24125 ) ) ( not ( = ?auto_24116 ?auto_24130 ) ) ( not ( = ?auto_24116 ?auto_24117 ) ) ( not ( = ?auto_24116 ?auto_24131 ) ) ( not ( = ?auto_24091 ?auto_24098 ) ) ( not ( = ?auto_24091 ?auto_24111 ) ) ( not ( = ?auto_24092 ?auto_24098 ) ) ( not ( = ?auto_24092 ?auto_24111 ) ) ( not ( = ?auto_24093 ?auto_24098 ) ) ( not ( = ?auto_24093 ?auto_24111 ) ) ( not ( = ?auto_24094 ?auto_24098 ) ) ( not ( = ?auto_24094 ?auto_24111 ) ) ( not ( = ?auto_24095 ?auto_24098 ) ) ( not ( = ?auto_24095 ?auto_24111 ) ) ( not ( = ?auto_24096 ?auto_24098 ) ) ( not ( = ?auto_24096 ?auto_24111 ) ) ( not ( = ?auto_24098 ?auto_24116 ) ) ( not ( = ?auto_24098 ?auto_24113 ) ) ( not ( = ?auto_24098 ?auto_24125 ) ) ( not ( = ?auto_24098 ?auto_24130 ) ) ( not ( = ?auto_24098 ?auto_24117 ) ) ( not ( = ?auto_24098 ?auto_24131 ) ) ( not ( = ?auto_24133 ?auto_24134 ) ) ( not ( = ?auto_24133 ?auto_24103 ) ) ( not ( = ?auto_24133 ?auto_24110 ) ) ( not ( = ?auto_24133 ?auto_24128 ) ) ( not ( = ?auto_24133 ?auto_24115 ) ) ( not ( = ?auto_24114 ?auto_24127 ) ) ( not ( = ?auto_24114 ?auto_24104 ) ) ( not ( = ?auto_24114 ?auto_24123 ) ) ( not ( = ?auto_24114 ?auto_24124 ) ) ( not ( = ?auto_24114 ?auto_24126 ) ) ( not ( = ?auto_24111 ?auto_24116 ) ) ( not ( = ?auto_24111 ?auto_24113 ) ) ( not ( = ?auto_24111 ?auto_24125 ) ) ( not ( = ?auto_24111 ?auto_24130 ) ) ( not ( = ?auto_24111 ?auto_24117 ) ) ( not ( = ?auto_24111 ?auto_24131 ) ) ( not ( = ?auto_24091 ?auto_24099 ) ) ( not ( = ?auto_24091 ?auto_24121 ) ) ( not ( = ?auto_24092 ?auto_24099 ) ) ( not ( = ?auto_24092 ?auto_24121 ) ) ( not ( = ?auto_24093 ?auto_24099 ) ) ( not ( = ?auto_24093 ?auto_24121 ) ) ( not ( = ?auto_24094 ?auto_24099 ) ) ( not ( = ?auto_24094 ?auto_24121 ) ) ( not ( = ?auto_24095 ?auto_24099 ) ) ( not ( = ?auto_24095 ?auto_24121 ) ) ( not ( = ?auto_24096 ?auto_24099 ) ) ( not ( = ?auto_24096 ?auto_24121 ) ) ( not ( = ?auto_24097 ?auto_24099 ) ) ( not ( = ?auto_24097 ?auto_24121 ) ) ( not ( = ?auto_24099 ?auto_24111 ) ) ( not ( = ?auto_24099 ?auto_24116 ) ) ( not ( = ?auto_24099 ?auto_24113 ) ) ( not ( = ?auto_24099 ?auto_24125 ) ) ( not ( = ?auto_24099 ?auto_24130 ) ) ( not ( = ?auto_24099 ?auto_24117 ) ) ( not ( = ?auto_24099 ?auto_24131 ) ) ( not ( = ?auto_24132 ?auto_24133 ) ) ( not ( = ?auto_24132 ?auto_24134 ) ) ( not ( = ?auto_24132 ?auto_24103 ) ) ( not ( = ?auto_24132 ?auto_24110 ) ) ( not ( = ?auto_24132 ?auto_24128 ) ) ( not ( = ?auto_24132 ?auto_24115 ) ) ( not ( = ?auto_24120 ?auto_24114 ) ) ( not ( = ?auto_24120 ?auto_24127 ) ) ( not ( = ?auto_24120 ?auto_24104 ) ) ( not ( = ?auto_24120 ?auto_24123 ) ) ( not ( = ?auto_24120 ?auto_24124 ) ) ( not ( = ?auto_24120 ?auto_24126 ) ) ( not ( = ?auto_24121 ?auto_24111 ) ) ( not ( = ?auto_24121 ?auto_24116 ) ) ( not ( = ?auto_24121 ?auto_24113 ) ) ( not ( = ?auto_24121 ?auto_24125 ) ) ( not ( = ?auto_24121 ?auto_24130 ) ) ( not ( = ?auto_24121 ?auto_24117 ) ) ( not ( = ?auto_24121 ?auto_24131 ) ) ( not ( = ?auto_24091 ?auto_24100 ) ) ( not ( = ?auto_24091 ?auto_24122 ) ) ( not ( = ?auto_24092 ?auto_24100 ) ) ( not ( = ?auto_24092 ?auto_24122 ) ) ( not ( = ?auto_24093 ?auto_24100 ) ) ( not ( = ?auto_24093 ?auto_24122 ) ) ( not ( = ?auto_24094 ?auto_24100 ) ) ( not ( = ?auto_24094 ?auto_24122 ) ) ( not ( = ?auto_24095 ?auto_24100 ) ) ( not ( = ?auto_24095 ?auto_24122 ) ) ( not ( = ?auto_24096 ?auto_24100 ) ) ( not ( = ?auto_24096 ?auto_24122 ) ) ( not ( = ?auto_24097 ?auto_24100 ) ) ( not ( = ?auto_24097 ?auto_24122 ) ) ( not ( = ?auto_24098 ?auto_24100 ) ) ( not ( = ?auto_24098 ?auto_24122 ) ) ( not ( = ?auto_24100 ?auto_24121 ) ) ( not ( = ?auto_24100 ?auto_24111 ) ) ( not ( = ?auto_24100 ?auto_24116 ) ) ( not ( = ?auto_24100 ?auto_24113 ) ) ( not ( = ?auto_24100 ?auto_24125 ) ) ( not ( = ?auto_24100 ?auto_24130 ) ) ( not ( = ?auto_24100 ?auto_24117 ) ) ( not ( = ?auto_24100 ?auto_24131 ) ) ( not ( = ?auto_24119 ?auto_24132 ) ) ( not ( = ?auto_24119 ?auto_24133 ) ) ( not ( = ?auto_24119 ?auto_24134 ) ) ( not ( = ?auto_24119 ?auto_24103 ) ) ( not ( = ?auto_24119 ?auto_24110 ) ) ( not ( = ?auto_24119 ?auto_24128 ) ) ( not ( = ?auto_24119 ?auto_24115 ) ) ( not ( = ?auto_24129 ?auto_24120 ) ) ( not ( = ?auto_24129 ?auto_24114 ) ) ( not ( = ?auto_24129 ?auto_24127 ) ) ( not ( = ?auto_24129 ?auto_24104 ) ) ( not ( = ?auto_24129 ?auto_24123 ) ) ( not ( = ?auto_24129 ?auto_24124 ) ) ( not ( = ?auto_24129 ?auto_24126 ) ) ( not ( = ?auto_24122 ?auto_24121 ) ) ( not ( = ?auto_24122 ?auto_24111 ) ) ( not ( = ?auto_24122 ?auto_24116 ) ) ( not ( = ?auto_24122 ?auto_24113 ) ) ( not ( = ?auto_24122 ?auto_24125 ) ) ( not ( = ?auto_24122 ?auto_24130 ) ) ( not ( = ?auto_24122 ?auto_24117 ) ) ( not ( = ?auto_24122 ?auto_24131 ) ) ( not ( = ?auto_24091 ?auto_24101 ) ) ( not ( = ?auto_24091 ?auto_24112 ) ) ( not ( = ?auto_24092 ?auto_24101 ) ) ( not ( = ?auto_24092 ?auto_24112 ) ) ( not ( = ?auto_24093 ?auto_24101 ) ) ( not ( = ?auto_24093 ?auto_24112 ) ) ( not ( = ?auto_24094 ?auto_24101 ) ) ( not ( = ?auto_24094 ?auto_24112 ) ) ( not ( = ?auto_24095 ?auto_24101 ) ) ( not ( = ?auto_24095 ?auto_24112 ) ) ( not ( = ?auto_24096 ?auto_24101 ) ) ( not ( = ?auto_24096 ?auto_24112 ) ) ( not ( = ?auto_24097 ?auto_24101 ) ) ( not ( = ?auto_24097 ?auto_24112 ) ) ( not ( = ?auto_24098 ?auto_24101 ) ) ( not ( = ?auto_24098 ?auto_24112 ) ) ( not ( = ?auto_24099 ?auto_24101 ) ) ( not ( = ?auto_24099 ?auto_24112 ) ) ( not ( = ?auto_24101 ?auto_24122 ) ) ( not ( = ?auto_24101 ?auto_24121 ) ) ( not ( = ?auto_24101 ?auto_24111 ) ) ( not ( = ?auto_24101 ?auto_24116 ) ) ( not ( = ?auto_24101 ?auto_24113 ) ) ( not ( = ?auto_24101 ?auto_24125 ) ) ( not ( = ?auto_24101 ?auto_24130 ) ) ( not ( = ?auto_24101 ?auto_24117 ) ) ( not ( = ?auto_24101 ?auto_24131 ) ) ( not ( = ?auto_24109 ?auto_24119 ) ) ( not ( = ?auto_24109 ?auto_24132 ) ) ( not ( = ?auto_24109 ?auto_24133 ) ) ( not ( = ?auto_24109 ?auto_24134 ) ) ( not ( = ?auto_24109 ?auto_24103 ) ) ( not ( = ?auto_24109 ?auto_24110 ) ) ( not ( = ?auto_24109 ?auto_24128 ) ) ( not ( = ?auto_24109 ?auto_24115 ) ) ( not ( = ?auto_24118 ?auto_24129 ) ) ( not ( = ?auto_24118 ?auto_24120 ) ) ( not ( = ?auto_24118 ?auto_24114 ) ) ( not ( = ?auto_24118 ?auto_24127 ) ) ( not ( = ?auto_24118 ?auto_24104 ) ) ( not ( = ?auto_24118 ?auto_24123 ) ) ( not ( = ?auto_24118 ?auto_24124 ) ) ( not ( = ?auto_24118 ?auto_24126 ) ) ( not ( = ?auto_24112 ?auto_24122 ) ) ( not ( = ?auto_24112 ?auto_24121 ) ) ( not ( = ?auto_24112 ?auto_24111 ) ) ( not ( = ?auto_24112 ?auto_24116 ) ) ( not ( = ?auto_24112 ?auto_24113 ) ) ( not ( = ?auto_24112 ?auto_24125 ) ) ( not ( = ?auto_24112 ?auto_24130 ) ) ( not ( = ?auto_24112 ?auto_24117 ) ) ( not ( = ?auto_24112 ?auto_24131 ) ) ( not ( = ?auto_24091 ?auto_24102 ) ) ( not ( = ?auto_24091 ?auto_24106 ) ) ( not ( = ?auto_24092 ?auto_24102 ) ) ( not ( = ?auto_24092 ?auto_24106 ) ) ( not ( = ?auto_24093 ?auto_24102 ) ) ( not ( = ?auto_24093 ?auto_24106 ) ) ( not ( = ?auto_24094 ?auto_24102 ) ) ( not ( = ?auto_24094 ?auto_24106 ) ) ( not ( = ?auto_24095 ?auto_24102 ) ) ( not ( = ?auto_24095 ?auto_24106 ) ) ( not ( = ?auto_24096 ?auto_24102 ) ) ( not ( = ?auto_24096 ?auto_24106 ) ) ( not ( = ?auto_24097 ?auto_24102 ) ) ( not ( = ?auto_24097 ?auto_24106 ) ) ( not ( = ?auto_24098 ?auto_24102 ) ) ( not ( = ?auto_24098 ?auto_24106 ) ) ( not ( = ?auto_24099 ?auto_24102 ) ) ( not ( = ?auto_24099 ?auto_24106 ) ) ( not ( = ?auto_24100 ?auto_24102 ) ) ( not ( = ?auto_24100 ?auto_24106 ) ) ( not ( = ?auto_24102 ?auto_24112 ) ) ( not ( = ?auto_24102 ?auto_24122 ) ) ( not ( = ?auto_24102 ?auto_24121 ) ) ( not ( = ?auto_24102 ?auto_24111 ) ) ( not ( = ?auto_24102 ?auto_24116 ) ) ( not ( = ?auto_24102 ?auto_24113 ) ) ( not ( = ?auto_24102 ?auto_24125 ) ) ( not ( = ?auto_24102 ?auto_24130 ) ) ( not ( = ?auto_24102 ?auto_24117 ) ) ( not ( = ?auto_24102 ?auto_24131 ) ) ( not ( = ?auto_24106 ?auto_24112 ) ) ( not ( = ?auto_24106 ?auto_24122 ) ) ( not ( = ?auto_24106 ?auto_24121 ) ) ( not ( = ?auto_24106 ?auto_24111 ) ) ( not ( = ?auto_24106 ?auto_24116 ) ) ( not ( = ?auto_24106 ?auto_24113 ) ) ( not ( = ?auto_24106 ?auto_24125 ) ) ( not ( = ?auto_24106 ?auto_24130 ) ) ( not ( = ?auto_24106 ?auto_24117 ) ) ( not ( = ?auto_24106 ?auto_24131 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_24091 ?auto_24092 ?auto_24093 ?auto_24094 ?auto_24095 ?auto_24096 ?auto_24097 ?auto_24098 ?auto_24099 ?auto_24100 ?auto_24101 )
      ( MAKE-1CRATE ?auto_24101 ?auto_24102 )
      ( MAKE-11CRATE-VERIFY ?auto_24091 ?auto_24092 ?auto_24093 ?auto_24094 ?auto_24095 ?auto_24096 ?auto_24097 ?auto_24098 ?auto_24099 ?auto_24100 ?auto_24101 ?auto_24102 ) )
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
      ?auto_24165 - SURFACE
      ?auto_24166 - SURFACE
      ?auto_24167 - SURFACE
      ?auto_24168 - SURFACE
      ?auto_24169 - SURFACE
      ?auto_24170 - SURFACE
    )
    :vars
    (
      ?auto_24176 - HOIST
      ?auto_24174 - PLACE
      ?auto_24171 - PLACE
      ?auto_24173 - HOIST
      ?auto_24175 - SURFACE
      ?auto_24184 - SURFACE
      ?auto_24182 - PLACE
      ?auto_24197 - HOIST
      ?auto_24199 - SURFACE
      ?auto_24181 - PLACE
      ?auto_24202 - HOIST
      ?auto_24180 - SURFACE
      ?auto_24190 - PLACE
      ?auto_24179 - HOIST
      ?auto_24201 - SURFACE
      ?auto_24194 - PLACE
      ?auto_24198 - HOIST
      ?auto_24193 - SURFACE
      ?auto_24188 - PLACE
      ?auto_24203 - HOIST
      ?auto_24200 - SURFACE
      ?auto_24191 - SURFACE
      ?auto_24192 - PLACE
      ?auto_24196 - HOIST
      ?auto_24186 - SURFACE
      ?auto_24177 - PLACE
      ?auto_24178 - HOIST
      ?auto_24185 - SURFACE
      ?auto_24189 - SURFACE
      ?auto_24195 - PLACE
      ?auto_24187 - HOIST
      ?auto_24183 - SURFACE
      ?auto_24172 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24176 ?auto_24174 ) ( IS-CRATE ?auto_24170 ) ( not ( = ?auto_24171 ?auto_24174 ) ) ( HOIST-AT ?auto_24173 ?auto_24171 ) ( SURFACE-AT ?auto_24170 ?auto_24171 ) ( ON ?auto_24170 ?auto_24175 ) ( CLEAR ?auto_24170 ) ( not ( = ?auto_24169 ?auto_24170 ) ) ( not ( = ?auto_24169 ?auto_24175 ) ) ( not ( = ?auto_24170 ?auto_24175 ) ) ( not ( = ?auto_24176 ?auto_24173 ) ) ( IS-CRATE ?auto_24169 ) ( SURFACE-AT ?auto_24169 ?auto_24171 ) ( ON ?auto_24169 ?auto_24184 ) ( CLEAR ?auto_24169 ) ( not ( = ?auto_24168 ?auto_24169 ) ) ( not ( = ?auto_24168 ?auto_24184 ) ) ( not ( = ?auto_24169 ?auto_24184 ) ) ( IS-CRATE ?auto_24168 ) ( not ( = ?auto_24182 ?auto_24174 ) ) ( HOIST-AT ?auto_24197 ?auto_24182 ) ( AVAILABLE ?auto_24197 ) ( SURFACE-AT ?auto_24168 ?auto_24182 ) ( ON ?auto_24168 ?auto_24199 ) ( CLEAR ?auto_24168 ) ( not ( = ?auto_24167 ?auto_24168 ) ) ( not ( = ?auto_24167 ?auto_24199 ) ) ( not ( = ?auto_24168 ?auto_24199 ) ) ( not ( = ?auto_24176 ?auto_24197 ) ) ( IS-CRATE ?auto_24167 ) ( not ( = ?auto_24181 ?auto_24174 ) ) ( HOIST-AT ?auto_24202 ?auto_24181 ) ( AVAILABLE ?auto_24202 ) ( SURFACE-AT ?auto_24167 ?auto_24181 ) ( ON ?auto_24167 ?auto_24180 ) ( CLEAR ?auto_24167 ) ( not ( = ?auto_24166 ?auto_24167 ) ) ( not ( = ?auto_24166 ?auto_24180 ) ) ( not ( = ?auto_24167 ?auto_24180 ) ) ( not ( = ?auto_24176 ?auto_24202 ) ) ( IS-CRATE ?auto_24166 ) ( not ( = ?auto_24190 ?auto_24174 ) ) ( HOIST-AT ?auto_24179 ?auto_24190 ) ( AVAILABLE ?auto_24179 ) ( SURFACE-AT ?auto_24166 ?auto_24190 ) ( ON ?auto_24166 ?auto_24201 ) ( CLEAR ?auto_24166 ) ( not ( = ?auto_24165 ?auto_24166 ) ) ( not ( = ?auto_24165 ?auto_24201 ) ) ( not ( = ?auto_24166 ?auto_24201 ) ) ( not ( = ?auto_24176 ?auto_24179 ) ) ( IS-CRATE ?auto_24165 ) ( not ( = ?auto_24194 ?auto_24174 ) ) ( HOIST-AT ?auto_24198 ?auto_24194 ) ( AVAILABLE ?auto_24198 ) ( SURFACE-AT ?auto_24165 ?auto_24194 ) ( ON ?auto_24165 ?auto_24193 ) ( CLEAR ?auto_24165 ) ( not ( = ?auto_24164 ?auto_24165 ) ) ( not ( = ?auto_24164 ?auto_24193 ) ) ( not ( = ?auto_24165 ?auto_24193 ) ) ( not ( = ?auto_24176 ?auto_24198 ) ) ( IS-CRATE ?auto_24164 ) ( not ( = ?auto_24188 ?auto_24174 ) ) ( HOIST-AT ?auto_24203 ?auto_24188 ) ( SURFACE-AT ?auto_24164 ?auto_24188 ) ( ON ?auto_24164 ?auto_24200 ) ( CLEAR ?auto_24164 ) ( not ( = ?auto_24163 ?auto_24164 ) ) ( not ( = ?auto_24163 ?auto_24200 ) ) ( not ( = ?auto_24164 ?auto_24200 ) ) ( not ( = ?auto_24176 ?auto_24203 ) ) ( IS-CRATE ?auto_24163 ) ( AVAILABLE ?auto_24173 ) ( SURFACE-AT ?auto_24163 ?auto_24171 ) ( ON ?auto_24163 ?auto_24191 ) ( CLEAR ?auto_24163 ) ( not ( = ?auto_24162 ?auto_24163 ) ) ( not ( = ?auto_24162 ?auto_24191 ) ) ( not ( = ?auto_24163 ?auto_24191 ) ) ( IS-CRATE ?auto_24162 ) ( not ( = ?auto_24192 ?auto_24174 ) ) ( HOIST-AT ?auto_24196 ?auto_24192 ) ( AVAILABLE ?auto_24196 ) ( SURFACE-AT ?auto_24162 ?auto_24192 ) ( ON ?auto_24162 ?auto_24186 ) ( CLEAR ?auto_24162 ) ( not ( = ?auto_24161 ?auto_24162 ) ) ( not ( = ?auto_24161 ?auto_24186 ) ) ( not ( = ?auto_24162 ?auto_24186 ) ) ( not ( = ?auto_24176 ?auto_24196 ) ) ( IS-CRATE ?auto_24161 ) ( not ( = ?auto_24177 ?auto_24174 ) ) ( HOIST-AT ?auto_24178 ?auto_24177 ) ( AVAILABLE ?auto_24178 ) ( SURFACE-AT ?auto_24161 ?auto_24177 ) ( ON ?auto_24161 ?auto_24185 ) ( CLEAR ?auto_24161 ) ( not ( = ?auto_24160 ?auto_24161 ) ) ( not ( = ?auto_24160 ?auto_24185 ) ) ( not ( = ?auto_24161 ?auto_24185 ) ) ( not ( = ?auto_24176 ?auto_24178 ) ) ( IS-CRATE ?auto_24160 ) ( AVAILABLE ?auto_24203 ) ( SURFACE-AT ?auto_24160 ?auto_24188 ) ( ON ?auto_24160 ?auto_24189 ) ( CLEAR ?auto_24160 ) ( not ( = ?auto_24159 ?auto_24160 ) ) ( not ( = ?auto_24159 ?auto_24189 ) ) ( not ( = ?auto_24160 ?auto_24189 ) ) ( SURFACE-AT ?auto_24158 ?auto_24174 ) ( CLEAR ?auto_24158 ) ( IS-CRATE ?auto_24159 ) ( AVAILABLE ?auto_24176 ) ( not ( = ?auto_24195 ?auto_24174 ) ) ( HOIST-AT ?auto_24187 ?auto_24195 ) ( AVAILABLE ?auto_24187 ) ( SURFACE-AT ?auto_24159 ?auto_24195 ) ( ON ?auto_24159 ?auto_24183 ) ( CLEAR ?auto_24159 ) ( TRUCK-AT ?auto_24172 ?auto_24174 ) ( not ( = ?auto_24158 ?auto_24159 ) ) ( not ( = ?auto_24158 ?auto_24183 ) ) ( not ( = ?auto_24159 ?auto_24183 ) ) ( not ( = ?auto_24176 ?auto_24187 ) ) ( not ( = ?auto_24158 ?auto_24160 ) ) ( not ( = ?auto_24158 ?auto_24189 ) ) ( not ( = ?auto_24160 ?auto_24183 ) ) ( not ( = ?auto_24188 ?auto_24195 ) ) ( not ( = ?auto_24203 ?auto_24187 ) ) ( not ( = ?auto_24189 ?auto_24183 ) ) ( not ( = ?auto_24158 ?auto_24161 ) ) ( not ( = ?auto_24158 ?auto_24185 ) ) ( not ( = ?auto_24159 ?auto_24161 ) ) ( not ( = ?auto_24159 ?auto_24185 ) ) ( not ( = ?auto_24161 ?auto_24189 ) ) ( not ( = ?auto_24161 ?auto_24183 ) ) ( not ( = ?auto_24177 ?auto_24188 ) ) ( not ( = ?auto_24177 ?auto_24195 ) ) ( not ( = ?auto_24178 ?auto_24203 ) ) ( not ( = ?auto_24178 ?auto_24187 ) ) ( not ( = ?auto_24185 ?auto_24189 ) ) ( not ( = ?auto_24185 ?auto_24183 ) ) ( not ( = ?auto_24158 ?auto_24162 ) ) ( not ( = ?auto_24158 ?auto_24186 ) ) ( not ( = ?auto_24159 ?auto_24162 ) ) ( not ( = ?auto_24159 ?auto_24186 ) ) ( not ( = ?auto_24160 ?auto_24162 ) ) ( not ( = ?auto_24160 ?auto_24186 ) ) ( not ( = ?auto_24162 ?auto_24185 ) ) ( not ( = ?auto_24162 ?auto_24189 ) ) ( not ( = ?auto_24162 ?auto_24183 ) ) ( not ( = ?auto_24192 ?auto_24177 ) ) ( not ( = ?auto_24192 ?auto_24188 ) ) ( not ( = ?auto_24192 ?auto_24195 ) ) ( not ( = ?auto_24196 ?auto_24178 ) ) ( not ( = ?auto_24196 ?auto_24203 ) ) ( not ( = ?auto_24196 ?auto_24187 ) ) ( not ( = ?auto_24186 ?auto_24185 ) ) ( not ( = ?auto_24186 ?auto_24189 ) ) ( not ( = ?auto_24186 ?auto_24183 ) ) ( not ( = ?auto_24158 ?auto_24163 ) ) ( not ( = ?auto_24158 ?auto_24191 ) ) ( not ( = ?auto_24159 ?auto_24163 ) ) ( not ( = ?auto_24159 ?auto_24191 ) ) ( not ( = ?auto_24160 ?auto_24163 ) ) ( not ( = ?auto_24160 ?auto_24191 ) ) ( not ( = ?auto_24161 ?auto_24163 ) ) ( not ( = ?auto_24161 ?auto_24191 ) ) ( not ( = ?auto_24163 ?auto_24186 ) ) ( not ( = ?auto_24163 ?auto_24185 ) ) ( not ( = ?auto_24163 ?auto_24189 ) ) ( not ( = ?auto_24163 ?auto_24183 ) ) ( not ( = ?auto_24171 ?auto_24192 ) ) ( not ( = ?auto_24171 ?auto_24177 ) ) ( not ( = ?auto_24171 ?auto_24188 ) ) ( not ( = ?auto_24171 ?auto_24195 ) ) ( not ( = ?auto_24173 ?auto_24196 ) ) ( not ( = ?auto_24173 ?auto_24178 ) ) ( not ( = ?auto_24173 ?auto_24203 ) ) ( not ( = ?auto_24173 ?auto_24187 ) ) ( not ( = ?auto_24191 ?auto_24186 ) ) ( not ( = ?auto_24191 ?auto_24185 ) ) ( not ( = ?auto_24191 ?auto_24189 ) ) ( not ( = ?auto_24191 ?auto_24183 ) ) ( not ( = ?auto_24158 ?auto_24164 ) ) ( not ( = ?auto_24158 ?auto_24200 ) ) ( not ( = ?auto_24159 ?auto_24164 ) ) ( not ( = ?auto_24159 ?auto_24200 ) ) ( not ( = ?auto_24160 ?auto_24164 ) ) ( not ( = ?auto_24160 ?auto_24200 ) ) ( not ( = ?auto_24161 ?auto_24164 ) ) ( not ( = ?auto_24161 ?auto_24200 ) ) ( not ( = ?auto_24162 ?auto_24164 ) ) ( not ( = ?auto_24162 ?auto_24200 ) ) ( not ( = ?auto_24164 ?auto_24191 ) ) ( not ( = ?auto_24164 ?auto_24186 ) ) ( not ( = ?auto_24164 ?auto_24185 ) ) ( not ( = ?auto_24164 ?auto_24189 ) ) ( not ( = ?auto_24164 ?auto_24183 ) ) ( not ( = ?auto_24200 ?auto_24191 ) ) ( not ( = ?auto_24200 ?auto_24186 ) ) ( not ( = ?auto_24200 ?auto_24185 ) ) ( not ( = ?auto_24200 ?auto_24189 ) ) ( not ( = ?auto_24200 ?auto_24183 ) ) ( not ( = ?auto_24158 ?auto_24165 ) ) ( not ( = ?auto_24158 ?auto_24193 ) ) ( not ( = ?auto_24159 ?auto_24165 ) ) ( not ( = ?auto_24159 ?auto_24193 ) ) ( not ( = ?auto_24160 ?auto_24165 ) ) ( not ( = ?auto_24160 ?auto_24193 ) ) ( not ( = ?auto_24161 ?auto_24165 ) ) ( not ( = ?auto_24161 ?auto_24193 ) ) ( not ( = ?auto_24162 ?auto_24165 ) ) ( not ( = ?auto_24162 ?auto_24193 ) ) ( not ( = ?auto_24163 ?auto_24165 ) ) ( not ( = ?auto_24163 ?auto_24193 ) ) ( not ( = ?auto_24165 ?auto_24200 ) ) ( not ( = ?auto_24165 ?auto_24191 ) ) ( not ( = ?auto_24165 ?auto_24186 ) ) ( not ( = ?auto_24165 ?auto_24185 ) ) ( not ( = ?auto_24165 ?auto_24189 ) ) ( not ( = ?auto_24165 ?auto_24183 ) ) ( not ( = ?auto_24194 ?auto_24188 ) ) ( not ( = ?auto_24194 ?auto_24171 ) ) ( not ( = ?auto_24194 ?auto_24192 ) ) ( not ( = ?auto_24194 ?auto_24177 ) ) ( not ( = ?auto_24194 ?auto_24195 ) ) ( not ( = ?auto_24198 ?auto_24203 ) ) ( not ( = ?auto_24198 ?auto_24173 ) ) ( not ( = ?auto_24198 ?auto_24196 ) ) ( not ( = ?auto_24198 ?auto_24178 ) ) ( not ( = ?auto_24198 ?auto_24187 ) ) ( not ( = ?auto_24193 ?auto_24200 ) ) ( not ( = ?auto_24193 ?auto_24191 ) ) ( not ( = ?auto_24193 ?auto_24186 ) ) ( not ( = ?auto_24193 ?auto_24185 ) ) ( not ( = ?auto_24193 ?auto_24189 ) ) ( not ( = ?auto_24193 ?auto_24183 ) ) ( not ( = ?auto_24158 ?auto_24166 ) ) ( not ( = ?auto_24158 ?auto_24201 ) ) ( not ( = ?auto_24159 ?auto_24166 ) ) ( not ( = ?auto_24159 ?auto_24201 ) ) ( not ( = ?auto_24160 ?auto_24166 ) ) ( not ( = ?auto_24160 ?auto_24201 ) ) ( not ( = ?auto_24161 ?auto_24166 ) ) ( not ( = ?auto_24161 ?auto_24201 ) ) ( not ( = ?auto_24162 ?auto_24166 ) ) ( not ( = ?auto_24162 ?auto_24201 ) ) ( not ( = ?auto_24163 ?auto_24166 ) ) ( not ( = ?auto_24163 ?auto_24201 ) ) ( not ( = ?auto_24164 ?auto_24166 ) ) ( not ( = ?auto_24164 ?auto_24201 ) ) ( not ( = ?auto_24166 ?auto_24193 ) ) ( not ( = ?auto_24166 ?auto_24200 ) ) ( not ( = ?auto_24166 ?auto_24191 ) ) ( not ( = ?auto_24166 ?auto_24186 ) ) ( not ( = ?auto_24166 ?auto_24185 ) ) ( not ( = ?auto_24166 ?auto_24189 ) ) ( not ( = ?auto_24166 ?auto_24183 ) ) ( not ( = ?auto_24190 ?auto_24194 ) ) ( not ( = ?auto_24190 ?auto_24188 ) ) ( not ( = ?auto_24190 ?auto_24171 ) ) ( not ( = ?auto_24190 ?auto_24192 ) ) ( not ( = ?auto_24190 ?auto_24177 ) ) ( not ( = ?auto_24190 ?auto_24195 ) ) ( not ( = ?auto_24179 ?auto_24198 ) ) ( not ( = ?auto_24179 ?auto_24203 ) ) ( not ( = ?auto_24179 ?auto_24173 ) ) ( not ( = ?auto_24179 ?auto_24196 ) ) ( not ( = ?auto_24179 ?auto_24178 ) ) ( not ( = ?auto_24179 ?auto_24187 ) ) ( not ( = ?auto_24201 ?auto_24193 ) ) ( not ( = ?auto_24201 ?auto_24200 ) ) ( not ( = ?auto_24201 ?auto_24191 ) ) ( not ( = ?auto_24201 ?auto_24186 ) ) ( not ( = ?auto_24201 ?auto_24185 ) ) ( not ( = ?auto_24201 ?auto_24189 ) ) ( not ( = ?auto_24201 ?auto_24183 ) ) ( not ( = ?auto_24158 ?auto_24167 ) ) ( not ( = ?auto_24158 ?auto_24180 ) ) ( not ( = ?auto_24159 ?auto_24167 ) ) ( not ( = ?auto_24159 ?auto_24180 ) ) ( not ( = ?auto_24160 ?auto_24167 ) ) ( not ( = ?auto_24160 ?auto_24180 ) ) ( not ( = ?auto_24161 ?auto_24167 ) ) ( not ( = ?auto_24161 ?auto_24180 ) ) ( not ( = ?auto_24162 ?auto_24167 ) ) ( not ( = ?auto_24162 ?auto_24180 ) ) ( not ( = ?auto_24163 ?auto_24167 ) ) ( not ( = ?auto_24163 ?auto_24180 ) ) ( not ( = ?auto_24164 ?auto_24167 ) ) ( not ( = ?auto_24164 ?auto_24180 ) ) ( not ( = ?auto_24165 ?auto_24167 ) ) ( not ( = ?auto_24165 ?auto_24180 ) ) ( not ( = ?auto_24167 ?auto_24201 ) ) ( not ( = ?auto_24167 ?auto_24193 ) ) ( not ( = ?auto_24167 ?auto_24200 ) ) ( not ( = ?auto_24167 ?auto_24191 ) ) ( not ( = ?auto_24167 ?auto_24186 ) ) ( not ( = ?auto_24167 ?auto_24185 ) ) ( not ( = ?auto_24167 ?auto_24189 ) ) ( not ( = ?auto_24167 ?auto_24183 ) ) ( not ( = ?auto_24181 ?auto_24190 ) ) ( not ( = ?auto_24181 ?auto_24194 ) ) ( not ( = ?auto_24181 ?auto_24188 ) ) ( not ( = ?auto_24181 ?auto_24171 ) ) ( not ( = ?auto_24181 ?auto_24192 ) ) ( not ( = ?auto_24181 ?auto_24177 ) ) ( not ( = ?auto_24181 ?auto_24195 ) ) ( not ( = ?auto_24202 ?auto_24179 ) ) ( not ( = ?auto_24202 ?auto_24198 ) ) ( not ( = ?auto_24202 ?auto_24203 ) ) ( not ( = ?auto_24202 ?auto_24173 ) ) ( not ( = ?auto_24202 ?auto_24196 ) ) ( not ( = ?auto_24202 ?auto_24178 ) ) ( not ( = ?auto_24202 ?auto_24187 ) ) ( not ( = ?auto_24180 ?auto_24201 ) ) ( not ( = ?auto_24180 ?auto_24193 ) ) ( not ( = ?auto_24180 ?auto_24200 ) ) ( not ( = ?auto_24180 ?auto_24191 ) ) ( not ( = ?auto_24180 ?auto_24186 ) ) ( not ( = ?auto_24180 ?auto_24185 ) ) ( not ( = ?auto_24180 ?auto_24189 ) ) ( not ( = ?auto_24180 ?auto_24183 ) ) ( not ( = ?auto_24158 ?auto_24168 ) ) ( not ( = ?auto_24158 ?auto_24199 ) ) ( not ( = ?auto_24159 ?auto_24168 ) ) ( not ( = ?auto_24159 ?auto_24199 ) ) ( not ( = ?auto_24160 ?auto_24168 ) ) ( not ( = ?auto_24160 ?auto_24199 ) ) ( not ( = ?auto_24161 ?auto_24168 ) ) ( not ( = ?auto_24161 ?auto_24199 ) ) ( not ( = ?auto_24162 ?auto_24168 ) ) ( not ( = ?auto_24162 ?auto_24199 ) ) ( not ( = ?auto_24163 ?auto_24168 ) ) ( not ( = ?auto_24163 ?auto_24199 ) ) ( not ( = ?auto_24164 ?auto_24168 ) ) ( not ( = ?auto_24164 ?auto_24199 ) ) ( not ( = ?auto_24165 ?auto_24168 ) ) ( not ( = ?auto_24165 ?auto_24199 ) ) ( not ( = ?auto_24166 ?auto_24168 ) ) ( not ( = ?auto_24166 ?auto_24199 ) ) ( not ( = ?auto_24168 ?auto_24180 ) ) ( not ( = ?auto_24168 ?auto_24201 ) ) ( not ( = ?auto_24168 ?auto_24193 ) ) ( not ( = ?auto_24168 ?auto_24200 ) ) ( not ( = ?auto_24168 ?auto_24191 ) ) ( not ( = ?auto_24168 ?auto_24186 ) ) ( not ( = ?auto_24168 ?auto_24185 ) ) ( not ( = ?auto_24168 ?auto_24189 ) ) ( not ( = ?auto_24168 ?auto_24183 ) ) ( not ( = ?auto_24182 ?auto_24181 ) ) ( not ( = ?auto_24182 ?auto_24190 ) ) ( not ( = ?auto_24182 ?auto_24194 ) ) ( not ( = ?auto_24182 ?auto_24188 ) ) ( not ( = ?auto_24182 ?auto_24171 ) ) ( not ( = ?auto_24182 ?auto_24192 ) ) ( not ( = ?auto_24182 ?auto_24177 ) ) ( not ( = ?auto_24182 ?auto_24195 ) ) ( not ( = ?auto_24197 ?auto_24202 ) ) ( not ( = ?auto_24197 ?auto_24179 ) ) ( not ( = ?auto_24197 ?auto_24198 ) ) ( not ( = ?auto_24197 ?auto_24203 ) ) ( not ( = ?auto_24197 ?auto_24173 ) ) ( not ( = ?auto_24197 ?auto_24196 ) ) ( not ( = ?auto_24197 ?auto_24178 ) ) ( not ( = ?auto_24197 ?auto_24187 ) ) ( not ( = ?auto_24199 ?auto_24180 ) ) ( not ( = ?auto_24199 ?auto_24201 ) ) ( not ( = ?auto_24199 ?auto_24193 ) ) ( not ( = ?auto_24199 ?auto_24200 ) ) ( not ( = ?auto_24199 ?auto_24191 ) ) ( not ( = ?auto_24199 ?auto_24186 ) ) ( not ( = ?auto_24199 ?auto_24185 ) ) ( not ( = ?auto_24199 ?auto_24189 ) ) ( not ( = ?auto_24199 ?auto_24183 ) ) ( not ( = ?auto_24158 ?auto_24169 ) ) ( not ( = ?auto_24158 ?auto_24184 ) ) ( not ( = ?auto_24159 ?auto_24169 ) ) ( not ( = ?auto_24159 ?auto_24184 ) ) ( not ( = ?auto_24160 ?auto_24169 ) ) ( not ( = ?auto_24160 ?auto_24184 ) ) ( not ( = ?auto_24161 ?auto_24169 ) ) ( not ( = ?auto_24161 ?auto_24184 ) ) ( not ( = ?auto_24162 ?auto_24169 ) ) ( not ( = ?auto_24162 ?auto_24184 ) ) ( not ( = ?auto_24163 ?auto_24169 ) ) ( not ( = ?auto_24163 ?auto_24184 ) ) ( not ( = ?auto_24164 ?auto_24169 ) ) ( not ( = ?auto_24164 ?auto_24184 ) ) ( not ( = ?auto_24165 ?auto_24169 ) ) ( not ( = ?auto_24165 ?auto_24184 ) ) ( not ( = ?auto_24166 ?auto_24169 ) ) ( not ( = ?auto_24166 ?auto_24184 ) ) ( not ( = ?auto_24167 ?auto_24169 ) ) ( not ( = ?auto_24167 ?auto_24184 ) ) ( not ( = ?auto_24169 ?auto_24199 ) ) ( not ( = ?auto_24169 ?auto_24180 ) ) ( not ( = ?auto_24169 ?auto_24201 ) ) ( not ( = ?auto_24169 ?auto_24193 ) ) ( not ( = ?auto_24169 ?auto_24200 ) ) ( not ( = ?auto_24169 ?auto_24191 ) ) ( not ( = ?auto_24169 ?auto_24186 ) ) ( not ( = ?auto_24169 ?auto_24185 ) ) ( not ( = ?auto_24169 ?auto_24189 ) ) ( not ( = ?auto_24169 ?auto_24183 ) ) ( not ( = ?auto_24184 ?auto_24199 ) ) ( not ( = ?auto_24184 ?auto_24180 ) ) ( not ( = ?auto_24184 ?auto_24201 ) ) ( not ( = ?auto_24184 ?auto_24193 ) ) ( not ( = ?auto_24184 ?auto_24200 ) ) ( not ( = ?auto_24184 ?auto_24191 ) ) ( not ( = ?auto_24184 ?auto_24186 ) ) ( not ( = ?auto_24184 ?auto_24185 ) ) ( not ( = ?auto_24184 ?auto_24189 ) ) ( not ( = ?auto_24184 ?auto_24183 ) ) ( not ( = ?auto_24158 ?auto_24170 ) ) ( not ( = ?auto_24158 ?auto_24175 ) ) ( not ( = ?auto_24159 ?auto_24170 ) ) ( not ( = ?auto_24159 ?auto_24175 ) ) ( not ( = ?auto_24160 ?auto_24170 ) ) ( not ( = ?auto_24160 ?auto_24175 ) ) ( not ( = ?auto_24161 ?auto_24170 ) ) ( not ( = ?auto_24161 ?auto_24175 ) ) ( not ( = ?auto_24162 ?auto_24170 ) ) ( not ( = ?auto_24162 ?auto_24175 ) ) ( not ( = ?auto_24163 ?auto_24170 ) ) ( not ( = ?auto_24163 ?auto_24175 ) ) ( not ( = ?auto_24164 ?auto_24170 ) ) ( not ( = ?auto_24164 ?auto_24175 ) ) ( not ( = ?auto_24165 ?auto_24170 ) ) ( not ( = ?auto_24165 ?auto_24175 ) ) ( not ( = ?auto_24166 ?auto_24170 ) ) ( not ( = ?auto_24166 ?auto_24175 ) ) ( not ( = ?auto_24167 ?auto_24170 ) ) ( not ( = ?auto_24167 ?auto_24175 ) ) ( not ( = ?auto_24168 ?auto_24170 ) ) ( not ( = ?auto_24168 ?auto_24175 ) ) ( not ( = ?auto_24170 ?auto_24184 ) ) ( not ( = ?auto_24170 ?auto_24199 ) ) ( not ( = ?auto_24170 ?auto_24180 ) ) ( not ( = ?auto_24170 ?auto_24201 ) ) ( not ( = ?auto_24170 ?auto_24193 ) ) ( not ( = ?auto_24170 ?auto_24200 ) ) ( not ( = ?auto_24170 ?auto_24191 ) ) ( not ( = ?auto_24170 ?auto_24186 ) ) ( not ( = ?auto_24170 ?auto_24185 ) ) ( not ( = ?auto_24170 ?auto_24189 ) ) ( not ( = ?auto_24170 ?auto_24183 ) ) ( not ( = ?auto_24175 ?auto_24184 ) ) ( not ( = ?auto_24175 ?auto_24199 ) ) ( not ( = ?auto_24175 ?auto_24180 ) ) ( not ( = ?auto_24175 ?auto_24201 ) ) ( not ( = ?auto_24175 ?auto_24193 ) ) ( not ( = ?auto_24175 ?auto_24200 ) ) ( not ( = ?auto_24175 ?auto_24191 ) ) ( not ( = ?auto_24175 ?auto_24186 ) ) ( not ( = ?auto_24175 ?auto_24185 ) ) ( not ( = ?auto_24175 ?auto_24189 ) ) ( not ( = ?auto_24175 ?auto_24183 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_24158 ?auto_24159 ?auto_24160 ?auto_24161 ?auto_24162 ?auto_24163 ?auto_24164 ?auto_24165 ?auto_24166 ?auto_24167 ?auto_24168 ?auto_24169 )
      ( MAKE-1CRATE ?auto_24169 ?auto_24170 )
      ( MAKE-12CRATE-VERIFY ?auto_24158 ?auto_24159 ?auto_24160 ?auto_24161 ?auto_24162 ?auto_24163 ?auto_24164 ?auto_24165 ?auto_24166 ?auto_24167 ?auto_24168 ?auto_24169 ?auto_24170 ) )
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
      ?auto_24235 - SURFACE
      ?auto_24236 - SURFACE
      ?auto_24237 - SURFACE
      ?auto_24238 - SURFACE
      ?auto_24239 - SURFACE
      ?auto_24240 - SURFACE
      ?auto_24241 - SURFACE
    )
    :vars
    (
      ?auto_24244 - HOIST
      ?auto_24245 - PLACE
      ?auto_24247 - PLACE
      ?auto_24246 - HOIST
      ?auto_24243 - SURFACE
      ?auto_24275 - PLACE
      ?auto_24269 - HOIST
      ?auto_24268 - SURFACE
      ?auto_24259 - SURFACE
      ?auto_24274 - PLACE
      ?auto_24253 - HOIST
      ?auto_24260 - SURFACE
      ?auto_24267 - PLACE
      ?auto_24249 - HOIST
      ?auto_24272 - SURFACE
      ?auto_24248 - PLACE
      ?auto_24273 - HOIST
      ?auto_24276 - SURFACE
      ?auto_24257 - PLACE
      ?auto_24271 - HOIST
      ?auto_24250 - SURFACE
      ?auto_24251 - PLACE
      ?auto_24256 - HOIST
      ?auto_24277 - SURFACE
      ?auto_24261 - SURFACE
      ?auto_24252 - PLACE
      ?auto_24262 - HOIST
      ?auto_24270 - SURFACE
      ?auto_24264 - PLACE
      ?auto_24255 - HOIST
      ?auto_24254 - SURFACE
      ?auto_24258 - SURFACE
      ?auto_24266 - PLACE
      ?auto_24263 - HOIST
      ?auto_24265 - SURFACE
      ?auto_24242 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24244 ?auto_24245 ) ( IS-CRATE ?auto_24241 ) ( not ( = ?auto_24247 ?auto_24245 ) ) ( HOIST-AT ?auto_24246 ?auto_24247 ) ( AVAILABLE ?auto_24246 ) ( SURFACE-AT ?auto_24241 ?auto_24247 ) ( ON ?auto_24241 ?auto_24243 ) ( CLEAR ?auto_24241 ) ( not ( = ?auto_24240 ?auto_24241 ) ) ( not ( = ?auto_24240 ?auto_24243 ) ) ( not ( = ?auto_24241 ?auto_24243 ) ) ( not ( = ?auto_24244 ?auto_24246 ) ) ( IS-CRATE ?auto_24240 ) ( not ( = ?auto_24275 ?auto_24245 ) ) ( HOIST-AT ?auto_24269 ?auto_24275 ) ( SURFACE-AT ?auto_24240 ?auto_24275 ) ( ON ?auto_24240 ?auto_24268 ) ( CLEAR ?auto_24240 ) ( not ( = ?auto_24239 ?auto_24240 ) ) ( not ( = ?auto_24239 ?auto_24268 ) ) ( not ( = ?auto_24240 ?auto_24268 ) ) ( not ( = ?auto_24244 ?auto_24269 ) ) ( IS-CRATE ?auto_24239 ) ( SURFACE-AT ?auto_24239 ?auto_24275 ) ( ON ?auto_24239 ?auto_24259 ) ( CLEAR ?auto_24239 ) ( not ( = ?auto_24238 ?auto_24239 ) ) ( not ( = ?auto_24238 ?auto_24259 ) ) ( not ( = ?auto_24239 ?auto_24259 ) ) ( IS-CRATE ?auto_24238 ) ( not ( = ?auto_24274 ?auto_24245 ) ) ( HOIST-AT ?auto_24253 ?auto_24274 ) ( AVAILABLE ?auto_24253 ) ( SURFACE-AT ?auto_24238 ?auto_24274 ) ( ON ?auto_24238 ?auto_24260 ) ( CLEAR ?auto_24238 ) ( not ( = ?auto_24237 ?auto_24238 ) ) ( not ( = ?auto_24237 ?auto_24260 ) ) ( not ( = ?auto_24238 ?auto_24260 ) ) ( not ( = ?auto_24244 ?auto_24253 ) ) ( IS-CRATE ?auto_24237 ) ( not ( = ?auto_24267 ?auto_24245 ) ) ( HOIST-AT ?auto_24249 ?auto_24267 ) ( AVAILABLE ?auto_24249 ) ( SURFACE-AT ?auto_24237 ?auto_24267 ) ( ON ?auto_24237 ?auto_24272 ) ( CLEAR ?auto_24237 ) ( not ( = ?auto_24236 ?auto_24237 ) ) ( not ( = ?auto_24236 ?auto_24272 ) ) ( not ( = ?auto_24237 ?auto_24272 ) ) ( not ( = ?auto_24244 ?auto_24249 ) ) ( IS-CRATE ?auto_24236 ) ( not ( = ?auto_24248 ?auto_24245 ) ) ( HOIST-AT ?auto_24273 ?auto_24248 ) ( AVAILABLE ?auto_24273 ) ( SURFACE-AT ?auto_24236 ?auto_24248 ) ( ON ?auto_24236 ?auto_24276 ) ( CLEAR ?auto_24236 ) ( not ( = ?auto_24235 ?auto_24236 ) ) ( not ( = ?auto_24235 ?auto_24276 ) ) ( not ( = ?auto_24236 ?auto_24276 ) ) ( not ( = ?auto_24244 ?auto_24273 ) ) ( IS-CRATE ?auto_24235 ) ( not ( = ?auto_24257 ?auto_24245 ) ) ( HOIST-AT ?auto_24271 ?auto_24257 ) ( AVAILABLE ?auto_24271 ) ( SURFACE-AT ?auto_24235 ?auto_24257 ) ( ON ?auto_24235 ?auto_24250 ) ( CLEAR ?auto_24235 ) ( not ( = ?auto_24234 ?auto_24235 ) ) ( not ( = ?auto_24234 ?auto_24250 ) ) ( not ( = ?auto_24235 ?auto_24250 ) ) ( not ( = ?auto_24244 ?auto_24271 ) ) ( IS-CRATE ?auto_24234 ) ( not ( = ?auto_24251 ?auto_24245 ) ) ( HOIST-AT ?auto_24256 ?auto_24251 ) ( SURFACE-AT ?auto_24234 ?auto_24251 ) ( ON ?auto_24234 ?auto_24277 ) ( CLEAR ?auto_24234 ) ( not ( = ?auto_24233 ?auto_24234 ) ) ( not ( = ?auto_24233 ?auto_24277 ) ) ( not ( = ?auto_24234 ?auto_24277 ) ) ( not ( = ?auto_24244 ?auto_24256 ) ) ( IS-CRATE ?auto_24233 ) ( AVAILABLE ?auto_24269 ) ( SURFACE-AT ?auto_24233 ?auto_24275 ) ( ON ?auto_24233 ?auto_24261 ) ( CLEAR ?auto_24233 ) ( not ( = ?auto_24232 ?auto_24233 ) ) ( not ( = ?auto_24232 ?auto_24261 ) ) ( not ( = ?auto_24233 ?auto_24261 ) ) ( IS-CRATE ?auto_24232 ) ( not ( = ?auto_24252 ?auto_24245 ) ) ( HOIST-AT ?auto_24262 ?auto_24252 ) ( AVAILABLE ?auto_24262 ) ( SURFACE-AT ?auto_24232 ?auto_24252 ) ( ON ?auto_24232 ?auto_24270 ) ( CLEAR ?auto_24232 ) ( not ( = ?auto_24231 ?auto_24232 ) ) ( not ( = ?auto_24231 ?auto_24270 ) ) ( not ( = ?auto_24232 ?auto_24270 ) ) ( not ( = ?auto_24244 ?auto_24262 ) ) ( IS-CRATE ?auto_24231 ) ( not ( = ?auto_24264 ?auto_24245 ) ) ( HOIST-AT ?auto_24255 ?auto_24264 ) ( AVAILABLE ?auto_24255 ) ( SURFACE-AT ?auto_24231 ?auto_24264 ) ( ON ?auto_24231 ?auto_24254 ) ( CLEAR ?auto_24231 ) ( not ( = ?auto_24230 ?auto_24231 ) ) ( not ( = ?auto_24230 ?auto_24254 ) ) ( not ( = ?auto_24231 ?auto_24254 ) ) ( not ( = ?auto_24244 ?auto_24255 ) ) ( IS-CRATE ?auto_24230 ) ( AVAILABLE ?auto_24256 ) ( SURFACE-AT ?auto_24230 ?auto_24251 ) ( ON ?auto_24230 ?auto_24258 ) ( CLEAR ?auto_24230 ) ( not ( = ?auto_24229 ?auto_24230 ) ) ( not ( = ?auto_24229 ?auto_24258 ) ) ( not ( = ?auto_24230 ?auto_24258 ) ) ( SURFACE-AT ?auto_24228 ?auto_24245 ) ( CLEAR ?auto_24228 ) ( IS-CRATE ?auto_24229 ) ( AVAILABLE ?auto_24244 ) ( not ( = ?auto_24266 ?auto_24245 ) ) ( HOIST-AT ?auto_24263 ?auto_24266 ) ( AVAILABLE ?auto_24263 ) ( SURFACE-AT ?auto_24229 ?auto_24266 ) ( ON ?auto_24229 ?auto_24265 ) ( CLEAR ?auto_24229 ) ( TRUCK-AT ?auto_24242 ?auto_24245 ) ( not ( = ?auto_24228 ?auto_24229 ) ) ( not ( = ?auto_24228 ?auto_24265 ) ) ( not ( = ?auto_24229 ?auto_24265 ) ) ( not ( = ?auto_24244 ?auto_24263 ) ) ( not ( = ?auto_24228 ?auto_24230 ) ) ( not ( = ?auto_24228 ?auto_24258 ) ) ( not ( = ?auto_24230 ?auto_24265 ) ) ( not ( = ?auto_24251 ?auto_24266 ) ) ( not ( = ?auto_24256 ?auto_24263 ) ) ( not ( = ?auto_24258 ?auto_24265 ) ) ( not ( = ?auto_24228 ?auto_24231 ) ) ( not ( = ?auto_24228 ?auto_24254 ) ) ( not ( = ?auto_24229 ?auto_24231 ) ) ( not ( = ?auto_24229 ?auto_24254 ) ) ( not ( = ?auto_24231 ?auto_24258 ) ) ( not ( = ?auto_24231 ?auto_24265 ) ) ( not ( = ?auto_24264 ?auto_24251 ) ) ( not ( = ?auto_24264 ?auto_24266 ) ) ( not ( = ?auto_24255 ?auto_24256 ) ) ( not ( = ?auto_24255 ?auto_24263 ) ) ( not ( = ?auto_24254 ?auto_24258 ) ) ( not ( = ?auto_24254 ?auto_24265 ) ) ( not ( = ?auto_24228 ?auto_24232 ) ) ( not ( = ?auto_24228 ?auto_24270 ) ) ( not ( = ?auto_24229 ?auto_24232 ) ) ( not ( = ?auto_24229 ?auto_24270 ) ) ( not ( = ?auto_24230 ?auto_24232 ) ) ( not ( = ?auto_24230 ?auto_24270 ) ) ( not ( = ?auto_24232 ?auto_24254 ) ) ( not ( = ?auto_24232 ?auto_24258 ) ) ( not ( = ?auto_24232 ?auto_24265 ) ) ( not ( = ?auto_24252 ?auto_24264 ) ) ( not ( = ?auto_24252 ?auto_24251 ) ) ( not ( = ?auto_24252 ?auto_24266 ) ) ( not ( = ?auto_24262 ?auto_24255 ) ) ( not ( = ?auto_24262 ?auto_24256 ) ) ( not ( = ?auto_24262 ?auto_24263 ) ) ( not ( = ?auto_24270 ?auto_24254 ) ) ( not ( = ?auto_24270 ?auto_24258 ) ) ( not ( = ?auto_24270 ?auto_24265 ) ) ( not ( = ?auto_24228 ?auto_24233 ) ) ( not ( = ?auto_24228 ?auto_24261 ) ) ( not ( = ?auto_24229 ?auto_24233 ) ) ( not ( = ?auto_24229 ?auto_24261 ) ) ( not ( = ?auto_24230 ?auto_24233 ) ) ( not ( = ?auto_24230 ?auto_24261 ) ) ( not ( = ?auto_24231 ?auto_24233 ) ) ( not ( = ?auto_24231 ?auto_24261 ) ) ( not ( = ?auto_24233 ?auto_24270 ) ) ( not ( = ?auto_24233 ?auto_24254 ) ) ( not ( = ?auto_24233 ?auto_24258 ) ) ( not ( = ?auto_24233 ?auto_24265 ) ) ( not ( = ?auto_24275 ?auto_24252 ) ) ( not ( = ?auto_24275 ?auto_24264 ) ) ( not ( = ?auto_24275 ?auto_24251 ) ) ( not ( = ?auto_24275 ?auto_24266 ) ) ( not ( = ?auto_24269 ?auto_24262 ) ) ( not ( = ?auto_24269 ?auto_24255 ) ) ( not ( = ?auto_24269 ?auto_24256 ) ) ( not ( = ?auto_24269 ?auto_24263 ) ) ( not ( = ?auto_24261 ?auto_24270 ) ) ( not ( = ?auto_24261 ?auto_24254 ) ) ( not ( = ?auto_24261 ?auto_24258 ) ) ( not ( = ?auto_24261 ?auto_24265 ) ) ( not ( = ?auto_24228 ?auto_24234 ) ) ( not ( = ?auto_24228 ?auto_24277 ) ) ( not ( = ?auto_24229 ?auto_24234 ) ) ( not ( = ?auto_24229 ?auto_24277 ) ) ( not ( = ?auto_24230 ?auto_24234 ) ) ( not ( = ?auto_24230 ?auto_24277 ) ) ( not ( = ?auto_24231 ?auto_24234 ) ) ( not ( = ?auto_24231 ?auto_24277 ) ) ( not ( = ?auto_24232 ?auto_24234 ) ) ( not ( = ?auto_24232 ?auto_24277 ) ) ( not ( = ?auto_24234 ?auto_24261 ) ) ( not ( = ?auto_24234 ?auto_24270 ) ) ( not ( = ?auto_24234 ?auto_24254 ) ) ( not ( = ?auto_24234 ?auto_24258 ) ) ( not ( = ?auto_24234 ?auto_24265 ) ) ( not ( = ?auto_24277 ?auto_24261 ) ) ( not ( = ?auto_24277 ?auto_24270 ) ) ( not ( = ?auto_24277 ?auto_24254 ) ) ( not ( = ?auto_24277 ?auto_24258 ) ) ( not ( = ?auto_24277 ?auto_24265 ) ) ( not ( = ?auto_24228 ?auto_24235 ) ) ( not ( = ?auto_24228 ?auto_24250 ) ) ( not ( = ?auto_24229 ?auto_24235 ) ) ( not ( = ?auto_24229 ?auto_24250 ) ) ( not ( = ?auto_24230 ?auto_24235 ) ) ( not ( = ?auto_24230 ?auto_24250 ) ) ( not ( = ?auto_24231 ?auto_24235 ) ) ( not ( = ?auto_24231 ?auto_24250 ) ) ( not ( = ?auto_24232 ?auto_24235 ) ) ( not ( = ?auto_24232 ?auto_24250 ) ) ( not ( = ?auto_24233 ?auto_24235 ) ) ( not ( = ?auto_24233 ?auto_24250 ) ) ( not ( = ?auto_24235 ?auto_24277 ) ) ( not ( = ?auto_24235 ?auto_24261 ) ) ( not ( = ?auto_24235 ?auto_24270 ) ) ( not ( = ?auto_24235 ?auto_24254 ) ) ( not ( = ?auto_24235 ?auto_24258 ) ) ( not ( = ?auto_24235 ?auto_24265 ) ) ( not ( = ?auto_24257 ?auto_24251 ) ) ( not ( = ?auto_24257 ?auto_24275 ) ) ( not ( = ?auto_24257 ?auto_24252 ) ) ( not ( = ?auto_24257 ?auto_24264 ) ) ( not ( = ?auto_24257 ?auto_24266 ) ) ( not ( = ?auto_24271 ?auto_24256 ) ) ( not ( = ?auto_24271 ?auto_24269 ) ) ( not ( = ?auto_24271 ?auto_24262 ) ) ( not ( = ?auto_24271 ?auto_24255 ) ) ( not ( = ?auto_24271 ?auto_24263 ) ) ( not ( = ?auto_24250 ?auto_24277 ) ) ( not ( = ?auto_24250 ?auto_24261 ) ) ( not ( = ?auto_24250 ?auto_24270 ) ) ( not ( = ?auto_24250 ?auto_24254 ) ) ( not ( = ?auto_24250 ?auto_24258 ) ) ( not ( = ?auto_24250 ?auto_24265 ) ) ( not ( = ?auto_24228 ?auto_24236 ) ) ( not ( = ?auto_24228 ?auto_24276 ) ) ( not ( = ?auto_24229 ?auto_24236 ) ) ( not ( = ?auto_24229 ?auto_24276 ) ) ( not ( = ?auto_24230 ?auto_24236 ) ) ( not ( = ?auto_24230 ?auto_24276 ) ) ( not ( = ?auto_24231 ?auto_24236 ) ) ( not ( = ?auto_24231 ?auto_24276 ) ) ( not ( = ?auto_24232 ?auto_24236 ) ) ( not ( = ?auto_24232 ?auto_24276 ) ) ( not ( = ?auto_24233 ?auto_24236 ) ) ( not ( = ?auto_24233 ?auto_24276 ) ) ( not ( = ?auto_24234 ?auto_24236 ) ) ( not ( = ?auto_24234 ?auto_24276 ) ) ( not ( = ?auto_24236 ?auto_24250 ) ) ( not ( = ?auto_24236 ?auto_24277 ) ) ( not ( = ?auto_24236 ?auto_24261 ) ) ( not ( = ?auto_24236 ?auto_24270 ) ) ( not ( = ?auto_24236 ?auto_24254 ) ) ( not ( = ?auto_24236 ?auto_24258 ) ) ( not ( = ?auto_24236 ?auto_24265 ) ) ( not ( = ?auto_24248 ?auto_24257 ) ) ( not ( = ?auto_24248 ?auto_24251 ) ) ( not ( = ?auto_24248 ?auto_24275 ) ) ( not ( = ?auto_24248 ?auto_24252 ) ) ( not ( = ?auto_24248 ?auto_24264 ) ) ( not ( = ?auto_24248 ?auto_24266 ) ) ( not ( = ?auto_24273 ?auto_24271 ) ) ( not ( = ?auto_24273 ?auto_24256 ) ) ( not ( = ?auto_24273 ?auto_24269 ) ) ( not ( = ?auto_24273 ?auto_24262 ) ) ( not ( = ?auto_24273 ?auto_24255 ) ) ( not ( = ?auto_24273 ?auto_24263 ) ) ( not ( = ?auto_24276 ?auto_24250 ) ) ( not ( = ?auto_24276 ?auto_24277 ) ) ( not ( = ?auto_24276 ?auto_24261 ) ) ( not ( = ?auto_24276 ?auto_24270 ) ) ( not ( = ?auto_24276 ?auto_24254 ) ) ( not ( = ?auto_24276 ?auto_24258 ) ) ( not ( = ?auto_24276 ?auto_24265 ) ) ( not ( = ?auto_24228 ?auto_24237 ) ) ( not ( = ?auto_24228 ?auto_24272 ) ) ( not ( = ?auto_24229 ?auto_24237 ) ) ( not ( = ?auto_24229 ?auto_24272 ) ) ( not ( = ?auto_24230 ?auto_24237 ) ) ( not ( = ?auto_24230 ?auto_24272 ) ) ( not ( = ?auto_24231 ?auto_24237 ) ) ( not ( = ?auto_24231 ?auto_24272 ) ) ( not ( = ?auto_24232 ?auto_24237 ) ) ( not ( = ?auto_24232 ?auto_24272 ) ) ( not ( = ?auto_24233 ?auto_24237 ) ) ( not ( = ?auto_24233 ?auto_24272 ) ) ( not ( = ?auto_24234 ?auto_24237 ) ) ( not ( = ?auto_24234 ?auto_24272 ) ) ( not ( = ?auto_24235 ?auto_24237 ) ) ( not ( = ?auto_24235 ?auto_24272 ) ) ( not ( = ?auto_24237 ?auto_24276 ) ) ( not ( = ?auto_24237 ?auto_24250 ) ) ( not ( = ?auto_24237 ?auto_24277 ) ) ( not ( = ?auto_24237 ?auto_24261 ) ) ( not ( = ?auto_24237 ?auto_24270 ) ) ( not ( = ?auto_24237 ?auto_24254 ) ) ( not ( = ?auto_24237 ?auto_24258 ) ) ( not ( = ?auto_24237 ?auto_24265 ) ) ( not ( = ?auto_24267 ?auto_24248 ) ) ( not ( = ?auto_24267 ?auto_24257 ) ) ( not ( = ?auto_24267 ?auto_24251 ) ) ( not ( = ?auto_24267 ?auto_24275 ) ) ( not ( = ?auto_24267 ?auto_24252 ) ) ( not ( = ?auto_24267 ?auto_24264 ) ) ( not ( = ?auto_24267 ?auto_24266 ) ) ( not ( = ?auto_24249 ?auto_24273 ) ) ( not ( = ?auto_24249 ?auto_24271 ) ) ( not ( = ?auto_24249 ?auto_24256 ) ) ( not ( = ?auto_24249 ?auto_24269 ) ) ( not ( = ?auto_24249 ?auto_24262 ) ) ( not ( = ?auto_24249 ?auto_24255 ) ) ( not ( = ?auto_24249 ?auto_24263 ) ) ( not ( = ?auto_24272 ?auto_24276 ) ) ( not ( = ?auto_24272 ?auto_24250 ) ) ( not ( = ?auto_24272 ?auto_24277 ) ) ( not ( = ?auto_24272 ?auto_24261 ) ) ( not ( = ?auto_24272 ?auto_24270 ) ) ( not ( = ?auto_24272 ?auto_24254 ) ) ( not ( = ?auto_24272 ?auto_24258 ) ) ( not ( = ?auto_24272 ?auto_24265 ) ) ( not ( = ?auto_24228 ?auto_24238 ) ) ( not ( = ?auto_24228 ?auto_24260 ) ) ( not ( = ?auto_24229 ?auto_24238 ) ) ( not ( = ?auto_24229 ?auto_24260 ) ) ( not ( = ?auto_24230 ?auto_24238 ) ) ( not ( = ?auto_24230 ?auto_24260 ) ) ( not ( = ?auto_24231 ?auto_24238 ) ) ( not ( = ?auto_24231 ?auto_24260 ) ) ( not ( = ?auto_24232 ?auto_24238 ) ) ( not ( = ?auto_24232 ?auto_24260 ) ) ( not ( = ?auto_24233 ?auto_24238 ) ) ( not ( = ?auto_24233 ?auto_24260 ) ) ( not ( = ?auto_24234 ?auto_24238 ) ) ( not ( = ?auto_24234 ?auto_24260 ) ) ( not ( = ?auto_24235 ?auto_24238 ) ) ( not ( = ?auto_24235 ?auto_24260 ) ) ( not ( = ?auto_24236 ?auto_24238 ) ) ( not ( = ?auto_24236 ?auto_24260 ) ) ( not ( = ?auto_24238 ?auto_24272 ) ) ( not ( = ?auto_24238 ?auto_24276 ) ) ( not ( = ?auto_24238 ?auto_24250 ) ) ( not ( = ?auto_24238 ?auto_24277 ) ) ( not ( = ?auto_24238 ?auto_24261 ) ) ( not ( = ?auto_24238 ?auto_24270 ) ) ( not ( = ?auto_24238 ?auto_24254 ) ) ( not ( = ?auto_24238 ?auto_24258 ) ) ( not ( = ?auto_24238 ?auto_24265 ) ) ( not ( = ?auto_24274 ?auto_24267 ) ) ( not ( = ?auto_24274 ?auto_24248 ) ) ( not ( = ?auto_24274 ?auto_24257 ) ) ( not ( = ?auto_24274 ?auto_24251 ) ) ( not ( = ?auto_24274 ?auto_24275 ) ) ( not ( = ?auto_24274 ?auto_24252 ) ) ( not ( = ?auto_24274 ?auto_24264 ) ) ( not ( = ?auto_24274 ?auto_24266 ) ) ( not ( = ?auto_24253 ?auto_24249 ) ) ( not ( = ?auto_24253 ?auto_24273 ) ) ( not ( = ?auto_24253 ?auto_24271 ) ) ( not ( = ?auto_24253 ?auto_24256 ) ) ( not ( = ?auto_24253 ?auto_24269 ) ) ( not ( = ?auto_24253 ?auto_24262 ) ) ( not ( = ?auto_24253 ?auto_24255 ) ) ( not ( = ?auto_24253 ?auto_24263 ) ) ( not ( = ?auto_24260 ?auto_24272 ) ) ( not ( = ?auto_24260 ?auto_24276 ) ) ( not ( = ?auto_24260 ?auto_24250 ) ) ( not ( = ?auto_24260 ?auto_24277 ) ) ( not ( = ?auto_24260 ?auto_24261 ) ) ( not ( = ?auto_24260 ?auto_24270 ) ) ( not ( = ?auto_24260 ?auto_24254 ) ) ( not ( = ?auto_24260 ?auto_24258 ) ) ( not ( = ?auto_24260 ?auto_24265 ) ) ( not ( = ?auto_24228 ?auto_24239 ) ) ( not ( = ?auto_24228 ?auto_24259 ) ) ( not ( = ?auto_24229 ?auto_24239 ) ) ( not ( = ?auto_24229 ?auto_24259 ) ) ( not ( = ?auto_24230 ?auto_24239 ) ) ( not ( = ?auto_24230 ?auto_24259 ) ) ( not ( = ?auto_24231 ?auto_24239 ) ) ( not ( = ?auto_24231 ?auto_24259 ) ) ( not ( = ?auto_24232 ?auto_24239 ) ) ( not ( = ?auto_24232 ?auto_24259 ) ) ( not ( = ?auto_24233 ?auto_24239 ) ) ( not ( = ?auto_24233 ?auto_24259 ) ) ( not ( = ?auto_24234 ?auto_24239 ) ) ( not ( = ?auto_24234 ?auto_24259 ) ) ( not ( = ?auto_24235 ?auto_24239 ) ) ( not ( = ?auto_24235 ?auto_24259 ) ) ( not ( = ?auto_24236 ?auto_24239 ) ) ( not ( = ?auto_24236 ?auto_24259 ) ) ( not ( = ?auto_24237 ?auto_24239 ) ) ( not ( = ?auto_24237 ?auto_24259 ) ) ( not ( = ?auto_24239 ?auto_24260 ) ) ( not ( = ?auto_24239 ?auto_24272 ) ) ( not ( = ?auto_24239 ?auto_24276 ) ) ( not ( = ?auto_24239 ?auto_24250 ) ) ( not ( = ?auto_24239 ?auto_24277 ) ) ( not ( = ?auto_24239 ?auto_24261 ) ) ( not ( = ?auto_24239 ?auto_24270 ) ) ( not ( = ?auto_24239 ?auto_24254 ) ) ( not ( = ?auto_24239 ?auto_24258 ) ) ( not ( = ?auto_24239 ?auto_24265 ) ) ( not ( = ?auto_24259 ?auto_24260 ) ) ( not ( = ?auto_24259 ?auto_24272 ) ) ( not ( = ?auto_24259 ?auto_24276 ) ) ( not ( = ?auto_24259 ?auto_24250 ) ) ( not ( = ?auto_24259 ?auto_24277 ) ) ( not ( = ?auto_24259 ?auto_24261 ) ) ( not ( = ?auto_24259 ?auto_24270 ) ) ( not ( = ?auto_24259 ?auto_24254 ) ) ( not ( = ?auto_24259 ?auto_24258 ) ) ( not ( = ?auto_24259 ?auto_24265 ) ) ( not ( = ?auto_24228 ?auto_24240 ) ) ( not ( = ?auto_24228 ?auto_24268 ) ) ( not ( = ?auto_24229 ?auto_24240 ) ) ( not ( = ?auto_24229 ?auto_24268 ) ) ( not ( = ?auto_24230 ?auto_24240 ) ) ( not ( = ?auto_24230 ?auto_24268 ) ) ( not ( = ?auto_24231 ?auto_24240 ) ) ( not ( = ?auto_24231 ?auto_24268 ) ) ( not ( = ?auto_24232 ?auto_24240 ) ) ( not ( = ?auto_24232 ?auto_24268 ) ) ( not ( = ?auto_24233 ?auto_24240 ) ) ( not ( = ?auto_24233 ?auto_24268 ) ) ( not ( = ?auto_24234 ?auto_24240 ) ) ( not ( = ?auto_24234 ?auto_24268 ) ) ( not ( = ?auto_24235 ?auto_24240 ) ) ( not ( = ?auto_24235 ?auto_24268 ) ) ( not ( = ?auto_24236 ?auto_24240 ) ) ( not ( = ?auto_24236 ?auto_24268 ) ) ( not ( = ?auto_24237 ?auto_24240 ) ) ( not ( = ?auto_24237 ?auto_24268 ) ) ( not ( = ?auto_24238 ?auto_24240 ) ) ( not ( = ?auto_24238 ?auto_24268 ) ) ( not ( = ?auto_24240 ?auto_24259 ) ) ( not ( = ?auto_24240 ?auto_24260 ) ) ( not ( = ?auto_24240 ?auto_24272 ) ) ( not ( = ?auto_24240 ?auto_24276 ) ) ( not ( = ?auto_24240 ?auto_24250 ) ) ( not ( = ?auto_24240 ?auto_24277 ) ) ( not ( = ?auto_24240 ?auto_24261 ) ) ( not ( = ?auto_24240 ?auto_24270 ) ) ( not ( = ?auto_24240 ?auto_24254 ) ) ( not ( = ?auto_24240 ?auto_24258 ) ) ( not ( = ?auto_24240 ?auto_24265 ) ) ( not ( = ?auto_24268 ?auto_24259 ) ) ( not ( = ?auto_24268 ?auto_24260 ) ) ( not ( = ?auto_24268 ?auto_24272 ) ) ( not ( = ?auto_24268 ?auto_24276 ) ) ( not ( = ?auto_24268 ?auto_24250 ) ) ( not ( = ?auto_24268 ?auto_24277 ) ) ( not ( = ?auto_24268 ?auto_24261 ) ) ( not ( = ?auto_24268 ?auto_24270 ) ) ( not ( = ?auto_24268 ?auto_24254 ) ) ( not ( = ?auto_24268 ?auto_24258 ) ) ( not ( = ?auto_24268 ?auto_24265 ) ) ( not ( = ?auto_24228 ?auto_24241 ) ) ( not ( = ?auto_24228 ?auto_24243 ) ) ( not ( = ?auto_24229 ?auto_24241 ) ) ( not ( = ?auto_24229 ?auto_24243 ) ) ( not ( = ?auto_24230 ?auto_24241 ) ) ( not ( = ?auto_24230 ?auto_24243 ) ) ( not ( = ?auto_24231 ?auto_24241 ) ) ( not ( = ?auto_24231 ?auto_24243 ) ) ( not ( = ?auto_24232 ?auto_24241 ) ) ( not ( = ?auto_24232 ?auto_24243 ) ) ( not ( = ?auto_24233 ?auto_24241 ) ) ( not ( = ?auto_24233 ?auto_24243 ) ) ( not ( = ?auto_24234 ?auto_24241 ) ) ( not ( = ?auto_24234 ?auto_24243 ) ) ( not ( = ?auto_24235 ?auto_24241 ) ) ( not ( = ?auto_24235 ?auto_24243 ) ) ( not ( = ?auto_24236 ?auto_24241 ) ) ( not ( = ?auto_24236 ?auto_24243 ) ) ( not ( = ?auto_24237 ?auto_24241 ) ) ( not ( = ?auto_24237 ?auto_24243 ) ) ( not ( = ?auto_24238 ?auto_24241 ) ) ( not ( = ?auto_24238 ?auto_24243 ) ) ( not ( = ?auto_24239 ?auto_24241 ) ) ( not ( = ?auto_24239 ?auto_24243 ) ) ( not ( = ?auto_24241 ?auto_24268 ) ) ( not ( = ?auto_24241 ?auto_24259 ) ) ( not ( = ?auto_24241 ?auto_24260 ) ) ( not ( = ?auto_24241 ?auto_24272 ) ) ( not ( = ?auto_24241 ?auto_24276 ) ) ( not ( = ?auto_24241 ?auto_24250 ) ) ( not ( = ?auto_24241 ?auto_24277 ) ) ( not ( = ?auto_24241 ?auto_24261 ) ) ( not ( = ?auto_24241 ?auto_24270 ) ) ( not ( = ?auto_24241 ?auto_24254 ) ) ( not ( = ?auto_24241 ?auto_24258 ) ) ( not ( = ?auto_24241 ?auto_24265 ) ) ( not ( = ?auto_24247 ?auto_24275 ) ) ( not ( = ?auto_24247 ?auto_24274 ) ) ( not ( = ?auto_24247 ?auto_24267 ) ) ( not ( = ?auto_24247 ?auto_24248 ) ) ( not ( = ?auto_24247 ?auto_24257 ) ) ( not ( = ?auto_24247 ?auto_24251 ) ) ( not ( = ?auto_24247 ?auto_24252 ) ) ( not ( = ?auto_24247 ?auto_24264 ) ) ( not ( = ?auto_24247 ?auto_24266 ) ) ( not ( = ?auto_24246 ?auto_24269 ) ) ( not ( = ?auto_24246 ?auto_24253 ) ) ( not ( = ?auto_24246 ?auto_24249 ) ) ( not ( = ?auto_24246 ?auto_24273 ) ) ( not ( = ?auto_24246 ?auto_24271 ) ) ( not ( = ?auto_24246 ?auto_24256 ) ) ( not ( = ?auto_24246 ?auto_24262 ) ) ( not ( = ?auto_24246 ?auto_24255 ) ) ( not ( = ?auto_24246 ?auto_24263 ) ) ( not ( = ?auto_24243 ?auto_24268 ) ) ( not ( = ?auto_24243 ?auto_24259 ) ) ( not ( = ?auto_24243 ?auto_24260 ) ) ( not ( = ?auto_24243 ?auto_24272 ) ) ( not ( = ?auto_24243 ?auto_24276 ) ) ( not ( = ?auto_24243 ?auto_24250 ) ) ( not ( = ?auto_24243 ?auto_24277 ) ) ( not ( = ?auto_24243 ?auto_24261 ) ) ( not ( = ?auto_24243 ?auto_24270 ) ) ( not ( = ?auto_24243 ?auto_24254 ) ) ( not ( = ?auto_24243 ?auto_24258 ) ) ( not ( = ?auto_24243 ?auto_24265 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_24228 ?auto_24229 ?auto_24230 ?auto_24231 ?auto_24232 ?auto_24233 ?auto_24234 ?auto_24235 ?auto_24236 ?auto_24237 ?auto_24238 ?auto_24239 ?auto_24240 )
      ( MAKE-1CRATE ?auto_24240 ?auto_24241 )
      ( MAKE-13CRATE-VERIFY ?auto_24228 ?auto_24229 ?auto_24230 ?auto_24231 ?auto_24232 ?auto_24233 ?auto_24234 ?auto_24235 ?auto_24236 ?auto_24237 ?auto_24238 ?auto_24239 ?auto_24240 ?auto_24241 ) )
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
      ?auto_24310 - SURFACE
      ?auto_24311 - SURFACE
      ?auto_24312 - SURFACE
      ?auto_24313 - SURFACE
      ?auto_24314 - SURFACE
      ?auto_24315 - SURFACE
      ?auto_24317 - SURFACE
      ?auto_24316 - SURFACE
    )
    :vars
    (
      ?auto_24323 - HOIST
      ?auto_24321 - PLACE
      ?auto_24318 - PLACE
      ?auto_24319 - HOIST
      ?auto_24322 - SURFACE
      ?auto_24344 - PLACE
      ?auto_24342 - HOIST
      ?auto_24330 - SURFACE
      ?auto_24327 - PLACE
      ?auto_24332 - HOIST
      ?auto_24331 - SURFACE
      ?auto_24346 - SURFACE
      ?auto_24328 - PLACE
      ?auto_24349 - HOIST
      ?auto_24334 - SURFACE
      ?auto_24348 - PLACE
      ?auto_24351 - HOIST
      ?auto_24340 - SURFACE
      ?auto_24345 - PLACE
      ?auto_24343 - HOIST
      ?auto_24329 - SURFACE
      ?auto_24336 - PLACE
      ?auto_24347 - HOIST
      ?auto_24339 - SURFACE
      ?auto_24325 - SURFACE
      ?auto_24326 - SURFACE
      ?auto_24352 - PLACE
      ?auto_24324 - HOIST
      ?auto_24341 - SURFACE
      ?auto_24333 - PLACE
      ?auto_24335 - HOIST
      ?auto_24350 - SURFACE
      ?auto_24354 - SURFACE
      ?auto_24338 - PLACE
      ?auto_24353 - HOIST
      ?auto_24337 - SURFACE
      ?auto_24320 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24323 ?auto_24321 ) ( IS-CRATE ?auto_24316 ) ( not ( = ?auto_24318 ?auto_24321 ) ) ( HOIST-AT ?auto_24319 ?auto_24318 ) ( SURFACE-AT ?auto_24316 ?auto_24318 ) ( ON ?auto_24316 ?auto_24322 ) ( CLEAR ?auto_24316 ) ( not ( = ?auto_24317 ?auto_24316 ) ) ( not ( = ?auto_24317 ?auto_24322 ) ) ( not ( = ?auto_24316 ?auto_24322 ) ) ( not ( = ?auto_24323 ?auto_24319 ) ) ( IS-CRATE ?auto_24317 ) ( not ( = ?auto_24344 ?auto_24321 ) ) ( HOIST-AT ?auto_24342 ?auto_24344 ) ( AVAILABLE ?auto_24342 ) ( SURFACE-AT ?auto_24317 ?auto_24344 ) ( ON ?auto_24317 ?auto_24330 ) ( CLEAR ?auto_24317 ) ( not ( = ?auto_24315 ?auto_24317 ) ) ( not ( = ?auto_24315 ?auto_24330 ) ) ( not ( = ?auto_24317 ?auto_24330 ) ) ( not ( = ?auto_24323 ?auto_24342 ) ) ( IS-CRATE ?auto_24315 ) ( not ( = ?auto_24327 ?auto_24321 ) ) ( HOIST-AT ?auto_24332 ?auto_24327 ) ( SURFACE-AT ?auto_24315 ?auto_24327 ) ( ON ?auto_24315 ?auto_24331 ) ( CLEAR ?auto_24315 ) ( not ( = ?auto_24314 ?auto_24315 ) ) ( not ( = ?auto_24314 ?auto_24331 ) ) ( not ( = ?auto_24315 ?auto_24331 ) ) ( not ( = ?auto_24323 ?auto_24332 ) ) ( IS-CRATE ?auto_24314 ) ( SURFACE-AT ?auto_24314 ?auto_24327 ) ( ON ?auto_24314 ?auto_24346 ) ( CLEAR ?auto_24314 ) ( not ( = ?auto_24313 ?auto_24314 ) ) ( not ( = ?auto_24313 ?auto_24346 ) ) ( not ( = ?auto_24314 ?auto_24346 ) ) ( IS-CRATE ?auto_24313 ) ( not ( = ?auto_24328 ?auto_24321 ) ) ( HOIST-AT ?auto_24349 ?auto_24328 ) ( AVAILABLE ?auto_24349 ) ( SURFACE-AT ?auto_24313 ?auto_24328 ) ( ON ?auto_24313 ?auto_24334 ) ( CLEAR ?auto_24313 ) ( not ( = ?auto_24312 ?auto_24313 ) ) ( not ( = ?auto_24312 ?auto_24334 ) ) ( not ( = ?auto_24313 ?auto_24334 ) ) ( not ( = ?auto_24323 ?auto_24349 ) ) ( IS-CRATE ?auto_24312 ) ( not ( = ?auto_24348 ?auto_24321 ) ) ( HOIST-AT ?auto_24351 ?auto_24348 ) ( AVAILABLE ?auto_24351 ) ( SURFACE-AT ?auto_24312 ?auto_24348 ) ( ON ?auto_24312 ?auto_24340 ) ( CLEAR ?auto_24312 ) ( not ( = ?auto_24311 ?auto_24312 ) ) ( not ( = ?auto_24311 ?auto_24340 ) ) ( not ( = ?auto_24312 ?auto_24340 ) ) ( not ( = ?auto_24323 ?auto_24351 ) ) ( IS-CRATE ?auto_24311 ) ( not ( = ?auto_24345 ?auto_24321 ) ) ( HOIST-AT ?auto_24343 ?auto_24345 ) ( AVAILABLE ?auto_24343 ) ( SURFACE-AT ?auto_24311 ?auto_24345 ) ( ON ?auto_24311 ?auto_24329 ) ( CLEAR ?auto_24311 ) ( not ( = ?auto_24310 ?auto_24311 ) ) ( not ( = ?auto_24310 ?auto_24329 ) ) ( not ( = ?auto_24311 ?auto_24329 ) ) ( not ( = ?auto_24323 ?auto_24343 ) ) ( IS-CRATE ?auto_24310 ) ( not ( = ?auto_24336 ?auto_24321 ) ) ( HOIST-AT ?auto_24347 ?auto_24336 ) ( AVAILABLE ?auto_24347 ) ( SURFACE-AT ?auto_24310 ?auto_24336 ) ( ON ?auto_24310 ?auto_24339 ) ( CLEAR ?auto_24310 ) ( not ( = ?auto_24309 ?auto_24310 ) ) ( not ( = ?auto_24309 ?auto_24339 ) ) ( not ( = ?auto_24310 ?auto_24339 ) ) ( not ( = ?auto_24323 ?auto_24347 ) ) ( IS-CRATE ?auto_24309 ) ( SURFACE-AT ?auto_24309 ?auto_24318 ) ( ON ?auto_24309 ?auto_24325 ) ( CLEAR ?auto_24309 ) ( not ( = ?auto_24308 ?auto_24309 ) ) ( not ( = ?auto_24308 ?auto_24325 ) ) ( not ( = ?auto_24309 ?auto_24325 ) ) ( IS-CRATE ?auto_24308 ) ( AVAILABLE ?auto_24332 ) ( SURFACE-AT ?auto_24308 ?auto_24327 ) ( ON ?auto_24308 ?auto_24326 ) ( CLEAR ?auto_24308 ) ( not ( = ?auto_24307 ?auto_24308 ) ) ( not ( = ?auto_24307 ?auto_24326 ) ) ( not ( = ?auto_24308 ?auto_24326 ) ) ( IS-CRATE ?auto_24307 ) ( not ( = ?auto_24352 ?auto_24321 ) ) ( HOIST-AT ?auto_24324 ?auto_24352 ) ( AVAILABLE ?auto_24324 ) ( SURFACE-AT ?auto_24307 ?auto_24352 ) ( ON ?auto_24307 ?auto_24341 ) ( CLEAR ?auto_24307 ) ( not ( = ?auto_24306 ?auto_24307 ) ) ( not ( = ?auto_24306 ?auto_24341 ) ) ( not ( = ?auto_24307 ?auto_24341 ) ) ( not ( = ?auto_24323 ?auto_24324 ) ) ( IS-CRATE ?auto_24306 ) ( not ( = ?auto_24333 ?auto_24321 ) ) ( HOIST-AT ?auto_24335 ?auto_24333 ) ( AVAILABLE ?auto_24335 ) ( SURFACE-AT ?auto_24306 ?auto_24333 ) ( ON ?auto_24306 ?auto_24350 ) ( CLEAR ?auto_24306 ) ( not ( = ?auto_24305 ?auto_24306 ) ) ( not ( = ?auto_24305 ?auto_24350 ) ) ( not ( = ?auto_24306 ?auto_24350 ) ) ( not ( = ?auto_24323 ?auto_24335 ) ) ( IS-CRATE ?auto_24305 ) ( AVAILABLE ?auto_24319 ) ( SURFACE-AT ?auto_24305 ?auto_24318 ) ( ON ?auto_24305 ?auto_24354 ) ( CLEAR ?auto_24305 ) ( not ( = ?auto_24304 ?auto_24305 ) ) ( not ( = ?auto_24304 ?auto_24354 ) ) ( not ( = ?auto_24305 ?auto_24354 ) ) ( SURFACE-AT ?auto_24303 ?auto_24321 ) ( CLEAR ?auto_24303 ) ( IS-CRATE ?auto_24304 ) ( AVAILABLE ?auto_24323 ) ( not ( = ?auto_24338 ?auto_24321 ) ) ( HOIST-AT ?auto_24353 ?auto_24338 ) ( AVAILABLE ?auto_24353 ) ( SURFACE-AT ?auto_24304 ?auto_24338 ) ( ON ?auto_24304 ?auto_24337 ) ( CLEAR ?auto_24304 ) ( TRUCK-AT ?auto_24320 ?auto_24321 ) ( not ( = ?auto_24303 ?auto_24304 ) ) ( not ( = ?auto_24303 ?auto_24337 ) ) ( not ( = ?auto_24304 ?auto_24337 ) ) ( not ( = ?auto_24323 ?auto_24353 ) ) ( not ( = ?auto_24303 ?auto_24305 ) ) ( not ( = ?auto_24303 ?auto_24354 ) ) ( not ( = ?auto_24305 ?auto_24337 ) ) ( not ( = ?auto_24318 ?auto_24338 ) ) ( not ( = ?auto_24319 ?auto_24353 ) ) ( not ( = ?auto_24354 ?auto_24337 ) ) ( not ( = ?auto_24303 ?auto_24306 ) ) ( not ( = ?auto_24303 ?auto_24350 ) ) ( not ( = ?auto_24304 ?auto_24306 ) ) ( not ( = ?auto_24304 ?auto_24350 ) ) ( not ( = ?auto_24306 ?auto_24354 ) ) ( not ( = ?auto_24306 ?auto_24337 ) ) ( not ( = ?auto_24333 ?auto_24318 ) ) ( not ( = ?auto_24333 ?auto_24338 ) ) ( not ( = ?auto_24335 ?auto_24319 ) ) ( not ( = ?auto_24335 ?auto_24353 ) ) ( not ( = ?auto_24350 ?auto_24354 ) ) ( not ( = ?auto_24350 ?auto_24337 ) ) ( not ( = ?auto_24303 ?auto_24307 ) ) ( not ( = ?auto_24303 ?auto_24341 ) ) ( not ( = ?auto_24304 ?auto_24307 ) ) ( not ( = ?auto_24304 ?auto_24341 ) ) ( not ( = ?auto_24305 ?auto_24307 ) ) ( not ( = ?auto_24305 ?auto_24341 ) ) ( not ( = ?auto_24307 ?auto_24350 ) ) ( not ( = ?auto_24307 ?auto_24354 ) ) ( not ( = ?auto_24307 ?auto_24337 ) ) ( not ( = ?auto_24352 ?auto_24333 ) ) ( not ( = ?auto_24352 ?auto_24318 ) ) ( not ( = ?auto_24352 ?auto_24338 ) ) ( not ( = ?auto_24324 ?auto_24335 ) ) ( not ( = ?auto_24324 ?auto_24319 ) ) ( not ( = ?auto_24324 ?auto_24353 ) ) ( not ( = ?auto_24341 ?auto_24350 ) ) ( not ( = ?auto_24341 ?auto_24354 ) ) ( not ( = ?auto_24341 ?auto_24337 ) ) ( not ( = ?auto_24303 ?auto_24308 ) ) ( not ( = ?auto_24303 ?auto_24326 ) ) ( not ( = ?auto_24304 ?auto_24308 ) ) ( not ( = ?auto_24304 ?auto_24326 ) ) ( not ( = ?auto_24305 ?auto_24308 ) ) ( not ( = ?auto_24305 ?auto_24326 ) ) ( not ( = ?auto_24306 ?auto_24308 ) ) ( not ( = ?auto_24306 ?auto_24326 ) ) ( not ( = ?auto_24308 ?auto_24341 ) ) ( not ( = ?auto_24308 ?auto_24350 ) ) ( not ( = ?auto_24308 ?auto_24354 ) ) ( not ( = ?auto_24308 ?auto_24337 ) ) ( not ( = ?auto_24327 ?auto_24352 ) ) ( not ( = ?auto_24327 ?auto_24333 ) ) ( not ( = ?auto_24327 ?auto_24318 ) ) ( not ( = ?auto_24327 ?auto_24338 ) ) ( not ( = ?auto_24332 ?auto_24324 ) ) ( not ( = ?auto_24332 ?auto_24335 ) ) ( not ( = ?auto_24332 ?auto_24319 ) ) ( not ( = ?auto_24332 ?auto_24353 ) ) ( not ( = ?auto_24326 ?auto_24341 ) ) ( not ( = ?auto_24326 ?auto_24350 ) ) ( not ( = ?auto_24326 ?auto_24354 ) ) ( not ( = ?auto_24326 ?auto_24337 ) ) ( not ( = ?auto_24303 ?auto_24309 ) ) ( not ( = ?auto_24303 ?auto_24325 ) ) ( not ( = ?auto_24304 ?auto_24309 ) ) ( not ( = ?auto_24304 ?auto_24325 ) ) ( not ( = ?auto_24305 ?auto_24309 ) ) ( not ( = ?auto_24305 ?auto_24325 ) ) ( not ( = ?auto_24306 ?auto_24309 ) ) ( not ( = ?auto_24306 ?auto_24325 ) ) ( not ( = ?auto_24307 ?auto_24309 ) ) ( not ( = ?auto_24307 ?auto_24325 ) ) ( not ( = ?auto_24309 ?auto_24326 ) ) ( not ( = ?auto_24309 ?auto_24341 ) ) ( not ( = ?auto_24309 ?auto_24350 ) ) ( not ( = ?auto_24309 ?auto_24354 ) ) ( not ( = ?auto_24309 ?auto_24337 ) ) ( not ( = ?auto_24325 ?auto_24326 ) ) ( not ( = ?auto_24325 ?auto_24341 ) ) ( not ( = ?auto_24325 ?auto_24350 ) ) ( not ( = ?auto_24325 ?auto_24354 ) ) ( not ( = ?auto_24325 ?auto_24337 ) ) ( not ( = ?auto_24303 ?auto_24310 ) ) ( not ( = ?auto_24303 ?auto_24339 ) ) ( not ( = ?auto_24304 ?auto_24310 ) ) ( not ( = ?auto_24304 ?auto_24339 ) ) ( not ( = ?auto_24305 ?auto_24310 ) ) ( not ( = ?auto_24305 ?auto_24339 ) ) ( not ( = ?auto_24306 ?auto_24310 ) ) ( not ( = ?auto_24306 ?auto_24339 ) ) ( not ( = ?auto_24307 ?auto_24310 ) ) ( not ( = ?auto_24307 ?auto_24339 ) ) ( not ( = ?auto_24308 ?auto_24310 ) ) ( not ( = ?auto_24308 ?auto_24339 ) ) ( not ( = ?auto_24310 ?auto_24325 ) ) ( not ( = ?auto_24310 ?auto_24326 ) ) ( not ( = ?auto_24310 ?auto_24341 ) ) ( not ( = ?auto_24310 ?auto_24350 ) ) ( not ( = ?auto_24310 ?auto_24354 ) ) ( not ( = ?auto_24310 ?auto_24337 ) ) ( not ( = ?auto_24336 ?auto_24318 ) ) ( not ( = ?auto_24336 ?auto_24327 ) ) ( not ( = ?auto_24336 ?auto_24352 ) ) ( not ( = ?auto_24336 ?auto_24333 ) ) ( not ( = ?auto_24336 ?auto_24338 ) ) ( not ( = ?auto_24347 ?auto_24319 ) ) ( not ( = ?auto_24347 ?auto_24332 ) ) ( not ( = ?auto_24347 ?auto_24324 ) ) ( not ( = ?auto_24347 ?auto_24335 ) ) ( not ( = ?auto_24347 ?auto_24353 ) ) ( not ( = ?auto_24339 ?auto_24325 ) ) ( not ( = ?auto_24339 ?auto_24326 ) ) ( not ( = ?auto_24339 ?auto_24341 ) ) ( not ( = ?auto_24339 ?auto_24350 ) ) ( not ( = ?auto_24339 ?auto_24354 ) ) ( not ( = ?auto_24339 ?auto_24337 ) ) ( not ( = ?auto_24303 ?auto_24311 ) ) ( not ( = ?auto_24303 ?auto_24329 ) ) ( not ( = ?auto_24304 ?auto_24311 ) ) ( not ( = ?auto_24304 ?auto_24329 ) ) ( not ( = ?auto_24305 ?auto_24311 ) ) ( not ( = ?auto_24305 ?auto_24329 ) ) ( not ( = ?auto_24306 ?auto_24311 ) ) ( not ( = ?auto_24306 ?auto_24329 ) ) ( not ( = ?auto_24307 ?auto_24311 ) ) ( not ( = ?auto_24307 ?auto_24329 ) ) ( not ( = ?auto_24308 ?auto_24311 ) ) ( not ( = ?auto_24308 ?auto_24329 ) ) ( not ( = ?auto_24309 ?auto_24311 ) ) ( not ( = ?auto_24309 ?auto_24329 ) ) ( not ( = ?auto_24311 ?auto_24339 ) ) ( not ( = ?auto_24311 ?auto_24325 ) ) ( not ( = ?auto_24311 ?auto_24326 ) ) ( not ( = ?auto_24311 ?auto_24341 ) ) ( not ( = ?auto_24311 ?auto_24350 ) ) ( not ( = ?auto_24311 ?auto_24354 ) ) ( not ( = ?auto_24311 ?auto_24337 ) ) ( not ( = ?auto_24345 ?auto_24336 ) ) ( not ( = ?auto_24345 ?auto_24318 ) ) ( not ( = ?auto_24345 ?auto_24327 ) ) ( not ( = ?auto_24345 ?auto_24352 ) ) ( not ( = ?auto_24345 ?auto_24333 ) ) ( not ( = ?auto_24345 ?auto_24338 ) ) ( not ( = ?auto_24343 ?auto_24347 ) ) ( not ( = ?auto_24343 ?auto_24319 ) ) ( not ( = ?auto_24343 ?auto_24332 ) ) ( not ( = ?auto_24343 ?auto_24324 ) ) ( not ( = ?auto_24343 ?auto_24335 ) ) ( not ( = ?auto_24343 ?auto_24353 ) ) ( not ( = ?auto_24329 ?auto_24339 ) ) ( not ( = ?auto_24329 ?auto_24325 ) ) ( not ( = ?auto_24329 ?auto_24326 ) ) ( not ( = ?auto_24329 ?auto_24341 ) ) ( not ( = ?auto_24329 ?auto_24350 ) ) ( not ( = ?auto_24329 ?auto_24354 ) ) ( not ( = ?auto_24329 ?auto_24337 ) ) ( not ( = ?auto_24303 ?auto_24312 ) ) ( not ( = ?auto_24303 ?auto_24340 ) ) ( not ( = ?auto_24304 ?auto_24312 ) ) ( not ( = ?auto_24304 ?auto_24340 ) ) ( not ( = ?auto_24305 ?auto_24312 ) ) ( not ( = ?auto_24305 ?auto_24340 ) ) ( not ( = ?auto_24306 ?auto_24312 ) ) ( not ( = ?auto_24306 ?auto_24340 ) ) ( not ( = ?auto_24307 ?auto_24312 ) ) ( not ( = ?auto_24307 ?auto_24340 ) ) ( not ( = ?auto_24308 ?auto_24312 ) ) ( not ( = ?auto_24308 ?auto_24340 ) ) ( not ( = ?auto_24309 ?auto_24312 ) ) ( not ( = ?auto_24309 ?auto_24340 ) ) ( not ( = ?auto_24310 ?auto_24312 ) ) ( not ( = ?auto_24310 ?auto_24340 ) ) ( not ( = ?auto_24312 ?auto_24329 ) ) ( not ( = ?auto_24312 ?auto_24339 ) ) ( not ( = ?auto_24312 ?auto_24325 ) ) ( not ( = ?auto_24312 ?auto_24326 ) ) ( not ( = ?auto_24312 ?auto_24341 ) ) ( not ( = ?auto_24312 ?auto_24350 ) ) ( not ( = ?auto_24312 ?auto_24354 ) ) ( not ( = ?auto_24312 ?auto_24337 ) ) ( not ( = ?auto_24348 ?auto_24345 ) ) ( not ( = ?auto_24348 ?auto_24336 ) ) ( not ( = ?auto_24348 ?auto_24318 ) ) ( not ( = ?auto_24348 ?auto_24327 ) ) ( not ( = ?auto_24348 ?auto_24352 ) ) ( not ( = ?auto_24348 ?auto_24333 ) ) ( not ( = ?auto_24348 ?auto_24338 ) ) ( not ( = ?auto_24351 ?auto_24343 ) ) ( not ( = ?auto_24351 ?auto_24347 ) ) ( not ( = ?auto_24351 ?auto_24319 ) ) ( not ( = ?auto_24351 ?auto_24332 ) ) ( not ( = ?auto_24351 ?auto_24324 ) ) ( not ( = ?auto_24351 ?auto_24335 ) ) ( not ( = ?auto_24351 ?auto_24353 ) ) ( not ( = ?auto_24340 ?auto_24329 ) ) ( not ( = ?auto_24340 ?auto_24339 ) ) ( not ( = ?auto_24340 ?auto_24325 ) ) ( not ( = ?auto_24340 ?auto_24326 ) ) ( not ( = ?auto_24340 ?auto_24341 ) ) ( not ( = ?auto_24340 ?auto_24350 ) ) ( not ( = ?auto_24340 ?auto_24354 ) ) ( not ( = ?auto_24340 ?auto_24337 ) ) ( not ( = ?auto_24303 ?auto_24313 ) ) ( not ( = ?auto_24303 ?auto_24334 ) ) ( not ( = ?auto_24304 ?auto_24313 ) ) ( not ( = ?auto_24304 ?auto_24334 ) ) ( not ( = ?auto_24305 ?auto_24313 ) ) ( not ( = ?auto_24305 ?auto_24334 ) ) ( not ( = ?auto_24306 ?auto_24313 ) ) ( not ( = ?auto_24306 ?auto_24334 ) ) ( not ( = ?auto_24307 ?auto_24313 ) ) ( not ( = ?auto_24307 ?auto_24334 ) ) ( not ( = ?auto_24308 ?auto_24313 ) ) ( not ( = ?auto_24308 ?auto_24334 ) ) ( not ( = ?auto_24309 ?auto_24313 ) ) ( not ( = ?auto_24309 ?auto_24334 ) ) ( not ( = ?auto_24310 ?auto_24313 ) ) ( not ( = ?auto_24310 ?auto_24334 ) ) ( not ( = ?auto_24311 ?auto_24313 ) ) ( not ( = ?auto_24311 ?auto_24334 ) ) ( not ( = ?auto_24313 ?auto_24340 ) ) ( not ( = ?auto_24313 ?auto_24329 ) ) ( not ( = ?auto_24313 ?auto_24339 ) ) ( not ( = ?auto_24313 ?auto_24325 ) ) ( not ( = ?auto_24313 ?auto_24326 ) ) ( not ( = ?auto_24313 ?auto_24341 ) ) ( not ( = ?auto_24313 ?auto_24350 ) ) ( not ( = ?auto_24313 ?auto_24354 ) ) ( not ( = ?auto_24313 ?auto_24337 ) ) ( not ( = ?auto_24328 ?auto_24348 ) ) ( not ( = ?auto_24328 ?auto_24345 ) ) ( not ( = ?auto_24328 ?auto_24336 ) ) ( not ( = ?auto_24328 ?auto_24318 ) ) ( not ( = ?auto_24328 ?auto_24327 ) ) ( not ( = ?auto_24328 ?auto_24352 ) ) ( not ( = ?auto_24328 ?auto_24333 ) ) ( not ( = ?auto_24328 ?auto_24338 ) ) ( not ( = ?auto_24349 ?auto_24351 ) ) ( not ( = ?auto_24349 ?auto_24343 ) ) ( not ( = ?auto_24349 ?auto_24347 ) ) ( not ( = ?auto_24349 ?auto_24319 ) ) ( not ( = ?auto_24349 ?auto_24332 ) ) ( not ( = ?auto_24349 ?auto_24324 ) ) ( not ( = ?auto_24349 ?auto_24335 ) ) ( not ( = ?auto_24349 ?auto_24353 ) ) ( not ( = ?auto_24334 ?auto_24340 ) ) ( not ( = ?auto_24334 ?auto_24329 ) ) ( not ( = ?auto_24334 ?auto_24339 ) ) ( not ( = ?auto_24334 ?auto_24325 ) ) ( not ( = ?auto_24334 ?auto_24326 ) ) ( not ( = ?auto_24334 ?auto_24341 ) ) ( not ( = ?auto_24334 ?auto_24350 ) ) ( not ( = ?auto_24334 ?auto_24354 ) ) ( not ( = ?auto_24334 ?auto_24337 ) ) ( not ( = ?auto_24303 ?auto_24314 ) ) ( not ( = ?auto_24303 ?auto_24346 ) ) ( not ( = ?auto_24304 ?auto_24314 ) ) ( not ( = ?auto_24304 ?auto_24346 ) ) ( not ( = ?auto_24305 ?auto_24314 ) ) ( not ( = ?auto_24305 ?auto_24346 ) ) ( not ( = ?auto_24306 ?auto_24314 ) ) ( not ( = ?auto_24306 ?auto_24346 ) ) ( not ( = ?auto_24307 ?auto_24314 ) ) ( not ( = ?auto_24307 ?auto_24346 ) ) ( not ( = ?auto_24308 ?auto_24314 ) ) ( not ( = ?auto_24308 ?auto_24346 ) ) ( not ( = ?auto_24309 ?auto_24314 ) ) ( not ( = ?auto_24309 ?auto_24346 ) ) ( not ( = ?auto_24310 ?auto_24314 ) ) ( not ( = ?auto_24310 ?auto_24346 ) ) ( not ( = ?auto_24311 ?auto_24314 ) ) ( not ( = ?auto_24311 ?auto_24346 ) ) ( not ( = ?auto_24312 ?auto_24314 ) ) ( not ( = ?auto_24312 ?auto_24346 ) ) ( not ( = ?auto_24314 ?auto_24334 ) ) ( not ( = ?auto_24314 ?auto_24340 ) ) ( not ( = ?auto_24314 ?auto_24329 ) ) ( not ( = ?auto_24314 ?auto_24339 ) ) ( not ( = ?auto_24314 ?auto_24325 ) ) ( not ( = ?auto_24314 ?auto_24326 ) ) ( not ( = ?auto_24314 ?auto_24341 ) ) ( not ( = ?auto_24314 ?auto_24350 ) ) ( not ( = ?auto_24314 ?auto_24354 ) ) ( not ( = ?auto_24314 ?auto_24337 ) ) ( not ( = ?auto_24346 ?auto_24334 ) ) ( not ( = ?auto_24346 ?auto_24340 ) ) ( not ( = ?auto_24346 ?auto_24329 ) ) ( not ( = ?auto_24346 ?auto_24339 ) ) ( not ( = ?auto_24346 ?auto_24325 ) ) ( not ( = ?auto_24346 ?auto_24326 ) ) ( not ( = ?auto_24346 ?auto_24341 ) ) ( not ( = ?auto_24346 ?auto_24350 ) ) ( not ( = ?auto_24346 ?auto_24354 ) ) ( not ( = ?auto_24346 ?auto_24337 ) ) ( not ( = ?auto_24303 ?auto_24315 ) ) ( not ( = ?auto_24303 ?auto_24331 ) ) ( not ( = ?auto_24304 ?auto_24315 ) ) ( not ( = ?auto_24304 ?auto_24331 ) ) ( not ( = ?auto_24305 ?auto_24315 ) ) ( not ( = ?auto_24305 ?auto_24331 ) ) ( not ( = ?auto_24306 ?auto_24315 ) ) ( not ( = ?auto_24306 ?auto_24331 ) ) ( not ( = ?auto_24307 ?auto_24315 ) ) ( not ( = ?auto_24307 ?auto_24331 ) ) ( not ( = ?auto_24308 ?auto_24315 ) ) ( not ( = ?auto_24308 ?auto_24331 ) ) ( not ( = ?auto_24309 ?auto_24315 ) ) ( not ( = ?auto_24309 ?auto_24331 ) ) ( not ( = ?auto_24310 ?auto_24315 ) ) ( not ( = ?auto_24310 ?auto_24331 ) ) ( not ( = ?auto_24311 ?auto_24315 ) ) ( not ( = ?auto_24311 ?auto_24331 ) ) ( not ( = ?auto_24312 ?auto_24315 ) ) ( not ( = ?auto_24312 ?auto_24331 ) ) ( not ( = ?auto_24313 ?auto_24315 ) ) ( not ( = ?auto_24313 ?auto_24331 ) ) ( not ( = ?auto_24315 ?auto_24346 ) ) ( not ( = ?auto_24315 ?auto_24334 ) ) ( not ( = ?auto_24315 ?auto_24340 ) ) ( not ( = ?auto_24315 ?auto_24329 ) ) ( not ( = ?auto_24315 ?auto_24339 ) ) ( not ( = ?auto_24315 ?auto_24325 ) ) ( not ( = ?auto_24315 ?auto_24326 ) ) ( not ( = ?auto_24315 ?auto_24341 ) ) ( not ( = ?auto_24315 ?auto_24350 ) ) ( not ( = ?auto_24315 ?auto_24354 ) ) ( not ( = ?auto_24315 ?auto_24337 ) ) ( not ( = ?auto_24331 ?auto_24346 ) ) ( not ( = ?auto_24331 ?auto_24334 ) ) ( not ( = ?auto_24331 ?auto_24340 ) ) ( not ( = ?auto_24331 ?auto_24329 ) ) ( not ( = ?auto_24331 ?auto_24339 ) ) ( not ( = ?auto_24331 ?auto_24325 ) ) ( not ( = ?auto_24331 ?auto_24326 ) ) ( not ( = ?auto_24331 ?auto_24341 ) ) ( not ( = ?auto_24331 ?auto_24350 ) ) ( not ( = ?auto_24331 ?auto_24354 ) ) ( not ( = ?auto_24331 ?auto_24337 ) ) ( not ( = ?auto_24303 ?auto_24317 ) ) ( not ( = ?auto_24303 ?auto_24330 ) ) ( not ( = ?auto_24304 ?auto_24317 ) ) ( not ( = ?auto_24304 ?auto_24330 ) ) ( not ( = ?auto_24305 ?auto_24317 ) ) ( not ( = ?auto_24305 ?auto_24330 ) ) ( not ( = ?auto_24306 ?auto_24317 ) ) ( not ( = ?auto_24306 ?auto_24330 ) ) ( not ( = ?auto_24307 ?auto_24317 ) ) ( not ( = ?auto_24307 ?auto_24330 ) ) ( not ( = ?auto_24308 ?auto_24317 ) ) ( not ( = ?auto_24308 ?auto_24330 ) ) ( not ( = ?auto_24309 ?auto_24317 ) ) ( not ( = ?auto_24309 ?auto_24330 ) ) ( not ( = ?auto_24310 ?auto_24317 ) ) ( not ( = ?auto_24310 ?auto_24330 ) ) ( not ( = ?auto_24311 ?auto_24317 ) ) ( not ( = ?auto_24311 ?auto_24330 ) ) ( not ( = ?auto_24312 ?auto_24317 ) ) ( not ( = ?auto_24312 ?auto_24330 ) ) ( not ( = ?auto_24313 ?auto_24317 ) ) ( not ( = ?auto_24313 ?auto_24330 ) ) ( not ( = ?auto_24314 ?auto_24317 ) ) ( not ( = ?auto_24314 ?auto_24330 ) ) ( not ( = ?auto_24317 ?auto_24331 ) ) ( not ( = ?auto_24317 ?auto_24346 ) ) ( not ( = ?auto_24317 ?auto_24334 ) ) ( not ( = ?auto_24317 ?auto_24340 ) ) ( not ( = ?auto_24317 ?auto_24329 ) ) ( not ( = ?auto_24317 ?auto_24339 ) ) ( not ( = ?auto_24317 ?auto_24325 ) ) ( not ( = ?auto_24317 ?auto_24326 ) ) ( not ( = ?auto_24317 ?auto_24341 ) ) ( not ( = ?auto_24317 ?auto_24350 ) ) ( not ( = ?auto_24317 ?auto_24354 ) ) ( not ( = ?auto_24317 ?auto_24337 ) ) ( not ( = ?auto_24344 ?auto_24327 ) ) ( not ( = ?auto_24344 ?auto_24328 ) ) ( not ( = ?auto_24344 ?auto_24348 ) ) ( not ( = ?auto_24344 ?auto_24345 ) ) ( not ( = ?auto_24344 ?auto_24336 ) ) ( not ( = ?auto_24344 ?auto_24318 ) ) ( not ( = ?auto_24344 ?auto_24352 ) ) ( not ( = ?auto_24344 ?auto_24333 ) ) ( not ( = ?auto_24344 ?auto_24338 ) ) ( not ( = ?auto_24342 ?auto_24332 ) ) ( not ( = ?auto_24342 ?auto_24349 ) ) ( not ( = ?auto_24342 ?auto_24351 ) ) ( not ( = ?auto_24342 ?auto_24343 ) ) ( not ( = ?auto_24342 ?auto_24347 ) ) ( not ( = ?auto_24342 ?auto_24319 ) ) ( not ( = ?auto_24342 ?auto_24324 ) ) ( not ( = ?auto_24342 ?auto_24335 ) ) ( not ( = ?auto_24342 ?auto_24353 ) ) ( not ( = ?auto_24330 ?auto_24331 ) ) ( not ( = ?auto_24330 ?auto_24346 ) ) ( not ( = ?auto_24330 ?auto_24334 ) ) ( not ( = ?auto_24330 ?auto_24340 ) ) ( not ( = ?auto_24330 ?auto_24329 ) ) ( not ( = ?auto_24330 ?auto_24339 ) ) ( not ( = ?auto_24330 ?auto_24325 ) ) ( not ( = ?auto_24330 ?auto_24326 ) ) ( not ( = ?auto_24330 ?auto_24341 ) ) ( not ( = ?auto_24330 ?auto_24350 ) ) ( not ( = ?auto_24330 ?auto_24354 ) ) ( not ( = ?auto_24330 ?auto_24337 ) ) ( not ( = ?auto_24303 ?auto_24316 ) ) ( not ( = ?auto_24303 ?auto_24322 ) ) ( not ( = ?auto_24304 ?auto_24316 ) ) ( not ( = ?auto_24304 ?auto_24322 ) ) ( not ( = ?auto_24305 ?auto_24316 ) ) ( not ( = ?auto_24305 ?auto_24322 ) ) ( not ( = ?auto_24306 ?auto_24316 ) ) ( not ( = ?auto_24306 ?auto_24322 ) ) ( not ( = ?auto_24307 ?auto_24316 ) ) ( not ( = ?auto_24307 ?auto_24322 ) ) ( not ( = ?auto_24308 ?auto_24316 ) ) ( not ( = ?auto_24308 ?auto_24322 ) ) ( not ( = ?auto_24309 ?auto_24316 ) ) ( not ( = ?auto_24309 ?auto_24322 ) ) ( not ( = ?auto_24310 ?auto_24316 ) ) ( not ( = ?auto_24310 ?auto_24322 ) ) ( not ( = ?auto_24311 ?auto_24316 ) ) ( not ( = ?auto_24311 ?auto_24322 ) ) ( not ( = ?auto_24312 ?auto_24316 ) ) ( not ( = ?auto_24312 ?auto_24322 ) ) ( not ( = ?auto_24313 ?auto_24316 ) ) ( not ( = ?auto_24313 ?auto_24322 ) ) ( not ( = ?auto_24314 ?auto_24316 ) ) ( not ( = ?auto_24314 ?auto_24322 ) ) ( not ( = ?auto_24315 ?auto_24316 ) ) ( not ( = ?auto_24315 ?auto_24322 ) ) ( not ( = ?auto_24316 ?auto_24330 ) ) ( not ( = ?auto_24316 ?auto_24331 ) ) ( not ( = ?auto_24316 ?auto_24346 ) ) ( not ( = ?auto_24316 ?auto_24334 ) ) ( not ( = ?auto_24316 ?auto_24340 ) ) ( not ( = ?auto_24316 ?auto_24329 ) ) ( not ( = ?auto_24316 ?auto_24339 ) ) ( not ( = ?auto_24316 ?auto_24325 ) ) ( not ( = ?auto_24316 ?auto_24326 ) ) ( not ( = ?auto_24316 ?auto_24341 ) ) ( not ( = ?auto_24316 ?auto_24350 ) ) ( not ( = ?auto_24316 ?auto_24354 ) ) ( not ( = ?auto_24316 ?auto_24337 ) ) ( not ( = ?auto_24322 ?auto_24330 ) ) ( not ( = ?auto_24322 ?auto_24331 ) ) ( not ( = ?auto_24322 ?auto_24346 ) ) ( not ( = ?auto_24322 ?auto_24334 ) ) ( not ( = ?auto_24322 ?auto_24340 ) ) ( not ( = ?auto_24322 ?auto_24329 ) ) ( not ( = ?auto_24322 ?auto_24339 ) ) ( not ( = ?auto_24322 ?auto_24325 ) ) ( not ( = ?auto_24322 ?auto_24326 ) ) ( not ( = ?auto_24322 ?auto_24341 ) ) ( not ( = ?auto_24322 ?auto_24350 ) ) ( not ( = ?auto_24322 ?auto_24354 ) ) ( not ( = ?auto_24322 ?auto_24337 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_24303 ?auto_24304 ?auto_24305 ?auto_24306 ?auto_24307 ?auto_24308 ?auto_24309 ?auto_24310 ?auto_24311 ?auto_24312 ?auto_24313 ?auto_24314 ?auto_24315 ?auto_24317 )
      ( MAKE-1CRATE ?auto_24317 ?auto_24316 )
      ( MAKE-14CRATE-VERIFY ?auto_24303 ?auto_24304 ?auto_24305 ?auto_24306 ?auto_24307 ?auto_24308 ?auto_24309 ?auto_24310 ?auto_24311 ?auto_24312 ?auto_24313 ?auto_24314 ?auto_24315 ?auto_24317 ?auto_24316 ) )
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
      ?auto_24388 - SURFACE
      ?auto_24389 - SURFACE
      ?auto_24390 - SURFACE
      ?auto_24391 - SURFACE
      ?auto_24392 - SURFACE
      ?auto_24393 - SURFACE
      ?auto_24395 - SURFACE
      ?auto_24394 - SURFACE
      ?auto_24396 - SURFACE
    )
    :vars
    (
      ?auto_24397 - HOIST
      ?auto_24400 - PLACE
      ?auto_24401 - PLACE
      ?auto_24399 - HOIST
      ?auto_24402 - SURFACE
      ?auto_24435 - PLACE
      ?auto_24428 - HOIST
      ?auto_24412 - SURFACE
      ?auto_24410 - PLACE
      ?auto_24416 - HOIST
      ?auto_24421 - SURFACE
      ?auto_24427 - PLACE
      ?auto_24419 - HOIST
      ?auto_24414 - SURFACE
      ?auto_24434 - SURFACE
      ?auto_24408 - PLACE
      ?auto_24411 - HOIST
      ?auto_24432 - SURFACE
      ?auto_24405 - PLACE
      ?auto_24429 - HOIST
      ?auto_24422 - SURFACE
      ?auto_24404 - PLACE
      ?auto_24415 - HOIST
      ?auto_24413 - SURFACE
      ?auto_24407 - PLACE
      ?auto_24425 - HOIST
      ?auto_24426 - SURFACE
      ?auto_24406 - SURFACE
      ?auto_24423 - SURFACE
      ?auto_24436 - PLACE
      ?auto_24409 - HOIST
      ?auto_24431 - SURFACE
      ?auto_24420 - PLACE
      ?auto_24417 - HOIST
      ?auto_24418 - SURFACE
      ?auto_24433 - SURFACE
      ?auto_24403 - PLACE
      ?auto_24424 - HOIST
      ?auto_24430 - SURFACE
      ?auto_24398 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24397 ?auto_24400 ) ( IS-CRATE ?auto_24396 ) ( not ( = ?auto_24401 ?auto_24400 ) ) ( HOIST-AT ?auto_24399 ?auto_24401 ) ( AVAILABLE ?auto_24399 ) ( SURFACE-AT ?auto_24396 ?auto_24401 ) ( ON ?auto_24396 ?auto_24402 ) ( CLEAR ?auto_24396 ) ( not ( = ?auto_24394 ?auto_24396 ) ) ( not ( = ?auto_24394 ?auto_24402 ) ) ( not ( = ?auto_24396 ?auto_24402 ) ) ( not ( = ?auto_24397 ?auto_24399 ) ) ( IS-CRATE ?auto_24394 ) ( not ( = ?auto_24435 ?auto_24400 ) ) ( HOIST-AT ?auto_24428 ?auto_24435 ) ( SURFACE-AT ?auto_24394 ?auto_24435 ) ( ON ?auto_24394 ?auto_24412 ) ( CLEAR ?auto_24394 ) ( not ( = ?auto_24395 ?auto_24394 ) ) ( not ( = ?auto_24395 ?auto_24412 ) ) ( not ( = ?auto_24394 ?auto_24412 ) ) ( not ( = ?auto_24397 ?auto_24428 ) ) ( IS-CRATE ?auto_24395 ) ( not ( = ?auto_24410 ?auto_24400 ) ) ( HOIST-AT ?auto_24416 ?auto_24410 ) ( AVAILABLE ?auto_24416 ) ( SURFACE-AT ?auto_24395 ?auto_24410 ) ( ON ?auto_24395 ?auto_24421 ) ( CLEAR ?auto_24395 ) ( not ( = ?auto_24393 ?auto_24395 ) ) ( not ( = ?auto_24393 ?auto_24421 ) ) ( not ( = ?auto_24395 ?auto_24421 ) ) ( not ( = ?auto_24397 ?auto_24416 ) ) ( IS-CRATE ?auto_24393 ) ( not ( = ?auto_24427 ?auto_24400 ) ) ( HOIST-AT ?auto_24419 ?auto_24427 ) ( SURFACE-AT ?auto_24393 ?auto_24427 ) ( ON ?auto_24393 ?auto_24414 ) ( CLEAR ?auto_24393 ) ( not ( = ?auto_24392 ?auto_24393 ) ) ( not ( = ?auto_24392 ?auto_24414 ) ) ( not ( = ?auto_24393 ?auto_24414 ) ) ( not ( = ?auto_24397 ?auto_24419 ) ) ( IS-CRATE ?auto_24392 ) ( SURFACE-AT ?auto_24392 ?auto_24427 ) ( ON ?auto_24392 ?auto_24434 ) ( CLEAR ?auto_24392 ) ( not ( = ?auto_24391 ?auto_24392 ) ) ( not ( = ?auto_24391 ?auto_24434 ) ) ( not ( = ?auto_24392 ?auto_24434 ) ) ( IS-CRATE ?auto_24391 ) ( not ( = ?auto_24408 ?auto_24400 ) ) ( HOIST-AT ?auto_24411 ?auto_24408 ) ( AVAILABLE ?auto_24411 ) ( SURFACE-AT ?auto_24391 ?auto_24408 ) ( ON ?auto_24391 ?auto_24432 ) ( CLEAR ?auto_24391 ) ( not ( = ?auto_24390 ?auto_24391 ) ) ( not ( = ?auto_24390 ?auto_24432 ) ) ( not ( = ?auto_24391 ?auto_24432 ) ) ( not ( = ?auto_24397 ?auto_24411 ) ) ( IS-CRATE ?auto_24390 ) ( not ( = ?auto_24405 ?auto_24400 ) ) ( HOIST-AT ?auto_24429 ?auto_24405 ) ( AVAILABLE ?auto_24429 ) ( SURFACE-AT ?auto_24390 ?auto_24405 ) ( ON ?auto_24390 ?auto_24422 ) ( CLEAR ?auto_24390 ) ( not ( = ?auto_24389 ?auto_24390 ) ) ( not ( = ?auto_24389 ?auto_24422 ) ) ( not ( = ?auto_24390 ?auto_24422 ) ) ( not ( = ?auto_24397 ?auto_24429 ) ) ( IS-CRATE ?auto_24389 ) ( not ( = ?auto_24404 ?auto_24400 ) ) ( HOIST-AT ?auto_24415 ?auto_24404 ) ( AVAILABLE ?auto_24415 ) ( SURFACE-AT ?auto_24389 ?auto_24404 ) ( ON ?auto_24389 ?auto_24413 ) ( CLEAR ?auto_24389 ) ( not ( = ?auto_24388 ?auto_24389 ) ) ( not ( = ?auto_24388 ?auto_24413 ) ) ( not ( = ?auto_24389 ?auto_24413 ) ) ( not ( = ?auto_24397 ?auto_24415 ) ) ( IS-CRATE ?auto_24388 ) ( not ( = ?auto_24407 ?auto_24400 ) ) ( HOIST-AT ?auto_24425 ?auto_24407 ) ( AVAILABLE ?auto_24425 ) ( SURFACE-AT ?auto_24388 ?auto_24407 ) ( ON ?auto_24388 ?auto_24426 ) ( CLEAR ?auto_24388 ) ( not ( = ?auto_24387 ?auto_24388 ) ) ( not ( = ?auto_24387 ?auto_24426 ) ) ( not ( = ?auto_24388 ?auto_24426 ) ) ( not ( = ?auto_24397 ?auto_24425 ) ) ( IS-CRATE ?auto_24387 ) ( SURFACE-AT ?auto_24387 ?auto_24435 ) ( ON ?auto_24387 ?auto_24406 ) ( CLEAR ?auto_24387 ) ( not ( = ?auto_24386 ?auto_24387 ) ) ( not ( = ?auto_24386 ?auto_24406 ) ) ( not ( = ?auto_24387 ?auto_24406 ) ) ( IS-CRATE ?auto_24386 ) ( AVAILABLE ?auto_24419 ) ( SURFACE-AT ?auto_24386 ?auto_24427 ) ( ON ?auto_24386 ?auto_24423 ) ( CLEAR ?auto_24386 ) ( not ( = ?auto_24385 ?auto_24386 ) ) ( not ( = ?auto_24385 ?auto_24423 ) ) ( not ( = ?auto_24386 ?auto_24423 ) ) ( IS-CRATE ?auto_24385 ) ( not ( = ?auto_24436 ?auto_24400 ) ) ( HOIST-AT ?auto_24409 ?auto_24436 ) ( AVAILABLE ?auto_24409 ) ( SURFACE-AT ?auto_24385 ?auto_24436 ) ( ON ?auto_24385 ?auto_24431 ) ( CLEAR ?auto_24385 ) ( not ( = ?auto_24384 ?auto_24385 ) ) ( not ( = ?auto_24384 ?auto_24431 ) ) ( not ( = ?auto_24385 ?auto_24431 ) ) ( not ( = ?auto_24397 ?auto_24409 ) ) ( IS-CRATE ?auto_24384 ) ( not ( = ?auto_24420 ?auto_24400 ) ) ( HOIST-AT ?auto_24417 ?auto_24420 ) ( AVAILABLE ?auto_24417 ) ( SURFACE-AT ?auto_24384 ?auto_24420 ) ( ON ?auto_24384 ?auto_24418 ) ( CLEAR ?auto_24384 ) ( not ( = ?auto_24383 ?auto_24384 ) ) ( not ( = ?auto_24383 ?auto_24418 ) ) ( not ( = ?auto_24384 ?auto_24418 ) ) ( not ( = ?auto_24397 ?auto_24417 ) ) ( IS-CRATE ?auto_24383 ) ( AVAILABLE ?auto_24428 ) ( SURFACE-AT ?auto_24383 ?auto_24435 ) ( ON ?auto_24383 ?auto_24433 ) ( CLEAR ?auto_24383 ) ( not ( = ?auto_24382 ?auto_24383 ) ) ( not ( = ?auto_24382 ?auto_24433 ) ) ( not ( = ?auto_24383 ?auto_24433 ) ) ( SURFACE-AT ?auto_24381 ?auto_24400 ) ( CLEAR ?auto_24381 ) ( IS-CRATE ?auto_24382 ) ( AVAILABLE ?auto_24397 ) ( not ( = ?auto_24403 ?auto_24400 ) ) ( HOIST-AT ?auto_24424 ?auto_24403 ) ( AVAILABLE ?auto_24424 ) ( SURFACE-AT ?auto_24382 ?auto_24403 ) ( ON ?auto_24382 ?auto_24430 ) ( CLEAR ?auto_24382 ) ( TRUCK-AT ?auto_24398 ?auto_24400 ) ( not ( = ?auto_24381 ?auto_24382 ) ) ( not ( = ?auto_24381 ?auto_24430 ) ) ( not ( = ?auto_24382 ?auto_24430 ) ) ( not ( = ?auto_24397 ?auto_24424 ) ) ( not ( = ?auto_24381 ?auto_24383 ) ) ( not ( = ?auto_24381 ?auto_24433 ) ) ( not ( = ?auto_24383 ?auto_24430 ) ) ( not ( = ?auto_24435 ?auto_24403 ) ) ( not ( = ?auto_24428 ?auto_24424 ) ) ( not ( = ?auto_24433 ?auto_24430 ) ) ( not ( = ?auto_24381 ?auto_24384 ) ) ( not ( = ?auto_24381 ?auto_24418 ) ) ( not ( = ?auto_24382 ?auto_24384 ) ) ( not ( = ?auto_24382 ?auto_24418 ) ) ( not ( = ?auto_24384 ?auto_24433 ) ) ( not ( = ?auto_24384 ?auto_24430 ) ) ( not ( = ?auto_24420 ?auto_24435 ) ) ( not ( = ?auto_24420 ?auto_24403 ) ) ( not ( = ?auto_24417 ?auto_24428 ) ) ( not ( = ?auto_24417 ?auto_24424 ) ) ( not ( = ?auto_24418 ?auto_24433 ) ) ( not ( = ?auto_24418 ?auto_24430 ) ) ( not ( = ?auto_24381 ?auto_24385 ) ) ( not ( = ?auto_24381 ?auto_24431 ) ) ( not ( = ?auto_24382 ?auto_24385 ) ) ( not ( = ?auto_24382 ?auto_24431 ) ) ( not ( = ?auto_24383 ?auto_24385 ) ) ( not ( = ?auto_24383 ?auto_24431 ) ) ( not ( = ?auto_24385 ?auto_24418 ) ) ( not ( = ?auto_24385 ?auto_24433 ) ) ( not ( = ?auto_24385 ?auto_24430 ) ) ( not ( = ?auto_24436 ?auto_24420 ) ) ( not ( = ?auto_24436 ?auto_24435 ) ) ( not ( = ?auto_24436 ?auto_24403 ) ) ( not ( = ?auto_24409 ?auto_24417 ) ) ( not ( = ?auto_24409 ?auto_24428 ) ) ( not ( = ?auto_24409 ?auto_24424 ) ) ( not ( = ?auto_24431 ?auto_24418 ) ) ( not ( = ?auto_24431 ?auto_24433 ) ) ( not ( = ?auto_24431 ?auto_24430 ) ) ( not ( = ?auto_24381 ?auto_24386 ) ) ( not ( = ?auto_24381 ?auto_24423 ) ) ( not ( = ?auto_24382 ?auto_24386 ) ) ( not ( = ?auto_24382 ?auto_24423 ) ) ( not ( = ?auto_24383 ?auto_24386 ) ) ( not ( = ?auto_24383 ?auto_24423 ) ) ( not ( = ?auto_24384 ?auto_24386 ) ) ( not ( = ?auto_24384 ?auto_24423 ) ) ( not ( = ?auto_24386 ?auto_24431 ) ) ( not ( = ?auto_24386 ?auto_24418 ) ) ( not ( = ?auto_24386 ?auto_24433 ) ) ( not ( = ?auto_24386 ?auto_24430 ) ) ( not ( = ?auto_24427 ?auto_24436 ) ) ( not ( = ?auto_24427 ?auto_24420 ) ) ( not ( = ?auto_24427 ?auto_24435 ) ) ( not ( = ?auto_24427 ?auto_24403 ) ) ( not ( = ?auto_24419 ?auto_24409 ) ) ( not ( = ?auto_24419 ?auto_24417 ) ) ( not ( = ?auto_24419 ?auto_24428 ) ) ( not ( = ?auto_24419 ?auto_24424 ) ) ( not ( = ?auto_24423 ?auto_24431 ) ) ( not ( = ?auto_24423 ?auto_24418 ) ) ( not ( = ?auto_24423 ?auto_24433 ) ) ( not ( = ?auto_24423 ?auto_24430 ) ) ( not ( = ?auto_24381 ?auto_24387 ) ) ( not ( = ?auto_24381 ?auto_24406 ) ) ( not ( = ?auto_24382 ?auto_24387 ) ) ( not ( = ?auto_24382 ?auto_24406 ) ) ( not ( = ?auto_24383 ?auto_24387 ) ) ( not ( = ?auto_24383 ?auto_24406 ) ) ( not ( = ?auto_24384 ?auto_24387 ) ) ( not ( = ?auto_24384 ?auto_24406 ) ) ( not ( = ?auto_24385 ?auto_24387 ) ) ( not ( = ?auto_24385 ?auto_24406 ) ) ( not ( = ?auto_24387 ?auto_24423 ) ) ( not ( = ?auto_24387 ?auto_24431 ) ) ( not ( = ?auto_24387 ?auto_24418 ) ) ( not ( = ?auto_24387 ?auto_24433 ) ) ( not ( = ?auto_24387 ?auto_24430 ) ) ( not ( = ?auto_24406 ?auto_24423 ) ) ( not ( = ?auto_24406 ?auto_24431 ) ) ( not ( = ?auto_24406 ?auto_24418 ) ) ( not ( = ?auto_24406 ?auto_24433 ) ) ( not ( = ?auto_24406 ?auto_24430 ) ) ( not ( = ?auto_24381 ?auto_24388 ) ) ( not ( = ?auto_24381 ?auto_24426 ) ) ( not ( = ?auto_24382 ?auto_24388 ) ) ( not ( = ?auto_24382 ?auto_24426 ) ) ( not ( = ?auto_24383 ?auto_24388 ) ) ( not ( = ?auto_24383 ?auto_24426 ) ) ( not ( = ?auto_24384 ?auto_24388 ) ) ( not ( = ?auto_24384 ?auto_24426 ) ) ( not ( = ?auto_24385 ?auto_24388 ) ) ( not ( = ?auto_24385 ?auto_24426 ) ) ( not ( = ?auto_24386 ?auto_24388 ) ) ( not ( = ?auto_24386 ?auto_24426 ) ) ( not ( = ?auto_24388 ?auto_24406 ) ) ( not ( = ?auto_24388 ?auto_24423 ) ) ( not ( = ?auto_24388 ?auto_24431 ) ) ( not ( = ?auto_24388 ?auto_24418 ) ) ( not ( = ?auto_24388 ?auto_24433 ) ) ( not ( = ?auto_24388 ?auto_24430 ) ) ( not ( = ?auto_24407 ?auto_24435 ) ) ( not ( = ?auto_24407 ?auto_24427 ) ) ( not ( = ?auto_24407 ?auto_24436 ) ) ( not ( = ?auto_24407 ?auto_24420 ) ) ( not ( = ?auto_24407 ?auto_24403 ) ) ( not ( = ?auto_24425 ?auto_24428 ) ) ( not ( = ?auto_24425 ?auto_24419 ) ) ( not ( = ?auto_24425 ?auto_24409 ) ) ( not ( = ?auto_24425 ?auto_24417 ) ) ( not ( = ?auto_24425 ?auto_24424 ) ) ( not ( = ?auto_24426 ?auto_24406 ) ) ( not ( = ?auto_24426 ?auto_24423 ) ) ( not ( = ?auto_24426 ?auto_24431 ) ) ( not ( = ?auto_24426 ?auto_24418 ) ) ( not ( = ?auto_24426 ?auto_24433 ) ) ( not ( = ?auto_24426 ?auto_24430 ) ) ( not ( = ?auto_24381 ?auto_24389 ) ) ( not ( = ?auto_24381 ?auto_24413 ) ) ( not ( = ?auto_24382 ?auto_24389 ) ) ( not ( = ?auto_24382 ?auto_24413 ) ) ( not ( = ?auto_24383 ?auto_24389 ) ) ( not ( = ?auto_24383 ?auto_24413 ) ) ( not ( = ?auto_24384 ?auto_24389 ) ) ( not ( = ?auto_24384 ?auto_24413 ) ) ( not ( = ?auto_24385 ?auto_24389 ) ) ( not ( = ?auto_24385 ?auto_24413 ) ) ( not ( = ?auto_24386 ?auto_24389 ) ) ( not ( = ?auto_24386 ?auto_24413 ) ) ( not ( = ?auto_24387 ?auto_24389 ) ) ( not ( = ?auto_24387 ?auto_24413 ) ) ( not ( = ?auto_24389 ?auto_24426 ) ) ( not ( = ?auto_24389 ?auto_24406 ) ) ( not ( = ?auto_24389 ?auto_24423 ) ) ( not ( = ?auto_24389 ?auto_24431 ) ) ( not ( = ?auto_24389 ?auto_24418 ) ) ( not ( = ?auto_24389 ?auto_24433 ) ) ( not ( = ?auto_24389 ?auto_24430 ) ) ( not ( = ?auto_24404 ?auto_24407 ) ) ( not ( = ?auto_24404 ?auto_24435 ) ) ( not ( = ?auto_24404 ?auto_24427 ) ) ( not ( = ?auto_24404 ?auto_24436 ) ) ( not ( = ?auto_24404 ?auto_24420 ) ) ( not ( = ?auto_24404 ?auto_24403 ) ) ( not ( = ?auto_24415 ?auto_24425 ) ) ( not ( = ?auto_24415 ?auto_24428 ) ) ( not ( = ?auto_24415 ?auto_24419 ) ) ( not ( = ?auto_24415 ?auto_24409 ) ) ( not ( = ?auto_24415 ?auto_24417 ) ) ( not ( = ?auto_24415 ?auto_24424 ) ) ( not ( = ?auto_24413 ?auto_24426 ) ) ( not ( = ?auto_24413 ?auto_24406 ) ) ( not ( = ?auto_24413 ?auto_24423 ) ) ( not ( = ?auto_24413 ?auto_24431 ) ) ( not ( = ?auto_24413 ?auto_24418 ) ) ( not ( = ?auto_24413 ?auto_24433 ) ) ( not ( = ?auto_24413 ?auto_24430 ) ) ( not ( = ?auto_24381 ?auto_24390 ) ) ( not ( = ?auto_24381 ?auto_24422 ) ) ( not ( = ?auto_24382 ?auto_24390 ) ) ( not ( = ?auto_24382 ?auto_24422 ) ) ( not ( = ?auto_24383 ?auto_24390 ) ) ( not ( = ?auto_24383 ?auto_24422 ) ) ( not ( = ?auto_24384 ?auto_24390 ) ) ( not ( = ?auto_24384 ?auto_24422 ) ) ( not ( = ?auto_24385 ?auto_24390 ) ) ( not ( = ?auto_24385 ?auto_24422 ) ) ( not ( = ?auto_24386 ?auto_24390 ) ) ( not ( = ?auto_24386 ?auto_24422 ) ) ( not ( = ?auto_24387 ?auto_24390 ) ) ( not ( = ?auto_24387 ?auto_24422 ) ) ( not ( = ?auto_24388 ?auto_24390 ) ) ( not ( = ?auto_24388 ?auto_24422 ) ) ( not ( = ?auto_24390 ?auto_24413 ) ) ( not ( = ?auto_24390 ?auto_24426 ) ) ( not ( = ?auto_24390 ?auto_24406 ) ) ( not ( = ?auto_24390 ?auto_24423 ) ) ( not ( = ?auto_24390 ?auto_24431 ) ) ( not ( = ?auto_24390 ?auto_24418 ) ) ( not ( = ?auto_24390 ?auto_24433 ) ) ( not ( = ?auto_24390 ?auto_24430 ) ) ( not ( = ?auto_24405 ?auto_24404 ) ) ( not ( = ?auto_24405 ?auto_24407 ) ) ( not ( = ?auto_24405 ?auto_24435 ) ) ( not ( = ?auto_24405 ?auto_24427 ) ) ( not ( = ?auto_24405 ?auto_24436 ) ) ( not ( = ?auto_24405 ?auto_24420 ) ) ( not ( = ?auto_24405 ?auto_24403 ) ) ( not ( = ?auto_24429 ?auto_24415 ) ) ( not ( = ?auto_24429 ?auto_24425 ) ) ( not ( = ?auto_24429 ?auto_24428 ) ) ( not ( = ?auto_24429 ?auto_24419 ) ) ( not ( = ?auto_24429 ?auto_24409 ) ) ( not ( = ?auto_24429 ?auto_24417 ) ) ( not ( = ?auto_24429 ?auto_24424 ) ) ( not ( = ?auto_24422 ?auto_24413 ) ) ( not ( = ?auto_24422 ?auto_24426 ) ) ( not ( = ?auto_24422 ?auto_24406 ) ) ( not ( = ?auto_24422 ?auto_24423 ) ) ( not ( = ?auto_24422 ?auto_24431 ) ) ( not ( = ?auto_24422 ?auto_24418 ) ) ( not ( = ?auto_24422 ?auto_24433 ) ) ( not ( = ?auto_24422 ?auto_24430 ) ) ( not ( = ?auto_24381 ?auto_24391 ) ) ( not ( = ?auto_24381 ?auto_24432 ) ) ( not ( = ?auto_24382 ?auto_24391 ) ) ( not ( = ?auto_24382 ?auto_24432 ) ) ( not ( = ?auto_24383 ?auto_24391 ) ) ( not ( = ?auto_24383 ?auto_24432 ) ) ( not ( = ?auto_24384 ?auto_24391 ) ) ( not ( = ?auto_24384 ?auto_24432 ) ) ( not ( = ?auto_24385 ?auto_24391 ) ) ( not ( = ?auto_24385 ?auto_24432 ) ) ( not ( = ?auto_24386 ?auto_24391 ) ) ( not ( = ?auto_24386 ?auto_24432 ) ) ( not ( = ?auto_24387 ?auto_24391 ) ) ( not ( = ?auto_24387 ?auto_24432 ) ) ( not ( = ?auto_24388 ?auto_24391 ) ) ( not ( = ?auto_24388 ?auto_24432 ) ) ( not ( = ?auto_24389 ?auto_24391 ) ) ( not ( = ?auto_24389 ?auto_24432 ) ) ( not ( = ?auto_24391 ?auto_24422 ) ) ( not ( = ?auto_24391 ?auto_24413 ) ) ( not ( = ?auto_24391 ?auto_24426 ) ) ( not ( = ?auto_24391 ?auto_24406 ) ) ( not ( = ?auto_24391 ?auto_24423 ) ) ( not ( = ?auto_24391 ?auto_24431 ) ) ( not ( = ?auto_24391 ?auto_24418 ) ) ( not ( = ?auto_24391 ?auto_24433 ) ) ( not ( = ?auto_24391 ?auto_24430 ) ) ( not ( = ?auto_24408 ?auto_24405 ) ) ( not ( = ?auto_24408 ?auto_24404 ) ) ( not ( = ?auto_24408 ?auto_24407 ) ) ( not ( = ?auto_24408 ?auto_24435 ) ) ( not ( = ?auto_24408 ?auto_24427 ) ) ( not ( = ?auto_24408 ?auto_24436 ) ) ( not ( = ?auto_24408 ?auto_24420 ) ) ( not ( = ?auto_24408 ?auto_24403 ) ) ( not ( = ?auto_24411 ?auto_24429 ) ) ( not ( = ?auto_24411 ?auto_24415 ) ) ( not ( = ?auto_24411 ?auto_24425 ) ) ( not ( = ?auto_24411 ?auto_24428 ) ) ( not ( = ?auto_24411 ?auto_24419 ) ) ( not ( = ?auto_24411 ?auto_24409 ) ) ( not ( = ?auto_24411 ?auto_24417 ) ) ( not ( = ?auto_24411 ?auto_24424 ) ) ( not ( = ?auto_24432 ?auto_24422 ) ) ( not ( = ?auto_24432 ?auto_24413 ) ) ( not ( = ?auto_24432 ?auto_24426 ) ) ( not ( = ?auto_24432 ?auto_24406 ) ) ( not ( = ?auto_24432 ?auto_24423 ) ) ( not ( = ?auto_24432 ?auto_24431 ) ) ( not ( = ?auto_24432 ?auto_24418 ) ) ( not ( = ?auto_24432 ?auto_24433 ) ) ( not ( = ?auto_24432 ?auto_24430 ) ) ( not ( = ?auto_24381 ?auto_24392 ) ) ( not ( = ?auto_24381 ?auto_24434 ) ) ( not ( = ?auto_24382 ?auto_24392 ) ) ( not ( = ?auto_24382 ?auto_24434 ) ) ( not ( = ?auto_24383 ?auto_24392 ) ) ( not ( = ?auto_24383 ?auto_24434 ) ) ( not ( = ?auto_24384 ?auto_24392 ) ) ( not ( = ?auto_24384 ?auto_24434 ) ) ( not ( = ?auto_24385 ?auto_24392 ) ) ( not ( = ?auto_24385 ?auto_24434 ) ) ( not ( = ?auto_24386 ?auto_24392 ) ) ( not ( = ?auto_24386 ?auto_24434 ) ) ( not ( = ?auto_24387 ?auto_24392 ) ) ( not ( = ?auto_24387 ?auto_24434 ) ) ( not ( = ?auto_24388 ?auto_24392 ) ) ( not ( = ?auto_24388 ?auto_24434 ) ) ( not ( = ?auto_24389 ?auto_24392 ) ) ( not ( = ?auto_24389 ?auto_24434 ) ) ( not ( = ?auto_24390 ?auto_24392 ) ) ( not ( = ?auto_24390 ?auto_24434 ) ) ( not ( = ?auto_24392 ?auto_24432 ) ) ( not ( = ?auto_24392 ?auto_24422 ) ) ( not ( = ?auto_24392 ?auto_24413 ) ) ( not ( = ?auto_24392 ?auto_24426 ) ) ( not ( = ?auto_24392 ?auto_24406 ) ) ( not ( = ?auto_24392 ?auto_24423 ) ) ( not ( = ?auto_24392 ?auto_24431 ) ) ( not ( = ?auto_24392 ?auto_24418 ) ) ( not ( = ?auto_24392 ?auto_24433 ) ) ( not ( = ?auto_24392 ?auto_24430 ) ) ( not ( = ?auto_24434 ?auto_24432 ) ) ( not ( = ?auto_24434 ?auto_24422 ) ) ( not ( = ?auto_24434 ?auto_24413 ) ) ( not ( = ?auto_24434 ?auto_24426 ) ) ( not ( = ?auto_24434 ?auto_24406 ) ) ( not ( = ?auto_24434 ?auto_24423 ) ) ( not ( = ?auto_24434 ?auto_24431 ) ) ( not ( = ?auto_24434 ?auto_24418 ) ) ( not ( = ?auto_24434 ?auto_24433 ) ) ( not ( = ?auto_24434 ?auto_24430 ) ) ( not ( = ?auto_24381 ?auto_24393 ) ) ( not ( = ?auto_24381 ?auto_24414 ) ) ( not ( = ?auto_24382 ?auto_24393 ) ) ( not ( = ?auto_24382 ?auto_24414 ) ) ( not ( = ?auto_24383 ?auto_24393 ) ) ( not ( = ?auto_24383 ?auto_24414 ) ) ( not ( = ?auto_24384 ?auto_24393 ) ) ( not ( = ?auto_24384 ?auto_24414 ) ) ( not ( = ?auto_24385 ?auto_24393 ) ) ( not ( = ?auto_24385 ?auto_24414 ) ) ( not ( = ?auto_24386 ?auto_24393 ) ) ( not ( = ?auto_24386 ?auto_24414 ) ) ( not ( = ?auto_24387 ?auto_24393 ) ) ( not ( = ?auto_24387 ?auto_24414 ) ) ( not ( = ?auto_24388 ?auto_24393 ) ) ( not ( = ?auto_24388 ?auto_24414 ) ) ( not ( = ?auto_24389 ?auto_24393 ) ) ( not ( = ?auto_24389 ?auto_24414 ) ) ( not ( = ?auto_24390 ?auto_24393 ) ) ( not ( = ?auto_24390 ?auto_24414 ) ) ( not ( = ?auto_24391 ?auto_24393 ) ) ( not ( = ?auto_24391 ?auto_24414 ) ) ( not ( = ?auto_24393 ?auto_24434 ) ) ( not ( = ?auto_24393 ?auto_24432 ) ) ( not ( = ?auto_24393 ?auto_24422 ) ) ( not ( = ?auto_24393 ?auto_24413 ) ) ( not ( = ?auto_24393 ?auto_24426 ) ) ( not ( = ?auto_24393 ?auto_24406 ) ) ( not ( = ?auto_24393 ?auto_24423 ) ) ( not ( = ?auto_24393 ?auto_24431 ) ) ( not ( = ?auto_24393 ?auto_24418 ) ) ( not ( = ?auto_24393 ?auto_24433 ) ) ( not ( = ?auto_24393 ?auto_24430 ) ) ( not ( = ?auto_24414 ?auto_24434 ) ) ( not ( = ?auto_24414 ?auto_24432 ) ) ( not ( = ?auto_24414 ?auto_24422 ) ) ( not ( = ?auto_24414 ?auto_24413 ) ) ( not ( = ?auto_24414 ?auto_24426 ) ) ( not ( = ?auto_24414 ?auto_24406 ) ) ( not ( = ?auto_24414 ?auto_24423 ) ) ( not ( = ?auto_24414 ?auto_24431 ) ) ( not ( = ?auto_24414 ?auto_24418 ) ) ( not ( = ?auto_24414 ?auto_24433 ) ) ( not ( = ?auto_24414 ?auto_24430 ) ) ( not ( = ?auto_24381 ?auto_24395 ) ) ( not ( = ?auto_24381 ?auto_24421 ) ) ( not ( = ?auto_24382 ?auto_24395 ) ) ( not ( = ?auto_24382 ?auto_24421 ) ) ( not ( = ?auto_24383 ?auto_24395 ) ) ( not ( = ?auto_24383 ?auto_24421 ) ) ( not ( = ?auto_24384 ?auto_24395 ) ) ( not ( = ?auto_24384 ?auto_24421 ) ) ( not ( = ?auto_24385 ?auto_24395 ) ) ( not ( = ?auto_24385 ?auto_24421 ) ) ( not ( = ?auto_24386 ?auto_24395 ) ) ( not ( = ?auto_24386 ?auto_24421 ) ) ( not ( = ?auto_24387 ?auto_24395 ) ) ( not ( = ?auto_24387 ?auto_24421 ) ) ( not ( = ?auto_24388 ?auto_24395 ) ) ( not ( = ?auto_24388 ?auto_24421 ) ) ( not ( = ?auto_24389 ?auto_24395 ) ) ( not ( = ?auto_24389 ?auto_24421 ) ) ( not ( = ?auto_24390 ?auto_24395 ) ) ( not ( = ?auto_24390 ?auto_24421 ) ) ( not ( = ?auto_24391 ?auto_24395 ) ) ( not ( = ?auto_24391 ?auto_24421 ) ) ( not ( = ?auto_24392 ?auto_24395 ) ) ( not ( = ?auto_24392 ?auto_24421 ) ) ( not ( = ?auto_24395 ?auto_24414 ) ) ( not ( = ?auto_24395 ?auto_24434 ) ) ( not ( = ?auto_24395 ?auto_24432 ) ) ( not ( = ?auto_24395 ?auto_24422 ) ) ( not ( = ?auto_24395 ?auto_24413 ) ) ( not ( = ?auto_24395 ?auto_24426 ) ) ( not ( = ?auto_24395 ?auto_24406 ) ) ( not ( = ?auto_24395 ?auto_24423 ) ) ( not ( = ?auto_24395 ?auto_24431 ) ) ( not ( = ?auto_24395 ?auto_24418 ) ) ( not ( = ?auto_24395 ?auto_24433 ) ) ( not ( = ?auto_24395 ?auto_24430 ) ) ( not ( = ?auto_24410 ?auto_24427 ) ) ( not ( = ?auto_24410 ?auto_24408 ) ) ( not ( = ?auto_24410 ?auto_24405 ) ) ( not ( = ?auto_24410 ?auto_24404 ) ) ( not ( = ?auto_24410 ?auto_24407 ) ) ( not ( = ?auto_24410 ?auto_24435 ) ) ( not ( = ?auto_24410 ?auto_24436 ) ) ( not ( = ?auto_24410 ?auto_24420 ) ) ( not ( = ?auto_24410 ?auto_24403 ) ) ( not ( = ?auto_24416 ?auto_24419 ) ) ( not ( = ?auto_24416 ?auto_24411 ) ) ( not ( = ?auto_24416 ?auto_24429 ) ) ( not ( = ?auto_24416 ?auto_24415 ) ) ( not ( = ?auto_24416 ?auto_24425 ) ) ( not ( = ?auto_24416 ?auto_24428 ) ) ( not ( = ?auto_24416 ?auto_24409 ) ) ( not ( = ?auto_24416 ?auto_24417 ) ) ( not ( = ?auto_24416 ?auto_24424 ) ) ( not ( = ?auto_24421 ?auto_24414 ) ) ( not ( = ?auto_24421 ?auto_24434 ) ) ( not ( = ?auto_24421 ?auto_24432 ) ) ( not ( = ?auto_24421 ?auto_24422 ) ) ( not ( = ?auto_24421 ?auto_24413 ) ) ( not ( = ?auto_24421 ?auto_24426 ) ) ( not ( = ?auto_24421 ?auto_24406 ) ) ( not ( = ?auto_24421 ?auto_24423 ) ) ( not ( = ?auto_24421 ?auto_24431 ) ) ( not ( = ?auto_24421 ?auto_24418 ) ) ( not ( = ?auto_24421 ?auto_24433 ) ) ( not ( = ?auto_24421 ?auto_24430 ) ) ( not ( = ?auto_24381 ?auto_24394 ) ) ( not ( = ?auto_24381 ?auto_24412 ) ) ( not ( = ?auto_24382 ?auto_24394 ) ) ( not ( = ?auto_24382 ?auto_24412 ) ) ( not ( = ?auto_24383 ?auto_24394 ) ) ( not ( = ?auto_24383 ?auto_24412 ) ) ( not ( = ?auto_24384 ?auto_24394 ) ) ( not ( = ?auto_24384 ?auto_24412 ) ) ( not ( = ?auto_24385 ?auto_24394 ) ) ( not ( = ?auto_24385 ?auto_24412 ) ) ( not ( = ?auto_24386 ?auto_24394 ) ) ( not ( = ?auto_24386 ?auto_24412 ) ) ( not ( = ?auto_24387 ?auto_24394 ) ) ( not ( = ?auto_24387 ?auto_24412 ) ) ( not ( = ?auto_24388 ?auto_24394 ) ) ( not ( = ?auto_24388 ?auto_24412 ) ) ( not ( = ?auto_24389 ?auto_24394 ) ) ( not ( = ?auto_24389 ?auto_24412 ) ) ( not ( = ?auto_24390 ?auto_24394 ) ) ( not ( = ?auto_24390 ?auto_24412 ) ) ( not ( = ?auto_24391 ?auto_24394 ) ) ( not ( = ?auto_24391 ?auto_24412 ) ) ( not ( = ?auto_24392 ?auto_24394 ) ) ( not ( = ?auto_24392 ?auto_24412 ) ) ( not ( = ?auto_24393 ?auto_24394 ) ) ( not ( = ?auto_24393 ?auto_24412 ) ) ( not ( = ?auto_24394 ?auto_24421 ) ) ( not ( = ?auto_24394 ?auto_24414 ) ) ( not ( = ?auto_24394 ?auto_24434 ) ) ( not ( = ?auto_24394 ?auto_24432 ) ) ( not ( = ?auto_24394 ?auto_24422 ) ) ( not ( = ?auto_24394 ?auto_24413 ) ) ( not ( = ?auto_24394 ?auto_24426 ) ) ( not ( = ?auto_24394 ?auto_24406 ) ) ( not ( = ?auto_24394 ?auto_24423 ) ) ( not ( = ?auto_24394 ?auto_24431 ) ) ( not ( = ?auto_24394 ?auto_24418 ) ) ( not ( = ?auto_24394 ?auto_24433 ) ) ( not ( = ?auto_24394 ?auto_24430 ) ) ( not ( = ?auto_24412 ?auto_24421 ) ) ( not ( = ?auto_24412 ?auto_24414 ) ) ( not ( = ?auto_24412 ?auto_24434 ) ) ( not ( = ?auto_24412 ?auto_24432 ) ) ( not ( = ?auto_24412 ?auto_24422 ) ) ( not ( = ?auto_24412 ?auto_24413 ) ) ( not ( = ?auto_24412 ?auto_24426 ) ) ( not ( = ?auto_24412 ?auto_24406 ) ) ( not ( = ?auto_24412 ?auto_24423 ) ) ( not ( = ?auto_24412 ?auto_24431 ) ) ( not ( = ?auto_24412 ?auto_24418 ) ) ( not ( = ?auto_24412 ?auto_24433 ) ) ( not ( = ?auto_24412 ?auto_24430 ) ) ( not ( = ?auto_24381 ?auto_24396 ) ) ( not ( = ?auto_24381 ?auto_24402 ) ) ( not ( = ?auto_24382 ?auto_24396 ) ) ( not ( = ?auto_24382 ?auto_24402 ) ) ( not ( = ?auto_24383 ?auto_24396 ) ) ( not ( = ?auto_24383 ?auto_24402 ) ) ( not ( = ?auto_24384 ?auto_24396 ) ) ( not ( = ?auto_24384 ?auto_24402 ) ) ( not ( = ?auto_24385 ?auto_24396 ) ) ( not ( = ?auto_24385 ?auto_24402 ) ) ( not ( = ?auto_24386 ?auto_24396 ) ) ( not ( = ?auto_24386 ?auto_24402 ) ) ( not ( = ?auto_24387 ?auto_24396 ) ) ( not ( = ?auto_24387 ?auto_24402 ) ) ( not ( = ?auto_24388 ?auto_24396 ) ) ( not ( = ?auto_24388 ?auto_24402 ) ) ( not ( = ?auto_24389 ?auto_24396 ) ) ( not ( = ?auto_24389 ?auto_24402 ) ) ( not ( = ?auto_24390 ?auto_24396 ) ) ( not ( = ?auto_24390 ?auto_24402 ) ) ( not ( = ?auto_24391 ?auto_24396 ) ) ( not ( = ?auto_24391 ?auto_24402 ) ) ( not ( = ?auto_24392 ?auto_24396 ) ) ( not ( = ?auto_24392 ?auto_24402 ) ) ( not ( = ?auto_24393 ?auto_24396 ) ) ( not ( = ?auto_24393 ?auto_24402 ) ) ( not ( = ?auto_24395 ?auto_24396 ) ) ( not ( = ?auto_24395 ?auto_24402 ) ) ( not ( = ?auto_24396 ?auto_24412 ) ) ( not ( = ?auto_24396 ?auto_24421 ) ) ( not ( = ?auto_24396 ?auto_24414 ) ) ( not ( = ?auto_24396 ?auto_24434 ) ) ( not ( = ?auto_24396 ?auto_24432 ) ) ( not ( = ?auto_24396 ?auto_24422 ) ) ( not ( = ?auto_24396 ?auto_24413 ) ) ( not ( = ?auto_24396 ?auto_24426 ) ) ( not ( = ?auto_24396 ?auto_24406 ) ) ( not ( = ?auto_24396 ?auto_24423 ) ) ( not ( = ?auto_24396 ?auto_24431 ) ) ( not ( = ?auto_24396 ?auto_24418 ) ) ( not ( = ?auto_24396 ?auto_24433 ) ) ( not ( = ?auto_24396 ?auto_24430 ) ) ( not ( = ?auto_24401 ?auto_24435 ) ) ( not ( = ?auto_24401 ?auto_24410 ) ) ( not ( = ?auto_24401 ?auto_24427 ) ) ( not ( = ?auto_24401 ?auto_24408 ) ) ( not ( = ?auto_24401 ?auto_24405 ) ) ( not ( = ?auto_24401 ?auto_24404 ) ) ( not ( = ?auto_24401 ?auto_24407 ) ) ( not ( = ?auto_24401 ?auto_24436 ) ) ( not ( = ?auto_24401 ?auto_24420 ) ) ( not ( = ?auto_24401 ?auto_24403 ) ) ( not ( = ?auto_24399 ?auto_24428 ) ) ( not ( = ?auto_24399 ?auto_24416 ) ) ( not ( = ?auto_24399 ?auto_24419 ) ) ( not ( = ?auto_24399 ?auto_24411 ) ) ( not ( = ?auto_24399 ?auto_24429 ) ) ( not ( = ?auto_24399 ?auto_24415 ) ) ( not ( = ?auto_24399 ?auto_24425 ) ) ( not ( = ?auto_24399 ?auto_24409 ) ) ( not ( = ?auto_24399 ?auto_24417 ) ) ( not ( = ?auto_24399 ?auto_24424 ) ) ( not ( = ?auto_24402 ?auto_24412 ) ) ( not ( = ?auto_24402 ?auto_24421 ) ) ( not ( = ?auto_24402 ?auto_24414 ) ) ( not ( = ?auto_24402 ?auto_24434 ) ) ( not ( = ?auto_24402 ?auto_24432 ) ) ( not ( = ?auto_24402 ?auto_24422 ) ) ( not ( = ?auto_24402 ?auto_24413 ) ) ( not ( = ?auto_24402 ?auto_24426 ) ) ( not ( = ?auto_24402 ?auto_24406 ) ) ( not ( = ?auto_24402 ?auto_24423 ) ) ( not ( = ?auto_24402 ?auto_24431 ) ) ( not ( = ?auto_24402 ?auto_24418 ) ) ( not ( = ?auto_24402 ?auto_24433 ) ) ( not ( = ?auto_24402 ?auto_24430 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_24381 ?auto_24382 ?auto_24383 ?auto_24384 ?auto_24385 ?auto_24386 ?auto_24387 ?auto_24388 ?auto_24389 ?auto_24390 ?auto_24391 ?auto_24392 ?auto_24393 ?auto_24395 ?auto_24394 )
      ( MAKE-1CRATE ?auto_24394 ?auto_24396 )
      ( MAKE-15CRATE-VERIFY ?auto_24381 ?auto_24382 ?auto_24383 ?auto_24384 ?auto_24385 ?auto_24386 ?auto_24387 ?auto_24388 ?auto_24389 ?auto_24390 ?auto_24391 ?auto_24392 ?auto_24393 ?auto_24395 ?auto_24394 ?auto_24396 ) )
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
      ?auto_24471 - SURFACE
      ?auto_24472 - SURFACE
      ?auto_24473 - SURFACE
      ?auto_24474 - SURFACE
      ?auto_24475 - SURFACE
      ?auto_24476 - SURFACE
      ?auto_24478 - SURFACE
      ?auto_24477 - SURFACE
      ?auto_24480 - SURFACE
      ?auto_24479 - SURFACE
    )
    :vars
    (
      ?auto_24484 - HOIST
      ?auto_24486 - PLACE
      ?auto_24485 - PLACE
      ?auto_24482 - HOIST
      ?auto_24481 - SURFACE
      ?auto_24492 - PLACE
      ?auto_24493 - HOIST
      ?auto_24517 - SURFACE
      ?auto_24496 - PLACE
      ?auto_24498 - HOIST
      ?auto_24513 - SURFACE
      ?auto_24520 - PLACE
      ?auto_24497 - HOIST
      ?auto_24523 - SURFACE
      ?auto_24504 - PLACE
      ?auto_24509 - HOIST
      ?auto_24506 - SURFACE
      ?auto_24500 - SURFACE
      ?auto_24521 - PLACE
      ?auto_24512 - HOIST
      ?auto_24503 - SURFACE
      ?auto_24508 - PLACE
      ?auto_24514 - HOIST
      ?auto_24519 - SURFACE
      ?auto_24511 - PLACE
      ?auto_24518 - HOIST
      ?auto_24522 - SURFACE
      ?auto_24501 - PLACE
      ?auto_24507 - HOIST
      ?auto_24499 - SURFACE
      ?auto_24495 - SURFACE
      ?auto_24502 - SURFACE
      ?auto_24491 - PLACE
      ?auto_24510 - HOIST
      ?auto_24515 - SURFACE
      ?auto_24516 - PLACE
      ?auto_24505 - HOIST
      ?auto_24494 - SURFACE
      ?auto_24487 - SURFACE
      ?auto_24490 - PLACE
      ?auto_24488 - HOIST
      ?auto_24489 - SURFACE
      ?auto_24483 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24484 ?auto_24486 ) ( IS-CRATE ?auto_24479 ) ( not ( = ?auto_24485 ?auto_24486 ) ) ( HOIST-AT ?auto_24482 ?auto_24485 ) ( AVAILABLE ?auto_24482 ) ( SURFACE-AT ?auto_24479 ?auto_24485 ) ( ON ?auto_24479 ?auto_24481 ) ( CLEAR ?auto_24479 ) ( not ( = ?auto_24480 ?auto_24479 ) ) ( not ( = ?auto_24480 ?auto_24481 ) ) ( not ( = ?auto_24479 ?auto_24481 ) ) ( not ( = ?auto_24484 ?auto_24482 ) ) ( IS-CRATE ?auto_24480 ) ( not ( = ?auto_24492 ?auto_24486 ) ) ( HOIST-AT ?auto_24493 ?auto_24492 ) ( AVAILABLE ?auto_24493 ) ( SURFACE-AT ?auto_24480 ?auto_24492 ) ( ON ?auto_24480 ?auto_24517 ) ( CLEAR ?auto_24480 ) ( not ( = ?auto_24477 ?auto_24480 ) ) ( not ( = ?auto_24477 ?auto_24517 ) ) ( not ( = ?auto_24480 ?auto_24517 ) ) ( not ( = ?auto_24484 ?auto_24493 ) ) ( IS-CRATE ?auto_24477 ) ( not ( = ?auto_24496 ?auto_24486 ) ) ( HOIST-AT ?auto_24498 ?auto_24496 ) ( SURFACE-AT ?auto_24477 ?auto_24496 ) ( ON ?auto_24477 ?auto_24513 ) ( CLEAR ?auto_24477 ) ( not ( = ?auto_24478 ?auto_24477 ) ) ( not ( = ?auto_24478 ?auto_24513 ) ) ( not ( = ?auto_24477 ?auto_24513 ) ) ( not ( = ?auto_24484 ?auto_24498 ) ) ( IS-CRATE ?auto_24478 ) ( not ( = ?auto_24520 ?auto_24486 ) ) ( HOIST-AT ?auto_24497 ?auto_24520 ) ( AVAILABLE ?auto_24497 ) ( SURFACE-AT ?auto_24478 ?auto_24520 ) ( ON ?auto_24478 ?auto_24523 ) ( CLEAR ?auto_24478 ) ( not ( = ?auto_24476 ?auto_24478 ) ) ( not ( = ?auto_24476 ?auto_24523 ) ) ( not ( = ?auto_24478 ?auto_24523 ) ) ( not ( = ?auto_24484 ?auto_24497 ) ) ( IS-CRATE ?auto_24476 ) ( not ( = ?auto_24504 ?auto_24486 ) ) ( HOIST-AT ?auto_24509 ?auto_24504 ) ( SURFACE-AT ?auto_24476 ?auto_24504 ) ( ON ?auto_24476 ?auto_24506 ) ( CLEAR ?auto_24476 ) ( not ( = ?auto_24475 ?auto_24476 ) ) ( not ( = ?auto_24475 ?auto_24506 ) ) ( not ( = ?auto_24476 ?auto_24506 ) ) ( not ( = ?auto_24484 ?auto_24509 ) ) ( IS-CRATE ?auto_24475 ) ( SURFACE-AT ?auto_24475 ?auto_24504 ) ( ON ?auto_24475 ?auto_24500 ) ( CLEAR ?auto_24475 ) ( not ( = ?auto_24474 ?auto_24475 ) ) ( not ( = ?auto_24474 ?auto_24500 ) ) ( not ( = ?auto_24475 ?auto_24500 ) ) ( IS-CRATE ?auto_24474 ) ( not ( = ?auto_24521 ?auto_24486 ) ) ( HOIST-AT ?auto_24512 ?auto_24521 ) ( AVAILABLE ?auto_24512 ) ( SURFACE-AT ?auto_24474 ?auto_24521 ) ( ON ?auto_24474 ?auto_24503 ) ( CLEAR ?auto_24474 ) ( not ( = ?auto_24473 ?auto_24474 ) ) ( not ( = ?auto_24473 ?auto_24503 ) ) ( not ( = ?auto_24474 ?auto_24503 ) ) ( not ( = ?auto_24484 ?auto_24512 ) ) ( IS-CRATE ?auto_24473 ) ( not ( = ?auto_24508 ?auto_24486 ) ) ( HOIST-AT ?auto_24514 ?auto_24508 ) ( AVAILABLE ?auto_24514 ) ( SURFACE-AT ?auto_24473 ?auto_24508 ) ( ON ?auto_24473 ?auto_24519 ) ( CLEAR ?auto_24473 ) ( not ( = ?auto_24472 ?auto_24473 ) ) ( not ( = ?auto_24472 ?auto_24519 ) ) ( not ( = ?auto_24473 ?auto_24519 ) ) ( not ( = ?auto_24484 ?auto_24514 ) ) ( IS-CRATE ?auto_24472 ) ( not ( = ?auto_24511 ?auto_24486 ) ) ( HOIST-AT ?auto_24518 ?auto_24511 ) ( AVAILABLE ?auto_24518 ) ( SURFACE-AT ?auto_24472 ?auto_24511 ) ( ON ?auto_24472 ?auto_24522 ) ( CLEAR ?auto_24472 ) ( not ( = ?auto_24471 ?auto_24472 ) ) ( not ( = ?auto_24471 ?auto_24522 ) ) ( not ( = ?auto_24472 ?auto_24522 ) ) ( not ( = ?auto_24484 ?auto_24518 ) ) ( IS-CRATE ?auto_24471 ) ( not ( = ?auto_24501 ?auto_24486 ) ) ( HOIST-AT ?auto_24507 ?auto_24501 ) ( AVAILABLE ?auto_24507 ) ( SURFACE-AT ?auto_24471 ?auto_24501 ) ( ON ?auto_24471 ?auto_24499 ) ( CLEAR ?auto_24471 ) ( not ( = ?auto_24470 ?auto_24471 ) ) ( not ( = ?auto_24470 ?auto_24499 ) ) ( not ( = ?auto_24471 ?auto_24499 ) ) ( not ( = ?auto_24484 ?auto_24507 ) ) ( IS-CRATE ?auto_24470 ) ( SURFACE-AT ?auto_24470 ?auto_24496 ) ( ON ?auto_24470 ?auto_24495 ) ( CLEAR ?auto_24470 ) ( not ( = ?auto_24469 ?auto_24470 ) ) ( not ( = ?auto_24469 ?auto_24495 ) ) ( not ( = ?auto_24470 ?auto_24495 ) ) ( IS-CRATE ?auto_24469 ) ( AVAILABLE ?auto_24509 ) ( SURFACE-AT ?auto_24469 ?auto_24504 ) ( ON ?auto_24469 ?auto_24502 ) ( CLEAR ?auto_24469 ) ( not ( = ?auto_24468 ?auto_24469 ) ) ( not ( = ?auto_24468 ?auto_24502 ) ) ( not ( = ?auto_24469 ?auto_24502 ) ) ( IS-CRATE ?auto_24468 ) ( not ( = ?auto_24491 ?auto_24486 ) ) ( HOIST-AT ?auto_24510 ?auto_24491 ) ( AVAILABLE ?auto_24510 ) ( SURFACE-AT ?auto_24468 ?auto_24491 ) ( ON ?auto_24468 ?auto_24515 ) ( CLEAR ?auto_24468 ) ( not ( = ?auto_24467 ?auto_24468 ) ) ( not ( = ?auto_24467 ?auto_24515 ) ) ( not ( = ?auto_24468 ?auto_24515 ) ) ( not ( = ?auto_24484 ?auto_24510 ) ) ( IS-CRATE ?auto_24467 ) ( not ( = ?auto_24516 ?auto_24486 ) ) ( HOIST-AT ?auto_24505 ?auto_24516 ) ( AVAILABLE ?auto_24505 ) ( SURFACE-AT ?auto_24467 ?auto_24516 ) ( ON ?auto_24467 ?auto_24494 ) ( CLEAR ?auto_24467 ) ( not ( = ?auto_24466 ?auto_24467 ) ) ( not ( = ?auto_24466 ?auto_24494 ) ) ( not ( = ?auto_24467 ?auto_24494 ) ) ( not ( = ?auto_24484 ?auto_24505 ) ) ( IS-CRATE ?auto_24466 ) ( AVAILABLE ?auto_24498 ) ( SURFACE-AT ?auto_24466 ?auto_24496 ) ( ON ?auto_24466 ?auto_24487 ) ( CLEAR ?auto_24466 ) ( not ( = ?auto_24465 ?auto_24466 ) ) ( not ( = ?auto_24465 ?auto_24487 ) ) ( not ( = ?auto_24466 ?auto_24487 ) ) ( SURFACE-AT ?auto_24464 ?auto_24486 ) ( CLEAR ?auto_24464 ) ( IS-CRATE ?auto_24465 ) ( AVAILABLE ?auto_24484 ) ( not ( = ?auto_24490 ?auto_24486 ) ) ( HOIST-AT ?auto_24488 ?auto_24490 ) ( AVAILABLE ?auto_24488 ) ( SURFACE-AT ?auto_24465 ?auto_24490 ) ( ON ?auto_24465 ?auto_24489 ) ( CLEAR ?auto_24465 ) ( TRUCK-AT ?auto_24483 ?auto_24486 ) ( not ( = ?auto_24464 ?auto_24465 ) ) ( not ( = ?auto_24464 ?auto_24489 ) ) ( not ( = ?auto_24465 ?auto_24489 ) ) ( not ( = ?auto_24484 ?auto_24488 ) ) ( not ( = ?auto_24464 ?auto_24466 ) ) ( not ( = ?auto_24464 ?auto_24487 ) ) ( not ( = ?auto_24466 ?auto_24489 ) ) ( not ( = ?auto_24496 ?auto_24490 ) ) ( not ( = ?auto_24498 ?auto_24488 ) ) ( not ( = ?auto_24487 ?auto_24489 ) ) ( not ( = ?auto_24464 ?auto_24467 ) ) ( not ( = ?auto_24464 ?auto_24494 ) ) ( not ( = ?auto_24465 ?auto_24467 ) ) ( not ( = ?auto_24465 ?auto_24494 ) ) ( not ( = ?auto_24467 ?auto_24487 ) ) ( not ( = ?auto_24467 ?auto_24489 ) ) ( not ( = ?auto_24516 ?auto_24496 ) ) ( not ( = ?auto_24516 ?auto_24490 ) ) ( not ( = ?auto_24505 ?auto_24498 ) ) ( not ( = ?auto_24505 ?auto_24488 ) ) ( not ( = ?auto_24494 ?auto_24487 ) ) ( not ( = ?auto_24494 ?auto_24489 ) ) ( not ( = ?auto_24464 ?auto_24468 ) ) ( not ( = ?auto_24464 ?auto_24515 ) ) ( not ( = ?auto_24465 ?auto_24468 ) ) ( not ( = ?auto_24465 ?auto_24515 ) ) ( not ( = ?auto_24466 ?auto_24468 ) ) ( not ( = ?auto_24466 ?auto_24515 ) ) ( not ( = ?auto_24468 ?auto_24494 ) ) ( not ( = ?auto_24468 ?auto_24487 ) ) ( not ( = ?auto_24468 ?auto_24489 ) ) ( not ( = ?auto_24491 ?auto_24516 ) ) ( not ( = ?auto_24491 ?auto_24496 ) ) ( not ( = ?auto_24491 ?auto_24490 ) ) ( not ( = ?auto_24510 ?auto_24505 ) ) ( not ( = ?auto_24510 ?auto_24498 ) ) ( not ( = ?auto_24510 ?auto_24488 ) ) ( not ( = ?auto_24515 ?auto_24494 ) ) ( not ( = ?auto_24515 ?auto_24487 ) ) ( not ( = ?auto_24515 ?auto_24489 ) ) ( not ( = ?auto_24464 ?auto_24469 ) ) ( not ( = ?auto_24464 ?auto_24502 ) ) ( not ( = ?auto_24465 ?auto_24469 ) ) ( not ( = ?auto_24465 ?auto_24502 ) ) ( not ( = ?auto_24466 ?auto_24469 ) ) ( not ( = ?auto_24466 ?auto_24502 ) ) ( not ( = ?auto_24467 ?auto_24469 ) ) ( not ( = ?auto_24467 ?auto_24502 ) ) ( not ( = ?auto_24469 ?auto_24515 ) ) ( not ( = ?auto_24469 ?auto_24494 ) ) ( not ( = ?auto_24469 ?auto_24487 ) ) ( not ( = ?auto_24469 ?auto_24489 ) ) ( not ( = ?auto_24504 ?auto_24491 ) ) ( not ( = ?auto_24504 ?auto_24516 ) ) ( not ( = ?auto_24504 ?auto_24496 ) ) ( not ( = ?auto_24504 ?auto_24490 ) ) ( not ( = ?auto_24509 ?auto_24510 ) ) ( not ( = ?auto_24509 ?auto_24505 ) ) ( not ( = ?auto_24509 ?auto_24498 ) ) ( not ( = ?auto_24509 ?auto_24488 ) ) ( not ( = ?auto_24502 ?auto_24515 ) ) ( not ( = ?auto_24502 ?auto_24494 ) ) ( not ( = ?auto_24502 ?auto_24487 ) ) ( not ( = ?auto_24502 ?auto_24489 ) ) ( not ( = ?auto_24464 ?auto_24470 ) ) ( not ( = ?auto_24464 ?auto_24495 ) ) ( not ( = ?auto_24465 ?auto_24470 ) ) ( not ( = ?auto_24465 ?auto_24495 ) ) ( not ( = ?auto_24466 ?auto_24470 ) ) ( not ( = ?auto_24466 ?auto_24495 ) ) ( not ( = ?auto_24467 ?auto_24470 ) ) ( not ( = ?auto_24467 ?auto_24495 ) ) ( not ( = ?auto_24468 ?auto_24470 ) ) ( not ( = ?auto_24468 ?auto_24495 ) ) ( not ( = ?auto_24470 ?auto_24502 ) ) ( not ( = ?auto_24470 ?auto_24515 ) ) ( not ( = ?auto_24470 ?auto_24494 ) ) ( not ( = ?auto_24470 ?auto_24487 ) ) ( not ( = ?auto_24470 ?auto_24489 ) ) ( not ( = ?auto_24495 ?auto_24502 ) ) ( not ( = ?auto_24495 ?auto_24515 ) ) ( not ( = ?auto_24495 ?auto_24494 ) ) ( not ( = ?auto_24495 ?auto_24487 ) ) ( not ( = ?auto_24495 ?auto_24489 ) ) ( not ( = ?auto_24464 ?auto_24471 ) ) ( not ( = ?auto_24464 ?auto_24499 ) ) ( not ( = ?auto_24465 ?auto_24471 ) ) ( not ( = ?auto_24465 ?auto_24499 ) ) ( not ( = ?auto_24466 ?auto_24471 ) ) ( not ( = ?auto_24466 ?auto_24499 ) ) ( not ( = ?auto_24467 ?auto_24471 ) ) ( not ( = ?auto_24467 ?auto_24499 ) ) ( not ( = ?auto_24468 ?auto_24471 ) ) ( not ( = ?auto_24468 ?auto_24499 ) ) ( not ( = ?auto_24469 ?auto_24471 ) ) ( not ( = ?auto_24469 ?auto_24499 ) ) ( not ( = ?auto_24471 ?auto_24495 ) ) ( not ( = ?auto_24471 ?auto_24502 ) ) ( not ( = ?auto_24471 ?auto_24515 ) ) ( not ( = ?auto_24471 ?auto_24494 ) ) ( not ( = ?auto_24471 ?auto_24487 ) ) ( not ( = ?auto_24471 ?auto_24489 ) ) ( not ( = ?auto_24501 ?auto_24496 ) ) ( not ( = ?auto_24501 ?auto_24504 ) ) ( not ( = ?auto_24501 ?auto_24491 ) ) ( not ( = ?auto_24501 ?auto_24516 ) ) ( not ( = ?auto_24501 ?auto_24490 ) ) ( not ( = ?auto_24507 ?auto_24498 ) ) ( not ( = ?auto_24507 ?auto_24509 ) ) ( not ( = ?auto_24507 ?auto_24510 ) ) ( not ( = ?auto_24507 ?auto_24505 ) ) ( not ( = ?auto_24507 ?auto_24488 ) ) ( not ( = ?auto_24499 ?auto_24495 ) ) ( not ( = ?auto_24499 ?auto_24502 ) ) ( not ( = ?auto_24499 ?auto_24515 ) ) ( not ( = ?auto_24499 ?auto_24494 ) ) ( not ( = ?auto_24499 ?auto_24487 ) ) ( not ( = ?auto_24499 ?auto_24489 ) ) ( not ( = ?auto_24464 ?auto_24472 ) ) ( not ( = ?auto_24464 ?auto_24522 ) ) ( not ( = ?auto_24465 ?auto_24472 ) ) ( not ( = ?auto_24465 ?auto_24522 ) ) ( not ( = ?auto_24466 ?auto_24472 ) ) ( not ( = ?auto_24466 ?auto_24522 ) ) ( not ( = ?auto_24467 ?auto_24472 ) ) ( not ( = ?auto_24467 ?auto_24522 ) ) ( not ( = ?auto_24468 ?auto_24472 ) ) ( not ( = ?auto_24468 ?auto_24522 ) ) ( not ( = ?auto_24469 ?auto_24472 ) ) ( not ( = ?auto_24469 ?auto_24522 ) ) ( not ( = ?auto_24470 ?auto_24472 ) ) ( not ( = ?auto_24470 ?auto_24522 ) ) ( not ( = ?auto_24472 ?auto_24499 ) ) ( not ( = ?auto_24472 ?auto_24495 ) ) ( not ( = ?auto_24472 ?auto_24502 ) ) ( not ( = ?auto_24472 ?auto_24515 ) ) ( not ( = ?auto_24472 ?auto_24494 ) ) ( not ( = ?auto_24472 ?auto_24487 ) ) ( not ( = ?auto_24472 ?auto_24489 ) ) ( not ( = ?auto_24511 ?auto_24501 ) ) ( not ( = ?auto_24511 ?auto_24496 ) ) ( not ( = ?auto_24511 ?auto_24504 ) ) ( not ( = ?auto_24511 ?auto_24491 ) ) ( not ( = ?auto_24511 ?auto_24516 ) ) ( not ( = ?auto_24511 ?auto_24490 ) ) ( not ( = ?auto_24518 ?auto_24507 ) ) ( not ( = ?auto_24518 ?auto_24498 ) ) ( not ( = ?auto_24518 ?auto_24509 ) ) ( not ( = ?auto_24518 ?auto_24510 ) ) ( not ( = ?auto_24518 ?auto_24505 ) ) ( not ( = ?auto_24518 ?auto_24488 ) ) ( not ( = ?auto_24522 ?auto_24499 ) ) ( not ( = ?auto_24522 ?auto_24495 ) ) ( not ( = ?auto_24522 ?auto_24502 ) ) ( not ( = ?auto_24522 ?auto_24515 ) ) ( not ( = ?auto_24522 ?auto_24494 ) ) ( not ( = ?auto_24522 ?auto_24487 ) ) ( not ( = ?auto_24522 ?auto_24489 ) ) ( not ( = ?auto_24464 ?auto_24473 ) ) ( not ( = ?auto_24464 ?auto_24519 ) ) ( not ( = ?auto_24465 ?auto_24473 ) ) ( not ( = ?auto_24465 ?auto_24519 ) ) ( not ( = ?auto_24466 ?auto_24473 ) ) ( not ( = ?auto_24466 ?auto_24519 ) ) ( not ( = ?auto_24467 ?auto_24473 ) ) ( not ( = ?auto_24467 ?auto_24519 ) ) ( not ( = ?auto_24468 ?auto_24473 ) ) ( not ( = ?auto_24468 ?auto_24519 ) ) ( not ( = ?auto_24469 ?auto_24473 ) ) ( not ( = ?auto_24469 ?auto_24519 ) ) ( not ( = ?auto_24470 ?auto_24473 ) ) ( not ( = ?auto_24470 ?auto_24519 ) ) ( not ( = ?auto_24471 ?auto_24473 ) ) ( not ( = ?auto_24471 ?auto_24519 ) ) ( not ( = ?auto_24473 ?auto_24522 ) ) ( not ( = ?auto_24473 ?auto_24499 ) ) ( not ( = ?auto_24473 ?auto_24495 ) ) ( not ( = ?auto_24473 ?auto_24502 ) ) ( not ( = ?auto_24473 ?auto_24515 ) ) ( not ( = ?auto_24473 ?auto_24494 ) ) ( not ( = ?auto_24473 ?auto_24487 ) ) ( not ( = ?auto_24473 ?auto_24489 ) ) ( not ( = ?auto_24508 ?auto_24511 ) ) ( not ( = ?auto_24508 ?auto_24501 ) ) ( not ( = ?auto_24508 ?auto_24496 ) ) ( not ( = ?auto_24508 ?auto_24504 ) ) ( not ( = ?auto_24508 ?auto_24491 ) ) ( not ( = ?auto_24508 ?auto_24516 ) ) ( not ( = ?auto_24508 ?auto_24490 ) ) ( not ( = ?auto_24514 ?auto_24518 ) ) ( not ( = ?auto_24514 ?auto_24507 ) ) ( not ( = ?auto_24514 ?auto_24498 ) ) ( not ( = ?auto_24514 ?auto_24509 ) ) ( not ( = ?auto_24514 ?auto_24510 ) ) ( not ( = ?auto_24514 ?auto_24505 ) ) ( not ( = ?auto_24514 ?auto_24488 ) ) ( not ( = ?auto_24519 ?auto_24522 ) ) ( not ( = ?auto_24519 ?auto_24499 ) ) ( not ( = ?auto_24519 ?auto_24495 ) ) ( not ( = ?auto_24519 ?auto_24502 ) ) ( not ( = ?auto_24519 ?auto_24515 ) ) ( not ( = ?auto_24519 ?auto_24494 ) ) ( not ( = ?auto_24519 ?auto_24487 ) ) ( not ( = ?auto_24519 ?auto_24489 ) ) ( not ( = ?auto_24464 ?auto_24474 ) ) ( not ( = ?auto_24464 ?auto_24503 ) ) ( not ( = ?auto_24465 ?auto_24474 ) ) ( not ( = ?auto_24465 ?auto_24503 ) ) ( not ( = ?auto_24466 ?auto_24474 ) ) ( not ( = ?auto_24466 ?auto_24503 ) ) ( not ( = ?auto_24467 ?auto_24474 ) ) ( not ( = ?auto_24467 ?auto_24503 ) ) ( not ( = ?auto_24468 ?auto_24474 ) ) ( not ( = ?auto_24468 ?auto_24503 ) ) ( not ( = ?auto_24469 ?auto_24474 ) ) ( not ( = ?auto_24469 ?auto_24503 ) ) ( not ( = ?auto_24470 ?auto_24474 ) ) ( not ( = ?auto_24470 ?auto_24503 ) ) ( not ( = ?auto_24471 ?auto_24474 ) ) ( not ( = ?auto_24471 ?auto_24503 ) ) ( not ( = ?auto_24472 ?auto_24474 ) ) ( not ( = ?auto_24472 ?auto_24503 ) ) ( not ( = ?auto_24474 ?auto_24519 ) ) ( not ( = ?auto_24474 ?auto_24522 ) ) ( not ( = ?auto_24474 ?auto_24499 ) ) ( not ( = ?auto_24474 ?auto_24495 ) ) ( not ( = ?auto_24474 ?auto_24502 ) ) ( not ( = ?auto_24474 ?auto_24515 ) ) ( not ( = ?auto_24474 ?auto_24494 ) ) ( not ( = ?auto_24474 ?auto_24487 ) ) ( not ( = ?auto_24474 ?auto_24489 ) ) ( not ( = ?auto_24521 ?auto_24508 ) ) ( not ( = ?auto_24521 ?auto_24511 ) ) ( not ( = ?auto_24521 ?auto_24501 ) ) ( not ( = ?auto_24521 ?auto_24496 ) ) ( not ( = ?auto_24521 ?auto_24504 ) ) ( not ( = ?auto_24521 ?auto_24491 ) ) ( not ( = ?auto_24521 ?auto_24516 ) ) ( not ( = ?auto_24521 ?auto_24490 ) ) ( not ( = ?auto_24512 ?auto_24514 ) ) ( not ( = ?auto_24512 ?auto_24518 ) ) ( not ( = ?auto_24512 ?auto_24507 ) ) ( not ( = ?auto_24512 ?auto_24498 ) ) ( not ( = ?auto_24512 ?auto_24509 ) ) ( not ( = ?auto_24512 ?auto_24510 ) ) ( not ( = ?auto_24512 ?auto_24505 ) ) ( not ( = ?auto_24512 ?auto_24488 ) ) ( not ( = ?auto_24503 ?auto_24519 ) ) ( not ( = ?auto_24503 ?auto_24522 ) ) ( not ( = ?auto_24503 ?auto_24499 ) ) ( not ( = ?auto_24503 ?auto_24495 ) ) ( not ( = ?auto_24503 ?auto_24502 ) ) ( not ( = ?auto_24503 ?auto_24515 ) ) ( not ( = ?auto_24503 ?auto_24494 ) ) ( not ( = ?auto_24503 ?auto_24487 ) ) ( not ( = ?auto_24503 ?auto_24489 ) ) ( not ( = ?auto_24464 ?auto_24475 ) ) ( not ( = ?auto_24464 ?auto_24500 ) ) ( not ( = ?auto_24465 ?auto_24475 ) ) ( not ( = ?auto_24465 ?auto_24500 ) ) ( not ( = ?auto_24466 ?auto_24475 ) ) ( not ( = ?auto_24466 ?auto_24500 ) ) ( not ( = ?auto_24467 ?auto_24475 ) ) ( not ( = ?auto_24467 ?auto_24500 ) ) ( not ( = ?auto_24468 ?auto_24475 ) ) ( not ( = ?auto_24468 ?auto_24500 ) ) ( not ( = ?auto_24469 ?auto_24475 ) ) ( not ( = ?auto_24469 ?auto_24500 ) ) ( not ( = ?auto_24470 ?auto_24475 ) ) ( not ( = ?auto_24470 ?auto_24500 ) ) ( not ( = ?auto_24471 ?auto_24475 ) ) ( not ( = ?auto_24471 ?auto_24500 ) ) ( not ( = ?auto_24472 ?auto_24475 ) ) ( not ( = ?auto_24472 ?auto_24500 ) ) ( not ( = ?auto_24473 ?auto_24475 ) ) ( not ( = ?auto_24473 ?auto_24500 ) ) ( not ( = ?auto_24475 ?auto_24503 ) ) ( not ( = ?auto_24475 ?auto_24519 ) ) ( not ( = ?auto_24475 ?auto_24522 ) ) ( not ( = ?auto_24475 ?auto_24499 ) ) ( not ( = ?auto_24475 ?auto_24495 ) ) ( not ( = ?auto_24475 ?auto_24502 ) ) ( not ( = ?auto_24475 ?auto_24515 ) ) ( not ( = ?auto_24475 ?auto_24494 ) ) ( not ( = ?auto_24475 ?auto_24487 ) ) ( not ( = ?auto_24475 ?auto_24489 ) ) ( not ( = ?auto_24500 ?auto_24503 ) ) ( not ( = ?auto_24500 ?auto_24519 ) ) ( not ( = ?auto_24500 ?auto_24522 ) ) ( not ( = ?auto_24500 ?auto_24499 ) ) ( not ( = ?auto_24500 ?auto_24495 ) ) ( not ( = ?auto_24500 ?auto_24502 ) ) ( not ( = ?auto_24500 ?auto_24515 ) ) ( not ( = ?auto_24500 ?auto_24494 ) ) ( not ( = ?auto_24500 ?auto_24487 ) ) ( not ( = ?auto_24500 ?auto_24489 ) ) ( not ( = ?auto_24464 ?auto_24476 ) ) ( not ( = ?auto_24464 ?auto_24506 ) ) ( not ( = ?auto_24465 ?auto_24476 ) ) ( not ( = ?auto_24465 ?auto_24506 ) ) ( not ( = ?auto_24466 ?auto_24476 ) ) ( not ( = ?auto_24466 ?auto_24506 ) ) ( not ( = ?auto_24467 ?auto_24476 ) ) ( not ( = ?auto_24467 ?auto_24506 ) ) ( not ( = ?auto_24468 ?auto_24476 ) ) ( not ( = ?auto_24468 ?auto_24506 ) ) ( not ( = ?auto_24469 ?auto_24476 ) ) ( not ( = ?auto_24469 ?auto_24506 ) ) ( not ( = ?auto_24470 ?auto_24476 ) ) ( not ( = ?auto_24470 ?auto_24506 ) ) ( not ( = ?auto_24471 ?auto_24476 ) ) ( not ( = ?auto_24471 ?auto_24506 ) ) ( not ( = ?auto_24472 ?auto_24476 ) ) ( not ( = ?auto_24472 ?auto_24506 ) ) ( not ( = ?auto_24473 ?auto_24476 ) ) ( not ( = ?auto_24473 ?auto_24506 ) ) ( not ( = ?auto_24474 ?auto_24476 ) ) ( not ( = ?auto_24474 ?auto_24506 ) ) ( not ( = ?auto_24476 ?auto_24500 ) ) ( not ( = ?auto_24476 ?auto_24503 ) ) ( not ( = ?auto_24476 ?auto_24519 ) ) ( not ( = ?auto_24476 ?auto_24522 ) ) ( not ( = ?auto_24476 ?auto_24499 ) ) ( not ( = ?auto_24476 ?auto_24495 ) ) ( not ( = ?auto_24476 ?auto_24502 ) ) ( not ( = ?auto_24476 ?auto_24515 ) ) ( not ( = ?auto_24476 ?auto_24494 ) ) ( not ( = ?auto_24476 ?auto_24487 ) ) ( not ( = ?auto_24476 ?auto_24489 ) ) ( not ( = ?auto_24506 ?auto_24500 ) ) ( not ( = ?auto_24506 ?auto_24503 ) ) ( not ( = ?auto_24506 ?auto_24519 ) ) ( not ( = ?auto_24506 ?auto_24522 ) ) ( not ( = ?auto_24506 ?auto_24499 ) ) ( not ( = ?auto_24506 ?auto_24495 ) ) ( not ( = ?auto_24506 ?auto_24502 ) ) ( not ( = ?auto_24506 ?auto_24515 ) ) ( not ( = ?auto_24506 ?auto_24494 ) ) ( not ( = ?auto_24506 ?auto_24487 ) ) ( not ( = ?auto_24506 ?auto_24489 ) ) ( not ( = ?auto_24464 ?auto_24478 ) ) ( not ( = ?auto_24464 ?auto_24523 ) ) ( not ( = ?auto_24465 ?auto_24478 ) ) ( not ( = ?auto_24465 ?auto_24523 ) ) ( not ( = ?auto_24466 ?auto_24478 ) ) ( not ( = ?auto_24466 ?auto_24523 ) ) ( not ( = ?auto_24467 ?auto_24478 ) ) ( not ( = ?auto_24467 ?auto_24523 ) ) ( not ( = ?auto_24468 ?auto_24478 ) ) ( not ( = ?auto_24468 ?auto_24523 ) ) ( not ( = ?auto_24469 ?auto_24478 ) ) ( not ( = ?auto_24469 ?auto_24523 ) ) ( not ( = ?auto_24470 ?auto_24478 ) ) ( not ( = ?auto_24470 ?auto_24523 ) ) ( not ( = ?auto_24471 ?auto_24478 ) ) ( not ( = ?auto_24471 ?auto_24523 ) ) ( not ( = ?auto_24472 ?auto_24478 ) ) ( not ( = ?auto_24472 ?auto_24523 ) ) ( not ( = ?auto_24473 ?auto_24478 ) ) ( not ( = ?auto_24473 ?auto_24523 ) ) ( not ( = ?auto_24474 ?auto_24478 ) ) ( not ( = ?auto_24474 ?auto_24523 ) ) ( not ( = ?auto_24475 ?auto_24478 ) ) ( not ( = ?auto_24475 ?auto_24523 ) ) ( not ( = ?auto_24478 ?auto_24506 ) ) ( not ( = ?auto_24478 ?auto_24500 ) ) ( not ( = ?auto_24478 ?auto_24503 ) ) ( not ( = ?auto_24478 ?auto_24519 ) ) ( not ( = ?auto_24478 ?auto_24522 ) ) ( not ( = ?auto_24478 ?auto_24499 ) ) ( not ( = ?auto_24478 ?auto_24495 ) ) ( not ( = ?auto_24478 ?auto_24502 ) ) ( not ( = ?auto_24478 ?auto_24515 ) ) ( not ( = ?auto_24478 ?auto_24494 ) ) ( not ( = ?auto_24478 ?auto_24487 ) ) ( not ( = ?auto_24478 ?auto_24489 ) ) ( not ( = ?auto_24520 ?auto_24504 ) ) ( not ( = ?auto_24520 ?auto_24521 ) ) ( not ( = ?auto_24520 ?auto_24508 ) ) ( not ( = ?auto_24520 ?auto_24511 ) ) ( not ( = ?auto_24520 ?auto_24501 ) ) ( not ( = ?auto_24520 ?auto_24496 ) ) ( not ( = ?auto_24520 ?auto_24491 ) ) ( not ( = ?auto_24520 ?auto_24516 ) ) ( not ( = ?auto_24520 ?auto_24490 ) ) ( not ( = ?auto_24497 ?auto_24509 ) ) ( not ( = ?auto_24497 ?auto_24512 ) ) ( not ( = ?auto_24497 ?auto_24514 ) ) ( not ( = ?auto_24497 ?auto_24518 ) ) ( not ( = ?auto_24497 ?auto_24507 ) ) ( not ( = ?auto_24497 ?auto_24498 ) ) ( not ( = ?auto_24497 ?auto_24510 ) ) ( not ( = ?auto_24497 ?auto_24505 ) ) ( not ( = ?auto_24497 ?auto_24488 ) ) ( not ( = ?auto_24523 ?auto_24506 ) ) ( not ( = ?auto_24523 ?auto_24500 ) ) ( not ( = ?auto_24523 ?auto_24503 ) ) ( not ( = ?auto_24523 ?auto_24519 ) ) ( not ( = ?auto_24523 ?auto_24522 ) ) ( not ( = ?auto_24523 ?auto_24499 ) ) ( not ( = ?auto_24523 ?auto_24495 ) ) ( not ( = ?auto_24523 ?auto_24502 ) ) ( not ( = ?auto_24523 ?auto_24515 ) ) ( not ( = ?auto_24523 ?auto_24494 ) ) ( not ( = ?auto_24523 ?auto_24487 ) ) ( not ( = ?auto_24523 ?auto_24489 ) ) ( not ( = ?auto_24464 ?auto_24477 ) ) ( not ( = ?auto_24464 ?auto_24513 ) ) ( not ( = ?auto_24465 ?auto_24477 ) ) ( not ( = ?auto_24465 ?auto_24513 ) ) ( not ( = ?auto_24466 ?auto_24477 ) ) ( not ( = ?auto_24466 ?auto_24513 ) ) ( not ( = ?auto_24467 ?auto_24477 ) ) ( not ( = ?auto_24467 ?auto_24513 ) ) ( not ( = ?auto_24468 ?auto_24477 ) ) ( not ( = ?auto_24468 ?auto_24513 ) ) ( not ( = ?auto_24469 ?auto_24477 ) ) ( not ( = ?auto_24469 ?auto_24513 ) ) ( not ( = ?auto_24470 ?auto_24477 ) ) ( not ( = ?auto_24470 ?auto_24513 ) ) ( not ( = ?auto_24471 ?auto_24477 ) ) ( not ( = ?auto_24471 ?auto_24513 ) ) ( not ( = ?auto_24472 ?auto_24477 ) ) ( not ( = ?auto_24472 ?auto_24513 ) ) ( not ( = ?auto_24473 ?auto_24477 ) ) ( not ( = ?auto_24473 ?auto_24513 ) ) ( not ( = ?auto_24474 ?auto_24477 ) ) ( not ( = ?auto_24474 ?auto_24513 ) ) ( not ( = ?auto_24475 ?auto_24477 ) ) ( not ( = ?auto_24475 ?auto_24513 ) ) ( not ( = ?auto_24476 ?auto_24477 ) ) ( not ( = ?auto_24476 ?auto_24513 ) ) ( not ( = ?auto_24477 ?auto_24523 ) ) ( not ( = ?auto_24477 ?auto_24506 ) ) ( not ( = ?auto_24477 ?auto_24500 ) ) ( not ( = ?auto_24477 ?auto_24503 ) ) ( not ( = ?auto_24477 ?auto_24519 ) ) ( not ( = ?auto_24477 ?auto_24522 ) ) ( not ( = ?auto_24477 ?auto_24499 ) ) ( not ( = ?auto_24477 ?auto_24495 ) ) ( not ( = ?auto_24477 ?auto_24502 ) ) ( not ( = ?auto_24477 ?auto_24515 ) ) ( not ( = ?auto_24477 ?auto_24494 ) ) ( not ( = ?auto_24477 ?auto_24487 ) ) ( not ( = ?auto_24477 ?auto_24489 ) ) ( not ( = ?auto_24513 ?auto_24523 ) ) ( not ( = ?auto_24513 ?auto_24506 ) ) ( not ( = ?auto_24513 ?auto_24500 ) ) ( not ( = ?auto_24513 ?auto_24503 ) ) ( not ( = ?auto_24513 ?auto_24519 ) ) ( not ( = ?auto_24513 ?auto_24522 ) ) ( not ( = ?auto_24513 ?auto_24499 ) ) ( not ( = ?auto_24513 ?auto_24495 ) ) ( not ( = ?auto_24513 ?auto_24502 ) ) ( not ( = ?auto_24513 ?auto_24515 ) ) ( not ( = ?auto_24513 ?auto_24494 ) ) ( not ( = ?auto_24513 ?auto_24487 ) ) ( not ( = ?auto_24513 ?auto_24489 ) ) ( not ( = ?auto_24464 ?auto_24480 ) ) ( not ( = ?auto_24464 ?auto_24517 ) ) ( not ( = ?auto_24465 ?auto_24480 ) ) ( not ( = ?auto_24465 ?auto_24517 ) ) ( not ( = ?auto_24466 ?auto_24480 ) ) ( not ( = ?auto_24466 ?auto_24517 ) ) ( not ( = ?auto_24467 ?auto_24480 ) ) ( not ( = ?auto_24467 ?auto_24517 ) ) ( not ( = ?auto_24468 ?auto_24480 ) ) ( not ( = ?auto_24468 ?auto_24517 ) ) ( not ( = ?auto_24469 ?auto_24480 ) ) ( not ( = ?auto_24469 ?auto_24517 ) ) ( not ( = ?auto_24470 ?auto_24480 ) ) ( not ( = ?auto_24470 ?auto_24517 ) ) ( not ( = ?auto_24471 ?auto_24480 ) ) ( not ( = ?auto_24471 ?auto_24517 ) ) ( not ( = ?auto_24472 ?auto_24480 ) ) ( not ( = ?auto_24472 ?auto_24517 ) ) ( not ( = ?auto_24473 ?auto_24480 ) ) ( not ( = ?auto_24473 ?auto_24517 ) ) ( not ( = ?auto_24474 ?auto_24480 ) ) ( not ( = ?auto_24474 ?auto_24517 ) ) ( not ( = ?auto_24475 ?auto_24480 ) ) ( not ( = ?auto_24475 ?auto_24517 ) ) ( not ( = ?auto_24476 ?auto_24480 ) ) ( not ( = ?auto_24476 ?auto_24517 ) ) ( not ( = ?auto_24478 ?auto_24480 ) ) ( not ( = ?auto_24478 ?auto_24517 ) ) ( not ( = ?auto_24480 ?auto_24513 ) ) ( not ( = ?auto_24480 ?auto_24523 ) ) ( not ( = ?auto_24480 ?auto_24506 ) ) ( not ( = ?auto_24480 ?auto_24500 ) ) ( not ( = ?auto_24480 ?auto_24503 ) ) ( not ( = ?auto_24480 ?auto_24519 ) ) ( not ( = ?auto_24480 ?auto_24522 ) ) ( not ( = ?auto_24480 ?auto_24499 ) ) ( not ( = ?auto_24480 ?auto_24495 ) ) ( not ( = ?auto_24480 ?auto_24502 ) ) ( not ( = ?auto_24480 ?auto_24515 ) ) ( not ( = ?auto_24480 ?auto_24494 ) ) ( not ( = ?auto_24480 ?auto_24487 ) ) ( not ( = ?auto_24480 ?auto_24489 ) ) ( not ( = ?auto_24492 ?auto_24496 ) ) ( not ( = ?auto_24492 ?auto_24520 ) ) ( not ( = ?auto_24492 ?auto_24504 ) ) ( not ( = ?auto_24492 ?auto_24521 ) ) ( not ( = ?auto_24492 ?auto_24508 ) ) ( not ( = ?auto_24492 ?auto_24511 ) ) ( not ( = ?auto_24492 ?auto_24501 ) ) ( not ( = ?auto_24492 ?auto_24491 ) ) ( not ( = ?auto_24492 ?auto_24516 ) ) ( not ( = ?auto_24492 ?auto_24490 ) ) ( not ( = ?auto_24493 ?auto_24498 ) ) ( not ( = ?auto_24493 ?auto_24497 ) ) ( not ( = ?auto_24493 ?auto_24509 ) ) ( not ( = ?auto_24493 ?auto_24512 ) ) ( not ( = ?auto_24493 ?auto_24514 ) ) ( not ( = ?auto_24493 ?auto_24518 ) ) ( not ( = ?auto_24493 ?auto_24507 ) ) ( not ( = ?auto_24493 ?auto_24510 ) ) ( not ( = ?auto_24493 ?auto_24505 ) ) ( not ( = ?auto_24493 ?auto_24488 ) ) ( not ( = ?auto_24517 ?auto_24513 ) ) ( not ( = ?auto_24517 ?auto_24523 ) ) ( not ( = ?auto_24517 ?auto_24506 ) ) ( not ( = ?auto_24517 ?auto_24500 ) ) ( not ( = ?auto_24517 ?auto_24503 ) ) ( not ( = ?auto_24517 ?auto_24519 ) ) ( not ( = ?auto_24517 ?auto_24522 ) ) ( not ( = ?auto_24517 ?auto_24499 ) ) ( not ( = ?auto_24517 ?auto_24495 ) ) ( not ( = ?auto_24517 ?auto_24502 ) ) ( not ( = ?auto_24517 ?auto_24515 ) ) ( not ( = ?auto_24517 ?auto_24494 ) ) ( not ( = ?auto_24517 ?auto_24487 ) ) ( not ( = ?auto_24517 ?auto_24489 ) ) ( not ( = ?auto_24464 ?auto_24479 ) ) ( not ( = ?auto_24464 ?auto_24481 ) ) ( not ( = ?auto_24465 ?auto_24479 ) ) ( not ( = ?auto_24465 ?auto_24481 ) ) ( not ( = ?auto_24466 ?auto_24479 ) ) ( not ( = ?auto_24466 ?auto_24481 ) ) ( not ( = ?auto_24467 ?auto_24479 ) ) ( not ( = ?auto_24467 ?auto_24481 ) ) ( not ( = ?auto_24468 ?auto_24479 ) ) ( not ( = ?auto_24468 ?auto_24481 ) ) ( not ( = ?auto_24469 ?auto_24479 ) ) ( not ( = ?auto_24469 ?auto_24481 ) ) ( not ( = ?auto_24470 ?auto_24479 ) ) ( not ( = ?auto_24470 ?auto_24481 ) ) ( not ( = ?auto_24471 ?auto_24479 ) ) ( not ( = ?auto_24471 ?auto_24481 ) ) ( not ( = ?auto_24472 ?auto_24479 ) ) ( not ( = ?auto_24472 ?auto_24481 ) ) ( not ( = ?auto_24473 ?auto_24479 ) ) ( not ( = ?auto_24473 ?auto_24481 ) ) ( not ( = ?auto_24474 ?auto_24479 ) ) ( not ( = ?auto_24474 ?auto_24481 ) ) ( not ( = ?auto_24475 ?auto_24479 ) ) ( not ( = ?auto_24475 ?auto_24481 ) ) ( not ( = ?auto_24476 ?auto_24479 ) ) ( not ( = ?auto_24476 ?auto_24481 ) ) ( not ( = ?auto_24478 ?auto_24479 ) ) ( not ( = ?auto_24478 ?auto_24481 ) ) ( not ( = ?auto_24477 ?auto_24479 ) ) ( not ( = ?auto_24477 ?auto_24481 ) ) ( not ( = ?auto_24479 ?auto_24517 ) ) ( not ( = ?auto_24479 ?auto_24513 ) ) ( not ( = ?auto_24479 ?auto_24523 ) ) ( not ( = ?auto_24479 ?auto_24506 ) ) ( not ( = ?auto_24479 ?auto_24500 ) ) ( not ( = ?auto_24479 ?auto_24503 ) ) ( not ( = ?auto_24479 ?auto_24519 ) ) ( not ( = ?auto_24479 ?auto_24522 ) ) ( not ( = ?auto_24479 ?auto_24499 ) ) ( not ( = ?auto_24479 ?auto_24495 ) ) ( not ( = ?auto_24479 ?auto_24502 ) ) ( not ( = ?auto_24479 ?auto_24515 ) ) ( not ( = ?auto_24479 ?auto_24494 ) ) ( not ( = ?auto_24479 ?auto_24487 ) ) ( not ( = ?auto_24479 ?auto_24489 ) ) ( not ( = ?auto_24485 ?auto_24492 ) ) ( not ( = ?auto_24485 ?auto_24496 ) ) ( not ( = ?auto_24485 ?auto_24520 ) ) ( not ( = ?auto_24485 ?auto_24504 ) ) ( not ( = ?auto_24485 ?auto_24521 ) ) ( not ( = ?auto_24485 ?auto_24508 ) ) ( not ( = ?auto_24485 ?auto_24511 ) ) ( not ( = ?auto_24485 ?auto_24501 ) ) ( not ( = ?auto_24485 ?auto_24491 ) ) ( not ( = ?auto_24485 ?auto_24516 ) ) ( not ( = ?auto_24485 ?auto_24490 ) ) ( not ( = ?auto_24482 ?auto_24493 ) ) ( not ( = ?auto_24482 ?auto_24498 ) ) ( not ( = ?auto_24482 ?auto_24497 ) ) ( not ( = ?auto_24482 ?auto_24509 ) ) ( not ( = ?auto_24482 ?auto_24512 ) ) ( not ( = ?auto_24482 ?auto_24514 ) ) ( not ( = ?auto_24482 ?auto_24518 ) ) ( not ( = ?auto_24482 ?auto_24507 ) ) ( not ( = ?auto_24482 ?auto_24510 ) ) ( not ( = ?auto_24482 ?auto_24505 ) ) ( not ( = ?auto_24482 ?auto_24488 ) ) ( not ( = ?auto_24481 ?auto_24517 ) ) ( not ( = ?auto_24481 ?auto_24513 ) ) ( not ( = ?auto_24481 ?auto_24523 ) ) ( not ( = ?auto_24481 ?auto_24506 ) ) ( not ( = ?auto_24481 ?auto_24500 ) ) ( not ( = ?auto_24481 ?auto_24503 ) ) ( not ( = ?auto_24481 ?auto_24519 ) ) ( not ( = ?auto_24481 ?auto_24522 ) ) ( not ( = ?auto_24481 ?auto_24499 ) ) ( not ( = ?auto_24481 ?auto_24495 ) ) ( not ( = ?auto_24481 ?auto_24502 ) ) ( not ( = ?auto_24481 ?auto_24515 ) ) ( not ( = ?auto_24481 ?auto_24494 ) ) ( not ( = ?auto_24481 ?auto_24487 ) ) ( not ( = ?auto_24481 ?auto_24489 ) ) )
    :subtasks
    ( ( MAKE-15CRATE ?auto_24464 ?auto_24465 ?auto_24466 ?auto_24467 ?auto_24468 ?auto_24469 ?auto_24470 ?auto_24471 ?auto_24472 ?auto_24473 ?auto_24474 ?auto_24475 ?auto_24476 ?auto_24478 ?auto_24477 ?auto_24480 )
      ( MAKE-1CRATE ?auto_24480 ?auto_24479 )
      ( MAKE-16CRATE-VERIFY ?auto_24464 ?auto_24465 ?auto_24466 ?auto_24467 ?auto_24468 ?auto_24469 ?auto_24470 ?auto_24471 ?auto_24472 ?auto_24473 ?auto_24474 ?auto_24475 ?auto_24476 ?auto_24478 ?auto_24477 ?auto_24480 ?auto_24479 ) )
  )

)

