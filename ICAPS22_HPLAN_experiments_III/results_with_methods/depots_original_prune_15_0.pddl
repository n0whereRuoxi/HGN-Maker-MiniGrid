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
      ?auto_1595643 - SURFACE
      ?auto_1595644 - SURFACE
    )
    :vars
    (
      ?auto_1595645 - HOIST
      ?auto_1595646 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595645 ?auto_1595646 ) ( SURFACE-AT ?auto_1595643 ?auto_1595646 ) ( CLEAR ?auto_1595643 ) ( LIFTING ?auto_1595645 ?auto_1595644 ) ( IS-CRATE ?auto_1595644 ) ( not ( = ?auto_1595643 ?auto_1595644 ) ) )
    :subtasks
    ( ( !DROP ?auto_1595645 ?auto_1595644 ?auto_1595643 ?auto_1595646 )
      ( MAKE-1CRATE-VERIFY ?auto_1595643 ?auto_1595644 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1595647 - SURFACE
      ?auto_1595648 - SURFACE
    )
    :vars
    (
      ?auto_1595649 - HOIST
      ?auto_1595650 - PLACE
      ?auto_1595651 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595649 ?auto_1595650 ) ( SURFACE-AT ?auto_1595647 ?auto_1595650 ) ( CLEAR ?auto_1595647 ) ( IS-CRATE ?auto_1595648 ) ( not ( = ?auto_1595647 ?auto_1595648 ) ) ( TRUCK-AT ?auto_1595651 ?auto_1595650 ) ( AVAILABLE ?auto_1595649 ) ( IN ?auto_1595648 ?auto_1595651 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1595649 ?auto_1595648 ?auto_1595651 ?auto_1595650 )
      ( MAKE-1CRATE ?auto_1595647 ?auto_1595648 )
      ( MAKE-1CRATE-VERIFY ?auto_1595647 ?auto_1595648 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1595652 - SURFACE
      ?auto_1595653 - SURFACE
    )
    :vars
    (
      ?auto_1595655 - HOIST
      ?auto_1595656 - PLACE
      ?auto_1595654 - TRUCK
      ?auto_1595657 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595655 ?auto_1595656 ) ( SURFACE-AT ?auto_1595652 ?auto_1595656 ) ( CLEAR ?auto_1595652 ) ( IS-CRATE ?auto_1595653 ) ( not ( = ?auto_1595652 ?auto_1595653 ) ) ( AVAILABLE ?auto_1595655 ) ( IN ?auto_1595653 ?auto_1595654 ) ( TRUCK-AT ?auto_1595654 ?auto_1595657 ) ( not ( = ?auto_1595657 ?auto_1595656 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1595654 ?auto_1595657 ?auto_1595656 )
      ( MAKE-1CRATE ?auto_1595652 ?auto_1595653 )
      ( MAKE-1CRATE-VERIFY ?auto_1595652 ?auto_1595653 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1595658 - SURFACE
      ?auto_1595659 - SURFACE
    )
    :vars
    (
      ?auto_1595663 - HOIST
      ?auto_1595661 - PLACE
      ?auto_1595662 - TRUCK
      ?auto_1595660 - PLACE
      ?auto_1595664 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595663 ?auto_1595661 ) ( SURFACE-AT ?auto_1595658 ?auto_1595661 ) ( CLEAR ?auto_1595658 ) ( IS-CRATE ?auto_1595659 ) ( not ( = ?auto_1595658 ?auto_1595659 ) ) ( AVAILABLE ?auto_1595663 ) ( TRUCK-AT ?auto_1595662 ?auto_1595660 ) ( not ( = ?auto_1595660 ?auto_1595661 ) ) ( HOIST-AT ?auto_1595664 ?auto_1595660 ) ( LIFTING ?auto_1595664 ?auto_1595659 ) ( not ( = ?auto_1595663 ?auto_1595664 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1595664 ?auto_1595659 ?auto_1595662 ?auto_1595660 )
      ( MAKE-1CRATE ?auto_1595658 ?auto_1595659 )
      ( MAKE-1CRATE-VERIFY ?auto_1595658 ?auto_1595659 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1595665 - SURFACE
      ?auto_1595666 - SURFACE
    )
    :vars
    (
      ?auto_1595668 - HOIST
      ?auto_1595670 - PLACE
      ?auto_1595667 - TRUCK
      ?auto_1595669 - PLACE
      ?auto_1595671 - HOIST
      ?auto_1595672 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595668 ?auto_1595670 ) ( SURFACE-AT ?auto_1595665 ?auto_1595670 ) ( CLEAR ?auto_1595665 ) ( IS-CRATE ?auto_1595666 ) ( not ( = ?auto_1595665 ?auto_1595666 ) ) ( AVAILABLE ?auto_1595668 ) ( TRUCK-AT ?auto_1595667 ?auto_1595669 ) ( not ( = ?auto_1595669 ?auto_1595670 ) ) ( HOIST-AT ?auto_1595671 ?auto_1595669 ) ( not ( = ?auto_1595668 ?auto_1595671 ) ) ( AVAILABLE ?auto_1595671 ) ( SURFACE-AT ?auto_1595666 ?auto_1595669 ) ( ON ?auto_1595666 ?auto_1595672 ) ( CLEAR ?auto_1595666 ) ( not ( = ?auto_1595665 ?auto_1595672 ) ) ( not ( = ?auto_1595666 ?auto_1595672 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1595671 ?auto_1595666 ?auto_1595672 ?auto_1595669 )
      ( MAKE-1CRATE ?auto_1595665 ?auto_1595666 )
      ( MAKE-1CRATE-VERIFY ?auto_1595665 ?auto_1595666 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1595673 - SURFACE
      ?auto_1595674 - SURFACE
    )
    :vars
    (
      ?auto_1595675 - HOIST
      ?auto_1595678 - PLACE
      ?auto_1595676 - PLACE
      ?auto_1595680 - HOIST
      ?auto_1595677 - SURFACE
      ?auto_1595679 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595675 ?auto_1595678 ) ( SURFACE-AT ?auto_1595673 ?auto_1595678 ) ( CLEAR ?auto_1595673 ) ( IS-CRATE ?auto_1595674 ) ( not ( = ?auto_1595673 ?auto_1595674 ) ) ( AVAILABLE ?auto_1595675 ) ( not ( = ?auto_1595676 ?auto_1595678 ) ) ( HOIST-AT ?auto_1595680 ?auto_1595676 ) ( not ( = ?auto_1595675 ?auto_1595680 ) ) ( AVAILABLE ?auto_1595680 ) ( SURFACE-AT ?auto_1595674 ?auto_1595676 ) ( ON ?auto_1595674 ?auto_1595677 ) ( CLEAR ?auto_1595674 ) ( not ( = ?auto_1595673 ?auto_1595677 ) ) ( not ( = ?auto_1595674 ?auto_1595677 ) ) ( TRUCK-AT ?auto_1595679 ?auto_1595678 ) )
    :subtasks
    ( ( !DRIVE ?auto_1595679 ?auto_1595678 ?auto_1595676 )
      ( MAKE-1CRATE ?auto_1595673 ?auto_1595674 )
      ( MAKE-1CRATE-VERIFY ?auto_1595673 ?auto_1595674 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1595690 - SURFACE
      ?auto_1595691 - SURFACE
      ?auto_1595692 - SURFACE
    )
    :vars
    (
      ?auto_1595693 - HOIST
      ?auto_1595694 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595693 ?auto_1595694 ) ( SURFACE-AT ?auto_1595691 ?auto_1595694 ) ( CLEAR ?auto_1595691 ) ( LIFTING ?auto_1595693 ?auto_1595692 ) ( IS-CRATE ?auto_1595692 ) ( not ( = ?auto_1595691 ?auto_1595692 ) ) ( ON ?auto_1595691 ?auto_1595690 ) ( not ( = ?auto_1595690 ?auto_1595691 ) ) ( not ( = ?auto_1595690 ?auto_1595692 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1595691 ?auto_1595692 )
      ( MAKE-2CRATE-VERIFY ?auto_1595690 ?auto_1595691 ?auto_1595692 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1595700 - SURFACE
      ?auto_1595701 - SURFACE
      ?auto_1595702 - SURFACE
    )
    :vars
    (
      ?auto_1595704 - HOIST
      ?auto_1595705 - PLACE
      ?auto_1595703 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595704 ?auto_1595705 ) ( SURFACE-AT ?auto_1595701 ?auto_1595705 ) ( CLEAR ?auto_1595701 ) ( IS-CRATE ?auto_1595702 ) ( not ( = ?auto_1595701 ?auto_1595702 ) ) ( TRUCK-AT ?auto_1595703 ?auto_1595705 ) ( AVAILABLE ?auto_1595704 ) ( IN ?auto_1595702 ?auto_1595703 ) ( ON ?auto_1595701 ?auto_1595700 ) ( not ( = ?auto_1595700 ?auto_1595701 ) ) ( not ( = ?auto_1595700 ?auto_1595702 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1595701 ?auto_1595702 )
      ( MAKE-2CRATE-VERIFY ?auto_1595700 ?auto_1595701 ?auto_1595702 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1595706 - SURFACE
      ?auto_1595707 - SURFACE
    )
    :vars
    (
      ?auto_1595708 - HOIST
      ?auto_1595711 - PLACE
      ?auto_1595710 - TRUCK
      ?auto_1595709 - SURFACE
      ?auto_1595712 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595708 ?auto_1595711 ) ( SURFACE-AT ?auto_1595706 ?auto_1595711 ) ( CLEAR ?auto_1595706 ) ( IS-CRATE ?auto_1595707 ) ( not ( = ?auto_1595706 ?auto_1595707 ) ) ( AVAILABLE ?auto_1595708 ) ( IN ?auto_1595707 ?auto_1595710 ) ( ON ?auto_1595706 ?auto_1595709 ) ( not ( = ?auto_1595709 ?auto_1595706 ) ) ( not ( = ?auto_1595709 ?auto_1595707 ) ) ( TRUCK-AT ?auto_1595710 ?auto_1595712 ) ( not ( = ?auto_1595712 ?auto_1595711 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1595710 ?auto_1595712 ?auto_1595711 )
      ( MAKE-2CRATE ?auto_1595709 ?auto_1595706 ?auto_1595707 )
      ( MAKE-1CRATE-VERIFY ?auto_1595706 ?auto_1595707 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1595713 - SURFACE
      ?auto_1595714 - SURFACE
      ?auto_1595715 - SURFACE
    )
    :vars
    (
      ?auto_1595719 - HOIST
      ?auto_1595718 - PLACE
      ?auto_1595717 - TRUCK
      ?auto_1595716 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595719 ?auto_1595718 ) ( SURFACE-AT ?auto_1595714 ?auto_1595718 ) ( CLEAR ?auto_1595714 ) ( IS-CRATE ?auto_1595715 ) ( not ( = ?auto_1595714 ?auto_1595715 ) ) ( AVAILABLE ?auto_1595719 ) ( IN ?auto_1595715 ?auto_1595717 ) ( ON ?auto_1595714 ?auto_1595713 ) ( not ( = ?auto_1595713 ?auto_1595714 ) ) ( not ( = ?auto_1595713 ?auto_1595715 ) ) ( TRUCK-AT ?auto_1595717 ?auto_1595716 ) ( not ( = ?auto_1595716 ?auto_1595718 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1595714 ?auto_1595715 )
      ( MAKE-2CRATE-VERIFY ?auto_1595713 ?auto_1595714 ?auto_1595715 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1595720 - SURFACE
      ?auto_1595721 - SURFACE
    )
    :vars
    (
      ?auto_1595726 - HOIST
      ?auto_1595724 - PLACE
      ?auto_1595722 - SURFACE
      ?auto_1595725 - TRUCK
      ?auto_1595723 - PLACE
      ?auto_1595727 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595726 ?auto_1595724 ) ( SURFACE-AT ?auto_1595720 ?auto_1595724 ) ( CLEAR ?auto_1595720 ) ( IS-CRATE ?auto_1595721 ) ( not ( = ?auto_1595720 ?auto_1595721 ) ) ( AVAILABLE ?auto_1595726 ) ( ON ?auto_1595720 ?auto_1595722 ) ( not ( = ?auto_1595722 ?auto_1595720 ) ) ( not ( = ?auto_1595722 ?auto_1595721 ) ) ( TRUCK-AT ?auto_1595725 ?auto_1595723 ) ( not ( = ?auto_1595723 ?auto_1595724 ) ) ( HOIST-AT ?auto_1595727 ?auto_1595723 ) ( LIFTING ?auto_1595727 ?auto_1595721 ) ( not ( = ?auto_1595726 ?auto_1595727 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1595727 ?auto_1595721 ?auto_1595725 ?auto_1595723 )
      ( MAKE-2CRATE ?auto_1595722 ?auto_1595720 ?auto_1595721 )
      ( MAKE-1CRATE-VERIFY ?auto_1595720 ?auto_1595721 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1595728 - SURFACE
      ?auto_1595729 - SURFACE
      ?auto_1595730 - SURFACE
    )
    :vars
    (
      ?auto_1595731 - HOIST
      ?auto_1595734 - PLACE
      ?auto_1595732 - TRUCK
      ?auto_1595733 - PLACE
      ?auto_1595735 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595731 ?auto_1595734 ) ( SURFACE-AT ?auto_1595729 ?auto_1595734 ) ( CLEAR ?auto_1595729 ) ( IS-CRATE ?auto_1595730 ) ( not ( = ?auto_1595729 ?auto_1595730 ) ) ( AVAILABLE ?auto_1595731 ) ( ON ?auto_1595729 ?auto_1595728 ) ( not ( = ?auto_1595728 ?auto_1595729 ) ) ( not ( = ?auto_1595728 ?auto_1595730 ) ) ( TRUCK-AT ?auto_1595732 ?auto_1595733 ) ( not ( = ?auto_1595733 ?auto_1595734 ) ) ( HOIST-AT ?auto_1595735 ?auto_1595733 ) ( LIFTING ?auto_1595735 ?auto_1595730 ) ( not ( = ?auto_1595731 ?auto_1595735 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1595729 ?auto_1595730 )
      ( MAKE-2CRATE-VERIFY ?auto_1595728 ?auto_1595729 ?auto_1595730 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1595736 - SURFACE
      ?auto_1595737 - SURFACE
    )
    :vars
    (
      ?auto_1595743 - HOIST
      ?auto_1595739 - PLACE
      ?auto_1595740 - SURFACE
      ?auto_1595741 - TRUCK
      ?auto_1595738 - PLACE
      ?auto_1595742 - HOIST
      ?auto_1595744 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595743 ?auto_1595739 ) ( SURFACE-AT ?auto_1595736 ?auto_1595739 ) ( CLEAR ?auto_1595736 ) ( IS-CRATE ?auto_1595737 ) ( not ( = ?auto_1595736 ?auto_1595737 ) ) ( AVAILABLE ?auto_1595743 ) ( ON ?auto_1595736 ?auto_1595740 ) ( not ( = ?auto_1595740 ?auto_1595736 ) ) ( not ( = ?auto_1595740 ?auto_1595737 ) ) ( TRUCK-AT ?auto_1595741 ?auto_1595738 ) ( not ( = ?auto_1595738 ?auto_1595739 ) ) ( HOIST-AT ?auto_1595742 ?auto_1595738 ) ( not ( = ?auto_1595743 ?auto_1595742 ) ) ( AVAILABLE ?auto_1595742 ) ( SURFACE-AT ?auto_1595737 ?auto_1595738 ) ( ON ?auto_1595737 ?auto_1595744 ) ( CLEAR ?auto_1595737 ) ( not ( = ?auto_1595736 ?auto_1595744 ) ) ( not ( = ?auto_1595737 ?auto_1595744 ) ) ( not ( = ?auto_1595740 ?auto_1595744 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1595742 ?auto_1595737 ?auto_1595744 ?auto_1595738 )
      ( MAKE-2CRATE ?auto_1595740 ?auto_1595736 ?auto_1595737 )
      ( MAKE-1CRATE-VERIFY ?auto_1595736 ?auto_1595737 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1595745 - SURFACE
      ?auto_1595746 - SURFACE
      ?auto_1595747 - SURFACE
    )
    :vars
    (
      ?auto_1595751 - HOIST
      ?auto_1595752 - PLACE
      ?auto_1595749 - TRUCK
      ?auto_1595748 - PLACE
      ?auto_1595750 - HOIST
      ?auto_1595753 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595751 ?auto_1595752 ) ( SURFACE-AT ?auto_1595746 ?auto_1595752 ) ( CLEAR ?auto_1595746 ) ( IS-CRATE ?auto_1595747 ) ( not ( = ?auto_1595746 ?auto_1595747 ) ) ( AVAILABLE ?auto_1595751 ) ( ON ?auto_1595746 ?auto_1595745 ) ( not ( = ?auto_1595745 ?auto_1595746 ) ) ( not ( = ?auto_1595745 ?auto_1595747 ) ) ( TRUCK-AT ?auto_1595749 ?auto_1595748 ) ( not ( = ?auto_1595748 ?auto_1595752 ) ) ( HOIST-AT ?auto_1595750 ?auto_1595748 ) ( not ( = ?auto_1595751 ?auto_1595750 ) ) ( AVAILABLE ?auto_1595750 ) ( SURFACE-AT ?auto_1595747 ?auto_1595748 ) ( ON ?auto_1595747 ?auto_1595753 ) ( CLEAR ?auto_1595747 ) ( not ( = ?auto_1595746 ?auto_1595753 ) ) ( not ( = ?auto_1595747 ?auto_1595753 ) ) ( not ( = ?auto_1595745 ?auto_1595753 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1595746 ?auto_1595747 )
      ( MAKE-2CRATE-VERIFY ?auto_1595745 ?auto_1595746 ?auto_1595747 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1595754 - SURFACE
      ?auto_1595755 - SURFACE
    )
    :vars
    (
      ?auto_1595756 - HOIST
      ?auto_1595758 - PLACE
      ?auto_1595760 - SURFACE
      ?auto_1595761 - PLACE
      ?auto_1595762 - HOIST
      ?auto_1595757 - SURFACE
      ?auto_1595759 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595756 ?auto_1595758 ) ( SURFACE-AT ?auto_1595754 ?auto_1595758 ) ( CLEAR ?auto_1595754 ) ( IS-CRATE ?auto_1595755 ) ( not ( = ?auto_1595754 ?auto_1595755 ) ) ( AVAILABLE ?auto_1595756 ) ( ON ?auto_1595754 ?auto_1595760 ) ( not ( = ?auto_1595760 ?auto_1595754 ) ) ( not ( = ?auto_1595760 ?auto_1595755 ) ) ( not ( = ?auto_1595761 ?auto_1595758 ) ) ( HOIST-AT ?auto_1595762 ?auto_1595761 ) ( not ( = ?auto_1595756 ?auto_1595762 ) ) ( AVAILABLE ?auto_1595762 ) ( SURFACE-AT ?auto_1595755 ?auto_1595761 ) ( ON ?auto_1595755 ?auto_1595757 ) ( CLEAR ?auto_1595755 ) ( not ( = ?auto_1595754 ?auto_1595757 ) ) ( not ( = ?auto_1595755 ?auto_1595757 ) ) ( not ( = ?auto_1595760 ?auto_1595757 ) ) ( TRUCK-AT ?auto_1595759 ?auto_1595758 ) )
    :subtasks
    ( ( !DRIVE ?auto_1595759 ?auto_1595758 ?auto_1595761 )
      ( MAKE-2CRATE ?auto_1595760 ?auto_1595754 ?auto_1595755 )
      ( MAKE-1CRATE-VERIFY ?auto_1595754 ?auto_1595755 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1595763 - SURFACE
      ?auto_1595764 - SURFACE
      ?auto_1595765 - SURFACE
    )
    :vars
    (
      ?auto_1595768 - HOIST
      ?auto_1595766 - PLACE
      ?auto_1595767 - PLACE
      ?auto_1595771 - HOIST
      ?auto_1595770 - SURFACE
      ?auto_1595769 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595768 ?auto_1595766 ) ( SURFACE-AT ?auto_1595764 ?auto_1595766 ) ( CLEAR ?auto_1595764 ) ( IS-CRATE ?auto_1595765 ) ( not ( = ?auto_1595764 ?auto_1595765 ) ) ( AVAILABLE ?auto_1595768 ) ( ON ?auto_1595764 ?auto_1595763 ) ( not ( = ?auto_1595763 ?auto_1595764 ) ) ( not ( = ?auto_1595763 ?auto_1595765 ) ) ( not ( = ?auto_1595767 ?auto_1595766 ) ) ( HOIST-AT ?auto_1595771 ?auto_1595767 ) ( not ( = ?auto_1595768 ?auto_1595771 ) ) ( AVAILABLE ?auto_1595771 ) ( SURFACE-AT ?auto_1595765 ?auto_1595767 ) ( ON ?auto_1595765 ?auto_1595770 ) ( CLEAR ?auto_1595765 ) ( not ( = ?auto_1595764 ?auto_1595770 ) ) ( not ( = ?auto_1595765 ?auto_1595770 ) ) ( not ( = ?auto_1595763 ?auto_1595770 ) ) ( TRUCK-AT ?auto_1595769 ?auto_1595766 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1595764 ?auto_1595765 )
      ( MAKE-2CRATE-VERIFY ?auto_1595763 ?auto_1595764 ?auto_1595765 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1595772 - SURFACE
      ?auto_1595773 - SURFACE
    )
    :vars
    (
      ?auto_1595775 - HOIST
      ?auto_1595780 - PLACE
      ?auto_1595778 - SURFACE
      ?auto_1595774 - PLACE
      ?auto_1595779 - HOIST
      ?auto_1595776 - SURFACE
      ?auto_1595777 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595775 ?auto_1595780 ) ( IS-CRATE ?auto_1595773 ) ( not ( = ?auto_1595772 ?auto_1595773 ) ) ( not ( = ?auto_1595778 ?auto_1595772 ) ) ( not ( = ?auto_1595778 ?auto_1595773 ) ) ( not ( = ?auto_1595774 ?auto_1595780 ) ) ( HOIST-AT ?auto_1595779 ?auto_1595774 ) ( not ( = ?auto_1595775 ?auto_1595779 ) ) ( AVAILABLE ?auto_1595779 ) ( SURFACE-AT ?auto_1595773 ?auto_1595774 ) ( ON ?auto_1595773 ?auto_1595776 ) ( CLEAR ?auto_1595773 ) ( not ( = ?auto_1595772 ?auto_1595776 ) ) ( not ( = ?auto_1595773 ?auto_1595776 ) ) ( not ( = ?auto_1595778 ?auto_1595776 ) ) ( TRUCK-AT ?auto_1595777 ?auto_1595780 ) ( SURFACE-AT ?auto_1595778 ?auto_1595780 ) ( CLEAR ?auto_1595778 ) ( LIFTING ?auto_1595775 ?auto_1595772 ) ( IS-CRATE ?auto_1595772 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1595778 ?auto_1595772 )
      ( MAKE-2CRATE ?auto_1595778 ?auto_1595772 ?auto_1595773 )
      ( MAKE-1CRATE-VERIFY ?auto_1595772 ?auto_1595773 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1595781 - SURFACE
      ?auto_1595782 - SURFACE
      ?auto_1595783 - SURFACE
    )
    :vars
    (
      ?auto_1595786 - HOIST
      ?auto_1595788 - PLACE
      ?auto_1595784 - PLACE
      ?auto_1595789 - HOIST
      ?auto_1595787 - SURFACE
      ?auto_1595785 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595786 ?auto_1595788 ) ( IS-CRATE ?auto_1595783 ) ( not ( = ?auto_1595782 ?auto_1595783 ) ) ( not ( = ?auto_1595781 ?auto_1595782 ) ) ( not ( = ?auto_1595781 ?auto_1595783 ) ) ( not ( = ?auto_1595784 ?auto_1595788 ) ) ( HOIST-AT ?auto_1595789 ?auto_1595784 ) ( not ( = ?auto_1595786 ?auto_1595789 ) ) ( AVAILABLE ?auto_1595789 ) ( SURFACE-AT ?auto_1595783 ?auto_1595784 ) ( ON ?auto_1595783 ?auto_1595787 ) ( CLEAR ?auto_1595783 ) ( not ( = ?auto_1595782 ?auto_1595787 ) ) ( not ( = ?auto_1595783 ?auto_1595787 ) ) ( not ( = ?auto_1595781 ?auto_1595787 ) ) ( TRUCK-AT ?auto_1595785 ?auto_1595788 ) ( SURFACE-AT ?auto_1595781 ?auto_1595788 ) ( CLEAR ?auto_1595781 ) ( LIFTING ?auto_1595786 ?auto_1595782 ) ( IS-CRATE ?auto_1595782 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1595782 ?auto_1595783 )
      ( MAKE-2CRATE-VERIFY ?auto_1595781 ?auto_1595782 ?auto_1595783 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1595790 - SURFACE
      ?auto_1595791 - SURFACE
    )
    :vars
    (
      ?auto_1595798 - HOIST
      ?auto_1595796 - PLACE
      ?auto_1595792 - SURFACE
      ?auto_1595794 - PLACE
      ?auto_1595793 - HOIST
      ?auto_1595795 - SURFACE
      ?auto_1595797 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595798 ?auto_1595796 ) ( IS-CRATE ?auto_1595791 ) ( not ( = ?auto_1595790 ?auto_1595791 ) ) ( not ( = ?auto_1595792 ?auto_1595790 ) ) ( not ( = ?auto_1595792 ?auto_1595791 ) ) ( not ( = ?auto_1595794 ?auto_1595796 ) ) ( HOIST-AT ?auto_1595793 ?auto_1595794 ) ( not ( = ?auto_1595798 ?auto_1595793 ) ) ( AVAILABLE ?auto_1595793 ) ( SURFACE-AT ?auto_1595791 ?auto_1595794 ) ( ON ?auto_1595791 ?auto_1595795 ) ( CLEAR ?auto_1595791 ) ( not ( = ?auto_1595790 ?auto_1595795 ) ) ( not ( = ?auto_1595791 ?auto_1595795 ) ) ( not ( = ?auto_1595792 ?auto_1595795 ) ) ( TRUCK-AT ?auto_1595797 ?auto_1595796 ) ( SURFACE-AT ?auto_1595792 ?auto_1595796 ) ( CLEAR ?auto_1595792 ) ( IS-CRATE ?auto_1595790 ) ( AVAILABLE ?auto_1595798 ) ( IN ?auto_1595790 ?auto_1595797 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1595798 ?auto_1595790 ?auto_1595797 ?auto_1595796 )
      ( MAKE-2CRATE ?auto_1595792 ?auto_1595790 ?auto_1595791 )
      ( MAKE-1CRATE-VERIFY ?auto_1595790 ?auto_1595791 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1595799 - SURFACE
      ?auto_1595800 - SURFACE
      ?auto_1595801 - SURFACE
    )
    :vars
    (
      ?auto_1595805 - HOIST
      ?auto_1595806 - PLACE
      ?auto_1595804 - PLACE
      ?auto_1595807 - HOIST
      ?auto_1595802 - SURFACE
      ?auto_1595803 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595805 ?auto_1595806 ) ( IS-CRATE ?auto_1595801 ) ( not ( = ?auto_1595800 ?auto_1595801 ) ) ( not ( = ?auto_1595799 ?auto_1595800 ) ) ( not ( = ?auto_1595799 ?auto_1595801 ) ) ( not ( = ?auto_1595804 ?auto_1595806 ) ) ( HOIST-AT ?auto_1595807 ?auto_1595804 ) ( not ( = ?auto_1595805 ?auto_1595807 ) ) ( AVAILABLE ?auto_1595807 ) ( SURFACE-AT ?auto_1595801 ?auto_1595804 ) ( ON ?auto_1595801 ?auto_1595802 ) ( CLEAR ?auto_1595801 ) ( not ( = ?auto_1595800 ?auto_1595802 ) ) ( not ( = ?auto_1595801 ?auto_1595802 ) ) ( not ( = ?auto_1595799 ?auto_1595802 ) ) ( TRUCK-AT ?auto_1595803 ?auto_1595806 ) ( SURFACE-AT ?auto_1595799 ?auto_1595806 ) ( CLEAR ?auto_1595799 ) ( IS-CRATE ?auto_1595800 ) ( AVAILABLE ?auto_1595805 ) ( IN ?auto_1595800 ?auto_1595803 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1595800 ?auto_1595801 )
      ( MAKE-2CRATE-VERIFY ?auto_1595799 ?auto_1595800 ?auto_1595801 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1595808 - SURFACE
      ?auto_1595809 - SURFACE
    )
    :vars
    (
      ?auto_1595816 - HOIST
      ?auto_1595812 - PLACE
      ?auto_1595810 - SURFACE
      ?auto_1595814 - PLACE
      ?auto_1595813 - HOIST
      ?auto_1595811 - SURFACE
      ?auto_1595815 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595816 ?auto_1595812 ) ( IS-CRATE ?auto_1595809 ) ( not ( = ?auto_1595808 ?auto_1595809 ) ) ( not ( = ?auto_1595810 ?auto_1595808 ) ) ( not ( = ?auto_1595810 ?auto_1595809 ) ) ( not ( = ?auto_1595814 ?auto_1595812 ) ) ( HOIST-AT ?auto_1595813 ?auto_1595814 ) ( not ( = ?auto_1595816 ?auto_1595813 ) ) ( AVAILABLE ?auto_1595813 ) ( SURFACE-AT ?auto_1595809 ?auto_1595814 ) ( ON ?auto_1595809 ?auto_1595811 ) ( CLEAR ?auto_1595809 ) ( not ( = ?auto_1595808 ?auto_1595811 ) ) ( not ( = ?auto_1595809 ?auto_1595811 ) ) ( not ( = ?auto_1595810 ?auto_1595811 ) ) ( SURFACE-AT ?auto_1595810 ?auto_1595812 ) ( CLEAR ?auto_1595810 ) ( IS-CRATE ?auto_1595808 ) ( AVAILABLE ?auto_1595816 ) ( IN ?auto_1595808 ?auto_1595815 ) ( TRUCK-AT ?auto_1595815 ?auto_1595814 ) )
    :subtasks
    ( ( !DRIVE ?auto_1595815 ?auto_1595814 ?auto_1595812 )
      ( MAKE-2CRATE ?auto_1595810 ?auto_1595808 ?auto_1595809 )
      ( MAKE-1CRATE-VERIFY ?auto_1595808 ?auto_1595809 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1595817 - SURFACE
      ?auto_1595818 - SURFACE
      ?auto_1595819 - SURFACE
    )
    :vars
    (
      ?auto_1595821 - HOIST
      ?auto_1595820 - PLACE
      ?auto_1595823 - PLACE
      ?auto_1595824 - HOIST
      ?auto_1595825 - SURFACE
      ?auto_1595822 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595821 ?auto_1595820 ) ( IS-CRATE ?auto_1595819 ) ( not ( = ?auto_1595818 ?auto_1595819 ) ) ( not ( = ?auto_1595817 ?auto_1595818 ) ) ( not ( = ?auto_1595817 ?auto_1595819 ) ) ( not ( = ?auto_1595823 ?auto_1595820 ) ) ( HOIST-AT ?auto_1595824 ?auto_1595823 ) ( not ( = ?auto_1595821 ?auto_1595824 ) ) ( AVAILABLE ?auto_1595824 ) ( SURFACE-AT ?auto_1595819 ?auto_1595823 ) ( ON ?auto_1595819 ?auto_1595825 ) ( CLEAR ?auto_1595819 ) ( not ( = ?auto_1595818 ?auto_1595825 ) ) ( not ( = ?auto_1595819 ?auto_1595825 ) ) ( not ( = ?auto_1595817 ?auto_1595825 ) ) ( SURFACE-AT ?auto_1595817 ?auto_1595820 ) ( CLEAR ?auto_1595817 ) ( IS-CRATE ?auto_1595818 ) ( AVAILABLE ?auto_1595821 ) ( IN ?auto_1595818 ?auto_1595822 ) ( TRUCK-AT ?auto_1595822 ?auto_1595823 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1595818 ?auto_1595819 )
      ( MAKE-2CRATE-VERIFY ?auto_1595817 ?auto_1595818 ?auto_1595819 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1595826 - SURFACE
      ?auto_1595827 - SURFACE
    )
    :vars
    (
      ?auto_1595831 - HOIST
      ?auto_1595834 - PLACE
      ?auto_1595832 - SURFACE
      ?auto_1595829 - PLACE
      ?auto_1595828 - HOIST
      ?auto_1595833 - SURFACE
      ?auto_1595830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595831 ?auto_1595834 ) ( IS-CRATE ?auto_1595827 ) ( not ( = ?auto_1595826 ?auto_1595827 ) ) ( not ( = ?auto_1595832 ?auto_1595826 ) ) ( not ( = ?auto_1595832 ?auto_1595827 ) ) ( not ( = ?auto_1595829 ?auto_1595834 ) ) ( HOIST-AT ?auto_1595828 ?auto_1595829 ) ( not ( = ?auto_1595831 ?auto_1595828 ) ) ( SURFACE-AT ?auto_1595827 ?auto_1595829 ) ( ON ?auto_1595827 ?auto_1595833 ) ( CLEAR ?auto_1595827 ) ( not ( = ?auto_1595826 ?auto_1595833 ) ) ( not ( = ?auto_1595827 ?auto_1595833 ) ) ( not ( = ?auto_1595832 ?auto_1595833 ) ) ( SURFACE-AT ?auto_1595832 ?auto_1595834 ) ( CLEAR ?auto_1595832 ) ( IS-CRATE ?auto_1595826 ) ( AVAILABLE ?auto_1595831 ) ( TRUCK-AT ?auto_1595830 ?auto_1595829 ) ( LIFTING ?auto_1595828 ?auto_1595826 ) )
    :subtasks
    ( ( !LOAD ?auto_1595828 ?auto_1595826 ?auto_1595830 ?auto_1595829 )
      ( MAKE-2CRATE ?auto_1595832 ?auto_1595826 ?auto_1595827 )
      ( MAKE-1CRATE-VERIFY ?auto_1595826 ?auto_1595827 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1595835 - SURFACE
      ?auto_1595836 - SURFACE
      ?auto_1595837 - SURFACE
    )
    :vars
    (
      ?auto_1595839 - HOIST
      ?auto_1595838 - PLACE
      ?auto_1595843 - PLACE
      ?auto_1595842 - HOIST
      ?auto_1595841 - SURFACE
      ?auto_1595840 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595839 ?auto_1595838 ) ( IS-CRATE ?auto_1595837 ) ( not ( = ?auto_1595836 ?auto_1595837 ) ) ( not ( = ?auto_1595835 ?auto_1595836 ) ) ( not ( = ?auto_1595835 ?auto_1595837 ) ) ( not ( = ?auto_1595843 ?auto_1595838 ) ) ( HOIST-AT ?auto_1595842 ?auto_1595843 ) ( not ( = ?auto_1595839 ?auto_1595842 ) ) ( SURFACE-AT ?auto_1595837 ?auto_1595843 ) ( ON ?auto_1595837 ?auto_1595841 ) ( CLEAR ?auto_1595837 ) ( not ( = ?auto_1595836 ?auto_1595841 ) ) ( not ( = ?auto_1595837 ?auto_1595841 ) ) ( not ( = ?auto_1595835 ?auto_1595841 ) ) ( SURFACE-AT ?auto_1595835 ?auto_1595838 ) ( CLEAR ?auto_1595835 ) ( IS-CRATE ?auto_1595836 ) ( AVAILABLE ?auto_1595839 ) ( TRUCK-AT ?auto_1595840 ?auto_1595843 ) ( LIFTING ?auto_1595842 ?auto_1595836 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1595836 ?auto_1595837 )
      ( MAKE-2CRATE-VERIFY ?auto_1595835 ?auto_1595836 ?auto_1595837 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1595844 - SURFACE
      ?auto_1595845 - SURFACE
    )
    :vars
    (
      ?auto_1595846 - HOIST
      ?auto_1595848 - PLACE
      ?auto_1595849 - SURFACE
      ?auto_1595850 - PLACE
      ?auto_1595852 - HOIST
      ?auto_1595847 - SURFACE
      ?auto_1595851 - TRUCK
      ?auto_1595853 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595846 ?auto_1595848 ) ( IS-CRATE ?auto_1595845 ) ( not ( = ?auto_1595844 ?auto_1595845 ) ) ( not ( = ?auto_1595849 ?auto_1595844 ) ) ( not ( = ?auto_1595849 ?auto_1595845 ) ) ( not ( = ?auto_1595850 ?auto_1595848 ) ) ( HOIST-AT ?auto_1595852 ?auto_1595850 ) ( not ( = ?auto_1595846 ?auto_1595852 ) ) ( SURFACE-AT ?auto_1595845 ?auto_1595850 ) ( ON ?auto_1595845 ?auto_1595847 ) ( CLEAR ?auto_1595845 ) ( not ( = ?auto_1595844 ?auto_1595847 ) ) ( not ( = ?auto_1595845 ?auto_1595847 ) ) ( not ( = ?auto_1595849 ?auto_1595847 ) ) ( SURFACE-AT ?auto_1595849 ?auto_1595848 ) ( CLEAR ?auto_1595849 ) ( IS-CRATE ?auto_1595844 ) ( AVAILABLE ?auto_1595846 ) ( TRUCK-AT ?auto_1595851 ?auto_1595850 ) ( AVAILABLE ?auto_1595852 ) ( SURFACE-AT ?auto_1595844 ?auto_1595850 ) ( ON ?auto_1595844 ?auto_1595853 ) ( CLEAR ?auto_1595844 ) ( not ( = ?auto_1595844 ?auto_1595853 ) ) ( not ( = ?auto_1595845 ?auto_1595853 ) ) ( not ( = ?auto_1595849 ?auto_1595853 ) ) ( not ( = ?auto_1595847 ?auto_1595853 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1595852 ?auto_1595844 ?auto_1595853 ?auto_1595850 )
      ( MAKE-2CRATE ?auto_1595849 ?auto_1595844 ?auto_1595845 )
      ( MAKE-1CRATE-VERIFY ?auto_1595844 ?auto_1595845 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1595854 - SURFACE
      ?auto_1595855 - SURFACE
      ?auto_1595856 - SURFACE
    )
    :vars
    (
      ?auto_1595863 - HOIST
      ?auto_1595860 - PLACE
      ?auto_1595861 - PLACE
      ?auto_1595862 - HOIST
      ?auto_1595857 - SURFACE
      ?auto_1595858 - TRUCK
      ?auto_1595859 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595863 ?auto_1595860 ) ( IS-CRATE ?auto_1595856 ) ( not ( = ?auto_1595855 ?auto_1595856 ) ) ( not ( = ?auto_1595854 ?auto_1595855 ) ) ( not ( = ?auto_1595854 ?auto_1595856 ) ) ( not ( = ?auto_1595861 ?auto_1595860 ) ) ( HOIST-AT ?auto_1595862 ?auto_1595861 ) ( not ( = ?auto_1595863 ?auto_1595862 ) ) ( SURFACE-AT ?auto_1595856 ?auto_1595861 ) ( ON ?auto_1595856 ?auto_1595857 ) ( CLEAR ?auto_1595856 ) ( not ( = ?auto_1595855 ?auto_1595857 ) ) ( not ( = ?auto_1595856 ?auto_1595857 ) ) ( not ( = ?auto_1595854 ?auto_1595857 ) ) ( SURFACE-AT ?auto_1595854 ?auto_1595860 ) ( CLEAR ?auto_1595854 ) ( IS-CRATE ?auto_1595855 ) ( AVAILABLE ?auto_1595863 ) ( TRUCK-AT ?auto_1595858 ?auto_1595861 ) ( AVAILABLE ?auto_1595862 ) ( SURFACE-AT ?auto_1595855 ?auto_1595861 ) ( ON ?auto_1595855 ?auto_1595859 ) ( CLEAR ?auto_1595855 ) ( not ( = ?auto_1595855 ?auto_1595859 ) ) ( not ( = ?auto_1595856 ?auto_1595859 ) ) ( not ( = ?auto_1595854 ?auto_1595859 ) ) ( not ( = ?auto_1595857 ?auto_1595859 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1595855 ?auto_1595856 )
      ( MAKE-2CRATE-VERIFY ?auto_1595854 ?auto_1595855 ?auto_1595856 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1595864 - SURFACE
      ?auto_1595865 - SURFACE
    )
    :vars
    (
      ?auto_1595873 - HOIST
      ?auto_1595867 - PLACE
      ?auto_1595869 - SURFACE
      ?auto_1595871 - PLACE
      ?auto_1595870 - HOIST
      ?auto_1595868 - SURFACE
      ?auto_1595866 - SURFACE
      ?auto_1595872 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595873 ?auto_1595867 ) ( IS-CRATE ?auto_1595865 ) ( not ( = ?auto_1595864 ?auto_1595865 ) ) ( not ( = ?auto_1595869 ?auto_1595864 ) ) ( not ( = ?auto_1595869 ?auto_1595865 ) ) ( not ( = ?auto_1595871 ?auto_1595867 ) ) ( HOIST-AT ?auto_1595870 ?auto_1595871 ) ( not ( = ?auto_1595873 ?auto_1595870 ) ) ( SURFACE-AT ?auto_1595865 ?auto_1595871 ) ( ON ?auto_1595865 ?auto_1595868 ) ( CLEAR ?auto_1595865 ) ( not ( = ?auto_1595864 ?auto_1595868 ) ) ( not ( = ?auto_1595865 ?auto_1595868 ) ) ( not ( = ?auto_1595869 ?auto_1595868 ) ) ( SURFACE-AT ?auto_1595869 ?auto_1595867 ) ( CLEAR ?auto_1595869 ) ( IS-CRATE ?auto_1595864 ) ( AVAILABLE ?auto_1595873 ) ( AVAILABLE ?auto_1595870 ) ( SURFACE-AT ?auto_1595864 ?auto_1595871 ) ( ON ?auto_1595864 ?auto_1595866 ) ( CLEAR ?auto_1595864 ) ( not ( = ?auto_1595864 ?auto_1595866 ) ) ( not ( = ?auto_1595865 ?auto_1595866 ) ) ( not ( = ?auto_1595869 ?auto_1595866 ) ) ( not ( = ?auto_1595868 ?auto_1595866 ) ) ( TRUCK-AT ?auto_1595872 ?auto_1595867 ) )
    :subtasks
    ( ( !DRIVE ?auto_1595872 ?auto_1595867 ?auto_1595871 )
      ( MAKE-2CRATE ?auto_1595869 ?auto_1595864 ?auto_1595865 )
      ( MAKE-1CRATE-VERIFY ?auto_1595864 ?auto_1595865 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1595874 - SURFACE
      ?auto_1595875 - SURFACE
      ?auto_1595876 - SURFACE
    )
    :vars
    (
      ?auto_1595882 - HOIST
      ?auto_1595878 - PLACE
      ?auto_1595877 - PLACE
      ?auto_1595879 - HOIST
      ?auto_1595883 - SURFACE
      ?auto_1595881 - SURFACE
      ?auto_1595880 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595882 ?auto_1595878 ) ( IS-CRATE ?auto_1595876 ) ( not ( = ?auto_1595875 ?auto_1595876 ) ) ( not ( = ?auto_1595874 ?auto_1595875 ) ) ( not ( = ?auto_1595874 ?auto_1595876 ) ) ( not ( = ?auto_1595877 ?auto_1595878 ) ) ( HOIST-AT ?auto_1595879 ?auto_1595877 ) ( not ( = ?auto_1595882 ?auto_1595879 ) ) ( SURFACE-AT ?auto_1595876 ?auto_1595877 ) ( ON ?auto_1595876 ?auto_1595883 ) ( CLEAR ?auto_1595876 ) ( not ( = ?auto_1595875 ?auto_1595883 ) ) ( not ( = ?auto_1595876 ?auto_1595883 ) ) ( not ( = ?auto_1595874 ?auto_1595883 ) ) ( SURFACE-AT ?auto_1595874 ?auto_1595878 ) ( CLEAR ?auto_1595874 ) ( IS-CRATE ?auto_1595875 ) ( AVAILABLE ?auto_1595882 ) ( AVAILABLE ?auto_1595879 ) ( SURFACE-AT ?auto_1595875 ?auto_1595877 ) ( ON ?auto_1595875 ?auto_1595881 ) ( CLEAR ?auto_1595875 ) ( not ( = ?auto_1595875 ?auto_1595881 ) ) ( not ( = ?auto_1595876 ?auto_1595881 ) ) ( not ( = ?auto_1595874 ?auto_1595881 ) ) ( not ( = ?auto_1595883 ?auto_1595881 ) ) ( TRUCK-AT ?auto_1595880 ?auto_1595878 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1595875 ?auto_1595876 )
      ( MAKE-2CRATE-VERIFY ?auto_1595874 ?auto_1595875 ?auto_1595876 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1595902 - SURFACE
      ?auto_1595903 - SURFACE
      ?auto_1595904 - SURFACE
      ?auto_1595905 - SURFACE
    )
    :vars
    (
      ?auto_1595906 - HOIST
      ?auto_1595907 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595906 ?auto_1595907 ) ( SURFACE-AT ?auto_1595904 ?auto_1595907 ) ( CLEAR ?auto_1595904 ) ( LIFTING ?auto_1595906 ?auto_1595905 ) ( IS-CRATE ?auto_1595905 ) ( not ( = ?auto_1595904 ?auto_1595905 ) ) ( ON ?auto_1595903 ?auto_1595902 ) ( ON ?auto_1595904 ?auto_1595903 ) ( not ( = ?auto_1595902 ?auto_1595903 ) ) ( not ( = ?auto_1595902 ?auto_1595904 ) ) ( not ( = ?auto_1595902 ?auto_1595905 ) ) ( not ( = ?auto_1595903 ?auto_1595904 ) ) ( not ( = ?auto_1595903 ?auto_1595905 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1595904 ?auto_1595905 )
      ( MAKE-3CRATE-VERIFY ?auto_1595902 ?auto_1595903 ?auto_1595904 ?auto_1595905 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1595919 - SURFACE
      ?auto_1595920 - SURFACE
      ?auto_1595921 - SURFACE
      ?auto_1595922 - SURFACE
    )
    :vars
    (
      ?auto_1595924 - HOIST
      ?auto_1595923 - PLACE
      ?auto_1595925 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595924 ?auto_1595923 ) ( SURFACE-AT ?auto_1595921 ?auto_1595923 ) ( CLEAR ?auto_1595921 ) ( IS-CRATE ?auto_1595922 ) ( not ( = ?auto_1595921 ?auto_1595922 ) ) ( TRUCK-AT ?auto_1595925 ?auto_1595923 ) ( AVAILABLE ?auto_1595924 ) ( IN ?auto_1595922 ?auto_1595925 ) ( ON ?auto_1595921 ?auto_1595920 ) ( not ( = ?auto_1595920 ?auto_1595921 ) ) ( not ( = ?auto_1595920 ?auto_1595922 ) ) ( ON ?auto_1595920 ?auto_1595919 ) ( not ( = ?auto_1595919 ?auto_1595920 ) ) ( not ( = ?auto_1595919 ?auto_1595921 ) ) ( not ( = ?auto_1595919 ?auto_1595922 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1595920 ?auto_1595921 ?auto_1595922 )
      ( MAKE-3CRATE-VERIFY ?auto_1595919 ?auto_1595920 ?auto_1595921 ?auto_1595922 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1595940 - SURFACE
      ?auto_1595941 - SURFACE
      ?auto_1595942 - SURFACE
      ?auto_1595943 - SURFACE
    )
    :vars
    (
      ?auto_1595944 - HOIST
      ?auto_1595947 - PLACE
      ?auto_1595946 - TRUCK
      ?auto_1595945 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595944 ?auto_1595947 ) ( SURFACE-AT ?auto_1595942 ?auto_1595947 ) ( CLEAR ?auto_1595942 ) ( IS-CRATE ?auto_1595943 ) ( not ( = ?auto_1595942 ?auto_1595943 ) ) ( AVAILABLE ?auto_1595944 ) ( IN ?auto_1595943 ?auto_1595946 ) ( ON ?auto_1595942 ?auto_1595941 ) ( not ( = ?auto_1595941 ?auto_1595942 ) ) ( not ( = ?auto_1595941 ?auto_1595943 ) ) ( TRUCK-AT ?auto_1595946 ?auto_1595945 ) ( not ( = ?auto_1595945 ?auto_1595947 ) ) ( ON ?auto_1595941 ?auto_1595940 ) ( not ( = ?auto_1595940 ?auto_1595941 ) ) ( not ( = ?auto_1595940 ?auto_1595942 ) ) ( not ( = ?auto_1595940 ?auto_1595943 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1595941 ?auto_1595942 ?auto_1595943 )
      ( MAKE-3CRATE-VERIFY ?auto_1595940 ?auto_1595941 ?auto_1595942 ?auto_1595943 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1595964 - SURFACE
      ?auto_1595965 - SURFACE
      ?auto_1595966 - SURFACE
      ?auto_1595967 - SURFACE
    )
    :vars
    (
      ?auto_1595970 - HOIST
      ?auto_1595969 - PLACE
      ?auto_1595968 - TRUCK
      ?auto_1595972 - PLACE
      ?auto_1595971 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595970 ?auto_1595969 ) ( SURFACE-AT ?auto_1595966 ?auto_1595969 ) ( CLEAR ?auto_1595966 ) ( IS-CRATE ?auto_1595967 ) ( not ( = ?auto_1595966 ?auto_1595967 ) ) ( AVAILABLE ?auto_1595970 ) ( ON ?auto_1595966 ?auto_1595965 ) ( not ( = ?auto_1595965 ?auto_1595966 ) ) ( not ( = ?auto_1595965 ?auto_1595967 ) ) ( TRUCK-AT ?auto_1595968 ?auto_1595972 ) ( not ( = ?auto_1595972 ?auto_1595969 ) ) ( HOIST-AT ?auto_1595971 ?auto_1595972 ) ( LIFTING ?auto_1595971 ?auto_1595967 ) ( not ( = ?auto_1595970 ?auto_1595971 ) ) ( ON ?auto_1595965 ?auto_1595964 ) ( not ( = ?auto_1595964 ?auto_1595965 ) ) ( not ( = ?auto_1595964 ?auto_1595966 ) ) ( not ( = ?auto_1595964 ?auto_1595967 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1595965 ?auto_1595966 ?auto_1595967 )
      ( MAKE-3CRATE-VERIFY ?auto_1595964 ?auto_1595965 ?auto_1595966 ?auto_1595967 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1595991 - SURFACE
      ?auto_1595992 - SURFACE
      ?auto_1595993 - SURFACE
      ?auto_1595994 - SURFACE
    )
    :vars
    (
      ?auto_1595998 - HOIST
      ?auto_1595996 - PLACE
      ?auto_1596000 - TRUCK
      ?auto_1595999 - PLACE
      ?auto_1595997 - HOIST
      ?auto_1595995 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1595998 ?auto_1595996 ) ( SURFACE-AT ?auto_1595993 ?auto_1595996 ) ( CLEAR ?auto_1595993 ) ( IS-CRATE ?auto_1595994 ) ( not ( = ?auto_1595993 ?auto_1595994 ) ) ( AVAILABLE ?auto_1595998 ) ( ON ?auto_1595993 ?auto_1595992 ) ( not ( = ?auto_1595992 ?auto_1595993 ) ) ( not ( = ?auto_1595992 ?auto_1595994 ) ) ( TRUCK-AT ?auto_1596000 ?auto_1595999 ) ( not ( = ?auto_1595999 ?auto_1595996 ) ) ( HOIST-AT ?auto_1595997 ?auto_1595999 ) ( not ( = ?auto_1595998 ?auto_1595997 ) ) ( AVAILABLE ?auto_1595997 ) ( SURFACE-AT ?auto_1595994 ?auto_1595999 ) ( ON ?auto_1595994 ?auto_1595995 ) ( CLEAR ?auto_1595994 ) ( not ( = ?auto_1595993 ?auto_1595995 ) ) ( not ( = ?auto_1595994 ?auto_1595995 ) ) ( not ( = ?auto_1595992 ?auto_1595995 ) ) ( ON ?auto_1595992 ?auto_1595991 ) ( not ( = ?auto_1595991 ?auto_1595992 ) ) ( not ( = ?auto_1595991 ?auto_1595993 ) ) ( not ( = ?auto_1595991 ?auto_1595994 ) ) ( not ( = ?auto_1595991 ?auto_1595995 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1595992 ?auto_1595993 ?auto_1595994 )
      ( MAKE-3CRATE-VERIFY ?auto_1595991 ?auto_1595992 ?auto_1595993 ?auto_1595994 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1596019 - SURFACE
      ?auto_1596020 - SURFACE
      ?auto_1596021 - SURFACE
      ?auto_1596022 - SURFACE
    )
    :vars
    (
      ?auto_1596026 - HOIST
      ?auto_1596025 - PLACE
      ?auto_1596023 - PLACE
      ?auto_1596028 - HOIST
      ?auto_1596027 - SURFACE
      ?auto_1596024 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596026 ?auto_1596025 ) ( SURFACE-AT ?auto_1596021 ?auto_1596025 ) ( CLEAR ?auto_1596021 ) ( IS-CRATE ?auto_1596022 ) ( not ( = ?auto_1596021 ?auto_1596022 ) ) ( AVAILABLE ?auto_1596026 ) ( ON ?auto_1596021 ?auto_1596020 ) ( not ( = ?auto_1596020 ?auto_1596021 ) ) ( not ( = ?auto_1596020 ?auto_1596022 ) ) ( not ( = ?auto_1596023 ?auto_1596025 ) ) ( HOIST-AT ?auto_1596028 ?auto_1596023 ) ( not ( = ?auto_1596026 ?auto_1596028 ) ) ( AVAILABLE ?auto_1596028 ) ( SURFACE-AT ?auto_1596022 ?auto_1596023 ) ( ON ?auto_1596022 ?auto_1596027 ) ( CLEAR ?auto_1596022 ) ( not ( = ?auto_1596021 ?auto_1596027 ) ) ( not ( = ?auto_1596022 ?auto_1596027 ) ) ( not ( = ?auto_1596020 ?auto_1596027 ) ) ( TRUCK-AT ?auto_1596024 ?auto_1596025 ) ( ON ?auto_1596020 ?auto_1596019 ) ( not ( = ?auto_1596019 ?auto_1596020 ) ) ( not ( = ?auto_1596019 ?auto_1596021 ) ) ( not ( = ?auto_1596019 ?auto_1596022 ) ) ( not ( = ?auto_1596019 ?auto_1596027 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1596020 ?auto_1596021 ?auto_1596022 )
      ( MAKE-3CRATE-VERIFY ?auto_1596019 ?auto_1596020 ?auto_1596021 ?auto_1596022 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1596047 - SURFACE
      ?auto_1596048 - SURFACE
      ?auto_1596049 - SURFACE
      ?auto_1596050 - SURFACE
    )
    :vars
    (
      ?auto_1596051 - HOIST
      ?auto_1596056 - PLACE
      ?auto_1596052 - PLACE
      ?auto_1596054 - HOIST
      ?auto_1596055 - SURFACE
      ?auto_1596053 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596051 ?auto_1596056 ) ( IS-CRATE ?auto_1596050 ) ( not ( = ?auto_1596049 ?auto_1596050 ) ) ( not ( = ?auto_1596048 ?auto_1596049 ) ) ( not ( = ?auto_1596048 ?auto_1596050 ) ) ( not ( = ?auto_1596052 ?auto_1596056 ) ) ( HOIST-AT ?auto_1596054 ?auto_1596052 ) ( not ( = ?auto_1596051 ?auto_1596054 ) ) ( AVAILABLE ?auto_1596054 ) ( SURFACE-AT ?auto_1596050 ?auto_1596052 ) ( ON ?auto_1596050 ?auto_1596055 ) ( CLEAR ?auto_1596050 ) ( not ( = ?auto_1596049 ?auto_1596055 ) ) ( not ( = ?auto_1596050 ?auto_1596055 ) ) ( not ( = ?auto_1596048 ?auto_1596055 ) ) ( TRUCK-AT ?auto_1596053 ?auto_1596056 ) ( SURFACE-AT ?auto_1596048 ?auto_1596056 ) ( CLEAR ?auto_1596048 ) ( LIFTING ?auto_1596051 ?auto_1596049 ) ( IS-CRATE ?auto_1596049 ) ( ON ?auto_1596048 ?auto_1596047 ) ( not ( = ?auto_1596047 ?auto_1596048 ) ) ( not ( = ?auto_1596047 ?auto_1596049 ) ) ( not ( = ?auto_1596047 ?auto_1596050 ) ) ( not ( = ?auto_1596047 ?auto_1596055 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1596048 ?auto_1596049 ?auto_1596050 )
      ( MAKE-3CRATE-VERIFY ?auto_1596047 ?auto_1596048 ?auto_1596049 ?auto_1596050 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1596075 - SURFACE
      ?auto_1596076 - SURFACE
      ?auto_1596077 - SURFACE
      ?auto_1596078 - SURFACE
    )
    :vars
    (
      ?auto_1596079 - HOIST
      ?auto_1596080 - PLACE
      ?auto_1596081 - PLACE
      ?auto_1596083 - HOIST
      ?auto_1596084 - SURFACE
      ?auto_1596082 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596079 ?auto_1596080 ) ( IS-CRATE ?auto_1596078 ) ( not ( = ?auto_1596077 ?auto_1596078 ) ) ( not ( = ?auto_1596076 ?auto_1596077 ) ) ( not ( = ?auto_1596076 ?auto_1596078 ) ) ( not ( = ?auto_1596081 ?auto_1596080 ) ) ( HOIST-AT ?auto_1596083 ?auto_1596081 ) ( not ( = ?auto_1596079 ?auto_1596083 ) ) ( AVAILABLE ?auto_1596083 ) ( SURFACE-AT ?auto_1596078 ?auto_1596081 ) ( ON ?auto_1596078 ?auto_1596084 ) ( CLEAR ?auto_1596078 ) ( not ( = ?auto_1596077 ?auto_1596084 ) ) ( not ( = ?auto_1596078 ?auto_1596084 ) ) ( not ( = ?auto_1596076 ?auto_1596084 ) ) ( TRUCK-AT ?auto_1596082 ?auto_1596080 ) ( SURFACE-AT ?auto_1596076 ?auto_1596080 ) ( CLEAR ?auto_1596076 ) ( IS-CRATE ?auto_1596077 ) ( AVAILABLE ?auto_1596079 ) ( IN ?auto_1596077 ?auto_1596082 ) ( ON ?auto_1596076 ?auto_1596075 ) ( not ( = ?auto_1596075 ?auto_1596076 ) ) ( not ( = ?auto_1596075 ?auto_1596077 ) ) ( not ( = ?auto_1596075 ?auto_1596078 ) ) ( not ( = ?auto_1596075 ?auto_1596084 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1596076 ?auto_1596077 ?auto_1596078 )
      ( MAKE-3CRATE-VERIFY ?auto_1596075 ?auto_1596076 ?auto_1596077 ?auto_1596078 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1596103 - SURFACE
      ?auto_1596104 - SURFACE
      ?auto_1596105 - SURFACE
      ?auto_1596106 - SURFACE
    )
    :vars
    (
      ?auto_1596111 - HOIST
      ?auto_1596110 - PLACE
      ?auto_1596107 - PLACE
      ?auto_1596112 - HOIST
      ?auto_1596109 - SURFACE
      ?auto_1596108 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596111 ?auto_1596110 ) ( IS-CRATE ?auto_1596106 ) ( not ( = ?auto_1596105 ?auto_1596106 ) ) ( not ( = ?auto_1596104 ?auto_1596105 ) ) ( not ( = ?auto_1596104 ?auto_1596106 ) ) ( not ( = ?auto_1596107 ?auto_1596110 ) ) ( HOIST-AT ?auto_1596112 ?auto_1596107 ) ( not ( = ?auto_1596111 ?auto_1596112 ) ) ( AVAILABLE ?auto_1596112 ) ( SURFACE-AT ?auto_1596106 ?auto_1596107 ) ( ON ?auto_1596106 ?auto_1596109 ) ( CLEAR ?auto_1596106 ) ( not ( = ?auto_1596105 ?auto_1596109 ) ) ( not ( = ?auto_1596106 ?auto_1596109 ) ) ( not ( = ?auto_1596104 ?auto_1596109 ) ) ( SURFACE-AT ?auto_1596104 ?auto_1596110 ) ( CLEAR ?auto_1596104 ) ( IS-CRATE ?auto_1596105 ) ( AVAILABLE ?auto_1596111 ) ( IN ?auto_1596105 ?auto_1596108 ) ( TRUCK-AT ?auto_1596108 ?auto_1596107 ) ( ON ?auto_1596104 ?auto_1596103 ) ( not ( = ?auto_1596103 ?auto_1596104 ) ) ( not ( = ?auto_1596103 ?auto_1596105 ) ) ( not ( = ?auto_1596103 ?auto_1596106 ) ) ( not ( = ?auto_1596103 ?auto_1596109 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1596104 ?auto_1596105 ?auto_1596106 )
      ( MAKE-3CRATE-VERIFY ?auto_1596103 ?auto_1596104 ?auto_1596105 ?auto_1596106 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1596131 - SURFACE
      ?auto_1596132 - SURFACE
      ?auto_1596133 - SURFACE
      ?auto_1596134 - SURFACE
    )
    :vars
    (
      ?auto_1596135 - HOIST
      ?auto_1596137 - PLACE
      ?auto_1596140 - PLACE
      ?auto_1596136 - HOIST
      ?auto_1596139 - SURFACE
      ?auto_1596138 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596135 ?auto_1596137 ) ( IS-CRATE ?auto_1596134 ) ( not ( = ?auto_1596133 ?auto_1596134 ) ) ( not ( = ?auto_1596132 ?auto_1596133 ) ) ( not ( = ?auto_1596132 ?auto_1596134 ) ) ( not ( = ?auto_1596140 ?auto_1596137 ) ) ( HOIST-AT ?auto_1596136 ?auto_1596140 ) ( not ( = ?auto_1596135 ?auto_1596136 ) ) ( SURFACE-AT ?auto_1596134 ?auto_1596140 ) ( ON ?auto_1596134 ?auto_1596139 ) ( CLEAR ?auto_1596134 ) ( not ( = ?auto_1596133 ?auto_1596139 ) ) ( not ( = ?auto_1596134 ?auto_1596139 ) ) ( not ( = ?auto_1596132 ?auto_1596139 ) ) ( SURFACE-AT ?auto_1596132 ?auto_1596137 ) ( CLEAR ?auto_1596132 ) ( IS-CRATE ?auto_1596133 ) ( AVAILABLE ?auto_1596135 ) ( TRUCK-AT ?auto_1596138 ?auto_1596140 ) ( LIFTING ?auto_1596136 ?auto_1596133 ) ( ON ?auto_1596132 ?auto_1596131 ) ( not ( = ?auto_1596131 ?auto_1596132 ) ) ( not ( = ?auto_1596131 ?auto_1596133 ) ) ( not ( = ?auto_1596131 ?auto_1596134 ) ) ( not ( = ?auto_1596131 ?auto_1596139 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1596132 ?auto_1596133 ?auto_1596134 )
      ( MAKE-3CRATE-VERIFY ?auto_1596131 ?auto_1596132 ?auto_1596133 ?auto_1596134 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1596161 - SURFACE
      ?auto_1596162 - SURFACE
      ?auto_1596163 - SURFACE
      ?auto_1596164 - SURFACE
    )
    :vars
    (
      ?auto_1596170 - HOIST
      ?auto_1596169 - PLACE
      ?auto_1596166 - PLACE
      ?auto_1596171 - HOIST
      ?auto_1596167 - SURFACE
      ?auto_1596168 - TRUCK
      ?auto_1596165 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596170 ?auto_1596169 ) ( IS-CRATE ?auto_1596164 ) ( not ( = ?auto_1596163 ?auto_1596164 ) ) ( not ( = ?auto_1596162 ?auto_1596163 ) ) ( not ( = ?auto_1596162 ?auto_1596164 ) ) ( not ( = ?auto_1596166 ?auto_1596169 ) ) ( HOIST-AT ?auto_1596171 ?auto_1596166 ) ( not ( = ?auto_1596170 ?auto_1596171 ) ) ( SURFACE-AT ?auto_1596164 ?auto_1596166 ) ( ON ?auto_1596164 ?auto_1596167 ) ( CLEAR ?auto_1596164 ) ( not ( = ?auto_1596163 ?auto_1596167 ) ) ( not ( = ?auto_1596164 ?auto_1596167 ) ) ( not ( = ?auto_1596162 ?auto_1596167 ) ) ( SURFACE-AT ?auto_1596162 ?auto_1596169 ) ( CLEAR ?auto_1596162 ) ( IS-CRATE ?auto_1596163 ) ( AVAILABLE ?auto_1596170 ) ( TRUCK-AT ?auto_1596168 ?auto_1596166 ) ( AVAILABLE ?auto_1596171 ) ( SURFACE-AT ?auto_1596163 ?auto_1596166 ) ( ON ?auto_1596163 ?auto_1596165 ) ( CLEAR ?auto_1596163 ) ( not ( = ?auto_1596163 ?auto_1596165 ) ) ( not ( = ?auto_1596164 ?auto_1596165 ) ) ( not ( = ?auto_1596162 ?auto_1596165 ) ) ( not ( = ?auto_1596167 ?auto_1596165 ) ) ( ON ?auto_1596162 ?auto_1596161 ) ( not ( = ?auto_1596161 ?auto_1596162 ) ) ( not ( = ?auto_1596161 ?auto_1596163 ) ) ( not ( = ?auto_1596161 ?auto_1596164 ) ) ( not ( = ?auto_1596161 ?auto_1596167 ) ) ( not ( = ?auto_1596161 ?auto_1596165 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1596162 ?auto_1596163 ?auto_1596164 )
      ( MAKE-3CRATE-VERIFY ?auto_1596161 ?auto_1596162 ?auto_1596163 ?auto_1596164 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1596192 - SURFACE
      ?auto_1596193 - SURFACE
      ?auto_1596194 - SURFACE
      ?auto_1596195 - SURFACE
    )
    :vars
    (
      ?auto_1596201 - HOIST
      ?auto_1596196 - PLACE
      ?auto_1596202 - PLACE
      ?auto_1596197 - HOIST
      ?auto_1596199 - SURFACE
      ?auto_1596200 - SURFACE
      ?auto_1596198 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596201 ?auto_1596196 ) ( IS-CRATE ?auto_1596195 ) ( not ( = ?auto_1596194 ?auto_1596195 ) ) ( not ( = ?auto_1596193 ?auto_1596194 ) ) ( not ( = ?auto_1596193 ?auto_1596195 ) ) ( not ( = ?auto_1596202 ?auto_1596196 ) ) ( HOIST-AT ?auto_1596197 ?auto_1596202 ) ( not ( = ?auto_1596201 ?auto_1596197 ) ) ( SURFACE-AT ?auto_1596195 ?auto_1596202 ) ( ON ?auto_1596195 ?auto_1596199 ) ( CLEAR ?auto_1596195 ) ( not ( = ?auto_1596194 ?auto_1596199 ) ) ( not ( = ?auto_1596195 ?auto_1596199 ) ) ( not ( = ?auto_1596193 ?auto_1596199 ) ) ( SURFACE-AT ?auto_1596193 ?auto_1596196 ) ( CLEAR ?auto_1596193 ) ( IS-CRATE ?auto_1596194 ) ( AVAILABLE ?auto_1596201 ) ( AVAILABLE ?auto_1596197 ) ( SURFACE-AT ?auto_1596194 ?auto_1596202 ) ( ON ?auto_1596194 ?auto_1596200 ) ( CLEAR ?auto_1596194 ) ( not ( = ?auto_1596194 ?auto_1596200 ) ) ( not ( = ?auto_1596195 ?auto_1596200 ) ) ( not ( = ?auto_1596193 ?auto_1596200 ) ) ( not ( = ?auto_1596199 ?auto_1596200 ) ) ( TRUCK-AT ?auto_1596198 ?auto_1596196 ) ( ON ?auto_1596193 ?auto_1596192 ) ( not ( = ?auto_1596192 ?auto_1596193 ) ) ( not ( = ?auto_1596192 ?auto_1596194 ) ) ( not ( = ?auto_1596192 ?auto_1596195 ) ) ( not ( = ?auto_1596192 ?auto_1596199 ) ) ( not ( = ?auto_1596192 ?auto_1596200 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1596193 ?auto_1596194 ?auto_1596195 )
      ( MAKE-3CRATE-VERIFY ?auto_1596192 ?auto_1596193 ?auto_1596194 ?auto_1596195 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1596203 - SURFACE
      ?auto_1596204 - SURFACE
    )
    :vars
    (
      ?auto_1596211 - HOIST
      ?auto_1596205 - PLACE
      ?auto_1596209 - SURFACE
      ?auto_1596212 - PLACE
      ?auto_1596206 - HOIST
      ?auto_1596208 - SURFACE
      ?auto_1596210 - SURFACE
      ?auto_1596207 - TRUCK
      ?auto_1596213 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596211 ?auto_1596205 ) ( IS-CRATE ?auto_1596204 ) ( not ( = ?auto_1596203 ?auto_1596204 ) ) ( not ( = ?auto_1596209 ?auto_1596203 ) ) ( not ( = ?auto_1596209 ?auto_1596204 ) ) ( not ( = ?auto_1596212 ?auto_1596205 ) ) ( HOIST-AT ?auto_1596206 ?auto_1596212 ) ( not ( = ?auto_1596211 ?auto_1596206 ) ) ( SURFACE-AT ?auto_1596204 ?auto_1596212 ) ( ON ?auto_1596204 ?auto_1596208 ) ( CLEAR ?auto_1596204 ) ( not ( = ?auto_1596203 ?auto_1596208 ) ) ( not ( = ?auto_1596204 ?auto_1596208 ) ) ( not ( = ?auto_1596209 ?auto_1596208 ) ) ( IS-CRATE ?auto_1596203 ) ( AVAILABLE ?auto_1596206 ) ( SURFACE-AT ?auto_1596203 ?auto_1596212 ) ( ON ?auto_1596203 ?auto_1596210 ) ( CLEAR ?auto_1596203 ) ( not ( = ?auto_1596203 ?auto_1596210 ) ) ( not ( = ?auto_1596204 ?auto_1596210 ) ) ( not ( = ?auto_1596209 ?auto_1596210 ) ) ( not ( = ?auto_1596208 ?auto_1596210 ) ) ( TRUCK-AT ?auto_1596207 ?auto_1596205 ) ( SURFACE-AT ?auto_1596213 ?auto_1596205 ) ( CLEAR ?auto_1596213 ) ( LIFTING ?auto_1596211 ?auto_1596209 ) ( IS-CRATE ?auto_1596209 ) ( not ( = ?auto_1596213 ?auto_1596209 ) ) ( not ( = ?auto_1596203 ?auto_1596213 ) ) ( not ( = ?auto_1596204 ?auto_1596213 ) ) ( not ( = ?auto_1596208 ?auto_1596213 ) ) ( not ( = ?auto_1596210 ?auto_1596213 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1596213 ?auto_1596209 )
      ( MAKE-2CRATE ?auto_1596209 ?auto_1596203 ?auto_1596204 )
      ( MAKE-1CRATE-VERIFY ?auto_1596203 ?auto_1596204 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1596214 - SURFACE
      ?auto_1596215 - SURFACE
      ?auto_1596216 - SURFACE
    )
    :vars
    (
      ?auto_1596217 - HOIST
      ?auto_1596223 - PLACE
      ?auto_1596222 - PLACE
      ?auto_1596218 - HOIST
      ?auto_1596224 - SURFACE
      ?auto_1596221 - SURFACE
      ?auto_1596220 - TRUCK
      ?auto_1596219 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596217 ?auto_1596223 ) ( IS-CRATE ?auto_1596216 ) ( not ( = ?auto_1596215 ?auto_1596216 ) ) ( not ( = ?auto_1596214 ?auto_1596215 ) ) ( not ( = ?auto_1596214 ?auto_1596216 ) ) ( not ( = ?auto_1596222 ?auto_1596223 ) ) ( HOIST-AT ?auto_1596218 ?auto_1596222 ) ( not ( = ?auto_1596217 ?auto_1596218 ) ) ( SURFACE-AT ?auto_1596216 ?auto_1596222 ) ( ON ?auto_1596216 ?auto_1596224 ) ( CLEAR ?auto_1596216 ) ( not ( = ?auto_1596215 ?auto_1596224 ) ) ( not ( = ?auto_1596216 ?auto_1596224 ) ) ( not ( = ?auto_1596214 ?auto_1596224 ) ) ( IS-CRATE ?auto_1596215 ) ( AVAILABLE ?auto_1596218 ) ( SURFACE-AT ?auto_1596215 ?auto_1596222 ) ( ON ?auto_1596215 ?auto_1596221 ) ( CLEAR ?auto_1596215 ) ( not ( = ?auto_1596215 ?auto_1596221 ) ) ( not ( = ?auto_1596216 ?auto_1596221 ) ) ( not ( = ?auto_1596214 ?auto_1596221 ) ) ( not ( = ?auto_1596224 ?auto_1596221 ) ) ( TRUCK-AT ?auto_1596220 ?auto_1596223 ) ( SURFACE-AT ?auto_1596219 ?auto_1596223 ) ( CLEAR ?auto_1596219 ) ( LIFTING ?auto_1596217 ?auto_1596214 ) ( IS-CRATE ?auto_1596214 ) ( not ( = ?auto_1596219 ?auto_1596214 ) ) ( not ( = ?auto_1596215 ?auto_1596219 ) ) ( not ( = ?auto_1596216 ?auto_1596219 ) ) ( not ( = ?auto_1596224 ?auto_1596219 ) ) ( not ( = ?auto_1596221 ?auto_1596219 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1596215 ?auto_1596216 )
      ( MAKE-2CRATE-VERIFY ?auto_1596214 ?auto_1596215 ?auto_1596216 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1596225 - SURFACE
      ?auto_1596226 - SURFACE
      ?auto_1596227 - SURFACE
      ?auto_1596228 - SURFACE
    )
    :vars
    (
      ?auto_1596235 - HOIST
      ?auto_1596230 - PLACE
      ?auto_1596233 - PLACE
      ?auto_1596231 - HOIST
      ?auto_1596229 - SURFACE
      ?auto_1596234 - SURFACE
      ?auto_1596232 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596235 ?auto_1596230 ) ( IS-CRATE ?auto_1596228 ) ( not ( = ?auto_1596227 ?auto_1596228 ) ) ( not ( = ?auto_1596226 ?auto_1596227 ) ) ( not ( = ?auto_1596226 ?auto_1596228 ) ) ( not ( = ?auto_1596233 ?auto_1596230 ) ) ( HOIST-AT ?auto_1596231 ?auto_1596233 ) ( not ( = ?auto_1596235 ?auto_1596231 ) ) ( SURFACE-AT ?auto_1596228 ?auto_1596233 ) ( ON ?auto_1596228 ?auto_1596229 ) ( CLEAR ?auto_1596228 ) ( not ( = ?auto_1596227 ?auto_1596229 ) ) ( not ( = ?auto_1596228 ?auto_1596229 ) ) ( not ( = ?auto_1596226 ?auto_1596229 ) ) ( IS-CRATE ?auto_1596227 ) ( AVAILABLE ?auto_1596231 ) ( SURFACE-AT ?auto_1596227 ?auto_1596233 ) ( ON ?auto_1596227 ?auto_1596234 ) ( CLEAR ?auto_1596227 ) ( not ( = ?auto_1596227 ?auto_1596234 ) ) ( not ( = ?auto_1596228 ?auto_1596234 ) ) ( not ( = ?auto_1596226 ?auto_1596234 ) ) ( not ( = ?auto_1596229 ?auto_1596234 ) ) ( TRUCK-AT ?auto_1596232 ?auto_1596230 ) ( SURFACE-AT ?auto_1596225 ?auto_1596230 ) ( CLEAR ?auto_1596225 ) ( LIFTING ?auto_1596235 ?auto_1596226 ) ( IS-CRATE ?auto_1596226 ) ( not ( = ?auto_1596225 ?auto_1596226 ) ) ( not ( = ?auto_1596227 ?auto_1596225 ) ) ( not ( = ?auto_1596228 ?auto_1596225 ) ) ( not ( = ?auto_1596229 ?auto_1596225 ) ) ( not ( = ?auto_1596234 ?auto_1596225 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1596226 ?auto_1596227 ?auto_1596228 )
      ( MAKE-3CRATE-VERIFY ?auto_1596225 ?auto_1596226 ?auto_1596227 ?auto_1596228 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1596284 - SURFACE
      ?auto_1596285 - SURFACE
    )
    :vars
    (
      ?auto_1596287 - HOIST
      ?auto_1596290 - PLACE
      ?auto_1596291 - SURFACE
      ?auto_1596292 - PLACE
      ?auto_1596286 - HOIST
      ?auto_1596293 - SURFACE
      ?auto_1596289 - TRUCK
      ?auto_1596288 - SURFACE
      ?auto_1596294 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596287 ?auto_1596290 ) ( IS-CRATE ?auto_1596285 ) ( not ( = ?auto_1596284 ?auto_1596285 ) ) ( not ( = ?auto_1596291 ?auto_1596284 ) ) ( not ( = ?auto_1596291 ?auto_1596285 ) ) ( not ( = ?auto_1596292 ?auto_1596290 ) ) ( HOIST-AT ?auto_1596286 ?auto_1596292 ) ( not ( = ?auto_1596287 ?auto_1596286 ) ) ( SURFACE-AT ?auto_1596285 ?auto_1596292 ) ( ON ?auto_1596285 ?auto_1596293 ) ( CLEAR ?auto_1596285 ) ( not ( = ?auto_1596284 ?auto_1596293 ) ) ( not ( = ?auto_1596285 ?auto_1596293 ) ) ( not ( = ?auto_1596291 ?auto_1596293 ) ) ( SURFACE-AT ?auto_1596291 ?auto_1596290 ) ( CLEAR ?auto_1596291 ) ( IS-CRATE ?auto_1596284 ) ( AVAILABLE ?auto_1596287 ) ( TRUCK-AT ?auto_1596289 ?auto_1596292 ) ( SURFACE-AT ?auto_1596284 ?auto_1596292 ) ( ON ?auto_1596284 ?auto_1596288 ) ( CLEAR ?auto_1596284 ) ( not ( = ?auto_1596284 ?auto_1596288 ) ) ( not ( = ?auto_1596285 ?auto_1596288 ) ) ( not ( = ?auto_1596291 ?auto_1596288 ) ) ( not ( = ?auto_1596293 ?auto_1596288 ) ) ( LIFTING ?auto_1596286 ?auto_1596294 ) ( IS-CRATE ?auto_1596294 ) ( not ( = ?auto_1596284 ?auto_1596294 ) ) ( not ( = ?auto_1596285 ?auto_1596294 ) ) ( not ( = ?auto_1596291 ?auto_1596294 ) ) ( not ( = ?auto_1596293 ?auto_1596294 ) ) ( not ( = ?auto_1596288 ?auto_1596294 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1596286 ?auto_1596294 ?auto_1596289 ?auto_1596292 )
      ( MAKE-1CRATE ?auto_1596284 ?auto_1596285 )
      ( MAKE-1CRATE-VERIFY ?auto_1596284 ?auto_1596285 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1596394 - SURFACE
      ?auto_1596395 - SURFACE
      ?auto_1596396 - SURFACE
      ?auto_1596398 - SURFACE
      ?auto_1596397 - SURFACE
    )
    :vars
    (
      ?auto_1596400 - HOIST
      ?auto_1596399 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596400 ?auto_1596399 ) ( SURFACE-AT ?auto_1596398 ?auto_1596399 ) ( CLEAR ?auto_1596398 ) ( LIFTING ?auto_1596400 ?auto_1596397 ) ( IS-CRATE ?auto_1596397 ) ( not ( = ?auto_1596398 ?auto_1596397 ) ) ( ON ?auto_1596395 ?auto_1596394 ) ( ON ?auto_1596396 ?auto_1596395 ) ( ON ?auto_1596398 ?auto_1596396 ) ( not ( = ?auto_1596394 ?auto_1596395 ) ) ( not ( = ?auto_1596394 ?auto_1596396 ) ) ( not ( = ?auto_1596394 ?auto_1596398 ) ) ( not ( = ?auto_1596394 ?auto_1596397 ) ) ( not ( = ?auto_1596395 ?auto_1596396 ) ) ( not ( = ?auto_1596395 ?auto_1596398 ) ) ( not ( = ?auto_1596395 ?auto_1596397 ) ) ( not ( = ?auto_1596396 ?auto_1596398 ) ) ( not ( = ?auto_1596396 ?auto_1596397 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1596398 ?auto_1596397 )
      ( MAKE-4CRATE-VERIFY ?auto_1596394 ?auto_1596395 ?auto_1596396 ?auto_1596398 ?auto_1596397 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1596419 - SURFACE
      ?auto_1596420 - SURFACE
      ?auto_1596421 - SURFACE
      ?auto_1596423 - SURFACE
      ?auto_1596422 - SURFACE
    )
    :vars
    (
      ?auto_1596426 - HOIST
      ?auto_1596424 - PLACE
      ?auto_1596425 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596426 ?auto_1596424 ) ( SURFACE-AT ?auto_1596423 ?auto_1596424 ) ( CLEAR ?auto_1596423 ) ( IS-CRATE ?auto_1596422 ) ( not ( = ?auto_1596423 ?auto_1596422 ) ) ( TRUCK-AT ?auto_1596425 ?auto_1596424 ) ( AVAILABLE ?auto_1596426 ) ( IN ?auto_1596422 ?auto_1596425 ) ( ON ?auto_1596423 ?auto_1596421 ) ( not ( = ?auto_1596421 ?auto_1596423 ) ) ( not ( = ?auto_1596421 ?auto_1596422 ) ) ( ON ?auto_1596420 ?auto_1596419 ) ( ON ?auto_1596421 ?auto_1596420 ) ( not ( = ?auto_1596419 ?auto_1596420 ) ) ( not ( = ?auto_1596419 ?auto_1596421 ) ) ( not ( = ?auto_1596419 ?auto_1596423 ) ) ( not ( = ?auto_1596419 ?auto_1596422 ) ) ( not ( = ?auto_1596420 ?auto_1596421 ) ) ( not ( = ?auto_1596420 ?auto_1596423 ) ) ( not ( = ?auto_1596420 ?auto_1596422 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1596421 ?auto_1596423 ?auto_1596422 )
      ( MAKE-4CRATE-VERIFY ?auto_1596419 ?auto_1596420 ?auto_1596421 ?auto_1596423 ?auto_1596422 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1596449 - SURFACE
      ?auto_1596450 - SURFACE
      ?auto_1596451 - SURFACE
      ?auto_1596453 - SURFACE
      ?auto_1596452 - SURFACE
    )
    :vars
    (
      ?auto_1596457 - HOIST
      ?auto_1596455 - PLACE
      ?auto_1596454 - TRUCK
      ?auto_1596456 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596457 ?auto_1596455 ) ( SURFACE-AT ?auto_1596453 ?auto_1596455 ) ( CLEAR ?auto_1596453 ) ( IS-CRATE ?auto_1596452 ) ( not ( = ?auto_1596453 ?auto_1596452 ) ) ( AVAILABLE ?auto_1596457 ) ( IN ?auto_1596452 ?auto_1596454 ) ( ON ?auto_1596453 ?auto_1596451 ) ( not ( = ?auto_1596451 ?auto_1596453 ) ) ( not ( = ?auto_1596451 ?auto_1596452 ) ) ( TRUCK-AT ?auto_1596454 ?auto_1596456 ) ( not ( = ?auto_1596456 ?auto_1596455 ) ) ( ON ?auto_1596450 ?auto_1596449 ) ( ON ?auto_1596451 ?auto_1596450 ) ( not ( = ?auto_1596449 ?auto_1596450 ) ) ( not ( = ?auto_1596449 ?auto_1596451 ) ) ( not ( = ?auto_1596449 ?auto_1596453 ) ) ( not ( = ?auto_1596449 ?auto_1596452 ) ) ( not ( = ?auto_1596450 ?auto_1596451 ) ) ( not ( = ?auto_1596450 ?auto_1596453 ) ) ( not ( = ?auto_1596450 ?auto_1596452 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1596451 ?auto_1596453 ?auto_1596452 )
      ( MAKE-4CRATE-VERIFY ?auto_1596449 ?auto_1596450 ?auto_1596451 ?auto_1596453 ?auto_1596452 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1596483 - SURFACE
      ?auto_1596484 - SURFACE
      ?auto_1596485 - SURFACE
      ?auto_1596487 - SURFACE
      ?auto_1596486 - SURFACE
    )
    :vars
    (
      ?auto_1596490 - HOIST
      ?auto_1596488 - PLACE
      ?auto_1596492 - TRUCK
      ?auto_1596491 - PLACE
      ?auto_1596489 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596490 ?auto_1596488 ) ( SURFACE-AT ?auto_1596487 ?auto_1596488 ) ( CLEAR ?auto_1596487 ) ( IS-CRATE ?auto_1596486 ) ( not ( = ?auto_1596487 ?auto_1596486 ) ) ( AVAILABLE ?auto_1596490 ) ( ON ?auto_1596487 ?auto_1596485 ) ( not ( = ?auto_1596485 ?auto_1596487 ) ) ( not ( = ?auto_1596485 ?auto_1596486 ) ) ( TRUCK-AT ?auto_1596492 ?auto_1596491 ) ( not ( = ?auto_1596491 ?auto_1596488 ) ) ( HOIST-AT ?auto_1596489 ?auto_1596491 ) ( LIFTING ?auto_1596489 ?auto_1596486 ) ( not ( = ?auto_1596490 ?auto_1596489 ) ) ( ON ?auto_1596484 ?auto_1596483 ) ( ON ?auto_1596485 ?auto_1596484 ) ( not ( = ?auto_1596483 ?auto_1596484 ) ) ( not ( = ?auto_1596483 ?auto_1596485 ) ) ( not ( = ?auto_1596483 ?auto_1596487 ) ) ( not ( = ?auto_1596483 ?auto_1596486 ) ) ( not ( = ?auto_1596484 ?auto_1596485 ) ) ( not ( = ?auto_1596484 ?auto_1596487 ) ) ( not ( = ?auto_1596484 ?auto_1596486 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1596485 ?auto_1596487 ?auto_1596486 )
      ( MAKE-4CRATE-VERIFY ?auto_1596483 ?auto_1596484 ?auto_1596485 ?auto_1596487 ?auto_1596486 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1596521 - SURFACE
      ?auto_1596522 - SURFACE
      ?auto_1596523 - SURFACE
      ?auto_1596525 - SURFACE
      ?auto_1596524 - SURFACE
    )
    :vars
    (
      ?auto_1596531 - HOIST
      ?auto_1596526 - PLACE
      ?auto_1596528 - TRUCK
      ?auto_1596529 - PLACE
      ?auto_1596530 - HOIST
      ?auto_1596527 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596531 ?auto_1596526 ) ( SURFACE-AT ?auto_1596525 ?auto_1596526 ) ( CLEAR ?auto_1596525 ) ( IS-CRATE ?auto_1596524 ) ( not ( = ?auto_1596525 ?auto_1596524 ) ) ( AVAILABLE ?auto_1596531 ) ( ON ?auto_1596525 ?auto_1596523 ) ( not ( = ?auto_1596523 ?auto_1596525 ) ) ( not ( = ?auto_1596523 ?auto_1596524 ) ) ( TRUCK-AT ?auto_1596528 ?auto_1596529 ) ( not ( = ?auto_1596529 ?auto_1596526 ) ) ( HOIST-AT ?auto_1596530 ?auto_1596529 ) ( not ( = ?auto_1596531 ?auto_1596530 ) ) ( AVAILABLE ?auto_1596530 ) ( SURFACE-AT ?auto_1596524 ?auto_1596529 ) ( ON ?auto_1596524 ?auto_1596527 ) ( CLEAR ?auto_1596524 ) ( not ( = ?auto_1596525 ?auto_1596527 ) ) ( not ( = ?auto_1596524 ?auto_1596527 ) ) ( not ( = ?auto_1596523 ?auto_1596527 ) ) ( ON ?auto_1596522 ?auto_1596521 ) ( ON ?auto_1596523 ?auto_1596522 ) ( not ( = ?auto_1596521 ?auto_1596522 ) ) ( not ( = ?auto_1596521 ?auto_1596523 ) ) ( not ( = ?auto_1596521 ?auto_1596525 ) ) ( not ( = ?auto_1596521 ?auto_1596524 ) ) ( not ( = ?auto_1596521 ?auto_1596527 ) ) ( not ( = ?auto_1596522 ?auto_1596523 ) ) ( not ( = ?auto_1596522 ?auto_1596525 ) ) ( not ( = ?auto_1596522 ?auto_1596524 ) ) ( not ( = ?auto_1596522 ?auto_1596527 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1596523 ?auto_1596525 ?auto_1596524 )
      ( MAKE-4CRATE-VERIFY ?auto_1596521 ?auto_1596522 ?auto_1596523 ?auto_1596525 ?auto_1596524 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1596560 - SURFACE
      ?auto_1596561 - SURFACE
      ?auto_1596562 - SURFACE
      ?auto_1596564 - SURFACE
      ?auto_1596563 - SURFACE
    )
    :vars
    (
      ?auto_1596565 - HOIST
      ?auto_1596568 - PLACE
      ?auto_1596566 - PLACE
      ?auto_1596567 - HOIST
      ?auto_1596569 - SURFACE
      ?auto_1596570 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596565 ?auto_1596568 ) ( SURFACE-AT ?auto_1596564 ?auto_1596568 ) ( CLEAR ?auto_1596564 ) ( IS-CRATE ?auto_1596563 ) ( not ( = ?auto_1596564 ?auto_1596563 ) ) ( AVAILABLE ?auto_1596565 ) ( ON ?auto_1596564 ?auto_1596562 ) ( not ( = ?auto_1596562 ?auto_1596564 ) ) ( not ( = ?auto_1596562 ?auto_1596563 ) ) ( not ( = ?auto_1596566 ?auto_1596568 ) ) ( HOIST-AT ?auto_1596567 ?auto_1596566 ) ( not ( = ?auto_1596565 ?auto_1596567 ) ) ( AVAILABLE ?auto_1596567 ) ( SURFACE-AT ?auto_1596563 ?auto_1596566 ) ( ON ?auto_1596563 ?auto_1596569 ) ( CLEAR ?auto_1596563 ) ( not ( = ?auto_1596564 ?auto_1596569 ) ) ( not ( = ?auto_1596563 ?auto_1596569 ) ) ( not ( = ?auto_1596562 ?auto_1596569 ) ) ( TRUCK-AT ?auto_1596570 ?auto_1596568 ) ( ON ?auto_1596561 ?auto_1596560 ) ( ON ?auto_1596562 ?auto_1596561 ) ( not ( = ?auto_1596560 ?auto_1596561 ) ) ( not ( = ?auto_1596560 ?auto_1596562 ) ) ( not ( = ?auto_1596560 ?auto_1596564 ) ) ( not ( = ?auto_1596560 ?auto_1596563 ) ) ( not ( = ?auto_1596560 ?auto_1596569 ) ) ( not ( = ?auto_1596561 ?auto_1596562 ) ) ( not ( = ?auto_1596561 ?auto_1596564 ) ) ( not ( = ?auto_1596561 ?auto_1596563 ) ) ( not ( = ?auto_1596561 ?auto_1596569 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1596562 ?auto_1596564 ?auto_1596563 )
      ( MAKE-4CRATE-VERIFY ?auto_1596560 ?auto_1596561 ?auto_1596562 ?auto_1596564 ?auto_1596563 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1596599 - SURFACE
      ?auto_1596600 - SURFACE
      ?auto_1596601 - SURFACE
      ?auto_1596603 - SURFACE
      ?auto_1596602 - SURFACE
    )
    :vars
    (
      ?auto_1596604 - HOIST
      ?auto_1596607 - PLACE
      ?auto_1596609 - PLACE
      ?auto_1596606 - HOIST
      ?auto_1596605 - SURFACE
      ?auto_1596608 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596604 ?auto_1596607 ) ( IS-CRATE ?auto_1596602 ) ( not ( = ?auto_1596603 ?auto_1596602 ) ) ( not ( = ?auto_1596601 ?auto_1596603 ) ) ( not ( = ?auto_1596601 ?auto_1596602 ) ) ( not ( = ?auto_1596609 ?auto_1596607 ) ) ( HOIST-AT ?auto_1596606 ?auto_1596609 ) ( not ( = ?auto_1596604 ?auto_1596606 ) ) ( AVAILABLE ?auto_1596606 ) ( SURFACE-AT ?auto_1596602 ?auto_1596609 ) ( ON ?auto_1596602 ?auto_1596605 ) ( CLEAR ?auto_1596602 ) ( not ( = ?auto_1596603 ?auto_1596605 ) ) ( not ( = ?auto_1596602 ?auto_1596605 ) ) ( not ( = ?auto_1596601 ?auto_1596605 ) ) ( TRUCK-AT ?auto_1596608 ?auto_1596607 ) ( SURFACE-AT ?auto_1596601 ?auto_1596607 ) ( CLEAR ?auto_1596601 ) ( LIFTING ?auto_1596604 ?auto_1596603 ) ( IS-CRATE ?auto_1596603 ) ( ON ?auto_1596600 ?auto_1596599 ) ( ON ?auto_1596601 ?auto_1596600 ) ( not ( = ?auto_1596599 ?auto_1596600 ) ) ( not ( = ?auto_1596599 ?auto_1596601 ) ) ( not ( = ?auto_1596599 ?auto_1596603 ) ) ( not ( = ?auto_1596599 ?auto_1596602 ) ) ( not ( = ?auto_1596599 ?auto_1596605 ) ) ( not ( = ?auto_1596600 ?auto_1596601 ) ) ( not ( = ?auto_1596600 ?auto_1596603 ) ) ( not ( = ?auto_1596600 ?auto_1596602 ) ) ( not ( = ?auto_1596600 ?auto_1596605 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1596601 ?auto_1596603 ?auto_1596602 )
      ( MAKE-4CRATE-VERIFY ?auto_1596599 ?auto_1596600 ?auto_1596601 ?auto_1596603 ?auto_1596602 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1596638 - SURFACE
      ?auto_1596639 - SURFACE
      ?auto_1596640 - SURFACE
      ?auto_1596642 - SURFACE
      ?auto_1596641 - SURFACE
    )
    :vars
    (
      ?auto_1596646 - HOIST
      ?auto_1596643 - PLACE
      ?auto_1596648 - PLACE
      ?auto_1596647 - HOIST
      ?auto_1596645 - SURFACE
      ?auto_1596644 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596646 ?auto_1596643 ) ( IS-CRATE ?auto_1596641 ) ( not ( = ?auto_1596642 ?auto_1596641 ) ) ( not ( = ?auto_1596640 ?auto_1596642 ) ) ( not ( = ?auto_1596640 ?auto_1596641 ) ) ( not ( = ?auto_1596648 ?auto_1596643 ) ) ( HOIST-AT ?auto_1596647 ?auto_1596648 ) ( not ( = ?auto_1596646 ?auto_1596647 ) ) ( AVAILABLE ?auto_1596647 ) ( SURFACE-AT ?auto_1596641 ?auto_1596648 ) ( ON ?auto_1596641 ?auto_1596645 ) ( CLEAR ?auto_1596641 ) ( not ( = ?auto_1596642 ?auto_1596645 ) ) ( not ( = ?auto_1596641 ?auto_1596645 ) ) ( not ( = ?auto_1596640 ?auto_1596645 ) ) ( TRUCK-AT ?auto_1596644 ?auto_1596643 ) ( SURFACE-AT ?auto_1596640 ?auto_1596643 ) ( CLEAR ?auto_1596640 ) ( IS-CRATE ?auto_1596642 ) ( AVAILABLE ?auto_1596646 ) ( IN ?auto_1596642 ?auto_1596644 ) ( ON ?auto_1596639 ?auto_1596638 ) ( ON ?auto_1596640 ?auto_1596639 ) ( not ( = ?auto_1596638 ?auto_1596639 ) ) ( not ( = ?auto_1596638 ?auto_1596640 ) ) ( not ( = ?auto_1596638 ?auto_1596642 ) ) ( not ( = ?auto_1596638 ?auto_1596641 ) ) ( not ( = ?auto_1596638 ?auto_1596645 ) ) ( not ( = ?auto_1596639 ?auto_1596640 ) ) ( not ( = ?auto_1596639 ?auto_1596642 ) ) ( not ( = ?auto_1596639 ?auto_1596641 ) ) ( not ( = ?auto_1596639 ?auto_1596645 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1596640 ?auto_1596642 ?auto_1596641 )
      ( MAKE-4CRATE-VERIFY ?auto_1596638 ?auto_1596639 ?auto_1596640 ?auto_1596642 ?auto_1596641 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1596754 - SURFACE
      ?auto_1596755 - SURFACE
    )
    :vars
    (
      ?auto_1596762 - HOIST
      ?auto_1596757 - PLACE
      ?auto_1596756 - SURFACE
      ?auto_1596758 - PLACE
      ?auto_1596761 - HOIST
      ?auto_1596760 - SURFACE
      ?auto_1596759 - TRUCK
      ?auto_1596763 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596762 ?auto_1596757 ) ( SURFACE-AT ?auto_1596754 ?auto_1596757 ) ( CLEAR ?auto_1596754 ) ( IS-CRATE ?auto_1596755 ) ( not ( = ?auto_1596754 ?auto_1596755 ) ) ( AVAILABLE ?auto_1596762 ) ( ON ?auto_1596754 ?auto_1596756 ) ( not ( = ?auto_1596756 ?auto_1596754 ) ) ( not ( = ?auto_1596756 ?auto_1596755 ) ) ( not ( = ?auto_1596758 ?auto_1596757 ) ) ( HOIST-AT ?auto_1596761 ?auto_1596758 ) ( not ( = ?auto_1596762 ?auto_1596761 ) ) ( AVAILABLE ?auto_1596761 ) ( SURFACE-AT ?auto_1596755 ?auto_1596758 ) ( ON ?auto_1596755 ?auto_1596760 ) ( CLEAR ?auto_1596755 ) ( not ( = ?auto_1596754 ?auto_1596760 ) ) ( not ( = ?auto_1596755 ?auto_1596760 ) ) ( not ( = ?auto_1596756 ?auto_1596760 ) ) ( TRUCK-AT ?auto_1596759 ?auto_1596763 ) ( not ( = ?auto_1596763 ?auto_1596757 ) ) ( not ( = ?auto_1596758 ?auto_1596763 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1596759 ?auto_1596763 ?auto_1596757 )
      ( MAKE-1CRATE ?auto_1596754 ?auto_1596755 )
      ( MAKE-1CRATE-VERIFY ?auto_1596754 ?auto_1596755 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1596911 - SURFACE
      ?auto_1596912 - SURFACE
    )
    :vars
    (
      ?auto_1596914 - HOIST
      ?auto_1596916 - PLACE
      ?auto_1596915 - SURFACE
      ?auto_1596917 - PLACE
      ?auto_1596913 - HOIST
      ?auto_1596919 - SURFACE
      ?auto_1596918 - TRUCK
      ?auto_1596920 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596914 ?auto_1596916 ) ( SURFACE-AT ?auto_1596911 ?auto_1596916 ) ( CLEAR ?auto_1596911 ) ( IS-CRATE ?auto_1596912 ) ( not ( = ?auto_1596911 ?auto_1596912 ) ) ( ON ?auto_1596911 ?auto_1596915 ) ( not ( = ?auto_1596915 ?auto_1596911 ) ) ( not ( = ?auto_1596915 ?auto_1596912 ) ) ( not ( = ?auto_1596917 ?auto_1596916 ) ) ( HOIST-AT ?auto_1596913 ?auto_1596917 ) ( not ( = ?auto_1596914 ?auto_1596913 ) ) ( AVAILABLE ?auto_1596913 ) ( SURFACE-AT ?auto_1596912 ?auto_1596917 ) ( ON ?auto_1596912 ?auto_1596919 ) ( CLEAR ?auto_1596912 ) ( not ( = ?auto_1596911 ?auto_1596919 ) ) ( not ( = ?auto_1596912 ?auto_1596919 ) ) ( not ( = ?auto_1596915 ?auto_1596919 ) ) ( TRUCK-AT ?auto_1596918 ?auto_1596916 ) ( LIFTING ?auto_1596914 ?auto_1596920 ) ( IS-CRATE ?auto_1596920 ) ( not ( = ?auto_1596911 ?auto_1596920 ) ) ( not ( = ?auto_1596912 ?auto_1596920 ) ) ( not ( = ?auto_1596915 ?auto_1596920 ) ) ( not ( = ?auto_1596919 ?auto_1596920 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1596914 ?auto_1596920 ?auto_1596918 ?auto_1596916 )
      ( MAKE-1CRATE ?auto_1596911 ?auto_1596912 )
      ( MAKE-1CRATE-VERIFY ?auto_1596911 ?auto_1596912 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1597289 - SURFACE
      ?auto_1597290 - SURFACE
      ?auto_1597291 - SURFACE
      ?auto_1597293 - SURFACE
      ?auto_1597292 - SURFACE
      ?auto_1597294 - SURFACE
    )
    :vars
    (
      ?auto_1597295 - HOIST
      ?auto_1597296 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597295 ?auto_1597296 ) ( SURFACE-AT ?auto_1597292 ?auto_1597296 ) ( CLEAR ?auto_1597292 ) ( LIFTING ?auto_1597295 ?auto_1597294 ) ( IS-CRATE ?auto_1597294 ) ( not ( = ?auto_1597292 ?auto_1597294 ) ) ( ON ?auto_1597290 ?auto_1597289 ) ( ON ?auto_1597291 ?auto_1597290 ) ( ON ?auto_1597293 ?auto_1597291 ) ( ON ?auto_1597292 ?auto_1597293 ) ( not ( = ?auto_1597289 ?auto_1597290 ) ) ( not ( = ?auto_1597289 ?auto_1597291 ) ) ( not ( = ?auto_1597289 ?auto_1597293 ) ) ( not ( = ?auto_1597289 ?auto_1597292 ) ) ( not ( = ?auto_1597289 ?auto_1597294 ) ) ( not ( = ?auto_1597290 ?auto_1597291 ) ) ( not ( = ?auto_1597290 ?auto_1597293 ) ) ( not ( = ?auto_1597290 ?auto_1597292 ) ) ( not ( = ?auto_1597290 ?auto_1597294 ) ) ( not ( = ?auto_1597291 ?auto_1597293 ) ) ( not ( = ?auto_1597291 ?auto_1597292 ) ) ( not ( = ?auto_1597291 ?auto_1597294 ) ) ( not ( = ?auto_1597293 ?auto_1597292 ) ) ( not ( = ?auto_1597293 ?auto_1597294 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1597292 ?auto_1597294 )
      ( MAKE-5CRATE-VERIFY ?auto_1597289 ?auto_1597290 ?auto_1597291 ?auto_1597293 ?auto_1597292 ?auto_1597294 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1597323 - SURFACE
      ?auto_1597324 - SURFACE
      ?auto_1597325 - SURFACE
      ?auto_1597327 - SURFACE
      ?auto_1597326 - SURFACE
      ?auto_1597328 - SURFACE
    )
    :vars
    (
      ?auto_1597330 - HOIST
      ?auto_1597331 - PLACE
      ?auto_1597329 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597330 ?auto_1597331 ) ( SURFACE-AT ?auto_1597326 ?auto_1597331 ) ( CLEAR ?auto_1597326 ) ( IS-CRATE ?auto_1597328 ) ( not ( = ?auto_1597326 ?auto_1597328 ) ) ( TRUCK-AT ?auto_1597329 ?auto_1597331 ) ( AVAILABLE ?auto_1597330 ) ( IN ?auto_1597328 ?auto_1597329 ) ( ON ?auto_1597326 ?auto_1597327 ) ( not ( = ?auto_1597327 ?auto_1597326 ) ) ( not ( = ?auto_1597327 ?auto_1597328 ) ) ( ON ?auto_1597324 ?auto_1597323 ) ( ON ?auto_1597325 ?auto_1597324 ) ( ON ?auto_1597327 ?auto_1597325 ) ( not ( = ?auto_1597323 ?auto_1597324 ) ) ( not ( = ?auto_1597323 ?auto_1597325 ) ) ( not ( = ?auto_1597323 ?auto_1597327 ) ) ( not ( = ?auto_1597323 ?auto_1597326 ) ) ( not ( = ?auto_1597323 ?auto_1597328 ) ) ( not ( = ?auto_1597324 ?auto_1597325 ) ) ( not ( = ?auto_1597324 ?auto_1597327 ) ) ( not ( = ?auto_1597324 ?auto_1597326 ) ) ( not ( = ?auto_1597324 ?auto_1597328 ) ) ( not ( = ?auto_1597325 ?auto_1597327 ) ) ( not ( = ?auto_1597325 ?auto_1597326 ) ) ( not ( = ?auto_1597325 ?auto_1597328 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1597327 ?auto_1597326 ?auto_1597328 )
      ( MAKE-5CRATE-VERIFY ?auto_1597323 ?auto_1597324 ?auto_1597325 ?auto_1597327 ?auto_1597326 ?auto_1597328 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1597363 - SURFACE
      ?auto_1597364 - SURFACE
      ?auto_1597365 - SURFACE
      ?auto_1597367 - SURFACE
      ?auto_1597366 - SURFACE
      ?auto_1597368 - SURFACE
    )
    :vars
    (
      ?auto_1597372 - HOIST
      ?auto_1597371 - PLACE
      ?auto_1597369 - TRUCK
      ?auto_1597370 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597372 ?auto_1597371 ) ( SURFACE-AT ?auto_1597366 ?auto_1597371 ) ( CLEAR ?auto_1597366 ) ( IS-CRATE ?auto_1597368 ) ( not ( = ?auto_1597366 ?auto_1597368 ) ) ( AVAILABLE ?auto_1597372 ) ( IN ?auto_1597368 ?auto_1597369 ) ( ON ?auto_1597366 ?auto_1597367 ) ( not ( = ?auto_1597367 ?auto_1597366 ) ) ( not ( = ?auto_1597367 ?auto_1597368 ) ) ( TRUCK-AT ?auto_1597369 ?auto_1597370 ) ( not ( = ?auto_1597370 ?auto_1597371 ) ) ( ON ?auto_1597364 ?auto_1597363 ) ( ON ?auto_1597365 ?auto_1597364 ) ( ON ?auto_1597367 ?auto_1597365 ) ( not ( = ?auto_1597363 ?auto_1597364 ) ) ( not ( = ?auto_1597363 ?auto_1597365 ) ) ( not ( = ?auto_1597363 ?auto_1597367 ) ) ( not ( = ?auto_1597363 ?auto_1597366 ) ) ( not ( = ?auto_1597363 ?auto_1597368 ) ) ( not ( = ?auto_1597364 ?auto_1597365 ) ) ( not ( = ?auto_1597364 ?auto_1597367 ) ) ( not ( = ?auto_1597364 ?auto_1597366 ) ) ( not ( = ?auto_1597364 ?auto_1597368 ) ) ( not ( = ?auto_1597365 ?auto_1597367 ) ) ( not ( = ?auto_1597365 ?auto_1597366 ) ) ( not ( = ?auto_1597365 ?auto_1597368 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1597367 ?auto_1597366 ?auto_1597368 )
      ( MAKE-5CRATE-VERIFY ?auto_1597363 ?auto_1597364 ?auto_1597365 ?auto_1597367 ?auto_1597366 ?auto_1597368 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1597408 - SURFACE
      ?auto_1597409 - SURFACE
      ?auto_1597410 - SURFACE
      ?auto_1597412 - SURFACE
      ?auto_1597411 - SURFACE
      ?auto_1597413 - SURFACE
    )
    :vars
    (
      ?auto_1597417 - HOIST
      ?auto_1597415 - PLACE
      ?auto_1597416 - TRUCK
      ?auto_1597414 - PLACE
      ?auto_1597418 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597417 ?auto_1597415 ) ( SURFACE-AT ?auto_1597411 ?auto_1597415 ) ( CLEAR ?auto_1597411 ) ( IS-CRATE ?auto_1597413 ) ( not ( = ?auto_1597411 ?auto_1597413 ) ) ( AVAILABLE ?auto_1597417 ) ( ON ?auto_1597411 ?auto_1597412 ) ( not ( = ?auto_1597412 ?auto_1597411 ) ) ( not ( = ?auto_1597412 ?auto_1597413 ) ) ( TRUCK-AT ?auto_1597416 ?auto_1597414 ) ( not ( = ?auto_1597414 ?auto_1597415 ) ) ( HOIST-AT ?auto_1597418 ?auto_1597414 ) ( LIFTING ?auto_1597418 ?auto_1597413 ) ( not ( = ?auto_1597417 ?auto_1597418 ) ) ( ON ?auto_1597409 ?auto_1597408 ) ( ON ?auto_1597410 ?auto_1597409 ) ( ON ?auto_1597412 ?auto_1597410 ) ( not ( = ?auto_1597408 ?auto_1597409 ) ) ( not ( = ?auto_1597408 ?auto_1597410 ) ) ( not ( = ?auto_1597408 ?auto_1597412 ) ) ( not ( = ?auto_1597408 ?auto_1597411 ) ) ( not ( = ?auto_1597408 ?auto_1597413 ) ) ( not ( = ?auto_1597409 ?auto_1597410 ) ) ( not ( = ?auto_1597409 ?auto_1597412 ) ) ( not ( = ?auto_1597409 ?auto_1597411 ) ) ( not ( = ?auto_1597409 ?auto_1597413 ) ) ( not ( = ?auto_1597410 ?auto_1597412 ) ) ( not ( = ?auto_1597410 ?auto_1597411 ) ) ( not ( = ?auto_1597410 ?auto_1597413 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1597412 ?auto_1597411 ?auto_1597413 )
      ( MAKE-5CRATE-VERIFY ?auto_1597408 ?auto_1597409 ?auto_1597410 ?auto_1597412 ?auto_1597411 ?auto_1597413 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1597458 - SURFACE
      ?auto_1597459 - SURFACE
      ?auto_1597460 - SURFACE
      ?auto_1597462 - SURFACE
      ?auto_1597461 - SURFACE
      ?auto_1597463 - SURFACE
    )
    :vars
    (
      ?auto_1597465 - HOIST
      ?auto_1597466 - PLACE
      ?auto_1597467 - TRUCK
      ?auto_1597464 - PLACE
      ?auto_1597468 - HOIST
      ?auto_1597469 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597465 ?auto_1597466 ) ( SURFACE-AT ?auto_1597461 ?auto_1597466 ) ( CLEAR ?auto_1597461 ) ( IS-CRATE ?auto_1597463 ) ( not ( = ?auto_1597461 ?auto_1597463 ) ) ( AVAILABLE ?auto_1597465 ) ( ON ?auto_1597461 ?auto_1597462 ) ( not ( = ?auto_1597462 ?auto_1597461 ) ) ( not ( = ?auto_1597462 ?auto_1597463 ) ) ( TRUCK-AT ?auto_1597467 ?auto_1597464 ) ( not ( = ?auto_1597464 ?auto_1597466 ) ) ( HOIST-AT ?auto_1597468 ?auto_1597464 ) ( not ( = ?auto_1597465 ?auto_1597468 ) ) ( AVAILABLE ?auto_1597468 ) ( SURFACE-AT ?auto_1597463 ?auto_1597464 ) ( ON ?auto_1597463 ?auto_1597469 ) ( CLEAR ?auto_1597463 ) ( not ( = ?auto_1597461 ?auto_1597469 ) ) ( not ( = ?auto_1597463 ?auto_1597469 ) ) ( not ( = ?auto_1597462 ?auto_1597469 ) ) ( ON ?auto_1597459 ?auto_1597458 ) ( ON ?auto_1597460 ?auto_1597459 ) ( ON ?auto_1597462 ?auto_1597460 ) ( not ( = ?auto_1597458 ?auto_1597459 ) ) ( not ( = ?auto_1597458 ?auto_1597460 ) ) ( not ( = ?auto_1597458 ?auto_1597462 ) ) ( not ( = ?auto_1597458 ?auto_1597461 ) ) ( not ( = ?auto_1597458 ?auto_1597463 ) ) ( not ( = ?auto_1597458 ?auto_1597469 ) ) ( not ( = ?auto_1597459 ?auto_1597460 ) ) ( not ( = ?auto_1597459 ?auto_1597462 ) ) ( not ( = ?auto_1597459 ?auto_1597461 ) ) ( not ( = ?auto_1597459 ?auto_1597463 ) ) ( not ( = ?auto_1597459 ?auto_1597469 ) ) ( not ( = ?auto_1597460 ?auto_1597462 ) ) ( not ( = ?auto_1597460 ?auto_1597461 ) ) ( not ( = ?auto_1597460 ?auto_1597463 ) ) ( not ( = ?auto_1597460 ?auto_1597469 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1597462 ?auto_1597461 ?auto_1597463 )
      ( MAKE-5CRATE-VERIFY ?auto_1597458 ?auto_1597459 ?auto_1597460 ?auto_1597462 ?auto_1597461 ?auto_1597463 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1597509 - SURFACE
      ?auto_1597510 - SURFACE
      ?auto_1597511 - SURFACE
      ?auto_1597513 - SURFACE
      ?auto_1597512 - SURFACE
      ?auto_1597514 - SURFACE
    )
    :vars
    (
      ?auto_1597517 - HOIST
      ?auto_1597515 - PLACE
      ?auto_1597518 - PLACE
      ?auto_1597516 - HOIST
      ?auto_1597520 - SURFACE
      ?auto_1597519 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597517 ?auto_1597515 ) ( SURFACE-AT ?auto_1597512 ?auto_1597515 ) ( CLEAR ?auto_1597512 ) ( IS-CRATE ?auto_1597514 ) ( not ( = ?auto_1597512 ?auto_1597514 ) ) ( AVAILABLE ?auto_1597517 ) ( ON ?auto_1597512 ?auto_1597513 ) ( not ( = ?auto_1597513 ?auto_1597512 ) ) ( not ( = ?auto_1597513 ?auto_1597514 ) ) ( not ( = ?auto_1597518 ?auto_1597515 ) ) ( HOIST-AT ?auto_1597516 ?auto_1597518 ) ( not ( = ?auto_1597517 ?auto_1597516 ) ) ( AVAILABLE ?auto_1597516 ) ( SURFACE-AT ?auto_1597514 ?auto_1597518 ) ( ON ?auto_1597514 ?auto_1597520 ) ( CLEAR ?auto_1597514 ) ( not ( = ?auto_1597512 ?auto_1597520 ) ) ( not ( = ?auto_1597514 ?auto_1597520 ) ) ( not ( = ?auto_1597513 ?auto_1597520 ) ) ( TRUCK-AT ?auto_1597519 ?auto_1597515 ) ( ON ?auto_1597510 ?auto_1597509 ) ( ON ?auto_1597511 ?auto_1597510 ) ( ON ?auto_1597513 ?auto_1597511 ) ( not ( = ?auto_1597509 ?auto_1597510 ) ) ( not ( = ?auto_1597509 ?auto_1597511 ) ) ( not ( = ?auto_1597509 ?auto_1597513 ) ) ( not ( = ?auto_1597509 ?auto_1597512 ) ) ( not ( = ?auto_1597509 ?auto_1597514 ) ) ( not ( = ?auto_1597509 ?auto_1597520 ) ) ( not ( = ?auto_1597510 ?auto_1597511 ) ) ( not ( = ?auto_1597510 ?auto_1597513 ) ) ( not ( = ?auto_1597510 ?auto_1597512 ) ) ( not ( = ?auto_1597510 ?auto_1597514 ) ) ( not ( = ?auto_1597510 ?auto_1597520 ) ) ( not ( = ?auto_1597511 ?auto_1597513 ) ) ( not ( = ?auto_1597511 ?auto_1597512 ) ) ( not ( = ?auto_1597511 ?auto_1597514 ) ) ( not ( = ?auto_1597511 ?auto_1597520 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1597513 ?auto_1597512 ?auto_1597514 )
      ( MAKE-5CRATE-VERIFY ?auto_1597509 ?auto_1597510 ?auto_1597511 ?auto_1597513 ?auto_1597512 ?auto_1597514 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1597560 - SURFACE
      ?auto_1597561 - SURFACE
      ?auto_1597562 - SURFACE
      ?auto_1597564 - SURFACE
      ?auto_1597563 - SURFACE
      ?auto_1597565 - SURFACE
    )
    :vars
    (
      ?auto_1597570 - HOIST
      ?auto_1597568 - PLACE
      ?auto_1597567 - PLACE
      ?auto_1597566 - HOIST
      ?auto_1597569 - SURFACE
      ?auto_1597571 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597570 ?auto_1597568 ) ( IS-CRATE ?auto_1597565 ) ( not ( = ?auto_1597563 ?auto_1597565 ) ) ( not ( = ?auto_1597564 ?auto_1597563 ) ) ( not ( = ?auto_1597564 ?auto_1597565 ) ) ( not ( = ?auto_1597567 ?auto_1597568 ) ) ( HOIST-AT ?auto_1597566 ?auto_1597567 ) ( not ( = ?auto_1597570 ?auto_1597566 ) ) ( AVAILABLE ?auto_1597566 ) ( SURFACE-AT ?auto_1597565 ?auto_1597567 ) ( ON ?auto_1597565 ?auto_1597569 ) ( CLEAR ?auto_1597565 ) ( not ( = ?auto_1597563 ?auto_1597569 ) ) ( not ( = ?auto_1597565 ?auto_1597569 ) ) ( not ( = ?auto_1597564 ?auto_1597569 ) ) ( TRUCK-AT ?auto_1597571 ?auto_1597568 ) ( SURFACE-AT ?auto_1597564 ?auto_1597568 ) ( CLEAR ?auto_1597564 ) ( LIFTING ?auto_1597570 ?auto_1597563 ) ( IS-CRATE ?auto_1597563 ) ( ON ?auto_1597561 ?auto_1597560 ) ( ON ?auto_1597562 ?auto_1597561 ) ( ON ?auto_1597564 ?auto_1597562 ) ( not ( = ?auto_1597560 ?auto_1597561 ) ) ( not ( = ?auto_1597560 ?auto_1597562 ) ) ( not ( = ?auto_1597560 ?auto_1597564 ) ) ( not ( = ?auto_1597560 ?auto_1597563 ) ) ( not ( = ?auto_1597560 ?auto_1597565 ) ) ( not ( = ?auto_1597560 ?auto_1597569 ) ) ( not ( = ?auto_1597561 ?auto_1597562 ) ) ( not ( = ?auto_1597561 ?auto_1597564 ) ) ( not ( = ?auto_1597561 ?auto_1597563 ) ) ( not ( = ?auto_1597561 ?auto_1597565 ) ) ( not ( = ?auto_1597561 ?auto_1597569 ) ) ( not ( = ?auto_1597562 ?auto_1597564 ) ) ( not ( = ?auto_1597562 ?auto_1597563 ) ) ( not ( = ?auto_1597562 ?auto_1597565 ) ) ( not ( = ?auto_1597562 ?auto_1597569 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1597564 ?auto_1597563 ?auto_1597565 )
      ( MAKE-5CRATE-VERIFY ?auto_1597560 ?auto_1597561 ?auto_1597562 ?auto_1597564 ?auto_1597563 ?auto_1597565 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1597611 - SURFACE
      ?auto_1597612 - SURFACE
      ?auto_1597613 - SURFACE
      ?auto_1597615 - SURFACE
      ?auto_1597614 - SURFACE
      ?auto_1597616 - SURFACE
    )
    :vars
    (
      ?auto_1597622 - HOIST
      ?auto_1597620 - PLACE
      ?auto_1597621 - PLACE
      ?auto_1597618 - HOIST
      ?auto_1597619 - SURFACE
      ?auto_1597617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597622 ?auto_1597620 ) ( IS-CRATE ?auto_1597616 ) ( not ( = ?auto_1597614 ?auto_1597616 ) ) ( not ( = ?auto_1597615 ?auto_1597614 ) ) ( not ( = ?auto_1597615 ?auto_1597616 ) ) ( not ( = ?auto_1597621 ?auto_1597620 ) ) ( HOIST-AT ?auto_1597618 ?auto_1597621 ) ( not ( = ?auto_1597622 ?auto_1597618 ) ) ( AVAILABLE ?auto_1597618 ) ( SURFACE-AT ?auto_1597616 ?auto_1597621 ) ( ON ?auto_1597616 ?auto_1597619 ) ( CLEAR ?auto_1597616 ) ( not ( = ?auto_1597614 ?auto_1597619 ) ) ( not ( = ?auto_1597616 ?auto_1597619 ) ) ( not ( = ?auto_1597615 ?auto_1597619 ) ) ( TRUCK-AT ?auto_1597617 ?auto_1597620 ) ( SURFACE-AT ?auto_1597615 ?auto_1597620 ) ( CLEAR ?auto_1597615 ) ( IS-CRATE ?auto_1597614 ) ( AVAILABLE ?auto_1597622 ) ( IN ?auto_1597614 ?auto_1597617 ) ( ON ?auto_1597612 ?auto_1597611 ) ( ON ?auto_1597613 ?auto_1597612 ) ( ON ?auto_1597615 ?auto_1597613 ) ( not ( = ?auto_1597611 ?auto_1597612 ) ) ( not ( = ?auto_1597611 ?auto_1597613 ) ) ( not ( = ?auto_1597611 ?auto_1597615 ) ) ( not ( = ?auto_1597611 ?auto_1597614 ) ) ( not ( = ?auto_1597611 ?auto_1597616 ) ) ( not ( = ?auto_1597611 ?auto_1597619 ) ) ( not ( = ?auto_1597612 ?auto_1597613 ) ) ( not ( = ?auto_1597612 ?auto_1597615 ) ) ( not ( = ?auto_1597612 ?auto_1597614 ) ) ( not ( = ?auto_1597612 ?auto_1597616 ) ) ( not ( = ?auto_1597612 ?auto_1597619 ) ) ( not ( = ?auto_1597613 ?auto_1597615 ) ) ( not ( = ?auto_1597613 ?auto_1597614 ) ) ( not ( = ?auto_1597613 ?auto_1597616 ) ) ( not ( = ?auto_1597613 ?auto_1597619 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1597615 ?auto_1597614 ?auto_1597616 )
      ( MAKE-5CRATE-VERIFY ?auto_1597611 ?auto_1597612 ?auto_1597613 ?auto_1597615 ?auto_1597614 ?auto_1597616 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1598820 - SURFACE
      ?auto_1598821 - SURFACE
      ?auto_1598822 - SURFACE
      ?auto_1598824 - SURFACE
      ?auto_1598823 - SURFACE
      ?auto_1598825 - SURFACE
      ?auto_1598826 - SURFACE
    )
    :vars
    (
      ?auto_1598828 - HOIST
      ?auto_1598827 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1598828 ?auto_1598827 ) ( SURFACE-AT ?auto_1598825 ?auto_1598827 ) ( CLEAR ?auto_1598825 ) ( LIFTING ?auto_1598828 ?auto_1598826 ) ( IS-CRATE ?auto_1598826 ) ( not ( = ?auto_1598825 ?auto_1598826 ) ) ( ON ?auto_1598821 ?auto_1598820 ) ( ON ?auto_1598822 ?auto_1598821 ) ( ON ?auto_1598824 ?auto_1598822 ) ( ON ?auto_1598823 ?auto_1598824 ) ( ON ?auto_1598825 ?auto_1598823 ) ( not ( = ?auto_1598820 ?auto_1598821 ) ) ( not ( = ?auto_1598820 ?auto_1598822 ) ) ( not ( = ?auto_1598820 ?auto_1598824 ) ) ( not ( = ?auto_1598820 ?auto_1598823 ) ) ( not ( = ?auto_1598820 ?auto_1598825 ) ) ( not ( = ?auto_1598820 ?auto_1598826 ) ) ( not ( = ?auto_1598821 ?auto_1598822 ) ) ( not ( = ?auto_1598821 ?auto_1598824 ) ) ( not ( = ?auto_1598821 ?auto_1598823 ) ) ( not ( = ?auto_1598821 ?auto_1598825 ) ) ( not ( = ?auto_1598821 ?auto_1598826 ) ) ( not ( = ?auto_1598822 ?auto_1598824 ) ) ( not ( = ?auto_1598822 ?auto_1598823 ) ) ( not ( = ?auto_1598822 ?auto_1598825 ) ) ( not ( = ?auto_1598822 ?auto_1598826 ) ) ( not ( = ?auto_1598824 ?auto_1598823 ) ) ( not ( = ?auto_1598824 ?auto_1598825 ) ) ( not ( = ?auto_1598824 ?auto_1598826 ) ) ( not ( = ?auto_1598823 ?auto_1598825 ) ) ( not ( = ?auto_1598823 ?auto_1598826 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1598825 ?auto_1598826 )
      ( MAKE-6CRATE-VERIFY ?auto_1598820 ?auto_1598821 ?auto_1598822 ?auto_1598824 ?auto_1598823 ?auto_1598825 ?auto_1598826 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1598864 - SURFACE
      ?auto_1598865 - SURFACE
      ?auto_1598866 - SURFACE
      ?auto_1598868 - SURFACE
      ?auto_1598867 - SURFACE
      ?auto_1598869 - SURFACE
      ?auto_1598870 - SURFACE
    )
    :vars
    (
      ?auto_1598873 - HOIST
      ?auto_1598872 - PLACE
      ?auto_1598871 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1598873 ?auto_1598872 ) ( SURFACE-AT ?auto_1598869 ?auto_1598872 ) ( CLEAR ?auto_1598869 ) ( IS-CRATE ?auto_1598870 ) ( not ( = ?auto_1598869 ?auto_1598870 ) ) ( TRUCK-AT ?auto_1598871 ?auto_1598872 ) ( AVAILABLE ?auto_1598873 ) ( IN ?auto_1598870 ?auto_1598871 ) ( ON ?auto_1598869 ?auto_1598867 ) ( not ( = ?auto_1598867 ?auto_1598869 ) ) ( not ( = ?auto_1598867 ?auto_1598870 ) ) ( ON ?auto_1598865 ?auto_1598864 ) ( ON ?auto_1598866 ?auto_1598865 ) ( ON ?auto_1598868 ?auto_1598866 ) ( ON ?auto_1598867 ?auto_1598868 ) ( not ( = ?auto_1598864 ?auto_1598865 ) ) ( not ( = ?auto_1598864 ?auto_1598866 ) ) ( not ( = ?auto_1598864 ?auto_1598868 ) ) ( not ( = ?auto_1598864 ?auto_1598867 ) ) ( not ( = ?auto_1598864 ?auto_1598869 ) ) ( not ( = ?auto_1598864 ?auto_1598870 ) ) ( not ( = ?auto_1598865 ?auto_1598866 ) ) ( not ( = ?auto_1598865 ?auto_1598868 ) ) ( not ( = ?auto_1598865 ?auto_1598867 ) ) ( not ( = ?auto_1598865 ?auto_1598869 ) ) ( not ( = ?auto_1598865 ?auto_1598870 ) ) ( not ( = ?auto_1598866 ?auto_1598868 ) ) ( not ( = ?auto_1598866 ?auto_1598867 ) ) ( not ( = ?auto_1598866 ?auto_1598869 ) ) ( not ( = ?auto_1598866 ?auto_1598870 ) ) ( not ( = ?auto_1598868 ?auto_1598867 ) ) ( not ( = ?auto_1598868 ?auto_1598869 ) ) ( not ( = ?auto_1598868 ?auto_1598870 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1598867 ?auto_1598869 ?auto_1598870 )
      ( MAKE-6CRATE-VERIFY ?auto_1598864 ?auto_1598865 ?auto_1598866 ?auto_1598868 ?auto_1598867 ?auto_1598869 ?auto_1598870 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1598915 - SURFACE
      ?auto_1598916 - SURFACE
      ?auto_1598917 - SURFACE
      ?auto_1598919 - SURFACE
      ?auto_1598918 - SURFACE
      ?auto_1598920 - SURFACE
      ?auto_1598921 - SURFACE
    )
    :vars
    (
      ?auto_1598925 - HOIST
      ?auto_1598923 - PLACE
      ?auto_1598924 - TRUCK
      ?auto_1598922 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1598925 ?auto_1598923 ) ( SURFACE-AT ?auto_1598920 ?auto_1598923 ) ( CLEAR ?auto_1598920 ) ( IS-CRATE ?auto_1598921 ) ( not ( = ?auto_1598920 ?auto_1598921 ) ) ( AVAILABLE ?auto_1598925 ) ( IN ?auto_1598921 ?auto_1598924 ) ( ON ?auto_1598920 ?auto_1598918 ) ( not ( = ?auto_1598918 ?auto_1598920 ) ) ( not ( = ?auto_1598918 ?auto_1598921 ) ) ( TRUCK-AT ?auto_1598924 ?auto_1598922 ) ( not ( = ?auto_1598922 ?auto_1598923 ) ) ( ON ?auto_1598916 ?auto_1598915 ) ( ON ?auto_1598917 ?auto_1598916 ) ( ON ?auto_1598919 ?auto_1598917 ) ( ON ?auto_1598918 ?auto_1598919 ) ( not ( = ?auto_1598915 ?auto_1598916 ) ) ( not ( = ?auto_1598915 ?auto_1598917 ) ) ( not ( = ?auto_1598915 ?auto_1598919 ) ) ( not ( = ?auto_1598915 ?auto_1598918 ) ) ( not ( = ?auto_1598915 ?auto_1598920 ) ) ( not ( = ?auto_1598915 ?auto_1598921 ) ) ( not ( = ?auto_1598916 ?auto_1598917 ) ) ( not ( = ?auto_1598916 ?auto_1598919 ) ) ( not ( = ?auto_1598916 ?auto_1598918 ) ) ( not ( = ?auto_1598916 ?auto_1598920 ) ) ( not ( = ?auto_1598916 ?auto_1598921 ) ) ( not ( = ?auto_1598917 ?auto_1598919 ) ) ( not ( = ?auto_1598917 ?auto_1598918 ) ) ( not ( = ?auto_1598917 ?auto_1598920 ) ) ( not ( = ?auto_1598917 ?auto_1598921 ) ) ( not ( = ?auto_1598919 ?auto_1598918 ) ) ( not ( = ?auto_1598919 ?auto_1598920 ) ) ( not ( = ?auto_1598919 ?auto_1598921 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1598918 ?auto_1598920 ?auto_1598921 )
      ( MAKE-6CRATE-VERIFY ?auto_1598915 ?auto_1598916 ?auto_1598917 ?auto_1598919 ?auto_1598918 ?auto_1598920 ?auto_1598921 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1598972 - SURFACE
      ?auto_1598973 - SURFACE
      ?auto_1598974 - SURFACE
      ?auto_1598976 - SURFACE
      ?auto_1598975 - SURFACE
      ?auto_1598977 - SURFACE
      ?auto_1598978 - SURFACE
    )
    :vars
    (
      ?auto_1598979 - HOIST
      ?auto_1598980 - PLACE
      ?auto_1598983 - TRUCK
      ?auto_1598981 - PLACE
      ?auto_1598982 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1598979 ?auto_1598980 ) ( SURFACE-AT ?auto_1598977 ?auto_1598980 ) ( CLEAR ?auto_1598977 ) ( IS-CRATE ?auto_1598978 ) ( not ( = ?auto_1598977 ?auto_1598978 ) ) ( AVAILABLE ?auto_1598979 ) ( ON ?auto_1598977 ?auto_1598975 ) ( not ( = ?auto_1598975 ?auto_1598977 ) ) ( not ( = ?auto_1598975 ?auto_1598978 ) ) ( TRUCK-AT ?auto_1598983 ?auto_1598981 ) ( not ( = ?auto_1598981 ?auto_1598980 ) ) ( HOIST-AT ?auto_1598982 ?auto_1598981 ) ( LIFTING ?auto_1598982 ?auto_1598978 ) ( not ( = ?auto_1598979 ?auto_1598982 ) ) ( ON ?auto_1598973 ?auto_1598972 ) ( ON ?auto_1598974 ?auto_1598973 ) ( ON ?auto_1598976 ?auto_1598974 ) ( ON ?auto_1598975 ?auto_1598976 ) ( not ( = ?auto_1598972 ?auto_1598973 ) ) ( not ( = ?auto_1598972 ?auto_1598974 ) ) ( not ( = ?auto_1598972 ?auto_1598976 ) ) ( not ( = ?auto_1598972 ?auto_1598975 ) ) ( not ( = ?auto_1598972 ?auto_1598977 ) ) ( not ( = ?auto_1598972 ?auto_1598978 ) ) ( not ( = ?auto_1598973 ?auto_1598974 ) ) ( not ( = ?auto_1598973 ?auto_1598976 ) ) ( not ( = ?auto_1598973 ?auto_1598975 ) ) ( not ( = ?auto_1598973 ?auto_1598977 ) ) ( not ( = ?auto_1598973 ?auto_1598978 ) ) ( not ( = ?auto_1598974 ?auto_1598976 ) ) ( not ( = ?auto_1598974 ?auto_1598975 ) ) ( not ( = ?auto_1598974 ?auto_1598977 ) ) ( not ( = ?auto_1598974 ?auto_1598978 ) ) ( not ( = ?auto_1598976 ?auto_1598975 ) ) ( not ( = ?auto_1598976 ?auto_1598977 ) ) ( not ( = ?auto_1598976 ?auto_1598978 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1598975 ?auto_1598977 ?auto_1598978 )
      ( MAKE-6CRATE-VERIFY ?auto_1598972 ?auto_1598973 ?auto_1598974 ?auto_1598976 ?auto_1598975 ?auto_1598977 ?auto_1598978 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1599035 - SURFACE
      ?auto_1599036 - SURFACE
      ?auto_1599037 - SURFACE
      ?auto_1599039 - SURFACE
      ?auto_1599038 - SURFACE
      ?auto_1599040 - SURFACE
      ?auto_1599041 - SURFACE
    )
    :vars
    (
      ?auto_1599042 - HOIST
      ?auto_1599045 - PLACE
      ?auto_1599046 - TRUCK
      ?auto_1599047 - PLACE
      ?auto_1599043 - HOIST
      ?auto_1599044 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1599042 ?auto_1599045 ) ( SURFACE-AT ?auto_1599040 ?auto_1599045 ) ( CLEAR ?auto_1599040 ) ( IS-CRATE ?auto_1599041 ) ( not ( = ?auto_1599040 ?auto_1599041 ) ) ( AVAILABLE ?auto_1599042 ) ( ON ?auto_1599040 ?auto_1599038 ) ( not ( = ?auto_1599038 ?auto_1599040 ) ) ( not ( = ?auto_1599038 ?auto_1599041 ) ) ( TRUCK-AT ?auto_1599046 ?auto_1599047 ) ( not ( = ?auto_1599047 ?auto_1599045 ) ) ( HOIST-AT ?auto_1599043 ?auto_1599047 ) ( not ( = ?auto_1599042 ?auto_1599043 ) ) ( AVAILABLE ?auto_1599043 ) ( SURFACE-AT ?auto_1599041 ?auto_1599047 ) ( ON ?auto_1599041 ?auto_1599044 ) ( CLEAR ?auto_1599041 ) ( not ( = ?auto_1599040 ?auto_1599044 ) ) ( not ( = ?auto_1599041 ?auto_1599044 ) ) ( not ( = ?auto_1599038 ?auto_1599044 ) ) ( ON ?auto_1599036 ?auto_1599035 ) ( ON ?auto_1599037 ?auto_1599036 ) ( ON ?auto_1599039 ?auto_1599037 ) ( ON ?auto_1599038 ?auto_1599039 ) ( not ( = ?auto_1599035 ?auto_1599036 ) ) ( not ( = ?auto_1599035 ?auto_1599037 ) ) ( not ( = ?auto_1599035 ?auto_1599039 ) ) ( not ( = ?auto_1599035 ?auto_1599038 ) ) ( not ( = ?auto_1599035 ?auto_1599040 ) ) ( not ( = ?auto_1599035 ?auto_1599041 ) ) ( not ( = ?auto_1599035 ?auto_1599044 ) ) ( not ( = ?auto_1599036 ?auto_1599037 ) ) ( not ( = ?auto_1599036 ?auto_1599039 ) ) ( not ( = ?auto_1599036 ?auto_1599038 ) ) ( not ( = ?auto_1599036 ?auto_1599040 ) ) ( not ( = ?auto_1599036 ?auto_1599041 ) ) ( not ( = ?auto_1599036 ?auto_1599044 ) ) ( not ( = ?auto_1599037 ?auto_1599039 ) ) ( not ( = ?auto_1599037 ?auto_1599038 ) ) ( not ( = ?auto_1599037 ?auto_1599040 ) ) ( not ( = ?auto_1599037 ?auto_1599041 ) ) ( not ( = ?auto_1599037 ?auto_1599044 ) ) ( not ( = ?auto_1599039 ?auto_1599038 ) ) ( not ( = ?auto_1599039 ?auto_1599040 ) ) ( not ( = ?auto_1599039 ?auto_1599041 ) ) ( not ( = ?auto_1599039 ?auto_1599044 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1599038 ?auto_1599040 ?auto_1599041 )
      ( MAKE-6CRATE-VERIFY ?auto_1599035 ?auto_1599036 ?auto_1599037 ?auto_1599039 ?auto_1599038 ?auto_1599040 ?auto_1599041 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1599099 - SURFACE
      ?auto_1599100 - SURFACE
      ?auto_1599101 - SURFACE
      ?auto_1599103 - SURFACE
      ?auto_1599102 - SURFACE
      ?auto_1599104 - SURFACE
      ?auto_1599105 - SURFACE
    )
    :vars
    (
      ?auto_1599110 - HOIST
      ?auto_1599109 - PLACE
      ?auto_1599107 - PLACE
      ?auto_1599108 - HOIST
      ?auto_1599106 - SURFACE
      ?auto_1599111 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1599110 ?auto_1599109 ) ( SURFACE-AT ?auto_1599104 ?auto_1599109 ) ( CLEAR ?auto_1599104 ) ( IS-CRATE ?auto_1599105 ) ( not ( = ?auto_1599104 ?auto_1599105 ) ) ( AVAILABLE ?auto_1599110 ) ( ON ?auto_1599104 ?auto_1599102 ) ( not ( = ?auto_1599102 ?auto_1599104 ) ) ( not ( = ?auto_1599102 ?auto_1599105 ) ) ( not ( = ?auto_1599107 ?auto_1599109 ) ) ( HOIST-AT ?auto_1599108 ?auto_1599107 ) ( not ( = ?auto_1599110 ?auto_1599108 ) ) ( AVAILABLE ?auto_1599108 ) ( SURFACE-AT ?auto_1599105 ?auto_1599107 ) ( ON ?auto_1599105 ?auto_1599106 ) ( CLEAR ?auto_1599105 ) ( not ( = ?auto_1599104 ?auto_1599106 ) ) ( not ( = ?auto_1599105 ?auto_1599106 ) ) ( not ( = ?auto_1599102 ?auto_1599106 ) ) ( TRUCK-AT ?auto_1599111 ?auto_1599109 ) ( ON ?auto_1599100 ?auto_1599099 ) ( ON ?auto_1599101 ?auto_1599100 ) ( ON ?auto_1599103 ?auto_1599101 ) ( ON ?auto_1599102 ?auto_1599103 ) ( not ( = ?auto_1599099 ?auto_1599100 ) ) ( not ( = ?auto_1599099 ?auto_1599101 ) ) ( not ( = ?auto_1599099 ?auto_1599103 ) ) ( not ( = ?auto_1599099 ?auto_1599102 ) ) ( not ( = ?auto_1599099 ?auto_1599104 ) ) ( not ( = ?auto_1599099 ?auto_1599105 ) ) ( not ( = ?auto_1599099 ?auto_1599106 ) ) ( not ( = ?auto_1599100 ?auto_1599101 ) ) ( not ( = ?auto_1599100 ?auto_1599103 ) ) ( not ( = ?auto_1599100 ?auto_1599102 ) ) ( not ( = ?auto_1599100 ?auto_1599104 ) ) ( not ( = ?auto_1599100 ?auto_1599105 ) ) ( not ( = ?auto_1599100 ?auto_1599106 ) ) ( not ( = ?auto_1599101 ?auto_1599103 ) ) ( not ( = ?auto_1599101 ?auto_1599102 ) ) ( not ( = ?auto_1599101 ?auto_1599104 ) ) ( not ( = ?auto_1599101 ?auto_1599105 ) ) ( not ( = ?auto_1599101 ?auto_1599106 ) ) ( not ( = ?auto_1599103 ?auto_1599102 ) ) ( not ( = ?auto_1599103 ?auto_1599104 ) ) ( not ( = ?auto_1599103 ?auto_1599105 ) ) ( not ( = ?auto_1599103 ?auto_1599106 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1599102 ?auto_1599104 ?auto_1599105 )
      ( MAKE-6CRATE-VERIFY ?auto_1599099 ?auto_1599100 ?auto_1599101 ?auto_1599103 ?auto_1599102 ?auto_1599104 ?auto_1599105 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1599163 - SURFACE
      ?auto_1599164 - SURFACE
      ?auto_1599165 - SURFACE
      ?auto_1599167 - SURFACE
      ?auto_1599166 - SURFACE
      ?auto_1599168 - SURFACE
      ?auto_1599169 - SURFACE
    )
    :vars
    (
      ?auto_1599171 - HOIST
      ?auto_1599175 - PLACE
      ?auto_1599172 - PLACE
      ?auto_1599174 - HOIST
      ?auto_1599170 - SURFACE
      ?auto_1599173 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1599171 ?auto_1599175 ) ( IS-CRATE ?auto_1599169 ) ( not ( = ?auto_1599168 ?auto_1599169 ) ) ( not ( = ?auto_1599166 ?auto_1599168 ) ) ( not ( = ?auto_1599166 ?auto_1599169 ) ) ( not ( = ?auto_1599172 ?auto_1599175 ) ) ( HOIST-AT ?auto_1599174 ?auto_1599172 ) ( not ( = ?auto_1599171 ?auto_1599174 ) ) ( AVAILABLE ?auto_1599174 ) ( SURFACE-AT ?auto_1599169 ?auto_1599172 ) ( ON ?auto_1599169 ?auto_1599170 ) ( CLEAR ?auto_1599169 ) ( not ( = ?auto_1599168 ?auto_1599170 ) ) ( not ( = ?auto_1599169 ?auto_1599170 ) ) ( not ( = ?auto_1599166 ?auto_1599170 ) ) ( TRUCK-AT ?auto_1599173 ?auto_1599175 ) ( SURFACE-AT ?auto_1599166 ?auto_1599175 ) ( CLEAR ?auto_1599166 ) ( LIFTING ?auto_1599171 ?auto_1599168 ) ( IS-CRATE ?auto_1599168 ) ( ON ?auto_1599164 ?auto_1599163 ) ( ON ?auto_1599165 ?auto_1599164 ) ( ON ?auto_1599167 ?auto_1599165 ) ( ON ?auto_1599166 ?auto_1599167 ) ( not ( = ?auto_1599163 ?auto_1599164 ) ) ( not ( = ?auto_1599163 ?auto_1599165 ) ) ( not ( = ?auto_1599163 ?auto_1599167 ) ) ( not ( = ?auto_1599163 ?auto_1599166 ) ) ( not ( = ?auto_1599163 ?auto_1599168 ) ) ( not ( = ?auto_1599163 ?auto_1599169 ) ) ( not ( = ?auto_1599163 ?auto_1599170 ) ) ( not ( = ?auto_1599164 ?auto_1599165 ) ) ( not ( = ?auto_1599164 ?auto_1599167 ) ) ( not ( = ?auto_1599164 ?auto_1599166 ) ) ( not ( = ?auto_1599164 ?auto_1599168 ) ) ( not ( = ?auto_1599164 ?auto_1599169 ) ) ( not ( = ?auto_1599164 ?auto_1599170 ) ) ( not ( = ?auto_1599165 ?auto_1599167 ) ) ( not ( = ?auto_1599165 ?auto_1599166 ) ) ( not ( = ?auto_1599165 ?auto_1599168 ) ) ( not ( = ?auto_1599165 ?auto_1599169 ) ) ( not ( = ?auto_1599165 ?auto_1599170 ) ) ( not ( = ?auto_1599167 ?auto_1599166 ) ) ( not ( = ?auto_1599167 ?auto_1599168 ) ) ( not ( = ?auto_1599167 ?auto_1599169 ) ) ( not ( = ?auto_1599167 ?auto_1599170 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1599166 ?auto_1599168 ?auto_1599169 )
      ( MAKE-6CRATE-VERIFY ?auto_1599163 ?auto_1599164 ?auto_1599165 ?auto_1599167 ?auto_1599166 ?auto_1599168 ?auto_1599169 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1599227 - SURFACE
      ?auto_1599228 - SURFACE
      ?auto_1599229 - SURFACE
      ?auto_1599231 - SURFACE
      ?auto_1599230 - SURFACE
      ?auto_1599232 - SURFACE
      ?auto_1599233 - SURFACE
    )
    :vars
    (
      ?auto_1599239 - HOIST
      ?auto_1599238 - PLACE
      ?auto_1599237 - PLACE
      ?auto_1599234 - HOIST
      ?auto_1599236 - SURFACE
      ?auto_1599235 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1599239 ?auto_1599238 ) ( IS-CRATE ?auto_1599233 ) ( not ( = ?auto_1599232 ?auto_1599233 ) ) ( not ( = ?auto_1599230 ?auto_1599232 ) ) ( not ( = ?auto_1599230 ?auto_1599233 ) ) ( not ( = ?auto_1599237 ?auto_1599238 ) ) ( HOIST-AT ?auto_1599234 ?auto_1599237 ) ( not ( = ?auto_1599239 ?auto_1599234 ) ) ( AVAILABLE ?auto_1599234 ) ( SURFACE-AT ?auto_1599233 ?auto_1599237 ) ( ON ?auto_1599233 ?auto_1599236 ) ( CLEAR ?auto_1599233 ) ( not ( = ?auto_1599232 ?auto_1599236 ) ) ( not ( = ?auto_1599233 ?auto_1599236 ) ) ( not ( = ?auto_1599230 ?auto_1599236 ) ) ( TRUCK-AT ?auto_1599235 ?auto_1599238 ) ( SURFACE-AT ?auto_1599230 ?auto_1599238 ) ( CLEAR ?auto_1599230 ) ( IS-CRATE ?auto_1599232 ) ( AVAILABLE ?auto_1599239 ) ( IN ?auto_1599232 ?auto_1599235 ) ( ON ?auto_1599228 ?auto_1599227 ) ( ON ?auto_1599229 ?auto_1599228 ) ( ON ?auto_1599231 ?auto_1599229 ) ( ON ?auto_1599230 ?auto_1599231 ) ( not ( = ?auto_1599227 ?auto_1599228 ) ) ( not ( = ?auto_1599227 ?auto_1599229 ) ) ( not ( = ?auto_1599227 ?auto_1599231 ) ) ( not ( = ?auto_1599227 ?auto_1599230 ) ) ( not ( = ?auto_1599227 ?auto_1599232 ) ) ( not ( = ?auto_1599227 ?auto_1599233 ) ) ( not ( = ?auto_1599227 ?auto_1599236 ) ) ( not ( = ?auto_1599228 ?auto_1599229 ) ) ( not ( = ?auto_1599228 ?auto_1599231 ) ) ( not ( = ?auto_1599228 ?auto_1599230 ) ) ( not ( = ?auto_1599228 ?auto_1599232 ) ) ( not ( = ?auto_1599228 ?auto_1599233 ) ) ( not ( = ?auto_1599228 ?auto_1599236 ) ) ( not ( = ?auto_1599229 ?auto_1599231 ) ) ( not ( = ?auto_1599229 ?auto_1599230 ) ) ( not ( = ?auto_1599229 ?auto_1599232 ) ) ( not ( = ?auto_1599229 ?auto_1599233 ) ) ( not ( = ?auto_1599229 ?auto_1599236 ) ) ( not ( = ?auto_1599231 ?auto_1599230 ) ) ( not ( = ?auto_1599231 ?auto_1599232 ) ) ( not ( = ?auto_1599231 ?auto_1599233 ) ) ( not ( = ?auto_1599231 ?auto_1599236 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1599230 ?auto_1599232 ?auto_1599233 )
      ( MAKE-6CRATE-VERIFY ?auto_1599227 ?auto_1599228 ?auto_1599229 ?auto_1599231 ?auto_1599230 ?auto_1599232 ?auto_1599233 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1601183 - SURFACE
      ?auto_1601184 - SURFACE
      ?auto_1601185 - SURFACE
      ?auto_1601187 - SURFACE
      ?auto_1601186 - SURFACE
      ?auto_1601188 - SURFACE
      ?auto_1601189 - SURFACE
      ?auto_1601190 - SURFACE
    )
    :vars
    (
      ?auto_1601192 - HOIST
      ?auto_1601191 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1601192 ?auto_1601191 ) ( SURFACE-AT ?auto_1601189 ?auto_1601191 ) ( CLEAR ?auto_1601189 ) ( LIFTING ?auto_1601192 ?auto_1601190 ) ( IS-CRATE ?auto_1601190 ) ( not ( = ?auto_1601189 ?auto_1601190 ) ) ( ON ?auto_1601184 ?auto_1601183 ) ( ON ?auto_1601185 ?auto_1601184 ) ( ON ?auto_1601187 ?auto_1601185 ) ( ON ?auto_1601186 ?auto_1601187 ) ( ON ?auto_1601188 ?auto_1601186 ) ( ON ?auto_1601189 ?auto_1601188 ) ( not ( = ?auto_1601183 ?auto_1601184 ) ) ( not ( = ?auto_1601183 ?auto_1601185 ) ) ( not ( = ?auto_1601183 ?auto_1601187 ) ) ( not ( = ?auto_1601183 ?auto_1601186 ) ) ( not ( = ?auto_1601183 ?auto_1601188 ) ) ( not ( = ?auto_1601183 ?auto_1601189 ) ) ( not ( = ?auto_1601183 ?auto_1601190 ) ) ( not ( = ?auto_1601184 ?auto_1601185 ) ) ( not ( = ?auto_1601184 ?auto_1601187 ) ) ( not ( = ?auto_1601184 ?auto_1601186 ) ) ( not ( = ?auto_1601184 ?auto_1601188 ) ) ( not ( = ?auto_1601184 ?auto_1601189 ) ) ( not ( = ?auto_1601184 ?auto_1601190 ) ) ( not ( = ?auto_1601185 ?auto_1601187 ) ) ( not ( = ?auto_1601185 ?auto_1601186 ) ) ( not ( = ?auto_1601185 ?auto_1601188 ) ) ( not ( = ?auto_1601185 ?auto_1601189 ) ) ( not ( = ?auto_1601185 ?auto_1601190 ) ) ( not ( = ?auto_1601187 ?auto_1601186 ) ) ( not ( = ?auto_1601187 ?auto_1601188 ) ) ( not ( = ?auto_1601187 ?auto_1601189 ) ) ( not ( = ?auto_1601187 ?auto_1601190 ) ) ( not ( = ?auto_1601186 ?auto_1601188 ) ) ( not ( = ?auto_1601186 ?auto_1601189 ) ) ( not ( = ?auto_1601186 ?auto_1601190 ) ) ( not ( = ?auto_1601188 ?auto_1601189 ) ) ( not ( = ?auto_1601188 ?auto_1601190 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1601189 ?auto_1601190 )
      ( MAKE-7CRATE-VERIFY ?auto_1601183 ?auto_1601184 ?auto_1601185 ?auto_1601187 ?auto_1601186 ?auto_1601188 ?auto_1601189 ?auto_1601190 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1601238 - SURFACE
      ?auto_1601239 - SURFACE
      ?auto_1601240 - SURFACE
      ?auto_1601242 - SURFACE
      ?auto_1601241 - SURFACE
      ?auto_1601243 - SURFACE
      ?auto_1601244 - SURFACE
      ?auto_1601245 - SURFACE
    )
    :vars
    (
      ?auto_1601247 - HOIST
      ?auto_1601246 - PLACE
      ?auto_1601248 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1601247 ?auto_1601246 ) ( SURFACE-AT ?auto_1601244 ?auto_1601246 ) ( CLEAR ?auto_1601244 ) ( IS-CRATE ?auto_1601245 ) ( not ( = ?auto_1601244 ?auto_1601245 ) ) ( TRUCK-AT ?auto_1601248 ?auto_1601246 ) ( AVAILABLE ?auto_1601247 ) ( IN ?auto_1601245 ?auto_1601248 ) ( ON ?auto_1601244 ?auto_1601243 ) ( not ( = ?auto_1601243 ?auto_1601244 ) ) ( not ( = ?auto_1601243 ?auto_1601245 ) ) ( ON ?auto_1601239 ?auto_1601238 ) ( ON ?auto_1601240 ?auto_1601239 ) ( ON ?auto_1601242 ?auto_1601240 ) ( ON ?auto_1601241 ?auto_1601242 ) ( ON ?auto_1601243 ?auto_1601241 ) ( not ( = ?auto_1601238 ?auto_1601239 ) ) ( not ( = ?auto_1601238 ?auto_1601240 ) ) ( not ( = ?auto_1601238 ?auto_1601242 ) ) ( not ( = ?auto_1601238 ?auto_1601241 ) ) ( not ( = ?auto_1601238 ?auto_1601243 ) ) ( not ( = ?auto_1601238 ?auto_1601244 ) ) ( not ( = ?auto_1601238 ?auto_1601245 ) ) ( not ( = ?auto_1601239 ?auto_1601240 ) ) ( not ( = ?auto_1601239 ?auto_1601242 ) ) ( not ( = ?auto_1601239 ?auto_1601241 ) ) ( not ( = ?auto_1601239 ?auto_1601243 ) ) ( not ( = ?auto_1601239 ?auto_1601244 ) ) ( not ( = ?auto_1601239 ?auto_1601245 ) ) ( not ( = ?auto_1601240 ?auto_1601242 ) ) ( not ( = ?auto_1601240 ?auto_1601241 ) ) ( not ( = ?auto_1601240 ?auto_1601243 ) ) ( not ( = ?auto_1601240 ?auto_1601244 ) ) ( not ( = ?auto_1601240 ?auto_1601245 ) ) ( not ( = ?auto_1601242 ?auto_1601241 ) ) ( not ( = ?auto_1601242 ?auto_1601243 ) ) ( not ( = ?auto_1601242 ?auto_1601244 ) ) ( not ( = ?auto_1601242 ?auto_1601245 ) ) ( not ( = ?auto_1601241 ?auto_1601243 ) ) ( not ( = ?auto_1601241 ?auto_1601244 ) ) ( not ( = ?auto_1601241 ?auto_1601245 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1601243 ?auto_1601244 ?auto_1601245 )
      ( MAKE-7CRATE-VERIFY ?auto_1601238 ?auto_1601239 ?auto_1601240 ?auto_1601242 ?auto_1601241 ?auto_1601243 ?auto_1601244 ?auto_1601245 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1601301 - SURFACE
      ?auto_1601302 - SURFACE
      ?auto_1601303 - SURFACE
      ?auto_1601305 - SURFACE
      ?auto_1601304 - SURFACE
      ?auto_1601306 - SURFACE
      ?auto_1601307 - SURFACE
      ?auto_1601308 - SURFACE
    )
    :vars
    (
      ?auto_1601309 - HOIST
      ?auto_1601311 - PLACE
      ?auto_1601310 - TRUCK
      ?auto_1601312 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1601309 ?auto_1601311 ) ( SURFACE-AT ?auto_1601307 ?auto_1601311 ) ( CLEAR ?auto_1601307 ) ( IS-CRATE ?auto_1601308 ) ( not ( = ?auto_1601307 ?auto_1601308 ) ) ( AVAILABLE ?auto_1601309 ) ( IN ?auto_1601308 ?auto_1601310 ) ( ON ?auto_1601307 ?auto_1601306 ) ( not ( = ?auto_1601306 ?auto_1601307 ) ) ( not ( = ?auto_1601306 ?auto_1601308 ) ) ( TRUCK-AT ?auto_1601310 ?auto_1601312 ) ( not ( = ?auto_1601312 ?auto_1601311 ) ) ( ON ?auto_1601302 ?auto_1601301 ) ( ON ?auto_1601303 ?auto_1601302 ) ( ON ?auto_1601305 ?auto_1601303 ) ( ON ?auto_1601304 ?auto_1601305 ) ( ON ?auto_1601306 ?auto_1601304 ) ( not ( = ?auto_1601301 ?auto_1601302 ) ) ( not ( = ?auto_1601301 ?auto_1601303 ) ) ( not ( = ?auto_1601301 ?auto_1601305 ) ) ( not ( = ?auto_1601301 ?auto_1601304 ) ) ( not ( = ?auto_1601301 ?auto_1601306 ) ) ( not ( = ?auto_1601301 ?auto_1601307 ) ) ( not ( = ?auto_1601301 ?auto_1601308 ) ) ( not ( = ?auto_1601302 ?auto_1601303 ) ) ( not ( = ?auto_1601302 ?auto_1601305 ) ) ( not ( = ?auto_1601302 ?auto_1601304 ) ) ( not ( = ?auto_1601302 ?auto_1601306 ) ) ( not ( = ?auto_1601302 ?auto_1601307 ) ) ( not ( = ?auto_1601302 ?auto_1601308 ) ) ( not ( = ?auto_1601303 ?auto_1601305 ) ) ( not ( = ?auto_1601303 ?auto_1601304 ) ) ( not ( = ?auto_1601303 ?auto_1601306 ) ) ( not ( = ?auto_1601303 ?auto_1601307 ) ) ( not ( = ?auto_1601303 ?auto_1601308 ) ) ( not ( = ?auto_1601305 ?auto_1601304 ) ) ( not ( = ?auto_1601305 ?auto_1601306 ) ) ( not ( = ?auto_1601305 ?auto_1601307 ) ) ( not ( = ?auto_1601305 ?auto_1601308 ) ) ( not ( = ?auto_1601304 ?auto_1601306 ) ) ( not ( = ?auto_1601304 ?auto_1601307 ) ) ( not ( = ?auto_1601304 ?auto_1601308 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1601306 ?auto_1601307 ?auto_1601308 )
      ( MAKE-7CRATE-VERIFY ?auto_1601301 ?auto_1601302 ?auto_1601303 ?auto_1601305 ?auto_1601304 ?auto_1601306 ?auto_1601307 ?auto_1601308 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1601371 - SURFACE
      ?auto_1601372 - SURFACE
      ?auto_1601373 - SURFACE
      ?auto_1601375 - SURFACE
      ?auto_1601374 - SURFACE
      ?auto_1601376 - SURFACE
      ?auto_1601377 - SURFACE
      ?auto_1601378 - SURFACE
    )
    :vars
    (
      ?auto_1601380 - HOIST
      ?auto_1601381 - PLACE
      ?auto_1601383 - TRUCK
      ?auto_1601382 - PLACE
      ?auto_1601379 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1601380 ?auto_1601381 ) ( SURFACE-AT ?auto_1601377 ?auto_1601381 ) ( CLEAR ?auto_1601377 ) ( IS-CRATE ?auto_1601378 ) ( not ( = ?auto_1601377 ?auto_1601378 ) ) ( AVAILABLE ?auto_1601380 ) ( ON ?auto_1601377 ?auto_1601376 ) ( not ( = ?auto_1601376 ?auto_1601377 ) ) ( not ( = ?auto_1601376 ?auto_1601378 ) ) ( TRUCK-AT ?auto_1601383 ?auto_1601382 ) ( not ( = ?auto_1601382 ?auto_1601381 ) ) ( HOIST-AT ?auto_1601379 ?auto_1601382 ) ( LIFTING ?auto_1601379 ?auto_1601378 ) ( not ( = ?auto_1601380 ?auto_1601379 ) ) ( ON ?auto_1601372 ?auto_1601371 ) ( ON ?auto_1601373 ?auto_1601372 ) ( ON ?auto_1601375 ?auto_1601373 ) ( ON ?auto_1601374 ?auto_1601375 ) ( ON ?auto_1601376 ?auto_1601374 ) ( not ( = ?auto_1601371 ?auto_1601372 ) ) ( not ( = ?auto_1601371 ?auto_1601373 ) ) ( not ( = ?auto_1601371 ?auto_1601375 ) ) ( not ( = ?auto_1601371 ?auto_1601374 ) ) ( not ( = ?auto_1601371 ?auto_1601376 ) ) ( not ( = ?auto_1601371 ?auto_1601377 ) ) ( not ( = ?auto_1601371 ?auto_1601378 ) ) ( not ( = ?auto_1601372 ?auto_1601373 ) ) ( not ( = ?auto_1601372 ?auto_1601375 ) ) ( not ( = ?auto_1601372 ?auto_1601374 ) ) ( not ( = ?auto_1601372 ?auto_1601376 ) ) ( not ( = ?auto_1601372 ?auto_1601377 ) ) ( not ( = ?auto_1601372 ?auto_1601378 ) ) ( not ( = ?auto_1601373 ?auto_1601375 ) ) ( not ( = ?auto_1601373 ?auto_1601374 ) ) ( not ( = ?auto_1601373 ?auto_1601376 ) ) ( not ( = ?auto_1601373 ?auto_1601377 ) ) ( not ( = ?auto_1601373 ?auto_1601378 ) ) ( not ( = ?auto_1601375 ?auto_1601374 ) ) ( not ( = ?auto_1601375 ?auto_1601376 ) ) ( not ( = ?auto_1601375 ?auto_1601377 ) ) ( not ( = ?auto_1601375 ?auto_1601378 ) ) ( not ( = ?auto_1601374 ?auto_1601376 ) ) ( not ( = ?auto_1601374 ?auto_1601377 ) ) ( not ( = ?auto_1601374 ?auto_1601378 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1601376 ?auto_1601377 ?auto_1601378 )
      ( MAKE-7CRATE-VERIFY ?auto_1601371 ?auto_1601372 ?auto_1601373 ?auto_1601375 ?auto_1601374 ?auto_1601376 ?auto_1601377 ?auto_1601378 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1601448 - SURFACE
      ?auto_1601449 - SURFACE
      ?auto_1601450 - SURFACE
      ?auto_1601452 - SURFACE
      ?auto_1601451 - SURFACE
      ?auto_1601453 - SURFACE
      ?auto_1601454 - SURFACE
      ?auto_1601455 - SURFACE
    )
    :vars
    (
      ?auto_1601458 - HOIST
      ?auto_1601456 - PLACE
      ?auto_1601457 - TRUCK
      ?auto_1601461 - PLACE
      ?auto_1601459 - HOIST
      ?auto_1601460 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1601458 ?auto_1601456 ) ( SURFACE-AT ?auto_1601454 ?auto_1601456 ) ( CLEAR ?auto_1601454 ) ( IS-CRATE ?auto_1601455 ) ( not ( = ?auto_1601454 ?auto_1601455 ) ) ( AVAILABLE ?auto_1601458 ) ( ON ?auto_1601454 ?auto_1601453 ) ( not ( = ?auto_1601453 ?auto_1601454 ) ) ( not ( = ?auto_1601453 ?auto_1601455 ) ) ( TRUCK-AT ?auto_1601457 ?auto_1601461 ) ( not ( = ?auto_1601461 ?auto_1601456 ) ) ( HOIST-AT ?auto_1601459 ?auto_1601461 ) ( not ( = ?auto_1601458 ?auto_1601459 ) ) ( AVAILABLE ?auto_1601459 ) ( SURFACE-AT ?auto_1601455 ?auto_1601461 ) ( ON ?auto_1601455 ?auto_1601460 ) ( CLEAR ?auto_1601455 ) ( not ( = ?auto_1601454 ?auto_1601460 ) ) ( not ( = ?auto_1601455 ?auto_1601460 ) ) ( not ( = ?auto_1601453 ?auto_1601460 ) ) ( ON ?auto_1601449 ?auto_1601448 ) ( ON ?auto_1601450 ?auto_1601449 ) ( ON ?auto_1601452 ?auto_1601450 ) ( ON ?auto_1601451 ?auto_1601452 ) ( ON ?auto_1601453 ?auto_1601451 ) ( not ( = ?auto_1601448 ?auto_1601449 ) ) ( not ( = ?auto_1601448 ?auto_1601450 ) ) ( not ( = ?auto_1601448 ?auto_1601452 ) ) ( not ( = ?auto_1601448 ?auto_1601451 ) ) ( not ( = ?auto_1601448 ?auto_1601453 ) ) ( not ( = ?auto_1601448 ?auto_1601454 ) ) ( not ( = ?auto_1601448 ?auto_1601455 ) ) ( not ( = ?auto_1601448 ?auto_1601460 ) ) ( not ( = ?auto_1601449 ?auto_1601450 ) ) ( not ( = ?auto_1601449 ?auto_1601452 ) ) ( not ( = ?auto_1601449 ?auto_1601451 ) ) ( not ( = ?auto_1601449 ?auto_1601453 ) ) ( not ( = ?auto_1601449 ?auto_1601454 ) ) ( not ( = ?auto_1601449 ?auto_1601455 ) ) ( not ( = ?auto_1601449 ?auto_1601460 ) ) ( not ( = ?auto_1601450 ?auto_1601452 ) ) ( not ( = ?auto_1601450 ?auto_1601451 ) ) ( not ( = ?auto_1601450 ?auto_1601453 ) ) ( not ( = ?auto_1601450 ?auto_1601454 ) ) ( not ( = ?auto_1601450 ?auto_1601455 ) ) ( not ( = ?auto_1601450 ?auto_1601460 ) ) ( not ( = ?auto_1601452 ?auto_1601451 ) ) ( not ( = ?auto_1601452 ?auto_1601453 ) ) ( not ( = ?auto_1601452 ?auto_1601454 ) ) ( not ( = ?auto_1601452 ?auto_1601455 ) ) ( not ( = ?auto_1601452 ?auto_1601460 ) ) ( not ( = ?auto_1601451 ?auto_1601453 ) ) ( not ( = ?auto_1601451 ?auto_1601454 ) ) ( not ( = ?auto_1601451 ?auto_1601455 ) ) ( not ( = ?auto_1601451 ?auto_1601460 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1601453 ?auto_1601454 ?auto_1601455 )
      ( MAKE-7CRATE-VERIFY ?auto_1601448 ?auto_1601449 ?auto_1601450 ?auto_1601452 ?auto_1601451 ?auto_1601453 ?auto_1601454 ?auto_1601455 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1601526 - SURFACE
      ?auto_1601527 - SURFACE
      ?auto_1601528 - SURFACE
      ?auto_1601530 - SURFACE
      ?auto_1601529 - SURFACE
      ?auto_1601531 - SURFACE
      ?auto_1601532 - SURFACE
      ?auto_1601533 - SURFACE
    )
    :vars
    (
      ?auto_1601535 - HOIST
      ?auto_1601538 - PLACE
      ?auto_1601537 - PLACE
      ?auto_1601534 - HOIST
      ?auto_1601536 - SURFACE
      ?auto_1601539 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1601535 ?auto_1601538 ) ( SURFACE-AT ?auto_1601532 ?auto_1601538 ) ( CLEAR ?auto_1601532 ) ( IS-CRATE ?auto_1601533 ) ( not ( = ?auto_1601532 ?auto_1601533 ) ) ( AVAILABLE ?auto_1601535 ) ( ON ?auto_1601532 ?auto_1601531 ) ( not ( = ?auto_1601531 ?auto_1601532 ) ) ( not ( = ?auto_1601531 ?auto_1601533 ) ) ( not ( = ?auto_1601537 ?auto_1601538 ) ) ( HOIST-AT ?auto_1601534 ?auto_1601537 ) ( not ( = ?auto_1601535 ?auto_1601534 ) ) ( AVAILABLE ?auto_1601534 ) ( SURFACE-AT ?auto_1601533 ?auto_1601537 ) ( ON ?auto_1601533 ?auto_1601536 ) ( CLEAR ?auto_1601533 ) ( not ( = ?auto_1601532 ?auto_1601536 ) ) ( not ( = ?auto_1601533 ?auto_1601536 ) ) ( not ( = ?auto_1601531 ?auto_1601536 ) ) ( TRUCK-AT ?auto_1601539 ?auto_1601538 ) ( ON ?auto_1601527 ?auto_1601526 ) ( ON ?auto_1601528 ?auto_1601527 ) ( ON ?auto_1601530 ?auto_1601528 ) ( ON ?auto_1601529 ?auto_1601530 ) ( ON ?auto_1601531 ?auto_1601529 ) ( not ( = ?auto_1601526 ?auto_1601527 ) ) ( not ( = ?auto_1601526 ?auto_1601528 ) ) ( not ( = ?auto_1601526 ?auto_1601530 ) ) ( not ( = ?auto_1601526 ?auto_1601529 ) ) ( not ( = ?auto_1601526 ?auto_1601531 ) ) ( not ( = ?auto_1601526 ?auto_1601532 ) ) ( not ( = ?auto_1601526 ?auto_1601533 ) ) ( not ( = ?auto_1601526 ?auto_1601536 ) ) ( not ( = ?auto_1601527 ?auto_1601528 ) ) ( not ( = ?auto_1601527 ?auto_1601530 ) ) ( not ( = ?auto_1601527 ?auto_1601529 ) ) ( not ( = ?auto_1601527 ?auto_1601531 ) ) ( not ( = ?auto_1601527 ?auto_1601532 ) ) ( not ( = ?auto_1601527 ?auto_1601533 ) ) ( not ( = ?auto_1601527 ?auto_1601536 ) ) ( not ( = ?auto_1601528 ?auto_1601530 ) ) ( not ( = ?auto_1601528 ?auto_1601529 ) ) ( not ( = ?auto_1601528 ?auto_1601531 ) ) ( not ( = ?auto_1601528 ?auto_1601532 ) ) ( not ( = ?auto_1601528 ?auto_1601533 ) ) ( not ( = ?auto_1601528 ?auto_1601536 ) ) ( not ( = ?auto_1601530 ?auto_1601529 ) ) ( not ( = ?auto_1601530 ?auto_1601531 ) ) ( not ( = ?auto_1601530 ?auto_1601532 ) ) ( not ( = ?auto_1601530 ?auto_1601533 ) ) ( not ( = ?auto_1601530 ?auto_1601536 ) ) ( not ( = ?auto_1601529 ?auto_1601531 ) ) ( not ( = ?auto_1601529 ?auto_1601532 ) ) ( not ( = ?auto_1601529 ?auto_1601533 ) ) ( not ( = ?auto_1601529 ?auto_1601536 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1601531 ?auto_1601532 ?auto_1601533 )
      ( MAKE-7CRATE-VERIFY ?auto_1601526 ?auto_1601527 ?auto_1601528 ?auto_1601530 ?auto_1601529 ?auto_1601531 ?auto_1601532 ?auto_1601533 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1601604 - SURFACE
      ?auto_1601605 - SURFACE
      ?auto_1601606 - SURFACE
      ?auto_1601608 - SURFACE
      ?auto_1601607 - SURFACE
      ?auto_1601609 - SURFACE
      ?auto_1601610 - SURFACE
      ?auto_1601611 - SURFACE
    )
    :vars
    (
      ?auto_1601615 - HOIST
      ?auto_1601614 - PLACE
      ?auto_1601617 - PLACE
      ?auto_1601616 - HOIST
      ?auto_1601613 - SURFACE
      ?auto_1601612 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1601615 ?auto_1601614 ) ( IS-CRATE ?auto_1601611 ) ( not ( = ?auto_1601610 ?auto_1601611 ) ) ( not ( = ?auto_1601609 ?auto_1601610 ) ) ( not ( = ?auto_1601609 ?auto_1601611 ) ) ( not ( = ?auto_1601617 ?auto_1601614 ) ) ( HOIST-AT ?auto_1601616 ?auto_1601617 ) ( not ( = ?auto_1601615 ?auto_1601616 ) ) ( AVAILABLE ?auto_1601616 ) ( SURFACE-AT ?auto_1601611 ?auto_1601617 ) ( ON ?auto_1601611 ?auto_1601613 ) ( CLEAR ?auto_1601611 ) ( not ( = ?auto_1601610 ?auto_1601613 ) ) ( not ( = ?auto_1601611 ?auto_1601613 ) ) ( not ( = ?auto_1601609 ?auto_1601613 ) ) ( TRUCK-AT ?auto_1601612 ?auto_1601614 ) ( SURFACE-AT ?auto_1601609 ?auto_1601614 ) ( CLEAR ?auto_1601609 ) ( LIFTING ?auto_1601615 ?auto_1601610 ) ( IS-CRATE ?auto_1601610 ) ( ON ?auto_1601605 ?auto_1601604 ) ( ON ?auto_1601606 ?auto_1601605 ) ( ON ?auto_1601608 ?auto_1601606 ) ( ON ?auto_1601607 ?auto_1601608 ) ( ON ?auto_1601609 ?auto_1601607 ) ( not ( = ?auto_1601604 ?auto_1601605 ) ) ( not ( = ?auto_1601604 ?auto_1601606 ) ) ( not ( = ?auto_1601604 ?auto_1601608 ) ) ( not ( = ?auto_1601604 ?auto_1601607 ) ) ( not ( = ?auto_1601604 ?auto_1601609 ) ) ( not ( = ?auto_1601604 ?auto_1601610 ) ) ( not ( = ?auto_1601604 ?auto_1601611 ) ) ( not ( = ?auto_1601604 ?auto_1601613 ) ) ( not ( = ?auto_1601605 ?auto_1601606 ) ) ( not ( = ?auto_1601605 ?auto_1601608 ) ) ( not ( = ?auto_1601605 ?auto_1601607 ) ) ( not ( = ?auto_1601605 ?auto_1601609 ) ) ( not ( = ?auto_1601605 ?auto_1601610 ) ) ( not ( = ?auto_1601605 ?auto_1601611 ) ) ( not ( = ?auto_1601605 ?auto_1601613 ) ) ( not ( = ?auto_1601606 ?auto_1601608 ) ) ( not ( = ?auto_1601606 ?auto_1601607 ) ) ( not ( = ?auto_1601606 ?auto_1601609 ) ) ( not ( = ?auto_1601606 ?auto_1601610 ) ) ( not ( = ?auto_1601606 ?auto_1601611 ) ) ( not ( = ?auto_1601606 ?auto_1601613 ) ) ( not ( = ?auto_1601608 ?auto_1601607 ) ) ( not ( = ?auto_1601608 ?auto_1601609 ) ) ( not ( = ?auto_1601608 ?auto_1601610 ) ) ( not ( = ?auto_1601608 ?auto_1601611 ) ) ( not ( = ?auto_1601608 ?auto_1601613 ) ) ( not ( = ?auto_1601607 ?auto_1601609 ) ) ( not ( = ?auto_1601607 ?auto_1601610 ) ) ( not ( = ?auto_1601607 ?auto_1601611 ) ) ( not ( = ?auto_1601607 ?auto_1601613 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1601609 ?auto_1601610 ?auto_1601611 )
      ( MAKE-7CRATE-VERIFY ?auto_1601604 ?auto_1601605 ?auto_1601606 ?auto_1601608 ?auto_1601607 ?auto_1601609 ?auto_1601610 ?auto_1601611 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1601682 - SURFACE
      ?auto_1601683 - SURFACE
      ?auto_1601684 - SURFACE
      ?auto_1601686 - SURFACE
      ?auto_1601685 - SURFACE
      ?auto_1601687 - SURFACE
      ?auto_1601688 - SURFACE
      ?auto_1601689 - SURFACE
    )
    :vars
    (
      ?auto_1601691 - HOIST
      ?auto_1601694 - PLACE
      ?auto_1601692 - PLACE
      ?auto_1601690 - HOIST
      ?auto_1601693 - SURFACE
      ?auto_1601695 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1601691 ?auto_1601694 ) ( IS-CRATE ?auto_1601689 ) ( not ( = ?auto_1601688 ?auto_1601689 ) ) ( not ( = ?auto_1601687 ?auto_1601688 ) ) ( not ( = ?auto_1601687 ?auto_1601689 ) ) ( not ( = ?auto_1601692 ?auto_1601694 ) ) ( HOIST-AT ?auto_1601690 ?auto_1601692 ) ( not ( = ?auto_1601691 ?auto_1601690 ) ) ( AVAILABLE ?auto_1601690 ) ( SURFACE-AT ?auto_1601689 ?auto_1601692 ) ( ON ?auto_1601689 ?auto_1601693 ) ( CLEAR ?auto_1601689 ) ( not ( = ?auto_1601688 ?auto_1601693 ) ) ( not ( = ?auto_1601689 ?auto_1601693 ) ) ( not ( = ?auto_1601687 ?auto_1601693 ) ) ( TRUCK-AT ?auto_1601695 ?auto_1601694 ) ( SURFACE-AT ?auto_1601687 ?auto_1601694 ) ( CLEAR ?auto_1601687 ) ( IS-CRATE ?auto_1601688 ) ( AVAILABLE ?auto_1601691 ) ( IN ?auto_1601688 ?auto_1601695 ) ( ON ?auto_1601683 ?auto_1601682 ) ( ON ?auto_1601684 ?auto_1601683 ) ( ON ?auto_1601686 ?auto_1601684 ) ( ON ?auto_1601685 ?auto_1601686 ) ( ON ?auto_1601687 ?auto_1601685 ) ( not ( = ?auto_1601682 ?auto_1601683 ) ) ( not ( = ?auto_1601682 ?auto_1601684 ) ) ( not ( = ?auto_1601682 ?auto_1601686 ) ) ( not ( = ?auto_1601682 ?auto_1601685 ) ) ( not ( = ?auto_1601682 ?auto_1601687 ) ) ( not ( = ?auto_1601682 ?auto_1601688 ) ) ( not ( = ?auto_1601682 ?auto_1601689 ) ) ( not ( = ?auto_1601682 ?auto_1601693 ) ) ( not ( = ?auto_1601683 ?auto_1601684 ) ) ( not ( = ?auto_1601683 ?auto_1601686 ) ) ( not ( = ?auto_1601683 ?auto_1601685 ) ) ( not ( = ?auto_1601683 ?auto_1601687 ) ) ( not ( = ?auto_1601683 ?auto_1601688 ) ) ( not ( = ?auto_1601683 ?auto_1601689 ) ) ( not ( = ?auto_1601683 ?auto_1601693 ) ) ( not ( = ?auto_1601684 ?auto_1601686 ) ) ( not ( = ?auto_1601684 ?auto_1601685 ) ) ( not ( = ?auto_1601684 ?auto_1601687 ) ) ( not ( = ?auto_1601684 ?auto_1601688 ) ) ( not ( = ?auto_1601684 ?auto_1601689 ) ) ( not ( = ?auto_1601684 ?auto_1601693 ) ) ( not ( = ?auto_1601686 ?auto_1601685 ) ) ( not ( = ?auto_1601686 ?auto_1601687 ) ) ( not ( = ?auto_1601686 ?auto_1601688 ) ) ( not ( = ?auto_1601686 ?auto_1601689 ) ) ( not ( = ?auto_1601686 ?auto_1601693 ) ) ( not ( = ?auto_1601685 ?auto_1601687 ) ) ( not ( = ?auto_1601685 ?auto_1601688 ) ) ( not ( = ?auto_1601685 ?auto_1601689 ) ) ( not ( = ?auto_1601685 ?auto_1601693 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1601687 ?auto_1601688 ?auto_1601689 )
      ( MAKE-7CRATE-VERIFY ?auto_1601682 ?auto_1601683 ?auto_1601684 ?auto_1601686 ?auto_1601685 ?auto_1601687 ?auto_1601688 ?auto_1601689 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1604601 - SURFACE
      ?auto_1604602 - SURFACE
      ?auto_1604603 - SURFACE
      ?auto_1604605 - SURFACE
      ?auto_1604604 - SURFACE
      ?auto_1604606 - SURFACE
      ?auto_1604607 - SURFACE
      ?auto_1604608 - SURFACE
      ?auto_1604609 - SURFACE
    )
    :vars
    (
      ?auto_1604611 - HOIST
      ?auto_1604610 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1604611 ?auto_1604610 ) ( SURFACE-AT ?auto_1604608 ?auto_1604610 ) ( CLEAR ?auto_1604608 ) ( LIFTING ?auto_1604611 ?auto_1604609 ) ( IS-CRATE ?auto_1604609 ) ( not ( = ?auto_1604608 ?auto_1604609 ) ) ( ON ?auto_1604602 ?auto_1604601 ) ( ON ?auto_1604603 ?auto_1604602 ) ( ON ?auto_1604605 ?auto_1604603 ) ( ON ?auto_1604604 ?auto_1604605 ) ( ON ?auto_1604606 ?auto_1604604 ) ( ON ?auto_1604607 ?auto_1604606 ) ( ON ?auto_1604608 ?auto_1604607 ) ( not ( = ?auto_1604601 ?auto_1604602 ) ) ( not ( = ?auto_1604601 ?auto_1604603 ) ) ( not ( = ?auto_1604601 ?auto_1604605 ) ) ( not ( = ?auto_1604601 ?auto_1604604 ) ) ( not ( = ?auto_1604601 ?auto_1604606 ) ) ( not ( = ?auto_1604601 ?auto_1604607 ) ) ( not ( = ?auto_1604601 ?auto_1604608 ) ) ( not ( = ?auto_1604601 ?auto_1604609 ) ) ( not ( = ?auto_1604602 ?auto_1604603 ) ) ( not ( = ?auto_1604602 ?auto_1604605 ) ) ( not ( = ?auto_1604602 ?auto_1604604 ) ) ( not ( = ?auto_1604602 ?auto_1604606 ) ) ( not ( = ?auto_1604602 ?auto_1604607 ) ) ( not ( = ?auto_1604602 ?auto_1604608 ) ) ( not ( = ?auto_1604602 ?auto_1604609 ) ) ( not ( = ?auto_1604603 ?auto_1604605 ) ) ( not ( = ?auto_1604603 ?auto_1604604 ) ) ( not ( = ?auto_1604603 ?auto_1604606 ) ) ( not ( = ?auto_1604603 ?auto_1604607 ) ) ( not ( = ?auto_1604603 ?auto_1604608 ) ) ( not ( = ?auto_1604603 ?auto_1604609 ) ) ( not ( = ?auto_1604605 ?auto_1604604 ) ) ( not ( = ?auto_1604605 ?auto_1604606 ) ) ( not ( = ?auto_1604605 ?auto_1604607 ) ) ( not ( = ?auto_1604605 ?auto_1604608 ) ) ( not ( = ?auto_1604605 ?auto_1604609 ) ) ( not ( = ?auto_1604604 ?auto_1604606 ) ) ( not ( = ?auto_1604604 ?auto_1604607 ) ) ( not ( = ?auto_1604604 ?auto_1604608 ) ) ( not ( = ?auto_1604604 ?auto_1604609 ) ) ( not ( = ?auto_1604606 ?auto_1604607 ) ) ( not ( = ?auto_1604606 ?auto_1604608 ) ) ( not ( = ?auto_1604606 ?auto_1604609 ) ) ( not ( = ?auto_1604607 ?auto_1604608 ) ) ( not ( = ?auto_1604607 ?auto_1604609 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1604608 ?auto_1604609 )
      ( MAKE-8CRATE-VERIFY ?auto_1604601 ?auto_1604602 ?auto_1604603 ?auto_1604605 ?auto_1604604 ?auto_1604606 ?auto_1604607 ?auto_1604608 ?auto_1604609 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1604668 - SURFACE
      ?auto_1604669 - SURFACE
      ?auto_1604670 - SURFACE
      ?auto_1604672 - SURFACE
      ?auto_1604671 - SURFACE
      ?auto_1604673 - SURFACE
      ?auto_1604674 - SURFACE
      ?auto_1604675 - SURFACE
      ?auto_1604676 - SURFACE
    )
    :vars
    (
      ?auto_1604679 - HOIST
      ?auto_1604677 - PLACE
      ?auto_1604678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1604679 ?auto_1604677 ) ( SURFACE-AT ?auto_1604675 ?auto_1604677 ) ( CLEAR ?auto_1604675 ) ( IS-CRATE ?auto_1604676 ) ( not ( = ?auto_1604675 ?auto_1604676 ) ) ( TRUCK-AT ?auto_1604678 ?auto_1604677 ) ( AVAILABLE ?auto_1604679 ) ( IN ?auto_1604676 ?auto_1604678 ) ( ON ?auto_1604675 ?auto_1604674 ) ( not ( = ?auto_1604674 ?auto_1604675 ) ) ( not ( = ?auto_1604674 ?auto_1604676 ) ) ( ON ?auto_1604669 ?auto_1604668 ) ( ON ?auto_1604670 ?auto_1604669 ) ( ON ?auto_1604672 ?auto_1604670 ) ( ON ?auto_1604671 ?auto_1604672 ) ( ON ?auto_1604673 ?auto_1604671 ) ( ON ?auto_1604674 ?auto_1604673 ) ( not ( = ?auto_1604668 ?auto_1604669 ) ) ( not ( = ?auto_1604668 ?auto_1604670 ) ) ( not ( = ?auto_1604668 ?auto_1604672 ) ) ( not ( = ?auto_1604668 ?auto_1604671 ) ) ( not ( = ?auto_1604668 ?auto_1604673 ) ) ( not ( = ?auto_1604668 ?auto_1604674 ) ) ( not ( = ?auto_1604668 ?auto_1604675 ) ) ( not ( = ?auto_1604668 ?auto_1604676 ) ) ( not ( = ?auto_1604669 ?auto_1604670 ) ) ( not ( = ?auto_1604669 ?auto_1604672 ) ) ( not ( = ?auto_1604669 ?auto_1604671 ) ) ( not ( = ?auto_1604669 ?auto_1604673 ) ) ( not ( = ?auto_1604669 ?auto_1604674 ) ) ( not ( = ?auto_1604669 ?auto_1604675 ) ) ( not ( = ?auto_1604669 ?auto_1604676 ) ) ( not ( = ?auto_1604670 ?auto_1604672 ) ) ( not ( = ?auto_1604670 ?auto_1604671 ) ) ( not ( = ?auto_1604670 ?auto_1604673 ) ) ( not ( = ?auto_1604670 ?auto_1604674 ) ) ( not ( = ?auto_1604670 ?auto_1604675 ) ) ( not ( = ?auto_1604670 ?auto_1604676 ) ) ( not ( = ?auto_1604672 ?auto_1604671 ) ) ( not ( = ?auto_1604672 ?auto_1604673 ) ) ( not ( = ?auto_1604672 ?auto_1604674 ) ) ( not ( = ?auto_1604672 ?auto_1604675 ) ) ( not ( = ?auto_1604672 ?auto_1604676 ) ) ( not ( = ?auto_1604671 ?auto_1604673 ) ) ( not ( = ?auto_1604671 ?auto_1604674 ) ) ( not ( = ?auto_1604671 ?auto_1604675 ) ) ( not ( = ?auto_1604671 ?auto_1604676 ) ) ( not ( = ?auto_1604673 ?auto_1604674 ) ) ( not ( = ?auto_1604673 ?auto_1604675 ) ) ( not ( = ?auto_1604673 ?auto_1604676 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1604674 ?auto_1604675 ?auto_1604676 )
      ( MAKE-8CRATE-VERIFY ?auto_1604668 ?auto_1604669 ?auto_1604670 ?auto_1604672 ?auto_1604671 ?auto_1604673 ?auto_1604674 ?auto_1604675 ?auto_1604676 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1604744 - SURFACE
      ?auto_1604745 - SURFACE
      ?auto_1604746 - SURFACE
      ?auto_1604748 - SURFACE
      ?auto_1604747 - SURFACE
      ?auto_1604749 - SURFACE
      ?auto_1604750 - SURFACE
      ?auto_1604751 - SURFACE
      ?auto_1604752 - SURFACE
    )
    :vars
    (
      ?auto_1604753 - HOIST
      ?auto_1604756 - PLACE
      ?auto_1604755 - TRUCK
      ?auto_1604754 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1604753 ?auto_1604756 ) ( SURFACE-AT ?auto_1604751 ?auto_1604756 ) ( CLEAR ?auto_1604751 ) ( IS-CRATE ?auto_1604752 ) ( not ( = ?auto_1604751 ?auto_1604752 ) ) ( AVAILABLE ?auto_1604753 ) ( IN ?auto_1604752 ?auto_1604755 ) ( ON ?auto_1604751 ?auto_1604750 ) ( not ( = ?auto_1604750 ?auto_1604751 ) ) ( not ( = ?auto_1604750 ?auto_1604752 ) ) ( TRUCK-AT ?auto_1604755 ?auto_1604754 ) ( not ( = ?auto_1604754 ?auto_1604756 ) ) ( ON ?auto_1604745 ?auto_1604744 ) ( ON ?auto_1604746 ?auto_1604745 ) ( ON ?auto_1604748 ?auto_1604746 ) ( ON ?auto_1604747 ?auto_1604748 ) ( ON ?auto_1604749 ?auto_1604747 ) ( ON ?auto_1604750 ?auto_1604749 ) ( not ( = ?auto_1604744 ?auto_1604745 ) ) ( not ( = ?auto_1604744 ?auto_1604746 ) ) ( not ( = ?auto_1604744 ?auto_1604748 ) ) ( not ( = ?auto_1604744 ?auto_1604747 ) ) ( not ( = ?auto_1604744 ?auto_1604749 ) ) ( not ( = ?auto_1604744 ?auto_1604750 ) ) ( not ( = ?auto_1604744 ?auto_1604751 ) ) ( not ( = ?auto_1604744 ?auto_1604752 ) ) ( not ( = ?auto_1604745 ?auto_1604746 ) ) ( not ( = ?auto_1604745 ?auto_1604748 ) ) ( not ( = ?auto_1604745 ?auto_1604747 ) ) ( not ( = ?auto_1604745 ?auto_1604749 ) ) ( not ( = ?auto_1604745 ?auto_1604750 ) ) ( not ( = ?auto_1604745 ?auto_1604751 ) ) ( not ( = ?auto_1604745 ?auto_1604752 ) ) ( not ( = ?auto_1604746 ?auto_1604748 ) ) ( not ( = ?auto_1604746 ?auto_1604747 ) ) ( not ( = ?auto_1604746 ?auto_1604749 ) ) ( not ( = ?auto_1604746 ?auto_1604750 ) ) ( not ( = ?auto_1604746 ?auto_1604751 ) ) ( not ( = ?auto_1604746 ?auto_1604752 ) ) ( not ( = ?auto_1604748 ?auto_1604747 ) ) ( not ( = ?auto_1604748 ?auto_1604749 ) ) ( not ( = ?auto_1604748 ?auto_1604750 ) ) ( not ( = ?auto_1604748 ?auto_1604751 ) ) ( not ( = ?auto_1604748 ?auto_1604752 ) ) ( not ( = ?auto_1604747 ?auto_1604749 ) ) ( not ( = ?auto_1604747 ?auto_1604750 ) ) ( not ( = ?auto_1604747 ?auto_1604751 ) ) ( not ( = ?auto_1604747 ?auto_1604752 ) ) ( not ( = ?auto_1604749 ?auto_1604750 ) ) ( not ( = ?auto_1604749 ?auto_1604751 ) ) ( not ( = ?auto_1604749 ?auto_1604752 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1604750 ?auto_1604751 ?auto_1604752 )
      ( MAKE-8CRATE-VERIFY ?auto_1604744 ?auto_1604745 ?auto_1604746 ?auto_1604748 ?auto_1604747 ?auto_1604749 ?auto_1604750 ?auto_1604751 ?auto_1604752 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1604828 - SURFACE
      ?auto_1604829 - SURFACE
      ?auto_1604830 - SURFACE
      ?auto_1604832 - SURFACE
      ?auto_1604831 - SURFACE
      ?auto_1604833 - SURFACE
      ?auto_1604834 - SURFACE
      ?auto_1604835 - SURFACE
      ?auto_1604836 - SURFACE
    )
    :vars
    (
      ?auto_1604838 - HOIST
      ?auto_1604837 - PLACE
      ?auto_1604841 - TRUCK
      ?auto_1604839 - PLACE
      ?auto_1604840 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1604838 ?auto_1604837 ) ( SURFACE-AT ?auto_1604835 ?auto_1604837 ) ( CLEAR ?auto_1604835 ) ( IS-CRATE ?auto_1604836 ) ( not ( = ?auto_1604835 ?auto_1604836 ) ) ( AVAILABLE ?auto_1604838 ) ( ON ?auto_1604835 ?auto_1604834 ) ( not ( = ?auto_1604834 ?auto_1604835 ) ) ( not ( = ?auto_1604834 ?auto_1604836 ) ) ( TRUCK-AT ?auto_1604841 ?auto_1604839 ) ( not ( = ?auto_1604839 ?auto_1604837 ) ) ( HOIST-AT ?auto_1604840 ?auto_1604839 ) ( LIFTING ?auto_1604840 ?auto_1604836 ) ( not ( = ?auto_1604838 ?auto_1604840 ) ) ( ON ?auto_1604829 ?auto_1604828 ) ( ON ?auto_1604830 ?auto_1604829 ) ( ON ?auto_1604832 ?auto_1604830 ) ( ON ?auto_1604831 ?auto_1604832 ) ( ON ?auto_1604833 ?auto_1604831 ) ( ON ?auto_1604834 ?auto_1604833 ) ( not ( = ?auto_1604828 ?auto_1604829 ) ) ( not ( = ?auto_1604828 ?auto_1604830 ) ) ( not ( = ?auto_1604828 ?auto_1604832 ) ) ( not ( = ?auto_1604828 ?auto_1604831 ) ) ( not ( = ?auto_1604828 ?auto_1604833 ) ) ( not ( = ?auto_1604828 ?auto_1604834 ) ) ( not ( = ?auto_1604828 ?auto_1604835 ) ) ( not ( = ?auto_1604828 ?auto_1604836 ) ) ( not ( = ?auto_1604829 ?auto_1604830 ) ) ( not ( = ?auto_1604829 ?auto_1604832 ) ) ( not ( = ?auto_1604829 ?auto_1604831 ) ) ( not ( = ?auto_1604829 ?auto_1604833 ) ) ( not ( = ?auto_1604829 ?auto_1604834 ) ) ( not ( = ?auto_1604829 ?auto_1604835 ) ) ( not ( = ?auto_1604829 ?auto_1604836 ) ) ( not ( = ?auto_1604830 ?auto_1604832 ) ) ( not ( = ?auto_1604830 ?auto_1604831 ) ) ( not ( = ?auto_1604830 ?auto_1604833 ) ) ( not ( = ?auto_1604830 ?auto_1604834 ) ) ( not ( = ?auto_1604830 ?auto_1604835 ) ) ( not ( = ?auto_1604830 ?auto_1604836 ) ) ( not ( = ?auto_1604832 ?auto_1604831 ) ) ( not ( = ?auto_1604832 ?auto_1604833 ) ) ( not ( = ?auto_1604832 ?auto_1604834 ) ) ( not ( = ?auto_1604832 ?auto_1604835 ) ) ( not ( = ?auto_1604832 ?auto_1604836 ) ) ( not ( = ?auto_1604831 ?auto_1604833 ) ) ( not ( = ?auto_1604831 ?auto_1604834 ) ) ( not ( = ?auto_1604831 ?auto_1604835 ) ) ( not ( = ?auto_1604831 ?auto_1604836 ) ) ( not ( = ?auto_1604833 ?auto_1604834 ) ) ( not ( = ?auto_1604833 ?auto_1604835 ) ) ( not ( = ?auto_1604833 ?auto_1604836 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1604834 ?auto_1604835 ?auto_1604836 )
      ( MAKE-8CRATE-VERIFY ?auto_1604828 ?auto_1604829 ?auto_1604830 ?auto_1604832 ?auto_1604831 ?auto_1604833 ?auto_1604834 ?auto_1604835 ?auto_1604836 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1604920 - SURFACE
      ?auto_1604921 - SURFACE
      ?auto_1604922 - SURFACE
      ?auto_1604924 - SURFACE
      ?auto_1604923 - SURFACE
      ?auto_1604925 - SURFACE
      ?auto_1604926 - SURFACE
      ?auto_1604927 - SURFACE
      ?auto_1604928 - SURFACE
    )
    :vars
    (
      ?auto_1604929 - HOIST
      ?auto_1604934 - PLACE
      ?auto_1604932 - TRUCK
      ?auto_1604933 - PLACE
      ?auto_1604931 - HOIST
      ?auto_1604930 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1604929 ?auto_1604934 ) ( SURFACE-AT ?auto_1604927 ?auto_1604934 ) ( CLEAR ?auto_1604927 ) ( IS-CRATE ?auto_1604928 ) ( not ( = ?auto_1604927 ?auto_1604928 ) ) ( AVAILABLE ?auto_1604929 ) ( ON ?auto_1604927 ?auto_1604926 ) ( not ( = ?auto_1604926 ?auto_1604927 ) ) ( not ( = ?auto_1604926 ?auto_1604928 ) ) ( TRUCK-AT ?auto_1604932 ?auto_1604933 ) ( not ( = ?auto_1604933 ?auto_1604934 ) ) ( HOIST-AT ?auto_1604931 ?auto_1604933 ) ( not ( = ?auto_1604929 ?auto_1604931 ) ) ( AVAILABLE ?auto_1604931 ) ( SURFACE-AT ?auto_1604928 ?auto_1604933 ) ( ON ?auto_1604928 ?auto_1604930 ) ( CLEAR ?auto_1604928 ) ( not ( = ?auto_1604927 ?auto_1604930 ) ) ( not ( = ?auto_1604928 ?auto_1604930 ) ) ( not ( = ?auto_1604926 ?auto_1604930 ) ) ( ON ?auto_1604921 ?auto_1604920 ) ( ON ?auto_1604922 ?auto_1604921 ) ( ON ?auto_1604924 ?auto_1604922 ) ( ON ?auto_1604923 ?auto_1604924 ) ( ON ?auto_1604925 ?auto_1604923 ) ( ON ?auto_1604926 ?auto_1604925 ) ( not ( = ?auto_1604920 ?auto_1604921 ) ) ( not ( = ?auto_1604920 ?auto_1604922 ) ) ( not ( = ?auto_1604920 ?auto_1604924 ) ) ( not ( = ?auto_1604920 ?auto_1604923 ) ) ( not ( = ?auto_1604920 ?auto_1604925 ) ) ( not ( = ?auto_1604920 ?auto_1604926 ) ) ( not ( = ?auto_1604920 ?auto_1604927 ) ) ( not ( = ?auto_1604920 ?auto_1604928 ) ) ( not ( = ?auto_1604920 ?auto_1604930 ) ) ( not ( = ?auto_1604921 ?auto_1604922 ) ) ( not ( = ?auto_1604921 ?auto_1604924 ) ) ( not ( = ?auto_1604921 ?auto_1604923 ) ) ( not ( = ?auto_1604921 ?auto_1604925 ) ) ( not ( = ?auto_1604921 ?auto_1604926 ) ) ( not ( = ?auto_1604921 ?auto_1604927 ) ) ( not ( = ?auto_1604921 ?auto_1604928 ) ) ( not ( = ?auto_1604921 ?auto_1604930 ) ) ( not ( = ?auto_1604922 ?auto_1604924 ) ) ( not ( = ?auto_1604922 ?auto_1604923 ) ) ( not ( = ?auto_1604922 ?auto_1604925 ) ) ( not ( = ?auto_1604922 ?auto_1604926 ) ) ( not ( = ?auto_1604922 ?auto_1604927 ) ) ( not ( = ?auto_1604922 ?auto_1604928 ) ) ( not ( = ?auto_1604922 ?auto_1604930 ) ) ( not ( = ?auto_1604924 ?auto_1604923 ) ) ( not ( = ?auto_1604924 ?auto_1604925 ) ) ( not ( = ?auto_1604924 ?auto_1604926 ) ) ( not ( = ?auto_1604924 ?auto_1604927 ) ) ( not ( = ?auto_1604924 ?auto_1604928 ) ) ( not ( = ?auto_1604924 ?auto_1604930 ) ) ( not ( = ?auto_1604923 ?auto_1604925 ) ) ( not ( = ?auto_1604923 ?auto_1604926 ) ) ( not ( = ?auto_1604923 ?auto_1604927 ) ) ( not ( = ?auto_1604923 ?auto_1604928 ) ) ( not ( = ?auto_1604923 ?auto_1604930 ) ) ( not ( = ?auto_1604925 ?auto_1604926 ) ) ( not ( = ?auto_1604925 ?auto_1604927 ) ) ( not ( = ?auto_1604925 ?auto_1604928 ) ) ( not ( = ?auto_1604925 ?auto_1604930 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1604926 ?auto_1604927 ?auto_1604928 )
      ( MAKE-8CRATE-VERIFY ?auto_1604920 ?auto_1604921 ?auto_1604922 ?auto_1604924 ?auto_1604923 ?auto_1604925 ?auto_1604926 ?auto_1604927 ?auto_1604928 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1605013 - SURFACE
      ?auto_1605014 - SURFACE
      ?auto_1605015 - SURFACE
      ?auto_1605017 - SURFACE
      ?auto_1605016 - SURFACE
      ?auto_1605018 - SURFACE
      ?auto_1605019 - SURFACE
      ?auto_1605020 - SURFACE
      ?auto_1605021 - SURFACE
    )
    :vars
    (
      ?auto_1605022 - HOIST
      ?auto_1605025 - PLACE
      ?auto_1605024 - PLACE
      ?auto_1605027 - HOIST
      ?auto_1605023 - SURFACE
      ?auto_1605026 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1605022 ?auto_1605025 ) ( SURFACE-AT ?auto_1605020 ?auto_1605025 ) ( CLEAR ?auto_1605020 ) ( IS-CRATE ?auto_1605021 ) ( not ( = ?auto_1605020 ?auto_1605021 ) ) ( AVAILABLE ?auto_1605022 ) ( ON ?auto_1605020 ?auto_1605019 ) ( not ( = ?auto_1605019 ?auto_1605020 ) ) ( not ( = ?auto_1605019 ?auto_1605021 ) ) ( not ( = ?auto_1605024 ?auto_1605025 ) ) ( HOIST-AT ?auto_1605027 ?auto_1605024 ) ( not ( = ?auto_1605022 ?auto_1605027 ) ) ( AVAILABLE ?auto_1605027 ) ( SURFACE-AT ?auto_1605021 ?auto_1605024 ) ( ON ?auto_1605021 ?auto_1605023 ) ( CLEAR ?auto_1605021 ) ( not ( = ?auto_1605020 ?auto_1605023 ) ) ( not ( = ?auto_1605021 ?auto_1605023 ) ) ( not ( = ?auto_1605019 ?auto_1605023 ) ) ( TRUCK-AT ?auto_1605026 ?auto_1605025 ) ( ON ?auto_1605014 ?auto_1605013 ) ( ON ?auto_1605015 ?auto_1605014 ) ( ON ?auto_1605017 ?auto_1605015 ) ( ON ?auto_1605016 ?auto_1605017 ) ( ON ?auto_1605018 ?auto_1605016 ) ( ON ?auto_1605019 ?auto_1605018 ) ( not ( = ?auto_1605013 ?auto_1605014 ) ) ( not ( = ?auto_1605013 ?auto_1605015 ) ) ( not ( = ?auto_1605013 ?auto_1605017 ) ) ( not ( = ?auto_1605013 ?auto_1605016 ) ) ( not ( = ?auto_1605013 ?auto_1605018 ) ) ( not ( = ?auto_1605013 ?auto_1605019 ) ) ( not ( = ?auto_1605013 ?auto_1605020 ) ) ( not ( = ?auto_1605013 ?auto_1605021 ) ) ( not ( = ?auto_1605013 ?auto_1605023 ) ) ( not ( = ?auto_1605014 ?auto_1605015 ) ) ( not ( = ?auto_1605014 ?auto_1605017 ) ) ( not ( = ?auto_1605014 ?auto_1605016 ) ) ( not ( = ?auto_1605014 ?auto_1605018 ) ) ( not ( = ?auto_1605014 ?auto_1605019 ) ) ( not ( = ?auto_1605014 ?auto_1605020 ) ) ( not ( = ?auto_1605014 ?auto_1605021 ) ) ( not ( = ?auto_1605014 ?auto_1605023 ) ) ( not ( = ?auto_1605015 ?auto_1605017 ) ) ( not ( = ?auto_1605015 ?auto_1605016 ) ) ( not ( = ?auto_1605015 ?auto_1605018 ) ) ( not ( = ?auto_1605015 ?auto_1605019 ) ) ( not ( = ?auto_1605015 ?auto_1605020 ) ) ( not ( = ?auto_1605015 ?auto_1605021 ) ) ( not ( = ?auto_1605015 ?auto_1605023 ) ) ( not ( = ?auto_1605017 ?auto_1605016 ) ) ( not ( = ?auto_1605017 ?auto_1605018 ) ) ( not ( = ?auto_1605017 ?auto_1605019 ) ) ( not ( = ?auto_1605017 ?auto_1605020 ) ) ( not ( = ?auto_1605017 ?auto_1605021 ) ) ( not ( = ?auto_1605017 ?auto_1605023 ) ) ( not ( = ?auto_1605016 ?auto_1605018 ) ) ( not ( = ?auto_1605016 ?auto_1605019 ) ) ( not ( = ?auto_1605016 ?auto_1605020 ) ) ( not ( = ?auto_1605016 ?auto_1605021 ) ) ( not ( = ?auto_1605016 ?auto_1605023 ) ) ( not ( = ?auto_1605018 ?auto_1605019 ) ) ( not ( = ?auto_1605018 ?auto_1605020 ) ) ( not ( = ?auto_1605018 ?auto_1605021 ) ) ( not ( = ?auto_1605018 ?auto_1605023 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1605019 ?auto_1605020 ?auto_1605021 )
      ( MAKE-8CRATE-VERIFY ?auto_1605013 ?auto_1605014 ?auto_1605015 ?auto_1605017 ?auto_1605016 ?auto_1605018 ?auto_1605019 ?auto_1605020 ?auto_1605021 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1605106 - SURFACE
      ?auto_1605107 - SURFACE
      ?auto_1605108 - SURFACE
      ?auto_1605110 - SURFACE
      ?auto_1605109 - SURFACE
      ?auto_1605111 - SURFACE
      ?auto_1605112 - SURFACE
      ?auto_1605113 - SURFACE
      ?auto_1605114 - SURFACE
    )
    :vars
    (
      ?auto_1605118 - HOIST
      ?auto_1605120 - PLACE
      ?auto_1605119 - PLACE
      ?auto_1605117 - HOIST
      ?auto_1605116 - SURFACE
      ?auto_1605115 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1605118 ?auto_1605120 ) ( IS-CRATE ?auto_1605114 ) ( not ( = ?auto_1605113 ?auto_1605114 ) ) ( not ( = ?auto_1605112 ?auto_1605113 ) ) ( not ( = ?auto_1605112 ?auto_1605114 ) ) ( not ( = ?auto_1605119 ?auto_1605120 ) ) ( HOIST-AT ?auto_1605117 ?auto_1605119 ) ( not ( = ?auto_1605118 ?auto_1605117 ) ) ( AVAILABLE ?auto_1605117 ) ( SURFACE-AT ?auto_1605114 ?auto_1605119 ) ( ON ?auto_1605114 ?auto_1605116 ) ( CLEAR ?auto_1605114 ) ( not ( = ?auto_1605113 ?auto_1605116 ) ) ( not ( = ?auto_1605114 ?auto_1605116 ) ) ( not ( = ?auto_1605112 ?auto_1605116 ) ) ( TRUCK-AT ?auto_1605115 ?auto_1605120 ) ( SURFACE-AT ?auto_1605112 ?auto_1605120 ) ( CLEAR ?auto_1605112 ) ( LIFTING ?auto_1605118 ?auto_1605113 ) ( IS-CRATE ?auto_1605113 ) ( ON ?auto_1605107 ?auto_1605106 ) ( ON ?auto_1605108 ?auto_1605107 ) ( ON ?auto_1605110 ?auto_1605108 ) ( ON ?auto_1605109 ?auto_1605110 ) ( ON ?auto_1605111 ?auto_1605109 ) ( ON ?auto_1605112 ?auto_1605111 ) ( not ( = ?auto_1605106 ?auto_1605107 ) ) ( not ( = ?auto_1605106 ?auto_1605108 ) ) ( not ( = ?auto_1605106 ?auto_1605110 ) ) ( not ( = ?auto_1605106 ?auto_1605109 ) ) ( not ( = ?auto_1605106 ?auto_1605111 ) ) ( not ( = ?auto_1605106 ?auto_1605112 ) ) ( not ( = ?auto_1605106 ?auto_1605113 ) ) ( not ( = ?auto_1605106 ?auto_1605114 ) ) ( not ( = ?auto_1605106 ?auto_1605116 ) ) ( not ( = ?auto_1605107 ?auto_1605108 ) ) ( not ( = ?auto_1605107 ?auto_1605110 ) ) ( not ( = ?auto_1605107 ?auto_1605109 ) ) ( not ( = ?auto_1605107 ?auto_1605111 ) ) ( not ( = ?auto_1605107 ?auto_1605112 ) ) ( not ( = ?auto_1605107 ?auto_1605113 ) ) ( not ( = ?auto_1605107 ?auto_1605114 ) ) ( not ( = ?auto_1605107 ?auto_1605116 ) ) ( not ( = ?auto_1605108 ?auto_1605110 ) ) ( not ( = ?auto_1605108 ?auto_1605109 ) ) ( not ( = ?auto_1605108 ?auto_1605111 ) ) ( not ( = ?auto_1605108 ?auto_1605112 ) ) ( not ( = ?auto_1605108 ?auto_1605113 ) ) ( not ( = ?auto_1605108 ?auto_1605114 ) ) ( not ( = ?auto_1605108 ?auto_1605116 ) ) ( not ( = ?auto_1605110 ?auto_1605109 ) ) ( not ( = ?auto_1605110 ?auto_1605111 ) ) ( not ( = ?auto_1605110 ?auto_1605112 ) ) ( not ( = ?auto_1605110 ?auto_1605113 ) ) ( not ( = ?auto_1605110 ?auto_1605114 ) ) ( not ( = ?auto_1605110 ?auto_1605116 ) ) ( not ( = ?auto_1605109 ?auto_1605111 ) ) ( not ( = ?auto_1605109 ?auto_1605112 ) ) ( not ( = ?auto_1605109 ?auto_1605113 ) ) ( not ( = ?auto_1605109 ?auto_1605114 ) ) ( not ( = ?auto_1605109 ?auto_1605116 ) ) ( not ( = ?auto_1605111 ?auto_1605112 ) ) ( not ( = ?auto_1605111 ?auto_1605113 ) ) ( not ( = ?auto_1605111 ?auto_1605114 ) ) ( not ( = ?auto_1605111 ?auto_1605116 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1605112 ?auto_1605113 ?auto_1605114 )
      ( MAKE-8CRATE-VERIFY ?auto_1605106 ?auto_1605107 ?auto_1605108 ?auto_1605110 ?auto_1605109 ?auto_1605111 ?auto_1605112 ?auto_1605113 ?auto_1605114 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1605199 - SURFACE
      ?auto_1605200 - SURFACE
      ?auto_1605201 - SURFACE
      ?auto_1605203 - SURFACE
      ?auto_1605202 - SURFACE
      ?auto_1605204 - SURFACE
      ?auto_1605205 - SURFACE
      ?auto_1605206 - SURFACE
      ?auto_1605207 - SURFACE
    )
    :vars
    (
      ?auto_1605212 - HOIST
      ?auto_1605211 - PLACE
      ?auto_1605213 - PLACE
      ?auto_1605209 - HOIST
      ?auto_1605208 - SURFACE
      ?auto_1605210 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1605212 ?auto_1605211 ) ( IS-CRATE ?auto_1605207 ) ( not ( = ?auto_1605206 ?auto_1605207 ) ) ( not ( = ?auto_1605205 ?auto_1605206 ) ) ( not ( = ?auto_1605205 ?auto_1605207 ) ) ( not ( = ?auto_1605213 ?auto_1605211 ) ) ( HOIST-AT ?auto_1605209 ?auto_1605213 ) ( not ( = ?auto_1605212 ?auto_1605209 ) ) ( AVAILABLE ?auto_1605209 ) ( SURFACE-AT ?auto_1605207 ?auto_1605213 ) ( ON ?auto_1605207 ?auto_1605208 ) ( CLEAR ?auto_1605207 ) ( not ( = ?auto_1605206 ?auto_1605208 ) ) ( not ( = ?auto_1605207 ?auto_1605208 ) ) ( not ( = ?auto_1605205 ?auto_1605208 ) ) ( TRUCK-AT ?auto_1605210 ?auto_1605211 ) ( SURFACE-AT ?auto_1605205 ?auto_1605211 ) ( CLEAR ?auto_1605205 ) ( IS-CRATE ?auto_1605206 ) ( AVAILABLE ?auto_1605212 ) ( IN ?auto_1605206 ?auto_1605210 ) ( ON ?auto_1605200 ?auto_1605199 ) ( ON ?auto_1605201 ?auto_1605200 ) ( ON ?auto_1605203 ?auto_1605201 ) ( ON ?auto_1605202 ?auto_1605203 ) ( ON ?auto_1605204 ?auto_1605202 ) ( ON ?auto_1605205 ?auto_1605204 ) ( not ( = ?auto_1605199 ?auto_1605200 ) ) ( not ( = ?auto_1605199 ?auto_1605201 ) ) ( not ( = ?auto_1605199 ?auto_1605203 ) ) ( not ( = ?auto_1605199 ?auto_1605202 ) ) ( not ( = ?auto_1605199 ?auto_1605204 ) ) ( not ( = ?auto_1605199 ?auto_1605205 ) ) ( not ( = ?auto_1605199 ?auto_1605206 ) ) ( not ( = ?auto_1605199 ?auto_1605207 ) ) ( not ( = ?auto_1605199 ?auto_1605208 ) ) ( not ( = ?auto_1605200 ?auto_1605201 ) ) ( not ( = ?auto_1605200 ?auto_1605203 ) ) ( not ( = ?auto_1605200 ?auto_1605202 ) ) ( not ( = ?auto_1605200 ?auto_1605204 ) ) ( not ( = ?auto_1605200 ?auto_1605205 ) ) ( not ( = ?auto_1605200 ?auto_1605206 ) ) ( not ( = ?auto_1605200 ?auto_1605207 ) ) ( not ( = ?auto_1605200 ?auto_1605208 ) ) ( not ( = ?auto_1605201 ?auto_1605203 ) ) ( not ( = ?auto_1605201 ?auto_1605202 ) ) ( not ( = ?auto_1605201 ?auto_1605204 ) ) ( not ( = ?auto_1605201 ?auto_1605205 ) ) ( not ( = ?auto_1605201 ?auto_1605206 ) ) ( not ( = ?auto_1605201 ?auto_1605207 ) ) ( not ( = ?auto_1605201 ?auto_1605208 ) ) ( not ( = ?auto_1605203 ?auto_1605202 ) ) ( not ( = ?auto_1605203 ?auto_1605204 ) ) ( not ( = ?auto_1605203 ?auto_1605205 ) ) ( not ( = ?auto_1605203 ?auto_1605206 ) ) ( not ( = ?auto_1605203 ?auto_1605207 ) ) ( not ( = ?auto_1605203 ?auto_1605208 ) ) ( not ( = ?auto_1605202 ?auto_1605204 ) ) ( not ( = ?auto_1605202 ?auto_1605205 ) ) ( not ( = ?auto_1605202 ?auto_1605206 ) ) ( not ( = ?auto_1605202 ?auto_1605207 ) ) ( not ( = ?auto_1605202 ?auto_1605208 ) ) ( not ( = ?auto_1605204 ?auto_1605205 ) ) ( not ( = ?auto_1605204 ?auto_1605206 ) ) ( not ( = ?auto_1605204 ?auto_1605207 ) ) ( not ( = ?auto_1605204 ?auto_1605208 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1605205 ?auto_1605206 ?auto_1605207 )
      ( MAKE-8CRATE-VERIFY ?auto_1605199 ?auto_1605200 ?auto_1605201 ?auto_1605203 ?auto_1605202 ?auto_1605204 ?auto_1605205 ?auto_1605206 ?auto_1605207 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1609315 - SURFACE
      ?auto_1609316 - SURFACE
      ?auto_1609317 - SURFACE
      ?auto_1609319 - SURFACE
      ?auto_1609318 - SURFACE
      ?auto_1609320 - SURFACE
      ?auto_1609321 - SURFACE
      ?auto_1609322 - SURFACE
      ?auto_1609323 - SURFACE
      ?auto_1609324 - SURFACE
    )
    :vars
    (
      ?auto_1609325 - HOIST
      ?auto_1609326 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1609325 ?auto_1609326 ) ( SURFACE-AT ?auto_1609323 ?auto_1609326 ) ( CLEAR ?auto_1609323 ) ( LIFTING ?auto_1609325 ?auto_1609324 ) ( IS-CRATE ?auto_1609324 ) ( not ( = ?auto_1609323 ?auto_1609324 ) ) ( ON ?auto_1609316 ?auto_1609315 ) ( ON ?auto_1609317 ?auto_1609316 ) ( ON ?auto_1609319 ?auto_1609317 ) ( ON ?auto_1609318 ?auto_1609319 ) ( ON ?auto_1609320 ?auto_1609318 ) ( ON ?auto_1609321 ?auto_1609320 ) ( ON ?auto_1609322 ?auto_1609321 ) ( ON ?auto_1609323 ?auto_1609322 ) ( not ( = ?auto_1609315 ?auto_1609316 ) ) ( not ( = ?auto_1609315 ?auto_1609317 ) ) ( not ( = ?auto_1609315 ?auto_1609319 ) ) ( not ( = ?auto_1609315 ?auto_1609318 ) ) ( not ( = ?auto_1609315 ?auto_1609320 ) ) ( not ( = ?auto_1609315 ?auto_1609321 ) ) ( not ( = ?auto_1609315 ?auto_1609322 ) ) ( not ( = ?auto_1609315 ?auto_1609323 ) ) ( not ( = ?auto_1609315 ?auto_1609324 ) ) ( not ( = ?auto_1609316 ?auto_1609317 ) ) ( not ( = ?auto_1609316 ?auto_1609319 ) ) ( not ( = ?auto_1609316 ?auto_1609318 ) ) ( not ( = ?auto_1609316 ?auto_1609320 ) ) ( not ( = ?auto_1609316 ?auto_1609321 ) ) ( not ( = ?auto_1609316 ?auto_1609322 ) ) ( not ( = ?auto_1609316 ?auto_1609323 ) ) ( not ( = ?auto_1609316 ?auto_1609324 ) ) ( not ( = ?auto_1609317 ?auto_1609319 ) ) ( not ( = ?auto_1609317 ?auto_1609318 ) ) ( not ( = ?auto_1609317 ?auto_1609320 ) ) ( not ( = ?auto_1609317 ?auto_1609321 ) ) ( not ( = ?auto_1609317 ?auto_1609322 ) ) ( not ( = ?auto_1609317 ?auto_1609323 ) ) ( not ( = ?auto_1609317 ?auto_1609324 ) ) ( not ( = ?auto_1609319 ?auto_1609318 ) ) ( not ( = ?auto_1609319 ?auto_1609320 ) ) ( not ( = ?auto_1609319 ?auto_1609321 ) ) ( not ( = ?auto_1609319 ?auto_1609322 ) ) ( not ( = ?auto_1609319 ?auto_1609323 ) ) ( not ( = ?auto_1609319 ?auto_1609324 ) ) ( not ( = ?auto_1609318 ?auto_1609320 ) ) ( not ( = ?auto_1609318 ?auto_1609321 ) ) ( not ( = ?auto_1609318 ?auto_1609322 ) ) ( not ( = ?auto_1609318 ?auto_1609323 ) ) ( not ( = ?auto_1609318 ?auto_1609324 ) ) ( not ( = ?auto_1609320 ?auto_1609321 ) ) ( not ( = ?auto_1609320 ?auto_1609322 ) ) ( not ( = ?auto_1609320 ?auto_1609323 ) ) ( not ( = ?auto_1609320 ?auto_1609324 ) ) ( not ( = ?auto_1609321 ?auto_1609322 ) ) ( not ( = ?auto_1609321 ?auto_1609323 ) ) ( not ( = ?auto_1609321 ?auto_1609324 ) ) ( not ( = ?auto_1609322 ?auto_1609323 ) ) ( not ( = ?auto_1609322 ?auto_1609324 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1609323 ?auto_1609324 )
      ( MAKE-9CRATE-VERIFY ?auto_1609315 ?auto_1609316 ?auto_1609317 ?auto_1609319 ?auto_1609318 ?auto_1609320 ?auto_1609321 ?auto_1609322 ?auto_1609323 ?auto_1609324 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1609395 - SURFACE
      ?auto_1609396 - SURFACE
      ?auto_1609397 - SURFACE
      ?auto_1609399 - SURFACE
      ?auto_1609398 - SURFACE
      ?auto_1609400 - SURFACE
      ?auto_1609401 - SURFACE
      ?auto_1609402 - SURFACE
      ?auto_1609403 - SURFACE
      ?auto_1609404 - SURFACE
    )
    :vars
    (
      ?auto_1609406 - HOIST
      ?auto_1609407 - PLACE
      ?auto_1609405 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1609406 ?auto_1609407 ) ( SURFACE-AT ?auto_1609403 ?auto_1609407 ) ( CLEAR ?auto_1609403 ) ( IS-CRATE ?auto_1609404 ) ( not ( = ?auto_1609403 ?auto_1609404 ) ) ( TRUCK-AT ?auto_1609405 ?auto_1609407 ) ( AVAILABLE ?auto_1609406 ) ( IN ?auto_1609404 ?auto_1609405 ) ( ON ?auto_1609403 ?auto_1609402 ) ( not ( = ?auto_1609402 ?auto_1609403 ) ) ( not ( = ?auto_1609402 ?auto_1609404 ) ) ( ON ?auto_1609396 ?auto_1609395 ) ( ON ?auto_1609397 ?auto_1609396 ) ( ON ?auto_1609399 ?auto_1609397 ) ( ON ?auto_1609398 ?auto_1609399 ) ( ON ?auto_1609400 ?auto_1609398 ) ( ON ?auto_1609401 ?auto_1609400 ) ( ON ?auto_1609402 ?auto_1609401 ) ( not ( = ?auto_1609395 ?auto_1609396 ) ) ( not ( = ?auto_1609395 ?auto_1609397 ) ) ( not ( = ?auto_1609395 ?auto_1609399 ) ) ( not ( = ?auto_1609395 ?auto_1609398 ) ) ( not ( = ?auto_1609395 ?auto_1609400 ) ) ( not ( = ?auto_1609395 ?auto_1609401 ) ) ( not ( = ?auto_1609395 ?auto_1609402 ) ) ( not ( = ?auto_1609395 ?auto_1609403 ) ) ( not ( = ?auto_1609395 ?auto_1609404 ) ) ( not ( = ?auto_1609396 ?auto_1609397 ) ) ( not ( = ?auto_1609396 ?auto_1609399 ) ) ( not ( = ?auto_1609396 ?auto_1609398 ) ) ( not ( = ?auto_1609396 ?auto_1609400 ) ) ( not ( = ?auto_1609396 ?auto_1609401 ) ) ( not ( = ?auto_1609396 ?auto_1609402 ) ) ( not ( = ?auto_1609396 ?auto_1609403 ) ) ( not ( = ?auto_1609396 ?auto_1609404 ) ) ( not ( = ?auto_1609397 ?auto_1609399 ) ) ( not ( = ?auto_1609397 ?auto_1609398 ) ) ( not ( = ?auto_1609397 ?auto_1609400 ) ) ( not ( = ?auto_1609397 ?auto_1609401 ) ) ( not ( = ?auto_1609397 ?auto_1609402 ) ) ( not ( = ?auto_1609397 ?auto_1609403 ) ) ( not ( = ?auto_1609397 ?auto_1609404 ) ) ( not ( = ?auto_1609399 ?auto_1609398 ) ) ( not ( = ?auto_1609399 ?auto_1609400 ) ) ( not ( = ?auto_1609399 ?auto_1609401 ) ) ( not ( = ?auto_1609399 ?auto_1609402 ) ) ( not ( = ?auto_1609399 ?auto_1609403 ) ) ( not ( = ?auto_1609399 ?auto_1609404 ) ) ( not ( = ?auto_1609398 ?auto_1609400 ) ) ( not ( = ?auto_1609398 ?auto_1609401 ) ) ( not ( = ?auto_1609398 ?auto_1609402 ) ) ( not ( = ?auto_1609398 ?auto_1609403 ) ) ( not ( = ?auto_1609398 ?auto_1609404 ) ) ( not ( = ?auto_1609400 ?auto_1609401 ) ) ( not ( = ?auto_1609400 ?auto_1609402 ) ) ( not ( = ?auto_1609400 ?auto_1609403 ) ) ( not ( = ?auto_1609400 ?auto_1609404 ) ) ( not ( = ?auto_1609401 ?auto_1609402 ) ) ( not ( = ?auto_1609401 ?auto_1609403 ) ) ( not ( = ?auto_1609401 ?auto_1609404 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1609402 ?auto_1609403 ?auto_1609404 )
      ( MAKE-9CRATE-VERIFY ?auto_1609395 ?auto_1609396 ?auto_1609397 ?auto_1609399 ?auto_1609398 ?auto_1609400 ?auto_1609401 ?auto_1609402 ?auto_1609403 ?auto_1609404 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1609485 - SURFACE
      ?auto_1609486 - SURFACE
      ?auto_1609487 - SURFACE
      ?auto_1609489 - SURFACE
      ?auto_1609488 - SURFACE
      ?auto_1609490 - SURFACE
      ?auto_1609491 - SURFACE
      ?auto_1609492 - SURFACE
      ?auto_1609493 - SURFACE
      ?auto_1609494 - SURFACE
    )
    :vars
    (
      ?auto_1609498 - HOIST
      ?auto_1609497 - PLACE
      ?auto_1609496 - TRUCK
      ?auto_1609495 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1609498 ?auto_1609497 ) ( SURFACE-AT ?auto_1609493 ?auto_1609497 ) ( CLEAR ?auto_1609493 ) ( IS-CRATE ?auto_1609494 ) ( not ( = ?auto_1609493 ?auto_1609494 ) ) ( AVAILABLE ?auto_1609498 ) ( IN ?auto_1609494 ?auto_1609496 ) ( ON ?auto_1609493 ?auto_1609492 ) ( not ( = ?auto_1609492 ?auto_1609493 ) ) ( not ( = ?auto_1609492 ?auto_1609494 ) ) ( TRUCK-AT ?auto_1609496 ?auto_1609495 ) ( not ( = ?auto_1609495 ?auto_1609497 ) ) ( ON ?auto_1609486 ?auto_1609485 ) ( ON ?auto_1609487 ?auto_1609486 ) ( ON ?auto_1609489 ?auto_1609487 ) ( ON ?auto_1609488 ?auto_1609489 ) ( ON ?auto_1609490 ?auto_1609488 ) ( ON ?auto_1609491 ?auto_1609490 ) ( ON ?auto_1609492 ?auto_1609491 ) ( not ( = ?auto_1609485 ?auto_1609486 ) ) ( not ( = ?auto_1609485 ?auto_1609487 ) ) ( not ( = ?auto_1609485 ?auto_1609489 ) ) ( not ( = ?auto_1609485 ?auto_1609488 ) ) ( not ( = ?auto_1609485 ?auto_1609490 ) ) ( not ( = ?auto_1609485 ?auto_1609491 ) ) ( not ( = ?auto_1609485 ?auto_1609492 ) ) ( not ( = ?auto_1609485 ?auto_1609493 ) ) ( not ( = ?auto_1609485 ?auto_1609494 ) ) ( not ( = ?auto_1609486 ?auto_1609487 ) ) ( not ( = ?auto_1609486 ?auto_1609489 ) ) ( not ( = ?auto_1609486 ?auto_1609488 ) ) ( not ( = ?auto_1609486 ?auto_1609490 ) ) ( not ( = ?auto_1609486 ?auto_1609491 ) ) ( not ( = ?auto_1609486 ?auto_1609492 ) ) ( not ( = ?auto_1609486 ?auto_1609493 ) ) ( not ( = ?auto_1609486 ?auto_1609494 ) ) ( not ( = ?auto_1609487 ?auto_1609489 ) ) ( not ( = ?auto_1609487 ?auto_1609488 ) ) ( not ( = ?auto_1609487 ?auto_1609490 ) ) ( not ( = ?auto_1609487 ?auto_1609491 ) ) ( not ( = ?auto_1609487 ?auto_1609492 ) ) ( not ( = ?auto_1609487 ?auto_1609493 ) ) ( not ( = ?auto_1609487 ?auto_1609494 ) ) ( not ( = ?auto_1609489 ?auto_1609488 ) ) ( not ( = ?auto_1609489 ?auto_1609490 ) ) ( not ( = ?auto_1609489 ?auto_1609491 ) ) ( not ( = ?auto_1609489 ?auto_1609492 ) ) ( not ( = ?auto_1609489 ?auto_1609493 ) ) ( not ( = ?auto_1609489 ?auto_1609494 ) ) ( not ( = ?auto_1609488 ?auto_1609490 ) ) ( not ( = ?auto_1609488 ?auto_1609491 ) ) ( not ( = ?auto_1609488 ?auto_1609492 ) ) ( not ( = ?auto_1609488 ?auto_1609493 ) ) ( not ( = ?auto_1609488 ?auto_1609494 ) ) ( not ( = ?auto_1609490 ?auto_1609491 ) ) ( not ( = ?auto_1609490 ?auto_1609492 ) ) ( not ( = ?auto_1609490 ?auto_1609493 ) ) ( not ( = ?auto_1609490 ?auto_1609494 ) ) ( not ( = ?auto_1609491 ?auto_1609492 ) ) ( not ( = ?auto_1609491 ?auto_1609493 ) ) ( not ( = ?auto_1609491 ?auto_1609494 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1609492 ?auto_1609493 ?auto_1609494 )
      ( MAKE-9CRATE-VERIFY ?auto_1609485 ?auto_1609486 ?auto_1609487 ?auto_1609489 ?auto_1609488 ?auto_1609490 ?auto_1609491 ?auto_1609492 ?auto_1609493 ?auto_1609494 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1609584 - SURFACE
      ?auto_1609585 - SURFACE
      ?auto_1609586 - SURFACE
      ?auto_1609588 - SURFACE
      ?auto_1609587 - SURFACE
      ?auto_1609589 - SURFACE
      ?auto_1609590 - SURFACE
      ?auto_1609591 - SURFACE
      ?auto_1609592 - SURFACE
      ?auto_1609593 - SURFACE
    )
    :vars
    (
      ?auto_1609595 - HOIST
      ?auto_1609594 - PLACE
      ?auto_1609597 - TRUCK
      ?auto_1609596 - PLACE
      ?auto_1609598 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1609595 ?auto_1609594 ) ( SURFACE-AT ?auto_1609592 ?auto_1609594 ) ( CLEAR ?auto_1609592 ) ( IS-CRATE ?auto_1609593 ) ( not ( = ?auto_1609592 ?auto_1609593 ) ) ( AVAILABLE ?auto_1609595 ) ( ON ?auto_1609592 ?auto_1609591 ) ( not ( = ?auto_1609591 ?auto_1609592 ) ) ( not ( = ?auto_1609591 ?auto_1609593 ) ) ( TRUCK-AT ?auto_1609597 ?auto_1609596 ) ( not ( = ?auto_1609596 ?auto_1609594 ) ) ( HOIST-AT ?auto_1609598 ?auto_1609596 ) ( LIFTING ?auto_1609598 ?auto_1609593 ) ( not ( = ?auto_1609595 ?auto_1609598 ) ) ( ON ?auto_1609585 ?auto_1609584 ) ( ON ?auto_1609586 ?auto_1609585 ) ( ON ?auto_1609588 ?auto_1609586 ) ( ON ?auto_1609587 ?auto_1609588 ) ( ON ?auto_1609589 ?auto_1609587 ) ( ON ?auto_1609590 ?auto_1609589 ) ( ON ?auto_1609591 ?auto_1609590 ) ( not ( = ?auto_1609584 ?auto_1609585 ) ) ( not ( = ?auto_1609584 ?auto_1609586 ) ) ( not ( = ?auto_1609584 ?auto_1609588 ) ) ( not ( = ?auto_1609584 ?auto_1609587 ) ) ( not ( = ?auto_1609584 ?auto_1609589 ) ) ( not ( = ?auto_1609584 ?auto_1609590 ) ) ( not ( = ?auto_1609584 ?auto_1609591 ) ) ( not ( = ?auto_1609584 ?auto_1609592 ) ) ( not ( = ?auto_1609584 ?auto_1609593 ) ) ( not ( = ?auto_1609585 ?auto_1609586 ) ) ( not ( = ?auto_1609585 ?auto_1609588 ) ) ( not ( = ?auto_1609585 ?auto_1609587 ) ) ( not ( = ?auto_1609585 ?auto_1609589 ) ) ( not ( = ?auto_1609585 ?auto_1609590 ) ) ( not ( = ?auto_1609585 ?auto_1609591 ) ) ( not ( = ?auto_1609585 ?auto_1609592 ) ) ( not ( = ?auto_1609585 ?auto_1609593 ) ) ( not ( = ?auto_1609586 ?auto_1609588 ) ) ( not ( = ?auto_1609586 ?auto_1609587 ) ) ( not ( = ?auto_1609586 ?auto_1609589 ) ) ( not ( = ?auto_1609586 ?auto_1609590 ) ) ( not ( = ?auto_1609586 ?auto_1609591 ) ) ( not ( = ?auto_1609586 ?auto_1609592 ) ) ( not ( = ?auto_1609586 ?auto_1609593 ) ) ( not ( = ?auto_1609588 ?auto_1609587 ) ) ( not ( = ?auto_1609588 ?auto_1609589 ) ) ( not ( = ?auto_1609588 ?auto_1609590 ) ) ( not ( = ?auto_1609588 ?auto_1609591 ) ) ( not ( = ?auto_1609588 ?auto_1609592 ) ) ( not ( = ?auto_1609588 ?auto_1609593 ) ) ( not ( = ?auto_1609587 ?auto_1609589 ) ) ( not ( = ?auto_1609587 ?auto_1609590 ) ) ( not ( = ?auto_1609587 ?auto_1609591 ) ) ( not ( = ?auto_1609587 ?auto_1609592 ) ) ( not ( = ?auto_1609587 ?auto_1609593 ) ) ( not ( = ?auto_1609589 ?auto_1609590 ) ) ( not ( = ?auto_1609589 ?auto_1609591 ) ) ( not ( = ?auto_1609589 ?auto_1609592 ) ) ( not ( = ?auto_1609589 ?auto_1609593 ) ) ( not ( = ?auto_1609590 ?auto_1609591 ) ) ( not ( = ?auto_1609590 ?auto_1609592 ) ) ( not ( = ?auto_1609590 ?auto_1609593 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1609591 ?auto_1609592 ?auto_1609593 )
      ( MAKE-9CRATE-VERIFY ?auto_1609584 ?auto_1609585 ?auto_1609586 ?auto_1609588 ?auto_1609587 ?auto_1609589 ?auto_1609590 ?auto_1609591 ?auto_1609592 ?auto_1609593 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1609692 - SURFACE
      ?auto_1609693 - SURFACE
      ?auto_1609694 - SURFACE
      ?auto_1609696 - SURFACE
      ?auto_1609695 - SURFACE
      ?auto_1609697 - SURFACE
      ?auto_1609698 - SURFACE
      ?auto_1609699 - SURFACE
      ?auto_1609700 - SURFACE
      ?auto_1609701 - SURFACE
    )
    :vars
    (
      ?auto_1609706 - HOIST
      ?auto_1609705 - PLACE
      ?auto_1609707 - TRUCK
      ?auto_1609702 - PLACE
      ?auto_1609704 - HOIST
      ?auto_1609703 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1609706 ?auto_1609705 ) ( SURFACE-AT ?auto_1609700 ?auto_1609705 ) ( CLEAR ?auto_1609700 ) ( IS-CRATE ?auto_1609701 ) ( not ( = ?auto_1609700 ?auto_1609701 ) ) ( AVAILABLE ?auto_1609706 ) ( ON ?auto_1609700 ?auto_1609699 ) ( not ( = ?auto_1609699 ?auto_1609700 ) ) ( not ( = ?auto_1609699 ?auto_1609701 ) ) ( TRUCK-AT ?auto_1609707 ?auto_1609702 ) ( not ( = ?auto_1609702 ?auto_1609705 ) ) ( HOIST-AT ?auto_1609704 ?auto_1609702 ) ( not ( = ?auto_1609706 ?auto_1609704 ) ) ( AVAILABLE ?auto_1609704 ) ( SURFACE-AT ?auto_1609701 ?auto_1609702 ) ( ON ?auto_1609701 ?auto_1609703 ) ( CLEAR ?auto_1609701 ) ( not ( = ?auto_1609700 ?auto_1609703 ) ) ( not ( = ?auto_1609701 ?auto_1609703 ) ) ( not ( = ?auto_1609699 ?auto_1609703 ) ) ( ON ?auto_1609693 ?auto_1609692 ) ( ON ?auto_1609694 ?auto_1609693 ) ( ON ?auto_1609696 ?auto_1609694 ) ( ON ?auto_1609695 ?auto_1609696 ) ( ON ?auto_1609697 ?auto_1609695 ) ( ON ?auto_1609698 ?auto_1609697 ) ( ON ?auto_1609699 ?auto_1609698 ) ( not ( = ?auto_1609692 ?auto_1609693 ) ) ( not ( = ?auto_1609692 ?auto_1609694 ) ) ( not ( = ?auto_1609692 ?auto_1609696 ) ) ( not ( = ?auto_1609692 ?auto_1609695 ) ) ( not ( = ?auto_1609692 ?auto_1609697 ) ) ( not ( = ?auto_1609692 ?auto_1609698 ) ) ( not ( = ?auto_1609692 ?auto_1609699 ) ) ( not ( = ?auto_1609692 ?auto_1609700 ) ) ( not ( = ?auto_1609692 ?auto_1609701 ) ) ( not ( = ?auto_1609692 ?auto_1609703 ) ) ( not ( = ?auto_1609693 ?auto_1609694 ) ) ( not ( = ?auto_1609693 ?auto_1609696 ) ) ( not ( = ?auto_1609693 ?auto_1609695 ) ) ( not ( = ?auto_1609693 ?auto_1609697 ) ) ( not ( = ?auto_1609693 ?auto_1609698 ) ) ( not ( = ?auto_1609693 ?auto_1609699 ) ) ( not ( = ?auto_1609693 ?auto_1609700 ) ) ( not ( = ?auto_1609693 ?auto_1609701 ) ) ( not ( = ?auto_1609693 ?auto_1609703 ) ) ( not ( = ?auto_1609694 ?auto_1609696 ) ) ( not ( = ?auto_1609694 ?auto_1609695 ) ) ( not ( = ?auto_1609694 ?auto_1609697 ) ) ( not ( = ?auto_1609694 ?auto_1609698 ) ) ( not ( = ?auto_1609694 ?auto_1609699 ) ) ( not ( = ?auto_1609694 ?auto_1609700 ) ) ( not ( = ?auto_1609694 ?auto_1609701 ) ) ( not ( = ?auto_1609694 ?auto_1609703 ) ) ( not ( = ?auto_1609696 ?auto_1609695 ) ) ( not ( = ?auto_1609696 ?auto_1609697 ) ) ( not ( = ?auto_1609696 ?auto_1609698 ) ) ( not ( = ?auto_1609696 ?auto_1609699 ) ) ( not ( = ?auto_1609696 ?auto_1609700 ) ) ( not ( = ?auto_1609696 ?auto_1609701 ) ) ( not ( = ?auto_1609696 ?auto_1609703 ) ) ( not ( = ?auto_1609695 ?auto_1609697 ) ) ( not ( = ?auto_1609695 ?auto_1609698 ) ) ( not ( = ?auto_1609695 ?auto_1609699 ) ) ( not ( = ?auto_1609695 ?auto_1609700 ) ) ( not ( = ?auto_1609695 ?auto_1609701 ) ) ( not ( = ?auto_1609695 ?auto_1609703 ) ) ( not ( = ?auto_1609697 ?auto_1609698 ) ) ( not ( = ?auto_1609697 ?auto_1609699 ) ) ( not ( = ?auto_1609697 ?auto_1609700 ) ) ( not ( = ?auto_1609697 ?auto_1609701 ) ) ( not ( = ?auto_1609697 ?auto_1609703 ) ) ( not ( = ?auto_1609698 ?auto_1609699 ) ) ( not ( = ?auto_1609698 ?auto_1609700 ) ) ( not ( = ?auto_1609698 ?auto_1609701 ) ) ( not ( = ?auto_1609698 ?auto_1609703 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1609699 ?auto_1609700 ?auto_1609701 )
      ( MAKE-9CRATE-VERIFY ?auto_1609692 ?auto_1609693 ?auto_1609694 ?auto_1609696 ?auto_1609695 ?auto_1609697 ?auto_1609698 ?auto_1609699 ?auto_1609700 ?auto_1609701 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1609801 - SURFACE
      ?auto_1609802 - SURFACE
      ?auto_1609803 - SURFACE
      ?auto_1609805 - SURFACE
      ?auto_1609804 - SURFACE
      ?auto_1609806 - SURFACE
      ?auto_1609807 - SURFACE
      ?auto_1609808 - SURFACE
      ?auto_1609809 - SURFACE
      ?auto_1609810 - SURFACE
    )
    :vars
    (
      ?auto_1609815 - HOIST
      ?auto_1609813 - PLACE
      ?auto_1609811 - PLACE
      ?auto_1609816 - HOIST
      ?auto_1609812 - SURFACE
      ?auto_1609814 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1609815 ?auto_1609813 ) ( SURFACE-AT ?auto_1609809 ?auto_1609813 ) ( CLEAR ?auto_1609809 ) ( IS-CRATE ?auto_1609810 ) ( not ( = ?auto_1609809 ?auto_1609810 ) ) ( AVAILABLE ?auto_1609815 ) ( ON ?auto_1609809 ?auto_1609808 ) ( not ( = ?auto_1609808 ?auto_1609809 ) ) ( not ( = ?auto_1609808 ?auto_1609810 ) ) ( not ( = ?auto_1609811 ?auto_1609813 ) ) ( HOIST-AT ?auto_1609816 ?auto_1609811 ) ( not ( = ?auto_1609815 ?auto_1609816 ) ) ( AVAILABLE ?auto_1609816 ) ( SURFACE-AT ?auto_1609810 ?auto_1609811 ) ( ON ?auto_1609810 ?auto_1609812 ) ( CLEAR ?auto_1609810 ) ( not ( = ?auto_1609809 ?auto_1609812 ) ) ( not ( = ?auto_1609810 ?auto_1609812 ) ) ( not ( = ?auto_1609808 ?auto_1609812 ) ) ( TRUCK-AT ?auto_1609814 ?auto_1609813 ) ( ON ?auto_1609802 ?auto_1609801 ) ( ON ?auto_1609803 ?auto_1609802 ) ( ON ?auto_1609805 ?auto_1609803 ) ( ON ?auto_1609804 ?auto_1609805 ) ( ON ?auto_1609806 ?auto_1609804 ) ( ON ?auto_1609807 ?auto_1609806 ) ( ON ?auto_1609808 ?auto_1609807 ) ( not ( = ?auto_1609801 ?auto_1609802 ) ) ( not ( = ?auto_1609801 ?auto_1609803 ) ) ( not ( = ?auto_1609801 ?auto_1609805 ) ) ( not ( = ?auto_1609801 ?auto_1609804 ) ) ( not ( = ?auto_1609801 ?auto_1609806 ) ) ( not ( = ?auto_1609801 ?auto_1609807 ) ) ( not ( = ?auto_1609801 ?auto_1609808 ) ) ( not ( = ?auto_1609801 ?auto_1609809 ) ) ( not ( = ?auto_1609801 ?auto_1609810 ) ) ( not ( = ?auto_1609801 ?auto_1609812 ) ) ( not ( = ?auto_1609802 ?auto_1609803 ) ) ( not ( = ?auto_1609802 ?auto_1609805 ) ) ( not ( = ?auto_1609802 ?auto_1609804 ) ) ( not ( = ?auto_1609802 ?auto_1609806 ) ) ( not ( = ?auto_1609802 ?auto_1609807 ) ) ( not ( = ?auto_1609802 ?auto_1609808 ) ) ( not ( = ?auto_1609802 ?auto_1609809 ) ) ( not ( = ?auto_1609802 ?auto_1609810 ) ) ( not ( = ?auto_1609802 ?auto_1609812 ) ) ( not ( = ?auto_1609803 ?auto_1609805 ) ) ( not ( = ?auto_1609803 ?auto_1609804 ) ) ( not ( = ?auto_1609803 ?auto_1609806 ) ) ( not ( = ?auto_1609803 ?auto_1609807 ) ) ( not ( = ?auto_1609803 ?auto_1609808 ) ) ( not ( = ?auto_1609803 ?auto_1609809 ) ) ( not ( = ?auto_1609803 ?auto_1609810 ) ) ( not ( = ?auto_1609803 ?auto_1609812 ) ) ( not ( = ?auto_1609805 ?auto_1609804 ) ) ( not ( = ?auto_1609805 ?auto_1609806 ) ) ( not ( = ?auto_1609805 ?auto_1609807 ) ) ( not ( = ?auto_1609805 ?auto_1609808 ) ) ( not ( = ?auto_1609805 ?auto_1609809 ) ) ( not ( = ?auto_1609805 ?auto_1609810 ) ) ( not ( = ?auto_1609805 ?auto_1609812 ) ) ( not ( = ?auto_1609804 ?auto_1609806 ) ) ( not ( = ?auto_1609804 ?auto_1609807 ) ) ( not ( = ?auto_1609804 ?auto_1609808 ) ) ( not ( = ?auto_1609804 ?auto_1609809 ) ) ( not ( = ?auto_1609804 ?auto_1609810 ) ) ( not ( = ?auto_1609804 ?auto_1609812 ) ) ( not ( = ?auto_1609806 ?auto_1609807 ) ) ( not ( = ?auto_1609806 ?auto_1609808 ) ) ( not ( = ?auto_1609806 ?auto_1609809 ) ) ( not ( = ?auto_1609806 ?auto_1609810 ) ) ( not ( = ?auto_1609806 ?auto_1609812 ) ) ( not ( = ?auto_1609807 ?auto_1609808 ) ) ( not ( = ?auto_1609807 ?auto_1609809 ) ) ( not ( = ?auto_1609807 ?auto_1609810 ) ) ( not ( = ?auto_1609807 ?auto_1609812 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1609808 ?auto_1609809 ?auto_1609810 )
      ( MAKE-9CRATE-VERIFY ?auto_1609801 ?auto_1609802 ?auto_1609803 ?auto_1609805 ?auto_1609804 ?auto_1609806 ?auto_1609807 ?auto_1609808 ?auto_1609809 ?auto_1609810 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1609910 - SURFACE
      ?auto_1609911 - SURFACE
      ?auto_1609912 - SURFACE
      ?auto_1609914 - SURFACE
      ?auto_1609913 - SURFACE
      ?auto_1609915 - SURFACE
      ?auto_1609916 - SURFACE
      ?auto_1609917 - SURFACE
      ?auto_1609918 - SURFACE
      ?auto_1609919 - SURFACE
    )
    :vars
    (
      ?auto_1609921 - HOIST
      ?auto_1609924 - PLACE
      ?auto_1609925 - PLACE
      ?auto_1609920 - HOIST
      ?auto_1609922 - SURFACE
      ?auto_1609923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1609921 ?auto_1609924 ) ( IS-CRATE ?auto_1609919 ) ( not ( = ?auto_1609918 ?auto_1609919 ) ) ( not ( = ?auto_1609917 ?auto_1609918 ) ) ( not ( = ?auto_1609917 ?auto_1609919 ) ) ( not ( = ?auto_1609925 ?auto_1609924 ) ) ( HOIST-AT ?auto_1609920 ?auto_1609925 ) ( not ( = ?auto_1609921 ?auto_1609920 ) ) ( AVAILABLE ?auto_1609920 ) ( SURFACE-AT ?auto_1609919 ?auto_1609925 ) ( ON ?auto_1609919 ?auto_1609922 ) ( CLEAR ?auto_1609919 ) ( not ( = ?auto_1609918 ?auto_1609922 ) ) ( not ( = ?auto_1609919 ?auto_1609922 ) ) ( not ( = ?auto_1609917 ?auto_1609922 ) ) ( TRUCK-AT ?auto_1609923 ?auto_1609924 ) ( SURFACE-AT ?auto_1609917 ?auto_1609924 ) ( CLEAR ?auto_1609917 ) ( LIFTING ?auto_1609921 ?auto_1609918 ) ( IS-CRATE ?auto_1609918 ) ( ON ?auto_1609911 ?auto_1609910 ) ( ON ?auto_1609912 ?auto_1609911 ) ( ON ?auto_1609914 ?auto_1609912 ) ( ON ?auto_1609913 ?auto_1609914 ) ( ON ?auto_1609915 ?auto_1609913 ) ( ON ?auto_1609916 ?auto_1609915 ) ( ON ?auto_1609917 ?auto_1609916 ) ( not ( = ?auto_1609910 ?auto_1609911 ) ) ( not ( = ?auto_1609910 ?auto_1609912 ) ) ( not ( = ?auto_1609910 ?auto_1609914 ) ) ( not ( = ?auto_1609910 ?auto_1609913 ) ) ( not ( = ?auto_1609910 ?auto_1609915 ) ) ( not ( = ?auto_1609910 ?auto_1609916 ) ) ( not ( = ?auto_1609910 ?auto_1609917 ) ) ( not ( = ?auto_1609910 ?auto_1609918 ) ) ( not ( = ?auto_1609910 ?auto_1609919 ) ) ( not ( = ?auto_1609910 ?auto_1609922 ) ) ( not ( = ?auto_1609911 ?auto_1609912 ) ) ( not ( = ?auto_1609911 ?auto_1609914 ) ) ( not ( = ?auto_1609911 ?auto_1609913 ) ) ( not ( = ?auto_1609911 ?auto_1609915 ) ) ( not ( = ?auto_1609911 ?auto_1609916 ) ) ( not ( = ?auto_1609911 ?auto_1609917 ) ) ( not ( = ?auto_1609911 ?auto_1609918 ) ) ( not ( = ?auto_1609911 ?auto_1609919 ) ) ( not ( = ?auto_1609911 ?auto_1609922 ) ) ( not ( = ?auto_1609912 ?auto_1609914 ) ) ( not ( = ?auto_1609912 ?auto_1609913 ) ) ( not ( = ?auto_1609912 ?auto_1609915 ) ) ( not ( = ?auto_1609912 ?auto_1609916 ) ) ( not ( = ?auto_1609912 ?auto_1609917 ) ) ( not ( = ?auto_1609912 ?auto_1609918 ) ) ( not ( = ?auto_1609912 ?auto_1609919 ) ) ( not ( = ?auto_1609912 ?auto_1609922 ) ) ( not ( = ?auto_1609914 ?auto_1609913 ) ) ( not ( = ?auto_1609914 ?auto_1609915 ) ) ( not ( = ?auto_1609914 ?auto_1609916 ) ) ( not ( = ?auto_1609914 ?auto_1609917 ) ) ( not ( = ?auto_1609914 ?auto_1609918 ) ) ( not ( = ?auto_1609914 ?auto_1609919 ) ) ( not ( = ?auto_1609914 ?auto_1609922 ) ) ( not ( = ?auto_1609913 ?auto_1609915 ) ) ( not ( = ?auto_1609913 ?auto_1609916 ) ) ( not ( = ?auto_1609913 ?auto_1609917 ) ) ( not ( = ?auto_1609913 ?auto_1609918 ) ) ( not ( = ?auto_1609913 ?auto_1609919 ) ) ( not ( = ?auto_1609913 ?auto_1609922 ) ) ( not ( = ?auto_1609915 ?auto_1609916 ) ) ( not ( = ?auto_1609915 ?auto_1609917 ) ) ( not ( = ?auto_1609915 ?auto_1609918 ) ) ( not ( = ?auto_1609915 ?auto_1609919 ) ) ( not ( = ?auto_1609915 ?auto_1609922 ) ) ( not ( = ?auto_1609916 ?auto_1609917 ) ) ( not ( = ?auto_1609916 ?auto_1609918 ) ) ( not ( = ?auto_1609916 ?auto_1609919 ) ) ( not ( = ?auto_1609916 ?auto_1609922 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1609917 ?auto_1609918 ?auto_1609919 )
      ( MAKE-9CRATE-VERIFY ?auto_1609910 ?auto_1609911 ?auto_1609912 ?auto_1609914 ?auto_1609913 ?auto_1609915 ?auto_1609916 ?auto_1609917 ?auto_1609918 ?auto_1609919 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1610019 - SURFACE
      ?auto_1610020 - SURFACE
      ?auto_1610021 - SURFACE
      ?auto_1610023 - SURFACE
      ?auto_1610022 - SURFACE
      ?auto_1610024 - SURFACE
      ?auto_1610025 - SURFACE
      ?auto_1610026 - SURFACE
      ?auto_1610027 - SURFACE
      ?auto_1610028 - SURFACE
    )
    :vars
    (
      ?auto_1610032 - HOIST
      ?auto_1610033 - PLACE
      ?auto_1610031 - PLACE
      ?auto_1610030 - HOIST
      ?auto_1610034 - SURFACE
      ?auto_1610029 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1610032 ?auto_1610033 ) ( IS-CRATE ?auto_1610028 ) ( not ( = ?auto_1610027 ?auto_1610028 ) ) ( not ( = ?auto_1610026 ?auto_1610027 ) ) ( not ( = ?auto_1610026 ?auto_1610028 ) ) ( not ( = ?auto_1610031 ?auto_1610033 ) ) ( HOIST-AT ?auto_1610030 ?auto_1610031 ) ( not ( = ?auto_1610032 ?auto_1610030 ) ) ( AVAILABLE ?auto_1610030 ) ( SURFACE-AT ?auto_1610028 ?auto_1610031 ) ( ON ?auto_1610028 ?auto_1610034 ) ( CLEAR ?auto_1610028 ) ( not ( = ?auto_1610027 ?auto_1610034 ) ) ( not ( = ?auto_1610028 ?auto_1610034 ) ) ( not ( = ?auto_1610026 ?auto_1610034 ) ) ( TRUCK-AT ?auto_1610029 ?auto_1610033 ) ( SURFACE-AT ?auto_1610026 ?auto_1610033 ) ( CLEAR ?auto_1610026 ) ( IS-CRATE ?auto_1610027 ) ( AVAILABLE ?auto_1610032 ) ( IN ?auto_1610027 ?auto_1610029 ) ( ON ?auto_1610020 ?auto_1610019 ) ( ON ?auto_1610021 ?auto_1610020 ) ( ON ?auto_1610023 ?auto_1610021 ) ( ON ?auto_1610022 ?auto_1610023 ) ( ON ?auto_1610024 ?auto_1610022 ) ( ON ?auto_1610025 ?auto_1610024 ) ( ON ?auto_1610026 ?auto_1610025 ) ( not ( = ?auto_1610019 ?auto_1610020 ) ) ( not ( = ?auto_1610019 ?auto_1610021 ) ) ( not ( = ?auto_1610019 ?auto_1610023 ) ) ( not ( = ?auto_1610019 ?auto_1610022 ) ) ( not ( = ?auto_1610019 ?auto_1610024 ) ) ( not ( = ?auto_1610019 ?auto_1610025 ) ) ( not ( = ?auto_1610019 ?auto_1610026 ) ) ( not ( = ?auto_1610019 ?auto_1610027 ) ) ( not ( = ?auto_1610019 ?auto_1610028 ) ) ( not ( = ?auto_1610019 ?auto_1610034 ) ) ( not ( = ?auto_1610020 ?auto_1610021 ) ) ( not ( = ?auto_1610020 ?auto_1610023 ) ) ( not ( = ?auto_1610020 ?auto_1610022 ) ) ( not ( = ?auto_1610020 ?auto_1610024 ) ) ( not ( = ?auto_1610020 ?auto_1610025 ) ) ( not ( = ?auto_1610020 ?auto_1610026 ) ) ( not ( = ?auto_1610020 ?auto_1610027 ) ) ( not ( = ?auto_1610020 ?auto_1610028 ) ) ( not ( = ?auto_1610020 ?auto_1610034 ) ) ( not ( = ?auto_1610021 ?auto_1610023 ) ) ( not ( = ?auto_1610021 ?auto_1610022 ) ) ( not ( = ?auto_1610021 ?auto_1610024 ) ) ( not ( = ?auto_1610021 ?auto_1610025 ) ) ( not ( = ?auto_1610021 ?auto_1610026 ) ) ( not ( = ?auto_1610021 ?auto_1610027 ) ) ( not ( = ?auto_1610021 ?auto_1610028 ) ) ( not ( = ?auto_1610021 ?auto_1610034 ) ) ( not ( = ?auto_1610023 ?auto_1610022 ) ) ( not ( = ?auto_1610023 ?auto_1610024 ) ) ( not ( = ?auto_1610023 ?auto_1610025 ) ) ( not ( = ?auto_1610023 ?auto_1610026 ) ) ( not ( = ?auto_1610023 ?auto_1610027 ) ) ( not ( = ?auto_1610023 ?auto_1610028 ) ) ( not ( = ?auto_1610023 ?auto_1610034 ) ) ( not ( = ?auto_1610022 ?auto_1610024 ) ) ( not ( = ?auto_1610022 ?auto_1610025 ) ) ( not ( = ?auto_1610022 ?auto_1610026 ) ) ( not ( = ?auto_1610022 ?auto_1610027 ) ) ( not ( = ?auto_1610022 ?auto_1610028 ) ) ( not ( = ?auto_1610022 ?auto_1610034 ) ) ( not ( = ?auto_1610024 ?auto_1610025 ) ) ( not ( = ?auto_1610024 ?auto_1610026 ) ) ( not ( = ?auto_1610024 ?auto_1610027 ) ) ( not ( = ?auto_1610024 ?auto_1610028 ) ) ( not ( = ?auto_1610024 ?auto_1610034 ) ) ( not ( = ?auto_1610025 ?auto_1610026 ) ) ( not ( = ?auto_1610025 ?auto_1610027 ) ) ( not ( = ?auto_1610025 ?auto_1610028 ) ) ( not ( = ?auto_1610025 ?auto_1610034 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1610026 ?auto_1610027 ?auto_1610028 )
      ( MAKE-9CRATE-VERIFY ?auto_1610019 ?auto_1610020 ?auto_1610021 ?auto_1610023 ?auto_1610022 ?auto_1610024 ?auto_1610025 ?auto_1610026 ?auto_1610027 ?auto_1610028 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1612253 - SURFACE
      ?auto_1612254 - SURFACE
    )
    :vars
    (
      ?auto_1612259 - HOIST
      ?auto_1612260 - PLACE
      ?auto_1612255 - SURFACE
      ?auto_1612261 - TRUCK
      ?auto_1612257 - PLACE
      ?auto_1612258 - HOIST
      ?auto_1612256 - SURFACE
      ?auto_1612262 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1612259 ?auto_1612260 ) ( SURFACE-AT ?auto_1612253 ?auto_1612260 ) ( CLEAR ?auto_1612253 ) ( IS-CRATE ?auto_1612254 ) ( not ( = ?auto_1612253 ?auto_1612254 ) ) ( AVAILABLE ?auto_1612259 ) ( ON ?auto_1612253 ?auto_1612255 ) ( not ( = ?auto_1612255 ?auto_1612253 ) ) ( not ( = ?auto_1612255 ?auto_1612254 ) ) ( TRUCK-AT ?auto_1612261 ?auto_1612257 ) ( not ( = ?auto_1612257 ?auto_1612260 ) ) ( HOIST-AT ?auto_1612258 ?auto_1612257 ) ( not ( = ?auto_1612259 ?auto_1612258 ) ) ( SURFACE-AT ?auto_1612254 ?auto_1612257 ) ( ON ?auto_1612254 ?auto_1612256 ) ( CLEAR ?auto_1612254 ) ( not ( = ?auto_1612253 ?auto_1612256 ) ) ( not ( = ?auto_1612254 ?auto_1612256 ) ) ( not ( = ?auto_1612255 ?auto_1612256 ) ) ( LIFTING ?auto_1612258 ?auto_1612262 ) ( IS-CRATE ?auto_1612262 ) ( not ( = ?auto_1612253 ?auto_1612262 ) ) ( not ( = ?auto_1612254 ?auto_1612262 ) ) ( not ( = ?auto_1612255 ?auto_1612262 ) ) ( not ( = ?auto_1612256 ?auto_1612262 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1612258 ?auto_1612262 ?auto_1612261 ?auto_1612257 )
      ( MAKE-1CRATE ?auto_1612253 ?auto_1612254 )
      ( MAKE-1CRATE-VERIFY ?auto_1612253 ?auto_1612254 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1615570 - SURFACE
      ?auto_1615571 - SURFACE
      ?auto_1615572 - SURFACE
      ?auto_1615574 - SURFACE
      ?auto_1615573 - SURFACE
      ?auto_1615575 - SURFACE
      ?auto_1615576 - SURFACE
      ?auto_1615577 - SURFACE
      ?auto_1615578 - SURFACE
      ?auto_1615579 - SURFACE
      ?auto_1615580 - SURFACE
    )
    :vars
    (
      ?auto_1615582 - HOIST
      ?auto_1615581 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1615582 ?auto_1615581 ) ( SURFACE-AT ?auto_1615579 ?auto_1615581 ) ( CLEAR ?auto_1615579 ) ( LIFTING ?auto_1615582 ?auto_1615580 ) ( IS-CRATE ?auto_1615580 ) ( not ( = ?auto_1615579 ?auto_1615580 ) ) ( ON ?auto_1615571 ?auto_1615570 ) ( ON ?auto_1615572 ?auto_1615571 ) ( ON ?auto_1615574 ?auto_1615572 ) ( ON ?auto_1615573 ?auto_1615574 ) ( ON ?auto_1615575 ?auto_1615573 ) ( ON ?auto_1615576 ?auto_1615575 ) ( ON ?auto_1615577 ?auto_1615576 ) ( ON ?auto_1615578 ?auto_1615577 ) ( ON ?auto_1615579 ?auto_1615578 ) ( not ( = ?auto_1615570 ?auto_1615571 ) ) ( not ( = ?auto_1615570 ?auto_1615572 ) ) ( not ( = ?auto_1615570 ?auto_1615574 ) ) ( not ( = ?auto_1615570 ?auto_1615573 ) ) ( not ( = ?auto_1615570 ?auto_1615575 ) ) ( not ( = ?auto_1615570 ?auto_1615576 ) ) ( not ( = ?auto_1615570 ?auto_1615577 ) ) ( not ( = ?auto_1615570 ?auto_1615578 ) ) ( not ( = ?auto_1615570 ?auto_1615579 ) ) ( not ( = ?auto_1615570 ?auto_1615580 ) ) ( not ( = ?auto_1615571 ?auto_1615572 ) ) ( not ( = ?auto_1615571 ?auto_1615574 ) ) ( not ( = ?auto_1615571 ?auto_1615573 ) ) ( not ( = ?auto_1615571 ?auto_1615575 ) ) ( not ( = ?auto_1615571 ?auto_1615576 ) ) ( not ( = ?auto_1615571 ?auto_1615577 ) ) ( not ( = ?auto_1615571 ?auto_1615578 ) ) ( not ( = ?auto_1615571 ?auto_1615579 ) ) ( not ( = ?auto_1615571 ?auto_1615580 ) ) ( not ( = ?auto_1615572 ?auto_1615574 ) ) ( not ( = ?auto_1615572 ?auto_1615573 ) ) ( not ( = ?auto_1615572 ?auto_1615575 ) ) ( not ( = ?auto_1615572 ?auto_1615576 ) ) ( not ( = ?auto_1615572 ?auto_1615577 ) ) ( not ( = ?auto_1615572 ?auto_1615578 ) ) ( not ( = ?auto_1615572 ?auto_1615579 ) ) ( not ( = ?auto_1615572 ?auto_1615580 ) ) ( not ( = ?auto_1615574 ?auto_1615573 ) ) ( not ( = ?auto_1615574 ?auto_1615575 ) ) ( not ( = ?auto_1615574 ?auto_1615576 ) ) ( not ( = ?auto_1615574 ?auto_1615577 ) ) ( not ( = ?auto_1615574 ?auto_1615578 ) ) ( not ( = ?auto_1615574 ?auto_1615579 ) ) ( not ( = ?auto_1615574 ?auto_1615580 ) ) ( not ( = ?auto_1615573 ?auto_1615575 ) ) ( not ( = ?auto_1615573 ?auto_1615576 ) ) ( not ( = ?auto_1615573 ?auto_1615577 ) ) ( not ( = ?auto_1615573 ?auto_1615578 ) ) ( not ( = ?auto_1615573 ?auto_1615579 ) ) ( not ( = ?auto_1615573 ?auto_1615580 ) ) ( not ( = ?auto_1615575 ?auto_1615576 ) ) ( not ( = ?auto_1615575 ?auto_1615577 ) ) ( not ( = ?auto_1615575 ?auto_1615578 ) ) ( not ( = ?auto_1615575 ?auto_1615579 ) ) ( not ( = ?auto_1615575 ?auto_1615580 ) ) ( not ( = ?auto_1615576 ?auto_1615577 ) ) ( not ( = ?auto_1615576 ?auto_1615578 ) ) ( not ( = ?auto_1615576 ?auto_1615579 ) ) ( not ( = ?auto_1615576 ?auto_1615580 ) ) ( not ( = ?auto_1615577 ?auto_1615578 ) ) ( not ( = ?auto_1615577 ?auto_1615579 ) ) ( not ( = ?auto_1615577 ?auto_1615580 ) ) ( not ( = ?auto_1615578 ?auto_1615579 ) ) ( not ( = ?auto_1615578 ?auto_1615580 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1615579 ?auto_1615580 )
      ( MAKE-10CRATE-VERIFY ?auto_1615570 ?auto_1615571 ?auto_1615572 ?auto_1615574 ?auto_1615573 ?auto_1615575 ?auto_1615576 ?auto_1615577 ?auto_1615578 ?auto_1615579 ?auto_1615580 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1615664 - SURFACE
      ?auto_1615665 - SURFACE
      ?auto_1615666 - SURFACE
      ?auto_1615668 - SURFACE
      ?auto_1615667 - SURFACE
      ?auto_1615669 - SURFACE
      ?auto_1615670 - SURFACE
      ?auto_1615671 - SURFACE
      ?auto_1615672 - SURFACE
      ?auto_1615673 - SURFACE
      ?auto_1615674 - SURFACE
    )
    :vars
    (
      ?auto_1615675 - HOIST
      ?auto_1615677 - PLACE
      ?auto_1615676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1615675 ?auto_1615677 ) ( SURFACE-AT ?auto_1615673 ?auto_1615677 ) ( CLEAR ?auto_1615673 ) ( IS-CRATE ?auto_1615674 ) ( not ( = ?auto_1615673 ?auto_1615674 ) ) ( TRUCK-AT ?auto_1615676 ?auto_1615677 ) ( AVAILABLE ?auto_1615675 ) ( IN ?auto_1615674 ?auto_1615676 ) ( ON ?auto_1615673 ?auto_1615672 ) ( not ( = ?auto_1615672 ?auto_1615673 ) ) ( not ( = ?auto_1615672 ?auto_1615674 ) ) ( ON ?auto_1615665 ?auto_1615664 ) ( ON ?auto_1615666 ?auto_1615665 ) ( ON ?auto_1615668 ?auto_1615666 ) ( ON ?auto_1615667 ?auto_1615668 ) ( ON ?auto_1615669 ?auto_1615667 ) ( ON ?auto_1615670 ?auto_1615669 ) ( ON ?auto_1615671 ?auto_1615670 ) ( ON ?auto_1615672 ?auto_1615671 ) ( not ( = ?auto_1615664 ?auto_1615665 ) ) ( not ( = ?auto_1615664 ?auto_1615666 ) ) ( not ( = ?auto_1615664 ?auto_1615668 ) ) ( not ( = ?auto_1615664 ?auto_1615667 ) ) ( not ( = ?auto_1615664 ?auto_1615669 ) ) ( not ( = ?auto_1615664 ?auto_1615670 ) ) ( not ( = ?auto_1615664 ?auto_1615671 ) ) ( not ( = ?auto_1615664 ?auto_1615672 ) ) ( not ( = ?auto_1615664 ?auto_1615673 ) ) ( not ( = ?auto_1615664 ?auto_1615674 ) ) ( not ( = ?auto_1615665 ?auto_1615666 ) ) ( not ( = ?auto_1615665 ?auto_1615668 ) ) ( not ( = ?auto_1615665 ?auto_1615667 ) ) ( not ( = ?auto_1615665 ?auto_1615669 ) ) ( not ( = ?auto_1615665 ?auto_1615670 ) ) ( not ( = ?auto_1615665 ?auto_1615671 ) ) ( not ( = ?auto_1615665 ?auto_1615672 ) ) ( not ( = ?auto_1615665 ?auto_1615673 ) ) ( not ( = ?auto_1615665 ?auto_1615674 ) ) ( not ( = ?auto_1615666 ?auto_1615668 ) ) ( not ( = ?auto_1615666 ?auto_1615667 ) ) ( not ( = ?auto_1615666 ?auto_1615669 ) ) ( not ( = ?auto_1615666 ?auto_1615670 ) ) ( not ( = ?auto_1615666 ?auto_1615671 ) ) ( not ( = ?auto_1615666 ?auto_1615672 ) ) ( not ( = ?auto_1615666 ?auto_1615673 ) ) ( not ( = ?auto_1615666 ?auto_1615674 ) ) ( not ( = ?auto_1615668 ?auto_1615667 ) ) ( not ( = ?auto_1615668 ?auto_1615669 ) ) ( not ( = ?auto_1615668 ?auto_1615670 ) ) ( not ( = ?auto_1615668 ?auto_1615671 ) ) ( not ( = ?auto_1615668 ?auto_1615672 ) ) ( not ( = ?auto_1615668 ?auto_1615673 ) ) ( not ( = ?auto_1615668 ?auto_1615674 ) ) ( not ( = ?auto_1615667 ?auto_1615669 ) ) ( not ( = ?auto_1615667 ?auto_1615670 ) ) ( not ( = ?auto_1615667 ?auto_1615671 ) ) ( not ( = ?auto_1615667 ?auto_1615672 ) ) ( not ( = ?auto_1615667 ?auto_1615673 ) ) ( not ( = ?auto_1615667 ?auto_1615674 ) ) ( not ( = ?auto_1615669 ?auto_1615670 ) ) ( not ( = ?auto_1615669 ?auto_1615671 ) ) ( not ( = ?auto_1615669 ?auto_1615672 ) ) ( not ( = ?auto_1615669 ?auto_1615673 ) ) ( not ( = ?auto_1615669 ?auto_1615674 ) ) ( not ( = ?auto_1615670 ?auto_1615671 ) ) ( not ( = ?auto_1615670 ?auto_1615672 ) ) ( not ( = ?auto_1615670 ?auto_1615673 ) ) ( not ( = ?auto_1615670 ?auto_1615674 ) ) ( not ( = ?auto_1615671 ?auto_1615672 ) ) ( not ( = ?auto_1615671 ?auto_1615673 ) ) ( not ( = ?auto_1615671 ?auto_1615674 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1615672 ?auto_1615673 ?auto_1615674 )
      ( MAKE-10CRATE-VERIFY ?auto_1615664 ?auto_1615665 ?auto_1615666 ?auto_1615668 ?auto_1615667 ?auto_1615669 ?auto_1615670 ?auto_1615671 ?auto_1615672 ?auto_1615673 ?auto_1615674 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1615769 - SURFACE
      ?auto_1615770 - SURFACE
      ?auto_1615771 - SURFACE
      ?auto_1615773 - SURFACE
      ?auto_1615772 - SURFACE
      ?auto_1615774 - SURFACE
      ?auto_1615775 - SURFACE
      ?auto_1615776 - SURFACE
      ?auto_1615777 - SURFACE
      ?auto_1615778 - SURFACE
      ?auto_1615779 - SURFACE
    )
    :vars
    (
      ?auto_1615783 - HOIST
      ?auto_1615782 - PLACE
      ?auto_1615780 - TRUCK
      ?auto_1615781 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1615783 ?auto_1615782 ) ( SURFACE-AT ?auto_1615778 ?auto_1615782 ) ( CLEAR ?auto_1615778 ) ( IS-CRATE ?auto_1615779 ) ( not ( = ?auto_1615778 ?auto_1615779 ) ) ( AVAILABLE ?auto_1615783 ) ( IN ?auto_1615779 ?auto_1615780 ) ( ON ?auto_1615778 ?auto_1615777 ) ( not ( = ?auto_1615777 ?auto_1615778 ) ) ( not ( = ?auto_1615777 ?auto_1615779 ) ) ( TRUCK-AT ?auto_1615780 ?auto_1615781 ) ( not ( = ?auto_1615781 ?auto_1615782 ) ) ( ON ?auto_1615770 ?auto_1615769 ) ( ON ?auto_1615771 ?auto_1615770 ) ( ON ?auto_1615773 ?auto_1615771 ) ( ON ?auto_1615772 ?auto_1615773 ) ( ON ?auto_1615774 ?auto_1615772 ) ( ON ?auto_1615775 ?auto_1615774 ) ( ON ?auto_1615776 ?auto_1615775 ) ( ON ?auto_1615777 ?auto_1615776 ) ( not ( = ?auto_1615769 ?auto_1615770 ) ) ( not ( = ?auto_1615769 ?auto_1615771 ) ) ( not ( = ?auto_1615769 ?auto_1615773 ) ) ( not ( = ?auto_1615769 ?auto_1615772 ) ) ( not ( = ?auto_1615769 ?auto_1615774 ) ) ( not ( = ?auto_1615769 ?auto_1615775 ) ) ( not ( = ?auto_1615769 ?auto_1615776 ) ) ( not ( = ?auto_1615769 ?auto_1615777 ) ) ( not ( = ?auto_1615769 ?auto_1615778 ) ) ( not ( = ?auto_1615769 ?auto_1615779 ) ) ( not ( = ?auto_1615770 ?auto_1615771 ) ) ( not ( = ?auto_1615770 ?auto_1615773 ) ) ( not ( = ?auto_1615770 ?auto_1615772 ) ) ( not ( = ?auto_1615770 ?auto_1615774 ) ) ( not ( = ?auto_1615770 ?auto_1615775 ) ) ( not ( = ?auto_1615770 ?auto_1615776 ) ) ( not ( = ?auto_1615770 ?auto_1615777 ) ) ( not ( = ?auto_1615770 ?auto_1615778 ) ) ( not ( = ?auto_1615770 ?auto_1615779 ) ) ( not ( = ?auto_1615771 ?auto_1615773 ) ) ( not ( = ?auto_1615771 ?auto_1615772 ) ) ( not ( = ?auto_1615771 ?auto_1615774 ) ) ( not ( = ?auto_1615771 ?auto_1615775 ) ) ( not ( = ?auto_1615771 ?auto_1615776 ) ) ( not ( = ?auto_1615771 ?auto_1615777 ) ) ( not ( = ?auto_1615771 ?auto_1615778 ) ) ( not ( = ?auto_1615771 ?auto_1615779 ) ) ( not ( = ?auto_1615773 ?auto_1615772 ) ) ( not ( = ?auto_1615773 ?auto_1615774 ) ) ( not ( = ?auto_1615773 ?auto_1615775 ) ) ( not ( = ?auto_1615773 ?auto_1615776 ) ) ( not ( = ?auto_1615773 ?auto_1615777 ) ) ( not ( = ?auto_1615773 ?auto_1615778 ) ) ( not ( = ?auto_1615773 ?auto_1615779 ) ) ( not ( = ?auto_1615772 ?auto_1615774 ) ) ( not ( = ?auto_1615772 ?auto_1615775 ) ) ( not ( = ?auto_1615772 ?auto_1615776 ) ) ( not ( = ?auto_1615772 ?auto_1615777 ) ) ( not ( = ?auto_1615772 ?auto_1615778 ) ) ( not ( = ?auto_1615772 ?auto_1615779 ) ) ( not ( = ?auto_1615774 ?auto_1615775 ) ) ( not ( = ?auto_1615774 ?auto_1615776 ) ) ( not ( = ?auto_1615774 ?auto_1615777 ) ) ( not ( = ?auto_1615774 ?auto_1615778 ) ) ( not ( = ?auto_1615774 ?auto_1615779 ) ) ( not ( = ?auto_1615775 ?auto_1615776 ) ) ( not ( = ?auto_1615775 ?auto_1615777 ) ) ( not ( = ?auto_1615775 ?auto_1615778 ) ) ( not ( = ?auto_1615775 ?auto_1615779 ) ) ( not ( = ?auto_1615776 ?auto_1615777 ) ) ( not ( = ?auto_1615776 ?auto_1615778 ) ) ( not ( = ?auto_1615776 ?auto_1615779 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1615777 ?auto_1615778 ?auto_1615779 )
      ( MAKE-10CRATE-VERIFY ?auto_1615769 ?auto_1615770 ?auto_1615771 ?auto_1615773 ?auto_1615772 ?auto_1615774 ?auto_1615775 ?auto_1615776 ?auto_1615777 ?auto_1615778 ?auto_1615779 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1615884 - SURFACE
      ?auto_1615885 - SURFACE
      ?auto_1615886 - SURFACE
      ?auto_1615888 - SURFACE
      ?auto_1615887 - SURFACE
      ?auto_1615889 - SURFACE
      ?auto_1615890 - SURFACE
      ?auto_1615891 - SURFACE
      ?auto_1615892 - SURFACE
      ?auto_1615893 - SURFACE
      ?auto_1615894 - SURFACE
    )
    :vars
    (
      ?auto_1615897 - HOIST
      ?auto_1615898 - PLACE
      ?auto_1615895 - TRUCK
      ?auto_1615896 - PLACE
      ?auto_1615899 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1615897 ?auto_1615898 ) ( SURFACE-AT ?auto_1615893 ?auto_1615898 ) ( CLEAR ?auto_1615893 ) ( IS-CRATE ?auto_1615894 ) ( not ( = ?auto_1615893 ?auto_1615894 ) ) ( AVAILABLE ?auto_1615897 ) ( ON ?auto_1615893 ?auto_1615892 ) ( not ( = ?auto_1615892 ?auto_1615893 ) ) ( not ( = ?auto_1615892 ?auto_1615894 ) ) ( TRUCK-AT ?auto_1615895 ?auto_1615896 ) ( not ( = ?auto_1615896 ?auto_1615898 ) ) ( HOIST-AT ?auto_1615899 ?auto_1615896 ) ( LIFTING ?auto_1615899 ?auto_1615894 ) ( not ( = ?auto_1615897 ?auto_1615899 ) ) ( ON ?auto_1615885 ?auto_1615884 ) ( ON ?auto_1615886 ?auto_1615885 ) ( ON ?auto_1615888 ?auto_1615886 ) ( ON ?auto_1615887 ?auto_1615888 ) ( ON ?auto_1615889 ?auto_1615887 ) ( ON ?auto_1615890 ?auto_1615889 ) ( ON ?auto_1615891 ?auto_1615890 ) ( ON ?auto_1615892 ?auto_1615891 ) ( not ( = ?auto_1615884 ?auto_1615885 ) ) ( not ( = ?auto_1615884 ?auto_1615886 ) ) ( not ( = ?auto_1615884 ?auto_1615888 ) ) ( not ( = ?auto_1615884 ?auto_1615887 ) ) ( not ( = ?auto_1615884 ?auto_1615889 ) ) ( not ( = ?auto_1615884 ?auto_1615890 ) ) ( not ( = ?auto_1615884 ?auto_1615891 ) ) ( not ( = ?auto_1615884 ?auto_1615892 ) ) ( not ( = ?auto_1615884 ?auto_1615893 ) ) ( not ( = ?auto_1615884 ?auto_1615894 ) ) ( not ( = ?auto_1615885 ?auto_1615886 ) ) ( not ( = ?auto_1615885 ?auto_1615888 ) ) ( not ( = ?auto_1615885 ?auto_1615887 ) ) ( not ( = ?auto_1615885 ?auto_1615889 ) ) ( not ( = ?auto_1615885 ?auto_1615890 ) ) ( not ( = ?auto_1615885 ?auto_1615891 ) ) ( not ( = ?auto_1615885 ?auto_1615892 ) ) ( not ( = ?auto_1615885 ?auto_1615893 ) ) ( not ( = ?auto_1615885 ?auto_1615894 ) ) ( not ( = ?auto_1615886 ?auto_1615888 ) ) ( not ( = ?auto_1615886 ?auto_1615887 ) ) ( not ( = ?auto_1615886 ?auto_1615889 ) ) ( not ( = ?auto_1615886 ?auto_1615890 ) ) ( not ( = ?auto_1615886 ?auto_1615891 ) ) ( not ( = ?auto_1615886 ?auto_1615892 ) ) ( not ( = ?auto_1615886 ?auto_1615893 ) ) ( not ( = ?auto_1615886 ?auto_1615894 ) ) ( not ( = ?auto_1615888 ?auto_1615887 ) ) ( not ( = ?auto_1615888 ?auto_1615889 ) ) ( not ( = ?auto_1615888 ?auto_1615890 ) ) ( not ( = ?auto_1615888 ?auto_1615891 ) ) ( not ( = ?auto_1615888 ?auto_1615892 ) ) ( not ( = ?auto_1615888 ?auto_1615893 ) ) ( not ( = ?auto_1615888 ?auto_1615894 ) ) ( not ( = ?auto_1615887 ?auto_1615889 ) ) ( not ( = ?auto_1615887 ?auto_1615890 ) ) ( not ( = ?auto_1615887 ?auto_1615891 ) ) ( not ( = ?auto_1615887 ?auto_1615892 ) ) ( not ( = ?auto_1615887 ?auto_1615893 ) ) ( not ( = ?auto_1615887 ?auto_1615894 ) ) ( not ( = ?auto_1615889 ?auto_1615890 ) ) ( not ( = ?auto_1615889 ?auto_1615891 ) ) ( not ( = ?auto_1615889 ?auto_1615892 ) ) ( not ( = ?auto_1615889 ?auto_1615893 ) ) ( not ( = ?auto_1615889 ?auto_1615894 ) ) ( not ( = ?auto_1615890 ?auto_1615891 ) ) ( not ( = ?auto_1615890 ?auto_1615892 ) ) ( not ( = ?auto_1615890 ?auto_1615893 ) ) ( not ( = ?auto_1615890 ?auto_1615894 ) ) ( not ( = ?auto_1615891 ?auto_1615892 ) ) ( not ( = ?auto_1615891 ?auto_1615893 ) ) ( not ( = ?auto_1615891 ?auto_1615894 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1615892 ?auto_1615893 ?auto_1615894 )
      ( MAKE-10CRATE-VERIFY ?auto_1615884 ?auto_1615885 ?auto_1615886 ?auto_1615888 ?auto_1615887 ?auto_1615889 ?auto_1615890 ?auto_1615891 ?auto_1615892 ?auto_1615893 ?auto_1615894 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1616009 - SURFACE
      ?auto_1616010 - SURFACE
      ?auto_1616011 - SURFACE
      ?auto_1616013 - SURFACE
      ?auto_1616012 - SURFACE
      ?auto_1616014 - SURFACE
      ?auto_1616015 - SURFACE
      ?auto_1616016 - SURFACE
      ?auto_1616017 - SURFACE
      ?auto_1616018 - SURFACE
      ?auto_1616019 - SURFACE
    )
    :vars
    (
      ?auto_1616024 - HOIST
      ?auto_1616021 - PLACE
      ?auto_1616022 - TRUCK
      ?auto_1616023 - PLACE
      ?auto_1616025 - HOIST
      ?auto_1616020 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1616024 ?auto_1616021 ) ( SURFACE-AT ?auto_1616018 ?auto_1616021 ) ( CLEAR ?auto_1616018 ) ( IS-CRATE ?auto_1616019 ) ( not ( = ?auto_1616018 ?auto_1616019 ) ) ( AVAILABLE ?auto_1616024 ) ( ON ?auto_1616018 ?auto_1616017 ) ( not ( = ?auto_1616017 ?auto_1616018 ) ) ( not ( = ?auto_1616017 ?auto_1616019 ) ) ( TRUCK-AT ?auto_1616022 ?auto_1616023 ) ( not ( = ?auto_1616023 ?auto_1616021 ) ) ( HOIST-AT ?auto_1616025 ?auto_1616023 ) ( not ( = ?auto_1616024 ?auto_1616025 ) ) ( AVAILABLE ?auto_1616025 ) ( SURFACE-AT ?auto_1616019 ?auto_1616023 ) ( ON ?auto_1616019 ?auto_1616020 ) ( CLEAR ?auto_1616019 ) ( not ( = ?auto_1616018 ?auto_1616020 ) ) ( not ( = ?auto_1616019 ?auto_1616020 ) ) ( not ( = ?auto_1616017 ?auto_1616020 ) ) ( ON ?auto_1616010 ?auto_1616009 ) ( ON ?auto_1616011 ?auto_1616010 ) ( ON ?auto_1616013 ?auto_1616011 ) ( ON ?auto_1616012 ?auto_1616013 ) ( ON ?auto_1616014 ?auto_1616012 ) ( ON ?auto_1616015 ?auto_1616014 ) ( ON ?auto_1616016 ?auto_1616015 ) ( ON ?auto_1616017 ?auto_1616016 ) ( not ( = ?auto_1616009 ?auto_1616010 ) ) ( not ( = ?auto_1616009 ?auto_1616011 ) ) ( not ( = ?auto_1616009 ?auto_1616013 ) ) ( not ( = ?auto_1616009 ?auto_1616012 ) ) ( not ( = ?auto_1616009 ?auto_1616014 ) ) ( not ( = ?auto_1616009 ?auto_1616015 ) ) ( not ( = ?auto_1616009 ?auto_1616016 ) ) ( not ( = ?auto_1616009 ?auto_1616017 ) ) ( not ( = ?auto_1616009 ?auto_1616018 ) ) ( not ( = ?auto_1616009 ?auto_1616019 ) ) ( not ( = ?auto_1616009 ?auto_1616020 ) ) ( not ( = ?auto_1616010 ?auto_1616011 ) ) ( not ( = ?auto_1616010 ?auto_1616013 ) ) ( not ( = ?auto_1616010 ?auto_1616012 ) ) ( not ( = ?auto_1616010 ?auto_1616014 ) ) ( not ( = ?auto_1616010 ?auto_1616015 ) ) ( not ( = ?auto_1616010 ?auto_1616016 ) ) ( not ( = ?auto_1616010 ?auto_1616017 ) ) ( not ( = ?auto_1616010 ?auto_1616018 ) ) ( not ( = ?auto_1616010 ?auto_1616019 ) ) ( not ( = ?auto_1616010 ?auto_1616020 ) ) ( not ( = ?auto_1616011 ?auto_1616013 ) ) ( not ( = ?auto_1616011 ?auto_1616012 ) ) ( not ( = ?auto_1616011 ?auto_1616014 ) ) ( not ( = ?auto_1616011 ?auto_1616015 ) ) ( not ( = ?auto_1616011 ?auto_1616016 ) ) ( not ( = ?auto_1616011 ?auto_1616017 ) ) ( not ( = ?auto_1616011 ?auto_1616018 ) ) ( not ( = ?auto_1616011 ?auto_1616019 ) ) ( not ( = ?auto_1616011 ?auto_1616020 ) ) ( not ( = ?auto_1616013 ?auto_1616012 ) ) ( not ( = ?auto_1616013 ?auto_1616014 ) ) ( not ( = ?auto_1616013 ?auto_1616015 ) ) ( not ( = ?auto_1616013 ?auto_1616016 ) ) ( not ( = ?auto_1616013 ?auto_1616017 ) ) ( not ( = ?auto_1616013 ?auto_1616018 ) ) ( not ( = ?auto_1616013 ?auto_1616019 ) ) ( not ( = ?auto_1616013 ?auto_1616020 ) ) ( not ( = ?auto_1616012 ?auto_1616014 ) ) ( not ( = ?auto_1616012 ?auto_1616015 ) ) ( not ( = ?auto_1616012 ?auto_1616016 ) ) ( not ( = ?auto_1616012 ?auto_1616017 ) ) ( not ( = ?auto_1616012 ?auto_1616018 ) ) ( not ( = ?auto_1616012 ?auto_1616019 ) ) ( not ( = ?auto_1616012 ?auto_1616020 ) ) ( not ( = ?auto_1616014 ?auto_1616015 ) ) ( not ( = ?auto_1616014 ?auto_1616016 ) ) ( not ( = ?auto_1616014 ?auto_1616017 ) ) ( not ( = ?auto_1616014 ?auto_1616018 ) ) ( not ( = ?auto_1616014 ?auto_1616019 ) ) ( not ( = ?auto_1616014 ?auto_1616020 ) ) ( not ( = ?auto_1616015 ?auto_1616016 ) ) ( not ( = ?auto_1616015 ?auto_1616017 ) ) ( not ( = ?auto_1616015 ?auto_1616018 ) ) ( not ( = ?auto_1616015 ?auto_1616019 ) ) ( not ( = ?auto_1616015 ?auto_1616020 ) ) ( not ( = ?auto_1616016 ?auto_1616017 ) ) ( not ( = ?auto_1616016 ?auto_1616018 ) ) ( not ( = ?auto_1616016 ?auto_1616019 ) ) ( not ( = ?auto_1616016 ?auto_1616020 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1616017 ?auto_1616018 ?auto_1616019 )
      ( MAKE-10CRATE-VERIFY ?auto_1616009 ?auto_1616010 ?auto_1616011 ?auto_1616013 ?auto_1616012 ?auto_1616014 ?auto_1616015 ?auto_1616016 ?auto_1616017 ?auto_1616018 ?auto_1616019 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1616135 - SURFACE
      ?auto_1616136 - SURFACE
      ?auto_1616137 - SURFACE
      ?auto_1616139 - SURFACE
      ?auto_1616138 - SURFACE
      ?auto_1616140 - SURFACE
      ?auto_1616141 - SURFACE
      ?auto_1616142 - SURFACE
      ?auto_1616143 - SURFACE
      ?auto_1616144 - SURFACE
      ?auto_1616145 - SURFACE
    )
    :vars
    (
      ?auto_1616149 - HOIST
      ?auto_1616151 - PLACE
      ?auto_1616150 - PLACE
      ?auto_1616148 - HOIST
      ?auto_1616147 - SURFACE
      ?auto_1616146 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1616149 ?auto_1616151 ) ( SURFACE-AT ?auto_1616144 ?auto_1616151 ) ( CLEAR ?auto_1616144 ) ( IS-CRATE ?auto_1616145 ) ( not ( = ?auto_1616144 ?auto_1616145 ) ) ( AVAILABLE ?auto_1616149 ) ( ON ?auto_1616144 ?auto_1616143 ) ( not ( = ?auto_1616143 ?auto_1616144 ) ) ( not ( = ?auto_1616143 ?auto_1616145 ) ) ( not ( = ?auto_1616150 ?auto_1616151 ) ) ( HOIST-AT ?auto_1616148 ?auto_1616150 ) ( not ( = ?auto_1616149 ?auto_1616148 ) ) ( AVAILABLE ?auto_1616148 ) ( SURFACE-AT ?auto_1616145 ?auto_1616150 ) ( ON ?auto_1616145 ?auto_1616147 ) ( CLEAR ?auto_1616145 ) ( not ( = ?auto_1616144 ?auto_1616147 ) ) ( not ( = ?auto_1616145 ?auto_1616147 ) ) ( not ( = ?auto_1616143 ?auto_1616147 ) ) ( TRUCK-AT ?auto_1616146 ?auto_1616151 ) ( ON ?auto_1616136 ?auto_1616135 ) ( ON ?auto_1616137 ?auto_1616136 ) ( ON ?auto_1616139 ?auto_1616137 ) ( ON ?auto_1616138 ?auto_1616139 ) ( ON ?auto_1616140 ?auto_1616138 ) ( ON ?auto_1616141 ?auto_1616140 ) ( ON ?auto_1616142 ?auto_1616141 ) ( ON ?auto_1616143 ?auto_1616142 ) ( not ( = ?auto_1616135 ?auto_1616136 ) ) ( not ( = ?auto_1616135 ?auto_1616137 ) ) ( not ( = ?auto_1616135 ?auto_1616139 ) ) ( not ( = ?auto_1616135 ?auto_1616138 ) ) ( not ( = ?auto_1616135 ?auto_1616140 ) ) ( not ( = ?auto_1616135 ?auto_1616141 ) ) ( not ( = ?auto_1616135 ?auto_1616142 ) ) ( not ( = ?auto_1616135 ?auto_1616143 ) ) ( not ( = ?auto_1616135 ?auto_1616144 ) ) ( not ( = ?auto_1616135 ?auto_1616145 ) ) ( not ( = ?auto_1616135 ?auto_1616147 ) ) ( not ( = ?auto_1616136 ?auto_1616137 ) ) ( not ( = ?auto_1616136 ?auto_1616139 ) ) ( not ( = ?auto_1616136 ?auto_1616138 ) ) ( not ( = ?auto_1616136 ?auto_1616140 ) ) ( not ( = ?auto_1616136 ?auto_1616141 ) ) ( not ( = ?auto_1616136 ?auto_1616142 ) ) ( not ( = ?auto_1616136 ?auto_1616143 ) ) ( not ( = ?auto_1616136 ?auto_1616144 ) ) ( not ( = ?auto_1616136 ?auto_1616145 ) ) ( not ( = ?auto_1616136 ?auto_1616147 ) ) ( not ( = ?auto_1616137 ?auto_1616139 ) ) ( not ( = ?auto_1616137 ?auto_1616138 ) ) ( not ( = ?auto_1616137 ?auto_1616140 ) ) ( not ( = ?auto_1616137 ?auto_1616141 ) ) ( not ( = ?auto_1616137 ?auto_1616142 ) ) ( not ( = ?auto_1616137 ?auto_1616143 ) ) ( not ( = ?auto_1616137 ?auto_1616144 ) ) ( not ( = ?auto_1616137 ?auto_1616145 ) ) ( not ( = ?auto_1616137 ?auto_1616147 ) ) ( not ( = ?auto_1616139 ?auto_1616138 ) ) ( not ( = ?auto_1616139 ?auto_1616140 ) ) ( not ( = ?auto_1616139 ?auto_1616141 ) ) ( not ( = ?auto_1616139 ?auto_1616142 ) ) ( not ( = ?auto_1616139 ?auto_1616143 ) ) ( not ( = ?auto_1616139 ?auto_1616144 ) ) ( not ( = ?auto_1616139 ?auto_1616145 ) ) ( not ( = ?auto_1616139 ?auto_1616147 ) ) ( not ( = ?auto_1616138 ?auto_1616140 ) ) ( not ( = ?auto_1616138 ?auto_1616141 ) ) ( not ( = ?auto_1616138 ?auto_1616142 ) ) ( not ( = ?auto_1616138 ?auto_1616143 ) ) ( not ( = ?auto_1616138 ?auto_1616144 ) ) ( not ( = ?auto_1616138 ?auto_1616145 ) ) ( not ( = ?auto_1616138 ?auto_1616147 ) ) ( not ( = ?auto_1616140 ?auto_1616141 ) ) ( not ( = ?auto_1616140 ?auto_1616142 ) ) ( not ( = ?auto_1616140 ?auto_1616143 ) ) ( not ( = ?auto_1616140 ?auto_1616144 ) ) ( not ( = ?auto_1616140 ?auto_1616145 ) ) ( not ( = ?auto_1616140 ?auto_1616147 ) ) ( not ( = ?auto_1616141 ?auto_1616142 ) ) ( not ( = ?auto_1616141 ?auto_1616143 ) ) ( not ( = ?auto_1616141 ?auto_1616144 ) ) ( not ( = ?auto_1616141 ?auto_1616145 ) ) ( not ( = ?auto_1616141 ?auto_1616147 ) ) ( not ( = ?auto_1616142 ?auto_1616143 ) ) ( not ( = ?auto_1616142 ?auto_1616144 ) ) ( not ( = ?auto_1616142 ?auto_1616145 ) ) ( not ( = ?auto_1616142 ?auto_1616147 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1616143 ?auto_1616144 ?auto_1616145 )
      ( MAKE-10CRATE-VERIFY ?auto_1616135 ?auto_1616136 ?auto_1616137 ?auto_1616139 ?auto_1616138 ?auto_1616140 ?auto_1616141 ?auto_1616142 ?auto_1616143 ?auto_1616144 ?auto_1616145 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1616261 - SURFACE
      ?auto_1616262 - SURFACE
      ?auto_1616263 - SURFACE
      ?auto_1616265 - SURFACE
      ?auto_1616264 - SURFACE
      ?auto_1616266 - SURFACE
      ?auto_1616267 - SURFACE
      ?auto_1616268 - SURFACE
      ?auto_1616269 - SURFACE
      ?auto_1616270 - SURFACE
      ?auto_1616271 - SURFACE
    )
    :vars
    (
      ?auto_1616273 - HOIST
      ?auto_1616277 - PLACE
      ?auto_1616274 - PLACE
      ?auto_1616275 - HOIST
      ?auto_1616272 - SURFACE
      ?auto_1616276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1616273 ?auto_1616277 ) ( IS-CRATE ?auto_1616271 ) ( not ( = ?auto_1616270 ?auto_1616271 ) ) ( not ( = ?auto_1616269 ?auto_1616270 ) ) ( not ( = ?auto_1616269 ?auto_1616271 ) ) ( not ( = ?auto_1616274 ?auto_1616277 ) ) ( HOIST-AT ?auto_1616275 ?auto_1616274 ) ( not ( = ?auto_1616273 ?auto_1616275 ) ) ( AVAILABLE ?auto_1616275 ) ( SURFACE-AT ?auto_1616271 ?auto_1616274 ) ( ON ?auto_1616271 ?auto_1616272 ) ( CLEAR ?auto_1616271 ) ( not ( = ?auto_1616270 ?auto_1616272 ) ) ( not ( = ?auto_1616271 ?auto_1616272 ) ) ( not ( = ?auto_1616269 ?auto_1616272 ) ) ( TRUCK-AT ?auto_1616276 ?auto_1616277 ) ( SURFACE-AT ?auto_1616269 ?auto_1616277 ) ( CLEAR ?auto_1616269 ) ( LIFTING ?auto_1616273 ?auto_1616270 ) ( IS-CRATE ?auto_1616270 ) ( ON ?auto_1616262 ?auto_1616261 ) ( ON ?auto_1616263 ?auto_1616262 ) ( ON ?auto_1616265 ?auto_1616263 ) ( ON ?auto_1616264 ?auto_1616265 ) ( ON ?auto_1616266 ?auto_1616264 ) ( ON ?auto_1616267 ?auto_1616266 ) ( ON ?auto_1616268 ?auto_1616267 ) ( ON ?auto_1616269 ?auto_1616268 ) ( not ( = ?auto_1616261 ?auto_1616262 ) ) ( not ( = ?auto_1616261 ?auto_1616263 ) ) ( not ( = ?auto_1616261 ?auto_1616265 ) ) ( not ( = ?auto_1616261 ?auto_1616264 ) ) ( not ( = ?auto_1616261 ?auto_1616266 ) ) ( not ( = ?auto_1616261 ?auto_1616267 ) ) ( not ( = ?auto_1616261 ?auto_1616268 ) ) ( not ( = ?auto_1616261 ?auto_1616269 ) ) ( not ( = ?auto_1616261 ?auto_1616270 ) ) ( not ( = ?auto_1616261 ?auto_1616271 ) ) ( not ( = ?auto_1616261 ?auto_1616272 ) ) ( not ( = ?auto_1616262 ?auto_1616263 ) ) ( not ( = ?auto_1616262 ?auto_1616265 ) ) ( not ( = ?auto_1616262 ?auto_1616264 ) ) ( not ( = ?auto_1616262 ?auto_1616266 ) ) ( not ( = ?auto_1616262 ?auto_1616267 ) ) ( not ( = ?auto_1616262 ?auto_1616268 ) ) ( not ( = ?auto_1616262 ?auto_1616269 ) ) ( not ( = ?auto_1616262 ?auto_1616270 ) ) ( not ( = ?auto_1616262 ?auto_1616271 ) ) ( not ( = ?auto_1616262 ?auto_1616272 ) ) ( not ( = ?auto_1616263 ?auto_1616265 ) ) ( not ( = ?auto_1616263 ?auto_1616264 ) ) ( not ( = ?auto_1616263 ?auto_1616266 ) ) ( not ( = ?auto_1616263 ?auto_1616267 ) ) ( not ( = ?auto_1616263 ?auto_1616268 ) ) ( not ( = ?auto_1616263 ?auto_1616269 ) ) ( not ( = ?auto_1616263 ?auto_1616270 ) ) ( not ( = ?auto_1616263 ?auto_1616271 ) ) ( not ( = ?auto_1616263 ?auto_1616272 ) ) ( not ( = ?auto_1616265 ?auto_1616264 ) ) ( not ( = ?auto_1616265 ?auto_1616266 ) ) ( not ( = ?auto_1616265 ?auto_1616267 ) ) ( not ( = ?auto_1616265 ?auto_1616268 ) ) ( not ( = ?auto_1616265 ?auto_1616269 ) ) ( not ( = ?auto_1616265 ?auto_1616270 ) ) ( not ( = ?auto_1616265 ?auto_1616271 ) ) ( not ( = ?auto_1616265 ?auto_1616272 ) ) ( not ( = ?auto_1616264 ?auto_1616266 ) ) ( not ( = ?auto_1616264 ?auto_1616267 ) ) ( not ( = ?auto_1616264 ?auto_1616268 ) ) ( not ( = ?auto_1616264 ?auto_1616269 ) ) ( not ( = ?auto_1616264 ?auto_1616270 ) ) ( not ( = ?auto_1616264 ?auto_1616271 ) ) ( not ( = ?auto_1616264 ?auto_1616272 ) ) ( not ( = ?auto_1616266 ?auto_1616267 ) ) ( not ( = ?auto_1616266 ?auto_1616268 ) ) ( not ( = ?auto_1616266 ?auto_1616269 ) ) ( not ( = ?auto_1616266 ?auto_1616270 ) ) ( not ( = ?auto_1616266 ?auto_1616271 ) ) ( not ( = ?auto_1616266 ?auto_1616272 ) ) ( not ( = ?auto_1616267 ?auto_1616268 ) ) ( not ( = ?auto_1616267 ?auto_1616269 ) ) ( not ( = ?auto_1616267 ?auto_1616270 ) ) ( not ( = ?auto_1616267 ?auto_1616271 ) ) ( not ( = ?auto_1616267 ?auto_1616272 ) ) ( not ( = ?auto_1616268 ?auto_1616269 ) ) ( not ( = ?auto_1616268 ?auto_1616270 ) ) ( not ( = ?auto_1616268 ?auto_1616271 ) ) ( not ( = ?auto_1616268 ?auto_1616272 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1616269 ?auto_1616270 ?auto_1616271 )
      ( MAKE-10CRATE-VERIFY ?auto_1616261 ?auto_1616262 ?auto_1616263 ?auto_1616265 ?auto_1616264 ?auto_1616266 ?auto_1616267 ?auto_1616268 ?auto_1616269 ?auto_1616270 ?auto_1616271 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1616387 - SURFACE
      ?auto_1616388 - SURFACE
      ?auto_1616389 - SURFACE
      ?auto_1616391 - SURFACE
      ?auto_1616390 - SURFACE
      ?auto_1616392 - SURFACE
      ?auto_1616393 - SURFACE
      ?auto_1616394 - SURFACE
      ?auto_1616395 - SURFACE
      ?auto_1616396 - SURFACE
      ?auto_1616397 - SURFACE
    )
    :vars
    (
      ?auto_1616402 - HOIST
      ?auto_1616401 - PLACE
      ?auto_1616400 - PLACE
      ?auto_1616398 - HOIST
      ?auto_1616399 - SURFACE
      ?auto_1616403 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1616402 ?auto_1616401 ) ( IS-CRATE ?auto_1616397 ) ( not ( = ?auto_1616396 ?auto_1616397 ) ) ( not ( = ?auto_1616395 ?auto_1616396 ) ) ( not ( = ?auto_1616395 ?auto_1616397 ) ) ( not ( = ?auto_1616400 ?auto_1616401 ) ) ( HOIST-AT ?auto_1616398 ?auto_1616400 ) ( not ( = ?auto_1616402 ?auto_1616398 ) ) ( AVAILABLE ?auto_1616398 ) ( SURFACE-AT ?auto_1616397 ?auto_1616400 ) ( ON ?auto_1616397 ?auto_1616399 ) ( CLEAR ?auto_1616397 ) ( not ( = ?auto_1616396 ?auto_1616399 ) ) ( not ( = ?auto_1616397 ?auto_1616399 ) ) ( not ( = ?auto_1616395 ?auto_1616399 ) ) ( TRUCK-AT ?auto_1616403 ?auto_1616401 ) ( SURFACE-AT ?auto_1616395 ?auto_1616401 ) ( CLEAR ?auto_1616395 ) ( IS-CRATE ?auto_1616396 ) ( AVAILABLE ?auto_1616402 ) ( IN ?auto_1616396 ?auto_1616403 ) ( ON ?auto_1616388 ?auto_1616387 ) ( ON ?auto_1616389 ?auto_1616388 ) ( ON ?auto_1616391 ?auto_1616389 ) ( ON ?auto_1616390 ?auto_1616391 ) ( ON ?auto_1616392 ?auto_1616390 ) ( ON ?auto_1616393 ?auto_1616392 ) ( ON ?auto_1616394 ?auto_1616393 ) ( ON ?auto_1616395 ?auto_1616394 ) ( not ( = ?auto_1616387 ?auto_1616388 ) ) ( not ( = ?auto_1616387 ?auto_1616389 ) ) ( not ( = ?auto_1616387 ?auto_1616391 ) ) ( not ( = ?auto_1616387 ?auto_1616390 ) ) ( not ( = ?auto_1616387 ?auto_1616392 ) ) ( not ( = ?auto_1616387 ?auto_1616393 ) ) ( not ( = ?auto_1616387 ?auto_1616394 ) ) ( not ( = ?auto_1616387 ?auto_1616395 ) ) ( not ( = ?auto_1616387 ?auto_1616396 ) ) ( not ( = ?auto_1616387 ?auto_1616397 ) ) ( not ( = ?auto_1616387 ?auto_1616399 ) ) ( not ( = ?auto_1616388 ?auto_1616389 ) ) ( not ( = ?auto_1616388 ?auto_1616391 ) ) ( not ( = ?auto_1616388 ?auto_1616390 ) ) ( not ( = ?auto_1616388 ?auto_1616392 ) ) ( not ( = ?auto_1616388 ?auto_1616393 ) ) ( not ( = ?auto_1616388 ?auto_1616394 ) ) ( not ( = ?auto_1616388 ?auto_1616395 ) ) ( not ( = ?auto_1616388 ?auto_1616396 ) ) ( not ( = ?auto_1616388 ?auto_1616397 ) ) ( not ( = ?auto_1616388 ?auto_1616399 ) ) ( not ( = ?auto_1616389 ?auto_1616391 ) ) ( not ( = ?auto_1616389 ?auto_1616390 ) ) ( not ( = ?auto_1616389 ?auto_1616392 ) ) ( not ( = ?auto_1616389 ?auto_1616393 ) ) ( not ( = ?auto_1616389 ?auto_1616394 ) ) ( not ( = ?auto_1616389 ?auto_1616395 ) ) ( not ( = ?auto_1616389 ?auto_1616396 ) ) ( not ( = ?auto_1616389 ?auto_1616397 ) ) ( not ( = ?auto_1616389 ?auto_1616399 ) ) ( not ( = ?auto_1616391 ?auto_1616390 ) ) ( not ( = ?auto_1616391 ?auto_1616392 ) ) ( not ( = ?auto_1616391 ?auto_1616393 ) ) ( not ( = ?auto_1616391 ?auto_1616394 ) ) ( not ( = ?auto_1616391 ?auto_1616395 ) ) ( not ( = ?auto_1616391 ?auto_1616396 ) ) ( not ( = ?auto_1616391 ?auto_1616397 ) ) ( not ( = ?auto_1616391 ?auto_1616399 ) ) ( not ( = ?auto_1616390 ?auto_1616392 ) ) ( not ( = ?auto_1616390 ?auto_1616393 ) ) ( not ( = ?auto_1616390 ?auto_1616394 ) ) ( not ( = ?auto_1616390 ?auto_1616395 ) ) ( not ( = ?auto_1616390 ?auto_1616396 ) ) ( not ( = ?auto_1616390 ?auto_1616397 ) ) ( not ( = ?auto_1616390 ?auto_1616399 ) ) ( not ( = ?auto_1616392 ?auto_1616393 ) ) ( not ( = ?auto_1616392 ?auto_1616394 ) ) ( not ( = ?auto_1616392 ?auto_1616395 ) ) ( not ( = ?auto_1616392 ?auto_1616396 ) ) ( not ( = ?auto_1616392 ?auto_1616397 ) ) ( not ( = ?auto_1616392 ?auto_1616399 ) ) ( not ( = ?auto_1616393 ?auto_1616394 ) ) ( not ( = ?auto_1616393 ?auto_1616395 ) ) ( not ( = ?auto_1616393 ?auto_1616396 ) ) ( not ( = ?auto_1616393 ?auto_1616397 ) ) ( not ( = ?auto_1616393 ?auto_1616399 ) ) ( not ( = ?auto_1616394 ?auto_1616395 ) ) ( not ( = ?auto_1616394 ?auto_1616396 ) ) ( not ( = ?auto_1616394 ?auto_1616397 ) ) ( not ( = ?auto_1616394 ?auto_1616399 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1616395 ?auto_1616396 ?auto_1616397 )
      ( MAKE-10CRATE-VERIFY ?auto_1616387 ?auto_1616388 ?auto_1616389 ?auto_1616391 ?auto_1616390 ?auto_1616392 ?auto_1616393 ?auto_1616394 ?auto_1616395 ?auto_1616396 ?auto_1616397 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1623655 - SURFACE
      ?auto_1623656 - SURFACE
      ?auto_1623657 - SURFACE
      ?auto_1623659 - SURFACE
      ?auto_1623658 - SURFACE
      ?auto_1623660 - SURFACE
      ?auto_1623661 - SURFACE
      ?auto_1623662 - SURFACE
      ?auto_1623663 - SURFACE
      ?auto_1623664 - SURFACE
      ?auto_1623665 - SURFACE
      ?auto_1623666 - SURFACE
    )
    :vars
    (
      ?auto_1623667 - HOIST
      ?auto_1623668 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1623667 ?auto_1623668 ) ( SURFACE-AT ?auto_1623665 ?auto_1623668 ) ( CLEAR ?auto_1623665 ) ( LIFTING ?auto_1623667 ?auto_1623666 ) ( IS-CRATE ?auto_1623666 ) ( not ( = ?auto_1623665 ?auto_1623666 ) ) ( ON ?auto_1623656 ?auto_1623655 ) ( ON ?auto_1623657 ?auto_1623656 ) ( ON ?auto_1623659 ?auto_1623657 ) ( ON ?auto_1623658 ?auto_1623659 ) ( ON ?auto_1623660 ?auto_1623658 ) ( ON ?auto_1623661 ?auto_1623660 ) ( ON ?auto_1623662 ?auto_1623661 ) ( ON ?auto_1623663 ?auto_1623662 ) ( ON ?auto_1623664 ?auto_1623663 ) ( ON ?auto_1623665 ?auto_1623664 ) ( not ( = ?auto_1623655 ?auto_1623656 ) ) ( not ( = ?auto_1623655 ?auto_1623657 ) ) ( not ( = ?auto_1623655 ?auto_1623659 ) ) ( not ( = ?auto_1623655 ?auto_1623658 ) ) ( not ( = ?auto_1623655 ?auto_1623660 ) ) ( not ( = ?auto_1623655 ?auto_1623661 ) ) ( not ( = ?auto_1623655 ?auto_1623662 ) ) ( not ( = ?auto_1623655 ?auto_1623663 ) ) ( not ( = ?auto_1623655 ?auto_1623664 ) ) ( not ( = ?auto_1623655 ?auto_1623665 ) ) ( not ( = ?auto_1623655 ?auto_1623666 ) ) ( not ( = ?auto_1623656 ?auto_1623657 ) ) ( not ( = ?auto_1623656 ?auto_1623659 ) ) ( not ( = ?auto_1623656 ?auto_1623658 ) ) ( not ( = ?auto_1623656 ?auto_1623660 ) ) ( not ( = ?auto_1623656 ?auto_1623661 ) ) ( not ( = ?auto_1623656 ?auto_1623662 ) ) ( not ( = ?auto_1623656 ?auto_1623663 ) ) ( not ( = ?auto_1623656 ?auto_1623664 ) ) ( not ( = ?auto_1623656 ?auto_1623665 ) ) ( not ( = ?auto_1623656 ?auto_1623666 ) ) ( not ( = ?auto_1623657 ?auto_1623659 ) ) ( not ( = ?auto_1623657 ?auto_1623658 ) ) ( not ( = ?auto_1623657 ?auto_1623660 ) ) ( not ( = ?auto_1623657 ?auto_1623661 ) ) ( not ( = ?auto_1623657 ?auto_1623662 ) ) ( not ( = ?auto_1623657 ?auto_1623663 ) ) ( not ( = ?auto_1623657 ?auto_1623664 ) ) ( not ( = ?auto_1623657 ?auto_1623665 ) ) ( not ( = ?auto_1623657 ?auto_1623666 ) ) ( not ( = ?auto_1623659 ?auto_1623658 ) ) ( not ( = ?auto_1623659 ?auto_1623660 ) ) ( not ( = ?auto_1623659 ?auto_1623661 ) ) ( not ( = ?auto_1623659 ?auto_1623662 ) ) ( not ( = ?auto_1623659 ?auto_1623663 ) ) ( not ( = ?auto_1623659 ?auto_1623664 ) ) ( not ( = ?auto_1623659 ?auto_1623665 ) ) ( not ( = ?auto_1623659 ?auto_1623666 ) ) ( not ( = ?auto_1623658 ?auto_1623660 ) ) ( not ( = ?auto_1623658 ?auto_1623661 ) ) ( not ( = ?auto_1623658 ?auto_1623662 ) ) ( not ( = ?auto_1623658 ?auto_1623663 ) ) ( not ( = ?auto_1623658 ?auto_1623664 ) ) ( not ( = ?auto_1623658 ?auto_1623665 ) ) ( not ( = ?auto_1623658 ?auto_1623666 ) ) ( not ( = ?auto_1623660 ?auto_1623661 ) ) ( not ( = ?auto_1623660 ?auto_1623662 ) ) ( not ( = ?auto_1623660 ?auto_1623663 ) ) ( not ( = ?auto_1623660 ?auto_1623664 ) ) ( not ( = ?auto_1623660 ?auto_1623665 ) ) ( not ( = ?auto_1623660 ?auto_1623666 ) ) ( not ( = ?auto_1623661 ?auto_1623662 ) ) ( not ( = ?auto_1623661 ?auto_1623663 ) ) ( not ( = ?auto_1623661 ?auto_1623664 ) ) ( not ( = ?auto_1623661 ?auto_1623665 ) ) ( not ( = ?auto_1623661 ?auto_1623666 ) ) ( not ( = ?auto_1623662 ?auto_1623663 ) ) ( not ( = ?auto_1623662 ?auto_1623664 ) ) ( not ( = ?auto_1623662 ?auto_1623665 ) ) ( not ( = ?auto_1623662 ?auto_1623666 ) ) ( not ( = ?auto_1623663 ?auto_1623664 ) ) ( not ( = ?auto_1623663 ?auto_1623665 ) ) ( not ( = ?auto_1623663 ?auto_1623666 ) ) ( not ( = ?auto_1623664 ?auto_1623665 ) ) ( not ( = ?auto_1623664 ?auto_1623666 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1623665 ?auto_1623666 )
      ( MAKE-11CRATE-VERIFY ?auto_1623655 ?auto_1623656 ?auto_1623657 ?auto_1623659 ?auto_1623658 ?auto_1623660 ?auto_1623661 ?auto_1623662 ?auto_1623663 ?auto_1623664 ?auto_1623665 ?auto_1623666 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1623764 - SURFACE
      ?auto_1623765 - SURFACE
      ?auto_1623766 - SURFACE
      ?auto_1623768 - SURFACE
      ?auto_1623767 - SURFACE
      ?auto_1623769 - SURFACE
      ?auto_1623770 - SURFACE
      ?auto_1623771 - SURFACE
      ?auto_1623772 - SURFACE
      ?auto_1623773 - SURFACE
      ?auto_1623774 - SURFACE
      ?auto_1623775 - SURFACE
    )
    :vars
    (
      ?auto_1623778 - HOIST
      ?auto_1623777 - PLACE
      ?auto_1623776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1623778 ?auto_1623777 ) ( SURFACE-AT ?auto_1623774 ?auto_1623777 ) ( CLEAR ?auto_1623774 ) ( IS-CRATE ?auto_1623775 ) ( not ( = ?auto_1623774 ?auto_1623775 ) ) ( TRUCK-AT ?auto_1623776 ?auto_1623777 ) ( AVAILABLE ?auto_1623778 ) ( IN ?auto_1623775 ?auto_1623776 ) ( ON ?auto_1623774 ?auto_1623773 ) ( not ( = ?auto_1623773 ?auto_1623774 ) ) ( not ( = ?auto_1623773 ?auto_1623775 ) ) ( ON ?auto_1623765 ?auto_1623764 ) ( ON ?auto_1623766 ?auto_1623765 ) ( ON ?auto_1623768 ?auto_1623766 ) ( ON ?auto_1623767 ?auto_1623768 ) ( ON ?auto_1623769 ?auto_1623767 ) ( ON ?auto_1623770 ?auto_1623769 ) ( ON ?auto_1623771 ?auto_1623770 ) ( ON ?auto_1623772 ?auto_1623771 ) ( ON ?auto_1623773 ?auto_1623772 ) ( not ( = ?auto_1623764 ?auto_1623765 ) ) ( not ( = ?auto_1623764 ?auto_1623766 ) ) ( not ( = ?auto_1623764 ?auto_1623768 ) ) ( not ( = ?auto_1623764 ?auto_1623767 ) ) ( not ( = ?auto_1623764 ?auto_1623769 ) ) ( not ( = ?auto_1623764 ?auto_1623770 ) ) ( not ( = ?auto_1623764 ?auto_1623771 ) ) ( not ( = ?auto_1623764 ?auto_1623772 ) ) ( not ( = ?auto_1623764 ?auto_1623773 ) ) ( not ( = ?auto_1623764 ?auto_1623774 ) ) ( not ( = ?auto_1623764 ?auto_1623775 ) ) ( not ( = ?auto_1623765 ?auto_1623766 ) ) ( not ( = ?auto_1623765 ?auto_1623768 ) ) ( not ( = ?auto_1623765 ?auto_1623767 ) ) ( not ( = ?auto_1623765 ?auto_1623769 ) ) ( not ( = ?auto_1623765 ?auto_1623770 ) ) ( not ( = ?auto_1623765 ?auto_1623771 ) ) ( not ( = ?auto_1623765 ?auto_1623772 ) ) ( not ( = ?auto_1623765 ?auto_1623773 ) ) ( not ( = ?auto_1623765 ?auto_1623774 ) ) ( not ( = ?auto_1623765 ?auto_1623775 ) ) ( not ( = ?auto_1623766 ?auto_1623768 ) ) ( not ( = ?auto_1623766 ?auto_1623767 ) ) ( not ( = ?auto_1623766 ?auto_1623769 ) ) ( not ( = ?auto_1623766 ?auto_1623770 ) ) ( not ( = ?auto_1623766 ?auto_1623771 ) ) ( not ( = ?auto_1623766 ?auto_1623772 ) ) ( not ( = ?auto_1623766 ?auto_1623773 ) ) ( not ( = ?auto_1623766 ?auto_1623774 ) ) ( not ( = ?auto_1623766 ?auto_1623775 ) ) ( not ( = ?auto_1623768 ?auto_1623767 ) ) ( not ( = ?auto_1623768 ?auto_1623769 ) ) ( not ( = ?auto_1623768 ?auto_1623770 ) ) ( not ( = ?auto_1623768 ?auto_1623771 ) ) ( not ( = ?auto_1623768 ?auto_1623772 ) ) ( not ( = ?auto_1623768 ?auto_1623773 ) ) ( not ( = ?auto_1623768 ?auto_1623774 ) ) ( not ( = ?auto_1623768 ?auto_1623775 ) ) ( not ( = ?auto_1623767 ?auto_1623769 ) ) ( not ( = ?auto_1623767 ?auto_1623770 ) ) ( not ( = ?auto_1623767 ?auto_1623771 ) ) ( not ( = ?auto_1623767 ?auto_1623772 ) ) ( not ( = ?auto_1623767 ?auto_1623773 ) ) ( not ( = ?auto_1623767 ?auto_1623774 ) ) ( not ( = ?auto_1623767 ?auto_1623775 ) ) ( not ( = ?auto_1623769 ?auto_1623770 ) ) ( not ( = ?auto_1623769 ?auto_1623771 ) ) ( not ( = ?auto_1623769 ?auto_1623772 ) ) ( not ( = ?auto_1623769 ?auto_1623773 ) ) ( not ( = ?auto_1623769 ?auto_1623774 ) ) ( not ( = ?auto_1623769 ?auto_1623775 ) ) ( not ( = ?auto_1623770 ?auto_1623771 ) ) ( not ( = ?auto_1623770 ?auto_1623772 ) ) ( not ( = ?auto_1623770 ?auto_1623773 ) ) ( not ( = ?auto_1623770 ?auto_1623774 ) ) ( not ( = ?auto_1623770 ?auto_1623775 ) ) ( not ( = ?auto_1623771 ?auto_1623772 ) ) ( not ( = ?auto_1623771 ?auto_1623773 ) ) ( not ( = ?auto_1623771 ?auto_1623774 ) ) ( not ( = ?auto_1623771 ?auto_1623775 ) ) ( not ( = ?auto_1623772 ?auto_1623773 ) ) ( not ( = ?auto_1623772 ?auto_1623774 ) ) ( not ( = ?auto_1623772 ?auto_1623775 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1623773 ?auto_1623774 ?auto_1623775 )
      ( MAKE-11CRATE-VERIFY ?auto_1623764 ?auto_1623765 ?auto_1623766 ?auto_1623768 ?auto_1623767 ?auto_1623769 ?auto_1623770 ?auto_1623771 ?auto_1623772 ?auto_1623773 ?auto_1623774 ?auto_1623775 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1623885 - SURFACE
      ?auto_1623886 - SURFACE
      ?auto_1623887 - SURFACE
      ?auto_1623889 - SURFACE
      ?auto_1623888 - SURFACE
      ?auto_1623890 - SURFACE
      ?auto_1623891 - SURFACE
      ?auto_1623892 - SURFACE
      ?auto_1623893 - SURFACE
      ?auto_1623894 - SURFACE
      ?auto_1623895 - SURFACE
      ?auto_1623896 - SURFACE
    )
    :vars
    (
      ?auto_1623897 - HOIST
      ?auto_1623899 - PLACE
      ?auto_1623898 - TRUCK
      ?auto_1623900 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1623897 ?auto_1623899 ) ( SURFACE-AT ?auto_1623895 ?auto_1623899 ) ( CLEAR ?auto_1623895 ) ( IS-CRATE ?auto_1623896 ) ( not ( = ?auto_1623895 ?auto_1623896 ) ) ( AVAILABLE ?auto_1623897 ) ( IN ?auto_1623896 ?auto_1623898 ) ( ON ?auto_1623895 ?auto_1623894 ) ( not ( = ?auto_1623894 ?auto_1623895 ) ) ( not ( = ?auto_1623894 ?auto_1623896 ) ) ( TRUCK-AT ?auto_1623898 ?auto_1623900 ) ( not ( = ?auto_1623900 ?auto_1623899 ) ) ( ON ?auto_1623886 ?auto_1623885 ) ( ON ?auto_1623887 ?auto_1623886 ) ( ON ?auto_1623889 ?auto_1623887 ) ( ON ?auto_1623888 ?auto_1623889 ) ( ON ?auto_1623890 ?auto_1623888 ) ( ON ?auto_1623891 ?auto_1623890 ) ( ON ?auto_1623892 ?auto_1623891 ) ( ON ?auto_1623893 ?auto_1623892 ) ( ON ?auto_1623894 ?auto_1623893 ) ( not ( = ?auto_1623885 ?auto_1623886 ) ) ( not ( = ?auto_1623885 ?auto_1623887 ) ) ( not ( = ?auto_1623885 ?auto_1623889 ) ) ( not ( = ?auto_1623885 ?auto_1623888 ) ) ( not ( = ?auto_1623885 ?auto_1623890 ) ) ( not ( = ?auto_1623885 ?auto_1623891 ) ) ( not ( = ?auto_1623885 ?auto_1623892 ) ) ( not ( = ?auto_1623885 ?auto_1623893 ) ) ( not ( = ?auto_1623885 ?auto_1623894 ) ) ( not ( = ?auto_1623885 ?auto_1623895 ) ) ( not ( = ?auto_1623885 ?auto_1623896 ) ) ( not ( = ?auto_1623886 ?auto_1623887 ) ) ( not ( = ?auto_1623886 ?auto_1623889 ) ) ( not ( = ?auto_1623886 ?auto_1623888 ) ) ( not ( = ?auto_1623886 ?auto_1623890 ) ) ( not ( = ?auto_1623886 ?auto_1623891 ) ) ( not ( = ?auto_1623886 ?auto_1623892 ) ) ( not ( = ?auto_1623886 ?auto_1623893 ) ) ( not ( = ?auto_1623886 ?auto_1623894 ) ) ( not ( = ?auto_1623886 ?auto_1623895 ) ) ( not ( = ?auto_1623886 ?auto_1623896 ) ) ( not ( = ?auto_1623887 ?auto_1623889 ) ) ( not ( = ?auto_1623887 ?auto_1623888 ) ) ( not ( = ?auto_1623887 ?auto_1623890 ) ) ( not ( = ?auto_1623887 ?auto_1623891 ) ) ( not ( = ?auto_1623887 ?auto_1623892 ) ) ( not ( = ?auto_1623887 ?auto_1623893 ) ) ( not ( = ?auto_1623887 ?auto_1623894 ) ) ( not ( = ?auto_1623887 ?auto_1623895 ) ) ( not ( = ?auto_1623887 ?auto_1623896 ) ) ( not ( = ?auto_1623889 ?auto_1623888 ) ) ( not ( = ?auto_1623889 ?auto_1623890 ) ) ( not ( = ?auto_1623889 ?auto_1623891 ) ) ( not ( = ?auto_1623889 ?auto_1623892 ) ) ( not ( = ?auto_1623889 ?auto_1623893 ) ) ( not ( = ?auto_1623889 ?auto_1623894 ) ) ( not ( = ?auto_1623889 ?auto_1623895 ) ) ( not ( = ?auto_1623889 ?auto_1623896 ) ) ( not ( = ?auto_1623888 ?auto_1623890 ) ) ( not ( = ?auto_1623888 ?auto_1623891 ) ) ( not ( = ?auto_1623888 ?auto_1623892 ) ) ( not ( = ?auto_1623888 ?auto_1623893 ) ) ( not ( = ?auto_1623888 ?auto_1623894 ) ) ( not ( = ?auto_1623888 ?auto_1623895 ) ) ( not ( = ?auto_1623888 ?auto_1623896 ) ) ( not ( = ?auto_1623890 ?auto_1623891 ) ) ( not ( = ?auto_1623890 ?auto_1623892 ) ) ( not ( = ?auto_1623890 ?auto_1623893 ) ) ( not ( = ?auto_1623890 ?auto_1623894 ) ) ( not ( = ?auto_1623890 ?auto_1623895 ) ) ( not ( = ?auto_1623890 ?auto_1623896 ) ) ( not ( = ?auto_1623891 ?auto_1623892 ) ) ( not ( = ?auto_1623891 ?auto_1623893 ) ) ( not ( = ?auto_1623891 ?auto_1623894 ) ) ( not ( = ?auto_1623891 ?auto_1623895 ) ) ( not ( = ?auto_1623891 ?auto_1623896 ) ) ( not ( = ?auto_1623892 ?auto_1623893 ) ) ( not ( = ?auto_1623892 ?auto_1623894 ) ) ( not ( = ?auto_1623892 ?auto_1623895 ) ) ( not ( = ?auto_1623892 ?auto_1623896 ) ) ( not ( = ?auto_1623893 ?auto_1623894 ) ) ( not ( = ?auto_1623893 ?auto_1623895 ) ) ( not ( = ?auto_1623893 ?auto_1623896 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1623894 ?auto_1623895 ?auto_1623896 )
      ( MAKE-11CRATE-VERIFY ?auto_1623885 ?auto_1623886 ?auto_1623887 ?auto_1623889 ?auto_1623888 ?auto_1623890 ?auto_1623891 ?auto_1623892 ?auto_1623893 ?auto_1623894 ?auto_1623895 ?auto_1623896 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1624017 - SURFACE
      ?auto_1624018 - SURFACE
      ?auto_1624019 - SURFACE
      ?auto_1624021 - SURFACE
      ?auto_1624020 - SURFACE
      ?auto_1624022 - SURFACE
      ?auto_1624023 - SURFACE
      ?auto_1624024 - SURFACE
      ?auto_1624025 - SURFACE
      ?auto_1624026 - SURFACE
      ?auto_1624027 - SURFACE
      ?auto_1624028 - SURFACE
    )
    :vars
    (
      ?auto_1624029 - HOIST
      ?auto_1624030 - PLACE
      ?auto_1624032 - TRUCK
      ?auto_1624033 - PLACE
      ?auto_1624031 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1624029 ?auto_1624030 ) ( SURFACE-AT ?auto_1624027 ?auto_1624030 ) ( CLEAR ?auto_1624027 ) ( IS-CRATE ?auto_1624028 ) ( not ( = ?auto_1624027 ?auto_1624028 ) ) ( AVAILABLE ?auto_1624029 ) ( ON ?auto_1624027 ?auto_1624026 ) ( not ( = ?auto_1624026 ?auto_1624027 ) ) ( not ( = ?auto_1624026 ?auto_1624028 ) ) ( TRUCK-AT ?auto_1624032 ?auto_1624033 ) ( not ( = ?auto_1624033 ?auto_1624030 ) ) ( HOIST-AT ?auto_1624031 ?auto_1624033 ) ( LIFTING ?auto_1624031 ?auto_1624028 ) ( not ( = ?auto_1624029 ?auto_1624031 ) ) ( ON ?auto_1624018 ?auto_1624017 ) ( ON ?auto_1624019 ?auto_1624018 ) ( ON ?auto_1624021 ?auto_1624019 ) ( ON ?auto_1624020 ?auto_1624021 ) ( ON ?auto_1624022 ?auto_1624020 ) ( ON ?auto_1624023 ?auto_1624022 ) ( ON ?auto_1624024 ?auto_1624023 ) ( ON ?auto_1624025 ?auto_1624024 ) ( ON ?auto_1624026 ?auto_1624025 ) ( not ( = ?auto_1624017 ?auto_1624018 ) ) ( not ( = ?auto_1624017 ?auto_1624019 ) ) ( not ( = ?auto_1624017 ?auto_1624021 ) ) ( not ( = ?auto_1624017 ?auto_1624020 ) ) ( not ( = ?auto_1624017 ?auto_1624022 ) ) ( not ( = ?auto_1624017 ?auto_1624023 ) ) ( not ( = ?auto_1624017 ?auto_1624024 ) ) ( not ( = ?auto_1624017 ?auto_1624025 ) ) ( not ( = ?auto_1624017 ?auto_1624026 ) ) ( not ( = ?auto_1624017 ?auto_1624027 ) ) ( not ( = ?auto_1624017 ?auto_1624028 ) ) ( not ( = ?auto_1624018 ?auto_1624019 ) ) ( not ( = ?auto_1624018 ?auto_1624021 ) ) ( not ( = ?auto_1624018 ?auto_1624020 ) ) ( not ( = ?auto_1624018 ?auto_1624022 ) ) ( not ( = ?auto_1624018 ?auto_1624023 ) ) ( not ( = ?auto_1624018 ?auto_1624024 ) ) ( not ( = ?auto_1624018 ?auto_1624025 ) ) ( not ( = ?auto_1624018 ?auto_1624026 ) ) ( not ( = ?auto_1624018 ?auto_1624027 ) ) ( not ( = ?auto_1624018 ?auto_1624028 ) ) ( not ( = ?auto_1624019 ?auto_1624021 ) ) ( not ( = ?auto_1624019 ?auto_1624020 ) ) ( not ( = ?auto_1624019 ?auto_1624022 ) ) ( not ( = ?auto_1624019 ?auto_1624023 ) ) ( not ( = ?auto_1624019 ?auto_1624024 ) ) ( not ( = ?auto_1624019 ?auto_1624025 ) ) ( not ( = ?auto_1624019 ?auto_1624026 ) ) ( not ( = ?auto_1624019 ?auto_1624027 ) ) ( not ( = ?auto_1624019 ?auto_1624028 ) ) ( not ( = ?auto_1624021 ?auto_1624020 ) ) ( not ( = ?auto_1624021 ?auto_1624022 ) ) ( not ( = ?auto_1624021 ?auto_1624023 ) ) ( not ( = ?auto_1624021 ?auto_1624024 ) ) ( not ( = ?auto_1624021 ?auto_1624025 ) ) ( not ( = ?auto_1624021 ?auto_1624026 ) ) ( not ( = ?auto_1624021 ?auto_1624027 ) ) ( not ( = ?auto_1624021 ?auto_1624028 ) ) ( not ( = ?auto_1624020 ?auto_1624022 ) ) ( not ( = ?auto_1624020 ?auto_1624023 ) ) ( not ( = ?auto_1624020 ?auto_1624024 ) ) ( not ( = ?auto_1624020 ?auto_1624025 ) ) ( not ( = ?auto_1624020 ?auto_1624026 ) ) ( not ( = ?auto_1624020 ?auto_1624027 ) ) ( not ( = ?auto_1624020 ?auto_1624028 ) ) ( not ( = ?auto_1624022 ?auto_1624023 ) ) ( not ( = ?auto_1624022 ?auto_1624024 ) ) ( not ( = ?auto_1624022 ?auto_1624025 ) ) ( not ( = ?auto_1624022 ?auto_1624026 ) ) ( not ( = ?auto_1624022 ?auto_1624027 ) ) ( not ( = ?auto_1624022 ?auto_1624028 ) ) ( not ( = ?auto_1624023 ?auto_1624024 ) ) ( not ( = ?auto_1624023 ?auto_1624025 ) ) ( not ( = ?auto_1624023 ?auto_1624026 ) ) ( not ( = ?auto_1624023 ?auto_1624027 ) ) ( not ( = ?auto_1624023 ?auto_1624028 ) ) ( not ( = ?auto_1624024 ?auto_1624025 ) ) ( not ( = ?auto_1624024 ?auto_1624026 ) ) ( not ( = ?auto_1624024 ?auto_1624027 ) ) ( not ( = ?auto_1624024 ?auto_1624028 ) ) ( not ( = ?auto_1624025 ?auto_1624026 ) ) ( not ( = ?auto_1624025 ?auto_1624027 ) ) ( not ( = ?auto_1624025 ?auto_1624028 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1624026 ?auto_1624027 ?auto_1624028 )
      ( MAKE-11CRATE-VERIFY ?auto_1624017 ?auto_1624018 ?auto_1624019 ?auto_1624021 ?auto_1624020 ?auto_1624022 ?auto_1624023 ?auto_1624024 ?auto_1624025 ?auto_1624026 ?auto_1624027 ?auto_1624028 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1624160 - SURFACE
      ?auto_1624161 - SURFACE
      ?auto_1624162 - SURFACE
      ?auto_1624164 - SURFACE
      ?auto_1624163 - SURFACE
      ?auto_1624165 - SURFACE
      ?auto_1624166 - SURFACE
      ?auto_1624167 - SURFACE
      ?auto_1624168 - SURFACE
      ?auto_1624169 - SURFACE
      ?auto_1624170 - SURFACE
      ?auto_1624171 - SURFACE
    )
    :vars
    (
      ?auto_1624177 - HOIST
      ?auto_1624172 - PLACE
      ?auto_1624173 - TRUCK
      ?auto_1624176 - PLACE
      ?auto_1624175 - HOIST
      ?auto_1624174 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1624177 ?auto_1624172 ) ( SURFACE-AT ?auto_1624170 ?auto_1624172 ) ( CLEAR ?auto_1624170 ) ( IS-CRATE ?auto_1624171 ) ( not ( = ?auto_1624170 ?auto_1624171 ) ) ( AVAILABLE ?auto_1624177 ) ( ON ?auto_1624170 ?auto_1624169 ) ( not ( = ?auto_1624169 ?auto_1624170 ) ) ( not ( = ?auto_1624169 ?auto_1624171 ) ) ( TRUCK-AT ?auto_1624173 ?auto_1624176 ) ( not ( = ?auto_1624176 ?auto_1624172 ) ) ( HOIST-AT ?auto_1624175 ?auto_1624176 ) ( not ( = ?auto_1624177 ?auto_1624175 ) ) ( AVAILABLE ?auto_1624175 ) ( SURFACE-AT ?auto_1624171 ?auto_1624176 ) ( ON ?auto_1624171 ?auto_1624174 ) ( CLEAR ?auto_1624171 ) ( not ( = ?auto_1624170 ?auto_1624174 ) ) ( not ( = ?auto_1624171 ?auto_1624174 ) ) ( not ( = ?auto_1624169 ?auto_1624174 ) ) ( ON ?auto_1624161 ?auto_1624160 ) ( ON ?auto_1624162 ?auto_1624161 ) ( ON ?auto_1624164 ?auto_1624162 ) ( ON ?auto_1624163 ?auto_1624164 ) ( ON ?auto_1624165 ?auto_1624163 ) ( ON ?auto_1624166 ?auto_1624165 ) ( ON ?auto_1624167 ?auto_1624166 ) ( ON ?auto_1624168 ?auto_1624167 ) ( ON ?auto_1624169 ?auto_1624168 ) ( not ( = ?auto_1624160 ?auto_1624161 ) ) ( not ( = ?auto_1624160 ?auto_1624162 ) ) ( not ( = ?auto_1624160 ?auto_1624164 ) ) ( not ( = ?auto_1624160 ?auto_1624163 ) ) ( not ( = ?auto_1624160 ?auto_1624165 ) ) ( not ( = ?auto_1624160 ?auto_1624166 ) ) ( not ( = ?auto_1624160 ?auto_1624167 ) ) ( not ( = ?auto_1624160 ?auto_1624168 ) ) ( not ( = ?auto_1624160 ?auto_1624169 ) ) ( not ( = ?auto_1624160 ?auto_1624170 ) ) ( not ( = ?auto_1624160 ?auto_1624171 ) ) ( not ( = ?auto_1624160 ?auto_1624174 ) ) ( not ( = ?auto_1624161 ?auto_1624162 ) ) ( not ( = ?auto_1624161 ?auto_1624164 ) ) ( not ( = ?auto_1624161 ?auto_1624163 ) ) ( not ( = ?auto_1624161 ?auto_1624165 ) ) ( not ( = ?auto_1624161 ?auto_1624166 ) ) ( not ( = ?auto_1624161 ?auto_1624167 ) ) ( not ( = ?auto_1624161 ?auto_1624168 ) ) ( not ( = ?auto_1624161 ?auto_1624169 ) ) ( not ( = ?auto_1624161 ?auto_1624170 ) ) ( not ( = ?auto_1624161 ?auto_1624171 ) ) ( not ( = ?auto_1624161 ?auto_1624174 ) ) ( not ( = ?auto_1624162 ?auto_1624164 ) ) ( not ( = ?auto_1624162 ?auto_1624163 ) ) ( not ( = ?auto_1624162 ?auto_1624165 ) ) ( not ( = ?auto_1624162 ?auto_1624166 ) ) ( not ( = ?auto_1624162 ?auto_1624167 ) ) ( not ( = ?auto_1624162 ?auto_1624168 ) ) ( not ( = ?auto_1624162 ?auto_1624169 ) ) ( not ( = ?auto_1624162 ?auto_1624170 ) ) ( not ( = ?auto_1624162 ?auto_1624171 ) ) ( not ( = ?auto_1624162 ?auto_1624174 ) ) ( not ( = ?auto_1624164 ?auto_1624163 ) ) ( not ( = ?auto_1624164 ?auto_1624165 ) ) ( not ( = ?auto_1624164 ?auto_1624166 ) ) ( not ( = ?auto_1624164 ?auto_1624167 ) ) ( not ( = ?auto_1624164 ?auto_1624168 ) ) ( not ( = ?auto_1624164 ?auto_1624169 ) ) ( not ( = ?auto_1624164 ?auto_1624170 ) ) ( not ( = ?auto_1624164 ?auto_1624171 ) ) ( not ( = ?auto_1624164 ?auto_1624174 ) ) ( not ( = ?auto_1624163 ?auto_1624165 ) ) ( not ( = ?auto_1624163 ?auto_1624166 ) ) ( not ( = ?auto_1624163 ?auto_1624167 ) ) ( not ( = ?auto_1624163 ?auto_1624168 ) ) ( not ( = ?auto_1624163 ?auto_1624169 ) ) ( not ( = ?auto_1624163 ?auto_1624170 ) ) ( not ( = ?auto_1624163 ?auto_1624171 ) ) ( not ( = ?auto_1624163 ?auto_1624174 ) ) ( not ( = ?auto_1624165 ?auto_1624166 ) ) ( not ( = ?auto_1624165 ?auto_1624167 ) ) ( not ( = ?auto_1624165 ?auto_1624168 ) ) ( not ( = ?auto_1624165 ?auto_1624169 ) ) ( not ( = ?auto_1624165 ?auto_1624170 ) ) ( not ( = ?auto_1624165 ?auto_1624171 ) ) ( not ( = ?auto_1624165 ?auto_1624174 ) ) ( not ( = ?auto_1624166 ?auto_1624167 ) ) ( not ( = ?auto_1624166 ?auto_1624168 ) ) ( not ( = ?auto_1624166 ?auto_1624169 ) ) ( not ( = ?auto_1624166 ?auto_1624170 ) ) ( not ( = ?auto_1624166 ?auto_1624171 ) ) ( not ( = ?auto_1624166 ?auto_1624174 ) ) ( not ( = ?auto_1624167 ?auto_1624168 ) ) ( not ( = ?auto_1624167 ?auto_1624169 ) ) ( not ( = ?auto_1624167 ?auto_1624170 ) ) ( not ( = ?auto_1624167 ?auto_1624171 ) ) ( not ( = ?auto_1624167 ?auto_1624174 ) ) ( not ( = ?auto_1624168 ?auto_1624169 ) ) ( not ( = ?auto_1624168 ?auto_1624170 ) ) ( not ( = ?auto_1624168 ?auto_1624171 ) ) ( not ( = ?auto_1624168 ?auto_1624174 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1624169 ?auto_1624170 ?auto_1624171 )
      ( MAKE-11CRATE-VERIFY ?auto_1624160 ?auto_1624161 ?auto_1624162 ?auto_1624164 ?auto_1624163 ?auto_1624165 ?auto_1624166 ?auto_1624167 ?auto_1624168 ?auto_1624169 ?auto_1624170 ?auto_1624171 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1624304 - SURFACE
      ?auto_1624305 - SURFACE
      ?auto_1624306 - SURFACE
      ?auto_1624308 - SURFACE
      ?auto_1624307 - SURFACE
      ?auto_1624309 - SURFACE
      ?auto_1624310 - SURFACE
      ?auto_1624311 - SURFACE
      ?auto_1624312 - SURFACE
      ?auto_1624313 - SURFACE
      ?auto_1624314 - SURFACE
      ?auto_1624315 - SURFACE
    )
    :vars
    (
      ?auto_1624320 - HOIST
      ?auto_1624319 - PLACE
      ?auto_1624317 - PLACE
      ?auto_1624321 - HOIST
      ?auto_1624316 - SURFACE
      ?auto_1624318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1624320 ?auto_1624319 ) ( SURFACE-AT ?auto_1624314 ?auto_1624319 ) ( CLEAR ?auto_1624314 ) ( IS-CRATE ?auto_1624315 ) ( not ( = ?auto_1624314 ?auto_1624315 ) ) ( AVAILABLE ?auto_1624320 ) ( ON ?auto_1624314 ?auto_1624313 ) ( not ( = ?auto_1624313 ?auto_1624314 ) ) ( not ( = ?auto_1624313 ?auto_1624315 ) ) ( not ( = ?auto_1624317 ?auto_1624319 ) ) ( HOIST-AT ?auto_1624321 ?auto_1624317 ) ( not ( = ?auto_1624320 ?auto_1624321 ) ) ( AVAILABLE ?auto_1624321 ) ( SURFACE-AT ?auto_1624315 ?auto_1624317 ) ( ON ?auto_1624315 ?auto_1624316 ) ( CLEAR ?auto_1624315 ) ( not ( = ?auto_1624314 ?auto_1624316 ) ) ( not ( = ?auto_1624315 ?auto_1624316 ) ) ( not ( = ?auto_1624313 ?auto_1624316 ) ) ( TRUCK-AT ?auto_1624318 ?auto_1624319 ) ( ON ?auto_1624305 ?auto_1624304 ) ( ON ?auto_1624306 ?auto_1624305 ) ( ON ?auto_1624308 ?auto_1624306 ) ( ON ?auto_1624307 ?auto_1624308 ) ( ON ?auto_1624309 ?auto_1624307 ) ( ON ?auto_1624310 ?auto_1624309 ) ( ON ?auto_1624311 ?auto_1624310 ) ( ON ?auto_1624312 ?auto_1624311 ) ( ON ?auto_1624313 ?auto_1624312 ) ( not ( = ?auto_1624304 ?auto_1624305 ) ) ( not ( = ?auto_1624304 ?auto_1624306 ) ) ( not ( = ?auto_1624304 ?auto_1624308 ) ) ( not ( = ?auto_1624304 ?auto_1624307 ) ) ( not ( = ?auto_1624304 ?auto_1624309 ) ) ( not ( = ?auto_1624304 ?auto_1624310 ) ) ( not ( = ?auto_1624304 ?auto_1624311 ) ) ( not ( = ?auto_1624304 ?auto_1624312 ) ) ( not ( = ?auto_1624304 ?auto_1624313 ) ) ( not ( = ?auto_1624304 ?auto_1624314 ) ) ( not ( = ?auto_1624304 ?auto_1624315 ) ) ( not ( = ?auto_1624304 ?auto_1624316 ) ) ( not ( = ?auto_1624305 ?auto_1624306 ) ) ( not ( = ?auto_1624305 ?auto_1624308 ) ) ( not ( = ?auto_1624305 ?auto_1624307 ) ) ( not ( = ?auto_1624305 ?auto_1624309 ) ) ( not ( = ?auto_1624305 ?auto_1624310 ) ) ( not ( = ?auto_1624305 ?auto_1624311 ) ) ( not ( = ?auto_1624305 ?auto_1624312 ) ) ( not ( = ?auto_1624305 ?auto_1624313 ) ) ( not ( = ?auto_1624305 ?auto_1624314 ) ) ( not ( = ?auto_1624305 ?auto_1624315 ) ) ( not ( = ?auto_1624305 ?auto_1624316 ) ) ( not ( = ?auto_1624306 ?auto_1624308 ) ) ( not ( = ?auto_1624306 ?auto_1624307 ) ) ( not ( = ?auto_1624306 ?auto_1624309 ) ) ( not ( = ?auto_1624306 ?auto_1624310 ) ) ( not ( = ?auto_1624306 ?auto_1624311 ) ) ( not ( = ?auto_1624306 ?auto_1624312 ) ) ( not ( = ?auto_1624306 ?auto_1624313 ) ) ( not ( = ?auto_1624306 ?auto_1624314 ) ) ( not ( = ?auto_1624306 ?auto_1624315 ) ) ( not ( = ?auto_1624306 ?auto_1624316 ) ) ( not ( = ?auto_1624308 ?auto_1624307 ) ) ( not ( = ?auto_1624308 ?auto_1624309 ) ) ( not ( = ?auto_1624308 ?auto_1624310 ) ) ( not ( = ?auto_1624308 ?auto_1624311 ) ) ( not ( = ?auto_1624308 ?auto_1624312 ) ) ( not ( = ?auto_1624308 ?auto_1624313 ) ) ( not ( = ?auto_1624308 ?auto_1624314 ) ) ( not ( = ?auto_1624308 ?auto_1624315 ) ) ( not ( = ?auto_1624308 ?auto_1624316 ) ) ( not ( = ?auto_1624307 ?auto_1624309 ) ) ( not ( = ?auto_1624307 ?auto_1624310 ) ) ( not ( = ?auto_1624307 ?auto_1624311 ) ) ( not ( = ?auto_1624307 ?auto_1624312 ) ) ( not ( = ?auto_1624307 ?auto_1624313 ) ) ( not ( = ?auto_1624307 ?auto_1624314 ) ) ( not ( = ?auto_1624307 ?auto_1624315 ) ) ( not ( = ?auto_1624307 ?auto_1624316 ) ) ( not ( = ?auto_1624309 ?auto_1624310 ) ) ( not ( = ?auto_1624309 ?auto_1624311 ) ) ( not ( = ?auto_1624309 ?auto_1624312 ) ) ( not ( = ?auto_1624309 ?auto_1624313 ) ) ( not ( = ?auto_1624309 ?auto_1624314 ) ) ( not ( = ?auto_1624309 ?auto_1624315 ) ) ( not ( = ?auto_1624309 ?auto_1624316 ) ) ( not ( = ?auto_1624310 ?auto_1624311 ) ) ( not ( = ?auto_1624310 ?auto_1624312 ) ) ( not ( = ?auto_1624310 ?auto_1624313 ) ) ( not ( = ?auto_1624310 ?auto_1624314 ) ) ( not ( = ?auto_1624310 ?auto_1624315 ) ) ( not ( = ?auto_1624310 ?auto_1624316 ) ) ( not ( = ?auto_1624311 ?auto_1624312 ) ) ( not ( = ?auto_1624311 ?auto_1624313 ) ) ( not ( = ?auto_1624311 ?auto_1624314 ) ) ( not ( = ?auto_1624311 ?auto_1624315 ) ) ( not ( = ?auto_1624311 ?auto_1624316 ) ) ( not ( = ?auto_1624312 ?auto_1624313 ) ) ( not ( = ?auto_1624312 ?auto_1624314 ) ) ( not ( = ?auto_1624312 ?auto_1624315 ) ) ( not ( = ?auto_1624312 ?auto_1624316 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1624313 ?auto_1624314 ?auto_1624315 )
      ( MAKE-11CRATE-VERIFY ?auto_1624304 ?auto_1624305 ?auto_1624306 ?auto_1624308 ?auto_1624307 ?auto_1624309 ?auto_1624310 ?auto_1624311 ?auto_1624312 ?auto_1624313 ?auto_1624314 ?auto_1624315 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1624448 - SURFACE
      ?auto_1624449 - SURFACE
      ?auto_1624450 - SURFACE
      ?auto_1624452 - SURFACE
      ?auto_1624451 - SURFACE
      ?auto_1624453 - SURFACE
      ?auto_1624454 - SURFACE
      ?auto_1624455 - SURFACE
      ?auto_1624456 - SURFACE
      ?auto_1624457 - SURFACE
      ?auto_1624458 - SURFACE
      ?auto_1624459 - SURFACE
    )
    :vars
    (
      ?auto_1624465 - HOIST
      ?auto_1624460 - PLACE
      ?auto_1624464 - PLACE
      ?auto_1624461 - HOIST
      ?auto_1624462 - SURFACE
      ?auto_1624463 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1624465 ?auto_1624460 ) ( IS-CRATE ?auto_1624459 ) ( not ( = ?auto_1624458 ?auto_1624459 ) ) ( not ( = ?auto_1624457 ?auto_1624458 ) ) ( not ( = ?auto_1624457 ?auto_1624459 ) ) ( not ( = ?auto_1624464 ?auto_1624460 ) ) ( HOIST-AT ?auto_1624461 ?auto_1624464 ) ( not ( = ?auto_1624465 ?auto_1624461 ) ) ( AVAILABLE ?auto_1624461 ) ( SURFACE-AT ?auto_1624459 ?auto_1624464 ) ( ON ?auto_1624459 ?auto_1624462 ) ( CLEAR ?auto_1624459 ) ( not ( = ?auto_1624458 ?auto_1624462 ) ) ( not ( = ?auto_1624459 ?auto_1624462 ) ) ( not ( = ?auto_1624457 ?auto_1624462 ) ) ( TRUCK-AT ?auto_1624463 ?auto_1624460 ) ( SURFACE-AT ?auto_1624457 ?auto_1624460 ) ( CLEAR ?auto_1624457 ) ( LIFTING ?auto_1624465 ?auto_1624458 ) ( IS-CRATE ?auto_1624458 ) ( ON ?auto_1624449 ?auto_1624448 ) ( ON ?auto_1624450 ?auto_1624449 ) ( ON ?auto_1624452 ?auto_1624450 ) ( ON ?auto_1624451 ?auto_1624452 ) ( ON ?auto_1624453 ?auto_1624451 ) ( ON ?auto_1624454 ?auto_1624453 ) ( ON ?auto_1624455 ?auto_1624454 ) ( ON ?auto_1624456 ?auto_1624455 ) ( ON ?auto_1624457 ?auto_1624456 ) ( not ( = ?auto_1624448 ?auto_1624449 ) ) ( not ( = ?auto_1624448 ?auto_1624450 ) ) ( not ( = ?auto_1624448 ?auto_1624452 ) ) ( not ( = ?auto_1624448 ?auto_1624451 ) ) ( not ( = ?auto_1624448 ?auto_1624453 ) ) ( not ( = ?auto_1624448 ?auto_1624454 ) ) ( not ( = ?auto_1624448 ?auto_1624455 ) ) ( not ( = ?auto_1624448 ?auto_1624456 ) ) ( not ( = ?auto_1624448 ?auto_1624457 ) ) ( not ( = ?auto_1624448 ?auto_1624458 ) ) ( not ( = ?auto_1624448 ?auto_1624459 ) ) ( not ( = ?auto_1624448 ?auto_1624462 ) ) ( not ( = ?auto_1624449 ?auto_1624450 ) ) ( not ( = ?auto_1624449 ?auto_1624452 ) ) ( not ( = ?auto_1624449 ?auto_1624451 ) ) ( not ( = ?auto_1624449 ?auto_1624453 ) ) ( not ( = ?auto_1624449 ?auto_1624454 ) ) ( not ( = ?auto_1624449 ?auto_1624455 ) ) ( not ( = ?auto_1624449 ?auto_1624456 ) ) ( not ( = ?auto_1624449 ?auto_1624457 ) ) ( not ( = ?auto_1624449 ?auto_1624458 ) ) ( not ( = ?auto_1624449 ?auto_1624459 ) ) ( not ( = ?auto_1624449 ?auto_1624462 ) ) ( not ( = ?auto_1624450 ?auto_1624452 ) ) ( not ( = ?auto_1624450 ?auto_1624451 ) ) ( not ( = ?auto_1624450 ?auto_1624453 ) ) ( not ( = ?auto_1624450 ?auto_1624454 ) ) ( not ( = ?auto_1624450 ?auto_1624455 ) ) ( not ( = ?auto_1624450 ?auto_1624456 ) ) ( not ( = ?auto_1624450 ?auto_1624457 ) ) ( not ( = ?auto_1624450 ?auto_1624458 ) ) ( not ( = ?auto_1624450 ?auto_1624459 ) ) ( not ( = ?auto_1624450 ?auto_1624462 ) ) ( not ( = ?auto_1624452 ?auto_1624451 ) ) ( not ( = ?auto_1624452 ?auto_1624453 ) ) ( not ( = ?auto_1624452 ?auto_1624454 ) ) ( not ( = ?auto_1624452 ?auto_1624455 ) ) ( not ( = ?auto_1624452 ?auto_1624456 ) ) ( not ( = ?auto_1624452 ?auto_1624457 ) ) ( not ( = ?auto_1624452 ?auto_1624458 ) ) ( not ( = ?auto_1624452 ?auto_1624459 ) ) ( not ( = ?auto_1624452 ?auto_1624462 ) ) ( not ( = ?auto_1624451 ?auto_1624453 ) ) ( not ( = ?auto_1624451 ?auto_1624454 ) ) ( not ( = ?auto_1624451 ?auto_1624455 ) ) ( not ( = ?auto_1624451 ?auto_1624456 ) ) ( not ( = ?auto_1624451 ?auto_1624457 ) ) ( not ( = ?auto_1624451 ?auto_1624458 ) ) ( not ( = ?auto_1624451 ?auto_1624459 ) ) ( not ( = ?auto_1624451 ?auto_1624462 ) ) ( not ( = ?auto_1624453 ?auto_1624454 ) ) ( not ( = ?auto_1624453 ?auto_1624455 ) ) ( not ( = ?auto_1624453 ?auto_1624456 ) ) ( not ( = ?auto_1624453 ?auto_1624457 ) ) ( not ( = ?auto_1624453 ?auto_1624458 ) ) ( not ( = ?auto_1624453 ?auto_1624459 ) ) ( not ( = ?auto_1624453 ?auto_1624462 ) ) ( not ( = ?auto_1624454 ?auto_1624455 ) ) ( not ( = ?auto_1624454 ?auto_1624456 ) ) ( not ( = ?auto_1624454 ?auto_1624457 ) ) ( not ( = ?auto_1624454 ?auto_1624458 ) ) ( not ( = ?auto_1624454 ?auto_1624459 ) ) ( not ( = ?auto_1624454 ?auto_1624462 ) ) ( not ( = ?auto_1624455 ?auto_1624456 ) ) ( not ( = ?auto_1624455 ?auto_1624457 ) ) ( not ( = ?auto_1624455 ?auto_1624458 ) ) ( not ( = ?auto_1624455 ?auto_1624459 ) ) ( not ( = ?auto_1624455 ?auto_1624462 ) ) ( not ( = ?auto_1624456 ?auto_1624457 ) ) ( not ( = ?auto_1624456 ?auto_1624458 ) ) ( not ( = ?auto_1624456 ?auto_1624459 ) ) ( not ( = ?auto_1624456 ?auto_1624462 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1624457 ?auto_1624458 ?auto_1624459 )
      ( MAKE-11CRATE-VERIFY ?auto_1624448 ?auto_1624449 ?auto_1624450 ?auto_1624452 ?auto_1624451 ?auto_1624453 ?auto_1624454 ?auto_1624455 ?auto_1624456 ?auto_1624457 ?auto_1624458 ?auto_1624459 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1624592 - SURFACE
      ?auto_1624593 - SURFACE
      ?auto_1624594 - SURFACE
      ?auto_1624596 - SURFACE
      ?auto_1624595 - SURFACE
      ?auto_1624597 - SURFACE
      ?auto_1624598 - SURFACE
      ?auto_1624599 - SURFACE
      ?auto_1624600 - SURFACE
      ?auto_1624601 - SURFACE
      ?auto_1624602 - SURFACE
      ?auto_1624603 - SURFACE
    )
    :vars
    (
      ?auto_1624605 - HOIST
      ?auto_1624609 - PLACE
      ?auto_1624606 - PLACE
      ?auto_1624607 - HOIST
      ?auto_1624608 - SURFACE
      ?auto_1624604 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1624605 ?auto_1624609 ) ( IS-CRATE ?auto_1624603 ) ( not ( = ?auto_1624602 ?auto_1624603 ) ) ( not ( = ?auto_1624601 ?auto_1624602 ) ) ( not ( = ?auto_1624601 ?auto_1624603 ) ) ( not ( = ?auto_1624606 ?auto_1624609 ) ) ( HOIST-AT ?auto_1624607 ?auto_1624606 ) ( not ( = ?auto_1624605 ?auto_1624607 ) ) ( AVAILABLE ?auto_1624607 ) ( SURFACE-AT ?auto_1624603 ?auto_1624606 ) ( ON ?auto_1624603 ?auto_1624608 ) ( CLEAR ?auto_1624603 ) ( not ( = ?auto_1624602 ?auto_1624608 ) ) ( not ( = ?auto_1624603 ?auto_1624608 ) ) ( not ( = ?auto_1624601 ?auto_1624608 ) ) ( TRUCK-AT ?auto_1624604 ?auto_1624609 ) ( SURFACE-AT ?auto_1624601 ?auto_1624609 ) ( CLEAR ?auto_1624601 ) ( IS-CRATE ?auto_1624602 ) ( AVAILABLE ?auto_1624605 ) ( IN ?auto_1624602 ?auto_1624604 ) ( ON ?auto_1624593 ?auto_1624592 ) ( ON ?auto_1624594 ?auto_1624593 ) ( ON ?auto_1624596 ?auto_1624594 ) ( ON ?auto_1624595 ?auto_1624596 ) ( ON ?auto_1624597 ?auto_1624595 ) ( ON ?auto_1624598 ?auto_1624597 ) ( ON ?auto_1624599 ?auto_1624598 ) ( ON ?auto_1624600 ?auto_1624599 ) ( ON ?auto_1624601 ?auto_1624600 ) ( not ( = ?auto_1624592 ?auto_1624593 ) ) ( not ( = ?auto_1624592 ?auto_1624594 ) ) ( not ( = ?auto_1624592 ?auto_1624596 ) ) ( not ( = ?auto_1624592 ?auto_1624595 ) ) ( not ( = ?auto_1624592 ?auto_1624597 ) ) ( not ( = ?auto_1624592 ?auto_1624598 ) ) ( not ( = ?auto_1624592 ?auto_1624599 ) ) ( not ( = ?auto_1624592 ?auto_1624600 ) ) ( not ( = ?auto_1624592 ?auto_1624601 ) ) ( not ( = ?auto_1624592 ?auto_1624602 ) ) ( not ( = ?auto_1624592 ?auto_1624603 ) ) ( not ( = ?auto_1624592 ?auto_1624608 ) ) ( not ( = ?auto_1624593 ?auto_1624594 ) ) ( not ( = ?auto_1624593 ?auto_1624596 ) ) ( not ( = ?auto_1624593 ?auto_1624595 ) ) ( not ( = ?auto_1624593 ?auto_1624597 ) ) ( not ( = ?auto_1624593 ?auto_1624598 ) ) ( not ( = ?auto_1624593 ?auto_1624599 ) ) ( not ( = ?auto_1624593 ?auto_1624600 ) ) ( not ( = ?auto_1624593 ?auto_1624601 ) ) ( not ( = ?auto_1624593 ?auto_1624602 ) ) ( not ( = ?auto_1624593 ?auto_1624603 ) ) ( not ( = ?auto_1624593 ?auto_1624608 ) ) ( not ( = ?auto_1624594 ?auto_1624596 ) ) ( not ( = ?auto_1624594 ?auto_1624595 ) ) ( not ( = ?auto_1624594 ?auto_1624597 ) ) ( not ( = ?auto_1624594 ?auto_1624598 ) ) ( not ( = ?auto_1624594 ?auto_1624599 ) ) ( not ( = ?auto_1624594 ?auto_1624600 ) ) ( not ( = ?auto_1624594 ?auto_1624601 ) ) ( not ( = ?auto_1624594 ?auto_1624602 ) ) ( not ( = ?auto_1624594 ?auto_1624603 ) ) ( not ( = ?auto_1624594 ?auto_1624608 ) ) ( not ( = ?auto_1624596 ?auto_1624595 ) ) ( not ( = ?auto_1624596 ?auto_1624597 ) ) ( not ( = ?auto_1624596 ?auto_1624598 ) ) ( not ( = ?auto_1624596 ?auto_1624599 ) ) ( not ( = ?auto_1624596 ?auto_1624600 ) ) ( not ( = ?auto_1624596 ?auto_1624601 ) ) ( not ( = ?auto_1624596 ?auto_1624602 ) ) ( not ( = ?auto_1624596 ?auto_1624603 ) ) ( not ( = ?auto_1624596 ?auto_1624608 ) ) ( not ( = ?auto_1624595 ?auto_1624597 ) ) ( not ( = ?auto_1624595 ?auto_1624598 ) ) ( not ( = ?auto_1624595 ?auto_1624599 ) ) ( not ( = ?auto_1624595 ?auto_1624600 ) ) ( not ( = ?auto_1624595 ?auto_1624601 ) ) ( not ( = ?auto_1624595 ?auto_1624602 ) ) ( not ( = ?auto_1624595 ?auto_1624603 ) ) ( not ( = ?auto_1624595 ?auto_1624608 ) ) ( not ( = ?auto_1624597 ?auto_1624598 ) ) ( not ( = ?auto_1624597 ?auto_1624599 ) ) ( not ( = ?auto_1624597 ?auto_1624600 ) ) ( not ( = ?auto_1624597 ?auto_1624601 ) ) ( not ( = ?auto_1624597 ?auto_1624602 ) ) ( not ( = ?auto_1624597 ?auto_1624603 ) ) ( not ( = ?auto_1624597 ?auto_1624608 ) ) ( not ( = ?auto_1624598 ?auto_1624599 ) ) ( not ( = ?auto_1624598 ?auto_1624600 ) ) ( not ( = ?auto_1624598 ?auto_1624601 ) ) ( not ( = ?auto_1624598 ?auto_1624602 ) ) ( not ( = ?auto_1624598 ?auto_1624603 ) ) ( not ( = ?auto_1624598 ?auto_1624608 ) ) ( not ( = ?auto_1624599 ?auto_1624600 ) ) ( not ( = ?auto_1624599 ?auto_1624601 ) ) ( not ( = ?auto_1624599 ?auto_1624602 ) ) ( not ( = ?auto_1624599 ?auto_1624603 ) ) ( not ( = ?auto_1624599 ?auto_1624608 ) ) ( not ( = ?auto_1624600 ?auto_1624601 ) ) ( not ( = ?auto_1624600 ?auto_1624602 ) ) ( not ( = ?auto_1624600 ?auto_1624603 ) ) ( not ( = ?auto_1624600 ?auto_1624608 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1624601 ?auto_1624602 ?auto_1624603 )
      ( MAKE-11CRATE-VERIFY ?auto_1624592 ?auto_1624593 ?auto_1624594 ?auto_1624596 ?auto_1624595 ?auto_1624597 ?auto_1624598 ?auto_1624599 ?auto_1624600 ?auto_1624601 ?auto_1624602 ?auto_1624603 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1633862 - SURFACE
      ?auto_1633863 - SURFACE
      ?auto_1633864 - SURFACE
      ?auto_1633866 - SURFACE
      ?auto_1633865 - SURFACE
      ?auto_1633867 - SURFACE
      ?auto_1633868 - SURFACE
      ?auto_1633869 - SURFACE
      ?auto_1633870 - SURFACE
      ?auto_1633871 - SURFACE
      ?auto_1633872 - SURFACE
      ?auto_1633873 - SURFACE
      ?auto_1633874 - SURFACE
    )
    :vars
    (
      ?auto_1633875 - HOIST
      ?auto_1633876 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1633875 ?auto_1633876 ) ( SURFACE-AT ?auto_1633873 ?auto_1633876 ) ( CLEAR ?auto_1633873 ) ( LIFTING ?auto_1633875 ?auto_1633874 ) ( IS-CRATE ?auto_1633874 ) ( not ( = ?auto_1633873 ?auto_1633874 ) ) ( ON ?auto_1633863 ?auto_1633862 ) ( ON ?auto_1633864 ?auto_1633863 ) ( ON ?auto_1633866 ?auto_1633864 ) ( ON ?auto_1633865 ?auto_1633866 ) ( ON ?auto_1633867 ?auto_1633865 ) ( ON ?auto_1633868 ?auto_1633867 ) ( ON ?auto_1633869 ?auto_1633868 ) ( ON ?auto_1633870 ?auto_1633869 ) ( ON ?auto_1633871 ?auto_1633870 ) ( ON ?auto_1633872 ?auto_1633871 ) ( ON ?auto_1633873 ?auto_1633872 ) ( not ( = ?auto_1633862 ?auto_1633863 ) ) ( not ( = ?auto_1633862 ?auto_1633864 ) ) ( not ( = ?auto_1633862 ?auto_1633866 ) ) ( not ( = ?auto_1633862 ?auto_1633865 ) ) ( not ( = ?auto_1633862 ?auto_1633867 ) ) ( not ( = ?auto_1633862 ?auto_1633868 ) ) ( not ( = ?auto_1633862 ?auto_1633869 ) ) ( not ( = ?auto_1633862 ?auto_1633870 ) ) ( not ( = ?auto_1633862 ?auto_1633871 ) ) ( not ( = ?auto_1633862 ?auto_1633872 ) ) ( not ( = ?auto_1633862 ?auto_1633873 ) ) ( not ( = ?auto_1633862 ?auto_1633874 ) ) ( not ( = ?auto_1633863 ?auto_1633864 ) ) ( not ( = ?auto_1633863 ?auto_1633866 ) ) ( not ( = ?auto_1633863 ?auto_1633865 ) ) ( not ( = ?auto_1633863 ?auto_1633867 ) ) ( not ( = ?auto_1633863 ?auto_1633868 ) ) ( not ( = ?auto_1633863 ?auto_1633869 ) ) ( not ( = ?auto_1633863 ?auto_1633870 ) ) ( not ( = ?auto_1633863 ?auto_1633871 ) ) ( not ( = ?auto_1633863 ?auto_1633872 ) ) ( not ( = ?auto_1633863 ?auto_1633873 ) ) ( not ( = ?auto_1633863 ?auto_1633874 ) ) ( not ( = ?auto_1633864 ?auto_1633866 ) ) ( not ( = ?auto_1633864 ?auto_1633865 ) ) ( not ( = ?auto_1633864 ?auto_1633867 ) ) ( not ( = ?auto_1633864 ?auto_1633868 ) ) ( not ( = ?auto_1633864 ?auto_1633869 ) ) ( not ( = ?auto_1633864 ?auto_1633870 ) ) ( not ( = ?auto_1633864 ?auto_1633871 ) ) ( not ( = ?auto_1633864 ?auto_1633872 ) ) ( not ( = ?auto_1633864 ?auto_1633873 ) ) ( not ( = ?auto_1633864 ?auto_1633874 ) ) ( not ( = ?auto_1633866 ?auto_1633865 ) ) ( not ( = ?auto_1633866 ?auto_1633867 ) ) ( not ( = ?auto_1633866 ?auto_1633868 ) ) ( not ( = ?auto_1633866 ?auto_1633869 ) ) ( not ( = ?auto_1633866 ?auto_1633870 ) ) ( not ( = ?auto_1633866 ?auto_1633871 ) ) ( not ( = ?auto_1633866 ?auto_1633872 ) ) ( not ( = ?auto_1633866 ?auto_1633873 ) ) ( not ( = ?auto_1633866 ?auto_1633874 ) ) ( not ( = ?auto_1633865 ?auto_1633867 ) ) ( not ( = ?auto_1633865 ?auto_1633868 ) ) ( not ( = ?auto_1633865 ?auto_1633869 ) ) ( not ( = ?auto_1633865 ?auto_1633870 ) ) ( not ( = ?auto_1633865 ?auto_1633871 ) ) ( not ( = ?auto_1633865 ?auto_1633872 ) ) ( not ( = ?auto_1633865 ?auto_1633873 ) ) ( not ( = ?auto_1633865 ?auto_1633874 ) ) ( not ( = ?auto_1633867 ?auto_1633868 ) ) ( not ( = ?auto_1633867 ?auto_1633869 ) ) ( not ( = ?auto_1633867 ?auto_1633870 ) ) ( not ( = ?auto_1633867 ?auto_1633871 ) ) ( not ( = ?auto_1633867 ?auto_1633872 ) ) ( not ( = ?auto_1633867 ?auto_1633873 ) ) ( not ( = ?auto_1633867 ?auto_1633874 ) ) ( not ( = ?auto_1633868 ?auto_1633869 ) ) ( not ( = ?auto_1633868 ?auto_1633870 ) ) ( not ( = ?auto_1633868 ?auto_1633871 ) ) ( not ( = ?auto_1633868 ?auto_1633872 ) ) ( not ( = ?auto_1633868 ?auto_1633873 ) ) ( not ( = ?auto_1633868 ?auto_1633874 ) ) ( not ( = ?auto_1633869 ?auto_1633870 ) ) ( not ( = ?auto_1633869 ?auto_1633871 ) ) ( not ( = ?auto_1633869 ?auto_1633872 ) ) ( not ( = ?auto_1633869 ?auto_1633873 ) ) ( not ( = ?auto_1633869 ?auto_1633874 ) ) ( not ( = ?auto_1633870 ?auto_1633871 ) ) ( not ( = ?auto_1633870 ?auto_1633872 ) ) ( not ( = ?auto_1633870 ?auto_1633873 ) ) ( not ( = ?auto_1633870 ?auto_1633874 ) ) ( not ( = ?auto_1633871 ?auto_1633872 ) ) ( not ( = ?auto_1633871 ?auto_1633873 ) ) ( not ( = ?auto_1633871 ?auto_1633874 ) ) ( not ( = ?auto_1633872 ?auto_1633873 ) ) ( not ( = ?auto_1633872 ?auto_1633874 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1633873 ?auto_1633874 )
      ( MAKE-12CRATE-VERIFY ?auto_1633862 ?auto_1633863 ?auto_1633864 ?auto_1633866 ?auto_1633865 ?auto_1633867 ?auto_1633868 ?auto_1633869 ?auto_1633870 ?auto_1633871 ?auto_1633872 ?auto_1633873 ?auto_1633874 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1633987 - SURFACE
      ?auto_1633988 - SURFACE
      ?auto_1633989 - SURFACE
      ?auto_1633991 - SURFACE
      ?auto_1633990 - SURFACE
      ?auto_1633992 - SURFACE
      ?auto_1633993 - SURFACE
      ?auto_1633994 - SURFACE
      ?auto_1633995 - SURFACE
      ?auto_1633996 - SURFACE
      ?auto_1633997 - SURFACE
      ?auto_1633998 - SURFACE
      ?auto_1633999 - SURFACE
    )
    :vars
    (
      ?auto_1634000 - HOIST
      ?auto_1634001 - PLACE
      ?auto_1634002 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1634000 ?auto_1634001 ) ( SURFACE-AT ?auto_1633998 ?auto_1634001 ) ( CLEAR ?auto_1633998 ) ( IS-CRATE ?auto_1633999 ) ( not ( = ?auto_1633998 ?auto_1633999 ) ) ( TRUCK-AT ?auto_1634002 ?auto_1634001 ) ( AVAILABLE ?auto_1634000 ) ( IN ?auto_1633999 ?auto_1634002 ) ( ON ?auto_1633998 ?auto_1633997 ) ( not ( = ?auto_1633997 ?auto_1633998 ) ) ( not ( = ?auto_1633997 ?auto_1633999 ) ) ( ON ?auto_1633988 ?auto_1633987 ) ( ON ?auto_1633989 ?auto_1633988 ) ( ON ?auto_1633991 ?auto_1633989 ) ( ON ?auto_1633990 ?auto_1633991 ) ( ON ?auto_1633992 ?auto_1633990 ) ( ON ?auto_1633993 ?auto_1633992 ) ( ON ?auto_1633994 ?auto_1633993 ) ( ON ?auto_1633995 ?auto_1633994 ) ( ON ?auto_1633996 ?auto_1633995 ) ( ON ?auto_1633997 ?auto_1633996 ) ( not ( = ?auto_1633987 ?auto_1633988 ) ) ( not ( = ?auto_1633987 ?auto_1633989 ) ) ( not ( = ?auto_1633987 ?auto_1633991 ) ) ( not ( = ?auto_1633987 ?auto_1633990 ) ) ( not ( = ?auto_1633987 ?auto_1633992 ) ) ( not ( = ?auto_1633987 ?auto_1633993 ) ) ( not ( = ?auto_1633987 ?auto_1633994 ) ) ( not ( = ?auto_1633987 ?auto_1633995 ) ) ( not ( = ?auto_1633987 ?auto_1633996 ) ) ( not ( = ?auto_1633987 ?auto_1633997 ) ) ( not ( = ?auto_1633987 ?auto_1633998 ) ) ( not ( = ?auto_1633987 ?auto_1633999 ) ) ( not ( = ?auto_1633988 ?auto_1633989 ) ) ( not ( = ?auto_1633988 ?auto_1633991 ) ) ( not ( = ?auto_1633988 ?auto_1633990 ) ) ( not ( = ?auto_1633988 ?auto_1633992 ) ) ( not ( = ?auto_1633988 ?auto_1633993 ) ) ( not ( = ?auto_1633988 ?auto_1633994 ) ) ( not ( = ?auto_1633988 ?auto_1633995 ) ) ( not ( = ?auto_1633988 ?auto_1633996 ) ) ( not ( = ?auto_1633988 ?auto_1633997 ) ) ( not ( = ?auto_1633988 ?auto_1633998 ) ) ( not ( = ?auto_1633988 ?auto_1633999 ) ) ( not ( = ?auto_1633989 ?auto_1633991 ) ) ( not ( = ?auto_1633989 ?auto_1633990 ) ) ( not ( = ?auto_1633989 ?auto_1633992 ) ) ( not ( = ?auto_1633989 ?auto_1633993 ) ) ( not ( = ?auto_1633989 ?auto_1633994 ) ) ( not ( = ?auto_1633989 ?auto_1633995 ) ) ( not ( = ?auto_1633989 ?auto_1633996 ) ) ( not ( = ?auto_1633989 ?auto_1633997 ) ) ( not ( = ?auto_1633989 ?auto_1633998 ) ) ( not ( = ?auto_1633989 ?auto_1633999 ) ) ( not ( = ?auto_1633991 ?auto_1633990 ) ) ( not ( = ?auto_1633991 ?auto_1633992 ) ) ( not ( = ?auto_1633991 ?auto_1633993 ) ) ( not ( = ?auto_1633991 ?auto_1633994 ) ) ( not ( = ?auto_1633991 ?auto_1633995 ) ) ( not ( = ?auto_1633991 ?auto_1633996 ) ) ( not ( = ?auto_1633991 ?auto_1633997 ) ) ( not ( = ?auto_1633991 ?auto_1633998 ) ) ( not ( = ?auto_1633991 ?auto_1633999 ) ) ( not ( = ?auto_1633990 ?auto_1633992 ) ) ( not ( = ?auto_1633990 ?auto_1633993 ) ) ( not ( = ?auto_1633990 ?auto_1633994 ) ) ( not ( = ?auto_1633990 ?auto_1633995 ) ) ( not ( = ?auto_1633990 ?auto_1633996 ) ) ( not ( = ?auto_1633990 ?auto_1633997 ) ) ( not ( = ?auto_1633990 ?auto_1633998 ) ) ( not ( = ?auto_1633990 ?auto_1633999 ) ) ( not ( = ?auto_1633992 ?auto_1633993 ) ) ( not ( = ?auto_1633992 ?auto_1633994 ) ) ( not ( = ?auto_1633992 ?auto_1633995 ) ) ( not ( = ?auto_1633992 ?auto_1633996 ) ) ( not ( = ?auto_1633992 ?auto_1633997 ) ) ( not ( = ?auto_1633992 ?auto_1633998 ) ) ( not ( = ?auto_1633992 ?auto_1633999 ) ) ( not ( = ?auto_1633993 ?auto_1633994 ) ) ( not ( = ?auto_1633993 ?auto_1633995 ) ) ( not ( = ?auto_1633993 ?auto_1633996 ) ) ( not ( = ?auto_1633993 ?auto_1633997 ) ) ( not ( = ?auto_1633993 ?auto_1633998 ) ) ( not ( = ?auto_1633993 ?auto_1633999 ) ) ( not ( = ?auto_1633994 ?auto_1633995 ) ) ( not ( = ?auto_1633994 ?auto_1633996 ) ) ( not ( = ?auto_1633994 ?auto_1633997 ) ) ( not ( = ?auto_1633994 ?auto_1633998 ) ) ( not ( = ?auto_1633994 ?auto_1633999 ) ) ( not ( = ?auto_1633995 ?auto_1633996 ) ) ( not ( = ?auto_1633995 ?auto_1633997 ) ) ( not ( = ?auto_1633995 ?auto_1633998 ) ) ( not ( = ?auto_1633995 ?auto_1633999 ) ) ( not ( = ?auto_1633996 ?auto_1633997 ) ) ( not ( = ?auto_1633996 ?auto_1633998 ) ) ( not ( = ?auto_1633996 ?auto_1633999 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1633997 ?auto_1633998 ?auto_1633999 )
      ( MAKE-12CRATE-VERIFY ?auto_1633987 ?auto_1633988 ?auto_1633989 ?auto_1633991 ?auto_1633990 ?auto_1633992 ?auto_1633993 ?auto_1633994 ?auto_1633995 ?auto_1633996 ?auto_1633997 ?auto_1633998 ?auto_1633999 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1634125 - SURFACE
      ?auto_1634126 - SURFACE
      ?auto_1634127 - SURFACE
      ?auto_1634129 - SURFACE
      ?auto_1634128 - SURFACE
      ?auto_1634130 - SURFACE
      ?auto_1634131 - SURFACE
      ?auto_1634132 - SURFACE
      ?auto_1634133 - SURFACE
      ?auto_1634134 - SURFACE
      ?auto_1634135 - SURFACE
      ?auto_1634136 - SURFACE
      ?auto_1634137 - SURFACE
    )
    :vars
    (
      ?auto_1634141 - HOIST
      ?auto_1634139 - PLACE
      ?auto_1634140 - TRUCK
      ?auto_1634138 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1634141 ?auto_1634139 ) ( SURFACE-AT ?auto_1634136 ?auto_1634139 ) ( CLEAR ?auto_1634136 ) ( IS-CRATE ?auto_1634137 ) ( not ( = ?auto_1634136 ?auto_1634137 ) ) ( AVAILABLE ?auto_1634141 ) ( IN ?auto_1634137 ?auto_1634140 ) ( ON ?auto_1634136 ?auto_1634135 ) ( not ( = ?auto_1634135 ?auto_1634136 ) ) ( not ( = ?auto_1634135 ?auto_1634137 ) ) ( TRUCK-AT ?auto_1634140 ?auto_1634138 ) ( not ( = ?auto_1634138 ?auto_1634139 ) ) ( ON ?auto_1634126 ?auto_1634125 ) ( ON ?auto_1634127 ?auto_1634126 ) ( ON ?auto_1634129 ?auto_1634127 ) ( ON ?auto_1634128 ?auto_1634129 ) ( ON ?auto_1634130 ?auto_1634128 ) ( ON ?auto_1634131 ?auto_1634130 ) ( ON ?auto_1634132 ?auto_1634131 ) ( ON ?auto_1634133 ?auto_1634132 ) ( ON ?auto_1634134 ?auto_1634133 ) ( ON ?auto_1634135 ?auto_1634134 ) ( not ( = ?auto_1634125 ?auto_1634126 ) ) ( not ( = ?auto_1634125 ?auto_1634127 ) ) ( not ( = ?auto_1634125 ?auto_1634129 ) ) ( not ( = ?auto_1634125 ?auto_1634128 ) ) ( not ( = ?auto_1634125 ?auto_1634130 ) ) ( not ( = ?auto_1634125 ?auto_1634131 ) ) ( not ( = ?auto_1634125 ?auto_1634132 ) ) ( not ( = ?auto_1634125 ?auto_1634133 ) ) ( not ( = ?auto_1634125 ?auto_1634134 ) ) ( not ( = ?auto_1634125 ?auto_1634135 ) ) ( not ( = ?auto_1634125 ?auto_1634136 ) ) ( not ( = ?auto_1634125 ?auto_1634137 ) ) ( not ( = ?auto_1634126 ?auto_1634127 ) ) ( not ( = ?auto_1634126 ?auto_1634129 ) ) ( not ( = ?auto_1634126 ?auto_1634128 ) ) ( not ( = ?auto_1634126 ?auto_1634130 ) ) ( not ( = ?auto_1634126 ?auto_1634131 ) ) ( not ( = ?auto_1634126 ?auto_1634132 ) ) ( not ( = ?auto_1634126 ?auto_1634133 ) ) ( not ( = ?auto_1634126 ?auto_1634134 ) ) ( not ( = ?auto_1634126 ?auto_1634135 ) ) ( not ( = ?auto_1634126 ?auto_1634136 ) ) ( not ( = ?auto_1634126 ?auto_1634137 ) ) ( not ( = ?auto_1634127 ?auto_1634129 ) ) ( not ( = ?auto_1634127 ?auto_1634128 ) ) ( not ( = ?auto_1634127 ?auto_1634130 ) ) ( not ( = ?auto_1634127 ?auto_1634131 ) ) ( not ( = ?auto_1634127 ?auto_1634132 ) ) ( not ( = ?auto_1634127 ?auto_1634133 ) ) ( not ( = ?auto_1634127 ?auto_1634134 ) ) ( not ( = ?auto_1634127 ?auto_1634135 ) ) ( not ( = ?auto_1634127 ?auto_1634136 ) ) ( not ( = ?auto_1634127 ?auto_1634137 ) ) ( not ( = ?auto_1634129 ?auto_1634128 ) ) ( not ( = ?auto_1634129 ?auto_1634130 ) ) ( not ( = ?auto_1634129 ?auto_1634131 ) ) ( not ( = ?auto_1634129 ?auto_1634132 ) ) ( not ( = ?auto_1634129 ?auto_1634133 ) ) ( not ( = ?auto_1634129 ?auto_1634134 ) ) ( not ( = ?auto_1634129 ?auto_1634135 ) ) ( not ( = ?auto_1634129 ?auto_1634136 ) ) ( not ( = ?auto_1634129 ?auto_1634137 ) ) ( not ( = ?auto_1634128 ?auto_1634130 ) ) ( not ( = ?auto_1634128 ?auto_1634131 ) ) ( not ( = ?auto_1634128 ?auto_1634132 ) ) ( not ( = ?auto_1634128 ?auto_1634133 ) ) ( not ( = ?auto_1634128 ?auto_1634134 ) ) ( not ( = ?auto_1634128 ?auto_1634135 ) ) ( not ( = ?auto_1634128 ?auto_1634136 ) ) ( not ( = ?auto_1634128 ?auto_1634137 ) ) ( not ( = ?auto_1634130 ?auto_1634131 ) ) ( not ( = ?auto_1634130 ?auto_1634132 ) ) ( not ( = ?auto_1634130 ?auto_1634133 ) ) ( not ( = ?auto_1634130 ?auto_1634134 ) ) ( not ( = ?auto_1634130 ?auto_1634135 ) ) ( not ( = ?auto_1634130 ?auto_1634136 ) ) ( not ( = ?auto_1634130 ?auto_1634137 ) ) ( not ( = ?auto_1634131 ?auto_1634132 ) ) ( not ( = ?auto_1634131 ?auto_1634133 ) ) ( not ( = ?auto_1634131 ?auto_1634134 ) ) ( not ( = ?auto_1634131 ?auto_1634135 ) ) ( not ( = ?auto_1634131 ?auto_1634136 ) ) ( not ( = ?auto_1634131 ?auto_1634137 ) ) ( not ( = ?auto_1634132 ?auto_1634133 ) ) ( not ( = ?auto_1634132 ?auto_1634134 ) ) ( not ( = ?auto_1634132 ?auto_1634135 ) ) ( not ( = ?auto_1634132 ?auto_1634136 ) ) ( not ( = ?auto_1634132 ?auto_1634137 ) ) ( not ( = ?auto_1634133 ?auto_1634134 ) ) ( not ( = ?auto_1634133 ?auto_1634135 ) ) ( not ( = ?auto_1634133 ?auto_1634136 ) ) ( not ( = ?auto_1634133 ?auto_1634137 ) ) ( not ( = ?auto_1634134 ?auto_1634135 ) ) ( not ( = ?auto_1634134 ?auto_1634136 ) ) ( not ( = ?auto_1634134 ?auto_1634137 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1634135 ?auto_1634136 ?auto_1634137 )
      ( MAKE-12CRATE-VERIFY ?auto_1634125 ?auto_1634126 ?auto_1634127 ?auto_1634129 ?auto_1634128 ?auto_1634130 ?auto_1634131 ?auto_1634132 ?auto_1634133 ?auto_1634134 ?auto_1634135 ?auto_1634136 ?auto_1634137 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1634275 - SURFACE
      ?auto_1634276 - SURFACE
      ?auto_1634277 - SURFACE
      ?auto_1634279 - SURFACE
      ?auto_1634278 - SURFACE
      ?auto_1634280 - SURFACE
      ?auto_1634281 - SURFACE
      ?auto_1634282 - SURFACE
      ?auto_1634283 - SURFACE
      ?auto_1634284 - SURFACE
      ?auto_1634285 - SURFACE
      ?auto_1634286 - SURFACE
      ?auto_1634287 - SURFACE
    )
    :vars
    (
      ?auto_1634291 - HOIST
      ?auto_1634288 - PLACE
      ?auto_1634292 - TRUCK
      ?auto_1634289 - PLACE
      ?auto_1634290 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1634291 ?auto_1634288 ) ( SURFACE-AT ?auto_1634286 ?auto_1634288 ) ( CLEAR ?auto_1634286 ) ( IS-CRATE ?auto_1634287 ) ( not ( = ?auto_1634286 ?auto_1634287 ) ) ( AVAILABLE ?auto_1634291 ) ( ON ?auto_1634286 ?auto_1634285 ) ( not ( = ?auto_1634285 ?auto_1634286 ) ) ( not ( = ?auto_1634285 ?auto_1634287 ) ) ( TRUCK-AT ?auto_1634292 ?auto_1634289 ) ( not ( = ?auto_1634289 ?auto_1634288 ) ) ( HOIST-AT ?auto_1634290 ?auto_1634289 ) ( LIFTING ?auto_1634290 ?auto_1634287 ) ( not ( = ?auto_1634291 ?auto_1634290 ) ) ( ON ?auto_1634276 ?auto_1634275 ) ( ON ?auto_1634277 ?auto_1634276 ) ( ON ?auto_1634279 ?auto_1634277 ) ( ON ?auto_1634278 ?auto_1634279 ) ( ON ?auto_1634280 ?auto_1634278 ) ( ON ?auto_1634281 ?auto_1634280 ) ( ON ?auto_1634282 ?auto_1634281 ) ( ON ?auto_1634283 ?auto_1634282 ) ( ON ?auto_1634284 ?auto_1634283 ) ( ON ?auto_1634285 ?auto_1634284 ) ( not ( = ?auto_1634275 ?auto_1634276 ) ) ( not ( = ?auto_1634275 ?auto_1634277 ) ) ( not ( = ?auto_1634275 ?auto_1634279 ) ) ( not ( = ?auto_1634275 ?auto_1634278 ) ) ( not ( = ?auto_1634275 ?auto_1634280 ) ) ( not ( = ?auto_1634275 ?auto_1634281 ) ) ( not ( = ?auto_1634275 ?auto_1634282 ) ) ( not ( = ?auto_1634275 ?auto_1634283 ) ) ( not ( = ?auto_1634275 ?auto_1634284 ) ) ( not ( = ?auto_1634275 ?auto_1634285 ) ) ( not ( = ?auto_1634275 ?auto_1634286 ) ) ( not ( = ?auto_1634275 ?auto_1634287 ) ) ( not ( = ?auto_1634276 ?auto_1634277 ) ) ( not ( = ?auto_1634276 ?auto_1634279 ) ) ( not ( = ?auto_1634276 ?auto_1634278 ) ) ( not ( = ?auto_1634276 ?auto_1634280 ) ) ( not ( = ?auto_1634276 ?auto_1634281 ) ) ( not ( = ?auto_1634276 ?auto_1634282 ) ) ( not ( = ?auto_1634276 ?auto_1634283 ) ) ( not ( = ?auto_1634276 ?auto_1634284 ) ) ( not ( = ?auto_1634276 ?auto_1634285 ) ) ( not ( = ?auto_1634276 ?auto_1634286 ) ) ( not ( = ?auto_1634276 ?auto_1634287 ) ) ( not ( = ?auto_1634277 ?auto_1634279 ) ) ( not ( = ?auto_1634277 ?auto_1634278 ) ) ( not ( = ?auto_1634277 ?auto_1634280 ) ) ( not ( = ?auto_1634277 ?auto_1634281 ) ) ( not ( = ?auto_1634277 ?auto_1634282 ) ) ( not ( = ?auto_1634277 ?auto_1634283 ) ) ( not ( = ?auto_1634277 ?auto_1634284 ) ) ( not ( = ?auto_1634277 ?auto_1634285 ) ) ( not ( = ?auto_1634277 ?auto_1634286 ) ) ( not ( = ?auto_1634277 ?auto_1634287 ) ) ( not ( = ?auto_1634279 ?auto_1634278 ) ) ( not ( = ?auto_1634279 ?auto_1634280 ) ) ( not ( = ?auto_1634279 ?auto_1634281 ) ) ( not ( = ?auto_1634279 ?auto_1634282 ) ) ( not ( = ?auto_1634279 ?auto_1634283 ) ) ( not ( = ?auto_1634279 ?auto_1634284 ) ) ( not ( = ?auto_1634279 ?auto_1634285 ) ) ( not ( = ?auto_1634279 ?auto_1634286 ) ) ( not ( = ?auto_1634279 ?auto_1634287 ) ) ( not ( = ?auto_1634278 ?auto_1634280 ) ) ( not ( = ?auto_1634278 ?auto_1634281 ) ) ( not ( = ?auto_1634278 ?auto_1634282 ) ) ( not ( = ?auto_1634278 ?auto_1634283 ) ) ( not ( = ?auto_1634278 ?auto_1634284 ) ) ( not ( = ?auto_1634278 ?auto_1634285 ) ) ( not ( = ?auto_1634278 ?auto_1634286 ) ) ( not ( = ?auto_1634278 ?auto_1634287 ) ) ( not ( = ?auto_1634280 ?auto_1634281 ) ) ( not ( = ?auto_1634280 ?auto_1634282 ) ) ( not ( = ?auto_1634280 ?auto_1634283 ) ) ( not ( = ?auto_1634280 ?auto_1634284 ) ) ( not ( = ?auto_1634280 ?auto_1634285 ) ) ( not ( = ?auto_1634280 ?auto_1634286 ) ) ( not ( = ?auto_1634280 ?auto_1634287 ) ) ( not ( = ?auto_1634281 ?auto_1634282 ) ) ( not ( = ?auto_1634281 ?auto_1634283 ) ) ( not ( = ?auto_1634281 ?auto_1634284 ) ) ( not ( = ?auto_1634281 ?auto_1634285 ) ) ( not ( = ?auto_1634281 ?auto_1634286 ) ) ( not ( = ?auto_1634281 ?auto_1634287 ) ) ( not ( = ?auto_1634282 ?auto_1634283 ) ) ( not ( = ?auto_1634282 ?auto_1634284 ) ) ( not ( = ?auto_1634282 ?auto_1634285 ) ) ( not ( = ?auto_1634282 ?auto_1634286 ) ) ( not ( = ?auto_1634282 ?auto_1634287 ) ) ( not ( = ?auto_1634283 ?auto_1634284 ) ) ( not ( = ?auto_1634283 ?auto_1634285 ) ) ( not ( = ?auto_1634283 ?auto_1634286 ) ) ( not ( = ?auto_1634283 ?auto_1634287 ) ) ( not ( = ?auto_1634284 ?auto_1634285 ) ) ( not ( = ?auto_1634284 ?auto_1634286 ) ) ( not ( = ?auto_1634284 ?auto_1634287 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1634285 ?auto_1634286 ?auto_1634287 )
      ( MAKE-12CRATE-VERIFY ?auto_1634275 ?auto_1634276 ?auto_1634277 ?auto_1634279 ?auto_1634278 ?auto_1634280 ?auto_1634281 ?auto_1634282 ?auto_1634283 ?auto_1634284 ?auto_1634285 ?auto_1634286 ?auto_1634287 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1634437 - SURFACE
      ?auto_1634438 - SURFACE
      ?auto_1634439 - SURFACE
      ?auto_1634441 - SURFACE
      ?auto_1634440 - SURFACE
      ?auto_1634442 - SURFACE
      ?auto_1634443 - SURFACE
      ?auto_1634444 - SURFACE
      ?auto_1634445 - SURFACE
      ?auto_1634446 - SURFACE
      ?auto_1634447 - SURFACE
      ?auto_1634448 - SURFACE
      ?auto_1634449 - SURFACE
    )
    :vars
    (
      ?auto_1634450 - HOIST
      ?auto_1634454 - PLACE
      ?auto_1634455 - TRUCK
      ?auto_1634452 - PLACE
      ?auto_1634451 - HOIST
      ?auto_1634453 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1634450 ?auto_1634454 ) ( SURFACE-AT ?auto_1634448 ?auto_1634454 ) ( CLEAR ?auto_1634448 ) ( IS-CRATE ?auto_1634449 ) ( not ( = ?auto_1634448 ?auto_1634449 ) ) ( AVAILABLE ?auto_1634450 ) ( ON ?auto_1634448 ?auto_1634447 ) ( not ( = ?auto_1634447 ?auto_1634448 ) ) ( not ( = ?auto_1634447 ?auto_1634449 ) ) ( TRUCK-AT ?auto_1634455 ?auto_1634452 ) ( not ( = ?auto_1634452 ?auto_1634454 ) ) ( HOIST-AT ?auto_1634451 ?auto_1634452 ) ( not ( = ?auto_1634450 ?auto_1634451 ) ) ( AVAILABLE ?auto_1634451 ) ( SURFACE-AT ?auto_1634449 ?auto_1634452 ) ( ON ?auto_1634449 ?auto_1634453 ) ( CLEAR ?auto_1634449 ) ( not ( = ?auto_1634448 ?auto_1634453 ) ) ( not ( = ?auto_1634449 ?auto_1634453 ) ) ( not ( = ?auto_1634447 ?auto_1634453 ) ) ( ON ?auto_1634438 ?auto_1634437 ) ( ON ?auto_1634439 ?auto_1634438 ) ( ON ?auto_1634441 ?auto_1634439 ) ( ON ?auto_1634440 ?auto_1634441 ) ( ON ?auto_1634442 ?auto_1634440 ) ( ON ?auto_1634443 ?auto_1634442 ) ( ON ?auto_1634444 ?auto_1634443 ) ( ON ?auto_1634445 ?auto_1634444 ) ( ON ?auto_1634446 ?auto_1634445 ) ( ON ?auto_1634447 ?auto_1634446 ) ( not ( = ?auto_1634437 ?auto_1634438 ) ) ( not ( = ?auto_1634437 ?auto_1634439 ) ) ( not ( = ?auto_1634437 ?auto_1634441 ) ) ( not ( = ?auto_1634437 ?auto_1634440 ) ) ( not ( = ?auto_1634437 ?auto_1634442 ) ) ( not ( = ?auto_1634437 ?auto_1634443 ) ) ( not ( = ?auto_1634437 ?auto_1634444 ) ) ( not ( = ?auto_1634437 ?auto_1634445 ) ) ( not ( = ?auto_1634437 ?auto_1634446 ) ) ( not ( = ?auto_1634437 ?auto_1634447 ) ) ( not ( = ?auto_1634437 ?auto_1634448 ) ) ( not ( = ?auto_1634437 ?auto_1634449 ) ) ( not ( = ?auto_1634437 ?auto_1634453 ) ) ( not ( = ?auto_1634438 ?auto_1634439 ) ) ( not ( = ?auto_1634438 ?auto_1634441 ) ) ( not ( = ?auto_1634438 ?auto_1634440 ) ) ( not ( = ?auto_1634438 ?auto_1634442 ) ) ( not ( = ?auto_1634438 ?auto_1634443 ) ) ( not ( = ?auto_1634438 ?auto_1634444 ) ) ( not ( = ?auto_1634438 ?auto_1634445 ) ) ( not ( = ?auto_1634438 ?auto_1634446 ) ) ( not ( = ?auto_1634438 ?auto_1634447 ) ) ( not ( = ?auto_1634438 ?auto_1634448 ) ) ( not ( = ?auto_1634438 ?auto_1634449 ) ) ( not ( = ?auto_1634438 ?auto_1634453 ) ) ( not ( = ?auto_1634439 ?auto_1634441 ) ) ( not ( = ?auto_1634439 ?auto_1634440 ) ) ( not ( = ?auto_1634439 ?auto_1634442 ) ) ( not ( = ?auto_1634439 ?auto_1634443 ) ) ( not ( = ?auto_1634439 ?auto_1634444 ) ) ( not ( = ?auto_1634439 ?auto_1634445 ) ) ( not ( = ?auto_1634439 ?auto_1634446 ) ) ( not ( = ?auto_1634439 ?auto_1634447 ) ) ( not ( = ?auto_1634439 ?auto_1634448 ) ) ( not ( = ?auto_1634439 ?auto_1634449 ) ) ( not ( = ?auto_1634439 ?auto_1634453 ) ) ( not ( = ?auto_1634441 ?auto_1634440 ) ) ( not ( = ?auto_1634441 ?auto_1634442 ) ) ( not ( = ?auto_1634441 ?auto_1634443 ) ) ( not ( = ?auto_1634441 ?auto_1634444 ) ) ( not ( = ?auto_1634441 ?auto_1634445 ) ) ( not ( = ?auto_1634441 ?auto_1634446 ) ) ( not ( = ?auto_1634441 ?auto_1634447 ) ) ( not ( = ?auto_1634441 ?auto_1634448 ) ) ( not ( = ?auto_1634441 ?auto_1634449 ) ) ( not ( = ?auto_1634441 ?auto_1634453 ) ) ( not ( = ?auto_1634440 ?auto_1634442 ) ) ( not ( = ?auto_1634440 ?auto_1634443 ) ) ( not ( = ?auto_1634440 ?auto_1634444 ) ) ( not ( = ?auto_1634440 ?auto_1634445 ) ) ( not ( = ?auto_1634440 ?auto_1634446 ) ) ( not ( = ?auto_1634440 ?auto_1634447 ) ) ( not ( = ?auto_1634440 ?auto_1634448 ) ) ( not ( = ?auto_1634440 ?auto_1634449 ) ) ( not ( = ?auto_1634440 ?auto_1634453 ) ) ( not ( = ?auto_1634442 ?auto_1634443 ) ) ( not ( = ?auto_1634442 ?auto_1634444 ) ) ( not ( = ?auto_1634442 ?auto_1634445 ) ) ( not ( = ?auto_1634442 ?auto_1634446 ) ) ( not ( = ?auto_1634442 ?auto_1634447 ) ) ( not ( = ?auto_1634442 ?auto_1634448 ) ) ( not ( = ?auto_1634442 ?auto_1634449 ) ) ( not ( = ?auto_1634442 ?auto_1634453 ) ) ( not ( = ?auto_1634443 ?auto_1634444 ) ) ( not ( = ?auto_1634443 ?auto_1634445 ) ) ( not ( = ?auto_1634443 ?auto_1634446 ) ) ( not ( = ?auto_1634443 ?auto_1634447 ) ) ( not ( = ?auto_1634443 ?auto_1634448 ) ) ( not ( = ?auto_1634443 ?auto_1634449 ) ) ( not ( = ?auto_1634443 ?auto_1634453 ) ) ( not ( = ?auto_1634444 ?auto_1634445 ) ) ( not ( = ?auto_1634444 ?auto_1634446 ) ) ( not ( = ?auto_1634444 ?auto_1634447 ) ) ( not ( = ?auto_1634444 ?auto_1634448 ) ) ( not ( = ?auto_1634444 ?auto_1634449 ) ) ( not ( = ?auto_1634444 ?auto_1634453 ) ) ( not ( = ?auto_1634445 ?auto_1634446 ) ) ( not ( = ?auto_1634445 ?auto_1634447 ) ) ( not ( = ?auto_1634445 ?auto_1634448 ) ) ( not ( = ?auto_1634445 ?auto_1634449 ) ) ( not ( = ?auto_1634445 ?auto_1634453 ) ) ( not ( = ?auto_1634446 ?auto_1634447 ) ) ( not ( = ?auto_1634446 ?auto_1634448 ) ) ( not ( = ?auto_1634446 ?auto_1634449 ) ) ( not ( = ?auto_1634446 ?auto_1634453 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1634447 ?auto_1634448 ?auto_1634449 )
      ( MAKE-12CRATE-VERIFY ?auto_1634437 ?auto_1634438 ?auto_1634439 ?auto_1634441 ?auto_1634440 ?auto_1634442 ?auto_1634443 ?auto_1634444 ?auto_1634445 ?auto_1634446 ?auto_1634447 ?auto_1634448 ?auto_1634449 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1634600 - SURFACE
      ?auto_1634601 - SURFACE
      ?auto_1634602 - SURFACE
      ?auto_1634604 - SURFACE
      ?auto_1634603 - SURFACE
      ?auto_1634605 - SURFACE
      ?auto_1634606 - SURFACE
      ?auto_1634607 - SURFACE
      ?auto_1634608 - SURFACE
      ?auto_1634609 - SURFACE
      ?auto_1634610 - SURFACE
      ?auto_1634611 - SURFACE
      ?auto_1634612 - SURFACE
    )
    :vars
    (
      ?auto_1634615 - HOIST
      ?auto_1634616 - PLACE
      ?auto_1634613 - PLACE
      ?auto_1634614 - HOIST
      ?auto_1634618 - SURFACE
      ?auto_1634617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1634615 ?auto_1634616 ) ( SURFACE-AT ?auto_1634611 ?auto_1634616 ) ( CLEAR ?auto_1634611 ) ( IS-CRATE ?auto_1634612 ) ( not ( = ?auto_1634611 ?auto_1634612 ) ) ( AVAILABLE ?auto_1634615 ) ( ON ?auto_1634611 ?auto_1634610 ) ( not ( = ?auto_1634610 ?auto_1634611 ) ) ( not ( = ?auto_1634610 ?auto_1634612 ) ) ( not ( = ?auto_1634613 ?auto_1634616 ) ) ( HOIST-AT ?auto_1634614 ?auto_1634613 ) ( not ( = ?auto_1634615 ?auto_1634614 ) ) ( AVAILABLE ?auto_1634614 ) ( SURFACE-AT ?auto_1634612 ?auto_1634613 ) ( ON ?auto_1634612 ?auto_1634618 ) ( CLEAR ?auto_1634612 ) ( not ( = ?auto_1634611 ?auto_1634618 ) ) ( not ( = ?auto_1634612 ?auto_1634618 ) ) ( not ( = ?auto_1634610 ?auto_1634618 ) ) ( TRUCK-AT ?auto_1634617 ?auto_1634616 ) ( ON ?auto_1634601 ?auto_1634600 ) ( ON ?auto_1634602 ?auto_1634601 ) ( ON ?auto_1634604 ?auto_1634602 ) ( ON ?auto_1634603 ?auto_1634604 ) ( ON ?auto_1634605 ?auto_1634603 ) ( ON ?auto_1634606 ?auto_1634605 ) ( ON ?auto_1634607 ?auto_1634606 ) ( ON ?auto_1634608 ?auto_1634607 ) ( ON ?auto_1634609 ?auto_1634608 ) ( ON ?auto_1634610 ?auto_1634609 ) ( not ( = ?auto_1634600 ?auto_1634601 ) ) ( not ( = ?auto_1634600 ?auto_1634602 ) ) ( not ( = ?auto_1634600 ?auto_1634604 ) ) ( not ( = ?auto_1634600 ?auto_1634603 ) ) ( not ( = ?auto_1634600 ?auto_1634605 ) ) ( not ( = ?auto_1634600 ?auto_1634606 ) ) ( not ( = ?auto_1634600 ?auto_1634607 ) ) ( not ( = ?auto_1634600 ?auto_1634608 ) ) ( not ( = ?auto_1634600 ?auto_1634609 ) ) ( not ( = ?auto_1634600 ?auto_1634610 ) ) ( not ( = ?auto_1634600 ?auto_1634611 ) ) ( not ( = ?auto_1634600 ?auto_1634612 ) ) ( not ( = ?auto_1634600 ?auto_1634618 ) ) ( not ( = ?auto_1634601 ?auto_1634602 ) ) ( not ( = ?auto_1634601 ?auto_1634604 ) ) ( not ( = ?auto_1634601 ?auto_1634603 ) ) ( not ( = ?auto_1634601 ?auto_1634605 ) ) ( not ( = ?auto_1634601 ?auto_1634606 ) ) ( not ( = ?auto_1634601 ?auto_1634607 ) ) ( not ( = ?auto_1634601 ?auto_1634608 ) ) ( not ( = ?auto_1634601 ?auto_1634609 ) ) ( not ( = ?auto_1634601 ?auto_1634610 ) ) ( not ( = ?auto_1634601 ?auto_1634611 ) ) ( not ( = ?auto_1634601 ?auto_1634612 ) ) ( not ( = ?auto_1634601 ?auto_1634618 ) ) ( not ( = ?auto_1634602 ?auto_1634604 ) ) ( not ( = ?auto_1634602 ?auto_1634603 ) ) ( not ( = ?auto_1634602 ?auto_1634605 ) ) ( not ( = ?auto_1634602 ?auto_1634606 ) ) ( not ( = ?auto_1634602 ?auto_1634607 ) ) ( not ( = ?auto_1634602 ?auto_1634608 ) ) ( not ( = ?auto_1634602 ?auto_1634609 ) ) ( not ( = ?auto_1634602 ?auto_1634610 ) ) ( not ( = ?auto_1634602 ?auto_1634611 ) ) ( not ( = ?auto_1634602 ?auto_1634612 ) ) ( not ( = ?auto_1634602 ?auto_1634618 ) ) ( not ( = ?auto_1634604 ?auto_1634603 ) ) ( not ( = ?auto_1634604 ?auto_1634605 ) ) ( not ( = ?auto_1634604 ?auto_1634606 ) ) ( not ( = ?auto_1634604 ?auto_1634607 ) ) ( not ( = ?auto_1634604 ?auto_1634608 ) ) ( not ( = ?auto_1634604 ?auto_1634609 ) ) ( not ( = ?auto_1634604 ?auto_1634610 ) ) ( not ( = ?auto_1634604 ?auto_1634611 ) ) ( not ( = ?auto_1634604 ?auto_1634612 ) ) ( not ( = ?auto_1634604 ?auto_1634618 ) ) ( not ( = ?auto_1634603 ?auto_1634605 ) ) ( not ( = ?auto_1634603 ?auto_1634606 ) ) ( not ( = ?auto_1634603 ?auto_1634607 ) ) ( not ( = ?auto_1634603 ?auto_1634608 ) ) ( not ( = ?auto_1634603 ?auto_1634609 ) ) ( not ( = ?auto_1634603 ?auto_1634610 ) ) ( not ( = ?auto_1634603 ?auto_1634611 ) ) ( not ( = ?auto_1634603 ?auto_1634612 ) ) ( not ( = ?auto_1634603 ?auto_1634618 ) ) ( not ( = ?auto_1634605 ?auto_1634606 ) ) ( not ( = ?auto_1634605 ?auto_1634607 ) ) ( not ( = ?auto_1634605 ?auto_1634608 ) ) ( not ( = ?auto_1634605 ?auto_1634609 ) ) ( not ( = ?auto_1634605 ?auto_1634610 ) ) ( not ( = ?auto_1634605 ?auto_1634611 ) ) ( not ( = ?auto_1634605 ?auto_1634612 ) ) ( not ( = ?auto_1634605 ?auto_1634618 ) ) ( not ( = ?auto_1634606 ?auto_1634607 ) ) ( not ( = ?auto_1634606 ?auto_1634608 ) ) ( not ( = ?auto_1634606 ?auto_1634609 ) ) ( not ( = ?auto_1634606 ?auto_1634610 ) ) ( not ( = ?auto_1634606 ?auto_1634611 ) ) ( not ( = ?auto_1634606 ?auto_1634612 ) ) ( not ( = ?auto_1634606 ?auto_1634618 ) ) ( not ( = ?auto_1634607 ?auto_1634608 ) ) ( not ( = ?auto_1634607 ?auto_1634609 ) ) ( not ( = ?auto_1634607 ?auto_1634610 ) ) ( not ( = ?auto_1634607 ?auto_1634611 ) ) ( not ( = ?auto_1634607 ?auto_1634612 ) ) ( not ( = ?auto_1634607 ?auto_1634618 ) ) ( not ( = ?auto_1634608 ?auto_1634609 ) ) ( not ( = ?auto_1634608 ?auto_1634610 ) ) ( not ( = ?auto_1634608 ?auto_1634611 ) ) ( not ( = ?auto_1634608 ?auto_1634612 ) ) ( not ( = ?auto_1634608 ?auto_1634618 ) ) ( not ( = ?auto_1634609 ?auto_1634610 ) ) ( not ( = ?auto_1634609 ?auto_1634611 ) ) ( not ( = ?auto_1634609 ?auto_1634612 ) ) ( not ( = ?auto_1634609 ?auto_1634618 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1634610 ?auto_1634611 ?auto_1634612 )
      ( MAKE-12CRATE-VERIFY ?auto_1634600 ?auto_1634601 ?auto_1634602 ?auto_1634604 ?auto_1634603 ?auto_1634605 ?auto_1634606 ?auto_1634607 ?auto_1634608 ?auto_1634609 ?auto_1634610 ?auto_1634611 ?auto_1634612 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1634763 - SURFACE
      ?auto_1634764 - SURFACE
      ?auto_1634765 - SURFACE
      ?auto_1634767 - SURFACE
      ?auto_1634766 - SURFACE
      ?auto_1634768 - SURFACE
      ?auto_1634769 - SURFACE
      ?auto_1634770 - SURFACE
      ?auto_1634771 - SURFACE
      ?auto_1634772 - SURFACE
      ?auto_1634773 - SURFACE
      ?auto_1634774 - SURFACE
      ?auto_1634775 - SURFACE
    )
    :vars
    (
      ?auto_1634779 - HOIST
      ?auto_1634777 - PLACE
      ?auto_1634781 - PLACE
      ?auto_1634778 - HOIST
      ?auto_1634776 - SURFACE
      ?auto_1634780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1634779 ?auto_1634777 ) ( IS-CRATE ?auto_1634775 ) ( not ( = ?auto_1634774 ?auto_1634775 ) ) ( not ( = ?auto_1634773 ?auto_1634774 ) ) ( not ( = ?auto_1634773 ?auto_1634775 ) ) ( not ( = ?auto_1634781 ?auto_1634777 ) ) ( HOIST-AT ?auto_1634778 ?auto_1634781 ) ( not ( = ?auto_1634779 ?auto_1634778 ) ) ( AVAILABLE ?auto_1634778 ) ( SURFACE-AT ?auto_1634775 ?auto_1634781 ) ( ON ?auto_1634775 ?auto_1634776 ) ( CLEAR ?auto_1634775 ) ( not ( = ?auto_1634774 ?auto_1634776 ) ) ( not ( = ?auto_1634775 ?auto_1634776 ) ) ( not ( = ?auto_1634773 ?auto_1634776 ) ) ( TRUCK-AT ?auto_1634780 ?auto_1634777 ) ( SURFACE-AT ?auto_1634773 ?auto_1634777 ) ( CLEAR ?auto_1634773 ) ( LIFTING ?auto_1634779 ?auto_1634774 ) ( IS-CRATE ?auto_1634774 ) ( ON ?auto_1634764 ?auto_1634763 ) ( ON ?auto_1634765 ?auto_1634764 ) ( ON ?auto_1634767 ?auto_1634765 ) ( ON ?auto_1634766 ?auto_1634767 ) ( ON ?auto_1634768 ?auto_1634766 ) ( ON ?auto_1634769 ?auto_1634768 ) ( ON ?auto_1634770 ?auto_1634769 ) ( ON ?auto_1634771 ?auto_1634770 ) ( ON ?auto_1634772 ?auto_1634771 ) ( ON ?auto_1634773 ?auto_1634772 ) ( not ( = ?auto_1634763 ?auto_1634764 ) ) ( not ( = ?auto_1634763 ?auto_1634765 ) ) ( not ( = ?auto_1634763 ?auto_1634767 ) ) ( not ( = ?auto_1634763 ?auto_1634766 ) ) ( not ( = ?auto_1634763 ?auto_1634768 ) ) ( not ( = ?auto_1634763 ?auto_1634769 ) ) ( not ( = ?auto_1634763 ?auto_1634770 ) ) ( not ( = ?auto_1634763 ?auto_1634771 ) ) ( not ( = ?auto_1634763 ?auto_1634772 ) ) ( not ( = ?auto_1634763 ?auto_1634773 ) ) ( not ( = ?auto_1634763 ?auto_1634774 ) ) ( not ( = ?auto_1634763 ?auto_1634775 ) ) ( not ( = ?auto_1634763 ?auto_1634776 ) ) ( not ( = ?auto_1634764 ?auto_1634765 ) ) ( not ( = ?auto_1634764 ?auto_1634767 ) ) ( not ( = ?auto_1634764 ?auto_1634766 ) ) ( not ( = ?auto_1634764 ?auto_1634768 ) ) ( not ( = ?auto_1634764 ?auto_1634769 ) ) ( not ( = ?auto_1634764 ?auto_1634770 ) ) ( not ( = ?auto_1634764 ?auto_1634771 ) ) ( not ( = ?auto_1634764 ?auto_1634772 ) ) ( not ( = ?auto_1634764 ?auto_1634773 ) ) ( not ( = ?auto_1634764 ?auto_1634774 ) ) ( not ( = ?auto_1634764 ?auto_1634775 ) ) ( not ( = ?auto_1634764 ?auto_1634776 ) ) ( not ( = ?auto_1634765 ?auto_1634767 ) ) ( not ( = ?auto_1634765 ?auto_1634766 ) ) ( not ( = ?auto_1634765 ?auto_1634768 ) ) ( not ( = ?auto_1634765 ?auto_1634769 ) ) ( not ( = ?auto_1634765 ?auto_1634770 ) ) ( not ( = ?auto_1634765 ?auto_1634771 ) ) ( not ( = ?auto_1634765 ?auto_1634772 ) ) ( not ( = ?auto_1634765 ?auto_1634773 ) ) ( not ( = ?auto_1634765 ?auto_1634774 ) ) ( not ( = ?auto_1634765 ?auto_1634775 ) ) ( not ( = ?auto_1634765 ?auto_1634776 ) ) ( not ( = ?auto_1634767 ?auto_1634766 ) ) ( not ( = ?auto_1634767 ?auto_1634768 ) ) ( not ( = ?auto_1634767 ?auto_1634769 ) ) ( not ( = ?auto_1634767 ?auto_1634770 ) ) ( not ( = ?auto_1634767 ?auto_1634771 ) ) ( not ( = ?auto_1634767 ?auto_1634772 ) ) ( not ( = ?auto_1634767 ?auto_1634773 ) ) ( not ( = ?auto_1634767 ?auto_1634774 ) ) ( not ( = ?auto_1634767 ?auto_1634775 ) ) ( not ( = ?auto_1634767 ?auto_1634776 ) ) ( not ( = ?auto_1634766 ?auto_1634768 ) ) ( not ( = ?auto_1634766 ?auto_1634769 ) ) ( not ( = ?auto_1634766 ?auto_1634770 ) ) ( not ( = ?auto_1634766 ?auto_1634771 ) ) ( not ( = ?auto_1634766 ?auto_1634772 ) ) ( not ( = ?auto_1634766 ?auto_1634773 ) ) ( not ( = ?auto_1634766 ?auto_1634774 ) ) ( not ( = ?auto_1634766 ?auto_1634775 ) ) ( not ( = ?auto_1634766 ?auto_1634776 ) ) ( not ( = ?auto_1634768 ?auto_1634769 ) ) ( not ( = ?auto_1634768 ?auto_1634770 ) ) ( not ( = ?auto_1634768 ?auto_1634771 ) ) ( not ( = ?auto_1634768 ?auto_1634772 ) ) ( not ( = ?auto_1634768 ?auto_1634773 ) ) ( not ( = ?auto_1634768 ?auto_1634774 ) ) ( not ( = ?auto_1634768 ?auto_1634775 ) ) ( not ( = ?auto_1634768 ?auto_1634776 ) ) ( not ( = ?auto_1634769 ?auto_1634770 ) ) ( not ( = ?auto_1634769 ?auto_1634771 ) ) ( not ( = ?auto_1634769 ?auto_1634772 ) ) ( not ( = ?auto_1634769 ?auto_1634773 ) ) ( not ( = ?auto_1634769 ?auto_1634774 ) ) ( not ( = ?auto_1634769 ?auto_1634775 ) ) ( not ( = ?auto_1634769 ?auto_1634776 ) ) ( not ( = ?auto_1634770 ?auto_1634771 ) ) ( not ( = ?auto_1634770 ?auto_1634772 ) ) ( not ( = ?auto_1634770 ?auto_1634773 ) ) ( not ( = ?auto_1634770 ?auto_1634774 ) ) ( not ( = ?auto_1634770 ?auto_1634775 ) ) ( not ( = ?auto_1634770 ?auto_1634776 ) ) ( not ( = ?auto_1634771 ?auto_1634772 ) ) ( not ( = ?auto_1634771 ?auto_1634773 ) ) ( not ( = ?auto_1634771 ?auto_1634774 ) ) ( not ( = ?auto_1634771 ?auto_1634775 ) ) ( not ( = ?auto_1634771 ?auto_1634776 ) ) ( not ( = ?auto_1634772 ?auto_1634773 ) ) ( not ( = ?auto_1634772 ?auto_1634774 ) ) ( not ( = ?auto_1634772 ?auto_1634775 ) ) ( not ( = ?auto_1634772 ?auto_1634776 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1634773 ?auto_1634774 ?auto_1634775 )
      ( MAKE-12CRATE-VERIFY ?auto_1634763 ?auto_1634764 ?auto_1634765 ?auto_1634767 ?auto_1634766 ?auto_1634768 ?auto_1634769 ?auto_1634770 ?auto_1634771 ?auto_1634772 ?auto_1634773 ?auto_1634774 ?auto_1634775 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1634926 - SURFACE
      ?auto_1634927 - SURFACE
      ?auto_1634928 - SURFACE
      ?auto_1634930 - SURFACE
      ?auto_1634929 - SURFACE
      ?auto_1634931 - SURFACE
      ?auto_1634932 - SURFACE
      ?auto_1634933 - SURFACE
      ?auto_1634934 - SURFACE
      ?auto_1634935 - SURFACE
      ?auto_1634936 - SURFACE
      ?auto_1634937 - SURFACE
      ?auto_1634938 - SURFACE
    )
    :vars
    (
      ?auto_1634941 - HOIST
      ?auto_1634942 - PLACE
      ?auto_1634944 - PLACE
      ?auto_1634939 - HOIST
      ?auto_1634940 - SURFACE
      ?auto_1634943 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1634941 ?auto_1634942 ) ( IS-CRATE ?auto_1634938 ) ( not ( = ?auto_1634937 ?auto_1634938 ) ) ( not ( = ?auto_1634936 ?auto_1634937 ) ) ( not ( = ?auto_1634936 ?auto_1634938 ) ) ( not ( = ?auto_1634944 ?auto_1634942 ) ) ( HOIST-AT ?auto_1634939 ?auto_1634944 ) ( not ( = ?auto_1634941 ?auto_1634939 ) ) ( AVAILABLE ?auto_1634939 ) ( SURFACE-AT ?auto_1634938 ?auto_1634944 ) ( ON ?auto_1634938 ?auto_1634940 ) ( CLEAR ?auto_1634938 ) ( not ( = ?auto_1634937 ?auto_1634940 ) ) ( not ( = ?auto_1634938 ?auto_1634940 ) ) ( not ( = ?auto_1634936 ?auto_1634940 ) ) ( TRUCK-AT ?auto_1634943 ?auto_1634942 ) ( SURFACE-AT ?auto_1634936 ?auto_1634942 ) ( CLEAR ?auto_1634936 ) ( IS-CRATE ?auto_1634937 ) ( AVAILABLE ?auto_1634941 ) ( IN ?auto_1634937 ?auto_1634943 ) ( ON ?auto_1634927 ?auto_1634926 ) ( ON ?auto_1634928 ?auto_1634927 ) ( ON ?auto_1634930 ?auto_1634928 ) ( ON ?auto_1634929 ?auto_1634930 ) ( ON ?auto_1634931 ?auto_1634929 ) ( ON ?auto_1634932 ?auto_1634931 ) ( ON ?auto_1634933 ?auto_1634932 ) ( ON ?auto_1634934 ?auto_1634933 ) ( ON ?auto_1634935 ?auto_1634934 ) ( ON ?auto_1634936 ?auto_1634935 ) ( not ( = ?auto_1634926 ?auto_1634927 ) ) ( not ( = ?auto_1634926 ?auto_1634928 ) ) ( not ( = ?auto_1634926 ?auto_1634930 ) ) ( not ( = ?auto_1634926 ?auto_1634929 ) ) ( not ( = ?auto_1634926 ?auto_1634931 ) ) ( not ( = ?auto_1634926 ?auto_1634932 ) ) ( not ( = ?auto_1634926 ?auto_1634933 ) ) ( not ( = ?auto_1634926 ?auto_1634934 ) ) ( not ( = ?auto_1634926 ?auto_1634935 ) ) ( not ( = ?auto_1634926 ?auto_1634936 ) ) ( not ( = ?auto_1634926 ?auto_1634937 ) ) ( not ( = ?auto_1634926 ?auto_1634938 ) ) ( not ( = ?auto_1634926 ?auto_1634940 ) ) ( not ( = ?auto_1634927 ?auto_1634928 ) ) ( not ( = ?auto_1634927 ?auto_1634930 ) ) ( not ( = ?auto_1634927 ?auto_1634929 ) ) ( not ( = ?auto_1634927 ?auto_1634931 ) ) ( not ( = ?auto_1634927 ?auto_1634932 ) ) ( not ( = ?auto_1634927 ?auto_1634933 ) ) ( not ( = ?auto_1634927 ?auto_1634934 ) ) ( not ( = ?auto_1634927 ?auto_1634935 ) ) ( not ( = ?auto_1634927 ?auto_1634936 ) ) ( not ( = ?auto_1634927 ?auto_1634937 ) ) ( not ( = ?auto_1634927 ?auto_1634938 ) ) ( not ( = ?auto_1634927 ?auto_1634940 ) ) ( not ( = ?auto_1634928 ?auto_1634930 ) ) ( not ( = ?auto_1634928 ?auto_1634929 ) ) ( not ( = ?auto_1634928 ?auto_1634931 ) ) ( not ( = ?auto_1634928 ?auto_1634932 ) ) ( not ( = ?auto_1634928 ?auto_1634933 ) ) ( not ( = ?auto_1634928 ?auto_1634934 ) ) ( not ( = ?auto_1634928 ?auto_1634935 ) ) ( not ( = ?auto_1634928 ?auto_1634936 ) ) ( not ( = ?auto_1634928 ?auto_1634937 ) ) ( not ( = ?auto_1634928 ?auto_1634938 ) ) ( not ( = ?auto_1634928 ?auto_1634940 ) ) ( not ( = ?auto_1634930 ?auto_1634929 ) ) ( not ( = ?auto_1634930 ?auto_1634931 ) ) ( not ( = ?auto_1634930 ?auto_1634932 ) ) ( not ( = ?auto_1634930 ?auto_1634933 ) ) ( not ( = ?auto_1634930 ?auto_1634934 ) ) ( not ( = ?auto_1634930 ?auto_1634935 ) ) ( not ( = ?auto_1634930 ?auto_1634936 ) ) ( not ( = ?auto_1634930 ?auto_1634937 ) ) ( not ( = ?auto_1634930 ?auto_1634938 ) ) ( not ( = ?auto_1634930 ?auto_1634940 ) ) ( not ( = ?auto_1634929 ?auto_1634931 ) ) ( not ( = ?auto_1634929 ?auto_1634932 ) ) ( not ( = ?auto_1634929 ?auto_1634933 ) ) ( not ( = ?auto_1634929 ?auto_1634934 ) ) ( not ( = ?auto_1634929 ?auto_1634935 ) ) ( not ( = ?auto_1634929 ?auto_1634936 ) ) ( not ( = ?auto_1634929 ?auto_1634937 ) ) ( not ( = ?auto_1634929 ?auto_1634938 ) ) ( not ( = ?auto_1634929 ?auto_1634940 ) ) ( not ( = ?auto_1634931 ?auto_1634932 ) ) ( not ( = ?auto_1634931 ?auto_1634933 ) ) ( not ( = ?auto_1634931 ?auto_1634934 ) ) ( not ( = ?auto_1634931 ?auto_1634935 ) ) ( not ( = ?auto_1634931 ?auto_1634936 ) ) ( not ( = ?auto_1634931 ?auto_1634937 ) ) ( not ( = ?auto_1634931 ?auto_1634938 ) ) ( not ( = ?auto_1634931 ?auto_1634940 ) ) ( not ( = ?auto_1634932 ?auto_1634933 ) ) ( not ( = ?auto_1634932 ?auto_1634934 ) ) ( not ( = ?auto_1634932 ?auto_1634935 ) ) ( not ( = ?auto_1634932 ?auto_1634936 ) ) ( not ( = ?auto_1634932 ?auto_1634937 ) ) ( not ( = ?auto_1634932 ?auto_1634938 ) ) ( not ( = ?auto_1634932 ?auto_1634940 ) ) ( not ( = ?auto_1634933 ?auto_1634934 ) ) ( not ( = ?auto_1634933 ?auto_1634935 ) ) ( not ( = ?auto_1634933 ?auto_1634936 ) ) ( not ( = ?auto_1634933 ?auto_1634937 ) ) ( not ( = ?auto_1634933 ?auto_1634938 ) ) ( not ( = ?auto_1634933 ?auto_1634940 ) ) ( not ( = ?auto_1634934 ?auto_1634935 ) ) ( not ( = ?auto_1634934 ?auto_1634936 ) ) ( not ( = ?auto_1634934 ?auto_1634937 ) ) ( not ( = ?auto_1634934 ?auto_1634938 ) ) ( not ( = ?auto_1634934 ?auto_1634940 ) ) ( not ( = ?auto_1634935 ?auto_1634936 ) ) ( not ( = ?auto_1634935 ?auto_1634937 ) ) ( not ( = ?auto_1634935 ?auto_1634938 ) ) ( not ( = ?auto_1634935 ?auto_1634940 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1634936 ?auto_1634937 ?auto_1634938 )
      ( MAKE-12CRATE-VERIFY ?auto_1634926 ?auto_1634927 ?auto_1634928 ?auto_1634930 ?auto_1634929 ?auto_1634931 ?auto_1634932 ?auto_1634933 ?auto_1634934 ?auto_1634935 ?auto_1634936 ?auto_1634937 ?auto_1634938 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1646507 - SURFACE
      ?auto_1646508 - SURFACE
      ?auto_1646509 - SURFACE
      ?auto_1646511 - SURFACE
      ?auto_1646510 - SURFACE
      ?auto_1646512 - SURFACE
      ?auto_1646513 - SURFACE
      ?auto_1646514 - SURFACE
      ?auto_1646515 - SURFACE
      ?auto_1646516 - SURFACE
      ?auto_1646517 - SURFACE
      ?auto_1646518 - SURFACE
      ?auto_1646519 - SURFACE
      ?auto_1646520 - SURFACE
    )
    :vars
    (
      ?auto_1646522 - HOIST
      ?auto_1646521 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1646522 ?auto_1646521 ) ( SURFACE-AT ?auto_1646519 ?auto_1646521 ) ( CLEAR ?auto_1646519 ) ( LIFTING ?auto_1646522 ?auto_1646520 ) ( IS-CRATE ?auto_1646520 ) ( not ( = ?auto_1646519 ?auto_1646520 ) ) ( ON ?auto_1646508 ?auto_1646507 ) ( ON ?auto_1646509 ?auto_1646508 ) ( ON ?auto_1646511 ?auto_1646509 ) ( ON ?auto_1646510 ?auto_1646511 ) ( ON ?auto_1646512 ?auto_1646510 ) ( ON ?auto_1646513 ?auto_1646512 ) ( ON ?auto_1646514 ?auto_1646513 ) ( ON ?auto_1646515 ?auto_1646514 ) ( ON ?auto_1646516 ?auto_1646515 ) ( ON ?auto_1646517 ?auto_1646516 ) ( ON ?auto_1646518 ?auto_1646517 ) ( ON ?auto_1646519 ?auto_1646518 ) ( not ( = ?auto_1646507 ?auto_1646508 ) ) ( not ( = ?auto_1646507 ?auto_1646509 ) ) ( not ( = ?auto_1646507 ?auto_1646511 ) ) ( not ( = ?auto_1646507 ?auto_1646510 ) ) ( not ( = ?auto_1646507 ?auto_1646512 ) ) ( not ( = ?auto_1646507 ?auto_1646513 ) ) ( not ( = ?auto_1646507 ?auto_1646514 ) ) ( not ( = ?auto_1646507 ?auto_1646515 ) ) ( not ( = ?auto_1646507 ?auto_1646516 ) ) ( not ( = ?auto_1646507 ?auto_1646517 ) ) ( not ( = ?auto_1646507 ?auto_1646518 ) ) ( not ( = ?auto_1646507 ?auto_1646519 ) ) ( not ( = ?auto_1646507 ?auto_1646520 ) ) ( not ( = ?auto_1646508 ?auto_1646509 ) ) ( not ( = ?auto_1646508 ?auto_1646511 ) ) ( not ( = ?auto_1646508 ?auto_1646510 ) ) ( not ( = ?auto_1646508 ?auto_1646512 ) ) ( not ( = ?auto_1646508 ?auto_1646513 ) ) ( not ( = ?auto_1646508 ?auto_1646514 ) ) ( not ( = ?auto_1646508 ?auto_1646515 ) ) ( not ( = ?auto_1646508 ?auto_1646516 ) ) ( not ( = ?auto_1646508 ?auto_1646517 ) ) ( not ( = ?auto_1646508 ?auto_1646518 ) ) ( not ( = ?auto_1646508 ?auto_1646519 ) ) ( not ( = ?auto_1646508 ?auto_1646520 ) ) ( not ( = ?auto_1646509 ?auto_1646511 ) ) ( not ( = ?auto_1646509 ?auto_1646510 ) ) ( not ( = ?auto_1646509 ?auto_1646512 ) ) ( not ( = ?auto_1646509 ?auto_1646513 ) ) ( not ( = ?auto_1646509 ?auto_1646514 ) ) ( not ( = ?auto_1646509 ?auto_1646515 ) ) ( not ( = ?auto_1646509 ?auto_1646516 ) ) ( not ( = ?auto_1646509 ?auto_1646517 ) ) ( not ( = ?auto_1646509 ?auto_1646518 ) ) ( not ( = ?auto_1646509 ?auto_1646519 ) ) ( not ( = ?auto_1646509 ?auto_1646520 ) ) ( not ( = ?auto_1646511 ?auto_1646510 ) ) ( not ( = ?auto_1646511 ?auto_1646512 ) ) ( not ( = ?auto_1646511 ?auto_1646513 ) ) ( not ( = ?auto_1646511 ?auto_1646514 ) ) ( not ( = ?auto_1646511 ?auto_1646515 ) ) ( not ( = ?auto_1646511 ?auto_1646516 ) ) ( not ( = ?auto_1646511 ?auto_1646517 ) ) ( not ( = ?auto_1646511 ?auto_1646518 ) ) ( not ( = ?auto_1646511 ?auto_1646519 ) ) ( not ( = ?auto_1646511 ?auto_1646520 ) ) ( not ( = ?auto_1646510 ?auto_1646512 ) ) ( not ( = ?auto_1646510 ?auto_1646513 ) ) ( not ( = ?auto_1646510 ?auto_1646514 ) ) ( not ( = ?auto_1646510 ?auto_1646515 ) ) ( not ( = ?auto_1646510 ?auto_1646516 ) ) ( not ( = ?auto_1646510 ?auto_1646517 ) ) ( not ( = ?auto_1646510 ?auto_1646518 ) ) ( not ( = ?auto_1646510 ?auto_1646519 ) ) ( not ( = ?auto_1646510 ?auto_1646520 ) ) ( not ( = ?auto_1646512 ?auto_1646513 ) ) ( not ( = ?auto_1646512 ?auto_1646514 ) ) ( not ( = ?auto_1646512 ?auto_1646515 ) ) ( not ( = ?auto_1646512 ?auto_1646516 ) ) ( not ( = ?auto_1646512 ?auto_1646517 ) ) ( not ( = ?auto_1646512 ?auto_1646518 ) ) ( not ( = ?auto_1646512 ?auto_1646519 ) ) ( not ( = ?auto_1646512 ?auto_1646520 ) ) ( not ( = ?auto_1646513 ?auto_1646514 ) ) ( not ( = ?auto_1646513 ?auto_1646515 ) ) ( not ( = ?auto_1646513 ?auto_1646516 ) ) ( not ( = ?auto_1646513 ?auto_1646517 ) ) ( not ( = ?auto_1646513 ?auto_1646518 ) ) ( not ( = ?auto_1646513 ?auto_1646519 ) ) ( not ( = ?auto_1646513 ?auto_1646520 ) ) ( not ( = ?auto_1646514 ?auto_1646515 ) ) ( not ( = ?auto_1646514 ?auto_1646516 ) ) ( not ( = ?auto_1646514 ?auto_1646517 ) ) ( not ( = ?auto_1646514 ?auto_1646518 ) ) ( not ( = ?auto_1646514 ?auto_1646519 ) ) ( not ( = ?auto_1646514 ?auto_1646520 ) ) ( not ( = ?auto_1646515 ?auto_1646516 ) ) ( not ( = ?auto_1646515 ?auto_1646517 ) ) ( not ( = ?auto_1646515 ?auto_1646518 ) ) ( not ( = ?auto_1646515 ?auto_1646519 ) ) ( not ( = ?auto_1646515 ?auto_1646520 ) ) ( not ( = ?auto_1646516 ?auto_1646517 ) ) ( not ( = ?auto_1646516 ?auto_1646518 ) ) ( not ( = ?auto_1646516 ?auto_1646519 ) ) ( not ( = ?auto_1646516 ?auto_1646520 ) ) ( not ( = ?auto_1646517 ?auto_1646518 ) ) ( not ( = ?auto_1646517 ?auto_1646519 ) ) ( not ( = ?auto_1646517 ?auto_1646520 ) ) ( not ( = ?auto_1646518 ?auto_1646519 ) ) ( not ( = ?auto_1646518 ?auto_1646520 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1646519 ?auto_1646520 )
      ( MAKE-13CRATE-VERIFY ?auto_1646507 ?auto_1646508 ?auto_1646509 ?auto_1646511 ?auto_1646510 ?auto_1646512 ?auto_1646513 ?auto_1646514 ?auto_1646515 ?auto_1646516 ?auto_1646517 ?auto_1646518 ?auto_1646519 ?auto_1646520 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1646649 - SURFACE
      ?auto_1646650 - SURFACE
      ?auto_1646651 - SURFACE
      ?auto_1646653 - SURFACE
      ?auto_1646652 - SURFACE
      ?auto_1646654 - SURFACE
      ?auto_1646655 - SURFACE
      ?auto_1646656 - SURFACE
      ?auto_1646657 - SURFACE
      ?auto_1646658 - SURFACE
      ?auto_1646659 - SURFACE
      ?auto_1646660 - SURFACE
      ?auto_1646661 - SURFACE
      ?auto_1646662 - SURFACE
    )
    :vars
    (
      ?auto_1646663 - HOIST
      ?auto_1646665 - PLACE
      ?auto_1646664 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1646663 ?auto_1646665 ) ( SURFACE-AT ?auto_1646661 ?auto_1646665 ) ( CLEAR ?auto_1646661 ) ( IS-CRATE ?auto_1646662 ) ( not ( = ?auto_1646661 ?auto_1646662 ) ) ( TRUCK-AT ?auto_1646664 ?auto_1646665 ) ( AVAILABLE ?auto_1646663 ) ( IN ?auto_1646662 ?auto_1646664 ) ( ON ?auto_1646661 ?auto_1646660 ) ( not ( = ?auto_1646660 ?auto_1646661 ) ) ( not ( = ?auto_1646660 ?auto_1646662 ) ) ( ON ?auto_1646650 ?auto_1646649 ) ( ON ?auto_1646651 ?auto_1646650 ) ( ON ?auto_1646653 ?auto_1646651 ) ( ON ?auto_1646652 ?auto_1646653 ) ( ON ?auto_1646654 ?auto_1646652 ) ( ON ?auto_1646655 ?auto_1646654 ) ( ON ?auto_1646656 ?auto_1646655 ) ( ON ?auto_1646657 ?auto_1646656 ) ( ON ?auto_1646658 ?auto_1646657 ) ( ON ?auto_1646659 ?auto_1646658 ) ( ON ?auto_1646660 ?auto_1646659 ) ( not ( = ?auto_1646649 ?auto_1646650 ) ) ( not ( = ?auto_1646649 ?auto_1646651 ) ) ( not ( = ?auto_1646649 ?auto_1646653 ) ) ( not ( = ?auto_1646649 ?auto_1646652 ) ) ( not ( = ?auto_1646649 ?auto_1646654 ) ) ( not ( = ?auto_1646649 ?auto_1646655 ) ) ( not ( = ?auto_1646649 ?auto_1646656 ) ) ( not ( = ?auto_1646649 ?auto_1646657 ) ) ( not ( = ?auto_1646649 ?auto_1646658 ) ) ( not ( = ?auto_1646649 ?auto_1646659 ) ) ( not ( = ?auto_1646649 ?auto_1646660 ) ) ( not ( = ?auto_1646649 ?auto_1646661 ) ) ( not ( = ?auto_1646649 ?auto_1646662 ) ) ( not ( = ?auto_1646650 ?auto_1646651 ) ) ( not ( = ?auto_1646650 ?auto_1646653 ) ) ( not ( = ?auto_1646650 ?auto_1646652 ) ) ( not ( = ?auto_1646650 ?auto_1646654 ) ) ( not ( = ?auto_1646650 ?auto_1646655 ) ) ( not ( = ?auto_1646650 ?auto_1646656 ) ) ( not ( = ?auto_1646650 ?auto_1646657 ) ) ( not ( = ?auto_1646650 ?auto_1646658 ) ) ( not ( = ?auto_1646650 ?auto_1646659 ) ) ( not ( = ?auto_1646650 ?auto_1646660 ) ) ( not ( = ?auto_1646650 ?auto_1646661 ) ) ( not ( = ?auto_1646650 ?auto_1646662 ) ) ( not ( = ?auto_1646651 ?auto_1646653 ) ) ( not ( = ?auto_1646651 ?auto_1646652 ) ) ( not ( = ?auto_1646651 ?auto_1646654 ) ) ( not ( = ?auto_1646651 ?auto_1646655 ) ) ( not ( = ?auto_1646651 ?auto_1646656 ) ) ( not ( = ?auto_1646651 ?auto_1646657 ) ) ( not ( = ?auto_1646651 ?auto_1646658 ) ) ( not ( = ?auto_1646651 ?auto_1646659 ) ) ( not ( = ?auto_1646651 ?auto_1646660 ) ) ( not ( = ?auto_1646651 ?auto_1646661 ) ) ( not ( = ?auto_1646651 ?auto_1646662 ) ) ( not ( = ?auto_1646653 ?auto_1646652 ) ) ( not ( = ?auto_1646653 ?auto_1646654 ) ) ( not ( = ?auto_1646653 ?auto_1646655 ) ) ( not ( = ?auto_1646653 ?auto_1646656 ) ) ( not ( = ?auto_1646653 ?auto_1646657 ) ) ( not ( = ?auto_1646653 ?auto_1646658 ) ) ( not ( = ?auto_1646653 ?auto_1646659 ) ) ( not ( = ?auto_1646653 ?auto_1646660 ) ) ( not ( = ?auto_1646653 ?auto_1646661 ) ) ( not ( = ?auto_1646653 ?auto_1646662 ) ) ( not ( = ?auto_1646652 ?auto_1646654 ) ) ( not ( = ?auto_1646652 ?auto_1646655 ) ) ( not ( = ?auto_1646652 ?auto_1646656 ) ) ( not ( = ?auto_1646652 ?auto_1646657 ) ) ( not ( = ?auto_1646652 ?auto_1646658 ) ) ( not ( = ?auto_1646652 ?auto_1646659 ) ) ( not ( = ?auto_1646652 ?auto_1646660 ) ) ( not ( = ?auto_1646652 ?auto_1646661 ) ) ( not ( = ?auto_1646652 ?auto_1646662 ) ) ( not ( = ?auto_1646654 ?auto_1646655 ) ) ( not ( = ?auto_1646654 ?auto_1646656 ) ) ( not ( = ?auto_1646654 ?auto_1646657 ) ) ( not ( = ?auto_1646654 ?auto_1646658 ) ) ( not ( = ?auto_1646654 ?auto_1646659 ) ) ( not ( = ?auto_1646654 ?auto_1646660 ) ) ( not ( = ?auto_1646654 ?auto_1646661 ) ) ( not ( = ?auto_1646654 ?auto_1646662 ) ) ( not ( = ?auto_1646655 ?auto_1646656 ) ) ( not ( = ?auto_1646655 ?auto_1646657 ) ) ( not ( = ?auto_1646655 ?auto_1646658 ) ) ( not ( = ?auto_1646655 ?auto_1646659 ) ) ( not ( = ?auto_1646655 ?auto_1646660 ) ) ( not ( = ?auto_1646655 ?auto_1646661 ) ) ( not ( = ?auto_1646655 ?auto_1646662 ) ) ( not ( = ?auto_1646656 ?auto_1646657 ) ) ( not ( = ?auto_1646656 ?auto_1646658 ) ) ( not ( = ?auto_1646656 ?auto_1646659 ) ) ( not ( = ?auto_1646656 ?auto_1646660 ) ) ( not ( = ?auto_1646656 ?auto_1646661 ) ) ( not ( = ?auto_1646656 ?auto_1646662 ) ) ( not ( = ?auto_1646657 ?auto_1646658 ) ) ( not ( = ?auto_1646657 ?auto_1646659 ) ) ( not ( = ?auto_1646657 ?auto_1646660 ) ) ( not ( = ?auto_1646657 ?auto_1646661 ) ) ( not ( = ?auto_1646657 ?auto_1646662 ) ) ( not ( = ?auto_1646658 ?auto_1646659 ) ) ( not ( = ?auto_1646658 ?auto_1646660 ) ) ( not ( = ?auto_1646658 ?auto_1646661 ) ) ( not ( = ?auto_1646658 ?auto_1646662 ) ) ( not ( = ?auto_1646659 ?auto_1646660 ) ) ( not ( = ?auto_1646659 ?auto_1646661 ) ) ( not ( = ?auto_1646659 ?auto_1646662 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1646660 ?auto_1646661 ?auto_1646662 )
      ( MAKE-13CRATE-VERIFY ?auto_1646649 ?auto_1646650 ?auto_1646651 ?auto_1646653 ?auto_1646652 ?auto_1646654 ?auto_1646655 ?auto_1646656 ?auto_1646657 ?auto_1646658 ?auto_1646659 ?auto_1646660 ?auto_1646661 ?auto_1646662 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1646805 - SURFACE
      ?auto_1646806 - SURFACE
      ?auto_1646807 - SURFACE
      ?auto_1646809 - SURFACE
      ?auto_1646808 - SURFACE
      ?auto_1646810 - SURFACE
      ?auto_1646811 - SURFACE
      ?auto_1646812 - SURFACE
      ?auto_1646813 - SURFACE
      ?auto_1646814 - SURFACE
      ?auto_1646815 - SURFACE
      ?auto_1646816 - SURFACE
      ?auto_1646817 - SURFACE
      ?auto_1646818 - SURFACE
    )
    :vars
    (
      ?auto_1646819 - HOIST
      ?auto_1646820 - PLACE
      ?auto_1646822 - TRUCK
      ?auto_1646821 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1646819 ?auto_1646820 ) ( SURFACE-AT ?auto_1646817 ?auto_1646820 ) ( CLEAR ?auto_1646817 ) ( IS-CRATE ?auto_1646818 ) ( not ( = ?auto_1646817 ?auto_1646818 ) ) ( AVAILABLE ?auto_1646819 ) ( IN ?auto_1646818 ?auto_1646822 ) ( ON ?auto_1646817 ?auto_1646816 ) ( not ( = ?auto_1646816 ?auto_1646817 ) ) ( not ( = ?auto_1646816 ?auto_1646818 ) ) ( TRUCK-AT ?auto_1646822 ?auto_1646821 ) ( not ( = ?auto_1646821 ?auto_1646820 ) ) ( ON ?auto_1646806 ?auto_1646805 ) ( ON ?auto_1646807 ?auto_1646806 ) ( ON ?auto_1646809 ?auto_1646807 ) ( ON ?auto_1646808 ?auto_1646809 ) ( ON ?auto_1646810 ?auto_1646808 ) ( ON ?auto_1646811 ?auto_1646810 ) ( ON ?auto_1646812 ?auto_1646811 ) ( ON ?auto_1646813 ?auto_1646812 ) ( ON ?auto_1646814 ?auto_1646813 ) ( ON ?auto_1646815 ?auto_1646814 ) ( ON ?auto_1646816 ?auto_1646815 ) ( not ( = ?auto_1646805 ?auto_1646806 ) ) ( not ( = ?auto_1646805 ?auto_1646807 ) ) ( not ( = ?auto_1646805 ?auto_1646809 ) ) ( not ( = ?auto_1646805 ?auto_1646808 ) ) ( not ( = ?auto_1646805 ?auto_1646810 ) ) ( not ( = ?auto_1646805 ?auto_1646811 ) ) ( not ( = ?auto_1646805 ?auto_1646812 ) ) ( not ( = ?auto_1646805 ?auto_1646813 ) ) ( not ( = ?auto_1646805 ?auto_1646814 ) ) ( not ( = ?auto_1646805 ?auto_1646815 ) ) ( not ( = ?auto_1646805 ?auto_1646816 ) ) ( not ( = ?auto_1646805 ?auto_1646817 ) ) ( not ( = ?auto_1646805 ?auto_1646818 ) ) ( not ( = ?auto_1646806 ?auto_1646807 ) ) ( not ( = ?auto_1646806 ?auto_1646809 ) ) ( not ( = ?auto_1646806 ?auto_1646808 ) ) ( not ( = ?auto_1646806 ?auto_1646810 ) ) ( not ( = ?auto_1646806 ?auto_1646811 ) ) ( not ( = ?auto_1646806 ?auto_1646812 ) ) ( not ( = ?auto_1646806 ?auto_1646813 ) ) ( not ( = ?auto_1646806 ?auto_1646814 ) ) ( not ( = ?auto_1646806 ?auto_1646815 ) ) ( not ( = ?auto_1646806 ?auto_1646816 ) ) ( not ( = ?auto_1646806 ?auto_1646817 ) ) ( not ( = ?auto_1646806 ?auto_1646818 ) ) ( not ( = ?auto_1646807 ?auto_1646809 ) ) ( not ( = ?auto_1646807 ?auto_1646808 ) ) ( not ( = ?auto_1646807 ?auto_1646810 ) ) ( not ( = ?auto_1646807 ?auto_1646811 ) ) ( not ( = ?auto_1646807 ?auto_1646812 ) ) ( not ( = ?auto_1646807 ?auto_1646813 ) ) ( not ( = ?auto_1646807 ?auto_1646814 ) ) ( not ( = ?auto_1646807 ?auto_1646815 ) ) ( not ( = ?auto_1646807 ?auto_1646816 ) ) ( not ( = ?auto_1646807 ?auto_1646817 ) ) ( not ( = ?auto_1646807 ?auto_1646818 ) ) ( not ( = ?auto_1646809 ?auto_1646808 ) ) ( not ( = ?auto_1646809 ?auto_1646810 ) ) ( not ( = ?auto_1646809 ?auto_1646811 ) ) ( not ( = ?auto_1646809 ?auto_1646812 ) ) ( not ( = ?auto_1646809 ?auto_1646813 ) ) ( not ( = ?auto_1646809 ?auto_1646814 ) ) ( not ( = ?auto_1646809 ?auto_1646815 ) ) ( not ( = ?auto_1646809 ?auto_1646816 ) ) ( not ( = ?auto_1646809 ?auto_1646817 ) ) ( not ( = ?auto_1646809 ?auto_1646818 ) ) ( not ( = ?auto_1646808 ?auto_1646810 ) ) ( not ( = ?auto_1646808 ?auto_1646811 ) ) ( not ( = ?auto_1646808 ?auto_1646812 ) ) ( not ( = ?auto_1646808 ?auto_1646813 ) ) ( not ( = ?auto_1646808 ?auto_1646814 ) ) ( not ( = ?auto_1646808 ?auto_1646815 ) ) ( not ( = ?auto_1646808 ?auto_1646816 ) ) ( not ( = ?auto_1646808 ?auto_1646817 ) ) ( not ( = ?auto_1646808 ?auto_1646818 ) ) ( not ( = ?auto_1646810 ?auto_1646811 ) ) ( not ( = ?auto_1646810 ?auto_1646812 ) ) ( not ( = ?auto_1646810 ?auto_1646813 ) ) ( not ( = ?auto_1646810 ?auto_1646814 ) ) ( not ( = ?auto_1646810 ?auto_1646815 ) ) ( not ( = ?auto_1646810 ?auto_1646816 ) ) ( not ( = ?auto_1646810 ?auto_1646817 ) ) ( not ( = ?auto_1646810 ?auto_1646818 ) ) ( not ( = ?auto_1646811 ?auto_1646812 ) ) ( not ( = ?auto_1646811 ?auto_1646813 ) ) ( not ( = ?auto_1646811 ?auto_1646814 ) ) ( not ( = ?auto_1646811 ?auto_1646815 ) ) ( not ( = ?auto_1646811 ?auto_1646816 ) ) ( not ( = ?auto_1646811 ?auto_1646817 ) ) ( not ( = ?auto_1646811 ?auto_1646818 ) ) ( not ( = ?auto_1646812 ?auto_1646813 ) ) ( not ( = ?auto_1646812 ?auto_1646814 ) ) ( not ( = ?auto_1646812 ?auto_1646815 ) ) ( not ( = ?auto_1646812 ?auto_1646816 ) ) ( not ( = ?auto_1646812 ?auto_1646817 ) ) ( not ( = ?auto_1646812 ?auto_1646818 ) ) ( not ( = ?auto_1646813 ?auto_1646814 ) ) ( not ( = ?auto_1646813 ?auto_1646815 ) ) ( not ( = ?auto_1646813 ?auto_1646816 ) ) ( not ( = ?auto_1646813 ?auto_1646817 ) ) ( not ( = ?auto_1646813 ?auto_1646818 ) ) ( not ( = ?auto_1646814 ?auto_1646815 ) ) ( not ( = ?auto_1646814 ?auto_1646816 ) ) ( not ( = ?auto_1646814 ?auto_1646817 ) ) ( not ( = ?auto_1646814 ?auto_1646818 ) ) ( not ( = ?auto_1646815 ?auto_1646816 ) ) ( not ( = ?auto_1646815 ?auto_1646817 ) ) ( not ( = ?auto_1646815 ?auto_1646818 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1646816 ?auto_1646817 ?auto_1646818 )
      ( MAKE-13CRATE-VERIFY ?auto_1646805 ?auto_1646806 ?auto_1646807 ?auto_1646809 ?auto_1646808 ?auto_1646810 ?auto_1646811 ?auto_1646812 ?auto_1646813 ?auto_1646814 ?auto_1646815 ?auto_1646816 ?auto_1646817 ?auto_1646818 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1646974 - SURFACE
      ?auto_1646975 - SURFACE
      ?auto_1646976 - SURFACE
      ?auto_1646978 - SURFACE
      ?auto_1646977 - SURFACE
      ?auto_1646979 - SURFACE
      ?auto_1646980 - SURFACE
      ?auto_1646981 - SURFACE
      ?auto_1646982 - SURFACE
      ?auto_1646983 - SURFACE
      ?auto_1646984 - SURFACE
      ?auto_1646985 - SURFACE
      ?auto_1646986 - SURFACE
      ?auto_1646987 - SURFACE
    )
    :vars
    (
      ?auto_1646989 - HOIST
      ?auto_1646991 - PLACE
      ?auto_1646992 - TRUCK
      ?auto_1646988 - PLACE
      ?auto_1646990 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1646989 ?auto_1646991 ) ( SURFACE-AT ?auto_1646986 ?auto_1646991 ) ( CLEAR ?auto_1646986 ) ( IS-CRATE ?auto_1646987 ) ( not ( = ?auto_1646986 ?auto_1646987 ) ) ( AVAILABLE ?auto_1646989 ) ( ON ?auto_1646986 ?auto_1646985 ) ( not ( = ?auto_1646985 ?auto_1646986 ) ) ( not ( = ?auto_1646985 ?auto_1646987 ) ) ( TRUCK-AT ?auto_1646992 ?auto_1646988 ) ( not ( = ?auto_1646988 ?auto_1646991 ) ) ( HOIST-AT ?auto_1646990 ?auto_1646988 ) ( LIFTING ?auto_1646990 ?auto_1646987 ) ( not ( = ?auto_1646989 ?auto_1646990 ) ) ( ON ?auto_1646975 ?auto_1646974 ) ( ON ?auto_1646976 ?auto_1646975 ) ( ON ?auto_1646978 ?auto_1646976 ) ( ON ?auto_1646977 ?auto_1646978 ) ( ON ?auto_1646979 ?auto_1646977 ) ( ON ?auto_1646980 ?auto_1646979 ) ( ON ?auto_1646981 ?auto_1646980 ) ( ON ?auto_1646982 ?auto_1646981 ) ( ON ?auto_1646983 ?auto_1646982 ) ( ON ?auto_1646984 ?auto_1646983 ) ( ON ?auto_1646985 ?auto_1646984 ) ( not ( = ?auto_1646974 ?auto_1646975 ) ) ( not ( = ?auto_1646974 ?auto_1646976 ) ) ( not ( = ?auto_1646974 ?auto_1646978 ) ) ( not ( = ?auto_1646974 ?auto_1646977 ) ) ( not ( = ?auto_1646974 ?auto_1646979 ) ) ( not ( = ?auto_1646974 ?auto_1646980 ) ) ( not ( = ?auto_1646974 ?auto_1646981 ) ) ( not ( = ?auto_1646974 ?auto_1646982 ) ) ( not ( = ?auto_1646974 ?auto_1646983 ) ) ( not ( = ?auto_1646974 ?auto_1646984 ) ) ( not ( = ?auto_1646974 ?auto_1646985 ) ) ( not ( = ?auto_1646974 ?auto_1646986 ) ) ( not ( = ?auto_1646974 ?auto_1646987 ) ) ( not ( = ?auto_1646975 ?auto_1646976 ) ) ( not ( = ?auto_1646975 ?auto_1646978 ) ) ( not ( = ?auto_1646975 ?auto_1646977 ) ) ( not ( = ?auto_1646975 ?auto_1646979 ) ) ( not ( = ?auto_1646975 ?auto_1646980 ) ) ( not ( = ?auto_1646975 ?auto_1646981 ) ) ( not ( = ?auto_1646975 ?auto_1646982 ) ) ( not ( = ?auto_1646975 ?auto_1646983 ) ) ( not ( = ?auto_1646975 ?auto_1646984 ) ) ( not ( = ?auto_1646975 ?auto_1646985 ) ) ( not ( = ?auto_1646975 ?auto_1646986 ) ) ( not ( = ?auto_1646975 ?auto_1646987 ) ) ( not ( = ?auto_1646976 ?auto_1646978 ) ) ( not ( = ?auto_1646976 ?auto_1646977 ) ) ( not ( = ?auto_1646976 ?auto_1646979 ) ) ( not ( = ?auto_1646976 ?auto_1646980 ) ) ( not ( = ?auto_1646976 ?auto_1646981 ) ) ( not ( = ?auto_1646976 ?auto_1646982 ) ) ( not ( = ?auto_1646976 ?auto_1646983 ) ) ( not ( = ?auto_1646976 ?auto_1646984 ) ) ( not ( = ?auto_1646976 ?auto_1646985 ) ) ( not ( = ?auto_1646976 ?auto_1646986 ) ) ( not ( = ?auto_1646976 ?auto_1646987 ) ) ( not ( = ?auto_1646978 ?auto_1646977 ) ) ( not ( = ?auto_1646978 ?auto_1646979 ) ) ( not ( = ?auto_1646978 ?auto_1646980 ) ) ( not ( = ?auto_1646978 ?auto_1646981 ) ) ( not ( = ?auto_1646978 ?auto_1646982 ) ) ( not ( = ?auto_1646978 ?auto_1646983 ) ) ( not ( = ?auto_1646978 ?auto_1646984 ) ) ( not ( = ?auto_1646978 ?auto_1646985 ) ) ( not ( = ?auto_1646978 ?auto_1646986 ) ) ( not ( = ?auto_1646978 ?auto_1646987 ) ) ( not ( = ?auto_1646977 ?auto_1646979 ) ) ( not ( = ?auto_1646977 ?auto_1646980 ) ) ( not ( = ?auto_1646977 ?auto_1646981 ) ) ( not ( = ?auto_1646977 ?auto_1646982 ) ) ( not ( = ?auto_1646977 ?auto_1646983 ) ) ( not ( = ?auto_1646977 ?auto_1646984 ) ) ( not ( = ?auto_1646977 ?auto_1646985 ) ) ( not ( = ?auto_1646977 ?auto_1646986 ) ) ( not ( = ?auto_1646977 ?auto_1646987 ) ) ( not ( = ?auto_1646979 ?auto_1646980 ) ) ( not ( = ?auto_1646979 ?auto_1646981 ) ) ( not ( = ?auto_1646979 ?auto_1646982 ) ) ( not ( = ?auto_1646979 ?auto_1646983 ) ) ( not ( = ?auto_1646979 ?auto_1646984 ) ) ( not ( = ?auto_1646979 ?auto_1646985 ) ) ( not ( = ?auto_1646979 ?auto_1646986 ) ) ( not ( = ?auto_1646979 ?auto_1646987 ) ) ( not ( = ?auto_1646980 ?auto_1646981 ) ) ( not ( = ?auto_1646980 ?auto_1646982 ) ) ( not ( = ?auto_1646980 ?auto_1646983 ) ) ( not ( = ?auto_1646980 ?auto_1646984 ) ) ( not ( = ?auto_1646980 ?auto_1646985 ) ) ( not ( = ?auto_1646980 ?auto_1646986 ) ) ( not ( = ?auto_1646980 ?auto_1646987 ) ) ( not ( = ?auto_1646981 ?auto_1646982 ) ) ( not ( = ?auto_1646981 ?auto_1646983 ) ) ( not ( = ?auto_1646981 ?auto_1646984 ) ) ( not ( = ?auto_1646981 ?auto_1646985 ) ) ( not ( = ?auto_1646981 ?auto_1646986 ) ) ( not ( = ?auto_1646981 ?auto_1646987 ) ) ( not ( = ?auto_1646982 ?auto_1646983 ) ) ( not ( = ?auto_1646982 ?auto_1646984 ) ) ( not ( = ?auto_1646982 ?auto_1646985 ) ) ( not ( = ?auto_1646982 ?auto_1646986 ) ) ( not ( = ?auto_1646982 ?auto_1646987 ) ) ( not ( = ?auto_1646983 ?auto_1646984 ) ) ( not ( = ?auto_1646983 ?auto_1646985 ) ) ( not ( = ?auto_1646983 ?auto_1646986 ) ) ( not ( = ?auto_1646983 ?auto_1646987 ) ) ( not ( = ?auto_1646984 ?auto_1646985 ) ) ( not ( = ?auto_1646984 ?auto_1646986 ) ) ( not ( = ?auto_1646984 ?auto_1646987 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1646985 ?auto_1646986 ?auto_1646987 )
      ( MAKE-13CRATE-VERIFY ?auto_1646974 ?auto_1646975 ?auto_1646976 ?auto_1646978 ?auto_1646977 ?auto_1646979 ?auto_1646980 ?auto_1646981 ?auto_1646982 ?auto_1646983 ?auto_1646984 ?auto_1646985 ?auto_1646986 ?auto_1646987 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1647156 - SURFACE
      ?auto_1647157 - SURFACE
      ?auto_1647158 - SURFACE
      ?auto_1647160 - SURFACE
      ?auto_1647159 - SURFACE
      ?auto_1647161 - SURFACE
      ?auto_1647162 - SURFACE
      ?auto_1647163 - SURFACE
      ?auto_1647164 - SURFACE
      ?auto_1647165 - SURFACE
      ?auto_1647166 - SURFACE
      ?auto_1647167 - SURFACE
      ?auto_1647168 - SURFACE
      ?auto_1647169 - SURFACE
    )
    :vars
    (
      ?auto_1647171 - HOIST
      ?auto_1647174 - PLACE
      ?auto_1647175 - TRUCK
      ?auto_1647170 - PLACE
      ?auto_1647172 - HOIST
      ?auto_1647173 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1647171 ?auto_1647174 ) ( SURFACE-AT ?auto_1647168 ?auto_1647174 ) ( CLEAR ?auto_1647168 ) ( IS-CRATE ?auto_1647169 ) ( not ( = ?auto_1647168 ?auto_1647169 ) ) ( AVAILABLE ?auto_1647171 ) ( ON ?auto_1647168 ?auto_1647167 ) ( not ( = ?auto_1647167 ?auto_1647168 ) ) ( not ( = ?auto_1647167 ?auto_1647169 ) ) ( TRUCK-AT ?auto_1647175 ?auto_1647170 ) ( not ( = ?auto_1647170 ?auto_1647174 ) ) ( HOIST-AT ?auto_1647172 ?auto_1647170 ) ( not ( = ?auto_1647171 ?auto_1647172 ) ) ( AVAILABLE ?auto_1647172 ) ( SURFACE-AT ?auto_1647169 ?auto_1647170 ) ( ON ?auto_1647169 ?auto_1647173 ) ( CLEAR ?auto_1647169 ) ( not ( = ?auto_1647168 ?auto_1647173 ) ) ( not ( = ?auto_1647169 ?auto_1647173 ) ) ( not ( = ?auto_1647167 ?auto_1647173 ) ) ( ON ?auto_1647157 ?auto_1647156 ) ( ON ?auto_1647158 ?auto_1647157 ) ( ON ?auto_1647160 ?auto_1647158 ) ( ON ?auto_1647159 ?auto_1647160 ) ( ON ?auto_1647161 ?auto_1647159 ) ( ON ?auto_1647162 ?auto_1647161 ) ( ON ?auto_1647163 ?auto_1647162 ) ( ON ?auto_1647164 ?auto_1647163 ) ( ON ?auto_1647165 ?auto_1647164 ) ( ON ?auto_1647166 ?auto_1647165 ) ( ON ?auto_1647167 ?auto_1647166 ) ( not ( = ?auto_1647156 ?auto_1647157 ) ) ( not ( = ?auto_1647156 ?auto_1647158 ) ) ( not ( = ?auto_1647156 ?auto_1647160 ) ) ( not ( = ?auto_1647156 ?auto_1647159 ) ) ( not ( = ?auto_1647156 ?auto_1647161 ) ) ( not ( = ?auto_1647156 ?auto_1647162 ) ) ( not ( = ?auto_1647156 ?auto_1647163 ) ) ( not ( = ?auto_1647156 ?auto_1647164 ) ) ( not ( = ?auto_1647156 ?auto_1647165 ) ) ( not ( = ?auto_1647156 ?auto_1647166 ) ) ( not ( = ?auto_1647156 ?auto_1647167 ) ) ( not ( = ?auto_1647156 ?auto_1647168 ) ) ( not ( = ?auto_1647156 ?auto_1647169 ) ) ( not ( = ?auto_1647156 ?auto_1647173 ) ) ( not ( = ?auto_1647157 ?auto_1647158 ) ) ( not ( = ?auto_1647157 ?auto_1647160 ) ) ( not ( = ?auto_1647157 ?auto_1647159 ) ) ( not ( = ?auto_1647157 ?auto_1647161 ) ) ( not ( = ?auto_1647157 ?auto_1647162 ) ) ( not ( = ?auto_1647157 ?auto_1647163 ) ) ( not ( = ?auto_1647157 ?auto_1647164 ) ) ( not ( = ?auto_1647157 ?auto_1647165 ) ) ( not ( = ?auto_1647157 ?auto_1647166 ) ) ( not ( = ?auto_1647157 ?auto_1647167 ) ) ( not ( = ?auto_1647157 ?auto_1647168 ) ) ( not ( = ?auto_1647157 ?auto_1647169 ) ) ( not ( = ?auto_1647157 ?auto_1647173 ) ) ( not ( = ?auto_1647158 ?auto_1647160 ) ) ( not ( = ?auto_1647158 ?auto_1647159 ) ) ( not ( = ?auto_1647158 ?auto_1647161 ) ) ( not ( = ?auto_1647158 ?auto_1647162 ) ) ( not ( = ?auto_1647158 ?auto_1647163 ) ) ( not ( = ?auto_1647158 ?auto_1647164 ) ) ( not ( = ?auto_1647158 ?auto_1647165 ) ) ( not ( = ?auto_1647158 ?auto_1647166 ) ) ( not ( = ?auto_1647158 ?auto_1647167 ) ) ( not ( = ?auto_1647158 ?auto_1647168 ) ) ( not ( = ?auto_1647158 ?auto_1647169 ) ) ( not ( = ?auto_1647158 ?auto_1647173 ) ) ( not ( = ?auto_1647160 ?auto_1647159 ) ) ( not ( = ?auto_1647160 ?auto_1647161 ) ) ( not ( = ?auto_1647160 ?auto_1647162 ) ) ( not ( = ?auto_1647160 ?auto_1647163 ) ) ( not ( = ?auto_1647160 ?auto_1647164 ) ) ( not ( = ?auto_1647160 ?auto_1647165 ) ) ( not ( = ?auto_1647160 ?auto_1647166 ) ) ( not ( = ?auto_1647160 ?auto_1647167 ) ) ( not ( = ?auto_1647160 ?auto_1647168 ) ) ( not ( = ?auto_1647160 ?auto_1647169 ) ) ( not ( = ?auto_1647160 ?auto_1647173 ) ) ( not ( = ?auto_1647159 ?auto_1647161 ) ) ( not ( = ?auto_1647159 ?auto_1647162 ) ) ( not ( = ?auto_1647159 ?auto_1647163 ) ) ( not ( = ?auto_1647159 ?auto_1647164 ) ) ( not ( = ?auto_1647159 ?auto_1647165 ) ) ( not ( = ?auto_1647159 ?auto_1647166 ) ) ( not ( = ?auto_1647159 ?auto_1647167 ) ) ( not ( = ?auto_1647159 ?auto_1647168 ) ) ( not ( = ?auto_1647159 ?auto_1647169 ) ) ( not ( = ?auto_1647159 ?auto_1647173 ) ) ( not ( = ?auto_1647161 ?auto_1647162 ) ) ( not ( = ?auto_1647161 ?auto_1647163 ) ) ( not ( = ?auto_1647161 ?auto_1647164 ) ) ( not ( = ?auto_1647161 ?auto_1647165 ) ) ( not ( = ?auto_1647161 ?auto_1647166 ) ) ( not ( = ?auto_1647161 ?auto_1647167 ) ) ( not ( = ?auto_1647161 ?auto_1647168 ) ) ( not ( = ?auto_1647161 ?auto_1647169 ) ) ( not ( = ?auto_1647161 ?auto_1647173 ) ) ( not ( = ?auto_1647162 ?auto_1647163 ) ) ( not ( = ?auto_1647162 ?auto_1647164 ) ) ( not ( = ?auto_1647162 ?auto_1647165 ) ) ( not ( = ?auto_1647162 ?auto_1647166 ) ) ( not ( = ?auto_1647162 ?auto_1647167 ) ) ( not ( = ?auto_1647162 ?auto_1647168 ) ) ( not ( = ?auto_1647162 ?auto_1647169 ) ) ( not ( = ?auto_1647162 ?auto_1647173 ) ) ( not ( = ?auto_1647163 ?auto_1647164 ) ) ( not ( = ?auto_1647163 ?auto_1647165 ) ) ( not ( = ?auto_1647163 ?auto_1647166 ) ) ( not ( = ?auto_1647163 ?auto_1647167 ) ) ( not ( = ?auto_1647163 ?auto_1647168 ) ) ( not ( = ?auto_1647163 ?auto_1647169 ) ) ( not ( = ?auto_1647163 ?auto_1647173 ) ) ( not ( = ?auto_1647164 ?auto_1647165 ) ) ( not ( = ?auto_1647164 ?auto_1647166 ) ) ( not ( = ?auto_1647164 ?auto_1647167 ) ) ( not ( = ?auto_1647164 ?auto_1647168 ) ) ( not ( = ?auto_1647164 ?auto_1647169 ) ) ( not ( = ?auto_1647164 ?auto_1647173 ) ) ( not ( = ?auto_1647165 ?auto_1647166 ) ) ( not ( = ?auto_1647165 ?auto_1647167 ) ) ( not ( = ?auto_1647165 ?auto_1647168 ) ) ( not ( = ?auto_1647165 ?auto_1647169 ) ) ( not ( = ?auto_1647165 ?auto_1647173 ) ) ( not ( = ?auto_1647166 ?auto_1647167 ) ) ( not ( = ?auto_1647166 ?auto_1647168 ) ) ( not ( = ?auto_1647166 ?auto_1647169 ) ) ( not ( = ?auto_1647166 ?auto_1647173 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1647167 ?auto_1647168 ?auto_1647169 )
      ( MAKE-13CRATE-VERIFY ?auto_1647156 ?auto_1647157 ?auto_1647158 ?auto_1647160 ?auto_1647159 ?auto_1647161 ?auto_1647162 ?auto_1647163 ?auto_1647164 ?auto_1647165 ?auto_1647166 ?auto_1647167 ?auto_1647168 ?auto_1647169 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1647339 - SURFACE
      ?auto_1647340 - SURFACE
      ?auto_1647341 - SURFACE
      ?auto_1647343 - SURFACE
      ?auto_1647342 - SURFACE
      ?auto_1647344 - SURFACE
      ?auto_1647345 - SURFACE
      ?auto_1647346 - SURFACE
      ?auto_1647347 - SURFACE
      ?auto_1647348 - SURFACE
      ?auto_1647349 - SURFACE
      ?auto_1647350 - SURFACE
      ?auto_1647351 - SURFACE
      ?auto_1647352 - SURFACE
    )
    :vars
    (
      ?auto_1647354 - HOIST
      ?auto_1647358 - PLACE
      ?auto_1647353 - PLACE
      ?auto_1647357 - HOIST
      ?auto_1647355 - SURFACE
      ?auto_1647356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1647354 ?auto_1647358 ) ( SURFACE-AT ?auto_1647351 ?auto_1647358 ) ( CLEAR ?auto_1647351 ) ( IS-CRATE ?auto_1647352 ) ( not ( = ?auto_1647351 ?auto_1647352 ) ) ( AVAILABLE ?auto_1647354 ) ( ON ?auto_1647351 ?auto_1647350 ) ( not ( = ?auto_1647350 ?auto_1647351 ) ) ( not ( = ?auto_1647350 ?auto_1647352 ) ) ( not ( = ?auto_1647353 ?auto_1647358 ) ) ( HOIST-AT ?auto_1647357 ?auto_1647353 ) ( not ( = ?auto_1647354 ?auto_1647357 ) ) ( AVAILABLE ?auto_1647357 ) ( SURFACE-AT ?auto_1647352 ?auto_1647353 ) ( ON ?auto_1647352 ?auto_1647355 ) ( CLEAR ?auto_1647352 ) ( not ( = ?auto_1647351 ?auto_1647355 ) ) ( not ( = ?auto_1647352 ?auto_1647355 ) ) ( not ( = ?auto_1647350 ?auto_1647355 ) ) ( TRUCK-AT ?auto_1647356 ?auto_1647358 ) ( ON ?auto_1647340 ?auto_1647339 ) ( ON ?auto_1647341 ?auto_1647340 ) ( ON ?auto_1647343 ?auto_1647341 ) ( ON ?auto_1647342 ?auto_1647343 ) ( ON ?auto_1647344 ?auto_1647342 ) ( ON ?auto_1647345 ?auto_1647344 ) ( ON ?auto_1647346 ?auto_1647345 ) ( ON ?auto_1647347 ?auto_1647346 ) ( ON ?auto_1647348 ?auto_1647347 ) ( ON ?auto_1647349 ?auto_1647348 ) ( ON ?auto_1647350 ?auto_1647349 ) ( not ( = ?auto_1647339 ?auto_1647340 ) ) ( not ( = ?auto_1647339 ?auto_1647341 ) ) ( not ( = ?auto_1647339 ?auto_1647343 ) ) ( not ( = ?auto_1647339 ?auto_1647342 ) ) ( not ( = ?auto_1647339 ?auto_1647344 ) ) ( not ( = ?auto_1647339 ?auto_1647345 ) ) ( not ( = ?auto_1647339 ?auto_1647346 ) ) ( not ( = ?auto_1647339 ?auto_1647347 ) ) ( not ( = ?auto_1647339 ?auto_1647348 ) ) ( not ( = ?auto_1647339 ?auto_1647349 ) ) ( not ( = ?auto_1647339 ?auto_1647350 ) ) ( not ( = ?auto_1647339 ?auto_1647351 ) ) ( not ( = ?auto_1647339 ?auto_1647352 ) ) ( not ( = ?auto_1647339 ?auto_1647355 ) ) ( not ( = ?auto_1647340 ?auto_1647341 ) ) ( not ( = ?auto_1647340 ?auto_1647343 ) ) ( not ( = ?auto_1647340 ?auto_1647342 ) ) ( not ( = ?auto_1647340 ?auto_1647344 ) ) ( not ( = ?auto_1647340 ?auto_1647345 ) ) ( not ( = ?auto_1647340 ?auto_1647346 ) ) ( not ( = ?auto_1647340 ?auto_1647347 ) ) ( not ( = ?auto_1647340 ?auto_1647348 ) ) ( not ( = ?auto_1647340 ?auto_1647349 ) ) ( not ( = ?auto_1647340 ?auto_1647350 ) ) ( not ( = ?auto_1647340 ?auto_1647351 ) ) ( not ( = ?auto_1647340 ?auto_1647352 ) ) ( not ( = ?auto_1647340 ?auto_1647355 ) ) ( not ( = ?auto_1647341 ?auto_1647343 ) ) ( not ( = ?auto_1647341 ?auto_1647342 ) ) ( not ( = ?auto_1647341 ?auto_1647344 ) ) ( not ( = ?auto_1647341 ?auto_1647345 ) ) ( not ( = ?auto_1647341 ?auto_1647346 ) ) ( not ( = ?auto_1647341 ?auto_1647347 ) ) ( not ( = ?auto_1647341 ?auto_1647348 ) ) ( not ( = ?auto_1647341 ?auto_1647349 ) ) ( not ( = ?auto_1647341 ?auto_1647350 ) ) ( not ( = ?auto_1647341 ?auto_1647351 ) ) ( not ( = ?auto_1647341 ?auto_1647352 ) ) ( not ( = ?auto_1647341 ?auto_1647355 ) ) ( not ( = ?auto_1647343 ?auto_1647342 ) ) ( not ( = ?auto_1647343 ?auto_1647344 ) ) ( not ( = ?auto_1647343 ?auto_1647345 ) ) ( not ( = ?auto_1647343 ?auto_1647346 ) ) ( not ( = ?auto_1647343 ?auto_1647347 ) ) ( not ( = ?auto_1647343 ?auto_1647348 ) ) ( not ( = ?auto_1647343 ?auto_1647349 ) ) ( not ( = ?auto_1647343 ?auto_1647350 ) ) ( not ( = ?auto_1647343 ?auto_1647351 ) ) ( not ( = ?auto_1647343 ?auto_1647352 ) ) ( not ( = ?auto_1647343 ?auto_1647355 ) ) ( not ( = ?auto_1647342 ?auto_1647344 ) ) ( not ( = ?auto_1647342 ?auto_1647345 ) ) ( not ( = ?auto_1647342 ?auto_1647346 ) ) ( not ( = ?auto_1647342 ?auto_1647347 ) ) ( not ( = ?auto_1647342 ?auto_1647348 ) ) ( not ( = ?auto_1647342 ?auto_1647349 ) ) ( not ( = ?auto_1647342 ?auto_1647350 ) ) ( not ( = ?auto_1647342 ?auto_1647351 ) ) ( not ( = ?auto_1647342 ?auto_1647352 ) ) ( not ( = ?auto_1647342 ?auto_1647355 ) ) ( not ( = ?auto_1647344 ?auto_1647345 ) ) ( not ( = ?auto_1647344 ?auto_1647346 ) ) ( not ( = ?auto_1647344 ?auto_1647347 ) ) ( not ( = ?auto_1647344 ?auto_1647348 ) ) ( not ( = ?auto_1647344 ?auto_1647349 ) ) ( not ( = ?auto_1647344 ?auto_1647350 ) ) ( not ( = ?auto_1647344 ?auto_1647351 ) ) ( not ( = ?auto_1647344 ?auto_1647352 ) ) ( not ( = ?auto_1647344 ?auto_1647355 ) ) ( not ( = ?auto_1647345 ?auto_1647346 ) ) ( not ( = ?auto_1647345 ?auto_1647347 ) ) ( not ( = ?auto_1647345 ?auto_1647348 ) ) ( not ( = ?auto_1647345 ?auto_1647349 ) ) ( not ( = ?auto_1647345 ?auto_1647350 ) ) ( not ( = ?auto_1647345 ?auto_1647351 ) ) ( not ( = ?auto_1647345 ?auto_1647352 ) ) ( not ( = ?auto_1647345 ?auto_1647355 ) ) ( not ( = ?auto_1647346 ?auto_1647347 ) ) ( not ( = ?auto_1647346 ?auto_1647348 ) ) ( not ( = ?auto_1647346 ?auto_1647349 ) ) ( not ( = ?auto_1647346 ?auto_1647350 ) ) ( not ( = ?auto_1647346 ?auto_1647351 ) ) ( not ( = ?auto_1647346 ?auto_1647352 ) ) ( not ( = ?auto_1647346 ?auto_1647355 ) ) ( not ( = ?auto_1647347 ?auto_1647348 ) ) ( not ( = ?auto_1647347 ?auto_1647349 ) ) ( not ( = ?auto_1647347 ?auto_1647350 ) ) ( not ( = ?auto_1647347 ?auto_1647351 ) ) ( not ( = ?auto_1647347 ?auto_1647352 ) ) ( not ( = ?auto_1647347 ?auto_1647355 ) ) ( not ( = ?auto_1647348 ?auto_1647349 ) ) ( not ( = ?auto_1647348 ?auto_1647350 ) ) ( not ( = ?auto_1647348 ?auto_1647351 ) ) ( not ( = ?auto_1647348 ?auto_1647352 ) ) ( not ( = ?auto_1647348 ?auto_1647355 ) ) ( not ( = ?auto_1647349 ?auto_1647350 ) ) ( not ( = ?auto_1647349 ?auto_1647351 ) ) ( not ( = ?auto_1647349 ?auto_1647352 ) ) ( not ( = ?auto_1647349 ?auto_1647355 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1647350 ?auto_1647351 ?auto_1647352 )
      ( MAKE-13CRATE-VERIFY ?auto_1647339 ?auto_1647340 ?auto_1647341 ?auto_1647343 ?auto_1647342 ?auto_1647344 ?auto_1647345 ?auto_1647346 ?auto_1647347 ?auto_1647348 ?auto_1647349 ?auto_1647350 ?auto_1647351 ?auto_1647352 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1647522 - SURFACE
      ?auto_1647523 - SURFACE
      ?auto_1647524 - SURFACE
      ?auto_1647526 - SURFACE
      ?auto_1647525 - SURFACE
      ?auto_1647527 - SURFACE
      ?auto_1647528 - SURFACE
      ?auto_1647529 - SURFACE
      ?auto_1647530 - SURFACE
      ?auto_1647531 - SURFACE
      ?auto_1647532 - SURFACE
      ?auto_1647533 - SURFACE
      ?auto_1647534 - SURFACE
      ?auto_1647535 - SURFACE
    )
    :vars
    (
      ?auto_1647539 - HOIST
      ?auto_1647540 - PLACE
      ?auto_1647537 - PLACE
      ?auto_1647536 - HOIST
      ?auto_1647541 - SURFACE
      ?auto_1647538 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1647539 ?auto_1647540 ) ( IS-CRATE ?auto_1647535 ) ( not ( = ?auto_1647534 ?auto_1647535 ) ) ( not ( = ?auto_1647533 ?auto_1647534 ) ) ( not ( = ?auto_1647533 ?auto_1647535 ) ) ( not ( = ?auto_1647537 ?auto_1647540 ) ) ( HOIST-AT ?auto_1647536 ?auto_1647537 ) ( not ( = ?auto_1647539 ?auto_1647536 ) ) ( AVAILABLE ?auto_1647536 ) ( SURFACE-AT ?auto_1647535 ?auto_1647537 ) ( ON ?auto_1647535 ?auto_1647541 ) ( CLEAR ?auto_1647535 ) ( not ( = ?auto_1647534 ?auto_1647541 ) ) ( not ( = ?auto_1647535 ?auto_1647541 ) ) ( not ( = ?auto_1647533 ?auto_1647541 ) ) ( TRUCK-AT ?auto_1647538 ?auto_1647540 ) ( SURFACE-AT ?auto_1647533 ?auto_1647540 ) ( CLEAR ?auto_1647533 ) ( LIFTING ?auto_1647539 ?auto_1647534 ) ( IS-CRATE ?auto_1647534 ) ( ON ?auto_1647523 ?auto_1647522 ) ( ON ?auto_1647524 ?auto_1647523 ) ( ON ?auto_1647526 ?auto_1647524 ) ( ON ?auto_1647525 ?auto_1647526 ) ( ON ?auto_1647527 ?auto_1647525 ) ( ON ?auto_1647528 ?auto_1647527 ) ( ON ?auto_1647529 ?auto_1647528 ) ( ON ?auto_1647530 ?auto_1647529 ) ( ON ?auto_1647531 ?auto_1647530 ) ( ON ?auto_1647532 ?auto_1647531 ) ( ON ?auto_1647533 ?auto_1647532 ) ( not ( = ?auto_1647522 ?auto_1647523 ) ) ( not ( = ?auto_1647522 ?auto_1647524 ) ) ( not ( = ?auto_1647522 ?auto_1647526 ) ) ( not ( = ?auto_1647522 ?auto_1647525 ) ) ( not ( = ?auto_1647522 ?auto_1647527 ) ) ( not ( = ?auto_1647522 ?auto_1647528 ) ) ( not ( = ?auto_1647522 ?auto_1647529 ) ) ( not ( = ?auto_1647522 ?auto_1647530 ) ) ( not ( = ?auto_1647522 ?auto_1647531 ) ) ( not ( = ?auto_1647522 ?auto_1647532 ) ) ( not ( = ?auto_1647522 ?auto_1647533 ) ) ( not ( = ?auto_1647522 ?auto_1647534 ) ) ( not ( = ?auto_1647522 ?auto_1647535 ) ) ( not ( = ?auto_1647522 ?auto_1647541 ) ) ( not ( = ?auto_1647523 ?auto_1647524 ) ) ( not ( = ?auto_1647523 ?auto_1647526 ) ) ( not ( = ?auto_1647523 ?auto_1647525 ) ) ( not ( = ?auto_1647523 ?auto_1647527 ) ) ( not ( = ?auto_1647523 ?auto_1647528 ) ) ( not ( = ?auto_1647523 ?auto_1647529 ) ) ( not ( = ?auto_1647523 ?auto_1647530 ) ) ( not ( = ?auto_1647523 ?auto_1647531 ) ) ( not ( = ?auto_1647523 ?auto_1647532 ) ) ( not ( = ?auto_1647523 ?auto_1647533 ) ) ( not ( = ?auto_1647523 ?auto_1647534 ) ) ( not ( = ?auto_1647523 ?auto_1647535 ) ) ( not ( = ?auto_1647523 ?auto_1647541 ) ) ( not ( = ?auto_1647524 ?auto_1647526 ) ) ( not ( = ?auto_1647524 ?auto_1647525 ) ) ( not ( = ?auto_1647524 ?auto_1647527 ) ) ( not ( = ?auto_1647524 ?auto_1647528 ) ) ( not ( = ?auto_1647524 ?auto_1647529 ) ) ( not ( = ?auto_1647524 ?auto_1647530 ) ) ( not ( = ?auto_1647524 ?auto_1647531 ) ) ( not ( = ?auto_1647524 ?auto_1647532 ) ) ( not ( = ?auto_1647524 ?auto_1647533 ) ) ( not ( = ?auto_1647524 ?auto_1647534 ) ) ( not ( = ?auto_1647524 ?auto_1647535 ) ) ( not ( = ?auto_1647524 ?auto_1647541 ) ) ( not ( = ?auto_1647526 ?auto_1647525 ) ) ( not ( = ?auto_1647526 ?auto_1647527 ) ) ( not ( = ?auto_1647526 ?auto_1647528 ) ) ( not ( = ?auto_1647526 ?auto_1647529 ) ) ( not ( = ?auto_1647526 ?auto_1647530 ) ) ( not ( = ?auto_1647526 ?auto_1647531 ) ) ( not ( = ?auto_1647526 ?auto_1647532 ) ) ( not ( = ?auto_1647526 ?auto_1647533 ) ) ( not ( = ?auto_1647526 ?auto_1647534 ) ) ( not ( = ?auto_1647526 ?auto_1647535 ) ) ( not ( = ?auto_1647526 ?auto_1647541 ) ) ( not ( = ?auto_1647525 ?auto_1647527 ) ) ( not ( = ?auto_1647525 ?auto_1647528 ) ) ( not ( = ?auto_1647525 ?auto_1647529 ) ) ( not ( = ?auto_1647525 ?auto_1647530 ) ) ( not ( = ?auto_1647525 ?auto_1647531 ) ) ( not ( = ?auto_1647525 ?auto_1647532 ) ) ( not ( = ?auto_1647525 ?auto_1647533 ) ) ( not ( = ?auto_1647525 ?auto_1647534 ) ) ( not ( = ?auto_1647525 ?auto_1647535 ) ) ( not ( = ?auto_1647525 ?auto_1647541 ) ) ( not ( = ?auto_1647527 ?auto_1647528 ) ) ( not ( = ?auto_1647527 ?auto_1647529 ) ) ( not ( = ?auto_1647527 ?auto_1647530 ) ) ( not ( = ?auto_1647527 ?auto_1647531 ) ) ( not ( = ?auto_1647527 ?auto_1647532 ) ) ( not ( = ?auto_1647527 ?auto_1647533 ) ) ( not ( = ?auto_1647527 ?auto_1647534 ) ) ( not ( = ?auto_1647527 ?auto_1647535 ) ) ( not ( = ?auto_1647527 ?auto_1647541 ) ) ( not ( = ?auto_1647528 ?auto_1647529 ) ) ( not ( = ?auto_1647528 ?auto_1647530 ) ) ( not ( = ?auto_1647528 ?auto_1647531 ) ) ( not ( = ?auto_1647528 ?auto_1647532 ) ) ( not ( = ?auto_1647528 ?auto_1647533 ) ) ( not ( = ?auto_1647528 ?auto_1647534 ) ) ( not ( = ?auto_1647528 ?auto_1647535 ) ) ( not ( = ?auto_1647528 ?auto_1647541 ) ) ( not ( = ?auto_1647529 ?auto_1647530 ) ) ( not ( = ?auto_1647529 ?auto_1647531 ) ) ( not ( = ?auto_1647529 ?auto_1647532 ) ) ( not ( = ?auto_1647529 ?auto_1647533 ) ) ( not ( = ?auto_1647529 ?auto_1647534 ) ) ( not ( = ?auto_1647529 ?auto_1647535 ) ) ( not ( = ?auto_1647529 ?auto_1647541 ) ) ( not ( = ?auto_1647530 ?auto_1647531 ) ) ( not ( = ?auto_1647530 ?auto_1647532 ) ) ( not ( = ?auto_1647530 ?auto_1647533 ) ) ( not ( = ?auto_1647530 ?auto_1647534 ) ) ( not ( = ?auto_1647530 ?auto_1647535 ) ) ( not ( = ?auto_1647530 ?auto_1647541 ) ) ( not ( = ?auto_1647531 ?auto_1647532 ) ) ( not ( = ?auto_1647531 ?auto_1647533 ) ) ( not ( = ?auto_1647531 ?auto_1647534 ) ) ( not ( = ?auto_1647531 ?auto_1647535 ) ) ( not ( = ?auto_1647531 ?auto_1647541 ) ) ( not ( = ?auto_1647532 ?auto_1647533 ) ) ( not ( = ?auto_1647532 ?auto_1647534 ) ) ( not ( = ?auto_1647532 ?auto_1647535 ) ) ( not ( = ?auto_1647532 ?auto_1647541 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1647533 ?auto_1647534 ?auto_1647535 )
      ( MAKE-13CRATE-VERIFY ?auto_1647522 ?auto_1647523 ?auto_1647524 ?auto_1647526 ?auto_1647525 ?auto_1647527 ?auto_1647528 ?auto_1647529 ?auto_1647530 ?auto_1647531 ?auto_1647532 ?auto_1647533 ?auto_1647534 ?auto_1647535 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1647705 - SURFACE
      ?auto_1647706 - SURFACE
      ?auto_1647707 - SURFACE
      ?auto_1647709 - SURFACE
      ?auto_1647708 - SURFACE
      ?auto_1647710 - SURFACE
      ?auto_1647711 - SURFACE
      ?auto_1647712 - SURFACE
      ?auto_1647713 - SURFACE
      ?auto_1647714 - SURFACE
      ?auto_1647715 - SURFACE
      ?auto_1647716 - SURFACE
      ?auto_1647717 - SURFACE
      ?auto_1647718 - SURFACE
    )
    :vars
    (
      ?auto_1647720 - HOIST
      ?auto_1647724 - PLACE
      ?auto_1647722 - PLACE
      ?auto_1647721 - HOIST
      ?auto_1647723 - SURFACE
      ?auto_1647719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1647720 ?auto_1647724 ) ( IS-CRATE ?auto_1647718 ) ( not ( = ?auto_1647717 ?auto_1647718 ) ) ( not ( = ?auto_1647716 ?auto_1647717 ) ) ( not ( = ?auto_1647716 ?auto_1647718 ) ) ( not ( = ?auto_1647722 ?auto_1647724 ) ) ( HOIST-AT ?auto_1647721 ?auto_1647722 ) ( not ( = ?auto_1647720 ?auto_1647721 ) ) ( AVAILABLE ?auto_1647721 ) ( SURFACE-AT ?auto_1647718 ?auto_1647722 ) ( ON ?auto_1647718 ?auto_1647723 ) ( CLEAR ?auto_1647718 ) ( not ( = ?auto_1647717 ?auto_1647723 ) ) ( not ( = ?auto_1647718 ?auto_1647723 ) ) ( not ( = ?auto_1647716 ?auto_1647723 ) ) ( TRUCK-AT ?auto_1647719 ?auto_1647724 ) ( SURFACE-AT ?auto_1647716 ?auto_1647724 ) ( CLEAR ?auto_1647716 ) ( IS-CRATE ?auto_1647717 ) ( AVAILABLE ?auto_1647720 ) ( IN ?auto_1647717 ?auto_1647719 ) ( ON ?auto_1647706 ?auto_1647705 ) ( ON ?auto_1647707 ?auto_1647706 ) ( ON ?auto_1647709 ?auto_1647707 ) ( ON ?auto_1647708 ?auto_1647709 ) ( ON ?auto_1647710 ?auto_1647708 ) ( ON ?auto_1647711 ?auto_1647710 ) ( ON ?auto_1647712 ?auto_1647711 ) ( ON ?auto_1647713 ?auto_1647712 ) ( ON ?auto_1647714 ?auto_1647713 ) ( ON ?auto_1647715 ?auto_1647714 ) ( ON ?auto_1647716 ?auto_1647715 ) ( not ( = ?auto_1647705 ?auto_1647706 ) ) ( not ( = ?auto_1647705 ?auto_1647707 ) ) ( not ( = ?auto_1647705 ?auto_1647709 ) ) ( not ( = ?auto_1647705 ?auto_1647708 ) ) ( not ( = ?auto_1647705 ?auto_1647710 ) ) ( not ( = ?auto_1647705 ?auto_1647711 ) ) ( not ( = ?auto_1647705 ?auto_1647712 ) ) ( not ( = ?auto_1647705 ?auto_1647713 ) ) ( not ( = ?auto_1647705 ?auto_1647714 ) ) ( not ( = ?auto_1647705 ?auto_1647715 ) ) ( not ( = ?auto_1647705 ?auto_1647716 ) ) ( not ( = ?auto_1647705 ?auto_1647717 ) ) ( not ( = ?auto_1647705 ?auto_1647718 ) ) ( not ( = ?auto_1647705 ?auto_1647723 ) ) ( not ( = ?auto_1647706 ?auto_1647707 ) ) ( not ( = ?auto_1647706 ?auto_1647709 ) ) ( not ( = ?auto_1647706 ?auto_1647708 ) ) ( not ( = ?auto_1647706 ?auto_1647710 ) ) ( not ( = ?auto_1647706 ?auto_1647711 ) ) ( not ( = ?auto_1647706 ?auto_1647712 ) ) ( not ( = ?auto_1647706 ?auto_1647713 ) ) ( not ( = ?auto_1647706 ?auto_1647714 ) ) ( not ( = ?auto_1647706 ?auto_1647715 ) ) ( not ( = ?auto_1647706 ?auto_1647716 ) ) ( not ( = ?auto_1647706 ?auto_1647717 ) ) ( not ( = ?auto_1647706 ?auto_1647718 ) ) ( not ( = ?auto_1647706 ?auto_1647723 ) ) ( not ( = ?auto_1647707 ?auto_1647709 ) ) ( not ( = ?auto_1647707 ?auto_1647708 ) ) ( not ( = ?auto_1647707 ?auto_1647710 ) ) ( not ( = ?auto_1647707 ?auto_1647711 ) ) ( not ( = ?auto_1647707 ?auto_1647712 ) ) ( not ( = ?auto_1647707 ?auto_1647713 ) ) ( not ( = ?auto_1647707 ?auto_1647714 ) ) ( not ( = ?auto_1647707 ?auto_1647715 ) ) ( not ( = ?auto_1647707 ?auto_1647716 ) ) ( not ( = ?auto_1647707 ?auto_1647717 ) ) ( not ( = ?auto_1647707 ?auto_1647718 ) ) ( not ( = ?auto_1647707 ?auto_1647723 ) ) ( not ( = ?auto_1647709 ?auto_1647708 ) ) ( not ( = ?auto_1647709 ?auto_1647710 ) ) ( not ( = ?auto_1647709 ?auto_1647711 ) ) ( not ( = ?auto_1647709 ?auto_1647712 ) ) ( not ( = ?auto_1647709 ?auto_1647713 ) ) ( not ( = ?auto_1647709 ?auto_1647714 ) ) ( not ( = ?auto_1647709 ?auto_1647715 ) ) ( not ( = ?auto_1647709 ?auto_1647716 ) ) ( not ( = ?auto_1647709 ?auto_1647717 ) ) ( not ( = ?auto_1647709 ?auto_1647718 ) ) ( not ( = ?auto_1647709 ?auto_1647723 ) ) ( not ( = ?auto_1647708 ?auto_1647710 ) ) ( not ( = ?auto_1647708 ?auto_1647711 ) ) ( not ( = ?auto_1647708 ?auto_1647712 ) ) ( not ( = ?auto_1647708 ?auto_1647713 ) ) ( not ( = ?auto_1647708 ?auto_1647714 ) ) ( not ( = ?auto_1647708 ?auto_1647715 ) ) ( not ( = ?auto_1647708 ?auto_1647716 ) ) ( not ( = ?auto_1647708 ?auto_1647717 ) ) ( not ( = ?auto_1647708 ?auto_1647718 ) ) ( not ( = ?auto_1647708 ?auto_1647723 ) ) ( not ( = ?auto_1647710 ?auto_1647711 ) ) ( not ( = ?auto_1647710 ?auto_1647712 ) ) ( not ( = ?auto_1647710 ?auto_1647713 ) ) ( not ( = ?auto_1647710 ?auto_1647714 ) ) ( not ( = ?auto_1647710 ?auto_1647715 ) ) ( not ( = ?auto_1647710 ?auto_1647716 ) ) ( not ( = ?auto_1647710 ?auto_1647717 ) ) ( not ( = ?auto_1647710 ?auto_1647718 ) ) ( not ( = ?auto_1647710 ?auto_1647723 ) ) ( not ( = ?auto_1647711 ?auto_1647712 ) ) ( not ( = ?auto_1647711 ?auto_1647713 ) ) ( not ( = ?auto_1647711 ?auto_1647714 ) ) ( not ( = ?auto_1647711 ?auto_1647715 ) ) ( not ( = ?auto_1647711 ?auto_1647716 ) ) ( not ( = ?auto_1647711 ?auto_1647717 ) ) ( not ( = ?auto_1647711 ?auto_1647718 ) ) ( not ( = ?auto_1647711 ?auto_1647723 ) ) ( not ( = ?auto_1647712 ?auto_1647713 ) ) ( not ( = ?auto_1647712 ?auto_1647714 ) ) ( not ( = ?auto_1647712 ?auto_1647715 ) ) ( not ( = ?auto_1647712 ?auto_1647716 ) ) ( not ( = ?auto_1647712 ?auto_1647717 ) ) ( not ( = ?auto_1647712 ?auto_1647718 ) ) ( not ( = ?auto_1647712 ?auto_1647723 ) ) ( not ( = ?auto_1647713 ?auto_1647714 ) ) ( not ( = ?auto_1647713 ?auto_1647715 ) ) ( not ( = ?auto_1647713 ?auto_1647716 ) ) ( not ( = ?auto_1647713 ?auto_1647717 ) ) ( not ( = ?auto_1647713 ?auto_1647718 ) ) ( not ( = ?auto_1647713 ?auto_1647723 ) ) ( not ( = ?auto_1647714 ?auto_1647715 ) ) ( not ( = ?auto_1647714 ?auto_1647716 ) ) ( not ( = ?auto_1647714 ?auto_1647717 ) ) ( not ( = ?auto_1647714 ?auto_1647718 ) ) ( not ( = ?auto_1647714 ?auto_1647723 ) ) ( not ( = ?auto_1647715 ?auto_1647716 ) ) ( not ( = ?auto_1647715 ?auto_1647717 ) ) ( not ( = ?auto_1647715 ?auto_1647718 ) ) ( not ( = ?auto_1647715 ?auto_1647723 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1647716 ?auto_1647717 ?auto_1647718 )
      ( MAKE-13CRATE-VERIFY ?auto_1647705 ?auto_1647706 ?auto_1647707 ?auto_1647709 ?auto_1647708 ?auto_1647710 ?auto_1647711 ?auto_1647712 ?auto_1647713 ?auto_1647714 ?auto_1647715 ?auto_1647716 ?auto_1647717 ?auto_1647718 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1661890 - SURFACE
      ?auto_1661891 - SURFACE
      ?auto_1661892 - SURFACE
      ?auto_1661894 - SURFACE
      ?auto_1661893 - SURFACE
      ?auto_1661895 - SURFACE
      ?auto_1661896 - SURFACE
      ?auto_1661897 - SURFACE
      ?auto_1661898 - SURFACE
      ?auto_1661899 - SURFACE
      ?auto_1661900 - SURFACE
      ?auto_1661901 - SURFACE
      ?auto_1661902 - SURFACE
      ?auto_1661903 - SURFACE
      ?auto_1661904 - SURFACE
    )
    :vars
    (
      ?auto_1661906 - HOIST
      ?auto_1661905 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1661906 ?auto_1661905 ) ( SURFACE-AT ?auto_1661903 ?auto_1661905 ) ( CLEAR ?auto_1661903 ) ( LIFTING ?auto_1661906 ?auto_1661904 ) ( IS-CRATE ?auto_1661904 ) ( not ( = ?auto_1661903 ?auto_1661904 ) ) ( ON ?auto_1661891 ?auto_1661890 ) ( ON ?auto_1661892 ?auto_1661891 ) ( ON ?auto_1661894 ?auto_1661892 ) ( ON ?auto_1661893 ?auto_1661894 ) ( ON ?auto_1661895 ?auto_1661893 ) ( ON ?auto_1661896 ?auto_1661895 ) ( ON ?auto_1661897 ?auto_1661896 ) ( ON ?auto_1661898 ?auto_1661897 ) ( ON ?auto_1661899 ?auto_1661898 ) ( ON ?auto_1661900 ?auto_1661899 ) ( ON ?auto_1661901 ?auto_1661900 ) ( ON ?auto_1661902 ?auto_1661901 ) ( ON ?auto_1661903 ?auto_1661902 ) ( not ( = ?auto_1661890 ?auto_1661891 ) ) ( not ( = ?auto_1661890 ?auto_1661892 ) ) ( not ( = ?auto_1661890 ?auto_1661894 ) ) ( not ( = ?auto_1661890 ?auto_1661893 ) ) ( not ( = ?auto_1661890 ?auto_1661895 ) ) ( not ( = ?auto_1661890 ?auto_1661896 ) ) ( not ( = ?auto_1661890 ?auto_1661897 ) ) ( not ( = ?auto_1661890 ?auto_1661898 ) ) ( not ( = ?auto_1661890 ?auto_1661899 ) ) ( not ( = ?auto_1661890 ?auto_1661900 ) ) ( not ( = ?auto_1661890 ?auto_1661901 ) ) ( not ( = ?auto_1661890 ?auto_1661902 ) ) ( not ( = ?auto_1661890 ?auto_1661903 ) ) ( not ( = ?auto_1661890 ?auto_1661904 ) ) ( not ( = ?auto_1661891 ?auto_1661892 ) ) ( not ( = ?auto_1661891 ?auto_1661894 ) ) ( not ( = ?auto_1661891 ?auto_1661893 ) ) ( not ( = ?auto_1661891 ?auto_1661895 ) ) ( not ( = ?auto_1661891 ?auto_1661896 ) ) ( not ( = ?auto_1661891 ?auto_1661897 ) ) ( not ( = ?auto_1661891 ?auto_1661898 ) ) ( not ( = ?auto_1661891 ?auto_1661899 ) ) ( not ( = ?auto_1661891 ?auto_1661900 ) ) ( not ( = ?auto_1661891 ?auto_1661901 ) ) ( not ( = ?auto_1661891 ?auto_1661902 ) ) ( not ( = ?auto_1661891 ?auto_1661903 ) ) ( not ( = ?auto_1661891 ?auto_1661904 ) ) ( not ( = ?auto_1661892 ?auto_1661894 ) ) ( not ( = ?auto_1661892 ?auto_1661893 ) ) ( not ( = ?auto_1661892 ?auto_1661895 ) ) ( not ( = ?auto_1661892 ?auto_1661896 ) ) ( not ( = ?auto_1661892 ?auto_1661897 ) ) ( not ( = ?auto_1661892 ?auto_1661898 ) ) ( not ( = ?auto_1661892 ?auto_1661899 ) ) ( not ( = ?auto_1661892 ?auto_1661900 ) ) ( not ( = ?auto_1661892 ?auto_1661901 ) ) ( not ( = ?auto_1661892 ?auto_1661902 ) ) ( not ( = ?auto_1661892 ?auto_1661903 ) ) ( not ( = ?auto_1661892 ?auto_1661904 ) ) ( not ( = ?auto_1661894 ?auto_1661893 ) ) ( not ( = ?auto_1661894 ?auto_1661895 ) ) ( not ( = ?auto_1661894 ?auto_1661896 ) ) ( not ( = ?auto_1661894 ?auto_1661897 ) ) ( not ( = ?auto_1661894 ?auto_1661898 ) ) ( not ( = ?auto_1661894 ?auto_1661899 ) ) ( not ( = ?auto_1661894 ?auto_1661900 ) ) ( not ( = ?auto_1661894 ?auto_1661901 ) ) ( not ( = ?auto_1661894 ?auto_1661902 ) ) ( not ( = ?auto_1661894 ?auto_1661903 ) ) ( not ( = ?auto_1661894 ?auto_1661904 ) ) ( not ( = ?auto_1661893 ?auto_1661895 ) ) ( not ( = ?auto_1661893 ?auto_1661896 ) ) ( not ( = ?auto_1661893 ?auto_1661897 ) ) ( not ( = ?auto_1661893 ?auto_1661898 ) ) ( not ( = ?auto_1661893 ?auto_1661899 ) ) ( not ( = ?auto_1661893 ?auto_1661900 ) ) ( not ( = ?auto_1661893 ?auto_1661901 ) ) ( not ( = ?auto_1661893 ?auto_1661902 ) ) ( not ( = ?auto_1661893 ?auto_1661903 ) ) ( not ( = ?auto_1661893 ?auto_1661904 ) ) ( not ( = ?auto_1661895 ?auto_1661896 ) ) ( not ( = ?auto_1661895 ?auto_1661897 ) ) ( not ( = ?auto_1661895 ?auto_1661898 ) ) ( not ( = ?auto_1661895 ?auto_1661899 ) ) ( not ( = ?auto_1661895 ?auto_1661900 ) ) ( not ( = ?auto_1661895 ?auto_1661901 ) ) ( not ( = ?auto_1661895 ?auto_1661902 ) ) ( not ( = ?auto_1661895 ?auto_1661903 ) ) ( not ( = ?auto_1661895 ?auto_1661904 ) ) ( not ( = ?auto_1661896 ?auto_1661897 ) ) ( not ( = ?auto_1661896 ?auto_1661898 ) ) ( not ( = ?auto_1661896 ?auto_1661899 ) ) ( not ( = ?auto_1661896 ?auto_1661900 ) ) ( not ( = ?auto_1661896 ?auto_1661901 ) ) ( not ( = ?auto_1661896 ?auto_1661902 ) ) ( not ( = ?auto_1661896 ?auto_1661903 ) ) ( not ( = ?auto_1661896 ?auto_1661904 ) ) ( not ( = ?auto_1661897 ?auto_1661898 ) ) ( not ( = ?auto_1661897 ?auto_1661899 ) ) ( not ( = ?auto_1661897 ?auto_1661900 ) ) ( not ( = ?auto_1661897 ?auto_1661901 ) ) ( not ( = ?auto_1661897 ?auto_1661902 ) ) ( not ( = ?auto_1661897 ?auto_1661903 ) ) ( not ( = ?auto_1661897 ?auto_1661904 ) ) ( not ( = ?auto_1661898 ?auto_1661899 ) ) ( not ( = ?auto_1661898 ?auto_1661900 ) ) ( not ( = ?auto_1661898 ?auto_1661901 ) ) ( not ( = ?auto_1661898 ?auto_1661902 ) ) ( not ( = ?auto_1661898 ?auto_1661903 ) ) ( not ( = ?auto_1661898 ?auto_1661904 ) ) ( not ( = ?auto_1661899 ?auto_1661900 ) ) ( not ( = ?auto_1661899 ?auto_1661901 ) ) ( not ( = ?auto_1661899 ?auto_1661902 ) ) ( not ( = ?auto_1661899 ?auto_1661903 ) ) ( not ( = ?auto_1661899 ?auto_1661904 ) ) ( not ( = ?auto_1661900 ?auto_1661901 ) ) ( not ( = ?auto_1661900 ?auto_1661902 ) ) ( not ( = ?auto_1661900 ?auto_1661903 ) ) ( not ( = ?auto_1661900 ?auto_1661904 ) ) ( not ( = ?auto_1661901 ?auto_1661902 ) ) ( not ( = ?auto_1661901 ?auto_1661903 ) ) ( not ( = ?auto_1661901 ?auto_1661904 ) ) ( not ( = ?auto_1661902 ?auto_1661903 ) ) ( not ( = ?auto_1661902 ?auto_1661904 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1661903 ?auto_1661904 )
      ( MAKE-14CRATE-VERIFY ?auto_1661890 ?auto_1661891 ?auto_1661892 ?auto_1661894 ?auto_1661893 ?auto_1661895 ?auto_1661896 ?auto_1661897 ?auto_1661898 ?auto_1661899 ?auto_1661900 ?auto_1661901 ?auto_1661902 ?auto_1661903 ?auto_1661904 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1662050 - SURFACE
      ?auto_1662051 - SURFACE
      ?auto_1662052 - SURFACE
      ?auto_1662054 - SURFACE
      ?auto_1662053 - SURFACE
      ?auto_1662055 - SURFACE
      ?auto_1662056 - SURFACE
      ?auto_1662057 - SURFACE
      ?auto_1662058 - SURFACE
      ?auto_1662059 - SURFACE
      ?auto_1662060 - SURFACE
      ?auto_1662061 - SURFACE
      ?auto_1662062 - SURFACE
      ?auto_1662063 - SURFACE
      ?auto_1662064 - SURFACE
    )
    :vars
    (
      ?auto_1662065 - HOIST
      ?auto_1662066 - PLACE
      ?auto_1662067 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1662065 ?auto_1662066 ) ( SURFACE-AT ?auto_1662063 ?auto_1662066 ) ( CLEAR ?auto_1662063 ) ( IS-CRATE ?auto_1662064 ) ( not ( = ?auto_1662063 ?auto_1662064 ) ) ( TRUCK-AT ?auto_1662067 ?auto_1662066 ) ( AVAILABLE ?auto_1662065 ) ( IN ?auto_1662064 ?auto_1662067 ) ( ON ?auto_1662063 ?auto_1662062 ) ( not ( = ?auto_1662062 ?auto_1662063 ) ) ( not ( = ?auto_1662062 ?auto_1662064 ) ) ( ON ?auto_1662051 ?auto_1662050 ) ( ON ?auto_1662052 ?auto_1662051 ) ( ON ?auto_1662054 ?auto_1662052 ) ( ON ?auto_1662053 ?auto_1662054 ) ( ON ?auto_1662055 ?auto_1662053 ) ( ON ?auto_1662056 ?auto_1662055 ) ( ON ?auto_1662057 ?auto_1662056 ) ( ON ?auto_1662058 ?auto_1662057 ) ( ON ?auto_1662059 ?auto_1662058 ) ( ON ?auto_1662060 ?auto_1662059 ) ( ON ?auto_1662061 ?auto_1662060 ) ( ON ?auto_1662062 ?auto_1662061 ) ( not ( = ?auto_1662050 ?auto_1662051 ) ) ( not ( = ?auto_1662050 ?auto_1662052 ) ) ( not ( = ?auto_1662050 ?auto_1662054 ) ) ( not ( = ?auto_1662050 ?auto_1662053 ) ) ( not ( = ?auto_1662050 ?auto_1662055 ) ) ( not ( = ?auto_1662050 ?auto_1662056 ) ) ( not ( = ?auto_1662050 ?auto_1662057 ) ) ( not ( = ?auto_1662050 ?auto_1662058 ) ) ( not ( = ?auto_1662050 ?auto_1662059 ) ) ( not ( = ?auto_1662050 ?auto_1662060 ) ) ( not ( = ?auto_1662050 ?auto_1662061 ) ) ( not ( = ?auto_1662050 ?auto_1662062 ) ) ( not ( = ?auto_1662050 ?auto_1662063 ) ) ( not ( = ?auto_1662050 ?auto_1662064 ) ) ( not ( = ?auto_1662051 ?auto_1662052 ) ) ( not ( = ?auto_1662051 ?auto_1662054 ) ) ( not ( = ?auto_1662051 ?auto_1662053 ) ) ( not ( = ?auto_1662051 ?auto_1662055 ) ) ( not ( = ?auto_1662051 ?auto_1662056 ) ) ( not ( = ?auto_1662051 ?auto_1662057 ) ) ( not ( = ?auto_1662051 ?auto_1662058 ) ) ( not ( = ?auto_1662051 ?auto_1662059 ) ) ( not ( = ?auto_1662051 ?auto_1662060 ) ) ( not ( = ?auto_1662051 ?auto_1662061 ) ) ( not ( = ?auto_1662051 ?auto_1662062 ) ) ( not ( = ?auto_1662051 ?auto_1662063 ) ) ( not ( = ?auto_1662051 ?auto_1662064 ) ) ( not ( = ?auto_1662052 ?auto_1662054 ) ) ( not ( = ?auto_1662052 ?auto_1662053 ) ) ( not ( = ?auto_1662052 ?auto_1662055 ) ) ( not ( = ?auto_1662052 ?auto_1662056 ) ) ( not ( = ?auto_1662052 ?auto_1662057 ) ) ( not ( = ?auto_1662052 ?auto_1662058 ) ) ( not ( = ?auto_1662052 ?auto_1662059 ) ) ( not ( = ?auto_1662052 ?auto_1662060 ) ) ( not ( = ?auto_1662052 ?auto_1662061 ) ) ( not ( = ?auto_1662052 ?auto_1662062 ) ) ( not ( = ?auto_1662052 ?auto_1662063 ) ) ( not ( = ?auto_1662052 ?auto_1662064 ) ) ( not ( = ?auto_1662054 ?auto_1662053 ) ) ( not ( = ?auto_1662054 ?auto_1662055 ) ) ( not ( = ?auto_1662054 ?auto_1662056 ) ) ( not ( = ?auto_1662054 ?auto_1662057 ) ) ( not ( = ?auto_1662054 ?auto_1662058 ) ) ( not ( = ?auto_1662054 ?auto_1662059 ) ) ( not ( = ?auto_1662054 ?auto_1662060 ) ) ( not ( = ?auto_1662054 ?auto_1662061 ) ) ( not ( = ?auto_1662054 ?auto_1662062 ) ) ( not ( = ?auto_1662054 ?auto_1662063 ) ) ( not ( = ?auto_1662054 ?auto_1662064 ) ) ( not ( = ?auto_1662053 ?auto_1662055 ) ) ( not ( = ?auto_1662053 ?auto_1662056 ) ) ( not ( = ?auto_1662053 ?auto_1662057 ) ) ( not ( = ?auto_1662053 ?auto_1662058 ) ) ( not ( = ?auto_1662053 ?auto_1662059 ) ) ( not ( = ?auto_1662053 ?auto_1662060 ) ) ( not ( = ?auto_1662053 ?auto_1662061 ) ) ( not ( = ?auto_1662053 ?auto_1662062 ) ) ( not ( = ?auto_1662053 ?auto_1662063 ) ) ( not ( = ?auto_1662053 ?auto_1662064 ) ) ( not ( = ?auto_1662055 ?auto_1662056 ) ) ( not ( = ?auto_1662055 ?auto_1662057 ) ) ( not ( = ?auto_1662055 ?auto_1662058 ) ) ( not ( = ?auto_1662055 ?auto_1662059 ) ) ( not ( = ?auto_1662055 ?auto_1662060 ) ) ( not ( = ?auto_1662055 ?auto_1662061 ) ) ( not ( = ?auto_1662055 ?auto_1662062 ) ) ( not ( = ?auto_1662055 ?auto_1662063 ) ) ( not ( = ?auto_1662055 ?auto_1662064 ) ) ( not ( = ?auto_1662056 ?auto_1662057 ) ) ( not ( = ?auto_1662056 ?auto_1662058 ) ) ( not ( = ?auto_1662056 ?auto_1662059 ) ) ( not ( = ?auto_1662056 ?auto_1662060 ) ) ( not ( = ?auto_1662056 ?auto_1662061 ) ) ( not ( = ?auto_1662056 ?auto_1662062 ) ) ( not ( = ?auto_1662056 ?auto_1662063 ) ) ( not ( = ?auto_1662056 ?auto_1662064 ) ) ( not ( = ?auto_1662057 ?auto_1662058 ) ) ( not ( = ?auto_1662057 ?auto_1662059 ) ) ( not ( = ?auto_1662057 ?auto_1662060 ) ) ( not ( = ?auto_1662057 ?auto_1662061 ) ) ( not ( = ?auto_1662057 ?auto_1662062 ) ) ( not ( = ?auto_1662057 ?auto_1662063 ) ) ( not ( = ?auto_1662057 ?auto_1662064 ) ) ( not ( = ?auto_1662058 ?auto_1662059 ) ) ( not ( = ?auto_1662058 ?auto_1662060 ) ) ( not ( = ?auto_1662058 ?auto_1662061 ) ) ( not ( = ?auto_1662058 ?auto_1662062 ) ) ( not ( = ?auto_1662058 ?auto_1662063 ) ) ( not ( = ?auto_1662058 ?auto_1662064 ) ) ( not ( = ?auto_1662059 ?auto_1662060 ) ) ( not ( = ?auto_1662059 ?auto_1662061 ) ) ( not ( = ?auto_1662059 ?auto_1662062 ) ) ( not ( = ?auto_1662059 ?auto_1662063 ) ) ( not ( = ?auto_1662059 ?auto_1662064 ) ) ( not ( = ?auto_1662060 ?auto_1662061 ) ) ( not ( = ?auto_1662060 ?auto_1662062 ) ) ( not ( = ?auto_1662060 ?auto_1662063 ) ) ( not ( = ?auto_1662060 ?auto_1662064 ) ) ( not ( = ?auto_1662061 ?auto_1662062 ) ) ( not ( = ?auto_1662061 ?auto_1662063 ) ) ( not ( = ?auto_1662061 ?auto_1662064 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1662062 ?auto_1662063 ?auto_1662064 )
      ( MAKE-14CRATE-VERIFY ?auto_1662050 ?auto_1662051 ?auto_1662052 ?auto_1662054 ?auto_1662053 ?auto_1662055 ?auto_1662056 ?auto_1662057 ?auto_1662058 ?auto_1662059 ?auto_1662060 ?auto_1662061 ?auto_1662062 ?auto_1662063 ?auto_1662064 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1662225 - SURFACE
      ?auto_1662226 - SURFACE
      ?auto_1662227 - SURFACE
      ?auto_1662229 - SURFACE
      ?auto_1662228 - SURFACE
      ?auto_1662230 - SURFACE
      ?auto_1662231 - SURFACE
      ?auto_1662232 - SURFACE
      ?auto_1662233 - SURFACE
      ?auto_1662234 - SURFACE
      ?auto_1662235 - SURFACE
      ?auto_1662236 - SURFACE
      ?auto_1662237 - SURFACE
      ?auto_1662238 - SURFACE
      ?auto_1662239 - SURFACE
    )
    :vars
    (
      ?auto_1662242 - HOIST
      ?auto_1662240 - PLACE
      ?auto_1662241 - TRUCK
      ?auto_1662243 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1662242 ?auto_1662240 ) ( SURFACE-AT ?auto_1662238 ?auto_1662240 ) ( CLEAR ?auto_1662238 ) ( IS-CRATE ?auto_1662239 ) ( not ( = ?auto_1662238 ?auto_1662239 ) ) ( AVAILABLE ?auto_1662242 ) ( IN ?auto_1662239 ?auto_1662241 ) ( ON ?auto_1662238 ?auto_1662237 ) ( not ( = ?auto_1662237 ?auto_1662238 ) ) ( not ( = ?auto_1662237 ?auto_1662239 ) ) ( TRUCK-AT ?auto_1662241 ?auto_1662243 ) ( not ( = ?auto_1662243 ?auto_1662240 ) ) ( ON ?auto_1662226 ?auto_1662225 ) ( ON ?auto_1662227 ?auto_1662226 ) ( ON ?auto_1662229 ?auto_1662227 ) ( ON ?auto_1662228 ?auto_1662229 ) ( ON ?auto_1662230 ?auto_1662228 ) ( ON ?auto_1662231 ?auto_1662230 ) ( ON ?auto_1662232 ?auto_1662231 ) ( ON ?auto_1662233 ?auto_1662232 ) ( ON ?auto_1662234 ?auto_1662233 ) ( ON ?auto_1662235 ?auto_1662234 ) ( ON ?auto_1662236 ?auto_1662235 ) ( ON ?auto_1662237 ?auto_1662236 ) ( not ( = ?auto_1662225 ?auto_1662226 ) ) ( not ( = ?auto_1662225 ?auto_1662227 ) ) ( not ( = ?auto_1662225 ?auto_1662229 ) ) ( not ( = ?auto_1662225 ?auto_1662228 ) ) ( not ( = ?auto_1662225 ?auto_1662230 ) ) ( not ( = ?auto_1662225 ?auto_1662231 ) ) ( not ( = ?auto_1662225 ?auto_1662232 ) ) ( not ( = ?auto_1662225 ?auto_1662233 ) ) ( not ( = ?auto_1662225 ?auto_1662234 ) ) ( not ( = ?auto_1662225 ?auto_1662235 ) ) ( not ( = ?auto_1662225 ?auto_1662236 ) ) ( not ( = ?auto_1662225 ?auto_1662237 ) ) ( not ( = ?auto_1662225 ?auto_1662238 ) ) ( not ( = ?auto_1662225 ?auto_1662239 ) ) ( not ( = ?auto_1662226 ?auto_1662227 ) ) ( not ( = ?auto_1662226 ?auto_1662229 ) ) ( not ( = ?auto_1662226 ?auto_1662228 ) ) ( not ( = ?auto_1662226 ?auto_1662230 ) ) ( not ( = ?auto_1662226 ?auto_1662231 ) ) ( not ( = ?auto_1662226 ?auto_1662232 ) ) ( not ( = ?auto_1662226 ?auto_1662233 ) ) ( not ( = ?auto_1662226 ?auto_1662234 ) ) ( not ( = ?auto_1662226 ?auto_1662235 ) ) ( not ( = ?auto_1662226 ?auto_1662236 ) ) ( not ( = ?auto_1662226 ?auto_1662237 ) ) ( not ( = ?auto_1662226 ?auto_1662238 ) ) ( not ( = ?auto_1662226 ?auto_1662239 ) ) ( not ( = ?auto_1662227 ?auto_1662229 ) ) ( not ( = ?auto_1662227 ?auto_1662228 ) ) ( not ( = ?auto_1662227 ?auto_1662230 ) ) ( not ( = ?auto_1662227 ?auto_1662231 ) ) ( not ( = ?auto_1662227 ?auto_1662232 ) ) ( not ( = ?auto_1662227 ?auto_1662233 ) ) ( not ( = ?auto_1662227 ?auto_1662234 ) ) ( not ( = ?auto_1662227 ?auto_1662235 ) ) ( not ( = ?auto_1662227 ?auto_1662236 ) ) ( not ( = ?auto_1662227 ?auto_1662237 ) ) ( not ( = ?auto_1662227 ?auto_1662238 ) ) ( not ( = ?auto_1662227 ?auto_1662239 ) ) ( not ( = ?auto_1662229 ?auto_1662228 ) ) ( not ( = ?auto_1662229 ?auto_1662230 ) ) ( not ( = ?auto_1662229 ?auto_1662231 ) ) ( not ( = ?auto_1662229 ?auto_1662232 ) ) ( not ( = ?auto_1662229 ?auto_1662233 ) ) ( not ( = ?auto_1662229 ?auto_1662234 ) ) ( not ( = ?auto_1662229 ?auto_1662235 ) ) ( not ( = ?auto_1662229 ?auto_1662236 ) ) ( not ( = ?auto_1662229 ?auto_1662237 ) ) ( not ( = ?auto_1662229 ?auto_1662238 ) ) ( not ( = ?auto_1662229 ?auto_1662239 ) ) ( not ( = ?auto_1662228 ?auto_1662230 ) ) ( not ( = ?auto_1662228 ?auto_1662231 ) ) ( not ( = ?auto_1662228 ?auto_1662232 ) ) ( not ( = ?auto_1662228 ?auto_1662233 ) ) ( not ( = ?auto_1662228 ?auto_1662234 ) ) ( not ( = ?auto_1662228 ?auto_1662235 ) ) ( not ( = ?auto_1662228 ?auto_1662236 ) ) ( not ( = ?auto_1662228 ?auto_1662237 ) ) ( not ( = ?auto_1662228 ?auto_1662238 ) ) ( not ( = ?auto_1662228 ?auto_1662239 ) ) ( not ( = ?auto_1662230 ?auto_1662231 ) ) ( not ( = ?auto_1662230 ?auto_1662232 ) ) ( not ( = ?auto_1662230 ?auto_1662233 ) ) ( not ( = ?auto_1662230 ?auto_1662234 ) ) ( not ( = ?auto_1662230 ?auto_1662235 ) ) ( not ( = ?auto_1662230 ?auto_1662236 ) ) ( not ( = ?auto_1662230 ?auto_1662237 ) ) ( not ( = ?auto_1662230 ?auto_1662238 ) ) ( not ( = ?auto_1662230 ?auto_1662239 ) ) ( not ( = ?auto_1662231 ?auto_1662232 ) ) ( not ( = ?auto_1662231 ?auto_1662233 ) ) ( not ( = ?auto_1662231 ?auto_1662234 ) ) ( not ( = ?auto_1662231 ?auto_1662235 ) ) ( not ( = ?auto_1662231 ?auto_1662236 ) ) ( not ( = ?auto_1662231 ?auto_1662237 ) ) ( not ( = ?auto_1662231 ?auto_1662238 ) ) ( not ( = ?auto_1662231 ?auto_1662239 ) ) ( not ( = ?auto_1662232 ?auto_1662233 ) ) ( not ( = ?auto_1662232 ?auto_1662234 ) ) ( not ( = ?auto_1662232 ?auto_1662235 ) ) ( not ( = ?auto_1662232 ?auto_1662236 ) ) ( not ( = ?auto_1662232 ?auto_1662237 ) ) ( not ( = ?auto_1662232 ?auto_1662238 ) ) ( not ( = ?auto_1662232 ?auto_1662239 ) ) ( not ( = ?auto_1662233 ?auto_1662234 ) ) ( not ( = ?auto_1662233 ?auto_1662235 ) ) ( not ( = ?auto_1662233 ?auto_1662236 ) ) ( not ( = ?auto_1662233 ?auto_1662237 ) ) ( not ( = ?auto_1662233 ?auto_1662238 ) ) ( not ( = ?auto_1662233 ?auto_1662239 ) ) ( not ( = ?auto_1662234 ?auto_1662235 ) ) ( not ( = ?auto_1662234 ?auto_1662236 ) ) ( not ( = ?auto_1662234 ?auto_1662237 ) ) ( not ( = ?auto_1662234 ?auto_1662238 ) ) ( not ( = ?auto_1662234 ?auto_1662239 ) ) ( not ( = ?auto_1662235 ?auto_1662236 ) ) ( not ( = ?auto_1662235 ?auto_1662237 ) ) ( not ( = ?auto_1662235 ?auto_1662238 ) ) ( not ( = ?auto_1662235 ?auto_1662239 ) ) ( not ( = ?auto_1662236 ?auto_1662237 ) ) ( not ( = ?auto_1662236 ?auto_1662238 ) ) ( not ( = ?auto_1662236 ?auto_1662239 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1662237 ?auto_1662238 ?auto_1662239 )
      ( MAKE-14CRATE-VERIFY ?auto_1662225 ?auto_1662226 ?auto_1662227 ?auto_1662229 ?auto_1662228 ?auto_1662230 ?auto_1662231 ?auto_1662232 ?auto_1662233 ?auto_1662234 ?auto_1662235 ?auto_1662236 ?auto_1662237 ?auto_1662238 ?auto_1662239 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1662414 - SURFACE
      ?auto_1662415 - SURFACE
      ?auto_1662416 - SURFACE
      ?auto_1662418 - SURFACE
      ?auto_1662417 - SURFACE
      ?auto_1662419 - SURFACE
      ?auto_1662420 - SURFACE
      ?auto_1662421 - SURFACE
      ?auto_1662422 - SURFACE
      ?auto_1662423 - SURFACE
      ?auto_1662424 - SURFACE
      ?auto_1662425 - SURFACE
      ?auto_1662426 - SURFACE
      ?auto_1662427 - SURFACE
      ?auto_1662428 - SURFACE
    )
    :vars
    (
      ?auto_1662432 - HOIST
      ?auto_1662431 - PLACE
      ?auto_1662430 - TRUCK
      ?auto_1662429 - PLACE
      ?auto_1662433 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1662432 ?auto_1662431 ) ( SURFACE-AT ?auto_1662427 ?auto_1662431 ) ( CLEAR ?auto_1662427 ) ( IS-CRATE ?auto_1662428 ) ( not ( = ?auto_1662427 ?auto_1662428 ) ) ( AVAILABLE ?auto_1662432 ) ( ON ?auto_1662427 ?auto_1662426 ) ( not ( = ?auto_1662426 ?auto_1662427 ) ) ( not ( = ?auto_1662426 ?auto_1662428 ) ) ( TRUCK-AT ?auto_1662430 ?auto_1662429 ) ( not ( = ?auto_1662429 ?auto_1662431 ) ) ( HOIST-AT ?auto_1662433 ?auto_1662429 ) ( LIFTING ?auto_1662433 ?auto_1662428 ) ( not ( = ?auto_1662432 ?auto_1662433 ) ) ( ON ?auto_1662415 ?auto_1662414 ) ( ON ?auto_1662416 ?auto_1662415 ) ( ON ?auto_1662418 ?auto_1662416 ) ( ON ?auto_1662417 ?auto_1662418 ) ( ON ?auto_1662419 ?auto_1662417 ) ( ON ?auto_1662420 ?auto_1662419 ) ( ON ?auto_1662421 ?auto_1662420 ) ( ON ?auto_1662422 ?auto_1662421 ) ( ON ?auto_1662423 ?auto_1662422 ) ( ON ?auto_1662424 ?auto_1662423 ) ( ON ?auto_1662425 ?auto_1662424 ) ( ON ?auto_1662426 ?auto_1662425 ) ( not ( = ?auto_1662414 ?auto_1662415 ) ) ( not ( = ?auto_1662414 ?auto_1662416 ) ) ( not ( = ?auto_1662414 ?auto_1662418 ) ) ( not ( = ?auto_1662414 ?auto_1662417 ) ) ( not ( = ?auto_1662414 ?auto_1662419 ) ) ( not ( = ?auto_1662414 ?auto_1662420 ) ) ( not ( = ?auto_1662414 ?auto_1662421 ) ) ( not ( = ?auto_1662414 ?auto_1662422 ) ) ( not ( = ?auto_1662414 ?auto_1662423 ) ) ( not ( = ?auto_1662414 ?auto_1662424 ) ) ( not ( = ?auto_1662414 ?auto_1662425 ) ) ( not ( = ?auto_1662414 ?auto_1662426 ) ) ( not ( = ?auto_1662414 ?auto_1662427 ) ) ( not ( = ?auto_1662414 ?auto_1662428 ) ) ( not ( = ?auto_1662415 ?auto_1662416 ) ) ( not ( = ?auto_1662415 ?auto_1662418 ) ) ( not ( = ?auto_1662415 ?auto_1662417 ) ) ( not ( = ?auto_1662415 ?auto_1662419 ) ) ( not ( = ?auto_1662415 ?auto_1662420 ) ) ( not ( = ?auto_1662415 ?auto_1662421 ) ) ( not ( = ?auto_1662415 ?auto_1662422 ) ) ( not ( = ?auto_1662415 ?auto_1662423 ) ) ( not ( = ?auto_1662415 ?auto_1662424 ) ) ( not ( = ?auto_1662415 ?auto_1662425 ) ) ( not ( = ?auto_1662415 ?auto_1662426 ) ) ( not ( = ?auto_1662415 ?auto_1662427 ) ) ( not ( = ?auto_1662415 ?auto_1662428 ) ) ( not ( = ?auto_1662416 ?auto_1662418 ) ) ( not ( = ?auto_1662416 ?auto_1662417 ) ) ( not ( = ?auto_1662416 ?auto_1662419 ) ) ( not ( = ?auto_1662416 ?auto_1662420 ) ) ( not ( = ?auto_1662416 ?auto_1662421 ) ) ( not ( = ?auto_1662416 ?auto_1662422 ) ) ( not ( = ?auto_1662416 ?auto_1662423 ) ) ( not ( = ?auto_1662416 ?auto_1662424 ) ) ( not ( = ?auto_1662416 ?auto_1662425 ) ) ( not ( = ?auto_1662416 ?auto_1662426 ) ) ( not ( = ?auto_1662416 ?auto_1662427 ) ) ( not ( = ?auto_1662416 ?auto_1662428 ) ) ( not ( = ?auto_1662418 ?auto_1662417 ) ) ( not ( = ?auto_1662418 ?auto_1662419 ) ) ( not ( = ?auto_1662418 ?auto_1662420 ) ) ( not ( = ?auto_1662418 ?auto_1662421 ) ) ( not ( = ?auto_1662418 ?auto_1662422 ) ) ( not ( = ?auto_1662418 ?auto_1662423 ) ) ( not ( = ?auto_1662418 ?auto_1662424 ) ) ( not ( = ?auto_1662418 ?auto_1662425 ) ) ( not ( = ?auto_1662418 ?auto_1662426 ) ) ( not ( = ?auto_1662418 ?auto_1662427 ) ) ( not ( = ?auto_1662418 ?auto_1662428 ) ) ( not ( = ?auto_1662417 ?auto_1662419 ) ) ( not ( = ?auto_1662417 ?auto_1662420 ) ) ( not ( = ?auto_1662417 ?auto_1662421 ) ) ( not ( = ?auto_1662417 ?auto_1662422 ) ) ( not ( = ?auto_1662417 ?auto_1662423 ) ) ( not ( = ?auto_1662417 ?auto_1662424 ) ) ( not ( = ?auto_1662417 ?auto_1662425 ) ) ( not ( = ?auto_1662417 ?auto_1662426 ) ) ( not ( = ?auto_1662417 ?auto_1662427 ) ) ( not ( = ?auto_1662417 ?auto_1662428 ) ) ( not ( = ?auto_1662419 ?auto_1662420 ) ) ( not ( = ?auto_1662419 ?auto_1662421 ) ) ( not ( = ?auto_1662419 ?auto_1662422 ) ) ( not ( = ?auto_1662419 ?auto_1662423 ) ) ( not ( = ?auto_1662419 ?auto_1662424 ) ) ( not ( = ?auto_1662419 ?auto_1662425 ) ) ( not ( = ?auto_1662419 ?auto_1662426 ) ) ( not ( = ?auto_1662419 ?auto_1662427 ) ) ( not ( = ?auto_1662419 ?auto_1662428 ) ) ( not ( = ?auto_1662420 ?auto_1662421 ) ) ( not ( = ?auto_1662420 ?auto_1662422 ) ) ( not ( = ?auto_1662420 ?auto_1662423 ) ) ( not ( = ?auto_1662420 ?auto_1662424 ) ) ( not ( = ?auto_1662420 ?auto_1662425 ) ) ( not ( = ?auto_1662420 ?auto_1662426 ) ) ( not ( = ?auto_1662420 ?auto_1662427 ) ) ( not ( = ?auto_1662420 ?auto_1662428 ) ) ( not ( = ?auto_1662421 ?auto_1662422 ) ) ( not ( = ?auto_1662421 ?auto_1662423 ) ) ( not ( = ?auto_1662421 ?auto_1662424 ) ) ( not ( = ?auto_1662421 ?auto_1662425 ) ) ( not ( = ?auto_1662421 ?auto_1662426 ) ) ( not ( = ?auto_1662421 ?auto_1662427 ) ) ( not ( = ?auto_1662421 ?auto_1662428 ) ) ( not ( = ?auto_1662422 ?auto_1662423 ) ) ( not ( = ?auto_1662422 ?auto_1662424 ) ) ( not ( = ?auto_1662422 ?auto_1662425 ) ) ( not ( = ?auto_1662422 ?auto_1662426 ) ) ( not ( = ?auto_1662422 ?auto_1662427 ) ) ( not ( = ?auto_1662422 ?auto_1662428 ) ) ( not ( = ?auto_1662423 ?auto_1662424 ) ) ( not ( = ?auto_1662423 ?auto_1662425 ) ) ( not ( = ?auto_1662423 ?auto_1662426 ) ) ( not ( = ?auto_1662423 ?auto_1662427 ) ) ( not ( = ?auto_1662423 ?auto_1662428 ) ) ( not ( = ?auto_1662424 ?auto_1662425 ) ) ( not ( = ?auto_1662424 ?auto_1662426 ) ) ( not ( = ?auto_1662424 ?auto_1662427 ) ) ( not ( = ?auto_1662424 ?auto_1662428 ) ) ( not ( = ?auto_1662425 ?auto_1662426 ) ) ( not ( = ?auto_1662425 ?auto_1662427 ) ) ( not ( = ?auto_1662425 ?auto_1662428 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1662426 ?auto_1662427 ?auto_1662428 )
      ( MAKE-14CRATE-VERIFY ?auto_1662414 ?auto_1662415 ?auto_1662416 ?auto_1662418 ?auto_1662417 ?auto_1662419 ?auto_1662420 ?auto_1662421 ?auto_1662422 ?auto_1662423 ?auto_1662424 ?auto_1662425 ?auto_1662426 ?auto_1662427 ?auto_1662428 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1662617 - SURFACE
      ?auto_1662618 - SURFACE
      ?auto_1662619 - SURFACE
      ?auto_1662621 - SURFACE
      ?auto_1662620 - SURFACE
      ?auto_1662622 - SURFACE
      ?auto_1662623 - SURFACE
      ?auto_1662624 - SURFACE
      ?auto_1662625 - SURFACE
      ?auto_1662626 - SURFACE
      ?auto_1662627 - SURFACE
      ?auto_1662628 - SURFACE
      ?auto_1662629 - SURFACE
      ?auto_1662630 - SURFACE
      ?auto_1662631 - SURFACE
    )
    :vars
    (
      ?auto_1662632 - HOIST
      ?auto_1662634 - PLACE
      ?auto_1662635 - TRUCK
      ?auto_1662633 - PLACE
      ?auto_1662637 - HOIST
      ?auto_1662636 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1662632 ?auto_1662634 ) ( SURFACE-AT ?auto_1662630 ?auto_1662634 ) ( CLEAR ?auto_1662630 ) ( IS-CRATE ?auto_1662631 ) ( not ( = ?auto_1662630 ?auto_1662631 ) ) ( AVAILABLE ?auto_1662632 ) ( ON ?auto_1662630 ?auto_1662629 ) ( not ( = ?auto_1662629 ?auto_1662630 ) ) ( not ( = ?auto_1662629 ?auto_1662631 ) ) ( TRUCK-AT ?auto_1662635 ?auto_1662633 ) ( not ( = ?auto_1662633 ?auto_1662634 ) ) ( HOIST-AT ?auto_1662637 ?auto_1662633 ) ( not ( = ?auto_1662632 ?auto_1662637 ) ) ( AVAILABLE ?auto_1662637 ) ( SURFACE-AT ?auto_1662631 ?auto_1662633 ) ( ON ?auto_1662631 ?auto_1662636 ) ( CLEAR ?auto_1662631 ) ( not ( = ?auto_1662630 ?auto_1662636 ) ) ( not ( = ?auto_1662631 ?auto_1662636 ) ) ( not ( = ?auto_1662629 ?auto_1662636 ) ) ( ON ?auto_1662618 ?auto_1662617 ) ( ON ?auto_1662619 ?auto_1662618 ) ( ON ?auto_1662621 ?auto_1662619 ) ( ON ?auto_1662620 ?auto_1662621 ) ( ON ?auto_1662622 ?auto_1662620 ) ( ON ?auto_1662623 ?auto_1662622 ) ( ON ?auto_1662624 ?auto_1662623 ) ( ON ?auto_1662625 ?auto_1662624 ) ( ON ?auto_1662626 ?auto_1662625 ) ( ON ?auto_1662627 ?auto_1662626 ) ( ON ?auto_1662628 ?auto_1662627 ) ( ON ?auto_1662629 ?auto_1662628 ) ( not ( = ?auto_1662617 ?auto_1662618 ) ) ( not ( = ?auto_1662617 ?auto_1662619 ) ) ( not ( = ?auto_1662617 ?auto_1662621 ) ) ( not ( = ?auto_1662617 ?auto_1662620 ) ) ( not ( = ?auto_1662617 ?auto_1662622 ) ) ( not ( = ?auto_1662617 ?auto_1662623 ) ) ( not ( = ?auto_1662617 ?auto_1662624 ) ) ( not ( = ?auto_1662617 ?auto_1662625 ) ) ( not ( = ?auto_1662617 ?auto_1662626 ) ) ( not ( = ?auto_1662617 ?auto_1662627 ) ) ( not ( = ?auto_1662617 ?auto_1662628 ) ) ( not ( = ?auto_1662617 ?auto_1662629 ) ) ( not ( = ?auto_1662617 ?auto_1662630 ) ) ( not ( = ?auto_1662617 ?auto_1662631 ) ) ( not ( = ?auto_1662617 ?auto_1662636 ) ) ( not ( = ?auto_1662618 ?auto_1662619 ) ) ( not ( = ?auto_1662618 ?auto_1662621 ) ) ( not ( = ?auto_1662618 ?auto_1662620 ) ) ( not ( = ?auto_1662618 ?auto_1662622 ) ) ( not ( = ?auto_1662618 ?auto_1662623 ) ) ( not ( = ?auto_1662618 ?auto_1662624 ) ) ( not ( = ?auto_1662618 ?auto_1662625 ) ) ( not ( = ?auto_1662618 ?auto_1662626 ) ) ( not ( = ?auto_1662618 ?auto_1662627 ) ) ( not ( = ?auto_1662618 ?auto_1662628 ) ) ( not ( = ?auto_1662618 ?auto_1662629 ) ) ( not ( = ?auto_1662618 ?auto_1662630 ) ) ( not ( = ?auto_1662618 ?auto_1662631 ) ) ( not ( = ?auto_1662618 ?auto_1662636 ) ) ( not ( = ?auto_1662619 ?auto_1662621 ) ) ( not ( = ?auto_1662619 ?auto_1662620 ) ) ( not ( = ?auto_1662619 ?auto_1662622 ) ) ( not ( = ?auto_1662619 ?auto_1662623 ) ) ( not ( = ?auto_1662619 ?auto_1662624 ) ) ( not ( = ?auto_1662619 ?auto_1662625 ) ) ( not ( = ?auto_1662619 ?auto_1662626 ) ) ( not ( = ?auto_1662619 ?auto_1662627 ) ) ( not ( = ?auto_1662619 ?auto_1662628 ) ) ( not ( = ?auto_1662619 ?auto_1662629 ) ) ( not ( = ?auto_1662619 ?auto_1662630 ) ) ( not ( = ?auto_1662619 ?auto_1662631 ) ) ( not ( = ?auto_1662619 ?auto_1662636 ) ) ( not ( = ?auto_1662621 ?auto_1662620 ) ) ( not ( = ?auto_1662621 ?auto_1662622 ) ) ( not ( = ?auto_1662621 ?auto_1662623 ) ) ( not ( = ?auto_1662621 ?auto_1662624 ) ) ( not ( = ?auto_1662621 ?auto_1662625 ) ) ( not ( = ?auto_1662621 ?auto_1662626 ) ) ( not ( = ?auto_1662621 ?auto_1662627 ) ) ( not ( = ?auto_1662621 ?auto_1662628 ) ) ( not ( = ?auto_1662621 ?auto_1662629 ) ) ( not ( = ?auto_1662621 ?auto_1662630 ) ) ( not ( = ?auto_1662621 ?auto_1662631 ) ) ( not ( = ?auto_1662621 ?auto_1662636 ) ) ( not ( = ?auto_1662620 ?auto_1662622 ) ) ( not ( = ?auto_1662620 ?auto_1662623 ) ) ( not ( = ?auto_1662620 ?auto_1662624 ) ) ( not ( = ?auto_1662620 ?auto_1662625 ) ) ( not ( = ?auto_1662620 ?auto_1662626 ) ) ( not ( = ?auto_1662620 ?auto_1662627 ) ) ( not ( = ?auto_1662620 ?auto_1662628 ) ) ( not ( = ?auto_1662620 ?auto_1662629 ) ) ( not ( = ?auto_1662620 ?auto_1662630 ) ) ( not ( = ?auto_1662620 ?auto_1662631 ) ) ( not ( = ?auto_1662620 ?auto_1662636 ) ) ( not ( = ?auto_1662622 ?auto_1662623 ) ) ( not ( = ?auto_1662622 ?auto_1662624 ) ) ( not ( = ?auto_1662622 ?auto_1662625 ) ) ( not ( = ?auto_1662622 ?auto_1662626 ) ) ( not ( = ?auto_1662622 ?auto_1662627 ) ) ( not ( = ?auto_1662622 ?auto_1662628 ) ) ( not ( = ?auto_1662622 ?auto_1662629 ) ) ( not ( = ?auto_1662622 ?auto_1662630 ) ) ( not ( = ?auto_1662622 ?auto_1662631 ) ) ( not ( = ?auto_1662622 ?auto_1662636 ) ) ( not ( = ?auto_1662623 ?auto_1662624 ) ) ( not ( = ?auto_1662623 ?auto_1662625 ) ) ( not ( = ?auto_1662623 ?auto_1662626 ) ) ( not ( = ?auto_1662623 ?auto_1662627 ) ) ( not ( = ?auto_1662623 ?auto_1662628 ) ) ( not ( = ?auto_1662623 ?auto_1662629 ) ) ( not ( = ?auto_1662623 ?auto_1662630 ) ) ( not ( = ?auto_1662623 ?auto_1662631 ) ) ( not ( = ?auto_1662623 ?auto_1662636 ) ) ( not ( = ?auto_1662624 ?auto_1662625 ) ) ( not ( = ?auto_1662624 ?auto_1662626 ) ) ( not ( = ?auto_1662624 ?auto_1662627 ) ) ( not ( = ?auto_1662624 ?auto_1662628 ) ) ( not ( = ?auto_1662624 ?auto_1662629 ) ) ( not ( = ?auto_1662624 ?auto_1662630 ) ) ( not ( = ?auto_1662624 ?auto_1662631 ) ) ( not ( = ?auto_1662624 ?auto_1662636 ) ) ( not ( = ?auto_1662625 ?auto_1662626 ) ) ( not ( = ?auto_1662625 ?auto_1662627 ) ) ( not ( = ?auto_1662625 ?auto_1662628 ) ) ( not ( = ?auto_1662625 ?auto_1662629 ) ) ( not ( = ?auto_1662625 ?auto_1662630 ) ) ( not ( = ?auto_1662625 ?auto_1662631 ) ) ( not ( = ?auto_1662625 ?auto_1662636 ) ) ( not ( = ?auto_1662626 ?auto_1662627 ) ) ( not ( = ?auto_1662626 ?auto_1662628 ) ) ( not ( = ?auto_1662626 ?auto_1662629 ) ) ( not ( = ?auto_1662626 ?auto_1662630 ) ) ( not ( = ?auto_1662626 ?auto_1662631 ) ) ( not ( = ?auto_1662626 ?auto_1662636 ) ) ( not ( = ?auto_1662627 ?auto_1662628 ) ) ( not ( = ?auto_1662627 ?auto_1662629 ) ) ( not ( = ?auto_1662627 ?auto_1662630 ) ) ( not ( = ?auto_1662627 ?auto_1662631 ) ) ( not ( = ?auto_1662627 ?auto_1662636 ) ) ( not ( = ?auto_1662628 ?auto_1662629 ) ) ( not ( = ?auto_1662628 ?auto_1662630 ) ) ( not ( = ?auto_1662628 ?auto_1662631 ) ) ( not ( = ?auto_1662628 ?auto_1662636 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1662629 ?auto_1662630 ?auto_1662631 )
      ( MAKE-14CRATE-VERIFY ?auto_1662617 ?auto_1662618 ?auto_1662619 ?auto_1662621 ?auto_1662620 ?auto_1662622 ?auto_1662623 ?auto_1662624 ?auto_1662625 ?auto_1662626 ?auto_1662627 ?auto_1662628 ?auto_1662629 ?auto_1662630 ?auto_1662631 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1662821 - SURFACE
      ?auto_1662822 - SURFACE
      ?auto_1662823 - SURFACE
      ?auto_1662825 - SURFACE
      ?auto_1662824 - SURFACE
      ?auto_1662826 - SURFACE
      ?auto_1662827 - SURFACE
      ?auto_1662828 - SURFACE
      ?auto_1662829 - SURFACE
      ?auto_1662830 - SURFACE
      ?auto_1662831 - SURFACE
      ?auto_1662832 - SURFACE
      ?auto_1662833 - SURFACE
      ?auto_1662834 - SURFACE
      ?auto_1662835 - SURFACE
    )
    :vars
    (
      ?auto_1662840 - HOIST
      ?auto_1662841 - PLACE
      ?auto_1662839 - PLACE
      ?auto_1662838 - HOIST
      ?auto_1662836 - SURFACE
      ?auto_1662837 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1662840 ?auto_1662841 ) ( SURFACE-AT ?auto_1662834 ?auto_1662841 ) ( CLEAR ?auto_1662834 ) ( IS-CRATE ?auto_1662835 ) ( not ( = ?auto_1662834 ?auto_1662835 ) ) ( AVAILABLE ?auto_1662840 ) ( ON ?auto_1662834 ?auto_1662833 ) ( not ( = ?auto_1662833 ?auto_1662834 ) ) ( not ( = ?auto_1662833 ?auto_1662835 ) ) ( not ( = ?auto_1662839 ?auto_1662841 ) ) ( HOIST-AT ?auto_1662838 ?auto_1662839 ) ( not ( = ?auto_1662840 ?auto_1662838 ) ) ( AVAILABLE ?auto_1662838 ) ( SURFACE-AT ?auto_1662835 ?auto_1662839 ) ( ON ?auto_1662835 ?auto_1662836 ) ( CLEAR ?auto_1662835 ) ( not ( = ?auto_1662834 ?auto_1662836 ) ) ( not ( = ?auto_1662835 ?auto_1662836 ) ) ( not ( = ?auto_1662833 ?auto_1662836 ) ) ( TRUCK-AT ?auto_1662837 ?auto_1662841 ) ( ON ?auto_1662822 ?auto_1662821 ) ( ON ?auto_1662823 ?auto_1662822 ) ( ON ?auto_1662825 ?auto_1662823 ) ( ON ?auto_1662824 ?auto_1662825 ) ( ON ?auto_1662826 ?auto_1662824 ) ( ON ?auto_1662827 ?auto_1662826 ) ( ON ?auto_1662828 ?auto_1662827 ) ( ON ?auto_1662829 ?auto_1662828 ) ( ON ?auto_1662830 ?auto_1662829 ) ( ON ?auto_1662831 ?auto_1662830 ) ( ON ?auto_1662832 ?auto_1662831 ) ( ON ?auto_1662833 ?auto_1662832 ) ( not ( = ?auto_1662821 ?auto_1662822 ) ) ( not ( = ?auto_1662821 ?auto_1662823 ) ) ( not ( = ?auto_1662821 ?auto_1662825 ) ) ( not ( = ?auto_1662821 ?auto_1662824 ) ) ( not ( = ?auto_1662821 ?auto_1662826 ) ) ( not ( = ?auto_1662821 ?auto_1662827 ) ) ( not ( = ?auto_1662821 ?auto_1662828 ) ) ( not ( = ?auto_1662821 ?auto_1662829 ) ) ( not ( = ?auto_1662821 ?auto_1662830 ) ) ( not ( = ?auto_1662821 ?auto_1662831 ) ) ( not ( = ?auto_1662821 ?auto_1662832 ) ) ( not ( = ?auto_1662821 ?auto_1662833 ) ) ( not ( = ?auto_1662821 ?auto_1662834 ) ) ( not ( = ?auto_1662821 ?auto_1662835 ) ) ( not ( = ?auto_1662821 ?auto_1662836 ) ) ( not ( = ?auto_1662822 ?auto_1662823 ) ) ( not ( = ?auto_1662822 ?auto_1662825 ) ) ( not ( = ?auto_1662822 ?auto_1662824 ) ) ( not ( = ?auto_1662822 ?auto_1662826 ) ) ( not ( = ?auto_1662822 ?auto_1662827 ) ) ( not ( = ?auto_1662822 ?auto_1662828 ) ) ( not ( = ?auto_1662822 ?auto_1662829 ) ) ( not ( = ?auto_1662822 ?auto_1662830 ) ) ( not ( = ?auto_1662822 ?auto_1662831 ) ) ( not ( = ?auto_1662822 ?auto_1662832 ) ) ( not ( = ?auto_1662822 ?auto_1662833 ) ) ( not ( = ?auto_1662822 ?auto_1662834 ) ) ( not ( = ?auto_1662822 ?auto_1662835 ) ) ( not ( = ?auto_1662822 ?auto_1662836 ) ) ( not ( = ?auto_1662823 ?auto_1662825 ) ) ( not ( = ?auto_1662823 ?auto_1662824 ) ) ( not ( = ?auto_1662823 ?auto_1662826 ) ) ( not ( = ?auto_1662823 ?auto_1662827 ) ) ( not ( = ?auto_1662823 ?auto_1662828 ) ) ( not ( = ?auto_1662823 ?auto_1662829 ) ) ( not ( = ?auto_1662823 ?auto_1662830 ) ) ( not ( = ?auto_1662823 ?auto_1662831 ) ) ( not ( = ?auto_1662823 ?auto_1662832 ) ) ( not ( = ?auto_1662823 ?auto_1662833 ) ) ( not ( = ?auto_1662823 ?auto_1662834 ) ) ( not ( = ?auto_1662823 ?auto_1662835 ) ) ( not ( = ?auto_1662823 ?auto_1662836 ) ) ( not ( = ?auto_1662825 ?auto_1662824 ) ) ( not ( = ?auto_1662825 ?auto_1662826 ) ) ( not ( = ?auto_1662825 ?auto_1662827 ) ) ( not ( = ?auto_1662825 ?auto_1662828 ) ) ( not ( = ?auto_1662825 ?auto_1662829 ) ) ( not ( = ?auto_1662825 ?auto_1662830 ) ) ( not ( = ?auto_1662825 ?auto_1662831 ) ) ( not ( = ?auto_1662825 ?auto_1662832 ) ) ( not ( = ?auto_1662825 ?auto_1662833 ) ) ( not ( = ?auto_1662825 ?auto_1662834 ) ) ( not ( = ?auto_1662825 ?auto_1662835 ) ) ( not ( = ?auto_1662825 ?auto_1662836 ) ) ( not ( = ?auto_1662824 ?auto_1662826 ) ) ( not ( = ?auto_1662824 ?auto_1662827 ) ) ( not ( = ?auto_1662824 ?auto_1662828 ) ) ( not ( = ?auto_1662824 ?auto_1662829 ) ) ( not ( = ?auto_1662824 ?auto_1662830 ) ) ( not ( = ?auto_1662824 ?auto_1662831 ) ) ( not ( = ?auto_1662824 ?auto_1662832 ) ) ( not ( = ?auto_1662824 ?auto_1662833 ) ) ( not ( = ?auto_1662824 ?auto_1662834 ) ) ( not ( = ?auto_1662824 ?auto_1662835 ) ) ( not ( = ?auto_1662824 ?auto_1662836 ) ) ( not ( = ?auto_1662826 ?auto_1662827 ) ) ( not ( = ?auto_1662826 ?auto_1662828 ) ) ( not ( = ?auto_1662826 ?auto_1662829 ) ) ( not ( = ?auto_1662826 ?auto_1662830 ) ) ( not ( = ?auto_1662826 ?auto_1662831 ) ) ( not ( = ?auto_1662826 ?auto_1662832 ) ) ( not ( = ?auto_1662826 ?auto_1662833 ) ) ( not ( = ?auto_1662826 ?auto_1662834 ) ) ( not ( = ?auto_1662826 ?auto_1662835 ) ) ( not ( = ?auto_1662826 ?auto_1662836 ) ) ( not ( = ?auto_1662827 ?auto_1662828 ) ) ( not ( = ?auto_1662827 ?auto_1662829 ) ) ( not ( = ?auto_1662827 ?auto_1662830 ) ) ( not ( = ?auto_1662827 ?auto_1662831 ) ) ( not ( = ?auto_1662827 ?auto_1662832 ) ) ( not ( = ?auto_1662827 ?auto_1662833 ) ) ( not ( = ?auto_1662827 ?auto_1662834 ) ) ( not ( = ?auto_1662827 ?auto_1662835 ) ) ( not ( = ?auto_1662827 ?auto_1662836 ) ) ( not ( = ?auto_1662828 ?auto_1662829 ) ) ( not ( = ?auto_1662828 ?auto_1662830 ) ) ( not ( = ?auto_1662828 ?auto_1662831 ) ) ( not ( = ?auto_1662828 ?auto_1662832 ) ) ( not ( = ?auto_1662828 ?auto_1662833 ) ) ( not ( = ?auto_1662828 ?auto_1662834 ) ) ( not ( = ?auto_1662828 ?auto_1662835 ) ) ( not ( = ?auto_1662828 ?auto_1662836 ) ) ( not ( = ?auto_1662829 ?auto_1662830 ) ) ( not ( = ?auto_1662829 ?auto_1662831 ) ) ( not ( = ?auto_1662829 ?auto_1662832 ) ) ( not ( = ?auto_1662829 ?auto_1662833 ) ) ( not ( = ?auto_1662829 ?auto_1662834 ) ) ( not ( = ?auto_1662829 ?auto_1662835 ) ) ( not ( = ?auto_1662829 ?auto_1662836 ) ) ( not ( = ?auto_1662830 ?auto_1662831 ) ) ( not ( = ?auto_1662830 ?auto_1662832 ) ) ( not ( = ?auto_1662830 ?auto_1662833 ) ) ( not ( = ?auto_1662830 ?auto_1662834 ) ) ( not ( = ?auto_1662830 ?auto_1662835 ) ) ( not ( = ?auto_1662830 ?auto_1662836 ) ) ( not ( = ?auto_1662831 ?auto_1662832 ) ) ( not ( = ?auto_1662831 ?auto_1662833 ) ) ( not ( = ?auto_1662831 ?auto_1662834 ) ) ( not ( = ?auto_1662831 ?auto_1662835 ) ) ( not ( = ?auto_1662831 ?auto_1662836 ) ) ( not ( = ?auto_1662832 ?auto_1662833 ) ) ( not ( = ?auto_1662832 ?auto_1662834 ) ) ( not ( = ?auto_1662832 ?auto_1662835 ) ) ( not ( = ?auto_1662832 ?auto_1662836 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1662833 ?auto_1662834 ?auto_1662835 )
      ( MAKE-14CRATE-VERIFY ?auto_1662821 ?auto_1662822 ?auto_1662823 ?auto_1662825 ?auto_1662824 ?auto_1662826 ?auto_1662827 ?auto_1662828 ?auto_1662829 ?auto_1662830 ?auto_1662831 ?auto_1662832 ?auto_1662833 ?auto_1662834 ?auto_1662835 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1663025 - SURFACE
      ?auto_1663026 - SURFACE
      ?auto_1663027 - SURFACE
      ?auto_1663029 - SURFACE
      ?auto_1663028 - SURFACE
      ?auto_1663030 - SURFACE
      ?auto_1663031 - SURFACE
      ?auto_1663032 - SURFACE
      ?auto_1663033 - SURFACE
      ?auto_1663034 - SURFACE
      ?auto_1663035 - SURFACE
      ?auto_1663036 - SURFACE
      ?auto_1663037 - SURFACE
      ?auto_1663038 - SURFACE
      ?auto_1663039 - SURFACE
    )
    :vars
    (
      ?auto_1663044 - HOIST
      ?auto_1663043 - PLACE
      ?auto_1663045 - PLACE
      ?auto_1663040 - HOIST
      ?auto_1663042 - SURFACE
      ?auto_1663041 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1663044 ?auto_1663043 ) ( IS-CRATE ?auto_1663039 ) ( not ( = ?auto_1663038 ?auto_1663039 ) ) ( not ( = ?auto_1663037 ?auto_1663038 ) ) ( not ( = ?auto_1663037 ?auto_1663039 ) ) ( not ( = ?auto_1663045 ?auto_1663043 ) ) ( HOIST-AT ?auto_1663040 ?auto_1663045 ) ( not ( = ?auto_1663044 ?auto_1663040 ) ) ( AVAILABLE ?auto_1663040 ) ( SURFACE-AT ?auto_1663039 ?auto_1663045 ) ( ON ?auto_1663039 ?auto_1663042 ) ( CLEAR ?auto_1663039 ) ( not ( = ?auto_1663038 ?auto_1663042 ) ) ( not ( = ?auto_1663039 ?auto_1663042 ) ) ( not ( = ?auto_1663037 ?auto_1663042 ) ) ( TRUCK-AT ?auto_1663041 ?auto_1663043 ) ( SURFACE-AT ?auto_1663037 ?auto_1663043 ) ( CLEAR ?auto_1663037 ) ( LIFTING ?auto_1663044 ?auto_1663038 ) ( IS-CRATE ?auto_1663038 ) ( ON ?auto_1663026 ?auto_1663025 ) ( ON ?auto_1663027 ?auto_1663026 ) ( ON ?auto_1663029 ?auto_1663027 ) ( ON ?auto_1663028 ?auto_1663029 ) ( ON ?auto_1663030 ?auto_1663028 ) ( ON ?auto_1663031 ?auto_1663030 ) ( ON ?auto_1663032 ?auto_1663031 ) ( ON ?auto_1663033 ?auto_1663032 ) ( ON ?auto_1663034 ?auto_1663033 ) ( ON ?auto_1663035 ?auto_1663034 ) ( ON ?auto_1663036 ?auto_1663035 ) ( ON ?auto_1663037 ?auto_1663036 ) ( not ( = ?auto_1663025 ?auto_1663026 ) ) ( not ( = ?auto_1663025 ?auto_1663027 ) ) ( not ( = ?auto_1663025 ?auto_1663029 ) ) ( not ( = ?auto_1663025 ?auto_1663028 ) ) ( not ( = ?auto_1663025 ?auto_1663030 ) ) ( not ( = ?auto_1663025 ?auto_1663031 ) ) ( not ( = ?auto_1663025 ?auto_1663032 ) ) ( not ( = ?auto_1663025 ?auto_1663033 ) ) ( not ( = ?auto_1663025 ?auto_1663034 ) ) ( not ( = ?auto_1663025 ?auto_1663035 ) ) ( not ( = ?auto_1663025 ?auto_1663036 ) ) ( not ( = ?auto_1663025 ?auto_1663037 ) ) ( not ( = ?auto_1663025 ?auto_1663038 ) ) ( not ( = ?auto_1663025 ?auto_1663039 ) ) ( not ( = ?auto_1663025 ?auto_1663042 ) ) ( not ( = ?auto_1663026 ?auto_1663027 ) ) ( not ( = ?auto_1663026 ?auto_1663029 ) ) ( not ( = ?auto_1663026 ?auto_1663028 ) ) ( not ( = ?auto_1663026 ?auto_1663030 ) ) ( not ( = ?auto_1663026 ?auto_1663031 ) ) ( not ( = ?auto_1663026 ?auto_1663032 ) ) ( not ( = ?auto_1663026 ?auto_1663033 ) ) ( not ( = ?auto_1663026 ?auto_1663034 ) ) ( not ( = ?auto_1663026 ?auto_1663035 ) ) ( not ( = ?auto_1663026 ?auto_1663036 ) ) ( not ( = ?auto_1663026 ?auto_1663037 ) ) ( not ( = ?auto_1663026 ?auto_1663038 ) ) ( not ( = ?auto_1663026 ?auto_1663039 ) ) ( not ( = ?auto_1663026 ?auto_1663042 ) ) ( not ( = ?auto_1663027 ?auto_1663029 ) ) ( not ( = ?auto_1663027 ?auto_1663028 ) ) ( not ( = ?auto_1663027 ?auto_1663030 ) ) ( not ( = ?auto_1663027 ?auto_1663031 ) ) ( not ( = ?auto_1663027 ?auto_1663032 ) ) ( not ( = ?auto_1663027 ?auto_1663033 ) ) ( not ( = ?auto_1663027 ?auto_1663034 ) ) ( not ( = ?auto_1663027 ?auto_1663035 ) ) ( not ( = ?auto_1663027 ?auto_1663036 ) ) ( not ( = ?auto_1663027 ?auto_1663037 ) ) ( not ( = ?auto_1663027 ?auto_1663038 ) ) ( not ( = ?auto_1663027 ?auto_1663039 ) ) ( not ( = ?auto_1663027 ?auto_1663042 ) ) ( not ( = ?auto_1663029 ?auto_1663028 ) ) ( not ( = ?auto_1663029 ?auto_1663030 ) ) ( not ( = ?auto_1663029 ?auto_1663031 ) ) ( not ( = ?auto_1663029 ?auto_1663032 ) ) ( not ( = ?auto_1663029 ?auto_1663033 ) ) ( not ( = ?auto_1663029 ?auto_1663034 ) ) ( not ( = ?auto_1663029 ?auto_1663035 ) ) ( not ( = ?auto_1663029 ?auto_1663036 ) ) ( not ( = ?auto_1663029 ?auto_1663037 ) ) ( not ( = ?auto_1663029 ?auto_1663038 ) ) ( not ( = ?auto_1663029 ?auto_1663039 ) ) ( not ( = ?auto_1663029 ?auto_1663042 ) ) ( not ( = ?auto_1663028 ?auto_1663030 ) ) ( not ( = ?auto_1663028 ?auto_1663031 ) ) ( not ( = ?auto_1663028 ?auto_1663032 ) ) ( not ( = ?auto_1663028 ?auto_1663033 ) ) ( not ( = ?auto_1663028 ?auto_1663034 ) ) ( not ( = ?auto_1663028 ?auto_1663035 ) ) ( not ( = ?auto_1663028 ?auto_1663036 ) ) ( not ( = ?auto_1663028 ?auto_1663037 ) ) ( not ( = ?auto_1663028 ?auto_1663038 ) ) ( not ( = ?auto_1663028 ?auto_1663039 ) ) ( not ( = ?auto_1663028 ?auto_1663042 ) ) ( not ( = ?auto_1663030 ?auto_1663031 ) ) ( not ( = ?auto_1663030 ?auto_1663032 ) ) ( not ( = ?auto_1663030 ?auto_1663033 ) ) ( not ( = ?auto_1663030 ?auto_1663034 ) ) ( not ( = ?auto_1663030 ?auto_1663035 ) ) ( not ( = ?auto_1663030 ?auto_1663036 ) ) ( not ( = ?auto_1663030 ?auto_1663037 ) ) ( not ( = ?auto_1663030 ?auto_1663038 ) ) ( not ( = ?auto_1663030 ?auto_1663039 ) ) ( not ( = ?auto_1663030 ?auto_1663042 ) ) ( not ( = ?auto_1663031 ?auto_1663032 ) ) ( not ( = ?auto_1663031 ?auto_1663033 ) ) ( not ( = ?auto_1663031 ?auto_1663034 ) ) ( not ( = ?auto_1663031 ?auto_1663035 ) ) ( not ( = ?auto_1663031 ?auto_1663036 ) ) ( not ( = ?auto_1663031 ?auto_1663037 ) ) ( not ( = ?auto_1663031 ?auto_1663038 ) ) ( not ( = ?auto_1663031 ?auto_1663039 ) ) ( not ( = ?auto_1663031 ?auto_1663042 ) ) ( not ( = ?auto_1663032 ?auto_1663033 ) ) ( not ( = ?auto_1663032 ?auto_1663034 ) ) ( not ( = ?auto_1663032 ?auto_1663035 ) ) ( not ( = ?auto_1663032 ?auto_1663036 ) ) ( not ( = ?auto_1663032 ?auto_1663037 ) ) ( not ( = ?auto_1663032 ?auto_1663038 ) ) ( not ( = ?auto_1663032 ?auto_1663039 ) ) ( not ( = ?auto_1663032 ?auto_1663042 ) ) ( not ( = ?auto_1663033 ?auto_1663034 ) ) ( not ( = ?auto_1663033 ?auto_1663035 ) ) ( not ( = ?auto_1663033 ?auto_1663036 ) ) ( not ( = ?auto_1663033 ?auto_1663037 ) ) ( not ( = ?auto_1663033 ?auto_1663038 ) ) ( not ( = ?auto_1663033 ?auto_1663039 ) ) ( not ( = ?auto_1663033 ?auto_1663042 ) ) ( not ( = ?auto_1663034 ?auto_1663035 ) ) ( not ( = ?auto_1663034 ?auto_1663036 ) ) ( not ( = ?auto_1663034 ?auto_1663037 ) ) ( not ( = ?auto_1663034 ?auto_1663038 ) ) ( not ( = ?auto_1663034 ?auto_1663039 ) ) ( not ( = ?auto_1663034 ?auto_1663042 ) ) ( not ( = ?auto_1663035 ?auto_1663036 ) ) ( not ( = ?auto_1663035 ?auto_1663037 ) ) ( not ( = ?auto_1663035 ?auto_1663038 ) ) ( not ( = ?auto_1663035 ?auto_1663039 ) ) ( not ( = ?auto_1663035 ?auto_1663042 ) ) ( not ( = ?auto_1663036 ?auto_1663037 ) ) ( not ( = ?auto_1663036 ?auto_1663038 ) ) ( not ( = ?auto_1663036 ?auto_1663039 ) ) ( not ( = ?auto_1663036 ?auto_1663042 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1663037 ?auto_1663038 ?auto_1663039 )
      ( MAKE-14CRATE-VERIFY ?auto_1663025 ?auto_1663026 ?auto_1663027 ?auto_1663029 ?auto_1663028 ?auto_1663030 ?auto_1663031 ?auto_1663032 ?auto_1663033 ?auto_1663034 ?auto_1663035 ?auto_1663036 ?auto_1663037 ?auto_1663038 ?auto_1663039 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1663229 - SURFACE
      ?auto_1663230 - SURFACE
      ?auto_1663231 - SURFACE
      ?auto_1663233 - SURFACE
      ?auto_1663232 - SURFACE
      ?auto_1663234 - SURFACE
      ?auto_1663235 - SURFACE
      ?auto_1663236 - SURFACE
      ?auto_1663237 - SURFACE
      ?auto_1663238 - SURFACE
      ?auto_1663239 - SURFACE
      ?auto_1663240 - SURFACE
      ?auto_1663241 - SURFACE
      ?auto_1663242 - SURFACE
      ?auto_1663243 - SURFACE
    )
    :vars
    (
      ?auto_1663247 - HOIST
      ?auto_1663244 - PLACE
      ?auto_1663248 - PLACE
      ?auto_1663249 - HOIST
      ?auto_1663246 - SURFACE
      ?auto_1663245 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1663247 ?auto_1663244 ) ( IS-CRATE ?auto_1663243 ) ( not ( = ?auto_1663242 ?auto_1663243 ) ) ( not ( = ?auto_1663241 ?auto_1663242 ) ) ( not ( = ?auto_1663241 ?auto_1663243 ) ) ( not ( = ?auto_1663248 ?auto_1663244 ) ) ( HOIST-AT ?auto_1663249 ?auto_1663248 ) ( not ( = ?auto_1663247 ?auto_1663249 ) ) ( AVAILABLE ?auto_1663249 ) ( SURFACE-AT ?auto_1663243 ?auto_1663248 ) ( ON ?auto_1663243 ?auto_1663246 ) ( CLEAR ?auto_1663243 ) ( not ( = ?auto_1663242 ?auto_1663246 ) ) ( not ( = ?auto_1663243 ?auto_1663246 ) ) ( not ( = ?auto_1663241 ?auto_1663246 ) ) ( TRUCK-AT ?auto_1663245 ?auto_1663244 ) ( SURFACE-AT ?auto_1663241 ?auto_1663244 ) ( CLEAR ?auto_1663241 ) ( IS-CRATE ?auto_1663242 ) ( AVAILABLE ?auto_1663247 ) ( IN ?auto_1663242 ?auto_1663245 ) ( ON ?auto_1663230 ?auto_1663229 ) ( ON ?auto_1663231 ?auto_1663230 ) ( ON ?auto_1663233 ?auto_1663231 ) ( ON ?auto_1663232 ?auto_1663233 ) ( ON ?auto_1663234 ?auto_1663232 ) ( ON ?auto_1663235 ?auto_1663234 ) ( ON ?auto_1663236 ?auto_1663235 ) ( ON ?auto_1663237 ?auto_1663236 ) ( ON ?auto_1663238 ?auto_1663237 ) ( ON ?auto_1663239 ?auto_1663238 ) ( ON ?auto_1663240 ?auto_1663239 ) ( ON ?auto_1663241 ?auto_1663240 ) ( not ( = ?auto_1663229 ?auto_1663230 ) ) ( not ( = ?auto_1663229 ?auto_1663231 ) ) ( not ( = ?auto_1663229 ?auto_1663233 ) ) ( not ( = ?auto_1663229 ?auto_1663232 ) ) ( not ( = ?auto_1663229 ?auto_1663234 ) ) ( not ( = ?auto_1663229 ?auto_1663235 ) ) ( not ( = ?auto_1663229 ?auto_1663236 ) ) ( not ( = ?auto_1663229 ?auto_1663237 ) ) ( not ( = ?auto_1663229 ?auto_1663238 ) ) ( not ( = ?auto_1663229 ?auto_1663239 ) ) ( not ( = ?auto_1663229 ?auto_1663240 ) ) ( not ( = ?auto_1663229 ?auto_1663241 ) ) ( not ( = ?auto_1663229 ?auto_1663242 ) ) ( not ( = ?auto_1663229 ?auto_1663243 ) ) ( not ( = ?auto_1663229 ?auto_1663246 ) ) ( not ( = ?auto_1663230 ?auto_1663231 ) ) ( not ( = ?auto_1663230 ?auto_1663233 ) ) ( not ( = ?auto_1663230 ?auto_1663232 ) ) ( not ( = ?auto_1663230 ?auto_1663234 ) ) ( not ( = ?auto_1663230 ?auto_1663235 ) ) ( not ( = ?auto_1663230 ?auto_1663236 ) ) ( not ( = ?auto_1663230 ?auto_1663237 ) ) ( not ( = ?auto_1663230 ?auto_1663238 ) ) ( not ( = ?auto_1663230 ?auto_1663239 ) ) ( not ( = ?auto_1663230 ?auto_1663240 ) ) ( not ( = ?auto_1663230 ?auto_1663241 ) ) ( not ( = ?auto_1663230 ?auto_1663242 ) ) ( not ( = ?auto_1663230 ?auto_1663243 ) ) ( not ( = ?auto_1663230 ?auto_1663246 ) ) ( not ( = ?auto_1663231 ?auto_1663233 ) ) ( not ( = ?auto_1663231 ?auto_1663232 ) ) ( not ( = ?auto_1663231 ?auto_1663234 ) ) ( not ( = ?auto_1663231 ?auto_1663235 ) ) ( not ( = ?auto_1663231 ?auto_1663236 ) ) ( not ( = ?auto_1663231 ?auto_1663237 ) ) ( not ( = ?auto_1663231 ?auto_1663238 ) ) ( not ( = ?auto_1663231 ?auto_1663239 ) ) ( not ( = ?auto_1663231 ?auto_1663240 ) ) ( not ( = ?auto_1663231 ?auto_1663241 ) ) ( not ( = ?auto_1663231 ?auto_1663242 ) ) ( not ( = ?auto_1663231 ?auto_1663243 ) ) ( not ( = ?auto_1663231 ?auto_1663246 ) ) ( not ( = ?auto_1663233 ?auto_1663232 ) ) ( not ( = ?auto_1663233 ?auto_1663234 ) ) ( not ( = ?auto_1663233 ?auto_1663235 ) ) ( not ( = ?auto_1663233 ?auto_1663236 ) ) ( not ( = ?auto_1663233 ?auto_1663237 ) ) ( not ( = ?auto_1663233 ?auto_1663238 ) ) ( not ( = ?auto_1663233 ?auto_1663239 ) ) ( not ( = ?auto_1663233 ?auto_1663240 ) ) ( not ( = ?auto_1663233 ?auto_1663241 ) ) ( not ( = ?auto_1663233 ?auto_1663242 ) ) ( not ( = ?auto_1663233 ?auto_1663243 ) ) ( not ( = ?auto_1663233 ?auto_1663246 ) ) ( not ( = ?auto_1663232 ?auto_1663234 ) ) ( not ( = ?auto_1663232 ?auto_1663235 ) ) ( not ( = ?auto_1663232 ?auto_1663236 ) ) ( not ( = ?auto_1663232 ?auto_1663237 ) ) ( not ( = ?auto_1663232 ?auto_1663238 ) ) ( not ( = ?auto_1663232 ?auto_1663239 ) ) ( not ( = ?auto_1663232 ?auto_1663240 ) ) ( not ( = ?auto_1663232 ?auto_1663241 ) ) ( not ( = ?auto_1663232 ?auto_1663242 ) ) ( not ( = ?auto_1663232 ?auto_1663243 ) ) ( not ( = ?auto_1663232 ?auto_1663246 ) ) ( not ( = ?auto_1663234 ?auto_1663235 ) ) ( not ( = ?auto_1663234 ?auto_1663236 ) ) ( not ( = ?auto_1663234 ?auto_1663237 ) ) ( not ( = ?auto_1663234 ?auto_1663238 ) ) ( not ( = ?auto_1663234 ?auto_1663239 ) ) ( not ( = ?auto_1663234 ?auto_1663240 ) ) ( not ( = ?auto_1663234 ?auto_1663241 ) ) ( not ( = ?auto_1663234 ?auto_1663242 ) ) ( not ( = ?auto_1663234 ?auto_1663243 ) ) ( not ( = ?auto_1663234 ?auto_1663246 ) ) ( not ( = ?auto_1663235 ?auto_1663236 ) ) ( not ( = ?auto_1663235 ?auto_1663237 ) ) ( not ( = ?auto_1663235 ?auto_1663238 ) ) ( not ( = ?auto_1663235 ?auto_1663239 ) ) ( not ( = ?auto_1663235 ?auto_1663240 ) ) ( not ( = ?auto_1663235 ?auto_1663241 ) ) ( not ( = ?auto_1663235 ?auto_1663242 ) ) ( not ( = ?auto_1663235 ?auto_1663243 ) ) ( not ( = ?auto_1663235 ?auto_1663246 ) ) ( not ( = ?auto_1663236 ?auto_1663237 ) ) ( not ( = ?auto_1663236 ?auto_1663238 ) ) ( not ( = ?auto_1663236 ?auto_1663239 ) ) ( not ( = ?auto_1663236 ?auto_1663240 ) ) ( not ( = ?auto_1663236 ?auto_1663241 ) ) ( not ( = ?auto_1663236 ?auto_1663242 ) ) ( not ( = ?auto_1663236 ?auto_1663243 ) ) ( not ( = ?auto_1663236 ?auto_1663246 ) ) ( not ( = ?auto_1663237 ?auto_1663238 ) ) ( not ( = ?auto_1663237 ?auto_1663239 ) ) ( not ( = ?auto_1663237 ?auto_1663240 ) ) ( not ( = ?auto_1663237 ?auto_1663241 ) ) ( not ( = ?auto_1663237 ?auto_1663242 ) ) ( not ( = ?auto_1663237 ?auto_1663243 ) ) ( not ( = ?auto_1663237 ?auto_1663246 ) ) ( not ( = ?auto_1663238 ?auto_1663239 ) ) ( not ( = ?auto_1663238 ?auto_1663240 ) ) ( not ( = ?auto_1663238 ?auto_1663241 ) ) ( not ( = ?auto_1663238 ?auto_1663242 ) ) ( not ( = ?auto_1663238 ?auto_1663243 ) ) ( not ( = ?auto_1663238 ?auto_1663246 ) ) ( not ( = ?auto_1663239 ?auto_1663240 ) ) ( not ( = ?auto_1663239 ?auto_1663241 ) ) ( not ( = ?auto_1663239 ?auto_1663242 ) ) ( not ( = ?auto_1663239 ?auto_1663243 ) ) ( not ( = ?auto_1663239 ?auto_1663246 ) ) ( not ( = ?auto_1663240 ?auto_1663241 ) ) ( not ( = ?auto_1663240 ?auto_1663242 ) ) ( not ( = ?auto_1663240 ?auto_1663243 ) ) ( not ( = ?auto_1663240 ?auto_1663246 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1663241 ?auto_1663242 ?auto_1663243 )
      ( MAKE-14CRATE-VERIFY ?auto_1663229 ?auto_1663230 ?auto_1663231 ?auto_1663233 ?auto_1663232 ?auto_1663234 ?auto_1663235 ?auto_1663236 ?auto_1663237 ?auto_1663238 ?auto_1663239 ?auto_1663240 ?auto_1663241 ?auto_1663242 ?auto_1663243 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1680389 - SURFACE
      ?auto_1680390 - SURFACE
      ?auto_1680391 - SURFACE
      ?auto_1680393 - SURFACE
      ?auto_1680392 - SURFACE
      ?auto_1680394 - SURFACE
      ?auto_1680395 - SURFACE
      ?auto_1680396 - SURFACE
      ?auto_1680397 - SURFACE
      ?auto_1680398 - SURFACE
      ?auto_1680399 - SURFACE
      ?auto_1680400 - SURFACE
      ?auto_1680401 - SURFACE
      ?auto_1680402 - SURFACE
      ?auto_1680403 - SURFACE
      ?auto_1680404 - SURFACE
    )
    :vars
    (
      ?auto_1680405 - HOIST
      ?auto_1680406 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1680405 ?auto_1680406 ) ( SURFACE-AT ?auto_1680403 ?auto_1680406 ) ( CLEAR ?auto_1680403 ) ( LIFTING ?auto_1680405 ?auto_1680404 ) ( IS-CRATE ?auto_1680404 ) ( not ( = ?auto_1680403 ?auto_1680404 ) ) ( ON ?auto_1680390 ?auto_1680389 ) ( ON ?auto_1680391 ?auto_1680390 ) ( ON ?auto_1680393 ?auto_1680391 ) ( ON ?auto_1680392 ?auto_1680393 ) ( ON ?auto_1680394 ?auto_1680392 ) ( ON ?auto_1680395 ?auto_1680394 ) ( ON ?auto_1680396 ?auto_1680395 ) ( ON ?auto_1680397 ?auto_1680396 ) ( ON ?auto_1680398 ?auto_1680397 ) ( ON ?auto_1680399 ?auto_1680398 ) ( ON ?auto_1680400 ?auto_1680399 ) ( ON ?auto_1680401 ?auto_1680400 ) ( ON ?auto_1680402 ?auto_1680401 ) ( ON ?auto_1680403 ?auto_1680402 ) ( not ( = ?auto_1680389 ?auto_1680390 ) ) ( not ( = ?auto_1680389 ?auto_1680391 ) ) ( not ( = ?auto_1680389 ?auto_1680393 ) ) ( not ( = ?auto_1680389 ?auto_1680392 ) ) ( not ( = ?auto_1680389 ?auto_1680394 ) ) ( not ( = ?auto_1680389 ?auto_1680395 ) ) ( not ( = ?auto_1680389 ?auto_1680396 ) ) ( not ( = ?auto_1680389 ?auto_1680397 ) ) ( not ( = ?auto_1680389 ?auto_1680398 ) ) ( not ( = ?auto_1680389 ?auto_1680399 ) ) ( not ( = ?auto_1680389 ?auto_1680400 ) ) ( not ( = ?auto_1680389 ?auto_1680401 ) ) ( not ( = ?auto_1680389 ?auto_1680402 ) ) ( not ( = ?auto_1680389 ?auto_1680403 ) ) ( not ( = ?auto_1680389 ?auto_1680404 ) ) ( not ( = ?auto_1680390 ?auto_1680391 ) ) ( not ( = ?auto_1680390 ?auto_1680393 ) ) ( not ( = ?auto_1680390 ?auto_1680392 ) ) ( not ( = ?auto_1680390 ?auto_1680394 ) ) ( not ( = ?auto_1680390 ?auto_1680395 ) ) ( not ( = ?auto_1680390 ?auto_1680396 ) ) ( not ( = ?auto_1680390 ?auto_1680397 ) ) ( not ( = ?auto_1680390 ?auto_1680398 ) ) ( not ( = ?auto_1680390 ?auto_1680399 ) ) ( not ( = ?auto_1680390 ?auto_1680400 ) ) ( not ( = ?auto_1680390 ?auto_1680401 ) ) ( not ( = ?auto_1680390 ?auto_1680402 ) ) ( not ( = ?auto_1680390 ?auto_1680403 ) ) ( not ( = ?auto_1680390 ?auto_1680404 ) ) ( not ( = ?auto_1680391 ?auto_1680393 ) ) ( not ( = ?auto_1680391 ?auto_1680392 ) ) ( not ( = ?auto_1680391 ?auto_1680394 ) ) ( not ( = ?auto_1680391 ?auto_1680395 ) ) ( not ( = ?auto_1680391 ?auto_1680396 ) ) ( not ( = ?auto_1680391 ?auto_1680397 ) ) ( not ( = ?auto_1680391 ?auto_1680398 ) ) ( not ( = ?auto_1680391 ?auto_1680399 ) ) ( not ( = ?auto_1680391 ?auto_1680400 ) ) ( not ( = ?auto_1680391 ?auto_1680401 ) ) ( not ( = ?auto_1680391 ?auto_1680402 ) ) ( not ( = ?auto_1680391 ?auto_1680403 ) ) ( not ( = ?auto_1680391 ?auto_1680404 ) ) ( not ( = ?auto_1680393 ?auto_1680392 ) ) ( not ( = ?auto_1680393 ?auto_1680394 ) ) ( not ( = ?auto_1680393 ?auto_1680395 ) ) ( not ( = ?auto_1680393 ?auto_1680396 ) ) ( not ( = ?auto_1680393 ?auto_1680397 ) ) ( not ( = ?auto_1680393 ?auto_1680398 ) ) ( not ( = ?auto_1680393 ?auto_1680399 ) ) ( not ( = ?auto_1680393 ?auto_1680400 ) ) ( not ( = ?auto_1680393 ?auto_1680401 ) ) ( not ( = ?auto_1680393 ?auto_1680402 ) ) ( not ( = ?auto_1680393 ?auto_1680403 ) ) ( not ( = ?auto_1680393 ?auto_1680404 ) ) ( not ( = ?auto_1680392 ?auto_1680394 ) ) ( not ( = ?auto_1680392 ?auto_1680395 ) ) ( not ( = ?auto_1680392 ?auto_1680396 ) ) ( not ( = ?auto_1680392 ?auto_1680397 ) ) ( not ( = ?auto_1680392 ?auto_1680398 ) ) ( not ( = ?auto_1680392 ?auto_1680399 ) ) ( not ( = ?auto_1680392 ?auto_1680400 ) ) ( not ( = ?auto_1680392 ?auto_1680401 ) ) ( not ( = ?auto_1680392 ?auto_1680402 ) ) ( not ( = ?auto_1680392 ?auto_1680403 ) ) ( not ( = ?auto_1680392 ?auto_1680404 ) ) ( not ( = ?auto_1680394 ?auto_1680395 ) ) ( not ( = ?auto_1680394 ?auto_1680396 ) ) ( not ( = ?auto_1680394 ?auto_1680397 ) ) ( not ( = ?auto_1680394 ?auto_1680398 ) ) ( not ( = ?auto_1680394 ?auto_1680399 ) ) ( not ( = ?auto_1680394 ?auto_1680400 ) ) ( not ( = ?auto_1680394 ?auto_1680401 ) ) ( not ( = ?auto_1680394 ?auto_1680402 ) ) ( not ( = ?auto_1680394 ?auto_1680403 ) ) ( not ( = ?auto_1680394 ?auto_1680404 ) ) ( not ( = ?auto_1680395 ?auto_1680396 ) ) ( not ( = ?auto_1680395 ?auto_1680397 ) ) ( not ( = ?auto_1680395 ?auto_1680398 ) ) ( not ( = ?auto_1680395 ?auto_1680399 ) ) ( not ( = ?auto_1680395 ?auto_1680400 ) ) ( not ( = ?auto_1680395 ?auto_1680401 ) ) ( not ( = ?auto_1680395 ?auto_1680402 ) ) ( not ( = ?auto_1680395 ?auto_1680403 ) ) ( not ( = ?auto_1680395 ?auto_1680404 ) ) ( not ( = ?auto_1680396 ?auto_1680397 ) ) ( not ( = ?auto_1680396 ?auto_1680398 ) ) ( not ( = ?auto_1680396 ?auto_1680399 ) ) ( not ( = ?auto_1680396 ?auto_1680400 ) ) ( not ( = ?auto_1680396 ?auto_1680401 ) ) ( not ( = ?auto_1680396 ?auto_1680402 ) ) ( not ( = ?auto_1680396 ?auto_1680403 ) ) ( not ( = ?auto_1680396 ?auto_1680404 ) ) ( not ( = ?auto_1680397 ?auto_1680398 ) ) ( not ( = ?auto_1680397 ?auto_1680399 ) ) ( not ( = ?auto_1680397 ?auto_1680400 ) ) ( not ( = ?auto_1680397 ?auto_1680401 ) ) ( not ( = ?auto_1680397 ?auto_1680402 ) ) ( not ( = ?auto_1680397 ?auto_1680403 ) ) ( not ( = ?auto_1680397 ?auto_1680404 ) ) ( not ( = ?auto_1680398 ?auto_1680399 ) ) ( not ( = ?auto_1680398 ?auto_1680400 ) ) ( not ( = ?auto_1680398 ?auto_1680401 ) ) ( not ( = ?auto_1680398 ?auto_1680402 ) ) ( not ( = ?auto_1680398 ?auto_1680403 ) ) ( not ( = ?auto_1680398 ?auto_1680404 ) ) ( not ( = ?auto_1680399 ?auto_1680400 ) ) ( not ( = ?auto_1680399 ?auto_1680401 ) ) ( not ( = ?auto_1680399 ?auto_1680402 ) ) ( not ( = ?auto_1680399 ?auto_1680403 ) ) ( not ( = ?auto_1680399 ?auto_1680404 ) ) ( not ( = ?auto_1680400 ?auto_1680401 ) ) ( not ( = ?auto_1680400 ?auto_1680402 ) ) ( not ( = ?auto_1680400 ?auto_1680403 ) ) ( not ( = ?auto_1680400 ?auto_1680404 ) ) ( not ( = ?auto_1680401 ?auto_1680402 ) ) ( not ( = ?auto_1680401 ?auto_1680403 ) ) ( not ( = ?auto_1680401 ?auto_1680404 ) ) ( not ( = ?auto_1680402 ?auto_1680403 ) ) ( not ( = ?auto_1680402 ?auto_1680404 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1680403 ?auto_1680404 )
      ( MAKE-15CRATE-VERIFY ?auto_1680389 ?auto_1680390 ?auto_1680391 ?auto_1680393 ?auto_1680392 ?auto_1680394 ?auto_1680395 ?auto_1680396 ?auto_1680397 ?auto_1680398 ?auto_1680399 ?auto_1680400 ?auto_1680401 ?auto_1680402 ?auto_1680403 ?auto_1680404 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1680568 - SURFACE
      ?auto_1680569 - SURFACE
      ?auto_1680570 - SURFACE
      ?auto_1680572 - SURFACE
      ?auto_1680571 - SURFACE
      ?auto_1680573 - SURFACE
      ?auto_1680574 - SURFACE
      ?auto_1680575 - SURFACE
      ?auto_1680576 - SURFACE
      ?auto_1680577 - SURFACE
      ?auto_1680578 - SURFACE
      ?auto_1680579 - SURFACE
      ?auto_1680580 - SURFACE
      ?auto_1680581 - SURFACE
      ?auto_1680582 - SURFACE
      ?auto_1680583 - SURFACE
    )
    :vars
    (
      ?auto_1680584 - HOIST
      ?auto_1680585 - PLACE
      ?auto_1680586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1680584 ?auto_1680585 ) ( SURFACE-AT ?auto_1680582 ?auto_1680585 ) ( CLEAR ?auto_1680582 ) ( IS-CRATE ?auto_1680583 ) ( not ( = ?auto_1680582 ?auto_1680583 ) ) ( TRUCK-AT ?auto_1680586 ?auto_1680585 ) ( AVAILABLE ?auto_1680584 ) ( IN ?auto_1680583 ?auto_1680586 ) ( ON ?auto_1680582 ?auto_1680581 ) ( not ( = ?auto_1680581 ?auto_1680582 ) ) ( not ( = ?auto_1680581 ?auto_1680583 ) ) ( ON ?auto_1680569 ?auto_1680568 ) ( ON ?auto_1680570 ?auto_1680569 ) ( ON ?auto_1680572 ?auto_1680570 ) ( ON ?auto_1680571 ?auto_1680572 ) ( ON ?auto_1680573 ?auto_1680571 ) ( ON ?auto_1680574 ?auto_1680573 ) ( ON ?auto_1680575 ?auto_1680574 ) ( ON ?auto_1680576 ?auto_1680575 ) ( ON ?auto_1680577 ?auto_1680576 ) ( ON ?auto_1680578 ?auto_1680577 ) ( ON ?auto_1680579 ?auto_1680578 ) ( ON ?auto_1680580 ?auto_1680579 ) ( ON ?auto_1680581 ?auto_1680580 ) ( not ( = ?auto_1680568 ?auto_1680569 ) ) ( not ( = ?auto_1680568 ?auto_1680570 ) ) ( not ( = ?auto_1680568 ?auto_1680572 ) ) ( not ( = ?auto_1680568 ?auto_1680571 ) ) ( not ( = ?auto_1680568 ?auto_1680573 ) ) ( not ( = ?auto_1680568 ?auto_1680574 ) ) ( not ( = ?auto_1680568 ?auto_1680575 ) ) ( not ( = ?auto_1680568 ?auto_1680576 ) ) ( not ( = ?auto_1680568 ?auto_1680577 ) ) ( not ( = ?auto_1680568 ?auto_1680578 ) ) ( not ( = ?auto_1680568 ?auto_1680579 ) ) ( not ( = ?auto_1680568 ?auto_1680580 ) ) ( not ( = ?auto_1680568 ?auto_1680581 ) ) ( not ( = ?auto_1680568 ?auto_1680582 ) ) ( not ( = ?auto_1680568 ?auto_1680583 ) ) ( not ( = ?auto_1680569 ?auto_1680570 ) ) ( not ( = ?auto_1680569 ?auto_1680572 ) ) ( not ( = ?auto_1680569 ?auto_1680571 ) ) ( not ( = ?auto_1680569 ?auto_1680573 ) ) ( not ( = ?auto_1680569 ?auto_1680574 ) ) ( not ( = ?auto_1680569 ?auto_1680575 ) ) ( not ( = ?auto_1680569 ?auto_1680576 ) ) ( not ( = ?auto_1680569 ?auto_1680577 ) ) ( not ( = ?auto_1680569 ?auto_1680578 ) ) ( not ( = ?auto_1680569 ?auto_1680579 ) ) ( not ( = ?auto_1680569 ?auto_1680580 ) ) ( not ( = ?auto_1680569 ?auto_1680581 ) ) ( not ( = ?auto_1680569 ?auto_1680582 ) ) ( not ( = ?auto_1680569 ?auto_1680583 ) ) ( not ( = ?auto_1680570 ?auto_1680572 ) ) ( not ( = ?auto_1680570 ?auto_1680571 ) ) ( not ( = ?auto_1680570 ?auto_1680573 ) ) ( not ( = ?auto_1680570 ?auto_1680574 ) ) ( not ( = ?auto_1680570 ?auto_1680575 ) ) ( not ( = ?auto_1680570 ?auto_1680576 ) ) ( not ( = ?auto_1680570 ?auto_1680577 ) ) ( not ( = ?auto_1680570 ?auto_1680578 ) ) ( not ( = ?auto_1680570 ?auto_1680579 ) ) ( not ( = ?auto_1680570 ?auto_1680580 ) ) ( not ( = ?auto_1680570 ?auto_1680581 ) ) ( not ( = ?auto_1680570 ?auto_1680582 ) ) ( not ( = ?auto_1680570 ?auto_1680583 ) ) ( not ( = ?auto_1680572 ?auto_1680571 ) ) ( not ( = ?auto_1680572 ?auto_1680573 ) ) ( not ( = ?auto_1680572 ?auto_1680574 ) ) ( not ( = ?auto_1680572 ?auto_1680575 ) ) ( not ( = ?auto_1680572 ?auto_1680576 ) ) ( not ( = ?auto_1680572 ?auto_1680577 ) ) ( not ( = ?auto_1680572 ?auto_1680578 ) ) ( not ( = ?auto_1680572 ?auto_1680579 ) ) ( not ( = ?auto_1680572 ?auto_1680580 ) ) ( not ( = ?auto_1680572 ?auto_1680581 ) ) ( not ( = ?auto_1680572 ?auto_1680582 ) ) ( not ( = ?auto_1680572 ?auto_1680583 ) ) ( not ( = ?auto_1680571 ?auto_1680573 ) ) ( not ( = ?auto_1680571 ?auto_1680574 ) ) ( not ( = ?auto_1680571 ?auto_1680575 ) ) ( not ( = ?auto_1680571 ?auto_1680576 ) ) ( not ( = ?auto_1680571 ?auto_1680577 ) ) ( not ( = ?auto_1680571 ?auto_1680578 ) ) ( not ( = ?auto_1680571 ?auto_1680579 ) ) ( not ( = ?auto_1680571 ?auto_1680580 ) ) ( not ( = ?auto_1680571 ?auto_1680581 ) ) ( not ( = ?auto_1680571 ?auto_1680582 ) ) ( not ( = ?auto_1680571 ?auto_1680583 ) ) ( not ( = ?auto_1680573 ?auto_1680574 ) ) ( not ( = ?auto_1680573 ?auto_1680575 ) ) ( not ( = ?auto_1680573 ?auto_1680576 ) ) ( not ( = ?auto_1680573 ?auto_1680577 ) ) ( not ( = ?auto_1680573 ?auto_1680578 ) ) ( not ( = ?auto_1680573 ?auto_1680579 ) ) ( not ( = ?auto_1680573 ?auto_1680580 ) ) ( not ( = ?auto_1680573 ?auto_1680581 ) ) ( not ( = ?auto_1680573 ?auto_1680582 ) ) ( not ( = ?auto_1680573 ?auto_1680583 ) ) ( not ( = ?auto_1680574 ?auto_1680575 ) ) ( not ( = ?auto_1680574 ?auto_1680576 ) ) ( not ( = ?auto_1680574 ?auto_1680577 ) ) ( not ( = ?auto_1680574 ?auto_1680578 ) ) ( not ( = ?auto_1680574 ?auto_1680579 ) ) ( not ( = ?auto_1680574 ?auto_1680580 ) ) ( not ( = ?auto_1680574 ?auto_1680581 ) ) ( not ( = ?auto_1680574 ?auto_1680582 ) ) ( not ( = ?auto_1680574 ?auto_1680583 ) ) ( not ( = ?auto_1680575 ?auto_1680576 ) ) ( not ( = ?auto_1680575 ?auto_1680577 ) ) ( not ( = ?auto_1680575 ?auto_1680578 ) ) ( not ( = ?auto_1680575 ?auto_1680579 ) ) ( not ( = ?auto_1680575 ?auto_1680580 ) ) ( not ( = ?auto_1680575 ?auto_1680581 ) ) ( not ( = ?auto_1680575 ?auto_1680582 ) ) ( not ( = ?auto_1680575 ?auto_1680583 ) ) ( not ( = ?auto_1680576 ?auto_1680577 ) ) ( not ( = ?auto_1680576 ?auto_1680578 ) ) ( not ( = ?auto_1680576 ?auto_1680579 ) ) ( not ( = ?auto_1680576 ?auto_1680580 ) ) ( not ( = ?auto_1680576 ?auto_1680581 ) ) ( not ( = ?auto_1680576 ?auto_1680582 ) ) ( not ( = ?auto_1680576 ?auto_1680583 ) ) ( not ( = ?auto_1680577 ?auto_1680578 ) ) ( not ( = ?auto_1680577 ?auto_1680579 ) ) ( not ( = ?auto_1680577 ?auto_1680580 ) ) ( not ( = ?auto_1680577 ?auto_1680581 ) ) ( not ( = ?auto_1680577 ?auto_1680582 ) ) ( not ( = ?auto_1680577 ?auto_1680583 ) ) ( not ( = ?auto_1680578 ?auto_1680579 ) ) ( not ( = ?auto_1680578 ?auto_1680580 ) ) ( not ( = ?auto_1680578 ?auto_1680581 ) ) ( not ( = ?auto_1680578 ?auto_1680582 ) ) ( not ( = ?auto_1680578 ?auto_1680583 ) ) ( not ( = ?auto_1680579 ?auto_1680580 ) ) ( not ( = ?auto_1680579 ?auto_1680581 ) ) ( not ( = ?auto_1680579 ?auto_1680582 ) ) ( not ( = ?auto_1680579 ?auto_1680583 ) ) ( not ( = ?auto_1680580 ?auto_1680581 ) ) ( not ( = ?auto_1680580 ?auto_1680582 ) ) ( not ( = ?auto_1680580 ?auto_1680583 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1680581 ?auto_1680582 ?auto_1680583 )
      ( MAKE-15CRATE-VERIFY ?auto_1680568 ?auto_1680569 ?auto_1680570 ?auto_1680572 ?auto_1680571 ?auto_1680573 ?auto_1680574 ?auto_1680575 ?auto_1680576 ?auto_1680577 ?auto_1680578 ?auto_1680579 ?auto_1680580 ?auto_1680581 ?auto_1680582 ?auto_1680583 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1680763 - SURFACE
      ?auto_1680764 - SURFACE
      ?auto_1680765 - SURFACE
      ?auto_1680767 - SURFACE
      ?auto_1680766 - SURFACE
      ?auto_1680768 - SURFACE
      ?auto_1680769 - SURFACE
      ?auto_1680770 - SURFACE
      ?auto_1680771 - SURFACE
      ?auto_1680772 - SURFACE
      ?auto_1680773 - SURFACE
      ?auto_1680774 - SURFACE
      ?auto_1680775 - SURFACE
      ?auto_1680776 - SURFACE
      ?auto_1680777 - SURFACE
      ?auto_1680778 - SURFACE
    )
    :vars
    (
      ?auto_1680781 - HOIST
      ?auto_1680782 - PLACE
      ?auto_1680780 - TRUCK
      ?auto_1680779 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1680781 ?auto_1680782 ) ( SURFACE-AT ?auto_1680777 ?auto_1680782 ) ( CLEAR ?auto_1680777 ) ( IS-CRATE ?auto_1680778 ) ( not ( = ?auto_1680777 ?auto_1680778 ) ) ( AVAILABLE ?auto_1680781 ) ( IN ?auto_1680778 ?auto_1680780 ) ( ON ?auto_1680777 ?auto_1680776 ) ( not ( = ?auto_1680776 ?auto_1680777 ) ) ( not ( = ?auto_1680776 ?auto_1680778 ) ) ( TRUCK-AT ?auto_1680780 ?auto_1680779 ) ( not ( = ?auto_1680779 ?auto_1680782 ) ) ( ON ?auto_1680764 ?auto_1680763 ) ( ON ?auto_1680765 ?auto_1680764 ) ( ON ?auto_1680767 ?auto_1680765 ) ( ON ?auto_1680766 ?auto_1680767 ) ( ON ?auto_1680768 ?auto_1680766 ) ( ON ?auto_1680769 ?auto_1680768 ) ( ON ?auto_1680770 ?auto_1680769 ) ( ON ?auto_1680771 ?auto_1680770 ) ( ON ?auto_1680772 ?auto_1680771 ) ( ON ?auto_1680773 ?auto_1680772 ) ( ON ?auto_1680774 ?auto_1680773 ) ( ON ?auto_1680775 ?auto_1680774 ) ( ON ?auto_1680776 ?auto_1680775 ) ( not ( = ?auto_1680763 ?auto_1680764 ) ) ( not ( = ?auto_1680763 ?auto_1680765 ) ) ( not ( = ?auto_1680763 ?auto_1680767 ) ) ( not ( = ?auto_1680763 ?auto_1680766 ) ) ( not ( = ?auto_1680763 ?auto_1680768 ) ) ( not ( = ?auto_1680763 ?auto_1680769 ) ) ( not ( = ?auto_1680763 ?auto_1680770 ) ) ( not ( = ?auto_1680763 ?auto_1680771 ) ) ( not ( = ?auto_1680763 ?auto_1680772 ) ) ( not ( = ?auto_1680763 ?auto_1680773 ) ) ( not ( = ?auto_1680763 ?auto_1680774 ) ) ( not ( = ?auto_1680763 ?auto_1680775 ) ) ( not ( = ?auto_1680763 ?auto_1680776 ) ) ( not ( = ?auto_1680763 ?auto_1680777 ) ) ( not ( = ?auto_1680763 ?auto_1680778 ) ) ( not ( = ?auto_1680764 ?auto_1680765 ) ) ( not ( = ?auto_1680764 ?auto_1680767 ) ) ( not ( = ?auto_1680764 ?auto_1680766 ) ) ( not ( = ?auto_1680764 ?auto_1680768 ) ) ( not ( = ?auto_1680764 ?auto_1680769 ) ) ( not ( = ?auto_1680764 ?auto_1680770 ) ) ( not ( = ?auto_1680764 ?auto_1680771 ) ) ( not ( = ?auto_1680764 ?auto_1680772 ) ) ( not ( = ?auto_1680764 ?auto_1680773 ) ) ( not ( = ?auto_1680764 ?auto_1680774 ) ) ( not ( = ?auto_1680764 ?auto_1680775 ) ) ( not ( = ?auto_1680764 ?auto_1680776 ) ) ( not ( = ?auto_1680764 ?auto_1680777 ) ) ( not ( = ?auto_1680764 ?auto_1680778 ) ) ( not ( = ?auto_1680765 ?auto_1680767 ) ) ( not ( = ?auto_1680765 ?auto_1680766 ) ) ( not ( = ?auto_1680765 ?auto_1680768 ) ) ( not ( = ?auto_1680765 ?auto_1680769 ) ) ( not ( = ?auto_1680765 ?auto_1680770 ) ) ( not ( = ?auto_1680765 ?auto_1680771 ) ) ( not ( = ?auto_1680765 ?auto_1680772 ) ) ( not ( = ?auto_1680765 ?auto_1680773 ) ) ( not ( = ?auto_1680765 ?auto_1680774 ) ) ( not ( = ?auto_1680765 ?auto_1680775 ) ) ( not ( = ?auto_1680765 ?auto_1680776 ) ) ( not ( = ?auto_1680765 ?auto_1680777 ) ) ( not ( = ?auto_1680765 ?auto_1680778 ) ) ( not ( = ?auto_1680767 ?auto_1680766 ) ) ( not ( = ?auto_1680767 ?auto_1680768 ) ) ( not ( = ?auto_1680767 ?auto_1680769 ) ) ( not ( = ?auto_1680767 ?auto_1680770 ) ) ( not ( = ?auto_1680767 ?auto_1680771 ) ) ( not ( = ?auto_1680767 ?auto_1680772 ) ) ( not ( = ?auto_1680767 ?auto_1680773 ) ) ( not ( = ?auto_1680767 ?auto_1680774 ) ) ( not ( = ?auto_1680767 ?auto_1680775 ) ) ( not ( = ?auto_1680767 ?auto_1680776 ) ) ( not ( = ?auto_1680767 ?auto_1680777 ) ) ( not ( = ?auto_1680767 ?auto_1680778 ) ) ( not ( = ?auto_1680766 ?auto_1680768 ) ) ( not ( = ?auto_1680766 ?auto_1680769 ) ) ( not ( = ?auto_1680766 ?auto_1680770 ) ) ( not ( = ?auto_1680766 ?auto_1680771 ) ) ( not ( = ?auto_1680766 ?auto_1680772 ) ) ( not ( = ?auto_1680766 ?auto_1680773 ) ) ( not ( = ?auto_1680766 ?auto_1680774 ) ) ( not ( = ?auto_1680766 ?auto_1680775 ) ) ( not ( = ?auto_1680766 ?auto_1680776 ) ) ( not ( = ?auto_1680766 ?auto_1680777 ) ) ( not ( = ?auto_1680766 ?auto_1680778 ) ) ( not ( = ?auto_1680768 ?auto_1680769 ) ) ( not ( = ?auto_1680768 ?auto_1680770 ) ) ( not ( = ?auto_1680768 ?auto_1680771 ) ) ( not ( = ?auto_1680768 ?auto_1680772 ) ) ( not ( = ?auto_1680768 ?auto_1680773 ) ) ( not ( = ?auto_1680768 ?auto_1680774 ) ) ( not ( = ?auto_1680768 ?auto_1680775 ) ) ( not ( = ?auto_1680768 ?auto_1680776 ) ) ( not ( = ?auto_1680768 ?auto_1680777 ) ) ( not ( = ?auto_1680768 ?auto_1680778 ) ) ( not ( = ?auto_1680769 ?auto_1680770 ) ) ( not ( = ?auto_1680769 ?auto_1680771 ) ) ( not ( = ?auto_1680769 ?auto_1680772 ) ) ( not ( = ?auto_1680769 ?auto_1680773 ) ) ( not ( = ?auto_1680769 ?auto_1680774 ) ) ( not ( = ?auto_1680769 ?auto_1680775 ) ) ( not ( = ?auto_1680769 ?auto_1680776 ) ) ( not ( = ?auto_1680769 ?auto_1680777 ) ) ( not ( = ?auto_1680769 ?auto_1680778 ) ) ( not ( = ?auto_1680770 ?auto_1680771 ) ) ( not ( = ?auto_1680770 ?auto_1680772 ) ) ( not ( = ?auto_1680770 ?auto_1680773 ) ) ( not ( = ?auto_1680770 ?auto_1680774 ) ) ( not ( = ?auto_1680770 ?auto_1680775 ) ) ( not ( = ?auto_1680770 ?auto_1680776 ) ) ( not ( = ?auto_1680770 ?auto_1680777 ) ) ( not ( = ?auto_1680770 ?auto_1680778 ) ) ( not ( = ?auto_1680771 ?auto_1680772 ) ) ( not ( = ?auto_1680771 ?auto_1680773 ) ) ( not ( = ?auto_1680771 ?auto_1680774 ) ) ( not ( = ?auto_1680771 ?auto_1680775 ) ) ( not ( = ?auto_1680771 ?auto_1680776 ) ) ( not ( = ?auto_1680771 ?auto_1680777 ) ) ( not ( = ?auto_1680771 ?auto_1680778 ) ) ( not ( = ?auto_1680772 ?auto_1680773 ) ) ( not ( = ?auto_1680772 ?auto_1680774 ) ) ( not ( = ?auto_1680772 ?auto_1680775 ) ) ( not ( = ?auto_1680772 ?auto_1680776 ) ) ( not ( = ?auto_1680772 ?auto_1680777 ) ) ( not ( = ?auto_1680772 ?auto_1680778 ) ) ( not ( = ?auto_1680773 ?auto_1680774 ) ) ( not ( = ?auto_1680773 ?auto_1680775 ) ) ( not ( = ?auto_1680773 ?auto_1680776 ) ) ( not ( = ?auto_1680773 ?auto_1680777 ) ) ( not ( = ?auto_1680773 ?auto_1680778 ) ) ( not ( = ?auto_1680774 ?auto_1680775 ) ) ( not ( = ?auto_1680774 ?auto_1680776 ) ) ( not ( = ?auto_1680774 ?auto_1680777 ) ) ( not ( = ?auto_1680774 ?auto_1680778 ) ) ( not ( = ?auto_1680775 ?auto_1680776 ) ) ( not ( = ?auto_1680775 ?auto_1680777 ) ) ( not ( = ?auto_1680775 ?auto_1680778 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1680776 ?auto_1680777 ?auto_1680778 )
      ( MAKE-15CRATE-VERIFY ?auto_1680763 ?auto_1680764 ?auto_1680765 ?auto_1680767 ?auto_1680766 ?auto_1680768 ?auto_1680769 ?auto_1680770 ?auto_1680771 ?auto_1680772 ?auto_1680773 ?auto_1680774 ?auto_1680775 ?auto_1680776 ?auto_1680777 ?auto_1680778 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1680973 - SURFACE
      ?auto_1680974 - SURFACE
      ?auto_1680975 - SURFACE
      ?auto_1680977 - SURFACE
      ?auto_1680976 - SURFACE
      ?auto_1680978 - SURFACE
      ?auto_1680979 - SURFACE
      ?auto_1680980 - SURFACE
      ?auto_1680981 - SURFACE
      ?auto_1680982 - SURFACE
      ?auto_1680983 - SURFACE
      ?auto_1680984 - SURFACE
      ?auto_1680985 - SURFACE
      ?auto_1680986 - SURFACE
      ?auto_1680987 - SURFACE
      ?auto_1680988 - SURFACE
    )
    :vars
    (
      ?auto_1680989 - HOIST
      ?auto_1680993 - PLACE
      ?auto_1680991 - TRUCK
      ?auto_1680992 - PLACE
      ?auto_1680990 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1680989 ?auto_1680993 ) ( SURFACE-AT ?auto_1680987 ?auto_1680993 ) ( CLEAR ?auto_1680987 ) ( IS-CRATE ?auto_1680988 ) ( not ( = ?auto_1680987 ?auto_1680988 ) ) ( AVAILABLE ?auto_1680989 ) ( ON ?auto_1680987 ?auto_1680986 ) ( not ( = ?auto_1680986 ?auto_1680987 ) ) ( not ( = ?auto_1680986 ?auto_1680988 ) ) ( TRUCK-AT ?auto_1680991 ?auto_1680992 ) ( not ( = ?auto_1680992 ?auto_1680993 ) ) ( HOIST-AT ?auto_1680990 ?auto_1680992 ) ( LIFTING ?auto_1680990 ?auto_1680988 ) ( not ( = ?auto_1680989 ?auto_1680990 ) ) ( ON ?auto_1680974 ?auto_1680973 ) ( ON ?auto_1680975 ?auto_1680974 ) ( ON ?auto_1680977 ?auto_1680975 ) ( ON ?auto_1680976 ?auto_1680977 ) ( ON ?auto_1680978 ?auto_1680976 ) ( ON ?auto_1680979 ?auto_1680978 ) ( ON ?auto_1680980 ?auto_1680979 ) ( ON ?auto_1680981 ?auto_1680980 ) ( ON ?auto_1680982 ?auto_1680981 ) ( ON ?auto_1680983 ?auto_1680982 ) ( ON ?auto_1680984 ?auto_1680983 ) ( ON ?auto_1680985 ?auto_1680984 ) ( ON ?auto_1680986 ?auto_1680985 ) ( not ( = ?auto_1680973 ?auto_1680974 ) ) ( not ( = ?auto_1680973 ?auto_1680975 ) ) ( not ( = ?auto_1680973 ?auto_1680977 ) ) ( not ( = ?auto_1680973 ?auto_1680976 ) ) ( not ( = ?auto_1680973 ?auto_1680978 ) ) ( not ( = ?auto_1680973 ?auto_1680979 ) ) ( not ( = ?auto_1680973 ?auto_1680980 ) ) ( not ( = ?auto_1680973 ?auto_1680981 ) ) ( not ( = ?auto_1680973 ?auto_1680982 ) ) ( not ( = ?auto_1680973 ?auto_1680983 ) ) ( not ( = ?auto_1680973 ?auto_1680984 ) ) ( not ( = ?auto_1680973 ?auto_1680985 ) ) ( not ( = ?auto_1680973 ?auto_1680986 ) ) ( not ( = ?auto_1680973 ?auto_1680987 ) ) ( not ( = ?auto_1680973 ?auto_1680988 ) ) ( not ( = ?auto_1680974 ?auto_1680975 ) ) ( not ( = ?auto_1680974 ?auto_1680977 ) ) ( not ( = ?auto_1680974 ?auto_1680976 ) ) ( not ( = ?auto_1680974 ?auto_1680978 ) ) ( not ( = ?auto_1680974 ?auto_1680979 ) ) ( not ( = ?auto_1680974 ?auto_1680980 ) ) ( not ( = ?auto_1680974 ?auto_1680981 ) ) ( not ( = ?auto_1680974 ?auto_1680982 ) ) ( not ( = ?auto_1680974 ?auto_1680983 ) ) ( not ( = ?auto_1680974 ?auto_1680984 ) ) ( not ( = ?auto_1680974 ?auto_1680985 ) ) ( not ( = ?auto_1680974 ?auto_1680986 ) ) ( not ( = ?auto_1680974 ?auto_1680987 ) ) ( not ( = ?auto_1680974 ?auto_1680988 ) ) ( not ( = ?auto_1680975 ?auto_1680977 ) ) ( not ( = ?auto_1680975 ?auto_1680976 ) ) ( not ( = ?auto_1680975 ?auto_1680978 ) ) ( not ( = ?auto_1680975 ?auto_1680979 ) ) ( not ( = ?auto_1680975 ?auto_1680980 ) ) ( not ( = ?auto_1680975 ?auto_1680981 ) ) ( not ( = ?auto_1680975 ?auto_1680982 ) ) ( not ( = ?auto_1680975 ?auto_1680983 ) ) ( not ( = ?auto_1680975 ?auto_1680984 ) ) ( not ( = ?auto_1680975 ?auto_1680985 ) ) ( not ( = ?auto_1680975 ?auto_1680986 ) ) ( not ( = ?auto_1680975 ?auto_1680987 ) ) ( not ( = ?auto_1680975 ?auto_1680988 ) ) ( not ( = ?auto_1680977 ?auto_1680976 ) ) ( not ( = ?auto_1680977 ?auto_1680978 ) ) ( not ( = ?auto_1680977 ?auto_1680979 ) ) ( not ( = ?auto_1680977 ?auto_1680980 ) ) ( not ( = ?auto_1680977 ?auto_1680981 ) ) ( not ( = ?auto_1680977 ?auto_1680982 ) ) ( not ( = ?auto_1680977 ?auto_1680983 ) ) ( not ( = ?auto_1680977 ?auto_1680984 ) ) ( not ( = ?auto_1680977 ?auto_1680985 ) ) ( not ( = ?auto_1680977 ?auto_1680986 ) ) ( not ( = ?auto_1680977 ?auto_1680987 ) ) ( not ( = ?auto_1680977 ?auto_1680988 ) ) ( not ( = ?auto_1680976 ?auto_1680978 ) ) ( not ( = ?auto_1680976 ?auto_1680979 ) ) ( not ( = ?auto_1680976 ?auto_1680980 ) ) ( not ( = ?auto_1680976 ?auto_1680981 ) ) ( not ( = ?auto_1680976 ?auto_1680982 ) ) ( not ( = ?auto_1680976 ?auto_1680983 ) ) ( not ( = ?auto_1680976 ?auto_1680984 ) ) ( not ( = ?auto_1680976 ?auto_1680985 ) ) ( not ( = ?auto_1680976 ?auto_1680986 ) ) ( not ( = ?auto_1680976 ?auto_1680987 ) ) ( not ( = ?auto_1680976 ?auto_1680988 ) ) ( not ( = ?auto_1680978 ?auto_1680979 ) ) ( not ( = ?auto_1680978 ?auto_1680980 ) ) ( not ( = ?auto_1680978 ?auto_1680981 ) ) ( not ( = ?auto_1680978 ?auto_1680982 ) ) ( not ( = ?auto_1680978 ?auto_1680983 ) ) ( not ( = ?auto_1680978 ?auto_1680984 ) ) ( not ( = ?auto_1680978 ?auto_1680985 ) ) ( not ( = ?auto_1680978 ?auto_1680986 ) ) ( not ( = ?auto_1680978 ?auto_1680987 ) ) ( not ( = ?auto_1680978 ?auto_1680988 ) ) ( not ( = ?auto_1680979 ?auto_1680980 ) ) ( not ( = ?auto_1680979 ?auto_1680981 ) ) ( not ( = ?auto_1680979 ?auto_1680982 ) ) ( not ( = ?auto_1680979 ?auto_1680983 ) ) ( not ( = ?auto_1680979 ?auto_1680984 ) ) ( not ( = ?auto_1680979 ?auto_1680985 ) ) ( not ( = ?auto_1680979 ?auto_1680986 ) ) ( not ( = ?auto_1680979 ?auto_1680987 ) ) ( not ( = ?auto_1680979 ?auto_1680988 ) ) ( not ( = ?auto_1680980 ?auto_1680981 ) ) ( not ( = ?auto_1680980 ?auto_1680982 ) ) ( not ( = ?auto_1680980 ?auto_1680983 ) ) ( not ( = ?auto_1680980 ?auto_1680984 ) ) ( not ( = ?auto_1680980 ?auto_1680985 ) ) ( not ( = ?auto_1680980 ?auto_1680986 ) ) ( not ( = ?auto_1680980 ?auto_1680987 ) ) ( not ( = ?auto_1680980 ?auto_1680988 ) ) ( not ( = ?auto_1680981 ?auto_1680982 ) ) ( not ( = ?auto_1680981 ?auto_1680983 ) ) ( not ( = ?auto_1680981 ?auto_1680984 ) ) ( not ( = ?auto_1680981 ?auto_1680985 ) ) ( not ( = ?auto_1680981 ?auto_1680986 ) ) ( not ( = ?auto_1680981 ?auto_1680987 ) ) ( not ( = ?auto_1680981 ?auto_1680988 ) ) ( not ( = ?auto_1680982 ?auto_1680983 ) ) ( not ( = ?auto_1680982 ?auto_1680984 ) ) ( not ( = ?auto_1680982 ?auto_1680985 ) ) ( not ( = ?auto_1680982 ?auto_1680986 ) ) ( not ( = ?auto_1680982 ?auto_1680987 ) ) ( not ( = ?auto_1680982 ?auto_1680988 ) ) ( not ( = ?auto_1680983 ?auto_1680984 ) ) ( not ( = ?auto_1680983 ?auto_1680985 ) ) ( not ( = ?auto_1680983 ?auto_1680986 ) ) ( not ( = ?auto_1680983 ?auto_1680987 ) ) ( not ( = ?auto_1680983 ?auto_1680988 ) ) ( not ( = ?auto_1680984 ?auto_1680985 ) ) ( not ( = ?auto_1680984 ?auto_1680986 ) ) ( not ( = ?auto_1680984 ?auto_1680987 ) ) ( not ( = ?auto_1680984 ?auto_1680988 ) ) ( not ( = ?auto_1680985 ?auto_1680986 ) ) ( not ( = ?auto_1680985 ?auto_1680987 ) ) ( not ( = ?auto_1680985 ?auto_1680988 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1680986 ?auto_1680987 ?auto_1680988 )
      ( MAKE-15CRATE-VERIFY ?auto_1680973 ?auto_1680974 ?auto_1680975 ?auto_1680977 ?auto_1680976 ?auto_1680978 ?auto_1680979 ?auto_1680980 ?auto_1680981 ?auto_1680982 ?auto_1680983 ?auto_1680984 ?auto_1680985 ?auto_1680986 ?auto_1680987 ?auto_1680988 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1681198 - SURFACE
      ?auto_1681199 - SURFACE
      ?auto_1681200 - SURFACE
      ?auto_1681202 - SURFACE
      ?auto_1681201 - SURFACE
      ?auto_1681203 - SURFACE
      ?auto_1681204 - SURFACE
      ?auto_1681205 - SURFACE
      ?auto_1681206 - SURFACE
      ?auto_1681207 - SURFACE
      ?auto_1681208 - SURFACE
      ?auto_1681209 - SURFACE
      ?auto_1681210 - SURFACE
      ?auto_1681211 - SURFACE
      ?auto_1681212 - SURFACE
      ?auto_1681213 - SURFACE
    )
    :vars
    (
      ?auto_1681215 - HOIST
      ?auto_1681214 - PLACE
      ?auto_1681218 - TRUCK
      ?auto_1681216 - PLACE
      ?auto_1681219 - HOIST
      ?auto_1681217 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1681215 ?auto_1681214 ) ( SURFACE-AT ?auto_1681212 ?auto_1681214 ) ( CLEAR ?auto_1681212 ) ( IS-CRATE ?auto_1681213 ) ( not ( = ?auto_1681212 ?auto_1681213 ) ) ( AVAILABLE ?auto_1681215 ) ( ON ?auto_1681212 ?auto_1681211 ) ( not ( = ?auto_1681211 ?auto_1681212 ) ) ( not ( = ?auto_1681211 ?auto_1681213 ) ) ( TRUCK-AT ?auto_1681218 ?auto_1681216 ) ( not ( = ?auto_1681216 ?auto_1681214 ) ) ( HOIST-AT ?auto_1681219 ?auto_1681216 ) ( not ( = ?auto_1681215 ?auto_1681219 ) ) ( AVAILABLE ?auto_1681219 ) ( SURFACE-AT ?auto_1681213 ?auto_1681216 ) ( ON ?auto_1681213 ?auto_1681217 ) ( CLEAR ?auto_1681213 ) ( not ( = ?auto_1681212 ?auto_1681217 ) ) ( not ( = ?auto_1681213 ?auto_1681217 ) ) ( not ( = ?auto_1681211 ?auto_1681217 ) ) ( ON ?auto_1681199 ?auto_1681198 ) ( ON ?auto_1681200 ?auto_1681199 ) ( ON ?auto_1681202 ?auto_1681200 ) ( ON ?auto_1681201 ?auto_1681202 ) ( ON ?auto_1681203 ?auto_1681201 ) ( ON ?auto_1681204 ?auto_1681203 ) ( ON ?auto_1681205 ?auto_1681204 ) ( ON ?auto_1681206 ?auto_1681205 ) ( ON ?auto_1681207 ?auto_1681206 ) ( ON ?auto_1681208 ?auto_1681207 ) ( ON ?auto_1681209 ?auto_1681208 ) ( ON ?auto_1681210 ?auto_1681209 ) ( ON ?auto_1681211 ?auto_1681210 ) ( not ( = ?auto_1681198 ?auto_1681199 ) ) ( not ( = ?auto_1681198 ?auto_1681200 ) ) ( not ( = ?auto_1681198 ?auto_1681202 ) ) ( not ( = ?auto_1681198 ?auto_1681201 ) ) ( not ( = ?auto_1681198 ?auto_1681203 ) ) ( not ( = ?auto_1681198 ?auto_1681204 ) ) ( not ( = ?auto_1681198 ?auto_1681205 ) ) ( not ( = ?auto_1681198 ?auto_1681206 ) ) ( not ( = ?auto_1681198 ?auto_1681207 ) ) ( not ( = ?auto_1681198 ?auto_1681208 ) ) ( not ( = ?auto_1681198 ?auto_1681209 ) ) ( not ( = ?auto_1681198 ?auto_1681210 ) ) ( not ( = ?auto_1681198 ?auto_1681211 ) ) ( not ( = ?auto_1681198 ?auto_1681212 ) ) ( not ( = ?auto_1681198 ?auto_1681213 ) ) ( not ( = ?auto_1681198 ?auto_1681217 ) ) ( not ( = ?auto_1681199 ?auto_1681200 ) ) ( not ( = ?auto_1681199 ?auto_1681202 ) ) ( not ( = ?auto_1681199 ?auto_1681201 ) ) ( not ( = ?auto_1681199 ?auto_1681203 ) ) ( not ( = ?auto_1681199 ?auto_1681204 ) ) ( not ( = ?auto_1681199 ?auto_1681205 ) ) ( not ( = ?auto_1681199 ?auto_1681206 ) ) ( not ( = ?auto_1681199 ?auto_1681207 ) ) ( not ( = ?auto_1681199 ?auto_1681208 ) ) ( not ( = ?auto_1681199 ?auto_1681209 ) ) ( not ( = ?auto_1681199 ?auto_1681210 ) ) ( not ( = ?auto_1681199 ?auto_1681211 ) ) ( not ( = ?auto_1681199 ?auto_1681212 ) ) ( not ( = ?auto_1681199 ?auto_1681213 ) ) ( not ( = ?auto_1681199 ?auto_1681217 ) ) ( not ( = ?auto_1681200 ?auto_1681202 ) ) ( not ( = ?auto_1681200 ?auto_1681201 ) ) ( not ( = ?auto_1681200 ?auto_1681203 ) ) ( not ( = ?auto_1681200 ?auto_1681204 ) ) ( not ( = ?auto_1681200 ?auto_1681205 ) ) ( not ( = ?auto_1681200 ?auto_1681206 ) ) ( not ( = ?auto_1681200 ?auto_1681207 ) ) ( not ( = ?auto_1681200 ?auto_1681208 ) ) ( not ( = ?auto_1681200 ?auto_1681209 ) ) ( not ( = ?auto_1681200 ?auto_1681210 ) ) ( not ( = ?auto_1681200 ?auto_1681211 ) ) ( not ( = ?auto_1681200 ?auto_1681212 ) ) ( not ( = ?auto_1681200 ?auto_1681213 ) ) ( not ( = ?auto_1681200 ?auto_1681217 ) ) ( not ( = ?auto_1681202 ?auto_1681201 ) ) ( not ( = ?auto_1681202 ?auto_1681203 ) ) ( not ( = ?auto_1681202 ?auto_1681204 ) ) ( not ( = ?auto_1681202 ?auto_1681205 ) ) ( not ( = ?auto_1681202 ?auto_1681206 ) ) ( not ( = ?auto_1681202 ?auto_1681207 ) ) ( not ( = ?auto_1681202 ?auto_1681208 ) ) ( not ( = ?auto_1681202 ?auto_1681209 ) ) ( not ( = ?auto_1681202 ?auto_1681210 ) ) ( not ( = ?auto_1681202 ?auto_1681211 ) ) ( not ( = ?auto_1681202 ?auto_1681212 ) ) ( not ( = ?auto_1681202 ?auto_1681213 ) ) ( not ( = ?auto_1681202 ?auto_1681217 ) ) ( not ( = ?auto_1681201 ?auto_1681203 ) ) ( not ( = ?auto_1681201 ?auto_1681204 ) ) ( not ( = ?auto_1681201 ?auto_1681205 ) ) ( not ( = ?auto_1681201 ?auto_1681206 ) ) ( not ( = ?auto_1681201 ?auto_1681207 ) ) ( not ( = ?auto_1681201 ?auto_1681208 ) ) ( not ( = ?auto_1681201 ?auto_1681209 ) ) ( not ( = ?auto_1681201 ?auto_1681210 ) ) ( not ( = ?auto_1681201 ?auto_1681211 ) ) ( not ( = ?auto_1681201 ?auto_1681212 ) ) ( not ( = ?auto_1681201 ?auto_1681213 ) ) ( not ( = ?auto_1681201 ?auto_1681217 ) ) ( not ( = ?auto_1681203 ?auto_1681204 ) ) ( not ( = ?auto_1681203 ?auto_1681205 ) ) ( not ( = ?auto_1681203 ?auto_1681206 ) ) ( not ( = ?auto_1681203 ?auto_1681207 ) ) ( not ( = ?auto_1681203 ?auto_1681208 ) ) ( not ( = ?auto_1681203 ?auto_1681209 ) ) ( not ( = ?auto_1681203 ?auto_1681210 ) ) ( not ( = ?auto_1681203 ?auto_1681211 ) ) ( not ( = ?auto_1681203 ?auto_1681212 ) ) ( not ( = ?auto_1681203 ?auto_1681213 ) ) ( not ( = ?auto_1681203 ?auto_1681217 ) ) ( not ( = ?auto_1681204 ?auto_1681205 ) ) ( not ( = ?auto_1681204 ?auto_1681206 ) ) ( not ( = ?auto_1681204 ?auto_1681207 ) ) ( not ( = ?auto_1681204 ?auto_1681208 ) ) ( not ( = ?auto_1681204 ?auto_1681209 ) ) ( not ( = ?auto_1681204 ?auto_1681210 ) ) ( not ( = ?auto_1681204 ?auto_1681211 ) ) ( not ( = ?auto_1681204 ?auto_1681212 ) ) ( not ( = ?auto_1681204 ?auto_1681213 ) ) ( not ( = ?auto_1681204 ?auto_1681217 ) ) ( not ( = ?auto_1681205 ?auto_1681206 ) ) ( not ( = ?auto_1681205 ?auto_1681207 ) ) ( not ( = ?auto_1681205 ?auto_1681208 ) ) ( not ( = ?auto_1681205 ?auto_1681209 ) ) ( not ( = ?auto_1681205 ?auto_1681210 ) ) ( not ( = ?auto_1681205 ?auto_1681211 ) ) ( not ( = ?auto_1681205 ?auto_1681212 ) ) ( not ( = ?auto_1681205 ?auto_1681213 ) ) ( not ( = ?auto_1681205 ?auto_1681217 ) ) ( not ( = ?auto_1681206 ?auto_1681207 ) ) ( not ( = ?auto_1681206 ?auto_1681208 ) ) ( not ( = ?auto_1681206 ?auto_1681209 ) ) ( not ( = ?auto_1681206 ?auto_1681210 ) ) ( not ( = ?auto_1681206 ?auto_1681211 ) ) ( not ( = ?auto_1681206 ?auto_1681212 ) ) ( not ( = ?auto_1681206 ?auto_1681213 ) ) ( not ( = ?auto_1681206 ?auto_1681217 ) ) ( not ( = ?auto_1681207 ?auto_1681208 ) ) ( not ( = ?auto_1681207 ?auto_1681209 ) ) ( not ( = ?auto_1681207 ?auto_1681210 ) ) ( not ( = ?auto_1681207 ?auto_1681211 ) ) ( not ( = ?auto_1681207 ?auto_1681212 ) ) ( not ( = ?auto_1681207 ?auto_1681213 ) ) ( not ( = ?auto_1681207 ?auto_1681217 ) ) ( not ( = ?auto_1681208 ?auto_1681209 ) ) ( not ( = ?auto_1681208 ?auto_1681210 ) ) ( not ( = ?auto_1681208 ?auto_1681211 ) ) ( not ( = ?auto_1681208 ?auto_1681212 ) ) ( not ( = ?auto_1681208 ?auto_1681213 ) ) ( not ( = ?auto_1681208 ?auto_1681217 ) ) ( not ( = ?auto_1681209 ?auto_1681210 ) ) ( not ( = ?auto_1681209 ?auto_1681211 ) ) ( not ( = ?auto_1681209 ?auto_1681212 ) ) ( not ( = ?auto_1681209 ?auto_1681213 ) ) ( not ( = ?auto_1681209 ?auto_1681217 ) ) ( not ( = ?auto_1681210 ?auto_1681211 ) ) ( not ( = ?auto_1681210 ?auto_1681212 ) ) ( not ( = ?auto_1681210 ?auto_1681213 ) ) ( not ( = ?auto_1681210 ?auto_1681217 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1681211 ?auto_1681212 ?auto_1681213 )
      ( MAKE-15CRATE-VERIFY ?auto_1681198 ?auto_1681199 ?auto_1681200 ?auto_1681202 ?auto_1681201 ?auto_1681203 ?auto_1681204 ?auto_1681205 ?auto_1681206 ?auto_1681207 ?auto_1681208 ?auto_1681209 ?auto_1681210 ?auto_1681211 ?auto_1681212 ?auto_1681213 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1681424 - SURFACE
      ?auto_1681425 - SURFACE
      ?auto_1681426 - SURFACE
      ?auto_1681428 - SURFACE
      ?auto_1681427 - SURFACE
      ?auto_1681429 - SURFACE
      ?auto_1681430 - SURFACE
      ?auto_1681431 - SURFACE
      ?auto_1681432 - SURFACE
      ?auto_1681433 - SURFACE
      ?auto_1681434 - SURFACE
      ?auto_1681435 - SURFACE
      ?auto_1681436 - SURFACE
      ?auto_1681437 - SURFACE
      ?auto_1681438 - SURFACE
      ?auto_1681439 - SURFACE
    )
    :vars
    (
      ?auto_1681445 - HOIST
      ?auto_1681444 - PLACE
      ?auto_1681442 - PLACE
      ?auto_1681443 - HOIST
      ?auto_1681440 - SURFACE
      ?auto_1681441 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1681445 ?auto_1681444 ) ( SURFACE-AT ?auto_1681438 ?auto_1681444 ) ( CLEAR ?auto_1681438 ) ( IS-CRATE ?auto_1681439 ) ( not ( = ?auto_1681438 ?auto_1681439 ) ) ( AVAILABLE ?auto_1681445 ) ( ON ?auto_1681438 ?auto_1681437 ) ( not ( = ?auto_1681437 ?auto_1681438 ) ) ( not ( = ?auto_1681437 ?auto_1681439 ) ) ( not ( = ?auto_1681442 ?auto_1681444 ) ) ( HOIST-AT ?auto_1681443 ?auto_1681442 ) ( not ( = ?auto_1681445 ?auto_1681443 ) ) ( AVAILABLE ?auto_1681443 ) ( SURFACE-AT ?auto_1681439 ?auto_1681442 ) ( ON ?auto_1681439 ?auto_1681440 ) ( CLEAR ?auto_1681439 ) ( not ( = ?auto_1681438 ?auto_1681440 ) ) ( not ( = ?auto_1681439 ?auto_1681440 ) ) ( not ( = ?auto_1681437 ?auto_1681440 ) ) ( TRUCK-AT ?auto_1681441 ?auto_1681444 ) ( ON ?auto_1681425 ?auto_1681424 ) ( ON ?auto_1681426 ?auto_1681425 ) ( ON ?auto_1681428 ?auto_1681426 ) ( ON ?auto_1681427 ?auto_1681428 ) ( ON ?auto_1681429 ?auto_1681427 ) ( ON ?auto_1681430 ?auto_1681429 ) ( ON ?auto_1681431 ?auto_1681430 ) ( ON ?auto_1681432 ?auto_1681431 ) ( ON ?auto_1681433 ?auto_1681432 ) ( ON ?auto_1681434 ?auto_1681433 ) ( ON ?auto_1681435 ?auto_1681434 ) ( ON ?auto_1681436 ?auto_1681435 ) ( ON ?auto_1681437 ?auto_1681436 ) ( not ( = ?auto_1681424 ?auto_1681425 ) ) ( not ( = ?auto_1681424 ?auto_1681426 ) ) ( not ( = ?auto_1681424 ?auto_1681428 ) ) ( not ( = ?auto_1681424 ?auto_1681427 ) ) ( not ( = ?auto_1681424 ?auto_1681429 ) ) ( not ( = ?auto_1681424 ?auto_1681430 ) ) ( not ( = ?auto_1681424 ?auto_1681431 ) ) ( not ( = ?auto_1681424 ?auto_1681432 ) ) ( not ( = ?auto_1681424 ?auto_1681433 ) ) ( not ( = ?auto_1681424 ?auto_1681434 ) ) ( not ( = ?auto_1681424 ?auto_1681435 ) ) ( not ( = ?auto_1681424 ?auto_1681436 ) ) ( not ( = ?auto_1681424 ?auto_1681437 ) ) ( not ( = ?auto_1681424 ?auto_1681438 ) ) ( not ( = ?auto_1681424 ?auto_1681439 ) ) ( not ( = ?auto_1681424 ?auto_1681440 ) ) ( not ( = ?auto_1681425 ?auto_1681426 ) ) ( not ( = ?auto_1681425 ?auto_1681428 ) ) ( not ( = ?auto_1681425 ?auto_1681427 ) ) ( not ( = ?auto_1681425 ?auto_1681429 ) ) ( not ( = ?auto_1681425 ?auto_1681430 ) ) ( not ( = ?auto_1681425 ?auto_1681431 ) ) ( not ( = ?auto_1681425 ?auto_1681432 ) ) ( not ( = ?auto_1681425 ?auto_1681433 ) ) ( not ( = ?auto_1681425 ?auto_1681434 ) ) ( not ( = ?auto_1681425 ?auto_1681435 ) ) ( not ( = ?auto_1681425 ?auto_1681436 ) ) ( not ( = ?auto_1681425 ?auto_1681437 ) ) ( not ( = ?auto_1681425 ?auto_1681438 ) ) ( not ( = ?auto_1681425 ?auto_1681439 ) ) ( not ( = ?auto_1681425 ?auto_1681440 ) ) ( not ( = ?auto_1681426 ?auto_1681428 ) ) ( not ( = ?auto_1681426 ?auto_1681427 ) ) ( not ( = ?auto_1681426 ?auto_1681429 ) ) ( not ( = ?auto_1681426 ?auto_1681430 ) ) ( not ( = ?auto_1681426 ?auto_1681431 ) ) ( not ( = ?auto_1681426 ?auto_1681432 ) ) ( not ( = ?auto_1681426 ?auto_1681433 ) ) ( not ( = ?auto_1681426 ?auto_1681434 ) ) ( not ( = ?auto_1681426 ?auto_1681435 ) ) ( not ( = ?auto_1681426 ?auto_1681436 ) ) ( not ( = ?auto_1681426 ?auto_1681437 ) ) ( not ( = ?auto_1681426 ?auto_1681438 ) ) ( not ( = ?auto_1681426 ?auto_1681439 ) ) ( not ( = ?auto_1681426 ?auto_1681440 ) ) ( not ( = ?auto_1681428 ?auto_1681427 ) ) ( not ( = ?auto_1681428 ?auto_1681429 ) ) ( not ( = ?auto_1681428 ?auto_1681430 ) ) ( not ( = ?auto_1681428 ?auto_1681431 ) ) ( not ( = ?auto_1681428 ?auto_1681432 ) ) ( not ( = ?auto_1681428 ?auto_1681433 ) ) ( not ( = ?auto_1681428 ?auto_1681434 ) ) ( not ( = ?auto_1681428 ?auto_1681435 ) ) ( not ( = ?auto_1681428 ?auto_1681436 ) ) ( not ( = ?auto_1681428 ?auto_1681437 ) ) ( not ( = ?auto_1681428 ?auto_1681438 ) ) ( not ( = ?auto_1681428 ?auto_1681439 ) ) ( not ( = ?auto_1681428 ?auto_1681440 ) ) ( not ( = ?auto_1681427 ?auto_1681429 ) ) ( not ( = ?auto_1681427 ?auto_1681430 ) ) ( not ( = ?auto_1681427 ?auto_1681431 ) ) ( not ( = ?auto_1681427 ?auto_1681432 ) ) ( not ( = ?auto_1681427 ?auto_1681433 ) ) ( not ( = ?auto_1681427 ?auto_1681434 ) ) ( not ( = ?auto_1681427 ?auto_1681435 ) ) ( not ( = ?auto_1681427 ?auto_1681436 ) ) ( not ( = ?auto_1681427 ?auto_1681437 ) ) ( not ( = ?auto_1681427 ?auto_1681438 ) ) ( not ( = ?auto_1681427 ?auto_1681439 ) ) ( not ( = ?auto_1681427 ?auto_1681440 ) ) ( not ( = ?auto_1681429 ?auto_1681430 ) ) ( not ( = ?auto_1681429 ?auto_1681431 ) ) ( not ( = ?auto_1681429 ?auto_1681432 ) ) ( not ( = ?auto_1681429 ?auto_1681433 ) ) ( not ( = ?auto_1681429 ?auto_1681434 ) ) ( not ( = ?auto_1681429 ?auto_1681435 ) ) ( not ( = ?auto_1681429 ?auto_1681436 ) ) ( not ( = ?auto_1681429 ?auto_1681437 ) ) ( not ( = ?auto_1681429 ?auto_1681438 ) ) ( not ( = ?auto_1681429 ?auto_1681439 ) ) ( not ( = ?auto_1681429 ?auto_1681440 ) ) ( not ( = ?auto_1681430 ?auto_1681431 ) ) ( not ( = ?auto_1681430 ?auto_1681432 ) ) ( not ( = ?auto_1681430 ?auto_1681433 ) ) ( not ( = ?auto_1681430 ?auto_1681434 ) ) ( not ( = ?auto_1681430 ?auto_1681435 ) ) ( not ( = ?auto_1681430 ?auto_1681436 ) ) ( not ( = ?auto_1681430 ?auto_1681437 ) ) ( not ( = ?auto_1681430 ?auto_1681438 ) ) ( not ( = ?auto_1681430 ?auto_1681439 ) ) ( not ( = ?auto_1681430 ?auto_1681440 ) ) ( not ( = ?auto_1681431 ?auto_1681432 ) ) ( not ( = ?auto_1681431 ?auto_1681433 ) ) ( not ( = ?auto_1681431 ?auto_1681434 ) ) ( not ( = ?auto_1681431 ?auto_1681435 ) ) ( not ( = ?auto_1681431 ?auto_1681436 ) ) ( not ( = ?auto_1681431 ?auto_1681437 ) ) ( not ( = ?auto_1681431 ?auto_1681438 ) ) ( not ( = ?auto_1681431 ?auto_1681439 ) ) ( not ( = ?auto_1681431 ?auto_1681440 ) ) ( not ( = ?auto_1681432 ?auto_1681433 ) ) ( not ( = ?auto_1681432 ?auto_1681434 ) ) ( not ( = ?auto_1681432 ?auto_1681435 ) ) ( not ( = ?auto_1681432 ?auto_1681436 ) ) ( not ( = ?auto_1681432 ?auto_1681437 ) ) ( not ( = ?auto_1681432 ?auto_1681438 ) ) ( not ( = ?auto_1681432 ?auto_1681439 ) ) ( not ( = ?auto_1681432 ?auto_1681440 ) ) ( not ( = ?auto_1681433 ?auto_1681434 ) ) ( not ( = ?auto_1681433 ?auto_1681435 ) ) ( not ( = ?auto_1681433 ?auto_1681436 ) ) ( not ( = ?auto_1681433 ?auto_1681437 ) ) ( not ( = ?auto_1681433 ?auto_1681438 ) ) ( not ( = ?auto_1681433 ?auto_1681439 ) ) ( not ( = ?auto_1681433 ?auto_1681440 ) ) ( not ( = ?auto_1681434 ?auto_1681435 ) ) ( not ( = ?auto_1681434 ?auto_1681436 ) ) ( not ( = ?auto_1681434 ?auto_1681437 ) ) ( not ( = ?auto_1681434 ?auto_1681438 ) ) ( not ( = ?auto_1681434 ?auto_1681439 ) ) ( not ( = ?auto_1681434 ?auto_1681440 ) ) ( not ( = ?auto_1681435 ?auto_1681436 ) ) ( not ( = ?auto_1681435 ?auto_1681437 ) ) ( not ( = ?auto_1681435 ?auto_1681438 ) ) ( not ( = ?auto_1681435 ?auto_1681439 ) ) ( not ( = ?auto_1681435 ?auto_1681440 ) ) ( not ( = ?auto_1681436 ?auto_1681437 ) ) ( not ( = ?auto_1681436 ?auto_1681438 ) ) ( not ( = ?auto_1681436 ?auto_1681439 ) ) ( not ( = ?auto_1681436 ?auto_1681440 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1681437 ?auto_1681438 ?auto_1681439 )
      ( MAKE-15CRATE-VERIFY ?auto_1681424 ?auto_1681425 ?auto_1681426 ?auto_1681428 ?auto_1681427 ?auto_1681429 ?auto_1681430 ?auto_1681431 ?auto_1681432 ?auto_1681433 ?auto_1681434 ?auto_1681435 ?auto_1681436 ?auto_1681437 ?auto_1681438 ?auto_1681439 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1681650 - SURFACE
      ?auto_1681651 - SURFACE
      ?auto_1681652 - SURFACE
      ?auto_1681654 - SURFACE
      ?auto_1681653 - SURFACE
      ?auto_1681655 - SURFACE
      ?auto_1681656 - SURFACE
      ?auto_1681657 - SURFACE
      ?auto_1681658 - SURFACE
      ?auto_1681659 - SURFACE
      ?auto_1681660 - SURFACE
      ?auto_1681661 - SURFACE
      ?auto_1681662 - SURFACE
      ?auto_1681663 - SURFACE
      ?auto_1681664 - SURFACE
      ?auto_1681665 - SURFACE
    )
    :vars
    (
      ?auto_1681671 - HOIST
      ?auto_1681668 - PLACE
      ?auto_1681666 - PLACE
      ?auto_1681669 - HOIST
      ?auto_1681667 - SURFACE
      ?auto_1681670 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1681671 ?auto_1681668 ) ( IS-CRATE ?auto_1681665 ) ( not ( = ?auto_1681664 ?auto_1681665 ) ) ( not ( = ?auto_1681663 ?auto_1681664 ) ) ( not ( = ?auto_1681663 ?auto_1681665 ) ) ( not ( = ?auto_1681666 ?auto_1681668 ) ) ( HOIST-AT ?auto_1681669 ?auto_1681666 ) ( not ( = ?auto_1681671 ?auto_1681669 ) ) ( AVAILABLE ?auto_1681669 ) ( SURFACE-AT ?auto_1681665 ?auto_1681666 ) ( ON ?auto_1681665 ?auto_1681667 ) ( CLEAR ?auto_1681665 ) ( not ( = ?auto_1681664 ?auto_1681667 ) ) ( not ( = ?auto_1681665 ?auto_1681667 ) ) ( not ( = ?auto_1681663 ?auto_1681667 ) ) ( TRUCK-AT ?auto_1681670 ?auto_1681668 ) ( SURFACE-AT ?auto_1681663 ?auto_1681668 ) ( CLEAR ?auto_1681663 ) ( LIFTING ?auto_1681671 ?auto_1681664 ) ( IS-CRATE ?auto_1681664 ) ( ON ?auto_1681651 ?auto_1681650 ) ( ON ?auto_1681652 ?auto_1681651 ) ( ON ?auto_1681654 ?auto_1681652 ) ( ON ?auto_1681653 ?auto_1681654 ) ( ON ?auto_1681655 ?auto_1681653 ) ( ON ?auto_1681656 ?auto_1681655 ) ( ON ?auto_1681657 ?auto_1681656 ) ( ON ?auto_1681658 ?auto_1681657 ) ( ON ?auto_1681659 ?auto_1681658 ) ( ON ?auto_1681660 ?auto_1681659 ) ( ON ?auto_1681661 ?auto_1681660 ) ( ON ?auto_1681662 ?auto_1681661 ) ( ON ?auto_1681663 ?auto_1681662 ) ( not ( = ?auto_1681650 ?auto_1681651 ) ) ( not ( = ?auto_1681650 ?auto_1681652 ) ) ( not ( = ?auto_1681650 ?auto_1681654 ) ) ( not ( = ?auto_1681650 ?auto_1681653 ) ) ( not ( = ?auto_1681650 ?auto_1681655 ) ) ( not ( = ?auto_1681650 ?auto_1681656 ) ) ( not ( = ?auto_1681650 ?auto_1681657 ) ) ( not ( = ?auto_1681650 ?auto_1681658 ) ) ( not ( = ?auto_1681650 ?auto_1681659 ) ) ( not ( = ?auto_1681650 ?auto_1681660 ) ) ( not ( = ?auto_1681650 ?auto_1681661 ) ) ( not ( = ?auto_1681650 ?auto_1681662 ) ) ( not ( = ?auto_1681650 ?auto_1681663 ) ) ( not ( = ?auto_1681650 ?auto_1681664 ) ) ( not ( = ?auto_1681650 ?auto_1681665 ) ) ( not ( = ?auto_1681650 ?auto_1681667 ) ) ( not ( = ?auto_1681651 ?auto_1681652 ) ) ( not ( = ?auto_1681651 ?auto_1681654 ) ) ( not ( = ?auto_1681651 ?auto_1681653 ) ) ( not ( = ?auto_1681651 ?auto_1681655 ) ) ( not ( = ?auto_1681651 ?auto_1681656 ) ) ( not ( = ?auto_1681651 ?auto_1681657 ) ) ( not ( = ?auto_1681651 ?auto_1681658 ) ) ( not ( = ?auto_1681651 ?auto_1681659 ) ) ( not ( = ?auto_1681651 ?auto_1681660 ) ) ( not ( = ?auto_1681651 ?auto_1681661 ) ) ( not ( = ?auto_1681651 ?auto_1681662 ) ) ( not ( = ?auto_1681651 ?auto_1681663 ) ) ( not ( = ?auto_1681651 ?auto_1681664 ) ) ( not ( = ?auto_1681651 ?auto_1681665 ) ) ( not ( = ?auto_1681651 ?auto_1681667 ) ) ( not ( = ?auto_1681652 ?auto_1681654 ) ) ( not ( = ?auto_1681652 ?auto_1681653 ) ) ( not ( = ?auto_1681652 ?auto_1681655 ) ) ( not ( = ?auto_1681652 ?auto_1681656 ) ) ( not ( = ?auto_1681652 ?auto_1681657 ) ) ( not ( = ?auto_1681652 ?auto_1681658 ) ) ( not ( = ?auto_1681652 ?auto_1681659 ) ) ( not ( = ?auto_1681652 ?auto_1681660 ) ) ( not ( = ?auto_1681652 ?auto_1681661 ) ) ( not ( = ?auto_1681652 ?auto_1681662 ) ) ( not ( = ?auto_1681652 ?auto_1681663 ) ) ( not ( = ?auto_1681652 ?auto_1681664 ) ) ( not ( = ?auto_1681652 ?auto_1681665 ) ) ( not ( = ?auto_1681652 ?auto_1681667 ) ) ( not ( = ?auto_1681654 ?auto_1681653 ) ) ( not ( = ?auto_1681654 ?auto_1681655 ) ) ( not ( = ?auto_1681654 ?auto_1681656 ) ) ( not ( = ?auto_1681654 ?auto_1681657 ) ) ( not ( = ?auto_1681654 ?auto_1681658 ) ) ( not ( = ?auto_1681654 ?auto_1681659 ) ) ( not ( = ?auto_1681654 ?auto_1681660 ) ) ( not ( = ?auto_1681654 ?auto_1681661 ) ) ( not ( = ?auto_1681654 ?auto_1681662 ) ) ( not ( = ?auto_1681654 ?auto_1681663 ) ) ( not ( = ?auto_1681654 ?auto_1681664 ) ) ( not ( = ?auto_1681654 ?auto_1681665 ) ) ( not ( = ?auto_1681654 ?auto_1681667 ) ) ( not ( = ?auto_1681653 ?auto_1681655 ) ) ( not ( = ?auto_1681653 ?auto_1681656 ) ) ( not ( = ?auto_1681653 ?auto_1681657 ) ) ( not ( = ?auto_1681653 ?auto_1681658 ) ) ( not ( = ?auto_1681653 ?auto_1681659 ) ) ( not ( = ?auto_1681653 ?auto_1681660 ) ) ( not ( = ?auto_1681653 ?auto_1681661 ) ) ( not ( = ?auto_1681653 ?auto_1681662 ) ) ( not ( = ?auto_1681653 ?auto_1681663 ) ) ( not ( = ?auto_1681653 ?auto_1681664 ) ) ( not ( = ?auto_1681653 ?auto_1681665 ) ) ( not ( = ?auto_1681653 ?auto_1681667 ) ) ( not ( = ?auto_1681655 ?auto_1681656 ) ) ( not ( = ?auto_1681655 ?auto_1681657 ) ) ( not ( = ?auto_1681655 ?auto_1681658 ) ) ( not ( = ?auto_1681655 ?auto_1681659 ) ) ( not ( = ?auto_1681655 ?auto_1681660 ) ) ( not ( = ?auto_1681655 ?auto_1681661 ) ) ( not ( = ?auto_1681655 ?auto_1681662 ) ) ( not ( = ?auto_1681655 ?auto_1681663 ) ) ( not ( = ?auto_1681655 ?auto_1681664 ) ) ( not ( = ?auto_1681655 ?auto_1681665 ) ) ( not ( = ?auto_1681655 ?auto_1681667 ) ) ( not ( = ?auto_1681656 ?auto_1681657 ) ) ( not ( = ?auto_1681656 ?auto_1681658 ) ) ( not ( = ?auto_1681656 ?auto_1681659 ) ) ( not ( = ?auto_1681656 ?auto_1681660 ) ) ( not ( = ?auto_1681656 ?auto_1681661 ) ) ( not ( = ?auto_1681656 ?auto_1681662 ) ) ( not ( = ?auto_1681656 ?auto_1681663 ) ) ( not ( = ?auto_1681656 ?auto_1681664 ) ) ( not ( = ?auto_1681656 ?auto_1681665 ) ) ( not ( = ?auto_1681656 ?auto_1681667 ) ) ( not ( = ?auto_1681657 ?auto_1681658 ) ) ( not ( = ?auto_1681657 ?auto_1681659 ) ) ( not ( = ?auto_1681657 ?auto_1681660 ) ) ( not ( = ?auto_1681657 ?auto_1681661 ) ) ( not ( = ?auto_1681657 ?auto_1681662 ) ) ( not ( = ?auto_1681657 ?auto_1681663 ) ) ( not ( = ?auto_1681657 ?auto_1681664 ) ) ( not ( = ?auto_1681657 ?auto_1681665 ) ) ( not ( = ?auto_1681657 ?auto_1681667 ) ) ( not ( = ?auto_1681658 ?auto_1681659 ) ) ( not ( = ?auto_1681658 ?auto_1681660 ) ) ( not ( = ?auto_1681658 ?auto_1681661 ) ) ( not ( = ?auto_1681658 ?auto_1681662 ) ) ( not ( = ?auto_1681658 ?auto_1681663 ) ) ( not ( = ?auto_1681658 ?auto_1681664 ) ) ( not ( = ?auto_1681658 ?auto_1681665 ) ) ( not ( = ?auto_1681658 ?auto_1681667 ) ) ( not ( = ?auto_1681659 ?auto_1681660 ) ) ( not ( = ?auto_1681659 ?auto_1681661 ) ) ( not ( = ?auto_1681659 ?auto_1681662 ) ) ( not ( = ?auto_1681659 ?auto_1681663 ) ) ( not ( = ?auto_1681659 ?auto_1681664 ) ) ( not ( = ?auto_1681659 ?auto_1681665 ) ) ( not ( = ?auto_1681659 ?auto_1681667 ) ) ( not ( = ?auto_1681660 ?auto_1681661 ) ) ( not ( = ?auto_1681660 ?auto_1681662 ) ) ( not ( = ?auto_1681660 ?auto_1681663 ) ) ( not ( = ?auto_1681660 ?auto_1681664 ) ) ( not ( = ?auto_1681660 ?auto_1681665 ) ) ( not ( = ?auto_1681660 ?auto_1681667 ) ) ( not ( = ?auto_1681661 ?auto_1681662 ) ) ( not ( = ?auto_1681661 ?auto_1681663 ) ) ( not ( = ?auto_1681661 ?auto_1681664 ) ) ( not ( = ?auto_1681661 ?auto_1681665 ) ) ( not ( = ?auto_1681661 ?auto_1681667 ) ) ( not ( = ?auto_1681662 ?auto_1681663 ) ) ( not ( = ?auto_1681662 ?auto_1681664 ) ) ( not ( = ?auto_1681662 ?auto_1681665 ) ) ( not ( = ?auto_1681662 ?auto_1681667 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1681663 ?auto_1681664 ?auto_1681665 )
      ( MAKE-15CRATE-VERIFY ?auto_1681650 ?auto_1681651 ?auto_1681652 ?auto_1681654 ?auto_1681653 ?auto_1681655 ?auto_1681656 ?auto_1681657 ?auto_1681658 ?auto_1681659 ?auto_1681660 ?auto_1681661 ?auto_1681662 ?auto_1681663 ?auto_1681664 ?auto_1681665 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1681876 - SURFACE
      ?auto_1681877 - SURFACE
      ?auto_1681878 - SURFACE
      ?auto_1681880 - SURFACE
      ?auto_1681879 - SURFACE
      ?auto_1681881 - SURFACE
      ?auto_1681882 - SURFACE
      ?auto_1681883 - SURFACE
      ?auto_1681884 - SURFACE
      ?auto_1681885 - SURFACE
      ?auto_1681886 - SURFACE
      ?auto_1681887 - SURFACE
      ?auto_1681888 - SURFACE
      ?auto_1681889 - SURFACE
      ?auto_1681890 - SURFACE
      ?auto_1681891 - SURFACE
    )
    :vars
    (
      ?auto_1681893 - HOIST
      ?auto_1681892 - PLACE
      ?auto_1681895 - PLACE
      ?auto_1681896 - HOIST
      ?auto_1681897 - SURFACE
      ?auto_1681894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1681893 ?auto_1681892 ) ( IS-CRATE ?auto_1681891 ) ( not ( = ?auto_1681890 ?auto_1681891 ) ) ( not ( = ?auto_1681889 ?auto_1681890 ) ) ( not ( = ?auto_1681889 ?auto_1681891 ) ) ( not ( = ?auto_1681895 ?auto_1681892 ) ) ( HOIST-AT ?auto_1681896 ?auto_1681895 ) ( not ( = ?auto_1681893 ?auto_1681896 ) ) ( AVAILABLE ?auto_1681896 ) ( SURFACE-AT ?auto_1681891 ?auto_1681895 ) ( ON ?auto_1681891 ?auto_1681897 ) ( CLEAR ?auto_1681891 ) ( not ( = ?auto_1681890 ?auto_1681897 ) ) ( not ( = ?auto_1681891 ?auto_1681897 ) ) ( not ( = ?auto_1681889 ?auto_1681897 ) ) ( TRUCK-AT ?auto_1681894 ?auto_1681892 ) ( SURFACE-AT ?auto_1681889 ?auto_1681892 ) ( CLEAR ?auto_1681889 ) ( IS-CRATE ?auto_1681890 ) ( AVAILABLE ?auto_1681893 ) ( IN ?auto_1681890 ?auto_1681894 ) ( ON ?auto_1681877 ?auto_1681876 ) ( ON ?auto_1681878 ?auto_1681877 ) ( ON ?auto_1681880 ?auto_1681878 ) ( ON ?auto_1681879 ?auto_1681880 ) ( ON ?auto_1681881 ?auto_1681879 ) ( ON ?auto_1681882 ?auto_1681881 ) ( ON ?auto_1681883 ?auto_1681882 ) ( ON ?auto_1681884 ?auto_1681883 ) ( ON ?auto_1681885 ?auto_1681884 ) ( ON ?auto_1681886 ?auto_1681885 ) ( ON ?auto_1681887 ?auto_1681886 ) ( ON ?auto_1681888 ?auto_1681887 ) ( ON ?auto_1681889 ?auto_1681888 ) ( not ( = ?auto_1681876 ?auto_1681877 ) ) ( not ( = ?auto_1681876 ?auto_1681878 ) ) ( not ( = ?auto_1681876 ?auto_1681880 ) ) ( not ( = ?auto_1681876 ?auto_1681879 ) ) ( not ( = ?auto_1681876 ?auto_1681881 ) ) ( not ( = ?auto_1681876 ?auto_1681882 ) ) ( not ( = ?auto_1681876 ?auto_1681883 ) ) ( not ( = ?auto_1681876 ?auto_1681884 ) ) ( not ( = ?auto_1681876 ?auto_1681885 ) ) ( not ( = ?auto_1681876 ?auto_1681886 ) ) ( not ( = ?auto_1681876 ?auto_1681887 ) ) ( not ( = ?auto_1681876 ?auto_1681888 ) ) ( not ( = ?auto_1681876 ?auto_1681889 ) ) ( not ( = ?auto_1681876 ?auto_1681890 ) ) ( not ( = ?auto_1681876 ?auto_1681891 ) ) ( not ( = ?auto_1681876 ?auto_1681897 ) ) ( not ( = ?auto_1681877 ?auto_1681878 ) ) ( not ( = ?auto_1681877 ?auto_1681880 ) ) ( not ( = ?auto_1681877 ?auto_1681879 ) ) ( not ( = ?auto_1681877 ?auto_1681881 ) ) ( not ( = ?auto_1681877 ?auto_1681882 ) ) ( not ( = ?auto_1681877 ?auto_1681883 ) ) ( not ( = ?auto_1681877 ?auto_1681884 ) ) ( not ( = ?auto_1681877 ?auto_1681885 ) ) ( not ( = ?auto_1681877 ?auto_1681886 ) ) ( not ( = ?auto_1681877 ?auto_1681887 ) ) ( not ( = ?auto_1681877 ?auto_1681888 ) ) ( not ( = ?auto_1681877 ?auto_1681889 ) ) ( not ( = ?auto_1681877 ?auto_1681890 ) ) ( not ( = ?auto_1681877 ?auto_1681891 ) ) ( not ( = ?auto_1681877 ?auto_1681897 ) ) ( not ( = ?auto_1681878 ?auto_1681880 ) ) ( not ( = ?auto_1681878 ?auto_1681879 ) ) ( not ( = ?auto_1681878 ?auto_1681881 ) ) ( not ( = ?auto_1681878 ?auto_1681882 ) ) ( not ( = ?auto_1681878 ?auto_1681883 ) ) ( not ( = ?auto_1681878 ?auto_1681884 ) ) ( not ( = ?auto_1681878 ?auto_1681885 ) ) ( not ( = ?auto_1681878 ?auto_1681886 ) ) ( not ( = ?auto_1681878 ?auto_1681887 ) ) ( not ( = ?auto_1681878 ?auto_1681888 ) ) ( not ( = ?auto_1681878 ?auto_1681889 ) ) ( not ( = ?auto_1681878 ?auto_1681890 ) ) ( not ( = ?auto_1681878 ?auto_1681891 ) ) ( not ( = ?auto_1681878 ?auto_1681897 ) ) ( not ( = ?auto_1681880 ?auto_1681879 ) ) ( not ( = ?auto_1681880 ?auto_1681881 ) ) ( not ( = ?auto_1681880 ?auto_1681882 ) ) ( not ( = ?auto_1681880 ?auto_1681883 ) ) ( not ( = ?auto_1681880 ?auto_1681884 ) ) ( not ( = ?auto_1681880 ?auto_1681885 ) ) ( not ( = ?auto_1681880 ?auto_1681886 ) ) ( not ( = ?auto_1681880 ?auto_1681887 ) ) ( not ( = ?auto_1681880 ?auto_1681888 ) ) ( not ( = ?auto_1681880 ?auto_1681889 ) ) ( not ( = ?auto_1681880 ?auto_1681890 ) ) ( not ( = ?auto_1681880 ?auto_1681891 ) ) ( not ( = ?auto_1681880 ?auto_1681897 ) ) ( not ( = ?auto_1681879 ?auto_1681881 ) ) ( not ( = ?auto_1681879 ?auto_1681882 ) ) ( not ( = ?auto_1681879 ?auto_1681883 ) ) ( not ( = ?auto_1681879 ?auto_1681884 ) ) ( not ( = ?auto_1681879 ?auto_1681885 ) ) ( not ( = ?auto_1681879 ?auto_1681886 ) ) ( not ( = ?auto_1681879 ?auto_1681887 ) ) ( not ( = ?auto_1681879 ?auto_1681888 ) ) ( not ( = ?auto_1681879 ?auto_1681889 ) ) ( not ( = ?auto_1681879 ?auto_1681890 ) ) ( not ( = ?auto_1681879 ?auto_1681891 ) ) ( not ( = ?auto_1681879 ?auto_1681897 ) ) ( not ( = ?auto_1681881 ?auto_1681882 ) ) ( not ( = ?auto_1681881 ?auto_1681883 ) ) ( not ( = ?auto_1681881 ?auto_1681884 ) ) ( not ( = ?auto_1681881 ?auto_1681885 ) ) ( not ( = ?auto_1681881 ?auto_1681886 ) ) ( not ( = ?auto_1681881 ?auto_1681887 ) ) ( not ( = ?auto_1681881 ?auto_1681888 ) ) ( not ( = ?auto_1681881 ?auto_1681889 ) ) ( not ( = ?auto_1681881 ?auto_1681890 ) ) ( not ( = ?auto_1681881 ?auto_1681891 ) ) ( not ( = ?auto_1681881 ?auto_1681897 ) ) ( not ( = ?auto_1681882 ?auto_1681883 ) ) ( not ( = ?auto_1681882 ?auto_1681884 ) ) ( not ( = ?auto_1681882 ?auto_1681885 ) ) ( not ( = ?auto_1681882 ?auto_1681886 ) ) ( not ( = ?auto_1681882 ?auto_1681887 ) ) ( not ( = ?auto_1681882 ?auto_1681888 ) ) ( not ( = ?auto_1681882 ?auto_1681889 ) ) ( not ( = ?auto_1681882 ?auto_1681890 ) ) ( not ( = ?auto_1681882 ?auto_1681891 ) ) ( not ( = ?auto_1681882 ?auto_1681897 ) ) ( not ( = ?auto_1681883 ?auto_1681884 ) ) ( not ( = ?auto_1681883 ?auto_1681885 ) ) ( not ( = ?auto_1681883 ?auto_1681886 ) ) ( not ( = ?auto_1681883 ?auto_1681887 ) ) ( not ( = ?auto_1681883 ?auto_1681888 ) ) ( not ( = ?auto_1681883 ?auto_1681889 ) ) ( not ( = ?auto_1681883 ?auto_1681890 ) ) ( not ( = ?auto_1681883 ?auto_1681891 ) ) ( not ( = ?auto_1681883 ?auto_1681897 ) ) ( not ( = ?auto_1681884 ?auto_1681885 ) ) ( not ( = ?auto_1681884 ?auto_1681886 ) ) ( not ( = ?auto_1681884 ?auto_1681887 ) ) ( not ( = ?auto_1681884 ?auto_1681888 ) ) ( not ( = ?auto_1681884 ?auto_1681889 ) ) ( not ( = ?auto_1681884 ?auto_1681890 ) ) ( not ( = ?auto_1681884 ?auto_1681891 ) ) ( not ( = ?auto_1681884 ?auto_1681897 ) ) ( not ( = ?auto_1681885 ?auto_1681886 ) ) ( not ( = ?auto_1681885 ?auto_1681887 ) ) ( not ( = ?auto_1681885 ?auto_1681888 ) ) ( not ( = ?auto_1681885 ?auto_1681889 ) ) ( not ( = ?auto_1681885 ?auto_1681890 ) ) ( not ( = ?auto_1681885 ?auto_1681891 ) ) ( not ( = ?auto_1681885 ?auto_1681897 ) ) ( not ( = ?auto_1681886 ?auto_1681887 ) ) ( not ( = ?auto_1681886 ?auto_1681888 ) ) ( not ( = ?auto_1681886 ?auto_1681889 ) ) ( not ( = ?auto_1681886 ?auto_1681890 ) ) ( not ( = ?auto_1681886 ?auto_1681891 ) ) ( not ( = ?auto_1681886 ?auto_1681897 ) ) ( not ( = ?auto_1681887 ?auto_1681888 ) ) ( not ( = ?auto_1681887 ?auto_1681889 ) ) ( not ( = ?auto_1681887 ?auto_1681890 ) ) ( not ( = ?auto_1681887 ?auto_1681891 ) ) ( not ( = ?auto_1681887 ?auto_1681897 ) ) ( not ( = ?auto_1681888 ?auto_1681889 ) ) ( not ( = ?auto_1681888 ?auto_1681890 ) ) ( not ( = ?auto_1681888 ?auto_1681891 ) ) ( not ( = ?auto_1681888 ?auto_1681897 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1681889 ?auto_1681890 ?auto_1681891 )
      ( MAKE-15CRATE-VERIFY ?auto_1681876 ?auto_1681877 ?auto_1681878 ?auto_1681880 ?auto_1681879 ?auto_1681881 ?auto_1681882 ?auto_1681883 ?auto_1681884 ?auto_1681885 ?auto_1681886 ?auto_1681887 ?auto_1681888 ?auto_1681889 ?auto_1681890 ?auto_1681891 ) )
  )

)

