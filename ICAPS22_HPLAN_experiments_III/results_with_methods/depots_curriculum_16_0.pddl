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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23648 - SURFACE
      ?auto_23649 - SURFACE
    )
    :vars
    (
      ?auto_23650 - HOIST
      ?auto_23651 - PLACE
      ?auto_23653 - PLACE
      ?auto_23654 - HOIST
      ?auto_23655 - SURFACE
      ?auto_23652 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23650 ?auto_23651 ) ( SURFACE-AT ?auto_23648 ?auto_23651 ) ( CLEAR ?auto_23648 ) ( IS-CRATE ?auto_23649 ) ( AVAILABLE ?auto_23650 ) ( not ( = ?auto_23653 ?auto_23651 ) ) ( HOIST-AT ?auto_23654 ?auto_23653 ) ( AVAILABLE ?auto_23654 ) ( SURFACE-AT ?auto_23649 ?auto_23653 ) ( ON ?auto_23649 ?auto_23655 ) ( CLEAR ?auto_23649 ) ( TRUCK-AT ?auto_23652 ?auto_23651 ) ( not ( = ?auto_23648 ?auto_23649 ) ) ( not ( = ?auto_23648 ?auto_23655 ) ) ( not ( = ?auto_23649 ?auto_23655 ) ) ( not ( = ?auto_23650 ?auto_23654 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23652 ?auto_23651 ?auto_23653 )
      ( !LIFT ?auto_23654 ?auto_23649 ?auto_23655 ?auto_23653 )
      ( !LOAD ?auto_23654 ?auto_23649 ?auto_23652 ?auto_23653 )
      ( !DRIVE ?auto_23652 ?auto_23653 ?auto_23651 )
      ( !UNLOAD ?auto_23650 ?auto_23649 ?auto_23652 ?auto_23651 )
      ( !DROP ?auto_23650 ?auto_23649 ?auto_23648 ?auto_23651 )
      ( MAKE-1CRATE-VERIFY ?auto_23648 ?auto_23649 ) )
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
      ?auto_23667 - PLACE
      ?auto_23664 - PLACE
      ?auto_23663 - HOIST
      ?auto_23666 - SURFACE
      ?auto_23669 - PLACE
      ?auto_23670 - HOIST
      ?auto_23668 - SURFACE
      ?auto_23665 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23662 ?auto_23667 ) ( IS-CRATE ?auto_23661 ) ( not ( = ?auto_23664 ?auto_23667 ) ) ( HOIST-AT ?auto_23663 ?auto_23664 ) ( AVAILABLE ?auto_23663 ) ( SURFACE-AT ?auto_23661 ?auto_23664 ) ( ON ?auto_23661 ?auto_23666 ) ( CLEAR ?auto_23661 ) ( not ( = ?auto_23660 ?auto_23661 ) ) ( not ( = ?auto_23660 ?auto_23666 ) ) ( not ( = ?auto_23661 ?auto_23666 ) ) ( not ( = ?auto_23662 ?auto_23663 ) ) ( SURFACE-AT ?auto_23659 ?auto_23667 ) ( CLEAR ?auto_23659 ) ( IS-CRATE ?auto_23660 ) ( AVAILABLE ?auto_23662 ) ( not ( = ?auto_23669 ?auto_23667 ) ) ( HOIST-AT ?auto_23670 ?auto_23669 ) ( AVAILABLE ?auto_23670 ) ( SURFACE-AT ?auto_23660 ?auto_23669 ) ( ON ?auto_23660 ?auto_23668 ) ( CLEAR ?auto_23660 ) ( TRUCK-AT ?auto_23665 ?auto_23667 ) ( not ( = ?auto_23659 ?auto_23660 ) ) ( not ( = ?auto_23659 ?auto_23668 ) ) ( not ( = ?auto_23660 ?auto_23668 ) ) ( not ( = ?auto_23662 ?auto_23670 ) ) ( not ( = ?auto_23659 ?auto_23661 ) ) ( not ( = ?auto_23659 ?auto_23666 ) ) ( not ( = ?auto_23661 ?auto_23668 ) ) ( not ( = ?auto_23664 ?auto_23669 ) ) ( not ( = ?auto_23663 ?auto_23670 ) ) ( not ( = ?auto_23666 ?auto_23668 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23659 ?auto_23660 )
      ( MAKE-1CRATE ?auto_23660 ?auto_23661 )
      ( MAKE-2CRATE-VERIFY ?auto_23659 ?auto_23660 ?auto_23661 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23673 - SURFACE
      ?auto_23674 - SURFACE
    )
    :vars
    (
      ?auto_23675 - HOIST
      ?auto_23676 - PLACE
      ?auto_23678 - PLACE
      ?auto_23679 - HOIST
      ?auto_23680 - SURFACE
      ?auto_23677 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23675 ?auto_23676 ) ( SURFACE-AT ?auto_23673 ?auto_23676 ) ( CLEAR ?auto_23673 ) ( IS-CRATE ?auto_23674 ) ( AVAILABLE ?auto_23675 ) ( not ( = ?auto_23678 ?auto_23676 ) ) ( HOIST-AT ?auto_23679 ?auto_23678 ) ( AVAILABLE ?auto_23679 ) ( SURFACE-AT ?auto_23674 ?auto_23678 ) ( ON ?auto_23674 ?auto_23680 ) ( CLEAR ?auto_23674 ) ( TRUCK-AT ?auto_23677 ?auto_23676 ) ( not ( = ?auto_23673 ?auto_23674 ) ) ( not ( = ?auto_23673 ?auto_23680 ) ) ( not ( = ?auto_23674 ?auto_23680 ) ) ( not ( = ?auto_23675 ?auto_23679 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23677 ?auto_23676 ?auto_23678 )
      ( !LIFT ?auto_23679 ?auto_23674 ?auto_23680 ?auto_23678 )
      ( !LOAD ?auto_23679 ?auto_23674 ?auto_23677 ?auto_23678 )
      ( !DRIVE ?auto_23677 ?auto_23678 ?auto_23676 )
      ( !UNLOAD ?auto_23675 ?auto_23674 ?auto_23677 ?auto_23676 )
      ( !DROP ?auto_23675 ?auto_23674 ?auto_23673 ?auto_23676 )
      ( MAKE-1CRATE-VERIFY ?auto_23673 ?auto_23674 ) )
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
      ?auto_23690 - HOIST
      ?auto_23694 - PLACE
      ?auto_23689 - PLACE
      ?auto_23693 - HOIST
      ?auto_23692 - SURFACE
      ?auto_23698 - PLACE
      ?auto_23699 - HOIST
      ?auto_23697 - SURFACE
      ?auto_23696 - PLACE
      ?auto_23695 - HOIST
      ?auto_23700 - SURFACE
      ?auto_23691 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23690 ?auto_23694 ) ( IS-CRATE ?auto_23688 ) ( not ( = ?auto_23689 ?auto_23694 ) ) ( HOIST-AT ?auto_23693 ?auto_23689 ) ( AVAILABLE ?auto_23693 ) ( SURFACE-AT ?auto_23688 ?auto_23689 ) ( ON ?auto_23688 ?auto_23692 ) ( CLEAR ?auto_23688 ) ( not ( = ?auto_23687 ?auto_23688 ) ) ( not ( = ?auto_23687 ?auto_23692 ) ) ( not ( = ?auto_23688 ?auto_23692 ) ) ( not ( = ?auto_23690 ?auto_23693 ) ) ( IS-CRATE ?auto_23687 ) ( not ( = ?auto_23698 ?auto_23694 ) ) ( HOIST-AT ?auto_23699 ?auto_23698 ) ( AVAILABLE ?auto_23699 ) ( SURFACE-AT ?auto_23687 ?auto_23698 ) ( ON ?auto_23687 ?auto_23697 ) ( CLEAR ?auto_23687 ) ( not ( = ?auto_23686 ?auto_23687 ) ) ( not ( = ?auto_23686 ?auto_23697 ) ) ( not ( = ?auto_23687 ?auto_23697 ) ) ( not ( = ?auto_23690 ?auto_23699 ) ) ( SURFACE-AT ?auto_23685 ?auto_23694 ) ( CLEAR ?auto_23685 ) ( IS-CRATE ?auto_23686 ) ( AVAILABLE ?auto_23690 ) ( not ( = ?auto_23696 ?auto_23694 ) ) ( HOIST-AT ?auto_23695 ?auto_23696 ) ( AVAILABLE ?auto_23695 ) ( SURFACE-AT ?auto_23686 ?auto_23696 ) ( ON ?auto_23686 ?auto_23700 ) ( CLEAR ?auto_23686 ) ( TRUCK-AT ?auto_23691 ?auto_23694 ) ( not ( = ?auto_23685 ?auto_23686 ) ) ( not ( = ?auto_23685 ?auto_23700 ) ) ( not ( = ?auto_23686 ?auto_23700 ) ) ( not ( = ?auto_23690 ?auto_23695 ) ) ( not ( = ?auto_23685 ?auto_23687 ) ) ( not ( = ?auto_23685 ?auto_23697 ) ) ( not ( = ?auto_23687 ?auto_23700 ) ) ( not ( = ?auto_23698 ?auto_23696 ) ) ( not ( = ?auto_23699 ?auto_23695 ) ) ( not ( = ?auto_23697 ?auto_23700 ) ) ( not ( = ?auto_23685 ?auto_23688 ) ) ( not ( = ?auto_23685 ?auto_23692 ) ) ( not ( = ?auto_23686 ?auto_23688 ) ) ( not ( = ?auto_23686 ?auto_23692 ) ) ( not ( = ?auto_23688 ?auto_23697 ) ) ( not ( = ?auto_23688 ?auto_23700 ) ) ( not ( = ?auto_23689 ?auto_23698 ) ) ( not ( = ?auto_23689 ?auto_23696 ) ) ( not ( = ?auto_23693 ?auto_23699 ) ) ( not ( = ?auto_23693 ?auto_23695 ) ) ( not ( = ?auto_23692 ?auto_23697 ) ) ( not ( = ?auto_23692 ?auto_23700 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23685 ?auto_23686 ?auto_23687 )
      ( MAKE-1CRATE ?auto_23687 ?auto_23688 )
      ( MAKE-3CRATE-VERIFY ?auto_23685 ?auto_23686 ?auto_23687 ?auto_23688 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23703 - SURFACE
      ?auto_23704 - SURFACE
    )
    :vars
    (
      ?auto_23705 - HOIST
      ?auto_23706 - PLACE
      ?auto_23708 - PLACE
      ?auto_23709 - HOIST
      ?auto_23710 - SURFACE
      ?auto_23707 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23705 ?auto_23706 ) ( SURFACE-AT ?auto_23703 ?auto_23706 ) ( CLEAR ?auto_23703 ) ( IS-CRATE ?auto_23704 ) ( AVAILABLE ?auto_23705 ) ( not ( = ?auto_23708 ?auto_23706 ) ) ( HOIST-AT ?auto_23709 ?auto_23708 ) ( AVAILABLE ?auto_23709 ) ( SURFACE-AT ?auto_23704 ?auto_23708 ) ( ON ?auto_23704 ?auto_23710 ) ( CLEAR ?auto_23704 ) ( TRUCK-AT ?auto_23707 ?auto_23706 ) ( not ( = ?auto_23703 ?auto_23704 ) ) ( not ( = ?auto_23703 ?auto_23710 ) ) ( not ( = ?auto_23704 ?auto_23710 ) ) ( not ( = ?auto_23705 ?auto_23709 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23707 ?auto_23706 ?auto_23708 )
      ( !LIFT ?auto_23709 ?auto_23704 ?auto_23710 ?auto_23708 )
      ( !LOAD ?auto_23709 ?auto_23704 ?auto_23707 ?auto_23708 )
      ( !DRIVE ?auto_23707 ?auto_23708 ?auto_23706 )
      ( !UNLOAD ?auto_23705 ?auto_23704 ?auto_23707 ?auto_23706 )
      ( !DROP ?auto_23705 ?auto_23704 ?auto_23703 ?auto_23706 )
      ( MAKE-1CRATE-VERIFY ?auto_23703 ?auto_23704 ) )
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
      ?auto_23726 - HOIST
      ?auto_23724 - PLACE
      ?auto_23722 - PLACE
      ?auto_23725 - HOIST
      ?auto_23721 - SURFACE
      ?auto_23728 - PLACE
      ?auto_23731 - HOIST
      ?auto_23734 - SURFACE
      ?auto_23727 - PLACE
      ?auto_23732 - HOIST
      ?auto_23733 - SURFACE
      ?auto_23729 - PLACE
      ?auto_23730 - HOIST
      ?auto_23735 - SURFACE
      ?auto_23723 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23726 ?auto_23724 ) ( IS-CRATE ?auto_23720 ) ( not ( = ?auto_23722 ?auto_23724 ) ) ( HOIST-AT ?auto_23725 ?auto_23722 ) ( AVAILABLE ?auto_23725 ) ( SURFACE-AT ?auto_23720 ?auto_23722 ) ( ON ?auto_23720 ?auto_23721 ) ( CLEAR ?auto_23720 ) ( not ( = ?auto_23719 ?auto_23720 ) ) ( not ( = ?auto_23719 ?auto_23721 ) ) ( not ( = ?auto_23720 ?auto_23721 ) ) ( not ( = ?auto_23726 ?auto_23725 ) ) ( IS-CRATE ?auto_23719 ) ( not ( = ?auto_23728 ?auto_23724 ) ) ( HOIST-AT ?auto_23731 ?auto_23728 ) ( AVAILABLE ?auto_23731 ) ( SURFACE-AT ?auto_23719 ?auto_23728 ) ( ON ?auto_23719 ?auto_23734 ) ( CLEAR ?auto_23719 ) ( not ( = ?auto_23718 ?auto_23719 ) ) ( not ( = ?auto_23718 ?auto_23734 ) ) ( not ( = ?auto_23719 ?auto_23734 ) ) ( not ( = ?auto_23726 ?auto_23731 ) ) ( IS-CRATE ?auto_23718 ) ( not ( = ?auto_23727 ?auto_23724 ) ) ( HOIST-AT ?auto_23732 ?auto_23727 ) ( AVAILABLE ?auto_23732 ) ( SURFACE-AT ?auto_23718 ?auto_23727 ) ( ON ?auto_23718 ?auto_23733 ) ( CLEAR ?auto_23718 ) ( not ( = ?auto_23717 ?auto_23718 ) ) ( not ( = ?auto_23717 ?auto_23733 ) ) ( not ( = ?auto_23718 ?auto_23733 ) ) ( not ( = ?auto_23726 ?auto_23732 ) ) ( SURFACE-AT ?auto_23716 ?auto_23724 ) ( CLEAR ?auto_23716 ) ( IS-CRATE ?auto_23717 ) ( AVAILABLE ?auto_23726 ) ( not ( = ?auto_23729 ?auto_23724 ) ) ( HOIST-AT ?auto_23730 ?auto_23729 ) ( AVAILABLE ?auto_23730 ) ( SURFACE-AT ?auto_23717 ?auto_23729 ) ( ON ?auto_23717 ?auto_23735 ) ( CLEAR ?auto_23717 ) ( TRUCK-AT ?auto_23723 ?auto_23724 ) ( not ( = ?auto_23716 ?auto_23717 ) ) ( not ( = ?auto_23716 ?auto_23735 ) ) ( not ( = ?auto_23717 ?auto_23735 ) ) ( not ( = ?auto_23726 ?auto_23730 ) ) ( not ( = ?auto_23716 ?auto_23718 ) ) ( not ( = ?auto_23716 ?auto_23733 ) ) ( not ( = ?auto_23718 ?auto_23735 ) ) ( not ( = ?auto_23727 ?auto_23729 ) ) ( not ( = ?auto_23732 ?auto_23730 ) ) ( not ( = ?auto_23733 ?auto_23735 ) ) ( not ( = ?auto_23716 ?auto_23719 ) ) ( not ( = ?auto_23716 ?auto_23734 ) ) ( not ( = ?auto_23717 ?auto_23719 ) ) ( not ( = ?auto_23717 ?auto_23734 ) ) ( not ( = ?auto_23719 ?auto_23733 ) ) ( not ( = ?auto_23719 ?auto_23735 ) ) ( not ( = ?auto_23728 ?auto_23727 ) ) ( not ( = ?auto_23728 ?auto_23729 ) ) ( not ( = ?auto_23731 ?auto_23732 ) ) ( not ( = ?auto_23731 ?auto_23730 ) ) ( not ( = ?auto_23734 ?auto_23733 ) ) ( not ( = ?auto_23734 ?auto_23735 ) ) ( not ( = ?auto_23716 ?auto_23720 ) ) ( not ( = ?auto_23716 ?auto_23721 ) ) ( not ( = ?auto_23717 ?auto_23720 ) ) ( not ( = ?auto_23717 ?auto_23721 ) ) ( not ( = ?auto_23718 ?auto_23720 ) ) ( not ( = ?auto_23718 ?auto_23721 ) ) ( not ( = ?auto_23720 ?auto_23734 ) ) ( not ( = ?auto_23720 ?auto_23733 ) ) ( not ( = ?auto_23720 ?auto_23735 ) ) ( not ( = ?auto_23722 ?auto_23728 ) ) ( not ( = ?auto_23722 ?auto_23727 ) ) ( not ( = ?auto_23722 ?auto_23729 ) ) ( not ( = ?auto_23725 ?auto_23731 ) ) ( not ( = ?auto_23725 ?auto_23732 ) ) ( not ( = ?auto_23725 ?auto_23730 ) ) ( not ( = ?auto_23721 ?auto_23734 ) ) ( not ( = ?auto_23721 ?auto_23733 ) ) ( not ( = ?auto_23721 ?auto_23735 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_23716 ?auto_23717 ?auto_23718 ?auto_23719 )
      ( MAKE-1CRATE ?auto_23719 ?auto_23720 )
      ( MAKE-4CRATE-VERIFY ?auto_23716 ?auto_23717 ?auto_23718 ?auto_23719 ?auto_23720 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23738 - SURFACE
      ?auto_23739 - SURFACE
    )
    :vars
    (
      ?auto_23740 - HOIST
      ?auto_23741 - PLACE
      ?auto_23743 - PLACE
      ?auto_23744 - HOIST
      ?auto_23745 - SURFACE
      ?auto_23742 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23740 ?auto_23741 ) ( SURFACE-AT ?auto_23738 ?auto_23741 ) ( CLEAR ?auto_23738 ) ( IS-CRATE ?auto_23739 ) ( AVAILABLE ?auto_23740 ) ( not ( = ?auto_23743 ?auto_23741 ) ) ( HOIST-AT ?auto_23744 ?auto_23743 ) ( AVAILABLE ?auto_23744 ) ( SURFACE-AT ?auto_23739 ?auto_23743 ) ( ON ?auto_23739 ?auto_23745 ) ( CLEAR ?auto_23739 ) ( TRUCK-AT ?auto_23742 ?auto_23741 ) ( not ( = ?auto_23738 ?auto_23739 ) ) ( not ( = ?auto_23738 ?auto_23745 ) ) ( not ( = ?auto_23739 ?auto_23745 ) ) ( not ( = ?auto_23740 ?auto_23744 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23742 ?auto_23741 ?auto_23743 )
      ( !LIFT ?auto_23744 ?auto_23739 ?auto_23745 ?auto_23743 )
      ( !LOAD ?auto_23744 ?auto_23739 ?auto_23742 ?auto_23743 )
      ( !DRIVE ?auto_23742 ?auto_23743 ?auto_23741 )
      ( !UNLOAD ?auto_23740 ?auto_23739 ?auto_23742 ?auto_23741 )
      ( !DROP ?auto_23740 ?auto_23739 ?auto_23738 ?auto_23741 )
      ( MAKE-1CRATE-VERIFY ?auto_23738 ?auto_23739 ) )
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
      ?auto_23762 - HOIST
      ?auto_23760 - PLACE
      ?auto_23761 - PLACE
      ?auto_23763 - HOIST
      ?auto_23759 - SURFACE
      ?auto_23772 - PLACE
      ?auto_23766 - HOIST
      ?auto_23770 - SURFACE
      ?auto_23771 - SURFACE
      ?auto_23764 - PLACE
      ?auto_23773 - HOIST
      ?auto_23765 - SURFACE
      ?auto_23768 - PLACE
      ?auto_23769 - HOIST
      ?auto_23767 - SURFACE
      ?auto_23758 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23762 ?auto_23760 ) ( IS-CRATE ?auto_23757 ) ( not ( = ?auto_23761 ?auto_23760 ) ) ( HOIST-AT ?auto_23763 ?auto_23761 ) ( SURFACE-AT ?auto_23757 ?auto_23761 ) ( ON ?auto_23757 ?auto_23759 ) ( CLEAR ?auto_23757 ) ( not ( = ?auto_23756 ?auto_23757 ) ) ( not ( = ?auto_23756 ?auto_23759 ) ) ( not ( = ?auto_23757 ?auto_23759 ) ) ( not ( = ?auto_23762 ?auto_23763 ) ) ( IS-CRATE ?auto_23756 ) ( not ( = ?auto_23772 ?auto_23760 ) ) ( HOIST-AT ?auto_23766 ?auto_23772 ) ( AVAILABLE ?auto_23766 ) ( SURFACE-AT ?auto_23756 ?auto_23772 ) ( ON ?auto_23756 ?auto_23770 ) ( CLEAR ?auto_23756 ) ( not ( = ?auto_23755 ?auto_23756 ) ) ( not ( = ?auto_23755 ?auto_23770 ) ) ( not ( = ?auto_23756 ?auto_23770 ) ) ( not ( = ?auto_23762 ?auto_23766 ) ) ( IS-CRATE ?auto_23755 ) ( AVAILABLE ?auto_23763 ) ( SURFACE-AT ?auto_23755 ?auto_23761 ) ( ON ?auto_23755 ?auto_23771 ) ( CLEAR ?auto_23755 ) ( not ( = ?auto_23754 ?auto_23755 ) ) ( not ( = ?auto_23754 ?auto_23771 ) ) ( not ( = ?auto_23755 ?auto_23771 ) ) ( IS-CRATE ?auto_23754 ) ( not ( = ?auto_23764 ?auto_23760 ) ) ( HOIST-AT ?auto_23773 ?auto_23764 ) ( AVAILABLE ?auto_23773 ) ( SURFACE-AT ?auto_23754 ?auto_23764 ) ( ON ?auto_23754 ?auto_23765 ) ( CLEAR ?auto_23754 ) ( not ( = ?auto_23753 ?auto_23754 ) ) ( not ( = ?auto_23753 ?auto_23765 ) ) ( not ( = ?auto_23754 ?auto_23765 ) ) ( not ( = ?auto_23762 ?auto_23773 ) ) ( SURFACE-AT ?auto_23752 ?auto_23760 ) ( CLEAR ?auto_23752 ) ( IS-CRATE ?auto_23753 ) ( AVAILABLE ?auto_23762 ) ( not ( = ?auto_23768 ?auto_23760 ) ) ( HOIST-AT ?auto_23769 ?auto_23768 ) ( AVAILABLE ?auto_23769 ) ( SURFACE-AT ?auto_23753 ?auto_23768 ) ( ON ?auto_23753 ?auto_23767 ) ( CLEAR ?auto_23753 ) ( TRUCK-AT ?auto_23758 ?auto_23760 ) ( not ( = ?auto_23752 ?auto_23753 ) ) ( not ( = ?auto_23752 ?auto_23767 ) ) ( not ( = ?auto_23753 ?auto_23767 ) ) ( not ( = ?auto_23762 ?auto_23769 ) ) ( not ( = ?auto_23752 ?auto_23754 ) ) ( not ( = ?auto_23752 ?auto_23765 ) ) ( not ( = ?auto_23754 ?auto_23767 ) ) ( not ( = ?auto_23764 ?auto_23768 ) ) ( not ( = ?auto_23773 ?auto_23769 ) ) ( not ( = ?auto_23765 ?auto_23767 ) ) ( not ( = ?auto_23752 ?auto_23755 ) ) ( not ( = ?auto_23752 ?auto_23771 ) ) ( not ( = ?auto_23753 ?auto_23755 ) ) ( not ( = ?auto_23753 ?auto_23771 ) ) ( not ( = ?auto_23755 ?auto_23765 ) ) ( not ( = ?auto_23755 ?auto_23767 ) ) ( not ( = ?auto_23761 ?auto_23764 ) ) ( not ( = ?auto_23761 ?auto_23768 ) ) ( not ( = ?auto_23763 ?auto_23773 ) ) ( not ( = ?auto_23763 ?auto_23769 ) ) ( not ( = ?auto_23771 ?auto_23765 ) ) ( not ( = ?auto_23771 ?auto_23767 ) ) ( not ( = ?auto_23752 ?auto_23756 ) ) ( not ( = ?auto_23752 ?auto_23770 ) ) ( not ( = ?auto_23753 ?auto_23756 ) ) ( not ( = ?auto_23753 ?auto_23770 ) ) ( not ( = ?auto_23754 ?auto_23756 ) ) ( not ( = ?auto_23754 ?auto_23770 ) ) ( not ( = ?auto_23756 ?auto_23771 ) ) ( not ( = ?auto_23756 ?auto_23765 ) ) ( not ( = ?auto_23756 ?auto_23767 ) ) ( not ( = ?auto_23772 ?auto_23761 ) ) ( not ( = ?auto_23772 ?auto_23764 ) ) ( not ( = ?auto_23772 ?auto_23768 ) ) ( not ( = ?auto_23766 ?auto_23763 ) ) ( not ( = ?auto_23766 ?auto_23773 ) ) ( not ( = ?auto_23766 ?auto_23769 ) ) ( not ( = ?auto_23770 ?auto_23771 ) ) ( not ( = ?auto_23770 ?auto_23765 ) ) ( not ( = ?auto_23770 ?auto_23767 ) ) ( not ( = ?auto_23752 ?auto_23757 ) ) ( not ( = ?auto_23752 ?auto_23759 ) ) ( not ( = ?auto_23753 ?auto_23757 ) ) ( not ( = ?auto_23753 ?auto_23759 ) ) ( not ( = ?auto_23754 ?auto_23757 ) ) ( not ( = ?auto_23754 ?auto_23759 ) ) ( not ( = ?auto_23755 ?auto_23757 ) ) ( not ( = ?auto_23755 ?auto_23759 ) ) ( not ( = ?auto_23757 ?auto_23770 ) ) ( not ( = ?auto_23757 ?auto_23771 ) ) ( not ( = ?auto_23757 ?auto_23765 ) ) ( not ( = ?auto_23757 ?auto_23767 ) ) ( not ( = ?auto_23759 ?auto_23770 ) ) ( not ( = ?auto_23759 ?auto_23771 ) ) ( not ( = ?auto_23759 ?auto_23765 ) ) ( not ( = ?auto_23759 ?auto_23767 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_23752 ?auto_23753 ?auto_23754 ?auto_23755 ?auto_23756 )
      ( MAKE-1CRATE ?auto_23756 ?auto_23757 )
      ( MAKE-5CRATE-VERIFY ?auto_23752 ?auto_23753 ?auto_23754 ?auto_23755 ?auto_23756 ?auto_23757 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23776 - SURFACE
      ?auto_23777 - SURFACE
    )
    :vars
    (
      ?auto_23778 - HOIST
      ?auto_23779 - PLACE
      ?auto_23781 - PLACE
      ?auto_23782 - HOIST
      ?auto_23783 - SURFACE
      ?auto_23780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23778 ?auto_23779 ) ( SURFACE-AT ?auto_23776 ?auto_23779 ) ( CLEAR ?auto_23776 ) ( IS-CRATE ?auto_23777 ) ( AVAILABLE ?auto_23778 ) ( not ( = ?auto_23781 ?auto_23779 ) ) ( HOIST-AT ?auto_23782 ?auto_23781 ) ( AVAILABLE ?auto_23782 ) ( SURFACE-AT ?auto_23777 ?auto_23781 ) ( ON ?auto_23777 ?auto_23783 ) ( CLEAR ?auto_23777 ) ( TRUCK-AT ?auto_23780 ?auto_23779 ) ( not ( = ?auto_23776 ?auto_23777 ) ) ( not ( = ?auto_23776 ?auto_23783 ) ) ( not ( = ?auto_23777 ?auto_23783 ) ) ( not ( = ?auto_23778 ?auto_23782 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23780 ?auto_23779 ?auto_23781 )
      ( !LIFT ?auto_23782 ?auto_23777 ?auto_23783 ?auto_23781 )
      ( !LOAD ?auto_23782 ?auto_23777 ?auto_23780 ?auto_23781 )
      ( !DRIVE ?auto_23780 ?auto_23781 ?auto_23779 )
      ( !UNLOAD ?auto_23778 ?auto_23777 ?auto_23780 ?auto_23779 )
      ( !DROP ?auto_23778 ?auto_23777 ?auto_23776 ?auto_23779 )
      ( MAKE-1CRATE-VERIFY ?auto_23776 ?auto_23777 ) )
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
      ?auto_23800 - HOIST
      ?auto_23802 - PLACE
      ?auto_23798 - PLACE
      ?auto_23801 - HOIST
      ?auto_23803 - SURFACE
      ?auto_23808 - PLACE
      ?auto_23809 - HOIST
      ?auto_23810 - SURFACE
      ?auto_23804 - PLACE
      ?auto_23814 - HOIST
      ?auto_23806 - SURFACE
      ?auto_23813 - SURFACE
      ?auto_23811 - PLACE
      ?auto_23805 - HOIST
      ?auto_23816 - SURFACE
      ?auto_23807 - PLACE
      ?auto_23815 - HOIST
      ?auto_23812 - SURFACE
      ?auto_23799 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23800 ?auto_23802 ) ( IS-CRATE ?auto_23797 ) ( not ( = ?auto_23798 ?auto_23802 ) ) ( HOIST-AT ?auto_23801 ?auto_23798 ) ( AVAILABLE ?auto_23801 ) ( SURFACE-AT ?auto_23797 ?auto_23798 ) ( ON ?auto_23797 ?auto_23803 ) ( CLEAR ?auto_23797 ) ( not ( = ?auto_23796 ?auto_23797 ) ) ( not ( = ?auto_23796 ?auto_23803 ) ) ( not ( = ?auto_23797 ?auto_23803 ) ) ( not ( = ?auto_23800 ?auto_23801 ) ) ( IS-CRATE ?auto_23796 ) ( not ( = ?auto_23808 ?auto_23802 ) ) ( HOIST-AT ?auto_23809 ?auto_23808 ) ( SURFACE-AT ?auto_23796 ?auto_23808 ) ( ON ?auto_23796 ?auto_23810 ) ( CLEAR ?auto_23796 ) ( not ( = ?auto_23795 ?auto_23796 ) ) ( not ( = ?auto_23795 ?auto_23810 ) ) ( not ( = ?auto_23796 ?auto_23810 ) ) ( not ( = ?auto_23800 ?auto_23809 ) ) ( IS-CRATE ?auto_23795 ) ( not ( = ?auto_23804 ?auto_23802 ) ) ( HOIST-AT ?auto_23814 ?auto_23804 ) ( AVAILABLE ?auto_23814 ) ( SURFACE-AT ?auto_23795 ?auto_23804 ) ( ON ?auto_23795 ?auto_23806 ) ( CLEAR ?auto_23795 ) ( not ( = ?auto_23794 ?auto_23795 ) ) ( not ( = ?auto_23794 ?auto_23806 ) ) ( not ( = ?auto_23795 ?auto_23806 ) ) ( not ( = ?auto_23800 ?auto_23814 ) ) ( IS-CRATE ?auto_23794 ) ( AVAILABLE ?auto_23809 ) ( SURFACE-AT ?auto_23794 ?auto_23808 ) ( ON ?auto_23794 ?auto_23813 ) ( CLEAR ?auto_23794 ) ( not ( = ?auto_23793 ?auto_23794 ) ) ( not ( = ?auto_23793 ?auto_23813 ) ) ( not ( = ?auto_23794 ?auto_23813 ) ) ( IS-CRATE ?auto_23793 ) ( not ( = ?auto_23811 ?auto_23802 ) ) ( HOIST-AT ?auto_23805 ?auto_23811 ) ( AVAILABLE ?auto_23805 ) ( SURFACE-AT ?auto_23793 ?auto_23811 ) ( ON ?auto_23793 ?auto_23816 ) ( CLEAR ?auto_23793 ) ( not ( = ?auto_23792 ?auto_23793 ) ) ( not ( = ?auto_23792 ?auto_23816 ) ) ( not ( = ?auto_23793 ?auto_23816 ) ) ( not ( = ?auto_23800 ?auto_23805 ) ) ( SURFACE-AT ?auto_23791 ?auto_23802 ) ( CLEAR ?auto_23791 ) ( IS-CRATE ?auto_23792 ) ( AVAILABLE ?auto_23800 ) ( not ( = ?auto_23807 ?auto_23802 ) ) ( HOIST-AT ?auto_23815 ?auto_23807 ) ( AVAILABLE ?auto_23815 ) ( SURFACE-AT ?auto_23792 ?auto_23807 ) ( ON ?auto_23792 ?auto_23812 ) ( CLEAR ?auto_23792 ) ( TRUCK-AT ?auto_23799 ?auto_23802 ) ( not ( = ?auto_23791 ?auto_23792 ) ) ( not ( = ?auto_23791 ?auto_23812 ) ) ( not ( = ?auto_23792 ?auto_23812 ) ) ( not ( = ?auto_23800 ?auto_23815 ) ) ( not ( = ?auto_23791 ?auto_23793 ) ) ( not ( = ?auto_23791 ?auto_23816 ) ) ( not ( = ?auto_23793 ?auto_23812 ) ) ( not ( = ?auto_23811 ?auto_23807 ) ) ( not ( = ?auto_23805 ?auto_23815 ) ) ( not ( = ?auto_23816 ?auto_23812 ) ) ( not ( = ?auto_23791 ?auto_23794 ) ) ( not ( = ?auto_23791 ?auto_23813 ) ) ( not ( = ?auto_23792 ?auto_23794 ) ) ( not ( = ?auto_23792 ?auto_23813 ) ) ( not ( = ?auto_23794 ?auto_23816 ) ) ( not ( = ?auto_23794 ?auto_23812 ) ) ( not ( = ?auto_23808 ?auto_23811 ) ) ( not ( = ?auto_23808 ?auto_23807 ) ) ( not ( = ?auto_23809 ?auto_23805 ) ) ( not ( = ?auto_23809 ?auto_23815 ) ) ( not ( = ?auto_23813 ?auto_23816 ) ) ( not ( = ?auto_23813 ?auto_23812 ) ) ( not ( = ?auto_23791 ?auto_23795 ) ) ( not ( = ?auto_23791 ?auto_23806 ) ) ( not ( = ?auto_23792 ?auto_23795 ) ) ( not ( = ?auto_23792 ?auto_23806 ) ) ( not ( = ?auto_23793 ?auto_23795 ) ) ( not ( = ?auto_23793 ?auto_23806 ) ) ( not ( = ?auto_23795 ?auto_23813 ) ) ( not ( = ?auto_23795 ?auto_23816 ) ) ( not ( = ?auto_23795 ?auto_23812 ) ) ( not ( = ?auto_23804 ?auto_23808 ) ) ( not ( = ?auto_23804 ?auto_23811 ) ) ( not ( = ?auto_23804 ?auto_23807 ) ) ( not ( = ?auto_23814 ?auto_23809 ) ) ( not ( = ?auto_23814 ?auto_23805 ) ) ( not ( = ?auto_23814 ?auto_23815 ) ) ( not ( = ?auto_23806 ?auto_23813 ) ) ( not ( = ?auto_23806 ?auto_23816 ) ) ( not ( = ?auto_23806 ?auto_23812 ) ) ( not ( = ?auto_23791 ?auto_23796 ) ) ( not ( = ?auto_23791 ?auto_23810 ) ) ( not ( = ?auto_23792 ?auto_23796 ) ) ( not ( = ?auto_23792 ?auto_23810 ) ) ( not ( = ?auto_23793 ?auto_23796 ) ) ( not ( = ?auto_23793 ?auto_23810 ) ) ( not ( = ?auto_23794 ?auto_23796 ) ) ( not ( = ?auto_23794 ?auto_23810 ) ) ( not ( = ?auto_23796 ?auto_23806 ) ) ( not ( = ?auto_23796 ?auto_23813 ) ) ( not ( = ?auto_23796 ?auto_23816 ) ) ( not ( = ?auto_23796 ?auto_23812 ) ) ( not ( = ?auto_23810 ?auto_23806 ) ) ( not ( = ?auto_23810 ?auto_23813 ) ) ( not ( = ?auto_23810 ?auto_23816 ) ) ( not ( = ?auto_23810 ?auto_23812 ) ) ( not ( = ?auto_23791 ?auto_23797 ) ) ( not ( = ?auto_23791 ?auto_23803 ) ) ( not ( = ?auto_23792 ?auto_23797 ) ) ( not ( = ?auto_23792 ?auto_23803 ) ) ( not ( = ?auto_23793 ?auto_23797 ) ) ( not ( = ?auto_23793 ?auto_23803 ) ) ( not ( = ?auto_23794 ?auto_23797 ) ) ( not ( = ?auto_23794 ?auto_23803 ) ) ( not ( = ?auto_23795 ?auto_23797 ) ) ( not ( = ?auto_23795 ?auto_23803 ) ) ( not ( = ?auto_23797 ?auto_23810 ) ) ( not ( = ?auto_23797 ?auto_23806 ) ) ( not ( = ?auto_23797 ?auto_23813 ) ) ( not ( = ?auto_23797 ?auto_23816 ) ) ( not ( = ?auto_23797 ?auto_23812 ) ) ( not ( = ?auto_23798 ?auto_23808 ) ) ( not ( = ?auto_23798 ?auto_23804 ) ) ( not ( = ?auto_23798 ?auto_23811 ) ) ( not ( = ?auto_23798 ?auto_23807 ) ) ( not ( = ?auto_23801 ?auto_23809 ) ) ( not ( = ?auto_23801 ?auto_23814 ) ) ( not ( = ?auto_23801 ?auto_23805 ) ) ( not ( = ?auto_23801 ?auto_23815 ) ) ( not ( = ?auto_23803 ?auto_23810 ) ) ( not ( = ?auto_23803 ?auto_23806 ) ) ( not ( = ?auto_23803 ?auto_23813 ) ) ( not ( = ?auto_23803 ?auto_23816 ) ) ( not ( = ?auto_23803 ?auto_23812 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_23791 ?auto_23792 ?auto_23793 ?auto_23794 ?auto_23795 ?auto_23796 )
      ( MAKE-1CRATE ?auto_23796 ?auto_23797 )
      ( MAKE-6CRATE-VERIFY ?auto_23791 ?auto_23792 ?auto_23793 ?auto_23794 ?auto_23795 ?auto_23796 ?auto_23797 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23819 - SURFACE
      ?auto_23820 - SURFACE
    )
    :vars
    (
      ?auto_23821 - HOIST
      ?auto_23822 - PLACE
      ?auto_23824 - PLACE
      ?auto_23825 - HOIST
      ?auto_23826 - SURFACE
      ?auto_23823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23821 ?auto_23822 ) ( SURFACE-AT ?auto_23819 ?auto_23822 ) ( CLEAR ?auto_23819 ) ( IS-CRATE ?auto_23820 ) ( AVAILABLE ?auto_23821 ) ( not ( = ?auto_23824 ?auto_23822 ) ) ( HOIST-AT ?auto_23825 ?auto_23824 ) ( AVAILABLE ?auto_23825 ) ( SURFACE-AT ?auto_23820 ?auto_23824 ) ( ON ?auto_23820 ?auto_23826 ) ( CLEAR ?auto_23820 ) ( TRUCK-AT ?auto_23823 ?auto_23822 ) ( not ( = ?auto_23819 ?auto_23820 ) ) ( not ( = ?auto_23819 ?auto_23826 ) ) ( not ( = ?auto_23820 ?auto_23826 ) ) ( not ( = ?auto_23821 ?auto_23825 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23823 ?auto_23822 ?auto_23824 )
      ( !LIFT ?auto_23825 ?auto_23820 ?auto_23826 ?auto_23824 )
      ( !LOAD ?auto_23825 ?auto_23820 ?auto_23823 ?auto_23824 )
      ( !DRIVE ?auto_23823 ?auto_23824 ?auto_23822 )
      ( !UNLOAD ?auto_23821 ?auto_23820 ?auto_23823 ?auto_23822 )
      ( !DROP ?auto_23821 ?auto_23820 ?auto_23819 ?auto_23822 )
      ( MAKE-1CRATE-VERIFY ?auto_23819 ?auto_23820 ) )
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
      ?auto_23842 - SURFACE
      ?auto_23841 - SURFACE
    )
    :vars
    (
      ?auto_23845 - HOIST
      ?auto_23843 - PLACE
      ?auto_23846 - PLACE
      ?auto_23847 - HOIST
      ?auto_23848 - SURFACE
      ?auto_23861 - PLACE
      ?auto_23857 - HOIST
      ?auto_23860 - SURFACE
      ?auto_23855 - PLACE
      ?auto_23854 - HOIST
      ?auto_23853 - SURFACE
      ?auto_23849 - PLACE
      ?auto_23859 - HOIST
      ?auto_23856 - SURFACE
      ?auto_23850 - SURFACE
      ?auto_23852 - SURFACE
      ?auto_23862 - PLACE
      ?auto_23851 - HOIST
      ?auto_23858 - SURFACE
      ?auto_23844 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23845 ?auto_23843 ) ( IS-CRATE ?auto_23841 ) ( not ( = ?auto_23846 ?auto_23843 ) ) ( HOIST-AT ?auto_23847 ?auto_23846 ) ( SURFACE-AT ?auto_23841 ?auto_23846 ) ( ON ?auto_23841 ?auto_23848 ) ( CLEAR ?auto_23841 ) ( not ( = ?auto_23842 ?auto_23841 ) ) ( not ( = ?auto_23842 ?auto_23848 ) ) ( not ( = ?auto_23841 ?auto_23848 ) ) ( not ( = ?auto_23845 ?auto_23847 ) ) ( IS-CRATE ?auto_23842 ) ( not ( = ?auto_23861 ?auto_23843 ) ) ( HOIST-AT ?auto_23857 ?auto_23861 ) ( AVAILABLE ?auto_23857 ) ( SURFACE-AT ?auto_23842 ?auto_23861 ) ( ON ?auto_23842 ?auto_23860 ) ( CLEAR ?auto_23842 ) ( not ( = ?auto_23840 ?auto_23842 ) ) ( not ( = ?auto_23840 ?auto_23860 ) ) ( not ( = ?auto_23842 ?auto_23860 ) ) ( not ( = ?auto_23845 ?auto_23857 ) ) ( IS-CRATE ?auto_23840 ) ( not ( = ?auto_23855 ?auto_23843 ) ) ( HOIST-AT ?auto_23854 ?auto_23855 ) ( SURFACE-AT ?auto_23840 ?auto_23855 ) ( ON ?auto_23840 ?auto_23853 ) ( CLEAR ?auto_23840 ) ( not ( = ?auto_23839 ?auto_23840 ) ) ( not ( = ?auto_23839 ?auto_23853 ) ) ( not ( = ?auto_23840 ?auto_23853 ) ) ( not ( = ?auto_23845 ?auto_23854 ) ) ( IS-CRATE ?auto_23839 ) ( not ( = ?auto_23849 ?auto_23843 ) ) ( HOIST-AT ?auto_23859 ?auto_23849 ) ( AVAILABLE ?auto_23859 ) ( SURFACE-AT ?auto_23839 ?auto_23849 ) ( ON ?auto_23839 ?auto_23856 ) ( CLEAR ?auto_23839 ) ( not ( = ?auto_23838 ?auto_23839 ) ) ( not ( = ?auto_23838 ?auto_23856 ) ) ( not ( = ?auto_23839 ?auto_23856 ) ) ( not ( = ?auto_23845 ?auto_23859 ) ) ( IS-CRATE ?auto_23838 ) ( AVAILABLE ?auto_23854 ) ( SURFACE-AT ?auto_23838 ?auto_23855 ) ( ON ?auto_23838 ?auto_23850 ) ( CLEAR ?auto_23838 ) ( not ( = ?auto_23837 ?auto_23838 ) ) ( not ( = ?auto_23837 ?auto_23850 ) ) ( not ( = ?auto_23838 ?auto_23850 ) ) ( IS-CRATE ?auto_23837 ) ( AVAILABLE ?auto_23847 ) ( SURFACE-AT ?auto_23837 ?auto_23846 ) ( ON ?auto_23837 ?auto_23852 ) ( CLEAR ?auto_23837 ) ( not ( = ?auto_23836 ?auto_23837 ) ) ( not ( = ?auto_23836 ?auto_23852 ) ) ( not ( = ?auto_23837 ?auto_23852 ) ) ( SURFACE-AT ?auto_23835 ?auto_23843 ) ( CLEAR ?auto_23835 ) ( IS-CRATE ?auto_23836 ) ( AVAILABLE ?auto_23845 ) ( not ( = ?auto_23862 ?auto_23843 ) ) ( HOIST-AT ?auto_23851 ?auto_23862 ) ( AVAILABLE ?auto_23851 ) ( SURFACE-AT ?auto_23836 ?auto_23862 ) ( ON ?auto_23836 ?auto_23858 ) ( CLEAR ?auto_23836 ) ( TRUCK-AT ?auto_23844 ?auto_23843 ) ( not ( = ?auto_23835 ?auto_23836 ) ) ( not ( = ?auto_23835 ?auto_23858 ) ) ( not ( = ?auto_23836 ?auto_23858 ) ) ( not ( = ?auto_23845 ?auto_23851 ) ) ( not ( = ?auto_23835 ?auto_23837 ) ) ( not ( = ?auto_23835 ?auto_23852 ) ) ( not ( = ?auto_23837 ?auto_23858 ) ) ( not ( = ?auto_23846 ?auto_23862 ) ) ( not ( = ?auto_23847 ?auto_23851 ) ) ( not ( = ?auto_23852 ?auto_23858 ) ) ( not ( = ?auto_23835 ?auto_23838 ) ) ( not ( = ?auto_23835 ?auto_23850 ) ) ( not ( = ?auto_23836 ?auto_23838 ) ) ( not ( = ?auto_23836 ?auto_23850 ) ) ( not ( = ?auto_23838 ?auto_23852 ) ) ( not ( = ?auto_23838 ?auto_23858 ) ) ( not ( = ?auto_23855 ?auto_23846 ) ) ( not ( = ?auto_23855 ?auto_23862 ) ) ( not ( = ?auto_23854 ?auto_23847 ) ) ( not ( = ?auto_23854 ?auto_23851 ) ) ( not ( = ?auto_23850 ?auto_23852 ) ) ( not ( = ?auto_23850 ?auto_23858 ) ) ( not ( = ?auto_23835 ?auto_23839 ) ) ( not ( = ?auto_23835 ?auto_23856 ) ) ( not ( = ?auto_23836 ?auto_23839 ) ) ( not ( = ?auto_23836 ?auto_23856 ) ) ( not ( = ?auto_23837 ?auto_23839 ) ) ( not ( = ?auto_23837 ?auto_23856 ) ) ( not ( = ?auto_23839 ?auto_23850 ) ) ( not ( = ?auto_23839 ?auto_23852 ) ) ( not ( = ?auto_23839 ?auto_23858 ) ) ( not ( = ?auto_23849 ?auto_23855 ) ) ( not ( = ?auto_23849 ?auto_23846 ) ) ( not ( = ?auto_23849 ?auto_23862 ) ) ( not ( = ?auto_23859 ?auto_23854 ) ) ( not ( = ?auto_23859 ?auto_23847 ) ) ( not ( = ?auto_23859 ?auto_23851 ) ) ( not ( = ?auto_23856 ?auto_23850 ) ) ( not ( = ?auto_23856 ?auto_23852 ) ) ( not ( = ?auto_23856 ?auto_23858 ) ) ( not ( = ?auto_23835 ?auto_23840 ) ) ( not ( = ?auto_23835 ?auto_23853 ) ) ( not ( = ?auto_23836 ?auto_23840 ) ) ( not ( = ?auto_23836 ?auto_23853 ) ) ( not ( = ?auto_23837 ?auto_23840 ) ) ( not ( = ?auto_23837 ?auto_23853 ) ) ( not ( = ?auto_23838 ?auto_23840 ) ) ( not ( = ?auto_23838 ?auto_23853 ) ) ( not ( = ?auto_23840 ?auto_23856 ) ) ( not ( = ?auto_23840 ?auto_23850 ) ) ( not ( = ?auto_23840 ?auto_23852 ) ) ( not ( = ?auto_23840 ?auto_23858 ) ) ( not ( = ?auto_23853 ?auto_23856 ) ) ( not ( = ?auto_23853 ?auto_23850 ) ) ( not ( = ?auto_23853 ?auto_23852 ) ) ( not ( = ?auto_23853 ?auto_23858 ) ) ( not ( = ?auto_23835 ?auto_23842 ) ) ( not ( = ?auto_23835 ?auto_23860 ) ) ( not ( = ?auto_23836 ?auto_23842 ) ) ( not ( = ?auto_23836 ?auto_23860 ) ) ( not ( = ?auto_23837 ?auto_23842 ) ) ( not ( = ?auto_23837 ?auto_23860 ) ) ( not ( = ?auto_23838 ?auto_23842 ) ) ( not ( = ?auto_23838 ?auto_23860 ) ) ( not ( = ?auto_23839 ?auto_23842 ) ) ( not ( = ?auto_23839 ?auto_23860 ) ) ( not ( = ?auto_23842 ?auto_23853 ) ) ( not ( = ?auto_23842 ?auto_23856 ) ) ( not ( = ?auto_23842 ?auto_23850 ) ) ( not ( = ?auto_23842 ?auto_23852 ) ) ( not ( = ?auto_23842 ?auto_23858 ) ) ( not ( = ?auto_23861 ?auto_23855 ) ) ( not ( = ?auto_23861 ?auto_23849 ) ) ( not ( = ?auto_23861 ?auto_23846 ) ) ( not ( = ?auto_23861 ?auto_23862 ) ) ( not ( = ?auto_23857 ?auto_23854 ) ) ( not ( = ?auto_23857 ?auto_23859 ) ) ( not ( = ?auto_23857 ?auto_23847 ) ) ( not ( = ?auto_23857 ?auto_23851 ) ) ( not ( = ?auto_23860 ?auto_23853 ) ) ( not ( = ?auto_23860 ?auto_23856 ) ) ( not ( = ?auto_23860 ?auto_23850 ) ) ( not ( = ?auto_23860 ?auto_23852 ) ) ( not ( = ?auto_23860 ?auto_23858 ) ) ( not ( = ?auto_23835 ?auto_23841 ) ) ( not ( = ?auto_23835 ?auto_23848 ) ) ( not ( = ?auto_23836 ?auto_23841 ) ) ( not ( = ?auto_23836 ?auto_23848 ) ) ( not ( = ?auto_23837 ?auto_23841 ) ) ( not ( = ?auto_23837 ?auto_23848 ) ) ( not ( = ?auto_23838 ?auto_23841 ) ) ( not ( = ?auto_23838 ?auto_23848 ) ) ( not ( = ?auto_23839 ?auto_23841 ) ) ( not ( = ?auto_23839 ?auto_23848 ) ) ( not ( = ?auto_23840 ?auto_23841 ) ) ( not ( = ?auto_23840 ?auto_23848 ) ) ( not ( = ?auto_23841 ?auto_23860 ) ) ( not ( = ?auto_23841 ?auto_23853 ) ) ( not ( = ?auto_23841 ?auto_23856 ) ) ( not ( = ?auto_23841 ?auto_23850 ) ) ( not ( = ?auto_23841 ?auto_23852 ) ) ( not ( = ?auto_23841 ?auto_23858 ) ) ( not ( = ?auto_23848 ?auto_23860 ) ) ( not ( = ?auto_23848 ?auto_23853 ) ) ( not ( = ?auto_23848 ?auto_23856 ) ) ( not ( = ?auto_23848 ?auto_23850 ) ) ( not ( = ?auto_23848 ?auto_23852 ) ) ( not ( = ?auto_23848 ?auto_23858 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_23835 ?auto_23836 ?auto_23837 ?auto_23838 ?auto_23839 ?auto_23840 ?auto_23842 )
      ( MAKE-1CRATE ?auto_23842 ?auto_23841 )
      ( MAKE-7CRATE-VERIFY ?auto_23835 ?auto_23836 ?auto_23837 ?auto_23838 ?auto_23839 ?auto_23840 ?auto_23842 ?auto_23841 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23865 - SURFACE
      ?auto_23866 - SURFACE
    )
    :vars
    (
      ?auto_23867 - HOIST
      ?auto_23868 - PLACE
      ?auto_23870 - PLACE
      ?auto_23871 - HOIST
      ?auto_23872 - SURFACE
      ?auto_23869 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23867 ?auto_23868 ) ( SURFACE-AT ?auto_23865 ?auto_23868 ) ( CLEAR ?auto_23865 ) ( IS-CRATE ?auto_23866 ) ( AVAILABLE ?auto_23867 ) ( not ( = ?auto_23870 ?auto_23868 ) ) ( HOIST-AT ?auto_23871 ?auto_23870 ) ( AVAILABLE ?auto_23871 ) ( SURFACE-AT ?auto_23866 ?auto_23870 ) ( ON ?auto_23866 ?auto_23872 ) ( CLEAR ?auto_23866 ) ( TRUCK-AT ?auto_23869 ?auto_23868 ) ( not ( = ?auto_23865 ?auto_23866 ) ) ( not ( = ?auto_23865 ?auto_23872 ) ) ( not ( = ?auto_23866 ?auto_23872 ) ) ( not ( = ?auto_23867 ?auto_23871 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23869 ?auto_23868 ?auto_23870 )
      ( !LIFT ?auto_23871 ?auto_23866 ?auto_23872 ?auto_23870 )
      ( !LOAD ?auto_23871 ?auto_23866 ?auto_23869 ?auto_23870 )
      ( !DRIVE ?auto_23869 ?auto_23870 ?auto_23868 )
      ( !UNLOAD ?auto_23867 ?auto_23866 ?auto_23869 ?auto_23868 )
      ( !DROP ?auto_23867 ?auto_23866 ?auto_23865 ?auto_23868 )
      ( MAKE-1CRATE-VERIFY ?auto_23865 ?auto_23866 ) )
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
      ?auto_23890 - SURFACE
      ?auto_23889 - SURFACE
      ?auto_23888 - SURFACE
    )
    :vars
    (
      ?auto_23894 - HOIST
      ?auto_23896 - PLACE
      ?auto_23892 - PLACE
      ?auto_23893 - HOIST
      ?auto_23891 - SURFACE
      ?auto_23899 - PLACE
      ?auto_23908 - HOIST
      ?auto_23898 - SURFACE
      ?auto_23902 - SURFACE
      ?auto_23905 - PLACE
      ?auto_23906 - HOIST
      ?auto_23907 - SURFACE
      ?auto_23910 - PLACE
      ?auto_23901 - HOIST
      ?auto_23904 - SURFACE
      ?auto_23909 - SURFACE
      ?auto_23900 - SURFACE
      ?auto_23903 - PLACE
      ?auto_23911 - HOIST
      ?auto_23897 - SURFACE
      ?auto_23895 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23894 ?auto_23896 ) ( IS-CRATE ?auto_23888 ) ( not ( = ?auto_23892 ?auto_23896 ) ) ( HOIST-AT ?auto_23893 ?auto_23892 ) ( SURFACE-AT ?auto_23888 ?auto_23892 ) ( ON ?auto_23888 ?auto_23891 ) ( CLEAR ?auto_23888 ) ( not ( = ?auto_23889 ?auto_23888 ) ) ( not ( = ?auto_23889 ?auto_23891 ) ) ( not ( = ?auto_23888 ?auto_23891 ) ) ( not ( = ?auto_23894 ?auto_23893 ) ) ( IS-CRATE ?auto_23889 ) ( not ( = ?auto_23899 ?auto_23896 ) ) ( HOIST-AT ?auto_23908 ?auto_23899 ) ( SURFACE-AT ?auto_23889 ?auto_23899 ) ( ON ?auto_23889 ?auto_23898 ) ( CLEAR ?auto_23889 ) ( not ( = ?auto_23890 ?auto_23889 ) ) ( not ( = ?auto_23890 ?auto_23898 ) ) ( not ( = ?auto_23889 ?auto_23898 ) ) ( not ( = ?auto_23894 ?auto_23908 ) ) ( IS-CRATE ?auto_23890 ) ( AVAILABLE ?auto_23893 ) ( SURFACE-AT ?auto_23890 ?auto_23892 ) ( ON ?auto_23890 ?auto_23902 ) ( CLEAR ?auto_23890 ) ( not ( = ?auto_23887 ?auto_23890 ) ) ( not ( = ?auto_23887 ?auto_23902 ) ) ( not ( = ?auto_23890 ?auto_23902 ) ) ( IS-CRATE ?auto_23887 ) ( not ( = ?auto_23905 ?auto_23896 ) ) ( HOIST-AT ?auto_23906 ?auto_23905 ) ( SURFACE-AT ?auto_23887 ?auto_23905 ) ( ON ?auto_23887 ?auto_23907 ) ( CLEAR ?auto_23887 ) ( not ( = ?auto_23886 ?auto_23887 ) ) ( not ( = ?auto_23886 ?auto_23907 ) ) ( not ( = ?auto_23887 ?auto_23907 ) ) ( not ( = ?auto_23894 ?auto_23906 ) ) ( IS-CRATE ?auto_23886 ) ( not ( = ?auto_23910 ?auto_23896 ) ) ( HOIST-AT ?auto_23901 ?auto_23910 ) ( AVAILABLE ?auto_23901 ) ( SURFACE-AT ?auto_23886 ?auto_23910 ) ( ON ?auto_23886 ?auto_23904 ) ( CLEAR ?auto_23886 ) ( not ( = ?auto_23885 ?auto_23886 ) ) ( not ( = ?auto_23885 ?auto_23904 ) ) ( not ( = ?auto_23886 ?auto_23904 ) ) ( not ( = ?auto_23894 ?auto_23901 ) ) ( IS-CRATE ?auto_23885 ) ( AVAILABLE ?auto_23906 ) ( SURFACE-AT ?auto_23885 ?auto_23905 ) ( ON ?auto_23885 ?auto_23909 ) ( CLEAR ?auto_23885 ) ( not ( = ?auto_23884 ?auto_23885 ) ) ( not ( = ?auto_23884 ?auto_23909 ) ) ( not ( = ?auto_23885 ?auto_23909 ) ) ( IS-CRATE ?auto_23884 ) ( AVAILABLE ?auto_23908 ) ( SURFACE-AT ?auto_23884 ?auto_23899 ) ( ON ?auto_23884 ?auto_23900 ) ( CLEAR ?auto_23884 ) ( not ( = ?auto_23883 ?auto_23884 ) ) ( not ( = ?auto_23883 ?auto_23900 ) ) ( not ( = ?auto_23884 ?auto_23900 ) ) ( SURFACE-AT ?auto_23882 ?auto_23896 ) ( CLEAR ?auto_23882 ) ( IS-CRATE ?auto_23883 ) ( AVAILABLE ?auto_23894 ) ( not ( = ?auto_23903 ?auto_23896 ) ) ( HOIST-AT ?auto_23911 ?auto_23903 ) ( AVAILABLE ?auto_23911 ) ( SURFACE-AT ?auto_23883 ?auto_23903 ) ( ON ?auto_23883 ?auto_23897 ) ( CLEAR ?auto_23883 ) ( TRUCK-AT ?auto_23895 ?auto_23896 ) ( not ( = ?auto_23882 ?auto_23883 ) ) ( not ( = ?auto_23882 ?auto_23897 ) ) ( not ( = ?auto_23883 ?auto_23897 ) ) ( not ( = ?auto_23894 ?auto_23911 ) ) ( not ( = ?auto_23882 ?auto_23884 ) ) ( not ( = ?auto_23882 ?auto_23900 ) ) ( not ( = ?auto_23884 ?auto_23897 ) ) ( not ( = ?auto_23899 ?auto_23903 ) ) ( not ( = ?auto_23908 ?auto_23911 ) ) ( not ( = ?auto_23900 ?auto_23897 ) ) ( not ( = ?auto_23882 ?auto_23885 ) ) ( not ( = ?auto_23882 ?auto_23909 ) ) ( not ( = ?auto_23883 ?auto_23885 ) ) ( not ( = ?auto_23883 ?auto_23909 ) ) ( not ( = ?auto_23885 ?auto_23900 ) ) ( not ( = ?auto_23885 ?auto_23897 ) ) ( not ( = ?auto_23905 ?auto_23899 ) ) ( not ( = ?auto_23905 ?auto_23903 ) ) ( not ( = ?auto_23906 ?auto_23908 ) ) ( not ( = ?auto_23906 ?auto_23911 ) ) ( not ( = ?auto_23909 ?auto_23900 ) ) ( not ( = ?auto_23909 ?auto_23897 ) ) ( not ( = ?auto_23882 ?auto_23886 ) ) ( not ( = ?auto_23882 ?auto_23904 ) ) ( not ( = ?auto_23883 ?auto_23886 ) ) ( not ( = ?auto_23883 ?auto_23904 ) ) ( not ( = ?auto_23884 ?auto_23886 ) ) ( not ( = ?auto_23884 ?auto_23904 ) ) ( not ( = ?auto_23886 ?auto_23909 ) ) ( not ( = ?auto_23886 ?auto_23900 ) ) ( not ( = ?auto_23886 ?auto_23897 ) ) ( not ( = ?auto_23910 ?auto_23905 ) ) ( not ( = ?auto_23910 ?auto_23899 ) ) ( not ( = ?auto_23910 ?auto_23903 ) ) ( not ( = ?auto_23901 ?auto_23906 ) ) ( not ( = ?auto_23901 ?auto_23908 ) ) ( not ( = ?auto_23901 ?auto_23911 ) ) ( not ( = ?auto_23904 ?auto_23909 ) ) ( not ( = ?auto_23904 ?auto_23900 ) ) ( not ( = ?auto_23904 ?auto_23897 ) ) ( not ( = ?auto_23882 ?auto_23887 ) ) ( not ( = ?auto_23882 ?auto_23907 ) ) ( not ( = ?auto_23883 ?auto_23887 ) ) ( not ( = ?auto_23883 ?auto_23907 ) ) ( not ( = ?auto_23884 ?auto_23887 ) ) ( not ( = ?auto_23884 ?auto_23907 ) ) ( not ( = ?auto_23885 ?auto_23887 ) ) ( not ( = ?auto_23885 ?auto_23907 ) ) ( not ( = ?auto_23887 ?auto_23904 ) ) ( not ( = ?auto_23887 ?auto_23909 ) ) ( not ( = ?auto_23887 ?auto_23900 ) ) ( not ( = ?auto_23887 ?auto_23897 ) ) ( not ( = ?auto_23907 ?auto_23904 ) ) ( not ( = ?auto_23907 ?auto_23909 ) ) ( not ( = ?auto_23907 ?auto_23900 ) ) ( not ( = ?auto_23907 ?auto_23897 ) ) ( not ( = ?auto_23882 ?auto_23890 ) ) ( not ( = ?auto_23882 ?auto_23902 ) ) ( not ( = ?auto_23883 ?auto_23890 ) ) ( not ( = ?auto_23883 ?auto_23902 ) ) ( not ( = ?auto_23884 ?auto_23890 ) ) ( not ( = ?auto_23884 ?auto_23902 ) ) ( not ( = ?auto_23885 ?auto_23890 ) ) ( not ( = ?auto_23885 ?auto_23902 ) ) ( not ( = ?auto_23886 ?auto_23890 ) ) ( not ( = ?auto_23886 ?auto_23902 ) ) ( not ( = ?auto_23890 ?auto_23907 ) ) ( not ( = ?auto_23890 ?auto_23904 ) ) ( not ( = ?auto_23890 ?auto_23909 ) ) ( not ( = ?auto_23890 ?auto_23900 ) ) ( not ( = ?auto_23890 ?auto_23897 ) ) ( not ( = ?auto_23892 ?auto_23905 ) ) ( not ( = ?auto_23892 ?auto_23910 ) ) ( not ( = ?auto_23892 ?auto_23899 ) ) ( not ( = ?auto_23892 ?auto_23903 ) ) ( not ( = ?auto_23893 ?auto_23906 ) ) ( not ( = ?auto_23893 ?auto_23901 ) ) ( not ( = ?auto_23893 ?auto_23908 ) ) ( not ( = ?auto_23893 ?auto_23911 ) ) ( not ( = ?auto_23902 ?auto_23907 ) ) ( not ( = ?auto_23902 ?auto_23904 ) ) ( not ( = ?auto_23902 ?auto_23909 ) ) ( not ( = ?auto_23902 ?auto_23900 ) ) ( not ( = ?auto_23902 ?auto_23897 ) ) ( not ( = ?auto_23882 ?auto_23889 ) ) ( not ( = ?auto_23882 ?auto_23898 ) ) ( not ( = ?auto_23883 ?auto_23889 ) ) ( not ( = ?auto_23883 ?auto_23898 ) ) ( not ( = ?auto_23884 ?auto_23889 ) ) ( not ( = ?auto_23884 ?auto_23898 ) ) ( not ( = ?auto_23885 ?auto_23889 ) ) ( not ( = ?auto_23885 ?auto_23898 ) ) ( not ( = ?auto_23886 ?auto_23889 ) ) ( not ( = ?auto_23886 ?auto_23898 ) ) ( not ( = ?auto_23887 ?auto_23889 ) ) ( not ( = ?auto_23887 ?auto_23898 ) ) ( not ( = ?auto_23889 ?auto_23902 ) ) ( not ( = ?auto_23889 ?auto_23907 ) ) ( not ( = ?auto_23889 ?auto_23904 ) ) ( not ( = ?auto_23889 ?auto_23909 ) ) ( not ( = ?auto_23889 ?auto_23900 ) ) ( not ( = ?auto_23889 ?auto_23897 ) ) ( not ( = ?auto_23898 ?auto_23902 ) ) ( not ( = ?auto_23898 ?auto_23907 ) ) ( not ( = ?auto_23898 ?auto_23904 ) ) ( not ( = ?auto_23898 ?auto_23909 ) ) ( not ( = ?auto_23898 ?auto_23900 ) ) ( not ( = ?auto_23898 ?auto_23897 ) ) ( not ( = ?auto_23882 ?auto_23888 ) ) ( not ( = ?auto_23882 ?auto_23891 ) ) ( not ( = ?auto_23883 ?auto_23888 ) ) ( not ( = ?auto_23883 ?auto_23891 ) ) ( not ( = ?auto_23884 ?auto_23888 ) ) ( not ( = ?auto_23884 ?auto_23891 ) ) ( not ( = ?auto_23885 ?auto_23888 ) ) ( not ( = ?auto_23885 ?auto_23891 ) ) ( not ( = ?auto_23886 ?auto_23888 ) ) ( not ( = ?auto_23886 ?auto_23891 ) ) ( not ( = ?auto_23887 ?auto_23888 ) ) ( not ( = ?auto_23887 ?auto_23891 ) ) ( not ( = ?auto_23890 ?auto_23888 ) ) ( not ( = ?auto_23890 ?auto_23891 ) ) ( not ( = ?auto_23888 ?auto_23898 ) ) ( not ( = ?auto_23888 ?auto_23902 ) ) ( not ( = ?auto_23888 ?auto_23907 ) ) ( not ( = ?auto_23888 ?auto_23904 ) ) ( not ( = ?auto_23888 ?auto_23909 ) ) ( not ( = ?auto_23888 ?auto_23900 ) ) ( not ( = ?auto_23888 ?auto_23897 ) ) ( not ( = ?auto_23891 ?auto_23898 ) ) ( not ( = ?auto_23891 ?auto_23902 ) ) ( not ( = ?auto_23891 ?auto_23907 ) ) ( not ( = ?auto_23891 ?auto_23904 ) ) ( not ( = ?auto_23891 ?auto_23909 ) ) ( not ( = ?auto_23891 ?auto_23900 ) ) ( not ( = ?auto_23891 ?auto_23897 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_23882 ?auto_23883 ?auto_23884 ?auto_23885 ?auto_23886 ?auto_23887 ?auto_23890 ?auto_23889 )
      ( MAKE-1CRATE ?auto_23889 ?auto_23888 )
      ( MAKE-8CRATE-VERIFY ?auto_23882 ?auto_23883 ?auto_23884 ?auto_23885 ?auto_23886 ?auto_23887 ?auto_23890 ?auto_23889 ?auto_23888 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23914 - SURFACE
      ?auto_23915 - SURFACE
    )
    :vars
    (
      ?auto_23916 - HOIST
      ?auto_23917 - PLACE
      ?auto_23919 - PLACE
      ?auto_23920 - HOIST
      ?auto_23921 - SURFACE
      ?auto_23918 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23916 ?auto_23917 ) ( SURFACE-AT ?auto_23914 ?auto_23917 ) ( CLEAR ?auto_23914 ) ( IS-CRATE ?auto_23915 ) ( AVAILABLE ?auto_23916 ) ( not ( = ?auto_23919 ?auto_23917 ) ) ( HOIST-AT ?auto_23920 ?auto_23919 ) ( AVAILABLE ?auto_23920 ) ( SURFACE-AT ?auto_23915 ?auto_23919 ) ( ON ?auto_23915 ?auto_23921 ) ( CLEAR ?auto_23915 ) ( TRUCK-AT ?auto_23918 ?auto_23917 ) ( not ( = ?auto_23914 ?auto_23915 ) ) ( not ( = ?auto_23914 ?auto_23921 ) ) ( not ( = ?auto_23915 ?auto_23921 ) ) ( not ( = ?auto_23916 ?auto_23920 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23918 ?auto_23917 ?auto_23919 )
      ( !LIFT ?auto_23920 ?auto_23915 ?auto_23921 ?auto_23919 )
      ( !LOAD ?auto_23920 ?auto_23915 ?auto_23918 ?auto_23919 )
      ( !DRIVE ?auto_23918 ?auto_23919 ?auto_23917 )
      ( !UNLOAD ?auto_23916 ?auto_23915 ?auto_23918 ?auto_23917 )
      ( !DROP ?auto_23916 ?auto_23915 ?auto_23914 ?auto_23917 )
      ( MAKE-1CRATE-VERIFY ?auto_23914 ?auto_23915 ) )
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
      ?auto_23940 - SURFACE
      ?auto_23939 - SURFACE
      ?auto_23938 - SURFACE
      ?auto_23941 - SURFACE
    )
    :vars
    (
      ?auto_23946 - HOIST
      ?auto_23943 - PLACE
      ?auto_23947 - PLACE
      ?auto_23944 - HOIST
      ?auto_23945 - SURFACE
      ?auto_23958 - PLACE
      ?auto_23948 - HOIST
      ?auto_23959 - SURFACE
      ?auto_23960 - PLACE
      ?auto_23953 - HOIST
      ?auto_23962 - SURFACE
      ?auto_23961 - SURFACE
      ?auto_23950 - PLACE
      ?auto_23952 - HOIST
      ?auto_23951 - SURFACE
      ?auto_23955 - SURFACE
      ?auto_23954 - SURFACE
      ?auto_23963 - SURFACE
      ?auto_23956 - PLACE
      ?auto_23957 - HOIST
      ?auto_23949 - SURFACE
      ?auto_23942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23946 ?auto_23943 ) ( IS-CRATE ?auto_23941 ) ( not ( = ?auto_23947 ?auto_23943 ) ) ( HOIST-AT ?auto_23944 ?auto_23947 ) ( SURFACE-AT ?auto_23941 ?auto_23947 ) ( ON ?auto_23941 ?auto_23945 ) ( CLEAR ?auto_23941 ) ( not ( = ?auto_23938 ?auto_23941 ) ) ( not ( = ?auto_23938 ?auto_23945 ) ) ( not ( = ?auto_23941 ?auto_23945 ) ) ( not ( = ?auto_23946 ?auto_23944 ) ) ( IS-CRATE ?auto_23938 ) ( not ( = ?auto_23958 ?auto_23943 ) ) ( HOIST-AT ?auto_23948 ?auto_23958 ) ( SURFACE-AT ?auto_23938 ?auto_23958 ) ( ON ?auto_23938 ?auto_23959 ) ( CLEAR ?auto_23938 ) ( not ( = ?auto_23939 ?auto_23938 ) ) ( not ( = ?auto_23939 ?auto_23959 ) ) ( not ( = ?auto_23938 ?auto_23959 ) ) ( not ( = ?auto_23946 ?auto_23948 ) ) ( IS-CRATE ?auto_23939 ) ( not ( = ?auto_23960 ?auto_23943 ) ) ( HOIST-AT ?auto_23953 ?auto_23960 ) ( SURFACE-AT ?auto_23939 ?auto_23960 ) ( ON ?auto_23939 ?auto_23962 ) ( CLEAR ?auto_23939 ) ( not ( = ?auto_23940 ?auto_23939 ) ) ( not ( = ?auto_23940 ?auto_23962 ) ) ( not ( = ?auto_23939 ?auto_23962 ) ) ( not ( = ?auto_23946 ?auto_23953 ) ) ( IS-CRATE ?auto_23940 ) ( AVAILABLE ?auto_23948 ) ( SURFACE-AT ?auto_23940 ?auto_23958 ) ( ON ?auto_23940 ?auto_23961 ) ( CLEAR ?auto_23940 ) ( not ( = ?auto_23937 ?auto_23940 ) ) ( not ( = ?auto_23937 ?auto_23961 ) ) ( not ( = ?auto_23940 ?auto_23961 ) ) ( IS-CRATE ?auto_23937 ) ( not ( = ?auto_23950 ?auto_23943 ) ) ( HOIST-AT ?auto_23952 ?auto_23950 ) ( SURFACE-AT ?auto_23937 ?auto_23950 ) ( ON ?auto_23937 ?auto_23951 ) ( CLEAR ?auto_23937 ) ( not ( = ?auto_23936 ?auto_23937 ) ) ( not ( = ?auto_23936 ?auto_23951 ) ) ( not ( = ?auto_23937 ?auto_23951 ) ) ( not ( = ?auto_23946 ?auto_23952 ) ) ( IS-CRATE ?auto_23936 ) ( AVAILABLE ?auto_23944 ) ( SURFACE-AT ?auto_23936 ?auto_23947 ) ( ON ?auto_23936 ?auto_23955 ) ( CLEAR ?auto_23936 ) ( not ( = ?auto_23935 ?auto_23936 ) ) ( not ( = ?auto_23935 ?auto_23955 ) ) ( not ( = ?auto_23936 ?auto_23955 ) ) ( IS-CRATE ?auto_23935 ) ( AVAILABLE ?auto_23952 ) ( SURFACE-AT ?auto_23935 ?auto_23950 ) ( ON ?auto_23935 ?auto_23954 ) ( CLEAR ?auto_23935 ) ( not ( = ?auto_23934 ?auto_23935 ) ) ( not ( = ?auto_23934 ?auto_23954 ) ) ( not ( = ?auto_23935 ?auto_23954 ) ) ( IS-CRATE ?auto_23934 ) ( AVAILABLE ?auto_23953 ) ( SURFACE-AT ?auto_23934 ?auto_23960 ) ( ON ?auto_23934 ?auto_23963 ) ( CLEAR ?auto_23934 ) ( not ( = ?auto_23933 ?auto_23934 ) ) ( not ( = ?auto_23933 ?auto_23963 ) ) ( not ( = ?auto_23934 ?auto_23963 ) ) ( SURFACE-AT ?auto_23932 ?auto_23943 ) ( CLEAR ?auto_23932 ) ( IS-CRATE ?auto_23933 ) ( AVAILABLE ?auto_23946 ) ( not ( = ?auto_23956 ?auto_23943 ) ) ( HOIST-AT ?auto_23957 ?auto_23956 ) ( AVAILABLE ?auto_23957 ) ( SURFACE-AT ?auto_23933 ?auto_23956 ) ( ON ?auto_23933 ?auto_23949 ) ( CLEAR ?auto_23933 ) ( TRUCK-AT ?auto_23942 ?auto_23943 ) ( not ( = ?auto_23932 ?auto_23933 ) ) ( not ( = ?auto_23932 ?auto_23949 ) ) ( not ( = ?auto_23933 ?auto_23949 ) ) ( not ( = ?auto_23946 ?auto_23957 ) ) ( not ( = ?auto_23932 ?auto_23934 ) ) ( not ( = ?auto_23932 ?auto_23963 ) ) ( not ( = ?auto_23934 ?auto_23949 ) ) ( not ( = ?auto_23960 ?auto_23956 ) ) ( not ( = ?auto_23953 ?auto_23957 ) ) ( not ( = ?auto_23963 ?auto_23949 ) ) ( not ( = ?auto_23932 ?auto_23935 ) ) ( not ( = ?auto_23932 ?auto_23954 ) ) ( not ( = ?auto_23933 ?auto_23935 ) ) ( not ( = ?auto_23933 ?auto_23954 ) ) ( not ( = ?auto_23935 ?auto_23963 ) ) ( not ( = ?auto_23935 ?auto_23949 ) ) ( not ( = ?auto_23950 ?auto_23960 ) ) ( not ( = ?auto_23950 ?auto_23956 ) ) ( not ( = ?auto_23952 ?auto_23953 ) ) ( not ( = ?auto_23952 ?auto_23957 ) ) ( not ( = ?auto_23954 ?auto_23963 ) ) ( not ( = ?auto_23954 ?auto_23949 ) ) ( not ( = ?auto_23932 ?auto_23936 ) ) ( not ( = ?auto_23932 ?auto_23955 ) ) ( not ( = ?auto_23933 ?auto_23936 ) ) ( not ( = ?auto_23933 ?auto_23955 ) ) ( not ( = ?auto_23934 ?auto_23936 ) ) ( not ( = ?auto_23934 ?auto_23955 ) ) ( not ( = ?auto_23936 ?auto_23954 ) ) ( not ( = ?auto_23936 ?auto_23963 ) ) ( not ( = ?auto_23936 ?auto_23949 ) ) ( not ( = ?auto_23947 ?auto_23950 ) ) ( not ( = ?auto_23947 ?auto_23960 ) ) ( not ( = ?auto_23947 ?auto_23956 ) ) ( not ( = ?auto_23944 ?auto_23952 ) ) ( not ( = ?auto_23944 ?auto_23953 ) ) ( not ( = ?auto_23944 ?auto_23957 ) ) ( not ( = ?auto_23955 ?auto_23954 ) ) ( not ( = ?auto_23955 ?auto_23963 ) ) ( not ( = ?auto_23955 ?auto_23949 ) ) ( not ( = ?auto_23932 ?auto_23937 ) ) ( not ( = ?auto_23932 ?auto_23951 ) ) ( not ( = ?auto_23933 ?auto_23937 ) ) ( not ( = ?auto_23933 ?auto_23951 ) ) ( not ( = ?auto_23934 ?auto_23937 ) ) ( not ( = ?auto_23934 ?auto_23951 ) ) ( not ( = ?auto_23935 ?auto_23937 ) ) ( not ( = ?auto_23935 ?auto_23951 ) ) ( not ( = ?auto_23937 ?auto_23955 ) ) ( not ( = ?auto_23937 ?auto_23954 ) ) ( not ( = ?auto_23937 ?auto_23963 ) ) ( not ( = ?auto_23937 ?auto_23949 ) ) ( not ( = ?auto_23951 ?auto_23955 ) ) ( not ( = ?auto_23951 ?auto_23954 ) ) ( not ( = ?auto_23951 ?auto_23963 ) ) ( not ( = ?auto_23951 ?auto_23949 ) ) ( not ( = ?auto_23932 ?auto_23940 ) ) ( not ( = ?auto_23932 ?auto_23961 ) ) ( not ( = ?auto_23933 ?auto_23940 ) ) ( not ( = ?auto_23933 ?auto_23961 ) ) ( not ( = ?auto_23934 ?auto_23940 ) ) ( not ( = ?auto_23934 ?auto_23961 ) ) ( not ( = ?auto_23935 ?auto_23940 ) ) ( not ( = ?auto_23935 ?auto_23961 ) ) ( not ( = ?auto_23936 ?auto_23940 ) ) ( not ( = ?auto_23936 ?auto_23961 ) ) ( not ( = ?auto_23940 ?auto_23951 ) ) ( not ( = ?auto_23940 ?auto_23955 ) ) ( not ( = ?auto_23940 ?auto_23954 ) ) ( not ( = ?auto_23940 ?auto_23963 ) ) ( not ( = ?auto_23940 ?auto_23949 ) ) ( not ( = ?auto_23958 ?auto_23950 ) ) ( not ( = ?auto_23958 ?auto_23947 ) ) ( not ( = ?auto_23958 ?auto_23960 ) ) ( not ( = ?auto_23958 ?auto_23956 ) ) ( not ( = ?auto_23948 ?auto_23952 ) ) ( not ( = ?auto_23948 ?auto_23944 ) ) ( not ( = ?auto_23948 ?auto_23953 ) ) ( not ( = ?auto_23948 ?auto_23957 ) ) ( not ( = ?auto_23961 ?auto_23951 ) ) ( not ( = ?auto_23961 ?auto_23955 ) ) ( not ( = ?auto_23961 ?auto_23954 ) ) ( not ( = ?auto_23961 ?auto_23963 ) ) ( not ( = ?auto_23961 ?auto_23949 ) ) ( not ( = ?auto_23932 ?auto_23939 ) ) ( not ( = ?auto_23932 ?auto_23962 ) ) ( not ( = ?auto_23933 ?auto_23939 ) ) ( not ( = ?auto_23933 ?auto_23962 ) ) ( not ( = ?auto_23934 ?auto_23939 ) ) ( not ( = ?auto_23934 ?auto_23962 ) ) ( not ( = ?auto_23935 ?auto_23939 ) ) ( not ( = ?auto_23935 ?auto_23962 ) ) ( not ( = ?auto_23936 ?auto_23939 ) ) ( not ( = ?auto_23936 ?auto_23962 ) ) ( not ( = ?auto_23937 ?auto_23939 ) ) ( not ( = ?auto_23937 ?auto_23962 ) ) ( not ( = ?auto_23939 ?auto_23961 ) ) ( not ( = ?auto_23939 ?auto_23951 ) ) ( not ( = ?auto_23939 ?auto_23955 ) ) ( not ( = ?auto_23939 ?auto_23954 ) ) ( not ( = ?auto_23939 ?auto_23963 ) ) ( not ( = ?auto_23939 ?auto_23949 ) ) ( not ( = ?auto_23962 ?auto_23961 ) ) ( not ( = ?auto_23962 ?auto_23951 ) ) ( not ( = ?auto_23962 ?auto_23955 ) ) ( not ( = ?auto_23962 ?auto_23954 ) ) ( not ( = ?auto_23962 ?auto_23963 ) ) ( not ( = ?auto_23962 ?auto_23949 ) ) ( not ( = ?auto_23932 ?auto_23938 ) ) ( not ( = ?auto_23932 ?auto_23959 ) ) ( not ( = ?auto_23933 ?auto_23938 ) ) ( not ( = ?auto_23933 ?auto_23959 ) ) ( not ( = ?auto_23934 ?auto_23938 ) ) ( not ( = ?auto_23934 ?auto_23959 ) ) ( not ( = ?auto_23935 ?auto_23938 ) ) ( not ( = ?auto_23935 ?auto_23959 ) ) ( not ( = ?auto_23936 ?auto_23938 ) ) ( not ( = ?auto_23936 ?auto_23959 ) ) ( not ( = ?auto_23937 ?auto_23938 ) ) ( not ( = ?auto_23937 ?auto_23959 ) ) ( not ( = ?auto_23940 ?auto_23938 ) ) ( not ( = ?auto_23940 ?auto_23959 ) ) ( not ( = ?auto_23938 ?auto_23962 ) ) ( not ( = ?auto_23938 ?auto_23961 ) ) ( not ( = ?auto_23938 ?auto_23951 ) ) ( not ( = ?auto_23938 ?auto_23955 ) ) ( not ( = ?auto_23938 ?auto_23954 ) ) ( not ( = ?auto_23938 ?auto_23963 ) ) ( not ( = ?auto_23938 ?auto_23949 ) ) ( not ( = ?auto_23959 ?auto_23962 ) ) ( not ( = ?auto_23959 ?auto_23961 ) ) ( not ( = ?auto_23959 ?auto_23951 ) ) ( not ( = ?auto_23959 ?auto_23955 ) ) ( not ( = ?auto_23959 ?auto_23954 ) ) ( not ( = ?auto_23959 ?auto_23963 ) ) ( not ( = ?auto_23959 ?auto_23949 ) ) ( not ( = ?auto_23932 ?auto_23941 ) ) ( not ( = ?auto_23932 ?auto_23945 ) ) ( not ( = ?auto_23933 ?auto_23941 ) ) ( not ( = ?auto_23933 ?auto_23945 ) ) ( not ( = ?auto_23934 ?auto_23941 ) ) ( not ( = ?auto_23934 ?auto_23945 ) ) ( not ( = ?auto_23935 ?auto_23941 ) ) ( not ( = ?auto_23935 ?auto_23945 ) ) ( not ( = ?auto_23936 ?auto_23941 ) ) ( not ( = ?auto_23936 ?auto_23945 ) ) ( not ( = ?auto_23937 ?auto_23941 ) ) ( not ( = ?auto_23937 ?auto_23945 ) ) ( not ( = ?auto_23940 ?auto_23941 ) ) ( not ( = ?auto_23940 ?auto_23945 ) ) ( not ( = ?auto_23939 ?auto_23941 ) ) ( not ( = ?auto_23939 ?auto_23945 ) ) ( not ( = ?auto_23941 ?auto_23959 ) ) ( not ( = ?auto_23941 ?auto_23962 ) ) ( not ( = ?auto_23941 ?auto_23961 ) ) ( not ( = ?auto_23941 ?auto_23951 ) ) ( not ( = ?auto_23941 ?auto_23955 ) ) ( not ( = ?auto_23941 ?auto_23954 ) ) ( not ( = ?auto_23941 ?auto_23963 ) ) ( not ( = ?auto_23941 ?auto_23949 ) ) ( not ( = ?auto_23945 ?auto_23959 ) ) ( not ( = ?auto_23945 ?auto_23962 ) ) ( not ( = ?auto_23945 ?auto_23961 ) ) ( not ( = ?auto_23945 ?auto_23951 ) ) ( not ( = ?auto_23945 ?auto_23955 ) ) ( not ( = ?auto_23945 ?auto_23954 ) ) ( not ( = ?auto_23945 ?auto_23963 ) ) ( not ( = ?auto_23945 ?auto_23949 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_23932 ?auto_23933 ?auto_23934 ?auto_23935 ?auto_23936 ?auto_23937 ?auto_23940 ?auto_23939 ?auto_23938 )
      ( MAKE-1CRATE ?auto_23938 ?auto_23941 )
      ( MAKE-9CRATE-VERIFY ?auto_23932 ?auto_23933 ?auto_23934 ?auto_23935 ?auto_23936 ?auto_23937 ?auto_23940 ?auto_23939 ?auto_23938 ?auto_23941 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23966 - SURFACE
      ?auto_23967 - SURFACE
    )
    :vars
    (
      ?auto_23968 - HOIST
      ?auto_23969 - PLACE
      ?auto_23971 - PLACE
      ?auto_23972 - HOIST
      ?auto_23973 - SURFACE
      ?auto_23970 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23968 ?auto_23969 ) ( SURFACE-AT ?auto_23966 ?auto_23969 ) ( CLEAR ?auto_23966 ) ( IS-CRATE ?auto_23967 ) ( AVAILABLE ?auto_23968 ) ( not ( = ?auto_23971 ?auto_23969 ) ) ( HOIST-AT ?auto_23972 ?auto_23971 ) ( AVAILABLE ?auto_23972 ) ( SURFACE-AT ?auto_23967 ?auto_23971 ) ( ON ?auto_23967 ?auto_23973 ) ( CLEAR ?auto_23967 ) ( TRUCK-AT ?auto_23970 ?auto_23969 ) ( not ( = ?auto_23966 ?auto_23967 ) ) ( not ( = ?auto_23966 ?auto_23973 ) ) ( not ( = ?auto_23967 ?auto_23973 ) ) ( not ( = ?auto_23968 ?auto_23972 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23970 ?auto_23969 ?auto_23971 )
      ( !LIFT ?auto_23972 ?auto_23967 ?auto_23973 ?auto_23971 )
      ( !LOAD ?auto_23972 ?auto_23967 ?auto_23970 ?auto_23971 )
      ( !DRIVE ?auto_23970 ?auto_23971 ?auto_23969 )
      ( !UNLOAD ?auto_23968 ?auto_23967 ?auto_23970 ?auto_23969 )
      ( !DROP ?auto_23968 ?auto_23967 ?auto_23966 ?auto_23969 )
      ( MAKE-1CRATE-VERIFY ?auto_23966 ?auto_23967 ) )
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
      ?auto_23993 - SURFACE
      ?auto_23992 - SURFACE
      ?auto_23991 - SURFACE
      ?auto_23994 - SURFACE
      ?auto_23995 - SURFACE
    )
    :vars
    (
      ?auto_23997 - HOIST
      ?auto_23998 - PLACE
      ?auto_23996 - PLACE
      ?auto_24001 - HOIST
      ?auto_24000 - SURFACE
      ?auto_24004 - PLACE
      ?auto_24013 - HOIST
      ?auto_24015 - SURFACE
      ?auto_24003 - PLACE
      ?auto_24006 - HOIST
      ?auto_24009 - SURFACE
      ?auto_24010 - PLACE
      ?auto_24019 - HOIST
      ?auto_24014 - SURFACE
      ?auto_24016 - SURFACE
      ?auto_24002 - PLACE
      ?auto_24020 - HOIST
      ?auto_24005 - SURFACE
      ?auto_24017 - SURFACE
      ?auto_24018 - SURFACE
      ?auto_24012 - SURFACE
      ?auto_24008 - PLACE
      ?auto_24011 - HOIST
      ?auto_24007 - SURFACE
      ?auto_23999 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23997 ?auto_23998 ) ( IS-CRATE ?auto_23995 ) ( not ( = ?auto_23996 ?auto_23998 ) ) ( HOIST-AT ?auto_24001 ?auto_23996 ) ( AVAILABLE ?auto_24001 ) ( SURFACE-AT ?auto_23995 ?auto_23996 ) ( ON ?auto_23995 ?auto_24000 ) ( CLEAR ?auto_23995 ) ( not ( = ?auto_23994 ?auto_23995 ) ) ( not ( = ?auto_23994 ?auto_24000 ) ) ( not ( = ?auto_23995 ?auto_24000 ) ) ( not ( = ?auto_23997 ?auto_24001 ) ) ( IS-CRATE ?auto_23994 ) ( not ( = ?auto_24004 ?auto_23998 ) ) ( HOIST-AT ?auto_24013 ?auto_24004 ) ( SURFACE-AT ?auto_23994 ?auto_24004 ) ( ON ?auto_23994 ?auto_24015 ) ( CLEAR ?auto_23994 ) ( not ( = ?auto_23991 ?auto_23994 ) ) ( not ( = ?auto_23991 ?auto_24015 ) ) ( not ( = ?auto_23994 ?auto_24015 ) ) ( not ( = ?auto_23997 ?auto_24013 ) ) ( IS-CRATE ?auto_23991 ) ( not ( = ?auto_24003 ?auto_23998 ) ) ( HOIST-AT ?auto_24006 ?auto_24003 ) ( SURFACE-AT ?auto_23991 ?auto_24003 ) ( ON ?auto_23991 ?auto_24009 ) ( CLEAR ?auto_23991 ) ( not ( = ?auto_23992 ?auto_23991 ) ) ( not ( = ?auto_23992 ?auto_24009 ) ) ( not ( = ?auto_23991 ?auto_24009 ) ) ( not ( = ?auto_23997 ?auto_24006 ) ) ( IS-CRATE ?auto_23992 ) ( not ( = ?auto_24010 ?auto_23998 ) ) ( HOIST-AT ?auto_24019 ?auto_24010 ) ( SURFACE-AT ?auto_23992 ?auto_24010 ) ( ON ?auto_23992 ?auto_24014 ) ( CLEAR ?auto_23992 ) ( not ( = ?auto_23993 ?auto_23992 ) ) ( not ( = ?auto_23993 ?auto_24014 ) ) ( not ( = ?auto_23992 ?auto_24014 ) ) ( not ( = ?auto_23997 ?auto_24019 ) ) ( IS-CRATE ?auto_23993 ) ( AVAILABLE ?auto_24006 ) ( SURFACE-AT ?auto_23993 ?auto_24003 ) ( ON ?auto_23993 ?auto_24016 ) ( CLEAR ?auto_23993 ) ( not ( = ?auto_23990 ?auto_23993 ) ) ( not ( = ?auto_23990 ?auto_24016 ) ) ( not ( = ?auto_23993 ?auto_24016 ) ) ( IS-CRATE ?auto_23990 ) ( not ( = ?auto_24002 ?auto_23998 ) ) ( HOIST-AT ?auto_24020 ?auto_24002 ) ( SURFACE-AT ?auto_23990 ?auto_24002 ) ( ON ?auto_23990 ?auto_24005 ) ( CLEAR ?auto_23990 ) ( not ( = ?auto_23989 ?auto_23990 ) ) ( not ( = ?auto_23989 ?auto_24005 ) ) ( not ( = ?auto_23990 ?auto_24005 ) ) ( not ( = ?auto_23997 ?auto_24020 ) ) ( IS-CRATE ?auto_23989 ) ( AVAILABLE ?auto_24013 ) ( SURFACE-AT ?auto_23989 ?auto_24004 ) ( ON ?auto_23989 ?auto_24017 ) ( CLEAR ?auto_23989 ) ( not ( = ?auto_23988 ?auto_23989 ) ) ( not ( = ?auto_23988 ?auto_24017 ) ) ( not ( = ?auto_23989 ?auto_24017 ) ) ( IS-CRATE ?auto_23988 ) ( AVAILABLE ?auto_24020 ) ( SURFACE-AT ?auto_23988 ?auto_24002 ) ( ON ?auto_23988 ?auto_24018 ) ( CLEAR ?auto_23988 ) ( not ( = ?auto_23987 ?auto_23988 ) ) ( not ( = ?auto_23987 ?auto_24018 ) ) ( not ( = ?auto_23988 ?auto_24018 ) ) ( IS-CRATE ?auto_23987 ) ( AVAILABLE ?auto_24019 ) ( SURFACE-AT ?auto_23987 ?auto_24010 ) ( ON ?auto_23987 ?auto_24012 ) ( CLEAR ?auto_23987 ) ( not ( = ?auto_23986 ?auto_23987 ) ) ( not ( = ?auto_23986 ?auto_24012 ) ) ( not ( = ?auto_23987 ?auto_24012 ) ) ( SURFACE-AT ?auto_23985 ?auto_23998 ) ( CLEAR ?auto_23985 ) ( IS-CRATE ?auto_23986 ) ( AVAILABLE ?auto_23997 ) ( not ( = ?auto_24008 ?auto_23998 ) ) ( HOIST-AT ?auto_24011 ?auto_24008 ) ( AVAILABLE ?auto_24011 ) ( SURFACE-AT ?auto_23986 ?auto_24008 ) ( ON ?auto_23986 ?auto_24007 ) ( CLEAR ?auto_23986 ) ( TRUCK-AT ?auto_23999 ?auto_23998 ) ( not ( = ?auto_23985 ?auto_23986 ) ) ( not ( = ?auto_23985 ?auto_24007 ) ) ( not ( = ?auto_23986 ?auto_24007 ) ) ( not ( = ?auto_23997 ?auto_24011 ) ) ( not ( = ?auto_23985 ?auto_23987 ) ) ( not ( = ?auto_23985 ?auto_24012 ) ) ( not ( = ?auto_23987 ?auto_24007 ) ) ( not ( = ?auto_24010 ?auto_24008 ) ) ( not ( = ?auto_24019 ?auto_24011 ) ) ( not ( = ?auto_24012 ?auto_24007 ) ) ( not ( = ?auto_23985 ?auto_23988 ) ) ( not ( = ?auto_23985 ?auto_24018 ) ) ( not ( = ?auto_23986 ?auto_23988 ) ) ( not ( = ?auto_23986 ?auto_24018 ) ) ( not ( = ?auto_23988 ?auto_24012 ) ) ( not ( = ?auto_23988 ?auto_24007 ) ) ( not ( = ?auto_24002 ?auto_24010 ) ) ( not ( = ?auto_24002 ?auto_24008 ) ) ( not ( = ?auto_24020 ?auto_24019 ) ) ( not ( = ?auto_24020 ?auto_24011 ) ) ( not ( = ?auto_24018 ?auto_24012 ) ) ( not ( = ?auto_24018 ?auto_24007 ) ) ( not ( = ?auto_23985 ?auto_23989 ) ) ( not ( = ?auto_23985 ?auto_24017 ) ) ( not ( = ?auto_23986 ?auto_23989 ) ) ( not ( = ?auto_23986 ?auto_24017 ) ) ( not ( = ?auto_23987 ?auto_23989 ) ) ( not ( = ?auto_23987 ?auto_24017 ) ) ( not ( = ?auto_23989 ?auto_24018 ) ) ( not ( = ?auto_23989 ?auto_24012 ) ) ( not ( = ?auto_23989 ?auto_24007 ) ) ( not ( = ?auto_24004 ?auto_24002 ) ) ( not ( = ?auto_24004 ?auto_24010 ) ) ( not ( = ?auto_24004 ?auto_24008 ) ) ( not ( = ?auto_24013 ?auto_24020 ) ) ( not ( = ?auto_24013 ?auto_24019 ) ) ( not ( = ?auto_24013 ?auto_24011 ) ) ( not ( = ?auto_24017 ?auto_24018 ) ) ( not ( = ?auto_24017 ?auto_24012 ) ) ( not ( = ?auto_24017 ?auto_24007 ) ) ( not ( = ?auto_23985 ?auto_23990 ) ) ( not ( = ?auto_23985 ?auto_24005 ) ) ( not ( = ?auto_23986 ?auto_23990 ) ) ( not ( = ?auto_23986 ?auto_24005 ) ) ( not ( = ?auto_23987 ?auto_23990 ) ) ( not ( = ?auto_23987 ?auto_24005 ) ) ( not ( = ?auto_23988 ?auto_23990 ) ) ( not ( = ?auto_23988 ?auto_24005 ) ) ( not ( = ?auto_23990 ?auto_24017 ) ) ( not ( = ?auto_23990 ?auto_24018 ) ) ( not ( = ?auto_23990 ?auto_24012 ) ) ( not ( = ?auto_23990 ?auto_24007 ) ) ( not ( = ?auto_24005 ?auto_24017 ) ) ( not ( = ?auto_24005 ?auto_24018 ) ) ( not ( = ?auto_24005 ?auto_24012 ) ) ( not ( = ?auto_24005 ?auto_24007 ) ) ( not ( = ?auto_23985 ?auto_23993 ) ) ( not ( = ?auto_23985 ?auto_24016 ) ) ( not ( = ?auto_23986 ?auto_23993 ) ) ( not ( = ?auto_23986 ?auto_24016 ) ) ( not ( = ?auto_23987 ?auto_23993 ) ) ( not ( = ?auto_23987 ?auto_24016 ) ) ( not ( = ?auto_23988 ?auto_23993 ) ) ( not ( = ?auto_23988 ?auto_24016 ) ) ( not ( = ?auto_23989 ?auto_23993 ) ) ( not ( = ?auto_23989 ?auto_24016 ) ) ( not ( = ?auto_23993 ?auto_24005 ) ) ( not ( = ?auto_23993 ?auto_24017 ) ) ( not ( = ?auto_23993 ?auto_24018 ) ) ( not ( = ?auto_23993 ?auto_24012 ) ) ( not ( = ?auto_23993 ?auto_24007 ) ) ( not ( = ?auto_24003 ?auto_24002 ) ) ( not ( = ?auto_24003 ?auto_24004 ) ) ( not ( = ?auto_24003 ?auto_24010 ) ) ( not ( = ?auto_24003 ?auto_24008 ) ) ( not ( = ?auto_24006 ?auto_24020 ) ) ( not ( = ?auto_24006 ?auto_24013 ) ) ( not ( = ?auto_24006 ?auto_24019 ) ) ( not ( = ?auto_24006 ?auto_24011 ) ) ( not ( = ?auto_24016 ?auto_24005 ) ) ( not ( = ?auto_24016 ?auto_24017 ) ) ( not ( = ?auto_24016 ?auto_24018 ) ) ( not ( = ?auto_24016 ?auto_24012 ) ) ( not ( = ?auto_24016 ?auto_24007 ) ) ( not ( = ?auto_23985 ?auto_23992 ) ) ( not ( = ?auto_23985 ?auto_24014 ) ) ( not ( = ?auto_23986 ?auto_23992 ) ) ( not ( = ?auto_23986 ?auto_24014 ) ) ( not ( = ?auto_23987 ?auto_23992 ) ) ( not ( = ?auto_23987 ?auto_24014 ) ) ( not ( = ?auto_23988 ?auto_23992 ) ) ( not ( = ?auto_23988 ?auto_24014 ) ) ( not ( = ?auto_23989 ?auto_23992 ) ) ( not ( = ?auto_23989 ?auto_24014 ) ) ( not ( = ?auto_23990 ?auto_23992 ) ) ( not ( = ?auto_23990 ?auto_24014 ) ) ( not ( = ?auto_23992 ?auto_24016 ) ) ( not ( = ?auto_23992 ?auto_24005 ) ) ( not ( = ?auto_23992 ?auto_24017 ) ) ( not ( = ?auto_23992 ?auto_24018 ) ) ( not ( = ?auto_23992 ?auto_24012 ) ) ( not ( = ?auto_23992 ?auto_24007 ) ) ( not ( = ?auto_24014 ?auto_24016 ) ) ( not ( = ?auto_24014 ?auto_24005 ) ) ( not ( = ?auto_24014 ?auto_24017 ) ) ( not ( = ?auto_24014 ?auto_24018 ) ) ( not ( = ?auto_24014 ?auto_24012 ) ) ( not ( = ?auto_24014 ?auto_24007 ) ) ( not ( = ?auto_23985 ?auto_23991 ) ) ( not ( = ?auto_23985 ?auto_24009 ) ) ( not ( = ?auto_23986 ?auto_23991 ) ) ( not ( = ?auto_23986 ?auto_24009 ) ) ( not ( = ?auto_23987 ?auto_23991 ) ) ( not ( = ?auto_23987 ?auto_24009 ) ) ( not ( = ?auto_23988 ?auto_23991 ) ) ( not ( = ?auto_23988 ?auto_24009 ) ) ( not ( = ?auto_23989 ?auto_23991 ) ) ( not ( = ?auto_23989 ?auto_24009 ) ) ( not ( = ?auto_23990 ?auto_23991 ) ) ( not ( = ?auto_23990 ?auto_24009 ) ) ( not ( = ?auto_23993 ?auto_23991 ) ) ( not ( = ?auto_23993 ?auto_24009 ) ) ( not ( = ?auto_23991 ?auto_24014 ) ) ( not ( = ?auto_23991 ?auto_24016 ) ) ( not ( = ?auto_23991 ?auto_24005 ) ) ( not ( = ?auto_23991 ?auto_24017 ) ) ( not ( = ?auto_23991 ?auto_24018 ) ) ( not ( = ?auto_23991 ?auto_24012 ) ) ( not ( = ?auto_23991 ?auto_24007 ) ) ( not ( = ?auto_24009 ?auto_24014 ) ) ( not ( = ?auto_24009 ?auto_24016 ) ) ( not ( = ?auto_24009 ?auto_24005 ) ) ( not ( = ?auto_24009 ?auto_24017 ) ) ( not ( = ?auto_24009 ?auto_24018 ) ) ( not ( = ?auto_24009 ?auto_24012 ) ) ( not ( = ?auto_24009 ?auto_24007 ) ) ( not ( = ?auto_23985 ?auto_23994 ) ) ( not ( = ?auto_23985 ?auto_24015 ) ) ( not ( = ?auto_23986 ?auto_23994 ) ) ( not ( = ?auto_23986 ?auto_24015 ) ) ( not ( = ?auto_23987 ?auto_23994 ) ) ( not ( = ?auto_23987 ?auto_24015 ) ) ( not ( = ?auto_23988 ?auto_23994 ) ) ( not ( = ?auto_23988 ?auto_24015 ) ) ( not ( = ?auto_23989 ?auto_23994 ) ) ( not ( = ?auto_23989 ?auto_24015 ) ) ( not ( = ?auto_23990 ?auto_23994 ) ) ( not ( = ?auto_23990 ?auto_24015 ) ) ( not ( = ?auto_23993 ?auto_23994 ) ) ( not ( = ?auto_23993 ?auto_24015 ) ) ( not ( = ?auto_23992 ?auto_23994 ) ) ( not ( = ?auto_23992 ?auto_24015 ) ) ( not ( = ?auto_23994 ?auto_24009 ) ) ( not ( = ?auto_23994 ?auto_24014 ) ) ( not ( = ?auto_23994 ?auto_24016 ) ) ( not ( = ?auto_23994 ?auto_24005 ) ) ( not ( = ?auto_23994 ?auto_24017 ) ) ( not ( = ?auto_23994 ?auto_24018 ) ) ( not ( = ?auto_23994 ?auto_24012 ) ) ( not ( = ?auto_23994 ?auto_24007 ) ) ( not ( = ?auto_24015 ?auto_24009 ) ) ( not ( = ?auto_24015 ?auto_24014 ) ) ( not ( = ?auto_24015 ?auto_24016 ) ) ( not ( = ?auto_24015 ?auto_24005 ) ) ( not ( = ?auto_24015 ?auto_24017 ) ) ( not ( = ?auto_24015 ?auto_24018 ) ) ( not ( = ?auto_24015 ?auto_24012 ) ) ( not ( = ?auto_24015 ?auto_24007 ) ) ( not ( = ?auto_23985 ?auto_23995 ) ) ( not ( = ?auto_23985 ?auto_24000 ) ) ( not ( = ?auto_23986 ?auto_23995 ) ) ( not ( = ?auto_23986 ?auto_24000 ) ) ( not ( = ?auto_23987 ?auto_23995 ) ) ( not ( = ?auto_23987 ?auto_24000 ) ) ( not ( = ?auto_23988 ?auto_23995 ) ) ( not ( = ?auto_23988 ?auto_24000 ) ) ( not ( = ?auto_23989 ?auto_23995 ) ) ( not ( = ?auto_23989 ?auto_24000 ) ) ( not ( = ?auto_23990 ?auto_23995 ) ) ( not ( = ?auto_23990 ?auto_24000 ) ) ( not ( = ?auto_23993 ?auto_23995 ) ) ( not ( = ?auto_23993 ?auto_24000 ) ) ( not ( = ?auto_23992 ?auto_23995 ) ) ( not ( = ?auto_23992 ?auto_24000 ) ) ( not ( = ?auto_23991 ?auto_23995 ) ) ( not ( = ?auto_23991 ?auto_24000 ) ) ( not ( = ?auto_23995 ?auto_24015 ) ) ( not ( = ?auto_23995 ?auto_24009 ) ) ( not ( = ?auto_23995 ?auto_24014 ) ) ( not ( = ?auto_23995 ?auto_24016 ) ) ( not ( = ?auto_23995 ?auto_24005 ) ) ( not ( = ?auto_23995 ?auto_24017 ) ) ( not ( = ?auto_23995 ?auto_24018 ) ) ( not ( = ?auto_23995 ?auto_24012 ) ) ( not ( = ?auto_23995 ?auto_24007 ) ) ( not ( = ?auto_23996 ?auto_24004 ) ) ( not ( = ?auto_23996 ?auto_24003 ) ) ( not ( = ?auto_23996 ?auto_24010 ) ) ( not ( = ?auto_23996 ?auto_24002 ) ) ( not ( = ?auto_23996 ?auto_24008 ) ) ( not ( = ?auto_24001 ?auto_24013 ) ) ( not ( = ?auto_24001 ?auto_24006 ) ) ( not ( = ?auto_24001 ?auto_24019 ) ) ( not ( = ?auto_24001 ?auto_24020 ) ) ( not ( = ?auto_24001 ?auto_24011 ) ) ( not ( = ?auto_24000 ?auto_24015 ) ) ( not ( = ?auto_24000 ?auto_24009 ) ) ( not ( = ?auto_24000 ?auto_24014 ) ) ( not ( = ?auto_24000 ?auto_24016 ) ) ( not ( = ?auto_24000 ?auto_24005 ) ) ( not ( = ?auto_24000 ?auto_24017 ) ) ( not ( = ?auto_24000 ?auto_24018 ) ) ( not ( = ?auto_24000 ?auto_24012 ) ) ( not ( = ?auto_24000 ?auto_24007 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_23985 ?auto_23986 ?auto_23987 ?auto_23988 ?auto_23989 ?auto_23990 ?auto_23993 ?auto_23992 ?auto_23991 ?auto_23994 )
      ( MAKE-1CRATE ?auto_23994 ?auto_23995 )
      ( MAKE-10CRATE-VERIFY ?auto_23985 ?auto_23986 ?auto_23987 ?auto_23988 ?auto_23989 ?auto_23990 ?auto_23993 ?auto_23992 ?auto_23991 ?auto_23994 ?auto_23995 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24023 - SURFACE
      ?auto_24024 - SURFACE
    )
    :vars
    (
      ?auto_24025 - HOIST
      ?auto_24026 - PLACE
      ?auto_24028 - PLACE
      ?auto_24029 - HOIST
      ?auto_24030 - SURFACE
      ?auto_24027 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24025 ?auto_24026 ) ( SURFACE-AT ?auto_24023 ?auto_24026 ) ( CLEAR ?auto_24023 ) ( IS-CRATE ?auto_24024 ) ( AVAILABLE ?auto_24025 ) ( not ( = ?auto_24028 ?auto_24026 ) ) ( HOIST-AT ?auto_24029 ?auto_24028 ) ( AVAILABLE ?auto_24029 ) ( SURFACE-AT ?auto_24024 ?auto_24028 ) ( ON ?auto_24024 ?auto_24030 ) ( CLEAR ?auto_24024 ) ( TRUCK-AT ?auto_24027 ?auto_24026 ) ( not ( = ?auto_24023 ?auto_24024 ) ) ( not ( = ?auto_24023 ?auto_24030 ) ) ( not ( = ?auto_24024 ?auto_24030 ) ) ( not ( = ?auto_24025 ?auto_24029 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24027 ?auto_24026 ?auto_24028 )
      ( !LIFT ?auto_24029 ?auto_24024 ?auto_24030 ?auto_24028 )
      ( !LOAD ?auto_24029 ?auto_24024 ?auto_24027 ?auto_24028 )
      ( !DRIVE ?auto_24027 ?auto_24028 ?auto_24026 )
      ( !UNLOAD ?auto_24025 ?auto_24024 ?auto_24027 ?auto_24026 )
      ( !DROP ?auto_24025 ?auto_24024 ?auto_24023 ?auto_24026 )
      ( MAKE-1CRATE-VERIFY ?auto_24023 ?auto_24024 ) )
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
      ?auto_24051 - SURFACE
      ?auto_24050 - SURFACE
      ?auto_24049 - SURFACE
      ?auto_24052 - SURFACE
      ?auto_24054 - SURFACE
      ?auto_24053 - SURFACE
    )
    :vars
    (
      ?auto_24057 - HOIST
      ?auto_24059 - PLACE
      ?auto_24056 - PLACE
      ?auto_24055 - HOIST
      ?auto_24058 - SURFACE
      ?auto_24075 - PLACE
      ?auto_24066 - HOIST
      ?auto_24065 - SURFACE
      ?auto_24072 - PLACE
      ?auto_24073 - HOIST
      ?auto_24063 - SURFACE
      ?auto_24061 - PLACE
      ?auto_24074 - HOIST
      ?auto_24080 - SURFACE
      ?auto_24078 - SURFACE
      ?auto_24076 - SURFACE
      ?auto_24068 - PLACE
      ?auto_24069 - HOIST
      ?auto_24070 - SURFACE
      ?auto_24064 - SURFACE
      ?auto_24071 - SURFACE
      ?auto_24079 - SURFACE
      ?auto_24062 - PLACE
      ?auto_24077 - HOIST
      ?auto_24067 - SURFACE
      ?auto_24060 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24057 ?auto_24059 ) ( IS-CRATE ?auto_24053 ) ( not ( = ?auto_24056 ?auto_24059 ) ) ( HOIST-AT ?auto_24055 ?auto_24056 ) ( SURFACE-AT ?auto_24053 ?auto_24056 ) ( ON ?auto_24053 ?auto_24058 ) ( CLEAR ?auto_24053 ) ( not ( = ?auto_24054 ?auto_24053 ) ) ( not ( = ?auto_24054 ?auto_24058 ) ) ( not ( = ?auto_24053 ?auto_24058 ) ) ( not ( = ?auto_24057 ?auto_24055 ) ) ( IS-CRATE ?auto_24054 ) ( not ( = ?auto_24075 ?auto_24059 ) ) ( HOIST-AT ?auto_24066 ?auto_24075 ) ( AVAILABLE ?auto_24066 ) ( SURFACE-AT ?auto_24054 ?auto_24075 ) ( ON ?auto_24054 ?auto_24065 ) ( CLEAR ?auto_24054 ) ( not ( = ?auto_24052 ?auto_24054 ) ) ( not ( = ?auto_24052 ?auto_24065 ) ) ( not ( = ?auto_24054 ?auto_24065 ) ) ( not ( = ?auto_24057 ?auto_24066 ) ) ( IS-CRATE ?auto_24052 ) ( not ( = ?auto_24072 ?auto_24059 ) ) ( HOIST-AT ?auto_24073 ?auto_24072 ) ( SURFACE-AT ?auto_24052 ?auto_24072 ) ( ON ?auto_24052 ?auto_24063 ) ( CLEAR ?auto_24052 ) ( not ( = ?auto_24049 ?auto_24052 ) ) ( not ( = ?auto_24049 ?auto_24063 ) ) ( not ( = ?auto_24052 ?auto_24063 ) ) ( not ( = ?auto_24057 ?auto_24073 ) ) ( IS-CRATE ?auto_24049 ) ( not ( = ?auto_24061 ?auto_24059 ) ) ( HOIST-AT ?auto_24074 ?auto_24061 ) ( SURFACE-AT ?auto_24049 ?auto_24061 ) ( ON ?auto_24049 ?auto_24080 ) ( CLEAR ?auto_24049 ) ( not ( = ?auto_24050 ?auto_24049 ) ) ( not ( = ?auto_24050 ?auto_24080 ) ) ( not ( = ?auto_24049 ?auto_24080 ) ) ( not ( = ?auto_24057 ?auto_24074 ) ) ( IS-CRATE ?auto_24050 ) ( SURFACE-AT ?auto_24050 ?auto_24056 ) ( ON ?auto_24050 ?auto_24078 ) ( CLEAR ?auto_24050 ) ( not ( = ?auto_24051 ?auto_24050 ) ) ( not ( = ?auto_24051 ?auto_24078 ) ) ( not ( = ?auto_24050 ?auto_24078 ) ) ( IS-CRATE ?auto_24051 ) ( AVAILABLE ?auto_24074 ) ( SURFACE-AT ?auto_24051 ?auto_24061 ) ( ON ?auto_24051 ?auto_24076 ) ( CLEAR ?auto_24051 ) ( not ( = ?auto_24048 ?auto_24051 ) ) ( not ( = ?auto_24048 ?auto_24076 ) ) ( not ( = ?auto_24051 ?auto_24076 ) ) ( IS-CRATE ?auto_24048 ) ( not ( = ?auto_24068 ?auto_24059 ) ) ( HOIST-AT ?auto_24069 ?auto_24068 ) ( SURFACE-AT ?auto_24048 ?auto_24068 ) ( ON ?auto_24048 ?auto_24070 ) ( CLEAR ?auto_24048 ) ( not ( = ?auto_24047 ?auto_24048 ) ) ( not ( = ?auto_24047 ?auto_24070 ) ) ( not ( = ?auto_24048 ?auto_24070 ) ) ( not ( = ?auto_24057 ?auto_24069 ) ) ( IS-CRATE ?auto_24047 ) ( AVAILABLE ?auto_24073 ) ( SURFACE-AT ?auto_24047 ?auto_24072 ) ( ON ?auto_24047 ?auto_24064 ) ( CLEAR ?auto_24047 ) ( not ( = ?auto_24046 ?auto_24047 ) ) ( not ( = ?auto_24046 ?auto_24064 ) ) ( not ( = ?auto_24047 ?auto_24064 ) ) ( IS-CRATE ?auto_24046 ) ( AVAILABLE ?auto_24069 ) ( SURFACE-AT ?auto_24046 ?auto_24068 ) ( ON ?auto_24046 ?auto_24071 ) ( CLEAR ?auto_24046 ) ( not ( = ?auto_24045 ?auto_24046 ) ) ( not ( = ?auto_24045 ?auto_24071 ) ) ( not ( = ?auto_24046 ?auto_24071 ) ) ( IS-CRATE ?auto_24045 ) ( AVAILABLE ?auto_24055 ) ( SURFACE-AT ?auto_24045 ?auto_24056 ) ( ON ?auto_24045 ?auto_24079 ) ( CLEAR ?auto_24045 ) ( not ( = ?auto_24044 ?auto_24045 ) ) ( not ( = ?auto_24044 ?auto_24079 ) ) ( not ( = ?auto_24045 ?auto_24079 ) ) ( SURFACE-AT ?auto_24043 ?auto_24059 ) ( CLEAR ?auto_24043 ) ( IS-CRATE ?auto_24044 ) ( AVAILABLE ?auto_24057 ) ( not ( = ?auto_24062 ?auto_24059 ) ) ( HOIST-AT ?auto_24077 ?auto_24062 ) ( AVAILABLE ?auto_24077 ) ( SURFACE-AT ?auto_24044 ?auto_24062 ) ( ON ?auto_24044 ?auto_24067 ) ( CLEAR ?auto_24044 ) ( TRUCK-AT ?auto_24060 ?auto_24059 ) ( not ( = ?auto_24043 ?auto_24044 ) ) ( not ( = ?auto_24043 ?auto_24067 ) ) ( not ( = ?auto_24044 ?auto_24067 ) ) ( not ( = ?auto_24057 ?auto_24077 ) ) ( not ( = ?auto_24043 ?auto_24045 ) ) ( not ( = ?auto_24043 ?auto_24079 ) ) ( not ( = ?auto_24045 ?auto_24067 ) ) ( not ( = ?auto_24056 ?auto_24062 ) ) ( not ( = ?auto_24055 ?auto_24077 ) ) ( not ( = ?auto_24079 ?auto_24067 ) ) ( not ( = ?auto_24043 ?auto_24046 ) ) ( not ( = ?auto_24043 ?auto_24071 ) ) ( not ( = ?auto_24044 ?auto_24046 ) ) ( not ( = ?auto_24044 ?auto_24071 ) ) ( not ( = ?auto_24046 ?auto_24079 ) ) ( not ( = ?auto_24046 ?auto_24067 ) ) ( not ( = ?auto_24068 ?auto_24056 ) ) ( not ( = ?auto_24068 ?auto_24062 ) ) ( not ( = ?auto_24069 ?auto_24055 ) ) ( not ( = ?auto_24069 ?auto_24077 ) ) ( not ( = ?auto_24071 ?auto_24079 ) ) ( not ( = ?auto_24071 ?auto_24067 ) ) ( not ( = ?auto_24043 ?auto_24047 ) ) ( not ( = ?auto_24043 ?auto_24064 ) ) ( not ( = ?auto_24044 ?auto_24047 ) ) ( not ( = ?auto_24044 ?auto_24064 ) ) ( not ( = ?auto_24045 ?auto_24047 ) ) ( not ( = ?auto_24045 ?auto_24064 ) ) ( not ( = ?auto_24047 ?auto_24071 ) ) ( not ( = ?auto_24047 ?auto_24079 ) ) ( not ( = ?auto_24047 ?auto_24067 ) ) ( not ( = ?auto_24072 ?auto_24068 ) ) ( not ( = ?auto_24072 ?auto_24056 ) ) ( not ( = ?auto_24072 ?auto_24062 ) ) ( not ( = ?auto_24073 ?auto_24069 ) ) ( not ( = ?auto_24073 ?auto_24055 ) ) ( not ( = ?auto_24073 ?auto_24077 ) ) ( not ( = ?auto_24064 ?auto_24071 ) ) ( not ( = ?auto_24064 ?auto_24079 ) ) ( not ( = ?auto_24064 ?auto_24067 ) ) ( not ( = ?auto_24043 ?auto_24048 ) ) ( not ( = ?auto_24043 ?auto_24070 ) ) ( not ( = ?auto_24044 ?auto_24048 ) ) ( not ( = ?auto_24044 ?auto_24070 ) ) ( not ( = ?auto_24045 ?auto_24048 ) ) ( not ( = ?auto_24045 ?auto_24070 ) ) ( not ( = ?auto_24046 ?auto_24048 ) ) ( not ( = ?auto_24046 ?auto_24070 ) ) ( not ( = ?auto_24048 ?auto_24064 ) ) ( not ( = ?auto_24048 ?auto_24071 ) ) ( not ( = ?auto_24048 ?auto_24079 ) ) ( not ( = ?auto_24048 ?auto_24067 ) ) ( not ( = ?auto_24070 ?auto_24064 ) ) ( not ( = ?auto_24070 ?auto_24071 ) ) ( not ( = ?auto_24070 ?auto_24079 ) ) ( not ( = ?auto_24070 ?auto_24067 ) ) ( not ( = ?auto_24043 ?auto_24051 ) ) ( not ( = ?auto_24043 ?auto_24076 ) ) ( not ( = ?auto_24044 ?auto_24051 ) ) ( not ( = ?auto_24044 ?auto_24076 ) ) ( not ( = ?auto_24045 ?auto_24051 ) ) ( not ( = ?auto_24045 ?auto_24076 ) ) ( not ( = ?auto_24046 ?auto_24051 ) ) ( not ( = ?auto_24046 ?auto_24076 ) ) ( not ( = ?auto_24047 ?auto_24051 ) ) ( not ( = ?auto_24047 ?auto_24076 ) ) ( not ( = ?auto_24051 ?auto_24070 ) ) ( not ( = ?auto_24051 ?auto_24064 ) ) ( not ( = ?auto_24051 ?auto_24071 ) ) ( not ( = ?auto_24051 ?auto_24079 ) ) ( not ( = ?auto_24051 ?auto_24067 ) ) ( not ( = ?auto_24061 ?auto_24068 ) ) ( not ( = ?auto_24061 ?auto_24072 ) ) ( not ( = ?auto_24061 ?auto_24056 ) ) ( not ( = ?auto_24061 ?auto_24062 ) ) ( not ( = ?auto_24074 ?auto_24069 ) ) ( not ( = ?auto_24074 ?auto_24073 ) ) ( not ( = ?auto_24074 ?auto_24055 ) ) ( not ( = ?auto_24074 ?auto_24077 ) ) ( not ( = ?auto_24076 ?auto_24070 ) ) ( not ( = ?auto_24076 ?auto_24064 ) ) ( not ( = ?auto_24076 ?auto_24071 ) ) ( not ( = ?auto_24076 ?auto_24079 ) ) ( not ( = ?auto_24076 ?auto_24067 ) ) ( not ( = ?auto_24043 ?auto_24050 ) ) ( not ( = ?auto_24043 ?auto_24078 ) ) ( not ( = ?auto_24044 ?auto_24050 ) ) ( not ( = ?auto_24044 ?auto_24078 ) ) ( not ( = ?auto_24045 ?auto_24050 ) ) ( not ( = ?auto_24045 ?auto_24078 ) ) ( not ( = ?auto_24046 ?auto_24050 ) ) ( not ( = ?auto_24046 ?auto_24078 ) ) ( not ( = ?auto_24047 ?auto_24050 ) ) ( not ( = ?auto_24047 ?auto_24078 ) ) ( not ( = ?auto_24048 ?auto_24050 ) ) ( not ( = ?auto_24048 ?auto_24078 ) ) ( not ( = ?auto_24050 ?auto_24076 ) ) ( not ( = ?auto_24050 ?auto_24070 ) ) ( not ( = ?auto_24050 ?auto_24064 ) ) ( not ( = ?auto_24050 ?auto_24071 ) ) ( not ( = ?auto_24050 ?auto_24079 ) ) ( not ( = ?auto_24050 ?auto_24067 ) ) ( not ( = ?auto_24078 ?auto_24076 ) ) ( not ( = ?auto_24078 ?auto_24070 ) ) ( not ( = ?auto_24078 ?auto_24064 ) ) ( not ( = ?auto_24078 ?auto_24071 ) ) ( not ( = ?auto_24078 ?auto_24079 ) ) ( not ( = ?auto_24078 ?auto_24067 ) ) ( not ( = ?auto_24043 ?auto_24049 ) ) ( not ( = ?auto_24043 ?auto_24080 ) ) ( not ( = ?auto_24044 ?auto_24049 ) ) ( not ( = ?auto_24044 ?auto_24080 ) ) ( not ( = ?auto_24045 ?auto_24049 ) ) ( not ( = ?auto_24045 ?auto_24080 ) ) ( not ( = ?auto_24046 ?auto_24049 ) ) ( not ( = ?auto_24046 ?auto_24080 ) ) ( not ( = ?auto_24047 ?auto_24049 ) ) ( not ( = ?auto_24047 ?auto_24080 ) ) ( not ( = ?auto_24048 ?auto_24049 ) ) ( not ( = ?auto_24048 ?auto_24080 ) ) ( not ( = ?auto_24051 ?auto_24049 ) ) ( not ( = ?auto_24051 ?auto_24080 ) ) ( not ( = ?auto_24049 ?auto_24078 ) ) ( not ( = ?auto_24049 ?auto_24076 ) ) ( not ( = ?auto_24049 ?auto_24070 ) ) ( not ( = ?auto_24049 ?auto_24064 ) ) ( not ( = ?auto_24049 ?auto_24071 ) ) ( not ( = ?auto_24049 ?auto_24079 ) ) ( not ( = ?auto_24049 ?auto_24067 ) ) ( not ( = ?auto_24080 ?auto_24078 ) ) ( not ( = ?auto_24080 ?auto_24076 ) ) ( not ( = ?auto_24080 ?auto_24070 ) ) ( not ( = ?auto_24080 ?auto_24064 ) ) ( not ( = ?auto_24080 ?auto_24071 ) ) ( not ( = ?auto_24080 ?auto_24079 ) ) ( not ( = ?auto_24080 ?auto_24067 ) ) ( not ( = ?auto_24043 ?auto_24052 ) ) ( not ( = ?auto_24043 ?auto_24063 ) ) ( not ( = ?auto_24044 ?auto_24052 ) ) ( not ( = ?auto_24044 ?auto_24063 ) ) ( not ( = ?auto_24045 ?auto_24052 ) ) ( not ( = ?auto_24045 ?auto_24063 ) ) ( not ( = ?auto_24046 ?auto_24052 ) ) ( not ( = ?auto_24046 ?auto_24063 ) ) ( not ( = ?auto_24047 ?auto_24052 ) ) ( not ( = ?auto_24047 ?auto_24063 ) ) ( not ( = ?auto_24048 ?auto_24052 ) ) ( not ( = ?auto_24048 ?auto_24063 ) ) ( not ( = ?auto_24051 ?auto_24052 ) ) ( not ( = ?auto_24051 ?auto_24063 ) ) ( not ( = ?auto_24050 ?auto_24052 ) ) ( not ( = ?auto_24050 ?auto_24063 ) ) ( not ( = ?auto_24052 ?auto_24080 ) ) ( not ( = ?auto_24052 ?auto_24078 ) ) ( not ( = ?auto_24052 ?auto_24076 ) ) ( not ( = ?auto_24052 ?auto_24070 ) ) ( not ( = ?auto_24052 ?auto_24064 ) ) ( not ( = ?auto_24052 ?auto_24071 ) ) ( not ( = ?auto_24052 ?auto_24079 ) ) ( not ( = ?auto_24052 ?auto_24067 ) ) ( not ( = ?auto_24063 ?auto_24080 ) ) ( not ( = ?auto_24063 ?auto_24078 ) ) ( not ( = ?auto_24063 ?auto_24076 ) ) ( not ( = ?auto_24063 ?auto_24070 ) ) ( not ( = ?auto_24063 ?auto_24064 ) ) ( not ( = ?auto_24063 ?auto_24071 ) ) ( not ( = ?auto_24063 ?auto_24079 ) ) ( not ( = ?auto_24063 ?auto_24067 ) ) ( not ( = ?auto_24043 ?auto_24054 ) ) ( not ( = ?auto_24043 ?auto_24065 ) ) ( not ( = ?auto_24044 ?auto_24054 ) ) ( not ( = ?auto_24044 ?auto_24065 ) ) ( not ( = ?auto_24045 ?auto_24054 ) ) ( not ( = ?auto_24045 ?auto_24065 ) ) ( not ( = ?auto_24046 ?auto_24054 ) ) ( not ( = ?auto_24046 ?auto_24065 ) ) ( not ( = ?auto_24047 ?auto_24054 ) ) ( not ( = ?auto_24047 ?auto_24065 ) ) ( not ( = ?auto_24048 ?auto_24054 ) ) ( not ( = ?auto_24048 ?auto_24065 ) ) ( not ( = ?auto_24051 ?auto_24054 ) ) ( not ( = ?auto_24051 ?auto_24065 ) ) ( not ( = ?auto_24050 ?auto_24054 ) ) ( not ( = ?auto_24050 ?auto_24065 ) ) ( not ( = ?auto_24049 ?auto_24054 ) ) ( not ( = ?auto_24049 ?auto_24065 ) ) ( not ( = ?auto_24054 ?auto_24063 ) ) ( not ( = ?auto_24054 ?auto_24080 ) ) ( not ( = ?auto_24054 ?auto_24078 ) ) ( not ( = ?auto_24054 ?auto_24076 ) ) ( not ( = ?auto_24054 ?auto_24070 ) ) ( not ( = ?auto_24054 ?auto_24064 ) ) ( not ( = ?auto_24054 ?auto_24071 ) ) ( not ( = ?auto_24054 ?auto_24079 ) ) ( not ( = ?auto_24054 ?auto_24067 ) ) ( not ( = ?auto_24075 ?auto_24072 ) ) ( not ( = ?auto_24075 ?auto_24061 ) ) ( not ( = ?auto_24075 ?auto_24056 ) ) ( not ( = ?auto_24075 ?auto_24068 ) ) ( not ( = ?auto_24075 ?auto_24062 ) ) ( not ( = ?auto_24066 ?auto_24073 ) ) ( not ( = ?auto_24066 ?auto_24074 ) ) ( not ( = ?auto_24066 ?auto_24055 ) ) ( not ( = ?auto_24066 ?auto_24069 ) ) ( not ( = ?auto_24066 ?auto_24077 ) ) ( not ( = ?auto_24065 ?auto_24063 ) ) ( not ( = ?auto_24065 ?auto_24080 ) ) ( not ( = ?auto_24065 ?auto_24078 ) ) ( not ( = ?auto_24065 ?auto_24076 ) ) ( not ( = ?auto_24065 ?auto_24070 ) ) ( not ( = ?auto_24065 ?auto_24064 ) ) ( not ( = ?auto_24065 ?auto_24071 ) ) ( not ( = ?auto_24065 ?auto_24079 ) ) ( not ( = ?auto_24065 ?auto_24067 ) ) ( not ( = ?auto_24043 ?auto_24053 ) ) ( not ( = ?auto_24043 ?auto_24058 ) ) ( not ( = ?auto_24044 ?auto_24053 ) ) ( not ( = ?auto_24044 ?auto_24058 ) ) ( not ( = ?auto_24045 ?auto_24053 ) ) ( not ( = ?auto_24045 ?auto_24058 ) ) ( not ( = ?auto_24046 ?auto_24053 ) ) ( not ( = ?auto_24046 ?auto_24058 ) ) ( not ( = ?auto_24047 ?auto_24053 ) ) ( not ( = ?auto_24047 ?auto_24058 ) ) ( not ( = ?auto_24048 ?auto_24053 ) ) ( not ( = ?auto_24048 ?auto_24058 ) ) ( not ( = ?auto_24051 ?auto_24053 ) ) ( not ( = ?auto_24051 ?auto_24058 ) ) ( not ( = ?auto_24050 ?auto_24053 ) ) ( not ( = ?auto_24050 ?auto_24058 ) ) ( not ( = ?auto_24049 ?auto_24053 ) ) ( not ( = ?auto_24049 ?auto_24058 ) ) ( not ( = ?auto_24052 ?auto_24053 ) ) ( not ( = ?auto_24052 ?auto_24058 ) ) ( not ( = ?auto_24053 ?auto_24065 ) ) ( not ( = ?auto_24053 ?auto_24063 ) ) ( not ( = ?auto_24053 ?auto_24080 ) ) ( not ( = ?auto_24053 ?auto_24078 ) ) ( not ( = ?auto_24053 ?auto_24076 ) ) ( not ( = ?auto_24053 ?auto_24070 ) ) ( not ( = ?auto_24053 ?auto_24064 ) ) ( not ( = ?auto_24053 ?auto_24071 ) ) ( not ( = ?auto_24053 ?auto_24079 ) ) ( not ( = ?auto_24053 ?auto_24067 ) ) ( not ( = ?auto_24058 ?auto_24065 ) ) ( not ( = ?auto_24058 ?auto_24063 ) ) ( not ( = ?auto_24058 ?auto_24080 ) ) ( not ( = ?auto_24058 ?auto_24078 ) ) ( not ( = ?auto_24058 ?auto_24076 ) ) ( not ( = ?auto_24058 ?auto_24070 ) ) ( not ( = ?auto_24058 ?auto_24064 ) ) ( not ( = ?auto_24058 ?auto_24071 ) ) ( not ( = ?auto_24058 ?auto_24079 ) ) ( not ( = ?auto_24058 ?auto_24067 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_24043 ?auto_24044 ?auto_24045 ?auto_24046 ?auto_24047 ?auto_24048 ?auto_24051 ?auto_24050 ?auto_24049 ?auto_24052 ?auto_24054 )
      ( MAKE-1CRATE ?auto_24054 ?auto_24053 )
      ( MAKE-11CRATE-VERIFY ?auto_24043 ?auto_24044 ?auto_24045 ?auto_24046 ?auto_24047 ?auto_24048 ?auto_24051 ?auto_24050 ?auto_24049 ?auto_24052 ?auto_24054 ?auto_24053 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24083 - SURFACE
      ?auto_24084 - SURFACE
    )
    :vars
    (
      ?auto_24085 - HOIST
      ?auto_24086 - PLACE
      ?auto_24088 - PLACE
      ?auto_24089 - HOIST
      ?auto_24090 - SURFACE
      ?auto_24087 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24085 ?auto_24086 ) ( SURFACE-AT ?auto_24083 ?auto_24086 ) ( CLEAR ?auto_24083 ) ( IS-CRATE ?auto_24084 ) ( AVAILABLE ?auto_24085 ) ( not ( = ?auto_24088 ?auto_24086 ) ) ( HOIST-AT ?auto_24089 ?auto_24088 ) ( AVAILABLE ?auto_24089 ) ( SURFACE-AT ?auto_24084 ?auto_24088 ) ( ON ?auto_24084 ?auto_24090 ) ( CLEAR ?auto_24084 ) ( TRUCK-AT ?auto_24087 ?auto_24086 ) ( not ( = ?auto_24083 ?auto_24084 ) ) ( not ( = ?auto_24083 ?auto_24090 ) ) ( not ( = ?auto_24084 ?auto_24090 ) ) ( not ( = ?auto_24085 ?auto_24089 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24087 ?auto_24086 ?auto_24088 )
      ( !LIFT ?auto_24089 ?auto_24084 ?auto_24090 ?auto_24088 )
      ( !LOAD ?auto_24089 ?auto_24084 ?auto_24087 ?auto_24088 )
      ( !DRIVE ?auto_24087 ?auto_24088 ?auto_24086 )
      ( !UNLOAD ?auto_24085 ?auto_24084 ?auto_24087 ?auto_24086 )
      ( !DROP ?auto_24085 ?auto_24084 ?auto_24083 ?auto_24086 )
      ( MAKE-1CRATE-VERIFY ?auto_24083 ?auto_24084 ) )
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
      ?auto_24112 - SURFACE
      ?auto_24111 - SURFACE
      ?auto_24110 - SURFACE
      ?auto_24113 - SURFACE
      ?auto_24115 - SURFACE
      ?auto_24114 - SURFACE
      ?auto_24116 - SURFACE
    )
    :vars
    (
      ?auto_24122 - HOIST
      ?auto_24121 - PLACE
      ?auto_24119 - PLACE
      ?auto_24120 - HOIST
      ?auto_24118 - SURFACE
      ?auto_24134 - PLACE
      ?auto_24125 - HOIST
      ?auto_24144 - SURFACE
      ?auto_24127 - PLACE
      ?auto_24135 - HOIST
      ?auto_24138 - SURFACE
      ?auto_24137 - PLACE
      ?auto_24123 - HOIST
      ?auto_24139 - SURFACE
      ?auto_24130 - PLACE
      ?auto_24132 - HOIST
      ?auto_24136 - SURFACE
      ?auto_24142 - SURFACE
      ?auto_24145 - SURFACE
      ?auto_24143 - PLACE
      ?auto_24133 - HOIST
      ?auto_24126 - SURFACE
      ?auto_24129 - SURFACE
      ?auto_24124 - SURFACE
      ?auto_24128 - SURFACE
      ?auto_24131 - PLACE
      ?auto_24140 - HOIST
      ?auto_24141 - SURFACE
      ?auto_24117 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24122 ?auto_24121 ) ( IS-CRATE ?auto_24116 ) ( not ( = ?auto_24119 ?auto_24121 ) ) ( HOIST-AT ?auto_24120 ?auto_24119 ) ( AVAILABLE ?auto_24120 ) ( SURFACE-AT ?auto_24116 ?auto_24119 ) ( ON ?auto_24116 ?auto_24118 ) ( CLEAR ?auto_24116 ) ( not ( = ?auto_24114 ?auto_24116 ) ) ( not ( = ?auto_24114 ?auto_24118 ) ) ( not ( = ?auto_24116 ?auto_24118 ) ) ( not ( = ?auto_24122 ?auto_24120 ) ) ( IS-CRATE ?auto_24114 ) ( not ( = ?auto_24134 ?auto_24121 ) ) ( HOIST-AT ?auto_24125 ?auto_24134 ) ( SURFACE-AT ?auto_24114 ?auto_24134 ) ( ON ?auto_24114 ?auto_24144 ) ( CLEAR ?auto_24114 ) ( not ( = ?auto_24115 ?auto_24114 ) ) ( not ( = ?auto_24115 ?auto_24144 ) ) ( not ( = ?auto_24114 ?auto_24144 ) ) ( not ( = ?auto_24122 ?auto_24125 ) ) ( IS-CRATE ?auto_24115 ) ( not ( = ?auto_24127 ?auto_24121 ) ) ( HOIST-AT ?auto_24135 ?auto_24127 ) ( AVAILABLE ?auto_24135 ) ( SURFACE-AT ?auto_24115 ?auto_24127 ) ( ON ?auto_24115 ?auto_24138 ) ( CLEAR ?auto_24115 ) ( not ( = ?auto_24113 ?auto_24115 ) ) ( not ( = ?auto_24113 ?auto_24138 ) ) ( not ( = ?auto_24115 ?auto_24138 ) ) ( not ( = ?auto_24122 ?auto_24135 ) ) ( IS-CRATE ?auto_24113 ) ( not ( = ?auto_24137 ?auto_24121 ) ) ( HOIST-AT ?auto_24123 ?auto_24137 ) ( SURFACE-AT ?auto_24113 ?auto_24137 ) ( ON ?auto_24113 ?auto_24139 ) ( CLEAR ?auto_24113 ) ( not ( = ?auto_24110 ?auto_24113 ) ) ( not ( = ?auto_24110 ?auto_24139 ) ) ( not ( = ?auto_24113 ?auto_24139 ) ) ( not ( = ?auto_24122 ?auto_24123 ) ) ( IS-CRATE ?auto_24110 ) ( not ( = ?auto_24130 ?auto_24121 ) ) ( HOIST-AT ?auto_24132 ?auto_24130 ) ( SURFACE-AT ?auto_24110 ?auto_24130 ) ( ON ?auto_24110 ?auto_24136 ) ( CLEAR ?auto_24110 ) ( not ( = ?auto_24111 ?auto_24110 ) ) ( not ( = ?auto_24111 ?auto_24136 ) ) ( not ( = ?auto_24110 ?auto_24136 ) ) ( not ( = ?auto_24122 ?auto_24132 ) ) ( IS-CRATE ?auto_24111 ) ( SURFACE-AT ?auto_24111 ?auto_24134 ) ( ON ?auto_24111 ?auto_24142 ) ( CLEAR ?auto_24111 ) ( not ( = ?auto_24112 ?auto_24111 ) ) ( not ( = ?auto_24112 ?auto_24142 ) ) ( not ( = ?auto_24111 ?auto_24142 ) ) ( IS-CRATE ?auto_24112 ) ( AVAILABLE ?auto_24132 ) ( SURFACE-AT ?auto_24112 ?auto_24130 ) ( ON ?auto_24112 ?auto_24145 ) ( CLEAR ?auto_24112 ) ( not ( = ?auto_24109 ?auto_24112 ) ) ( not ( = ?auto_24109 ?auto_24145 ) ) ( not ( = ?auto_24112 ?auto_24145 ) ) ( IS-CRATE ?auto_24109 ) ( not ( = ?auto_24143 ?auto_24121 ) ) ( HOIST-AT ?auto_24133 ?auto_24143 ) ( SURFACE-AT ?auto_24109 ?auto_24143 ) ( ON ?auto_24109 ?auto_24126 ) ( CLEAR ?auto_24109 ) ( not ( = ?auto_24108 ?auto_24109 ) ) ( not ( = ?auto_24108 ?auto_24126 ) ) ( not ( = ?auto_24109 ?auto_24126 ) ) ( not ( = ?auto_24122 ?auto_24133 ) ) ( IS-CRATE ?auto_24108 ) ( AVAILABLE ?auto_24123 ) ( SURFACE-AT ?auto_24108 ?auto_24137 ) ( ON ?auto_24108 ?auto_24129 ) ( CLEAR ?auto_24108 ) ( not ( = ?auto_24107 ?auto_24108 ) ) ( not ( = ?auto_24107 ?auto_24129 ) ) ( not ( = ?auto_24108 ?auto_24129 ) ) ( IS-CRATE ?auto_24107 ) ( AVAILABLE ?auto_24133 ) ( SURFACE-AT ?auto_24107 ?auto_24143 ) ( ON ?auto_24107 ?auto_24124 ) ( CLEAR ?auto_24107 ) ( not ( = ?auto_24106 ?auto_24107 ) ) ( not ( = ?auto_24106 ?auto_24124 ) ) ( not ( = ?auto_24107 ?auto_24124 ) ) ( IS-CRATE ?auto_24106 ) ( AVAILABLE ?auto_24125 ) ( SURFACE-AT ?auto_24106 ?auto_24134 ) ( ON ?auto_24106 ?auto_24128 ) ( CLEAR ?auto_24106 ) ( not ( = ?auto_24105 ?auto_24106 ) ) ( not ( = ?auto_24105 ?auto_24128 ) ) ( not ( = ?auto_24106 ?auto_24128 ) ) ( SURFACE-AT ?auto_24104 ?auto_24121 ) ( CLEAR ?auto_24104 ) ( IS-CRATE ?auto_24105 ) ( AVAILABLE ?auto_24122 ) ( not ( = ?auto_24131 ?auto_24121 ) ) ( HOIST-AT ?auto_24140 ?auto_24131 ) ( AVAILABLE ?auto_24140 ) ( SURFACE-AT ?auto_24105 ?auto_24131 ) ( ON ?auto_24105 ?auto_24141 ) ( CLEAR ?auto_24105 ) ( TRUCK-AT ?auto_24117 ?auto_24121 ) ( not ( = ?auto_24104 ?auto_24105 ) ) ( not ( = ?auto_24104 ?auto_24141 ) ) ( not ( = ?auto_24105 ?auto_24141 ) ) ( not ( = ?auto_24122 ?auto_24140 ) ) ( not ( = ?auto_24104 ?auto_24106 ) ) ( not ( = ?auto_24104 ?auto_24128 ) ) ( not ( = ?auto_24106 ?auto_24141 ) ) ( not ( = ?auto_24134 ?auto_24131 ) ) ( not ( = ?auto_24125 ?auto_24140 ) ) ( not ( = ?auto_24128 ?auto_24141 ) ) ( not ( = ?auto_24104 ?auto_24107 ) ) ( not ( = ?auto_24104 ?auto_24124 ) ) ( not ( = ?auto_24105 ?auto_24107 ) ) ( not ( = ?auto_24105 ?auto_24124 ) ) ( not ( = ?auto_24107 ?auto_24128 ) ) ( not ( = ?auto_24107 ?auto_24141 ) ) ( not ( = ?auto_24143 ?auto_24134 ) ) ( not ( = ?auto_24143 ?auto_24131 ) ) ( not ( = ?auto_24133 ?auto_24125 ) ) ( not ( = ?auto_24133 ?auto_24140 ) ) ( not ( = ?auto_24124 ?auto_24128 ) ) ( not ( = ?auto_24124 ?auto_24141 ) ) ( not ( = ?auto_24104 ?auto_24108 ) ) ( not ( = ?auto_24104 ?auto_24129 ) ) ( not ( = ?auto_24105 ?auto_24108 ) ) ( not ( = ?auto_24105 ?auto_24129 ) ) ( not ( = ?auto_24106 ?auto_24108 ) ) ( not ( = ?auto_24106 ?auto_24129 ) ) ( not ( = ?auto_24108 ?auto_24124 ) ) ( not ( = ?auto_24108 ?auto_24128 ) ) ( not ( = ?auto_24108 ?auto_24141 ) ) ( not ( = ?auto_24137 ?auto_24143 ) ) ( not ( = ?auto_24137 ?auto_24134 ) ) ( not ( = ?auto_24137 ?auto_24131 ) ) ( not ( = ?auto_24123 ?auto_24133 ) ) ( not ( = ?auto_24123 ?auto_24125 ) ) ( not ( = ?auto_24123 ?auto_24140 ) ) ( not ( = ?auto_24129 ?auto_24124 ) ) ( not ( = ?auto_24129 ?auto_24128 ) ) ( not ( = ?auto_24129 ?auto_24141 ) ) ( not ( = ?auto_24104 ?auto_24109 ) ) ( not ( = ?auto_24104 ?auto_24126 ) ) ( not ( = ?auto_24105 ?auto_24109 ) ) ( not ( = ?auto_24105 ?auto_24126 ) ) ( not ( = ?auto_24106 ?auto_24109 ) ) ( not ( = ?auto_24106 ?auto_24126 ) ) ( not ( = ?auto_24107 ?auto_24109 ) ) ( not ( = ?auto_24107 ?auto_24126 ) ) ( not ( = ?auto_24109 ?auto_24129 ) ) ( not ( = ?auto_24109 ?auto_24124 ) ) ( not ( = ?auto_24109 ?auto_24128 ) ) ( not ( = ?auto_24109 ?auto_24141 ) ) ( not ( = ?auto_24126 ?auto_24129 ) ) ( not ( = ?auto_24126 ?auto_24124 ) ) ( not ( = ?auto_24126 ?auto_24128 ) ) ( not ( = ?auto_24126 ?auto_24141 ) ) ( not ( = ?auto_24104 ?auto_24112 ) ) ( not ( = ?auto_24104 ?auto_24145 ) ) ( not ( = ?auto_24105 ?auto_24112 ) ) ( not ( = ?auto_24105 ?auto_24145 ) ) ( not ( = ?auto_24106 ?auto_24112 ) ) ( not ( = ?auto_24106 ?auto_24145 ) ) ( not ( = ?auto_24107 ?auto_24112 ) ) ( not ( = ?auto_24107 ?auto_24145 ) ) ( not ( = ?auto_24108 ?auto_24112 ) ) ( not ( = ?auto_24108 ?auto_24145 ) ) ( not ( = ?auto_24112 ?auto_24126 ) ) ( not ( = ?auto_24112 ?auto_24129 ) ) ( not ( = ?auto_24112 ?auto_24124 ) ) ( not ( = ?auto_24112 ?auto_24128 ) ) ( not ( = ?auto_24112 ?auto_24141 ) ) ( not ( = ?auto_24130 ?auto_24143 ) ) ( not ( = ?auto_24130 ?auto_24137 ) ) ( not ( = ?auto_24130 ?auto_24134 ) ) ( not ( = ?auto_24130 ?auto_24131 ) ) ( not ( = ?auto_24132 ?auto_24133 ) ) ( not ( = ?auto_24132 ?auto_24123 ) ) ( not ( = ?auto_24132 ?auto_24125 ) ) ( not ( = ?auto_24132 ?auto_24140 ) ) ( not ( = ?auto_24145 ?auto_24126 ) ) ( not ( = ?auto_24145 ?auto_24129 ) ) ( not ( = ?auto_24145 ?auto_24124 ) ) ( not ( = ?auto_24145 ?auto_24128 ) ) ( not ( = ?auto_24145 ?auto_24141 ) ) ( not ( = ?auto_24104 ?auto_24111 ) ) ( not ( = ?auto_24104 ?auto_24142 ) ) ( not ( = ?auto_24105 ?auto_24111 ) ) ( not ( = ?auto_24105 ?auto_24142 ) ) ( not ( = ?auto_24106 ?auto_24111 ) ) ( not ( = ?auto_24106 ?auto_24142 ) ) ( not ( = ?auto_24107 ?auto_24111 ) ) ( not ( = ?auto_24107 ?auto_24142 ) ) ( not ( = ?auto_24108 ?auto_24111 ) ) ( not ( = ?auto_24108 ?auto_24142 ) ) ( not ( = ?auto_24109 ?auto_24111 ) ) ( not ( = ?auto_24109 ?auto_24142 ) ) ( not ( = ?auto_24111 ?auto_24145 ) ) ( not ( = ?auto_24111 ?auto_24126 ) ) ( not ( = ?auto_24111 ?auto_24129 ) ) ( not ( = ?auto_24111 ?auto_24124 ) ) ( not ( = ?auto_24111 ?auto_24128 ) ) ( not ( = ?auto_24111 ?auto_24141 ) ) ( not ( = ?auto_24142 ?auto_24145 ) ) ( not ( = ?auto_24142 ?auto_24126 ) ) ( not ( = ?auto_24142 ?auto_24129 ) ) ( not ( = ?auto_24142 ?auto_24124 ) ) ( not ( = ?auto_24142 ?auto_24128 ) ) ( not ( = ?auto_24142 ?auto_24141 ) ) ( not ( = ?auto_24104 ?auto_24110 ) ) ( not ( = ?auto_24104 ?auto_24136 ) ) ( not ( = ?auto_24105 ?auto_24110 ) ) ( not ( = ?auto_24105 ?auto_24136 ) ) ( not ( = ?auto_24106 ?auto_24110 ) ) ( not ( = ?auto_24106 ?auto_24136 ) ) ( not ( = ?auto_24107 ?auto_24110 ) ) ( not ( = ?auto_24107 ?auto_24136 ) ) ( not ( = ?auto_24108 ?auto_24110 ) ) ( not ( = ?auto_24108 ?auto_24136 ) ) ( not ( = ?auto_24109 ?auto_24110 ) ) ( not ( = ?auto_24109 ?auto_24136 ) ) ( not ( = ?auto_24112 ?auto_24110 ) ) ( not ( = ?auto_24112 ?auto_24136 ) ) ( not ( = ?auto_24110 ?auto_24142 ) ) ( not ( = ?auto_24110 ?auto_24145 ) ) ( not ( = ?auto_24110 ?auto_24126 ) ) ( not ( = ?auto_24110 ?auto_24129 ) ) ( not ( = ?auto_24110 ?auto_24124 ) ) ( not ( = ?auto_24110 ?auto_24128 ) ) ( not ( = ?auto_24110 ?auto_24141 ) ) ( not ( = ?auto_24136 ?auto_24142 ) ) ( not ( = ?auto_24136 ?auto_24145 ) ) ( not ( = ?auto_24136 ?auto_24126 ) ) ( not ( = ?auto_24136 ?auto_24129 ) ) ( not ( = ?auto_24136 ?auto_24124 ) ) ( not ( = ?auto_24136 ?auto_24128 ) ) ( not ( = ?auto_24136 ?auto_24141 ) ) ( not ( = ?auto_24104 ?auto_24113 ) ) ( not ( = ?auto_24104 ?auto_24139 ) ) ( not ( = ?auto_24105 ?auto_24113 ) ) ( not ( = ?auto_24105 ?auto_24139 ) ) ( not ( = ?auto_24106 ?auto_24113 ) ) ( not ( = ?auto_24106 ?auto_24139 ) ) ( not ( = ?auto_24107 ?auto_24113 ) ) ( not ( = ?auto_24107 ?auto_24139 ) ) ( not ( = ?auto_24108 ?auto_24113 ) ) ( not ( = ?auto_24108 ?auto_24139 ) ) ( not ( = ?auto_24109 ?auto_24113 ) ) ( not ( = ?auto_24109 ?auto_24139 ) ) ( not ( = ?auto_24112 ?auto_24113 ) ) ( not ( = ?auto_24112 ?auto_24139 ) ) ( not ( = ?auto_24111 ?auto_24113 ) ) ( not ( = ?auto_24111 ?auto_24139 ) ) ( not ( = ?auto_24113 ?auto_24136 ) ) ( not ( = ?auto_24113 ?auto_24142 ) ) ( not ( = ?auto_24113 ?auto_24145 ) ) ( not ( = ?auto_24113 ?auto_24126 ) ) ( not ( = ?auto_24113 ?auto_24129 ) ) ( not ( = ?auto_24113 ?auto_24124 ) ) ( not ( = ?auto_24113 ?auto_24128 ) ) ( not ( = ?auto_24113 ?auto_24141 ) ) ( not ( = ?auto_24139 ?auto_24136 ) ) ( not ( = ?auto_24139 ?auto_24142 ) ) ( not ( = ?auto_24139 ?auto_24145 ) ) ( not ( = ?auto_24139 ?auto_24126 ) ) ( not ( = ?auto_24139 ?auto_24129 ) ) ( not ( = ?auto_24139 ?auto_24124 ) ) ( not ( = ?auto_24139 ?auto_24128 ) ) ( not ( = ?auto_24139 ?auto_24141 ) ) ( not ( = ?auto_24104 ?auto_24115 ) ) ( not ( = ?auto_24104 ?auto_24138 ) ) ( not ( = ?auto_24105 ?auto_24115 ) ) ( not ( = ?auto_24105 ?auto_24138 ) ) ( not ( = ?auto_24106 ?auto_24115 ) ) ( not ( = ?auto_24106 ?auto_24138 ) ) ( not ( = ?auto_24107 ?auto_24115 ) ) ( not ( = ?auto_24107 ?auto_24138 ) ) ( not ( = ?auto_24108 ?auto_24115 ) ) ( not ( = ?auto_24108 ?auto_24138 ) ) ( not ( = ?auto_24109 ?auto_24115 ) ) ( not ( = ?auto_24109 ?auto_24138 ) ) ( not ( = ?auto_24112 ?auto_24115 ) ) ( not ( = ?auto_24112 ?auto_24138 ) ) ( not ( = ?auto_24111 ?auto_24115 ) ) ( not ( = ?auto_24111 ?auto_24138 ) ) ( not ( = ?auto_24110 ?auto_24115 ) ) ( not ( = ?auto_24110 ?auto_24138 ) ) ( not ( = ?auto_24115 ?auto_24139 ) ) ( not ( = ?auto_24115 ?auto_24136 ) ) ( not ( = ?auto_24115 ?auto_24142 ) ) ( not ( = ?auto_24115 ?auto_24145 ) ) ( not ( = ?auto_24115 ?auto_24126 ) ) ( not ( = ?auto_24115 ?auto_24129 ) ) ( not ( = ?auto_24115 ?auto_24124 ) ) ( not ( = ?auto_24115 ?auto_24128 ) ) ( not ( = ?auto_24115 ?auto_24141 ) ) ( not ( = ?auto_24127 ?auto_24137 ) ) ( not ( = ?auto_24127 ?auto_24130 ) ) ( not ( = ?auto_24127 ?auto_24134 ) ) ( not ( = ?auto_24127 ?auto_24143 ) ) ( not ( = ?auto_24127 ?auto_24131 ) ) ( not ( = ?auto_24135 ?auto_24123 ) ) ( not ( = ?auto_24135 ?auto_24132 ) ) ( not ( = ?auto_24135 ?auto_24125 ) ) ( not ( = ?auto_24135 ?auto_24133 ) ) ( not ( = ?auto_24135 ?auto_24140 ) ) ( not ( = ?auto_24138 ?auto_24139 ) ) ( not ( = ?auto_24138 ?auto_24136 ) ) ( not ( = ?auto_24138 ?auto_24142 ) ) ( not ( = ?auto_24138 ?auto_24145 ) ) ( not ( = ?auto_24138 ?auto_24126 ) ) ( not ( = ?auto_24138 ?auto_24129 ) ) ( not ( = ?auto_24138 ?auto_24124 ) ) ( not ( = ?auto_24138 ?auto_24128 ) ) ( not ( = ?auto_24138 ?auto_24141 ) ) ( not ( = ?auto_24104 ?auto_24114 ) ) ( not ( = ?auto_24104 ?auto_24144 ) ) ( not ( = ?auto_24105 ?auto_24114 ) ) ( not ( = ?auto_24105 ?auto_24144 ) ) ( not ( = ?auto_24106 ?auto_24114 ) ) ( not ( = ?auto_24106 ?auto_24144 ) ) ( not ( = ?auto_24107 ?auto_24114 ) ) ( not ( = ?auto_24107 ?auto_24144 ) ) ( not ( = ?auto_24108 ?auto_24114 ) ) ( not ( = ?auto_24108 ?auto_24144 ) ) ( not ( = ?auto_24109 ?auto_24114 ) ) ( not ( = ?auto_24109 ?auto_24144 ) ) ( not ( = ?auto_24112 ?auto_24114 ) ) ( not ( = ?auto_24112 ?auto_24144 ) ) ( not ( = ?auto_24111 ?auto_24114 ) ) ( not ( = ?auto_24111 ?auto_24144 ) ) ( not ( = ?auto_24110 ?auto_24114 ) ) ( not ( = ?auto_24110 ?auto_24144 ) ) ( not ( = ?auto_24113 ?auto_24114 ) ) ( not ( = ?auto_24113 ?auto_24144 ) ) ( not ( = ?auto_24114 ?auto_24138 ) ) ( not ( = ?auto_24114 ?auto_24139 ) ) ( not ( = ?auto_24114 ?auto_24136 ) ) ( not ( = ?auto_24114 ?auto_24142 ) ) ( not ( = ?auto_24114 ?auto_24145 ) ) ( not ( = ?auto_24114 ?auto_24126 ) ) ( not ( = ?auto_24114 ?auto_24129 ) ) ( not ( = ?auto_24114 ?auto_24124 ) ) ( not ( = ?auto_24114 ?auto_24128 ) ) ( not ( = ?auto_24114 ?auto_24141 ) ) ( not ( = ?auto_24144 ?auto_24138 ) ) ( not ( = ?auto_24144 ?auto_24139 ) ) ( not ( = ?auto_24144 ?auto_24136 ) ) ( not ( = ?auto_24144 ?auto_24142 ) ) ( not ( = ?auto_24144 ?auto_24145 ) ) ( not ( = ?auto_24144 ?auto_24126 ) ) ( not ( = ?auto_24144 ?auto_24129 ) ) ( not ( = ?auto_24144 ?auto_24124 ) ) ( not ( = ?auto_24144 ?auto_24128 ) ) ( not ( = ?auto_24144 ?auto_24141 ) ) ( not ( = ?auto_24104 ?auto_24116 ) ) ( not ( = ?auto_24104 ?auto_24118 ) ) ( not ( = ?auto_24105 ?auto_24116 ) ) ( not ( = ?auto_24105 ?auto_24118 ) ) ( not ( = ?auto_24106 ?auto_24116 ) ) ( not ( = ?auto_24106 ?auto_24118 ) ) ( not ( = ?auto_24107 ?auto_24116 ) ) ( not ( = ?auto_24107 ?auto_24118 ) ) ( not ( = ?auto_24108 ?auto_24116 ) ) ( not ( = ?auto_24108 ?auto_24118 ) ) ( not ( = ?auto_24109 ?auto_24116 ) ) ( not ( = ?auto_24109 ?auto_24118 ) ) ( not ( = ?auto_24112 ?auto_24116 ) ) ( not ( = ?auto_24112 ?auto_24118 ) ) ( not ( = ?auto_24111 ?auto_24116 ) ) ( not ( = ?auto_24111 ?auto_24118 ) ) ( not ( = ?auto_24110 ?auto_24116 ) ) ( not ( = ?auto_24110 ?auto_24118 ) ) ( not ( = ?auto_24113 ?auto_24116 ) ) ( not ( = ?auto_24113 ?auto_24118 ) ) ( not ( = ?auto_24115 ?auto_24116 ) ) ( not ( = ?auto_24115 ?auto_24118 ) ) ( not ( = ?auto_24116 ?auto_24144 ) ) ( not ( = ?auto_24116 ?auto_24138 ) ) ( not ( = ?auto_24116 ?auto_24139 ) ) ( not ( = ?auto_24116 ?auto_24136 ) ) ( not ( = ?auto_24116 ?auto_24142 ) ) ( not ( = ?auto_24116 ?auto_24145 ) ) ( not ( = ?auto_24116 ?auto_24126 ) ) ( not ( = ?auto_24116 ?auto_24129 ) ) ( not ( = ?auto_24116 ?auto_24124 ) ) ( not ( = ?auto_24116 ?auto_24128 ) ) ( not ( = ?auto_24116 ?auto_24141 ) ) ( not ( = ?auto_24119 ?auto_24134 ) ) ( not ( = ?auto_24119 ?auto_24127 ) ) ( not ( = ?auto_24119 ?auto_24137 ) ) ( not ( = ?auto_24119 ?auto_24130 ) ) ( not ( = ?auto_24119 ?auto_24143 ) ) ( not ( = ?auto_24119 ?auto_24131 ) ) ( not ( = ?auto_24120 ?auto_24125 ) ) ( not ( = ?auto_24120 ?auto_24135 ) ) ( not ( = ?auto_24120 ?auto_24123 ) ) ( not ( = ?auto_24120 ?auto_24132 ) ) ( not ( = ?auto_24120 ?auto_24133 ) ) ( not ( = ?auto_24120 ?auto_24140 ) ) ( not ( = ?auto_24118 ?auto_24144 ) ) ( not ( = ?auto_24118 ?auto_24138 ) ) ( not ( = ?auto_24118 ?auto_24139 ) ) ( not ( = ?auto_24118 ?auto_24136 ) ) ( not ( = ?auto_24118 ?auto_24142 ) ) ( not ( = ?auto_24118 ?auto_24145 ) ) ( not ( = ?auto_24118 ?auto_24126 ) ) ( not ( = ?auto_24118 ?auto_24129 ) ) ( not ( = ?auto_24118 ?auto_24124 ) ) ( not ( = ?auto_24118 ?auto_24128 ) ) ( not ( = ?auto_24118 ?auto_24141 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_24104 ?auto_24105 ?auto_24106 ?auto_24107 ?auto_24108 ?auto_24109 ?auto_24112 ?auto_24111 ?auto_24110 ?auto_24113 ?auto_24115 ?auto_24114 )
      ( MAKE-1CRATE ?auto_24114 ?auto_24116 )
      ( MAKE-12CRATE-VERIFY ?auto_24104 ?auto_24105 ?auto_24106 ?auto_24107 ?auto_24108 ?auto_24109 ?auto_24112 ?auto_24111 ?auto_24110 ?auto_24113 ?auto_24115 ?auto_24114 ?auto_24116 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24148 - SURFACE
      ?auto_24149 - SURFACE
    )
    :vars
    (
      ?auto_24150 - HOIST
      ?auto_24151 - PLACE
      ?auto_24153 - PLACE
      ?auto_24154 - HOIST
      ?auto_24155 - SURFACE
      ?auto_24152 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24150 ?auto_24151 ) ( SURFACE-AT ?auto_24148 ?auto_24151 ) ( CLEAR ?auto_24148 ) ( IS-CRATE ?auto_24149 ) ( AVAILABLE ?auto_24150 ) ( not ( = ?auto_24153 ?auto_24151 ) ) ( HOIST-AT ?auto_24154 ?auto_24153 ) ( AVAILABLE ?auto_24154 ) ( SURFACE-AT ?auto_24149 ?auto_24153 ) ( ON ?auto_24149 ?auto_24155 ) ( CLEAR ?auto_24149 ) ( TRUCK-AT ?auto_24152 ?auto_24151 ) ( not ( = ?auto_24148 ?auto_24149 ) ) ( not ( = ?auto_24148 ?auto_24155 ) ) ( not ( = ?auto_24149 ?auto_24155 ) ) ( not ( = ?auto_24150 ?auto_24154 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24152 ?auto_24151 ?auto_24153 )
      ( !LIFT ?auto_24154 ?auto_24149 ?auto_24155 ?auto_24153 )
      ( !LOAD ?auto_24154 ?auto_24149 ?auto_24152 ?auto_24153 )
      ( !DRIVE ?auto_24152 ?auto_24153 ?auto_24151 )
      ( !UNLOAD ?auto_24150 ?auto_24149 ?auto_24152 ?auto_24151 )
      ( !DROP ?auto_24150 ?auto_24149 ?auto_24148 ?auto_24151 )
      ( MAKE-1CRATE-VERIFY ?auto_24148 ?auto_24149 ) )
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
      ?auto_24178 - SURFACE
      ?auto_24177 - SURFACE
      ?auto_24176 - SURFACE
      ?auto_24179 - SURFACE
      ?auto_24181 - SURFACE
      ?auto_24180 - SURFACE
      ?auto_24182 - SURFACE
      ?auto_24183 - SURFACE
    )
    :vars
    (
      ?auto_24186 - HOIST
      ?auto_24189 - PLACE
      ?auto_24187 - PLACE
      ?auto_24188 - HOIST
      ?auto_24185 - SURFACE
      ?auto_24192 - PLACE
      ?auto_24212 - HOIST
      ?auto_24198 - SURFACE
      ?auto_24201 - PLACE
      ?auto_24193 - HOIST
      ?auto_24199 - SURFACE
      ?auto_24200 - PLACE
      ?auto_24196 - HOIST
      ?auto_24204 - SURFACE
      ?auto_24197 - SURFACE
      ?auto_24211 - PLACE
      ?auto_24195 - HOIST
      ?auto_24210 - SURFACE
      ?auto_24209 - SURFACE
      ?auto_24208 - SURFACE
      ?auto_24202 - PLACE
      ?auto_24213 - HOIST
      ?auto_24190 - SURFACE
      ?auto_24206 - SURFACE
      ?auto_24205 - SURFACE
      ?auto_24194 - SURFACE
      ?auto_24203 - PLACE
      ?auto_24207 - HOIST
      ?auto_24191 - SURFACE
      ?auto_24184 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24186 ?auto_24189 ) ( IS-CRATE ?auto_24183 ) ( not ( = ?auto_24187 ?auto_24189 ) ) ( HOIST-AT ?auto_24188 ?auto_24187 ) ( SURFACE-AT ?auto_24183 ?auto_24187 ) ( ON ?auto_24183 ?auto_24185 ) ( CLEAR ?auto_24183 ) ( not ( = ?auto_24182 ?auto_24183 ) ) ( not ( = ?auto_24182 ?auto_24185 ) ) ( not ( = ?auto_24183 ?auto_24185 ) ) ( not ( = ?auto_24186 ?auto_24188 ) ) ( IS-CRATE ?auto_24182 ) ( not ( = ?auto_24192 ?auto_24189 ) ) ( HOIST-AT ?auto_24212 ?auto_24192 ) ( AVAILABLE ?auto_24212 ) ( SURFACE-AT ?auto_24182 ?auto_24192 ) ( ON ?auto_24182 ?auto_24198 ) ( CLEAR ?auto_24182 ) ( not ( = ?auto_24180 ?auto_24182 ) ) ( not ( = ?auto_24180 ?auto_24198 ) ) ( not ( = ?auto_24182 ?auto_24198 ) ) ( not ( = ?auto_24186 ?auto_24212 ) ) ( IS-CRATE ?auto_24180 ) ( not ( = ?auto_24201 ?auto_24189 ) ) ( HOIST-AT ?auto_24193 ?auto_24201 ) ( SURFACE-AT ?auto_24180 ?auto_24201 ) ( ON ?auto_24180 ?auto_24199 ) ( CLEAR ?auto_24180 ) ( not ( = ?auto_24181 ?auto_24180 ) ) ( not ( = ?auto_24181 ?auto_24199 ) ) ( not ( = ?auto_24180 ?auto_24199 ) ) ( not ( = ?auto_24186 ?auto_24193 ) ) ( IS-CRATE ?auto_24181 ) ( not ( = ?auto_24200 ?auto_24189 ) ) ( HOIST-AT ?auto_24196 ?auto_24200 ) ( AVAILABLE ?auto_24196 ) ( SURFACE-AT ?auto_24181 ?auto_24200 ) ( ON ?auto_24181 ?auto_24204 ) ( CLEAR ?auto_24181 ) ( not ( = ?auto_24179 ?auto_24181 ) ) ( not ( = ?auto_24179 ?auto_24204 ) ) ( not ( = ?auto_24181 ?auto_24204 ) ) ( not ( = ?auto_24186 ?auto_24196 ) ) ( IS-CRATE ?auto_24179 ) ( SURFACE-AT ?auto_24179 ?auto_24187 ) ( ON ?auto_24179 ?auto_24197 ) ( CLEAR ?auto_24179 ) ( not ( = ?auto_24176 ?auto_24179 ) ) ( not ( = ?auto_24176 ?auto_24197 ) ) ( not ( = ?auto_24179 ?auto_24197 ) ) ( IS-CRATE ?auto_24176 ) ( not ( = ?auto_24211 ?auto_24189 ) ) ( HOIST-AT ?auto_24195 ?auto_24211 ) ( SURFACE-AT ?auto_24176 ?auto_24211 ) ( ON ?auto_24176 ?auto_24210 ) ( CLEAR ?auto_24176 ) ( not ( = ?auto_24177 ?auto_24176 ) ) ( not ( = ?auto_24177 ?auto_24210 ) ) ( not ( = ?auto_24176 ?auto_24210 ) ) ( not ( = ?auto_24186 ?auto_24195 ) ) ( IS-CRATE ?auto_24177 ) ( SURFACE-AT ?auto_24177 ?auto_24201 ) ( ON ?auto_24177 ?auto_24209 ) ( CLEAR ?auto_24177 ) ( not ( = ?auto_24178 ?auto_24177 ) ) ( not ( = ?auto_24178 ?auto_24209 ) ) ( not ( = ?auto_24177 ?auto_24209 ) ) ( IS-CRATE ?auto_24178 ) ( AVAILABLE ?auto_24195 ) ( SURFACE-AT ?auto_24178 ?auto_24211 ) ( ON ?auto_24178 ?auto_24208 ) ( CLEAR ?auto_24178 ) ( not ( = ?auto_24175 ?auto_24178 ) ) ( not ( = ?auto_24175 ?auto_24208 ) ) ( not ( = ?auto_24178 ?auto_24208 ) ) ( IS-CRATE ?auto_24175 ) ( not ( = ?auto_24202 ?auto_24189 ) ) ( HOIST-AT ?auto_24213 ?auto_24202 ) ( SURFACE-AT ?auto_24175 ?auto_24202 ) ( ON ?auto_24175 ?auto_24190 ) ( CLEAR ?auto_24175 ) ( not ( = ?auto_24174 ?auto_24175 ) ) ( not ( = ?auto_24174 ?auto_24190 ) ) ( not ( = ?auto_24175 ?auto_24190 ) ) ( not ( = ?auto_24186 ?auto_24213 ) ) ( IS-CRATE ?auto_24174 ) ( AVAILABLE ?auto_24188 ) ( SURFACE-AT ?auto_24174 ?auto_24187 ) ( ON ?auto_24174 ?auto_24206 ) ( CLEAR ?auto_24174 ) ( not ( = ?auto_24173 ?auto_24174 ) ) ( not ( = ?auto_24173 ?auto_24206 ) ) ( not ( = ?auto_24174 ?auto_24206 ) ) ( IS-CRATE ?auto_24173 ) ( AVAILABLE ?auto_24213 ) ( SURFACE-AT ?auto_24173 ?auto_24202 ) ( ON ?auto_24173 ?auto_24205 ) ( CLEAR ?auto_24173 ) ( not ( = ?auto_24172 ?auto_24173 ) ) ( not ( = ?auto_24172 ?auto_24205 ) ) ( not ( = ?auto_24173 ?auto_24205 ) ) ( IS-CRATE ?auto_24172 ) ( AVAILABLE ?auto_24193 ) ( SURFACE-AT ?auto_24172 ?auto_24201 ) ( ON ?auto_24172 ?auto_24194 ) ( CLEAR ?auto_24172 ) ( not ( = ?auto_24171 ?auto_24172 ) ) ( not ( = ?auto_24171 ?auto_24194 ) ) ( not ( = ?auto_24172 ?auto_24194 ) ) ( SURFACE-AT ?auto_24170 ?auto_24189 ) ( CLEAR ?auto_24170 ) ( IS-CRATE ?auto_24171 ) ( AVAILABLE ?auto_24186 ) ( not ( = ?auto_24203 ?auto_24189 ) ) ( HOIST-AT ?auto_24207 ?auto_24203 ) ( AVAILABLE ?auto_24207 ) ( SURFACE-AT ?auto_24171 ?auto_24203 ) ( ON ?auto_24171 ?auto_24191 ) ( CLEAR ?auto_24171 ) ( TRUCK-AT ?auto_24184 ?auto_24189 ) ( not ( = ?auto_24170 ?auto_24171 ) ) ( not ( = ?auto_24170 ?auto_24191 ) ) ( not ( = ?auto_24171 ?auto_24191 ) ) ( not ( = ?auto_24186 ?auto_24207 ) ) ( not ( = ?auto_24170 ?auto_24172 ) ) ( not ( = ?auto_24170 ?auto_24194 ) ) ( not ( = ?auto_24172 ?auto_24191 ) ) ( not ( = ?auto_24201 ?auto_24203 ) ) ( not ( = ?auto_24193 ?auto_24207 ) ) ( not ( = ?auto_24194 ?auto_24191 ) ) ( not ( = ?auto_24170 ?auto_24173 ) ) ( not ( = ?auto_24170 ?auto_24205 ) ) ( not ( = ?auto_24171 ?auto_24173 ) ) ( not ( = ?auto_24171 ?auto_24205 ) ) ( not ( = ?auto_24173 ?auto_24194 ) ) ( not ( = ?auto_24173 ?auto_24191 ) ) ( not ( = ?auto_24202 ?auto_24201 ) ) ( not ( = ?auto_24202 ?auto_24203 ) ) ( not ( = ?auto_24213 ?auto_24193 ) ) ( not ( = ?auto_24213 ?auto_24207 ) ) ( not ( = ?auto_24205 ?auto_24194 ) ) ( not ( = ?auto_24205 ?auto_24191 ) ) ( not ( = ?auto_24170 ?auto_24174 ) ) ( not ( = ?auto_24170 ?auto_24206 ) ) ( not ( = ?auto_24171 ?auto_24174 ) ) ( not ( = ?auto_24171 ?auto_24206 ) ) ( not ( = ?auto_24172 ?auto_24174 ) ) ( not ( = ?auto_24172 ?auto_24206 ) ) ( not ( = ?auto_24174 ?auto_24205 ) ) ( not ( = ?auto_24174 ?auto_24194 ) ) ( not ( = ?auto_24174 ?auto_24191 ) ) ( not ( = ?auto_24187 ?auto_24202 ) ) ( not ( = ?auto_24187 ?auto_24201 ) ) ( not ( = ?auto_24187 ?auto_24203 ) ) ( not ( = ?auto_24188 ?auto_24213 ) ) ( not ( = ?auto_24188 ?auto_24193 ) ) ( not ( = ?auto_24188 ?auto_24207 ) ) ( not ( = ?auto_24206 ?auto_24205 ) ) ( not ( = ?auto_24206 ?auto_24194 ) ) ( not ( = ?auto_24206 ?auto_24191 ) ) ( not ( = ?auto_24170 ?auto_24175 ) ) ( not ( = ?auto_24170 ?auto_24190 ) ) ( not ( = ?auto_24171 ?auto_24175 ) ) ( not ( = ?auto_24171 ?auto_24190 ) ) ( not ( = ?auto_24172 ?auto_24175 ) ) ( not ( = ?auto_24172 ?auto_24190 ) ) ( not ( = ?auto_24173 ?auto_24175 ) ) ( not ( = ?auto_24173 ?auto_24190 ) ) ( not ( = ?auto_24175 ?auto_24206 ) ) ( not ( = ?auto_24175 ?auto_24205 ) ) ( not ( = ?auto_24175 ?auto_24194 ) ) ( not ( = ?auto_24175 ?auto_24191 ) ) ( not ( = ?auto_24190 ?auto_24206 ) ) ( not ( = ?auto_24190 ?auto_24205 ) ) ( not ( = ?auto_24190 ?auto_24194 ) ) ( not ( = ?auto_24190 ?auto_24191 ) ) ( not ( = ?auto_24170 ?auto_24178 ) ) ( not ( = ?auto_24170 ?auto_24208 ) ) ( not ( = ?auto_24171 ?auto_24178 ) ) ( not ( = ?auto_24171 ?auto_24208 ) ) ( not ( = ?auto_24172 ?auto_24178 ) ) ( not ( = ?auto_24172 ?auto_24208 ) ) ( not ( = ?auto_24173 ?auto_24178 ) ) ( not ( = ?auto_24173 ?auto_24208 ) ) ( not ( = ?auto_24174 ?auto_24178 ) ) ( not ( = ?auto_24174 ?auto_24208 ) ) ( not ( = ?auto_24178 ?auto_24190 ) ) ( not ( = ?auto_24178 ?auto_24206 ) ) ( not ( = ?auto_24178 ?auto_24205 ) ) ( not ( = ?auto_24178 ?auto_24194 ) ) ( not ( = ?auto_24178 ?auto_24191 ) ) ( not ( = ?auto_24211 ?auto_24202 ) ) ( not ( = ?auto_24211 ?auto_24187 ) ) ( not ( = ?auto_24211 ?auto_24201 ) ) ( not ( = ?auto_24211 ?auto_24203 ) ) ( not ( = ?auto_24195 ?auto_24213 ) ) ( not ( = ?auto_24195 ?auto_24188 ) ) ( not ( = ?auto_24195 ?auto_24193 ) ) ( not ( = ?auto_24195 ?auto_24207 ) ) ( not ( = ?auto_24208 ?auto_24190 ) ) ( not ( = ?auto_24208 ?auto_24206 ) ) ( not ( = ?auto_24208 ?auto_24205 ) ) ( not ( = ?auto_24208 ?auto_24194 ) ) ( not ( = ?auto_24208 ?auto_24191 ) ) ( not ( = ?auto_24170 ?auto_24177 ) ) ( not ( = ?auto_24170 ?auto_24209 ) ) ( not ( = ?auto_24171 ?auto_24177 ) ) ( not ( = ?auto_24171 ?auto_24209 ) ) ( not ( = ?auto_24172 ?auto_24177 ) ) ( not ( = ?auto_24172 ?auto_24209 ) ) ( not ( = ?auto_24173 ?auto_24177 ) ) ( not ( = ?auto_24173 ?auto_24209 ) ) ( not ( = ?auto_24174 ?auto_24177 ) ) ( not ( = ?auto_24174 ?auto_24209 ) ) ( not ( = ?auto_24175 ?auto_24177 ) ) ( not ( = ?auto_24175 ?auto_24209 ) ) ( not ( = ?auto_24177 ?auto_24208 ) ) ( not ( = ?auto_24177 ?auto_24190 ) ) ( not ( = ?auto_24177 ?auto_24206 ) ) ( not ( = ?auto_24177 ?auto_24205 ) ) ( not ( = ?auto_24177 ?auto_24194 ) ) ( not ( = ?auto_24177 ?auto_24191 ) ) ( not ( = ?auto_24209 ?auto_24208 ) ) ( not ( = ?auto_24209 ?auto_24190 ) ) ( not ( = ?auto_24209 ?auto_24206 ) ) ( not ( = ?auto_24209 ?auto_24205 ) ) ( not ( = ?auto_24209 ?auto_24194 ) ) ( not ( = ?auto_24209 ?auto_24191 ) ) ( not ( = ?auto_24170 ?auto_24176 ) ) ( not ( = ?auto_24170 ?auto_24210 ) ) ( not ( = ?auto_24171 ?auto_24176 ) ) ( not ( = ?auto_24171 ?auto_24210 ) ) ( not ( = ?auto_24172 ?auto_24176 ) ) ( not ( = ?auto_24172 ?auto_24210 ) ) ( not ( = ?auto_24173 ?auto_24176 ) ) ( not ( = ?auto_24173 ?auto_24210 ) ) ( not ( = ?auto_24174 ?auto_24176 ) ) ( not ( = ?auto_24174 ?auto_24210 ) ) ( not ( = ?auto_24175 ?auto_24176 ) ) ( not ( = ?auto_24175 ?auto_24210 ) ) ( not ( = ?auto_24178 ?auto_24176 ) ) ( not ( = ?auto_24178 ?auto_24210 ) ) ( not ( = ?auto_24176 ?auto_24209 ) ) ( not ( = ?auto_24176 ?auto_24208 ) ) ( not ( = ?auto_24176 ?auto_24190 ) ) ( not ( = ?auto_24176 ?auto_24206 ) ) ( not ( = ?auto_24176 ?auto_24205 ) ) ( not ( = ?auto_24176 ?auto_24194 ) ) ( not ( = ?auto_24176 ?auto_24191 ) ) ( not ( = ?auto_24210 ?auto_24209 ) ) ( not ( = ?auto_24210 ?auto_24208 ) ) ( not ( = ?auto_24210 ?auto_24190 ) ) ( not ( = ?auto_24210 ?auto_24206 ) ) ( not ( = ?auto_24210 ?auto_24205 ) ) ( not ( = ?auto_24210 ?auto_24194 ) ) ( not ( = ?auto_24210 ?auto_24191 ) ) ( not ( = ?auto_24170 ?auto_24179 ) ) ( not ( = ?auto_24170 ?auto_24197 ) ) ( not ( = ?auto_24171 ?auto_24179 ) ) ( not ( = ?auto_24171 ?auto_24197 ) ) ( not ( = ?auto_24172 ?auto_24179 ) ) ( not ( = ?auto_24172 ?auto_24197 ) ) ( not ( = ?auto_24173 ?auto_24179 ) ) ( not ( = ?auto_24173 ?auto_24197 ) ) ( not ( = ?auto_24174 ?auto_24179 ) ) ( not ( = ?auto_24174 ?auto_24197 ) ) ( not ( = ?auto_24175 ?auto_24179 ) ) ( not ( = ?auto_24175 ?auto_24197 ) ) ( not ( = ?auto_24178 ?auto_24179 ) ) ( not ( = ?auto_24178 ?auto_24197 ) ) ( not ( = ?auto_24177 ?auto_24179 ) ) ( not ( = ?auto_24177 ?auto_24197 ) ) ( not ( = ?auto_24179 ?auto_24210 ) ) ( not ( = ?auto_24179 ?auto_24209 ) ) ( not ( = ?auto_24179 ?auto_24208 ) ) ( not ( = ?auto_24179 ?auto_24190 ) ) ( not ( = ?auto_24179 ?auto_24206 ) ) ( not ( = ?auto_24179 ?auto_24205 ) ) ( not ( = ?auto_24179 ?auto_24194 ) ) ( not ( = ?auto_24179 ?auto_24191 ) ) ( not ( = ?auto_24197 ?auto_24210 ) ) ( not ( = ?auto_24197 ?auto_24209 ) ) ( not ( = ?auto_24197 ?auto_24208 ) ) ( not ( = ?auto_24197 ?auto_24190 ) ) ( not ( = ?auto_24197 ?auto_24206 ) ) ( not ( = ?auto_24197 ?auto_24205 ) ) ( not ( = ?auto_24197 ?auto_24194 ) ) ( not ( = ?auto_24197 ?auto_24191 ) ) ( not ( = ?auto_24170 ?auto_24181 ) ) ( not ( = ?auto_24170 ?auto_24204 ) ) ( not ( = ?auto_24171 ?auto_24181 ) ) ( not ( = ?auto_24171 ?auto_24204 ) ) ( not ( = ?auto_24172 ?auto_24181 ) ) ( not ( = ?auto_24172 ?auto_24204 ) ) ( not ( = ?auto_24173 ?auto_24181 ) ) ( not ( = ?auto_24173 ?auto_24204 ) ) ( not ( = ?auto_24174 ?auto_24181 ) ) ( not ( = ?auto_24174 ?auto_24204 ) ) ( not ( = ?auto_24175 ?auto_24181 ) ) ( not ( = ?auto_24175 ?auto_24204 ) ) ( not ( = ?auto_24178 ?auto_24181 ) ) ( not ( = ?auto_24178 ?auto_24204 ) ) ( not ( = ?auto_24177 ?auto_24181 ) ) ( not ( = ?auto_24177 ?auto_24204 ) ) ( not ( = ?auto_24176 ?auto_24181 ) ) ( not ( = ?auto_24176 ?auto_24204 ) ) ( not ( = ?auto_24181 ?auto_24197 ) ) ( not ( = ?auto_24181 ?auto_24210 ) ) ( not ( = ?auto_24181 ?auto_24209 ) ) ( not ( = ?auto_24181 ?auto_24208 ) ) ( not ( = ?auto_24181 ?auto_24190 ) ) ( not ( = ?auto_24181 ?auto_24206 ) ) ( not ( = ?auto_24181 ?auto_24205 ) ) ( not ( = ?auto_24181 ?auto_24194 ) ) ( not ( = ?auto_24181 ?auto_24191 ) ) ( not ( = ?auto_24200 ?auto_24187 ) ) ( not ( = ?auto_24200 ?auto_24211 ) ) ( not ( = ?auto_24200 ?auto_24201 ) ) ( not ( = ?auto_24200 ?auto_24202 ) ) ( not ( = ?auto_24200 ?auto_24203 ) ) ( not ( = ?auto_24196 ?auto_24188 ) ) ( not ( = ?auto_24196 ?auto_24195 ) ) ( not ( = ?auto_24196 ?auto_24193 ) ) ( not ( = ?auto_24196 ?auto_24213 ) ) ( not ( = ?auto_24196 ?auto_24207 ) ) ( not ( = ?auto_24204 ?auto_24197 ) ) ( not ( = ?auto_24204 ?auto_24210 ) ) ( not ( = ?auto_24204 ?auto_24209 ) ) ( not ( = ?auto_24204 ?auto_24208 ) ) ( not ( = ?auto_24204 ?auto_24190 ) ) ( not ( = ?auto_24204 ?auto_24206 ) ) ( not ( = ?auto_24204 ?auto_24205 ) ) ( not ( = ?auto_24204 ?auto_24194 ) ) ( not ( = ?auto_24204 ?auto_24191 ) ) ( not ( = ?auto_24170 ?auto_24180 ) ) ( not ( = ?auto_24170 ?auto_24199 ) ) ( not ( = ?auto_24171 ?auto_24180 ) ) ( not ( = ?auto_24171 ?auto_24199 ) ) ( not ( = ?auto_24172 ?auto_24180 ) ) ( not ( = ?auto_24172 ?auto_24199 ) ) ( not ( = ?auto_24173 ?auto_24180 ) ) ( not ( = ?auto_24173 ?auto_24199 ) ) ( not ( = ?auto_24174 ?auto_24180 ) ) ( not ( = ?auto_24174 ?auto_24199 ) ) ( not ( = ?auto_24175 ?auto_24180 ) ) ( not ( = ?auto_24175 ?auto_24199 ) ) ( not ( = ?auto_24178 ?auto_24180 ) ) ( not ( = ?auto_24178 ?auto_24199 ) ) ( not ( = ?auto_24177 ?auto_24180 ) ) ( not ( = ?auto_24177 ?auto_24199 ) ) ( not ( = ?auto_24176 ?auto_24180 ) ) ( not ( = ?auto_24176 ?auto_24199 ) ) ( not ( = ?auto_24179 ?auto_24180 ) ) ( not ( = ?auto_24179 ?auto_24199 ) ) ( not ( = ?auto_24180 ?auto_24204 ) ) ( not ( = ?auto_24180 ?auto_24197 ) ) ( not ( = ?auto_24180 ?auto_24210 ) ) ( not ( = ?auto_24180 ?auto_24209 ) ) ( not ( = ?auto_24180 ?auto_24208 ) ) ( not ( = ?auto_24180 ?auto_24190 ) ) ( not ( = ?auto_24180 ?auto_24206 ) ) ( not ( = ?auto_24180 ?auto_24205 ) ) ( not ( = ?auto_24180 ?auto_24194 ) ) ( not ( = ?auto_24180 ?auto_24191 ) ) ( not ( = ?auto_24199 ?auto_24204 ) ) ( not ( = ?auto_24199 ?auto_24197 ) ) ( not ( = ?auto_24199 ?auto_24210 ) ) ( not ( = ?auto_24199 ?auto_24209 ) ) ( not ( = ?auto_24199 ?auto_24208 ) ) ( not ( = ?auto_24199 ?auto_24190 ) ) ( not ( = ?auto_24199 ?auto_24206 ) ) ( not ( = ?auto_24199 ?auto_24205 ) ) ( not ( = ?auto_24199 ?auto_24194 ) ) ( not ( = ?auto_24199 ?auto_24191 ) ) ( not ( = ?auto_24170 ?auto_24182 ) ) ( not ( = ?auto_24170 ?auto_24198 ) ) ( not ( = ?auto_24171 ?auto_24182 ) ) ( not ( = ?auto_24171 ?auto_24198 ) ) ( not ( = ?auto_24172 ?auto_24182 ) ) ( not ( = ?auto_24172 ?auto_24198 ) ) ( not ( = ?auto_24173 ?auto_24182 ) ) ( not ( = ?auto_24173 ?auto_24198 ) ) ( not ( = ?auto_24174 ?auto_24182 ) ) ( not ( = ?auto_24174 ?auto_24198 ) ) ( not ( = ?auto_24175 ?auto_24182 ) ) ( not ( = ?auto_24175 ?auto_24198 ) ) ( not ( = ?auto_24178 ?auto_24182 ) ) ( not ( = ?auto_24178 ?auto_24198 ) ) ( not ( = ?auto_24177 ?auto_24182 ) ) ( not ( = ?auto_24177 ?auto_24198 ) ) ( not ( = ?auto_24176 ?auto_24182 ) ) ( not ( = ?auto_24176 ?auto_24198 ) ) ( not ( = ?auto_24179 ?auto_24182 ) ) ( not ( = ?auto_24179 ?auto_24198 ) ) ( not ( = ?auto_24181 ?auto_24182 ) ) ( not ( = ?auto_24181 ?auto_24198 ) ) ( not ( = ?auto_24182 ?auto_24199 ) ) ( not ( = ?auto_24182 ?auto_24204 ) ) ( not ( = ?auto_24182 ?auto_24197 ) ) ( not ( = ?auto_24182 ?auto_24210 ) ) ( not ( = ?auto_24182 ?auto_24209 ) ) ( not ( = ?auto_24182 ?auto_24208 ) ) ( not ( = ?auto_24182 ?auto_24190 ) ) ( not ( = ?auto_24182 ?auto_24206 ) ) ( not ( = ?auto_24182 ?auto_24205 ) ) ( not ( = ?auto_24182 ?auto_24194 ) ) ( not ( = ?auto_24182 ?auto_24191 ) ) ( not ( = ?auto_24192 ?auto_24201 ) ) ( not ( = ?auto_24192 ?auto_24200 ) ) ( not ( = ?auto_24192 ?auto_24187 ) ) ( not ( = ?auto_24192 ?auto_24211 ) ) ( not ( = ?auto_24192 ?auto_24202 ) ) ( not ( = ?auto_24192 ?auto_24203 ) ) ( not ( = ?auto_24212 ?auto_24193 ) ) ( not ( = ?auto_24212 ?auto_24196 ) ) ( not ( = ?auto_24212 ?auto_24188 ) ) ( not ( = ?auto_24212 ?auto_24195 ) ) ( not ( = ?auto_24212 ?auto_24213 ) ) ( not ( = ?auto_24212 ?auto_24207 ) ) ( not ( = ?auto_24198 ?auto_24199 ) ) ( not ( = ?auto_24198 ?auto_24204 ) ) ( not ( = ?auto_24198 ?auto_24197 ) ) ( not ( = ?auto_24198 ?auto_24210 ) ) ( not ( = ?auto_24198 ?auto_24209 ) ) ( not ( = ?auto_24198 ?auto_24208 ) ) ( not ( = ?auto_24198 ?auto_24190 ) ) ( not ( = ?auto_24198 ?auto_24206 ) ) ( not ( = ?auto_24198 ?auto_24205 ) ) ( not ( = ?auto_24198 ?auto_24194 ) ) ( not ( = ?auto_24198 ?auto_24191 ) ) ( not ( = ?auto_24170 ?auto_24183 ) ) ( not ( = ?auto_24170 ?auto_24185 ) ) ( not ( = ?auto_24171 ?auto_24183 ) ) ( not ( = ?auto_24171 ?auto_24185 ) ) ( not ( = ?auto_24172 ?auto_24183 ) ) ( not ( = ?auto_24172 ?auto_24185 ) ) ( not ( = ?auto_24173 ?auto_24183 ) ) ( not ( = ?auto_24173 ?auto_24185 ) ) ( not ( = ?auto_24174 ?auto_24183 ) ) ( not ( = ?auto_24174 ?auto_24185 ) ) ( not ( = ?auto_24175 ?auto_24183 ) ) ( not ( = ?auto_24175 ?auto_24185 ) ) ( not ( = ?auto_24178 ?auto_24183 ) ) ( not ( = ?auto_24178 ?auto_24185 ) ) ( not ( = ?auto_24177 ?auto_24183 ) ) ( not ( = ?auto_24177 ?auto_24185 ) ) ( not ( = ?auto_24176 ?auto_24183 ) ) ( not ( = ?auto_24176 ?auto_24185 ) ) ( not ( = ?auto_24179 ?auto_24183 ) ) ( not ( = ?auto_24179 ?auto_24185 ) ) ( not ( = ?auto_24181 ?auto_24183 ) ) ( not ( = ?auto_24181 ?auto_24185 ) ) ( not ( = ?auto_24180 ?auto_24183 ) ) ( not ( = ?auto_24180 ?auto_24185 ) ) ( not ( = ?auto_24183 ?auto_24198 ) ) ( not ( = ?auto_24183 ?auto_24199 ) ) ( not ( = ?auto_24183 ?auto_24204 ) ) ( not ( = ?auto_24183 ?auto_24197 ) ) ( not ( = ?auto_24183 ?auto_24210 ) ) ( not ( = ?auto_24183 ?auto_24209 ) ) ( not ( = ?auto_24183 ?auto_24208 ) ) ( not ( = ?auto_24183 ?auto_24190 ) ) ( not ( = ?auto_24183 ?auto_24206 ) ) ( not ( = ?auto_24183 ?auto_24205 ) ) ( not ( = ?auto_24183 ?auto_24194 ) ) ( not ( = ?auto_24183 ?auto_24191 ) ) ( not ( = ?auto_24185 ?auto_24198 ) ) ( not ( = ?auto_24185 ?auto_24199 ) ) ( not ( = ?auto_24185 ?auto_24204 ) ) ( not ( = ?auto_24185 ?auto_24197 ) ) ( not ( = ?auto_24185 ?auto_24210 ) ) ( not ( = ?auto_24185 ?auto_24209 ) ) ( not ( = ?auto_24185 ?auto_24208 ) ) ( not ( = ?auto_24185 ?auto_24190 ) ) ( not ( = ?auto_24185 ?auto_24206 ) ) ( not ( = ?auto_24185 ?auto_24205 ) ) ( not ( = ?auto_24185 ?auto_24194 ) ) ( not ( = ?auto_24185 ?auto_24191 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_24170 ?auto_24171 ?auto_24172 ?auto_24173 ?auto_24174 ?auto_24175 ?auto_24178 ?auto_24177 ?auto_24176 ?auto_24179 ?auto_24181 ?auto_24180 ?auto_24182 )
      ( MAKE-1CRATE ?auto_24182 ?auto_24183 )
      ( MAKE-13CRATE-VERIFY ?auto_24170 ?auto_24171 ?auto_24172 ?auto_24173 ?auto_24174 ?auto_24175 ?auto_24178 ?auto_24177 ?auto_24176 ?auto_24179 ?auto_24181 ?auto_24180 ?auto_24182 ?auto_24183 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24216 - SURFACE
      ?auto_24217 - SURFACE
    )
    :vars
    (
      ?auto_24218 - HOIST
      ?auto_24219 - PLACE
      ?auto_24221 - PLACE
      ?auto_24222 - HOIST
      ?auto_24223 - SURFACE
      ?auto_24220 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24218 ?auto_24219 ) ( SURFACE-AT ?auto_24216 ?auto_24219 ) ( CLEAR ?auto_24216 ) ( IS-CRATE ?auto_24217 ) ( AVAILABLE ?auto_24218 ) ( not ( = ?auto_24221 ?auto_24219 ) ) ( HOIST-AT ?auto_24222 ?auto_24221 ) ( AVAILABLE ?auto_24222 ) ( SURFACE-AT ?auto_24217 ?auto_24221 ) ( ON ?auto_24217 ?auto_24223 ) ( CLEAR ?auto_24217 ) ( TRUCK-AT ?auto_24220 ?auto_24219 ) ( not ( = ?auto_24216 ?auto_24217 ) ) ( not ( = ?auto_24216 ?auto_24223 ) ) ( not ( = ?auto_24217 ?auto_24223 ) ) ( not ( = ?auto_24218 ?auto_24222 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24220 ?auto_24219 ?auto_24221 )
      ( !LIFT ?auto_24222 ?auto_24217 ?auto_24223 ?auto_24221 )
      ( !LOAD ?auto_24222 ?auto_24217 ?auto_24220 ?auto_24221 )
      ( !DRIVE ?auto_24220 ?auto_24221 ?auto_24219 )
      ( !UNLOAD ?auto_24218 ?auto_24217 ?auto_24220 ?auto_24219 )
      ( !DROP ?auto_24218 ?auto_24217 ?auto_24216 ?auto_24219 )
      ( MAKE-1CRATE-VERIFY ?auto_24216 ?auto_24217 ) )
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
      ?auto_24247 - SURFACE
      ?auto_24246 - SURFACE
      ?auto_24245 - SURFACE
      ?auto_24248 - SURFACE
      ?auto_24250 - SURFACE
      ?auto_24249 - SURFACE
      ?auto_24251 - SURFACE
      ?auto_24253 - SURFACE
      ?auto_24252 - SURFACE
    )
    :vars
    (
      ?auto_24254 - HOIST
      ?auto_24258 - PLACE
      ?auto_24256 - PLACE
      ?auto_24255 - HOIST
      ?auto_24259 - SURFACE
      ?auto_24279 - SURFACE
      ?auto_24280 - PLACE
      ?auto_24269 - HOIST
      ?auto_24281 - SURFACE
      ?auto_24283 - PLACE
      ?auto_24276 - HOIST
      ?auto_24273 - SURFACE
      ?auto_24268 - PLACE
      ?auto_24263 - HOIST
      ?auto_24260 - SURFACE
      ?auto_24278 - SURFACE
      ?auto_24264 - PLACE
      ?auto_24270 - HOIST
      ?auto_24261 - SURFACE
      ?auto_24274 - SURFACE
      ?auto_24262 - SURFACE
      ?auto_24266 - PLACE
      ?auto_24272 - HOIST
      ?auto_24284 - SURFACE
      ?auto_24265 - SURFACE
      ?auto_24267 - SURFACE
      ?auto_24277 - SURFACE
      ?auto_24282 - PLACE
      ?auto_24271 - HOIST
      ?auto_24275 - SURFACE
      ?auto_24257 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24254 ?auto_24258 ) ( IS-CRATE ?auto_24252 ) ( not ( = ?auto_24256 ?auto_24258 ) ) ( HOIST-AT ?auto_24255 ?auto_24256 ) ( SURFACE-AT ?auto_24252 ?auto_24256 ) ( ON ?auto_24252 ?auto_24259 ) ( CLEAR ?auto_24252 ) ( not ( = ?auto_24253 ?auto_24252 ) ) ( not ( = ?auto_24253 ?auto_24259 ) ) ( not ( = ?auto_24252 ?auto_24259 ) ) ( not ( = ?auto_24254 ?auto_24255 ) ) ( IS-CRATE ?auto_24253 ) ( SURFACE-AT ?auto_24253 ?auto_24256 ) ( ON ?auto_24253 ?auto_24279 ) ( CLEAR ?auto_24253 ) ( not ( = ?auto_24251 ?auto_24253 ) ) ( not ( = ?auto_24251 ?auto_24279 ) ) ( not ( = ?auto_24253 ?auto_24279 ) ) ( IS-CRATE ?auto_24251 ) ( not ( = ?auto_24280 ?auto_24258 ) ) ( HOIST-AT ?auto_24269 ?auto_24280 ) ( AVAILABLE ?auto_24269 ) ( SURFACE-AT ?auto_24251 ?auto_24280 ) ( ON ?auto_24251 ?auto_24281 ) ( CLEAR ?auto_24251 ) ( not ( = ?auto_24249 ?auto_24251 ) ) ( not ( = ?auto_24249 ?auto_24281 ) ) ( not ( = ?auto_24251 ?auto_24281 ) ) ( not ( = ?auto_24254 ?auto_24269 ) ) ( IS-CRATE ?auto_24249 ) ( not ( = ?auto_24283 ?auto_24258 ) ) ( HOIST-AT ?auto_24276 ?auto_24283 ) ( SURFACE-AT ?auto_24249 ?auto_24283 ) ( ON ?auto_24249 ?auto_24273 ) ( CLEAR ?auto_24249 ) ( not ( = ?auto_24250 ?auto_24249 ) ) ( not ( = ?auto_24250 ?auto_24273 ) ) ( not ( = ?auto_24249 ?auto_24273 ) ) ( not ( = ?auto_24254 ?auto_24276 ) ) ( IS-CRATE ?auto_24250 ) ( not ( = ?auto_24268 ?auto_24258 ) ) ( HOIST-AT ?auto_24263 ?auto_24268 ) ( AVAILABLE ?auto_24263 ) ( SURFACE-AT ?auto_24250 ?auto_24268 ) ( ON ?auto_24250 ?auto_24260 ) ( CLEAR ?auto_24250 ) ( not ( = ?auto_24248 ?auto_24250 ) ) ( not ( = ?auto_24248 ?auto_24260 ) ) ( not ( = ?auto_24250 ?auto_24260 ) ) ( not ( = ?auto_24254 ?auto_24263 ) ) ( IS-CRATE ?auto_24248 ) ( SURFACE-AT ?auto_24248 ?auto_24256 ) ( ON ?auto_24248 ?auto_24278 ) ( CLEAR ?auto_24248 ) ( not ( = ?auto_24245 ?auto_24248 ) ) ( not ( = ?auto_24245 ?auto_24278 ) ) ( not ( = ?auto_24248 ?auto_24278 ) ) ( IS-CRATE ?auto_24245 ) ( not ( = ?auto_24264 ?auto_24258 ) ) ( HOIST-AT ?auto_24270 ?auto_24264 ) ( SURFACE-AT ?auto_24245 ?auto_24264 ) ( ON ?auto_24245 ?auto_24261 ) ( CLEAR ?auto_24245 ) ( not ( = ?auto_24246 ?auto_24245 ) ) ( not ( = ?auto_24246 ?auto_24261 ) ) ( not ( = ?auto_24245 ?auto_24261 ) ) ( not ( = ?auto_24254 ?auto_24270 ) ) ( IS-CRATE ?auto_24246 ) ( SURFACE-AT ?auto_24246 ?auto_24283 ) ( ON ?auto_24246 ?auto_24274 ) ( CLEAR ?auto_24246 ) ( not ( = ?auto_24247 ?auto_24246 ) ) ( not ( = ?auto_24247 ?auto_24274 ) ) ( not ( = ?auto_24246 ?auto_24274 ) ) ( IS-CRATE ?auto_24247 ) ( AVAILABLE ?auto_24270 ) ( SURFACE-AT ?auto_24247 ?auto_24264 ) ( ON ?auto_24247 ?auto_24262 ) ( CLEAR ?auto_24247 ) ( not ( = ?auto_24244 ?auto_24247 ) ) ( not ( = ?auto_24244 ?auto_24262 ) ) ( not ( = ?auto_24247 ?auto_24262 ) ) ( IS-CRATE ?auto_24244 ) ( not ( = ?auto_24266 ?auto_24258 ) ) ( HOIST-AT ?auto_24272 ?auto_24266 ) ( SURFACE-AT ?auto_24244 ?auto_24266 ) ( ON ?auto_24244 ?auto_24284 ) ( CLEAR ?auto_24244 ) ( not ( = ?auto_24243 ?auto_24244 ) ) ( not ( = ?auto_24243 ?auto_24284 ) ) ( not ( = ?auto_24244 ?auto_24284 ) ) ( not ( = ?auto_24254 ?auto_24272 ) ) ( IS-CRATE ?auto_24243 ) ( AVAILABLE ?auto_24255 ) ( SURFACE-AT ?auto_24243 ?auto_24256 ) ( ON ?auto_24243 ?auto_24265 ) ( CLEAR ?auto_24243 ) ( not ( = ?auto_24242 ?auto_24243 ) ) ( not ( = ?auto_24242 ?auto_24265 ) ) ( not ( = ?auto_24243 ?auto_24265 ) ) ( IS-CRATE ?auto_24242 ) ( AVAILABLE ?auto_24272 ) ( SURFACE-AT ?auto_24242 ?auto_24266 ) ( ON ?auto_24242 ?auto_24267 ) ( CLEAR ?auto_24242 ) ( not ( = ?auto_24241 ?auto_24242 ) ) ( not ( = ?auto_24241 ?auto_24267 ) ) ( not ( = ?auto_24242 ?auto_24267 ) ) ( IS-CRATE ?auto_24241 ) ( AVAILABLE ?auto_24276 ) ( SURFACE-AT ?auto_24241 ?auto_24283 ) ( ON ?auto_24241 ?auto_24277 ) ( CLEAR ?auto_24241 ) ( not ( = ?auto_24240 ?auto_24241 ) ) ( not ( = ?auto_24240 ?auto_24277 ) ) ( not ( = ?auto_24241 ?auto_24277 ) ) ( SURFACE-AT ?auto_24239 ?auto_24258 ) ( CLEAR ?auto_24239 ) ( IS-CRATE ?auto_24240 ) ( AVAILABLE ?auto_24254 ) ( not ( = ?auto_24282 ?auto_24258 ) ) ( HOIST-AT ?auto_24271 ?auto_24282 ) ( AVAILABLE ?auto_24271 ) ( SURFACE-AT ?auto_24240 ?auto_24282 ) ( ON ?auto_24240 ?auto_24275 ) ( CLEAR ?auto_24240 ) ( TRUCK-AT ?auto_24257 ?auto_24258 ) ( not ( = ?auto_24239 ?auto_24240 ) ) ( not ( = ?auto_24239 ?auto_24275 ) ) ( not ( = ?auto_24240 ?auto_24275 ) ) ( not ( = ?auto_24254 ?auto_24271 ) ) ( not ( = ?auto_24239 ?auto_24241 ) ) ( not ( = ?auto_24239 ?auto_24277 ) ) ( not ( = ?auto_24241 ?auto_24275 ) ) ( not ( = ?auto_24283 ?auto_24282 ) ) ( not ( = ?auto_24276 ?auto_24271 ) ) ( not ( = ?auto_24277 ?auto_24275 ) ) ( not ( = ?auto_24239 ?auto_24242 ) ) ( not ( = ?auto_24239 ?auto_24267 ) ) ( not ( = ?auto_24240 ?auto_24242 ) ) ( not ( = ?auto_24240 ?auto_24267 ) ) ( not ( = ?auto_24242 ?auto_24277 ) ) ( not ( = ?auto_24242 ?auto_24275 ) ) ( not ( = ?auto_24266 ?auto_24283 ) ) ( not ( = ?auto_24266 ?auto_24282 ) ) ( not ( = ?auto_24272 ?auto_24276 ) ) ( not ( = ?auto_24272 ?auto_24271 ) ) ( not ( = ?auto_24267 ?auto_24277 ) ) ( not ( = ?auto_24267 ?auto_24275 ) ) ( not ( = ?auto_24239 ?auto_24243 ) ) ( not ( = ?auto_24239 ?auto_24265 ) ) ( not ( = ?auto_24240 ?auto_24243 ) ) ( not ( = ?auto_24240 ?auto_24265 ) ) ( not ( = ?auto_24241 ?auto_24243 ) ) ( not ( = ?auto_24241 ?auto_24265 ) ) ( not ( = ?auto_24243 ?auto_24267 ) ) ( not ( = ?auto_24243 ?auto_24277 ) ) ( not ( = ?auto_24243 ?auto_24275 ) ) ( not ( = ?auto_24256 ?auto_24266 ) ) ( not ( = ?auto_24256 ?auto_24283 ) ) ( not ( = ?auto_24256 ?auto_24282 ) ) ( not ( = ?auto_24255 ?auto_24272 ) ) ( not ( = ?auto_24255 ?auto_24276 ) ) ( not ( = ?auto_24255 ?auto_24271 ) ) ( not ( = ?auto_24265 ?auto_24267 ) ) ( not ( = ?auto_24265 ?auto_24277 ) ) ( not ( = ?auto_24265 ?auto_24275 ) ) ( not ( = ?auto_24239 ?auto_24244 ) ) ( not ( = ?auto_24239 ?auto_24284 ) ) ( not ( = ?auto_24240 ?auto_24244 ) ) ( not ( = ?auto_24240 ?auto_24284 ) ) ( not ( = ?auto_24241 ?auto_24244 ) ) ( not ( = ?auto_24241 ?auto_24284 ) ) ( not ( = ?auto_24242 ?auto_24244 ) ) ( not ( = ?auto_24242 ?auto_24284 ) ) ( not ( = ?auto_24244 ?auto_24265 ) ) ( not ( = ?auto_24244 ?auto_24267 ) ) ( not ( = ?auto_24244 ?auto_24277 ) ) ( not ( = ?auto_24244 ?auto_24275 ) ) ( not ( = ?auto_24284 ?auto_24265 ) ) ( not ( = ?auto_24284 ?auto_24267 ) ) ( not ( = ?auto_24284 ?auto_24277 ) ) ( not ( = ?auto_24284 ?auto_24275 ) ) ( not ( = ?auto_24239 ?auto_24247 ) ) ( not ( = ?auto_24239 ?auto_24262 ) ) ( not ( = ?auto_24240 ?auto_24247 ) ) ( not ( = ?auto_24240 ?auto_24262 ) ) ( not ( = ?auto_24241 ?auto_24247 ) ) ( not ( = ?auto_24241 ?auto_24262 ) ) ( not ( = ?auto_24242 ?auto_24247 ) ) ( not ( = ?auto_24242 ?auto_24262 ) ) ( not ( = ?auto_24243 ?auto_24247 ) ) ( not ( = ?auto_24243 ?auto_24262 ) ) ( not ( = ?auto_24247 ?auto_24284 ) ) ( not ( = ?auto_24247 ?auto_24265 ) ) ( not ( = ?auto_24247 ?auto_24267 ) ) ( not ( = ?auto_24247 ?auto_24277 ) ) ( not ( = ?auto_24247 ?auto_24275 ) ) ( not ( = ?auto_24264 ?auto_24266 ) ) ( not ( = ?auto_24264 ?auto_24256 ) ) ( not ( = ?auto_24264 ?auto_24283 ) ) ( not ( = ?auto_24264 ?auto_24282 ) ) ( not ( = ?auto_24270 ?auto_24272 ) ) ( not ( = ?auto_24270 ?auto_24255 ) ) ( not ( = ?auto_24270 ?auto_24276 ) ) ( not ( = ?auto_24270 ?auto_24271 ) ) ( not ( = ?auto_24262 ?auto_24284 ) ) ( not ( = ?auto_24262 ?auto_24265 ) ) ( not ( = ?auto_24262 ?auto_24267 ) ) ( not ( = ?auto_24262 ?auto_24277 ) ) ( not ( = ?auto_24262 ?auto_24275 ) ) ( not ( = ?auto_24239 ?auto_24246 ) ) ( not ( = ?auto_24239 ?auto_24274 ) ) ( not ( = ?auto_24240 ?auto_24246 ) ) ( not ( = ?auto_24240 ?auto_24274 ) ) ( not ( = ?auto_24241 ?auto_24246 ) ) ( not ( = ?auto_24241 ?auto_24274 ) ) ( not ( = ?auto_24242 ?auto_24246 ) ) ( not ( = ?auto_24242 ?auto_24274 ) ) ( not ( = ?auto_24243 ?auto_24246 ) ) ( not ( = ?auto_24243 ?auto_24274 ) ) ( not ( = ?auto_24244 ?auto_24246 ) ) ( not ( = ?auto_24244 ?auto_24274 ) ) ( not ( = ?auto_24246 ?auto_24262 ) ) ( not ( = ?auto_24246 ?auto_24284 ) ) ( not ( = ?auto_24246 ?auto_24265 ) ) ( not ( = ?auto_24246 ?auto_24267 ) ) ( not ( = ?auto_24246 ?auto_24277 ) ) ( not ( = ?auto_24246 ?auto_24275 ) ) ( not ( = ?auto_24274 ?auto_24262 ) ) ( not ( = ?auto_24274 ?auto_24284 ) ) ( not ( = ?auto_24274 ?auto_24265 ) ) ( not ( = ?auto_24274 ?auto_24267 ) ) ( not ( = ?auto_24274 ?auto_24277 ) ) ( not ( = ?auto_24274 ?auto_24275 ) ) ( not ( = ?auto_24239 ?auto_24245 ) ) ( not ( = ?auto_24239 ?auto_24261 ) ) ( not ( = ?auto_24240 ?auto_24245 ) ) ( not ( = ?auto_24240 ?auto_24261 ) ) ( not ( = ?auto_24241 ?auto_24245 ) ) ( not ( = ?auto_24241 ?auto_24261 ) ) ( not ( = ?auto_24242 ?auto_24245 ) ) ( not ( = ?auto_24242 ?auto_24261 ) ) ( not ( = ?auto_24243 ?auto_24245 ) ) ( not ( = ?auto_24243 ?auto_24261 ) ) ( not ( = ?auto_24244 ?auto_24245 ) ) ( not ( = ?auto_24244 ?auto_24261 ) ) ( not ( = ?auto_24247 ?auto_24245 ) ) ( not ( = ?auto_24247 ?auto_24261 ) ) ( not ( = ?auto_24245 ?auto_24274 ) ) ( not ( = ?auto_24245 ?auto_24262 ) ) ( not ( = ?auto_24245 ?auto_24284 ) ) ( not ( = ?auto_24245 ?auto_24265 ) ) ( not ( = ?auto_24245 ?auto_24267 ) ) ( not ( = ?auto_24245 ?auto_24277 ) ) ( not ( = ?auto_24245 ?auto_24275 ) ) ( not ( = ?auto_24261 ?auto_24274 ) ) ( not ( = ?auto_24261 ?auto_24262 ) ) ( not ( = ?auto_24261 ?auto_24284 ) ) ( not ( = ?auto_24261 ?auto_24265 ) ) ( not ( = ?auto_24261 ?auto_24267 ) ) ( not ( = ?auto_24261 ?auto_24277 ) ) ( not ( = ?auto_24261 ?auto_24275 ) ) ( not ( = ?auto_24239 ?auto_24248 ) ) ( not ( = ?auto_24239 ?auto_24278 ) ) ( not ( = ?auto_24240 ?auto_24248 ) ) ( not ( = ?auto_24240 ?auto_24278 ) ) ( not ( = ?auto_24241 ?auto_24248 ) ) ( not ( = ?auto_24241 ?auto_24278 ) ) ( not ( = ?auto_24242 ?auto_24248 ) ) ( not ( = ?auto_24242 ?auto_24278 ) ) ( not ( = ?auto_24243 ?auto_24248 ) ) ( not ( = ?auto_24243 ?auto_24278 ) ) ( not ( = ?auto_24244 ?auto_24248 ) ) ( not ( = ?auto_24244 ?auto_24278 ) ) ( not ( = ?auto_24247 ?auto_24248 ) ) ( not ( = ?auto_24247 ?auto_24278 ) ) ( not ( = ?auto_24246 ?auto_24248 ) ) ( not ( = ?auto_24246 ?auto_24278 ) ) ( not ( = ?auto_24248 ?auto_24261 ) ) ( not ( = ?auto_24248 ?auto_24274 ) ) ( not ( = ?auto_24248 ?auto_24262 ) ) ( not ( = ?auto_24248 ?auto_24284 ) ) ( not ( = ?auto_24248 ?auto_24265 ) ) ( not ( = ?auto_24248 ?auto_24267 ) ) ( not ( = ?auto_24248 ?auto_24277 ) ) ( not ( = ?auto_24248 ?auto_24275 ) ) ( not ( = ?auto_24278 ?auto_24261 ) ) ( not ( = ?auto_24278 ?auto_24274 ) ) ( not ( = ?auto_24278 ?auto_24262 ) ) ( not ( = ?auto_24278 ?auto_24284 ) ) ( not ( = ?auto_24278 ?auto_24265 ) ) ( not ( = ?auto_24278 ?auto_24267 ) ) ( not ( = ?auto_24278 ?auto_24277 ) ) ( not ( = ?auto_24278 ?auto_24275 ) ) ( not ( = ?auto_24239 ?auto_24250 ) ) ( not ( = ?auto_24239 ?auto_24260 ) ) ( not ( = ?auto_24240 ?auto_24250 ) ) ( not ( = ?auto_24240 ?auto_24260 ) ) ( not ( = ?auto_24241 ?auto_24250 ) ) ( not ( = ?auto_24241 ?auto_24260 ) ) ( not ( = ?auto_24242 ?auto_24250 ) ) ( not ( = ?auto_24242 ?auto_24260 ) ) ( not ( = ?auto_24243 ?auto_24250 ) ) ( not ( = ?auto_24243 ?auto_24260 ) ) ( not ( = ?auto_24244 ?auto_24250 ) ) ( not ( = ?auto_24244 ?auto_24260 ) ) ( not ( = ?auto_24247 ?auto_24250 ) ) ( not ( = ?auto_24247 ?auto_24260 ) ) ( not ( = ?auto_24246 ?auto_24250 ) ) ( not ( = ?auto_24246 ?auto_24260 ) ) ( not ( = ?auto_24245 ?auto_24250 ) ) ( not ( = ?auto_24245 ?auto_24260 ) ) ( not ( = ?auto_24250 ?auto_24278 ) ) ( not ( = ?auto_24250 ?auto_24261 ) ) ( not ( = ?auto_24250 ?auto_24274 ) ) ( not ( = ?auto_24250 ?auto_24262 ) ) ( not ( = ?auto_24250 ?auto_24284 ) ) ( not ( = ?auto_24250 ?auto_24265 ) ) ( not ( = ?auto_24250 ?auto_24267 ) ) ( not ( = ?auto_24250 ?auto_24277 ) ) ( not ( = ?auto_24250 ?auto_24275 ) ) ( not ( = ?auto_24268 ?auto_24256 ) ) ( not ( = ?auto_24268 ?auto_24264 ) ) ( not ( = ?auto_24268 ?auto_24283 ) ) ( not ( = ?auto_24268 ?auto_24266 ) ) ( not ( = ?auto_24268 ?auto_24282 ) ) ( not ( = ?auto_24263 ?auto_24255 ) ) ( not ( = ?auto_24263 ?auto_24270 ) ) ( not ( = ?auto_24263 ?auto_24276 ) ) ( not ( = ?auto_24263 ?auto_24272 ) ) ( not ( = ?auto_24263 ?auto_24271 ) ) ( not ( = ?auto_24260 ?auto_24278 ) ) ( not ( = ?auto_24260 ?auto_24261 ) ) ( not ( = ?auto_24260 ?auto_24274 ) ) ( not ( = ?auto_24260 ?auto_24262 ) ) ( not ( = ?auto_24260 ?auto_24284 ) ) ( not ( = ?auto_24260 ?auto_24265 ) ) ( not ( = ?auto_24260 ?auto_24267 ) ) ( not ( = ?auto_24260 ?auto_24277 ) ) ( not ( = ?auto_24260 ?auto_24275 ) ) ( not ( = ?auto_24239 ?auto_24249 ) ) ( not ( = ?auto_24239 ?auto_24273 ) ) ( not ( = ?auto_24240 ?auto_24249 ) ) ( not ( = ?auto_24240 ?auto_24273 ) ) ( not ( = ?auto_24241 ?auto_24249 ) ) ( not ( = ?auto_24241 ?auto_24273 ) ) ( not ( = ?auto_24242 ?auto_24249 ) ) ( not ( = ?auto_24242 ?auto_24273 ) ) ( not ( = ?auto_24243 ?auto_24249 ) ) ( not ( = ?auto_24243 ?auto_24273 ) ) ( not ( = ?auto_24244 ?auto_24249 ) ) ( not ( = ?auto_24244 ?auto_24273 ) ) ( not ( = ?auto_24247 ?auto_24249 ) ) ( not ( = ?auto_24247 ?auto_24273 ) ) ( not ( = ?auto_24246 ?auto_24249 ) ) ( not ( = ?auto_24246 ?auto_24273 ) ) ( not ( = ?auto_24245 ?auto_24249 ) ) ( not ( = ?auto_24245 ?auto_24273 ) ) ( not ( = ?auto_24248 ?auto_24249 ) ) ( not ( = ?auto_24248 ?auto_24273 ) ) ( not ( = ?auto_24249 ?auto_24260 ) ) ( not ( = ?auto_24249 ?auto_24278 ) ) ( not ( = ?auto_24249 ?auto_24261 ) ) ( not ( = ?auto_24249 ?auto_24274 ) ) ( not ( = ?auto_24249 ?auto_24262 ) ) ( not ( = ?auto_24249 ?auto_24284 ) ) ( not ( = ?auto_24249 ?auto_24265 ) ) ( not ( = ?auto_24249 ?auto_24267 ) ) ( not ( = ?auto_24249 ?auto_24277 ) ) ( not ( = ?auto_24249 ?auto_24275 ) ) ( not ( = ?auto_24273 ?auto_24260 ) ) ( not ( = ?auto_24273 ?auto_24278 ) ) ( not ( = ?auto_24273 ?auto_24261 ) ) ( not ( = ?auto_24273 ?auto_24274 ) ) ( not ( = ?auto_24273 ?auto_24262 ) ) ( not ( = ?auto_24273 ?auto_24284 ) ) ( not ( = ?auto_24273 ?auto_24265 ) ) ( not ( = ?auto_24273 ?auto_24267 ) ) ( not ( = ?auto_24273 ?auto_24277 ) ) ( not ( = ?auto_24273 ?auto_24275 ) ) ( not ( = ?auto_24239 ?auto_24251 ) ) ( not ( = ?auto_24239 ?auto_24281 ) ) ( not ( = ?auto_24240 ?auto_24251 ) ) ( not ( = ?auto_24240 ?auto_24281 ) ) ( not ( = ?auto_24241 ?auto_24251 ) ) ( not ( = ?auto_24241 ?auto_24281 ) ) ( not ( = ?auto_24242 ?auto_24251 ) ) ( not ( = ?auto_24242 ?auto_24281 ) ) ( not ( = ?auto_24243 ?auto_24251 ) ) ( not ( = ?auto_24243 ?auto_24281 ) ) ( not ( = ?auto_24244 ?auto_24251 ) ) ( not ( = ?auto_24244 ?auto_24281 ) ) ( not ( = ?auto_24247 ?auto_24251 ) ) ( not ( = ?auto_24247 ?auto_24281 ) ) ( not ( = ?auto_24246 ?auto_24251 ) ) ( not ( = ?auto_24246 ?auto_24281 ) ) ( not ( = ?auto_24245 ?auto_24251 ) ) ( not ( = ?auto_24245 ?auto_24281 ) ) ( not ( = ?auto_24248 ?auto_24251 ) ) ( not ( = ?auto_24248 ?auto_24281 ) ) ( not ( = ?auto_24250 ?auto_24251 ) ) ( not ( = ?auto_24250 ?auto_24281 ) ) ( not ( = ?auto_24251 ?auto_24273 ) ) ( not ( = ?auto_24251 ?auto_24260 ) ) ( not ( = ?auto_24251 ?auto_24278 ) ) ( not ( = ?auto_24251 ?auto_24261 ) ) ( not ( = ?auto_24251 ?auto_24274 ) ) ( not ( = ?auto_24251 ?auto_24262 ) ) ( not ( = ?auto_24251 ?auto_24284 ) ) ( not ( = ?auto_24251 ?auto_24265 ) ) ( not ( = ?auto_24251 ?auto_24267 ) ) ( not ( = ?auto_24251 ?auto_24277 ) ) ( not ( = ?auto_24251 ?auto_24275 ) ) ( not ( = ?auto_24280 ?auto_24283 ) ) ( not ( = ?auto_24280 ?auto_24268 ) ) ( not ( = ?auto_24280 ?auto_24256 ) ) ( not ( = ?auto_24280 ?auto_24264 ) ) ( not ( = ?auto_24280 ?auto_24266 ) ) ( not ( = ?auto_24280 ?auto_24282 ) ) ( not ( = ?auto_24269 ?auto_24276 ) ) ( not ( = ?auto_24269 ?auto_24263 ) ) ( not ( = ?auto_24269 ?auto_24255 ) ) ( not ( = ?auto_24269 ?auto_24270 ) ) ( not ( = ?auto_24269 ?auto_24272 ) ) ( not ( = ?auto_24269 ?auto_24271 ) ) ( not ( = ?auto_24281 ?auto_24273 ) ) ( not ( = ?auto_24281 ?auto_24260 ) ) ( not ( = ?auto_24281 ?auto_24278 ) ) ( not ( = ?auto_24281 ?auto_24261 ) ) ( not ( = ?auto_24281 ?auto_24274 ) ) ( not ( = ?auto_24281 ?auto_24262 ) ) ( not ( = ?auto_24281 ?auto_24284 ) ) ( not ( = ?auto_24281 ?auto_24265 ) ) ( not ( = ?auto_24281 ?auto_24267 ) ) ( not ( = ?auto_24281 ?auto_24277 ) ) ( not ( = ?auto_24281 ?auto_24275 ) ) ( not ( = ?auto_24239 ?auto_24253 ) ) ( not ( = ?auto_24239 ?auto_24279 ) ) ( not ( = ?auto_24240 ?auto_24253 ) ) ( not ( = ?auto_24240 ?auto_24279 ) ) ( not ( = ?auto_24241 ?auto_24253 ) ) ( not ( = ?auto_24241 ?auto_24279 ) ) ( not ( = ?auto_24242 ?auto_24253 ) ) ( not ( = ?auto_24242 ?auto_24279 ) ) ( not ( = ?auto_24243 ?auto_24253 ) ) ( not ( = ?auto_24243 ?auto_24279 ) ) ( not ( = ?auto_24244 ?auto_24253 ) ) ( not ( = ?auto_24244 ?auto_24279 ) ) ( not ( = ?auto_24247 ?auto_24253 ) ) ( not ( = ?auto_24247 ?auto_24279 ) ) ( not ( = ?auto_24246 ?auto_24253 ) ) ( not ( = ?auto_24246 ?auto_24279 ) ) ( not ( = ?auto_24245 ?auto_24253 ) ) ( not ( = ?auto_24245 ?auto_24279 ) ) ( not ( = ?auto_24248 ?auto_24253 ) ) ( not ( = ?auto_24248 ?auto_24279 ) ) ( not ( = ?auto_24250 ?auto_24253 ) ) ( not ( = ?auto_24250 ?auto_24279 ) ) ( not ( = ?auto_24249 ?auto_24253 ) ) ( not ( = ?auto_24249 ?auto_24279 ) ) ( not ( = ?auto_24253 ?auto_24281 ) ) ( not ( = ?auto_24253 ?auto_24273 ) ) ( not ( = ?auto_24253 ?auto_24260 ) ) ( not ( = ?auto_24253 ?auto_24278 ) ) ( not ( = ?auto_24253 ?auto_24261 ) ) ( not ( = ?auto_24253 ?auto_24274 ) ) ( not ( = ?auto_24253 ?auto_24262 ) ) ( not ( = ?auto_24253 ?auto_24284 ) ) ( not ( = ?auto_24253 ?auto_24265 ) ) ( not ( = ?auto_24253 ?auto_24267 ) ) ( not ( = ?auto_24253 ?auto_24277 ) ) ( not ( = ?auto_24253 ?auto_24275 ) ) ( not ( = ?auto_24279 ?auto_24281 ) ) ( not ( = ?auto_24279 ?auto_24273 ) ) ( not ( = ?auto_24279 ?auto_24260 ) ) ( not ( = ?auto_24279 ?auto_24278 ) ) ( not ( = ?auto_24279 ?auto_24261 ) ) ( not ( = ?auto_24279 ?auto_24274 ) ) ( not ( = ?auto_24279 ?auto_24262 ) ) ( not ( = ?auto_24279 ?auto_24284 ) ) ( not ( = ?auto_24279 ?auto_24265 ) ) ( not ( = ?auto_24279 ?auto_24267 ) ) ( not ( = ?auto_24279 ?auto_24277 ) ) ( not ( = ?auto_24279 ?auto_24275 ) ) ( not ( = ?auto_24239 ?auto_24252 ) ) ( not ( = ?auto_24239 ?auto_24259 ) ) ( not ( = ?auto_24240 ?auto_24252 ) ) ( not ( = ?auto_24240 ?auto_24259 ) ) ( not ( = ?auto_24241 ?auto_24252 ) ) ( not ( = ?auto_24241 ?auto_24259 ) ) ( not ( = ?auto_24242 ?auto_24252 ) ) ( not ( = ?auto_24242 ?auto_24259 ) ) ( not ( = ?auto_24243 ?auto_24252 ) ) ( not ( = ?auto_24243 ?auto_24259 ) ) ( not ( = ?auto_24244 ?auto_24252 ) ) ( not ( = ?auto_24244 ?auto_24259 ) ) ( not ( = ?auto_24247 ?auto_24252 ) ) ( not ( = ?auto_24247 ?auto_24259 ) ) ( not ( = ?auto_24246 ?auto_24252 ) ) ( not ( = ?auto_24246 ?auto_24259 ) ) ( not ( = ?auto_24245 ?auto_24252 ) ) ( not ( = ?auto_24245 ?auto_24259 ) ) ( not ( = ?auto_24248 ?auto_24252 ) ) ( not ( = ?auto_24248 ?auto_24259 ) ) ( not ( = ?auto_24250 ?auto_24252 ) ) ( not ( = ?auto_24250 ?auto_24259 ) ) ( not ( = ?auto_24249 ?auto_24252 ) ) ( not ( = ?auto_24249 ?auto_24259 ) ) ( not ( = ?auto_24251 ?auto_24252 ) ) ( not ( = ?auto_24251 ?auto_24259 ) ) ( not ( = ?auto_24252 ?auto_24279 ) ) ( not ( = ?auto_24252 ?auto_24281 ) ) ( not ( = ?auto_24252 ?auto_24273 ) ) ( not ( = ?auto_24252 ?auto_24260 ) ) ( not ( = ?auto_24252 ?auto_24278 ) ) ( not ( = ?auto_24252 ?auto_24261 ) ) ( not ( = ?auto_24252 ?auto_24274 ) ) ( not ( = ?auto_24252 ?auto_24262 ) ) ( not ( = ?auto_24252 ?auto_24284 ) ) ( not ( = ?auto_24252 ?auto_24265 ) ) ( not ( = ?auto_24252 ?auto_24267 ) ) ( not ( = ?auto_24252 ?auto_24277 ) ) ( not ( = ?auto_24252 ?auto_24275 ) ) ( not ( = ?auto_24259 ?auto_24279 ) ) ( not ( = ?auto_24259 ?auto_24281 ) ) ( not ( = ?auto_24259 ?auto_24273 ) ) ( not ( = ?auto_24259 ?auto_24260 ) ) ( not ( = ?auto_24259 ?auto_24278 ) ) ( not ( = ?auto_24259 ?auto_24261 ) ) ( not ( = ?auto_24259 ?auto_24274 ) ) ( not ( = ?auto_24259 ?auto_24262 ) ) ( not ( = ?auto_24259 ?auto_24284 ) ) ( not ( = ?auto_24259 ?auto_24265 ) ) ( not ( = ?auto_24259 ?auto_24267 ) ) ( not ( = ?auto_24259 ?auto_24277 ) ) ( not ( = ?auto_24259 ?auto_24275 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_24239 ?auto_24240 ?auto_24241 ?auto_24242 ?auto_24243 ?auto_24244 ?auto_24247 ?auto_24246 ?auto_24245 ?auto_24248 ?auto_24250 ?auto_24249 ?auto_24251 ?auto_24253 )
      ( MAKE-1CRATE ?auto_24253 ?auto_24252 )
      ( MAKE-14CRATE-VERIFY ?auto_24239 ?auto_24240 ?auto_24241 ?auto_24242 ?auto_24243 ?auto_24244 ?auto_24247 ?auto_24246 ?auto_24245 ?auto_24248 ?auto_24250 ?auto_24249 ?auto_24251 ?auto_24253 ?auto_24252 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24287 - SURFACE
      ?auto_24288 - SURFACE
    )
    :vars
    (
      ?auto_24289 - HOIST
      ?auto_24290 - PLACE
      ?auto_24292 - PLACE
      ?auto_24293 - HOIST
      ?auto_24294 - SURFACE
      ?auto_24291 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24289 ?auto_24290 ) ( SURFACE-AT ?auto_24287 ?auto_24290 ) ( CLEAR ?auto_24287 ) ( IS-CRATE ?auto_24288 ) ( AVAILABLE ?auto_24289 ) ( not ( = ?auto_24292 ?auto_24290 ) ) ( HOIST-AT ?auto_24293 ?auto_24292 ) ( AVAILABLE ?auto_24293 ) ( SURFACE-AT ?auto_24288 ?auto_24292 ) ( ON ?auto_24288 ?auto_24294 ) ( CLEAR ?auto_24288 ) ( TRUCK-AT ?auto_24291 ?auto_24290 ) ( not ( = ?auto_24287 ?auto_24288 ) ) ( not ( = ?auto_24287 ?auto_24294 ) ) ( not ( = ?auto_24288 ?auto_24294 ) ) ( not ( = ?auto_24289 ?auto_24293 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24291 ?auto_24290 ?auto_24292 )
      ( !LIFT ?auto_24293 ?auto_24288 ?auto_24294 ?auto_24292 )
      ( !LOAD ?auto_24293 ?auto_24288 ?auto_24291 ?auto_24292 )
      ( !DRIVE ?auto_24291 ?auto_24292 ?auto_24290 )
      ( !UNLOAD ?auto_24289 ?auto_24288 ?auto_24291 ?auto_24290 )
      ( !DROP ?auto_24289 ?auto_24288 ?auto_24287 ?auto_24290 )
      ( MAKE-1CRATE-VERIFY ?auto_24287 ?auto_24288 ) )
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
      ?auto_24319 - SURFACE
      ?auto_24318 - SURFACE
      ?auto_24317 - SURFACE
      ?auto_24320 - SURFACE
      ?auto_24322 - SURFACE
      ?auto_24321 - SURFACE
      ?auto_24323 - SURFACE
      ?auto_24325 - SURFACE
      ?auto_24324 - SURFACE
      ?auto_24326 - SURFACE
    )
    :vars
    (
      ?auto_24328 - HOIST
      ?auto_24331 - PLACE
      ?auto_24332 - PLACE
      ?auto_24329 - HOIST
      ?auto_24327 - SURFACE
      ?auto_24339 - PLACE
      ?auto_24334 - HOIST
      ?auto_24349 - SURFACE
      ?auto_24337 - SURFACE
      ?auto_24345 - PLACE
      ?auto_24358 - HOIST
      ?auto_24352 - SURFACE
      ?auto_24344 - SURFACE
      ?auto_24357 - PLACE
      ?auto_24350 - HOIST
      ?auto_24335 - SURFACE
      ?auto_24346 - SURFACE
      ?auto_24353 - PLACE
      ?auto_24340 - HOIST
      ?auto_24347 - SURFACE
      ?auto_24351 - SURFACE
      ?auto_24355 - SURFACE
      ?auto_24356 - PLACE
      ?auto_24338 - HOIST
      ?auto_24348 - SURFACE
      ?auto_24354 - SURFACE
      ?auto_24336 - SURFACE
      ?auto_24333 - SURFACE
      ?auto_24341 - PLACE
      ?auto_24342 - HOIST
      ?auto_24343 - SURFACE
      ?auto_24330 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24328 ?auto_24331 ) ( IS-CRATE ?auto_24326 ) ( not ( = ?auto_24332 ?auto_24331 ) ) ( HOIST-AT ?auto_24329 ?auto_24332 ) ( SURFACE-AT ?auto_24326 ?auto_24332 ) ( ON ?auto_24326 ?auto_24327 ) ( CLEAR ?auto_24326 ) ( not ( = ?auto_24324 ?auto_24326 ) ) ( not ( = ?auto_24324 ?auto_24327 ) ) ( not ( = ?auto_24326 ?auto_24327 ) ) ( not ( = ?auto_24328 ?auto_24329 ) ) ( IS-CRATE ?auto_24324 ) ( not ( = ?auto_24339 ?auto_24331 ) ) ( HOIST-AT ?auto_24334 ?auto_24339 ) ( SURFACE-AT ?auto_24324 ?auto_24339 ) ( ON ?auto_24324 ?auto_24349 ) ( CLEAR ?auto_24324 ) ( not ( = ?auto_24325 ?auto_24324 ) ) ( not ( = ?auto_24325 ?auto_24349 ) ) ( not ( = ?auto_24324 ?auto_24349 ) ) ( not ( = ?auto_24328 ?auto_24334 ) ) ( IS-CRATE ?auto_24325 ) ( SURFACE-AT ?auto_24325 ?auto_24339 ) ( ON ?auto_24325 ?auto_24337 ) ( CLEAR ?auto_24325 ) ( not ( = ?auto_24323 ?auto_24325 ) ) ( not ( = ?auto_24323 ?auto_24337 ) ) ( not ( = ?auto_24325 ?auto_24337 ) ) ( IS-CRATE ?auto_24323 ) ( not ( = ?auto_24345 ?auto_24331 ) ) ( HOIST-AT ?auto_24358 ?auto_24345 ) ( AVAILABLE ?auto_24358 ) ( SURFACE-AT ?auto_24323 ?auto_24345 ) ( ON ?auto_24323 ?auto_24352 ) ( CLEAR ?auto_24323 ) ( not ( = ?auto_24321 ?auto_24323 ) ) ( not ( = ?auto_24321 ?auto_24352 ) ) ( not ( = ?auto_24323 ?auto_24352 ) ) ( not ( = ?auto_24328 ?auto_24358 ) ) ( IS-CRATE ?auto_24321 ) ( SURFACE-AT ?auto_24321 ?auto_24332 ) ( ON ?auto_24321 ?auto_24344 ) ( CLEAR ?auto_24321 ) ( not ( = ?auto_24322 ?auto_24321 ) ) ( not ( = ?auto_24322 ?auto_24344 ) ) ( not ( = ?auto_24321 ?auto_24344 ) ) ( IS-CRATE ?auto_24322 ) ( not ( = ?auto_24357 ?auto_24331 ) ) ( HOIST-AT ?auto_24350 ?auto_24357 ) ( AVAILABLE ?auto_24350 ) ( SURFACE-AT ?auto_24322 ?auto_24357 ) ( ON ?auto_24322 ?auto_24335 ) ( CLEAR ?auto_24322 ) ( not ( = ?auto_24320 ?auto_24322 ) ) ( not ( = ?auto_24320 ?auto_24335 ) ) ( not ( = ?auto_24322 ?auto_24335 ) ) ( not ( = ?auto_24328 ?auto_24350 ) ) ( IS-CRATE ?auto_24320 ) ( SURFACE-AT ?auto_24320 ?auto_24339 ) ( ON ?auto_24320 ?auto_24346 ) ( CLEAR ?auto_24320 ) ( not ( = ?auto_24317 ?auto_24320 ) ) ( not ( = ?auto_24317 ?auto_24346 ) ) ( not ( = ?auto_24320 ?auto_24346 ) ) ( IS-CRATE ?auto_24317 ) ( not ( = ?auto_24353 ?auto_24331 ) ) ( HOIST-AT ?auto_24340 ?auto_24353 ) ( SURFACE-AT ?auto_24317 ?auto_24353 ) ( ON ?auto_24317 ?auto_24347 ) ( CLEAR ?auto_24317 ) ( not ( = ?auto_24318 ?auto_24317 ) ) ( not ( = ?auto_24318 ?auto_24347 ) ) ( not ( = ?auto_24317 ?auto_24347 ) ) ( not ( = ?auto_24328 ?auto_24340 ) ) ( IS-CRATE ?auto_24318 ) ( SURFACE-AT ?auto_24318 ?auto_24332 ) ( ON ?auto_24318 ?auto_24351 ) ( CLEAR ?auto_24318 ) ( not ( = ?auto_24319 ?auto_24318 ) ) ( not ( = ?auto_24319 ?auto_24351 ) ) ( not ( = ?auto_24318 ?auto_24351 ) ) ( IS-CRATE ?auto_24319 ) ( AVAILABLE ?auto_24340 ) ( SURFACE-AT ?auto_24319 ?auto_24353 ) ( ON ?auto_24319 ?auto_24355 ) ( CLEAR ?auto_24319 ) ( not ( = ?auto_24316 ?auto_24319 ) ) ( not ( = ?auto_24316 ?auto_24355 ) ) ( not ( = ?auto_24319 ?auto_24355 ) ) ( IS-CRATE ?auto_24316 ) ( not ( = ?auto_24356 ?auto_24331 ) ) ( HOIST-AT ?auto_24338 ?auto_24356 ) ( SURFACE-AT ?auto_24316 ?auto_24356 ) ( ON ?auto_24316 ?auto_24348 ) ( CLEAR ?auto_24316 ) ( not ( = ?auto_24315 ?auto_24316 ) ) ( not ( = ?auto_24315 ?auto_24348 ) ) ( not ( = ?auto_24316 ?auto_24348 ) ) ( not ( = ?auto_24328 ?auto_24338 ) ) ( IS-CRATE ?auto_24315 ) ( AVAILABLE ?auto_24334 ) ( SURFACE-AT ?auto_24315 ?auto_24339 ) ( ON ?auto_24315 ?auto_24354 ) ( CLEAR ?auto_24315 ) ( not ( = ?auto_24314 ?auto_24315 ) ) ( not ( = ?auto_24314 ?auto_24354 ) ) ( not ( = ?auto_24315 ?auto_24354 ) ) ( IS-CRATE ?auto_24314 ) ( AVAILABLE ?auto_24338 ) ( SURFACE-AT ?auto_24314 ?auto_24356 ) ( ON ?auto_24314 ?auto_24336 ) ( CLEAR ?auto_24314 ) ( not ( = ?auto_24313 ?auto_24314 ) ) ( not ( = ?auto_24313 ?auto_24336 ) ) ( not ( = ?auto_24314 ?auto_24336 ) ) ( IS-CRATE ?auto_24313 ) ( AVAILABLE ?auto_24329 ) ( SURFACE-AT ?auto_24313 ?auto_24332 ) ( ON ?auto_24313 ?auto_24333 ) ( CLEAR ?auto_24313 ) ( not ( = ?auto_24312 ?auto_24313 ) ) ( not ( = ?auto_24312 ?auto_24333 ) ) ( not ( = ?auto_24313 ?auto_24333 ) ) ( SURFACE-AT ?auto_24311 ?auto_24331 ) ( CLEAR ?auto_24311 ) ( IS-CRATE ?auto_24312 ) ( AVAILABLE ?auto_24328 ) ( not ( = ?auto_24341 ?auto_24331 ) ) ( HOIST-AT ?auto_24342 ?auto_24341 ) ( AVAILABLE ?auto_24342 ) ( SURFACE-AT ?auto_24312 ?auto_24341 ) ( ON ?auto_24312 ?auto_24343 ) ( CLEAR ?auto_24312 ) ( TRUCK-AT ?auto_24330 ?auto_24331 ) ( not ( = ?auto_24311 ?auto_24312 ) ) ( not ( = ?auto_24311 ?auto_24343 ) ) ( not ( = ?auto_24312 ?auto_24343 ) ) ( not ( = ?auto_24328 ?auto_24342 ) ) ( not ( = ?auto_24311 ?auto_24313 ) ) ( not ( = ?auto_24311 ?auto_24333 ) ) ( not ( = ?auto_24313 ?auto_24343 ) ) ( not ( = ?auto_24332 ?auto_24341 ) ) ( not ( = ?auto_24329 ?auto_24342 ) ) ( not ( = ?auto_24333 ?auto_24343 ) ) ( not ( = ?auto_24311 ?auto_24314 ) ) ( not ( = ?auto_24311 ?auto_24336 ) ) ( not ( = ?auto_24312 ?auto_24314 ) ) ( not ( = ?auto_24312 ?auto_24336 ) ) ( not ( = ?auto_24314 ?auto_24333 ) ) ( not ( = ?auto_24314 ?auto_24343 ) ) ( not ( = ?auto_24356 ?auto_24332 ) ) ( not ( = ?auto_24356 ?auto_24341 ) ) ( not ( = ?auto_24338 ?auto_24329 ) ) ( not ( = ?auto_24338 ?auto_24342 ) ) ( not ( = ?auto_24336 ?auto_24333 ) ) ( not ( = ?auto_24336 ?auto_24343 ) ) ( not ( = ?auto_24311 ?auto_24315 ) ) ( not ( = ?auto_24311 ?auto_24354 ) ) ( not ( = ?auto_24312 ?auto_24315 ) ) ( not ( = ?auto_24312 ?auto_24354 ) ) ( not ( = ?auto_24313 ?auto_24315 ) ) ( not ( = ?auto_24313 ?auto_24354 ) ) ( not ( = ?auto_24315 ?auto_24336 ) ) ( not ( = ?auto_24315 ?auto_24333 ) ) ( not ( = ?auto_24315 ?auto_24343 ) ) ( not ( = ?auto_24339 ?auto_24356 ) ) ( not ( = ?auto_24339 ?auto_24332 ) ) ( not ( = ?auto_24339 ?auto_24341 ) ) ( not ( = ?auto_24334 ?auto_24338 ) ) ( not ( = ?auto_24334 ?auto_24329 ) ) ( not ( = ?auto_24334 ?auto_24342 ) ) ( not ( = ?auto_24354 ?auto_24336 ) ) ( not ( = ?auto_24354 ?auto_24333 ) ) ( not ( = ?auto_24354 ?auto_24343 ) ) ( not ( = ?auto_24311 ?auto_24316 ) ) ( not ( = ?auto_24311 ?auto_24348 ) ) ( not ( = ?auto_24312 ?auto_24316 ) ) ( not ( = ?auto_24312 ?auto_24348 ) ) ( not ( = ?auto_24313 ?auto_24316 ) ) ( not ( = ?auto_24313 ?auto_24348 ) ) ( not ( = ?auto_24314 ?auto_24316 ) ) ( not ( = ?auto_24314 ?auto_24348 ) ) ( not ( = ?auto_24316 ?auto_24354 ) ) ( not ( = ?auto_24316 ?auto_24336 ) ) ( not ( = ?auto_24316 ?auto_24333 ) ) ( not ( = ?auto_24316 ?auto_24343 ) ) ( not ( = ?auto_24348 ?auto_24354 ) ) ( not ( = ?auto_24348 ?auto_24336 ) ) ( not ( = ?auto_24348 ?auto_24333 ) ) ( not ( = ?auto_24348 ?auto_24343 ) ) ( not ( = ?auto_24311 ?auto_24319 ) ) ( not ( = ?auto_24311 ?auto_24355 ) ) ( not ( = ?auto_24312 ?auto_24319 ) ) ( not ( = ?auto_24312 ?auto_24355 ) ) ( not ( = ?auto_24313 ?auto_24319 ) ) ( not ( = ?auto_24313 ?auto_24355 ) ) ( not ( = ?auto_24314 ?auto_24319 ) ) ( not ( = ?auto_24314 ?auto_24355 ) ) ( not ( = ?auto_24315 ?auto_24319 ) ) ( not ( = ?auto_24315 ?auto_24355 ) ) ( not ( = ?auto_24319 ?auto_24348 ) ) ( not ( = ?auto_24319 ?auto_24354 ) ) ( not ( = ?auto_24319 ?auto_24336 ) ) ( not ( = ?auto_24319 ?auto_24333 ) ) ( not ( = ?auto_24319 ?auto_24343 ) ) ( not ( = ?auto_24353 ?auto_24356 ) ) ( not ( = ?auto_24353 ?auto_24339 ) ) ( not ( = ?auto_24353 ?auto_24332 ) ) ( not ( = ?auto_24353 ?auto_24341 ) ) ( not ( = ?auto_24340 ?auto_24338 ) ) ( not ( = ?auto_24340 ?auto_24334 ) ) ( not ( = ?auto_24340 ?auto_24329 ) ) ( not ( = ?auto_24340 ?auto_24342 ) ) ( not ( = ?auto_24355 ?auto_24348 ) ) ( not ( = ?auto_24355 ?auto_24354 ) ) ( not ( = ?auto_24355 ?auto_24336 ) ) ( not ( = ?auto_24355 ?auto_24333 ) ) ( not ( = ?auto_24355 ?auto_24343 ) ) ( not ( = ?auto_24311 ?auto_24318 ) ) ( not ( = ?auto_24311 ?auto_24351 ) ) ( not ( = ?auto_24312 ?auto_24318 ) ) ( not ( = ?auto_24312 ?auto_24351 ) ) ( not ( = ?auto_24313 ?auto_24318 ) ) ( not ( = ?auto_24313 ?auto_24351 ) ) ( not ( = ?auto_24314 ?auto_24318 ) ) ( not ( = ?auto_24314 ?auto_24351 ) ) ( not ( = ?auto_24315 ?auto_24318 ) ) ( not ( = ?auto_24315 ?auto_24351 ) ) ( not ( = ?auto_24316 ?auto_24318 ) ) ( not ( = ?auto_24316 ?auto_24351 ) ) ( not ( = ?auto_24318 ?auto_24355 ) ) ( not ( = ?auto_24318 ?auto_24348 ) ) ( not ( = ?auto_24318 ?auto_24354 ) ) ( not ( = ?auto_24318 ?auto_24336 ) ) ( not ( = ?auto_24318 ?auto_24333 ) ) ( not ( = ?auto_24318 ?auto_24343 ) ) ( not ( = ?auto_24351 ?auto_24355 ) ) ( not ( = ?auto_24351 ?auto_24348 ) ) ( not ( = ?auto_24351 ?auto_24354 ) ) ( not ( = ?auto_24351 ?auto_24336 ) ) ( not ( = ?auto_24351 ?auto_24333 ) ) ( not ( = ?auto_24351 ?auto_24343 ) ) ( not ( = ?auto_24311 ?auto_24317 ) ) ( not ( = ?auto_24311 ?auto_24347 ) ) ( not ( = ?auto_24312 ?auto_24317 ) ) ( not ( = ?auto_24312 ?auto_24347 ) ) ( not ( = ?auto_24313 ?auto_24317 ) ) ( not ( = ?auto_24313 ?auto_24347 ) ) ( not ( = ?auto_24314 ?auto_24317 ) ) ( not ( = ?auto_24314 ?auto_24347 ) ) ( not ( = ?auto_24315 ?auto_24317 ) ) ( not ( = ?auto_24315 ?auto_24347 ) ) ( not ( = ?auto_24316 ?auto_24317 ) ) ( not ( = ?auto_24316 ?auto_24347 ) ) ( not ( = ?auto_24319 ?auto_24317 ) ) ( not ( = ?auto_24319 ?auto_24347 ) ) ( not ( = ?auto_24317 ?auto_24351 ) ) ( not ( = ?auto_24317 ?auto_24355 ) ) ( not ( = ?auto_24317 ?auto_24348 ) ) ( not ( = ?auto_24317 ?auto_24354 ) ) ( not ( = ?auto_24317 ?auto_24336 ) ) ( not ( = ?auto_24317 ?auto_24333 ) ) ( not ( = ?auto_24317 ?auto_24343 ) ) ( not ( = ?auto_24347 ?auto_24351 ) ) ( not ( = ?auto_24347 ?auto_24355 ) ) ( not ( = ?auto_24347 ?auto_24348 ) ) ( not ( = ?auto_24347 ?auto_24354 ) ) ( not ( = ?auto_24347 ?auto_24336 ) ) ( not ( = ?auto_24347 ?auto_24333 ) ) ( not ( = ?auto_24347 ?auto_24343 ) ) ( not ( = ?auto_24311 ?auto_24320 ) ) ( not ( = ?auto_24311 ?auto_24346 ) ) ( not ( = ?auto_24312 ?auto_24320 ) ) ( not ( = ?auto_24312 ?auto_24346 ) ) ( not ( = ?auto_24313 ?auto_24320 ) ) ( not ( = ?auto_24313 ?auto_24346 ) ) ( not ( = ?auto_24314 ?auto_24320 ) ) ( not ( = ?auto_24314 ?auto_24346 ) ) ( not ( = ?auto_24315 ?auto_24320 ) ) ( not ( = ?auto_24315 ?auto_24346 ) ) ( not ( = ?auto_24316 ?auto_24320 ) ) ( not ( = ?auto_24316 ?auto_24346 ) ) ( not ( = ?auto_24319 ?auto_24320 ) ) ( not ( = ?auto_24319 ?auto_24346 ) ) ( not ( = ?auto_24318 ?auto_24320 ) ) ( not ( = ?auto_24318 ?auto_24346 ) ) ( not ( = ?auto_24320 ?auto_24347 ) ) ( not ( = ?auto_24320 ?auto_24351 ) ) ( not ( = ?auto_24320 ?auto_24355 ) ) ( not ( = ?auto_24320 ?auto_24348 ) ) ( not ( = ?auto_24320 ?auto_24354 ) ) ( not ( = ?auto_24320 ?auto_24336 ) ) ( not ( = ?auto_24320 ?auto_24333 ) ) ( not ( = ?auto_24320 ?auto_24343 ) ) ( not ( = ?auto_24346 ?auto_24347 ) ) ( not ( = ?auto_24346 ?auto_24351 ) ) ( not ( = ?auto_24346 ?auto_24355 ) ) ( not ( = ?auto_24346 ?auto_24348 ) ) ( not ( = ?auto_24346 ?auto_24354 ) ) ( not ( = ?auto_24346 ?auto_24336 ) ) ( not ( = ?auto_24346 ?auto_24333 ) ) ( not ( = ?auto_24346 ?auto_24343 ) ) ( not ( = ?auto_24311 ?auto_24322 ) ) ( not ( = ?auto_24311 ?auto_24335 ) ) ( not ( = ?auto_24312 ?auto_24322 ) ) ( not ( = ?auto_24312 ?auto_24335 ) ) ( not ( = ?auto_24313 ?auto_24322 ) ) ( not ( = ?auto_24313 ?auto_24335 ) ) ( not ( = ?auto_24314 ?auto_24322 ) ) ( not ( = ?auto_24314 ?auto_24335 ) ) ( not ( = ?auto_24315 ?auto_24322 ) ) ( not ( = ?auto_24315 ?auto_24335 ) ) ( not ( = ?auto_24316 ?auto_24322 ) ) ( not ( = ?auto_24316 ?auto_24335 ) ) ( not ( = ?auto_24319 ?auto_24322 ) ) ( not ( = ?auto_24319 ?auto_24335 ) ) ( not ( = ?auto_24318 ?auto_24322 ) ) ( not ( = ?auto_24318 ?auto_24335 ) ) ( not ( = ?auto_24317 ?auto_24322 ) ) ( not ( = ?auto_24317 ?auto_24335 ) ) ( not ( = ?auto_24322 ?auto_24346 ) ) ( not ( = ?auto_24322 ?auto_24347 ) ) ( not ( = ?auto_24322 ?auto_24351 ) ) ( not ( = ?auto_24322 ?auto_24355 ) ) ( not ( = ?auto_24322 ?auto_24348 ) ) ( not ( = ?auto_24322 ?auto_24354 ) ) ( not ( = ?auto_24322 ?auto_24336 ) ) ( not ( = ?auto_24322 ?auto_24333 ) ) ( not ( = ?auto_24322 ?auto_24343 ) ) ( not ( = ?auto_24357 ?auto_24339 ) ) ( not ( = ?auto_24357 ?auto_24353 ) ) ( not ( = ?auto_24357 ?auto_24332 ) ) ( not ( = ?auto_24357 ?auto_24356 ) ) ( not ( = ?auto_24357 ?auto_24341 ) ) ( not ( = ?auto_24350 ?auto_24334 ) ) ( not ( = ?auto_24350 ?auto_24340 ) ) ( not ( = ?auto_24350 ?auto_24329 ) ) ( not ( = ?auto_24350 ?auto_24338 ) ) ( not ( = ?auto_24350 ?auto_24342 ) ) ( not ( = ?auto_24335 ?auto_24346 ) ) ( not ( = ?auto_24335 ?auto_24347 ) ) ( not ( = ?auto_24335 ?auto_24351 ) ) ( not ( = ?auto_24335 ?auto_24355 ) ) ( not ( = ?auto_24335 ?auto_24348 ) ) ( not ( = ?auto_24335 ?auto_24354 ) ) ( not ( = ?auto_24335 ?auto_24336 ) ) ( not ( = ?auto_24335 ?auto_24333 ) ) ( not ( = ?auto_24335 ?auto_24343 ) ) ( not ( = ?auto_24311 ?auto_24321 ) ) ( not ( = ?auto_24311 ?auto_24344 ) ) ( not ( = ?auto_24312 ?auto_24321 ) ) ( not ( = ?auto_24312 ?auto_24344 ) ) ( not ( = ?auto_24313 ?auto_24321 ) ) ( not ( = ?auto_24313 ?auto_24344 ) ) ( not ( = ?auto_24314 ?auto_24321 ) ) ( not ( = ?auto_24314 ?auto_24344 ) ) ( not ( = ?auto_24315 ?auto_24321 ) ) ( not ( = ?auto_24315 ?auto_24344 ) ) ( not ( = ?auto_24316 ?auto_24321 ) ) ( not ( = ?auto_24316 ?auto_24344 ) ) ( not ( = ?auto_24319 ?auto_24321 ) ) ( not ( = ?auto_24319 ?auto_24344 ) ) ( not ( = ?auto_24318 ?auto_24321 ) ) ( not ( = ?auto_24318 ?auto_24344 ) ) ( not ( = ?auto_24317 ?auto_24321 ) ) ( not ( = ?auto_24317 ?auto_24344 ) ) ( not ( = ?auto_24320 ?auto_24321 ) ) ( not ( = ?auto_24320 ?auto_24344 ) ) ( not ( = ?auto_24321 ?auto_24335 ) ) ( not ( = ?auto_24321 ?auto_24346 ) ) ( not ( = ?auto_24321 ?auto_24347 ) ) ( not ( = ?auto_24321 ?auto_24351 ) ) ( not ( = ?auto_24321 ?auto_24355 ) ) ( not ( = ?auto_24321 ?auto_24348 ) ) ( not ( = ?auto_24321 ?auto_24354 ) ) ( not ( = ?auto_24321 ?auto_24336 ) ) ( not ( = ?auto_24321 ?auto_24333 ) ) ( not ( = ?auto_24321 ?auto_24343 ) ) ( not ( = ?auto_24344 ?auto_24335 ) ) ( not ( = ?auto_24344 ?auto_24346 ) ) ( not ( = ?auto_24344 ?auto_24347 ) ) ( not ( = ?auto_24344 ?auto_24351 ) ) ( not ( = ?auto_24344 ?auto_24355 ) ) ( not ( = ?auto_24344 ?auto_24348 ) ) ( not ( = ?auto_24344 ?auto_24354 ) ) ( not ( = ?auto_24344 ?auto_24336 ) ) ( not ( = ?auto_24344 ?auto_24333 ) ) ( not ( = ?auto_24344 ?auto_24343 ) ) ( not ( = ?auto_24311 ?auto_24323 ) ) ( not ( = ?auto_24311 ?auto_24352 ) ) ( not ( = ?auto_24312 ?auto_24323 ) ) ( not ( = ?auto_24312 ?auto_24352 ) ) ( not ( = ?auto_24313 ?auto_24323 ) ) ( not ( = ?auto_24313 ?auto_24352 ) ) ( not ( = ?auto_24314 ?auto_24323 ) ) ( not ( = ?auto_24314 ?auto_24352 ) ) ( not ( = ?auto_24315 ?auto_24323 ) ) ( not ( = ?auto_24315 ?auto_24352 ) ) ( not ( = ?auto_24316 ?auto_24323 ) ) ( not ( = ?auto_24316 ?auto_24352 ) ) ( not ( = ?auto_24319 ?auto_24323 ) ) ( not ( = ?auto_24319 ?auto_24352 ) ) ( not ( = ?auto_24318 ?auto_24323 ) ) ( not ( = ?auto_24318 ?auto_24352 ) ) ( not ( = ?auto_24317 ?auto_24323 ) ) ( not ( = ?auto_24317 ?auto_24352 ) ) ( not ( = ?auto_24320 ?auto_24323 ) ) ( not ( = ?auto_24320 ?auto_24352 ) ) ( not ( = ?auto_24322 ?auto_24323 ) ) ( not ( = ?auto_24322 ?auto_24352 ) ) ( not ( = ?auto_24323 ?auto_24344 ) ) ( not ( = ?auto_24323 ?auto_24335 ) ) ( not ( = ?auto_24323 ?auto_24346 ) ) ( not ( = ?auto_24323 ?auto_24347 ) ) ( not ( = ?auto_24323 ?auto_24351 ) ) ( not ( = ?auto_24323 ?auto_24355 ) ) ( not ( = ?auto_24323 ?auto_24348 ) ) ( not ( = ?auto_24323 ?auto_24354 ) ) ( not ( = ?auto_24323 ?auto_24336 ) ) ( not ( = ?auto_24323 ?auto_24333 ) ) ( not ( = ?auto_24323 ?auto_24343 ) ) ( not ( = ?auto_24345 ?auto_24332 ) ) ( not ( = ?auto_24345 ?auto_24357 ) ) ( not ( = ?auto_24345 ?auto_24339 ) ) ( not ( = ?auto_24345 ?auto_24353 ) ) ( not ( = ?auto_24345 ?auto_24356 ) ) ( not ( = ?auto_24345 ?auto_24341 ) ) ( not ( = ?auto_24358 ?auto_24329 ) ) ( not ( = ?auto_24358 ?auto_24350 ) ) ( not ( = ?auto_24358 ?auto_24334 ) ) ( not ( = ?auto_24358 ?auto_24340 ) ) ( not ( = ?auto_24358 ?auto_24338 ) ) ( not ( = ?auto_24358 ?auto_24342 ) ) ( not ( = ?auto_24352 ?auto_24344 ) ) ( not ( = ?auto_24352 ?auto_24335 ) ) ( not ( = ?auto_24352 ?auto_24346 ) ) ( not ( = ?auto_24352 ?auto_24347 ) ) ( not ( = ?auto_24352 ?auto_24351 ) ) ( not ( = ?auto_24352 ?auto_24355 ) ) ( not ( = ?auto_24352 ?auto_24348 ) ) ( not ( = ?auto_24352 ?auto_24354 ) ) ( not ( = ?auto_24352 ?auto_24336 ) ) ( not ( = ?auto_24352 ?auto_24333 ) ) ( not ( = ?auto_24352 ?auto_24343 ) ) ( not ( = ?auto_24311 ?auto_24325 ) ) ( not ( = ?auto_24311 ?auto_24337 ) ) ( not ( = ?auto_24312 ?auto_24325 ) ) ( not ( = ?auto_24312 ?auto_24337 ) ) ( not ( = ?auto_24313 ?auto_24325 ) ) ( not ( = ?auto_24313 ?auto_24337 ) ) ( not ( = ?auto_24314 ?auto_24325 ) ) ( not ( = ?auto_24314 ?auto_24337 ) ) ( not ( = ?auto_24315 ?auto_24325 ) ) ( not ( = ?auto_24315 ?auto_24337 ) ) ( not ( = ?auto_24316 ?auto_24325 ) ) ( not ( = ?auto_24316 ?auto_24337 ) ) ( not ( = ?auto_24319 ?auto_24325 ) ) ( not ( = ?auto_24319 ?auto_24337 ) ) ( not ( = ?auto_24318 ?auto_24325 ) ) ( not ( = ?auto_24318 ?auto_24337 ) ) ( not ( = ?auto_24317 ?auto_24325 ) ) ( not ( = ?auto_24317 ?auto_24337 ) ) ( not ( = ?auto_24320 ?auto_24325 ) ) ( not ( = ?auto_24320 ?auto_24337 ) ) ( not ( = ?auto_24322 ?auto_24325 ) ) ( not ( = ?auto_24322 ?auto_24337 ) ) ( not ( = ?auto_24321 ?auto_24325 ) ) ( not ( = ?auto_24321 ?auto_24337 ) ) ( not ( = ?auto_24325 ?auto_24352 ) ) ( not ( = ?auto_24325 ?auto_24344 ) ) ( not ( = ?auto_24325 ?auto_24335 ) ) ( not ( = ?auto_24325 ?auto_24346 ) ) ( not ( = ?auto_24325 ?auto_24347 ) ) ( not ( = ?auto_24325 ?auto_24351 ) ) ( not ( = ?auto_24325 ?auto_24355 ) ) ( not ( = ?auto_24325 ?auto_24348 ) ) ( not ( = ?auto_24325 ?auto_24354 ) ) ( not ( = ?auto_24325 ?auto_24336 ) ) ( not ( = ?auto_24325 ?auto_24333 ) ) ( not ( = ?auto_24325 ?auto_24343 ) ) ( not ( = ?auto_24337 ?auto_24352 ) ) ( not ( = ?auto_24337 ?auto_24344 ) ) ( not ( = ?auto_24337 ?auto_24335 ) ) ( not ( = ?auto_24337 ?auto_24346 ) ) ( not ( = ?auto_24337 ?auto_24347 ) ) ( not ( = ?auto_24337 ?auto_24351 ) ) ( not ( = ?auto_24337 ?auto_24355 ) ) ( not ( = ?auto_24337 ?auto_24348 ) ) ( not ( = ?auto_24337 ?auto_24354 ) ) ( not ( = ?auto_24337 ?auto_24336 ) ) ( not ( = ?auto_24337 ?auto_24333 ) ) ( not ( = ?auto_24337 ?auto_24343 ) ) ( not ( = ?auto_24311 ?auto_24324 ) ) ( not ( = ?auto_24311 ?auto_24349 ) ) ( not ( = ?auto_24312 ?auto_24324 ) ) ( not ( = ?auto_24312 ?auto_24349 ) ) ( not ( = ?auto_24313 ?auto_24324 ) ) ( not ( = ?auto_24313 ?auto_24349 ) ) ( not ( = ?auto_24314 ?auto_24324 ) ) ( not ( = ?auto_24314 ?auto_24349 ) ) ( not ( = ?auto_24315 ?auto_24324 ) ) ( not ( = ?auto_24315 ?auto_24349 ) ) ( not ( = ?auto_24316 ?auto_24324 ) ) ( not ( = ?auto_24316 ?auto_24349 ) ) ( not ( = ?auto_24319 ?auto_24324 ) ) ( not ( = ?auto_24319 ?auto_24349 ) ) ( not ( = ?auto_24318 ?auto_24324 ) ) ( not ( = ?auto_24318 ?auto_24349 ) ) ( not ( = ?auto_24317 ?auto_24324 ) ) ( not ( = ?auto_24317 ?auto_24349 ) ) ( not ( = ?auto_24320 ?auto_24324 ) ) ( not ( = ?auto_24320 ?auto_24349 ) ) ( not ( = ?auto_24322 ?auto_24324 ) ) ( not ( = ?auto_24322 ?auto_24349 ) ) ( not ( = ?auto_24321 ?auto_24324 ) ) ( not ( = ?auto_24321 ?auto_24349 ) ) ( not ( = ?auto_24323 ?auto_24324 ) ) ( not ( = ?auto_24323 ?auto_24349 ) ) ( not ( = ?auto_24324 ?auto_24337 ) ) ( not ( = ?auto_24324 ?auto_24352 ) ) ( not ( = ?auto_24324 ?auto_24344 ) ) ( not ( = ?auto_24324 ?auto_24335 ) ) ( not ( = ?auto_24324 ?auto_24346 ) ) ( not ( = ?auto_24324 ?auto_24347 ) ) ( not ( = ?auto_24324 ?auto_24351 ) ) ( not ( = ?auto_24324 ?auto_24355 ) ) ( not ( = ?auto_24324 ?auto_24348 ) ) ( not ( = ?auto_24324 ?auto_24354 ) ) ( not ( = ?auto_24324 ?auto_24336 ) ) ( not ( = ?auto_24324 ?auto_24333 ) ) ( not ( = ?auto_24324 ?auto_24343 ) ) ( not ( = ?auto_24349 ?auto_24337 ) ) ( not ( = ?auto_24349 ?auto_24352 ) ) ( not ( = ?auto_24349 ?auto_24344 ) ) ( not ( = ?auto_24349 ?auto_24335 ) ) ( not ( = ?auto_24349 ?auto_24346 ) ) ( not ( = ?auto_24349 ?auto_24347 ) ) ( not ( = ?auto_24349 ?auto_24351 ) ) ( not ( = ?auto_24349 ?auto_24355 ) ) ( not ( = ?auto_24349 ?auto_24348 ) ) ( not ( = ?auto_24349 ?auto_24354 ) ) ( not ( = ?auto_24349 ?auto_24336 ) ) ( not ( = ?auto_24349 ?auto_24333 ) ) ( not ( = ?auto_24349 ?auto_24343 ) ) ( not ( = ?auto_24311 ?auto_24326 ) ) ( not ( = ?auto_24311 ?auto_24327 ) ) ( not ( = ?auto_24312 ?auto_24326 ) ) ( not ( = ?auto_24312 ?auto_24327 ) ) ( not ( = ?auto_24313 ?auto_24326 ) ) ( not ( = ?auto_24313 ?auto_24327 ) ) ( not ( = ?auto_24314 ?auto_24326 ) ) ( not ( = ?auto_24314 ?auto_24327 ) ) ( not ( = ?auto_24315 ?auto_24326 ) ) ( not ( = ?auto_24315 ?auto_24327 ) ) ( not ( = ?auto_24316 ?auto_24326 ) ) ( not ( = ?auto_24316 ?auto_24327 ) ) ( not ( = ?auto_24319 ?auto_24326 ) ) ( not ( = ?auto_24319 ?auto_24327 ) ) ( not ( = ?auto_24318 ?auto_24326 ) ) ( not ( = ?auto_24318 ?auto_24327 ) ) ( not ( = ?auto_24317 ?auto_24326 ) ) ( not ( = ?auto_24317 ?auto_24327 ) ) ( not ( = ?auto_24320 ?auto_24326 ) ) ( not ( = ?auto_24320 ?auto_24327 ) ) ( not ( = ?auto_24322 ?auto_24326 ) ) ( not ( = ?auto_24322 ?auto_24327 ) ) ( not ( = ?auto_24321 ?auto_24326 ) ) ( not ( = ?auto_24321 ?auto_24327 ) ) ( not ( = ?auto_24323 ?auto_24326 ) ) ( not ( = ?auto_24323 ?auto_24327 ) ) ( not ( = ?auto_24325 ?auto_24326 ) ) ( not ( = ?auto_24325 ?auto_24327 ) ) ( not ( = ?auto_24326 ?auto_24349 ) ) ( not ( = ?auto_24326 ?auto_24337 ) ) ( not ( = ?auto_24326 ?auto_24352 ) ) ( not ( = ?auto_24326 ?auto_24344 ) ) ( not ( = ?auto_24326 ?auto_24335 ) ) ( not ( = ?auto_24326 ?auto_24346 ) ) ( not ( = ?auto_24326 ?auto_24347 ) ) ( not ( = ?auto_24326 ?auto_24351 ) ) ( not ( = ?auto_24326 ?auto_24355 ) ) ( not ( = ?auto_24326 ?auto_24348 ) ) ( not ( = ?auto_24326 ?auto_24354 ) ) ( not ( = ?auto_24326 ?auto_24336 ) ) ( not ( = ?auto_24326 ?auto_24333 ) ) ( not ( = ?auto_24326 ?auto_24343 ) ) ( not ( = ?auto_24327 ?auto_24349 ) ) ( not ( = ?auto_24327 ?auto_24337 ) ) ( not ( = ?auto_24327 ?auto_24352 ) ) ( not ( = ?auto_24327 ?auto_24344 ) ) ( not ( = ?auto_24327 ?auto_24335 ) ) ( not ( = ?auto_24327 ?auto_24346 ) ) ( not ( = ?auto_24327 ?auto_24347 ) ) ( not ( = ?auto_24327 ?auto_24351 ) ) ( not ( = ?auto_24327 ?auto_24355 ) ) ( not ( = ?auto_24327 ?auto_24348 ) ) ( not ( = ?auto_24327 ?auto_24354 ) ) ( not ( = ?auto_24327 ?auto_24336 ) ) ( not ( = ?auto_24327 ?auto_24333 ) ) ( not ( = ?auto_24327 ?auto_24343 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_24311 ?auto_24312 ?auto_24313 ?auto_24314 ?auto_24315 ?auto_24316 ?auto_24319 ?auto_24318 ?auto_24317 ?auto_24320 ?auto_24322 ?auto_24321 ?auto_24323 ?auto_24325 ?auto_24324 )
      ( MAKE-1CRATE ?auto_24324 ?auto_24326 )
      ( MAKE-15CRATE-VERIFY ?auto_24311 ?auto_24312 ?auto_24313 ?auto_24314 ?auto_24315 ?auto_24316 ?auto_24319 ?auto_24318 ?auto_24317 ?auto_24320 ?auto_24322 ?auto_24321 ?auto_24323 ?auto_24325 ?auto_24324 ?auto_24326 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24361 - SURFACE
      ?auto_24362 - SURFACE
    )
    :vars
    (
      ?auto_24363 - HOIST
      ?auto_24364 - PLACE
      ?auto_24366 - PLACE
      ?auto_24367 - HOIST
      ?auto_24368 - SURFACE
      ?auto_24365 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24363 ?auto_24364 ) ( SURFACE-AT ?auto_24361 ?auto_24364 ) ( CLEAR ?auto_24361 ) ( IS-CRATE ?auto_24362 ) ( AVAILABLE ?auto_24363 ) ( not ( = ?auto_24366 ?auto_24364 ) ) ( HOIST-AT ?auto_24367 ?auto_24366 ) ( AVAILABLE ?auto_24367 ) ( SURFACE-AT ?auto_24362 ?auto_24366 ) ( ON ?auto_24362 ?auto_24368 ) ( CLEAR ?auto_24362 ) ( TRUCK-AT ?auto_24365 ?auto_24364 ) ( not ( = ?auto_24361 ?auto_24362 ) ) ( not ( = ?auto_24361 ?auto_24368 ) ) ( not ( = ?auto_24362 ?auto_24368 ) ) ( not ( = ?auto_24363 ?auto_24367 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24365 ?auto_24364 ?auto_24366 )
      ( !LIFT ?auto_24367 ?auto_24362 ?auto_24368 ?auto_24366 )
      ( !LOAD ?auto_24367 ?auto_24362 ?auto_24365 ?auto_24366 )
      ( !DRIVE ?auto_24365 ?auto_24366 ?auto_24364 )
      ( !UNLOAD ?auto_24363 ?auto_24362 ?auto_24365 ?auto_24364 )
      ( !DROP ?auto_24363 ?auto_24362 ?auto_24361 ?auto_24364 )
      ( MAKE-1CRATE-VERIFY ?auto_24361 ?auto_24362 ) )
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
      ?auto_24394 - SURFACE
      ?auto_24393 - SURFACE
      ?auto_24392 - SURFACE
      ?auto_24395 - SURFACE
      ?auto_24397 - SURFACE
      ?auto_24396 - SURFACE
      ?auto_24398 - SURFACE
      ?auto_24400 - SURFACE
      ?auto_24399 - SURFACE
      ?auto_24401 - SURFACE
      ?auto_24402 - SURFACE
    )
    :vars
    (
      ?auto_24403 - HOIST
      ?auto_24408 - PLACE
      ?auto_24407 - PLACE
      ?auto_24404 - HOIST
      ?auto_24406 - SURFACE
      ?auto_24413 - SURFACE
      ?auto_24421 - PLACE
      ?auto_24424 - HOIST
      ?auto_24422 - SURFACE
      ?auto_24416 - SURFACE
      ?auto_24420 - PLACE
      ?auto_24430 - HOIST
      ?auto_24427 - SURFACE
      ?auto_24431 - SURFACE
      ?auto_24414 - PLACE
      ?auto_24434 - HOIST
      ?auto_24411 - SURFACE
      ?auto_24433 - SURFACE
      ?auto_24412 - PLACE
      ?auto_24425 - HOIST
      ?auto_24435 - SURFACE
      ?auto_24415 - SURFACE
      ?auto_24419 - SURFACE
      ?auto_24417 - PLACE
      ?auto_24426 - HOIST
      ?auto_24429 - SURFACE
      ?auto_24409 - SURFACE
      ?auto_24410 - SURFACE
      ?auto_24418 - SURFACE
      ?auto_24423 - PLACE
      ?auto_24432 - HOIST
      ?auto_24428 - SURFACE
      ?auto_24405 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24403 ?auto_24408 ) ( IS-CRATE ?auto_24402 ) ( not ( = ?auto_24407 ?auto_24408 ) ) ( HOIST-AT ?auto_24404 ?auto_24407 ) ( SURFACE-AT ?auto_24402 ?auto_24407 ) ( ON ?auto_24402 ?auto_24406 ) ( CLEAR ?auto_24402 ) ( not ( = ?auto_24401 ?auto_24402 ) ) ( not ( = ?auto_24401 ?auto_24406 ) ) ( not ( = ?auto_24402 ?auto_24406 ) ) ( not ( = ?auto_24403 ?auto_24404 ) ) ( IS-CRATE ?auto_24401 ) ( SURFACE-AT ?auto_24401 ?auto_24407 ) ( ON ?auto_24401 ?auto_24413 ) ( CLEAR ?auto_24401 ) ( not ( = ?auto_24399 ?auto_24401 ) ) ( not ( = ?auto_24399 ?auto_24413 ) ) ( not ( = ?auto_24401 ?auto_24413 ) ) ( IS-CRATE ?auto_24399 ) ( not ( = ?auto_24421 ?auto_24408 ) ) ( HOIST-AT ?auto_24424 ?auto_24421 ) ( SURFACE-AT ?auto_24399 ?auto_24421 ) ( ON ?auto_24399 ?auto_24422 ) ( CLEAR ?auto_24399 ) ( not ( = ?auto_24400 ?auto_24399 ) ) ( not ( = ?auto_24400 ?auto_24422 ) ) ( not ( = ?auto_24399 ?auto_24422 ) ) ( not ( = ?auto_24403 ?auto_24424 ) ) ( IS-CRATE ?auto_24400 ) ( SURFACE-AT ?auto_24400 ?auto_24421 ) ( ON ?auto_24400 ?auto_24416 ) ( CLEAR ?auto_24400 ) ( not ( = ?auto_24398 ?auto_24400 ) ) ( not ( = ?auto_24398 ?auto_24416 ) ) ( not ( = ?auto_24400 ?auto_24416 ) ) ( IS-CRATE ?auto_24398 ) ( not ( = ?auto_24420 ?auto_24408 ) ) ( HOIST-AT ?auto_24430 ?auto_24420 ) ( AVAILABLE ?auto_24430 ) ( SURFACE-AT ?auto_24398 ?auto_24420 ) ( ON ?auto_24398 ?auto_24427 ) ( CLEAR ?auto_24398 ) ( not ( = ?auto_24396 ?auto_24398 ) ) ( not ( = ?auto_24396 ?auto_24427 ) ) ( not ( = ?auto_24398 ?auto_24427 ) ) ( not ( = ?auto_24403 ?auto_24430 ) ) ( IS-CRATE ?auto_24396 ) ( SURFACE-AT ?auto_24396 ?auto_24407 ) ( ON ?auto_24396 ?auto_24431 ) ( CLEAR ?auto_24396 ) ( not ( = ?auto_24397 ?auto_24396 ) ) ( not ( = ?auto_24397 ?auto_24431 ) ) ( not ( = ?auto_24396 ?auto_24431 ) ) ( IS-CRATE ?auto_24397 ) ( not ( = ?auto_24414 ?auto_24408 ) ) ( HOIST-AT ?auto_24434 ?auto_24414 ) ( AVAILABLE ?auto_24434 ) ( SURFACE-AT ?auto_24397 ?auto_24414 ) ( ON ?auto_24397 ?auto_24411 ) ( CLEAR ?auto_24397 ) ( not ( = ?auto_24395 ?auto_24397 ) ) ( not ( = ?auto_24395 ?auto_24411 ) ) ( not ( = ?auto_24397 ?auto_24411 ) ) ( not ( = ?auto_24403 ?auto_24434 ) ) ( IS-CRATE ?auto_24395 ) ( SURFACE-AT ?auto_24395 ?auto_24421 ) ( ON ?auto_24395 ?auto_24433 ) ( CLEAR ?auto_24395 ) ( not ( = ?auto_24392 ?auto_24395 ) ) ( not ( = ?auto_24392 ?auto_24433 ) ) ( not ( = ?auto_24395 ?auto_24433 ) ) ( IS-CRATE ?auto_24392 ) ( not ( = ?auto_24412 ?auto_24408 ) ) ( HOIST-AT ?auto_24425 ?auto_24412 ) ( SURFACE-AT ?auto_24392 ?auto_24412 ) ( ON ?auto_24392 ?auto_24435 ) ( CLEAR ?auto_24392 ) ( not ( = ?auto_24393 ?auto_24392 ) ) ( not ( = ?auto_24393 ?auto_24435 ) ) ( not ( = ?auto_24392 ?auto_24435 ) ) ( not ( = ?auto_24403 ?auto_24425 ) ) ( IS-CRATE ?auto_24393 ) ( SURFACE-AT ?auto_24393 ?auto_24407 ) ( ON ?auto_24393 ?auto_24415 ) ( CLEAR ?auto_24393 ) ( not ( = ?auto_24394 ?auto_24393 ) ) ( not ( = ?auto_24394 ?auto_24415 ) ) ( not ( = ?auto_24393 ?auto_24415 ) ) ( IS-CRATE ?auto_24394 ) ( AVAILABLE ?auto_24425 ) ( SURFACE-AT ?auto_24394 ?auto_24412 ) ( ON ?auto_24394 ?auto_24419 ) ( CLEAR ?auto_24394 ) ( not ( = ?auto_24391 ?auto_24394 ) ) ( not ( = ?auto_24391 ?auto_24419 ) ) ( not ( = ?auto_24394 ?auto_24419 ) ) ( IS-CRATE ?auto_24391 ) ( not ( = ?auto_24417 ?auto_24408 ) ) ( HOIST-AT ?auto_24426 ?auto_24417 ) ( SURFACE-AT ?auto_24391 ?auto_24417 ) ( ON ?auto_24391 ?auto_24429 ) ( CLEAR ?auto_24391 ) ( not ( = ?auto_24390 ?auto_24391 ) ) ( not ( = ?auto_24390 ?auto_24429 ) ) ( not ( = ?auto_24391 ?auto_24429 ) ) ( not ( = ?auto_24403 ?auto_24426 ) ) ( IS-CRATE ?auto_24390 ) ( AVAILABLE ?auto_24424 ) ( SURFACE-AT ?auto_24390 ?auto_24421 ) ( ON ?auto_24390 ?auto_24409 ) ( CLEAR ?auto_24390 ) ( not ( = ?auto_24389 ?auto_24390 ) ) ( not ( = ?auto_24389 ?auto_24409 ) ) ( not ( = ?auto_24390 ?auto_24409 ) ) ( IS-CRATE ?auto_24389 ) ( AVAILABLE ?auto_24426 ) ( SURFACE-AT ?auto_24389 ?auto_24417 ) ( ON ?auto_24389 ?auto_24410 ) ( CLEAR ?auto_24389 ) ( not ( = ?auto_24388 ?auto_24389 ) ) ( not ( = ?auto_24388 ?auto_24410 ) ) ( not ( = ?auto_24389 ?auto_24410 ) ) ( IS-CRATE ?auto_24388 ) ( AVAILABLE ?auto_24404 ) ( SURFACE-AT ?auto_24388 ?auto_24407 ) ( ON ?auto_24388 ?auto_24418 ) ( CLEAR ?auto_24388 ) ( not ( = ?auto_24387 ?auto_24388 ) ) ( not ( = ?auto_24387 ?auto_24418 ) ) ( not ( = ?auto_24388 ?auto_24418 ) ) ( SURFACE-AT ?auto_24386 ?auto_24408 ) ( CLEAR ?auto_24386 ) ( IS-CRATE ?auto_24387 ) ( AVAILABLE ?auto_24403 ) ( not ( = ?auto_24423 ?auto_24408 ) ) ( HOIST-AT ?auto_24432 ?auto_24423 ) ( AVAILABLE ?auto_24432 ) ( SURFACE-AT ?auto_24387 ?auto_24423 ) ( ON ?auto_24387 ?auto_24428 ) ( CLEAR ?auto_24387 ) ( TRUCK-AT ?auto_24405 ?auto_24408 ) ( not ( = ?auto_24386 ?auto_24387 ) ) ( not ( = ?auto_24386 ?auto_24428 ) ) ( not ( = ?auto_24387 ?auto_24428 ) ) ( not ( = ?auto_24403 ?auto_24432 ) ) ( not ( = ?auto_24386 ?auto_24388 ) ) ( not ( = ?auto_24386 ?auto_24418 ) ) ( not ( = ?auto_24388 ?auto_24428 ) ) ( not ( = ?auto_24407 ?auto_24423 ) ) ( not ( = ?auto_24404 ?auto_24432 ) ) ( not ( = ?auto_24418 ?auto_24428 ) ) ( not ( = ?auto_24386 ?auto_24389 ) ) ( not ( = ?auto_24386 ?auto_24410 ) ) ( not ( = ?auto_24387 ?auto_24389 ) ) ( not ( = ?auto_24387 ?auto_24410 ) ) ( not ( = ?auto_24389 ?auto_24418 ) ) ( not ( = ?auto_24389 ?auto_24428 ) ) ( not ( = ?auto_24417 ?auto_24407 ) ) ( not ( = ?auto_24417 ?auto_24423 ) ) ( not ( = ?auto_24426 ?auto_24404 ) ) ( not ( = ?auto_24426 ?auto_24432 ) ) ( not ( = ?auto_24410 ?auto_24418 ) ) ( not ( = ?auto_24410 ?auto_24428 ) ) ( not ( = ?auto_24386 ?auto_24390 ) ) ( not ( = ?auto_24386 ?auto_24409 ) ) ( not ( = ?auto_24387 ?auto_24390 ) ) ( not ( = ?auto_24387 ?auto_24409 ) ) ( not ( = ?auto_24388 ?auto_24390 ) ) ( not ( = ?auto_24388 ?auto_24409 ) ) ( not ( = ?auto_24390 ?auto_24410 ) ) ( not ( = ?auto_24390 ?auto_24418 ) ) ( not ( = ?auto_24390 ?auto_24428 ) ) ( not ( = ?auto_24421 ?auto_24417 ) ) ( not ( = ?auto_24421 ?auto_24407 ) ) ( not ( = ?auto_24421 ?auto_24423 ) ) ( not ( = ?auto_24424 ?auto_24426 ) ) ( not ( = ?auto_24424 ?auto_24404 ) ) ( not ( = ?auto_24424 ?auto_24432 ) ) ( not ( = ?auto_24409 ?auto_24410 ) ) ( not ( = ?auto_24409 ?auto_24418 ) ) ( not ( = ?auto_24409 ?auto_24428 ) ) ( not ( = ?auto_24386 ?auto_24391 ) ) ( not ( = ?auto_24386 ?auto_24429 ) ) ( not ( = ?auto_24387 ?auto_24391 ) ) ( not ( = ?auto_24387 ?auto_24429 ) ) ( not ( = ?auto_24388 ?auto_24391 ) ) ( not ( = ?auto_24388 ?auto_24429 ) ) ( not ( = ?auto_24389 ?auto_24391 ) ) ( not ( = ?auto_24389 ?auto_24429 ) ) ( not ( = ?auto_24391 ?auto_24409 ) ) ( not ( = ?auto_24391 ?auto_24410 ) ) ( not ( = ?auto_24391 ?auto_24418 ) ) ( not ( = ?auto_24391 ?auto_24428 ) ) ( not ( = ?auto_24429 ?auto_24409 ) ) ( not ( = ?auto_24429 ?auto_24410 ) ) ( not ( = ?auto_24429 ?auto_24418 ) ) ( not ( = ?auto_24429 ?auto_24428 ) ) ( not ( = ?auto_24386 ?auto_24394 ) ) ( not ( = ?auto_24386 ?auto_24419 ) ) ( not ( = ?auto_24387 ?auto_24394 ) ) ( not ( = ?auto_24387 ?auto_24419 ) ) ( not ( = ?auto_24388 ?auto_24394 ) ) ( not ( = ?auto_24388 ?auto_24419 ) ) ( not ( = ?auto_24389 ?auto_24394 ) ) ( not ( = ?auto_24389 ?auto_24419 ) ) ( not ( = ?auto_24390 ?auto_24394 ) ) ( not ( = ?auto_24390 ?auto_24419 ) ) ( not ( = ?auto_24394 ?auto_24429 ) ) ( not ( = ?auto_24394 ?auto_24409 ) ) ( not ( = ?auto_24394 ?auto_24410 ) ) ( not ( = ?auto_24394 ?auto_24418 ) ) ( not ( = ?auto_24394 ?auto_24428 ) ) ( not ( = ?auto_24412 ?auto_24417 ) ) ( not ( = ?auto_24412 ?auto_24421 ) ) ( not ( = ?auto_24412 ?auto_24407 ) ) ( not ( = ?auto_24412 ?auto_24423 ) ) ( not ( = ?auto_24425 ?auto_24426 ) ) ( not ( = ?auto_24425 ?auto_24424 ) ) ( not ( = ?auto_24425 ?auto_24404 ) ) ( not ( = ?auto_24425 ?auto_24432 ) ) ( not ( = ?auto_24419 ?auto_24429 ) ) ( not ( = ?auto_24419 ?auto_24409 ) ) ( not ( = ?auto_24419 ?auto_24410 ) ) ( not ( = ?auto_24419 ?auto_24418 ) ) ( not ( = ?auto_24419 ?auto_24428 ) ) ( not ( = ?auto_24386 ?auto_24393 ) ) ( not ( = ?auto_24386 ?auto_24415 ) ) ( not ( = ?auto_24387 ?auto_24393 ) ) ( not ( = ?auto_24387 ?auto_24415 ) ) ( not ( = ?auto_24388 ?auto_24393 ) ) ( not ( = ?auto_24388 ?auto_24415 ) ) ( not ( = ?auto_24389 ?auto_24393 ) ) ( not ( = ?auto_24389 ?auto_24415 ) ) ( not ( = ?auto_24390 ?auto_24393 ) ) ( not ( = ?auto_24390 ?auto_24415 ) ) ( not ( = ?auto_24391 ?auto_24393 ) ) ( not ( = ?auto_24391 ?auto_24415 ) ) ( not ( = ?auto_24393 ?auto_24419 ) ) ( not ( = ?auto_24393 ?auto_24429 ) ) ( not ( = ?auto_24393 ?auto_24409 ) ) ( not ( = ?auto_24393 ?auto_24410 ) ) ( not ( = ?auto_24393 ?auto_24418 ) ) ( not ( = ?auto_24393 ?auto_24428 ) ) ( not ( = ?auto_24415 ?auto_24419 ) ) ( not ( = ?auto_24415 ?auto_24429 ) ) ( not ( = ?auto_24415 ?auto_24409 ) ) ( not ( = ?auto_24415 ?auto_24410 ) ) ( not ( = ?auto_24415 ?auto_24418 ) ) ( not ( = ?auto_24415 ?auto_24428 ) ) ( not ( = ?auto_24386 ?auto_24392 ) ) ( not ( = ?auto_24386 ?auto_24435 ) ) ( not ( = ?auto_24387 ?auto_24392 ) ) ( not ( = ?auto_24387 ?auto_24435 ) ) ( not ( = ?auto_24388 ?auto_24392 ) ) ( not ( = ?auto_24388 ?auto_24435 ) ) ( not ( = ?auto_24389 ?auto_24392 ) ) ( not ( = ?auto_24389 ?auto_24435 ) ) ( not ( = ?auto_24390 ?auto_24392 ) ) ( not ( = ?auto_24390 ?auto_24435 ) ) ( not ( = ?auto_24391 ?auto_24392 ) ) ( not ( = ?auto_24391 ?auto_24435 ) ) ( not ( = ?auto_24394 ?auto_24392 ) ) ( not ( = ?auto_24394 ?auto_24435 ) ) ( not ( = ?auto_24392 ?auto_24415 ) ) ( not ( = ?auto_24392 ?auto_24419 ) ) ( not ( = ?auto_24392 ?auto_24429 ) ) ( not ( = ?auto_24392 ?auto_24409 ) ) ( not ( = ?auto_24392 ?auto_24410 ) ) ( not ( = ?auto_24392 ?auto_24418 ) ) ( not ( = ?auto_24392 ?auto_24428 ) ) ( not ( = ?auto_24435 ?auto_24415 ) ) ( not ( = ?auto_24435 ?auto_24419 ) ) ( not ( = ?auto_24435 ?auto_24429 ) ) ( not ( = ?auto_24435 ?auto_24409 ) ) ( not ( = ?auto_24435 ?auto_24410 ) ) ( not ( = ?auto_24435 ?auto_24418 ) ) ( not ( = ?auto_24435 ?auto_24428 ) ) ( not ( = ?auto_24386 ?auto_24395 ) ) ( not ( = ?auto_24386 ?auto_24433 ) ) ( not ( = ?auto_24387 ?auto_24395 ) ) ( not ( = ?auto_24387 ?auto_24433 ) ) ( not ( = ?auto_24388 ?auto_24395 ) ) ( not ( = ?auto_24388 ?auto_24433 ) ) ( not ( = ?auto_24389 ?auto_24395 ) ) ( not ( = ?auto_24389 ?auto_24433 ) ) ( not ( = ?auto_24390 ?auto_24395 ) ) ( not ( = ?auto_24390 ?auto_24433 ) ) ( not ( = ?auto_24391 ?auto_24395 ) ) ( not ( = ?auto_24391 ?auto_24433 ) ) ( not ( = ?auto_24394 ?auto_24395 ) ) ( not ( = ?auto_24394 ?auto_24433 ) ) ( not ( = ?auto_24393 ?auto_24395 ) ) ( not ( = ?auto_24393 ?auto_24433 ) ) ( not ( = ?auto_24395 ?auto_24435 ) ) ( not ( = ?auto_24395 ?auto_24415 ) ) ( not ( = ?auto_24395 ?auto_24419 ) ) ( not ( = ?auto_24395 ?auto_24429 ) ) ( not ( = ?auto_24395 ?auto_24409 ) ) ( not ( = ?auto_24395 ?auto_24410 ) ) ( not ( = ?auto_24395 ?auto_24418 ) ) ( not ( = ?auto_24395 ?auto_24428 ) ) ( not ( = ?auto_24433 ?auto_24435 ) ) ( not ( = ?auto_24433 ?auto_24415 ) ) ( not ( = ?auto_24433 ?auto_24419 ) ) ( not ( = ?auto_24433 ?auto_24429 ) ) ( not ( = ?auto_24433 ?auto_24409 ) ) ( not ( = ?auto_24433 ?auto_24410 ) ) ( not ( = ?auto_24433 ?auto_24418 ) ) ( not ( = ?auto_24433 ?auto_24428 ) ) ( not ( = ?auto_24386 ?auto_24397 ) ) ( not ( = ?auto_24386 ?auto_24411 ) ) ( not ( = ?auto_24387 ?auto_24397 ) ) ( not ( = ?auto_24387 ?auto_24411 ) ) ( not ( = ?auto_24388 ?auto_24397 ) ) ( not ( = ?auto_24388 ?auto_24411 ) ) ( not ( = ?auto_24389 ?auto_24397 ) ) ( not ( = ?auto_24389 ?auto_24411 ) ) ( not ( = ?auto_24390 ?auto_24397 ) ) ( not ( = ?auto_24390 ?auto_24411 ) ) ( not ( = ?auto_24391 ?auto_24397 ) ) ( not ( = ?auto_24391 ?auto_24411 ) ) ( not ( = ?auto_24394 ?auto_24397 ) ) ( not ( = ?auto_24394 ?auto_24411 ) ) ( not ( = ?auto_24393 ?auto_24397 ) ) ( not ( = ?auto_24393 ?auto_24411 ) ) ( not ( = ?auto_24392 ?auto_24397 ) ) ( not ( = ?auto_24392 ?auto_24411 ) ) ( not ( = ?auto_24397 ?auto_24433 ) ) ( not ( = ?auto_24397 ?auto_24435 ) ) ( not ( = ?auto_24397 ?auto_24415 ) ) ( not ( = ?auto_24397 ?auto_24419 ) ) ( not ( = ?auto_24397 ?auto_24429 ) ) ( not ( = ?auto_24397 ?auto_24409 ) ) ( not ( = ?auto_24397 ?auto_24410 ) ) ( not ( = ?auto_24397 ?auto_24418 ) ) ( not ( = ?auto_24397 ?auto_24428 ) ) ( not ( = ?auto_24414 ?auto_24421 ) ) ( not ( = ?auto_24414 ?auto_24412 ) ) ( not ( = ?auto_24414 ?auto_24407 ) ) ( not ( = ?auto_24414 ?auto_24417 ) ) ( not ( = ?auto_24414 ?auto_24423 ) ) ( not ( = ?auto_24434 ?auto_24424 ) ) ( not ( = ?auto_24434 ?auto_24425 ) ) ( not ( = ?auto_24434 ?auto_24404 ) ) ( not ( = ?auto_24434 ?auto_24426 ) ) ( not ( = ?auto_24434 ?auto_24432 ) ) ( not ( = ?auto_24411 ?auto_24433 ) ) ( not ( = ?auto_24411 ?auto_24435 ) ) ( not ( = ?auto_24411 ?auto_24415 ) ) ( not ( = ?auto_24411 ?auto_24419 ) ) ( not ( = ?auto_24411 ?auto_24429 ) ) ( not ( = ?auto_24411 ?auto_24409 ) ) ( not ( = ?auto_24411 ?auto_24410 ) ) ( not ( = ?auto_24411 ?auto_24418 ) ) ( not ( = ?auto_24411 ?auto_24428 ) ) ( not ( = ?auto_24386 ?auto_24396 ) ) ( not ( = ?auto_24386 ?auto_24431 ) ) ( not ( = ?auto_24387 ?auto_24396 ) ) ( not ( = ?auto_24387 ?auto_24431 ) ) ( not ( = ?auto_24388 ?auto_24396 ) ) ( not ( = ?auto_24388 ?auto_24431 ) ) ( not ( = ?auto_24389 ?auto_24396 ) ) ( not ( = ?auto_24389 ?auto_24431 ) ) ( not ( = ?auto_24390 ?auto_24396 ) ) ( not ( = ?auto_24390 ?auto_24431 ) ) ( not ( = ?auto_24391 ?auto_24396 ) ) ( not ( = ?auto_24391 ?auto_24431 ) ) ( not ( = ?auto_24394 ?auto_24396 ) ) ( not ( = ?auto_24394 ?auto_24431 ) ) ( not ( = ?auto_24393 ?auto_24396 ) ) ( not ( = ?auto_24393 ?auto_24431 ) ) ( not ( = ?auto_24392 ?auto_24396 ) ) ( not ( = ?auto_24392 ?auto_24431 ) ) ( not ( = ?auto_24395 ?auto_24396 ) ) ( not ( = ?auto_24395 ?auto_24431 ) ) ( not ( = ?auto_24396 ?auto_24411 ) ) ( not ( = ?auto_24396 ?auto_24433 ) ) ( not ( = ?auto_24396 ?auto_24435 ) ) ( not ( = ?auto_24396 ?auto_24415 ) ) ( not ( = ?auto_24396 ?auto_24419 ) ) ( not ( = ?auto_24396 ?auto_24429 ) ) ( not ( = ?auto_24396 ?auto_24409 ) ) ( not ( = ?auto_24396 ?auto_24410 ) ) ( not ( = ?auto_24396 ?auto_24418 ) ) ( not ( = ?auto_24396 ?auto_24428 ) ) ( not ( = ?auto_24431 ?auto_24411 ) ) ( not ( = ?auto_24431 ?auto_24433 ) ) ( not ( = ?auto_24431 ?auto_24435 ) ) ( not ( = ?auto_24431 ?auto_24415 ) ) ( not ( = ?auto_24431 ?auto_24419 ) ) ( not ( = ?auto_24431 ?auto_24429 ) ) ( not ( = ?auto_24431 ?auto_24409 ) ) ( not ( = ?auto_24431 ?auto_24410 ) ) ( not ( = ?auto_24431 ?auto_24418 ) ) ( not ( = ?auto_24431 ?auto_24428 ) ) ( not ( = ?auto_24386 ?auto_24398 ) ) ( not ( = ?auto_24386 ?auto_24427 ) ) ( not ( = ?auto_24387 ?auto_24398 ) ) ( not ( = ?auto_24387 ?auto_24427 ) ) ( not ( = ?auto_24388 ?auto_24398 ) ) ( not ( = ?auto_24388 ?auto_24427 ) ) ( not ( = ?auto_24389 ?auto_24398 ) ) ( not ( = ?auto_24389 ?auto_24427 ) ) ( not ( = ?auto_24390 ?auto_24398 ) ) ( not ( = ?auto_24390 ?auto_24427 ) ) ( not ( = ?auto_24391 ?auto_24398 ) ) ( not ( = ?auto_24391 ?auto_24427 ) ) ( not ( = ?auto_24394 ?auto_24398 ) ) ( not ( = ?auto_24394 ?auto_24427 ) ) ( not ( = ?auto_24393 ?auto_24398 ) ) ( not ( = ?auto_24393 ?auto_24427 ) ) ( not ( = ?auto_24392 ?auto_24398 ) ) ( not ( = ?auto_24392 ?auto_24427 ) ) ( not ( = ?auto_24395 ?auto_24398 ) ) ( not ( = ?auto_24395 ?auto_24427 ) ) ( not ( = ?auto_24397 ?auto_24398 ) ) ( not ( = ?auto_24397 ?auto_24427 ) ) ( not ( = ?auto_24398 ?auto_24431 ) ) ( not ( = ?auto_24398 ?auto_24411 ) ) ( not ( = ?auto_24398 ?auto_24433 ) ) ( not ( = ?auto_24398 ?auto_24435 ) ) ( not ( = ?auto_24398 ?auto_24415 ) ) ( not ( = ?auto_24398 ?auto_24419 ) ) ( not ( = ?auto_24398 ?auto_24429 ) ) ( not ( = ?auto_24398 ?auto_24409 ) ) ( not ( = ?auto_24398 ?auto_24410 ) ) ( not ( = ?auto_24398 ?auto_24418 ) ) ( not ( = ?auto_24398 ?auto_24428 ) ) ( not ( = ?auto_24420 ?auto_24407 ) ) ( not ( = ?auto_24420 ?auto_24414 ) ) ( not ( = ?auto_24420 ?auto_24421 ) ) ( not ( = ?auto_24420 ?auto_24412 ) ) ( not ( = ?auto_24420 ?auto_24417 ) ) ( not ( = ?auto_24420 ?auto_24423 ) ) ( not ( = ?auto_24430 ?auto_24404 ) ) ( not ( = ?auto_24430 ?auto_24434 ) ) ( not ( = ?auto_24430 ?auto_24424 ) ) ( not ( = ?auto_24430 ?auto_24425 ) ) ( not ( = ?auto_24430 ?auto_24426 ) ) ( not ( = ?auto_24430 ?auto_24432 ) ) ( not ( = ?auto_24427 ?auto_24431 ) ) ( not ( = ?auto_24427 ?auto_24411 ) ) ( not ( = ?auto_24427 ?auto_24433 ) ) ( not ( = ?auto_24427 ?auto_24435 ) ) ( not ( = ?auto_24427 ?auto_24415 ) ) ( not ( = ?auto_24427 ?auto_24419 ) ) ( not ( = ?auto_24427 ?auto_24429 ) ) ( not ( = ?auto_24427 ?auto_24409 ) ) ( not ( = ?auto_24427 ?auto_24410 ) ) ( not ( = ?auto_24427 ?auto_24418 ) ) ( not ( = ?auto_24427 ?auto_24428 ) ) ( not ( = ?auto_24386 ?auto_24400 ) ) ( not ( = ?auto_24386 ?auto_24416 ) ) ( not ( = ?auto_24387 ?auto_24400 ) ) ( not ( = ?auto_24387 ?auto_24416 ) ) ( not ( = ?auto_24388 ?auto_24400 ) ) ( not ( = ?auto_24388 ?auto_24416 ) ) ( not ( = ?auto_24389 ?auto_24400 ) ) ( not ( = ?auto_24389 ?auto_24416 ) ) ( not ( = ?auto_24390 ?auto_24400 ) ) ( not ( = ?auto_24390 ?auto_24416 ) ) ( not ( = ?auto_24391 ?auto_24400 ) ) ( not ( = ?auto_24391 ?auto_24416 ) ) ( not ( = ?auto_24394 ?auto_24400 ) ) ( not ( = ?auto_24394 ?auto_24416 ) ) ( not ( = ?auto_24393 ?auto_24400 ) ) ( not ( = ?auto_24393 ?auto_24416 ) ) ( not ( = ?auto_24392 ?auto_24400 ) ) ( not ( = ?auto_24392 ?auto_24416 ) ) ( not ( = ?auto_24395 ?auto_24400 ) ) ( not ( = ?auto_24395 ?auto_24416 ) ) ( not ( = ?auto_24397 ?auto_24400 ) ) ( not ( = ?auto_24397 ?auto_24416 ) ) ( not ( = ?auto_24396 ?auto_24400 ) ) ( not ( = ?auto_24396 ?auto_24416 ) ) ( not ( = ?auto_24400 ?auto_24427 ) ) ( not ( = ?auto_24400 ?auto_24431 ) ) ( not ( = ?auto_24400 ?auto_24411 ) ) ( not ( = ?auto_24400 ?auto_24433 ) ) ( not ( = ?auto_24400 ?auto_24435 ) ) ( not ( = ?auto_24400 ?auto_24415 ) ) ( not ( = ?auto_24400 ?auto_24419 ) ) ( not ( = ?auto_24400 ?auto_24429 ) ) ( not ( = ?auto_24400 ?auto_24409 ) ) ( not ( = ?auto_24400 ?auto_24410 ) ) ( not ( = ?auto_24400 ?auto_24418 ) ) ( not ( = ?auto_24400 ?auto_24428 ) ) ( not ( = ?auto_24416 ?auto_24427 ) ) ( not ( = ?auto_24416 ?auto_24431 ) ) ( not ( = ?auto_24416 ?auto_24411 ) ) ( not ( = ?auto_24416 ?auto_24433 ) ) ( not ( = ?auto_24416 ?auto_24435 ) ) ( not ( = ?auto_24416 ?auto_24415 ) ) ( not ( = ?auto_24416 ?auto_24419 ) ) ( not ( = ?auto_24416 ?auto_24429 ) ) ( not ( = ?auto_24416 ?auto_24409 ) ) ( not ( = ?auto_24416 ?auto_24410 ) ) ( not ( = ?auto_24416 ?auto_24418 ) ) ( not ( = ?auto_24416 ?auto_24428 ) ) ( not ( = ?auto_24386 ?auto_24399 ) ) ( not ( = ?auto_24386 ?auto_24422 ) ) ( not ( = ?auto_24387 ?auto_24399 ) ) ( not ( = ?auto_24387 ?auto_24422 ) ) ( not ( = ?auto_24388 ?auto_24399 ) ) ( not ( = ?auto_24388 ?auto_24422 ) ) ( not ( = ?auto_24389 ?auto_24399 ) ) ( not ( = ?auto_24389 ?auto_24422 ) ) ( not ( = ?auto_24390 ?auto_24399 ) ) ( not ( = ?auto_24390 ?auto_24422 ) ) ( not ( = ?auto_24391 ?auto_24399 ) ) ( not ( = ?auto_24391 ?auto_24422 ) ) ( not ( = ?auto_24394 ?auto_24399 ) ) ( not ( = ?auto_24394 ?auto_24422 ) ) ( not ( = ?auto_24393 ?auto_24399 ) ) ( not ( = ?auto_24393 ?auto_24422 ) ) ( not ( = ?auto_24392 ?auto_24399 ) ) ( not ( = ?auto_24392 ?auto_24422 ) ) ( not ( = ?auto_24395 ?auto_24399 ) ) ( not ( = ?auto_24395 ?auto_24422 ) ) ( not ( = ?auto_24397 ?auto_24399 ) ) ( not ( = ?auto_24397 ?auto_24422 ) ) ( not ( = ?auto_24396 ?auto_24399 ) ) ( not ( = ?auto_24396 ?auto_24422 ) ) ( not ( = ?auto_24398 ?auto_24399 ) ) ( not ( = ?auto_24398 ?auto_24422 ) ) ( not ( = ?auto_24399 ?auto_24416 ) ) ( not ( = ?auto_24399 ?auto_24427 ) ) ( not ( = ?auto_24399 ?auto_24431 ) ) ( not ( = ?auto_24399 ?auto_24411 ) ) ( not ( = ?auto_24399 ?auto_24433 ) ) ( not ( = ?auto_24399 ?auto_24435 ) ) ( not ( = ?auto_24399 ?auto_24415 ) ) ( not ( = ?auto_24399 ?auto_24419 ) ) ( not ( = ?auto_24399 ?auto_24429 ) ) ( not ( = ?auto_24399 ?auto_24409 ) ) ( not ( = ?auto_24399 ?auto_24410 ) ) ( not ( = ?auto_24399 ?auto_24418 ) ) ( not ( = ?auto_24399 ?auto_24428 ) ) ( not ( = ?auto_24422 ?auto_24416 ) ) ( not ( = ?auto_24422 ?auto_24427 ) ) ( not ( = ?auto_24422 ?auto_24431 ) ) ( not ( = ?auto_24422 ?auto_24411 ) ) ( not ( = ?auto_24422 ?auto_24433 ) ) ( not ( = ?auto_24422 ?auto_24435 ) ) ( not ( = ?auto_24422 ?auto_24415 ) ) ( not ( = ?auto_24422 ?auto_24419 ) ) ( not ( = ?auto_24422 ?auto_24429 ) ) ( not ( = ?auto_24422 ?auto_24409 ) ) ( not ( = ?auto_24422 ?auto_24410 ) ) ( not ( = ?auto_24422 ?auto_24418 ) ) ( not ( = ?auto_24422 ?auto_24428 ) ) ( not ( = ?auto_24386 ?auto_24401 ) ) ( not ( = ?auto_24386 ?auto_24413 ) ) ( not ( = ?auto_24387 ?auto_24401 ) ) ( not ( = ?auto_24387 ?auto_24413 ) ) ( not ( = ?auto_24388 ?auto_24401 ) ) ( not ( = ?auto_24388 ?auto_24413 ) ) ( not ( = ?auto_24389 ?auto_24401 ) ) ( not ( = ?auto_24389 ?auto_24413 ) ) ( not ( = ?auto_24390 ?auto_24401 ) ) ( not ( = ?auto_24390 ?auto_24413 ) ) ( not ( = ?auto_24391 ?auto_24401 ) ) ( not ( = ?auto_24391 ?auto_24413 ) ) ( not ( = ?auto_24394 ?auto_24401 ) ) ( not ( = ?auto_24394 ?auto_24413 ) ) ( not ( = ?auto_24393 ?auto_24401 ) ) ( not ( = ?auto_24393 ?auto_24413 ) ) ( not ( = ?auto_24392 ?auto_24401 ) ) ( not ( = ?auto_24392 ?auto_24413 ) ) ( not ( = ?auto_24395 ?auto_24401 ) ) ( not ( = ?auto_24395 ?auto_24413 ) ) ( not ( = ?auto_24397 ?auto_24401 ) ) ( not ( = ?auto_24397 ?auto_24413 ) ) ( not ( = ?auto_24396 ?auto_24401 ) ) ( not ( = ?auto_24396 ?auto_24413 ) ) ( not ( = ?auto_24398 ?auto_24401 ) ) ( not ( = ?auto_24398 ?auto_24413 ) ) ( not ( = ?auto_24400 ?auto_24401 ) ) ( not ( = ?auto_24400 ?auto_24413 ) ) ( not ( = ?auto_24401 ?auto_24422 ) ) ( not ( = ?auto_24401 ?auto_24416 ) ) ( not ( = ?auto_24401 ?auto_24427 ) ) ( not ( = ?auto_24401 ?auto_24431 ) ) ( not ( = ?auto_24401 ?auto_24411 ) ) ( not ( = ?auto_24401 ?auto_24433 ) ) ( not ( = ?auto_24401 ?auto_24435 ) ) ( not ( = ?auto_24401 ?auto_24415 ) ) ( not ( = ?auto_24401 ?auto_24419 ) ) ( not ( = ?auto_24401 ?auto_24429 ) ) ( not ( = ?auto_24401 ?auto_24409 ) ) ( not ( = ?auto_24401 ?auto_24410 ) ) ( not ( = ?auto_24401 ?auto_24418 ) ) ( not ( = ?auto_24401 ?auto_24428 ) ) ( not ( = ?auto_24413 ?auto_24422 ) ) ( not ( = ?auto_24413 ?auto_24416 ) ) ( not ( = ?auto_24413 ?auto_24427 ) ) ( not ( = ?auto_24413 ?auto_24431 ) ) ( not ( = ?auto_24413 ?auto_24411 ) ) ( not ( = ?auto_24413 ?auto_24433 ) ) ( not ( = ?auto_24413 ?auto_24435 ) ) ( not ( = ?auto_24413 ?auto_24415 ) ) ( not ( = ?auto_24413 ?auto_24419 ) ) ( not ( = ?auto_24413 ?auto_24429 ) ) ( not ( = ?auto_24413 ?auto_24409 ) ) ( not ( = ?auto_24413 ?auto_24410 ) ) ( not ( = ?auto_24413 ?auto_24418 ) ) ( not ( = ?auto_24413 ?auto_24428 ) ) ( not ( = ?auto_24386 ?auto_24402 ) ) ( not ( = ?auto_24386 ?auto_24406 ) ) ( not ( = ?auto_24387 ?auto_24402 ) ) ( not ( = ?auto_24387 ?auto_24406 ) ) ( not ( = ?auto_24388 ?auto_24402 ) ) ( not ( = ?auto_24388 ?auto_24406 ) ) ( not ( = ?auto_24389 ?auto_24402 ) ) ( not ( = ?auto_24389 ?auto_24406 ) ) ( not ( = ?auto_24390 ?auto_24402 ) ) ( not ( = ?auto_24390 ?auto_24406 ) ) ( not ( = ?auto_24391 ?auto_24402 ) ) ( not ( = ?auto_24391 ?auto_24406 ) ) ( not ( = ?auto_24394 ?auto_24402 ) ) ( not ( = ?auto_24394 ?auto_24406 ) ) ( not ( = ?auto_24393 ?auto_24402 ) ) ( not ( = ?auto_24393 ?auto_24406 ) ) ( not ( = ?auto_24392 ?auto_24402 ) ) ( not ( = ?auto_24392 ?auto_24406 ) ) ( not ( = ?auto_24395 ?auto_24402 ) ) ( not ( = ?auto_24395 ?auto_24406 ) ) ( not ( = ?auto_24397 ?auto_24402 ) ) ( not ( = ?auto_24397 ?auto_24406 ) ) ( not ( = ?auto_24396 ?auto_24402 ) ) ( not ( = ?auto_24396 ?auto_24406 ) ) ( not ( = ?auto_24398 ?auto_24402 ) ) ( not ( = ?auto_24398 ?auto_24406 ) ) ( not ( = ?auto_24400 ?auto_24402 ) ) ( not ( = ?auto_24400 ?auto_24406 ) ) ( not ( = ?auto_24399 ?auto_24402 ) ) ( not ( = ?auto_24399 ?auto_24406 ) ) ( not ( = ?auto_24402 ?auto_24413 ) ) ( not ( = ?auto_24402 ?auto_24422 ) ) ( not ( = ?auto_24402 ?auto_24416 ) ) ( not ( = ?auto_24402 ?auto_24427 ) ) ( not ( = ?auto_24402 ?auto_24431 ) ) ( not ( = ?auto_24402 ?auto_24411 ) ) ( not ( = ?auto_24402 ?auto_24433 ) ) ( not ( = ?auto_24402 ?auto_24435 ) ) ( not ( = ?auto_24402 ?auto_24415 ) ) ( not ( = ?auto_24402 ?auto_24419 ) ) ( not ( = ?auto_24402 ?auto_24429 ) ) ( not ( = ?auto_24402 ?auto_24409 ) ) ( not ( = ?auto_24402 ?auto_24410 ) ) ( not ( = ?auto_24402 ?auto_24418 ) ) ( not ( = ?auto_24402 ?auto_24428 ) ) ( not ( = ?auto_24406 ?auto_24413 ) ) ( not ( = ?auto_24406 ?auto_24422 ) ) ( not ( = ?auto_24406 ?auto_24416 ) ) ( not ( = ?auto_24406 ?auto_24427 ) ) ( not ( = ?auto_24406 ?auto_24431 ) ) ( not ( = ?auto_24406 ?auto_24411 ) ) ( not ( = ?auto_24406 ?auto_24433 ) ) ( not ( = ?auto_24406 ?auto_24435 ) ) ( not ( = ?auto_24406 ?auto_24415 ) ) ( not ( = ?auto_24406 ?auto_24419 ) ) ( not ( = ?auto_24406 ?auto_24429 ) ) ( not ( = ?auto_24406 ?auto_24409 ) ) ( not ( = ?auto_24406 ?auto_24410 ) ) ( not ( = ?auto_24406 ?auto_24418 ) ) ( not ( = ?auto_24406 ?auto_24428 ) ) )
    :subtasks
    ( ( MAKE-15CRATE ?auto_24386 ?auto_24387 ?auto_24388 ?auto_24389 ?auto_24390 ?auto_24391 ?auto_24394 ?auto_24393 ?auto_24392 ?auto_24395 ?auto_24397 ?auto_24396 ?auto_24398 ?auto_24400 ?auto_24399 ?auto_24401 )
      ( MAKE-1CRATE ?auto_24401 ?auto_24402 )
      ( MAKE-16CRATE-VERIFY ?auto_24386 ?auto_24387 ?auto_24388 ?auto_24389 ?auto_24390 ?auto_24391 ?auto_24394 ?auto_24393 ?auto_24392 ?auto_24395 ?auto_24397 ?auto_24396 ?auto_24398 ?auto_24400 ?auto_24399 ?auto_24401 ?auto_24402 ) )
  )

)
