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
      ?auto_23638 - SURFACE
      ?auto_23639 - SURFACE
    )
    :vars
    (
      ?auto_23640 - HOIST
      ?auto_23641 - PLACE
      ?auto_23643 - PLACE
      ?auto_23644 - HOIST
      ?auto_23645 - SURFACE
      ?auto_23642 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23640 ?auto_23641 ) ( SURFACE-AT ?auto_23638 ?auto_23641 ) ( CLEAR ?auto_23638 ) ( IS-CRATE ?auto_23639 ) ( AVAILABLE ?auto_23640 ) ( not ( = ?auto_23643 ?auto_23641 ) ) ( HOIST-AT ?auto_23644 ?auto_23643 ) ( AVAILABLE ?auto_23644 ) ( SURFACE-AT ?auto_23639 ?auto_23643 ) ( ON ?auto_23639 ?auto_23645 ) ( CLEAR ?auto_23639 ) ( TRUCK-AT ?auto_23642 ?auto_23641 ) ( not ( = ?auto_23638 ?auto_23639 ) ) ( not ( = ?auto_23638 ?auto_23645 ) ) ( not ( = ?auto_23639 ?auto_23645 ) ) ( not ( = ?auto_23640 ?auto_23644 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23642 ?auto_23641 ?auto_23643 )
      ( !LIFT ?auto_23644 ?auto_23639 ?auto_23645 ?auto_23643 )
      ( !LOAD ?auto_23644 ?auto_23639 ?auto_23642 ?auto_23643 )
      ( !DRIVE ?auto_23642 ?auto_23643 ?auto_23641 )
      ( !UNLOAD ?auto_23640 ?auto_23639 ?auto_23642 ?auto_23641 )
      ( !DROP ?auto_23640 ?auto_23639 ?auto_23638 ?auto_23641 )
      ( MAKE-1CRATE-VERIFY ?auto_23638 ?auto_23639 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23659 - SURFACE
      ?auto_23660 - SURFACE
      ?auto_23661 - SURFACE
    )
    :vars
    (
      ?auto_23662 - HOIST
      ?auto_23666 - PLACE
      ?auto_23665 - PLACE
      ?auto_23664 - HOIST
      ?auto_23663 - SURFACE
      ?auto_23668 - PLACE
      ?auto_23669 - HOIST
      ?auto_23670 - SURFACE
      ?auto_23667 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23662 ?auto_23666 ) ( IS-CRATE ?auto_23661 ) ( not ( = ?auto_23665 ?auto_23666 ) ) ( HOIST-AT ?auto_23664 ?auto_23665 ) ( AVAILABLE ?auto_23664 ) ( SURFACE-AT ?auto_23661 ?auto_23665 ) ( ON ?auto_23661 ?auto_23663 ) ( CLEAR ?auto_23661 ) ( not ( = ?auto_23660 ?auto_23661 ) ) ( not ( = ?auto_23660 ?auto_23663 ) ) ( not ( = ?auto_23661 ?auto_23663 ) ) ( not ( = ?auto_23662 ?auto_23664 ) ) ( SURFACE-AT ?auto_23659 ?auto_23666 ) ( CLEAR ?auto_23659 ) ( IS-CRATE ?auto_23660 ) ( AVAILABLE ?auto_23662 ) ( not ( = ?auto_23668 ?auto_23666 ) ) ( HOIST-AT ?auto_23669 ?auto_23668 ) ( AVAILABLE ?auto_23669 ) ( SURFACE-AT ?auto_23660 ?auto_23668 ) ( ON ?auto_23660 ?auto_23670 ) ( CLEAR ?auto_23660 ) ( TRUCK-AT ?auto_23667 ?auto_23666 ) ( not ( = ?auto_23659 ?auto_23660 ) ) ( not ( = ?auto_23659 ?auto_23670 ) ) ( not ( = ?auto_23660 ?auto_23670 ) ) ( not ( = ?auto_23662 ?auto_23669 ) ) ( not ( = ?auto_23659 ?auto_23661 ) ) ( not ( = ?auto_23659 ?auto_23663 ) ) ( not ( = ?auto_23661 ?auto_23670 ) ) ( not ( = ?auto_23665 ?auto_23668 ) ) ( not ( = ?auto_23664 ?auto_23669 ) ) ( not ( = ?auto_23663 ?auto_23670 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23659 ?auto_23660 )
      ( MAKE-1CRATE ?auto_23660 ?auto_23661 )
      ( MAKE-2CRATE-VERIFY ?auto_23659 ?auto_23660 ?auto_23661 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23685 - SURFACE
      ?auto_23686 - SURFACE
      ?auto_23687 - SURFACE
      ?auto_23688 - SURFACE
    )
    :vars
    (
      ?auto_23691 - HOIST
      ?auto_23690 - PLACE
      ?auto_23689 - PLACE
      ?auto_23694 - HOIST
      ?auto_23692 - SURFACE
      ?auto_23695 - PLACE
      ?auto_23699 - HOIST
      ?auto_23697 - SURFACE
      ?auto_23698 - PLACE
      ?auto_23696 - HOIST
      ?auto_23700 - SURFACE
      ?auto_23693 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23691 ?auto_23690 ) ( IS-CRATE ?auto_23688 ) ( not ( = ?auto_23689 ?auto_23690 ) ) ( HOIST-AT ?auto_23694 ?auto_23689 ) ( AVAILABLE ?auto_23694 ) ( SURFACE-AT ?auto_23688 ?auto_23689 ) ( ON ?auto_23688 ?auto_23692 ) ( CLEAR ?auto_23688 ) ( not ( = ?auto_23687 ?auto_23688 ) ) ( not ( = ?auto_23687 ?auto_23692 ) ) ( not ( = ?auto_23688 ?auto_23692 ) ) ( not ( = ?auto_23691 ?auto_23694 ) ) ( IS-CRATE ?auto_23687 ) ( not ( = ?auto_23695 ?auto_23690 ) ) ( HOIST-AT ?auto_23699 ?auto_23695 ) ( AVAILABLE ?auto_23699 ) ( SURFACE-AT ?auto_23687 ?auto_23695 ) ( ON ?auto_23687 ?auto_23697 ) ( CLEAR ?auto_23687 ) ( not ( = ?auto_23686 ?auto_23687 ) ) ( not ( = ?auto_23686 ?auto_23697 ) ) ( not ( = ?auto_23687 ?auto_23697 ) ) ( not ( = ?auto_23691 ?auto_23699 ) ) ( SURFACE-AT ?auto_23685 ?auto_23690 ) ( CLEAR ?auto_23685 ) ( IS-CRATE ?auto_23686 ) ( AVAILABLE ?auto_23691 ) ( not ( = ?auto_23698 ?auto_23690 ) ) ( HOIST-AT ?auto_23696 ?auto_23698 ) ( AVAILABLE ?auto_23696 ) ( SURFACE-AT ?auto_23686 ?auto_23698 ) ( ON ?auto_23686 ?auto_23700 ) ( CLEAR ?auto_23686 ) ( TRUCK-AT ?auto_23693 ?auto_23690 ) ( not ( = ?auto_23685 ?auto_23686 ) ) ( not ( = ?auto_23685 ?auto_23700 ) ) ( not ( = ?auto_23686 ?auto_23700 ) ) ( not ( = ?auto_23691 ?auto_23696 ) ) ( not ( = ?auto_23685 ?auto_23687 ) ) ( not ( = ?auto_23685 ?auto_23697 ) ) ( not ( = ?auto_23687 ?auto_23700 ) ) ( not ( = ?auto_23695 ?auto_23698 ) ) ( not ( = ?auto_23699 ?auto_23696 ) ) ( not ( = ?auto_23697 ?auto_23700 ) ) ( not ( = ?auto_23685 ?auto_23688 ) ) ( not ( = ?auto_23685 ?auto_23692 ) ) ( not ( = ?auto_23686 ?auto_23688 ) ) ( not ( = ?auto_23686 ?auto_23692 ) ) ( not ( = ?auto_23688 ?auto_23697 ) ) ( not ( = ?auto_23688 ?auto_23700 ) ) ( not ( = ?auto_23689 ?auto_23695 ) ) ( not ( = ?auto_23689 ?auto_23698 ) ) ( not ( = ?auto_23694 ?auto_23699 ) ) ( not ( = ?auto_23694 ?auto_23696 ) ) ( not ( = ?auto_23692 ?auto_23697 ) ) ( not ( = ?auto_23692 ?auto_23700 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23685 ?auto_23686 ?auto_23687 )
      ( MAKE-1CRATE ?auto_23687 ?auto_23688 )
      ( MAKE-3CRATE-VERIFY ?auto_23685 ?auto_23686 ?auto_23687 ?auto_23688 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23716 - SURFACE
      ?auto_23717 - SURFACE
      ?auto_23718 - SURFACE
      ?auto_23719 - SURFACE
      ?auto_23720 - SURFACE
    )
    :vars
    (
      ?auto_23722 - HOIST
      ?auto_23721 - PLACE
      ?auto_23724 - PLACE
      ?auto_23723 - HOIST
      ?auto_23726 - SURFACE
      ?auto_23730 - PLACE
      ?auto_23728 - HOIST
      ?auto_23732 - SURFACE
      ?auto_23729 - PLACE
      ?auto_23735 - HOIST
      ?auto_23727 - SURFACE
      ?auto_23733 - PLACE
      ?auto_23734 - HOIST
      ?auto_23731 - SURFACE
      ?auto_23725 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23722 ?auto_23721 ) ( IS-CRATE ?auto_23720 ) ( not ( = ?auto_23724 ?auto_23721 ) ) ( HOIST-AT ?auto_23723 ?auto_23724 ) ( AVAILABLE ?auto_23723 ) ( SURFACE-AT ?auto_23720 ?auto_23724 ) ( ON ?auto_23720 ?auto_23726 ) ( CLEAR ?auto_23720 ) ( not ( = ?auto_23719 ?auto_23720 ) ) ( not ( = ?auto_23719 ?auto_23726 ) ) ( not ( = ?auto_23720 ?auto_23726 ) ) ( not ( = ?auto_23722 ?auto_23723 ) ) ( IS-CRATE ?auto_23719 ) ( not ( = ?auto_23730 ?auto_23721 ) ) ( HOIST-AT ?auto_23728 ?auto_23730 ) ( AVAILABLE ?auto_23728 ) ( SURFACE-AT ?auto_23719 ?auto_23730 ) ( ON ?auto_23719 ?auto_23732 ) ( CLEAR ?auto_23719 ) ( not ( = ?auto_23718 ?auto_23719 ) ) ( not ( = ?auto_23718 ?auto_23732 ) ) ( not ( = ?auto_23719 ?auto_23732 ) ) ( not ( = ?auto_23722 ?auto_23728 ) ) ( IS-CRATE ?auto_23718 ) ( not ( = ?auto_23729 ?auto_23721 ) ) ( HOIST-AT ?auto_23735 ?auto_23729 ) ( AVAILABLE ?auto_23735 ) ( SURFACE-AT ?auto_23718 ?auto_23729 ) ( ON ?auto_23718 ?auto_23727 ) ( CLEAR ?auto_23718 ) ( not ( = ?auto_23717 ?auto_23718 ) ) ( not ( = ?auto_23717 ?auto_23727 ) ) ( not ( = ?auto_23718 ?auto_23727 ) ) ( not ( = ?auto_23722 ?auto_23735 ) ) ( SURFACE-AT ?auto_23716 ?auto_23721 ) ( CLEAR ?auto_23716 ) ( IS-CRATE ?auto_23717 ) ( AVAILABLE ?auto_23722 ) ( not ( = ?auto_23733 ?auto_23721 ) ) ( HOIST-AT ?auto_23734 ?auto_23733 ) ( AVAILABLE ?auto_23734 ) ( SURFACE-AT ?auto_23717 ?auto_23733 ) ( ON ?auto_23717 ?auto_23731 ) ( CLEAR ?auto_23717 ) ( TRUCK-AT ?auto_23725 ?auto_23721 ) ( not ( = ?auto_23716 ?auto_23717 ) ) ( not ( = ?auto_23716 ?auto_23731 ) ) ( not ( = ?auto_23717 ?auto_23731 ) ) ( not ( = ?auto_23722 ?auto_23734 ) ) ( not ( = ?auto_23716 ?auto_23718 ) ) ( not ( = ?auto_23716 ?auto_23727 ) ) ( not ( = ?auto_23718 ?auto_23731 ) ) ( not ( = ?auto_23729 ?auto_23733 ) ) ( not ( = ?auto_23735 ?auto_23734 ) ) ( not ( = ?auto_23727 ?auto_23731 ) ) ( not ( = ?auto_23716 ?auto_23719 ) ) ( not ( = ?auto_23716 ?auto_23732 ) ) ( not ( = ?auto_23717 ?auto_23719 ) ) ( not ( = ?auto_23717 ?auto_23732 ) ) ( not ( = ?auto_23719 ?auto_23727 ) ) ( not ( = ?auto_23719 ?auto_23731 ) ) ( not ( = ?auto_23730 ?auto_23729 ) ) ( not ( = ?auto_23730 ?auto_23733 ) ) ( not ( = ?auto_23728 ?auto_23735 ) ) ( not ( = ?auto_23728 ?auto_23734 ) ) ( not ( = ?auto_23732 ?auto_23727 ) ) ( not ( = ?auto_23732 ?auto_23731 ) ) ( not ( = ?auto_23716 ?auto_23720 ) ) ( not ( = ?auto_23716 ?auto_23726 ) ) ( not ( = ?auto_23717 ?auto_23720 ) ) ( not ( = ?auto_23717 ?auto_23726 ) ) ( not ( = ?auto_23718 ?auto_23720 ) ) ( not ( = ?auto_23718 ?auto_23726 ) ) ( not ( = ?auto_23720 ?auto_23732 ) ) ( not ( = ?auto_23720 ?auto_23727 ) ) ( not ( = ?auto_23720 ?auto_23731 ) ) ( not ( = ?auto_23724 ?auto_23730 ) ) ( not ( = ?auto_23724 ?auto_23729 ) ) ( not ( = ?auto_23724 ?auto_23733 ) ) ( not ( = ?auto_23723 ?auto_23728 ) ) ( not ( = ?auto_23723 ?auto_23735 ) ) ( not ( = ?auto_23723 ?auto_23734 ) ) ( not ( = ?auto_23726 ?auto_23732 ) ) ( not ( = ?auto_23726 ?auto_23727 ) ) ( not ( = ?auto_23726 ?auto_23731 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_23716 ?auto_23717 ?auto_23718 ?auto_23719 )
      ( MAKE-1CRATE ?auto_23719 ?auto_23720 )
      ( MAKE-4CRATE-VERIFY ?auto_23716 ?auto_23717 ?auto_23718 ?auto_23719 ?auto_23720 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23752 - SURFACE
      ?auto_23753 - SURFACE
      ?auto_23754 - SURFACE
      ?auto_23755 - SURFACE
      ?auto_23756 - SURFACE
      ?auto_23757 - SURFACE
    )
    :vars
    (
      ?auto_23760 - HOIST
      ?auto_23758 - PLACE
      ?auto_23762 - PLACE
      ?auto_23763 - HOIST
      ?auto_23759 - SURFACE
      ?auto_23771 - PLACE
      ?auto_23770 - HOIST
      ?auto_23772 - SURFACE
      ?auto_23768 - SURFACE
      ?auto_23765 - PLACE
      ?auto_23764 - HOIST
      ?auto_23769 - SURFACE
      ?auto_23773 - PLACE
      ?auto_23766 - HOIST
      ?auto_23767 - SURFACE
      ?auto_23761 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23760 ?auto_23758 ) ( IS-CRATE ?auto_23757 ) ( not ( = ?auto_23762 ?auto_23758 ) ) ( HOIST-AT ?auto_23763 ?auto_23762 ) ( SURFACE-AT ?auto_23757 ?auto_23762 ) ( ON ?auto_23757 ?auto_23759 ) ( CLEAR ?auto_23757 ) ( not ( = ?auto_23756 ?auto_23757 ) ) ( not ( = ?auto_23756 ?auto_23759 ) ) ( not ( = ?auto_23757 ?auto_23759 ) ) ( not ( = ?auto_23760 ?auto_23763 ) ) ( IS-CRATE ?auto_23756 ) ( not ( = ?auto_23771 ?auto_23758 ) ) ( HOIST-AT ?auto_23770 ?auto_23771 ) ( AVAILABLE ?auto_23770 ) ( SURFACE-AT ?auto_23756 ?auto_23771 ) ( ON ?auto_23756 ?auto_23772 ) ( CLEAR ?auto_23756 ) ( not ( = ?auto_23755 ?auto_23756 ) ) ( not ( = ?auto_23755 ?auto_23772 ) ) ( not ( = ?auto_23756 ?auto_23772 ) ) ( not ( = ?auto_23760 ?auto_23770 ) ) ( IS-CRATE ?auto_23755 ) ( AVAILABLE ?auto_23763 ) ( SURFACE-AT ?auto_23755 ?auto_23762 ) ( ON ?auto_23755 ?auto_23768 ) ( CLEAR ?auto_23755 ) ( not ( = ?auto_23754 ?auto_23755 ) ) ( not ( = ?auto_23754 ?auto_23768 ) ) ( not ( = ?auto_23755 ?auto_23768 ) ) ( IS-CRATE ?auto_23754 ) ( not ( = ?auto_23765 ?auto_23758 ) ) ( HOIST-AT ?auto_23764 ?auto_23765 ) ( AVAILABLE ?auto_23764 ) ( SURFACE-AT ?auto_23754 ?auto_23765 ) ( ON ?auto_23754 ?auto_23769 ) ( CLEAR ?auto_23754 ) ( not ( = ?auto_23753 ?auto_23754 ) ) ( not ( = ?auto_23753 ?auto_23769 ) ) ( not ( = ?auto_23754 ?auto_23769 ) ) ( not ( = ?auto_23760 ?auto_23764 ) ) ( SURFACE-AT ?auto_23752 ?auto_23758 ) ( CLEAR ?auto_23752 ) ( IS-CRATE ?auto_23753 ) ( AVAILABLE ?auto_23760 ) ( not ( = ?auto_23773 ?auto_23758 ) ) ( HOIST-AT ?auto_23766 ?auto_23773 ) ( AVAILABLE ?auto_23766 ) ( SURFACE-AT ?auto_23753 ?auto_23773 ) ( ON ?auto_23753 ?auto_23767 ) ( CLEAR ?auto_23753 ) ( TRUCK-AT ?auto_23761 ?auto_23758 ) ( not ( = ?auto_23752 ?auto_23753 ) ) ( not ( = ?auto_23752 ?auto_23767 ) ) ( not ( = ?auto_23753 ?auto_23767 ) ) ( not ( = ?auto_23760 ?auto_23766 ) ) ( not ( = ?auto_23752 ?auto_23754 ) ) ( not ( = ?auto_23752 ?auto_23769 ) ) ( not ( = ?auto_23754 ?auto_23767 ) ) ( not ( = ?auto_23765 ?auto_23773 ) ) ( not ( = ?auto_23764 ?auto_23766 ) ) ( not ( = ?auto_23769 ?auto_23767 ) ) ( not ( = ?auto_23752 ?auto_23755 ) ) ( not ( = ?auto_23752 ?auto_23768 ) ) ( not ( = ?auto_23753 ?auto_23755 ) ) ( not ( = ?auto_23753 ?auto_23768 ) ) ( not ( = ?auto_23755 ?auto_23769 ) ) ( not ( = ?auto_23755 ?auto_23767 ) ) ( not ( = ?auto_23762 ?auto_23765 ) ) ( not ( = ?auto_23762 ?auto_23773 ) ) ( not ( = ?auto_23763 ?auto_23764 ) ) ( not ( = ?auto_23763 ?auto_23766 ) ) ( not ( = ?auto_23768 ?auto_23769 ) ) ( not ( = ?auto_23768 ?auto_23767 ) ) ( not ( = ?auto_23752 ?auto_23756 ) ) ( not ( = ?auto_23752 ?auto_23772 ) ) ( not ( = ?auto_23753 ?auto_23756 ) ) ( not ( = ?auto_23753 ?auto_23772 ) ) ( not ( = ?auto_23754 ?auto_23756 ) ) ( not ( = ?auto_23754 ?auto_23772 ) ) ( not ( = ?auto_23756 ?auto_23768 ) ) ( not ( = ?auto_23756 ?auto_23769 ) ) ( not ( = ?auto_23756 ?auto_23767 ) ) ( not ( = ?auto_23771 ?auto_23762 ) ) ( not ( = ?auto_23771 ?auto_23765 ) ) ( not ( = ?auto_23771 ?auto_23773 ) ) ( not ( = ?auto_23770 ?auto_23763 ) ) ( not ( = ?auto_23770 ?auto_23764 ) ) ( not ( = ?auto_23770 ?auto_23766 ) ) ( not ( = ?auto_23772 ?auto_23768 ) ) ( not ( = ?auto_23772 ?auto_23769 ) ) ( not ( = ?auto_23772 ?auto_23767 ) ) ( not ( = ?auto_23752 ?auto_23757 ) ) ( not ( = ?auto_23752 ?auto_23759 ) ) ( not ( = ?auto_23753 ?auto_23757 ) ) ( not ( = ?auto_23753 ?auto_23759 ) ) ( not ( = ?auto_23754 ?auto_23757 ) ) ( not ( = ?auto_23754 ?auto_23759 ) ) ( not ( = ?auto_23755 ?auto_23757 ) ) ( not ( = ?auto_23755 ?auto_23759 ) ) ( not ( = ?auto_23757 ?auto_23772 ) ) ( not ( = ?auto_23757 ?auto_23768 ) ) ( not ( = ?auto_23757 ?auto_23769 ) ) ( not ( = ?auto_23757 ?auto_23767 ) ) ( not ( = ?auto_23759 ?auto_23772 ) ) ( not ( = ?auto_23759 ?auto_23768 ) ) ( not ( = ?auto_23759 ?auto_23769 ) ) ( not ( = ?auto_23759 ?auto_23767 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_23752 ?auto_23753 ?auto_23754 ?auto_23755 ?auto_23756 )
      ( MAKE-1CRATE ?auto_23756 ?auto_23757 )
      ( MAKE-5CRATE-VERIFY ?auto_23752 ?auto_23753 ?auto_23754 ?auto_23755 ?auto_23756 ?auto_23757 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_23791 - SURFACE
      ?auto_23792 - SURFACE
      ?auto_23793 - SURFACE
      ?auto_23794 - SURFACE
      ?auto_23795 - SURFACE
      ?auto_23796 - SURFACE
      ?auto_23797 - SURFACE
    )
    :vars
    (
      ?auto_23803 - HOIST
      ?auto_23802 - PLACE
      ?auto_23799 - PLACE
      ?auto_23800 - HOIST
      ?auto_23801 - SURFACE
      ?auto_23807 - PLACE
      ?auto_23812 - HOIST
      ?auto_23811 - SURFACE
      ?auto_23809 - PLACE
      ?auto_23806 - HOIST
      ?auto_23804 - SURFACE
      ?auto_23805 - SURFACE
      ?auto_23815 - PLACE
      ?auto_23810 - HOIST
      ?auto_23808 - SURFACE
      ?auto_23814 - PLACE
      ?auto_23816 - HOIST
      ?auto_23813 - SURFACE
      ?auto_23798 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23803 ?auto_23802 ) ( IS-CRATE ?auto_23797 ) ( not ( = ?auto_23799 ?auto_23802 ) ) ( HOIST-AT ?auto_23800 ?auto_23799 ) ( AVAILABLE ?auto_23800 ) ( SURFACE-AT ?auto_23797 ?auto_23799 ) ( ON ?auto_23797 ?auto_23801 ) ( CLEAR ?auto_23797 ) ( not ( = ?auto_23796 ?auto_23797 ) ) ( not ( = ?auto_23796 ?auto_23801 ) ) ( not ( = ?auto_23797 ?auto_23801 ) ) ( not ( = ?auto_23803 ?auto_23800 ) ) ( IS-CRATE ?auto_23796 ) ( not ( = ?auto_23807 ?auto_23802 ) ) ( HOIST-AT ?auto_23812 ?auto_23807 ) ( SURFACE-AT ?auto_23796 ?auto_23807 ) ( ON ?auto_23796 ?auto_23811 ) ( CLEAR ?auto_23796 ) ( not ( = ?auto_23795 ?auto_23796 ) ) ( not ( = ?auto_23795 ?auto_23811 ) ) ( not ( = ?auto_23796 ?auto_23811 ) ) ( not ( = ?auto_23803 ?auto_23812 ) ) ( IS-CRATE ?auto_23795 ) ( not ( = ?auto_23809 ?auto_23802 ) ) ( HOIST-AT ?auto_23806 ?auto_23809 ) ( AVAILABLE ?auto_23806 ) ( SURFACE-AT ?auto_23795 ?auto_23809 ) ( ON ?auto_23795 ?auto_23804 ) ( CLEAR ?auto_23795 ) ( not ( = ?auto_23794 ?auto_23795 ) ) ( not ( = ?auto_23794 ?auto_23804 ) ) ( not ( = ?auto_23795 ?auto_23804 ) ) ( not ( = ?auto_23803 ?auto_23806 ) ) ( IS-CRATE ?auto_23794 ) ( AVAILABLE ?auto_23812 ) ( SURFACE-AT ?auto_23794 ?auto_23807 ) ( ON ?auto_23794 ?auto_23805 ) ( CLEAR ?auto_23794 ) ( not ( = ?auto_23793 ?auto_23794 ) ) ( not ( = ?auto_23793 ?auto_23805 ) ) ( not ( = ?auto_23794 ?auto_23805 ) ) ( IS-CRATE ?auto_23793 ) ( not ( = ?auto_23815 ?auto_23802 ) ) ( HOIST-AT ?auto_23810 ?auto_23815 ) ( AVAILABLE ?auto_23810 ) ( SURFACE-AT ?auto_23793 ?auto_23815 ) ( ON ?auto_23793 ?auto_23808 ) ( CLEAR ?auto_23793 ) ( not ( = ?auto_23792 ?auto_23793 ) ) ( not ( = ?auto_23792 ?auto_23808 ) ) ( not ( = ?auto_23793 ?auto_23808 ) ) ( not ( = ?auto_23803 ?auto_23810 ) ) ( SURFACE-AT ?auto_23791 ?auto_23802 ) ( CLEAR ?auto_23791 ) ( IS-CRATE ?auto_23792 ) ( AVAILABLE ?auto_23803 ) ( not ( = ?auto_23814 ?auto_23802 ) ) ( HOIST-AT ?auto_23816 ?auto_23814 ) ( AVAILABLE ?auto_23816 ) ( SURFACE-AT ?auto_23792 ?auto_23814 ) ( ON ?auto_23792 ?auto_23813 ) ( CLEAR ?auto_23792 ) ( TRUCK-AT ?auto_23798 ?auto_23802 ) ( not ( = ?auto_23791 ?auto_23792 ) ) ( not ( = ?auto_23791 ?auto_23813 ) ) ( not ( = ?auto_23792 ?auto_23813 ) ) ( not ( = ?auto_23803 ?auto_23816 ) ) ( not ( = ?auto_23791 ?auto_23793 ) ) ( not ( = ?auto_23791 ?auto_23808 ) ) ( not ( = ?auto_23793 ?auto_23813 ) ) ( not ( = ?auto_23815 ?auto_23814 ) ) ( not ( = ?auto_23810 ?auto_23816 ) ) ( not ( = ?auto_23808 ?auto_23813 ) ) ( not ( = ?auto_23791 ?auto_23794 ) ) ( not ( = ?auto_23791 ?auto_23805 ) ) ( not ( = ?auto_23792 ?auto_23794 ) ) ( not ( = ?auto_23792 ?auto_23805 ) ) ( not ( = ?auto_23794 ?auto_23808 ) ) ( not ( = ?auto_23794 ?auto_23813 ) ) ( not ( = ?auto_23807 ?auto_23815 ) ) ( not ( = ?auto_23807 ?auto_23814 ) ) ( not ( = ?auto_23812 ?auto_23810 ) ) ( not ( = ?auto_23812 ?auto_23816 ) ) ( not ( = ?auto_23805 ?auto_23808 ) ) ( not ( = ?auto_23805 ?auto_23813 ) ) ( not ( = ?auto_23791 ?auto_23795 ) ) ( not ( = ?auto_23791 ?auto_23804 ) ) ( not ( = ?auto_23792 ?auto_23795 ) ) ( not ( = ?auto_23792 ?auto_23804 ) ) ( not ( = ?auto_23793 ?auto_23795 ) ) ( not ( = ?auto_23793 ?auto_23804 ) ) ( not ( = ?auto_23795 ?auto_23805 ) ) ( not ( = ?auto_23795 ?auto_23808 ) ) ( not ( = ?auto_23795 ?auto_23813 ) ) ( not ( = ?auto_23809 ?auto_23807 ) ) ( not ( = ?auto_23809 ?auto_23815 ) ) ( not ( = ?auto_23809 ?auto_23814 ) ) ( not ( = ?auto_23806 ?auto_23812 ) ) ( not ( = ?auto_23806 ?auto_23810 ) ) ( not ( = ?auto_23806 ?auto_23816 ) ) ( not ( = ?auto_23804 ?auto_23805 ) ) ( not ( = ?auto_23804 ?auto_23808 ) ) ( not ( = ?auto_23804 ?auto_23813 ) ) ( not ( = ?auto_23791 ?auto_23796 ) ) ( not ( = ?auto_23791 ?auto_23811 ) ) ( not ( = ?auto_23792 ?auto_23796 ) ) ( not ( = ?auto_23792 ?auto_23811 ) ) ( not ( = ?auto_23793 ?auto_23796 ) ) ( not ( = ?auto_23793 ?auto_23811 ) ) ( not ( = ?auto_23794 ?auto_23796 ) ) ( not ( = ?auto_23794 ?auto_23811 ) ) ( not ( = ?auto_23796 ?auto_23804 ) ) ( not ( = ?auto_23796 ?auto_23805 ) ) ( not ( = ?auto_23796 ?auto_23808 ) ) ( not ( = ?auto_23796 ?auto_23813 ) ) ( not ( = ?auto_23811 ?auto_23804 ) ) ( not ( = ?auto_23811 ?auto_23805 ) ) ( not ( = ?auto_23811 ?auto_23808 ) ) ( not ( = ?auto_23811 ?auto_23813 ) ) ( not ( = ?auto_23791 ?auto_23797 ) ) ( not ( = ?auto_23791 ?auto_23801 ) ) ( not ( = ?auto_23792 ?auto_23797 ) ) ( not ( = ?auto_23792 ?auto_23801 ) ) ( not ( = ?auto_23793 ?auto_23797 ) ) ( not ( = ?auto_23793 ?auto_23801 ) ) ( not ( = ?auto_23794 ?auto_23797 ) ) ( not ( = ?auto_23794 ?auto_23801 ) ) ( not ( = ?auto_23795 ?auto_23797 ) ) ( not ( = ?auto_23795 ?auto_23801 ) ) ( not ( = ?auto_23797 ?auto_23811 ) ) ( not ( = ?auto_23797 ?auto_23804 ) ) ( not ( = ?auto_23797 ?auto_23805 ) ) ( not ( = ?auto_23797 ?auto_23808 ) ) ( not ( = ?auto_23797 ?auto_23813 ) ) ( not ( = ?auto_23799 ?auto_23807 ) ) ( not ( = ?auto_23799 ?auto_23809 ) ) ( not ( = ?auto_23799 ?auto_23815 ) ) ( not ( = ?auto_23799 ?auto_23814 ) ) ( not ( = ?auto_23800 ?auto_23812 ) ) ( not ( = ?auto_23800 ?auto_23806 ) ) ( not ( = ?auto_23800 ?auto_23810 ) ) ( not ( = ?auto_23800 ?auto_23816 ) ) ( not ( = ?auto_23801 ?auto_23811 ) ) ( not ( = ?auto_23801 ?auto_23804 ) ) ( not ( = ?auto_23801 ?auto_23805 ) ) ( not ( = ?auto_23801 ?auto_23808 ) ) ( not ( = ?auto_23801 ?auto_23813 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_23791 ?auto_23792 ?auto_23793 ?auto_23794 ?auto_23795 ?auto_23796 )
      ( MAKE-1CRATE ?auto_23796 ?auto_23797 )
      ( MAKE-6CRATE-VERIFY ?auto_23791 ?auto_23792 ?auto_23793 ?auto_23794 ?auto_23795 ?auto_23796 ?auto_23797 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_23835 - SURFACE
      ?auto_23836 - SURFACE
      ?auto_23837 - SURFACE
      ?auto_23838 - SURFACE
      ?auto_23839 - SURFACE
      ?auto_23840 - SURFACE
      ?auto_23841 - SURFACE
      ?auto_23842 - SURFACE
    )
    :vars
    (
      ?auto_23845 - HOIST
      ?auto_23844 - PLACE
      ?auto_23848 - PLACE
      ?auto_23846 - HOIST
      ?auto_23847 - SURFACE
      ?auto_23849 - PLACE
      ?auto_23852 - HOIST
      ?auto_23853 - SURFACE
      ?auto_23856 - PLACE
      ?auto_23861 - HOIST
      ?auto_23859 - SURFACE
      ?auto_23860 - PLACE
      ?auto_23858 - HOIST
      ?auto_23850 - SURFACE
      ?auto_23855 - SURFACE
      ?auto_23854 - SURFACE
      ?auto_23851 - PLACE
      ?auto_23862 - HOIST
      ?auto_23857 - SURFACE
      ?auto_23843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23845 ?auto_23844 ) ( IS-CRATE ?auto_23842 ) ( not ( = ?auto_23848 ?auto_23844 ) ) ( HOIST-AT ?auto_23846 ?auto_23848 ) ( SURFACE-AT ?auto_23842 ?auto_23848 ) ( ON ?auto_23842 ?auto_23847 ) ( CLEAR ?auto_23842 ) ( not ( = ?auto_23841 ?auto_23842 ) ) ( not ( = ?auto_23841 ?auto_23847 ) ) ( not ( = ?auto_23842 ?auto_23847 ) ) ( not ( = ?auto_23845 ?auto_23846 ) ) ( IS-CRATE ?auto_23841 ) ( not ( = ?auto_23849 ?auto_23844 ) ) ( HOIST-AT ?auto_23852 ?auto_23849 ) ( AVAILABLE ?auto_23852 ) ( SURFACE-AT ?auto_23841 ?auto_23849 ) ( ON ?auto_23841 ?auto_23853 ) ( CLEAR ?auto_23841 ) ( not ( = ?auto_23840 ?auto_23841 ) ) ( not ( = ?auto_23840 ?auto_23853 ) ) ( not ( = ?auto_23841 ?auto_23853 ) ) ( not ( = ?auto_23845 ?auto_23852 ) ) ( IS-CRATE ?auto_23840 ) ( not ( = ?auto_23856 ?auto_23844 ) ) ( HOIST-AT ?auto_23861 ?auto_23856 ) ( SURFACE-AT ?auto_23840 ?auto_23856 ) ( ON ?auto_23840 ?auto_23859 ) ( CLEAR ?auto_23840 ) ( not ( = ?auto_23839 ?auto_23840 ) ) ( not ( = ?auto_23839 ?auto_23859 ) ) ( not ( = ?auto_23840 ?auto_23859 ) ) ( not ( = ?auto_23845 ?auto_23861 ) ) ( IS-CRATE ?auto_23839 ) ( not ( = ?auto_23860 ?auto_23844 ) ) ( HOIST-AT ?auto_23858 ?auto_23860 ) ( AVAILABLE ?auto_23858 ) ( SURFACE-AT ?auto_23839 ?auto_23860 ) ( ON ?auto_23839 ?auto_23850 ) ( CLEAR ?auto_23839 ) ( not ( = ?auto_23838 ?auto_23839 ) ) ( not ( = ?auto_23838 ?auto_23850 ) ) ( not ( = ?auto_23839 ?auto_23850 ) ) ( not ( = ?auto_23845 ?auto_23858 ) ) ( IS-CRATE ?auto_23838 ) ( AVAILABLE ?auto_23861 ) ( SURFACE-AT ?auto_23838 ?auto_23856 ) ( ON ?auto_23838 ?auto_23855 ) ( CLEAR ?auto_23838 ) ( not ( = ?auto_23837 ?auto_23838 ) ) ( not ( = ?auto_23837 ?auto_23855 ) ) ( not ( = ?auto_23838 ?auto_23855 ) ) ( IS-CRATE ?auto_23837 ) ( AVAILABLE ?auto_23846 ) ( SURFACE-AT ?auto_23837 ?auto_23848 ) ( ON ?auto_23837 ?auto_23854 ) ( CLEAR ?auto_23837 ) ( not ( = ?auto_23836 ?auto_23837 ) ) ( not ( = ?auto_23836 ?auto_23854 ) ) ( not ( = ?auto_23837 ?auto_23854 ) ) ( SURFACE-AT ?auto_23835 ?auto_23844 ) ( CLEAR ?auto_23835 ) ( IS-CRATE ?auto_23836 ) ( AVAILABLE ?auto_23845 ) ( not ( = ?auto_23851 ?auto_23844 ) ) ( HOIST-AT ?auto_23862 ?auto_23851 ) ( AVAILABLE ?auto_23862 ) ( SURFACE-AT ?auto_23836 ?auto_23851 ) ( ON ?auto_23836 ?auto_23857 ) ( CLEAR ?auto_23836 ) ( TRUCK-AT ?auto_23843 ?auto_23844 ) ( not ( = ?auto_23835 ?auto_23836 ) ) ( not ( = ?auto_23835 ?auto_23857 ) ) ( not ( = ?auto_23836 ?auto_23857 ) ) ( not ( = ?auto_23845 ?auto_23862 ) ) ( not ( = ?auto_23835 ?auto_23837 ) ) ( not ( = ?auto_23835 ?auto_23854 ) ) ( not ( = ?auto_23837 ?auto_23857 ) ) ( not ( = ?auto_23848 ?auto_23851 ) ) ( not ( = ?auto_23846 ?auto_23862 ) ) ( not ( = ?auto_23854 ?auto_23857 ) ) ( not ( = ?auto_23835 ?auto_23838 ) ) ( not ( = ?auto_23835 ?auto_23855 ) ) ( not ( = ?auto_23836 ?auto_23838 ) ) ( not ( = ?auto_23836 ?auto_23855 ) ) ( not ( = ?auto_23838 ?auto_23854 ) ) ( not ( = ?auto_23838 ?auto_23857 ) ) ( not ( = ?auto_23856 ?auto_23848 ) ) ( not ( = ?auto_23856 ?auto_23851 ) ) ( not ( = ?auto_23861 ?auto_23846 ) ) ( not ( = ?auto_23861 ?auto_23862 ) ) ( not ( = ?auto_23855 ?auto_23854 ) ) ( not ( = ?auto_23855 ?auto_23857 ) ) ( not ( = ?auto_23835 ?auto_23839 ) ) ( not ( = ?auto_23835 ?auto_23850 ) ) ( not ( = ?auto_23836 ?auto_23839 ) ) ( not ( = ?auto_23836 ?auto_23850 ) ) ( not ( = ?auto_23837 ?auto_23839 ) ) ( not ( = ?auto_23837 ?auto_23850 ) ) ( not ( = ?auto_23839 ?auto_23855 ) ) ( not ( = ?auto_23839 ?auto_23854 ) ) ( not ( = ?auto_23839 ?auto_23857 ) ) ( not ( = ?auto_23860 ?auto_23856 ) ) ( not ( = ?auto_23860 ?auto_23848 ) ) ( not ( = ?auto_23860 ?auto_23851 ) ) ( not ( = ?auto_23858 ?auto_23861 ) ) ( not ( = ?auto_23858 ?auto_23846 ) ) ( not ( = ?auto_23858 ?auto_23862 ) ) ( not ( = ?auto_23850 ?auto_23855 ) ) ( not ( = ?auto_23850 ?auto_23854 ) ) ( not ( = ?auto_23850 ?auto_23857 ) ) ( not ( = ?auto_23835 ?auto_23840 ) ) ( not ( = ?auto_23835 ?auto_23859 ) ) ( not ( = ?auto_23836 ?auto_23840 ) ) ( not ( = ?auto_23836 ?auto_23859 ) ) ( not ( = ?auto_23837 ?auto_23840 ) ) ( not ( = ?auto_23837 ?auto_23859 ) ) ( not ( = ?auto_23838 ?auto_23840 ) ) ( not ( = ?auto_23838 ?auto_23859 ) ) ( not ( = ?auto_23840 ?auto_23850 ) ) ( not ( = ?auto_23840 ?auto_23855 ) ) ( not ( = ?auto_23840 ?auto_23854 ) ) ( not ( = ?auto_23840 ?auto_23857 ) ) ( not ( = ?auto_23859 ?auto_23850 ) ) ( not ( = ?auto_23859 ?auto_23855 ) ) ( not ( = ?auto_23859 ?auto_23854 ) ) ( not ( = ?auto_23859 ?auto_23857 ) ) ( not ( = ?auto_23835 ?auto_23841 ) ) ( not ( = ?auto_23835 ?auto_23853 ) ) ( not ( = ?auto_23836 ?auto_23841 ) ) ( not ( = ?auto_23836 ?auto_23853 ) ) ( not ( = ?auto_23837 ?auto_23841 ) ) ( not ( = ?auto_23837 ?auto_23853 ) ) ( not ( = ?auto_23838 ?auto_23841 ) ) ( not ( = ?auto_23838 ?auto_23853 ) ) ( not ( = ?auto_23839 ?auto_23841 ) ) ( not ( = ?auto_23839 ?auto_23853 ) ) ( not ( = ?auto_23841 ?auto_23859 ) ) ( not ( = ?auto_23841 ?auto_23850 ) ) ( not ( = ?auto_23841 ?auto_23855 ) ) ( not ( = ?auto_23841 ?auto_23854 ) ) ( not ( = ?auto_23841 ?auto_23857 ) ) ( not ( = ?auto_23849 ?auto_23856 ) ) ( not ( = ?auto_23849 ?auto_23860 ) ) ( not ( = ?auto_23849 ?auto_23848 ) ) ( not ( = ?auto_23849 ?auto_23851 ) ) ( not ( = ?auto_23852 ?auto_23861 ) ) ( not ( = ?auto_23852 ?auto_23858 ) ) ( not ( = ?auto_23852 ?auto_23846 ) ) ( not ( = ?auto_23852 ?auto_23862 ) ) ( not ( = ?auto_23853 ?auto_23859 ) ) ( not ( = ?auto_23853 ?auto_23850 ) ) ( not ( = ?auto_23853 ?auto_23855 ) ) ( not ( = ?auto_23853 ?auto_23854 ) ) ( not ( = ?auto_23853 ?auto_23857 ) ) ( not ( = ?auto_23835 ?auto_23842 ) ) ( not ( = ?auto_23835 ?auto_23847 ) ) ( not ( = ?auto_23836 ?auto_23842 ) ) ( not ( = ?auto_23836 ?auto_23847 ) ) ( not ( = ?auto_23837 ?auto_23842 ) ) ( not ( = ?auto_23837 ?auto_23847 ) ) ( not ( = ?auto_23838 ?auto_23842 ) ) ( not ( = ?auto_23838 ?auto_23847 ) ) ( not ( = ?auto_23839 ?auto_23842 ) ) ( not ( = ?auto_23839 ?auto_23847 ) ) ( not ( = ?auto_23840 ?auto_23842 ) ) ( not ( = ?auto_23840 ?auto_23847 ) ) ( not ( = ?auto_23842 ?auto_23853 ) ) ( not ( = ?auto_23842 ?auto_23859 ) ) ( not ( = ?auto_23842 ?auto_23850 ) ) ( not ( = ?auto_23842 ?auto_23855 ) ) ( not ( = ?auto_23842 ?auto_23854 ) ) ( not ( = ?auto_23842 ?auto_23857 ) ) ( not ( = ?auto_23847 ?auto_23853 ) ) ( not ( = ?auto_23847 ?auto_23859 ) ) ( not ( = ?auto_23847 ?auto_23850 ) ) ( not ( = ?auto_23847 ?auto_23855 ) ) ( not ( = ?auto_23847 ?auto_23854 ) ) ( not ( = ?auto_23847 ?auto_23857 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_23835 ?auto_23836 ?auto_23837 ?auto_23838 ?auto_23839 ?auto_23840 ?auto_23841 )
      ( MAKE-1CRATE ?auto_23841 ?auto_23842 )
      ( MAKE-7CRATE-VERIFY ?auto_23835 ?auto_23836 ?auto_23837 ?auto_23838 ?auto_23839 ?auto_23840 ?auto_23841 ?auto_23842 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_23882 - SURFACE
      ?auto_23883 - SURFACE
      ?auto_23884 - SURFACE
      ?auto_23885 - SURFACE
      ?auto_23886 - SURFACE
      ?auto_23887 - SURFACE
      ?auto_23888 - SURFACE
      ?auto_23889 - SURFACE
      ?auto_23890 - SURFACE
    )
    :vars
    (
      ?auto_23895 - HOIST
      ?auto_23894 - PLACE
      ?auto_23896 - PLACE
      ?auto_23892 - HOIST
      ?auto_23891 - SURFACE
      ?auto_23897 - PLACE
      ?auto_23911 - HOIST
      ?auto_23899 - SURFACE
      ?auto_23900 - SURFACE
      ?auto_23909 - PLACE
      ?auto_23910 - HOIST
      ?auto_23904 - SURFACE
      ?auto_23898 - PLACE
      ?auto_23905 - HOIST
      ?auto_23903 - SURFACE
      ?auto_23901 - SURFACE
      ?auto_23906 - SURFACE
      ?auto_23902 - PLACE
      ?auto_23908 - HOIST
      ?auto_23907 - SURFACE
      ?auto_23893 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23895 ?auto_23894 ) ( IS-CRATE ?auto_23890 ) ( not ( = ?auto_23896 ?auto_23894 ) ) ( HOIST-AT ?auto_23892 ?auto_23896 ) ( SURFACE-AT ?auto_23890 ?auto_23896 ) ( ON ?auto_23890 ?auto_23891 ) ( CLEAR ?auto_23890 ) ( not ( = ?auto_23889 ?auto_23890 ) ) ( not ( = ?auto_23889 ?auto_23891 ) ) ( not ( = ?auto_23890 ?auto_23891 ) ) ( not ( = ?auto_23895 ?auto_23892 ) ) ( IS-CRATE ?auto_23889 ) ( not ( = ?auto_23897 ?auto_23894 ) ) ( HOIST-AT ?auto_23911 ?auto_23897 ) ( SURFACE-AT ?auto_23889 ?auto_23897 ) ( ON ?auto_23889 ?auto_23899 ) ( CLEAR ?auto_23889 ) ( not ( = ?auto_23888 ?auto_23889 ) ) ( not ( = ?auto_23888 ?auto_23899 ) ) ( not ( = ?auto_23889 ?auto_23899 ) ) ( not ( = ?auto_23895 ?auto_23911 ) ) ( IS-CRATE ?auto_23888 ) ( AVAILABLE ?auto_23892 ) ( SURFACE-AT ?auto_23888 ?auto_23896 ) ( ON ?auto_23888 ?auto_23900 ) ( CLEAR ?auto_23888 ) ( not ( = ?auto_23887 ?auto_23888 ) ) ( not ( = ?auto_23887 ?auto_23900 ) ) ( not ( = ?auto_23888 ?auto_23900 ) ) ( IS-CRATE ?auto_23887 ) ( not ( = ?auto_23909 ?auto_23894 ) ) ( HOIST-AT ?auto_23910 ?auto_23909 ) ( SURFACE-AT ?auto_23887 ?auto_23909 ) ( ON ?auto_23887 ?auto_23904 ) ( CLEAR ?auto_23887 ) ( not ( = ?auto_23886 ?auto_23887 ) ) ( not ( = ?auto_23886 ?auto_23904 ) ) ( not ( = ?auto_23887 ?auto_23904 ) ) ( not ( = ?auto_23895 ?auto_23910 ) ) ( IS-CRATE ?auto_23886 ) ( not ( = ?auto_23898 ?auto_23894 ) ) ( HOIST-AT ?auto_23905 ?auto_23898 ) ( AVAILABLE ?auto_23905 ) ( SURFACE-AT ?auto_23886 ?auto_23898 ) ( ON ?auto_23886 ?auto_23903 ) ( CLEAR ?auto_23886 ) ( not ( = ?auto_23885 ?auto_23886 ) ) ( not ( = ?auto_23885 ?auto_23903 ) ) ( not ( = ?auto_23886 ?auto_23903 ) ) ( not ( = ?auto_23895 ?auto_23905 ) ) ( IS-CRATE ?auto_23885 ) ( AVAILABLE ?auto_23910 ) ( SURFACE-AT ?auto_23885 ?auto_23909 ) ( ON ?auto_23885 ?auto_23901 ) ( CLEAR ?auto_23885 ) ( not ( = ?auto_23884 ?auto_23885 ) ) ( not ( = ?auto_23884 ?auto_23901 ) ) ( not ( = ?auto_23885 ?auto_23901 ) ) ( IS-CRATE ?auto_23884 ) ( AVAILABLE ?auto_23911 ) ( SURFACE-AT ?auto_23884 ?auto_23897 ) ( ON ?auto_23884 ?auto_23906 ) ( CLEAR ?auto_23884 ) ( not ( = ?auto_23883 ?auto_23884 ) ) ( not ( = ?auto_23883 ?auto_23906 ) ) ( not ( = ?auto_23884 ?auto_23906 ) ) ( SURFACE-AT ?auto_23882 ?auto_23894 ) ( CLEAR ?auto_23882 ) ( IS-CRATE ?auto_23883 ) ( AVAILABLE ?auto_23895 ) ( not ( = ?auto_23902 ?auto_23894 ) ) ( HOIST-AT ?auto_23908 ?auto_23902 ) ( AVAILABLE ?auto_23908 ) ( SURFACE-AT ?auto_23883 ?auto_23902 ) ( ON ?auto_23883 ?auto_23907 ) ( CLEAR ?auto_23883 ) ( TRUCK-AT ?auto_23893 ?auto_23894 ) ( not ( = ?auto_23882 ?auto_23883 ) ) ( not ( = ?auto_23882 ?auto_23907 ) ) ( not ( = ?auto_23883 ?auto_23907 ) ) ( not ( = ?auto_23895 ?auto_23908 ) ) ( not ( = ?auto_23882 ?auto_23884 ) ) ( not ( = ?auto_23882 ?auto_23906 ) ) ( not ( = ?auto_23884 ?auto_23907 ) ) ( not ( = ?auto_23897 ?auto_23902 ) ) ( not ( = ?auto_23911 ?auto_23908 ) ) ( not ( = ?auto_23906 ?auto_23907 ) ) ( not ( = ?auto_23882 ?auto_23885 ) ) ( not ( = ?auto_23882 ?auto_23901 ) ) ( not ( = ?auto_23883 ?auto_23885 ) ) ( not ( = ?auto_23883 ?auto_23901 ) ) ( not ( = ?auto_23885 ?auto_23906 ) ) ( not ( = ?auto_23885 ?auto_23907 ) ) ( not ( = ?auto_23909 ?auto_23897 ) ) ( not ( = ?auto_23909 ?auto_23902 ) ) ( not ( = ?auto_23910 ?auto_23911 ) ) ( not ( = ?auto_23910 ?auto_23908 ) ) ( not ( = ?auto_23901 ?auto_23906 ) ) ( not ( = ?auto_23901 ?auto_23907 ) ) ( not ( = ?auto_23882 ?auto_23886 ) ) ( not ( = ?auto_23882 ?auto_23903 ) ) ( not ( = ?auto_23883 ?auto_23886 ) ) ( not ( = ?auto_23883 ?auto_23903 ) ) ( not ( = ?auto_23884 ?auto_23886 ) ) ( not ( = ?auto_23884 ?auto_23903 ) ) ( not ( = ?auto_23886 ?auto_23901 ) ) ( not ( = ?auto_23886 ?auto_23906 ) ) ( not ( = ?auto_23886 ?auto_23907 ) ) ( not ( = ?auto_23898 ?auto_23909 ) ) ( not ( = ?auto_23898 ?auto_23897 ) ) ( not ( = ?auto_23898 ?auto_23902 ) ) ( not ( = ?auto_23905 ?auto_23910 ) ) ( not ( = ?auto_23905 ?auto_23911 ) ) ( not ( = ?auto_23905 ?auto_23908 ) ) ( not ( = ?auto_23903 ?auto_23901 ) ) ( not ( = ?auto_23903 ?auto_23906 ) ) ( not ( = ?auto_23903 ?auto_23907 ) ) ( not ( = ?auto_23882 ?auto_23887 ) ) ( not ( = ?auto_23882 ?auto_23904 ) ) ( not ( = ?auto_23883 ?auto_23887 ) ) ( not ( = ?auto_23883 ?auto_23904 ) ) ( not ( = ?auto_23884 ?auto_23887 ) ) ( not ( = ?auto_23884 ?auto_23904 ) ) ( not ( = ?auto_23885 ?auto_23887 ) ) ( not ( = ?auto_23885 ?auto_23904 ) ) ( not ( = ?auto_23887 ?auto_23903 ) ) ( not ( = ?auto_23887 ?auto_23901 ) ) ( not ( = ?auto_23887 ?auto_23906 ) ) ( not ( = ?auto_23887 ?auto_23907 ) ) ( not ( = ?auto_23904 ?auto_23903 ) ) ( not ( = ?auto_23904 ?auto_23901 ) ) ( not ( = ?auto_23904 ?auto_23906 ) ) ( not ( = ?auto_23904 ?auto_23907 ) ) ( not ( = ?auto_23882 ?auto_23888 ) ) ( not ( = ?auto_23882 ?auto_23900 ) ) ( not ( = ?auto_23883 ?auto_23888 ) ) ( not ( = ?auto_23883 ?auto_23900 ) ) ( not ( = ?auto_23884 ?auto_23888 ) ) ( not ( = ?auto_23884 ?auto_23900 ) ) ( not ( = ?auto_23885 ?auto_23888 ) ) ( not ( = ?auto_23885 ?auto_23900 ) ) ( not ( = ?auto_23886 ?auto_23888 ) ) ( not ( = ?auto_23886 ?auto_23900 ) ) ( not ( = ?auto_23888 ?auto_23904 ) ) ( not ( = ?auto_23888 ?auto_23903 ) ) ( not ( = ?auto_23888 ?auto_23901 ) ) ( not ( = ?auto_23888 ?auto_23906 ) ) ( not ( = ?auto_23888 ?auto_23907 ) ) ( not ( = ?auto_23896 ?auto_23909 ) ) ( not ( = ?auto_23896 ?auto_23898 ) ) ( not ( = ?auto_23896 ?auto_23897 ) ) ( not ( = ?auto_23896 ?auto_23902 ) ) ( not ( = ?auto_23892 ?auto_23910 ) ) ( not ( = ?auto_23892 ?auto_23905 ) ) ( not ( = ?auto_23892 ?auto_23911 ) ) ( not ( = ?auto_23892 ?auto_23908 ) ) ( not ( = ?auto_23900 ?auto_23904 ) ) ( not ( = ?auto_23900 ?auto_23903 ) ) ( not ( = ?auto_23900 ?auto_23901 ) ) ( not ( = ?auto_23900 ?auto_23906 ) ) ( not ( = ?auto_23900 ?auto_23907 ) ) ( not ( = ?auto_23882 ?auto_23889 ) ) ( not ( = ?auto_23882 ?auto_23899 ) ) ( not ( = ?auto_23883 ?auto_23889 ) ) ( not ( = ?auto_23883 ?auto_23899 ) ) ( not ( = ?auto_23884 ?auto_23889 ) ) ( not ( = ?auto_23884 ?auto_23899 ) ) ( not ( = ?auto_23885 ?auto_23889 ) ) ( not ( = ?auto_23885 ?auto_23899 ) ) ( not ( = ?auto_23886 ?auto_23889 ) ) ( not ( = ?auto_23886 ?auto_23899 ) ) ( not ( = ?auto_23887 ?auto_23889 ) ) ( not ( = ?auto_23887 ?auto_23899 ) ) ( not ( = ?auto_23889 ?auto_23900 ) ) ( not ( = ?auto_23889 ?auto_23904 ) ) ( not ( = ?auto_23889 ?auto_23903 ) ) ( not ( = ?auto_23889 ?auto_23901 ) ) ( not ( = ?auto_23889 ?auto_23906 ) ) ( not ( = ?auto_23889 ?auto_23907 ) ) ( not ( = ?auto_23899 ?auto_23900 ) ) ( not ( = ?auto_23899 ?auto_23904 ) ) ( not ( = ?auto_23899 ?auto_23903 ) ) ( not ( = ?auto_23899 ?auto_23901 ) ) ( not ( = ?auto_23899 ?auto_23906 ) ) ( not ( = ?auto_23899 ?auto_23907 ) ) ( not ( = ?auto_23882 ?auto_23890 ) ) ( not ( = ?auto_23882 ?auto_23891 ) ) ( not ( = ?auto_23883 ?auto_23890 ) ) ( not ( = ?auto_23883 ?auto_23891 ) ) ( not ( = ?auto_23884 ?auto_23890 ) ) ( not ( = ?auto_23884 ?auto_23891 ) ) ( not ( = ?auto_23885 ?auto_23890 ) ) ( not ( = ?auto_23885 ?auto_23891 ) ) ( not ( = ?auto_23886 ?auto_23890 ) ) ( not ( = ?auto_23886 ?auto_23891 ) ) ( not ( = ?auto_23887 ?auto_23890 ) ) ( not ( = ?auto_23887 ?auto_23891 ) ) ( not ( = ?auto_23888 ?auto_23890 ) ) ( not ( = ?auto_23888 ?auto_23891 ) ) ( not ( = ?auto_23890 ?auto_23899 ) ) ( not ( = ?auto_23890 ?auto_23900 ) ) ( not ( = ?auto_23890 ?auto_23904 ) ) ( not ( = ?auto_23890 ?auto_23903 ) ) ( not ( = ?auto_23890 ?auto_23901 ) ) ( not ( = ?auto_23890 ?auto_23906 ) ) ( not ( = ?auto_23890 ?auto_23907 ) ) ( not ( = ?auto_23891 ?auto_23899 ) ) ( not ( = ?auto_23891 ?auto_23900 ) ) ( not ( = ?auto_23891 ?auto_23904 ) ) ( not ( = ?auto_23891 ?auto_23903 ) ) ( not ( = ?auto_23891 ?auto_23901 ) ) ( not ( = ?auto_23891 ?auto_23906 ) ) ( not ( = ?auto_23891 ?auto_23907 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_23882 ?auto_23883 ?auto_23884 ?auto_23885 ?auto_23886 ?auto_23887 ?auto_23888 ?auto_23889 )
      ( MAKE-1CRATE ?auto_23889 ?auto_23890 )
      ( MAKE-8CRATE-VERIFY ?auto_23882 ?auto_23883 ?auto_23884 ?auto_23885 ?auto_23886 ?auto_23887 ?auto_23888 ?auto_23889 ?auto_23890 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_23932 - SURFACE
      ?auto_23933 - SURFACE
      ?auto_23934 - SURFACE
      ?auto_23935 - SURFACE
      ?auto_23936 - SURFACE
      ?auto_23937 - SURFACE
      ?auto_23938 - SURFACE
      ?auto_23939 - SURFACE
      ?auto_23940 - SURFACE
      ?auto_23941 - SURFACE
    )
    :vars
    (
      ?auto_23944 - HOIST
      ?auto_23946 - PLACE
      ?auto_23945 - PLACE
      ?auto_23943 - HOIST
      ?auto_23947 - SURFACE
      ?auto_23950 - PLACE
      ?auto_23963 - HOIST
      ?auto_23949 - SURFACE
      ?auto_23959 - PLACE
      ?auto_23952 - HOIST
      ?auto_23954 - SURFACE
      ?auto_23955 - SURFACE
      ?auto_23958 - PLACE
      ?auto_23948 - HOIST
      ?auto_23953 - SURFACE
      ?auto_23956 - SURFACE
      ?auto_23962 - SURFACE
      ?auto_23951 - SURFACE
      ?auto_23961 - PLACE
      ?auto_23960 - HOIST
      ?auto_23957 - SURFACE
      ?auto_23942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23944 ?auto_23946 ) ( IS-CRATE ?auto_23941 ) ( not ( = ?auto_23945 ?auto_23946 ) ) ( HOIST-AT ?auto_23943 ?auto_23945 ) ( SURFACE-AT ?auto_23941 ?auto_23945 ) ( ON ?auto_23941 ?auto_23947 ) ( CLEAR ?auto_23941 ) ( not ( = ?auto_23940 ?auto_23941 ) ) ( not ( = ?auto_23940 ?auto_23947 ) ) ( not ( = ?auto_23941 ?auto_23947 ) ) ( not ( = ?auto_23944 ?auto_23943 ) ) ( IS-CRATE ?auto_23940 ) ( not ( = ?auto_23950 ?auto_23946 ) ) ( HOIST-AT ?auto_23963 ?auto_23950 ) ( SURFACE-AT ?auto_23940 ?auto_23950 ) ( ON ?auto_23940 ?auto_23949 ) ( CLEAR ?auto_23940 ) ( not ( = ?auto_23939 ?auto_23940 ) ) ( not ( = ?auto_23939 ?auto_23949 ) ) ( not ( = ?auto_23940 ?auto_23949 ) ) ( not ( = ?auto_23944 ?auto_23963 ) ) ( IS-CRATE ?auto_23939 ) ( not ( = ?auto_23959 ?auto_23946 ) ) ( HOIST-AT ?auto_23952 ?auto_23959 ) ( SURFACE-AT ?auto_23939 ?auto_23959 ) ( ON ?auto_23939 ?auto_23954 ) ( CLEAR ?auto_23939 ) ( not ( = ?auto_23938 ?auto_23939 ) ) ( not ( = ?auto_23938 ?auto_23954 ) ) ( not ( = ?auto_23939 ?auto_23954 ) ) ( not ( = ?auto_23944 ?auto_23952 ) ) ( IS-CRATE ?auto_23938 ) ( AVAILABLE ?auto_23963 ) ( SURFACE-AT ?auto_23938 ?auto_23950 ) ( ON ?auto_23938 ?auto_23955 ) ( CLEAR ?auto_23938 ) ( not ( = ?auto_23937 ?auto_23938 ) ) ( not ( = ?auto_23937 ?auto_23955 ) ) ( not ( = ?auto_23938 ?auto_23955 ) ) ( IS-CRATE ?auto_23937 ) ( not ( = ?auto_23958 ?auto_23946 ) ) ( HOIST-AT ?auto_23948 ?auto_23958 ) ( SURFACE-AT ?auto_23937 ?auto_23958 ) ( ON ?auto_23937 ?auto_23953 ) ( CLEAR ?auto_23937 ) ( not ( = ?auto_23936 ?auto_23937 ) ) ( not ( = ?auto_23936 ?auto_23953 ) ) ( not ( = ?auto_23937 ?auto_23953 ) ) ( not ( = ?auto_23944 ?auto_23948 ) ) ( IS-CRATE ?auto_23936 ) ( AVAILABLE ?auto_23943 ) ( SURFACE-AT ?auto_23936 ?auto_23945 ) ( ON ?auto_23936 ?auto_23956 ) ( CLEAR ?auto_23936 ) ( not ( = ?auto_23935 ?auto_23936 ) ) ( not ( = ?auto_23935 ?auto_23956 ) ) ( not ( = ?auto_23936 ?auto_23956 ) ) ( IS-CRATE ?auto_23935 ) ( AVAILABLE ?auto_23948 ) ( SURFACE-AT ?auto_23935 ?auto_23958 ) ( ON ?auto_23935 ?auto_23962 ) ( CLEAR ?auto_23935 ) ( not ( = ?auto_23934 ?auto_23935 ) ) ( not ( = ?auto_23934 ?auto_23962 ) ) ( not ( = ?auto_23935 ?auto_23962 ) ) ( IS-CRATE ?auto_23934 ) ( AVAILABLE ?auto_23952 ) ( SURFACE-AT ?auto_23934 ?auto_23959 ) ( ON ?auto_23934 ?auto_23951 ) ( CLEAR ?auto_23934 ) ( not ( = ?auto_23933 ?auto_23934 ) ) ( not ( = ?auto_23933 ?auto_23951 ) ) ( not ( = ?auto_23934 ?auto_23951 ) ) ( SURFACE-AT ?auto_23932 ?auto_23946 ) ( CLEAR ?auto_23932 ) ( IS-CRATE ?auto_23933 ) ( AVAILABLE ?auto_23944 ) ( not ( = ?auto_23961 ?auto_23946 ) ) ( HOIST-AT ?auto_23960 ?auto_23961 ) ( AVAILABLE ?auto_23960 ) ( SURFACE-AT ?auto_23933 ?auto_23961 ) ( ON ?auto_23933 ?auto_23957 ) ( CLEAR ?auto_23933 ) ( TRUCK-AT ?auto_23942 ?auto_23946 ) ( not ( = ?auto_23932 ?auto_23933 ) ) ( not ( = ?auto_23932 ?auto_23957 ) ) ( not ( = ?auto_23933 ?auto_23957 ) ) ( not ( = ?auto_23944 ?auto_23960 ) ) ( not ( = ?auto_23932 ?auto_23934 ) ) ( not ( = ?auto_23932 ?auto_23951 ) ) ( not ( = ?auto_23934 ?auto_23957 ) ) ( not ( = ?auto_23959 ?auto_23961 ) ) ( not ( = ?auto_23952 ?auto_23960 ) ) ( not ( = ?auto_23951 ?auto_23957 ) ) ( not ( = ?auto_23932 ?auto_23935 ) ) ( not ( = ?auto_23932 ?auto_23962 ) ) ( not ( = ?auto_23933 ?auto_23935 ) ) ( not ( = ?auto_23933 ?auto_23962 ) ) ( not ( = ?auto_23935 ?auto_23951 ) ) ( not ( = ?auto_23935 ?auto_23957 ) ) ( not ( = ?auto_23958 ?auto_23959 ) ) ( not ( = ?auto_23958 ?auto_23961 ) ) ( not ( = ?auto_23948 ?auto_23952 ) ) ( not ( = ?auto_23948 ?auto_23960 ) ) ( not ( = ?auto_23962 ?auto_23951 ) ) ( not ( = ?auto_23962 ?auto_23957 ) ) ( not ( = ?auto_23932 ?auto_23936 ) ) ( not ( = ?auto_23932 ?auto_23956 ) ) ( not ( = ?auto_23933 ?auto_23936 ) ) ( not ( = ?auto_23933 ?auto_23956 ) ) ( not ( = ?auto_23934 ?auto_23936 ) ) ( not ( = ?auto_23934 ?auto_23956 ) ) ( not ( = ?auto_23936 ?auto_23962 ) ) ( not ( = ?auto_23936 ?auto_23951 ) ) ( not ( = ?auto_23936 ?auto_23957 ) ) ( not ( = ?auto_23945 ?auto_23958 ) ) ( not ( = ?auto_23945 ?auto_23959 ) ) ( not ( = ?auto_23945 ?auto_23961 ) ) ( not ( = ?auto_23943 ?auto_23948 ) ) ( not ( = ?auto_23943 ?auto_23952 ) ) ( not ( = ?auto_23943 ?auto_23960 ) ) ( not ( = ?auto_23956 ?auto_23962 ) ) ( not ( = ?auto_23956 ?auto_23951 ) ) ( not ( = ?auto_23956 ?auto_23957 ) ) ( not ( = ?auto_23932 ?auto_23937 ) ) ( not ( = ?auto_23932 ?auto_23953 ) ) ( not ( = ?auto_23933 ?auto_23937 ) ) ( not ( = ?auto_23933 ?auto_23953 ) ) ( not ( = ?auto_23934 ?auto_23937 ) ) ( not ( = ?auto_23934 ?auto_23953 ) ) ( not ( = ?auto_23935 ?auto_23937 ) ) ( not ( = ?auto_23935 ?auto_23953 ) ) ( not ( = ?auto_23937 ?auto_23956 ) ) ( not ( = ?auto_23937 ?auto_23962 ) ) ( not ( = ?auto_23937 ?auto_23951 ) ) ( not ( = ?auto_23937 ?auto_23957 ) ) ( not ( = ?auto_23953 ?auto_23956 ) ) ( not ( = ?auto_23953 ?auto_23962 ) ) ( not ( = ?auto_23953 ?auto_23951 ) ) ( not ( = ?auto_23953 ?auto_23957 ) ) ( not ( = ?auto_23932 ?auto_23938 ) ) ( not ( = ?auto_23932 ?auto_23955 ) ) ( not ( = ?auto_23933 ?auto_23938 ) ) ( not ( = ?auto_23933 ?auto_23955 ) ) ( not ( = ?auto_23934 ?auto_23938 ) ) ( not ( = ?auto_23934 ?auto_23955 ) ) ( not ( = ?auto_23935 ?auto_23938 ) ) ( not ( = ?auto_23935 ?auto_23955 ) ) ( not ( = ?auto_23936 ?auto_23938 ) ) ( not ( = ?auto_23936 ?auto_23955 ) ) ( not ( = ?auto_23938 ?auto_23953 ) ) ( not ( = ?auto_23938 ?auto_23956 ) ) ( not ( = ?auto_23938 ?auto_23962 ) ) ( not ( = ?auto_23938 ?auto_23951 ) ) ( not ( = ?auto_23938 ?auto_23957 ) ) ( not ( = ?auto_23950 ?auto_23958 ) ) ( not ( = ?auto_23950 ?auto_23945 ) ) ( not ( = ?auto_23950 ?auto_23959 ) ) ( not ( = ?auto_23950 ?auto_23961 ) ) ( not ( = ?auto_23963 ?auto_23948 ) ) ( not ( = ?auto_23963 ?auto_23943 ) ) ( not ( = ?auto_23963 ?auto_23952 ) ) ( not ( = ?auto_23963 ?auto_23960 ) ) ( not ( = ?auto_23955 ?auto_23953 ) ) ( not ( = ?auto_23955 ?auto_23956 ) ) ( not ( = ?auto_23955 ?auto_23962 ) ) ( not ( = ?auto_23955 ?auto_23951 ) ) ( not ( = ?auto_23955 ?auto_23957 ) ) ( not ( = ?auto_23932 ?auto_23939 ) ) ( not ( = ?auto_23932 ?auto_23954 ) ) ( not ( = ?auto_23933 ?auto_23939 ) ) ( not ( = ?auto_23933 ?auto_23954 ) ) ( not ( = ?auto_23934 ?auto_23939 ) ) ( not ( = ?auto_23934 ?auto_23954 ) ) ( not ( = ?auto_23935 ?auto_23939 ) ) ( not ( = ?auto_23935 ?auto_23954 ) ) ( not ( = ?auto_23936 ?auto_23939 ) ) ( not ( = ?auto_23936 ?auto_23954 ) ) ( not ( = ?auto_23937 ?auto_23939 ) ) ( not ( = ?auto_23937 ?auto_23954 ) ) ( not ( = ?auto_23939 ?auto_23955 ) ) ( not ( = ?auto_23939 ?auto_23953 ) ) ( not ( = ?auto_23939 ?auto_23956 ) ) ( not ( = ?auto_23939 ?auto_23962 ) ) ( not ( = ?auto_23939 ?auto_23951 ) ) ( not ( = ?auto_23939 ?auto_23957 ) ) ( not ( = ?auto_23954 ?auto_23955 ) ) ( not ( = ?auto_23954 ?auto_23953 ) ) ( not ( = ?auto_23954 ?auto_23956 ) ) ( not ( = ?auto_23954 ?auto_23962 ) ) ( not ( = ?auto_23954 ?auto_23951 ) ) ( not ( = ?auto_23954 ?auto_23957 ) ) ( not ( = ?auto_23932 ?auto_23940 ) ) ( not ( = ?auto_23932 ?auto_23949 ) ) ( not ( = ?auto_23933 ?auto_23940 ) ) ( not ( = ?auto_23933 ?auto_23949 ) ) ( not ( = ?auto_23934 ?auto_23940 ) ) ( not ( = ?auto_23934 ?auto_23949 ) ) ( not ( = ?auto_23935 ?auto_23940 ) ) ( not ( = ?auto_23935 ?auto_23949 ) ) ( not ( = ?auto_23936 ?auto_23940 ) ) ( not ( = ?auto_23936 ?auto_23949 ) ) ( not ( = ?auto_23937 ?auto_23940 ) ) ( not ( = ?auto_23937 ?auto_23949 ) ) ( not ( = ?auto_23938 ?auto_23940 ) ) ( not ( = ?auto_23938 ?auto_23949 ) ) ( not ( = ?auto_23940 ?auto_23954 ) ) ( not ( = ?auto_23940 ?auto_23955 ) ) ( not ( = ?auto_23940 ?auto_23953 ) ) ( not ( = ?auto_23940 ?auto_23956 ) ) ( not ( = ?auto_23940 ?auto_23962 ) ) ( not ( = ?auto_23940 ?auto_23951 ) ) ( not ( = ?auto_23940 ?auto_23957 ) ) ( not ( = ?auto_23949 ?auto_23954 ) ) ( not ( = ?auto_23949 ?auto_23955 ) ) ( not ( = ?auto_23949 ?auto_23953 ) ) ( not ( = ?auto_23949 ?auto_23956 ) ) ( not ( = ?auto_23949 ?auto_23962 ) ) ( not ( = ?auto_23949 ?auto_23951 ) ) ( not ( = ?auto_23949 ?auto_23957 ) ) ( not ( = ?auto_23932 ?auto_23941 ) ) ( not ( = ?auto_23932 ?auto_23947 ) ) ( not ( = ?auto_23933 ?auto_23941 ) ) ( not ( = ?auto_23933 ?auto_23947 ) ) ( not ( = ?auto_23934 ?auto_23941 ) ) ( not ( = ?auto_23934 ?auto_23947 ) ) ( not ( = ?auto_23935 ?auto_23941 ) ) ( not ( = ?auto_23935 ?auto_23947 ) ) ( not ( = ?auto_23936 ?auto_23941 ) ) ( not ( = ?auto_23936 ?auto_23947 ) ) ( not ( = ?auto_23937 ?auto_23941 ) ) ( not ( = ?auto_23937 ?auto_23947 ) ) ( not ( = ?auto_23938 ?auto_23941 ) ) ( not ( = ?auto_23938 ?auto_23947 ) ) ( not ( = ?auto_23939 ?auto_23941 ) ) ( not ( = ?auto_23939 ?auto_23947 ) ) ( not ( = ?auto_23941 ?auto_23949 ) ) ( not ( = ?auto_23941 ?auto_23954 ) ) ( not ( = ?auto_23941 ?auto_23955 ) ) ( not ( = ?auto_23941 ?auto_23953 ) ) ( not ( = ?auto_23941 ?auto_23956 ) ) ( not ( = ?auto_23941 ?auto_23962 ) ) ( not ( = ?auto_23941 ?auto_23951 ) ) ( not ( = ?auto_23941 ?auto_23957 ) ) ( not ( = ?auto_23947 ?auto_23949 ) ) ( not ( = ?auto_23947 ?auto_23954 ) ) ( not ( = ?auto_23947 ?auto_23955 ) ) ( not ( = ?auto_23947 ?auto_23953 ) ) ( not ( = ?auto_23947 ?auto_23956 ) ) ( not ( = ?auto_23947 ?auto_23962 ) ) ( not ( = ?auto_23947 ?auto_23951 ) ) ( not ( = ?auto_23947 ?auto_23957 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_23932 ?auto_23933 ?auto_23934 ?auto_23935 ?auto_23936 ?auto_23937 ?auto_23938 ?auto_23939 ?auto_23940 )
      ( MAKE-1CRATE ?auto_23940 ?auto_23941 )
      ( MAKE-9CRATE-VERIFY ?auto_23932 ?auto_23933 ?auto_23934 ?auto_23935 ?auto_23936 ?auto_23937 ?auto_23938 ?auto_23939 ?auto_23940 ?auto_23941 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_23985 - SURFACE
      ?auto_23986 - SURFACE
      ?auto_23987 - SURFACE
      ?auto_23988 - SURFACE
      ?auto_23989 - SURFACE
      ?auto_23990 - SURFACE
      ?auto_23991 - SURFACE
      ?auto_23992 - SURFACE
      ?auto_23993 - SURFACE
      ?auto_23994 - SURFACE
      ?auto_23995 - SURFACE
    )
    :vars
    (
      ?auto_23996 - HOIST
      ?auto_23997 - PLACE
      ?auto_23998 - PLACE
      ?auto_24001 - HOIST
      ?auto_24000 - SURFACE
      ?auto_24009 - PLACE
      ?auto_24016 - HOIST
      ?auto_24017 - SURFACE
      ?auto_24002 - PLACE
      ?auto_24010 - HOIST
      ?auto_24019 - SURFACE
      ?auto_24020 - PLACE
      ?auto_24014 - HOIST
      ?auto_24003 - SURFACE
      ?auto_24013 - SURFACE
      ?auto_24015 - PLACE
      ?auto_24018 - HOIST
      ?auto_24008 - SURFACE
      ?auto_24011 - SURFACE
      ?auto_24006 - SURFACE
      ?auto_24005 - SURFACE
      ?auto_24012 - PLACE
      ?auto_24004 - HOIST
      ?auto_24007 - SURFACE
      ?auto_23999 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23996 ?auto_23997 ) ( IS-CRATE ?auto_23995 ) ( not ( = ?auto_23998 ?auto_23997 ) ) ( HOIST-AT ?auto_24001 ?auto_23998 ) ( AVAILABLE ?auto_24001 ) ( SURFACE-AT ?auto_23995 ?auto_23998 ) ( ON ?auto_23995 ?auto_24000 ) ( CLEAR ?auto_23995 ) ( not ( = ?auto_23994 ?auto_23995 ) ) ( not ( = ?auto_23994 ?auto_24000 ) ) ( not ( = ?auto_23995 ?auto_24000 ) ) ( not ( = ?auto_23996 ?auto_24001 ) ) ( IS-CRATE ?auto_23994 ) ( not ( = ?auto_24009 ?auto_23997 ) ) ( HOIST-AT ?auto_24016 ?auto_24009 ) ( SURFACE-AT ?auto_23994 ?auto_24009 ) ( ON ?auto_23994 ?auto_24017 ) ( CLEAR ?auto_23994 ) ( not ( = ?auto_23993 ?auto_23994 ) ) ( not ( = ?auto_23993 ?auto_24017 ) ) ( not ( = ?auto_23994 ?auto_24017 ) ) ( not ( = ?auto_23996 ?auto_24016 ) ) ( IS-CRATE ?auto_23993 ) ( not ( = ?auto_24002 ?auto_23997 ) ) ( HOIST-AT ?auto_24010 ?auto_24002 ) ( SURFACE-AT ?auto_23993 ?auto_24002 ) ( ON ?auto_23993 ?auto_24019 ) ( CLEAR ?auto_23993 ) ( not ( = ?auto_23992 ?auto_23993 ) ) ( not ( = ?auto_23992 ?auto_24019 ) ) ( not ( = ?auto_23993 ?auto_24019 ) ) ( not ( = ?auto_23996 ?auto_24010 ) ) ( IS-CRATE ?auto_23992 ) ( not ( = ?auto_24020 ?auto_23997 ) ) ( HOIST-AT ?auto_24014 ?auto_24020 ) ( SURFACE-AT ?auto_23992 ?auto_24020 ) ( ON ?auto_23992 ?auto_24003 ) ( CLEAR ?auto_23992 ) ( not ( = ?auto_23991 ?auto_23992 ) ) ( not ( = ?auto_23991 ?auto_24003 ) ) ( not ( = ?auto_23992 ?auto_24003 ) ) ( not ( = ?auto_23996 ?auto_24014 ) ) ( IS-CRATE ?auto_23991 ) ( AVAILABLE ?auto_24010 ) ( SURFACE-AT ?auto_23991 ?auto_24002 ) ( ON ?auto_23991 ?auto_24013 ) ( CLEAR ?auto_23991 ) ( not ( = ?auto_23990 ?auto_23991 ) ) ( not ( = ?auto_23990 ?auto_24013 ) ) ( not ( = ?auto_23991 ?auto_24013 ) ) ( IS-CRATE ?auto_23990 ) ( not ( = ?auto_24015 ?auto_23997 ) ) ( HOIST-AT ?auto_24018 ?auto_24015 ) ( SURFACE-AT ?auto_23990 ?auto_24015 ) ( ON ?auto_23990 ?auto_24008 ) ( CLEAR ?auto_23990 ) ( not ( = ?auto_23989 ?auto_23990 ) ) ( not ( = ?auto_23989 ?auto_24008 ) ) ( not ( = ?auto_23990 ?auto_24008 ) ) ( not ( = ?auto_23996 ?auto_24018 ) ) ( IS-CRATE ?auto_23989 ) ( AVAILABLE ?auto_24016 ) ( SURFACE-AT ?auto_23989 ?auto_24009 ) ( ON ?auto_23989 ?auto_24011 ) ( CLEAR ?auto_23989 ) ( not ( = ?auto_23988 ?auto_23989 ) ) ( not ( = ?auto_23988 ?auto_24011 ) ) ( not ( = ?auto_23989 ?auto_24011 ) ) ( IS-CRATE ?auto_23988 ) ( AVAILABLE ?auto_24018 ) ( SURFACE-AT ?auto_23988 ?auto_24015 ) ( ON ?auto_23988 ?auto_24006 ) ( CLEAR ?auto_23988 ) ( not ( = ?auto_23987 ?auto_23988 ) ) ( not ( = ?auto_23987 ?auto_24006 ) ) ( not ( = ?auto_23988 ?auto_24006 ) ) ( IS-CRATE ?auto_23987 ) ( AVAILABLE ?auto_24014 ) ( SURFACE-AT ?auto_23987 ?auto_24020 ) ( ON ?auto_23987 ?auto_24005 ) ( CLEAR ?auto_23987 ) ( not ( = ?auto_23986 ?auto_23987 ) ) ( not ( = ?auto_23986 ?auto_24005 ) ) ( not ( = ?auto_23987 ?auto_24005 ) ) ( SURFACE-AT ?auto_23985 ?auto_23997 ) ( CLEAR ?auto_23985 ) ( IS-CRATE ?auto_23986 ) ( AVAILABLE ?auto_23996 ) ( not ( = ?auto_24012 ?auto_23997 ) ) ( HOIST-AT ?auto_24004 ?auto_24012 ) ( AVAILABLE ?auto_24004 ) ( SURFACE-AT ?auto_23986 ?auto_24012 ) ( ON ?auto_23986 ?auto_24007 ) ( CLEAR ?auto_23986 ) ( TRUCK-AT ?auto_23999 ?auto_23997 ) ( not ( = ?auto_23985 ?auto_23986 ) ) ( not ( = ?auto_23985 ?auto_24007 ) ) ( not ( = ?auto_23986 ?auto_24007 ) ) ( not ( = ?auto_23996 ?auto_24004 ) ) ( not ( = ?auto_23985 ?auto_23987 ) ) ( not ( = ?auto_23985 ?auto_24005 ) ) ( not ( = ?auto_23987 ?auto_24007 ) ) ( not ( = ?auto_24020 ?auto_24012 ) ) ( not ( = ?auto_24014 ?auto_24004 ) ) ( not ( = ?auto_24005 ?auto_24007 ) ) ( not ( = ?auto_23985 ?auto_23988 ) ) ( not ( = ?auto_23985 ?auto_24006 ) ) ( not ( = ?auto_23986 ?auto_23988 ) ) ( not ( = ?auto_23986 ?auto_24006 ) ) ( not ( = ?auto_23988 ?auto_24005 ) ) ( not ( = ?auto_23988 ?auto_24007 ) ) ( not ( = ?auto_24015 ?auto_24020 ) ) ( not ( = ?auto_24015 ?auto_24012 ) ) ( not ( = ?auto_24018 ?auto_24014 ) ) ( not ( = ?auto_24018 ?auto_24004 ) ) ( not ( = ?auto_24006 ?auto_24005 ) ) ( not ( = ?auto_24006 ?auto_24007 ) ) ( not ( = ?auto_23985 ?auto_23989 ) ) ( not ( = ?auto_23985 ?auto_24011 ) ) ( not ( = ?auto_23986 ?auto_23989 ) ) ( not ( = ?auto_23986 ?auto_24011 ) ) ( not ( = ?auto_23987 ?auto_23989 ) ) ( not ( = ?auto_23987 ?auto_24011 ) ) ( not ( = ?auto_23989 ?auto_24006 ) ) ( not ( = ?auto_23989 ?auto_24005 ) ) ( not ( = ?auto_23989 ?auto_24007 ) ) ( not ( = ?auto_24009 ?auto_24015 ) ) ( not ( = ?auto_24009 ?auto_24020 ) ) ( not ( = ?auto_24009 ?auto_24012 ) ) ( not ( = ?auto_24016 ?auto_24018 ) ) ( not ( = ?auto_24016 ?auto_24014 ) ) ( not ( = ?auto_24016 ?auto_24004 ) ) ( not ( = ?auto_24011 ?auto_24006 ) ) ( not ( = ?auto_24011 ?auto_24005 ) ) ( not ( = ?auto_24011 ?auto_24007 ) ) ( not ( = ?auto_23985 ?auto_23990 ) ) ( not ( = ?auto_23985 ?auto_24008 ) ) ( not ( = ?auto_23986 ?auto_23990 ) ) ( not ( = ?auto_23986 ?auto_24008 ) ) ( not ( = ?auto_23987 ?auto_23990 ) ) ( not ( = ?auto_23987 ?auto_24008 ) ) ( not ( = ?auto_23988 ?auto_23990 ) ) ( not ( = ?auto_23988 ?auto_24008 ) ) ( not ( = ?auto_23990 ?auto_24011 ) ) ( not ( = ?auto_23990 ?auto_24006 ) ) ( not ( = ?auto_23990 ?auto_24005 ) ) ( not ( = ?auto_23990 ?auto_24007 ) ) ( not ( = ?auto_24008 ?auto_24011 ) ) ( not ( = ?auto_24008 ?auto_24006 ) ) ( not ( = ?auto_24008 ?auto_24005 ) ) ( not ( = ?auto_24008 ?auto_24007 ) ) ( not ( = ?auto_23985 ?auto_23991 ) ) ( not ( = ?auto_23985 ?auto_24013 ) ) ( not ( = ?auto_23986 ?auto_23991 ) ) ( not ( = ?auto_23986 ?auto_24013 ) ) ( not ( = ?auto_23987 ?auto_23991 ) ) ( not ( = ?auto_23987 ?auto_24013 ) ) ( not ( = ?auto_23988 ?auto_23991 ) ) ( not ( = ?auto_23988 ?auto_24013 ) ) ( not ( = ?auto_23989 ?auto_23991 ) ) ( not ( = ?auto_23989 ?auto_24013 ) ) ( not ( = ?auto_23991 ?auto_24008 ) ) ( not ( = ?auto_23991 ?auto_24011 ) ) ( not ( = ?auto_23991 ?auto_24006 ) ) ( not ( = ?auto_23991 ?auto_24005 ) ) ( not ( = ?auto_23991 ?auto_24007 ) ) ( not ( = ?auto_24002 ?auto_24015 ) ) ( not ( = ?auto_24002 ?auto_24009 ) ) ( not ( = ?auto_24002 ?auto_24020 ) ) ( not ( = ?auto_24002 ?auto_24012 ) ) ( not ( = ?auto_24010 ?auto_24018 ) ) ( not ( = ?auto_24010 ?auto_24016 ) ) ( not ( = ?auto_24010 ?auto_24014 ) ) ( not ( = ?auto_24010 ?auto_24004 ) ) ( not ( = ?auto_24013 ?auto_24008 ) ) ( not ( = ?auto_24013 ?auto_24011 ) ) ( not ( = ?auto_24013 ?auto_24006 ) ) ( not ( = ?auto_24013 ?auto_24005 ) ) ( not ( = ?auto_24013 ?auto_24007 ) ) ( not ( = ?auto_23985 ?auto_23992 ) ) ( not ( = ?auto_23985 ?auto_24003 ) ) ( not ( = ?auto_23986 ?auto_23992 ) ) ( not ( = ?auto_23986 ?auto_24003 ) ) ( not ( = ?auto_23987 ?auto_23992 ) ) ( not ( = ?auto_23987 ?auto_24003 ) ) ( not ( = ?auto_23988 ?auto_23992 ) ) ( not ( = ?auto_23988 ?auto_24003 ) ) ( not ( = ?auto_23989 ?auto_23992 ) ) ( not ( = ?auto_23989 ?auto_24003 ) ) ( not ( = ?auto_23990 ?auto_23992 ) ) ( not ( = ?auto_23990 ?auto_24003 ) ) ( not ( = ?auto_23992 ?auto_24013 ) ) ( not ( = ?auto_23992 ?auto_24008 ) ) ( not ( = ?auto_23992 ?auto_24011 ) ) ( not ( = ?auto_23992 ?auto_24006 ) ) ( not ( = ?auto_23992 ?auto_24005 ) ) ( not ( = ?auto_23992 ?auto_24007 ) ) ( not ( = ?auto_24003 ?auto_24013 ) ) ( not ( = ?auto_24003 ?auto_24008 ) ) ( not ( = ?auto_24003 ?auto_24011 ) ) ( not ( = ?auto_24003 ?auto_24006 ) ) ( not ( = ?auto_24003 ?auto_24005 ) ) ( not ( = ?auto_24003 ?auto_24007 ) ) ( not ( = ?auto_23985 ?auto_23993 ) ) ( not ( = ?auto_23985 ?auto_24019 ) ) ( not ( = ?auto_23986 ?auto_23993 ) ) ( not ( = ?auto_23986 ?auto_24019 ) ) ( not ( = ?auto_23987 ?auto_23993 ) ) ( not ( = ?auto_23987 ?auto_24019 ) ) ( not ( = ?auto_23988 ?auto_23993 ) ) ( not ( = ?auto_23988 ?auto_24019 ) ) ( not ( = ?auto_23989 ?auto_23993 ) ) ( not ( = ?auto_23989 ?auto_24019 ) ) ( not ( = ?auto_23990 ?auto_23993 ) ) ( not ( = ?auto_23990 ?auto_24019 ) ) ( not ( = ?auto_23991 ?auto_23993 ) ) ( not ( = ?auto_23991 ?auto_24019 ) ) ( not ( = ?auto_23993 ?auto_24003 ) ) ( not ( = ?auto_23993 ?auto_24013 ) ) ( not ( = ?auto_23993 ?auto_24008 ) ) ( not ( = ?auto_23993 ?auto_24011 ) ) ( not ( = ?auto_23993 ?auto_24006 ) ) ( not ( = ?auto_23993 ?auto_24005 ) ) ( not ( = ?auto_23993 ?auto_24007 ) ) ( not ( = ?auto_24019 ?auto_24003 ) ) ( not ( = ?auto_24019 ?auto_24013 ) ) ( not ( = ?auto_24019 ?auto_24008 ) ) ( not ( = ?auto_24019 ?auto_24011 ) ) ( not ( = ?auto_24019 ?auto_24006 ) ) ( not ( = ?auto_24019 ?auto_24005 ) ) ( not ( = ?auto_24019 ?auto_24007 ) ) ( not ( = ?auto_23985 ?auto_23994 ) ) ( not ( = ?auto_23985 ?auto_24017 ) ) ( not ( = ?auto_23986 ?auto_23994 ) ) ( not ( = ?auto_23986 ?auto_24017 ) ) ( not ( = ?auto_23987 ?auto_23994 ) ) ( not ( = ?auto_23987 ?auto_24017 ) ) ( not ( = ?auto_23988 ?auto_23994 ) ) ( not ( = ?auto_23988 ?auto_24017 ) ) ( not ( = ?auto_23989 ?auto_23994 ) ) ( not ( = ?auto_23989 ?auto_24017 ) ) ( not ( = ?auto_23990 ?auto_23994 ) ) ( not ( = ?auto_23990 ?auto_24017 ) ) ( not ( = ?auto_23991 ?auto_23994 ) ) ( not ( = ?auto_23991 ?auto_24017 ) ) ( not ( = ?auto_23992 ?auto_23994 ) ) ( not ( = ?auto_23992 ?auto_24017 ) ) ( not ( = ?auto_23994 ?auto_24019 ) ) ( not ( = ?auto_23994 ?auto_24003 ) ) ( not ( = ?auto_23994 ?auto_24013 ) ) ( not ( = ?auto_23994 ?auto_24008 ) ) ( not ( = ?auto_23994 ?auto_24011 ) ) ( not ( = ?auto_23994 ?auto_24006 ) ) ( not ( = ?auto_23994 ?auto_24005 ) ) ( not ( = ?auto_23994 ?auto_24007 ) ) ( not ( = ?auto_24017 ?auto_24019 ) ) ( not ( = ?auto_24017 ?auto_24003 ) ) ( not ( = ?auto_24017 ?auto_24013 ) ) ( not ( = ?auto_24017 ?auto_24008 ) ) ( not ( = ?auto_24017 ?auto_24011 ) ) ( not ( = ?auto_24017 ?auto_24006 ) ) ( not ( = ?auto_24017 ?auto_24005 ) ) ( not ( = ?auto_24017 ?auto_24007 ) ) ( not ( = ?auto_23985 ?auto_23995 ) ) ( not ( = ?auto_23985 ?auto_24000 ) ) ( not ( = ?auto_23986 ?auto_23995 ) ) ( not ( = ?auto_23986 ?auto_24000 ) ) ( not ( = ?auto_23987 ?auto_23995 ) ) ( not ( = ?auto_23987 ?auto_24000 ) ) ( not ( = ?auto_23988 ?auto_23995 ) ) ( not ( = ?auto_23988 ?auto_24000 ) ) ( not ( = ?auto_23989 ?auto_23995 ) ) ( not ( = ?auto_23989 ?auto_24000 ) ) ( not ( = ?auto_23990 ?auto_23995 ) ) ( not ( = ?auto_23990 ?auto_24000 ) ) ( not ( = ?auto_23991 ?auto_23995 ) ) ( not ( = ?auto_23991 ?auto_24000 ) ) ( not ( = ?auto_23992 ?auto_23995 ) ) ( not ( = ?auto_23992 ?auto_24000 ) ) ( not ( = ?auto_23993 ?auto_23995 ) ) ( not ( = ?auto_23993 ?auto_24000 ) ) ( not ( = ?auto_23995 ?auto_24017 ) ) ( not ( = ?auto_23995 ?auto_24019 ) ) ( not ( = ?auto_23995 ?auto_24003 ) ) ( not ( = ?auto_23995 ?auto_24013 ) ) ( not ( = ?auto_23995 ?auto_24008 ) ) ( not ( = ?auto_23995 ?auto_24011 ) ) ( not ( = ?auto_23995 ?auto_24006 ) ) ( not ( = ?auto_23995 ?auto_24005 ) ) ( not ( = ?auto_23995 ?auto_24007 ) ) ( not ( = ?auto_23998 ?auto_24009 ) ) ( not ( = ?auto_23998 ?auto_24002 ) ) ( not ( = ?auto_23998 ?auto_24020 ) ) ( not ( = ?auto_23998 ?auto_24015 ) ) ( not ( = ?auto_23998 ?auto_24012 ) ) ( not ( = ?auto_24001 ?auto_24016 ) ) ( not ( = ?auto_24001 ?auto_24010 ) ) ( not ( = ?auto_24001 ?auto_24014 ) ) ( not ( = ?auto_24001 ?auto_24018 ) ) ( not ( = ?auto_24001 ?auto_24004 ) ) ( not ( = ?auto_24000 ?auto_24017 ) ) ( not ( = ?auto_24000 ?auto_24019 ) ) ( not ( = ?auto_24000 ?auto_24003 ) ) ( not ( = ?auto_24000 ?auto_24013 ) ) ( not ( = ?auto_24000 ?auto_24008 ) ) ( not ( = ?auto_24000 ?auto_24011 ) ) ( not ( = ?auto_24000 ?auto_24006 ) ) ( not ( = ?auto_24000 ?auto_24005 ) ) ( not ( = ?auto_24000 ?auto_24007 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_23985 ?auto_23986 ?auto_23987 ?auto_23988 ?auto_23989 ?auto_23990 ?auto_23991 ?auto_23992 ?auto_23993 ?auto_23994 )
      ( MAKE-1CRATE ?auto_23994 ?auto_23995 )
      ( MAKE-10CRATE-VERIFY ?auto_23985 ?auto_23986 ?auto_23987 ?auto_23988 ?auto_23989 ?auto_23990 ?auto_23991 ?auto_23992 ?auto_23993 ?auto_23994 ?auto_23995 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_24043 - SURFACE
      ?auto_24044 - SURFACE
      ?auto_24045 - SURFACE
      ?auto_24046 - SURFACE
      ?auto_24047 - SURFACE
      ?auto_24048 - SURFACE
      ?auto_24049 - SURFACE
      ?auto_24050 - SURFACE
      ?auto_24051 - SURFACE
      ?auto_24052 - SURFACE
      ?auto_24053 - SURFACE
      ?auto_24054 - SURFACE
    )
    :vars
    (
      ?auto_24058 - HOIST
      ?auto_24055 - PLACE
      ?auto_24060 - PLACE
      ?auto_24057 - HOIST
      ?auto_24056 - SURFACE
      ?auto_24063 - PLACE
      ?auto_24062 - HOIST
      ?auto_24071 - SURFACE
      ?auto_24065 - PLACE
      ?auto_24075 - HOIST
      ?auto_24080 - SURFACE
      ?auto_24067 - PLACE
      ?auto_24074 - HOIST
      ?auto_24068 - SURFACE
      ?auto_24069 - SURFACE
      ?auto_24061 - SURFACE
      ?auto_24079 - PLACE
      ?auto_24072 - HOIST
      ?auto_24077 - SURFACE
      ?auto_24070 - SURFACE
      ?auto_24066 - SURFACE
      ?auto_24076 - SURFACE
      ?auto_24078 - PLACE
      ?auto_24073 - HOIST
      ?auto_24064 - SURFACE
      ?auto_24059 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24058 ?auto_24055 ) ( IS-CRATE ?auto_24054 ) ( not ( = ?auto_24060 ?auto_24055 ) ) ( HOIST-AT ?auto_24057 ?auto_24060 ) ( SURFACE-AT ?auto_24054 ?auto_24060 ) ( ON ?auto_24054 ?auto_24056 ) ( CLEAR ?auto_24054 ) ( not ( = ?auto_24053 ?auto_24054 ) ) ( not ( = ?auto_24053 ?auto_24056 ) ) ( not ( = ?auto_24054 ?auto_24056 ) ) ( not ( = ?auto_24058 ?auto_24057 ) ) ( IS-CRATE ?auto_24053 ) ( not ( = ?auto_24063 ?auto_24055 ) ) ( HOIST-AT ?auto_24062 ?auto_24063 ) ( AVAILABLE ?auto_24062 ) ( SURFACE-AT ?auto_24053 ?auto_24063 ) ( ON ?auto_24053 ?auto_24071 ) ( CLEAR ?auto_24053 ) ( not ( = ?auto_24052 ?auto_24053 ) ) ( not ( = ?auto_24052 ?auto_24071 ) ) ( not ( = ?auto_24053 ?auto_24071 ) ) ( not ( = ?auto_24058 ?auto_24062 ) ) ( IS-CRATE ?auto_24052 ) ( not ( = ?auto_24065 ?auto_24055 ) ) ( HOIST-AT ?auto_24075 ?auto_24065 ) ( SURFACE-AT ?auto_24052 ?auto_24065 ) ( ON ?auto_24052 ?auto_24080 ) ( CLEAR ?auto_24052 ) ( not ( = ?auto_24051 ?auto_24052 ) ) ( not ( = ?auto_24051 ?auto_24080 ) ) ( not ( = ?auto_24052 ?auto_24080 ) ) ( not ( = ?auto_24058 ?auto_24075 ) ) ( IS-CRATE ?auto_24051 ) ( not ( = ?auto_24067 ?auto_24055 ) ) ( HOIST-AT ?auto_24074 ?auto_24067 ) ( SURFACE-AT ?auto_24051 ?auto_24067 ) ( ON ?auto_24051 ?auto_24068 ) ( CLEAR ?auto_24051 ) ( not ( = ?auto_24050 ?auto_24051 ) ) ( not ( = ?auto_24050 ?auto_24068 ) ) ( not ( = ?auto_24051 ?auto_24068 ) ) ( not ( = ?auto_24058 ?auto_24074 ) ) ( IS-CRATE ?auto_24050 ) ( SURFACE-AT ?auto_24050 ?auto_24060 ) ( ON ?auto_24050 ?auto_24069 ) ( CLEAR ?auto_24050 ) ( not ( = ?auto_24049 ?auto_24050 ) ) ( not ( = ?auto_24049 ?auto_24069 ) ) ( not ( = ?auto_24050 ?auto_24069 ) ) ( IS-CRATE ?auto_24049 ) ( AVAILABLE ?auto_24074 ) ( SURFACE-AT ?auto_24049 ?auto_24067 ) ( ON ?auto_24049 ?auto_24061 ) ( CLEAR ?auto_24049 ) ( not ( = ?auto_24048 ?auto_24049 ) ) ( not ( = ?auto_24048 ?auto_24061 ) ) ( not ( = ?auto_24049 ?auto_24061 ) ) ( IS-CRATE ?auto_24048 ) ( not ( = ?auto_24079 ?auto_24055 ) ) ( HOIST-AT ?auto_24072 ?auto_24079 ) ( SURFACE-AT ?auto_24048 ?auto_24079 ) ( ON ?auto_24048 ?auto_24077 ) ( CLEAR ?auto_24048 ) ( not ( = ?auto_24047 ?auto_24048 ) ) ( not ( = ?auto_24047 ?auto_24077 ) ) ( not ( = ?auto_24048 ?auto_24077 ) ) ( not ( = ?auto_24058 ?auto_24072 ) ) ( IS-CRATE ?auto_24047 ) ( AVAILABLE ?auto_24075 ) ( SURFACE-AT ?auto_24047 ?auto_24065 ) ( ON ?auto_24047 ?auto_24070 ) ( CLEAR ?auto_24047 ) ( not ( = ?auto_24046 ?auto_24047 ) ) ( not ( = ?auto_24046 ?auto_24070 ) ) ( not ( = ?auto_24047 ?auto_24070 ) ) ( IS-CRATE ?auto_24046 ) ( AVAILABLE ?auto_24072 ) ( SURFACE-AT ?auto_24046 ?auto_24079 ) ( ON ?auto_24046 ?auto_24066 ) ( CLEAR ?auto_24046 ) ( not ( = ?auto_24045 ?auto_24046 ) ) ( not ( = ?auto_24045 ?auto_24066 ) ) ( not ( = ?auto_24046 ?auto_24066 ) ) ( IS-CRATE ?auto_24045 ) ( AVAILABLE ?auto_24057 ) ( SURFACE-AT ?auto_24045 ?auto_24060 ) ( ON ?auto_24045 ?auto_24076 ) ( CLEAR ?auto_24045 ) ( not ( = ?auto_24044 ?auto_24045 ) ) ( not ( = ?auto_24044 ?auto_24076 ) ) ( not ( = ?auto_24045 ?auto_24076 ) ) ( SURFACE-AT ?auto_24043 ?auto_24055 ) ( CLEAR ?auto_24043 ) ( IS-CRATE ?auto_24044 ) ( AVAILABLE ?auto_24058 ) ( not ( = ?auto_24078 ?auto_24055 ) ) ( HOIST-AT ?auto_24073 ?auto_24078 ) ( AVAILABLE ?auto_24073 ) ( SURFACE-AT ?auto_24044 ?auto_24078 ) ( ON ?auto_24044 ?auto_24064 ) ( CLEAR ?auto_24044 ) ( TRUCK-AT ?auto_24059 ?auto_24055 ) ( not ( = ?auto_24043 ?auto_24044 ) ) ( not ( = ?auto_24043 ?auto_24064 ) ) ( not ( = ?auto_24044 ?auto_24064 ) ) ( not ( = ?auto_24058 ?auto_24073 ) ) ( not ( = ?auto_24043 ?auto_24045 ) ) ( not ( = ?auto_24043 ?auto_24076 ) ) ( not ( = ?auto_24045 ?auto_24064 ) ) ( not ( = ?auto_24060 ?auto_24078 ) ) ( not ( = ?auto_24057 ?auto_24073 ) ) ( not ( = ?auto_24076 ?auto_24064 ) ) ( not ( = ?auto_24043 ?auto_24046 ) ) ( not ( = ?auto_24043 ?auto_24066 ) ) ( not ( = ?auto_24044 ?auto_24046 ) ) ( not ( = ?auto_24044 ?auto_24066 ) ) ( not ( = ?auto_24046 ?auto_24076 ) ) ( not ( = ?auto_24046 ?auto_24064 ) ) ( not ( = ?auto_24079 ?auto_24060 ) ) ( not ( = ?auto_24079 ?auto_24078 ) ) ( not ( = ?auto_24072 ?auto_24057 ) ) ( not ( = ?auto_24072 ?auto_24073 ) ) ( not ( = ?auto_24066 ?auto_24076 ) ) ( not ( = ?auto_24066 ?auto_24064 ) ) ( not ( = ?auto_24043 ?auto_24047 ) ) ( not ( = ?auto_24043 ?auto_24070 ) ) ( not ( = ?auto_24044 ?auto_24047 ) ) ( not ( = ?auto_24044 ?auto_24070 ) ) ( not ( = ?auto_24045 ?auto_24047 ) ) ( not ( = ?auto_24045 ?auto_24070 ) ) ( not ( = ?auto_24047 ?auto_24066 ) ) ( not ( = ?auto_24047 ?auto_24076 ) ) ( not ( = ?auto_24047 ?auto_24064 ) ) ( not ( = ?auto_24065 ?auto_24079 ) ) ( not ( = ?auto_24065 ?auto_24060 ) ) ( not ( = ?auto_24065 ?auto_24078 ) ) ( not ( = ?auto_24075 ?auto_24072 ) ) ( not ( = ?auto_24075 ?auto_24057 ) ) ( not ( = ?auto_24075 ?auto_24073 ) ) ( not ( = ?auto_24070 ?auto_24066 ) ) ( not ( = ?auto_24070 ?auto_24076 ) ) ( not ( = ?auto_24070 ?auto_24064 ) ) ( not ( = ?auto_24043 ?auto_24048 ) ) ( not ( = ?auto_24043 ?auto_24077 ) ) ( not ( = ?auto_24044 ?auto_24048 ) ) ( not ( = ?auto_24044 ?auto_24077 ) ) ( not ( = ?auto_24045 ?auto_24048 ) ) ( not ( = ?auto_24045 ?auto_24077 ) ) ( not ( = ?auto_24046 ?auto_24048 ) ) ( not ( = ?auto_24046 ?auto_24077 ) ) ( not ( = ?auto_24048 ?auto_24070 ) ) ( not ( = ?auto_24048 ?auto_24066 ) ) ( not ( = ?auto_24048 ?auto_24076 ) ) ( not ( = ?auto_24048 ?auto_24064 ) ) ( not ( = ?auto_24077 ?auto_24070 ) ) ( not ( = ?auto_24077 ?auto_24066 ) ) ( not ( = ?auto_24077 ?auto_24076 ) ) ( not ( = ?auto_24077 ?auto_24064 ) ) ( not ( = ?auto_24043 ?auto_24049 ) ) ( not ( = ?auto_24043 ?auto_24061 ) ) ( not ( = ?auto_24044 ?auto_24049 ) ) ( not ( = ?auto_24044 ?auto_24061 ) ) ( not ( = ?auto_24045 ?auto_24049 ) ) ( not ( = ?auto_24045 ?auto_24061 ) ) ( not ( = ?auto_24046 ?auto_24049 ) ) ( not ( = ?auto_24046 ?auto_24061 ) ) ( not ( = ?auto_24047 ?auto_24049 ) ) ( not ( = ?auto_24047 ?auto_24061 ) ) ( not ( = ?auto_24049 ?auto_24077 ) ) ( not ( = ?auto_24049 ?auto_24070 ) ) ( not ( = ?auto_24049 ?auto_24066 ) ) ( not ( = ?auto_24049 ?auto_24076 ) ) ( not ( = ?auto_24049 ?auto_24064 ) ) ( not ( = ?auto_24067 ?auto_24079 ) ) ( not ( = ?auto_24067 ?auto_24065 ) ) ( not ( = ?auto_24067 ?auto_24060 ) ) ( not ( = ?auto_24067 ?auto_24078 ) ) ( not ( = ?auto_24074 ?auto_24072 ) ) ( not ( = ?auto_24074 ?auto_24075 ) ) ( not ( = ?auto_24074 ?auto_24057 ) ) ( not ( = ?auto_24074 ?auto_24073 ) ) ( not ( = ?auto_24061 ?auto_24077 ) ) ( not ( = ?auto_24061 ?auto_24070 ) ) ( not ( = ?auto_24061 ?auto_24066 ) ) ( not ( = ?auto_24061 ?auto_24076 ) ) ( not ( = ?auto_24061 ?auto_24064 ) ) ( not ( = ?auto_24043 ?auto_24050 ) ) ( not ( = ?auto_24043 ?auto_24069 ) ) ( not ( = ?auto_24044 ?auto_24050 ) ) ( not ( = ?auto_24044 ?auto_24069 ) ) ( not ( = ?auto_24045 ?auto_24050 ) ) ( not ( = ?auto_24045 ?auto_24069 ) ) ( not ( = ?auto_24046 ?auto_24050 ) ) ( not ( = ?auto_24046 ?auto_24069 ) ) ( not ( = ?auto_24047 ?auto_24050 ) ) ( not ( = ?auto_24047 ?auto_24069 ) ) ( not ( = ?auto_24048 ?auto_24050 ) ) ( not ( = ?auto_24048 ?auto_24069 ) ) ( not ( = ?auto_24050 ?auto_24061 ) ) ( not ( = ?auto_24050 ?auto_24077 ) ) ( not ( = ?auto_24050 ?auto_24070 ) ) ( not ( = ?auto_24050 ?auto_24066 ) ) ( not ( = ?auto_24050 ?auto_24076 ) ) ( not ( = ?auto_24050 ?auto_24064 ) ) ( not ( = ?auto_24069 ?auto_24061 ) ) ( not ( = ?auto_24069 ?auto_24077 ) ) ( not ( = ?auto_24069 ?auto_24070 ) ) ( not ( = ?auto_24069 ?auto_24066 ) ) ( not ( = ?auto_24069 ?auto_24076 ) ) ( not ( = ?auto_24069 ?auto_24064 ) ) ( not ( = ?auto_24043 ?auto_24051 ) ) ( not ( = ?auto_24043 ?auto_24068 ) ) ( not ( = ?auto_24044 ?auto_24051 ) ) ( not ( = ?auto_24044 ?auto_24068 ) ) ( not ( = ?auto_24045 ?auto_24051 ) ) ( not ( = ?auto_24045 ?auto_24068 ) ) ( not ( = ?auto_24046 ?auto_24051 ) ) ( not ( = ?auto_24046 ?auto_24068 ) ) ( not ( = ?auto_24047 ?auto_24051 ) ) ( not ( = ?auto_24047 ?auto_24068 ) ) ( not ( = ?auto_24048 ?auto_24051 ) ) ( not ( = ?auto_24048 ?auto_24068 ) ) ( not ( = ?auto_24049 ?auto_24051 ) ) ( not ( = ?auto_24049 ?auto_24068 ) ) ( not ( = ?auto_24051 ?auto_24069 ) ) ( not ( = ?auto_24051 ?auto_24061 ) ) ( not ( = ?auto_24051 ?auto_24077 ) ) ( not ( = ?auto_24051 ?auto_24070 ) ) ( not ( = ?auto_24051 ?auto_24066 ) ) ( not ( = ?auto_24051 ?auto_24076 ) ) ( not ( = ?auto_24051 ?auto_24064 ) ) ( not ( = ?auto_24068 ?auto_24069 ) ) ( not ( = ?auto_24068 ?auto_24061 ) ) ( not ( = ?auto_24068 ?auto_24077 ) ) ( not ( = ?auto_24068 ?auto_24070 ) ) ( not ( = ?auto_24068 ?auto_24066 ) ) ( not ( = ?auto_24068 ?auto_24076 ) ) ( not ( = ?auto_24068 ?auto_24064 ) ) ( not ( = ?auto_24043 ?auto_24052 ) ) ( not ( = ?auto_24043 ?auto_24080 ) ) ( not ( = ?auto_24044 ?auto_24052 ) ) ( not ( = ?auto_24044 ?auto_24080 ) ) ( not ( = ?auto_24045 ?auto_24052 ) ) ( not ( = ?auto_24045 ?auto_24080 ) ) ( not ( = ?auto_24046 ?auto_24052 ) ) ( not ( = ?auto_24046 ?auto_24080 ) ) ( not ( = ?auto_24047 ?auto_24052 ) ) ( not ( = ?auto_24047 ?auto_24080 ) ) ( not ( = ?auto_24048 ?auto_24052 ) ) ( not ( = ?auto_24048 ?auto_24080 ) ) ( not ( = ?auto_24049 ?auto_24052 ) ) ( not ( = ?auto_24049 ?auto_24080 ) ) ( not ( = ?auto_24050 ?auto_24052 ) ) ( not ( = ?auto_24050 ?auto_24080 ) ) ( not ( = ?auto_24052 ?auto_24068 ) ) ( not ( = ?auto_24052 ?auto_24069 ) ) ( not ( = ?auto_24052 ?auto_24061 ) ) ( not ( = ?auto_24052 ?auto_24077 ) ) ( not ( = ?auto_24052 ?auto_24070 ) ) ( not ( = ?auto_24052 ?auto_24066 ) ) ( not ( = ?auto_24052 ?auto_24076 ) ) ( not ( = ?auto_24052 ?auto_24064 ) ) ( not ( = ?auto_24080 ?auto_24068 ) ) ( not ( = ?auto_24080 ?auto_24069 ) ) ( not ( = ?auto_24080 ?auto_24061 ) ) ( not ( = ?auto_24080 ?auto_24077 ) ) ( not ( = ?auto_24080 ?auto_24070 ) ) ( not ( = ?auto_24080 ?auto_24066 ) ) ( not ( = ?auto_24080 ?auto_24076 ) ) ( not ( = ?auto_24080 ?auto_24064 ) ) ( not ( = ?auto_24043 ?auto_24053 ) ) ( not ( = ?auto_24043 ?auto_24071 ) ) ( not ( = ?auto_24044 ?auto_24053 ) ) ( not ( = ?auto_24044 ?auto_24071 ) ) ( not ( = ?auto_24045 ?auto_24053 ) ) ( not ( = ?auto_24045 ?auto_24071 ) ) ( not ( = ?auto_24046 ?auto_24053 ) ) ( not ( = ?auto_24046 ?auto_24071 ) ) ( not ( = ?auto_24047 ?auto_24053 ) ) ( not ( = ?auto_24047 ?auto_24071 ) ) ( not ( = ?auto_24048 ?auto_24053 ) ) ( not ( = ?auto_24048 ?auto_24071 ) ) ( not ( = ?auto_24049 ?auto_24053 ) ) ( not ( = ?auto_24049 ?auto_24071 ) ) ( not ( = ?auto_24050 ?auto_24053 ) ) ( not ( = ?auto_24050 ?auto_24071 ) ) ( not ( = ?auto_24051 ?auto_24053 ) ) ( not ( = ?auto_24051 ?auto_24071 ) ) ( not ( = ?auto_24053 ?auto_24080 ) ) ( not ( = ?auto_24053 ?auto_24068 ) ) ( not ( = ?auto_24053 ?auto_24069 ) ) ( not ( = ?auto_24053 ?auto_24061 ) ) ( not ( = ?auto_24053 ?auto_24077 ) ) ( not ( = ?auto_24053 ?auto_24070 ) ) ( not ( = ?auto_24053 ?auto_24066 ) ) ( not ( = ?auto_24053 ?auto_24076 ) ) ( not ( = ?auto_24053 ?auto_24064 ) ) ( not ( = ?auto_24063 ?auto_24065 ) ) ( not ( = ?auto_24063 ?auto_24067 ) ) ( not ( = ?auto_24063 ?auto_24060 ) ) ( not ( = ?auto_24063 ?auto_24079 ) ) ( not ( = ?auto_24063 ?auto_24078 ) ) ( not ( = ?auto_24062 ?auto_24075 ) ) ( not ( = ?auto_24062 ?auto_24074 ) ) ( not ( = ?auto_24062 ?auto_24057 ) ) ( not ( = ?auto_24062 ?auto_24072 ) ) ( not ( = ?auto_24062 ?auto_24073 ) ) ( not ( = ?auto_24071 ?auto_24080 ) ) ( not ( = ?auto_24071 ?auto_24068 ) ) ( not ( = ?auto_24071 ?auto_24069 ) ) ( not ( = ?auto_24071 ?auto_24061 ) ) ( not ( = ?auto_24071 ?auto_24077 ) ) ( not ( = ?auto_24071 ?auto_24070 ) ) ( not ( = ?auto_24071 ?auto_24066 ) ) ( not ( = ?auto_24071 ?auto_24076 ) ) ( not ( = ?auto_24071 ?auto_24064 ) ) ( not ( = ?auto_24043 ?auto_24054 ) ) ( not ( = ?auto_24043 ?auto_24056 ) ) ( not ( = ?auto_24044 ?auto_24054 ) ) ( not ( = ?auto_24044 ?auto_24056 ) ) ( not ( = ?auto_24045 ?auto_24054 ) ) ( not ( = ?auto_24045 ?auto_24056 ) ) ( not ( = ?auto_24046 ?auto_24054 ) ) ( not ( = ?auto_24046 ?auto_24056 ) ) ( not ( = ?auto_24047 ?auto_24054 ) ) ( not ( = ?auto_24047 ?auto_24056 ) ) ( not ( = ?auto_24048 ?auto_24054 ) ) ( not ( = ?auto_24048 ?auto_24056 ) ) ( not ( = ?auto_24049 ?auto_24054 ) ) ( not ( = ?auto_24049 ?auto_24056 ) ) ( not ( = ?auto_24050 ?auto_24054 ) ) ( not ( = ?auto_24050 ?auto_24056 ) ) ( not ( = ?auto_24051 ?auto_24054 ) ) ( not ( = ?auto_24051 ?auto_24056 ) ) ( not ( = ?auto_24052 ?auto_24054 ) ) ( not ( = ?auto_24052 ?auto_24056 ) ) ( not ( = ?auto_24054 ?auto_24071 ) ) ( not ( = ?auto_24054 ?auto_24080 ) ) ( not ( = ?auto_24054 ?auto_24068 ) ) ( not ( = ?auto_24054 ?auto_24069 ) ) ( not ( = ?auto_24054 ?auto_24061 ) ) ( not ( = ?auto_24054 ?auto_24077 ) ) ( not ( = ?auto_24054 ?auto_24070 ) ) ( not ( = ?auto_24054 ?auto_24066 ) ) ( not ( = ?auto_24054 ?auto_24076 ) ) ( not ( = ?auto_24054 ?auto_24064 ) ) ( not ( = ?auto_24056 ?auto_24071 ) ) ( not ( = ?auto_24056 ?auto_24080 ) ) ( not ( = ?auto_24056 ?auto_24068 ) ) ( not ( = ?auto_24056 ?auto_24069 ) ) ( not ( = ?auto_24056 ?auto_24061 ) ) ( not ( = ?auto_24056 ?auto_24077 ) ) ( not ( = ?auto_24056 ?auto_24070 ) ) ( not ( = ?auto_24056 ?auto_24066 ) ) ( not ( = ?auto_24056 ?auto_24076 ) ) ( not ( = ?auto_24056 ?auto_24064 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_24043 ?auto_24044 ?auto_24045 ?auto_24046 ?auto_24047 ?auto_24048 ?auto_24049 ?auto_24050 ?auto_24051 ?auto_24052 ?auto_24053 )
      ( MAKE-1CRATE ?auto_24053 ?auto_24054 )
      ( MAKE-11CRATE-VERIFY ?auto_24043 ?auto_24044 ?auto_24045 ?auto_24046 ?auto_24047 ?auto_24048 ?auto_24049 ?auto_24050 ?auto_24051 ?auto_24052 ?auto_24053 ?auto_24054 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_24104 - SURFACE
      ?auto_24105 - SURFACE
      ?auto_24106 - SURFACE
      ?auto_24107 - SURFACE
      ?auto_24108 - SURFACE
      ?auto_24109 - SURFACE
      ?auto_24110 - SURFACE
      ?auto_24111 - SURFACE
      ?auto_24112 - SURFACE
      ?auto_24113 - SURFACE
      ?auto_24114 - SURFACE
      ?auto_24115 - SURFACE
      ?auto_24116 - SURFACE
    )
    :vars
    (
      ?auto_24119 - HOIST
      ?auto_24117 - PLACE
      ?auto_24118 - PLACE
      ?auto_24122 - HOIST
      ?auto_24121 - SURFACE
      ?auto_24136 - PLACE
      ?auto_24138 - HOIST
      ?auto_24137 - SURFACE
      ?auto_24133 - PLACE
      ?auto_24123 - HOIST
      ?auto_24142 - SURFACE
      ?auto_24131 - PLACE
      ?auto_24139 - HOIST
      ?auto_24145 - SURFACE
      ?auto_24127 - PLACE
      ?auto_24130 - HOIST
      ?auto_24134 - SURFACE
      ?auto_24143 - SURFACE
      ?auto_24128 - SURFACE
      ?auto_24144 - PLACE
      ?auto_24132 - HOIST
      ?auto_24126 - SURFACE
      ?auto_24141 - SURFACE
      ?auto_24140 - SURFACE
      ?auto_24125 - SURFACE
      ?auto_24129 - PLACE
      ?auto_24135 - HOIST
      ?auto_24124 - SURFACE
      ?auto_24120 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24119 ?auto_24117 ) ( IS-CRATE ?auto_24116 ) ( not ( = ?auto_24118 ?auto_24117 ) ) ( HOIST-AT ?auto_24122 ?auto_24118 ) ( AVAILABLE ?auto_24122 ) ( SURFACE-AT ?auto_24116 ?auto_24118 ) ( ON ?auto_24116 ?auto_24121 ) ( CLEAR ?auto_24116 ) ( not ( = ?auto_24115 ?auto_24116 ) ) ( not ( = ?auto_24115 ?auto_24121 ) ) ( not ( = ?auto_24116 ?auto_24121 ) ) ( not ( = ?auto_24119 ?auto_24122 ) ) ( IS-CRATE ?auto_24115 ) ( not ( = ?auto_24136 ?auto_24117 ) ) ( HOIST-AT ?auto_24138 ?auto_24136 ) ( SURFACE-AT ?auto_24115 ?auto_24136 ) ( ON ?auto_24115 ?auto_24137 ) ( CLEAR ?auto_24115 ) ( not ( = ?auto_24114 ?auto_24115 ) ) ( not ( = ?auto_24114 ?auto_24137 ) ) ( not ( = ?auto_24115 ?auto_24137 ) ) ( not ( = ?auto_24119 ?auto_24138 ) ) ( IS-CRATE ?auto_24114 ) ( not ( = ?auto_24133 ?auto_24117 ) ) ( HOIST-AT ?auto_24123 ?auto_24133 ) ( AVAILABLE ?auto_24123 ) ( SURFACE-AT ?auto_24114 ?auto_24133 ) ( ON ?auto_24114 ?auto_24142 ) ( CLEAR ?auto_24114 ) ( not ( = ?auto_24113 ?auto_24114 ) ) ( not ( = ?auto_24113 ?auto_24142 ) ) ( not ( = ?auto_24114 ?auto_24142 ) ) ( not ( = ?auto_24119 ?auto_24123 ) ) ( IS-CRATE ?auto_24113 ) ( not ( = ?auto_24131 ?auto_24117 ) ) ( HOIST-AT ?auto_24139 ?auto_24131 ) ( SURFACE-AT ?auto_24113 ?auto_24131 ) ( ON ?auto_24113 ?auto_24145 ) ( CLEAR ?auto_24113 ) ( not ( = ?auto_24112 ?auto_24113 ) ) ( not ( = ?auto_24112 ?auto_24145 ) ) ( not ( = ?auto_24113 ?auto_24145 ) ) ( not ( = ?auto_24119 ?auto_24139 ) ) ( IS-CRATE ?auto_24112 ) ( not ( = ?auto_24127 ?auto_24117 ) ) ( HOIST-AT ?auto_24130 ?auto_24127 ) ( SURFACE-AT ?auto_24112 ?auto_24127 ) ( ON ?auto_24112 ?auto_24134 ) ( CLEAR ?auto_24112 ) ( not ( = ?auto_24111 ?auto_24112 ) ) ( not ( = ?auto_24111 ?auto_24134 ) ) ( not ( = ?auto_24112 ?auto_24134 ) ) ( not ( = ?auto_24119 ?auto_24130 ) ) ( IS-CRATE ?auto_24111 ) ( SURFACE-AT ?auto_24111 ?auto_24136 ) ( ON ?auto_24111 ?auto_24143 ) ( CLEAR ?auto_24111 ) ( not ( = ?auto_24110 ?auto_24111 ) ) ( not ( = ?auto_24110 ?auto_24143 ) ) ( not ( = ?auto_24111 ?auto_24143 ) ) ( IS-CRATE ?auto_24110 ) ( AVAILABLE ?auto_24130 ) ( SURFACE-AT ?auto_24110 ?auto_24127 ) ( ON ?auto_24110 ?auto_24128 ) ( CLEAR ?auto_24110 ) ( not ( = ?auto_24109 ?auto_24110 ) ) ( not ( = ?auto_24109 ?auto_24128 ) ) ( not ( = ?auto_24110 ?auto_24128 ) ) ( IS-CRATE ?auto_24109 ) ( not ( = ?auto_24144 ?auto_24117 ) ) ( HOIST-AT ?auto_24132 ?auto_24144 ) ( SURFACE-AT ?auto_24109 ?auto_24144 ) ( ON ?auto_24109 ?auto_24126 ) ( CLEAR ?auto_24109 ) ( not ( = ?auto_24108 ?auto_24109 ) ) ( not ( = ?auto_24108 ?auto_24126 ) ) ( not ( = ?auto_24109 ?auto_24126 ) ) ( not ( = ?auto_24119 ?auto_24132 ) ) ( IS-CRATE ?auto_24108 ) ( AVAILABLE ?auto_24139 ) ( SURFACE-AT ?auto_24108 ?auto_24131 ) ( ON ?auto_24108 ?auto_24141 ) ( CLEAR ?auto_24108 ) ( not ( = ?auto_24107 ?auto_24108 ) ) ( not ( = ?auto_24107 ?auto_24141 ) ) ( not ( = ?auto_24108 ?auto_24141 ) ) ( IS-CRATE ?auto_24107 ) ( AVAILABLE ?auto_24132 ) ( SURFACE-AT ?auto_24107 ?auto_24144 ) ( ON ?auto_24107 ?auto_24140 ) ( CLEAR ?auto_24107 ) ( not ( = ?auto_24106 ?auto_24107 ) ) ( not ( = ?auto_24106 ?auto_24140 ) ) ( not ( = ?auto_24107 ?auto_24140 ) ) ( IS-CRATE ?auto_24106 ) ( AVAILABLE ?auto_24138 ) ( SURFACE-AT ?auto_24106 ?auto_24136 ) ( ON ?auto_24106 ?auto_24125 ) ( CLEAR ?auto_24106 ) ( not ( = ?auto_24105 ?auto_24106 ) ) ( not ( = ?auto_24105 ?auto_24125 ) ) ( not ( = ?auto_24106 ?auto_24125 ) ) ( SURFACE-AT ?auto_24104 ?auto_24117 ) ( CLEAR ?auto_24104 ) ( IS-CRATE ?auto_24105 ) ( AVAILABLE ?auto_24119 ) ( not ( = ?auto_24129 ?auto_24117 ) ) ( HOIST-AT ?auto_24135 ?auto_24129 ) ( AVAILABLE ?auto_24135 ) ( SURFACE-AT ?auto_24105 ?auto_24129 ) ( ON ?auto_24105 ?auto_24124 ) ( CLEAR ?auto_24105 ) ( TRUCK-AT ?auto_24120 ?auto_24117 ) ( not ( = ?auto_24104 ?auto_24105 ) ) ( not ( = ?auto_24104 ?auto_24124 ) ) ( not ( = ?auto_24105 ?auto_24124 ) ) ( not ( = ?auto_24119 ?auto_24135 ) ) ( not ( = ?auto_24104 ?auto_24106 ) ) ( not ( = ?auto_24104 ?auto_24125 ) ) ( not ( = ?auto_24106 ?auto_24124 ) ) ( not ( = ?auto_24136 ?auto_24129 ) ) ( not ( = ?auto_24138 ?auto_24135 ) ) ( not ( = ?auto_24125 ?auto_24124 ) ) ( not ( = ?auto_24104 ?auto_24107 ) ) ( not ( = ?auto_24104 ?auto_24140 ) ) ( not ( = ?auto_24105 ?auto_24107 ) ) ( not ( = ?auto_24105 ?auto_24140 ) ) ( not ( = ?auto_24107 ?auto_24125 ) ) ( not ( = ?auto_24107 ?auto_24124 ) ) ( not ( = ?auto_24144 ?auto_24136 ) ) ( not ( = ?auto_24144 ?auto_24129 ) ) ( not ( = ?auto_24132 ?auto_24138 ) ) ( not ( = ?auto_24132 ?auto_24135 ) ) ( not ( = ?auto_24140 ?auto_24125 ) ) ( not ( = ?auto_24140 ?auto_24124 ) ) ( not ( = ?auto_24104 ?auto_24108 ) ) ( not ( = ?auto_24104 ?auto_24141 ) ) ( not ( = ?auto_24105 ?auto_24108 ) ) ( not ( = ?auto_24105 ?auto_24141 ) ) ( not ( = ?auto_24106 ?auto_24108 ) ) ( not ( = ?auto_24106 ?auto_24141 ) ) ( not ( = ?auto_24108 ?auto_24140 ) ) ( not ( = ?auto_24108 ?auto_24125 ) ) ( not ( = ?auto_24108 ?auto_24124 ) ) ( not ( = ?auto_24131 ?auto_24144 ) ) ( not ( = ?auto_24131 ?auto_24136 ) ) ( not ( = ?auto_24131 ?auto_24129 ) ) ( not ( = ?auto_24139 ?auto_24132 ) ) ( not ( = ?auto_24139 ?auto_24138 ) ) ( not ( = ?auto_24139 ?auto_24135 ) ) ( not ( = ?auto_24141 ?auto_24140 ) ) ( not ( = ?auto_24141 ?auto_24125 ) ) ( not ( = ?auto_24141 ?auto_24124 ) ) ( not ( = ?auto_24104 ?auto_24109 ) ) ( not ( = ?auto_24104 ?auto_24126 ) ) ( not ( = ?auto_24105 ?auto_24109 ) ) ( not ( = ?auto_24105 ?auto_24126 ) ) ( not ( = ?auto_24106 ?auto_24109 ) ) ( not ( = ?auto_24106 ?auto_24126 ) ) ( not ( = ?auto_24107 ?auto_24109 ) ) ( not ( = ?auto_24107 ?auto_24126 ) ) ( not ( = ?auto_24109 ?auto_24141 ) ) ( not ( = ?auto_24109 ?auto_24140 ) ) ( not ( = ?auto_24109 ?auto_24125 ) ) ( not ( = ?auto_24109 ?auto_24124 ) ) ( not ( = ?auto_24126 ?auto_24141 ) ) ( not ( = ?auto_24126 ?auto_24140 ) ) ( not ( = ?auto_24126 ?auto_24125 ) ) ( not ( = ?auto_24126 ?auto_24124 ) ) ( not ( = ?auto_24104 ?auto_24110 ) ) ( not ( = ?auto_24104 ?auto_24128 ) ) ( not ( = ?auto_24105 ?auto_24110 ) ) ( not ( = ?auto_24105 ?auto_24128 ) ) ( not ( = ?auto_24106 ?auto_24110 ) ) ( not ( = ?auto_24106 ?auto_24128 ) ) ( not ( = ?auto_24107 ?auto_24110 ) ) ( not ( = ?auto_24107 ?auto_24128 ) ) ( not ( = ?auto_24108 ?auto_24110 ) ) ( not ( = ?auto_24108 ?auto_24128 ) ) ( not ( = ?auto_24110 ?auto_24126 ) ) ( not ( = ?auto_24110 ?auto_24141 ) ) ( not ( = ?auto_24110 ?auto_24140 ) ) ( not ( = ?auto_24110 ?auto_24125 ) ) ( not ( = ?auto_24110 ?auto_24124 ) ) ( not ( = ?auto_24127 ?auto_24144 ) ) ( not ( = ?auto_24127 ?auto_24131 ) ) ( not ( = ?auto_24127 ?auto_24136 ) ) ( not ( = ?auto_24127 ?auto_24129 ) ) ( not ( = ?auto_24130 ?auto_24132 ) ) ( not ( = ?auto_24130 ?auto_24139 ) ) ( not ( = ?auto_24130 ?auto_24138 ) ) ( not ( = ?auto_24130 ?auto_24135 ) ) ( not ( = ?auto_24128 ?auto_24126 ) ) ( not ( = ?auto_24128 ?auto_24141 ) ) ( not ( = ?auto_24128 ?auto_24140 ) ) ( not ( = ?auto_24128 ?auto_24125 ) ) ( not ( = ?auto_24128 ?auto_24124 ) ) ( not ( = ?auto_24104 ?auto_24111 ) ) ( not ( = ?auto_24104 ?auto_24143 ) ) ( not ( = ?auto_24105 ?auto_24111 ) ) ( not ( = ?auto_24105 ?auto_24143 ) ) ( not ( = ?auto_24106 ?auto_24111 ) ) ( not ( = ?auto_24106 ?auto_24143 ) ) ( not ( = ?auto_24107 ?auto_24111 ) ) ( not ( = ?auto_24107 ?auto_24143 ) ) ( not ( = ?auto_24108 ?auto_24111 ) ) ( not ( = ?auto_24108 ?auto_24143 ) ) ( not ( = ?auto_24109 ?auto_24111 ) ) ( not ( = ?auto_24109 ?auto_24143 ) ) ( not ( = ?auto_24111 ?auto_24128 ) ) ( not ( = ?auto_24111 ?auto_24126 ) ) ( not ( = ?auto_24111 ?auto_24141 ) ) ( not ( = ?auto_24111 ?auto_24140 ) ) ( not ( = ?auto_24111 ?auto_24125 ) ) ( not ( = ?auto_24111 ?auto_24124 ) ) ( not ( = ?auto_24143 ?auto_24128 ) ) ( not ( = ?auto_24143 ?auto_24126 ) ) ( not ( = ?auto_24143 ?auto_24141 ) ) ( not ( = ?auto_24143 ?auto_24140 ) ) ( not ( = ?auto_24143 ?auto_24125 ) ) ( not ( = ?auto_24143 ?auto_24124 ) ) ( not ( = ?auto_24104 ?auto_24112 ) ) ( not ( = ?auto_24104 ?auto_24134 ) ) ( not ( = ?auto_24105 ?auto_24112 ) ) ( not ( = ?auto_24105 ?auto_24134 ) ) ( not ( = ?auto_24106 ?auto_24112 ) ) ( not ( = ?auto_24106 ?auto_24134 ) ) ( not ( = ?auto_24107 ?auto_24112 ) ) ( not ( = ?auto_24107 ?auto_24134 ) ) ( not ( = ?auto_24108 ?auto_24112 ) ) ( not ( = ?auto_24108 ?auto_24134 ) ) ( not ( = ?auto_24109 ?auto_24112 ) ) ( not ( = ?auto_24109 ?auto_24134 ) ) ( not ( = ?auto_24110 ?auto_24112 ) ) ( not ( = ?auto_24110 ?auto_24134 ) ) ( not ( = ?auto_24112 ?auto_24143 ) ) ( not ( = ?auto_24112 ?auto_24128 ) ) ( not ( = ?auto_24112 ?auto_24126 ) ) ( not ( = ?auto_24112 ?auto_24141 ) ) ( not ( = ?auto_24112 ?auto_24140 ) ) ( not ( = ?auto_24112 ?auto_24125 ) ) ( not ( = ?auto_24112 ?auto_24124 ) ) ( not ( = ?auto_24134 ?auto_24143 ) ) ( not ( = ?auto_24134 ?auto_24128 ) ) ( not ( = ?auto_24134 ?auto_24126 ) ) ( not ( = ?auto_24134 ?auto_24141 ) ) ( not ( = ?auto_24134 ?auto_24140 ) ) ( not ( = ?auto_24134 ?auto_24125 ) ) ( not ( = ?auto_24134 ?auto_24124 ) ) ( not ( = ?auto_24104 ?auto_24113 ) ) ( not ( = ?auto_24104 ?auto_24145 ) ) ( not ( = ?auto_24105 ?auto_24113 ) ) ( not ( = ?auto_24105 ?auto_24145 ) ) ( not ( = ?auto_24106 ?auto_24113 ) ) ( not ( = ?auto_24106 ?auto_24145 ) ) ( not ( = ?auto_24107 ?auto_24113 ) ) ( not ( = ?auto_24107 ?auto_24145 ) ) ( not ( = ?auto_24108 ?auto_24113 ) ) ( not ( = ?auto_24108 ?auto_24145 ) ) ( not ( = ?auto_24109 ?auto_24113 ) ) ( not ( = ?auto_24109 ?auto_24145 ) ) ( not ( = ?auto_24110 ?auto_24113 ) ) ( not ( = ?auto_24110 ?auto_24145 ) ) ( not ( = ?auto_24111 ?auto_24113 ) ) ( not ( = ?auto_24111 ?auto_24145 ) ) ( not ( = ?auto_24113 ?auto_24134 ) ) ( not ( = ?auto_24113 ?auto_24143 ) ) ( not ( = ?auto_24113 ?auto_24128 ) ) ( not ( = ?auto_24113 ?auto_24126 ) ) ( not ( = ?auto_24113 ?auto_24141 ) ) ( not ( = ?auto_24113 ?auto_24140 ) ) ( not ( = ?auto_24113 ?auto_24125 ) ) ( not ( = ?auto_24113 ?auto_24124 ) ) ( not ( = ?auto_24145 ?auto_24134 ) ) ( not ( = ?auto_24145 ?auto_24143 ) ) ( not ( = ?auto_24145 ?auto_24128 ) ) ( not ( = ?auto_24145 ?auto_24126 ) ) ( not ( = ?auto_24145 ?auto_24141 ) ) ( not ( = ?auto_24145 ?auto_24140 ) ) ( not ( = ?auto_24145 ?auto_24125 ) ) ( not ( = ?auto_24145 ?auto_24124 ) ) ( not ( = ?auto_24104 ?auto_24114 ) ) ( not ( = ?auto_24104 ?auto_24142 ) ) ( not ( = ?auto_24105 ?auto_24114 ) ) ( not ( = ?auto_24105 ?auto_24142 ) ) ( not ( = ?auto_24106 ?auto_24114 ) ) ( not ( = ?auto_24106 ?auto_24142 ) ) ( not ( = ?auto_24107 ?auto_24114 ) ) ( not ( = ?auto_24107 ?auto_24142 ) ) ( not ( = ?auto_24108 ?auto_24114 ) ) ( not ( = ?auto_24108 ?auto_24142 ) ) ( not ( = ?auto_24109 ?auto_24114 ) ) ( not ( = ?auto_24109 ?auto_24142 ) ) ( not ( = ?auto_24110 ?auto_24114 ) ) ( not ( = ?auto_24110 ?auto_24142 ) ) ( not ( = ?auto_24111 ?auto_24114 ) ) ( not ( = ?auto_24111 ?auto_24142 ) ) ( not ( = ?auto_24112 ?auto_24114 ) ) ( not ( = ?auto_24112 ?auto_24142 ) ) ( not ( = ?auto_24114 ?auto_24145 ) ) ( not ( = ?auto_24114 ?auto_24134 ) ) ( not ( = ?auto_24114 ?auto_24143 ) ) ( not ( = ?auto_24114 ?auto_24128 ) ) ( not ( = ?auto_24114 ?auto_24126 ) ) ( not ( = ?auto_24114 ?auto_24141 ) ) ( not ( = ?auto_24114 ?auto_24140 ) ) ( not ( = ?auto_24114 ?auto_24125 ) ) ( not ( = ?auto_24114 ?auto_24124 ) ) ( not ( = ?auto_24133 ?auto_24131 ) ) ( not ( = ?auto_24133 ?auto_24127 ) ) ( not ( = ?auto_24133 ?auto_24136 ) ) ( not ( = ?auto_24133 ?auto_24144 ) ) ( not ( = ?auto_24133 ?auto_24129 ) ) ( not ( = ?auto_24123 ?auto_24139 ) ) ( not ( = ?auto_24123 ?auto_24130 ) ) ( not ( = ?auto_24123 ?auto_24138 ) ) ( not ( = ?auto_24123 ?auto_24132 ) ) ( not ( = ?auto_24123 ?auto_24135 ) ) ( not ( = ?auto_24142 ?auto_24145 ) ) ( not ( = ?auto_24142 ?auto_24134 ) ) ( not ( = ?auto_24142 ?auto_24143 ) ) ( not ( = ?auto_24142 ?auto_24128 ) ) ( not ( = ?auto_24142 ?auto_24126 ) ) ( not ( = ?auto_24142 ?auto_24141 ) ) ( not ( = ?auto_24142 ?auto_24140 ) ) ( not ( = ?auto_24142 ?auto_24125 ) ) ( not ( = ?auto_24142 ?auto_24124 ) ) ( not ( = ?auto_24104 ?auto_24115 ) ) ( not ( = ?auto_24104 ?auto_24137 ) ) ( not ( = ?auto_24105 ?auto_24115 ) ) ( not ( = ?auto_24105 ?auto_24137 ) ) ( not ( = ?auto_24106 ?auto_24115 ) ) ( not ( = ?auto_24106 ?auto_24137 ) ) ( not ( = ?auto_24107 ?auto_24115 ) ) ( not ( = ?auto_24107 ?auto_24137 ) ) ( not ( = ?auto_24108 ?auto_24115 ) ) ( not ( = ?auto_24108 ?auto_24137 ) ) ( not ( = ?auto_24109 ?auto_24115 ) ) ( not ( = ?auto_24109 ?auto_24137 ) ) ( not ( = ?auto_24110 ?auto_24115 ) ) ( not ( = ?auto_24110 ?auto_24137 ) ) ( not ( = ?auto_24111 ?auto_24115 ) ) ( not ( = ?auto_24111 ?auto_24137 ) ) ( not ( = ?auto_24112 ?auto_24115 ) ) ( not ( = ?auto_24112 ?auto_24137 ) ) ( not ( = ?auto_24113 ?auto_24115 ) ) ( not ( = ?auto_24113 ?auto_24137 ) ) ( not ( = ?auto_24115 ?auto_24142 ) ) ( not ( = ?auto_24115 ?auto_24145 ) ) ( not ( = ?auto_24115 ?auto_24134 ) ) ( not ( = ?auto_24115 ?auto_24143 ) ) ( not ( = ?auto_24115 ?auto_24128 ) ) ( not ( = ?auto_24115 ?auto_24126 ) ) ( not ( = ?auto_24115 ?auto_24141 ) ) ( not ( = ?auto_24115 ?auto_24140 ) ) ( not ( = ?auto_24115 ?auto_24125 ) ) ( not ( = ?auto_24115 ?auto_24124 ) ) ( not ( = ?auto_24137 ?auto_24142 ) ) ( not ( = ?auto_24137 ?auto_24145 ) ) ( not ( = ?auto_24137 ?auto_24134 ) ) ( not ( = ?auto_24137 ?auto_24143 ) ) ( not ( = ?auto_24137 ?auto_24128 ) ) ( not ( = ?auto_24137 ?auto_24126 ) ) ( not ( = ?auto_24137 ?auto_24141 ) ) ( not ( = ?auto_24137 ?auto_24140 ) ) ( not ( = ?auto_24137 ?auto_24125 ) ) ( not ( = ?auto_24137 ?auto_24124 ) ) ( not ( = ?auto_24104 ?auto_24116 ) ) ( not ( = ?auto_24104 ?auto_24121 ) ) ( not ( = ?auto_24105 ?auto_24116 ) ) ( not ( = ?auto_24105 ?auto_24121 ) ) ( not ( = ?auto_24106 ?auto_24116 ) ) ( not ( = ?auto_24106 ?auto_24121 ) ) ( not ( = ?auto_24107 ?auto_24116 ) ) ( not ( = ?auto_24107 ?auto_24121 ) ) ( not ( = ?auto_24108 ?auto_24116 ) ) ( not ( = ?auto_24108 ?auto_24121 ) ) ( not ( = ?auto_24109 ?auto_24116 ) ) ( not ( = ?auto_24109 ?auto_24121 ) ) ( not ( = ?auto_24110 ?auto_24116 ) ) ( not ( = ?auto_24110 ?auto_24121 ) ) ( not ( = ?auto_24111 ?auto_24116 ) ) ( not ( = ?auto_24111 ?auto_24121 ) ) ( not ( = ?auto_24112 ?auto_24116 ) ) ( not ( = ?auto_24112 ?auto_24121 ) ) ( not ( = ?auto_24113 ?auto_24116 ) ) ( not ( = ?auto_24113 ?auto_24121 ) ) ( not ( = ?auto_24114 ?auto_24116 ) ) ( not ( = ?auto_24114 ?auto_24121 ) ) ( not ( = ?auto_24116 ?auto_24137 ) ) ( not ( = ?auto_24116 ?auto_24142 ) ) ( not ( = ?auto_24116 ?auto_24145 ) ) ( not ( = ?auto_24116 ?auto_24134 ) ) ( not ( = ?auto_24116 ?auto_24143 ) ) ( not ( = ?auto_24116 ?auto_24128 ) ) ( not ( = ?auto_24116 ?auto_24126 ) ) ( not ( = ?auto_24116 ?auto_24141 ) ) ( not ( = ?auto_24116 ?auto_24140 ) ) ( not ( = ?auto_24116 ?auto_24125 ) ) ( not ( = ?auto_24116 ?auto_24124 ) ) ( not ( = ?auto_24118 ?auto_24136 ) ) ( not ( = ?auto_24118 ?auto_24133 ) ) ( not ( = ?auto_24118 ?auto_24131 ) ) ( not ( = ?auto_24118 ?auto_24127 ) ) ( not ( = ?auto_24118 ?auto_24144 ) ) ( not ( = ?auto_24118 ?auto_24129 ) ) ( not ( = ?auto_24122 ?auto_24138 ) ) ( not ( = ?auto_24122 ?auto_24123 ) ) ( not ( = ?auto_24122 ?auto_24139 ) ) ( not ( = ?auto_24122 ?auto_24130 ) ) ( not ( = ?auto_24122 ?auto_24132 ) ) ( not ( = ?auto_24122 ?auto_24135 ) ) ( not ( = ?auto_24121 ?auto_24137 ) ) ( not ( = ?auto_24121 ?auto_24142 ) ) ( not ( = ?auto_24121 ?auto_24145 ) ) ( not ( = ?auto_24121 ?auto_24134 ) ) ( not ( = ?auto_24121 ?auto_24143 ) ) ( not ( = ?auto_24121 ?auto_24128 ) ) ( not ( = ?auto_24121 ?auto_24126 ) ) ( not ( = ?auto_24121 ?auto_24141 ) ) ( not ( = ?auto_24121 ?auto_24140 ) ) ( not ( = ?auto_24121 ?auto_24125 ) ) ( not ( = ?auto_24121 ?auto_24124 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_24104 ?auto_24105 ?auto_24106 ?auto_24107 ?auto_24108 ?auto_24109 ?auto_24110 ?auto_24111 ?auto_24112 ?auto_24113 ?auto_24114 ?auto_24115 )
      ( MAKE-1CRATE ?auto_24115 ?auto_24116 )
      ( MAKE-12CRATE-VERIFY ?auto_24104 ?auto_24105 ?auto_24106 ?auto_24107 ?auto_24108 ?auto_24109 ?auto_24110 ?auto_24111 ?auto_24112 ?auto_24113 ?auto_24114 ?auto_24115 ?auto_24116 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_24170 - SURFACE
      ?auto_24171 - SURFACE
      ?auto_24172 - SURFACE
      ?auto_24173 - SURFACE
      ?auto_24174 - SURFACE
      ?auto_24175 - SURFACE
      ?auto_24176 - SURFACE
      ?auto_24177 - SURFACE
      ?auto_24178 - SURFACE
      ?auto_24179 - SURFACE
      ?auto_24180 - SURFACE
      ?auto_24181 - SURFACE
      ?auto_24182 - SURFACE
      ?auto_24183 - SURFACE
    )
    :vars
    (
      ?auto_24185 - HOIST
      ?auto_24184 - PLACE
      ?auto_24187 - PLACE
      ?auto_24189 - HOIST
      ?auto_24186 - SURFACE
      ?auto_24193 - PLACE
      ?auto_24206 - HOIST
      ?auto_24208 - SURFACE
      ?auto_24209 - PLACE
      ?auto_24204 - HOIST
      ?auto_24202 - SURFACE
      ?auto_24205 - PLACE
      ?auto_24197 - HOIST
      ?auto_24201 - SURFACE
      ?auto_24199 - SURFACE
      ?auto_24198 - PLACE
      ?auto_24200 - HOIST
      ?auto_24196 - SURFACE
      ?auto_24194 - SURFACE
      ?auto_24210 - SURFACE
      ?auto_24203 - PLACE
      ?auto_24212 - HOIST
      ?auto_24213 - SURFACE
      ?auto_24207 - SURFACE
      ?auto_24195 - SURFACE
      ?auto_24211 - SURFACE
      ?auto_24191 - PLACE
      ?auto_24190 - HOIST
      ?auto_24192 - SURFACE
      ?auto_24188 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24185 ?auto_24184 ) ( IS-CRATE ?auto_24183 ) ( not ( = ?auto_24187 ?auto_24184 ) ) ( HOIST-AT ?auto_24189 ?auto_24187 ) ( SURFACE-AT ?auto_24183 ?auto_24187 ) ( ON ?auto_24183 ?auto_24186 ) ( CLEAR ?auto_24183 ) ( not ( = ?auto_24182 ?auto_24183 ) ) ( not ( = ?auto_24182 ?auto_24186 ) ) ( not ( = ?auto_24183 ?auto_24186 ) ) ( not ( = ?auto_24185 ?auto_24189 ) ) ( IS-CRATE ?auto_24182 ) ( not ( = ?auto_24193 ?auto_24184 ) ) ( HOIST-AT ?auto_24206 ?auto_24193 ) ( AVAILABLE ?auto_24206 ) ( SURFACE-AT ?auto_24182 ?auto_24193 ) ( ON ?auto_24182 ?auto_24208 ) ( CLEAR ?auto_24182 ) ( not ( = ?auto_24181 ?auto_24182 ) ) ( not ( = ?auto_24181 ?auto_24208 ) ) ( not ( = ?auto_24182 ?auto_24208 ) ) ( not ( = ?auto_24185 ?auto_24206 ) ) ( IS-CRATE ?auto_24181 ) ( not ( = ?auto_24209 ?auto_24184 ) ) ( HOIST-AT ?auto_24204 ?auto_24209 ) ( SURFACE-AT ?auto_24181 ?auto_24209 ) ( ON ?auto_24181 ?auto_24202 ) ( CLEAR ?auto_24181 ) ( not ( = ?auto_24180 ?auto_24181 ) ) ( not ( = ?auto_24180 ?auto_24202 ) ) ( not ( = ?auto_24181 ?auto_24202 ) ) ( not ( = ?auto_24185 ?auto_24204 ) ) ( IS-CRATE ?auto_24180 ) ( not ( = ?auto_24205 ?auto_24184 ) ) ( HOIST-AT ?auto_24197 ?auto_24205 ) ( AVAILABLE ?auto_24197 ) ( SURFACE-AT ?auto_24180 ?auto_24205 ) ( ON ?auto_24180 ?auto_24201 ) ( CLEAR ?auto_24180 ) ( not ( = ?auto_24179 ?auto_24180 ) ) ( not ( = ?auto_24179 ?auto_24201 ) ) ( not ( = ?auto_24180 ?auto_24201 ) ) ( not ( = ?auto_24185 ?auto_24197 ) ) ( IS-CRATE ?auto_24179 ) ( SURFACE-AT ?auto_24179 ?auto_24187 ) ( ON ?auto_24179 ?auto_24199 ) ( CLEAR ?auto_24179 ) ( not ( = ?auto_24178 ?auto_24179 ) ) ( not ( = ?auto_24178 ?auto_24199 ) ) ( not ( = ?auto_24179 ?auto_24199 ) ) ( IS-CRATE ?auto_24178 ) ( not ( = ?auto_24198 ?auto_24184 ) ) ( HOIST-AT ?auto_24200 ?auto_24198 ) ( SURFACE-AT ?auto_24178 ?auto_24198 ) ( ON ?auto_24178 ?auto_24196 ) ( CLEAR ?auto_24178 ) ( not ( = ?auto_24177 ?auto_24178 ) ) ( not ( = ?auto_24177 ?auto_24196 ) ) ( not ( = ?auto_24178 ?auto_24196 ) ) ( not ( = ?auto_24185 ?auto_24200 ) ) ( IS-CRATE ?auto_24177 ) ( SURFACE-AT ?auto_24177 ?auto_24209 ) ( ON ?auto_24177 ?auto_24194 ) ( CLEAR ?auto_24177 ) ( not ( = ?auto_24176 ?auto_24177 ) ) ( not ( = ?auto_24176 ?auto_24194 ) ) ( not ( = ?auto_24177 ?auto_24194 ) ) ( IS-CRATE ?auto_24176 ) ( AVAILABLE ?auto_24200 ) ( SURFACE-AT ?auto_24176 ?auto_24198 ) ( ON ?auto_24176 ?auto_24210 ) ( CLEAR ?auto_24176 ) ( not ( = ?auto_24175 ?auto_24176 ) ) ( not ( = ?auto_24175 ?auto_24210 ) ) ( not ( = ?auto_24176 ?auto_24210 ) ) ( IS-CRATE ?auto_24175 ) ( not ( = ?auto_24203 ?auto_24184 ) ) ( HOIST-AT ?auto_24212 ?auto_24203 ) ( SURFACE-AT ?auto_24175 ?auto_24203 ) ( ON ?auto_24175 ?auto_24213 ) ( CLEAR ?auto_24175 ) ( not ( = ?auto_24174 ?auto_24175 ) ) ( not ( = ?auto_24174 ?auto_24213 ) ) ( not ( = ?auto_24175 ?auto_24213 ) ) ( not ( = ?auto_24185 ?auto_24212 ) ) ( IS-CRATE ?auto_24174 ) ( AVAILABLE ?auto_24189 ) ( SURFACE-AT ?auto_24174 ?auto_24187 ) ( ON ?auto_24174 ?auto_24207 ) ( CLEAR ?auto_24174 ) ( not ( = ?auto_24173 ?auto_24174 ) ) ( not ( = ?auto_24173 ?auto_24207 ) ) ( not ( = ?auto_24174 ?auto_24207 ) ) ( IS-CRATE ?auto_24173 ) ( AVAILABLE ?auto_24212 ) ( SURFACE-AT ?auto_24173 ?auto_24203 ) ( ON ?auto_24173 ?auto_24195 ) ( CLEAR ?auto_24173 ) ( not ( = ?auto_24172 ?auto_24173 ) ) ( not ( = ?auto_24172 ?auto_24195 ) ) ( not ( = ?auto_24173 ?auto_24195 ) ) ( IS-CRATE ?auto_24172 ) ( AVAILABLE ?auto_24204 ) ( SURFACE-AT ?auto_24172 ?auto_24209 ) ( ON ?auto_24172 ?auto_24211 ) ( CLEAR ?auto_24172 ) ( not ( = ?auto_24171 ?auto_24172 ) ) ( not ( = ?auto_24171 ?auto_24211 ) ) ( not ( = ?auto_24172 ?auto_24211 ) ) ( SURFACE-AT ?auto_24170 ?auto_24184 ) ( CLEAR ?auto_24170 ) ( IS-CRATE ?auto_24171 ) ( AVAILABLE ?auto_24185 ) ( not ( = ?auto_24191 ?auto_24184 ) ) ( HOIST-AT ?auto_24190 ?auto_24191 ) ( AVAILABLE ?auto_24190 ) ( SURFACE-AT ?auto_24171 ?auto_24191 ) ( ON ?auto_24171 ?auto_24192 ) ( CLEAR ?auto_24171 ) ( TRUCK-AT ?auto_24188 ?auto_24184 ) ( not ( = ?auto_24170 ?auto_24171 ) ) ( not ( = ?auto_24170 ?auto_24192 ) ) ( not ( = ?auto_24171 ?auto_24192 ) ) ( not ( = ?auto_24185 ?auto_24190 ) ) ( not ( = ?auto_24170 ?auto_24172 ) ) ( not ( = ?auto_24170 ?auto_24211 ) ) ( not ( = ?auto_24172 ?auto_24192 ) ) ( not ( = ?auto_24209 ?auto_24191 ) ) ( not ( = ?auto_24204 ?auto_24190 ) ) ( not ( = ?auto_24211 ?auto_24192 ) ) ( not ( = ?auto_24170 ?auto_24173 ) ) ( not ( = ?auto_24170 ?auto_24195 ) ) ( not ( = ?auto_24171 ?auto_24173 ) ) ( not ( = ?auto_24171 ?auto_24195 ) ) ( not ( = ?auto_24173 ?auto_24211 ) ) ( not ( = ?auto_24173 ?auto_24192 ) ) ( not ( = ?auto_24203 ?auto_24209 ) ) ( not ( = ?auto_24203 ?auto_24191 ) ) ( not ( = ?auto_24212 ?auto_24204 ) ) ( not ( = ?auto_24212 ?auto_24190 ) ) ( not ( = ?auto_24195 ?auto_24211 ) ) ( not ( = ?auto_24195 ?auto_24192 ) ) ( not ( = ?auto_24170 ?auto_24174 ) ) ( not ( = ?auto_24170 ?auto_24207 ) ) ( not ( = ?auto_24171 ?auto_24174 ) ) ( not ( = ?auto_24171 ?auto_24207 ) ) ( not ( = ?auto_24172 ?auto_24174 ) ) ( not ( = ?auto_24172 ?auto_24207 ) ) ( not ( = ?auto_24174 ?auto_24195 ) ) ( not ( = ?auto_24174 ?auto_24211 ) ) ( not ( = ?auto_24174 ?auto_24192 ) ) ( not ( = ?auto_24187 ?auto_24203 ) ) ( not ( = ?auto_24187 ?auto_24209 ) ) ( not ( = ?auto_24187 ?auto_24191 ) ) ( not ( = ?auto_24189 ?auto_24212 ) ) ( not ( = ?auto_24189 ?auto_24204 ) ) ( not ( = ?auto_24189 ?auto_24190 ) ) ( not ( = ?auto_24207 ?auto_24195 ) ) ( not ( = ?auto_24207 ?auto_24211 ) ) ( not ( = ?auto_24207 ?auto_24192 ) ) ( not ( = ?auto_24170 ?auto_24175 ) ) ( not ( = ?auto_24170 ?auto_24213 ) ) ( not ( = ?auto_24171 ?auto_24175 ) ) ( not ( = ?auto_24171 ?auto_24213 ) ) ( not ( = ?auto_24172 ?auto_24175 ) ) ( not ( = ?auto_24172 ?auto_24213 ) ) ( not ( = ?auto_24173 ?auto_24175 ) ) ( not ( = ?auto_24173 ?auto_24213 ) ) ( not ( = ?auto_24175 ?auto_24207 ) ) ( not ( = ?auto_24175 ?auto_24195 ) ) ( not ( = ?auto_24175 ?auto_24211 ) ) ( not ( = ?auto_24175 ?auto_24192 ) ) ( not ( = ?auto_24213 ?auto_24207 ) ) ( not ( = ?auto_24213 ?auto_24195 ) ) ( not ( = ?auto_24213 ?auto_24211 ) ) ( not ( = ?auto_24213 ?auto_24192 ) ) ( not ( = ?auto_24170 ?auto_24176 ) ) ( not ( = ?auto_24170 ?auto_24210 ) ) ( not ( = ?auto_24171 ?auto_24176 ) ) ( not ( = ?auto_24171 ?auto_24210 ) ) ( not ( = ?auto_24172 ?auto_24176 ) ) ( not ( = ?auto_24172 ?auto_24210 ) ) ( not ( = ?auto_24173 ?auto_24176 ) ) ( not ( = ?auto_24173 ?auto_24210 ) ) ( not ( = ?auto_24174 ?auto_24176 ) ) ( not ( = ?auto_24174 ?auto_24210 ) ) ( not ( = ?auto_24176 ?auto_24213 ) ) ( not ( = ?auto_24176 ?auto_24207 ) ) ( not ( = ?auto_24176 ?auto_24195 ) ) ( not ( = ?auto_24176 ?auto_24211 ) ) ( not ( = ?auto_24176 ?auto_24192 ) ) ( not ( = ?auto_24198 ?auto_24203 ) ) ( not ( = ?auto_24198 ?auto_24187 ) ) ( not ( = ?auto_24198 ?auto_24209 ) ) ( not ( = ?auto_24198 ?auto_24191 ) ) ( not ( = ?auto_24200 ?auto_24212 ) ) ( not ( = ?auto_24200 ?auto_24189 ) ) ( not ( = ?auto_24200 ?auto_24204 ) ) ( not ( = ?auto_24200 ?auto_24190 ) ) ( not ( = ?auto_24210 ?auto_24213 ) ) ( not ( = ?auto_24210 ?auto_24207 ) ) ( not ( = ?auto_24210 ?auto_24195 ) ) ( not ( = ?auto_24210 ?auto_24211 ) ) ( not ( = ?auto_24210 ?auto_24192 ) ) ( not ( = ?auto_24170 ?auto_24177 ) ) ( not ( = ?auto_24170 ?auto_24194 ) ) ( not ( = ?auto_24171 ?auto_24177 ) ) ( not ( = ?auto_24171 ?auto_24194 ) ) ( not ( = ?auto_24172 ?auto_24177 ) ) ( not ( = ?auto_24172 ?auto_24194 ) ) ( not ( = ?auto_24173 ?auto_24177 ) ) ( not ( = ?auto_24173 ?auto_24194 ) ) ( not ( = ?auto_24174 ?auto_24177 ) ) ( not ( = ?auto_24174 ?auto_24194 ) ) ( not ( = ?auto_24175 ?auto_24177 ) ) ( not ( = ?auto_24175 ?auto_24194 ) ) ( not ( = ?auto_24177 ?auto_24210 ) ) ( not ( = ?auto_24177 ?auto_24213 ) ) ( not ( = ?auto_24177 ?auto_24207 ) ) ( not ( = ?auto_24177 ?auto_24195 ) ) ( not ( = ?auto_24177 ?auto_24211 ) ) ( not ( = ?auto_24177 ?auto_24192 ) ) ( not ( = ?auto_24194 ?auto_24210 ) ) ( not ( = ?auto_24194 ?auto_24213 ) ) ( not ( = ?auto_24194 ?auto_24207 ) ) ( not ( = ?auto_24194 ?auto_24195 ) ) ( not ( = ?auto_24194 ?auto_24211 ) ) ( not ( = ?auto_24194 ?auto_24192 ) ) ( not ( = ?auto_24170 ?auto_24178 ) ) ( not ( = ?auto_24170 ?auto_24196 ) ) ( not ( = ?auto_24171 ?auto_24178 ) ) ( not ( = ?auto_24171 ?auto_24196 ) ) ( not ( = ?auto_24172 ?auto_24178 ) ) ( not ( = ?auto_24172 ?auto_24196 ) ) ( not ( = ?auto_24173 ?auto_24178 ) ) ( not ( = ?auto_24173 ?auto_24196 ) ) ( not ( = ?auto_24174 ?auto_24178 ) ) ( not ( = ?auto_24174 ?auto_24196 ) ) ( not ( = ?auto_24175 ?auto_24178 ) ) ( not ( = ?auto_24175 ?auto_24196 ) ) ( not ( = ?auto_24176 ?auto_24178 ) ) ( not ( = ?auto_24176 ?auto_24196 ) ) ( not ( = ?auto_24178 ?auto_24194 ) ) ( not ( = ?auto_24178 ?auto_24210 ) ) ( not ( = ?auto_24178 ?auto_24213 ) ) ( not ( = ?auto_24178 ?auto_24207 ) ) ( not ( = ?auto_24178 ?auto_24195 ) ) ( not ( = ?auto_24178 ?auto_24211 ) ) ( not ( = ?auto_24178 ?auto_24192 ) ) ( not ( = ?auto_24196 ?auto_24194 ) ) ( not ( = ?auto_24196 ?auto_24210 ) ) ( not ( = ?auto_24196 ?auto_24213 ) ) ( not ( = ?auto_24196 ?auto_24207 ) ) ( not ( = ?auto_24196 ?auto_24195 ) ) ( not ( = ?auto_24196 ?auto_24211 ) ) ( not ( = ?auto_24196 ?auto_24192 ) ) ( not ( = ?auto_24170 ?auto_24179 ) ) ( not ( = ?auto_24170 ?auto_24199 ) ) ( not ( = ?auto_24171 ?auto_24179 ) ) ( not ( = ?auto_24171 ?auto_24199 ) ) ( not ( = ?auto_24172 ?auto_24179 ) ) ( not ( = ?auto_24172 ?auto_24199 ) ) ( not ( = ?auto_24173 ?auto_24179 ) ) ( not ( = ?auto_24173 ?auto_24199 ) ) ( not ( = ?auto_24174 ?auto_24179 ) ) ( not ( = ?auto_24174 ?auto_24199 ) ) ( not ( = ?auto_24175 ?auto_24179 ) ) ( not ( = ?auto_24175 ?auto_24199 ) ) ( not ( = ?auto_24176 ?auto_24179 ) ) ( not ( = ?auto_24176 ?auto_24199 ) ) ( not ( = ?auto_24177 ?auto_24179 ) ) ( not ( = ?auto_24177 ?auto_24199 ) ) ( not ( = ?auto_24179 ?auto_24196 ) ) ( not ( = ?auto_24179 ?auto_24194 ) ) ( not ( = ?auto_24179 ?auto_24210 ) ) ( not ( = ?auto_24179 ?auto_24213 ) ) ( not ( = ?auto_24179 ?auto_24207 ) ) ( not ( = ?auto_24179 ?auto_24195 ) ) ( not ( = ?auto_24179 ?auto_24211 ) ) ( not ( = ?auto_24179 ?auto_24192 ) ) ( not ( = ?auto_24199 ?auto_24196 ) ) ( not ( = ?auto_24199 ?auto_24194 ) ) ( not ( = ?auto_24199 ?auto_24210 ) ) ( not ( = ?auto_24199 ?auto_24213 ) ) ( not ( = ?auto_24199 ?auto_24207 ) ) ( not ( = ?auto_24199 ?auto_24195 ) ) ( not ( = ?auto_24199 ?auto_24211 ) ) ( not ( = ?auto_24199 ?auto_24192 ) ) ( not ( = ?auto_24170 ?auto_24180 ) ) ( not ( = ?auto_24170 ?auto_24201 ) ) ( not ( = ?auto_24171 ?auto_24180 ) ) ( not ( = ?auto_24171 ?auto_24201 ) ) ( not ( = ?auto_24172 ?auto_24180 ) ) ( not ( = ?auto_24172 ?auto_24201 ) ) ( not ( = ?auto_24173 ?auto_24180 ) ) ( not ( = ?auto_24173 ?auto_24201 ) ) ( not ( = ?auto_24174 ?auto_24180 ) ) ( not ( = ?auto_24174 ?auto_24201 ) ) ( not ( = ?auto_24175 ?auto_24180 ) ) ( not ( = ?auto_24175 ?auto_24201 ) ) ( not ( = ?auto_24176 ?auto_24180 ) ) ( not ( = ?auto_24176 ?auto_24201 ) ) ( not ( = ?auto_24177 ?auto_24180 ) ) ( not ( = ?auto_24177 ?auto_24201 ) ) ( not ( = ?auto_24178 ?auto_24180 ) ) ( not ( = ?auto_24178 ?auto_24201 ) ) ( not ( = ?auto_24180 ?auto_24199 ) ) ( not ( = ?auto_24180 ?auto_24196 ) ) ( not ( = ?auto_24180 ?auto_24194 ) ) ( not ( = ?auto_24180 ?auto_24210 ) ) ( not ( = ?auto_24180 ?auto_24213 ) ) ( not ( = ?auto_24180 ?auto_24207 ) ) ( not ( = ?auto_24180 ?auto_24195 ) ) ( not ( = ?auto_24180 ?auto_24211 ) ) ( not ( = ?auto_24180 ?auto_24192 ) ) ( not ( = ?auto_24205 ?auto_24187 ) ) ( not ( = ?auto_24205 ?auto_24198 ) ) ( not ( = ?auto_24205 ?auto_24209 ) ) ( not ( = ?auto_24205 ?auto_24203 ) ) ( not ( = ?auto_24205 ?auto_24191 ) ) ( not ( = ?auto_24197 ?auto_24189 ) ) ( not ( = ?auto_24197 ?auto_24200 ) ) ( not ( = ?auto_24197 ?auto_24204 ) ) ( not ( = ?auto_24197 ?auto_24212 ) ) ( not ( = ?auto_24197 ?auto_24190 ) ) ( not ( = ?auto_24201 ?auto_24199 ) ) ( not ( = ?auto_24201 ?auto_24196 ) ) ( not ( = ?auto_24201 ?auto_24194 ) ) ( not ( = ?auto_24201 ?auto_24210 ) ) ( not ( = ?auto_24201 ?auto_24213 ) ) ( not ( = ?auto_24201 ?auto_24207 ) ) ( not ( = ?auto_24201 ?auto_24195 ) ) ( not ( = ?auto_24201 ?auto_24211 ) ) ( not ( = ?auto_24201 ?auto_24192 ) ) ( not ( = ?auto_24170 ?auto_24181 ) ) ( not ( = ?auto_24170 ?auto_24202 ) ) ( not ( = ?auto_24171 ?auto_24181 ) ) ( not ( = ?auto_24171 ?auto_24202 ) ) ( not ( = ?auto_24172 ?auto_24181 ) ) ( not ( = ?auto_24172 ?auto_24202 ) ) ( not ( = ?auto_24173 ?auto_24181 ) ) ( not ( = ?auto_24173 ?auto_24202 ) ) ( not ( = ?auto_24174 ?auto_24181 ) ) ( not ( = ?auto_24174 ?auto_24202 ) ) ( not ( = ?auto_24175 ?auto_24181 ) ) ( not ( = ?auto_24175 ?auto_24202 ) ) ( not ( = ?auto_24176 ?auto_24181 ) ) ( not ( = ?auto_24176 ?auto_24202 ) ) ( not ( = ?auto_24177 ?auto_24181 ) ) ( not ( = ?auto_24177 ?auto_24202 ) ) ( not ( = ?auto_24178 ?auto_24181 ) ) ( not ( = ?auto_24178 ?auto_24202 ) ) ( not ( = ?auto_24179 ?auto_24181 ) ) ( not ( = ?auto_24179 ?auto_24202 ) ) ( not ( = ?auto_24181 ?auto_24201 ) ) ( not ( = ?auto_24181 ?auto_24199 ) ) ( not ( = ?auto_24181 ?auto_24196 ) ) ( not ( = ?auto_24181 ?auto_24194 ) ) ( not ( = ?auto_24181 ?auto_24210 ) ) ( not ( = ?auto_24181 ?auto_24213 ) ) ( not ( = ?auto_24181 ?auto_24207 ) ) ( not ( = ?auto_24181 ?auto_24195 ) ) ( not ( = ?auto_24181 ?auto_24211 ) ) ( not ( = ?auto_24181 ?auto_24192 ) ) ( not ( = ?auto_24202 ?auto_24201 ) ) ( not ( = ?auto_24202 ?auto_24199 ) ) ( not ( = ?auto_24202 ?auto_24196 ) ) ( not ( = ?auto_24202 ?auto_24194 ) ) ( not ( = ?auto_24202 ?auto_24210 ) ) ( not ( = ?auto_24202 ?auto_24213 ) ) ( not ( = ?auto_24202 ?auto_24207 ) ) ( not ( = ?auto_24202 ?auto_24195 ) ) ( not ( = ?auto_24202 ?auto_24211 ) ) ( not ( = ?auto_24202 ?auto_24192 ) ) ( not ( = ?auto_24170 ?auto_24182 ) ) ( not ( = ?auto_24170 ?auto_24208 ) ) ( not ( = ?auto_24171 ?auto_24182 ) ) ( not ( = ?auto_24171 ?auto_24208 ) ) ( not ( = ?auto_24172 ?auto_24182 ) ) ( not ( = ?auto_24172 ?auto_24208 ) ) ( not ( = ?auto_24173 ?auto_24182 ) ) ( not ( = ?auto_24173 ?auto_24208 ) ) ( not ( = ?auto_24174 ?auto_24182 ) ) ( not ( = ?auto_24174 ?auto_24208 ) ) ( not ( = ?auto_24175 ?auto_24182 ) ) ( not ( = ?auto_24175 ?auto_24208 ) ) ( not ( = ?auto_24176 ?auto_24182 ) ) ( not ( = ?auto_24176 ?auto_24208 ) ) ( not ( = ?auto_24177 ?auto_24182 ) ) ( not ( = ?auto_24177 ?auto_24208 ) ) ( not ( = ?auto_24178 ?auto_24182 ) ) ( not ( = ?auto_24178 ?auto_24208 ) ) ( not ( = ?auto_24179 ?auto_24182 ) ) ( not ( = ?auto_24179 ?auto_24208 ) ) ( not ( = ?auto_24180 ?auto_24182 ) ) ( not ( = ?auto_24180 ?auto_24208 ) ) ( not ( = ?auto_24182 ?auto_24202 ) ) ( not ( = ?auto_24182 ?auto_24201 ) ) ( not ( = ?auto_24182 ?auto_24199 ) ) ( not ( = ?auto_24182 ?auto_24196 ) ) ( not ( = ?auto_24182 ?auto_24194 ) ) ( not ( = ?auto_24182 ?auto_24210 ) ) ( not ( = ?auto_24182 ?auto_24213 ) ) ( not ( = ?auto_24182 ?auto_24207 ) ) ( not ( = ?auto_24182 ?auto_24195 ) ) ( not ( = ?auto_24182 ?auto_24211 ) ) ( not ( = ?auto_24182 ?auto_24192 ) ) ( not ( = ?auto_24193 ?auto_24209 ) ) ( not ( = ?auto_24193 ?auto_24205 ) ) ( not ( = ?auto_24193 ?auto_24187 ) ) ( not ( = ?auto_24193 ?auto_24198 ) ) ( not ( = ?auto_24193 ?auto_24203 ) ) ( not ( = ?auto_24193 ?auto_24191 ) ) ( not ( = ?auto_24206 ?auto_24204 ) ) ( not ( = ?auto_24206 ?auto_24197 ) ) ( not ( = ?auto_24206 ?auto_24189 ) ) ( not ( = ?auto_24206 ?auto_24200 ) ) ( not ( = ?auto_24206 ?auto_24212 ) ) ( not ( = ?auto_24206 ?auto_24190 ) ) ( not ( = ?auto_24208 ?auto_24202 ) ) ( not ( = ?auto_24208 ?auto_24201 ) ) ( not ( = ?auto_24208 ?auto_24199 ) ) ( not ( = ?auto_24208 ?auto_24196 ) ) ( not ( = ?auto_24208 ?auto_24194 ) ) ( not ( = ?auto_24208 ?auto_24210 ) ) ( not ( = ?auto_24208 ?auto_24213 ) ) ( not ( = ?auto_24208 ?auto_24207 ) ) ( not ( = ?auto_24208 ?auto_24195 ) ) ( not ( = ?auto_24208 ?auto_24211 ) ) ( not ( = ?auto_24208 ?auto_24192 ) ) ( not ( = ?auto_24170 ?auto_24183 ) ) ( not ( = ?auto_24170 ?auto_24186 ) ) ( not ( = ?auto_24171 ?auto_24183 ) ) ( not ( = ?auto_24171 ?auto_24186 ) ) ( not ( = ?auto_24172 ?auto_24183 ) ) ( not ( = ?auto_24172 ?auto_24186 ) ) ( not ( = ?auto_24173 ?auto_24183 ) ) ( not ( = ?auto_24173 ?auto_24186 ) ) ( not ( = ?auto_24174 ?auto_24183 ) ) ( not ( = ?auto_24174 ?auto_24186 ) ) ( not ( = ?auto_24175 ?auto_24183 ) ) ( not ( = ?auto_24175 ?auto_24186 ) ) ( not ( = ?auto_24176 ?auto_24183 ) ) ( not ( = ?auto_24176 ?auto_24186 ) ) ( not ( = ?auto_24177 ?auto_24183 ) ) ( not ( = ?auto_24177 ?auto_24186 ) ) ( not ( = ?auto_24178 ?auto_24183 ) ) ( not ( = ?auto_24178 ?auto_24186 ) ) ( not ( = ?auto_24179 ?auto_24183 ) ) ( not ( = ?auto_24179 ?auto_24186 ) ) ( not ( = ?auto_24180 ?auto_24183 ) ) ( not ( = ?auto_24180 ?auto_24186 ) ) ( not ( = ?auto_24181 ?auto_24183 ) ) ( not ( = ?auto_24181 ?auto_24186 ) ) ( not ( = ?auto_24183 ?auto_24208 ) ) ( not ( = ?auto_24183 ?auto_24202 ) ) ( not ( = ?auto_24183 ?auto_24201 ) ) ( not ( = ?auto_24183 ?auto_24199 ) ) ( not ( = ?auto_24183 ?auto_24196 ) ) ( not ( = ?auto_24183 ?auto_24194 ) ) ( not ( = ?auto_24183 ?auto_24210 ) ) ( not ( = ?auto_24183 ?auto_24213 ) ) ( not ( = ?auto_24183 ?auto_24207 ) ) ( not ( = ?auto_24183 ?auto_24195 ) ) ( not ( = ?auto_24183 ?auto_24211 ) ) ( not ( = ?auto_24183 ?auto_24192 ) ) ( not ( = ?auto_24186 ?auto_24208 ) ) ( not ( = ?auto_24186 ?auto_24202 ) ) ( not ( = ?auto_24186 ?auto_24201 ) ) ( not ( = ?auto_24186 ?auto_24199 ) ) ( not ( = ?auto_24186 ?auto_24196 ) ) ( not ( = ?auto_24186 ?auto_24194 ) ) ( not ( = ?auto_24186 ?auto_24210 ) ) ( not ( = ?auto_24186 ?auto_24213 ) ) ( not ( = ?auto_24186 ?auto_24207 ) ) ( not ( = ?auto_24186 ?auto_24195 ) ) ( not ( = ?auto_24186 ?auto_24211 ) ) ( not ( = ?auto_24186 ?auto_24192 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_24170 ?auto_24171 ?auto_24172 ?auto_24173 ?auto_24174 ?auto_24175 ?auto_24176 ?auto_24177 ?auto_24178 ?auto_24179 ?auto_24180 ?auto_24181 ?auto_24182 )
      ( MAKE-1CRATE ?auto_24182 ?auto_24183 )
      ( MAKE-13CRATE-VERIFY ?auto_24170 ?auto_24171 ?auto_24172 ?auto_24173 ?auto_24174 ?auto_24175 ?auto_24176 ?auto_24177 ?auto_24178 ?auto_24179 ?auto_24180 ?auto_24181 ?auto_24182 ?auto_24183 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_24239 - SURFACE
      ?auto_24240 - SURFACE
      ?auto_24241 - SURFACE
      ?auto_24242 - SURFACE
      ?auto_24243 - SURFACE
      ?auto_24244 - SURFACE
      ?auto_24245 - SURFACE
      ?auto_24246 - SURFACE
      ?auto_24247 - SURFACE
      ?auto_24248 - SURFACE
      ?auto_24249 - SURFACE
      ?auto_24250 - SURFACE
      ?auto_24251 - SURFACE
      ?auto_24252 - SURFACE
      ?auto_24253 - SURFACE
    )
    :vars
    (
      ?auto_24259 - HOIST
      ?auto_24254 - PLACE
      ?auto_24257 - PLACE
      ?auto_24255 - HOIST
      ?auto_24258 - SURFACE
      ?auto_24261 - SURFACE
      ?auto_24279 - PLACE
      ?auto_24280 - HOIST
      ?auto_24266 - SURFACE
      ?auto_24282 - PLACE
      ?auto_24273 - HOIST
      ?auto_24278 - SURFACE
      ?auto_24271 - PLACE
      ?auto_24274 - HOIST
      ?auto_24262 - SURFACE
      ?auto_24284 - SURFACE
      ?auto_24264 - PLACE
      ?auto_24260 - HOIST
      ?auto_24268 - SURFACE
      ?auto_24276 - SURFACE
      ?auto_24272 - SURFACE
      ?auto_24270 - PLACE
      ?auto_24267 - HOIST
      ?auto_24283 - SURFACE
      ?auto_24281 - SURFACE
      ?auto_24265 - SURFACE
      ?auto_24277 - SURFACE
      ?auto_24275 - PLACE
      ?auto_24269 - HOIST
      ?auto_24263 - SURFACE
      ?auto_24256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24259 ?auto_24254 ) ( IS-CRATE ?auto_24253 ) ( not ( = ?auto_24257 ?auto_24254 ) ) ( HOIST-AT ?auto_24255 ?auto_24257 ) ( SURFACE-AT ?auto_24253 ?auto_24257 ) ( ON ?auto_24253 ?auto_24258 ) ( CLEAR ?auto_24253 ) ( not ( = ?auto_24252 ?auto_24253 ) ) ( not ( = ?auto_24252 ?auto_24258 ) ) ( not ( = ?auto_24253 ?auto_24258 ) ) ( not ( = ?auto_24259 ?auto_24255 ) ) ( IS-CRATE ?auto_24252 ) ( SURFACE-AT ?auto_24252 ?auto_24257 ) ( ON ?auto_24252 ?auto_24261 ) ( CLEAR ?auto_24252 ) ( not ( = ?auto_24251 ?auto_24252 ) ) ( not ( = ?auto_24251 ?auto_24261 ) ) ( not ( = ?auto_24252 ?auto_24261 ) ) ( IS-CRATE ?auto_24251 ) ( not ( = ?auto_24279 ?auto_24254 ) ) ( HOIST-AT ?auto_24280 ?auto_24279 ) ( AVAILABLE ?auto_24280 ) ( SURFACE-AT ?auto_24251 ?auto_24279 ) ( ON ?auto_24251 ?auto_24266 ) ( CLEAR ?auto_24251 ) ( not ( = ?auto_24250 ?auto_24251 ) ) ( not ( = ?auto_24250 ?auto_24266 ) ) ( not ( = ?auto_24251 ?auto_24266 ) ) ( not ( = ?auto_24259 ?auto_24280 ) ) ( IS-CRATE ?auto_24250 ) ( not ( = ?auto_24282 ?auto_24254 ) ) ( HOIST-AT ?auto_24273 ?auto_24282 ) ( SURFACE-AT ?auto_24250 ?auto_24282 ) ( ON ?auto_24250 ?auto_24278 ) ( CLEAR ?auto_24250 ) ( not ( = ?auto_24249 ?auto_24250 ) ) ( not ( = ?auto_24249 ?auto_24278 ) ) ( not ( = ?auto_24250 ?auto_24278 ) ) ( not ( = ?auto_24259 ?auto_24273 ) ) ( IS-CRATE ?auto_24249 ) ( not ( = ?auto_24271 ?auto_24254 ) ) ( HOIST-AT ?auto_24274 ?auto_24271 ) ( AVAILABLE ?auto_24274 ) ( SURFACE-AT ?auto_24249 ?auto_24271 ) ( ON ?auto_24249 ?auto_24262 ) ( CLEAR ?auto_24249 ) ( not ( = ?auto_24248 ?auto_24249 ) ) ( not ( = ?auto_24248 ?auto_24262 ) ) ( not ( = ?auto_24249 ?auto_24262 ) ) ( not ( = ?auto_24259 ?auto_24274 ) ) ( IS-CRATE ?auto_24248 ) ( SURFACE-AT ?auto_24248 ?auto_24257 ) ( ON ?auto_24248 ?auto_24284 ) ( CLEAR ?auto_24248 ) ( not ( = ?auto_24247 ?auto_24248 ) ) ( not ( = ?auto_24247 ?auto_24284 ) ) ( not ( = ?auto_24248 ?auto_24284 ) ) ( IS-CRATE ?auto_24247 ) ( not ( = ?auto_24264 ?auto_24254 ) ) ( HOIST-AT ?auto_24260 ?auto_24264 ) ( SURFACE-AT ?auto_24247 ?auto_24264 ) ( ON ?auto_24247 ?auto_24268 ) ( CLEAR ?auto_24247 ) ( not ( = ?auto_24246 ?auto_24247 ) ) ( not ( = ?auto_24246 ?auto_24268 ) ) ( not ( = ?auto_24247 ?auto_24268 ) ) ( not ( = ?auto_24259 ?auto_24260 ) ) ( IS-CRATE ?auto_24246 ) ( SURFACE-AT ?auto_24246 ?auto_24282 ) ( ON ?auto_24246 ?auto_24276 ) ( CLEAR ?auto_24246 ) ( not ( = ?auto_24245 ?auto_24246 ) ) ( not ( = ?auto_24245 ?auto_24276 ) ) ( not ( = ?auto_24246 ?auto_24276 ) ) ( IS-CRATE ?auto_24245 ) ( AVAILABLE ?auto_24260 ) ( SURFACE-AT ?auto_24245 ?auto_24264 ) ( ON ?auto_24245 ?auto_24272 ) ( CLEAR ?auto_24245 ) ( not ( = ?auto_24244 ?auto_24245 ) ) ( not ( = ?auto_24244 ?auto_24272 ) ) ( not ( = ?auto_24245 ?auto_24272 ) ) ( IS-CRATE ?auto_24244 ) ( not ( = ?auto_24270 ?auto_24254 ) ) ( HOIST-AT ?auto_24267 ?auto_24270 ) ( SURFACE-AT ?auto_24244 ?auto_24270 ) ( ON ?auto_24244 ?auto_24283 ) ( CLEAR ?auto_24244 ) ( not ( = ?auto_24243 ?auto_24244 ) ) ( not ( = ?auto_24243 ?auto_24283 ) ) ( not ( = ?auto_24244 ?auto_24283 ) ) ( not ( = ?auto_24259 ?auto_24267 ) ) ( IS-CRATE ?auto_24243 ) ( AVAILABLE ?auto_24255 ) ( SURFACE-AT ?auto_24243 ?auto_24257 ) ( ON ?auto_24243 ?auto_24281 ) ( CLEAR ?auto_24243 ) ( not ( = ?auto_24242 ?auto_24243 ) ) ( not ( = ?auto_24242 ?auto_24281 ) ) ( not ( = ?auto_24243 ?auto_24281 ) ) ( IS-CRATE ?auto_24242 ) ( AVAILABLE ?auto_24267 ) ( SURFACE-AT ?auto_24242 ?auto_24270 ) ( ON ?auto_24242 ?auto_24265 ) ( CLEAR ?auto_24242 ) ( not ( = ?auto_24241 ?auto_24242 ) ) ( not ( = ?auto_24241 ?auto_24265 ) ) ( not ( = ?auto_24242 ?auto_24265 ) ) ( IS-CRATE ?auto_24241 ) ( AVAILABLE ?auto_24273 ) ( SURFACE-AT ?auto_24241 ?auto_24282 ) ( ON ?auto_24241 ?auto_24277 ) ( CLEAR ?auto_24241 ) ( not ( = ?auto_24240 ?auto_24241 ) ) ( not ( = ?auto_24240 ?auto_24277 ) ) ( not ( = ?auto_24241 ?auto_24277 ) ) ( SURFACE-AT ?auto_24239 ?auto_24254 ) ( CLEAR ?auto_24239 ) ( IS-CRATE ?auto_24240 ) ( AVAILABLE ?auto_24259 ) ( not ( = ?auto_24275 ?auto_24254 ) ) ( HOIST-AT ?auto_24269 ?auto_24275 ) ( AVAILABLE ?auto_24269 ) ( SURFACE-AT ?auto_24240 ?auto_24275 ) ( ON ?auto_24240 ?auto_24263 ) ( CLEAR ?auto_24240 ) ( TRUCK-AT ?auto_24256 ?auto_24254 ) ( not ( = ?auto_24239 ?auto_24240 ) ) ( not ( = ?auto_24239 ?auto_24263 ) ) ( not ( = ?auto_24240 ?auto_24263 ) ) ( not ( = ?auto_24259 ?auto_24269 ) ) ( not ( = ?auto_24239 ?auto_24241 ) ) ( not ( = ?auto_24239 ?auto_24277 ) ) ( not ( = ?auto_24241 ?auto_24263 ) ) ( not ( = ?auto_24282 ?auto_24275 ) ) ( not ( = ?auto_24273 ?auto_24269 ) ) ( not ( = ?auto_24277 ?auto_24263 ) ) ( not ( = ?auto_24239 ?auto_24242 ) ) ( not ( = ?auto_24239 ?auto_24265 ) ) ( not ( = ?auto_24240 ?auto_24242 ) ) ( not ( = ?auto_24240 ?auto_24265 ) ) ( not ( = ?auto_24242 ?auto_24277 ) ) ( not ( = ?auto_24242 ?auto_24263 ) ) ( not ( = ?auto_24270 ?auto_24282 ) ) ( not ( = ?auto_24270 ?auto_24275 ) ) ( not ( = ?auto_24267 ?auto_24273 ) ) ( not ( = ?auto_24267 ?auto_24269 ) ) ( not ( = ?auto_24265 ?auto_24277 ) ) ( not ( = ?auto_24265 ?auto_24263 ) ) ( not ( = ?auto_24239 ?auto_24243 ) ) ( not ( = ?auto_24239 ?auto_24281 ) ) ( not ( = ?auto_24240 ?auto_24243 ) ) ( not ( = ?auto_24240 ?auto_24281 ) ) ( not ( = ?auto_24241 ?auto_24243 ) ) ( not ( = ?auto_24241 ?auto_24281 ) ) ( not ( = ?auto_24243 ?auto_24265 ) ) ( not ( = ?auto_24243 ?auto_24277 ) ) ( not ( = ?auto_24243 ?auto_24263 ) ) ( not ( = ?auto_24257 ?auto_24270 ) ) ( not ( = ?auto_24257 ?auto_24282 ) ) ( not ( = ?auto_24257 ?auto_24275 ) ) ( not ( = ?auto_24255 ?auto_24267 ) ) ( not ( = ?auto_24255 ?auto_24273 ) ) ( not ( = ?auto_24255 ?auto_24269 ) ) ( not ( = ?auto_24281 ?auto_24265 ) ) ( not ( = ?auto_24281 ?auto_24277 ) ) ( not ( = ?auto_24281 ?auto_24263 ) ) ( not ( = ?auto_24239 ?auto_24244 ) ) ( not ( = ?auto_24239 ?auto_24283 ) ) ( not ( = ?auto_24240 ?auto_24244 ) ) ( not ( = ?auto_24240 ?auto_24283 ) ) ( not ( = ?auto_24241 ?auto_24244 ) ) ( not ( = ?auto_24241 ?auto_24283 ) ) ( not ( = ?auto_24242 ?auto_24244 ) ) ( not ( = ?auto_24242 ?auto_24283 ) ) ( not ( = ?auto_24244 ?auto_24281 ) ) ( not ( = ?auto_24244 ?auto_24265 ) ) ( not ( = ?auto_24244 ?auto_24277 ) ) ( not ( = ?auto_24244 ?auto_24263 ) ) ( not ( = ?auto_24283 ?auto_24281 ) ) ( not ( = ?auto_24283 ?auto_24265 ) ) ( not ( = ?auto_24283 ?auto_24277 ) ) ( not ( = ?auto_24283 ?auto_24263 ) ) ( not ( = ?auto_24239 ?auto_24245 ) ) ( not ( = ?auto_24239 ?auto_24272 ) ) ( not ( = ?auto_24240 ?auto_24245 ) ) ( not ( = ?auto_24240 ?auto_24272 ) ) ( not ( = ?auto_24241 ?auto_24245 ) ) ( not ( = ?auto_24241 ?auto_24272 ) ) ( not ( = ?auto_24242 ?auto_24245 ) ) ( not ( = ?auto_24242 ?auto_24272 ) ) ( not ( = ?auto_24243 ?auto_24245 ) ) ( not ( = ?auto_24243 ?auto_24272 ) ) ( not ( = ?auto_24245 ?auto_24283 ) ) ( not ( = ?auto_24245 ?auto_24281 ) ) ( not ( = ?auto_24245 ?auto_24265 ) ) ( not ( = ?auto_24245 ?auto_24277 ) ) ( not ( = ?auto_24245 ?auto_24263 ) ) ( not ( = ?auto_24264 ?auto_24270 ) ) ( not ( = ?auto_24264 ?auto_24257 ) ) ( not ( = ?auto_24264 ?auto_24282 ) ) ( not ( = ?auto_24264 ?auto_24275 ) ) ( not ( = ?auto_24260 ?auto_24267 ) ) ( not ( = ?auto_24260 ?auto_24255 ) ) ( not ( = ?auto_24260 ?auto_24273 ) ) ( not ( = ?auto_24260 ?auto_24269 ) ) ( not ( = ?auto_24272 ?auto_24283 ) ) ( not ( = ?auto_24272 ?auto_24281 ) ) ( not ( = ?auto_24272 ?auto_24265 ) ) ( not ( = ?auto_24272 ?auto_24277 ) ) ( not ( = ?auto_24272 ?auto_24263 ) ) ( not ( = ?auto_24239 ?auto_24246 ) ) ( not ( = ?auto_24239 ?auto_24276 ) ) ( not ( = ?auto_24240 ?auto_24246 ) ) ( not ( = ?auto_24240 ?auto_24276 ) ) ( not ( = ?auto_24241 ?auto_24246 ) ) ( not ( = ?auto_24241 ?auto_24276 ) ) ( not ( = ?auto_24242 ?auto_24246 ) ) ( not ( = ?auto_24242 ?auto_24276 ) ) ( not ( = ?auto_24243 ?auto_24246 ) ) ( not ( = ?auto_24243 ?auto_24276 ) ) ( not ( = ?auto_24244 ?auto_24246 ) ) ( not ( = ?auto_24244 ?auto_24276 ) ) ( not ( = ?auto_24246 ?auto_24272 ) ) ( not ( = ?auto_24246 ?auto_24283 ) ) ( not ( = ?auto_24246 ?auto_24281 ) ) ( not ( = ?auto_24246 ?auto_24265 ) ) ( not ( = ?auto_24246 ?auto_24277 ) ) ( not ( = ?auto_24246 ?auto_24263 ) ) ( not ( = ?auto_24276 ?auto_24272 ) ) ( not ( = ?auto_24276 ?auto_24283 ) ) ( not ( = ?auto_24276 ?auto_24281 ) ) ( not ( = ?auto_24276 ?auto_24265 ) ) ( not ( = ?auto_24276 ?auto_24277 ) ) ( not ( = ?auto_24276 ?auto_24263 ) ) ( not ( = ?auto_24239 ?auto_24247 ) ) ( not ( = ?auto_24239 ?auto_24268 ) ) ( not ( = ?auto_24240 ?auto_24247 ) ) ( not ( = ?auto_24240 ?auto_24268 ) ) ( not ( = ?auto_24241 ?auto_24247 ) ) ( not ( = ?auto_24241 ?auto_24268 ) ) ( not ( = ?auto_24242 ?auto_24247 ) ) ( not ( = ?auto_24242 ?auto_24268 ) ) ( not ( = ?auto_24243 ?auto_24247 ) ) ( not ( = ?auto_24243 ?auto_24268 ) ) ( not ( = ?auto_24244 ?auto_24247 ) ) ( not ( = ?auto_24244 ?auto_24268 ) ) ( not ( = ?auto_24245 ?auto_24247 ) ) ( not ( = ?auto_24245 ?auto_24268 ) ) ( not ( = ?auto_24247 ?auto_24276 ) ) ( not ( = ?auto_24247 ?auto_24272 ) ) ( not ( = ?auto_24247 ?auto_24283 ) ) ( not ( = ?auto_24247 ?auto_24281 ) ) ( not ( = ?auto_24247 ?auto_24265 ) ) ( not ( = ?auto_24247 ?auto_24277 ) ) ( not ( = ?auto_24247 ?auto_24263 ) ) ( not ( = ?auto_24268 ?auto_24276 ) ) ( not ( = ?auto_24268 ?auto_24272 ) ) ( not ( = ?auto_24268 ?auto_24283 ) ) ( not ( = ?auto_24268 ?auto_24281 ) ) ( not ( = ?auto_24268 ?auto_24265 ) ) ( not ( = ?auto_24268 ?auto_24277 ) ) ( not ( = ?auto_24268 ?auto_24263 ) ) ( not ( = ?auto_24239 ?auto_24248 ) ) ( not ( = ?auto_24239 ?auto_24284 ) ) ( not ( = ?auto_24240 ?auto_24248 ) ) ( not ( = ?auto_24240 ?auto_24284 ) ) ( not ( = ?auto_24241 ?auto_24248 ) ) ( not ( = ?auto_24241 ?auto_24284 ) ) ( not ( = ?auto_24242 ?auto_24248 ) ) ( not ( = ?auto_24242 ?auto_24284 ) ) ( not ( = ?auto_24243 ?auto_24248 ) ) ( not ( = ?auto_24243 ?auto_24284 ) ) ( not ( = ?auto_24244 ?auto_24248 ) ) ( not ( = ?auto_24244 ?auto_24284 ) ) ( not ( = ?auto_24245 ?auto_24248 ) ) ( not ( = ?auto_24245 ?auto_24284 ) ) ( not ( = ?auto_24246 ?auto_24248 ) ) ( not ( = ?auto_24246 ?auto_24284 ) ) ( not ( = ?auto_24248 ?auto_24268 ) ) ( not ( = ?auto_24248 ?auto_24276 ) ) ( not ( = ?auto_24248 ?auto_24272 ) ) ( not ( = ?auto_24248 ?auto_24283 ) ) ( not ( = ?auto_24248 ?auto_24281 ) ) ( not ( = ?auto_24248 ?auto_24265 ) ) ( not ( = ?auto_24248 ?auto_24277 ) ) ( not ( = ?auto_24248 ?auto_24263 ) ) ( not ( = ?auto_24284 ?auto_24268 ) ) ( not ( = ?auto_24284 ?auto_24276 ) ) ( not ( = ?auto_24284 ?auto_24272 ) ) ( not ( = ?auto_24284 ?auto_24283 ) ) ( not ( = ?auto_24284 ?auto_24281 ) ) ( not ( = ?auto_24284 ?auto_24265 ) ) ( not ( = ?auto_24284 ?auto_24277 ) ) ( not ( = ?auto_24284 ?auto_24263 ) ) ( not ( = ?auto_24239 ?auto_24249 ) ) ( not ( = ?auto_24239 ?auto_24262 ) ) ( not ( = ?auto_24240 ?auto_24249 ) ) ( not ( = ?auto_24240 ?auto_24262 ) ) ( not ( = ?auto_24241 ?auto_24249 ) ) ( not ( = ?auto_24241 ?auto_24262 ) ) ( not ( = ?auto_24242 ?auto_24249 ) ) ( not ( = ?auto_24242 ?auto_24262 ) ) ( not ( = ?auto_24243 ?auto_24249 ) ) ( not ( = ?auto_24243 ?auto_24262 ) ) ( not ( = ?auto_24244 ?auto_24249 ) ) ( not ( = ?auto_24244 ?auto_24262 ) ) ( not ( = ?auto_24245 ?auto_24249 ) ) ( not ( = ?auto_24245 ?auto_24262 ) ) ( not ( = ?auto_24246 ?auto_24249 ) ) ( not ( = ?auto_24246 ?auto_24262 ) ) ( not ( = ?auto_24247 ?auto_24249 ) ) ( not ( = ?auto_24247 ?auto_24262 ) ) ( not ( = ?auto_24249 ?auto_24284 ) ) ( not ( = ?auto_24249 ?auto_24268 ) ) ( not ( = ?auto_24249 ?auto_24276 ) ) ( not ( = ?auto_24249 ?auto_24272 ) ) ( not ( = ?auto_24249 ?auto_24283 ) ) ( not ( = ?auto_24249 ?auto_24281 ) ) ( not ( = ?auto_24249 ?auto_24265 ) ) ( not ( = ?auto_24249 ?auto_24277 ) ) ( not ( = ?auto_24249 ?auto_24263 ) ) ( not ( = ?auto_24271 ?auto_24257 ) ) ( not ( = ?auto_24271 ?auto_24264 ) ) ( not ( = ?auto_24271 ?auto_24282 ) ) ( not ( = ?auto_24271 ?auto_24270 ) ) ( not ( = ?auto_24271 ?auto_24275 ) ) ( not ( = ?auto_24274 ?auto_24255 ) ) ( not ( = ?auto_24274 ?auto_24260 ) ) ( not ( = ?auto_24274 ?auto_24273 ) ) ( not ( = ?auto_24274 ?auto_24267 ) ) ( not ( = ?auto_24274 ?auto_24269 ) ) ( not ( = ?auto_24262 ?auto_24284 ) ) ( not ( = ?auto_24262 ?auto_24268 ) ) ( not ( = ?auto_24262 ?auto_24276 ) ) ( not ( = ?auto_24262 ?auto_24272 ) ) ( not ( = ?auto_24262 ?auto_24283 ) ) ( not ( = ?auto_24262 ?auto_24281 ) ) ( not ( = ?auto_24262 ?auto_24265 ) ) ( not ( = ?auto_24262 ?auto_24277 ) ) ( not ( = ?auto_24262 ?auto_24263 ) ) ( not ( = ?auto_24239 ?auto_24250 ) ) ( not ( = ?auto_24239 ?auto_24278 ) ) ( not ( = ?auto_24240 ?auto_24250 ) ) ( not ( = ?auto_24240 ?auto_24278 ) ) ( not ( = ?auto_24241 ?auto_24250 ) ) ( not ( = ?auto_24241 ?auto_24278 ) ) ( not ( = ?auto_24242 ?auto_24250 ) ) ( not ( = ?auto_24242 ?auto_24278 ) ) ( not ( = ?auto_24243 ?auto_24250 ) ) ( not ( = ?auto_24243 ?auto_24278 ) ) ( not ( = ?auto_24244 ?auto_24250 ) ) ( not ( = ?auto_24244 ?auto_24278 ) ) ( not ( = ?auto_24245 ?auto_24250 ) ) ( not ( = ?auto_24245 ?auto_24278 ) ) ( not ( = ?auto_24246 ?auto_24250 ) ) ( not ( = ?auto_24246 ?auto_24278 ) ) ( not ( = ?auto_24247 ?auto_24250 ) ) ( not ( = ?auto_24247 ?auto_24278 ) ) ( not ( = ?auto_24248 ?auto_24250 ) ) ( not ( = ?auto_24248 ?auto_24278 ) ) ( not ( = ?auto_24250 ?auto_24262 ) ) ( not ( = ?auto_24250 ?auto_24284 ) ) ( not ( = ?auto_24250 ?auto_24268 ) ) ( not ( = ?auto_24250 ?auto_24276 ) ) ( not ( = ?auto_24250 ?auto_24272 ) ) ( not ( = ?auto_24250 ?auto_24283 ) ) ( not ( = ?auto_24250 ?auto_24281 ) ) ( not ( = ?auto_24250 ?auto_24265 ) ) ( not ( = ?auto_24250 ?auto_24277 ) ) ( not ( = ?auto_24250 ?auto_24263 ) ) ( not ( = ?auto_24278 ?auto_24262 ) ) ( not ( = ?auto_24278 ?auto_24284 ) ) ( not ( = ?auto_24278 ?auto_24268 ) ) ( not ( = ?auto_24278 ?auto_24276 ) ) ( not ( = ?auto_24278 ?auto_24272 ) ) ( not ( = ?auto_24278 ?auto_24283 ) ) ( not ( = ?auto_24278 ?auto_24281 ) ) ( not ( = ?auto_24278 ?auto_24265 ) ) ( not ( = ?auto_24278 ?auto_24277 ) ) ( not ( = ?auto_24278 ?auto_24263 ) ) ( not ( = ?auto_24239 ?auto_24251 ) ) ( not ( = ?auto_24239 ?auto_24266 ) ) ( not ( = ?auto_24240 ?auto_24251 ) ) ( not ( = ?auto_24240 ?auto_24266 ) ) ( not ( = ?auto_24241 ?auto_24251 ) ) ( not ( = ?auto_24241 ?auto_24266 ) ) ( not ( = ?auto_24242 ?auto_24251 ) ) ( not ( = ?auto_24242 ?auto_24266 ) ) ( not ( = ?auto_24243 ?auto_24251 ) ) ( not ( = ?auto_24243 ?auto_24266 ) ) ( not ( = ?auto_24244 ?auto_24251 ) ) ( not ( = ?auto_24244 ?auto_24266 ) ) ( not ( = ?auto_24245 ?auto_24251 ) ) ( not ( = ?auto_24245 ?auto_24266 ) ) ( not ( = ?auto_24246 ?auto_24251 ) ) ( not ( = ?auto_24246 ?auto_24266 ) ) ( not ( = ?auto_24247 ?auto_24251 ) ) ( not ( = ?auto_24247 ?auto_24266 ) ) ( not ( = ?auto_24248 ?auto_24251 ) ) ( not ( = ?auto_24248 ?auto_24266 ) ) ( not ( = ?auto_24249 ?auto_24251 ) ) ( not ( = ?auto_24249 ?auto_24266 ) ) ( not ( = ?auto_24251 ?auto_24278 ) ) ( not ( = ?auto_24251 ?auto_24262 ) ) ( not ( = ?auto_24251 ?auto_24284 ) ) ( not ( = ?auto_24251 ?auto_24268 ) ) ( not ( = ?auto_24251 ?auto_24276 ) ) ( not ( = ?auto_24251 ?auto_24272 ) ) ( not ( = ?auto_24251 ?auto_24283 ) ) ( not ( = ?auto_24251 ?auto_24281 ) ) ( not ( = ?auto_24251 ?auto_24265 ) ) ( not ( = ?auto_24251 ?auto_24277 ) ) ( not ( = ?auto_24251 ?auto_24263 ) ) ( not ( = ?auto_24279 ?auto_24282 ) ) ( not ( = ?auto_24279 ?auto_24271 ) ) ( not ( = ?auto_24279 ?auto_24257 ) ) ( not ( = ?auto_24279 ?auto_24264 ) ) ( not ( = ?auto_24279 ?auto_24270 ) ) ( not ( = ?auto_24279 ?auto_24275 ) ) ( not ( = ?auto_24280 ?auto_24273 ) ) ( not ( = ?auto_24280 ?auto_24274 ) ) ( not ( = ?auto_24280 ?auto_24255 ) ) ( not ( = ?auto_24280 ?auto_24260 ) ) ( not ( = ?auto_24280 ?auto_24267 ) ) ( not ( = ?auto_24280 ?auto_24269 ) ) ( not ( = ?auto_24266 ?auto_24278 ) ) ( not ( = ?auto_24266 ?auto_24262 ) ) ( not ( = ?auto_24266 ?auto_24284 ) ) ( not ( = ?auto_24266 ?auto_24268 ) ) ( not ( = ?auto_24266 ?auto_24276 ) ) ( not ( = ?auto_24266 ?auto_24272 ) ) ( not ( = ?auto_24266 ?auto_24283 ) ) ( not ( = ?auto_24266 ?auto_24281 ) ) ( not ( = ?auto_24266 ?auto_24265 ) ) ( not ( = ?auto_24266 ?auto_24277 ) ) ( not ( = ?auto_24266 ?auto_24263 ) ) ( not ( = ?auto_24239 ?auto_24252 ) ) ( not ( = ?auto_24239 ?auto_24261 ) ) ( not ( = ?auto_24240 ?auto_24252 ) ) ( not ( = ?auto_24240 ?auto_24261 ) ) ( not ( = ?auto_24241 ?auto_24252 ) ) ( not ( = ?auto_24241 ?auto_24261 ) ) ( not ( = ?auto_24242 ?auto_24252 ) ) ( not ( = ?auto_24242 ?auto_24261 ) ) ( not ( = ?auto_24243 ?auto_24252 ) ) ( not ( = ?auto_24243 ?auto_24261 ) ) ( not ( = ?auto_24244 ?auto_24252 ) ) ( not ( = ?auto_24244 ?auto_24261 ) ) ( not ( = ?auto_24245 ?auto_24252 ) ) ( not ( = ?auto_24245 ?auto_24261 ) ) ( not ( = ?auto_24246 ?auto_24252 ) ) ( not ( = ?auto_24246 ?auto_24261 ) ) ( not ( = ?auto_24247 ?auto_24252 ) ) ( not ( = ?auto_24247 ?auto_24261 ) ) ( not ( = ?auto_24248 ?auto_24252 ) ) ( not ( = ?auto_24248 ?auto_24261 ) ) ( not ( = ?auto_24249 ?auto_24252 ) ) ( not ( = ?auto_24249 ?auto_24261 ) ) ( not ( = ?auto_24250 ?auto_24252 ) ) ( not ( = ?auto_24250 ?auto_24261 ) ) ( not ( = ?auto_24252 ?auto_24266 ) ) ( not ( = ?auto_24252 ?auto_24278 ) ) ( not ( = ?auto_24252 ?auto_24262 ) ) ( not ( = ?auto_24252 ?auto_24284 ) ) ( not ( = ?auto_24252 ?auto_24268 ) ) ( not ( = ?auto_24252 ?auto_24276 ) ) ( not ( = ?auto_24252 ?auto_24272 ) ) ( not ( = ?auto_24252 ?auto_24283 ) ) ( not ( = ?auto_24252 ?auto_24281 ) ) ( not ( = ?auto_24252 ?auto_24265 ) ) ( not ( = ?auto_24252 ?auto_24277 ) ) ( not ( = ?auto_24252 ?auto_24263 ) ) ( not ( = ?auto_24261 ?auto_24266 ) ) ( not ( = ?auto_24261 ?auto_24278 ) ) ( not ( = ?auto_24261 ?auto_24262 ) ) ( not ( = ?auto_24261 ?auto_24284 ) ) ( not ( = ?auto_24261 ?auto_24268 ) ) ( not ( = ?auto_24261 ?auto_24276 ) ) ( not ( = ?auto_24261 ?auto_24272 ) ) ( not ( = ?auto_24261 ?auto_24283 ) ) ( not ( = ?auto_24261 ?auto_24281 ) ) ( not ( = ?auto_24261 ?auto_24265 ) ) ( not ( = ?auto_24261 ?auto_24277 ) ) ( not ( = ?auto_24261 ?auto_24263 ) ) ( not ( = ?auto_24239 ?auto_24253 ) ) ( not ( = ?auto_24239 ?auto_24258 ) ) ( not ( = ?auto_24240 ?auto_24253 ) ) ( not ( = ?auto_24240 ?auto_24258 ) ) ( not ( = ?auto_24241 ?auto_24253 ) ) ( not ( = ?auto_24241 ?auto_24258 ) ) ( not ( = ?auto_24242 ?auto_24253 ) ) ( not ( = ?auto_24242 ?auto_24258 ) ) ( not ( = ?auto_24243 ?auto_24253 ) ) ( not ( = ?auto_24243 ?auto_24258 ) ) ( not ( = ?auto_24244 ?auto_24253 ) ) ( not ( = ?auto_24244 ?auto_24258 ) ) ( not ( = ?auto_24245 ?auto_24253 ) ) ( not ( = ?auto_24245 ?auto_24258 ) ) ( not ( = ?auto_24246 ?auto_24253 ) ) ( not ( = ?auto_24246 ?auto_24258 ) ) ( not ( = ?auto_24247 ?auto_24253 ) ) ( not ( = ?auto_24247 ?auto_24258 ) ) ( not ( = ?auto_24248 ?auto_24253 ) ) ( not ( = ?auto_24248 ?auto_24258 ) ) ( not ( = ?auto_24249 ?auto_24253 ) ) ( not ( = ?auto_24249 ?auto_24258 ) ) ( not ( = ?auto_24250 ?auto_24253 ) ) ( not ( = ?auto_24250 ?auto_24258 ) ) ( not ( = ?auto_24251 ?auto_24253 ) ) ( not ( = ?auto_24251 ?auto_24258 ) ) ( not ( = ?auto_24253 ?auto_24261 ) ) ( not ( = ?auto_24253 ?auto_24266 ) ) ( not ( = ?auto_24253 ?auto_24278 ) ) ( not ( = ?auto_24253 ?auto_24262 ) ) ( not ( = ?auto_24253 ?auto_24284 ) ) ( not ( = ?auto_24253 ?auto_24268 ) ) ( not ( = ?auto_24253 ?auto_24276 ) ) ( not ( = ?auto_24253 ?auto_24272 ) ) ( not ( = ?auto_24253 ?auto_24283 ) ) ( not ( = ?auto_24253 ?auto_24281 ) ) ( not ( = ?auto_24253 ?auto_24265 ) ) ( not ( = ?auto_24253 ?auto_24277 ) ) ( not ( = ?auto_24253 ?auto_24263 ) ) ( not ( = ?auto_24258 ?auto_24261 ) ) ( not ( = ?auto_24258 ?auto_24266 ) ) ( not ( = ?auto_24258 ?auto_24278 ) ) ( not ( = ?auto_24258 ?auto_24262 ) ) ( not ( = ?auto_24258 ?auto_24284 ) ) ( not ( = ?auto_24258 ?auto_24268 ) ) ( not ( = ?auto_24258 ?auto_24276 ) ) ( not ( = ?auto_24258 ?auto_24272 ) ) ( not ( = ?auto_24258 ?auto_24283 ) ) ( not ( = ?auto_24258 ?auto_24281 ) ) ( not ( = ?auto_24258 ?auto_24265 ) ) ( not ( = ?auto_24258 ?auto_24277 ) ) ( not ( = ?auto_24258 ?auto_24263 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_24239 ?auto_24240 ?auto_24241 ?auto_24242 ?auto_24243 ?auto_24244 ?auto_24245 ?auto_24246 ?auto_24247 ?auto_24248 ?auto_24249 ?auto_24250 ?auto_24251 ?auto_24252 )
      ( MAKE-1CRATE ?auto_24252 ?auto_24253 )
      ( MAKE-14CRATE-VERIFY ?auto_24239 ?auto_24240 ?auto_24241 ?auto_24242 ?auto_24243 ?auto_24244 ?auto_24245 ?auto_24246 ?auto_24247 ?auto_24248 ?auto_24249 ?auto_24250 ?auto_24251 ?auto_24252 ?auto_24253 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_24311 - SURFACE
      ?auto_24312 - SURFACE
      ?auto_24313 - SURFACE
      ?auto_24314 - SURFACE
      ?auto_24315 - SURFACE
      ?auto_24316 - SURFACE
      ?auto_24317 - SURFACE
      ?auto_24318 - SURFACE
      ?auto_24319 - SURFACE
      ?auto_24320 - SURFACE
      ?auto_24321 - SURFACE
      ?auto_24322 - SURFACE
      ?auto_24323 - SURFACE
      ?auto_24324 - SURFACE
      ?auto_24325 - SURFACE
      ?auto_24326 - SURFACE
    )
    :vars
    (
      ?auto_24332 - HOIST
      ?auto_24330 - PLACE
      ?auto_24328 - PLACE
      ?auto_24331 - HOIST
      ?auto_24329 - SURFACE
      ?auto_24342 - PLACE
      ?auto_24341 - HOIST
      ?auto_24349 - SURFACE
      ?auto_24350 - SURFACE
      ?auto_24353 - PLACE
      ?auto_24344 - HOIST
      ?auto_24347 - SURFACE
      ?auto_24335 - SURFACE
      ?auto_24358 - PLACE
      ?auto_24337 - HOIST
      ?auto_24345 - SURFACE
      ?auto_24356 - SURFACE
      ?auto_24338 - PLACE
      ?auto_24354 - HOIST
      ?auto_24348 - SURFACE
      ?auto_24340 - SURFACE
      ?auto_24336 - SURFACE
      ?auto_24339 - PLACE
      ?auto_24352 - HOIST
      ?auto_24355 - SURFACE
      ?auto_24357 - SURFACE
      ?auto_24334 - SURFACE
      ?auto_24343 - SURFACE
      ?auto_24333 - PLACE
      ?auto_24346 - HOIST
      ?auto_24351 - SURFACE
      ?auto_24327 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24332 ?auto_24330 ) ( IS-CRATE ?auto_24326 ) ( not ( = ?auto_24328 ?auto_24330 ) ) ( HOIST-AT ?auto_24331 ?auto_24328 ) ( SURFACE-AT ?auto_24326 ?auto_24328 ) ( ON ?auto_24326 ?auto_24329 ) ( CLEAR ?auto_24326 ) ( not ( = ?auto_24325 ?auto_24326 ) ) ( not ( = ?auto_24325 ?auto_24329 ) ) ( not ( = ?auto_24326 ?auto_24329 ) ) ( not ( = ?auto_24332 ?auto_24331 ) ) ( IS-CRATE ?auto_24325 ) ( not ( = ?auto_24342 ?auto_24330 ) ) ( HOIST-AT ?auto_24341 ?auto_24342 ) ( SURFACE-AT ?auto_24325 ?auto_24342 ) ( ON ?auto_24325 ?auto_24349 ) ( CLEAR ?auto_24325 ) ( not ( = ?auto_24324 ?auto_24325 ) ) ( not ( = ?auto_24324 ?auto_24349 ) ) ( not ( = ?auto_24325 ?auto_24349 ) ) ( not ( = ?auto_24332 ?auto_24341 ) ) ( IS-CRATE ?auto_24324 ) ( SURFACE-AT ?auto_24324 ?auto_24342 ) ( ON ?auto_24324 ?auto_24350 ) ( CLEAR ?auto_24324 ) ( not ( = ?auto_24323 ?auto_24324 ) ) ( not ( = ?auto_24323 ?auto_24350 ) ) ( not ( = ?auto_24324 ?auto_24350 ) ) ( IS-CRATE ?auto_24323 ) ( not ( = ?auto_24353 ?auto_24330 ) ) ( HOIST-AT ?auto_24344 ?auto_24353 ) ( AVAILABLE ?auto_24344 ) ( SURFACE-AT ?auto_24323 ?auto_24353 ) ( ON ?auto_24323 ?auto_24347 ) ( CLEAR ?auto_24323 ) ( not ( = ?auto_24322 ?auto_24323 ) ) ( not ( = ?auto_24322 ?auto_24347 ) ) ( not ( = ?auto_24323 ?auto_24347 ) ) ( not ( = ?auto_24332 ?auto_24344 ) ) ( IS-CRATE ?auto_24322 ) ( SURFACE-AT ?auto_24322 ?auto_24328 ) ( ON ?auto_24322 ?auto_24335 ) ( CLEAR ?auto_24322 ) ( not ( = ?auto_24321 ?auto_24322 ) ) ( not ( = ?auto_24321 ?auto_24335 ) ) ( not ( = ?auto_24322 ?auto_24335 ) ) ( IS-CRATE ?auto_24321 ) ( not ( = ?auto_24358 ?auto_24330 ) ) ( HOIST-AT ?auto_24337 ?auto_24358 ) ( AVAILABLE ?auto_24337 ) ( SURFACE-AT ?auto_24321 ?auto_24358 ) ( ON ?auto_24321 ?auto_24345 ) ( CLEAR ?auto_24321 ) ( not ( = ?auto_24320 ?auto_24321 ) ) ( not ( = ?auto_24320 ?auto_24345 ) ) ( not ( = ?auto_24321 ?auto_24345 ) ) ( not ( = ?auto_24332 ?auto_24337 ) ) ( IS-CRATE ?auto_24320 ) ( SURFACE-AT ?auto_24320 ?auto_24342 ) ( ON ?auto_24320 ?auto_24356 ) ( CLEAR ?auto_24320 ) ( not ( = ?auto_24319 ?auto_24320 ) ) ( not ( = ?auto_24319 ?auto_24356 ) ) ( not ( = ?auto_24320 ?auto_24356 ) ) ( IS-CRATE ?auto_24319 ) ( not ( = ?auto_24338 ?auto_24330 ) ) ( HOIST-AT ?auto_24354 ?auto_24338 ) ( SURFACE-AT ?auto_24319 ?auto_24338 ) ( ON ?auto_24319 ?auto_24348 ) ( CLEAR ?auto_24319 ) ( not ( = ?auto_24318 ?auto_24319 ) ) ( not ( = ?auto_24318 ?auto_24348 ) ) ( not ( = ?auto_24319 ?auto_24348 ) ) ( not ( = ?auto_24332 ?auto_24354 ) ) ( IS-CRATE ?auto_24318 ) ( SURFACE-AT ?auto_24318 ?auto_24328 ) ( ON ?auto_24318 ?auto_24340 ) ( CLEAR ?auto_24318 ) ( not ( = ?auto_24317 ?auto_24318 ) ) ( not ( = ?auto_24317 ?auto_24340 ) ) ( not ( = ?auto_24318 ?auto_24340 ) ) ( IS-CRATE ?auto_24317 ) ( AVAILABLE ?auto_24354 ) ( SURFACE-AT ?auto_24317 ?auto_24338 ) ( ON ?auto_24317 ?auto_24336 ) ( CLEAR ?auto_24317 ) ( not ( = ?auto_24316 ?auto_24317 ) ) ( not ( = ?auto_24316 ?auto_24336 ) ) ( not ( = ?auto_24317 ?auto_24336 ) ) ( IS-CRATE ?auto_24316 ) ( not ( = ?auto_24339 ?auto_24330 ) ) ( HOIST-AT ?auto_24352 ?auto_24339 ) ( SURFACE-AT ?auto_24316 ?auto_24339 ) ( ON ?auto_24316 ?auto_24355 ) ( CLEAR ?auto_24316 ) ( not ( = ?auto_24315 ?auto_24316 ) ) ( not ( = ?auto_24315 ?auto_24355 ) ) ( not ( = ?auto_24316 ?auto_24355 ) ) ( not ( = ?auto_24332 ?auto_24352 ) ) ( IS-CRATE ?auto_24315 ) ( AVAILABLE ?auto_24341 ) ( SURFACE-AT ?auto_24315 ?auto_24342 ) ( ON ?auto_24315 ?auto_24357 ) ( CLEAR ?auto_24315 ) ( not ( = ?auto_24314 ?auto_24315 ) ) ( not ( = ?auto_24314 ?auto_24357 ) ) ( not ( = ?auto_24315 ?auto_24357 ) ) ( IS-CRATE ?auto_24314 ) ( AVAILABLE ?auto_24352 ) ( SURFACE-AT ?auto_24314 ?auto_24339 ) ( ON ?auto_24314 ?auto_24334 ) ( CLEAR ?auto_24314 ) ( not ( = ?auto_24313 ?auto_24314 ) ) ( not ( = ?auto_24313 ?auto_24334 ) ) ( not ( = ?auto_24314 ?auto_24334 ) ) ( IS-CRATE ?auto_24313 ) ( AVAILABLE ?auto_24331 ) ( SURFACE-AT ?auto_24313 ?auto_24328 ) ( ON ?auto_24313 ?auto_24343 ) ( CLEAR ?auto_24313 ) ( not ( = ?auto_24312 ?auto_24313 ) ) ( not ( = ?auto_24312 ?auto_24343 ) ) ( not ( = ?auto_24313 ?auto_24343 ) ) ( SURFACE-AT ?auto_24311 ?auto_24330 ) ( CLEAR ?auto_24311 ) ( IS-CRATE ?auto_24312 ) ( AVAILABLE ?auto_24332 ) ( not ( = ?auto_24333 ?auto_24330 ) ) ( HOIST-AT ?auto_24346 ?auto_24333 ) ( AVAILABLE ?auto_24346 ) ( SURFACE-AT ?auto_24312 ?auto_24333 ) ( ON ?auto_24312 ?auto_24351 ) ( CLEAR ?auto_24312 ) ( TRUCK-AT ?auto_24327 ?auto_24330 ) ( not ( = ?auto_24311 ?auto_24312 ) ) ( not ( = ?auto_24311 ?auto_24351 ) ) ( not ( = ?auto_24312 ?auto_24351 ) ) ( not ( = ?auto_24332 ?auto_24346 ) ) ( not ( = ?auto_24311 ?auto_24313 ) ) ( not ( = ?auto_24311 ?auto_24343 ) ) ( not ( = ?auto_24313 ?auto_24351 ) ) ( not ( = ?auto_24328 ?auto_24333 ) ) ( not ( = ?auto_24331 ?auto_24346 ) ) ( not ( = ?auto_24343 ?auto_24351 ) ) ( not ( = ?auto_24311 ?auto_24314 ) ) ( not ( = ?auto_24311 ?auto_24334 ) ) ( not ( = ?auto_24312 ?auto_24314 ) ) ( not ( = ?auto_24312 ?auto_24334 ) ) ( not ( = ?auto_24314 ?auto_24343 ) ) ( not ( = ?auto_24314 ?auto_24351 ) ) ( not ( = ?auto_24339 ?auto_24328 ) ) ( not ( = ?auto_24339 ?auto_24333 ) ) ( not ( = ?auto_24352 ?auto_24331 ) ) ( not ( = ?auto_24352 ?auto_24346 ) ) ( not ( = ?auto_24334 ?auto_24343 ) ) ( not ( = ?auto_24334 ?auto_24351 ) ) ( not ( = ?auto_24311 ?auto_24315 ) ) ( not ( = ?auto_24311 ?auto_24357 ) ) ( not ( = ?auto_24312 ?auto_24315 ) ) ( not ( = ?auto_24312 ?auto_24357 ) ) ( not ( = ?auto_24313 ?auto_24315 ) ) ( not ( = ?auto_24313 ?auto_24357 ) ) ( not ( = ?auto_24315 ?auto_24334 ) ) ( not ( = ?auto_24315 ?auto_24343 ) ) ( not ( = ?auto_24315 ?auto_24351 ) ) ( not ( = ?auto_24342 ?auto_24339 ) ) ( not ( = ?auto_24342 ?auto_24328 ) ) ( not ( = ?auto_24342 ?auto_24333 ) ) ( not ( = ?auto_24341 ?auto_24352 ) ) ( not ( = ?auto_24341 ?auto_24331 ) ) ( not ( = ?auto_24341 ?auto_24346 ) ) ( not ( = ?auto_24357 ?auto_24334 ) ) ( not ( = ?auto_24357 ?auto_24343 ) ) ( not ( = ?auto_24357 ?auto_24351 ) ) ( not ( = ?auto_24311 ?auto_24316 ) ) ( not ( = ?auto_24311 ?auto_24355 ) ) ( not ( = ?auto_24312 ?auto_24316 ) ) ( not ( = ?auto_24312 ?auto_24355 ) ) ( not ( = ?auto_24313 ?auto_24316 ) ) ( not ( = ?auto_24313 ?auto_24355 ) ) ( not ( = ?auto_24314 ?auto_24316 ) ) ( not ( = ?auto_24314 ?auto_24355 ) ) ( not ( = ?auto_24316 ?auto_24357 ) ) ( not ( = ?auto_24316 ?auto_24334 ) ) ( not ( = ?auto_24316 ?auto_24343 ) ) ( not ( = ?auto_24316 ?auto_24351 ) ) ( not ( = ?auto_24355 ?auto_24357 ) ) ( not ( = ?auto_24355 ?auto_24334 ) ) ( not ( = ?auto_24355 ?auto_24343 ) ) ( not ( = ?auto_24355 ?auto_24351 ) ) ( not ( = ?auto_24311 ?auto_24317 ) ) ( not ( = ?auto_24311 ?auto_24336 ) ) ( not ( = ?auto_24312 ?auto_24317 ) ) ( not ( = ?auto_24312 ?auto_24336 ) ) ( not ( = ?auto_24313 ?auto_24317 ) ) ( not ( = ?auto_24313 ?auto_24336 ) ) ( not ( = ?auto_24314 ?auto_24317 ) ) ( not ( = ?auto_24314 ?auto_24336 ) ) ( not ( = ?auto_24315 ?auto_24317 ) ) ( not ( = ?auto_24315 ?auto_24336 ) ) ( not ( = ?auto_24317 ?auto_24355 ) ) ( not ( = ?auto_24317 ?auto_24357 ) ) ( not ( = ?auto_24317 ?auto_24334 ) ) ( not ( = ?auto_24317 ?auto_24343 ) ) ( not ( = ?auto_24317 ?auto_24351 ) ) ( not ( = ?auto_24338 ?auto_24339 ) ) ( not ( = ?auto_24338 ?auto_24342 ) ) ( not ( = ?auto_24338 ?auto_24328 ) ) ( not ( = ?auto_24338 ?auto_24333 ) ) ( not ( = ?auto_24354 ?auto_24352 ) ) ( not ( = ?auto_24354 ?auto_24341 ) ) ( not ( = ?auto_24354 ?auto_24331 ) ) ( not ( = ?auto_24354 ?auto_24346 ) ) ( not ( = ?auto_24336 ?auto_24355 ) ) ( not ( = ?auto_24336 ?auto_24357 ) ) ( not ( = ?auto_24336 ?auto_24334 ) ) ( not ( = ?auto_24336 ?auto_24343 ) ) ( not ( = ?auto_24336 ?auto_24351 ) ) ( not ( = ?auto_24311 ?auto_24318 ) ) ( not ( = ?auto_24311 ?auto_24340 ) ) ( not ( = ?auto_24312 ?auto_24318 ) ) ( not ( = ?auto_24312 ?auto_24340 ) ) ( not ( = ?auto_24313 ?auto_24318 ) ) ( not ( = ?auto_24313 ?auto_24340 ) ) ( not ( = ?auto_24314 ?auto_24318 ) ) ( not ( = ?auto_24314 ?auto_24340 ) ) ( not ( = ?auto_24315 ?auto_24318 ) ) ( not ( = ?auto_24315 ?auto_24340 ) ) ( not ( = ?auto_24316 ?auto_24318 ) ) ( not ( = ?auto_24316 ?auto_24340 ) ) ( not ( = ?auto_24318 ?auto_24336 ) ) ( not ( = ?auto_24318 ?auto_24355 ) ) ( not ( = ?auto_24318 ?auto_24357 ) ) ( not ( = ?auto_24318 ?auto_24334 ) ) ( not ( = ?auto_24318 ?auto_24343 ) ) ( not ( = ?auto_24318 ?auto_24351 ) ) ( not ( = ?auto_24340 ?auto_24336 ) ) ( not ( = ?auto_24340 ?auto_24355 ) ) ( not ( = ?auto_24340 ?auto_24357 ) ) ( not ( = ?auto_24340 ?auto_24334 ) ) ( not ( = ?auto_24340 ?auto_24343 ) ) ( not ( = ?auto_24340 ?auto_24351 ) ) ( not ( = ?auto_24311 ?auto_24319 ) ) ( not ( = ?auto_24311 ?auto_24348 ) ) ( not ( = ?auto_24312 ?auto_24319 ) ) ( not ( = ?auto_24312 ?auto_24348 ) ) ( not ( = ?auto_24313 ?auto_24319 ) ) ( not ( = ?auto_24313 ?auto_24348 ) ) ( not ( = ?auto_24314 ?auto_24319 ) ) ( not ( = ?auto_24314 ?auto_24348 ) ) ( not ( = ?auto_24315 ?auto_24319 ) ) ( not ( = ?auto_24315 ?auto_24348 ) ) ( not ( = ?auto_24316 ?auto_24319 ) ) ( not ( = ?auto_24316 ?auto_24348 ) ) ( not ( = ?auto_24317 ?auto_24319 ) ) ( not ( = ?auto_24317 ?auto_24348 ) ) ( not ( = ?auto_24319 ?auto_24340 ) ) ( not ( = ?auto_24319 ?auto_24336 ) ) ( not ( = ?auto_24319 ?auto_24355 ) ) ( not ( = ?auto_24319 ?auto_24357 ) ) ( not ( = ?auto_24319 ?auto_24334 ) ) ( not ( = ?auto_24319 ?auto_24343 ) ) ( not ( = ?auto_24319 ?auto_24351 ) ) ( not ( = ?auto_24348 ?auto_24340 ) ) ( not ( = ?auto_24348 ?auto_24336 ) ) ( not ( = ?auto_24348 ?auto_24355 ) ) ( not ( = ?auto_24348 ?auto_24357 ) ) ( not ( = ?auto_24348 ?auto_24334 ) ) ( not ( = ?auto_24348 ?auto_24343 ) ) ( not ( = ?auto_24348 ?auto_24351 ) ) ( not ( = ?auto_24311 ?auto_24320 ) ) ( not ( = ?auto_24311 ?auto_24356 ) ) ( not ( = ?auto_24312 ?auto_24320 ) ) ( not ( = ?auto_24312 ?auto_24356 ) ) ( not ( = ?auto_24313 ?auto_24320 ) ) ( not ( = ?auto_24313 ?auto_24356 ) ) ( not ( = ?auto_24314 ?auto_24320 ) ) ( not ( = ?auto_24314 ?auto_24356 ) ) ( not ( = ?auto_24315 ?auto_24320 ) ) ( not ( = ?auto_24315 ?auto_24356 ) ) ( not ( = ?auto_24316 ?auto_24320 ) ) ( not ( = ?auto_24316 ?auto_24356 ) ) ( not ( = ?auto_24317 ?auto_24320 ) ) ( not ( = ?auto_24317 ?auto_24356 ) ) ( not ( = ?auto_24318 ?auto_24320 ) ) ( not ( = ?auto_24318 ?auto_24356 ) ) ( not ( = ?auto_24320 ?auto_24348 ) ) ( not ( = ?auto_24320 ?auto_24340 ) ) ( not ( = ?auto_24320 ?auto_24336 ) ) ( not ( = ?auto_24320 ?auto_24355 ) ) ( not ( = ?auto_24320 ?auto_24357 ) ) ( not ( = ?auto_24320 ?auto_24334 ) ) ( not ( = ?auto_24320 ?auto_24343 ) ) ( not ( = ?auto_24320 ?auto_24351 ) ) ( not ( = ?auto_24356 ?auto_24348 ) ) ( not ( = ?auto_24356 ?auto_24340 ) ) ( not ( = ?auto_24356 ?auto_24336 ) ) ( not ( = ?auto_24356 ?auto_24355 ) ) ( not ( = ?auto_24356 ?auto_24357 ) ) ( not ( = ?auto_24356 ?auto_24334 ) ) ( not ( = ?auto_24356 ?auto_24343 ) ) ( not ( = ?auto_24356 ?auto_24351 ) ) ( not ( = ?auto_24311 ?auto_24321 ) ) ( not ( = ?auto_24311 ?auto_24345 ) ) ( not ( = ?auto_24312 ?auto_24321 ) ) ( not ( = ?auto_24312 ?auto_24345 ) ) ( not ( = ?auto_24313 ?auto_24321 ) ) ( not ( = ?auto_24313 ?auto_24345 ) ) ( not ( = ?auto_24314 ?auto_24321 ) ) ( not ( = ?auto_24314 ?auto_24345 ) ) ( not ( = ?auto_24315 ?auto_24321 ) ) ( not ( = ?auto_24315 ?auto_24345 ) ) ( not ( = ?auto_24316 ?auto_24321 ) ) ( not ( = ?auto_24316 ?auto_24345 ) ) ( not ( = ?auto_24317 ?auto_24321 ) ) ( not ( = ?auto_24317 ?auto_24345 ) ) ( not ( = ?auto_24318 ?auto_24321 ) ) ( not ( = ?auto_24318 ?auto_24345 ) ) ( not ( = ?auto_24319 ?auto_24321 ) ) ( not ( = ?auto_24319 ?auto_24345 ) ) ( not ( = ?auto_24321 ?auto_24356 ) ) ( not ( = ?auto_24321 ?auto_24348 ) ) ( not ( = ?auto_24321 ?auto_24340 ) ) ( not ( = ?auto_24321 ?auto_24336 ) ) ( not ( = ?auto_24321 ?auto_24355 ) ) ( not ( = ?auto_24321 ?auto_24357 ) ) ( not ( = ?auto_24321 ?auto_24334 ) ) ( not ( = ?auto_24321 ?auto_24343 ) ) ( not ( = ?auto_24321 ?auto_24351 ) ) ( not ( = ?auto_24358 ?auto_24342 ) ) ( not ( = ?auto_24358 ?auto_24338 ) ) ( not ( = ?auto_24358 ?auto_24328 ) ) ( not ( = ?auto_24358 ?auto_24339 ) ) ( not ( = ?auto_24358 ?auto_24333 ) ) ( not ( = ?auto_24337 ?auto_24341 ) ) ( not ( = ?auto_24337 ?auto_24354 ) ) ( not ( = ?auto_24337 ?auto_24331 ) ) ( not ( = ?auto_24337 ?auto_24352 ) ) ( not ( = ?auto_24337 ?auto_24346 ) ) ( not ( = ?auto_24345 ?auto_24356 ) ) ( not ( = ?auto_24345 ?auto_24348 ) ) ( not ( = ?auto_24345 ?auto_24340 ) ) ( not ( = ?auto_24345 ?auto_24336 ) ) ( not ( = ?auto_24345 ?auto_24355 ) ) ( not ( = ?auto_24345 ?auto_24357 ) ) ( not ( = ?auto_24345 ?auto_24334 ) ) ( not ( = ?auto_24345 ?auto_24343 ) ) ( not ( = ?auto_24345 ?auto_24351 ) ) ( not ( = ?auto_24311 ?auto_24322 ) ) ( not ( = ?auto_24311 ?auto_24335 ) ) ( not ( = ?auto_24312 ?auto_24322 ) ) ( not ( = ?auto_24312 ?auto_24335 ) ) ( not ( = ?auto_24313 ?auto_24322 ) ) ( not ( = ?auto_24313 ?auto_24335 ) ) ( not ( = ?auto_24314 ?auto_24322 ) ) ( not ( = ?auto_24314 ?auto_24335 ) ) ( not ( = ?auto_24315 ?auto_24322 ) ) ( not ( = ?auto_24315 ?auto_24335 ) ) ( not ( = ?auto_24316 ?auto_24322 ) ) ( not ( = ?auto_24316 ?auto_24335 ) ) ( not ( = ?auto_24317 ?auto_24322 ) ) ( not ( = ?auto_24317 ?auto_24335 ) ) ( not ( = ?auto_24318 ?auto_24322 ) ) ( not ( = ?auto_24318 ?auto_24335 ) ) ( not ( = ?auto_24319 ?auto_24322 ) ) ( not ( = ?auto_24319 ?auto_24335 ) ) ( not ( = ?auto_24320 ?auto_24322 ) ) ( not ( = ?auto_24320 ?auto_24335 ) ) ( not ( = ?auto_24322 ?auto_24345 ) ) ( not ( = ?auto_24322 ?auto_24356 ) ) ( not ( = ?auto_24322 ?auto_24348 ) ) ( not ( = ?auto_24322 ?auto_24340 ) ) ( not ( = ?auto_24322 ?auto_24336 ) ) ( not ( = ?auto_24322 ?auto_24355 ) ) ( not ( = ?auto_24322 ?auto_24357 ) ) ( not ( = ?auto_24322 ?auto_24334 ) ) ( not ( = ?auto_24322 ?auto_24343 ) ) ( not ( = ?auto_24322 ?auto_24351 ) ) ( not ( = ?auto_24335 ?auto_24345 ) ) ( not ( = ?auto_24335 ?auto_24356 ) ) ( not ( = ?auto_24335 ?auto_24348 ) ) ( not ( = ?auto_24335 ?auto_24340 ) ) ( not ( = ?auto_24335 ?auto_24336 ) ) ( not ( = ?auto_24335 ?auto_24355 ) ) ( not ( = ?auto_24335 ?auto_24357 ) ) ( not ( = ?auto_24335 ?auto_24334 ) ) ( not ( = ?auto_24335 ?auto_24343 ) ) ( not ( = ?auto_24335 ?auto_24351 ) ) ( not ( = ?auto_24311 ?auto_24323 ) ) ( not ( = ?auto_24311 ?auto_24347 ) ) ( not ( = ?auto_24312 ?auto_24323 ) ) ( not ( = ?auto_24312 ?auto_24347 ) ) ( not ( = ?auto_24313 ?auto_24323 ) ) ( not ( = ?auto_24313 ?auto_24347 ) ) ( not ( = ?auto_24314 ?auto_24323 ) ) ( not ( = ?auto_24314 ?auto_24347 ) ) ( not ( = ?auto_24315 ?auto_24323 ) ) ( not ( = ?auto_24315 ?auto_24347 ) ) ( not ( = ?auto_24316 ?auto_24323 ) ) ( not ( = ?auto_24316 ?auto_24347 ) ) ( not ( = ?auto_24317 ?auto_24323 ) ) ( not ( = ?auto_24317 ?auto_24347 ) ) ( not ( = ?auto_24318 ?auto_24323 ) ) ( not ( = ?auto_24318 ?auto_24347 ) ) ( not ( = ?auto_24319 ?auto_24323 ) ) ( not ( = ?auto_24319 ?auto_24347 ) ) ( not ( = ?auto_24320 ?auto_24323 ) ) ( not ( = ?auto_24320 ?auto_24347 ) ) ( not ( = ?auto_24321 ?auto_24323 ) ) ( not ( = ?auto_24321 ?auto_24347 ) ) ( not ( = ?auto_24323 ?auto_24335 ) ) ( not ( = ?auto_24323 ?auto_24345 ) ) ( not ( = ?auto_24323 ?auto_24356 ) ) ( not ( = ?auto_24323 ?auto_24348 ) ) ( not ( = ?auto_24323 ?auto_24340 ) ) ( not ( = ?auto_24323 ?auto_24336 ) ) ( not ( = ?auto_24323 ?auto_24355 ) ) ( not ( = ?auto_24323 ?auto_24357 ) ) ( not ( = ?auto_24323 ?auto_24334 ) ) ( not ( = ?auto_24323 ?auto_24343 ) ) ( not ( = ?auto_24323 ?auto_24351 ) ) ( not ( = ?auto_24353 ?auto_24328 ) ) ( not ( = ?auto_24353 ?auto_24358 ) ) ( not ( = ?auto_24353 ?auto_24342 ) ) ( not ( = ?auto_24353 ?auto_24338 ) ) ( not ( = ?auto_24353 ?auto_24339 ) ) ( not ( = ?auto_24353 ?auto_24333 ) ) ( not ( = ?auto_24344 ?auto_24331 ) ) ( not ( = ?auto_24344 ?auto_24337 ) ) ( not ( = ?auto_24344 ?auto_24341 ) ) ( not ( = ?auto_24344 ?auto_24354 ) ) ( not ( = ?auto_24344 ?auto_24352 ) ) ( not ( = ?auto_24344 ?auto_24346 ) ) ( not ( = ?auto_24347 ?auto_24335 ) ) ( not ( = ?auto_24347 ?auto_24345 ) ) ( not ( = ?auto_24347 ?auto_24356 ) ) ( not ( = ?auto_24347 ?auto_24348 ) ) ( not ( = ?auto_24347 ?auto_24340 ) ) ( not ( = ?auto_24347 ?auto_24336 ) ) ( not ( = ?auto_24347 ?auto_24355 ) ) ( not ( = ?auto_24347 ?auto_24357 ) ) ( not ( = ?auto_24347 ?auto_24334 ) ) ( not ( = ?auto_24347 ?auto_24343 ) ) ( not ( = ?auto_24347 ?auto_24351 ) ) ( not ( = ?auto_24311 ?auto_24324 ) ) ( not ( = ?auto_24311 ?auto_24350 ) ) ( not ( = ?auto_24312 ?auto_24324 ) ) ( not ( = ?auto_24312 ?auto_24350 ) ) ( not ( = ?auto_24313 ?auto_24324 ) ) ( not ( = ?auto_24313 ?auto_24350 ) ) ( not ( = ?auto_24314 ?auto_24324 ) ) ( not ( = ?auto_24314 ?auto_24350 ) ) ( not ( = ?auto_24315 ?auto_24324 ) ) ( not ( = ?auto_24315 ?auto_24350 ) ) ( not ( = ?auto_24316 ?auto_24324 ) ) ( not ( = ?auto_24316 ?auto_24350 ) ) ( not ( = ?auto_24317 ?auto_24324 ) ) ( not ( = ?auto_24317 ?auto_24350 ) ) ( not ( = ?auto_24318 ?auto_24324 ) ) ( not ( = ?auto_24318 ?auto_24350 ) ) ( not ( = ?auto_24319 ?auto_24324 ) ) ( not ( = ?auto_24319 ?auto_24350 ) ) ( not ( = ?auto_24320 ?auto_24324 ) ) ( not ( = ?auto_24320 ?auto_24350 ) ) ( not ( = ?auto_24321 ?auto_24324 ) ) ( not ( = ?auto_24321 ?auto_24350 ) ) ( not ( = ?auto_24322 ?auto_24324 ) ) ( not ( = ?auto_24322 ?auto_24350 ) ) ( not ( = ?auto_24324 ?auto_24347 ) ) ( not ( = ?auto_24324 ?auto_24335 ) ) ( not ( = ?auto_24324 ?auto_24345 ) ) ( not ( = ?auto_24324 ?auto_24356 ) ) ( not ( = ?auto_24324 ?auto_24348 ) ) ( not ( = ?auto_24324 ?auto_24340 ) ) ( not ( = ?auto_24324 ?auto_24336 ) ) ( not ( = ?auto_24324 ?auto_24355 ) ) ( not ( = ?auto_24324 ?auto_24357 ) ) ( not ( = ?auto_24324 ?auto_24334 ) ) ( not ( = ?auto_24324 ?auto_24343 ) ) ( not ( = ?auto_24324 ?auto_24351 ) ) ( not ( = ?auto_24350 ?auto_24347 ) ) ( not ( = ?auto_24350 ?auto_24335 ) ) ( not ( = ?auto_24350 ?auto_24345 ) ) ( not ( = ?auto_24350 ?auto_24356 ) ) ( not ( = ?auto_24350 ?auto_24348 ) ) ( not ( = ?auto_24350 ?auto_24340 ) ) ( not ( = ?auto_24350 ?auto_24336 ) ) ( not ( = ?auto_24350 ?auto_24355 ) ) ( not ( = ?auto_24350 ?auto_24357 ) ) ( not ( = ?auto_24350 ?auto_24334 ) ) ( not ( = ?auto_24350 ?auto_24343 ) ) ( not ( = ?auto_24350 ?auto_24351 ) ) ( not ( = ?auto_24311 ?auto_24325 ) ) ( not ( = ?auto_24311 ?auto_24349 ) ) ( not ( = ?auto_24312 ?auto_24325 ) ) ( not ( = ?auto_24312 ?auto_24349 ) ) ( not ( = ?auto_24313 ?auto_24325 ) ) ( not ( = ?auto_24313 ?auto_24349 ) ) ( not ( = ?auto_24314 ?auto_24325 ) ) ( not ( = ?auto_24314 ?auto_24349 ) ) ( not ( = ?auto_24315 ?auto_24325 ) ) ( not ( = ?auto_24315 ?auto_24349 ) ) ( not ( = ?auto_24316 ?auto_24325 ) ) ( not ( = ?auto_24316 ?auto_24349 ) ) ( not ( = ?auto_24317 ?auto_24325 ) ) ( not ( = ?auto_24317 ?auto_24349 ) ) ( not ( = ?auto_24318 ?auto_24325 ) ) ( not ( = ?auto_24318 ?auto_24349 ) ) ( not ( = ?auto_24319 ?auto_24325 ) ) ( not ( = ?auto_24319 ?auto_24349 ) ) ( not ( = ?auto_24320 ?auto_24325 ) ) ( not ( = ?auto_24320 ?auto_24349 ) ) ( not ( = ?auto_24321 ?auto_24325 ) ) ( not ( = ?auto_24321 ?auto_24349 ) ) ( not ( = ?auto_24322 ?auto_24325 ) ) ( not ( = ?auto_24322 ?auto_24349 ) ) ( not ( = ?auto_24323 ?auto_24325 ) ) ( not ( = ?auto_24323 ?auto_24349 ) ) ( not ( = ?auto_24325 ?auto_24350 ) ) ( not ( = ?auto_24325 ?auto_24347 ) ) ( not ( = ?auto_24325 ?auto_24335 ) ) ( not ( = ?auto_24325 ?auto_24345 ) ) ( not ( = ?auto_24325 ?auto_24356 ) ) ( not ( = ?auto_24325 ?auto_24348 ) ) ( not ( = ?auto_24325 ?auto_24340 ) ) ( not ( = ?auto_24325 ?auto_24336 ) ) ( not ( = ?auto_24325 ?auto_24355 ) ) ( not ( = ?auto_24325 ?auto_24357 ) ) ( not ( = ?auto_24325 ?auto_24334 ) ) ( not ( = ?auto_24325 ?auto_24343 ) ) ( not ( = ?auto_24325 ?auto_24351 ) ) ( not ( = ?auto_24349 ?auto_24350 ) ) ( not ( = ?auto_24349 ?auto_24347 ) ) ( not ( = ?auto_24349 ?auto_24335 ) ) ( not ( = ?auto_24349 ?auto_24345 ) ) ( not ( = ?auto_24349 ?auto_24356 ) ) ( not ( = ?auto_24349 ?auto_24348 ) ) ( not ( = ?auto_24349 ?auto_24340 ) ) ( not ( = ?auto_24349 ?auto_24336 ) ) ( not ( = ?auto_24349 ?auto_24355 ) ) ( not ( = ?auto_24349 ?auto_24357 ) ) ( not ( = ?auto_24349 ?auto_24334 ) ) ( not ( = ?auto_24349 ?auto_24343 ) ) ( not ( = ?auto_24349 ?auto_24351 ) ) ( not ( = ?auto_24311 ?auto_24326 ) ) ( not ( = ?auto_24311 ?auto_24329 ) ) ( not ( = ?auto_24312 ?auto_24326 ) ) ( not ( = ?auto_24312 ?auto_24329 ) ) ( not ( = ?auto_24313 ?auto_24326 ) ) ( not ( = ?auto_24313 ?auto_24329 ) ) ( not ( = ?auto_24314 ?auto_24326 ) ) ( not ( = ?auto_24314 ?auto_24329 ) ) ( not ( = ?auto_24315 ?auto_24326 ) ) ( not ( = ?auto_24315 ?auto_24329 ) ) ( not ( = ?auto_24316 ?auto_24326 ) ) ( not ( = ?auto_24316 ?auto_24329 ) ) ( not ( = ?auto_24317 ?auto_24326 ) ) ( not ( = ?auto_24317 ?auto_24329 ) ) ( not ( = ?auto_24318 ?auto_24326 ) ) ( not ( = ?auto_24318 ?auto_24329 ) ) ( not ( = ?auto_24319 ?auto_24326 ) ) ( not ( = ?auto_24319 ?auto_24329 ) ) ( not ( = ?auto_24320 ?auto_24326 ) ) ( not ( = ?auto_24320 ?auto_24329 ) ) ( not ( = ?auto_24321 ?auto_24326 ) ) ( not ( = ?auto_24321 ?auto_24329 ) ) ( not ( = ?auto_24322 ?auto_24326 ) ) ( not ( = ?auto_24322 ?auto_24329 ) ) ( not ( = ?auto_24323 ?auto_24326 ) ) ( not ( = ?auto_24323 ?auto_24329 ) ) ( not ( = ?auto_24324 ?auto_24326 ) ) ( not ( = ?auto_24324 ?auto_24329 ) ) ( not ( = ?auto_24326 ?auto_24349 ) ) ( not ( = ?auto_24326 ?auto_24350 ) ) ( not ( = ?auto_24326 ?auto_24347 ) ) ( not ( = ?auto_24326 ?auto_24335 ) ) ( not ( = ?auto_24326 ?auto_24345 ) ) ( not ( = ?auto_24326 ?auto_24356 ) ) ( not ( = ?auto_24326 ?auto_24348 ) ) ( not ( = ?auto_24326 ?auto_24340 ) ) ( not ( = ?auto_24326 ?auto_24336 ) ) ( not ( = ?auto_24326 ?auto_24355 ) ) ( not ( = ?auto_24326 ?auto_24357 ) ) ( not ( = ?auto_24326 ?auto_24334 ) ) ( not ( = ?auto_24326 ?auto_24343 ) ) ( not ( = ?auto_24326 ?auto_24351 ) ) ( not ( = ?auto_24329 ?auto_24349 ) ) ( not ( = ?auto_24329 ?auto_24350 ) ) ( not ( = ?auto_24329 ?auto_24347 ) ) ( not ( = ?auto_24329 ?auto_24335 ) ) ( not ( = ?auto_24329 ?auto_24345 ) ) ( not ( = ?auto_24329 ?auto_24356 ) ) ( not ( = ?auto_24329 ?auto_24348 ) ) ( not ( = ?auto_24329 ?auto_24340 ) ) ( not ( = ?auto_24329 ?auto_24336 ) ) ( not ( = ?auto_24329 ?auto_24355 ) ) ( not ( = ?auto_24329 ?auto_24357 ) ) ( not ( = ?auto_24329 ?auto_24334 ) ) ( not ( = ?auto_24329 ?auto_24343 ) ) ( not ( = ?auto_24329 ?auto_24351 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_24311 ?auto_24312 ?auto_24313 ?auto_24314 ?auto_24315 ?auto_24316 ?auto_24317 ?auto_24318 ?auto_24319 ?auto_24320 ?auto_24321 ?auto_24322 ?auto_24323 ?auto_24324 ?auto_24325 )
      ( MAKE-1CRATE ?auto_24325 ?auto_24326 )
      ( MAKE-15CRATE-VERIFY ?auto_24311 ?auto_24312 ?auto_24313 ?auto_24314 ?auto_24315 ?auto_24316 ?auto_24317 ?auto_24318 ?auto_24319 ?auto_24320 ?auto_24321 ?auto_24322 ?auto_24323 ?auto_24324 ?auto_24325 ?auto_24326 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_24386 - SURFACE
      ?auto_24387 - SURFACE
      ?auto_24388 - SURFACE
      ?auto_24389 - SURFACE
      ?auto_24390 - SURFACE
      ?auto_24391 - SURFACE
      ?auto_24392 - SURFACE
      ?auto_24393 - SURFACE
      ?auto_24394 - SURFACE
      ?auto_24395 - SURFACE
      ?auto_24396 - SURFACE
      ?auto_24397 - SURFACE
      ?auto_24398 - SURFACE
      ?auto_24399 - SURFACE
      ?auto_24400 - SURFACE
      ?auto_24402 - SURFACE
      ?auto_24401 - SURFACE
    )
    :vars
    (
      ?auto_24406 - HOIST
      ?auto_24407 - PLACE
      ?auto_24404 - PLACE
      ?auto_24403 - HOIST
      ?auto_24405 - SURFACE
      ?auto_24431 - SURFACE
      ?auto_24413 - PLACE
      ?auto_24420 - HOIST
      ?auto_24418 - SURFACE
      ?auto_24424 - SURFACE
      ?auto_24422 - PLACE
      ?auto_24417 - HOIST
      ?auto_24425 - SURFACE
      ?auto_24409 - SURFACE
      ?auto_24426 - PLACE
      ?auto_24427 - HOIST
      ?auto_24423 - SURFACE
      ?auto_24410 - SURFACE
      ?auto_24433 - PLACE
      ?auto_24430 - HOIST
      ?auto_24421 - SURFACE
      ?auto_24414 - SURFACE
      ?auto_24432 - SURFACE
      ?auto_24415 - PLACE
      ?auto_24434 - HOIST
      ?auto_24428 - SURFACE
      ?auto_24411 - SURFACE
      ?auto_24419 - SURFACE
      ?auto_24435 - SURFACE
      ?auto_24429 - PLACE
      ?auto_24416 - HOIST
      ?auto_24412 - SURFACE
      ?auto_24408 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24406 ?auto_24407 ) ( IS-CRATE ?auto_24401 ) ( not ( = ?auto_24404 ?auto_24407 ) ) ( HOIST-AT ?auto_24403 ?auto_24404 ) ( SURFACE-AT ?auto_24401 ?auto_24404 ) ( ON ?auto_24401 ?auto_24405 ) ( CLEAR ?auto_24401 ) ( not ( = ?auto_24402 ?auto_24401 ) ) ( not ( = ?auto_24402 ?auto_24405 ) ) ( not ( = ?auto_24401 ?auto_24405 ) ) ( not ( = ?auto_24406 ?auto_24403 ) ) ( IS-CRATE ?auto_24402 ) ( SURFACE-AT ?auto_24402 ?auto_24404 ) ( ON ?auto_24402 ?auto_24431 ) ( CLEAR ?auto_24402 ) ( not ( = ?auto_24400 ?auto_24402 ) ) ( not ( = ?auto_24400 ?auto_24431 ) ) ( not ( = ?auto_24402 ?auto_24431 ) ) ( IS-CRATE ?auto_24400 ) ( not ( = ?auto_24413 ?auto_24407 ) ) ( HOIST-AT ?auto_24420 ?auto_24413 ) ( SURFACE-AT ?auto_24400 ?auto_24413 ) ( ON ?auto_24400 ?auto_24418 ) ( CLEAR ?auto_24400 ) ( not ( = ?auto_24399 ?auto_24400 ) ) ( not ( = ?auto_24399 ?auto_24418 ) ) ( not ( = ?auto_24400 ?auto_24418 ) ) ( not ( = ?auto_24406 ?auto_24420 ) ) ( IS-CRATE ?auto_24399 ) ( SURFACE-AT ?auto_24399 ?auto_24413 ) ( ON ?auto_24399 ?auto_24424 ) ( CLEAR ?auto_24399 ) ( not ( = ?auto_24398 ?auto_24399 ) ) ( not ( = ?auto_24398 ?auto_24424 ) ) ( not ( = ?auto_24399 ?auto_24424 ) ) ( IS-CRATE ?auto_24398 ) ( not ( = ?auto_24422 ?auto_24407 ) ) ( HOIST-AT ?auto_24417 ?auto_24422 ) ( AVAILABLE ?auto_24417 ) ( SURFACE-AT ?auto_24398 ?auto_24422 ) ( ON ?auto_24398 ?auto_24425 ) ( CLEAR ?auto_24398 ) ( not ( = ?auto_24397 ?auto_24398 ) ) ( not ( = ?auto_24397 ?auto_24425 ) ) ( not ( = ?auto_24398 ?auto_24425 ) ) ( not ( = ?auto_24406 ?auto_24417 ) ) ( IS-CRATE ?auto_24397 ) ( SURFACE-AT ?auto_24397 ?auto_24404 ) ( ON ?auto_24397 ?auto_24409 ) ( CLEAR ?auto_24397 ) ( not ( = ?auto_24396 ?auto_24397 ) ) ( not ( = ?auto_24396 ?auto_24409 ) ) ( not ( = ?auto_24397 ?auto_24409 ) ) ( IS-CRATE ?auto_24396 ) ( not ( = ?auto_24426 ?auto_24407 ) ) ( HOIST-AT ?auto_24427 ?auto_24426 ) ( AVAILABLE ?auto_24427 ) ( SURFACE-AT ?auto_24396 ?auto_24426 ) ( ON ?auto_24396 ?auto_24423 ) ( CLEAR ?auto_24396 ) ( not ( = ?auto_24395 ?auto_24396 ) ) ( not ( = ?auto_24395 ?auto_24423 ) ) ( not ( = ?auto_24396 ?auto_24423 ) ) ( not ( = ?auto_24406 ?auto_24427 ) ) ( IS-CRATE ?auto_24395 ) ( SURFACE-AT ?auto_24395 ?auto_24413 ) ( ON ?auto_24395 ?auto_24410 ) ( CLEAR ?auto_24395 ) ( not ( = ?auto_24394 ?auto_24395 ) ) ( not ( = ?auto_24394 ?auto_24410 ) ) ( not ( = ?auto_24395 ?auto_24410 ) ) ( IS-CRATE ?auto_24394 ) ( not ( = ?auto_24433 ?auto_24407 ) ) ( HOIST-AT ?auto_24430 ?auto_24433 ) ( SURFACE-AT ?auto_24394 ?auto_24433 ) ( ON ?auto_24394 ?auto_24421 ) ( CLEAR ?auto_24394 ) ( not ( = ?auto_24393 ?auto_24394 ) ) ( not ( = ?auto_24393 ?auto_24421 ) ) ( not ( = ?auto_24394 ?auto_24421 ) ) ( not ( = ?auto_24406 ?auto_24430 ) ) ( IS-CRATE ?auto_24393 ) ( SURFACE-AT ?auto_24393 ?auto_24404 ) ( ON ?auto_24393 ?auto_24414 ) ( CLEAR ?auto_24393 ) ( not ( = ?auto_24392 ?auto_24393 ) ) ( not ( = ?auto_24392 ?auto_24414 ) ) ( not ( = ?auto_24393 ?auto_24414 ) ) ( IS-CRATE ?auto_24392 ) ( AVAILABLE ?auto_24430 ) ( SURFACE-AT ?auto_24392 ?auto_24433 ) ( ON ?auto_24392 ?auto_24432 ) ( CLEAR ?auto_24392 ) ( not ( = ?auto_24391 ?auto_24392 ) ) ( not ( = ?auto_24391 ?auto_24432 ) ) ( not ( = ?auto_24392 ?auto_24432 ) ) ( IS-CRATE ?auto_24391 ) ( not ( = ?auto_24415 ?auto_24407 ) ) ( HOIST-AT ?auto_24434 ?auto_24415 ) ( SURFACE-AT ?auto_24391 ?auto_24415 ) ( ON ?auto_24391 ?auto_24428 ) ( CLEAR ?auto_24391 ) ( not ( = ?auto_24390 ?auto_24391 ) ) ( not ( = ?auto_24390 ?auto_24428 ) ) ( not ( = ?auto_24391 ?auto_24428 ) ) ( not ( = ?auto_24406 ?auto_24434 ) ) ( IS-CRATE ?auto_24390 ) ( AVAILABLE ?auto_24420 ) ( SURFACE-AT ?auto_24390 ?auto_24413 ) ( ON ?auto_24390 ?auto_24411 ) ( CLEAR ?auto_24390 ) ( not ( = ?auto_24389 ?auto_24390 ) ) ( not ( = ?auto_24389 ?auto_24411 ) ) ( not ( = ?auto_24390 ?auto_24411 ) ) ( IS-CRATE ?auto_24389 ) ( AVAILABLE ?auto_24434 ) ( SURFACE-AT ?auto_24389 ?auto_24415 ) ( ON ?auto_24389 ?auto_24419 ) ( CLEAR ?auto_24389 ) ( not ( = ?auto_24388 ?auto_24389 ) ) ( not ( = ?auto_24388 ?auto_24419 ) ) ( not ( = ?auto_24389 ?auto_24419 ) ) ( IS-CRATE ?auto_24388 ) ( AVAILABLE ?auto_24403 ) ( SURFACE-AT ?auto_24388 ?auto_24404 ) ( ON ?auto_24388 ?auto_24435 ) ( CLEAR ?auto_24388 ) ( not ( = ?auto_24387 ?auto_24388 ) ) ( not ( = ?auto_24387 ?auto_24435 ) ) ( not ( = ?auto_24388 ?auto_24435 ) ) ( SURFACE-AT ?auto_24386 ?auto_24407 ) ( CLEAR ?auto_24386 ) ( IS-CRATE ?auto_24387 ) ( AVAILABLE ?auto_24406 ) ( not ( = ?auto_24429 ?auto_24407 ) ) ( HOIST-AT ?auto_24416 ?auto_24429 ) ( AVAILABLE ?auto_24416 ) ( SURFACE-AT ?auto_24387 ?auto_24429 ) ( ON ?auto_24387 ?auto_24412 ) ( CLEAR ?auto_24387 ) ( TRUCK-AT ?auto_24408 ?auto_24407 ) ( not ( = ?auto_24386 ?auto_24387 ) ) ( not ( = ?auto_24386 ?auto_24412 ) ) ( not ( = ?auto_24387 ?auto_24412 ) ) ( not ( = ?auto_24406 ?auto_24416 ) ) ( not ( = ?auto_24386 ?auto_24388 ) ) ( not ( = ?auto_24386 ?auto_24435 ) ) ( not ( = ?auto_24388 ?auto_24412 ) ) ( not ( = ?auto_24404 ?auto_24429 ) ) ( not ( = ?auto_24403 ?auto_24416 ) ) ( not ( = ?auto_24435 ?auto_24412 ) ) ( not ( = ?auto_24386 ?auto_24389 ) ) ( not ( = ?auto_24386 ?auto_24419 ) ) ( not ( = ?auto_24387 ?auto_24389 ) ) ( not ( = ?auto_24387 ?auto_24419 ) ) ( not ( = ?auto_24389 ?auto_24435 ) ) ( not ( = ?auto_24389 ?auto_24412 ) ) ( not ( = ?auto_24415 ?auto_24404 ) ) ( not ( = ?auto_24415 ?auto_24429 ) ) ( not ( = ?auto_24434 ?auto_24403 ) ) ( not ( = ?auto_24434 ?auto_24416 ) ) ( not ( = ?auto_24419 ?auto_24435 ) ) ( not ( = ?auto_24419 ?auto_24412 ) ) ( not ( = ?auto_24386 ?auto_24390 ) ) ( not ( = ?auto_24386 ?auto_24411 ) ) ( not ( = ?auto_24387 ?auto_24390 ) ) ( not ( = ?auto_24387 ?auto_24411 ) ) ( not ( = ?auto_24388 ?auto_24390 ) ) ( not ( = ?auto_24388 ?auto_24411 ) ) ( not ( = ?auto_24390 ?auto_24419 ) ) ( not ( = ?auto_24390 ?auto_24435 ) ) ( not ( = ?auto_24390 ?auto_24412 ) ) ( not ( = ?auto_24413 ?auto_24415 ) ) ( not ( = ?auto_24413 ?auto_24404 ) ) ( not ( = ?auto_24413 ?auto_24429 ) ) ( not ( = ?auto_24420 ?auto_24434 ) ) ( not ( = ?auto_24420 ?auto_24403 ) ) ( not ( = ?auto_24420 ?auto_24416 ) ) ( not ( = ?auto_24411 ?auto_24419 ) ) ( not ( = ?auto_24411 ?auto_24435 ) ) ( not ( = ?auto_24411 ?auto_24412 ) ) ( not ( = ?auto_24386 ?auto_24391 ) ) ( not ( = ?auto_24386 ?auto_24428 ) ) ( not ( = ?auto_24387 ?auto_24391 ) ) ( not ( = ?auto_24387 ?auto_24428 ) ) ( not ( = ?auto_24388 ?auto_24391 ) ) ( not ( = ?auto_24388 ?auto_24428 ) ) ( not ( = ?auto_24389 ?auto_24391 ) ) ( not ( = ?auto_24389 ?auto_24428 ) ) ( not ( = ?auto_24391 ?auto_24411 ) ) ( not ( = ?auto_24391 ?auto_24419 ) ) ( not ( = ?auto_24391 ?auto_24435 ) ) ( not ( = ?auto_24391 ?auto_24412 ) ) ( not ( = ?auto_24428 ?auto_24411 ) ) ( not ( = ?auto_24428 ?auto_24419 ) ) ( not ( = ?auto_24428 ?auto_24435 ) ) ( not ( = ?auto_24428 ?auto_24412 ) ) ( not ( = ?auto_24386 ?auto_24392 ) ) ( not ( = ?auto_24386 ?auto_24432 ) ) ( not ( = ?auto_24387 ?auto_24392 ) ) ( not ( = ?auto_24387 ?auto_24432 ) ) ( not ( = ?auto_24388 ?auto_24392 ) ) ( not ( = ?auto_24388 ?auto_24432 ) ) ( not ( = ?auto_24389 ?auto_24392 ) ) ( not ( = ?auto_24389 ?auto_24432 ) ) ( not ( = ?auto_24390 ?auto_24392 ) ) ( not ( = ?auto_24390 ?auto_24432 ) ) ( not ( = ?auto_24392 ?auto_24428 ) ) ( not ( = ?auto_24392 ?auto_24411 ) ) ( not ( = ?auto_24392 ?auto_24419 ) ) ( not ( = ?auto_24392 ?auto_24435 ) ) ( not ( = ?auto_24392 ?auto_24412 ) ) ( not ( = ?auto_24433 ?auto_24415 ) ) ( not ( = ?auto_24433 ?auto_24413 ) ) ( not ( = ?auto_24433 ?auto_24404 ) ) ( not ( = ?auto_24433 ?auto_24429 ) ) ( not ( = ?auto_24430 ?auto_24434 ) ) ( not ( = ?auto_24430 ?auto_24420 ) ) ( not ( = ?auto_24430 ?auto_24403 ) ) ( not ( = ?auto_24430 ?auto_24416 ) ) ( not ( = ?auto_24432 ?auto_24428 ) ) ( not ( = ?auto_24432 ?auto_24411 ) ) ( not ( = ?auto_24432 ?auto_24419 ) ) ( not ( = ?auto_24432 ?auto_24435 ) ) ( not ( = ?auto_24432 ?auto_24412 ) ) ( not ( = ?auto_24386 ?auto_24393 ) ) ( not ( = ?auto_24386 ?auto_24414 ) ) ( not ( = ?auto_24387 ?auto_24393 ) ) ( not ( = ?auto_24387 ?auto_24414 ) ) ( not ( = ?auto_24388 ?auto_24393 ) ) ( not ( = ?auto_24388 ?auto_24414 ) ) ( not ( = ?auto_24389 ?auto_24393 ) ) ( not ( = ?auto_24389 ?auto_24414 ) ) ( not ( = ?auto_24390 ?auto_24393 ) ) ( not ( = ?auto_24390 ?auto_24414 ) ) ( not ( = ?auto_24391 ?auto_24393 ) ) ( not ( = ?auto_24391 ?auto_24414 ) ) ( not ( = ?auto_24393 ?auto_24432 ) ) ( not ( = ?auto_24393 ?auto_24428 ) ) ( not ( = ?auto_24393 ?auto_24411 ) ) ( not ( = ?auto_24393 ?auto_24419 ) ) ( not ( = ?auto_24393 ?auto_24435 ) ) ( not ( = ?auto_24393 ?auto_24412 ) ) ( not ( = ?auto_24414 ?auto_24432 ) ) ( not ( = ?auto_24414 ?auto_24428 ) ) ( not ( = ?auto_24414 ?auto_24411 ) ) ( not ( = ?auto_24414 ?auto_24419 ) ) ( not ( = ?auto_24414 ?auto_24435 ) ) ( not ( = ?auto_24414 ?auto_24412 ) ) ( not ( = ?auto_24386 ?auto_24394 ) ) ( not ( = ?auto_24386 ?auto_24421 ) ) ( not ( = ?auto_24387 ?auto_24394 ) ) ( not ( = ?auto_24387 ?auto_24421 ) ) ( not ( = ?auto_24388 ?auto_24394 ) ) ( not ( = ?auto_24388 ?auto_24421 ) ) ( not ( = ?auto_24389 ?auto_24394 ) ) ( not ( = ?auto_24389 ?auto_24421 ) ) ( not ( = ?auto_24390 ?auto_24394 ) ) ( not ( = ?auto_24390 ?auto_24421 ) ) ( not ( = ?auto_24391 ?auto_24394 ) ) ( not ( = ?auto_24391 ?auto_24421 ) ) ( not ( = ?auto_24392 ?auto_24394 ) ) ( not ( = ?auto_24392 ?auto_24421 ) ) ( not ( = ?auto_24394 ?auto_24414 ) ) ( not ( = ?auto_24394 ?auto_24432 ) ) ( not ( = ?auto_24394 ?auto_24428 ) ) ( not ( = ?auto_24394 ?auto_24411 ) ) ( not ( = ?auto_24394 ?auto_24419 ) ) ( not ( = ?auto_24394 ?auto_24435 ) ) ( not ( = ?auto_24394 ?auto_24412 ) ) ( not ( = ?auto_24421 ?auto_24414 ) ) ( not ( = ?auto_24421 ?auto_24432 ) ) ( not ( = ?auto_24421 ?auto_24428 ) ) ( not ( = ?auto_24421 ?auto_24411 ) ) ( not ( = ?auto_24421 ?auto_24419 ) ) ( not ( = ?auto_24421 ?auto_24435 ) ) ( not ( = ?auto_24421 ?auto_24412 ) ) ( not ( = ?auto_24386 ?auto_24395 ) ) ( not ( = ?auto_24386 ?auto_24410 ) ) ( not ( = ?auto_24387 ?auto_24395 ) ) ( not ( = ?auto_24387 ?auto_24410 ) ) ( not ( = ?auto_24388 ?auto_24395 ) ) ( not ( = ?auto_24388 ?auto_24410 ) ) ( not ( = ?auto_24389 ?auto_24395 ) ) ( not ( = ?auto_24389 ?auto_24410 ) ) ( not ( = ?auto_24390 ?auto_24395 ) ) ( not ( = ?auto_24390 ?auto_24410 ) ) ( not ( = ?auto_24391 ?auto_24395 ) ) ( not ( = ?auto_24391 ?auto_24410 ) ) ( not ( = ?auto_24392 ?auto_24395 ) ) ( not ( = ?auto_24392 ?auto_24410 ) ) ( not ( = ?auto_24393 ?auto_24395 ) ) ( not ( = ?auto_24393 ?auto_24410 ) ) ( not ( = ?auto_24395 ?auto_24421 ) ) ( not ( = ?auto_24395 ?auto_24414 ) ) ( not ( = ?auto_24395 ?auto_24432 ) ) ( not ( = ?auto_24395 ?auto_24428 ) ) ( not ( = ?auto_24395 ?auto_24411 ) ) ( not ( = ?auto_24395 ?auto_24419 ) ) ( not ( = ?auto_24395 ?auto_24435 ) ) ( not ( = ?auto_24395 ?auto_24412 ) ) ( not ( = ?auto_24410 ?auto_24421 ) ) ( not ( = ?auto_24410 ?auto_24414 ) ) ( not ( = ?auto_24410 ?auto_24432 ) ) ( not ( = ?auto_24410 ?auto_24428 ) ) ( not ( = ?auto_24410 ?auto_24411 ) ) ( not ( = ?auto_24410 ?auto_24419 ) ) ( not ( = ?auto_24410 ?auto_24435 ) ) ( not ( = ?auto_24410 ?auto_24412 ) ) ( not ( = ?auto_24386 ?auto_24396 ) ) ( not ( = ?auto_24386 ?auto_24423 ) ) ( not ( = ?auto_24387 ?auto_24396 ) ) ( not ( = ?auto_24387 ?auto_24423 ) ) ( not ( = ?auto_24388 ?auto_24396 ) ) ( not ( = ?auto_24388 ?auto_24423 ) ) ( not ( = ?auto_24389 ?auto_24396 ) ) ( not ( = ?auto_24389 ?auto_24423 ) ) ( not ( = ?auto_24390 ?auto_24396 ) ) ( not ( = ?auto_24390 ?auto_24423 ) ) ( not ( = ?auto_24391 ?auto_24396 ) ) ( not ( = ?auto_24391 ?auto_24423 ) ) ( not ( = ?auto_24392 ?auto_24396 ) ) ( not ( = ?auto_24392 ?auto_24423 ) ) ( not ( = ?auto_24393 ?auto_24396 ) ) ( not ( = ?auto_24393 ?auto_24423 ) ) ( not ( = ?auto_24394 ?auto_24396 ) ) ( not ( = ?auto_24394 ?auto_24423 ) ) ( not ( = ?auto_24396 ?auto_24410 ) ) ( not ( = ?auto_24396 ?auto_24421 ) ) ( not ( = ?auto_24396 ?auto_24414 ) ) ( not ( = ?auto_24396 ?auto_24432 ) ) ( not ( = ?auto_24396 ?auto_24428 ) ) ( not ( = ?auto_24396 ?auto_24411 ) ) ( not ( = ?auto_24396 ?auto_24419 ) ) ( not ( = ?auto_24396 ?auto_24435 ) ) ( not ( = ?auto_24396 ?auto_24412 ) ) ( not ( = ?auto_24426 ?auto_24413 ) ) ( not ( = ?auto_24426 ?auto_24433 ) ) ( not ( = ?auto_24426 ?auto_24404 ) ) ( not ( = ?auto_24426 ?auto_24415 ) ) ( not ( = ?auto_24426 ?auto_24429 ) ) ( not ( = ?auto_24427 ?auto_24420 ) ) ( not ( = ?auto_24427 ?auto_24430 ) ) ( not ( = ?auto_24427 ?auto_24403 ) ) ( not ( = ?auto_24427 ?auto_24434 ) ) ( not ( = ?auto_24427 ?auto_24416 ) ) ( not ( = ?auto_24423 ?auto_24410 ) ) ( not ( = ?auto_24423 ?auto_24421 ) ) ( not ( = ?auto_24423 ?auto_24414 ) ) ( not ( = ?auto_24423 ?auto_24432 ) ) ( not ( = ?auto_24423 ?auto_24428 ) ) ( not ( = ?auto_24423 ?auto_24411 ) ) ( not ( = ?auto_24423 ?auto_24419 ) ) ( not ( = ?auto_24423 ?auto_24435 ) ) ( not ( = ?auto_24423 ?auto_24412 ) ) ( not ( = ?auto_24386 ?auto_24397 ) ) ( not ( = ?auto_24386 ?auto_24409 ) ) ( not ( = ?auto_24387 ?auto_24397 ) ) ( not ( = ?auto_24387 ?auto_24409 ) ) ( not ( = ?auto_24388 ?auto_24397 ) ) ( not ( = ?auto_24388 ?auto_24409 ) ) ( not ( = ?auto_24389 ?auto_24397 ) ) ( not ( = ?auto_24389 ?auto_24409 ) ) ( not ( = ?auto_24390 ?auto_24397 ) ) ( not ( = ?auto_24390 ?auto_24409 ) ) ( not ( = ?auto_24391 ?auto_24397 ) ) ( not ( = ?auto_24391 ?auto_24409 ) ) ( not ( = ?auto_24392 ?auto_24397 ) ) ( not ( = ?auto_24392 ?auto_24409 ) ) ( not ( = ?auto_24393 ?auto_24397 ) ) ( not ( = ?auto_24393 ?auto_24409 ) ) ( not ( = ?auto_24394 ?auto_24397 ) ) ( not ( = ?auto_24394 ?auto_24409 ) ) ( not ( = ?auto_24395 ?auto_24397 ) ) ( not ( = ?auto_24395 ?auto_24409 ) ) ( not ( = ?auto_24397 ?auto_24423 ) ) ( not ( = ?auto_24397 ?auto_24410 ) ) ( not ( = ?auto_24397 ?auto_24421 ) ) ( not ( = ?auto_24397 ?auto_24414 ) ) ( not ( = ?auto_24397 ?auto_24432 ) ) ( not ( = ?auto_24397 ?auto_24428 ) ) ( not ( = ?auto_24397 ?auto_24411 ) ) ( not ( = ?auto_24397 ?auto_24419 ) ) ( not ( = ?auto_24397 ?auto_24435 ) ) ( not ( = ?auto_24397 ?auto_24412 ) ) ( not ( = ?auto_24409 ?auto_24423 ) ) ( not ( = ?auto_24409 ?auto_24410 ) ) ( not ( = ?auto_24409 ?auto_24421 ) ) ( not ( = ?auto_24409 ?auto_24414 ) ) ( not ( = ?auto_24409 ?auto_24432 ) ) ( not ( = ?auto_24409 ?auto_24428 ) ) ( not ( = ?auto_24409 ?auto_24411 ) ) ( not ( = ?auto_24409 ?auto_24419 ) ) ( not ( = ?auto_24409 ?auto_24435 ) ) ( not ( = ?auto_24409 ?auto_24412 ) ) ( not ( = ?auto_24386 ?auto_24398 ) ) ( not ( = ?auto_24386 ?auto_24425 ) ) ( not ( = ?auto_24387 ?auto_24398 ) ) ( not ( = ?auto_24387 ?auto_24425 ) ) ( not ( = ?auto_24388 ?auto_24398 ) ) ( not ( = ?auto_24388 ?auto_24425 ) ) ( not ( = ?auto_24389 ?auto_24398 ) ) ( not ( = ?auto_24389 ?auto_24425 ) ) ( not ( = ?auto_24390 ?auto_24398 ) ) ( not ( = ?auto_24390 ?auto_24425 ) ) ( not ( = ?auto_24391 ?auto_24398 ) ) ( not ( = ?auto_24391 ?auto_24425 ) ) ( not ( = ?auto_24392 ?auto_24398 ) ) ( not ( = ?auto_24392 ?auto_24425 ) ) ( not ( = ?auto_24393 ?auto_24398 ) ) ( not ( = ?auto_24393 ?auto_24425 ) ) ( not ( = ?auto_24394 ?auto_24398 ) ) ( not ( = ?auto_24394 ?auto_24425 ) ) ( not ( = ?auto_24395 ?auto_24398 ) ) ( not ( = ?auto_24395 ?auto_24425 ) ) ( not ( = ?auto_24396 ?auto_24398 ) ) ( not ( = ?auto_24396 ?auto_24425 ) ) ( not ( = ?auto_24398 ?auto_24409 ) ) ( not ( = ?auto_24398 ?auto_24423 ) ) ( not ( = ?auto_24398 ?auto_24410 ) ) ( not ( = ?auto_24398 ?auto_24421 ) ) ( not ( = ?auto_24398 ?auto_24414 ) ) ( not ( = ?auto_24398 ?auto_24432 ) ) ( not ( = ?auto_24398 ?auto_24428 ) ) ( not ( = ?auto_24398 ?auto_24411 ) ) ( not ( = ?auto_24398 ?auto_24419 ) ) ( not ( = ?auto_24398 ?auto_24435 ) ) ( not ( = ?auto_24398 ?auto_24412 ) ) ( not ( = ?auto_24422 ?auto_24404 ) ) ( not ( = ?auto_24422 ?auto_24426 ) ) ( not ( = ?auto_24422 ?auto_24413 ) ) ( not ( = ?auto_24422 ?auto_24433 ) ) ( not ( = ?auto_24422 ?auto_24415 ) ) ( not ( = ?auto_24422 ?auto_24429 ) ) ( not ( = ?auto_24417 ?auto_24403 ) ) ( not ( = ?auto_24417 ?auto_24427 ) ) ( not ( = ?auto_24417 ?auto_24420 ) ) ( not ( = ?auto_24417 ?auto_24430 ) ) ( not ( = ?auto_24417 ?auto_24434 ) ) ( not ( = ?auto_24417 ?auto_24416 ) ) ( not ( = ?auto_24425 ?auto_24409 ) ) ( not ( = ?auto_24425 ?auto_24423 ) ) ( not ( = ?auto_24425 ?auto_24410 ) ) ( not ( = ?auto_24425 ?auto_24421 ) ) ( not ( = ?auto_24425 ?auto_24414 ) ) ( not ( = ?auto_24425 ?auto_24432 ) ) ( not ( = ?auto_24425 ?auto_24428 ) ) ( not ( = ?auto_24425 ?auto_24411 ) ) ( not ( = ?auto_24425 ?auto_24419 ) ) ( not ( = ?auto_24425 ?auto_24435 ) ) ( not ( = ?auto_24425 ?auto_24412 ) ) ( not ( = ?auto_24386 ?auto_24399 ) ) ( not ( = ?auto_24386 ?auto_24424 ) ) ( not ( = ?auto_24387 ?auto_24399 ) ) ( not ( = ?auto_24387 ?auto_24424 ) ) ( not ( = ?auto_24388 ?auto_24399 ) ) ( not ( = ?auto_24388 ?auto_24424 ) ) ( not ( = ?auto_24389 ?auto_24399 ) ) ( not ( = ?auto_24389 ?auto_24424 ) ) ( not ( = ?auto_24390 ?auto_24399 ) ) ( not ( = ?auto_24390 ?auto_24424 ) ) ( not ( = ?auto_24391 ?auto_24399 ) ) ( not ( = ?auto_24391 ?auto_24424 ) ) ( not ( = ?auto_24392 ?auto_24399 ) ) ( not ( = ?auto_24392 ?auto_24424 ) ) ( not ( = ?auto_24393 ?auto_24399 ) ) ( not ( = ?auto_24393 ?auto_24424 ) ) ( not ( = ?auto_24394 ?auto_24399 ) ) ( not ( = ?auto_24394 ?auto_24424 ) ) ( not ( = ?auto_24395 ?auto_24399 ) ) ( not ( = ?auto_24395 ?auto_24424 ) ) ( not ( = ?auto_24396 ?auto_24399 ) ) ( not ( = ?auto_24396 ?auto_24424 ) ) ( not ( = ?auto_24397 ?auto_24399 ) ) ( not ( = ?auto_24397 ?auto_24424 ) ) ( not ( = ?auto_24399 ?auto_24425 ) ) ( not ( = ?auto_24399 ?auto_24409 ) ) ( not ( = ?auto_24399 ?auto_24423 ) ) ( not ( = ?auto_24399 ?auto_24410 ) ) ( not ( = ?auto_24399 ?auto_24421 ) ) ( not ( = ?auto_24399 ?auto_24414 ) ) ( not ( = ?auto_24399 ?auto_24432 ) ) ( not ( = ?auto_24399 ?auto_24428 ) ) ( not ( = ?auto_24399 ?auto_24411 ) ) ( not ( = ?auto_24399 ?auto_24419 ) ) ( not ( = ?auto_24399 ?auto_24435 ) ) ( not ( = ?auto_24399 ?auto_24412 ) ) ( not ( = ?auto_24424 ?auto_24425 ) ) ( not ( = ?auto_24424 ?auto_24409 ) ) ( not ( = ?auto_24424 ?auto_24423 ) ) ( not ( = ?auto_24424 ?auto_24410 ) ) ( not ( = ?auto_24424 ?auto_24421 ) ) ( not ( = ?auto_24424 ?auto_24414 ) ) ( not ( = ?auto_24424 ?auto_24432 ) ) ( not ( = ?auto_24424 ?auto_24428 ) ) ( not ( = ?auto_24424 ?auto_24411 ) ) ( not ( = ?auto_24424 ?auto_24419 ) ) ( not ( = ?auto_24424 ?auto_24435 ) ) ( not ( = ?auto_24424 ?auto_24412 ) ) ( not ( = ?auto_24386 ?auto_24400 ) ) ( not ( = ?auto_24386 ?auto_24418 ) ) ( not ( = ?auto_24387 ?auto_24400 ) ) ( not ( = ?auto_24387 ?auto_24418 ) ) ( not ( = ?auto_24388 ?auto_24400 ) ) ( not ( = ?auto_24388 ?auto_24418 ) ) ( not ( = ?auto_24389 ?auto_24400 ) ) ( not ( = ?auto_24389 ?auto_24418 ) ) ( not ( = ?auto_24390 ?auto_24400 ) ) ( not ( = ?auto_24390 ?auto_24418 ) ) ( not ( = ?auto_24391 ?auto_24400 ) ) ( not ( = ?auto_24391 ?auto_24418 ) ) ( not ( = ?auto_24392 ?auto_24400 ) ) ( not ( = ?auto_24392 ?auto_24418 ) ) ( not ( = ?auto_24393 ?auto_24400 ) ) ( not ( = ?auto_24393 ?auto_24418 ) ) ( not ( = ?auto_24394 ?auto_24400 ) ) ( not ( = ?auto_24394 ?auto_24418 ) ) ( not ( = ?auto_24395 ?auto_24400 ) ) ( not ( = ?auto_24395 ?auto_24418 ) ) ( not ( = ?auto_24396 ?auto_24400 ) ) ( not ( = ?auto_24396 ?auto_24418 ) ) ( not ( = ?auto_24397 ?auto_24400 ) ) ( not ( = ?auto_24397 ?auto_24418 ) ) ( not ( = ?auto_24398 ?auto_24400 ) ) ( not ( = ?auto_24398 ?auto_24418 ) ) ( not ( = ?auto_24400 ?auto_24424 ) ) ( not ( = ?auto_24400 ?auto_24425 ) ) ( not ( = ?auto_24400 ?auto_24409 ) ) ( not ( = ?auto_24400 ?auto_24423 ) ) ( not ( = ?auto_24400 ?auto_24410 ) ) ( not ( = ?auto_24400 ?auto_24421 ) ) ( not ( = ?auto_24400 ?auto_24414 ) ) ( not ( = ?auto_24400 ?auto_24432 ) ) ( not ( = ?auto_24400 ?auto_24428 ) ) ( not ( = ?auto_24400 ?auto_24411 ) ) ( not ( = ?auto_24400 ?auto_24419 ) ) ( not ( = ?auto_24400 ?auto_24435 ) ) ( not ( = ?auto_24400 ?auto_24412 ) ) ( not ( = ?auto_24418 ?auto_24424 ) ) ( not ( = ?auto_24418 ?auto_24425 ) ) ( not ( = ?auto_24418 ?auto_24409 ) ) ( not ( = ?auto_24418 ?auto_24423 ) ) ( not ( = ?auto_24418 ?auto_24410 ) ) ( not ( = ?auto_24418 ?auto_24421 ) ) ( not ( = ?auto_24418 ?auto_24414 ) ) ( not ( = ?auto_24418 ?auto_24432 ) ) ( not ( = ?auto_24418 ?auto_24428 ) ) ( not ( = ?auto_24418 ?auto_24411 ) ) ( not ( = ?auto_24418 ?auto_24419 ) ) ( not ( = ?auto_24418 ?auto_24435 ) ) ( not ( = ?auto_24418 ?auto_24412 ) ) ( not ( = ?auto_24386 ?auto_24402 ) ) ( not ( = ?auto_24386 ?auto_24431 ) ) ( not ( = ?auto_24387 ?auto_24402 ) ) ( not ( = ?auto_24387 ?auto_24431 ) ) ( not ( = ?auto_24388 ?auto_24402 ) ) ( not ( = ?auto_24388 ?auto_24431 ) ) ( not ( = ?auto_24389 ?auto_24402 ) ) ( not ( = ?auto_24389 ?auto_24431 ) ) ( not ( = ?auto_24390 ?auto_24402 ) ) ( not ( = ?auto_24390 ?auto_24431 ) ) ( not ( = ?auto_24391 ?auto_24402 ) ) ( not ( = ?auto_24391 ?auto_24431 ) ) ( not ( = ?auto_24392 ?auto_24402 ) ) ( not ( = ?auto_24392 ?auto_24431 ) ) ( not ( = ?auto_24393 ?auto_24402 ) ) ( not ( = ?auto_24393 ?auto_24431 ) ) ( not ( = ?auto_24394 ?auto_24402 ) ) ( not ( = ?auto_24394 ?auto_24431 ) ) ( not ( = ?auto_24395 ?auto_24402 ) ) ( not ( = ?auto_24395 ?auto_24431 ) ) ( not ( = ?auto_24396 ?auto_24402 ) ) ( not ( = ?auto_24396 ?auto_24431 ) ) ( not ( = ?auto_24397 ?auto_24402 ) ) ( not ( = ?auto_24397 ?auto_24431 ) ) ( not ( = ?auto_24398 ?auto_24402 ) ) ( not ( = ?auto_24398 ?auto_24431 ) ) ( not ( = ?auto_24399 ?auto_24402 ) ) ( not ( = ?auto_24399 ?auto_24431 ) ) ( not ( = ?auto_24402 ?auto_24418 ) ) ( not ( = ?auto_24402 ?auto_24424 ) ) ( not ( = ?auto_24402 ?auto_24425 ) ) ( not ( = ?auto_24402 ?auto_24409 ) ) ( not ( = ?auto_24402 ?auto_24423 ) ) ( not ( = ?auto_24402 ?auto_24410 ) ) ( not ( = ?auto_24402 ?auto_24421 ) ) ( not ( = ?auto_24402 ?auto_24414 ) ) ( not ( = ?auto_24402 ?auto_24432 ) ) ( not ( = ?auto_24402 ?auto_24428 ) ) ( not ( = ?auto_24402 ?auto_24411 ) ) ( not ( = ?auto_24402 ?auto_24419 ) ) ( not ( = ?auto_24402 ?auto_24435 ) ) ( not ( = ?auto_24402 ?auto_24412 ) ) ( not ( = ?auto_24431 ?auto_24418 ) ) ( not ( = ?auto_24431 ?auto_24424 ) ) ( not ( = ?auto_24431 ?auto_24425 ) ) ( not ( = ?auto_24431 ?auto_24409 ) ) ( not ( = ?auto_24431 ?auto_24423 ) ) ( not ( = ?auto_24431 ?auto_24410 ) ) ( not ( = ?auto_24431 ?auto_24421 ) ) ( not ( = ?auto_24431 ?auto_24414 ) ) ( not ( = ?auto_24431 ?auto_24432 ) ) ( not ( = ?auto_24431 ?auto_24428 ) ) ( not ( = ?auto_24431 ?auto_24411 ) ) ( not ( = ?auto_24431 ?auto_24419 ) ) ( not ( = ?auto_24431 ?auto_24435 ) ) ( not ( = ?auto_24431 ?auto_24412 ) ) ( not ( = ?auto_24386 ?auto_24401 ) ) ( not ( = ?auto_24386 ?auto_24405 ) ) ( not ( = ?auto_24387 ?auto_24401 ) ) ( not ( = ?auto_24387 ?auto_24405 ) ) ( not ( = ?auto_24388 ?auto_24401 ) ) ( not ( = ?auto_24388 ?auto_24405 ) ) ( not ( = ?auto_24389 ?auto_24401 ) ) ( not ( = ?auto_24389 ?auto_24405 ) ) ( not ( = ?auto_24390 ?auto_24401 ) ) ( not ( = ?auto_24390 ?auto_24405 ) ) ( not ( = ?auto_24391 ?auto_24401 ) ) ( not ( = ?auto_24391 ?auto_24405 ) ) ( not ( = ?auto_24392 ?auto_24401 ) ) ( not ( = ?auto_24392 ?auto_24405 ) ) ( not ( = ?auto_24393 ?auto_24401 ) ) ( not ( = ?auto_24393 ?auto_24405 ) ) ( not ( = ?auto_24394 ?auto_24401 ) ) ( not ( = ?auto_24394 ?auto_24405 ) ) ( not ( = ?auto_24395 ?auto_24401 ) ) ( not ( = ?auto_24395 ?auto_24405 ) ) ( not ( = ?auto_24396 ?auto_24401 ) ) ( not ( = ?auto_24396 ?auto_24405 ) ) ( not ( = ?auto_24397 ?auto_24401 ) ) ( not ( = ?auto_24397 ?auto_24405 ) ) ( not ( = ?auto_24398 ?auto_24401 ) ) ( not ( = ?auto_24398 ?auto_24405 ) ) ( not ( = ?auto_24399 ?auto_24401 ) ) ( not ( = ?auto_24399 ?auto_24405 ) ) ( not ( = ?auto_24400 ?auto_24401 ) ) ( not ( = ?auto_24400 ?auto_24405 ) ) ( not ( = ?auto_24401 ?auto_24431 ) ) ( not ( = ?auto_24401 ?auto_24418 ) ) ( not ( = ?auto_24401 ?auto_24424 ) ) ( not ( = ?auto_24401 ?auto_24425 ) ) ( not ( = ?auto_24401 ?auto_24409 ) ) ( not ( = ?auto_24401 ?auto_24423 ) ) ( not ( = ?auto_24401 ?auto_24410 ) ) ( not ( = ?auto_24401 ?auto_24421 ) ) ( not ( = ?auto_24401 ?auto_24414 ) ) ( not ( = ?auto_24401 ?auto_24432 ) ) ( not ( = ?auto_24401 ?auto_24428 ) ) ( not ( = ?auto_24401 ?auto_24411 ) ) ( not ( = ?auto_24401 ?auto_24419 ) ) ( not ( = ?auto_24401 ?auto_24435 ) ) ( not ( = ?auto_24401 ?auto_24412 ) ) ( not ( = ?auto_24405 ?auto_24431 ) ) ( not ( = ?auto_24405 ?auto_24418 ) ) ( not ( = ?auto_24405 ?auto_24424 ) ) ( not ( = ?auto_24405 ?auto_24425 ) ) ( not ( = ?auto_24405 ?auto_24409 ) ) ( not ( = ?auto_24405 ?auto_24423 ) ) ( not ( = ?auto_24405 ?auto_24410 ) ) ( not ( = ?auto_24405 ?auto_24421 ) ) ( not ( = ?auto_24405 ?auto_24414 ) ) ( not ( = ?auto_24405 ?auto_24432 ) ) ( not ( = ?auto_24405 ?auto_24428 ) ) ( not ( = ?auto_24405 ?auto_24411 ) ) ( not ( = ?auto_24405 ?auto_24419 ) ) ( not ( = ?auto_24405 ?auto_24435 ) ) ( not ( = ?auto_24405 ?auto_24412 ) ) )
    :subtasks
    ( ( MAKE-15CRATE ?auto_24386 ?auto_24387 ?auto_24388 ?auto_24389 ?auto_24390 ?auto_24391 ?auto_24392 ?auto_24393 ?auto_24394 ?auto_24395 ?auto_24396 ?auto_24397 ?auto_24398 ?auto_24399 ?auto_24400 ?auto_24402 )
      ( MAKE-1CRATE ?auto_24402 ?auto_24401 )
      ( MAKE-16CRATE-VERIFY ?auto_24386 ?auto_24387 ?auto_24388 ?auto_24389 ?auto_24390 ?auto_24391 ?auto_24392 ?auto_24393 ?auto_24394 ?auto_24395 ?auto_24396 ?auto_24397 ?auto_24398 ?auto_24399 ?auto_24400 ?auto_24402 ?auto_24401 ) )
  )

)

